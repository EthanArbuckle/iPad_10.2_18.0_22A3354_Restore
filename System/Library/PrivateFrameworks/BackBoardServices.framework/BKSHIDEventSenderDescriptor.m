@implementation BKSHIDEventSenderDescriptor

- (unint64_t)hash
{
  return -[BKSHIDEventDisplay hash](self->_associatedDisplay, "hash") ^ self->_hardwareType ^ self->_primaryPage ^ self->_primaryUsage ^ (self->_senderID + self->_authenticated) ^ 0x2861;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  _QWORD *v5;
  _DWORD *v6;
  BOOL v7;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v5 = v4;
    v6 = v5;
    v7 = self->_hardwareType == v5[1]
      && self->_authenticated == *((unsigned __int8 *)v5 + 24)
      && BSEqualObjects()
      && self->_primaryPage == v6[7]
      && self->_primaryUsage == v6[8]
      && self->_senderID == *((_QWORD *)v6 + 5);

  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_associatedDisplay, 0);
}

- (BOOL)matchesDescriptor:(id)a3 failureReason:(id *)a4
{
  id v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  int v10;
  int v11;
  void *v12;
  BKSHIDEventDisplay *v13;
  char v14;
  __CFString *v15;

  v6 = a3;
  v7 = v6;
  if (a4)
    *a4 = 0;
  v8 = objc_msgSend(v6, "senderID");
  if (v8 && v8 != self->_senderID)
  {
    if (!a4)
      goto LABEL_31;
    v14 = 0;
    v15 = CFSTR("senderID does not match");
    goto LABEL_30;
  }
  if (objc_msgSend(v7, "isAuthenticated") && !self->_authenticated)
  {
    if (!a4)
      goto LABEL_31;
    v14 = 0;
    v15 = CFSTR("not authenticated");
    goto LABEL_30;
  }
  v9 = objc_msgSend(v7, "hardwareType");
  if (v9 && v9 != self->_hardwareType)
  {
    if (!a4)
      goto LABEL_31;
    v14 = 0;
    v15 = CFSTR("hardware type does not match");
    goto LABEL_30;
  }
  v10 = objc_msgSend(v7, "primaryPage");
  v11 = objc_msgSend(v7, "primaryUsage");
  if (v10)
  {
    if (v10 == self->_primaryPage)
    {
      if (!v11 || v11 == self->_primaryUsage)
        goto LABEL_13;
      if (a4)
      {
        v14 = 0;
        v15 = CFSTR("usage does not match");
        goto LABEL_30;
      }
LABEL_31:
      v14 = 0;
      goto LABEL_32;
    }
    if (!a4)
      goto LABEL_31;
    v14 = 0;
    v15 = CFSTR("page does not match");
LABEL_30:
    *a4 = v15;
    goto LABEL_32;
  }
LABEL_13:
  objc_msgSend(v7, "associatedDisplay");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if (v12)
  {
    v13 = self->_associatedDisplay;
    v14 = -[BKSHIDEventDisplay isEqual:](v13, "isEqual:", v12);
    if ((v14 & 1) == 0 && a4)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("display does not match (%@ != %@)"), v13, v12);
      v14 = 0;
      *a4 = (id)objc_claimAutoreleasedReturnValue();
    }

  }
  else
  {
    v14 = 1;
  }

LABEL_32:
  return v14;
}

- (BKSHIDEventDisplay)associatedDisplay
{
  return self->_associatedDisplay;
}

- (int64_t)hardwareType
{
  return self->_hardwareType;
}

- (BOOL)isAuthenticated
{
  return self->_authenticated;
}

- (unint64_t)senderID
{
  return self->_senderID;
}

- (unsigned)primaryPage
{
  return self->_primaryPage;
}

- (unsigned)primaryUsage
{
  return self->_primaryUsage;
}

- (id)copyWithZone:(_NSZone *)a3
{
  return -[BKSHIDEventSenderDescriptor _initWithHardwareType:associatedDisplay:authenticated:primaryPage:primaryUsage:senderID:]([BKSHIDEventSenderDescriptor alloc], "_initWithHardwareType:associatedDisplay:authenticated:primaryPage:primaryUsage:senderID:", self->_hardwareType, self->_associatedDisplay, self->_authenticated, self->_primaryPage, self->_primaryUsage, self->_senderID);
}

- (id)propertyListEncoded
{
  id v3;
  void *v4;
  BKSHIDEventDisplay *associatedDisplay;
  const __CFString *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  v3 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  if (self->_hardwareType)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v4, CFSTR("hardwareType"));

  }
  if (self->_authenticated)
    objc_msgSend(v3, "setObject:forKey:", MEMORY[0x1E0C9AAB0], CFSTR("auth"));
  associatedDisplay = self->_associatedDisplay;
  if (associatedDisplay)
  {
    if (-[BKSHIDEventDisplay _isNullDisplay](associatedDisplay, "_isNullDisplay"))
    {
      v6 = CFSTR("<null>");
LABEL_10:
      objc_msgSend(v3, "setObject:forKey:", v6, CFSTR("display"));
      goto LABEL_12;
    }
    if (-[BKSHIDEventDisplay _isBuiltinDisplay](self->_associatedDisplay, "_isBuiltinDisplay"))
    {
      v6 = CFSTR("<builtin>");
      goto LABEL_10;
    }
    -[BKSHIDEventDisplay _hardwareIdentifier](self->_associatedDisplay, "_hardwareIdentifier");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v7, CFSTR("display"));

  }
LABEL_12:
  if (self->_primaryPage)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v8, CFSTR("page"));

  }
  if (self->_primaryUsage)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v9, CFSTR("usage"));

  }
  if (self->_senderID)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v10, CFSTR("senderID"));

  }
  return v3;
}

- (id)initFromPropertyList:(id)a3
{
  id v4;
  BKSHIDEventSenderDescriptor *v5;
  void *v6;
  uint64_t v7;
  id v8;
  void *v9;
  id v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  id v14;
  void *v15;
  id v16;
  char v17;
  void *v18;
  uint64_t v19;
  id v20;
  void *v21;
  id v22;
  unsigned int v23;
  void *v24;
  uint64_t v25;
  id v26;
  void *v27;
  id v28;
  unsigned int v29;
  void *v30;
  uint64_t v31;
  id v32;
  void *v33;
  id v34;
  uint64_t v35;
  void *v36;
  uint64_t v37;
  id v38;
  void *v39;
  id v40;
  uint64_t v41;
  BKSHIDEventDisplay *associatedDisplay;
  objc_super v44;

  v4 = a3;
  v44.receiver = self;
  v44.super_class = (Class)BKSHIDEventSenderDescriptor;
  v5 = -[BKSHIDEventSenderDescriptor init](&v44, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "objectForKey:", CFSTR("hardwareType"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_opt_class();
    v8 = v6;
    if (v7)
    {
      if ((objc_opt_isKindOfClass() & 1) != 0)
        v9 = v8;
      else
        v9 = 0;
    }
    else
    {
      v9 = 0;
    }
    v10 = v9;

    v11 = objc_msgSend(v10, "integerValue");
    v5->_hardwareType = v11;
    objc_msgSend(v4, "objectForKey:", CFSTR("auth"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_opt_class();
    v14 = v12;
    if (v13)
    {
      if ((objc_opt_isKindOfClass() & 1) != 0)
        v15 = v14;
      else
        v15 = 0;
    }
    else
    {
      v15 = 0;
    }
    v16 = v15;

    v17 = objc_msgSend(v16, "BOOLValue");
    v5->_authenticated = v17;
    objc_msgSend(v4, "objectForKey:", CFSTR("page"));
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = objc_opt_class();
    v20 = v18;
    if (v19)
    {
      if ((objc_opt_isKindOfClass() & 1) != 0)
        v21 = v20;
      else
        v21 = 0;
    }
    else
    {
      v21 = 0;
    }
    v22 = v21;

    v23 = objc_msgSend(v22, "unsignedIntValue");
    v5->_primaryPage = v23;
    objc_msgSend(v4, "objectForKey:", CFSTR("usage"));
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v25 = objc_opt_class();
    v26 = v24;
    if (v25)
    {
      if ((objc_opt_isKindOfClass() & 1) != 0)
        v27 = v26;
      else
        v27 = 0;
    }
    else
    {
      v27 = 0;
    }
    v28 = v27;

    v29 = objc_msgSend(v28, "unsignedIntValue");
    v5->_primaryUsage = v29;
    objc_msgSend(v4, "objectForKey:", CFSTR("senderID"));
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    v31 = objc_opt_class();
    v32 = v30;
    if (v31)
    {
      if ((objc_opt_isKindOfClass() & 1) != 0)
        v33 = v32;
      else
        v33 = 0;
    }
    else
    {
      v33 = 0;
    }
    v34 = v33;

    v35 = objc_msgSend(v34, "unsignedLongLongValue");
    v5->_senderID = v35;
    objc_msgSend(v4, "objectForKey:", CFSTR("display"));
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    v37 = objc_opt_class();
    v38 = v36;
    if (v37)
    {
      if ((objc_opt_isKindOfClass() & 1) != 0)
        v39 = v38;
      else
        v39 = 0;
    }
    else
    {
      v39 = 0;
    }
    v40 = v39;

    if (v40)
    {
      if (objc_msgSend(v40, "isEqual:", CFSTR("<null>")))
      {
        +[BKSHIDEventDisplay nullDisplay](BKSHIDEventDisplay, "nullDisplay");
        v41 = objc_claimAutoreleasedReturnValue();
      }
      else
      {
        if (objc_msgSend(v40, "isEqual:", CFSTR("<builtin>")))
          +[BKSHIDEventDisplay builtinDisplay](BKSHIDEventDisplay, "builtinDisplay");
        else
          +[BKSHIDEventDisplay displayWithHardwareIdentifier:](BKSHIDEventDisplay, "displayWithHardwareIdentifier:", v40);
        v41 = objc_claimAutoreleasedReturnValue();
      }
      associatedDisplay = v5->_associatedDisplay;
      v5->_associatedDisplay = (BKSHIDEventDisplay *)v41;

    }
  }

  return v5;
}

- (id)_initWithHardwareType:(int64_t)a3 associatedDisplay:(id)a4 authenticated:(BOOL)a5 primaryPage:(unsigned int)a6 primaryUsage:(unsigned int)a7 senderID:(unint64_t)a8
{
  id v16;
  uint64_t v17;
  uint64_t v18;
  BKSHIDEventSenderDescriptor *v19;
  BKSHIDEventSenderDescriptor *v20;
  void *v22;
  objc_class *v23;
  void *v24;
  objc_class *v25;
  void *v26;
  void *v27;
  void *v28;
  objc_class *v29;
  void *v30;
  void *v31;
  objc_super v32;
  uint8_t buf[4];
  void *v34;
  __int16 v35;
  void *v36;
  __int16 v37;
  BKSHIDEventSenderDescriptor *v38;
  __int16 v39;
  const __CFString *v40;
  __int16 v41;
  int v42;
  __int16 v43;
  void *v44;
  uint64_t v45;

  v45 = *MEMORY[0x1E0C80C00];
  v16 = a4;
  if (v16)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      v22 = (void *)MEMORY[0x1E0CB3940];
      v23 = (objc_class *)objc_msgSend(v16, "classForCoder");
      if (!v23)
        v23 = (objc_class *)objc_opt_class();
      NSStringFromClass(v23);
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      v25 = (objc_class *)objc_opt_class();
      NSStringFromClass(v25);
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "stringWithFormat:", CFSTR("Value for '%@' was of unexpected class %@. Expected %@."), CFSTR("display"), v24, v26);
      v27 = (void *)objc_claimAutoreleasedReturnValue();

      if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      {
        NSStringFromSelector(a2);
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        v29 = (objc_class *)objc_opt_class();
        NSStringFromClass(v29);
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138544642;
        v34 = v28;
        v35 = 2114;
        v36 = v30;
        v37 = 2048;
        v38 = self;
        v39 = 2114;
        v40 = CFSTR("BKSHIDEventSenderDescriptor.m");
        v41 = 1024;
        v42 = 87;
        v43 = 2114;
        v44 = v27;
        _os_log_error_impl(&dword_18A0F0000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", buf, 0x3Au);

      }
      objc_msgSend(objc_retainAutorelease(v27), "UTF8String");
      _bs_set_crash_log_message();
      __break(0);
      JUMPOUT(0x18A0FD9B0);
    }
  }

  v17 = objc_opt_class();
  if (v17 != objc_opt_class())
  {
    v18 = objc_opt_class();
    if (v18 != objc_opt_class())
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v31, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("BKSHIDEventSenderDescriptor.m"), 88, CFSTR("BKSHIDEventSenderDescriptor cannot be subclassed"));

    }
  }
  v32.receiver = self;
  v32.super_class = (Class)BKSHIDEventSenderDescriptor;
  v19 = -[BKSHIDEventSenderDescriptor init](&v32, sel_init);
  v20 = v19;
  if (v19)
  {
    v19->_hardwareType = a3;
    objc_storeStrong((id *)&v19->_associatedDisplay, a4);
    v20->_authenticated = a5;
    v20->_primaryPage = a6;
    v20->_primaryUsage = a7;
    v20->_senderID = a8;
  }

  return v20;
}

- (NSString)description
{
  return (NSString *)objc_msgSend(MEMORY[0x1E0D01750], "descriptionForRootObject:", self);
}

+ (id)anyBuiltinTouchscreenDigitizer
{
  if (anyBuiltinTouchscreenDigitizer_onceToken != -1)
    dispatch_once(&anyBuiltinTouchscreenDigitizer_onceToken, &__block_literal_global_43);
  return (id)anyBuiltinTouchscreenDigitizer_descriptor;
}

- (void)appendDescriptionToFormatter:(id)a3
{
  unint64_t hardwareType;
  void *v5;
  unint64_t senderID;
  id v7;
  uint64_t primaryPage;
  void *v9;
  id v10;
  uint64_t primaryUsage;
  id v12;
  id v13;
  id v14;
  id v15;

  v15 = a3;
  hardwareType = self->_hardwareType;
  if (hardwareType)
  {
    NSStringFromBKSHIDEventHardwareType(hardwareType);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "appendString:withName:", v5, CFSTR("hardwareType"));

  }
  senderID = self->_senderID;
  if (senderID)
    v7 = (id)objc_msgSend(v15, "appendUInt64:withName:format:", senderID, CFSTR("senderID"), 1);
  primaryPage = self->_primaryPage;
  v9 = v15;
  if ((_DWORD)primaryPage)
  {
    v10 = (id)objc_msgSend(v15, "appendUnsignedInteger:withName:format:", primaryPage, CFSTR("primaryPage"), 1);
    v9 = v15;
  }
  primaryUsage = self->_primaryUsage;
  if ((_DWORD)primaryUsage)
  {
    v12 = (id)objc_msgSend(v15, "appendUnsignedInteger:withName:format:", primaryUsage, CFSTR("primaryUsage"), 1);
    v9 = v15;
  }
  v13 = (id)objc_msgSend(v9, "appendObject:withName:skipIfNil:", self->_associatedDisplay, CFSTR("display"), 1);
  v14 = (id)objc_msgSend(v15, "appendBool:withName:ifEqualTo:", self->_authenticated, CFSTR("authenticated"), 1);

}

- (BKSHIDEventSenderDescriptor)init
{
  void *v4;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("BKSHIDEventSenderDescriptor.m"), 82, CFSTR("-init is not allowed on BKSHIDEventSenderDescriptor"));

  return 0;
}

- (id)mutableCopyWithZone:(_NSZone *)a3
{
  return -[BKSHIDEventSenderDescriptor _initWithHardwareType:associatedDisplay:authenticated:primaryPage:primaryUsage:senderID:]([BKSMutableHIDEventSenderDescriptor alloc], "_initWithHardwareType:associatedDisplay:authenticated:primaryPage:primaryUsage:senderID:", self->_hardwareType, self->_associatedDisplay, self->_authenticated, self->_primaryPage, self->_primaryUsage, self->_senderID);
}

- (id)initForProtobufDecoding
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)BKSHIDEventSenderDescriptor;
  return -[BKSHIDEventSenderDescriptor init](&v3, sel_init);
}

- (void)encodeWithCoder:(id)a3
{
  int64_t hardwareType;
  id v5;

  hardwareType = self->_hardwareType;
  v5 = a3;
  objc_msgSend(v5, "encodeInteger:forKey:", hardwareType, CFSTR("hardwareType"));
  objc_msgSend(v5, "encodeBool:forKey:", self->_authenticated, CFSTR("authenticated"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_associatedDisplay, CFSTR("display"));
  objc_msgSend(v5, "encodeInteger:forKey:", self->_primaryPage, CFSTR("primaryPage"));
  objc_msgSend(v5, "encodeInteger:forKey:", self->_primaryUsage, CFSTR("primaryUsage"));
  objc_msgSend(v5, "encodeInt64:forKey:", self->_senderID, CFSTR("senderID"));

}

- (BKSHIDEventSenderDescriptor)initWithCoder:(id)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  BKSHIDEventSenderDescriptor *v11;

  v4 = a3;
  v5 = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("hardwareType"));
  v6 = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("authenticated"));
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("display"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("primaryPage"));
  v9 = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("primaryUsage"));
  v10 = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("senderID"));

  v11 = -[BKSHIDEventSenderDescriptor _initWithHardwareType:associatedDisplay:authenticated:primaryPage:primaryUsage:senderID:](self, "_initWithHardwareType:associatedDisplay:authenticated:primaryPage:primaryUsage:senderID:", v5, v7, v6, v8, v9, v10);
  return v11;
}

+ (id)build:(id)a3
{
  void (**v3)(id, BKSMutableHIDEventSenderDescriptor *);
  BKSMutableHIDEventSenderDescriptor *v4;
  void *v5;

  v3 = (void (**)(id, BKSMutableHIDEventSenderDescriptor *))a3;
  v4 = objc_alloc_init(BKSMutableHIDEventSenderDescriptor);
  v3[2](v3, v4);

  v5 = (void *)-[BKSMutableHIDEventSenderDescriptor copy](v4, "copy");
  return v5;
}

+ (id)wildcard
{
  if (wildcard_onceToken != -1)
    dispatch_once(&wildcard_onceToken, &__block_literal_global_10074);
  return (id)wildcard_wildcard;
}

+ (id)anyDigitizer
{
  if (anyDigitizer_onceToken != -1)
    dispatch_once(&anyDigitizer_onceToken, &__block_literal_global_40);
  return (id)anyDigitizer_descriptor;
}

+ (id)stylusOpaqueTouchDigitizer
{
  if (stylusOpaqueTouchDigitizer_onceToken != -1)
    dispatch_once(&stylusOpaqueTouchDigitizer_onceToken, &__block_literal_global_45_10072);
  return (id)stylusOpaqueTouchDigitizer_descriptor;
}

+ (id)protobufSchema
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __45__BKSHIDEventSenderDescriptor_protobufSchema__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (protobufSchema_onceToken_10062 != -1)
    dispatch_once(&protobufSchema_onceToken_10062, block);
  return (id)protobufSchema_schema_10063;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

void __45__BKSHIDEventSenderDescriptor_protobufSchema__block_invoke(uint64_t a1)
{
  uint64_t v1;
  void *v2;

  objc_msgSend(MEMORY[0x1E0D01838], "buildSchemaForClass:builder:", *(_QWORD *)(a1 + 32), &__block_literal_global_72_10065);
  v1 = objc_claimAutoreleasedReturnValue();
  v2 = (void *)protobufSchema_schema_10063;
  protobufSchema_schema_10063 = v1;

}

void __45__BKSHIDEventSenderDescriptor_protobufSchema__block_invoke_2(uint64_t a1, void *a2)
{
  id v2;

  v2 = a2;
  objc_msgSend(v2, "addField:", "_hardwareType");
  objc_msgSend(v2, "addField:", "_authenticated");
  objc_msgSend(v2, "addField:", "_associatedDisplay");
  objc_msgSend(v2, "addField:", "_primaryPage");
  objc_msgSend(v2, "addField:", "_primaryUsage");
  objc_msgSend(v2, "addField:", "_senderID");

}

void __57__BKSHIDEventSenderDescriptor_stylusOpaqueTouchDigitizer__block_invoke()
{
  uint64_t v0;
  void *v1;

  +[BKSHIDEventSenderDescriptor build:](BKSHIDEventSenderDescriptor, "build:", &__block_literal_global_46);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)stylusOpaqueTouchDigitizer_descriptor;
  stylusOpaqueTouchDigitizer_descriptor = v0;

}

uint64_t __57__BKSHIDEventSenderDescriptor_stylusOpaqueTouchDigitizer__block_invoke_2(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "setPrimaryPage:primaryUsage:", 65376, 4096);
}

void __61__BKSHIDEventSenderDescriptor_anyBuiltinTouchscreenDigitizer__block_invoke()
{
  uint64_t v0;
  void *v1;

  +[BKSHIDEventSenderDescriptor build:](BKSHIDEventSenderDescriptor, "build:", &__block_literal_global_44);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)anyBuiltinTouchscreenDigitizer_descriptor;
  anyBuiltinTouchscreenDigitizer_descriptor = v0;

}

void __61__BKSHIDEventSenderDescriptor_anyBuiltinTouchscreenDigitizer__block_invoke_2(uint64_t a1, void *a2)
{
  id v2;
  id v3;

  v2 = a2;
  objc_msgSend(v2, "setPrimaryPage:primaryUsage:", 13, 0);
  +[BKSHIDEventDisplay builtinDisplay](BKSHIDEventDisplay, "builtinDisplay");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setAssociatedDisplay:", v3);

}

void __43__BKSHIDEventSenderDescriptor_anyDigitizer__block_invoke()
{
  uint64_t v0;
  void *v1;

  +[BKSHIDEventSenderDescriptor build:](BKSHIDEventSenderDescriptor, "build:", &__block_literal_global_42);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)anyDigitizer_descriptor;
  anyDigitizer_descriptor = v0;

}

uint64_t __43__BKSHIDEventSenderDescriptor_anyDigitizer__block_invoke_2(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "setPrimaryPage:primaryUsage:", 13, 0);
}

void __39__BKSHIDEventSenderDescriptor_wildcard__block_invoke()
{
  BKSMutableHIDEventSenderDescriptor *v0;
  void *v1;

  v0 = objc_alloc_init(BKSMutableHIDEventSenderDescriptor);
  v1 = (void *)wildcard_wildcard;
  wildcard_wildcard = (uint64_t)v0;

}

@end
