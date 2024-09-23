@implementation MTStandardIDService

void __61__MTStandardIDService_IDInfoForNamespace_options_fromConfig___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  id v16;

  v16 = a2;
  v5 = a3;
  v12 = v5;
  if (v16)
  {
    objc_msgSend(*(id *)(a1 + 32), "finishWithResult:", v16);
  }
  else
  {
    v13 = *(void **)(a1 + 32);
    if (v5)
    {
      objc_msgSend(v13, "finishWithError:", v5);
    }
    else
    {
      MTError(110, CFSTR("Promise completed with no result or error"), v6, v7, v8, v9, v10, v11, v15);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "finishWithError:", v14);

    }
  }

}

void __48__MTStandardIDService_IDFieldsForTopic_options___block_invoke_4(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  int v11;
  id v12;
  __int16 v13;
  uint64_t v14;
  __int16 v15;
  uint64_t v16;
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  v5 = a2;
  v6 = a3;
  MTMetricsKitOSLog();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
  {
    if (v5)
      v8 = v5;
    else
      v8 = v6;
    v9 = *(_QWORD *)(a1 + 32);
    v10 = *(_QWORD *)(a1 + 40);
    v11 = 138412802;
    v12 = v8;
    v13 = 2112;
    v14 = v9;
    v15 = 2112;
    v16 = v10;
    _os_log_impl(&dword_20D758000, v7, OS_LOG_TYPE_DEBUG, "MetricsKit: Rendered ID fields: %@ for topic: %@ options: %@", (uint8_t *)&v11, 0x20u);
  }

}

void __62__MTStandardIDService__IDInfoForNamespace_options_fromConfig___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  void *v6;
  id v7;

  v7 = a2;
  v5 = a3;
  v6 = v5;
  if (v7)
  {
    objc_msgSend(*(id *)(a1 + 32), "finishWithResult:");
  }
  else if (v5)
  {
    objc_msgSend(*(id *)(a1 + 32), "finishWithError:", v5);
  }

}

- (id)generateIDInfo:(id)a3 secret:(id)a4 dsId:(id)a5 correlationIDs:(id)a6
{
  id v9;
  id v10;
  id v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  const __CFString *v16;
  uint64_t v17;
  void *v18;
  const __CFString *v19;
  void *v20;
  void *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  void *v26;
  uint64_t i;
  void *v28;
  void *v29;
  uint64_t v30;
  void *v31;
  void *v32;
  uint64_t v33;
  uint64_t v34;
  void *v35;
  void *v36;
  uint64_t v37;
  void *v38;
  void *v39;
  uint64_t v40;
  void *v41;
  void *v42;
  void *v43;
  MTIDInfo *v44;
  void *v45;
  void *v46;
  id v48;
  void *v49;
  void *v50;
  void *v51;
  id obj;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  _BYTE v57[128];
  uint64_t v58;

  v58 = *MEMORY[0x24BDAC8D0];
  v9 = a3;
  v10 = a4;
  v48 = a5;
  v11 = a6;
  v12 = (void *)MEMORY[0x24BDBCEB8];
  objc_msgSend(v9, "idNamespace");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v50 = v9;
  objc_msgSend(v9, "version");
  v14 = objc_claimAutoreleasedReturnValue();
  v15 = (void *)v14;
  if (v14)
    v16 = (const __CFString *)v14;
  else
    v16 = &stru_24C7A22D0;
  objc_msgSend(v10, "value");
  v17 = objc_claimAutoreleasedReturnValue();
  v18 = (void *)v17;
  if (v17)
    v19 = (const __CFString *)v17;
  else
    v19 = &stru_24C7A22D0;
  objc_msgSend(v12, "arrayWithObjects:", v13, v16, v19, 0);
  v51 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v10, "effectiveDate");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "expirationDate");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v49 = v10;
  v22 = objc_msgSend(v10, "isSynchronized");
  v53 = 0u;
  v54 = 0u;
  v55 = 0u;
  v56 = 0u;
  obj = v11;
  v23 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v53, v57, 16);
  if (v23)
  {
    v24 = v23;
    v25 = *(_QWORD *)v54;
    v26 = v51;
    do
    {
      for (i = 0; i != v24; ++i)
      {
        if (*(_QWORD *)v54 != v25)
          objc_enumerationMutation(obj);
        v28 = *(void **)(*((_QWORD *)&v53 + 1) + 8 * i);
        objc_msgSend(v28, "idString");
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v26, "addObject:", v29);

        objc_msgSend(v28, "effectiveDate");
        v30 = objc_claimAutoreleasedReturnValue();
        v31 = (void *)v30;
        if (v20)
        {
          if (v30)
          {
            objc_msgSend(v28, "effectiveDate");
            v32 = (void *)objc_claimAutoreleasedReturnValue();
            if (objc_msgSend(v20, "compare:", v32) == -1)
            {
              objc_msgSend(v28, "effectiveDate");
              v33 = objc_claimAutoreleasedReturnValue();

              v20 = (void *)v33;
              v26 = v51;
            }

          }
        }
        else
        {
          v20 = (void *)v30;
        }
        objc_msgSend(v28, "expirationDate");
        v34 = objc_claimAutoreleasedReturnValue();
        v35 = (void *)v34;
        if (v21)
        {
          if (v34)
          {
            objc_msgSend(v28, "expirationDate");
            v36 = (void *)objc_claimAutoreleasedReturnValue();
            if (objc_msgSend(v21, "compare:", v36) != -1)
            {
              objc_msgSend(v28, "expirationDate");
              v37 = objc_claimAutoreleasedReturnValue();

              v21 = (void *)v37;
              v26 = v51;
            }

          }
        }
        else
        {
          v21 = (void *)v34;
        }
        v22 = v22 & objc_msgSend(v28, "isSynchronized");
      }
      v24 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v53, v57, 16);
    }
    while (v24);
  }

  objc_msgSend(MEMORY[0x24BDD16A8], "string");
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v50, "version");
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  v40 = objc_msgSend(v39, "length");

  if (v40)
  {
    objc_msgSend(v50, "version");
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v38, "appendString:", v41);

    objc_msgSend(v38, "appendString:", CFSTR("_"));
  }
  objc_msgSend(v51, "componentsJoinedByString:", CFSTR("\n"));
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v42, "mt_SHA1Base62String");
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v38, "appendString:", v43);

  v44 = -[MTIDInfo initWithScheme:secret:idString:dsId:effectiveDate:expirationDate:]([MTIDInfo alloc], "initWithScheme:secret:idString:dsId:effectiveDate:expirationDate:", v50, v49, v38, v48, v20, v21);
  -[MTIDInfo setIsSynchronized:](v44, "setIsSynchronized:", v22);
  -[MTIDInfo scheme](v44, "scheme");
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v45, "idNamespace");
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  +[MTStandardIDService registerInterprocessChangeNotifier:](MTStandardIDService, "registerInterprocessChangeNotifier:", v46);

  return v44;
}

+ (void)registerInterprocessChangeNotifier:(id)a3
{
  id v3;
  id v4;
  void *v5;
  MTInterprocessChangeNotifier *v6;
  id v7;
  MTInterprocessChangeNotifier *v8;
  _QWORD v9[4];
  id v10;

  v3 = a3;
  if (registerInterprocessChangeNotifier__onceToken != -1)
    dispatch_once(&registerInterprocessChangeNotifier__onceToken, &__block_literal_global_103);
  v4 = (id)registerInterprocessChangeNotifier__subscriptions;
  objc_sync_enter(v4);
  objc_msgSend((id)registerInterprocessChangeNotifier__subscriptions, "objectForKeyedSubscript:", v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v5)
  {
    v6 = [MTInterprocessChangeNotifier alloc];
    v9[0] = MEMORY[0x24BDAC760];
    v9[1] = 3221225472;
    v9[2] = __58__MTStandardIDService_registerInterprocessChangeNotifier___block_invoke_2;
    v9[3] = &unk_24C7A0748;
    v7 = v3;
    v10 = v7;
    v8 = -[MTInterprocessChangeNotifier initWithIdentifier:onChange:](v6, "initWithIdentifier:onChange:", v7, v9);
    objc_msgSend((id)registerInterprocessChangeNotifier__subscriptions, "setObject:forKeyedSubscript:", v8, v7);

  }
  objc_sync_exit(v4);

}

void __41__MTStandardIDService_flushPerfKitEvents__block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v3;
  NSObject *v4;
  NSObject *v5;
  const char *v6;
  NSObject *v7;
  os_log_type_t v8;
  uint32_t v9;
  int v10;
  id v11;
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  v3 = a3;
  MTMetricsKitOSLog();
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v3)
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      v10 = 138412290;
      v11 = v3;
      v6 = "MetricsKit: Failed to flush PerfKit events. Error %@";
      v7 = v5;
      v8 = OS_LOG_TYPE_ERROR;
      v9 = 12;
LABEL_6:
      _os_log_impl(&dword_20D758000, v7, v8, v6, (uint8_t *)&v10, v9);
    }
  }
  else if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
  {
    LOWORD(v10) = 0;
    v6 = "MetricsKit: Flushed PerfKit events";
    v7 = v5;
    v8 = OS_LOG_TYPE_DEBUG;
    v9 = 2;
    goto LABEL_6;
  }

}

- (MTStandardIDService)initWithAMSBag:(id)a3
{
  return -[MTStandardIDService initWithConfigDictPromise:bag:](self, "initWithConfigDictPromise:bag:", 0, a3);
}

- (id)IDFieldsForTopic:(id)a3 options:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  uint64_t v9;
  id v10;
  id v11;
  void *v12;
  id v13;
  id v14;
  _QWORD v16[4];
  id v17;
  id v18;
  _QWORD v19[4];
  id v20;
  id v21;
  MTStandardIDService *v22;

  v6 = a3;
  -[MTStandardIDService filledOptions:](self, "filledOptions:", a4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[MTStandardIDService configPromise](self, "configPromise");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = MEMORY[0x24BDAC760];
  v19[0] = MEMORY[0x24BDAC760];
  v19[1] = 3221225472;
  v19[2] = __48__MTStandardIDService_IDFieldsForTopic_options___block_invoke;
  v19[3] = &unk_24C7A04A0;
  v10 = v6;
  v20 = v10;
  v11 = v7;
  v21 = v11;
  v22 = self;
  objc_msgSend(v8, "thenWithBlock:", v19);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  v16[0] = v9;
  v16[1] = 3221225472;
  v16[2] = __48__MTStandardIDService_IDFieldsForTopic_options___block_invoke_4;
  v16[3] = &unk_24C7A04C8;
  v17 = v10;
  v18 = v11;
  v13 = v11;
  v14 = v10;
  objc_msgSend(v12, "addFinishBlock:", v16);

  return v12;
}

void __61__MTStandardIDService_IDInfoForNamespace_options_fromConfig___block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  _QWORD v9[4];
  id v10;

  objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:", CFSTR("waitTime"));
  v2 = objc_claimAutoreleasedReturnValue();
  if (v2
    && (v3 = (void *)v2,
        objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:", CFSTR("syncWaitTime")),
        v4 = (void *)objc_claimAutoreleasedReturnValue(),
        v4,
        v3,
        !v4))
  {
    v6 = (void *)objc_msgSend(*(id *)(a1 + 32), "mutableCopy");
    objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:", CFSTR("waitTime"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setObject:forKeyedSubscript:", v7, CFSTR("syncWaitTime"));

    v5 = (id)objc_msgSend(v6, "copy");
  }
  else
  {
    v5 = *(id *)(a1 + 32);
  }
  objc_msgSend(*(id *)(a1 + 40), "_IDInfoForNamespace:options:fromConfig:", *(_QWORD *)(a1 + 48), v5, *(_QWORD *)(a1 + 56));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x24BDAC760];
  v9[1] = 3221225472;
  v9[2] = __61__MTStandardIDService_IDInfoForNamespace_options_fromConfig___block_invoke_2;
  v9[3] = &unk_24C7A05B8;
  v10 = *(id *)(a1 + 64);
  objc_msgSend(v8, "addFinishBlock:", v9);

}

- (id)filledOptions:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
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
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  uint64_t v23;

  v4 = a3;
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("date"));
  v5 = objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    v6 = (void *)v5;
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("dsId"));
    v7 = objc_claimAutoreleasedReturnValue();
    if (v7)
    {
      v8 = (void *)v7;
      objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("appBundleID"));
      v9 = (void *)objc_claimAutoreleasedReturnValue();

      if (v9)
        return v4;
    }
    else
    {

    }
  }
  objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = v10;
  if (v4)
    objc_msgSend(v10, "addEntriesFromDictionary:", v4);
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("date"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v12)
  {
    +[MTFrameworkEnvironment sharedEnvironment](MTFrameworkEnvironment, "sharedEnvironment");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "date");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setObject:forKeyedSubscript:", v14, CFSTR("date"));

  }
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("dsId"));
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v15)
  {
    -[MTStandardIDService dsId](self, "dsId");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    if (v16)
    {
      objc_msgSend(v11, "setObject:forKeyedSubscript:", v16, CFSTR("dsId"));
    }
    else
    {
      -[MTStandardIDService defaultDSID](self, "defaultDSID");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "setObject:forKeyedSubscript:", v17, CFSTR("dsId"));

    }
  }
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("appBundleID"));
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v18)
  {
    -[MTStandardIDService applicationBundleIdentifierOverrideForNetworkAttribution](self, "applicationBundleIdentifierOverrideForNetworkAttribution");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    if (v19)
    {
      objc_msgSend(v11, "setObject:forKeyedSubscript:", v19, CFSTR("appBundleID"));
    }
    else
    {
      +[MTFrameworkEnvironment sharedEnvironment](MTFrameworkEnvironment, "sharedEnvironment");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "hostProcessBundleIdentifier");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "setObject:forKeyedSubscript:", v21, CFSTR("appBundleID"));

    }
  }
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("iTunesUserRequired"));
  v22 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v22)
    objc_msgSend(v11, "setObject:forKeyedSubscript:", MEMORY[0x24BDBD1C8], CFSTR("iTunesUserRequired"));
  v23 = objc_msgSend(v11, "copy");

  v4 = (id)v23;
  return v4;
}

- (id)_IDInfoForNamespace:(id)a3 options:(id)a4 fromConfig:(id)a5
{
  id v7;
  id v8;
  id v9;
  void *v10;
  void *v11;
  unsigned __int8 v12;
  void *v13;
  int v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  double v20;
  double v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  double v28;
  double v29;
  void *v30;
  id v31;
  void *v32;
  int v33;
  id v34;
  void *v35;
  void *v36;
  BOOL v37;
  MTIDSecret *v38;
  MTIDInfo *v39;
  void *v40;
  MTIDInfo *v41;
  void *v42;
  void *v43;
  char v44;
  NSObject *v45;
  _BOOL4 v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  uint64_t v52;
  void *v53;
  uint64_t v54;
  void *v55;
  MTPromiseWithTimeout *v56;
  void *v57;
  void *v58;
  void *v59;
  void *v60;
  void *v61;
  void *v62;
  void *v63;
  id v64;
  void *v65;
  void *v66;
  void *v67;
  id v68;
  void *v69;
  uint64_t v71;
  void *v72;
  MTPromiseWithTimeout *v73;
  void *v74;
  void *v75;
  void *v76;
  void *v77;
  void *v78;
  void *v79;
  void *v80;
  void *v82;
  void *v83;
  _QWORD v84[4];
  id v85;
  id v86;
  MTStandardIDService *v87;
  _QWORD v88[4];
  id v89;
  id v90;
  _QWORD v91[4];
  MTPromiseWithTimeout *v92;
  _QWORD v93[2];
  uint8_t buf[4];
  void *v95;
  uint64_t v96;

  v96 = *MEMORY[0x24BDAC8D0];
  v7 = a3;
  v8 = a4;
  v9 = a5;
  v80 = v7;
  objc_msgSend(v9, "schemeForNamespace:", v7);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("date"));
  v82 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("dsId"));
  v83 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("existingOnly"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "BOOLValue");

  objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("iTunesUserRequired"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v13, "BOOLValue");

  if (v14)
  {
    objc_msgSend(MEMORY[0x24BDB43A0], "ams_sharedAccountStore");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "ams_activeiTunesAccount");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "ams_DSID");
    v17 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v83 || v17 && !objc_msgSend(v17, "isEqualToNumber:", v83))
    {
      v38 = -[MTIDSecret initWithValue:effectiveDate:expirationDate:isSynchronize:]([MTIDSecret alloc], "initWithValue:effectiveDate:expirationDate:isSynchronize:", &stru_24C7A22D0, 0, 0, 0);
      v39 = [MTIDInfo alloc];
      -[MTIDSecret value](v38, "value");
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      LOBYTE(v71) = 0;
      v41 = -[MTIDInfo initWithScheme:secret:idString:dsId:effectiveDate:expirationDate:shouldGenerateMetricsFields:](v39, "initWithScheme:secret:idString:dsId:effectiveDate:expirationDate:shouldGenerateMetricsFields:", v10, v38, v40, 0, 0, 0, v71);

      +[MTPromise promiseWithResult:](MTPromise, "promiseWithResult:", v41);
      v31 = (id)objc_claimAutoreleasedReturnValue();

      goto LABEL_43;
    }

  }
  if (objc_msgSend(v10, "lifespan") < 1)
    goto LABEL_10;
  +[MTFrameworkEnvironment sharedEnvironment](MTFrameworkEnvironment, "sharedEnvironment");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "date");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v82, "timeIntervalSinceDate:", v19);
  v21 = v20;

  objc_msgSend(v10, "maxPastTimeInterval");
  if (v21 < -v28)
    goto LABEL_9;
  objc_msgSend(v10, "maxFutureTimeInterval");
  if (v21 <= v29)
  {
LABEL_10:
    objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("reset"));
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    v33 = objc_msgSend(v32, "BOOLValue");

    v34 = v8;
    v35 = v34;
    if (v33)
    {
      v36 = (void *)objc_msgSend(v34, "mutableCopy");
      objc_msgSend(v36, "setObject:forKeyedSubscript:", 0, CFSTR("reset"));
      v78 = (void *)objc_msgSend(v36, "copy");

      v37 = 1;
    }
    else
    {
      objc_msgSend(v34, "objectForKeyedSubscript:", CFSTR("cachePolicy"));
      v42 = (void *)objc_claimAutoreleasedReturnValue();
      v36 = v42;
      if (v42)
        v37 = objc_msgSend(v42, "integerValue") != 0;
      else
        v37 = 0;
      v78 = v35;
    }

    -[MTStandardIDService cache](self, "cache");
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v43, "IDInfoForScheme:options:", v10, v35);
    v79 = (void *)objc_claimAutoreleasedReturnValue();

    if (v79)
      v44 = v37;
    else
      v44 = 1;
    MTMetricsKitOSLog();
    v45 = objc_claimAutoreleasedReturnValue();
    v46 = os_log_type_enabled(v45, OS_LOG_TYPE_INFO);
    if (((v44 | v12) & 1) != 0)
    {
      if (v79)
      {
        if (v46)
        {
          objc_msgSend(v10, "idNamespace");
          v47 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138412290;
          v95 = v47;
          _os_log_impl(&dword_20D758000, v45, OS_LOG_TYPE_INFO, "MetricsKit: ID promise for scheme %@ is cached but not used", buf, 0xCu);

        }
      }
      else if (v46)
      {
        objc_msgSend(v10, "idNamespace");
        v50 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412290;
        v95 = v50;
        _os_log_impl(&dword_20D758000, v45, OS_LOG_TYPE_INFO, "MetricsKit: ID promise for scheme %@ is not cached", buf, 0xCu);

      }
      v51 = (void *)MEMORY[0x24BDBCEB8];
      objc_msgSend(v10, "correlations");
      v52 = objc_claimAutoreleasedReturnValue();
      v53 = (void *)v52;
      if (v52)
        v54 = v52;
      else
        v54 = MEMORY[0x24BDBD1A8];
      objc_msgSend(v51, "arrayWithArray:", v54);
      v77 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v77, "removeObject:", v80);
      -[MTStandardIDService secretStore](self, "secretStore");
      v55 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v55, "secretForScheme:options:", v10, v35);
      v76 = (void *)objc_claimAutoreleasedReturnValue();

      dispatch_get_global_queue(0, 0);
      v74 = (void *)objc_claimAutoreleasedReturnValue();
      v56 = -[MTPromiseWithTimeout initWithTimeout:queue:timeoutBlock:]([MTPromiseWithTimeout alloc], "initWithTimeout:queue:timeoutBlock:", v74, &__block_literal_global_80, 55.0);
      v91[0] = MEMORY[0x24BDAC760];
      v91[1] = 3221225472;
      v91[2] = __62__MTStandardIDService__IDInfoForNamespace_options_fromConfig___block_invoke_2;
      v91[3] = &unk_24C7A0628;
      v73 = v56;
      v92 = v73;
      objc_msgSend(v76, "addFinishBlock:", v91);
      -[MTStandardIDService IDsForNamespaces:options:fromConfig:](self, "IDsForNamespaces:options:fromConfig:", v77, v78, v9);
      v72 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "performanceTopic");
      v75 = (void *)objc_claimAutoreleasedReturnValue();
      if (v75 && objc_msgSend(v10, "idType") == 2)
      {
        -[MTStandardIDService associatedObjects](self, "associatedObjects");
        v57 = (void *)objc_claimAutoreleasedReturnValue();
        objc_sync_enter(v57);
        -[MTStandardIDService associatedObjects](self, "associatedObjects");
        v58 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v58, "objectForKeyedSubscript:", CFSTR("AMSBag"));
        v59 = (void *)objc_claimAutoreleasedReturnValue();

        if (v59)
        {
          -[MTStandardIDService associatedObjects](self, "associatedObjects");
          v60 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v60, "objectForKeyedSubscript:", CFSTR("perfKit"));
          v61 = (void *)objc_claimAutoreleasedReturnValue();

          if (!v61)
          {
            +[MTMetricsKitTemplate kitWithTopic:amsBag:](MTPerfKit, "kitWithTopic:amsBag:", v75, v59);
            v61 = (void *)objc_claimAutoreleasedReturnValue();
            -[MTStandardIDService associatedObjects](self, "associatedObjects");
            v62 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v62, "setObject:forKeyedSubscript:", v61, CFSTR("perfKit"));

          }
        }
        else
        {
          v61 = 0;
        }

        objc_sync_exit(v57);
        if (v61)
        {
          objc_msgSend(v61, "flexibleMeasurementWithEventType:", CFSTR("idRequest"));
          v63 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v63, "mark:", CFSTR("requestStartTime"));
          v88[0] = MEMORY[0x24BDAC760];
          v88[1] = 3221225472;
          v88[2] = __62__MTStandardIDService__IDInfoForNamespace_options_fromConfig___block_invoke_3;
          v88[3] = &unk_24C7A0650;
          v89 = v10;
          v90 = v63;
          v64 = v63;
          objc_msgSend(v76, "addFinishBlock:", v88);

        }
      }
      -[MTPromiseWithTimeout promise](v73, "promise");
      v65 = (void *)objc_claimAutoreleasedReturnValue();
      v93[0] = v65;
      v93[1] = v72;
      objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v93, 2);
      v66 = (void *)objc_claimAutoreleasedReturnValue();
      +[MTPromise promiseWithAll:](MTPromise, "promiseWithAll:", v66);
      v67 = (void *)objc_claimAutoreleasedReturnValue();
      v84[0] = MEMORY[0x24BDAC760];
      v84[1] = 3221225472;
      v84[2] = __62__MTStandardIDService__IDInfoForNamespace_options_fromConfig___block_invoke_91;
      v84[3] = &unk_24C7A02B8;
      v68 = v10;
      v85 = v68;
      v86 = v83;
      v87 = self;
      objc_msgSend(v67, "thenWithBlock:", v84);
      v31 = (id)objc_claimAutoreleasedReturnValue();

      -[MTStandardIDService cache](self, "cache");
      v69 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v69, "addIdInfoPromise:forScheme:options:", v31, v68, v35);

      v49 = v79;
    }
    else
    {
      if (v46)
      {
        objc_msgSend(v10, "idNamespace");
        v48 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412290;
        v95 = v48;
        _os_log_impl(&dword_20D758000, v45, OS_LOG_TYPE_INFO, "MetricsKit: Returning cached ID promise for scheme %@", buf, 0xCu);

      }
      v49 = v79;
      v31 = v79;
    }

  }
  else
  {
LABEL_9:
    MTError(706, CFSTR("Date for the request ID is out of bounds"), v22, v23, v24, v25, v26, v27, v71);
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    +[MTPromise promiseWithError:](MTPromise, "promiseWithError:", v30);
    v31 = (id)objc_claimAutoreleasedReturnValue();

  }
LABEL_43:

  return v31;
}

- (MTIDCache)cache
{
  return self->_cache;
}

- (NSNumber)defaultDSID
{
  MTStandardIDService *v2;
  NSNumber *defaultDSID;
  void *v4;
  void *v5;
  uint64_t v6;
  NSNumber *v7;
  NSNumber *v8;

  v2 = self;
  objc_sync_enter(v2);
  defaultDSID = v2->_defaultDSID;
  if (!defaultDSID)
  {
    objc_msgSend(MEMORY[0x24BDB43A0], "ams_sharedAccountStore");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "ams_activeiTunesAccount");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "ams_DSID");
    v6 = objc_claimAutoreleasedReturnValue();
    v7 = v2->_defaultDSID;
    v2->_defaultDSID = (NSNumber *)v6;

    defaultDSID = v2->_defaultDSID;
  }
  v8 = defaultDSID;
  objc_sync_exit(v2);

  return v8;
}

id __48__MTStandardIDService_IDFieldsForTopic_options___block_invoke_2(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;
  void *v4;

  objc_msgSend(a2, "mt_map:", &__block_literal_global_55);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  +[MTReflectUtil mergeAndCleanDictionaries:](MTReflectUtil, "mergeAndCleanDictionaries:", v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  +[MTPromise promiseWithResult:](MTPromise, "promiseWithResult:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

uint64_t __48__MTStandardIDService_IDFieldsForTopic_options___block_invoke_3(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "metricsFields");
}

id __48__MTStandardIDService_IDFieldsForTopic_options___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;

  v3 = a2;
  objc_msgSend(v3, "namespaceForTopic:idType:", *(_QWORD *)(a1 + 32), 2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "namespaceForTopic:idType:", *(_QWORD *)(a1 + 32), 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBCEB8], "arrayWithCapacity:", 2);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "objectForKeyedSubscript:", CFSTR("idType"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (v7 && objc_msgSend(v7, "integerValue") != 2)
    goto LABEL_7;
  if (v4)
  {
    objc_msgSend(*(id *)(a1 + 48), "IDInfoForNamespace:options:fromConfig:", v4, *(_QWORD *)(a1 + 40), v3);
    v9 = objc_claimAutoreleasedReturnValue();
    if (v9)
    {
      v10 = (void *)v9;
      objc_msgSend(v6, "addObject:", v9);

    }
  }
  if (v8)
  {
LABEL_7:
    if (objc_msgSend(v8, "integerValue") != 1 || v5 == 0)
      goto LABEL_16;
  }
  else if (!v5)
  {
    goto LABEL_16;
  }
  objc_msgSend(*(id *)(a1 + 48), "IDInfoForNamespace:options:fromConfig:", v5, *(_QWORD *)(a1 + 40), v3);
  v12 = objc_claimAutoreleasedReturnValue();
  if (v12)
  {
    v13 = (void *)v12;
    objc_msgSend(v6, "addObject:", v12);

  }
LABEL_16:
  if (objc_msgSend(v6, "count"))
  {
    +[MTPromise promiseWithAll:](MTPromise, "promiseWithAll:", v6);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "thenWithBlock:", &__block_literal_global_53);
    v15 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    +[MTPromise promiseWithResult:](MTPromise, "promiseWithResult:", MEMORY[0x24BDBD1B8]);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v15;
}

- (id)IDInfoForNamespace:(id)a3 options:(id)a4 fromConfig:(id)a5
{
  id v8;
  id v9;
  id v10;
  MTPromise *v11;
  NSObject *v12;
  MTPromise *v13;
  id v14;
  id v15;
  id v16;
  MTPromise *v17;
  MTPromise *v18;
  _QWORD block[4];
  id v21;
  MTStandardIDService *v22;
  id v23;
  id v24;
  MTPromise *v25;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = objc_alloc_init(MTPromise);
  -[MTStandardIDService serialQueue](self, "serialQueue");
  v12 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __61__MTStandardIDService_IDInfoForNamespace_options_fromConfig___block_invoke;
  block[3] = &unk_24C7A05E0;
  v21 = v9;
  v22 = self;
  v23 = v8;
  v24 = v10;
  v13 = v11;
  v25 = v13;
  v14 = v10;
  v15 = v8;
  v16 = v9;
  dispatch_async(v12, block);

  v17 = v25;
  v18 = v13;

  return v18;
}

- (OS_dispatch_queue)serialQueue
{
  if (serialQueue_onceToken != -1)
    dispatch_once(&serialQueue_onceToken, &__block_literal_global_2);
  return (OS_dispatch_queue *)(id)serialQueue_serialQueue;
}

- (void)flushPerfKitEvents
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  -[MTStandardIDService associatedObjects](self, "associatedObjects");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_sync_enter(v3);
  -[MTStandardIDService associatedObjects](self, "associatedObjects");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("perfKit"));
  v9 = (id)objc_claimAutoreleasedReturnValue();

  objc_sync_exit(v3);
  v5 = v9;
  if (v9)
  {
    objc_msgSend(v9, "system");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "eventRecorder");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "flushUnreportedEvents");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v8, "addFinishBlock:", &__block_literal_global_102);
    v5 = v9;
  }

}

- (NSMutableDictionary)associatedObjects
{
  return self->_associatedObjects;
}

- (NSNumber)dsId
{
  NSNumber *dsId;

  dsId = self->_dsId;
  if (dsId)
    return dsId;
  -[MTStandardIDService defaultDSID](self, "defaultDSID");
  return (NSNumber *)(id)objc_claimAutoreleasedReturnValue();
}

- (id)configPromise
{
  MTStandardIDService *v2;
  void *v3;
  void *v4;
  MTStandardIDService *v5;
  void *v6;
  void *v7;
  MTPromise *v8;
  void *v9;
  MTPromise *v10;
  MTPromise *v11;
  MTPromise *v12;
  _QWORD v14[5];
  _QWORD v15[5];
  MTPromise *v16;

  v2 = self;
  objc_sync_enter(v2);
  -[MTStandardIDService cachedConfig](v2, "cachedConfig");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_sync_exit(v2);

  if (v3)
  {
    +[MTPromise promiseWithResult:](MTPromise, "promiseWithResult:", v3);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v5 = v2;
    objc_sync_enter(v5);
    -[MTStandardIDService associatedObjects](v5, "associatedObjects");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("AMSBag"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    objc_sync_exit(v5);
    if (v7)
    {
      v8 = objc_alloc_init(MTPromise);
      objc_msgSend(v7, "dictionaryForKey:", CFSTR("metrics"));
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v15[0] = MEMORY[0x24BDAC760];
      v15[1] = 3221225472;
      v15[2] = __36__MTStandardIDService_configPromise__block_invoke;
      v15[3] = &unk_24C7A03A8;
      v15[4] = v5;
      v10 = v8;
      v16 = v10;
      objc_msgSend(v9, "valueWithCompletion:", v15);

      v11 = v16;
      v12 = v10;

      v4 = v12;
    }
    else
    {
      -[MTStandardIDService configDictPromise](v5, "configDictPromise");
      v12 = (MTPromise *)objc_claimAutoreleasedReturnValue();
      v14[0] = MEMORY[0x24BDAC760];
      v14[1] = 3221225472;
      v14[2] = __36__MTStandardIDService_configPromise__block_invoke_33;
      v14[3] = &unk_24C7A03D0;
      v14[4] = v5;
      -[MTPromise thenWithBlock:](v12, "thenWithBlock:", v14);
      v4 = (void *)objc_claimAutoreleasedReturnValue();
    }

  }
  return v4;
}

- (MTIDConfig)cachedConfig
{
  return self->_cachedConfig;
}

- (NSString)applicationBundleIdentifierOverrideForNetworkAttribution
{
  return self->_applicationBundleIdentifierOverrideForNetworkAttribution;
}

- (MTStandardIDService)initWithConfigDictPromise:(id)a3 bag:(id)a4
{
  id v6;
  id v7;
  MTStandardIDService *v8;
  MTStandardIDService *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  void *v16;
  void *v17;
  MTInterprocessChangeNotifier *v18;
  MTInterprocessChangeNotifier *v19;
  void *v20;
  void *v21;
  uint64_t v23;
  uint64_t v24;
  void (*v25)(uint64_t);
  void *v26;
  id v27;
  id location;
  objc_super v29;

  v6 = a3;
  v7 = a4;
  v29.receiver = self;
  v29.super_class = (Class)MTStandardIDService;
  v8 = -[MTStandardIDService init](&v29, sel_init);
  v9 = v8;
  if (v8)
  {
    if (v6)
    {
      -[MTStandardIDService setConfigDictPromise:](v8, "setConfigDictPromise:", v6);
    }
    else
    {
      +[MTPromise promiseWithResult:](MTPromise, "promiseWithResult:", MEMORY[0x24BDBD1B8]);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      -[MTStandardIDService setConfigDictPromise:](v9, "setConfigDictPromise:", v10);

    }
    +[MTFrameworkEnvironment sharedEnvironment](MTFrameworkEnvironment, "sharedEnvironment");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "idCache");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[MTStandardIDService setCache:](v9, "setCache:", v12);

    +[MTFrameworkEnvironment sharedEnvironment](MTFrameworkEnvironment, "sharedEnvironment");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "secretStore");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[MTStandardIDService setSecretStore:](v9, "setSecretStore:", v14);

    v15 = objc_alloc_init(MEMORY[0x24BDBCED8]);
    -[MTStandardIDService setAssociatedObjects:](v9, "setAssociatedObjects:", v15);

    if (v7)
    {
      -[MTStandardIDService associatedObjects](v9, "associatedObjects");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "setObject:forKeyedSubscript:", v7, CFSTR("AMSBag"));

    }
    objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "addObserver:selector:name:object:", v9, sel_handleResetNotification_, CFSTR("MTIDNamespacesDidResetNotification"), 0);
    if (NSClassFromString(CFSTR("UIApplication")))
      objc_msgSend(v17, "addObserver:selector:name:object:", v9, sel_handleApplicationStateChange_, CFSTR("UIApplicationWillEnterForegroundNotification"), 0);
    objc_initWeak(&location, v9);
    v18 = [MTInterprocessChangeNotifier alloc];
    v23 = MEMORY[0x24BDAC760];
    v24 = 3221225472;
    v25 = __53__MTStandardIDService_initWithConfigDictPromise_bag___block_invoke;
    v26 = &unk_24C7A0380;
    objc_copyWeak(&v27, &location);
    v19 = -[MTInterprocessChangeNotifier initWithIdentifier:onChange:](v18, "initWithIdentifier:onChange:", CFSTR("MTCloudKitAccountDidChangeNotification"), &v23);
    -[MTStandardIDService setAccountChanged:](v9, "setAccountChanged:", v19, v23, v24, v25, v26);

    objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "addObserver:selector:name:object:", v9, sel_handleAccountNotification, *MEMORY[0x24BDB3D98], 0);

    objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "addObserver:selector:name:object:", v9, sel_handleAccountNotification, *MEMORY[0x24BDB3FA8], 0);

    -[MTStandardIDService maybeSubscribeToDarwinNotifications](v9, "maybeSubscribeToDarwinNotifications");
    objc_destroyWeak(&v27);
    objc_destroyWeak(&location);

  }
  return v9;
}

- (void)setSecretStore:(id)a3
{
  objc_storeStrong((id *)&self->_secretStore, a3);
}

- (void)setConfigDictPromise:(id)a3
{
  objc_storeStrong((id *)&self->_configDictPromise, a3);
}

- (void)setCache:(id)a3
{
  objc_storeStrong((id *)&self->_cache, a3);
}

- (void)setAssociatedObjects:(id)a3
{
  objc_storeStrong((id *)&self->_associatedObjects, a3);
}

- (void)setAccountChanged:(id)a3
{
  objc_storeStrong((id *)&self->_accountChanged, a3);
}

- (void)maybeSubscribeToDarwinNotifications
{
  __CFNotificationCenter *DarwinNotifyCenter;
  __CFNotificationCenter *v4;
  void *v5;
  int v6;

  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  v4 = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterAddObserver(v4, self, (CFNotificationCallback)_handleITunesAccountsChangedNotification, CFSTR("com.apple.itunesstored.accountschanged"), 0, CFNotificationSuspensionBehaviorDrop);
  +[MTFrameworkEnvironment sharedEnvironment](MTFrameworkEnvironment, "sharedEnvironment");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "isInternalBuild");

  if (v6)
  {
    CFNotificationCenterAddObserver(DarwinNotifyCenter, self, (CFNotificationCallback)_handleDarwinNotification, CFSTR("MTIDServiceClearLocalDataNotification"), 0, CFNotificationSuspensionBehaviorDeliverImmediately);
    CFNotificationCenterAddObserver(DarwinNotifyCenter, self, (CFNotificationCallback)_handleDarwinNotification, CFSTR("MTIDServiceResetIDsNotification"), 0, CFNotificationSuspensionBehaviorDeliverImmediately);
    CFNotificationCenterAddObserver(DarwinNotifyCenter, self, (CFNotificationCallback)_handleDarwinNotification, CFSTR("MTIDServiceGetSecretsNotification"), 0, CFNotificationSuspensionBehaviorDeliverImmediately);
    CFNotificationCenterAddObserver(DarwinNotifyCenter, self, (CFNotificationCallback)_handleDarwinNotification, CFSTR("MTIDServiceGetIDsNotification"), 0, CFNotificationSuspensionBehaviorDeliverImmediately);
    CFNotificationCenterAddObserver(DarwinNotifyCenter, self, (CFNotificationCallback)_handleDarwinNotification, CFSTR("MTIDServiceGetConfigNotification"), 0, CFNotificationSuspensionBehaviorDeliverImmediately);
  }
}

- (MTIDSecretStore)secretStore
{
  return self->_secretStore;
}

- (id)IDsForNamespaces:(id)a3 options:(id)a4 fromConfig:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  _QWORD v14[5];
  id v15;
  id v16;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  if (objc_msgSend(v8, "count"))
  {
    v14[0] = MEMORY[0x24BDAC760];
    v14[1] = 3221225472;
    v14[2] = __59__MTStandardIDService_IDsForNamespaces_options_fromConfig___block_invoke;
    v14[3] = &unk_24C7A0590;
    v14[4] = self;
    v15 = v9;
    v16 = v10;
    objc_msgSend(v8, "mt_map:", v14);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    +[MTPromise promiseWithAll:](MTPromise, "promiseWithAll:", v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    +[MTPromise promiseWithResult:](MTPromise, "promiseWithResult:", MEMORY[0x24BDBD1A8]);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v12;
}

void __62__MTStandardIDService__IDInfoForNamespace_options_fromConfig___block_invoke_3(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
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
  id v19;
  const __CFString *v20;
  void *v21;
  const __CFString *v22;
  void *v23;
  const __CFString *v24;
  void *v25;
  uint8_t buf[4];
  void *v27;
  uint64_t v28;

  v28 = *MEMORY[0x24BDAC8D0];
  v5 = a2;
  v6 = a3;
  MTMetricsKitOSLog();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    objc_msgSend(*(id *)(a1 + 32), "idNamespace");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412290;
    v27 = v8;
    _os_log_impl(&dword_20D758000, v7, OS_LOG_TYPE_INFO, "MetricsKit: Secret promise for scheme %@ completed", buf, 0xCu);

  }
  if (v5)
  {
    objc_msgSend(*(id *)(a1 + 40), "mark:", CFSTR("requestEndTime"));
    v9 = *(void **)(a1 + 40);
    v24 = CFSTR("syncState");
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", objc_msgSend(v5, "isSynchronized"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v25 = v10;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v25, &v24, 1);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "addFields:", v11, 0);

    objc_msgSend(v5, "syncStatusCode");
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    if (v12)
    {
      v13 = *(void **)(a1 + 40);
      v22 = CFSTR("statusCode");
      objc_msgSend(v5, "syncStatusCode");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v23 = v14;
      objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v23, &v22, 1);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "addFields:", v15, 0);
LABEL_8:

    }
  }
  else if (v6)
  {
    v16 = *(void **)(a1 + 40);
    v20 = CFSTR("statusCode");
    v17 = (void *)MEMORY[0x24BDD17C8];
    objc_msgSend(v6, "domain");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "stringWithFormat:", CFSTR("%@-%ld"), v14, objc_msgSend(v6, "code"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = v15;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v21, &v20, 1);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "addFields:", v18, 0);

    goto LABEL_8;
  }
  v19 = (id)objc_msgSend(*(id *)(a1 + 40), "record");

}

uint64_t __59__MTStandardIDService_IDsForNamespaces_options_fromConfig___block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "IDInfoForNamespace:options:fromConfig:", a2, *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
}

- (void)dealloc
{
  __CFNotificationCenter *DarwinNotifyCenter;
  objc_super v4;

  -[MTStandardIDService flushPerfKitEvents](self, "flushPerfKitEvents");
  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterRemoveEveryObserver(DarwinNotifyCenter, self);
  v4.receiver = self;
  v4.super_class = (Class)MTStandardIDService;
  -[MTStandardIDService dealloc](&v4, sel_dealloc);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_defaultDSID, 0);
  objc_storeStrong((id *)&self->_secretStore, 0);
  objc_storeStrong((id *)&self->_accountChanged, 0);
  objc_storeStrong((id *)&self->_cache, 0);
  objc_storeStrong((id *)&self->_associatedObjects, 0);
  objc_storeStrong((id *)&self->_cachedConfig, 0);
  objc_storeStrong((id *)&self->_configDictPromise, 0);
  objc_storeStrong((id *)&self->_applicationBundleIdentifierOverrideForNetworkAttribution, 0);
  objc_storeStrong((id *)&self->_dsId, 0);
}

void __36__MTStandardIDService_configPromise__block_invoke(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  id v6;
  id v7;
  NSObject *v8;
  void *v9;
  MTIDConfig *v10;
  void *v11;
  MTIDConfig *v12;
  int v13;
  id v14;
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  v6 = a2;
  v7 = a4;
  if (v7)
  {
    MTMetricsKitOSLog();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      v13 = 138412290;
      v14 = v7;
      _os_log_impl(&dword_20D758000, v8, OS_LOG_TYPE_ERROR, "MetricsKit: Failed to retrieve metrics bag key value: %@", (uint8_t *)&v13, 0xCu);
    }

  }
  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("identifiers"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = [MTIDConfig alloc];
  if (v9)
    v11 = v9;
  else
    v11 = (void *)MEMORY[0x24BDBD1B8];
  v12 = -[MTIDConfig initWithDictionary:](v10, "initWithDictionary:", v11);
  if (v9)
    objc_msgSend(*(id *)(a1 + 32), "setConfig:", v12);
  objc_msgSend(*(id *)(a1 + 40), "finishWithResult:", v12);

}

- (void)setConfig:(id)a3
{
  MTStandardIDService *v4;
  id v5;

  v5 = a3;
  v4 = self;
  objc_sync_enter(v4);
  -[MTStandardIDService setCachedConfig:](v4, "setCachedConfig:", v5);
  objc_sync_exit(v4);

}

- (void)setCachedConfig:(id)a3
{
  objc_storeStrong((id *)&self->_cachedConfig, a3);
}

- (MTStandardIDService)init
{
  return -[MTStandardIDService initWithConfigDictionary:](self, "initWithConfigDictionary:", MEMORY[0x24BDBD1B8]);
}

- (MTStandardIDService)initWithConfigDictionary:(id)a3
{
  void *v4;
  MTStandardIDService *v5;

  +[MTPromise promiseWithResult:](MTPromise, "promiseWithResult:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = -[MTStandardIDService initWithConfigPromise:](self, "initWithConfigPromise:", v4);

  return v5;
}

- (MTStandardIDService)initWithConfigPromise:(id)a3
{
  return -[MTStandardIDService initWithConfigDictPromise:bag:](self, "initWithConfigDictPromise:bag:", a3, 0);
}

void __53__MTStandardIDService_initWithConfigDictPromise_bag___block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "handleAccountNotification");

}

void __34__MTStandardIDService_serialQueue__block_invoke()
{
  dispatch_queue_t v0;
  void *v1;

  v0 = dispatch_queue_create("MTStandardIDService.serialQueue", 0);
  v1 = (void *)serialQueue_serialQueue;
  serialQueue_serialQueue = (uint64_t)v0;

}

id __36__MTStandardIDService_configPromise__block_invoke_33(uint64_t a1, void *a2)
{
  id v3;
  MTIDConfig *v4;
  void *v5;

  v3 = a2;
  v4 = -[MTIDConfig initWithDictionary:]([MTIDConfig alloc], "initWithDictionary:", v3);

  objc_msgSend(*(id *)(a1 + 32), "setConfig:", v4);
  +[MTPromise promiseWithResult:](MTPromise, "promiseWithResult:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (void)handleAccountNotification
{
  void *v2;
  MTStandardIDService *obj;

  obj = self;
  objc_sync_enter(obj);
  -[MTStandardIDService cache](obj, "cache");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "removeAllNamespaces");

  -[MTStandardIDService setDefaultDSID:](obj, "setDefaultDSID:", 0);
  objc_sync_exit(obj);

}

- (void)handleRecordNotification
{
  void *v2;
  MTStandardIDService *obj;

  obj = self;
  objc_sync_enter(obj);
  -[MTStandardIDService cache](obj, "cache");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "removeUnsyncedNamespaces");

  objc_sync_exit(obj);
}

- (void)handleResetNotification:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  id v7;

  objc_msgSend(a3, "userInfo");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("namespaces"));
  v7 = (id)objc_claimAutoreleasedReturnValue();

  -[MTStandardIDService cache](self, "cache");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v7)
    objc_msgSend(v5, "removeNamespaces:", v7);
  else
    objc_msgSend(v5, "removeAllNamespaces");

}

- (void)handleApplicationStateChange:(id)a3
{
  MTStandardIDService *v4;
  void *v5;
  id v6;

  v6 = a3;
  v4 = self;
  objc_sync_enter(v4);
  -[MTStandardIDService cache](v4, "cache");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "removeAllNamespaces");

  objc_sync_exit(v4);
}

+ (void)setLocalCachePath:(id)a3
{
  id v3;
  id v4;

  v3 = a3;
  +[MTFrameworkEnvironment sharedEnvironment](MTFrameworkEnvironment, "sharedEnvironment");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setLocalDataPath:", v3);

}

+ (NSString)localCachePath
{
  void *v2;
  void *v3;

  +[MTFrameworkEnvironment sharedEnvironment](MTFrameworkEnvironment, "sharedEnvironment");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "localDataPath");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

- (void)IDFieldsForTopic:(id)a3 options:(id)a4 completion:(id)a5
{
  void *v8;
  id v9;

  v9 = a5;
  -[MTStandardIDService IDFieldsForTopic:options:](self, "IDFieldsForTopic:options:", a3, a4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v9)
    objc_msgSend(v8, "addFinishBlock:", v9);

}

- (void)resetIDForTopics:(id)a3 options:(id)a4 completion:(id)a5
{
  id v8;
  void *v9;
  _QWORD v10[4];
  id v11;

  v8 = a5;
  -[MTStandardIDService resetIDForTopics:options:](self, "resetIDForTopics:options:", a3, a4);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8)
  {
    v10[0] = MEMORY[0x24BDAC760];
    v10[1] = 3221225472;
    v10[2] = __59__MTStandardIDService_resetIDForTopics_options_completion___block_invoke;
    v10[3] = &unk_24C7A03F8;
    v11 = v8;
    objc_msgSend(v9, "addFinishBlock:", v10);

  }
}

uint64_t __59__MTStandardIDService_resetIDForTopics_options_completion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (id)resetIDForTopics:(id)a3 options:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  id v9;
  id v10;
  void *v11;
  _QWORD v13[4];
  id v14;
  MTStandardIDService *v15;
  id v16;

  v6 = a3;
  -[MTStandardIDService filledOptions:](self, "filledOptions:", a4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[MTStandardIDService configPromise](self, "configPromise");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v13[0] = MEMORY[0x24BDAC760];
  v13[1] = 3221225472;
  v13[2] = __48__MTStandardIDService_resetIDForTopics_options___block_invoke;
  v13[3] = &unk_24C7A04A0;
  v14 = v6;
  v15 = self;
  v16 = v7;
  v9 = v7;
  v10 = v6;
  objc_msgSend(v8, "thenWithBlock:", v13);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

id __48__MTStandardIDService_resetIDForTopics_options___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  id v19;
  _QWORD v21[4];
  id v22;
  uint64_t v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  _BYTE v28[128];
  uint64_t v29;

  v29 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  objc_msgSend(MEMORY[0x24BDBCEF0], "setWithCapacity:", 2 * objc_msgSend(*(id *)(a1 + 32), "count"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v24 = 0u;
  v25 = 0u;
  v26 = 0u;
  v27 = 0u;
  v5 = *(id *)(a1 + 32);
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v24, v28, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v25;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v25 != v8)
          objc_enumerationMutation(v5);
        v10 = *(_QWORD *)(*((_QWORD *)&v24 + 1) + 8 * i);
        objc_msgSend(v3, "namespaceForTopic:idType:", v10, 2);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        if (v11)
        {
          objc_msgSend(v3, "schemeForNamespace:", v11);
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v4, "addObject:", v12);

        }
        objc_msgSend(v3, "namespaceForTopic:idType:", v10, 1);
        v13 = (void *)objc_claimAutoreleasedReturnValue();

        if (v13)
        {
          objc_msgSend(v3, "schemeForNamespace:", v13);
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v4, "addObject:", v14);

        }
      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v24, v28, 16);
    }
    while (v7);
  }

  objc_msgSend(*(id *)(a1 + 40), "secretStore");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "allObjects");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "resetSchemes:options:", v16, *(_QWORD *)(a1 + 48));
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  v21[0] = MEMORY[0x24BDAC760];
  v21[1] = 3221225472;
  v21[2] = __48__MTStandardIDService_resetIDForTopics_options___block_invoke_2;
  v21[3] = &unk_24C7A04F0;
  v18 = *(_QWORD *)(a1 + 40);
  v22 = v4;
  v23 = v18;
  v19 = v4;
  objc_msgSend(v17, "addSuccessBlock:", v21);

  return v17;
}

void __48__MTStandardIDService_resetIDForTopics_options___block_invoke_2(uint64_t a1)
{
  id v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t i;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v2 = *(id *)(a1 + 32);
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v12;
    do
    {
      for (i = 0; i != v4; ++i)
      {
        if (*(_QWORD *)v12 != v5)
          objc_enumerationMutation(v2);
        v7 = *(void **)(*((_QWORD *)&v11 + 1) + 8 * i);
        objc_msgSend(v7, "idNamespace", (_QWORD)v11);
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        +[MTStandardIDService triggerInterprocessChangeNotifier:](MTStandardIDService, "triggerInterprocessChangeNotifier:", v8);

        objc_msgSend(*(id *)(a1 + 40), "cache");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "idNamespace");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "removeNamespace:", v10);

      }
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v4);
  }

}

- (void)queryIDForTopic:(id)a3 type:(int64_t)a4 options:(id)a5 completion:(id)a6
{
  id v10;
  id v11;

  v10 = a6;
  -[MTStandardIDService IDForTopic:type:options:](self, "IDForTopic:type:options:", a3, a4, a5);
  v11 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "addFinishBlock:", v10);

}

- (void)performMaintenanceWithCompletion:(id)a3
{
  void (**v4)(id, _QWORD);
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  double v9;
  NSObject *v10;
  void *v11;
  char v12;
  uint64_t v13;
  void *v14;
  _QWORD v15[4];
  void (**v16)(id, _QWORD);
  _QWORD v17[5];
  id v18;
  uint8_t buf[4];
  void *v20;
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
  v4 = (void (**)(id, _QWORD))a3;
  if (objc_msgSend((id)objc_opt_class(), "isTinkerPaired"))
  {
    objc_msgSend(MEMORY[0x24BDBCF50], "standardUserDefaults");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "valueForKey:", CFSTR("MTIDServiceLastMaintenanceDate"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    +[MTFrameworkEnvironment sharedEnvironment](MTFrameworkEnvironment, "sharedEnvironment");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "date");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_msgSend(v8, "timeIntervalSinceDate:", v6);
      if (v9 < 86400.0)
      {
        MTMetricsKitOSLog();
        v10 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 138412290;
          v20 = v6;
          _os_log_impl(&dword_20D758000, v10, OS_LOG_TYPE_INFO, "MetricsKit: Skipping ID service maintenance because the last performed maintenance was too recent at %@", buf, 0xCu);
        }

        v4[2](v4, 0);
        goto LABEL_13;
      }
    }
    objc_msgSend(v5, "setValue:forKey:", v8, CFSTR("MTIDServiceLastMaintenanceDate"));

  }
  -[MTStandardIDService filledOptions:](self, "filledOptions:", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[MTStandardIDService secretStore](self, "secretStore");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_opt_respondsToSelector();

  v13 = MEMORY[0x24BDAC760];
  if ((v12 & 1) != 0)
  {
    -[MTStandardIDService configPromise](self, "configPromise");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v17[0] = v13;
    v17[1] = 3221225472;
    v17[2] = __56__MTStandardIDService_performMaintenanceWithCompletion___block_invoke;
    v17[3] = &unk_24C7A0518;
    v17[4] = self;
    v18 = v5;
    objc_msgSend(v14, "thenWithBlock:", v17);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v4)
      goto LABEL_14;
    goto LABEL_12;
  }
  +[MTPromise promiseWithResult:](MTPromise, "promiseWithResult:", MEMORY[0x24BDBD1C8]);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
LABEL_12:
    v15[0] = v13;
    v15[1] = 3221225472;
    v15[2] = __56__MTStandardIDService_performMaintenanceWithCompletion___block_invoke_2;
    v15[3] = &unk_24C7A03F8;
    v16 = v4;
    objc_msgSend(v6, "addFinishBlock:", v15);
    v8 = v16;
LABEL_13:

  }
LABEL_14:

}

id __56__MTStandardIDService_performMaintenanceWithCompletion___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;

  v3 = *(void **)(a1 + 32);
  v4 = a2;
  objc_msgSend(v3, "secretStore");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "allKnownSchemes");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "maintainSchemes:options:", v6, *(_QWORD *)(a1 + 40));
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

uint64_t __56__MTStandardIDService_performMaintenanceWithCompletion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (id)sync
{
  return -[MTStandardIDService sync:](self, "sync:", 0);
}

- (id)sync:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  id v8;
  void *v9;
  _QWORD v11[4];
  id v12;
  MTStandardIDService *v13;
  id v14;

  v4 = a3;
  -[MTStandardIDService filledOptions:](self, "filledOptions:", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[MTStandardIDService configPromise](self, "configPromise");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = MEMORY[0x24BDAC760];
  v11[1] = 3221225472;
  v11[2] = __28__MTStandardIDService_sync___block_invoke;
  v11[3] = &unk_24C7A04A0;
  v12 = v4;
  v13 = self;
  v14 = v5;
  v7 = v5;
  v8 = v4;
  objc_msgSend(v6, "thenWithBlock:", v11);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

id __28__MTStandardIDService_sync___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  if (*(_QWORD *)(a1 + 32))
  {
    objc_msgSend(a2, "schemeForNamespace:");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDBCEB8], "arrayWithObjects:", v3, 0);
    v4 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    objc_msgSend(a2, "allKnownSchemes");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  objc_msgSend(*(id *)(a1 + 40), "secretStore");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "syncForSchemes:options:", v4, *(_QWORD *)(a1 + 48));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)IDForTopic:(id)a3 type:(int64_t)a4 options:(id)a5
{
  id v8;
  void *v9;
  void *v10;
  uint64_t v11;
  id v12;
  id v13;
  void *v14;
  id v15;
  id v16;
  _QWORD v18[4];
  id v19;
  id v20;
  _QWORD v21[4];
  id v22;
  MTStandardIDService *v23;
  id v24;
  int64_t v25;

  v8 = a3;
  -[MTStandardIDService filledOptions:](self, "filledOptions:", a5);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[MTStandardIDService configPromise](self, "configPromise");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = MEMORY[0x24BDAC760];
  v21[0] = MEMORY[0x24BDAC760];
  v21[1] = 3221225472;
  v21[2] = __47__MTStandardIDService_IDForTopic_type_options___block_invoke;
  v21[3] = &unk_24C7A0540;
  v12 = v8;
  v25 = a4;
  v22 = v12;
  v23 = self;
  v13 = v9;
  v24 = v13;
  objc_msgSend(v10, "thenWithBlock:", v21);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  v18[0] = v11;
  v18[1] = 3221225472;
  v18[2] = __47__MTStandardIDService_IDForTopic_type_options___block_invoke_2;
  v18[3] = &unk_24C7A0568;
  v19 = v12;
  v20 = v13;
  v15 = v13;
  v16 = v12;
  objc_msgSend(v14, "addFinishBlock:", v18);

  return v14;
}

id __47__MTStandardIDService_IDForTopic_type_options___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3;
  uint64_t v4;
  id v5;
  void *v6;
  void *v7;

  v3 = *(_QWORD *)(a1 + 32);
  v4 = *(_QWORD *)(a1 + 56);
  v5 = a2;
  objc_msgSend(v5, "namespaceForTopic:idType:", v3, v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "IDInfoForNamespace:options:fromConfig:", v6, *(_QWORD *)(a1 + 48), v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

void __47__MTStandardIDService_IDForTopic_type_options___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  int v11;
  void *v12;
  __int16 v13;
  uint64_t v14;
  __int16 v15;
  uint64_t v16;
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  v5 = a2;
  v6 = a3;
  MTMetricsKitOSLog();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
  {
    if (v5)
    {
      objc_msgSend(v5, "metricsFields");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v8 = v6;
    }
    v9 = *(_QWORD *)(a1 + 32);
    v10 = *(_QWORD *)(a1 + 40);
    v11 = 138412802;
    v12 = v8;
    v13 = 2112;
    v14 = v9;
    v15 = 2112;
    v16 = v10;
    _os_log_impl(&dword_20D758000, v7, OS_LOG_TYPE_DEBUG, "MetricsKit: Rendered ID fields: %@ for topic: %@ options: %@", (uint8_t *)&v11, 0x20u);
    if (v5)

  }
}

void __62__MTStandardIDService__IDInfoForNamespace_options_fromConfig___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  MTIDSecret *v3;

  v2 = a2;
  v3 = -[MTIDSecret initWithValue:effectiveDate:expirationDate:isSynchronize:]([MTIDSecret alloc], "initWithValue:effectiveDate:expirationDate:isSynchronize:", &stru_24C7A22D0, 0, 0, 0);
  objc_msgSend(v2, "finishWithResult:", v3);

}

id __62__MTStandardIDService__IDInfoForNamespace_options_fromConfig___block_invoke_91(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  NSObject *v6;
  void *v7;
  void *v8;
  int v9;
  MTIDInfo *v10;
  uint64_t v11;
  void *v12;
  MTIDInfo *v13;
  void *v14;
  int v16;
  void *v17;
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  if (objc_msgSend(v3, "count") != 2)
    __62__MTStandardIDService__IDInfoForNamespace_options_fromConfig___block_invoke_91_cold_1();
  objc_msgSend(v3, "objectAtIndexedSubscript:", 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectAtIndexedSubscript:", 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  MTMetricsKitOSLog();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    objc_msgSend(*(id *)(a1 + 32), "idNamespace");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = 138412290;
    v17 = v7;
    _os_log_impl(&dword_20D758000, v6, OS_LOG_TYPE_INFO, "MetricsKit: Secret promise and correlations promise for scheme %@ completed", (uint8_t *)&v16, 0xCu);

  }
  objc_msgSend(v4, "value");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "isEqual:", &stru_24C7A22D0);

  if (v9)
  {
    v10 = [MTIDInfo alloc];
    v11 = *(_QWORD *)(a1 + 32);
    objc_msgSend(v4, "value");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = -[MTIDInfo initWithScheme:secret:idString:dsId:effectiveDate:expirationDate:](v10, "initWithScheme:secret:idString:dsId:effectiveDate:expirationDate:", v11, v4, v12, *(_QWORD *)(a1 + 40), 0, 0);

  }
  else
  {
    objc_msgSend(*(id *)(a1 + 48), "generateIDInfo:secret:dsId:correlationIDs:", *(_QWORD *)(a1 + 32), v4, *(_QWORD *)(a1 + 40), v5);
    v13 = (MTIDInfo *)objc_claimAutoreleasedReturnValue();
  }
  +[MTPromise promiseWithResult:](MTPromise, "promiseWithResult:", v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  return v14;
}

- (id)secretValueForNamespace:(id)a3 options:(id)a4
{
  id v6;
  id v7;
  void *v8;
  uint64_t v9;
  id v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  _QWORD v16[5];
  id v17;
  _QWORD v18[4];
  id v19;

  v6 = a3;
  v7 = a4;
  -[MTStandardIDService configPromise](self, "configPromise");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = MEMORY[0x24BDAC760];
  v18[0] = MEMORY[0x24BDAC760];
  v18[1] = 3221225472;
  v18[2] = __55__MTStandardIDService_secretValueForNamespace_options___block_invoke;
  v18[3] = &unk_24C7A0678;
  v19 = v6;
  v10 = v6;
  objc_msgSend(v8, "thenWithBlock:", v18);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  v16[0] = v9;
  v16[1] = 3221225472;
  v16[2] = __55__MTStandardIDService_secretValueForNamespace_options___block_invoke_2;
  v16[3] = &unk_24C7A06A0;
  v16[4] = self;
  v17 = v7;
  v12 = v7;
  objc_msgSend(v11, "thenWithBlock:", v16);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "thenWithBlock:", &__block_literal_global_101);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  return v14;
}

id __55__MTStandardIDService_secretValueForNamespace_options___block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;

  objc_msgSend(a2, "schemeForNamespace:", *(_QWORD *)(a1 + 32));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  +[MTPromise promiseWithComposition:](MTPromise, "promiseWithComposition:", v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

id __55__MTStandardIDService_secretValueForNamespace_options___block_invoke_2(uint64_t a1, void *a2)
{
  void *v3;
  id v4;
  void *v5;
  void *v6;

  v3 = *(void **)(a1 + 32);
  v4 = a2;
  objc_msgSend(v3, "secretStore");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "secretForScheme:options:", v4, *(_QWORD *)(a1 + 40));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

id __55__MTStandardIDService_secretValueForNamespace_options___block_invoke_3(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;

  objc_msgSend(a2, "value");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  +[MTPromise promiseWithComposition:](MTPromise, "promiseWithComposition:", v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

void __58__MTStandardIDService_registerInterprocessChangeNotifier___block_invoke()
{
  uint64_t v0;
  void *v1;

  objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)registerInterprocessChangeNotifier__subscriptions;
  registerInterprocessChangeNotifier__subscriptions = v0;

}

void __58__MTStandardIDService_registerInterprocessChangeNotifier___block_invoke_2(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  uint64_t v5;
  const __CFString *v6;
  _QWORD v7[2];

  v7[1] = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = *(_QWORD *)(a1 + 32);
  v6 = CFSTR("namespaces");
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v5, 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = v3;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v7, &v6, 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "postNotificationName:object:userInfo:", CFSTR("MTIDNamespacesDidResetNotification"), 0, v4);

}

+ (void)triggerInterprocessChangeNotifier:(id)a3
{
  +[MTInterprocessChangeNotifier notify:](MTInterprocessChangeNotifier, "notify:", a3);
}

+ (id)writeDebugData:(id)a3 toFileWithNameFormat:(id)a4
{
  objc_class *v5;
  id v6;
  id v7;
  id v8;
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
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  id v23;
  NSObject *v24;
  id v25;
  id v27;
  uint8_t buf[4];
  void *v29;
  __int16 v30;
  id v31;
  uint64_t v32;

  v32 = *MEMORY[0x24BDAC8D0];
  v5 = (objc_class *)MEMORY[0x24BDD1500];
  v6 = a4;
  v7 = a3;
  v8 = objc_alloc_init(v5);
  objc_msgSend(v8, "setDateFormat:", CFSTR("yyyyMMddHHmmss"));
  v9 = (void *)MEMORY[0x24BDD17C8];
  +[MTFrameworkEnvironment sharedEnvironment](MTFrameworkEnvironment, "sharedEnvironment");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "hostProcessBundleIdentifier");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  +[MTFrameworkEnvironment sharedEnvironment](MTFrameworkEnvironment, "sharedEnvironment");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "date");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "stringFromDate:", v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "stringWithFormat:", v6, v11, v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  NSTemporaryDirectory();
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  +[MTFrameworkEnvironment sharedEnvironment](MTFrameworkEnvironment, "sharedEnvironment");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "metricsKitBundleIdentifier");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "stringByAppendingPathComponent:", v18);
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "createDirectoryAtPath:withIntermediateDirectories:attributes:error:", v19, 1, 0, 0);

  objc_msgSend(v19, "stringByAppendingPathComponent:", v15);
  v21 = (void *)objc_claimAutoreleasedReturnValue();

  v22 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCF08]), "initToFileAtPath:append:", v21, 0);
  objc_msgSend(v22, "open");
  v27 = 0;
  objc_msgSend(MEMORY[0x24BDD1608], "writeJSONObject:toStream:options:error:", v7, v22, 0, &v27);

  v23 = v27;
  objc_msgSend(v22, "close");
  if (v23)
  {
    MTMetricsKitOSLog();
    v24 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412546;
      v29 = v21;
      v30 = 2112;
      v31 = v23;
      _os_log_impl(&dword_20D758000, v24, OS_LOG_TYPE_ERROR, "MetricsKit: Failed to write to %@ error %@", buf, 0x16u);
    }

    v25 = 0;
  }
  else
  {
    v25 = v21;
  }

  return v25;
}

- (void)_clearLocalData
{
  void *v2;
  void *v3;
  NSObject *v4;
  uint8_t v5[16];

  -[MTStandardIDService secretStore](self, "secretStore");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "clearLocalData");

  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "postNotificationName:object:userInfo:", CFSTR("MTIDNamespacesDidResetNotification"), 0, 0);

  MTMetricsKitOSLog();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v5 = 0;
    _os_log_impl(&dword_20D758000, v4, OS_LOG_TYPE_INFO, "MetricsKit: ID service has cleared local cached data", v5, 2u);
  }

}

- (void)_resetIDs
{
  void *v3;
  id v4;
  void *v5;
  id v6;
  _QWORD v7[5];
  id v8;
  id location;

  objc_initWeak(&location, self);
  -[MTStandardIDService filledOptions:](self, "filledOptions:", 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_loadWeakRetained(&location);
  objc_msgSend(v4, "configPromise");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __32__MTStandardIDService__resetIDs__block_invoke;
  v7[3] = &unk_24C7A0770;
  v7[4] = self;
  v6 = v3;
  v8 = v6;
  objc_msgSend(v5, "addSuccessBlock:", v7);

  objc_destroyWeak(&location);
}

void __32__MTStandardIDService__resetIDs__block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  id v7;
  NSObject *v8;
  uint8_t v9[16];

  v3 = *(void **)(a1 + 32);
  v4 = a2;
  objc_msgSend(v3, "secretStore");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "allKnownSchemes");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = (id)objc_msgSend(v5, "resetSchemes:options:", v6, *(_QWORD *)(a1 + 40));
  MTMetricsKitOSLog();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v9 = 0;
    _os_log_impl(&dword_20D758000, v8, OS_LOG_TYPE_INFO, "MetricsKit: ID service has reset IDs in all namespaces", v9, 2u);
  }

}

- (void)_getSecrets
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  NSObject *v7;
  int v8;
  void *v9;
  uint64_t v10;

  v10 = *MEMORY[0x24BDAC8D0];
  -[MTStandardIDService secretStore](self, "secretStore");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    -[MTStandardIDService secretStore](self, "secretStore");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "debugInfo");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v5 = (void *)MEMORY[0x24BDBD1B8];
  }

  +[MTStandardIDService writeDebugData:toFileWithNameFormat:](MTStandardIDService, "writeDebugData:toFileWithNameFormat:", v5, CFSTR("MTIDSecrets-%@-%@.json"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    MTMetricsKitOSLog();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      v8 = 138412290;
      v9 = v6;
      _os_log_impl(&dword_20D758000, v7, OS_LOG_TYPE_INFO, "MetricsKit: ID service has written current secrets to %@", (uint8_t *)&v8, 0xCu);
    }

  }
}

- (void)_getIDs
{
  void *v3;
  id v4;
  void *v5;
  id v6;
  _QWORD v7[4];
  id v8;
  id v9;
  id location;

  objc_initWeak(&location, self);
  -[MTStandardIDService filledOptions:](self, "filledOptions:", 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_loadWeakRetained(&location);
  objc_msgSend(v4, "configPromise");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __30__MTStandardIDService__getIDs__block_invoke;
  v7[3] = &unk_24C7A07B8;
  objc_copyWeak(&v9, &location);
  v6 = v3;
  v8 = v6;
  objc_msgSend(v5, "addSuccessBlock:", v7);

  objc_destroyWeak(&v9);
  objc_destroyWeak(&location);
}

void __30__MTStandardIDService__getIDs__block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  void *v8;
  void *v9;
  void *v10;
  id WeakRetained;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  id obj;
  id v17;
  _QWORD v19[4];
  id v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  _BYTE v25[128];
  uint64_t v26;

  v26 = *MEMORY[0x24BDAC8D0];
  v17 = a2;
  objc_msgSend(v17, "allKnownSchemes");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBCEB8], "arrayWithCapacity:", objc_msgSend(v2, "count"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  v24 = 0u;
  obj = v2;
  v4 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v22;
    do
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v22 != v6)
          objc_enumerationMutation(obj);
        v8 = *(void **)(*((_QWORD *)&v21 + 1) + 8 * i);
        objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "dictionaryRepresentation");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "setObject:forKeyedSubscript:", v10, CFSTR("scheme"));

        WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
        objc_msgSend(v8, "idNamespace");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(WeakRetained, "IDInfoForNamespace:options:fromConfig:", v12, *(_QWORD *)(a1 + 32), v17);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "thenWithBlock:", &__block_literal_global_118);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "setObject:forKeyedSubscript:", v14, CFSTR("current"));

        objc_msgSend(v3, "addObject:", v9);
      }
      v5 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
    }
    while (v5);
  }

  +[MTPromise promiseWithComposition:](MTPromise, "promiseWithComposition:", v3);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v19[0] = MEMORY[0x24BDAC760];
  v19[1] = 3221225472;
  v19[2] = __30__MTStandardIDService__getIDs__block_invoke_3;
  v19[3] = &unk_24C7A00B8;
  v20 = *(id *)(a1 + 32);
  objc_msgSend(v15, "addFinishBlock:", v19);

}

id __30__MTStandardIDService__getIDs__block_invoke_2(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;

  objc_msgSend(a2, "debugInfo");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  +[MTPromise promiseWithResult:](MTPromise, "promiseWithResult:", v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

void __30__MTStandardIDService__getIDs__block_invoke_3(uint64_t a1, void *a2)
{
  void *v2;
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  NSObject *v8;
  int v9;
  void *v10;
  _QWORD v11[2];
  _QWORD v12[3];

  v12[2] = *MEMORY[0x24BDAC8D0];
  v11[0] = CFSTR("date");
  v2 = *(void **)(a1 + 32);
  v3 = a2;
  objc_msgSend(v2, "objectForKeyedSubscript:", CFSTR("date"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "description");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v11[1] = CFSTR("ids");
  v12[0] = v5;
  v12[1] = v3;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v12, v11, 2);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  +[MTStandardIDService writeDebugData:toFileWithNameFormat:](MTStandardIDService, "writeDebugData:toFileWithNameFormat:", v6, CFSTR("MTIDs-%@-%@.json"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    MTMetricsKitOSLog();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      v9 = 138412290;
      v10 = v7;
      _os_log_impl(&dword_20D758000, v8, OS_LOG_TYPE_INFO, "MetricsKit: ID service has written the current IDs to %@", (uint8_t *)&v9, 0xCu);
    }

  }
}

- (void)_getConfig
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  NSObject *v7;
  int v8;
  void *v9;
  uint64_t v10;

  v10 = *MEMORY[0x24BDAC8D0];
  -[MTStandardIDService configPromise](self, "configPromise");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "resultWithError:", 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v3, "dictionaryRepresentation");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    objc_msgSend(v3, "dictionaryRepresentation");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    +[MTStandardIDService writeDebugData:toFileWithNameFormat:](MTStandardIDService, "writeDebugData:toFileWithNameFormat:", v5, CFSTR("MTIDConfig-%@-%@.json"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (v6)
    {
      MTMetricsKitOSLog();
      v7 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
      {
        v8 = 138412290;
        v9 = v6;
        _os_log_impl(&dword_20D758000, v7, OS_LOG_TYPE_INFO, "MetricsKit: ID service has written current config to %@", (uint8_t *)&v8, 0xCu);
      }

    }
  }

}

+ (BOOL)isTinkerPaired
{
  return 0;
}

- (void)setDsId:(id)a3
{
  objc_storeStrong((id *)&self->_dsId, a3);
}

- (void)setApplicationBundleIdentifierOverrideForNetworkAttribution:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (MTPromise)configDictPromise
{
  return self->_configDictPromise;
}

- (MTInterprocessChangeNotifier)accountChanged
{
  return self->_accountChanged;
}

- (void)setDefaultDSID:(id)a3
{
  objc_storeStrong((id *)&self->_defaultDSID, a3);
}

void __62__MTStandardIDService__IDInfoForNamespace_options_fromConfig___block_invoke_91_cold_1()
{
  __assert_rtn("-[MTStandardIDService _IDInfoForNamespace:options:fromConfig:]_block_invoke", "MTStandardIDService.m", 726, "array.count == 2");
}

@end
