@implementation CKSoftLinkAssetFetch

- (void)fetchAssetWithTeamID:(id)a3 options:(id)a4 completionHandler:(id)a5
{
  id v8;
  void *v9;
  uint64_t v10;
  objc_class *v11;
  id v12;
  void *v13;
  void *v14;
  id v15;
  void *v16;
  void *v17;
  objc_class *v18;
  id v19;
  _QWORD *v20;
  void *v21;
  void *v22;
  const __CFString *v23;
  void *v24;
  void *v25;
  objc_class *v26;
  void *v27;
  void *v28;
  objc_class *v29;
  id v30;
  void *v31;
  void *v32;
  id v33;
  id v34;
  void *v35;
  id v36;
  id v37;
  _QWORD v38[4];
  id v39;
  id v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  void *v44;
  uint64_t *v45;
  uint64_t v46;
  uint64_t *v47;
  uint64_t v48;
  uint64_t v49;
  _QWORD v50[3];

  v50[1] = *MEMORY[0x24BDAC8D0];
  v36 = a3;
  v37 = a4;
  v8 = a5;
  v46 = 0;
  v47 = &v46;
  v48 = 0x2050000000;
  v9 = (void *)getCKOperationConfigurationClass_softClass;
  v49 = getCKOperationConfigurationClass_softClass;
  v10 = MEMORY[0x24BDAC760];
  if (!getCKOperationConfigurationClass_softClass)
  {
    v41 = MEMORY[0x24BDAC760];
    v42 = 3221225472;
    v43 = (uint64_t)__getCKOperationConfigurationClass_block_invoke;
    v44 = &unk_2509F69D0;
    v45 = &v46;
    __getCKOperationConfigurationClass_block_invoke((uint64_t)&v41);
    v9 = (void *)v47[3];
  }
  v35 = v8;
  v11 = objc_retainAutorelease(v9);
  _Block_object_dispose(&v46, 8);
  v12 = objc_alloc_init(v11);
  objc_msgSend(v12, "setApplicationBundleIdentifierOverride:", CFSTR("com.apple.CloudTelemetryService.xpc"));
  objc_msgSend(v12, "setAllowsCellularAccess:", objc_msgSend(v37, "allowsCellularAccess"));
  objc_msgSend(v12, "setAllowsExpensiveNetworkAccess:", objc_msgSend(v37, "_allowsExpensiveAccess"));
  objc_msgSend(v12, "setPreferAnonymousRequests:", 1);
  -[CKSoftLinkAssetFetch container](self, "container");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v13)
  {
    v46 = 0;
    v47 = &v46;
    v48 = 0x2050000000;
    v14 = (void *)getCKContainerClass_softClass;
    v49 = getCKContainerClass_softClass;
    if (!getCKContainerClass_softClass)
    {
      v41 = v10;
      v42 = 3221225472;
      v43 = (uint64_t)__getCKContainerClass_block_invoke;
      v44 = &unk_2509F69D0;
      v45 = &v46;
      __getCKContainerClass_block_invoke((uint64_t)&v41);
      v14 = (void *)v47[3];
    }
    v15 = objc_retainAutorelease(v14);
    _Block_object_dispose(&v46, 8);
    objc_msgSend(v15, "containerWithIdentifier:", CFSTR("com.apple.acp.developer.apptelemetry.storebags"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
  }
  objc_msgSend(v13, "publicCloudDatabase");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v46 = 0;
  v47 = &v46;
  v48 = 0x2050000000;
  v17 = (void *)getCKRecordZoneIDClass_softClass;
  v49 = getCKRecordZoneIDClass_softClass;
  if (!getCKRecordZoneIDClass_softClass)
  {
    v41 = v10;
    v42 = 3221225472;
    v43 = (uint64_t)__getCKRecordZoneIDClass_block_invoke;
    v44 = &unk_2509F69D0;
    v45 = &v46;
    __getCKRecordZoneIDClass_block_invoke((uint64_t)&v41);
    v17 = (void *)v47[3];
  }
  v18 = objc_retainAutorelease(v17);
  _Block_object_dispose(&v46, 8);
  v19 = [v18 alloc];
  v41 = 0;
  v42 = (uint64_t)&v41;
  v43 = 0x2020000000;
  v20 = (_QWORD *)getCKCurrentUserDefaultNameSymbolLoc_ptr;
  v44 = (void *)getCKCurrentUserDefaultNameSymbolLoc_ptr;
  if (!getCKCurrentUserDefaultNameSymbolLoc_ptr)
  {
    v21 = (void *)CloudKitLibrary();
    v20 = dlsym(v21, "CKCurrentUserDefaultName");
    *(_QWORD *)(v42 + 24) = v20;
    getCKCurrentUserDefaultNameSymbolLoc_ptr = (uint64_t)v20;
  }
  _Block_object_dispose(&v41, 8);
  if (!v20)
    -[CKSoftLinkAssetFetch fetchAssetWithTeamID:options:completionHandler:].cold.1();
  v22 = (void *)objc_msgSend(v19, "initWithZoneName:ownerName:", v36, *v20);
  if (os_variant_has_internal_diagnostics())
    v23 = CFSTR("%@StoreBagWithLocal.json");
  else
    v23 = CFSTR("%@StoreBag.json");
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", v23, v36);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v46 = 0;
  v47 = &v46;
  v48 = 0x2050000000;
  v25 = (void *)getCKRecordIDClass_softClass;
  v49 = getCKRecordIDClass_softClass;
  if (!getCKRecordIDClass_softClass)
  {
    v41 = v10;
    v42 = 3221225472;
    v43 = (uint64_t)__getCKRecordIDClass_block_invoke;
    v44 = &unk_2509F69D0;
    v45 = &v46;
    __getCKRecordIDClass_block_invoke((uint64_t)&v41);
    v25 = (void *)v47[3];
  }
  v26 = objc_retainAutorelease(v25);
  _Block_object_dispose(&v46, 8);
  v27 = (void *)objc_msgSend([v26 alloc], "initWithRecordName:zoneID:", v24, v22);
  v46 = 0;
  v47 = &v46;
  v48 = 0x2050000000;
  v28 = (void *)getCKFetchRecordsOperationClass_softClass;
  v49 = getCKFetchRecordsOperationClass_softClass;
  if (!getCKFetchRecordsOperationClass_softClass)
  {
    v41 = v10;
    v42 = 3221225472;
    v43 = (uint64_t)__getCKFetchRecordsOperationClass_block_invoke;
    v44 = &unk_2509F69D0;
    v45 = &v46;
    __getCKFetchRecordsOperationClass_block_invoke((uint64_t)&v41);
    v28 = (void *)v47[3];
  }
  v29 = objc_retainAutorelease(v28);
  _Block_object_dispose(&v46, 8);
  v30 = [v29 alloc];
  v50[0] = v27;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v50, 1);
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  v32 = (void *)objc_msgSend(v30, "initWithRecordIDs:", v31);

  objc_msgSend(v32, "setShouldFetchAssetContentInMemory:", 1);
  objc_msgSend(v32, "setDropInMemoryAssetContentASAP:", 0);
  objc_msgSend(v32, "setConfiguration:", v12);
  v38[0] = v10;
  v38[1] = 3221225472;
  v38[2] = __71__CKSoftLinkAssetFetch_fetchAssetWithTeamID_options_completionHandler___block_invoke;
  v38[3] = &unk_2509F69A8;
  v39 = v27;
  v40 = v35;
  v33 = v35;
  v34 = v27;
  objc_msgSend(v32, "setFetchRecordsCompletionBlock:", v38);
  objc_msgSend(v16, "addOperation:", v32);

}

void __71__CKSoftLinkAssetFetch_fetchAssetWithTeamID_options_completionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  id v10;

  v10 = a3;
  objc_msgSend(a2, "objectForKeyedSubscript:", *(_QWORD *)(a1 + 32));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("storeBagAsset"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("signature"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = *(_QWORD *)(a1 + 40);
  if (v8)
  {
    objc_msgSend(v6, "assetContent");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, void *, void *, id))(v8 + 16))(v8, v9, v7, v10);

  }
}

- (CKContainer)container
{
  return self->_container;
}

- (void)setContainer:(id)a3
{
  objc_storeStrong((id *)&self->_container, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_container, 0);
}

- (void)fetchAssetWithTeamID:options:completionHandler:.cold.1()
{
  void *v0;
  void *v1;

  objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "NSString *getCKCurrentUserDefaultName(void)");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", v1, CFSTR("CKSoftLinkAssetFetch.m"), 16, CFSTR("%s"), dlerror());

  __break(1u);
}

@end
