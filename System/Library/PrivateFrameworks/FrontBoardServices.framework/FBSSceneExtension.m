@implementation FBSSceneExtension

+ (void)initialize
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  NSStringFromClass(a1);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_15(&dword_19A6D4000, v2, v3, "Soft-linking extensions are only supported on internal installs: \"%{public}@\", v4, v5, v6, v7, 2u);

  OUTLINED_FUNCTION_20();
}

+ (BOOL)softLinkExtensionFrameworkInClient
{
  return 0;
}

+ (id)transitionContextExtensions
{
  return 0;
}

+ (id)clientSettingsExtensions
{
  return 0;
}

+ (id)settingsExtensions
{
  return 0;
}

id __31__FBSSceneExtension_initialize__block_invoke(uint64_t a1)
{
  return (id)objc_msgSend(*(id *)(a1 + 32), "_frameworkNameLoadingIfNeeded:", 1);
}

+ (id)alloc
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  objc_class *v8;
  void *v9;
  id result;
  uint8_t buf[4];
  void *v12;
  __int16 v13;
  void *v14;
  __int16 v15;
  id v16;
  __int16 v17;
  const __CFString *v18;
  __int16 v19;
  int v20;
  __int16 v21;
  void *v22;

  v4 = (void *)MEMORY[0x1E0CB3940];
  NSStringFromClass((Class)a1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "stringWithFormat:", CFSTR("%@ is not intended to be instantiated"), v5);
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
    v16 = a1;
    v17 = 2114;
    v18 = CFSTR("FBSSceneExtension.m");
    v19 = 1024;
    v20 = 220;
    v21 = 2114;
    v22 = v6;
    _os_log_error_impl(&dword_19A6D4000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", buf, 0x3Au);

  }
  objc_msgSend(objc_retainAutorelease(v6), "UTF8String");
  result = (id)_bs_set_crash_log_message();
  __break(0);
  return result;
}

+ (id)hostComponents
{
  return 0;
}

+ (id)clientComponents
{
  return 0;
}

+ (BOOL)propagateToSceneWithDefinition:(id)a3
{
  return 0;
}

+ (id)_frameworkNameLoadingIfNeeded:(BOOL)a3
{
  _BOOL4 v3;
  __CFString *v5;
  BOOL v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  __CFString *v12;

  v3 = a3;
  os_unfair_lock_lock((os_unfair_lock_t)&_frameworkNameLoadingIfNeeded____Lock);
  objc_getAssociatedObject(a1, (const void *)_FBSFrameworkKey);
  v5 = (__CFString *)objc_claimAutoreleasedReturnValue();
  if (v5)
    v6 = 1;
  else
    v6 = !v3;
  if (!v6)
  {
    v7 = (void *)MEMORY[0x19AECA15C]();
    os_unfair_lock_unlock((os_unfair_lock_t)&_frameworkNameLoadingIfNeeded____Lock);
    objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", a1);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "executablePath");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "lastPathComponent");
    v10 = objc_claimAutoreleasedReturnValue();
    v11 = (void *)v10;
    v12 = CFSTR("(unknown)");
    if (v10)
      v12 = (__CFString *)v10;
    v5 = v12;

    os_unfair_lock_lock((os_unfair_lock_t)&_frameworkNameLoadingIfNeeded____Lock);
    objc_setAssociatedObject(a1, (const void *)_FBSFrameworkKey, v5, (void *)1);
    objc_autoreleasePoolPop(v7);
  }
  os_unfair_lock_unlock((os_unfair_lock_t)&_frameworkNameLoadingIfNeeded____Lock);
  return v5;
}

+ (id)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  objc_msgSend(a1, "_frameworkNameLoadingIfNeeded:", 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    v4 = (void *)MEMORY[0x1E0CB3940];
    NSStringFromClass((Class)a1);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "stringWithFormat:", CFSTR("%@ (%@)"), v5, v3);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    NSStringFromClass((Class)a1);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v6;
}

@end
