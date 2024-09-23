@implementation AVTCoreDataPersistentStoreLocalConfiguration

void __63___AVTCoreDataPersistentStoreLocalConfiguration_setupIfNeeded___block_invoke(_QWORD *a1, uint64_t a2, void *a3)
{
  void *v5;
  void *v6;
  id v7;

  v7 = a3;
  if (v7)
  {
    *(_BYTE *)(*(_QWORD *)(a1[5] + 8) + 24) = 0;
    objc_storeStrong((id *)(*(_QWORD *)(a1[6] + 8) + 40), a3);
    v5 = (void *)a1[4];
    objc_msgSend(v7, "description");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "logErrorAddingPersistentStore:", v6);

  }
}

void __66___AVTCoreDataPersistentStoreLocalConfiguration_copyStorageAside___block_invoke(uint64_t a1)
{
  id v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  int v7;
  uint64_t v8;
  char v9;
  void *v10;
  uint64_t v11;
  char v12;
  id v13;
  id obj;

  v2 = objc_alloc_init(MEMORY[0x24BDD1580]);
  v3 = (void *)objc_opt_class();
  objc_msgSend(*(id *)(a1 + 32), "storeLocation");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "sideDatabaseFolderForStoreLocation:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "path");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v2, "fileExistsAtPath:", v6);

  if (!v7
    || (v8 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8),
        obj = *(id *)(v8 + 40),
        v9 = objc_msgSend(v2, "removeItemAtURL:error:", v5, &obj),
        objc_storeStrong((id *)(v8 + 40), obj),
        (*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = v9) != 0))
  {
    objc_msgSend(*(id *)(a1 + 32), "folderLocation");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
    v13 = *(id *)(v11 + 40);
    v12 = objc_msgSend(v2, "copyItemAtURL:toURL:error:", v10, v5, &v13);
    objc_storeStrong((id *)(v11 + 40), v13);
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = v12;

  }
}

void __102___AVTCoreDataPersistentStoreLocalConfiguration_updateBackupInclusionStatusOnQueue_completionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  id v8;
  uint64_t v9;
  id v10;
  id v11;
  _QWORD v12[4];
  id v13;
  id v14;
  uint64_t v15;
  id v16;

  v5 = a2;
  v6 = a3;
  v7 = *(NSObject **)(a1 + 32);
  v12[0] = MEMORY[0x24BDAC760];
  v12[1] = 3221225472;
  v12[2] = __102___AVTCoreDataPersistentStoreLocalConfiguration_updateBackupInclusionStatusOnQueue_completionHandler___block_invoke_2;
  v12[3] = &unk_24DD32C88;
  v13 = v5;
  v8 = *(id *)(a1 + 48);
  v9 = *(_QWORD *)(a1 + 40);
  v14 = v6;
  v15 = v9;
  v16 = v8;
  v10 = v6;
  v11 = v5;
  dispatch_async(v7, v12);

}

void __102___AVTCoreDataPersistentStoreLocalConfiguration_updateBackupInclusionStatusOnQueue_completionHandler___block_invoke_2(uint64_t a1)
{
  void *v2;
  void *v3;
  uint64_t v4;
  int v5;
  id v6;
  id v7;
  char v8;
  id v9;
  void *v10;
  void *v11;
  int v12;
  uint64_t *v13;
  uint64_t v14;
  id v15;
  uint64_t v16;
  id v17;
  uint64_t (**v18)(_QWORD, _QWORD, _QWORD);
  uint64_t v19;
  int v20;
  id v21;
  uint64_t v22;
  unsigned int v23;
  id v24;
  uint64_t v25;
  id v26;
  id v27;
  id v28;
  _QWORD v29[4];
  id v30;
  uint64_t v31;
  id v32;
  uint64_t v33;
  id v34;
  id v35;
  id v36;

  if (!*(_QWORD *)(a1 + 32))
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 56) + 16))();
    return;
  }
  objc_msgSend(*(id *)(a1 + 48), "logger");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "logUpdatingBackupExclusionStatus:", objc_msgSend(*(id *)(a1 + 32), "BOOLValue"));

  objc_msgSend(*(id *)(a1 + 48), "folderLocation");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v36 = 0;
  v4 = *MEMORY[0x24BDBCC68];
  v35 = 0;
  v5 = objc_msgSend(v3, "getResourceValue:forKey:error:", &v36, v4, &v35);
  v6 = v36;
  v7 = v35;
  if (!v5)
  {
    objc_msgSend(*(id *)(a1 + 48), "logger");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "description");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "logErrorMigratingBackupInclusionStatus:", v11);
    goto LABEL_9;
  }
  if (objc_msgSend(v6, "BOOLValue"))
  {
    v34 = v7;
    v8 = objc_msgSend(v3, "setResourceValue:forKey:error:", MEMORY[0x24BDBD1C0], v4, &v34);
    v9 = v34;

    if ((v8 & 1) != 0)
    {
      v7 = v9;
      goto LABEL_10;
    }
    objc_msgSend(*(id *)(a1 + 48), "logger");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "description");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "logErrorMigratingBackupInclusionStatus:", v11);
    v7 = v9;
LABEL_9:

  }
LABEL_10:
  v12 = objc_msgSend(*(id *)(a1 + 32), "BOOLValue");
  v13 = (uint64_t *)MEMORY[0x24BDBD270];
  if (!v12)
    v13 = (uint64_t *)MEMORY[0x24BDBD268];
  v14 = *v13;
  v29[0] = MEMORY[0x24BDAC760];
  v29[1] = 3221225472;
  v29[2] = __102___AVTCoreDataPersistentStoreLocalConfiguration_updateBackupInclusionStatusOnQueue_completionHandler___block_invoke_3;
  v29[3] = &unk_24DD32C60;
  v15 = v3;
  v33 = v14;
  v16 = *(_QWORD *)(a1 + 48);
  v30 = v15;
  v31 = v16;
  v17 = v7;
  v32 = v17;
  v18 = (uint64_t (**)(_QWORD, _QWORD, _QWORD))MEMORY[0x22074B1E8](v29);
  v19 = *MEMORY[0x24BDBD218];
  v28 = 0;
  v20 = ((uint64_t (**)(_QWORD, uint64_t, id *))v18)[2](v18, v19, &v28);
  v21 = v28;
  v22 = *MEMORY[0x24BDBD220];
  v27 = 0;
  v23 = ((uint64_t (**)(_QWORD, uint64_t, id *))v18)[2](v18, v22, &v27);
  v24 = v27;
  v25 = *(_QWORD *)(a1 + 56);
  if (v25)
  {
    if (v20)
      v26 = v24;
    else
      v26 = v21;
    (*(void (**)(uint64_t, _QWORD, id))(v25 + 16))(v25, v20 & v23, v26);
  }

}

BOOL __102___AVTCoreDataPersistentStoreLocalConfiguration_updateBackupInclusionStatusOnQueue_completionHandler___block_invoke_3(uint64_t a1, const __CFString *a2, _QWORD *a3)
{
  int v5;
  void *v6;
  void *v7;
  CFErrorRef error;

  error = 0;
  v5 = CFURLSetResourcePropertyForKey(*(CFURLRef *)(a1 + 32), a2, *(CFTypeRef *)(a1 + 56), &error);
  if (!v5)
  {
    if (a3 && error)
      *a3 = error;
    error = 0;
    objc_msgSend(*(id *)(a1 + 40), "logger");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 48), "description");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "logErrorUpdatingBackupInclusionStatus:", v7);

  }
  return v5 != 0;
}

@end
