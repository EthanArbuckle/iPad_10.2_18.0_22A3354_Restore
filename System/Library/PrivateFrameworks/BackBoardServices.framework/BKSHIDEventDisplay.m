@implementation BKSHIDEventDisplay

- (unint64_t)hash
{
  uint64_t v2;

  if (self->_builtin)
    v2 = 102301;
  else
    v2 = 96953;
  return v2 ^ -[NSString hash](self->_hardwareIdentifier, "hash");
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (BOOL)_isNullDisplay
{
  return !self->_builtin && self->_hardwareIdentifier == 0;
}

- (BOOL)isEqual:(id)a3
{
  BKSHIDEventDisplay *v4;
  uint64_t v5;
  char v6;

  v4 = (BKSHIDEventDisplay *)a3;
  if (self == v4)
  {
    v6 = 1;
  }
  else
  {
    v5 = objc_opt_class();
    if (v5 == objc_opt_class() && self->_builtin == v4->_builtin)
      v6 = BSEqualStrings();
    else
      v6 = 0;
  }

  return v6;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_hardwareIdentifier, 0);
}

- (NSString)description
{
  NSString *hardwareIdentifier;

  hardwareIdentifier = self->_hardwareIdentifier;
  if (hardwareIdentifier)
    return hardwareIdentifier;
  if (self->_builtin)
    return (NSString *)CFSTR("builtin");
  return (NSString *)CFSTR("null");
}

+ (id)nullDisplay
{
  if (nullDisplay_onceToken != -1)
    dispatch_once(&nullDisplay_onceToken, &__block_literal_global_2038);
  return (id)nullDisplay___null;
}

- (void)encodeWithCoder:(id)a3
{
  NSString *hardwareIdentifier;

  hardwareIdentifier = self->_hardwareIdentifier;
  if (hardwareIdentifier)
    objc_msgSend(a3, "encodeObject:forKey:", hardwareIdentifier, CFSTR("hardwareIdentifier"));
  else
    objc_msgSend(a3, "encodeBool:forKey:", self->_builtin, CFSTR("builtin"));
}

- (BOOL)_isBuiltinDisplay
{
  return self->_builtin;
}

- (BKSHIDEventDisplay)initWithCoder:(id)a3
{
  id v4;
  BKSHIDEventDisplay *v5;
  void *v6;

  v4 = a3;
  if (objc_msgSend(v4, "decodeBoolForKey:", CFSTR("builtin")))
  {
    +[BKSHIDEventDisplay builtinDisplay](BKSHIDEventDisplay, "builtinDisplay");
    v5 = (BKSHIDEventDisplay *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("hardwareIdentifier"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (v6)
      +[BKSHIDEventDisplay displayWithHardwareIdentifier:](BKSHIDEventDisplay, "displayWithHardwareIdentifier:", v6);
    else
      +[BKSHIDEventDisplay nullDisplay](BKSHIDEventDisplay, "nullDisplay");
    v5 = (BKSHIDEventDisplay *)objc_claimAutoreleasedReturnValue();

  }
  return v5;
}

+ (id)builtinDisplay
{
  if (builtinDisplay_onceToken != -1)
    dispatch_once(&builtinDisplay_onceToken, &__block_literal_global_11);
  return (id)builtinDisplay___builtin;
}

- (id)initForProtobufDecoding
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)BKSHIDEventDisplay;
  return -[BKSHIDEventDisplay init](&v3, sel_init);
}

void __36__BKSHIDEventDisplay_builtinDisplay__block_invoke()
{
  id v0;
  void *v1;

  v0 = -[BKSHIDEventDisplay _initWithHardwareIdentifier:]([BKSHIDEventDisplay alloc], "_initWithHardwareIdentifier:", 0);
  v1 = (void *)builtinDisplay___builtin;
  builtinDisplay___builtin = (uint64_t)v0;

  *(_BYTE *)(builtinDisplay___builtin + 8) = 1;
}

- (id)_initWithHardwareIdentifier:(id)a3
{
  id v5;
  BKSHIDEventDisplay *v6;
  uint64_t v7;
  id v8;
  uint64_t v9;
  NSString *hardwareIdentifier;
  void *v12;
  void *v13;
  objc_class *v14;
  void *v15;
  void *v16;
  objc_class *v17;
  void *v18;
  objc_class *v19;
  void *v20;
  void *v21;
  void *v22;
  objc_class *v23;
  void *v24;
  objc_super v25;
  uint8_t buf[4];
  void *v27;
  __int16 v28;
  void *v29;
  __int16 v30;
  BKSHIDEventDisplay *v31;
  __int16 v32;
  const __CFString *v33;
  __int16 v34;
  int v35;
  __int16 v36;
  void *v37;
  uint64_t v38;

  v38 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v25.receiver = self;
  v25.super_class = (Class)BKSHIDEventDisplay;
  v6 = -[BKSHIDEventDisplay init](&v25, sel_init);
  if (v6)
  {
    v7 = objc_opt_class();
    if (v7 != objc_opt_class())
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("BKSHIDEventDisplay cannot be subclassed"));
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      {
        NSStringFromSelector(a2);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v14 = (objc_class *)objc_opt_class();
        NSStringFromClass(v14);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138544642;
        v27 = v13;
        v28 = 2114;
        v29 = v15;
        v30 = 2048;
        v31 = v6;
        v32 = 2114;
        v33 = CFSTR("BKSHIDEventDisplay.m");
        v34 = 1024;
        v35 = 28;
        v36 = 2114;
        v37 = v12;
        _os_log_error_impl(&dword_18A0F0000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", buf, 0x3Au);

      }
      objc_msgSend(objc_retainAutorelease(v12), "UTF8String");
      _bs_set_crash_log_message();
      __break(0);
      JUMPOUT(0x18A100400);
    }
    v8 = v5;
    if (v8)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        v16 = (void *)MEMORY[0x1E0CB3940];
        v17 = (objc_class *)objc_msgSend(v8, "classForCoder");
        if (!v17)
          v17 = (objc_class *)objc_opt_class();
        NSStringFromClass(v17);
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        v19 = (objc_class *)objc_opt_class();
        NSStringFromClass(v19);
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "stringWithFormat:", CFSTR("Value for '%@' was of unexpected class %@. Expected %@."), CFSTR("hardwareIdentifier"), v18, v20);
        v21 = (void *)objc_claimAutoreleasedReturnValue();

        if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
        {
          NSStringFromSelector(a2);
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          v23 = (objc_class *)objc_opt_class();
          NSStringFromClass(v23);
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138544642;
          v27 = v22;
          v28 = 2114;
          v29 = v24;
          v30 = 2048;
          v31 = v6;
          v32 = 2114;
          v33 = CFSTR("BKSHIDEventDisplay.m");
          v34 = 1024;
          v35 = 29;
          v36 = 2114;
          v37 = v21;
          _os_log_error_impl(&dword_18A0F0000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", buf, 0x3Au);

        }
        objc_msgSend(objc_retainAutorelease(v21), "UTF8String");
        _bs_set_crash_log_message();
        __break(0);
        JUMPOUT(0x18A100538);
      }
    }

    v9 = objc_msgSend(v8, "copy");
    hardwareIdentifier = v6->_hardwareIdentifier;
    v6->_hardwareIdentifier = (NSString *)v9;

  }
  return v6;
}

+ (id)protobufSchema
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __36__BKSHIDEventDisplay_protobufSchema__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (protobufSchema_onceToken_2029 != -1)
    dispatch_once(&protobufSchema_onceToken_2029, block);
  return (id)protobufSchema_schema_2030;
}

- (id)_hardwareIdentifier
{
  return self->_hardwareIdentifier;
}

- (BKSHIDEventDisplay)init
{
  void *v4;
  void *v5;
  objc_class *v6;
  void *v7;
  BKSHIDEventDisplay *result;
  int v9;
  void *v10;
  __int16 v11;
  void *v12;
  __int16 v13;
  BKSHIDEventDisplay *v14;
  __int16 v15;
  const __CFString *v16;
  __int16 v17;
  int v18;
  __int16 v19;
  void *v20;

  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("-init is not allowed on BKSHIDEventDisplay"));
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
    v16 = CFSTR("BKSHIDEventDisplay.m");
    v17 = 1024;
    v18 = 22;
    v19 = 2114;
    v20 = v4;
    _os_log_error_impl(&dword_18A0F0000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", (uint8_t *)&v9, 0x3Au);

  }
  objc_msgSend(objc_retainAutorelease(v4), "UTF8String");
  result = (BKSHIDEventDisplay *)_bs_set_crash_log_message();
  __break(0);
  return result;
}

+ (BKSHIDEventDisplay)displayWithHardwareIdentifier:(id)a3
{
  id v5;
  void *v6;
  objc_class *v7;
  id v8;
  void *v10;
  void *v11;
  void *v12;
  objc_class *v13;
  void *v14;
  void *v15;
  objc_class *v16;
  void *v17;
  objc_class *v18;
  void *v19;
  void *v20;
  void *v21;
  objc_class *v22;
  void *v23;
  uint8_t buf[4];
  void *v25;
  __int16 v26;
  void *v27;
  __int16 v28;
  id v29;
  __int16 v30;
  const __CFString *v31;
  __int16 v32;
  int v33;
  __int16 v34;
  void *v35;
  uint64_t v36;

  v36 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = (void *)MEMORY[0x1E0CB3940];
  v7 = (objc_class *)objc_opt_class();
  if (!v5)
  {
    NSStringFromClass(v7);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "stringWithFormat:", CFSTR("Value for '%@' was unexpectedly nil. Expected %@."), CFSTR("hardwareIdentifier"), v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    {
      NSStringFromSelector(a2);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = (objc_class *)objc_opt_class();
      NSStringFromClass(v13);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138544642;
      v25 = v12;
      v26 = 2114;
      v27 = v14;
      v28 = 2048;
      v29 = a1;
      v30 = 2114;
      v31 = CFSTR("BKSHIDEventDisplay.m");
      v32 = 1024;
      v33 = 66;
      v34 = 2114;
      v35 = v11;
      _os_log_error_impl(&dword_18A0F0000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", buf, 0x3Au);

    }
    objc_msgSend(objc_retainAutorelease(v11), "UTF8String");
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x18A11451CLL);
  }
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    v15 = (void *)MEMORY[0x1E0CB3940];
    v16 = (objc_class *)objc_msgSend(v5, "classForCoder");
    if (!v16)
      v16 = (objc_class *)objc_opt_class();
    NSStringFromClass(v16);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = (objc_class *)objc_opt_class();
    NSStringFromClass(v18);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "stringWithFormat:", CFSTR("Value for '%@' was of unexpected class %@. Expected %@."), CFSTR("hardwareIdentifier"), v17, v19);
    v20 = (void *)objc_claimAutoreleasedReturnValue();

    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    {
      NSStringFromSelector(a2);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v22 = (objc_class *)objc_opt_class();
      NSStringFromClass(v22);
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138544642;
      v25 = v21;
      v26 = 2114;
      v27 = v23;
      v28 = 2048;
      v29 = a1;
      v30 = 2114;
      v31 = CFSTR("BKSHIDEventDisplay.m");
      v32 = 1024;
      v33 = 66;
      v34 = 2114;
      v35 = v20;
      _os_log_error_impl(&dword_18A0F0000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", buf, 0x3Au);

    }
    objc_msgSend(objc_retainAutorelease(v20), "UTF8String");
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x18A114654);
  }

  v8 = -[BKSHIDEventDisplay _initWithHardwareIdentifier:]([BKSHIDEventDisplay alloc], "_initWithHardwareIdentifier:", v5);
  return (BKSHIDEventDisplay *)v8;
}

void __36__BKSHIDEventDisplay_protobufSchema__block_invoke(uint64_t a1)
{
  uint64_t v1;
  void *v2;

  objc_msgSend(MEMORY[0x1E0D01838], "buildSchemaForClass:builder:", *(_QWORD *)(a1 + 32), &__block_literal_global_18);
  v1 = objc_claimAutoreleasedReturnValue();
  v2 = (void *)protobufSchema_schema_2030;
  protobufSchema_schema_2030 = v1;

}

void __36__BKSHIDEventDisplay_protobufSchema__block_invoke_2(uint64_t a1, void *a2)
{
  id v2;

  v2 = a2;
  objc_msgSend(v2, "addField:forTag:", "_hardwareIdentifier", 1);
  objc_msgSend(v2, "addField:forTag:", "_builtin", 2);

}

void __33__BKSHIDEventDisplay_nullDisplay__block_invoke()
{
  id v0;
  void *v1;

  v0 = -[BKSHIDEventDisplay _initWithHardwareIdentifier:]([BKSHIDEventDisplay alloc], "_initWithHardwareIdentifier:", 0);
  v1 = (void *)nullDisplay___null;
  nullDisplay___null = (uint64_t)v0;

  *(_BYTE *)(nullDisplay___null + 8) = 0;
}

@end
