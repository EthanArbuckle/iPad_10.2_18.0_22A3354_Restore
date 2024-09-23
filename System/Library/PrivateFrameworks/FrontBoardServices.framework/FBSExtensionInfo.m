@implementation FBSExtensionInfo

- (id)_initWithBundleIdentifier:(id)a3 url:(id)a4
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  objc_class *v11;
  void *v12;
  id result;
  int v14;
  void *v15;
  __int16 v16;
  void *v17;
  __int16 v18;
  FBSExtensionInfo *v19;
  __int16 v20;
  const __CFString *v21;
  __int16 v22;
  int v23;
  __int16 v24;
  void *v25;

  v7 = a3;
  v8 = a4;
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("this is initializer is unavailable"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
  {
    NSStringFromSelector(a2);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = (objc_class *)objc_opt_class();
    NSStringFromClass(v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = 138544642;
    v15 = v10;
    v16 = 2114;
    v17 = v12;
    v18 = 2048;
    v19 = self;
    v20 = 2114;
    v21 = CFSTR("FBSExtensionInfo.m");
    v22 = 1024;
    v23 = 17;
    v24 = 2114;
    v25 = v9;
    _os_log_error_impl(&dword_19A6D4000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", (uint8_t *)&v14, 0x3Au);

  }
  objc_msgSend(objc_retainAutorelease(v9), "UTF8String");
  result = (id)_bs_set_crash_log_message();
  __break(0);
  return result;
}

- (id)_initWithBundleProxy:(id)a3 url:(id)a4
{
  id v7;
  id v8;
  id v9;
  id result;
  void *v11;

  v7 = a3;
  v8 = a4;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v9 = -[FBSExtensionInfo _initWithPlugInKitProxy:](self, "_initWithPlugInKitProxy:", v7);

    return v9;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("proxy must be of type LSPlugInKitProxy : proxy=%@"), v7);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      -[FBSExtensionInfo _initWithBundleProxy:url:].cold.1(a2);
    objc_msgSend(objc_retainAutorelease(v11), "UTF8String");
    result = (id)_bs_set_crash_log_message();
    __break(0);
  }
  return result;
}

- (id)_initWithPlugInKitProxy:(id)a3
{
  id v5;
  void *v6;
  _QWORD *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  id result;
  void *v15;
  objc_super v16;

  v5 = a3;
  if (v5)
  {
    v6 = v5;
    v16.receiver = self;
    v16.super_class = (Class)FBSExtensionInfo;
    v7 = -[FBSBundleInfo _initWithBundleProxy:overrideURL:](&v16, sel__initWithBundleProxy_overrideURL_, v5, 0);
    if (v7)
    {
      objc_msgSend(v6, "protocol");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = objc_msgSend(v8, "copy");
      v10 = (void *)v7[8];
      v7[8] = v9;

      objc_msgSend(v6, "pluginIdentifier");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = objc_msgSend(v11, "copy");
      v13 = (void *)v7[9];
      v7[9] = v12;

    }
    return v7;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("proxy"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      -[FBSExtensionInfo _initWithPlugInKitProxy:].cold.1(a2);
    objc_msgSend(objc_retainAutorelease(v15), "UTF8String");
    result = (id)_bs_set_crash_log_message();
    __break(0);
  }
  return result;
}

- (NSString)typeIdentifier
{
  return self->_typeIdentifier;
}

- (NSString)extensionIdentifier
{
  return self->_extensionIdentifier;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_extensionIdentifier, 0);
  objc_storeStrong((id *)&self->_typeIdentifier, 0);
}

- (void)_initWithBundleProxy:(const char *)a1 url:.cold.1(const char *a1)
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
  OUTLINED_FUNCTION_1(&dword_19A6D4000, MEMORY[0x1E0C81028], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);

  OUTLINED_FUNCTION_2();
}

- (void)_initWithPlugInKitProxy:(const char *)a1 .cold.1(const char *a1)
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
  OUTLINED_FUNCTION_1(&dword_19A6D4000, MEMORY[0x1E0C81028], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);

  OUTLINED_FUNCTION_2();
}

@end
