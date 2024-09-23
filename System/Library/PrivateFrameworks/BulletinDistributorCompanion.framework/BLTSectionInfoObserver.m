@implementation BLTSectionInfoObserver

- (BLTSectionInfoObserver)init
{
  return -[BLTSectionInfoObserver initWithSettingsGateway:](self, "initWithSettingsGateway:", 0);
}

- (BLTSectionInfoObserver)initWithSettingsGateway:(id)a3
{
  id v5;
  BLTSectionInfoObserver *v6;
  BLTSectionInfoObserver *v7;
  void *v8;
  NSObject *v9;
  dispatch_queue_t v10;
  OS_dispatch_queue *queue;
  uint64_t v12;
  BBObserver *observer;
  objc_super v15;

  v5 = a3;
  v15.receiver = self;
  v15.super_class = (Class)BLTSectionInfoObserver;
  v6 = -[BLTSectionInfoObserver init](&v15, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_settingsGateway, a3);
    if (v7->_settingsGateway)
    {
      objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "addObserver:selector:name:object:", v7, sel__settingsGatewayReconnected_, CFSTR("BLTSettingsGatewayReconnected"), v7->_settingsGateway);

    }
    dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v9 = objc_claimAutoreleasedReturnValue();
    v10 = dispatch_queue_create("com.apple.bulletindistributor.sectioninfoobserver", v9);
    queue = v7->_queue;
    v7->_queue = (OS_dispatch_queue *)v10;

    +[BLTBBObserver surrogateWithQueue:calloutQueue:](BLTBBObserver, "surrogateWithQueue:calloutQueue:", v7->_queue, v7->_queue);
    v12 = objc_claimAutoreleasedReturnValue();
    observer = v7->_observer;
    v7->_observer = (BBObserver *)v12;

    -[BBObserver setObserverFeed:](v7->_observer, "setObserverFeed:", 513);
    -[BBObserver setDelegate:](v7->_observer, "setDelegate:", v7);
  }

  return v7;
}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  -[BBObserver invalidate](self->_observer, "invalidate");
  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:", self);

  v4.receiver = self;
  v4.super_class = (Class)BLTSectionInfoObserver;
  -[BLTSectionInfoObserver dealloc](&v4, sel_dealloc);
}

- (void)_settingsGatewayReconnected:(id)a3
{
  NSObject *queue;
  _QWORD block[5];

  queue = self->_queue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __54__BLTSectionInfoObserver__settingsGatewayReconnected___block_invoke;
  block[3] = &unk_24D761AD0;
  block[4] = self;
  dispatch_async(queue, block);
}

void __54__BLTSectionInfoObserver__settingsGatewayReconnected___block_invoke(uint64_t a1)
{
  uint64_t v1;
  id v2;

  v1 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 24);
  if (v1)
  {
    objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", CFSTR("com.apple.bulletindistributor.bbobserver"), 1, 0);
    v2 = (id)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, _QWORD, id))(v1 + 16))(v1, 0, v2);

  }
}

- (void)observer:(id)a3 noteServerConnectionStateChanged:(BOOL)a4
{
  NSObject *queue;
  _QWORD block[5];

  if (!a4)
  {
    queue = self->_queue;
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __68__BLTSectionInfoObserver_observer_noteServerConnectionStateChanged___block_invoke;
    block[3] = &unk_24D761AD0;
    block[4] = self;
    dispatch_async(queue, block);
  }
}

void __68__BLTSectionInfoObserver_observer_noteServerConnectionStateChanged___block_invoke(uint64_t a1)
{
  uint64_t v1;
  id v2;

  v1 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 24);
  if (v1)
  {
    objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", CFSTR("com.apple.bulletindistributor.bbobserver"), 1, 0);
    v2 = (id)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, _QWORD, id))(v1 + 16))(v1, 0, v2);

  }
}

- (id)sectionInfoForSectionID:(id)a3
{
  void *v3;
  BLTSectionInfoItem *v4;

  -[BBSettingsGateway sectionInfoForSectionID:](self->_settingsGateway, "sectionInfoForSectionID:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    v4 = objc_alloc_init(BLTSectionInfoItem);
    -[BLTSectionInfoItem setSectionInfo:](v4, "setSectionInfo:", v3);
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (void)reloadWithCompletion:(id)a3
{
  id v4;
  id v5;
  _QWORD v6[5];
  id v7;

  v4 = a3;
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __47__BLTSectionInfoObserver_reloadWithCompletion___block_invoke;
  v6[3] = &unk_24D7629C0;
  v6[4] = self;
  v7 = v4;
  v5 = v4;
  -[BLTSectionInfoObserver _reloadSectionInfosWithCompletion:](self, "_reloadSectionInfosWithCompletion:", v6);

}

void __47__BLTSectionInfoObserver_reloadWithCompletion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  uint64_t v6;
  id v7;

  v7 = a2;
  v5 = a3;
  dispatch_assert_queue_V2(*(dispatch_queue_t *)(*(_QWORD *)(a1 + 32) + 16));
  if (v5 && objc_msgSend(v5, "code") == 1)
  {
    objc_msgSend(*(id *)(a1 + 32), "reloadWithCompletion:", *(_QWORD *)(a1 + 40));
  }
  else
  {
    v6 = *(_QWORD *)(a1 + 40);
    if (v6)
      (*(void (**)(uint64_t, id))(v6 + 16))(v6, v7);
  }

}

- (void)_getUniversalSectionIDs:(id)a3 sectionIDEnumerator:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  void (**v10)(_QWORD);
  void *v11;
  void *v12;
  BBObserver *observer;
  _QWORD v14[4];
  id v15;
  id v16;
  BLTSectionInfoObserver *v17;
  id v18;
  void (**v19)(_QWORD);

  v8 = a3;
  v9 = a4;
  v10 = (void (**)(_QWORD))a5;
  objc_msgSend(v9, "nextObject");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = v11;
  if (v11)
  {
    observer = self->_observer;
    v14[0] = MEMORY[0x24BDAC760];
    v14[1] = 3221225472;
    v14[2] = __81__BLTSectionInfoObserver__getUniversalSectionIDs_sectionIDEnumerator_completion___block_invoke;
    v14[3] = &unk_24D7629E8;
    v15 = v11;
    v16 = v8;
    v17 = self;
    v18 = v9;
    v19 = v10;
    -[BBObserver getUniversalSectionIDForSectionID:withCompletion:](observer, "getUniversalSectionIDForSectionID:withCompletion:", v15, v14);

  }
  else if (v10)
  {
    v10[2](v10);
  }

}

void __81__BLTSectionInfoObserver__getUniversalSectionIDs_sectionIDEnumerator_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  BLTSectionInfoSectionIDs *v4;

  v3 = a2;
  v4 = objc_alloc_init(BLTSectionInfoSectionIDs);
  -[BLTSectionInfoSectionIDs setSectionID:](v4, "setSectionID:", *(_QWORD *)(a1 + 32));
  -[BLTSectionInfoSectionIDs setUniversalSectionID:](v4, "setUniversalSectionID:", v3);

  objc_msgSend(*(id *)(a1 + 40), "addObject:", v4);
  objc_msgSend(*(id *)(a1 + 48), "_getUniversalSectionIDs:sectionIDEnumerator:completion:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 64));

}

- (void)updateSectionInfoBySectionIDs:(id)a3 completion:(id)a4
{
  id v6;
  void (**v7)(id, _QWORD);
  void *v8;
  BBSettingsGateway *settingsGateway;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  int v14;
  void *v15;
  NSObject *v16;
  void *v17;
  void *v18;
  id v19;
  _QWORD v20[5];
  id v21;
  id v22;

  v6 = a3;
  v7 = (void (**)(id, _QWORD))a4;
  +[BLTTransaction transactionWithDescription:](BLTTransaction, "transactionWithDescription:", CFSTR("BLTSectionInfoObserver updateSectionInfoBySectionIDs:completion:"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  settingsGateway = self->_settingsGateway;
  if (!settingsGateway)
    -[BLTSectionInfoObserver updateSectionInfoBySectionIDs:completion:].cold.1();
  v10 = (void *)MEMORY[0x24BDBCF20];
  -[BBSettingsGateway allSectionIDs](settingsGateway, "allSectionIDs");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setWithArray:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  v13 = (void *)objc_msgSend(v6, "mutableCopy");
  v14 = objc_msgSend(v6, "isSubsetOfSet:", v12);
  if ((v14 & 1) == 0)
  {
    v15 = (void *)objc_msgSend(v6, "mutableCopy");
    objc_msgSend(v15, "minusSet:", v12);
    objc_msgSend(v13, "minusSet:", v15);
    blt_settings_log();
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, (os_log_type_t)0x90u))
      -[BLTSectionInfoObserver updateSectionInfoBySectionIDs:completion:].cold.2((uint64_t)v15, v16);

  }
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "objectEnumerator");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v20[0] = MEMORY[0x24BDAC760];
  v20[1] = 3221225472;
  v20[2] = __67__BLTSectionInfoObserver_updateSectionInfoBySectionIDs_completion___block_invoke;
  v20[3] = &unk_24D761D70;
  v20[4] = self;
  v21 = v17;
  v22 = v8;
  v19 = v17;
  -[BLTSectionInfoObserver _getUniversalSectionIDs:sectionIDEnumerator:completion:](self, "_getUniversalSectionIDs:sectionIDEnumerator:completion:", v19, v18, v20);

  if (v7)
    v7[2](v7, v14 ^ 1u);

}

void __67__BLTSectionInfoObserver_updateSectionInfoBySectionIDs_completion___block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "sectionInfoObserver:updatedSectionInfoForSectionIDs:transaction:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));

}

- (void)_reloadSectionInfosWithCompletion:(id)a3
{
  id v4;
  NSObject *queue;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  queue = self->_queue;
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __60__BLTSectionInfoObserver__reloadSectionInfosWithCompletion___block_invoke;
  v7[3] = &unk_24D762270;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(queue, v7);

}

void __60__BLTSectionInfoObserver__reloadSectionInfosWithCompletion___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  NSObject *v7;
  NSObject *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  _QWORD v13[5];
  id v14;
  uint8_t buf[4];
  void *v16;
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  v2 = objc_msgSend(*(id *)(a1 + 40), "copy");
  v3 = *(_QWORD *)(a1 + 32);
  v4 = *(void **)(v3 + 24);
  *(_QWORD *)(v3 + 24) = v2;

  v5 = *(void **)(*(_QWORD *)(a1 + 32) + 32);
  if (!v5)
    __60__BLTSectionInfoObserver__reloadSectionInfosWithCompletion___block_invoke_cold_1();
  objc_msgSend(v5, "allSectionIDs");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  blt_settings_log();
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (v6)
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", objc_msgSend(v6, "count"));
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      v16 = v9;
      _os_log_impl(&dword_2173D9000, v8, OS_LOG_TYPE_DEFAULT, "Reloaded %@ section IDs", buf, 0xCu);

    }
    objc_msgSend(MEMORY[0x24BDBCEB8], "array");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = *(void **)(a1 + 32);
    objc_msgSend(v6, "objectEnumerator");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13[0] = MEMORY[0x24BDAC760];
    v13[1] = 3221225472;
    v13[2] = __60__BLTSectionInfoObserver__reloadSectionInfosWithCompletion___block_invoke_21;
    v13[3] = &unk_24D761AA8;
    v13[4] = *(_QWORD *)(a1 + 32);
    v14 = v10;
    v8 = v10;
    objc_msgSend(v11, "_getUniversalSectionIDs:sectionIDEnumerator:completion:", v8, v12, v13);

  }
  else if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
  {
    __60__BLTSectionInfoObserver__reloadSectionInfosWithCompletion___block_invoke_cold_2(v8);
  }

}

void __60__BLTSectionInfoObserver__reloadSectionInfosWithCompletion___block_invoke_21(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  v2 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 24);
  if (v2)
  {
    (*(void (**)(uint64_t, _QWORD, _QWORD))(v2 + 16))(v2, *(_QWORD *)(a1 + 40), 0);
    v3 = *(_QWORD *)(a1 + 32);
    v4 = *(void **)(v3 + 24);
    *(_QWORD *)(v3 + 24) = 0;

  }
}

- (void)observer:(id)a3 updateSectionInfo:(id)a4
{
  id v6;
  id v7;
  uint64_t v8;
  void *v9;
  void *v10;
  NSObject *v11;
  void *v12;
  void *v13;
  BBObserver *observer;
  NSObject *v15;
  _QWORD v16[4];
  id v17;
  BLTSectionInfoObserver *v18;
  id v19;
  uint8_t buf[4];
  void *v21;
  uint64_t v22;

  v22 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  +[BLTTransaction transactionWithDescription:](BLTTransaction, "transactionWithDescription:", CFSTR("BLTSectionInfoObserver observer:updateSectionInfo:"));
  v8 = objc_claimAutoreleasedReturnValue();
  if (!self->_settingsGateway)
    -[BLTSectionInfoObserver observer:updateSectionInfo:].cold.1();
  v9 = (void *)v8;
  objc_msgSend(v7, "sectionID");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  blt_settings_log();
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v21 = v10;
    _os_log_impl(&dword_2173D9000, v11, OS_LOG_TYPE_DEFAULT, "Received updated section info for %@", buf, 0xCu);
  }

  -[BBSettingsGateway sectionInfoForSectionID:](self->_settingsGateway, "sectionInfoForSectionID:", v10);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (v12)
  {
    objc_msgSend(v12, "sectionID");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    observer = self->_observer;
    v16[0] = MEMORY[0x24BDAC760];
    v16[1] = 3221225472;
    v16[2] = __53__BLTSectionInfoObserver_observer_updateSectionInfo___block_invoke;
    v16[3] = &unk_24D762A10;
    v17 = v13;
    v18 = self;
    v19 = v9;
    v15 = v13;
    -[BBObserver getUniversalSectionIDForSectionID:withCompletion:](observer, "getUniversalSectionIDForSectionID:withCompletion:", v15, v16);

  }
  else
  {
    blt_settings_log();
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
      -[BLTSectionInfoObserver observer:updateSectionInfo:].cold.2((uint64_t)v10, v15);
  }

}

void __53__BLTSectionInfoObserver_observer_updateSectionInfo___block_invoke(_QWORD *a1, void *a2)
{
  id v3;
  BLTSectionInfoSectionIDs *v4;
  NSObject *v5;
  uint64_t v6;
  id WeakRetained;
  uint64_t v8;
  void *v9;
  BLTSectionInfoSectionIDs *v10;
  uint8_t buf[4];
  uint64_t v12;
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  v4 = objc_alloc_init(BLTSectionInfoSectionIDs);
  -[BLTSectionInfoSectionIDs setSectionID:](v4, "setSectionID:", a1[4]);
  -[BLTSectionInfoSectionIDs setUniversalSectionID:](v4, "setUniversalSectionID:", v3);

  blt_settings_log();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v6 = a1[4];
    *(_DWORD *)buf = 138412290;
    v12 = v6;
    _os_log_impl(&dword_2173D9000, v5, OS_LOG_TYPE_DEFAULT, "Loaded actual section info for %@", buf, 0xCu);
  }

  WeakRetained = objc_loadWeakRetained((id *)(a1[5] + 40));
  v8 = a1[5];
  v10 = v4;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v10, 1);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(WeakRetained, "sectionInfoObserver:updatedSectionInfoForSectionIDs:transaction:", v8, v9, a1[6]);

}

- (void)observer:(id)a3 removeSection:(id)a4
{
  id v5;
  void *v6;
  NSObject *v7;
  id WeakRetained;
  char v9;
  BBObserver *observer;
  _QWORD v11[5];
  id v12;
  id v13;
  uint8_t buf[4];
  id v15;
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  v5 = a4;
  +[BLTTransaction transactionWithDescription:](BLTTransaction, "transactionWithDescription:", CFSTR("BLTSectionInfoObserver observer:updateSectionInfo:"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  blt_settings_log();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v15 = v5;
    _os_log_impl(&dword_2173D9000, v7, OS_LOG_TYPE_DEFAULT, "Received removeSection from BB for %@", buf, 0xCu);
  }

  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  v9 = objc_opt_respondsToSelector();

  if ((v9 & 1) != 0)
  {
    observer = self->_observer;
    v11[0] = MEMORY[0x24BDAC760];
    v11[1] = 3221225472;
    v11[2] = __49__BLTSectionInfoObserver_observer_removeSection___block_invoke;
    v11[3] = &unk_24D762A10;
    v11[4] = self;
    v12 = v5;
    v13 = v6;
    -[BBObserver getUniversalSectionIDForSectionID:withCompletion:](observer, "getUniversalSectionIDForSectionID:withCompletion:", v12, v11);

  }
}

void __49__BLTSectionInfoObserver_observer_removeSection___block_invoke(_QWORD *a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1[4] + 40));
  objc_msgSend(WeakRetained, "sectionInfoObserver:removedSectionWithSectionID:transaction:", a1[4], a1[5], a1[6]);

}

- (BLTSectionInfoObserverDelegate)delegate
{
  return (BLTSectionInfoObserverDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_settingsGateway, 0);
  objc_storeStrong(&self->_reloadSectionInfoCompletion, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_observer, 0);
}

- (void)updateSectionInfoBySectionIDs:completion:.cold.1()
{
  __assert_rtn("-[BLTSectionInfoObserver updateSectionInfoBySectionIDs:completion:]", "BLTSectionInfoObserver.m", 124, "_settingsGateway != nil");
}

- (void)updateSectionInfoBySectionIDs:(uint64_t)a1 completion:(NSObject *)a2 .cold.2(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x24BDAC8D0];
  v2 = 138412290;
  v3 = a1;
  _os_log_error_impl(&dword_2173D9000, a2, (os_log_type_t)0x90u, "Asked to update section IDs that BulletinBoard does not know: %@", (uint8_t *)&v2, 0xCu);
}

void __60__BLTSectionInfoObserver__reloadSectionInfosWithCompletion___block_invoke_cold_1()
{
  __assert_rtn("-[BLTSectionInfoObserver _reloadSectionInfosWithCompletion:]_block_invoke", "BLTSectionInfoObserver.m", 147, "_settingsGateway != nil");
}

void __60__BLTSectionInfoObserver__reloadSectionInfosWithCompletion___block_invoke_cold_2(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_2173D9000, log, OS_LOG_TYPE_ERROR, "Settings gateway failed to get section IDs!", v1, 2u);
}

- (void)observer:updateSectionInfo:.cold.1()
{
  __assert_rtn("-[BLTSectionInfoObserver observer:updateSectionInfo:]", "BLTSectionInfoObserver.m", 172, "_settingsGateway != nil");
}

- (void)observer:(uint64_t)a1 updateSectionInfo:(NSObject *)a2 .cold.2(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x24BDAC8D0];
  v2 = 138412290;
  v3 = a1;
  _os_log_error_impl(&dword_2173D9000, a2, OS_LOG_TYPE_ERROR, "Retrieved nil sectionInfo from BB updated section info: %@", (uint8_t *)&v2, 0xCu);
}

@end
