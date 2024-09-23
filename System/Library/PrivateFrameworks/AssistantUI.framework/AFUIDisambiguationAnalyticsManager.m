@implementation AFUIDisambiguationAnalyticsManager

+ (id)sharedManager
{
  _QWORD block[5];

  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __51__AFUIDisambiguationAnalyticsManager_sharedManager__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (sharedManager_onceToken_0 != -1)
    dispatch_once(&sharedManager_onceToken_0, block);
  return (id)sharedManager_sharedManager_0;
}

void __51__AFUIDisambiguationAnalyticsManager_sharedManager__block_invoke(uint64_t a1)
{
  id v1;
  void *v2;

  v1 = objc_alloc_init(*(Class *)(a1 + 32));
  v2 = (void *)sharedManager_sharedManager_0;
  sharedManager_sharedManager_0 = (uint64_t)v1;

}

- (void)logDisambiguationItemSelected:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v4 = a3;
  objc_msgSend(v4, "selectedAceId");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[AFUIDisambiguationAnalyticsManager _listItemMatchingAceId:](self, "_listItemMatchingAceId:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    -[AFUIDisambiguationAnalyticsManager disambiguationAssistance](self, "disambiguationAssistance");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "af_saveItemSelection:forType:", v6, 0);

    -[AFUIDisambiguationAnalyticsManager _logDisambiguationSelectedEventWithListItem:](self, "_logDisambiguationSelectedEventWithListItem:", v6);
  }
  else
  {
    v8 = (void *)*MEMORY[0x24BE08FB0];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FB0], OS_LOG_TYPE_ERROR))
      -[AFUIDisambiguationAnalyticsManager logDisambiguationItemSelected:].cold.1(v8, v4);
  }

}

- (void)logDisambiguationDismissedEvent
{
  void *v3;
  void *v4;
  void *v5;
  id v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x24BDAC8D0];
  -[AFUIDisambiguationAnalyticsManager _allListItems](self, "_allListItems");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_sruif_appInfo);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "valueForKey:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v19 = 0u;
  v20 = 0u;
  v17 = 0u;
  v18 = 0u;
  v6 = v5;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
  v8 = v6;
  if (v7)
  {
    v9 = v7;
    v10 = *(_QWORD *)v18;
    while (2)
    {
      for (i = 0; i != v9; ++i)
      {
        if (*(_QWORD *)v18 != v10)
          objc_enumerationMutation(v6);
        v12 = *(void **)(*((_QWORD *)&v17 + 1) + 8 * i);
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          objc_msgSend(v12, "metricsContext", (_QWORD)v17);
          v13 = objc_claimAutoreleasedReturnValue();
          if (v13)
          {
            v8 = (void *)v13;

            -[AFUIDisambiguationAnalyticsManager _allListItems](self, "_allListItems");
            v14 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v14, "firstObject");
            v15 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v15, "aceId");
            v16 = (void *)objc_claimAutoreleasedReturnValue();
            -[AFUIDisambiguationAnalyticsManager _recordSASMetrics:withSelectedBundleId:originalCommandId:](self, "_recordSASMetrics:withSelectedBundleId:originalCommandId:", v8, 0, v16);

            goto LABEL_12;
          }
        }
      }
      v9 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
      if (v9)
        continue;
      break;
    }
    v8 = v6;
  }
LABEL_12:

}

- (void)_logDisambiguationSelectedEventWithListItem:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t i;
  uint64_t v19;
  void *v20;
  void *v21;
  AFUIDisambiguationAnalyticsManager *v22;
  void *v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  _QWORD v28[6];
  _BYTE v29[128];
  uint64_t v30;

  v30 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  objc_msgSend(v4, "aceId");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "title");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BE090C8], "sharedAnalytics");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v28[0] = MEMORY[0x24BDAC760];
  v28[1] = 3221225472;
  v28[2] = __82__AFUIDisambiguationAnalyticsManager__logDisambiguationSelectedEventWithListItem___block_invoke;
  v28[3] = &unk_24D7A30B0;
  v28[4] = v5;
  v28[5] = v6;
  objc_msgSend(v7, "logEventWithType:contextProvider:", 1426, v28);

  objc_msgSend(v4, "sruif_appInfo");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[AFUIDisambiguationAnalyticsManager _allListItems](self, "_allListItems");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_sruif_appInfo);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "valueForKey:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "appIdentifyingInfo");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "sruif_bundleId");
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    objc_msgSend(v8, "metricsContext");
    v14 = (id)objc_claimAutoreleasedReturnValue();
    if (v14)
    {
LABEL_13:
      objc_msgSend(v4, "aceId");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      -[AFUIDisambiguationAnalyticsManager _recordSASMetrics:withSelectedBundleId:originalCommandId:](self, "_recordSASMetrics:withSelectedBundleId:originalCommandId:", v14, v13, v21);

    }
    else
    {
      v26 = 0u;
      v27 = 0u;
      v24 = 0u;
      v25 = 0u;
      v14 = v11;
      v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v24, v29, 16);
      if (v15)
      {
        v16 = v15;
        v22 = self;
        v23 = v5;
        v17 = *(_QWORD *)v25;
        while (2)
        {
          for (i = 0; i != v16; ++i)
          {
            if (*(_QWORD *)v25 != v17)
              objc_enumerationMutation(v14);
            objc_msgSend(*(id *)(*((_QWORD *)&v24 + 1) + 8 * i), "metricsContext", v22);
            v19 = objc_claimAutoreleasedReturnValue();
            if (v19)
            {
              v20 = (void *)v19;

              v14 = v20;
              self = v22;
              v5 = v23;
              goto LABEL_13;
            }
          }
          v16 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v24, v29, 16);
          if (v16)
            continue;
          break;
        }
        v5 = v23;
      }
    }

  }
}

id __82__AFUIDisambiguationAnalyticsManager__logDisambiguationSelectedEventWithListItem___block_invoke(uint64_t a1)
{
  id v2;
  uint64_t v3;
  uint64_t v4;

  v2 = objc_alloc_init(MEMORY[0x24BDBCED8]);
  objc_msgSend(v2, "setObject:forKey:", CFSTR("manual"), CFSTR("type"));
  v3 = *(_QWORD *)(a1 + 32);
  if (v3)
    objc_msgSend(v2, "setObject:forKey:", v3, CFSTR("aceId"));
  v4 = *(_QWORD *)(a1 + 40);
  if (v4)
    objc_msgSend(v2, "setObject:forKey:", v4, CFSTR("title"));
  return v2;
}

- (id)_listItemMatchingAceId:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  char v14;
  id v15;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  if (v4)
  {
    v19 = 0u;
    v20 = 0u;
    v17 = 0u;
    v18 = 0u;
    -[AFUIDisambiguationAnalyticsManager _allListItems](self, "_allListItems", 0);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
    if (v6)
    {
      v7 = v6;
      v8 = *(_QWORD *)v18;
      while (2)
      {
        for (i = 0; i != v7; ++i)
        {
          if (*(_QWORD *)v18 != v8)
            objc_enumerationMutation(v5);
          v10 = *(void **)(*((_QWORD *)&v17 + 1) + 8 * i);
          objc_msgSend(v10, "aceId");
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          if (objc_msgSend(v11, "isEqualToString:", v4))
          {

LABEL_15:
            v15 = v10;
            goto LABEL_16;
          }
          objc_msgSend(v10, "sruif_appInfo");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v12, "aceId");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          v14 = objc_msgSend(v13, "isEqualToString:", v4);

          if ((v14 & 1) != 0)
            goto LABEL_15;
        }
        v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
        v15 = 0;
        if (v7)
          continue;
        break;
      }
    }
    else
    {
      v15 = 0;
    }
LABEL_16:

  }
  else
  {
    v15 = 0;
  }

  return v15;
}

- (id)_allListItems
{
  void *v2;
  void *v3;

  -[AFUIDisambiguationAnalyticsManager listItems](self, "listItems");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "valueForKeyPath:", CFSTR("@unionOfArrays.self"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (AFUIDisambiguationAnalyticsManagerDataSource)dataSource
{
  return (AFUIDisambiguationAnalyticsManagerDataSource *)objc_loadWeakRetained((id *)&self->_dataSource);
}

- (void)setDataSource:(id)a3
{
  objc_storeWeak((id *)&self->_dataSource, a3);
}

- (NSArray)listItems
{
  return self->_listItems;
}

- (void)setListItems:(id)a3
{
  objc_storeStrong((id *)&self->_listItems, a3);
}

- (AFDisambiguationAssistance)disambiguationAssistance
{
  return self->_disambiguationAssistance;
}

- (void)setDisambiguationAssistance:(id)a3
{
  objc_storeStrong((id *)&self->_disambiguationAssistance, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_disambiguationAssistance, 0);
  objc_storeStrong((id *)&self->_listItems, 0);
  objc_destroyWeak((id *)&self->_dataSource);
}

- (void)logDisambiguationItemSelected:(void *)a1 .cold.1(void *a1, void *a2)
{
  NSObject *v3;
  void *v4;
  int v5;
  const char *v6;
  __int16 v7;
  void *v8;
  uint64_t v9;

  v9 = *MEMORY[0x24BDAC8D0];
  v3 = a1;
  objc_msgSend(a2, "selectedAceId");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = 136315394;
  v6 = "-[AFUIDisambiguationAnalyticsManager logDisambiguationItemSelected:]";
  v7 = 2112;
  v8 = v4;
  _os_log_error_impl(&dword_217514000, v3, OS_LOG_TYPE_ERROR, "%s Failed to log 'disambiguation selected' event with selected ace id: %@", (uint8_t *)&v5, 0x16u);

}

@end
