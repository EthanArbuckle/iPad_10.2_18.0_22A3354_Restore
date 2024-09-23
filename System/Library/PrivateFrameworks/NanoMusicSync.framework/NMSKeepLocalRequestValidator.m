@implementation NMSKeepLocalRequestValidator

- (NMSKeepLocalRequestValidator)initWithModelObject:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  char isKindOfClass;
  _QWORD *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  uint64_t v22;
  NSObject *v23;
  NMSKeepLocalRequestValidator *v24;
  int v26;
  uint64_t v27;
  __int16 v28;
  id v29;
  _QWORD v30[3];

  v30[2] = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  NMLogForCategory(5);
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v26 = 138412290;
    v27 = (uint64_t)v4;
    _os_log_impl(&dword_216E27000, v5, OS_LOG_TYPE_DEFAULT, "[NMSKeepLocalRequestValidator] _fetchSizeOfModelObjectItems - (begin) model-object: %@", (uint8_t *)&v26, 0xCu);
  }

  objc_msgSend(MEMORY[0x24BE6B1D0], "autoupdatingSharedLibrary");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)MEMORY[0x24BDBCF20];
  v8 = (void *)MEMORY[0x24BDD16E0];
  objc_msgSend(v4, "originalIdentifierSet");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "library");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "numberWithLongLong:", objc_msgSend(v10, "persistentID"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setWithObject:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  v13 = (void *)MEMORY[0x24BE6B180];
  v14 = (void *)MEMORY[0x24BE6B1A8];
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();
  v16 = (_QWORD *)MEMORY[0x24BE6B128];
  if ((isKindOfClass & 1) == 0)
    v16 = (_QWORD *)MEMORY[0x24BE6B130];
  objc_msgSend(v14, "predicateWithProperty:values:", *v16, v12);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v30[0] = v17;
  objc_msgSend(MEMORY[0x24BE6B198], "predicateWithProperty:value:comparison:", *MEMORY[0x24BE6B100], &unk_24D655980, 2);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v30[1] = v18;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v30, 2);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "predicateMatchingPredicates:", v19);
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BE6B1F8], "allItemsQueryWithLibrary:predicate:orderingTerms:usingSections:", v6, v20, 0, 0);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = _aggregatedFetchOfFileSizeForQuery(v21, v6);
  NMLogForCategory(5);
  v23 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
  {
    v26 = 134218242;
    v27 = v22;
    v28 = 2112;
    v29 = v4;
    _os_log_impl(&dword_216E27000, v23, OS_LOG_TYPE_DEFAULT, "[NMSKeepLocalRequestValidator] _fetchSizeOfModelObjectItems (finish) - size: %llu for model-object: %@", (uint8_t *)&v26, 0x16u);
  }

  v24 = -[NMSKeepLocalRequestValidator initWithItemSize:](self, "initWithItemSize:", v22);
  return v24;
}

- (NMSKeepLocalRequestValidator)initWithItemSize:(unint64_t)a3
{
  NMSKeepLocalRequestValidator *v4;
  NMSKeepLocalRequestValidator *v5;
  NSOperationQueue *v6;
  NSOperationQueue *validationQueue;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)NMSKeepLocalRequestValidator;
  v4 = -[NMSKeepLocalRequestValidator init](&v9, sel_init);
  v5 = v4;
  if (v4)
  {
    v4->_itemSize = a3;
    v6 = (NSOperationQueue *)objc_alloc_init(MEMORY[0x24BDD1710]);
    validationQueue = v5->_validationQueue;
    v5->_validationQueue = v6;

    -[NSOperationQueue setName:](v5->_validationQueue, "setName:", CFSTR("com.apple.NanoMusicSync.KeepLocalRequestValidator"));
  }
  return v5;
}

- (void)performWithOptions:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  void *v8;
  id v9;
  id v10;
  void *v11;
  _QWORD v12[5];
  id v13;
  id v14;

  v6 = a3;
  v7 = a4;
  v8 = (void *)MEMORY[0x24BDD1478];
  v12[0] = MEMORY[0x24BDAC760];
  v12[1] = 3221225472;
  v12[2] = __62__NMSKeepLocalRequestValidator_performWithOptions_completion___block_invoke;
  v12[3] = &unk_24D647098;
  v12[4] = self;
  v13 = v6;
  v14 = v7;
  v9 = v7;
  v10 = v6;
  objc_msgSend(v8, "blockOperationWithBlock:", v12);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setQualityOfService:", objc_msgSend(v10, "qualityOfService"));
  -[NSOperationQueue addOperation:](self->_validationQueue, "addOperation:", v11);

}

void __62__NMSKeepLocalRequestValidator_performWithOptions_completion___block_invoke(id *a1)
{
  void *v2;
  uint64_t v3;
  int IsCellular;
  NSObject *v5;
  id v6;
  intptr_t v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  _QWORD v12[5];
  id v13;
  id v14;
  uint64_t *v15;
  char v16;
  uint64_t v17;
  uint64_t *v18;
  uint64_t v19;
  uint64_t v20;
  uint8_t buf[4];
  uint64_t v22;
  uint64_t v23;

  v23 = *MEMORY[0x24BDAC8D0];
  v17 = 0;
  v18 = &v17;
  v19 = 0x2020000000;
  v20 = 0;
  objc_msgSend(MEMORY[0x24BEC87C0], "sharedMonitor");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "networkType");

  IsCellular = ICEnvironmentNetworkTypeIsCellular();
  NMLogForCategory(5);
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134217984;
    v22 = v3;
    _os_log_impl(&dword_216E27000, v5, OS_LOG_TYPE_DEFAULT, "[NMSKeepLocalRequestValidator] Current network connection type: %ld.", buf, 0xCu);
  }

  if (v3)
  {
    if (IsCellular)
    {
      v6 = objc_alloc(MEMORY[0x24BDC2810]);
      v7 = objc_msgSend(a1[5], "qualityOfService");
      if ((unint64_t)(v7 + 1) > 0x22 || ((1 << (v7 + 1)) & 0x404040400) == 0)
        v7 = 0;
      dispatch_get_global_queue(v7, 0);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = (void *)objc_msgSend(v6, "initWithQueue:", v8);

      objc_msgSend(a1[5], "cellularBundleIdentifier");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v12[0] = MEMORY[0x24BDAC760];
      v12[1] = 3221225472;
      v12[2] = __62__NMSKeepLocalRequestValidator_performWithOptions_completion___block_invoke_18;
      v12[3] = &unk_24D647740;
      v11 = a1[5];
      v12[4] = a1[4];
      v13 = v11;
      v15 = &v17;
      v14 = a1[6];
      v16 = IsCellular;
      objc_msgSend(v9, "performNetworkAccessFlowIfAllowed:ignoreForeground:completion:", v10, 0, v12);

    }
    else
    {
      objc_msgSend(a1[4], "_continueWithOptions:validatorException:cellularNetwork:completion:", a1[5], v18[3], 0, a1[6]);
    }
  }
  else
  {
    objc_msgSend(a1[4], "_finishWithOptions:validatorException:constraints:error:completion:", a1[5], 16, 0, 0, a1[6]);
  }
  _Block_object_dispose(&v17, 8);
}

void __62__NMSKeepLocalRequestValidator_performWithOptions_completion___block_invoke_18(uint64_t a1, void *a2, void *a3)
{
  id v5;
  NSObject *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  char v14;
  uint64_t v15;

  v5 = a3;
  if (!v5)
  {
    if (objc_msgSend(a2, "cellular"))
    {
      objc_msgSend(MEMORY[0x24BDDCA98], "sharedNetworkObserver");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = objc_msgSend(v13, "isMusicCellularDownloadingAllowed");

      if ((v14 & 1) != 0)
      {
LABEL_10:
        objc_msgSend(*(id *)(a1 + 32), "_continueWithOptions:validatorException:cellularNetwork:completion:", *(_QWORD *)(a1 + 40), *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24), *(unsigned __int8 *)(a1 + 64), *(_QWORD *)(a1 + 48));
        goto LABEL_11;
      }
      v15 = 8;
    }
    else
    {
      v15 = 64;
    }
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) |= v15;
    goto LABEL_10;
  }
  NMLogForCategory(5);
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    __62__NMSKeepLocalRequestValidator_performWithOptions_completion___block_invoke_18_cold_1((uint64_t)v5, v6, v7, v8, v9, v10, v11, v12);

  objc_msgSend(*(id *)(a1 + 32), "_finishWithOptions:validatorException:constraints:error:completion:", *(_QWORD *)(a1 + 40), *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24), 0, v5, *(_QWORD *)(a1 + 48));
LABEL_11:

}

- (void)_continueWithOptions:(id)a3 validatorException:(unint64_t)a4 cellularNetwork:(BOOL)a5 completion:(id)a6
{
  _BOOL4 v6;
  void *v10;
  id v11;
  id v12;
  uint64_t v13;
  unint64_t itemSize;
  unint64_t v15;
  void *v16;
  int v17;
  NSObject *v18;
  const __CFString *v19;
  uint64_t v20;
  unint64_t v21;
  unint64_t v22;
  unint64_t v23;
  unint64_t v24;
  unint64_t v25;
  void *v26;
  uint64_t v27;
  NSObject *v28;
  uint64_t v29;
  uint64_t v30;
  unint64_t v31;
  uint64_t v32;
  unint64_t v33;
  uint8_t buf[4];
  unint64_t v35;
  __int16 v36;
  unint64_t v37;
  __int16 v38;
  uint64_t v39;
  __int16 v40;
  const __CFString *v41;
  uint64_t v42;

  v6 = a5;
  v42 = *MEMORY[0x24BDAC8D0];
  v10 = (void *)MEMORY[0x24BDDC8E8];
  v11 = a6;
  v12 = a3;
  v13 = objc_msgSend(v10, "nms_defaultKeepLocalConstraints");
  itemSize = self->_itemSize;
  v33 = -[NMSKeepLocalRequestValidator _fetchSizeOfPendingDownloadsWithPowerConstraintCheck:](self, "_fetchSizeOfPendingDownloadsWithPowerConstraintCheck:", 0);
  v15 = -[NMSKeepLocalRequestValidator _fetchSizeOfPendingDownloadsWithPowerConstraintCheck:](self, "_fetchSizeOfPendingDownloadsWithPowerConstraintCheck:", 1);
  objc_msgSend(MEMORY[0x24BEC87C0], "sharedMonitor");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = objc_msgSend(v16, "isCharging");

  NMLogForCategory(5);
  v18 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
  {
    v19 = CFSTR("Off-charger");
    *(_DWORD *)buf = 134218754;
    v35 = v15;
    v20 = 499999999;
    if (v6)
      v20 = 99999999;
    if (v17)
      v19 = CFSTR("On-charger");
    v36 = 2048;
    v37 = itemSize;
    v38 = 2048;
    v39 = v20 + 1;
    v40 = 2112;
    v41 = v19;
    _os_log_impl(&dword_216E27000, v18, OS_LOG_TYPE_DEFAULT, "[NMSKeepLocalRequestValidator] There are presently %llu bytes pending download off charger. The current model-object size is %llu bytes. The current pending threshold has a max of %llu bytes. The watch charging state is: %@", buf, 0x2Au);
  }

  v21 = v15 + itemSize;
  v22 = a4 | 4;
  if ((v17 & 1) != 0)
    v23 = v13 & 0xFFFFFFFFFFFFFFFDLL;
  else
    v23 = v13;
  if ((v17 & 1) != 0)
    v22 = a4;
  if (!v6)
  {
    v23 = v13;
    v22 = a4;
  }
  if (v21 > 0x5F5E0FF)
    v24 = v23;
  else
    v24 = v13 & 0xFFFFFFFFFFFFFFFDLL;
  if (v21 > 0x5F5E0FF)
    v25 = v22;
  else
    v25 = a4;
  objc_msgSend(MEMORY[0x24BEC89B8], "sharedManager");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  v27 = objc_msgSend(v26, "storageSpaceAvailable");

  NMLogForCategory(5);
  v28 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134218240;
    v35 = v33 + itemSize;
    v36 = 2048;
    v37 = v27;
    _os_log_impl(&dword_216E27000, v28, OS_LOG_TYPE_DEFAULT, "[NMSKeepLocalRequestValidator] Calculated size(pending+new item): %llu with available storage of: %llu.", buf, 0x16u);
  }
  v29 = v25 | 2;
  if (v17)
    v29 = v25;
  if (v21 <= 0x1DCD64FF)
    v30 = v25;
  else
    v30 = v29;
  if (v21 <= 0x1DCD64FF)
    v31 = v24 & 0xFFFFFFFFFFFFFFFBLL;
  else
    v31 = v24;

  if (v27 - v33 >= 0x6ACFC1)
    v32 = v30;
  else
    v32 = v30 | 0x20;
  -[NMSKeepLocalRequestValidator _finishWithOptions:validatorException:constraints:error:completion:](self, "_finishWithOptions:validatorException:constraints:error:completion:", v12, v32, v31, 0, v11);

}

- (void)_finishWithOptions:(id)a3 validatorException:(unint64_t)a4 constraints:(unint64_t)a5 error:(id)a6 completion:(id)a7
{
  id v12;
  id v13;
  void (**v14)(id, uint64_t, void *);
  NSObject *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  unint64_t v26;
  uint64_t v27;
  NSObject *v28;
  void *v29;
  void *v30;
  uint64_t v31;
  void *v32;
  uint8_t buf[4];
  void *v34;
  uint64_t v35;
  _QWORD v36[2];

  v36[1] = *MEMORY[0x24BDAC8D0];
  v12 = a3;
  v13 = a6;
  v14 = (void (**)(id, uint64_t, void *))a7;
  if (v13)
  {
    NMLogForCategory(5);
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
      -[NMSKeepLocalRequestValidator _finishWithOptions:validatorException:constraints:error:completion:].cold.1((uint64_t)v13, v15, v16, v17, v18, v19, v20, v21);

    v22 = (void *)MEMORY[0x24BDD1540];
    v35 = *MEMORY[0x24BDD1398];
    v36[0] = v13;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v36, &v35, 1);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "errorWithDomain:code:userInfo:", CFSTR("NMSKeepLocalRequestErrorDomain"), 0, v23);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v25 = v13;
  }
  else
  {
    v26 = -[NMSKeepLocalRequestValidator _resolvedValidatorException:options:](self, "_resolvedValidatorException:options:", a4, v12);
    if (!v26)
    {
      v24 = 0;
      goto LABEL_10;
    }
    v27 = v26;
    NMLogForCategory(5);
    v28 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
    {
      NMSKeepLocalRequestValidatorExceptionString(v27);
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      v34 = v29;
      _os_log_impl(&dword_216E27000, v28, OS_LOG_TYPE_DEFAULT, "[NMSKeepLocalRequestValidator] Cannot proceed with KeepLocal request due to validatorException: %@", buf, 0xCu);

    }
    v30 = (void *)MEMORY[0x24BDD1540];
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", v27, CFSTR("NMSKeepLocalRequestErrorValidatorExceptionKey"));
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v32 = v23;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v32, &v31, 1);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "errorWithDomain:code:userInfo:", CFSTR("NMSKeepLocalRequestErrorDomain"), 1, v25);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
  }

LABEL_10:
  v14[2](v14, objc_msgSend(v12, "resolvedConstraints:", a5), v24);

}

- (unint64_t)_resolvedValidatorException:(unint64_t)a3 options:(id)a4
{
  if (objc_msgSend(a4, "powerPolicy"))
    return a3 & 0xFFFFFFFFFFFFFFF9;
  else
    return a3;
}

- (id)_predicateForKeepLocalStatusDownloadingOrWaiting
{
  void *v2;
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  _QWORD v10[4];

  v10[3] = *MEMORY[0x24BDAC8D0];
  v2 = (void *)MEMORY[0x24BE6B188];
  v3 = *MEMORY[0x24BE6B100];
  objc_msgSend(MEMORY[0x24BE6B198], "predicateWithProperty:value:comparison:", *MEMORY[0x24BE6B100], &unk_24D655908, 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BE6B198], "predicateWithProperty:value:comparison:", v3, &unk_24D655920, 1, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v10[1] = v5;
  objc_msgSend(MEMORY[0x24BE6B198], "predicateWithProperty:value:comparison:", v3, &unk_24D655938, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v10[2] = v6;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v10, 3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "predicateMatchingPredicates:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (unint64_t)_fetchSizeOfPendingDownloadsWithPowerConstraintCheck:(BOOL)a3
{
  _BOOL4 v3;
  NSObject *v5;
  const __CFString *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  NMSKeepLocalRequestValidator *v16;
  NSObject *v17;
  uint64_t v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  uint64_t v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  unint64_t v36;
  NSObject *v37;
  const __CFString *v38;
  NMSKeepLocalRequestValidator *v40;
  _BOOL4 v41;
  void *v42;
  void *v43;
  void *v44;
  _QWORD v45[4];
  NMSKeepLocalRequestValidator *v46;
  uint8_t buf[4];
  uint64_t v48;
  __int16 v49;
  NMSKeepLocalRequestValidator *v50;
  __int16 v51;
  NMSKeepLocalRequestValidator *v52;
  _QWORD v53[2];
  _QWORD v54[3];
  _QWORD v55[4];

  v3 = a3;
  v55[2] = *MEMORY[0x24BDAC8D0];
  NMLogForCategory(5);
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    if (v3)
      v6 = CFSTR("YES");
    else
      v6 = CFSTR("NO");
    *(_DWORD *)buf = 138412546;
    v48 = (uint64_t)v6;
    v49 = 2112;
    v50 = self;
    _os_log_impl(&dword_216E27000, v5, OS_LOG_TYPE_DEFAULT, "[NMSKeepLocalRequestValidator] (begin) _fetchSizeOfPendingDownloadsWithPowerConstraintCheck - checkConstraint: %@ - self: %@", buf, 0x16u);
  }

  objc_msgSend(MEMORY[0x24BE6B1D0], "autoupdatingSharedLibrary");
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  v41 = v3;
  if (v3)
  {
    v7 = (void *)MEMORY[0x24BE6B180];
    v8 = (void *)MEMORY[0x24BE6B1E0];
    objc_msgSend(MEMORY[0x24BE6B198], "predicateWithProperty:value:comparison:", *MEMORY[0x24BE6B0C0], &unk_24D655950, 10);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "predicateWithPredicate:", v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v55[0] = v10;
    objc_msgSend(MEMORY[0x24BE6B198], "predicateWithProperty:equalToInt64:", *MEMORY[0x24BE6B0B8], 1);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v55[1] = v11;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v55, 2);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "predicateMatchingPredicates:", v12);
    v13 = objc_claimAutoreleasedReturnValue();

  }
  else
  {
    objc_msgSend(MEMORY[0x24BE6B198], "predicateWithProperty:equalToInt64:", *MEMORY[0x24BE6B0B8], 1);
    v13 = objc_claimAutoreleasedReturnValue();
  }
  v43 = (void *)v13;
  objc_msgSend(MEMORY[0x24BE6B1A0], "allItemsQueryWithLibrary:predicate:orderingTerms:usingSections:", v44, v13, 0, 0);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBCEF0], "set");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v45[0] = MEMORY[0x24BDAC760];
  v45[1] = 3221225472;
  v45[2] = __85__NMSKeepLocalRequestValidator__fetchSizeOfPendingDownloadsWithPowerConstraintCheck___block_invoke;
  v45[3] = &unk_24D647768;
  v16 = v15;
  v46 = v16;
  v42 = v14;
  objc_msgSend(v14, "enumeratePersistentIDsUsingBlock:", v45);
  NMLogForCategory(5);
  v17 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
  {
    v18 = -[NMSKeepLocalRequestValidator count](v16, "count");
    *(_DWORD *)buf = 134218242;
    v48 = v18;
    v49 = 2112;
    v50 = v16;
    _os_log_impl(&dword_216E27000, v17, OS_LOG_TYPE_INFO, "[NMSKeepLocalRequestValidator] _fetchSizeOfPendingDownloadsWithPowerConstraintCheck - containerIDs count: %lu - %@", buf, 0x16u);
  }

  v19 = (void *)MEMORY[0x24BE6B180];
  objc_msgSend(MEMORY[0x24BE6B1A8], "predicateWithProperty:values:", *MEMORY[0x24BE6B130], v16);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v54[0] = v20;
  -[NMSKeepLocalRequestValidator _predicateForKeepLocalStatusDownloadingOrWaiting](self, "_predicateForKeepLocalStatusDownloadingOrWaiting");
  v40 = self;
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v54[1] = v21;
  v22 = (void *)MEMORY[0x24BE6B1E0];
  objc_msgSend(MEMORY[0x24BE6B198], "predicateWithProperty:equalToInt64:", *MEMORY[0x24BE6B0F8], -1);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "predicateWithPredicate:", v23);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v54[2] = v24;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v54, 3);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "predicateMatchingPredicates:", v25);
  v26 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BE6B1F8], "allItemsQueryWithLibrary:predicate:orderingTerms:usingSections:", v44, v26, 0, 0);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  v28 = _aggregatedFetchOfFileSizeForQuery(v27, v44);
  v29 = (void *)MEMORY[0x24BE6B180];
  v53[0] = v26;
  objc_msgSend(MEMORY[0x24BE6B198], "predicateWithProperty:value:comparison:", *MEMORY[0x24BE6B158], &unk_24D655968, 1);
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  v53[1] = v30;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v53, 2);
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v29, "predicateMatchingPredicates:", v31);
  v32 = (void *)objc_claimAutoreleasedReturnValue();

  v33 = (void *)MEMORY[0x24BE6B1F8];
  objc_msgSend(MEMORY[0x24BE6B1D0], "autoupdatingSharedLibrary");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v33, "allItemsQueryWithLibrary:predicate:orderingTerms:usingSections:", v34, v32, 0, 0);
  v35 = (void *)objc_claimAutoreleasedReturnValue();

  v36 = v28 + 7000000 * objc_msgSend(v35, "countOfEntities");
  NMLogForCategory(5);
  v37 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v37, OS_LOG_TYPE_DEFAULT))
  {
    v38 = CFSTR("NO");
    if (v41)
      v38 = CFSTR("YES");
    *(_DWORD *)buf = 138412802;
    v48 = (uint64_t)v38;
    v49 = 2048;
    v50 = (NMSKeepLocalRequestValidator *)v36;
    v51 = 2112;
    v52 = v40;
    _os_log_impl(&dword_216E27000, v37, OS_LOG_TYPE_DEFAULT, "[NMSKeepLocalRequestValidator] (finished) _fetchSizeOfPendingDownloadsWithPowerConstraintCheck - checkConstraint: %@ - total size in bytes: %llu - self: %@", buf, 0x20u);
  }

  return v36;
}

void __85__NMSKeepLocalRequestValidator__fetchSizeOfPendingDownloadsWithPowerConstraintCheck___block_invoke(uint64_t a1, uint64_t a2)
{
  void *v2;
  id v3;

  v2 = *(void **)(a1 + 32);
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithLongLong:", a2);
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "addObject:", v3);

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_validationQueue, 0);
}

void __62__NMSKeepLocalRequestValidator_performWithOptions_completion___block_invoke_18_cold_1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_216E27000, a2, a3, "[NMSKeepLocalRequestValidator] Failed to get cellular policy. Error: %@.", a5, a6, a7, a8, 2u);
}

- (void)_finishWithOptions:(uint64_t)a3 validatorException:(uint64_t)a4 constraints:(uint64_t)a5 error:(uint64_t)a6 completion:(uint64_t)a7 .cold.1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_216E27000, a2, a3, "[NMSKeepLocalRequestValidator] Cannot proceed with KeepLocal request due to error: %@", a5, a6, a7, a8, 2u);
}

@end
