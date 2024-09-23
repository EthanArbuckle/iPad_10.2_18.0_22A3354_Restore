@implementation HUDeviceController

- (HUDeviceController)init
{
  HUDeviceController *v2;
  NSObject *v3;
  NSObject *v4;
  dispatch_queue_t v5;
  void *v6;
  uint64_t v7;
  AXDispatchTimer *sendPropertyUpdatesTimer;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)HUDeviceController;
  v2 = -[HUDeviceController init](&v10, sel_init);
  if (v2)
  {
    dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v3 = objc_claimAutoreleasedReturnValue();
    dispatch_queue_attr_make_with_qos_class(v3, QOS_CLASS_DEFAULT, 0);
    v4 = objc_claimAutoreleasedReturnValue();
    v5 = dispatch_queue_create("hu_device_updates_queue", v4);
    -[HUDeviceController setDeviceUpdatesQueue:](v2, "setDeviceUpdatesQueue:", v5);

    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[HUDeviceController setUpdateDeviceBlocks:](v2, "setUpdateDeviceBlocks:", v6);

    v7 = objc_msgSend(objc_alloc(MEMORY[0x1E0CF3978]), "initWithTargetSerialQueue:", v2->_deviceUpdatesQueue);
    sendPropertyUpdatesTimer = v2->_sendPropertyUpdatesTimer;
    v2->_sendPropertyUpdatesTimer = (AXDispatchTimer *)v7;

    -[AXDispatchTimer setAutomaticallyCancelPendingBlockUponSchedulingNewBlock:](v2->_sendPropertyUpdatesTimer, "setAutomaticallyCancelPendingBlockUponSchedulingNewBlock:", 1);
  }
  return v2;
}

- (id)hearingAidForDeviceID:(id)a3
{
  return 0;
}

- (void)device:(id)a3 didUpdateProperty:(unint64_t)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  NSObject *v13;
  void *v14;
  void *v15;
  NSObject *deviceUpdatesQueue;
  id v17;
  _QWORD block[5];
  id v19;
  unint64_t v20;
  uint8_t buf[4];
  uint64_t v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  HAInitializeLogging();
  v7 = (void *)MEMORY[0x1E0CB3940];
  -[HUDeviceController updateDeviceBlocks](self, "updateDeviceBlocks");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "stringWithFormat:", CFSTR("UPDATING %@ - %@"), self, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s:%d %@"), "-[HUDeviceController device:didUpdateProperty:]", 42, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = (void *)*MEMORY[0x1E0D2F928];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D2F928], OS_LOG_TYPE_DEFAULT))
  {
    v12 = objc_retainAutorelease(v10);
    v13 = v11;
    *(_DWORD *)buf = 136446210;
    v22 = objc_msgSend(v12, "UTF8String");
    _os_log_impl(&dword_1DE311000, v13, OS_LOG_TYPE_DEFAULT, "%{public}s", buf, 0xCu);

  }
  objc_msgSend(v6, "deviceUUID");
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  v15 = (void *)objc_msgSend(v14, "copy");
  deviceUpdatesQueue = self->_deviceUpdatesQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __47__HUDeviceController_device_didUpdateProperty___block_invoke;
  block[3] = &unk_1EA8E8248;
  block[4] = self;
  v19 = v15;
  v20 = a4;
  v17 = v15;
  dispatch_async(deviceUpdatesQueue, block);

}

void __47__HUDeviceController_device_didUpdateProperty___block_invoke(uint64_t a1)
{
  id v2;
  uint64_t v3;
  void *v4;
  id v5;
  void *v6;
  BOOL v7;
  id v8;
  id v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  void (*v13)(uint64_t);
  void *v14;
  uint64_t v15;
  uint64_t *v16;
  uint64_t v17;
  uint64_t (*v18)(uint64_t, uint64_t);
  void (*v19)(uint64_t);
  id v20;
  _QWORD v21[5];

  objc_msgSend(*(id *)(a1 + 32), "deviceUpdatesDescription");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  v3 = MEMORY[0x1E0C809B0];
  if (!v2)
  {
    v2 = objc_alloc_init(MEMORY[0x1E0C99E08]);
    objc_msgSend(*(id *)(a1 + 32), "sendPropertyUpdatesTimer");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v21[0] = v3;
    v21[1] = 3221225472;
    v21[2] = __47__HUDeviceController_device_didUpdateProperty___block_invoke_2;
    v21[3] = &unk_1EA8E8220;
    v21[4] = *(_QWORD *)(a1 + 32);
    objc_msgSend(v4, "afterDelay:processBlock:", v21, 1.0);

  }
  v5 = *(id *)(a1 + 40);
  objc_msgSend(v2, "objectForKey:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
    v7 = 1;
  else
    v7 = v5 == 0;
  if (!v7)
  {
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "setObject:forKey:", v6, v5);
  }
  objc_msgSend(*(id *)(a1 + 32), "hearingAidForDeviceID:", v5);
  v15 = 0;
  v16 = &v15;
  v17 = 0x3032000000;
  v18 = __Block_byref_object_copy_;
  v19 = __Block_byref_object_dispose_;
  v20 = 0;
  v11 = v3;
  v12 = 3221225472;
  v13 = __47__HUDeviceController_device_didUpdateProperty___block_invoke_17;
  v14 = &unk_1EA8E84A0;
  v8 = (id)objc_claimAutoreleasedReturnValue();
  AXPerformSafeBlock();
  v9 = (id)v16[5];

  _Block_object_dispose(&v15, 8);
  if (v9)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_msgSend(v6, "addEntriesFromDictionary:", v9, v11, 3221225472, __47__HUDeviceController_device_didUpdateProperty___block_invoke_17, &unk_1EA8E84A0);
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", *(_QWORD *)(a1 + 48), v11, 3221225472, __47__HUDeviceController_device_didUpdateProperty___block_invoke_17, &unk_1EA8E84A0);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "setObject:forKey:", v9, v10);

    }
  }
  objc_msgSend(*(id *)(a1 + 32), "setDeviceUpdatesDescription:", v2, v11, v12, v13, v14);

}

void __47__HUDeviceController_device_didUpdateProperty___block_invoke_2(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  void *v4;
  id v5;
  _QWORD v6[4];
  id v7;
  _QWORD v8[5];

  objc_msgSend(*(id *)(a1 + 32), "deviceUpdatesDescription");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = MEMORY[0x1E0C809B0];
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __47__HUDeviceController_device_didUpdateProperty___block_invoke_3;
  v8[3] = &unk_1EA8E8450;
  v8[4] = *(_QWORD *)(a1 + 32);
  objc_msgSend(v2, "enumerateKeysAndObjectsUsingBlock:", v8);
  objc_msgSend(*(id *)(a1 + 32), "updateDeviceBlocks");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = v3;
  v6[1] = 3221225472;
  v6[2] = __47__HUDeviceController_device_didUpdateProperty___block_invoke_14;
  v6[3] = &unk_1EA8E8478;
  v7 = v2;
  v5 = v2;
  objc_msgSend(v4, "enumerateObjectsUsingBlock:", v6);

  objc_msgSend(*(id *)(a1 + 32), "setDeviceUpdatesDescription:", 0);
}

void __47__HUDeviceController_device_didUpdateProperty___block_invoke_3(uint64_t a1, uint64_t a2, void *a3)
{
  id v5;
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
  id v17;
  NSObject *v18;
  uint8_t buf[4];
  uint64_t v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  objc_msgSend(*(id *)(a1 + 32), "hearingAidForDeviceID:", a2);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6 && objc_msgSend(*(id *)(a1 + 32), "representsLocalDevices"))
  {
    objc_msgSend(v6, "valueForProperty:", 0x4000000);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setObject:forKey:", v7, &unk_1EA8FF8D8);

    objc_msgSend(v6, "valueForProperty:", 0x200000);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setObject:forKey:", v8, &unk_1EA8FF8F0);

    objc_msgSend(v6, "valueForProperty:", 0x20000000);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setObject:forKey:", v9, &unk_1EA8FF908);

    objc_msgSend(v6, "valueForProperty:", 0x10000);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setObject:forKey:", v10, &unk_1EA8FF920);

    HAInitializeLogging();
    v11 = (void *)MEMORY[0x1E0CB3940];
    objc_msgSend(v6, "valueForProperty:", 0x4000000);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "valueForProperty:", 0x200000);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "stringWithFormat:", CFSTR("Update Paired %@ Connected %@"), v12, v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s:%d %@"), "-[HUDeviceController device:didUpdateProperty:]_block_invoke", 60, v14);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = (void *)*MEMORY[0x1E0D2F928];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D2F928], OS_LOG_TYPE_DEFAULT))
    {
      v17 = objc_retainAutorelease(v15);
      v18 = v16;
      *(_DWORD *)buf = 136446210;
      v20 = objc_msgSend(v17, "UTF8String");
      _os_log_impl(&dword_1DE311000, v18, OS_LOG_TYPE_DEFAULT, "%{public}s", buf, 0xCu);

    }
  }

}

uint64_t __47__HUDeviceController_device_didUpdateProperty___block_invoke_14(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(uint64_t, _QWORD))(a2 + 16))(a2, *(_QWORD *)(a1 + 32));
}

void __47__HUDeviceController_device_didUpdateProperty___block_invoke_17(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  objc_msgSend(*(id *)(a1 + 32), "valueForProperty:", *(_QWORD *)(a1 + 48));
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

- (void)registerForPropertyUpdates:(id)a3
{
  void *v4;
  void *v5;
  id v6;

  if (a3)
  {
    v6 = (id)objc_msgSend(a3, "copy");
    -[HUDeviceController updateDeviceBlocks](self, "updateDeviceBlocks");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = (void *)MEMORY[0x1DF0EB808](v6);
    objc_msgSend(v4, "addObject:", v5);

  }
}

- (void)stopPropertyUpdates
{
  void *v3;
  void *v4;
  void *v5;
  id v6;
  NSObject *v7;
  NSObject *deviceUpdatesQueue;
  void *v9;
  _QWORD block[5];
  uint8_t buf[4];
  uint64_t v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  HAInitializeLogging();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Stopping Updates"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s:%d %@"), "-[HUDeviceController stopPropertyUpdates]", 106, v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)*MEMORY[0x1E0D2F928];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D2F928], OS_LOG_TYPE_DEFAULT))
  {
    v6 = objc_retainAutorelease(v4);
    v7 = v5;
    *(_DWORD *)buf = 136446210;
    v12 = objc_msgSend(v6, "UTF8String");
    _os_log_impl(&dword_1DE311000, v7, OS_LOG_TYPE_DEFAULT, "%{public}s", buf, 0xCu);

  }
  deviceUpdatesQueue = self->_deviceUpdatesQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __41__HUDeviceController_stopPropertyUpdates__block_invoke;
  block[3] = &unk_1EA8E8220;
  block[4] = self;
  dispatch_async(deviceUpdatesQueue, block);
  -[HUDeviceController updateDeviceBlocks](self, "updateDeviceBlocks");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "removeAllObjects");

}

void __41__HUDeviceController_stopPropertyUpdates__block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  id v4;
  _QWORD v5[4];
  id v6;

  objc_msgSend(*(id *)(a1 + 32), "deviceUpdatesDescription");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "updateDeviceBlocks");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __41__HUDeviceController_stopPropertyUpdates__block_invoke_2;
  v5[3] = &unk_1EA8E8478;
  v6 = v2;
  v4 = v2;
  objc_msgSend(v3, "enumerateObjectsUsingBlock:", v5);

  objc_msgSend(*(id *)(a1 + 32), "setDeviceUpdatesDescription:", v4);
}

uint64_t __41__HUDeviceController_stopPropertyUpdates__block_invoke_2(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(uint64_t, _QWORD))(a2 + 16))(a2, *(_QWORD *)(a1 + 32));
}

- (void)updateProperty:(unint64_t)a3 forDeviceID:(id)a4
{
  void *v6;
  void *v7;

  -[HUDeviceController hearingAidForDeviceID:](self, "hearingAidForDeviceID:", a4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    v7 = v6;
    -[HUDeviceController device:didUpdateProperty:](self, "device:didUpdateProperty:", v6, a3);
    v6 = v7;
  }

}

- (void)writeValue:(id)a3 forProperty:(unint64_t)a4 andDeviceID:(id)a5
{
  void *v8;
  void *v9;
  id v10;

  v10 = a3;
  -[HUDeviceController hearingAidForDeviceID:](self, "hearingAidForDeviceID:", a5);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v8;
  if (v8)
    objc_msgSend(v8, "setValue:forProperty:", v10, a4);

}

- (BOOL)representsLocalDevices
{
  return 0;
}

- (OS_dispatch_queue)deviceUpdatesQueue
{
  return self->_deviceUpdatesQueue;
}

- (void)setDeviceUpdatesQueue:(id)a3
{
  objc_storeStrong((id *)&self->_deviceUpdatesQueue, a3);
}

- (NSMutableDictionary)deviceUpdatesDescription
{
  return self->_deviceUpdatesDescription;
}

- (void)setDeviceUpdatesDescription:(id)a3
{
  objc_storeStrong((id *)&self->_deviceUpdatesDescription, a3);
}

- (NSMutableArray)updateDeviceBlocks
{
  return self->_updateDeviceBlocks;
}

- (void)setUpdateDeviceBlocks:(id)a3
{
  objc_storeStrong((id *)&self->_updateDeviceBlocks, a3);
}

- (AXDispatchTimer)sendPropertyUpdatesTimer
{
  return self->_sendPropertyUpdatesTimer;
}

- (void)setSendPropertyUpdatesTimer:(id)a3
{
  objc_storeStrong((id *)&self->_sendPropertyUpdatesTimer, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sendPropertyUpdatesTimer, 0);
  objc_storeStrong((id *)&self->_updateDeviceBlocks, 0);
  objc_storeStrong((id *)&self->_deviceUpdatesDescription, 0);
  objc_storeStrong((id *)&self->_deviceUpdatesQueue, 0);
}

@end
