@implementation PTPCameraDeviceManager

- (PTPCameraDeviceManager)init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)PTPCameraDeviceManager;
  return -[ICDeviceManager init](&v3, sel_init);
}

- (void)notifyAddedItems:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  __CFString *v9;
  void *v10;
  void *v11;
  NSObject *v12;
  uint64_t v13;
  _QWORD v14[4];
  __CFString *v15;
  PTPCameraDeviceManager *v16;
  uint64_t *v17;
  uint64_t v18;
  uint64_t *v19;
  uint64_t v20;
  uint64_t (*v21)(uint64_t, uint64_t);
  void (*v22)(uint64_t);
  id v23;
  uint8_t buf[4];
  uint64_t v25;
  __int16 v26;
  void *v27;
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(MEMORY[0x1E0CB3B38], "currentConnection");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = 0;
  v19 = &v18;
  v20 = 0x3032000000;
  v21 = __Block_byref_object_copy__4;
  v22 = __Block_byref_object_dispose__4;
  -[ICDeviceManager deviceForConnection:](self, "deviceForConnection:", v5);
  v23 = (id)objc_claimAutoreleasedReturnValue();
  v6 = (void *)v19[5];
  if (!v6)
  {
    __ICOSLogCreate();
    if ((unint64_t)objc_msgSend(CFSTR("error"), "length") < 0x15)
    {
      v9 = CFSTR("error");
    }
    else
    {
      objc_msgSend(CFSTR("error"), "substringWithRange:", 0, 18);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "stringByAppendingString:", CFSTR(".."));
      v9 = (__CFString *)objc_claimAutoreleasedReturnValue();

    }
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("the device is nil? how?"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = (id)_gICOSLog;
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      v13 = -[__CFString UTF8String](objc_retainAutorelease(v9), "UTF8String");
      *(_DWORD *)buf = 136446466;
      v25 = v13;
      v26 = 2114;
      v27 = v11;
      _os_log_impl(&dword_1B98FC000, v12, OS_LOG_TYPE_DEFAULT, "%{public}20s | %{public}@", buf, 0x16u);
    }

    goto LABEL_10;
  }
  if (objc_msgSend(v6, "hasOpenSession"))
  {
    v7 = (void *)MEMORY[0x1E0CB34C8];
    v14[0] = MEMORY[0x1E0C809B0];
    v14[1] = 3221225472;
    v14[2] = __43__PTPCameraDeviceManager_notifyAddedItems___block_invoke;
    v14[3] = &unk_1E70C73E0;
    v16 = self;
    v17 = &v18;
    v15 = (__CFString *)v4;
    objc_msgSend(v7, "blockOperationWithBlock:", v14);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[ICDeviceManager addInteractiveOperation:](self, "addInteractiveOperation:", v8);

    v9 = v15;
LABEL_10:

  }
  _Block_object_dispose(&v18, 8);

}

void __43__PTPCameraDeviceManager_notifyAddedItems___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t i;
  PTPObjectInfoDataset *v7;
  void *v8;
  int v9;
  void *v10;
  uint64_t v11;
  void *v12;
  ICCameraFolder *v13;
  void *v14;
  ICCameraFolder *v15;
  void *v16;
  void *v17;
  ICCameraFile *v18;
  void *v19;
  unsigned int v20;
  id v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  _BYTE v26[128];
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v21 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:", CFSTR("ICPTPObjectInfoArray"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = 0u;
  v23 = 0u;
  v24 = 0u;
  v25 = 0u;
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v23;
    do
    {
      for (i = 0; i != v4; ++i)
      {
        if (*(_QWORD *)v23 != v5)
          objc_enumerationMutation(v2);
        v7 = -[PTPObjectInfoDataset initWithData:contentType:]([PTPObjectInfoDataset alloc], "initWithData:contentType:", *(_QWORD *)(*((_QWORD *)&v22 + 1) + 8 * i), 2);
        objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), "cameraFolderWithObjectID:", -[PTPObjectInfoDataset parentObject](v7, "parentObject"));
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        if (v7)
        {
          v9 = -[PTPObjectInfoDataset objectFormat](v7, "objectFormat");
          v10 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40);
          v11 = -[PTPObjectInfoDataset objectHandle](v7, "objectHandle");
          if (v9 == 12289)
          {
            objc_msgSend(v10, "cameraFolderWithObjectID:", v11);
            v12 = (void *)objc_claimAutoreleasedReturnValue();

            if (v12)
              goto LABEL_12;
            v13 = [ICCameraFolder alloc];
            -[PTPObjectInfoDataset filename](v7, "filename");
            v14 = (void *)objc_claimAutoreleasedReturnValue();
            v15 = -[ICCameraFolder initWithName:parentFolder:device:](v13, "initWithName:parentFolder:device:", v14, v8, *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40));

            objc_msgSend(*(id *)(a1 + 40), "updateCameraFolder:withInfo:", v15, v7);
            if (v8)
            {
              v16 = v8;
              goto LABEL_18;
            }
            v20 = -[PTPObjectInfoDataset storageID](v7, "storageID");
            if (v20 == -[PTPObjectInfoDataset parentObject](v7, "parentObject"))
            {
              v16 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40);
LABEL_18:
              objc_msgSend(v16, "addFolder:", v15);
            }
            objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), "addCameraFolderToIndex:", v15);
          }
          else
          {
            objc_msgSend(v10, "cameraFileWithObjectID:", v11);
            v17 = (void *)objc_claimAutoreleasedReturnValue();

            if (v17)
            {
LABEL_12:
              objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), "setPreviouslyIndexed:", objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), "previouslyIndexed") + 1);
              goto LABEL_21;
            }
            v18 = [ICCameraFile alloc];
            -[PTPObjectInfoDataset filename](v7, "filename");
            v19 = (void *)objc_claimAutoreleasedReturnValue();
            v15 = -[ICCameraFile initWithName:parentFolder:device:](v18, "initWithName:parentFolder:device:", v19, v8, *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40));

            objc_msgSend(*(id *)(a1 + 40), "updateCameraFile:withInfo:", v15, v7);
            if (v8)
              objc_msgSend(v8, "addFile:", v15);
            objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), "addCameraFileToIndex:", v15);
            objc_msgSend(v21, "addObject:", v15);
          }

        }
LABEL_21:

      }
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
    }
    while (v4);
  }
  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), "addItems:", v21);

}

- (void)notifyRemovedItems:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  __CFString *v8;
  void *v9;
  void *v10;
  NSObject *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void (*v15)(uint64_t);
  void *v16;
  __CFString *v17;
  uint64_t *v18;
  uint64_t v19;
  uint64_t *v20;
  uint64_t v21;
  uint64_t (*v22)(uint64_t, uint64_t);
  void (*v23)(uint64_t);
  id v24;
  uint8_t buf[4];
  uint64_t v26;
  __int16 v27;
  void *v28;
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(MEMORY[0x1E0CB3B38], "currentConnection");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = 0;
  v20 = &v19;
  v21 = 0x3032000000;
  v22 = __Block_byref_object_copy__4;
  v23 = __Block_byref_object_dispose__4;
  -[ICDeviceManager deviceForConnection:](self, "deviceForConnection:", v5);
  v24 = (id)objc_claimAutoreleasedReturnValue();
  if (v20[5])
  {
    v6 = (void *)MEMORY[0x1E0CB34C8];
    v13 = MEMORY[0x1E0C809B0];
    v14 = 3221225472;
    v15 = __45__PTPCameraDeviceManager_notifyRemovedItems___block_invoke;
    v16 = &unk_1E70C7408;
    v17 = (__CFString *)v4;
    v18 = &v19;
    objc_msgSend(v6, "blockOperationWithBlock:", &v13);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[ICDeviceManager addInteractiveOperation:](self, "addInteractiveOperation:", v7, v13, v14, v15, v16);

    v8 = v17;
  }
  else
  {
    __ICOSLogCreate();
    if ((unint64_t)objc_msgSend(CFSTR("error"), "length") < 0x15)
    {
      v8 = CFSTR("error");
    }
    else
    {
      objc_msgSend(CFSTR("error"), "substringWithRange:", 0, 18);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "stringByAppendingString:", CFSTR(".."));
      v8 = (__CFString *)objc_claimAutoreleasedReturnValue();

    }
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("the device is nil? how?"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = (id)_gICOSLog;
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      v12 = -[__CFString UTF8String](objc_retainAutorelease(v8), "UTF8String");
      *(_DWORD *)buf = 136446466;
      v26 = v12;
      v27 = 2114;
      v28 = v10;
      _os_log_impl(&dword_1B98FC000, v11, OS_LOG_TYPE_DEFAULT, "%{public}20s | %{public}@", buf, 0x16u);
    }

  }
  _Block_object_dispose(&v19, 8);

}

void __45__PTPCameraDeviceManager_notifyRemovedItems___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;

  objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:", CFSTR("ICObjectIDArray"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (v2)
  {
    v3 = v2;
    objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), "removeItems:", v2);
    v2 = v3;
  }

}

- (void)notifyUpdatedItems:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  __CFString *v9;
  void *v10;
  void *v11;
  NSObject *v12;
  uint64_t v13;
  _QWORD v14[4];
  __CFString *v15;
  PTPCameraDeviceManager *v16;
  uint64_t *v17;
  uint64_t v18;
  uint64_t *v19;
  uint64_t v20;
  uint64_t (*v21)(uint64_t, uint64_t);
  void (*v22)(uint64_t);
  id v23;
  uint8_t buf[4];
  uint64_t v25;
  __int16 v26;
  void *v27;
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(MEMORY[0x1E0CB3B38], "currentConnection");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = 0;
  v19 = &v18;
  v20 = 0x3032000000;
  v21 = __Block_byref_object_copy__4;
  v22 = __Block_byref_object_dispose__4;
  -[ICDeviceManager deviceForConnection:](self, "deviceForConnection:", v5);
  v23 = (id)objc_claimAutoreleasedReturnValue();
  v6 = (void *)v19[5];
  if (!v6)
  {
    __ICOSLogCreate();
    if ((unint64_t)objc_msgSend(CFSTR("error"), "length") < 0x15)
    {
      v9 = CFSTR("error");
    }
    else
    {
      objc_msgSend(CFSTR("error"), "substringWithRange:", 0, 18);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "stringByAppendingString:", CFSTR(".."));
      v9 = (__CFString *)objc_claimAutoreleasedReturnValue();

    }
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("the device is nil? how?"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = (id)_gICOSLog;
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      v13 = -[__CFString UTF8String](objc_retainAutorelease(v9), "UTF8String");
      *(_DWORD *)buf = 136446466;
      v25 = v13;
      v26 = 2114;
      v27 = v11;
      _os_log_impl(&dword_1B98FC000, v12, OS_LOG_TYPE_DEFAULT, "%{public}20s | %{public}@", buf, 0x16u);
    }

    goto LABEL_10;
  }
  if (objc_msgSend(v6, "hasOpenSession"))
  {
    v7 = (void *)MEMORY[0x1E0CB34C8];
    v14[0] = MEMORY[0x1E0C809B0];
    v14[1] = 3221225472;
    v14[2] = __45__PTPCameraDeviceManager_notifyUpdatedItems___block_invoke;
    v14[3] = &unk_1E70C73E0;
    v16 = self;
    v17 = &v18;
    v15 = (__CFString *)v4;
    objc_msgSend(v7, "blockOperationWithBlock:", v14);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[ICDeviceManager addInteractiveOperation:](self, "addInteractiveOperation:", v8);

    v9 = v15;
LABEL_10:

  }
  _Block_object_dispose(&v18, 8);

}

void __45__PTPCameraDeviceManager_notifyUpdatedItems___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  PTPObjectInfoDataset *v7;
  PTPObjectInfoDataset *v8;
  void *v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:", CFSTR("ICPTPObjectInfoArray"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v11;
    do
    {
      v6 = 0;
      do
      {
        if (*(_QWORD *)v11 != v5)
          objc_enumerationMutation(v2);
        v7 = -[PTPObjectInfoDataset initWithData:contentType:]([PTPObjectInfoDataset alloc], "initWithData:contentType:", *(_QWORD *)(*((_QWORD *)&v10 + 1) + 8 * v6), 2);
        v8 = v7;
        if (v7)
        {
          objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), "cameraFileWithObjectID:", -[PTPObjectInfoDataset objectHandle](v7, "objectHandle"));
          v9 = (void *)objc_claimAutoreleasedReturnValue();
          if (v9)
            objc_msgSend(*(id *)(a1 + 40), "updateCameraFile:withInfo:", v9, v8);

        }
        ++v6;
      }
      while (v4 != v6);
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    }
    while (v4);
  }

}

- (void)notifyPtpEvent:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  __CFString *v7;
  __CFString *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  NSObject *v14;
  uint64_t v15;
  uint64_t v16;
  void (*v17)(uint64_t);
  void *v18;
  __CFString *v19;
  PTPCameraDeviceManager *v20;
  uint8_t buf[4];
  uint64_t v22;
  __int16 v23;
  void *v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(MEMORY[0x1E0CB3B38], "currentConnection");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICDeviceManager deviceForConnection:](self, "deviceForConnection:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v6)
  {
    __ICOSLogCreate();
    v8 = CFSTR("error");
    if ((unint64_t)objc_msgSend(CFSTR("error"), "length") >= 0x15)
    {
      objc_msgSend(CFSTR("error"), "substringWithRange:", 0, 18);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "stringByAppendingString:", CFSTR(".."));
      v8 = (__CFString *)objc_claimAutoreleasedReturnValue();

    }
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("the device is nil? how?"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = (void *)_gICOSLog;
    if (os_log_type_enabled((os_log_t)_gICOSLog, OS_LOG_TYPE_DEFAULT))
    {
      v8 = objc_retainAutorelease(v8);
      v14 = v13;
      *(_DWORD *)buf = 136446466;
      v22 = -[__CFString UTF8String](v8, "UTF8String");
      v23 = 2114;
      v24 = v11;
      _os_log_impl(&dword_1B98FC000, v14, OS_LOG_TYPE_DEFAULT, "%{public}20s | %{public}@", buf, 0x16u);

    }
    goto LABEL_8;
  }
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("ICPTPEvent"));
  v7 = (__CFString *)objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (v7)
  {
    v9 = (void *)MEMORY[0x1E0CB34C8];
    v15 = MEMORY[0x1E0C809B0];
    v16 = 3221225472;
    v17 = __41__PTPCameraDeviceManager_notifyPtpEvent___block_invoke;
    v18 = &unk_1E70C71C0;
    v8 = v7;
    v19 = v8;
    v20 = self;
    objc_msgSend(v9, "blockOperationWithBlock:", &v15);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[ICDeviceManager addInteractiveOperation:](self, "addInteractiveOperation:", v10, v15, v16, v17, v18);

    v11 = v19;
LABEL_8:

  }
}

void __41__PTPCameraDeviceManager_notifyPtpEvent___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  _OWORD v7[4];
  _BYTE v8[128];
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  if (*(_QWORD *)(a1 + 32))
  {
    memset(v7, 0, sizeof(v7));
    objc_msgSend(*(id *)(a1 + 40), "devices", 0);
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "allKeys");
    v3 = (void *)objc_claimAutoreleasedReturnValue();

    if (objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", v7, v8, 16))
    {
      v4 = **((_QWORD **)&v7[0] + 1);
      objc_msgSend(*(id *)(a1 + 40), "devices");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "objectForKeyedSubscript:", v4);
      v6 = (void *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      v6 = 0;
    }

    objc_msgSend(v6, "handlePtpEvent:", *(_QWORD *)(a1 + 32));
  }
}

- (void)notifyStatus:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  __CFString *v8;
  void *v9;
  void *v10;
  NSObject *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t (*v15)(uint64_t);
  void *v16;
  __CFString *v17;
  uint64_t *v18;
  uint64_t v19;
  uint64_t *v20;
  uint64_t v21;
  uint64_t (*v22)(uint64_t, uint64_t);
  void (*v23)(uint64_t);
  id v24;
  uint8_t buf[4];
  uint64_t v26;
  __int16 v27;
  void *v28;
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(MEMORY[0x1E0CB3B38], "currentConnection");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = 0;
  v20 = &v19;
  v21 = 0x3032000000;
  v22 = __Block_byref_object_copy__4;
  v23 = __Block_byref_object_dispose__4;
  -[ICDeviceManager deviceForConnection:](self, "deviceForConnection:", v5);
  v24 = (id)objc_claimAutoreleasedReturnValue();
  if (v20[5])
  {
    v6 = (void *)MEMORY[0x1E0CB34C8];
    v13 = MEMORY[0x1E0C809B0];
    v14 = 3221225472;
    v15 = __39__PTPCameraDeviceManager_notifyStatus___block_invoke;
    v16 = &unk_1E70C7408;
    v17 = (__CFString *)v4;
    v18 = &v19;
    objc_msgSend(v6, "blockOperationWithBlock:", &v13);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[ICDeviceManager addInteractiveOperation:](self, "addInteractiveOperation:", v7, v13, v14, v15, v16);

    v8 = v17;
  }
  else
  {
    __ICOSLogCreate();
    if ((unint64_t)objc_msgSend(CFSTR("error"), "length") < 0x15)
    {
      v8 = CFSTR("error");
    }
    else
    {
      objc_msgSend(CFSTR("error"), "substringWithRange:", 0, 18);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "stringByAppendingString:", CFSTR(".."));
      v8 = (__CFString *)objc_claimAutoreleasedReturnValue();

    }
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("the device is nil? how?"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = (id)_gICOSLog;
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      v12 = -[__CFString UTF8String](objc_retainAutorelease(v8), "UTF8String");
      *(_DWORD *)buf = 136446466;
      v26 = v12;
      v27 = 2114;
      v28 = v10;
      _os_log_impl(&dword_1B98FC000, v11, OS_LOG_TYPE_DEFAULT, "%{public}20s | %{public}@", buf, 0x16u);
    }

  }
  _Block_object_dispose(&v19, 8);

}

uint64_t __39__PTPCameraDeviceManager_notifyStatus___block_invoke(uint64_t result)
{
  if (*(_QWORD *)(result + 32))
    return objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(result + 40) + 8) + 40), "handleStatusNotification:");
  return result;
}

- (void)addSelectorToInterface:(id)a3 selectorString:(id)a4 origin:(BOOL)a5
{
  _BOOL8 v5;
  uint64_t v7;
  NSString *v8;
  uint64_t v9;
  SEL v10;
  id v11;

  v5 = a5;
  v7 = addSelectorToInterface_selectorString_origin__onceToken_1;
  v8 = (NSString *)a4;
  v11 = a3;
  if (v7 != -1)
    dispatch_once(&addSelectorToInterface_selectorString_origin__onceToken_1, &__block_literal_global_8);
  v9 = addSelectorToInterface_selectorString_origin__incomingClasses_1;
  v10 = NSSelectorFromString(v8);

  objc_msgSend(v11, "setClasses:forSelector:argumentIndex:ofReply:", v9, v10, 0, v5);
}

void __71__PTPCameraDeviceManager_addSelectorToInterface_selectorString_origin___block_invoke()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  id v12;

  v12 = objc_alloc(MEMORY[0x1E0C99E60]);
  v0 = objc_opt_class();
  v1 = objc_opt_class();
  v2 = objc_opt_class();
  v3 = objc_opt_class();
  v4 = objc_opt_class();
  v5 = objc_opt_class();
  v6 = objc_opt_class();
  v7 = objc_opt_class();
  v8 = objc_opt_class();
  v9 = objc_opt_class();
  v10 = objc_msgSend(v12, "initWithObjects:", v0, v1, v2, v3, v4, v5, v6, v7, v8, v9, objc_opt_class(), 0);
  v11 = (void *)addSelectorToInterface_selectorString_origin__incomingClasses_1;
  addSelectorToInterface_selectorString_origin__incomingClasses_1 = v10;

}

- (id)deviceManagerConnection
{
  void *v3;
  void *v4;

  -[ICDeviceManager managerConnection](self, "managerConnection");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v3)
  {
    v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3B38]), "initWithMachServiceName:options:", CFSTR("com.apple.ptpcamerad"), 0);
    -[ICDeviceManager setManagerConnection:](self, "setManagerConnection:", v4);

  }
  return -[ICDeviceManager managerConnection](self, "managerConnection");
}

- (void)startDeviceWithHandle:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  __CFString *v7;
  void *v8;
  void *v9;
  void *v10;
  __CFString *v11;
  NSObject *v12;
  void *v13;
  _QWORD v14[4];
  id v15;
  PTPCameraDeviceManager *v16;
  id v17;
  uint8_t buf[4];
  uint64_t v19;
  __int16 v20;
  void *v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[ICDeviceManager devices](self, "devices");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKeyedSubscript:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    __ICOSLogCreate();
    v7 = CFSTR("device");
    if ((unint64_t)objc_msgSend(CFSTR("device"), "length") >= 0x15)
    {
      objc_msgSend(CFSTR("device"), "substringWithRange:", 0, 18);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "stringByAppendingString:", CFSTR(".."));
      v7 = (__CFString *)objc_claimAutoreleasedReturnValue();

    }
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%12s : %@"), "starting", v4);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = (void *)_gICOSLog;
    if (os_log_type_enabled((os_log_t)_gICOSLog, OS_LOG_TYPE_DEFAULT))
    {
      v11 = objc_retainAutorelease(v7);
      v12 = v10;
      *(_DWORD *)buf = 136446466;
      v19 = -[__CFString UTF8String](v11, "UTF8String");
      v20 = 2114;
      v21 = v9;
      _os_log_impl(&dword_1B98FC000, v12, OS_LOG_TYPE_DEFAULT, "%{public}20s | %{public}@", buf, 0x16u);

    }
    objc_msgSend(v6, "remoteCamera");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14[0] = MEMORY[0x1E0C809B0];
    v14[1] = 3221225472;
    v14[2] = __48__PTPCameraDeviceManager_startDeviceWithHandle___block_invoke;
    v14[3] = &unk_1E70C80D0;
    v15 = v6;
    v16 = self;
    v17 = v4;
    objc_msgSend(v13, "requestStartUsingDeviceWithReply:", v14);

  }
}

void __48__PTPCameraDeviceManager_startDeviceWithHandle___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
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
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  __CFString *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  uint64_t v37;
  void *v38;
  void *v39;
  void *v40;
  NSObject *v41;
  _QWORD block[4];
  id v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  uint8_t buf[4];
  uint64_t v49;
  __int16 v50;
  void *v51;
  _QWORD v52[2];
  _QWORD v53[2];
  const __CFString *v54;
  uint64_t v55;
  _BYTE v56[128];
  uint64_t v57;

  v57 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("ICDeviceName"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("ICDeviceAccessRestrictedAppleDevice"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "setAccessRestrictedAppleDevice:", objc_msgSend(v5, "BOOLValue"));

    objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("ICDeviceLocked"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "setLocked:", objc_msgSend(v6, "BOOLValue"));

    objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("ICDeviceAllowsSyncingClock"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "setAllowsSyncingClock:", objc_msgSend(v7, "BOOLValue"));

    objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("ICDeviceEjectable"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "setEjectable:", objc_msgSend(v8, "BOOLValue"));

    objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("ICDeviceName"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "setName:", v9);

    objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("ICDeviceType"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "setProductType:", v10);

    objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("ICDeviceProductKind"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "setProductKind:", v11);

    objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("ICDeviceTransportType"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "setTransportType:", v12);

    objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("ICDeviceUSBLocationID"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "setUsbLocationID:", objc_msgSend(v13, "intValue"));

    objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("ICDeviceUSBProductID"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "setUsbProductID:", objc_msgSend(v14, "intValue"));

    objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("ICDeviceUSBVendorID"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "setUsbVendorID:", objc_msgSend(v15, "intValue"));

    objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("ICInternalDeviceUUID"));
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "setUUIDString:", v16);

    objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("ICInternalDeviceUUID"));
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "setPersistentIDString:", v17);

    objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("ICDeviceSerialNumberString"));
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "setSerialNumberString:", v18);

    objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("ICDeviceSystemSymbolName"));
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "setSystemSymbolName:", v19);

    objc_msgSend(*(id *)(a1 + 32), "setLocationDescription:", CFSTR("ICDeviceLocationDescriptionUSB"));
    v20 = *(void **)(a1 + 32);
    objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("ICDeviceiCloudPhotosEnabled"));
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "setICloudPhotosEnabled:", objc_msgSend(v21, "BOOLValue"));

    v22 = *(void **)(a1 + 32);
    objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("ICDeviceiCloudOptimizeStorageState"));
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "setICloudPhotosOptimizeStorageState:", objc_msgSend(v23, "unsignedIntValue"));

    objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("ICDeviceSerialNumberString"));
    v24 = (void *)objc_claimAutoreleasedReturnValue();

    if (v24)
    {
      objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("ICDeviceSerialNumberString"));
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 32), "setSerialNumberString:", v25);

    }
    objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("ICDeviceCapabilities"));
    v26 = (__CFString *)objc_claimAutoreleasedReturnValue();
    v44 = 0u;
    v45 = 0u;
    v46 = 0u;
    v47 = 0u;
    v27 = -[__CFString countByEnumeratingWithState:objects:count:](v26, "countByEnumeratingWithState:objects:count:", &v44, v56, 16);
    if (v27)
    {
      v28 = v27;
      v29 = *(_QWORD *)v45;
      do
      {
        v30 = 0;
        do
        {
          if (*(_QWORD *)v45 != v29)
            objc_enumerationMutation(v26);
          objc_msgSend(*(id *)(a1 + 32), "addCapability:", *(_QWORD *)(*((_QWORD *)&v44 + 1) + 8 * v30++));
        }
        while (v28 != v30);
        v28 = -[__CFString countByEnumeratingWithState:objects:count:](v26, "countByEnumeratingWithState:objects:count:", &v44, v56, 16);
      }
      while (v28);
    }
    objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("ICMobileDeviceProperties"));
    v31 = objc_claimAutoreleasedReturnValue();
    v32 = (void *)v31;
    if (v31)
    {
      v33 = *(void **)(a1 + 32);
      v54 = CFSTR("mobdevProps");
      v55 = v31;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v55, &v54, 1);
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v33, "updateAppleProperties:", v34);

    }
    objc_msgSend(*(id *)(a1 + 32), "resetAccessRestriction");
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __48__PTPCameraDeviceManager_startDeviceWithHandle___block_invoke_2;
    block[3] = &unk_1E70C7198;
    v43 = *(id *)(a1 + 32);
    dispatch_async(MEMORY[0x1E0C80D38], block);
    v35 = *(void **)(a1 + 40);
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@:0x%x@"), CFSTR("ICDeviceOperationQueue"), objc_msgSend(*(id *)(a1 + 32), "usbLocationID"));
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v35, "setDeviceOperationQueueName:", v36);

    v37 = *(_QWORD *)(a1 + 32);
    v52[0] = CFSTR("device");
    v52[1] = CFSTR("type");
    v53[0] = v37;
    v53[1] = CFSTR("ICDeviceAdded");
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v53, v52, 2);
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 40), "performSelectorOnMainThread:withObject:waitUntilDone:", sel_postNotification_, v38, 0);

  }
  else
  {
    __ICOSLogCreate();
    v26 = CFSTR("device");
    if ((unint64_t)objc_msgSend(CFSTR("device"), "length") >= 0x15)
    {
      objc_msgSend(CFSTR("device"), "substringWithRange:", 0, 18);
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v39, "stringByAppendingString:", CFSTR(".."));
      v26 = (__CFString *)objc_claimAutoreleasedReturnValue();

    }
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%12s : %@"), "failed to start", *(_QWORD *)(a1 + 48));
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    v40 = (void *)_gICOSLog;
    if (os_log_type_enabled((os_log_t)_gICOSLog, OS_LOG_TYPE_DEFAULT))
    {
      v26 = objc_retainAutorelease(v26);
      v41 = v40;
      *(_DWORD *)buf = 136446466;
      v49 = -[__CFString UTF8String](v26, "UTF8String");
      v50 = 2114;
      v51 = v32;
      _os_log_impl(&dword_1B98FC000, v41, OS_LOG_TYPE_DEFAULT, "%{public}20s | %{public}@", buf, 0x16u);

    }
  }

}

uint64_t __48__PTPCameraDeviceManager_startDeviceWithHandle___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "fetchAutolaunchApplicationPath");
}

- (void)syncClockImp:(id)a3
{
  id v3;
  void *v4;
  void (**v5)(_QWORD, _QWORD, _QWORD);
  void *v6;
  void *v7;
  void *v8;
  id v9;

  v3 = a3;
  objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("device"));
  v9 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("info"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("cbBlock"));
  v5 = (void (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithObjectsAndKeys:", v9, CFSTR("device"), 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (v4)
    objc_msgSend(v6, "setObject:forKeyedSubscript:", v4, CFSTR("info"));
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", -9922);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setObject:forKeyedSubscript:", v8, CFSTR("errCode"));

  if (v5)
    ((void (**)(_QWORD, id, void *))v5)[2](v5, v9, v7);

}

- (void)getFileThumbnailImp:(id)a3
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
  id v13;
  int64_t v14;
  void *v15;
  void *v16;
  _QWORD v17[5];
  id v18;
  id v19;
  id v20;
  id v21;
  id v22;
  id v23;
  uint64_t *v24;
  uint64_t v25;
  uint64_t *v26;
  uint64_t v27;
  uint64_t v28;

  v4 = a3;
  v25 = 0;
  v26 = &v25;
  v27 = 0x2020000000;
  v28 = -9922;
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("file"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("info"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("device"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("cbBlock"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("options"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "objectForKeyedSubscript:", *MEMORY[0x1E0CBD2A0]);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithObjectsAndKeys:", v7, CFSTR("device"), v5, CFSTR("file"), 0);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = &unk_1E70DC680;
  if (v10)
    v12 = v10;
  v13 = v12;

  v14 = -[PTPCameraDeviceManager checkFile:andDevice:](self, "checkFile:andDevice:", v5, v7);
  v26[3] = v14;
  if (v14)
  {
    -[PTPCameraDeviceManager executeCompletionBlockWithErrorCode:info:file:completionDict:completionBlk:](self, "executeCompletionBlockWithErrorCode:info:file:completionDict:completionBlk:", v14, v6, v5, v11, v8);
  }
  else
  {
    v15 = (void *)MEMORY[0x1E0CB34C8];
    v17[0] = MEMORY[0x1E0C809B0];
    v17[1] = 3221225472;
    v17[2] = __46__PTPCameraDeviceManager_getFileThumbnailImp___block_invoke;
    v17[3] = &unk_1E70C7318;
    v24 = &v25;
    v17[4] = self;
    v18 = v6;
    v19 = v5;
    v20 = v11;
    v23 = v8;
    v21 = v7;
    v22 = v13;
    objc_msgSend(v15, "blockOperationWithBlock:", v17);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    -[ICDeviceManager addInteractiveOperation:](self, "addInteractiveOperation:", v16);

  }
  _Block_object_dispose(&v25, 8);

}

void __46__PTPCameraDeviceManager_getFileThumbnailImp___block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  id v10;
  uint64_t v11;
  void *v12;
  _QWORD v13[4];
  id v14;
  id v15;
  id v16;
  uint64_t v17;
  id v18;
  id v19;
  _QWORD v20[5];
  id v21;
  id v22;
  id v23;
  id v24;
  uint64_t v25;
  uint64_t v26;
  _QWORD v27[2];

  v27[1] = *MEMORY[0x1E0C80C00];
  v20[2] = __46__PTPCameraDeviceManager_getFileThumbnailImp___block_invoke_2;
  v20[3] = &unk_1E70C72C8;
  v2 = *(_QWORD *)(a1 + 32);
  v3 = *(void **)(a1 + 40);
  v25 = *(_QWORD *)(a1 + 88);
  v20[4] = v2;
  v4 = MEMORY[0x1E0C809B0];
  v20[0] = MEMORY[0x1E0C809B0];
  v20[1] = 3221225472;
  v21 = v3;
  v22 = *(id *)(a1 + 48);
  v23 = *(id *)(a1 + 56);
  v24 = *(id *)(a1 + 80);
  v5 = (void *)MEMORY[0x1BCCC74B4](v20);
  objc_msgSend(*(id *)(a1 + 64), "remoteCameraWithFailureBlock:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    objc_msgSend(*(id *)(a1 + 64), "setDevConnectionFailureBlock:", v5);
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend(*(id *)(a1 + 48), "objectID"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = *(_QWORD *)(a1 + 72);
    v26 = *MEMORY[0x1E0CBD2A0];
    v27[0] = v8;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v27, &v26, 1);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v13[0] = v4;
    v13[1] = 3221225472;
    v13[2] = __46__PTPCameraDeviceManager_getFileThumbnailImp___block_invoke_3;
    v13[3] = &unk_1E70C72F0;
    v14 = *(id *)(a1 + 56);
    v15 = *(id *)(a1 + 48);
    v10 = *(id *)(a1 + 64);
    v11 = *(_QWORD *)(a1 + 32);
    v12 = *(void **)(a1 + 40);
    v16 = v10;
    v17 = v11;
    v18 = v12;
    v19 = *(id *)(a1 + 80);
    objc_msgSend(v6, "requestThumbnailDataForObjectHandle:options:withReply:", v7, v9, v13);

  }
}

uint64_t __46__PTPCameraDeviceManager_getFileThumbnailImp___block_invoke_2(uint64_t a1)
{
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 24) = -21400;
  return objc_msgSend(*(id *)(a1 + 32), "executeCompletionBlockWithErrorCode:info:file:completionDict:completionBlk:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 24), *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 64));
}

void __46__PTPCameraDeviceManager_getFileThumbnailImp___block_invoke_3(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  __CFString *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  __CFString *v15;
  NSObject *v16;
  void *v17;
  uint64_t v18;
  void *v19;
  uint8_t buf[4];
  uint64_t v21;
  __int16 v22;
  void *v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = v3;
  if (v3)
  {
    objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("thumb"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (v5)
    {
      objc_msgSend(*(id *)(a1 + 32), "setObject:forKeyedSubscript:", v5, CFSTR("thumb"));
      v6 = 0;
    }
    else
    {
      v6 = -20097;
    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("metadata"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 40), "metadata");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (v8)
    {

    }
    else if (objc_msgSend(v7, "count"))
    {
      __ICOSLogCreate();
      if (__ICLogTypeEnabled(4))
      {
        v9 = CFSTR("meta");
        if ((unint64_t)objc_msgSend(CFSTR("meta"), "length") >= 0x15)
        {
          objc_msgSend(CFSTR("meta"), "substringWithRange:", 0, 18);
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v10, "stringByAppendingString:", CFSTR(".."));
          v9 = (__CFString *)objc_claimAutoreleasedReturnValue();

        }
        v11 = (void *)MEMORY[0x1E0CB3940];
        objc_msgSend(*(id *)(a1 + 40), "name");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "stringWithFormat:", CFSTR("Set Metadata ---> thumbnail %@"), v12);
        v13 = (void *)objc_claimAutoreleasedReturnValue();

        v14 = (void *)_gICOSLog;
        if (os_log_type_enabled((os_log_t)_gICOSLog, OS_LOG_TYPE_DEFAULT))
        {
          v15 = objc_retainAutorelease(v9);
          v16 = v14;
          *(_DWORD *)buf = 136446466;
          v21 = -[__CFString UTF8String](v15, "UTF8String");
          v22 = 2114;
          v23 = v13;
          _os_log_impl(&dword_1B98FC000, v16, OS_LOG_TYPE_DEFAULT, "%{public}20s | %{public}@", buf, 0x16u);

        }
      }
      objc_msgSend(*(id *)(a1 + 40), "setMetadata:", v7);
    }
    objc_msgSend(*(id *)(a1 + 40), "metadata");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = *MEMORY[0x1E0CBCFF0];
    objc_msgSend(v17, "objectForKeyedSubscript:", *MEMORY[0x1E0CBCFF0]);
    v19 = (void *)objc_claimAutoreleasedReturnValue();

    if (v19)
      objc_msgSend(*(id *)(a1 + 32), "setObject:forKeyedSubscript:", v19, v18);

  }
  else
  {
    v6 = -20097;
  }
  objc_msgSend(*(id *)(a1 + 48), "setDevConnectionFailureBlock:", 0);
  objc_msgSend(*(id *)(a1 + 56), "executeCompletionBlockWithErrorCode:info:file:completionDict:completionBlk:", v6, *(_QWORD *)(a1 + 64), *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 72));

}

- (void)getFileMetadataImp:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  int64_t v10;
  void *v11;
  void *v12;
  _QWORD v13[5];
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;
  uint64_t *v19;
  uint64_t v20;
  uint64_t *v21;
  uint64_t v22;
  uint64_t v23;

  v4 = a3;
  v20 = 0;
  v21 = &v20;
  v22 = 0x2020000000;
  v23 = 0;
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("device"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("info"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("file"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("cbBlock"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithObjectsAndKeys:", v5, CFSTR("device"), v7, CFSTR("file"), 0);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = -[PTPCameraDeviceManager checkFile:andDevice:](self, "checkFile:andDevice:", v7, v5);
  v21[3] = v10;
  if (v10)
  {
    -[PTPCameraDeviceManager executeCompletionBlockWithErrorCode:info:file:completionDict:completionBlk:](self, "executeCompletionBlockWithErrorCode:info:file:completionDict:completionBlk:", v10, v6, v7, v9, v8);
  }
  else
  {
    v11 = (void *)MEMORY[0x1E0CB34C8];
    v13[0] = MEMORY[0x1E0C809B0];
    v13[1] = 3221225472;
    v13[2] = __45__PTPCameraDeviceManager_getFileMetadataImp___block_invoke;
    v13[3] = &unk_1E70C7340;
    v19 = &v20;
    v13[4] = self;
    v14 = v6;
    v15 = v7;
    v16 = v9;
    v18 = v8;
    v17 = v5;
    objc_msgSend(v11, "blockOperationWithBlock:", v13);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[ICDeviceManager addInteractiveOperation:](self, "addInteractiveOperation:", v12);

  }
  _Block_object_dispose(&v20, 8);

}

void __45__PTPCameraDeviceManager_getFileMetadataImp___block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  uint64_t v9;
  void *v10;
  _QWORD v11[4];
  id v12;
  id v13;
  uint64_t v14;
  id v15;
  id v16;
  id v17;
  _QWORD v18[5];
  id v19;
  id v20;
  id v21;
  id v22;
  uint64_t v23;

  v18[2] = __45__PTPCameraDeviceManager_getFileMetadataImp___block_invoke_2;
  v18[3] = &unk_1E70C72C8;
  v2 = *(_QWORD *)(a1 + 32);
  v3 = *(void **)(a1 + 40);
  v23 = *(_QWORD *)(a1 + 80);
  v18[4] = v2;
  v4 = MEMORY[0x1E0C809B0];
  v18[0] = MEMORY[0x1E0C809B0];
  v18[1] = 3221225472;
  v19 = v3;
  v20 = *(id *)(a1 + 48);
  v21 = *(id *)(a1 + 56);
  v22 = *(id *)(a1 + 72);
  v5 = (void *)MEMORY[0x1BCCC74B4](v18);
  objc_msgSend(*(id *)(a1 + 64), "remoteCameraWithFailureBlock:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    objc_msgSend(*(id *)(a1 + 64), "setDevConnectionFailureBlock:", v5);
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend(*(id *)(a1 + 48), "objectID"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v11[0] = v4;
    v11[1] = 3221225472;
    v11[2] = __45__PTPCameraDeviceManager_getFileMetadataImp___block_invoke_3;
    v11[3] = &unk_1E70C72F0;
    v12 = *(id *)(a1 + 56);
    v8 = *(id *)(a1 + 64);
    v9 = *(_QWORD *)(a1 + 32);
    v10 = *(void **)(a1 + 40);
    v13 = v8;
    v14 = v9;
    v15 = v10;
    v16 = *(id *)(a1 + 48);
    v17 = *(id *)(a1 + 72);
    objc_msgSend(v6, "requestMetadataForObjectHandle:options:withReply:", v7, 0, v11);

  }
}

uint64_t __45__PTPCameraDeviceManager_getFileMetadataImp___block_invoke_2(uint64_t a1)
{
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 24) = -21400;
  return objc_msgSend(*(id *)(a1 + 32), "executeCompletionBlockWithErrorCode:info:file:completionDict:completionBlk:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 24), *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 64));
}

uint64_t __45__PTPCameraDeviceManager_getFileMetadataImp___block_invoke_3(uint64_t a1, uint64_t a2)
{
  uint64_t v3;

  if (a2)
  {
    objc_msgSend(*(id *)(a1 + 32), "setObject:forKeyedSubscript:", a2, CFSTR("metadata"));
    v3 = 0;
  }
  else
  {
    v3 = -20147;
  }
  objc_msgSend(*(id *)(a1 + 40), "setDevConnectionFailureBlock:", 0);
  return objc_msgSend(*(id *)(a1 + 48), "executeCompletionBlockWithErrorCode:info:file:completionDict:completionBlk:", v3, *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 64), *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 72));
}

- (void)getFileDataImp:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  int64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  uint64_t v18;
  void *v19;
  _QWORD v20[5];
  id v21;
  id v22;
  id v23;
  id v24;
  id v25;
  id v26;
  uint64_t *v27;
  uint64_t v28;
  uint64_t *v29;
  uint64_t v30;
  uint64_t v31;

  v4 = a3;
  v28 = 0;
  v29 = &v28;
  v30 = 0x2020000000;
  v31 = 0;
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("info"));
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("file"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("cbBlock"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("device"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("options"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithObjectsAndKeys:", v7, CFSTR("device"), 0);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = -[PTPCameraDeviceManager checkFile:andDevice:](self, "checkFile:andDevice:", v5, v7);
  v29[3] = v10;
  if (v10)
  {
    -[PTPCameraDeviceManager executeCompletionBlockWithErrorCode:info:file:completionDict:completionBlk:](self, "executeCompletionBlockWithErrorCode:info:file:completionDict:completionBlk:", v10, v19, v5, v9, v6);
  }
  else
  {
    objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("ICReadOffset"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if (v11)
    {
      objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("ICReadOffset"));
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = objc_msgSend(v12, "unsignedLongLongValue");

    }
    else
    {
      v18 = 0x7FFFFFFFFFFFFFFFLL;
    }

    objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("ICReadLength"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v13
      || (objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("ICReadLength")),
          v14 = (void *)objc_claimAutoreleasedReturnValue(),
          v15 = objc_msgSend(v14, "unsignedLongLongValue"),
          v14,
          v13,
          v18 == 0x7FFFFFFFFFFFFFFFLL)
      || v15 == 0x7FFFFFFFFFFFFFFFLL)
    {
      -[PTPCameraDeviceManager executeCompletionBlockWithErrorCode:info:file:completionDict:completionBlk:](self, "executeCompletionBlockWithErrorCode:info:file:completionDict:completionBlk:", -21449, v19, v5, v9, v6);
    }
    else
    {
      v16 = (void *)MEMORY[0x1E0CB34C8];
      v20[0] = MEMORY[0x1E0C809B0];
      v20[1] = 3221225472;
      v20[2] = __41__PTPCameraDeviceManager_getFileDataImp___block_invoke;
      v20[3] = &unk_1E70C7318;
      v27 = &v28;
      v20[4] = self;
      v21 = v19;
      v22 = v5;
      v23 = v9;
      v26 = v6;
      v24 = v7;
      v25 = v8;
      objc_msgSend(v16, "blockOperationWithBlock:", v20);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      -[ICDeviceManager addInteractiveOperation:](self, "addInteractiveOperation:", v17);

    }
  }

  _Block_object_dispose(&v28, 8);
}

void __41__PTPCameraDeviceManager_getFileDataImp___block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  id v9;
  uint64_t v10;
  void *v11;
  _QWORD v12[4];
  id v13;
  uint64_t v14;
  id v15;
  id v16;
  id v17;
  uint64_t v18;
  _QWORD v19[5];
  id v20;
  id v21;
  id v22;
  id v23;
  uint64_t v24;

  v19[2] = __41__PTPCameraDeviceManager_getFileDataImp___block_invoke_2;
  v19[3] = &unk_1E70C72C8;
  v2 = *(_QWORD *)(a1 + 32);
  v3 = *(void **)(a1 + 40);
  v24 = *(_QWORD *)(a1 + 88);
  v19[4] = v2;
  v4 = MEMORY[0x1E0C809B0];
  v19[0] = MEMORY[0x1E0C809B0];
  v19[1] = 3221225472;
  v20 = v3;
  v21 = *(id *)(a1 + 48);
  v22 = *(id *)(a1 + 56);
  v23 = *(id *)(a1 + 80);
  v5 = (void *)MEMORY[0x1BCCC74B4](v19);
  objc_msgSend(*(id *)(a1 + 64), "remoteCameraWithFailureBlock:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    objc_msgSend(*(id *)(a1 + 64), "setDevConnectionFailureBlock:", v5);
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend(*(id *)(a1 + 48), "objectID"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v12[0] = v4;
    v12[1] = 3221225472;
    v12[2] = __41__PTPCameraDeviceManager_getFileDataImp___block_invoke_3;
    v12[3] = &unk_1E70C7368;
    v18 = *(_QWORD *)(a1 + 88);
    v8 = *(_QWORD *)(a1 + 72);
    v9 = *(id *)(a1 + 64);
    v10 = *(_QWORD *)(a1 + 32);
    v11 = *(void **)(a1 + 40);
    v13 = v9;
    v14 = v10;
    v15 = v11;
    v16 = *(id *)(a1 + 48);
    v17 = *(id *)(a1 + 80);
    objc_msgSend(v6, "requestReadDataFromObjectHandle:options:withReply:", v7, v8, v12);

  }
}

uint64_t __41__PTPCameraDeviceManager_getFileDataImp___block_invoke_2(uint64_t a1)
{
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 24) = -21400;
  return objc_msgSend(*(id *)(a1 + 32), "executeCompletionBlockWithErrorCode:info:file:completionDict:completionBlk:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 24), *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 64));
}

void __41__PTPCameraDeviceManager_getFileDataImp___block_invoke_3(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  uint64_t v6;
  id v7;

  v3 = a2;
  v7 = v3;
  if (v3)
  {
    objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("rc"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 24) = (int)objc_msgSend(v4, "intValue");

    objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("ICReadData"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = -21448;
    if (v5)
      v6 = 0;
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 24) = v6;

  }
  else
  {
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 24) = -21447;
  }
  objc_msgSend(*(id *)(a1 + 32), "setDevConnectionFailureBlock:", 0);
  objc_msgSend(*(id *)(a1 + 40), "executeCompletionBlockWithErrorCode:info:file:completionDict:completionBlk:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 24), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56), v7, *(_QWORD *)(a1 + 64));

}

- (void)downloadFileImp:(id)a3
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
  int64_t v15;
  uint64_t *v16;
  void *v17;
  void *v18;
  _QWORD v19[5];
  id v20;
  id v21;
  id v22;
  id v23;
  id v24;
  id v25;
  uint64_t *v26;
  uint64_t v27;
  uint64_t *v28;
  uint64_t v29;
  uint64_t v30;

  v4 = a3;
  v27 = 0;
  v28 = &v27;
  v29 = 0x2020000000;
  v30 = 0;
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("device"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("info"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("file"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)MEMORY[0x1E0C99E08];
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("opts"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "dictionaryWithDictionary:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("ICDownloadsDirectoryURL"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "path");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("cbBlock"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithObjectsAndKeys:", v5, CFSTR("device"), 0);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = -[PTPCameraDeviceManager checkFile:andDevice:](self, "checkFile:andDevice:", v7, v5);
  v16 = v28;
  v28[3] = v15;
  if (!v15)
  {
    if (v12)
    {
      objc_msgSend(v10, "setObject:forKeyedSubscript:", v12, CFSTR("ICDownloadsDirectoryURL"));
      v17 = (void *)MEMORY[0x1E0CB34C8];
      v19[0] = MEMORY[0x1E0C809B0];
      v19[1] = 3221225472;
      v19[2] = __42__PTPCameraDeviceManager_downloadFileImp___block_invoke;
      v19[3] = &unk_1E70C7318;
      v26 = &v27;
      v19[4] = self;
      v20 = v6;
      v21 = v7;
      v22 = v14;
      v25 = v13;
      v23 = v5;
      v24 = v10;
      objc_msgSend(v17, "blockOperationWithBlock:", v19);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      -[ICDeviceManager addInteractiveOperation:](self, "addInteractiveOperation:", v18);

      goto LABEL_5;
    }
    v15 = -21100;
    v16[3] = -21100;
  }
  -[PTPCameraDeviceManager executeCompletionBlockWithErrorCode:info:file:completionDict:completionBlk:](self, "executeCompletionBlockWithErrorCode:info:file:completionDict:completionBlk:", v15, v6, v7, v14, v13);
LABEL_5:

  _Block_object_dispose(&v27, 8);
}

void __42__PTPCameraDeviceManager_downloadFileImp___block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  id v9;
  uint64_t v10;
  void *v11;
  _QWORD v12[4];
  id v13;
  uint64_t v14;
  id v15;
  id v16;
  id v17;
  id v18;
  _QWORD v19[5];
  id v20;
  id v21;
  id v22;
  id v23;
  uint64_t v24;

  v19[2] = __42__PTPCameraDeviceManager_downloadFileImp___block_invoke_2;
  v19[3] = &unk_1E70C72C8;
  v2 = *(_QWORD *)(a1 + 32);
  v3 = *(void **)(a1 + 40);
  v24 = *(_QWORD *)(a1 + 88);
  v19[4] = v2;
  v4 = MEMORY[0x1E0C809B0];
  v19[0] = MEMORY[0x1E0C809B0];
  v19[1] = 3221225472;
  v20 = v3;
  v21 = *(id *)(a1 + 48);
  v22 = *(id *)(a1 + 56);
  v23 = *(id *)(a1 + 80);
  v5 = (void *)MEMORY[0x1BCCC74B4](v19);
  objc_msgSend(*(id *)(a1 + 64), "remoteCameraWithFailureBlock:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    objc_msgSend(*(id *)(a1 + 64), "setDevConnectionFailureBlock:", v5);
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend(*(id *)(a1 + 48), "objectID"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v12[0] = v4;
    v12[1] = 3221225472;
    v12[2] = __42__PTPCameraDeviceManager_downloadFileImp___block_invoke_3;
    v12[3] = &unk_1E70C72F0;
    v8 = *(_QWORD *)(a1 + 72);
    v9 = *(id *)(a1 + 64);
    v10 = *(_QWORD *)(a1 + 32);
    v11 = *(void **)(a1 + 40);
    v13 = v9;
    v14 = v10;
    v15 = v11;
    v16 = *(id *)(a1 + 48);
    v17 = *(id *)(a1 + 56);
    v18 = *(id *)(a1 + 80);
    objc_msgSend(v6, "requestDownloadObjectHandle:options:withReply:", v7, v8, v12);

  }
}

uint64_t __42__PTPCameraDeviceManager_downloadFileImp___block_invoke_2(uint64_t a1)
{
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 24) = -21400;
  return objc_msgSend(*(id *)(a1 + 32), "executeCompletionBlockWithErrorCode:info:file:completionDict:completionBlk:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 24), *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 64));
}

uint64_t __42__PTPCameraDeviceManager_downloadFileImp___block_invoke_3(uint64_t a1, void *a2)
{
  void *v3;
  uint64_t v4;

  objc_msgSend(a2, "objectForKeyedSubscript:", CFSTR("rc"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (int)objc_msgSend(v3, "intValue");

  objc_msgSend(*(id *)(a1 + 32), "setDevConnectionFailureBlock:", 0);
  return objc_msgSend(*(id *)(a1 + 40), "executeCompletionBlockWithErrorCode:info:file:completionDict:completionBlk:", v4, *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 64), *(_QWORD *)(a1 + 72));
}

- (void)deleteFileImp:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  int64_t v14;
  void *v15;
  void *v16;
  void *v17;
  _QWORD v18[5];
  id v19;
  id v20;
  id v21;
  id v22;
  id v23;
  id v24;
  uint64_t *v25;
  uint64_t v26;
  uint64_t *v27;
  uint64_t v28;
  uint64_t v29;

  v4 = a3;
  v26 = 0;
  v27 = &v26;
  v28 = 0x2020000000;
  v29 = -9922;
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("device"));
  v5 = objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("info"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("file"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("cbBlock"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)MEMORY[0x1E0C99E08];
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("opts"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "dictionaryWithDictionary:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  v12 = (void *)v5;
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithObjectsAndKeys:", v5, CFSTR("device"), v7, CFSTR("file"), 0);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = -[PTPCameraDeviceManager checkFile:andDevice:](self, "checkFile:andDevice:", v7, v12);
  v27[3] = v14;
  if (v14)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v14);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setObject:forKeyedSubscript:", v15, CFSTR("errCode"));

    -[PTPCameraDeviceManager executeCompletionBlockWithErrorCode:info:file:completionDict:completionBlk:](self, "executeCompletionBlockWithErrorCode:info:file:completionDict:completionBlk:", v27[3], v6, v7, v13, v8);
  }
  else
  {
    v16 = (void *)MEMORY[0x1E0CB34C8];
    v18[0] = MEMORY[0x1E0C809B0];
    v18[1] = 3221225472;
    v18[2] = __40__PTPCameraDeviceManager_deleteFileImp___block_invoke;
    v18[3] = &unk_1E70C7318;
    v25 = &v26;
    v18[4] = self;
    v19 = v6;
    v20 = v7;
    v21 = v13;
    v24 = v8;
    v22 = v12;
    v23 = v11;
    objc_msgSend(v16, "blockOperationWithBlock:", v18);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    -[ICDeviceManager addInteractiveOperation:](self, "addInteractiveOperation:", v17);

  }
  _Block_object_dispose(&v26, 8);

}

void __40__PTPCameraDeviceManager_deleteFileImp___block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  uint64_t v18;
  id v19;
  uint64_t v20;
  void *v21;
  _QWORD v22[4];
  id v23;
  uint64_t v24;
  id v25;
  id v26;
  id v27;
  id v28;
  _QWORD v29[5];
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  _QWORD v34[5];
  id v35;
  id v36;
  id v37;
  id v38;
  uint64_t v39;
  _BYTE v40[128];
  uint64_t v41;

  v41 = *MEMORY[0x1E0C80C00];
  v34[2] = __40__PTPCameraDeviceManager_deleteFileImp___block_invoke_2;
  v34[3] = &unk_1E70C72C8;
  v2 = *(_QWORD *)(a1 + 32);
  v3 = *(void **)(a1 + 40);
  v39 = *(_QWORD *)(a1 + 88);
  v34[4] = v2;
  v34[0] = MEMORY[0x1E0C809B0];
  v34[1] = 3221225472;
  v35 = v3;
  v36 = *(id *)(a1 + 48);
  v37 = *(id *)(a1 + 56);
  v38 = *(id *)(a1 + 80);
  v4 = (void *)MEMORY[0x1BCCC74B4](v34);
  objc_msgSend(*(id *)(a1 + 64), "remoteCameraWithFailureBlock:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    v21 = v4;
    objc_msgSend(*(id *)(a1 + 64), "setDevConnectionFailureBlock:", v4);
    v32 = 0u;
    v33 = 0u;
    v31 = 0u;
    v30 = 0u;
    v6 = a1;
    objc_msgSend(*(id *)(a1 + 48), "sidecarFiles");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v30, v40, 16);
    if (v8)
    {
      v9 = v8;
      v10 = *(_QWORD *)v31;
      do
      {
        for (i = 0; i != v9; ++i)
        {
          v12 = v5;
          if (*(_QWORD *)v31 != v10)
            objc_enumerationMutation(v7);
          v13 = *(void **)(*((_QWORD *)&v30 + 1) + 8 * i);
          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend(v13, "objectID"));
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          v15 = *(_QWORD *)(v6 + 72);
          v29[0] = MEMORY[0x1E0C809B0];
          v29[1] = 3221225472;
          v29[2] = __40__PTPCameraDeviceManager_deleteFileImp___block_invoke_3;
          v29[3] = &unk_1E70C7AF0;
          v29[4] = v13;
          v5 = v12;
          objc_msgSend(v12, "requestDeleteObjectHandle:options:withReply:", v14, v15, v29);

        }
        v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v30, v40, 16);
      }
      while (v9);
    }

    v16 = v6;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend(*(id *)(v6 + 48), "objectID"));
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = *(_QWORD *)(v16 + 72);
    v22[0] = MEMORY[0x1E0C809B0];
    v22[1] = 3221225472;
    v22[2] = __40__PTPCameraDeviceManager_deleteFileImp___block_invoke_119;
    v22[3] = &unk_1E70C72F0;
    v19 = *(id *)(v16 + 48);
    v20 = *(_QWORD *)(v16 + 32);
    v23 = v19;
    v24 = v20;
    v25 = *(id *)(v16 + 56);
    v26 = *(id *)(v16 + 64);
    v27 = *(id *)(v16 + 40);
    v28 = *(id *)(v16 + 80);
    objc_msgSend(v5, "requestDeleteObjectHandle:options:withReply:", v17, v18, v22);

    v4 = v21;
  }

}

uint64_t __40__PTPCameraDeviceManager_deleteFileImp___block_invoke_2(uint64_t a1)
{
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 24) = -21400;
  return objc_msgSend(*(id *)(a1 + 32), "executeCompletionBlockWithErrorCode:info:file:completionDict:completionBlk:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 24), *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 64));
}

void __40__PTPCameraDeviceManager_deleteFileImp___block_invoke_3(uint64_t a1)
{
  __CFString *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  __CFString *v8;
  NSObject *v9;
  uint8_t buf[4];
  uint64_t v11;
  __int16 v12;
  void *v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  __ICOSLogCreate();
  v2 = CFSTR("sidecar");
  if ((unint64_t)objc_msgSend(CFSTR("sidecar"), "length") >= 0x15)
  {
    objc_msgSend(CFSTR("sidecar"), "substringWithRange:", 0, 18);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "stringByAppendingString:", CFSTR(".."));
    v2 = (__CFString *)objc_claimAutoreleasedReturnValue();

  }
  v4 = (void *)MEMORY[0x1E0CB3940];
  objc_msgSend(*(id *)(a1 + 32), "name");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "stringWithFormat:", CFSTR("deleted sidecar: %@"), v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = (void *)_gICOSLog;
  if (os_log_type_enabled((os_log_t)_gICOSLog, OS_LOG_TYPE_DEFAULT))
  {
    v8 = objc_retainAutorelease(v2);
    v9 = v7;
    *(_DWORD *)buf = 136446466;
    v11 = -[__CFString UTF8String](v8, "UTF8String");
    v12 = 2114;
    v13 = v6;
    _os_log_impl(&dword_1B98FC000, v9, OS_LOG_TYPE_DEFAULT, "%{public}20s | %{public}@", buf, 0x16u);

  }
}

uint64_t __40__PTPCameraDeviceManager_deleteFileImp___block_invoke_119(uint64_t a1, void *a2)
{
  void *v3;
  int v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v10;
  const __CFString *v11;
  _QWORD v12[2];

  v12[1] = *MEMORY[0x1E0C80C00];
  objc_msgSend(a2, "objectForKeyedSubscript:", CFSTR("errCode"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "intValue");

  if (!v4)
  {
    v11 = CFSTR("ICObjectIDArray");
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend(*(id *)(a1 + 32), "objectID"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = v5;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v10, 1);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v12[0] = v6;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v12, &v11, 1);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(*(id *)(a1 + 40), "notifyRemovedItems:", v7);
  }
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 48), "setObject:forKeyedSubscript:", v8, CFSTR("errCode"));

  objc_msgSend(*(id *)(a1 + 56), "setDevConnectionFailureBlock:", 0);
  return objc_msgSend(*(id *)(a1 + 40), "executeCompletionBlockWithErrorCode:info:file:completionDict:completionBlk:", v4, *(_QWORD *)(a1 + 64), *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 72));
}

- (void)sendDevicePTPCommandImp:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  id v12;
  void *v13;
  void *v14;
  PTPCameraDeviceManager *v15;
  void *v16;
  _QWORD v17[4];
  id v18;
  PTPCameraDeviceManager *v19;
  id v20;
  id v21;
  uint64_t *v22;
  _QWORD v23[5];
  id v24;
  id v25;
  id v26;
  uint64_t *v27;
  uint64_t v28;
  uint64_t *v29;
  uint64_t v30;
  uint64_t v31;

  v4 = a3;
  v28 = 0;
  v29 = &v28;
  v30 = 0x2020000000;
  v31 = -9922;
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("info"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("device"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("cbBlock"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithObjectsAndKeys:", v6, CFSTR("device"), 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("ICPTPCommandBuffer"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("ICPTPDataBuffer"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (v9)
  {
    v23[0] = MEMORY[0x1E0C809B0];
    v23[1] = 3221225472;
    v23[2] = __50__PTPCameraDeviceManager_sendDevicePTPCommandImp___block_invoke;
    v23[3] = &unk_1E70C80F8;
    v27 = &v28;
    v15 = self;
    v16 = v5;
    v23[4] = self;
    v11 = v5;
    v24 = v11;
    v25 = v8;
    v12 = v7;
    v26 = v12;
    v13 = (void *)MEMORY[0x1BCCC74B4](v23);
    objc_msgSend(v6, "remoteCameraWithFailureBlock:", v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    if (v14)
    {
      objc_msgSend(v6, "setDevConnectionFailureBlock:", v13);
      v17[0] = MEMORY[0x1E0C809B0];
      v17[1] = 3221225472;
      v17[2] = __50__PTPCameraDeviceManager_sendDevicePTPCommandImp___block_invoke_2;
      v17[3] = &unk_1E70C8120;
      v22 = &v28;
      v18 = v6;
      v19 = v15;
      v20 = v11;
      v21 = v12;
      objc_msgSend(v14, "sendPTPCommand:andPayload:withReply:", v9, v10, v17);

    }
    v5 = v16;
  }
  else
  {
    v29[3] = -21250;
    -[PTPCameraDeviceManager executeCompletionBlockWithErrorCode:info:file:completionDict:completionBlk:](self, "executeCompletionBlockWithErrorCode:info:file:completionDict:completionBlk:", -21250, v5, 0, v8, v7);
  }

  _Block_object_dispose(&v28, 8);
}

uint64_t __50__PTPCameraDeviceManager_sendDevicePTPCommandImp___block_invoke(uint64_t a1)
{
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24) = -21400;
  return objc_msgSend(*(id *)(a1 + 32), "executeCompletionBlockWithErrorCode:info:file:completionDict:completionBlk:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24), *(_QWORD *)(a1 + 40), 0, *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56));
}

void __50__PTPCameraDeviceManager_sendDevicePTPCommandImp___block_invoke_2(uint64_t a1, void *a2)
{
  void *v3;
  id v4;

  v4 = a2;
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("errCode"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24) = (int)objc_msgSend(v3, "intValue");

  objc_msgSend(*(id *)(a1 + 32), "setDevConnectionFailureBlock:", 0);
  objc_msgSend(*(id *)(a1 + 40), "executeCompletionBlockWithErrorCode:info:file:completionDict:completionBlk:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24), *(_QWORD *)(a1 + 48), 0, v4, *(_QWORD *)(a1 + 56));

}

- (void)ejectImp:(id)a3
{
  __CFString *v3;
  void *v4;
  void *v5;
  void *v6;
  __CFString *v7;
  NSObject *v8;
  int v9;
  uint64_t v10;
  __int16 v11;
  void *v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  __ICOSLogCreate();
  v3 = CFSTR("DeviceManager");
  if ((unint64_t)objc_msgSend(CFSTR("DeviceManager"), "length") >= 0x15)
  {
    objc_msgSend(CFSTR("DeviceManager"), "substringWithRange:", 0, 18);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "stringByAppendingString:", CFSTR(".."));
    v3 = (__CFString *)objc_claimAutoreleasedReturnValue();

  }
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("[PTPCameraDeviceManager ejectImp] (iOS unimplemented)"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)_gICOSLog;
  if (os_log_type_enabled((os_log_t)_gICOSLog, OS_LOG_TYPE_DEFAULT))
  {
    v7 = objc_retainAutorelease(v3);
    v8 = v6;
    v9 = 136446466;
    v10 = -[__CFString UTF8String](v7, "UTF8String");
    v11 = 2114;
    v12 = v5;
    _os_log_impl(&dword_1B98FC000, v8, OS_LOG_TYPE_DEFAULT, "%{public}20s | %{public}@", (uint8_t *)&v9, 0x16u);

  }
}

- (void)getSecurityScopedURLImp:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  v4 = a3;
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("file"));
  v9 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("device"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("cbBlock"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("info"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithObjectsAndKeys:", v5, CFSTR("device"), 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[PTPCameraDeviceManager executeCompletionBlockWithErrorCode:info:file:completionDict:completionBlk:](self, "executeCompletionBlockWithErrorCode:info:file:completionDict:completionBlk:", -9922, v7, v9, v8, v6);

}

- (void)refreshObjectHandleInfoImp:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  v4 = a3;
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("file"));
  v9 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("device"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("cbBlock"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("info"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithObjectsAndKeys:", v5, CFSTR("device"), 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[PTPCameraDeviceManager executeCompletionBlockWithErrorCode:info:file:completionDict:completionBlk:](self, "executeCompletionBlockWithErrorCode:info:file:completionDict:completionBlk:", -9922, v7, v9, v8, v6);

}

- (void)getFingerprintImp:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  int64_t v10;
  void *v11;
  void *v12;
  _QWORD v13[5];
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;
  uint64_t *v19;
  uint64_t v20;
  uint64_t *v21;
  uint64_t v22;
  uint64_t v23;

  v4 = a3;
  v20 = 0;
  v21 = &v20;
  v22 = 0x2020000000;
  v23 = 0;
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("device"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("info"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("file"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("cbBlock"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithObjectsAndKeys:", v5, CFSTR("device"), 0);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = -[PTPCameraDeviceManager checkFile:andDevice:](self, "checkFile:andDevice:", v7, v5);
  v21[3] = v10;
  if (v10)
  {
    -[PTPCameraDeviceManager executeCompletionBlockWithErrorCode:info:file:completionDict:completionBlk:](self, "executeCompletionBlockWithErrorCode:info:file:completionDict:completionBlk:", v10, v6, v7, v9, v8);
  }
  else
  {
    v11 = (void *)MEMORY[0x1E0CB34C8];
    v13[0] = MEMORY[0x1E0C809B0];
    v13[1] = 3221225472;
    v13[2] = __44__PTPCameraDeviceManager_getFingerprintImp___block_invoke;
    v13[3] = &unk_1E70C7340;
    v19 = &v20;
    v13[4] = self;
    v14 = v6;
    v15 = v7;
    v16 = v9;
    v18 = v8;
    v17 = v5;
    objc_msgSend(v11, "blockOperationWithBlock:", v13);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[ICDeviceManager addInteractiveOperation:](self, "addInteractiveOperation:", v12);

  }
  _Block_object_dispose(&v20, 8);

}

void __44__PTPCameraDeviceManager_getFingerprintImp___block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  uint64_t v9;
  void *v10;
  _QWORD v11[4];
  id v12;
  uint64_t v13;
  id v14;
  id v15;
  id v16;
  _QWORD v17[5];
  id v18;
  id v19;
  id v20;
  id v21;
  uint64_t v22;

  v17[2] = __44__PTPCameraDeviceManager_getFingerprintImp___block_invoke_2;
  v17[3] = &unk_1E70C72C8;
  v2 = *(_QWORD *)(a1 + 32);
  v3 = *(void **)(a1 + 40);
  v22 = *(_QWORD *)(a1 + 80);
  v17[4] = v2;
  v4 = MEMORY[0x1E0C809B0];
  v17[0] = MEMORY[0x1E0C809B0];
  v17[1] = 3221225472;
  v18 = v3;
  v19 = *(id *)(a1 + 48);
  v20 = *(id *)(a1 + 56);
  v21 = *(id *)(a1 + 72);
  v5 = (void *)MEMORY[0x1BCCC74B4](v17);
  objc_msgSend(*(id *)(a1 + 64), "remoteCameraWithFailureBlock:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    objc_msgSend(*(id *)(a1 + 64), "setDevConnectionFailureBlock:", v5);
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend(*(id *)(a1 + 48), "objectID"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v11[0] = v4;
    v11[1] = 3221225472;
    v11[2] = __44__PTPCameraDeviceManager_getFingerprintImp___block_invoke_3;
    v11[3] = &unk_1E70C7390;
    v8 = *(id *)(a1 + 64);
    v9 = *(_QWORD *)(a1 + 32);
    v10 = *(void **)(a1 + 40);
    v12 = v8;
    v13 = v9;
    v14 = v10;
    v15 = *(id *)(a1 + 48);
    v16 = *(id *)(a1 + 72);
    objc_msgSend(v6, "requestFingerprintForObjectHandle:withReply:", v7, v11);

  }
}

uint64_t __44__PTPCameraDeviceManager_getFingerprintImp___block_invoke_2(uint64_t a1)
{
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 24) = -21400;
  return objc_msgSend(*(id *)(a1 + 32), "executeCompletionBlockWithErrorCode:info:file:completionDict:completionBlk:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 24), *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 64));
}

void __44__PTPCameraDeviceManager_getFingerprintImp___block_invoke_3(uint64_t a1, void *a2)
{
  void *v3;
  uint64_t v4;
  id v5;

  v5 = a2;
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("rc"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (int)objc_msgSend(v3, "intValue");

  objc_msgSend(*(id *)(a1 + 32), "setDevConnectionFailureBlock:", 0);
  objc_msgSend(*(id *)(a1 + 40), "executeCompletionBlockWithErrorCode:info:file:completionDict:completionBlk:", v4, *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56), v5, *(_QWORD *)(a1 + 64));

}

- (void)registerDevice:(id)a3 forImageCaptureEventNotificationsImp:(id)a4
{
  void *v5;
  void *v6;
  id v7;

  v7 = a4;
  objc_msgSend(a3, "remoteCamera");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v5)
    objc_msgSend(v5, "registerInterestedEventNotifications:", v7);

}

- (void)unregisterDevice:(id)a3 forImageCaptureEventNotificationsImp:(id)a4
{
  void *v5;
  void *v6;
  id v7;

  v7 = a4;
  objc_msgSend(a3, "remoteCamera");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v5)
    objc_msgSend(v5, "unregisterInterestedEventNotifications:", v7);

}

- (void)handleEventImp:(id)a3
{
  void *v3;
  uint64_t v4;
  NSObject *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  NSObject *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  int v21;
  void *v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  __ICOSLogCreate();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("---> handleEventImp\n"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = __ICLogTypeEnabled(2);
  v5 = _gICOSLog;
  if (v4)
  {
    if (os_log_type_enabled((os_log_t)_gICOSLog, OS_LOG_TYPE_DEFAULT))
    {
      v21 = 138543362;
      v22 = v3;
      _os_log_impl(&dword_1B98FC000, v5, OS_LOG_TYPE_DEFAULT, "%{public}@", (uint8_t *)&v21, 0xCu);
    }
  }
  else if (os_log_type_enabled((os_log_t)_gICOSLog, OS_LOG_TYPE_DEBUG))
  {
    -[PTPCameraDeviceManager handleEventImp:].cold.1((uint64_t)v3, v5, v6, v7, v8, v9, v10, v11);
  }

  __ICOSLogCreate();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("<--- handleEventImp\n"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = __ICLogTypeEnabled(2);
  v14 = _gICOSLog;
  if (v13)
  {
    if (os_log_type_enabled((os_log_t)_gICOSLog, OS_LOG_TYPE_DEFAULT))
    {
      v21 = 138543362;
      v22 = v12;
      _os_log_impl(&dword_1B98FC000, v14, OS_LOG_TYPE_DEFAULT, "%{public}@", (uint8_t *)&v21, 0xCu);
    }
  }
  else if (os_log_type_enabled((os_log_t)_gICOSLog, OS_LOG_TYPE_DEBUG))
  {
    -[PTPCameraDeviceManager handleEventImp:].cold.1((uint64_t)v12, v14, v15, v16, v17, v18, v19, v20);
  }

}

- (int64_t)checkFile:(id)a3 andDevice:(id)a4
{
  int64_t v4;

  if (a3)
    v4 = 0;
  else
    v4 = -21450;
  if (objc_msgSend(a4, "hasOpenSession"))
    return v4;
  else
    return -9927;
}

- (void)executeCompletionBlockWithErrorCode:(int64_t)a3 info:(id)a4 file:(id)a5 completionDict:(id)a6 completionBlk:(id)a7
{
  id v11;
  id v12;
  void (**v13)(id, id, id);
  void *v14;
  id v15;

  v15 = a4;
  v11 = a5;
  v12 = a6;
  v13 = (void (**)(id, id, id))a7;
  if (v15)
    objc_msgSend(v12, "setObject:forKeyedSubscript:", v15, CFSTR("info"));
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a3);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setObject:forKeyedSubscript:", v14, CFSTR("errCode"));

  if (v13)
    v13[2](v13, v11, v12);

}

- (void)updateCameraFolder:(id)a3 withInfo:(id)a4
{
  id v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;

  v13 = a3;
  v5 = a4;
  v6 = (void *)MEMORY[0x1BCCC7334]();
  v7 = v5;
  objc_msgSend(v13, "setObjectHandle:", objc_msgSend(v7, "objectHandle"));
  objc_msgSend(v13, "setObjectID:", objc_msgSend(v7, "objectHandle"));
  objc_msgSend(v7, "captureDate");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  ICStandardDateFromPTPString(v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setCreationDate:", v9);
  objc_msgSend(v7, "modificationDate");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = v10;
  if (v10 && objc_msgSend(v10, "length"))
  {
    ICStandardDateFromPTPString(v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setModificationDate:", v12);

  }
  else
  {
    objc_msgSend(v13, "setModificationDate:", v9);
  }

  objc_autoreleasePoolPop(v6);
}

- (void)updateCameraFile:(id)a3 withInfo:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  uint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  int v29;
  id v30;
  char *v31;
  int v32;
  int v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  id v38;

  v38 = a3;
  v6 = a4;
  objc_msgSend(v38, "setObjectHandle:", objc_msgSend(v6, "objectHandle"));
  objc_msgSend(v38, "setObjectID:", objc_msgSend(v6, "objectHandle"));
  objc_msgSend(v6, "filename");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "pathExtension");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "lowercaseString");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
  {
    objc_msgSend(MEMORY[0x1E0CEC3F8], "typeWithFilenameExtension:", v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v10 = 0;
  }
  if (!_gKnownRawExtensions)
  {
    v11 = (void *)CGImageSourceCopyTypeExtensions();
    v12 = objc_msgSend(objc_alloc(MEMORY[0x1E0C99E20]), "initWithArray:", v11);
    v13 = (void *)_gKnownRawExtensions;
    _gKnownRawExtensions = v12;

    objc_msgSend((id)_gKnownRawExtensions, "removeObject:", CFSTR("tif"));
  }
  if ((objc_msgSend(v6, "objectFormat") < 0x3801
     || objc_msgSend(v6, "objectFormat") >= 0x3811)
    && objc_msgSend(v6, "objectFormat") != 46081)
  {
    if (objc_msgSend((id)_gKnownRawExtensions, "count")
      && objc_msgSend((id)_gKnownRawExtensions, "containsObject:", v9))
    {
      objc_msgSend(v38, "setRaw:", objc_msgSend((id)_gKnownRawExtensions, "containsObject:", v9));
    }
    else
    {
      v14 = _gImageIOSupportedFileExtensions;
      objc_msgSend(v9, "lowercaseString");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      LOBYTE(v14) = objc_msgSend((id)v14, "containsObject:", v15);

      if ((v14 & 1) == 0)
      {
        if (v10)
        {
          v16 = (void *)*MEMORY[0x1E0CEC568];
          if ((objc_msgSend(v10, "conformsToType:", *MEMORY[0x1E0CEC568]) & 1) != 0)
            goto LABEL_14;
          v16 = (void *)*MEMORY[0x1E0CEC450];
          if ((objc_msgSend(v10, "conformsToType:", *MEMORY[0x1E0CEC450]) & 1) != 0)
          {
            v17 = 0;
            goto LABEL_15;
          }
        }
        v17 = 0;
        v16 = (void *)*MEMORY[0x1E0CEC4A0];
        goto LABEL_15;
      }
    }
  }
  v16 = (void *)*MEMORY[0x1E0CEC520];
LABEL_14:
  v17 = 1;
LABEL_15:
  objc_msgSend(v16, "identifier");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v38, "setUTI:", v18);

  objc_msgSend(v38, "setHasMetadata:", v17);
  objc_msgSend(v38, "setWidth:", objc_msgSend(v6, "imagePixWidth"));
  objc_msgSend(v38, "setHeight:", objc_msgSend(v6, "imagePixHeight"));
  objc_msgSend(v38, "setFileSize:", objc_msgSend(v6, "objectCompressedSize64"));
  objc_msgSend(v38, "setHasThumbnail:", objc_msgSend(v6, "thumbCompressedSize") != 0);
  objc_msgSend(v38, "setOrientation:", 1);
  objc_msgSend(v38, "setParentID:", objc_msgSend(v6, "parentObject"));
  objc_msgSend(v38, "device");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v38, "setLocked:", objc_msgSend(v19, "isLocked"));

  objc_msgSend(v6, "keywords");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  -[PTPCameraDeviceManager updateCameraFile:withKeywords:](self, "updateCameraFile:withKeywords:", v38, v20);

  objc_msgSend(v6, "captureDate");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  ICStandardDateFromPTPString(v21);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v38, "setCreationDate:", v22);
  objc_msgSend(v6, "modificationDate");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v24 = v23;
  if (v23 && objc_msgSend(v23, "length"))
  {
    ICStandardDateFromPTPString(v24);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v38, "setModificationDate:", v25);

  }
  else
  {
    objc_msgSend(v38, "setModificationDate:", v22);
  }
  objc_msgSend(v38, "device");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "transportType");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v27, "isEqualToString:", CFSTR("ICTransportTypeUSB")))
    goto LABEL_29;
  objc_msgSend(v38, "device");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  v29 = objc_msgSend(v28, "isAppleDevice");

  if (v29)
  {
    objc_msgSend(v38, "name");
    v30 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v31 = strstr((char *)objc_msgSend(v30, "UTF8String"), "_E");

    if (v31)
      objc_msgSend(v38, "flagMediaMetadata:", 8);
    v32 = objc_msgSend(v6, "sequenceNumber");
    v33 = 1 << v32;
    if (v32 == 170)
      v33 = 513;
    objc_msgSend(v38, "flagMediaMetadata:", v33);
    objc_msgSend(v38, "relatedUUID");
    v34 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v34)
    {
      objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v35, "UUIDString");
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v38, "setRelatedUUID:", v36);

    }
    objc_msgSend(v38, "originatingAssetID");
    v37 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v37)
    {
      objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v26, "UUIDString");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v38, "setOriginatingAssetID:", v27);
LABEL_29:

    }
  }

}

- (void)updateCameraFile:(id)a3 withKeywords:(id)a4
{
  id v5;
  id v6;
  char *v7;
  char *v8;
  uint64_t v9;
  const char *v10;
  uint64_t v11;
  char *v12;
  char *v13;
  unint64_t v14;
  void *v15;
  void *v16;
  BOOL v17;
  uint64_t v18;
  void *v19;
  void *v20;
  id v21;
  uint64_t v22;
  void *v23;
  NSObject *v24;
  void *v25;
  void *v26;
  id v27;
  id v28;
  id v29;
  uint8_t buf[4];
  uint64_t v31;
  __int16 v32;
  void *v33;
  _OWORD v34[25];
  uint64_t v35;

  v35 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = a4;
  if ((objc_msgSend(v6, "isEqualToString:", &stru_1E70C89C0) & 1) == 0)
  {
    v7 = (char *)malloc_type_malloc(0x400uLL, 0x733EA5B1uLL);
    memset(v34, 0, sizeof(v34));
    objc_msgSend(v6, "getCString:maxLength:encoding:", v7, 1024, 4);
    v8 = strtok(v7, "^");
    if (v8)
    {
      v9 = 0;
      do
      {
        *((_QWORD *)v34 + v9++) = v8;
        if ((v9 & 1) != 0)
          v10 = "&";
        else
          v10 = "^";
        v8 = strtok(0, v10);
      }
      while (v8);
      if ((_DWORD)v9)
      {
        v11 = 0;
        do
        {
          if (strtok(*((char **)v34 + v11), "&"))
          {
            v12 = 0;
            do
            {
              v13 = v12;
              v12 = strtok(0, "&");
            }
            while (v12);
            if (v13)
              *((_QWORD *)v34 + v11) = v13;
          }
          ++v11;
        }
        while (v11 != v9);
        v14 = 0;
        do
        {
          if (*(_QWORD *)&v34[v14 / 2])
          {
            objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:");
            v15 = (void *)objc_claimAutoreleasedReturnValue();
          }
          else
          {
            v15 = 0;
          }
          if (*((_QWORD *)&v34[v14 / 2] + 1))
          {
            objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:");
            v16 = (void *)objc_claimAutoreleasedReturnValue();
            if (v16)
              v17 = v15 == 0;
            else
              v17 = 1;
            if (!v17)
            {
              if (objc_msgSend(v15, "isEqualToString:", CFSTR("D")))
              {
                objc_msgSend(v16, "doubleValue");
                objc_msgSend(v5, "setDuration:");
              }
              else if ((objc_msgSend(v15, "isEqualToString:", CFSTR("G")) & 1) == 0)
              {
                if (objc_msgSend(v15, "isEqualToString:", CFSTR("BUUID")))
                {
                  objc_msgSend(v5, "setBurstUUID:", v16);
                }
                else if (objc_msgSend(v15, "isEqualToString:", CFSTR("BFAV")))
                {
                  objc_msgSend(v5, "setBurstFavorite:", objc_msgSend(v16, "BOOLValue"));
                }
                else if (objc_msgSend(v15, "isEqualToString:", CFSTR("BPIK")))
                {
                  objc_msgSend(v5, "setBurstPicked:", objc_msgSend(v16, "BOOLValue"));
                }
                else if (objc_msgSend(v15, "isEqualToString:", CFSTR("HFRV")))
                {
                  objc_msgSend(v5, "setHighFramerate:", objc_msgSend(v16, "BOOLValue"));
                }
                else if (objc_msgSend(v15, "isEqualToString:", CFSTR("TLV")))
                {
                  objc_msgSend(v5, "setTimeLapse:", objc_msgSend(v16, "BOOLValue"));
                }
                else if (objc_msgSend(v15, "isEqualToString:", CFSTR("FPIK")))
                {
                  objc_msgSend(v5, "setFirstPicked:", objc_msgSend(v16, "BOOLValue"));
                }
                else if (objc_msgSend(v15, "isEqualToString:", CFSTR("GUUID")))
                {
                  objc_msgSend(v5, "setGroupUUID:", v16);
                }
                else if (objc_msgSend(v15, "isEqualToString:", CFSTR("RUUID")))
                {
                  objc_msgSend(v5, "setRelatedUUID:", v16);
                  objc_msgSend(v5, "device");
                  v27 = (id)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v27, "setAppleRelatedUUIDSupport:", 1);

                }
                else if (objc_msgSend(v15, "isEqualToString:", CFSTR("ON")))
                {
                  objc_msgSend(v5, "setOriginalFilename:", v16);
                }
                else if (objc_msgSend(v15, "isEqualToString:", CFSTR("CFN")))
                {
                  objc_msgSend(v5, "setCreatedFilename:", v16);
                }
                else if (objc_msgSend(v15, "isEqualToString:", CFSTR("OAID")))
                {
                  objc_msgSend(v5, "setOriginatingAssetID:", v16);
                }
                else if (objc_msgSend(v15, "isEqualToString:", CFSTR("SOCGID")))
                {
                  objc_msgSend(v5, "setSpatialOverCaptureGroupID:", v16);
                }
                else if (objc_msgSend(v15, "isEqualToString:", CFSTR("FPRINT")))
                {
                  objc_msgSend(v5, "setFingerprint:", v16);
                }
                else if (objc_msgSend(v15, "isEqualToString:", CFSTR("IO")))
                {
                  v28 = (id)objc_msgSend(v5, "orientation");
                  if (v28 != (id)objc_msgSend(v16, "integerValue"))
                  {
                    objc_msgSend(v5, "willChangeValueForKey:", CFSTR("orientation"));
                    objc_msgSend(v5, "willChangeValueForKey:", CFSTR("width"));
                    objc_msgSend(v5, "willChangeValueForKey:", CFSTR("height"));
                    objc_msgSend(v5, "setOrientation:", objc_msgSend(v16, "integerValue"));
                    __ICOSLogCreate();
                    objc_msgSend(v5, "name");
                    v29 = (id)objc_claimAutoreleasedReturnValue();
                    if ((unint64_t)objc_msgSend(v29, "length") >= 0x15)
                    {
                      objc_msgSend(v29, "substringWithRange:", 0, 18);
                      v25 = (void *)objc_claimAutoreleasedReturnValue();
                      objc_msgSend(v25, "stringByAppendingString:", CFSTR(".."));
                      v22 = objc_claimAutoreleasedReturnValue();

                      v29 = (id)v22;
                    }
                    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Height: %lu, Width: %lu, Orientation: %lu"), objc_msgSend(v5, "height"), objc_msgSend(v5, "width"), objc_msgSend(v5, "orientation"));
                    v26 = (void *)objc_claimAutoreleasedReturnValue();
                    v23 = (void *)_gICOSLog;
                    if (os_log_type_enabled((os_log_t)_gICOSLog, OS_LOG_TYPE_DEFAULT))
                    {
                      v21 = objc_retainAutorelease(v29);
                      v24 = v23;
                      v18 = objc_msgSend(v21, "UTF8String");
                      *(_DWORD *)buf = 136446466;
                      v31 = v18;
                      v32 = 2114;
                      v33 = v26;
                      _os_log_impl(&dword_1B98FC000, v24, OS_LOG_TYPE_DEFAULT, "%{public}20s | %{public}@", buf, 0x16u);

                    }
                    objc_msgSend(v5, "didChangeValueForKey:", CFSTR("orientation"));
                    objc_msgSend(v5, "didChangeValueForKey:", CFSTR("width"));
                    objc_msgSend(v5, "didChangeValueForKey:", CFSTR("height"));
                  }
                }
              }
            }
          }
          else
          {
            v16 = 0;
          }

          v14 += 2;
        }
        while (v14 < v9);
      }
    }
    objc_msgSend(v5, "relatedUUID");
    v19 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v19)
    {
      objc_msgSend(v5, "device");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "setAppleRelatedUUIDSupport:", 2);

    }
    free(v7);
  }

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_netServices, 0);
  objc_storeStrong((id *)&self->_netServiceBrowser, 0);
}

- (void)handleEventImp:(uint64_t)a3 .cold.1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_4(&dword_1B98FC000, a2, a3, "%{public}@", a5, a6, a7, a8, 2u);
}

@end
