@implementation SLRemoteService

- (SLRemoteService)initWithServiceBundle:(id)a3 socialInfoDictionary:(id)a4
{
  uint64_t v4;
  id v8;
  id v9;
  SLRemoteService *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  SLRemoteService *v27;
  SLRemoteService *v28;
  __CFString *v29;
  uint64_t v30;
  uint64_t v31;
  _QWORD v33[4];
  id v34;
  SLRemoteService *v35;
  objc_super v36;

  v8 = a3;
  v9 = a4;
  v36.receiver = self;
  v36.super_class = (Class)SLRemoteService;
  v10 = -[SLRemoteService init](&v36, sel_init);
  if (!v10)
    goto LABEL_15;
  if (!v8)
  {
    v29 = CFSTR("Bundle cannot be nil for remote service");
LABEL_12:
    v30 = v4;
    v31 = 3;
LABEL_14:
    _SLLog(v30, v31, v29);
LABEL_15:
    v28 = 0;
    goto LABEL_16;
  }
  if (!objc_msgSend(v9, "count"))
  {
    v29 = CFSTR("Social service info dictionary cannot be nil or empty");
    goto LABEL_12;
  }
  if (!-[SLRemoteService infoDictHasRequiredKeys:](v10, "infoDictHasRequiredKeys:", v9))
  {
    _SLLog(v4, 3, CFSTR("Social service info dictionary has missing or invalid required keys"));
    v29 = CFSTR("Social info dict is %@");
    v30 = v4;
    v31 = 6;
    goto LABEL_14;
  }
  objc_storeStrong((id *)&v10->_serviceBundle, a3);
  objc_msgSend(v8, "bundleURL");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[SLRemoteService setServiceBundleURL:](v10, "setServiceBundleURL:", v11);

  objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("SLServiceTypeIdentifier"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[SLRemoteService setServiceTypeIdentifier:](v10, "setServiceTypeIdentifier:", v12);

  objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("SLServiceLocalizedName"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  if (v13)
  {
    SLSocialFrameworkBundle();
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("SLServiceLocalizedName"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "localizedStringForKey:value:table:", v15, &stru_1E7592238, CFSTR("Localizable"));
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    -[SLRemoteService setLocalizedServiceName:](v10, "setLocalizedServiceName:", v16);

  }
  objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("SLServiceActivityViewIcon"));
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  -[SLRemoteService setActivityViewIconResourceName:](v10, "setActivityViewIconResourceName:", v17);

  objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("SLServiceTargetRegionChina"));
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  -[SLRemoteService setServiceRegionTargetIsChina:](v10, "setServiceRegionTargetIsChina:", objc_msgSend(v18, "BOOLValue"));

  objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("SLServiceAccountTypeIdentifier"));
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  -[SLRemoteService setAccountTypeIdentifier:](v10, "setAccountTypeIdentifier:", v19);

  objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("SLServiceAuthenticationStyle"));
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  -[SLRemoteService setAuthenticationStyle:](v10, "setAuthenticationStyle:", -[SLRemoteService _authenticationStyleFromAuthenticationStyleIdentifier:](v10, "_authenticationStyleFromAuthenticationStyleIdentifier:", v20));

  objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("SLServiceAddDeviceClassToRequests"));
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  -[SLRemoteService setAddDeviceClassToRequest:](v10, "setAddDeviceClassToRequest:", objc_msgSend(v21, "BOOLValue"));

  -[SLRemoteService _setFromArrayWithKey:inDictionary:](v10, "_setFromArrayWithKey:inDictionary:", CFSTR("SLServiceSupportedImageAssetURLSchemes"), v9);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  -[SLRemoteService setSupportedImageAssetURLSchemes:](v10, "setSupportedImageAssetURLSchemes:", v22);

  -[SLRemoteService _setFromArrayWithKey:inDictionary:](v10, "_setFromArrayWithKey:inDictionary:", CFSTR("SLServiceSupportedVideoAssetURLSchemes"), v9);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  -[SLRemoteService setSupportedVideoAssetURLSchemes:](v10, "setSupportedVideoAssetURLSchemes:", v23);

  objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("SLServiceActivityViewIcon"));
  v24 = (void *)objc_claimAutoreleasedReturnValue();

  if (v24)
  {
    objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("SLServiceActivityViewIcon"));
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    -[SLRemoteService setActivityImageName:](v10, "setActivityImageName:", v25);

  }
  -[SLRemoteService integerPropertyKeyMappings](v10, "integerPropertyKeyMappings");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  v33[0] = MEMORY[0x1E0C809B0];
  v33[1] = 3221225472;
  v33[2] = __62__SLRemoteService_initWithServiceBundle_socialInfoDictionary___block_invoke;
  v33[3] = &unk_1E75914E0;
  v34 = v9;
  v27 = v10;
  v35 = v27;
  objc_msgSend(v26, "enumerateKeysAndObjectsUsingBlock:", v33);

  v28 = v27;
LABEL_16:

  return v28;
}

void __62__SLRemoteService_initWithServiceBundle_socialInfoDictionary___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  void *v5;
  char v6;
  void *v7;
  id v8;

  v8 = a3;
  objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:", a2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v5 || (v6 = objc_opt_respondsToSelector(), v7 = v5, (v6 & 1) == 0))
    v7 = &unk_1E75ADE08;
  objc_msgSend(*(id *)(a1 + 40), "setValue:forKey:", v7, v8);

}

- (BOOL)infoDictHasRequiredKeys:(id)a3
{
  uint64_t v3;
  id v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  void *v12;
  BOOL v13;
  BOOL v14;
  __CFString *v15;
  uint64_t v16;
  uint64_t v17;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _BYTE v23[128];
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  -[SLRemoteService _requiredInfoDictKeys](self, "_requiredInfoDictKeys");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v20;
    while (2)
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v20 != v9)
          objc_enumerationMutation(v6);
        objc_msgSend(v5, "objectForKeyedSubscript:", *(_QWORD *)(*((_QWORD *)&v19 + 1) + 8 * i));
        v11 = (void *)objc_claimAutoreleasedReturnValue();

        if (!v11)
        {
          _SLLog(v3, 3, CFSTR("Social Info Dictionary is missing required key %@"));
          v15 = CFSTR("Social info dict is %@");
          v16 = v3;
          v17 = 6;
          goto LABEL_13;
        }
      }
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
      if (v8)
        continue;
      break;
    }
  }

  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("SLServiceAuthenticationStyle"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = -[SLRemoteService _isValidAuthenicationStyleIdentifier:](self, "_isValidAuthenicationStyleIdentifier:", v12);

  if (v13)
  {
    v14 = 1;
  }
  else
  {
    objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("SLServiceAuthenticationStyle"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = CFSTR("Social Info Dictionary has invalid authentication style identifier %@");
    v16 = v3;
    v17 = 3;
LABEL_13:
    _SLLog(v16, v17, v15);

    v14 = 0;
  }

  return v14;
}

- (id)_requiredInfoDictKeys
{
  _QWORD v3[4];

  v3[3] = *MEMORY[0x1E0C80C00];
  v3[0] = CFSTR("SLServiceTypeIdentifier");
  v3[1] = CFSTR("SLServiceLocalizedName");
  v3[2] = CFSTR("SLServiceAuthenticationStyle");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v3, 3);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)integerPropertyKeyMappings
{
  _QWORD v3[6];
  _QWORD v4[7];

  v4[6] = *MEMORY[0x1E0C80C00];
  v3[0] = CFSTR("SLServiceMaximumURLCount");
  v3[1] = CFSTR("SLServiceMaximumImageCount");
  v4[0] = CFSTR("maximumURLCount");
  v4[1] = CFSTR("maximumImageCount");
  v3[2] = CFSTR("SLServiceMaximumImageDataSize");
  v3[3] = CFSTR("SLServiceMaximumVideoCount");
  v4[2] = CFSTR("maximumImageDataSize");
  v4[3] = CFSTR("maximumVideoCount");
  v3[4] = CFSTR("SLServiceMaximumVideoDataSize");
  v3[5] = CFSTR("SLServiceMaximumVideoTimeLimit");
  v4[4] = CFSTR("maximumVideoDataSize");
  v4[5] = CFSTR("maximumVideoTimeLimit");
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v4, v3, 6);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)_authenticationStyleIdentifierMappings
{
  return &unk_1E75AE150;
}

- (id)_encodableStringProperties
{
  return &unk_1E75AE020;
}

- (BOOL)_isValidAuthenicationStyleIdentifier:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  -[SLRemoteService _authenticationStyleIdentifierMappings](self, "_authenticationStyleIdentifierMappings");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKey:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6 != 0;
}

- (int64_t)_authenticationStyleFromAuthenticationStyleIdentifier:(id)a3
{
  uint64_t v3;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  int64_t v9;

  v5 = a3;
  if (v5)
  {
    -[SLRemoteService _authenticationStyleIdentifierMappings](self, "_authenticationStyleIdentifierMappings");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "objectForKeyedSubscript:", v5);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = v7;
    if (v7)
    {
      v9 = objc_msgSend(v7, "integerValue");
    }
    else
    {
      _SLLog(v3, 3, CFSTR("Invalid authentication style %@ in Social Service info dictionary"));
      v9 = -1;
    }

  }
  else
  {
    _SLLog(v3, 3, CFSTR("Invalid authentication style %@ in Social Service info dictionary"));
    v9 = -1;
  }

  return v9;
}

- (id)_setFromArrayWithKey:(id)a3 inDictionary:(id)a4
{
  uint64_t v4;
  id v6;
  id v7;
  void *v8;
  void *v9;
  char isKindOfClass;
  void *v11;
  void *v12;
  void *v13;

  v6 = a3;
  v7 = a4;
  objc_msgSend(v7, "objectForKeyedSubscript:", v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v8)
    goto LABEL_5;
  objc_msgSend(v7, "objectForKeyedSubscript:", v6);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  if ((isKindOfClass & 1) == 0)
  {
    _SLLog(v4, 3, CFSTR("Incorrect type for SLService info key %@, must be of type NSArray"));
LABEL_5:
    v13 = 0;
    goto LABEL_6;
  }
  v11 = (void *)MEMORY[0x1E0C99E60];
  objc_msgSend(v7, "objectForKeyedSubscript:", v6);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setWithArray:", v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_6:
  return v13;
}

- (id)_activityImageForImageResourceName:(id)a3 inBundle:(id)a4
{
  uint64_t v4;
  void *v7;
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  void *v15;

  v7 = (void *)MEMORY[0x1E0CEA950];
  v8 = a4;
  v9 = a3;
  objc_msgSend(v7, "mainScreen");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "scale");
  _UISharedImageSetPreferredImageScale();

  objc_msgSend(MEMORY[0x1E0CEA638], "_deviceSpecificImageNamed:inBundle:", v9, v8);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v11, "_applicationIconImageForFormat:precomposed:", 10, 1);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (v12)
  {
    v13 = v12;
  }
  else
  {
    -[SLRemoteService serviceTypeIdentifier](self, "serviceTypeIdentifier");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    _SLLog(v4, 4, CFSTR("Unable to fetch activity image for Social XPC service %@"));

  }
  return v12;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t i;
  uint64_t v17;
  void *v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _QWORD v23[4];
  id v24;
  SLRemoteService *v25;
  _BYTE v26[128];
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[SLRemoteService serviceBundleURL](self, "serviceBundleURL");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("serviceBundleURL"));

  objc_msgSend(v4, "encodeBool:forKey:", -[SLRemoteService serviceRegionTargetIsChina](self, "serviceRegionTargetIsChina"), CFSTR("serviceRegionTargetIsChina"));
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", -[SLRemoteService authenticationStyle](self, "authenticationStyle"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v6, CFSTR("authenticationStyle"));

  objc_msgSend(v4, "encodeBool:forKey:", -[SLRemoteService addDeviceClassToRequest](self, "addDeviceClassToRequest"), CFSTR("addDeviceClassToRequest"));
  -[SLRemoteService supportedImageAssetURLSchemes](self, "supportedImageAssetURLSchemes");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v7, CFSTR("supportedImageAssetURLSchemes"));

  -[SLRemoteService supportedVideoAssetURLSchemes](self, "supportedVideoAssetURLSchemes");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v8, CFSTR("supportedVideoAssetURLSchemes"));

  -[SLRemoteService _encodableStringProperties](self, "_encodableStringProperties");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v23[0] = MEMORY[0x1E0C809B0];
  v23[1] = 3221225472;
  v23[2] = __35__SLRemoteService_encodeWithCoder___block_invoke;
  v23[3] = &unk_1E7591508;
  v10 = v4;
  v24 = v10;
  v25 = self;
  objc_msgSend(v9, "enumerateObjectsUsingBlock:", v23);

  v21 = 0u;
  v22 = 0u;
  v19 = 0u;
  v20 = 0u;
  -[SLRemoteService integerPropertyKeyMappings](self, "integerPropertyKeyMappings", 0);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "objectEnumerator");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v19, v26, 16);
  if (v13)
  {
    v14 = v13;
    v15 = *(_QWORD *)v20;
    do
    {
      for (i = 0; i != v14; ++i)
      {
        if (*(_QWORD *)v20 != v15)
          objc_enumerationMutation(v12);
        v17 = *(_QWORD *)(*((_QWORD *)&v19 + 1) + 8 * i);
        -[SLRemoteService valueForKey:](self, "valueForKey:", v17);
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "encodeObject:forKey:", v18, v17);

      }
      v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v19, v26, 16);
    }
    while (v14);
  }

}

void __35__SLRemoteService_encodeWithCoder___block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;
  id v4;
  id v5;

  v2 = *(void **)(a1 + 32);
  v3 = *(void **)(a1 + 40);
  v4 = a2;
  objc_msgSend(v3, "valueForKey:", v4);
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "encodeObject:forKey:", v5, v4);

}

- (SLRemoteService)initWithCoder:(id)a3
{
  id v4;
  SLRemoteService *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  SLRemoteService *v19;
  id v20;
  void *v21;
  void *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  void *v28;
  SLRemoteService *v29;
  id v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  _QWORD v36[4];
  SLRemoteService *v37;
  id v38;
  objc_super v39;
  _BYTE v40[128];
  _QWORD v41[2];
  _QWORD v42[4];

  v42[2] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v39.receiver = self;
  v39.super_class = (Class)SLRemoteService;
  v5 = -[SLRemoteService init](&v39, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("serviceBundleURL"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[SLRemoteService setServiceBundleURL:](v5, "setServiceBundleURL:", v6);

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("serviceRegionTargetIsChina"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[SLRemoteService setServiceRegionTargetIsChina:](v5, "setServiceRegionTargetIsChina:", objc_msgSend(v7, "BOOLValue"));

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("authenticationStyle"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[SLRemoteService setAuthenticationStyle:](v5, "setAuthenticationStyle:", objc_msgSend(v8, "integerValue"));

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("addDeviceClassToRequest"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[SLRemoteService setAddDeviceClassToRequest:](v5, "setAddDeviceClassToRequest:", objc_msgSend(v9, "BOOLValue"));

    v10 = (void *)MEMORY[0x1E0C99E60];
    v42[0] = objc_opt_class();
    v42[1] = objc_opt_class();
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v42, 2);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setWithArray:", v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v12, CFSTR("supportedImageAssetURLSchemes"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[SLRemoteService setSupportedImageAssetURLSchemes:](v5, "setSupportedImageAssetURLSchemes:", v13);

    v14 = (void *)MEMORY[0x1E0C99E60];
    v41[0] = objc_opt_class();
    v41[1] = objc_opt_class();
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v41, 2);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "setWithArray:", v15);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v16, CFSTR("supportedVideoAssetURLSchemes"));
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    -[SLRemoteService setSupportedVideoAssetURLSchemes:](v5, "setSupportedVideoAssetURLSchemes:", v17);

    -[SLRemoteService _encodableStringProperties](v5, "_encodableStringProperties");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v36[0] = MEMORY[0x1E0C809B0];
    v36[1] = 3221225472;
    v36[2] = __33__SLRemoteService_initWithCoder___block_invoke;
    v36[3] = &unk_1E7591508;
    v19 = v5;
    v37 = v19;
    v31 = v4;
    v20 = v4;
    v38 = v20;
    objc_msgSend(v18, "enumerateObjectsUsingBlock:", v36);

    v34 = 0u;
    v35 = 0u;
    v32 = 0u;
    v33 = 0u;
    -[SLRemoteService integerPropertyKeyMappings](v19, "integerPropertyKeyMappings");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "objectEnumerator");
    v22 = (void *)objc_claimAutoreleasedReturnValue();

    v23 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v32, v40, 16);
    if (v23)
    {
      v24 = v23;
      v25 = *(_QWORD *)v33;
      do
      {
        v26 = 0;
        do
        {
          if (*(_QWORD *)v33 != v25)
            objc_enumerationMutation(v22);
          v27 = *(_QWORD *)(*((_QWORD *)&v32 + 1) + 8 * v26);
          objc_msgSend(v20, "decodeObjectOfClass:forKey:", objc_opt_class(), v27);
          v28 = (void *)objc_claimAutoreleasedReturnValue();
          -[SLRemoteService setValue:forKey:](v19, "setValue:forKey:", v28, v27);

          ++v26;
        }
        while (v24 != v26);
        v24 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v32, v40, 16);
      }
      while (v24);
    }

    v29 = v19;
    v4 = v31;
  }

  return v5;
}

void __33__SLRemoteService_initWithCoder___block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;
  id v4;
  id v5;

  v2 = *(void **)(a1 + 32);
  v3 = *(void **)(a1 + 40);
  v4 = a2;
  objc_msgSend(v3, "decodeObjectOfClass:forKey:", objc_opt_class(), v4);
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setValue:forKey:", v5, v4);

}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (BOOL)isFirstClassService
{
  return 1;
}

- (BOOL)supportsImageURL:(id)a3
{
  id v4;
  void *v5;

  v4 = a3;
  -[SLRemoteService supportedImageAssetURLSchemes](self, "supportedImageAssetURLSchemes");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(self) = -[SLRemoteService _isSupportedURL:withSupportedSchemes:](self, "_isSupportedURL:withSupportedSchemes:", v4, v5);

  return (char)self;
}

- (BOOL)supportsVideoURL:(id)a3
{
  id v4;
  void *v5;

  v4 = a3;
  -[SLRemoteService supportedVideoAssetURLSchemes](self, "supportedVideoAssetURLSchemes");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(self) = -[SLRemoteService _isSupportedURL:withSupportedSchemes:](self, "_isSupportedURL:withSupportedSchemes:", v4, v5);

  return (char)self;
}

- (BOOL)_isSupportedURL:(id)a3 withSupportedSchemes:(id)a4
{
  id v5;
  void *v6;
  void *v7;

  v5 = a4;
  objc_msgSend(a3, "scheme");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "member:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7 != 0;
}

- (NSBundle)serviceBundle
{
  NSBundle *serviceBundle;
  void *v4;
  void *v5;
  NSBundle *v6;
  NSBundle *v7;

  serviceBundle = self->_serviceBundle;
  if (!serviceBundle)
  {
    v4 = (void *)MEMORY[0x1E0CB34D0];
    -[SLRemoteService serviceBundleURL](self, "serviceBundleURL");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "bundleWithURL:", v5);
    v6 = (NSBundle *)objc_claimAutoreleasedReturnValue();
    v7 = self->_serviceBundle;
    self->_serviceBundle = v6;

    serviceBundle = self->_serviceBundle;
  }
  return serviceBundle;
}

- (id)activityImage
{
  uint64_t v2;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  -[SLRemoteService activityImageName](self, "activityImageName");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    -[SLRemoteService activityImageName](self, "activityImageName");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[SLRemoteService serviceBundle](self, "serviceBundle");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[SLRemoteService _activityImageForImageResourceName:inBundle:](self, "_activityImageForImageResourceName:inBundle:", v5, v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    _SLLog(v2, 4, CFSTR("Cannot create activity image, activityImageName is nil"));
    v7 = 0;
  }
  return v7;
}

- (id)composeViewController
{
  void *v2;
  void *v3;

  -[SLRemoteService serviceType](self, "serviceType");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  +[SLComposeViewController composeViewControllerForServiceType:](SLComposeViewController, "composeViewControllerForServiceType:", v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

+ (id)_cachedServices
{
  if (_cachedServices_onceToken != -1)
    dispatch_once(&_cachedServices_onceToken, &__block_literal_global_9);
  return (id)__remoteServices;
}

void __34__SLRemoteService__cachedServices__block_invoke()
{
  uint64_t v0;
  void *v1;

  +[SLRemoteServicePlistLoader allServices](SLRemoteServicePlistLoader, "allServices");
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)__remoteServices;
  __remoteServices = v0;

}

+ (id)_cachedServiceWithType:(id)a3
{
  id v3;
  id v4;
  id v5;
  uint64_t v6;
  void *i;
  void *v8;
  void *v9;
  char v10;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  +[SLRemoteService _cachedServices](SLRemoteService, "_cachedServices");
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v4 = (id)objc_claimAutoreleasedReturnValue();
  v5 = (id)objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v5)
  {
    v6 = *(_QWORD *)v13;
    while (2)
    {
      for (i = 0; i != v5; i = (char *)i + 1)
      {
        if (*(_QWORD *)v13 != v6)
          objc_enumerationMutation(v4);
        v8 = *(void **)(*((_QWORD *)&v12 + 1) + 8 * (_QWORD)i);
        objc_msgSend(v8, "serviceType", (_QWORD)v12);
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        v10 = objc_msgSend(v9, "isEqualToString:", v3);

        if ((v10 & 1) != 0)
        {
          v5 = v8;
          goto LABEL_11;
        }
      }
      v5 = (id)objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
      if (v5)
        continue;
      break;
    }
  }
LABEL_11:

  return v5;
}

+ (id)remoteServices
{
  return +[SLRemoteService _cachedServices](SLRemoteService, "_cachedServices");
}

+ (id)remoteServiceForTypeIdentifier:(id)a3
{
  return +[SLRemoteService _cachedServiceWithType:](SLRemoteService, "_cachedServiceWithType:", a3);
}

- (id)description
{
  void *v2;
  void *v3;
  void *v4;

  v2 = (void *)MEMORY[0x1E0CB3940];
  -[SLRemoteService serviceType](self, "serviceType");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "stringWithFormat:", CFSTR("SLRemoteService(serviceType=%@)"), v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (int64_t)maximumVideoCount
{
  return self->_maximumVideoCount;
}

- (void)setMaximumVideoCount:(int64_t)a3
{
  self->_maximumVideoCount = a3;
}

- (NSString)serviceTypeIdentifier
{
  return (NSString *)objc_getProperty(self, a2, 40, 1);
}

- (void)setServiceTypeIdentifier:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 40);
}

- (NSString)accountTypeIdentifier
{
  return (NSString *)objc_getProperty(self, a2, 48, 1);
}

- (void)setAccountTypeIdentifier:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 48);
}

- (NSString)localizedServiceName
{
  return (NSString *)objc_getProperty(self, a2, 56, 1);
}

- (void)setLocalizedServiceName:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 56);
}

- (NSString)activityViewIconResourceName
{
  return (NSString *)objc_getProperty(self, a2, 64, 1);
}

- (void)setActivityViewIconResourceName:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 64);
}

- (BOOL)serviceRegionTargetIsChina
{
  return self->_serviceRegionTargetIsChina;
}

- (void)setServiceRegionTargetIsChina:(BOOL)a3
{
  self->_serviceRegionTargetIsChina = a3;
}

- (int64_t)authenticationStyle
{
  return self->_authenticationStyle;
}

- (void)setAuthenticationStyle:(int64_t)a3
{
  self->_authenticationStyle = a3;
}

- (int64_t)maximumURLCount
{
  return self->_maximumURLCount;
}

- (void)setMaximumURLCount:(int64_t)a3
{
  self->_maximumURLCount = a3;
}

- (int64_t)maximumImageCount
{
  return self->_maximumImageCount;
}

- (void)setMaximumImageCount:(int64_t)a3
{
  self->_maximumImageCount = a3;
}

- (int64_t)maximumImageDataSize
{
  return self->_maximumImageDataSize;
}

- (void)setMaximumImageDataSize:(int64_t)a3
{
  self->_maximumImageDataSize = a3;
}

- (int64_t)maximumVideoDataSize
{
  return self->_maximumVideoDataSize;
}

- (void)setMaximumVideoDataSize:(int64_t)a3
{
  self->_maximumVideoDataSize = a3;
}

- (int64_t)maximumVideoTimeLimit
{
  return self->_maximumVideoTimeLimit;
}

- (void)setMaximumVideoTimeLimit:(int64_t)a3
{
  self->_maximumVideoTimeLimit = a3;
}

- (NSSet)supportedImageAssetURLSchemes
{
  return (NSSet *)objc_getProperty(self, a2, 120, 1);
}

- (void)setSupportedImageAssetURLSchemes:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 120);
}

- (NSSet)supportedVideoAssetURLSchemes
{
  return (NSSet *)objc_getProperty(self, a2, 128, 1);
}

- (void)setSupportedVideoAssetURLSchemes:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 128);
}

- (BOOL)addDeviceClassToRequest
{
  return self->_addDeviceClassToRequest;
}

- (void)setAddDeviceClassToRequest:(BOOL)a3
{
  self->_addDeviceClassToRequest = a3;
}

- (NSString)activityImageName
{
  return (NSString *)objc_getProperty(self, a2, 136, 1);
}

- (void)setActivityImageName:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 136);
}

- (NSURL)serviceBundleURL
{
  return (NSURL *)objc_getProperty(self, a2, 144, 1);
}

- (void)setServiceBundleURL:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 144);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_serviceBundleURL, 0);
  objc_storeStrong((id *)&self->_activityImageName, 0);
  objc_storeStrong((id *)&self->_supportedVideoAssetURLSchemes, 0);
  objc_storeStrong((id *)&self->_supportedImageAssetURLSchemes, 0);
  objc_storeStrong((id *)&self->_activityViewIconResourceName, 0);
  objc_storeStrong((id *)&self->_localizedServiceName, 0);
  objc_storeStrong((id *)&self->_accountTypeIdentifier, 0);
  objc_storeStrong((id *)&self->_serviceTypeIdentifier, 0);
  objc_storeStrong((id *)&self->_serviceBundle, 0);
  objc_storeStrong((id *)&self->_activityImage, 0);
}

@end
