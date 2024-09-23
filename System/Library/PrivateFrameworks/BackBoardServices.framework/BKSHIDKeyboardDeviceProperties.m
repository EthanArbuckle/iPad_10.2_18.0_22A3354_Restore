@implementation BKSHIDKeyboardDeviceProperties

- (BKSHIDKeyboardDeviceProperties)init
{
  void *v4;
  void *v5;
  objc_class *v6;
  void *v7;
  BKSHIDKeyboardDeviceProperties *result;
  int v9;
  void *v10;
  __int16 v11;
  void *v12;
  __int16 v13;
  BKSHIDKeyboardDeviceProperties *v14;
  __int16 v15;
  const __CFString *v16;
  __int16 v17;
  int v18;
  __int16 v19;
  void *v20;

  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("cannot directly allocate BKSHIDKeyboardDeviceProperties"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
  {
    NSStringFromSelector(a2);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = (objc_class *)objc_opt_class();
    NSStringFromClass(v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = 138544642;
    v10 = v5;
    v11 = 2114;
    v12 = v7;
    v13 = 2048;
    v14 = self;
    v15 = 2114;
    v16 = CFSTR("BKSHIDKeyboardDeviceProperties.m");
    v17 = 1024;
    v18 = 40;
    v19 = 2114;
    v20 = v4;
    _os_log_error_impl(&dword_18A0F0000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", (uint8_t *)&v9, 0x3Au);

  }
  objc_msgSend(objc_retainAutorelease(v4), "UTF8String");
  result = (BKSHIDKeyboardDeviceProperties *)_bs_set_crash_log_message();
  __break(0);
  return result;
}

- (BKSHIDKeyboardDeviceProperties)initWithCoder:(id)a3
{
  id v3;
  BKSHIDKeyboardDeviceProperties *v4;
  uint64_t v5;
  NSString *transport;
  uint64_t v7;
  NSString *language;
  uint64_t v9;
  NSString *layout;
  uint64_t v11;
  NSString *exclusivityIdentifier;
  char v13;
  objc_super v15;

  v15.receiver = self;
  v15.super_class = (Class)BKSHIDKeyboardDeviceProperties;
  v3 = a3;
  v4 = -[BKSHIDKeyboardDeviceProperties init](&v15, sel_init);
  v4->_senderID = objc_msgSend(v3, "decodeInt64ForKey:", CFSTR("senderID"), v15.receiver, v15.super_class);
  objc_msgSend(v3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("transport"));
  v5 = objc_claimAutoreleasedReturnValue();
  transport = v4->_transport;
  v4->_transport = (NSString *)v5;

  objc_msgSend(v3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("language"));
  v7 = objc_claimAutoreleasedReturnValue();
  language = v4->_language;
  v4->_language = (NSString *)v7;

  objc_msgSend(v3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("layout"));
  v9 = objc_claimAutoreleasedReturnValue();
  layout = v4->_layout;
  v4->_layout = (NSString *)v9;

  objc_msgSend(v3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("exclusivityIdentifier"));
  v11 = objc_claimAutoreleasedReturnValue();
  exclusivityIdentifier = v4->_exclusivityIdentifier;
  v4->_exclusivityIdentifier = (NSString *)v11;

  v4->_countryCode = objc_msgSend(v3, "decodeIntegerForKey:", CFSTR("countryCode"));
  v4->_standardType = objc_msgSend(v3, "decodeIntegerForKey:", CFSTR("standardType"));
  v4->_subinterfaceID = objc_msgSend(v3, "decodeIntegerForKey:", CFSTR("subinterfaceID"));
  v4->_capsLockKeyHasLanguageSwitchLabel = objc_msgSend(v3, "decodeBoolForKey:", CFSTR("capsLockKeyHasLanguageSwitchLabel"));
  v13 = objc_msgSend(v3, "decodeBoolForKey:", CFSTR("globeKeyLabelHasGlobeSymbol"));

  v4->_globeKeyLabelHasGlobeSymbol = v13;
  return v4;
}

- (void)encodeWithCoder:(id)a3
{
  NSString *transport;
  NSString *language;
  NSString *layout;
  void *v7;
  NSString *exclusivityIdentifier;
  id v9;

  v9 = a3;
  objc_msgSend(v9, "encodeInt64:forKey:", self->_senderID, CFSTR("senderID"));
  transport = self->_transport;
  if (transport)
    objc_msgSend(v9, "encodeObject:forKey:", transport, CFSTR("transport"));
  language = self->_language;
  if (language)
    objc_msgSend(v9, "encodeObject:forKey:", language, CFSTR("language"));
  layout = self->_layout;
  v7 = v9;
  if (layout)
  {
    objc_msgSend(v9, "encodeObject:forKey:", layout, CFSTR("layout"));
    v7 = v9;
  }
  exclusivityIdentifier = self->_exclusivityIdentifier;
  if (exclusivityIdentifier)
  {
    objc_msgSend(v9, "encodeObject:forKey:", exclusivityIdentifier, CFSTR("exclusivityIdentifier"));
    v7 = v9;
  }
  objc_msgSend(v7, "encodeInteger:forKey:", self->_countryCode, CFSTR("countryCode"));
  objc_msgSend(v9, "encodeInteger:forKey:", self->_standardType, CFSTR("standardType"));
  objc_msgSend(v9, "encodeInteger:forKey:", self->_subinterfaceID, CFSTR("subinterfaceID"));
  objc_msgSend(v9, "encodeBool:forKey:", self->_capsLockKeyHasLanguageSwitchLabel, CFSTR("capsLockKeyHasLanguageSwitchLabel"));
  objc_msgSend(v9, "encodeBool:forKey:", self->_globeKeyLabelHasGlobeSymbol, CFSTR("globeKeyLabelHasGlobeSymbol"));

}

- (unint64_t)hash
{
  unint64_t senderID;
  NSUInteger v4;
  NSUInteger v5;
  NSUInteger v6;
  NSUInteger v7;
  void *v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  void *v12;
  unint64_t v13;

  senderID = self->_senderID;
  v4 = -[NSString hash](self->_transport, "hash") ^ senderID;
  v5 = -[NSString hash](self->_language, "hash");
  v6 = v4 ^ v5 ^ -[NSString hash](self->_layout, "hash");
  v7 = v6 ^ -[NSString hash](self->_exclusivityIdentifier, "hash");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedChar:", self->_countryCode);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "hash");

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", self->_standardType);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = v7 ^ v9 ^ objc_msgSend(v10, "hash");

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", self->_subinterfaceID);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = v11 ^ objc_msgSend(v12, "hash");

  return v13;
}

- (BOOL)isEqual:(id)a3
{
  _QWORD *v4;
  BOOL v5;

  v4 = a3;
  objc_opt_class();
  v5 = (objc_opt_isKindOfClass() & 1) != 0
    && v4[1] == self->_senderID
    && BSEqualObjects()
    && BSEqualObjects()
    && BSEqualObjects()
    && *((unsigned __int8 *)v4 + 64) == self->_countryCode
    && *((_DWORD *)v4 + 12) == self->_standardType
    && v4[7] == self->_subinterfaceID
    && *((unsigned __int8 *)v4 + 65) == self->_capsLockKeyHasLanguageSwitchLabel
    && *((unsigned __int8 *)v4 + 66) == self->_globeKeyLabelHasGlobeSymbol;

  return v5;
}

- (id)copyWithZone:(_NSZone *)a3
{
  return -[BKSHIDKeyboardDeviceProperties _initCopyFromOriginal:]([BKSHIDKeyboardDeviceProperties alloc], self);
}

- (id)mutableCopyWithZone:(_NSZone *)a3
{
  return -[BKSHIDKeyboardDeviceProperties _initCopyFromOriginal:]([BKSMutableHIDKeyboardDeviceProperties alloc], self);
}

- (NSString)description
{
  return (NSString *)objc_msgSend(MEMORY[0x1E0D01750], "descriptionForRootObject:", self);
}

- (void)appendDescriptionToFormatter:(id)a3
{
  id v4;
  id v5;
  id v6;
  id v7;
  NSString *exclusivityIdentifier;
  id v9;
  id v10;
  id v11;
  id v12;
  id v13;
  id v14;

  v14 = a3;
  v4 = (id)objc_msgSend(v14, "appendUInt64:withName:format:", self->_senderID, CFSTR("senderID"), 1);
  v5 = (id)objc_msgSend(v14, "appendObject:withName:", self->_transport, CFSTR("transport"));
  v6 = (id)objc_msgSend(v14, "appendObject:withName:", self->_language, CFSTR("language"));
  v7 = (id)objc_msgSend(v14, "appendObject:withName:", self->_layout, CFSTR("layout"));
  exclusivityIdentifier = self->_exclusivityIdentifier;
  if (exclusivityIdentifier)
    objc_msgSend(v14, "appendString:withName:", exclusivityIdentifier, CFSTR("exclusivityIdentifier"));
  v9 = (id)objc_msgSend(v14, "appendInteger:withName:", self->_countryCode, CFSTR("countryCode"));
  v10 = (id)objc_msgSend(v14, "appendInteger:withName:", self->_standardType, CFSTR("standardType"));
  v11 = (id)objc_msgSend(v14, "appendInteger:withName:", self->_subinterfaceID, CFSTR("subinterfaceID"));
  v12 = (id)objc_msgSend(v14, "appendBool:withName:", self->_capsLockKeyHasLanguageSwitchLabel, CFSTR("capsLockKeyHasLanguageSwitchLabel"));
  v13 = (id)objc_msgSend(v14, "appendBool:withName:", self->_globeKeyLabelHasGlobeSymbol, CFSTR("globeKeyLabelHasGlobeSymbol"));

}

- (unint64_t)senderID
{
  return self->_senderID;
}

- (NSString)transport
{
  return self->_transport;
}

- (NSString)language
{
  return self->_language;
}

- (NSString)layout
{
  return self->_layout;
}

- (NSString)exclusivityIdentifier
{
  return self->_exclusivityIdentifier;
}

- (unsigned)countryCode
{
  return self->_countryCode;
}

- (unsigned)standardType
{
  return self->_standardType;
}

- (int64_t)subinterfaceID
{
  return self->_subinterfaceID;
}

- (BOOL)capsLockKeyHasLanguageSwitchLabel
{
  return self->_capsLockKeyHasLanguageSwitchLabel;
}

- (BOOL)globeKeyLabelHasGlobeSymbol
{
  return self->_globeKeyLabelHasGlobeSymbol;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_exclusivityIdentifier, 0);
  objc_storeStrong((id *)&self->_layout, 0);
  objc_storeStrong((id *)&self->_language, 0);
  objc_storeStrong((id *)&self->_transport, 0);
}

- (id)_init
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  void *v4;
  void *v5;
  objc_class *v6;
  void *v7;
  objc_super v8;
  uint8_t buf[4];
  void *v10;
  __int16 v11;
  void *v12;
  __int16 v13;
  void *v14;
  __int16 v15;
  const __CFString *v16;
  __int16 v17;
  int v18;
  __int16 v19;
  void *v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  if (result)
  {
    v1 = result;
    v2 = objc_opt_class();
    if (v2 != objc_opt_class())
    {
      v3 = objc_opt_class();
      if (v3 != objc_opt_class())
      {
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("BKSHIDKeyboardDeviceProperties cannot be subclassed"));
        v4 = (void *)objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
        {
          NSStringFromSelector(sel__init);
          v5 = (void *)objc_claimAutoreleasedReturnValue();
          v6 = (objc_class *)objc_opt_class();
          NSStringFromClass(v6);
          v7 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138544642;
          v10 = v5;
          v11 = 2114;
          v12 = v7;
          v13 = 2048;
          v14 = v1;
          v15 = 2114;
          v16 = CFSTR("BKSHIDKeyboardDeviceProperties.m");
          v17 = 1024;
          v18 = 51;
          v19 = 2114;
          v20 = v4;
          _os_log_error_impl(&dword_18A0F0000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", buf, 0x3Au);

        }
        objc_msgSend(objc_retainAutorelease(v4), "UTF8String");
        _bs_set_crash_log_message();
        __break(0);
        JUMPOUT(0x18A13B594);
      }
    }
    v8.receiver = v1;
    v8.super_class = (Class)BKSHIDKeyboardDeviceProperties;
    return objc_msgSendSuper2(&v8, sel_init);
  }
  return result;
}

- (id)_initCopyFromOriginal:(id)a1
{
  id v3;
  _QWORD *v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  void *v12;
  objc_super v14;

  v3 = a2;
  if (a1)
  {
    v14.receiver = a1;
    v14.super_class = (Class)BKSHIDKeyboardDeviceProperties;
    v4 = objc_msgSendSuper2(&v14, sel_init);
    a1 = v4;
    if (v4)
    {
      v4[1] = *((_QWORD *)v3 + 1);
      v5 = objc_msgSend(*((id *)v3 + 2), "copy");
      v6 = (void *)*((_QWORD *)a1 + 2);
      *((_QWORD *)a1 + 2) = v5;

      v7 = objc_msgSend(*((id *)v3 + 3), "copy");
      v8 = (void *)*((_QWORD *)a1 + 3);
      *((_QWORD *)a1 + 3) = v7;

      v9 = objc_msgSend(*((id *)v3 + 4), "copy");
      v10 = (void *)*((_QWORD *)a1 + 4);
      *((_QWORD *)a1 + 4) = v9;

      v11 = objc_msgSend(*((id *)v3 + 5), "copy");
      v12 = (void *)*((_QWORD *)a1 + 5);
      *((_QWORD *)a1 + 5) = v11;

      *((_BYTE *)a1 + 64) = *((_BYTE *)v3 + 64);
      *((_DWORD *)a1 + 12) = *((_DWORD *)v3 + 12);
      *((_QWORD *)a1 + 7) = *((_QWORD *)v3 + 7);
      *((_BYTE *)a1 + 65) = *((_BYTE *)v3 + 65);
      *((_BYTE *)a1 + 66) = *((_BYTE *)v3 + 66);
    }
  }

  return a1;
}

+ (id)build:(id)a3
{
  void (**v3)(id, id);
  id v4;
  void *v5;

  v3 = (void (**)(id, id))a3;
  v4 = -[BKSHIDKeyboardDeviceProperties _init]([BKSMutableHIDKeyboardDeviceProperties alloc]);
  v3[2](v3, v4);

  v5 = (void *)objc_msgSend(v4, "copy");
  return v5;
}

+ (BKSHIDKeyboardDeviceProperties)new
{
  void *v4;
  void *v5;
  objc_class *v6;
  void *v7;
  BKSHIDKeyboardDeviceProperties *result;
  int v9;
  void *v10;
  __int16 v11;
  void *v12;
  __int16 v13;
  id v14;
  __int16 v15;
  const __CFString *v16;
  __int16 v17;
  int v18;
  __int16 v19;
  void *v20;

  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("cannot directly allocate BKSHIDKeyboardDeviceProperties"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
  {
    NSStringFromSelector(a2);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = (objc_class *)objc_opt_class();
    NSStringFromClass(v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = 138544642;
    v10 = v5;
    v11 = 2114;
    v12 = v7;
    v13 = 2048;
    v14 = a1;
    v15 = 2114;
    v16 = CFSTR("BKSHIDKeyboardDeviceProperties.m");
    v17 = 1024;
    v18 = 45;
    v19 = 2114;
    v20 = v4;
    _os_log_error_impl(&dword_18A0F0000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", (uint8_t *)&v9, 0x3Au);

  }
  objc_msgSend(objc_retainAutorelease(v4), "UTF8String");
  result = (BKSHIDKeyboardDeviceProperties *)_bs_set_crash_log_message();
  __break(0);
  return result;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (id)protobufSchema
{
  return (id)objc_msgSend(MEMORY[0x1E0D01838], "buildSchemaForClass:builder:", a1, &__block_literal_global_7805);
}

void __48__BKSHIDKeyboardDeviceProperties_protobufSchema__block_invoke(uint64_t a1, void *a2)
{
  id v2;

  v2 = a2;
  objc_msgSend(v2, "addField:", "_senderID");
  objc_msgSend(v2, "addField:", "_transport");
  objc_msgSend(v2, "addField:", "_language");
  objc_msgSend(v2, "addField:", "_layout");
  objc_msgSend(v2, "addField:", "_exclusivityIdentifier");
  objc_msgSend(v2, "addField:", "_countryCode");
  objc_msgSend(v2, "addField:", "_standardType");
  objc_msgSend(v2, "addField:", "_subinterfaceID");
  objc_msgSend(v2, "addField:", "_capsLockKeyHasLanguageSwitchLabel");
  objc_msgSend(v2, "addField:", "_globeKeyLabelHasGlobeSymbol");

}

@end
