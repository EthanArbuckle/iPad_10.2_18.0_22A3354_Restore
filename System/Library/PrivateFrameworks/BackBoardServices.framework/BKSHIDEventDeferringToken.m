@implementation BKSHIDEventDeferringToken

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)appendDescriptionToFormatter:(id)a3
{
  id v5;
  void *v6;
  void *v7;
  objc_class *v8;
  void *v9;
  int v10;
  void *v11;
  __int16 v12;
  void *v13;
  __int16 v14;
  BKSHIDEventDeferringToken *v15;
  __int16 v16;
  const __CFString *v17;
  __int16 v18;
  int v19;
  __int16 v20;
  void *v21;

  v5 = a3;
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("subclass me"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
  {
    NSStringFromSelector(a2);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = (objc_class *)objc_opt_class();
    NSStringFromClass(v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = 138544642;
    v11 = v7;
    v12 = 2114;
    v13 = v9;
    v14 = 2048;
    v15 = self;
    v16 = 2114;
    v17 = CFSTR("BKSHIDEventDeferringToken.m");
    v18 = 1024;
    v19 = 451;
    v20 = 2114;
    v21 = v6;
    _os_log_error_impl(&dword_18A0F0000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", (uint8_t *)&v10, 0x3Au);

  }
  objc_msgSend(objc_retainAutorelease(v6), "UTF8String");
  _bs_set_crash_log_message();
  __break(0);
}

- (unsigned)_identifierOfCAContext
{
  return 0;
}

- (BOOL)_isString
{
  return 0;
}

- (id)_string
{
  return 0;
}

- (BOOL)_isIdentifierOfCAContext
{
  return 0;
}

- (void)encodeWithCoder:(id)a3
{
  id v5;
  void *v6;
  void *v7;
  objc_class *v8;
  void *v9;
  int v10;
  void *v11;
  __int16 v12;
  void *v13;
  __int16 v14;
  BKSHIDEventDeferringToken *v15;
  __int16 v16;
  const __CFString *v17;
  __int16 v18;
  int v19;
  __int16 v20;
  void *v21;

  v5 = a3;
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("subclass me"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
  {
    NSStringFromSelector(a2);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = (objc_class *)objc_opt_class();
    NSStringFromClass(v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = 138544642;
    v11 = v7;
    v12 = 2114;
    v13 = v9;
    v14 = 2048;
    v15 = self;
    v16 = 2114;
    v17 = CFSTR("BKSHIDEventDeferringToken.m");
    v18 = 1024;
    v19 = 442;
    v20 = 2114;
    v21 = v6;
    _os_log_error_impl(&dword_18A0F0000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", (uint8_t *)&v10, 0x3Au);

  }
  objc_msgSend(objc_retainAutorelease(v6), "UTF8String");
  _bs_set_crash_log_message();
  __break(0);
}

+ (id)tokenForIdentifierOfCAContext:(unsigned int)a3
{
  if (a3)
    return -[_BKSHIDCAContextEventDeferringToken _initWithIdentifier:]([_BKSHIDCAContextEventDeferringToken alloc], "_initWithIdentifier:", *(_QWORD *)&a3);
  else
    return 0;
}

+ (id)tokenForString:(id)a3
{
  id v5;
  id v6;
  void *v8;
  void *v9;
  objc_class *v10;
  void *v11;
  uint8_t buf[4];
  void *v13;
  __int16 v14;
  void *v15;
  __int16 v16;
  id v17;
  __int16 v18;
  const __CFString *v19;
  __int16 v20;
  int v21;
  __int16 v22;
  void *v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  if (!objc_msgSend(v5, "length"))
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("[string length] > 0"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    {
      NSStringFromSelector(a2);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = (objc_class *)objc_opt_class();
      NSStringFromClass(v10);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138544642;
      v13 = v9;
      v14 = 2114;
      v15 = v11;
      v16 = 2048;
      v17 = a1;
      v18 = 2114;
      v19 = CFSTR("BKSHIDEventDeferringToken.m");
      v20 = 1024;
      v21 = 385;
      v22 = 2114;
      v23 = v8;
      _os_log_error_impl(&dword_18A0F0000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", buf, 0x3Au);

    }
    objc_msgSend(objc_retainAutorelease(v8), "UTF8String");
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x18A0F7CBCLL);
  }
  v6 = -[_BKSHIDStringIdentifierEventDeferringToken _initWithString:]([_BKSHIDStringIdentifierEventDeferringToken alloc], "_initWithString:", v5);

  return v6;
}

- (BKSHIDEventDeferringToken)initWithCoder:(id)a3
{
  id v5;
  void *v6;
  void *v7;
  objc_class *v8;
  void *v9;
  BKSHIDEventDeferringToken *result;
  int v11;
  void *v12;
  __int16 v13;
  void *v14;
  __int16 v15;
  BKSHIDEventDeferringToken *v16;
  __int16 v17;
  const __CFString *v18;
  __int16 v19;
  int v20;
  __int16 v21;
  void *v22;

  v5 = a3;
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("subclass me"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
  {
    NSStringFromSelector(a2);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = (objc_class *)objc_opt_class();
    NSStringFromClass(v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = 138544642;
    v12 = v7;
    v13 = 2114;
    v14 = v9;
    v15 = 2048;
    v16 = self;
    v17 = 2114;
    v18 = CFSTR("BKSHIDEventDeferringToken.m");
    v19 = 1024;
    v20 = 446;
    v21 = 2114;
    v22 = v6;
    _os_log_error_impl(&dword_18A0F0000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", (uint8_t *)&v11, 0x3Au);

  }
  objc_msgSend(objc_retainAutorelease(v6), "UTF8String");
  result = (BKSHIDEventDeferringToken *)_bs_set_crash_log_message();
  __break(0);
  return result;
}

+ (id)protobufSchema
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __43__BKSHIDEventDeferringToken_protobufSchema__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (protobufSchema_onceToken_92 != -1)
    dispatch_once(&protobufSchema_onceToken_92, block);
  return (id)protobufSchema_schema_91;
}

- (BKSHIDEventDeferringToken)init
{
  void *v4;
  void *v5;
  objc_class *v6;
  void *v7;
  BKSHIDEventDeferringToken *result;
  int v9;
  void *v10;
  __int16 v11;
  void *v12;
  __int16 v13;
  BKSHIDEventDeferringToken *v14;
  __int16 v15;
  const __CFString *v16;
  __int16 v17;
  int v18;
  __int16 v19;
  void *v20;

  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("-init is not allowed on BKSHIDEventDeferringToken"));
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
    v16 = CFSTR("BKSHIDEventDeferringToken.m");
    v17 = 1024;
    v18 = 357;
    v19 = 2114;
    v20 = v4;
    _os_log_error_impl(&dword_18A0F0000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", (uint8_t *)&v9, 0x3Au);

  }
  objc_msgSend(objc_retainAutorelease(v4), "UTF8String");
  result = (BKSHIDEventDeferringToken *)_bs_set_crash_log_message();
  __break(0);
  return result;
}

- (id)_init
{
  uint64_t v4;
  void *v6;
  void *v7;
  objc_class *v8;
  void *v9;
  objc_super v10;
  uint8_t buf[4];
  void *v12;
  __int16 v13;
  void *v14;
  __int16 v15;
  BKSHIDEventDeferringToken *v16;
  __int16 v17;
  const __CFString *v18;
  __int16 v19;
  int v20;
  __int16 v21;
  void *v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v4 = objc_opt_class();
  if (v4 != objc_opt_class() && v4 != objc_opt_class() && v4 != objc_opt_class())
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("cannot subclass BKSHIDEventDeferringToken"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    {
      NSStringFromSelector(a2);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = (objc_class *)objc_opt_class();
      NSStringFromClass(v8);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138544642;
      v12 = v7;
      v13 = 2114;
      v14 = v9;
      v15 = 2048;
      v16 = self;
      v17 = 2114;
      v18 = CFSTR("BKSHIDEventDeferringToken.m");
      v19 = 1024;
      v20 = 365;
      v21 = 2114;
      v22 = v6;
      _os_log_error_impl(&dword_18A0F0000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", buf, 0x3Au);

    }
    objc_msgSend(objc_retainAutorelease(v6), "UTF8String");
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x18A121580);
  }
  v10.receiver = self;
  v10.super_class = (Class)BKSHIDEventDeferringToken;
  return -[BKSHIDEventDeferringToken init](&v10, sel_init);
}

- (BOOL)_isIdentifierOfCGSConnection
{
  return 0;
}

- (unsigned)_identifierOfCGSConnection
{
  return 0;
}

+ (BKSHIDEventDeferringToken)new
{
  void *v4;
  void *v5;
  objc_class *v6;
  void *v7;
  BKSHIDEventDeferringToken *result;
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

  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("+new is not allowed on BKSHIDEventDeferringToken"));
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
    v16 = CFSTR("BKSHIDEventDeferringToken.m");
    v17 = 1024;
    v18 = 352;
    v19 = 2114;
    v20 = v4;
    _os_log_error_impl(&dword_18A0F0000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", (uint8_t *)&v9, 0x3Au);

  }
  objc_msgSend(objc_retainAutorelease(v4), "UTF8String");
  result = (BKSHIDEventDeferringToken *)_bs_set_crash_log_message();
  __break(0);
  return result;
}

+ (id)tokenForIdentifierOfCGSConnection:(unsigned int)a3
{
  if (a3)
    return -[_BKSHIDCGSConnectIDEventDeferringToken _initWithCGSConnectionID:]([_BKSHIDCGSConnectIDEventDeferringToken alloc], "_initWithCGSConnectionID:", *(_QWORD *)&a3);
  else
    return 0;
}

void __43__BKSHIDEventDeferringToken_protobufSchema__block_invoke(uint64_t a1)
{
  uint64_t v1;
  void *v2;

  objc_msgSend(MEMORY[0x1E0D01838], "buildSchemaForClass:builder:", *(_QWORD *)(a1 + 32), &__block_literal_global_93);
  v1 = objc_claimAutoreleasedReturnValue();
  v2 = (void *)protobufSchema_schema_91;
  protobufSchema_schema_91 = v1;

}

void __43__BKSHIDEventDeferringToken_protobufSchema__block_invoke_2(uint64_t a1, void *a2)
{
  id v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  v2 = a2;
  v4 = objc_opt_class();
  v5 = objc_opt_class();
  v6 = objc_opt_class();
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v4, 3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setAcceptableConcreteSubclasses:", v3, v4, v5);

}

@end
