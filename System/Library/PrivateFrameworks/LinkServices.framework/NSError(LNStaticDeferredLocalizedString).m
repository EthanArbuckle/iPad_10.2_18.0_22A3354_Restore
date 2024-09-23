@implementation NSError(LNStaticDeferredLocalizedString)

- (id)ln_staticDeferredLocalizedString
{
  void *v2;
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  NSObject *v10;
  id v12;
  uint8_t buf[4];
  const __CFString *v14;
  __int16 v15;
  id v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a1, "userInfo");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKeyedSubscript:", CFSTR("LNPerformActionErrorLocalizedStringResourceData"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    v4 = (void *)MEMORY[0x1E0CB3710];
    v5 = objc_opt_class();
    objc_msgSend(a1, "userInfo");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("LNPerformActionErrorLocalizedStringResourceData"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = 0;
    objc_msgSend(v4, "unarchivedObjectOfClass:fromData:error:", v5, v7, &v12);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = v12;

    if (v9)
    {
      getLNLogCategoryGeneral();
      v10 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138543618;
        v14 = CFSTR("LNPerformActionErrorLocalizedStringResourceData");
        v15 = 2114;
        v16 = v9;
      }

    }
  }
  else
  {
    v8 = 0;
  }
  return v8;
}

@end
