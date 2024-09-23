@implementation BLSAlwaysOnDateSpecifier

- (BLSAlwaysOnDateSpecifier)initWithDate:(id)a3 fidelity:(int64_t)a4 userObject:(id)a5
{
  id v9;
  id v10;
  BLSAlwaysOnDateSpecifier *v11;
  BLSAlwaysOnDateSpecifier *v12;
  objc_super v14;

  v9 = a3;
  v10 = a5;
  v14.receiver = self;
  v14.super_class = (Class)BLSAlwaysOnDateSpecifier;
  v11 = -[BLSAlwaysOnDateSpecifier init](&v14, sel_init);
  v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_date, a3);
    v12->_fidelity = a4;
    objc_storeStrong(&v12->_userObject, a5);
  }

  return v12;
}

- (BLSAlwaysOnDateSpecifier)initWithDate:(id)a3 fidelity:(int64_t)a4
{
  return -[BLSAlwaysOnDateSpecifier initWithDate:fidelity:userObject:](self, "initWithDate:fidelity:userObject:", a3, a4, 0);
}

- (id)newSpecifierWithMaxFidelity:(int64_t)a3
{
  BLSAlwaysOnDateSpecifier *v5;
  int64_t fidelity;

  v5 = [BLSAlwaysOnDateSpecifier alloc];
  if (self->_fidelity >= a3)
    fidelity = a3;
  else
    fidelity = self->_fidelity;
  return -[BLSAlwaysOnDateSpecifier initWithDate:fidelity:](v5, "initWithDate:fidelity:", self->_date, fidelity);
}

- (id)bls_shortLoggingString
{
  void *v3;
  id v4;
  void *v5;
  uint64_t v7;
  uint64_t v8;
  void (*v9)(uint64_t);
  void *v10;
  id v11;
  BLSAlwaysOnDateSpecifier *v12;

  v3 = (void *)objc_opt_new();
  v7 = MEMORY[0x1E0C809B0];
  v8 = 3221225472;
  v9 = __50__BLSAlwaysOnDateSpecifier_bls_shortLoggingString__block_invoke;
  v10 = &unk_1E621A3B8;
  v11 = v3;
  v12 = self;
  v4 = v3;
  objc_msgSend(v4, "appendProem:block:", 0, &v7);
  objc_msgSend(v4, "description", v7, v8, v9, v10);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

void __50__BLSAlwaysOnDateSpecifier_bls_shortLoggingString__block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;

  v2 = *(void **)(a1 + 32);
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 8), "bls_shortLoggingString");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%p"), *(_QWORD *)(a1 + 40));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "appendString:withName:", v3, v4);

  v5 = *(void **)(a1 + 32);
  NSStringFromBLSUpdateFidelity(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 16));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "appendString:withName:skipIfEmpty:", v6, 0, 1);

  v7 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 24);
  if (v7)
    objc_msgSend(*(id *)(a1 + 32), "appendProem:block:", v7, &__block_literal_global_4);
}

- (NSString)description
{
  void *v3;
  void *v4;
  void *v5;
  id userObject;
  void *v7;
  void *v8;

  objc_msgSend(MEMORY[0x1E0D01748], "builderWithObject:", self);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSDate bls_shortLoggingString](self->_date, "bls_shortLoggingString");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendString:withName:", v4, CFSTR("date"));

  NSStringFromBLSUpdateFidelity(self->_fidelity);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendString:withName:", v5, CFSTR("fidelity"));

  userObject = self->_userObject;
  if (userObject)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("<%p:%@>"), userObject, objc_opt_class());
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "appendString:withName:", v7, CFSTR("userObject"));

  }
  objc_msgSend(v3, "build");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v8;
}

- (unint64_t)hash
{
  void *v3;
  id v4;
  id v5;
  unint64_t v6;

  objc_msgSend(MEMORY[0x1E0D01788], "builder");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (id)objc_msgSend(v3, "appendObject:", self->_date);
  v5 = (id)objc_msgSend(v3, "appendInteger:", self->_fidelity);
  v6 = objc_msgSend(v3, "hash");

  return v6;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  void *v5;
  NSDate *date;
  uint64_t v7;
  id v8;
  id v9;
  int64_t fidelity;
  id v11;
  id v12;
  uint64_t v14;
  uint64_t v15;
  uint64_t (*v16)(uint64_t);
  void *v17;
  id v18;
  _QWORD v19[4];
  id v20;

  v4 = a3;
  objc_msgSend(MEMORY[0x1E0D01768], "builderWithObject:ofExpectedClass:", v4, objc_opt_class());
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  date = self->_date;
  v7 = MEMORY[0x1E0C809B0];
  v19[0] = MEMORY[0x1E0C809B0];
  v19[1] = 3221225472;
  v19[2] = __36__BLSAlwaysOnDateSpecifier_isEqual___block_invoke;
  v19[3] = &unk_1E621A808;
  v8 = v4;
  v20 = v8;
  v9 = (id)objc_msgSend(v5, "appendObject:counterpart:", date, v19);
  fidelity = self->_fidelity;
  v14 = v7;
  v15 = 3221225472;
  v16 = __36__BLSAlwaysOnDateSpecifier_isEqual___block_invoke_2;
  v17 = &unk_1E621A830;
  v18 = v8;
  v11 = v8;
  v12 = (id)objc_msgSend(v5, "appendInteger:counterpart:", fidelity, &v14);
  LOBYTE(fidelity) = objc_msgSend(v5, "isEqual", v14, v15, v16, v17);

  return fidelity;
}

uint64_t __36__BLSAlwaysOnDateSpecifier_isEqual___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "date");
}

uint64_t __36__BLSAlwaysOnDateSpecifier_isEqual___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "fidelity");
}

- (int64_t)compare:(id)a3
{
  NSDate *date;
  void *v4;
  int64_t v5;

  date = self->_date;
  objc_msgSend(a3, "date");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = -[NSDate compare:](date, "compare:", v4);

  return v5;
}

- (BLSAlwaysOnDateSpecifier)initWithXPCDictionary:(id)a3
{
  id v4;
  double v5;
  int64_t int64;
  void *v7;
  BLSAlwaysOnDateSpecifier *v8;

  v4 = a3;
  v5 = xpc_dictionary_get_double(v4, (const char *)objc_msgSend(CFSTR("date"), "UTF8String"));
  int64 = xpc_dictionary_get_int64(v4, (const char *)objc_msgSend(CFSTR("fidelity"), "UTF8String"));

  objc_msgSend(MEMORY[0x1E0C99D68], "dateWithTimeIntervalSinceReferenceDate:", v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = -[BLSAlwaysOnDateSpecifier initWithDate:fidelity:](self, "initWithDate:fidelity:", v7, int64);

  return v8;
}

- (void)encodeWithXPCDictionary:(id)a3
{
  const char *v5;
  double v6;
  void *v7;
  xpc_object_t xdict;

  xdict = a3;
  v5 = (const char *)objc_msgSend(CFSTR("date"), "UTF8String");
  -[NSDate timeIntervalSinceReferenceDate](self->_date, "timeIntervalSinceReferenceDate");
  xpc_dictionary_set_double(xdict, v5, v6);
  xpc_dictionary_set_int64(xdict, (const char *)objc_msgSend(CFSTR("fidelity"), "UTF8String"), self->_fidelity);
  if (self->_userObject)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("User object is not sent over XPC: %@"), self->_userObject);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      -[BLSAlwaysOnDateSpecifier encodeWithXPCDictionary:].cold.1(a2);
    objc_msgSend(objc_retainAutorelease(v7), "UTF8String");
    _bs_set_crash_log_message();
    __break(0);
  }
  else
  {

  }
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (BLSAlwaysOnDateSpecifier)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  BLSAlwaysOnDateSpecifier *v6;
  NSObject *v7;

  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("date"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    self = -[BLSAlwaysOnDateSpecifier initWithDate:fidelity:](self, "initWithDate:fidelity:", v5, (int)objc_msgSend(v4, "decodeIntForKey:", CFSTR("fidelity")));
    v6 = self;
  }
  else
  {
    bls_backlight_log();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_FAULT))
      -[BLSAlwaysOnDateSpecifier initWithCoder:].cold.1((uint64_t)v4, v7);

    v6 = 0;
  }

  return v6;
}

- (void)encodeWithCoder:(id)a3
{
  void *v5;
  id v6;

  v6 = a3;
  objc_msgSend(v6, "encodeObject:forKey:", self->_date, CFSTR("date"));
  objc_msgSend(v6, "encodeInteger:forKey:", self->_fidelity, CFSTR("fidelity"));
  if (self->_userObject)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("User object is not sent over XPC: %@"), self->_userObject);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      -[BLSAlwaysOnDateSpecifier encodeWithCoder:].cold.1(a2);
    objc_msgSend(objc_retainAutorelease(v5), "UTF8String");
    _bs_set_crash_log_message();
    __break(0);
  }
  else
  {

  }
}

- (NSDate)date
{
  return self->_date;
}

- (int64_t)fidelity
{
  return self->_fidelity;
}

- (id)userObject
{
  return self->_userObject;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_userObject, 0);
  objc_storeStrong((id *)&self->_date, 0);
}

- (void)encodeWithXPCDictionary:(const char *)a1 .cold.1(const char *a1)
{
  void *v1;
  objc_class *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint8_t v9;

  NSStringFromSelector(a1);
  objc_claimAutoreleasedReturnValue();
  v2 = (objc_class *)OUTLINED_FUNCTION_3();
  NSStringFromClass(v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_1(&dword_1B0C75000, MEMORY[0x1E0C81028], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);

  OUTLINED_FUNCTION_2();
}

- (void)initWithCoder:(uint64_t)a1 .cold.1(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  v2 = 138543362;
  v3 = a1;
  _os_log_fault_impl(&dword_1B0C75000, a2, OS_LOG_TYPE_FAULT, "invalid date from %{public}@", (uint8_t *)&v2, 0xCu);
}

- (void)encodeWithCoder:(const char *)a1 .cold.1(const char *a1)
{
  void *v1;
  objc_class *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint8_t v9;

  NSStringFromSelector(a1);
  objc_claimAutoreleasedReturnValue();
  v2 = (objc_class *)OUTLINED_FUNCTION_3();
  NSStringFromClass(v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_1(&dword_1B0C75000, MEMORY[0x1E0C81028], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);

  OUTLINED_FUNCTION_2();
}

@end
