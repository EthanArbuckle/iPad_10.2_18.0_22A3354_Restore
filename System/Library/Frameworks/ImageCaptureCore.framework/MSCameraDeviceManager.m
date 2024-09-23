@implementation MSCameraDeviceManager

- (id)deviceManagerConnection
{
  void *v3;
  void *v4;

  -[ICDeviceManager managerConnection](self, "managerConnection");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v3)
  {
    v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3B38]), "initWithServiceName:", CFSTR("com.apple.mscamerad-xpc"));
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
  MSCameraDeviceManager *v16;
  uint8_t buf[4];
  uint64_t v18;
  __int16 v19;
  void *v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
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
      v18 = -[__CFString UTF8String](v11, "UTF8String");
      v19 = 2114;
      v20 = v9;
      _os_log_impl(&dword_1B98FC000, v12, OS_LOG_TYPE_DEFAULT, "%{public}20s | %{public}@", buf, 0x16u);

    }
    objc_msgSend(v6, "remoteCamera");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14[0] = MEMORY[0x1E0C809B0];
    v14[1] = 3221225472;
    v14[2] = __47__MSCameraDeviceManager_startDeviceWithHandle___block_invoke;
    v14[3] = &unk_1E70C7280;
    v15 = v6;
    v16 = self;
    objc_msgSend(v13, "requestStartUsingDeviceWithReply:", v14);

  }
}

void __47__MSCameraDeviceManager_startDeviceWithHandle___block_invoke(uint64_t a1, void *a2)
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
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  uint64_t v24;
  void *v25;
  _QWORD block[4];
  id v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  _QWORD v32[2];
  _QWORD v33[2];
  _BYTE v34[128];
  uint64_t v35;

  v35 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("ICDeviceName"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("ICDeviceName"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "setName:", v5);

    objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("ICDeviceEjectable"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "setEjectable:", objc_msgSend(v6, "BOOLValue"));

    objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("ICDeviceType"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "setProductType:", v7);

    objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("ICDeviceProductKind"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "setProductKind:", v8);

    objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("ICDeviceLocked"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "setLocked:", objc_msgSend(v9, "BOOLValue"));

    objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("ICInternalDeviceUUID"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "setUUIDString:", v10);

    objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("ICInternalDeviceUUID"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "setPersistentIDString:", v11);

    objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("ICDeviceVolumePath"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "setVolumePath:", v12);

    objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("ICDeviceTransportType"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "setTransportType:", v13);

    objc_msgSend(*(id *)(a1 + 32), "setLocationDescription:", CFSTR("ICDeviceLocationDescriptionMassStorage"));
    objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("ICDeviceSystemSymbolName"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "setSystemSymbolName:", v14);

    objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("ICDeviceCapabilities"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v28 = 0u;
    v29 = 0u;
    v30 = 0u;
    v31 = 0u;
    v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v28, v34, 16);
    if (v16)
    {
      v17 = v16;
      v18 = *(_QWORD *)v29;
      do
      {
        v19 = 0;
        do
        {
          if (*(_QWORD *)v29 != v18)
            objc_enumerationMutation(v15);
          objc_msgSend(*(id *)(a1 + 32), "addCapability:", *(_QWORD *)(*((_QWORD *)&v28 + 1) + 8 * v19++));
        }
        while (v17 != v19);
        v17 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v28, v34, 16);
      }
      while (v17);
    }
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __47__MSCameraDeviceManager_startDeviceWithHandle___block_invoke_2;
    block[3] = &unk_1E70C7198;
    v27 = *(id *)(a1 + 32);
    dispatch_async(MEMORY[0x1E0C80D38], block);
    v20 = (void *)MEMORY[0x1E0CB3940];
    v21 = *(void **)(a1 + 40);
    objc_msgSend(*(id *)(a1 + 32), "name");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "stringWithFormat:", CFSTR("%@:%@"), CFSTR("ICDeviceOperationQueue"), v22);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "setDeviceOperationQueueName:", v23);

    objc_msgSend(*(id *)(a1 + 40), "setDeviceOperationQueueMaxConcurrentOperationCount:", 1);
    v24 = *(_QWORD *)(a1 + 32);
    v32[0] = CFSTR("device");
    v32[1] = CFSTR("type");
    v33[0] = v24;
    v33[1] = CFSTR("ICDeviceAdded");
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v33, v32, 2);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 40), "performSelectorOnMainThread:withObject:waitUntilDone:", sel_postNotification_, v25, 0);

  }
}

uint64_t __47__MSCameraDeviceManager_startDeviceWithHandle___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "fetchAutolaunchApplicationPath");
}

- (void)ejectImp:(id)a3
{
  id v4;
  void (**v5)(_QWORD, _QWORD, _QWORD);
  void *v6;
  void *v7;
  void *v8;
  id v9;

  v4 = a3;
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("device"));
  v9 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("cbBlock"));
  v5 = (void (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithObjectsAndKeys:", v9, CFSTR("device"), 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICDeviceManager remoteManager](self, "remoteManager");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    objc_msgSend(v9, "internalUUID");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "ejectDevice:withReply:", v8, &__block_literal_global_2);

  }
  objc_msgSend(v6, "setObject:forKeyedSubscript:", &unk_1E70DC608, CFSTR("errCode"));
  if (v5)
    ((void (**)(_QWORD, id, void *))v5)[2](v5, v9, v6);

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
  v12 = &unk_1E70DC620;
  if (v10)
    v12 = v10;
  v13 = v12;

  v14 = -[MSCameraDeviceManager checkFile:andDevice:](self, "checkFile:andDevice:", v5, v7);
  v26[3] = v14;
  if (v14)
  {
    -[MSCameraDeviceManager executeCompletionBlockWithErrorCode:info:file:completionDict:completionBlk:](self, "executeCompletionBlockWithErrorCode:info:file:completionDict:completionBlk:", v14, v6, v5, v11, v8);
  }
  else
  {
    v15 = (void *)MEMORY[0x1E0CB34C8];
    v17[0] = MEMORY[0x1E0C809B0];
    v17[1] = 3221225472;
    v17[2] = __45__MSCameraDeviceManager_getFileThumbnailImp___block_invoke;
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

void __45__MSCameraDeviceManager_getFileThumbnailImp___block_invoke(uint64_t a1)
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
  v20[2] = __45__MSCameraDeviceManager_getFileThumbnailImp___block_invoke_2;
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
    v13[2] = __45__MSCameraDeviceManager_getFileThumbnailImp___block_invoke_3;
    v13[3] = &unk_1E70C72F0;
    v14 = *(id *)(a1 + 48);
    v15 = *(id *)(a1 + 56);
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

uint64_t __45__MSCameraDeviceManager_getFileThumbnailImp___block_invoke_2(uint64_t a1)
{
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 24) = -21400;
  return objc_msgSend(*(id *)(a1 + 32), "executeCompletionBlockWithErrorCode:info:file:completionDict:completionBlk:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 24), *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 64));
}

void __45__MSCameraDeviceManager_getFileThumbnailImp___block_invoke_3(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
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
  void *v20;
  void *v21;
  uint8_t buf[4];
  uint64_t v23;
  __int16 v24;
  void *v25;
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = v3;
  if (v3)
  {
    objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("thumb"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (v5)
    {
      objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("metadata"));
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 32), "metadata");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      if (v7)
      {

      }
      else if (objc_msgSend(v6, "count"))
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
          objc_msgSend(*(id *)(a1 + 32), "name");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v11, "stringWithFormat:", CFSTR("Set Metadata ---> thumbnail %@"), v12);
          v13 = (void *)objc_claimAutoreleasedReturnValue();

          v14 = (void *)_gICOSLog;
          if (os_log_type_enabled((os_log_t)_gICOSLog, OS_LOG_TYPE_DEFAULT))
          {
            v15 = objc_retainAutorelease(v9);
            v16 = v14;
            *(_DWORD *)buf = 136446466;
            v23 = -[__CFString UTF8String](v15, "UTF8String");
            v24 = 2114;
            v25 = v13;
            _os_log_impl(&dword_1B98FC000, v16, OS_LOG_TYPE_DEFAULT, "%{public}20s | %{public}@", buf, 0x16u);

          }
        }
        objc_msgSend(*(id *)(a1 + 32), "setMetadata:", v6);
      }
      objc_msgSend(*(id *)(a1 + 32), "metadata");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = *MEMORY[0x1E0CBCFF0];
      objc_msgSend(v17, "objectForKeyedSubscript:", *MEMORY[0x1E0CBCFF0]);
      v19 = (void *)objc_claimAutoreleasedReturnValue();

      if (v19)
        objc_msgSend(*(id *)(a1 + 40), "setObject:forKeyedSubscript:", v19, v18);
      objc_msgSend(*(id *)(a1 + 40), "setObject:forKeyedSubscript:", v5, CFSTR("thumb"));
      objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("ICThumbnailRotated"));
      v20 = (void *)objc_claimAutoreleasedReturnValue();

      if (v20)
      {
        objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("ICThumbnailRotated"));
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(*(id *)(a1 + 40), "setObject:forKeyedSubscript:", v21, CFSTR("ICThumbnailRotated"));

      }
      v8 = 0;
    }
    else
    {
      v8 = -20097;
    }

  }
  else
  {
    v8 = -20097;
  }
  objc_msgSend(*(id *)(a1 + 48), "setDevConnectionFailureBlock:", 0);
  objc_msgSend(*(id *)(a1 + 56), "executeCompletionBlockWithErrorCode:info:file:completionDict:completionBlk:", v8, *(_QWORD *)(a1 + 64), *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 72));

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
  v10 = -[MSCameraDeviceManager checkFile:andDevice:](self, "checkFile:andDevice:", v7, v5);
  v21[3] = v10;
  if (v10)
  {
    -[MSCameraDeviceManager executeCompletionBlockWithErrorCode:info:file:completionDict:completionBlk:](self, "executeCompletionBlockWithErrorCode:info:file:completionDict:completionBlk:", v10, v6, v7, v9, v8);
  }
  else
  {
    v11 = (void *)MEMORY[0x1E0CB34C8];
    v13[0] = MEMORY[0x1E0C809B0];
    v13[1] = 3221225472;
    v13[2] = __44__MSCameraDeviceManager_getFileMetadataImp___block_invoke;
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

void __44__MSCameraDeviceManager_getFileMetadataImp___block_invoke(uint64_t a1)
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

  v18[2] = __44__MSCameraDeviceManager_getFileMetadataImp___block_invoke_2;
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
    v11[2] = __44__MSCameraDeviceManager_getFileMetadataImp___block_invoke_3;
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

uint64_t __44__MSCameraDeviceManager_getFileMetadataImp___block_invoke_2(uint64_t a1)
{
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 24) = -21400;
  return objc_msgSend(*(id *)(a1 + 32), "executeCompletionBlockWithErrorCode:info:file:completionDict:completionBlk:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 24), *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 64));
}

void __44__MSCameraDeviceManager_getFileMetadataImp___block_invoke_3(uint64_t a1, void *a2)
{
  void *v3;
  uint64_t v4;
  id v5;

  v5 = a2;
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("kCGImagePropertyOrientation"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v3)
    objc_msgSend(*(id *)(a1 + 32), "setObject:forKeyedSubscript:", &unk_1E70DC638, CFSTR("kCGImagePropertyOrientation"));
  if (v5)
  {
    objc_msgSend(*(id *)(a1 + 32), "setObject:forKeyedSubscript:", v5, CFSTR("metadata"));
    v4 = 0;
  }
  else
  {
    v4 = -20147;
  }
  objc_msgSend(*(id *)(a1 + 40), "setDevConnectionFailureBlock:", 0);
  objc_msgSend(*(id *)(a1 + 48), "executeCompletionBlockWithErrorCode:info:file:completionDict:completionBlk:", v4, *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 64), *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 72));

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
  v10 = -[MSCameraDeviceManager checkFile:andDevice:](self, "checkFile:andDevice:", v5, v7);
  v29[3] = v10;
  if (v10)
  {
    -[MSCameraDeviceManager executeCompletionBlockWithErrorCode:info:file:completionDict:completionBlk:](self, "executeCompletionBlockWithErrorCode:info:file:completionDict:completionBlk:", v10, v19, v5, v9, v6);
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
      -[MSCameraDeviceManager executeCompletionBlockWithErrorCode:info:file:completionDict:completionBlk:](self, "executeCompletionBlockWithErrorCode:info:file:completionDict:completionBlk:", -21449, v19, v5, v9, v6);
    }
    else
    {
      v16 = (void *)MEMORY[0x1E0CB34C8];
      v20[0] = MEMORY[0x1E0C809B0];
      v20[1] = 3221225472;
      v20[2] = __40__MSCameraDeviceManager_getFileDataImp___block_invoke;
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

void __40__MSCameraDeviceManager_getFileDataImp___block_invoke(uint64_t a1)
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

  v19[2] = __40__MSCameraDeviceManager_getFileDataImp___block_invoke_2;
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
    v12[2] = __40__MSCameraDeviceManager_getFileDataImp___block_invoke_3;
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

uint64_t __40__MSCameraDeviceManager_getFileDataImp___block_invoke_2(uint64_t a1)
{
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 24) = -21400;
  return objc_msgSend(*(id *)(a1 + 32), "executeCompletionBlockWithErrorCode:info:file:completionDict:completionBlk:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 24), *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 64));
}

void __40__MSCameraDeviceManager_getFileDataImp___block_invoke_3(uint64_t a1, void *a2)
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

- (void)deleteFileImp:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  __CFString *v11;
  void *v12;
  void *v13;
  void *v14;
  NSObject *v15;
  uint64_t v16;
  int64_t v17;
  void *v18;
  __CFString *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  NSObject *v25;
  uint64_t v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  _QWORD v31[5];
  id v32;
  id v33;
  id v34;
  id v35;
  id v36;
  id v37;
  uint64_t *v38;
  uint64_t v39;
  uint64_t *v40;
  uint64_t v41;
  uint64_t v42;
  uint8_t buf[4];
  uint64_t v44;
  __int16 v45;
  void *v46;
  uint64_t v47;

  v47 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v39 = 0;
  v40 = &v39;
  v41 = 0x2020000000;
  v42 = -9922;
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("device"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("info"));
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("file"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("cbBlock"));
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)MEMORY[0x1E0C99E08];
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("opts"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "dictionaryWithDictionary:", v8);
  v28 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithObjectsAndKeys:", v5, CFSTR("device"), v6, CFSTR("file"), 0);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  __ICOSLogCreate();
  if ((unint64_t)objc_msgSend(CFSTR("delete"), "length") < 0x15)
  {
    v11 = CFSTR("delete");
  }
  else
  {
    objc_msgSend(CFSTR("delete"), "substringWithRange:", 0, 18);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "stringByAppendingString:", CFSTR(".."));
    v11 = (__CFString *)objc_claimAutoreleasedReturnValue();

  }
  v12 = (void *)MEMORY[0x1E0CB3940];
  objc_msgSend(v6, "name");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "stringWithFormat:", CFSTR("MSCameraDeviceManager - %@"), v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  v15 = (id)_gICOSLog;
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
  {
    v16 = -[__CFString UTF8String](objc_retainAutorelease(v11), "UTF8String");
    *(_DWORD *)buf = 136446466;
    v44 = v16;
    v45 = 2114;
    v46 = v14;
    _os_log_impl(&dword_1B98FC000, v15, OS_LOG_TYPE_DEFAULT, "%{public}20s | %{public}@", buf, 0x16u);
  }

  v17 = -[MSCameraDeviceManager checkFile:andDevice:](self, "checkFile:andDevice:", v6, v5);
  v40[3] = v17;
  if (v17)
  {
    __ICOSLogCreate();
    if ((unint64_t)objc_msgSend(CFSTR("delete"), "length") < 0x15)
    {
      v19 = CFSTR("delete");
    }
    else
    {
      objc_msgSend(CFSTR("delete"), "substringWithRange:", 0, 18);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "stringByAppendingString:", CFSTR(".."));
      v19 = (__CFString *)objc_claimAutoreleasedReturnValue();

    }
    v22 = (void *)MEMORY[0x1E0CB3940];
    objc_msgSend(v6, "name");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "stringWithFormat:", CFSTR("File Check Failed - %@"), v23);
    v24 = (void *)objc_claimAutoreleasedReturnValue();

    v25 = (id)_gICOSLog;
    if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
    {
      v26 = -[__CFString UTF8String](objc_retainAutorelease(v19), "UTF8String");
      *(_DWORD *)buf = 136446466;
      v44 = v26;
      v45 = 2114;
      v46 = v24;
      _os_log_impl(&dword_1B98FC000, v25, OS_LOG_TYPE_DEFAULT, "%{public}20s | %{public}@", buf, 0x16u);
    }

    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v40[3]);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setObject:forKeyedSubscript:", v27, CFSTR("errCode"));

    -[MSCameraDeviceManager executeCompletionBlockWithErrorCode:info:file:completionDict:completionBlk:](self, "executeCompletionBlockWithErrorCode:info:file:completionDict:completionBlk:", v40[3], v30, v6, v9, v29);
  }
  else
  {
    v20 = (void *)MEMORY[0x1E0CB34C8];
    v31[0] = MEMORY[0x1E0C809B0];
    v31[1] = 3221225472;
    v31[2] = __39__MSCameraDeviceManager_deleteFileImp___block_invoke;
    v31[3] = &unk_1E70C7318;
    v38 = &v39;
    v31[4] = self;
    v32 = v30;
    v33 = v6;
    v34 = v9;
    v37 = v29;
    v35 = v5;
    v36 = v28;
    objc_msgSend(v20, "blockOperationWithBlock:", v31);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    -[ICDeviceManager addInteractiveOperation:](self, "addInteractiveOperation:", v21);

  }
  _Block_object_dispose(&v39, 8);

}

void __39__MSCameraDeviceManager_deleteFileImp___block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  __CFString *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  __CFString *v13;
  NSObject *v14;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  id v18;
  uint64_t v19;
  _QWORD v20[4];
  id v21;
  uint64_t v22;
  id v23;
  id v24;
  id v25;
  id v26;
  _QWORD v27[5];
  id v28;
  id v29;
  id v30;
  id v31;
  uint64_t v32;
  uint8_t buf[4];
  uint64_t v34;
  __int16 v35;
  void *v36;
  uint64_t v37;

  v37 = *MEMORY[0x1E0C80C00];
  v27[2] = __39__MSCameraDeviceManager_deleteFileImp___block_invoke_2;
  v27[3] = &unk_1E70C72C8;
  v2 = *(_QWORD *)(a1 + 32);
  v3 = *(void **)(a1 + 40);
  v32 = *(_QWORD *)(a1 + 88);
  v27[4] = v2;
  v4 = MEMORY[0x1E0C809B0];
  v27[0] = MEMORY[0x1E0C809B0];
  v27[1] = 3221225472;
  v28 = v3;
  v29 = *(id *)(a1 + 48);
  v30 = *(id *)(a1 + 56);
  v31 = *(id *)(a1 + 80);
  v5 = (void *)MEMORY[0x1BCCC74B4](v27);
  objc_msgSend(*(id *)(a1 + 64), "remoteCameraWithFailureBlock:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    objc_msgSend(*(id *)(a1 + 64), "setDevConnectionFailureBlock:", v5);
    __ICOSLogCreate();
    v7 = CFSTR("delete");
    if ((unint64_t)objc_msgSend(CFSTR("delete"), "length") >= 0x15)
    {
      objc_msgSend(CFSTR("delete"), "substringWithRange:", 0, 18);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "stringByAppendingString:", CFSTR(".."));
      v7 = (__CFString *)objc_claimAutoreleasedReturnValue();

    }
    v9 = (void *)MEMORY[0x1E0CB3940];
    objc_msgSend(*(id *)(a1 + 48), "name");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "stringWithFormat:", CFSTR("Remote Camera Good - %@"), v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    v12 = (void *)_gICOSLog;
    if (os_log_type_enabled((os_log_t)_gICOSLog, OS_LOG_TYPE_DEFAULT))
    {
      v13 = objc_retainAutorelease(v7);
      v14 = v12;
      v15 = -[__CFString UTF8String](v13, "UTF8String");
      *(_DWORD *)buf = 136446466;
      v34 = v15;
      v35 = 2114;
      v36 = v11;
      _os_log_impl(&dword_1B98FC000, v14, OS_LOG_TYPE_DEFAULT, "%{public}20s | %{public}@", buf, 0x16u);

    }
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend(*(id *)(a1 + 48), "objectID"));
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = *(_QWORD *)(a1 + 72);
    v20[0] = v4;
    v20[1] = 3221225472;
    v20[2] = __39__MSCameraDeviceManager_deleteFileImp___block_invoke_85;
    v20[3] = &unk_1E70C72F0;
    v18 = *(id *)(a1 + 48);
    v19 = *(_QWORD *)(a1 + 32);
    v21 = v18;
    v22 = v19;
    v23 = *(id *)(a1 + 56);
    v24 = *(id *)(a1 + 64);
    v25 = *(id *)(a1 + 40);
    v26 = *(id *)(a1 + 80);
    objc_msgSend(v6, "requestDeleteObjectHandle:options:withReply:", v16, v17, v20);

  }
}

uint64_t __39__MSCameraDeviceManager_deleteFileImp___block_invoke_2(uint64_t a1)
{
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 24) = -21400;
  return objc_msgSend(*(id *)(a1 + 32), "executeCompletionBlockWithErrorCode:info:file:completionDict:completionBlk:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 24), *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 64));
}

uint64_t __39__MSCameraDeviceManager_deleteFileImp___block_invoke_85(uint64_t a1, void *a2)
{
  void *v3;
  int v4;
  void *v5;
  void *v6;
  void *v7;
  __CFString *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  __CFString *v14;
  NSObject *v15;
  void *v16;
  uint8_t buf[4];
  uint64_t v19;
  __int16 v20;
  void *v21;
  void *v22;
  const __CFString *v23;
  _QWORD v24[2];

  v24[1] = *MEMORY[0x1E0C80C00];
  objc_msgSend(a2, "objectForKeyedSubscript:", CFSTR("errCode"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "intValue");

  if (!v4)
  {
    v23 = CFSTR("ICObjectIDArray");
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend(*(id *)(a1 + 32), "objectID"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = v5;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v22, 1);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v24[0] = v6;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v24, &v23, 1);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(*(id *)(a1 + 40), "notifyRemovedItems:", v7);
  }
  __ICOSLogCreate();
  v8 = CFSTR("delete");
  if ((unint64_t)objc_msgSend(CFSTR("delete"), "length") >= 0x15)
  {
    objc_msgSend(CFSTR("delete"), "substringWithRange:", 0, 18);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "stringByAppendingString:", CFSTR(".."));
    v8 = (__CFString *)objc_claimAutoreleasedReturnValue();

  }
  v10 = (void *)MEMORY[0x1E0CB3940];
  objc_msgSend(*(id *)(a1 + 32), "name");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "stringWithFormat:", CFSTR("Request->Reply - %@"), v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  v13 = (void *)_gICOSLog;
  if (os_log_type_enabled((os_log_t)_gICOSLog, OS_LOG_TYPE_DEFAULT))
  {
    v14 = objc_retainAutorelease(v8);
    v15 = v13;
    *(_DWORD *)buf = 136446466;
    v19 = -[__CFString UTF8String](v14, "UTF8String");
    v20 = 2114;
    v21 = v12;
    _os_log_impl(&dword_1B98FC000, v15, OS_LOG_TYPE_DEFAULT, "%{public}20s | %{public}@", buf, 0x16u);

  }
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v4);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 48), "setObject:forKeyedSubscript:", v16, CFSTR("errCode"));

  objc_msgSend(*(id *)(a1 + 56), "setDevConnectionFailureBlock:", 0);
  return objc_msgSend(*(id *)(a1 + 40), "executeCompletionBlockWithErrorCode:info:file:completionDict:completionBlk:", v4, *(_QWORD *)(a1 + 64), *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 72));
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
  v15 = -[MSCameraDeviceManager checkFile:andDevice:](self, "checkFile:andDevice:", v7, v5);
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
      v19[2] = __41__MSCameraDeviceManager_downloadFileImp___block_invoke;
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
  -[MSCameraDeviceManager executeCompletionBlockWithErrorCode:info:file:completionDict:completionBlk:](self, "executeCompletionBlockWithErrorCode:info:file:completionDict:completionBlk:", v15, v6, v7, v14, v13);
LABEL_5:

  _Block_object_dispose(&v27, 8);
}

void __41__MSCameraDeviceManager_downloadFileImp___block_invoke(uint64_t a1)
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

  v19[2] = __41__MSCameraDeviceManager_downloadFileImp___block_invoke_2;
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
    v12[2] = __41__MSCameraDeviceManager_downloadFileImp___block_invoke_3;
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

uint64_t __41__MSCameraDeviceManager_downloadFileImp___block_invoke_2(uint64_t a1)
{
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 24) = -21400;
  return objc_msgSend(*(id *)(a1 + 32), "executeCompletionBlockWithErrorCode:info:file:completionDict:completionBlk:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 24), *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 64));
}

uint64_t __41__MSCameraDeviceManager_downloadFileImp___block_invoke_3(uint64_t a1, void *a2)
{
  void *v3;
  uint64_t v4;

  objc_msgSend(a2, "objectForKeyedSubscript:", CFSTR("rc"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (int)objc_msgSend(v3, "intValue");

  objc_msgSend(*(id *)(a1 + 32), "setDevConnectionFailureBlock:", 0);
  return objc_msgSend(*(id *)(a1 + 40), "executeCompletionBlockWithErrorCode:info:file:completionDict:completionBlk:", v4, *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 64), *(_QWORD *)(a1 + 72));
}

- (void)getSecurityScopedURLImp:(id)a3
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
  v10 = -[MSCameraDeviceManager checkFile:andDevice:](self, "checkFile:andDevice:", v7, v5);
  v21[3] = v10;
  if (v10)
  {
    -[MSCameraDeviceManager executeCompletionBlockWithErrorCode:info:file:completionDict:completionBlk:](self, "executeCompletionBlockWithErrorCode:info:file:completionDict:completionBlk:", v10, v6, v7, v9, v8);
  }
  else
  {
    v11 = (void *)MEMORY[0x1E0CB34C8];
    v13[0] = MEMORY[0x1E0C809B0];
    v13[1] = 3221225472;
    v13[2] = __49__MSCameraDeviceManager_getSecurityScopedURLImp___block_invoke;
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

void __49__MSCameraDeviceManager_getSecurityScopedURLImp___block_invoke(uint64_t a1)
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

  v17[2] = __49__MSCameraDeviceManager_getSecurityScopedURLImp___block_invoke_2;
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
    v11[2] = __49__MSCameraDeviceManager_getSecurityScopedURLImp___block_invoke_3;
    v11[3] = &unk_1E70C7390;
    v8 = *(id *)(a1 + 64);
    v9 = *(_QWORD *)(a1 + 32);
    v10 = *(void **)(a1 + 40);
    v12 = v8;
    v13 = v9;
    v14 = v10;
    v15 = *(id *)(a1 + 48);
    v16 = *(id *)(a1 + 72);
    objc_msgSend(v6, "requestSecurityScopedURLForObjectHandle:withReply:", v7, v11);

  }
}

uint64_t __49__MSCameraDeviceManager_getSecurityScopedURLImp___block_invoke_2(uint64_t a1)
{
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 24) = -21400;
  return objc_msgSend(*(id *)(a1 + 32), "executeCompletionBlockWithErrorCode:info:file:completionDict:completionBlk:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 24), *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 64));
}

void __49__MSCameraDeviceManager_getSecurityScopedURLImp___block_invoke_3(uint64_t a1, void *a2)
{
  void *v3;
  int v4;
  void *v5;
  void *v6;
  id v7;

  v7 = a2;
  objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("rc"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "intValue");

  objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("ICSecurityScopedWrappedURL"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "url");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
    objc_msgSend(v7, "setObject:forKeyedSubscript:", v6, CFSTR("ICSecurityScopedURL"));
  objc_msgSend(*(id *)(a1 + 32), "setDevConnectionFailureBlock:", 0);
  objc_msgSend(*(id *)(a1 + 40), "executeCompletionBlockWithErrorCode:info:file:completionDict:completionBlk:", v4, *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56), v7, *(_QWORD *)(a1 + 64));

}

- (void)refreshObjectHandleInfoImp:(id)a3
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
  v10 = -[MSCameraDeviceManager checkFile:andDevice:](self, "checkFile:andDevice:", v7, v5);
  v21[3] = v10;
  if (v10)
  {
    -[MSCameraDeviceManager executeCompletionBlockWithErrorCode:info:file:completionDict:completionBlk:](self, "executeCompletionBlockWithErrorCode:info:file:completionDict:completionBlk:", v10, v6, v7, v9, v8);
  }
  else
  {
    v11 = (void *)MEMORY[0x1E0CB34C8];
    v13[0] = MEMORY[0x1E0C809B0];
    v13[1] = 3221225472;
    v13[2] = __52__MSCameraDeviceManager_refreshObjectHandleInfoImp___block_invoke;
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

void __52__MSCameraDeviceManager_refreshObjectHandleInfoImp___block_invoke(uint64_t a1)
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
  uint64_t v17;
  _QWORD v18[5];
  id v19;
  id v20;
  id v21;
  id v22;
  uint64_t v23;

  v18[2] = __52__MSCameraDeviceManager_refreshObjectHandleInfoImp___block_invoke_2;
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
    v11[2] = __52__MSCameraDeviceManager_refreshObjectHandleInfoImp___block_invoke_3;
    v11[3] = &unk_1E70C73B8;
    v12 = *(id *)(a1 + 48);
    v8 = *(id *)(a1 + 64);
    v9 = *(_QWORD *)(a1 + 32);
    v10 = *(void **)(a1 + 40);
    v13 = v8;
    v14 = v9;
    v17 = *(_QWORD *)(a1 + 80);
    v15 = v10;
    v16 = *(id *)(a1 + 72);
    objc_msgSend(v6, "requestRefreshObjectHandleInfo:withReply:", v7, v11);

  }
}

uint64_t __52__MSCameraDeviceManager_refreshObjectHandleInfoImp___block_invoke_2(uint64_t a1)
{
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 24) = -21400;
  return objc_msgSend(*(id *)(a1 + 32), "executeCompletionBlockWithErrorCode:info:file:completionDict:completionBlk:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 24), *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 64));
}

void __52__MSCameraDeviceManager_refreshObjectHandleInfoImp___block_invoke_3(uint64_t a1, void *a2)
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  v8 = a2;
  objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("errCode"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "integerValue");

  if (!v4)
  {
    objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("ICObjectInfoUpdate"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend(*(id *)(a1 + 32), "objectID"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "objectForKeyedSubscript:", v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(*(id *)(a1 + 32), "handleObjectInfoUpdate:", v7);
  }
  objc_msgSend(*(id *)(a1 + 40), "setDevConnectionFailureBlock:", 0);
  objc_msgSend(*(id *)(a1 + 48), "executeCompletionBlockWithErrorCode:info:file:completionDict:completionBlk:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 24), *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 32), v8, *(_QWORD *)(a1 + 64));

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
  v10 = -[MSCameraDeviceManager checkFile:andDevice:](self, "checkFile:andDevice:", v7, v5);
  v21[3] = v10;
  if (v10)
  {
    -[MSCameraDeviceManager executeCompletionBlockWithErrorCode:info:file:completionDict:completionBlk:](self, "executeCompletionBlockWithErrorCode:info:file:completionDict:completionBlk:", v10, v6, v7, v9, v8);
  }
  else
  {
    v11 = (void *)MEMORY[0x1E0CB34C8];
    v13[0] = MEMORY[0x1E0C809B0];
    v13[1] = 3221225472;
    v13[2] = __43__MSCameraDeviceManager_getFingerprintImp___block_invoke;
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

void __43__MSCameraDeviceManager_getFingerprintImp___block_invoke(uint64_t a1)
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

  v17[2] = __43__MSCameraDeviceManager_getFingerprintImp___block_invoke_2;
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
    v11[2] = __43__MSCameraDeviceManager_getFingerprintImp___block_invoke_3;
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

uint64_t __43__MSCameraDeviceManager_getFingerprintImp___block_invoke_2(uint64_t a1)
{
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 24) = -21400;
  return objc_msgSend(*(id *)(a1 + 32), "executeCompletionBlockWithErrorCode:info:file:completionDict:completionBlk:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 24), *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 64));
}

void __43__MSCameraDeviceManager_getFingerprintImp___block_invoke_3(uint64_t a1, void *a2)
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

- (void)notifyAddedItems:(id)a3
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
  _QWORD v13[4];
  __CFString *v14;
  MSCameraDeviceManager *v15;
  uint64_t *v16;
  uint64_t v17;
  uint64_t *v18;
  uint64_t v19;
  uint64_t (*v20)(uint64_t, uint64_t);
  void (*v21)(uint64_t);
  id v22;
  uint8_t buf[4];
  uint64_t v24;
  __int16 v25;
  void *v26;
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(MEMORY[0x1E0CB3B38], "currentConnection");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = 0;
  v18 = &v17;
  v19 = 0x3032000000;
  v20 = __Block_byref_object_copy__0;
  v21 = __Block_byref_object_dispose__0;
  -[ICDeviceManager deviceForConnection:](self, "deviceForConnection:", v5);
  v22 = (id)objc_claimAutoreleasedReturnValue();
  if (v18[5])
  {
    v6 = (void *)MEMORY[0x1E0CB34C8];
    v13[0] = MEMORY[0x1E0C809B0];
    v13[1] = 3221225472;
    v13[2] = __42__MSCameraDeviceManager_notifyAddedItems___block_invoke;
    v13[3] = &unk_1E70C73E0;
    v15 = self;
    v16 = &v17;
    v14 = (__CFString *)v4;
    objc_msgSend(v6, "blockOperationWithBlock:", v13);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[ICDeviceManager addInteractiveOperation:](self, "addInteractiveOperation:", v7);

    v8 = v14;
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
      v24 = v12;
      v25 = 2114;
      v26 = v10;
      _os_log_impl(&dword_1B98FC000, v11, OS_LOG_TYPE_DEFAULT, "%{public}20s | %{public}@", buf, 0x16u);
    }

  }
  _Block_object_dispose(&v17, 8);

}

void __42__MSCameraDeviceManager_notifyAddedItems___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t i;
  MSObjectInfoDataset *v7;
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
  BOOL v18;
  ICCameraFile *v19;
  void *v20;
  id v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  _BYTE v26[128];
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v21 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:", CFSTR("ICMSObjectInfoArray"));
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
        v7 = -[MSObjectInfoDataset initWithData:]([MSObjectInfoDataset alloc], "initWithData:", *(_QWORD *)(*((_QWORD *)&v22 + 1) + 8 * i));
        objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), "cameraFolderWithObjectID:", -[MSObjectInfoDataset parentObject](v7, "parentObject"));
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        if (v7)
        {
          v9 = -[MSObjectInfoDataset associationType](v7, "associationType");
          v10 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40);
          v11 = -[MSObjectInfoDataset objectHandle](v7, "objectHandle");
          if (v9 == 1)
          {
            objc_msgSend(v10, "cameraFolderWithObjectID:", v11);
            v12 = (void *)objc_claimAutoreleasedReturnValue();

            if (v12)
              goto LABEL_16;
            v13 = [ICCameraFolder alloc];
            -[MSObjectInfoDataset filename](v7, "filename");
            v14 = (void *)objc_claimAutoreleasedReturnValue();
            v15 = -[ICCameraFolder initWithName:parentFolder:device:](v13, "initWithName:parentFolder:device:", v14, v8, *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40));

            objc_msgSend(*(id *)(a1 + 40), "updateCameraFolder:withInfo:", v15, v7);
            if (v8)
            {
              v16 = v8;
              goto LABEL_19;
            }
            if (-[MSObjectInfoDataset parentObject](v7, "parentObject") == -2)
            {
              v16 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40);
LABEL_19:
              objc_msgSend(v16, "addFolder:", v15);
            }
            objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), "addCameraFolderToIndex:", v15);
          }
          else
          {
            objc_msgSend(v10, "cameraFileWithObjectID:", v11);
            v17 = (void *)objc_claimAutoreleasedReturnValue();

            if (v17)
              v18 = 1;
            else
              v18 = v8 == 0;
            if (v18)
            {
LABEL_16:
              objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), "setPreviouslyIndexed:", objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), "previouslyIndexed") + 1);
              goto LABEL_22;
            }
            v19 = [ICCameraFile alloc];
            -[MSObjectInfoDataset filename](v7, "filename");
            v20 = (void *)objc_claimAutoreleasedReturnValue();
            v15 = -[ICCameraFile initWithName:parentFolder:device:](v19, "initWithName:parentFolder:device:", v20, v8, *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40));

            objc_msgSend(*(id *)(a1 + 40), "updateCameraFile:withInfo:", v15, v7);
            objc_msgSend(v8, "addFile:", v15);
            objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), "addCameraFileToIndex:", v15);
            objc_msgSend(v21, "addObject:", v15);
          }

        }
LABEL_22:

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
  v22 = __Block_byref_object_copy__0;
  v23 = __Block_byref_object_dispose__0;
  -[ICDeviceManager deviceForConnection:](self, "deviceForConnection:", v5);
  v24 = (id)objc_claimAutoreleasedReturnValue();
  if (v20[5])
  {
    v6 = (void *)MEMORY[0x1E0CB34C8];
    v13 = MEMORY[0x1E0C809B0];
    v14 = 3221225472;
    v15 = __44__MSCameraDeviceManager_notifyRemovedItems___block_invoke;
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

void __44__MSCameraDeviceManager_notifyRemovedItems___block_invoke(uint64_t a1)
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
  v22 = __Block_byref_object_copy__0;
  v23 = __Block_byref_object_dispose__0;
  -[ICDeviceManager deviceForConnection:](self, "deviceForConnection:", v5);
  v24 = (id)objc_claimAutoreleasedReturnValue();
  if (v20[5])
  {
    v6 = (void *)MEMORY[0x1E0CB34C8];
    v13 = MEMORY[0x1E0C809B0];
    v14 = 3221225472;
    v15 = __44__MSCameraDeviceManager_notifyUpdatedItems___block_invoke;
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

void __44__MSCameraDeviceManager_notifyUpdatedItems___block_invoke(uint64_t a1)
{
  void *v2;
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

  v16 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:", CFSTR("ICObjectInfoUpdate"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
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
        objc_msgSend(v2, "objectForKeyedSubscript:", v7);
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), "cameraFileWithObjectID:", objc_msgSend(v7, "unsignedLongValue"));
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        v10 = v9;
        if (v9)
          objc_msgSend(v9, "handleObjectInfoUpdate:", v8);

      }
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v4);
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
  v22 = __Block_byref_object_copy__0;
  v23 = __Block_byref_object_dispose__0;
  -[ICDeviceManager deviceForConnection:](self, "deviceForConnection:", v5);
  v24 = (id)objc_claimAutoreleasedReturnValue();
  if (v20[5])
  {
    v6 = (void *)MEMORY[0x1E0CB34C8];
    v13 = MEMORY[0x1E0C809B0];
    v14 = 3221225472;
    v15 = __38__MSCameraDeviceManager_notifyStatus___block_invoke;
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

uint64_t __38__MSCameraDeviceManager_notifyStatus___block_invoke(uint64_t result)
{
  if (*(_QWORD *)(result + 32))
    return objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(result + 40) + 8) + 40), "handleStatusNotification:");
  return result;
}

- (void)updateCameraFolder:(id)a3 withInfo:(id)a4
{
  id v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  unint64_t v10;
  void *v11;
  id v12;

  v12 = a3;
  v5 = a4;
  v6 = (void *)MEMORY[0x1BCCC7334]();
  v7 = v5;
  objc_msgSend(v12, "setObjectHandle:", objc_msgSend(v7, "objectHandle"));
  objc_msgSend(v12, "setObjectID:", objc_msgSend(v7, "objectHandle"));
  objc_msgSend(MEMORY[0x1E0C99D68], "dateWithTimeIntervalSince1970:", (double)(unint64_t)objc_msgSend(v7, "captureDate_tvsec"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setCreationDate:", v8);
  v9 = (void *)MEMORY[0x1E0C99D68];
  v10 = objc_msgSend(v7, "modificationDate_tvsec");

  objc_msgSend(v9, "dateWithTimeIntervalSince1970:", (double)v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setModificationDate:", v11);

  objc_autoreleasePoolPop(v6);
}

- (void)updateCameraFile:(id)a3 withInfo:(id)a4
{
  id v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  void *v17;
  void **v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  int v26;
  id v27;
  char *v28;
  id v29;

  v29 = a3;
  v5 = a4;
  v6 = (void *)MEMORY[0x1BCCC7334]();
  v7 = v5;
  objc_msgSend(v29, "setObjectHandle:", objc_msgSend(v7, "objectHandle"));
  objc_msgSend(v29, "setObjectID:", objc_msgSend(v7, "objectHandle"));
  objc_msgSend(v7, "filename");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "pathExtension");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "lowercaseString");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10)
  {
    objc_msgSend(MEMORY[0x1E0CEC3F8], "typeWithFilenameExtension:", v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v11 = 0;
  }
  v12 = (void *)_gKnownRawExtensions;
  if (!_gKnownRawExtensions)
  {
    v13 = (void *)CGImageSourceCopyTypeExtensions();
    v14 = objc_msgSend(objc_alloc(MEMORY[0x1E0C99E20]), "initWithArray:", v13);
    v15 = (void *)_gKnownRawExtensions;
    _gKnownRawExtensions = v14;

    objc_msgSend((id)_gKnownRawExtensions, "removeObject:", CFSTR("tif"));
    v12 = (void *)_gKnownRawExtensions;
  }
  if (objc_msgSend(v12, "count") && objc_msgSend((id)_gKnownRawExtensions, "containsObject:", v10))
  {
    objc_msgSend(v29, "setRaw:", objc_msgSend((id)_gKnownRawExtensions, "containsObject:", v10));
LABEL_10:
    v18 = (void **)MEMORY[0x1E0CEC520];
LABEL_15:
    v19 = *v18;
    goto LABEL_16;
  }
  v16 = _gImageIOSupportedFileExtensions;
  objc_msgSend(v10, "lowercaseString");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v16) = objc_msgSend((id)v16, "containsObject:", v17);

  if ((v16 & 1) != 0)
    goto LABEL_10;
  if (!v11
    || (v19 = (void *)*MEMORY[0x1E0CEC568], (objc_msgSend(v11, "conformsToType:", *MEMORY[0x1E0CEC568]) & 1) == 0)
    && (v19 = (void *)*MEMORY[0x1E0CEC450], (objc_msgSend(v11, "conformsToType:", *MEMORY[0x1E0CEC450]) & 1) == 0))
  {
    v18 = (void **)MEMORY[0x1E0CEC4A0];
    goto LABEL_15;
  }
LABEL_16:
  objc_msgSend(v19, "identifier");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v29, "setUTI:", v20);

  objc_msgSend(v29, "setWidth:", objc_msgSend(v7, "imagePixWidth"));
  objc_msgSend(v29, "setHeight:", objc_msgSend(v7, "imagePixHeight"));
  objc_msgSend(v29, "setFileSize:", objc_msgSend(v7, "objectCompressedSize"));
  objc_msgSend(v29, "setHasThumbnail:", objc_msgSend(v7, "thumbCompressedSize") != 0);
  objc_msgSend(v29, "setHasMetadata:", 1);
  objc_msgSend(v29, "setParentID:", objc_msgSend(v7, "parentObject"));
  objc_msgSend(v29, "setLocked:", objc_msgSend(v7, "protectionStatus") != 0);
  objc_msgSend(MEMORY[0x1E0C99D68], "dateWithTimeIntervalSince1970:", (double)(unint64_t)objc_msgSend(v7, "captureDate_tvsec"));
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v29, "setCreationDate:", v21);
  objc_msgSend(MEMORY[0x1E0C99D68], "dateWithTimeIntervalSince1970:", (double)(unint64_t)objc_msgSend(v7, "modificationDate_tvsec"));
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v29, "setModificationDate:", v22);
  objc_msgSend(v29, "setFileCreationDate:", v21);
  objc_msgSend(v29, "setFileModificationDate:", v22);
  objc_msgSend(v29, "device");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "transportType");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v24, "isEqualToString:", CFSTR("ICTransportTypeUSB")) & 1) != 0)
  {
    objc_msgSend(v29, "device");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v26 = objc_msgSend(v25, "isAppleDevice");

    if (v26)
    {
      objc_msgSend(v29, "name");
      v27 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
      v28 = strstr((char *)objc_msgSend(v27, "UTF8String"), "_E");

      if (v28)
        objc_msgSend(v29, "flagMediaMetadata:", 8);
    }
  }
  else
  {

  }
  objc_autoreleasePoolPop(v6);

}

- (CGSize)cropThumbSize:(CGSize)a3 fullSize:(CGSize)a4 finalSize:(CGSize)a5
{
  double v5;
  double v6;
  double v7;
  double v8;
  BOOL v13;
  double v15;
  double v16;
  double v17;
  char v18;
  double v19;
  double v20;
  char v21;
  double v22;
  CGSize result;

  v5 = a3.width / a3.height;
  v6 = a4.width / a4.height;
  v7 = vabdd_f64(v6, a3.width / a3.height);
  v8 = 1.0;
  if (a3.width / a3.height <= 1.0 || v6 <= 1.0)
  {
    if (v5 < 1.0 && v6 < 1.0)
    {
      if (v7 > 0.0001)
      {
        a3.width = floor(a3.height * v6);
        v8 = a5.height / a3.height;
      }
    }
    else if (v5 >= 1.0 || v6 <= 1.0)
    {
      if (v5 > 1.0 && v6 < 1.0)
      {
        if (v7 > 0.0001)
        {
          a3.height = floor(a3.width * v6);
          v8 = a5.width / a3.width;
        }
      }
      else
      {
        v13 = v5 > 1.0 && v6 == 1.0;
        if (v13)
        {
          v8 = a5.width / a3.width;
          a3.width = a3.height;
        }
        else if (v5 <= 1.0 && v6 == 1.0)
        {
          v8 = a5.height / a3.height;
          a3.height = a3.width;
        }
      }
    }
    else if (v7 > 0.0001)
    {
      v8 = a5.height / a3.height;
      a3.width = floor(a3.height / v6);
    }
  }
  else if (v7 > 0.0001)
  {
    v8 = a5.width / a3.width;
    a3.height = floor(a3.width / v6);
  }
  v15 = a3.height * v8;
  v16 = floor(v15);
  v17 = a3.width * v8;
  v18 = vcvtmd_s64_f64(v15);
  v19 = floor(v17);
  v20 = v16 + -1.0;
  v13 = (v18 & 1) == 0;
  v21 = vcvtmd_s64_f64(v17);
  if (v13)
    v20 = v16;
  v22 = v19 + -1.0;
  if ((v21 & 1) == 0)
    v22 = v19;
  result.height = v20;
  result.width = v22;
  return result;
}

@end
