@implementation AMSMediaTaskURLBuilder

- (AMSMediaTaskURLBuilder)initWithConfig:(id)a3 clientVersion:(id)a4 bag:(id)a5
{
  id v9;
  id v10;
  id v11;
  AMSMediaTaskURLBuilder *v12;
  AMSMediaTaskURLBuilder *v13;
  uint64_t v14;
  NSString *logKey;
  objc_super v17;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v17.receiver = self;
  v17.super_class = (Class)AMSMediaTaskURLBuilder;
  v12 = -[AMSMediaTaskURLBuilder init](&v17, sel_init);
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_config, a3);
    objc_storeStrong((id *)&v13->_clientVersion, a4);
    objc_storeStrong((id *)&v13->_bag, a5);
    AMSGenerateLogCorrelationKey();
    v14 = objc_claimAutoreleasedReturnValue();
    logKey = v13->_logKey;
    v13->_logKey = (NSString *)v14;

  }
  return v13;
}

- (id)build
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  _QWORD v11[5];
  _QWORD v12[4];

  v12[3] = *MEMORY[0x1E0C80C00];
  -[AMSMediaTaskURLBuilder _verifyConfiguration](self, "_verifyConfiguration");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    +[AMSPromise promiseWithError:](AMSPromise, "promiseWithError:", v3);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    -[AMSMediaTaskURLBuilder _hostPromise](self, "_hostPromise");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[AMSMediaTaskURLBuilder _languagePromiseForType](self, "_languagePromiseForType");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[AMSMediaTaskURLBuilder _pathPromise](self, "_pathPromise");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v12[0] = v5;
    v12[1] = v6;
    v12[2] = v7;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v12, 3);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    +[AMSPromise promiseWithAll:](AMSPromise, "promiseWithAll:", v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    v11[0] = MEMORY[0x1E0C809B0];
    v11[1] = 3221225472;
    v11[2] = __31__AMSMediaTaskURLBuilder_build__block_invoke;
    v11[3] = &unk_1E253D638;
    v11[4] = self;
    objc_msgSend(v9, "thenWithBlock:", v11);
    v4 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v4;
}

id __31__AMSMediaTaskURLBuilder_build__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;

  v3 = a2;
  objc_msgSend(v3, "objectAtIndexedSubscript:", 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectAtIndexedSubscript:", 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectAtIndexedSubscript:", 2);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(*(id *)(a1 + 32), "_queryItemsWithLanguage:", v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_alloc_init(MEMORY[0x1E0CB3998]);
  objc_msgSend(v4, "absoluteString");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setHost:", v9);

  objc_msgSend(v8, "setPath:", v6);
  objc_msgSend(v8, "setQueryItems:", v7);
  objc_msgSend(v8, "setScheme:", CFSTR("https"));
  objc_msgSend(*(id *)(a1 + 32), "_addBundleIdentifiers:", v8);
  objc_msgSend(*(id *)(a1 + 32), "_addCharts:", v8);
  objc_msgSend(*(id *)(a1 + 32), "_addItemIdentifiers:", v8);
  objc_msgSend(*(id *)(a1 + 32), "_addSearchTerm:", v8);
  +[AMSPromise promiseWithResult:](AMSPromise, "promiseWithResult:", v8);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

- (id)_verifyConfiguration
{
  void *v3;
  uint64_t v4;
  _BOOL4 v5;
  _BOOL4 v6;
  uint64_t v7;
  _BOOL8 v8;
  void *v9;
  uint64_t v10;
  _BOOL8 v11;
  void *v12;
  unint64_t v13;
  void *v14;
  void *v15;
  __CFString *v16;
  void *v17;
  char v18;
  void *v19;
  uint64_t v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v26;
  uint64_t v27;

  -[AMSMediaTaskURLBuilder bundleIdentifiers](self, "bundleIdentifiers");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "count");

  v5 = -[AMSMediaTaskURLBuilder charts](self, "charts");
  v6 = 1;
  if (v4)
    v7 = 2;
  else
    v7 = 1;
  if (v5)
    v8 = v7;
  else
    v8 = v4 != 0;
  -[AMSMediaTaskURLBuilder itemIdentifiers](self, "itemIdentifiers");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "count");

  if (v10)
    v11 = v8 + 1;
  else
    v11 = v8;
  -[AMSMediaTaskURLBuilder searchTerm](self, "searchTerm");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (v12)
    v13 = v11 + 1;
  else
    v13 = v11;
  -[AMSMediaTaskURLBuilder config](self, "config");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v14, "type") != 3)
  {
    -[AMSMediaTaskURLBuilder config](self, "config");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v15, "type") == 4;

  }
  if (!v6 || !v13)
  {
    if (v13)
      v18 = 1;
    else
      v18 = v6;
    if ((v18 & 1) != 0)
    {
      if (v13 >= 2)
      {
        v16 = CFSTR("Bundle identifiers, charts, item identifiers, or search term cannot be set on the same request.");
        goto LABEL_18;
      }
    }
    else
    {
      -[AMSMediaTaskURLBuilder filters](self, "filters");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = objc_msgSend(v19, "count");

      if (!v20)
      {
        v16 = CFSTR("Bundle identifiers, charts, filters, item identifiers, or search term must be specified.");
        goto LABEL_18;
      }
    }
    -[AMSMediaTaskURLBuilder bundleIdentifiers](self, "bundleIdentifiers");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v21, "count"))
    {
      -[AMSMediaTaskURLBuilder config](self, "config");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v22, "type"))
      {
        -[AMSMediaTaskURLBuilder config](self, "config");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v23, "type") != 7)
        {
          -[AMSMediaTaskURLBuilder config](self, "config");
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          if (objc_msgSend(v24, "type") != 1)
          {
            -[AMSMediaTaskURLBuilder config](self, "config");
            v26 = (void *)objc_claimAutoreleasedReturnValue();
            v27 = objc_msgSend(v26, "type");

            if (v27 != 2)
            {
              v16 = CFSTR("Bundle identifiers only availble for AMSMediaTaskTypeApp, AMSMediaTaskTypeAppBundle, and AMSMediaTaskTypeInApp.");
              goto LABEL_18;
            }
LABEL_34:
            v17 = 0;
            return v17;
          }

        }
      }

    }
    goto LABEL_34;
  }
  v16 = CFSTR("Bundle identifiers, charts, item identifiers and search term cannot be set on AMSMediaTaskTypeArcadeApp or AMSMediaTaskTypeAppRecommendation request");
LABEL_18:
  AMSError(404, CFSTR("Invalid media task configuration"), v16, 0);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  return v17;
}

- (id)_hostPromise
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  -[AMSMediaTaskURLBuilder config](self, "config");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "hostBagKey");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  -[AMSMediaTaskURLBuilder bag](self, "bag");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "URLForKey:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "valuePromise");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (id)_languagePromise
{
  void *v3;
  void *v4;
  char v5;
  AMSMutablePromise *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  AMSMutablePromise *v11;
  AMSMutablePromise *v12;
  AMSMutablePromise *v13;
  AMSMutablePromise *v14;
  _QWORD v16[5];
  AMSMutablePromise *v17;
  _QWORD v18[4];
  AMSMutablePromise *v19;

  +[AMSProcessInfo currentProcess](AMSProcessInfo, "currentProcess");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "bundleIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "isEqualToString:", CFSTR("com.apple.appstorecomponentsd"));

  if ((v5 & 1) != 0)
  {
    v6 = objc_alloc_init(AMSMutablePromise);
    -[AMSMediaTaskURLBuilder bag](self, "bag");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "stringForKey:", 0x1E254CA00);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "valuePromise");
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    v10 = MEMORY[0x1E0C809B0];
    v18[0] = MEMORY[0x1E0C809B0];
    v18[1] = 3221225472;
    v18[2] = __42__AMSMediaTaskURLBuilder__languagePromise__block_invoke;
    v18[3] = &unk_1E2542FE8;
    v11 = v6;
    v19 = v11;
    objc_msgSend(v9, "addSuccessBlock:", v18);
    v16[0] = v10;
    v16[1] = 3221225472;
    v16[2] = __42__AMSMediaTaskURLBuilder__languagePromise__block_invoke_2;
    v16[3] = &unk_1E253D950;
    v16[4] = self;
    v12 = v11;
    v17 = v12;
    objc_msgSend(v9, "addErrorBlock:", v16);
    v13 = v17;
    v14 = v12;

  }
  else
  {
    +[AMSDevice language](AMSDevice, "language");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    +[AMSPromise promiseWithResult:](AMSPromise, "promiseWithResult:", v9);
    v14 = (AMSMutablePromise *)objc_claimAutoreleasedReturnValue();
  }

  return v14;
}

uint64_t __42__AMSMediaTaskURLBuilder__languagePromise__block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "finishWithResult:", a2);
}

void __42__AMSMediaTaskURLBuilder__languagePromise__block_invoke_2(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  uint64_t v5;
  _QWORD v6[4];
  id v7;
  _QWORD v8[4];
  id v9;

  objc_msgSend(*(id *)(a1 + 32), "bag");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "stringForKey:", 0x1E254CB20);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "valuePromise");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  v5 = MEMORY[0x1E0C809B0];
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __42__AMSMediaTaskURLBuilder__languagePromise__block_invoke_3;
  v8[3] = &unk_1E2542FE8;
  v9 = *(id *)(a1 + 40);
  objc_msgSend(v4, "addSuccessBlock:", v8);
  v6[0] = v5;
  v6[1] = 3221225472;
  v6[2] = __42__AMSMediaTaskURLBuilder__languagePromise__block_invoke_4;
  v6[3] = &unk_1E253E120;
  v7 = *(id *)(a1 + 40);
  objc_msgSend(v4, "addErrorBlock:", v6);

}

uint64_t __42__AMSMediaTaskURLBuilder__languagePromise__block_invoke_3(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "finishWithResult:", a2);
}

void __42__AMSMediaTaskURLBuilder__languagePromise__block_invoke_4(uint64_t a1)
{
  void *v1;
  id v2;

  v1 = *(void **)(a1 + 32);
  +[AMSDevice language](AMSDevice, "language");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "finishWithResult:", v2);

}

- (id)_languagePromiseAppDistribution
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  -[AMSMediaTaskURLBuilder bag](self, "bag");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "stringForKey:", 0x1E254CB40);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "valuePromise");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "continueWithBlock:", &__block_literal_global_77);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

id __57__AMSMediaTaskURLBuilder__languagePromiseAppDistribution__block_invoke(uint64_t a1, uint64_t a2)
{
  void *v2;
  void *v3;

  if (a2)
  {
    +[AMSPromise promiseWithResult:](AMSPromise, "promiseWithResult:", a2);
    v2 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    +[AMSDevice language](AMSDevice, "language");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    +[AMSPromise promiseWithResult:](AMSPromise, "promiseWithResult:", v3);
    v2 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v2;
}

- (id)_languagePromiseForType
{
  void *v3;
  uint64_t v4;

  -[AMSMediaTaskURLBuilder config](self, "config");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "type");

  if (v4 == 7)
    -[AMSMediaTaskURLBuilder _languagePromiseAppDistribution](self, "_languagePromiseAppDistribution");
  else
    -[AMSMediaTaskURLBuilder _languagePromise](self, "_languagePromise");
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)_pathPromise
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  _QWORD v8[5];

  -[AMSMediaTaskURLBuilder bag](self, "bag");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringForKey:", 0x1E254C520);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "valuePromise");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __38__AMSMediaTaskURLBuilder__pathPromise__block_invoke;
  v8[3] = &unk_1E253D750;
  v8[4] = self;
  objc_msgSend(v5, "thenWithBlock:", v8);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

id __38__AMSMediaTaskURLBuilder__pathPromise__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  __CFString *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  _BYTE v33[128];
  _QWORD v34[2];
  _QWORD v35[2];
  _QWORD v36[2];
  _QWORD v37[5];

  v37[3] = *MEMORY[0x1E0C80C00];
  v3 = a2;
  if ((objc_msgSend(*(id *)(a1 + 32), "charts") & 1) != 0)
  {
    v4 = CFSTR("charts");
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "searchTerm");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    if (v5)
    {
      v4 = CFSTR("search");
    }
    else
    {
      objc_msgSend(*(id *)(a1 + 32), "config");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "typeString");
      v4 = (__CFString *)objc_claimAutoreleasedReturnValue();

    }
  }
  objc_msgSend(CFSTR("/v{clientVersion}/{realm}/{storefront}/"), "stringByAppendingString:", v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "config");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "type");

  if (v9 == 7)
  {
    objc_msgSend(CFSTR("/v{clientVersion}/{realm}/"), "stringByAppendingString:", v4);
    v10 = objc_claimAutoreleasedReturnValue();

    v7 = (void *)v10;
  }
  v36[0] = CFSTR("{clientVersion}");
  objc_msgSend(*(id *)(a1 + 32), "clientVersion");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v36[1] = v11;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v36, 2);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v37[0] = v12;
  v35[0] = CFSTR("{realm}");
  objc_msgSend(*(id *)(a1 + 32), "config");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "realm");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v35[1] = v14;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v35, 2);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v37[1] = v15;
  v34[0] = CFSTR("{storefront}");
  v34[1] = v3;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v34, 2);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v37[2] = v16;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v37, 3);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  v31 = 0u;
  v32 = 0u;
  v29 = 0u;
  v30 = 0u;
  v18 = v17;
  v19 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v29, v33, 16);
  if (v19)
  {
    v20 = v19;
    v21 = *(_QWORD *)v30;
    do
    {
      v22 = 0;
      v23 = v7;
      do
      {
        if (*(_QWORD *)v30 != v21)
          objc_enumerationMutation(v18);
        v24 = *(void **)(*((_QWORD *)&v29 + 1) + 8 * v22);
        objc_msgSend(v24, "objectAtIndexedSubscript:", 0, (_QWORD)v29);
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v24, "objectAtIndexedSubscript:", 1);
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v23, "stringByReplacingOccurrencesOfString:withString:", v25, v26);
        v7 = (void *)objc_claimAutoreleasedReturnValue();

        ++v22;
        v23 = v7;
      }
      while (v20 != v22);
      v20 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v29, v33, 16);
    }
    while (v20);
  }

  +[AMSPromise promiseWithResult:](AMSPromise, "promiseWithResult:", v7);
  v27 = (void *)objc_claimAutoreleasedReturnValue();

  return v27;
}

- (id)_queryItemsWithLanguage:(id)a3
{
  id v4;
  id v5;
  void *v6;
  void *v7;
  int v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  __CFString *v18;
  void *v19;
  void *v20;
  void *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t i;
  uint64_t v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t j;
  uint64_t v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v43;
  id obj;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  _BYTE v53[128];
  _BYTE v54[128];
  uint64_t v55;

  v55 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v43 = v4;
  objc_msgSend(MEMORY[0x1E0CB39D8], "queryItemWithName:value:", CFSTR("l"), v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "addObject:", v6);

  -[AMSMediaTaskURLBuilder config](self, "config");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "includePlatform");

  if (v8)
  {
    -[AMSMediaTaskURLBuilder _devicePlatform](self, "_devicePlatform");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (v9)
    {
      objc_msgSend(MEMORY[0x1E0CB39D8], "queryItemWithName:value:", CFSTR("platform"), v9);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "addObject:", v10);

    }
    -[AMSMediaTaskURLBuilder additionalPlatforms](self, "additionalPlatforms");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "componentsJoinedByString:", CFSTR(","));
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    if (v12)
    {
      objc_msgSend(MEMORY[0x1E0CB39D8], "queryItemWithName:value:", CFSTR("additionalPlatforms"), v12);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "addObject:", v13);

    }
  }
  -[AMSMediaTaskURLBuilder includedResultKeys](self, "includedResultKeys");
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  if (v14)
  {
    if (-[AMSMediaTaskURLBuilder charts](self, "charts")
      || (-[AMSMediaTaskURLBuilder searchTerm](self, "searchTerm"),
          v15 = (void *)objc_claimAutoreleasedReturnValue(),
          v15,
          v15))
    {
      -[AMSMediaTaskURLBuilder config](self, "config");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "typeString");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(CFSTR("include[{type}]"), "stringByReplacingOccurrencesOfString:withString:", CFSTR("{type}"), v17);
      v18 = (__CFString *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      v18 = CFSTR("include");
    }
    -[AMSMediaTaskURLBuilder includedResultKeys](self, "includedResultKeys");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "componentsJoinedByString:", CFSTR(","));
    v20 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0CB39D8], "queryItemWithName:value:", v18, v20);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "addObject:", v21);

  }
  v51 = 0u;
  v52 = 0u;
  v49 = 0u;
  v50 = 0u;
  -[AMSMediaTaskURLBuilder filters](self, "filters");
  obj = (id)objc_claimAutoreleasedReturnValue();
  v22 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v49, v54, 16);
  if (v22)
  {
    v23 = v22;
    v24 = *(_QWORD *)v50;
    do
    {
      for (i = 0; i != v23; ++i)
      {
        if (*(_QWORD *)v50 != v24)
          objc_enumerationMutation(obj);
        v26 = *(_QWORD *)(*((_QWORD *)&v49 + 1) + 8 * i);
        objc_msgSend(CFSTR("filter[{filter}]"), "stringByReplacingOccurrencesOfString:withString:", CFSTR("{filter}"), v26);
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        -[AMSMediaTaskURLBuilder filters](self, "filters");
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v28, "objectForKeyedSubscript:", v26);
        v29 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(MEMORY[0x1E0CB39D8], "queryItemWithName:value:", v27, v29);
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "addObject:", v30);

      }
      v23 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v49, v54, 16);
    }
    while (v23);
  }

  v47 = 0u;
  v48 = 0u;
  v45 = 0u;
  v46 = 0u;
  -[AMSMediaTaskURLBuilder additionalQueryParams](self, "additionalQueryParams");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  v32 = objc_msgSend(v31, "countByEnumeratingWithState:objects:count:", &v45, v53, 16);
  if (v32)
  {
    v33 = v32;
    v34 = *(_QWORD *)v46;
    do
    {
      for (j = 0; j != v33; ++j)
      {
        if (*(_QWORD *)v46 != v34)
          objc_enumerationMutation(v31);
        v36 = *(_QWORD *)(*((_QWORD *)&v45 + 1) + 8 * j);
        v37 = (void *)MEMORY[0x1E0CB39D8];
        -[AMSMediaTaskURLBuilder additionalQueryParams](self, "additionalQueryParams");
        v38 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v38, "objectForKeyedSubscript:", v36);
        v39 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v37, "queryItemWithName:value:", v36, v39);
        v40 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "addObject:", v40);

      }
      v33 = objc_msgSend(v31, "countByEnumeratingWithState:objects:count:", &v45, v53, 16);
    }
    while (v33);
  }

  objc_msgSend(v5, "sortedArrayUsingComparator:", &__block_literal_global_64);
  v41 = (void *)objc_claimAutoreleasedReturnValue();

  return v41;
}

uint64_t __50__AMSMediaTaskURLBuilder__queryItemsWithLanguage___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;

  v4 = a3;
  objc_msgSend(a2, "name");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "name");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = objc_msgSend(v5, "compare:", v6);
  return v7;
}

- (void)_addBundleIdentifiers:(id)a3
{
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;

  v13 = a3;
  -[AMSMediaTaskURLBuilder bundleIdentifiers](self, "bundleIdentifiers");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "count");

  if (v5)
  {
    -[AMSMediaTaskURLBuilder bundleIdentifiers](self, "bundleIdentifiers");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "sortedArrayUsingSelector:", sel_compare_);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v7, "componentsJoinedByString:", CFSTR(","));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(CFSTR("filter[{filter}]"), "stringByReplacingOccurrencesOfString:withString:", CFSTR("{filter}"), CFSTR("bundleId"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB39D8], "queryItemWithName:value:", v9, v8);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "queryItems");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "arrayByAddingObject:", v10);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setQueryItems:", v12);

  }
}

- (void)_addCharts:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  v10 = a3;
  if (-[AMSMediaTaskURLBuilder charts](self, "charts"))
  {
    v4 = (void *)MEMORY[0x1E0CB39D8];
    -[AMSMediaTaskURLBuilder config](self, "config");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "typeString");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "queryItemWithName:value:", CFSTR("types"), v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v10, "queryItems");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "arrayByAddingObject:", v7);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setQueryItems:", v9);

  }
}

- (void)_addItemIdentifiers:(id)a3
{
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  unint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;

  v15 = a3;
  -[AMSMediaTaskURLBuilder itemIdentifiers](self, "itemIdentifiers");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "count");

  -[AMSMediaTaskURLBuilder itemIdentifiers](self, "itemIdentifiers");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (v5 == 1)
  {
    objc_msgSend(v6, "firstObject");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v15, "path");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "stringByAppendingPathComponent:", v8);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "setPath:", v10);
LABEL_5:

    goto LABEL_6;
  }
  v11 = objc_msgSend(v6, "count");

  if (v11 >= 2)
  {
    -[AMSMediaTaskURLBuilder itemIdentifiers](self, "itemIdentifiers");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "sortedArrayUsingSelector:", sel_compare_);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v8, "componentsJoinedByString:", CFSTR(","));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB39D8], "queryItemWithName:value:", CFSTR("ids"), v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "queryItems");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "arrayByAddingObject:", v10);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "setQueryItems:", v14);

    goto LABEL_5;
  }
LABEL_6:

}

- (void)_addSearchTerm:(id)a3
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
  void *v14;
  void *v15;
  _QWORD v16[3];

  v16[2] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[AMSMediaTaskURLBuilder searchTerm](self, "searchTerm");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    v6 = (void *)MEMORY[0x1E0CB39D8];
    -[AMSMediaTaskURLBuilder searchTerm](self, "searchTerm");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "queryItemWithName:value:", CFSTR("term"), v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    v9 = (void *)MEMORY[0x1E0CB39D8];
    -[AMSMediaTaskURLBuilder config](self, "config");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "typeString");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "queryItemWithName:value:", CFSTR("types"), v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v4, "queryItems");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v16[0] = v8;
    v16[1] = v12;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v16, 2);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "arrayByAddingObjectsFromArray:", v14);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setQueryItems:", v15);

  }
}

- (id)_devicePlatform
{
  __CFString **v3;
  void *v5;
  NSObject *v6;
  void *v7;
  id v8;
  void *v9;
  int v10;
  void *v11;
  __int16 v12;
  void *v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  if (+[AMSDevice deviceIsAppleTV](AMSDevice, "deviceIsAppleTV"))
  {
    v3 = AMSMediaTaskPlatformAppleTV;
    return *v3;
  }
  if (+[AMSDevice deviceIsAppleWatch](AMSDevice, "deviceIsAppleWatch"))
  {
    v3 = AMSMediaTaskPlatformAppleWatch;
    return *v3;
  }
  if (+[AMSDevice deviceIsAudioAccessory](AMSDevice, "deviceIsAudioAccessory"))
  {
    v3 = AMSMediaTaskPlatformHomePod;
    return *v3;
  }
  if (+[AMSDevice deviceIsiPad](AMSDevice, "deviceIsiPad"))
  {
LABEL_8:
    v3 = AMSMediaTaskPlatformiPad;
    return *v3;
  }
  if (+[AMSDevice deviceIsiPhone](AMSDevice, "deviceIsiPhone")
    || +[AMSDevice deviceIsiPod](AMSDevice, "deviceIsiPod"))
  {
    v3 = AMSMediaTaskPlatformiPhone;
    return *v3;
  }
  if (+[AMSDevice deviceIsMac](AMSDevice, "deviceIsMac"))
  {
    v3 = AMSMediaTaskPlatformMac;
    return *v3;
  }
  if (+[AMSDevice deviceIsRealityDevice](AMSDevice, "deviceIsRealityDevice"))
  {
    if (_os_feature_enabled_impl())
    {
      v3 = &AMSMediaTaskPlatformReality;
      return *v3;
    }
    goto LABEL_8;
  }
  +[AMSLogConfig sharedMediaConfig](AMSLogConfig, "sharedMediaConfig");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v5)
  {
    +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  objc_msgSend(v5, "OSLogObject");
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
  {
    v7 = (void *)objc_opt_class();
    v8 = v7;
    -[AMSMediaTaskURLBuilder logKey](self, "logKey");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = 138543618;
    v11 = v7;
    v12 = 2114;
    v13 = v9;
    _os_log_impl(&dword_18C849000, v6, OS_LOG_TYPE_ERROR, "%{public}@: [%{public}@] Unknown device platform", (uint8_t *)&v10, 0x16u);

  }
  return 0;
}

- (NSArray)additionalPlatforms
{
  return self->_additionalPlatforms;
}

- (void)setAdditionalPlatforms:(id)a3
{
  objc_storeStrong((id *)&self->_additionalPlatforms, a3);
}

- (NSDictionary)additionalQueryParams
{
  return self->_additionalQueryParams;
}

- (void)setAdditionalQueryParams:(id)a3
{
  objc_storeStrong((id *)&self->_additionalQueryParams, a3);
}

- (AMSBagProtocol)bag
{
  return self->_bag;
}

- (NSArray)bundleIdentifiers
{
  return self->_bundleIdentifiers;
}

- (void)setBundleIdentifiers:(id)a3
{
  objc_storeStrong((id *)&self->_bundleIdentifiers, a3);
}

- (BOOL)charts
{
  return self->_charts;
}

- (void)setCharts:(BOOL)a3
{
  self->_charts = a3;
}

- (NSString)clientVersion
{
  return self->_clientVersion;
}

- (AMSMediaTaskTypeConfig)config
{
  return self->_config;
}

- (NSDictionary)filters
{
  return self->_filters;
}

- (void)setFilters:(id)a3
{
  objc_storeStrong((id *)&self->_filters, a3);
}

- (NSArray)includedResultKeys
{
  return self->_includedResultKeys;
}

- (void)setIncludedResultKeys:(id)a3
{
  objc_storeStrong((id *)&self->_includedResultKeys, a3);
}

- (NSArray)itemIdentifiers
{
  return self->_itemIdentifiers;
}

- (void)setItemIdentifiers:(id)a3
{
  objc_storeStrong((id *)&self->_itemIdentifiers, a3);
}

- (NSString)logKey
{
  return self->_logKey;
}

- (void)setLogKey:(id)a3
{
  objc_storeStrong((id *)&self->_logKey, a3);
}

- (NSString)searchTerm
{
  return self->_searchTerm;
}

- (void)setSearchTerm:(id)a3
{
  objc_storeStrong((id *)&self->_searchTerm, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_searchTerm, 0);
  objc_storeStrong((id *)&self->_logKey, 0);
  objc_storeStrong((id *)&self->_itemIdentifiers, 0);
  objc_storeStrong((id *)&self->_includedResultKeys, 0);
  objc_storeStrong((id *)&self->_filters, 0);
  objc_storeStrong((id *)&self->_config, 0);
  objc_storeStrong((id *)&self->_clientVersion, 0);
  objc_storeStrong((id *)&self->_bundleIdentifiers, 0);
  objc_storeStrong((id *)&self->_bag, 0);
  objc_storeStrong((id *)&self->_additionalQueryParams, 0);
  objc_storeStrong((id *)&self->_additionalPlatforms, 0);
}

@end
