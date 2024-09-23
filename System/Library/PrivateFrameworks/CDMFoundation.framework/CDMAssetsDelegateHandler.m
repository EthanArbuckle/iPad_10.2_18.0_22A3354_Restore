@implementation CDMAssetsDelegateHandler

- (CDMAssetsDelegateHandler)initWithAssetsDelegate:(id)a3 forAssetSets:(id)a4 withAssetAvailabilityType:(int64_t)a5
{
  id v9;
  id v10;
  CDMAssetsDelegateHandler *v11;
  NSObject *v12;
  NSMutableDictionary *v13;
  NSMutableDictionary *assetsAvailabilities;
  objc_super v16;
  uint8_t buf[4];
  const char *v18;
  __int16 v19;
  id v20;
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
  v9 = a3;
  v10 = a4;
  v16.receiver = self;
  v16.super_class = (Class)CDMAssetsDelegateHandler;
  v11 = -[CDMAssetsDelegateHandler init](&v16, sel_init);
  if (v11)
  {
    CDMOSLoggerForCategory(0);
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315394;
      v18 = "-[CDMAssetsDelegateHandler initWithAssetsDelegate:forAssetSets:withAssetAvailabilityType:]";
      v19 = 2112;
      v20 = v10;
      _os_log_impl(&dword_21A2A0000, v12, OS_LOG_TYPE_INFO, "%s Initialize CDMAssetsDelegateHandler for assetSetNames: %@.", buf, 0x16u);
    }

    objc_storeStrong((id *)&v11->_delegate, a3);
    objc_storeStrong((id *)&v11->_assetSetNames, a4);
    v13 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x24BDBCED8]);
    assetsAvailabilities = v11->_assetsAvailabilities;
    v11->_assetsAvailabilities = v13;

    v11->_assetAvailabilityType = a5;
  }

  return v11;
}

- (BOOL)assetsAvailableForAssetSet:(id)a3 forLocale:(id)a4
{
  id v6;
  NSArray *v7;
  _BOOL4 v8;
  NSObject *v9;
  NSMutableDictionary *v10;
  NSArray *assetSetNames;
  int v13;
  const char *v14;
  __int16 v15;
  id v16;
  __int16 v17;
  NSArray *v18;
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = (NSArray *)a4;
  v8 = -[NSArray containsObject:](self->_assetSetNames, "containsObject:", v6);
  CDMOSLoggerForCategory(0);
  v9 = objc_claimAutoreleasedReturnValue();
  v10 = (NSMutableDictionary *)v9;
  if (v8)
  {
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
    {
      v13 = 136315650;
      v14 = "-[CDMAssetsDelegateHandler assetsAvailableForAssetSet:forLocale:]";
      v15 = 2112;
      v16 = v6;
      v17 = 2112;
      v18 = v7;
      _os_log_debug_impl(&dword_21A2A0000, &v10->super.super, OS_LOG_TYPE_DEBUG, "%s Asset is available for assetSetName: %@ for locale: %@.", (uint8_t *)&v13, 0x20u);
    }

    v10 = self->_assetsAvailabilities;
    objc_sync_enter(v10);
    -[NSMutableDictionary setObject:forKeyedSubscript:](self->_assetsAvailabilities, "setObject:forKeyedSubscript:", v7, v6);
    -[CDMAssetsDelegateHandler notifyDelegate](self, "notifyDelegate");
    objc_sync_exit(v10);
  }
  else if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    assetSetNames = self->_assetSetNames;
    v13 = 136315650;
    v14 = "-[CDMAssetsDelegateHandler assetsAvailableForAssetSet:forLocale:]";
    v15 = 2112;
    v16 = v6;
    v17 = 2112;
    v18 = assetSetNames;
    _os_log_impl(&dword_21A2A0000, &v10->super.super, OS_LOG_TYPE_INFO, "%s [WARN]: Not able to find assetSetName: %@ in assetSetName array: %@", (uint8_t *)&v13, 0x20u);
  }

  return v8;
}

- (BOOL)assetsUnavailableForAssetSet:(id)a3
{
  id v4;
  _BOOL4 v5;
  NSObject *v6;
  NSMutableDictionary *v7;
  NSArray *assetSetNames;
  int v10;
  const char *v11;
  __int16 v12;
  id v13;
  __int16 v14;
  NSArray *v15;
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v5 = -[NSArray containsObject:](self->_assetSetNames, "containsObject:", v4);
  CDMOSLoggerForCategory(0);
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = (NSMutableDictionary *)v6;
  if (v5)
  {
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
    {
      v10 = 136315394;
      v11 = "-[CDMAssetsDelegateHandler assetsUnavailableForAssetSet:]";
      v12 = 2112;
      v13 = v4;
      _os_log_debug_impl(&dword_21A2A0000, &v7->super.super, OS_LOG_TYPE_DEBUG, "%s Asset is unavailable for assetSetName: %@.", (uint8_t *)&v10, 0x16u);
    }

    v7 = self->_assetsAvailabilities;
    objc_sync_enter(v7);
    -[NSMutableDictionary removeObjectForKey:](self->_assetsAvailabilities, "removeObjectForKey:", v4);
    -[CDMAssetsDelegateHandler notifyDelegate](self, "notifyDelegate");
    objc_sync_exit(v7);
  }
  else if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    assetSetNames = self->_assetSetNames;
    v10 = 136315650;
    v11 = "-[CDMAssetsDelegateHandler assetsUnavailableForAssetSet:]";
    v12 = 2112;
    v13 = v4;
    v14 = 2112;
    v15 = assetSetNames;
    _os_log_impl(&dword_21A2A0000, &v7->super.super, OS_LOG_TYPE_INFO, "%s [WARN]: Not able to find assetSetName: %@ in assetSetName array: %@", (uint8_t *)&v10, 0x20u);
  }

  return v5;
}

- (void)notifyDelegate
{
  NSObject *v3;
  NSArray *v4;
  uint64_t v5;
  uint64_t v6;
  NSObject *v7;
  uint64_t v8;
  uint64_t v9;
  NSObject *v10;
  void *v11;
  void *v12;
  int v13;
  NSObject *v14;
  NSObject *v15;
  int v16;
  NSObject *v17;
  _BOOL4 v18;
  NSArray *assetSetNames;
  int64_t assetAvailabilityType;
  char v21;
  NSObject *v22;
  _BOOL4 v23;
  CDMTrialAssetsDelegate *delegate;
  void *v25;
  NSArray *v26;
  int64_t v27;
  char v28;
  NSObject *v29;
  _BOOL4 v30;
  CDMTrialAssetsDelegate *v31;
  void *v32;
  NSMutableDictionary *assetsAvailabilities;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  uint8_t buf[4];
  const char *v39;
  __int16 v40;
  void *v41;
  __int16 v42;
  int64_t v43;
  __int16 v44;
  NSObject *v45;
  __int16 v46;
  int64_t v47;
  _BYTE v48[128];
  uint64_t v49;

  v49 = *MEMORY[0x24BDAC8D0];
  CDMOSLoggerForCategory(0);
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 136315138;
    v39 = "-[CDMAssetsDelegateHandler notifyDelegate]";
    _os_log_debug_impl(&dword_21A2A0000, v3, OS_LOG_TYPE_DEBUG, "%s Start to notify assets delegate.", buf, 0xCu);
  }

  v36 = 0u;
  v37 = 0u;
  v34 = 0u;
  v35 = 0u;
  v4 = self->_assetSetNames;
  v5 = -[NSArray countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v34, v48, 16);
  if (v5)
  {
    v6 = v5;
    v7 = 0;
    v8 = *(_QWORD *)v35;
    while (2)
    {
      v9 = 0;
      v10 = v7;
      do
      {
        if (*(_QWORD *)v35 != v8)
          objc_enumerationMutation(v4);
        v11 = *(void **)(*((_QWORD *)&v34 + 1) + 8 * v9);
        -[NSMutableDictionary objectForKey:](self->_assetsAvailabilities, "objectForKey:", v11, (_QWORD)v34);
        v12 = (void *)objc_claimAutoreleasedReturnValue();

        if (!v12)
        {
          CDMOSLoggerForCategory(0);
          v7 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
          {
            *(_DWORD *)buf = 136315394;
            v39 = "-[CDMAssetsDelegateHandler notifyDelegate]";
            v40 = 2112;
            v41 = v11;
          }
          goto LABEL_20;
        }
        -[NSMutableDictionary valueForKey:](self->_assetsAvailabilities, "valueForKey:", v11);
        v7 = objc_claimAutoreleasedReturnValue();
        if (v10 && (-[NSObject isEqualToString:](v10, "isEqualToString:", v7) & 1) == 0)
        {
          CDMOSLoggerForCategory(0);
          v14 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
          {
            *(_DWORD *)buf = 136315906;
            v39 = "-[CDMAssetsDelegateHandler notifyDelegate]";
            v40 = 2112;
            v41 = v7;
            v42 = 2112;
            v43 = (int64_t)v11;
            v44 = 2112;
            v45 = v10;
          }

LABEL_20:
          v13 = 0;
          v7 = v10;
          goto LABEL_21;
        }

        ++v9;
        v10 = v7;
      }
      while (v6 != v9);
      v6 = -[NSArray countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v34, v48, 16);
      v13 = 1;
      if (v6)
        continue;
      break;
    }
  }
  else
  {
    v7 = 0;
    v13 = 1;
  }
LABEL_21:

  CDMOSLoggerForCategory(0);
  v15 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
  {
    assetsAvailabilities = self->_assetsAvailabilities;
    *(_DWORD *)buf = 136315394;
    v39 = "-[CDMAssetsDelegateHandler notifyDelegate]";
    v40 = 2112;
    v41 = assetsAvailabilities;
    _os_log_debug_impl(&dword_21A2A0000, v15, OS_LOG_TYPE_DEBUG, "%s Current assets availabilities status: %@.", buf, 0x16u);
  }

  if (v7)
    v16 = v13;
  else
    v16 = 0;
  CDMOSLoggerForCategory(0);
  v17 = objc_claimAutoreleasedReturnValue();
  v18 = os_log_type_enabled(v17, OS_LOG_TYPE_INFO);
  if (v16 == 1)
  {
    if (v18)
    {
      assetSetNames = self->_assetSetNames;
      assetAvailabilityType = self->_assetAvailabilityType;
      *(_DWORD *)buf = 136316162;
      v39 = "-[CDMAssetsDelegateHandler notifyDelegate]";
      v40 = 2112;
      v41 = assetSetNames;
      v42 = 2112;
      v43 = (int64_t)v7;
      v44 = 2112;
      v45 = v7;
      v46 = 2048;
      v47 = assetAvailabilityType;
      _os_log_impl(&dword_21A2A0000, v17, OS_LOG_TYPE_INFO, "%s All assets are available for assetSetNames: %@ for locale: %@. Call assets delegate's assetsAvailable for locale: %@  for assetAvailabilityType: %ld", buf, 0x34u);
    }

    v21 = objc_opt_respondsToSelector();
    CDMOSLoggerForCategory(0);
    v22 = objc_claimAutoreleasedReturnValue();
    v23 = os_log_type_enabled(v22, OS_LOG_TYPE_INFO);
    if ((v21 & 1) != 0)
    {
      if (v23)
      {
        *(_DWORD *)buf = 136315138;
        v39 = "-[CDMAssetsDelegateHandler notifyDelegate]";
        _os_log_impl(&dword_21A2A0000, v22, OS_LOG_TYPE_INFO, "%s Selector found for assetsAvailableForLocale:withType:", buf, 0xCu);
      }

      delegate = self->_delegate;
      objc_msgSend(MEMORY[0x24BDBCEA0], "localeWithLocaleIdentifier:", v7);
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      -[CDMTrialAssetsDelegate assetsAvailableForLocale:withType:](delegate, "assetsAvailableForLocale:withType:", v25, self->_assetAvailabilityType);

    }
    else
    {
      if (v23)
      {
        *(_DWORD *)buf = 136315138;
        v39 = "-[CDMAssetsDelegateHandler notifyDelegate]";
        _os_log_impl(&dword_21A2A0000, v22, OS_LOG_TYPE_INFO, "%s Selector not found for assetsAvailableForLocale:withType:", buf, 0xCu);
      }

      v31 = self->_delegate;
      objc_msgSend(MEMORY[0x24BDBCEA0], "localeWithLocaleIdentifier:", v7);
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      -[CDMTrialAssetsDelegate assetsAvailableForLocale:](v31, "assetsAvailableForLocale:", v32);

    }
  }
  else
  {
    if (v18)
    {
      v26 = self->_assetSetNames;
      v27 = self->_assetAvailabilityType;
      *(_DWORD *)buf = 136315650;
      v39 = "-[CDMAssetsDelegateHandler notifyDelegate]";
      v40 = 2112;
      v41 = v26;
      v42 = 2048;
      v43 = v27;
      _os_log_impl(&dword_21A2A0000, v17, OS_LOG_TYPE_INFO, "%s Not all assets are available for assetSetNames: %@. Call assets delegate's assetsUnavailable for assetAvailabilityType: %ld", buf, 0x20u);
    }

    v28 = objc_opt_respondsToSelector();
    CDMOSLoggerForCategory(0);
    v29 = objc_claimAutoreleasedReturnValue();
    v30 = os_log_type_enabled(v29, OS_LOG_TYPE_INFO);
    if ((v28 & 1) != 0)
    {
      if (v30)
      {
        *(_DWORD *)buf = 136315138;
        v39 = "-[CDMAssetsDelegateHandler notifyDelegate]";
        _os_log_impl(&dword_21A2A0000, v29, OS_LOG_TYPE_INFO, "%s Selector found for assetsUnavailableWithType:", buf, 0xCu);
      }

      -[CDMTrialAssetsDelegate assetsUnavailableWithType:](self->_delegate, "assetsUnavailableWithType:", self->_assetAvailabilityType);
    }
    else
    {
      if (v30)
      {
        *(_DWORD *)buf = 136315138;
        v39 = "-[CDMAssetsDelegateHandler notifyDelegate]";
        _os_log_impl(&dword_21A2A0000, v29, OS_LOG_TYPE_INFO, "%s Selector not found for assetsUnavailableWithType:", buf, 0xCu);
      }

      -[CDMTrialAssetsDelegate assetsUnavailable](self->_delegate, "assetsUnavailable");
    }
  }

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_assetsAvailabilities, 0);
  objc_storeStrong((id *)&self->_assetSetNames, 0);
  objc_storeStrong((id *)&self->_delegate, 0);
}

@end
