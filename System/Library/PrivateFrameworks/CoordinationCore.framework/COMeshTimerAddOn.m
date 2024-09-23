@implementation COMeshTimerAddOn

- (COMeshTimerAddOn)initWithTimerManager:(id)a3 homekitAdapter:(id)a4 hubAdapter:(id)a5
{
  id v9;
  id v10;
  id v11;
  COMeshTimerAddOn *v12;
  COMeshTimerAddOn *v13;
  MTTimerManager *v14;
  MTTimerManager *observedTimerManager;
  NSArray *v16;
  NSArray *deletes;
  NSArray *v18;
  NSArray *mergingNodes;
  NSDictionary *v20;
  NSDictionary *mergeResponses;
  NSArray *v22;
  NSArray *queuedCommands;
  id recorder;
  NSSet *v25;
  NSSet *members;
  NSDictionary *v27;
  NSDictionary *interests;
  NSDictionary *v29;
  NSDictionary *ourInterests;
  NSObject *v31;
  objc_super v33;
  uint8_t buf[4];
  COMeshTimerAddOn *v35;
  uint64_t v36;

  v36 = *MEMORY[0x24BDAC8D0];
  v9 = a3;
  v10 = a4;
  v11 = a5;
  v33.receiver = self;
  v33.super_class = (Class)COMeshTimerAddOn;
  v12 = -[COMeshAddOn init](&v33, sel_init);
  v13 = v12;
  if (v12)
  {
    v12->_lock._os_unfair_lock_opaque = 0;
    v14 = (MTTimerManager *)objc_alloc_init(MEMORY[0x24BE67870]);
    observedTimerManager = v13->_observedTimerManager;
    v13->_observedTimerManager = v14;

    -[MTTimerManager checkIn](v13->_observedTimerManager, "checkIn");
    objc_storeStrong((id *)&v13->_homekit, a4);
    objc_storeStrong((id *)&v13->_homehub, a5);
    v16 = (NSArray *)objc_alloc_init(MEMORY[0x24BDBCE30]);
    deletes = v13->_deletes;
    v13->_deletes = v16;

    v18 = (NSArray *)objc_alloc_init(MEMORY[0x24BDBCE30]);
    mergingNodes = v13->_mergingNodes;
    v13->_mergingNodes = v18;

    v20 = (NSDictionary *)objc_alloc_init(MEMORY[0x24BDBCE70]);
    mergeResponses = v13->_mergeResponses;
    v13->_mergeResponses = v20;

    v22 = (NSArray *)objc_alloc_init(MEMORY[0x24BDBCE30]);
    queuedCommands = v13->_queuedCommands;
    v13->_queuedCommands = v22;

    objc_storeStrong((id *)&v13->_timerManager, a3);
    recorder = v13->_recorder;
    v13->_recorder = &__block_literal_global_3;

    v25 = (NSSet *)objc_alloc_init(MEMORY[0x24BDBCF20]);
    members = v13->_members;
    v13->_members = v25;

    v27 = (NSDictionary *)objc_alloc_init(MEMORY[0x24BDBCE70]);
    interests = v13->_interests;
    v13->_interests = v27;

    v29 = (NSDictionary *)objc_alloc_init(MEMORY[0x24BDBCE70]);
    ourInterests = v13->_ourInterests;
    v13->_ourInterests = v29;

    COCoreLogForCategory(3);
    v31 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134217984;
      v35 = v13;
      _os_log_impl(&dword_215E92000, v31, OS_LOG_TYPE_DEFAULT, "%p mesh add-on created", buf, 0xCu);
    }

  }
  return v13;
}

uint64_t __67__COMeshTimerAddOn_initWithTimerManager_homekitAdapter_hubAdapter___block_invoke()
{
  return AnalyticsSendEventLazy();
}

- (COMeshTimerAddOn)initWithTimerManager:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  COMeshTimerAddOn *v7;

  v4 = a3;
  +[COHomeKitAdapter sharedInstance](COHomeKitAdapter, "sharedInstance");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  +[COHomeHubAdapter sharedInstance](COHomeHubAdapter, "sharedInstance");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = -[COMeshTimerAddOn initWithTimerManager:homekitAdapter:hubAdapter:](self, "initWithTimerManager:homekitAdapter:hubAdapter:", v4, v5, v6);

  return v7;
}

- (COMeshTimerAddOn)init
{
  id v3;
  COMeshTimerAddOn *v4;

  v3 = objc_alloc_init(MEMORY[0x24BE67870]);
  v4 = -[COMeshTimerAddOn initWithTimerManager:](self, "initWithTimerManager:", v3);

  return v4;
}

- (void)didAddToMeshController:(id)a3
{
  id v4;
  uint64_t v5;
  void (**v6)(_QWORD, _QWORD);
  void (**v7)(_QWORD, _QWORD);
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
  uint64_t v18;
  void *v19;
  void *v20;
  _QWORD v21[4];
  id v22;
  _QWORD v23[4];
  id v24;
  _QWORD v25[4];
  id v26;
  _QWORD v27[4];
  id v28;
  _QWORD v29[4];
  id v30;
  _QWORD v31[4];
  id v32;
  _QWORD v33[4];
  id v34;
  _QWORD v35[4];
  id v36;
  _QWORD v37[4];
  id v38;
  _QWORD v39[4];
  id v40;
  _QWORD v41[4];
  id v42;
  _QWORD v43[4];
  id v44;
  _QWORD v45[4];
  id v46;
  _QWORD v47[4];
  id v48;
  id location;
  objc_super v50;

  v4 = a3;
  v50.receiver = self;
  v50.super_class = (Class)COMeshTimerAddOn;
  -[COMeshAddOn didAddToMeshController:](&v50, sel_didAddToMeshController_, v4);
  objc_initWeak(&location, self);
  v5 = MEMORY[0x24BDAC760];
  v47[0] = MEMORY[0x24BDAC760];
  v47[1] = 3221225472;
  v47[2] = __43__COMeshTimerAddOn_didAddToMeshController___block_invoke;
  v47[3] = &unk_24D4B1D90;
  objc_copyWeak(&v48, &location);
  v6 = (void (**)(_QWORD, _QWORD))MEMORY[0x2199F3D40](v47);
  v45[0] = v5;
  v45[1] = 3221225472;
  v45[2] = __43__COMeshTimerAddOn_didAddToMeshController___block_invoke_4;
  v45[3] = &unk_24D4B1DE0;
  objc_copyWeak(&v46, &location);
  v7 = (void (**)(_QWORD, _QWORD))MEMORY[0x2199F3D40](v45);
  v43[0] = v5;
  v43[1] = 3221225472;
  v43[2] = __43__COMeshTimerAddOn_didAddToMeshController___block_invoke_7;
  v43[3] = &unk_24D4B1170;
  objc_copyWeak(&v44, &location);
  ((void (**)(_QWORD, _QWORD *))v6)[2](v6, v43);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "registerHandler:forRequestClass:", v8, objc_opt_class());

  v41[0] = v5;
  v41[1] = 3221225472;
  v41[2] = __43__COMeshTimerAddOn_didAddToMeshController___block_invoke_8;
  v41[3] = &unk_24D4B1170;
  objc_copyWeak(&v42, &location);
  ((void (**)(_QWORD, _QWORD *))v6)[2](v6, v41);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "registerHandler:forRequestClass:", v9, objc_opt_class());

  v39[0] = v5;
  v39[1] = 3221225472;
  v39[2] = __43__COMeshTimerAddOn_didAddToMeshController___block_invoke_9;
  v39[3] = &unk_24D4B1170;
  objc_copyWeak(&v40, &location);
  ((void (**)(_QWORD, _QWORD *))v6)[2](v6, v39);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "registerHandler:forRequestClass:", v10, objc_opt_class());

  v37[0] = v5;
  v37[1] = 3221225472;
  v37[2] = __43__COMeshTimerAddOn_didAddToMeshController___block_invoke_10;
  v37[3] = &unk_24D4B1170;
  objc_copyWeak(&v38, &location);
  ((void (**)(_QWORD, _QWORD *))v6)[2](v6, v37);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "registerHandler:forRequestClass:", v11, objc_opt_class());

  v35[0] = v5;
  v35[1] = 3221225472;
  v35[2] = __43__COMeshTimerAddOn_didAddToMeshController___block_invoke_11;
  v35[3] = &unk_24D4B1170;
  objc_copyWeak(&v36, &location);
  ((void (**)(_QWORD, _QWORD *))v6)[2](v6, v35);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "registerHandler:forRequestClass:", v12, objc_opt_class());

  v33[0] = v5;
  v33[1] = 3221225472;
  v33[2] = __43__COMeshTimerAddOn_didAddToMeshController___block_invoke_12;
  v33[3] = &unk_24D4B11C0;
  objc_copyWeak(&v34, &location);
  ((void (**)(_QWORD, _QWORD *))v7)[2](v7, v33);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "registerHandler:forNotificationClass:", v13, objc_opt_class());

  v31[0] = v5;
  v31[1] = 3221225472;
  v31[2] = __43__COMeshTimerAddOn_didAddToMeshController___block_invoke_13;
  v31[3] = &unk_24D4B11C0;
  objc_copyWeak(&v32, &location);
  ((void (**)(_QWORD, _QWORD *))v7)[2](v7, v31);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "registerHandler:forNotificationClass:", v14, objc_opt_class());

  v29[0] = v5;
  v29[1] = 3221225472;
  v29[2] = __43__COMeshTimerAddOn_didAddToMeshController___block_invoke_14;
  v29[3] = &unk_24D4B11C0;
  objc_copyWeak(&v30, &location);
  ((void (**)(_QWORD, _QWORD *))v7)[2](v7, v29);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "registerHandler:forNotificationClass:", v15, objc_opt_class());

  v27[0] = v5;
  v27[1] = 3221225472;
  v27[2] = __43__COMeshTimerAddOn_didAddToMeshController___block_invoke_15;
  v27[3] = &unk_24D4B11C0;
  objc_copyWeak(&v28, &location);
  ((void (**)(_QWORD, _QWORD *))v7)[2](v7, v27);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "registerHandler:forNotificationClass:", v16, objc_opt_class());

  v25[0] = v5;
  v25[1] = 3221225472;
  v25[2] = __43__COMeshTimerAddOn_didAddToMeshController___block_invoke_16;
  v25[3] = &unk_24D4B11C0;
  objc_copyWeak(&v26, &location);
  ((void (**)(_QWORD, _QWORD *))v7)[2](v7, v25);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "registerHandler:forNotificationClass:", v17, objc_opt_class());

  v18 = v5;
  v23[0] = v5;
  v23[1] = 3221225472;
  v23[2] = __43__COMeshTimerAddOn_didAddToMeshController___block_invoke_17;
  v23[3] = &unk_24D4B11C0;
  objc_copyWeak(&v24, &location);
  ((void (**)(_QWORD, _QWORD *))v7)[2](v7, v23);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "registerHandler:forNotificationClass:", v19, objc_opt_class());

  v21[0] = v18;
  v21[1] = 3221225472;
  v21[2] = __43__COMeshTimerAddOn_didAddToMeshController___block_invoke_18;
  v21[3] = &unk_24D4B11C0;
  objc_copyWeak(&v22, &location);
  ((void (**)(_QWORD, _QWORD *))v7)[2](v7, v21);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "registerHandler:forNotificationClass:", v20, objc_opt_class());

  objc_destroyWeak(&v22);
  objc_destroyWeak(&v24);
  objc_destroyWeak(&v26);
  objc_destroyWeak(&v28);
  objc_destroyWeak(&v30);
  objc_destroyWeak(&v32);
  objc_destroyWeak(&v34);
  objc_destroyWeak(&v36);
  objc_destroyWeak(&v38);
  objc_destroyWeak(&v40);
  objc_destroyWeak(&v42);
  objc_destroyWeak(&v44);

  objc_destroyWeak(&v46);
  objc_destroyWeak(&v48);
  objc_destroyWeak(&location);

}

id __43__COMeshTimerAddOn_didAddToMeshController___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  _QWORD v11[4];
  id v12;
  id v13;

  v3 = a2;
  v11[0] = MEMORY[0x24BDAC760];
  v11[1] = 3221225472;
  v11[2] = __43__COMeshTimerAddOn_didAddToMeshController___block_invoke_2;
  v11[3] = &unk_24D4B1D68;
  objc_copyWeak(&v13, (id *)(a1 + 32));
  v12 = v3;
  v4 = v3;
  v5 = (void *)MEMORY[0x2199F3D40](v11);
  v9 = (void *)MEMORY[0x2199F3D40](v5, v6, v7, v8);

  objc_destroyWeak(&v13);
  return v9;
}

void __43__COMeshTimerAddOn_didAddToMeshController___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id WeakRetained;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  _QWORD v13[4];
  id v14;
  id v15;
  id v16;

  v5 = a2;
  v6 = a3;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v8 = WeakRetained;
  if (WeakRetained)
  {
    objc_msgSend(WeakRetained, "mergeRequest");
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    if (v9)
    {
      objc_msgSend(v8, "queuedCommands");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v13[0] = MEMORY[0x24BDAC760];
      v13[1] = 3221225472;
      v13[2] = __43__COMeshTimerAddOn_didAddToMeshController___block_invoke_3;
      v13[3] = &unk_24D4B1D40;
      v15 = *(id *)(a1 + 32);
      v14 = v5;
      v16 = v6;
      v11 = (void *)MEMORY[0x2199F3D40](v13);
      objc_msgSend(v10, "arrayByAddingObject:", v11);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "setQueuedCommands:", v12);

    }
    else
    {
      (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
    }
  }

}

uint64_t __43__COMeshTimerAddOn_didAddToMeshController___block_invoke_3(_QWORD *a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(a1[5] + 16))(a1[5], a1[4], a1[6]);
}

id __43__COMeshTimerAddOn_didAddToMeshController___block_invoke_4(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  _QWORD v11[4];
  id v12;
  id v13;

  v3 = a2;
  v11[0] = MEMORY[0x24BDAC760];
  v11[1] = 3221225472;
  v11[2] = __43__COMeshTimerAddOn_didAddToMeshController___block_invoke_5;
  v11[3] = &unk_24D4B1DB8;
  objc_copyWeak(&v13, (id *)(a1 + 32));
  v12 = v3;
  v4 = v3;
  v5 = (void *)MEMORY[0x2199F3D40](v11);
  v9 = (void *)MEMORY[0x2199F3D40](v5, v6, v7, v8);

  objc_destroyWeak(&v13);
  return v9;
}

void __43__COMeshTimerAddOn_didAddToMeshController___block_invoke_5(uint64_t a1, void *a2)
{
  id v3;
  id WeakRetained;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t (*v12)(uint64_t);
  void *v13;
  id v14;
  id v15;

  v3 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v5 = WeakRetained;
  if (WeakRetained)
  {
    objc_msgSend(WeakRetained, "mergeRequest");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (v6)
    {
      objc_msgSend(v5, "queuedCommands");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = MEMORY[0x24BDAC760];
      v11 = 3221225472;
      v12 = __43__COMeshTimerAddOn_didAddToMeshController___block_invoke_6;
      v13 = &unk_24D4B0B68;
      v15 = *(id *)(a1 + 32);
      v14 = v3;
      v8 = (void *)MEMORY[0x2199F3D40](&v10);
      objc_msgSend(v7, "arrayByAddingObject:", v8, v10, v11, v12, v13);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "setQueuedCommands:", v9);

    }
    else
    {
      (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
    }
  }

}

uint64_t __43__COMeshTimerAddOn_didAddToMeshController___block_invoke_6(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));
}

void __43__COMeshTimerAddOn_didAddToMeshController___block_invoke_7(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id WeakRetained;
  void *v7;
  id v8;

  v8 = a2;
  v5 = a3;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v7 = WeakRetained;
  if (WeakRetained)
    objc_msgSend(WeakRetained, "handleTimerCreateRequest:callback:", v8, v5);

}

void __43__COMeshTimerAddOn_didAddToMeshController___block_invoke_8(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id WeakRetained;
  void *v7;
  id v8;

  v8 = a2;
  v5 = a3;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v7 = WeakRetained;
  if (WeakRetained)
    objc_msgSend(WeakRetained, "handleTimerReadRequest:callback:", v8, v5);

}

void __43__COMeshTimerAddOn_didAddToMeshController___block_invoke_9(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id WeakRetained;
  void *v7;
  id v8;

  v8 = a2;
  v5 = a3;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v7 = WeakRetained;
  if (WeakRetained)
    objc_msgSend(WeakRetained, "handleTimerUpdateRequest:callback:", v8, v5);

}

void __43__COMeshTimerAddOn_didAddToMeshController___block_invoke_10(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id WeakRetained;
  void *v7;
  id v8;

  v8 = a2;
  v5 = a3;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v7 = WeakRetained;
  if (WeakRetained)
    objc_msgSend(WeakRetained, "handleTimerDeleteRequest:callback:", v8, v5);

}

void __43__COMeshTimerAddOn_didAddToMeshController___block_invoke_11(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id WeakRetained;
  void *v7;
  id v8;

  v8 = a2;
  v5 = a3;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v7 = WeakRetained;
  if (WeakRetained)
    objc_msgSend(WeakRetained, "handleTimerDismissRequest:callback:", v8, v5);

}

void __43__COMeshTimerAddOn_didAddToMeshController___block_invoke_12(uint64_t a1, void *a2)
{
  id WeakRetained;
  void *v4;
  id v5;

  v5 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v4 = WeakRetained;
  if (WeakRetained)
    objc_msgSend(WeakRetained, "handleTimersAddedNotification:", v5);

}

void __43__COMeshTimerAddOn_didAddToMeshController___block_invoke_13(uint64_t a1, void *a2)
{
  id WeakRetained;
  void *v4;
  id v5;

  v5 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v4 = WeakRetained;
  if (WeakRetained)
    objc_msgSend(WeakRetained, "handleTimersRemovedNotification:", v5);

}

void __43__COMeshTimerAddOn_didAddToMeshController___block_invoke_14(uint64_t a1, void *a2)
{
  id WeakRetained;
  void *v4;
  id v5;

  v5 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v4 = WeakRetained;
  if (WeakRetained)
    objc_msgSend(WeakRetained, "handleTimerFiringTimerDismissedNotification:", v5);

}

void __43__COMeshTimerAddOn_didAddToMeshController___block_invoke_15(uint64_t a1, void *a2)
{
  id WeakRetained;
  void *v4;
  id v5;

  v5 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v4 = WeakRetained;
  if (WeakRetained)
    objc_msgSend(WeakRetained, "handleTimerFiredNotification:", v5);

}

void __43__COMeshTimerAddOn_didAddToMeshController___block_invoke_16(uint64_t a1, void *a2)
{
  id WeakRetained;
  void *v4;
  id v5;

  v5 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v4 = WeakRetained;
  if (WeakRetained)
    objc_msgSend(WeakRetained, "handleTimersChangedNotification:", v5);

}

void __43__COMeshTimerAddOn_didAddToMeshController___block_invoke_17(uint64_t a1, void *a2)
{
  id WeakRetained;
  void *v4;
  id v5;

  v5 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v4 = WeakRetained;
  if (WeakRetained)
    objc_msgSend(WeakRetained, "handleTimersUpdatedNotification:", v5);

}

void __43__COMeshTimerAddOn_didAddToMeshController___block_invoke_18(uint64_t a1, void *a2)
{
  id WeakRetained;
  void *v4;
  id v5;

  v5 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v4 = WeakRetained;
  if (WeakRetained)
    objc_msgSend(WeakRetained, "handleTimerManagerStateResetNotification:", v5);

}

- (void)willRemoveFromMeshController:(id)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  objc_super v8;
  _QWORD v9[5];
  _QWORD v10[5];
  _QWORD v11[8];

  v11[7] = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v11[0] = objc_opt_class();
  v11[1] = objc_opt_class();
  v11[2] = objc_opt_class();
  v11[3] = objc_opt_class();
  v11[4] = objc_opt_class();
  v11[5] = objc_opt_class();
  v5 = 0;
  v11[6] = objc_opt_class();
  do
    objc_msgSend(v4, "deregisterHandlerForNotificationClass:", v11[v5++]);
  while (v5 != 7);
  v10[0] = objc_opt_class();
  v10[1] = objc_opt_class();
  v10[2] = objc_opt_class();
  v10[3] = objc_opt_class();
  v6 = 0;
  v10[4] = objc_opt_class();
  do
    objc_msgSend(v4, "deregisterHandlerForRequestClass:", v10[v6++]);
  while (v6 != 5);
  -[COMeshTimerAddOn actionDirector](self, "actionDirector");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "removeHandler:", self);

  v9[0] = MEMORY[0x24BDAC760];
  v9[1] = 3221225472;
  v9[2] = __49__COMeshTimerAddOn_willRemoveFromMeshController___block_invoke;
  v9[3] = &unk_24D4B0C80;
  v9[4] = self;
  -[COMeshTimerAddOn _withLock:](self, "_withLock:", v9);
  v8.receiver = self;
  v8.super_class = (Class)COMeshTimerAddOn;
  -[COMeshAddOn willRemoveFromMeshController:](&v8, sel_willRemoveFromMeshController_, v4);

}

uint64_t __49__COMeshTimerAddOn_willRemoveFromMeshController___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setActionDirector:", 0);
}

- (void)willStartMeshController:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  objc_super v7;

  v4 = a3;
  -[COMeshTimerAddOn observedTimerManager](self, "observedTimerManager");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "addObserver:selector:name:object:", self, sel__timerManagerTimersAdded_, *MEMORY[0x24BE677F0], v5);
  objc_msgSend(v6, "addObserver:selector:name:object:", self, sel__timerManagerTimersRemoved_, *MEMORY[0x24BE67808], v5);
  objc_msgSend(v6, "addObserver:selector:name:object:", self, sel__timerManagerTimersUpdated_, *MEMORY[0x24BE67810], v5);
  objc_msgSend(v6, "addObserver:selector:name:object:", self, sel__timerManagerTimerFired_, *MEMORY[0x24BE677E8], v5);
  objc_msgSend(v6, "addObserver:selector:name:object:", self, sel__timerManagerStateReset_, *MEMORY[0x24BE677E0], v5);
  objc_msgSend(v6, "addObserver:selector:name:object:", self, sel__timerManagerTimersChanged_, *MEMORY[0x24BE677F8], v5);
  -[COMeshTimerAddOn _reloadIndexWithCompletion:](self, "_reloadIndexWithCompletion:", 0);
  v7.receiver = self;
  v7.super_class = (Class)COMeshTimerAddOn;
  -[COMeshAddOn willStartMeshController:](&v7, sel_willStartMeshController_, v4);

}

- (void)didStopMeshController:(id)a3
{
  void *v4;
  void *v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)COMeshTimerAddOn;
  -[COMeshAddOn didStopMeshController:](&v6, sel_didStopMeshController_, a3);
  -[COMeshTimerAddOn observedTimerManager](self, "observedTimerManager");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "removeObserver:name:object:", self, *MEMORY[0x24BE677F8], v4);
  objc_msgSend(v5, "removeObserver:name:object:", self, *MEMORY[0x24BE677E0], v4);
  objc_msgSend(v5, "removeObserver:name:object:", self, *MEMORY[0x24BE677E8], v4);
  objc_msgSend(v5, "removeObserver:name:object:", self, *MEMORY[0x24BE67810], v4);
  objc_msgSend(v5, "removeObserver:name:object:", self, *MEMORY[0x24BE67808], v4);
  objc_msgSend(v5, "removeObserver:name:object:", self, *MEMORY[0x24BE677F0], v4);

}

- (void)meshController:(id)a3 didTransitionToState:(unint64_t)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  char v13;
  _QWORD v14[4];
  id v15;
  objc_super v16;

  v6 = a3;
  -[COMeshTimerAddOn delegate](self, "delegate");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v7, "didChangeCompositionForTimerAddOn:", self);
  v16.receiver = self;
  v16.super_class = (Class)COMeshTimerAddOn;
  -[COMeshAddOn meshController:didTransitionToState:](&v16, sel_meshController_didTransitionToState_, v6, a4);
  objc_msgSend(v6, "nodes");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (a4 == 2)
  {
    -[COMeshTimerAddOn _abandonMerge](self, "_abandonMerge");
  }
  else if (a4 == 3)
  {
    -[COMeshTimerAddOn ourInterests](self, "ourInterests");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v14[0] = MEMORY[0x24BDAC760];
    v14[1] = 3221225472;
    v14[2] = __56__COMeshTimerAddOn_meshController_didTransitionToState___block_invoke;
    v14[3] = &unk_24D4B1E08;
    v15 = v8;
    objc_msgSend(v9, "enumerateKeysAndObjectsUsingBlock:", v14);

    objc_msgSend(v6, "me");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "leader");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v10, "isEqual:", v11) & 1) != 0)
    {
      -[COMeshTimerAddOn homekit](self, "homekit");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      if ((objc_msgSend(v12, "hasOptedToHH2") & 1) != 0)
      {
        v13 = objc_msgSend(MEMORY[0x24BE19E30], "isDistributedTimersEnabled");

        if ((v13 & 1) != 0)
          goto LABEL_13;
      }
      else
      {

      }
      -[COMeshTimerAddOn _startMerge](self, "_startMerge");
    }
    else
    {

    }
  }
LABEL_13:

}

void __56__COMeshTimerAddOn_meshController_didTransitionToState___block_invoke(uint64_t a1, void *a2, void *a3)
{
  void *v4;
  id v5;
  id v6;

  v4 = *(void **)(a1 + 32);
  v5 = a3;
  COMeshNodeForIDSIdentifier(v4, a2);
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setPrimaryAvailable:", v6 != 0);

}

- (void)didChangeNodesForMeshController:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  BOOL v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  NSObject *v18;
  void *v19;
  uint64_t v20;
  uint64_t v21;
  void (*v22)(uint64_t, void *, void *);
  void *v23;
  id v24;
  BOOL v25;
  objc_super v26;

  v4 = a3;
  -[COMeshTimerAddOn delegate](self, "delegate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v5, "didChangeCompositionForTimerAddOn:", self);
  v26.receiver = self;
  v26.super_class = (Class)COMeshTimerAddOn;
  -[COMeshAddOn didChangeNodesForMeshController:](&v26, sel_didChangeNodesForMeshController_, v4);
  objc_msgSend(v4, "nodes");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[COMeshAddOn meshController](self, "meshController");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "state") == 3;

  -[COMeshTimerAddOn ourInterests](self, "ourInterests");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = MEMORY[0x24BDAC760];
  v21 = 3221225472;
  v22 = __52__COMeshTimerAddOn_didChangeNodesForMeshController___block_invoke;
  v23 = &unk_24D4B1E30;
  v10 = v6;
  v24 = v10;
  v25 = v8;
  objc_msgSend(v9, "enumerateKeysAndObjectsUsingBlock:", &v20);

  -[COMeshTimerAddOn mergingNodes](self, "mergingNodes", v20, v21, v22, v23);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBCEF0], "setWithArray:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = (void *)MEMORY[0x24BDBCF20];
  objc_msgSend(v4, "nodes");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setWithArray:", v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v12, "minusSet:", v15);
  if (objc_msgSend(v12, "count"))
  {
    v16 = (void *)objc_msgSend(v11, "mutableCopy");
    objc_msgSend(v12, "allObjects");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "removeObjectsInArray:", v17);

    -[COMeshTimerAddOn setMergingNodes:](self, "setMergingNodes:", v16);
    if (!objc_msgSend(v16, "count"))
    {
      COCoreLogForCategory(3);
      v18 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG))
        -[COMeshTimerAddOn didChangeNodesForMeshController:].cold.1((uint64_t)v4, self);

      -[COMeshTimerAddOn mergeRequest](self, "mergeRequest");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      -[COMeshTimerAddOn _finishMerge:](self, "_finishMerge:", v19);

    }
  }

}

void __52__COMeshTimerAddOn_didChangeNodesForMeshController___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v5;
  void *v6;
  id v7;

  v7 = a3;
  COMeshNodeForIDSIdentifier(*(void **)(a1 + 32), a2);
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = (void *)v5;
  if (!v5 || *(_BYTE *)(a1 + 40))
    objc_msgSend(v7, "setPrimaryAvailable:", v5 != 0);

}

- (COMeshTimerAddOnDelegate)delegate
{
  id v2;
  _QWORD v4[6];
  uint64_t v5;
  uint64_t *v6;
  uint64_t v7;
  uint64_t (*v8)(uint64_t, uint64_t);
  void (*v9)(uint64_t);
  id v10;

  v5 = 0;
  v6 = &v5;
  v7 = 0x3032000000;
  v8 = __Block_byref_object_copy__11;
  v9 = __Block_byref_object_dispose__11;
  v10 = 0;
  v4[0] = MEMORY[0x24BDAC760];
  v4[1] = 3221225472;
  v4[2] = __28__COMeshTimerAddOn_delegate__block_invoke;
  v4[3] = &unk_24D4B07E0;
  v4[4] = self;
  v4[5] = &v5;
  -[COMeshTimerAddOn _withLock:](self, "_withLock:", v4);
  v2 = (id)v6[5];
  _Block_object_dispose(&v5, 8);

  return (COMeshTimerAddOnDelegate *)v2;
}

void __28__COMeshTimerAddOn_delegate__block_invoke(uint64_t a1)
{
  id WeakRetained;
  uint64_t v3;
  void *v4;

  WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 32));
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = WeakRetained;

}

- (void)setDelegate:(id)a3
{
  id v4;
  id v5;
  _QWORD v6[4];
  id v7;
  COMeshTimerAddOn *v8;

  v4 = a3;
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __32__COMeshTimerAddOn_setDelegate___block_invoke;
  v6[3] = &unk_24D4B0858;
  v7 = v4;
  v8 = self;
  v5 = v4;
  -[COMeshTimerAddOn _withLock:](self, "_withLock:", v6);

}

void __32__COMeshTimerAddOn_setDelegate___block_invoke(uint64_t a1)
{
  id v2;
  id WeakRetained;

  v2 = *(id *)(a1 + 32);
  WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 40) + 32));

  if (v2 != WeakRetained)
    objc_storeWeak((id *)(*(_QWORD *)(a1 + 40) + 32), *(id *)(a1 + 32));
}

- (COMTActionDirector)actionDirector
{
  id v2;
  _QWORD v4[6];
  uint64_t v5;
  uint64_t *v6;
  uint64_t v7;
  uint64_t (*v8)(uint64_t, uint64_t);
  void (*v9)(uint64_t);
  id v10;

  v5 = 0;
  v6 = &v5;
  v7 = 0x3032000000;
  v8 = __Block_byref_object_copy__11;
  v9 = __Block_byref_object_dispose__11;
  v10 = 0;
  v4[0] = MEMORY[0x24BDAC760];
  v4[1] = 3221225472;
  v4[2] = __34__COMeshTimerAddOn_actionDirector__block_invoke;
  v4[3] = &unk_24D4B07E0;
  v4[4] = self;
  v4[5] = &v5;
  -[COMeshTimerAddOn _withLock:](self, "_withLock:", v4);
  v2 = (id)v6[5];
  _Block_object_dispose(&v5, 8);

  return (COMTActionDirector *)v2;
}

void __34__COMeshTimerAddOn_actionDirector__block_invoke(uint64_t a1)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), *(id *)(*(_QWORD *)(a1 + 32) + 80));
}

- (BOOL)performsLocalActions
{
  void *v2;
  void *v3;
  char v4;

  objc_msgSend(MEMORY[0x24BDD1760], "processInfo");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "processName");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isEqualToString:", CFSTR("xctest"));

  return v4;
}

- (void)_withLock:(id)a3
{
  os_unfair_lock_s *p_lock;
  void (**v4)(_QWORD);

  p_lock = &self->_lock;
  v4 = (void (**)(_QWORD))a3;
  os_unfair_lock_lock(p_lock);
  v4[2](v4);

  os_unfair_lock_unlock(p_lock);
}

- (id)_sendRequest:(id)a3 client:(id)a4
{
  id v6;
  id v7;
  void *v8;
  id v9;
  NSObject *v10;
  id v11;
  id v12;
  id v13;
  id v14;
  void *v15;
  id v16;
  _QWORD v18[4];
  id v19;
  id v20;
  id v21;
  id v22;

  v6 = a3;
  v7 = a4;
  -[COMeshAddOn meshController](self, "meshController");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_alloc_init(MEMORY[0x24BE6B608]);
  -[COMeshAddOn meshControllerQueue](self, "meshControllerQueue");
  v10 = objc_claimAutoreleasedReturnValue();
  v18[0] = MEMORY[0x24BDAC760];
  v18[1] = 3221225472;
  v18[2] = __40__COMeshTimerAddOn__sendRequest_client___block_invoke;
  v18[3] = &unk_24D4B0E50;
  v19 = v7;
  v20 = v6;
  v21 = v8;
  v11 = v9;
  v22 = v11;
  v12 = v8;
  v13 = v6;
  v14 = v7;
  dispatch_async(v10, v18);

  v15 = v22;
  v16 = v11;

  return v16;
}

void __40__COMeshTimerAddOn__sendRequest_client___block_invoke(id *a1)
{
  void *v2;
  void *v3;
  id v4;
  id v5;
  id v6;
  _QWORD v7[4];
  id v8;
  id v9;
  id v10;
  id v11;
  id v12;

  objc_msgSend(a1[4], "clientLifetimeActivity");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  +[CONetworkActivityFactory activityWithLabel:parentActivity:](CONetworkActivityFactory, "activityWithLabel:parentActivity:", 4, v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    objc_msgSend(a1[5], "setActivity:", v3);
    nw_activity_activate();
  }
  v5 = a1[5];
  v4 = a1[6];
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __40__COMeshTimerAddOn__sendRequest_client___block_invoke_2;
  v7[3] = &unk_24D4B1E58;
  v8 = v3;
  v9 = v5;
  v10 = a1[4];
  v11 = a1[7];
  v12 = a1[6];
  v6 = v3;
  objc_msgSend(v4, "sendRequest:withCompletionHandler:", v5, v7);

}

void __40__COMeshTimerAddOn__sendRequest_client___block_invoke_2(uint64_t a1, void *a2, void *a3, void *a4, void *a5)
{
  void *v5;
  id v10;
  id v11;
  id v12;
  id v13;
  xpc_object_t v14;
  objc_class *v15;
  id v16;
  void *v17;
  void *v18;
  NSObject *v19;
  uint64_t v20;
  objc_class *v21;
  void *v22;
  int v23;
  uint64_t v24;
  __int16 v25;
  void *v26;
  __int16 v27;
  id v28;
  uint64_t v29;

  v29 = *MEMORY[0x24BDAC8D0];
  v10 = a2;
  v11 = a3;
  v12 = a4;
  v13 = a5;
  if (!v13)
  {
    objc_msgSend(v12, "error");
    v13 = (id)objc_claimAutoreleasedReturnValue();
  }
  if (*(_QWORD *)(a1 + 32))
  {
    v14 = xpc_dictionary_create(0, 0, 0);
    if (v14)
    {
      v15 = (objc_class *)objc_opt_class();
      NSStringFromClass(v15);
      v16 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
      xpc_dictionary_set_string(v14, "command", (const char *)objc_msgSend(v16, "UTF8String"));

      objc_msgSend(*(id *)(a1 + 48), "clientBundleIdentifier");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = v17;
      if (!v17)
      {
        objc_msgSend(MEMORY[0x24BDD1488], "mainBundle");
        v5 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "bundleIdentifier");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
      }
      xpc_dictionary_set_string(v14, "client", (const char *)objc_msgSend(objc_retainAutorelease(v18), "UTF8String"));
      if (!v17)
      {

      }
      nw_activity_submit_metrics();
    }
    nw_activity_complete_with_reason();

  }
  if (v13)
  {
    COCoreLogForCategory(3);
    v19 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
    {
      v20 = *(_QWORD *)(a1 + 64);
      v21 = (objc_class *)objc_opt_class();
      NSStringFromClass(v21);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      v23 = 134218498;
      v24 = v20;
      v25 = 2112;
      v26 = v22;
      v27 = 2112;
      v28 = v13;
      _os_log_error_impl(&dword_215E92000, v19, OS_LOG_TYPE_ERROR, "%p %@ from leader failed (%@)", (uint8_t *)&v23, 0x20u);

    }
    objc_msgSend(*(id *)(a1 + 56), "finishWithError:", v13);
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 56), "finishWithNoResult");
  }

}

- (void)_addCompletionsToFuture:(id)a3 withXPCCallback:(id)a4 transactionDescription:(const char *)a5
{
  id v6;
  id v7;
  uint64_t v8;
  id v9;
  id v10;
  id v11;
  id v12;
  _QWORD v13[4];
  id v14;
  _QWORD *v15;
  _QWORD v16[4];
  id v17;
  _QWORD *v18;
  _QWORD v19[5];
  id v20;

  v6 = a3;
  v7 = a4;
  v19[0] = 0;
  v19[1] = v19;
  v19[2] = 0x3032000000;
  v19[3] = __Block_byref_object_copy__11;
  v19[4] = __Block_byref_object_dispose__11;
  v20 = (id)os_transaction_create();
  v8 = MEMORY[0x24BDAC760];
  v16[0] = MEMORY[0x24BDAC760];
  v16[1] = 3221225472;
  v16[2] = __83__COMeshTimerAddOn__addCompletionsToFuture_withXPCCallback_transactionDescription___block_invoke;
  v16[3] = &unk_24D4B1E80;
  v9 = v7;
  v17 = v9;
  v18 = v19;
  v10 = (id)objc_msgSend(v6, "addFailureBlock:", v16);
  v13[0] = v8;
  v13[1] = 3221225472;
  v13[2] = __83__COMeshTimerAddOn__addCompletionsToFuture_withXPCCallback_transactionDescription___block_invoke_2;
  v13[3] = &unk_24D4B1EA8;
  v11 = v9;
  v14 = v11;
  v15 = v19;
  v12 = (id)objc_msgSend(v6, "addSuccessBlock:", v13);

  _Block_object_dispose(v19, 8);
}

void __83__COMeshTimerAddOn__addCompletionsToFuture_withXPCCallback_transactionDescription___block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;

  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  v2 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v3 = *(void **)(v2 + 40);
  *(_QWORD *)(v2 + 40) = 0;

}

void __83__COMeshTimerAddOn__addCompletionsToFuture_withXPCCallback_transactionDescription___block_invoke_2(uint64_t a1)
{
  uint64_t v2;
  void *v3;

  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  v2 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v3 = *(void **)(v2 + 40);
  *(_QWORD *)(v2 + 40) = 0;

}

- (id)_filteredTimersList:(id)a3 forAccessory:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  id v9;
  void *v10;
  void *v11;
  id v12;
  uint64_t v14;
  uint64_t v15;
  uint64_t (*v16)(uint64_t, void *);
  void *v17;
  id v18;
  COMeshTimerAddOn *v19;

  v6 = a3;
  v7 = a4;
  COCoreLogForCategory(3);
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
    -[COMeshTimerAddOn _filteredTimersList:forAccessory:].cold.1();

  v14 = MEMORY[0x24BDAC760];
  v15 = 3221225472;
  v16 = __53__COMeshTimerAddOn__filteredTimersList_forAccessory___block_invoke;
  v17 = &unk_24D4B1ED0;
  v9 = v7;
  v18 = v9;
  v19 = self;
  objc_msgSend(v6, "indexesOfObjectsPassingTest:", &v14);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v10, "count", v14, v15, v16, v17))
  {
    v11 = (void *)objc_msgSend(v6, "mutableCopy");
    objc_msgSend(v11, "removeObjectsAtIndexes:", v10);

    v6 = v11;
  }
  v12 = v6;

  return v12;
}

uint64_t __53__COMeshTimerAddOn__filteredTimersList_forAccessory___block_invoke(uint64_t a1, void *a2)
{
  int v2;
  void *v3;
  void *v4;

  if (*(_QWORD *)(a1 + 32))
  {
    v2 = objc_msgSend(*(id *)(a1 + 40), "_isTimer:targetingAccessory:", a2);
  }
  else
  {
    objc_msgSend(a2, "siriContext");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "objectForKey:", *MEMORY[0x24BE19DE0]);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v2 = v4 == 0;

  }
  return v2 ^ 1u;
}

- (id)_timersForAccessoryIdentifier:(id)a3 allowLocalStorage:(BOOL)a4
{
  id v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  NSObject *v14;
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  void *v20;
  id v21;
  _QWORD block[5];
  id v24;
  id v25;
  id v26;
  id v27;
  void *v28;
  BOOL v29;

  v6 = a3;
  -[COMeshAddOn meshController](self, "meshController");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_alloc_init(MEMORY[0x24BE6B608]);
  -[COMeshTimerAddOn timerManager](self, "timerManager");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD1988], "currentConnection");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "co_ClientBundleIdentifier");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (!objc_msgSend(v11, "length"))
  {
    objc_msgSend(MEMORY[0x24BDD1488], "mainBundle");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "bundleIdentifier");
    v13 = objc_claimAutoreleasedReturnValue();

    v11 = (void *)v13;
  }
  -[COMeshAddOn meshControllerQueue](self, "meshControllerQueue");
  v14 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __68__COMeshTimerAddOn__timersForAccessoryIdentifier_allowLocalStorage___block_invoke;
  block[3] = &unk_24D4B1FF8;
  v29 = a4;
  block[4] = self;
  v24 = v7;
  v25 = v6;
  v26 = v9;
  v15 = v8;
  v27 = v15;
  v28 = v11;
  v16 = v11;
  v17 = v9;
  v18 = v6;
  v19 = v7;
  dispatch_async(v14, block);

  v20 = v28;
  v21 = v15;

  return v21;
}

void __68__COMeshTimerAddOn__timersForAccessoryIdentifier_allowLocalStorage___block_invoke(uint64_t a1)
{
  void *v2;
  NSObject *v3;
  uint64_t v4;
  uint64_t v5;
  COTimerReadRequest *v6;
  void *v7;
  void *v8;
  id v9;
  uint64_t v10;
  COTimerReadRequest *v11;
  id v12;
  void (**v13)(_QWORD, _QWORD, _QWORD);
  NSObject *v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  id v18;
  uint64_t v19;
  void *v20;
  id v21;
  void (**v22)(_QWORD, _QWORD, _QWORD);
  uint64_t v23;
  uint64_t v24;
  void (*v25)(uint64_t, void *, void *, void *, void *);
  void *v26;
  id v27;
  COTimerReadRequest *v28;
  id v29;
  id v30;
  id v31;
  uint64_t v32;
  id v33;
  id v34;
  _QWORD v35[4];
  id v36;
  uint64_t v37;
  id v38;
  id v39;
  uint8_t buf[4];
  uint64_t v41;
  __int16 v42;
  uint64_t v43;
  uint64_t v44;

  v44 = *MEMORY[0x24BDAC8D0];
  if (*(_BYTE *)(a1 + 80)
    && objc_msgSend(*(id *)(a1 + 32), "performsLocalActions")
    && (objc_msgSend(*(id *)(a1 + 40), "leader"), v2 = (void *)objc_claimAutoreleasedReturnValue(),
                                                  v2,
                                                  !v2))
  {
    COCoreLogForCategory(3);
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      v15 = *(_QWORD *)(a1 + 40);
      v16 = *(_QWORD *)(a1 + 48);
      *(_DWORD *)buf = 134218242;
      v41 = v15;
      v42 = 2112;
      v43 = v16;
      _os_log_impl(&dword_215E92000, v14, OS_LOG_TYPE_DEFAULT, "%p using local list of timers for %@", buf, 0x16u);
    }

    objc_msgSend(*(id *)(a1 + 56), "timers");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v35[0] = MEMORY[0x24BDAC760];
    v35[1] = 3221225472;
    v35[2] = __68__COMeshTimerAddOn__timersForAccessoryIdentifier_allowLocalStorage___block_invoke_86;
    v35[3] = &unk_24D4B1EF8;
    v18 = *(id *)(a1 + 48);
    v19 = *(_QWORD *)(a1 + 32);
    v20 = *(void **)(a1 + 40);
    v36 = v18;
    v37 = v19;
    v38 = v20;
    v39 = *(id *)(a1 + 64);
    v21 = (id)objc_msgSend(v17, "addCompletionBlock:", v35);

    objc_msgSend(*(id *)(a1 + 32), "recorder");
    v22 = (void (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
    ((void (**)(_QWORD, const __CFString *, void *))v22)[2](v22, CFSTR("com.apple.CoordinationCore.MeshAction"), &__block_literal_global_91);

    v12 = v36;
  }
  else
  {
    COCoreLogForCategory(3);
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      v4 = *(_QWORD *)(a1 + 40);
      v5 = *(_QWORD *)(a1 + 48);
      *(_DWORD *)buf = 134218242;
      v41 = v4;
      v42 = 2112;
      v43 = v5;
      _os_log_impl(&dword_215E92000, v3, OS_LOG_TYPE_DEFAULT, "%p requesting list of timers for %@ from the leader ", buf, 0x16u);
    }

    v6 = -[COTimerReadRequest initWithAccessoryUniqueIdentifier:requiresFilter:]([COTimerReadRequest alloc], "initWithAccessoryUniqueIdentifier:requiresFilter:", *(_QWORD *)(a1 + 48), 1);
    +[CONetworkActivityFactory activityWithLabel:parentActivity:](CONetworkActivityFactory, "activityWithLabel:parentActivity:", 4, 0);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (v7)
    {
      -[COMeshRequest setActivity:](v6, "setActivity:", v7);
      nw_activity_activate();
    }
    v8 = *(void **)(a1 + 40);
    v23 = MEMORY[0x24BDAC760];
    v24 = 3221225472;
    v25 = __68__COMeshTimerAddOn__timersForAccessoryIdentifier_allowLocalStorage___block_invoke_92;
    v26 = &unk_24D4B1FB0;
    v27 = v7;
    v28 = v6;
    v29 = *(id *)(a1 + 72);
    v30 = *(id *)(a1 + 48);
    v9 = *(id *)(a1 + 40);
    v10 = *(_QWORD *)(a1 + 32);
    v31 = v9;
    v32 = v10;
    v33 = *(id *)(a1 + 64);
    v34 = *(id *)(a1 + 56);
    v11 = v6;
    v12 = v7;
    objc_msgSend(v8, "sendRequest:withCompletionHandler:", v11, &v23);
    objc_msgSend(*(id *)(a1 + 32), "recorder", v23, v24, v25, v26);
    v13 = (void (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
    ((void (**)(_QWORD, const __CFString *, void *))v13)[2](v13, CFSTR("com.apple.CoordinationCore.MeshAction"), &__block_literal_global_96);

  }
}

void __68__COMeshTimerAddOn__timersForAccessoryIdentifier_allowLocalStorage___block_invoke_86(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  NSObject *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  NSObject *v13;
  uint64_t v14;
  void *v15;
  NSObject *v16;
  int v17;
  uint64_t v18;
  __int16 v19;
  id v20;
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
  v5 = a2;
  v6 = a3;
  if (v6)
  {
    v7 = v6;
    COCoreLogForCategory(3);
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      __68__COMeshTimerAddOn__timersForAccessoryIdentifier_allowLocalStorage___block_invoke_86_cold_2();

    objc_msgSend(*(id *)(a1 + 56), "finishWithError:", v7);
    goto LABEL_14;
  }
  if (!*(_QWORD *)(a1 + 32))
    goto LABEL_8;
  objc_msgSend(*(id *)(a1 + 40), "homekit");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "accessoryWithUniqueIdentifier:", *(_QWORD *)(a1 + 32));
  v10 = objc_claimAutoreleasedReturnValue();
  if (v10)
  {
    v11 = (void *)v10;
    objc_msgSend(*(id *)(a1 + 40), "_filteredTimersList:forAccessory:", v5, v10);
    v12 = objc_claimAutoreleasedReturnValue();

    v5 = (id)v12;
LABEL_8:
    COCoreLogForCategory(3);
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      v14 = *(_QWORD *)(a1 + 48);
      v17 = 134218242;
      v18 = v14;
      v19 = 2112;
      v20 = v5;
      _os_log_impl(&dword_215E92000, v13, OS_LOG_TYPE_DEFAULT, "%p local timers list: %@", (uint8_t *)&v17, 0x16u);
    }

    objc_msgSend(*(id *)(a1 + 56), "finishWithResult:", v5);
    goto LABEL_14;
  }
  objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", *MEMORY[0x24BDD5BD8], 2, 0);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  COCoreLogForCategory(3);
  v16 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    __68__COMeshTimerAddOn__timersForAccessoryIdentifier_allowLocalStorage___block_invoke_86_cold_1();

  objc_msgSend(*(id *)(a1 + 56), "finishWithError:", v15);
LABEL_14:

}

id __68__COMeshTimerAddOn__timersForAccessoryIdentifier_allowLocalStorage___block_invoke_89()
{
  return COCoreAnalyticsCreateActionEvent(CFSTR("timer"), CFSTR("read"), 0);
}

void __68__COMeshTimerAddOn__timersForAccessoryIdentifier_allowLocalStorage___block_invoke_92(uint64_t a1, void *a2, void *a3, void *a4, void *a5)
{
  id v9;
  id v10;
  id v11;
  id v12;
  xpc_object_t v13;
  objc_class *v14;
  id v15;
  NSObject *v16;
  xpc_object_t v17;
  objc_class *v18;
  id v19;
  uint64_t v20;
  void *v21;
  NSObject *v22;
  uint64_t v23;
  void *v24;
  void *v25;
  uint64_t v26;
  void *v27;
  uint64_t v28;
  NSObject *v29;
  uint64_t v30;
  uint64_t v31;
  void *v32;
  id v33;
  NSObject *v34;
  _QWORD v35[4];
  id v36;
  id v37;
  uint64_t *v38;
  uint64_t v39;
  uint64_t *v40;
  uint64_t v41;
  uint64_t (*v42)(uint64_t, uint64_t);
  void (*v43)(uint64_t);
  id v44;
  uint8_t buf[4];
  uint64_t v46;
  __int16 v47;
  uint64_t v48;
  uint64_t v49;

  v49 = *MEMORY[0x24BDAC8D0];
  v9 = a2;
  v10 = a3;
  v11 = a4;
  v12 = a5;
  if (!v12)
  {
    objc_msgSend(v11, "error");
    v12 = (id)objc_claimAutoreleasedReturnValue();
    if (!v12)
    {
      if (*(_QWORD *)(a1 + 32))
      {
        v17 = xpc_dictionary_create(0, 0, 0);
        if (v17)
        {
          v18 = (objc_class *)objc_opt_class();
          NSStringFromClass(v18);
          v19 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
          xpc_dictionary_set_string(v17, "command", (const char *)objc_msgSend(v19, "UTF8String"));

          xpc_dictionary_set_string(v17, "client", (const char *)objc_msgSend(objc_retainAutorelease(*(id *)(a1 + 48)), "UTF8String"));
          nw_activity_submit_metrics();
        }
        nw_activity_complete_with_reason();

      }
      v39 = 0;
      v40 = &v39;
      v41 = 0x3032000000;
      v42 = __Block_byref_object_copy__11;
      v43 = __Block_byref_object_dispose__11;
      v44 = 0;
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        objc_msgSend(v11, "timers");
        v20 = objc_claimAutoreleasedReturnValue();
        v21 = (void *)v40[5];
        v40[5] = v20;

        if (!*(_QWORD *)(a1 + 56)
          || !objc_msgSend(*(id *)(a1 + 40), "requiresFilter")
          || (objc_msgSend(v11, "isFiltered") & 1) != 0)
        {
          goto LABEL_25;
        }
        COCoreLogForCategory(3);
        v22 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
        {
          v23 = *(_QWORD *)(a1 + 64);
          *(_DWORD *)buf = 134217984;
          v46 = v23;
          _os_log_impl(&dword_215E92000, v22, OS_LOG_TYPE_INFO, "%p timer results from leader not filtered!", buf, 0xCu);
        }

        objc_msgSend(*(id *)(a1 + 72), "homekit");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v24, "accessoryWithUniqueIdentifier:", *(_QWORD *)(a1 + 56));
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        if (!v25)
        {
          objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", *MEMORY[0x24BDD5BD8], 2, 0);
          v12 = (id)objc_claimAutoreleasedReturnValue();
          COCoreLogForCategory(3);
          v34 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v34, OS_LOG_TYPE_ERROR))
            __68__COMeshTimerAddOn__timersForAccessoryIdentifier_allowLocalStorage___block_invoke_92_cold_1();

          objc_msgSend(*(id *)(a1 + 80), "finishWithError:", v12);
          goto LABEL_28;
        }
        objc_msgSend(*(id *)(a1 + 72), "_filteredTimersList:forAccessory:", v40[5], v25);
        v26 = objc_claimAutoreleasedReturnValue();
        v27 = (void *)v40[5];
        v40[5] = v26;

      }
      else
      {
        objc_msgSend(MEMORY[0x24BDBCE30], "array");
        v28 = objc_claimAutoreleasedReturnValue();
        v24 = (void *)v40[5];
        v40[5] = v28;
      }

LABEL_25:
      COCoreLogForCategory(3);
      v29 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
      {
        v30 = *(_QWORD *)(a1 + 64);
        v31 = v40[5];
        *(_DWORD *)buf = 134218242;
        v46 = v30;
        v47 = 2112;
        v48 = v31;
        _os_log_impl(&dword_215E92000, v29, OS_LOG_TYPE_DEFAULT, "%p timers list from leader: %@", buf, 0x16u);
      }

      objc_msgSend(*(id *)(a1 + 88), "timers");
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      v35[0] = MEMORY[0x24BDAC760];
      v35[1] = 3221225472;
      v35[2] = __68__COMeshTimerAddOn__timersForAccessoryIdentifier_allowLocalStorage___block_invoke_94;
      v35[3] = &unk_24D4B1F88;
      v38 = &v39;
      v36 = *(id *)(a1 + 64);
      v37 = *(id *)(a1 + 80);
      v33 = (id)objc_msgSend(v32, "addCompletionBlock:", v35);

      v12 = 0;
      v24 = v36;
LABEL_28:

      _Block_object_dispose(&v39, 8);
      goto LABEL_10;
    }
  }
  if (*(_QWORD *)(a1 + 32))
  {
    v13 = xpc_dictionary_create(0, 0, 0);
    if (v13)
    {
      v14 = (objc_class *)objc_opt_class();
      NSStringFromClass(v14);
      v15 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
      xpc_dictionary_set_string(v13, "command", (const char *)objc_msgSend(v15, "UTF8String"));

      xpc_dictionary_set_string(v13, "client", (const char *)objc_msgSend(objc_retainAutorelease(*(id *)(a1 + 48)), "UTF8String"));
      nw_activity_submit_metrics();
    }
    nw_activity_complete_with_reason();

  }
  COCoreLogForCategory(3);
  v16 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    __68__COMeshTimerAddOn__timersForAccessoryIdentifier_allowLocalStorage___block_invoke_92_cold_2();

  objc_msgSend(*(id *)(a1 + 80), "finishWithError:", v12);
LABEL_10:

}

void __68__COMeshTimerAddOn__timersForAccessoryIdentifier_allowLocalStorage___block_invoke_94(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t (*v8)(uint64_t, void *);
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  id v17;
  uint64_t (*v18)(uint64_t, void *);
  uint64_t v19;
  void *v20;
  uint64_t v21;
  void *v22;
  NSObject *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  _QWORD v27[4];
  id v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  uint8_t buf[4];
  uint64_t v34;
  __int16 v35;
  uint64_t v36;
  _BYTE v37[128];
  uint64_t v38;

  v38 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  v29 = 0u;
  v30 = 0u;
  v31 = 0u;
  v32 = 0u;
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v29, v37, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v30;
    v7 = MEMORY[0x24BDAC760];
    v8 = __68__COMeshTimerAddOn__timersForAccessoryIdentifier_allowLocalStorage___block_invoke_2;
    do
    {
      v9 = 0;
      v26 = v5;
      do
      {
        if (*(_QWORD *)v30 != v6)
          objc_enumerationMutation(v3);
        v10 = *(void **)(*((_QWORD *)&v29 + 1) + 8 * v9);
        if (objc_msgSend(v10, "isFiring", v26))
        {
          objc_msgSend(v10, "timerID");
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          v12 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40);
          v27[0] = v7;
          v27[1] = 3221225472;
          v27[2] = v8;
          v27[3] = &unk_24D4B1F60;
          v13 = v11;
          v28 = v13;
          v14 = objc_msgSend(v12, "indexOfObjectPassingTest:", v27);
          if (v14 != 0x7FFFFFFFFFFFFFFFLL)
          {
            v15 = v14;
            v16 = v6;
            v17 = v3;
            v18 = v8;
            v19 = v7;
            v20 = (void *)objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), "mutableCopy");
            objc_msgSend(v20, "replaceObjectAtIndex:withObject:", v15, v10);
            v21 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
            v22 = *(void **)(v21 + 40);
            *(_QWORD *)(v21 + 40) = v20;
            v7 = v19;
            v8 = v18;
            v3 = v17;
            v6 = v16;
            v5 = v26;

          }
        }
        ++v9;
      }
      while (v5 != v9);
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v29, v37, 16);
    }
    while (v5);
  }
  COCoreLogForCategory(3);
  v23 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
  {
    v24 = *(_QWORD *)(a1 + 32);
    v25 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40);
    *(_DWORD *)buf = 134218242;
    v34 = v24;
    v35 = 2112;
    v36 = v25;
    _os_log_impl(&dword_215E92000, v23, OS_LOG_TYPE_DEFAULT, "%p timers list after merge: %@", buf, 0x16u);
  }

  objc_msgSend(*(id *)(a1 + 40), "finishWithResult:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40));
}

uint64_t __68__COMeshTimerAddOn__timersForAccessoryIdentifier_allowLocalStorage___block_invoke_2(uint64_t a1, void *a2)
{
  void *v3;
  uint64_t v4;

  objc_msgSend(a2, "timerID");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isEqual:", *(_QWORD *)(a1 + 32));

  return v4;
}

id __68__COMeshTimerAddOn__timersForAccessoryIdentifier_allowLocalStorage___block_invoke_95()
{
  return COCoreAnalyticsCreateActionEvent(CFSTR("timer"), CFSTR("read"), 1);
}

- (id)_timersForAccessory:(id)a3 member:(id)a4
{
  id v6;
  id v7;
  void *v8;
  id v9;
  NSObject *v10;
  id v11;
  id v12;
  id v13;
  id v14;
  void *v15;
  id v16;
  _QWORD block[4];
  id v19;
  id v20;
  COMeshTimerAddOn *v21;
  id v22;
  id v23;

  v6 = a3;
  v7 = a4;
  -[COMeshAddOn meshController](self, "meshController");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_alloc_init(MEMORY[0x24BE6B608]);
  -[COMeshAddOn meshControllerQueue](self, "meshControllerQueue");
  v10 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __47__COMeshTimerAddOn__timersForAccessory_member___block_invoke;
  block[3] = &unk_24D4B0A10;
  v19 = v8;
  v20 = v6;
  v21 = self;
  v11 = v9;
  v22 = v11;
  v23 = v7;
  v12 = v7;
  v13 = v6;
  v14 = v8;
  dispatch_async(v10, block);

  v15 = v23;
  v16 = v11;

  return v16;
}

void __47__COMeshTimerAddOn__timersForAccessory_member___block_invoke(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  uint64_t v4;
  objc_class *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  void (*v15)(id *, void *, void *);
  void *v16;
  id v17;
  id v18;
  id v19;
  id v20;
  uint8_t buf[4];
  uint64_t v22;
  __int16 v23;
  uint64_t v24;
  uint64_t v25;

  v25 = *MEMORY[0x24BDAC8D0];
  COCoreLogForCategory(3);
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    v3 = *(_QWORD *)(a1 + 32);
    v4 = *(_QWORD *)(a1 + 40);
    *(_DWORD *)buf = 134218242;
    v22 = v3;
    v23 = 2114;
    v24 = v4;
    _os_log_impl(&dword_215E92000, v2, OS_LOG_TYPE_DEFAULT, "%p using secondary cluster timers for %{public}@", buf, 0x16u);
  }

  v5 = (objc_class *)objc_opt_class();
  NSStringFromClass(v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  +[COMTReadAction actionWithTargetType:targetMemento:](COMTReadAction, "actionWithTargetType:targetMemento:", v6, *(_QWORD *)(a1 + 40));
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  +[CONetworkActivityFactory activityWithLabel:parentActivity:](CONetworkActivityFactory, "activityWithLabel:parentActivity:", 4, 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8)
    nw_activity_activate();
  objc_initWeak((id *)buf, *(id *)(a1 + 48));
  v13 = MEMORY[0x24BDAC760];
  v14 = 3221225472;
  v15 = __47__COMeshTimerAddOn__timersForAccessory_member___block_invoke_99;
  v16 = &unk_24D4B2048;
  v17 = *(id *)(a1 + 32);
  objc_copyWeak(&v20, (id *)buf);
  v9 = v8;
  v18 = v9;
  v19 = *(id *)(a1 + 56);
  v10 = (void *)MEMORY[0x2199F3D40](&v13);
  objc_msgSend(*(id *)(a1 + 48), "actionDirector", v13, v14, v15, v16);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBCF20], "setWithObject:", *(_QWORD *)(a1 + 64));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "requestAction:members:activity:withCompletion:", v7, v12, v9, v10);

  objc_destroyWeak(&v20);
  objc_destroyWeak((id *)buf);

}

void __47__COMeshTimerAddOn__timersForAccessory_member___block_invoke_99(id *a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  id v8;
  id v9;
  _QWORD block[4];
  id v11;
  id v12;
  id v13;
  id v14;
  id v15;

  v5 = a2;
  v6 = a3;
  objc_msgSend(a1[4], "dispatchQueue");
  v7 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __47__COMeshTimerAddOn__timersForAccessory_member___block_invoke_2;
  block[3] = &unk_24D4B2020;
  objc_copyWeak(&v15, a1 + 7);
  v11 = v6;
  v12 = a1[5];
  v13 = a1[6];
  v14 = v5;
  v8 = v5;
  v9 = v6;
  dispatch_async(v7, block);

  objc_destroyWeak(&v15);
}

void __47__COMeshTimerAddOn__timersForAccessory_member___block_invoke_2(uint64_t a1)
{
  id WeakRetained;
  uint64_t v3;
  void *v4;
  uint64_t v5;
  id v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  id v10;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 64));
  if (WeakRetained)
  {
    v3 = *(_QWORD *)(a1 + 32);
    v10 = WeakRetained;
    if (v3)
    {
      if (*(_QWORD *)(a1 + 40))
      {
        nw_activity_complete_with_reason();
        v3 = *(_QWORD *)(a1 + 32);
      }
      objc_msgSend(*(id *)(a1 + 48), "finishWithError:", v3);
    }
    else
    {
      v5 = a1 + 48;
      v4 = *(void **)(a1 + 48);
      v6 = *(id *)(v5 + 8);
      objc_msgSend(v6, "timers");
      v7 = objc_claimAutoreleasedReturnValue();
      v8 = (void *)v7;
      if (v7)
        v9 = v7;
      else
        v9 = MEMORY[0x24BDBD1A8];
      objc_msgSend(v4, "finishWithResult:", v9);

    }
    WeakRetained = v10;
  }

}

- (id)_timersForAccessories:(id)a3 fromClient:(id)a4 results:(id)a5
{
  id v8;
  id v9;
  void *v10;
  _BOOL4 v11;
  unint64_t v12;
  uint64_t v13;
  void *v14;
  id v15;
  COTimerReadRequest *v16;
  void *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  id v21;
  id v22;
  uint64_t v23;
  id v24;
  COTimerReadRequest *v25;
  id v26;
  void *v27;
  id v28;
  uint64_t v29;
  id v30;
  id v31;
  id v32;
  id v33;
  id v34;
  id v35;
  void *v36;
  id v37;
  id v39;
  _QWORD v40[4];
  id v41;
  _QWORD v42[4];
  id v43;
  COMeshTimerAddOn *v44;
  id v45;
  id v46;
  _QWORD v47[4];
  id v48;
  COTimerReadRequest *v49;
  id v50;
  id v51;

  v8 = a3;
  v39 = a4;
  v9 = a5;
  -[COMeshAddOn meshController](self, "meshController");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = -[COMeshTimerAddOn performsLocalActions](self, "performsLocalActions");
  v12 = 0x24BE6B000uLL;
  v13 = MEMORY[0x24BDAC760];
  if (v11 && (objc_msgSend(v10, "leader"), v14 = (void *)objc_claimAutoreleasedReturnValue(), v14, !v14))
  {
    -[COMeshTimerAddOn timerManager](self, "timerManager");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "timers");
    v21 = (id)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v15 = objc_alloc_init(MEMORY[0x24BE6B608]);
    v16 = objc_alloc_init(COTimerReadRequest);
    +[CONetworkActivityFactory activityWithLabel:parentActivity:](CONetworkActivityFactory, "activityWithLabel:parentActivity:", 4, 0);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    if (v17)
    {
      -[COMeshRequest setActivity:](v16, "setActivity:", v17);
      nw_activity_activate();
    }
    objc_msgSend(v39, "clientBundleIdentifier");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    if (!objc_msgSend(v18, "length"))
    {
      objc_msgSend(MEMORY[0x24BDD1488], "mainBundle");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "bundleIdentifier");
      v20 = objc_claimAutoreleasedReturnValue();

      v18 = (void *)v20;
      v13 = MEMORY[0x24BDAC760];
    }
    v47[0] = v13;
    v47[1] = 3221225472;
    v47[2] = __61__COMeshTimerAddOn__timersForAccessories_fromClient_results___block_invoke;
    v47[3] = &unk_24D4B2070;
    v48 = v17;
    v49 = v16;
    v50 = v18;
    v21 = v15;
    v51 = v21;
    v22 = v18;
    v23 = v13;
    v24 = v22;
    v25 = v16;
    v26 = v17;
    objc_msgSend(v10, "sendRequest:withCompletionHandler:", v25, v47);

    v13 = v23;
    v12 = 0x24BE6B000;
  }
  v28 = objc_alloc_init(*(Class *)(v12 + 1544));
  v42[0] = v13;
  v42[1] = 3221225472;
  v42[2] = __61__COMeshTimerAddOn__timersForAccessories_fromClient_results___block_invoke_2;
  v42[3] = &unk_24D4B20E8;
  v43 = v8;
  v44 = self;
  v45 = v9;
  v29 = v13;
  v30 = v28;
  v46 = v30;
  v31 = v9;
  v32 = v8;
  v33 = (id)objc_msgSend(v21, "addSuccessBlock:", v42);
  v40[0] = v29;
  v40[1] = 3221225472;
  v40[2] = __61__COMeshTimerAddOn__timersForAccessories_fromClient_results___block_invoke_5;
  v40[3] = &unk_24D4B0D00;
  v34 = v30;
  v41 = v34;
  v35 = (id)objc_msgSend(v21, "addFailureBlock:", v40);
  v36 = v41;
  v37 = v34;

  return v37;
}

void __61__COMeshTimerAddOn__timersForAccessories_fromClient_results___block_invoke(uint64_t a1, void *a2, void *a3, void *a4, void *a5)
{
  id v9;
  id v10;
  id v11;
  xpc_object_t v12;
  objc_class *v13;
  id v14;
  char isKindOfClass;
  void *v16;
  void *v17;
  id v18;

  v18 = a2;
  v9 = a3;
  v10 = a4;
  v11 = a5;
  if (!v11)
  {
    objc_msgSend(v10, "error");
    v11 = (id)objc_claimAutoreleasedReturnValue();
  }
  if (*(_QWORD *)(a1 + 32))
  {
    v12 = xpc_dictionary_create(0, 0, 0);
    if (v12)
    {
      v13 = (objc_class *)objc_opt_class();
      NSStringFromClass(v13);
      v14 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
      xpc_dictionary_set_string(v12, "command", (const char *)objc_msgSend(v14, "UTF8String"));

      xpc_dictionary_set_string(v12, "client", (const char *)objc_msgSend(objc_retainAutorelease(*(id *)(a1 + 48)), "UTF8String"));
      nw_activity_submit_metrics();
    }
    nw_activity_complete_with_reason();

  }
  if (v11)
  {
    objc_msgSend(*(id *)(a1 + 56), "finishWithError:", v11);
  }
  else
  {
    objc_opt_class();
    isKindOfClass = objc_opt_isKindOfClass();
    v16 = *(void **)(a1 + 56);
    if ((isKindOfClass & 1) != 0)
    {
      objc_msgSend(v10, "timers");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "finishWithResult:", v17);

    }
    else
    {
      objc_msgSend(v16, "finishWithResult:", MEMORY[0x24BDBD1A8]);
    }
  }

}

void __61__COMeshTimerAddOn__timersForAccessories_fromClient_results___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  void *v5;
  id v6;
  _QWORD v7[4];
  id v8;
  uint64_t v9;
  id v10;

  v3 = a2;
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __61__COMeshTimerAddOn__timersForAccessories_fromClient_results___block_invoke_3;
  v7[3] = &unk_24D4B20C0;
  v5 = *(void **)(a1 + 32);
  v4 = *(_QWORD *)(a1 + 40);
  v8 = v3;
  v9 = v4;
  v10 = *(id *)(a1 + 48);
  v6 = v3;
  objc_msgSend(v5, "enumerateObjectsUsingBlock:", v7);
  objc_msgSend(*(id *)(a1 + 56), "finishWithNoResult");

}

void __61__COMeshTimerAddOn__timersForAccessories_fromClient_results___block_invoke_3(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  void *v5;
  id v6;
  _QWORD v7[5];
  id v8;

  objc_msgSend(a2, "uniqueIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __61__COMeshTimerAddOn__timersForAccessories_fromClient_results___block_invoke_4;
  v7[3] = &unk_24D4B2098;
  v4 = *(void **)(a1 + 32);
  v7[4] = *(_QWORD *)(a1 + 40);
  v8 = v3;
  v6 = v3;
  objc_msgSend(v4, "na_filter:", v7);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 48), "setObject:forKey:", v5, v6);

}

uint64_t __61__COMeshTimerAddOn__timersForAccessories_fromClient_results___block_invoke_4(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;
  id v4;
  void *v5;
  uint64_t v6;
  uint64_t v8;
  uint64_t v9;

  v9 = *MEMORY[0x24BDAC8D0];
  v2 = *(void **)(a1 + 32);
  v8 = *(_QWORD *)(a1 + 40);
  v3 = (void *)MEMORY[0x24BDBCE30];
  v4 = a2;
  objc_msgSend(v3, "arrayWithObjects:count:", &v8, 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v2, "_isTimer:targetingAccessoryIdentifiers:", v4, v5, v8, v9);

  return v6;
}

uint64_t __61__COMeshTimerAddOn__timersForAccessories_fromClient_results___block_invoke_5(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "finishWithError:", a2);
}

- (BOOL)_isTimer:(id)a3 targetingAccessoryIdentifiers:(id)a4
{
  id v5;
  id v6;
  void *v7;
  uint64_t v8;
  void *v9;
  BOOL v10;
  NSObject *v11;
  void *v12;
  void *v13;
  int v14;
  NSObject *v15;
  NSObject *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t i;
  void *v21;
  void *v22;
  int v23;
  void *v24;
  void *v25;
  void *v27;
  void *v28;
  NSObject *v29;
  void *v30;
  void *v31;
  id v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  uint8_t v37[128];
  uint8_t buf[4];
  void *v39;
  __int16 v40;
  void *v41;
  __int16 v42;
  id v43;
  uint64_t v44;

  v44 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  v6 = a4;
  objc_msgSend(v5, "siriContext");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "objectForKey:", *MEMORY[0x24BE19DE0]);
  v8 = objc_claimAutoreleasedReturnValue();
  v9 = (void *)v8;
  v10 = v8 == 0;
  if (v6 && v8)
  {
    objc_msgSend(MEMORY[0x24BDD1808], "componentsWithString:", v8);
    v11 = objc_claimAutoreleasedReturnValue();
    -[NSObject scheme](v11, "scheme");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v12, "isEqualToString:", CFSTR("siri-hk-target")) & 1) != 0)
    {
      -[NSObject path](v11, "path");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = objc_msgSend(v13, "isEqualToString:", CFSTR("accessory"));

      if (v14)
      {
        COCoreLogForCategory(3);
        v15 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
        {
          objc_msgSend(v5, "timerID");
          v27 = (void *)objc_claimAutoreleasedReturnValue();
          -[NSObject query](v11, "query");
          v28 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138412802;
          v39 = v27;
          v40 = 2112;
          v41 = v28;
          v42 = 2112;
          v43 = v6;
          _os_log_debug_impl(&dword_215E92000, v15, OS_LOG_TYPE_DEBUG, "checking if timer (%@) target (%@) contains %@", buf, 0x20u);

        }
        v35 = 0u;
        v36 = 0u;
        v33 = 0u;
        v34 = 0u;
        -[NSObject queryItems](v11, "queryItems");
        v16 = objc_claimAutoreleasedReturnValue();
        v17 = -[NSObject countByEnumeratingWithState:objects:count:](v16, "countByEnumeratingWithState:objects:count:", &v33, v37, 16);
        if (v17)
        {
          v18 = v17;
          v29 = v11;
          v30 = v9;
          v31 = v7;
          v32 = v5;
          v19 = *(_QWORD *)v34;
          while (2)
          {
            for (i = 0; i != v18; ++i)
            {
              if (*(_QWORD *)v34 != v19)
                objc_enumerationMutation(v16);
              v21 = *(void **)(*((_QWORD *)&v33 + 1) + 8 * i);
              objc_msgSend(v21, "name", v29, v30, v31, v32);
              v22 = (void *)objc_claimAutoreleasedReturnValue();
              v23 = objc_msgSend(CFSTR("identifier"), "isEqualToString:", v22);

              if (v23)
              {
                objc_msgSend(v21, "value");
                v24 = (void *)objc_claimAutoreleasedReturnValue();
                if (v24)
                {
                  v25 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD1880]), "initWithUUIDString:", v24);
                  if (v25 && (objc_msgSend(v6, "containsObject:", v25) & 1) != 0)
                  {

                    v10 = 1;
                    goto LABEL_30;
                  }

                }
              }
            }
            v18 = -[NSObject countByEnumeratingWithState:objects:count:](v16, "countByEnumeratingWithState:objects:count:", &v33, v37, 16);
            if (v18)
              continue;
            break;
          }
          v10 = 0;
LABEL_30:
          v7 = v31;
          v5 = v32;
          v11 = v29;
          v9 = v30;
          goto LABEL_27;
        }
LABEL_26:
        v10 = 0;
LABEL_27:

        goto LABEL_28;
      }
    }
    else
    {

    }
    COCoreLogForCategory(3);
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
      -[COMeshTimerAddOn _isTimer:targetingAccessoryIdentifiers:].cold.2();
    goto LABEL_26;
  }
  COCoreLogForCategory(3);
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
    -[COMeshTimerAddOn _isTimer:targetingAccessoryIdentifiers:].cold.1(v5, v11);
LABEL_28:

  return v10;
}

- (id)_currentAccessoryForClient:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  objc_msgSend(a3, "connection");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "co_PeerInstance");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    -[COMeshTimerAddOn homehub](self, "homehub");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[COMeshTimerAddOn homekit](self, "homekit");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "accessoryForPeerInstance:usingHomeKitAdapter:", v5, v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    -[COMeshTimerAddOn homekit](self, "homekit");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "currentAccessory");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v8;
}

- (void)_sendNotification:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  id v12;
  id v13;
  _QWORD v14[4];
  id v15;
  COMeshTimerAddOn *v16;
  id v17;
  id v18;

  v4 = a3;
  -[COMeshAddOn meshControllerQueue](self, "meshControllerQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v5);

  objc_msgSend(v4, "userInfo");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectForKey:", *MEMORY[0x24BE67800]);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "name");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  -[COMeshAddOn meshController](self, "meshController");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[COMeshTimerAddOn interests](self, "interests");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v14[0] = MEMORY[0x24BDAC760];
  v14[1] = 3221225472;
  v14[2] = __38__COMeshTimerAddOn__sendNotification___block_invoke;
  v14[3] = &unk_24D4B2138;
  v15 = v7;
  v16 = self;
  v17 = v8;
  v18 = v9;
  v11 = v9;
  v12 = v8;
  v13 = v7;
  objc_msgSend(v10, "enumerateKeysAndObjectsUsingBlock:", v14);

}

void __38__COMeshTimerAddOn__sendNotification___block_invoke(id *a1, void *a2, void *a3)
{
  id v5;
  id v6;
  uint64_t v7;
  id v8;
  id v9;
  void *v10;
  COMTTimerNotificationAction *v11;
  id v12;
  void *v13;
  COMTTimerNotificationAction *v14;
  void *v15;
  void *v16;
  _QWORD v17[4];
  id v18;
  id v19;
  id v20;
  _QWORD v21[5];
  id v22;

  v5 = a2;
  v6 = a3;
  v7 = MEMORY[0x24BDAC760];
  v21[0] = MEMORY[0x24BDAC760];
  v21[1] = 3221225472;
  v21[2] = __38__COMeshTimerAddOn__sendNotification___block_invoke_2;
  v21[3] = &unk_24D4B1ED0;
  v8 = a1[4];
  v21[4] = a1[5];
  v9 = v6;
  v22 = v9;
  objc_msgSend(v8, "indexesOfObjectsPassingTest:", v21);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v10, "count"))
  {
    v11 = [COMTTimerNotificationAction alloc];
    v12 = a1[6];
    objc_msgSend(a1[4], "objectsAtIndexes:", v10);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = -[COMTTimerNotificationAction initWithReason:timers:](v11, "initWithReason:timers:", v12, v13);

    objc_msgSend(a1[5], "actionDirector");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDBCF20], "setWithObject:", v5);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17[0] = v7;
    v17[1] = 3221225472;
    v17[2] = __38__COMeshTimerAddOn__sendNotification___block_invoke_3;
    v17[3] = &unk_24D4B2110;
    v18 = a1[7];
    v19 = a1[6];
    v20 = v5;
    objc_msgSend(v15, "requestAction:members:withCompletion:", v14, v16, v17);

  }
}

uint64_t __38__COMeshTimerAddOn__sendNotification___block_invoke_2(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "_isTimer:targetingAccessoryIdentifiers:", a2, *(_QWORD *)(a1 + 40));
}

void __38__COMeshTimerAddOn__sendNotification___block_invoke_3(uint64_t a1, uint64_t a2, uint64_t a3)
{
  NSObject *v3;

  if (a3)
  {
    COCoreLogForCategory(3);
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
      __38__COMeshTimerAddOn__sendNotification___block_invoke_3_cold_1();

  }
}

- (void)_timerManagerTimersAdded:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  NSObject *v7;
  id v8;
  id v9;
  void *v10;
  _QWORD block[4];
  id v12;
  COMeshTimerAddOn *v13;
  id v14;

  v4 = a3;
  objc_msgSend(v4, "userInfo");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKey:", *MEMORY[0x24BE67800]);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  -[COMeshAddOn meshControllerQueue](self, "meshControllerQueue");
  v7 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __45__COMeshTimerAddOn__timerManagerTimersAdded___block_invoke;
  block[3] = &unk_24D4B08D0;
  v8 = v6;
  v12 = v8;
  v13 = self;
  v9 = v4;
  v14 = v9;
  dispatch_async(v7, block);

  -[COMeshTimerAddOn delegate](self, "delegate");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v10, "timerAddOn:didAddTimers:", self, v8);

}

uint64_t __45__COMeshTimerAddOn__timerManagerTimersAdded___block_invoke(uint64_t a1)
{
  id v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t i;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v2 = *(id *)(a1 + 32);
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v13;
    do
    {
      for (i = 0; i != v4; ++i)
      {
        if (*(_QWORD *)v13 != v5)
          objc_enumerationMutation(v2);
        v7 = *(void **)(*((_QWORD *)&v12 + 1) + 8 * i);
        if ((objc_msgSend(v7, "isCurrentTimer", (_QWORD)v12) & 1) == 0)
        {
          objc_msgSend(v7, "lastModifiedDate");
          v8 = (void *)objc_claimAutoreleasedReturnValue();
          if (!v8)
          {
            objc_msgSend(MEMORY[0x24BDBCE60], "distantPast");
            v8 = (void *)objc_claimAutoreleasedReturnValue();
          }
          objc_msgSend(*(id *)(a1 + 40), "timerIndex");
          v9 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v7, "timerID");
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v9, "setObject:forKey:", v8, v10);

        }
      }
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v4);
  }

  return objc_msgSend(*(id *)(a1 + 40), "_sendNotification:", *(_QWORD *)(a1 + 48));
}

- (void)_timerManagerTimersRemoved:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  NSObject *v7;
  id v8;
  id v9;
  void *v10;
  _QWORD block[4];
  id v12;
  COMeshTimerAddOn *v13;
  id v14;

  v4 = a3;
  objc_msgSend(v4, "userInfo");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKey:", *MEMORY[0x24BE67800]);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  -[COMeshAddOn meshControllerQueue](self, "meshControllerQueue");
  v7 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __47__COMeshTimerAddOn__timerManagerTimersRemoved___block_invoke;
  block[3] = &unk_24D4B08D0;
  v8 = v6;
  v12 = v8;
  v13 = self;
  v9 = v4;
  v14 = v9;
  dispatch_async(v7, block);

  -[COMeshTimerAddOn delegate](self, "delegate");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v10, "timerAddOn:didRemoveTimers:", self, v8);

}

uint64_t __47__COMeshTimerAddOn__timerManagerTimersRemoved___block_invoke(uint64_t a1)
{
  id v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t i;
  void *v7;
  void *v8;
  void *v9;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v2 = *(id *)(a1 + 32);
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
        if ((objc_msgSend(v7, "isCurrentTimer", (_QWORD)v11) & 1) == 0)
        {
          objc_msgSend(*(id *)(a1 + 40), "timerIndex");
          v8 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v7, "timerID");
          v9 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v8, "removeObjectForKey:", v9);

        }
      }
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v4);
  }

  return objc_msgSend(*(id *)(a1 + 40), "_sendNotification:", *(_QWORD *)(a1 + 48));
}

- (void)_timerManagerTimersUpdated:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  NSObject *v7;
  id v8;
  id v9;
  void *v10;
  _QWORD block[4];
  id v12;
  COMeshTimerAddOn *v13;
  id v14;

  v4 = a3;
  objc_msgSend(v4, "userInfo");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKey:", *MEMORY[0x24BE67800]);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  -[COMeshAddOn meshControllerQueue](self, "meshControllerQueue");
  v7 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __47__COMeshTimerAddOn__timerManagerTimersUpdated___block_invoke;
  block[3] = &unk_24D4B08D0;
  v8 = v6;
  v12 = v8;
  v13 = self;
  v9 = v4;
  v14 = v9;
  dispatch_async(v7, block);

  -[COMeshTimerAddOn delegate](self, "delegate");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v10, "timerAddOn:didUpdateTimers:", self, v8);

}

uint64_t __47__COMeshTimerAddOn__timerManagerTimersUpdated___block_invoke(uint64_t a1)
{
  id v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t i;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v2 = *(id *)(a1 + 32);
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v13;
    do
    {
      for (i = 0; i != v4; ++i)
      {
        if (*(_QWORD *)v13 != v5)
          objc_enumerationMutation(v2);
        v7 = *(void **)(*((_QWORD *)&v12 + 1) + 8 * i);
        if ((objc_msgSend(v7, "isCurrentTimer", (_QWORD)v12) & 1) == 0)
        {
          objc_msgSend(v7, "lastModifiedDate");
          v8 = (void *)objc_claimAutoreleasedReturnValue();
          if (!v8)
          {
            objc_msgSend(MEMORY[0x24BDBCE60], "distantPast");
            v8 = (void *)objc_claimAutoreleasedReturnValue();
          }
          objc_msgSend(*(id *)(a1 + 40), "timerIndex");
          v9 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v7, "timerID");
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v9, "setObject:forKey:", v8, v10);

        }
      }
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v4);
  }

  return objc_msgSend(*(id *)(a1 + 40), "_sendNotification:", *(_QWORD *)(a1 + 48));
}

- (void)_timerManagerTimerFired:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  NSObject *v8;
  COTimerFiredNotification *v9;

  objc_msgSend(a3, "userInfo");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKey:", *MEMORY[0x24BE67800]);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  -[COMeshTimerAddOn delegate](self, "delegate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v6, "timerAddOn:didFireTimers:", self, v5);
  if (-[COMeshTimerAddOn performsLocalActions](self, "performsLocalActions"))
  {
    -[COMeshAddOn meshController](self, "meshController");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    COCoreLogForCategory(3);
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
      -[COMeshTimerAddOn _timerManagerTimerFired:].cold.1();

    v9 = -[COTimerNotification initWithTimers:]([COTimerFiredNotification alloc], "initWithTimers:", v5);
    objc_msgSend(v7, "sendNotification:", v9);

  }
}

- (void)_timerManagerStateReset:(id)a3
{
  id v4;
  _QWORD v5[4];
  id v6;
  id location;

  v4 = a3;
  objc_initWeak(&location, self);
  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 3221225472;
  v5[2] = __44__COMeshTimerAddOn__timerManagerStateReset___block_invoke;
  v5[3] = &unk_24D4B1C38;
  objc_copyWeak(&v6, &location);
  -[COMeshTimerAddOn _reloadIndexWithCompletion:](self, "_reloadIndexWithCompletion:", v5);
  objc_destroyWeak(&v6);
  objc_destroyWeak(&location);

}

void __44__COMeshTimerAddOn__timerManagerStateReset___block_invoke(uint64_t a1, char a2)
{
  id WeakRetained;
  void *v4;
  void *v5;
  COTimerManagerStateResetNotification *v6;
  NSObject *v7;
  void *v8;
  int v9;
  void *v10;
  uint64_t v11;

  v11 = *MEMORY[0x24BDAC8D0];
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v4 = WeakRetained;
  if (WeakRetained)
  {
    objc_msgSend(WeakRetained, "meshController");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if ((a2 & 1) != 0)
    {
      v6 = objc_alloc_init(COTimerManagerStateResetNotification);
      COCoreLogForCategory(3);
      v7 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
        __44__COMeshTimerAddOn__timerManagerStateReset___block_invoke_cold_1();

      objc_msgSend(v5, "sendNotification:", v6);
      objc_msgSend(v4, "delegate");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      if ((objc_opt_respondsToSelector() & 1) != 0)
        objc_msgSend(v8, "didResetTimerAddOn:", v4);

    }
    else
    {
      COCoreLogForCategory(3);
      v6 = (COTimerManagerStateResetNotification *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(&v6->super.super.super, OS_LOG_TYPE_DEFAULT))
      {
        v9 = 134217984;
        v10 = v5;
        _os_log_impl(&dword_215E92000, &v6->super.super.super, OS_LOG_TYPE_DEFAULT, "%p not emitting state reset, timers not updated", (uint8_t *)&v9, 0xCu);
      }
    }

  }
}

- (void)_timerManagerTimersChanged:(id)a3
{
  void *v4;
  void *v5;
  id v6;

  objc_msgSend(a3, "userInfo");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKey:", *MEMORY[0x24BE67800]);
  v6 = (id)objc_claimAutoreleasedReturnValue();

  -[COMeshTimerAddOn delegate](self, "delegate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v5, "timerAddOn:didChangeTimers:", self, v6);

}

- (void)_startMerge
{
  void *v3;
  NSObject *v4;
  id v5;
  NSObject *v6;
  void *v7;
  void *v8;
  NSObject *v9;
  id v10;
  id v11;
  _QWORD v12[4];
  NSObject *v13;
  id v14;
  id v15;
  uint8_t buf[4];
  void *v17;
  __int16 v18;
  id v19;
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  -[COMeshAddOn meshController](self, "meshController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[COMeshAddOn meshControllerQueue](self, "meshControllerQueue");
  v4 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v4);
  v5 = -[COTimerReadRequest initForMerge]([COTimerReadRequest alloc], "initForMerge");
  -[COMeshTimerAddOn setMergeRequest:](self, "setMergeRequest:", v5);
  COCoreLogForCategory(3);
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134218240;
    v17 = v3;
    v18 = 2048;
    v19 = v5;
    _os_log_impl(&dword_215E92000, v6, OS_LOG_TYPE_DEFAULT, "%p starting merge for %p...", buf, 0x16u);
  }

  if (-[COMeshTimerAddOn performsLocalActions](self, "performsLocalActions"))
  {
    -[COMeshTimerAddOn timerManager](self, "timerManager");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "timers");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    objc_msgSend(MEMORY[0x24BE6B608], "futureWithResult:", MEMORY[0x24BDBD1A8]);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
  }
  objc_initWeak((id *)buf, self);
  v12[0] = MEMORY[0x24BDAC760];
  v12[1] = 3221225472;
  v12[2] = __31__COMeshTimerAddOn__startMerge__block_invoke;
  v12[3] = &unk_24D4B2188;
  v9 = v4;
  v13 = v9;
  objc_copyWeak(&v15, (id *)buf);
  v10 = v5;
  v14 = v10;
  v11 = (id)objc_msgSend(v8, "addCompletionBlock:", v12);

  objc_destroyWeak(&v15);
  objc_destroyWeak((id *)buf);

}

void __31__COMeshTimerAddOn__startMerge__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  id v5;
  _QWORD block[4];
  id v7;
  id v8;
  id v9;

  v3 = a2;
  v4 = *(NSObject **)(a1 + 32);
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __31__COMeshTimerAddOn__startMerge__block_invoke_2;
  block[3] = &unk_24D4B2160;
  objc_copyWeak(&v9, (id *)(a1 + 48));
  v7 = *(id *)(a1 + 40);
  v8 = v3;
  v5 = v3;
  dispatch_async(v4, block);

  objc_destroyWeak(&v9);
}

void __31__COMeshTimerAddOn__startMerge__block_invoke_2(uint64_t a1)
{
  id WeakRetained;
  uint64_t v3;
  id v4;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  v4 = WeakRetained;
  if (*(_QWORD *)(a1 + 40))
    v3 = *(_QWORD *)(a1 + 40);
  else
    v3 = MEMORY[0x24BDBD1A8];
  objc_msgSend(WeakRetained, "_broadcastMerge:withTruth:", *(_QWORD *)(a1 + 32), v3);

}

- (void)_broadcastMerge:(id)a3 withTruth:(id)a4
{
  id v6;
  void *v7;
  NSObject *v8;
  id v9;
  NSObject *v10;
  NSObject *v11;
  id v12;
  id v13;
  uint64_t v14;
  id v15;
  void *v16;
  id v17;
  void *v18;
  id v19;
  id v20;
  id v21;
  _QWORD v22[4];
  id v23;
  id v24;
  _QWORD v25[4];
  id v26;
  id v27;
  uint8_t buf[4];
  void *v29;
  __int16 v30;
  id v31;
  __int16 v32;
  NSObject *v33;
  uint64_t v34;

  v34 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v21 = a4;
  -[COMeshAddOn meshController](self, "meshController");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[COMeshAddOn meshControllerQueue](self, "meshControllerQueue");
  v8 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v8);

  -[COMeshTimerAddOn mergeRequest](self, "mergeRequest");
  v9 = (id)objc_claimAutoreleasedReturnValue();

  if (v9 == v6)
  {
    eTagForTimers(v21);
    v10 = objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setETag:", v10);
    COCoreLogForCategory(3);
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134218498;
      v29 = v7;
      v30 = 2048;
      v31 = v6;
      v32 = 2114;
      v33 = v10;
      _os_log_impl(&dword_215E92000, v11, OS_LOG_TYPE_DEFAULT, "%p broadcasting merge %p with eTag %{public}@", buf, 0x20u);
    }

    v12 = objc_alloc_init(MEMORY[0x24BDBCE30]);
    -[COMeshTimerAddOn setMergingNodes:](self, "setMergingNodes:", v12);

    v13 = objc_alloc_init(MEMORY[0x24BDBCE70]);
    -[COMeshTimerAddOn setMergeResponses:](self, "setMergeResponses:", v13);

    -[COMeshTimerAddOn setMergeTimers:](self, "setMergeTimers:", v21);
    objc_initWeak((id *)buf, self);
    v14 = MEMORY[0x24BDAC760];
    v25[0] = MEMORY[0x24BDAC760];
    v25[1] = 3221225472;
    v25[2] = __46__COMeshTimerAddOn__broadcastMerge_withTruth___block_invoke;
    v25[3] = &unk_24D4B21B0;
    objc_copyWeak(&v27, (id *)buf);
    v15 = v6;
    v26 = v15;
    v16 = (void *)MEMORY[0x2199F3D40](v25);
    v22[0] = v14;
    v22[1] = 3221225472;
    v22[2] = __46__COMeshTimerAddOn__broadcastMerge_withTruth___block_invoke_2;
    v22[3] = &unk_24D4B21D8;
    objc_copyWeak(&v24, (id *)buf);
    v17 = v15;
    v23 = v17;
    v18 = (void *)MEMORY[0x2199F3D40](v22);
    v19 = objc_alloc_init(MEMORY[0x24BDBCE30]);
    -[COMeshTimerAddOn setMergingNodes:](self, "setMergingNodes:", v19);

    v20 = objc_alloc_init(MEMORY[0x24BDBCE70]);
    -[COMeshTimerAddOn setMergeResponses:](self, "setMergeResponses:", v20);

    objc_msgSend(v7, "broadcastRequest:includingSelf:recipientsCallback:completionHandler:", v17, 0, v16, v18);
    objc_destroyWeak(&v24);

    objc_destroyWeak(&v27);
    objc_destroyWeak((id *)buf);

  }
  else
  {
    COCoreLogForCategory(3);
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134218240;
      v29 = v7;
      v30 = 2048;
      v31 = v6;
      _os_log_impl(&dword_215E92000, v10, OS_LOG_TYPE_DEFAULT, "%p ignoring broadcast for merge %p", buf, 0x16u);
    }
  }

}

void __46__COMeshTimerAddOn__broadcastMerge_withTruth___block_invoke(uint64_t a1, void *a2)
{
  id WeakRetained;
  void *v4;
  id v5;

  v5 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v4 = WeakRetained;
  if (WeakRetained)
    objc_msgSend(WeakRetained, "_primeMerge:withNodes:", *(_QWORD *)(a1 + 32), v5);

}

void __46__COMeshTimerAddOn__broadcastMerge_withTruth___block_invoke_2(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7;
  id v8;
  id v9;
  id WeakRetained;
  void *v11;
  void *v12;
  void *v13;
  NSObject *v14;

  v7 = a2;
  v8 = a3;
  v9 = a4;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v11 = WeakRetained;
  if (WeakRetained)
  {
    if (v9)
    {
      objc_msgSend(WeakRetained, "_continueMerge:withResponse:fromNode:", v7, v9, v8);
    }
    else
    {
      objc_msgSend(WeakRetained, "mergingNodes");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = (void *)objc_msgSend(v12, "mutableCopy");

      objc_msgSend(v13, "removeObject:", v8);
      objc_msgSend(v11, "setMergingNodes:", v13);
      if (!objc_msgSend(v13, "count"))
      {
        COCoreLogForCategory(3);
        v14 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
          __46__COMeshTimerAddOn__broadcastMerge_withTruth___block_invoke_2_cold_1();

        objc_msgSend(v11, "_finishMerge:", *(_QWORD *)(a1 + 32));
      }

    }
  }

}

- (void)_primeMerge:(id)a3 withNodes:(id)a4
{
  id v6;
  id v7;
  void *v8;
  NSObject *v9;
  id v10;
  NSObject *v11;
  uint64_t v12;
  NSObject *v13;
  _BOOL4 v14;
  int v15;
  void *v16;
  __int16 v17;
  id v18;
  __int16 v19;
  uint64_t v20;
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  -[COMeshAddOn meshController](self, "meshController");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "dispatchQueue");
  v9 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v9);

  -[COMeshTimerAddOn mergeRequest](self, "mergeRequest");
  v10 = (id)objc_claimAutoreleasedReturnValue();

  if (v10 == v6)
  {
    -[COMeshTimerAddOn setMergingNodes:](self, "setMergingNodes:", v7);
    v12 = objc_msgSend(v7, "count");
    COCoreLogForCategory(3);
    v13 = objc_claimAutoreleasedReturnValue();
    v14 = os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT);
    if (v12)
    {
      if (v14)
      {
        v15 = 134218496;
        v16 = v8;
        v17 = 2048;
        v18 = v6;
        v19 = 2048;
        v20 = v12;
        _os_log_impl(&dword_215E92000, v13, OS_LOG_TYPE_DEFAULT, "%p merge %p with %ld others.", (uint8_t *)&v15, 0x20u);
      }

    }
    else
    {
      if (v14)
      {
        v15 = 134218240;
        v16 = v8;
        v17 = 2048;
        v18 = v6;
        _os_log_impl(&dword_215E92000, v13, OS_LOG_TYPE_DEFAULT, "%p is solo, so %p is finished.", (uint8_t *)&v15, 0x16u);
      }

      -[COMeshTimerAddOn _finishMerge:](self, "_finishMerge:", v6);
    }
  }
  else
  {
    COCoreLogForCategory(3);
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      v15 = 134218240;
      v16 = v8;
      v17 = 2048;
      v18 = v6;
      _os_log_impl(&dword_215E92000, v11, OS_LOG_TYPE_DEFAULT, "%p ignoring prime of merge %p", (uint8_t *)&v15, 0x16u);
    }

  }
}

- (void)_continueMerge:(id)a3 withResponse:(id)a4 fromNode:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  NSObject *v12;
  id v13;
  NSObject *v14;
  void *v15;
  NSObject *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  NSObject *v20;
  _BOOL4 v21;
  int v22;
  void *v23;
  __int16 v24;
  id v25;
  __int16 v26;
  uint64_t v27;
  uint64_t v28;

  v28 = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  -[COMeshAddOn meshController](self, "meshController");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "dispatchQueue");
  v12 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v12);

  -[COMeshTimerAddOn mergeRequest](self, "mergeRequest");
  v13 = (id)objc_claimAutoreleasedReturnValue();

  if (v13 == v8)
  {
    -[COMeshTimerAddOn mergingNodes](self, "mergingNodes");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = objc_msgSend(v15, "mutableCopy");

    -[NSObject removeObject:](v14, "removeObject:", v10);
    -[COMeshTimerAddOn setMergingNodes:](self, "setMergingNodes:", v14);
    if ((objc_msgSend(v9, "skipInMerge") & 1) != 0)
    {
      COCoreLogForCategory(3);
      v16 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
      {
        v22 = 134218496;
        v23 = v11;
        v24 = 2048;
        v25 = v10;
        v26 = 2048;
        v27 = (uint64_t)v8;
        _os_log_debug_impl(&dword_215E92000, v16, OS_LOG_TYPE_DEBUG, "%p skipping node %p in merge %p", (uint8_t *)&v22, 0x20u);
      }

    }
    else
    {
      -[COMeshTimerAddOn mergeResponses](self, "mergeResponses");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = (void *)objc_msgSend(v17, "mutableCopy");

      objc_msgSend(v18, "setObject:forKey:", v9, v10);
      -[COMeshTimerAddOn setMergeResponses:](self, "setMergeResponses:", v18);

    }
    v19 = -[NSObject count](v14, "count");
    COCoreLogForCategory(3);
    v20 = objc_claimAutoreleasedReturnValue();
    v21 = os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG);
    if (v19)
    {
      if (v21)
      {
        v22 = 134218496;
        v23 = v11;
        v24 = 2048;
        v25 = v8;
        v26 = 2048;
        v27 = v19;
        _os_log_debug_impl(&dword_215E92000, v20, OS_LOG_TYPE_DEBUG, "%p merge %p still waiting on %ld others.", (uint8_t *)&v22, 0x20u);
      }

    }
    else
    {
      if (v21)
        -[COMeshTimerAddOn _continueMerge:withResponse:fromNode:].cold.1();

      -[COMeshTimerAddOn _finishMerge:](self, "_finishMerge:", v8);
    }
  }
  else
  {
    COCoreLogForCategory(3);
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      v22 = 134218240;
      v23 = v11;
      v24 = 2048;
      v25 = v8;
      _os_log_impl(&dword_215E92000, v14, OS_LOG_TYPE_DEFAULT, "%p ignoring continuation of merge %p", (uint8_t *)&v22, 0x16u);
    }
  }

}

- (void)_abandonMerge
{
  void *v3;
  NSObject *v4;
  void *v5;
  NSObject *v6;
  id v7;
  id v8;
  int v9;
  void *v10;
  __int16 v11;
  void *v12;
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  -[COMeshAddOn meshController](self, "meshController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "dispatchQueue");
  v4 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v4);

  -[COMeshTimerAddOn mergeRequest](self, "mergeRequest");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  COCoreLogForCategory(3);
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v9 = 134218240;
    v10 = v3;
    v11 = 2048;
    v12 = v5;
    _os_log_impl(&dword_215E92000, v6, OS_LOG_TYPE_DEFAULT, "%p abandoning merge %p", (uint8_t *)&v9, 0x16u);
  }

  -[COMeshTimerAddOn setMergeRequest:](self, "setMergeRequest:", 0);
  v7 = objc_alloc_init(MEMORY[0x24BDBCE70]);
  -[COMeshTimerAddOn setMergeResponses:](self, "setMergeResponses:", v7);

  v8 = objc_alloc_init(MEMORY[0x24BDBCE30]);
  -[COMeshTimerAddOn setMergingNodes:](self, "setMergingNodes:", v8);

  -[COMeshTimerAddOn _processQueuedCommands](self, "_processQueuedCommands");
}

- (id)_commandsForReconciling:(id)a3 toTruth:(id)a4 forNode:(id)a5
{
  id v7;
  id v8;
  id v9;
  void *v10;
  COTimersRemovedNotification *v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  uint64_t i;
  void *v17;
  COTimersRemovedNotification *v18;
  void *v19;
  void *v20;
  void *v21;
  uint64_t v22;
  uint64_t v23;
  void *v24;
  COTimersUpdatedNotification *v25;
  NSObject *v26;
  void *v27;
  COTimersRemovedNotification *v28;
  NSObject *v29;
  uint64_t v30;
  COTimersAddedNotification *v31;
  void *v32;
  COTimersAddedNotification *v33;
  NSObject *v34;
  uint64_t v35;
  id v36;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  id v45;
  void *v46;
  id v47;
  void *v48;
  void *v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  uint8_t buf[4];
  void *v55;
  __int16 v56;
  id v57;
  __int16 v58;
  void *v59;
  _BYTE v60[128];
  uint64_t v61;

  v61 = *MEMORY[0x24BDAC8D0];
  v7 = a3;
  v8 = a4;
  v9 = a5;
  objc_msgSend(MEMORY[0x24BDBCE30], "array");
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (void *)objc_msgSend(v8, "mutableCopy");
  v50 = 0u;
  v51 = 0u;
  v52 = 0u;
  v53 = 0u;
  v11 = (COTimersRemovedNotification *)v7;
  v12 = -[COTimersRemovedNotification countByEnumeratingWithState:objects:count:](v11, "countByEnumeratingWithState:objects:count:", &v50, v60, 16);
  v47 = v8;
  if (!v12)
  {
    v14 = 0;
    v48 = 0;
    v28 = v11;
    v27 = v46;
LABEL_30:

    goto LABEL_31;
  }
  v13 = v12;
  v48 = 0;
  v49 = v10;
  v45 = v9;
  v14 = 0;
  v15 = *(_QWORD *)v51;
  do
  {
    for (i = 0; i != v13; ++i)
    {
      if (*(_QWORD *)v51 != v15)
        objc_enumerationMutation(v11);
      v17 = *(void **)(*((_QWORD *)&v50 + 1) + 8 * i);
      if ((objc_msgSend(v17, "isCurrentTimer") & 1) == 0)
      {
        v18 = v11;
        objc_msgSend(v17, "timerID");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "objectForKey:", v19);
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        if (v20)
        {
          objc_msgSend(v17, "co_preferredTimer:", v20);
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          if (v17 != v21 && (objc_msgSend(v17, "isEqualIgnoringLastModifiedDate:", v21) & 1) == 0)
          {
            if (v48)
            {
              objc_msgSend(v48, "arrayByAddingObject:", v21);
              v22 = objc_claimAutoreleasedReturnValue();

              v48 = (void *)v22;
              v8 = v47;
            }
            else
            {
              objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObject:", v21);
              v48 = (void *)objc_claimAutoreleasedReturnValue();
            }
          }

        }
        else if (v14)
        {
          objc_msgSend(v14, "arrayByAddingObject:", v17);
          v23 = objc_claimAutoreleasedReturnValue();

          v14 = (void *)v23;
        }
        else
        {
          objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObject:", v17);
          v14 = (void *)objc_claimAutoreleasedReturnValue();
        }
        objc_msgSend(v17, "timerID");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v49, "removeObjectForKey:", v24);

        v11 = v18;
      }
    }
    v13 = -[COTimersRemovedNotification countByEnumeratingWithState:objects:count:](v11, "countByEnumeratingWithState:objects:count:", &v50, v60, 16);
  }
  while (v13);

  if (v48)
  {
    v25 = -[COTimerNotification initWithTimers:]([COTimersUpdatedNotification alloc], "initWithTimers:", v48);
    COCoreLogForCategory(3);
    v26 = objc_claimAutoreleasedReturnValue();
    v9 = v45;
    if (os_log_type_enabled(v26, OS_LOG_TYPE_DEBUG))
    {
      -[COMeshAddOn meshController](self, "meshController");
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      -[COTimerNotification timers](v25, "timers");
      v41 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 134218498;
      v55 = v40;
      v56 = 2112;
      v57 = v45;
      v58 = 2112;
      v59 = v41;
      _os_log_debug_impl(&dword_215E92000, v26, OS_LOG_TYPE_DEBUG, "%p %@ updating %@", buf, 0x20u);

      v8 = v47;
    }

    objc_msgSend(v46, "arrayByAddingObject:", v25);
    v27 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v9 = v45;
    v27 = v46;
  }
  v10 = v49;
  if (v14)
  {
    v28 = -[COTimerNotification initWithTimers:]([COTimersRemovedNotification alloc], "initWithTimers:", v14);
    COCoreLogForCategory(3);
    v29 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v29, OS_LOG_TYPE_DEBUG))
    {
      -[COMeshAddOn meshController](self, "meshController");
      v42 = (void *)objc_claimAutoreleasedReturnValue();
      -[COTimerNotification timers](v28, "timers");
      v43 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 134218498;
      v55 = v42;
      v56 = 2112;
      v57 = v9;
      v58 = 2112;
      v59 = v43;
      _os_log_debug_impl(&dword_215E92000, v29, OS_LOG_TYPE_DEBUG, "%p %@ removing %@", buf, 0x20u);

      v8 = v47;
    }

    objc_msgSend(v27, "arrayByAddingObject:", v28);
    v30 = objc_claimAutoreleasedReturnValue();

    v27 = (void *)v30;
    goto LABEL_30;
  }
LABEL_31:
  if (objc_msgSend(v10, "count"))
  {
    v31 = [COTimersAddedNotification alloc];
    objc_msgSend(v10, "allValues");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    v33 = -[COTimerNotification initWithTimers:](v31, "initWithTimers:", v32);

    COCoreLogForCategory(3);
    v34 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v34, OS_LOG_TYPE_DEBUG))
    {
      -[COMeshAddOn meshController](self, "meshController");
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      -[COTimerNotification timers](v33, "timers");
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 134218498;
      v55 = v38;
      v56 = 2112;
      v57 = v9;
      v58 = 2112;
      v59 = v39;
      _os_log_debug_impl(&dword_215E92000, v34, OS_LOG_TYPE_DEBUG, "%p %@ requires %@", buf, 0x20u);

      v8 = v47;
    }

    objc_msgSend(v27, "arrayByAddingObject:", v33);
    v35 = objc_claimAutoreleasedReturnValue();

    v27 = (void *)v35;
  }
  v36 = v27;

  return v36;
}

- (void)_finishMerge:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _BOOL4 v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  void *v14;
  void *v15;
  id v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t j;
  void *v22;
  void *v23;
  uint64_t v24;
  void *v25;
  void *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t k;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t m;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  uint64_t v45;
  NSObject *v46;
  id v47;
  NSObject *v48;
  void *v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t n;
  uint64_t v54;
  _QWORD *v55;
  void *v56;
  COMeshTimerAddOn *v57;
  uint64_t v58;
  void *v59;
  void *v60;
  NSObject *v61;
  NSObject *v62;
  void *v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t ii;
  uint64_t v68;
  void *v69;
  id v70;
  id v71;
  void *v72;
  NSObject *v73;
  NSObject *v74;
  id v75;
  void *v76;
  uint64_t v77;
  void *v78;
  uint64_t v79;
  uint64_t v80;
  NSObject *log;
  id v82;
  id v83;
  id obj;
  NSObject *obja;
  uint64_t v86;
  void *v87;
  void *v88;
  uint64_t v89;
  COMeshTimerAddOn *v90;
  void *v91;
  id v92;
  void *v93;
  _QWORD v94[7];
  __int128 v95;
  __int128 v96;
  __int128 v97;
  __int128 v98;
  __int128 v99;
  __int128 v100;
  __int128 v101;
  __int128 v102;
  _QWORD v103[6];
  _QWORD v104[6];
  _QWORD v105[6];
  __int128 v106;
  __int128 v107;
  __int128 v108;
  __int128 v109;
  _QWORD v110[4];
  id v111;
  __int128 v112;
  __int128 v113;
  __int128 v114;
  __int128 v115;
  __int128 v116;
  __int128 v117;
  __int128 v118;
  __int128 v119;
  __int128 v120;
  __int128 v121;
  __int128 v122;
  __int128 v123;
  __int128 v124;
  __int128 v125;
  __int128 v126;
  __int128 v127;
  __int128 v128;
  __int128 v129;
  __int128 v130;
  __int128 v131;
  _BYTE v132[128];
  _BYTE v133[128];
  _BYTE v134[128];
  _BYTE v135[128];
  _BYTE v136[128];
  _BYTE v137[128];
  _BYTE v138[128];
  uint8_t v139[128];
  uint8_t buf[4];
  void *v141;
  __int16 v142;
  id v143;
  uint64_t v144;

  v144 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  -[COMeshAddOn meshController](self, "meshController");
  v76 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v76, "dispatchQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v5);
  -[COMeshTimerAddOn mergeRequest](self, "mergeRequest");
  v6 = (id)objc_claimAutoreleasedReturnValue();

  COCoreLogForCategory(3);
  log = objc_claimAutoreleasedReturnValue();
  v7 = os_log_type_enabled(log, OS_LOG_TYPE_DEFAULT);
  if (v6 != v4)
  {
    if (v7)
    {
      *(_DWORD *)buf = 134218240;
      v141 = v76;
      v142 = 2048;
      v143 = v4;
      _os_log_impl(&dword_215E92000, log, OS_LOG_TYPE_DEFAULT, "%p ignoring conclusion of merge %p", buf, 0x16u);
    }
    goto LABEL_92;
  }
  v74 = v5;
  if (v7)
  {
    *(_DWORD *)buf = 134218240;
    v141 = v76;
    v142 = 2048;
    v143 = v4;
    _os_log_impl(&dword_215E92000, log, OS_LOG_TYPE_DEFAULT, "%p completing merge %p...", buf, 0x16u);
  }
  v75 = v4;

  -[COMeshTimerAddOn mergeTimers](self, "mergeTimers");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v90 = self;
  -[COMeshTimerAddOn mergeResponses](self, "mergeResponses");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v92 = objc_alloc_init(MEMORY[0x24BDBCED8]);
  v128 = 0u;
  v129 = 0u;
  v130 = 0u;
  v131 = 0u;
  log = v8;
  v10 = -[NSObject countByEnumeratingWithState:objects:count:](log, "countByEnumeratingWithState:objects:count:", &v128, v139, 16);
  if (v10)
  {
    v11 = v10;
    v12 = *(_QWORD *)v129;
    do
    {
      for (i = 0; i != v11; ++i)
      {
        if (*(_QWORD *)v129 != v12)
          objc_enumerationMutation(log);
        v14 = *(void **)(*((_QWORD *)&v128 + 1) + 8 * i);
        if ((objc_msgSend(v14, "isCurrentTimer", v74) & 1) == 0)
        {
          objc_msgSend(v14, "timerID");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v92, "setObject:forKey:", v14, v15);

        }
      }
      v11 = -[NSObject countByEnumeratingWithState:objects:count:](log, "countByEnumeratingWithState:objects:count:", &v128, v139, 16);
    }
    while (v11);
  }

  v16 = objc_alloc_init(MEMORY[0x24BDBCED8]);
  v124 = 0u;
  v125 = 0u;
  v126 = 0u;
  v127 = 0u;
  -[COMeshTimerAddOn deletes](self, "deletes");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v124, v138, 16);
  if (v18)
  {
    v19 = v18;
    v20 = *(_QWORD *)v125;
    do
    {
      for (j = 0; j != v19; ++j)
      {
        if (*(_QWORD *)v125 != v20)
          objc_enumerationMutation(v17);
        v22 = *(void **)(*((_QWORD *)&v124 + 1) + 8 * j);
        objc_msgSend(v22, "identifier", v74);
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "setObject:forKey:", v22, v23);

      }
      v19 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v124, v138, 16);
    }
    while (v19);
  }

  v122 = 0u;
  v123 = 0u;
  v120 = 0u;
  v121 = 0u;
  obj = v9;
  v91 = v16;
  v82 = (id)objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v120, v137, 16);
  if (v82)
  {
    v79 = *(_QWORD *)v121;
    do
    {
      v24 = 0;
      do
      {
        if (*(_QWORD *)v121 != v79)
          objc_enumerationMutation(obj);
        v86 = v24;
        objc_msgSend(obj, "objectForKey:", *(_QWORD *)(*((_QWORD *)&v120 + 1) + 8 * v24), v74);
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        v116 = 0u;
        v117 = 0u;
        v118 = 0u;
        v119 = 0u;
        v88 = v25;
        objc_msgSend(v25, "timers");
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        v27 = objc_msgSend(v26, "countByEnumeratingWithState:objects:count:", &v116, v136, 16);
        if (v27)
        {
          v28 = v27;
          v29 = *(_QWORD *)v117;
          do
          {
            for (k = 0; k != v28; ++k)
            {
              if (*(_QWORD *)v117 != v29)
                objc_enumerationMutation(v26);
              v31 = *(void **)(*((_QWORD *)&v116 + 1) + 8 * k);
              if ((objc_msgSend(v31, "isCurrentTimer") & 1) == 0)
              {
                objc_msgSend(v31, "timerID");
                v32 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v92, "objectForKey:", v32);
                v33 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v31, "co_preferredTimer:", v33);
                v34 = (void *)objc_claimAutoreleasedReturnValue();

                if (v31 == v34)
                  objc_msgSend(v92, "setObject:forKey:", v31, v32);

              }
            }
            v28 = objc_msgSend(v26, "countByEnumeratingWithState:objects:count:", &v116, v136, 16);
          }
          while (v28);
        }

        v114 = 0u;
        v115 = 0u;
        v112 = 0u;
        v113 = 0u;
        objc_msgSend(v88, "deletes");
        v35 = (void *)objc_claimAutoreleasedReturnValue();
        v36 = objc_msgSend(v35, "countByEnumeratingWithState:objects:count:", &v112, v135, 16);
        if (v36)
        {
          v37 = v36;
          v38 = *(_QWORD *)v113;
          do
          {
            for (m = 0; m != v37; ++m)
            {
              if (*(_QWORD *)v113 != v38)
                objc_enumerationMutation(v35);
              v40 = *(void **)(*((_QWORD *)&v112 + 1) + 8 * m);
              objc_msgSend(v40, "identifier");
              v41 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v16, "objectForKey:", v41);
              v42 = (void *)objc_claimAutoreleasedReturnValue();
              if (!v42)
                goto LABEL_45;
              objc_msgSend(v40, "date");
              v43 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v42, "date");
              v44 = (void *)objc_claimAutoreleasedReturnValue();
              v45 = objc_msgSend(v43, "compare:", v44);

              v16 = v91;
              if (v45 == -1)
LABEL_45:
                objc_msgSend(v16, "setObject:forKey:", v40, v41);

            }
            v37 = objc_msgSend(v35, "countByEnumeratingWithState:objects:count:", &v112, v135, 16);
          }
          while (v37);
        }

        v24 = v86 + 1;
      }
      while ((id)(v86 + 1) != v82);
      v82 = (id)objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v120, v137, 16);
    }
    while (v82);
  }

  COCoreLogForCategory(3);
  v46 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v46, OS_LOG_TYPE_DEBUG))
    -[COMeshTimerAddOn _finishMerge:].cold.2();

  v110[0] = MEMORY[0x24BDAC760];
  v110[1] = 3221225472;
  v110[2] = __33__COMeshTimerAddOn__finishMerge___block_invoke;
  v110[3] = &unk_24D4B2200;
  v47 = v92;
  v111 = v47;
  objc_msgSend(v16, "enumerateKeysAndObjectsUsingBlock:", v110);
  COCoreLogForCategory(3);
  v48 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v48, OS_LOG_TYPE_DEBUG))
    -[COMeshTimerAddOn _finishMerge:].cold.1();

  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v93 = (void *)objc_claimAutoreleasedReturnValue();
  v106 = 0u;
  v107 = 0u;
  v108 = 0u;
  v109 = 0u;
  v78 = v47;
  -[COMeshTimerAddOn _commandsForReconciling:toTruth:forNode:](v90, "_commandsForReconciling:toTruth:forNode:", log, v47, 0);
  v49 = (void *)objc_claimAutoreleasedReturnValue();
  v50 = objc_msgSend(v49, "countByEnumeratingWithState:objects:count:", &v106, v134, 16);
  if (v50)
  {
    v51 = v50;
    v52 = *(_QWORD *)v107;
    do
    {
      for (n = 0; n != v51; ++n)
      {
        if (*(_QWORD *)v107 != v52)
          objc_enumerationMutation(v49);
        v54 = *(_QWORD *)(*((_QWORD *)&v106 + 1) + 8 * n);
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          v105[0] = MEMORY[0x24BDAC760];
          v105[1] = 3221225472;
          v55 = v105;
          v105[2] = __33__COMeshTimerAddOn__finishMerge___block_invoke_129;
        }
        else
        {
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
          {
            v104[0] = MEMORY[0x24BDAC760];
            v104[1] = 3221225472;
            v55 = v104;
            v104[2] = __33__COMeshTimerAddOn__finishMerge___block_invoke_2;
          }
          else
          {
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) == 0)
              continue;
            v103[0] = MEMORY[0x24BDAC760];
            v103[1] = 3221225472;
            v55 = v103;
            v103[2] = __33__COMeshTimerAddOn__finishMerge___block_invoke_3;
          }
        }
        v55[3] = &unk_24D4B0858;
        v55[4] = v90;
        v55[5] = v54;
        v56 = (void *)MEMORY[0x2199F3D40]();
        objc_msgSend(v93, "addObject:", v56);

      }
      v51 = objc_msgSend(v49, "countByEnumeratingWithState:objects:count:", &v106, v134, 16);
    }
    while (v51);
  }

  v101 = 0u;
  v102 = 0u;
  v100 = 0u;
  v99 = 0u;
  v83 = obj;
  v57 = v90;
  v80 = objc_msgSend(v83, "countByEnumeratingWithState:objects:count:", &v99, v133, 16);
  if (v80)
  {
    v77 = *(_QWORD *)v100;
    do
    {
      v58 = 0;
      do
      {
        if (*(_QWORD *)v100 != v77)
          objc_enumerationMutation(v83);
        v59 = *(void **)(*((_QWORD *)&v99 + 1) + 8 * v58);
        objc_msgSend(v83, "objectForKey:", v59, v74);
        v60 = (void *)objc_claimAutoreleasedReturnValue();
        v87 = v60;
        v89 = v58;
        if (objc_msgSend(v60, "notModified"))
        {
          v61 = log;
          COCoreLogForCategory(3);
          v62 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v62, OS_LOG_TYPE_DEBUG))
          {
            *(_DWORD *)buf = 134218242;
            v141 = v76;
            v142 = 2112;
            v143 = v59;
            _os_log_debug_impl(&dword_215E92000, v62, OS_LOG_TYPE_DEBUG, "%p response is not-modified for %@", buf, 0x16u);
          }

        }
        else
        {
          objc_msgSend(v60, "timers");
          v61 = objc_claimAutoreleasedReturnValue();
        }
        v97 = 0u;
        v98 = 0u;
        v95 = 0u;
        v96 = 0u;
        obja = v61;
        -[COMeshTimerAddOn _commandsForReconciling:toTruth:forNode:](v57, "_commandsForReconciling:toTruth:forNode:", v61, v78, v59);
        v63 = (void *)objc_claimAutoreleasedReturnValue();
        v64 = objc_msgSend(v63, "countByEnumeratingWithState:objects:count:", &v95, v132, 16);
        if (v64)
        {
          v65 = v64;
          v66 = *(_QWORD *)v96;
          do
          {
            for (ii = 0; ii != v65; ++ii)
            {
              if (*(_QWORD *)v96 != v66)
                objc_enumerationMutation(v63);
              v68 = *(_QWORD *)(*((_QWORD *)&v95 + 1) + 8 * ii);
              objc_opt_class();
              if ((objc_opt_isKindOfClass() & 1) != 0)
              {
                v94[0] = MEMORY[0x24BDAC760];
                v94[1] = 3221225472;
                v94[2] = __33__COMeshTimerAddOn__finishMerge___block_invoke_131;
                v94[3] = &unk_24D4B08D0;
                v94[4] = v57;
                v94[5] = v68;
                v94[6] = v59;
                v69 = (void *)MEMORY[0x2199F3D40](v94);
                objc_msgSend(v93, "addObject:", v69);

                v57 = v90;
              }
            }
            v65 = objc_msgSend(v63, "countByEnumeratingWithState:objects:count:", &v95, v132, 16);
          }
          while (v65);
        }

        v58 = v89 + 1;
      }
      while (v89 + 1 != v80);
      v80 = objc_msgSend(v83, "countByEnumeratingWithState:objects:count:", &v99, v133, 16);
    }
    while (v80);
  }

  -[COMeshTimerAddOn setMergeRequest:](v57, "setMergeRequest:", 0);
  -[COMeshTimerAddOn setMergeTimers:](v57, "setMergeTimers:", 0);
  v70 = objc_alloc_init(MEMORY[0x24BDBCE70]);
  -[COMeshTimerAddOn setMergeResponses:](v57, "setMergeResponses:", v70);

  v71 = objc_alloc_init(MEMORY[0x24BDBCE30]);
  -[COMeshTimerAddOn setMergingNodes:](v57, "setMergingNodes:", v71);

  -[COMeshTimerAddOn queuedCommands](v57, "queuedCommands");
  v72 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v93, "addObjectsFromArray:", v72);

  -[COMeshTimerAddOn setQueuedCommands:](v57, "setQueuedCommands:", v93);
  COCoreLogForCategory(3);
  v73 = objc_claimAutoreleasedReturnValue();
  v4 = v75;
  if (os_log_type_enabled(v73, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134218240;
    v141 = v76;
    v142 = 2048;
    v143 = v75;
    _os_log_impl(&dword_215E92000, v73, OS_LOG_TYPE_DEFAULT, "%p concluded merge %p", buf, 0x16u);
  }

  -[COMeshTimerAddOn _processQueuedCommands](v57, "_processQueuedCommands");
  v5 = v74;
LABEL_92:

}

void __33__COMeshTimerAddOn__finishMerge___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  id v4;

  v4 = a2;
  objc_msgSend(*(id *)(a1 + 32), "objectForKey:");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
    objc_msgSend(*(id *)(a1 + 32), "removeObjectForKey:", v4);

}

uint64_t __33__COMeshTimerAddOn__finishMerge___block_invoke_129(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "handleTimersUpdatedNotification:", *(_QWORD *)(a1 + 40));
}

uint64_t __33__COMeshTimerAddOn__finishMerge___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "handleTimersAddedNotification:", *(_QWORD *)(a1 + 40));
}

uint64_t __33__COMeshTimerAddOn__finishMerge___block_invoke_3(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "handleTimersRemovedNotification:", *(_QWORD *)(a1 + 40));
}

void __33__COMeshTimerAddOn__finishMerge___block_invoke_131(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "meshController");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "sendCommand:toPeer:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));

}

- (void)_reloadIndexWithCompletion:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  id v8;
  id v9;
  id v10;
  id v11;
  _QWORD v12[4];
  id v13;
  id v14;
  _QWORD v15[4];
  id v16;
  id v17;
  id location;

  v4 = a3;
  -[COMeshTimerAddOn observedTimerManager](self, "observedTimerManager");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "timers");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_initWeak(&location, self);
  v7 = MEMORY[0x24BDAC760];
  v15[0] = MEMORY[0x24BDAC760];
  v15[1] = 3221225472;
  v15[2] = __47__COMeshTimerAddOn__reloadIndexWithCompletion___block_invoke;
  v15[3] = &unk_24D4B0DD8;
  objc_copyWeak(&v17, &location);
  v8 = v4;
  v16 = v8;
  v9 = (id)objc_msgSend(v6, "addFailureBlock:", v15);
  v12[0] = v7;
  v12[1] = 3221225472;
  v12[2] = __47__COMeshTimerAddOn__reloadIndexWithCompletion___block_invoke_2;
  v12[3] = &unk_24D4B2228;
  objc_copyWeak(&v14, &location);
  v10 = v8;
  v13 = v10;
  v11 = (id)objc_msgSend(v6, "addSuccessBlock:", v12);

  objc_destroyWeak(&v14);
  objc_destroyWeak(&v17);
  objc_destroyWeak(&location);

}

void __47__COMeshTimerAddOn__reloadIndexWithCompletion___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id WeakRetained;
  NSObject *v5;
  NSObject *v6;
  _QWORD v7[5];
  id v8;

  v3 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    COCoreLogForCategory(3);
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      __47__COMeshTimerAddOn__reloadIndexWithCompletion___block_invoke_cold_1();

    objc_msgSend(WeakRetained, "meshControllerQueue");
    v6 = objc_claimAutoreleasedReturnValue();
    v7[0] = MEMORY[0x24BDAC760];
    v7[1] = 3221225472;
    v7[2] = __47__COMeshTimerAddOn__reloadIndexWithCompletion___block_invoke_132;
    v7[3] = &unk_24D4B1428;
    v7[4] = WeakRetained;
    v8 = *(id *)(a1 + 32);
    dispatch_async(v6, v7);

  }
}

uint64_t __47__COMeshTimerAddOn__reloadIndexWithCompletion___block_invoke_132(uint64_t a1)
{
  uint64_t result;

  objc_msgSend(*(id *)(a1 + 32), "setTimerIndex:", 0);
  result = *(_QWORD *)(a1 + 40);
  if (result)
    return (*(uint64_t (**)(uint64_t, uint64_t))(result + 16))(result, 1);
  return result;
}

void __47__COMeshTimerAddOn__reloadIndexWithCompletion___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  id WeakRetained;
  id v5;
  void *v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  void *v13;
  void *v14;
  NSObject *v15;
  id v16;
  id v17;
  _QWORD block[5];
  id v19;
  id v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  _BYTE v25[128];
  uint64_t v26;

  v26 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    v17 = v3;
    v5 = v3;
    objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = 0u;
    v22 = 0u;
    v23 = 0u;
    v24 = 0u;
    v7 = v5;
    v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
    if (v8)
    {
      v9 = v8;
      v10 = *(_QWORD *)v22;
      do
      {
        for (i = 0; i != v9; ++i)
        {
          if (*(_QWORD *)v22 != v10)
            objc_enumerationMutation(v7);
          v12 = *(void **)(*((_QWORD *)&v21 + 1) + 8 * i);
          if ((objc_msgSend(v12, "isCurrentTimer", v17) & 1) == 0)
          {
            objc_msgSend(v12, "timerID");
            v13 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v12, "lastModifiedDate");
            v14 = (void *)objc_claimAutoreleasedReturnValue();
            if (!v14)
            {
              objc_msgSend(MEMORY[0x24BDBCE60], "distantPast");
              v14 = (void *)objc_claimAutoreleasedReturnValue();
            }
            objc_msgSend(v6, "setObject:forKey:", v14, v13);

          }
        }
        v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
      }
      while (v9);
    }

    objc_msgSend(WeakRetained, "meshControllerQueue");
    v15 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __47__COMeshTimerAddOn__reloadIndexWithCompletion___block_invoke_3;
    block[3] = &unk_24D4B0D28;
    block[4] = WeakRetained;
    v19 = v6;
    v20 = *(id *)(a1 + 32);
    v16 = v6;
    dispatch_async(v15, block);

    v3 = v17;
  }

}

uint64_t __47__COMeshTimerAddOn__reloadIndexWithCompletion___block_invoke_3(uint64_t a1)
{
  void *v2;
  int v3;
  NSObject *v4;
  const char *v5;
  uint64_t v6;
  uint64_t result;
  int v8;
  uint64_t v9;
  __int16 v10;
  const char *v11;
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(*(id *)(a1 + 32), "timerIndex");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isEqualToDictionary:", *(_QWORD *)(a1 + 40));

  objc_msgSend(*(id *)(a1 + 32), "setTimerIndex:", *(_QWORD *)(a1 + 40));
  COCoreLogForCategory(3);
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v5 = "yes";
    v6 = *(_QWORD *)(a1 + 32);
    if (v3)
      v5 = "no";
    v8 = 134218242;
    v9 = v6;
    v10 = 2080;
    v11 = v5;
    _os_log_impl(&dword_215E92000, v4, OS_LOG_TYPE_DEFAULT, "%p timer index reloaded; updated: %s",
      (uint8_t *)&v8,
      0x16u);
  }

  result = *(_QWORD *)(a1 + 48);
  if (result)
    return (*(uint64_t (**)(uint64_t, _QWORD))(result + 16))(result, v3 ^ 1u);
  return result;
}

- (void)_processQueuedCommands
{
  void *v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _BYTE v13[128];
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  -[COMeshTimerAddOn queuedCommands](self, "queuedCommands");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[COMeshTimerAddOn setQueuedCommands:](self, "setQueuedCommands:", MEMORY[0x24BDBD1A8]);
  v11 = 0u;
  v12 = 0u;
  v9 = 0u;
  v10 = 0u;
  v4 = v3;
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v10;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v10 != v7)
          objc_enumerationMutation(v4);
        (*(void (**)(_QWORD))(*(_QWORD *)(*((_QWORD *)&v9 + 1) + 8 * v8) + 16))(*(_QWORD *)(*((_QWORD *)&v9 + 1) + 8 * v8));
        ++v8;
      }
      while (v6 != v8);
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
    }
    while (v6);
  }

}

- (void)_addTimerDeleteEvent:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  id v15;
  uint64_t v16;
  uint64_t v17;
  BOOL (*v18)(uint64_t, void *);
  void *v19;
  id v20;

  v4 = a3;
  -[COMeshTimerAddOn deletes](self, "deletes");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "arrayByAddingObject:", v4);
  v14 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BDBCE48], "currentCalendar");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBCE60], "now");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "dateByAddingUnit:value:toDate:options:", 16, -2, v7, 1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v16 = MEMORY[0x24BDAC760];
  v17 = 3221225472;
  v18 = __41__COMeshTimerAddOn__addTimerDeleteEvent___block_invoke;
  v19 = &unk_24D4B2250;
  v20 = v8;
  v9 = v8;
  objc_msgSend(v14, "indexesOfObjectsPassingTest:", &v16);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v10, "count"))
  {
    v11 = (void *)objc_msgSend(v14, "mutableCopy");
    objc_msgSend(v11, "removeObjectsAtIndexes:", v10);

    v12 = v11;
  }
  else
  {
    v12 = v14;
  }
  objc_msgSend(v12, "sortedArrayUsingSelector:", sel_compare_, v12, v16, v17, v18, v19);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[COMeshTimerAddOn setDeletes:](self, "setDeletes:", v13);

}

BOOL __41__COMeshTimerAddOn__addTimerDeleteEvent___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  _BOOL8 v4;

  objc_msgSend(a2, "date");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "compare:", *(_QWORD *)(a1 + 32)) == -1;

  return v4;
}

- (id)timers
{
  return -[COMeshTimerAddOn _timersForAccessoryIdentifier:allowLocalStorage:](self, "_timersForAccessoryIdentifier:allowLocalStorage:", 0, -[COMeshTimerAddOn performsLocalActions](self, "performsLocalActions"));
}

- (id)addTimer:(id)a3
{
  return -[COMeshTimerAddOn addTimer:client:member:](self, "addTimer:client:member:", a3, 0, 0);
}

- (id)addTimer:(id)a3 client:(id)a4 member:(id)a5
{
  id v8;
  id v9;
  id v10;
  COTimerCreateRequest *v11;
  void *v12;
  void *v13;
  NSObject *v14;
  _BOOL4 v15;
  void *v16;
  id v17;
  COMTTimerCreateAction *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  uint64_t v23;
  void *v24;
  void *v25;
  id v26;
  id v27;
  COMTTimerCreateAction *v28;
  id v29;
  uint64_t (*__ptr32 *v30)();
  uint64_t v31;
  char v32;
  void *v33;
  void *v34;
  void *v35;
  NSObject *v36;
  void *v37;
  void *v38;
  void *v39;
  id v40;
  void *v41;
  NSObject *v42;
  void (**v43)(_QWORD, _QWORD, _QWORD);
  void *v45;
  COTimerCreateRequest *v46;
  void *v47;
  _QWORD v48[4];
  char v49;
  _QWORD v50[4];
  id v51;
  COMTTimerCreateAction *v52;
  id v53;
  id v54;
  id v55;
  _QWORD block[5];
  COTimerCreateRequest *v57;
  id v58;
  id v59;
  uint8_t buf[4];
  void *v61;
  __int16 v62;
  void *v63;
  uint64_t v64;

  v64 = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = -[COTimerRequest initWithTimer:]([COTimerCreateRequest alloc], "initWithTimer:", v8);
  -[COMeshAddOn meshController](self, "meshController");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v47 = v9;
  if (-[COMeshTimerAddOn performsLocalActions](self, "performsLocalActions")
    && (objc_msgSend(v12, "leader"), v13 = (void *)objc_claimAutoreleasedReturnValue(), v13, !v13))
  {
    COCoreLogForCategory(3);
    v36 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v36, OS_LOG_TYPE_DEFAULT))
    {
      -[COMeshAddOn meshController](self, "meshController");
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "timerID");
      v38 = v12;
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 134218242;
      v61 = v37;
      v62 = 2112;
      v63 = v39;
      _os_log_impl(&dword_215E92000, v36, OS_LOG_TYPE_DEFAULT, "%p directly add a timer %@", buf, 0x16u);

      v12 = v38;
    }

    v40 = objc_alloc_init(MEMORY[0x24BE6B608]);
    objc_msgSend(v12, "dispatchQueue");
    v41 = v12;
    v42 = objc_claimAutoreleasedReturnValue();
    v31 = MEMORY[0x24BDAC760];
    block[0] = MEMORY[0x24BDAC760];
    v30 = &off_215F52000;
    block[1] = 3221225472;
    block[2] = __43__COMeshTimerAddOn_addTimer_client_member___block_invoke;
    block[3] = &unk_24D4B0E50;
    block[4] = self;
    v57 = v11;
    v26 = v40;
    v58 = v26;
    v59 = v41;
    dispatch_async(v42, block);

    v12 = v41;
    v32 = 1;
  }
  else
  {
    COCoreLogForCategory(3);
    v14 = objc_claimAutoreleasedReturnValue();
    v15 = os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT);
    if (v10)
    {
      v46 = v11;
      if (v15)
      {
        objc_msgSend(v8, "timerID");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 134218242;
        v61 = v12;
        v62 = 2112;
        v63 = v16;
        _os_log_impl(&dword_215E92000, v14, OS_LOG_TYPE_DEFAULT, "%p using secondary cluster to add %@", buf, 0x16u);

      }
      v45 = v12;

      v17 = objc_alloc_init(MEMORY[0x24BE6B608]);
      v18 = -[COMTTimerCreateAction initWithTimer:]([COMTTimerCreateAction alloc], "initWithTimer:", v8);
      objc_msgSend(v9, "clientLifetimeActivity");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      +[CONetworkActivityFactory activityWithLabel:parentActivity:](CONetworkActivityFactory, "activityWithLabel:parentActivity:", 4, v19);
      v20 = (void *)objc_claimAutoreleasedReturnValue();

      if (v20)
        nw_activity_activate();
      objc_msgSend(v9, "clientBundleIdentifier");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      if (!objc_msgSend(v21, "length"))
      {
        objc_msgSend(MEMORY[0x24BDD1488], "mainBundle");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v22, "bundleIdentifier");
        v23 = objc_claimAutoreleasedReturnValue();

        v21 = (void *)v23;
      }
      -[COMeshTimerAddOn actionDirector](self, "actionDirector");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BDBCF20], "setWithObject:", v10);
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      v50[0] = MEMORY[0x24BDAC760];
      v50[1] = 3221225472;
      v50[2] = __43__COMeshTimerAddOn_addTimer_client_member___block_invoke_141;
      v50[3] = &unk_24D4B0920;
      v51 = v20;
      v52 = v18;
      v53 = v21;
      v26 = v17;
      v54 = v26;
      v55 = v45;
      v27 = v21;
      v28 = v18;
      v29 = v20;
      objc_msgSend(v24, "requestAction:members:activity:withCompletion:", v28, v25, v29, v50);

      v12 = v45;
      v30 = &off_215F52000;
      v31 = MEMORY[0x24BDAC760];
      v32 = 0;
      v11 = v46;
    }
    else
    {
      if (v15)
      {
        -[COMeshAddOn meshController](self, "meshController");
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "timerID");
        v34 = v12;
        v35 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 134218242;
        v61 = v33;
        v62 = 2112;
        v63 = v35;
        _os_log_impl(&dword_215E92000, v14, OS_LOG_TYPE_DEFAULT, "%p requesting leader to add a timer %@", buf, 0x16u);

        v12 = v34;
      }

      -[COMeshTimerAddOn _sendRequest:client:](self, "_sendRequest:client:", v11, v9);
      v26 = (id)objc_claimAutoreleasedReturnValue();
      v32 = 0;
      v31 = MEMORY[0x24BDAC760];
      v30 = &off_215F52000;
    }
  }
  -[COMeshTimerAddOn recorder](self, "recorder");
  v43 = (void (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
  v48[0] = v31;
  v48[1] = *((_QWORD *)v30 + 448);
  v48[2] = __43__COMeshTimerAddOn_addTimer_client_member___block_invoke_142;
  v48[3] = &__block_descriptor_33_e19___NSDictionary_8__0l;
  v49 = v32;
  ((void (**)(_QWORD, const __CFString *, _QWORD *))v43)[2](v43, CFSTR("com.apple.CoordinationCore.MeshAction"), v48);

  return v26;
}

void __43__COMeshTimerAddOn_addTimer_client_member___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  _QWORD v4[4];
  id v5;
  id v6;

  v2 = *(void **)(a1 + 32);
  v3 = *(_QWORD *)(a1 + 40);
  v4[0] = MEMORY[0x24BDAC760];
  v4[1] = 3221225472;
  v4[2] = __43__COMeshTimerAddOn_addTimer_client_member___block_invoke_2;
  v4[3] = &unk_24D4B17C0;
  v5 = *(id *)(a1 + 48);
  v6 = *(id *)(a1 + 56);
  objc_msgSend(v2, "handleTimerCreateRequest:callback:", v3, v4);

}

void __43__COMeshTimerAddOn_addTimer_client_member___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;

  v5 = a2;
  v6 = a3;
  if (v6 || (objc_msgSend(v5, "error"), (v6 = (id)objc_claimAutoreleasedReturnValue()) != 0))
  {
    COCoreLogForCategory(3);
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      __43__COMeshTimerAddOn_addTimer_client_member___block_invoke_2_cold_1();

    objc_msgSend(*(id *)(a1 + 32), "finishWithError:", v6);
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "finishWithNoResult");
  }

}

void __43__COMeshTimerAddOn_addTimer_client_member___block_invoke_141(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  xpc_object_t v7;
  objc_class *v8;
  id v9;
  NSObject *v10;

  v5 = a2;
  v6 = a3;
  if (*(_QWORD *)(a1 + 32))
  {
    v7 = xpc_dictionary_create(0, 0, 0);
    if (v7)
    {
      v8 = (objc_class *)objc_opt_class();
      NSStringFromClass(v8);
      v9 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
      xpc_dictionary_set_string(v7, "command", (const char *)objc_msgSend(v9, "UTF8String"));

      xpc_dictionary_set_string(v7, "client", (const char *)objc_msgSend(objc_retainAutorelease(*(id *)(a1 + 48)), "UTF8String"));
      nw_activity_submit_metrics();
    }
    nw_activity_complete_with_reason();

  }
  if (v6)
  {
    COCoreLogForCategory(3);
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      __43__COMeshTimerAddOn_addTimer_client_member___block_invoke_141_cold_1();

    objc_msgSend(*(id *)(a1 + 56), "finishWithError:", v6);
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 56), "finishWithNoResult");
  }

}

id __43__COMeshTimerAddOn_addTimer_client_member___block_invoke_142(uint64_t a1)
{
  return COCoreAnalyticsCreateActionEvent(CFSTR("timer"), CFSTR("create"), *(unsigned __int8 *)(a1 + 32) == 0);
}

- (id)updateTimer:(id)a3
{
  return -[COMeshTimerAddOn updateTimer:client:member:](self, "updateTimer:client:member:", a3, 0, 0);
}

- (id)updateTimer:(id)a3 client:(id)a4 member:(id)a5
{
  id v8;
  id v9;
  id v10;
  COTimerUpdateRequest *v11;
  void *v12;
  void *v13;
  NSObject *v14;
  _BOOL4 v15;
  void *v16;
  id v17;
  COMTTimerUpdateAction *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  uint64_t v23;
  void *v24;
  void *v25;
  id v26;
  id v27;
  COMTTimerUpdateAction *v28;
  id v29;
  uint64_t (*__ptr32 *v30)();
  uint64_t v31;
  char v32;
  void *v33;
  void *v34;
  void *v35;
  NSObject *v36;
  void *v37;
  void *v38;
  void *v39;
  id v40;
  void *v41;
  NSObject *v42;
  void (**v43)(_QWORD, _QWORD, _QWORD);
  void *v45;
  COTimerUpdateRequest *v46;
  void *v47;
  _QWORD v48[4];
  char v49;
  _QWORD v50[4];
  id v51;
  COMTTimerUpdateAction *v52;
  id v53;
  id v54;
  id v55;
  _QWORD block[5];
  COTimerUpdateRequest *v57;
  id v58;
  id v59;
  uint8_t buf[4];
  void *v61;
  __int16 v62;
  void *v63;
  uint64_t v64;

  v64 = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = -[COTimerRequest initWithTimer:]([COTimerUpdateRequest alloc], "initWithTimer:", v8);
  -[COMeshAddOn meshController](self, "meshController");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v47 = v9;
  if (-[COMeshTimerAddOn performsLocalActions](self, "performsLocalActions")
    && (objc_msgSend(v12, "leader"), v13 = (void *)objc_claimAutoreleasedReturnValue(), v13, !v13))
  {
    COCoreLogForCategory(3);
    v36 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v36, OS_LOG_TYPE_DEFAULT))
    {
      -[COMeshAddOn meshController](self, "meshController");
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "timerID");
      v38 = v12;
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 134218242;
      v61 = v37;
      v62 = 2112;
      v63 = v39;
      _os_log_impl(&dword_215E92000, v36, OS_LOG_TYPE_DEFAULT, "%p directly update a timer %@", buf, 0x16u);

      v12 = v38;
    }

    v40 = objc_alloc_init(MEMORY[0x24BE6B608]);
    objc_msgSend(v12, "dispatchQueue");
    v41 = v12;
    v42 = objc_claimAutoreleasedReturnValue();
    v31 = MEMORY[0x24BDAC760];
    block[0] = MEMORY[0x24BDAC760];
    v30 = &off_215F52000;
    block[1] = 3221225472;
    block[2] = __46__COMeshTimerAddOn_updateTimer_client_member___block_invoke;
    block[3] = &unk_24D4B0E50;
    block[4] = self;
    v57 = v11;
    v26 = v40;
    v58 = v26;
    v59 = v41;
    dispatch_async(v42, block);

    v12 = v41;
    v32 = 1;
  }
  else
  {
    COCoreLogForCategory(3);
    v14 = objc_claimAutoreleasedReturnValue();
    v15 = os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT);
    if (v10)
    {
      v46 = v11;
      if (v15)
      {
        objc_msgSend(v8, "timerID");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 134218242;
        v61 = v12;
        v62 = 2112;
        v63 = v16;
        _os_log_impl(&dword_215E92000, v14, OS_LOG_TYPE_DEFAULT, "%p using secondary cluster to update %@", buf, 0x16u);

      }
      v45 = v12;

      v17 = objc_alloc_init(MEMORY[0x24BE6B608]);
      v18 = -[COMTTimerUpdateAction initWithTimer:]([COMTTimerUpdateAction alloc], "initWithTimer:", v8);
      objc_msgSend(v9, "clientLifetimeActivity");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      +[CONetworkActivityFactory activityWithLabel:parentActivity:](CONetworkActivityFactory, "activityWithLabel:parentActivity:", 4, v19);
      v20 = (void *)objc_claimAutoreleasedReturnValue();

      if (v20)
        nw_activity_activate();
      objc_msgSend(v9, "clientBundleIdentifier");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      if (!objc_msgSend(v21, "length"))
      {
        objc_msgSend(MEMORY[0x24BDD1488], "mainBundle");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v22, "bundleIdentifier");
        v23 = objc_claimAutoreleasedReturnValue();

        v21 = (void *)v23;
      }
      -[COMeshTimerAddOn actionDirector](self, "actionDirector");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BDBCF20], "setWithObject:", v10);
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      v50[0] = MEMORY[0x24BDAC760];
      v50[1] = 3221225472;
      v50[2] = __46__COMeshTimerAddOn_updateTimer_client_member___block_invoke_144;
      v50[3] = &unk_24D4B0920;
      v51 = v20;
      v52 = v18;
      v53 = v21;
      v26 = v17;
      v54 = v26;
      v55 = v45;
      v27 = v21;
      v28 = v18;
      v29 = v20;
      objc_msgSend(v24, "requestAction:members:activity:withCompletion:", v28, v25, v29, v50);

      v12 = v45;
      v30 = &off_215F52000;
      v31 = MEMORY[0x24BDAC760];
      v32 = 0;
      v11 = v46;
    }
    else
    {
      if (v15)
      {
        -[COMeshAddOn meshController](self, "meshController");
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "timerID");
        v34 = v12;
        v35 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 134218242;
        v61 = v33;
        v62 = 2112;
        v63 = v35;
        _os_log_impl(&dword_215E92000, v14, OS_LOG_TYPE_DEFAULT, "%p requesting leader to update a timer %@", buf, 0x16u);

        v12 = v34;
      }

      -[COMeshTimerAddOn _sendRequest:client:](self, "_sendRequest:client:", v11, v9);
      v26 = (id)objc_claimAutoreleasedReturnValue();
      v32 = 0;
      v31 = MEMORY[0x24BDAC760];
      v30 = &off_215F52000;
    }
  }
  -[COMeshTimerAddOn recorder](self, "recorder");
  v43 = (void (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
  v48[0] = v31;
  v48[1] = *((_QWORD *)v30 + 448);
  v48[2] = __46__COMeshTimerAddOn_updateTimer_client_member___block_invoke_145;
  v48[3] = &__block_descriptor_33_e19___NSDictionary_8__0l;
  v49 = v32;
  ((void (**)(_QWORD, const __CFString *, _QWORD *))v43)[2](v43, CFSTR("com.apple.CoordinationCore.MeshAction"), v48);

  return v26;
}

void __46__COMeshTimerAddOn_updateTimer_client_member___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  _QWORD v4[4];
  id v5;
  id v6;

  v2 = *(void **)(a1 + 32);
  v3 = *(_QWORD *)(a1 + 40);
  v4[0] = MEMORY[0x24BDAC760];
  v4[1] = 3221225472;
  v4[2] = __46__COMeshTimerAddOn_updateTimer_client_member___block_invoke_2;
  v4[3] = &unk_24D4B17C0;
  v5 = *(id *)(a1 + 48);
  v6 = *(id *)(a1 + 56);
  objc_msgSend(v2, "handleTimerUpdateRequest:callback:", v3, v4);

}

void __46__COMeshTimerAddOn_updateTimer_client_member___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;

  v5 = a2;
  v6 = a3;
  if (v6 || (objc_msgSend(v5, "error"), (v6 = (id)objc_claimAutoreleasedReturnValue()) != 0))
  {
    COCoreLogForCategory(3);
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      __46__COMeshTimerAddOn_updateTimer_client_member___block_invoke_2_cold_1();

    objc_msgSend(*(id *)(a1 + 32), "finishWithError:", v6);
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "finishWithNoResult");
  }

}

void __46__COMeshTimerAddOn_updateTimer_client_member___block_invoke_144(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  xpc_object_t v7;
  objc_class *v8;
  id v9;
  NSObject *v10;

  v5 = a2;
  v6 = a3;
  if (*(_QWORD *)(a1 + 32))
  {
    v7 = xpc_dictionary_create(0, 0, 0);
    if (v7)
    {
      v8 = (objc_class *)objc_opt_class();
      NSStringFromClass(v8);
      v9 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
      xpc_dictionary_set_string(v7, "command", (const char *)objc_msgSend(v9, "UTF8String"));

      xpc_dictionary_set_string(v7, "client", (const char *)objc_msgSend(objc_retainAutorelease(*(id *)(a1 + 48)), "UTF8String"));
      nw_activity_submit_metrics();
    }
    nw_activity_complete_with_reason();

  }
  if (v6)
  {
    COCoreLogForCategory(3);
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      __46__COMeshTimerAddOn_updateTimer_client_member___block_invoke_144_cold_1();

    objc_msgSend(*(id *)(a1 + 56), "finishWithError:", v6);
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 56), "finishWithNoResult");
  }

}

id __46__COMeshTimerAddOn_updateTimer_client_member___block_invoke_145(uint64_t a1)
{
  return COCoreAnalyticsCreateActionEvent(CFSTR("timer"), CFSTR("update"), *(unsigned __int8 *)(a1 + 32) == 0);
}

- (id)removeTimer:(id)a3
{
  return -[COMeshTimerAddOn removeTimer:client:member:](self, "removeTimer:client:member:", a3, 0, 0);
}

- (id)removeTimer:(id)a3 client:(id)a4 member:(id)a5
{
  id v8;
  id v9;
  id v10;
  COTimerDeleteRequest *v11;
  void *v12;
  void *v13;
  NSObject *v14;
  _BOOL4 v15;
  void *v16;
  id v17;
  objc_class *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  uint64_t v26;
  void *v27;
  void *v28;
  uint64_t (*__ptr32 *v29)();
  id v30;
  id v31;
  id v32;
  id v33;
  uint64_t v34;
  char v35;
  void *v36;
  void *v37;
  void *v38;
  NSObject *v39;
  void *v40;
  void *v41;
  void *v42;
  id v43;
  void *v44;
  NSObject *v45;
  void (**v46)(_QWORD, _QWORD, _QWORD);
  void *v48;
  void *v49;
  COTimerDeleteRequest *v50;
  void *v51;
  void *v52;
  _QWORD v53[4];
  char v54;
  _QWORD v55[4];
  id v56;
  id v57;
  id v58;
  id v59;
  id v60;
  _QWORD block[5];
  COTimerDeleteRequest *v62;
  id v63;
  id v64;
  uint8_t buf[4];
  void *v66;
  __int16 v67;
  void *v68;
  uint64_t v69;

  v69 = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = -[COTimerRequest initWithTimer:]([COTimerDeleteRequest alloc], "initWithTimer:", v8);
  -[COMeshAddOn meshController](self, "meshController");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v51 = v8;
  v52 = v9;
  if (-[COMeshTimerAddOn performsLocalActions](self, "performsLocalActions")
    && (objc_msgSend(v12, "leader"), v13 = (void *)objc_claimAutoreleasedReturnValue(), v13, !v13))
  {
    COCoreLogForCategory(3);
    v39 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v39, OS_LOG_TYPE_DEFAULT))
    {
      -[COMeshAddOn meshController](self, "meshController");
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "timerID");
      v41 = v12;
      v42 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 134218242;
      v66 = v40;
      v67 = 2112;
      v68 = v42;
      _os_log_impl(&dword_215E92000, v39, OS_LOG_TYPE_DEFAULT, "%p directly remove a timer %@", buf, 0x16u);

      v12 = v41;
    }

    v43 = objc_alloc_init(MEMORY[0x24BE6B608]);
    objc_msgSend(v12, "dispatchQueue");
    v44 = v12;
    v45 = objc_claimAutoreleasedReturnValue();
    v34 = MEMORY[0x24BDAC760];
    block[0] = MEMORY[0x24BDAC760];
    v29 = &off_215F52000;
    block[1] = 3221225472;
    block[2] = __46__COMeshTimerAddOn_removeTimer_client_member___block_invoke;
    block[3] = &unk_24D4B0E50;
    block[4] = self;
    v62 = v11;
    v30 = v43;
    v63 = v30;
    v64 = v44;
    dispatch_async(v45, block);

    v12 = v44;
    v35 = 1;
  }
  else
  {
    COCoreLogForCategory(3);
    v14 = objc_claimAutoreleasedReturnValue();
    v15 = os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT);
    if (v10)
    {
      v50 = v11;
      if (v15)
      {
        objc_msgSend(v8, "timerID");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 134218242;
        v66 = v12;
        v67 = 2112;
        v68 = v16;
        _os_log_impl(&dword_215E92000, v14, OS_LOG_TYPE_DEFAULT, "%p using secondary cluster to remove %@", buf, 0x16u);

      }
      v48 = v12;

      v17 = objc_alloc_init(MEMORY[0x24BE6B608]);
      v18 = (objc_class *)objc_opt_class();
      NSStringFromClass(v18);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "timerID");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      +[COMTDeleteAction actionWithTargetType:targetIdentifier:](COMTDeleteAction, "actionWithTargetType:targetIdentifier:", v19, v20);
      v21 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v9, "clientLifetimeActivity");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      +[CONetworkActivityFactory activityWithLabel:parentActivity:](CONetworkActivityFactory, "activityWithLabel:parentActivity:", 4, v22);
      v23 = (void *)objc_claimAutoreleasedReturnValue();

      if (v23)
        nw_activity_activate();
      objc_msgSend(v9, "clientBundleIdentifier", v48);
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      if (!objc_msgSend(v24, "length"))
      {
        objc_msgSend(MEMORY[0x24BDD1488], "mainBundle");
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v25, "bundleIdentifier");
        v26 = objc_claimAutoreleasedReturnValue();

        v24 = (void *)v26;
      }
      -[COMeshTimerAddOn actionDirector](self, "actionDirector");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BDBCF20], "setWithObject:", v10);
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      v55[0] = MEMORY[0x24BDAC760];
      v29 = &off_215F52000;
      v55[1] = 3221225472;
      v55[2] = __46__COMeshTimerAddOn_removeTimer_client_member___block_invoke_147;
      v55[3] = &unk_24D4B0920;
      v56 = v23;
      v57 = v21;
      v58 = v24;
      v30 = v17;
      v59 = v30;
      v60 = v49;
      v31 = v24;
      v32 = v21;
      v33 = v23;
      objc_msgSend(v27, "requestAction:members:activity:withCompletion:", v32, v28, v33, v55);

      v12 = v49;
      v34 = MEMORY[0x24BDAC760];
      v35 = 0;
      v11 = v50;
    }
    else
    {
      if (v15)
      {
        -[COMeshAddOn meshController](self, "meshController");
        v36 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "timerID");
        v37 = v12;
        v38 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 134218242;
        v66 = v36;
        v67 = 2112;
        v68 = v38;
        _os_log_impl(&dword_215E92000, v14, OS_LOG_TYPE_DEFAULT, "%p requesting leader to remove a timer %@", buf, 0x16u);

        v12 = v37;
      }

      -[COMeshTimerAddOn _sendRequest:client:](self, "_sendRequest:client:", v11, v9);
      v30 = (id)objc_claimAutoreleasedReturnValue();
      v35 = 0;
      v34 = MEMORY[0x24BDAC760];
      v29 = &off_215F52000;
    }
  }
  -[COMeshTimerAddOn recorder](self, "recorder");
  v46 = (void (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
  v53[0] = v34;
  v53[1] = *((_QWORD *)v29 + 448);
  v53[2] = __46__COMeshTimerAddOn_removeTimer_client_member___block_invoke_148;
  v53[3] = &__block_descriptor_33_e19___NSDictionary_8__0l;
  v54 = v35;
  ((void (**)(_QWORD, const __CFString *, _QWORD *))v46)[2](v46, CFSTR("com.apple.CoordinationCore.MeshAction"), v53);

  return v30;
}

void __46__COMeshTimerAddOn_removeTimer_client_member___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  _QWORD v4[4];
  id v5;
  id v6;

  v2 = *(void **)(a1 + 32);
  v3 = *(_QWORD *)(a1 + 40);
  v4[0] = MEMORY[0x24BDAC760];
  v4[1] = 3221225472;
  v4[2] = __46__COMeshTimerAddOn_removeTimer_client_member___block_invoke_2;
  v4[3] = &unk_24D4B17C0;
  v5 = *(id *)(a1 + 48);
  v6 = *(id *)(a1 + 56);
  objc_msgSend(v2, "handleTimerDeleteRequest:callback:", v3, v4);

}

void __46__COMeshTimerAddOn_removeTimer_client_member___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;

  v5 = a2;
  v6 = a3;
  if (v6 || (objc_msgSend(v5, "error"), (v6 = (id)objc_claimAutoreleasedReturnValue()) != 0))
  {
    COCoreLogForCategory(3);
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      __46__COMeshTimerAddOn_removeTimer_client_member___block_invoke_2_cold_1();

    objc_msgSend(*(id *)(a1 + 32), "finishWithError:", v6);
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "finishWithNoResult");
  }

}

void __46__COMeshTimerAddOn_removeTimer_client_member___block_invoke_147(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  xpc_object_t v7;
  objc_class *v8;
  id v9;
  NSObject *v10;

  v5 = a2;
  v6 = a3;
  if (*(_QWORD *)(a1 + 32))
  {
    v7 = xpc_dictionary_create(0, 0, 0);
    if (v7)
    {
      v8 = (objc_class *)objc_opt_class();
      NSStringFromClass(v8);
      v9 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
      xpc_dictionary_set_string(v7, "command", (const char *)objc_msgSend(v9, "UTF8String"));

      xpc_dictionary_set_string(v7, "client", (const char *)objc_msgSend(objc_retainAutorelease(*(id *)(a1 + 48)), "UTF8String"));
      nw_activity_submit_metrics();
    }
    nw_activity_complete_with_reason();

  }
  if (v6)
  {
    COCoreLogForCategory(3);
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      __46__COMeshTimerAddOn_removeTimer_client_member___block_invoke_147_cold_1();

    objc_msgSend(*(id *)(a1 + 56), "finishWithError:", v6);
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 56), "finishWithNoResult");
  }

}

id __46__COMeshTimerAddOn_removeTimer_client_member___block_invoke_148(uint64_t a1)
{
  return COCoreAnalyticsCreateActionEvent(CFSTR("timer"), CFSTR("delete"), *(unsigned __int8 *)(a1 + 32) == 0);
}

- (id)dismissTimerWithIdentifier:(id)a3
{
  return -[COMeshTimerAddOn dismissTimerWithIdentifier:client:](self, "dismissTimerWithIdentifier:client:", a3, 0);
}

- (id)dismissTimerWithIdentifier:(id)a3 client:(id)a4
{
  id v6;
  id v7;
  COTimerDismissRequest *v8;
  void *v9;
  _BOOL4 v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  id *v16;
  id v17;
  id v18;
  NSObject *v19;
  void *v20;
  id v21;
  char v22;
  void (**v23)(_QWORD, _QWORD, _QWORD);
  NSObject *v25;
  void *v26;
  id v27;
  NSObject *v28;
  _QWORD v29[4];
  char v30;
  _QWORD v31[5];
  id v32;
  _QWORD block[5];
  COTimerDismissRequest *v34;
  id v35;
  id v36;
  uint8_t buf[4];
  void *v38;
  __int16 v39;
  id v40;
  uint64_t v41;

  v41 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  v8 = -[COTimerDismissRequest initWithTimerIdentifier:]([COTimerDismissRequest alloc], "initWithTimerIdentifier:", v6);
  -[COMeshAddOn meshController](self, "meshController");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = -[COMeshTimerAddOn performsLocalActions](self, "performsLocalActions");
  v11 = MEMORY[0x24BDAC760];
  if (v10 && (objc_msgSend(v9, "leader"), v12 = (void *)objc_claimAutoreleasedReturnValue(), v12, !v12))
  {
    COCoreLogForCategory(3);
    v25 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
    {
      -[COMeshAddOn meshController](self, "meshController");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 134218242;
      v38 = v26;
      v39 = 2112;
      v40 = v6;
      _os_log_impl(&dword_215E92000, v25, OS_LOG_TYPE_DEFAULT, "%p directly dismiss a timer %@", buf, 0x16u);

    }
    v27 = objc_alloc_init(MEMORY[0x24BE6B608]);
    objc_msgSend(v9, "dispatchQueue");
    v28 = objc_claimAutoreleasedReturnValue();
    v15 = v11;
    block[0] = v11;
    block[1] = 3221225472;
    block[2] = __54__COMeshTimerAddOn_dismissTimerWithIdentifier_client___block_invoke;
    block[3] = &unk_24D4B0E50;
    block[4] = self;
    v16 = (id *)&v34;
    v34 = v8;
    v21 = v27;
    v35 = v21;
    v36 = v9;
    dispatch_async(v28, block);

    v22 = 1;
  }
  else
  {
    -[COMeshTimerAddOn timerManager](self, "timerManager");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "dismissTimerWithIdentifier:", v6);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = v11;
    v31[0] = v11;
    v31[1] = 3221225472;
    v31[2] = __54__COMeshTimerAddOn_dismissTimerWithIdentifier_client___block_invoke_149;
    v31[3] = &unk_24D4B2298;
    v31[4] = self;
    v16 = &v32;
    v17 = v6;
    v32 = v17;
    v18 = (id)objc_msgSend(v14, "addCompletionBlock:", v31);

    COCoreLogForCategory(3);
    v19 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
    {
      -[COMeshAddOn meshController](self, "meshController");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 134218242;
      v38 = v20;
      v39 = 2112;
      v40 = v17;
      _os_log_impl(&dword_215E92000, v19, OS_LOG_TYPE_DEFAULT, "%p requesting leader to dismiss a timer %@", buf, 0x16u);

    }
    -[COMeshTimerAddOn _sendRequest:client:](self, "_sendRequest:client:", v8, v7);
    v21 = (id)objc_claimAutoreleasedReturnValue();
    v22 = 0;
  }

  -[COMeshTimerAddOn recorder](self, "recorder");
  v23 = (void (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
  v29[0] = v15;
  v29[1] = 3221225472;
  v29[2] = __54__COMeshTimerAddOn_dismissTimerWithIdentifier_client___block_invoke_151;
  v29[3] = &__block_descriptor_33_e19___NSDictionary_8__0l;
  v30 = v22;
  ((void (**)(_QWORD, const __CFString *, _QWORD *))v23)[2](v23, CFSTR("com.apple.CoordinationCore.MeshAction"), v29);

  return v21;
}

void __54__COMeshTimerAddOn_dismissTimerWithIdentifier_client___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  _QWORD v4[4];
  id v5;
  id v6;

  v2 = *(void **)(a1 + 32);
  v3 = *(_QWORD *)(a1 + 40);
  v4[0] = MEMORY[0x24BDAC760];
  v4[1] = 3221225472;
  v4[2] = __54__COMeshTimerAddOn_dismissTimerWithIdentifier_client___block_invoke_2;
  v4[3] = &unk_24D4B17C0;
  v5 = *(id *)(a1 + 48);
  v6 = *(id *)(a1 + 56);
  objc_msgSend(v2, "handleTimerDismissRequest:callback:", v3, v4);

}

void __54__COMeshTimerAddOn_dismissTimerWithIdentifier_client___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;

  v5 = a2;
  v6 = a3;
  if (v6 || (objc_msgSend(v5, "error"), (v6 = (id)objc_claimAutoreleasedReturnValue()) != 0))
  {
    COCoreLogForCategory(3);
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      __54__COMeshTimerAddOn_dismissTimerWithIdentifier_client___block_invoke_2_cold_1();

    objc_msgSend(*(id *)(a1 + 32), "finishWithError:", v6);
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "finishWithNoResult");
  }

}

void __54__COMeshTimerAddOn_dismissTimerWithIdentifier_client___block_invoke_149(uint64_t a1, uint64_t a2, void *a3)
{
  id v4;
  NSObject *v5;
  NSObject *v6;
  void *v7;
  uint64_t v8;
  int v9;
  void *v10;
  __int16 v11;
  uint64_t v12;
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  COCoreLogForCategory(3);
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v4)
  {
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      __54__COMeshTimerAddOn_dismissTimerWithIdentifier_client___block_invoke_149_cold_1(a1, (uint64_t)v4, v6);
  }
  else if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(*(id *)(a1 + 32), "meshController");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = *(_QWORD *)(a1 + 40);
    v9 = 134218242;
    v10 = v7;
    v11 = 2112;
    v12 = v8;
    _os_log_impl(&dword_215E92000, v6, OS_LOG_TYPE_DEFAULT, "%p early dismissed %@.", (uint8_t *)&v9, 0x16u);

  }
}

id __54__COMeshTimerAddOn_dismissTimerWithIdentifier_client___block_invoke_151(uint64_t a1)
{
  return COCoreAnalyticsCreateActionEvent(CFSTR("timer"), CFSTR("dismiss"), *(unsigned __int8 *)(a1 + 32) == 0);
}

- (BOOL)_isTimer:(id)a3 targetingAccessory:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  BOOL v11;
  void *v12;
  _QWORD v14[2];

  v14[1] = *MEMORY[0x24BDAC8D0];
  v6 = a4;
  v7 = a3;
  if (v6)
  {
    -[COMeshTimerAddOn homekit](self, "homekit");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "homeForAccessory:", v6);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (v9)
    {
      objc_msgSend(v8, "identifiersForAccessoriesAssociatedWithAccessory:inHome:", v6, v9);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      objc_msgSend(v6, "uniqueIdentifier");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v14[0] = v12;
      objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v14, 1);
      v10 = (void *)objc_claimAutoreleasedReturnValue();

    }
    v11 = -[COMeshTimerAddOn _isTimer:targetingAccessoryIdentifiers:](self, "_isTimer:targetingAccessoryIdentifiers:", v7, v10);

  }
  else
  {
    v11 = -[COMeshTimerAddOn _isTimer:targetingAccessoryIdentifiers:](self, "_isTimer:targetingAccessoryIdentifiers:", v7, 0);
    v8 = v7;
  }

  return v11;
}

- (void)handleTimerReadRequest:(id)a3 callback:(id)a4
{
  id v6;
  void (**v7)(id, COMeshResponse *, _QWORD);
  NSObject *v8;
  void *v9;
  NSObject *v10;
  void *v11;
  int v12;
  char v13;
  void *v14;
  id v15;
  uint64_t v16;
  void *v17;
  void *v18;
  uint64_t v19;
  COMeshResponse *v20;
  id v21;
  id v22;
  COMeshResponse *v23;
  _QWORD v24[4];
  id v25;
  COMeshTimerAddOn *v26;
  id v27;
  COMeshResponse *v28;
  char v29;
  _QWORD v30[4];
  COMeshResponse *v31;
  uint8_t buf[4];
  void *v33;
  __int16 v34;
  void *v35;
  uint64_t v36;

  v36 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = (void (**)(id, COMeshResponse *, _QWORD))a4;
  -[COMeshAddOn meshControllerQueue](self, "meshControllerQueue");
  v8 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v8);

  objc_msgSend(v6, "accessoryUniqueIdentifier");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  COCoreLogForCategory(3);
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    -[COMeshAddOn meshController](self, "meshController");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 134218242;
    v33 = v11;
    v34 = 2112;
    v35 = v9;
    _os_log_impl(&dword_215E92000, v10, OS_LOG_TYPE_DEFAULT, "%p retrieving timers for %@...", buf, 0x16u);

  }
  v12 = objc_msgSend(v6, "requiresFilter");
  v13 = v12;
  v14 = 0;
  if (v12 && v9)
  {
    -[COMeshTimerAddOn homekit](self, "homekit");
    v15 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "accessoryWithUniqueIdentifier:", v9);
    v16 = objc_claimAutoreleasedReturnValue();
    if (!v16)
    {
      objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", *MEMORY[0x24BDD5BD8], 2, 0);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v23 = -[COMeshResponse initWithError:]([COMeshResponse alloc], "initWithError:", v18);
      v7[2](v7, v23, 0);
      goto LABEL_11;
    }
    v14 = (void *)v16;

  }
  if (-[COMeshTimerAddOn performsLocalActions](self, "performsLocalActions"))
  {
    -[COMeshTimerAddOn timerManager](self, "timerManager");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "timers");
    v18 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    objc_msgSend(MEMORY[0x24BE6B608], "futureWithResult:", MEMORY[0x24BDBD1A8]);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v19 = MEMORY[0x24BDAC760];
  v30[0] = MEMORY[0x24BDAC760];
  v30[1] = 3221225472;
  v30[2] = __52__COMeshTimerAddOn_handleTimerReadRequest_callback___block_invoke;
  v30[3] = &unk_24D4B22C0;
  v20 = v7;
  v31 = v20;
  v21 = (id)objc_msgSend(v18, "addFailureBlock:", v30);
  v24[0] = v19;
  v24[1] = 3221225472;
  v24[2] = __52__COMeshTimerAddOn_handleTimerReadRequest_callback___block_invoke_153;
  v24[3] = &unk_24D4B22E8;
  v29 = v13;
  v25 = v14;
  v26 = self;
  v27 = v6;
  v28 = v20;
  v15 = v14;
  v22 = (id)objc_msgSend(v18, "addSuccessBlock:", v24);

  v23 = v31;
LABEL_11:

}

void __52__COMeshTimerAddOn_handleTimerReadRequest_callback___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  COMeshResponse *v6;

  v3 = a2;
  COCoreLogForCategory(3);
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    __52__COMeshTimerAddOn_handleTimerReadRequest_callback___block_invoke_cold_1();

  v5 = *(_QWORD *)(a1 + 32);
  v6 = -[COMeshResponse initWithError:]([COMeshResponse alloc], "initWithError:", v3);
  (*(void (**)(uint64_t, COMeshResponse *, _QWORD))(v5 + 16))(v5, v6, 0);

}

void __52__COMeshTimerAddOn_handleTimerReadRequest_callback___block_invoke_153(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  uint64_t v5;
  void *v6;
  void *v7;
  NSObject *v8;
  COTimerReadResponse *v9;
  NSObject *v10;
  COTimerReadResponse *v11;
  NSObject *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  int v17;
  NSObject *v18;
  COTimerReadResponse *v19;
  void *v20;
  uint64_t v21;
  NSObject *v22;
  COTimerReadResponse *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t (*v26)(uint64_t, void *);
  void *v27;
  id v28;
  uint64_t v29;
  uint8_t buf[4];
  id v31;
  uint64_t v32;

  v32 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  if (*(_BYTE *)(a1 + 64))
  {
    v24 = MEMORY[0x24BDAC760];
    v25 = 3221225472;
    v26 = __52__COMeshTimerAddOn_handleTimerReadRequest_callback___block_invoke_2;
    v27 = &unk_24D4B1ED0;
    v4 = *(id *)(a1 + 32);
    v5 = *(_QWORD *)(a1 + 40);
    v28 = v4;
    v29 = v5;
    objc_msgSend(v3, "indexesOfObjectsPassingTest:", &v24);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v6, "count", v24, v25, v26, v27))
    {
      v7 = (void *)objc_msgSend(v3, "mutableCopy");
      objc_msgSend(v7, "removeObjectsAtIndexes:", v6);

      v3 = v7;
    }
    COCoreLogForCategory(3);
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v31 = v3;
      _os_log_impl(&dword_215E92000, v8, OS_LOG_TYPE_DEFAULT, "... returning filtered timers list\n%@", buf, 0xCu);
    }

    v9 = -[COTimerReadResponse initWithFilteredTimers:]([COTimerReadResponse alloc], "initWithFilteredTimers:", v3);
    goto LABEL_17;
  }
  if ((objc_msgSend(*(id *)(a1 + 48), "isForMerge") & 1) == 0)
  {
    COCoreLogForCategory(3);
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v31 = v3;
      _os_log_impl(&dword_215E92000, v12, OS_LOG_TYPE_DEFAULT, "... returning timers list\n%@", buf, 0xCu);
    }

    v11 = -[COTimerReadResponse initWithTimers:]([COTimerReadResponse alloc], "initWithTimers:", v3);
    goto LABEL_16;
  }
  if (!objc_msgSend(*(id *)(a1 + 40), "performsLocalActions")
    || objc_msgSend(MEMORY[0x24BE19E30], "isDistributedTimersEnabled"))
  {
    COCoreLogForCategory(3);
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_215E92000, v10, OS_LOG_TYPE_DEFAULT, "... returning skip-in-merge", buf, 2u);
    }

    v11 = -[COTimerReadResponse initWithSkipInMerge]([COTimerReadResponse alloc], "initWithSkipInMerge");
LABEL_16:
    v9 = v11;
    goto LABEL_17;
  }
  objc_msgSend(*(id *)(a1 + 48), "eTag");
  v13 = objc_claimAutoreleasedReturnValue();
  if (!v13)
    goto LABEL_23;
  v14 = (void *)v13;
  objc_msgSend(*(id *)(a1 + 48), "eTag");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  eTagForTimers(v3);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = objc_msgSend(v15, "isEqualToString:", v16);

  if (v17)
  {
    COCoreLogForCategory(3);
    v18 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_215E92000, v18, OS_LOG_TYPE_DEFAULT, "... returning not-modified", buf, 2u);
    }

    v19 = [COTimerReadResponse alloc];
    objc_msgSend(*(id *)(a1 + 40), "deletes");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = -[COTimerReadResponse initNotModifiedWithDeletes:](v19, "initNotModifiedWithDeletes:", v20);
  }
  else
  {
LABEL_23:
    COCoreLogForCategory(3);
    v22 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v31 = v3;
      _os_log_impl(&dword_215E92000, v22, OS_LOG_TYPE_DEFAULT, "... returning alarms list and deletes\n%@", buf, 0xCu);
    }

    v23 = [COTimerReadResponse alloc];
    objc_msgSend(*(id *)(a1 + 40), "deletes");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = -[COTimerReadResponse initWithTimers:deletes:](v23, "initWithTimers:deletes:", v3, v20);
  }
  v9 = (COTimerReadResponse *)v21;

LABEL_17:
  (*(void (**)(void))(*(_QWORD *)(a1 + 56) + 16))();

}

uint64_t __52__COMeshTimerAddOn_handleTimerReadRequest_callback___block_invoke_2(uint64_t a1, void *a2)
{
  int v2;
  void *v3;
  void *v4;

  if (*(_QWORD *)(a1 + 32))
  {
    v2 = objc_msgSend(*(id *)(a1 + 40), "_isTimer:targetingAccessory:", a2);
  }
  else
  {
    objc_msgSend(a2, "siriContext");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "objectForKey:", *MEMORY[0x24BE19DE0]);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v2 = v4 == 0;

  }
  return v2 ^ 1u;
}

- (void)handleTimerCreateRequest:(id)a3 callback:(id)a4
{
  id v6;
  id v7;
  void *v8;
  NSObject *v9;
  void *v10;
  NSObject *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  id v17;
  id v18;
  id v19;
  id v20;
  id v21;
  id v22;
  id v23;
  _QWORD v24[4];
  id v25;
  id v26;
  id v27;
  _QWORD v28[4];
  id v29;
  id v30;
  uint8_t buf[4];
  void *v32;
  __int16 v33;
  void *v34;
  uint64_t v35;

  v35 = *MEMORY[0x24BDAC8D0];
  v6 = a4;
  v7 = a3;
  -[COMeshAddOn meshController](self, "meshController");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "dispatchQueue");
  v9 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v9);

  objc_msgSend(v7, "timer");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  COCoreLogForCategory(3);
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(v10, "timerID");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 134218242;
    v32 = v8;
    v33 = 2112;
    v34 = v12;
    _os_log_impl(&dword_215E92000, v11, OS_LOG_TYPE_DEFAULT, "%p adding timer %@...", buf, 0x16u);

  }
  if (-[COMeshTimerAddOn performsLocalActions](self, "performsLocalActions"))
  {
    -[COMeshTimerAddOn timerManager](self, "timerManager");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "addTimer:", v10);
  }
  else
  {
    v14 = (void *)MEMORY[0x24BE6B608];
    objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", *MEMORY[0x24BDD0B88], 3328, 0);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "futureWithError:", v13);
  }
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  v16 = MEMORY[0x24BDAC760];
  v28[0] = MEMORY[0x24BDAC760];
  v28[1] = 3221225472;
  v28[2] = __54__COMeshTimerAddOn_handleTimerCreateRequest_callback___block_invoke;
  v28[3] = &unk_24D4B2310;
  v17 = v10;
  v29 = v17;
  v18 = v6;
  v30 = v18;
  v19 = (id)objc_msgSend(v15, "addFailureBlock:", v28);
  v24[0] = v16;
  v24[1] = 3221225472;
  v24[2] = __54__COMeshTimerAddOn_handleTimerCreateRequest_callback___block_invoke_154;
  v24[3] = &unk_24D4B2338;
  v26 = v8;
  v27 = v18;
  v25 = v17;
  v20 = v8;
  v21 = v18;
  v22 = v17;
  v23 = (id)objc_msgSend(v15, "addSuccessBlock:", v24);

}

void __54__COMeshTimerAddOn_handleTimerCreateRequest_callback___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  COMeshResponse *v6;

  v3 = a2;
  COCoreLogForCategory(3);
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    __54__COMeshTimerAddOn_handleTimerCreateRequest_callback___block_invoke_cold_1();

  v5 = *(_QWORD *)(a1 + 40);
  v6 = -[COMeshResponse initWithError:]([COMeshResponse alloc], "initWithError:", v3);
  (*(void (**)(uint64_t, COMeshResponse *, _QWORD))(v5 + 16))(v5, v6, 0);

}

void __54__COMeshTimerAddOn_handleTimerCreateRequest_callback___block_invoke_154(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  uint64_t v4;
  COMeshResponse *v5;
  COTimersAddedNotification *v6;
  void *v7;
  COTimersAddedNotification *v8;
  NSObject *v9;
  uint64_t v10;
  uint8_t buf[4];
  void *v12;
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  COCoreLogForCategory(3);
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(*(id *)(a1 + 32), "timerID");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412290;
    v12 = v3;
    _os_log_impl(&dword_215E92000, v2, OS_LOG_TYPE_DEFAULT, "... timer (%@) create completed", buf, 0xCu);

  }
  v4 = *(_QWORD *)(a1 + 48);
  v5 = objc_alloc_init(COMeshResponse);
  (*(void (**)(uint64_t, COMeshResponse *, _QWORD))(v4 + 16))(v4, v5, 0);

  v6 = [COTimersAddedNotification alloc];
  v10 = *(_QWORD *)(a1 + 32);
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v10, 1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = -[COTimerNotification initWithTimers:](v6, "initWithTimers:", v7);

  COCoreLogForCategory(3);
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
    __54__COMeshTimerAddOn_handleTimerCreateRequest_callback___block_invoke_154_cold_1(a1, (id *)(a1 + 32));

  objc_msgSend(*(id *)(a1 + 40), "sendNotification:", v8);
}

- (void)handleTimerUpdateRequest:(id)a3 callback:(id)a4
{
  id v6;
  id v7;
  void *v8;
  NSObject *v9;
  void *v10;
  NSObject *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  id v17;
  id v18;
  id v19;
  id v20;
  id v21;
  id v22;
  id v23;
  _QWORD v24[4];
  id v25;
  id v26;
  id v27;
  _QWORD v28[4];
  id v29;
  id v30;
  uint8_t buf[4];
  void *v32;
  __int16 v33;
  void *v34;
  uint64_t v35;

  v35 = *MEMORY[0x24BDAC8D0];
  v6 = a4;
  v7 = a3;
  -[COMeshAddOn meshController](self, "meshController");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "dispatchQueue");
  v9 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v9);

  objc_msgSend(v7, "timer");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  COCoreLogForCategory(3);
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(v10, "timerID");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 134218242;
    v32 = v8;
    v33 = 2112;
    v34 = v12;
    _os_log_impl(&dword_215E92000, v11, OS_LOG_TYPE_DEFAULT, "%p updating timer %@...", buf, 0x16u);

  }
  if (-[COMeshTimerAddOn performsLocalActions](self, "performsLocalActions"))
  {
    -[COMeshTimerAddOn timerManager](self, "timerManager");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "updateTimer:", v10);
  }
  else
  {
    v14 = (void *)MEMORY[0x24BE6B608];
    objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", *MEMORY[0x24BDD0B88], 3328, 0);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "futureWithError:", v13);
  }
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  v16 = MEMORY[0x24BDAC760];
  v28[0] = MEMORY[0x24BDAC760];
  v28[1] = 3221225472;
  v28[2] = __54__COMeshTimerAddOn_handleTimerUpdateRequest_callback___block_invoke;
  v28[3] = &unk_24D4B2310;
  v17 = v10;
  v29 = v17;
  v18 = v6;
  v30 = v18;
  v19 = (id)objc_msgSend(v15, "addFailureBlock:", v28);
  v24[0] = v16;
  v24[1] = 3221225472;
  v24[2] = __54__COMeshTimerAddOn_handleTimerUpdateRequest_callback___block_invoke_155;
  v24[3] = &unk_24D4B2338;
  v26 = v8;
  v27 = v18;
  v25 = v17;
  v20 = v8;
  v21 = v18;
  v22 = v17;
  v23 = (id)objc_msgSend(v15, "addSuccessBlock:", v24);

}

void __54__COMeshTimerAddOn_handleTimerUpdateRequest_callback___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  COMeshResponse *v6;

  v3 = a2;
  COCoreLogForCategory(3);
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    __54__COMeshTimerAddOn_handleTimerUpdateRequest_callback___block_invoke_cold_1();

  v5 = *(_QWORD *)(a1 + 40);
  v6 = -[COMeshResponse initWithError:]([COMeshResponse alloc], "initWithError:", v3);
  (*(void (**)(uint64_t, COMeshResponse *, _QWORD))(v5 + 16))(v5, v6, 0);

}

void __54__COMeshTimerAddOn_handleTimerUpdateRequest_callback___block_invoke_155(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  uint64_t v4;
  COMeshResponse *v5;
  COTimersUpdatedNotification *v6;
  void *v7;
  COTimersUpdatedNotification *v8;
  NSObject *v9;
  uint64_t v10;
  uint8_t buf[4];
  void *v12;
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  COCoreLogForCategory(3);
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(*(id *)(a1 + 32), "timerID");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412290;
    v12 = v3;
    _os_log_impl(&dword_215E92000, v2, OS_LOG_TYPE_DEFAULT, "... timer (%@) update completed", buf, 0xCu);

  }
  v4 = *(_QWORD *)(a1 + 48);
  v5 = objc_alloc_init(COMeshResponse);
  (*(void (**)(uint64_t, COMeshResponse *, _QWORD))(v4 + 16))(v4, v5, 0);

  v6 = [COTimersUpdatedNotification alloc];
  v10 = *(_QWORD *)(a1 + 32);
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v10, 1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = -[COTimerNotification initWithTimers:](v6, "initWithTimers:", v7);

  COCoreLogForCategory(3);
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
    __54__COMeshTimerAddOn_handleTimerUpdateRequest_callback___block_invoke_155_cold_1(a1, (id *)(a1 + 32));

  objc_msgSend(*(id *)(a1 + 40), "sendNotification:", v8);
}

- (void)handleTimerDeleteRequest:(id)a3 callback:(id)a4
{
  id v6;
  id v7;
  void *v8;
  NSObject *v9;
  void *v10;
  NSObject *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  id v17;
  id v18;
  id v19;
  id v20;
  id v21;
  id v22;
  id v23;
  _QWORD v24[4];
  id v25;
  COMeshTimerAddOn *v26;
  id v27;
  id v28;
  _QWORD v29[4];
  id v30;
  id v31;
  uint8_t buf[4];
  void *v33;
  __int16 v34;
  void *v35;
  uint64_t v36;

  v36 = *MEMORY[0x24BDAC8D0];
  v6 = a4;
  v7 = a3;
  -[COMeshAddOn meshController](self, "meshController");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "dispatchQueue");
  v9 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v9);

  objc_msgSend(v7, "timer");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  COCoreLogForCategory(3);
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(v10, "timerID");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 134218242;
    v33 = v8;
    v34 = 2112;
    v35 = v12;
    _os_log_impl(&dword_215E92000, v11, OS_LOG_TYPE_DEFAULT, "%p delete timer %@...", buf, 0x16u);

  }
  if (-[COMeshTimerAddOn performsLocalActions](self, "performsLocalActions"))
  {
    -[COMeshTimerAddOn timerManager](self, "timerManager");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "removeTimer:", v10);
  }
  else
  {
    v14 = (void *)MEMORY[0x24BE6B608];
    objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", *MEMORY[0x24BDD0B88], 3328, 0);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "futureWithError:", v13);
  }
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  v16 = MEMORY[0x24BDAC760];
  v29[0] = MEMORY[0x24BDAC760];
  v29[1] = 3221225472;
  v29[2] = __54__COMeshTimerAddOn_handleTimerDeleteRequest_callback___block_invoke;
  v29[3] = &unk_24D4B2310;
  v17 = v10;
  v30 = v17;
  v18 = v6;
  v31 = v18;
  v19 = (id)objc_msgSend(v15, "addFailureBlock:", v29);
  v24[0] = v16;
  v24[1] = 3221225472;
  v24[2] = __54__COMeshTimerAddOn_handleTimerDeleteRequest_callback___block_invoke_156;
  v24[3] = &unk_24D4B2360;
  v25 = v17;
  v26 = self;
  v27 = v8;
  v28 = v18;
  v20 = v8;
  v21 = v18;
  v22 = v17;
  v23 = (id)objc_msgSend(v15, "addSuccessBlock:", v24);

}

void __54__COMeshTimerAddOn_handleTimerDeleteRequest_callback___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  COMeshResponse *v6;

  v3 = a2;
  COCoreLogForCategory(3);
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    __54__COMeshTimerAddOn_handleTimerDeleteRequest_callback___block_invoke_cold_1();

  v5 = *(_QWORD *)(a1 + 40);
  v6 = -[COMeshResponse initWithError:]([COMeshResponse alloc], "initWithError:", v3);
  (*(void (**)(uint64_t, COMeshResponse *, _QWORD))(v5 + 16))(v5, v6, 0);

}

void __54__COMeshTimerAddOn_handleTimerDeleteRequest_callback___block_invoke_156(uint64_t a1)
{
  id *v2;
  void *v3;
  NSObject *v4;
  void *v5;
  COTimerDeleteEvent *v6;
  void *v7;
  COTimerDeleteEvent *v8;
  uint64_t v9;
  COMeshResponse *v10;
  COTimersRemovedNotification *v11;
  void *v12;
  COTimersRemovedNotification *v13;
  NSObject *v14;
  uint64_t v15;
  uint8_t buf[4];
  void *v17;
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  v2 = (id *)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 32), "timerID");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  COCoreLogForCategory(3);
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v17 = v3;
    _os_log_impl(&dword_215E92000, v4, OS_LOG_TYPE_DEFAULT, "... timer (%@) delete completed", buf, 0xCu);
  }

  v5 = *(void **)(a1 + 40);
  v6 = [COTimerDeleteEvent alloc];
  objc_msgSend(MEMORY[0x24BDBCE60], "now");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = -[COTimerDeleteEvent initWithIdentifier:date:](v6, "initWithIdentifier:date:", v3, v7);
  objc_msgSend(v5, "_addTimerDeleteEvent:", v8);

  v9 = *(_QWORD *)(a1 + 56);
  v10 = objc_alloc_init(COMeshResponse);
  (*(void (**)(uint64_t, COMeshResponse *, _QWORD))(v9 + 16))(v9, v10, 0);

  v11 = [COTimersRemovedNotification alloc];
  v15 = *(_QWORD *)(a1 + 32);
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v15, 1);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = -[COTimerNotification initWithTimers:](v11, "initWithTimers:", v12);

  COCoreLogForCategory(3);
  v14 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
    __54__COMeshTimerAddOn_handleTimerDeleteRequest_callback___block_invoke_156_cold_1(a1, v2);

  objc_msgSend(*(id *)(a1 + 48), "sendNotification:", v13);
}

- (void)handleTimerDismissRequest:(id)a3 callback:(id)a4
{
  id v6;
  id v7;
  void *v8;
  NSObject *v9;
  void *v10;
  NSObject *v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  id v16;
  void *v17;
  id v18;
  id v19;
  id v20;
  id v21;
  id v22;
  id v23;
  id v24;
  id v25;
  id v26;
  id v27;
  _QWORD v28[4];
  id v29;
  id v30;
  _BYTE *v31;
  _QWORD v32[4];
  id v33;
  id v34;
  id v35;
  _QWORD *v36;
  _QWORD v37[4];
  id v38;
  id v39;
  _QWORD v40[4];
  id v41;
  COMeshTimerAddOn *v42;
  _QWORD *v43;
  _BYTE *v44;
  _QWORD v45[3];
  char v46;
  _BYTE buf[24];
  uint64_t (*v48)(uint64_t, uint64_t);
  void (*v49)(uint64_t);
  id v50;
  uint64_t v51;

  v51 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  -[COMeshAddOn meshController](self, "meshController");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "dispatchQueue");
  v9 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v9);

  objc_msgSend(v6, "identifier");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  COCoreLogForCategory(3);
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134218242;
    *(_QWORD *)&buf[4] = v8;
    *(_WORD *)&buf[12] = 2112;
    *(_QWORD *)&buf[14] = v10;
    _os_log_impl(&dword_215E92000, v11, OS_LOG_TYPE_DEFAULT, "%p dismiss timer %@...", buf, 0x16u);
  }

  v45[0] = 0;
  v45[1] = v45;
  v45[2] = 0x2020000000;
  v46 = 0;
  *(_QWORD *)buf = 0;
  *(_QWORD *)&buf[8] = buf;
  *(_QWORD *)&buf[16] = 0x3032000000;
  v48 = __Block_byref_object_copy__11;
  v49 = __Block_byref_object_dispose__11;
  v50 = 0;
  -[COMeshTimerAddOn timerManager](self, "timerManager");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "dismissTimerWithIdentifier:", v10);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "timers");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = MEMORY[0x24BDAC760];
  v40[0] = MEMORY[0x24BDAC760];
  v40[1] = 3221225472;
  v40[2] = __55__COMeshTimerAddOn_handleTimerDismissRequest_callback___block_invoke;
  v40[3] = &unk_24D4B2388;
  v43 = v45;
  v44 = buf;
  v16 = v8;
  v41 = v16;
  v42 = self;
  v17 = (void *)MEMORY[0x2199F3D40](v40);
  v37[0] = v15;
  v37[1] = 3221225472;
  v37[2] = __55__COMeshTimerAddOn_handleTimerDismissRequest_callback___block_invoke_160;
  v37[3] = &unk_24D4B2310;
  v18 = v10;
  v38 = v18;
  v19 = v7;
  v39 = v19;
  v20 = (id)objc_msgSend(v13, "addFailureBlock:", v37);
  v32[0] = v15;
  v32[1] = 3221225472;
  v32[2] = __55__COMeshTimerAddOn_handleTimerDismissRequest_callback___block_invoke_161;
  v32[3] = &unk_24D4B23B0;
  v21 = v18;
  v33 = v21;
  v22 = v19;
  v34 = v22;
  v36 = v45;
  v23 = v17;
  v35 = v23;
  v24 = (id)objc_msgSend(v13, "addSuccessBlock:", v32);
  v28[0] = v15;
  v28[1] = 3221225472;
  v28[2] = __55__COMeshTimerAddOn_handleTimerDismissRequest_callback___block_invoke_162;
  v28[3] = &unk_24D4B2400;
  v25 = v21;
  v29 = v25;
  v31 = buf;
  v26 = v23;
  v30 = v26;
  v27 = (id)objc_msgSend(v14, "addSuccessBlock:", v28);

  _Block_object_dispose(buf, 8);
  _Block_object_dispose(v45, 8);

}

void __55__COMeshTimerAddOn_handleTimerDismissRequest_callback___block_invoke(uint64_t a1)
{
  uint64_t v2;
  COTimerFiringTimerDismissedNotification *v3;
  void *v4;
  COTimerFiringTimerDismissedNotification *v5;
  NSObject *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  _QWORD v11[2];

  v11[1] = *MEMORY[0x24BDAC8D0];
  if (*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24))
  {
    v2 = a1 + 56;
    if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40))
    {
      v3 = [COTimerFiringTimerDismissedNotification alloc];
      v11[0] = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)v2 + 8) + 40);
      objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v11, 1);
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      v5 = -[COTimerNotification initWithTimers:](v3, "initWithTimers:", v4);

      COCoreLogForCategory(3);
      v6 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
        __55__COMeshTimerAddOn_handleTimerDismissRequest_callback___block_invoke_cold_1(a1, v2);

      objc_msgSend(*(id *)(a1 + 32), "sendNotification:", v5);
      objc_msgSend(*(id *)(a1 + 40), "delegate");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      if ((objc_opt_respondsToSelector() & 1) != 0)
      {
        v8 = *(_QWORD *)(a1 + 40);
        v10 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40);
        objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v10, 1);
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "timerAddOn:didDismissTimers:", v8, v9);

      }
    }
  }
}

void __55__COMeshTimerAddOn_handleTimerDismissRequest_callback___block_invoke_160(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  COMeshResponse *v6;

  v3 = a2;
  COCoreLogForCategory(3);
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    __55__COMeshTimerAddOn_handleTimerDismissRequest_callback___block_invoke_160_cold_1();

  v5 = *(_QWORD *)(a1 + 40);
  v6 = -[COMeshResponse initWithError:]([COMeshResponse alloc], "initWithError:", v3);
  (*(void (**)(uint64_t, COMeshResponse *, _QWORD))(v5 + 16))(v5, v6, 0);

}

uint64_t __55__COMeshTimerAddOn_handleTimerDismissRequest_callback___block_invoke_161(_QWORD *a1)
{
  NSObject *v2;
  uint64_t v3;
  uint64_t v4;
  COMeshResponse *v5;
  int v7;
  uint64_t v8;
  uint64_t v9;

  v9 = *MEMORY[0x24BDAC8D0];
  COCoreLogForCategory(3);
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    v3 = a1[4];
    v7 = 138412290;
    v8 = v3;
    _os_log_impl(&dword_215E92000, v2, OS_LOG_TYPE_DEFAULT, "... timer (%@) dismiss completed", (uint8_t *)&v7, 0xCu);
  }

  v4 = a1[5];
  v5 = objc_alloc_init(COMeshResponse);
  (*(void (**)(uint64_t, COMeshResponse *, _QWORD))(v4 + 16))(v4, v5, 0);

  *(_BYTE *)(*(_QWORD *)(a1[7] + 8) + 24) = 1;
  return (*(uint64_t (**)(void))(a1[6] + 16))();
}

void __55__COMeshTimerAddOn_handleTimerDismissRequest_callback___block_invoke_162(uint64_t a1, void *a2)
{
  id v4;
  __int128 v5;
  _QWORD v6[4];
  id v7;
  __int128 v8;

  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __55__COMeshTimerAddOn_handleTimerDismissRequest_callback___block_invoke_2;
  v6[3] = &unk_24D4B23D8;
  v7 = *(id *)(a1 + 32);
  v5 = *(_OWORD *)(a1 + 40);
  v4 = (id)v5;
  v8 = v5;
  objc_msgSend(a2, "enumerateObjectsUsingBlock:", v6);

}

void __55__COMeshTimerAddOn_handleTimerDismissRequest_callback___block_invoke_2(_QWORD *a1, void *a2, uint64_t a3, _BYTE *a4)
{
  void *v7;
  int v8;
  id v9;

  v9 = a2;
  objc_msgSend(v9, "timerIDString");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "isEqualToString:", a1[4]);
  *a4 = v8;

  if (v8)
  {
    objc_storeStrong((id *)(*(_QWORD *)(a1[6] + 8) + 40), a2);
    (*(void (**)(void))(a1[5] + 16))();
  }

}

- (void)handleTimersAddedNotification:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  _BOOL4 v7;
  uint64_t v8;
  id v9;
  void *v10;
  id v11;
  id v12;
  NSObject *v13;
  id v14;
  _QWORD v15[5];
  id v16;
  _QWORD v17[5];
  id v18;
  id v19;

  v4 = a3;
  -[COMeshAddOn meshControllerQueue](self, "meshControllerQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v5);
  objc_msgSend(v4, "timers");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v6, "count"))
  {
    v7 = -[COMeshTimerAddOn performsLocalActions](self, "performsLocalActions");
    v8 = MEMORY[0x24BDAC760];
    if (v7)
    {
      v9 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
      objc_msgSend(MEMORY[0x24BE6B628], "schedulerWithDispatchQueue:", v5);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      -[COMeshTimerAddOn timerManager](self, "timerManager");
      v17[0] = v8;
      v17[1] = 3221225472;
      v17[2] = __50__COMeshTimerAddOn_handleTimersAddedNotification___block_invoke;
      v17[3] = &unk_24D4B2428;
      v17[4] = self;
      v18 = v9;
      v19 = (id)objc_claimAutoreleasedReturnValue();
      v11 = v19;
      v12 = v9;
      objc_msgSend(v6, "enumerateObjectsUsingBlock:", v17);
      objc_msgSend(MEMORY[0x24BE6B608], "combineAllFutures:ignoringErrors:scheduler:", v12, 1, v10);
      v13 = objc_claimAutoreleasedReturnValue();

    }
    else
    {
      objc_msgSend(MEMORY[0x24BE6B608], "futureWithNoResult");
      v13 = objc_claimAutoreleasedReturnValue();
    }
    v15[0] = v8;
    v15[1] = 3221225472;
    v15[2] = __50__COMeshTimerAddOn_handleTimersAddedNotification___block_invoke_165;
    v15[3] = &unk_24D4B2450;
    v15[4] = self;
    v16 = v6;
    v14 = (id)-[NSObject addSuccessBlock:](v13, "addSuccessBlock:", v15);

  }
  else
  {
    COCoreLogForCategory(3);
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
      -[COMeshTimerAddOn handleTimersAddedNotification:].cold.1();
  }

}

void __50__COMeshTimerAddOn_handleTimersAddedNotification___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  int v9;
  uint64_t v10;
  __int16 v11;
  void *v12;
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  COCoreLogForCategory(3);
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v5 = *(_QWORD *)(a1 + 32);
    objc_msgSend(v3, "timerID");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = 134218242;
    v10 = v5;
    v11 = 2112;
    v12 = v6;
    _os_log_impl(&dword_215E92000, v4, OS_LOG_TYPE_DEFAULT, "%p adding local timer %@", (uint8_t *)&v9, 0x16u);

  }
  v7 = *(void **)(a1 + 40);
  objc_msgSend(*(id *)(a1 + 48), "addTimer:", v3);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "addObject:", v8);

}

void __50__COMeshTimerAddOn_handleTimersAddedNotification___block_invoke_165(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  void *v4;
  int v5;
  uint64_t v6;
  uint64_t v7;

  v7 = *MEMORY[0x24BDAC8D0];
  COCoreLogForCategory(3);
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    v3 = *(_QWORD *)(a1 + 32);
    v5 = 134217984;
    v6 = v3;
    _os_log_impl(&dword_215E92000, v2, OS_LOG_TYPE_DEFAULT, "%p finished adding local timers", (uint8_t *)&v5, 0xCu);
  }

  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v4, "timerAddOn:didAddTimers:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));

}

- (void)handleTimersRemovedNotification:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  _BOOL4 v7;
  uint64_t v8;
  id v9;
  void *v10;
  void *v11;
  id v12;
  id v13;
  id v14;
  NSObject *v15;
  id v16;
  _QWORD v17[5];
  id v18;
  _QWORD v19[5];
  id v20;
  id v21;
  id v22;

  v4 = a3;
  -[COMeshAddOn meshControllerQueue](self, "meshControllerQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v5);
  objc_msgSend(v4, "timers");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v6, "count"))
  {
    v7 = -[COMeshTimerAddOn performsLocalActions](self, "performsLocalActions");
    v8 = MEMORY[0x24BDAC760];
    if (v7)
    {
      v9 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
      objc_msgSend(MEMORY[0x24BE6B628], "schedulerWithDispatchQueue:", v5);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BDBCE60], "now");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      -[COMeshTimerAddOn timerManager](self, "timerManager");
      v19[0] = v8;
      v19[1] = 3221225472;
      v19[2] = __52__COMeshTimerAddOn_handleTimersRemovedNotification___block_invoke;
      v19[3] = &unk_24D4B2478;
      v19[4] = self;
      v20 = v11;
      v21 = v9;
      v22 = (id)objc_claimAutoreleasedReturnValue();
      v12 = v22;
      v13 = v9;
      v14 = v11;
      objc_msgSend(v6, "enumerateObjectsUsingBlock:", v19);
      objc_msgSend(MEMORY[0x24BE6B608], "combineAllFutures:ignoringErrors:scheduler:", v13, 1, v10);
      v15 = objc_claimAutoreleasedReturnValue();

    }
    else
    {
      objc_msgSend(MEMORY[0x24BE6B608], "futureWithNoResult");
      v15 = objc_claimAutoreleasedReturnValue();
    }
    v17[0] = v8;
    v17[1] = 3221225472;
    v17[2] = __52__COMeshTimerAddOn_handleTimersRemovedNotification___block_invoke_167;
    v17[3] = &unk_24D4B2450;
    v17[4] = self;
    v18 = v6;
    v16 = (id)-[NSObject addSuccessBlock:](v15, "addSuccessBlock:", v17);

  }
  else
  {
    COCoreLogForCategory(3);
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
      -[COMeshTimerAddOn handleTimersRemovedNotification:].cold.1();
  }

}

void __52__COMeshTimerAddOn_handleTimersRemovedNotification___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  NSObject *v5;
  uint64_t v6;
  void *v7;
  COTimerDeleteEvent *v8;
  void *v9;
  void *v10;
  int v11;
  uint64_t v12;
  __int16 v13;
  void *v14;
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  objc_msgSend(v3, "timerID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  COCoreLogForCategory(3);
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v6 = *(_QWORD *)(a1 + 32);
    v11 = 134218242;
    v12 = v6;
    v13 = 2112;
    v14 = v4;
    _os_log_impl(&dword_215E92000, v5, OS_LOG_TYPE_DEFAULT, "%p removing local timer %@", (uint8_t *)&v11, 0x16u);
  }

  v7 = *(void **)(a1 + 32);
  v8 = -[COTimerDeleteEvent initWithIdentifier:date:]([COTimerDeleteEvent alloc], "initWithIdentifier:date:", v4, *(_QWORD *)(a1 + 40));
  objc_msgSend(v7, "_addTimerDeleteEvent:", v8);

  v9 = *(void **)(a1 + 48);
  objc_msgSend(*(id *)(a1 + 56), "removeTimer:", v3);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v9, "addObject:", v10);
}

void __52__COMeshTimerAddOn_handleTimersRemovedNotification___block_invoke_167(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  void *v4;
  int v5;
  uint64_t v6;
  uint64_t v7;

  v7 = *MEMORY[0x24BDAC8D0];
  COCoreLogForCategory(3);
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    v3 = *(_QWORD *)(a1 + 32);
    v5 = 134217984;
    v6 = v3;
    _os_log_impl(&dword_215E92000, v2, OS_LOG_TYPE_DEFAULT, "%p finished removing local timers", (uint8_t *)&v5, 0xCu);
  }

  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v4, "timerAddOn:didRemoveTimers:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));

}

- (void)handleTimersUpdatedNotification:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  _BOOL4 v7;
  uint64_t v8;
  id v9;
  void *v10;
  id v11;
  id v12;
  NSObject *v13;
  id v14;
  _QWORD v15[5];
  id v16;
  _QWORD v17[5];
  id v18;
  id v19;

  v4 = a3;
  -[COMeshAddOn meshControllerQueue](self, "meshControllerQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v5);
  objc_msgSend(v4, "timers");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v6, "count"))
  {
    v7 = -[COMeshTimerAddOn performsLocalActions](self, "performsLocalActions");
    v8 = MEMORY[0x24BDAC760];
    if (v7)
    {
      v9 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
      objc_msgSend(MEMORY[0x24BE6B628], "schedulerWithDispatchQueue:", v5);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      -[COMeshTimerAddOn timerManager](self, "timerManager");
      v17[0] = v8;
      v17[1] = 3221225472;
      v17[2] = __52__COMeshTimerAddOn_handleTimersUpdatedNotification___block_invoke;
      v17[3] = &unk_24D4B2428;
      v17[4] = self;
      v18 = v9;
      v19 = (id)objc_claimAutoreleasedReturnValue();
      v11 = v19;
      v12 = v9;
      objc_msgSend(v6, "enumerateObjectsUsingBlock:", v17);
      objc_msgSend(MEMORY[0x24BE6B608], "combineAllFutures:ignoringErrors:scheduler:", v12, 1, v10);
      v13 = objc_claimAutoreleasedReturnValue();

    }
    else
    {
      objc_msgSend(MEMORY[0x24BE6B608], "futureWithNoResult");
      v13 = objc_claimAutoreleasedReturnValue();
    }
    v15[0] = v8;
    v15[1] = 3221225472;
    v15[2] = __52__COMeshTimerAddOn_handleTimersUpdatedNotification___block_invoke_168;
    v15[3] = &unk_24D4B2450;
    v15[4] = self;
    v16 = v6;
    v14 = (id)-[NSObject addSuccessBlock:](v13, "addSuccessBlock:", v15);

  }
  else
  {
    COCoreLogForCategory(3);
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
      -[COMeshTimerAddOn handleTimersUpdatedNotification:].cold.1();
  }

}

void __52__COMeshTimerAddOn_handleTimersUpdatedNotification___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  int v9;
  uint64_t v10;
  __int16 v11;
  void *v12;
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  COCoreLogForCategory(3);
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v5 = *(_QWORD *)(a1 + 32);
    objc_msgSend(v3, "timerID");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = 134218242;
    v10 = v5;
    v11 = 2112;
    v12 = v6;
    _os_log_impl(&dword_215E92000, v4, OS_LOG_TYPE_DEFAULT, "%p updating local timer %@", (uint8_t *)&v9, 0x16u);

  }
  v7 = *(void **)(a1 + 40);
  objc_msgSend(*(id *)(a1 + 48), "updateTimer:", v3);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "addObject:", v8);

}

void __52__COMeshTimerAddOn_handleTimersUpdatedNotification___block_invoke_168(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  void *v4;
  int v5;
  uint64_t v6;
  uint64_t v7;

  v7 = *MEMORY[0x24BDAC8D0];
  COCoreLogForCategory(3);
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    v3 = *(_QWORD *)(a1 + 32);
    v5 = 134217984;
    v6 = v3;
    _os_log_impl(&dword_215E92000, v2, OS_LOG_TYPE_DEFAULT, "%p finished updating local timers", (uint8_t *)&v5, 0xCu);
  }

  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v4, "timerAddOn:didUpdateTimers:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));

}

- (void)handleTimerFiredNotification:(id)a3
{
  void *v4;
  void *v5;
  id v6;

  v6 = a3;
  if (!-[COMeshTimerAddOn performsLocalActions](self, "performsLocalActions"))
  {
    -[COMeshTimerAddOn delegate](self, "delegate");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_opt_respondsToSelector() & 1) != 0)
    {
      objc_msgSend(v6, "timers");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "timerAddOn:didUpdateTimers:", self, v5);

    }
  }

}

- (void)handleTimerFiringTimerDismissedNotification:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  id v7;
  NSObject *v8;
  void *v9;
  uint64_t v10;
  id v11;
  id v12;
  void *v13;
  id v14;
  _QWORD v15[5];
  id v16;
  _QWORD v17[5];
  id v18;
  id v19;

  v4 = a3;
  -[COMeshAddOn meshControllerQueue](self, "meshControllerQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v5);
  objc_msgSend(v4, "timers");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v6, "count"))
  {
    v7 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
    objc_msgSend(MEMORY[0x24BE6B628], "schedulerWithDispatchQueue:", v5);
    v8 = objc_claimAutoreleasedReturnValue();
    -[COMeshTimerAddOn timerManager](self, "timerManager");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = MEMORY[0x24BDAC760];
    v17[0] = MEMORY[0x24BDAC760];
    v17[1] = 3221225472;
    v17[2] = __64__COMeshTimerAddOn_handleTimerFiringTimerDismissedNotification___block_invoke;
    v17[3] = &unk_24D4B2428;
    v17[4] = self;
    v18 = v7;
    v19 = v9;
    v11 = v9;
    v12 = v7;
    objc_msgSend(v6, "enumerateObjectsUsingBlock:", v17);
    objc_msgSend(MEMORY[0x24BE6B608], "combineAllFutures:ignoringErrors:scheduler:", v12, 1, v8);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v15[0] = v10;
    v15[1] = 3221225472;
    v15[2] = __64__COMeshTimerAddOn_handleTimerFiringTimerDismissedNotification___block_invoke_169;
    v15[3] = &unk_24D4B2450;
    v15[4] = self;
    v16 = v6;
    v14 = (id)objc_msgSend(v13, "addSuccessBlock:", v15);

  }
  else
  {
    COCoreLogForCategory(3);
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
      -[COMeshTimerAddOn handleTimerFiringTimerDismissedNotification:].cold.1();
  }

}

void __64__COMeshTimerAddOn_handleTimerFiringTimerDismissedNotification___block_invoke(_QWORD *a1, void *a2)
{
  void *v3;
  NSObject *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  int v10;
  uint64_t v11;
  __int16 v12;
  void *v13;
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(a2, "timerID");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  COCoreLogForCategory(3);
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v5 = a1[4];
    v10 = 134218242;
    v11 = v5;
    v12 = 2112;
    v13 = v3;
    _os_log_impl(&dword_215E92000, v4, OS_LOG_TYPE_DEFAULT, "%p dismissing local timer %@", (uint8_t *)&v10, 0x16u);
  }

  v7 = (void *)a1[5];
  v6 = (void *)a1[6];
  objc_msgSend(v3, "UUIDString");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "dismissTimerWithIdentifier:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "addObject:", v9);

}

void __64__COMeshTimerAddOn_handleTimerFiringTimerDismissedNotification___block_invoke_169(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  void *v4;
  int v5;
  uint64_t v6;
  uint64_t v7;

  v7 = *MEMORY[0x24BDAC8D0];
  COCoreLogForCategory(3);
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    v3 = *(_QWORD *)(a1 + 32);
    v5 = 134217984;
    v6 = v3;
    _os_log_impl(&dword_215E92000, v2, OS_LOG_TYPE_DEFAULT, "%p finished dismissing local timers", (uint8_t *)&v5, 0xCu);
  }

  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v4, "timerAddOn:didDismissTimers:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));

}

- (void)handleTimerManagerStateResetNotification:(id)a3
{
  NSObject *v4;
  void *v5;

  COCoreLogForCategory(3);
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
    -[COMeshTimerAddOn handleTimerManagerStateResetNotification:].cold.1(self, v4);

  -[COMeshTimerAddOn delegate](self, "delegate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v5, "didResetTimerAddOn:", self);

}

- (void)timersAsAccessory:(id)a3 fromClient:(id)a4 withCallback:(id)a5
{
  id v8;
  id v9;
  id v10;
  NSObject *v11;
  _BOOL8 v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  id v17;
  id v18;
  id v19;
  id v20;
  _QWORD v21[4];
  id v22;
  _QWORD *v23;
  _QWORD v24[4];
  id v25;
  _QWORD *v26;
  _QWORD v27[5];
  id v28;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  COCoreLogForCategory(3);
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
    -[COMeshTimerAddOn timersAsAccessory:fromClient:withCallback:].cold.1(self);

  if (v8)
  {
    v12 = 0;
LABEL_5:
    -[COMeshTimerAddOn secondaryClusterMemberIfRequiredForAccessory:](self, "secondaryClusterMemberIfRequiredForAccessory:", v8);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    goto LABEL_6;
  }
  v12 = -[COMeshTimerAddOn performsLocalActions](self, "performsLocalActions");
  -[COMeshTimerAddOn _currentAccessoryForClient:](self, "_currentAccessoryForClient:", v9);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  if (v13)
  {
    v8 = (id)objc_msgSend(objc_alloc(MEMORY[0x24BE19E38]), "initWithHomeKitAccessory:", v13);

    if (v8)
      goto LABEL_5;
    v13 = 0;
  }
  else
  {
    v8 = 0;
  }
LABEL_6:
  v27[0] = 0;
  v27[1] = v27;
  v27[2] = 0x3032000000;
  v27[3] = __Block_byref_object_copy__11;
  v27[4] = __Block_byref_object_dispose__11;
  v28 = (id)os_transaction_create();
  if (v13)
  {
    -[COMeshTimerAddOn _timersForAccessory:member:](self, "_timersForAccessory:member:", v8, v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    objc_msgSend(v8, "uniqueIdentifier");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[COMeshTimerAddOn _timersForAccessoryIdentifier:allowLocalStorage:](self, "_timersForAccessoryIdentifier:allowLocalStorage:", v15, v12);
    v14 = (void *)objc_claimAutoreleasedReturnValue();

  }
  v16 = MEMORY[0x24BDAC760];
  v24[0] = MEMORY[0x24BDAC760];
  v24[1] = 3221225472;
  v24[2] = __62__COMeshTimerAddOn_timersAsAccessory_fromClient_withCallback___block_invoke;
  v24[3] = &unk_24D4B1E80;
  v17 = v10;
  v25 = v17;
  v26 = v27;
  v18 = (id)objc_msgSend(v14, "addFailureBlock:", v24);
  v21[0] = v16;
  v21[1] = 3221225472;
  v21[2] = __62__COMeshTimerAddOn_timersAsAccessory_fromClient_withCallback___block_invoke_2;
  v21[3] = &unk_24D4B24A0;
  v19 = v17;
  v22 = v19;
  v23 = v27;
  v20 = (id)objc_msgSend(v14, "addSuccessBlock:", v21);

  _Block_object_dispose(v27, 8);
}

void __62__COMeshTimerAddOn_timersAsAccessory_fromClient_withCallback___block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;

  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  v2 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v3 = *(void **)(v2 + 40);
  *(_QWORD *)(v2 + 40) = 0;

}

void __62__COMeshTimerAddOn_timersAsAccessory_fromClient_withCallback___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  void *v6;

  v3 = a2;
  COCoreLogForCategory(3);
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
    __62__COMeshTimerAddOn_timersAsAccessory_fromClient_withCallback___block_invoke_2_cold_1();

  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  v5 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v6 = *(void **)(v5 + 40);
  *(_QWORD *)(v5 + 40) = 0;

}

- (void)timersForAccessories:(id)a3 fromClient:(id)a4 callback:(id)a5
{
  id v8;
  id v9;
  void *v10;
  NSObject *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  id v18;
  id v19;
  id v20;
  id v21;
  NSObject *v22;
  id v23;
  id v24;
  id v25;
  id v26;
  id v27;
  id v28;
  _QWORD block[4];
  id v30;
  COMeshTimerAddOn *v31;
  id v32;
  id v33;
  id v34;
  id v35;
  _QWORD *v36;
  _QWORD v37[5];
  id v38;
  _QWORD v39[4];
  id v40;
  id v41;
  COMeshTimerAddOn *v42;
  id v43;
  id v44;

  v28 = a3;
  v8 = a4;
  v9 = a5;
  -[COMeshAddOn meshController](self, "meshController");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  COCoreLogForCategory(3);
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
    -[COMeshTimerAddOn timersForAccessories:fromClient:callback:].cold.1((uint64_t)v10, v28, v11);

  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[COMeshAddOn meshController](self, "meshController");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "nodeManager");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "activeNodesWithSelfNode:", 1);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  v17 = MEMORY[0x24BDAC760];
  v39[0] = MEMORY[0x24BDAC760];
  v39[1] = 3221225472;
  v39[2] = __61__COMeshTimerAddOn_timersForAccessories_fromClient_callback___block_invoke;
  v39[3] = &unk_24D4B24C8;
  v18 = v16;
  v40 = v18;
  v19 = v12;
  v41 = v19;
  v42 = self;
  v20 = v13;
  v43 = v20;
  v21 = v10;
  v44 = v21;
  objc_msgSend(v28, "enumerateObjectsUsingBlock:", v39);
  v37[0] = 0;
  v37[1] = v37;
  v37[2] = 0x3032000000;
  v37[3] = __Block_byref_object_copy__11;
  v37[4] = __Block_byref_object_dispose__11;
  v38 = (id)os_transaction_create();
  objc_msgSend(v21, "dispatchQueue");
  v22 = objc_claimAutoreleasedReturnValue();
  block[0] = v17;
  block[1] = 3221225472;
  block[2] = __61__COMeshTimerAddOn_timersForAccessories_fromClient_callback___block_invoke_173;
  block[3] = &unk_24D4B2540;
  v30 = v19;
  v31 = self;
  v32 = v8;
  v33 = v20;
  v34 = v21;
  v35 = v9;
  v36 = v37;
  v23 = v9;
  v24 = v21;
  v25 = v20;
  v26 = v8;
  v27 = v19;
  dispatch_async(v22, block);

  _Block_object_dispose(v37, 8);
}

void __61__COMeshTimerAddOn_timersForAccessories_fromClient_callback___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  NSObject *v9;
  uint64_t v10;
  int v11;
  uint64_t v12;
  __int16 v13;
  id v14;
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  objc_msgSend(v3, "categoryType");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "IDSIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v4, "isEqualToString:", *MEMORY[0x24BDD49E0])
    || (COMeshNodeForIDSIdentifier(*(void **)(a1 + 32), v5),
        v6 = (void *)objc_claimAutoreleasedReturnValue(),
        v6,
        v6))
  {
    v7 = *(void **)(a1 + 40);
LABEL_4:
    objc_msgSend(v7, "addObject:", v3);
    goto LABEL_5;
  }
  objc_msgSend(*(id *)(a1 + 48), "secondaryClusterMemberForAccessory:", v3);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    v7 = *(void **)(a1 + 56);
    goto LABEL_4;
  }
  COCoreLogForCategory(3);
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    v10 = *(_QWORD *)(a1 + 64);
    v11 = 134218242;
    v12 = v10;
    v13 = 2112;
    v14 = v3;
    _os_log_impl(&dword_215E92000, v9, OS_LOG_TYPE_DEFAULT, "%p not getting timers for %@, accessory unavailable", (uint8_t *)&v11, 0x16u);
  }

LABEL_5:
}

void __61__COMeshTimerAddOn_timersForAccessories_fromClient_callback___block_invoke_173(uint64_t a1)
{
  id v2;
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  id v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  id v15;
  id v16;
  id v17;
  uint64_t v18;
  id v19;
  _QWORD v20[4];
  id v21;
  uint64_t v22;
  _QWORD v23[4];
  id v24;
  id v25;
  uint64_t v26;
  _QWORD v27[4];
  id v28;
  uint64_t v29;
  id v30;

  v2 = objc_alloc_init(MEMORY[0x24BDBCED8]);
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(*(id *)(a1 + 32), "count"))
  {
    objc_msgSend(*(id *)(a1 + 40), "_timersForAccessories:fromClient:results:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 48), v2);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "addObject:", v4);

  }
  v5 = objc_msgSend(*(id *)(a1 + 56), "count");
  v6 = MEMORY[0x24BDAC760];
  if (v5)
  {
    v7 = *(void **)(a1 + 56);
    v27[0] = MEMORY[0x24BDAC760];
    v27[1] = 3221225472;
    v27[2] = __61__COMeshTimerAddOn_timersForAccessories_fromClient_callback___block_invoke_2;
    v27[3] = &unk_24D4B20C0;
    v8 = v3;
    v9 = *(_QWORD *)(a1 + 40);
    v28 = v8;
    v29 = v9;
    v30 = v2;
    objc_msgSend(v7, "enumerateObjectsUsingBlock:", v27);

  }
  v10 = (void *)MEMORY[0x24BE6B628];
  objc_msgSend(*(id *)(a1 + 64), "dispatchQueue");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "schedulerWithDispatchQueue:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BE6B608], "combineAllFutures:ignoringErrors:scheduler:", v3, 1, v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v23[0] = v6;
  v23[1] = 3221225472;
  v23[2] = __61__COMeshTimerAddOn_timersForAccessories_fromClient_callback___block_invoke_5;
  v23[3] = &unk_24D4B2518;
  v14 = *(id *)(a1 + 72);
  v24 = v2;
  v25 = v14;
  v26 = *(_QWORD *)(a1 + 80);
  v15 = v2;
  v16 = (id)objc_msgSend(v13, "addSuccessBlock:", v23);
  v20[0] = v6;
  v20[1] = 3221225472;
  v20[2] = __61__COMeshTimerAddOn_timersForAccessories_fromClient_callback___block_invoke_6;
  v20[3] = &unk_24D4B1E80;
  v17 = *(id *)(a1 + 72);
  v18 = *(_QWORD *)(a1 + 80);
  v21 = v17;
  v22 = v18;
  v19 = (id)objc_msgSend(v13, "addFailureBlock:", v20);

}

void __61__COMeshTimerAddOn_timersForAccessories_fromClient_callback___block_invoke_2(id *a1, void *a2)
{
  id v3;
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  id v8;
  id v9;
  id v10;
  id v11;
  id v12;
  _QWORD v13[4];
  id v14;
  _QWORD v15[4];
  id v16;
  id v17;
  id v18;

  v3 = a2;
  v4 = objc_alloc_init(MEMORY[0x24BE6B608]);
  objc_msgSend(a1[4], "addObject:", v4);
  objc_msgSend(a1[5], "secondaryClusterMemberForAccessory:", v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1[5], "_timersForAccessory:member:", v3, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = MEMORY[0x24BDAC760];
  v15[0] = MEMORY[0x24BDAC760];
  v15[1] = 3221225472;
  v15[2] = __61__COMeshTimerAddOn_timersForAccessories_fromClient_callback___block_invoke_3;
  v15[3] = &unk_24D4B24F0;
  v16 = a1[6];
  v17 = v3;
  v8 = v4;
  v18 = v8;
  v9 = v3;
  v10 = (id)objc_msgSend(v6, "addSuccessBlock:", v15);
  v13[0] = v7;
  v13[1] = 3221225472;
  v13[2] = __61__COMeshTimerAddOn_timersForAccessories_fromClient_callback___block_invoke_4;
  v13[3] = &unk_24D4B0D00;
  v14 = v8;
  v11 = v8;
  v12 = (id)objc_msgSend(v6, "addFailureBlock:", v13);

}

uint64_t __61__COMeshTimerAddOn_timersForAccessories_fromClient_callback___block_invoke_3(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;

  if (a2)
    v3 = a2;
  else
    v3 = (void *)MEMORY[0x24BDBD1A8];
  v4 = *(void **)(a1 + 32);
  v5 = *(void **)(a1 + 40);
  v6 = a2;
  objc_msgSend(v5, "uniqueIdentifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKey:", v3, v7);

  return objc_msgSend(*(id *)(a1 + 48), "finishWithNoResult");
}

uint64_t __61__COMeshTimerAddOn_timersForAccessories_fromClient_callback___block_invoke_4(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "finishWithError:", a2);
}

void __61__COMeshTimerAddOn_timersForAccessories_fromClient_callback___block_invoke_5(uint64_t a1)
{
  uint64_t v2;
  void *v3;

  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  v2 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v3 = *(void **)(v2 + 40);
  *(_QWORD *)(v2 + 40) = 0;

}

void __61__COMeshTimerAddOn_timersForAccessories_fromClient_callback___block_invoke_6(uint64_t a1)
{
  uint64_t v2;
  void *v3;

  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  v2 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v3 = *(void **)(v2 + 40);
  *(_QWORD *)(v2 + 40) = 0;

}

- (void)addTimer:(id)a3 asAccessory:(id)a4 fromClient:(id)a5 withCallback:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  NSObject *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  COCoreLogForCategory(3);
  v14 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
    -[COMeshTimerAddOn addTimer:asAccessory:fromClient:withCallback:].cold.1();

  objc_msgSend(v10, "siriContext");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "objectForKey:", *MEMORY[0x24BE19DE0]);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  if (v11)
  {
    -[COMeshTimerAddOn secondaryClusterMemberIfRequiredForAccessory:](self, "secondaryClusterMemberIfRequiredForAccessory:", v11);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v17 = 0;
  }
  -[COMeshTimerAddOn addTimer:client:member:](self, "addTimer:client:member:", v10, v12, v17);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  -[COMeshTimerAddOn _addCompletionsToFuture:withXPCCallback:transactionDescription:](self, "_addCompletionsToFuture:withXPCCallback:transactionDescription:", v18, v13, "com.apple.CoordinationCore.timers.create");

}

- (void)updateTimer:(id)a3 asAccessory:(id)a4 fromClient:(id)a5 withCallback:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  NSObject *v14;
  void *v15;
  void *v16;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  COCoreLogForCategory(3);
  v14 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
    -[COMeshTimerAddOn updateTimer:asAccessory:fromClient:withCallback:].cold.1();

  if (v11)
  {
    -[COMeshTimerAddOn secondaryClusterMemberIfRequiredForAccessory:](self, "secondaryClusterMemberIfRequiredForAccessory:", v11);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v15 = 0;
  }
  -[COMeshTimerAddOn updateTimer:client:member:](self, "updateTimer:client:member:", v10, v12, v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  -[COMeshTimerAddOn _addCompletionsToFuture:withXPCCallback:transactionDescription:](self, "_addCompletionsToFuture:withXPCCallback:transactionDescription:", v16, v13, "com.apple.CoordinationCore.timers.update");

}

- (void)removeTimer:(id)a3 asAccessory:(id)a4 fromClient:(id)a5 withCallback:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  NSObject *v14;
  void *v15;
  void *v16;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  COCoreLogForCategory(3);
  v14 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
    -[COMeshTimerAddOn removeTimer:asAccessory:fromClient:withCallback:].cold.1();

  if (v11)
  {
    -[COMeshTimerAddOn secondaryClusterMemberIfRequiredForAccessory:](self, "secondaryClusterMemberIfRequiredForAccessory:", v11);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v15 = 0;
  }
  -[COMeshTimerAddOn removeTimer:client:member:](self, "removeTimer:client:member:", v10, v12, v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  -[COMeshTimerAddOn _addCompletionsToFuture:withXPCCallback:transactionDescription:](self, "_addCompletionsToFuture:withXPCCallback:transactionDescription:", v16, v13, "com.apple.CoordinationCore.timers.delete");

}

- (void)dismissTimerWithIdentifier:(id)a3 fromClient:(id)a4 withCallback:(id)a5
{
  id v7;
  id v8;
  NSObject *v9;
  void *v10;

  v7 = a3;
  v8 = a5;
  COCoreLogForCategory(3);
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
    -[COMeshTimerAddOn dismissTimerWithIdentifier:fromClient:withCallback:].cold.1();

  -[COMeshTimerAddOn dismissTimerWithIdentifier:](self, "dismissTimerWithIdentifier:", v7);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[COMeshTimerAddOn _addCompletionsToFuture:withXPCCallback:transactionDescription:](self, "_addCompletionsToFuture:withXPCCallback:transactionDescription:", v10, v8, "com.apple.CoordinationCore.timers.dismiss");

}

- (void)canDispatchAsAccessory:(id)a3 asInstance:(id)a4 reply:(id)a5
{
  id v8;
  id v9;
  id v10;
  NSObject *v11;
  id v12;
  id v13;
  id v14;
  _QWORD v15[4];
  id v16;
  COMeshTimerAddOn *v17;
  id v18;
  id v19;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  -[COMeshAddOn meshControllerQueue](self, "meshControllerQueue");
  v11 = objc_claimAutoreleasedReturnValue();
  v15[0] = MEMORY[0x24BDAC760];
  v15[1] = 3221225472;
  v15[2] = __60__COMeshTimerAddOn_canDispatchAsAccessory_asInstance_reply___block_invoke;
  v15[3] = &unk_24D4B0EC8;
  v16 = v8;
  v17 = self;
  v18 = v9;
  v19 = v10;
  v12 = v10;
  v13 = v9;
  v14 = v8;
  dispatch_async(v11, v15);

}

void __60__COMeshTimerAddOn_canDispatchAsAccessory_asInstance_reply___block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  void *v4;
  NSObject *v5;
  uint64_t v6;
  void *v7;
  NSObject *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  NSObject *v13;
  void *v14;
  uint64_t v15;
  NSObject *j;
  void *v17;
  uint64_t v18;
  NSObject *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  void *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t i;
  void *v31;
  char v32;
  void *v33;
  NSObject *v34;
  uint64_t v35;
  void *v36;
  const char *v37;
  uint64_t v38;
  uint64_t v39;
  void *v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  uint8_t buf[4];
  uint64_t v50;
  __int16 v51;
  void *v52;
  __int16 v53;
  uint64_t v54;
  __int16 v55;
  uint64_t v56;
  __int16 v57;
  void *v58;
  _BYTE v59[128];
  _BYTE v60[128];
  uint64_t v61;

  v61 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(*(id *)(a1 + 32), "uniqueIdentifier");
  v2 = objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "IDSIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "categoryType");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  COCoreLogForCategory(3);
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v6 = *(_QWORD *)(a1 + 40);
    v7 = *(void **)(a1 + 48);
    *(_DWORD *)buf = 134218754;
    v50 = v6;
    v51 = 2112;
    v52 = v7;
    v53 = 2112;
    v54 = v2;
    v55 = 2112;
    v56 = (uint64_t)v4;
    _os_log_impl(&dword_215E92000, v5, OS_LOG_TYPE_DEFAULT, "%p as %@ checking dispatch for %@ of %@...", buf, 0x2Au);
  }

  if (*(_QWORD *)(a1 + 48) | v2)
  {
    if (objc_msgSend(v4, "isEqualToString:", *MEMORY[0x24BDD49E0]))
    {
      objc_msgSend(*(id *)(a1 + 40), "meshController");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = objc_msgSend(v9, "state");

      objc_msgSend(*(id *)(a1 + 40), "ourInterests");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "objectForKey:", v3);
      v12 = (void *)objc_claimAutoreleasedReturnValue();

      if (v12)
      {
        COCoreLogForCategory(2);
        v8 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
        {
          v39 = *(_QWORD *)(a1 + 32);
          v38 = *(_QWORD *)(a1 + 40);
          *(_DWORD *)buf = 134218498;
          v50 = v38;
          v51 = 2048;
          v52 = v12;
          v53 = 2112;
          v54 = v39;
          _os_log_debug_impl(&dword_215E92000, v8, OS_LOG_TYPE_DEBUG, "%p using interest tracker %p for can dispatch of %@", buf, 0x20u);
        }

        LODWORD(v8) = objc_msgSend(v12, "canDispatchWithPrimary:", v10 == 3);
      }
      else if (v10 == 3)
      {
        v40 = v3;
        COCoreLogForCategory(3);
        v19 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG))
          __60__COMeshTimerAddOn_canDispatchAsAccessory_asInstance_reply___block_invoke_cold_1(a1 + 40, v19, v20, v21, v22, v23, v24, v25);

        v47 = 0u;
        v48 = 0u;
        v45 = 0u;
        v46 = 0u;
        objc_msgSend(*(id *)(a1 + 40), "meshController");
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v26, "nodes");
        v8 = objc_claimAutoreleasedReturnValue();

        v27 = -[NSObject countByEnumeratingWithState:objects:count:](v8, "countByEnumeratingWithState:objects:count:", &v45, v60, 16);
        if (v27)
        {
          v28 = v27;
          v29 = *(_QWORD *)v46;
          while (2)
          {
            for (i = 0; i != v28; ++i)
            {
              if (*(_QWORD *)v46 != v29)
                objc_enumerationMutation(v8);
              objc_msgSend(*(id *)(*((_QWORD *)&v45 + 1) + 8 * i), "IDSIdentifier");
              v31 = (void *)objc_claimAutoreleasedReturnValue();
              v32 = objc_msgSend(v31, "isEqual:", v40);

              if ((v32 & 1) != 0)
              {

                LODWORD(v8) = 1;
                goto LABEL_36;
              }
            }
            v28 = -[NSObject countByEnumeratingWithState:objects:count:](v8, "countByEnumeratingWithState:objects:count:", &v45, v60, 16);
            if (v28)
              continue;
            break;
          }
        }

        objc_msgSend(*(id *)(a1 + 40), "secondaryClusterMemberForAccessory:", *(_QWORD *)(a1 + 32));
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        LODWORD(v8) = v33 != 0;

LABEL_36:
        v3 = v40;
      }
      else
      {
        LODWORD(v8) = 0;
      }
    }
    else
    {
      COCoreLogForCategory(3);
      v13 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
        __60__COMeshTimerAddOn_canDispatchAsAccessory_asInstance_reply___block_invoke_cold_2();

      v43 = 0u;
      v44 = 0u;
      v41 = 0u;
      v42 = 0u;
      objc_msgSend(*(id *)(a1 + 40), "meshController");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "nodes");
      v12 = (void *)objc_claimAutoreleasedReturnValue();

      v8 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v41, v59, 16);
      if (v8)
      {
        v15 = *(_QWORD *)v42;
        while (2)
        {
          for (j = 0; j != v8; j = ((char *)j + 1))
          {
            if (*(_QWORD *)v42 != v15)
              objc_enumerationMutation(v12);
            objc_msgSend(*(id *)(*((_QWORD *)&v41 + 1) + 8 * (_QWORD)j), "remote");
            v17 = (void *)objc_claimAutoreleasedReturnValue();
            v18 = objc_msgSend(v17, "type");

            if (v18 != -1)
            {
              LODWORD(v8) = 1;
              goto LABEL_37;
            }
          }
          v8 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v41, v59, 16);
          if (v8)
            continue;
          break;
        }
      }
    }
LABEL_37:

  }
  else
  {
    LODWORD(v8) = 1;
  }
  COCoreLogForCategory(3);
  v34 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v34, OS_LOG_TYPE_DEFAULT))
  {
    v35 = *(_QWORD *)(a1 + 40);
    v36 = *(void **)(a1 + 48);
    v37 = " not";
    if ((_DWORD)v8)
      v37 = "";
    *(_DWORD *)buf = 134219010;
    v50 = v35;
    v51 = 2112;
    v52 = v36;
    v53 = 2080;
    v54 = (uint64_t)v37;
    v55 = 2112;
    v56 = v2;
    v57 = 2112;
    v58 = v4;
    _os_log_impl(&dword_215E92000, v34, OS_LOG_TYPE_DEFAULT, "%p as %@ can%s dispatch for %@ of %@", buf, 0x34u);
  }

  (*(void (**)(void))(*(_QWORD *)(a1 + 56) + 16))();
}

- (void)establishSecondaryClusterForAccessory:(id)a3
{
  id v4;
  NSObject *v5;
  _QWORD v6[5];
  id v7;
  uint8_t buf[4];
  COMeshTimerAddOn *v9;
  __int16 v10;
  const __CFString *v11;
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  if (objc_msgSend(MEMORY[0x24BE19E30], "isHomeKitUsingAlarmsAndTimersIDSService"))
  {
    COCoreLogForCategory(3);
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134218242;
      v9 = self;
      v10 = 2112;
      v11 = CFSTR("com.apple.private.alloy.alarms-timers");
      _os_log_impl(&dword_215E92000, v5, OS_LOG_TYPE_DEFAULT, "%p HomeKit is making use of IDS Service %@ for timers", buf, 0x16u);
    }

  }
  else
  {
    v6[0] = MEMORY[0x24BDAC760];
    v6[1] = 3221225472;
    v6[2] = __58__COMeshTimerAddOn_establishSecondaryClusterForAccessory___block_invoke;
    v6[3] = &unk_24D4B0858;
    v6[4] = self;
    v7 = v4;
    -[COMeshTimerAddOn _withLock:](self, "_withLock:", v6);

  }
}

void __58__COMeshTimerAddOn_establishSecondaryClusterForAccessory___block_invoke(uint64_t a1)
{
  Class v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  objc_class *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
  if (objc_msgSend(MEMORY[0x24BE19E30], "isGlobalTimersEnabled")
    && !*(_QWORD *)(*(_QWORD *)(a1 + 32) + 80))
  {
    v2 = NSClassFromString(CFSTR("_COClusterRealmHome"));
    v3 = *(void **)(a1 + 40);
    if (v3)
    {
      objc_msgSend(v3, "homeUniqueIdentifier");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      -[objc_class realmWithHomeKitHomeIdentifier:](v2, "realmWithHomeKitHomeIdentifier:", v4);
      v5 = (void *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      -[objc_class realmForCurrent](v2, "realmForCurrent");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
    }
    objc_msgSend(MEMORY[0x24BE19DF8], "configurationWithDomain:requiredServices:options:realm:globalServiceName:", CFSTR("com.apple.alarms-timers"), 12, 0, v5, CFSTR("com.apple.private.alloy.alarms-timers"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BE19DF0], "clusterWithConfiguration:", v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    +[COMTActionDirector directorForCluster:](COMTActionDirector, "directorForCluster:", v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = (void *)MEMORY[0x24BDBCF20];
    v18 = objc_opt_class();
    v19 = objc_opt_class();
    v20 = objc_opt_class();
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v18, 3);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setWithArray:", v10, v18, v19);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    v12 = *(_QWORD *)(a1 + 32);
    v13 = (objc_class *)objc_opt_class();
    NSStringFromClass(v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "meshControllerQueue");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "registerHandler:forType:actions:queue:", v12, v14, v11, v15);

    v16 = *(_QWORD *)(a1 + 32);
    v17 = *(void **)(v16 + 80);
    *(_QWORD *)(v16 + 80) = v8;

  }
}

- (id)secondaryClusterMemberForAccessory:(id)a3
{
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  int v13;
  void *v14;
  id obj;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(a3, "IDSIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v4, "length") && objc_msgSend(MEMORY[0x24BE19E30], "isGlobalMessagingEnabled"))
  {
    v19 = 0u;
    v20 = 0u;
    v17 = 0u;
    v18 = 0u;
    -[COMeshTimerAddOn members](self, "members");
    obj = (id)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
    if (v5)
    {
      v6 = v5;
      v7 = *(_QWORD *)v18;
      while (2)
      {
        for (i = 0; i != v6; ++i)
        {
          if (*(_QWORD *)v18 != v7)
            objc_enumerationMutation(obj);
          v9 = *(void **)(*((_QWORD *)&v17 + 1) + 8 * i);
          objc_msgSend(v9, "member");
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v10, "deviceMetadata");
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v11, "objectForKey:", CFSTR("IDS"));
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          v13 = objc_msgSend(v12, "isEqual:", v4);

          if (v13)
          {
            objc_msgSend(v9, "member");
            v14 = (void *)objc_claimAutoreleasedReturnValue();
            goto LABEL_14;
          }
        }
        v6 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
        if (v6)
          continue;
        break;
      }
    }
    v14 = 0;
LABEL_14:

  }
  else
  {
    v14 = 0;
  }

  return v14;
}

- (id)secondaryClusterMemberIfRequiredForAccessory:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  char v14;
  void *v15;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  objc_msgSend(v4, "categoryType");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v5, "isEqualToString:", *MEMORY[0x24BDD49E0]))
  {
    objc_msgSend(v4, "IDSIdentifier");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = 0u;
    v18 = 0u;
    v19 = 0u;
    v20 = 0u;
    -[COMeshAddOn meshController](self, "meshController", 0);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "nodes");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
    if (v9)
    {
      v10 = v9;
      v11 = *(_QWORD *)v18;
      while (2)
      {
        v12 = 0;
        do
        {
          if (*(_QWORD *)v18 != v11)
            objc_enumerationMutation(v8);
          objc_msgSend(*(id *)(*((_QWORD *)&v17 + 1) + 8 * v12), "IDSIdentifier");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          v14 = objc_msgSend(v13, "isEqual:", v6);

          if ((v14 & 1) != 0)
          {

            v15 = 0;
            goto LABEL_13;
          }
          ++v12;
        }
        while (v10 != v12);
        v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
        if (v10)
          continue;
        break;
      }
    }

    -[COMeshTimerAddOn secondaryClusterMemberForAccessory:](self, "secondaryClusterMemberForAccessory:", v4);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_13:

  }
  else
  {
    v15 = 0;
  }

  return v15;
}

- (void)setInterests:(id)a3 asAccessory:(id)a4 withCallback:(id)a5
{
  id v8;
  id v9;
  id v10;
  NSObject *v11;
  id v12;
  id v13;
  id v14;
  _QWORD v15[4];
  id v16;
  COMeshTimerAddOn *v17;
  id v18;
  id v19;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  -[COMeshAddOn meshControllerQueue](self, "meshControllerQueue");
  v11 = objc_claimAutoreleasedReturnValue();
  v15[0] = MEMORY[0x24BDAC760];
  v15[1] = 3221225472;
  v15[2] = __58__COMeshTimerAddOn_setInterests_asAccessory_withCallback___block_invoke;
  v15[3] = &unk_24D4B2568;
  v16 = v9;
  v17 = self;
  v18 = v8;
  v19 = v10;
  v12 = v8;
  v13 = v10;
  v14 = v9;
  dispatch_async(v11, v15);

}

void __58__COMeshTimerAddOn_setInterests_asAccessory_withCallback___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  COInterestTracker *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  NSObject *v11;
  uint64_t v12;
  uint64_t v13;
  NSObject *v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  void *v18;
  NSObject *v19;
  int v20;
  uint64_t v21;
  __int16 v22;
  COInterestTracker *v23;
  __int16 v24;
  uint64_t v25;
  uint64_t v26;

  v26 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(*(id *)(a1 + 32), "IDSIdentifier");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (v2)
  {
    objc_msgSend(*(id *)(a1 + 40), "ourInterests");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "objectForKey:", v2);
    v4 = (COInterestTracker *)objc_claimAutoreleasedReturnValue();

    if (!v4)
    {
      objc_msgSend(*(id *)(a1 + 40), "meshController");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "nodes");
      v6 = (void *)objc_claimAutoreleasedReturnValue();

      COMeshNodeForIDSIdentifier(v6, v2);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 40), "secondaryClusterMemberForAccessory:", *(_QWORD *)(a1 + 32));
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v4 = -[COInterestTracker initWithAccessory:delegate:primaryAvailable:secondary:]([COInterestTracker alloc], "initWithAccessory:delegate:primaryAvailable:secondary:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40), v7 != 0, v8);
      objc_msgSend(*(id *)(a1 + 40), "ourInterests");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = (void *)objc_msgSend(v9, "mutableCopy");

      objc_msgSend(v10, "setObject:forKey:", v4, v2);
      objc_msgSend(*(id *)(a1 + 40), "setOurInterests:", v10);
      COCoreLogForCategory(3);
      v11 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      {
        v13 = *(_QWORD *)(a1 + 32);
        v12 = *(_QWORD *)(a1 + 40);
        v20 = 134218498;
        v21 = v12;
        v22 = 2048;
        v23 = v4;
        v24 = 2112;
        v25 = v13;
        _os_log_impl(&dword_215E92000, v11, OS_LOG_TYPE_DEFAULT, "%p using %p to track our interests for accessory %@", (uint8_t *)&v20, 0x20u);
      }

    }
    -[COInterestTracker setInterests:](v4, "setInterests:", *(_QWORD *)(a1 + 48));
    if (!objc_msgSend(*(id *)(a1 + 48), "count"))
    {
      COCoreLogForCategory(3);
      v14 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
      {
        v16 = *(_QWORD *)(a1 + 32);
        v15 = *(_QWORD *)(a1 + 40);
        v20 = 134218498;
        v21 = v15;
        v22 = 2048;
        v23 = v4;
        v24 = 2112;
        v25 = v16;
        _os_log_impl(&dword_215E92000, v14, OS_LOG_TYPE_DEFAULT, "%p removing tracker %p for accessory %@", (uint8_t *)&v20, 0x20u);
      }

      objc_msgSend(*(id *)(a1 + 40), "ourInterests");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = (void *)objc_msgSend(v17, "mutableCopy");

      objc_msgSend(v18, "removeObjectForKey:", v2);
      objc_msgSend(*(id *)(a1 + 40), "setOurInterests:", v18);

    }
    (*(void (**)(void))(*(_QWORD *)(a1 + 56) + 16))();

  }
  else
  {
    COCoreLogForCategory(3);
    v19 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
      __58__COMeshTimerAddOn_setInterests_asAccessory_withCallback___block_invoke_cold_1();

    (*(void (**)(void))(*(_QWORD *)(a1 + 56) + 16))();
  }

}

- (void)interestTracker:(id)a3 setInterests:(id)a4 forMember:(id)a5 callback:(id)a6
{
  id v10;
  id v11;
  id v12;
  NSObject *v13;
  objc_class *v14;
  void *v15;
  void *v16;
  void *v17;
  NSObject *v18;
  uint64_t v19;
  id v20;
  id v21;
  id v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  id v27;
  id v28;
  id v29;
  _QWORD v30[4];
  id v31;
  id v32;
  _QWORD v33[4];
  id v34;
  id v35;
  id v36;
  id v37;
  uint8_t buf[4];
  COMeshTimerAddOn *v39;
  __int16 v40;
  id v41;
  __int16 v42;
  void *v43;
  __int16 v44;
  id v45;
  uint64_t v46;

  v46 = *MEMORY[0x24BDAC8D0];
  v10 = a3;
  v11 = a4;
  v29 = a5;
  v12 = a6;
  -[COMeshAddOn meshControllerQueue](self, "meshControllerQueue");
  v13 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v13);

  v14 = (objc_class *)objc_opt_class();
  NSStringFromClass(v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "allObjects");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  +[COMTUpdateInterestAction actionWithTargetType:targetIdentifiers:](COMTUpdateInterestAction, "actionWithTargetType:targetIdentifiers:", v15, v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  COCoreLogForCategory(3);
  v18 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134218754;
    v39 = self;
    v40 = 2048;
    v41 = v10;
    v42 = 2114;
    v43 = v17;
    v44 = 2114;
    v45 = v11;
    _os_log_impl(&dword_215E92000, v18, OS_LOG_TYPE_DEFAULT, "%p setting interests for tracker %p via %{public}@ to %{public}@", buf, 0x2Au);
  }

  objc_initWeak((id *)buf, self);
  v19 = MEMORY[0x24BDAC760];
  v33[0] = MEMORY[0x24BDAC760];
  v33[1] = 3221225472;
  v33[2] = __68__COMeshTimerAddOn_interestTracker_setInterests_forMember_callback___block_invoke;
  v33[3] = &unk_24D4B2590;
  objc_copyWeak(&v37, (id *)buf);
  v20 = v10;
  v34 = v20;
  v21 = v17;
  v35 = v21;
  v22 = v12;
  v36 = v22;
  v23 = (void *)MEMORY[0x2199F3D40](v33);
  -[COMeshAddOn meshControllerQueue](self, "meshControllerQueue");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  -[COMeshTimerAddOn actionDirector](self, "actionDirector");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBCF20], "setWithObject:", v29);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  v30[0] = v19;
  v30[1] = 3221225472;
  v30[2] = __68__COMeshTimerAddOn_interestTracker_setInterests_forMember_callback___block_invoke_189;
  v30[3] = &unk_24D4B25B8;
  v27 = v24;
  v31 = v27;
  v28 = v23;
  v32 = v28;
  objc_msgSend(v25, "requestAction:members:activity:withCompletion:", v21, v26, 0, v30);

  objc_destroyWeak(&v37);
  objc_destroyWeak((id *)buf);

}

void __68__COMeshTimerAddOn_interestTracker_setInterests_forMember_callback___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id WeakRetained;
  NSObject *v5;
  NSObject *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  int v12;
  id v13;
  __int16 v14;
  uint64_t v15;
  __int16 v16;
  uint64_t v17;
  __int16 v18;
  id v19;
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  if (WeakRetained)
  {
    COCoreLogForCategory(3);
    v5 = objc_claimAutoreleasedReturnValue();
    v6 = v5;
    if (v3)
    {
      if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      {
        v7 = *(_QWORD *)(a1 + 32);
        v8 = *(_QWORD *)(a1 + 40);
        v12 = 134218754;
        v13 = WeakRetained;
        v14 = 2048;
        v15 = v7;
        v16 = 2048;
        v17 = v8;
        v18 = 2112;
        v19 = v3;
        _os_log_error_impl(&dword_215E92000, v6, OS_LOG_TYPE_ERROR, "%p failed to set interests for tracker %p via %p: %@", (uint8_t *)&v12, 0x2Au);
      }
    }
    else if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      v9 = *(_QWORD *)(a1 + 32);
      v10 = *(_QWORD *)(a1 + 40);
      v12 = 134218496;
      v13 = WeakRetained;
      v14 = 2048;
      v15 = v9;
      v16 = 2048;
      v17 = v10;
      _os_log_impl(&dword_215E92000, v6, OS_LOG_TYPE_DEFAULT, "%p successfully set interests for tracker %p via %p", (uint8_t *)&v12, 0x20u);
    }

    (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
    objc_msgSend(WeakRetained, "delegate");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_opt_respondsToSelector() & 1) != 0)
      objc_msgSend(v11, "didChangeCompositionForTimerAddOn:", WeakRetained);

  }
}

void __68__COMeshTimerAddOn_interestTracker_setInterests_forMember_callback___block_invoke_189(uint64_t a1, uint64_t a2, void *a3)
{
  id v4;
  NSObject *v5;
  id v6;
  id v7;
  _QWORD v8[4];
  id v9;
  id v10;

  v4 = a3;
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __68__COMeshTimerAddOn_interestTracker_setInterests_forMember_callback___block_invoke_2;
  v8[3] = &unk_24D4B0B68;
  v5 = *(NSObject **)(a1 + 32);
  v6 = *(id *)(a1 + 40);
  v9 = v4;
  v10 = v6;
  v7 = v4;
  dispatch_async(v5, v8);

}

uint64_t __68__COMeshTimerAddOn_interestTracker_setInterests_forMember_callback___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));
}

- (void)interestTrackerTriggerReset:(id)a3
{
  id v4;
  NSObject *v5;
  NSObject *v6;
  void *v7;
  void *v8;
  void *v9;

  v4 = a3;
  -[COMeshAddOn meshControllerQueue](self, "meshControllerQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v5);

  COCoreLogForCategory(3);
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
    -[COMeshTimerAddOn handleTimerManagerStateResetNotification:].cold.1(self, v6);

  -[COMeshTimerAddOn delegate](self, "delegate");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(v4, "accessory");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "uniqueIdentifier");
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v7, "timerAddOn:resetAccesory:", self, v9);
  }

}

- (void)director:(id)a3 membersChanged:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  NSObject *v19;
  id v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  id v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  _BYTE v52[128];
  uint8_t v53[128];
  uint8_t buf[4];
  COMeshTimerAddOn *v55;
  __int16 v56;
  void *v57;
  _BYTE v58[128];
  uint64_t v59;

  v59 = *MEMORY[0x24BDAC8D0];
  v5 = a4;
  -[COMeshTimerAddOn members](self, "members");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(v6, "mutableCopy");

  objc_msgSend(v7, "minusSet:", v5);
  -[COMeshTimerAddOn setMembers:](self, "setMembers:", v5);
  -[COMeshTimerAddOn interests](self, "interests");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "allKeys");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (void *)objc_msgSend(v9, "mutableCopy");

  v50 = 0u;
  v51 = 0u;
  v48 = 0u;
  v49 = 0u;
  v11 = v5;
  v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v48, v58, 16);
  if (v12)
  {
    v13 = v12;
    v14 = *(_QWORD *)v49;
    do
    {
      v15 = 0;
      do
      {
        if (*(_QWORD *)v49 != v14)
          objc_enumerationMutation(v11);
        objc_msgSend(*(id *)(*((_QWORD *)&v48 + 1) + 8 * v15), "member");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "removeObject:", v16);

        ++v15;
      }
      while (v13 != v15);
      v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v48, v58, 16);
    }
    while (v13);
  }

  if (objc_msgSend(v10, "count"))
  {
    -[COMeshTimerAddOn interests](self, "interests");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = (void *)objc_msgSend(v17, "mutableCopy");

    objc_msgSend(v18, "removeObjectsForKeys:", v10);
    -[COMeshTimerAddOn setInterests:](self, "setInterests:", v18);
    COCoreLogForCategory(3);
    v19 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134218242;
      v55 = self;
      v56 = 2112;
      v57 = v10;
      _os_log_impl(&dword_215E92000, v19, OS_LOG_TYPE_DEFAULT, "%p removing interests for %@", buf, 0x16u);
    }

  }
  v46 = 0u;
  v47 = 0u;
  v44 = 0u;
  v45 = 0u;
  v20 = v7;
  v21 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v44, v53, 16);
  if (v21)
  {
    v22 = v21;
    v23 = *(_QWORD *)v45;
    do
    {
      v24 = 0;
      do
      {
        if (*(_QWORD *)v45 != v23)
          objc_enumerationMutation(v20);
        objc_msgSend(*(id *)(*((_QWORD *)&v44 + 1) + 8 * v24), "member");
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v25, "IDSIdentifier");
        v26 = (void *)objc_claimAutoreleasedReturnValue();

        -[COMeshTimerAddOn ourInterests](self, "ourInterests");
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v27, "objectForKey:", v26);
        v28 = (void *)objc_claimAutoreleasedReturnValue();

        if (v28)
          objc_msgSend(v28, "setSecondary:", 0);

        ++v24;
      }
      while (v22 != v24);
      v22 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v44, v53, 16);
    }
    while (v22);
  }
  v39 = v20;

  v42 = 0u;
  v43 = 0u;
  v40 = 0u;
  v41 = 0u;
  v29 = v11;
  v30 = objc_msgSend(v29, "countByEnumeratingWithState:objects:count:", &v40, v52, 16);
  if (v30)
  {
    v31 = v30;
    v32 = *(_QWORD *)v41;
    do
    {
      v33 = 0;
      do
      {
        if (*(_QWORD *)v41 != v32)
          objc_enumerationMutation(v29);
        objc_msgSend(*(id *)(*((_QWORD *)&v40 + 1) + 8 * v33), "member");
        v34 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v34, "IDSIdentifier");
        v35 = (void *)objc_claimAutoreleasedReturnValue();
        -[COMeshTimerAddOn ourInterests](self, "ourInterests");
        v36 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v36, "objectForKey:", v35);
        v37 = (void *)objc_claimAutoreleasedReturnValue();

        if (v37)
          objc_msgSend(v37, "setSecondary:", v34);

        ++v33;
      }
      while (v31 != v33);
      v31 = objc_msgSend(v29, "countByEnumeratingWithState:objects:count:", &v40, v52, 16);
    }
    while (v31);
  }

  -[COMeshTimerAddOn delegate](self, "delegate");
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v38, "didChangeCompositionForTimerAddOn:", self);

}

- (void)director:(id)a3 performAction:(id)a4 from:(id)a5 callback:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  void *v14;
  id v15;
  COTimerCreateRequest *v16;
  void *v17;
  COTimerUpdateRequest *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  COTimerReadRequest *v24;
  id v25;
  COTimerUpdateRequest *v26;
  void *v27;
  void *v28;
  void *v29;
  COMTResult *v30;
  COMTResult *v31;
  _QWORD v32[4];
  id v33;
  id v34;
  _QWORD v35[4];
  id v36;
  id v37;
  _QWORD v38[4];
  id v39;
  id v40;
  id v41;
  id location;
  _QWORD v43[4];
  id v44;
  id v45;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  objc_msgSend(v11, "actionIdentifier");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v18 = (COTimerUpdateRequest *)v11;
      -[COTimerUpdateRequest memento](v18, "memento");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "uniqueIdentifier");
      v21 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v21)
      {
        -[COMeshTimerAddOn homekit](self, "homekit");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v22, "currentAccessory");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v23, "uniqueIdentifier");
        v21 = (void *)objc_claimAutoreleasedReturnValue();

      }
      v24 = -[COTimerReadRequest initWithAccessoryUniqueIdentifier:]([COTimerReadRequest alloc], "initWithAccessoryUniqueIdentifier:", v21);
      objc_initWeak(&location, self);
      v38[0] = MEMORY[0x24BDAC760];
      v38[1] = 3221225472;
      v38[2] = __57__COMeshTimerAddOn_director_performAction_from_callback___block_invoke_2;
      v38[3] = &unk_24D4B2608;
      v40 = v13;
      objc_copyWeak(&v41, &location);
      v39 = v14;
      -[COMeshTimerAddOn handleTimerReadRequest:callback:](self, "handleTimerReadRequest:callback:", v24, v38);

      objc_destroyWeak(&v41);
      objc_destroyWeak(&location);
    }
    else
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v25 = v11;
        v26 = [COTimerUpdateRequest alloc];
        objc_msgSend(v25, "timer");
        v27 = (void *)objc_claimAutoreleasedReturnValue();

        v18 = -[COTimerRequest initWithTimer:](v26, "initWithTimer:", v27);
        v35[0] = MEMORY[0x24BDAC760];
        v35[1] = 3221225472;
        v35[2] = __57__COMeshTimerAddOn_director_performAction_from_callback___block_invoke_3;
        v35[3] = &unk_24D4B25E0;
        v36 = v14;
        v37 = v13;
        -[COMeshTimerAddOn handleTimerUpdateRequest:callback:](self, "handleTimerUpdateRequest:callback:", v18, v35);

        v19 = v36;
        goto LABEL_3;
      }
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        objc_msgSend(v11, "targetIdentifier");
        v18 = (COTimerUpdateRequest *)objc_claimAutoreleasedReturnValue();
        v21 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BE67868]), "initWithIdentifier:", v18);
        v24 = -[COTimerRequest initWithTimer:]([COTimerDeleteRequest alloc], "initWithTimer:", v21);
        v32[0] = MEMORY[0x24BDAC760];
        v32[1] = 3221225472;
        v32[2] = __57__COMeshTimerAddOn_director_performAction_from_callback___block_invoke_4;
        v32[3] = &unk_24D4B25E0;
        v33 = v14;
        v34 = v13;
        -[COMeshTimerAddOn handleTimerDeleteRequest:callback:](self, "handleTimerDeleteRequest:callback:", v24, v32);

      }
      else
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          objc_msgSend(v11, "targetIdentifiers");
          v18 = (COTimerUpdateRequest *)objc_claimAutoreleasedReturnValue();
          -[COMeshTimerAddOn interests](self, "interests");
          v28 = (void *)objc_claimAutoreleasedReturnValue();
          v21 = (void *)objc_msgSend(v28, "mutableCopy");

          if (-[COTimerUpdateRequest count](v18, "count"))
            objc_msgSend(v21, "setObject:forKey:", v18, v12);
          else
            objc_msgSend(v21, "removeObjectForKey:", v12);
          -[COMeshTimerAddOn setInterests:](self, "setInterests:", v21);
          v30 = -[COMTResult initWithActionIdentifier:]([COMTResult alloc], "initWithActionIdentifier:", v14);
          (*((void (**)(id, COMTResult *, _QWORD))v13 + 2))(v13, v30, 0);

          goto LABEL_13;
        }
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
          goto LABEL_15;
        v18 = (COTimerUpdateRequest *)v11;
        -[COMeshTimerAddOn delegate](self, "delegate");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        -[COTimerUpdateRequest reason](v18, "reason");
        v24 = (COTimerReadRequest *)objc_claimAutoreleasedReturnValue();
        -[COTimerUpdateRequest timers](v18, "timers");
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        if (-[COTimerReadRequest isEqual:](v24, "isEqual:", *MEMORY[0x24BE677F0])
          && (objc_opt_respondsToSelector() & 1) != 0)
        {
          objc_msgSend(v21, "timerAddOn:didAddTimers:", self, v29);
        }
        else if (-[COTimerReadRequest isEqual:](v24, "isEqual:", *MEMORY[0x24BE67808])
               && (objc_opt_respondsToSelector() & 1) != 0)
        {
          objc_msgSend(v21, "timerAddOn:didRemoveTimers:", self, v29);
        }
        else if (-[COTimerReadRequest isEqual:](v24, "isEqual:", *MEMORY[0x24BE67810])
               && (objc_opt_respondsToSelector() & 1) != 0)
        {
          objc_msgSend(v21, "timerAddOn:didUpdateTimers:", self, v29);
        }
        v31 = -[COMTResult initWithActionIdentifier:]([COMTResult alloc], "initWithActionIdentifier:", v14);
        (*((void (**)(id, COMTResult *, _QWORD))v13 + 2))(v13, v31, 0);

      }
    }

LABEL_13:
    goto LABEL_14;
  }
  v15 = v11;
  v16 = [COTimerCreateRequest alloc];
  objc_msgSend(v15, "timer");
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  v18 = -[COTimerRequest initWithTimer:](v16, "initWithTimer:", v17);
  v43[0] = MEMORY[0x24BDAC760];
  v43[1] = 3221225472;
  v43[2] = __57__COMeshTimerAddOn_director_performAction_from_callback___block_invoke;
  v43[3] = &unk_24D4B25E0;
  v44 = v14;
  v45 = v13;
  -[COMeshTimerAddOn handleTimerCreateRequest:callback:](self, "handleTimerCreateRequest:callback:", v18, v43);

  v19 = v44;
LABEL_3:

LABEL_14:
LABEL_15:

}

void __57__COMeshTimerAddOn_director_performAction_from_callback___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  COMTResult *v7;
  id v8;

  v5 = a3;
  if (v5 || (objc_msgSend(a2, "error"), (v5 = (id)objc_claimAutoreleasedReturnValue()) != 0))
  {
    v6 = v5;
    v7 = 0;
  }
  else
  {
    v7 = -[COMTResult initWithActionIdentifier:]([COMTResult alloc], "initWithActionIdentifier:", *(_QWORD *)(a1 + 32));
    v6 = 0;
  }
  v8 = v6;
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

}

void __57__COMeshTimerAddOn_director_performAction_from_callback___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id WeakRetained;
  COMTTimerReadResult *v7;
  id v8;

  v8 = a2;
  v5 = a3;
  if (v5 || (objc_msgSend(v8, "error"), (v5 = (id)objc_claimAutoreleasedReturnValue()) != 0))
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_msgSend(v8, "timers");
      v5 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v5 = (id)MEMORY[0x24BDBD1A8];
    }
    WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
    if (WeakRetained)
    {
      v7 = -[COMTTimerReadResult initWithTimers:actionIdentifier:]([COMTTimerReadResult alloc], "initWithTimers:actionIdentifier:", v5, *(_QWORD *)(a1 + 32));
      (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

    }
  }

}

void __57__COMeshTimerAddOn_director_performAction_from_callback___block_invoke_3(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  COMTResult *v7;
  id v8;

  v5 = a3;
  if (v5 || (objc_msgSend(a2, "error"), (v5 = (id)objc_claimAutoreleasedReturnValue()) != 0))
  {
    v6 = v5;
    v7 = 0;
  }
  else
  {
    v7 = -[COMTResult initWithActionIdentifier:]([COMTResult alloc], "initWithActionIdentifier:", *(_QWORD *)(a1 + 32));
    v6 = 0;
  }
  v8 = v6;
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

}

void __57__COMeshTimerAddOn_director_performAction_from_callback___block_invoke_4(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  COMTResult *v7;
  id v8;

  v5 = a3;
  if (v5 || (objc_msgSend(a2, "error"), (v5 = (id)objc_claimAutoreleasedReturnValue()) != 0))
  {
    v6 = v5;
    v7 = 0;
  }
  else
  {
    v7 = -[COMTResult initWithActionIdentifier:]([COMTResult alloc], "initWithActionIdentifier:", *(_QWORD *)(a1 + 32));
    v6 = 0;
  }
  v8 = v6;
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

}

- (MTTimerManager)timerManager
{
  return self->_timerManager;
}

- (MTTimerManager)observedTimerManager
{
  return self->_observedTimerManager;
}

- (NSSet)members
{
  return (NSSet *)objc_getProperty(self, a2, 56, 1);
}

- (void)setMembers:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 56);
}

- (NSDictionary)interests
{
  return self->_interests;
}

- (void)setInterests:(id)a3
{
  objc_storeStrong((id *)&self->_interests, a3);
}

- (NSDictionary)ourInterests
{
  return self->_ourInterests;
}

- (void)setOurInterests:(id)a3
{
  objc_storeStrong((id *)&self->_ourInterests, a3);
}

- (void)setActionDirector:(id)a3
{
  objc_storeStrong((id *)&self->_actionDirector, a3);
}

- (NSMutableDictionary)timerIndex
{
  return self->_timerIndex;
}

- (void)setTimerIndex:(id)a3
{
  objc_storeStrong((id *)&self->_timerIndex, a3);
}

- (COHomeKitAdapter)homekit
{
  return self->_homekit;
}

- (COHomeHubAdapter)homehub
{
  return self->_homehub;
}

- (NSArray)deletes
{
  return self->_deletes;
}

- (void)setDeletes:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 112);
}

- (NSArray)mergingNodes
{
  return self->_mergingNodes;
}

- (void)setMergingNodes:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 120);
}

- (COTimerReadRequest)mergeRequest
{
  return self->_mergeRequest;
}

- (void)setMergeRequest:(id)a3
{
  objc_storeStrong((id *)&self->_mergeRequest, a3);
}

- (NSArray)mergeTimers
{
  return self->_mergeTimers;
}

- (void)setMergeTimers:(id)a3
{
  objc_storeStrong((id *)&self->_mergeTimers, a3);
}

- (NSDictionary)mergeResponses
{
  return self->_mergeResponses;
}

- (void)setMergeResponses:(id)a3
{
  objc_storeStrong((id *)&self->_mergeResponses, a3);
}

- (NSArray)queuedCommands
{
  return self->_queuedCommands;
}

- (void)setQueuedCommands:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 152);
}

- (id)recorder
{
  return self->_recorder;
}

- (void)setRecorder:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 160);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_recorder, 0);
  objc_storeStrong((id *)&self->_queuedCommands, 0);
  objc_storeStrong((id *)&self->_mergeResponses, 0);
  objc_storeStrong((id *)&self->_mergeTimers, 0);
  objc_storeStrong((id *)&self->_mergeRequest, 0);
  objc_storeStrong((id *)&self->_mergingNodes, 0);
  objc_storeStrong((id *)&self->_deletes, 0);
  objc_storeStrong((id *)&self->_homehub, 0);
  objc_storeStrong((id *)&self->_homekit, 0);
  objc_storeStrong((id *)&self->_timerIndex, 0);
  objc_storeStrong((id *)&self->_actionDirector, 0);
  objc_storeStrong((id *)&self->_ourInterests, 0);
  objc_storeStrong((id *)&self->_interests, 0);
  objc_storeStrong((id *)&self->_members, 0);
  objc_storeStrong((id *)&self->_observedTimerManager, 0);
  objc_storeStrong((id *)&self->_timerManager, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

- (void)didChangeNodesForMeshController:(uint64_t)a1 .cold.1(uint64_t a1, void *a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;

  objc_msgSend(a2, "mergeRequest");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_0_2(&dword_215E92000, v2, v3, "%p merge %p lost final nodes", v4, v5, v6, v7, 0);

  OUTLINED_FUNCTION_11();
}

- (void)_filteredTimersList:forAccessory:.cold.1()
{
  id v0;
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  OUTLINED_FUNCTION_14();
  objc_msgSend(v0, "meshController");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_9_1();
  OUTLINED_FUNCTION_0_2(&dword_215E92000, v2, v3, "%p filtering %@", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_11();
}

void __68__COMeshTimerAddOn__timersForAccessoryIdentifier_allowLocalStorage___block_invoke_86_cold_1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0_0(&dword_215E92000, v0, v1, "%p specified accessory (%@) was not found in order to filter local timers!");
  OUTLINED_FUNCTION_2_0();
}

void __68__COMeshTimerAddOn__timersForAccessoryIdentifier_allowLocalStorage___block_invoke_86_cold_2()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0_0(&dword_215E92000, v0, v1, "%p local timers list failed (%@)");
  OUTLINED_FUNCTION_2_0();
}

void __68__COMeshTimerAddOn__timersForAccessoryIdentifier_allowLocalStorage___block_invoke_92_cold_1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_17(*MEMORY[0x24BDAC8D0]);
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0_0(&dword_215E92000, v0, v1, "%p specified accessory (%@) was not found in order to filter timers!");
  OUTLINED_FUNCTION_2_0();
}

void __68__COMeshTimerAddOn__timersForAccessoryIdentifier_allowLocalStorage___block_invoke_92_cold_2()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_17(*MEMORY[0x24BDAC8D0]);
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0_0(&dword_215E92000, v0, v1, "%p timers list from leader failed (%@)");
  OUTLINED_FUNCTION_2_0();
}

- (void)_isTimer:(void *)a1 targetingAccessoryIdentifiers:(NSObject *)a2 .cold.1(void *a1, NSObject *a2)
{
  void *v3;
  uint64_t v4;
  uint8_t v5[24];
  uint64_t v6;

  v6 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(a1, "timerID");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_7_2(&dword_215E92000, a2, v4, "timer (%@) is not targeting", v5);

  OUTLINED_FUNCTION_2();
}

- (void)_isTimer:targetingAccessoryIdentifiers:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_7(&dword_215E92000, v0, v1, "Unknown targeting of %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2_0();
}

void __38__COMeshTimerAddOn__sendNotification___block_invoke_3_cold_1()
{
  __int16 v0;
  uint64_t v1;
  NSObject *v2;
  uint64_t v3;
  uint8_t v4[22];
  __int16 v5;
  uint64_t v6;
  uint64_t v7;

  v7 = *MEMORY[0x24BDAC8D0];
  OUTLINED_FUNCTION_1();
  v5 = v0;
  v6 = v1;
  OUTLINED_FUNCTION_18(&dword_215E92000, v2, v3, "%p failed to send notifiction '%@' to member %@", v4);
}

- (void)_timerManagerTimerFired:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_7(&dword_215E92000, v0, v1, "%p forwarding local update to the mesh", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2_0();
}

void __44__COMeshTimerAddOn__timerManagerStateReset___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_7(&dword_215E92000, v0, v1, "%p forwarding reset to the mesh", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2_0();
}

void __46__COMeshTimerAddOn__broadcastMerge_withTruth___block_invoke_2_cold_1()
{
  id v0;
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  OUTLINED_FUNCTION_14();
  objc_msgSend(v0, "meshController");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_20();
  OUTLINED_FUNCTION_0_2(&dword_215E92000, v2, v3, "%p merge %p received an error on the last node", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_11();
}

- (void)_continueMerge:withResponse:fromNode:.cold.1()
{
  uint64_t v0;
  os_log_t v1;
  uint8_t v2[14];
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x24BDAC8D0];
  OUTLINED_FUNCTION_20();
  v3 = v0;
  _os_log_debug_impl(&dword_215E92000, v1, OS_LOG_TYPE_DEBUG, "%p merge %p received last response", v2, 0x16u);
  OUTLINED_FUNCTION_2_0();
}

- (void)_finishMerge:.cold.1()
{
  id v0;
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  OUTLINED_FUNCTION_14();
  objc_msgSend(v0, "meshController");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_9_1();
  OUTLINED_FUNCTION_0_2(&dword_215E92000, v2, v3, "%p truth is %@", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_11();
}

- (void)_finishMerge:.cold.2()
{
  id v0;
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  OUTLINED_FUNCTION_14();
  objc_msgSend(v0, "meshController");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_9_1();
  OUTLINED_FUNCTION_0_2(&dword_215E92000, v2, v3, "%p deletes is %@", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_11();
}

void __47__COMeshTimerAddOn__reloadIndexWithCompletion___block_invoke_cold_1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_19();
  OUTLINED_FUNCTION_0_0(&dword_215E92000, v0, v1, "%p failed to fetch timers for index: %{public}@");
  OUTLINED_FUNCTION_2_0();
}

void __43__COMeshTimerAddOn_addTimer_client_member___block_invoke_2_cold_1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_13_1(*MEMORY[0x24BDAC8D0]);
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0_0(&dword_215E92000, v0, v1, "%p direct add failed (%@)");
  OUTLINED_FUNCTION_2_0();
}

void __43__COMeshTimerAddOn_addTimer_client_member___block_invoke_141_cold_1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_17(*MEMORY[0x24BDAC8D0]);
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0_0(&dword_215E92000, v0, v1, "%p add failed via secondary cluster (%@)");
  OUTLINED_FUNCTION_2_0();
}

void __46__COMeshTimerAddOn_updateTimer_client_member___block_invoke_2_cold_1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_13_1(*MEMORY[0x24BDAC8D0]);
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0_0(&dword_215E92000, v0, v1, "%p direct update failed (%@)");
  OUTLINED_FUNCTION_2_0();
}

void __46__COMeshTimerAddOn_updateTimer_client_member___block_invoke_144_cold_1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_17(*MEMORY[0x24BDAC8D0]);
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0_0(&dword_215E92000, v0, v1, "%p update failed via secondary cluster (%@)");
  OUTLINED_FUNCTION_2_0();
}

void __46__COMeshTimerAddOn_removeTimer_client_member___block_invoke_2_cold_1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_13_1(*MEMORY[0x24BDAC8D0]);
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0_0(&dword_215E92000, v0, v1, "%p direct remove failed (%@)");
  OUTLINED_FUNCTION_2_0();
}

void __46__COMeshTimerAddOn_removeTimer_client_member___block_invoke_147_cold_1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_17(*MEMORY[0x24BDAC8D0]);
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0_0(&dword_215E92000, v0, v1, "%p remove failed via secondary cluster (%@)");
  OUTLINED_FUNCTION_2_0();
}

void __54__COMeshTimerAddOn_dismissTimerWithIdentifier_client___block_invoke_2_cold_1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_13_1(*MEMORY[0x24BDAC8D0]);
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0_0(&dword_215E92000, v0, v1, "%p direct dismiss failed (%@)");
  OUTLINED_FUNCTION_2_0();
}

void __54__COMeshTimerAddOn_dismissTimerWithIdentifier_client___block_invoke_149_cold_1(uint64_t a1, uint64_t a2, NSObject *a3)
{
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8[12];
  __int16 v9;
  uint64_t v10;
  __int16 v11;
  uint64_t v12;
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(*(id *)(a1 + 32), "meshController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_6();
  v9 = 2112;
  v10 = v6;
  v11 = 2112;
  v12 = a2;
  OUTLINED_FUNCTION_18(&dword_215E92000, a3, v7, "%p early dismissing %@ failed (%@).", v8);

  OUTLINED_FUNCTION_8();
}

void __52__COMeshTimerAddOn_handleTimerReadRequest_callback___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_0(&dword_215E92000, v0, v1, "... timers list failed (%@)", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2_0();
}

void __54__COMeshTimerAddOn_handleTimerCreateRequest_callback___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  void *v2;
  uint64_t v3;
  uint8_t v4[24];
  uint64_t v5;

  OUTLINED_FUNCTION_14();
  v5 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(*(id *)(v1 + 32), "timerID");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_9_1();
  OUTLINED_FUNCTION_4(&dword_215E92000, v0, v3, "... timer (%@) create failed (%@)", v4);

  OUTLINED_FUNCTION_11();
}

void __54__COMeshTimerAddOn_handleTimerCreateRequest_callback___block_invoke_154_cold_1(uint64_t a1, id *a2)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint8_t v9;

  objc_msgSend(*a2, "timerID");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_1_3();
  OUTLINED_FUNCTION_0_2(&dword_215E92000, v3, v4, "%p forwarding creation of %@ to the mesh", v5, v6, v7, v8, v9);

  OUTLINED_FUNCTION_11();
}

void __54__COMeshTimerAddOn_handleTimerUpdateRequest_callback___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  void *v2;
  uint64_t v3;
  uint8_t v4[24];
  uint64_t v5;

  OUTLINED_FUNCTION_14();
  v5 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(*(id *)(v1 + 32), "timerID");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_9_1();
  OUTLINED_FUNCTION_4(&dword_215E92000, v0, v3, "... timer (%@) update failed (%@)", v4);

  OUTLINED_FUNCTION_11();
}

void __54__COMeshTimerAddOn_handleTimerUpdateRequest_callback___block_invoke_155_cold_1(uint64_t a1, id *a2)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint8_t v9;

  objc_msgSend(*a2, "timerID");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_1_3();
  OUTLINED_FUNCTION_0_2(&dword_215E92000, v3, v4, "%p forwarding update of %@ to the mesh", v5, v6, v7, v8, v9);

  OUTLINED_FUNCTION_11();
}

void __54__COMeshTimerAddOn_handleTimerDeleteRequest_callback___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  void *v2;
  uint64_t v3;
  uint8_t v4[24];
  uint64_t v5;

  OUTLINED_FUNCTION_14();
  v5 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(*(id *)(v1 + 32), "timerID");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_9_1();
  OUTLINED_FUNCTION_4(&dword_215E92000, v0, v3, "... timer (%@) delete failed (%@)", v4);

  OUTLINED_FUNCTION_11();
}

void __54__COMeshTimerAddOn_handleTimerDeleteRequest_callback___block_invoke_156_cold_1(uint64_t a1, id *a2)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint8_t v9;

  objc_msgSend(*a2, "timerID");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_1_3();
  OUTLINED_FUNCTION_0_2(&dword_215E92000, v3, v4, "%p forwarding delete of %@ to the mesh", v5, v6, v7, v8, v9);

  OUTLINED_FUNCTION_11();
}

void __55__COMeshTimerAddOn_handleTimerDismissRequest_callback___block_invoke_cold_1(uint64_t a1, uint64_t a2)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint8_t v9;

  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)a2 + 8) + 40), "timerID");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_1_3();
  OUTLINED_FUNCTION_0_2(&dword_215E92000, v3, v4, "%p forwarding dismiss of %@ to the mesh", v5, v6, v7, v8, v9);

  OUTLINED_FUNCTION_11();
}

void __55__COMeshTimerAddOn_handleTimerDismissRequest_callback___block_invoke_160_cold_1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0_0(&dword_215E92000, v0, v1, "... timer (%@) dismiss failed (%@)");
  OUTLINED_FUNCTION_2_0();
}

- (void)handleTimersAddedNotification:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_7(&dword_215E92000, v0, v1, "%p added timers without a list of timers", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2_0();
}

- (void)handleTimersRemovedNotification:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_7(&dword_215E92000, v0, v1, "%p removed timers without a list of timers", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2_0();
}

- (void)handleTimersUpdatedNotification:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_7(&dword_215E92000, v0, v1, "%p updated timers without a list of timers", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2_0();
}

- (void)handleTimerFiringTimerDismissedNotification:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_7(&dword_215E92000, v0, v1, "%p dismissed timers without a list of timers", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2_0();
}

- (void)handleTimerManagerStateResetNotification:(void *)a1 .cold.1(void *a1, NSObject *a2)
{
  void *v3;
  uint64_t v4;
  uint8_t v5[24];
  uint64_t v6;

  v6 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(a1, "meshController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_7_2(&dword_215E92000, a2, v4, "%p forwarding timer manager reset", v5);

  OUTLINED_FUNCTION_2();
}

- (void)timersAsAccessory:(void *)a1 fromClient:withCallback:.cold.1(void *a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  objc_msgSend(a1, "meshController");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_19();
  OUTLINED_FUNCTION_0_2(&dword_215E92000, v2, v3, "%p serving request to get timers for %{public}@", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_11();
}

void __62__COMeshTimerAddOn_timersAsAccessory_fromClient_withCallback___block_invoke_2_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_7(&dword_215E92000, v0, v1, "... returning %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2_0();
}

- (void)timersForAccessories:(uint64_t)a1 fromClient:(void *)a2 callback:(NSObject *)a3 .cold.1(uint64_t a1, void *a2, NSObject *a3)
{
  int v5;
  uint64_t v6;
  __int16 v7;
  uint64_t v8;
  __int16 v9;
  void *v10;
  uint64_t v11;

  v11 = *MEMORY[0x24BDAC8D0];
  v5 = 134218498;
  v6 = a1;
  v7 = 2048;
  v8 = objc_msgSend(a2, "count");
  v9 = 2112;
  v10 = a2;
  _os_log_debug_impl(&dword_215E92000, a3, OS_LOG_TYPE_DEBUG, "%p serving request to get timers for %ld:%@", (uint8_t *)&v5, 0x20u);
  OUTLINED_FUNCTION_8();
}

- (void)addTimer:asAccessory:fromClient:withCallback:.cold.1()
{
  void *v0;
  id v1;
  void *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint8_t v10;

  OUTLINED_FUNCTION_14();
  objc_msgSend(v1, "meshController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "timerID");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_1_3();
  OUTLINED_FUNCTION_0_2(&dword_215E92000, v4, v5, "%p serving request to add timer %@", v6, v7, v8, v9, v10);

  OUTLINED_FUNCTION_11();
}

- (void)updateTimer:asAccessory:fromClient:withCallback:.cold.1()
{
  void *v0;
  id v1;
  void *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint8_t v10;

  OUTLINED_FUNCTION_14();
  objc_msgSend(v1, "meshController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "timerID");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_1_3();
  OUTLINED_FUNCTION_0_2(&dword_215E92000, v4, v5, "%p serving request to update timer %@", v6, v7, v8, v9, v10);

  OUTLINED_FUNCTION_11();
}

- (void)removeTimer:asAccessory:fromClient:withCallback:.cold.1()
{
  void *v0;
  id v1;
  void *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint8_t v10;

  OUTLINED_FUNCTION_14();
  objc_msgSend(v1, "meshController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "timerID");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_1_3();
  OUTLINED_FUNCTION_0_2(&dword_215E92000, v4, v5, "%p serving request to delete timer %@", v6, v7, v8, v9, v10);

  OUTLINED_FUNCTION_11();
}

- (void)dismissTimerWithIdentifier:fromClient:withCallback:.cold.1()
{
  id v0;
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  OUTLINED_FUNCTION_14();
  objc_msgSend(v0, "meshController");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_9_1();
  OUTLINED_FUNCTION_0_2(&dword_215E92000, v2, v3, "%p serving request to dismiss timer %@", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_11();
}

void __60__COMeshTimerAddOn_canDispatchAsAccessory_asInstance_reply___block_invoke_cold_1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_7(&dword_215E92000, a2, a3, "%p looking for HomePod...", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_2_0();
}

void __60__COMeshTimerAddOn_canDispatchAsAccessory_asInstance_reply___block_invoke_cold_2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_13_1(*MEMORY[0x24BDAC8D0]);
  OUTLINED_FUNCTION_7(&dword_215E92000, v0, v1, "%p looking for non-ephemeral node...", v2, v3, v4, v5, 0);
  OUTLINED_FUNCTION_2_0();
}

void __58__COMeshTimerAddOn_setInterests_asAccessory_withCallback___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_13_1(*MEMORY[0x24BDAC8D0]);
  OUTLINED_FUNCTION_0(&dword_215E92000, v0, v1, "%p cannot set interests, IDS identifier missing", v2, v3, v4, v5, 0);
  OUTLINED_FUNCTION_2_0();
}

@end
