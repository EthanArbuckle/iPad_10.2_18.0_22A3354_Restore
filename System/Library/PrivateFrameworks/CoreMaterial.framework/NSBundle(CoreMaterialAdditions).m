@implementation NSBundle(CoreMaterialAdditions)

+ (id)coreMaterialOverrideRecipeBundleURL
{
  void *v0;
  void *v1;

  _MTGetCoreMaterialPlatformConfiguration();
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "overrideRecipeBundleURL");
  v1 = (void *)objc_claimAutoreleasedReturnValue();

  return v1;
}

+ (id)coreMaterialOverrideRecipeBundle
{
  uint64_t v1;
  void *v2;
  uint64_t v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  v1 = __coreMaterialOverrideRecipeBundle;
  if (!__coreMaterialOverrideRecipeBundle)
  {
    objc_msgSend(a1, "coreMaterialOverrideRecipeBundleURL");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    if (v2)
    {
      objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithURL:", v2);
      v3 = objc_claimAutoreleasedReturnValue();
      v4 = (void *)__coreMaterialOverrideRecipeBundle;
      __coreMaterialOverrideRecipeBundle = v3;

    }
    if (!__coreMaterialOverrideRecipeBundle)
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v5 = objc_claimAutoreleasedReturnValue();
      v6 = (void *)__coreMaterialOverrideRecipeBundle;
      __coreMaterialOverrideRecipeBundle = v5;

    }
    v1 = __coreMaterialOverrideRecipeBundle;
  }
  objc_msgSend(MEMORY[0x1E0C99E38], "null");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if ((void *)v1 == v7)
    v8 = 0;
  else
    v8 = (void *)__coreMaterialOverrideRecipeBundle;
  v9 = v8;

  return v9;
}

+ (void)_setCoreMaterialOverrideRecipeBundleURL:()CoreMaterialAdditions
{
  uint64_t v3;
  void *v4;
  uint64_t v5;
  char v6;
  NSObject *v7;
  void *v8;
  int v9;
  uint64_t v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  MTRegisterCoreMaterialLogging();
  _MTGetCoreMaterialPlatformConfiguration();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "overrideRecipeBundleURL");
  v5 = objc_claimAutoreleasedReturnValue();
  if (v3 | v5 && (objc_msgSend((id)v3, "isEqual:", v5) & 1) == 0)
  {
    v6 = objc_opt_respondsToSelector();
    v7 = MTLogConfiguration;
    if ((v6 & 1) != 0)
    {
      if (os_log_type_enabled((os_log_t)MTLogConfiguration, OS_LOG_TYPE_DEFAULT))
      {
        v9 = 138543362;
        v10 = v3;
        _os_log_impl(&dword_1AAB41000, v7, OS_LOG_TYPE_DEFAULT, "Updating CoreMaterial override recipe bundle URL: %{public}@", (uint8_t *)&v9, 0xCu);
      }
      objc_msgSend(v4, "setOverrideRecipeBundleURL:", v3);
      v8 = (void *)__coreMaterialOverrideRecipeBundle;
      __coreMaterialOverrideRecipeBundle = 0;

    }
    else if (os_log_type_enabled((os_log_t)MTLogConfiguration, OS_LOG_TYPE_ERROR))
    {
      +[NSBundle(CoreMaterialAdditions) _setCoreMaterialOverrideRecipeBundleURL:].cold.1(v3, (uint64_t)v4, v7);
    }
  }

}

+ (void)_setCoreMaterialOverrideRecipeBundleURL:()CoreMaterialAdditions .cold.1(uint64_t a1, uint64_t a2, os_log_t log)
{
  int v3;
  uint64_t v4;
  __int16 v5;
  uint64_t v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  v3 = 138543618;
  v4 = a1;
  v5 = 2114;
  v6 = a2;
  _os_log_error_impl(&dword_1AAB41000, log, OS_LOG_TYPE_ERROR, "Attempt to override recipe bundle URL (%{public}@) not supported by platform configuration: %{public}@", (uint8_t *)&v3, 0x16u);
}

@end
