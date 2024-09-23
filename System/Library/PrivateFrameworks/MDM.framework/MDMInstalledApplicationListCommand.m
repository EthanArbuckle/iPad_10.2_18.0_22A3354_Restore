@implementation MDMInstalledApplicationListCommand

- (id)responseForRequest:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  const __CFString *v19;
  void *v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  -[MDMInstalledApplicationListCommand _reset](self, "_reset");
  -[MDMInstalledApplicationListCommand setRequest:](self, "setRequest:", v4);
  -[MDMInstalledApplicationListCommand _processArguments](self, "_processArguments");
  -[MDMInstalledApplicationListCommand fetchAppProperties](self, "fetchAppProperties");
  v5 = (void *)objc_opt_new();
  -[MDMInstalledApplicationListCommand appItems](self, "appItems");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = 0u;
  v18 = 0u;
  v15 = 0u;
  v16 = 0u;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v15, v21, 16);
  if (v7)
  {
    v8 = *(_QWORD *)v16;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v16 != v8)
          objc_enumerationMutation(v6);
        objc_msgSend(v6, "objectForKeyedSubscript:", *(_QWORD *)(*((_QWORD *)&v15 + 1) + 8 * v9));
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        if (v10)
          objc_msgSend(v5, "addObject:", v10);

        ++v9;
      }
      while (v7 != v9);
      v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v15, v21, 16);
    }
    while (v7);
  }
  +[MDMAbstractTunnelParser responseWithStatus:](MDMParser, "responseWithStatus:", CFSTR("Acknowledged"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = CFSTR("InstalledApplicationList");
  v20 = v5;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v20, &v19, 1);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "addEntriesFromDictionary:", v12);

  v13 = (void *)objc_msgSend(v11, "copy");
  return v13;
}

- (void)_reset
{
  -[MDMInstalledApplicationListCommand setRequest:](self, "setRequest:", 0);
  -[MDMInstalledApplicationListCommand setAppsRequested:](self, "setAppsRequested:", 0);
  -[MDMInstalledApplicationListCommand setShouldReturnManagedAppsOnly:](self, "setShouldReturnManagedAppsOnly:", 0);
  -[MDMInstalledApplicationListCommand setItemsRequested:](self, "setItemsRequested:", 0);
}

- (void)_processArguments
{
  -[MDMInstalledApplicationListCommand _processIdentifiersArgument](self, "_processIdentifiersArgument");
  -[MDMInstalledApplicationListCommand _processManagedAppsOnlyArgument](self, "_processManagedAppsOnlyArgument");
  -[MDMInstalledApplicationListCommand _processItemsArgument](self, "_processItemsArgument");
}

- (void)_processIdentifiersArgument
{
  void *v3;
  void *v4;
  void *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  MDMInstalledApplicationListCommand *v13;
  void *v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  -[MDMInstalledApplicationListCommand _validateRequestDictionaryIsPresentAndADictionary](self, "_validateRequestDictionaryIsPresentAndADictionary");
  -[MDMInstalledApplicationListCommand request](self, "request");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("Identifiers"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    v13 = self;
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
      objc_msgSend(MEMORY[0x24BDBCE88], "raise:format:", CFSTR("InvalidArgument"), CFSTR("argument Identifiers is not an array"));
    v5 = (void *)objc_opt_new();
    v15 = 0u;
    v16 = 0u;
    v17 = 0u;
    v18 = 0u;
    v14 = v4;
    v6 = v4;
    v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    if (v7)
    {
      v8 = v7;
      v9 = *(_QWORD *)v16;
      do
      {
        v10 = 0;
        do
        {
          if (*(_QWORD *)v16 != v9)
            objc_enumerationMutation(v6);
          v11 = *(_QWORD *)(*((_QWORD *)&v15 + 1) + 8 * v10);
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) == 0)
            objc_msgSend(MEMORY[0x24BDBCE88], "raise:format:", CFSTR("InvalidArgument"), CFSTR("identifier is not a string"));
          objc_msgSend(v5, "addObject:", v11, v13);
          ++v10;
        }
        while (v8 != v10);
        v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
      }
      while (v8);
    }

    v12 = (void *)objc_msgSend(v5, "copy");
    -[MDMInstalledApplicationListCommand setAppsRequested:](v13, "setAppsRequested:", v12);

    v4 = v14;
  }
  else
  {
    -[MDMInstalledApplicationListCommand setAppsRequested:](self, "setAppsRequested:", 0);
  }

}

- (void)_processManagedAppsOnlyArgument
{
  void *v3;
  void *v4;
  char isKindOfClass;
  id v6;

  -[MDMInstalledApplicationListCommand _validateRequestDictionaryIsPresentAndADictionary](self, "_validateRequestDictionaryIsPresentAndADictionary");
  -[MDMInstalledApplicationListCommand request](self, "request");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("ManagedAppsOnly"));
  v6 = (id)objc_claimAutoreleasedReturnValue();

  v4 = v6;
  if (v6)
  {
    objc_opt_class();
    isKindOfClass = objc_opt_isKindOfClass();
    v4 = v6;
    if ((isKindOfClass & 1) == 0)
    {
      objc_msgSend(MEMORY[0x24BDBCE88], "raise:format:", CFSTR("InvalidArgument"), CFSTR("argument ManagedAppsOnly is not a number (BOOLean)"));
      v4 = v6;
    }
  }
  -[MDMInstalledApplicationListCommand setShouldReturnManagedAppsOnly:](self, "setShouldReturnManagedAppsOnly:", -[MDMInstalledApplicationListCommand isUserEnrollment](self, "isUserEnrollment") | objc_msgSend(v4, "BOOLValue"));

}

- (void)_processItemsArgument
{
  MDMInstalledApplicationListCommand *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  uint64_t v13;
  NSObject *v14;
  void *v15;
  void *v16;
  void *v17;
  MDMInstalledApplicationListCommand *v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  uint8_t buf[4];
  uint64_t v24;
  _BYTE v25[128];
  uint64_t v26;

  v2 = self;
  v26 = *MEMORY[0x24BDAC8D0];
  -[MDMInstalledApplicationListCommand _validateRequestDictionaryIsPresentAndADictionary](self, "_validateRequestDictionaryIsPresentAndADictionary");
  -[MDMInstalledApplicationListCommand request](v2, "request");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("Items"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  v5 = (void *)objc_opt_new();
  objc_msgSend((id)objc_opt_class(), "allItems");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (v4)
  {
    v18 = v2;
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
      objc_msgSend(MEMORY[0x24BDBCE88], "raise:format:", CFSTR("InvalidArgument"), CFSTR("argument Items is not an array"));
    v21 = 0u;
    v22 = 0u;
    v19 = 0u;
    v20 = 0u;
    v17 = v4;
    v8 = v4;
    v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v19, v25, 16);
    if (v9)
    {
      v10 = v9;
      v11 = *(_QWORD *)v20;
      do
      {
        for (i = 0; i != v10; ++i)
        {
          if (*(_QWORD *)v20 != v11)
            objc_enumerationMutation(v8);
          v13 = *(_QWORD *)(*((_QWORD *)&v19 + 1) + 8 * i);
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) == 0)
            objc_msgSend(MEMORY[0x24BDBCE88], "raise:format:", CFSTR("InvalidArgument"), CFSTR("item is not a string"));
          if (objc_msgSend(v7, "containsObject:", v13, v17))
          {
            objc_msgSend(v5, "addObject:", v13);
          }
          else
          {
            v14 = *(NSObject **)DMCLogObjects();
            if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 138543362;
              v24 = v13;
              _os_log_impl(&dword_222CB9000, v14, OS_LOG_TYPE_ERROR, "InstalledApplicationList command requested invalid Item %{public}@. Ignored.", buf, 0xCu);
            }
          }
        }
        v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v19, v25, 16);
      }
      while (v10);
    }

    v4 = v17;
    v2 = v18;
  }
  else
  {
    objc_msgSend(v6, "allObjects");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "addObjectsFromArray:", v15);

  }
  objc_msgSend((id)objc_opt_class(), "itemsThatMustAlwaysBeReturned");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "unionSet:", v16);

  -[MDMInstalledApplicationListCommand setItemsRequested:](v2, "setItemsRequested:", v5);
}

+ (id)itemsThatMustAlwaysBeReturned
{
  void *v2;
  void *v3;
  void *v4;
  _QWORD v6[2];

  v6[1] = *MEMORY[0x24BDAC8D0];
  v2 = (void *)MEMORY[0x24BDBCF20];
  v6[0] = CFSTR("Identifier");
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v6, 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setWithArray:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (void)_validateRequestDictionaryIsPresentAndADictionary
{
  void *v3;
  void *v4;
  char isKindOfClass;

  -[MDMInstalledApplicationListCommand request](self, "request");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v3)
    objc_msgSend(MEMORY[0x24BDBCE88], "raise:format:", CFSTR("InvalidArgument"), CFSTR("request does not exist"));
  -[MDMInstalledApplicationListCommand request](self, "request");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  if ((isKindOfClass & 1) == 0)
    objc_msgSend(MEMORY[0x24BDBCE88], "raise:format:", CFSTR("InvalidArgument"), CFSTR("request is not a dictionary"));
}

- (void)fetchAppProperties
{
  void *v3;
  void *v4;
  void *v5;
  id v6;

  -[MDMInstalledApplicationListCommand dataSource](self, "dataSource");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  -[MDMInstalledApplicationListCommand appsRequested](self, "appsRequested");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setAppsRequested:", v3);

  objc_msgSend(v6, "setShouldReturnManagedAppsOnly:", -[MDMInstalledApplicationListCommand shouldReturnManagedAppsOnly](self, "shouldReturnManagedAppsOnly"));
  -[MDMInstalledApplicationListCommand itemsRequested](self, "itemsRequested");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setItemsRequested:", v4);

  objc_msgSend(v6, "fetchAppItems");
  objc_msgSend(v6, "appItems");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[MDMInstalledApplicationListCommand setAppItems:](self, "setAppItems:", v5);

}

+ (id)allItems
{
  void *v2;
  void *v3;
  void *v4;
  _QWORD v6[17];

  v6[16] = *MEMORY[0x24BDAC8D0];
  v2 = (void *)MEMORY[0x24BDBCF20];
  v6[0] = CFSTR("Identifier");
  v6[1] = CFSTR("ExternalVersionIdentifier");
  v6[2] = CFSTR("DistributorIdentifier");
  v6[3] = CFSTR("Version");
  v6[4] = CFSTR("ShortVersion");
  v6[5] = CFSTR("Name");
  v6[6] = CFSTR("BundleSize");
  v6[7] = CFSTR("DynamicSize");
  v6[8] = CFSTR("IsValidated");
  v6[9] = CFSTR("Installing");
  v6[10] = CFSTR("AppStoreVendable");
  v6[11] = CFSTR("DeviceBasedVPP");
  v6[12] = CFSTR("BetaApp");
  v6[13] = CFSTR("AdHocCodeSigned");
  v6[14] = CFSTR("HasUpdateAvailable");
  v6[15] = CFSTR("IsAppClip");
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v6, 16);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setWithArray:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (BOOL)isUserEnrollment
{
  return self->_isUserEnrollment;
}

- (void)setIsUserEnrollment:(BOOL)a3
{
  self->_isUserEnrollment = a3;
}

- (MDMAppItemsDataSource)dataSource
{
  return self->_dataSource;
}

- (void)setDataSource:(id)a3
{
  objc_storeStrong((id *)&self->_dataSource, a3);
}

- (NSDictionary)request
{
  return self->_request;
}

- (void)setRequest:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (NSSet)appsRequested
{
  return self->_appsRequested;
}

- (void)setAppsRequested:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (BOOL)shouldReturnManagedAppsOnly
{
  return self->_shouldReturnManagedAppsOnly;
}

- (void)setShouldReturnManagedAppsOnly:(BOOL)a3
{
  self->_shouldReturnManagedAppsOnly = a3;
}

- (NSSet)itemsRequested
{
  return self->_itemsRequested;
}

- (void)setItemsRequested:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (NSDictionary)appItems
{
  return self->_appItems;
}

- (void)setAppItems:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 48);
}

- (NSDictionary)response
{
  return self->_response;
}

- (void)setResponse:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 56);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_response, 0);
  objc_storeStrong((id *)&self->_appItems, 0);
  objc_storeStrong((id *)&self->_itemsRequested, 0);
  objc_storeStrong((id *)&self->_appsRequested, 0);
  objc_storeStrong((id *)&self->_request, 0);
  objc_storeStrong((id *)&self->_dataSource, 0);
}

@end
