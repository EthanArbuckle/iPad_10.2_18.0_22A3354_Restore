@implementation BKSHIDEventDeferringEnvironment

- (unint64_t)hash
{
  return -[NSString hash](self->_identifier, "hash");
}

- (NSString)description
{
  return self->_identifier;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (BOOL)isEqual:(id)a3
{
  BKSHIDEventDeferringEnvironment *v4;
  uint64_t v5;
  char v6;

  v4 = (BKSHIDEventDeferringEnvironment *)a3;
  if (self == v4)
  {
    v6 = 1;
  }
  else
  {
    v5 = objc_opt_class();
    if (v5 == objc_opt_class())
      v6 = -[NSString isEqual:](self->_identifier, "isEqual:", v4->_identifier);
    else
      v6 = 0;
  }

  return v6;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_identifier, 0);
}

- (void)encodeWithCoder:(id)a3
{
  objc_msgSend(a3, "encodeObject:forKey:", self->_identifier, CFSTR("ident"));
}

- (BKSHIDEventDeferringEnvironment)initWithCoder:(id)a3
{
  id v4;
  BKSHIDEventDeferringEnvironment *v5;
  uint64_t v6;
  NSString *identifier;
  BKSHIDEventDeferringEnvironment *v8;
  objc_super v10;

  v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)BKSHIDEventDeferringEnvironment;
  v5 = -[BKSHIDEventDeferringEnvironment init](&v10, sel_init);
  if (!v5
    || (objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("ident")),
        v6 = objc_claimAutoreleasedReturnValue(),
        identifier = v5->_identifier,
        v5->_identifier = (NSString *)v6,
        identifier,
        -[BKSHIDEventDeferringEnvironment _uniqueEnvironmentForIdentifier]((id *)&v5->super.isa),
        (v8 = (BKSHIDEventDeferringEnvironment *)objc_claimAutoreleasedReturnValue()) == 0))
  {
    v8 = v5;
  }

  return v8;
}

- (id)_uniqueEnvironmentForIdentifier
{
  id *v1;

  if (a1)
  {
    v1 = a1;
    if (objc_msgSend(a1[1], "isEqual:", CFSTR("system")))
    {
      +[BKSHIDEventDeferringEnvironment systemEnvironment](BKSHIDEventDeferringEnvironment, "systemEnvironment");
      a1 = (id *)objc_claimAutoreleasedReturnValue();
    }
    else if (objc_msgSend(v1[1], "isEqual:", CFSTR("keyboardFocus")))
    {
      +[BKSHIDEventDeferringEnvironment keyboardFocusEnvironment](BKSHIDEventDeferringEnvironment, "keyboardFocusEnvironment");
      a1 = (id *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      a1 = 0;
    }
  }
  return a1;
}

+ (id)keyboardFocusEnvironment
{
  if (keyboardFocusEnvironment_onceToken != -1)
    dispatch_once(&keyboardFocusEnvironment_onceToken, &__block_literal_global_13);
  return (id)keyboardFocusEnvironment___focusEnvironment;
}

+ (id)systemEnvironment
{
  if (systemEnvironment_onceToken != -1)
    dispatch_once(&systemEnvironment_onceToken, &__block_literal_global_209);
  return (id)systemEnvironment___systemEnvironment;
}

- (void)encodeWithXPCDictionary:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(CFSTR("ident"), "UTF8String");
  BSSerializeStringToXPCDictionaryWithKey();

}

- (BKSHIDEventDeferringEnvironment)initWithXPCDictionary:(id)a3
{
  id v3;
  BKSHIDEventDeferringEnvironment *v4;
  uint64_t v5;
  NSString *identifier;
  uint64_t v7;
  void *v8;
  void *v9;
  BKSHIDEventDeferringEnvironment *v10;
  objc_super v12;

  v12.receiver = self;
  v12.super_class = (Class)BKSHIDEventDeferringEnvironment;
  v3 = a3;
  v4 = -[BKSHIDEventDeferringEnvironment init](&v12, sel_init);
  objc_msgSend(CFSTR("ident"), "UTF8String", v12.receiver, v12.super_class);
  BSDeserializeStringFromXPCDictionaryWithKey();
  v5 = objc_claimAutoreleasedReturnValue();

  identifier = v4->_identifier;
  v4->_identifier = (NSString *)v5;

  -[BKSHIDEventDeferringEnvironment _uniqueEnvironmentForIdentifier]((id *)&v4->super.isa);
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = (void *)v7;
  if (v7)
    v9 = (void *)v7;
  else
    v9 = v4;
  v10 = v9;

  return v10;
}

- (id)initForProtobufDecoding
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)BKSHIDEventDeferringEnvironment;
  return -[BKSHIDEventDeferringEnvironment init](&v3, sel_init);
}

+ (id)protobufSchema
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __49__BKSHIDEventDeferringEnvironment_protobufSchema__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (protobufSchema_onceToken != -1)
    dispatch_once(&protobufSchema_onceToken, block);
  return (id)protobufSchema_schema;
}

+ (id)environmentWithIdentifier:(id)a3
{
  id v5;
  _QWORD *v6;
  void *v8;
  void *v9;
  objc_class *v10;
  void *v11;
  void *v12;
  void *v13;
  objc_class *v14;
  void *v15;
  int v16;
  void *v17;
  __int16 v18;
  void *v19;
  __int16 v20;
  id v21;
  __int16 v22;
  const __CFString *v23;
  __int16 v24;
  int v25;
  __int16 v26;
  void *v27;
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  if (objc_msgSend(v5, "isEqualToString:", CFSTR("system")))
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("use +systemEnvironment"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    {
      NSStringFromSelector(a2);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = (objc_class *)objc_opt_class();
      NSStringFromClass(v10);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = 138544642;
      v17 = v9;
      v18 = 2114;
      v19 = v11;
      v20 = 2048;
      v21 = a1;
      v22 = 2114;
      v23 = CFSTR("BKSHIDEventDeferringEnvironment.m");
      v24 = 1024;
      v25 = 61;
      v26 = 2114;
      v27 = v8;
      _os_log_error_impl(&dword_18A0F0000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", (uint8_t *)&v16, 0x3Au);

    }
    objc_msgSend(objc_retainAutorelease(v8), "UTF8String");
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x18A100ED0);
  }
  if (objc_msgSend(v5, "isEqualToString:", CFSTR("keyboardFocus")))
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("use +keyboardFocusEnvironment"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    {
      NSStringFromSelector(a2);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = (objc_class *)objc_opt_class();
      NSStringFromClass(v14);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = 138544642;
      v17 = v13;
      v18 = 2114;
      v19 = v15;
      v20 = 2048;
      v21 = a1;
      v22 = 2114;
      v23 = CFSTR("BKSHIDEventDeferringEnvironment.m");
      v24 = 1024;
      v25 = 62;
      v26 = 2114;
      v27 = v12;
      _os_log_error_impl(&dword_18A0F0000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", (uint8_t *)&v16, 0x3Au);

    }
    objc_msgSend(objc_retainAutorelease(v12), "UTF8String");
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x18A100FBCLL);
  }
  v6 = -[BKSHIDEventDeferringEnvironment _initWithIdentifier:]([BKSHIDEventDeferringEnvironment alloc], v5);

  return v6;
}

void __59__BKSHIDEventDeferringEnvironment_keyboardFocusEnvironment__block_invoke()
{
  _QWORD *v0;
  void *v1;

  v0 = -[BKSHIDEventDeferringEnvironment _initWithIdentifier:]([BKSHIDEventDeferringEnvironment alloc], CFSTR("keyboardFocus"));
  v1 = (void *)keyboardFocusEnvironment___focusEnvironment;
  keyboardFocusEnvironment___focusEnvironment = (uint64_t)v0;

}

- (_QWORD)_initWithIdentifier:(_QWORD *)a1
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  void *v8;
  void *v9;
  objc_class *v10;
  void *v11;
  objc_super v12;
  uint8_t buf[4];
  void *v14;
  __int16 v15;
  void *v16;
  __int16 v17;
  _QWORD *v18;
  __int16 v19;
  const __CFString *v20;
  __int16 v21;
  int v22;
  __int16 v23;
  void *v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  if (a1)
  {
    v4 = objc_opt_class();
    if (v4 != objc_opt_class())
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("BKSHIDEventDeferringEnvironment is not subclassable"));
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      {
        NSStringFromSelector(sel__initWithIdentifier_);
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        v10 = (objc_class *)objc_opt_class();
        NSStringFromClass(v10);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138544642;
        v14 = v9;
        v15 = 2114;
        v16 = v11;
        v17 = 2048;
        v18 = a1;
        v19 = 2114;
        v20 = CFSTR("BKSHIDEventDeferringEnvironment.m");
        v21 = 1024;
        v22 = 32;
        v23 = 2114;
        v24 = v8;
        _os_log_error_impl(&dword_18A0F0000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", buf, 0x3Au);

      }
      objc_msgSend(objc_retainAutorelease(v8), "UTF8String");
      _bs_set_crash_log_message();
      __break(0);
      JUMPOUT(0x18A1011A4);
    }
    v12.receiver = a1;
    v12.super_class = (Class)BKSHIDEventDeferringEnvironment;
    a1 = objc_msgSendSuper2(&v12, sel_init);
    if (a1)
    {
      v5 = objc_msgSend(v3, "copy");
      v6 = (void *)a1[1];
      a1[1] = v5;

    }
  }

  return a1;
}

- (BKSHIDEventDeferringEnvironment)init
{
  void *v4;
  void *v5;
  objc_class *v6;
  void *v7;
  BKSHIDEventDeferringEnvironment *result;
  int v9;
  void *v10;
  __int16 v11;
  void *v12;
  __int16 v13;
  BKSHIDEventDeferringEnvironment *v14;
  __int16 v15;
  const __CFString *v16;
  __int16 v17;
  int v18;
  __int16 v19;
  void *v20;

  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("-init is not allowed on BKSHIDEventDeferringEnvironment"));
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
    v16 = CFSTR("BKSHIDEventDeferringEnvironment.m");
    v17 = 1024;
    v18 = 27;
    v19 = 2114;
    v20 = v4;
    _os_log_error_impl(&dword_18A0F0000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", (uint8_t *)&v9, 0x3Au);

  }
  objc_msgSend(objc_retainAutorelease(v4), "UTF8String");
  result = (BKSHIDEventDeferringEnvironment *)_bs_set_crash_log_message();
  __break(0);
  return result;
}

- (BOOL)_isSystemEnvironment
{
  return -[NSString isEqualToString:](self->_identifier, "isEqualToString:", CFSTR("system"));
}

- (BOOL)_isKeyboardFocusEnvironment
{
  return -[NSString isEqualToString:](self->_identifier, "isEqualToString:", CFSTR("keyboardFocus"));
}

- (void)encodeWithBSXPCCoder:(id)a3
{
  objc_msgSend(a3, "encodeObject:forKey:", self->_identifier, CFSTR("ident"));
}

- (BKSHIDEventDeferringEnvironment)initWithBSXPCCoder:(id)a3
{
  id v4;
  BKSHIDEventDeferringEnvironment *v5;
  uint64_t v6;
  NSString *identifier;
  BKSHIDEventDeferringEnvironment *v8;
  objc_super v10;

  v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)BKSHIDEventDeferringEnvironment;
  v5 = -[BKSHIDEventDeferringEnvironment init](&v10, sel_init);
  if (!v5
    || (objc_msgSend(v4, "decodeStringForKey:", CFSTR("ident")),
        v6 = objc_claimAutoreleasedReturnValue(),
        identifier = v5->_identifier,
        v5->_identifier = (NSString *)v6,
        identifier,
        -[BKSHIDEventDeferringEnvironment _uniqueEnvironmentForIdentifier]((id *)&v5->super.isa),
        (v8 = (BKSHIDEventDeferringEnvironment *)objc_claimAutoreleasedReturnValue()) == 0))
  {
    v8 = v5;
  }

  return v8;
}

+ (BOOL)supportsBSXPCSecureCoding
{
  return 1;
}

void __49__BKSHIDEventDeferringEnvironment_protobufSchema__block_invoke(uint64_t a1)
{
  uint64_t v1;
  void *v2;

  objc_msgSend(MEMORY[0x1E0D01838], "buildSchemaForClass:builder:", *(_QWORD *)(a1 + 32), &__block_literal_global_22);
  v1 = objc_claimAutoreleasedReturnValue();
  v2 = (void *)protobufSchema_schema;
  protobufSchema_schema = v1;

}

uint64_t __49__BKSHIDEventDeferringEnvironment_protobufSchema__block_invoke_2(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "addField:forTag:", "_identifier", 1);
}

void __52__BKSHIDEventDeferringEnvironment_systemEnvironment__block_invoke()
{
  _QWORD *v0;
  void *v1;

  v0 = -[BKSHIDEventDeferringEnvironment _initWithIdentifier:]([BKSHIDEventDeferringEnvironment alloc], CFSTR("system"));
  v1 = (void *)systemEnvironment___systemEnvironment;
  systemEnvironment___systemEnvironment = (uint64_t)v0;

}

@end
