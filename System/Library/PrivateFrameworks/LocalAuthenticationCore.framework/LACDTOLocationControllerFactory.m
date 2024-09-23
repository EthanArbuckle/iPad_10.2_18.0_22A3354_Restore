@implementation LACDTOLocationControllerFactory

+ (id)controllerWithStore:(id)a3 featureController:(id)a4 eventBus:(id)a5 workQueue:(id)a6
{
  id v9;
  id v10;
  id v11;
  uint64_t v12;
  id v13;
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  id v20;
  id v21;
  id v22;
  id v23;
  void *v24;
  uint64_t v26;
  uint64_t v27;
  LACDTOLocationController *(*v28)(_QWORD *);
  void *v29;
  id v30;
  id v31;
  id v32;
  id v33;
  _QWORD v34[4];
  id v35;
  id v36;
  id v37;
  _QWORD v38[4];
  id v39;
  id v40;
  id v41;

  v9 = a3;
  v10 = a4;
  v11 = a6;
  v12 = MEMORY[0x24BDAC760];
  v38[0] = MEMORY[0x24BDAC760];
  v38[1] = 3221225472;
  v38[2] = __92__LACDTOLocationControllerFactory_controllerWithStore_featureController_eventBus_workQueue___block_invoke;
  v38[3] = &unk_2510C1078;
  v13 = v11;
  v39 = v13;
  v14 = v9;
  v40 = v14;
  v41 = v10;
  v15 = v10;
  v16 = a5;
  __92__LACDTOLocationControllerFactory_controllerWithStore_featureController_eventBus_workQueue___block_invoke((uint64_t)v38);
  v34[0] = v12;
  v34[1] = 3221225472;
  v34[2] = __92__LACDTOLocationControllerFactory_controllerWithStore_featureController_eventBus_workQueue___block_invoke_3;
  v34[3] = &unk_2510C10A0;
  v17 = (id)objc_claimAutoreleasedReturnValue();
  v35 = v17;
  v18 = v14;
  v36 = v18;
  v19 = v13;
  v37 = v19;
  __92__LACDTOLocationControllerFactory_controllerWithStore_featureController_eventBus_workQueue___block_invoke_3(v34);
  v26 = v12;
  v27 = 3221225472;
  v28 = __92__LACDTOLocationControllerFactory_controllerWithStore_featureController_eventBus_workQueue___block_invoke_4;
  v29 = &unk_2510C10C8;
  v30 = v17;
  v31 = v18;
  v32 = (id)objc_claimAutoreleasedReturnValue();
  v33 = v19;
  v20 = v19;
  v21 = v32;
  v22 = v18;
  v23 = v17;
  __92__LACDTOLocationControllerFactory_controllerWithStore_featureController_eventBus_workQueue___block_invoke_4(&v26);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "setEventBus:", v16, v26, v27, v28, v29);

  return v24;
}

LACDTOLocationProviderModeDecorator *__92__LACDTOLocationControllerFactory_controllerWithStore_featureController_eventBus_workQueue___block_invoke(uint64_t a1)
{
  LACDTOLocationProviderModeDecorator *v2;
  void *v3;
  LACDTOLocationProviderModeDecorator *v4;
  uint64_t v6;
  uint64_t v7;
  LACDTOLocationProviderTaskDecorator *(*v8)(uint64_t);
  void *v9;
  id v10;
  id v11;

  v2 = [LACDTOLocationProviderModeDecorator alloc];
  v6 = MEMORY[0x24BDAC760];
  v7 = 3221225472;
  v8 = __92__LACDTOLocationControllerFactory_controllerWithStore_featureController_eventBus_workQueue___block_invoke_2;
  v9 = &unk_2510C1050;
  v10 = *(id *)(a1 + 32);
  v11 = *(id *)(a1 + 40);
  __92__LACDTOLocationControllerFactory_controllerWithStore_featureController_eventBus_workQueue___block_invoke_2((uint64_t)&v6);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = -[LACDTOLocationProviderModeDecorator initWithLocationProvider:featureController:](v2, "initWithLocationProvider:featureController:", v3, *(_QWORD *)(a1 + 48), v6, v7, v8, v9);

  return v4;
}

LACDTOLocationProviderTaskDecorator *__92__LACDTOLocationControllerFactory_controllerWithStore_featureController_eventBus_workQueue___block_invoke_2(uint64_t a1)
{
  LACDTOLocationProviderCRAdapter *v2;
  LACDTOLocationProviderTaskDecorator *v3;

  if (_os_feature_enabled_impl())
  {
    v2 = -[LACDTOLocationProviderCRAdapter initWithWorkQueue:]([LACDTOLocationProviderCRAdapter alloc], "initWithWorkQueue:", *(_QWORD *)(a1 + 32));
    v3 = -[LACDTOLocationProviderTaskDecorator initWithLocationProvider:workQueue:]([LACDTOLocationProviderTaskDecorator alloc], "initWithLocationProvider:workQueue:", v2, *(_QWORD *)(a1 + 32));

  }
  else
  {
    v3 = -[LACDTOLocationProviderKVSAdapter initWithKVStore:]([LACDTOLocationProviderKVSAdapter alloc], "initWithKVStore:", *(_QWORD *)(a1 + 40));
  }
  return v3;
}

LACDTOLocationMonitor *__92__LACDTOLocationControllerFactory_controllerWithStore_featureController_eventBus_workQueue___block_invoke_3(_QWORD *a1)
{
  LACDTOLocationProviderPersistenceDecorator *v2;
  LACDTOLocationMonitor *v3;

  v2 = -[LACDTOLocationProviderPersistenceDecorator initWithLocationProvider:store:cacheEnabled:]([LACDTOLocationProviderPersistenceDecorator alloc], "initWithLocationProvider:store:cacheEnabled:", a1[4], a1[5], 1);
  v3 = -[LACDTOLocationMonitor initWithLocationProvider:workQueue:]([LACDTOLocationMonitor alloc], "initWithLocationProvider:workQueue:", v2, a1[6]);

  return v3;
}

LACDTOLocationController *__92__LACDTOLocationControllerFactory_controllerWithStore_featureController_eventBus_workQueue___block_invoke_4(_QWORD *a1)
{
  LACDTOLocationProviderPersistenceDecorator *v2;
  LACDTOLocationController *v3;

  v2 = -[LACDTOLocationProviderPersistenceDecorator initWithLocationProvider:store:cacheEnabled:]([LACDTOLocationProviderPersistenceDecorator alloc], "initWithLocationProvider:store:cacheEnabled:", a1[4], a1[5], 0);
  v3 = -[LACDTOLocationController initWithLocationProvider:monitor:workQueue:]([LACDTOLocationController alloc], "initWithLocationProvider:monitor:workQueue:", v2, a1[6], a1[7]);

  return v3;
}

@end
