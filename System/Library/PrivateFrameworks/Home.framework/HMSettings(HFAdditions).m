@implementation HMSettings(HFAdditions)

+ (void)hf_resetAllowlists
{
  void *v0;
  void *v1;

  v0 = (void *)_MergedGlobals_310;
  if (_MergedGlobals_310)
  {
    _MergedGlobals_310 = 0;

  }
  v1 = (void *)qword_1ED379CC0;
  if (qword_1ED379CC0)
  {
    qword_1ED379CC0 = 0;

  }
}

+ (id)hf_LoadSettingsAllowlist:()HFAdditions
{
  const __CFString *v6;
  uint64_t *v7;
  id v8;
  void *v9;
  void *v10;
  id v11;
  NSObject *v12;
  NSObject *v13;
  uint64_t *v14;
  void *v15;
  id v17;
  uint8_t buf[4];
  const __CFString *v19;
  __int16 v20;
  id v21;
  __int16 v22;
  id v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  if (a3)
  {
    if (a3 != 1)
    {
      v6 = 0;
LABEL_8:
      objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "URLForResource:withExtension:", v6, CFSTR("plist"));
      v10 = (void *)objc_claimAutoreleasedReturnValue();

      v17 = 0;
      +[HFAccessorySettingsEntity settingsAtURL:error:](HFAccessorySettingsEntity, "settingsAtURL:error:", v10, &v17);
      v8 = (id)objc_claimAutoreleasedReturnValue();
      v11 = v17;
      if (v11 || !v8)
      {
        HFLogForCategory(0);
        v12 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138412546;
          v19 = v6;
          v20 = 2112;
          v21 = v11;
          _os_log_error_impl(&dword_1DD34E000, v12, OS_LOG_TYPE_ERROR, "Error building Settings Allowlist: %@ %@", buf, 0x16u);
        }

      }
      HFLogForCategory(0);
      v13 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138412802;
        v19 = v6;
        v20 = 2112;
        v21 = v8;
        v22 = 2112;
        v23 = v11;
        _os_log_debug_impl(&dword_1DD34E000, v13, OS_LOG_TYPE_DEBUG, "retrieved settings allowlist %@ %@ with error %@", buf, 0x20u);
      }

      if (v8)
      {
        if (a3)
        {
LABEL_17:
          if (a3 != 1)
          {
LABEL_22:

            return v8;
          }
          v14 = &qword_1ED379CC0;
LABEL_21:
          objc_storeStrong((id *)v14, v8);
          goto LABEL_22;
        }
      }
      else
      {
        objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("HMAccessorySettings+HFAdditions.m"), 81, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("currentAllowlist"));

        if (a3)
          goto LABEL_17;
      }
      v14 = &_MergedGlobals_310;
      goto LABEL_21;
    }
    v6 = CFSTR("SettingsAllowlist-User");
    v7 = &qword_1ED379CC0;
  }
  else
  {
    v6 = CFSTR("SettingsAllowlist-HomePod");
    v7 = &_MergedGlobals_310;
  }
  v8 = (id)*v7;
  if (!v8)
    goto LABEL_8;
  return v8;
}

- (uint64_t)hf_codex
{
  void *v0;
  uint64_t v1;

  v0 = (void *)objc_opt_class();
  v1 = objc_msgSend(v0, "isEqual:", objc_opt_class());
  return objc_msgSend((id)objc_opt_class(), "hf_LoadSettingsAllowlist:", v1);
}

- (id)hf_accessorySettingGroupAtKeyPath:()HFAdditions
{
  id v4;
  void *v5;
  void *v6;
  id v7;

  v4 = a3;
  objc_opt_class();
  objc_msgSend(a1, "hf_accessorySettingItemAtKeyPath:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if ((objc_opt_isKindOfClass() & 1) != 0)
    v6 = v5;
  else
    v6 = 0;
  v7 = v6;

  return v7;
}

- (id)hf_accessorySettingAtKeyPath:()HFAdditions
{
  id v4;
  void *v5;
  void *v6;
  id v7;

  v4 = a3;
  objc_opt_class();
  objc_msgSend(a1, "hf_accessorySettingItemAtKeyPath:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if ((objc_opt_isKindOfClass() & 1) != 0)
    v6 = v5;
  else
    v6 = 0;
  v7 = v6;

  return v7;
}

- (id)hf_accessorySettingItemAtKeyPath:()HFAdditions
{
  id v5;
  void *v6;
  void *v7;
  int v8;
  id v9;
  void *v10;
  id v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  __CFString *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  __CFString *v20;
  void *v21;
  uint64_t v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  uint64_t v27;
  void *v29;
  id v30;
  id v31;
  _QWORD v32[4];
  __CFString *v33;
  _QWORD v34[4];
  __CFString *v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  _BYTE v40[128];
  uint64_t v41;

  v41 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("HMAccessorySettings+HFAdditions.m"), 130, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("keyPath"));

  }
  objc_msgSend(a1, "rootGroup");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "keyPath");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "isEqualToString:", v5);

  if (v8)
  {
    v9 = a1;
  }
  else
  {
    v30 = v5;
    objc_msgSend(v5, "componentsSeparatedByString:", CFSTR("."));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1, "rootGroup");
    v11 = (id)objc_claimAutoreleasedReturnValue();
    v36 = 0u;
    v37 = 0u;
    v38 = 0u;
    v39 = 0u;
    v12 = v10;
    v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v36, v40, 16);
    if (v13)
    {
      v14 = v13;
      v15 = 0;
      v16 = *(_QWORD *)v37;
      v17 = MEMORY[0x1E0C809B0];
      v31 = v12;
LABEL_7:
      v18 = 0;
      while (1)
      {
        if (*(_QWORD *)v37 != v16)
          objc_enumerationMutation(v12);
        if (!v11)
          break;
        v19 = *(void **)(*((_QWORD *)&v36 + 1) + 8 * v18);
        if (objc_msgSend(v19, "isEqualToString:", CFSTR("root")))
        {
          v20 = CFSTR("root");

          v15 = v20;
        }
        else
        {
          -[__CFString stringByAppendingFormat:](v15, "stringByAppendingFormat:", CFSTR(".%@"), v19);
          v21 = (void *)objc_claimAutoreleasedReturnValue();

          v22 = v17;
          v23 = (void *)MEMORY[0x1DF0DABF0]();
          objc_msgSend(v11, "settings");
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          v34[0] = v22;
          v34[1] = 3221225472;
          v34[2] = __60__HMSettings_HFAdditions__hf_accessorySettingItemAtKeyPath___block_invoke;
          v34[3] = &unk_1EA72AB68;
          v15 = v21;
          v35 = v15;
          objc_msgSend(v24, "na_firstObjectPassingTest:", v34);
          v9 = (id)objc_claimAutoreleasedReturnValue();

          objc_autoreleasePoolPop(v23);
          if (v9)
          {
            v12 = v31;
            goto LABEL_22;
          }
          v25 = (void *)MEMORY[0x1DF0DABF0]();
          objc_msgSend(v11, "groups");
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          v32[0] = v22;
          v32[1] = 3221225472;
          v32[2] = __60__HMSettings_HFAdditions__hf_accessorySettingItemAtKeyPath___block_invoke_2;
          v32[3] = &unk_1EA73DAA8;
          v15 = v15;
          v33 = v15;
          objc_msgSend(v26, "na_firstObjectPassingTest:", v32);
          v27 = objc_claimAutoreleasedReturnValue();

          objc_autoreleasePoolPop(v25);
          v11 = (id)v27;
          v17 = v22;
          v12 = v31;
        }
        if (v14 == ++v18)
        {
          v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v36, v40, 16);
          if (v14)
            goto LABEL_7;
          goto LABEL_20;
        }
      }
      v9 = 0;
LABEL_22:

      goto LABEL_23;
    }
    v15 = 0;
LABEL_20:

    v11 = v11;
    v9 = v11;
LABEL_23:
    v5 = v30;

  }
  return v9;
}

@end
