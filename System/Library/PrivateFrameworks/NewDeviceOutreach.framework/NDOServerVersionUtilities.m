@implementation NDOServerVersionUtilities

+ (void)_dictionaryFromURL:(id)a3 shouldRetry:(BOOL)a4 withCompletion:(id)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  id v12;
  id v13;
  void *v14;
  _QWORD v15[4];
  id v16;
  id v17;
  _QWORD *v18;
  id v19;
  BOOL v20;
  _QWORD v21[5];
  id v22;

  v8 = a3;
  v9 = a5;
  v21[0] = 0;
  v21[1] = v21;
  v21[2] = 0x3032000000;
  v21[3] = __Block_byref_object_copy__2;
  v21[4] = __Block_byref_object_dispose__2;
  v22 = 0;
  if (a4)
  {
    objc_msgSend(MEMORY[0x24BDD1850], "sharedSession");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDD1858], "defaultSessionConfiguration");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setRequestCachePolicy:", 1);
    objc_msgSend(MEMORY[0x24BDD1850], "sessionWithConfiguration:", v11);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

  }
  v15[0] = MEMORY[0x24BDAC760];
  v15[1] = 3221225472;
  v15[2] = __75__NDOServerVersionUtilities__dictionaryFromURL_shouldRetry_withCompletion___block_invoke;
  v15[3] = &unk_24F81DB88;
  v18 = v21;
  v12 = v8;
  v16 = v12;
  v13 = v9;
  v20 = a4;
  v17 = v13;
  v19 = a1;
  objc_msgSend(v10, "dataTaskWithURL:completionHandler:", v12, v15);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "resume");

  _Block_object_dispose(v21, 8);
}

void __75__NDOServerVersionUtilities__dictionaryFromURL_shouldRetry_withCompletion___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  id v6;
  uint64_t v7;
  id v8;
  uint64_t v9;
  void *v10;
  NSObject *v11;
  void (*v12)(void);
  NSObject *v13;
  NSObject *v14;
  NSObject *v15;
  id v16;

  v6 = a4;
  if (a2)
  {
    v16 = 0;
    objc_msgSend(MEMORY[0x24BDD1770], "propertyListWithData:options:format:error:", a2, 0, 0, &v16);
    v7 = objc_claimAutoreleasedReturnValue();
    v8 = v16;
    v9 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
    v10 = *(void **)(v9 + 40);
    *(_QWORD *)(v9 + 40) = v7;

    if (v8)
    {
      _NDOLogSystem();
      v11 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
        __75__NDOServerVersionUtilities__dictionaryFromURL_shouldRetry_withCompletion___block_invoke_cold_4();

    }
    else
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0 && *(_BYTE *)(a1 + 64))
      {
        _NDOLogSystem();
        v14 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
          __75__NDOServerVersionUtilities__dictionaryFromURL_shouldRetry_withCompletion___block_invoke_cold_3();

        objc_msgSend(*(id *)(a1 + 56), "_dictionaryFromURL:shouldRetry:withCompletion:", *(_QWORD *)(a1 + 32), 0, *(_QWORD *)(a1 + 40));
        goto LABEL_19;
      }
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0 || *(_BYTE *)(a1 + 64))
      {
        v12 = *(void (**)(void))(*(_QWORD *)(a1 + 40) + 16);
        goto LABEL_18;
      }
      _NDOLogSystem();
      v15 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
        __75__NDOServerVersionUtilities__dictionaryFromURL_shouldRetry_withCompletion___block_invoke_cold_2();

    }
    v12 = *(void (**)(void))(*(_QWORD *)(a1 + 40) + 16);
LABEL_18:
    v12();
LABEL_19:

    goto LABEL_20;
  }
  _NDOLogSystem();
  v13 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    __75__NDOServerVersionUtilities__dictionaryFromURL_shouldRetry_withCompletion___block_invoke_cold_1();

  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
LABEL_20:

}

+ (void)_supportedVersionsForClientAndServer:(unint64_t)a3 withCompletion:(id)a4
{
  id v6;
  void *v7;
  NSObject *v8;
  uint64_t v9;
  id v10;
  void (**v11)(_QWORD, _QWORD);
  NSObject *v12;
  unint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  _QWORD *v20;
  NSObject *v21;
  unint64_t v22;
  void *v23;
  void *v24;
  uint64_t v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  uint64_t v30;
  void *v31;
  void *v32;
  id v33;
  uint64_t v34;
  id v35;
  NSObject *v36;
  unint64_t v37;
  void *v38;
  void *v39;
  void *v40;
  _QWORD v41[6];
  _QWORD v42[5];
  void (**v43)(_QWORD, _QWORD);
  uint64_t *v44;
  _QWORD v45[4];
  id v46;
  uint64_t *v47;
  _QWORD *v48;
  uint64_t v49;
  id *v50;
  uint64_t v51;
  uint64_t (*v52)(uint64_t, uint64_t);
  void (*v53)(uint64_t);
  id v54;
  _QWORD v55[5];
  id v56;
  _QWORD v57[2];
  _QWORD v58[2];
  uint8_t buf[4];
  unint64_t v60;
  uint64_t v61;

  v61 = *MEMORY[0x24BDAC8D0];
  v6 = a4;
  v55[0] = 0;
  v55[1] = v55;
  v55[2] = 0x3032000000;
  v55[3] = __Block_byref_object_copy__2;
  v55[4] = __Block_byref_object_dispose__2;
  v56 = 0;
  v49 = 0;
  v50 = (id *)&v49;
  v51 = 0x3032000000;
  v52 = __Block_byref_object_copy__2;
  v53 = __Block_byref_object_dispose__2;
  objc_msgSend(MEMORY[0x24BDBCF50], "standardUserDefaults");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "objectForKey:", CFSTR("ServerVersionOverride"));
  v54 = (id)objc_claimAutoreleasedReturnValue();

  _NDOLogSystem();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134217984;
    v60 = a3;
    _os_log_impl(&dword_22D064000, v8, OS_LOG_TYPE_DEFAULT, " Server lookup policy:%ld", buf, 0xCu);
  }

  v9 = MEMORY[0x24BDAC760];
  v45[0] = MEMORY[0x24BDAC760];
  v45[1] = 3221225472;
  v45[2] = __81__NDOServerVersionUtilities__supportedVersionsForClientAndServer_withCompletion___block_invoke;
  v45[3] = &unk_24F81DBB0;
  v47 = &v49;
  v10 = v6;
  v46 = v10;
  v48 = v55;
  v11 = (void (**)(_QWORD, _QWORD))MEMORY[0x22E30C314](v45);
  if (!v50[5])
  {
    +[NDOServerVersionUtilities getValidServerVersionCache](NDOServerVersionUtilities, "getValidServerVersionCache");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    if (a3 == 1)
    {
      objc_storeStrong(v50 + 5, v15);
      if (v50[5])
      {
        _NDOLogSystem();
        v21 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
        {
          v22 = (unint64_t)v50[5];
          *(_DWORD *)buf = 138412290;
          v60 = v22;
          _os_log_impl(&dword_22D064000, v21, OS_LOG_TYPE_DEFAULT, "Using Cached Server version: %@", buf, 0xCu);
        }
      }
      else
      {
        v23 = (void *)MEMORY[0x24BDD16E0];
        objc_msgSend(MEMORY[0x24BDBCF50], "standardUserDefaults");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v23, "numberWithInteger:", objc_msgSend(v24, "integerForKey:", CFSTR("LowServerVersion")));
        v25 = objc_claimAutoreleasedReturnValue();
        v26 = (void *)v25;
        v27 = &unk_24F8247E8;
        if (v25)
          v27 = (void *)v25;
        v21 = v27;

        v28 = (void *)MEMORY[0x24BDD16E0];
        objc_msgSend(MEMORY[0x24BDBCF50], "standardUserDefaults");
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v28, "numberWithInteger:", objc_msgSend(v29, "integerForKey:", CFSTR("HighServerVersion")));
        v30 = objc_claimAutoreleasedReturnValue();
        v31 = (void *)v30;
        v32 = &unk_24F824800;
        if (v30)
          v32 = (void *)v30;
        v33 = v32;

        v57[0] = CFSTR("LowServerVersion");
        v57[1] = CFSTR("HighServerVersion");
        v58[0] = v21;
        v58[1] = v33;
        objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v58, v57, 2);
        v34 = objc_claimAutoreleasedReturnValue();
        v35 = v50[5];
        v50[5] = (id)v34;

        _NDOLogSystem();
        v36 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v36, OS_LOG_TYPE_DEFAULT))
        {
          v37 = (unint64_t)v50[5];
          *(_DWORD *)buf = 138412290;
          v60 = v37;
          _os_log_impl(&dword_22D064000, v36, OS_LOG_TYPE_DEFAULT, "Using Client version: %@", buf, 0xCu);
        }

      }
      ((void (**)(_QWORD, id))v11)[2](v11, v50[5]);
      goto LABEL_25;
    }
    if (a3 == 2)
    {
      v16 = (void *)MEMORY[0x24BDBCF48];
      objc_msgSend(MEMORY[0x24BDBCF50], "standardUserDefaults");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "objectForKey:", CFSTR("ServerVersionURL"));
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "URLWithString:", v18);
      v19 = (void *)objc_claimAutoreleasedReturnValue();

      v42[0] = v9;
      v42[1] = 3221225472;
      v42[2] = __81__NDOServerVersionUtilities__supportedVersionsForClientAndServer_withCompletion___block_invoke_19;
      v42[3] = &unk_24F81DBD8;
      v44 = &v49;
      v20 = v42;
      v42[4] = v15;
      v43 = v11;
      objc_msgSend(a1, "_dictionaryFromURL:shouldRetry:withCompletion:", v19, 1, v42);

    }
    else
    {
      if (v50[5] || (objc_storeStrong(v50 + 5, v15), v50[5]))
      {
        ((void (*)(void (**)(_QWORD, _QWORD)))v11[2])(v11);
        goto LABEL_25;
      }
      v38 = (void *)MEMORY[0x24BDBCF48];
      objc_msgSend(MEMORY[0x24BDBCF50], "standardUserDefaults");
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v39, "objectForKey:", CFSTR("ServerVersionURL"));
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v38, "URLWithString:", v40);
      v19 = (void *)objc_claimAutoreleasedReturnValue();

      v41[0] = v9;
      v41[1] = 3221225472;
      v41[2] = __81__NDOServerVersionUtilities__supportedVersionsForClientAndServer_withCompletion___block_invoke_22;
      v41[3] = &unk_24F81DA68;
      v41[5] = &v49;
      v20 = v41;
      v41[4] = v11;
      objc_msgSend(a1, "_dictionaryFromURL:shouldRetry:withCompletion:", v19, 1, v41);
    }

LABEL_25:
    goto LABEL_26;
  }
  _NDOLogSystem();
  v12 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    v13 = (unint64_t)v50[5];
    *(_DWORD *)buf = 138412290;
    v60 = v13;
    _os_log_impl(&dword_22D064000, v12, OS_LOG_TYPE_DEFAULT, "Using Overridden Server version  %@", buf, 0xCu);
  }

  objc_msgSend(MEMORY[0x24BDBCF50], "standardUserDefaults");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setObject:forKey:", v50[5], CFSTR("ServerVersionCache"));

  ((void (**)(_QWORD, id))v11)[2](v11, v50[5]);
LABEL_26:

  _Block_object_dispose(&v49, 8);
  _Block_object_dispose(v55, 8);

}

void __81__NDOServerVersionUtilities__supportedVersionsForClientAndServer_withCompletion___block_invoke(_QWORD *a1, void *a2)
{
  id v4;
  NSObject *v5;
  void *v6;
  void *v7;
  id v8;
  NSObject *v9;
  void *v10;
  void *v11;
  id v12;
  NSObject *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  uint64_t v22;
  uint64_t v23;
  void *v24;
  NSObject *v25;
  void *v26;
  void *v27;
  void *v28;
  uint64_t v29;
  void *v30;
  void *v31;
  id v32;
  void *v33;
  void *v34;
  uint64_t v35;
  void *v36;
  void *v37;
  id v38;
  NSObject *v39;
  void *v40;
  NSObject *v41;
  NSObject *v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint8_t buf[4];
  void *v51;
  uint64_t v52;

  v52 = *MEMORY[0x24BDAC8D0];
  v4 = a2;
  objc_storeStrong((id *)(*(_QWORD *)(a1[5] + 8) + 40), a2);
  _NDOLogSystem();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v6 = *(void **)(*(_QWORD *)(a1[5] + 8) + 40);
    *(_DWORD *)buf = 138412290;
    v51 = v6;
    _os_log_impl(&dword_22D064000, v5, OS_LOG_TYPE_DEFAULT, "Server version  %@", buf, 0xCu);
  }

  if (!*(_QWORD *)(*(_QWORD *)(a1[5] + 8) + 40))
  {
    _NDOLogSystem();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      __81__NDOServerVersionUtilities__supportedVersionsForClientAndServer_withCompletion___block_invoke_cold_1();
    goto LABEL_11;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    _NDOLogSystem();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      __81__NDOServerVersionUtilities__supportedVersionsForClientAndServer_withCompletion___block_invoke_cold_4();
LABEL_11:

    (*(void (**)(void))(a1[4] + 16))();
    goto LABEL_36;
  }
  objc_msgSend(*(id *)(*(_QWORD *)(a1[5] + 8) + 40), "objectForKey:", CFSTR("LowServerVersion"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if ((_NSIsNSString() & 1) != 0)
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", objc_msgSend(v7, "integerValue"));
    v8 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v8 = v7;
  }
  v10 = v8;
  if (!v8)
  {
    _NDOLogSystem();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      __81__NDOServerVersionUtilities__supportedVersionsForClientAndServer_withCompletion___block_invoke_cold_2(v13, v14, v15, v16, v17, v18, v19, v20);

    (*(void (**)(void))(a1[4] + 16))();
    goto LABEL_32;
  }
  objc_msgSend(*(id *)(*(_QWORD *)(a1[5] + 8) + 40), "objectForKey:", CFSTR("HighServerVersion"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if ((_NSIsNSString() & 1) != 0)
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", objc_msgSend(v11, "integerValue"));
    v12 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v12 = v11;
  }
  v21 = v12;
  if (v12)
  {
    objc_msgSend(MEMORY[0x24BDBCF20], "setWithObjects:", v10, v12, 0);
    v22 = objc_claimAutoreleasedReturnValue();
    v23 = *(_QWORD *)(a1[6] + 8);
    v24 = *(void **)(v23 + 40);
    *(_QWORD *)(v23 + 40) = v22;

    _NDOLogSystem();
    v25 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
    {
      v26 = *(void **)(*(_QWORD *)(a1[6] + 8) + 40);
      *(_DWORD *)buf = 138412290;
      v51 = v26;
      _os_log_impl(&dword_22D064000, v25, OS_LOG_TYPE_DEFAULT, "Server versions '%@'", buf, 0xCu);
    }

    v27 = (void *)MEMORY[0x24BDD16E0];
    objc_msgSend(MEMORY[0x24BDBCF50], "standardUserDefaults");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "numberWithInteger:", objc_msgSend(v28, "integerForKey:", CFSTR("LowServerVersion")));
    v29 = objc_claimAutoreleasedReturnValue();
    v30 = (void *)v29;
    v31 = &unk_24F8247E8;
    if (v29)
      v31 = (void *)v29;
    v32 = v31;

    v33 = (void *)MEMORY[0x24BDD16E0];
    objc_msgSend(MEMORY[0x24BDBCF50], "standardUserDefaults");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v33, "numberWithInteger:", objc_msgSend(v34, "integerForKey:", CFSTR("HighServerVersion")));
    v35 = objc_claimAutoreleasedReturnValue();
    v36 = (void *)v35;
    v37 = &unk_24F824800;
    if (v35)
      v37 = (void *)v35;
    v38 = v37;

    objc_msgSend(MEMORY[0x24BDBCF20], "setWithObjects:", v32, v38, 0);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    _NDOLogSystem();
    v39 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v39, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v51 = v7;
      _os_log_impl(&dword_22D064000, v39, OS_LOG_TYPE_DEFAULT, "Client versions '%@'", buf, 0xCu);
    }

    v40 = (void *)objc_msgSend(v7, "mutableCopy");
    objc_msgSend(v40, "intersectSet:", *(_QWORD *)(*(_QWORD *)(a1[6] + 8) + 40));
    _NDOLogSystem();
    v41 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v41, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v51 = v40;
      _os_log_impl(&dword_22D064000, v41, OS_LOG_TYPE_DEFAULT, "clientAndServerSet '%@'", buf, 0xCu);
    }

    (*(void (**)(void))(a1[4] + 16))();
LABEL_32:

    goto LABEL_36;
  }
  _NDOLogSystem();
  v42 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v42, OS_LOG_TYPE_ERROR))
    __81__NDOServerVersionUtilities__supportedVersionsForClientAndServer_withCompletion___block_invoke_cold_3(v42, v43, v44, v45, v46, v47, v48, v49);

  (*(void (**)(void))(a1[4] + 16))();
LABEL_36:

}

void __81__NDOServerVersionUtilities__supportedVersionsForClientAndServer_withCompletion___block_invoke_19(uint64_t a1, void *a2)
{
  id v4;
  uint64_t v5;
  id *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  id v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  NSObject *v23;
  uint64_t v24;
  void *v25;
  NSObject *v26;
  uint64_t v27;
  int v28;
  uint64_t v29;
  _QWORD v30[2];
  _QWORD v31[3];

  v31[2] = *MEMORY[0x24BDAC8D0];
  v4 = a2;
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), a2);
  v5 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v7 = *(_QWORD *)(v5 + 40);
  v6 = (id *)(v5 + 40);
  if (!v7)
  {
    objc_storeStrong(v6, *(id *)(a1 + 32));
    if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40))
    {
      v8 = (void *)MEMORY[0x24BDD16E0];
      objc_msgSend(MEMORY[0x24BDBCF50], "standardUserDefaults");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "numberWithInteger:", objc_msgSend(v9, "integerForKey:", CFSTR("LowServerVersion")));
      v10 = objc_claimAutoreleasedReturnValue();
      v11 = (void *)v10;
      v12 = &unk_24F8247E8;
      if (v10)
        v12 = (void *)v10;
      v13 = v12;

      v14 = (void *)MEMORY[0x24BDD16E0];
      objc_msgSend(MEMORY[0x24BDBCF50], "standardUserDefaults");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "numberWithInteger:", objc_msgSend(v15, "integerForKey:", CFSTR("HighServerVersion")));
      v16 = objc_claimAutoreleasedReturnValue();
      v17 = (void *)v16;
      v18 = &unk_24F824800;
      if (v16)
        v18 = (void *)v16;
      v19 = v18;

      v30[0] = CFSTR("LowServerVersion");
      v30[1] = CFSTR("HighServerVersion");
      v31[0] = v13;
      v31[1] = v19;
      objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v31, v30, 2);
      v20 = objc_claimAutoreleasedReturnValue();
      v21 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
      v22 = *(void **)(v21 + 40);
      *(_QWORD *)(v21 + 40) = v20;

      _NDOLogSystem();
      v23 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
      {
        v24 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40);
        v28 = 138412290;
        v29 = v24;
        _os_log_impl(&dword_22D064000, v23, OS_LOG_TYPE_DEFAULT, "Using Client version: %@", (uint8_t *)&v28, 0xCu);
      }

    }
  }
  objc_msgSend(MEMORY[0x24BDBCF50], "standardUserDefaults");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "setObject:forKey:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), CFSTR("ServerVersionCache"));

  _NDOLogSystem();
  v26 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
  {
    v27 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40);
    v28 = 138412290;
    v29 = v27;
    _os_log_impl(&dword_22D064000, v26, OS_LOG_TYPE_DEFAULT, "Caching Server version  %@", (uint8_t *)&v28, 0xCu);
  }

  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

void __81__NDOServerVersionUtilities__supportedVersionsForClientAndServer_withCompletion___block_invoke_22(uint64_t a1, void *a2)
{
  id v4;
  void *v5;
  NSObject *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  id v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  NSObject *v22;
  uint64_t v23;
  int v24;
  uint64_t v25;
  _QWORD v26[2];
  _QWORD v27[3];

  v27[2] = *MEMORY[0x24BDAC8D0];
  v4 = a2;
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), a2);
  if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40))
  {
    objc_msgSend(MEMORY[0x24BDBCF50], "standardUserDefaults");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setObject:forKey:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), CFSTR("ServerVersionCache"));

    _NDOLogSystem();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      v7 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40);
      v24 = 138412290;
      v25 = v7;
      _os_log_impl(&dword_22D064000, v6, OS_LOG_TYPE_DEFAULT, "Caching Server version  %@", (uint8_t *)&v24, 0xCu);
    }
  }
  else
  {
    v8 = (void *)MEMORY[0x24BDD16E0];
    objc_msgSend(MEMORY[0x24BDBCF50], "standardUserDefaults");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "numberWithInteger:", objc_msgSend(v9, "integerForKey:", CFSTR("LowServerVersion")));
    v10 = objc_claimAutoreleasedReturnValue();
    v11 = (void *)v10;
    v12 = &unk_24F8247E8;
    if (v10)
      v12 = (void *)v10;
    v6 = v12;

    v13 = (void *)MEMORY[0x24BDD16E0];
    objc_msgSend(MEMORY[0x24BDBCF50], "standardUserDefaults");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "numberWithInteger:", objc_msgSend(v14, "integerForKey:", CFSTR("HighServerVersion")));
    v15 = objc_claimAutoreleasedReturnValue();
    v16 = (void *)v15;
    v17 = &unk_24F824800;
    if (v15)
      v17 = (void *)v15;
    v18 = v17;

    v26[0] = CFSTR("LowServerVersion");
    v26[1] = CFSTR("HighServerVersion");
    v27[0] = v6;
    v27[1] = v18;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v27, v26, 2);
    v19 = objc_claimAutoreleasedReturnValue();
    v20 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
    v21 = *(void **)(v20 + 40);
    *(_QWORD *)(v20 + 40) = v19;

    _NDOLogSystem();
    v22 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
    {
      v23 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40);
      v24 = 138412290;
      v25 = v23;
      _os_log_impl(&dword_22D064000, v22, OS_LOG_TYPE_DEFAULT, "Using Client version: %@", (uint8_t *)&v24, 0xCu);
    }

  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

}

+ (id)getValidServerVersionCache
{
  void *v2;
  void *v3;
  id v4;
  NSObject *v5;
  void *v6;

  objc_msgSend(MEMORY[0x24BDBCF50], "standardUserDefaults");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKey:", CFSTR("ServerVersionCache"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    _NDOLogSystem();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      +[NDOServerVersionUtilities getValidServerVersionCache].cold.1();

    objc_msgSend(MEMORY[0x24BDBCF50], "standardUserDefaults");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "removeObjectForKey:", CFSTR("ServerVersionCache"));

    v4 = 0;
  }
  else
  {
    v4 = v3;
  }

  return v4;
}

+ (void)serverVersionSupported:(id)a3
{
  id v4;
  id v5;
  _QWORD v6[4];
  id v7;

  v4 = a3;
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __52__NDOServerVersionUtilities_serverVersionSupported___block_invoke;
  v6[3] = &unk_24F81DC00;
  v7 = v4;
  v5 = v4;
  objc_msgSend(a1, "_supportedVersionsForClientAndServer:withCompletion:", 2, v6);

}

void __52__NDOServerVersionUtilities_serverVersionSupported___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  int v5;
  id v6;
  uint64_t v7;

  v7 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  if (objc_msgSend(v3, "count"))
  {
    _NDOLogSystem();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      v5 = 138412290;
      v6 = v3;
      _os_log_impl(&dword_22D064000, v4, OS_LOG_TYPE_DEFAULT, "Server version supported by client version - '%@'", (uint8_t *)&v5, 0xCu);
    }

  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

}

+ (void)isHighServerVersionFeaturesetEnabled:(unint64_t)a3 withCompletion:(id)a4
{
  id v6;
  id v7;
  _QWORD v8[4];
  id v9;

  v6 = a4;
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __81__NDOServerVersionUtilities_isHighServerVersionFeaturesetEnabled_withCompletion___block_invoke;
  v8[3] = &unk_24F81DC00;
  v9 = v6;
  v7 = v6;
  objc_msgSend(a1, "_supportedVersionsForClientAndServer:withCompletion:", a3, v8);

}

void __81__NDOServerVersionUtilities_isHighServerVersionFeaturesetEnabled_withCompletion___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  int v7;
  NSObject *v8;
  const __CFString *v9;
  int v10;
  const __CFString *v11;
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  if (objc_msgSend(v3, "count"))
  {
    v4 = (void *)MEMORY[0x24BDD16E0];
    objc_msgSend(MEMORY[0x24BDBCF50], "standardUserDefaults");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "numberWithInteger:", objc_msgSend(v5, "integerForKey:", CFSTR("HighServerVersion")));
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    v7 = objc_msgSend(v3, "containsObject:", v6);
  }
  else
  {
    v7 = 0;
  }
  _NDOLogSystem();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    v9 = CFSTR("NO");
    if (v7)
      v9 = CFSTR("YES");
    v10 = 138412290;
    v11 = v9;
    _os_log_impl(&dword_22D064000, v8, OS_LOG_TYPE_DEFAULT, "High Server version supported - %@", (uint8_t *)&v10, 0xCu);
  }

  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

+ (void)isHighServerVersionFeaturesetEnabled:(id)a3
{
  id v4;
  id v5;
  _QWORD v6[4];
  id v7;

  v4 = a3;
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __66__NDOServerVersionUtilities_isHighServerVersionFeaturesetEnabled___block_invoke;
  v6[3] = &unk_24F81D920;
  v7 = v4;
  v5 = v4;
  objc_msgSend(a1, "isHighServerVersionFeaturesetEnabled:withCompletion:", 0, v6);

}

uint64_t __66__NDOServerVersionUtilities_isHighServerVersionFeaturesetEnabled___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

+ (BOOL)isHighServerVersionFeaturesetEnabled
{
  void *v2;
  void *v3;
  void *v4;
  int v5;
  NSObject *v6;
  const __CFString *v7;
  _QWORD v9[5];
  uint64_t v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t (*v13)(uint64_t, uint64_t);
  void (*v14)(uint64_t);
  id v15;
  uint8_t buf[4];
  const __CFString *v17;
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  v10 = 0;
  v11 = &v10;
  v12 = 0x3032000000;
  v13 = __Block_byref_object_copy__2;
  v14 = __Block_byref_object_dispose__2;
  v15 = 0;
  v9[0] = MEMORY[0x24BDAC760];
  v9[1] = 3221225472;
  v9[2] = __65__NDOServerVersionUtilities_isHighServerVersionFeaturesetEnabled__block_invoke;
  v9[3] = &unk_24F81DC28;
  v9[4] = &v10;
  objc_msgSend(a1, "_supportedVersionsForClientAndServer:withCompletion:", 1, v9);
  if (objc_msgSend((id)v11[5], "count"))
  {
    v2 = (void *)MEMORY[0x24BDD16E0];
    objc_msgSend(MEMORY[0x24BDBCF50], "standardUserDefaults");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "numberWithInteger:", objc_msgSend(v3, "integerForKey:", CFSTR("HighServerVersion")));
    v4 = (void *)objc_claimAutoreleasedReturnValue();

    v5 = objc_msgSend((id)v11[5], "containsObject:", v4);
  }
  else
  {
    v5 = 0;
  }
  _NDOLogSystem();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v7 = CFSTR("NO");
    if (v5)
      v7 = CFSTR("YES");
    *(_DWORD *)buf = 138412290;
    v17 = v7;
    _os_log_impl(&dword_22D064000, v6, OS_LOG_TYPE_DEFAULT, "High Server version supported - %@", buf, 0xCu);
  }

  _Block_object_dispose(&v10, 8);
  return v5;
}

void __65__NDOServerVersionUtilities_isHighServerVersionFeaturesetEnabled__block_invoke(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
}

+ (id)readWebURLOverride
{
  NSObject *v2;
  void *v3;
  void *v4;
  int v6;
  const char *v7;
  uint64_t v8;

  v8 = *MEMORY[0x24BDAC8D0];
  _NDOLogSystem();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    v6 = 136315138;
    v7 = "+[NDOServerVersionUtilities readWebURLOverride]";
    _os_log_impl(&dword_22D064000, v2, OS_LOG_TYPE_DEFAULT, "%s", (uint8_t *)&v6, 0xCu);
  }

  objc_msgSend(MEMORY[0x24BDBCF50], "standardUserDefaults");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectForKey:", CFSTR("WebFlowURL"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

+ (id)readULWebURLOverride
{
  NSObject *v2;
  void *v3;
  void *v4;
  int v6;
  const char *v7;
  uint64_t v8;

  v8 = *MEMORY[0x24BDAC8D0];
  _NDOLogSystem();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    v6 = 136315138;
    v7 = "+[NDOServerVersionUtilities readULWebURLOverride]";
    _os_log_impl(&dword_22D064000, v2, OS_LOG_TYPE_DEFAULT, "%s", (uint8_t *)&v6, 0xCu);
  }

  objc_msgSend(MEMORY[0x24BDBCF50], "standardUserDefaults");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectForKey:", CFSTR("ULWebFlowURL"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

+ (id)readAPSSupportedOverride
{
  NSObject *v2;
  void *v3;
  void *v4;
  NSObject *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  int v14;
  const char *v15;
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  _NDOLogSystem();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    v14 = 136315138;
    v15 = "+[NDOServerVersionUtilities readAPSSupportedOverride]";
    _os_log_impl(&dword_22D064000, v2, OS_LOG_TYPE_DEFAULT, "%s", (uint8_t *)&v14, 0xCu);
  }

  objc_msgSend(MEMORY[0x24BDBCF50], "standardUserDefaults");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectForKey:", CFSTR("isAPSSupported"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v4)
  {
    _NDOLogSystem();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
      +[NDOServerVersionUtilities readAPSSupportedOverride].cold.1(v5, v6, v7, v8, v9, v10, v11, v12);

  }
  return v4;
}

+ (void)getDecodedParamsForPath:(id)a3 withCompletion:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  void *v17;
  NSObject *v18;
  NSObject *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  uint64_t v24;
  id v25;
  NSObject *v26;
  NSObject *v27;
  _QWORD block[4];
  id v29;
  id v30;
  _QWORD *v31;
  _QWORD v32[4];
  id v33;
  id v34;
  NSObject *v35;
  _QWORD *v36;
  _QWORD v37[5];
  id v38;
  uint8_t buf[4];
  const char *v40;
  __int16 v41;
  id v42;
  uint64_t v43;

  v43 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  _NDOLogSystem();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
    +[NDOServerVersionUtilities getDecodedParamsForPath:withCompletion:].cold.1(v8, v9, v10, v11, v12, v13, v14, v15);

  v37[0] = 0;
  v37[1] = v37;
  v37[2] = 0x3032000000;
  v37[3] = __Block_byref_object_copy__2;
  v37[4] = __Block_byref_object_dispose__2;
  v38 = 0;
  objc_msgSend(MEMORY[0x24BDBCF50], "standardUserDefaults");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "stringForKey:", CFSTR("UniversalLinkEncodedParams"));
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  v18 = dispatch_group_create();
  if (v6 && objc_msgSend(v6, "length") || v17)
  {
    dispatch_group_enter(v18);
    v20 = (void *)MEMORY[0x24BDBCF48];
    objc_msgSend(MEMORY[0x24BDBCF50], "standardUserDefaults");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "objectForKey:", CFSTR("ServerVersionURL"));
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "URLWithString:", v22);
    v23 = (void *)objc_claimAutoreleasedReturnValue();

    v24 = MEMORY[0x24BDAC760];
    v32[0] = MEMORY[0x24BDAC760];
    v32[1] = 3221225472;
    v32[2] = __68__NDOServerVersionUtilities_getDecodedParamsForPath_withCompletion___block_invoke;
    v32[3] = &unk_24F81DC50;
    v33 = v17;
    v25 = v6;
    v34 = v25;
    v36 = v37;
    v26 = v18;
    v35 = v26;
    objc_msgSend(a1, "_dictionaryFromURL:shouldRetry:withCompletion:", v23, 1, v32);
    dispatch_get_global_queue(21, 0);
    v27 = objc_claimAutoreleasedReturnValue();
    block[0] = v24;
    block[1] = 3221225472;
    block[2] = __68__NDOServerVersionUtilities_getDecodedParamsForPath_withCompletion___block_invoke_2;
    block[3] = &unk_24F81DC78;
    v31 = v37;
    v30 = v7;
    v29 = v25;
    dispatch_group_notify(v26, v27, block);

  }
  else
  {
    _NDOLogSystem();
    v19 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136446466;
      v40 = "+[NDOServerVersionUtilities getDecodedParamsForPath:withCompletion:]";
      v41 = 2114;
      v42 = v6;
      _os_log_impl(&dword_22D064000, v19, OS_LOG_TYPE_DEFAULT, "%{public}s: No valid params found for: %{public}@", buf, 0x16u);
    }

    (*((void (**)(id, _QWORD))v7 + 2))(v7, 0);
  }

  _Block_object_dispose(v37, 8);
}

void __68__NDOServerVersionUtilities_getDecodedParamsForPath_withCompletion___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  id v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  id v9;

  objc_msgSend(a2, "objectForKey:", CFSTR("ulmapping"));
  v9 = (id)objc_claimAutoreleasedReturnValue();
  if (v9)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v3 = *(void **)(a1 + 32);
      if (!v3)
      {
        objc_msgSend(v9, "objectForKey:", *(_QWORD *)(a1 + 40));
        v4 = (id)objc_claimAutoreleasedReturnValue();
        if (!v4)
        {
LABEL_10:

          goto LABEL_11;
        }
LABEL_8:
        if (objc_msgSend(v4, "length"))
        {
          v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCE50]), "initWithBase64EncodedString:options:", v4, 0);
          v6 = objc_msgSend(objc_alloc(MEMORY[0x24BDD17C8]), "initWithData:encoding:", v5, 4);
          v7 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
          v8 = *(void **)(v7 + 40);
          *(_QWORD *)(v7 + 40) = v6;

        }
        goto LABEL_10;
      }
LABEL_7:
      v4 = v3;
      goto LABEL_8;
    }
  }
  v3 = *(void **)(a1 + 32);
  if (v3)
    goto LABEL_7;
LABEL_11:
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 48));

}

uint64_t __68__NDOServerVersionUtilities_getDecodedParamsForPath_withCompletion___block_invoke_2(uint64_t a1)
{
  void *v2;
  NSObject *v4;

  v2 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40);
  if (v2 && objc_msgSend(v2, "length"))
    return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  _NDOLogSystem();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    __68__NDOServerVersionUtilities_getDecodedParamsForPath_withCompletion___block_invoke_2_cold_1();

  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

+ (id)clientConfig
{
  void *v2;
  void *v3;

  objc_msgSend(a1, "getValidServerVersionCache");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
    goto LABEL_4;
  objc_msgSend(v2, "objectForKey:", CFSTR("clientConfig"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {

LABEL_4:
    v3 = 0;
  }

  return v3;
}

void __75__NDOServerVersionUtilities__dictionaryFromURL_shouldRetry_withCompletion___block_invoke_cold_1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_6_0(*MEMORY[0x24BDAC8D0]);
  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_2_0(&dword_22D064000, v0, v1, "Failed to fetch plist data from URL '%@' with error: %@");
  OUTLINED_FUNCTION_2();
}

void __75__NDOServerVersionUtilities__dictionaryFromURL_shouldRetry_withCompletion___block_invoke_cold_2()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_6_0(*MEMORY[0x24BDAC8D0]);
  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_2_0(&dword_22D064000, v0, v1, "Incorrect format in response detected from URL '%@'. Response: %@. Aborting without retry.");
  OUTLINED_FUNCTION_2();
}

void __75__NDOServerVersionUtilities__dictionaryFromURL_shouldRetry_withCompletion___block_invoke_cold_3()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_1(&dword_22D064000, v0, v1, "Incorrect format in response detected. retrying...", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

void __75__NDOServerVersionUtilities__dictionaryFromURL_shouldRetry_withCompletion___block_invoke_cold_4()
{
  uint64_t v0;
  uint64_t v1;
  os_log_t v2;
  int v3;
  const char *v4;
  __int16 v5;
  uint64_t v6;
  __int16 v7;
  uint64_t v8;

  OUTLINED_FUNCTION_6_0(*MEMORY[0x24BDAC8D0]);
  v3 = 136446722;
  v4 = "+[NDOServerVersionUtilities _dictionaryFromURL:shouldRetry:withCompletion:]_block_invoke";
  v5 = 2112;
  v6 = v0;
  v7 = 2112;
  v8 = v1;
  _os_log_error_impl(&dword_22D064000, v2, OS_LOG_TYPE_ERROR, "%{public}s: Error serializing plist file from URL '%@': %@", (uint8_t *)&v3, 0x20u);
}

void __81__NDOServerVersionUtilities__supportedVersionsForClientAndServer_withCompletion___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_1(&dword_22D064000, v0, v1, "No server version dictionary found", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

void __81__NDOServerVersionUtilities__supportedVersionsForClientAndServer_withCompletion___block_invoke_cold_2(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_22D064000, a1, a3, "Server version dictionary missing key '%@'", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_2();
}

void __81__NDOServerVersionUtilities__supportedVersionsForClientAndServer_withCompletion___block_invoke_cold_3(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_22D064000, a1, a3, "Server version dictionary missing key '%@'", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_2();
}

void __81__NDOServerVersionUtilities__supportedVersionsForClientAndServer_withCompletion___block_invoke_cold_4()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_1(&dword_22D064000, v0, v1, "Incorrect serverDictionary format", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

+ (void)getValidServerVersionCache
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_1(&dword_22D064000, v0, v1, "Incorrect format stored in server version cache. Removing it.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

+ (void)readAPSSupportedOverride
{
  OUTLINED_FUNCTION_3_1(&dword_22D064000, a1, a3, "%{public}s: Override isAPSSupported nil", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_2();
}

+ (void)getDecodedParamsForPath:(uint64_t)a3 withCompletion:(uint64_t)a4 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_3_1(&dword_22D064000, a1, a3, "%s", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_2();
}

void __68__NDOServerVersionUtilities_getDecodedParamsForPath_withCompletion___block_invoke_2_cold_1()
{
  uint64_t v0;
  os_log_t v1;
  int v2;
  const char *v3;
  __int16 v4;
  uint64_t v5;

  OUTLINED_FUNCTION_6_0(*MEMORY[0x24BDAC8D0]);
  v2 = 136446466;
  v3 = "+[NDOServerVersionUtilities getDecodedParamsForPath:withCompletion:]_block_invoke_2";
  v4 = 2114;
  v5 = v0;
  _os_log_error_impl(&dword_22D064000, v1, OS_LOG_TYPE_ERROR, "%{public}s: Failed to convert: %{public}@", (uint8_t *)&v2, 0x16u);
  OUTLINED_FUNCTION_2();
}

@end
