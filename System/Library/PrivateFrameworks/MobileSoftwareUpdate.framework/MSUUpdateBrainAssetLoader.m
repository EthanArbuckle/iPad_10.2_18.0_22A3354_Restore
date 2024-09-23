@implementation MSUUpdateBrainAssetLoader

- (MSUUpdateBrainAssetLoader)initWithUpdateAsset:(id)a3
{
  MSUUpdateBrainAssetLoader *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)MSUUpdateBrainAssetLoader;
  v4 = -[MSUUpdateBrainAssetLoader init](&v6, sel_init);
  if (v4)
    v4->_updateAsset = (MAAsset *)a3;
  return v4;
}

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)MSUUpdateBrainAssetLoader;
  -[MSUUpdateBrainLoader dealloc](&v3, sel_dealloc);
}

- (void)loadUpdateBrainWithMAOptions:(id)a3 progressHandler:(id)a4
{
  -[MSUUpdateBrainAssetLoader loadUpdateBrainWithMAOptions:clientOptionsFromPolicy:progressHandler:](self, "loadUpdateBrainWithMAOptions:clientOptionsFromPolicy:progressHandler:", a3, 0, a4);
}

- (void)loadUpdateBrainWithMAOptions:(id)a3 clientOptionsFromPolicy:(id)a4 progressHandler:(id)a5
{
  NSObject *v9;
  NSObject *global_queue;
  _QWORD block[9];
  uint8_t buf[4];
  const __CFString *v13;
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  v9 = objc_msgSend((id)objc_msgSend(MEMORY[0x24BEAEA70], "sharedLogger"), "oslog");
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    v13 = CFSTR("loadUpdateBrainWithMAOptions");
    _os_log_impl(&dword_211416000, v9, OS_LOG_TYPE_DEFAULT, "[BRAIN_LOADER] %{public}@ | BEGIN", buf, 0xCu);
  }
  global_queue = dispatch_get_global_queue(17, 0);
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __98__MSUUpdateBrainAssetLoader_loadUpdateBrainWithMAOptions_clientOptionsFromPolicy_progressHandler___block_invoke;
  block[3] = &unk_24CBCEE10;
  block[4] = a4;
  block[5] = self;
  block[6] = CFSTR("loadUpdateBrainWithMAOptions");
  block[7] = a3;
  block[8] = a5;
  dispatch_async(global_queue, block);
}

void __98__MSUUpdateBrainAssetLoader_loadUpdateBrainWithMAOptions_clientOptionsFromPolicy_progressHandler___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  uint64_t v4;
  NSObject *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t v15;
  int v16;
  uint64_t v17;
  NSObject *v18;
  uint64_t v19;
  _QWORD v20[6];
  id v21;
  uint8_t buf[4];
  uint64_t v23;
  uint64_t v24;
  _QWORD v25[2];

  v25[1] = *MEMORY[0x24BDAC8D0];
  v21 = 0;
  v2 = (void *)objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  v3 = (void *)objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  v4 = *(_QWORD *)(a1 + 32);
  if (v4)
    objc_msgSend(v2, "setObject:forKey:", v4, CFSTR("ClientOptions"));
  if (objc_msgSend(*(id *)(a1 + 40), "updateAsset"))
  {
    if (objc_msgSend((id)objc_msgSend(*(id *)(a1 + 40), "updateAsset"), "attributes"))
    {
      objc_msgSend(v2, "setObject:forKey:", objc_msgSend((id)objc_msgSend(*(id *)(a1 + 40), "updateAsset"), "attributes"), CFSTR("AssetProperties"));
    }
    else
    {
      v5 = objc_msgSend((id)objc_msgSend(MEMORY[0x24BEAEA70], "sharedLogger"), "oslog");
      if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
        __98__MSUUpdateBrainAssetLoader_loadUpdateBrainWithMAOptions_clientOptionsFromPolicy_progressHandler___block_invoke_cold_2(a1, v5, v6, v7, v8, v9, v10, v11);
    }
  }
  v12 = *(_QWORD *)(a1 + 56);
  if (v12)
    objc_msgSend(v3, "setObject:forKey:", v12, CFSTR("DownloadOptions"));
  v20[0] = MEMORY[0x24BDAC760];
  v20[1] = 3221225472;
  v20[2] = __98__MSUUpdateBrainAssetLoader_loadUpdateBrainWithMAOptions_clientOptionsFromPolicy_progressHandler___block_invoke_11;
  v20[3] = &unk_24CBCEDE8;
  v14 = *(_QWORD *)(a1 + 48);
  v13 = (uint64_t *)(a1 + 48);
  v15 = v13[2];
  v20[4] = v14;
  v20[5] = v15;
  v16 = perform_se_command_with_progress("LoadMABrain", v2, 0, (uint64_t)v3, 0, (const __CFString **)&v21, (uint64_t)v20);
  v17 = v13[2];
  if (v16)
  {
    v24 = *MEMORY[0x24BE66B40];
    v25[0] = *MEMORY[0x24BE66B20];
    (*(void (**)(uint64_t, uint64_t, _QWORD))(v17 + 16))(v17, objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v25, &v24, 1), 0);
    v18 = objc_msgSend((id)objc_msgSend(MEMORY[0x24BEAEA70], "sharedLogger"), "oslog");
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
    {
      v19 = *v13;
      *(_DWORD *)buf = 138543362;
      v23 = v19;
      _os_log_impl(&dword_211416000, v18, OS_LOG_TYPE_DEFAULT, "[BRAIN_LOADER] %{public}@ | SUCCESS", buf, 0xCu);
    }
  }
  else
  {
    (*(void (**)(uint64_t, _QWORD, id))(v17 + 16))(v17, 0, v21);
    if (os_log_type_enabled((os_log_t)objc_msgSend((id)objc_msgSend(MEMORY[0x24BEAEA70], "sharedLogger"), "oslog"), OS_LOG_TYPE_ERROR))
    {
      __98__MSUUpdateBrainAssetLoader_loadUpdateBrainWithMAOptions_clientOptionsFromPolicy_progressHandler___block_invoke_cold_1();
    }
  }
}

uint64_t __98__MSUUpdateBrainAssetLoader_loadUpdateBrainWithMAOptions_clientOptionsFromPolicy_progressHandler___block_invoke_11(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  NSObject *v5;
  _BOOL4 v6;
  uint64_t v7;
  const char *v8;
  uint64_t v9;
  int v11;
  uint64_t v12;
  __int16 v13;
  uint64_t v14;
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  v4 = *(_QWORD *)(a1 + 40);
  v5 = objc_msgSend((id)objc_msgSend(MEMORY[0x24BEAEA70], "sharedLogger"), "oslog");
  v6 = os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT);
  if (v4)
  {
    if (v6)
    {
      v7 = *(_QWORD *)(a1 + 32);
      v11 = 138543618;
      v12 = v7;
      v13 = 2114;
      v14 = a2;
      v8 = "[BRAIN_LOADER] %{public}@ | PROGRESS (not calling progress handler) | state:%{public}@";
LABEL_6:
      _os_log_impl(&dword_211416000, v5, OS_LOG_TYPE_DEFAULT, v8, (uint8_t *)&v11, 0x16u);
    }
  }
  else if (v6)
  {
    v9 = *(_QWORD *)(a1 + 32);
    v11 = 138543618;
    v12 = v9;
    v13 = 2114;
    v14 = a2;
    v8 = "[BRAIN_LOADER] %{public}@ | PROGRESS (no progress handler) | state:%{public}@";
    goto LABEL_6;
  }
  return 0;
}

- (void)loadUpdateBrainWithOptions:(id)a3 progressHandler:(id)a4
{
  NSObject *v7;
  NSObject *global_queue;
  _QWORD v9[8];
  uint8_t buf[4];
  const __CFString *v11;
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  v7 = objc_msgSend((id)objc_msgSend(MEMORY[0x24BEAEA70], "sharedLogger"), "oslog");
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    v11 = CFSTR("loadUpdateBrainWithOptions");
    _os_log_impl(&dword_211416000, v7, OS_LOG_TYPE_DEFAULT, "[BRAIN_LOADER] %{public}@ | BEGIN", buf, 0xCu);
  }
  global_queue = dispatch_get_global_queue(17, 0);
  v9[0] = MEMORY[0x24BDAC760];
  v9[1] = 3221225472;
  v9[2] = __72__MSUUpdateBrainAssetLoader_loadUpdateBrainWithOptions_progressHandler___block_invoke;
  v9[3] = &unk_24CBCEE38;
  v9[4] = self;
  v9[5] = CFSTR("loadUpdateBrainWithOptions");
  v9[6] = a3;
  v9[7] = a4;
  dispatch_async(global_queue, v9);
}

void __72__MSUUpdateBrainAssetLoader_loadUpdateBrainWithOptions_progressHandler___block_invoke(uint64_t a1)
{
  void *v2;
  NSObject *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t v13;
  int v14;
  uint64_t v15;
  NSObject *v16;
  uint64_t v17;
  _QWORD v18[6];
  id v19;
  uint8_t buf[4];
  uint64_t v21;
  uint64_t v22;
  _QWORD v23[2];

  v23[1] = *MEMORY[0x24BDAC8D0];
  v19 = 0;
  v2 = (void *)objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  if (objc_msgSend(*(id *)(a1 + 32), "updateAsset"))
  {
    if (objc_msgSend((id)objc_msgSend(*(id *)(a1 + 32), "updateAsset"), "attributes"))
    {
      objc_msgSend(v2, "setObject:forKey:", objc_msgSend((id)objc_msgSend(*(id *)(a1 + 32), "updateAsset"), "attributes"), CFSTR("AssetProperties"));
    }
    else
    {
      v3 = objc_msgSend((id)objc_msgSend(MEMORY[0x24BEAEA70], "sharedLogger"), "oslog");
      if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
        __72__MSUUpdateBrainAssetLoader_loadUpdateBrainWithOptions_progressHandler___block_invoke_cold_2(a1, v3, v4, v5, v6, v7, v8, v9);
    }
  }
  v10 = *(_QWORD *)(a1 + 48);
  if (v10)
    objc_msgSend(v2, "setObject:forKey:", v10, CFSTR("ClientOptions"));
  v18[0] = MEMORY[0x24BDAC760];
  v18[1] = 3221225472;
  v18[2] = __72__MSUUpdateBrainAssetLoader_loadUpdateBrainWithOptions_progressHandler___block_invoke_18;
  v18[3] = &unk_24CBCEDE8;
  v12 = *(_QWORD *)(a1 + 40);
  v11 = (uint64_t *)(a1 + 40);
  v13 = v11[2];
  v18[4] = v12;
  v18[5] = v13;
  v14 = perform_command_with_progress("LoadBrain", v2, 0, 0, (const __CFString **)&v19, (uint64_t)v18);
  v15 = v11[2];
  if (v14)
  {
    v22 = *MEMORY[0x24BE66B40];
    v23[0] = *MEMORY[0x24BE66B20];
    (*(void (**)(uint64_t, uint64_t, _QWORD))(v15 + 16))(v15, objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v23, &v22, 1), 0);
    v16 = objc_msgSend((id)objc_msgSend(MEMORY[0x24BEAEA70], "sharedLogger"), "oslog");
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      v17 = *v11;
      *(_DWORD *)buf = 138543362;
      v21 = v17;
      _os_log_impl(&dword_211416000, v16, OS_LOG_TYPE_DEFAULT, "[BRAIN_LOADER] %{public}@ | SUCCESS", buf, 0xCu);
    }
  }
  else
  {
    (*(void (**)(uint64_t, _QWORD, id))(v15 + 16))(v15, 0, v19);
    if (os_log_type_enabled((os_log_t)objc_msgSend((id)objc_msgSend(MEMORY[0x24BEAEA70], "sharedLogger"), "oslog"), OS_LOG_TYPE_ERROR))
    {
      __98__MSUUpdateBrainAssetLoader_loadUpdateBrainWithMAOptions_clientOptionsFromPolicy_progressHandler___block_invoke_cold_1();
    }
  }
}

uint64_t __72__MSUUpdateBrainAssetLoader_loadUpdateBrainWithOptions_progressHandler___block_invoke_18(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  NSObject *v5;
  _BOOL4 v6;
  uint64_t v7;
  uint64_t v8;
  int v10;
  uint64_t v11;
  __int16 v12;
  uint64_t v13;
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  v4 = *(_QWORD *)(a1 + 40);
  v5 = objc_msgSend((id)objc_msgSend(MEMORY[0x24BEAEA70], "sharedLogger"), "oslog");
  v6 = os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT);
  if (v4)
  {
    if (v6)
    {
      v7 = *(_QWORD *)(a1 + 32);
      v10 = 138543618;
      v11 = v7;
      v12 = 2114;
      v13 = a2;
      _os_log_impl(&dword_211416000, v5, OS_LOG_TYPE_DEFAULT, "[BRAIN_LOADER] %{public}@ | PROGRESS (calling progress handler) | state:%{public}@", (uint8_t *)&v10, 0x16u);
    }
    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  }
  else if (v6)
  {
    v8 = *(_QWORD *)(a1 + 32);
    v10 = 138543618;
    v11 = v8;
    v12 = 2114;
    v13 = a2;
    _os_log_impl(&dword_211416000, v5, OS_LOG_TYPE_DEFAULT, "[BRAIN_LOADER] %{public}@ | PROGRESS (no progress handler) | state:%{public}@", (uint8_t *)&v10, 0x16u);
  }
  return 0;
}

- (BOOL)cancel:(id *)a3
{
  NSObject *v5;
  int v6;
  id v7;
  NSObject *v8;
  NSObject *v9;
  uint64_t v11;
  uint64_t v12;
  uint8_t buf[4];
  const __CFString *v14;
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  v5 = objc_msgSend((id)objc_msgSend(MEMORY[0x24BEAEA70], "sharedLogger"), "oslog");
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    v14 = CFSTR("cancel");
    _os_log_impl(&dword_211416000, v5, OS_LOG_TYPE_DEFAULT, "[BRAIN_LOADER] %{public}@ | BEGIN", buf, 0xCu);
  }
  v12 = -[MAAsset attributes](-[MSUUpdateBrainAssetLoader updateAsset](self, "updateAsset", CFSTR("AssetProperties")), "attributes");
  v6 = perform_command("CancelLoadBrain", (void *)objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v12, &v11, 1), 0, 0, (CFTypeRef *)a3);
  if (a3)
    v7 = *a3;
  v8 = objc_msgSend((id)objc_msgSend(MEMORY[0x24BEAEA70], "sharedLogger"), "oslog");
  v9 = v8;
  if (v6)
  {
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      v14 = CFSTR("cancel");
      _os_log_impl(&dword_211416000, v9, OS_LOG_TYPE_DEFAULT, "[BRAIN_LOADER] %{public}@ | SUCCESS", buf, 0xCu);
    }
  }
  else if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
  {
    -[MSUUpdateBrainAssetLoader cancel:].cold.1();
  }
  return v6;
}

- (void)adjustMAOptions:(id)a3 completion:(id)a4
{
  NSObject *v7;
  NSObject *global_queue;
  _QWORD v9[8];
  uint8_t buf[4];
  const __CFString *v11;
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  v7 = objc_msgSend((id)objc_msgSend(MEMORY[0x24BEAEA70], "sharedLogger"), "oslog");
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    v11 = CFSTR("adjustMAOptions");
    _os_log_impl(&dword_211416000, v7, OS_LOG_TYPE_DEFAULT, "[BRAIN_LOADER] %{public}@ | BEGIN", buf, 0xCu);
  }
  global_queue = dispatch_get_global_queue(25, 0);
  v9[0] = MEMORY[0x24BDAC760];
  v9[1] = 3221225472;
  v9[2] = __56__MSUUpdateBrainAssetLoader_adjustMAOptions_completion___block_invoke;
  v9[3] = &unk_24CBCEE38;
  v9[4] = a3;
  v9[5] = CFSTR("adjustMAOptions");
  v9[6] = self;
  v9[7] = a4;
  dispatch_async(global_queue, v9);
}

uint64_t __56__MSUUpdateBrainAssetLoader_adjustMAOptions_completion___block_invoke(uint64_t a1)
{
  void *v2;
  NSObject *v3;
  uint64_t v4;
  uint64_t v5;
  int v6;
  NSObject *v7;
  NSObject *v8;
  uint64_t v9;
  id v11;
  uint8_t buf[4];
  uint64_t v13;
  const __CFString *v14;
  uint64_t v15;
  const __CFString *v16;
  _QWORD v17[2];

  v17[1] = *MEMORY[0x24BDAC8D0];
  v11 = 0;
  if (*(_QWORD *)(a1 + 32))
  {
    if (objc_msgSend(*(id *)(a1 + 48), "updateAsset"))
    {
      v16 = CFSTR("AssetProperties");
      v17[0] = objc_msgSend((id)objc_msgSend(*(id *)(a1 + 48), "updateAsset"), "attributes");
      v2 = (void *)objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v17, &v16, 1);
    }
    else
    {
      v2 = 0;
    }
    v5 = *(_QWORD *)(a1 + 32);
    v14 = CFSTR("DownloadConfig");
    v15 = v5;
    v6 = perform_se_command("MAAdjustLoadBrainOptions", v2, 0, objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v15, &v14, 1), 0, (CFTypeRef *)&v11);
    v7 = objc_msgSend((id)objc_msgSend(MEMORY[0x24BEAEA70], "sharedLogger"), "oslog");
    v8 = v7;
    if (v6)
    {
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      {
        v9 = *(_QWORD *)(a1 + 40);
        *(_DWORD *)buf = 138543362;
        v13 = v9;
        _os_log_impl(&dword_211416000, v8, OS_LOG_TYPE_DEFAULT, "[BRAIN_LOADER] %{public}@ | SUCCESS", buf, 0xCu);
      }
    }
    else if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      __56__MSUUpdateBrainAssetLoader_adjustMAOptions_completion___block_invoke_cold_2();
    }
  }
  else
  {
    v3 = objc_msgSend((id)objc_msgSend(MEMORY[0x24BEAEA70], "sharedLogger"), "oslog");
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
      __56__MSUUpdateBrainAssetLoader_adjustMAOptions_completion___block_invoke_cold_1(a1, v3, v4);
  }
  return (*(uint64_t (**)(_QWORD, id))(*(_QWORD *)(a1 + 56) + 16))(*(_QWORD *)(a1 + 56), v11);
}

- (void)adjustOptions:(id)a3 completion:(id)a4
{
  NSObject *v7;
  NSObject *global_queue;
  _QWORD v9[8];
  uint8_t buf[4];
  const __CFString *v11;
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  v7 = objc_msgSend((id)objc_msgSend(MEMORY[0x24BEAEA70], "sharedLogger"), "oslog");
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    v11 = CFSTR("adjustOptions");
    _os_log_impl(&dword_211416000, v7, OS_LOG_TYPE_DEFAULT, "[BRAIN_LOADER] %{public}@ | BEGIN", buf, 0xCu);
  }
  global_queue = dispatch_get_global_queue(17, 0);
  v9[0] = MEMORY[0x24BDAC760];
  v9[1] = 3221225472;
  v9[2] = __54__MSUUpdateBrainAssetLoader_adjustOptions_completion___block_invoke;
  v9[3] = &unk_24CBCEE38;
  v9[4] = a3;
  v9[5] = self;
  v9[6] = CFSTR("adjustOptions");
  v9[7] = a4;
  dispatch_async(global_queue, v9);
}

uint64_t __54__MSUUpdateBrainAssetLoader_adjustOptions_completion___block_invoke(_QWORD *a1)
{
  void *v2;
  uint64_t v3;
  int v4;
  NSObject *v5;
  NSObject *v6;
  uint64_t v7;
  id v9;
  uint8_t buf[4];
  uint64_t v11;
  _QWORD v12[2];
  _QWORD v13[3];

  v13[2] = *MEMORY[0x24BDAC8D0];
  v9 = 0;
  v3 = a1[4];
  v2 = (void *)a1[5];
  v12[0] = CFSTR("ClientOptions");
  v12[1] = CFSTR("AssetProperties");
  v13[0] = v3;
  v13[1] = objc_msgSend((id)objc_msgSend(v2, "updateAsset"), "attributes");
  v4 = perform_command("AdjustLoadBrainOptions", (void *)objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v13, v12, 2), 0, 0, (CFTypeRef *)&v9);
  v5 = objc_msgSend((id)objc_msgSend(MEMORY[0x24BEAEA70], "sharedLogger"), "oslog");
  v6 = v5;
  if (v4)
  {
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      v7 = a1[6];
      *(_DWORD *)buf = 138543362;
      v11 = v7;
      _os_log_impl(&dword_211416000, v6, OS_LOG_TYPE_DEFAULT, "[BRAIN_LOADER] %{public}@ | SUCCESS", buf, 0xCu);
    }
  }
  else if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
  {
    __54__MSUUpdateBrainAssetLoader_adjustOptions_completion___block_invoke_cold_1();
  }
  return (*(uint64_t (**)(_QWORD, id))(a1[7] + 16))(a1[7], v9);
}

- (BOOL)purgeUpdateBrains:(id *)a3
{
  NSObject *v4;
  char v5;
  id v6;
  NSObject *v7;
  int v9;
  const __CFString *v10;
  uint64_t v11;

  v11 = *MEMORY[0x24BDAC8D0];
  v4 = objc_msgSend((id)objc_msgSend(MEMORY[0x24BEAEA70], "sharedLogger"), "oslog");
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v9 = 138543362;
    v10 = CFSTR("purgeUpdateBrains");
    _os_log_impl(&dword_211416000, v4, OS_LOG_TYPE_DEFAULT, "[BRAIN_LOADER] %{public}@ | BEGIN", (uint8_t *)&v9, 0xCu);
  }
  v5 = perform_command("PurgeBrains", 0, 0, 0, (CFTypeRef *)a3);
  if (a3)
  {
    v6 = *a3;
    if (os_log_type_enabled((os_log_t)objc_msgSend((id)objc_msgSend(MEMORY[0x24BEAEA70], "sharedLogger"), "oslog"), OS_LOG_TYPE_ERROR))
    {
      -[MSUUpdateBrainAssetLoader purgeUpdateBrains:].cold.1();
    }
  }
  else
  {
    v7 = objc_msgSend((id)objc_msgSend(MEMORY[0x24BEAEA70], "sharedLogger"), "oslog");
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      v9 = 138543362;
      v10 = CFSTR("purgeUpdateBrains");
      _os_log_impl(&dword_211416000, v7, OS_LOG_TYPE_DEFAULT, "[BRAIN_LOADER] %{public}@ | SUCCESS", (uint8_t *)&v9, 0xCu);
    }
  }
  return v5;
}

- (int64_t)requiredDiskSpace:(id *)a3
{
  NSObject *v5;
  void *v6;
  char v7;
  id v8;
  id v9;
  char isKindOfClass;
  NSObject *v11;
  NSObject *v12;
  uint64_t v13;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  NSObject *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  id v30;
  uint8_t buf[4];
  const __CFString *v32;
  __int16 v33;
  uint64_t v34;
  const __CFString *v35;
  _QWORD v36[2];

  v36[1] = *MEMORY[0x24BDAC8D0];
  v5 = objc_msgSend((id)objc_msgSend(MEMORY[0x24BEAEA70], "sharedLogger"), "oslog");
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    v32 = CFSTR("requiredDiskSpace");
    _os_log_impl(&dword_211416000, v5, OS_LOG_TYPE_DEFAULT, "[BRAIN_LOADER] %{public}@ | BEGIN", buf, 0xCu);
  }
  if (-[MAAsset attributes](-[MSUUpdateBrainAssetLoader updateAsset](self, "updateAsset"), "attributes"))
  {
    v35 = CFSTR("AssetProperties");
    v36[0] = -[MAAsset attributes](-[MSUUpdateBrainAssetLoader updateAsset](self, "updateAsset"), "attributes");
    v6 = (void *)objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v36, &v35, 1);
  }
  else
  {
    v6 = 0;
  }
  v30 = 0;
  v7 = perform_command("RequiredDiskSpace", v6, 0, (const __CFString **)&v30, (CFTypeRef *)a3);
  v8 = v30;
  if (a3)
  {
    v9 = *a3;
    if ((v7 & 1) == 0)
    {
      if (os_log_type_enabled((os_log_t)objc_msgSend((id)objc_msgSend(MEMORY[0x24BEAEA70], "sharedLogger"), "oslog"), OS_LOG_TYPE_ERROR))
      {
        -[MSUUpdateBrainAssetLoader requiredDiskSpace:].cold.3();
      }
      return -1;
    }
  }
  else if ((v7 & 1) == 0)
  {
    v22 = objc_msgSend((id)objc_msgSend(MEMORY[0x24BEAEA70], "sharedLogger"), "oslog");
    if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
      -[MSUUpdateBrainAssetLoader requiredDiskSpace:].cold.2(v22, v23, v24, v25, v26, v27, v28, v29);
    return -1;
  }
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();
  v11 = objc_msgSend((id)objc_msgSend(MEMORY[0x24BEAEA70], "sharedLogger"), "oslog");
  v12 = v11;
  if ((isKindOfClass & 1) == 0)
  {
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      -[MSUUpdateBrainAssetLoader requiredDiskSpace:].cold.1(v12, v15, v16, v17, v18, v19, v20, v21);
    return -1;
  }
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    v13 = objc_msgSend(v30, "longLongValue");
    *(_DWORD *)buf = 138543618;
    v32 = CFSTR("requiredDiskSpace");
    v33 = 2048;
    v34 = v13;
    _os_log_impl(&dword_211416000, v12, OS_LOG_TYPE_DEFAULT, "[BRAIN_LOADER] %{public}@ | SUCCESS | Required disk space: %llu bytes", buf, 0x16u);
  }
  return objc_msgSend(v30, "longLongValue");
}

- (MAAsset)updateAsset
{
  return self->_updateAsset;
}

- (void)setUpdateAsset:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 16);
}

void __98__MSUUpdateBrainAssetLoader_loadUpdateBrainWithMAOptions_clientOptionsFromPolicy_progressHandler___block_invoke_cold_1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0(&dword_211416000, v0, v1, "[BRAIN_LOADER] %{public}@ | FAILURE | error:%{public}@");
  OUTLINED_FUNCTION_2();
}

void __98__MSUUpdateBrainAssetLoader_loadUpdateBrainWithMAOptions_clientOptionsFromPolicy_progressHandler___block_invoke_cold_2(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_4(&dword_211416000, a2, a3, "[BRAIN_LOADER] %{public}@ | associated update asset yet no associated attributes", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_2();
}

void __72__MSUUpdateBrainAssetLoader_loadUpdateBrainWithOptions_progressHandler___block_invoke_cold_2(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_4(&dword_211416000, a2, a3, "[BRAIN_LOADER] %{public}@ | associated update asset yet no associated attributes", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_2();
}

- (void)cancel:.cold.1()
{
  uint64_t v0;
  os_log_t v1;
  int v2;

  v2 = 138543618;
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_0(&dword_211416000, v0, v1, "[BRAIN_LOADER] %{public}@ | FAILURE | error:%{public}@", v2);
  OUTLINED_FUNCTION_2();
}

void __56__MSUUpdateBrainAssetLoader_adjustMAOptions_completion___block_invoke_cold_1(uint64_t a1, NSObject *a2, uint64_t a3)
{
  uint64_t v3;
  int v4;
  uint64_t v5;
  __int16 v6;
  uint64_t v7;
  uint64_t v8;

  v8 = *MEMORY[0x24BDAC8D0];
  v3 = *(_QWORD *)(a1 + 40);
  v4 = 138543618;
  v5 = v3;
  v6 = 2114;
  v7 = 0;
  OUTLINED_FUNCTION_1(&dword_211416000, a2, a3, "[BRAIN_LOADER] %{public}@ | FAILURE | error:%{public}@", (uint8_t *)&v4);
  OUTLINED_FUNCTION_2();
}

void __56__MSUUpdateBrainAssetLoader_adjustMAOptions_completion___block_invoke_cold_2()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0(&dword_211416000, v0, v1, "[BRAIN_LOADER] %{public}@ | FAILURE | command kCommandBrainLoaderMAAdjustOptions failed, error:%{public}@");
  OUTLINED_FUNCTION_2();
}

void __54__MSUUpdateBrainAssetLoader_adjustOptions_completion___block_invoke_cold_1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0(&dword_211416000, v0, v1, "[BRAIN_LOADER] %{public}@ | FAILURE | command kCommandBrainLoaderAdjustOptions failed, error:%{public}@");
  OUTLINED_FUNCTION_2();
}

- (void)purgeUpdateBrains:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  int v2[6];
  uint64_t v3;

  v3 = *MEMORY[0x24BDAC8D0];
  v2[0] = 138543618;
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_1(&dword_211416000, v0, v1, "[BRAIN_LOADER] %{public}@ | FAILURE | command kCommandBrainLoaderPurge failed, error:%{public}@", (uint8_t *)v2);
  OUTLINED_FUNCTION_2();
}

- (void)requiredDiskSpace:(uint64_t)a3 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_4(&dword_211416000, a1, a3, "[BRAIN_LOADER] %{public}@ | FAILURE | Unexpected response type", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_2();
}

- (void)requiredDiskSpace:(uint64_t)a3 .cold.2(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_4(&dword_211416000, a1, a3, "[BRAIN_LOADER] %{public}@ | FAILURE | Required disk space check failed", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_2();
}

- (void)requiredDiskSpace:.cold.3()
{
  NSObject *v0;
  uint64_t v1;
  int v2[6];
  uint64_t v3;

  v3 = *MEMORY[0x24BDAC8D0];
  v2[0] = 138543618;
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_1(&dword_211416000, v0, v1, "[BRAIN_LOADER] %{public}@ | FAILURE | Required disk space check failed, error:%{public}@", (uint8_t *)v2);
  OUTLINED_FUNCTION_2();
}

@end
