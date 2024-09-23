@implementation MIBUNFCReaderSession

- (MIBUNFCReaderSession)init
{
  MIBUNFCReaderSession *v2;
  MIBUNFCReaderSession *v3;
  dispatch_semaphore_t v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)MIBUNFCReaderSession;
  v2 = -[MIBUNFCReaderSession init](&v6, sel_init);
  v3 = v2;
  if (v2)
  {
    -[MIBUNFCReaderSession setNfSession:](v2, "setNfSession:", 0);
    -[MIBUNFCReaderSession setReaderSession:](v3, "setReaderSession:", 0);
    v4 = dispatch_semaphore_create(0);
    -[MIBUNFCReaderSession setConnectSem:](v3, "setConnectSem:", v4);

  }
  return v3;
}

- (void)start:(id *)a3
{
  void *v5;
  void *v6;
  void *v7;
  NSObject *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  NSObject *v13;
  void *v14;
  _QWORD v15[6];
  _BYTE buf[24];
  uint64_t (*v17)(uint64_t, uint64_t);
  void (*v18)(uint64_t);
  id v19;
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  -[MIBUNFCReaderSession nfSession](self, "nfSession");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    if (MIBUOnceToken != -1)
      dispatch_once(&MIBUOnceToken, &__block_literal_global_12);
    v6 = (void *)MIBUConnObj;
    if (os_log_type_enabled((os_log_t)MIBUConnObj, OS_LOG_TYPE_DEFAULT))
    {
      v7 = (void *)MEMORY[0x24BDD17C8];
      v8 = v6;
      objc_msgSend(v7, "stringWithFormat:", CFSTR("NFSession already in progress"));
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      *(_QWORD *)&buf[4] = self;
      *(_WORD *)&buf[12] = 2114;
      *(_QWORD *)&buf[14] = v9;
      _os_log_impl(&dword_222C3F000, v8, OS_LOG_TYPE_DEFAULT, "Device %{public}@: %{public}@", buf, 0x16u);

    }
  }
  else
  {
    *(_QWORD *)buf = 0;
    *(_QWORD *)&buf[8] = buf;
    *(_QWORD *)&buf[16] = 0x3032000000;
    v17 = __Block_byref_object_copy__0;
    v18 = __Block_byref_object_dispose__0;
    v19 = 0;
    v15[0] = MEMORY[0x24BDAC760];
    v15[1] = 3221225472;
    v15[2] = __30__MIBUNFCReaderSession_start___block_invoke_12;
    v15[3] = &unk_24EB55C70;
    v15[4] = self;
    v15[5] = buf;
    v10 = (void *)MEMORY[0x22767B83C](v15);
    objc_msgSend(MEMORY[0x24BE6B5A0], "sharedHardwareManagerWithNoUI");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "startReaderSession:", v10);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[MIBUNFCReaderSession setNfSession:](self, "setNfSession:", v12);

    -[MIBUNFCReaderSession connectSem](self, "connectSem");
    v13 = objc_claimAutoreleasedReturnValue();
    dispatch_semaphore_wait(v13, 0xFFFFFFFFFFFFFFFFLL);

    v14 = *(void **)(*(_QWORD *)&buf[8] + 40);
    if (v14)
      *a3 = objc_retainAutorelease(v14);

    _Block_object_dispose(buf, 8);
  }
}

void __30__MIBUNFCReaderSession_start___block_invoke()
{
  os_log_t v0;
  void *v1;
  _BOOL8 v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;

  v0 = os_log_create("com.apple.mobileinboxupdater", "device");
  v1 = (void *)MIBUConnObj;
  MIBUConnObj = (uint64_t)v0;

  if (!MIBUConnObj)
  {
    v2 = os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR);
    if (v2)
      __authInstalllogHandler_block_invoke_cold_1(v2, v3, v4, v5, v6, v7, v8, v9);
  }
}

void __30__MIBUNFCReaderSession_start___block_invoke_12(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  uint64_t v8;
  void *v9;
  NSObject *v10;
  void *v11;
  uint64_t *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  char v16;
  void *v17;
  uint64_t v18;
  void *v19;
  NSObject *v20;
  void *v21;
  void *v22;
  void *v23;
  id obj;
  uint8_t buf[4];
  uint64_t v26;
  __int16 v27;
  void *v28;
  uint64_t v29;

  v29 = *MEMORY[0x24BDAC8D0];
  v5 = a2;
  v6 = a3;
  if (v6)
  {
    if (MIBUOnceToken != -1)
      dispatch_once(&MIBUOnceToken, &__block_literal_global_13_0);
    v23 = (void *)MIBUConnObj;
    if (os_log_type_enabled((os_log_t)MIBUConnObj, OS_LOG_TYPE_ERROR))
      __30__MIBUNFCReaderSession_start___block_invoke_12_cold_2(a1, v23);
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), a3);
  }
  else
  {
    if (MIBUOnceToken != -1)
      dispatch_once(&MIBUOnceToken, &__block_literal_global_17_1);
    v7 = (void *)MIBUConnObj;
    if (os_log_type_enabled((os_log_t)MIBUConnObj, OS_LOG_TYPE_DEFAULT))
    {
      v8 = *(_QWORD *)(a1 + 32);
      v9 = (void *)MEMORY[0x24BDD17C8];
      v10 = v7;
      objc_msgSend(v9, "stringWithFormat:", CFSTR("Session started"));
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v26 = v8;
      v27 = 2114;
      v28 = v11;
      _os_log_impl(&dword_222C3F000, v10, OS_LOG_TYPE_DEFAULT, "Device %{public}@: %{public}@", buf, 0x16u);

    }
    v12 = (uint64_t *)(a1 + 32);
    objc_msgSend(v5, "setDelegate:", *(_QWORD *)(a1 + 32));
    objc_msgSend(*(id *)(a1 + 32), "setReaderSession:", v5);
    v14 = *(_QWORD *)(a1 + 40);
    v13 = a1 + 40;
    v15 = *(_QWORD *)(v14 + 8);
    obj = *(id *)(v15 + 40);
    v16 = objc_msgSend(v5, "startPollingWithError:", &obj);
    objc_storeStrong((id *)(v15 + 40), obj);
    if ((v16 & 1) != 0)
    {
      if (MIBUOnceToken != -1)
        dispatch_once(&MIBUOnceToken, &__block_literal_global_25_1);
      v17 = (void *)MIBUConnObj;
      if (os_log_type_enabled((os_log_t)MIBUConnObj, OS_LOG_TYPE_DEFAULT))
      {
        v18 = *v12;
        v19 = (void *)MEMORY[0x24BDD17C8];
        v20 = v17;
        objc_msgSend(v19, "stringWithFormat:", CFSTR("Reader is polling for tags"));
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v26 = v18;
        v27 = 2114;
        v28 = v21;
        _os_log_impl(&dword_222C3F000, v20, OS_LOG_TYPE_DEFAULT, "Device %{public}@: %{public}@", buf, 0x16u);

      }
    }
    else
    {
      if (MIBUOnceToken != -1)
        dispatch_once(&MIBUOnceToken, &__block_literal_global_21_1);
      v22 = (void *)MIBUConnObj;
      if (os_log_type_enabled((os_log_t)MIBUConnObj, OS_LOG_TYPE_ERROR))
        __30__MIBUNFCReaderSession_start___block_invoke_12_cold_1(v12, v13, v22);
    }
  }

}

void __30__MIBUNFCReaderSession_start___block_invoke_2()
{
  os_log_t v0;
  void *v1;
  _BOOL8 v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;

  v0 = os_log_create("com.apple.mobileinboxupdater", "device");
  v1 = (void *)MIBUConnObj;
  MIBUConnObj = (uint64_t)v0;

  if (!MIBUConnObj)
  {
    v2 = os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR);
    if (v2)
      __authInstalllogHandler_block_invoke_cold_1(v2, v3, v4, v5, v6, v7, v8, v9);
  }
}

void __30__MIBUNFCReaderSession_start___block_invoke_16()
{
  os_log_t v0;
  void *v1;
  _BOOL8 v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;

  v0 = os_log_create("com.apple.mobileinboxupdater", "device");
  v1 = (void *)MIBUConnObj;
  MIBUConnObj = (uint64_t)v0;

  if (!MIBUConnObj)
  {
    v2 = os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR);
    if (v2)
      __authInstalllogHandler_block_invoke_cold_1(v2, v3, v4, v5, v6, v7, v8, v9);
  }
}

void __30__MIBUNFCReaderSession_start___block_invoke_20()
{
  os_log_t v0;
  void *v1;
  _BOOL8 v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;

  v0 = os_log_create("com.apple.mobileinboxupdater", "device");
  v1 = (void *)MIBUConnObj;
  MIBUConnObj = (uint64_t)v0;

  if (!MIBUConnObj)
  {
    v2 = os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR);
    if (v2)
      __authInstalllogHandler_block_invoke_cold_1(v2, v3, v4, v5, v6, v7, v8, v9);
  }
}

void __30__MIBUNFCReaderSession_start___block_invoke_24()
{
  os_log_t v0;
  void *v1;
  _BOOL8 v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;

  v0 = os_log_create("com.apple.mobileinboxupdater", "device");
  v1 = (void *)MIBUConnObj;
  MIBUConnObj = (uint64_t)v0;

  if (!MIBUConnObj)
  {
    v2 = os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR);
    if (v2)
      __authInstalllogHandler_block_invoke_cold_1(v2, v3, v4, v5, v6, v7, v8, v9);
  }
}

- (void)disconnectTag:(id *)a3
{
  void *v5;
  char v6;
  id v7;
  void *v8;
  id v9;

  -[MIBUNFCReaderSession readerSession](self, "readerSession");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = 0;
  v6 = objc_msgSend(v5, "disconnectTagWithError:", &v9);
  v7 = v9;

  if ((v6 & 1) == 0)
  {
    if (MIBUOnceToken != -1)
      dispatch_once(&MIBUOnceToken, &__block_literal_global_30_2);
    v8 = (void *)MIBUConnObj;
    if (os_log_type_enabled((os_log_t)MIBUConnObj, OS_LOG_TYPE_ERROR))
    {
      -[MIBUNFCReaderSession disconnectTag:].cold.1((uint64_t)self, v8, (uint64_t)v7);
      if (!v7)
        goto LABEL_7;
      goto LABEL_6;
    }
  }
  if (v7)
LABEL_6:
    *a3 = objc_retainAutorelease(v7);
LABEL_7:

}

void __38__MIBUNFCReaderSession_disconnectTag___block_invoke()
{
  os_log_t v0;
  void *v1;
  _BOOL8 v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;

  v0 = os_log_create("com.apple.mobileinboxupdater", "device");
  v1 = (void *)MIBUConnObj;
  MIBUConnObj = (uint64_t)v0;

  if (!MIBUConnObj)
  {
    v2 = os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR);
    if (v2)
      __authInstalllogHandler_block_invoke_cold_1(v2, v3, v4, v5, v6, v7, v8, v9);
  }
}

- (void)end
{
  void *v3;
  void *v4;
  NSObject *v5;
  void *v6;
  void *v7;
  int v8;
  MIBUNFCReaderSession *v9;
  __int16 v10;
  void *v11;
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  if (MIBUOnceToken != -1)
    dispatch_once(&MIBUOnceToken, &__block_literal_global_33_1);
  v3 = (void *)MIBUConnObj;
  if (os_log_type_enabled((os_log_t)MIBUConnObj, OS_LOG_TYPE_DEFAULT))
  {
    v4 = (void *)MEMORY[0x24BDD17C8];
    v5 = v3;
    objc_msgSend(v4, "stringWithFormat:", CFSTR("Ending session"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = 138543618;
    v9 = self;
    v10 = 2114;
    v11 = v6;
    _os_log_impl(&dword_222C3F000, v5, OS_LOG_TYPE_DEFAULT, "Device %{public}@: %{public}@", (uint8_t *)&v8, 0x16u);

  }
  -[MIBUNFCReaderSession nfSession](self, "nfSession");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "endSession");

}

void __27__MIBUNFCReaderSession_end__block_invoke()
{
  os_log_t v0;
  void *v1;
  _BOOL8 v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;

  v0 = os_log_create("com.apple.mobileinboxupdater", "device");
  v1 = (void *)MIBUConnObj;
  MIBUConnObj = (uint64_t)v0;

  if (!MIBUConnObj)
  {
    v2 = os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR);
    if (v2)
      __authInstalllogHandler_block_invoke_cold_1(v2, v3, v4, v5, v6, v7, v8, v9);
  }
}

- (id)sendCommand:(id)a3 withError:(id *)a4
{
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  NSObject *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  id v22;
  void *v23;
  void *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  id v31;
  uint64_t v32;
  id v33;
  id v34;
  void *v35;
  void *v36;
  uint8_t buf[4];
  MIBUNFCReaderSession *v38;
  __int16 v39;
  void *v40;
  uint64_t v41;

  v41 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  objc_msgSend(v6, "serializedPayload");
  v7 = objc_claimAutoreleasedReturnValue();
  v12 = (void *)v7;
  if (!v6)
  {
    v36 = 0;
    safeAssignError(&v36, 0x80000000, 0, CFSTR("nil command to send"), v8, v9, v10, v11, v32);
    v25 = v36;
LABEL_14:
    v22 = v25;
    v23 = 0;
    v21 = 0;
    goto LABEL_9;
  }
  if (!v7)
  {
    v35 = 0;
    safeAssignError(&v35, 0x80000000, 0, CFSTR("nil payload to send"), v8, v9, v10, v11, v32);
    v25 = v35;
    goto LABEL_14;
  }
  if (MIBUOnceToken != -1)
    dispatch_once(&MIBUOnceToken, &__block_literal_global_40);
  v13 = (void *)MIBUConnObj;
  if (os_log_type_enabled((os_log_t)MIBUConnObj, OS_LOG_TYPE_DEFAULT))
  {
    v14 = (void *)MEMORY[0x24BDD17C8];
    v15 = v13;
    v16 = objc_msgSend(v6, "code");
    objc_msgSend(v6, "apdu");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "stringWithFormat:", CFSTR("Sending command %ld with apdu %@"), v16, v17);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v38 = self;
    v39 = 2114;
    v40 = v18;
    _os_log_impl(&dword_222C3F000, v15, OS_LOG_TYPE_DEFAULT, "Device %{public}@: %{public}@", buf, 0x16u);

  }
  -[MIBUNFCReaderSession readerSession](self, "readerSession");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "apdu");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v34 = 0;
  objc_msgSend(v19, "transceive:error:", v20, &v34);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = v34;

  v23 = (void *)objc_msgSend(objc_alloc((Class)objc_msgSend(v6, "getResponseClass")), "initWithResponsePayload:", v21);
  if (!v23)
  {
    v33 = v22;
    v26 = objc_msgSend(v6, "code");
    safeAssignError(&v33, 2147483650, 0, CFSTR("Failed to deserialize NFC response for command: %ld"), v27, v28, v29, v30, v26);
    v31 = v33;

    v22 = v31;
  }
LABEL_9:
  if (a4)
    *a4 = objc_retainAutorelease(v22);

  return v23;
}

void __46__MIBUNFCReaderSession_sendCommand_withError___block_invoke()
{
  os_log_t v0;
  void *v1;
  _BOOL8 v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;

  v0 = os_log_create("com.apple.mobileinboxupdater", "device");
  v1 = (void *)MIBUConnObj;
  MIBUConnObj = (uint64_t)v0;

  if (!MIBUConnObj)
  {
    v2 = os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR);
    if (v2)
      __authInstalllogHandler_block_invoke_cold_1(v2, v3, v4, v5, v6, v7, v8, v9);
  }
}

- (void)readerSession:(id)a3 didDetectTags:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  NSObject *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  char v15;
  id v16;
  void *v17;
  void *v18;
  NSObject *v19;
  void *v20;
  void *v21;
  void *v22;
  NSObject *v23;
  void *v24;
  void *v25;
  NSObject *v26;
  id v27;
  uint8_t buf[4];
  MIBUNFCReaderSession *v29;
  __int16 v30;
  void *v31;
  uint64_t v32;

  v32 = *MEMORY[0x24BDAC8D0];
  v5 = a4;
  if (objc_msgSend(v5, "count"))
  {
    -[MIBUNFCReaderSession setTags:](self, "setTags:", v5);
    if (MIBUOnceToken != -1)
      dispatch_once(&MIBUOnceToken, &__block_literal_global_45_2);
    v6 = (void *)MIBUConnObj;
    if (os_log_type_enabled((os_log_t)MIBUConnObj, OS_LOG_TYPE_DEFAULT))
    {
      v7 = (void *)MEMORY[0x24BDD17C8];
      v8 = v6;
      -[MIBUNFCReaderSession tags](self, "tags");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "objectAtIndex:", 0);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "stringWithFormat:", CFSTR("Trying to connect to tag: %@"), v10);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v29 = self;
      v30 = 2114;
      v31 = v11;
      _os_log_impl(&dword_222C3F000, v8, OS_LOG_TYPE_DEFAULT, "Device %{public}@: %{public}@", buf, 0x16u);

    }
    -[MIBUNFCReaderSession readerSession](self, "readerSession");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[MIBUNFCReaderSession tags](self, "tags");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "objectAtIndex:", 0);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v27 = 0;
    v15 = objc_msgSend(v12, "connectTag:error:", v14, &v27);
    v16 = v27;

    if ((v15 & 1) != 0)
    {
      if (MIBUOnceToken != -1)
        dispatch_once(&MIBUOnceToken, &__block_literal_global_53_0);
      v17 = (void *)MIBUConnObj;
      if (os_log_type_enabled((os_log_t)MIBUConnObj, OS_LOG_TYPE_DEFAULT))
      {
        v18 = (void *)MEMORY[0x24BDD17C8];
        v19 = v17;
        objc_msgSend(v18, "stringWithFormat:", CFSTR("Connected to tag successfully"));
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v29 = self;
        v30 = 2114;
        v31 = v20;
        _os_log_impl(&dword_222C3F000, v19, OS_LOG_TYPE_DEFAULT, "Device %{public}@: %{public}@", buf, 0x16u);

      }
    }
    else
    {
      if (MIBUOnceToken != -1)
        dispatch_once(&MIBUOnceToken, &__block_literal_global_49_0);
      v25 = (void *)MIBUConnObj;
      if (os_log_type_enabled((os_log_t)MIBUConnObj, OS_LOG_TYPE_ERROR))
        -[MIBUNFCReaderSession readerSession:didDetectTags:].cold.1((uint64_t)self, v25, (uint64_t)v16);
    }
  }
  else
  {
    if (MIBUOnceToken != -1)
      dispatch_once(&MIBUOnceToken, &__block_literal_global_57);
    v21 = (void *)MIBUConnObj;
    if (os_log_type_enabled((os_log_t)MIBUConnObj, OS_LOG_TYPE_DEFAULT))
    {
      v22 = (void *)MEMORY[0x24BDD17C8];
      v23 = v21;
      objc_msgSend(v22, "stringWithFormat:", CFSTR("No tags available to connect to"));
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v29 = self;
      v30 = 2114;
      v31 = v24;
      _os_log_impl(&dword_222C3F000, v23, OS_LOG_TYPE_DEFAULT, "Device %{public}@: %{public}@", buf, 0x16u);

    }
    v16 = 0;
  }
  -[MIBUNFCReaderSession connectSem](self, "connectSem");
  v26 = objc_claimAutoreleasedReturnValue();
  dispatch_semaphore_signal(v26);

}

void __52__MIBUNFCReaderSession_readerSession_didDetectTags___block_invoke()
{
  os_log_t v0;
  void *v1;
  _BOOL8 v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;

  v0 = os_log_create("com.apple.mobileinboxupdater", "device");
  v1 = (void *)MIBUConnObj;
  MIBUConnObj = (uint64_t)v0;

  if (!MIBUConnObj)
  {
    v2 = os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR);
    if (v2)
      __authInstalllogHandler_block_invoke_cold_1(v2, v3, v4, v5, v6, v7, v8, v9);
  }
}

void __52__MIBUNFCReaderSession_readerSession_didDetectTags___block_invoke_48()
{
  os_log_t v0;
  void *v1;
  _BOOL8 v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;

  v0 = os_log_create("com.apple.mobileinboxupdater", "device");
  v1 = (void *)MIBUConnObj;
  MIBUConnObj = (uint64_t)v0;

  if (!MIBUConnObj)
  {
    v2 = os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR);
    if (v2)
      __authInstalllogHandler_block_invoke_cold_1(v2, v3, v4, v5, v6, v7, v8, v9);
  }
}

void __52__MIBUNFCReaderSession_readerSession_didDetectTags___block_invoke_52()
{
  os_log_t v0;
  void *v1;
  _BOOL8 v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;

  v0 = os_log_create("com.apple.mobileinboxupdater", "device");
  v1 = (void *)MIBUConnObj;
  MIBUConnObj = (uint64_t)v0;

  if (!MIBUConnObj)
  {
    v2 = os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR);
    if (v2)
      __authInstalllogHandler_block_invoke_cold_1(v2, v3, v4, v5, v6, v7, v8, v9);
  }
}

void __52__MIBUNFCReaderSession_readerSession_didDetectTags___block_invoke_56()
{
  os_log_t v0;
  void *v1;
  _BOOL8 v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;

  v0 = os_log_create("com.apple.mobileinboxupdater", "device");
  v1 = (void *)MIBUConnObj;
  MIBUConnObj = (uint64_t)v0;

  if (!MIBUConnObj)
  {
    v2 = os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR);
    if (v2)
      __authInstalllogHandler_block_invoke_cold_1(v2, v3, v4, v5, v6, v7, v8, v9);
  }
}

- (BOOL)suppressLogging
{
  return self->_suppressLogging;
}

- (void)setSuppressLogging:(BOOL)a3
{
  self->_suppressLogging = a3;
}

- (NFSession)nfSession
{
  return self->_nfSession;
}

- (void)setNfSession:(id)a3
{
  objc_storeStrong((id *)&self->_nfSession, a3);
}

- (NFReaderSession)readerSession
{
  return self->_readerSession;
}

- (void)setReaderSession:(id)a3
{
  objc_storeStrong((id *)&self->_readerSession, a3);
}

- (NSArray)tags
{
  return self->_tags;
}

- (void)setTags:(id)a3
{
  objc_storeStrong((id *)&self->_tags, a3);
}

- (OS_dispatch_semaphore)connectSem
{
  return self->_connectSem;
}

- (void)setConnectSem:(id)a3
{
  objc_storeStrong((id *)&self->_connectSem, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_connectSem, 0);
  objc_storeStrong((id *)&self->_tags, 0);
  objc_storeStrong((id *)&self->_readerSession, 0);
  objc_storeStrong((id *)&self->_nfSession, 0);
}

void __30__MIBUNFCReaderSession_start___block_invoke_12_cold_1(uint64_t *a1, uint64_t a2, void *a3)
{
  uint64_t v3;
  void *v4;
  uint64_t v5;
  NSObject *v6;
  void *v7;
  uint64_t v8;
  int v9;
  uint64_t v10;
  uint64_t v11;

  v11 = *MEMORY[0x24BDAC8D0];
  v3 = *a1;
  v4 = (void *)MEMORY[0x24BDD17C8];
  v5 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)a2 + 8) + 40);
  v6 = a3;
  objc_msgSend(v4, "stringWithFormat:", CFSTR("Failed to start polling : %@"), v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = 138543618;
  v10 = v3;
  OUTLINED_FUNCTION_4_2();
  OUTLINED_FUNCTION_3_4(&dword_222C3F000, v6, v8, "Device Error %{public}@: %{public}@", (uint8_t *)&v9);

  OUTLINED_FUNCTION_2_3();
}

void __30__MIBUNFCReaderSession_start___block_invoke_12_cold_2(uint64_t a1, void *a2)
{
  uint64_t v2;
  void *v3;
  NSObject *v4;
  void *v5;
  uint64_t v6;
  int v7;
  uint64_t v8;
  __int16 v9;
  void *v10;
  uint64_t v11;

  v11 = *MEMORY[0x24BDAC8D0];
  v2 = *(_QWORD *)(a1 + 32);
  v3 = (void *)MEMORY[0x24BDD17C8];
  v4 = a2;
  objc_msgSend(v3, "stringWithFormat:", CFSTR("Failed to start NFReader session"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = 138543618;
  v8 = v2;
  v9 = 2114;
  v10 = v5;
  OUTLINED_FUNCTION_3_4(&dword_222C3F000, v4, v6, "Device Error %{public}@: %{public}@", (uint8_t *)&v7);

}

- (void)disconnectTag:(uint64_t)a3 .cold.1(uint64_t a1, void *a2, uint64_t a3)
{
  void *v5;
  NSObject *v6;
  void *v7;
  uint64_t v8;
  int v9;
  uint64_t v10;
  uint64_t v11;

  v11 = *MEMORY[0x24BDAC8D0];
  v5 = (void *)MEMORY[0x24BDD17C8];
  v6 = a2;
  objc_msgSend(v5, "stringWithFormat:", CFSTR("Failed to disconnect : %@"), a3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = 138543618;
  v10 = a1;
  OUTLINED_FUNCTION_4_2();
  OUTLINED_FUNCTION_3_4(&dword_222C3F000, v6, v8, "Device Error %{public}@: %{public}@", (uint8_t *)&v9);

  OUTLINED_FUNCTION_2_3();
}

- (void)readerSession:(uint64_t)a3 didDetectTags:.cold.1(uint64_t a1, void *a2, uint64_t a3)
{
  void *v5;
  NSObject *v6;
  void *v7;
  uint64_t v8;
  int v9;
  uint64_t v10;
  uint64_t v11;

  v11 = *MEMORY[0x24BDAC8D0];
  v5 = (void *)MEMORY[0x24BDD17C8];
  v6 = a2;
  objc_msgSend(v5, "stringWithFormat:", CFSTR("Error encountered when connecting to tag: %@"), a3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = 138543618;
  v10 = a1;
  OUTLINED_FUNCTION_4_2();
  OUTLINED_FUNCTION_3_4(&dword_222C3F000, v6, v8, "Device Error %{public}@: %{public}@", (uint8_t *)&v9);

  OUTLINED_FUNCTION_2_3();
}

@end
