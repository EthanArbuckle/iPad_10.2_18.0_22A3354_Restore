@implementation ACCFeaturePluginHIDProvider

+ (id)sharedHIDProvider
{
  if (sharedHIDProvider_once != -1)
    dispatch_once(&sharedHIDProvider_once, &__block_literal_global);
  return (id)sharedHIDProvider_sharedInstance;
}

void __48__ACCFeaturePluginHIDProvider_sharedHIDProvider__block_invoke()
{
  ACCFeaturePluginHIDProvider *v0;
  void *v1;

  v0 = objc_alloc_init(ACCFeaturePluginHIDProvider);
  v1 = (void *)sharedHIDProvider_sharedInstance;
  sharedHIDProvider_sharedInstance = (uint64_t)v0;

}

- (ACCFeaturePluginHIDProvider)init
{
  ACCFeaturePluginHIDProvider *v2;
  ACCFeaturePluginHIDProvider *v3;
  NSMutableArray *descriptorUUIDs;
  uint64_t v5;
  AccessoryHIDClient *hidClient;
  dispatch_queue_t v7;
  OS_dispatch_queue *hidProviderLock;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)ACCFeaturePluginHIDProvider;
  v2 = -[ACCFeaturePluginHIDProvider init](&v10, sel_init);
  v3 = v2;
  if (v2)
  {
    descriptorUUIDs = v2->_descriptorUUIDs;
    v2->_descriptorUUIDs = 0;

    v5 = objc_msgSend(objc_alloc(MEMORY[0x24BE00B38]), "initWithDelegate:", v3);
    hidClient = v3->_hidClient;
    v3->_hidClient = (AccessoryHIDClient *)v5;

    v7 = dispatch_queue_create("hidProviderSerialQueue", 0);
    hidProviderLock = v3->_hidProviderLock;
    v3->_hidProviderLock = (OS_dispatch_queue *)v7;

  }
  return v3;
}

- (void)dealloc
{
  objc_super v2;

  v2.receiver = self;
  v2.super_class = (Class)ACCFeaturePluginHIDProvider;
  -[ACCFeaturePluginHIDProvider dealloc](&v2, sel_dealloc);
}

- (void)stopHIDProvider
{
  NSObject *v3;
  _QWORD block[5];

  -[ACCFeaturePluginHIDProvider hidProviderLock](self, "hidProviderLock");
  v3 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __46__ACCFeaturePluginHIDProvider_stopHIDProvider__block_invoke;
  block[3] = &unk_24DD6B6B8;
  block[4] = self;
  dispatch_sync(v3, block);

  -[ACCFeaturePluginHIDProvider setHidClient:](self, "setHidClient:", 0);
  -[ACCFeaturePluginHIDProvider setHidProviderLock:](self, "setHidProviderLock:", 0);
}

uint64_t __46__ACCFeaturePluginHIDProvider_stopHIDProvider__block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  _BYTE v12[128];
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  v8 = 0u;
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  objc_msgSend(*(id *)(a1 + 32), "descriptorUUIDs", 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v9;
    do
    {
      v6 = 0;
      do
      {
        if (*(_QWORD *)v9 != v5)
          objc_enumerationMutation(v2);
        objc_msgSend(*(id *)(*((_QWORD *)&v8 + 1) + 8 * v6++), "removeDescriptor");
      }
      while (v4 != v6);
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
    }
    while (v4);
  }

  return objc_msgSend(*(id *)(a1 + 32), "setDescriptorUUIDs:", 0);
}

- (id)createHIDDescriptor:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  id v7;
  _QWORD block[4];
  id v10;
  ACCFeaturePluginHIDProvider *v11;
  uint64_t *v12;
  uint64_t v13;
  uint64_t *v14;
  uint64_t v15;
  uint64_t (*v16)(uint64_t, uint64_t);
  void (*v17)(uint64_t);
  id v18;

  v4 = a3;
  v13 = 0;
  v14 = &v13;
  v15 = 0x3032000000;
  v16 = __Block_byref_object_copy_;
  v17 = __Block_byref_object_dispose_;
  v18 = 0;
  -[ACCFeaturePluginHIDProvider hidProviderLock](self, "hidProviderLock");
  v5 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __51__ACCFeaturePluginHIDProvider_createHIDDescriptor___block_invoke;
  block[3] = &unk_24DD6B758;
  v10 = v4;
  v11 = self;
  v12 = &v13;
  v6 = v4;
  dispatch_sync(v5, block);

  v7 = (id)v14[5];
  _Block_object_dispose(&v13, 8);

  return v7;
}

void __51__ACCFeaturePluginHIDProvider_createHIDDescriptor___block_invoke(uint64_t a1)
{
  ACCFeaturePluginHIDDescriptor *v2;
  uint64_t v3;
  ACCFeaturePluginHIDDescriptor *v4;
  void *v5;
  id v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  _QWORD v11[5];
  _QWORD v12[5];
  _QWORD v13[4];
  uint64_t v14;

  v2 = [ACCFeaturePluginHIDDescriptor alloc];
  v13[0] = MEMORY[0x24BDAC760];
  v13[1] = 3221225472;
  v13[2] = __51__ACCFeaturePluginHIDProvider_createHIDDescriptor___block_invoke_2;
  v13[3] = &unk_24DD6B6E0;
  v3 = *(_QWORD *)(a1 + 32);
  v14 = *(_QWORD *)(a1 + 40);
  v11[4] = v14;
  v12[0] = MEMORY[0x24BDAC760];
  v12[1] = 3221225472;
  v12[2] = __51__ACCFeaturePluginHIDProvider_createHIDDescriptor___block_invoke_3;
  v12[3] = &unk_24DD6B708;
  v12[4] = v14;
  v11[0] = MEMORY[0x24BDAC760];
  v11[1] = 3221225472;
  v11[2] = __51__ACCFeaturePluginHIDProvider_createHIDDescriptor___block_invoke_4;
  v11[3] = &unk_24DD6B730;
  v4 = -[ACCFeaturePluginHIDDescriptor initWithDecriptorInfo:sendOutReport:sendGetReport:sendComponentUpdate:](v2, "initWithDecriptorInfo:sendOutReport:sendGetReport:sendComponentUpdate:", v3, v13, v12, v11);
  if (v4)
  {
    objc_msgSend(*(id *)(a1 + 40), "descriptorUUIDs");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v5)
    {
      v6 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
      objc_msgSend(*(id *)(a1 + 40), "setDescriptorUUIDs:", v6);

    }
    objc_msgSend(*(id *)(a1 + 40), "descriptorUUIDs");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "addObject:", v4);

    -[ACCFeaturePluginHIDDescriptor hidDeviceUUIDStr](v4, "hidDeviceUUIDStr");
    v8 = objc_claimAutoreleasedReturnValue();
    v9 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
    v10 = *(void **)(v9 + 40);
    *(_QWORD *)(v9 + 40) = v8;

  }
}

void __51__ACCFeaturePluginHIDProvider_createHIDDescriptor___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  void *v4;
  id v5;
  id v6;
  id v7;

  v4 = *(void **)(a1 + 32);
  v5 = a3;
  v6 = a2;
  objc_msgSend(v4, "hidClient");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "sendOutReport:fromUUID:", v5, v6);

}

void __51__ACCFeaturePluginHIDProvider_createHIDDescriptor___block_invoke_3(uint64_t a1, void *a2, void *a3, void *a4)
{
  void *v6;
  id v7;
  id v8;
  id v9;
  id v10;

  v6 = *(void **)(a1 + 32);
  v7 = a4;
  v8 = a3;
  v9 = a2;
  objc_msgSend(v6, "hidClient");
  v10 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "sendGetReportForType:andID:fromUUID:", v8, v7, v9);

}

void __51__ACCFeaturePluginHIDProvider_createHIDDescriptor___block_invoke_4(uint64_t a1, void *a2, uint64_t a3)
{
  void *v4;
  id v5;
  id v6;

  v4 = *(void **)(a1 + 32);
  v5 = a2;
  objc_msgSend(v4, "hidClient");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "hidDescriptor:active:", v5, a3);

}

- (BOOL)deleteHIDDescriptor:(id)a3
{
  id v4;
  NSObject *v5;
  BOOL v6;
  _QWORD block[5];
  id v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  char v14;

  v4 = a3;
  v11 = 0;
  v12 = &v11;
  v13 = 0x2020000000;
  v14 = 0;
  if (v4)
  {
    -[ACCFeaturePluginHIDProvider hidProviderLock](self, "hidProviderLock");
    v5 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __51__ACCFeaturePluginHIDProvider_deleteHIDDescriptor___block_invoke;
    block[3] = &unk_24DD6B758;
    block[4] = self;
    v9 = v4;
    v10 = &v11;
    dispatch_sync(v5, block);

    v6 = *((_BYTE *)v12 + 24) != 0;
  }
  else
  {
    v6 = 0;
  }
  _Block_object_dispose(&v11, 8);

  return v6;
}

void __51__ACCFeaturePluginHIDProvider_deleteHIDDescriptor___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
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
  objc_msgSend(*(id *)(a1 + 32), "descriptorUUIDs", 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v13;
LABEL_3:
    v6 = 0;
    while (1)
    {
      if (*(_QWORD *)v13 != v5)
        objc_enumerationMutation(v2);
      v7 = *(void **)(*((_QWORD *)&v12 + 1) + 8 * v6);
      objc_msgSend(v7, "hidDeviceUUIDStr");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = *(void **)(a1 + 40);

      if (v8 == v9)
        break;
      if (v4 == ++v6)
      {
        v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
        if (v4)
          goto LABEL_3;
        goto LABEL_12;
      }
    }
    v10 = v7;

    if (!v10)
      return;
    objc_msgSend(v10, "removeDescriptor");
    objc_msgSend(*(id *)(a1 + 32), "descriptorUUIDs");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "removeObject:", v10);

    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = 1;
    v2 = v10;
  }
LABEL_12:

}

- (BOOL)processInReport:(id)a3 forUUID:(id)a4
{
  id v6;
  id v7;
  void *v8;
  BOOL v9;
  NSObject *v10;
  _QWORD v12[5];
  id v13;
  id v14;
  uint64_t *v15;
  uint64_t v16;
  uint64_t *v17;
  uint64_t v18;
  char v19;

  v6 = a3;
  v7 = a4;
  v8 = v7;
  v9 = 0;
  v16 = 0;
  v17 = &v16;
  v18 = 0x2020000000;
  v19 = 0;
  if (v6 && v7)
  {
    -[ACCFeaturePluginHIDProvider hidProviderLock](self, "hidProviderLock");
    v10 = objc_claimAutoreleasedReturnValue();
    v12[0] = MEMORY[0x24BDAC760];
    v12[1] = 3221225472;
    v12[2] = __55__ACCFeaturePluginHIDProvider_processInReport_forUUID___block_invoke;
    v12[3] = &unk_24DD6B780;
    v12[4] = self;
    v13 = v8;
    v15 = &v16;
    v14 = v6;
    dispatch_sync(v10, v12);

    v9 = *((_BYTE *)v17 + 24) != 0;
  }
  _Block_object_dispose(&v16, 8);

  return v9;
}

void __55__ACCFeaturePluginHIDProvider_processInReport_forUUID___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t i;
  void *v7;
  void *v8;
  void *v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  objc_msgSend(*(id *)(a1 + 32), "descriptorUUIDs", 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v11;
    do
    {
      for (i = 0; i != v4; ++i)
      {
        if (*(_QWORD *)v11 != v5)
          objc_enumerationMutation(v2);
        v7 = *(void **)(*((_QWORD *)&v10 + 1) + 8 * i);
        objc_msgSend(v7, "hidDeviceUUIDStr");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        v9 = *(void **)(a1 + 40);

        if (v8 == v9)
          *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) = objc_msgSend(v7, "handleInReport:", *(_QWORD *)(a1 + 48));
      }
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    }
    while (v4);
  }

}

- (BOOL)processGetReportResponse:(id)a3 reportType:(unsigned __int8)a4 reportID:(unsigned __int8)a5 forUUID:(id)a6
{
  id v10;
  id v11;
  void *v12;
  BOOL v13;
  NSObject *v14;
  _QWORD block[5];
  id v17;
  id v18;
  uint64_t *v19;
  unsigned __int8 v20;
  unsigned __int8 v21;
  uint64_t v22;
  uint64_t *v23;
  uint64_t v24;
  char v25;

  v10 = a3;
  v11 = a6;
  v12 = v11;
  v13 = 0;
  v22 = 0;
  v23 = &v22;
  v24 = 0x2020000000;
  v25 = 0;
  if (v10 && v11)
  {
    -[ACCFeaturePluginHIDProvider hidProviderLock](self, "hidProviderLock");
    v14 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __84__ACCFeaturePluginHIDProvider_processGetReportResponse_reportType_reportID_forUUID___block_invoke;
    block[3] = &unk_24DD6B7A8;
    block[4] = self;
    v17 = v12;
    v19 = &v22;
    v20 = a4;
    v21 = a5;
    v18 = v10;
    dispatch_sync(v14, block);

    v13 = *((_BYTE *)v23 + 24) != 0;
  }
  _Block_object_dispose(&v22, 8);

  return v13;
}

void __84__ACCFeaturePluginHIDProvider_processGetReportResponse_reportType_reportID_forUUID___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t i;
  void *v7;
  void *v8;
  void *v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  objc_msgSend(*(id *)(a1 + 32), "descriptorUUIDs", 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v11;
    do
    {
      for (i = 0; i != v4; ++i)
      {
        if (*(_QWORD *)v11 != v5)
          objc_enumerationMutation(v2);
        v7 = *(void **)(*((_QWORD *)&v10 + 1) + 8 * i);
        objc_msgSend(v7, "hidDeviceUUIDStr");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        v9 = *(void **)(a1 + 40);

        if (v8 == v9)
          *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) = objc_msgSend(v7, "handleGetReportResponse:reportID:report:", *(unsigned __int8 *)(a1 + 64), *(unsigned __int8 *)(a1 + 65), *(_QWORD *)(a1 + 48));
      }
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    }
    while (v4);
  }

}

- (id)getDescriptor:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  id v7;
  _QWORD block[5];
  id v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t (*v15)(uint64_t, uint64_t);
  void (*v16)(uint64_t);
  id v17;

  v4 = a3;
  v12 = 0;
  v13 = &v12;
  v14 = 0x3032000000;
  v15 = __Block_byref_object_copy_;
  v16 = __Block_byref_object_dispose_;
  v17 = 0;
  if (v4)
  {
    -[ACCFeaturePluginHIDProvider hidProviderLock](self, "hidProviderLock");
    v5 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __45__ACCFeaturePluginHIDProvider_getDescriptor___block_invoke;
    block[3] = &unk_24DD6B758;
    block[4] = self;
    v10 = v4;
    v11 = &v12;
    dispatch_sync(v5, block);

    v6 = (void *)v13[5];
  }
  else
  {
    v6 = 0;
  }
  v7 = v6;
  _Block_object_dispose(&v12, 8);

  return v7;
}

void __45__ACCFeaturePluginHIDProvider_getDescriptor___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t i;
  void *v7;
  void *v8;
  void *v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  objc_msgSend(*(id *)(a1 + 32), "descriptorUUIDs", 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v11;
    while (2)
    {
      for (i = 0; i != v4; ++i)
      {
        if (*(_QWORD *)v11 != v5)
          objc_enumerationMutation(v2);
        v7 = *(void **)(*((_QWORD *)&v10 + 1) + 8 * i);
        objc_msgSend(v7, "hidDeviceUUIDStr");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        v9 = *(void **)(a1 + 40);

        if (v8 == v9)
        {
          objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), v7);
          goto LABEL_11;
        }
      }
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
      if (v4)
        continue;
      break;
    }
  }
LABEL_11:

}

- (NSMutableArray)descriptorUUIDs
{
  return self->_descriptorUUIDs;
}

- (void)setDescriptorUUIDs:(id)a3
{
  objc_storeStrong((id *)&self->_descriptorUUIDs, a3);
}

- (AccessoryHIDClient)hidClient
{
  return (AccessoryHIDClient *)objc_getProperty(self, a2, 16, 1);
}

- (void)setHidClient:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 16);
}

- (OS_dispatch_queue)hidProviderLock
{
  return self->_hidProviderLock;
}

- (void)setHidProviderLock:(id)a3
{
  objc_storeStrong((id *)&self->_hidProviderLock, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_hidProviderLock, 0);
  objc_storeStrong((id *)&self->_hidClient, 0);
  objc_storeStrong((id *)&self->_descriptorUUIDs, 0);
}

@end
