@implementation AXContainerManager

- (AXUIClient)containerServerClient
{
  AXUIClient *containerServerClient;
  id v4;
  void *v5;
  AXUIClient *v6;
  AXUIClient *v7;

  containerServerClient = self->_containerServerClient;
  if (!containerServerClient)
  {
    v4 = objc_alloc(MEMORY[0x24BDFF8F0]);
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("AXContainerManager-%d"), 0);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = (AXUIClient *)objc_msgSend(v4, "initWithIdentifier:serviceBundleName:", v5, CFSTR("AXContainerManagerServer"));
    v7 = self->_containerServerClient;
    self->_containerServerClient = v6;

    containerServerClient = self->_containerServerClient;
  }
  return containerServerClient;
}

+ (id)sharedManager
{
  if (sharedManager_onceToken != -1)
    dispatch_once(&sharedManager_onceToken, &__block_literal_global);
  return (id)sharedManager_manager;
}

void __35__AXContainerManager_sharedManager__block_invoke()
{
  AXContainerManager *v0;
  void *v1;

  v0 = objc_alloc_init(AXContainerManager);
  v1 = (void *)sharedManager_manager;
  sharedManager_manager = (uint64_t)v0;

}

- (void)readDataForFileAtAccessibilityContainerPath:(id)a3 completion:(id)a4
{
  id v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  _QWORD v13[4];
  id v14;
  uint64_t v15;
  _QWORD v16[2];

  v16[1] = *MEMORY[0x24BDAC8D0];
  v6 = a4;
  v15 = *MEMORY[0x24BDFFEE8];
  v16[0] = a3;
  v7 = (void *)MEMORY[0x24BDBCE70];
  v8 = a3;
  objc_msgSend(v7, "dictionaryWithObjects:forKeys:count:", v16, &v15, 1);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[AXContainerManager containerServerClient](self, "containerServerClient");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BE00580], "mainAccessQueue");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v13[0] = MEMORY[0x24BDAC760];
  v13[1] = 3221225472;
  v13[2] = __77__AXContainerManager_readDataForFileAtAccessibilityContainerPath_completion___block_invoke;
  v13[3] = &unk_24D1A8E10;
  v14 = v6;
  v12 = v6;
  objc_msgSend(v10, "sendAsynchronousMessage:withIdentifier:targetAccessQueue:completion:", v9, 1, v11, v13);

}

void __77__AXContainerManager_readDataForFileAtAccessibilityContainerPath_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  void *v5;
  void *v6;
  id v7;

  v7 = a2;
  getErrorCascading(a3, v7);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  }
  else
  {
    objc_msgSend(v7, "objectForKeyedSubscript:", *MEMORY[0x24BDFFED8]);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

  }
}

- (void)writeData:(id)a3 toFileAtAccessibilityContainerPath:(id)a4 completion:(id)a5
{
  id v8;
  uint64_t v9;
  void *v10;
  id v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  _QWORD v17[4];
  id v18;
  _QWORD v19[2];
  _QWORD v20[3];

  v20[2] = *MEMORY[0x24BDAC8D0];
  v8 = a5;
  v9 = *MEMORY[0x24BDFFED8];
  v19[0] = *MEMORY[0x24BDFFEE8];
  v19[1] = v9;
  v20[0] = a4;
  v20[1] = a3;
  v10 = (void *)MEMORY[0x24BDBCE70];
  v11 = a4;
  v12 = a3;
  objc_msgSend(v10, "dictionaryWithObjects:forKeys:count:", v20, v19, 2);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[AXContainerManager containerServerClient](self, "containerServerClient");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BE00580], "mainAccessQueue");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v17[0] = MEMORY[0x24BDAC760];
  v17[1] = 3221225472;
  v17[2] = __78__AXContainerManager_writeData_toFileAtAccessibilityContainerPath_completion___block_invoke;
  v17[3] = &unk_24D1A8E10;
  v18 = v8;
  v16 = v8;
  objc_msgSend(v14, "sendAsynchronousMessage:withIdentifier:targetAccessQueue:completion:", v13, 2, v15, v17);

}

void __78__AXContainerManager_writeData_toFileAtAccessibilityContainerPath_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4;

  getErrorCascading(a3, a2);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

}

- (void)deleteFileAtAccessibilityContainerPath:(id)a3 completion:(id)a4
{
  id v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  _QWORD v13[4];
  id v14;
  uint64_t v15;
  _QWORD v16[2];

  v16[1] = *MEMORY[0x24BDAC8D0];
  v6 = a4;
  v15 = *MEMORY[0x24BDFFEE8];
  v16[0] = a3;
  v7 = (void *)MEMORY[0x24BDBCE70];
  v8 = a3;
  objc_msgSend(v7, "dictionaryWithObjects:forKeys:count:", v16, &v15, 1);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[AXContainerManager containerServerClient](self, "containerServerClient");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BE00580], "mainAccessQueue");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v13[0] = MEMORY[0x24BDAC760];
  v13[1] = 3221225472;
  v13[2] = __72__AXContainerManager_deleteFileAtAccessibilityContainerPath_completion___block_invoke;
  v13[3] = &unk_24D1A8E10;
  v14 = v6;
  v12 = v6;
  objc_msgSend(v10, "sendAsynchronousMessage:withIdentifier:targetAccessQueue:completion:", v9, 3, v11, v13);

}

void __72__AXContainerManager_deleteFileAtAccessibilityContainerPath_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4;

  getErrorCascading(a3, a2);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

}

- (void)setContainerServerClient:(id)a3
{
  objc_storeStrong((id *)&self->_containerServerClient, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_containerServerClient, 0);
}

@end
