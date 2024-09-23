@implementation NDOAppleSupportManager

- (id)_imageAppropriateForDevice:(id)a3
{
  id v3;
  void *v4;
  id v5;
  void *v6;
  double v7;
  double v8;
  void *v9;
  id v10;
  void *v11;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  void *v16;
  uint64_t *v17;
  uint64_t v18;
  uint64_t *v19;
  uint64_t v20;
  uint64_t v21;

  v3 = a3;
  v18 = 0;
  v19 = &v18;
  v20 = 0x2050000000;
  v4 = (void *)getUIScreenClass_softClass;
  v21 = getUIScreenClass_softClass;
  if (!getUIScreenClass_softClass)
  {
    v13 = MEMORY[0x24BDAC760];
    v14 = 3221225472;
    v15 = __getUIScreenClass_block_invoke;
    v16 = &unk_24F81DA90;
    v17 = &v18;
    __getUIScreenClass_block_invoke((uint64_t)&v13);
    v4 = (void *)v19[3];
  }
  v5 = objc_retainAutorelease(v4);
  _Block_object_dispose(&v18, 8);
  objc_msgSend(v5, "mainScreen");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "scale");
  v8 = v7;

  v18 = 0;
  v19 = &v18;
  v20 = 0x2050000000;
  v9 = (void *)getUIImageClass_softClass;
  v21 = getUIImageClass_softClass;
  if (!getUIImageClass_softClass)
  {
    v13 = MEMORY[0x24BDAC760];
    v14 = 3221225472;
    v15 = __getUIImageClass_block_invoke;
    v16 = &unk_24F81DA90;
    v17 = &v18;
    __getUIImageClass_block_invoke((uint64_t)&v13);
    v9 = (void *)v19[3];
  }
  v10 = objc_retainAutorelease(v9);
  _Block_object_dispose(&v18, 8);
  objc_msgSend(v10, "_applicationIconImageForBundleIdentifier:format:scale:", v3, 2, v8);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

- (void)checkIsAvailableInStore:(id)a3 withReply:(id)a4
{
  id v5;
  void (**v6)(id, void *);
  NSObject *v7;
  void *v8;
  void *v9;
  int v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  _QWORD v18[4];
  id v19;
  void (**v20)(id, void *);
  id v21;
  _QWORD v22[4];
  _QWORD v23[4];
  uint8_t buf[4];
  id v25;
  uint64_t v26;

  v26 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  v6 = (void (**)(id, void *))a4;
  _NDOLogSystem();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v25 = v5;
    _os_log_impl(&dword_22D064000, v7, OS_LOG_TYPE_DEFAULT, "Checking for %@ in the App Store", buf, 0xCu);
  }

  objc_msgSend(MEMORY[0x24BDBCF50], "standardUserDefaults");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "objectForKey:", CFSTR("AppSupportAvailability"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "BOOLValue");

  if (v10)
  {
    v22[0] = CFSTR("AppTitleKey");
    v22[1] = CFSTR("AppVendorName");
    v23[0] = CFSTR("Apple Support");
    v23[1] = CFSTR("Apple");
    v22[2] = CFSTR("AppAvailablityText");
    v22[3] = CFSTR("AppAvailabilityType");
    v23[2] = CFSTR("OVERRIDE");
    v23[3] = &unk_24F824758;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v23, v22, 4);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v6[2](v6, v11);
  }
  else
  {
    v12 = (void *)MEMORY[0x24BE08050];
    objc_msgSend(MEMORY[0x24BE08238], "bagSubProfile");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BE08238], "bagSubProfileVersion");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "bagForProfile:profileVersion:", v13, v14);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    v15 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BE08238]), "initWithType:clientIdentifier:clientVersion:bag:", 0, CFSTR("com.apple.preferences.applesupport"), CFSTR("1"), v11);
    v21 = v5;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v21, 1);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "setBundleIdentifiers:", v16);

    objc_msgSend(v15, "perform");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18[0] = MEMORY[0x24BDAC760];
    v18[1] = 3221225472;
    v18[2] = __60__NDOAppleSupportManager_checkIsAvailableInStore_withReply___block_invoke;
    v18[3] = &unk_24F81DA18;
    v19 = v5;
    v20 = v6;
    objc_msgSend(v17, "addFinishBlock:", v18);

  }
}

void __60__NDOAppleSupportManager_checkIsAvailableInStore_withReply___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  __CFString *v14;
  __CFString *v15;
  __CFString *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  void *v20;
  __CFString *v21;
  uint64_t v22;
  void *v23;
  __CFString *v24;
  __CFString *v25;
  uint64_t v26;
  uint64_t v27;
  const __CFString *v28;
  const __CFString *v29;
  const __CFString *v30;
  void *v31;
  NSObject *v32;
  uint64_t v33;
  uint64_t v34;
  void *v35;
  void *v36;
  void *v37;
  const __CFString *v38;
  void *v39;
  _QWORD v40[6];
  _QWORD v41[6];
  uint8_t buf[4];
  uint64_t v43;
  __int16 v44;
  void *v45;
  uint64_t v46;

  v46 = *MEMORY[0x24BDAC8D0];
  v5 = a2;
  v6 = a3;
  v7 = v6;
  if (!v5 || v6)
  {
    _NDOLogSystem();
    v32 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v32, OS_LOG_TYPE_DEFAULT))
    {
      v33 = *(_QWORD *)(a1 + 32);
      *(_DWORD *)buf = 138412546;
      v43 = v33;
      v44 = 2112;
      v45 = v7;
      _os_log_impl(&dword_22D064000, v32, OS_LOG_TYPE_DEFAULT, "Lookup for %@ in the App Store failed with error %@", buf, 0x16u);
    }

    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  }
  else
  {
    objc_msgSend(v5, "responseDataItems");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "count");

    if (v9 == 1)
    {
      objc_msgSend(v5, "responseDataItems");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "firstObject");
      v11 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v11, "objectForKeyedSubscript:", CFSTR("attributes"));
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = v12;
      v14 = 0;
      v15 = 0;
      v16 = 0;
      if (v11 && v12)
      {
        objc_msgSend(v12, "objectForKeyedSubscript:", CFSTR("artistName"));
        v14 = (__CFString *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "objectForKeyedSubscript:", CFSTR("name"));
        v15 = (__CFString *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "objectForKeyedSubscript:", CFSTR("platformAttributes"));
        v36 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v36, "objectForKeyedSubscript:", CFSTR("ios"));
        v37 = v11;
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17, "objectForKeyedSubscript:", CFSTR("artwork"));
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v18, "objectForKeyedSubscript:", CFSTR("url"));
        v19 = objc_claimAutoreleasedReturnValue();
        v20 = (void *)v19;
        v21 = &stru_24F81DDD8;
        if (v19)
          v21 = (__CFString *)v19;
        v16 = v21;

        v11 = v37;
      }
      objc_msgSend(v13, "objectForKeyedSubscript:", CFSTR("url"));
      v22 = objc_claimAutoreleasedReturnValue();
      v23 = (void *)v22;
      v24 = &stru_24F81DDD8;
      if (v22)
        v24 = (__CFString *)v22;
      v25 = v24;

      if (-[__CFString length](v25, "length"))
      {
        -[__CFString stringByAppendingString:](v25, "stringByAppendingString:", CFSTR("?pt=2003&ct=coverage.settings&mt=8"));
        v26 = objc_claimAutoreleasedReturnValue();

        v25 = (__CFString *)v26;
      }
      v27 = *(_QWORD *)(a1 + 40);
      v40[0] = CFSTR("AppLinkURL");
      v40[1] = CFSTR("AppIconURL");
      if (v16)
        v28 = v16;
      else
        v28 = &stru_24F81DDD8;
      v41[0] = v25;
      v41[1] = v28;
      if (v15)
        v29 = v15;
      else
        v29 = &stru_24F81DDD8;
      v40[2] = CFSTR("AppTitleKey");
      v40[3] = CFSTR("AppVendorName");
      if (v14)
        v30 = v14;
      else
        v30 = &stru_24F81DDD8;
      v41[2] = v29;
      v41[3] = v30;
      v40[4] = CFSTR("AppAvailablityText");
      v40[5] = CFSTR("AppAvailabilityType");
      v41[4] = CFSTR("Free – On the App Store");
      v41[5] = &unk_24F824770;
      objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v41, v40, 6);
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      (*(void (**)(uint64_t, void *))(v27 + 16))(v27, v31);

    }
    else
    {
      v34 = *(_QWORD *)(a1 + 40);
      v38 = CFSTR("AppAvailabilityType");
      v39 = &unk_24F824788;
      objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v39, &v38, 1);
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      (*(void (**)(uint64_t, void *))(v34 + 16))(v34, v35);

    }
  }

}

- (id)checkAppIsPurchased:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  NSObject *v11;
  id v12;
  NSObject *v13;
  dispatch_time_t v14;
  id v15;
  _QWORD v17[4];
  id v18;
  NSObject *v19;
  _QWORD *v20;
  _QWORD *v21;
  _QWORD *v22;
  uint64_t *v23;
  uint64_t v24;
  uint64_t *v25;
  uint64_t v26;
  uint64_t (*v27)(uint64_t, uint64_t);
  void (*v28)(uint64_t);
  id v29;
  _QWORD v30[5];
  id v31;
  _QWORD v32[5];
  id v33;
  _QWORD v34[3];
  char v35;
  id v36;
  const __CFString *v37;
  _QWORD v38[2];

  v38[1] = *MEMORY[0x24BDAC8D0];
  v3 = a3;
  v34[0] = 0;
  v34[1] = v34;
  v34[2] = 0x2020000000;
  v35 = 0;
  v32[0] = 0;
  v32[1] = v32;
  v32[2] = 0x3032000000;
  v32[3] = __Block_byref_object_copy__0;
  v32[4] = __Block_byref_object_dispose__0;
  v33 = 0;
  v30[0] = 0;
  v30[1] = v30;
  v30[2] = 0x3032000000;
  v30[3] = __Block_byref_object_copy__0;
  v30[4] = __Block_byref_object_dispose__0;
  v31 = 0;
  v24 = 0;
  v25 = &v24;
  v26 = 0x3032000000;
  v27 = __Block_byref_object_copy__0;
  v28 = __Block_byref_object_dispose__0;
  v37 = CFSTR("AppAvailabilityType");
  v38[0] = &unk_24F824788;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v38, &v37, 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v29 = (id)objc_msgSend(v4, "mutableCopy");

  v5 = (void *)objc_opt_new();
  objc_msgSend(v5, "aida_accountForPrimaryiCloudAccount");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BE04578], "sharedInstance");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_alloc_init(MEMORY[0x24BE04588]);
  objc_msgSend(v6, "ams_DSID");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setAccountID:", objc_msgSend(v9, "integerValue"));

  v36 = v3;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v36, 1);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setBundleIDs:", v10);

  v11 = dispatch_group_create();
  dispatch_group_enter(v11);
  v17[0] = MEMORY[0x24BDAC760];
  v17[1] = 3221225472;
  v17[2] = __46__NDOAppleSupportManager_checkAppIsPurchased___block_invoke;
  v17[3] = &unk_24F81DA40;
  v12 = v3;
  v18 = v12;
  v20 = v30;
  v21 = v32;
  v22 = v34;
  v23 = &v24;
  v13 = v11;
  v19 = v13;
  objc_msgSend(v7, "executeQuery:withResultHandler:", v8, v17);
  v14 = dispatch_time(0, 5000000000);
  dispatch_group_wait(v13, v14);
  v15 = (id)v25[5];

  _Block_object_dispose(&v24, 8);
  _Block_object_dispose(v30, 8);

  _Block_object_dispose(v32, 8);
  _Block_object_dispose(v34, 8);

  return v15;
}

void __46__NDOAppleSupportManager_checkAppIsPurchased___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  void *v8;
  void *v9;
  int v10;
  uint64_t v11;
  void *v12;
  __CFString *v13;
  uint64_t v14;
  void *v15;
  __CFString *v16;
  void *v17;
  uint64_t v18;
  void *v19;
  __CFString *v20;
  __CFString *v21;
  uint64_t v22;
  void *v23;
  uint64_t v24;
  uint64_t v25;
  void *v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  _QWORD v31[5];
  _QWORD v32[5];
  _BYTE v33[128];
  uint64_t v34;

  v34 = *MEMORY[0x24BDAC8D0];
  v27 = 0u;
  v28 = 0u;
  v29 = 0u;
  v30 = 0u;
  v3 = a2;
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v27, v33, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v28;
    while (2)
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v28 != v6)
          objc_enumerationMutation(v3);
        v8 = *(void **)(*((_QWORD *)&v27 + 1) + 8 * i);
        objc_msgSend(v8, "bundleID", (_QWORD)v27);
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        v10 = objc_msgSend(v9, "isEqualToString:", *(_QWORD *)(a1 + 32));

        if (v10)
        {
          objc_msgSend(v8, "title");
          v11 = objc_claimAutoreleasedReturnValue();
          v12 = (void *)v11;
          if (v11)
            v13 = (__CFString *)v11;
          else
            v13 = CFSTR("== Apple Support ==");
          objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), v13);

          objc_msgSend(v8, "developerName");
          v14 = objc_claimAutoreleasedReturnValue();
          v15 = (void *)v14;
          if (v14)
            v16 = (__CFString *)v14;
          else
            v16 = CFSTR("== Apple ==");
          objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40), v16);

          *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24) = 1;
          objc_msgSend(v8, "productURL");
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v17, "absoluteString");
          v18 = objc_claimAutoreleasedReturnValue();
          v19 = (void *)v18;
          v20 = &stru_24F81DDD8;
          if (v18)
            v20 = (__CFString *)v18;
          v21 = v20;

          if (-[__CFString length](v21, "length"))
          {
            -[__CFString stringByAppendingString:](v21, "stringByAppendingString:", CFSTR("?pt=2003&ct=coverage.settings&mt=8"));
            v22 = objc_claimAutoreleasedReturnValue();

            v21 = (__CFString *)v22;
          }
          v23 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 40);
          v31[0] = CFSTR("AppLinkURL");
          v31[1] = CFSTR("AppTitleKey");
          v24 = *(_QWORD *)(a1 + 56);
          v25 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40);
          v32[0] = v21;
          v32[1] = v25;
          v31[2] = CFSTR("AppVendorName");
          v32[2] = *(_QWORD *)(*(_QWORD *)(v24 + 8) + 40);
          v32[3] = CFSTR("DOWNLOAD");
          v31[3] = CFSTR("AppAvailablityText");
          v31[4] = CFSTR("AppAvailabilityType");
          v32[4] = &unk_24F8247A0;
          objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v32, v31, 5);
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v23, "addEntriesFromDictionary:", v26);

          goto LABEL_21;
        }
      }
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v27, v33, 16);
      if (v5)
        continue;
      break;
    }
  }
LABEL_21:

  dispatch_group_leave(*(dispatch_group_t *)(a1 + 40));
}

- (void)appSupportAvailability:(id)a3 withReply:(id)a4
{
  id v6;
  void (**v7)(id, _QWORD);
  void *v8;
  void *v9;
  void *v10;
  int v11;
  __CFString *v12;
  __CFString *v13;
  NSObject *v14;
  void *v15;
  const __CFString *v16;
  const __CFString *v17;
  void *v18;
  void *v19;
  void *v20;
  __CFString *v21;
  void *v22;
  BOOL v23;
  NSObject *v24;
  _QWORD v25[4];
  __CFString *v26;
  uint64_t *v27;
  uint64_t v28;
  uint64_t *v29;
  uint64_t v30;
  uint64_t (*v31)(uint64_t, uint64_t);
  void (*v32)(uint64_t);
  id v33;
  _QWORD v34[4];
  _QWORD v35[4];
  uint8_t buf[4];
  id v37;
  __int16 v38;
  __CFString *v39;
  const __CFString *v40;
  _QWORD v41[2];

  v41[1] = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = (void (**)(id, _QWORD))a4;
  v28 = 0;
  v29 = &v28;
  v30 = 0x3032000000;
  v31 = __Block_byref_object_copy__0;
  v32 = __Block_byref_object_dispose__0;
  v40 = CFSTR("AppBundleID");
  v41[0] = v6;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v41, &v40, 1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v33 = (id)objc_msgSend(v8, "mutableCopy");

  objc_msgSend(MEMORY[0x24BDC1538], "applicationProxyForIdentifier:", v6);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "appState");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "isInstalled");

  if (v11)
  {
    objc_msgSend(v9, "vendorName");
    v12 = (__CFString *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "localizedName");
    v13 = (__CFString *)objc_claimAutoreleasedReturnValue();
    _NDOLogSystem();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412546;
      v37 = v6;
      v38 = 2112;
      v39 = v13;
      _os_log_impl(&dword_22D064000, v14, OS_LOG_TYPE_DEFAULT, "appSupportAvailability %@ %@ is installed.", buf, 0x16u);
    }

    v15 = (void *)v29[5];
    v16 = &stru_24F81DDD8;
    v34[0] = CFSTR("AppTitleKey");
    v34[1] = CFSTR("AppVendorName");
    if (v13)
      v17 = v13;
    else
      v17 = &stru_24F81DDD8;
    if (v12)
      v16 = v12;
    v35[0] = v17;
    v35[1] = v16;
    v34[2] = CFSTR("AppAvailablityText");
    objc_msgSend(MEMORY[0x24BDD1488], "bundleWithPath:", CFSTR("/System/Library/PrivateFrameworks/NewDeviceOutreachUI.framework"));
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "localizedStringForKey:value:table:", CFSTR("INSTALLED"), &stru_24F81DDD8, CFSTR("Localizable"));
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v34[3] = CFSTR("AppAvailabilityType");
    v35[2] = v19;
    v35[3] = &unk_24F824758;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v35, v34, 4);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "addEntriesFromDictionary:", v20);

    v7[2](v7, v29[5]);
    goto LABEL_16;
  }
  -[NDOAppleSupportManager checkAppIsPurchased:](self, "checkAppIsPurchased:", v6);
  v21 = (__CFString *)objc_claimAutoreleasedReturnValue();
  v12 = v21;
  if (!v21
    || (-[__CFString objectForKey:](v21, "objectForKey:", CFSTR("AppAvailabilityType")),
        v22 = (void *)objc_claimAutoreleasedReturnValue(),
        v23 = objc_msgSend(v22, "intValue") == 0,
        v22,
        v23))
  {
    v25[0] = MEMORY[0x24BDAC760];
    v25[1] = 3221225472;
    v25[2] = __59__NDOAppleSupportManager_appSupportAvailability_withReply___block_invoke;
    v25[3] = &unk_24F81DA68;
    v27 = &v28;
    v26 = v7;
    -[NDOAppleSupportManager checkIsAvailableInStore:withReply:](self, "checkIsAvailableInStore:withReply:", v6, v25);
    v13 = v26;
LABEL_16:

    goto LABEL_17;
  }
  _NDOLogSystem();
  v24 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v37 = v6;
    _os_log_impl(&dword_22D064000, v24, OS_LOG_TYPE_DEFAULT, "appSupportAvailability %@ is purchased.", buf, 0xCu);
  }

  objc_msgSend((id)v29[5], "addEntriesFromDictionary:", v12);
  v7[2](v7, v29[5]);
LABEL_17:

  _Block_object_dispose(&v28, 8);
}

void __59__NDOAppleSupportManager_appSupportAvailability_withReply___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  int v5;
  id v6;
  uint64_t v7;

  v7 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  _NDOLogSystem();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v5 = 138412290;
    v6 = v3;
    _os_log_impl(&dword_22D064000, v4, OS_LOG_TYPE_DEFAULT, "AppStore --> appSupportAvailability %@.", (uint8_t *)&v5, 0xCu);
  }

  if (v3)
    objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), "addEntriesFromDictionary:", v3);
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

}

@end
