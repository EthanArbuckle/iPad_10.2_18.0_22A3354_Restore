@implementation COMeshAlarmAddOn

- (COMeshAlarmAddOn)initWithAlarmManager:(id)a3 homekitAdapter:(id)a4 hubAdapter:(id)a5
{
  id v9;
  id v10;
  id v11;
  COMeshAlarmAddOn *v12;
  COMeshAlarmAddOn *v13;
  MTAlarmManager *v14;
  MTAlarmManager *observedAlarmManager;
  uint64_t v16;
  id mediaSystemUpdateRegistration;
  NSArray *v18;
  NSArray *deletes;
  NSArray *v20;
  NSArray *mergingNodes;
  NSDictionary *v22;
  NSDictionary *mergeResponses;
  NSArray *v24;
  NSArray *queuedCommands;
  id recorder;
  NSSet *v27;
  NSSet *members;
  NSDictionary *v29;
  NSDictionary *interests;
  NSDictionary *v31;
  NSDictionary *ourInterests;
  NSObject *v33;
  void *v34;
  void *v35;
  double v36;
  double v37;
  dispatch_time_t v38;
  dispatch_source_t v39;
  OS_dispatch_source *reaper;
  NSObject *v41;
  _QWORD handler[4];
  id v44;
  _QWORD v45[4];
  id v46;
  id location;
  objc_super v48;
  uint8_t buf[4];
  COMeshAlarmAddOn *v50;
  uint64_t v51;

  v51 = *MEMORY[0x24BDAC8D0];
  v9 = a3;
  v10 = a4;
  v11 = a5;
  v48.receiver = self;
  v48.super_class = (Class)COMeshAlarmAddOn;
  v12 = -[COMeshAddOn init](&v48, sel_init);
  v13 = v12;
  if (v12)
  {
    v12->_lock._os_unfair_lock_opaque = 0;
    v14 = (MTAlarmManager *)objc_alloc_init(MEMORY[0x24BE67828]);
    observedAlarmManager = v13->_observedAlarmManager;
    v13->_observedAlarmManager = v14;

    -[MTAlarmManager checkIn](v13->_observedAlarmManager, "checkIn");
    objc_storeStrong((id *)&v13->_homekit, a4);
    objc_storeStrong((id *)&v13->_homehub, a5);
    objc_initWeak(&location, v13);
    v45[0] = MEMORY[0x24BDAC760];
    v45[1] = 3221225472;
    v45[2] = __67__COMeshAlarmAddOn_initWithAlarmManager_homekitAdapter_hubAdapter___block_invoke;
    v45[3] = &unk_24D4B38F8;
    objc_copyWeak(&v46, &location);
    objc_msgSend(v10, "registerMediaSystemUpdateHandler:", v45);
    v16 = objc_claimAutoreleasedReturnValue();
    mediaSystemUpdateRegistration = v13->_mediaSystemUpdateRegistration;
    v13->_mediaSystemUpdateRegistration = (id)v16;

    v18 = (NSArray *)objc_alloc_init(MEMORY[0x24BDBCE30]);
    deletes = v13->_deletes;
    v13->_deletes = v18;

    v20 = (NSArray *)objc_alloc_init(MEMORY[0x24BDBCE30]);
    mergingNodes = v13->_mergingNodes;
    v13->_mergingNodes = v20;

    v22 = (NSDictionary *)objc_alloc_init(MEMORY[0x24BDBCE70]);
    mergeResponses = v13->_mergeResponses;
    v13->_mergeResponses = v22;

    v24 = (NSArray *)objc_alloc_init(MEMORY[0x24BDBCE30]);
    queuedCommands = v13->_queuedCommands;
    v13->_queuedCommands = v24;

    objc_storeStrong((id *)&v13->_alarmManager, a3);
    recorder = v13->_recorder;
    v13->_recorder = &__block_literal_global_10;

    v27 = (NSSet *)objc_alloc_init(MEMORY[0x24BDBCF20]);
    members = v13->_members;
    v13->_members = v27;

    v29 = (NSDictionary *)objc_alloc_init(MEMORY[0x24BDBCE70]);
    interests = v13->_interests;
    v13->_interests = v29;

    v31 = (NSDictionary *)objc_alloc_init(MEMORY[0x24BDBCE70]);
    ourInterests = v13->_ourInterests;
    v13->_ourInterests = v31;

    COCoreLogForCategory(2);
    v33 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v33, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134217984;
      v50 = v13;
      _os_log_impl(&dword_215E92000, v33, OS_LOG_TYPE_DEFAULT, "%p mesh add-on created", buf, 0xCu);
    }

    objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v34, "addObserver:selector:name:object:", v13, sel__accessorySettingValueUpdated_, *MEMORY[0x24BDD4E98], 0);
    objc_msgSend(v34, "addObserver:selector:name:object:", v13, sel__alarmManagerAlarmsAdded_, *MEMORY[0x24BE67768], v13->_observedAlarmManager);
    objc_msgSend(v34, "addObserver:selector:name:object:", v13, sel__alarmManagerAlarmsRemoved_, *MEMORY[0x24BE67780], v13->_observedAlarmManager);
    objc_msgSend(v34, "addObserver:selector:name:object:", v13, sel__alarmManagerAlarmsUpdated_, *MEMORY[0x24BE67788], v13->_observedAlarmManager);
    objc_msgSend(v34, "addObserver:selector:name:object:", v13, sel__alarmManagerFiringAlarmDismissed_, *MEMORY[0x24BE67798], v13->_observedAlarmManager);
    objc_msgSend(MEMORY[0x24BDBCF50], "standardUserDefaults");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v35, "doubleForKey:", CFSTR("ReapCadence"));
    if (v36 <= 0.0)
      v37 = 6.048e14;
    else
      v37 = v36 * 1000000000.0;
    v38 = dispatch_walltime(0, (uint64_t)v37);
    v39 = dispatch_source_create(MEMORY[0x24BDACA18], 0, 0, 0);
    reaper = v13->_reaper;
    v13->_reaper = (OS_dispatch_source *)v39;

    dispatch_source_set_timer((dispatch_source_t)v13->_reaper, v38, (unint64_t)v37, 0x3B9ACA00uLL);
    v41 = v13->_reaper;
    handler[0] = MEMORY[0x24BDAC760];
    handler[1] = 3221225472;
    handler[2] = __67__COMeshAlarmAddOn_initWithAlarmManager_homekitAdapter_hubAdapter___block_invoke_42;
    handler[3] = &unk_24D4B0CD8;
    objc_copyWeak(&v44, &location);
    dispatch_source_set_event_handler(v41, handler);
    dispatch_activate((dispatch_object_t)v13->_reaper);
    objc_destroyWeak(&v44);

    objc_destroyWeak(&v46);
    objc_destroyWeak(&location);
  }

  return v13;
}

void __67__COMeshAlarmAddOn_initWithAlarmManager_homekitAdapter_hubAdapter___block_invoke(uint64_t a1, void *a2, void *a3)
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
    objc_msgSend(WeakRetained, "mediaSystemCompanionTransitionedFrom:to:", v8, v5);

}

uint64_t __67__COMeshAlarmAddOn_initWithAlarmManager_homekitAdapter_hubAdapter___block_invoke_2()
{
  return AnalyticsSendEventLazy();
}

void __67__COMeshAlarmAddOn_initWithAlarmManager_homekitAdapter_hubAdapter___block_invoke_42(uint64_t a1)
{
  id WeakRetained;
  id v2;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v2 = WeakRetained;
    objc_msgSend(WeakRetained, "_reaperFired");
    WeakRetained = v2;
  }

}

- (COMeshAlarmAddOn)initWithAlarmManager:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  COMeshAlarmAddOn *v7;

  v4 = a3;
  +[COHomeKitAdapter sharedInstance](COHomeKitAdapter, "sharedInstance");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  +[COHomeHubAdapter sharedInstance](COHomeHubAdapter, "sharedInstance");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = -[COMeshAlarmAddOn initWithAlarmManager:homekitAdapter:hubAdapter:](self, "initWithAlarmManager:homekitAdapter:hubAdapter:", v4, v5, v6);

  return v7;
}

- (COMeshAlarmAddOn)init
{
  id v3;
  COMeshAlarmAddOn *v4;

  v3 = objc_alloc_init(MEMORY[0x24BE67828]);
  v4 = -[COMeshAlarmAddOn initWithAlarmManager:](self, "initWithAlarmManager:", v3);

  return v4;
}

- (void)dealloc
{
  void *v3;
  void *v4;
  objc_super v5;

  -[COMeshAlarmAddOn homekit](self, "homekit");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[COMeshAlarmAddOn mediaSystemUpdateRegistration](self, "mediaSystemUpdateRegistration");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "unregisterMediaSystemUpdateHandler:", v4);

  v5.receiver = self;
  v5.super_class = (Class)COMeshAlarmAddOn;
  -[COMeshAlarmAddOn dealloc](&v5, sel_dealloc);
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
  void *v18;
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
  _QWORD v49[4];
  id v50;
  _QWORD v51[4];
  id v52;
  id location;
  objc_super v54;

  v4 = a3;
  v54.receiver = self;
  v54.super_class = (Class)COMeshAlarmAddOn;
  -[COMeshAddOn didAddToMeshController:](&v54, sel_didAddToMeshController_, v4);
  objc_initWeak(&location, self);
  v5 = MEMORY[0x24BDAC760];
  v51[0] = MEMORY[0x24BDAC760];
  v51[1] = 3221225472;
  v51[2] = __43__COMeshAlarmAddOn_didAddToMeshController___block_invoke;
  v51[3] = &unk_24D4B1D90;
  objc_copyWeak(&v52, &location);
  v6 = (void (**)(_QWORD, _QWORD))MEMORY[0x2199F3D40](v51);
  v49[0] = v5;
  v49[1] = 3221225472;
  v49[2] = __43__COMeshAlarmAddOn_didAddToMeshController___block_invoke_4;
  v49[3] = &unk_24D4B1DE0;
  objc_copyWeak(&v50, &location);
  v7 = (void (**)(_QWORD, _QWORD))MEMORY[0x2199F3D40](v49);
  v47[0] = v5;
  v47[1] = 3221225472;
  v47[2] = __43__COMeshAlarmAddOn_didAddToMeshController___block_invoke_7;
  v47[3] = &unk_24D4B1170;
  objc_copyWeak(&v48, &location);
  ((void (**)(_QWORD, _QWORD *))v6)[2](v6, v47);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "registerHandler:forRequestClass:", v8, objc_opt_class());

  v45[0] = v5;
  v45[1] = 3221225472;
  v45[2] = __43__COMeshAlarmAddOn_didAddToMeshController___block_invoke_8;
  v45[3] = &unk_24D4B1170;
  objc_copyWeak(&v46, &location);
  ((void (**)(_QWORD, _QWORD *))v6)[2](v6, v45);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "registerHandler:forRequestClass:", v9, objc_opt_class());

  v43[0] = v5;
  v43[1] = 3221225472;
  v43[2] = __43__COMeshAlarmAddOn_didAddToMeshController___block_invoke_9;
  v43[3] = &unk_24D4B1170;
  objc_copyWeak(&v44, &location);
  ((void (**)(_QWORD, _QWORD *))v6)[2](v6, v43);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "registerHandler:forRequestClass:", v10, objc_opt_class());

  v41[0] = v5;
  v41[1] = 3221225472;
  v41[2] = __43__COMeshAlarmAddOn_didAddToMeshController___block_invoke_10;
  v41[3] = &unk_24D4B1170;
  objc_copyWeak(&v42, &location);
  ((void (**)(_QWORD, _QWORD *))v6)[2](v6, v41);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "registerHandler:forRequestClass:", v11, objc_opt_class());

  v39[0] = v5;
  v39[1] = 3221225472;
  v39[2] = __43__COMeshAlarmAddOn_didAddToMeshController___block_invoke_11;
  v39[3] = &unk_24D4B1170;
  objc_copyWeak(&v40, &location);
  ((void (**)(_QWORD, _QWORD *))v6)[2](v6, v39);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "registerHandler:forRequestClass:", v12, objc_opt_class());

  v37[0] = v5;
  v37[1] = 3221225472;
  v37[2] = __43__COMeshAlarmAddOn_didAddToMeshController___block_invoke_12;
  v37[3] = &unk_24D4B1170;
  objc_copyWeak(&v38, &location);
  ((void (**)(_QWORD, _QWORD *))v6)[2](v6, v37);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "registerHandler:forRequestClass:", v13, objc_opt_class());

  v35[0] = v5;
  v35[1] = 3221225472;
  v35[2] = __43__COMeshAlarmAddOn_didAddToMeshController___block_invoke_13;
  v35[3] = &unk_24D4B11C0;
  objc_copyWeak(&v36, &location);
  ((void (**)(_QWORD, _QWORD *))v7)[2](v7, v35);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "registerHandler:forNotificationClass:", v14, objc_opt_class());

  v33[0] = v5;
  v33[1] = 3221225472;
  v33[2] = __43__COMeshAlarmAddOn_didAddToMeshController___block_invoke_14;
  v33[3] = &unk_24D4B11C0;
  objc_copyWeak(&v34, &location);
  ((void (**)(_QWORD, _QWORD *))v7)[2](v7, v33);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "registerHandler:forNotificationClass:", v15, objc_opt_class());

  v31[0] = v5;
  v31[1] = 3221225472;
  v31[2] = __43__COMeshAlarmAddOn_didAddToMeshController___block_invoke_15;
  v31[3] = &unk_24D4B11C0;
  objc_copyWeak(&v32, &location);
  ((void (**)(_QWORD, _QWORD *))v7)[2](v7, v31);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "registerHandler:forNotificationClass:", v16, objc_opt_class());

  v29[0] = v5;
  v29[1] = 3221225472;
  v29[2] = __43__COMeshAlarmAddOn_didAddToMeshController___block_invoke_16;
  v29[3] = &unk_24D4B11C0;
  objc_copyWeak(&v30, &location);
  objc_msgSend(v4, "registerHandler:forNotificationClass:", v29, objc_opt_class());
  v27[0] = v5;
  v27[1] = 3221225472;
  v27[2] = __43__COMeshAlarmAddOn_didAddToMeshController___block_invoke_17;
  v27[3] = &unk_24D4B11C0;
  objc_copyWeak(&v28, &location);
  ((void (**)(_QWORD, _QWORD *))v7)[2](v7, v27);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "registerHandler:forNotificationClass:", v17, objc_opt_class());

  v25[0] = v5;
  v25[1] = 3221225472;
  v25[2] = __43__COMeshAlarmAddOn_didAddToMeshController___block_invoke_18;
  v25[3] = &unk_24D4B11C0;
  objc_copyWeak(&v26, &location);
  ((void (**)(_QWORD, _QWORD *))v7)[2](v7, v25);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "registerHandler:forNotificationClass:", v18, objc_opt_class());

  v23[0] = v5;
  v23[1] = 3221225472;
  v23[2] = __43__COMeshAlarmAddOn_didAddToMeshController___block_invoke_19;
  v23[3] = &unk_24D4B11C0;
  objc_copyWeak(&v24, &location);
  ((void (**)(_QWORD, _QWORD *))v7)[2](v7, v23);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "registerHandler:forNotificationClass:", v19, objc_opt_class());

  v21[0] = v5;
  v21[1] = 3221225472;
  v21[2] = __43__COMeshAlarmAddOn_didAddToMeshController___block_invoke_20;
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

  objc_destroyWeak(&v50);
  objc_destroyWeak(&v52);
  objc_destroyWeak(&location);

}

id __43__COMeshAlarmAddOn_didAddToMeshController___block_invoke(uint64_t a1, void *a2)
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
  v11[2] = __43__COMeshAlarmAddOn_didAddToMeshController___block_invoke_2;
  v11[3] = &unk_24D4B1D68;
  objc_copyWeak(&v13, (id *)(a1 + 32));
  v12 = v3;
  v4 = v3;
  v5 = (void *)MEMORY[0x2199F3D40](v11);
  v9 = (void *)MEMORY[0x2199F3D40](v5, v6, v7, v8);

  objc_destroyWeak(&v13);
  return v9;
}

void __43__COMeshAlarmAddOn_didAddToMeshController___block_invoke_2(uint64_t a1, void *a2, void *a3)
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
      v13[2] = __43__COMeshAlarmAddOn_didAddToMeshController___block_invoke_3;
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

uint64_t __43__COMeshAlarmAddOn_didAddToMeshController___block_invoke_3(_QWORD *a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(a1[5] + 16))(a1[5], a1[4], a1[6]);
}

id __43__COMeshAlarmAddOn_didAddToMeshController___block_invoke_4(uint64_t a1, void *a2)
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
  v11[2] = __43__COMeshAlarmAddOn_didAddToMeshController___block_invoke_5;
  v11[3] = &unk_24D4B1DB8;
  objc_copyWeak(&v13, (id *)(a1 + 32));
  v12 = v3;
  v4 = v3;
  v5 = (void *)MEMORY[0x2199F3D40](v11);
  v9 = (void *)MEMORY[0x2199F3D40](v5, v6, v7, v8);

  objc_destroyWeak(&v13);
  return v9;
}

void __43__COMeshAlarmAddOn_didAddToMeshController___block_invoke_5(uint64_t a1, void *a2)
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
      v12 = __43__COMeshAlarmAddOn_didAddToMeshController___block_invoke_6;
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

uint64_t __43__COMeshAlarmAddOn_didAddToMeshController___block_invoke_6(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));
}

void __43__COMeshAlarmAddOn_didAddToMeshController___block_invoke_7(uint64_t a1, void *a2, void *a3)
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
    objc_msgSend(WeakRetained, "handleAlarmCreateRequest:callback:", v8, v5);

}

void __43__COMeshAlarmAddOn_didAddToMeshController___block_invoke_8(uint64_t a1, void *a2, void *a3)
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
    objc_msgSend(WeakRetained, "handleAlarmReadRequest:callback:", v8, v5);

}

void __43__COMeshAlarmAddOn_didAddToMeshController___block_invoke_9(uint64_t a1, void *a2, void *a3)
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
    objc_msgSend(WeakRetained, "handleAlarmUpdateRequest:callback:", v8, v5);

}

void __43__COMeshAlarmAddOn_didAddToMeshController___block_invoke_10(uint64_t a1, void *a2, void *a3)
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
    objc_msgSend(WeakRetained, "handleAlarmDeleteRequest:callback:", v8, v5);

}

void __43__COMeshAlarmAddOn_didAddToMeshController___block_invoke_11(uint64_t a1, void *a2, void *a3)
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
    objc_msgSend(WeakRetained, "handleAlarmSnoozeRequest:callback:", v8, v5);

}

void __43__COMeshAlarmAddOn_didAddToMeshController___block_invoke_12(uint64_t a1, void *a2, void *a3)
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
    objc_msgSend(WeakRetained, "handleAlarmDismissRequest:callback:", v8, v5);

}

void __43__COMeshAlarmAddOn_didAddToMeshController___block_invoke_13(uint64_t a1, void *a2)
{
  id WeakRetained;
  void *v4;
  id v5;

  v5 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v4 = WeakRetained;
  if (WeakRetained)
    objc_msgSend(WeakRetained, "handleAlarmsAddedNotification:", v5);

}

void __43__COMeshAlarmAddOn_didAddToMeshController___block_invoke_14(uint64_t a1, void *a2)
{
  id WeakRetained;
  void *v4;
  id v5;

  v5 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v4 = WeakRetained;
  if (WeakRetained)
    objc_msgSend(WeakRetained, "handleAlarmsRemovedNotification:", v5);

}

void __43__COMeshAlarmAddOn_didAddToMeshController___block_invoke_15(uint64_t a1, void *a2)
{
  id WeakRetained;
  void *v4;
  id v5;

  v5 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v4 = WeakRetained;
  if (WeakRetained)
    objc_msgSend(WeakRetained, "handleAlarmFiringAlarmDismissedNotification:", v5);

}

void __43__COMeshAlarmAddOn_didAddToMeshController___block_invoke_16(uint64_t a1, void *a2)
{
  id WeakRetained;
  void *v4;
  id v5;

  v5 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v4 = WeakRetained;
  if (WeakRetained)
    objc_msgSend(WeakRetained, "handleAlarmFiredNotification:", v5);

}

void __43__COMeshAlarmAddOn_didAddToMeshController___block_invoke_17(uint64_t a1, void *a2)
{
  id WeakRetained;
  void *v4;
  id v5;

  v5 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v4 = WeakRetained;
  if (WeakRetained)
    objc_msgSend(WeakRetained, "handleAlarmsChangedNotification:", v5);

}

void __43__COMeshAlarmAddOn_didAddToMeshController___block_invoke_18(uint64_t a1, void *a2)
{
  id WeakRetained;
  void *v4;
  id v5;

  v5 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v4 = WeakRetained;
  if (WeakRetained)
    objc_msgSend(WeakRetained, "handleAlarmsUpdatedNotification:", v5);

}

void __43__COMeshAlarmAddOn_didAddToMeshController___block_invoke_19(uint64_t a1, void *a2)
{
  id WeakRetained;
  void *v4;
  id v5;

  v5 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v4 = WeakRetained;
  if (WeakRetained)
    objc_msgSend(WeakRetained, "handleAlarmManagerStateResetNotification:", v5);

}

void __43__COMeshAlarmAddOn_didAddToMeshController___block_invoke_20(uint64_t a1, void *a2)
{
  id WeakRetained;
  void *v4;
  id v5;

  v5 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v4 = WeakRetained;
  if (WeakRetained)
    objc_msgSend(WeakRetained, "handleAlarmSnoozeNotification:", v5);

}

- (void)willRemoveFromMeshController:(id)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  objc_super v8;
  _QWORD v9[5];
  _QWORD v10[6];
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
  v10[4] = objc_opt_class();
  v6 = 0;
  v10[5] = objc_opt_class();
  do
    objc_msgSend(v4, "deregisterHandlerForRequestClass:", v10[v6++]);
  while (v6 != 6);
  -[COMeshAlarmAddOn actionDirector](self, "actionDirector");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "removeHandler:", self);

  v9[0] = MEMORY[0x24BDAC760];
  v9[1] = 3221225472;
  v9[2] = __49__COMeshAlarmAddOn_willRemoveFromMeshController___block_invoke;
  v9[3] = &unk_24D4B0C80;
  v9[4] = self;
  -[COMeshAlarmAddOn _withLock:](self, "_withLock:", v9);
  v8.receiver = self;
  v8.super_class = (Class)COMeshAlarmAddOn;
  -[COMeshAddOn willRemoveFromMeshController:](&v8, sel_willRemoveFromMeshController_, v4);

}

uint64_t __49__COMeshAlarmAddOn_willRemoveFromMeshController___block_invoke(uint64_t a1)
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
  -[COMeshAlarmAddOn observedAlarmManager](self, "observedAlarmManager");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "addObserver:selector:name:object:", self, sel__alarmManagerAlarmFired_, *MEMORY[0x24BE67760], v5);
  objc_msgSend(v6, "addObserver:selector:name:object:", self, sel__alarmManagerStateReset_, *MEMORY[0x24BE677A8], v5);
  objc_msgSend(v6, "addObserver:selector:name:object:", self, sel__alarmManagerAlarmsChanged_, *MEMORY[0x24BE67770], v5);
  objc_msgSend(v6, "addObserver:selector:name:object:", self, sel__alarmManagerFiringAlarmChanged_, *MEMORY[0x24BE67790], v5);
  -[COMeshAlarmAddOn _reloadIndexWithCompletion:](self, "_reloadIndexWithCompletion:", 0);
  v7.receiver = self;
  v7.super_class = (Class)COMeshAlarmAddOn;
  -[COMeshAddOn willStartMeshController:](&v7, sel_willStartMeshController_, v4);

}

- (void)didStopMeshController:(id)a3
{
  void *v4;
  void *v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)COMeshAlarmAddOn;
  -[COMeshAddOn didStopMeshController:](&v6, sel_didStopMeshController_, a3);
  -[COMeshAlarmAddOn observedAlarmManager](self, "observedAlarmManager");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "removeObserver:name:object:", self, *MEMORY[0x24BE67790], v4);
  objc_msgSend(v5, "removeObserver:name:object:", self, *MEMORY[0x24BE67770], v4);
  objc_msgSend(v5, "removeObserver:name:object:", self, *MEMORY[0x24BE677A8], v4);
  objc_msgSend(v5, "removeObserver:name:object:", self, *MEMORY[0x24BE67760], v4);

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
  v16.receiver = self;
  v16.super_class = (Class)COMeshAlarmAddOn;
  -[COMeshAddOn meshController:didTransitionToState:](&v16, sel_meshController_didTransitionToState_, v6, a4);
  objc_msgSend(v6, "nodes");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (a4 == 3)
  {
    -[COMeshAlarmAddOn ourInterests](self, "ourInterests");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v14[0] = MEMORY[0x24BDAC760];
    v14[1] = 3221225472;
    v14[2] = __56__COMeshAlarmAddOn_meshController_didTransitionToState___block_invoke;
    v14[3] = &unk_24D4B1E08;
    v15 = v7;
    objc_msgSend(v8, "enumerateKeysAndObjectsUsingBlock:", v14);

  }
  -[COMeshAlarmAddOn delegate](self, "delegate");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v9, "didChangeCompositionForAlarmAddOn:", self);
  if (a4 == 3)
  {
    objc_msgSend(v6, "me");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "leader");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v10, "isEqual:", v11) & 1) != 0)
    {
      -[COMeshAlarmAddOn homekit](self, "homekit");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      if ((objc_msgSend(v12, "hasOptedToHH2") & 1) != 0)
      {
        v13 = objc_msgSend(MEMORY[0x24BE19E30], "isDistributedTimersEnabled");

        if ((v13 & 1) != 0)
          goto LABEL_15;
      }
      else
      {

      }
      -[COMeshAlarmAddOn _startMerge](self, "_startMerge");
    }
    else
    {

    }
  }
  else if (a4 == 2)
  {
    -[COMeshAlarmAddOn _abandonMerge](self, "_abandonMerge");
  }
LABEL_15:

}

void __56__COMeshAlarmAddOn_meshController_didTransitionToState___block_invoke(uint64_t a1, void *a2, void *a3)
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
  BOOL v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  NSObject *v17;
  uint64_t v18;
  uint64_t v19;
  void (*v20)(uint64_t, void *, void *);
  void *v21;
  id v22;
  BOOL v23;
  objc_super v24;

  v4 = a3;
  v24.receiver = self;
  v24.super_class = (Class)COMeshAlarmAddOn;
  -[COMeshAddOn didChangeNodesForMeshController:](&v24, sel_didChangeNodesForMeshController_, v4);
  objc_msgSend(v4, "nodes");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[COMeshAddOn meshController](self, "meshController");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "state") == 3;

  -[COMeshAlarmAddOn ourInterests](self, "ourInterests");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = MEMORY[0x24BDAC760];
  v19 = 3221225472;
  v20 = __52__COMeshAlarmAddOn_didChangeNodesForMeshController___block_invoke;
  v21 = &unk_24D4B1E30;
  v9 = v5;
  v22 = v9;
  v23 = v7;
  objc_msgSend(v8, "enumerateKeysAndObjectsUsingBlock:", &v18);

  -[COMeshAlarmAddOn delegate](self, "delegate", v18, v19, v20, v21);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v10, "didChangeCompositionForAlarmAddOn:", self);
  -[COMeshAlarmAddOn mergingNodes](self, "mergingNodes");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBCEF0], "setWithArray:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBCF20], "setWithArray:", v9);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "minusSet:", v13);
  if (objc_msgSend(v12, "count"))
  {
    v14 = (void *)objc_msgSend(v11, "mutableCopy");
    objc_msgSend(v12, "allObjects");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "removeObjectsInArray:", v15);

    -[COMeshAlarmAddOn setMergingNodes:](self, "setMergingNodes:", v14);
    if (!objc_msgSend(v14, "count"))
    {
      -[COMeshAlarmAddOn mergeRequest](self, "mergeRequest");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      COCoreLogForCategory(2);
      v17 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
        -[COMeshAlarmAddOn didChangeNodesForMeshController:].cold.1();

      -[COMeshAlarmAddOn _finishMerge:](self, "_finishMerge:", v16);
    }

  }
}

void __52__COMeshAlarmAddOn_didChangeNodesForMeshController___block_invoke(uint64_t a1, void *a2, void *a3)
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

- (COMeshAlarmAddOnDelegate)delegate
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
  v8 = __Block_byref_object_copy__24;
  v9 = __Block_byref_object_dispose__24;
  v10 = 0;
  v4[0] = MEMORY[0x24BDAC760];
  v4[1] = 3221225472;
  v4[2] = __28__COMeshAlarmAddOn_delegate__block_invoke;
  v4[3] = &unk_24D4B07E0;
  v4[4] = self;
  v4[5] = &v5;
  -[COMeshAlarmAddOn _withLock:](self, "_withLock:", v4);
  v2 = (id)v6[5];
  _Block_object_dispose(&v5, 8);

  return (COMeshAlarmAddOnDelegate *)v2;
}

void __28__COMeshAlarmAddOn_delegate__block_invoke(uint64_t a1)
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
  COMeshAlarmAddOn *v8;

  v4 = a3;
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __32__COMeshAlarmAddOn_setDelegate___block_invoke;
  v6[3] = &unk_24D4B0858;
  v7 = v4;
  v8 = self;
  v5 = v4;
  -[COMeshAlarmAddOn _withLock:](self, "_withLock:", v6);

}

void __32__COMeshAlarmAddOn_setDelegate___block_invoke(uint64_t a1)
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
  v8 = __Block_byref_object_copy__24;
  v9 = __Block_byref_object_dispose__24;
  v10 = 0;
  v4[0] = MEMORY[0x24BDAC760];
  v4[1] = 3221225472;
  v4[2] = __34__COMeshAlarmAddOn_actionDirector__block_invoke;
  v4[3] = &unk_24D4B07E0;
  v4[4] = self;
  v4[5] = &v5;
  -[COMeshAlarmAddOn _withLock:](self, "_withLock:", v4);
  v2 = (id)v6[5];
  _Block_object_dispose(&v5, 8);

  return (COMTActionDirector *)v2;
}

void __34__COMeshAlarmAddOn_actionDirector__block_invoke(uint64_t a1)
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
  v18[2] = __40__COMeshAlarmAddOn__sendRequest_client___block_invoke;
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

void __40__COMeshAlarmAddOn__sendRequest_client___block_invoke(id *a1)
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
  +[CONetworkActivityFactory activityWithLabel:parentActivity:](CONetworkActivityFactory, "activityWithLabel:parentActivity:", 3, v2);
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
  v7[2] = __40__COMeshAlarmAddOn__sendRequest_client___block_invoke_2;
  v7[3] = &unk_24D4B1E58;
  v8 = v3;
  v9 = v5;
  v10 = a1[4];
  v11 = a1[7];
  v12 = a1[6];
  v6 = v3;
  objc_msgSend(v4, "sendRequest:withCompletionHandler:", v5, v7);

}

void __40__COMeshAlarmAddOn__sendRequest_client___block_invoke_2(uint64_t a1, void *a2, void *a3, void *a4, void *a5)
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
    COCoreLogForCategory(2);
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
  v19[3] = __Block_byref_object_copy__24;
  v19[4] = __Block_byref_object_dispose__24;
  v20 = (id)os_transaction_create();
  v8 = MEMORY[0x24BDAC760];
  v16[0] = MEMORY[0x24BDAC760];
  v16[1] = 3221225472;
  v16[2] = __83__COMeshAlarmAddOn__addCompletionsToFuture_withXPCCallback_transactionDescription___block_invoke;
  v16[3] = &unk_24D4B1E80;
  v9 = v7;
  v17 = v9;
  v18 = v19;
  v10 = (id)objc_msgSend(v6, "addFailureBlock:", v16);
  v13[0] = v8;
  v13[1] = 3221225472;
  v13[2] = __83__COMeshAlarmAddOn__addCompletionsToFuture_withXPCCallback_transactionDescription___block_invoke_2;
  v13[3] = &unk_24D4B1EA8;
  v11 = v9;
  v14 = v11;
  v15 = v19;
  v12 = (id)objc_msgSend(v6, "addSuccessBlock:", v13);

  _Block_object_dispose(v19, 8);
}

void __83__COMeshAlarmAddOn__addCompletionsToFuture_withXPCCallback_transactionDescription___block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;

  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  v2 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v3 = *(void **)(v2 + 40);
  *(_QWORD *)(v2 + 40) = 0;

}

void __83__COMeshAlarmAddOn__addCompletionsToFuture_withXPCCallback_transactionDescription___block_invoke_2(uint64_t a1)
{
  uint64_t v2;
  void *v3;

  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  v2 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v3 = *(void **)(v2 + 40);
  *(_QWORD *)(v2 + 40) = 0;

}

- (void)_sendNotification:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  id v10;
  _QWORD v11[4];
  id v12;
  COMeshAlarmAddOn *v13;
  id v14;

  v4 = a3;
  -[COMeshAddOn meshControllerQueue](self, "meshControllerQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v5);

  objc_msgSend(v4, "userInfo");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectForKey:", *MEMORY[0x24BE67778]);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  -[COMeshAlarmAddOn interests](self, "interests");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = MEMORY[0x24BDAC760];
  v11[1] = 3221225472;
  v11[2] = __38__COMeshAlarmAddOn__sendNotification___block_invoke;
  v11[3] = &unk_24D4B3980;
  v12 = v7;
  v13 = self;
  v14 = v4;
  v9 = v4;
  v10 = v7;
  objc_msgSend(v8, "enumerateKeysAndObjectsUsingBlock:", v11);

}

void __38__COMeshAlarmAddOn__sendNotification___block_invoke(id *a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id v7;
  void *v8;
  COMTAlarmNotificationAction *v9;
  void *v10;
  void *v11;
  COMTAlarmNotificationAction *v12;
  void *v13;
  void *v14;
  id v15;
  _QWORD v16[5];
  id v17;

  v15 = a2;
  v5 = a3;
  v16[0] = MEMORY[0x24BDAC760];
  v16[1] = 3221225472;
  v16[2] = __38__COMeshAlarmAddOn__sendNotification___block_invoke_2;
  v16[3] = &unk_24D4B3198;
  v6 = a1[4];
  v16[4] = a1[5];
  v7 = v5;
  v17 = v7;
  objc_msgSend(v6, "indexesOfObjectsPassingTest:", v16);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v8, "count"))
  {
    v9 = [COMTAlarmNotificationAction alloc];
    objc_msgSend(a1[6], "name");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1[4], "objectsAtIndexes:", v8);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = -[COMTAlarmNotificationAction initWithReason:alarms:](v9, "initWithReason:alarms:", v10, v11);

    objc_msgSend(a1[5], "actionDirector");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDBCF20], "setWithObject:", v15);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "requestAction:members:withCompletion:", v12, v14, &__block_literal_global_106);

  }
}

uint64_t __38__COMeshAlarmAddOn__sendNotification___block_invoke_2(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "_isAlarm:targetingAccessoryIdentifiers:", a2, *(_QWORD *)(a1 + 40));
}

- (void)_alarmManagerAlarmsAdded:(id)a3
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
  COMeshAlarmAddOn *v13;
  id v14;

  v4 = a3;
  objc_msgSend(v4, "userInfo");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKey:", *MEMORY[0x24BE67778]);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  -[COMeshAddOn meshControllerQueue](self, "meshControllerQueue");
  v7 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __45__COMeshAlarmAddOn__alarmManagerAlarmsAdded___block_invoke;
  block[3] = &unk_24D4B08D0;
  v8 = v6;
  v12 = v8;
  v13 = self;
  v9 = v4;
  v14 = v9;
  dispatch_async(v7, block);

  -[COMeshAlarmAddOn delegate](self, "delegate");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v10, "alarmAddOn:didAddAlarms:", self, v8);

}

uint64_t __45__COMeshAlarmAddOn__alarmManagerAlarmsAdded___block_invoke(uint64_t a1)
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
        objc_msgSend(v7, "lastModifiedDate", (_QWORD)v12);
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        if (!v8)
        {
          objc_msgSend(MEMORY[0x24BDBCE60], "distantPast");
          v8 = (void *)objc_claimAutoreleasedReturnValue();
        }
        objc_msgSend(*(id *)(a1 + 40), "alarmIndex");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "alarmID");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "setObject:forKey:", v8, v10);

      }
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v4);
  }

  return objc_msgSend(*(id *)(a1 + 40), "_sendNotification:", *(_QWORD *)(a1 + 48));
}

- (void)_alarmManagerAlarmsRemoved:(id)a3
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
  COMeshAlarmAddOn *v13;
  id v14;

  v4 = a3;
  objc_msgSend(v4, "userInfo");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKey:", *MEMORY[0x24BE67778]);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  -[COMeshAddOn meshControllerQueue](self, "meshControllerQueue");
  v7 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __47__COMeshAlarmAddOn__alarmManagerAlarmsRemoved___block_invoke;
  block[3] = &unk_24D4B08D0;
  v8 = v6;
  v12 = v8;
  v13 = self;
  v9 = v4;
  v14 = v9;
  dispatch_async(v7, block);

  -[COMeshAlarmAddOn delegate](self, "delegate");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v10, "alarmAddOn:didRemoveAlarms:", self, v8);

}

uint64_t __47__COMeshAlarmAddOn__alarmManagerAlarmsRemoved___block_invoke(uint64_t a1)
{
  id v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
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
      v6 = 0;
      do
      {
        if (*(_QWORD *)v12 != v5)
          objc_enumerationMutation(v2);
        v7 = *(void **)(*((_QWORD *)&v11 + 1) + 8 * v6);
        objc_msgSend(*(id *)(a1 + 40), "alarmIndex", (_QWORD)v11);
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "alarmID");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "removeObjectForKey:", v9);

        ++v6;
      }
      while (v4 != v6);
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v4);
  }

  return objc_msgSend(*(id *)(a1 + 40), "_sendNotification:", *(_QWORD *)(a1 + 48));
}

- (void)_alarmManagerAlarmsUpdated:(id)a3
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
  COMeshAlarmAddOn *v13;
  id v14;

  v4 = a3;
  objc_msgSend(v4, "userInfo");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKey:", *MEMORY[0x24BE67778]);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  -[COMeshAddOn meshControllerQueue](self, "meshControllerQueue");
  v7 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __47__COMeshAlarmAddOn__alarmManagerAlarmsUpdated___block_invoke;
  block[3] = &unk_24D4B08D0;
  v8 = v6;
  v12 = v8;
  v13 = self;
  v9 = v4;
  v14 = v9;
  dispatch_async(v7, block);

  -[COMeshAlarmAddOn delegate](self, "delegate");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v10, "alarmAddOn:didUpdateAlarms:", self, v8);

}

uint64_t __47__COMeshAlarmAddOn__alarmManagerAlarmsUpdated___block_invoke(uint64_t a1)
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
        objc_msgSend(v7, "lastModifiedDate", (_QWORD)v12);
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        if (!v8)
        {
          objc_msgSend(MEMORY[0x24BDBCE60], "distantPast");
          v8 = (void *)objc_claimAutoreleasedReturnValue();
        }
        objc_msgSend(*(id *)(a1 + 40), "alarmIndex");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "alarmID");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "setObject:forKey:", v8, v10);

      }
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v4);
  }

  return objc_msgSend(*(id *)(a1 + 40), "_sendNotification:", *(_QWORD *)(a1 + 48));
}

- (void)_alarmManagerFiringAlarmDismissed:(id)a3
{
  void *v4;
  void *v5;
  id v6;

  objc_msgSend(a3, "userInfo");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKey:", *MEMORY[0x24BE67778]);
  v6 = (id)objc_claimAutoreleasedReturnValue();

  -[COMeshAlarmAddOn delegate](self, "delegate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v5, "alarmAddOn:didDismissAlarms:", self, v6);

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
  v5 = -[COAlarmReadRequest initForMerge]([COAlarmReadRequest alloc], "initForMerge");
  -[COMeshAlarmAddOn setMergeRequest:](self, "setMergeRequest:", v5);
  COCoreLogForCategory(2);
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134218240;
    v17 = v3;
    v18 = 2048;
    v19 = v5;
    _os_log_impl(&dword_215E92000, v6, OS_LOG_TYPE_DEFAULT, "%p starting merge for %p...", buf, 0x16u);
  }

  if (-[COMeshAlarmAddOn performsLocalActions](self, "performsLocalActions"))
  {
    -[COMeshAlarmAddOn alarmManager](self, "alarmManager");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "alarms");
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
  v12[2] = __31__COMeshAlarmAddOn__startMerge__block_invoke;
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

void __31__COMeshAlarmAddOn__startMerge__block_invoke(uint64_t a1, void *a2)
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
  block[2] = __31__COMeshAlarmAddOn__startMerge__block_invoke_2;
  block[3] = &unk_24D4B2160;
  objc_copyWeak(&v9, (id *)(a1 + 48));
  v7 = *(id *)(a1 + 40);
  v8 = v3;
  v5 = v3;
  dispatch_async(v4, block);

  objc_destroyWeak(&v9);
}

void __31__COMeshAlarmAddOn__startMerge__block_invoke_2(uint64_t a1)
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
  id v7;
  void *v8;
  NSObject *v9;
  id v10;
  NSObject *v11;
  NSObject *v12;
  id v13;
  id v14;
  uint64_t v15;
  id v16;
  void *v17;
  id v18;
  void *v19;
  uint64_t v20;
  uint64_t v21;
  void (*v22)(uint64_t, void *, void *, void *);
  void *v23;
  id v24;
  id v25;
  _QWORD v26[4];
  id v27;
  id v28;
  uint8_t buf[4];
  void *v30;
  __int16 v31;
  id v32;
  __int16 v33;
  NSObject *v34;
  uint64_t v35;

  v35 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  -[COMeshAddOn meshController](self, "meshController");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[COMeshAddOn meshControllerQueue](self, "meshControllerQueue");
  v9 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v9);

  -[COMeshAlarmAddOn mergeRequest](self, "mergeRequest");
  v10 = (id)objc_claimAutoreleasedReturnValue();

  if (v10 == v6)
  {
    eTagForAlarms(v7);
    v11 = objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setETag:", v11);
    COCoreLogForCategory(2);
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134218498;
      v30 = v8;
      v31 = 2048;
      v32 = v6;
      v33 = 2114;
      v34 = v11;
      _os_log_impl(&dword_215E92000, v12, OS_LOG_TYPE_DEFAULT, "%p broadcasting merge %p with eTag %{public}@", buf, 0x20u);
    }

    v13 = objc_alloc_init(MEMORY[0x24BDBCE30]);
    -[COMeshAlarmAddOn setMergingNodes:](self, "setMergingNodes:", v13);

    v14 = objc_alloc_init(MEMORY[0x24BDBCE70]);
    -[COMeshAlarmAddOn setMergeResponses:](self, "setMergeResponses:", v14);

    -[COMeshAlarmAddOn setMergeAlarms:](self, "setMergeAlarms:", v7);
    objc_initWeak((id *)buf, self);
    v15 = MEMORY[0x24BDAC760];
    v26[0] = MEMORY[0x24BDAC760];
    v26[1] = 3221225472;
    v26[2] = __46__COMeshAlarmAddOn__broadcastMerge_withTruth___block_invoke;
    v26[3] = &unk_24D4B21B0;
    objc_copyWeak(&v28, (id *)buf);
    v16 = v6;
    v27 = v16;
    v17 = (void *)MEMORY[0x2199F3D40](v26);
    v20 = v15;
    v21 = 3221225472;
    v22 = __46__COMeshAlarmAddOn__broadcastMerge_withTruth___block_invoke_2;
    v23 = &unk_24D4B21D8;
    objc_copyWeak(&v25, (id *)buf);
    v18 = v16;
    v24 = v18;
    v19 = (void *)MEMORY[0x2199F3D40](&v20);
    objc_msgSend(v8, "broadcastRequest:includingSelf:recipientsCallback:completionHandler:", v18, 0, v17, v19, v20, v21, v22, v23);

    objc_destroyWeak(&v25);
    objc_destroyWeak(&v28);
    objc_destroyWeak((id *)buf);

  }
  else
  {
    COCoreLogForCategory(2);
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134218240;
      v30 = v8;
      v31 = 2048;
      v32 = v6;
      _os_log_impl(&dword_215E92000, v11, OS_LOG_TYPE_DEFAULT, "%p ignoring broadcast for merge %p", buf, 0x16u);
    }
  }

}

void __46__COMeshAlarmAddOn__broadcastMerge_withTruth___block_invoke(uint64_t a1, void *a2)
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

void __46__COMeshAlarmAddOn__broadcastMerge_withTruth___block_invoke_2(uint64_t a1, void *a2, void *a3, void *a4)
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
        COCoreLogForCategory(2);
        v14 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
          __46__COMeshAlarmAddOn__broadcastMerge_withTruth___block_invoke_2_cold_1();

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
  -[COMeshAddOn meshControllerQueue](self, "meshControllerQueue");
  v9 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v9);

  -[COMeshAlarmAddOn mergeRequest](self, "mergeRequest");
  v10 = (id)objc_claimAutoreleasedReturnValue();

  if (v10 == v6)
  {
    -[COMeshAlarmAddOn setMergingNodes:](self, "setMergingNodes:", v7);
    v12 = objc_msgSend(v7, "count");
    COCoreLogForCategory(2);
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

      -[COMeshAlarmAddOn _finishMerge:](self, "_finishMerge:", v6);
    }
  }
  else
  {
    COCoreLogForCategory(2);
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
  -[COMeshAddOn meshControllerQueue](self, "meshControllerQueue");
  v12 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v12);

  -[COMeshAlarmAddOn mergeRequest](self, "mergeRequest");
  v13 = (id)objc_claimAutoreleasedReturnValue();

  if (v13 == v8)
  {
    -[COMeshAlarmAddOn mergingNodes](self, "mergingNodes");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = objc_msgSend(v15, "mutableCopy");

    -[NSObject removeObject:](v14, "removeObject:", v10);
    -[COMeshAlarmAddOn setMergingNodes:](self, "setMergingNodes:", v14);
    if ((objc_msgSend(v9, "skipInMerge") & 1) != 0)
    {
      COCoreLogForCategory(2);
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
      -[COMeshAlarmAddOn mergeResponses](self, "mergeResponses");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = (void *)objc_msgSend(v17, "mutableCopy");

      objc_msgSend(v18, "setObject:forKey:", v9, v10);
      -[COMeshAlarmAddOn setMergeResponses:](self, "setMergeResponses:", v18);

    }
    v19 = -[NSObject count](v14, "count");
    COCoreLogForCategory(2);
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
        -[COMeshAlarmAddOn _continueMerge:withResponse:fromNode:].cold.1();

      -[COMeshAlarmAddOn _finishMerge:](self, "_finishMerge:", v8);
    }
  }
  else
  {
    COCoreLogForCategory(2);
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
  -[COMeshAddOn meshControllerQueue](self, "meshControllerQueue");
  v4 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v4);

  -[COMeshAlarmAddOn mergeRequest](self, "mergeRequest");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  COCoreLogForCategory(2);
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v9 = 134218240;
    v10 = v3;
    v11 = 2048;
    v12 = v5;
    _os_log_impl(&dword_215E92000, v6, OS_LOG_TYPE_DEFAULT, "%p abandoning merge %p", (uint8_t *)&v9, 0x16u);
  }

  -[COMeshAlarmAddOn setMergeRequest:](self, "setMergeRequest:", 0);
  v7 = objc_alloc_init(MEMORY[0x24BDBCE70]);
  -[COMeshAlarmAddOn setMergeResponses:](self, "setMergeResponses:", v7);

  v8 = objc_alloc_init(MEMORY[0x24BDBCE30]);
  -[COMeshAlarmAddOn setMergingNodes:](self, "setMergingNodes:", v8);

  -[COMeshAlarmAddOn _processQueuedCommands](self, "_processQueuedCommands");
}

- (id)_commandsForReconciling:(id)a3 toTruth:(id)a4 forNode:(id)a5
{
  id v7;
  id v8;
  id v9;
  void *v10;
  void *v11;
  COAlarmsRemovedNotification *v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  unint64_t v17;
  uint64_t i;
  void *v19;
  void *v20;
  uint64_t v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  uint64_t v26;
  uint64_t v27;
  void *v28;
  COAlarmsUpdatedNotification *v29;
  NSObject *v30;
  uint64_t v31;
  COAlarmsRemovedNotification *v32;
  NSObject *v33;
  uint64_t v34;
  COAlarmsAddedNotification *v35;
  void *v36;
  COAlarmsAddedNotification *v37;
  NSObject *v38;
  uint64_t v39;
  id v40;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v49;
  id v50;
  void *v51;
  COAlarmsRemovedNotification *obj;
  void *v53;
  void *v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  uint8_t buf[4];
  void *v60;
  __int16 v61;
  id v62;
  __int16 v63;
  void *v64;
  _QWORD v65[2];
  _BYTE v66[128];
  uint64_t v67;

  v67 = *MEMORY[0x24BDAC8D0];
  v7 = a3;
  v8 = a4;
  v9 = a5;
  objc_msgSend(MEMORY[0x24BDBCE30], "array");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v54 = v8;
  v11 = (void *)objc_msgSend(v8, "mutableCopy");
  v55 = 0u;
  v56 = 0u;
  v57 = 0u;
  v58 = 0u;
  v12 = (COAlarmsRemovedNotification *)v7;
  v13 = -[COAlarmsRemovedNotification countByEnumeratingWithState:objects:count:](v12, "countByEnumeratingWithState:objects:count:", &v55, v66, 16);
  v53 = v11;
  if (!v13)
  {
    v15 = 0;
    v51 = 0;
    v32 = v12;
LABEL_28:

    goto LABEL_29;
  }
  v14 = v13;
  v49 = v10;
  v50 = v9;
  v15 = 0;
  v51 = 0;
  obj = v12;
  v16 = *(_QWORD *)v56;
  v17 = 0x24BDBC000uLL;
  do
  {
    for (i = 0; i != v14; ++i)
    {
      if (*(_QWORD *)v56 != v16)
        objc_enumerationMutation(obj);
      v19 = *(void **)(*((_QWORD *)&v55 + 1) + 8 * i);
      objc_msgSend(v19, "alarmID");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v54, "objectForKey:", v20);
      v21 = objc_claimAutoreleasedReturnValue();
      v22 = (void *)v21;
      if (v21)
      {
        v23 = (void *)MEMORY[0x24BE67818];
        v65[0] = v21;
        v65[1] = v19;
        objc_msgSend(*(id *)(v17 + 3632), "arrayWithObjects:count:", v65, 2);
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v23, "mostRecentlyUpdatedAlarmForAlarms:", v24);
        v25 = (void *)objc_claimAutoreleasedReturnValue();

        if (v19 != v25 && (objc_msgSend(v19, "isEqualIgnoringLastModifiedDate:", v25) & 1) == 0)
        {
          if (v51)
          {
            objc_msgSend(v51, "arrayByAddingObject:", v25);
            v26 = objc_claimAutoreleasedReturnValue();

            v51 = (void *)v26;
            v17 = 0x24BDBC000;
          }
          else
          {
            objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObject:", v25);
            v51 = (void *)objc_claimAutoreleasedReturnValue();
            v17 = 0x24BDBC000uLL;
          }
        }

        v11 = v53;
      }
      else if (v15)
      {
        objc_msgSend(v15, "arrayByAddingObject:", v19);
        v27 = objc_claimAutoreleasedReturnValue();

        v15 = (void *)v27;
      }
      else
      {
        objc_msgSend(*(id *)(v17 + 3632), "arrayWithObject:", v19);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
      }
      objc_msgSend(v19, "alarmID");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "removeObjectForKey:", v28);

    }
    v12 = obj;
    v14 = -[COAlarmsRemovedNotification countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v55, v66, 16);
  }
  while (v14);

  if (!v51)
  {
    v10 = v49;
    v9 = v50;
    if (!v15)
      goto LABEL_29;
    goto LABEL_25;
  }
  v29 = -[COAlarmNotification initWithAlarms:]([COAlarmsUpdatedNotification alloc], "initWithAlarms:", v51);
  COCoreLogForCategory(2);
  v30 = objc_claimAutoreleasedReturnValue();
  v9 = v50;
  if (os_log_type_enabled(v30, OS_LOG_TYPE_DEBUG))
  {
    -[COMeshAddOn meshController](self, "meshController");
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    -[COAlarmNotification alarms](v29, "alarms");
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 134218498;
    v60 = v44;
    v61 = 2112;
    v62 = v50;
    v63 = 2112;
    v64 = v45;
    _os_log_debug_impl(&dword_215E92000, v30, OS_LOG_TYPE_DEBUG, "%p %@ updating %@", buf, 0x20u);

    v11 = v53;
  }

  objc_msgSend(v49, "arrayByAddingObject:", v29);
  v31 = objc_claimAutoreleasedReturnValue();

  v10 = (void *)v31;
  if (v15)
  {
LABEL_25:
    v32 = -[COAlarmNotification initWithAlarms:]([COAlarmsRemovedNotification alloc], "initWithAlarms:", v15);
    COCoreLogForCategory(2);
    v33 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v33, OS_LOG_TYPE_DEBUG))
    {
      -[COMeshAddOn meshController](self, "meshController");
      v46 = (void *)objc_claimAutoreleasedReturnValue();
      -[COAlarmNotification alarms](v32, "alarms");
      v47 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 134218498;
      v60 = v46;
      v61 = 2112;
      v62 = v9;
      v63 = 2112;
      v64 = v47;
      _os_log_debug_impl(&dword_215E92000, v33, OS_LOG_TYPE_DEBUG, "%p %@ removing %@", buf, 0x20u);

      v11 = v53;
    }

    objc_msgSend(v10, "arrayByAddingObject:", v32);
    v34 = objc_claimAutoreleasedReturnValue();

    v10 = (void *)v34;
    goto LABEL_28;
  }
LABEL_29:
  if (objc_msgSend(v11, "count"))
  {
    v35 = [COAlarmsAddedNotification alloc];
    objc_msgSend(v11, "allValues");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    v37 = -[COAlarmNotification initWithAlarms:](v35, "initWithAlarms:", v36);

    COCoreLogForCategory(2);
    v38 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v38, OS_LOG_TYPE_DEBUG))
    {
      -[COMeshAddOn meshController](self, "meshController");
      v42 = (void *)objc_claimAutoreleasedReturnValue();
      -[COAlarmNotification alarms](v37, "alarms");
      v43 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 134218498;
      v60 = v42;
      v61 = 2112;
      v62 = v9;
      v63 = 2112;
      v64 = v43;
      _os_log_debug_impl(&dword_215E92000, v38, OS_LOG_TYPE_DEBUG, "%p %@ requires %@", buf, 0x20u);

      v11 = v53;
    }

    objc_msgSend(v10, "arrayByAddingObject:", v37);
    v39 = objc_claimAutoreleasedReturnValue();

    v10 = (void *)v39;
  }
  v40 = v10;

  return v40;
}

- (void)_finishMerge:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  NSObject *v7;
  void *v8;
  void *v9;
  NSObject *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t j;
  void *v22;
  void *v23;
  unint64_t v24;
  uint64_t v25;
  void *v26;
  void *v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t k;
  void *v32;
  void *v33;
  uint64_t v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t m;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  uint64_t v49;
  NSObject *v50;
  id v51;
  NSObject *v52;
  void *v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t n;
  uint64_t v58;
  _QWORD *v59;
  void *v60;
  unint64_t v61;
  uint64_t v62;
  void *v63;
  void *v64;
  NSObject *v65;
  NSObject *v66;
  void *v67;
  uint64_t v68;
  uint64_t v69;
  uint64_t v70;
  uint64_t ii;
  uint64_t v72;
  void *v73;
  id v74;
  id v75;
  void *v76;
  NSObject *v77;
  id v78;
  void *v79;
  NSObject *v80;
  uint64_t v81;
  void *v82;
  uint64_t v83;
  uint64_t v84;
  id v85;
  id v86;
  id obj;
  NSObject *obja;
  uint64_t v89;
  void *v90;
  void *v91;
  uint64_t v92;
  COMeshAlarmAddOn *v93;
  id v94;
  void *v95;
  id v96;
  _QWORD v97[7];
  __int128 v98;
  __int128 v99;
  __int128 v100;
  __int128 v101;
  __int128 v102;
  __int128 v103;
  __int128 v104;
  __int128 v105;
  _QWORD v106[6];
  _QWORD v107[6];
  _QWORD v108[6];
  __int128 v109;
  __int128 v110;
  __int128 v111;
  __int128 v112;
  _QWORD v113[4];
  id v114;
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
  __int128 v132;
  __int128 v133;
  __int128 v134;
  _BYTE v135[128];
  _BYTE v136[128];
  _BYTE v137[128];
  _BYTE v138[128];
  _QWORD v139[2];
  _BYTE v140[128];
  _BYTE v141[128];
  _BYTE v142[128];
  uint8_t v143[128];
  uint8_t buf[4];
  void *v145;
  __int16 v146;
  id v147;
  uint64_t v148;

  v148 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  -[COMeshAddOn meshController](self, "meshController");
  v79 = (void *)objc_claimAutoreleasedReturnValue();
  -[COMeshAddOn meshControllerQueue](self, "meshControllerQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v5);

  -[COMeshAlarmAddOn mergeRequest](self, "mergeRequest");
  v6 = (id)objc_claimAutoreleasedReturnValue();

  if (v6 != v4)
  {
    COCoreLogForCategory(2);
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134218240;
      v145 = v79;
      v146 = 2048;
      v147 = v4;
      _os_log_impl(&dword_215E92000, v7, OS_LOG_TYPE_DEFAULT, "%p ignoring conclusion of merge %p", buf, 0x16u);
    }
    goto LABEL_87;
  }
  v78 = v4;
  -[COMeshAlarmAddOn mergeAlarms](self, "mergeAlarms");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v93 = self;
  -[COMeshAlarmAddOn mergeResponses](self, "mergeResponses");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v94 = objc_alloc_init(MEMORY[0x24BDBCED8]);
  v131 = 0u;
  v132 = 0u;
  v133 = 0u;
  v134 = 0u;
  v10 = v8;
  v11 = -[NSObject countByEnumeratingWithState:objects:count:](v10, "countByEnumeratingWithState:objects:count:", &v131, v143, 16);
  if (v11)
  {
    v12 = v11;
    v13 = *(_QWORD *)v132;
    do
    {
      for (i = 0; i != v12; ++i)
      {
        if (*(_QWORD *)v132 != v13)
          objc_enumerationMutation(v10);
        v15 = *(void **)(*((_QWORD *)&v131 + 1) + 8 * i);
        objc_msgSend(v15, "alarmID");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v94, "setObject:forKey:", v15, v16);

      }
      v12 = -[NSObject countByEnumeratingWithState:objects:count:](v10, "countByEnumeratingWithState:objects:count:", &v131, v143, 16);
    }
    while (v12);
  }

  v96 = objc_alloc_init(MEMORY[0x24BDBCED8]);
  v127 = 0u;
  v128 = 0u;
  v129 = 0u;
  v130 = 0u;
  -[COMeshAlarmAddOn deletes](self, "deletes");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v127, v142, 16);
  if (v18)
  {
    v19 = v18;
    v20 = *(_QWORD *)v128;
    do
    {
      for (j = 0; j != v19; ++j)
      {
        if (*(_QWORD *)v128 != v20)
          objc_enumerationMutation(v17);
        v22 = *(void **)(*((_QWORD *)&v127 + 1) + 8 * j);
        objc_msgSend(v22, "identifier");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v96, "setObject:forKey:", v22, v23);

      }
      v19 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v127, v142, 16);
    }
    while (v19);
  }
  v80 = v10;

  v125 = 0u;
  v126 = 0u;
  v123 = 0u;
  v124 = 0u;
  obj = v9;
  v24 = 0x24BDBC000uLL;
  v85 = (id)objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v123, v141, 16);
  if (v85)
  {
    v83 = *(_QWORD *)v124;
    do
    {
      v25 = 0;
      do
      {
        if (*(_QWORD *)v124 != v83)
          objc_enumerationMutation(obj);
        v89 = v25;
        objc_msgSend(obj, "objectForKey:", *(_QWORD *)(*((_QWORD *)&v123 + 1) + 8 * v25));
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        v119 = 0u;
        v120 = 0u;
        v121 = 0u;
        v122 = 0u;
        v91 = v26;
        objc_msgSend(v26, "alarms");
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        v28 = objc_msgSend(v27, "countByEnumeratingWithState:objects:count:", &v119, v140, 16);
        if (v28)
        {
          v29 = v28;
          v30 = *(_QWORD *)v120;
          do
          {
            for (k = 0; k != v29; ++k)
            {
              if (*(_QWORD *)v120 != v30)
                objc_enumerationMutation(v27);
              v32 = *(void **)(*((_QWORD *)&v119 + 1) + 8 * k);
              objc_msgSend(v32, "alarmID");
              v33 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v94, "objectForKey:", v33);
              v34 = objc_claimAutoreleasedReturnValue();
              v35 = (void *)v34;
              if (!v34)
                goto LABEL_30;
              v36 = (void *)MEMORY[0x24BE67818];
              v139[0] = v34;
              v139[1] = v32;
              objc_msgSend(*(id *)(v24 + 3632), "arrayWithObjects:count:", v139, 2);
              v37 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v36, "mostRecentlyUpdatedAlarmForAlarms:", v37);
              v38 = (void *)objc_claimAutoreleasedReturnValue();

              if (v32 == v38)
LABEL_30:
                objc_msgSend(v94, "setObject:forKey:", v32, v33);

            }
            v29 = objc_msgSend(v27, "countByEnumeratingWithState:objects:count:", &v119, v140, 16);
          }
          while (v29);
        }

        v117 = 0u;
        v118 = 0u;
        v115 = 0u;
        v116 = 0u;
        objc_msgSend(v91, "deletes");
        v39 = (void *)objc_claimAutoreleasedReturnValue();
        v40 = objc_msgSend(v39, "countByEnumeratingWithState:objects:count:", &v115, v138, 16);
        if (v40)
        {
          v41 = v40;
          v42 = *(_QWORD *)v116;
          do
          {
            for (m = 0; m != v41; ++m)
            {
              if (*(_QWORD *)v116 != v42)
                objc_enumerationMutation(v39);
              v44 = *(void **)(*((_QWORD *)&v115 + 1) + 8 * m);
              objc_msgSend(v44, "identifier");
              v45 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v96, "objectForKey:", v45);
              v46 = (void *)objc_claimAutoreleasedReturnValue();
              if (!v46
                || (objc_msgSend(v44, "date"),
                    v47 = (void *)objc_claimAutoreleasedReturnValue(),
                    objc_msgSend(v46, "date"),
                    v48 = (void *)objc_claimAutoreleasedReturnValue(),
                    v49 = objc_msgSend(v47, "compare:", v48),
                    v48,
                    v47,
                    v49 == -1))
              {
                objc_msgSend(v96, "setObject:forKey:", v44, v45);
              }

            }
            v41 = objc_msgSend(v39, "countByEnumeratingWithState:objects:count:", &v115, v138, 16);
          }
          while (v41);
        }

        v25 = v89 + 1;
        v24 = 0x24BDBC000;
      }
      while ((id)(v89 + 1) != v85);
      v85 = (id)objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v123, v141, 16);
    }
    while (v85);
  }

  COCoreLogForCategory(2);
  v50 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v50, OS_LOG_TYPE_DEBUG))
    -[COMeshAlarmAddOn _finishMerge:].cold.2();

  v113[0] = MEMORY[0x24BDAC760];
  v113[1] = 3221225472;
  v113[2] = __33__COMeshAlarmAddOn__finishMerge___block_invoke;
  v113[3] = &unk_24D4B39A8;
  v51 = v94;
  v114 = v51;
  objc_msgSend(v96, "enumerateKeysAndObjectsUsingBlock:", v113);
  COCoreLogForCategory(2);
  v52 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v52, OS_LOG_TYPE_DEBUG))
    -[COMeshAlarmAddOn _finishMerge:].cold.1();

  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v95 = (void *)objc_claimAutoreleasedReturnValue();
  v109 = 0u;
  v110 = 0u;
  v111 = 0u;
  v112 = 0u;
  v82 = v51;
  -[COMeshAlarmAddOn _commandsForReconciling:toTruth:forNode:](v93, "_commandsForReconciling:toTruth:forNode:", v80, v51, 0);
  v53 = (void *)objc_claimAutoreleasedReturnValue();
  v54 = objc_msgSend(v53, "countByEnumeratingWithState:objects:count:", &v109, v137, 16);
  if (v54)
  {
    v55 = v54;
    v56 = *(_QWORD *)v110;
    do
    {
      for (n = 0; n != v55; ++n)
      {
        if (*(_QWORD *)v110 != v56)
          objc_enumerationMutation(v53);
        v58 = *(_QWORD *)(*((_QWORD *)&v109 + 1) + 8 * n);
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          v108[0] = MEMORY[0x24BDAC760];
          v108[1] = 3221225472;
          v59 = v108;
          v108[2] = __33__COMeshAlarmAddOn__finishMerge___block_invoke_123;
        }
        else
        {
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
          {
            v107[0] = MEMORY[0x24BDAC760];
            v107[1] = 3221225472;
            v59 = v107;
            v107[2] = __33__COMeshAlarmAddOn__finishMerge___block_invoke_2;
          }
          else
          {
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) == 0)
              continue;
            v106[0] = MEMORY[0x24BDAC760];
            v106[1] = 3221225472;
            v59 = v106;
            v106[2] = __33__COMeshAlarmAddOn__finishMerge___block_invoke_3;
          }
        }
        v59[3] = &unk_24D4B0858;
        v59[4] = v93;
        v59[5] = v58;
        v60 = (void *)MEMORY[0x2199F3D40]();
        objc_msgSend(v95, "addObject:", v60);

      }
      v55 = objc_msgSend(v53, "countByEnumeratingWithState:objects:count:", &v109, v137, 16);
    }
    while (v55);
  }

  v104 = 0u;
  v105 = 0u;
  v103 = 0u;
  v102 = 0u;
  v86 = obj;
  v61 = 0x24BDBC000;
  v84 = objc_msgSend(v86, "countByEnumeratingWithState:objects:count:", &v102, v136, 16);
  if (v84)
  {
    v81 = *(_QWORD *)v103;
    do
    {
      v62 = 0;
      do
      {
        if (*(_QWORD *)v103 != v81)
          objc_enumerationMutation(v86);
        v63 = *(void **)(*((_QWORD *)&v102 + 1) + 8 * v62);
        objc_msgSend(v86, "objectForKey:", v63);
        v64 = (void *)objc_claimAutoreleasedReturnValue();
        v90 = v64;
        v92 = v62;
        if (objc_msgSend(v64, "notModified"))
        {
          v65 = v80;
          COCoreLogForCategory(2);
          v66 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v66, OS_LOG_TYPE_DEBUG))
          {
            *(_DWORD *)buf = 134218242;
            v145 = v79;
            v146 = 2112;
            v147 = v63;
            _os_log_debug_impl(&dword_215E92000, v66, OS_LOG_TYPE_DEBUG, "%p response is not-modified for %@", buf, 0x16u);
          }

        }
        else
        {
          objc_msgSend(v64, "alarms");
          v65 = objc_claimAutoreleasedReturnValue();
        }
        v100 = 0u;
        v101 = 0u;
        v98 = 0u;
        v99 = 0u;
        obja = v65;
        -[COMeshAlarmAddOn _commandsForReconciling:toTruth:forNode:](v93, "_commandsForReconciling:toTruth:forNode:", v65, v82, v63);
        v67 = (void *)objc_claimAutoreleasedReturnValue();
        v68 = objc_msgSend(v67, "countByEnumeratingWithState:objects:count:", &v98, v135, 16);
        if (v68)
        {
          v69 = v68;
          v70 = *(_QWORD *)v99;
          do
          {
            for (ii = 0; ii != v69; ++ii)
            {
              if (*(_QWORD *)v99 != v70)
                objc_enumerationMutation(v67);
              v72 = *(_QWORD *)(*((_QWORD *)&v98 + 1) + 8 * ii);
              objc_opt_class();
              if ((objc_opt_isKindOfClass() & 1) != 0)
              {
                v97[0] = MEMORY[0x24BDAC760];
                v97[1] = 3221225472;
                v97[2] = __33__COMeshAlarmAddOn__finishMerge___block_invoke_125;
                v97[3] = &unk_24D4B08D0;
                v97[4] = v93;
                v97[5] = v72;
                v97[6] = v63;
                v73 = (void *)MEMORY[0x2199F3D40](v97);
                objc_msgSend(v95, "addObject:", v73);

              }
            }
            v69 = objc_msgSend(v67, "countByEnumeratingWithState:objects:count:", &v98, v135, 16);
          }
          while (v69);
        }

        v62 = v92 + 1;
        v61 = 0x24BDBC000uLL;
      }
      while (v92 + 1 != v84);
      v84 = objc_msgSend(v86, "countByEnumeratingWithState:objects:count:", &v102, v136, 16);
    }
    while (v84);
  }

  -[COMeshAlarmAddOn setMergeRequest:](v93, "setMergeRequest:", 0);
  -[COMeshAlarmAddOn setMergeAlarms:](v93, "setMergeAlarms:", 0);
  v74 = objc_alloc_init(MEMORY[0x24BDBCE70]);
  -[COMeshAlarmAddOn setMergeResponses:](v93, "setMergeResponses:", v74);

  v75 = objc_alloc_init(*(Class *)(v61 + 3632));
  -[COMeshAlarmAddOn setMergingNodes:](v93, "setMergingNodes:", v75);

  -[COMeshAlarmAddOn queuedCommands](v93, "queuedCommands");
  v76 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v95, "addObjectsFromArray:", v76);

  -[COMeshAlarmAddOn setQueuedCommands:](v93, "setQueuedCommands:", v95);
  COCoreLogForCategory(2);
  v77 = objc_claimAutoreleasedReturnValue();
  v4 = v78;
  if (os_log_type_enabled(v77, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134218240;
    v145 = v79;
    v146 = 2048;
    v147 = v78;
    _os_log_impl(&dword_215E92000, v77, OS_LOG_TYPE_DEFAULT, "%p concluded merge %p", buf, 0x16u);
  }

  -[COMeshAlarmAddOn _processQueuedCommands](v93, "_processQueuedCommands");
  v7 = v80;
LABEL_87:

}

void __33__COMeshAlarmAddOn__finishMerge___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  id v4;

  v4 = a2;
  objc_msgSend(*(id *)(a1 + 32), "objectForKey:");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
    objc_msgSend(*(id *)(a1 + 32), "removeObjectForKey:", v4);

}

uint64_t __33__COMeshAlarmAddOn__finishMerge___block_invoke_123(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "handleAlarmsUpdatedNotification:", *(_QWORD *)(a1 + 40));
}

uint64_t __33__COMeshAlarmAddOn__finishMerge___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "handleAlarmsAddedNotification:", *(_QWORD *)(a1 + 40));
}

uint64_t __33__COMeshAlarmAddOn__finishMerge___block_invoke_3(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "handleAlarmsRemovedNotification:", *(_QWORD *)(a1 + 40));
}

void __33__COMeshAlarmAddOn__finishMerge___block_invoke_125(uint64_t a1)
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
  -[COMeshAlarmAddOn observedAlarmManager](self, "observedAlarmManager");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "alarms");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_initWeak(&location, self);
  v7 = MEMORY[0x24BDAC760];
  v15[0] = MEMORY[0x24BDAC760];
  v15[1] = 3221225472;
  v15[2] = __47__COMeshAlarmAddOn__reloadIndexWithCompletion___block_invoke;
  v15[3] = &unk_24D4B0DD8;
  objc_copyWeak(&v17, &location);
  v8 = v4;
  v16 = v8;
  v9 = (id)objc_msgSend(v6, "addFailureBlock:", v15);
  v12[0] = v7;
  v12[1] = 3221225472;
  v12[2] = __47__COMeshAlarmAddOn__reloadIndexWithCompletion___block_invoke_2;
  v12[3] = &unk_24D4B2228;
  objc_copyWeak(&v14, &location);
  v10 = v8;
  v13 = v10;
  v11 = (id)objc_msgSend(v6, "addSuccessBlock:", v12);

  objc_destroyWeak(&v14);
  objc_destroyWeak(&v17);
  objc_destroyWeak(&location);

}

void __47__COMeshAlarmAddOn__reloadIndexWithCompletion___block_invoke(uint64_t a1, void *a2)
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
    COCoreLogForCategory(2);
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      __47__COMeshAlarmAddOn__reloadIndexWithCompletion___block_invoke_cold_1();

    objc_msgSend(WeakRetained, "meshControllerQueue");
    v6 = objc_claimAutoreleasedReturnValue();
    v7[0] = MEMORY[0x24BDAC760];
    v7[1] = 3221225472;
    v7[2] = __47__COMeshAlarmAddOn__reloadIndexWithCompletion___block_invoke_126;
    v7[3] = &unk_24D4B1428;
    v7[4] = WeakRetained;
    v8 = *(id *)(a1 + 32);
    dispatch_async(v6, v7);

  }
}

uint64_t __47__COMeshAlarmAddOn__reloadIndexWithCompletion___block_invoke_126(uint64_t a1)
{
  uint64_t result;

  objc_msgSend(*(id *)(a1 + 32), "setAlarmIndex:", 0);
  result = *(_QWORD *)(a1 + 40);
  if (result)
    return (*(uint64_t (**)(uint64_t, uint64_t))(result + 16))(result, 1);
  return result;
}

void __47__COMeshAlarmAddOn__reloadIndexWithCompletion___block_invoke_2(uint64_t a1, void *a2)
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
          objc_msgSend(v12, "alarmID", v17);
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
        v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
      }
      while (v9);
    }

    objc_msgSend(WeakRetained, "meshControllerQueue");
    v15 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __47__COMeshAlarmAddOn__reloadIndexWithCompletion___block_invoke_3;
    block[3] = &unk_24D4B0D28;
    block[4] = WeakRetained;
    v19 = v6;
    v20 = *(id *)(a1 + 32);
    v16 = v6;
    dispatch_async(v15, block);

    v3 = v17;
  }

}

uint64_t __47__COMeshAlarmAddOn__reloadIndexWithCompletion___block_invoke_3(uint64_t a1)
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
  objc_msgSend(*(id *)(a1 + 32), "alarmIndex");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isEqualToDictionary:", *(_QWORD *)(a1 + 40));

  objc_msgSend(*(id *)(a1 + 32), "setAlarmIndex:", *(_QWORD *)(a1 + 40));
  COCoreLogForCategory(2);
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
    _os_log_impl(&dword_215E92000, v4, OS_LOG_TYPE_DEFAULT, "%p alarm index reloaded; updated: %s",
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
  -[COMeshAlarmAddOn queuedCommands](self, "queuedCommands");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[COMeshAlarmAddOn setQueuedCommands:](self, "setQueuedCommands:", MEMORY[0x24BDBD1A8]);
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

- (void)_addAlarmDeleteEvent:(id)a3
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
  -[COMeshAlarmAddOn deletes](self, "deletes");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "arrayByAddingObject:", v4);
  v14 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BDBCE48], "currentCalendar");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBCE60], "now");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "dateByAddingUnit:value:toDate:options:", 16, -7, v7, 1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v16 = MEMORY[0x24BDAC760];
  v17 = 3221225472;
  v18 = __41__COMeshAlarmAddOn__addAlarmDeleteEvent___block_invoke;
  v19 = &unk_24D4B39D0;
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
  -[COMeshAlarmAddOn setDeletes:](self, "setDeletes:", v13);

}

BOOL __41__COMeshAlarmAddOn__addAlarmDeleteEvent___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  _BOOL8 v4;

  objc_msgSend(a2, "date");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "compare:", *(_QWORD *)(a1 + 32)) == -1;

  return v4;
}

- (void)_alarmManagerAlarmFired:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  NSObject *v10;
  NSObject *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  void *v23;
  int v24;
  NSObject *v25;
  void *v26;
  id v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t i;
  void *v32;
  void *v33;
  NSObject *v34;
  void *v35;
  id v36;
  COAlarmUpdateRequest *v37;
  NSObject *v38;
  id v39;
  COAlarmUpdateRequest *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  NSObject *v46;
  id v47;
  void *v48;
  void *v49;
  void *v50;
  int v51;
  NSObject *v52;
  NSObject *v53;
  NSObject *v54;
  COAlarmFiredNotification *v55;
  void *v56;
  void *v57;
  void *v58;
  void *v59;
  void *v60;
  void *v61;
  id v62;
  void *v63;
  _QWORD v64[5];
  id v65;
  _QWORD block[5];
  COAlarmUpdateRequest *v67;
  id v68;
  void *v69;
  COMeshAlarmAddOn *v70;
  __int128 v71;
  __int128 v72;
  __int128 v73;
  __int128 v74;
  __int128 v75;
  __int128 v76;
  __int128 v77;
  __int128 v78;
  uint8_t buf[4];
  COMeshAlarmAddOn *v80;
  __int16 v81;
  void *v82;
  _BYTE v83[128];
  _BYTE v84[128];
  uint64_t v85;

  v85 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(a3, "userInfo");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKey:", *MEMORY[0x24BE67778]);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  -[COMeshAlarmAddOn homekit](self, "homekit");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "currentAccessory");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v6, "hasOptedToHH2") & 1) != 0 || !v7)
    goto LABEL_45;
  objc_msgSend(v6, "homeForAccessory:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v58 = v6;
  v59 = v5;
  v63 = v7;
  if (!v8)
  {
    v9 = 0;
    goto LABEL_18;
  }
  objc_msgSend(v6, "mediaSystemForAccessory:inHome:", v7, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v9
    || (objc_msgSend(v6, "accessoriesInMediaSystem:inHome:", v9, v8),
        (v10 = objc_claimAutoreleasedReturnValue()) == 0))
  {
LABEL_18:
    COCoreLogForCategory(2);
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
      -[COMeshAlarmAddOn _alarmManagerAlarmFired:].cold.4();
    goto LABEL_20;
  }
  v11 = v10;
  -[NSObject firstObject](v10, "firstObject");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v60 = v8;
  v57 = v9;
  if (objc_msgSend(v12, "isEqual:", v7))
  {
    -[NSObject objectAtIndex:](v11, "objectAtIndex:", 1);
    v13 = objc_claimAutoreleasedReturnValue();

    v12 = (void *)v13;
  }
  objc_msgSend(v12, "device", v12);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "idsIdentifier");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "UUIDString");
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  -[COMeshAddOn meshController](self, "meshController");
  v75 = 0u;
  v76 = 0u;
  v77 = 0u;
  v78 = 0u;
  v61 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v61, "nodes");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v75, v84, 16);
  if (!v18)
  {
LABEL_56:

    v5 = v59;
    v8 = v60;
    v7 = v63;
    v9 = v57;
LABEL_20:

    COCoreLogForCategory(2);
    v25 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v25, OS_LOG_TYPE_DEBUG))
      -[COMeshAlarmAddOn _alarmManagerAlarmFired:].cold.3();

    objc_msgSend(MEMORY[0x24BDBCEB8], "array");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v71 = 0u;
    v72 = 0u;
    v73 = 0u;
    v74 = 0u;
    v27 = v5;
    v28 = objc_msgSend(v27, "countByEnumeratingWithState:objects:count:", &v71, v83, 16);
    if (v28)
    {
      v29 = v28;
      v30 = *(_QWORD *)v72;
      v62 = v27;
      do
      {
        for (i = 0; i != v29; ++i)
        {
          if (*(_QWORD *)v72 != v30)
            objc_enumerationMutation(v27);
          v32 = *(void **)(*((_QWORD *)&v71 + 1) + 8 * i);
          if ((objc_msgSend(v32, "isEnabled") & 1) == 0
            && -[COMeshAlarmAddOn _isAlarm:targetingAccessory:](self, "_isAlarm:targetingAccessory:", v32, v7))
          {
            v33 = v26;
            COCoreLogForCategory(2);
            v34 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v34, OS_LOG_TYPE_DEBUG))
            {
              objc_msgSend(v32, "alarmID");
              v41 = (void *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = 134218242;
              v80 = self;
              v81 = 2112;
              v82 = v41;
              _os_log_debug_impl(&dword_215E92000, v34, OS_LOG_TYPE_DEBUG, "%p %@ is not enabled, so will update.", buf, 0x16u);

            }
            v35 = (void *)objc_msgSend(v32, "mutableCopy");
            objc_msgSend(v35, "setFiredDate:", 0);
            objc_msgSend(v35, "setSnoozeFireDate:", 0);
            objc_msgSend(v35, "setEnabled:", 0);
            v36 = objc_alloc_init(MEMORY[0x24BE6B608]);
            v37 = -[COAlarmRequest initWithAlarm:]([COAlarmUpdateRequest alloc], "initWithAlarm:", v35);
            -[COMeshAddOn meshControllerQueue](self, "meshControllerQueue");
            v38 = objc_claimAutoreleasedReturnValue();
            block[0] = MEMORY[0x24BDAC760];
            block[1] = 3221225472;
            block[2] = __44__COMeshAlarmAddOn__alarmManagerAlarmFired___block_invoke;
            block[3] = &unk_24D4B3A20;
            block[4] = self;
            v67 = v37;
            v69 = v32;
            v70 = self;
            v68 = v36;
            v39 = v36;
            v40 = v37;
            dispatch_async(v38, block);

            v26 = v33;
            objc_msgSend(v33, "addObject:", v39);

            v27 = v62;
            v7 = v63;
          }
        }
        v29 = objc_msgSend(v27, "countByEnumeratingWithState:objects:count:", &v71, v83, 16);
      }
      while (v29);
    }

    if (objc_msgSend(v26, "count"))
    {
      v42 = (void *)MEMORY[0x24BE6B628];
      -[COMeshAddOn meshControllerQueue](self, "meshControllerQueue");
      v43 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v42, "schedulerWithDispatchQueue:", v43);
      v44 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(MEMORY[0x24BE6B608], "combineAllFutures:ignoringErrors:scheduler:", v26, 1, v44);
      v45 = (void *)objc_claimAutoreleasedReturnValue();

      v6 = v58;
      v5 = v59;
    }
    else
    {
      COCoreLogForCategory(2);
      v46 = objc_claimAutoreleasedReturnValue();
      v6 = v58;
      if (os_log_type_enabled(v46, OS_LOG_TYPE_DEBUG))
        -[COMeshAlarmAddOn _alarmManagerAlarmFired:].cold.2();

      objc_msgSend(MEMORY[0x24BE6B608], "futureWithNoResult");
      v45 = (void *)objc_claimAutoreleasedReturnValue();
      v5 = v59;
    }
    v64[0] = MEMORY[0x24BDAC760];
    v64[1] = 3221225472;
    v64[2] = __44__COMeshAlarmAddOn__alarmManagerAlarmFired___block_invoke_137;
    v64[3] = &unk_24D4B3A48;
    v64[4] = self;
    v65 = v27;
    v47 = (id)objc_msgSend(v45, "addCompletionBlock:", v64);

LABEL_53:
    goto LABEL_54;
  }
  v19 = v18;
  v20 = *(_QWORD *)v76;
LABEL_10:
  v21 = 0;
  while (1)
  {
    if (*(_QWORD *)v76 != v20)
      objc_enumerationMutation(v17);
    v22 = *(void **)(*((_QWORD *)&v75 + 1) + 8 * v21);
    objc_msgSend(v22, "IDSIdentifier");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = objc_msgSend(v16, "isEqual:", v23);

    if (v24)
      break;
    if (v19 == ++v21)
    {
      v19 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v75, v84, 16);
      if (v19)
        goto LABEL_10;
      goto LABEL_56;
    }
  }
  objc_msgSend(v61, "me");
  v48 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "remote");
  v49 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v49, "compare:", v48) != -1)
  {
    objc_msgSend(v49, "software");
    v50 = (void *)objc_claimAutoreleasedReturnValue();
    v51 = objc_msgSend(v50, "hasPrefix:", CFSTR("14."));

    if (!v51)
    {

      goto LABEL_56;
    }
  }
  COCoreLogForCategory(2);
  v52 = objc_claimAutoreleasedReturnValue();
  v6 = v58;
  v5 = v59;
  if (os_log_type_enabled(v52, OS_LOG_TYPE_DEBUG))
    -[COMeshAlarmAddOn _alarmManagerAlarmFired:].cold.5((uint64_t)self);

  v7 = v63;
LABEL_45:
  COCoreLogForCategory(2);
  v53 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v53, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134217984;
    v80 = self;
    _os_log_impl(&dword_215E92000, v53, OS_LOG_TYPE_DEFAULT, "%p posting fired notification.", buf, 0xCu);
  }

  -[COMeshAlarmAddOn delegate](self, "delegate");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v26, "alarmAddOn:didFireAlarms:", self, v5);
  if (-[COMeshAlarmAddOn performsLocalActions](self, "performsLocalActions"))
  {
    -[COMeshAddOn meshController](self, "meshController");
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    COCoreLogForCategory(2);
    v54 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v54, OS_LOG_TYPE_DEBUG))
      -[COMeshTimerAddOn _timerManagerTimerFired:].cold.1();

    v55 = -[COAlarmNotification initWithAlarms:]([COAlarmFiredNotification alloc], "initWithAlarms:", v5);
    objc_msgSend(v45, "sendNotification:", v55);

    goto LABEL_53;
  }
LABEL_54:

}

void __44__COMeshAlarmAddOn__alarmManagerAlarmFired___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  _QWORD v4[4];
  id v5;
  __int128 v6;

  v2 = *(void **)(a1 + 32);
  v3 = *(_QWORD *)(a1 + 40);
  v4[0] = MEMORY[0x24BDAC760];
  v4[1] = 3221225472;
  v4[2] = __44__COMeshAlarmAddOn__alarmManagerAlarmFired___block_invoke_2;
  v4[3] = &unk_24D4B39F8;
  v5 = *(id *)(a1 + 48);
  v6 = *(_OWORD *)(a1 + 56);
  objc_msgSend(v2, "handleAlarmUpdateRequest:callback:", v3, v4);

}

void __44__COMeshAlarmAddOn__alarmManagerAlarmFired___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;

  v5 = a2;
  v6 = a3;
  if (v6 || (objc_msgSend(v5, "error"), (v6 = (id)objc_claimAutoreleasedReturnValue()) != 0))
  {
    COCoreLogForCategory(2);
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      __44__COMeshAlarmAddOn__alarmManagerAlarmFired___block_invoke_2_cold_1();

    objc_msgSend(*(id *)(a1 + 32), "finishWithError:", v6);
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "finishWithNoResult");
  }

}

void __44__COMeshAlarmAddOn__alarmManagerAlarmFired___block_invoke_137(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  void *v4;
  void *v5;
  NSObject *v6;
  COAlarmFiredNotification *v7;
  int v8;
  uint64_t v9;
  uint64_t v10;

  v10 = *MEMORY[0x24BDAC8D0];
  COCoreLogForCategory(2);
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    v3 = *(_QWORD *)(a1 + 32);
    v8 = 134217984;
    v9 = v3;
    _os_log_impl(&dword_215E92000, v2, OS_LOG_TYPE_DEFAULT, "%p done synchronizing, so posting notification.", (uint8_t *)&v8, 0xCu);
  }

  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v4, "alarmAddOn:didFireAlarms:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));
  if (objc_msgSend(*(id *)(a1 + 32), "performsLocalActions"))
  {
    objc_msgSend(*(id *)(a1 + 32), "meshController");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    COCoreLogForCategory(2);
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
      -[COMeshTimerAddOn _timerManagerTimerFired:].cold.1();

    v7 = -[COAlarmNotification initWithAlarms:]([COAlarmFiredNotification alloc], "initWithAlarms:", *(_QWORD *)(a1 + 40));
    objc_msgSend(v5, "sendNotification:", v7);

  }
}

- (void)_alarmManagerStateReset:(id)a3
{
  id v4;
  _QWORD v5[4];
  id v6;
  id location;

  v4 = a3;
  objc_initWeak(&location, self);
  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 3221225472;
  v5[2] = __44__COMeshAlarmAddOn__alarmManagerStateReset___block_invoke;
  v5[3] = &unk_24D4B1C38;
  objc_copyWeak(&v6, &location);
  -[COMeshAlarmAddOn _reloadIndexWithCompletion:](self, "_reloadIndexWithCompletion:", v5);
  objc_destroyWeak(&v6);
  objc_destroyWeak(&location);

}

void __44__COMeshAlarmAddOn__alarmManagerStateReset___block_invoke(uint64_t a1, char a2)
{
  id WeakRetained;
  void *v4;
  void *v5;
  COAlarmManagerStateResetNotification *v6;
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
      v6 = objc_alloc_init(COAlarmManagerStateResetNotification);
      COCoreLogForCategory(2);
      v7 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
        __44__COMeshTimerAddOn__timerManagerStateReset___block_invoke_cold_1();

      objc_msgSend(v5, "sendNotification:", v6);
      objc_msgSend(v4, "delegate");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      if ((objc_opt_respondsToSelector() & 1) != 0)
        objc_msgSend(v8, "didResetAlarmAddOn:", v4);

    }
    else
    {
      COCoreLogForCategory(2);
      v6 = (COAlarmManagerStateResetNotification *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(&v6->super.super.super, OS_LOG_TYPE_DEFAULT))
      {
        v9 = 134217984;
        v10 = v5;
        _os_log_impl(&dword_215E92000, &v6->super.super.super, OS_LOG_TYPE_DEFAULT, "%p not emitting state reset, alarms not updated", (uint8_t *)&v9, 0xCu);
      }
    }

  }
}

- (void)_alarmManagerAlarmsChanged:(id)a3
{
  void *v4;
  void *v5;
  id v6;

  objc_msgSend(a3, "userInfo");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKey:", *MEMORY[0x24BE67778]);
  v6 = (id)objc_claimAutoreleasedReturnValue();

  -[COMeshAlarmAddOn delegate](self, "delegate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v5, "alarmAddOn:didChangeAlarms:", self, v6);

}

- (void)_alarmManagerFiringAlarmChanged:(id)a3
{
  void *v4;
  void *v5;
  id v6;

  objc_msgSend(a3, "userInfo");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKey:", *MEMORY[0x24BE67778]);
  v6 = (id)objc_claimAutoreleasedReturnValue();

  -[COMeshAlarmAddOn delegate](self, "delegate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v5, "alarmAddOn:didChangeFiringAlarms:", self, v6);

}

- (void)_accessorySettingValueUpdated:(id)a3
{
  void *v4;
  int v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  objc_msgSend(a3, "object");
  v9 = (id)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v9, "keyPath");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "isEqualToString:", CFSTR("root.mobileTimer.alarms"));

    if (v5)
    {
      -[COMeshAlarmAddOn homekit](self, "homekit");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "currentAccessory");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      if (v7)
      {
        objc_msgSend(v6, "homeForAccessory:", v7);
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        if (v8 && objc_msgSend(v6, "isAlarmsCollectionSetting:forAccessory:inHome:", v9, v7, v8))
          -[COMeshAlarmAddOn _replicateToMobileTimerFromHomeKit](self, "_replicateToMobileTimerFromHomeKit");
      }
      else
      {
        -[COMeshAlarmAddOn delegate](self, "delegate");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        if ((objc_opt_respondsToSelector() & 1) != 0)
          objc_msgSend(v8, "didResetAlarmAddOn:", self);
      }

    }
  }

}

- (id)_currentAccessoryForConnection:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  objc_msgSend(a3, "co_PeerInstance");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    -[COMeshAlarmAddOn homehub](self, "homehub");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[COMeshAlarmAddOn homekit](self, "homekit");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "accessoryForPeerInstance:usingHomeKitAdapter:", v4, v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    -[COMeshAlarmAddOn homekit](self, "homekit");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "currentAccessory");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v7;
}

- (void)_replicateToMobileTimerFromHomeKit
{
  void *v3;
  char v4;
  void *v5;
  NSObject *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  id v14;
  _QWORD v15[5];
  id v16;
  id v17;
  id v18;
  id v19;
  id v20;
  id v21;
  uint8_t buf[4];
  void *v23;
  uint64_t v24;

  v24 = *MEMORY[0x24BDAC8D0];
  if (-[COMeshAlarmAddOn performsLocalActions](self, "performsLocalActions"))
  {
    -[COMeshAlarmAddOn homekit](self, "homekit");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = objc_msgSend(v3, "hasOptedToHH2");

    if ((v4 & 1) == 0)
    {
      -[COMeshAddOn meshController](self, "meshController");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      COCoreLogForCategory(2);
      v6 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 134217984;
        v23 = v5;
        _os_log_impl(&dword_215E92000, v6, OS_LOG_TYPE_DEFAULT, "%p starting replication of alarms...", buf, 0xCu);
      }

      -[COMeshAlarmAddOn homekit](self, "homekit");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "currentAccessory");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      if (v8)
      {
        objc_msgSend(v7, "homeForAccessory:", v8);
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        if (v9)
        {
          objc_msgSend(v7, "alarmsForAccessory:inHome:", v8, v9);
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          if (v10)
          {
            -[COMeshAlarmAddOn alarmManager](self, "alarmManager");
            v11 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v11, "alarms");
            v12 = (void *)objc_claimAutoreleasedReturnValue();
            v15[0] = MEMORY[0x24BDAC760];
            v15[1] = 3221225472;
            v15[2] = __54__COMeshAlarmAddOn__replicateToMobileTimerFromHomeKit__block_invoke;
            v15[3] = &unk_24D4B3A70;
            v15[4] = self;
            v16 = v8;
            v17 = v10;
            v18 = v5;
            v19 = v11;
            v20 = v7;
            v21 = v9;
            v13 = v11;
            v14 = (id)objc_msgSend(v12, "addSuccessBlock:", v15);

          }
        }

      }
    }
  }
}

void __54__COMeshAlarmAddOn__replicateToMobileTimerFromHomeKit__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  id v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  void *v12;
  id v13;
  id v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t j;
  void *v19;
  void *v20;
  id v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  void *v26;
  void *v27;
  uint64_t v28;
  void *v29;
  char v30;
  NSObject *v31;
  id v32;
  NSObject *v33;
  id v34;
  void *v35;
  NSObject *v36;
  uint64_t v37;
  id v38;
  void *v39;
  NSObject *v40;
  void *v41;
  id v42;
  id v43;
  uint64_t v44;
  void *v45;
  void *v46;
  uint64_t v47;
  id v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t k;
  void *v53;
  NSObject *v54;
  id v55;
  uint64_t v56;
  void *v57;
  NSObject *v58;
  uint64_t v59;
  void *v60;
  void *v61;
  uint64_t v62;
  void *v63;
  void *v64;
  uint64_t v65;
  uint64_t v66;
  __int128 v67;
  __int128 v68;
  __int128 v69;
  __int128 v70;
  __int128 v71;
  __int128 v72;
  __int128 v73;
  __int128 v74;
  __int128 v75;
  __int128 v76;
  __int128 v77;
  __int128 v78;
  __int128 v79;
  __int128 v80;
  __int128 v81;
  __int128 v82;
  uint8_t v83[128];
  uint8_t buf[4];
  uint64_t v85;
  __int16 v86;
  void *v87;
  __int16 v88;
  void *v89;
  _BYTE v90[128];
  _BYTE v91[128];
  _BYTE v92[128];
  uint64_t v93;

  v93 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCEB8]), "initWithCapacity:", objc_msgSend(v3, "count"));
  v5 = objc_alloc_init(MEMORY[0x24BDBCED8]);
  v79 = 0u;
  v80 = 0u;
  v81 = 0u;
  v82 = 0u;
  v6 = v3;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v79, v92, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v80;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v80 != v9)
          objc_enumerationMutation(v6);
        v11 = *(void **)(*((_QWORD *)&v79 + 1) + 8 * i);
        if (objc_msgSend(*(id *)(a1 + 32), "_isAlarm:targetingAccessory:", v11, *(_QWORD *)(a1 + 40)))
        {
          objc_msgSend(v4, "addObject:", v11);
          objc_msgSend(v11, "alarmID");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v5, "setObject:forKey:", v11, v12);

        }
      }
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v79, v92, 16);
    }
    while (v8);
  }
  v61 = v4;

  v13 = objc_alloc_init(MEMORY[0x24BDBCED8]);
  v75 = 0u;
  v76 = 0u;
  v77 = 0u;
  v78 = 0u;
  v14 = *(id *)(a1 + 48);
  v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v75, v91, 16);
  if (v15)
  {
    v16 = v15;
    v17 = *(_QWORD *)v76;
    do
    {
      for (j = 0; j != v16; ++j)
      {
        if (*(_QWORD *)v76 != v17)
          objc_enumerationMutation(v14);
        v19 = *(void **)(*((_QWORD *)&v75 + 1) + 8 * j);
        objc_msgSend(v19, "alarmID");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "setObject:forKey:", v19, v20);

      }
      v16 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v75, v91, 16);
    }
    while (v16);
  }
  v60 = v6;

  v73 = 0u;
  v74 = 0u;
  v71 = 0u;
  v72 = 0u;
  v21 = v13;
  v22 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &v71, v90, 16);
  if (v22)
  {
    v23 = v22;
    v66 = *(_QWORD *)v72;
    do
    {
      v24 = 0;
      do
      {
        if (*(_QWORD *)v72 != v66)
          objc_enumerationMutation(v21);
        v25 = *(_QWORD *)(*((_QWORD *)&v71 + 1) + 8 * v24);
        objc_msgSend(v21, "objectForKey:", v25, v60, v61);
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "objectForKey:", v25);
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        if (v27)
        {
          objc_msgSend(v26, "COPreferredAlarm:", v27);
          v28 = objc_claimAutoreleasedReturnValue();
          if (v27 == (void *)v28)
          {

          }
          else
          {
            v29 = (void *)v28;
            v30 = objc_msgSend(v26, "isEqualIgnoringLastModifiedDate:", v27);

            if ((v30 & 1) == 0)
            {
              if (objc_msgSend(v27, "co_isMediaSystemOriginating")
                && !objc_msgSend(v26, "co_isMediaSystemOriginating"))
              {
                objc_msgSend(v26, "co_HomeKitAlarmCopy");
                v39 = (void *)objc_claimAutoreleasedReturnValue();
                COCoreLogForCategory(2);
                v40 = objc_claimAutoreleasedReturnValue();
                if (os_log_type_enabled(v40, OS_LOG_TYPE_DEFAULT))
                {
                  v62 = *(_QWORD *)(a1 + 56);
                  objc_msgSend(v39, "alarmID");
                  v64 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v26, "alarmID");
                  v63 = v39;
                  v41 = (void *)objc_claimAutoreleasedReturnValue();
                  *(_DWORD *)buf = 134218498;
                  v85 = v62;
                  v86 = 2112;
                  v87 = v64;
                  v88 = 2112;
                  v89 = v41;
                  _os_log_impl(&dword_215E92000, v40, OS_LOG_TYPE_DEFAULT, "%p swapping %@ for %@", buf, 0x20u);

                  v39 = v63;
                }

                v42 = (id)objc_msgSend(*(id *)(a1 + 72), "removeAlarm:fromAccessory:inHome:", v26, *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 80));
                v43 = (id)objc_msgSend(*(id *)(a1 + 72), "addAlarm:toAccessory:inHome:", v39, *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 80));

              }
              else
              {
                COCoreLogForCategory(2);
                v31 = objc_claimAutoreleasedReturnValue();
                if (os_log_type_enabled(v31, OS_LOG_TYPE_DEBUG))
                {
                  v65 = *(_QWORD *)(a1 + 56);
                  objc_msgSend(v26, "alarmID");
                  v46 = (void *)objc_claimAutoreleasedReturnValue();
                  *(_DWORD *)buf = 134218242;
                  v85 = v65;
                  v86 = 2112;
                  v87 = v46;
                  _os_log_debug_impl(&dword_215E92000, v31, OS_LOG_TYPE_DEBUG, "%p updating alarm %@", buf, 0x16u);

                }
                v32 = (id)objc_msgSend(*(id *)(a1 + 64), "updateAlarm:", v26);
              }
LABEL_41:
              objc_msgSend(v5, "removeObjectForKey:", v25);
              goto LABEL_42;
            }
          }
          if ((objc_msgSend(v27, "isFiring") & 1) != 0 || objc_msgSend(v27, "isSnoozed"))
          {
            objc_msgSend(v27, "co_alarmUpdatedWithHomeKitAlarm:", v26);
            v35 = (void *)objc_claimAutoreleasedReturnValue();
            if (v35)
            {
              COCoreLogForCategory(2);
              v36 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v36, OS_LOG_TYPE_DEFAULT))
              {
                v37 = *(_QWORD *)(a1 + 56);
                *(_DWORD *)buf = 134218242;
                v85 = v37;
                v86 = 2112;
                v87 = v35;
                _os_log_impl(&dword_215E92000, v36, OS_LOG_TYPE_DEFAULT, "%p targeted updating alarm %@", buf, 0x16u);
              }

              v38 = (id)objc_msgSend(*(id *)(a1 + 64), "updateAlarm:", v35);
            }

          }
          goto LABEL_41;
        }
        COCoreLogForCategory(2);
        v33 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v33, OS_LOG_TYPE_DEBUG))
        {
          v44 = *(_QWORD *)(a1 + 56);
          objc_msgSend(v26, "alarmID");
          v45 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 134218242;
          v85 = v44;
          v86 = 2112;
          v87 = v45;
          _os_log_debug_impl(&dword_215E92000, v33, OS_LOG_TYPE_DEBUG, "%p adding alarm %@", buf, 0x16u);

        }
        v34 = (id)objc_msgSend(*(id *)(a1 + 64), "addAlarm:", v26);
LABEL_42:

        ++v24;
      }
      while (v23 != v24);
      v47 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &v71, v90, 16);
      v23 = v47;
    }
    while (v47);
  }

  v69 = 0u;
  v70 = 0u;
  v67 = 0u;
  v68 = 0u;
  v48 = v5;
  v49 = objc_msgSend(v48, "countByEnumeratingWithState:objects:count:", &v67, v83, 16);
  if (v49)
  {
    v50 = v49;
    v51 = *(_QWORD *)v68;
    do
    {
      for (k = 0; k != v50; ++k)
      {
        if (*(_QWORD *)v68 != v51)
          objc_enumerationMutation(v48);
        objc_msgSend(v48, "objectForKey:", *(_QWORD *)(*((_QWORD *)&v67 + 1) + 8 * k), v60);
        v53 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(*(id *)(a1 + 32), "_isAlarm:targetingAccessory:", v53, *(_QWORD *)(a1 + 40)))
        {
          COCoreLogForCategory(2);
          v54 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v54, OS_LOG_TYPE_DEBUG))
          {
            v56 = *(_QWORD *)(a1 + 56);
            objc_msgSend(v53, "alarmID");
            v57 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 134218242;
            v85 = v56;
            v86 = 2112;
            v87 = v57;
            _os_log_debug_impl(&dword_215E92000, v54, OS_LOG_TYPE_DEBUG, "%p removing alarm %@", buf, 0x16u);

          }
          v55 = (id)objc_msgSend(*(id *)(a1 + 64), "removeAlarm:", v53);
        }

      }
      v50 = objc_msgSend(v48, "countByEnumeratingWithState:objects:count:", &v67, v83, 16);
    }
    while (v50);
  }

  COCoreLogForCategory(2);
  v58 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v58, OS_LOG_TYPE_DEFAULT))
  {
    v59 = *(_QWORD *)(a1 + 56);
    *(_DWORD *)buf = 134217984;
    v85 = v59;
    _os_log_impl(&dword_215E92000, v58, OS_LOG_TYPE_DEFAULT, "... %p finished replication of alarms.", buf, 0xCu);
  }

}

- (id)_filteredAlarmsList:(id)a3 forAccessory:(id)a4
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
  COMeshAlarmAddOn *v19;

  v6 = a3;
  v7 = a4;
  COCoreLogForCategory(2);
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
    -[COMeshAlarmAddOn _filteredAlarmsList:forAccessory:].cold.1();

  v14 = MEMORY[0x24BDAC760];
  v15 = 3221225472;
  v16 = __53__COMeshAlarmAddOn__filteredAlarmsList_forAccessory___block_invoke;
  v17 = &unk_24D4B3198;
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

uint64_t __53__COMeshAlarmAddOn__filteredAlarmsList_forAccessory___block_invoke(uint64_t a1, void *a2)
{
  int v2;
  void *v3;
  void *v4;

  if (*(_QWORD *)(a1 + 32))
  {
    v2 = objc_msgSend(*(id *)(a1 + 40), "_isAlarm:targetingAccessory:", a2);
  }
  else
  {
    objc_msgSend(a2, "siriContext");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "objectForKey:", *MEMORY[0x24BE19C48]);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v2 = v4 == 0;

  }
  return v2 ^ 1u;
}

- (id)_alarmsForAccessory:(id)a3 allowLocalStorage:(BOOL)a4 usingLeader:(BOOL)a5 member:(id)a6 client:(id)a7
{
  id v12;
  id v13;
  id v14;
  void *v15;
  id v16;
  NSObject *v17;
  id v18;
  id v19;
  id v20;
  id v21;
  id v22;
  void *v23;
  id v24;
  _QWORD block[4];
  id v27;
  id v28;
  id v29;
  id v30;
  COMeshAlarmAddOn *v31;
  id v32;
  BOOL v33;
  BOOL v34;

  v12 = a3;
  v13 = a6;
  v14 = a7;
  -[COMeshAddOn meshController](self, "meshController");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = objc_alloc_init(MEMORY[0x24BE6B608]);
  -[COMeshAddOn meshControllerQueue](self, "meshControllerQueue");
  v17 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __84__COMeshAlarmAddOn__alarmsForAccessory_allowLocalStorage_usingLeader_member_client___block_invoke;
  block[3] = &unk_24D4B3B78;
  v27 = v13;
  v28 = v15;
  v29 = v12;
  v30 = v14;
  v31 = self;
  v18 = v16;
  v32 = v18;
  v33 = a4;
  v34 = a5;
  v19 = v14;
  v20 = v12;
  v21 = v15;
  v22 = v13;
  dispatch_async(v17, block);

  v23 = v32;
  v24 = v18;

  return v24;
}

void __84__COMeshAlarmAddOn__alarmsForAccessory_allowLocalStorage_usingLeader_member_client___block_invoke(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  uint64_t v4;
  objc_class *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  id v14;
  COAlarmReadRequest *v15;
  void (**v16)(_QWORD, _QWORD, _QWORD);
  void *v17;
  NSObject *v18;
  uint64_t v19;
  uint64_t v20;
  COAlarmReadRequest *v21;
  void *v22;
  COAlarmReadRequest *v23;
  void *v24;
  void *v25;
  uint64_t v26;
  id v27;
  id v28;
  uint64_t v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void (**v34)(_QWORD, _QWORD, _QWORD);
  NSObject *v35;
  uint64_t v36;
  uint64_t v37;
  void *v38;
  void *v39;
  COAlarmReadRequest *v40;
  uint64_t v41;
  id v42;
  void (**v43)(_QWORD, _QWORD, _QWORD);
  _QWORD v44[4];
  char v45;
  _QWORD v46[4];
  COAlarmReadRequest *v47;
  id v48;
  _QWORD v49[4];
  id v50;
  id v51;
  id v52;
  COAlarmReadRequest *v53;
  id v54;
  uint64_t v55;
  id v56;
  _QWORD v57[4];
  COAlarmReadRequest *v58;
  uint64_t v59;
  id v60;
  id v61;
  _QWORD v62[4];
  id v63;
  id v64;
  COAlarmReadRequest *v65;
  id v66;
  id v67;
  id v68;
  uint8_t buf[4];
  uint64_t v70;
  __int16 v71;
  uint64_t v72;
  uint64_t v73;

  v73 = *MEMORY[0x24BDAC8D0];
  if (*(_QWORD *)(a1 + 32))
  {
    COCoreLogForCategory(2);
    v2 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
    {
      v3 = *(_QWORD *)(a1 + 40);
      v4 = *(_QWORD *)(a1 + 48);
      *(_DWORD *)buf = 134218242;
      v70 = v3;
      v71 = 2114;
      v72 = v4;
      _os_log_impl(&dword_215E92000, v2, OS_LOG_TYPE_DEFAULT, "%p using secondary cluster alarms for %{public}@", buf, 0x16u);
    }

    v5 = (objc_class *)objc_opt_class();
    NSStringFromClass(v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    +[COMTReadAction actionWithTargetType:targetMemento:](COMTReadAction, "actionWithTargetType:targetMemento:", v6, *(_QWORD *)(a1 + 48));
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(*(id *)(a1 + 56), "clientLifetimeActivity");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    +[CONetworkActivityFactory activityWithLabel:parentActivity:](CONetworkActivityFactory, "activityWithLabel:parentActivity:", 3, v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    if (v9)
      nw_activity_activate();
    objc_msgSend(*(id *)(a1 + 64), "meshControllerQueue");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_initWeak((id *)buf, *(id *)(a1 + 64));
    objc_msgSend(*(id *)(a1 + 64), "actionDirector");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDBCF20], "setWithObject:", *(_QWORD *)(a1 + 32));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v62[0] = MEMORY[0x24BDAC760];
    v62[1] = 3221225472;
    v62[2] = __84__COMeshAlarmAddOn__alarmsForAccessory_allowLocalStorage_usingLeader_member_client___block_invoke_151;
    v62[3] = &unk_24D4B3AC0;
    v13 = v10;
    v63 = v13;
    objc_copyWeak(&v68, (id *)buf);
    v14 = v9;
    v64 = v14;
    v15 = v7;
    v65 = v15;
    v66 = *(id *)(a1 + 56);
    v67 = *(id *)(a1 + 72);
    objc_msgSend(v11, "requestAction:members:activity:withCompletion:", v15, v12, v14, v62);

    objc_msgSend(*(id *)(a1 + 64), "recorder");
    v16 = (void (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
    ((void (**)(_QWORD, const __CFString *, void *))v16)[2](v16, CFSTR("com.apple.CoordinationCore.MeshAction"), &__block_literal_global_153);

    objc_destroyWeak(&v68);
    objc_destroyWeak((id *)buf);

  }
  else if (*(_BYTE *)(a1 + 80)
         && objc_msgSend(*(id *)(a1 + 64), "performsLocalActions")
         && (objc_msgSend(*(id *)(a1 + 40), "leader"),
             v17 = (void *)objc_claimAutoreleasedReturnValue(),
             v17,
             !v17))
  {
    COCoreLogForCategory(2);
    v35 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v35, OS_LOG_TYPE_DEFAULT))
    {
      v36 = *(_QWORD *)(a1 + 40);
      v37 = *(_QWORD *)(a1 + 48);
      *(_DWORD *)buf = 134218242;
      v70 = v36;
      v71 = 2112;
      v72 = v37;
      _os_log_impl(&dword_215E92000, v35, OS_LOG_TYPE_DEFAULT, "%p using local list of alarms for %@", buf, 0x16u);
    }

    objc_msgSend(*(id *)(a1 + 64), "alarmManager");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v38, "alarms");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    v57[0] = MEMORY[0x24BDAC760];
    v57[1] = 3221225472;
    v57[2] = __84__COMeshAlarmAddOn__alarmsForAccessory_allowLocalStorage_usingLeader_member_client___block_invoke_154;
    v57[3] = &unk_24D4B1EF8;
    v40 = (COAlarmReadRequest *)*(id *)(a1 + 48);
    v41 = *(_QWORD *)(a1 + 64);
    v58 = v40;
    v59 = v41;
    v60 = *(id *)(a1 + 40);
    v61 = *(id *)(a1 + 72);
    v42 = (id)objc_msgSend(v39, "addCompletionBlock:", v57);

    objc_msgSend(*(id *)(a1 + 64), "recorder");
    v43 = (void (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
    ((void (**)(_QWORD, const __CFString *, void *))v43)[2](v43, CFSTR("com.apple.CoordinationCore.MeshAction"), &__block_literal_global_157);

    v15 = v58;
  }
  else
  {
    COCoreLogForCategory(2);
    v18 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
    {
      v19 = *(_QWORD *)(a1 + 40);
      v20 = *(_QWORD *)(a1 + 48);
      *(_DWORD *)buf = 134218242;
      v70 = v19;
      v71 = 2112;
      v72 = v20;
      _os_log_impl(&dword_215E92000, v18, OS_LOG_TYPE_DEFAULT, "%p requesting list of alarms for %@ from the leader", buf, 0x16u);
    }

    v21 = [COAlarmReadRequest alloc];
    objc_msgSend(*(id *)(a1 + 48), "uniqueIdentifier");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = -[COAlarmReadRequest initWithAccessoryUniqueIdentifier:requiresFilter:](v21, "initWithAccessoryUniqueIdentifier:requiresFilter:", v22, 1);

    if (*(_BYTE *)(a1 + 81))
    {
      objc_msgSend(*(id *)(a1 + 56), "clientLifetimeActivity");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      +[CONetworkActivityFactory activityWithLabel:parentActivity:](CONetworkActivityFactory, "activityWithLabel:parentActivity:", 3, v24);
      v25 = (void *)objc_claimAutoreleasedReturnValue();

      if (v25)
      {
        -[COMeshRequest setActivity:](v23, "setActivity:", v25);
        nw_activity_activate();
      }
    }
    else
    {
      v25 = 0;
    }
    v26 = MEMORY[0x24BDAC760];
    v49[0] = MEMORY[0x24BDAC760];
    v49[1] = 3221225472;
    v49[2] = __84__COMeshAlarmAddOn__alarmsForAccessory_allowLocalStorage_usingLeader_member_client___block_invoke_158;
    v49[3] = &unk_24D4B3B28;
    v27 = v25;
    v50 = v27;
    v51 = *(id *)(a1 + 56);
    v52 = *(id *)(a1 + 48);
    v15 = v23;
    v53 = v15;
    v28 = *(id *)(a1 + 40);
    v29 = *(_QWORD *)(a1 + 64);
    v30 = *(void **)(a1 + 72);
    v54 = v28;
    v55 = v29;
    v56 = v30;
    v31 = (void *)MEMORY[0x2199F3D40](v49);
    v32 = v31;
    if (*(_BYTE *)(a1 + 81))
    {
      objc_msgSend(*(id *)(a1 + 40), "sendRequest:withCompletionHandler:", v15, v31);
    }
    else
    {
      v33 = *(void **)(a1 + 64);
      v46[0] = v26;
      v46[1] = 3221225472;
      v46[2] = __84__COMeshAlarmAddOn__alarmsForAccessory_allowLocalStorage_usingLeader_member_client___block_invoke_162;
      v46[3] = &unk_24D4B3B50;
      v48 = v31;
      v47 = v15;
      objc_msgSend(v33, "handleAlarmReadRequest:callback:", v47, v46);

    }
    objc_msgSend(*(id *)(a1 + 64), "recorder");
    v34 = (void (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
    v44[0] = v26;
    v44[1] = 3221225472;
    v44[2] = __84__COMeshAlarmAddOn__alarmsForAccessory_allowLocalStorage_usingLeader_member_client___block_invoke_2_163;
    v44[3] = &__block_descriptor_33_e19___NSDictionary_8__0l;
    v45 = *(_BYTE *)(a1 + 81);
    ((void (**)(_QWORD, const __CFString *, _QWORD *))v34)[2](v34, CFSTR("com.apple.CoordinationCore.MeshAction"), v44);

  }
}

void __84__COMeshAlarmAddOn__alarmsForAccessory_allowLocalStorage_usingLeader_member_client___block_invoke_151(uint64_t a1, void *a2, void *a3)
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
  id v16;
  id v17;

  v5 = a2;
  v6 = a3;
  v7 = *(NSObject **)(a1 + 32);
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __84__COMeshAlarmAddOn__alarmsForAccessory_allowLocalStorage_usingLeader_member_client___block_invoke_2;
  block[3] = &unk_24D4B3A98;
  objc_copyWeak(&v17, (id *)(a1 + 72));
  v11 = *(id *)(a1 + 40);
  v12 = *(id *)(a1 + 48);
  v13 = *(id *)(a1 + 56);
  v14 = v6;
  v15 = v5;
  v16 = *(id *)(a1 + 64);
  v8 = v5;
  v9 = v6;
  dispatch_async(v7, block);

  objc_destroyWeak(&v17);
}

void __84__COMeshAlarmAddOn__alarmsForAccessory_allowLocalStorage_usingLeader_member_client___block_invoke_2(uint64_t a1)
{
  void *v1;
  id WeakRetained;
  xpc_object_t v4;
  objc_class *v5;
  id v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  id v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  id v17;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 80));
  if (WeakRetained)
  {
    v17 = WeakRetained;
    if (*(_QWORD *)(a1 + 32))
    {
      v4 = xpc_dictionary_create(0, 0, 0);
      if (v4)
      {
        v5 = (objc_class *)objc_opt_class();
        NSStringFromClass(v5);
        v6 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
        xpc_dictionary_set_string(v4, "command", (const char *)objc_msgSend(v6, "UTF8String"));

        objc_msgSend(*(id *)(a1 + 48), "clientBundleIdentifier");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        v8 = v7;
        if (!v7)
        {
          objc_msgSend(MEMORY[0x24BDD1488], "mainBundle");
          v1 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v1, "bundleIdentifier");
          v8 = (void *)objc_claimAutoreleasedReturnValue();
        }
        xpc_dictionary_set_string(v4, "client", (const char *)objc_msgSend(objc_retainAutorelease(v8), "UTF8String"));
        if (!v7)
        {

        }
        nw_activity_submit_metrics();
      }

    }
    v9 = *(_QWORD *)(a1 + 56);
    v10 = *(_QWORD *)(a1 + 32);
    if (v9)
    {
      if (v10)
      {
        nw_activity_complete_with_reason();
        v9 = *(_QWORD *)(a1 + 56);
      }
      objc_msgSend(*(id *)(a1 + 72), "finishWithError:", v9);
    }
    else
    {
      if (v10)
        nw_activity_complete_with_reason();
      v11 = *(void **)(a1 + 64);
      v12 = *(void **)(a1 + 72);
      v13 = v11;
      objc_msgSend(v13, "alarms");
      v14 = objc_claimAutoreleasedReturnValue();
      v15 = (void *)v14;
      if (v14)
        v16 = v14;
      else
        v16 = MEMORY[0x24BDBD1A8];
      objc_msgSend(v12, "finishWithResult:", v16);

    }
    WeakRetained = v17;
  }

}

id __84__COMeshAlarmAddOn__alarmsForAccessory_allowLocalStorage_usingLeader_member_client___block_invoke_3()
{
  return COCoreAnalyticsCreateActionEvent(CFSTR("alarm"), CFSTR("read"), 0);
}

void __84__COMeshAlarmAddOn__alarmsForAccessory_allowLocalStorage_usingLeader_member_client___block_invoke_154(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  NSObject *v8;
  void *v9;
  void *v10;
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
    COCoreLogForCategory(2);
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      __84__COMeshAlarmAddOn__alarmsForAccessory_allowLocalStorage_usingLeader_member_client___block_invoke_154_cold_2();

    objc_msgSend(*(id *)(a1 + 56), "finishWithError:", v7);
    goto LABEL_14;
  }
  if (!*(_QWORD *)(a1 + 32))
    goto LABEL_8;
  objc_msgSend(*(id *)(a1 + 40), "homekit");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "uniqueIdentifier");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "accessoryWithUniqueIdentifier:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (v11)
  {
    objc_msgSend(*(id *)(a1 + 40), "_filteredAlarmsList:forAccessory:", v5, v11);
    v12 = objc_claimAutoreleasedReturnValue();

    v5 = (id)v12;
LABEL_8:
    COCoreLogForCategory(2);
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      v14 = *(_QWORD *)(a1 + 48);
      v17 = 134218242;
      v18 = v14;
      v19 = 2112;
      v20 = v5;
      _os_log_impl(&dword_215E92000, v13, OS_LOG_TYPE_DEFAULT, "%p local alarms list: %@", (uint8_t *)&v17, 0x16u);
    }

    objc_msgSend(*(id *)(a1 + 56), "finishWithResult:", v5);
    goto LABEL_14;
  }
  objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", *MEMORY[0x24BDD5BD8], 2, 0);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  COCoreLogForCategory(2);
  v16 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    __84__COMeshAlarmAddOn__alarmsForAccessory_allowLocalStorage_usingLeader_member_client___block_invoke_154_cold_1();

  objc_msgSend(*(id *)(a1 + 56), "finishWithError:", v15);
LABEL_14:

}

id __84__COMeshAlarmAddOn__alarmsForAccessory_allowLocalStorage_usingLeader_member_client___block_invoke_156()
{
  return COCoreAnalyticsCreateActionEvent(CFSTR("alarm"), CFSTR("read"), 0);
}

void __84__COMeshAlarmAddOn__alarmsForAccessory_allowLocalStorage_usingLeader_member_client___block_invoke_158(uint64_t a1, void *a2, void *a3, void *a4, void *a5)
{
  void *v5;
  void *v6;
  id v11;
  id v12;
  id v13;
  id v14;
  xpc_object_t v15;
  objc_class *v16;
  id v17;
  void *v18;
  void *v19;
  NSObject *v20;
  xpc_object_t v21;
  objc_class *v22;
  id v23;
  void *v24;
  void *v25;
  id v26;
  NSObject *v27;
  uint64_t v28;
  void *v29;
  void *v30;
  void *v31;
  uint64_t v32;
  void *v33;
  int v34;
  NSObject *v35;
  uint64_t v36;
  void *v37;
  void *v38;
  uint64_t v39;
  id v40;
  id v41;
  id v42;
  NSObject *v43;
  _QWORD v44[4];
  id v45;
  id v46;
  id v47;
  _QWORD v48[4];
  id v49;
  id v50;
  id v51;
  uint8_t buf[4];
  uint64_t v53;
  __int16 v54;
  id v55;
  uint64_t v56;

  v56 = *MEMORY[0x24BDAC8D0];
  v11 = a2;
  v12 = a3;
  v13 = a4;
  v14 = a5;
  if (!v14)
  {
    objc_msgSend(v13, "error");
    v14 = (id)objc_claimAutoreleasedReturnValue();
    if (!v14)
    {
      if (*(_QWORD *)(a1 + 32))
      {
        v21 = xpc_dictionary_create(0, 0, 0);
        if (v21)
        {
          v22 = (objc_class *)objc_opt_class();
          NSStringFromClass(v22);
          v23 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
          xpc_dictionary_set_string(v21, "command", (const char *)objc_msgSend(v23, "UTF8String"));

          objc_msgSend(*(id *)(a1 + 40), "clientBundleIdentifier");
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          v25 = v24;
          if (!v24)
          {
            objc_msgSend(MEMORY[0x24BDD1488], "mainBundle");
            v5 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v5, "bundleIdentifier");
            v25 = (void *)objc_claimAutoreleasedReturnValue();
          }
          xpc_dictionary_set_string(v21, "client", (const char *)objc_msgSend(objc_retainAutorelease(v25), "UTF8String"));
          if (!v24)
          {

          }
          nw_activity_submit_metrics();
        }
        nw_activity_complete_with_reason();

      }
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        objc_msgSend(v13, "alarms");
        v26 = (id)objc_claimAutoreleasedReturnValue();
        if (*(_QWORD *)(a1 + 48)
          && objc_msgSend(*(id *)(a1 + 56), "requiresFilter")
          && (objc_msgSend(v13, "isFiltered") & 1) == 0)
        {
          COCoreLogForCategory(2);
          v27 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v27, OS_LOG_TYPE_INFO))
          {
            v28 = *(_QWORD *)(a1 + 64);
            *(_DWORD *)buf = 134217984;
            v53 = v28;
            _os_log_impl(&dword_215E92000, v27, OS_LOG_TYPE_INFO, "%p alarm results from leader not filtered!", buf, 0xCu);
          }

          objc_msgSend(*(id *)(a1 + 72), "homekit");
          v29 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(*(id *)(a1 + 48), "uniqueIdentifier");
          v30 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v29, "accessoryWithUniqueIdentifier:", v30);
          v31 = (void *)objc_claimAutoreleasedReturnValue();

          if (!v31)
          {
            objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", *MEMORY[0x24BDD5BD8], 2, 0);
            v14 = (id)objc_claimAutoreleasedReturnValue();
            COCoreLogForCategory(2);
            v43 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v43, OS_LOG_TYPE_ERROR))
              __84__COMeshAlarmAddOn__alarmsForAccessory_allowLocalStorage_usingLeader_member_client___block_invoke_158_cold_1();

            objc_msgSend(*(id *)(a1 + 80), "finishWithError:", v14);
            goto LABEL_38;
          }
          objc_msgSend(*(id *)(a1 + 72), "_filteredAlarmsList:forAccessory:", v26, v31);
          v32 = objc_claimAutoreleasedReturnValue();

          v26 = (id)v32;
        }
      }
      else
      {
        objc_msgSend(MEMORY[0x24BDBCE30], "array");
        v26 = (id)objc_claimAutoreleasedReturnValue();
      }
      objc_msgSend(*(id *)(a1 + 72), "homekit");
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      v34 = objc_msgSend(v33, "hasOptedToHH2");

      if (v34)
      {
        COCoreLogForCategory(2);
        v35 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v35, OS_LOG_TYPE_DEFAULT))
        {
          v36 = *(_QWORD *)(a1 + 64);
          *(_DWORD *)buf = 134218242;
          v53 = v36;
          v54 = 2112;
          v55 = v26;
          _os_log_impl(&dword_215E92000, v35, OS_LOG_TYPE_DEFAULT, "%p alarms list from leader: %@", buf, 0x16u);
        }

        objc_msgSend(*(id *)(a1 + 80), "finishWithResult:", v26);
      }
      else
      {
        objc_msgSend(*(id *)(a1 + 72), "alarmManager");
        v37 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v37, "alarms");
        v38 = (void *)objc_claimAutoreleasedReturnValue();
        v39 = MEMORY[0x24BDAC760];
        v48[0] = MEMORY[0x24BDAC760];
        v48[1] = 3221225472;
        v48[2] = __84__COMeshAlarmAddOn__alarmsForAccessory_allowLocalStorage_usingLeader_member_client___block_invoke_160;
        v48[3] = &unk_24D4B24F0;
        v40 = v26;
        v49 = v40;
        v50 = *(id *)(a1 + 64);
        v51 = *(id *)(a1 + 80);
        v41 = (id)objc_msgSend(v38, "addSuccessBlock:", v48);
        v44[0] = v39;
        v44[1] = 3221225472;
        v44[2] = __84__COMeshAlarmAddOn__alarmsForAccessory_allowLocalStorage_usingLeader_member_client___block_invoke_161;
        v44[3] = &unk_24D4B3170;
        v45 = *(id *)(a1 + 64);
        v26 = v40;
        v46 = v26;
        v47 = *(id *)(a1 + 80);
        v42 = (id)objc_msgSend(v38, "addFailureBlock:", v44);

      }
      v14 = 0;
LABEL_38:

      goto LABEL_14;
    }
  }
  if (*(_QWORD *)(a1 + 32))
  {
    v15 = xpc_dictionary_create(0, 0, 0);
    if (v15)
    {
      v16 = (objc_class *)objc_opt_class();
      NSStringFromClass(v16);
      v17 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
      xpc_dictionary_set_string(v15, "command", (const char *)objc_msgSend(v17, "UTF8String"));

      objc_msgSend(*(id *)(a1 + 40), "clientBundleIdentifier");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = v18;
      if (!v18)
      {
        objc_msgSend(MEMORY[0x24BDD1488], "mainBundle");
        v6 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "bundleIdentifier");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
      }
      xpc_dictionary_set_string(v15, "client", (const char *)objc_msgSend(objc_retainAutorelease(v19), "UTF8String"));
      if (!v18)
      {

      }
      nw_activity_submit_metrics();
    }
    nw_activity_complete_with_reason();

  }
  COCoreLogForCategory(2);
  v20 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
    __84__COMeshAlarmAddOn__alarmsForAccessory_allowLocalStorage_usingLeader_member_client___block_invoke_158_cold_2();

  objc_msgSend(*(id *)(a1 + 80), "finishWithError:", v14);
LABEL_14:

}

void __84__COMeshAlarmAddOn__alarmsForAccessory_allowLocalStorage_usingLeader_member_client___block_invoke_160(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  id v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  void *v12;
  id v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t j;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  NSObject *v22;
  uint64_t v23;
  uint64_t v24;
  id v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  uint8_t buf[4];
  uint64_t v35;
  __int16 v36;
  id v37;
  __int16 v38;
  uint64_t v39;
  _BYTE v40[128];
  _BYTE v41[128];
  uint64_t v42;

  v42 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  if (objc_msgSend(v3, "count"))
  {
    objc_msgSend(MEMORY[0x24BDBCEB8], "array");
    v4 = (id)objc_claimAutoreleasedReturnValue();
    v5 = objc_alloc_init(MEMORY[0x24BDBCED8]);
    v30 = 0u;
    v31 = 0u;
    v32 = 0u;
    v33 = 0u;
    v25 = v3;
    v6 = v3;
    v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v30, v41, 16);
    if (v7)
    {
      v8 = v7;
      v9 = *(_QWORD *)v31;
      do
      {
        for (i = 0; i != v8; ++i)
        {
          if (*(_QWORD *)v31 != v9)
            objc_enumerationMutation(v6);
          v11 = *(void **)(*((_QWORD *)&v30 + 1) + 8 * i);
          objc_msgSend(v11, "alarmID");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v5, "setObject:forKey:", v11, v12);

        }
        v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v30, v41, 16);
      }
      while (v8);
    }

    v28 = 0u;
    v29 = 0u;
    v26 = 0u;
    v27 = 0u;
    v13 = *(id *)(a1 + 32);
    v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v26, v40, 16);
    if (v14)
    {
      v15 = v14;
      v16 = *(_QWORD *)v27;
      do
      {
        for (j = 0; j != v15; ++j)
        {
          if (*(_QWORD *)v27 != v16)
            objc_enumerationMutation(v13);
          v18 = *(void **)(*((_QWORD *)&v26 + 1) + 8 * j);
          objc_msgSend(v18, "alarmID");
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v5, "objectForKey:", v19);
          v20 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(v18, "COPreferredAlarm:", v20);
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v4, "addObject:", v21);

        }
        v15 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v26, v40, 16);
      }
      while (v15);
    }

    v3 = v25;
  }
  else
  {
    v4 = *(id *)(a1 + 32);
  }
  COCoreLogForCategory(2);
  v22 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
  {
    v24 = *(_QWORD *)(a1 + 32);
    v23 = *(_QWORD *)(a1 + 40);
    *(_DWORD *)buf = 134218498;
    v35 = v23;
    v36 = 2112;
    v37 = v4;
    v38 = 2112;
    v39 = v24;
    _os_log_impl(&dword_215E92000, v22, OS_LOG_TYPE_DEFAULT, "%p alarms list after local merge: %@ [list from leader: %@]", buf, 0x20u);
  }

  objc_msgSend(*(id *)(a1 + 48), "finishWithResult:", v4);
}

void __84__COMeshAlarmAddOn__alarmsForAccessory_allowLocalStorage_usingLeader_member_client___block_invoke_161(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;

  v3 = a2;
  COCoreLogForCategory(2);
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    __84__COMeshAlarmAddOn__alarmsForAccessory_allowLocalStorage_usingLeader_member_client___block_invoke_161_cold_1();

  objc_msgSend(*(id *)(a1 + 48), "finishWithResult:", *(_QWORD *)(a1 + 40));
}

uint64_t __84__COMeshAlarmAddOn__alarmsForAccessory_allowLocalStorage_usingLeader_member_client___block_invoke_162(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD, uint64_t, uint64_t))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32), 0, a2, a3);
}

id __84__COMeshAlarmAddOn__alarmsForAccessory_allowLocalStorage_usingLeader_member_client___block_invoke_2_163(uint64_t a1)
{
  return COCoreAnalyticsCreateActionEvent(CFSTR("alarm"), CFSTR("read"), *(unsigned __int8 *)(a1 + 32));
}

- (BOOL)_isAlarm:(id)a3 targetingAccessoryIdentifiers:(id)a4
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
  objc_msgSend(v7, "objectForKey:", *MEMORY[0x24BE19C48]);
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
        COCoreLogForCategory(2);
        v15 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
        {
          objc_msgSend(v5, "alarmID");
          v27 = (void *)objc_claimAutoreleasedReturnValue();
          -[NSObject query](v11, "query");
          v28 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138412802;
          v39 = v27;
          v40 = 2112;
          v41 = v28;
          v42 = 2112;
          v43 = v6;
          _os_log_debug_impl(&dword_215E92000, v15, OS_LOG_TYPE_DEBUG, "checking if alarm (%@) target (%@) contains %@", buf, 0x20u);

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
    COCoreLogForCategory(2);
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
      -[COMeshTimerAddOn _isTimer:targetingAccessoryIdentifiers:].cold.2();
    goto LABEL_26;
  }
  COCoreLogForCategory(2);
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
    -[COMeshAlarmAddOn _isAlarm:targetingAccessoryIdentifiers:].cold.1(v5, v11);
LABEL_28:

  return v10;
}

- (id)alarms
{
  return -[COMeshAlarmAddOn alarmsForAccessory:](self, "alarmsForAccessory:", 0);
}

- (id)alarmsForAccessory:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;

  v4 = a3;
  if (!v4)
  {
    v5 = 0;
    goto LABEL_5;
  }
  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BE19E38]), "initWithHomeKitAccessory:", v4);
  if (!v5)
  {
LABEL_5:
    v6 = 0;
    goto LABEL_6;
  }
  -[COMeshAlarmAddOn secondaryClusterMemberIfRequiredForAccessory:](self, "secondaryClusterMemberIfRequiredForAccessory:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_6:
  -[COMeshAlarmAddOn _alarmsForAccessory:allowLocalStorage:usingLeader:member:client:](self, "_alarmsForAccessory:allowLocalStorage:usingLeader:member:client:", v5, -[COMeshAlarmAddOn performsLocalActions](self, "performsLocalActions"), 1, v6, 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (id)addAlarm:(id)a3
{
  return -[COMeshAlarmAddOn addAlarm:member:client:](self, "addAlarm:member:client:", a3, 0, 0);
}

- (id)addAlarm:(id)a3 member:(id)a4 client:(id)a5
{
  id v8;
  id v9;
  COAlarmCreateRequest *v10;
  void *v11;
  _BOOL4 v12;
  uint64_t v13;
  void *v14;
  NSObject *v15;
  _BOOL4 v16;
  void *v17;
  id v18;
  void *v19;
  id v20;
  COMTAlarmCreateAction *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  uint64_t v27;
  uint64_t (*__ptr32 *v28)();
  id v29;
  COMTAlarmCreateAction *v30;
  id v31;
  char v32;
  void *v33;
  id v34;
  void *v35;
  uint64_t v36;
  void *v37;
  NSObject *v38;
  void *v39;
  id v40;
  void *v41;
  uint64_t v42;
  void *v43;
  id v44;
  NSObject *v45;
  void (**v46)(_QWORD, _QWORD, _QWORD);
  void *v48;
  COAlarmCreateRequest *v49;
  id v50;
  id v51;
  _QWORD v52[4];
  char v53;
  _QWORD v54[4];
  id v55;
  COMTAlarmCreateAction *v56;
  id v57;
  id v58;
  id v59;
  _QWORD block[5];
  COAlarmCreateRequest *v61;
  id v62;
  id v63;
  uint8_t buf[4];
  void *v65;
  __int16 v66;
  void *v67;
  uint64_t v68;

  v68 = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v51 = a4;
  v9 = a5;
  v10 = -[COAlarmRequest initWithAlarm:]([COAlarmCreateRequest alloc], "initWithAlarm:", v8);
  -[COMeshAddOn meshController](self, "meshController");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = -[COMeshAlarmAddOn performsLocalActions](self, "performsLocalActions");
  v13 = MEMORY[0x24BDAC760];
  if (v12 && (objc_msgSend(v11, "leader"), v14 = (void *)objc_claimAutoreleasedReturnValue(), v14, !v14))
  {
    COCoreLogForCategory(2);
    v38 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v38, OS_LOG_TYPE_DEFAULT))
    {
      -[COMeshAddOn meshController](self, "meshController");
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "alarmID");
      v50 = v9;
      v40 = v8;
      v41 = v11;
      v42 = v13;
      v43 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 134218242;
      v65 = v39;
      v66 = 2112;
      v67 = v43;
      _os_log_impl(&dword_215E92000, v38, OS_LOG_TYPE_DEFAULT, "%p directly add an alarm %@", buf, 0x16u);

      v13 = v42;
      v11 = v41;
      v8 = v40;
      v9 = v50;

    }
    v44 = objc_alloc_init(MEMORY[0x24BE6B608]);
    -[COMeshAddOn meshControllerQueue](self, "meshControllerQueue");
    v45 = objc_claimAutoreleasedReturnValue();
    block[0] = v13;
    block[1] = 3221225472;
    block[2] = __43__COMeshAlarmAddOn_addAlarm_member_client___block_invoke;
    block[3] = &unk_24D4B0E50;
    block[4] = self;
    v61 = v10;
    v29 = v44;
    v62 = v29;
    v63 = v11;
    dispatch_async(v45, block);

    v28 = &off_215F52000;
    v32 = 1;
  }
  else
  {
    COCoreLogForCategory(2);
    v15 = objc_claimAutoreleasedReturnValue();
    v16 = os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT);
    if (v51)
    {
      v49 = v10;
      if (v16)
      {
        objc_msgSend(v8, "alarmID");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 134218242;
        v65 = v11;
        v66 = 2112;
        v67 = v17;
        _os_log_impl(&dword_215E92000, v15, OS_LOG_TYPE_DEFAULT, "%p using secondary cluster to add %@", buf, 0x16u);

      }
      v18 = v8;
      v19 = v11;

      v20 = objc_alloc_init(MEMORY[0x24BE6B608]);
      v48 = v18;
      v21 = -[COMTAlarmCreateAction initWithAlarm:]([COMTAlarmCreateAction alloc], "initWithAlarm:", v18);
      v22 = v9;
      objc_msgSend(v9, "clientLifetimeActivity");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      +[CONetworkActivityFactory activityWithLabel:parentActivity:](CONetworkActivityFactory, "activityWithLabel:parentActivity:", 3, v23);
      v24 = (void *)objc_claimAutoreleasedReturnValue();

      if (v24)
        nw_activity_activate();
      -[COMeshAlarmAddOn actionDirector](self, "actionDirector");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BDBCF20], "setWithObject:", v51);
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      v27 = MEMORY[0x24BDAC760];
      v54[0] = MEMORY[0x24BDAC760];
      v28 = &off_215F52000;
      v54[1] = 3221225472;
      v54[2] = __43__COMeshAlarmAddOn_addAlarm_member_client___block_invoke_172;
      v54[3] = &unk_24D4B0920;
      v55 = v24;
      v56 = v21;
      v57 = v22;
      v29 = v20;
      v58 = v29;
      v59 = v19;
      v30 = v21;
      v31 = v24;
      objc_msgSend(v25, "requestAction:members:activity:withCompletion:", v30, v26, v31, v54);

      v13 = v27;
      v9 = v22;
      v11 = v19;
      v32 = 0;
      v8 = v48;
      v10 = v49;
    }
    else
    {
      if (v16)
      {
        -[COMeshAddOn meshController](self, "meshController");
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "alarmID");
        v34 = v8;
        v35 = v11;
        v36 = v13;
        v37 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 134218242;
        v65 = v33;
        v66 = 2112;
        v67 = v37;
        _os_log_impl(&dword_215E92000, v15, OS_LOG_TYPE_DEFAULT, "%p requesting leader to add an alarm %@", buf, 0x16u);

        v13 = v36;
        v11 = v35;
        v8 = v34;

      }
      -[COMeshAlarmAddOn _sendRequest:client:](self, "_sendRequest:client:", v10, v9);
      v29 = (id)objc_claimAutoreleasedReturnValue();
      v32 = 0;
      v28 = &off_215F52000;
    }
  }
  -[COMeshAlarmAddOn recorder](self, "recorder");
  v46 = (void (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
  v52[0] = v13;
  v52[1] = *((_QWORD *)v28 + 448);
  v52[2] = __43__COMeshAlarmAddOn_addAlarm_member_client___block_invoke_173;
  v52[3] = &__block_descriptor_33_e19___NSDictionary_8__0l;
  v53 = v32;
  ((void (**)(_QWORD, const __CFString *, _QWORD *))v46)[2](v46, CFSTR("com.apple.CoordinationCore.MeshAction"), v52);

  return v29;
}

void __43__COMeshAlarmAddOn_addAlarm_member_client___block_invoke(uint64_t a1)
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
  v4[2] = __43__COMeshAlarmAddOn_addAlarm_member_client___block_invoke_2;
  v4[3] = &unk_24D4B17C0;
  v5 = *(id *)(a1 + 48);
  v6 = *(id *)(a1 + 56);
  objc_msgSend(v2, "handleAlarmCreateRequest:callback:", v3, v4);

}

void __43__COMeshAlarmAddOn_addAlarm_member_client___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;

  v5 = a2;
  v6 = a3;
  if (v6 || (objc_msgSend(v5, "error"), (v6 = (id)objc_claimAutoreleasedReturnValue()) != 0))
  {
    COCoreLogForCategory(2);
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

void __43__COMeshAlarmAddOn_addAlarm_member_client___block_invoke_172(uint64_t a1, void *a2, void *a3)
{
  void *v3;
  id v6;
  id v7;
  xpc_object_t v8;
  objc_class *v9;
  id v10;
  void *v11;
  void *v12;
  NSObject *v13;

  v6 = a2;
  v7 = a3;
  if (*(_QWORD *)(a1 + 32))
  {
    v8 = xpc_dictionary_create(0, 0, 0);
    if (v8)
    {
      v9 = (objc_class *)objc_opt_class();
      NSStringFromClass(v9);
      v10 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
      xpc_dictionary_set_string(v8, "command", (const char *)objc_msgSend(v10, "UTF8String"));

      objc_msgSend(*(id *)(a1 + 48), "clientBundleIdentifier");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = v11;
      if (!v11)
      {
        objc_msgSend(MEMORY[0x24BDD1488], "mainBundle");
        v3 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v3, "bundleIdentifier");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
      }
      xpc_dictionary_set_string(v8, "client", (const char *)objc_msgSend(objc_retainAutorelease(v12), "UTF8String"));
      if (!v11)
      {

      }
      nw_activity_submit_metrics();
    }
    nw_activity_complete_with_reason();

  }
  if (v7)
  {
    COCoreLogForCategory(2);
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      __43__COMeshTimerAddOn_addTimer_client_member___block_invoke_141_cold_1();

    objc_msgSend(*(id *)(a1 + 56), "finishWithError:", v7);
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 56), "finishWithNoResult");
  }

}

id __43__COMeshAlarmAddOn_addAlarm_member_client___block_invoke_173(uint64_t a1)
{
  return COCoreAnalyticsCreateActionEvent(CFSTR("alarm"), CFSTR("create"), *(unsigned __int8 *)(a1 + 32) == 0);
}

- (id)updateAlarm:(id)a3
{
  return -[COMeshAlarmAddOn updateAlarm:member:client:](self, "updateAlarm:member:client:", a3, 0, 0);
}

- (id)updateAlarm:(id)a3 member:(id)a4 client:(id)a5
{
  id v8;
  id v9;
  COAlarmUpdateRequest *v10;
  void *v11;
  _BOOL4 v12;
  uint64_t v13;
  void *v14;
  NSObject *v15;
  _BOOL4 v16;
  void *v17;
  id v18;
  void *v19;
  id v20;
  COMTAlarmUpdateAction *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  uint64_t v27;
  uint64_t (*__ptr32 *v28)();
  id v29;
  COMTAlarmUpdateAction *v30;
  id v31;
  char v32;
  void *v33;
  id v34;
  void *v35;
  uint64_t v36;
  void *v37;
  NSObject *v38;
  void *v39;
  id v40;
  void *v41;
  uint64_t v42;
  void *v43;
  id v44;
  NSObject *v45;
  void (**v46)(_QWORD, _QWORD, _QWORD);
  void *v48;
  COAlarmUpdateRequest *v49;
  id v50;
  id v51;
  _QWORD v52[4];
  char v53;
  _QWORD v54[4];
  id v55;
  COMTAlarmUpdateAction *v56;
  id v57;
  id v58;
  id v59;
  _QWORD block[5];
  COAlarmUpdateRequest *v61;
  id v62;
  id v63;
  uint8_t buf[4];
  void *v65;
  __int16 v66;
  void *v67;
  uint64_t v68;

  v68 = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v51 = a4;
  v9 = a5;
  v10 = -[COAlarmRequest initWithAlarm:]([COAlarmUpdateRequest alloc], "initWithAlarm:", v8);
  -[COMeshAddOn meshController](self, "meshController");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = -[COMeshAlarmAddOn performsLocalActions](self, "performsLocalActions");
  v13 = MEMORY[0x24BDAC760];
  if (v12 && (objc_msgSend(v11, "leader"), v14 = (void *)objc_claimAutoreleasedReturnValue(), v14, !v14))
  {
    COCoreLogForCategory(2);
    v38 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v38, OS_LOG_TYPE_DEFAULT))
    {
      -[COMeshAddOn meshController](self, "meshController");
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "alarmID");
      v50 = v9;
      v40 = v8;
      v41 = v11;
      v42 = v13;
      v43 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 134218242;
      v65 = v39;
      v66 = 2112;
      v67 = v43;
      _os_log_impl(&dword_215E92000, v38, OS_LOG_TYPE_DEFAULT, "%p directly update an alarm %@", buf, 0x16u);

      v13 = v42;
      v11 = v41;
      v8 = v40;
      v9 = v50;

    }
    v44 = objc_alloc_init(MEMORY[0x24BE6B608]);
    -[COMeshAddOn meshControllerQueue](self, "meshControllerQueue");
    v45 = objc_claimAutoreleasedReturnValue();
    block[0] = v13;
    block[1] = 3221225472;
    block[2] = __46__COMeshAlarmAddOn_updateAlarm_member_client___block_invoke;
    block[3] = &unk_24D4B0E50;
    block[4] = self;
    v61 = v10;
    v29 = v44;
    v62 = v29;
    v63 = v11;
    dispatch_async(v45, block);

    v28 = &off_215F52000;
    v32 = 1;
  }
  else
  {
    COCoreLogForCategory(2);
    v15 = objc_claimAutoreleasedReturnValue();
    v16 = os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT);
    if (v51)
    {
      v49 = v10;
      if (v16)
      {
        objc_msgSend(v8, "alarmID");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 134218242;
        v65 = v11;
        v66 = 2112;
        v67 = v17;
        _os_log_impl(&dword_215E92000, v15, OS_LOG_TYPE_DEFAULT, "%p using secondary cluster to update %@", buf, 0x16u);

      }
      v18 = v8;
      v19 = v11;

      v20 = objc_alloc_init(MEMORY[0x24BE6B608]);
      v48 = v18;
      v21 = -[COMTAlarmUpdateAction initWithAlarm:]([COMTAlarmUpdateAction alloc], "initWithAlarm:", v18);
      v22 = v9;
      objc_msgSend(v9, "clientLifetimeActivity");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      +[CONetworkActivityFactory activityWithLabel:parentActivity:](CONetworkActivityFactory, "activityWithLabel:parentActivity:", 3, v23);
      v24 = (void *)objc_claimAutoreleasedReturnValue();

      if (v24)
        nw_activity_activate();
      -[COMeshAlarmAddOn actionDirector](self, "actionDirector");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BDBCF20], "setWithObject:", v51);
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      v27 = MEMORY[0x24BDAC760];
      v54[0] = MEMORY[0x24BDAC760];
      v28 = &off_215F52000;
      v54[1] = 3221225472;
      v54[2] = __46__COMeshAlarmAddOn_updateAlarm_member_client___block_invoke_175;
      v54[3] = &unk_24D4B0920;
      v55 = v24;
      v56 = v21;
      v57 = v22;
      v29 = v20;
      v58 = v29;
      v59 = v19;
      v30 = v21;
      v31 = v24;
      objc_msgSend(v25, "requestAction:members:activity:withCompletion:", v30, v26, v31, v54);

      v13 = v27;
      v9 = v22;
      v11 = v19;
      v32 = 0;
      v8 = v48;
      v10 = v49;
    }
    else
    {
      if (v16)
      {
        -[COMeshAddOn meshController](self, "meshController");
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "alarmID");
        v34 = v8;
        v35 = v11;
        v36 = v13;
        v37 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 134218242;
        v65 = v33;
        v66 = 2112;
        v67 = v37;
        _os_log_impl(&dword_215E92000, v15, OS_LOG_TYPE_DEFAULT, "%p requesting leader to update an alarm %@", buf, 0x16u);

        v13 = v36;
        v11 = v35;
        v8 = v34;

      }
      -[COMeshAlarmAddOn _sendRequest:client:](self, "_sendRequest:client:", v10, v9);
      v29 = (id)objc_claimAutoreleasedReturnValue();
      v32 = 0;
      v28 = &off_215F52000;
    }
  }
  -[COMeshAlarmAddOn recorder](self, "recorder");
  v46 = (void (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
  v52[0] = v13;
  v52[1] = *((_QWORD *)v28 + 448);
  v52[2] = __46__COMeshAlarmAddOn_updateAlarm_member_client___block_invoke_176;
  v52[3] = &__block_descriptor_33_e19___NSDictionary_8__0l;
  v53 = v32;
  ((void (**)(_QWORD, const __CFString *, _QWORD *))v46)[2](v46, CFSTR("com.apple.CoordinationCore.MeshAction"), v52);

  return v29;
}

void __46__COMeshAlarmAddOn_updateAlarm_member_client___block_invoke(uint64_t a1)
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
  v4[2] = __46__COMeshAlarmAddOn_updateAlarm_member_client___block_invoke_2;
  v4[3] = &unk_24D4B17C0;
  v5 = *(id *)(a1 + 48);
  v6 = *(id *)(a1 + 56);
  objc_msgSend(v2, "handleAlarmUpdateRequest:callback:", v3, v4);

}

void __46__COMeshAlarmAddOn_updateAlarm_member_client___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;

  v5 = a2;
  v6 = a3;
  if (v6 || (objc_msgSend(v5, "error"), (v6 = (id)objc_claimAutoreleasedReturnValue()) != 0))
  {
    COCoreLogForCategory(2);
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

void __46__COMeshAlarmAddOn_updateAlarm_member_client___block_invoke_175(uint64_t a1, void *a2, void *a3)
{
  void *v3;
  id v6;
  id v7;
  xpc_object_t v8;
  objc_class *v9;
  id v10;
  void *v11;
  void *v12;
  NSObject *v13;

  v6 = a2;
  v7 = a3;
  if (*(_QWORD *)(a1 + 32))
  {
    v8 = xpc_dictionary_create(0, 0, 0);
    if (v8)
    {
      v9 = (objc_class *)objc_opt_class();
      NSStringFromClass(v9);
      v10 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
      xpc_dictionary_set_string(v8, "command", (const char *)objc_msgSend(v10, "UTF8String"));

      objc_msgSend(*(id *)(a1 + 48), "clientBundleIdentifier");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = v11;
      if (!v11)
      {
        objc_msgSend(MEMORY[0x24BDD1488], "mainBundle");
        v3 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v3, "bundleIdentifier");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
      }
      xpc_dictionary_set_string(v8, "client", (const char *)objc_msgSend(objc_retainAutorelease(v12), "UTF8String"));
      if (!v11)
      {

      }
      nw_activity_submit_metrics();
    }
    nw_activity_complete_with_reason();

  }
  if (v7)
  {
    COCoreLogForCategory(2);
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      __46__COMeshTimerAddOn_updateTimer_client_member___block_invoke_144_cold_1();

    objc_msgSend(*(id *)(a1 + 56), "finishWithError:", v7);
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 56), "finishWithNoResult");
  }

}

id __46__COMeshAlarmAddOn_updateAlarm_member_client___block_invoke_176(uint64_t a1)
{
  return COCoreAnalyticsCreateActionEvent(CFSTR("alarm"), CFSTR("update"), *(unsigned __int8 *)(a1 + 32) == 0);
}

- (id)removeAlarm:(id)a3
{
  return -[COMeshAlarmAddOn removeAlarm:member:client:](self, "removeAlarm:member:client:", a3, 0, 0);
}

- (id)removeAlarm:(id)a3 member:(id)a4 client:(id)a5
{
  id v8;
  id v9;
  COAlarmDeleteRequest *v10;
  void *v11;
  _BOOL4 v12;
  uint64_t v13;
  void *v14;
  NSObject *v15;
  _BOOL4 v16;
  void *v17;
  void *v18;
  void *v19;
  id v20;
  objc_class *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  uint64_t v30;
  uint64_t (*__ptr32 *v31)();
  id v32;
  id v33;
  id v34;
  char v35;
  void *v36;
  id v37;
  void *v38;
  uint64_t v39;
  void *v40;
  NSObject *v41;
  void *v42;
  id v43;
  void *v44;
  uint64_t v45;
  void *v46;
  id v47;
  NSObject *v48;
  void (**v49)(_QWORD, _QWORD, _QWORD);
  void *v51;
  COAlarmDeleteRequest *v52;
  id v53;
  id v54;
  _QWORD v55[4];
  char v56;
  _QWORD v57[4];
  id v58;
  id v59;
  id v60;
  id v61;
  id v62;
  _QWORD block[5];
  COAlarmDeleteRequest *v64;
  id v65;
  id v66;
  uint8_t buf[4];
  void *v68;
  __int16 v69;
  void *v70;
  uint64_t v71;

  v71 = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v54 = a4;
  v9 = a5;
  v10 = -[COAlarmRequest initWithAlarm:]([COAlarmDeleteRequest alloc], "initWithAlarm:", v8);
  -[COMeshAddOn meshController](self, "meshController");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = -[COMeshAlarmAddOn performsLocalActions](self, "performsLocalActions");
  v13 = MEMORY[0x24BDAC760];
  if (v12 && (objc_msgSend(v11, "leader"), v14 = (void *)objc_claimAutoreleasedReturnValue(), v14, !v14))
  {
    COCoreLogForCategory(2);
    v41 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v41, OS_LOG_TYPE_DEFAULT))
    {
      -[COMeshAddOn meshController](self, "meshController");
      v42 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "alarmID");
      v53 = v9;
      v43 = v8;
      v44 = v11;
      v45 = v13;
      v46 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 134218242;
      v68 = v42;
      v69 = 2112;
      v70 = v46;
      _os_log_impl(&dword_215E92000, v41, OS_LOG_TYPE_DEFAULT, "%p directly remove an alarm %@", buf, 0x16u);

      v13 = v45;
      v11 = v44;
      v8 = v43;
      v9 = v53;

    }
    v47 = objc_alloc_init(MEMORY[0x24BE6B608]);
    -[COMeshAddOn meshControllerQueue](self, "meshControllerQueue");
    v48 = objc_claimAutoreleasedReturnValue();
    block[0] = v13;
    block[1] = 3221225472;
    block[2] = __46__COMeshAlarmAddOn_removeAlarm_member_client___block_invoke;
    block[3] = &unk_24D4B0E50;
    block[4] = self;
    v64 = v10;
    v32 = v47;
    v65 = v32;
    v66 = v11;
    dispatch_async(v48, block);

    v31 = &off_215F52000;
    v35 = 1;
  }
  else
  {
    COCoreLogForCategory(2);
    v15 = objc_claimAutoreleasedReturnValue();
    v16 = os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT);
    if (v54)
    {
      v52 = v10;
      if (v16)
      {
        objc_msgSend(v8, "alarmID");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 134218242;
        v68 = v11;
        v69 = 2112;
        v70 = v17;
        _os_log_impl(&dword_215E92000, v15, OS_LOG_TYPE_DEFAULT, "%p using secondary cluster to remove %@", buf, 0x16u);

      }
      v18 = v8;
      v19 = v11;

      v20 = objc_alloc_init(MEMORY[0x24BE6B608]);
      v21 = (objc_class *)objc_opt_class();
      NSStringFromClass(v21);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      v51 = v18;
      objc_msgSend(v18, "alarmID");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      +[COMTDeleteAction actionWithTargetType:targetIdentifier:](COMTDeleteAction, "actionWithTargetType:targetIdentifier:", v22, v23);
      v24 = (void *)objc_claimAutoreleasedReturnValue();

      v25 = v9;
      objc_msgSend(v9, "clientLifetimeActivity");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      +[CONetworkActivityFactory activityWithLabel:parentActivity:](CONetworkActivityFactory, "activityWithLabel:parentActivity:", 3, v26);
      v27 = (void *)objc_claimAutoreleasedReturnValue();

      if (v27)
        nw_activity_activate();
      -[COMeshAlarmAddOn actionDirector](self, "actionDirector");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BDBCF20], "setWithObject:", v54);
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      v30 = MEMORY[0x24BDAC760];
      v57[0] = MEMORY[0x24BDAC760];
      v31 = &off_215F52000;
      v57[1] = 3221225472;
      v57[2] = __46__COMeshAlarmAddOn_removeAlarm_member_client___block_invoke_178;
      v57[3] = &unk_24D4B0920;
      v58 = v27;
      v59 = v24;
      v60 = v25;
      v32 = v20;
      v61 = v32;
      v62 = v19;
      v33 = v24;
      v34 = v27;
      objc_msgSend(v28, "requestAction:members:activity:withCompletion:", v33, v29, v34, v57);

      v13 = v30;
      v9 = v25;
      v11 = v19;
      v35 = 0;
      v8 = v51;
      v10 = v52;
    }
    else
    {
      if (v16)
      {
        -[COMeshAddOn meshController](self, "meshController");
        v36 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "alarmID");
        v37 = v8;
        v38 = v11;
        v39 = v13;
        v40 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 134218242;
        v68 = v36;
        v69 = 2112;
        v70 = v40;
        _os_log_impl(&dword_215E92000, v15, OS_LOG_TYPE_DEFAULT, "%p requesting leader to remove an alarm %@", buf, 0x16u);

        v13 = v39;
        v11 = v38;
        v8 = v37;

      }
      -[COMeshAlarmAddOn _sendRequest:client:](self, "_sendRequest:client:", v10, v9);
      v32 = (id)objc_claimAutoreleasedReturnValue();
      v35 = 0;
      v31 = &off_215F52000;
    }
  }
  -[COMeshAlarmAddOn recorder](self, "recorder");
  v49 = (void (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
  v55[0] = v13;
  v55[1] = *((_QWORD *)v31 + 448);
  v55[2] = __46__COMeshAlarmAddOn_removeAlarm_member_client___block_invoke_179;
  v55[3] = &__block_descriptor_33_e19___NSDictionary_8__0l;
  v56 = v35;
  ((void (**)(_QWORD, const __CFString *, _QWORD *))v49)[2](v49, CFSTR("com.apple.CoordinationCore.MeshAction"), v55);

  return v32;
}

void __46__COMeshAlarmAddOn_removeAlarm_member_client___block_invoke(uint64_t a1)
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
  v4[2] = __46__COMeshAlarmAddOn_removeAlarm_member_client___block_invoke_2;
  v4[3] = &unk_24D4B17C0;
  v5 = *(id *)(a1 + 48);
  v6 = *(id *)(a1 + 56);
  objc_msgSend(v2, "handleAlarmDeleteRequest:callback:", v3, v4);

}

void __46__COMeshAlarmAddOn_removeAlarm_member_client___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;

  v5 = a2;
  v6 = a3;
  if (v6 || (objc_msgSend(v5, "error"), (v6 = (id)objc_claimAutoreleasedReturnValue()) != 0))
  {
    COCoreLogForCategory(2);
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

void __46__COMeshAlarmAddOn_removeAlarm_member_client___block_invoke_178(uint64_t a1, void *a2, void *a3)
{
  void *v3;
  id v6;
  id v7;
  xpc_object_t v8;
  objc_class *v9;
  id v10;
  void *v11;
  void *v12;
  NSObject *v13;

  v6 = a2;
  v7 = a3;
  if (*(_QWORD *)(a1 + 32))
  {
    v8 = xpc_dictionary_create(0, 0, 0);
    if (v8)
    {
      v9 = (objc_class *)objc_opt_class();
      NSStringFromClass(v9);
      v10 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
      xpc_dictionary_set_string(v8, "command", (const char *)objc_msgSend(v10, "UTF8String"));

      objc_msgSend(*(id *)(a1 + 48), "clientBundleIdentifier");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = v11;
      if (!v11)
      {
        objc_msgSend(MEMORY[0x24BDD1488], "mainBundle");
        v3 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v3, "bundleIdentifier");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
      }
      xpc_dictionary_set_string(v8, "client", (const char *)objc_msgSend(objc_retainAutorelease(v12), "UTF8String"));
      if (!v11)
      {

      }
      nw_activity_submit_metrics();
    }
    nw_activity_complete_with_reason();

  }
  if (v7)
  {
    COCoreLogForCategory(2);
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      __46__COMeshTimerAddOn_removeTimer_client_member___block_invoke_147_cold_1();

    objc_msgSend(*(id *)(a1 + 56), "finishWithError:", v7);
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 56), "finishWithNoResult");
  }

}

id __46__COMeshAlarmAddOn_removeAlarm_member_client___block_invoke_179(uint64_t a1)
{
  return COCoreAnalyticsCreateActionEvent(CFSTR("alarm"), CFSTR("delete"), *(unsigned __int8 *)(a1 + 32) == 0);
}

- (id)snoozeAlarmWithIdentifier:(id)a3
{
  return -[COMeshAlarmAddOn snoozeAlarmWithIdentifier:client:](self, "snoozeAlarmWithIdentifier:client:", a3, 0);
}

- (id)snoozeAlarmWithIdentifier:(id)a3 client:(id)a4
{
  id v6;
  id v7;
  COAlarmSnoozeRequest *v8;
  void *v9;
  _BOOL4 v10;
  uint64_t v11;
  void *v12;
  NSObject *v13;
  void *v14;
  id v15;
  char v16;
  void (**v17)(_QWORD, _QWORD, _QWORD);
  NSObject *v19;
  void *v20;
  id v21;
  NSObject *v22;
  _QWORD v23[4];
  char v24;
  _QWORD block[5];
  COAlarmSnoozeRequest *v26;
  id v27;
  id v28;
  uint8_t buf[4];
  void *v30;
  __int16 v31;
  id v32;
  uint64_t v33;

  v33 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  v8 = -[COAlarmSnoozeRequest initWithAlarmIdentifier:]([COAlarmSnoozeRequest alloc], "initWithAlarmIdentifier:", v6);
  -[COMeshAddOn meshController](self, "meshController");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = -[COMeshAlarmAddOn performsLocalActions](self, "performsLocalActions");
  v11 = MEMORY[0x24BDAC760];
  if (v10 && (objc_msgSend(v9, "leader"), v12 = (void *)objc_claimAutoreleasedReturnValue(), v12, !v12))
  {
    COCoreLogForCategory(2);
    v19 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
    {
      -[COMeshAddOn meshController](self, "meshController");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 134218242;
      v30 = v20;
      v31 = 2112;
      v32 = v6;
      _os_log_impl(&dword_215E92000, v19, OS_LOG_TYPE_DEFAULT, "%p directly snooze an alarm %@", buf, 0x16u);

    }
    v21 = objc_alloc_init(MEMORY[0x24BE6B608]);
    -[COMeshAddOn meshControllerQueue](self, "meshControllerQueue");
    v22 = objc_claimAutoreleasedReturnValue();
    block[0] = v11;
    block[1] = 3221225472;
    block[2] = __53__COMeshAlarmAddOn_snoozeAlarmWithIdentifier_client___block_invoke;
    block[3] = &unk_24D4B0E50;
    block[4] = self;
    v26 = v8;
    v15 = v21;
    v27 = v15;
    v28 = v9;
    dispatch_async(v22, block);

    v16 = 1;
  }
  else
  {
    COCoreLogForCategory(2);
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      -[COMeshAddOn meshController](self, "meshController");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 134218242;
      v30 = v14;
      v31 = 2112;
      v32 = v6;
      _os_log_impl(&dword_215E92000, v13, OS_LOG_TYPE_DEFAULT, "%p requesting leader to snooze an alarm %@", buf, 0x16u);

    }
    -[COMeshAlarmAddOn _sendRequest:client:](self, "_sendRequest:client:", v8, v7);
    v15 = (id)objc_claimAutoreleasedReturnValue();
    v16 = 0;
  }
  -[COMeshAlarmAddOn recorder](self, "recorder");
  v17 = (void (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
  v23[0] = v11;
  v23[1] = 3221225472;
  v23[2] = __53__COMeshAlarmAddOn_snoozeAlarmWithIdentifier_client___block_invoke_180;
  v23[3] = &__block_descriptor_33_e19___NSDictionary_8__0l;
  v24 = v16;
  ((void (**)(_QWORD, const __CFString *, _QWORD *))v17)[2](v17, CFSTR("com.apple.CoordinationCore.MeshAction"), v23);

  return v15;
}

void __53__COMeshAlarmAddOn_snoozeAlarmWithIdentifier_client___block_invoke(uint64_t a1)
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
  v4[2] = __53__COMeshAlarmAddOn_snoozeAlarmWithIdentifier_client___block_invoke_2;
  v4[3] = &unk_24D4B17C0;
  v5 = *(id *)(a1 + 48);
  v6 = *(id *)(a1 + 56);
  objc_msgSend(v2, "handleAlarmSnoozeRequest:callback:", v3, v4);

}

void __53__COMeshAlarmAddOn_snoozeAlarmWithIdentifier_client___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;

  v5 = a2;
  v6 = a3;
  if (v6 || (objc_msgSend(v5, "error"), (v6 = (id)objc_claimAutoreleasedReturnValue()) != 0))
  {
    COCoreLogForCategory(2);
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      __53__COMeshAlarmAddOn_snoozeAlarmWithIdentifier_client___block_invoke_2_cold_1();

    objc_msgSend(*(id *)(a1 + 32), "finishWithError:", v6);
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "finishWithNoResult");
  }

}

id __53__COMeshAlarmAddOn_snoozeAlarmWithIdentifier_client___block_invoke_180(uint64_t a1)
{
  return COCoreAnalyticsCreateActionEvent(CFSTR("alarm"), CFSTR("snooze"), *(unsigned __int8 *)(a1 + 32) == 0);
}

- (id)dismissAlarmWithIdentifier:(id)a3
{
  return -[COMeshAlarmAddOn dismissAlarmWithIdentifier:client:](self, "dismissAlarmWithIdentifier:client:", a3, 0);
}

- (id)dismissAlarmWithIdentifier:(id)a3 client:(id)a4
{
  id v6;
  id v7;
  COAlarmDismissRequest *v8;
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
  COAlarmDismissRequest *v34;
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
  v8 = -[COAlarmDismissRequest initWithAlarmIdentifier:]([COAlarmDismissRequest alloc], "initWithAlarmIdentifier:", v6);
  -[COMeshAddOn meshController](self, "meshController");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = -[COMeshAlarmAddOn performsLocalActions](self, "performsLocalActions");
  v11 = MEMORY[0x24BDAC760];
  if (v10 && (objc_msgSend(v9, "leader"), v12 = (void *)objc_claimAutoreleasedReturnValue(), v12, !v12))
  {
    COCoreLogForCategory(2);
    v25 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
    {
      -[COMeshAddOn meshController](self, "meshController");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 134218242;
      v38 = v26;
      v39 = 2112;
      v40 = v6;
      _os_log_impl(&dword_215E92000, v25, OS_LOG_TYPE_DEFAULT, "%p directly dismiss an alarm %@", buf, 0x16u);

    }
    v27 = objc_alloc_init(MEMORY[0x24BE6B608]);
    -[COMeshAddOn meshControllerQueue](self, "meshControllerQueue");
    v28 = objc_claimAutoreleasedReturnValue();
    v15 = v11;
    block[0] = v11;
    block[1] = 3221225472;
    block[2] = __54__COMeshAlarmAddOn_dismissAlarmWithIdentifier_client___block_invoke;
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
    -[COMeshAlarmAddOn alarmManager](self, "alarmManager");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "dismissAlarmWithIdentifier:", v6);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = v11;
    v31[0] = v11;
    v31[1] = 3221225472;
    v31[2] = __54__COMeshAlarmAddOn_dismissAlarmWithIdentifier_client___block_invoke_181;
    v31[3] = &unk_24D4B2298;
    v31[4] = self;
    v16 = &v32;
    v17 = v6;
    v32 = v17;
    v18 = (id)objc_msgSend(v14, "addCompletionBlock:", v31);

    COCoreLogForCategory(2);
    v19 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
    {
      -[COMeshAddOn meshController](self, "meshController");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 134218242;
      v38 = v20;
      v39 = 2112;
      v40 = v17;
      _os_log_impl(&dword_215E92000, v19, OS_LOG_TYPE_DEFAULT, "%p requesting leader to dismiss an alarm %@", buf, 0x16u);

    }
    -[COMeshAlarmAddOn _sendRequest:client:](self, "_sendRequest:client:", v8, v7);
    v21 = (id)objc_claimAutoreleasedReturnValue();
    v22 = 0;
  }

  -[COMeshAlarmAddOn recorder](self, "recorder");
  v23 = (void (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
  v29[0] = v15;
  v29[1] = 3221225472;
  v29[2] = __54__COMeshAlarmAddOn_dismissAlarmWithIdentifier_client___block_invoke_183;
  v29[3] = &__block_descriptor_33_e19___NSDictionary_8__0l;
  v30 = v22;
  ((void (**)(_QWORD, const __CFString *, _QWORD *))v23)[2](v23, CFSTR("com.apple.CoordinationCore.MeshAction"), v29);

  return v21;
}

void __54__COMeshAlarmAddOn_dismissAlarmWithIdentifier_client___block_invoke(uint64_t a1)
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
  v4[2] = __54__COMeshAlarmAddOn_dismissAlarmWithIdentifier_client___block_invoke_2;
  v4[3] = &unk_24D4B17C0;
  v5 = *(id *)(a1 + 48);
  v6 = *(id *)(a1 + 56);
  objc_msgSend(v2, "handleAlarmDismissRequest:callback:", v3, v4);

}

void __54__COMeshAlarmAddOn_dismissAlarmWithIdentifier_client___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;

  v5 = a2;
  v6 = a3;
  if (v6 || (objc_msgSend(v5, "error"), (v6 = (id)objc_claimAutoreleasedReturnValue()) != 0))
  {
    COCoreLogForCategory(2);
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

void __54__COMeshAlarmAddOn_dismissAlarmWithIdentifier_client___block_invoke_181(uint64_t a1, uint64_t a2, void *a3)
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
  COCoreLogForCategory(2);
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

id __54__COMeshAlarmAddOn_dismissAlarmWithIdentifier_client___block_invoke_183(uint64_t a1)
{
  return COCoreAnalyticsCreateActionEvent(CFSTR("alarm"), CFSTR("dismiss"), *(unsigned __int8 *)(a1 + 32) == 0);
}

- (BOOL)_isAlarm:(id)a3 targetingAccessory:(id)a4
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
    -[COMeshAlarmAddOn homekit](self, "homekit");
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
    v11 = -[COMeshAlarmAddOn _isAlarm:targetingAccessoryIdentifiers:](self, "_isAlarm:targetingAccessoryIdentifiers:", v7, v10);

  }
  else
  {
    v11 = -[COMeshAlarmAddOn _isAlarm:targetingAccessoryIdentifiers:](self, "_isAlarm:targetingAccessoryIdentifiers:", v7, 0);
    v8 = v7;
  }

  return v11;
}

- (void)handleAlarmReadRequest:(id)a3 callback:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  void *v9;
  NSObject *v10;
  void *v11;
  int v12;
  void *v13;
  NSObject *v14;
  COMeshResponse *v15;
  void *v16;
  uint64_t v17;
  NSObject *v18;
  void *v19;
  uint64_t v20;
  id v21;
  void *v22;
  void *v23;
  id v24;
  void *v25;
  void *v26;
  void *v27;
  id v28;
  id v29;
  id v30;
  id v31;
  id *v32;
  id v33;
  void *v34;
  id v35;
  void *v36;
  int v37;
  void *v38;
  id v39;
  _QWORD v40[4];
  _QWORD v41[2];
  id v42;
  id v43;
  id v44;
  char v45;
  _QWORD v46[4];
  id v47;
  COMeshAlarmAddOn *v48;
  id v49;
  id v50;
  char v51;
  _QWORD v52[4];
  id v53;
  uint8_t buf[4];
  void *v55;
  __int16 v56;
  _BYTE v57[10];
  __int16 v58;
  void *v59;
  uint64_t v60;

  v60 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  -[COMeshAddOn meshControllerQueue](self, "meshControllerQueue");
  v8 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v8);

  objc_msgSend(v6, "accessoryUniqueIdentifier");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  COCoreLogForCategory(2);
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    -[COMeshAddOn meshController](self, "meshController");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 134218242;
    v55 = v11;
    v56 = 2112;
    *(_QWORD *)v57 = v9;
    _os_log_impl(&dword_215E92000, v10, OS_LOG_TYPE_DEFAULT, "%p retrieving alarms for %@...", buf, 0x16u);

  }
  v12 = objc_msgSend(v6, "requiresFilter");
  -[COMeshAlarmAddOn homekit](self, "homekit");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  COCoreLogForCategory(2);
  v14 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
  {
    -[COMeshAddOn meshController](self, "meshController");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    v37 = objc_msgSend(v6, "isForMerge");
    objc_msgSend(v6, "eTag");
    v39 = v7;
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 134218754;
    v55 = v36;
    v56 = 1024;
    *(_DWORD *)v57 = v12;
    *(_WORD *)&v57[4] = 1024;
    *(_DWORD *)&v57[6] = v37;
    v58 = 2112;
    v59 = v38;
    _os_log_debug_impl(&dword_215E92000, v14, OS_LOG_TYPE_DEBUG, "%p request info: filter: %d, merge: %d, eTag: %@", buf, 0x22u);

    v7 = v39;
  }

  v15 = 0;
  v16 = 0;
  if (!v12 || !v9)
    goto LABEL_19;
  objc_msgSend(v13, "accessoryWithUniqueIdentifier:", v9);
  v17 = objc_claimAutoreleasedReturnValue();
  if (v17)
  {
    v16 = (void *)v17;
    if ((objc_msgSend(v13, "hasOptedToHH2") & 1) != 0)
    {
      v15 = 0;
    }
    else
    {
      objc_msgSend(v13, "homeForAccessory:", v16);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = (COMeshResponse *)MEMORY[0x24BDBD1A8];
      if (v19)
      {
        objc_msgSend(v13, "alarmsForAccessory:inHome:", v16, v19);
        v20 = objc_claimAutoreleasedReturnValue();
        v21 = v7;
        v22 = (void *)v20;
        if (v20)
          v23 = (void *)v20;
        else
          v23 = v15;
        v15 = v23;

        v7 = v21;
      }

    }
LABEL_19:
    if (-[COMeshAlarmAddOn performsLocalActions](self, "performsLocalActions"))
    {
      -[COMeshAlarmAddOn alarmManager](self, "alarmManager");
      v24 = v7;
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v25, "alarms");
      v26 = (void *)objc_claimAutoreleasedReturnValue();

      v7 = v24;
    }
    else
    {
      objc_msgSend(MEMORY[0x24BE6B608], "futureWithResult:", MEMORY[0x24BDBD1A8]);
      v26 = (void *)objc_claimAutoreleasedReturnValue();
    }
    if (objc_msgSend(v13, "hasOptedToHH2"))
    {
      v52[0] = MEMORY[0x24BDAC760];
      v52[1] = 3221225472;
      v52[2] = __52__COMeshAlarmAddOn_handleAlarmReadRequest_callback___block_invoke;
      v52[3] = &unk_24D4B22C0;
      v27 = v13;
      v28 = v7;
      v29 = v7;
      v53 = v29;
      v30 = (id)objc_msgSend(v26, "addFailureBlock:", v52);
      v46[0] = MEMORY[0x24BDAC760];
      v46[1] = 3221225472;
      v46[2] = __52__COMeshAlarmAddOn_handleAlarmReadRequest_callback___block_invoke_185;
      v46[3] = &unk_24D4B22E8;
      v51 = v12;
      v47 = v16;
      v48 = self;
      v49 = v6;
      v31 = v29;
      v7 = v28;
      v13 = v27;
      v32 = &v53;
      v50 = v31;
      v33 = (id)objc_msgSend(v26, "addSuccessBlock:", v46);

      v34 = v47;
    }
    else
    {
      v40[0] = MEMORY[0x24BDAC760];
      v40[1] = 3221225472;
      v40[2] = __52__COMeshAlarmAddOn_handleAlarmReadRequest_callback___block_invoke_186;
      v40[3] = &unk_24D4B3BA0;
      v32 = (id *)v41;
      v41[0] = v15;
      v41[1] = self;
      v42 = v16;
      v45 = v12;
      v43 = v6;
      v44 = v7;
      v35 = (id)objc_msgSend(v26, "addCompletionBlock:", v40);

      v34 = v42;
    }

    goto LABEL_26;
  }
  COCoreLogForCategory(2);
  v18 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
    -[COMeshAlarmAddOn handleAlarmReadRequest:callback:].cold.1();

  objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", *MEMORY[0x24BDD5BD8], 2, 0);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = -[COMeshResponse initWithError:]([COMeshResponse alloc], "initWithError:", v16);
  (*((void (**)(id, COMeshResponse *, _QWORD))v7 + 2))(v7, v15, 0);
LABEL_26:

}

void __52__COMeshAlarmAddOn_handleAlarmReadRequest_callback___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  COMeshResponse *v6;

  v3 = a2;
  COCoreLogForCategory(2);
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    __52__COMeshAlarmAddOn_handleAlarmReadRequest_callback___block_invoke_cold_1();

  v5 = *(_QWORD *)(a1 + 32);
  v6 = -[COMeshResponse initWithError:]([COMeshResponse alloc], "initWithError:", v3);
  (*(void (**)(uint64_t, COMeshResponse *, _QWORD))(v5 + 16))(v5, v6, 0);

}

void __52__COMeshAlarmAddOn_handleAlarmReadRequest_callback___block_invoke_185(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  uint64_t v5;
  void *v6;
  void *v7;
  NSObject *v8;
  COAlarmReadResponse *v9;
  NSObject *v10;
  COAlarmReadResponse *v11;
  NSObject *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  int v17;
  NSObject *v18;
  COAlarmReadResponse *v19;
  void *v20;
  uint64_t v21;
  NSObject *v22;
  COAlarmReadResponse *v23;
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
    v26 = __52__COMeshAlarmAddOn_handleAlarmReadRequest_callback___block_invoke_2;
    v27 = &unk_24D4B3198;
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
    COCoreLogForCategory(2);
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v31 = v3;
      _os_log_impl(&dword_215E92000, v8, OS_LOG_TYPE_DEFAULT, "... returning filtered alarms list\n%@", buf, 0xCu);
    }

    v9 = -[COAlarmReadResponse initWithFilteredAlarms:]([COAlarmReadResponse alloc], "initWithFilteredAlarms:", v3);
    goto LABEL_17;
  }
  if ((objc_msgSend(*(id *)(a1 + 48), "isForMerge") & 1) == 0)
  {
    COCoreLogForCategory(2);
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v31 = v3;
      _os_log_impl(&dword_215E92000, v12, OS_LOG_TYPE_DEFAULT, "... returning alarms list\n%@", buf, 0xCu);
    }

    v11 = -[COAlarmReadResponse initWithAlarms:]([COAlarmReadResponse alloc], "initWithAlarms:", v3);
    goto LABEL_16;
  }
  if (!objc_msgSend(*(id *)(a1 + 40), "performsLocalActions")
    || objc_msgSend(MEMORY[0x24BE19E30], "isDistributedTimersEnabled"))
  {
    COCoreLogForCategory(2);
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_215E92000, v10, OS_LOG_TYPE_DEFAULT, "... returning skip-in-merge", buf, 2u);
    }

    v11 = -[COAlarmReadResponse initWithSkipInMerge]([COAlarmReadResponse alloc], "initWithSkipInMerge");
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
  eTagForAlarms(v3);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = objc_msgSend(v15, "isEqualToString:", v16);

  if (v17)
  {
    COCoreLogForCategory(2);
    v18 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_215E92000, v18, OS_LOG_TYPE_DEFAULT, "... returning not-modified", buf, 2u);
    }

    v19 = [COAlarmReadResponse alloc];
    objc_msgSend(*(id *)(a1 + 40), "deletes");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = -[COAlarmReadResponse initNotModifiedWithDeletes:](v19, "initNotModifiedWithDeletes:", v20);
  }
  else
  {
LABEL_23:
    COCoreLogForCategory(2);
    v22 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v31 = v3;
      _os_log_impl(&dword_215E92000, v22, OS_LOG_TYPE_DEFAULT, "... returning alarms list and deletes\n%@", buf, 0xCu);
    }

    v23 = [COAlarmReadResponse alloc];
    objc_msgSend(*(id *)(a1 + 40), "deletes");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = -[COAlarmReadResponse initWithAlarms:deletes:](v23, "initWithAlarms:deletes:", v3, v20);
  }
  v9 = (COAlarmReadResponse *)v21;

LABEL_17:
  (*(void (**)(void))(*(_QWORD *)(a1 + 56) + 16))();

}

uint64_t __52__COMeshAlarmAddOn_handleAlarmReadRequest_callback___block_invoke_2(uint64_t a1, void *a2)
{
  int v2;
  void *v3;
  void *v4;

  if (*(_QWORD *)(a1 + 32))
  {
    v2 = objc_msgSend(*(id *)(a1 + 40), "_isAlarm:targetingAccessory:", a2);
  }
  else
  {
    objc_msgSend(a2, "siriContext");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "objectForKey:", *MEMORY[0x24BE19C48]);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v2 = v4 == 0;

  }
  return v2 ^ 1u;
}

void __52__COMeshAlarmAddOn_handleAlarmReadRequest_callback___block_invoke_186(uint64_t a1, void *a2, void *a3)
{
  id v5;
  COAlarmReadResponse *v6;
  COAlarmReadResponse *v7;
  void *v8;
  id v9;
  NSObject *v10;
  uint64_t v11;
  COMeshResponse *v12;
  id v13;
  id v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t i;
  void *v19;
  void *v20;
  void *v21;
  int v22;
  int v23;
  void *v24;
  id v25;
  void *v26;
  void *v27;
  id v28;
  uint64_t v29;
  void *v30;
  void *v31;
  NSObject *v32;
  NSObject *v33;
  char v34;
  COAlarmReadResponse *v35;
  COAlarmReadResponse *v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t (*v39)(uint64_t, void *);
  void *v40;
  id v41;
  uint64_t v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  uint8_t buf[4];
  id v48;
  _BYTE v49[128];
  uint64_t v50;

  v50 = *MEMORY[0x24BDAC8D0];
  v5 = a2;
  v6 = a3;
  v7 = v6;
  if (*(_QWORD *)(a1 + 32))
  {

    v8 = *(void **)(a1 + 32);
    if (v5)
    {
      objc_msgSend(v5, "arrayByAddingObjectsFromArray:", v8);
      v9 = (id)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      v9 = v8;
    }
    v13 = objc_alloc_init(MEMORY[0x24BDBCED8]);
    v43 = 0u;
    v44 = 0u;
    v45 = 0u;
    v46 = 0u;
    v14 = v9;
    v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v43, v49, 16);
    if (v15)
    {
      v16 = v15;
      v17 = *(_QWORD *)v44;
      do
      {
        for (i = 0; i != v16; ++i)
        {
          if (*(_QWORD *)v44 != v17)
            objc_enumerationMutation(v14);
          v19 = *(void **)(*((_QWORD *)&v43 + 1) + 8 * i);
          objc_msgSend(v19, "alarmID");
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v13, "objectForKey:", v20);
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          v22 = objc_msgSend(*(id *)(a1 + 40), "_isAlarm:targetingAccessory:", v19, *(_QWORD *)(a1 + 48));
          v23 = v22;
          if (v21)
          {
            if (v22 == objc_msgSend(*(id *)(a1 + 40), "_isAlarm:targetingAccessory:", v21, *(_QWORD *)(a1 + 48)))goto LABEL_21;
          }
          else if ((v22 & 1) == 0)
          {
LABEL_21:
            objc_msgSend(v19, "COPreferredAlarm:", v21);
            v25 = (id)objc_claimAutoreleasedReturnValue();
            goto LABEL_22;
          }
          if (v23)
            v24 = v19;
          else
            v24 = v21;
          v25 = v24;
LABEL_22:
          v26 = v25;
          objc_msgSend(v13, "setObject:forKey:", v25, v20);

        }
        v16 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v43, v49, 16);
      }
      while (v16);
    }

    objc_msgSend(v13, "allValues");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "sortedArrayUsingSelector:", sel_compare_);
    v5 = (id)objc_claimAutoreleasedReturnValue();

LABEL_25:
    if (*(_BYTE *)(a1 + 72))
    {
      v37 = MEMORY[0x24BDAC760];
      v38 = 3221225472;
      v39 = __52__COMeshAlarmAddOn_handleAlarmReadRequest_callback___block_invoke_2_187;
      v40 = &unk_24D4B3198;
      v28 = *(id *)(a1 + 48);
      v29 = *(_QWORD *)(a1 + 40);
      v41 = v28;
      v42 = v29;
      objc_msgSend(v5, "indexesOfObjectsPassingTest:", &v37);
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v30, "count", v37, v38, v39, v40))
      {
        v31 = (void *)objc_msgSend(v5, "mutableCopy");
        objc_msgSend(v31, "removeObjectsAtIndexes:", v30);

        v5 = v31;
      }
      COCoreLogForCategory(2);
      v32 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v32, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        v48 = v5;
        _os_log_impl(&dword_215E92000, v32, OS_LOG_TYPE_DEFAULT, "... returning filtered alarms list\n%@", buf, 0xCu);
      }

      v7 = -[COAlarmReadResponse initWithFilteredAlarms:]([COAlarmReadResponse alloc], "initWithFilteredAlarms:", v5);
    }
    else
    {
      COCoreLogForCategory(2);
      v33 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v33, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        v48 = v5;
        _os_log_impl(&dword_215E92000, v33, OS_LOG_TYPE_DEFAULT, "... returning alarms list\n%@", buf, 0xCu);
      }

      v34 = objc_msgSend(*(id *)(a1 + 56), "isForMerge");
      v35 = [COAlarmReadResponse alloc];
      v36 = v35;
      if ((v34 & 1) == 0)
      {
        v7 = -[COAlarmReadResponse initWithAlarms:](v35, "initWithAlarms:", v5);
        goto LABEL_36;
      }
      objc_msgSend(*(id *)(a1 + 40), "deletes");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = -[COAlarmReadResponse initWithAlarms:deletes:](v36, "initWithAlarms:deletes:", v5, v30);
    }

LABEL_36:
    (*(void (**)(void))(*(_QWORD *)(a1 + 64) + 16))();
    goto LABEL_37;
  }
  if (!v6)
    goto LABEL_25;
  COCoreLogForCategory(2);
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    __52__COMeshAlarmAddOn_handleAlarmReadRequest_callback___block_invoke_cold_1();

  v11 = *(_QWORD *)(a1 + 64);
  v12 = -[COMeshResponse initWithError:]([COMeshResponse alloc], "initWithError:", v7);
  (*(void (**)(uint64_t, COMeshResponse *, _QWORD))(v11 + 16))(v11, v12, 0);

LABEL_37:
}

uint64_t __52__COMeshAlarmAddOn_handleAlarmReadRequest_callback___block_invoke_2_187(uint64_t a1, void *a2)
{
  int v2;
  void *v3;
  void *v4;

  if (*(_QWORD *)(a1 + 32))
  {
    v2 = objc_msgSend(*(id *)(a1 + 40), "_isAlarm:targetingAccessory:", a2);
  }
  else
  {
    objc_msgSend(a2, "siriContext");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "objectForKey:", *MEMORY[0x24BE19C48]);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v2 = v4 == 0;

  }
  return v2 ^ 1u;
}

- (void)handleAlarmCreateRequest:(id)a3 callback:(id)a4
{
  NSObject *v6;
  NSObject *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  COMeshResponse *v19;
  id v20;
  id v21;
  id v22;
  COMeshResponse *v23;
  uint64_t v24;
  uint64_t v25;
  void *v26;
  uint64_t i;
  void *v28;
  void *v29;
  void *v30;
  int v31;
  void *v32;
  void *v33;
  void *v34;
  NSObject *v35;
  void *v36;
  _BOOL4 v37;
  id v38;
  id v39;
  void *v40;
  void *v41;
  COMeshAlarmAddOn *val;
  id v43;
  void *v44;
  void *v45;
  _QWORD v46[4];
  COMeshResponse *v47;
  id v48;
  COMeshAlarmAddOn *v49;
  id v50;
  id v51;
  BOOL v52;
  _QWORD v53[4];
  COMeshResponse *v54;
  id v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  uint8_t v60[128];
  uint8_t buf[4];
  void *v62;
  __int16 v63;
  void *v64;
  uint64_t v65;

  v65 = *MEMORY[0x24BDAC8D0];
  v39 = a3;
  v38 = a4;
  val = self;
  -[COMeshAddOn meshController](self, "meshController");
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  -[COMeshAddOn meshControllerQueue](self, "meshControllerQueue");
  v6 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v6);

  objc_msgSend(v39, "alarm");
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  COCoreLogForCategory(2);
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    -[COMeshAddOn meshController](self, "meshController");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v44, "alarmID");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 134218242;
    v62 = v8;
    v63 = 2112;
    v64 = v9;
    _os_log_impl(&dword_215E92000, v7, OS_LOG_TYPE_DEFAULT, "%p adding alarm %@...", buf, 0x16u);

  }
  -[COMeshAlarmAddOn homekit](val, "homekit");
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v44, "siriContext");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "objectForKey:", *MEMORY[0x24BE19C48]);
  v41 = (void *)objc_claimAutoreleasedReturnValue();

  v11 = objc_msgSend(v41, "length");
  if (v11)
  {
    objc_msgSend(v45, "allAccessoriesForSiriContextTargetReference:", v41);
    v36 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v36 = 0;
  }
  v43 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
  v37 = -[COMeshAlarmAddOn performsLocalActions](val, "performsLocalActions");
  if (!v11 || objc_msgSend(v45, "hasOptedToHH2"))
  {
    if (v37)
    {
      -[COMeshAlarmAddOn alarmManager](val, "alarmManager");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "addAlarm:", v44);
    }
    else
    {
      objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", *MEMORY[0x24BDD0B88], 3328, 0);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BE6B608], "futureWithError:", v12);
    }
    v13 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v43, "addObject:", v13, v36);
LABEL_12:

    if (objc_msgSend(v43, "count") == 1)
    {
      objc_msgSend(v43, "firstObject");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v15 = (void *)MEMORY[0x24BE6B628];
      objc_msgSend(v40, "dispatchQueue");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "schedulerWithDispatchQueue:", v16);
      v17 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(MEMORY[0x24BE6B608], "combineAllFutures:ignoringErrors:scheduler:", v43, 1, v17);
      v14 = (void *)objc_claimAutoreleasedReturnValue();

    }
    v18 = MEMORY[0x24BDAC760];
    v53[0] = MEMORY[0x24BDAC760];
    v53[1] = 3221225472;
    v53[2] = __54__COMeshAlarmAddOn_handleAlarmCreateRequest_callback___block_invoke;
    v53[3] = &unk_24D4B2310;
    v19 = v44;
    v54 = v19;
    v20 = v38;
    v55 = v20;
    v21 = (id)objc_msgSend(v14, "addFailureBlock:", v53);
    objc_initWeak((id *)buf, val);
    v46[0] = v18;
    v46[1] = 3221225472;
    v46[2] = __54__COMeshAlarmAddOn_handleAlarmCreateRequest_callback___block_invoke_188;
    v46[3] = &unk_24D4B3BC8;
    v47 = v19;
    v50 = v20;
    v48 = v40;
    objc_copyWeak(&v51, (id *)buf);
    v52 = v37;
    v49 = val;
    v22 = (id)objc_msgSend(v14, "addSuccessBlock:", v46);
    objc_destroyWeak(&v51);

    objc_destroyWeak((id *)buf);
    v23 = v54;
    goto LABEL_16;
  }
  if (v36)
  {
    v58 = 0u;
    v59 = 0u;
    v56 = 0u;
    v57 = 0u;
    v13 = v36;
    v12 = 0;
    v24 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v56, v60, 16);
    if (v24)
    {
      v25 = *(_QWORD *)v57;
      v26 = (void *)*MEMORY[0x24BDD49E0];
      do
      {
        for (i = 0; i != v24; ++i)
        {
          if (*(_QWORD *)v57 != v25)
            objc_enumerationMutation(v13);
          v28 = *(void **)(*((_QWORD *)&v56 + 1) + 8 * i);
          objc_msgSend(v28, "category", v36);
          v29 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v29, "categoryType");
          v30 = (void *)objc_claimAutoreleasedReturnValue();
          v31 = objc_msgSend(v26, "isEqualToString:", v30);

          if (v31)
          {
            objc_msgSend(v45, "homeForAccessory:", v28);
            v32 = (void *)objc_claimAutoreleasedReturnValue();
            if (v32)
            {
              objc_msgSend(v45, "addAlarm:toAccessory:inHome:", v44, v28, v32);
              v33 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v43, "addObject:", v33);

            }
          }
          else if (!v12)
          {
            -[COMeshAlarmAddOn alarmManager](val, "alarmManager");
            v34 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v34, "addAlarm:", v44);
            v12 = (void *)objc_claimAutoreleasedReturnValue();

            objc_msgSend(v43, "addObject:", v12);
          }
        }
        v24 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v56, v60, 16);
      }
      while (v24);
    }
    goto LABEL_12;
  }
  COCoreLogForCategory(2);
  v35 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v35, OS_LOG_TYPE_ERROR))
    -[COMeshAlarmAddOn handleAlarmCreateRequest:callback:].cold.1((uint64_t)v40);

  objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", *MEMORY[0x24BDD5BD8], 2, 0);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = -[COMeshResponse initWithError:]([COMeshResponse alloc], "initWithError:", v14);
  (*((void (**)(id, COMeshResponse *, _QWORD))v38 + 2))(v38, v23, 0);
LABEL_16:

}

void __54__COMeshAlarmAddOn_handleAlarmCreateRequest_callback___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  COMeshResponse *v6;

  v3 = a2;
  COCoreLogForCategory(2);
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    __54__COMeshAlarmAddOn_handleAlarmCreateRequest_callback___block_invoke_cold_1();

  v5 = *(_QWORD *)(a1 + 40);
  v6 = -[COMeshResponse initWithError:]([COMeshResponse alloc], "initWithError:", v3);
  (*(void (**)(uint64_t, COMeshResponse *, _QWORD))(v5 + 16))(v5, v6, 0);

}

void __54__COMeshAlarmAddOn_handleAlarmCreateRequest_callback___block_invoke_188(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  uint64_t v4;
  COMeshResponse *v5;
  COAlarmsAddedNotification *v6;
  void *v7;
  COAlarmsAddedNotification *v8;
  NSObject *v9;
  id WeakRetained;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  uint8_t buf[4];
  void *v17;
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  COCoreLogForCategory(2);
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(*(id *)(a1 + 32), "alarmID");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412290;
    v17 = v3;
    _os_log_impl(&dword_215E92000, v2, OS_LOG_TYPE_DEFAULT, "... alarm (%@) create completed", buf, 0xCu);

  }
  v4 = *(_QWORD *)(a1 + 56);
  v5 = objc_alloc_init(COMeshResponse);
  (*(void (**)(uint64_t, COMeshResponse *, _QWORD))(v4 + 16))(v4, v5, 0);

  v6 = [COAlarmsAddedNotification alloc];
  v15 = *(_QWORD *)(a1 + 32);
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v15, 1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = -[COAlarmNotification initWithAlarms:](v6, "initWithAlarms:", v7);

  COCoreLogForCategory(2);
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
    __54__COMeshAlarmAddOn_handleAlarmCreateRequest_callback___block_invoke_188_cold_1(a1, (id *)(a1 + 32), v9);

  objc_msgSend(*(id *)(a1 + 40), "sendNotification:", v8);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 64));
  v11 = WeakRetained;
  if (WeakRetained && !*(_BYTE *)(a1 + 72))
  {
    objc_msgSend(WeakRetained, "delegate");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_opt_respondsToSelector() & 1) != 0)
    {
      v13 = *(_QWORD *)(a1 + 48);
      -[COAlarmNotification alarms](v8, "alarms");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "alarmAddOn:didAddAlarms:", v13, v14);

    }
  }

}

- (void)handleAlarmUpdateRequest:(id)a3 callback:(id)a4
{
  NSObject *v6;
  NSObject *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  COMeshResponse *v19;
  id v20;
  id v21;
  id v22;
  COMeshResponse *v23;
  uint64_t v24;
  uint64_t v25;
  void *v26;
  uint64_t i;
  void *v28;
  void *v29;
  void *v30;
  int v31;
  void *v32;
  void *v33;
  void *v34;
  NSObject *v35;
  void *v36;
  _BOOL4 v37;
  id v38;
  id v39;
  void *v40;
  void *v41;
  COMeshAlarmAddOn *val;
  id v43;
  void *v44;
  void *v45;
  _QWORD v46[4];
  COMeshResponse *v47;
  id v48;
  COMeshAlarmAddOn *v49;
  id v50;
  id v51;
  BOOL v52;
  _QWORD v53[4];
  COMeshResponse *v54;
  id v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  uint8_t v60[128];
  uint8_t buf[4];
  void *v62;
  __int16 v63;
  void *v64;
  uint64_t v65;

  v65 = *MEMORY[0x24BDAC8D0];
  v39 = a3;
  v38 = a4;
  val = self;
  -[COMeshAddOn meshController](self, "meshController");
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  -[COMeshAddOn meshControllerQueue](self, "meshControllerQueue");
  v6 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v6);

  objc_msgSend(v39, "alarm");
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  COCoreLogForCategory(2);
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    -[COMeshAddOn meshController](self, "meshController");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v44, "alarmID");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 134218242;
    v62 = v8;
    v63 = 2112;
    v64 = v9;
    _os_log_impl(&dword_215E92000, v7, OS_LOG_TYPE_DEFAULT, "%p updating alarm %@...", buf, 0x16u);

  }
  -[COMeshAlarmAddOn homekit](val, "homekit");
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v44, "siriContext");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "objectForKey:", *MEMORY[0x24BE19C48]);
  v41 = (void *)objc_claimAutoreleasedReturnValue();

  v11 = objc_msgSend(v41, "length");
  if (v11)
  {
    objc_msgSend(v45, "allAccessoriesForSiriContextTargetReference:", v41);
    v36 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v36 = 0;
  }
  v43 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
  v37 = -[COMeshAlarmAddOn performsLocalActions](val, "performsLocalActions");
  if (!v11 || objc_msgSend(v45, "hasOptedToHH2"))
  {
    if (v37)
    {
      -[COMeshAlarmAddOn alarmManager](val, "alarmManager");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "updateAlarm:", v44);
    }
    else
    {
      objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", *MEMORY[0x24BDD0B88], 3328, 0);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BE6B608], "futureWithError:", v12);
    }
    v13 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v43, "addObject:", v13, v36);
LABEL_12:

    if (objc_msgSend(v43, "count") == 1)
    {
      objc_msgSend(v43, "firstObject");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v15 = (void *)MEMORY[0x24BE6B628];
      objc_msgSend(v40, "dispatchQueue");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "schedulerWithDispatchQueue:", v16);
      v17 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(MEMORY[0x24BE6B608], "combineAllFutures:ignoringErrors:scheduler:", v43, 1, v17);
      v14 = (void *)objc_claimAutoreleasedReturnValue();

    }
    v18 = MEMORY[0x24BDAC760];
    v53[0] = MEMORY[0x24BDAC760];
    v53[1] = 3221225472;
    v53[2] = __54__COMeshAlarmAddOn_handleAlarmUpdateRequest_callback___block_invoke;
    v53[3] = &unk_24D4B2310;
    v19 = v44;
    v54 = v19;
    v20 = v38;
    v55 = v20;
    v21 = (id)objc_msgSend(v14, "addFailureBlock:", v53);
    objc_initWeak((id *)buf, val);
    v46[0] = v18;
    v46[1] = 3221225472;
    v46[2] = __54__COMeshAlarmAddOn_handleAlarmUpdateRequest_callback___block_invoke_190;
    v46[3] = &unk_24D4B3BC8;
    v47 = v19;
    v50 = v20;
    v48 = v40;
    objc_copyWeak(&v51, (id *)buf);
    v52 = v37;
    v49 = val;
    v22 = (id)objc_msgSend(v14, "addSuccessBlock:", v46);
    objc_destroyWeak(&v51);

    objc_destroyWeak((id *)buf);
    v23 = v54;
    goto LABEL_16;
  }
  if (v36)
  {
    v58 = 0u;
    v59 = 0u;
    v56 = 0u;
    v57 = 0u;
    v13 = v36;
    v12 = 0;
    v24 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v56, v60, 16);
    if (v24)
    {
      v25 = *(_QWORD *)v57;
      v26 = (void *)*MEMORY[0x24BDD49E0];
      do
      {
        for (i = 0; i != v24; ++i)
        {
          if (*(_QWORD *)v57 != v25)
            objc_enumerationMutation(v13);
          v28 = *(void **)(*((_QWORD *)&v56 + 1) + 8 * i);
          objc_msgSend(v28, "category", v36);
          v29 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v29, "categoryType");
          v30 = (void *)objc_claimAutoreleasedReturnValue();
          v31 = objc_msgSend(v26, "isEqualToString:", v30);

          if (v31)
          {
            objc_msgSend(v45, "homeForAccessory:", v28);
            v32 = (void *)objc_claimAutoreleasedReturnValue();
            if (v32)
            {
              objc_msgSend(v45, "updateAlarm:onAccessory:inHome:", v44, v28, v32);
              v33 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v43, "addObject:", v33);

            }
          }
          else if (!v12)
          {
            -[COMeshAlarmAddOn alarmManager](val, "alarmManager");
            v34 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v34, "updateAlarm:", v44);
            v12 = (void *)objc_claimAutoreleasedReturnValue();

            objc_msgSend(v43, "addObject:", v12);
          }
        }
        v24 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v56, v60, 16);
      }
      while (v24);
    }
    goto LABEL_12;
  }
  COCoreLogForCategory(2);
  v35 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v35, OS_LOG_TYPE_ERROR))
    -[COMeshAlarmAddOn handleAlarmUpdateRequest:callback:].cold.1((uint64_t)v40);

  objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", *MEMORY[0x24BDD5BD8], 2, 0);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = -[COMeshResponse initWithError:]([COMeshResponse alloc], "initWithError:", v14);
  (*((void (**)(id, COMeshResponse *, _QWORD))v38 + 2))(v38, v23, 0);
LABEL_16:

}

void __54__COMeshAlarmAddOn_handleAlarmUpdateRequest_callback___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  COMeshResponse *v6;

  v3 = a2;
  COCoreLogForCategory(2);
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    __54__COMeshAlarmAddOn_handleAlarmUpdateRequest_callback___block_invoke_cold_1();

  v5 = *(_QWORD *)(a1 + 40);
  v6 = -[COMeshResponse initWithError:]([COMeshResponse alloc], "initWithError:", v3);
  (*(void (**)(uint64_t, COMeshResponse *, _QWORD))(v5 + 16))(v5, v6, 0);

}

void __54__COMeshAlarmAddOn_handleAlarmUpdateRequest_callback___block_invoke_190(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  uint64_t v4;
  COMeshResponse *v5;
  COAlarmsUpdatedNotification *v6;
  void *v7;
  COAlarmsUpdatedNotification *v8;
  NSObject *v9;
  id WeakRetained;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  uint8_t buf[4];
  void *v17;
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  COCoreLogForCategory(2);
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(*(id *)(a1 + 32), "alarmID");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412290;
    v17 = v3;
    _os_log_impl(&dword_215E92000, v2, OS_LOG_TYPE_DEFAULT, "... alarm (%@) update completed", buf, 0xCu);

  }
  v4 = *(_QWORD *)(a1 + 56);
  v5 = objc_alloc_init(COMeshResponse);
  (*(void (**)(uint64_t, COMeshResponse *, _QWORD))(v4 + 16))(v4, v5, 0);

  v6 = [COAlarmsUpdatedNotification alloc];
  v15 = *(_QWORD *)(a1 + 32);
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v15, 1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = -[COAlarmNotification initWithAlarms:](v6, "initWithAlarms:", v7);

  COCoreLogForCategory(2);
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
    __54__COMeshAlarmAddOn_handleAlarmUpdateRequest_callback___block_invoke_190_cold_1(a1, (id *)(a1 + 32), v9);

  objc_msgSend(*(id *)(a1 + 40), "sendNotification:", v8);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 64));
  v11 = WeakRetained;
  if (WeakRetained && !*(_BYTE *)(a1 + 72))
  {
    objc_msgSend(WeakRetained, "delegate");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_opt_respondsToSelector() & 1) != 0)
    {
      v13 = *(_QWORD *)(a1 + 48);
      -[COAlarmNotification alarms](v8, "alarms");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "alarmAddOn:didUpdateAlarms:", v13, v14);

    }
  }

}

- (void)handleAlarmDeleteRequest:(id)a3 callback:(id)a4
{
  NSObject *v6;
  NSObject *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  uint64_t i;
  void *v20;
  void *v21;
  void *v22;
  int v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  uint64_t v30;
  id v31;
  id v32;
  id v33;
  id v34;
  id v35;
  id v36;
  id v37;
  id v38;
  void *v39;
  id v40;
  void *v41;
  COMeshAlarmAddOn *val;
  void *v43;
  id v44;
  _QWORD v45[4];
  id v46;
  COMeshAlarmAddOn *v47;
  id v48;
  id v49;
  id v50;
  _QWORD v51[4];
  id v52;
  id v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  uint8_t v58[128];
  uint8_t buf[4];
  void *v60;
  __int16 v61;
  void *v62;
  uint64_t v63;

  v63 = *MEMORY[0x24BDAC8D0];
  v40 = a3;
  v38 = a4;
  val = self;
  -[COMeshAddOn meshController](self, "meshController");
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  -[COMeshAddOn meshControllerQueue](self, "meshControllerQueue");
  v6 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v6);

  objc_msgSend(v40, "alarm");
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  COCoreLogForCategory(2);
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    -[COMeshAddOn meshController](self, "meshController");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v43, "alarmID");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 134218242;
    v60 = v8;
    v61 = 2112;
    v62 = v9;
    _os_log_impl(&dword_215E92000, v7, OS_LOG_TYPE_DEFAULT, "%p deleting alarm %@...", buf, 0x16u);

  }
  -[COMeshAlarmAddOn homekit](self, "homekit");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v43, "siriContext");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "objectForKey:", *MEMORY[0x24BE19C48]);
  v41 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v41, "length"))
  {
    objc_msgSend(v10, "accessoriesForSiriContextTargetReference:", v41);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v12 = 0;
  }
  v44 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
  -[COMeshAlarmAddOn alarmManager](self, "alarmManager");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "removeAlarm:", v43);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v44, "addObject:", v14);

  v56 = 0u;
  v57 = 0u;
  v55 = 0u;
  v54 = 0u;
  v15 = v12;
  v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v54, v58, 16);
  if (v16)
  {
    v17 = *(_QWORD *)v55;
    v18 = (void *)*MEMORY[0x24BDD49E0];
    do
    {
      for (i = 0; i != v16; ++i)
      {
        if (*(_QWORD *)v55 != v17)
          objc_enumerationMutation(v15);
        v20 = *(void **)(*((_QWORD *)&v54 + 1) + 8 * i);
        if ((objc_msgSend(v10, "hasOptedToHH2") & 1) == 0)
        {
          objc_msgSend(v20, "category");
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v21, "categoryType");
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          v23 = objc_msgSend(v18, "isEqualToString:", v22);

          if (v23)
          {
            objc_msgSend(v10, "homeForAccessory:", v20);
            v24 = (void *)objc_claimAutoreleasedReturnValue();
            if (v24)
            {
              objc_msgSend(v10, "removeAlarm:fromAccessory:inHome:", v43, v20, v24);
              v25 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v44, "addObject:", v25);

            }
          }
        }
      }
      v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v54, v58, 16);
    }
    while (v16);
  }

  if (objc_msgSend(v44, "count") == 1)
  {
    objc_msgSend(v44, "firstObject");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v27 = (void *)MEMORY[0x24BE6B628];
    objc_msgSend(v39, "dispatchQueue");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "schedulerWithDispatchQueue:", v28);
    v29 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x24BE6B608], "combineAllFutures:ignoringErrors:scheduler:", v44, 1, v29);
    v26 = (void *)objc_claimAutoreleasedReturnValue();

  }
  v30 = MEMORY[0x24BDAC760];
  v51[0] = MEMORY[0x24BDAC760];
  v51[1] = 3221225472;
  v51[2] = __54__COMeshAlarmAddOn_handleAlarmDeleteRequest_callback___block_invoke;
  v51[3] = &unk_24D4B2310;
  v31 = v43;
  v52 = v31;
  v32 = v38;
  v53 = v32;
  v33 = (id)objc_msgSend(v26, "addFailureBlock:", v51);
  objc_initWeak((id *)buf, val);
  v45[0] = v30;
  v45[1] = 3221225472;
  v45[2] = __54__COMeshAlarmAddOn_handleAlarmDeleteRequest_callback___block_invoke_191;
  v45[3] = &unk_24D4B3BF0;
  v34 = v31;
  v46 = v34;
  v47 = val;
  v35 = v32;
  v49 = v35;
  v36 = v39;
  v48 = v36;
  objc_copyWeak(&v50, (id *)buf);
  v37 = (id)objc_msgSend(v26, "addSuccessBlock:", v45);
  objc_destroyWeak(&v50);

  objc_destroyWeak((id *)buf);
}

void __54__COMeshAlarmAddOn_handleAlarmDeleteRequest_callback___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  COMeshResponse *v6;

  v3 = a2;
  COCoreLogForCategory(2);
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    __54__COMeshAlarmAddOn_handleAlarmDeleteRequest_callback___block_invoke_cold_1();

  v5 = *(_QWORD *)(a1 + 40);
  v6 = -[COMeshResponse initWithError:]([COMeshResponse alloc], "initWithError:", v3);
  (*(void (**)(uint64_t, COMeshResponse *, _QWORD))(v5 + 16))(v5, v6, 0);

}

void __54__COMeshAlarmAddOn_handleAlarmDeleteRequest_callback___block_invoke_191(uint64_t a1)
{
  id *v2;
  void *v3;
  NSObject *v4;
  void *v5;
  COAlarmDeleteEvent *v6;
  void *v7;
  COAlarmDeleteEvent *v8;
  uint64_t v9;
  COMeshResponse *v10;
  COAlarmsRemovedNotification *v11;
  void *v12;
  COAlarmsRemovedNotification *v13;
  NSObject *v14;
  id WeakRetained;
  void *v16;
  void *v17;
  uint64_t v18;
  void *v19;
  uint64_t v20;
  uint8_t buf[4];
  void *v22;
  uint64_t v23;

  v23 = *MEMORY[0x24BDAC8D0];
  v2 = (id *)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 32), "alarmID");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  COCoreLogForCategory(2);
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v22 = v3;
    _os_log_impl(&dword_215E92000, v4, OS_LOG_TYPE_DEFAULT, "... alarm (%@) delete completed", buf, 0xCu);
  }

  v5 = *(void **)(a1 + 40);
  v6 = [COAlarmDeleteEvent alloc];
  objc_msgSend(MEMORY[0x24BDBCE60], "now");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = -[COAlarmDeleteEvent initWithIdentifier:date:](v6, "initWithIdentifier:date:", v3, v7);
  objc_msgSend(v5, "_addAlarmDeleteEvent:", v8);

  v9 = *(_QWORD *)(a1 + 56);
  v10 = objc_alloc_init(COMeshResponse);
  (*(void (**)(uint64_t, COMeshResponse *, _QWORD))(v9 + 16))(v9, v10, 0);

  v11 = [COAlarmsRemovedNotification alloc];
  v20 = *(_QWORD *)(a1 + 32);
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v20, 1);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = -[COAlarmNotification initWithAlarms:](v11, "initWithAlarms:", v12);

  COCoreLogForCategory(2);
  v14 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
    __54__COMeshAlarmAddOn_handleAlarmDeleteRequest_callback___block_invoke_191_cold_1(a1, v2, v14);

  objc_msgSend(*(id *)(a1 + 48), "sendNotification:", v13);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 64));
  v16 = WeakRetained;
  if (WeakRetained && (objc_msgSend(WeakRetained, "performsLocalActions") & 1) == 0)
  {
    objc_msgSend(v16, "delegate");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_opt_respondsToSelector() & 1) != 0)
    {
      v18 = *(_QWORD *)(a1 + 40);
      -[COAlarmNotification alarms](v13, "alarms");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "alarmAddOn:didRemoveAlarms:", v18, v19);

    }
  }

}

- (void)handleAlarmSnoozeRequest:(id)a3 callback:(id)a4
{
  id v6;
  id v7;
  void *v8;
  NSObject *v9;
  void *v10;
  NSObject *v11;
  void *v12;
  void *v13;
  id v14;
  id v15;
  id v16;
  id v17;
  _QWORD v18[4];
  id v19;
  id v20;
  id v21;
  uint8_t buf[4];
  void *v23;
  __int16 v24;
  void *v25;
  uint64_t v26;

  v26 = *MEMORY[0x24BDAC8D0];
  v6 = a4;
  v7 = a3;
  -[COMeshAddOn meshController](self, "meshController");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[COMeshAddOn meshControllerQueue](self, "meshControllerQueue");
  v9 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v9);

  objc_msgSend(v7, "identifier");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  COCoreLogForCategory(2);
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134218242;
    v23 = v8;
    v24 = 2112;
    v25 = v10;
    _os_log_impl(&dword_215E92000, v11, OS_LOG_TYPE_DEFAULT, "%p snoozing alarm %@...", buf, 0x16u);
  }

  -[COMeshAlarmAddOn alarmManager](self, "alarmManager");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "snoozeAlarmWithIdentifier:", v10);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v18[0] = MEMORY[0x24BDAC760];
  v18[1] = 3221225472;
  v18[2] = __54__COMeshAlarmAddOn_handleAlarmSnoozeRequest_callback___block_invoke;
  v18[3] = &unk_24D4B3C18;
  v20 = v8;
  v21 = v6;
  v19 = v10;
  v14 = v8;
  v15 = v6;
  v16 = v10;
  v17 = (id)objc_msgSend(v13, "addCompletionBlock:", v18);

}

void __54__COMeshAlarmAddOn_handleAlarmSnoozeRequest_callback___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  NSObject *v8;
  uint64_t v9;
  uint64_t v10;
  COMeshResponse *v11;
  COAlarmSnoozeNotification *v12;
  NSObject *v13;
  int v14;
  uint64_t v15;
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  v5 = a2;
  v6 = a3;
  COCoreLogForCategory(2);
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (v6)
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      __54__COMeshAlarmAddOn_handleAlarmSnoozeRequest_callback___block_invoke_cold_2();
  }
  else if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    v9 = *(_QWORD *)(a1 + 32);
    v14 = 138412290;
    v15 = v9;
    _os_log_impl(&dword_215E92000, v8, OS_LOG_TYPE_DEFAULT, "... alarm (%@) snooze completed", (uint8_t *)&v14, 0xCu);
  }

  v10 = *(_QWORD *)(a1 + 48);
  v11 = objc_alloc_init(COMeshResponse);
  (*(void (**)(uint64_t, COMeshResponse *, _QWORD))(v10 + 16))(v10, v11, 0);

  v12 = -[COAlarmSnoozeNotification initWithAlarmIdentifier:]([COAlarmSnoozeNotification alloc], "initWithAlarmIdentifier:", *(_QWORD *)(a1 + 32));
  COCoreLogForCategory(2);
  v13 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
    __54__COMeshAlarmAddOn_handleAlarmSnoozeRequest_callback___block_invoke_cold_1();

  objc_msgSend(*(id *)(a1 + 40), "sendNotification:", v12);
}

- (void)handleAlarmDismissRequest:(id)a3 callback:(id)a4
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
  void *v16;
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
  id v28;
  _QWORD v29[4];
  id v30;
  id v31;
  _BYTE *v32;
  _QWORD v33[4];
  id v34;
  id v35;
  id v36;
  _QWORD *v37;
  _QWORD v38[4];
  id v39;
  id v40;
  _QWORD v41[4];
  id v42;
  COMeshAlarmAddOn *v43;
  _QWORD *v44;
  _BYTE *v45;
  id v46;
  id location;
  _QWORD v48[3];
  char v49;
  _BYTE buf[24];
  uint64_t (*v51)(uint64_t, uint64_t);
  void (*v52)(uint64_t);
  id v53;
  uint64_t v54;

  v54 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  -[COMeshAddOn meshController](self, "meshController");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[COMeshAddOn meshControllerQueue](self, "meshControllerQueue");
  v9 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v9);

  objc_msgSend(v6, "identifier");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  COCoreLogForCategory(2);
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134218242;
    *(_QWORD *)&buf[4] = v8;
    *(_WORD *)&buf[12] = 2112;
    *(_QWORD *)&buf[14] = v10;
    _os_log_impl(&dword_215E92000, v11, OS_LOG_TYPE_DEFAULT, "%p dismissing alarm %@...", buf, 0x16u);
  }

  v48[0] = 0;
  v48[1] = v48;
  v48[2] = 0x2020000000;
  v49 = 0;
  *(_QWORD *)buf = 0;
  *(_QWORD *)&buf[8] = buf;
  *(_QWORD *)&buf[16] = 0x3032000000;
  v51 = __Block_byref_object_copy__24;
  v52 = __Block_byref_object_dispose__24;
  v53 = 0;
  -[COMeshAlarmAddOn alarmManager](self, "alarmManager");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "dismissAlarmWithIdentifier:", v10);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "alarms");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_initWeak(&location, self);
  v15 = MEMORY[0x24BDAC760];
  v41[0] = MEMORY[0x24BDAC760];
  v41[1] = 3221225472;
  v41[2] = __55__COMeshAlarmAddOn_handleAlarmDismissRequest_callback___block_invoke;
  v41[3] = &unk_24D4B3C40;
  v44 = v48;
  v45 = buf;
  v28 = v8;
  v42 = v28;
  objc_copyWeak(&v46, &location);
  v43 = self;
  v16 = (void *)MEMORY[0x2199F3D40](v41);
  v17 = v6;
  v38[0] = v15;
  v38[1] = 3221225472;
  v38[2] = __55__COMeshAlarmAddOn_handleAlarmDismissRequest_callback___block_invoke_193;
  v38[3] = &unk_24D4B2310;
  v18 = v10;
  v39 = v18;
  v19 = v7;
  v40 = v19;
  v20 = (id)objc_msgSend(v13, "addFailureBlock:", v38);
  v33[0] = v15;
  v33[1] = 3221225472;
  v33[2] = __55__COMeshAlarmAddOn_handleAlarmDismissRequest_callback___block_invoke_194;
  v33[3] = &unk_24D4B23B0;
  v21 = v18;
  v34 = v21;
  v22 = v19;
  v35 = v22;
  v37 = v48;
  v23 = v16;
  v36 = v23;
  v24 = (id)objc_msgSend(v13, "addSuccessBlock:", v33);
  v29[0] = v15;
  v29[1] = 3221225472;
  v29[2] = __55__COMeshAlarmAddOn_handleAlarmDismissRequest_callback___block_invoke_195;
  v29[3] = &unk_24D4B2400;
  v25 = v21;
  v30 = v25;
  v32 = buf;
  v26 = v23;
  v31 = v26;
  v27 = (id)objc_msgSend(v14, "addSuccessBlock:", v29);

  objc_destroyWeak(&v46);
  objc_destroyWeak(&location);

  _Block_object_dispose(buf, 8);
  _Block_object_dispose(v48, 8);

}

void __55__COMeshAlarmAddOn_handleAlarmDismissRequest_callback___block_invoke(uint64_t a1)
{
  uint64_t v2;
  COAlarmFiringAlarmDismissedNotification *v3;
  void *v4;
  COAlarmFiringAlarmDismissedNotification *v5;
  NSObject *v6;
  id WeakRetained;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  _QWORD v13[2];

  v13[1] = *MEMORY[0x24BDAC8D0];
  if (*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24))
  {
    v2 = a1 + 56;
    if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40))
    {
      v3 = [COAlarmFiringAlarmDismissedNotification alloc];
      v13[0] = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)v2 + 8) + 40);
      objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v13, 1);
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      v5 = -[COAlarmNotification initWithAlarms:](v3, "initWithAlarms:", v4);

      COCoreLogForCategory(2);
      v6 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
        __55__COMeshAlarmAddOn_handleAlarmDismissRequest_callback___block_invoke_cold_1(a1, v2, v6);

      objc_msgSend(*(id *)(a1 + 32), "sendNotification:", v5);
      WeakRetained = objc_loadWeakRetained((id *)(a1 + 64));
      v8 = WeakRetained;
      if (WeakRetained)
      {
        objc_msgSend(WeakRetained, "delegate");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        if ((objc_opt_respondsToSelector() & 1) != 0)
        {
          v10 = *(_QWORD *)(a1 + 40);
          v12 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40);
          objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v12, 1);
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v9, "alarmAddOn:didDismissAlarms:", v10, v11);

        }
      }

    }
  }
}

void __55__COMeshAlarmAddOn_handleAlarmDismissRequest_callback___block_invoke_193(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  COMeshResponse *v6;

  v3 = a2;
  COCoreLogForCategory(2);
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    __55__COMeshAlarmAddOn_handleAlarmDismissRequest_callback___block_invoke_193_cold_1();

  v5 = *(_QWORD *)(a1 + 40);
  v6 = -[COMeshResponse initWithError:]([COMeshResponse alloc], "initWithError:", v3);
  (*(void (**)(uint64_t, COMeshResponse *, _QWORD))(v5 + 16))(v5, v6, 0);

}

uint64_t __55__COMeshAlarmAddOn_handleAlarmDismissRequest_callback___block_invoke_194(_QWORD *a1)
{
  NSObject *v2;
  uint64_t v3;
  uint64_t v4;
  COMeshResponse *v5;
  int v7;
  uint64_t v8;
  uint64_t v9;

  v9 = *MEMORY[0x24BDAC8D0];
  COCoreLogForCategory(2);
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    v3 = a1[4];
    v7 = 138412290;
    v8 = v3;
    _os_log_impl(&dword_215E92000, v2, OS_LOG_TYPE_DEFAULT, "... alarm (%@) dismiss completed", (uint8_t *)&v7, 0xCu);
  }

  v4 = a1[5];
  v5 = objc_alloc_init(COMeshResponse);
  (*(void (**)(uint64_t, COMeshResponse *, _QWORD))(v4 + 16))(v4, v5, 0);

  *(_BYTE *)(*(_QWORD *)(a1[7] + 8) + 24) = 1;
  return (*(uint64_t (**)(void))(a1[6] + 16))();
}

void __55__COMeshAlarmAddOn_handleAlarmDismissRequest_callback___block_invoke_195(uint64_t a1, void *a2)
{
  id v4;
  __int128 v5;
  _QWORD v6[4];
  id v7;
  __int128 v8;

  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __55__COMeshAlarmAddOn_handleAlarmDismissRequest_callback___block_invoke_2;
  v6[3] = &unk_24D4B3C68;
  v7 = *(id *)(a1 + 32);
  v5 = *(_OWORD *)(a1 + 40);
  v4 = (id)v5;
  v8 = v5;
  objc_msgSend(a2, "enumerateObjectsUsingBlock:", v6);

}

void __55__COMeshAlarmAddOn_handleAlarmDismissRequest_callback___block_invoke_2(_QWORD *a1, void *a2, uint64_t a3, _BYTE *a4)
{
  void *v7;
  int v8;
  id v9;

  v9 = a2;
  objc_msgSend(v9, "alarmIDString");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "isEqualToString:", a1[4]);
  *a4 = v8;

  if (v8)
  {
    objc_storeStrong((id *)(*(_QWORD *)(a1[6] + 8) + 40), a2);
    (*(void (**)(void))(a1[5] + 16))();
  }

}

- (void)handleAlarmsAddedNotification:(id)a3
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
  objc_msgSend(v4, "alarms");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v6, "count"))
  {
    v7 = -[COMeshAlarmAddOn performsLocalActions](self, "performsLocalActions");
    v8 = MEMORY[0x24BDAC760];
    if (v7)
    {
      v9 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
      objc_msgSend(MEMORY[0x24BE6B628], "schedulerWithDispatchQueue:", v5);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      -[COMeshAlarmAddOn alarmManager](self, "alarmManager");
      v17[0] = v8;
      v17[1] = 3221225472;
      v17[2] = __50__COMeshAlarmAddOn_handleAlarmsAddedNotification___block_invoke;
      v17[3] = &unk_24D4B3C90;
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
    v15[2] = __50__COMeshAlarmAddOn_handleAlarmsAddedNotification___block_invoke_197;
    v15[3] = &unk_24D4B2450;
    v15[4] = self;
    v16 = v6;
    v14 = (id)-[NSObject addSuccessBlock:](v13, "addSuccessBlock:", v15);

  }
  else
  {
    COCoreLogForCategory(2);
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
      -[COMeshAlarmAddOn handleAlarmsAddedNotification:].cold.1();
  }

}

void __50__COMeshAlarmAddOn_handleAlarmsAddedNotification___block_invoke(uint64_t a1, void *a2)
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
  COCoreLogForCategory(2);
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v5 = *(_QWORD *)(a1 + 32);
    objc_msgSend(v3, "alarmID");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = 134218242;
    v10 = v5;
    v11 = 2112;
    v12 = v6;
    _os_log_impl(&dword_215E92000, v4, OS_LOG_TYPE_DEFAULT, "%p adding local alarm %@", (uint8_t *)&v9, 0x16u);

  }
  v7 = *(void **)(a1 + 40);
  objc_msgSend(*(id *)(a1 + 48), "addAlarm:", v3);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "addObject:", v8);

}

void __50__COMeshAlarmAddOn_handleAlarmsAddedNotification___block_invoke_197(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  void *v4;
  int v5;
  uint64_t v6;
  uint64_t v7;

  v7 = *MEMORY[0x24BDAC8D0];
  COCoreLogForCategory(2);
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    v3 = *(_QWORD *)(a1 + 32);
    v5 = 134217984;
    v6 = v3;
    _os_log_impl(&dword_215E92000, v2, OS_LOG_TYPE_DEFAULT, "%p finished adding local alarms", (uint8_t *)&v5, 0xCu);
  }

  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v4, "alarmAddOn:didAddAlarms:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));

}

- (void)handleAlarmsRemovedNotification:(id)a3
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
  objc_msgSend(v4, "alarms");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v6, "count"))
  {
    v7 = -[COMeshAlarmAddOn performsLocalActions](self, "performsLocalActions");
    v8 = MEMORY[0x24BDAC760];
    if (v7)
    {
      v9 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
      objc_msgSend(MEMORY[0x24BE6B628], "schedulerWithDispatchQueue:", v5);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BDBCE60], "now");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      -[COMeshAlarmAddOn alarmManager](self, "alarmManager");
      v19[0] = v8;
      v19[1] = 3221225472;
      v19[2] = __52__COMeshAlarmAddOn_handleAlarmsRemovedNotification___block_invoke;
      v19[3] = &unk_24D4B3CB8;
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
    v17[2] = __52__COMeshAlarmAddOn_handleAlarmsRemovedNotification___block_invoke_198;
    v17[3] = &unk_24D4B2450;
    v17[4] = self;
    v18 = v6;
    v16 = (id)-[NSObject addSuccessBlock:](v15, "addSuccessBlock:", v17);

  }
  else
  {
    COCoreLogForCategory(2);
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
      -[COMeshAlarmAddOn handleAlarmsRemovedNotification:].cold.1();
  }

}

void __52__COMeshAlarmAddOn_handleAlarmsRemovedNotification___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  NSObject *v5;
  uint64_t v6;
  void *v7;
  COAlarmDeleteEvent *v8;
  void *v9;
  void *v10;
  int v11;
  uint64_t v12;
  __int16 v13;
  void *v14;
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  objc_msgSend(v3, "alarmID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  COCoreLogForCategory(2);
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v6 = *(_QWORD *)(a1 + 32);
    v11 = 134218242;
    v12 = v6;
    v13 = 2112;
    v14 = v4;
    _os_log_impl(&dword_215E92000, v5, OS_LOG_TYPE_DEFAULT, "%p removing local alarm %@", (uint8_t *)&v11, 0x16u);
  }

  v7 = *(void **)(a1 + 32);
  v8 = -[COAlarmDeleteEvent initWithIdentifier:date:]([COAlarmDeleteEvent alloc], "initWithIdentifier:date:", v4, *(_QWORD *)(a1 + 40));
  objc_msgSend(v7, "_addAlarmDeleteEvent:", v8);

  v9 = *(void **)(a1 + 48);
  objc_msgSend(*(id *)(a1 + 56), "removeAlarm:", v3);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v9, "addObject:", v10);
}

void __52__COMeshAlarmAddOn_handleAlarmsRemovedNotification___block_invoke_198(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  void *v4;
  int v5;
  uint64_t v6;
  uint64_t v7;

  v7 = *MEMORY[0x24BDAC8D0];
  COCoreLogForCategory(2);
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    v3 = *(_QWORD *)(a1 + 32);
    v5 = 134217984;
    v6 = v3;
    _os_log_impl(&dword_215E92000, v2, OS_LOG_TYPE_DEFAULT, "%p finished removing local alarms", (uint8_t *)&v5, 0xCu);
  }

  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v4, "alarmAddOn:didRemoveAlarms:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));

}

- (void)handleAlarmsUpdatedNotification:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  id v10;
  NSObject *v11;
  _QWORD v12[4];
  NSObject *v13;
  id v14;
  COMeshAlarmAddOn *v15;
  id v16;
  uint8_t buf[4];
  COMeshAlarmAddOn *v18;
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  -[COMeshAddOn meshControllerQueue](self, "meshControllerQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v5);
  objc_msgSend(v4, "alarms");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (-[COMeshAlarmAddOn performsLocalActions](self, "performsLocalActions"))
  {
    -[COMeshAlarmAddOn alarmManager](self, "alarmManager");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "alarms");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v12[0] = MEMORY[0x24BDAC760];
    v12[1] = 3221225472;
    v12[2] = __52__COMeshAlarmAddOn_handleAlarmsUpdatedNotification___block_invoke;
    v12[3] = &unk_24D4B1EF8;
    v13 = v5;
    v14 = v6;
    v15 = self;
    v16 = v7;
    v9 = v7;
    v10 = (id)objc_msgSend(v8, "addCompletionBlock:", v12);

  }
  else
  {
    COCoreLogForCategory(2);
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134217984;
      v18 = self;
      _os_log_impl(&dword_215E92000, v11, OS_LOG_TYPE_DEFAULT, "%p not performing local updates.", buf, 0xCu);
    }

    -[COMeshAlarmAddOn delegate](self, "delegate");
    v9 = (id)objc_claimAutoreleasedReturnValue();
    if ((objc_opt_respondsToSelector() & 1) != 0)
      objc_msgSend(v9, "alarmAddOn:didUpdateAlarms:", self, v6);
  }

}

void __52__COMeshAlarmAddOn_handleAlarmsUpdatedNotification___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  int v15;
  NSObject *v16;
  uint64_t v17;
  void *v18;
  NSObject *v19;
  uint64_t v20;
  void *v21;
  void *v22;
  void *v23;
  id v24;
  id v25;
  uint64_t v26;
  id v27;
  void *v28;
  id obj;
  id v30;
  void *v31;
  _QWORD v32[5];
  id v33;
  id v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  uint8_t buf[4];
  uint64_t v40;
  __int16 v41;
  void *v42;
  _BYTE v43[128];
  uint64_t v44;

  v44 = *MEMORY[0x24BDAC8D0];
  v5 = a2;
  v27 = a3;
  v30 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
  objc_msgSend(MEMORY[0x24BE6B628], "schedulerWithDispatchQueue:", *(_QWORD *)(a1 + 32));
  v26 = objc_claimAutoreleasedReturnValue();
  v28 = v5;
  objc_msgSend(v5, "na_dictionaryWithKeyGenerator:", &__block_literal_global_200);
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  v35 = 0u;
  v36 = 0u;
  v37 = 0u;
  v38 = 0u;
  obj = *(id *)(a1 + 40);
  v6 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v35, v43, 16);
  if (v6)
  {
    v7 = v6;
    v8 = 0;
    v9 = *(_QWORD *)v36;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v36 != v9)
          objc_enumerationMutation(obj);
        v11 = *(void **)(*((_QWORD *)&v35 + 1) + 8 * i);
        objc_msgSend(v11, "alarmID");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v31, "objectForKey:", v12);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        if (((objc_msgSend(v13, "isFiring") & 1) != 0 || objc_msgSend(v13, "isSnoozed"))
          && (objc_msgSend(*(id *)(a1 + 48), "homekit"),
              v14 = (void *)objc_claimAutoreleasedReturnValue(),
              v15 = objc_msgSend(v14, "hasOptedToHH2"),
              v14,
              !v15))
        {
          COCoreLogForCategory(2);
          v19 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
          {
            v20 = *(_QWORD *)(a1 + 48);
            *(_DWORD *)buf = 134218242;
            v40 = v20;
            v41 = 2112;
            v42 = v12;
            _os_log_impl(&dword_215E92000, v19, OS_LOG_TYPE_DEFAULT, "%p not updating busy alarm %@", buf, 0x16u);
          }

          if (!v8)
            v8 = (void *)objc_msgSend(*(id *)(a1 + 40), "mutableCopy");
          objc_msgSend(v8, "replaceObjectAtIndex:withObject:", objc_msgSend(v8, "indexOfObject:", v11), v13);
        }
        else
        {
          COCoreLogForCategory(2);
          v16 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
          {
            v17 = *(_QWORD *)(a1 + 48);
            *(_DWORD *)buf = 134218242;
            v40 = v17;
            v41 = 2112;
            v42 = v12;
            _os_log_impl(&dword_215E92000, v16, OS_LOG_TYPE_DEFAULT, "%p updating local alarm %@", buf, 0x16u);
          }

          objc_msgSend(*(id *)(a1 + 56), "updateAlarm:", v11);
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v30, "addObject:", v18);

        }
      }
      v7 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v35, v43, 16);
    }
    while (v7);
  }
  else
  {
    v8 = 0;
  }

  if (objc_msgSend(v30, "count"))
  {
    v21 = (void *)v26;
    objc_msgSend(MEMORY[0x24BE6B608], "combineAllFutures:ignoringErrors:scheduler:", v30, 1, v26);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    objc_msgSend(MEMORY[0x24BE6B608], "futureWithNoResult");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = (void *)v26;
  }
  v32[0] = MEMORY[0x24BDAC760];
  v32[1] = 3221225472;
  v32[2] = __52__COMeshAlarmAddOn_handleAlarmsUpdatedNotification___block_invoke_201;
  v32[3] = &unk_24D4B3D20;
  v23 = *(void **)(a1 + 40);
  v32[4] = *(_QWORD *)(a1 + 48);
  v33 = v8;
  v34 = v23;
  v24 = v8;
  v25 = (id)objc_msgSend(v22, "addSuccessBlock:", v32);

}

uint64_t __52__COMeshAlarmAddOn_handleAlarmsUpdatedNotification___block_invoke_2(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "alarmID");
}

void __52__COMeshAlarmAddOn_handleAlarmsUpdatedNotification___block_invoke_201(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  void *v4;
  uint64_t v5;
  int v6;
  uint64_t v7;
  uint64_t v8;

  v8 = *MEMORY[0x24BDAC8D0];
  COCoreLogForCategory(2);
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    v3 = *(_QWORD *)(a1 + 32);
    v6 = 134217984;
    v7 = v3;
    _os_log_impl(&dword_215E92000, v2, OS_LOG_TYPE_DEFAULT, "%p finished updating local alarms", (uint8_t *)&v6, 0xCu);
  }

  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    v5 = *(_QWORD *)(a1 + 40);
    if (!v5)
      v5 = *(_QWORD *)(a1 + 48);
    objc_msgSend(v4, "alarmAddOn:didUpdateAlarms:", *(_QWORD *)(a1 + 32), v5);
  }

}

- (void)handleAlarmFiredNotification:(id)a3
{
  void *v4;
  void *v5;
  id v6;

  v6 = a3;
  if (!-[COMeshAlarmAddOn performsLocalActions](self, "performsLocalActions"))
  {
    -[COMeshAlarmAddOn delegate](self, "delegate");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_opt_respondsToSelector() & 1) != 0)
    {
      objc_msgSend(v6, "alarms");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "alarmAddOn:didUpdateAlarms:", self, v5);

    }
  }

}

- (void)handleAlarmFiringAlarmDismissedNotification:(id)a3
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
  objc_msgSend(v4, "alarms");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v6, "count"))
  {
    v7 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
    objc_msgSend(MEMORY[0x24BE6B628], "schedulerWithDispatchQueue:", v5);
    v8 = objc_claimAutoreleasedReturnValue();
    -[COMeshAlarmAddOn alarmManager](self, "alarmManager");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = MEMORY[0x24BDAC760];
    v17[0] = MEMORY[0x24BDAC760];
    v17[1] = 3221225472;
    v17[2] = __64__COMeshAlarmAddOn_handleAlarmFiringAlarmDismissedNotification___block_invoke;
    v17[3] = &unk_24D4B3C90;
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
    v15[2] = __64__COMeshAlarmAddOn_handleAlarmFiringAlarmDismissedNotification___block_invoke_202;
    v15[3] = &unk_24D4B2450;
    v15[4] = self;
    v16 = v6;
    v14 = (id)objc_msgSend(v13, "addSuccessBlock:", v15);

  }
  else
  {
    COCoreLogForCategory(2);
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
      -[COMeshAlarmAddOn handleAlarmFiringAlarmDismissedNotification:].cold.1();
  }

}

void __64__COMeshAlarmAddOn_handleAlarmFiringAlarmDismissedNotification___block_invoke(_QWORD *a1, void *a2)
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
  objc_msgSend(a2, "alarmID");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  COCoreLogForCategory(2);
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v5 = a1[4];
    v10 = 134218242;
    v11 = v5;
    v12 = 2112;
    v13 = v3;
    _os_log_impl(&dword_215E92000, v4, OS_LOG_TYPE_DEFAULT, "%p dismissing local alarm %@", (uint8_t *)&v10, 0x16u);
  }

  v7 = (void *)a1[5];
  v6 = (void *)a1[6];
  objc_msgSend(v3, "UUIDString");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "dismissAlarmWithIdentifier:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "addObject:", v9);

}

void __64__COMeshAlarmAddOn_handleAlarmFiringAlarmDismissedNotification___block_invoke_202(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  void *v4;
  int v5;
  uint64_t v6;
  uint64_t v7;

  v7 = *MEMORY[0x24BDAC8D0];
  COCoreLogForCategory(2);
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    v3 = *(_QWORD *)(a1 + 32);
    v5 = 134217984;
    v6 = v3;
    _os_log_impl(&dword_215E92000, v2, OS_LOG_TYPE_DEFAULT, "%p finished dismissing local alarms", (uint8_t *)&v5, 0xCu);
  }

  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v4, "alarmAddOn:didDismissAlarms:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));

}

- (void)handleAlarmSnoozeNotification:(id)a3
{
  id v4;
  void *v5;
  NSObject *v6;
  void *v7;
  NSObject *v8;
  void *v9;
  void *v10;
  id v11;
  COAlarmReadRequest *v12;
  _QWORD v13[4];
  id v14;
  COMeshAlarmAddOn *v15;
  id v16;
  _QWORD v17[4];
  id v18;
  uint8_t buf[4];
  void *v20;
  __int16 v21;
  void *v22;
  uint64_t v23;

  v23 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  -[COMeshAddOn meshController](self, "meshController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[COMeshAddOn meshControllerQueue](self, "meshControllerQueue");
  v6 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v6);
  objc_msgSend(v4, "identifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[COMeshAlarmAddOn performsLocalActions](self, "performsLocalActions"))
  {
    COCoreLogForCategory(2);
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134218242;
      v20 = v5;
      v21 = 2112;
      v22 = v7;
      _os_log_impl(&dword_215E92000, v8, OS_LOG_TYPE_DEFAULT, "%p locally snoozing alarm %@...", buf, 0x16u);
    }

    -[COMeshAlarmAddOn alarmManager](self, "alarmManager");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "snoozeAlarmWithIdentifier:", v7);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v17[0] = MEMORY[0x24BDAC760];
    v17[1] = 3221225472;
    v17[2] = __50__COMeshAlarmAddOn_handleAlarmSnoozeNotification___block_invoke;
    v17[3] = &unk_24D4B3D48;
    v18 = v7;
    v11 = (id)objc_msgSend(v10, "addCompletionBlock:", v17);

  }
  else
  {
    objc_initWeak((id *)buf, self);
    v12 = objc_alloc_init(COAlarmReadRequest);
    v13[0] = MEMORY[0x24BDAC760];
    v13[1] = 3221225472;
    v13[2] = __50__COMeshAlarmAddOn_handleAlarmSnoozeNotification___block_invoke_203;
    v13[3] = &unk_24D4B3D98;
    objc_copyWeak(&v16, (id *)buf);
    v14 = v7;
    v15 = self;
    objc_msgSend(v5, "sendRequest:withCompletionHandler:", v12, v13);

    objc_destroyWeak(&v16);
    objc_destroyWeak((id *)buf);
  }

}

void __50__COMeshAlarmAddOn_handleAlarmSnoozeNotification___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v4;
  NSObject *v5;
  NSObject *v6;
  uint64_t v7;
  int v8;
  uint64_t v9;
  uint64_t v10;

  v10 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  COCoreLogForCategory(2);
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v4)
  {
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      __50__COMeshAlarmAddOn_handleAlarmSnoozeNotification___block_invoke_cold_1();
  }
  else if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v7 = *(_QWORD *)(a1 + 32);
    v8 = 138412290;
    v9 = v7;
    _os_log_impl(&dword_215E92000, v6, OS_LOG_TYPE_DEFAULT, "... local snooze of alarm (%@) complete", (uint8_t *)&v8, 0xCu);
  }

}

void __50__COMeshAlarmAddOn_handleAlarmSnoozeNotification___block_invoke_203(uint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  id WeakRetained;
  void *v6;
  id v7;
  uint64_t v8;
  id v9;
  _QWORD v10[4];
  id v11;
  uint64_t v12;

  v9 = a4;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  if (WeakRetained)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_msgSend(v9, "alarms");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v10[0] = MEMORY[0x24BDAC760];
      v10[1] = 3221225472;
      v10[2] = __50__COMeshAlarmAddOn_handleAlarmSnoozeNotification___block_invoke_2;
      v10[3] = &unk_24D4B3D70;
      v7 = *(id *)(a1 + 32);
      v8 = *(_QWORD *)(a1 + 40);
      v11 = v7;
      v12 = v8;
      objc_msgSend(v6, "enumerateObjectsUsingBlock:", v10);

    }
  }

}

void __50__COMeshAlarmAddOn_handleAlarmSnoozeNotification___block_invoke_2(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  _QWORD v12[2];

  v12[1] = *MEMORY[0x24BDAC8D0];
  v6 = a2;
  v7 = *(void **)(a1 + 32);
  objc_msgSend(v6, "alarmIDString");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v7) = objc_msgSend(v7, "isEqualToString:", v8);

  if ((_DWORD)v7)
  {
    *a4 = 1;
    objc_msgSend(*(id *)(a1 + 40), "delegate");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_opt_respondsToSelector() & 1) != 0)
    {
      v10 = *(_QWORD *)(a1 + 40);
      v12[0] = v6;
      objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v12, 1);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "alarmAddOn:didUpdateAlarms:", v10, v11);

    }
  }

}

- (void)handleAlarmManagerStateResetNotification:(id)a3
{
  NSObject *v4;
  void *v5;

  COCoreLogForCategory(2);
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
    -[COMeshAlarmAddOn handleAlarmManagerStateResetNotification:].cold.1(self, v4);

  -[COMeshAlarmAddOn delegate](self, "delegate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v5, "didResetAlarmAddOn:", self);

}

- (void)alarmsAsAccessory:(id)a3 fromClient:(id)a4 withCallback:(id)a5
{
  id v8;
  id v9;
  id v10;
  NSObject *v11;
  _BOOL8 v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  char v18;
  char v19;
  int v20;
  uint64_t v21;
  void *v22;
  NSObject *v23;
  void *v24;
  uint64_t v25;
  uint64_t v26;
  void *v27;
  uint64_t v28;
  id v29;
  id v30;
  id v31;
  id v32;
  _QWORD v33[4];
  id v34;
  uint64_t *v35;
  _QWORD v36[4];
  id v37;
  uint64_t *v38;
  uint64_t v39;
  uint64_t *v40;
  uint64_t v41;
  uint64_t (*v42)(uint64_t, uint64_t);
  void (*v43)(uint64_t);
  id v44;
  uint8_t buf[4];
  void *v46;
  uint64_t v47;

  v47 = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  COCoreLogForCategory(2);
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
    -[COMeshAlarmAddOn alarmsAsAccessory:fromClient:withCallback:].cold.1(self, (uint64_t)v8, v11);

  v39 = 0;
  v40 = &v39;
  v41 = 0x3032000000;
  v42 = __Block_byref_object_copy__24;
  v43 = __Block_byref_object_dispose__24;
  v44 = 0;
  if (v8)
  {
    v12 = 0;
  }
  else
  {
    v12 = -[COMeshAlarmAddOn performsLocalActions](self, "performsLocalActions");
    objc_msgSend(v9, "connection");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[COMeshAlarmAddOn _currentAccessoryForConnection:](self, "_currentAccessoryForConnection:", v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    if (v14)
      v8 = (id)objc_msgSend(objc_alloc(MEMORY[0x24BE19E38]), "initWithHomeKitAccessory:", v14);
    else
      v8 = 0;

  }
  objc_msgSend(v8, "categoryType");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8)
  {
    -[COMeshAlarmAddOn secondaryClusterMemberIfRequiredForAccessory:](self, "secondaryClusterMemberIfRequiredForAccessory:", v8);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v16 = 0;
  }
  -[COMeshAlarmAddOn homekit](self, "homekit");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = objc_msgSend(v17, "hasOptedToHH2");
  if (v15)
    v19 = v18;
  else
    v19 = 1;
  if ((v19 & 1) != 0)
  {

LABEL_21:
    v26 = os_transaction_create();
    v23 = v40[5];
    v40[5] = v26;
    v25 = 1;
    goto LABEL_22;
  }
  v20 = objc_msgSend((id)*MEMORY[0x24BDD49E0], "isEqualToString:", v15);

  if (!v20)
    goto LABEL_21;
  v21 = os_transaction_create();
  v22 = (void *)v40[5];
  v40[5] = v21;

  COCoreLogForCategory(2);
  v23 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
  {
    -[COMeshAddOn meshController](self, "meshController");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 134217984;
    v46 = v24;
    _os_log_impl(&dword_215E92000, v23, OS_LOG_TYPE_DEFAULT, "%p locally reading alarms", buf, 0xCu);

  }
  v25 = 0;
LABEL_22:

  -[COMeshAlarmAddOn _alarmsForAccessory:allowLocalStorage:usingLeader:member:client:](self, "_alarmsForAccessory:allowLocalStorage:usingLeader:member:client:", v8, v12, v25, v16, v9);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  v28 = MEMORY[0x24BDAC760];
  v36[0] = MEMORY[0x24BDAC760];
  v36[1] = 3221225472;
  v36[2] = __62__COMeshAlarmAddOn_alarmsAsAccessory_fromClient_withCallback___block_invoke;
  v36[3] = &unk_24D4B1E80;
  v29 = v10;
  v37 = v29;
  v38 = &v39;
  v30 = (id)objc_msgSend(v27, "addFailureBlock:", v36);
  v33[0] = v28;
  v33[1] = 3221225472;
  v33[2] = __62__COMeshAlarmAddOn_alarmsAsAccessory_fromClient_withCallback___block_invoke_2;
  v33[3] = &unk_24D4B24A0;
  v31 = v29;
  v34 = v31;
  v35 = &v39;
  v32 = (id)objc_msgSend(v27, "addSuccessBlock:", v33);

  _Block_object_dispose(&v39, 8);
}

void __62__COMeshAlarmAddOn_alarmsAsAccessory_fromClient_withCallback___block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;

  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  v2 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v3 = *(void **)(v2 + 40);
  *(_QWORD *)(v2 + 40) = 0;

}

void __62__COMeshAlarmAddOn_alarmsAsAccessory_fromClient_withCallback___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  void *v6;

  v3 = a2;
  COCoreLogForCategory(2);
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
    __62__COMeshTimerAddOn_timersAsAccessory_fromClient_withCallback___block_invoke_2_cold_1();

  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  v5 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v6 = *(void **)(v5 + 40);
  *(_QWORD *)(v5 + 40) = 0;

}

- (void)alarmsForAccessories:(id)a3 fromClient:(id)a4 callback:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  NSObject *v12;
  void *v13;
  char v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  id v19;
  uint64_t (*__ptr32 *v20)();
  NSObject *v21;
  _QWORD v22[5];
  id v23;
  id v24;
  id v25;
  _QWORD *v26;
  _QWORD *v27;
  _QWORD *v28;
  _QWORD *v29;
  _QWORD v30[5];
  id v31;
  _QWORD v32[4];
  id v33;
  COMeshAlarmAddOn *v34;
  id v35;
  _QWORD *v36;
  _QWORD *v37;
  _QWORD v38[6];
  _QWORD v39[5];
  id v40;
  _QWORD v41[5];
  id v42;
  _QWORD v43[5];
  id v44;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  -[COMeshAddOn meshController](self, "meshController");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  COCoreLogForCategory(2);
  v12 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
    -[COMeshAlarmAddOn alarmsForAccessories:fromClient:callback:].cold.1((uint64_t)v11, v8, v12);

  if (objc_msgSend(v8, "count"))
  {
    v43[0] = 0;
    v43[1] = v43;
    v43[2] = 0x3032000000;
    v43[3] = __Block_byref_object_copy__24;
    v43[4] = __Block_byref_object_dispose__24;
    v44 = (id)MEMORY[0x24BDBD1A8];
    v41[0] = 0;
    v41[1] = v41;
    v41[2] = 0x3032000000;
    v41[3] = __Block_byref_object_copy__24;
    v41[4] = __Block_byref_object_dispose__24;
    v42 = (id)MEMORY[0x24BDBD1A8];
    v39[0] = 0;
    v39[1] = v39;
    v39[2] = 0x3032000000;
    v39[3] = __Block_byref_object_copy__24;
    v39[4] = __Block_byref_object_dispose__24;
    v40 = (id)MEMORY[0x24BDBD1A8];
    -[COMeshAlarmAddOn homekit](self, "homekit");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = objc_msgSend(v13, "hasOptedToHH2");

    v15 = MEMORY[0x24BDAC760];
    if ((v14 & 1) != 0)
    {
      -[COMeshAddOn meshController](self, "meshController");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "nodeManager");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "activeNodesWithSelfNode:", 1);
      v18 = (void *)objc_claimAutoreleasedReturnValue();

      v32[0] = MEMORY[0x24BDAC760];
      v32[1] = 3221225472;
      v32[2] = __61__COMeshAlarmAddOn_alarmsForAccessories_fromClient_callback___block_invoke_2;
      v32[3] = &unk_24D4B3DE8;
      v19 = v18;
      v33 = v19;
      v34 = self;
      v36 = v41;
      v37 = v39;
      v35 = v11;
      objc_msgSend(v8, "enumerateObjectsUsingBlock:", v32);

      v15 = MEMORY[0x24BDAC760];
      v20 = &off_215F52000;
    }
    else
    {
      v38[0] = MEMORY[0x24BDAC760];
      v38[1] = 3221225472;
      v38[2] = __61__COMeshAlarmAddOn_alarmsForAccessories_fromClient_callback___block_invoke;
      v38[3] = &unk_24D4B3DC0;
      v38[4] = v43;
      v38[5] = v41;
      objc_msgSend(v8, "enumerateObjectsUsingBlock:", v38);
      v20 = &off_215F52000;
    }
    v30[0] = 0;
    v30[1] = v30;
    v30[2] = 0x3032000000;
    v30[3] = __Block_byref_object_copy__24;
    v30[4] = __Block_byref_object_dispose__24;
    v31 = (id)os_transaction_create();
    -[COMeshAddOn meshControllerQueue](self, "meshControllerQueue");
    v21 = objc_claimAutoreleasedReturnValue();
    v22[0] = v15;
    v22[1] = *((_QWORD *)v20 + 448);
    v22[2] = __61__COMeshAlarmAddOn_alarmsForAccessories_fromClient_callback___block_invoke_208;
    v22[3] = &unk_24D4B3F00;
    v26 = v43;
    v22[4] = self;
    v27 = v41;
    v23 = v11;
    v24 = v9;
    v28 = v39;
    v25 = v10;
    v29 = v30;
    dispatch_async(v21, v22);

    _Block_object_dispose(v30, 8);
    _Block_object_dispose(v39, 8);

    _Block_object_dispose(v41, 8);
    _Block_object_dispose(v43, 8);

  }
  else
  {
    (*((void (**)(id, _QWORD, _QWORD))v10 + 2))(v10, MEMORY[0x24BDBD1B8], 0);
  }

}

void __61__COMeshAlarmAddOn_alarmsForAccessories_fromClient_callback___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  id v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;

  v3 = (void *)*MEMORY[0x24BDD49E0];
  v4 = a2;
  objc_msgSend(v4, "categoryType");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v3) = objc_msgSend(v3, "isEqualToString:", v5);

  if ((_DWORD)v3)
  {
    objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), "arrayByAddingObject:", v4);
    v6 = objc_claimAutoreleasedReturnValue();

    v7 = *(_QWORD *)(a1 + 32);
  }
  else
  {
    objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), "arrayByAddingObject:", v4);
    v6 = objc_claimAutoreleasedReturnValue();

    v7 = *(_QWORD *)(a1 + 40);
  }
  v8 = *(_QWORD *)(v7 + 8);
  v9 = *(void **)(v8 + 40);
  *(_QWORD *)(v8 + 40) = v6;

}

void __61__COMeshAlarmAddOn_alarmsForAccessories_fromClient_callback___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  NSObject *v12;
  uint64_t v13;
  int v14;
  uint64_t v15;
  __int16 v16;
  id v17;
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
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
    objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40), "arrayByAddingObject:", v3);
    v7 = objc_claimAutoreleasedReturnValue();
    v8 = *(_QWORD *)(a1 + 56);
LABEL_4:
    v9 = *(_QWORD *)(v8 + 8);
    v10 = *(void **)(v9 + 40);
    *(_QWORD *)(v9 + 40) = v7;

    goto LABEL_5;
  }
  objc_msgSend(*(id *)(a1 + 40), "secondaryClusterMemberForAccessory:", v3);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (v11)
  {
    objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40), "arrayByAddingObject:", v3);
    v7 = objc_claimAutoreleasedReturnValue();
    v8 = *(_QWORD *)(a1 + 64);
    goto LABEL_4;
  }
  COCoreLogForCategory(2);
  v12 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    v13 = *(_QWORD *)(a1 + 48);
    v14 = 134218242;
    v15 = v13;
    v16 = 2112;
    v17 = v3;
    _os_log_impl(&dword_215E92000, v12, OS_LOG_TYPE_DEFAULT, "%p not getting alarms for %@, accessory unavailable", (uint8_t *)&v14, 0x16u);
  }

LABEL_5:
}

void __61__COMeshAlarmAddOn_alarmsForAccessories_fromClient_callback___block_invoke_208(uint64_t a1)
{
  id v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  void *v6;
  id v7;
  id v8;
  unint64_t v9;
  id v10;
  void *v11;
  COAlarmReadRequest *v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  uint64_t v17;
  id v18;
  COAlarmReadRequest *v19;
  id v20;
  void *v21;
  uint64_t v22;
  id v23;
  void *v24;
  uint64_t v25;
  id v26;
  id v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  id v32;
  id v33;
  id v34;
  id v35;
  uint64_t v36;
  id v37;
  _QWORD v38[4];
  id v39;
  uint64_t v40;
  _QWORD v41[4];
  id v42;
  id v43;
  uint64_t v44;
  _QWORD v45[4];
  id v46;
  uint64_t v47;
  id v48;
  id v49;
  _QWORD v50[4];
  id v51;
  COAlarmReadRequest *v52;
  id v53;
  uint64_t v54;
  id v55;
  id v56;
  uint64_t v57;
  _QWORD v58[5];
  id v59;
  id v60;
  uint64_t v61;
  _QWORD v62[4];
  id v63;
  id v64;

  v2 = objc_alloc_init(MEMORY[0x24BDBCED8]);
  v3 = objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40), "count");
  v4 = MEMORY[0x24BDAC760];
  if (v3)
  {
    objc_msgSend(*(id *)(a1 + 32), "homekit");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40);
    v62[0] = v4;
    v62[1] = 3221225472;
    v62[2] = __61__COMeshAlarmAddOn_alarmsForAccessories_fromClient_callback___block_invoke_2_209;
    v62[3] = &unk_24D4B3E10;
    v63 = v5;
    v64 = v2;
    v7 = v5;
    objc_msgSend(v6, "enumerateObjectsUsingBlock:", v62);

  }
  v8 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
  v9 = 0x24BE6B000uLL;
  if (objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 40), "count"))
  {
    v10 = objc_alloc_init(MEMORY[0x24BE6B608]);
    objc_msgSend(v8, "addObject:", v10);
    if (objc_msgSend(*(id *)(a1 + 32), "performsLocalActions")
      && (objc_msgSend(*(id *)(a1 + 40), "leader"),
          v11 = (void *)objc_claimAutoreleasedReturnValue(),
          v11,
          !v11))
    {
      objc_msgSend(*(id *)(a1 + 32), "alarmManager");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "alarms");
      v20 = (id)objc_claimAutoreleasedReturnValue();

      v58[0] = v4;
      v58[1] = 3221225472;
      v58[2] = __61__COMeshAlarmAddOn_alarmsForAccessories_fromClient_callback___block_invoke_3;
      v58[3] = &unk_24D4B3E60;
      v22 = *(_QWORD *)(a1 + 32);
      v61 = *(_QWORD *)(a1 + 72);
      v58[4] = v22;
      v59 = v2;
      v60 = v10;
      v19 = (COAlarmReadRequest *)v10;
      v23 = (id)objc_msgSend(v20, "addCompletionBlock:", v58);

    }
    else
    {
      v12 = objc_alloc_init(COAlarmReadRequest);
      objc_msgSend(*(id *)(a1 + 48), "clientLifetimeActivity");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      +[CONetworkActivityFactory activityWithLabel:parentActivity:](CONetworkActivityFactory, "activityWithLabel:parentActivity:", 3, v13);
      v14 = (void *)objc_claimAutoreleasedReturnValue();

      if (v14)
      {
        -[COMeshRequest setActivity:](v12, "setActivity:", v14);
        nw_activity_activate();
      }
      v50[0] = v4;
      v50[1] = 3221225472;
      v50[2] = __61__COMeshAlarmAddOn_alarmsForAccessories_fromClient_callback___block_invoke_6;
      v50[3] = &unk_24D4B3E88;
      v51 = v14;
      v52 = v12;
      v15 = *(void **)(a1 + 40);
      v16 = *(id *)(a1 + 48);
      v57 = *(_QWORD *)(a1 + 72);
      v17 = *(_QWORD *)(a1 + 32);
      v53 = v16;
      v54 = v17;
      v55 = v2;
      v56 = v10;
      v18 = v10;
      v19 = v12;
      v20 = v14;
      objc_msgSend(v15, "sendRequest:withCompletionHandler:", v19, v50);

      v9 = 0x24BE6B000;
    }

  }
  v24 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 80) + 8) + 40);
  v45[0] = v4;
  v45[1] = 3221225472;
  v45[2] = __61__COMeshAlarmAddOn_alarmsForAccessories_fromClient_callback___block_invoke_9;
  v45[3] = &unk_24D4B3ED8;
  v25 = *(_QWORD *)(a1 + 32);
  v46 = v8;
  v47 = v25;
  v48 = *(id *)(a1 + 48);
  v26 = v2;
  v49 = v26;
  v27 = v8;
  objc_msgSend(v24, "enumerateObjectsUsingBlock:", v45);
  v28 = (void *)MEMORY[0x24BE6B628];
  objc_msgSend(*(id *)(a1 + 40), "dispatchQueue");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "schedulerWithDispatchQueue:", v29);
  v30 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(*(id *)(v9 + 1544), "combineAllFutures:ignoringErrors:scheduler:", v27, 1, v30);
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  v41[0] = v4;
  v41[1] = 3221225472;
  v41[2] = __61__COMeshAlarmAddOn_alarmsForAccessories_fromClient_callback___block_invoke_11;
  v41[3] = &unk_24D4B2518;
  v32 = *(id *)(a1 + 56);
  v42 = v26;
  v43 = v32;
  v44 = *(_QWORD *)(a1 + 88);
  v33 = v26;
  v34 = (id)objc_msgSend(v31, "addSuccessBlock:", v41);
  v38[0] = v4;
  v38[1] = 3221225472;
  v38[2] = __61__COMeshAlarmAddOn_alarmsForAccessories_fromClient_callback___block_invoke_12;
  v38[3] = &unk_24D4B1E80;
  v35 = *(id *)(a1 + 56);
  v36 = *(_QWORD *)(a1 + 88);
  v39 = v35;
  v40 = v36;
  v37 = (id)objc_msgSend(v31, "addFailureBlock:", v38);

}

void __61__COMeshAlarmAddOn_alarmsForAccessories_fromClient_callback___block_invoke_2_209(uint64_t a1, void *a2)
{
  void *v3;
  uint64_t v4;
  void *v5;
  BOOL v6;
  void *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  id v11;

  objc_msgSend(a2, "uniqueIdentifier");
  v11 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "accessoryWithUniqueIdentifier:");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "homeForAccessory:", v3);
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = (void *)v4;
  if (v3)
    v6 = v4 == 0;
  else
    v6 = 1;
  if (!v6)
  {
    v7 = *(void **)(a1 + 40);
    objc_msgSend(*(id *)(a1 + 32), "alarmsForAccessory:inHome:", v3, v4);
    v8 = objc_claimAutoreleasedReturnValue();
    v9 = (void *)v8;
    if (v8)
      v10 = v8;
    else
      v10 = MEMORY[0x24BDBD1A8];
    objc_msgSend(v7, "setObject:forKey:", v10, v11);

  }
}

void __61__COMeshAlarmAddOn_alarmsForAccessories_fromClient_callback___block_invoke_3(uint64_t a1, void *a2, uint64_t a3)
{
  id v5;
  void *v6;
  id v7;
  uint64_t v8;
  void *v9;
  id v10;
  id v11;
  _QWORD v12[4];
  id v13;
  uint64_t v14;
  id v15;

  v5 = a2;
  v10 = v5;
  if (a3)
  {
    objc_msgSend(*(id *)(a1 + 48), "finishWithError:", a3, v5);
  }
  else
  {
    v6 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40);
    v12[0] = MEMORY[0x24BDAC760];
    v12[1] = 3221225472;
    v12[2] = __61__COMeshAlarmAddOn_alarmsForAccessories_fromClient_callback___block_invoke_4;
    v12[3] = &unk_24D4B20C0;
    v7 = v5;
    v8 = *(_QWORD *)(a1 + 32);
    v9 = *(void **)(a1 + 40);
    v13 = v7;
    v14 = v8;
    v15 = v9;
    objc_msgSend(v6, "enumerateObjectsUsingBlock:", v12, v10);
    objc_msgSend(*(id *)(a1 + 48), "finishWithNoResult");

  }
}

void __61__COMeshAlarmAddOn_alarmsForAccessories_fromClient_callback___block_invoke_4(uint64_t a1, void *a2)
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
  v7[2] = __61__COMeshAlarmAddOn_alarmsForAccessories_fromClient_callback___block_invoke_5;
  v7[3] = &unk_24D4B3E38;
  v4 = *(void **)(a1 + 32);
  v7[4] = *(_QWORD *)(a1 + 40);
  v8 = v3;
  v6 = v3;
  objc_msgSend(v4, "na_filter:", v7);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 48), "setObject:forKey:", v5, v6);

}

uint64_t __61__COMeshAlarmAddOn_alarmsForAccessories_fromClient_callback___block_invoke_5(uint64_t a1, void *a2)
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
  v6 = objc_msgSend(v2, "_isAlarm:targetingAccessoryIdentifiers:", v4, v5, v8, v9);

  return v6;
}

void __61__COMeshAlarmAddOn_alarmsForAccessories_fromClient_callback___block_invoke_6(uint64_t a1, void *a2, void *a3, void *a4, void *a5)
{
  void *v5;
  id v10;
  id v11;
  id v12;
  xpc_object_t v13;
  objc_class *v14;
  id v15;
  void *v16;
  void *v17;
  void *v18;
  id v19;
  uint64_t v20;
  void *v21;
  id v22;
  _QWORD v23[4];
  id v24;
  uint64_t v25;
  id v26;

  v22 = a2;
  v10 = a3;
  v11 = a4;
  v12 = a5;
  if (!v12)
  {
    objc_msgSend(v11, "error", v22);
    v12 = (id)objc_claimAutoreleasedReturnValue();
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

      objc_msgSend(*(id *)(a1 + 48), "clientBundleIdentifier");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = v16;
      if (!v16)
      {
        objc_msgSend(MEMORY[0x24BDD1488], "mainBundle");
        v5 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "bundleIdentifier");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
      }
      xpc_dictionary_set_string(v13, "client", (const char *)objc_msgSend(objc_retainAutorelease(v17), "UTF8String"));
      if (!v16)
      {

      }
      nw_activity_submit_metrics();
    }
    nw_activity_complete_with_reason();

  }
  if (v12)
  {
    objc_msgSend(*(id *)(a1 + 72), "finishWithError:", v12);
  }
  else
  {
    v18 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 80) + 8) + 40);
    v23[0] = MEMORY[0x24BDAC760];
    v23[1] = 3221225472;
    v23[2] = __61__COMeshAlarmAddOn_alarmsForAccessories_fromClient_callback___block_invoke_7;
    v23[3] = &unk_24D4B20C0;
    v19 = v11;
    v20 = *(_QWORD *)(a1 + 56);
    v21 = *(void **)(a1 + 64);
    v24 = v19;
    v25 = v20;
    v26 = v21;
    objc_msgSend(v18, "enumerateObjectsUsingBlock:", v23);
    objc_msgSend(*(id *)(a1 + 72), "finishWithNoResult");

  }
}

void __61__COMeshAlarmAddOn_alarmsForAccessories_fromClient_callback___block_invoke_7(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  void *v5;
  id v6;
  _QWORD v7[5];
  id v8;

  objc_msgSend(a2, "uniqueIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "alarms");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __61__COMeshAlarmAddOn_alarmsForAccessories_fromClient_callback___block_invoke_8;
  v7[3] = &unk_24D4B3E38;
  v7[4] = *(_QWORD *)(a1 + 40);
  v8 = v3;
  v6 = v3;
  objc_msgSend(v4, "na_filter:", v7);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(*(id *)(a1 + 48), "setObject:forKey:", v5, v6);
}

uint64_t __61__COMeshAlarmAddOn_alarmsForAccessories_fromClient_callback___block_invoke_8(uint64_t a1, void *a2)
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
  v6 = objc_msgSend(v2, "_isAlarm:targetingAccessoryIdentifiers:", v4, v5, v8, v9);

  return v6;
}

void __61__COMeshAlarmAddOn_alarmsForAccessories_fromClient_callback___block_invoke_9(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  id v9;
  id v10;
  _QWORD v11[4];
  id v12;
  id v13;
  id v14;

  v3 = a2;
  v4 = objc_alloc_init(MEMORY[0x24BE6B608]);
  objc_msgSend(*(id *)(a1 + 32), "addObject:", v4);
  v5 = *(void **)(a1 + 40);
  objc_msgSend(v5, "secondaryClusterMemberForAccessory:", v3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "_alarmsForAccessory:allowLocalStorage:usingLeader:member:client:", v3, 0, 0, v6, *(_QWORD *)(a1 + 48));
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v11[0] = MEMORY[0x24BDAC760];
  v11[1] = 3221225472;
  v11[2] = __61__COMeshAlarmAddOn_alarmsForAccessories_fromClient_callback___block_invoke_10;
  v11[3] = &unk_24D4B3EB0;
  v12 = *(id *)(a1 + 56);
  v13 = v3;
  v14 = v4;
  v8 = v4;
  v9 = v3;
  v10 = (id)objc_msgSend(v7, "addCompletionBlock:", v11);

}

void __61__COMeshAlarmAddOn_alarmsForAccessories_fromClient_callback___block_invoke_10(uint64_t a1, void *a2, uint64_t a3)
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  id v9;

  v5 = a2;
  v9 = v5;
  if (a3)
  {
    objc_msgSend(*(id *)(a1 + 48), "finishWithError:", a3);
  }
  else
  {
    if (v5)
      v6 = v5;
    else
      v6 = (id)MEMORY[0x24BDBD1A8];
    v7 = *(void **)(a1 + 32);
    objc_msgSend(*(id *)(a1 + 40), "uniqueIdentifier");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setObject:forKey:", v6, v8);

    objc_msgSend(*(id *)(a1 + 48), "finishWithNoResult");
  }

}

void __61__COMeshAlarmAddOn_alarmsForAccessories_fromClient_callback___block_invoke_11(uint64_t a1)
{
  uint64_t v2;
  void *v3;

  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  v2 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v3 = *(void **)(v2 + 40);
  *(_QWORD *)(v2 + 40) = 0;

}

void __61__COMeshAlarmAddOn_alarmsForAccessories_fromClient_callback___block_invoke_12(uint64_t a1)
{
  uint64_t v2;
  void *v3;

  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  v2 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v3 = *(void **)(v2 + 40);
  *(_QWORD *)(v2 + 40) = 0;

}

- (void)addAlarm:(id)a3 asAccessory:(id)a4 fromClient:(id)a5 withCallback:(id)a6
{
  id v10;
  id v11;
  id v12;
  void *v13;
  NSObject *v14;
  void *v15;
  void *v16;
  char v17;
  char v18;
  NSObject *v19;
  id v20;
  void *v21;
  NSObject *v22;
  COAlarmCreateRequest *v23;
  void *v24;
  void *v25;
  COAlarmCreateRequest *v26;
  void *v27;
  id v28;
  _QWORD block[5];
  COAlarmCreateRequest *v30;
  id v31;
  _QWORD *v32;
  _QWORD v33[5];
  id v34;
  uint8_t buf[4];
  id v36;
  __int16 v37;
  void *v38;
  uint64_t v39;

  v39 = *MEMORY[0x24BDAC8D0];
  v10 = a3;
  v11 = a4;
  v28 = a5;
  v12 = a6;
  if (v11)
  {
    objc_msgSend(v11, "categoryType");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v13 = 0;
  }
  COCoreLogForCategory(2);
  v14 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
    -[COMeshAlarmAddOn addAlarm:asAccessory:fromClient:withCallback:].cold.1(self, v10, v14);

  objc_msgSend(v10, "siriContext");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "objectForKey:", *MEMORY[0x24BE19C48]);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  -[COMeshAlarmAddOn homekit](self, "homekit");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = objc_msgSend(v16, "hasOptedToHH2");
  if (v13)
    v18 = v17;
  else
    v18 = 1;
  if ((v18 & 1) != 0 || !objc_msgSend((id)*MEMORY[0x24BDD49E0], "isEqualToString:", v13))
  {
    if (v11)
    {
      -[COMeshAlarmAddOn secondaryClusterMemberIfRequiredForAccessory:](self, "secondaryClusterMemberIfRequiredForAccessory:", v11);
      v24 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v24 = 0;
    }
    -[COMeshAlarmAddOn addAlarm:member:client:](self, "addAlarm:member:client:", v10, v24, v28);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    -[COMeshAlarmAddOn _addCompletionsToFuture:withXPCCallback:transactionDescription:](self, "_addCompletionsToFuture:withXPCCallback:transactionDescription:", v25, v12, "com.apple.CoordinationCore.alarms.create");

    if (v11)
  }
  else
  {
    v26 = -[COAlarmRequest initWithAlarm:]([COAlarmCreateRequest alloc], "initWithAlarm:", v10);
    v33[0] = 0;
    v33[1] = v33;
    v33[2] = 0x3032000000;
    v33[3] = __Block_byref_object_copy__24;
    v33[4] = __Block_byref_object_dispose__24;
    v34 = (id)os_transaction_create();
    COCoreLogForCategory(2);
    v19 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
    {
      -[COMeshAddOn meshController](self, "meshController");
      v20 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "alarmID");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 134218242;
      v36 = v20;
      v37 = 2112;
      v38 = v21;
      _os_log_impl(&dword_215E92000, v19, OS_LOG_TYPE_DEFAULT, "%p locally adding %@", buf, 0x16u);

    }
    -[COMeshAddOn meshControllerQueue](self, "meshControllerQueue");
    v22 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __65__COMeshAlarmAddOn_addAlarm_asAccessory_fromClient_withCallback___block_invoke;
    block[3] = &unk_24D4B3F50;
    block[4] = self;
    v30 = v26;
    v31 = v12;
    v32 = v33;
    v23 = v26;
    dispatch_async(v22, block);

    _Block_object_dispose(v33, 8);
  }

}

void __65__COMeshAlarmAddOn_addAlarm_asAccessory_fromClient_withCallback___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  id v4;
  uint64_t v5;
  _QWORD v6[4];
  id v7;
  uint64_t v8;

  v2 = *(void **)(a1 + 32);
  v3 = *(_QWORD *)(a1 + 40);
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __65__COMeshAlarmAddOn_addAlarm_asAccessory_fromClient_withCallback___block_invoke_2;
  v6[3] = &unk_24D4B3F28;
  v4 = *(id *)(a1 + 48);
  v5 = *(_QWORD *)(a1 + 56);
  v7 = v4;
  v8 = v5;
  objc_msgSend(v2, "handleAlarmCreateRequest:callback:", v3, v6);

}

void __65__COMeshAlarmAddOn_addAlarm_asAccessory_fromClient_withCallback___block_invoke_2(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t v4;
  void *v5;
  uint64_t v6;
  void *v7;

  v4 = *(_QWORD *)(a1 + 32);
  if (a3)
  {
    (*(void (**)(_QWORD, uint64_t))(v4 + 16))(*(_QWORD *)(a1 + 32), a3);
  }
  else
  {
    objc_msgSend(a2, "error");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, void *))(v4 + 16))(v4, v5);

  }
  v6 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v7 = *(void **)(v6 + 40);
  *(_QWORD *)(v6 + 40) = 0;

}

- (void)updateAlarm:(id)a3 asAccessory:(id)a4 fromClient:(id)a5 withCallback:(id)a6
{
  id v10;
  id v11;
  void *v12;
  void *v13;
  NSObject *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  _BOOL4 v22;
  void *v23;
  char v24;
  char v25;
  COAlarmUpdateRequest *v26;
  NSObject *v27;
  id v28;
  void *v29;
  NSObject *v30;
  COAlarmUpdateRequest *v31;
  void *v32;
  void *v33;
  void *v34;
  id v35;
  id v36;
  _QWORD block[5];
  COAlarmUpdateRequest *v38;
  id v39;
  _QWORD *v40;
  _QWORD v41[5];
  id v42;
  uint8_t buf[4];
  id v44;
  __int16 v45;
  void *v46;
  uint64_t v47;

  v47 = *MEMORY[0x24BDAC8D0];
  v10 = a3;
  v11 = a4;
  v35 = a5;
  v36 = a6;
  if (v11)
  {
    objc_msgSend(v11, "uniqueIdentifier");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "categoryType");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v13 = 0;
    v12 = 0;
  }
  COCoreLogForCategory(2);
  v14 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
    -[COMeshAlarmAddOn updateAlarm:asAccessory:fromClient:withCallback:].cold.1(self, v10, v14);

  -[COMeshAlarmAddOn homekit](self, "homekit");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v13)
  {
    if (v12)
    {
      v13 = 0;
      goto LABEL_22;
    }
    objc_msgSend(v35, "connection");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "co_PeerInstance");
    v34 = (void *)objc_claimAutoreleasedReturnValue();

    if (v34
      && (-[COMeshAlarmAddOn homehub](self, "homehub"),
          v17 = (void *)objc_claimAutoreleasedReturnValue(),
          objc_msgSend(v17, "accessoryIdentifierForPeerInstance:usingHomeKitAdapter:", v34, v15),
          v12 = (void *)objc_claimAutoreleasedReturnValue(),
          v17,
          v12))
    {
      objc_msgSend(v15, "accessoryWithUniqueIdentifier:", v12);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v18)
      {
LABEL_12:
        v13 = 0;
LABEL_21:

        goto LABEL_22;
      }
    }
    else
    {
      objc_msgSend(v15, "currentAccessory");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = 0;
      if (!v18)
        goto LABEL_12;
    }
    objc_msgSend(v10, "siriContext");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "objectForKey:", *MEMORY[0x24BE19C48]);
    v20 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v20
      || (COAlarmSiriContextTargetReferenceForAccessory(),
          v21 = (void *)objc_claimAutoreleasedReturnValue(),
          v22 = objc_msgSend(v20, "compare:options:", v21, 1) == 0,
          v21,
          v22))
    {
      objc_msgSend(v18, "category");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "categoryType");
      v13 = (void *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      v13 = 0;
    }
    if (!v11)
      v11 = (id)objc_msgSend(objc_alloc(MEMORY[0x24BE19E38]), "initWithHomeKitAccessory:", v18);

    goto LABEL_21;
  }
LABEL_22:
  v24 = objc_msgSend(v15, "hasOptedToHH2");
  if (v13)
    v25 = v24;
  else
    v25 = 1;
  if ((v25 & 1) != 0 || !objc_msgSend((id)*MEMORY[0x24BDD49E0], "isEqualToString:", v13))
  {
    if (v11)
    {
      -[COMeshAlarmAddOn secondaryClusterMemberIfRequiredForAccessory:](self, "secondaryClusterMemberIfRequiredForAccessory:", v11);
      v32 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v32 = 0;
    }
    -[COMeshAlarmAddOn updateAlarm:member:client:](self, "updateAlarm:member:client:", v10, v32, v35);
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    -[COMeshAlarmAddOn _addCompletionsToFuture:withXPCCallback:transactionDescription:](self, "_addCompletionsToFuture:withXPCCallback:transactionDescription:", v33, v36, "com.apple.CoordinationCore.alarms.update");

    if (v11)
  }
  else
  {
    v26 = -[COAlarmRequest initWithAlarm:]([COAlarmUpdateRequest alloc], "initWithAlarm:", v10);
    v41[0] = 0;
    v41[1] = v41;
    v41[2] = 0x3032000000;
    v41[3] = __Block_byref_object_copy__24;
    v41[4] = __Block_byref_object_dispose__24;
    v42 = (id)os_transaction_create();
    COCoreLogForCategory(2);
    v27 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
    {
      -[COMeshAddOn meshController](self, "meshController");
      v28 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "alarmID");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 134218242;
      v44 = v28;
      v45 = 2112;
      v46 = v29;
      _os_log_impl(&dword_215E92000, v27, OS_LOG_TYPE_DEFAULT, "%p locally updating %@", buf, 0x16u);

    }
    -[COMeshAddOn meshControllerQueue](self, "meshControllerQueue");
    v30 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __68__COMeshAlarmAddOn_updateAlarm_asAccessory_fromClient_withCallback___block_invoke;
    block[3] = &unk_24D4B3F50;
    block[4] = self;
    v38 = v26;
    v39 = v36;
    v40 = v41;
    v31 = v26;
    dispatch_async(v30, block);

    _Block_object_dispose(v41, 8);
  }

}

void __68__COMeshAlarmAddOn_updateAlarm_asAccessory_fromClient_withCallback___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  id v4;
  uint64_t v5;
  _QWORD v6[4];
  id v7;
  uint64_t v8;

  v2 = *(void **)(a1 + 32);
  v3 = *(_QWORD *)(a1 + 40);
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __68__COMeshAlarmAddOn_updateAlarm_asAccessory_fromClient_withCallback___block_invoke_2;
  v6[3] = &unk_24D4B3F28;
  v4 = *(id *)(a1 + 48);
  v5 = *(_QWORD *)(a1 + 56);
  v7 = v4;
  v8 = v5;
  objc_msgSend(v2, "handleAlarmUpdateRequest:callback:", v3, v6);

}

void __68__COMeshAlarmAddOn_updateAlarm_asAccessory_fromClient_withCallback___block_invoke_2(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t v4;
  void *v5;
  uint64_t v6;
  void *v7;

  v4 = *(_QWORD *)(a1 + 32);
  if (a3)
  {
    (*(void (**)(_QWORD, uint64_t))(v4 + 16))(*(_QWORD *)(a1 + 32), a3);
  }
  else
  {
    objc_msgSend(a2, "error");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, void *))(v4 + 16))(v4, v5);

  }
  v6 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v7 = *(void **)(v6 + 40);
  *(_QWORD *)(v6 + 40) = 0;

}

- (void)removeAlarm:(id)a3 asAccessory:(id)a4 fromClient:(id)a5 withCallback:(id)a6
{
  id v10;
  id v11;
  void *v12;
  void *v13;
  NSObject *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  _BOOL4 v22;
  void *v23;
  char v24;
  char v25;
  COAlarmDeleteRequest *v26;
  NSObject *v27;
  id v28;
  void *v29;
  NSObject *v30;
  COAlarmDeleteRequest *v31;
  void *v32;
  void *v33;
  void *v34;
  id v35;
  id v36;
  _QWORD block[5];
  COAlarmDeleteRequest *v38;
  id v39;
  _QWORD *v40;
  _QWORD v41[5];
  id v42;
  uint8_t buf[4];
  id v44;
  __int16 v45;
  void *v46;
  uint64_t v47;

  v47 = *MEMORY[0x24BDAC8D0];
  v10 = a3;
  v11 = a4;
  v35 = a5;
  v36 = a6;
  if (v11)
  {
    objc_msgSend(v11, "uniqueIdentifier");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "categoryType");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v13 = 0;
    v12 = 0;
  }
  COCoreLogForCategory(2);
  v14 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
    -[COMeshAlarmAddOn removeAlarm:asAccessory:fromClient:withCallback:].cold.1(self, v10, v14);

  -[COMeshAlarmAddOn homekit](self, "homekit");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v13)
  {
    if (v12)
    {
      v13 = 0;
      goto LABEL_22;
    }
    objc_msgSend(v35, "connection");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "co_PeerInstance");
    v34 = (void *)objc_claimAutoreleasedReturnValue();

    if (v34
      && (-[COMeshAlarmAddOn homehub](self, "homehub"),
          v17 = (void *)objc_claimAutoreleasedReturnValue(),
          objc_msgSend(v17, "accessoryIdentifierForPeerInstance:usingHomeKitAdapter:", v34, v15),
          v12 = (void *)objc_claimAutoreleasedReturnValue(),
          v17,
          v12))
    {
      objc_msgSend(v15, "accessoryWithUniqueIdentifier:", v12);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v18)
      {
LABEL_12:
        v13 = 0;
LABEL_21:

        goto LABEL_22;
      }
    }
    else
    {
      objc_msgSend(v15, "currentAccessory");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = 0;
      if (!v18)
        goto LABEL_12;
    }
    objc_msgSend(v10, "siriContext");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "objectForKey:", *MEMORY[0x24BE19C48]);
    v20 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v20
      || (COAlarmSiriContextTargetReferenceForAccessory(),
          v21 = (void *)objc_claimAutoreleasedReturnValue(),
          v22 = objc_msgSend(v20, "compare:options:", v21, 1) == 0,
          v21,
          v22))
    {
      objc_msgSend(v18, "category");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "categoryType");
      v13 = (void *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      v13 = 0;
    }
    if (!v11)
      v11 = (id)objc_msgSend(objc_alloc(MEMORY[0x24BE19E38]), "initWithHomeKitAccessory:", v18);

    goto LABEL_21;
  }
LABEL_22:
  v24 = objc_msgSend(v15, "hasOptedToHH2");
  if (v13)
    v25 = v24;
  else
    v25 = 1;
  if ((v25 & 1) != 0 || !objc_msgSend((id)*MEMORY[0x24BDD49E0], "isEqualToString:", v13))
  {
    if (v11)
    {
      -[COMeshAlarmAddOn secondaryClusterMemberIfRequiredForAccessory:](self, "secondaryClusterMemberIfRequiredForAccessory:", v11);
      v32 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v32 = 0;
    }
    -[COMeshAlarmAddOn removeAlarm:member:client:](self, "removeAlarm:member:client:", v10, v32, v35);
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    -[COMeshAlarmAddOn _addCompletionsToFuture:withXPCCallback:transactionDescription:](self, "_addCompletionsToFuture:withXPCCallback:transactionDescription:", v33, v36, "com.apple.CoordinationCore.alarms.delete");

    if (v11)
  }
  else
  {
    v26 = -[COAlarmRequest initWithAlarm:]([COAlarmDeleteRequest alloc], "initWithAlarm:", v10);
    v41[0] = 0;
    v41[1] = v41;
    v41[2] = 0x3032000000;
    v41[3] = __Block_byref_object_copy__24;
    v41[4] = __Block_byref_object_dispose__24;
    v42 = (id)os_transaction_create();
    COCoreLogForCategory(2);
    v27 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
    {
      -[COMeshAddOn meshController](self, "meshController");
      v28 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "alarmID");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 134218242;
      v44 = v28;
      v45 = 2112;
      v46 = v29;
      _os_log_impl(&dword_215E92000, v27, OS_LOG_TYPE_DEFAULT, "%p locally removing %@", buf, 0x16u);

    }
    -[COMeshAddOn meshControllerQueue](self, "meshControllerQueue");
    v30 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __68__COMeshAlarmAddOn_removeAlarm_asAccessory_fromClient_withCallback___block_invoke;
    block[3] = &unk_24D4B3F50;
    block[4] = self;
    v38 = v26;
    v39 = v36;
    v40 = v41;
    v31 = v26;
    dispatch_async(v30, block);

    _Block_object_dispose(v41, 8);
  }

}

void __68__COMeshAlarmAddOn_removeAlarm_asAccessory_fromClient_withCallback___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  id v4;
  uint64_t v5;
  _QWORD v6[4];
  id v7;
  uint64_t v8;

  v2 = *(void **)(a1 + 32);
  v3 = *(_QWORD *)(a1 + 40);
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __68__COMeshAlarmAddOn_removeAlarm_asAccessory_fromClient_withCallback___block_invoke_2;
  v6[3] = &unk_24D4B3F28;
  v4 = *(id *)(a1 + 48);
  v5 = *(_QWORD *)(a1 + 56);
  v7 = v4;
  v8 = v5;
  objc_msgSend(v2, "handleAlarmDeleteRequest:callback:", v3, v6);

}

void __68__COMeshAlarmAddOn_removeAlarm_asAccessory_fromClient_withCallback___block_invoke_2(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t v4;
  void *v5;
  uint64_t v6;
  void *v7;

  v4 = *(_QWORD *)(a1 + 32);
  if (a3)
  {
    (*(void (**)(_QWORD, uint64_t))(v4 + 16))(*(_QWORD *)(a1 + 32), a3);
  }
  else
  {
    objc_msgSend(a2, "error");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, void *))(v4 + 16))(v4, v5);

  }
  v6 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v7 = *(void **)(v6 + 40);
  *(_QWORD *)(v6 + 40) = 0;

}

- (void)snoozeAlarmWithIdentifier:(id)a3 fromClient:(id)a4 withCallback:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  NSObject *v12;
  void *v13;
  uint64_t v14;
  id v15;
  id v16;
  id v17;
  id v18;
  void *v19;
  void *v20;
  id v21;
  id v22;
  id v23;
  id v24;
  id v25;
  id v26;
  _QWORD v27[4];
  id v28;
  id v29;
  id v30;
  id v31;
  id v32;
  _QWORD *v33;
  _QWORD v34[4];
  id v35;
  id v36;
  id v37;
  _QWORD *v38;
  _QWORD v39[5];
  id v40;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  -[COMeshAddOn meshController](self, "meshController");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  COCoreLogForCategory(2);
  v12 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
    -[COMeshAlarmAddOn snoozeAlarmWithIdentifier:fromClient:withCallback:].cold.1((uint64_t)v11);

  v39[0] = 0;
  v39[1] = v39;
  v39[2] = 0x3032000000;
  v39[3] = __Block_byref_object_copy__24;
  v39[4] = __Block_byref_object_dispose__24;
  v40 = (id)os_transaction_create();
  -[COMeshAlarmAddOn snoozeAlarmWithIdentifier:client:](self, "snoozeAlarmWithIdentifier:client:", v8, v9);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = MEMORY[0x24BDAC760];
  v34[0] = MEMORY[0x24BDAC760];
  v34[1] = 3221225472;
  v34[2] = __70__COMeshAlarmAddOn_snoozeAlarmWithIdentifier_fromClient_withCallback___block_invoke;
  v34[3] = &unk_24D4B3F78;
  v15 = v11;
  v35 = v15;
  v16 = v8;
  v36 = v16;
  v17 = v10;
  v37 = v17;
  v38 = v39;
  v18 = (id)objc_msgSend(v13, "addFailureBlock:", v34);
  -[COMeshAlarmAddOn alarmManager](self, "alarmManager");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  -[COMeshAlarmAddOn homekit](self, "homekit");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v27[0] = v14;
  v27[1] = 3221225472;
  v27[2] = __70__COMeshAlarmAddOn_snoozeAlarmWithIdentifier_fromClient_withCallback___block_invoke_218;
  v27[3] = &unk_24D4B4018;
  v21 = v15;
  v28 = v21;
  v22 = v16;
  v29 = v22;
  v23 = v17;
  v32 = v23;
  v24 = v20;
  v30 = v24;
  v25 = v19;
  v31 = v25;
  v33 = v39;
  v26 = (id)objc_msgSend(v13, "addSuccessBlock:", v27);

  _Block_object_dispose(v39, 8);
}

void __70__COMeshAlarmAddOn_snoozeAlarmWithIdentifier_fromClient_withCallback___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  void *v6;

  v3 = a2;
  COCoreLogForCategory(2);
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    __70__COMeshAlarmAddOn_snoozeAlarmWithIdentifier_fromClient_withCallback___block_invoke_cold_1();

  (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
  v5 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
  v6 = *(void **)(v5 + 40);
  *(_QWORD *)(v5 + 40) = 0;

}

void __70__COMeshAlarmAddOn_snoozeAlarmWithIdentifier_fromClient_withCallback___block_invoke_218(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  id v7;
  uint64_t v8;
  id v9;
  void *v10;
  uint64_t v11;
  _QWORD v12[4];
  id v13;
  id v14;
  id v15;
  id v16;
  id v17;
  uint64_t v18;

  COCoreLogForCategory(2);
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
    __70__COMeshAlarmAddOn_snoozeAlarmWithIdentifier_fromClient_withCallback___block_invoke_218_cold_1();

  (*(void (**)(void))(*(_QWORD *)(a1 + 64) + 16))();
  objc_msgSend(*(id *)(a1 + 48), "currentAccessory");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 48), "homeForAccessory:", v3);
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = (void *)v4;
  if (v3 && v4)
  {
    objc_msgSend(*(id *)(a1 + 56), "alarms");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v12[0] = MEMORY[0x24BDAC760];
    v12[1] = 3221225472;
    v12[2] = __70__COMeshAlarmAddOn_snoozeAlarmWithIdentifier_fromClient_withCallback___block_invoke_219;
    v12[3] = &unk_24D4B3FF0;
    v13 = *(id *)(a1 + 40);
    v14 = *(id *)(a1 + 48);
    v15 = v3;
    v16 = v5;
    v7 = *(id *)(a1 + 32);
    v8 = *(_QWORD *)(a1 + 72);
    v17 = v7;
    v18 = v8;
    v9 = (id)objc_msgSend(v6, "addCompletionBlock:", v12);

    v10 = v13;
  }
  else
  {
    v11 = *(_QWORD *)(*(_QWORD *)(a1 + 72) + 8);
    v10 = *(void **)(v11 + 40);
    *(_QWORD *)(v11 + 40) = 0;
  }

}

void __70__COMeshAlarmAddOn_snoozeAlarmWithIdentifier_fromClient_withCallback___block_invoke_219(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  int v13;
  uint64_t (*__ptr32 *v14)();
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  NSObject *v20;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  id v24;
  uint64_t v25;
  id v26;
  _QWORD v27[4];
  id v28;
  id v29;
  uint64_t v30;
  _QWORD v31[4];
  id v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  uint8_t buf[4];
  uint64_t v38;
  __int16 v39;
  uint64_t v40;
  _BYTE v41[128];
  uint64_t v42;

  v42 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD1880]), "initWithUUIDString:", *(_QWORD *)(a1 + 32));
  v33 = 0u;
  v34 = 0u;
  v35 = 0u;
  v36 = 0u;
  v5 = v3;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v33, v41, 16);
  v7 = MEMORY[0x24BDAC760];
  if (v6)
  {
    v8 = v6;
    v9 = *(_QWORD *)v34;
LABEL_3:
    v10 = 0;
    while (1)
    {
      if (*(_QWORD *)v34 != v9)
        objc_enumerationMutation(v5);
      v11 = *(void **)(*((_QWORD *)&v33 + 1) + 8 * v10);
      if ((objc_msgSend(*(id *)(a1 + 40), "hasOptedToHH2") & 1) == 0)
      {
        objc_msgSend(v11, "alarmID");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v13 = objc_msgSend(v4, "isEqual:", v12);

        if (v13)
          break;
      }
      if (v8 == ++v10)
      {
        v8 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v33, v41, 16);
        if (v8)
          goto LABEL_3;
        goto LABEL_10;
      }
    }
    objc_msgSend(*(id *)(a1 + 40), "alarmsForAccessory:inHome:", *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56));
    v15 = objc_claimAutoreleasedReturnValue();
    v16 = (void *)v15;
    if (v15)
      v17 = (void *)v15;
    else
      v17 = (void *)MEMORY[0x24BDBD1A8];
    v31[0] = v7;
    v14 = &off_215F52000;
    v31[1] = 3221225472;
    v31[2] = __70__COMeshAlarmAddOn_snoozeAlarmWithIdentifier_fromClient_withCallback___block_invoke_2;
    v31[3] = &unk_24D4B3FA0;
    v32 = v4;
    objc_msgSend(v17, "na_firstObjectPassingTest:", v31);
    v18 = (void *)objc_claimAutoreleasedReturnValue();

    if (v18 && (objc_msgSend(v18, "isEnabled") & 1) == 0)
    {
      COCoreLogForCategory(2);
      v20 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
      {
        v21 = *(_QWORD *)(a1 + 64);
        v22 = *(_QWORD *)(a1 + 32);
        *(_DWORD *)buf = 134218242;
        v38 = v21;
        v39 = 2112;
        v40 = v22;
        _os_log_impl(&dword_215E92000, v20, OS_LOG_TYPE_DEFAULT, "%p updating the state of the snoozed alarm %@", buf, 0x16u);
      }

      v23 = (void *)objc_msgSend(v11, "mutableCopy");
      objc_msgSend(v23, "setEnabled:", 1);
      objc_msgSend(*(id *)(a1 + 40), "updateAlarm:onAccessory:inHome:", v23, *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56));
      v19 = (void *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      v19 = 0;
    }

    if (v19)
      goto LABEL_22;
  }
  else
  {
LABEL_10:

    v14 = &off_215F52000;
  }
  objc_msgSend(MEMORY[0x24BE6B608], "futureWithNoResult");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_22:
  v27[0] = v7;
  v27[1] = *((_QWORD *)v14 + 448);
  v27[2] = __70__COMeshAlarmAddOn_snoozeAlarmWithIdentifier_fromClient_withCallback___block_invoke_220;
  v27[3] = &unk_24D4B3FC8;
  v28 = *(id *)(a1 + 64);
  v24 = *(id *)(a1 + 32);
  v25 = *(_QWORD *)(a1 + 72);
  v29 = v24;
  v30 = v25;
  v26 = (id)objc_msgSend(v19, "addCompletionBlock:", v27);

}

uint64_t __70__COMeshAlarmAddOn_snoozeAlarmWithIdentifier_fromClient_withCallback___block_invoke_2(uint64_t a1, void *a2)
{
  void *v3;
  uint64_t v4;

  objc_msgSend(a2, "alarmID");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isEqual:", *(_QWORD *)(a1 + 32));

  return v4;
}

void __70__COMeshAlarmAddOn_snoozeAlarmWithIdentifier_fromClient_withCallback___block_invoke_220(_QWORD *a1)
{
  NSObject *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  int v7;
  uint64_t v8;
  __int16 v9;
  uint64_t v10;
  uint64_t v11;

  v11 = *MEMORY[0x24BDAC8D0];
  COCoreLogForCategory(2);
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    v3 = a1[4];
    v4 = a1[5];
    v7 = 134218242;
    v8 = v3;
    v9 = 2112;
    v10 = v4;
    _os_log_impl(&dword_215E92000, v2, OS_LOG_TYPE_DEFAULT, "%p done updating the state of the snoozed alarm %@", (uint8_t *)&v7, 0x16u);
  }

  v5 = *(_QWORD *)(a1[6] + 8);
  v6 = *(void **)(v5 + 40);
  *(_QWORD *)(v5 + 40) = 0;

}

- (void)dismissAlarmWithIdentifier:(id)a3 fromClient:(id)a4 withCallback:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  NSObject *v12;
  void *v13;
  uint64_t v14;
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  id v20;
  id v21;
  id v22;
  _QWORD v23[4];
  id v24;
  id v25;
  id v26;
  _QWORD *v27;
  _QWORD v28[4];
  id v29;
  id v30;
  COMeshAlarmAddOn *v31;
  id v32;
  _QWORD *v33;
  _QWORD v34[5];
  id v35;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  -[COMeshAddOn meshController](self, "meshController");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  COCoreLogForCategory(2);
  v12 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
    -[COMeshAlarmAddOn dismissAlarmWithIdentifier:fromClient:withCallback:].cold.1((uint64_t)v11);

  v34[0] = 0;
  v34[1] = v34;
  v34[2] = 0x3032000000;
  v34[3] = __Block_byref_object_copy__24;
  v34[4] = __Block_byref_object_dispose__24;
  v35 = (id)os_transaction_create();
  -[COMeshAlarmAddOn dismissAlarmWithIdentifier:client:](self, "dismissAlarmWithIdentifier:client:", v8, v9);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = MEMORY[0x24BDAC760];
  v28[0] = MEMORY[0x24BDAC760];
  v28[1] = 3221225472;
  v28[2] = __71__COMeshAlarmAddOn_dismissAlarmWithIdentifier_fromClient_withCallback___block_invoke;
  v28[3] = &unk_24D4B4090;
  v15 = v11;
  v29 = v15;
  v16 = v8;
  v30 = v16;
  v31 = self;
  v17 = v10;
  v32 = v17;
  v33 = v34;
  v18 = (id)objc_msgSend(v13, "addFailureBlock:", v28);
  v23[0] = v14;
  v23[1] = 3221225472;
  v23[2] = __71__COMeshAlarmAddOn_dismissAlarmWithIdentifier_fromClient_withCallback___block_invoke_224;
  v23[3] = &unk_24D4B40B8;
  v19 = v15;
  v24 = v19;
  v20 = v16;
  v25 = v20;
  v21 = v17;
  v26 = v21;
  v27 = v34;
  v22 = (id)objc_msgSend(v13, "addSuccessBlock:", v23);

  _Block_object_dispose(v34, 8);
}

void __71__COMeshAlarmAddOn_dismissAlarmWithIdentifier_fromClient_withCallback___block_invoke(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  void *v4;
  uint64_t v5;
  id v6;
  uint64_t v7;
  id v8;
  id v9;
  uint64_t v10;
  id v11;
  id v12;
  _QWORD v13[4];
  id v14;
  id v15;
  id v16;
  id v17;
  uint64_t v18;
  _QWORD v19[4];
  id v20;
  id v21;
  id v22;
  uint64_t v23;

  COCoreLogForCategory(2);
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
    __71__COMeshAlarmAddOn_dismissAlarmWithIdentifier_fromClient_withCallback___block_invoke_cold_1();

  objc_msgSend(*(id *)(a1 + 48), "alarmManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "dismissAlarmWithIdentifier:", *(_QWORD *)(a1 + 40));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = MEMORY[0x24BDAC760];
  v19[0] = MEMORY[0x24BDAC760];
  v19[1] = 3221225472;
  v19[2] = __71__COMeshAlarmAddOn_dismissAlarmWithIdentifier_fromClient_withCallback___block_invoke_222;
  v19[3] = &unk_24D4B3F78;
  v20 = *(id *)(a1 + 32);
  v21 = *(id *)(a1 + 40);
  v6 = *(id *)(a1 + 56);
  v7 = *(_QWORD *)(a1 + 64);
  v22 = v6;
  v23 = v7;
  v8 = (id)objc_msgSend(v4, "addFailureBlock:", v19);
  v13[0] = v5;
  v13[1] = 3221225472;
  v13[2] = __71__COMeshAlarmAddOn_dismissAlarmWithIdentifier_fromClient_withCallback___block_invoke_223;
  v13[3] = &unk_24D4B4068;
  v14 = v3;
  v15 = *(id *)(a1 + 40);
  v16 = *(id *)(a1 + 32);
  v9 = *(id *)(a1 + 56);
  v10 = *(_QWORD *)(a1 + 64);
  v17 = v9;
  v18 = v10;
  v11 = v3;
  v12 = (id)objc_msgSend(v4, "addSuccessBlock:", v13);

}

void __71__COMeshAlarmAddOn_dismissAlarmWithIdentifier_fromClient_withCallback___block_invoke_222(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  void *v6;

  v3 = a2;
  COCoreLogForCategory(2);
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    __71__COMeshAlarmAddOn_dismissAlarmWithIdentifier_fromClient_withCallback___block_invoke_222_cold_1();

  (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
  v5 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
  v6 = *(void **)(v5 + 40);
  *(_QWORD *)(v5 + 40) = 0;

}

void __71__COMeshAlarmAddOn_dismissAlarmWithIdentifier_fromClient_withCallback___block_invoke_223(uint64_t a1)
{
  void *v2;
  id v3;
  NSObject *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  _QWORD v9[4];
  id v10;
  id v11;

  objc_msgSend(*(id *)(a1 + 32), "alarms");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x24BDAC760];
  v9[1] = 3221225472;
  v9[2] = __71__COMeshAlarmAddOn_dismissAlarmWithIdentifier_fromClient_withCallback___block_invoke_2;
  v9[3] = &unk_24D4B4040;
  v10 = *(id *)(a1 + 40);
  v11 = *(id *)(a1 + 48);
  v3 = (id)objc_msgSend(v2, "addSuccessBlock:", v9);

  COCoreLogForCategory(2);
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
    __71__COMeshAlarmAddOn_dismissAlarmWithIdentifier_fromClient_withCallback___block_invoke_223_cold_1();

  (*(void (**)(_QWORD, _QWORD, uint64_t, uint64_t))(*(_QWORD *)(a1 + 56) + 16))(*(_QWORD *)(a1 + 56), 0, v5, v6);
  v7 = *(_QWORD *)(*(_QWORD *)(a1 + 64) + 8);
  v8 = *(void **)(v7 + 40);
  *(_QWORD *)(v7 + 40) = 0;

}

void __71__COMeshAlarmAddOn_dismissAlarmWithIdentifier_fromClient_withCallback___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  void *v11;
  int v12;
  COAlarmFiringAlarmDismissedNotification *v13;
  void *v14;
  COAlarmFiringAlarmDismissedNotification *v15;
  NSObject *v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  void *v21;
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD1880]), "initWithUUIDString:", *(_QWORD *)(a1 + 32));
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v5 = v3;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v17, v22, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v18;
    while (2)
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v18 != v8)
          objc_enumerationMutation(v5);
        v10 = *(void **)(*((_QWORD *)&v17 + 1) + 8 * i);
        objc_msgSend(v10, "alarmID", (_QWORD)v17);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v12 = objc_msgSend(v11, "isEqual:", v4);

        if (v12)
        {
          v13 = [COAlarmFiringAlarmDismissedNotification alloc];
          v21 = v10;
          objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v21, 1);
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          v15 = -[COAlarmNotification initWithAlarms:](v13, "initWithAlarms:", v14);

          COCoreLogForCategory(2);
          v16 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
            __71__COMeshAlarmAddOn_dismissAlarmWithIdentifier_fromClient_withCallback___block_invoke_2_cold_1(a1, v10, v16);

          objc_msgSend(*(id *)(a1 + 40), "sendNotification:", v15);
          goto LABEL_13;
        }
      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v17, v22, 16);
      if (v7)
        continue;
      break;
    }
  }
LABEL_13:

}

void __71__COMeshAlarmAddOn_dismissAlarmWithIdentifier_fromClient_withCallback___block_invoke_224(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  void *v4;

  COCoreLogForCategory(2);
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
    __71__COMeshAlarmAddOn_dismissAlarmWithIdentifier_fromClient_withCallback___block_invoke_224_cold_1();

  (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = 0;

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
  COMeshAlarmAddOn *v17;
  id v18;
  id v19;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  -[COMeshAddOn meshControllerQueue](self, "meshControllerQueue");
  v11 = objc_claimAutoreleasedReturnValue();
  v15[0] = MEMORY[0x24BDAC760];
  v15[1] = 3221225472;
  v15[2] = __60__COMeshAlarmAddOn_canDispatchAsAccessory_asInstance_reply___block_invoke;
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

void __60__COMeshAlarmAddOn_canDispatchAsAccessory_asInstance_reply___block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  void *v4;
  NSObject *v5;
  uint64_t v6;
  NSObject *v7;
  NSObject *v8;
  int v9;
  void *v10;
  id *v11;
  void *v12;
  int v13;
  void *v14;
  uint64_t v15;
  void *v16;
  NSObject *v17;
  void *v18;
  uint64_t v19;
  NSObject *v20;
  void *v21;
  uint64_t v22;
  NSObject *j;
  void *v24;
  uint64_t v25;
  NSObject *v26;
  void *v27;
  void *v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t i;
  void *v33;
  char v34;
  void *v35;
  NSObject *v36;
  uint64_t v37;
  NSObject *v38;
  const char *v39;
  uint64_t v40;
  uint64_t v41;
  id obj;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  uint8_t buf[4];
  uint64_t v52;
  __int16 v53;
  NSObject *v54;
  __int16 v55;
  uint64_t v56;
  __int16 v57;
  uint64_t v58;
  __int16 v59;
  void *v60;
  _BYTE v61[128];
  _BYTE v62[128];
  uint64_t v63;

  v63 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(*(id *)(a1 + 32), "uniqueIdentifier");
  v2 = objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "categoryType");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "IDSIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  COCoreLogForCategory(2);
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v6 = *(_QWORD *)(a1 + 40);
    v7 = *(NSObject **)(a1 + 48);
    *(_DWORD *)buf = 134218754;
    v52 = v6;
    v53 = 2112;
    v54 = v7;
    v55 = 2112;
    v56 = v2;
    v57 = 2112;
    v58 = (uint64_t)v3;
    _os_log_impl(&dword_215E92000, v5, OS_LOG_TYPE_DEFAULT, "%p as %@ checking dispatch for %@ of %@...", buf, 0x2Au);
  }

  if (!(*(_QWORD *)(a1 + 48) | v2))
  {
    LODWORD(v8) = 1;
    goto LABEL_43;
  }
  v9 = objc_msgSend(v3, "isEqualToString:", *MEMORY[0x24BDD49E0]);
  v11 = (id *)(a1 + 40);
  v10 = *(void **)(a1 + 40);
  if (v9)
  {
    objc_msgSend(v10, "homekit");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v12, "hasOptedToHH2");

    if (v13)
    {
      objc_msgSend(*v11, "meshController");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = objc_msgSend(v14, "state");

      objc_msgSend(*v11, "ourInterests");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "objectForKey:", v4);
      v17 = objc_claimAutoreleasedReturnValue();

      if (v17)
      {
        COCoreLogForCategory(2);
        v8 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
        {
          v41 = *(_QWORD *)(a1 + 32);
          v40 = *(_QWORD *)(a1 + 40);
          *(_DWORD *)buf = 134218498;
          v52 = v40;
          v53 = 2048;
          v54 = v17;
          v55 = 2112;
          v56 = v41;
          _os_log_debug_impl(&dword_215E92000, v8, OS_LOG_TYPE_DEBUG, "%p using interest tracker %p for can dispatch of %@", buf, 0x20u);
        }

        LODWORD(v8) = -[NSObject canDispatchWithPrimary:](v17, "canDispatchWithPrimary:", v15 == 3);
      }
      else
      {
        if (v15 == 3)
        {
          COCoreLogForCategory(2);
          v26 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v26, OS_LOG_TYPE_DEBUG))
            __60__COMeshAlarmAddOn_canDispatchAsAccessory_asInstance_reply___block_invoke_cold_1();

          v49 = 0u;
          v50 = 0u;
          v47 = 0u;
          v48 = 0u;
          objc_msgSend(*v11, "meshController");
          v27 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v27, "nodes");
          v28 = (void *)objc_claimAutoreleasedReturnValue();

          obj = v28;
          v29 = objc_msgSend(v28, "countByEnumeratingWithState:objects:count:", &v47, v62, 16);
          if (v29)
          {
            v30 = v29;
            v31 = *(_QWORD *)v48;
            while (2)
            {
              for (i = 0; i != v30; ++i)
              {
                if (*(_QWORD *)v48 != v31)
                  objc_enumerationMutation(obj);
                objc_msgSend(*(id *)(*((_QWORD *)&v47 + 1) + 8 * i), "IDSIdentifier");
                v33 = (void *)objc_claimAutoreleasedReturnValue();
                v34 = objc_msgSend(v33, "isEqual:", v4);

                if ((v34 & 1) != 0)
                {

                  goto LABEL_41;
                }
              }
              v30 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v47, v62, 16);
              if (v30)
                continue;
              break;
            }
          }

        }
        objc_msgSend(*(id *)(a1 + 40), "secondaryClusterMemberForAccessory:", *(_QWORD *)(a1 + 32));
        v35 = (void *)objc_claimAutoreleasedReturnValue();
        LODWORD(v8) = v35 != 0;

      }
    }
    else
    {
      COCoreLogForCategory(2);
      v17 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
        __60__COMeshAlarmAddOn_canDispatchAsAccessory_asInstance_reply___block_invoke_cold_2();
      LODWORD(v8) = 1;
    }
  }
  else
  {
    objc_msgSend(v10, "meshController");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = objc_msgSend(v18, "state");

    if (v19 != 3)
    {
      LODWORD(v8) = 0;
      goto LABEL_43;
    }
    COCoreLogForCategory(2);
    v20 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG))
      __60__COMeshAlarmAddOn_canDispatchAsAccessory_asInstance_reply___block_invoke_cold_3();

    v45 = 0u;
    v46 = 0u;
    v43 = 0u;
    v44 = 0u;
    objc_msgSend(*v11, "meshController");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "nodes");
    v17 = objc_claimAutoreleasedReturnValue();

    v8 = -[NSObject countByEnumeratingWithState:objects:count:](v17, "countByEnumeratingWithState:objects:count:", &v43, v61, 16);
    if (v8)
    {
      v22 = *(_QWORD *)v44;
      while (2)
      {
        for (j = 0; j != v8; j = ((char *)j + 1))
        {
          if (*(_QWORD *)v44 != v22)
            objc_enumerationMutation(v17);
          objc_msgSend(*(id *)(*((_QWORD *)&v43 + 1) + 8 * (_QWORD)j), "remote");
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          v25 = objc_msgSend(v24, "type");

          if (v25 != -1)
          {
LABEL_41:
            LODWORD(v8) = 1;
            goto LABEL_42;
          }
        }
        v8 = -[NSObject countByEnumeratingWithState:objects:count:](v17, "countByEnumeratingWithState:objects:count:", &v43, v61, 16);
        if (v8)
          continue;
        break;
      }
    }
  }
LABEL_42:

LABEL_43:
  COCoreLogForCategory(2);
  v36 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v36, OS_LOG_TYPE_DEFAULT))
  {
    v37 = *(_QWORD *)(a1 + 40);
    v38 = *(NSObject **)(a1 + 48);
    v39 = " not";
    if ((_DWORD)v8)
      v39 = "";
    *(_DWORD *)buf = 134219010;
    v52 = v37;
    v53 = 2112;
    v54 = v38;
    v55 = 2080;
    v56 = (uint64_t)v39;
    v57 = 2112;
    v58 = v2;
    v59 = 2112;
    v60 = v3;
    _os_log_impl(&dword_215E92000, v36, OS_LOG_TYPE_DEFAULT, "%p as %@ can%s dispatch for %@ of %@", buf, 0x34u);
  }

  (*(void (**)(void))(*(_QWORD *)(a1 + 56) + 16))();
}

- (void)mediaSystemCompanionTransitionedFrom:(id)a3 to:(id)a4
{
  id v6;
  id v7;
  void *v8;
  char v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  NSObject *v15;
  _BOOL4 v16;
  NSObject *v17;
  void *v18;
  id v19;
  void *v20;
  id v21;
  _QWORD v22[4];
  id v23;
  id v24;
  COMeshAlarmAddOn *v25;
  id v26;
  _QWORD v27[4];
  id v28;
  id v29;
  COMeshAlarmAddOn *v30;
  uint8_t buf[4];
  COMeshAlarmAddOn *v32;
  __int16 v33;
  void *v34;
  __int16 v35;
  id v36;
  uint64_t v37;

  v37 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  -[COMeshAlarmAddOn homekit](self, "homekit");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v8, "hasOptedToHH2"))
  {
    v9 = objc_msgSend(v6, "isEqual:", v7);
    if (v7 != v6 && (v9 & 1) == 0)
    {
      objc_msgSend(v8, "currentAccessory");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = v10;
      if (!v10)
      {
LABEL_17:

        goto LABEL_18;
      }
      objc_msgSend(v10, "uniqueIdentifier");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = v12;
      if (v7)
      {
        v14 = objc_msgSend(v12, "co_compare:", v7);
        COCoreLogForCategory(2);
        v15 = objc_claimAutoreleasedReturnValue();
        v16 = os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT);
        if (v14 == 1)
        {
          if (v16)
          {
            *(_DWORD *)buf = 134218498;
            v32 = self;
            v33 = 2112;
            v34 = v13;
            v35 = 2112;
            v36 = v7;
            _os_log_impl(&dword_215E92000, v15, OS_LOG_TYPE_DEFAULT, "%p system pair alarms deferred by %@ to %@", buf, 0x20u);
          }
          goto LABEL_16;
        }
        if (v16)
        {
          *(_DWORD *)buf = 134218498;
          v32 = self;
          v33 = 2112;
          v34 = v13;
          v35 = 2112;
          v36 = v7;
          _os_log_impl(&dword_215E92000, v15, OS_LOG_TYPE_DEFAULT, "%p system pair alarms being coalesced for %@ and %@", buf, 0x20u);
        }

        -[COMeshAlarmAddOn alarmManager](self, "alarmManager");
        v15 = objc_claimAutoreleasedReturnValue();
        -[NSObject alarms](v15, "alarms");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        v27[0] = MEMORY[0x24BDAC760];
        v27[1] = 3221225472;
        v27[2] = __60__COMeshAlarmAddOn_mediaSystemCompanionTransitionedFrom_to___block_invoke;
        v27[3] = &unk_24D4B24F0;
        v28 = v13;
        v29 = v7;
        v30 = self;
        v21 = (id)objc_msgSend(v18, "addSuccessBlock:", v27);

        v20 = v28;
      }
      else
      {
        COCoreLogForCategory(2);
        v17 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 134218498;
          v32 = self;
          v33 = 2112;
          v34 = v13;
          v35 = 2112;
          v36 = v6;
          _os_log_impl(&dword_215E92000, v17, OS_LOG_TYPE_DEFAULT, "%p system pair alarms splitting %@ from %@", buf, 0x20u);
        }

        -[COMeshAlarmAddOn alarmManager](self, "alarmManager");
        v15 = objc_claimAutoreleasedReturnValue();
        -[NSObject alarms](v15, "alarms");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        v22[0] = MEMORY[0x24BDAC760];
        v22[1] = 3221225472;
        v22[2] = __60__COMeshAlarmAddOn_mediaSystemCompanionTransitionedFrom_to___block_invoke_227;
        v22[3] = &unk_24D4B20E8;
        v23 = v13;
        v24 = v6;
        v25 = self;
        v26 = v11;
        v19 = (id)objc_msgSend(v18, "addSuccessBlock:", v22);

        v20 = v23;
      }

LABEL_16:
      goto LABEL_17;
    }
  }
LABEL_18:

}

void __60__COMeshAlarmAddOn_mediaSystemCompanionTransitionedFrom_to___block_invoke(_QWORD *a1, void *a2)
{
  uint64_t v3;
  void *v4;
  id v5;
  void *v6;
  uint64_t v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  id v13;
  _QWORD v14[4];
  id v15;
  uint64_t v16;
  _QWORD v17[5];
  id v18;
  _QWORD v19[3];

  v19[2] = *MEMORY[0x24BDAC8D0];
  v3 = a1[5];
  v19[0] = a1[4];
  v19[1] = v3;
  v4 = (void *)MEMORY[0x24BDBCE30];
  v5 = a2;
  objc_msgSend(v4, "arrayWithObjects:count:", v19, 2);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = MEMORY[0x24BDAC760];
  v17[0] = MEMORY[0x24BDAC760];
  v17[1] = 3221225472;
  v17[2] = __60__COMeshAlarmAddOn_mediaSystemCompanionTransitionedFrom_to___block_invoke_2;
  v17[3] = &unk_24D4B3198;
  v17[4] = a1[6];
  v18 = v6;
  v8 = v6;
  objc_msgSend(v5, "indexesOfObjectsPassingTest:", v17);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectsAtIndexes:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  UniqueAlarms(v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v14[0] = v7;
  v14[1] = 3221225472;
  v14[2] = __60__COMeshAlarmAddOn_mediaSystemCompanionTransitionedFrom_to___block_invoke_3;
  v14[3] = &unk_24D4B3D70;
  v12 = a1[6];
  v15 = v11;
  v16 = v12;
  v13 = v11;
  objc_msgSend(v10, "enumerateObjectsUsingBlock:", v14);

}

uint64_t __60__COMeshAlarmAddOn_mediaSystemCompanionTransitionedFrom_to___block_invoke_2(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "_isAlarm:targetingAccessoryIdentifiers:", a2, *(_QWORD *)(a1 + 40));
}

void __60__COMeshAlarmAddOn_mediaSystemCompanionTransitionedFrom_to___block_invoke_3(uint64_t a1, void *a2)
{
  id v3;
  id v4;

  v4 = a2;
  if ((objc_msgSend(*(id *)(a1 + 32), "containsObject:") & 1) == 0)
    v3 = (id)objc_msgSend(*(id *)(a1 + 40), "removeAlarm:", v4);

}

void __60__COMeshAlarmAddOn_mediaSystemCompanionTransitionedFrom_to___block_invoke_227(_QWORD *a1, void *a2)
{
  uint64_t v3;
  void *v4;
  id v5;
  void *v6;
  uint64_t v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  id v15;
  _QWORD v16[5];
  id v17;
  id v18;
  _QWORD v19[5];
  id v20;
  uint64_t v21;
  _QWORD v22[3];

  v22[2] = *MEMORY[0x24BDAC8D0];
  v3 = a1[5];
  v22[0] = a1[4];
  v22[1] = v3;
  v4 = (void *)MEMORY[0x24BDBCE30];
  v5 = a2;
  objc_msgSend(v4, "arrayWithObjects:count:", v22, 2);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = MEMORY[0x24BDAC760];
  v19[0] = MEMORY[0x24BDAC760];
  v19[1] = 3221225472;
  v19[2] = __60__COMeshAlarmAddOn_mediaSystemCompanionTransitionedFrom_to___block_invoke_2_228;
  v19[3] = &unk_24D4B3198;
  v19[4] = a1[6];
  v20 = v6;
  v8 = v6;
  objc_msgSend(v5, "indexesOfObjectsPassingTest:", v19);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectsAtIndexes:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  UniqueAlarms(v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  v21 = a1[4];
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v21, 1);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  COAlarmSiriContextTargetReferenceForAccessory();
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v16[0] = v7;
  v16[1] = 3221225472;
  v16[2] = __60__COMeshAlarmAddOn_mediaSystemCompanionTransitionedFrom_to___block_invoke_3_229;
  v16[3] = &unk_24D4B3C90;
  v16[4] = a1[6];
  v17 = v12;
  v18 = v13;
  v14 = v13;
  v15 = v12;
  objc_msgSend(v11, "enumerateObjectsUsingBlock:", v16);

}

uint64_t __60__COMeshAlarmAddOn_mediaSystemCompanionTransitionedFrom_to___block_invoke_2_228(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  uint64_t v5;

  v3 = a2;
  objc_msgSend(v3, "co_targetReference");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
    v5 = objc_msgSend(*(id *)(a1 + 32), "_isAlarm:targetingAccessoryIdentifiers:", v3, *(_QWORD *)(a1 + 40));
  else
    v5 = 0;

  return v5;
}

void __60__COMeshAlarmAddOn_mediaSystemCompanionTransitionedFrom_to___block_invoke_3_229(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  int v5;
  NSObject *v6;
  _BOOL4 v7;
  uint64_t v8;
  void *v9;
  void *v10;
  const char *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  id v17;
  int v18;
  uint64_t v19;
  __int16 v20;
  void *v21;
  __int16 v22;
  void *v23;
  uint64_t v24;

  v24 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  v4 = objc_alloc_init(MEMORY[0x24BE67840]);
  v5 = objc_msgSend(*(id *)(a1 + 32), "_isAlarm:targetingAccessoryIdentifiers:", v3, *(_QWORD *)(a1 + 40));
  COCoreLogForCategory(2);
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT);
  if (v5)
  {
    if (v7)
    {
      v8 = *(_QWORD *)(a1 + 32);
      objc_msgSend(v3, "alarmID");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "alarmID");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = 134218498;
      v19 = v8;
      v20 = 2112;
      v21 = v9;
      v22 = 2112;
      v23 = v10;
      v11 = "%p replacing %@ with %@";
LABEL_6:
      _os_log_impl(&dword_215E92000, v6, OS_LOG_TYPE_DEFAULT, v11, (uint8_t *)&v18, 0x20u);

    }
  }
  else if (v7)
  {
    v12 = *(_QWORD *)(a1 + 32);
    objc_msgSend(v3, "alarmID");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "alarmID");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = 134218498;
    v19 = v12;
    v20 = 2112;
    v21 = v9;
    v22 = 2112;
    v23 = v10;
    v11 = "%p duplicating %@ to %@";
    goto LABEL_6;
  }

  if (v4)
  {
    objc_msgSend(v4, "setHour:", objc_msgSend(v3, "hour"));
    objc_msgSend(v4, "setMinute:", objc_msgSend(v3, "minute"));
    objc_msgSend(v4, "setEnabled:", objc_msgSend(v3, "isEnabled"));
    objc_msgSend(v4, "setRepeatSchedule:", objc_msgSend(v3, "repeatSchedule"));
    objc_msgSend(v3, "title");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setTitle:", v13);

    objc_msgSend(v3, "sound");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setSound:", v14);

    objc_msgSend(v3, "siriContext");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setSiriContext:", v15);

    objc_msgSend(v4, "co_setTargetReference:", *(_QWORD *)(a1 + 48));
    v16 = (id)objc_msgSend(*(id *)(a1 + 32), "addAlarm:", v4);
    if (v5)
      v17 = (id)objc_msgSend(*(id *)(a1 + 32), "removeAlarm:", v3);
  }

}

- (void)establishSecondaryClusterForAccessory:(id)a3
{
  id v4;
  NSObject *v5;
  COMTActionDirector *actionDirector;
  _QWORD v7[5];
  id v8;
  uint8_t buf[4];
  COMeshAlarmAddOn *v10;
  __int16 v11;
  const __CFString *v12;
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  if (objc_msgSend(MEMORY[0x24BE19E30], "isHomeKitUsingAlarmsAndTimersIDSService"))
  {
    COCoreLogForCategory(2);
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134218242;
      v10 = self;
      v11 = 2112;
      v12 = CFSTR("com.apple.private.alloy.alarms-timers");
      _os_log_impl(&dword_215E92000, v5, OS_LOG_TYPE_DEFAULT, "%p HomeKit is making use of IDS Service %@ for alarms", buf, 0x16u);
    }
    goto LABEL_8;
  }
  if (objc_msgSend(MEMORY[0x24BE19E30], "isGlobalMessagingEnabled"))
  {
    -[COMeshAlarmAddOn homekit](self, "homekit");
    v5 = objc_claimAutoreleasedReturnValue();
    if ((-[NSObject hasOptedToHH2](v5, "hasOptedToHH2") & 1) == 0)
    {
LABEL_8:

      goto LABEL_9;
    }
    actionDirector = self->_actionDirector;

    if (!actionDirector)
    {
      v7[0] = MEMORY[0x24BDAC760];
      v7[1] = 3221225472;
      v7[2] = __58__COMeshAlarmAddOn_establishSecondaryClusterForAccessory___block_invoke;
      v7[3] = &unk_24D4B0858;
      v7[4] = self;
      v8 = v4;
      -[COMeshAlarmAddOn _withLock:](self, "_withLock:", v7);

    }
  }
LABEL_9:

}

void __58__COMeshAlarmAddOn_establishSecondaryClusterForAccessory___block_invoke(uint64_t a1)
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
  if (!*(_QWORD *)(*(_QWORD *)(a1 + 32) + 80))
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
    -[COMeshAlarmAddOn members](self, "members");
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
  int v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  char v16;
  void *v17;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _BYTE v23[128];
  uint64_t v24;

  v24 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  if (!objc_msgSend(MEMORY[0x24BE19E30], "isGlobalMessagingEnabled"))
    goto LABEL_14;
  -[COMeshAlarmAddOn homekit](self, "homekit");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "hasOptedToHH2");

  if (!v6)
    goto LABEL_14;
  objc_msgSend(v4, "categoryType");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v7, "isEqualToString:", *MEMORY[0x24BDD49E0]) & 1) == 0)
  {

LABEL_14:
    v17 = 0;
    goto LABEL_15;
  }
  objc_msgSend(v4, "IDSIdentifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  -[COMeshAddOn meshController](self, "meshController", 0);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "nodes");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
  if (v11)
  {
    v12 = v11;
    v13 = *(_QWORD *)v20;
    while (2)
    {
      v14 = 0;
      do
      {
        if (*(_QWORD *)v20 != v13)
          objc_enumerationMutation(v10);
        objc_msgSend(*(id *)(*((_QWORD *)&v19 + 1) + 8 * v14), "IDSIdentifier");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        v16 = objc_msgSend(v15, "isEqual:", v8);

        if ((v16 & 1) != 0)
        {

          v17 = 0;
          goto LABEL_17;
        }
        ++v14;
      }
      while (v12 != v14);
      v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
      if (v12)
        continue;
      break;
    }
  }

  -[COMeshAlarmAddOn secondaryClusterMemberForAccessory:](self, "secondaryClusterMemberForAccessory:", v4);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_17:

LABEL_15:
  return v17;
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
  COMeshAlarmAddOn *v17;
  id v18;
  id v19;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  -[COMeshAddOn meshControllerQueue](self, "meshControllerQueue");
  v11 = objc_claimAutoreleasedReturnValue();
  v15[0] = MEMORY[0x24BDAC760];
  v15[1] = 3221225472;
  v15[2] = __58__COMeshAlarmAddOn_setInterests_asAccessory_withCallback___block_invoke;
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

void __58__COMeshAlarmAddOn_setInterests_asAccessory_withCallback___block_invoke(uint64_t a1)
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
      COCoreLogForCategory(2);
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
      COCoreLogForCategory(2);
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
    COCoreLogForCategory(2);
    v19 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
      __58__COMeshAlarmAddOn_setInterests_asAccessory_withCallback___block_invoke_cold_1();

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
  COMeshAlarmAddOn *v39;
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

  COCoreLogForCategory(2);
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
  v33[2] = __68__COMeshAlarmAddOn_interestTracker_setInterests_forMember_callback___block_invoke;
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
  -[COMeshAlarmAddOn actionDirector](self, "actionDirector");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBCF20], "setWithObject:", v29);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  v30[0] = v19;
  v30[1] = 3221225472;
  v30[2] = __68__COMeshAlarmAddOn_interestTracker_setInterests_forMember_callback___block_invoke_240;
  v30[3] = &unk_24D4B25B8;
  v27 = v24;
  v31 = v27;
  v28 = v23;
  v32 = v28;
  objc_msgSend(v25, "requestAction:members:activity:withCompletion:", v21, v26, 0, v30);

  objc_destroyWeak(&v37);
  objc_destroyWeak((id *)buf);

}

void __68__COMeshAlarmAddOn_interestTracker_setInterests_forMember_callback___block_invoke(uint64_t a1, void *a2)
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
    COCoreLogForCategory(2);
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
      objc_msgSend(v11, "didChangeCompositionForAlarmAddOn:", WeakRetained);

  }
}

void __68__COMeshAlarmAddOn_interestTracker_setInterests_forMember_callback___block_invoke_240(uint64_t a1, uint64_t a2, void *a3)
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
  v8[2] = __68__COMeshAlarmAddOn_interestTracker_setInterests_forMember_callback___block_invoke_2;
  v8[3] = &unk_24D4B0B68;
  v5 = *(NSObject **)(a1 + 32);
  v6 = *(id *)(a1 + 40);
  v9 = v4;
  v10 = v6;
  v7 = v4;
  dispatch_async(v5, v8);

}

uint64_t __68__COMeshAlarmAddOn_interestTracker_setInterests_forMember_callback___block_invoke_2(uint64_t a1)
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

  COCoreLogForCategory(2);
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
    -[COMeshAlarmAddOn handleAlarmManagerStateResetNotification:].cold.1(self, v6);

  -[COMeshAlarmAddOn delegate](self, "delegate");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(v4, "accessory");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "uniqueIdentifier");
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v7, "alarmAddOn:resetAccesory:", self, v9);
  }

}

- (void)_reaperFired
{
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  double v8;
  double v9;
  NSObject *v10;
  double v11;
  _QWORD v12[5];
  id v13;
  id v14;
  double v15;

  -[COMeshAlarmAddOn homekit](self, "homekit");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "currentAccessory");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    objc_msgSend(v3, "homeForAccessory:", v4);
    v5 = objc_claimAutoreleasedReturnValue();
    if (v5)
    {
      v6 = (void *)v5;
      objc_msgSend(MEMORY[0x24BDBCF50], "standardUserDefaults");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "doubleForKey:", CFSTR("ReapExpirationInterval"));
      v9 = v8;
      -[COMeshAddOn meshControllerQueue](self, "meshControllerQueue");
      v10 = objc_claimAutoreleasedReturnValue();
      if (v10)
      {
        v11 = 5184000.0;
        if (v9 > 0.0)
          v11 = v9;
        v12[0] = MEMORY[0x24BDAC760];
        v12[1] = 3221225472;
        v12[2] = __32__COMeshAlarmAddOn__reaperFired__block_invoke;
        v12[3] = &unk_24D4B3368;
        v12[4] = self;
        v15 = v11;
        v13 = v4;
        v14 = v6;
        dispatch_async(v10, v12);

      }
    }
  }

}

void __32__COMeshAlarmAddOn__reaperFired__block_invoke(uint64_t a1)
{
  void *v2;
  id v3;

  v2 = *(void **)(a1 + 32);
  objc_msgSend(MEMORY[0x24BDBCE60], "dateWithTimeIntervalSinceNow:", -*(double *)(a1 + 56));
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "reapNonRepeatingAlarmsOlderThanDate:accessory:home:", v3, *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));

}

- (void)reapNonRepeatingAlarmsOlderThanDate:(id)a3 accessory:(id)a4 home:(id)a5
{
  id v8;
  id v9;
  id v10;
  uint32_t v11;
  NSObject *v12;
  void *v13;
  char v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  id v19;
  id v20;
  void *v21;
  void *v22;
  uint64_t (*__ptr32 *v23)();
  id v24;
  id v25;
  id v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  id v31;
  void *v32;
  uint32_t v33;
  _QWORD v34[4];
  id v35;
  COMeshAlarmAddOn *v36;
  uint32_t v37;
  _QWORD v38[4];
  id v39;
  id v40;
  _QWORD v41[4];
  id v42;
  COMeshAlarmAddOn *v43;
  id v44;
  uint8_t buf[4];
  uint32_t v46;
  uint64_t v47;

  v47 = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  if (-[COMeshAlarmAddOn performsLocalActions](self, "performsLocalActions"))
  {
    v11 = arc4random();
    COCoreLogForCategory(2);
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 67109120;
      v46 = v11;
      _os_log_impl(&dword_215E92000, v12, OS_LOG_TYPE_DEFAULT, "(%u) Alarm reap started.", buf, 8u);
    }

    -[COMeshAlarmAddOn homekit](self, "homekit");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = objc_msgSend(v13, "hasOptedToHH2");
    v15 = MEMORY[0x24BDAC760];
    v33 = v11;
    if ((v14 & 1) != 0)
      goto LABEL_8;
    v16 = (void *)*MEMORY[0x24BDD49E0];
    objc_msgSend(v9, "category");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "categoryType");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    LOBYTE(v16) = objc_msgSend(v16, "isEqual:", v18);

    if ((v16 & 1) == 0)
    {
LABEL_8:
      v20 = objc_alloc_init(MEMORY[0x24BE6B608]);
      -[COMeshAlarmAddOn alarmManager](self, "alarmManager");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "alarms");
      v22 = (void *)objc_claimAutoreleasedReturnValue();

      v41[0] = v15;
      v23 = &off_215F52000;
      v41[1] = 3221225472;
      v41[2] = __71__COMeshAlarmAddOn_reapNonRepeatingAlarmsOlderThanDate_accessory_home___block_invoke;
      v41[3] = &unk_24D4B3EB0;
      v24 = v20;
      v42 = v24;
      v43 = self;
      v44 = v9;
      v25 = (id)objc_msgSend(v22, "addCompletionBlock:", v41);

      v19 = v42;
    }
    else
    {
      objc_msgSend(v13, "mediaSystemForAccessory:inHome:", v9, v10);
      v19 = (id)objc_claimAutoreleasedReturnValue();
      if (v19)
        objc_msgSend(v13, "settingsForKeyPath:onMediaObject:", CFSTR("root.mobileTimer.alarms"), v19);
      else
        objc_msgSend(v13, "settingsForKeyPath:onAccessory:", CFSTR("root.mobileTimer.alarms"), v9);
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v27, "firstObject");
      v22 = (void *)objc_claimAutoreleasedReturnValue();

      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        COAlarmSiriContextTargetReferenceForAccessory();
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        v30 = (void *)MEMORY[0x24BE6B608];
        objc_msgSend(v22, "co_rawAlarms");
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        v38[0] = v15;
        v23 = &off_215F52000;
        v38[1] = 3221225472;
        v38[2] = __71__COMeshAlarmAddOn_reapNonRepeatingAlarmsOlderThanDate_accessory_home___block_invoke_2;
        v38[3] = &unk_24D4B40E0;
        v39 = v28;
        v19 = v19;
        v40 = v19;
        v31 = v28;
        objc_msgSend(v32, "na_map:", v38);
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v30, "futureWithResult:", v29);
        v24 = (id)objc_claimAutoreleasedReturnValue();

        v15 = MEMORY[0x24BDAC760];
      }
      else
      {
        objc_msgSend(MEMORY[0x24BE6B608], "futureWithResult:", MEMORY[0x24BDBD1A8]);
        v24 = (id)objc_claimAutoreleasedReturnValue();
        v23 = &off_215F52000;
      }
    }

    v34[0] = v15;
    v34[1] = *((_QWORD *)v23 + 448);
    v34[2] = __71__COMeshAlarmAddOn_reapNonRepeatingAlarmsOlderThanDate_accessory_home___block_invoke_3;
    v34[3] = &unk_24D4B41A0;
    v37 = v33;
    v35 = v8;
    v36 = self;
    v26 = (id)objc_msgSend(v24, "addSuccessBlock:", v34);

  }
}

void __71__COMeshAlarmAddOn_reapNonRepeatingAlarmsOlderThanDate_accessory_home___block_invoke(uint64_t a1, uint64_t a2)
{
  void *v2;
  uint64_t v3;
  id v4;

  v2 = *(void **)(a1 + 32);
  if (a2)
    v3 = a2;
  else
    v3 = MEMORY[0x24BDBD1A8];
  objc_msgSend(*(id *)(a1 + 40), "_filteredAlarmsList:forAccessory:", v3, *(_QWORD *)(a1 + 48));
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "finishWithResult:", v4);

}

id __71__COMeshAlarmAddOn_reapNonRepeatingAlarmsOlderThanDate_accessory_home___block_invoke_2(uint64_t a1, void *a2)
{
  void *v3;

  v3 = (void *)objc_msgSend(a2, "mutableCopy");
  objc_msgSend(v3, "co_setTargetReference:", *(_QWORD *)(a1 + 32));
  if (*(_QWORD *)(a1 + 40))
    objc_msgSend(v3, "co_setIsMediaSystemOriginating");
  return v3;
}

void __71__COMeshAlarmAddOn_reapNonRepeatingAlarmsOlderThanDate_accessory_home___block_invoke_3(uint64_t a1, void *a2)
{
  uint64_t v4;
  id v5;
  void *v6;
  void *v7;
  NSObject *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  int v14;
  _QWORD v15[4];
  int v16;
  _QWORD v17[5];
  int v18;
  _QWORD v19[4];
  id v20;
  uint8_t buf[4];
  int v22;
  uint64_t v23;

  v4 = MEMORY[0x24BDAC760];
  v23 = *MEMORY[0x24BDAC8D0];
  v19[0] = MEMORY[0x24BDAC760];
  v19[1] = 3221225472;
  v19[2] = __71__COMeshAlarmAddOn_reapNonRepeatingAlarmsOlderThanDate_accessory_home___block_invoke_4;
  v19[3] = &unk_24D4B4108;
  v20 = *(id *)(a1 + 32);
  v5 = a2;
  objc_msgSend(v5, "indexesOfObjectsPassingTest:", v19);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectsAtIndexes:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v7, "count"))
  {
    v17[0] = v4;
    v17[1] = 3221225472;
    v17[2] = __71__COMeshAlarmAddOn_reapNonRepeatingAlarmsOlderThanDate_accessory_home___block_invoke_244;
    v17[3] = &unk_24D4B4158;
    v17[4] = *(_QWORD *)(a1 + 40);
    v18 = *(_DWORD *)(a1 + 48);
    objc_msgSend(v7, "na_map:", v17);
    v8 = objc_claimAutoreleasedReturnValue();
    v9 = (void *)MEMORY[0x24BE6B628];
    objc_msgSend(*(id *)(a1 + 40), "meshControllerQueue");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "schedulerWithDispatchQueue:", v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x24BE6B608], "combineAllFutures:ignoringErrors:scheduler:", v8, 1, v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v15[0] = v4;
    v15[1] = 3221225472;
    v15[2] = __71__COMeshAlarmAddOn_reapNonRepeatingAlarmsOlderThanDate_accessory_home___block_invoke_246;
    v15[3] = &__block_descriptor_36_e20_v24__0_8__NSError_16l;
    v16 = *(_DWORD *)(a1 + 48);
    v13 = (id)objc_msgSend(v12, "addCompletionBlock:", v15);

  }
  else
  {
    COCoreLogForCategory(2);
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      v14 = *(_DWORD *)(a1 + 48);
      *(_DWORD *)buf = 67109120;
      v22 = v14;
      _os_log_impl(&dword_215E92000, v8, OS_LOG_TYPE_DEFAULT, "(%u) Alarm reap complete with no alarms.", buf, 8u);
    }
  }

}

BOOL __71__COMeshAlarmAddOn_reapNonRepeatingAlarmsOlderThanDate_accessory_home___block_invoke_4(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  _BOOL8 v5;
  void *v6;

  v3 = a2;
  objc_msgSend(v3, "lastModifiedDate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v3, "isEnabled") & 1) != 0)
  {
    v5 = 0;
  }
  else
  {
    v5 = 0;
    if ((objc_msgSend(v3, "repeats") & 1) == 0 && v4)
    {
      objc_msgSend(v4, "earlierDate:", *(_QWORD *)(a1 + 32));
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v5 = v4 == v6;

    }
  }

  return v5;
}

id __71__COMeshAlarmAddOn_reapNonRepeatingAlarmsOlderThanDate_accessory_home___block_invoke_244(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  id v5;
  id v6;
  _QWORD v8[4];
  id v9;
  int v10;

  v3 = a2;
  objc_msgSend(*(id *)(a1 + 32), "removeAlarm:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __71__COMeshAlarmAddOn_reapNonRepeatingAlarmsOlderThanDate_accessory_home___block_invoke_2_245;
  v8[3] = &unk_24D4B4130;
  v10 = *(_DWORD *)(a1 + 40);
  v9 = v3;
  v5 = v3;
  v6 = (id)objc_msgSend(v4, "addCompletionBlock:", v8);

  return v4;
}

void __71__COMeshAlarmAddOn_reapNonRepeatingAlarmsOlderThanDate_accessory_home___block_invoke_2_245(uint64_t a1, uint64_t a2, void *a3)
{
  id v4;
  NSObject *v5;
  NSObject *v6;
  int v7;
  void *v8;
  _DWORD v9[2];
  __int16 v10;
  void *v11;
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  COCoreLogForCategory(2);
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v4)
  {
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      __71__COMeshAlarmAddOn_reapNonRepeatingAlarmsOlderThanDate_accessory_home___block_invoke_2_245_cold_1();
  }
  else if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v7 = *(_DWORD *)(a1 + 40);
    objc_msgSend(*(id *)(a1 + 32), "alarmID");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9[0] = 67109378;
    v9[1] = v7;
    v10 = 2112;
    v11 = v8;
    _os_log_impl(&dword_215E92000, v6, OS_LOG_TYPE_DEFAULT, "(%u) Reaped alarm: %@", (uint8_t *)v9, 0x12u);

  }
}

void __71__COMeshAlarmAddOn_reapNonRepeatingAlarmsOlderThanDate_accessory_home___block_invoke_246(uint64_t a1)
{
  NSObject *v2;
  int v3;
  _DWORD v4[2];
  uint64_t v5;

  v5 = *MEMORY[0x24BDAC8D0];
  COCoreLogForCategory(2);
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    v3 = *(_DWORD *)(a1 + 32);
    v4[0] = 67109120;
    v4[1] = v3;
    _os_log_impl(&dword_215E92000, v2, OS_LOG_TYPE_DEFAULT, "(%u) Alarm reap complete.", (uint8_t *)v4, 8u);
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
  COMeshAlarmAddOn *v55;
  __int16 v56;
  void *v57;
  _BYTE v58[128];
  uint64_t v59;

  v59 = *MEMORY[0x24BDAC8D0];
  v5 = a4;
  -[COMeshAlarmAddOn members](self, "members");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(v6, "mutableCopy");

  objc_msgSend(v7, "minusSet:", v5);
  -[COMeshAlarmAddOn setMembers:](self, "setMembers:", v5);
  -[COMeshAlarmAddOn interests](self, "interests");
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
    -[COMeshAlarmAddOn interests](self, "interests");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = (void *)objc_msgSend(v17, "mutableCopy");

    objc_msgSend(v18, "removeObjectsForKeys:", v10);
    -[COMeshAlarmAddOn setInterests:](self, "setInterests:", v18);
    COCoreLogForCategory(2);
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

        -[COMeshAlarmAddOn ourInterests](self, "ourInterests");
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
        -[COMeshAlarmAddOn ourInterests](self, "ourInterests");
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

  -[COMeshAlarmAddOn delegate](self, "delegate");
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v38, "didChangeCompositionForAlarmAddOn:", self);

}

- (void)director:(id)a3 performAction:(id)a4 from:(id)a5 callback:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  void *v14;
  COAlarmCreateRequest *v15;
  void *v16;
  COAlarmUpdateRequest *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  COAlarmReadRequest *v23;
  COAlarmUpdateRequest *v24;
  void *v25;
  void *v26;
  COMTResult *v27;
  COMTResult *v28;
  _QWORD v29[4];
  id v30;
  id v31;
  _QWORD v32[4];
  id v33;
  id v34;
  _QWORD v35[4];
  id v36;
  id v37;
  id v38;
  id location;
  _QWORD v40[4];
  id v41;
  id v42;

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
      v17 = (COAlarmUpdateRequest *)v11;
      -[COAlarmUpdateRequest memento](v17, "memento");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "uniqueIdentifier");
      v20 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v20)
      {
        -[COMeshAlarmAddOn homekit](self, "homekit");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v21, "currentAccessory");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v22, "uniqueIdentifier");
        v20 = (void *)objc_claimAutoreleasedReturnValue();

      }
      v23 = -[COAlarmReadRequest initWithAccessoryUniqueIdentifier:]([COAlarmReadRequest alloc], "initWithAccessoryUniqueIdentifier:", v20);
      objc_initWeak(&location, self);
      v35[0] = MEMORY[0x24BDAC760];
      v35[1] = 3221225472;
      v35[2] = __57__COMeshAlarmAddOn_director_performAction_from_callback___block_invoke_2;
      v35[3] = &unk_24D4B2608;
      v37 = v13;
      objc_copyWeak(&v38, &location);
      v36 = v14;
      -[COMeshAlarmAddOn handleAlarmReadRequest:callback:](self, "handleAlarmReadRequest:callback:", v23, v35);

      objc_destroyWeak(&v38);
      objc_destroyWeak(&location);
    }
    else
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v24 = [COAlarmUpdateRequest alloc];
        objc_msgSend(v11, "alarm");
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        v17 = -[COAlarmRequest initWithAlarm:](v24, "initWithAlarm:", v25);

        v32[0] = MEMORY[0x24BDAC760];
        v32[1] = 3221225472;
        v32[2] = __57__COMeshAlarmAddOn_director_performAction_from_callback___block_invoke_3;
        v32[3] = &unk_24D4B25E0;
        v33 = v14;
        v34 = v13;
        -[COMeshAlarmAddOn handleAlarmUpdateRequest:callback:](self, "handleAlarmUpdateRequest:callback:", v17, v32);

        v18 = v33;
        goto LABEL_3;
      }
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        objc_msgSend(v11, "targetIdentifier");
        v17 = (COAlarmUpdateRequest *)objc_claimAutoreleasedReturnValue();
        v20 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BE67818]), "initWithIdentifier:", v17);
        v23 = -[COAlarmRequest initWithAlarm:]([COAlarmDeleteRequest alloc], "initWithAlarm:", v20);
        v29[0] = MEMORY[0x24BDAC760];
        v29[1] = 3221225472;
        v29[2] = __57__COMeshAlarmAddOn_director_performAction_from_callback___block_invoke_4;
        v29[3] = &unk_24D4B25E0;
        v30 = v14;
        v31 = v13;
        -[COMeshAlarmAddOn handleAlarmDeleteRequest:callback:](self, "handleAlarmDeleteRequest:callback:", v23, v29);

      }
      else
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          -[COMeshAlarmAddOn interests](self, "interests");
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          v17 = (COAlarmUpdateRequest *)objc_msgSend(v26, "mutableCopy");

          objc_msgSend(v11, "targetIdentifiers");
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          if (objc_msgSend(v20, "count"))
            -[COAlarmUpdateRequest setObject:forKey:](v17, "setObject:forKey:", v20, v12);
          else
            -[COAlarmUpdateRequest removeObjectForKey:](v17, "removeObjectForKey:", v12);
          -[COMeshAlarmAddOn setInterests:](self, "setInterests:", v17);
          v27 = -[COMTResult initWithActionIdentifier:]([COMTResult alloc], "initWithActionIdentifier:", v14);
          (*((void (**)(id, COMTResult *, _QWORD))v13 + 2))(v13, v27, 0);

          goto LABEL_13;
        }
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
          goto LABEL_15;
        -[COMeshAlarmAddOn delegate](self, "delegate");
        v17 = (COAlarmUpdateRequest *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "reason");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "alarms");
        v23 = (COAlarmReadRequest *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v20, "isEqual:", *MEMORY[0x24BE67768])
          && (objc_opt_respondsToSelector() & 1) != 0)
        {
          -[COAlarmUpdateRequest alarmAddOn:didAddAlarms:](v17, "alarmAddOn:didAddAlarms:", self, v23);
        }
        else if (objc_msgSend(v20, "isEqual:", *MEMORY[0x24BE67780])
               && (objc_opt_respondsToSelector() & 1) != 0)
        {
          -[COAlarmUpdateRequest alarmAddOn:didRemoveAlarms:](v17, "alarmAddOn:didRemoveAlarms:", self, v23);
        }
        else if (objc_msgSend(v20, "isEqual:", *MEMORY[0x24BE67788])
               && (objc_opt_respondsToSelector() & 1) != 0)
        {
          -[COAlarmUpdateRequest alarmAddOn:didUpdateAlarms:](v17, "alarmAddOn:didUpdateAlarms:", self, v23);
        }
        v28 = -[COMTResult initWithActionIdentifier:]([COMTResult alloc], "initWithActionIdentifier:", v14);
        (*((void (**)(id, COMTResult *, _QWORD))v13 + 2))(v13, v28, 0);

      }
    }

LABEL_13:
    goto LABEL_14;
  }
  v15 = [COAlarmCreateRequest alloc];
  objc_msgSend(v11, "alarm");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = -[COAlarmRequest initWithAlarm:](v15, "initWithAlarm:", v16);

  v40[0] = MEMORY[0x24BDAC760];
  v40[1] = 3221225472;
  v40[2] = __57__COMeshAlarmAddOn_director_performAction_from_callback___block_invoke;
  v40[3] = &unk_24D4B25E0;
  v41 = v14;
  v42 = v13;
  -[COMeshAlarmAddOn handleAlarmCreateRequest:callback:](self, "handleAlarmCreateRequest:callback:", v17, v40);

  v18 = v41;
LABEL_3:

LABEL_14:
LABEL_15:

}

void __57__COMeshAlarmAddOn_director_performAction_from_callback___block_invoke(uint64_t a1, void *a2, void *a3)
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

void __57__COMeshAlarmAddOn_director_performAction_from_callback___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id WeakRetained;
  COMTAlarmReadResult *v7;
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
      objc_msgSend(v8, "alarms");
      v5 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v5 = (id)MEMORY[0x24BDBD1A8];
    }
    WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
    if (WeakRetained)
    {
      v7 = -[COMTAlarmReadResult initWithAlarms:actionIdentifier:]([COMTAlarmReadResult alloc], "initWithAlarms:actionIdentifier:", v5, *(_QWORD *)(a1 + 32));
      (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

    }
  }

}

void __57__COMeshAlarmAddOn_director_performAction_from_callback___block_invoke_3(uint64_t a1, void *a2, void *a3)
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

void __57__COMeshAlarmAddOn_director_performAction_from_callback___block_invoke_4(uint64_t a1, void *a2, void *a3)
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

- (MTAlarmManager)alarmManager
{
  return self->_alarmManager;
}

- (id)mediaSystemUpdateRegistration
{
  return self->_mediaSystemUpdateRegistration;
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

- (OS_dispatch_source)reaper
{
  return self->_reaper;
}

- (NSMutableDictionary)alarmIndex
{
  return self->_alarmIndex;
}

- (void)setAlarmIndex:(id)a3
{
  objc_storeStrong((id *)&self->_alarmIndex, a3);
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
  objc_setProperty_nonatomic_copy(self, a2, a3, 120);
}

- (NSArray)mergingNodes
{
  return self->_mergingNodes;
}

- (void)setMergingNodes:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 128);
}

- (COAlarmReadRequest)mergeRequest
{
  return self->_mergeRequest;
}

- (void)setMergeRequest:(id)a3
{
  objc_storeStrong((id *)&self->_mergeRequest, a3);
}

- (NSArray)mergeAlarms
{
  return self->_mergeAlarms;
}

- (void)setMergeAlarms:(id)a3
{
  objc_storeStrong((id *)&self->_mergeAlarms, a3);
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
  objc_setProperty_nonatomic_copy(self, a2, a3, 160);
}

- (MTAlarmManager)observedAlarmManager
{
  return self->_observedAlarmManager;
}

- (id)recorder
{
  return self->_recorder;
}

- (void)setRecorder:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 176);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_recorder, 0);
  objc_storeStrong((id *)&self->_observedAlarmManager, 0);
  objc_storeStrong((id *)&self->_queuedCommands, 0);
  objc_storeStrong((id *)&self->_mergeResponses, 0);
  objc_storeStrong((id *)&self->_mergeAlarms, 0);
  objc_storeStrong((id *)&self->_mergeRequest, 0);
  objc_storeStrong((id *)&self->_mergingNodes, 0);
  objc_storeStrong((id *)&self->_deletes, 0);
  objc_storeStrong((id *)&self->_homehub, 0);
  objc_storeStrong((id *)&self->_homekit, 0);
  objc_storeStrong((id *)&self->_alarmIndex, 0);
  objc_storeStrong((id *)&self->_reaper, 0);
  objc_storeStrong((id *)&self->_actionDirector, 0);
  objc_storeStrong((id *)&self->_ourInterests, 0);
  objc_storeStrong((id *)&self->_interests, 0);
  objc_storeStrong((id *)&self->_members, 0);
  objc_storeStrong(&self->_mediaSystemUpdateRegistration, 0);
  objc_storeStrong((id *)&self->_alarmManager, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

- (void)didChangeNodesForMeshController:.cold.1()
{
  NSObject *v0;
  uint8_t v1[24];
  uint64_t v2;

  v2 = *MEMORY[0x24BDAC8D0];
  OUTLINED_FUNCTION_3_1();
  OUTLINED_FUNCTION_9(&dword_215E92000, v0, (uint64_t)v0, "%p merge %p lost final nodes", v1);
  OUTLINED_FUNCTION_2_0();
}

void __46__COMeshAlarmAddOn__broadcastMerge_withTruth___block_invoke_2_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  id v2;
  void *v3;
  uint64_t v4;
  int v5;
  void *v6;
  __int16 v7;
  uint64_t v8;
  uint64_t v9;

  OUTLINED_FUNCTION_14();
  v9 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(v2, "meshController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = 134218240;
  v6 = v3;
  v7 = 2048;
  v8 = v1;
  OUTLINED_FUNCTION_9(&dword_215E92000, v0, v4, "%p merge %p received an error on the last node", (uint8_t *)&v5);

  OUTLINED_FUNCTION_11();
}

- (void)_continueMerge:withResponse:fromNode:.cold.1()
{
  NSObject *v0;
  uint8_t v1[24];
  uint64_t v2;

  v2 = *MEMORY[0x24BDAC8D0];
  OUTLINED_FUNCTION_3_1();
  OUTLINED_FUNCTION_9(&dword_215E92000, v0, (uint64_t)v0, "%p merge %p received last response", v1);
  OUTLINED_FUNCTION_2_0();
}

- (void)_finishMerge:.cold.1()
{
  NSObject *v0;
  id v1;
  void *v2;
  uint64_t v3;
  uint8_t v4[24];
  uint64_t v5;

  OUTLINED_FUNCTION_14();
  v5 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(v1, "meshController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_9_1();
  OUTLINED_FUNCTION_9(&dword_215E92000, v0, v3, "%p truth is %@", v4);

  OUTLINED_FUNCTION_11();
}

- (void)_finishMerge:.cold.2()
{
  NSObject *v0;
  id v1;
  void *v2;
  uint64_t v3;
  uint8_t v4[24];
  uint64_t v5;

  OUTLINED_FUNCTION_14();
  v5 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(v1, "meshController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_9_1();
  OUTLINED_FUNCTION_9(&dword_215E92000, v0, v3, "%p deletes is %@", v4);

  OUTLINED_FUNCTION_11();
}

void __47__COMeshAlarmAddOn__reloadIndexWithCompletion___block_invoke_cold_1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_19();
  OUTLINED_FUNCTION_0_0(&dword_215E92000, v0, v1, "%p failed to fetch alarms for index: %{public}@");
  OUTLINED_FUNCTION_2_0();
}

- (void)_alarmManagerAlarmFired:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_7(&dword_215E92000, v0, v1, "%p has no updates for synchronization.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2_0();
}

- (void)_alarmManagerAlarmFired:.cold.3()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_7(&dword_215E92000, v0, v1, "%p alarm firing, but need to synchronize...", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2_0();
}

- (void)_alarmManagerAlarmFired:.cold.4()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_7(&dword_215E92000, v0, v1, "%p is solo, so it will write.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2_0();
}

- (void)_alarmManagerAlarmFired:(uint64_t)a1 .cold.5(uint64_t a1)
{
  NSObject *v1;
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x24BDAC8D0];
  v2 = 134218242;
  v3 = a1;
  OUTLINED_FUNCTION_7_3();
  OUTLINED_FUNCTION_9(&dword_215E92000, v1, (uint64_t)v1, "%p will not write because %@ is lower", (uint8_t *)&v2);
  OUTLINED_FUNCTION_2_0();
}

void __44__COMeshAlarmAddOn__alarmManagerAlarmFired___block_invoke_2_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  void *v4;
  __int16 v5;
  uint64_t v6;
  int v7;
  uint64_t v8;
  __int16 v9;
  uint64_t v10;
  uint64_t v11;

  OUTLINED_FUNCTION_14();
  v11 = *MEMORY[0x24BDAC8D0];
  v3 = *(_QWORD *)(v2 + 48);
  objc_msgSend(*(id *)(v2 + 40), "alarmID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = 134218498;
  v8 = v3;
  OUTLINED_FUNCTION_11_1();
  v9 = v5;
  v10 = v1;
  OUTLINED_FUNCTION_18(&dword_215E92000, v0, v6, "%p failed locally updating %@ (%@)", (uint8_t *)&v7);

  OUTLINED_FUNCTION_8();
}

- (void)_filteredAlarmsList:forAccessory:.cold.1()
{
  NSObject *v0;
  id v1;
  void *v2;
  uint64_t v3;
  uint8_t v4[24];
  uint64_t v5;

  OUTLINED_FUNCTION_14();
  v5 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(v1, "meshController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_9_1();
  OUTLINED_FUNCTION_9(&dword_215E92000, v0, v3, "%p filtering %@", v4);

  OUTLINED_FUNCTION_11();
}

void __84__COMeshAlarmAddOn__alarmsForAccessory_allowLocalStorage_usingLeader_member_client___block_invoke_154_cold_1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0_0(&dword_215E92000, v0, v1, "%p specified accessory (%@) was not found in order to filter local alarms!");
  OUTLINED_FUNCTION_2_0();
}

void __84__COMeshAlarmAddOn__alarmsForAccessory_allowLocalStorage_usingLeader_member_client___block_invoke_154_cold_2()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0_0(&dword_215E92000, v0, v1, "%p local alarms list failed (%@)");
  OUTLINED_FUNCTION_2_0();
}

void __84__COMeshAlarmAddOn__alarmsForAccessory_allowLocalStorage_usingLeader_member_client___block_invoke_158_cold_1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_17(*MEMORY[0x24BDAC8D0]);
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0_0(&dword_215E92000, v0, v1, "%p specified accessory (%@) was not found in order to filter alarms!");
  OUTLINED_FUNCTION_2_0();
}

void __84__COMeshAlarmAddOn__alarmsForAccessory_allowLocalStorage_usingLeader_member_client___block_invoke_158_cold_2()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_17(*MEMORY[0x24BDAC8D0]);
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0_0(&dword_215E92000, v0, v1, "%p alarms list from leader failed (%@)");
  OUTLINED_FUNCTION_2_0();
}

void __84__COMeshAlarmAddOn__alarmsForAccessory_allowLocalStorage_usingLeader_member_client___block_invoke_161_cold_1()
{
  __int16 v0;
  uint64_t v1;
  NSObject *v2;
  uint8_t v3[22];
  __int16 v4;
  uint64_t v5;

  OUTLINED_FUNCTION_20_0(*MEMORY[0x24BDAC8D0]);
  OUTLINED_FUNCTION_3();
  v4 = v0;
  v5 = v1;
  OUTLINED_FUNCTION_18(&dword_215E92000, v2, (uint64_t)v2, "%p failed to retrieve MT alarms [Error %@] - using list from leader: %@", v3);
  OUTLINED_FUNCTION_6_1();
}

- (void)_isAlarm:(void *)a1 targetingAccessoryIdentifiers:(NSObject *)a2 .cold.1(void *a1, NSObject *a2)
{
  void *v3;
  uint64_t v4;
  uint8_t v5[24];
  uint64_t v6;

  v6 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(a1, "alarmID");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_7_2(&dword_215E92000, a2, v4, "alarm (%@) is not targeting", v5);

  OUTLINED_FUNCTION_6_1();
}

void __53__COMeshAlarmAddOn_snoozeAlarmWithIdentifier_client___block_invoke_2_cold_1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_13_1(*MEMORY[0x24BDAC8D0]);
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0_0(&dword_215E92000, v0, v1, "%p direct snooze failed (%@)");
  OUTLINED_FUNCTION_2_0();
}

- (void)handleAlarmReadRequest:callback:.cold.1()
{
  NSObject *v0;
  id v1;
  void *v2;
  uint64_t v3;
  uint8_t v4[24];
  uint64_t v5;

  OUTLINED_FUNCTION_14();
  v5 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(v1, "meshController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_9_1();
  OUTLINED_FUNCTION_4(&dword_215E92000, v0, v3, "%p read did not find (%@)", v4);

  OUTLINED_FUNCTION_11();
}

void __52__COMeshAlarmAddOn_handleAlarmReadRequest_callback___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_0(&dword_215E92000, v0, v1, "... alarms list failed (%@)", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2_0();
}

- (void)handleAlarmCreateRequest:(uint64_t)a1 callback:.cold.1(uint64_t a1)
{
  uint64_t v1;
  os_log_t v2;
  __int128 v3;

  LODWORD(v3) = 134218242;
  *(_QWORD *)((char *)&v3 + 4) = a1;
  OUTLINED_FUNCTION_7_3();
  OUTLINED_FUNCTION_0_0(&dword_215E92000, v1, v2, "%p did not find accessories for %@", (_QWORD)v3, DWORD2(v3));
  OUTLINED_FUNCTION_2_0();
}

void __54__COMeshAlarmAddOn_handleAlarmCreateRequest_callback___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  void *v2;
  uint64_t v3;
  uint8_t v4[24];
  uint64_t v5;

  OUTLINED_FUNCTION_14();
  v5 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(*(id *)(v1 + 32), "alarmID");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_9_1();
  OUTLINED_FUNCTION_4(&dword_215E92000, v0, v3, "... alarm (%@) create failed (%@)", v4);

  OUTLINED_FUNCTION_11();
}

void __54__COMeshAlarmAddOn_handleAlarmCreateRequest_callback___block_invoke_188_cold_1(uint64_t a1, id *a2, NSObject *a3)
{
  uint64_t v4;
  void *v5;
  uint64_t v6;
  int v7;
  uint64_t v8;
  uint64_t v9;

  v9 = *MEMORY[0x24BDAC8D0];
  v4 = *(_QWORD *)(a1 + 40);
  objc_msgSend(*a2, "alarmID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = 134218242;
  v8 = v4;
  OUTLINED_FUNCTION_11_1();
  OUTLINED_FUNCTION_9(&dword_215E92000, a3, v6, "%p forwarding creation of %@ to the mesh", (uint8_t *)&v7);

  OUTLINED_FUNCTION_11();
}

- (void)handleAlarmUpdateRequest:(uint64_t)a1 callback:.cold.1(uint64_t a1)
{
  uint64_t v1;
  os_log_t v2;
  __int128 v3;

  LODWORD(v3) = 134218242;
  *(_QWORD *)((char *)&v3 + 4) = a1;
  OUTLINED_FUNCTION_7_3();
  OUTLINED_FUNCTION_0_0(&dword_215E92000, v1, v2, "%p update did not find accessories for %@", (_QWORD)v3, DWORD2(v3));
  OUTLINED_FUNCTION_2_0();
}

void __54__COMeshAlarmAddOn_handleAlarmUpdateRequest_callback___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  void *v2;
  uint64_t v3;
  uint8_t v4[24];
  uint64_t v5;

  OUTLINED_FUNCTION_14();
  v5 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(*(id *)(v1 + 32), "alarmID");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_9_1();
  OUTLINED_FUNCTION_4(&dword_215E92000, v0, v3, "... alarm (%@) update failed (%@)", v4);

  OUTLINED_FUNCTION_11();
}

void __54__COMeshAlarmAddOn_handleAlarmUpdateRequest_callback___block_invoke_190_cold_1(uint64_t a1, id *a2, NSObject *a3)
{
  uint64_t v4;
  void *v5;
  uint64_t v6;
  int v7;
  uint64_t v8;
  uint64_t v9;

  v9 = *MEMORY[0x24BDAC8D0];
  v4 = *(_QWORD *)(a1 + 40);
  objc_msgSend(*a2, "alarmID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = 134218242;
  v8 = v4;
  OUTLINED_FUNCTION_11_1();
  OUTLINED_FUNCTION_9(&dword_215E92000, a3, v6, "%p forwarding update of %@ to the mesh", (uint8_t *)&v7);

  OUTLINED_FUNCTION_11();
}

void __54__COMeshAlarmAddOn_handleAlarmDeleteRequest_callback___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  void *v2;
  uint64_t v3;
  uint8_t v4[24];
  uint64_t v5;

  OUTLINED_FUNCTION_14();
  v5 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(*(id *)(v1 + 32), "alarmID");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_9_1();
  OUTLINED_FUNCTION_4(&dword_215E92000, v0, v3, "... alarm (%@) delete failed (%@)", v4);

  OUTLINED_FUNCTION_11();
}

void __54__COMeshAlarmAddOn_handleAlarmDeleteRequest_callback___block_invoke_191_cold_1(uint64_t a1, id *a2, NSObject *a3)
{
  uint64_t v4;
  void *v5;
  uint64_t v6;
  int v7;
  uint64_t v8;
  uint64_t v9;

  v9 = *MEMORY[0x24BDAC8D0];
  v4 = *(_QWORD *)(a1 + 48);
  objc_msgSend(*a2, "alarmID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = 134218242;
  v8 = v4;
  OUTLINED_FUNCTION_11_1();
  OUTLINED_FUNCTION_9(&dword_215E92000, a3, v6, "%p forwarding delete of %@ to the mesh", (uint8_t *)&v7);

  OUTLINED_FUNCTION_11();
}

void __54__COMeshAlarmAddOn_handleAlarmSnoozeRequest_callback___block_invoke_cold_1()
{
  NSObject *v0;
  uint8_t v1[24];

  OUTLINED_FUNCTION_13_1(*MEMORY[0x24BDAC8D0]);
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_9(&dword_215E92000, v0, (uint64_t)v0, "%p forwarding snooze of %@ to the mesh", v1);
  OUTLINED_FUNCTION_2_0();
}

void __54__COMeshAlarmAddOn_handleAlarmSnoozeRequest_callback___block_invoke_cold_2()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0_0(&dword_215E92000, v0, v1, "... alarm (%@) snooze failed (%@)");
  OUTLINED_FUNCTION_2_0();
}

void __55__COMeshAlarmAddOn_handleAlarmDismissRequest_callback___block_invoke_cold_1(uint64_t a1, uint64_t a2, NSObject *a3)
{
  uint64_t v4;
  void *v5;
  uint64_t v6;
  int v7;
  uint64_t v8;
  uint64_t v9;

  v9 = *MEMORY[0x24BDAC8D0];
  v4 = *(_QWORD *)(a1 + 32);
  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)a2 + 8) + 40), "alarmID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = 134218242;
  v8 = v4;
  OUTLINED_FUNCTION_11_1();
  OUTLINED_FUNCTION_9(&dword_215E92000, a3, v6, "%p forwarding dismiss of %@ to the mesh", (uint8_t *)&v7);

  OUTLINED_FUNCTION_11();
}

void __55__COMeshAlarmAddOn_handleAlarmDismissRequest_callback___block_invoke_193_cold_1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0_0(&dword_215E92000, v0, v1, "... alarm (%@) dismiss failed (%@)");
  OUTLINED_FUNCTION_2_0();
}

- (void)handleAlarmsAddedNotification:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_7(&dword_215E92000, v0, v1, "%p added alarms without a list of alarms", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2_0();
}

- (void)handleAlarmsRemovedNotification:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_7(&dword_215E92000, v0, v1, "%p removed alarms without a list of alarms", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2_0();
}

- (void)handleAlarmFiringAlarmDismissedNotification:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_7(&dword_215E92000, v0, v1, "%p dismissed alarms without a list of alarms", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2_0();
}

void __50__COMeshAlarmAddOn_handleAlarmSnoozeNotification___block_invoke_cold_1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0_0(&dword_215E92000, v0, v1, "... local snooze of alarm (%@) failed (%@)");
  OUTLINED_FUNCTION_2_0();
}

- (void)handleAlarmManagerStateResetNotification:(void *)a1 .cold.1(void *a1, NSObject *a2)
{
  void *v3;
  uint64_t v4;
  uint8_t v5[24];
  uint64_t v6;

  v6 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(a1, "meshController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_7_2(&dword_215E92000, a2, v4, "%p forwarding alarm manager reset", v5);

  OUTLINED_FUNCTION_6_1();
}

- (void)alarmsAsAccessory:(void *)a1 fromClient:(uint64_t)a2 withCallback:(NSObject *)a3 .cold.1(void *a1, uint64_t a2, NSObject *a3)
{
  void *v5;
  uint64_t v6;
  uint8_t v7[14];
  uint64_t v8;
  uint64_t v9;

  v9 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(a1, "meshController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_19();
  v8 = a2;
  OUTLINED_FUNCTION_9(&dword_215E92000, a3, v6, "%p serving request to get alarms for %{public}@", v7);

  OUTLINED_FUNCTION_11();
}

- (void)alarmsForAccessories:(uint64_t)a1 fromClient:(void *)a2 callback:(NSObject *)a3 .cold.1(uint64_t a1, void *a2, NSObject *a3)
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
  _os_log_debug_impl(&dword_215E92000, a3, OS_LOG_TYPE_DEBUG, "%p serving request to get alarms for %ld:%@", (uint8_t *)&v5, 0x20u);
  OUTLINED_FUNCTION_8();
}

- (void)addAlarm:(NSObject *)a3 asAccessory:fromClient:withCallback:.cold.1(void *a1, void *a2, NSObject *a3)
{
  void *v5;
  void *v6;
  uint64_t v7;
  int v8;
  void *v9;
  uint64_t v10;

  v10 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(a1, "meshController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a2, "alarmID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = 134218242;
  v9 = v5;
  OUTLINED_FUNCTION_11_1();
  OUTLINED_FUNCTION_9(&dword_215E92000, a3, v7, "%p serving request to add alarm %@", (uint8_t *)&v8);

  OUTLINED_FUNCTION_11();
}

- (void)updateAlarm:(NSObject *)a3 asAccessory:fromClient:withCallback:.cold.1(void *a1, void *a2, NSObject *a3)
{
  void *v5;
  void *v6;
  uint64_t v7;
  int v8;
  void *v9;
  uint64_t v10;

  v10 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(a1, "meshController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a2, "alarmID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = 134218242;
  v9 = v5;
  OUTLINED_FUNCTION_11_1();
  OUTLINED_FUNCTION_9(&dword_215E92000, a3, v7, "%p serving request to update alarm %@", (uint8_t *)&v8);

  OUTLINED_FUNCTION_11();
}

- (void)removeAlarm:(NSObject *)a3 asAccessory:fromClient:withCallback:.cold.1(void *a1, void *a2, NSObject *a3)
{
  void *v5;
  void *v6;
  uint64_t v7;
  int v8;
  void *v9;
  uint64_t v10;

  v10 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(a1, "meshController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a2, "alarmID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = 134218242;
  v9 = v5;
  OUTLINED_FUNCTION_11_1();
  OUTLINED_FUNCTION_9(&dword_215E92000, a3, v7, "%p serving request to delete alarm %@", (uint8_t *)&v8);

  OUTLINED_FUNCTION_11();
}

- (void)snoozeAlarmWithIdentifier:(uint64_t)a1 fromClient:withCallback:.cold.1(uint64_t a1)
{
  NSObject *v1;
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x24BDAC8D0];
  v2 = 134218242;
  v3 = a1;
  OUTLINED_FUNCTION_7_3();
  OUTLINED_FUNCTION_9(&dword_215E92000, v1, (uint64_t)v1, "%p serving request to snooze alarm %@", (uint8_t *)&v2);
  OUTLINED_FUNCTION_2_0();
}

void __70__COMeshAlarmAddOn_snoozeAlarmWithIdentifier_fromClient_withCallback___block_invoke_cold_1()
{
  NSObject *v0;
  uint8_t v1[40];

  OUTLINED_FUNCTION_20_0(*MEMORY[0x24BDAC8D0]);
  OUTLINED_FUNCTION_18_0();
  OUTLINED_FUNCTION_18(&dword_215E92000, v0, (uint64_t)v0, "%p failed to snooze alarm %@ (%@)", v1);
  OUTLINED_FUNCTION_6_1();
}

void __70__COMeshAlarmAddOn_snoozeAlarmWithIdentifier_fromClient_withCallback___block_invoke_218_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[24];

  OUTLINED_FUNCTION_20_0(*MEMORY[0x24BDAC8D0]);
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_9(&dword_215E92000, v0, v1, "%p snoozed alarm %@", v2);
  OUTLINED_FUNCTION_2_0();
}

- (void)dismissAlarmWithIdentifier:(uint64_t)a1 fromClient:withCallback:.cold.1(uint64_t a1)
{
  NSObject *v1;
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x24BDAC8D0];
  v2 = 134218242;
  v3 = a1;
  OUTLINED_FUNCTION_7_3();
  OUTLINED_FUNCTION_9(&dword_215E92000, v1, (uint64_t)v1, "%p serving request to dismiss alarm %@", (uint8_t *)&v2);
  OUTLINED_FUNCTION_2_0();
}

void __71__COMeshAlarmAddOn_dismissAlarmWithIdentifier_fromClient_withCallback___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[24];

  OUTLINED_FUNCTION_20_0(*MEMORY[0x24BDAC8D0]);
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_4(&dword_215E92000, v0, v1, "%p trying locally to dismiss alarm %@", v2);
  OUTLINED_FUNCTION_2_0();
}

void __71__COMeshAlarmAddOn_dismissAlarmWithIdentifier_fromClient_withCallback___block_invoke_222_cold_1()
{
  NSObject *v0;
  uint8_t v1[40];

  OUTLINED_FUNCTION_20_0(*MEMORY[0x24BDAC8D0]);
  OUTLINED_FUNCTION_18_0();
  OUTLINED_FUNCTION_18(&dword_215E92000, v0, (uint64_t)v0, "%p failed to dismiss alarm %@ (%@)", v1);
  OUTLINED_FUNCTION_6_1();
}

void __71__COMeshAlarmAddOn_dismissAlarmWithIdentifier_fromClient_withCallback___block_invoke_223_cold_1()
{
  NSObject *v0;
  uint8_t v1[24];

  OUTLINED_FUNCTION_25(*MEMORY[0x24BDAC8D0]);
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_9(&dword_215E92000, v0, (uint64_t)v0, "%p locally dismissed alarm %@", v1);
  OUTLINED_FUNCTION_2_0();
}

void __71__COMeshAlarmAddOn_dismissAlarmWithIdentifier_fromClient_withCallback___block_invoke_2_cold_1(uint64_t a1, void *a2, NSObject *a3)
{
  uint64_t v4;
  void *v5;
  uint64_t v6;
  int v7;
  uint64_t v8;
  uint64_t v9;

  v9 = *MEMORY[0x24BDAC8D0];
  v4 = *(_QWORD *)(a1 + 40);
  objc_msgSend(a2, "alarmID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = 134218242;
  v8 = v4;
  OUTLINED_FUNCTION_11_1();
  OUTLINED_FUNCTION_9(&dword_215E92000, a3, v6, "%p sending dismiss of %@ to the mesh", (uint8_t *)&v7);

  OUTLINED_FUNCTION_11();
}

void __71__COMeshAlarmAddOn_dismissAlarmWithIdentifier_fromClient_withCallback___block_invoke_224_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[24];

  OUTLINED_FUNCTION_20_0(*MEMORY[0x24BDAC8D0]);
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_9(&dword_215E92000, v0, v1, "%p dismissed alarm %@", v2);
  OUTLINED_FUNCTION_2_0();
}

void __60__COMeshAlarmAddOn_canDispatchAsAccessory_asInstance_reply___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_25(*MEMORY[0x24BDAC8D0]);
  OUTLINED_FUNCTION_23();
  OUTLINED_FUNCTION_7(&dword_215E92000, v0, v1, "%p looking for HomePod...", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2_0();
}

void __60__COMeshAlarmAddOn_canDispatchAsAccessory_asInstance_reply___block_invoke_cold_2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_25(*MEMORY[0x24BDAC8D0]);
  OUTLINED_FUNCTION_23();
  OUTLINED_FUNCTION_7(&dword_215E92000, v0, v1, "%p is HomePod.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2_0();
}

void __60__COMeshAlarmAddOn_canDispatchAsAccessory_asInstance_reply___block_invoke_cold_3()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_25(*MEMORY[0x24BDAC8D0]);
  OUTLINED_FUNCTION_23();
  OUTLINED_FUNCTION_7(&dword_215E92000, v0, v1, "%p looking for non-ephemeral node...", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2_0();
}

void __58__COMeshAlarmAddOn_setInterests_asAccessory_withCallback___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_13_1(*MEMORY[0x24BDAC8D0]);
  OUTLINED_FUNCTION_23();
  OUTLINED_FUNCTION_0(&dword_215E92000, v0, v1, "%p cannot set interests, IDS identifier missing", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2_0();
}

void __71__COMeshAlarmAddOn_reapNonRepeatingAlarmsOlderThanDate_accessory_home___block_invoke_2_245_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  int v3;
  void *v4;
  _DWORD v5[2];
  __int16 v6;
  uint64_t v7;
  __int16 v8;
  void *v9;
  uint64_t v10;

  OUTLINED_FUNCTION_14();
  v10 = *MEMORY[0x24BDAC8D0];
  v3 = *(_DWORD *)(v2 + 40);
  objc_msgSend(*(id *)(v2 + 32), "alarmID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5[0] = 67109634;
  v5[1] = v3;
  v6 = 2112;
  v7 = v1;
  v8 = 2112;
  v9 = v4;
  _os_log_error_impl(&dword_215E92000, v0, OS_LOG_TYPE_ERROR, "(%u) Reaped failed (%@) for alarm: %@", (uint8_t *)v5, 0x1Cu);

  OUTLINED_FUNCTION_8();
}

@end
