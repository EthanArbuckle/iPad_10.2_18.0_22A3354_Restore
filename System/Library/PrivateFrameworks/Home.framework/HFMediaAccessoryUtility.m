@implementation HFMediaAccessoryUtility

+ (id)sharedInstance
{
  if (_MergedGlobals_275 != -1)
    dispatch_once(&_MergedGlobals_275, &__block_literal_global_2_20);
  return (id)qword_1ED379440;
}

void __41__HFMediaAccessoryUtility_sharedInstance__block_invoke_2()
{
  HFMediaAccessoryUtility *v0;
  void *v1;

  v0 = objc_alloc_init(HFMediaAccessoryUtility);
  v1 = (void *)qword_1ED379440;
  qword_1ED379440 = (uint64_t)v0;

}

- (HFMediaAccessoryUtility)init
{
  HFMediaAccessoryUtility *v2;
  NSMutableArray *v3;
  NSMutableArray *uuidTrackingList;
  NSMutableDictionary *v5;
  NSMutableDictionary *restartStateList;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)HFMediaAccessoryUtility;
  v2 = -[HFMediaAccessoryUtility init](&v8, sel_init);
  if (v2)
  {
    v3 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    uuidTrackingList = v2->_uuidTrackingList;
    v2->_uuidTrackingList = v3;

    v5 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    restartStateList = v2->_restartStateList;
    v2->_restartStateList = v5;

  }
  return v2;
}

- (BOOL)isHomePodRestartInitiated:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  -[HFMediaAccessoryUtility restartStateList](self, "restartStateList");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKeyedSubscript:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  LOBYTE(v4) = objc_msgSend(v6, "integerValue") == 1;
  return (char)v4;
}

- (BOOL)isHomePodRestartingCurrently:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  char v13;
  void *v14;
  int v15;
  BOOL v16;
  void *v17;

  v4 = a3;
  if (!v4)
    goto LABEL_17;
  -[HFMediaAccessoryUtility uuidTrackingList](self, "uuidTrackingList");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v5, "count"))
  {

  }
  else
  {
    -[HFMediaAccessoryUtility restartStateList](self, "restartStateList");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "objectForKeyedSubscript:", v4);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v7)
      goto LABEL_17;
  }
  -[HFMediaAccessoryUtility restartStateList](self, "restartStateList");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "objectForKeyedSubscript:", v4);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "integerValue");

  -[HFMediaAccessoryUtility uuidTrackingList](self, "uuidTrackingList");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v11, "count"))
  {
    -[HFMediaAccessoryUtility uuidTrackingList](self, "uuidTrackingList");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v12, "containsObject:", v4);

    if ((v13 & 1) == 0 && !v10)
      goto LABEL_17;
  }
  else
  {

  }
  -[HFMediaAccessoryUtility uuidTrackingList](self, "uuidTrackingList");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = objc_msgSend(v14, "containsObject:", v4);

  if (!v15 || v10 != 2)
  {
    -[HFMediaAccessoryUtility uuidTrackingList](self, "uuidTrackingList");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v17, "containsObject:", v4) & 1) != 0)
    {

    }
    else
    {

      if ((unint64_t)(v10 - 1) <= 1)
      {
        v16 = -[HFMediaAccessoryUtility checkIfAccessoryisPartofHomeAndHasLanguageSettings:](self, "checkIfAccessoryisPartofHomeAndHasLanguageSettings:", v4);
        goto LABEL_18;
      }
    }
LABEL_17:
    v16 = 0;
    goto LABEL_18;
  }
  v16 = 1;
LABEL_18:

  return v16;
}

- (void)updateHomePodAccessoryRestartState:(unint64_t)a3 with:(id)a4
{
  id v6;
  NSObject *v7;
  NSObject *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  char v14;
  void *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  int v23;
  const char *v24;
  __int16 v25;
  unint64_t v26;
  __int16 v27;
  id v28;
  __int16 v29;
  void *v30;
  __int16 v31;
  void *v32;
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
  v6 = a4;
  HFLogForCategory(0);
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (v6)
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
    {
      -[HFMediaAccessoryUtility uuidTrackingList](self, "uuidTrackingList");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      -[HFMediaAccessoryUtility restartStateList](self, "restartStateList");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v23 = 136316162;
      v24 = "-[HFMediaAccessoryUtility updateHomePodAccessoryRestartState:with:]";
      v25 = 2048;
      v26 = a3;
      v27 = 2112;
      v28 = v6;
      v29 = 2112;
      v30 = v19;
      v31 = 2112;
      v32 = v20;
      _os_log_debug_impl(&dword_1DD34E000, v8, OS_LOG_TYPE_DEBUG, "%s Requesting RestartState %lu Device UUID %@ uuidTrackingList..%@ Restart Tracking List ..%@", (uint8_t *)&v23, 0x34u);

    }
    if (a3 == 1)
    {
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", 1);
      v8 = objc_claimAutoreleasedReturnValue();
      -[HFMediaAccessoryUtility restartStateList](self, "restartStateList");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "setObject:forKeyedSubscript:", v8, v6);

      goto LABEL_20;
    }
    -[HFMediaAccessoryUtility restartStateList](self, "restartStateList");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "objectForKeyedSubscript:", v6);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v11, "integerValue");

    if (a3 == 3)
    {
      -[HFMediaAccessoryUtility uuidTrackingList](self, "uuidTrackingList");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      if (!objc_msgSend(v17, "containsObject:", v6))
      {
LABEL_17:

        goto LABEL_18;
      }

      if ((unint64_t)(v12 - 1) > 1)
        goto LABEL_18;
      v15 = (void *)MEMORY[0x1E0CB37E8];
      v16 = 3;
    }
    else
    {
      if (a3 != 2
        || (-[HFMediaAccessoryUtility uuidTrackingList](self, "uuidTrackingList"),
            v13 = (void *)objc_claimAutoreleasedReturnValue(),
            v14 = objc_msgSend(v13, "containsObject:", v6),
            v13,
            (v14 & 1) != 0)
        || v12 != 1)
      {
LABEL_18:
        HFLogForCategory(0);
        v8 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
        {
          -[HFMediaAccessoryUtility uuidTrackingList](self, "uuidTrackingList");
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          -[HFMediaAccessoryUtility restartStateList](self, "restartStateList");
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          v23 = 136316162;
          v24 = "-[HFMediaAccessoryUtility updateHomePodAccessoryRestartState:with:]";
          v25 = 2048;
          v26 = a3;
          v27 = 2112;
          v28 = v6;
          v29 = 2112;
          v30 = v21;
          v31 = 2112;
          v32 = v22;
          _os_log_debug_impl(&dword_1DD34E000, v8, OS_LOG_TYPE_DEBUG, "%s After Requesting RestartState %lu Device UUID %@ uuidTrackingList..%@ Restart Tracking List ..%@", (uint8_t *)&v23, 0x34u);

        }
        goto LABEL_20;
      }
      v15 = (void *)MEMORY[0x1E0CB37E8];
      v16 = 2;
    }
    objc_msgSend(v15, "numberWithUnsignedInteger:", v16);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    -[HFMediaAccessoryUtility restartStateList](self, "restartStateList");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "setObject:forKeyedSubscript:", v17, v6);

    goto LABEL_17;
  }
  if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
  {
    v23 = 136315138;
    v24 = "-[HFMediaAccessoryUtility updateHomePodAccessoryRestartState:with:]";
    _os_log_error_impl(&dword_1DD34E000, v8, OS_LOG_TYPE_ERROR, "%s UUID Parameter cant be NIL", (uint8_t *)&v23, 0xCu);
  }
LABEL_20:

}

- (BOOL)checkIfAccessoryisPartofHomeAndHasLanguageSettings:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  NSObject *v8;
  NSObject *v9;
  NSObject *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  int v19;
  NSObject *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  _BOOL4 v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t j;
  void *v30;
  void *v31;
  void *v32;
  int v33;
  BOOL v34;
  NSObject *v35;
  void *v36;
  void *v37;
  void *v38;
  NSObject *v39;
  void *v41;
  void *v42;
  void *v43;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  _BYTE v53[128];
  uint8_t v54[128];
  uint8_t buf[4];
  const char *v56;
  __int16 v57;
  void *v58;
  __int16 v59;
  id v60;
  uint64_t v61;

  v61 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  +[HFHomeKitDispatcher sharedDispatcher](HFHomeKitDispatcher, "sharedDispatcher");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "home");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "hf_allHomePodProfileContainers");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = objc_msgSend(v6, "count");
  HFLogForCategory(0);
  v8 = objc_claimAutoreleasedReturnValue();
  v9 = v8;
  if (v7)
  {
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 136315650;
      v56 = "-[HFMediaAccessoryUtility checkIfAccessoryisPartofHomeAndHasLanguageSettings:]";
      v57 = 2112;
      v58 = v6;
      v59 = 2112;
      v60 = v3;
      _os_log_debug_impl(&dword_1DD34E000, v9, OS_LOG_TYPE_DEBUG, "%s HomePod Profiles %@, requesting uuid %@", buf, 0x20u);
    }

    v51 = 0u;
    v52 = 0u;
    v49 = 0u;
    v50 = 0u;
    v43 = v6;
    v10 = v6;
    v11 = -[NSObject countByEnumeratingWithState:objects:count:](v10, "countByEnumeratingWithState:objects:count:", &v49, v54, 16);
    if (v11)
    {
      v12 = v11;
      v13 = *(_QWORD *)v50;
      while (2)
      {
        for (i = 0; i != v12; ++i)
        {
          if (*(_QWORD *)v50 != v13)
            objc_enumerationMutation(v10);
          v15 = *(void **)(*((_QWORD *)&v49 + 1) + 8 * i);
          objc_msgSend(v15, "hf_backingAccessory");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v16, "uniqueIdentifier");
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v17, "UUIDString");
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          v19 = objc_msgSend(v18, "isEqualToString:", v3);

          if (v19)
          {
            HFLogForCategory(0);
            v20 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
            {
              objc_msgSend(v15, "hf_backingAccessory");
              v21 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v21, "uniqueIdentifier");
              v22 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v22, "UUIDString");
              v23 = (void *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = 136315650;
              v56 = "-[HFMediaAccessoryUtility checkIfAccessoryisPartofHomeAndHasLanguageSettings:]";
              v57 = 2112;
              v58 = v23;
              v59 = 2112;
              v60 = v3;
              _os_log_impl(&dword_1DD34E000, v20, OS_LOG_TYPE_DEFAULT, "%s Media Profile Containers uuid %@ match against requesting uuid %@", buf, 0x20u);

            }
            objc_msgSend(v15, "hf_backingAccessory");
            v24 = (void *)objc_claimAutoreleasedReturnValue();
            v25 = -[HFMediaAccessoryUtility checkIfLanguageSetupIsDoneForAccessory:](self, "checkIfLanguageSetupIsDoneForAccessory:", v24);

            if (v25)
            {
              HFLogForCategory(0);
              v35 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v35, OS_LOG_TYPE_DEFAULT))
              {
                objc_msgSend(v15, "hf_backingAccessory");
                v36 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v36, "uniqueIdentifier");
                v37 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v37, "UUIDString");
                v38 = (void *)objc_claimAutoreleasedReturnValue();
                *(_DWORD *)buf = 136315650;
                v56 = "-[HFMediaAccessoryUtility checkIfAccessoryisPartofHomeAndHasLanguageSettings:]";
                v57 = 2112;
                v58 = v38;
                v59 = 2112;
                v60 = v3;
                _os_log_impl(&dword_1DD34E000, v35, OS_LOG_TYPE_DEFAULT, "%s Solo Media Profile Containers uuid %@ match against requesting uuid %@ and language settings is available", buf, 0x20u);

              }
              v34 = 1;
              v6 = v43;
              v9 = v10;
              goto LABEL_34;
            }
          }
        }
        v12 = -[NSObject countByEnumeratingWithState:objects:count:](v10, "countByEnumeratingWithState:objects:count:", &v49, v54, 16);
        if (v12)
          continue;
        break;
      }
    }

    v47 = 0u;
    v48 = 0u;
    v45 = 0u;
    v46 = 0u;
    v9 = v10;
    v26 = -[NSObject countByEnumeratingWithState:objects:count:](v9, "countByEnumeratingWithState:objects:count:", &v45, v53, 16);
    if (v26)
    {
      v27 = v26;
      v28 = *(_QWORD *)v46;
      while (2)
      {
        for (j = 0; j != v27; ++j)
        {
          if (*(_QWORD *)v46 != v28)
            objc_enumerationMutation(v9);
          v30 = *(void **)(*((_QWORD *)&v45 + 1) + 8 * j);
          objc_msgSend(v30, "uniqueIdentifier");
          v31 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v31, "UUIDString");
          v32 = (void *)objc_claimAutoreleasedReturnValue();
          v33 = objc_msgSend(v32, "isEqualToString:", v3);

          if (v33)
          {
            HFLogForCategory(0);
            v39 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v39, OS_LOG_TYPE_DEBUG))
            {
              objc_msgSend(v30, "uniqueIdentifier");
              v41 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v41, "UUIDString");
              v42 = (void *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = 136315650;
              v56 = "-[HFMediaAccessoryUtility checkIfAccessoryisPartofHomeAndHasLanguageSettings:]";
              v57 = 2112;
              v58 = v42;
              v59 = 2112;
              v60 = v3;
              _os_log_debug_impl(&dword_1DD34E000, v39, OS_LOG_TYPE_DEBUG, "%s Grouped Media Profile Containers uuid %@ match against requesting uuid %@", buf, 0x20u);

            }
            v34 = 1;
            goto LABEL_33;
          }
        }
        v27 = -[NSObject countByEnumeratingWithState:objects:count:](v9, "countByEnumeratingWithState:objects:count:", &v45, v53, 16);
        if (v27)
          continue;
        break;
      }
    }
    v34 = 0;
LABEL_33:
    v6 = v43;
  }
  else
  {
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315138;
      v56 = "-[HFMediaAccessoryUtility checkIfAccessoryisPartofHomeAndHasLanguageSettings:]";
      _os_log_error_impl(&dword_1DD34E000, v9, OS_LOG_TYPE_ERROR, "%s Empty Profiles", buf, 0xCu);
    }
    v34 = 0;
  }
LABEL_34:

  return v34;
}

- (BOOL)checkIfLanguageSetupIsDoneForAccessory:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  NSObject *v6;
  NSObject *v7;
  int v9;
  const char *v10;
  __int16 v11;
  id v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  objc_msgSend(v3, "settings");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "hf_accessorySettingAtKeyPath:", CFSTR("root.siri.language"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  HFLogForCategory(0);
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (v5)
  {
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
    {
      v9 = 136315394;
      v10 = "-[HFMediaAccessoryUtility checkIfLanguageSetupIsDoneForAccessory:]";
      v11 = 2112;
      v12 = v3;
      _os_log_debug_impl(&dword_1DD34E000, v7, OS_LOG_TYPE_DEBUG, "%s Language Settings available %@", (uint8_t *)&v9, 0x16u);
    }
  }
  else if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v9 = 136315394;
    v10 = "-[HFMediaAccessoryUtility checkIfLanguageSetupIsDoneForAccessory:]";
    v11 = 2112;
    v12 = v3;
    _os_log_impl(&dword_1DD34E000, v7, OS_LOG_TYPE_DEFAULT, "%s Language Settings NOT available %@", (uint8_t *)&v9, 0x16u);
  }

  return v5 != 0;
}

- (void)markUUIDReachableViaRapport:(id)a3
{
  id v4;
  NSObject *v5;
  NSObject *v6;
  void *v7;
  char v8;
  void *v9;
  char *v10;
  char *v11;
  int v12;
  const char *v13;
  __int16 v14;
  id v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  HFLogForCategory(0);
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v4)
  {
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    {
      -[HFMediaAccessoryUtility uuidTrackingList](self, "uuidTrackingList");
      v11 = (char *)objc_claimAutoreleasedReturnValue();
      v12 = 138412546;
      v13 = v11;
      v14 = 2112;
      v15 = v4;
      _os_log_debug_impl(&dword_1DD34E000, v6, OS_LOG_TYPE_DEBUG, "Devices UUID list that are reachable over Rapport prior to adding to list %@. UUID requested to be added..%@", (uint8_t *)&v12, 0x16u);

    }
    -[HFMediaAccessoryUtility uuidTrackingList](self, "uuidTrackingList");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "containsObject:", v4);

    if ((v8 & 1) == 0)
    {
      -[HFMediaAccessoryUtility uuidTrackingList](self, "uuidTrackingList");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "addObject:", v4);

    }
    HFLogForCategory(0);
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
    {
      -[HFMediaAccessoryUtility uuidTrackingList](self, "uuidTrackingList");
      v10 = (char *)objc_claimAutoreleasedReturnValue();
      v12 = 138412546;
      v13 = v10;
      v14 = 2112;
      v15 = v4;
      _os_log_debug_impl(&dword_1DD34E000, v6, OS_LOG_TYPE_DEBUG, "Devices UUID list that are reachable over Rapport after adding to list %@. UUID requested to be added..%@", (uint8_t *)&v12, 0x16u);

    }
  }
  else if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
  {
    v12 = 136315138;
    v13 = "-[HFMediaAccessoryUtility markUUIDReachableViaRapport:]";
    _os_log_error_impl(&dword_1DD34E000, v6, OS_LOG_TYPE_ERROR, "%s UUID Parameter cant be NIL", (uint8_t *)&v12, 0xCu);
  }

}

- (void)markUUIDUnreachableViaRapport:(id)a3
{
  id v4;
  NSObject *v5;
  NSObject *v6;
  void *v7;
  int v8;
  NSObject *v9;
  char *v10;
  char *v11;
  void *v12;
  int v13;
  const char *v14;
  __int16 v15;
  id v16;
  __int16 v17;
  void *v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  HFLogForCategory(0);
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v4)
  {
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    {
      -[HFMediaAccessoryUtility uuidTrackingList](self, "uuidTrackingList");
      v10 = (char *)objc_claimAutoreleasedReturnValue();
      v13 = 138412546;
      v14 = v10;
      v15 = 2112;
      v16 = v4;
      _os_log_debug_impl(&dword_1DD34E000, v6, OS_LOG_TYPE_DEBUG, "Devices UUID list that are reachable over Rapport prior to removal from list %@. UUID requested to be removed..%@", (uint8_t *)&v13, 0x16u);

    }
    -[HFMediaAccessoryUtility uuidTrackingList](self, "uuidTrackingList");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "containsObject:", v4);

    if (v8)
    {
      -[HFMediaAccessoryUtility uuidTrackingList](self, "uuidTrackingList");
      v9 = objc_claimAutoreleasedReturnValue();
      -[NSObject removeObject:](v9, "removeObject:", v4);
    }
    else
    {
      HFLogForCategory(0);
      v9 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      {
        -[HFMediaAccessoryUtility uuidTrackingList](self, "uuidTrackingList");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v13 = 136315650;
        v14 = "-[HFMediaAccessoryUtility markUUIDUnreachableViaRapport:]";
        v15 = 2112;
        v16 = v4;
        v17 = 2112;
        v18 = v12;
        _os_log_error_impl(&dword_1DD34E000, v9, OS_LOG_TYPE_ERROR, "%s Trying to remove the UUID %@ of accessory which is not there in the list %@", (uint8_t *)&v13, 0x20u);

      }
    }

    HFLogForCategory(0);
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
    {
      -[HFMediaAccessoryUtility uuidTrackingList](self, "uuidTrackingList");
      v11 = (char *)objc_claimAutoreleasedReturnValue();
      v13 = 138412546;
      v14 = v11;
      v15 = 2112;
      v16 = v4;
      _os_log_debug_impl(&dword_1DD34E000, v6, OS_LOG_TYPE_DEBUG, "Devices UUID list that are reachable over Rapport after removal from list %@. UUID requested to be removed..%@", (uint8_t *)&v13, 0x16u);

    }
  }
  else if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
  {
    v13 = 136315138;
    v14 = "-[HFMediaAccessoryUtility markUUIDUnreachableViaRapport:]";
    _os_log_error_impl(&dword_1DD34E000, v6, OS_LOG_TYPE_ERROR, "%s UUID Parameter cant be NIL", (uint8_t *)&v13, 0xCu);
  }

}

- (NSMutableArray)uuidTrackingList
{
  return (NSMutableArray *)objc_getProperty(self, a2, 8, 1);
}

- (void)setUuidTrackingList:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 8);
}

- (NSMutableDictionary)restartStateList
{
  return (NSMutableDictionary *)objc_getProperty(self, a2, 16, 1);
}

- (void)setRestartStateList:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 16);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_restartStateList, 0);
  objc_storeStrong((id *)&self->_uuidTrackingList, 0);
}

@end
