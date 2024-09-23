@implementation BLSAttribute

- (BLSAttribute)init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)BLSAttribute;
  return -[BLSAttribute init](&v3, sel_init);
}

- (BOOL)canBePaused
{
  return 1;
}

- (unint64_t)hash
{
  objc_class *v2;
  void *v3;
  unint64_t v4;

  v2 = (objc_class *)objc_opt_class();
  NSStringFromClass(v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "hash");

  return v4;
}

- (BOOL)isEqual:(id)a3
{
  id v3;
  uint64_t v4;
  uint64_t v5;

  if (a3 == self)
    return 1;
  v3 = a3;
  v4 = objc_opt_class();
  v5 = objc_opt_class();

  return v4 == v5;
}

- (BOOL)checkEntitlementSourceForRequiredEntitlements:(id)a3 error:(id *)a4
{
  return 1;
}

- (BOOL)checkEntitlementSource:(id)a3 forSingleEntitlement:(id)a4 error:(id *)a5
{
  id v8;
  id v9;
  char v10;
  BOOL v11;
  void *v12;

  v8 = a3;
  v9 = a4;
  v10 = objc_msgSend(v8, "hasEntitlement:", v9);
  v11 = v10;
  if (a5 && (v10 & 1) == 0)
  {
    objc_msgSend(v8, "description");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[BLSAttribute errorForMissingEntitlement:inSource:](self, "errorForMissingEntitlement:inSource:", v9, v12);
    *a5 = (id)objc_claimAutoreleasedReturnValue();

  }
  return v11;
}

- (id)errorForMissingEntitlement:(id)a3 inSource:(id)a4
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v9;
  _QWORD v10[2];

  v10[1] = *MEMORY[0x1E0C80C00];
  v4 = (void *)MEMORY[0x1E0CB35C8];
  v9 = *MEMORY[0x1E0CB2D50];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@ missing entitlement:%@"), a4, a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = v5;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v10, &v9, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "errorWithDomain:code:userInfo:", CFSTR("com.apple.BacklightServices"), 21, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (BLSAttribute)initWithXPCDictionary:(id)a3
{
  BLSAttribute *v3;
  NSObject *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  BLSAttribute *v12;

  v3 = self;
  if (-[BLSAttribute isMemberOfClass:](self, "isMemberOfClass:", objc_opt_class()))
  {
    bls_assertions_log();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_FAULT))
      -[BLSAttribute initWithXPCDictionary:].cold.1(v4, v5, v6, v7, v8, v9, v10, v11);

    v12 = 0;
  }
  else
  {
    v3 = -[BLSAttribute init](v3, "init");
    v12 = v3;
  }

  return v12;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (BLSAttribute)initWithCoder:(id)a3
{
  BLSAttribute *v3;
  NSObject *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  BLSAttribute *v12;

  v3 = self;
  if (-[BLSAttribute isMemberOfClass:](self, "isMemberOfClass:", objc_opt_class()))
  {
    bls_assertions_log();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_FAULT))
      -[BLSAttribute initWithXPCDictionary:].cold.1(v4, v5, v6, v7, v8, v9, v10, v11);

    v12 = 0;
  }
  else
  {
    v3 = -[BLSAttribute init](v3, "init");
    v12 = v3;
  }

  return v12;
}

- (void)initWithXPCDictionary:(uint64_t)a3 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_5(&dword_1B0C75000, a1, a3, "BLSAttribute initialized without valid subclass", a5, a6, a7, a8, 0);
}

@end
