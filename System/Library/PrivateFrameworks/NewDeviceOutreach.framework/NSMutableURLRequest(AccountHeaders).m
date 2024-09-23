@implementation NSMutableURLRequest(AccountHeaders)

- (void)ndo_addBasicHeadersWithBundleID:()AccountHeaders
{
  id v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  v4 = a3;
  v10 = v4;
  if (v4)
  {
    v5 = v4;
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDD1488], "mainBundle");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "bundleIdentifier");
    v5 = (id)objc_claimAutoreleasedReturnValue();

  }
  objc_msgSend(a1, "_userAgentWithBundleID:", v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "setValue:forHTTPHeaderField:", v7, CFSTR("User-Agent"));

  objc_msgSend(a1, "setValue:forHTTPHeaderField:", v5, CFSTR("x-apple-bundle-id"));
  objc_msgSend(a1, "_osVersion");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "setValue:forHTTPHeaderField:", v8, CFSTR("x-apple-os-version"));

  objc_msgSend(a1, "_deviceProductType");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "setValue:forHTTPHeaderField:", v9, CFSTR("x-apple-primary-device-model"));

}

- (uint64_t)ndo_signWithAccountHeaders:()AccountHeaders avoidUI:
{
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  NSObject *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t i;
  uint64_t v16;
  void *v17;
  void *v18;
  uint64_t v19;
  const char *v20;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  uint8_t buf[8];
  _BYTE v27[128];
  uint64_t v28;

  v28 = *MEMORY[0x24BDAC8D0];
  v7 = (void *)objc_opt_new();
  objc_msgSend(v7, "aida_accountForPrimaryiCloudAccount");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v8)
  {
    _NDOLogSystem();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      v20 = "No primary iCloud account, can't sign this request";
LABEL_15:
      _os_log_impl(&dword_22D064000, v11, OS_LOG_TYPE_DEFAULT, v20, buf, 2u);
    }
LABEL_16:
    v19 = 0;
    goto LABEL_17;
  }
  if ((objc_msgSend(a1, "_addGSHeadersForAccount:withStore:forceReprovisioning:avoidUI:", v8, v7, a3, a4) & 1) == 0)
  {
    _NDOLogSystem();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      v20 = "Failed to add GS headers, can't sign this request";
      goto LABEL_15;
    }
    goto LABEL_16;
  }
  objc_msgSend(a1, "ak_addClientInfoHeader");
  objc_msgSend(a1, "ak_addDeviceUDIDHeader");
  v9 = (void *)objc_opt_new();
  objc_msgSend(v9, "appleIDHeadersForRequest:", a1);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v24 = 0u;
  v25 = 0u;
  v22 = 0u;
  v23 = 0u;
  v11 = v10;
  v12 = -[NSObject countByEnumeratingWithState:objects:count:](v11, "countByEnumeratingWithState:objects:count:", &v22, v27, 16);
  if (v12)
  {
    v13 = v12;
    v14 = *(_QWORD *)v23;
    do
    {
      for (i = 0; i != v13; ++i)
      {
        if (*(_QWORD *)v23 != v14)
          objc_enumerationMutation(v11);
        v16 = *(_QWORD *)(*((_QWORD *)&v22 + 1) + 8 * i);
        -[NSObject objectForKeyedSubscript:](v11, "objectForKeyedSubscript:", v16, (_QWORD)v22);
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(a1, "setValue:forHTTPHeaderField:", v17, v16);

      }
      v13 = -[NSObject countByEnumeratingWithState:objects:count:](v11, "countByEnumeratingWithState:objects:count:", &v22, v27, 16);
    }
    while (v13);
  }

  objc_msgSend(v8, "aa_altDSID");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "setValue:forHTTPHeaderField:", v18, CFSTR("altDSID"));

  objc_msgSend(a1, "addStoreLocaleHeaderIfNeeded");
  v19 = 1;
LABEL_17:

  return v19;
}

- (void)ndo_setDeviceListRequestBodyWithSerialNumber:()AccountHeaders localDevices:primaryAccount:
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  double v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  id v21;
  id v22;
  _QWORD v23[4];
  id v24;
  _QWORD v25[2];
  _QWORD v26[2];
  _QWORD v27[5];
  _QWORD v28[7];

  v28[5] = *MEMORY[0x24BDAC8D0];
  v6 = a4;
  v22 = a3;
  objc_msgSend(a1, "setHTTPMethod:", CFSTR("POST"));
  objc_msgSend(a1, "setValue:forHTTPHeaderField:", CFSTR("application/json"), CFSTR("Content-Type"));
  objc_msgSend(MEMORY[0x24BDBCEB8], "arrayWithCapacity:", 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v23[0] = MEMORY[0x24BDAC760];
  v23[1] = 3221225472;
  v23[2] = __112__NSMutableURLRequest_AccountHeaders__ndo_setDeviceListRequestBodyWithSerialNumber_localDevices_primaryAccount___block_invoke;
  v23[3] = &unk_24F81D510;
  v24 = v7;
  v21 = v7;
  objc_msgSend(v6, "enumerateObjectsUsingBlock:", v23);

  v26[1] = v21;
  v27[0] = CFSTR("devicesInfo");
  v25[0] = CFSTR("primarySN");
  v25[1] = CFSTR("localDevices");
  v26[0] = v22;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v26, v25, 2);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v28[0] = v8;
  v27[1] = CFSTR("storefrontLocale");
  objc_msgSend(a1, "storeLocale");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v28[1] = v9;
  v27[2] = CFSTR("locale");
  objc_msgSend(MEMORY[0x24BDBCEA0], "preferredLocale");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "localeIdentifier");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v28[2] = v11;
  v27[3] = CFSTR("requestTimestamp");
  v12 = (void *)MEMORY[0x24BDD16E0];
  objc_msgSend(MEMORY[0x24BDBCE60], "date");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "timeIntervalSince1970");
  objc_msgSend(v12, "numberWithUnsignedLongLong:", (unint64_t)(v14 * 1000.0));
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v28[3] = v15;
  v27[4] = CFSTR("requestTimezone");
  v16 = (void *)MEMORY[0x24BDD16E0];
  objc_msgSend(MEMORY[0x24BDBCF38], "localTimeZone");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "numberWithInt:", ((int)objc_msgSend(v17, "secondsFromGMT") / 3600));
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v28[4] = v18;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v28, v27, 5);
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BDD1608], "dataWithJSONObject:options:error:", v19, 0, 0);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "setHTTPBody:", v20);

}

- (void)ndo_setCoverageRequestBodyWithSerialNumber:()AccountHeaders primarySerialNumber:displayedEvents:
{
  __CFString *v8;
  __CFString *v9;
  __CFString *v10;
  __CFString *v11;
  __CFString *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  double v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  id v26;
  __CFString *v27;
  __CFString *v28;
  _QWORD v29[5];
  _QWORD v30[6];

  v30[5] = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v9 = a4;
  v26 = a5;
  objc_msgSend(a1, "setHTTPMethod:", CFSTR("POST"));
  objc_msgSend(a1, "setValue:forHTTPHeaderField:", CFSTR("application/json"), CFSTR("Content-Type"));
  if (v8)
    v10 = v8;
  else
    v10 = CFSTR("empty");
  v11 = v10;
  if (v9)
    v12 = v9;
  else
    v12 = CFSTR("empty");
  v29[0] = CFSTR("serialNumber");
  v29[1] = CFSTR("x-apple-primary-sn");
  v27 = v12;
  v28 = v11;
  v30[0] = v11;
  v30[1] = v27;
  v29[2] = CFSTR("locale");
  objc_msgSend(MEMORY[0x24BDBCEA0], "preferredLocale");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "localeIdentifier");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v30[2] = v14;
  v29[3] = CFSTR("requestTimestamp");
  v15 = (void *)MEMORY[0x24BDD16E0];
  objc_msgSend(MEMORY[0x24BDBCE60], "date");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "timeIntervalSince1970");
  objc_msgSend(v15, "numberWithUnsignedLongLong:", (unint64_t)(v17 * 1000.0));
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v30[3] = v18;
  v29[4] = CFSTR("requestTimezone");
  v19 = (void *)MEMORY[0x24BDD16E0];
  objc_msgSend(MEMORY[0x24BDBCF38], "localTimeZone");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "numberWithInt:", ((int)objc_msgSend(v20, "secondsFromGMT") / 3600));
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v30[4] = v21;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v30, v29, 5);
  v22 = (void *)objc_claimAutoreleasedReturnValue();

  v23 = (void *)objc_msgSend(v22, "mutableCopy");
  v24 = v23;
  if (v26)
    objc_msgSend(v23, "setObject:forKey:", v26, CFSTR("displayedEvents"));
  objc_msgSend(MEMORY[0x24BDD1608], "dataWithJSONObject:options:error:", v24, 0, 0);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "setHTTPBody:", v25);

}

- (void)ndo_addOASHeadersWithOfferID:()AccountHeaders serialNumber:primarySerialNumber:
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  id v12;

  v8 = a5;
  v9 = a3;
  objc_msgSend(a1, "setValue:forHTTPHeaderField:", a4, CFSTR("X-Apple-SN"));
  objc_msgSend(a1, "setValue:forHTTPHeaderField:", v8, CFSTR("x-apple-primary-sn"));

  objc_msgSend(MEMORY[0x24BDD1880], "UUID");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "UUIDString");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "setValue:forHTTPHeaderField:", v11, CFSTR("X-Apple-Txn-ID"));

  v12 = (id)CFPreferencesCopyAppValue(CFSTR("UIPreferredContentSizeCategoryName"), CFSTR("com.apple.UIKit"));
  objc_msgSend(a1, "setValue:forHTTPHeaderField:", v12, CFSTR("X-Apple-Content-Size"));
  objc_msgSend(a1, "setValue:forHTTPHeaderField:", CFSTR("No"), CFSTR("X-Apple-DM"));
  objc_msgSend(a1, "setValue:forHTTPHeaderField:", v9, CFSTR("Offer-ID"));

  objc_msgSend(a1, "addStoreLocaleHeaderIfNeeded");
}

- (id)storeLocale
{
  void *v2;
  void *v3;

  objc_msgSend(MEMORY[0x24BDB4398], "ams_sharedAccountStore");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "storeLocaleWithAccountStore:", v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (__CFString)storeLocaleWithAccountStore:()AccountHeaders
{
  id v3;
  void *v4;
  void *v5;
  __CFString *v6;
  void *v7;
  NSObject *v8;
  NSObject *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  NSObject *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  int v26;
  const char *v27;
  uint64_t v28;

  v28 = *MEMORY[0x24BDAC8D0];
  v3 = a3;
  objc_msgSend(MEMORY[0x24BDBCF50], "standardUserDefaults");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKey:", CFSTR("storefrontLocale"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (!+[NDOTypeChecking isNotEmptyString:](NDOTypeChecking, "isNotEmptyString:", v5))
  {
    objc_msgSend(v3, "ams_activeiTunesAccount");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (v7)
      goto LABEL_7;
    _NDOLogSystem();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      v26 = 136446210;
      v27 = "-[NSMutableURLRequest(AccountHeaders) storeLocaleWithAccountStore:]";
      _os_log_impl(&dword_22D064000, v8, OS_LOG_TYPE_DEFAULT, "%{public}s No active itunes account. Falling back to local account", (uint8_t *)&v26, 0xCu);
    }

    objc_msgSend(v3, "ams_localiTunesAccount");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (v7)
    {
LABEL_7:
      objc_msgSend(v7, "ams_storefront");
      v6 = (__CFString *)objc_claimAutoreleasedReturnValue();
      if (+[NDOTypeChecking isNotEmptyString:](NDOTypeChecking, "isNotEmptyString:", v6))
      {
LABEL_14:

        goto LABEL_15;
      }
      _NDOLogSystem();
      v9 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
        -[NSMutableURLRequest(AccountHeaders) storeLocaleWithAccountStore:].cold.2(v9, v10, v11, v12, v13, v14, v15, v16);

    }
    _NDOLogSystem();
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
      -[NSMutableURLRequest(AccountHeaders) storeLocaleWithAccountStore:].cold.1(v17, v18, v19, v20, v21, v22, v23, v24);

    v6 = &stru_24F81DDD8;
    goto LABEL_14;
  }
  v6 = v5;
LABEL_15:

  return v6;
}

- (void)addStoreLocaleHeaderIfNeeded
{
  NSObject *v2;
  NSObject *v3;
  NSObject *v4;
  int v5;
  NSObject *v6;
  uint64_t v7;

  v7 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(a1, "valueForHTTPHeaderField:", CFSTR("storefrontLocale"));
  v2 = objc_claimAutoreleasedReturnValue();
  if (v2)
  {
    _NDOLogSystem();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      v5 = 138412290;
      v6 = v2;
      _os_log_impl(&dword_22D064000, v3, OS_LOG_TYPE_DEFAULT, "storeLocale already set to %@", (uint8_t *)&v5, 0xCu);
    }
  }
  else
  {
    objc_msgSend(a1, "storeLocale");
    v3 = objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1, "setValue:forHTTPHeaderField:", v3, CFSTR("storefrontLocale"));
    _NDOLogSystem();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      v5 = 138412290;
      v6 = v3;
      _os_log_impl(&dword_22D064000, v4, OS_LOG_TYPE_DEFAULT, "storeLocale %@", (uint8_t *)&v5, 0xCu);
    }

  }
}

- (id)headerDescription
{
  void *v1;
  void *v2;
  void *v3;

  v1 = (void *)MEMORY[0x24BDD17C8];
  objc_msgSend(a1, "allHTTPHeaderFields");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "stringWithFormat:", CFSTR("%@"), v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)bodyDescription
{
  id v2;
  void *v3;
  void *v4;

  v2 = objc_alloc(MEMORY[0x24BDD17C8]);
  objc_msgSend(a1, "HTTPBody");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_msgSend(v2, "initWithData:encoding:", v3, 4);

  return v4;
}

- (uint64_t)_addGSHeadersForAccount:()AccountHeaders withStore:forceReprovisioning:avoidUI:
{
  id v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  NSObject *v15;
  BOOL v16;
  NSObject *v17;
  dispatch_semaphore_t v18;
  void *v19;
  void *v20;
  NSObject *v21;
  uint64_t v22;
  NSObject *v24;
  uint64_t v25;
  uint64_t v26;
  void (*v27)(uint64_t, uint64_t, void *);
  void *v28;
  id v29;
  id v30;
  NSObject *v31;
  uint8_t *v32;
  uint8_t buf[16];
  uint8_t v34[8];
  uint8_t *v35;
  uint64_t v36;
  uint64_t (*v37)(uint64_t, uint64_t);
  void (*v38)(uint64_t);
  id v39;
  _QWORD v40[2];
  _QWORD v41[3];

  v41[2] = *MEMORY[0x24BDAC8D0];
  v10 = a3;
  v11 = a4;
  objc_msgSend(v11, "aida_accountForiCloudAccount:", v10);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = v12;
  if (!v12)
  {
    _NDOLogSystem();
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v34 = 0;
      _os_log_impl(&dword_22D064000, v15, OS_LOG_TYPE_DEFAULT, "GrandSlam signing failed because no GS account was provided.", v34, 2u);
    }
    goto LABEL_16;
  }
  objc_msgSend(v12, "aida_alternateDSID");
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v14)
  {
    _NDOLogSystem();
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
      -[NSMutableURLRequest(AccountHeaders) _addGSHeadersForAccount:withStore:forceReprovisioning:avoidUI:].cold.1(v15);
LABEL_16:
    v22 = 0;
    goto LABEL_17;
  }
  objc_msgSend(v11, "credentialForAccount:serviceID:", v13, CFSTR("com.apple.gs.supportapp.auth"));
  v15 = objc_claimAutoreleasedReturnValue();
  *(_QWORD *)v34 = 0;
  v35 = v34;
  v36 = 0x3032000000;
  v37 = __Block_byref_object_copy__1;
  v38 = __Block_byref_object_dispose__1;
  -[NSObject token](v15, "token");
  v39 = (id)objc_claimAutoreleasedReturnValue();
  if (*((_QWORD *)v35 + 5))
    v16 = a5 == 0;
  else
    v16 = 0;
  if (v16)
    goto LABEL_10;
  _NDOLogSystem();
  v17 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_22D064000, v17, OS_LOG_TYPE_DEFAULT, "Reprovision GS tokens", buf, 2u);
  }

  v18 = dispatch_semaphore_create(0);
  v40[0] = *MEMORY[0x24BDB4528];
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", a6);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v40[1] = *MEMORY[0x24BDB4520];
  v41[0] = v19;
  v41[1] = &unk_24F824728;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v41, v40, 2);
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  v25 = MEMORY[0x24BDAC760];
  v26 = 3221225472;
  v27 = __101__NSMutableURLRequest_AccountHeaders___addGSHeadersForAccount_withStore_forceReprovisioning_avoidUI___block_invoke;
  v28 = &unk_24F81DAD0;
  v29 = v11;
  v30 = v13;
  v32 = v34;
  v21 = v18;
  v31 = v21;
  objc_msgSend(v29, "renewCredentialsForAccount:options:completion:", v30, v20, &v25);
  dispatch_semaphore_wait(v21, 0xFFFFFFFFFFFFFFFFLL);

  if (*((_QWORD *)v35 + 5))
  {
LABEL_10:
    objc_msgSend(a1, "setValue:forHTTPHeaderField:", v25, v26, v27, v28);
    v22 = 1;
  }
  else
  {
    _NDOLogSystem();
    v24 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_22D064000, v24, OS_LOG_TYPE_DEFAULT, "Error: still no GS token even after calling renewCredentialsForAccount.", buf, 2u);
    }

    v22 = 0;
  }
  _Block_object_dispose(v34, 8);

LABEL_17:
  return v22;
}

- (id)_osVersion
{
  return (id)MGCopyAnswer();
}

- (id)_deviceProductType
{
  return (id)MGCopyAnswer();
}

- (id)_userAgent
{
  void *v2;
  void *v3;
  void *v4;

  objc_msgSend(MEMORY[0x24BDD1488], "mainBundle");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "bundleIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(a1, "_userAgentWithBundleID:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)_userAgentWithBundleID:()AccountHeaders
{
  id v4;
  void *v5;
  void *v6;
  void *v7;

  v4 = a3;
  objc_msgSend(a1, "_osVersion");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "_deviceProductType");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("<%@/%@/%@>"), v4, v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (void)addBAAAuthenticationHeadersWithBody:()AccountHeaders
{
  id v4;
  NSObject *v5;
  void *v6;
  uint64_t v7;
  NSObject *v8;
  char *v9;
  int v10;
  id v11;
  NSObject *v12;
  NSObject *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  id v20;
  uint8_t buf[4];
  const char *v22;
  uint64_t v23;

  v23 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  _NDOLogSystem();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136446210;
    v22 = "-[NSMutableURLRequest(AccountHeaders) addBAAAuthenticationHeadersWithBody:]";
    _os_log_impl(&dword_22D064000, v5, OS_LOG_TYPE_DEFAULT, "%{public}s: Initiating device authentication", buf, 0xCu);
  }

  v6 = (void *)objc_opt_new();
  v7 = objc_msgSend(v6, "generateBAACertficate:", &__block_literal_global_0);
  _NDOLogSystem();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", v7);
    v9 = (char *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412290;
    v22 = v9;
    _os_log_impl(&dword_22D064000, v8, OS_LOG_TYPE_DEFAULT, "BAA certificate generation success: %@", buf, 0xCu);

  }
  if ((_DWORD)v7)
  {
    v20 = 0;
    v10 = objc_msgSend(v6, "addBAAAuthenticationHeadersToRequest:withBody:error:", a1, v4, &v20);
    v11 = v20;
    _NDOLogSystem();
    v12 = objc_claimAutoreleasedReturnValue();
    v13 = v12;
    if (v10)
    {
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_22D064000, v13, OS_LOG_TYPE_DEFAULT, "Device authentication successful", buf, 2u);
      }
    }
    else if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      -[NSMutableURLRequest(AccountHeaders) addBAAAuthenticationHeadersWithBody:].cold.1((uint64_t)v11, v13, v14, v15, v16, v17, v18, v19);
    }

  }
}

- (void)storeLocaleWithAccountStore:()AccountHeaders .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_22D064000, a1, a3, "%{public}s Failed to determine storefront locale", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_2();
}

- (void)storeLocaleWithAccountStore:()AccountHeaders .cold.2(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_22D064000, a1, a3, "%{public}s Invalid storefront locale", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_2();
}

- (void)_addGSHeadersForAccount:()AccountHeaders withStore:forceReprovisioning:avoidUI:.cold.1(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_22D064000, log, OS_LOG_TYPE_ERROR, "GrandSlam signing failed because no there's no altDSID on the account.", v1, 2u);
}

- (void)addBAAAuthenticationHeadersWithBody:()AccountHeaders .cold.1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_22D064000, a2, a3, "Device authentication failed with error: %@", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_2();
}

@end
