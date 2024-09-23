@implementation FBSSceneClientIdentity

- (BOOL)isLocal
{
  return self->_local;
}

- (id)bundleIdentifier
{
  void *v2;
  void *v3;

  -[FBSSceneClientIdentity processIdentity](self, "processIdentity");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "embeddedApplicationIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (RBSProcessIdentity)processIdentity
{
  return self->_processIdentity;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_processIdentity, 0);
  objc_storeStrong((id *)&self->_description, 0);
}

- (BOOL)isValid
{
  return self->_local || self->_processIdentity != 0;
}

+ (id)identityForProcessIdentity:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  int v6;
  void *v7;
  id result;
  void *v9;

  v3 = a3;
  if (v3)
  {
    v4 = v3;
    objc_msgSend(MEMORY[0x1E0D87D80], "identityOfCurrentProcess");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v4, "isEqual:", v5);

    if (v6)
      +[FBSSceneClientIdentity localIdentity](FBSSceneClientIdentity, "localIdentity");
    else
      +[FBSSceneClientIdentity defaultIdentityForProcessIdentity:](FBSSceneClientIdentity, "defaultIdentityForProcessIdentity:", v4);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    return v7;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("processIdentity"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      +[FBSSceneClientIdentity identityForProcessIdentity:].cold.1();
    objc_msgSend(objc_retainAutorelease(v9), "UTF8String");
    result = (id)_bs_set_crash_log_message();
    __break(0);
  }
  return result;
}

+ (id)localIdentity
{
  FBSSceneClientIdentity *v2;
  void *v3;
  id v4;

  v2 = [FBSSceneClientIdentity alloc];
  objc_msgSend(MEMORY[0x1E0D87D80], "identityOfCurrentProcess");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = -[FBSSceneClientIdentity _initWithLocal:direct:identity:description:](v2, "_initWithLocal:direct:identity:description:", 1, 0, v3, 0);

  return v4;
}

+ (id)identityForBundleID:(id)a3
{
  id v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v9;

  v3 = a3;
  if (!v3)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("bundleID"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      +[FBSSceneClientIdentity identityForBundleID:].cold.1();
LABEL_9:
    objc_msgSend(objc_retainAutorelease(v9), "UTF8String");
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x19A73EA8CLL);
  }
  v4 = v3;
  objc_msgSend(MEMORY[0x1E0D87D80], "identityForEmbeddedApplicationIdentifier:", v3);
  v5 = objc_claimAutoreleasedReturnValue();
  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("failed to get an RBSProcessIdentity for bundleID=%@"), v4);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      +[FBSSceneClientIdentity identityForBundleID:].cold.2();
    goto LABEL_9;
  }
  v6 = (void *)v5;
  +[FBSSceneClientIdentity identityForProcessIdentity:](FBSSceneClientIdentity, "identityForProcessIdentity:", v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

+ (id)defaultIdentityForProcessIdentity:(id)a3
{
  return +[FBSSceneClientIdentity identityForInjectedEndpointToProcessIdentity:](FBSSceneClientIdentity, "identityForInjectedEndpointToProcessIdentity:", a3);
}

+ (id)identityForInjectedEndpointToProcessIdentity:(id)a3
{
  id v3;
  void *v4;
  id v5;
  id result;
  void *v7;

  v3 = a3;
  if (v3)
  {
    v4 = v3;
    v5 = -[FBSSceneClientIdentity _initWithLocal:direct:identity:description:]([FBSSceneClientIdentity alloc], "_initWithLocal:direct:identity:description:", 0, 0, v3, 0);

    return v5;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("processIdentity"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      +[FBSSceneClientIdentity identityForInjectedEndpointToProcessIdentity:].cold.1();
    objc_msgSend(objc_retainAutorelease(v7), "UTF8String");
    result = (id)_bs_set_crash_log_message();
    __break(0);
  }
  return result;
}

+ (id)identityForManagedEndpointOfProcessIdentity:(id)a3
{
  id v3;
  void *v4;
  id v5;
  id result;
  void *v7;

  v3 = a3;
  if (v3)
  {
    v4 = v3;
    v5 = -[FBSSceneClientIdentity _initWithLocal:direct:identity:description:]([FBSSceneClientIdentity alloc], "_initWithLocal:direct:identity:description:", 0, 1, v3, 0);

    return v5;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("processIdentity"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      +[FBSSceneClientIdentity identityForManagedEndpointOfProcessIdentity:].cold.1();
    objc_msgSend(objc_retainAutorelease(v7), "UTF8String");
    result = (id)_bs_set_crash_log_message();
    __break(0);
  }
  return result;
}

- (id)_initWithLocal:(BOOL)a3 direct:(BOOL)a4 identity:(id)a5 description:(id)a6
{
  id v11;
  id v12;
  FBSSceneClientIdentity *v13;
  FBSSceneClientIdentity *v14;
  id *p_processIdentity;
  uint64_t *p_description;
  void *description;
  void *v18;
  uint64_t v19;
  void *v20;
  uint64_t v21;
  objc_super v23;

  v11 = a5;
  v12 = a6;
  v23.receiver = self;
  v23.super_class = (Class)FBSSceneClientIdentity;
  v13 = -[FBSSceneClientIdentity init](&v23, sel_init);
  v14 = v13;
  if (v13)
  {
    v13->_local = a3;
    v13->_direct = a4;
    p_processIdentity = (id *)&v13->_processIdentity;
    objc_storeStrong((id *)&v13->_processIdentity, a5);
    p_description = (uint64_t *)&v14->_description;
    objc_storeStrong((id *)&v14->_description, a6);
    description = v14->_description;
    if (!description)
    {
      if (v14->_local)
      {
        *p_description = (uint64_t)CFSTR("local-sync");
      }
      else if (v14->_direct)
      {
        v18 = (void *)MEMORY[0x1E0CB3940];
        objc_msgSend(*p_processIdentity, "description");
        description = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v18, "stringWithFormat:", CFSTR("%@:%@"), description, CFSTR("com.apple.frontboard.workspace-service"));
        v19 = objc_claimAutoreleasedReturnValue();
        v20 = (void *)*p_description;
        *p_description = v19;

      }
      else
      {
        objc_msgSend(*p_processIdentity, "description");
        v21 = objc_claimAutoreleasedReturnValue();
        description = (void *)*p_description;
        *p_description = v21;
      }

    }
  }

  return v14;
}

- (NSString)description
{
  return self->_description;
}

- (BOOL)isEqual:(id)a3
{
  FBSSceneClientIdentity *v4;
  uint64_t v5;
  char v6;

  v4 = (FBSSceneClientIdentity *)a3;
  if (self == v4)
  {
    v6 = 1;
  }
  else
  {
    v5 = objc_opt_class();
    if (v5 == objc_opt_class() && BSEqualBools() && BSEqualBools())
      v6 = BSEqualObjects();
    else
      v6 = 0;
  }

  return v6;
}

- (unint64_t)hash
{
  void *v2;
  unint64_t v3;

  -[FBSSceneClientIdentity description](self, "description");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "hash");

  return v3;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  v5 = v4;
  if (self->_local)
  {
    objc_msgSend(v4, "encodeBool:forKey:", 1, CFSTR("local"));
    v4 = v5;
  }
  if (self->_direct)
  {
    objc_msgSend(v5, "encodeBool:forKey:", 1, CFSTR("direct"));
    v4 = v5;
  }
  objc_msgSend(v4, "encodeObject:forKey:", self->_processIdentity, CFSTR("identity"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_description, CFSTR("desc"));

}

- (FBSSceneClientIdentity)initWithCoder:(id)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  void *v8;
  FBSSceneClientIdentity *v9;

  v4 = a3;
  v5 = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("local"));
  v6 = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("direct"));
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("identity"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("desc"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = -[FBSSceneClientIdentity _initWithLocal:direct:identity:description:](self, "_initWithLocal:direct:identity:description:", v5, v6, v7, v8);
  return v9;
}

- (BOOL)targetsClientEndpoint
{
  return self->_direct;
}

+ (void)identityForBundleID:.cold.1()
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

  OUTLINED_FUNCTION_24();
  NSStringFromSelector(v1);
  objc_claimAutoreleasedReturnValue();
  v2 = (objc_class *)OUTLINED_FUNCTION_3();
  NSStringFromClass(v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_18();
  OUTLINED_FUNCTION_17();
  OUTLINED_FUNCTION_1(&dword_19A6D4000, MEMORY[0x1E0C81028], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);

  OUTLINED_FUNCTION_2();
}

+ (void)identityForBundleID:.cold.2()
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

  OUTLINED_FUNCTION_24();
  NSStringFromSelector(v1);
  objc_claimAutoreleasedReturnValue();
  v2 = (objc_class *)OUTLINED_FUNCTION_3();
  NSStringFromClass(v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_18();
  OUTLINED_FUNCTION_17();
  OUTLINED_FUNCTION_1(&dword_19A6D4000, MEMORY[0x1E0C81028], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);

  OUTLINED_FUNCTION_2();
}

+ (void)identityForProcessIdentity:.cold.1()
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

  OUTLINED_FUNCTION_24();
  NSStringFromSelector(v1);
  objc_claimAutoreleasedReturnValue();
  v2 = (objc_class *)OUTLINED_FUNCTION_3();
  NSStringFromClass(v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_18();
  OUTLINED_FUNCTION_17();
  OUTLINED_FUNCTION_1(&dword_19A6D4000, MEMORY[0x1E0C81028], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);

  OUTLINED_FUNCTION_2();
}

+ (void)identityForInjectedEndpointToProcessIdentity:.cold.1()
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

  OUTLINED_FUNCTION_24();
  NSStringFromSelector(v1);
  objc_claimAutoreleasedReturnValue();
  v2 = (objc_class *)OUTLINED_FUNCTION_3();
  NSStringFromClass(v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_18();
  OUTLINED_FUNCTION_17();
  OUTLINED_FUNCTION_1(&dword_19A6D4000, MEMORY[0x1E0C81028], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);

  OUTLINED_FUNCTION_2();
}

+ (void)identityForManagedEndpointOfProcessIdentity:.cold.1()
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

  OUTLINED_FUNCTION_24();
  NSStringFromSelector(v1);
  objc_claimAutoreleasedReturnValue();
  v2 = (objc_class *)OUTLINED_FUNCTION_3();
  NSStringFromClass(v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_18();
  OUTLINED_FUNCTION_17();
  OUTLINED_FUNCTION_1(&dword_19A6D4000, MEMORY[0x1E0C81028], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);

  OUTLINED_FUNCTION_2();
}

@end
