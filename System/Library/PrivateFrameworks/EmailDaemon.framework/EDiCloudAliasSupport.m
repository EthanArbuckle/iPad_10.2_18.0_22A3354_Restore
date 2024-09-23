@implementation EDiCloudAliasSupport

+ (OS_os_log)log
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __27__EDiCloudAliasSupport_log__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (log_onceToken_33 != -1)
    dispatch_once(&log_onceToken_33, block);
  return (OS_os_log *)(id)log_log_33;
}

void __27__EDiCloudAliasSupport_log__block_invoke(uint64_t a1)
{
  os_log_t v1;
  void *v2;
  id v3;

  NSStringFromClass(*(Class *)(a1 + 32));
  v3 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v1 = os_log_create("com.apple.email", (const char *)objc_msgSend(v3, "UTF8String"));
  v2 = (void *)log_log_33;
  log_log_33 = (uint64_t)v1;

}

- (EDiCloudAliasSupport)initWithAppleAccount:(id)a3
{
  id v4;
  EDiCloudAliasSupport *v5;
  void *v6;
  ACAccount *v7;
  ACAccount *appleAccount;
  objc_super v10;

  v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)EDiCloudAliasSupport;
  v5 = -[EDiCloudAliasSupport init](&v10, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "parentAccount");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (v6)
    {
      objc_msgSend(v4, "parentAccount");
      v7 = (ACAccount *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v7 = (ACAccount *)v4;
    }
    appleAccount = v5->_appleAccount;
    v5->_appleAccount = v7;

  }
  return v5;
}

- (NSURL)aliasLookupURL
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  -[EDiCloudAliasSupport appleAccount](self, "appleAccount");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "propertiesForDataclass:", *MEMORY[0x1E0C8F3D0]);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectForKey:", CFSTR("sendFromAddressJSONURL"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    objc_msgSend(MEMORY[0x1E0C99E98], "URLWithString:", v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v5 = 0;
  }

  return (NSURL *)v5;
}

- (NSString)aliasUserAgent
{
  id v2;
  void *v3;
  void *v4;
  void *v5;

  v2 = objc_alloc(MEMORY[0x1E0CB3940]);
  EFProductName();
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  EFSystemBuildVersion();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(v2, "initWithFormat:", CFSTR("%@ (%@)"), v3, v4);

  return (NSString *)v5;
}

- (NSString)aliasAuthorizationHeader
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  -[EDiCloudAliasSupport appleAccount](self, "appleAccount");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (void *)MEMORY[0x1E0CB3940];
  objc_msgSend(v2, "aa_personID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "aa_authToken");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@:%@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "dataUsingEncoding:", 1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "base64EncodedStringWithOptions:", 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("X-MobileMe-AuthToken %@"), v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v9;
}

- (id)anisetteDataWithError:(id *)a3
{
  _QWORD *v4;
  uint64_t v5;
  uint64_t v6;
  unint64_t v7;
  uint64_t v8;
  NSObject *v9;
  uint64_t v10;
  NSObject *v11;
  uint64_t v12;
  id v13;
  _QWORD v15[2];
  void (*v16)(uint64_t);
  void *v17;
  uint64_t *v18;
  uint64_t *v19;
  uint64_t v20;
  _QWORD v21[4];
  id v22;
  uint64_t v23;
  uint64_t *v24;
  uint64_t v25;
  uint64_t (*v26)(uint64_t, uint64_t);
  void (*v27)(uint64_t);
  id v28;
  uint8_t buf[4];
  uint64_t v30;
  __int16 v31;
  double v32;
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
  if (anisetteDataWithError__onceToken != -1)
    dispatch_once(&anisetteDataWithError__onceToken, &__block_literal_global_19);
  v23 = 0;
  v24 = &v23;
  v25 = 0x3032000000;
  v26 = __Block_byref_object_copy__7;
  v27 = __Block_byref_object_dispose__7;
  v28 = 0;
  v20 = 0;
  v21[0] = &v20;
  v21[1] = 0x3032000000;
  v21[2] = __Block_byref_object_copy__7;
  v21[3] = __Block_byref_object_dispose__7;
  v22 = 0;
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v16 = __46__EDiCloudAliasSupport_anisetteDataWithError___block_invoke_42;
  v17 = &unk_1E949C438;
  v18 = &v23;
  v19 = &v20;
  v4 = v15;
  v5 = mach_absolute_time();
  v16((uint64_t)v4);
  v6 = mach_absolute_time();
  if (EFGetElapsedTimeSinceAbsoluteTime_onceToken != -1)
    dispatch_once(&EFGetElapsedTimeSinceAbsoluteTime_onceToken, &__block_literal_global_149);
  v8 = EFGetElapsedTimeSinceAbsoluteTime_sTimebaseInfo;
  v7 = *(unsigned int *)algn_1ED11C724;

  if (*(_QWORD *)(v21[0] + 40))
  {
    +[EDiCloudAliasSupport log](EDiCloudAliasSupport, "log");
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      -[EDiCloudAliasSupport anisetteDataWithError:].cold.1((uint64_t)v21, v9, v10, (double)((v6 - v5) * v8 / v7) / 1000000000.0);

    if (a3)
      *a3 = objc_retainAutorelease(*(id *)(v21[0] + 40));
  }
  else
  {
    +[EDiCloudAliasSupport log](EDiCloudAliasSupport, "log");
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      v12 = v24[5];
      *(_DWORD *)buf = 138412546;
      v30 = v12;
      v31 = 2048;
      v32 = (double)((v6 - v5) * v8 / v7) / 1000000000.0;
      _os_log_impl(&dword_1D2F2C000, v11, OS_LOG_TYPE_DEFAULT, "anisetteDataWithError success: %@ (%.3f sec)", buf, 0x16u);
    }

  }
  v13 = (id)v24[5];
  _Block_object_dispose(&v20, 8);

  _Block_object_dispose(&v23, 8);
  return v13;
}

void __46__EDiCloudAliasSupport_anisetteDataWithError___block_invoke()
{
  id v0;
  void *v1;

  v0 = objc_alloc_init(getAKAnisetteProvisioningControllerClass());
  v1 = (void *)anisetteDataWithError__anisetteProvisioningController;
  anisetteDataWithError__anisetteProvisioningController = (uint64_t)v0;

}

void __46__EDiCloudAliasSupport_anisetteDataWithError___block_invoke_42(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  id obj;

  v2 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  obj = *(id *)(v2 + 40);
  objc_msgSend((id)anisetteDataWithError__anisetteProvisioningController, "anisetteDataWithError:", &obj);
  v3 = objc_claimAutoreleasedReturnValue();
  objc_storeStrong((id *)(v2 + 40), obj);
  v4 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v5 = *(void **)(v4 + 40);
  *(_QWORD *)(v4 + 40) = v3;

}

- (void)pushUpdateForAliasDataWithEmailAddresses:(id)a3 defaultEmailAddress:(id)a4
{
  NSObject *v6;
  void *v7;
  NSObject *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  NSObject *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  id v20;
  uint64_t v21;
  NSObject *v22;
  id v23;
  void *v24;
  void *v25;
  uint64_t v26;
  void *v27;
  id v28;
  id v29;
  id v30;
  id v31;
  id v32;
  uint8_t buf[4];
  id v34;
  __int16 v35;
  uint64_t v36;
  __int16 v37;
  void *v38;
  __int16 v39;
  uint64_t v40;
  char v41[32];
  uint64_t v42;

  v42 = *MEMORY[0x1E0C80C00];
  v31 = a3;
  v30 = a4;
  +[EDiCloudAliasSupport log](EDiCloudAliasSupport, "log");
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 67109120;
    LODWORD(v34) = objc_msgSend(v31, "count");
    _os_log_impl(&dword_1D2F2C000, v6, OS_LOG_TYPE_DEFAULT, "Pushing update for alias data. Count = %d", buf, 8u);
  }

  -[EDiCloudAliasSupport aliasLookupURL](self, "aliasLookupURL");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    objc_msgSend(MEMORY[0x1E0CB37A8], "requestWithURL:", v7);
    v8 = objc_claimAutoreleasedReturnValue();
    -[NSObject setHTTPMethod:](v8, "setHTTPMethod:", CFSTR("POST"));
    -[EDiCloudAliasSupport aliasAuthorizationHeader](self, "aliasAuthorizationHeader");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSObject setValue:forHTTPHeaderField:](v8, "setValue:forHTTPHeaderField:", v9, CFSTR("Authorization"));

    -[EDiCloudAliasSupport aliasUserAgent](self, "aliasUserAgent");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSObject setValue:forHTTPHeaderField:](v8, "setValue:forHTTPHeaderField:", v10, *MEMORY[0x1E0D1E608]);

    -[NSObject setValue:forHTTPHeaderField:](v8, "setValue:forHTTPHeaderField:", CFSTR("application/json-rpc; charset=UTF-8"),
      *MEMORY[0x1E0D1E558]);
    -[NSObject ak_addDeviceUDIDHeader](v8, "ak_addDeviceUDIDHeader");
    -[NSObject ak_addClientInfoHeader](v8, "ak_addClientInfoHeader");
    v32 = 0;
    -[EDiCloudAliasSupport anisetteDataWithError:](self, "anisetteDataWithError:", &v32);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v29 = v32;
    if (v11)
    {
      objc_msgSend(v11, "machineID");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSObject setValue:forHTTPHeaderField:](v8, "setValue:forHTTPHeaderField:", v12, CFSTR("X-Apple-I-MD-M"));

      objc_msgSend(v11, "oneTimePassword");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSObject setValue:forHTTPHeaderField:](v8, "setValue:forHTTPHeaderField:", v13, CFSTR("X-Apple-I-MD"));

      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%llu"), objc_msgSend(v11, "routingInfo"));
      v14 = objc_claimAutoreleasedReturnValue();
      -[NSObject setValue:forHTTPHeaderField:](v8, "setValue:forHTTPHeaderField:", v14, CFSTR("X-Apple-I-MD-RINFO"));
    }
    else
    {
      +[EDiCloudAliasSupport log](EDiCloudAliasSupport, "log");
      v14 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      {
        -[EDiCloudAliasSupport appleAccount](self, "appleAccount");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v29, "ef_publicDescription");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        -[EDiCloudAliasSupport pushUpdateForAliasDataWithEmailAddresses:defaultEmailAddress:].cold.2(v15, v16, (uint64_t)v41, v14);
      }
    }

    -[EDiCloudAliasSupport _prepareAliasDataForEmailAddresses:defaultEmailAddress:](self, "_prepareAliasDataForEmailAddresses:defaultEmailAddress:", v31, v30);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB36D8], "dataWithJSONObject:options:error:", v17, 0, 0);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSObject setHTTPBody:](v8, "setHTTPBody:", v18);
    v19 = (void *)EFCopyResponseDataForURLRequest();
    v20 = 0;
    v28 = 0;
    v21 = objc_msgSend(v20, "statusCode");
    if (v21 == 200 && v19)
    {
      +[EDiCloudAliasSupport log](EDiCloudAliasSupport, "log");
      v22 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
      {
        v23 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithData:encoding:", v19, 4);
        v24 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithData:encoding:", v18, 4);
        *(_DWORD *)buf = 138412546;
        v34 = v23;
        v35 = 2112;
        v36 = (uint64_t)v24;
        _os_log_impl(&dword_1D2F2C000, v22, OS_LOG_TYPE_DEFAULT, "response: %@.\nJSON: %@", buf, 0x16u);

      }
    }
    else
    {
      +[EDiCloudAliasSupport log](EDiCloudAliasSupport, "log");
      v22 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
      {
        objc_msgSend(v28, "ef_publicDescription");
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        v26 = objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithData:encoding:", v18, 4);
        *(_DWORD *)buf = 138413058;
        v34 = v7;
        v35 = 2048;
        v36 = v21;
        v37 = 2114;
        v38 = v25;
        v39 = 2112;
        v27 = (void *)v26;
        v40 = v26;
        _os_log_error_impl(&dword_1D2F2C000, v22, OS_LOG_TYPE_ERROR, "Unable to push new alias data to server %@. Received response code %lu, with error %{public}@.\nJSON:%@", buf, 0x2Au);

      }
    }

  }
  else
  {
    +[EDiCloudAliasSupport log](EDiCloudAliasSupport, "log");
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      -[EDiCloudAliasSupport pushUpdateForAliasDataWithEmailAddresses:defaultEmailAddress:].cold.1(v8);
  }

}

- (id)_prepareAliasDataForEmailAddresses:(id)a3 defaultEmailAddress:(id)a4
{
  void *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  void *v16;
  void *v17;
  void *v18;
  id v19;
  void *v20;
  void *v21;
  void *v22;
  id v23;
  void *v24;
  id v26;
  void *v27;
  id v28;
  id v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  _QWORD v34[2];
  _QWORD v35[2];
  _BYTE v36[128];
  uint64_t v37;

  v37 = *MEMORY[0x1E0C80C00];
  v29 = a3;
  v28 = a4;
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithObjectsAndKeys:", CFSTR("2.0"), CFSTR("jsonrpc"), CFSTR("update"), CFSTR("method"), 0);
  v26 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  if (v29)
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", objc_msgSend(v29, "count"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v32 = 0u;
    v33 = 0u;
    v30 = 0u;
    v31 = 0u;
    v6 = v29;
    v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v30, v36, 16);
    if (v7)
    {
      v8 = *(_QWORD *)v31;
      do
      {
        for (i = 0; i != v7; ++i)
        {
          if (*(_QWORD *)v31 != v8)
            objc_enumerationMutation(v6);
          v10 = *(void **)(*((_QWORD *)&v30 + 1) + 8 * i);
          v34[0] = CFSTR("address");
          v11 = v10;
          objc_msgSend(v11, "emailAddressValue");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v12, "simpleAddress");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          v14 = v13;
          if (v13)
          {
            v15 = v13;
          }
          else
          {
            objc_msgSend(v11, "stringValue");
            v15 = (id)objc_claimAutoreleasedReturnValue();
          }
          v16 = v15;

          v34[1] = CFSTR("canSendFrom");
          v35[0] = v16;
          objc_msgSend(v6, "objectForKeyedSubscript:", v11);
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          v35[1] = v17;
          objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v35, v34, 2);
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v5, "addObject:", v18);

        }
        v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v30, v36, 16);
      }
      while (v7);
    }

    objc_msgSend(v27, "setValue:forKey:", v5, CFSTR("email"));
  }
  if (v28)
  {
    v19 = v28;
    objc_msgSend(v19, "emailAddressValue");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "simpleAddress");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = v21;
    if (v21)
    {
      v23 = v21;
    }
    else
    {
      objc_msgSend(v19, "stringValue");
      v23 = (id)objc_claimAutoreleasedReturnValue();
    }
    v24 = v23;

    objc_msgSend(v27, "setValue:forKey:", v24, CFSTR("defaultAddress"));
  }
  objc_msgSend(v26, "setValue:forKey:", v27, CFSTR("params"));

  return v26;
}

- (ACAccount)appleAccount
{
  return self->_appleAccount;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_appleAccount, 0);
}

- (void)anisetteDataWithError:(uint64_t)a3 .cold.1(uint64_t a1, NSObject *a2, uint64_t a3, double a4)
{
  uint64_t v4;
  int v5;
  uint64_t v6;
  __int16 v7;
  double v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  v4 = *(_QWORD *)(*(_QWORD *)a1 + 40);
  v5 = 138412546;
  v6 = v4;
  v7 = 2048;
  v8 = a4;
  OUTLINED_FUNCTION_1_2(&dword_1D2F2C000, a2, a3, "anisetteDataWithError failure: %@ (%.3f sec)", (uint8_t *)&v5);
}

- (void)pushUpdateForAliasDataWithEmailAddresses:(os_log_t)log defaultEmailAddress:.cold.1(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_1D2F2C000, log, OS_LOG_TYPE_ERROR, "No Alias Lookup URL", v1, 2u);
}

- (void)pushUpdateForAliasDataWithEmailAddresses:(uint64_t)a3 defaultEmailAddress:(NSObject *)a4 .cold.2(void *a1, void *a2, uint64_t a3, NSObject *a4)
{
  *(_DWORD *)a3 = 138543618;
  *(_QWORD *)(a3 + 4) = a1;
  *(_WORD *)(a3 + 12) = 2114;
  *(_QWORD *)(a3 + 14) = a2;
  OUTLINED_FUNCTION_1_2(&dword_1D2F2C000, a4, a3, "AnisetteData not found for account: %{public}@ error: %{public}@", (uint8_t *)a3);

}

@end
