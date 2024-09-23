@implementation HKHealthServicesManager

- (HKHealthServicesManager)initWithHealthStore:(id)a3
{
  id v4;
  HKHealthServicesManager *v5;
  HKTaskServerProxyProvider *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  HKProxyProvider *proxyProvider;
  _HKCBCentralManagerLoader *v11;
  _HKCBCentralManagerLoader *bluetoothManagerLoader;
  objc_super v14;

  v4 = a3;
  v14.receiver = self;
  v14.super_class = (Class)HKHealthServicesManager;
  v5 = -[HKHealthServicesManager init](&v14, sel_init);
  if (v5)
  {
    v6 = [HKTaskServerProxyProvider alloc];
    objc_msgSend((id)objc_opt_class(), "taskIdentifier");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = -[HKTaskServerProxyProvider initWithHealthStore:taskIdentifier:exportedObject:taskUUID:](v6, "initWithHealthStore:taskIdentifier:exportedObject:taskUUID:", v4, v7, v5, v8);
    proxyProvider = v5->_proxyProvider;
    v5->_proxyProvider = (HKProxyProvider *)v9;

    -[HKProxyProvider setShouldRetryOnInterruption:](v5->_proxyProvider, "setShouldRetryOnInterruption:", 0);
    v11 = objc_alloc_init(_HKCBCentralManagerLoader);
    bluetoothManagerLoader = v5->_bluetoothManagerLoader;
    v5->_bluetoothManagerLoader = v11;

  }
  return v5;
}

- (HKHealthServicesManager)initWithWeakHealthStore:(id)a3
{
  HKHealthServicesManager *v3;
  HKHealthServicesManager *v4;

  v3 = -[HKHealthServicesManager initWithHealthStore:](self, "initWithHealthStore:", a3);
  v4 = v3;
  if (v3)
    -[HKProxyProvider referenceSourceWeakly](v3->_proxyProvider, "referenceSourceWeakly");
  return v4;
}

+ (id)taskIdentifier
{
  objc_class *v2;

  v2 = (objc_class *)objc_opt_class();
  return NSStringFromClass(v2);
}

- (void)_fetchHealthServicesServerProxyWithHandler:(id)a3 errorHandler:(id)a4
{
  -[HKProxyProvider fetchProxyWithHandler:errorHandler:](self->_proxyProvider, "fetchProxyWithHandler:errorHandler:", a3, a4);
}

- (void)startBluetoothStatusUpdates:(id)a3
{
  id v5;
  uint64_t v6;
  id v7;
  id v8;
  void *v9;
  _QWORD v10[4];
  id v11;
  _QWORD v12[5];
  id v13;
  _QWORD aBlock[5];
  id v15;

  v5 = a3;
  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("HKHealthServicesManager.m"), 68, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("handler"));

  }
  v6 = MEMORY[0x1E0C809B0];
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __55__HKHealthServicesManager_startBluetoothStatusUpdates___block_invoke;
  aBlock[3] = &unk_1E37E8CD8;
  aBlock[4] = self;
  v15 = v5;
  v7 = v5;
  v12[0] = v6;
  v12[1] = 3221225472;
  v12[2] = __55__HKHealthServicesManager_startBluetoothStatusUpdates___block_invoke_3;
  v12[3] = &unk_1E37F7FF0;
  v12[4] = self;
  v13 = _Block_copy(aBlock);
  v10[0] = v6;
  v10[1] = 3221225472;
  v10[2] = __55__HKHealthServicesManager_startBluetoothStatusUpdates___block_invoke_4;
  v10[3] = &unk_1E37E6B38;
  v11 = v13;
  v8 = v13;
  -[HKHealthServicesManager _fetchHealthServicesServerProxyWithHandler:errorHandler:](self, "_fetchHealthServicesServerProxyWithHandler:errorHandler:", v12, v10);

}

void __55__HKHealthServicesManager_startBluetoothStatusUpdates___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v5;
  NSObject *v6;
  id v7;
  _QWORD block[4];
  id v9;
  id v10;
  uint64_t v11;

  v5 = a3;
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "clientQueue");
  v6 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __55__HKHealthServicesManager_startBluetoothStatusUpdates___block_invoke_2;
  block[3] = &unk_1E37E8CB0;
  v10 = *(id *)(a1 + 40);
  v11 = a2;
  v9 = v5;
  v7 = v5;
  dispatch_async(v6, block);

}

uint64_t __55__HKHealthServicesManager_startBluetoothStatusUpdates___block_invoke_2(_QWORD *a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(a1[5] + 16))(a1[5], a1[6], a1[4]);
}

void __55__HKHealthServicesManager_startBluetoothStatusUpdates___block_invoke_3(uint64_t a1, void *a2)
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  id v7;

  v3 = *(void **)(a1 + 40);
  v7 = a2;
  v4 = objc_msgSend(v3, "copy");
  v5 = *(_QWORD *)(a1 + 32);
  v6 = *(void **)(v5 + 56);
  *(_QWORD *)(v5 + 56) = v4;

  objc_msgSend(v7, "remote_beginBluetoothStatusUpdates:", *(_QWORD *)(a1 + 40));
}

uint64_t __55__HKHealthServicesManager_startBluetoothStatusUpdates___block_invoke_4(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)endBluetoothStatusUpdates
{
  NSObject *v3;
  _QWORD block[5];

  -[HKProxyProvider clientQueue](self->_proxyProvider, "clientQueue");
  v3 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __52__HKHealthServicesManager_endBluetoothStatusUpdates__block_invoke;
  block[3] = &unk_1E37E6770;
  block[4] = self;
  dispatch_async(v3, block);

}

uint64_t __52__HKHealthServicesManager_endBluetoothStatusUpdates__block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;

  v2 = *(_QWORD *)(a1 + 32);
  v3 = *(void **)(v2 + 56);
  *(_QWORD *)(v2 + 56) = 0;

  return objc_msgSend(*(id *)(a1 + 32), "_fetchHealthServicesServerProxyWithHandler:errorHandler:", &__block_literal_global_137, &__block_literal_global_17_1);
}

uint64_t __52__HKHealthServicesManager_endBluetoothStatusUpdates__block_invoke_2(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "remote_endBluetoothStatusUpdates");
}

void __52__HKHealthServicesManager_endBluetoothStatusUpdates__block_invoke_3(uint64_t a1, void *a2)
{
  id v2;
  NSObject *v3;

  v2 = a2;
  _HKInitializeLogging();
  v3 = HKLogServices;
  if (os_log_type_enabled((os_log_t)HKLogServices, OS_LOG_TYPE_ERROR))
    __52__HKHealthServicesManager_endBluetoothStatusUpdates__block_invoke_3_cold_1((uint64_t)v2, v3);

}

- (void)_fetchSupportedServiceIDsWithCompletion:(id)a3
{
  id v5;
  void *v6;
  uint64_t v7;
  id v8;
  void *v9;
  _QWORD v10[4];
  id v11;
  _QWORD v12[4];
  id v13;

  v5 = a3;
  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("HKHealthServicesManager.m"), 96, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("completion"));

  }
  -[HKProxyProvider clientQueueObjectHandlerWithCompletion:](self->_proxyProvider, "clientQueueObjectHandlerWithCompletion:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = MEMORY[0x1E0C809B0];
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __67__HKHealthServicesManager__fetchSupportedServiceIDsWithCompletion___block_invoke;
  v12[3] = &unk_1E37F8078;
  v13 = v6;
  v10[0] = v7;
  v10[1] = 3221225472;
  v10[2] = __67__HKHealthServicesManager__fetchSupportedServiceIDsWithCompletion___block_invoke_2;
  v10[3] = &unk_1E37E6B38;
  v11 = v13;
  v8 = v13;
  -[HKHealthServicesManager _fetchHealthServicesServerProxyWithHandler:errorHandler:](self, "_fetchHealthServicesServerProxyWithHandler:errorHandler:", v12, v10);

}

uint64_t __67__HKHealthServicesManager__fetchSupportedServiceIDsWithCompletion___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "remote_fetchSupportedServiceIDsWithCompletion:", *(_QWORD *)(a1 + 32));
}

uint64_t __67__HKHealthServicesManager__fetchSupportedServiceIDsWithCompletion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)startHealthServiceDiscovery:(id)a3 withHandler:(id)a4
{
  id v7;
  void *v8;
  void *v9;
  id v10;

  v10 = a3;
  v7 = a4;
  if (!v10)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("HKHealthServicesManager.m"), 108, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("discovery"));

    if (v7)
      goto LABEL_3;
LABEL_5:
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("HKHealthServicesManager.m"), 109, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("handler"));

    goto LABEL_3;
  }
  if (!v7)
    goto LABEL_5;
LABEL_3:
  -[HKHealthServicesManager _startHealthServiceExtendedDiscovery:withHandler:](self, "_startHealthServiceExtendedDiscovery:withHandler:", v10, v7);

}

- (id)startAllHealthServicesDiscoveryWithHandler:(id)a3
{
  id v5;
  id v6;
  void *v8;

  v5 = a3;
  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("HKHealthServicesManager.m"), 115, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("handler"));

  }
  v6 = -[HKHealthServiceDiscovery initForAllTypes]([HKHealthServiceDiscovery alloc], "initForAllTypes");
  -[HKHealthServicesManager _startHealthServiceExtendedDiscovery:withHandler:](self, "_startHealthServiceExtendedDiscovery:withHandler:", v6, v5);

  return v6;
}

- (void)_startHealthServiceExtendedDiscovery:(id)a3 withHandler:(id)a4
{
  id v6;
  id v7;
  uint64_t v8;
  id v9;
  id v10;
  _QWORD v11[5];
  id v12;
  _QWORD v13[5];
  id v14;
  id v15;

  v6 = a3;
  v7 = a4;
  v8 = MEMORY[0x1E0C809B0];
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __76__HKHealthServicesManager__startHealthServiceExtendedDiscovery_withHandler___block_invoke;
  v13[3] = &unk_1E37F80F0;
  v13[4] = self;
  v14 = v6;
  v15 = v7;
  v11[0] = v8;
  v11[1] = 3221225472;
  v11[2] = __76__HKHealthServicesManager__startHealthServiceExtendedDiscovery_withHandler___block_invoke_29;
  v11[3] = &unk_1E37E69F8;
  v11[4] = self;
  v12 = v15;
  v9 = v15;
  v10 = v6;
  -[HKHealthServicesManager _fetchHealthServicesServerProxyWithHandler:errorHandler:](self, "_fetchHealthServicesServerProxyWithHandler:errorHandler:", v13, v11);

}

void __76__HKHealthServicesManager__startHealthServiceExtendedDiscovery_withHandler___block_invoke(id *a1, void *a2)
{
  id v3;
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  _QWORD v8[5];
  id v9;
  id v10;

  v3 = a1[4];
  v4 = a2;
  objc_msgSend(v3, "discoveries");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1[4], "setDiscoveries:", v6);

  }
  v7 = objc_msgSend(a1[5], "serviceType");
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __76__HKHealthServicesManager__startHealthServiceExtendedDiscovery_withHandler___block_invoke_2;
  v8[3] = &unk_1E37F80C8;
  v8[4] = a1[4];
  v10 = a1[6];
  v9 = a1[5];
  objc_msgSend(v4, "remote_startHealthServiceDiscovery:withCompletion:", v7, v8);

}

void __76__HKHealthServicesManager__startHealthServiceExtendedDiscovery_withHandler___block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  id v5;
  NSObject *v6;
  uint64_t v7;
  id v8;
  _QWORD block[5];
  id v10;
  id v11;
  id v12;
  uint64_t v13;

  v5 = a3;
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "clientQueue");
  v6 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __76__HKHealthServicesManager__startHealthServiceExtendedDiscovery_withHandler___block_invoke_3;
  block[3] = &unk_1E37F80A0;
  v7 = *(_QWORD *)(a1 + 32);
  v13 = a2;
  block[4] = v7;
  v12 = *(id *)(a1 + 48);
  v10 = v5;
  v11 = *(id *)(a1 + 40);
  v8 = v5;
  dispatch_async(v6, block);

}

void __76__HKHealthServicesManager__startHealthServiceExtendedDiscovery_withHandler___block_invoke_3(uint64_t a1)
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

  if (*(_QWORD *)(a1 + 64))
  {
    objc_msgSend(*(id *)(a1 + 32), "discoveries");
    v3 = (void *)objc_claimAutoreleasedReturnValue();

    if (v3)
    {
      objc_msgSend(*(id *)(a1 + 48), "setDiscoveryIdentifier:", *(_QWORD *)(a1 + 64));
      objc_msgSend(*(id *)(a1 + 48), "setDiscoveryHandler:", *(_QWORD *)(a1 + 56));
      v4 = *(_QWORD *)(a1 + 48);
      objc_msgSend(*(id *)(a1 + 32), "discoveries");
      v10 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", *(_QWORD *)(a1 + 64));
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "setObject:forKeyedSubscript:", v4, v5);

    }
    else
    {
      _HKInitializeLogging();
      if (os_log_type_enabled((os_log_t)HKLogServices, OS_LOG_TYPE_ERROR))
        __76__HKHealthServicesManager__startHealthServiceExtendedDiscovery_withHandler___block_invoke_3_cold_1();
      v6 = *(void **)(a1 + 32);
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", *(_QWORD *)(a1 + 64));
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "_addEndedDiscovery:", v7);

      v8 = *(_QWORD *)(a1 + 56);
      if (v8)
      {
        if (*(_QWORD *)(a1 + 40))
        {
          (*(void (**)(_QWORD, _QWORD, uint64_t))(v8 + 16))(*(_QWORD *)(a1 + 56), 0, 1);
        }
        else
        {
          objc_msgSend(MEMORY[0x1E0CB35C8], "hk_error:description:", 301, CFSTR("Discovery services ended unexpectedly."));
          v9 = (void *)objc_claimAutoreleasedReturnValue();
          (*(void (**)(uint64_t, _QWORD, uint64_t, void *))(v8 + 16))(v8, 0, 1, v9);

        }
      }
    }
  }
  else
  {
    v2 = *(_QWORD *)(a1 + 56);
    if (v2)
      (*(void (**)(uint64_t, _QWORD, uint64_t, _QWORD))(v2 + 16))(v2, 0, 1, *(_QWORD *)(a1 + 40));
  }
}

void __76__HKHealthServicesManager__startHealthServiceExtendedDiscovery_withHandler___block_invoke_29(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  id v5;
  id v6;
  _QWORD v7[4];
  id v8;
  id v9;

  v3 = a2;
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "clientQueue");
  v4 = objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __76__HKHealthServicesManager__startHealthServiceExtendedDiscovery_withHandler___block_invoke_2_30;
  v7[3] = &unk_1E37E6D40;
  v5 = *(id *)(a1 + 40);
  v8 = v3;
  v9 = v5;
  v6 = v3;
  dispatch_async(v4, v7);

}

uint64_t __76__HKHealthServicesManager__startHealthServiceExtendedDiscovery_withHandler___block_invoke_2_30(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 40);
  if (result)
    return (*(uint64_t (**)(uint64_t, _QWORD, uint64_t, _QWORD))(result + 16))(result, 0, 1, *(_QWORD *)(a1 + 32));
  return result;
}

- (void)endHealthServiceDiscovery:(id)a3
{
  id v4;
  uint64_t v5;
  id v6;
  _QWORD v7[5];
  id v8;
  _QWORD v9[5];
  id v10;

  v4 = a3;
  v5 = MEMORY[0x1E0C809B0];
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __53__HKHealthServicesManager_endHealthServiceDiscovery___block_invoke;
  v9[3] = &unk_1E37F8118;
  v9[4] = self;
  v10 = v4;
  v7[0] = v5;
  v7[1] = 3221225472;
  v7[2] = __53__HKHealthServicesManager_endHealthServiceDiscovery___block_invoke_3;
  v7[3] = &unk_1E37F1458;
  v7[4] = self;
  v8 = v10;
  v6 = v10;
  -[HKHealthServicesManager _fetchHealthServicesServerProxyWithHandler:errorHandler:](self, "_fetchHealthServicesServerProxyWithHandler:errorHandler:", v9, v7);

}

void __53__HKHealthServicesManager_endHealthServiceDiscovery___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  id v5;
  _QWORD v6[4];
  id v7;
  id v8;

  v3 = a2;
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "clientQueue");
  v4 = objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __53__HKHealthServicesManager_endHealthServiceDiscovery___block_invoke_2;
  v6[3] = &unk_1E37E6980;
  v7 = *(id *)(a1 + 40);
  v8 = v3;
  v5 = v3;
  dispatch_async(v4, v6);

}

uint64_t __53__HKHealthServicesManager_endHealthServiceDiscovery___block_invoke_2(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(a1 + 32), "discoveryIdentifier");
  if (result)
    return objc_msgSend(*(id *)(a1 + 40), "remote_endHealthServiceDiscovery:", objc_msgSend(*(id *)(a1 + 32), "discoveryIdentifier"));
  return result;
}

void __53__HKHealthServicesManager_endHealthServiceDiscovery___block_invoke_3(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  id v5;
  _QWORD v6[4];
  id v7;
  id v8;

  v3 = a2;
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "clientQueue");
  v4 = objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __53__HKHealthServicesManager_endHealthServiceDiscovery___block_invoke_4;
  v6[3] = &unk_1E37E6980;
  v7 = *(id *)(a1 + 40);
  v8 = v3;
  v5 = v3;
  dispatch_async(v4, v6);

}

void __53__HKHealthServicesManager_endHealthServiceDiscovery___block_invoke_4(uint64_t a1)
{
  void (**v2)(_QWORD, _QWORD, _QWORD, _QWORD);
  id v3;

  objc_msgSend(*(id *)(a1 + 32), "discoveryHandler");
  v2 = (void (**)(_QWORD, _QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
  if (v2)
  {
    v3 = v2;
    v2[2](v2, 0, 1, *(_QWORD *)(a1 + 40));
    v2 = (void (**)(_QWORD, _QWORD, _QWORD, _QWORD))v3;
  }

}

- (id)activeHealthServiceDiscoveries
{
  NSObject *v3;
  id v4;
  _QWORD v6[6];
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  uint64_t (*v10)(uint64_t, uint64_t);
  void (*v11)(uint64_t);
  id v12;

  v7 = 0;
  v8 = &v7;
  v9 = 0x3032000000;
  v10 = __Block_byref_object_copy__61;
  v11 = __Block_byref_object_dispose__61;
  v12 = 0;
  -[HKProxyProvider clientQueue](self->_proxyProvider, "clientQueue");
  v3 = objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __57__HKHealthServicesManager_activeHealthServiceDiscoveries__block_invoke;
  v6[3] = &unk_1E37E6810;
  v6[4] = self;
  v6[5] = &v7;
  dispatch_sync(v3, v6);

  v4 = (id)v8[5];
  _Block_object_dispose(&v7, 8);

  return v4;
}

void __57__HKHealthServicesManager_activeHealthServiceDiscoveries__block_invoke(uint64_t a1)
{
  void *v1;
  uint64_t v3;
  void *v4;
  id v5;

  objc_msgSend(*(id *)(a1 + 32), "discoveries");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v5, "count");
  if (v3)
  {
    objc_msgSend(*(id *)(a1 + 32), "discoveries");
    v1 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v1, "allValues");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v4 = 0;
  }
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), v4);
  if (v3)
  {

  }
}

- (void)startHealthServiceSession:(id)a3 withHandler:(id)a4
{
  id v6;
  id v7;
  void *v8;
  uint64_t v9;
  id v10;
  id v11;
  _QWORD v12[5];
  id v13;
  _QWORD v14[5];
  id v15;
  id v16;

  v6 = a3;
  v7 = a4;
  objc_msgSend(v6, "service");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v8)
  {
    objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99778], CFSTR("HKHealthServiceSession service cannot be nil."));
    if (v7)
      goto LABEL_3;
LABEL_5:
    objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99778], CFSTR("HKHealthServicesSessionHandler cannot be nil."));
    goto LABEL_3;
  }
  if (!v7)
    goto LABEL_5;
LABEL_3:
  v9 = MEMORY[0x1E0C809B0];
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __65__HKHealthServicesManager_startHealthServiceSession_withHandler___block_invoke;
  v14[3] = &unk_1E37F80F0;
  v14[4] = self;
  v15 = v6;
  v16 = v7;
  v12[0] = v9;
  v12[1] = 3221225472;
  v12[2] = __65__HKHealthServicesManager_startHealthServiceSession_withHandler___block_invoke_5;
  v12[3] = &unk_1E37E69F8;
  v12[4] = self;
  v13 = v16;
  v10 = v16;
  v11 = v6;
  -[HKHealthServicesManager _fetchHealthServicesServerProxyWithHandler:errorHandler:](self, "_fetchHealthServicesServerProxyWithHandler:errorHandler:", v14, v12);

}

void __65__HKHealthServicesManager_startHealthServiceSession_withHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  void *v5;
  id v6;
  _QWORD v7[5];
  id v8;
  id v9;
  id v10;

  v3 = a2;
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "clientQueue");
  v4 = objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __65__HKHealthServicesManager_startHealthServiceSession_withHandler___block_invoke_2;
  v7[3] = &unk_1E37E68A0;
  v5 = *(void **)(a1 + 40);
  v7[4] = *(_QWORD *)(a1 + 32);
  v8 = v3;
  v9 = v5;
  v10 = *(id *)(a1 + 48);
  v6 = v3;
  dispatch_async(v4, v7);

}

void __65__HKHealthServicesManager_startHealthServiceSession_withHandler___block_invoke_2(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  _QWORD v6[5];
  id v7;
  id v8;

  objc_msgSend(*(id *)(a1 + 32), "sessions");
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v2)
  {
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "setSessions:", v3);

  }
  v4 = *(void **)(a1 + 40);
  objc_msgSend(*(id *)(a1 + 48), "service");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __65__HKHealthServicesManager_startHealthServiceSession_withHandler___block_invoke_3;
  v6[3] = &unk_1E37F80C8;
  v6[4] = *(_QWORD *)(a1 + 32);
  v8 = *(id *)(a1 + 56);
  v7 = *(id *)(a1 + 48);
  objc_msgSend(v4, "remote_startHealthServiceSession:withCompletion:", v5, v6);

}

void __65__HKHealthServicesManager_startHealthServiceSession_withHandler___block_invoke_3(uint64_t a1, uint64_t a2, void *a3)
{
  id v5;
  NSObject *v6;
  uint64_t v7;
  id v8;
  _QWORD block[5];
  id v10;
  id v11;
  id v12;
  uint64_t v13;

  v5 = a3;
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "clientQueue");
  v6 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __65__HKHealthServicesManager_startHealthServiceSession_withHandler___block_invoke_4;
  block[3] = &unk_1E37F80A0;
  v7 = *(_QWORD *)(a1 + 32);
  v13 = a2;
  block[4] = v7;
  v12 = *(id *)(a1 + 48);
  v10 = v5;
  v11 = *(id *)(a1 + 40);
  v8 = v5;
  dispatch_async(v6, block);

}

void __65__HKHealthServicesManager_startHealthServiceSession_withHandler___block_invoke_4(uint64_t a1)
{
  void (*v2)(void);
  void *v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  id v10;

  if (!*(_QWORD *)(a1 + 64))
  {
    objc_msgSend(*(id *)(a1 + 40), "code");
    v2 = *(void (**)(void))(*(_QWORD *)(a1 + 56) + 16);
LABEL_3:
    v2();
    return;
  }
  objc_msgSend(*(id *)(a1 + 32), "sessions");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  v4 = *(_QWORD *)(a1 + 64);
  if (v3)
  {
    objc_msgSend(*(id *)(a1 + 48), "setSessionIdentifier:", v4);
    objc_msgSend(*(id *)(a1 + 48), "setSessionHandler:", *(_QWORD *)(a1 + 56));
    v5 = *(_QWORD *)(a1 + 48);
    objc_msgSend(*(id *)(a1 + 32), "sessions");
    v10 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", *(_QWORD *)(a1 + 64));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setObject:forKeyedSubscript:", v5, v6);

LABEL_6:
    return;
  }
  v7 = *(void **)(a1 + 32);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "_addEndedSession:", v8);

  v9 = *(_QWORD *)(a1 + 56);
  if (v9)
  {
    if (*(_QWORD *)(a1 + 40))
    {
      v2 = *(void (**)(void))(v9 + 16);
      goto LABEL_3;
    }
    objc_msgSend(MEMORY[0x1E0CB35C8], "hk_error:description:", 100, CFSTR("Service session ended unexpectedly."));
    v10 = (id)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, _QWORD, uint64_t, id))(v9 + 16))(v9, 0, 1, v10);
    goto LABEL_6;
  }
}

void __65__HKHealthServicesManager_startHealthServiceSession_withHandler___block_invoke_5(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  id v5;
  id v6;
  _QWORD v7[4];
  id v8;
  id v9;

  v3 = a2;
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "clientQueue");
  v4 = objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __65__HKHealthServicesManager_startHealthServiceSession_withHandler___block_invoke_6;
  v7[3] = &unk_1E37E6D40;
  v5 = *(id *)(a1 + 40);
  v8 = v3;
  v9 = v5;
  v6 = v3;
  dispatch_async(v4, v7);

}

uint64_t __65__HKHealthServicesManager_startHealthServiceSession_withHandler___block_invoke_6(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, uint64_t, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), 0, 1, *(_QWORD *)(a1 + 32));
}

- (void)endHealthServiceSession:(id)a3
{
  id v4;
  uint64_t v5;
  id v6;
  _QWORD v7[5];
  id v8;
  _QWORD v9[5];
  id v10;

  v4 = a3;
  v5 = MEMORY[0x1E0C809B0];
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __51__HKHealthServicesManager_endHealthServiceSession___block_invoke;
  v9[3] = &unk_1E37F8118;
  v9[4] = self;
  v10 = v4;
  v7[0] = v5;
  v7[1] = 3221225472;
  v7[2] = __51__HKHealthServicesManager_endHealthServiceSession___block_invoke_3;
  v7[3] = &unk_1E37F1458;
  v7[4] = self;
  v8 = v10;
  v6 = v10;
  -[HKHealthServicesManager _fetchHealthServicesServerProxyWithHandler:errorHandler:](self, "_fetchHealthServicesServerProxyWithHandler:errorHandler:", v9, v7);

}

void __51__HKHealthServicesManager_endHealthServiceSession___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  id v5;
  _QWORD v6[4];
  id v7;
  id v8;

  v3 = a2;
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "clientQueue");
  v4 = objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __51__HKHealthServicesManager_endHealthServiceSession___block_invoke_2;
  v6[3] = &unk_1E37E6980;
  v7 = v3;
  v8 = *(id *)(a1 + 40);
  v5 = v3;
  dispatch_async(v4, v6);

}

uint64_t __51__HKHealthServicesManager_endHealthServiceSession___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "remote_endHealthServiceSession:", objc_msgSend(*(id *)(a1 + 40), "sessionIdentifier"));
}

void __51__HKHealthServicesManager_endHealthServiceSession___block_invoke_3(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  id v5;
  _QWORD v6[4];
  id v7;
  id v8;

  v3 = a2;
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "clientQueue");
  v4 = objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __51__HKHealthServicesManager_endHealthServiceSession___block_invoke_4;
  v6[3] = &unk_1E37E6980;
  v7 = *(id *)(a1 + 40);
  v8 = v3;
  v5 = v3;
  dispatch_async(v4, v6);

}

void __51__HKHealthServicesManager_endHealthServiceSession___block_invoke_4(uint64_t a1)
{
  void (**v2)(_QWORD, _QWORD, _QWORD, _QWORD);
  id v3;

  objc_msgSend(*(id *)(a1 + 32), "sessionHandler");
  v2 = (void (**)(_QWORD, _QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
  if (v2)
  {
    v3 = v2;
    v2[2](v2, 0, 1, *(_QWORD *)(a1 + 40));
    v2 = (void (**)(_QWORD, _QWORD, _QWORD, _QWORD))v3;
  }

}

- (id)activeHealthServiceSessions
{
  NSObject *v3;
  id v4;
  _QWORD v6[6];
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  uint64_t (*v10)(uint64_t, uint64_t);
  void (*v11)(uint64_t);
  id v12;

  v7 = 0;
  v8 = &v7;
  v9 = 0x3032000000;
  v10 = __Block_byref_object_copy__61;
  v11 = __Block_byref_object_dispose__61;
  v12 = 0;
  -[HKProxyProvider clientQueue](self->_proxyProvider, "clientQueue");
  v3 = objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __54__HKHealthServicesManager_activeHealthServiceSessions__block_invoke;
  v6[3] = &unk_1E37E6810;
  v6[4] = self;
  v6[5] = &v7;
  dispatch_sync(v3, v6);

  v4 = (id)v8[5];
  _Block_object_dispose(&v7, 8);

  return v4;
}

void __54__HKHealthServicesManager_activeHealthServiceSessions__block_invoke(uint64_t a1)
{
  void *v1;
  uint64_t v3;
  void *v4;
  id v5;

  objc_msgSend(*(id *)(a1 + 32), "sessions");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v5, "count");
  if (v3)
  {
    objc_msgSend(*(id *)(a1 + 32), "sessions");
    v1 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v1, "allValues");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v4 = 0;
  }
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), v4);
  if (v3)
  {

  }
}

- (void)healthServicePairingsWithHandler:(id)a3
{
  id v5;
  void *v6;
  uint64_t v7;
  id v8;
  void *v9;
  _QWORD v10[4];
  id v11;
  _QWORD v12[4];
  id v13;

  v5 = a3;
  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("HKHealthServicesManager.m"), 248, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("handler != nil"));

  }
  -[HKProxyProvider clientQueueObjectHandlerWithCompletion:](self->_proxyProvider, "clientQueueObjectHandlerWithCompletion:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = MEMORY[0x1E0C809B0];
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __60__HKHealthServicesManager_healthServicePairingsWithHandler___block_invoke;
  v12[3] = &unk_1E37F8078;
  v13 = v6;
  v10[0] = v7;
  v10[1] = 3221225472;
  v10[2] = __60__HKHealthServicesManager_healthServicePairingsWithHandler___block_invoke_2;
  v10[3] = &unk_1E37E6B38;
  v11 = v13;
  v8 = v13;
  -[HKHealthServicesManager _fetchHealthServicesServerProxyWithHandler:errorHandler:](self, "_fetchHealthServicesServerProxyWithHandler:errorHandler:", v12, v10);

}

uint64_t __60__HKHealthServicesManager_healthServicePairingsWithHandler___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "remote_getHealthPeripheralsWithFilter:handler:", 0, *(_QWORD *)(a1 + 32));
}

uint64_t __60__HKHealthServicesManager_healthServicePairingsWithHandler___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)healthPeripheralsWithFilter:(unint64_t)a3 handler:(id)a4
{
  id v7;
  void *v8;
  uint64_t v9;
  id v10;
  void *v11;
  _QWORD v12[4];
  id v13;
  _QWORD v14[4];
  id v15;
  unint64_t v16;

  v7 = a4;
  if (!v7)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("HKHealthServicesManager.m"), 261, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("handler != nil"));

  }
  -[HKProxyProvider clientQueueObjectHandlerWithCompletion:](self->_proxyProvider, "clientQueueObjectHandlerWithCompletion:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = MEMORY[0x1E0C809B0];
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __63__HKHealthServicesManager_healthPeripheralsWithFilter_handler___block_invoke;
  v14[3] = &unk_1E37F8140;
  v16 = a3;
  v15 = v8;
  v12[0] = v9;
  v12[1] = 3221225472;
  v12[2] = __63__HKHealthServicesManager_healthPeripheralsWithFilter_handler___block_invoke_2;
  v12[3] = &unk_1E37E6B38;
  v13 = v15;
  v10 = v15;
  -[HKHealthServicesManager _fetchHealthServicesServerProxyWithHandler:errorHandler:](self, "_fetchHealthServicesServerProxyWithHandler:errorHandler:", v14, v12);

}

uint64_t __63__HKHealthServicesManager_healthPeripheralsWithFilter_handler___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "remote_getHealthPeripheralsWithFilter:handler:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));
}

uint64_t __63__HKHealthServicesManager_healthPeripheralsWithFilter_handler___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)addHealthServicePairing:(id)a3 withCompletion:(id)a4
{
  id v7;
  id v8;
  void *v9;
  uint64_t v10;
  id v11;
  id v12;
  void *v13;
  _QWORD v14[4];
  id v15;
  _QWORD v16[5];
  id v17;
  id v18;

  v7 = a3;
  v8 = a4;
  if (!v8)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("HKHealthServicesManager.m"), 273, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("completion"));

  }
  -[HKProxyProvider clientQueueActionHandlerWithCompletion:](self->_proxyProvider, "clientQueueActionHandlerWithCompletion:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = MEMORY[0x1E0C809B0];
  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = __66__HKHealthServicesManager_addHealthServicePairing_withCompletion___block_invoke;
  v16[3] = &unk_1E37F80F0;
  v16[4] = self;
  v17 = v7;
  v18 = v9;
  v14[0] = v10;
  v14[1] = 3221225472;
  v14[2] = __66__HKHealthServicesManager_addHealthServicePairing_withCompletion___block_invoke_3;
  v14[3] = &unk_1E37E6B38;
  v15 = v18;
  v11 = v18;
  v12 = v7;
  -[HKHealthServicesManager _fetchHealthServicesServerProxyWithHandler:errorHandler:](self, "_fetchHealthServicesServerProxyWithHandler:errorHandler:", v16, v14);

}

void __66__HKHealthServicesManager_addHealthServicePairing_withCompletion___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  id v5;
  _QWORD block[4];
  id v7;
  id v8;
  id v9;

  v3 = a2;
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "clientQueue");
  v4 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __66__HKHealthServicesManager_addHealthServicePairing_withCompletion___block_invoke_2;
  block[3] = &unk_1E37E67E8;
  v7 = v3;
  v8 = *(id *)(a1 + 40);
  v9 = *(id *)(a1 + 48);
  v5 = v3;
  dispatch_async(v4, block);

}

uint64_t __66__HKHealthServicesManager_addHealthServicePairing_withCompletion___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "remote_addPairingForHealthService:withCompletion:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
}

uint64_t __66__HKHealthServicesManager_addHealthServicePairing_withCompletion___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)removeHealthServicePairing:(id)a3 withCompletion:(id)a4
{
  id v7;
  id v8;
  void *v9;
  uint64_t v10;
  id v11;
  id v12;
  void *v13;
  _QWORD v14[4];
  id v15;
  _QWORD v16[5];
  id v17;
  id v18;

  v7 = a3;
  v8 = a4;
  if (!v8)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("HKHealthServicesManager.m"), 287, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("completion"));

  }
  -[HKProxyProvider clientQueueActionHandlerWithCompletion:](self->_proxyProvider, "clientQueueActionHandlerWithCompletion:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = MEMORY[0x1E0C809B0];
  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = __69__HKHealthServicesManager_removeHealthServicePairing_withCompletion___block_invoke;
  v16[3] = &unk_1E37F80F0;
  v16[4] = self;
  v17 = v7;
  v18 = v9;
  v14[0] = v10;
  v14[1] = 3221225472;
  v14[2] = __69__HKHealthServicesManager_removeHealthServicePairing_withCompletion___block_invoke_3;
  v14[3] = &unk_1E37E6B38;
  v15 = v18;
  v11 = v18;
  v12 = v7;
  -[HKHealthServicesManager _fetchHealthServicesServerProxyWithHandler:errorHandler:](self, "_fetchHealthServicesServerProxyWithHandler:errorHandler:", v16, v14);

}

void __69__HKHealthServicesManager_removeHealthServicePairing_withCompletion___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  id v5;
  _QWORD block[4];
  id v7;
  id v8;
  id v9;

  v3 = a2;
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "clientQueue");
  v4 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __69__HKHealthServicesManager_removeHealthServicePairing_withCompletion___block_invoke_2;
  block[3] = &unk_1E37E67E8;
  v7 = v3;
  v8 = *(id *)(a1 + 40);
  v9 = *(id *)(a1 + 48);
  v5 = v3;
  dispatch_async(v4, block);

}

uint64_t __69__HKHealthServicesManager_removeHealthServicePairing_withCompletion___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "remote_removePairingForHealthService:withCompletion:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
}

uint64_t __69__HKHealthServicesManager_removeHealthServicePairing_withCompletion___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)registerPeripheralIdentifier:(id)a3 name:(id)a4 services:(id)a5 withCompletion:(id)a6
{
  id v11;
  id v12;
  id v13;
  id v14;
  void *v15;
  uint64_t v16;
  id v17;
  id v18;
  id v19;
  id v20;
  void *v21;
  _QWORD v22[4];
  id v23;
  _QWORD v24[4];
  id v25;
  id v26;
  id v27;
  id v28;

  v11 = a3;
  v12 = a4;
  v13 = a5;
  v14 = a6;
  if (!v14)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("HKHealthServicesManager.m"), 301, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("completion"));

  }
  -[HKProxyProvider clientQueueActionHandlerWithCompletion:](self->_proxyProvider, "clientQueueActionHandlerWithCompletion:", v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  v16 = MEMORY[0x1E0C809B0];
  v24[0] = MEMORY[0x1E0C809B0];
  v24[1] = 3221225472;
  v24[2] = __85__HKHealthServicesManager_registerPeripheralIdentifier_name_services_withCompletion___block_invoke;
  v24[3] = &unk_1E37F8168;
  v25 = v11;
  v26 = v12;
  v27 = v13;
  v28 = v15;
  v22[0] = v16;
  v22[1] = 3221225472;
  v22[2] = __85__HKHealthServicesManager_registerPeripheralIdentifier_name_services_withCompletion___block_invoke_2;
  v22[3] = &unk_1E37E6B38;
  v23 = v28;
  v17 = v28;
  v18 = v13;
  v19 = v12;
  v20 = v11;
  -[HKHealthServicesManager _fetchHealthServicesServerProxyWithHandler:errorHandler:](self, "_fetchHealthServicesServerProxyWithHandler:errorHandler:", v24, v22);

}

uint64_t __85__HKHealthServicesManager_registerPeripheralIdentifier_name_services_withCompletion___block_invoke(_QWORD *a1, void *a2)
{
  return objc_msgSend(a2, "remote_addPeripheral:name:forServices:withCompletion:", a1[4], a1[5], a1[6], a1[7]);
}

uint64_t __85__HKHealthServicesManager_registerPeripheralIdentifier_name_services_withCompletion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)unregisterPeripheralIdentifier:(id)a3 withCompletion:(id)a4
{
  id v7;
  id v8;
  void *v9;
  uint64_t v10;
  id v11;
  id v12;
  void *v13;
  _QWORD v14[4];
  id v15;
  _QWORD v16[4];
  id v17;
  id v18;

  v7 = a3;
  v8 = a4;
  if (!v8)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("HKHealthServicesManager.m"), 313, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("completion"));

  }
  -[HKProxyProvider clientQueueActionHandlerWithCompletion:](self->_proxyProvider, "clientQueueActionHandlerWithCompletion:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = MEMORY[0x1E0C809B0];
  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = __73__HKHealthServicesManager_unregisterPeripheralIdentifier_withCompletion___block_invoke;
  v16[3] = &unk_1E37F7FF0;
  v17 = v7;
  v18 = v9;
  v14[0] = v10;
  v14[1] = 3221225472;
  v14[2] = __73__HKHealthServicesManager_unregisterPeripheralIdentifier_withCompletion___block_invoke_2;
  v14[3] = &unk_1E37E6B38;
  v15 = v18;
  v11 = v18;
  v12 = v7;
  -[HKHealthServicesManager _fetchHealthServicesServerProxyWithHandler:errorHandler:](self, "_fetchHealthServicesServerProxyWithHandler:errorHandler:", v16, v14);

}

uint64_t __73__HKHealthServicesManager_unregisterPeripheralIdentifier_withCompletion___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "remote_removePeripheral:withCompletion:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));
}

uint64_t __73__HKHealthServicesManager_unregisterPeripheralIdentifier_withCompletion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)getEnabledStatusForPeripheral:(id)a3 withCompletion:(id)a4
{
  id v6;
  id v7;
  void *v8;
  id v9;
  id v10;
  _QWORD v11[4];
  id v12;
  id v13;
  id v14;
  id location;

  v6 = a3;
  v7 = a4;
  if (!v7)
    objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99778], CFSTR("%s may not be nil"), "completion");
  objc_initWeak(&location, self);
  -[HKProxyProvider clientQueueActionHandlerWithCompletion:](self->_proxyProvider, "clientQueueActionHandlerWithCompletion:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __72__HKHealthServicesManager_getEnabledStatusForPeripheral_withCompletion___block_invoke;
  v11[3] = &unk_1E37ED908;
  v9 = v8;
  v13 = v9;
  objc_copyWeak(&v14, &location);
  v10 = v6;
  v12 = v10;
  -[HKHealthServicesManager _getHealthPeripheralsStatus:withCompletion:](self, "_getHealthPeripheralsStatus:withCompletion:", v10, v11);

  objc_destroyWeak(&v14);
  objc_destroyWeak(&location);

}

void __72__HKHealthServicesManager_getEnabledStatusForPeripheral_withCompletion___block_invoke(id *a1, uint64_t a2, uint64_t a3)
{
  id WeakRetained;
  uint64_t v5;
  _QWORD v6[4];
  id v7;
  _QWORD v8[4];
  id v9;
  id v10;

  if (a3)
  {
    WeakRetained = objc_loadWeakRetained(a1 + 6);
    v5 = MEMORY[0x1E0C809B0];
    v8[0] = MEMORY[0x1E0C809B0];
    v8[1] = 3221225472;
    v8[2] = __72__HKHealthServicesManager_getEnabledStatusForPeripheral_withCompletion___block_invoke_2;
    v8[3] = &unk_1E37F7FF0;
    v9 = a1[4];
    v10 = a1[5];
    v6[0] = v5;
    v6[1] = 3221225472;
    v6[2] = __72__HKHealthServicesManager_getEnabledStatusForPeripheral_withCompletion___block_invoke_3;
    v6[3] = &unk_1E37E6B38;
    v7 = a1[5];
    objc_msgSend(WeakRetained, "_fetchHealthServicesServerProxyWithHandler:errorHandler:", v8, v6);

  }
  else
  {
    (*((void (**)(void))a1[5] + 2))();
  }
}

uint64_t __72__HKHealthServicesManager_getEnabledStatusForPeripheral_withCompletion___block_invoke_2(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "remote_getEnabledStatusForPeripheral:withCompletion:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));
}

uint64_t __72__HKHealthServicesManager_getEnabledStatusForPeripheral_withCompletion___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)setEnabledStatus:(BOOL)a3 forPeripheral:(id)a4 withCompletion:(id)a5
{
  _BOOL8 v6;
  id v8;
  id v9;
  void *v10;
  id v11;
  id v12;
  _QWORD v13[4];
  id v14;
  id v15;
  id v16;
  BOOL v17;
  id location;

  v6 = a3;
  v8 = a4;
  v9 = a5;
  if (!v9)
    objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99778], CFSTR("%s may not be nil"), "completion");
  objc_initWeak(&location, self);
  -[HKProxyProvider clientQueueActionHandlerWithCompletion:](self->_proxyProvider, "clientQueueActionHandlerWithCompletion:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __73__HKHealthServicesManager_setEnabledStatus_forPeripheral_withCompletion___block_invoke;
  v13[3] = &unk_1E37F81B8;
  v11 = v10;
  v15 = v11;
  objc_copyWeak(&v16, &location);
  v17 = v6;
  v12 = v8;
  v14 = v12;
  -[HKHealthServicesManager _setHealthPeripheralsStatus:status:withCompletion:](self, "_setHealthPeripheralsStatus:status:withCompletion:", v12, v6, v13);

  objc_destroyWeak(&v16);
  objc_destroyWeak(&location);

}

void __73__HKHealthServicesManager_setEnabledStatus_forPeripheral_withCompletion___block_invoke(uint64_t a1, int a2)
{
  id WeakRetained;
  uint64_t v4;
  _QWORD v5[4];
  id v6;
  _QWORD v7[4];
  id v8;
  id v9;
  char v10;

  if (a2)
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  }
  else
  {
    WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
    v4 = MEMORY[0x1E0C809B0];
    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 3221225472;
    v7[2] = __73__HKHealthServicesManager_setEnabledStatus_forPeripheral_withCompletion___block_invoke_2;
    v7[3] = &unk_1E37F8190;
    v10 = *(_BYTE *)(a1 + 56);
    v8 = *(id *)(a1 + 32);
    v9 = *(id *)(a1 + 40);
    v5[0] = v4;
    v5[1] = 3221225472;
    v5[2] = __73__HKHealthServicesManager_setEnabledStatus_forPeripheral_withCompletion___block_invoke_3;
    v5[3] = &unk_1E37E6B38;
    v6 = *(id *)(a1 + 40);
    objc_msgSend(WeakRetained, "_fetchHealthServicesServerProxyWithHandler:errorHandler:", v7, v5);

  }
}

uint64_t __73__HKHealthServicesManager_setEnabledStatus_forPeripheral_withCompletion___block_invoke_2(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "remote_setEnabledStatus:forPeripheral:withCompletion:", *(unsigned __int8 *)(a1 + 48), *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));
}

uint64_t __73__HKHealthServicesManager_setEnabledStatus_forPeripheral_withCompletion___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)getHealthServicePropertyNamesWithHandler:(id)a3
{
  id v5;
  void *v6;
  uint64_t v7;
  id v8;
  void *v9;
  _QWORD v10[4];
  id v11;
  _QWORD v12[4];
  id v13;

  v5 = a3;
  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("HKHealthServicesManager.m"), 367, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("handler"));

  }
  -[HKProxyProvider clientQueueObjectHandlerWithCompletion:](self->_proxyProvider, "clientQueueObjectHandlerWithCompletion:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = MEMORY[0x1E0C809B0];
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __68__HKHealthServicesManager_getHealthServicePropertyNamesWithHandler___block_invoke;
  v12[3] = &unk_1E37F8078;
  v13 = v6;
  v10[0] = v7;
  v10[1] = 3221225472;
  v10[2] = __68__HKHealthServicesManager_getHealthServicePropertyNamesWithHandler___block_invoke_2;
  v10[3] = &unk_1E37E6B38;
  v11 = v13;
  v8 = v13;
  -[HKHealthServicesManager _fetchHealthServicesServerProxyWithHandler:errorHandler:](self, "_fetchHealthServicesServerProxyWithHandler:errorHandler:", v12, v10);

}

uint64_t __68__HKHealthServicesManager_getHealthServicePropertyNamesWithHandler___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "remote_getSupportedPropertyNamesWithHandler:", *(_QWORD *)(a1 + 32));
}

uint64_t __68__HKHealthServicesManager_getHealthServicePropertyNamesWithHandler___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)getHealthServiceProperty:(id)a3 forSession:(id)a4 withHandler:(id)a5
{
  id v9;
  id v10;
  id v11;
  void *v12;
  uint64_t v13;
  id v14;
  id v15;
  id v16;
  void *v17;
  void *v18;
  void *v19;
  _QWORD v20[4];
  id v21;
  _QWORD v22[4];
  id v23;
  id v24;
  id v25;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  if (v9)
  {
    if (v10)
      goto LABEL_3;
LABEL_6:
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("HKHealthServicesManager.m"), 381, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("session"));

    if (v11)
      goto LABEL_4;
LABEL_7:
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("HKHealthServicesManager.m"), 382, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("handler"));

    goto LABEL_4;
  }
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("HKHealthServicesManager.m"), 380, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("propertyName"));

  if (!v10)
    goto LABEL_6;
LABEL_3:
  if (!v11)
    goto LABEL_7;
LABEL_4:
  -[HKProxyProvider clientQueueObjectHandlerWithCompletion:](self->_proxyProvider, "clientQueueObjectHandlerWithCompletion:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  v13 = MEMORY[0x1E0C809B0];
  v22[0] = MEMORY[0x1E0C809B0];
  v22[1] = 3221225472;
  v22[2] = __75__HKHealthServicesManager_getHealthServiceProperty_forSession_withHandler___block_invoke;
  v22[3] = &unk_1E37F80F0;
  v23 = v9;
  v24 = v10;
  v25 = v12;
  v20[0] = v13;
  v20[1] = 3221225472;
  v20[2] = __75__HKHealthServicesManager_getHealthServiceProperty_forSession_withHandler___block_invoke_2;
  v20[3] = &unk_1E37E6B38;
  v21 = v25;
  v14 = v25;
  v15 = v10;
  v16 = v9;
  -[HKHealthServicesManager _fetchHealthServicesServerProxyWithHandler:errorHandler:](self, "_fetchHealthServicesServerProxyWithHandler:errorHandler:", v22, v20);

}

void __75__HKHealthServicesManager_getHealthServiceProperty_forSession_withHandler___block_invoke(_QWORD *a1, void *a2)
{
  uint64_t v3;
  void *v4;
  id v5;

  v3 = a1[4];
  v4 = (void *)a1[5];
  v5 = a2;
  objc_msgSend(v5, "remote_getHealthServiceProperty:forSession:withHandler:", v3, objc_msgSend(v4, "sessionIdentifier"), a1[6]);

}

uint64_t __75__HKHealthServicesManager_getHealthServiceProperty_forSession_withHandler___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)performHealthServiceOperation:(id)a3 onSession:(id)a4 withParameters:(id)a5 completion:(id)a6
{
  id v11;
  id v12;
  id v13;
  id v14;
  uint64_t v15;
  id v16;
  id v17;
  id v18;
  id v19;
  void *v20;
  void *v21;
  _QWORD v22[5];
  id v23;
  id v24;
  _QWORD v25[5];
  id v26;
  id v27;
  id v28;
  id v29;

  v11 = a3;
  v12 = a4;
  v13 = a5;
  v14 = a6;
  if (!v11)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("HKHealthServicesManager.m"), 394, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("op"));

    if (v12)
      goto LABEL_3;
LABEL_5:
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("HKHealthServicesManager.m"), 395, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("session"));

    goto LABEL_3;
  }
  if (!v12)
    goto LABEL_5;
LABEL_3:
  v15 = MEMORY[0x1E0C809B0];
  v25[0] = MEMORY[0x1E0C809B0];
  v25[1] = 3221225472;
  v25[2] = __93__HKHealthServicesManager_performHealthServiceOperation_onSession_withParameters_completion___block_invoke;
  v25[3] = &unk_1E37F81E0;
  v25[4] = self;
  v26 = v11;
  v27 = v12;
  v28 = v13;
  v29 = v14;
  v22[0] = v15;
  v22[1] = 3221225472;
  v22[2] = __93__HKHealthServicesManager_performHealthServiceOperation_onSession_withParameters_completion___block_invoke_3;
  v22[3] = &unk_1E37F8208;
  v23 = v26;
  v24 = v29;
  v22[4] = self;
  v16 = v26;
  v17 = v29;
  v18 = v13;
  v19 = v12;
  -[HKHealthServicesManager _fetchHealthServicesServerProxyWithHandler:errorHandler:](self, "_fetchHealthServicesServerProxyWithHandler:errorHandler:", v25, v22);

}

void __93__HKHealthServicesManager_performHealthServiceOperation_onSession_withParameters_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  id v5;
  _QWORD block[4];
  id v7;
  id v8;
  id v9;
  id v10;
  id v11;

  v3 = a2;
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "clientQueue");
  v4 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __93__HKHealthServicesManager_performHealthServiceOperation_onSession_withParameters_completion___block_invoke_2;
  block[3] = &unk_1E37EBED0;
  v7 = v3;
  v8 = *(id *)(a1 + 40);
  v9 = *(id *)(a1 + 48);
  v10 = *(id *)(a1 + 56);
  v11 = *(id *)(a1 + 64);
  v5 = v3;
  dispatch_async(v4, block);

}

uint64_t __93__HKHealthServicesManager_performHealthServiceOperation_onSession_withParameters_completion___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "remote_performHealthServiceOperation:onSession:withParameters:completion:", *(_QWORD *)(a1 + 40), objc_msgSend(*(id *)(a1 + 48), "sessionIdentifier"), *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 64));
}

void __93__HKHealthServicesManager_performHealthServiceOperation_onSession_withParameters_completion___block_invoke_3(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  id v5;
  _QWORD block[4];
  id v7;
  id v8;
  id v9;

  v3 = a2;
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "clientQueue");
  v4 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __93__HKHealthServicesManager_performHealthServiceOperation_onSession_withParameters_completion___block_invoke_4;
  block[3] = &unk_1E37E6710;
  v9 = *(id *)(a1 + 48);
  v7 = *(id *)(a1 + 40);
  v8 = v3;
  v5 = v3;
  dispatch_async(v4, block);

}

uint64_t __93__HKHealthServicesManager_performHealthServiceOperation_onSession_withParameters_completion___block_invoke_4(_QWORD *a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD, _QWORD))(a1[6] + 16))(a1[6], a1[4], 0, a1[5]);
}

- (void)_addEndedDiscovery:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;

  v4 = a3;
  -[HKHealthServicesManager discoveriesEnded](self, "discoveriesEnded");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0C99E20], "set");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[HKHealthServicesManager setDiscoveriesEnded:](self, "setDiscoveriesEnded:", v6);

  }
  -[HKHealthServicesManager discoveriesEnded](self, "discoveriesEnded");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "addObject:", v4);

}

- (void)_addEndedSession:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;

  v4 = a3;
  -[HKHealthServicesManager sessionsEnded](self, "sessionsEnded");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0C99E20], "set");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[HKHealthServicesManager setSessionsEnded:](self, "setSessionsEnded:", v6);

  }
  -[HKHealthServicesManager sessionsEnded](self, "sessionsEnded");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "addObject:", v4);

}

- (void)healthPeripheralsWithCustomProperties:(id)a3 withCompletion:(id)a4
{
  id v7;
  id v8;
  _HKCBCentralManagerLoader *bluetoothManagerLoader;
  id v10;
  id v11;
  void *v12;
  _QWORD v13[4];
  id v14;
  id v15;

  v7 = a3;
  v8 = a4;
  if (!v8)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("HKHealthServicesManager.m"), 427, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("completion"));

  }
  bluetoothManagerLoader = self->_bluetoothManagerLoader;
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __80__HKHealthServicesManager_healthPeripheralsWithCustomProperties_withCompletion___block_invoke;
  v13[3] = &unk_1E37F8230;
  v14 = v7;
  v15 = v8;
  v10 = v8;
  v11 = v7;
  -[_HKCBCentralManagerLoader getCentralManagerWithCompletion:](bluetoothManagerLoader, "getCentralManagerWithCompletion:", v13);

}

void __80__HKHealthServicesManager_healthPeripheralsWithCustomProperties_withCompletion___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3;
  _QWORD v4[4];
  id v5;

  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __80__HKHealthServicesManager_healthPeripheralsWithCustomProperties_withCompletion___block_invoke_2;
  v4[3] = &unk_1E37EFDB8;
  v3 = *(_QWORD *)(a1 + 32);
  v5 = *(id *)(a1 + 40);
  objc_msgSend(a2, "retrievePeripheralsWithCustomProperties:completion:", v3, v4);

}

void __80__HKHealthServicesManager_healthPeripheralsWithCustomProperties_withCompletion___block_invoke_2(uint64_t a1, void *a2, uint64_t a3)
{
  id v5;
  id v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  HKCBPeripheral *v13;
  HKCBPeripheral *v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  if (a3)
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  }
  else
  {
    v6 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v15 = 0u;
    v16 = 0u;
    v17 = 0u;
    v18 = 0u;
    v7 = v5;
    v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    if (v8)
    {
      v9 = v8;
      v10 = *(_QWORD *)v16;
      do
      {
        v11 = 0;
        do
        {
          if (*(_QWORD *)v16 != v10)
            objc_enumerationMutation(v7);
          v12 = *(_QWORD *)(*((_QWORD *)&v15 + 1) + 8 * v11);
          v13 = [HKCBPeripheral alloc];
          v14 = -[HKCBPeripheral initWithCBPeripheral:](v13, "initWithCBPeripheral:", v12, (_QWORD)v15);
          objc_msgSend(v6, "addObject:", v14);

          ++v11;
        }
        while (v9 != v11);
        v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
      }
      while (v9);
    }

    (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  }

}

- (void)_getCBPeripheralforIdentifer:(id)a3 withCompletion:(id)a4
{
  id v6;
  id v7;
  _HKCBCentralManagerLoader *bluetoothManagerLoader;
  id v9;
  id v10;
  _QWORD v11[4];
  id v12;
  id v13;

  v6 = a3;
  v7 = a4;
  if (!v7)
    objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99778], CFSTR("%s may not be nil"), "completion");
  bluetoothManagerLoader = self->_bluetoothManagerLoader;
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __71__HKHealthServicesManager__getCBPeripheralforIdentifer_withCompletion___block_invoke;
  v11[3] = &unk_1E37F8230;
  v12 = v6;
  v13 = v7;
  v9 = v7;
  v10 = v6;
  -[_HKCBCentralManagerLoader getCentralManagerWithCompletion:](bluetoothManagerLoader, "getCentralManagerWithCompletion:", v11);

}

void __71__HKHealthServicesManager__getCBPeripheralforIdentifer_withCompletion___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  NSObject *v12;
  void *v13;
  int v14;
  void *v15;
  _QWORD v16[2];

  v16[1] = *MEMORY[0x1E0C80C00];
  v16[0] = *(_QWORD *)(a1 + 32);
  v3 = (void *)MEMORY[0x1E0C99D20];
  v4 = a2;
  objc_msgSend(v3, "arrayWithObjects:count:", v16, 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "retrievePeripheralsWithIdentifiers:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v6, "count") == 1)
  {
    v7 = *(_QWORD *)(a1 + 40);
    objc_msgSend(v6, "firstObject");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, void *))(v7 + 16))(v7, v8);

  }
  else
  {
    v9 = objc_msgSend(v6, "count");
    _HKInitializeLogging();
    v10 = (void *)HKLogServices;
    if (v9)
    {
      if (os_log_type_enabled((os_log_t)HKLogServices, OS_LOG_TYPE_FAULT))
        __71__HKHealthServicesManager__getCBPeripheralforIdentifer_withCompletion___block_invoke_cold_1();
    }
    else if (os_log_type_enabled((os_log_t)HKLogServices, OS_LOG_TYPE_DEFAULT))
    {
      v11 = *(void **)(a1 + 32);
      v12 = v10;
      objc_msgSend(v11, "UUIDString");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = 138412290;
      v15 = v13;
      _os_log_impl(&dword_19A0E6000, v12, OS_LOG_TYPE_DEFAULT, "No CBPeripheral found for identifier %@", (uint8_t *)&v14, 0xCu);

    }
    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  }

}

- (void)_getHealthPeripheralsStatus:(id)a3 withCompletion:(id)a4
{
  id v6;
  id v7;
  id v8;
  _QWORD v9[4];
  id v10;

  v6 = a3;
  v7 = a4;
  if (!v7)
    objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99778], CFSTR("%s may not be nil"), "completion");
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __70__HKHealthServicesManager__getHealthPeripheralsStatus_withCompletion___block_invoke;
  v9[3] = &unk_1E37F8258;
  v10 = v7;
  v8 = v7;
  -[HKHealthServicesManager _getCBPeripheralforIdentifer:withCompletion:](self, "_getCBPeripheralforIdentifer:withCompletion:", v6, v9);

}

void __70__HKHealthServicesManager__getHealthPeripheralsStatus_withCompletion___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  id v8;

  if (a2)
  {
    objc_msgSend(a2, "customProperty:", CFSTR("UpdateHealth"));
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = v3;
    if (v3 && !objc_msgSend(v3, "isEqual:", &stru_1E37FD4C0))
    {
      objc_msgSend(v4, "BOOLValue");
      (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
    }
    else
    {
      _HKInitializeLogging();
      if (os_log_type_enabled((os_log_t)HKLogServices, OS_LOG_TYPE_FAULT))
        __70__HKHealthServicesManager__getHealthPeripheralsStatus_withCompletion___block_invoke_cold_1();
      v5 = *(_QWORD *)(a1 + 32);
      objc_msgSend(MEMORY[0x1E0CB35C8], "hk_error:format:", 304, CFSTR("Migration to CBPeripheral is not complete"));
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      (*(void (**)(uint64_t, _QWORD, void *))(v5 + 16))(v5, 0, v6);

    }
  }
  else
  {
    v7 = *(_QWORD *)(a1 + 32);
    objc_msgSend(MEMORY[0x1E0CB35C8], "hk_error:format:", 304, CFSTR("No Device found"));
    v8 = (id)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, _QWORD, id))(v7 + 16))(v7, 0, v8);

  }
}

- (void)_setHealthPeripheralsStatus:(id)a3 status:(BOOL)a4 withCompletion:(id)a5
{
  id v8;
  id v9;
  id v10;
  _QWORD v11[4];
  id v12;
  BOOL v13;

  v8 = a3;
  v9 = a5;
  if (!v9)
    objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99778], CFSTR("%s may not be nil"), "completion");
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __77__HKHealthServicesManager__setHealthPeripheralsStatus_status_withCompletion___block_invoke;
  v11[3] = &unk_1E37F8280;
  v12 = v9;
  v13 = a4;
  v10 = v9;
  -[HKHealthServicesManager _getCBPeripheralforIdentifer:withCompletion:](self, "_getCBPeripheralforIdentifer:withCompletion:", v8, v11);

}

void __77__HKHealthServicesManager__setHealthPeripheralsStatus_status_withCompletion___block_invoke(uint64_t a1, void *a2)
{
  const __CFString *v3;
  uint64_t v4;
  void *v5;

  if (a2)
  {
    if (*(_BYTE *)(a1 + 40))
      v3 = CFSTR("1");
    else
      v3 = CFSTR("0");
    objc_msgSend(a2, "setCustomProperty:value:", CFSTR("UpdateHealth"), v3);
    notify_post("HKHealthPeripheralStatusDidChangeNotification");
    (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  }
  else
  {
    _HKInitializeLogging();
    if (os_log_type_enabled((os_log_t)HKLogServices, OS_LOG_TYPE_FAULT))
      __77__HKHealthServicesManager__setHealthPeripheralsStatus_status_withCompletion___block_invoke_cold_1();
    v4 = *(_QWORD *)(a1 + 32);
    objc_msgSend(MEMORY[0x1E0CB35C8], "hk_error:format:", 304, CFSTR("No Device found"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, _QWORD, void *))(v4 + 16))(v4, 0, v5);

  }
}

- (void)clientRemote_deliverBluetoothStatus:(int64_t)a3 withError:(id)a4
{
  id v6;
  NSObject *v7;
  id v8;
  _QWORD block[5];
  id v10;
  int64_t v11;

  v6 = a4;
  -[HKProxyProvider clientQueue](self->_proxyProvider, "clientQueue");
  v7 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __73__HKHealthServicesManager_clientRemote_deliverBluetoothStatus_withError___block_invoke;
  block[3] = &unk_1E37E69A8;
  v10 = v6;
  v11 = a3;
  block[4] = self;
  v8 = v6;
  dispatch_async(v7, block);

}

uint64_t __73__HKHealthServicesManager_clientRemote_deliverBluetoothStatus_withError___block_invoke(_QWORD *a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1[4] + 56);
  if (result)
    return (*(uint64_t (**)(uint64_t, _QWORD, _QWORD))(result + 16))(result, a1[6], a1[5]);
  return result;
}

- (void)clientRemote_deliverDiscoveryHealthService:(id)a3 toClient:(unint64_t)a4 finished:(BOOL)a5 withError:(id)a6
{
  id v11;
  id v12;
  NSObject *v13;
  id v14;
  id v15;
  _QWORD v16[5];
  id v17;
  id v18;
  unint64_t v19;
  SEL v20;
  BOOL v21;

  v11 = a3;
  v12 = a6;
  -[HKProxyProvider clientQueue](self->_proxyProvider, "clientQueue");
  v13 = objc_claimAutoreleasedReturnValue();
  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = __98__HKHealthServicesManager_clientRemote_deliverDiscoveryHealthService_toClient_finished_withError___block_invoke;
  v16[3] = &unk_1E37F82A8;
  v19 = a4;
  v20 = a2;
  v16[4] = self;
  v17 = v11;
  v18 = v12;
  v21 = a5;
  v14 = v12;
  v15 = v11;
  dispatch_async(v13, v16);

}

void __98__HKHealthServicesManager_clientRemote_deliverDiscoveryHealthService_toClient_finished_withError___block_invoke(uint64_t a1)
{
  void *v2;
  const char *v3;
  NSObject *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  dispatch_time_t v11;
  NSObject *v12;
  uint64_t v13;
  id v14;
  uint64_t v15;
  _QWORD v16[4];
  id v17;
  id v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  char v22;
  uint8_t buf[4];
  void *v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  if (*(_QWORD *)(a1 + 56))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:");
    v4 = objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 24), "objectForKeyedSubscript:", v4);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "discoveryHandler");
    v7 = objc_claimAutoreleasedReturnValue();
    v8 = (void *)v7;
    if (v7)
    {
      (*(void (**)(uint64_t, _QWORD, _QWORD, _QWORD))(v7 + 16))(v7, *(_QWORD *)(a1 + 40), *(unsigned __int8 *)(a1 + 72), *(_QWORD *)(a1 + 48));
      if (*(_BYTE *)(a1 + 72))
      {
        objc_msgSend(*(id *)(a1 + 32), "_addEndedDiscovery:", v4);
        objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 24), "removeObjectForKey:", v4);
      }
    }
    else
    {
      v9 = *(_QWORD *)(a1 + 32);
      if (*(_QWORD *)(v9 + 24) && !objc_msgSend(*(id *)(v9 + 32), "containsObject:", v4))
      {
        v11 = dispatch_time(0, 250000000);
        objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "clientQueue");
        v12 = objc_claimAutoreleasedReturnValue();
        v16[0] = MEMORY[0x1E0C809B0];
        v16[1] = 3221225472;
        v16[2] = __98__HKHealthServicesManager_clientRemote_deliverDiscoveryHealthService_toClient_finished_withError___block_invoke_69;
        v16[3] = &unk_1E37F82A8;
        v13 = *(_QWORD *)(a1 + 56);
        v20 = *(_QWORD *)(a1 + 64);
        v21 = v13;
        v17 = *(id *)(a1 + 40);
        v14 = *(id *)(a1 + 48);
        v15 = *(_QWORD *)(a1 + 32);
        v18 = v14;
        v19 = v15;
        v22 = *(_BYTE *)(a1 + 72);
        dispatch_after(v11, v12, v16);

      }
      else
      {
        _HKInitializeLogging();
        v10 = (void *)HKLogServices;
        if (os_log_type_enabled((os_log_t)HKLogServices, OS_LOG_TYPE_DEBUG))
          __98__HKHealthServicesManager_clientRemote_deliverDiscoveryHealthService_toClient_finished_withError___block_invoke_cold_1(a1, v10);
      }
    }

  }
  else
  {
    _HKInitializeLogging();
    v2 = (void *)HKLogServices;
    if (!os_log_type_enabled((os_log_t)HKLogServices, OS_LOG_TYPE_DEFAULT))
      return;
    v3 = *(const char **)(a1 + 64);
    v4 = v2;
    NSStringFromSelector(v3);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543362;
    v24 = v5;
    _os_log_impl(&dword_19A0E6000, v4, OS_LOG_TYPE_DEFAULT, "%{public}@, Invalid discovery client returned and ignored.", buf, 0xCu);

  }
}

uint64_t __98__HKHealthServicesManager_clientRemote_deliverDiscoveryHealthService_toClient_finished_withError___block_invoke_69(uint64_t a1)
{
  void *v2;

  _HKInitializeLogging();
  v2 = (void *)HKLogServices;
  if (os_log_type_enabled((os_log_t)HKLogServices, OS_LOG_TYPE_DEBUG))
    __98__HKHealthServicesManager_clientRemote_deliverDiscoveryHealthService_toClient_finished_withError___block_invoke_69_cold_1(a1, v2);
  return objc_msgSend(*(id *)(a1 + 48), "clientRemote_deliverDiscoveryHealthService:toClient:finished:withError:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 64), *(unsigned __int8 *)(a1 + 72), *(_QWORD *)(a1 + 40));
}

- (void)clientRemote_deliverSessionHealthServiceStatus:(int64_t)a3 toClient:(unint64_t)a4 finished:(BOOL)a5 withError:(id)a6
{
  id v11;
  NSObject *v12;
  id v13;
  _QWORD v14[5];
  id v15;
  unint64_t v16;
  SEL v17;
  int64_t v18;
  BOOL v19;

  v11 = a6;
  -[HKProxyProvider clientQueue](self->_proxyProvider, "clientQueue");
  v12 = objc_claimAutoreleasedReturnValue();
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __102__HKHealthServicesManager_clientRemote_deliverSessionHealthServiceStatus_toClient_finished_withError___block_invoke;
  v14[3] = &unk_1E37F82D0;
  v16 = a4;
  v17 = a2;
  v18 = a3;
  v14[4] = self;
  v15 = v11;
  v19 = a5;
  v13 = v11;
  dispatch_async(v12, v14);

}

void __102__HKHealthServicesManager_clientRemote_deliverSessionHealthServiceStatus_toClient_finished_withError___block_invoke(uint64_t a1)
{
  void *v2;
  const char *v3;
  NSObject *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  dispatch_time_t v11;
  NSObject *v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  id v16;
  uint64_t v17;
  _QWORD v18[4];
  id v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  char v24;
  uint8_t buf[4];
  void *v26;
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  if (*(_QWORD *)(a1 + 48))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:");
    v4 = objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 40), "objectForKeyedSubscript:", v4);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "sessionHandler");
    v7 = objc_claimAutoreleasedReturnValue();
    v8 = (void *)v7;
    if (v7)
    {
      (*(void (**)(uint64_t, _QWORD, _QWORD, _QWORD))(v7 + 16))(v7, *(_QWORD *)(a1 + 64), *(unsigned __int8 *)(a1 + 72), *(_QWORD *)(a1 + 40));
      if (*(_BYTE *)(a1 + 72))
      {
        objc_msgSend(*(id *)(a1 + 32), "_addEndedSession:", v4);
        objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 40), "removeObjectForKey:", v4);
      }
    }
    else
    {
      v9 = *(_QWORD *)(a1 + 32);
      if (*(_QWORD *)(v9 + 40) && !objc_msgSend(*(id *)(v9 + 48), "containsObject:", v4))
      {
        v11 = dispatch_time(0, 200000000);
        objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "clientQueue");
        v12 = objc_claimAutoreleasedReturnValue();
        v18[0] = MEMORY[0x1E0C809B0];
        v18[2] = __102__HKHealthServicesManager_clientRemote_deliverSessionHealthServiceStatus_toClient_finished_withError___block_invoke_70;
        v18[3] = &unk_1E37F82D0;
        v13 = *(_QWORD *)(a1 + 64);
        v15 = *(void **)(a1 + 40);
        v14 = *(_QWORD *)(a1 + 48);
        v21 = *(_QWORD *)(a1 + 56);
        v22 = v14;
        v23 = v13;
        v18[1] = 3221225472;
        v16 = v15;
        v17 = *(_QWORD *)(a1 + 32);
        v19 = v16;
        v20 = v17;
        v24 = *(_BYTE *)(a1 + 72);
        dispatch_after(v11, v12, v18);

      }
      else
      {
        _HKInitializeLogging();
        v10 = (void *)HKLogServices;
        if (os_log_type_enabled((os_log_t)HKLogServices, OS_LOG_TYPE_DEBUG))
          __102__HKHealthServicesManager_clientRemote_deliverSessionHealthServiceStatus_toClient_finished_withError___block_invoke_cold_1(a1, v10);
      }
    }

  }
  else
  {
    _HKInitializeLogging();
    v2 = (void *)HKLogServices;
    if (!os_log_type_enabled((os_log_t)HKLogServices, OS_LOG_TYPE_DEFAULT))
      return;
    v3 = *(const char **)(a1 + 56);
    v4 = v2;
    NSStringFromSelector(v3);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543362;
    v26 = v5;
    _os_log_impl(&dword_19A0E6000, v4, OS_LOG_TYPE_DEFAULT, "%{public}@, Invalid session client returned and ignored.", buf, 0xCu);

  }
}

uint64_t __102__HKHealthServicesManager_clientRemote_deliverSessionHealthServiceStatus_toClient_finished_withError___block_invoke_70(uint64_t a1)
{
  void *v2;

  _HKInitializeLogging();
  v2 = (void *)HKLogServices;
  if (os_log_type_enabled((os_log_t)HKLogServices, OS_LOG_TYPE_DEBUG))
    __102__HKHealthServicesManager_clientRemote_deliverSessionHealthServiceStatus_toClient_finished_withError___block_invoke_70_cold_1(a1, v2);
  return objc_msgSend(*(id *)(a1 + 40), "clientRemote_deliverSessionHealthServiceStatus:toClient:finished:withError:", *(_QWORD *)(a1 + 64), *(_QWORD *)(a1 + 56), *(unsigned __int8 *)(a1 + 72), *(_QWORD *)(a1 + 32));
}

- (void)clientRemote_deliverSessionCharacteristics:(id)a3 forService:(id)a4 toClient:(unint64_t)a5 withError:(id)a6
{
  id v10;
  id v11;
  id v12;
  NSObject *v13;
  id v14;
  id v15;
  id v16;
  _QWORD block[5];
  id v18;
  id v19;
  id v20;
  unint64_t v21;

  v10 = a3;
  v11 = a4;
  v12 = a6;
  -[HKProxyProvider clientQueue](self->_proxyProvider, "clientQueue");
  v13 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __100__HKHealthServicesManager_clientRemote_deliverSessionCharacteristics_forService_toClient_withError___block_invoke;
  block[3] = &unk_1E37F82F8;
  v20 = v12;
  v21 = a5;
  block[4] = self;
  v18 = v10;
  v19 = v11;
  v14 = v12;
  v15 = v11;
  v16 = v10;
  dispatch_async(v13, block);

}

void __100__HKHealthServicesManager_clientRemote_deliverSessionCharacteristics_forService_toClient_withError___block_invoke(_QWORD *a1)
{
  void *v2;
  void *v3;
  uint64_t v4;
  void *v5;
  id v6;

  if (a1[8])
  {
    v2 = *(void **)(a1[4] + 40);
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "objectForKeyedSubscript:", v3);
    v6 = (id)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v6, "characteristicsHandler");
    v4 = objc_claimAutoreleasedReturnValue();
    v5 = (void *)v4;
    if (v4)
      (*(void (**)(uint64_t, _QWORD, _QWORD, _QWORD))(v4 + 16))(v4, a1[5], a1[6], a1[7]);

  }
}

- (void)connectionInterrupted
{
  NSObject *v3;
  _QWORD block[5];

  -[HKProxyProvider clientQueue](self->_proxyProvider, "clientQueue");
  v3 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __48__HKHealthServicesManager_connectionInterrupted__block_invoke;
  block[3] = &unk_1E37E6770;
  block[4] = self;
  dispatch_async(v3, block);

}

void __48__HKHealthServicesManager_connectionInterrupted__block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  void (**v9)(_QWORD, _QWORD, _QWORD, _QWORD);
  void *v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  void *v16;
  uint64_t v17;
  void *v18;
  void *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t j;
  void *v24;
  void (**v25)(_QWORD, _QWORD, _QWORD, _QWORD);
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  uint64_t v30;
  void *v31;
  uint64_t v32;
  uint64_t v33;
  void *v34;
  void *v35;
  uint64_t v36;
  void *v37;
  uint64_t v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  _BYTE v47[128];
  _BYTE v48[128];
  uint64_t v49;

  v49 = *MEMORY[0x1E0C80C00];
  v2 = *(_QWORD *)(a1 + 32);
  v3 = *(void **)(v2 + 24);
  if (v3)
  {
    v45 = 0u;
    v46 = 0u;
    v43 = 0u;
    v44 = 0u;
    objc_msgSend(v3, "allValues");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v43, v48, 16);
    if (v5)
    {
      v6 = v5;
      v7 = *(_QWORD *)v44;
      do
      {
        for (i = 0; i != v6; ++i)
        {
          if (*(_QWORD *)v44 != v7)
            objc_enumerationMutation(v4);
          objc_msgSend(*(id *)(*((_QWORD *)&v43 + 1) + 8 * i), "discoveryHandler");
          v9 = (void (**)(_QWORD, _QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
          objc_msgSend(MEMORY[0x1E0CB35C8], "hk_error:description:", 301, CFSTR("Connection interrupted"));
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          ((void (**)(_QWORD, _QWORD, uint64_t, void *))v9)[2](v9, 0, 1, v10);

        }
        v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v43, v48, 16);
      }
      while (v6);
    }

    v11 = *(_QWORD *)(a1 + 32);
    v12 = *(void **)(v11 + 32);
    if (!v12)
    {
      objc_msgSend(MEMORY[0x1E0C99E20], "set");
      v13 = objc_claimAutoreleasedReturnValue();
      v14 = *(_QWORD *)(a1 + 32);
      v15 = *(void **)(v14 + 32);
      *(_QWORD *)(v14 + 32) = v13;

      v11 = *(_QWORD *)(a1 + 32);
      v12 = *(void **)(v11 + 32);
    }
    objc_msgSend(*(id *)(v11 + 24), "allKeys");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "addObjectsFromArray:", v16);

    v17 = *(_QWORD *)(a1 + 32);
    v18 = *(void **)(v17 + 24);
    *(_QWORD *)(v17 + 24) = 0;

    v2 = *(_QWORD *)(a1 + 32);
  }
  if (*(_QWORD *)(v2 + 48))
  {
    v38 = a1;
    v41 = 0u;
    v42 = 0u;
    v39 = 0u;
    v40 = 0u;
    objc_msgSend(*(id *)(v2 + 40), "allValues");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v39, v47, 16);
    if (v20)
    {
      v21 = v20;
      v22 = *(_QWORD *)v40;
      do
      {
        for (j = 0; j != v21; ++j)
        {
          if (*(_QWORD *)v40 != v22)
            objc_enumerationMutation(v19);
          v24 = *(void **)(*((_QWORD *)&v39 + 1) + 8 * j);
          objc_msgSend(v24, "sessionHandler");
          v25 = (void (**)(_QWORD, _QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
          v26 = (void *)MEMORY[0x1E0CB35C8];
          objc_msgSend(v24, "service");
          v27 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v27, "name");
          v28 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v26, "hk_error:format:", 300, CFSTR("The connection to %@ has unexpectedly been lost."), v28);
          v29 = (void *)objc_claimAutoreleasedReturnValue();
          ((void (**)(_QWORD, uint64_t, uint64_t, void *))v25)[2](v25, 5, 1, v29);

        }
        v21 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v39, v47, 16);
      }
      while (v21);
    }

    v30 = *(_QWORD *)(v38 + 32);
    v31 = *(void **)(v30 + 48);
    if (!v31)
    {
      objc_msgSend(MEMORY[0x1E0C99E20], "set");
      v32 = objc_claimAutoreleasedReturnValue();
      v33 = *(_QWORD *)(v38 + 32);
      v34 = *(void **)(v33 + 48);
      *(_QWORD *)(v33 + 48) = v32;

      v30 = *(_QWORD *)(v38 + 32);
      v31 = *(void **)(v30 + 48);
    }
    objc_msgSend(*(id *)(v30 + 40), "allKeys");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "addObjectsFromArray:", v35);

    v36 = *(_QWORD *)(v38 + 32);
    v37 = *(void **)(v36 + 40);
    *(_QWORD *)(v36 + 40) = 0;

  }
}

- (NSMutableDictionary)discoveries
{
  return self->_discoveries;
}

- (void)setDiscoveries:(id)a3
{
  objc_storeStrong((id *)&self->_discoveries, a3);
}

- (NSMutableSet)discoveriesEnded
{
  return self->_discoveriesEnded;
}

- (void)setDiscoveriesEnded:(id)a3
{
  objc_storeStrong((id *)&self->_discoveriesEnded, a3);
}

- (NSMutableDictionary)sessions
{
  return self->_sessions;
}

- (void)setSessions:(id)a3
{
  objc_storeStrong((id *)&self->_sessions, a3);
}

- (NSMutableSet)sessionsEnded
{
  return self->_sessionsEnded;
}

- (void)setSessionsEnded:(id)a3
{
  objc_storeStrong((id *)&self->_sessionsEnded, a3);
}

- (id)bluetoothStatusHandler
{
  return self->_bluetoothStatusHandler;
}

- (void)setBluetoothStatusHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 56);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_bluetoothStatusHandler, 0);
  objc_storeStrong((id *)&self->_sessionsEnded, 0);
  objc_storeStrong((id *)&self->_sessions, 0);
  objc_storeStrong((id *)&self->_discoveriesEnded, 0);
  objc_storeStrong((id *)&self->_discoveries, 0);
  objc_storeStrong((id *)&self->_bluetoothManagerLoader, 0);
  objc_storeStrong((id *)&self->_proxyProvider, 0);
}

void __52__HKHealthServicesManager_endBluetoothStatusUpdates__block_invoke_3_cold_1(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  v2 = 138543362;
  v3 = a1;
  _os_log_error_impl(&dword_19A0E6000, a2, OS_LOG_TYPE_ERROR, "Failed to get health services proxy: %{public}@", (uint8_t *)&v2, 0xCu);
}

void __76__HKHealthServicesManager__startHealthServiceExtendedDiscovery_withHandler___block_invoke_3_cold_1()
{
  os_log_t v0;
  uint8_t v1[16];

  OUTLINED_FUNCTION_8_0();
  _os_log_error_impl(&dword_19A0E6000, v0, OS_LOG_TYPE_ERROR, "*** Ending discovery after server failure.", v1, 2u);
  OUTLINED_FUNCTION_6();
}

void __71__HKHealthServicesManager__getCBPeripheralforIdentifer_withCompletion___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_8_0();
  OUTLINED_FUNCTION_0_0(&dword_19A0E6000, v0, v1, "More then one peripheral was returned for identifier on get write status", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_6();
}

void __70__HKHealthServicesManager__getHealthPeripheralsStatus_withCompletion___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_8_0();
  OUTLINED_FUNCTION_0_0(&dword_19A0E6000, v0, v1, "BTLE device is missing custom property UpdateHealth", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_6();
}

void __77__HKHealthServicesManager__setHealthPeripheralsStatus_status_withCompletion___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_8_0();
  OUTLINED_FUNCTION_0_0(&dword_19A0E6000, v0, v1, "BTLE Device missing when updating property", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_6();
}

void __98__HKHealthServicesManager_clientRemote_deliverDiscoveryHealthService_toClient_finished_withError___block_invoke_cold_1(uint64_t a1, void *a2)
{
  const char *v2;
  NSObject *v3;
  void *v4;
  uint64_t v5;
  uint8_t v6[40];
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  v2 = *(const char **)(a1 + 64);
  v3 = a2;
  NSStringFromSelector(v2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_4_6();
  OUTLINED_FUNCTION_7_1();
  OUTLINED_FUNCTION_1_15(&dword_19A0E6000, v3, v5, "%{public}@, discovery for canceled client ID %d. service: %@, error: %@", v6);

  OUTLINED_FUNCTION_5_1();
}

void __98__HKHealthServicesManager_clientRemote_deliverDiscoveryHealthService_toClient_finished_withError___block_invoke_69_cold_1(uint64_t a1, void *a2)
{
  const char *v2;
  NSObject *v3;
  void *v4;
  uint64_t v5;
  uint8_t v6[40];
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  v2 = *(const char **)(a1 + 56);
  v3 = a2;
  NSStringFromSelector(v2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_4_6();
  OUTLINED_FUNCTION_7_1();
  OUTLINED_FUNCTION_1_15(&dword_19A0E6000, v3, v5, "%{public}@, rescheduling, discovery not yet available for client ID %d. service: %{public}@, error: %{public}@", v6);

  OUTLINED_FUNCTION_5_1();
}

void __102__HKHealthServicesManager_clientRemote_deliverSessionHealthServiceStatus_toClient_finished_withError___block_invoke_cold_1(uint64_t a1, void *a2)
{
  const char *v3;
  NSObject *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  int v8;
  void *v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v3 = *(const char **)(a1 + 56);
  v4 = a2;
  NSStringFromSelector(v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  _HKStringForHealthServiceStatus(*(_QWORD *)(a1 + 64));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = 138544130;
  v9 = v5;
  OUTLINED_FUNCTION_0_18();
  OUTLINED_FUNCTION_1_15(&dword_19A0E6000, v4, v7, "%{public}@, session for canceled client ID %d. status: %{public}@, error: %{public}@", (uint8_t *)&v8);

  OUTLINED_FUNCTION_3_4();
}

void __102__HKHealthServicesManager_clientRemote_deliverSessionHealthServiceStatus_toClient_finished_withError___block_invoke_70_cold_1(uint64_t a1, void *a2)
{
  const char *v3;
  NSObject *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  int v8;
  void *v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v3 = *(const char **)(a1 + 48);
  v4 = a2;
  NSStringFromSelector(v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  _HKStringForHealthServiceStatus(*(_QWORD *)(a1 + 64));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = 138544130;
  v9 = v5;
  OUTLINED_FUNCTION_0_18();
  OUTLINED_FUNCTION_1_15(&dword_19A0E6000, v4, v7, "%{public}@, rescheduling, session not yet available for client ID %d. status: %{public}@, error: %{public}@", (uint8_t *)&v8);

  OUTLINED_FUNCTION_3_4();
}

@end
