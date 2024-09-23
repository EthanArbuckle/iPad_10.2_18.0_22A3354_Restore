@implementation ML3MusicLibrary(HSAdditions)

- (void)fillContainerForHomeSharingLibrary:()HSAdditions containerID:completionHandler:
{
  id v8;
  id v9;
  void *v10;
  id v11;
  _QWORD v12[5];
  id v13;
  uint64_t v14;

  v8 = a5;
  v9 = a3;
  +[HSItemsRequest requestWithDatabaseID:containerID:](HSItemsRequest, "requestWithDatabaseID:containerID:", objc_msgSend(v9, "databaseID"), a4);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setShouldParseResponse:", 0);
  v12[0] = MEMORY[0x24BDAC760];
  v12[1] = 3221225472;
  v12[2] = __97__ML3MusicLibrary_HSAdditions__fillContainerForHomeSharingLibrary_containerID_completionHandler___block_invoke;
  v12[3] = &unk_24C364DD0;
  v12[4] = a1;
  v13 = v8;
  v14 = a4;
  v11 = v8;
  objc_msgSend(v9, "sendRequest:withResponseHandler:", v10, v12);

}

- (void)_performImport:()HSAdditions progressHandler:completion:
{
  const void *v8;
  id v9;
  id v10;
  id v11;
  id v12;
  id v13;
  void *v14;
  void *v15;
  id v16;

  v8 = (const void *)_ML3MusicLibraryHomeSharingImportManagerKey;
  v9 = a5;
  v10 = a4;
  v11 = a3;
  objc_getAssociatedObject(a1, v8);
  v16 = (id)objc_claimAutoreleasedReturnValue();
  if (!v16)
  {
    v16 = objc_alloc_init(MEMORY[0x24BE6B1C0]);
    objc_setAssociatedObject(a1, (const void *)_ML3MusicLibraryHomeSharingImportManagerKey, v16, (void *)1);
  }
  v12 = objc_alloc_init(MEMORY[0x24BE6B1C8]);
  v13 = objc_alloc(MEMORY[0x24BE6B1F0]);
  objc_msgSend(MEMORY[0x24BE6B190], "processClient");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = (void *)objc_msgSend(v13, "initWithDatabaseImport:library:writer:client:", v11, a1, v12, v14);

  objc_msgSend(v16, "performImport:fromSource:progressBlock:withCompletionHandler:", v15, 3, v10, v9);
}

- (uint64_t)executeUpdateSQL:()HSAdditions
{
  id v4;
  id v5;
  uint64_t v6;
  _QWORD v8[4];
  id v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  char v14;

  v4 = a3;
  v11 = 0;
  v12 = &v11;
  v13 = 0x2020000000;
  v14 = 0;
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __49__ML3MusicLibrary_HSAdditions__executeUpdateSQL___block_invoke;
  v8[3] = &unk_24C364DF8;
  v10 = &v11;
  v5 = v4;
  v9 = v5;
  objc_msgSend(a1, "databaseConnectionAllowingWrites:withBlock:", 1, v8);
  v6 = *((unsigned __int8 *)v12 + 24);

  _Block_object_dispose(&v11, 8);
  return v6;
}

- (void)checkForChangesInHomeSharingLibrary:()HSAdditions completionHandler:
{
  id v6;
  dispatch_group_t v7;
  dispatch_queue_t v8;
  uint64_t v9;
  NSObject *v10;
  NSObject *v11;
  void *v12;
  NSObject *v13;
  id v14;
  id v15;
  id v16;
  _QWORD *v17;
  id v18;
  void *v19;
  void *v20;
  void *v21;
  _QWORD *v22;
  id v23;
  id v24;
  id v25;
  id v26;
  _QWORD block[4];
  id v28;
  _QWORD *v29;
  _QWORD *v30;
  _QWORD v31[5];
  _QWORD v32[4];
  NSObject *v33;
  id v34;
  void *v35;
  id v36;
  id v37;
  _QWORD *v38;
  _QWORD v39[4];
  NSObject *v40;
  NSObject *v41;
  _QWORD *v42;
  _QWORD v43[3];
  char v44;
  _QWORD v45[5];
  id v46;
  _QWORD v47[4];
  id v48;
  id v49;
  id v50;

  v6 = a3;
  v26 = a4;
  v7 = dispatch_group_create();
  v8 = dispatch_queue_create("com.apple.mobileipod.SharingChangeUpdate", 0);
  v45[0] = 0;
  v45[1] = v45;
  v45[2] = 0x3032000000;
  v45[3] = __Block_byref_object_copy__1728;
  v45[4] = __Block_byref_object_dispose__1729;
  v46 = 0;
  v43[0] = 0;
  v43[1] = v43;
  v43[2] = 0x2020000000;
  v44 = 0;
  v9 = MEMORY[0x24BDAC760];
  v39[0] = MEMORY[0x24BDAC760];
  v39[1] = 3221225472;
  v39[2] = __86__ML3MusicLibrary_HSAdditions__checkForChangesInHomeSharingLibrary_completionHandler___block_invoke;
  v39[3] = &unk_24C364E48;
  v10 = v8;
  v40 = v10;
  v42 = v45;
  v11 = v7;
  v41 = v11;
  v12 = (void *)MEMORY[0x20BD2BA98](v39);
  dispatch_group_enter(v11);
  v32[0] = v9;
  v32[1] = 3221225472;
  v32[2] = __86__ML3MusicLibrary_HSAdditions__checkForChangesInHomeSharingLibrary_completionHandler___block_invoke_4;
  v32[3] = &unk_24C364EB0;
  v13 = v11;
  v33 = v13;
  v14 = v6;
  v34 = v14;
  v35 = a1;
  v36 = v12;
  v37 = &__block_literal_global_1730;
  v38 = v43;
  v15 = a1;
  v16 = v36;
  v17 = v32;
  v18 = v14;
  +[HSContainersRequest requestWithDatabaseID:](HSContainersRequest, "requestWithDatabaseID:", objc_msgSend(v18, "databaseID"));
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:", CFSTR("dmap.itemid"), 0);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "componentsJoinedByString:", CFSTR(","));
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "setValue:forArgument:", v21, CFSTR("meta"));

  objc_msgSend(v19, "setShouldParseResponse:", 0);
  v47[0] = v9;
  v47[1] = 3221225472;
  v47[2] = __UpdateContainers_block_invoke;
  v47[3] = &unk_24C3650A8;
  v48 = v15;
  v49 = v16;
  v50 = v17;
  v22 = v17;
  v23 = v15;
  v24 = v16;
  objc_msgSend(v18, "sendRequest:withResponseHandler:", v19, v47);

  dispatch_group_enter(v13);
  v31[0] = v9;
  v31[1] = 3221225472;
  v31[2] = __86__ML3MusicLibrary_HSAdditions__checkForChangesInHomeSharingLibrary_completionHandler___block_invoke_5;
  v31[3] = &unk_24C364ED8;
  v31[4] = v43;
  UpdateItems(v18, v23, v13, v24, &__block_literal_global_1730, v31, 0);
  block[0] = v9;
  block[1] = 3221225472;
  block[2] = __86__ML3MusicLibrary_HSAdditions__checkForChangesInHomeSharingLibrary_completionHandler___block_invoke_6;
  block[3] = &unk_24C364F00;
  v28 = v26;
  v29 = v43;
  v30 = v45;
  v25 = v26;
  dispatch_group_notify(v13, v10, block);

  _Block_object_dispose(v43, 8);
  _Block_object_dispose(v45, 8);

}

+ (uint64_t)buildDatabaseFromHomeSharingLibrary:()HSAdditions atPath:completionHandler:
{
  return objc_msgSend(a1, "buildDatabaseFromHomeSharingLibrary:atPath:completionHandler:progressHandler:", a3, a4, a5, 0);
}

+ (void)buildDatabaseFromHomeSharingLibrary:()HSAdditions atPath:completionHandler:progressHandler:
{
  id v9;
  id v10;
  id v11;
  void *v12;
  dispatch_group_t v13;
  dispatch_queue_t v14;
  uint64_t v15;
  id v16;
  void *v17;
  NSObject *v18;
  NSObject *v19;
  void *v20;
  dispatch_semaphore_t v21;
  _QWORD *v22;
  id v23;
  id v24;
  void *v25;
  id v26;
  _QWORD block[4];
  id v28;
  id v29;
  uint64_t *v30;
  _QWORD *v31;
  _QWORD v32[6];
  _QWORD v33[6];
  _QWORD v34[5];
  uint64_t v35;
  uint64_t *v36;
  uint64_t v37;
  char v38;
  _QWORD v39[4];
  NSObject *v40;
  NSObject *v41;
  uint64_t *v42;
  _QWORD v43[4];
  id v44;
  _QWORD *v45;
  _QWORD v46[3];
  int v47;
  uint64_t v48;
  uint64_t *v49;
  uint64_t v50;
  uint64_t (*v51)(uint64_t, uint64_t);
  void (*v52)(uint64_t);
  id v53;

  v26 = a3;
  v9 = a4;
  v10 = a5;
  v11 = a6;
  v25 = v9;
  v12 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BE6B1D0]), "initWithPath:", v9);
  objc_msgSend(v12, "setIsHomeSharingLibrary:", 1);
  v48 = 0;
  v49 = &v48;
  v50 = 0x3032000000;
  v51 = __Block_byref_object_copy__1728;
  v52 = __Block_byref_object_dispose__1729;
  v53 = 0;
  v46[0] = 0;
  v46[1] = v46;
  v46[2] = 0x2020000000;
  v47 = 0;
  v13 = dispatch_group_create();
  v14 = dispatch_queue_create("com.apple.MusicLibrary.SharingBuild", 0);
  v15 = MEMORY[0x24BDAC760];
  v43[0] = MEMORY[0x24BDAC760];
  v43[1] = 3221225472;
  v43[2] = __109__ML3MusicLibrary_HSAdditions__buildDatabaseFromHomeSharingLibrary_atPath_completionHandler_progressHandler___block_invoke;
  v43[3] = &unk_24C364F28;
  v16 = v11;
  v44 = v16;
  v45 = v46;
  v17 = (void *)MEMORY[0x20BD2BA98](v43);
  v39[0] = v15;
  v39[1] = 3221225472;
  v39[2] = __109__ML3MusicLibrary_HSAdditions__buildDatabaseFromHomeSharingLibrary_atPath_completionHandler_progressHandler___block_invoke_2;
  v39[3] = &unk_24C364E48;
  v18 = v14;
  v40 = v18;
  v42 = &v48;
  v19 = v13;
  v41 = v19;
  v20 = (void *)MEMORY[0x20BD2BA98](v39);
  v35 = 0;
  v36 = &v35;
  v37 = 0x2020000000;
  v38 = 0;
  v34[0] = v15;
  v34[1] = 3221225472;
  v34[2] = __109__ML3MusicLibrary_HSAdditions__buildDatabaseFromHomeSharingLibrary_atPath_completionHandler_progressHandler___block_invoke_4;
  v34[3] = &unk_24C364F50;
  v34[4] = &v35;
  objc_msgSend(v12, "databaseConnectionAllowingWrites:withBlock:", 0, v34);
  v21 = dispatch_semaphore_create(0);
  dispatch_group_enter(v19);
  if (*((_BYTE *)v36 + 24))
  {
    v33[0] = v15;
    v33[1] = 3221225472;
    v33[2] = __109__ML3MusicLibrary_HSAdditions__buildDatabaseFromHomeSharingLibrary_atPath_completionHandler_progressHandler___block_invoke_6;
    v33[3] = &unk_24C364FB8;
    v33[5] = &v48;
    v22 = v33;
    v33[4] = v21;
    UpdateItems(v26, v12, v19, v20, v17, &__block_literal_global_22, v33);
  }
  else
  {
    v32[0] = v15;
    v32[1] = 3221225472;
    v32[2] = __109__ML3MusicLibrary_HSAdditions__buildDatabaseFromHomeSharingLibrary_atPath_completionHandler_progressHandler___block_invoke_7;
    v32[3] = &unk_24C364FB8;
    v32[5] = &v48;
    v22 = v32;
    v32[4] = v21;
    BuildItems(v26, v12, 0, v20, v17, v32);
  }

  dispatch_semaphore_wait(v21, 0xFFFFFFFFFFFFFFFFLL);
  if (!v49[5])
  {
    dispatch_group_enter(v19);
    BuildContainers(v26, v12, v20, v17);
  }
  block[0] = v15;
  block[1] = 3221225472;
  block[2] = __109__ML3MusicLibrary_HSAdditions__buildDatabaseFromHomeSharingLibrary_atPath_completionHandler_progressHandler___block_invoke_8;
  block[3] = &unk_24C364FE0;
  v28 = v12;
  v29 = v10;
  v30 = &v48;
  v31 = v46;
  v23 = v10;
  v24 = v12;
  dispatch_group_notify(v19, v18, block);

  _Block_object_dispose(&v35, 8);
  _Block_object_dispose(v46, 8);
  _Block_object_dispose(&v48, 8);

}

@end
