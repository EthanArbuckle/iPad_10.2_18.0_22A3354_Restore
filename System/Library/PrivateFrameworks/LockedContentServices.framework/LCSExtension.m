@implementation LCSExtension

- (id)_initWithHostConfiguration:(id)a3
{
  id v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  LCSExtension *v11;
  LCSExtension *v12;
  uint64_t v13;
  NSUUID *identityUUID;
  id v15;
  void *v17;
  void *v18;
  void *v19;
  objc_super v20;

  v5 = a3;
  if (!v5)
  {
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("hostConfiguration"));
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      -[LCSExtension _initWithHostConfiguration:].cold.1();
LABEL_19:
    objc_msgSend(objc_retainAutorelease(v17), "UTF8String");
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x240B22754);
  }
  v6 = v5;
  objc_msgSend(v5, "extensionIdentity");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "rbsProcessIdentity");
  v8 = objc_claimAutoreleasedReturnValue();
  if (!v7)
  {
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("identity"));
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      -[LCSExtension _initWithHostConfiguration:].cold.2();
    objc_msgSend(objc_retainAutorelease(v18), "UTF8String");
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x240B227B8);
  }
  v9 = (void *)v8;
  objc_msgSend(v7, "uniqueIdentifier");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v10)
  {
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("[identity uniqueIdentifier]"));
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      -[LCSExtension _initWithHostConfiguration:].cold.3();
    objc_msgSend(objc_retainAutorelease(v19), "UTF8String");
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x240B2281CLL);
  }
  if (!v9)
  {
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("processIdentity"));
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      -[LCSExtension _initWithHostConfiguration:].cold.4();
    goto LABEL_19;
  }
  v20.receiver = self;
  v20.super_class = (Class)LCSExtension;
  v11 = -[LCSExtension init](&v20, sel_init);
  v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_identity, v7);
    objc_msgSend(v7, "uniqueIdentifier");
    v13 = objc_claimAutoreleasedReturnValue();
    identityUUID = v12->_identityUUID;
    v12->_identityUUID = (NSUUID *)v13;

    objc_storeStrong((id *)&v12->_processIdentity, v9);
    objc_storeStrong((id *)&v12->_hostConfiguration, a3);
    v15 = -[LCSExtension applicationExtensionRecord](v12, "applicationExtensionRecord");
  }

  return v12;
}

+ (id)extensionWithHostConfiguration:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  id v6;
  NSObject *v7;
  id result;
  void *v9;

  v3 = a3;
  if (v3)
  {
    v4 = v3;
    objc_msgSend(v3, "rbsProcessIdentity");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (v5)
    {
      v6 = -[LCSExtension _initWithHostConfiguration:]([LCSExtension alloc], "_initWithHostConfiguration:", v4);
    }
    else
    {
      LCSLogExtension();
      v7 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
        +[LCSExtension extensionWithHostConfiguration:].cold.2((uint64_t)v4, v7);

      v6 = 0;
    }

    return v6;
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("hostConfiguration"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      +[LCSExtension extensionWithHostConfiguration:].cold.1();
    objc_msgSend(objc_retainAutorelease(v9), "UTF8String");
    result = (id)_bs_set_crash_log_message();
    __break(0);
  }
  return result;
}

+ (id)extensionWithIdentity:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v8;

  v4 = a3;
  NSClassFromString(CFSTR("_EXExtensionIdentity"));
  if (!v4)
  {
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("_bs_assert_object != nil"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      +[LCSExtension extensionWithIdentity:].cold.1();
LABEL_9:
    objc_msgSend(objc_retainAutorelease(v8), "UTF8String");
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x240B22A84);
  }
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("[_bs_assert_object isKindOfClass:_EXExtensionIdentityClass]"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      +[LCSExtension extensionWithIdentity:].cold.1();
    goto LABEL_9;
  }

  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDC79D8]), "initWithExtensionIdentity:", v4);
  objc_msgSend(a1, "extensionWithHostConfiguration:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (LSApplicationExtensionRecord)applicationExtensionRecord
{
  os_unfair_lock_s *p_lock;
  uint64_t v4;
  void *v5;
  id v6;
  id v7;
  NSUUID *identityUUID;
  uint64_t v9;
  void *v10;
  BOOL v11;
  id v12;
  NSObject *v13;
  id v14;
  _EXExtensionIdentity *identity;
  id v17;
  id v18;
  uint8_t buf[4];
  LCSExtension *v20;
  __int16 v21;
  _EXExtensionIdentity *v22;
  __int16 v23;
  id v24;
  uint64_t v25;

  v25 = *MEMORY[0x24BDAC8D0];
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  -[_EXExtensionIdentity applicationExtensionRecord](self->_identity, "applicationExtensionRecord");
  v4 = objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    v5 = (void *)v4;
    v6 = 0;
  }
  else if (self->_identityUUID)
  {
    v7 = objc_alloc(MEMORY[0x24BDC1528]);
    identityUUID = self->_identityUUID;
    v18 = 0;
    v5 = (void *)objc_msgSend(v7, "initWithUUID:error:", identityUUID, &v18);
    v6 = v18;
  }
  else
  {
    v6 = 0;
    v5 = 0;
  }
  -[_EXExtensionIdentity bundleIdentifier](self->_identity, "bundleIdentifier");
  v9 = objc_claimAutoreleasedReturnValue();
  v10 = (void *)v9;
  if (v5)
    v11 = 1;
  else
    v11 = v9 == 0;
  if (!v11)
  {
    v17 = v6;
    v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDC1528]), "initWithBundleIdentifier:error:", v9, &v17);
    v12 = v17;

    v6 = v12;
  }
  if (!v5)
  {
    LCSLogExtension();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      identity = self->_identity;
      *(_DWORD *)buf = 134218498;
      v20 = self;
      v21 = 2114;
      v22 = identity;
      v23 = 2114;
      v24 = v6;
      _os_log_error_impl(&dword_240B1C000, v13, OS_LOG_TYPE_ERROR, "%p Failure in application extensionRecord for identity %{public}@: %{public}@", buf, 0x20u);
    }

  }
  os_unfair_lock_unlock(p_lock);
  v14 = v5;

  return (LSApplicationExtensionRecord *)v14;
}

- (NSString)bundleIdentifier
{
  return (NSString *)-[_EXExtensionIdentity bundleIdentifier](self->_identity, "bundleIdentifier");
}

- (NSString)containerBundleIdentifier
{
  void *v2;
  void *v3;
  void *v4;

  -[LCSExtension applicationExtensionRecord](self, "applicationExtensionRecord");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "containingBundleRecord");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "bundleIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v4;
}

- (BOOL)isEqual:(id)a3
{
  LCSExtension *v4;
  char v5;

  v4 = (LCSExtension *)a3;
  if (v4 == self)
  {
    v5 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0
      && -[NSUUID isEqual:](self->_identityUUID, "isEqual:", v4->_identityUUID)
      && -[RBSProcessIdentity isEqual:](self->_processIdentity, "isEqual:", v4->_processIdentity)
      && -[_EXHostConfiguration isEqual:](self->_hostConfiguration, "isEqual:", v4->_hostConfiguration))
    {
      v5 = -[_EXExtensionIdentity isEqual:](self->_identity, "isEqual:", v4->_identity);
    }
    else
    {
      v5 = 0;
    }
  }

  return v5;
}

- (_EXExtensionIdentity)identity
{
  return self->_identity;
}

- (RBSProcessIdentity)processIdentity
{
  return self->_processIdentity;
}

- (_EXHostConfiguration)hostConfiguration
{
  return self->_hostConfiguration;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_containerBundleIdentifier, 0);
  objc_storeStrong((id *)&self->_bundleIdentifier, 0);
  objc_storeStrong((id *)&self->_identityUUID, 0);
  objc_storeStrong((id *)&self->_processIdentity, 0);
  objc_storeStrong((id *)&self->_hostConfiguration, 0);
  objc_storeStrong((id *)&self->_identity, 0);
}

- (void)_initWithHostConfiguration:.cold.1()
{
  void *v0;
  SEL v1;
  objc_class *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint8_t v9;

  OUTLINED_FUNCTION_6_0();
  NSStringFromSelector(v1);
  objc_claimAutoreleasedReturnValue();
  v2 = (objc_class *)OUTLINED_FUNCTION_3_0();
  NSStringFromClass(v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_5_0();
  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_1_0(&dword_240B1C000, MEMORY[0x24BDACB70], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);

  OUTLINED_FUNCTION_2_0();
}

- (void)_initWithHostConfiguration:.cold.2()
{
  void *v0;
  SEL v1;
  objc_class *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint8_t v9;

  OUTLINED_FUNCTION_6_0();
  NSStringFromSelector(v1);
  objc_claimAutoreleasedReturnValue();
  v2 = (objc_class *)OUTLINED_FUNCTION_3_0();
  NSStringFromClass(v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_5_0();
  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_1_0(&dword_240B1C000, MEMORY[0x24BDACB70], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);

  OUTLINED_FUNCTION_2_0();
}

- (void)_initWithHostConfiguration:.cold.3()
{
  void *v0;
  SEL v1;
  objc_class *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint8_t v9;

  OUTLINED_FUNCTION_6_0();
  NSStringFromSelector(v1);
  objc_claimAutoreleasedReturnValue();
  v2 = (objc_class *)OUTLINED_FUNCTION_3_0();
  NSStringFromClass(v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_5_0();
  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_1_0(&dword_240B1C000, MEMORY[0x24BDACB70], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);

  OUTLINED_FUNCTION_2_0();
}

- (void)_initWithHostConfiguration:.cold.4()
{
  void *v0;
  SEL v1;
  objc_class *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint8_t v9;

  OUTLINED_FUNCTION_6_0();
  NSStringFromSelector(v1);
  objc_claimAutoreleasedReturnValue();
  v2 = (objc_class *)OUTLINED_FUNCTION_3_0();
  NSStringFromClass(v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_5_0();
  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_1_0(&dword_240B1C000, MEMORY[0x24BDACB70], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);

  OUTLINED_FUNCTION_2_0();
}

+ (void)extensionWithHostConfiguration:.cold.1()
{
  void *v0;
  SEL v1;
  objc_class *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint8_t v9;

  OUTLINED_FUNCTION_6_0();
  NSStringFromSelector(v1);
  objc_claimAutoreleasedReturnValue();
  v2 = (objc_class *)OUTLINED_FUNCTION_3_0();
  NSStringFromClass(v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_5_0();
  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_1_0(&dword_240B1C000, MEMORY[0x24BDACB70], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);

  OUTLINED_FUNCTION_2_0();
}

+ (void)extensionWithHostConfiguration:(uint64_t)a1 .cold.2(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x24BDAC8D0];
  v2 = 138543362;
  v3 = a1;
  _os_log_error_impl(&dword_240B1C000, a2, OS_LOG_TYPE_ERROR, "Failed to lookup processIdentity for %{public}@", (uint8_t *)&v2, 0xCu);
}

+ (void)extensionWithIdentity:.cold.1()
{
  void *v0;
  SEL v1;
  objc_class *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint8_t v9;

  OUTLINED_FUNCTION_6_0();
  NSStringFromSelector(v1);
  objc_claimAutoreleasedReturnValue();
  v2 = (objc_class *)OUTLINED_FUNCTION_3_0();
  NSStringFromClass(v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_1_0(&dword_240B1C000, MEMORY[0x24BDACB70], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);

  OUTLINED_FUNCTION_2_0();
}

@end
