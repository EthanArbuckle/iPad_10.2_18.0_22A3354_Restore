@implementation MDMAppPropertyShim

- (void)fetchAppItems
{
  -[MDMAppPropertyShim _createRequest](self, "_createRequest");
  -[MDMAppPropertyShim _executeRequest](self, "_executeRequest");
  -[MDMAppPropertyShim _createAppItems](self, "_createAppItems");
}

- (void)_createRequest
{
  void *v3;
  void *v4;
  void *v5;
  id v6;

  -[MDMAppPropertyShim _createKeysForRequest](self, "_createKeysForRequest");
  v6 = (id)objc_opt_new();
  objc_msgSend(v6, "setType:", 2);
  -[MDMAppPropertyShim appsRequested](self, "appsRequested");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "allObjects");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setBundleIdentifiers:", v4);

  objc_msgSend(v6, "setManagedAppsOnly:", -[MDMAppPropertyShim shouldReturnManagedAppsOnly](self, "shouldReturnManagedAppsOnly"));
  objc_msgSend(v6, "setDeleteFeedback:", 0);
  objc_msgSend(v6, "setAdvanceTransientStates:", 0);
  -[MDMAppPropertyShim keysForRequest](self, "keysForRequest");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setPropertyKeys:", v5);

  -[MDMAppPropertyShim setRequest:](self, "setRequest:", v6);
}

- (void)_createKeysForRequest
{
  void *v3;
  void *v4;
  id v5;

  v3 = (void *)objc_opt_class();
  -[MDMAppPropertyShim itemsRequested](self, "itemsRequested");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "_dmdKeysToRequestToGetItems:", v5);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[MDMAppPropertyShim setKeysForRequest:](self, "setKeysForRequest:", v4);

}

- (void)_executeRequest
{
  void *v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;
  MDMAppPropertyShimException *v8;
  void *v9;
  MDMAppPropertyShimException *v10;
  id v11;
  const __CFString *v12;
  _QWORD v13[2];

  v13[1] = *MEMORY[0x24BDAC8D0];
  -[MDMAppPropertyShim deviceManagementUserConnection](self, "deviceManagementUserConnection");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[MDMAppPropertyShim request](self, "request");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = 0;
  objc_msgSend(v3, "performRequest:error:", v4, &v11);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v11;

  if (!v5)
  {
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("request for app items failed: %@"), v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = [MDMAppPropertyShimException alloc];
    v12 = CFSTR("error");
    v13[0] = v6;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v13, &v12, 1);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = -[MDMAppPropertyShimException initWithName:reason:userInfo:](v8, "initWithName:reason:userInfo:", CFSTR("MCDMDAppPropertyShimExceptionRequestFailed"), v7, v9);

    -[MDMAppPropertyShimException raise](v10, "raise");
  }
  -[MDMAppPropertyShim setResponse:](self, "setResponse:", v5);

}

- (void)_createAppItems
{
  void *v3;
  void *v4;
  void *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  BOOL v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
  -[MDMAppPropertyShim response](self, "response");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appsByBundleIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  v5 = (void *)objc_opt_new();
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v6 = v4;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v17;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v17 != v9)
          objc_enumerationMutation(v6);
        v11 = *(_QWORD *)(*((_QWORD *)&v16 + 1) + 8 * i);
        objc_msgSend(v6, "objectForKeyedSubscript:", v11, (_QWORD)v16);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        -[MDMAppPropertyShim _appDictionaryFromApp:](self, "_appDictionaryFromApp:", v12);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        if (!-[MDMAppPropertyShim shouldReturnManagedAppsOnly](self, "shouldReturnManagedAppsOnly")
          || (objc_msgSend(v12, "sourceIdentifier"),
              v14 = (void *)objc_claimAutoreleasedReturnValue(),
              v15 = v14 != 0,
              v14,
              !v15))
        {
          if (v13)
            objc_msgSend(v5, "setObject:forKeyedSubscript:", v13, v11);
        }

      }
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    }
    while (v8);
  }

  -[MDMAppPropertyShim setAppItems:](self, "setAppItems:", v5);
}

- (DMFConnection)deviceManagementUserConnection
{
  DMFConnection *deviceManagementUserConnection;
  DMFConnection *v4;
  DMFConnection *v5;

  deviceManagementUserConnection = self->_deviceManagementUserConnection;
  if (!deviceManagementUserConnection)
  {
    objc_msgSend(MEMORY[0x24BE2C7E0], "currentUserConnection");
    v4 = (DMFConnection *)objc_claimAutoreleasedReturnValue();
    v5 = self->_deviceManagementUserConnection;
    self->_deviceManagementUserConnection = v4;

    deviceManagementUserConnection = self->_deviceManagementUserConnection;
  }
  return deviceManagementUserConnection;
}

+ (id)_itemKeyToDMDKeyMappingTable
{
  _QWORD v3[16];
  _QWORD v4[17];

  v4[16] = *MEMORY[0x24BDAC8D0];
  v3[0] = CFSTR("AdHocCodeSigned");
  v3[1] = CFSTR("AppStoreVendable");
  v4[0] = CFSTR("isAdHocCodeSigned");
  v4[1] = CFSTR("isAppStoreVendable");
  v3[2] = CFSTR("BetaApp");
  v3[3] = CFSTR("BundleSize");
  v4[2] = CFSTR("isBetaApp");
  v4[3] = CFSTR("staticUsage");
  v3[4] = CFSTR("DeviceBasedVPP");
  v3[5] = CFSTR("DynamicSize");
  v4[4] = CFSTR("isDeviceBasedVPP");
  v4[5] = CFSTR("dynamicUsage");
  v3[6] = CFSTR("ExternalVersionIdentifier");
  v3[7] = CFSTR("DistributorIdentifier");
  v4[6] = CFSTR("externalVersionIdentifier");
  v4[7] = CFSTR("distributorIdentifier");
  v3[8] = CFSTR("HasUpdateAvailable");
  v3[9] = CFSTR("Identifier");
  v4[8] = CFSTR("hasUpdateAvailable");
  v4[9] = CFSTR("bundleIdentifier");
  v3[10] = CFSTR("Installing");
  v3[11] = CFSTR("IsValidated");
  v4[10] = CFSTR("installationState");
  v4[11] = CFSTR("isValidated");
  v3[12] = CFSTR("Name");
  v3[13] = CFSTR("ShortVersion");
  v4[12] = CFSTR("displayName");
  v4[13] = CFSTR("shortVersion");
  v3[14] = CFSTR("Version");
  v3[15] = CFSTR("IsAppClip");
  v4[14] = CFSTR("version");
  v4[15] = CFSTR("isAppClip");
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v4, v3, 16);
  return (id)objc_claimAutoreleasedReturnValue();
}

+ (id)_dmdKeysToRequestToGetItems:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  objc_msgSend(a1, "_itemKeyToDMDKeyMappingTable");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_opt_new();
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v7 = v4;
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v16;
    do
    {
      v11 = 0;
      do
      {
        if (*(_QWORD *)v16 != v10)
          objc_enumerationMutation(v7);
        objc_msgSend(v5, "objectForKeyedSubscript:", *(_QWORD *)(*((_QWORD *)&v15 + 1) + 8 * v11), (_QWORD)v15);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        if (v12)
          objc_msgSend(v6, "addObject:", v12);

        ++v11;
      }
      while (v9 != v11);
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    }
    while (v9);
  }

  objc_msgSend(v6, "addObject:", CFSTR("bundleIdentifier"));
  objc_msgSend(v6, "addObject:", CFSTR("installationState"));
  objc_msgSend(v6, "addObject:", CFSTR("storeItemIdentifier"));
  objc_msgSend(v6, "addObject:", CFSTR("sourceIdentifier"));
  objc_msgSend(v6, "allObjects");
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  return v13;
}

- (id)_appDictionaryFromApp:(id)a3
{
  id v4;
  void *v5;
  unint64_t v6;
  void *v7;
  unsigned int v8;
  void *v9;
  int v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  void *v15;
  int v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  int v21;
  void *v22;
  void *v23;
  int v24;
  void *v25;
  void *v26;
  int v27;
  void *v28;
  void *v29;
  int v30;
  void *v31;
  void *v32;
  int v33;
  void *v34;
  void *v35;
  int v36;
  id v37;
  void *v38;
  void *v39;
  uint64_t v40;
  void *v41;
  int v42;
  void *v43;
  uint64_t v44;
  uint64_t v45;
  void *v46;
  int v47;
  uint64_t v48;
  void *v49;
  int v50;
  uint64_t v51;
  void *v52;
  int v53;
  uint64_t v54;
  void *v55;
  int v56;
  uint64_t v57;
  void *v58;
  int v59;
  uint64_t v60;
  void *v61;
  int v62;
  uint64_t v63;
  void *v64;

  v4 = a3;
  v5 = (void *)objc_opt_new();
  v6 = objc_msgSend(v4, "installationState") - 2;
  if (v6 <= 5 && ((0x37u >> v6) & 1) != 0)
  {
    v8 = 0x33u >> v6;
    -[MDMAppPropertyShim itemsRequested](self, "itemsRequested");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "containsObject:", CFSTR("Installing"));

    v11 = MEMORY[0x24BDBD1C8];
    v12 = MEMORY[0x24BDBD1C0];
    if (v10)
    {
      if ((v8 & 1) != 0)
        v13 = MEMORY[0x24BDBD1C8];
      else
        v13 = MEMORY[0x24BDBD1C0];
      objc_msgSend(v5, "setObject:forKeyedSubscript:", v13, CFSTR("Installing"));
    }
    objc_msgSend(v4, "bundleIdentifier");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setObject:forKeyedSubscript:", v14, CFSTR("Identifier"));

    -[MDMAppPropertyShim itemsRequested](self, "itemsRequested");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_msgSend(v15, "containsObject:", CFSTR("ExternalVersionIdentifier"));

    if (v16)
    {
      v17 = (void *)MEMORY[0x24BDD16E0];
      objc_msgSend(v4, "externalVersionIdentifier");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "numberWithUnsignedInteger:", objc_msgSend(v18, "unsignedIntegerValue"));
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "setObject:forKeyedSubscript:", v19, CFSTR("ExternalVersionIdentifier"));

    }
    -[MDMAppPropertyShim itemsRequested](self, "itemsRequested");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = objc_msgSend(v20, "containsObject:", CFSTR("DistributorIdentifier"));

    if (v21)
    {
      objc_msgSend(v4, "distributorIdentifier");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "setObject:forKeyedSubscript:", v22, CFSTR("DistributorIdentifier"));

    }
    -[MDMAppPropertyShim itemsRequested](self, "itemsRequested");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = objc_msgSend(v23, "containsObject:", CFSTR("Version"));

    if (v24)
    {
      objc_msgSend(v4, "version");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "setObject:forKeyedSubscript:", v25, CFSTR("Version"));

    }
    -[MDMAppPropertyShim itemsRequested](self, "itemsRequested");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v27 = objc_msgSend(v26, "containsObject:", CFSTR("ShortVersion"));

    if (v27)
    {
      objc_msgSend(v4, "shortVersion");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "setObject:forKeyedSubscript:", v28, CFSTR("ShortVersion"));

    }
    -[MDMAppPropertyShim itemsRequested](self, "itemsRequested");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    v30 = objc_msgSend(v29, "containsObject:", CFSTR("Name"));

    if (v30)
    {
      objc_msgSend(v4, "displayName");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "setObject:forKeyedSubscript:", v31, CFSTR("Name"));

    }
    -[MDMAppPropertyShim itemsRequested](self, "itemsRequested");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    v33 = objc_msgSend(v32, "containsObject:", CFSTR("BundleSize"));

    if (v33)
    {
      objc_msgSend(v4, "staticUsage");
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "setObject:forKeyedSubscript:", v34, CFSTR("BundleSize"));

    }
    -[MDMAppPropertyShim itemsRequested](self, "itemsRequested");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    v36 = objc_msgSend(v35, "containsObject:", CFSTR("DynamicSize"));

    if ((v8 & 1) == 0 && v36)
    {
      objc_msgSend(v4, "dynamicUsage");
      v37 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "onDemandResourcesUsage");
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      v39 = v38;
      if (v38)
      {
        if (v37)
        {
          objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", objc_msgSend(v38, "unsignedLongLongValue") + objc_msgSend(v37, "unsignedLongLongValue"));
          v40 = objc_claimAutoreleasedReturnValue();

          v37 = (id)v40;
        }
        else
        {
          v37 = v38;
        }
      }
      objc_msgSend(v5, "setObject:forKeyedSubscript:", v37, CFSTR("DynamicSize"));

    }
    -[MDMAppPropertyShim itemsRequested](self, "itemsRequested");
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    v42 = objc_msgSend(v41, "containsObject:", CFSTR("HasUpdateAvailable"));

    if (v42)
    {
      objc_msgSend(v4, "storeItemIdentifier");
      v43 = (void *)objc_claimAutoreleasedReturnValue();
      v44 = objc_msgSend(v43, "longLongValue");

      if (v44)
      {
        if (objc_msgSend(v4, "hasUpdateAvailable"))
          v45 = v11;
        else
          v45 = v12;
        objc_msgSend(v5, "setObject:forKeyedSubscript:", v45, CFSTR("HasUpdateAvailable"));
      }
    }
    -[MDMAppPropertyShim itemsRequested](self, "itemsRequested");
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    v47 = objc_msgSend(v46, "containsObject:", CFSTR("IsValidated"));

    if (v47)
    {
      if (objc_msgSend(v4, "isValidated"))
        v48 = v11;
      else
        v48 = v12;
      objc_msgSend(v5, "setObject:forKeyedSubscript:", v48, CFSTR("IsValidated"));
    }
    -[MDMAppPropertyShim itemsRequested](self, "itemsRequested");
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    v50 = objc_msgSend(v49, "containsObject:", CFSTR("AppStoreVendable"));

    if (v50)
    {
      if (objc_msgSend(v4, "isAppStoreVendable"))
        v51 = v11;
      else
        v51 = v12;
      objc_msgSend(v5, "setObject:forKeyedSubscript:", v51, CFSTR("AppStoreVendable"));
    }
    -[MDMAppPropertyShim itemsRequested](self, "itemsRequested");
    v52 = (void *)objc_claimAutoreleasedReturnValue();
    v53 = objc_msgSend(v52, "containsObject:", CFSTR("DeviceBasedVPP"));

    if (v53)
    {
      if (objc_msgSend(v4, "isDeviceBasedVPP"))
        v54 = v11;
      else
        v54 = v12;
      objc_msgSend(v5, "setObject:forKeyedSubscript:", v54, CFSTR("DeviceBasedVPP"));
    }
    -[MDMAppPropertyShim itemsRequested](self, "itemsRequested");
    v55 = (void *)objc_claimAutoreleasedReturnValue();
    v56 = objc_msgSend(v55, "containsObject:", CFSTR("BetaApp"));

    if (v56)
    {
      if (objc_msgSend(v4, "isBetaApp"))
        v57 = v11;
      else
        v57 = v12;
      objc_msgSend(v5, "setObject:forKeyedSubscript:", v57, CFSTR("BetaApp"));
    }
    -[MDMAppPropertyShim itemsRequested](self, "itemsRequested");
    v58 = (void *)objc_claimAutoreleasedReturnValue();
    v59 = objc_msgSend(v58, "containsObject:", CFSTR("AdHocCodeSigned"));

    if (v59)
    {
      if (objc_msgSend(v4, "isAdHocCodeSigned"))
        v60 = v11;
      else
        v60 = v12;
      objc_msgSend(v5, "setObject:forKeyedSubscript:", v60, CFSTR("AdHocCodeSigned"));
    }
    -[MDMAppPropertyShim itemsRequested](self, "itemsRequested");
    v61 = (void *)objc_claimAutoreleasedReturnValue();
    v62 = objc_msgSend(v61, "containsObject:", CFSTR("IsAppClip"));

    if (v62)
    {
      if (objc_msgSend(v4, "isAppClip"))
        v63 = v11;
      else
        v63 = v12;
      objc_msgSend(v5, "setObject:forKeyedSubscript:", v63, CFSTR("IsAppClip"));
    }
    objc_msgSend(v4, "sourceIdentifier");
    v64 = (void *)objc_claimAutoreleasedReturnValue();

    if (v64)
      objc_msgSend(v5, "setObject:forKeyedSubscript:", *MEMORY[0x24BE2A878], CFSTR("Source"));
    v7 = (void *)objc_msgSend(v5, "copy");
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (NSSet)appsRequested
{
  return self->_appsRequested;
}

- (void)setAppsRequested:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
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
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (NSDictionary)appItems
{
  return self->_appItems;
}

- (void)setAppItems:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (void)setDeviceManagementUserConnection:(id)a3
{
  objc_storeStrong((id *)&self->_deviceManagementUserConnection, a3);
}

- (DMFFetchAppsRequest)request
{
  return self->_request;
}

- (void)setRequest:(id)a3
{
  objc_storeStrong((id *)&self->_request, a3);
}

- (NSArray)keysForRequest
{
  return self->_keysForRequest;
}

- (void)setKeysForRequest:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 56);
}

- (DMFFetchAppsResultObject)response
{
  return self->_response;
}

- (void)setResponse:(id)a3
{
  objc_storeStrong((id *)&self->_response, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_response, 0);
  objc_storeStrong((id *)&self->_keysForRequest, 0);
  objc_storeStrong((id *)&self->_request, 0);
  objc_storeStrong((id *)&self->_deviceManagementUserConnection, 0);
  objc_storeStrong((id *)&self->_appItems, 0);
  objc_storeStrong((id *)&self->_itemsRequested, 0);
  objc_storeStrong((id *)&self->_appsRequested, 0);
}

@end
