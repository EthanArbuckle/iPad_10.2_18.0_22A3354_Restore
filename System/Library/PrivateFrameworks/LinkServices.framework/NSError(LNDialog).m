@implementation NSError(LNDialog)

- (id)ln_dialog
{
  void *v2;
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  NSObject *v8;
  id v10;
  uint8_t buf[4];
  const __CFString *v12;
  __int16 v13;
  id v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v2 = (void *)MEMORY[0x1E0CB3710];
  v3 = objc_opt_class();
  objc_msgSend(a1, "userInfo");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("LNContextDialogData"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = 0;
  objc_msgSend(v2, "unarchivedObjectOfClass:fromData:error:", v3, v5, &v10);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v10;

  if (v7)
  {
    getLNLogCategoryGeneral();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543618;
      v12 = CFSTR("LNContextDialogData");
      v13 = 2114;
      v14 = v7;
    }

  }
  return v6;
}

@end
