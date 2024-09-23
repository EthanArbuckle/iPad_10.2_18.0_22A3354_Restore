@implementation FBSBundleInfo

- (NSString)bundleVersion
{
  return self->_bundleVersion;
}

- (NSURL)bundleURL
{
  return self->_bundleURL;
}

- (NSString)bundleIdentifier
{
  return self->_bundleIdentifier;
}

- (unint64_t)sequenceNumber
{
  return self->_sequenceNumber;
}

- (NSUUID)cacheGUID
{
  return self->_cacheGUID;
}

- (FBSBundleInfo)init
{
  return (FBSBundleInfo *)-[FBSBundleInfo _initWithBundleProxy:bundleIdentifier:url:](self, "_initWithBundleProxy:bundleIdentifier:url:", 0, 0, 0);
}

- (id)_initWithBundleIdentifier:(id)a3 url:(id)a4
{
  return -[FBSBundleInfo _initWithBundleProxy:bundleIdentifier:url:](self, "_initWithBundleProxy:bundleIdentifier:url:", 0, a3, a4);
}

- (id)_initWithBundleProxy:(id)a3 overrideURL:(id)a4
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  id result;
  void *v14;

  v7 = a3;
  v8 = a4;
  if (v7)
  {
    v9 = v8;
    objc_msgSend(v7, "bundleIdentifier");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if (v9)
    {
      v11 = -[FBSBundleInfo _initWithBundleProxy:bundleIdentifier:url:](self, "_initWithBundleProxy:bundleIdentifier:url:", v7, v10, v9);
    }
    else
    {
      objc_msgSend(v7, "bundleURL");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = -[FBSBundleInfo _initWithBundleProxy:bundleIdentifier:url:](self, "_initWithBundleProxy:bundleIdentifier:url:", v7, v10, v12);

    }
    return v11;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("proxy"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      -[FBSBundleInfo _initWithBundleProxy:overrideURL:].cold.1(a2);
    objc_msgSend(objc_retainAutorelease(v14), "UTF8String");
    result = (id)_bs_set_crash_log_message();
    __break(0);
  }
  return result;
}

- (id)_initWithBundleProxy:(id)a3 bundleIdentifier:(id)a4 url:(id)a5
{
  id v9;
  id v10;
  id v11;
  void *v12;
  FBSBundleInfo *v13;
  uint64_t v14;
  NSString *bundleIdentifier;
  uint64_t v16;
  NSURL *bundleURL;
  void *v18;
  uint64_t v19;
  NSString *displayName;
  void *v21;
  uint64_t v22;
  NSString *bundleVersion;
  void *v24;
  uint64_t v25;
  NSString *bundleType;
  void *v27;
  uint64_t v28;
  NSUUID *cacheGUID;
  void *v31;
  objc_super v32;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  if (!v10)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("bundleIdentifier"));
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      -[FBSBundleInfo _initWithBundleProxy:bundleIdentifier:url:].cold.1(a2);
LABEL_11:
    objc_msgSend(objc_retainAutorelease(v31), "UTF8String");
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x19A72592CLL);
  }
  v12 = v11;
  if (!v11)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("bundleURL"));
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      -[FBSBundleInfo _initWithBundleProxy:bundleIdentifier:url:].cold.2(a2);
    goto LABEL_11;
  }
  v32.receiver = self;
  v32.super_class = (Class)FBSBundleInfo;
  v13 = -[FBSBundleInfo init](&v32, sel_init);
  if (v13)
  {
    v14 = objc_msgSend(v10, "copy");
    bundleIdentifier = v13->_bundleIdentifier;
    v13->_bundleIdentifier = (NSString *)v14;

    v16 = objc_msgSend(v12, "copy");
    bundleURL = v13->_bundleURL;
    v13->_bundleURL = (NSURL *)v16;

    objc_msgSend(v9, "localizedName");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = objc_msgSend(v18, "copy");
    displayName = v13->_displayName;
    v13->_displayName = (NSString *)v19;

    objc_msgSend(v9, "bundleVersion");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = objc_msgSend(v21, "copy");
    bundleVersion = v13->_bundleVersion;
    v13->_bundleVersion = (NSString *)v22;

    objc_msgSend(v9, "bundleType");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v25 = objc_msgSend(v24, "copy");
    bundleType = v13->_bundleType;
    v13->_bundleType = (NSString *)v25;

    v13->_sequenceNumber = objc_msgSend(v9, "sequenceNumber");
    objc_msgSend(v9, "cacheGUID");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    v28 = objc_msgSend(v27, "copy");
    cacheGUID = v13->_cacheGUID;
    v13->_cacheGUID = (NSUUID *)v28;

  }
  return v13;
}

- (id)applicationIdentity
{
  void *v4;
  void *v5;
  objc_class *v6;
  void *v7;
  id result;
  int v9;
  void *v10;
  __int16 v11;
  void *v12;
  __int16 v13;
  FBSBundleInfo *v14;
  __int16 v15;
  const __CFString *v16;
  __int16 v17;
  int v18;
  __int16 v19;
  void *v20;

  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Must be implemented by subclass"));
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
    v16 = CFSTR("FBSBundleInfo.m");
    v17 = 1024;
    v18 = 76;
    v19 = 2114;
    v20 = v4;
    _os_log_error_impl(&dword_19A6D4000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", (uint8_t *)&v9, 0x3Au);

  }
  objc_msgSend(objc_retainAutorelease(v4), "UTF8String");
  result = (id)_bs_set_crash_log_message();
  __break(0);
  return result;
}

- (NSString)debugDescription
{
  return (NSString *)-[FBSBundleInfo descriptionWithMultilinePrefix:](self, "descriptionWithMultilinePrefix:", 0);
}

- (id)succinctDescription
{
  void *v2;
  void *v3;

  -[FBSBundleInfo succinctDescriptionBuilder](self, "succinctDescriptionBuilder");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "build");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)succinctDescriptionBuilder
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  objc_msgSend(off_1E38E9DF0, "builderWithObject:", self);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)MEMORY[0x1E0CB3940];
  -[FBSBundleInfo bundleIdentifier](self, "bundleIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[FBSBundleInfo displayName](self, "displayName");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "stringWithFormat:", CFSTR("%@ (%@)"), v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (id)objc_msgSend(v3, "appendObject:withName:", v7, 0);

  return v3;
}

- (id)descriptionWithMultilinePrefix:(id)a3
{
  void *v3;
  void *v4;

  -[FBSBundleInfo descriptionBuilderWithMultilinePrefix:](self, "descriptionBuilderWithMultilinePrefix:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "build");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (NSString)bundleType
{
  return self->_bundleType;
}

- (NSString)displayName
{
  return self->_displayName;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cacheGUID, 0);
  objc_storeStrong((id *)&self->_bundleURL, 0);
  objc_storeStrong((id *)&self->_bundleType, 0);
  objc_storeStrong((id *)&self->_bundleVersion, 0);
  objc_storeStrong((id *)&self->_bundleIdentifier, 0);
  objc_storeStrong((id *)&self->_displayName, 0);
}

- (void)_initWithBundleProxy:(const char *)a1 overrideURL:.cold.1(const char *a1)
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
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_18();
  OUTLINED_FUNCTION_17();
  OUTLINED_FUNCTION_1(&dword_19A6D4000, MEMORY[0x1E0C81028], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);

  OUTLINED_FUNCTION_2();
}

- (void)_initWithBundleProxy:(const char *)a1 bundleIdentifier:url:.cold.1(const char *a1)
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
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_18();
  OUTLINED_FUNCTION_17();
  OUTLINED_FUNCTION_1(&dword_19A6D4000, MEMORY[0x1E0C81028], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);

  OUTLINED_FUNCTION_2();
}

- (void)_initWithBundleProxy:(const char *)a1 bundleIdentifier:url:.cold.2(const char *a1)
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
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_18();
  OUTLINED_FUNCTION_17();
  OUTLINED_FUNCTION_1(&dword_19A6D4000, MEMORY[0x1E0C81028], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);

  OUTLINED_FUNCTION_2();
}

@end
