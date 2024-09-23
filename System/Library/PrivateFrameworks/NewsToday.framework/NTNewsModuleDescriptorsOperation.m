@implementation NTNewsModuleDescriptorsOperation

- (void)operationWillFinishWithError:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void (**v7)(id, void *, void *, id);

  v4 = a3;
  -[NTTodayModuleDescriptorsOperation descriptorsCompletion](self, "descriptorsCompletion");
  v7 = (void (**)(id, void *, void *, id))objc_claimAutoreleasedReturnValue();
  -[NTNewsModuleDescriptorsOperation resultTodayModuleDescriptors](self, "resultTodayModuleDescriptors");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[NTNewsModuleDescriptorsOperation prefetchedContent](self, "prefetchedContent");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7[2](v7, v5, v6, v4);

}

void __52__NTNewsModuleDescriptorsOperation_performOperation__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  NSObject *v6;
  void *v7;
  int v8;
  void *v9;
  uint64_t v10;

  v10 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  v4 = (void *)*MEMORY[0x24BE6C9D0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE6C9D0], OS_LOG_TYPE_DEFAULT))
  {
    v5 = *(void **)(a1 + 32);
    v6 = v4;
    objc_msgSend(v5, "shortOperationDescription");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = 138543362;
    v9 = v7;
    _os_log_impl(&dword_2197E6000, v6, OS_LOG_TYPE_DEFAULT, "%{public}@ did fetch private data", (uint8_t *)&v8, 0xCu);

  }
  objc_msgSend(*(id *)(a1 + 32), "_continueOperationWithTodayData:", v3);

}

- (NSArray)resultTodayModuleDescriptors
{
  return self->_resultTodayModuleDescriptors;
}

- (void)performOperation
{
  void *v3;
  NSObject *v4;
  void *v5;
  void *v6;
  _QWORD v7[5];
  uint8_t buf[4];
  void *v9;
  uint64_t v10;

  v10 = *MEMORY[0x24BDAC8D0];
  v3 = (void *)*MEMORY[0x24BE6C9D0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE6C9D0], OS_LOG_TYPE_DEFAULT))
  {
    v4 = v3;
    -[FCOperation shortOperationDescription](self, "shortOperationDescription");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543362;
    v9 = v5;
    _os_log_impl(&dword_2197E6000, v4, OS_LOG_TYPE_DEFAULT, "%{public}@ will fetch private data", buf, 0xCu);

  }
  -[NTTodayModuleDescriptorsOperation privateDataStorage](self, "privateDataStorage");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __52__NTNewsModuleDescriptorsOperation_performOperation__block_invoke;
  v7[3] = &unk_24DB5FBD0;
  v7[4] = self;
  objc_msgSend(v6, "readPrivateDataSyncWithAccessor:", v7);

}

- (BOOL)validateOperation
{
  void *v3;
  void *v4;
  void *v5;
  BOOL v6;

  -[NTTodayModuleDescriptorsOperation contentContext](self, "contentContext");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v3 && os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
    -[NTNewsModuleDescriptorsOperation validateOperation].cold.3();
  -[NTTodayModuleDescriptorsOperation privateDataStorage](self, "privateDataStorage");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v4 && os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
    -[NTNewsModuleDescriptorsOperation validateOperation].cold.2();
  -[NTTodayModuleDescriptorsOperation descriptorsCompletion](self, "descriptorsCompletion");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v5 && os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
    -[NTNewsModuleDescriptorsOperation validateOperation].cold.1();
  if (v3)
    v6 = v4 == 0;
  else
    v6 = 1;
  return !v6 && v5 != 0;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_prefetchedContent, 0);
  objc_storeStrong((id *)&self->_resultTodayModuleDescriptors, 0);
}

- (NFCopying)prefetchedContent
{
  return self->_prefetchedContent;
}

- (void)_continueOperationWithTodayData:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  int v8;
  void *v9;
  int v10;
  NSObject *v11;
  void *v12;
  void *v13;
  int v14;
  void *v15;
  int v16;
  NSObject *v17;
  const char *v18;
  void *v19;
  void *v20;
  NSObject *v21;
  const char *v22;
  void *v23;
  int v24;
  void *v25;
  int v26;
  uint64_t v27;
  NSObject *v28;
  const __CFString *v29;
  __CFString *v30;
  __CFString *v31;
  int v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  uint64_t v40;
  void *v41;
  NSObject *v42;
  NSObject *v43;
  id v44;
  id v45;
  id v46;
  void *v47;
  _BOOL8 v48;
  const __CFString *v49;
  void *v50;
  unsigned int v51;
  void *v52;
  id v53;
  _QWORD block[5];
  id v55;
  id v56;
  id v57;
  _QWORD *v58;
  _BYTE *v59;
  _QWORD *v60;
  _QWORD *v61;
  _QWORD *v62;
  _QWORD v63[4];
  NSObject *v64;
  _BYTE *v65;
  _QWORD *v66;
  _QWORD v67[5];
  id v68;
  _QWORD v69[4];
  NSObject *v70;
  _QWORD *v71;
  _QWORD *v72;
  _QWORD v73[5];
  NSObject *v74;
  id v75;
  _QWORD *v76;
  _QWORD *v77;
  _QWORD *v78;
  _QWORD v79[5];
  id v80;
  _QWORD v81[5];
  id v82;
  _QWORD v83[5];
  id v84;
  void *v85;
  _BYTE buf[24];
  uint64_t (*v87)(uint64_t, uint64_t);
  void (*v88)(uint64_t);
  id v89;
  uint64_t v90;

  v90 = *MEMORY[0x24BDAC8D0];
  v53 = a3;
  -[NTTodayModuleDescriptorsOperation contentRequest](self, "contentRequest");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v83[0] = 0;
  v83[1] = v83;
  v83[2] = 0x3032000000;
  v83[3] = __Block_byref_object_copy__1;
  v83[4] = __Block_byref_object_dispose__1;
  v84 = 0;
  v81[0] = 0;
  v81[1] = v81;
  v81[2] = 0x3032000000;
  v81[3] = __Block_byref_object_copy__1;
  v81[4] = __Block_byref_object_dispose__1;
  v82 = 0;
  v79[0] = 0;
  v79[1] = v79;
  v79[2] = 0x3032000000;
  v79[3] = __Block_byref_object_copy__1;
  v79[4] = __Block_byref_object_dispose__1;
  v80 = 0;
  -[NTTodayModuleDescriptorsOperation contentContext](self, "contentContext");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "appConfigurationManager");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "possiblyUnfetchedAppConfiguration");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "userSegmentationInWidgetAllowed");

  NewsCoreUserDefaults();
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "BOOLForKey:", *MEMORY[0x24BE6CA70]);

  LODWORD(v9) = v10 & v8;
  v11 = dispatch_group_create();
  if (!(_DWORD)v9 || (objc_opt_respondsToSelector() & 1) == 0)
  {
    dispatch_group_enter(v11);
    v69[0] = MEMORY[0x24BDAC760];
    v69[1] = 3221225472;
    v69[2] = __68__NTNewsModuleDescriptorsOperation__continueOperationWithTodayData___block_invoke_2;
    v69[3] = &unk_24DB5FBF8;
    v71 = v79;
    v72 = v83;
    v70 = v11;
    v19 = (void *)MEMORY[0x219A33CDC](v69);
    if (-[NTTodayModuleDescriptorsOperation requireRefreshedAppConfig](self, "requireRefreshedAppConfig"))
    {
      -[NTNewsModuleDescriptorsOperation qualityOfService](self, "qualityOfService");
      FCDispatchQueueForQualityOfService();
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "refreshAppConfigurationIfNeededWithCompletionQueue:refreshCompletion:", v20, v19);

    }
    else
    {
      objc_msgSend(v6, "fetchAppConfigurationIfNeededWithCompletion:", v19);
    }

    v12 = v70;
    goto LABEL_34;
  }
  dispatch_group_enter(v11);
  objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v53, "localNewsTagID");
  v52 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v52)
  {
    NTSharedLog();
    v21 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      v22 = "not sending up local news tag";
LABEL_20:
      _os_log_impl(&dword_2197E6000, v21, OS_LOG_TYPE_INFO, v22, buf, 2u);
    }
LABEL_21:

    goto LABEL_22;
  }
  NewsCoreUserDefaults();
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v13, "BOOLForKey:", *MEMORY[0x24BE6CA28]);

  if (v14)
  {
    objc_msgSend(v53, "rankedAllSubscribedTagIDs");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_msgSend(v15, "containsObject:", v52);

    if (v16)
    {
      NTSharedLog();
      v17 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        v18 = "sending up local news tag in Favorites-only mode";
LABEL_16:
        _os_log_impl(&dword_2197E6000, v17, OS_LOG_TYPE_INFO, v18, buf, 2u);
        goto LABEL_17;
      }
      goto LABEL_17;
    }
    NTSharedLog();
    v21 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      v22 = "not sending up local news tag due to Favorites-only mode";
      goto LABEL_20;
    }
    goto LABEL_21;
  }
  NTSharedLog();
  v17 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    v18 = "sending up local news tag";
    goto LABEL_16;
  }
LABEL_17:

  objc_msgSend(v12, "setObject:forKeyedSubscript:", v52, CFSTR("localNewsTagId"));
  objc_msgSend(v12, "setObject:forKeyedSubscript:", MEMORY[0x24BDBD1C8], CFSTR("localNewsInForYou"));
LABEL_22:
  objc_msgSend(v6, "possiblyUnfetchedAppConfiguration");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v24 = objc_msgSend(v23, "articleEmbeddingsEnabled");

  if (v24)
    objc_msgSend(v12, "setObject:forKeyedSubscript:", MEMORY[0x24BDBD1C8], CFSTR("articleEmbeddingsEnabled"));
  objc_msgSend(v6, "possiblyUnfetchedAppConfiguration");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v26 = objc_msgSend(v25, "widgetFetchOfTodayFeedLiteConfigEnabled");

  if (v26 && !objc_msgSend(v4, "moduleDescriptorType"))
  {
    objc_msgSend(v53, "bundleSubscription");
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    v48 = (unint64_t)objc_msgSend(v47, "unprotectedSubscriptionState") < 2;

    v27 = v48;
  }
  else
  {
    v27 = 0;
  }
  v28 = (id)*MEMORY[0x24BE6C9D0];
  if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
  {
    v51 = v27;
    -[FCOperation shortOperationDescription](self, "shortOperationDescription");
    v50 = (void *)objc_claimAutoreleasedReturnValue();
    v29 = CFSTR(" not");
    if ((_DWORD)v27)
      v29 = &stru_24DB606B8;
    v49 = v29;
    v30 = CFSTR("NO");
    if (v26)
      v30 = CFSTR("YES");
    v31 = v30;
    v32 = objc_msgSend(v4, "moduleDescriptorType");
    objc_msgSend(v53, "bundleSubscription");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    v34 = (void *)objc_msgSend(v33, "unprotectedSubscriptionState");
    *(_DWORD *)buf = 138544386;
    *(_QWORD *)&buf[4] = v50;
    *(_WORD *)&buf[12] = 2114;
    *(_QWORD *)&buf[14] = v49;
    *(_WORD *)&buf[22] = 2114;
    v87 = (uint64_t (*)(uint64_t, uint64_t))v31;
    LOWORD(v88) = 1024;
    *(_DWORD *)((char *)&v88 + 2) = v32;
    HIWORD(v88) = 2048;
    v89 = v34;
    _os_log_impl(&dword_2197E6000, v28, OS_LOG_TYPE_DEFAULT, "%{public}@ will%{public}@ fetch todayLiteConfig, enabledInConfig=%{public}@, descriptorType=%d, subscriptionState=%lu", buf, 0x30u);

    v27 = v51;
  }

  v73[0] = MEMORY[0x24BDAC760];
  v73[1] = 3221225472;
  v73[2] = __68__NTNewsModuleDescriptorsOperation__continueOperationWithTodayData___block_invoke;
  v73[3] = &unk_24DB5FC20;
  v73[4] = self;
  v76 = v79;
  v77 = v83;
  v78 = v81;
  v74 = v11;
  v75 = v6;
  objc_msgSend(v75, "fetchAppWidgetConfigurationWithTodayLiteConfig:additionalFields:completion:", v27, v12, v73);

LABEL_34:
  objc_msgSend(v4, "tagID");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  if (v35)
  {
    objc_msgSend(v4, "tagID");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    v85 = v36;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v85, 1);
    v37 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v37 = (void *)MEMORY[0x24BDBD1A8];
  }

  *(_QWORD *)buf = 0;
  *(_QWORD *)&buf[8] = buf;
  *(_QWORD *)&buf[16] = 0x3032000000;
  v87 = __Block_byref_object_copy__1;
  v88 = __Block_byref_object_dispose__1;
  v89 = 0;
  v67[0] = 0;
  v67[1] = v67;
  v67[2] = 0x3032000000;
  v67[3] = __Block_byref_object_copy__1;
  v67[4] = __Block_byref_object_dispose__1;
  v68 = 0;
  -[NTTodayModuleDescriptorsOperation contentContext](self, "contentContext");
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v38, "tagController");
  v39 = (void *)objc_claimAutoreleasedReturnValue();

  dispatch_group_enter(v11);
  v40 = -[NTNewsModuleDescriptorsOperation qualityOfService](self, "qualityOfService");
  -[NTNewsModuleDescriptorsOperation qualityOfService](self, "qualityOfService");
  FCDispatchQueueForQualityOfService();
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  v63[0] = MEMORY[0x24BDAC760];
  v63[1] = 3221225472;
  v63[2] = __68__NTNewsModuleDescriptorsOperation__continueOperationWithTodayData___block_invoke_3;
  v63[3] = &unk_24DB5FC48;
  v65 = buf;
  v66 = v67;
  v42 = v11;
  v64 = v42;
  objc_msgSend(v39, "fetchTagsForTagIDs:qualityOfService:callbackQueue:completionHandler:", v37, v40, v41, v63);

  -[NTNewsModuleDescriptorsOperation qualityOfService](self, "qualityOfService");
  FCDispatchQueueForQualityOfService();
  v43 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __68__NTNewsModuleDescriptorsOperation__continueOperationWithTodayData___block_invoke_4;
  block[3] = &unk_24DB5FD38;
  block[4] = self;
  v55 = v53;
  v56 = v5;
  v57 = v4;
  v58 = v79;
  v59 = buf;
  v60 = v67;
  v61 = v83;
  v62 = v81;
  v44 = v4;
  v45 = v5;
  v46 = v53;
  dispatch_group_notify(v42, v43, block);

  _Block_object_dispose(v67, 8);
  _Block_object_dispose(buf, 8);

  _Block_object_dispose(v79, 8);
  _Block_object_dispose(v81, 8);

  _Block_object_dispose(v83, 8);
}

void __68__NTNewsModuleDescriptorsOperation__continueOperationWithTodayData___block_invoke(uint64_t a1, void *a2, void *a3, void *a4, void *a5)
{
  id v9;
  id v10;
  id v11;
  id v12;
  void *v13;
  void *v14;
  NSObject *v15;
  void *v16;
  uint64_t v17;
  void *v18;
  id v19;
  void *v20;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  _QWORD v24[4];
  id v25;
  __int128 v26;
  uint8_t buf[4];
  void *v28;
  __int16 v29;
  uint64_t v30;
  uint64_t v31;

  v31 = *MEMORY[0x24BDAC8D0];
  v9 = a2;
  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = (void *)*MEMORY[0x24BE6C9D0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE6C9D0], OS_LOG_TYPE_DEFAULT))
  {
    v14 = *(void **)(a1 + 32);
    v15 = v13;
    objc_msgSend(v14, "shortOperationDescription");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v28 = v16;
    v29 = 2048;
    v30 = objc_msgSend(v11, "length");
    _os_log_impl(&dword_2197E6000, v15, OS_LOG_TYPE_DEFAULT, "%{public}@ fetched todayLiteConfig of length %lu", buf, 0x16u);

  }
  objc_msgSend(*(id *)(a1 + 32), "_donateTodayConfigDataToNewsd:", v11);
  v17 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
  v18 = *(void **)(v17 + 40);
  *(_QWORD *)(v17 + 40) = v12;
  v19 = v12;

  if (v19)
  {
    v24[0] = MEMORY[0x24BDAC760];
    v24[1] = 3221225472;
    v24[2] = __68__NTNewsModuleDescriptorsOperation__continueOperationWithTodayData___block_invoke_60;
    v24[3] = &unk_24DB5FBF8;
    v26 = *(_OWORD *)(a1 + 56);
    v20 = *(void **)(a1 + 48);
    v25 = *(id *)(a1 + 40);
    objc_msgSend(v20, "fetchAppConfigurationIfNeededWithCompletion:", v24);

  }
  else
  {
    v21 = objc_msgSend(v9, "copy");
    v22 = *(_QWORD *)(*(_QWORD *)(a1 + 64) + 8);
    v23 = *(void **)(v22 + 40);
    *(_QWORD *)(v22 + 40) = v21;

    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 40), a3);
    dispatch_group_leave(*(dispatch_group_t *)(a1 + 40));
  }

}

void __68__NTNewsModuleDescriptorsOperation__continueOperationWithTodayData___block_invoke_60(uint64_t a1, void *a2, void *a3)
{
  id v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  id v9;

  v9 = a2;
  v5 = a3;
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), a3);
  if (!v5)
  {
    v6 = objc_msgSend(v9, "copy");
    v7 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
    v8 = *(void **)(v7 + 40);
    *(_QWORD *)(v7 + 40) = v6;

  }
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));

}

void __68__NTNewsModuleDescriptorsOperation__continueOperationWithTodayData___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  id v9;

  v9 = a2;
  v5 = a3;
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), a3);
  if (!v5)
  {
    v6 = objc_msgSend(v9, "copy");
    v7 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
    v8 = *(void **)(v7 + 40);
    *(_QWORD *)(v7 + 40) = v6;

  }
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));

}

void __68__NTNewsModuleDescriptorsOperation__continueOperationWithTodayData___block_invoke_3(uint64_t a1, void *a2, void *a3)
{
  id v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;

  v5 = a3;
  v6 = objc_msgSend(a2, "copy");
  v7 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v8 = *(void **)(v7 + 40);
  *(_QWORD *)(v7 + 40) = v6;

  v9 = objc_msgSend(v5, "copy");
  v10 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v11 = *(void **)(v10 + 40);
  *(_QWORD *)(v10 + 40) = v9;

  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
}

void __68__NTNewsModuleDescriptorsOperation__continueOperationWithTodayData___block_invoke_4(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  NSObject *v5;
  objc_class *v6;
  id v7;
  void *v8;
  void *v9;
  id v10;
  uint64_t v11;
  void *v12;
  void *v13;
  uint64_t v14;
  id v15;
  id v16;
  id v17;
  void *v18;
  id v19;
  id v20;
  id v21;
  void *v22;
  id v23;
  uint64_t v24;
  id v25;
  id v26;
  void *v27;
  void *v28;
  void *v29;
  id v30;
  void *v31;
  uint64_t v32;
  uint64_t v33;
  void (*v34)(uint64_t);
  void *v35;
  id v36;
  id v37;
  uint64_t v38;
  id v39;
  id v40;
  id v41;
  uint64_t v42;
  _QWORD *v43;
  _QWORD v44[5];
  id v45;
  id v46;
  id v47;
  id v48;
  __int128 v49;
  _QWORD *v50;
  _QWORD v51[5];
  id v52;
  id v53;
  id v54;
  id v55;
  _QWORD v56[5];
  id v57;
  uint8_t buf[4];
  id v59;
  __int16 v60;
  void *v61;
  __int16 v62;
  void *v63;
  uint64_t v64;

  v64 = *MEMORY[0x24BDAC8D0];
  if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40))
  {
    objc_msgSend(*(id *)(a1 + 32), "finishedPerformingOperationWithError:");
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDBCEB8], "array");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v56[0] = 0;
    v56[1] = v56;
    v56[2] = 0x3032000000;
    v56[3] = __Block_byref_object_copy__1;
    v56[4] = __Block_byref_object_dispose__1;
    v57 = 0;
    NTSharedLog();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    {
      v6 = (objc_class *)objc_opt_class();
      NSStringFromClass(v6);
      v7 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 40), "purchasedTagIDs");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 40), "bundleSubscription");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543874;
      v59 = v7;
      v60 = 2114;
      v61 = v8;
      v62 = 2114;
      v63 = v9;
      _os_log_impl(&dword_2197E6000, v5, OS_LOG_TYPE_DEBUG, "%{public}@ created access checker with %{public}@ and %{public}@", buf, 0x20u);

    }
    v10 = objc_alloc(MEMORY[0x24BE6CCA0]);
    v11 = *(_QWORD *)(a1 + 40);
    objc_msgSend(*(id *)(a1 + 48), "configurationManager");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = (void *)objc_msgSend(v10, "initWithPurchaseProvider:bundleSubscriptionProvider:configurationManager:", v11, v11, v12);

    v14 = MEMORY[0x24BDAC760];
    v51[0] = MEMORY[0x24BDAC760];
    v51[1] = 3221225472;
    v51[2] = __68__NTNewsModuleDescriptorsOperation__continueOperationWithTodayData___block_invoke_67;
    v51[3] = &unk_24DB5FC70;
    v51[4] = *(_QWORD *)(a1 + 32);
    v30 = v13;
    v52 = v30;
    v15 = v4;
    v53 = v15;
    v16 = v2;
    v54 = v16;
    v17 = v3;
    v55 = v17;
    v18 = (void *)MEMORY[0x219A33CDC](v51);
    v44[0] = v14;
    v44[1] = 3221225472;
    v44[2] = __68__NTNewsModuleDescriptorsOperation__continueOperationWithTodayData___block_invoke_71;
    v44[3] = &unk_24DB5FCE8;
    v44[4] = *(_QWORD *)(a1 + 32);
    v45 = *(id *)(a1 + 56);
    v49 = *(_OWORD *)(a1 + 72);
    v19 = v17;
    v46 = v19;
    v20 = v16;
    v47 = v20;
    v21 = v15;
    v48 = v21;
    v50 = v56;
    v22 = (void *)MEMORY[0x219A33CDC](v44);
    v32 = v14;
    v33 = 3221225472;
    v34 = __68__NTNewsModuleDescriptorsOperation__continueOperationWithTodayData___block_invoke_3_76;
    v35 = &unk_24DB5FD10;
    v42 = *(_QWORD *)(a1 + 88);
    v36 = *(id *)(a1 + 40);
    v23 = v20;
    v43 = v56;
    v24 = *(_QWORD *)(a1 + 32);
    v37 = v23;
    v38 = v24;
    v25 = v21;
    v39 = v25;
    v26 = v19;
    v40 = v26;
    v41 = *(id *)(a1 + 56);
    v27 = (void *)MEMORY[0x219A33CDC](&v32);
    if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 96) + 8) + 40))
    {
      v28 = (void *)objc_opt_new();
      objc_msgSend(v28, "setPurpose:", *MEMORY[0x24BE6C9E8], v30, v32, v33, v34, v35, v36, v37, v38, v39, v40);
      objc_msgSend(v28, "setConfiguration:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 88) + 8) + 40));
      objc_msgSend(v28, "setWidgetConfiguration:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 96) + 8) + 40));
      objc_msgSend(v28, "setContext:", *(_QWORD *)(a1 + 48));
    }
    else
    {
      v28 = (void *)objc_opt_new();
      objc_msgSend(v28, "setPurpose:", *MEMORY[0x24BE6C9E8], v30, v32, v33, v34, v35, v36, v37, v38, v39, v40);
      objc_msgSend(v28, "setConfiguration:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 88) + 8) + 40));
      objc_msgSend(v28, "setContext:", *(_QWORD *)(a1 + 48));
      objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 88) + 8) + 40), "widgetConfigID");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v28, "setWidgetConfigID:", v29);

    }
    objc_msgSend(v28, "setDefaultConfigCompletionHandler:", v18);
    objc_msgSend(v28, "setSingleTagConfigCompletionHandler:", v22);
    objc_msgSend(v28, "setCompletionBlock:", v27);
    objc_msgSend(*(id *)(a1 + 32), "associateChildOperation:", v28);
    objc_msgSend(v28, "start");

    _Block_object_dispose(v56, 8);
  }
}

void __68__NTNewsModuleDescriptorsOperation__continueOperationWithTodayData___block_invoke_67(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7;
  id v8;
  id v9;
  NSObject *v10;
  objc_class *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  int v20;
  void *v21;
  __int16 v22;
  id v23;
  __int16 v24;
  id v25;
  uint64_t v26;

  v26 = *MEMORY[0x24BDAC8D0];
  v7 = a2;
  v8 = a3;
  v9 = a4;
  NTSharedLog();
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
  {
    v11 = (objc_class *)objc_opt_class();
    NSStringFromClass(v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = 138543874;
    v21 = v12;
    v22 = 2114;
    v23 = v7;
    v24 = 2048;
    v25 = v8;
    _os_log_impl(&dword_2197E6000, v10, OS_LOG_TYPE_INFO, "%{public}@ fetched default config %{public}@ heldRecordsByType %p", (uint8_t *)&v20, 0x20u);

  }
  v13 = *(_QWORD *)(a1 + 40);
  objc_msgSend(v8, "objectForKeyedSubscript:", &unk_24DB6EC28);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "nt_resolveFallbacksWithPaidAccessChecker:heldArticleRecords:", v13, v14);

  objc_msgSend(MEMORY[0x24BE6D2D0], "nt_defaultModule");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 48), "addObject:", v15);
  objc_msgSend(v15, "availableContents");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "fc_onlyObject");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "request");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "identifier");
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(*(id *)(a1 + 56), "fc_safelySetObject:forKey:", v7, v19);
  objc_msgSend(*(id *)(a1 + 64), "fc_safelySetObjectAllowingNil:forKey:", v9, v19);

}

void __68__NTNewsModuleDescriptorsOperation__continueOperationWithTodayData___block_invoke_71(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7;
  id v8;
  id v9;
  NSObject *v10;
  objc_class *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  id v18;
  int v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  uint64_t v24;
  uint64_t v25;
  void (*v26)(uint64_t);
  void *v27;
  id v28;
  void *v29;
  id v30;
  _QWORD v31[4];
  id v32;
  void *v33;
  uint64_t v34;
  uint8_t buf[4];
  void *v36;
  __int16 v37;
  id v38;
  __int16 v39;
  id v40;
  uint64_t v41;

  v41 = *MEMORY[0x24BDAC8D0];
  v7 = a2;
  v8 = a3;
  v9 = a4;
  NTSharedLog();
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
  {
    v11 = (objc_class *)objc_opt_class();
    NSStringFromClass(v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543874;
    v36 = v12;
    v37 = 2114;
    v38 = v7;
    v39 = 2048;
    v40 = v8;
    _os_log_impl(&dword_2197E6000, v10, OS_LOG_TYPE_INFO, "%{public}@ fetched single tag config %{public}@ heldRecordsByType %p", buf, 0x20u);

  }
  v13 = *(void **)(a1 + 40);
  if (!v13 || objc_msgSend(v13, "moduleDescriptorType") != 1)
    goto LABEL_12;
  objc_msgSend(*(id *)(a1 + 40), "identifier");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "tagID");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 40), "objectForKeyedSubscript:", v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  if (v16)
  {
    objc_msgSend(v7, "configByResolvingWithTag:", v16);
    v17 = (id)objc_claimAutoreleasedReturnValue();
    if (v17)
    {
      objc_msgSend(MEMORY[0x24BE6D2D0], "nt_moduleWithTagID:", v15);
      v18 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 56), "setObject:forKeyedSubscript:", v17, v14);
      objc_msgSend(*(id *)(a1 + 64), "addObject:", v18);
      v19 = 2;
    }
    else
    {
      v24 = MEMORY[0x24BDAC760];
      v25 = 3221225472;
      v26 = __68__NTNewsModuleDescriptorsOperation__continueOperationWithTodayData___block_invoke_2_75;
      v27 = &unk_24DB5FCC0;
      v18 = *(id *)(a1 + 48);
      v28 = v18;
      v29 = v14;
      v30 = v9;
      __68__NTNewsModuleDescriptorsOperation__continueOperationWithTodayData___block_invoke_2_75((uint64_t)&v24);
      v19 = 1;
    }

  }
  else
  {
    v31[0] = MEMORY[0x24BDAC760];
    v31[1] = 3221225472;
    v31[2] = __68__NTNewsModuleDescriptorsOperation__continueOperationWithTodayData___block_invoke_72;
    v31[3] = &unk_24DB5FC98;
    v20 = *(_QWORD *)(a1 + 80);
    v33 = v14;
    v34 = v20;
    v32 = *(id *)(a1 + 48);
    v17 = v32;
    __68__NTNewsModuleDescriptorsOperation__continueOperationWithTodayData___block_invoke_72((uint64_t)v31);
    v19 = 1;
  }

  if (v19 == 2)
  {
LABEL_12:
    v21 = objc_msgSend(v8, "copy", v24, v25, v26, v27);
    v22 = *(_QWORD *)(*(_QWORD *)(a1 + 88) + 8);
    v23 = *(void **)(v22 + 40);
    *(_QWORD *)(v22 + 40) = v21;

  }
}

void __68__NTNewsModuleDescriptorsOperation__continueOperationWithTodayData___block_invoke_72(uint64_t a1)
{
  void *v2;
  id v3;
  id v4;

  v2 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40);
  if (v2)
  {
    v3 = v2;
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", CFSTR("NewsToday"), 1, 0);
    v3 = (id)objc_claimAutoreleasedReturnValue();
  }
  v4 = v3;
  objc_msgSend(*(id *)(a1 + 32), "setObject:forKeyedSubscript:", v3, *(_QWORD *)(a1 + 40));

}

void __68__NTNewsModuleDescriptorsOperation__continueOperationWithTodayData___block_invoke_2_75(uint64_t a1)
{
  uint64_t v2;
  id v3;

  v2 = *(_QWORD *)(a1 + 48);
  if (v2)
  {
    objc_msgSend(*(id *)(a1 + 32), "setObject:forKeyedSubscript:", v2, *(_QWORD *)(a1 + 40));
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", CFSTR("NewsToday"), 2, 0);
    v3 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "setObject:forKeyedSubscript:", v3, *(_QWORD *)(a1 + 40));

  }
}

void __68__NTNewsModuleDescriptorsOperation__continueOperationWithTodayData___block_invoke_3_76(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  NTNewsModuleDescriptorsOperationPrefetchedContent *v5;

  v5 = -[NTNewsModuleDescriptorsOperationPrefetchedContent initWithAppConfiguration:privateData:todayConfigsByRequestID:prefetchedHeldRecordsByType:]([NTNewsModuleDescriptorsOperationPrefetchedContent alloc], "initWithAppConfiguration:privateData:todayConfigsByRequestID:prefetchedHeldRecordsByType:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 80) + 8) + 40), *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40), *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 88) + 8) + 40));
  objc_msgSend(*(id *)(a1 + 48), "setResultTodayModuleDescriptors:", *(_QWORD *)(a1 + 56));
  objc_msgSend(*(id *)(a1 + 48), "setPrefetchedContent:", v5);
  v2 = *(void **)(a1 + 64);
  objc_msgSend(*(id *)(a1 + 72), "identifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKeyedSubscript:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(*(id *)(a1 + 48), "finishedPerformingOperationWithError:", v4);
}

- (void)_donateTodayConfigDataToNewsd:(id)a3
{
  id v4;
  NSObject **v5;
  void *v6;
  NSObject *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  NSObject *v12;
  NSObject *v13;
  void *v14;
  _QWORD v15[5];
  _QWORD v16[5];
  uint8_t buf[4];
  void *v18;
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  if (objc_msgSend(v4, "length"))
  {
    ++_donateTodayConfigDataToNewsd__connectionIdentifier;
    v5 = (NSObject **)MEMORY[0x24BE6C9D0];
    v6 = (void *)*MEMORY[0x24BE6C9D0];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE6C9D0], OS_LOG_TYPE_DEFAULT))
    {
      v7 = v6;
      -[FCOperation shortOperationDescription](self, "shortOperationDescription");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v18 = v8;
      _os_log_impl(&dword_2197E6000, v7, OS_LOG_TYPE_DEFAULT, "%{public}@ will donate Today Feed config data to newsd", buf, 0xCu);

    }
    NDTodayFeedServiceXPCConnection();
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = MEMORY[0x24BDAC760];
    v16[0] = MEMORY[0x24BDAC760];
    v16[1] = 3221225472;
    v16[2] = __66__NTNewsModuleDescriptorsOperation__donateTodayConfigDataToNewsd___block_invoke_80;
    v16[3] = &unk_24DB5E300;
    v16[4] = self;
    objc_msgSend(v9, "setInterruptionHandler:", v16);
    v15[0] = v10;
    v15[1] = 3221225472;
    v15[2] = __66__NTNewsModuleDescriptorsOperation__donateTodayConfigDataToNewsd___block_invoke_81;
    v15[3] = &unk_24DB5FD60;
    v15[4] = self;
    objc_msgSend(v9, "synchronousRemoteObjectProxyWithErrorHandler:", v15);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "resume");
    objc_msgSend(v11, "adoptFeedConfigData:", v4);
    objc_msgSend(v9, "invalidate");
    v12 = *v5;
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      v13 = v12;
      -[FCOperation shortOperationDescription](self, "shortOperationDescription");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v18 = v14;
      _os_log_impl(&dword_2197E6000, v13, OS_LOG_TYPE_DEFAULT, "%{public}@ finished donating Today Feed config data to newsd", buf, 0xCu);

    }
  }

}

void __66__NTNewsModuleDescriptorsOperation__donateTodayConfigDataToNewsd___block_invoke_80(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  int v4;
  void *v5;
  uint64_t v6;

  v6 = *MEMORY[0x24BDAC8D0];
  NTSharedLog();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    objc_msgSend(*(id *)(a1 + 32), "shortOperationDescription");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = 138543362;
    v5 = v3;
    _os_log_impl(&dword_2197E6000, v2, OS_LOG_TYPE_INFO, "%{public}@ connection to newsd interrupted", (uint8_t *)&v4, 0xCu);

  }
}

void __66__NTNewsModuleDescriptorsOperation__donateTodayConfigDataToNewsd___block_invoke_81(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  void *v5;
  int v6;
  void *v7;
  __int16 v8;
  id v9;
  uint64_t v10;

  v10 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  NTSharedLog();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    objc_msgSend(*(id *)(a1 + 32), "shortOperationDescription");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = 138543618;
    v7 = v5;
    v8 = 2114;
    v9 = v3;
    _os_log_impl(&dword_2197E6000, v4, OS_LOG_TYPE_INFO, "%{public}@ connection to newsd encountered error with proxy: %{public}@", (uint8_t *)&v6, 0x16u);

  }
}

- (void)setResultTodayModuleDescriptors:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 408);
}

- (void)setPrefetchedContent:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 416);
}

- (void)validateOperation
{
  void *v0;
  uint64_t v1;
  int v2[10];
  uint64_t v3;

  v3 = *MEMORY[0x24BDAC8D0];
  v0 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD17C8]), "initWithFormat:", CFSTR("module descriptors operation requires content context"));
  v2[0] = 136315906;
  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_0(&dword_2197E6000, MEMORY[0x24BDACB70], v1, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", (uint8_t *)v2);

  OUTLINED_FUNCTION_3_0();
}

@end
