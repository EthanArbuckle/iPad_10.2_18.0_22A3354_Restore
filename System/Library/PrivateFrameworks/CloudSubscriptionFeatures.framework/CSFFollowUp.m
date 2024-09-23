@implementation CSFFollowUp

+ (NSUserDefaults)defaults
{
  return (NSUserDefaults *)(id)objc_msgSend(objc_alloc(MEMORY[0x1E0C99EA0]), "initWithSuiteName:", CFSTR("com.apple.CloudSubscriptionFeatures.followup.engagement"));
}

+ (BOOL)hasDSID
{
  void *v2;
  void *v3;
  void *v4;
  BOOL v5;

  objc_msgSend(MEMORY[0x1E0C8F2C0], "defaultStore");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "aa_primaryAppleAccount");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "aa_personID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4 != 0;

  return v5;
}

+ (NSString)userDefaultsKey
{
  void *v2;
  void *v3;
  void *v4;
  __CFString *v5;

  objc_msgSend(MEMORY[0x1E0C8F2C0], "defaultStore");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "aa_primaryAppleAccount");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "aa_personID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("hasEngaged.%@"), v4);
    v5 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v5 = CFSTR("hasEngaged.device");
  }

  return (NSString *)v5;
}

+ (BOOL)hasEngagedWithCFU
{
  void *v2;
  id v3;
  NSObject *v4;
  NSObject *v5;
  BOOL v6;
  BOOL v7;
  _BOOL4 v8;
  const char *v9;
  NSObject *v10;
  void *v11;
  _BOOL4 v12;
  _BOOL4 v13;
  int v15;
  NSObject *v16;
  __int16 v17;
  void *v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  +[CSFFollowUp hasEngagedWithCFUDate](CSFFollowUp, "hasEngagedWithCFUDate");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v2)
  {
    v7 = +[CSFFollowUp hasDSID](CSFFollowUp, "hasDSID");
    _CSFGetLogSystem();
    v4 = objc_claimAutoreleasedReturnValue();
    v8 = os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT);
    if (v7)
    {
      if (v8)
      {
        LOWORD(v15) = 0;
        v9 = "No existing value for hasEngagedWithCFU. Returning NO.";
LABEL_16:
        _os_log_impl(&dword_1A5B4D000, v4, OS_LOG_TYPE_DEFAULT, v9, (uint8_t *)&v15, 2u);
      }
    }
    else
    {
      if (v8)
      {
        +[CSFFollowUp userDefaultsKey](CSFFollowUp, "userDefaultsKey");
        v10 = objc_claimAutoreleasedReturnValue();
        +[CSFFollowUp persistentDomain](CSFFollowUp, "persistentDomain");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v15 = 138412546;
        v16 = v10;
        v17 = 2112;
        v18 = v11;
        _os_log_impl(&dword_1A5B4D000, v4, OS_LOG_TYPE_DEFAULT, "No existing value for key %@ (no DSID included). Checking if any users have seen the CFU in persistent domain %@.", (uint8_t *)&v15, 0x16u);

      }
      v12 = +[CSFFollowUp anyUserHasEngagedWithCFU](CSFFollowUp, "anyUserHasEngagedWithCFU");
      _CSFGetLogSystem();
      v4 = objc_claimAutoreleasedReturnValue();
      v13 = os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT);
      if (v12)
      {
        if (v13)
        {
          LOWORD(v15) = 0;
          _os_log_impl(&dword_1A5B4D000, v4, OS_LOG_TYPE_DEFAULT, "Previous DSID has engaged with CFU. Returning YES.", (uint8_t *)&v15, 2u);
        }
        goto LABEL_5;
      }
      if (v13)
      {
        LOWORD(v15) = 0;
        v9 = "No user on this device has ever engaged with CFU. Returning NO.";
        goto LABEL_16;
      }
    }
    v6 = 0;
    goto LABEL_18;
  }
  v3 = objc_alloc_init(MEMORY[0x1E0CB36A8]);
  objc_msgSend(v3, "stringFromDate:", v2);
  v4 = objc_claimAutoreleasedReturnValue();

  _CSFGetLogSystem();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v15 = 138412290;
    v16 = v4;
    _os_log_impl(&dword_1A5B4D000, v5, OS_LOG_TYPE_DEFAULT, "User has engaged with CFU? YES - on Date %@", (uint8_t *)&v15, 0xCu);
  }

LABEL_5:
  v6 = 1;
LABEL_18:

  return v6;
}

+ (void)setHasEngagedWithCFU:(BOOL)a3
{
  id v4;

  objc_msgSend(MEMORY[0x1E0C99D68], "now", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "setHasEngagedWithCFUDate:", v4);

}

+ (NSDate)hasEngagedWithCFUDate
{
  void *v2;
  void *v3;
  void *v4;
  id v5;
  NSObject *v6;
  void *v7;
  NSObject *v8;
  int v10;
  void *v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  +[CSFFollowUp defaults](CSFFollowUp, "defaults");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  +[CSFFollowUp userDefaultsKey](CSFFollowUp, "userDefaultsKey");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKey:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v4)
  {
    _CSFGetLogSystem();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      +[CSFFollowUp userDefaultsKey](CSFFollowUp, "userDefaultsKey");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = 138412290;
      v11 = v7;
      _os_log_impl(&dword_1A5B4D000, v6, OS_LOG_TYPE_DEFAULT, "No existing value for key %@, returning nil.", (uint8_t *)&v10, 0xCu);

    }
    goto LABEL_10;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    _CSFGetLogSystem();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v10) = 0;
      _os_log_impl(&dword_1A5B4D000, v8, OS_LOG_TYPE_DEFAULT, "Existing value is not NSDate. Resetting to nil.", (uint8_t *)&v10, 2u);
    }

    +[CSFFollowUp setHasEngagedWithCFU:](CSFFollowUp, "setHasEngagedWithCFU:", 0);
LABEL_10:
    v5 = 0;
    goto LABEL_11;
  }
  v5 = v4;
LABEL_11:

  return (NSDate *)v5;
}

+ (void)setHasEngagedWithCFUDate:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;
  NSObject *v8;
  void *v9;
  int v10;
  void *v11;
  __int16 v12;
  void *v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  +[CSFFollowUp defaults](CSFFollowUp, "defaults");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  +[CSFFollowUp userDefaultsKey](CSFFollowUp, "userDefaultsKey");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKey:", v3, v5);

  v6 = objc_alloc_init(MEMORY[0x1E0CB36A8]);
  objc_msgSend(v6, "stringFromDate:", v3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  _CSFGetLogSystem();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    +[CSFFollowUp userDefaultsKey](CSFFollowUp, "userDefaultsKey");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = 138412546;
    v11 = v9;
    v12 = 2112;
    v13 = v7;
    _os_log_impl(&dword_1A5B4D000, v8, OS_LOG_TYPE_DEFAULT, "Set hasEngagedWithCFUDate (key %@) to value: %@", (uint8_t *)&v10, 0x16u);

  }
}

+ (BOOL)anyUserHasEngagedWithCFU
{
  void *v2;
  void *v3;
  NSObject *v4;
  uint64_t v5;
  NSObject *i;
  uint64_t v7;
  void *v8;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  uint8_t buf[4];
  uint64_t v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  +[CSFFollowUp persistentDomain](CSFFollowUp, "persistentDomain");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  objc_msgSend(v2, "allKeys", 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v10, v16, 16);
  if (v4)
  {
    v5 = *(_QWORD *)v11;
    while (2)
    {
      for (i = 0; i != v4; i = ((char *)i + 1))
      {
        if (*(_QWORD *)v11 != v5)
          objc_enumerationMutation(v3);
        v7 = *(_QWORD *)(*((_QWORD *)&v10 + 1) + 8 * (_QWORD)i);
        objc_msgSend(v2, "objectForKeyedSubscript:", v7);
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          _CSFGetLogSystem();
          v4 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138412290;
            v15 = v7;
            _os_log_impl(&dword_1A5B4D000, v4, OS_LOG_TYPE_DEFAULT, "Found user has engaged with CFU with key %@", buf, 0xCu);
          }

          LOBYTE(v4) = 1;
          goto LABEL_13;
        }

      }
      v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v10, v16, 16);
      if (v4)
        continue;
      break;
    }
  }
LABEL_13:

  return (char)v4;
}

+ (NSDictionary)persistentDomain
{
  void *v2;
  void *v3;

  +[CSFFollowUp defaults](CSFFollowUp, "defaults");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "persistentDomainForName:", CFSTR("com.apple.CloudSubscriptionFeatures.followup.engagement"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSDictionary *)v3;
}

+ (NSNumber)hasEngagedWithCFUGlobalDomain
{
  void *v2;
  void *v3;
  int v4;
  NSObject *v5;
  const __CFString *v6;
  id v7;
  NSObject *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  int v24;
  const __CFString *v25;
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a1, "_persistentDomain");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKey:", CFSTR("com.apple.csf.cfuengagement"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v3)
  {
    _CSFGetLogSystem();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      +[CSFFollowUp hasEngagedWithCFUGlobalDomain].cold.1(v8, v9, v10, v11, v12, v13, v14, v15);
    goto LABEL_12;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    _CSFGetLogSystem();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      +[CSFFollowUp hasEngagedWithCFUGlobalDomain].cold.2(v8, v16, v17, v18, v19, v20, v21, v22);
LABEL_12:

    v7 = 0;
    goto LABEL_13;
  }
  v4 = objc_msgSend(v3, "BOOLValue");
  _CSFGetLogSystem();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v6 = CFSTR("NO");
    if (v4)
      v6 = CFSTR("YES");
    v24 = 138412290;
    v25 = v6;
    _os_log_impl(&dword_1A5B4D000, v5, OS_LOG_TYPE_DEFAULT, "[Global Domain] User has engaged with CFU? %@", (uint8_t *)&v24, 0xCu);
  }

  v7 = v3;
LABEL_13:

  return (NSNumber *)v7;
}

+ (void)setHasEngagedWithCFUGlobalDomain:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  id v7;

  v7 = a3;
  objc_msgSend(a1, "_persistentDomain");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(v4, "mutableCopy");

  if (!v5)
    v5 = (void *)objc_msgSend(MEMORY[0x1E0C9AA60], "mutableCopy");
  objc_msgSend(v5, "setObject:forKeyedSubscript:", v7, CFSTR("com.apple.csf.cfuengagement"));
  objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setPersistentDomain:forName:", v5, *MEMORY[0x1E0CB2B58]);

}

+ (id)_persistentDomain
{
  void *v2;
  void *v3;

  objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "persistentDomainForName:", *MEMORY[0x1E0CB2B58]);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

+ (void)hasEngagedWithCFUGlobalDomain
{
  OUTLINED_FUNCTION_0_0(&dword_1A5B4D000, a1, a3, "Defaults-stored value is not of expected type.", a5, a6, a7, a8, 0);
}

@end
