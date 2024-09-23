@implementation COCapabilityAddOn

- (COCapabilityAddOn)initWithSupportedCapabilities:(id)a3
{
  id v4;
  COCapabilityAddOn *v5;
  COCapabilityAddOn *v6;
  NSSet *v7;
  NSSet *availableCapabilities;
  id v9;
  void *v10;
  NSDictionary *v11;
  NSDictionary *gatheredCapabilities;
  objc_super v14;

  v4 = a3;
  v14.receiver = self;
  v14.super_class = (Class)COCapabilityAddOn;
  v5 = -[COMeshAddOn init](&v14, sel_init);
  v6 = v5;
  if (v5)
  {
    v5->_lock._os_unfair_lock_opaque = 0;
    v7 = (NSSet *)objc_alloc_init(MEMORY[0x24BDBCF20]);
    availableCapabilities = v6->_availableCapabilities;
    v6->_availableCapabilities = v7;

    if (v4)
      v9 = (id)objc_msgSend(v4, "copy");
    else
      v9 = objc_alloc_init(MEMORY[0x24BDBCF20]);
    v10 = v9;
    objc_storeStrong((id *)&v6->_supportedCapabilities, v9);

    v11 = (NSDictionary *)objc_alloc_init(MEMORY[0x24BDBCE70]);
    gatheredCapabilities = v6->_gatheredCapabilities;
    v6->_gatheredCapabilities = v11;

  }
  return v6;
}

- (COCapabilityAddOn)init
{
  return -[COCapabilityAddOn initWithSupportedCapabilities:](self, "initWithSupportedCapabilities:", 0);
}

- (void)meshController:(id)a3 didTransitionToState:(unint64_t)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  int v10;
  id v11;
  objc_super v12;

  v6 = a3;
  v7 = v6;
  if (a4 != 3)
  {
    if ((a4 & 0xFFFFFFFFFFFFFFFBLL) != 0)
      goto LABEL_8;
    -[COCapabilityAddOn setGatheredCapabilities:](self, "setGatheredCapabilities:", MEMORY[0x24BDBD1B8]);
    -[COCapabilityAddOn supportedCapabilities](self, "supportedCapabilities");
    v11 = (id)objc_claimAutoreleasedReturnValue();
    -[COCapabilityAddOn setAvailableCapabilities:](self, "setAvailableCapabilities:", v11);
LABEL_7:

    goto LABEL_8;
  }
  objc_msgSend(v6, "me");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "leader");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v8, "isEqual:", v9);

  if (!v10)
  {
    v11 = objc_alloc_init(MEMORY[0x24BDBCE70]);
    -[COCapabilityAddOn setGatheredCapabilities:](self, "setGatheredCapabilities:", v11);
    goto LABEL_7;
  }
  -[COCapabilityAddOn performCapabilitiesUpdate](self, "performCapabilitiesUpdate");
LABEL_8:
  v12.receiver = self;
  v12.super_class = (Class)COCapabilityAddOn;
  -[COMeshAddOn meshController:didTransitionToState:](&v12, sel_meshController_didTransitionToState_, v7, a4);

}

- (void)didAddToMeshController:(id)a3
{
  id v4;
  uint64_t v5;
  _QWORD v6[4];
  id v7;
  _QWORD v8[5];
  id v9;
  _QWORD v10[4];
  id v11;
  id location;
  objc_super v13;

  v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)COCapabilityAddOn;
  -[COMeshAddOn didAddToMeshController:](&v13, sel_didAddToMeshController_, v4);
  objc_initWeak(&location, self);
  v5 = MEMORY[0x24BDAC760];
  v10[0] = MEMORY[0x24BDAC760];
  v10[1] = 3221225472;
  v10[2] = __44__COCapabilityAddOn_didAddToMeshController___block_invoke;
  v10[3] = &unk_24D4B1170;
  objc_copyWeak(&v11, &location);
  objc_msgSend(v4, "registerHandler:forRequestClass:", v10, objc_opt_class());
  v8[0] = v5;
  v8[1] = 3221225472;
  v8[2] = __44__COCapabilityAddOn_didAddToMeshController___block_invoke_2;
  v8[3] = &unk_24D4B1198;
  objc_copyWeak(&v9, &location);
  v8[4] = self;
  objc_msgSend(v4, "registerHandler:forCommandClass:", v8, objc_opt_class());
  v6[0] = v5;
  v6[1] = 3221225472;
  v6[2] = __44__COCapabilityAddOn_didAddToMeshController___block_invoke_3;
  v6[3] = &unk_24D4B11C0;
  objc_copyWeak(&v7, &location);
  objc_msgSend(v4, "registerHandler:forNotificationClass:", v6, objc_opt_class());
  objc_destroyWeak(&v7);
  objc_destroyWeak(&v9);
  objc_destroyWeak(&v11);
  objc_destroyWeak(&location);

}

void __44__COCapabilityAddOn_didAddToMeshController___block_invoke(uint64_t a1, void *a2, void *a3)
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
    objc_msgSend(WeakRetained, "handleCapabilitiesReadRequest:callback:", v8, v5);

}

void __44__COCapabilityAddOn_didAddToMeshController___block_invoke_2(uint64_t a1, void *a2)
{
  id WeakRetained;
  id v4;

  v4 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
    objc_msgSend(*(id *)(a1 + 32), "handleCapabilitiesUpdateCommand:", v4);

}

void __44__COCapabilityAddOn_didAddToMeshController___block_invoke_3(uint64_t a1, void *a2)
{
  id WeakRetained;
  void *v4;
  id v5;

  v5 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v4 = WeakRetained;
  if (WeakRetained)
    objc_msgSend(WeakRetained, "handleCapabilitiesUpdateNotification:", v5);

}

- (void)willRemoveFromMeshController:(id)a3
{
  id v4;
  objc_super v5;

  v4 = a3;
  objc_msgSend(v4, "deregisterHandlerForNotificationClass:", objc_opt_class());
  objc_msgSend(v4, "deregisterHandlerForCommandClass:", objc_opt_class());
  objc_msgSend(v4, "deregisterHandlerForRequestClass:", objc_opt_class());
  v5.receiver = self;
  v5.super_class = (Class)COCapabilityAddOn;
  -[COMeshAddOn willRemoveFromMeshController:](&v5, sel_willRemoveFromMeshController_, v4);

}

- (void)didChangeNodesForMeshController:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  int v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  uint64_t v15;
  uint64_t v16;
  char v17;
  uint64_t v18;
  uint64_t i;
  void *v20;
  void *v21;
  BOOL v22;
  NSObject *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t j;
  void *v28;
  void *v29;
  void *v30;
  char v31;
  NSObject *v32;
  id v33;
  COCapabilityAddOn *v34;
  id obj;
  objc_super v36;
  _QWORD v37[5];
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  uint8_t v46[128];
  uint8_t buf[4];
  COCapabilityAddOn *v48;
  _BYTE v49[128];
  uint64_t v50;

  v50 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  -[COMeshAddOn meshController](self, "meshController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "me");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[COMeshAddOn meshController](self, "meshController");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "leader");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v6, "isEqual:", v8);

  if (v9)
  {
    -[COCapabilityAddOn gatheredCapabilities](self, "gatheredCapabilities");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = (void *)objc_msgSend(v10, "mutableCopy");

    v34 = self;
    -[COMeshAddOn meshController](self, "meshController");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "nodes");
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    v44 = 0u;
    v45 = 0u;
    v43 = 0u;
    v42 = 0u;
    v14 = v13;
    v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v42, v49, 16);
    if (v15)
    {
      v16 = v15;
      v17 = 0;
      v18 = *(_QWORD *)v43;
      do
      {
        for (i = 0; i != v16; ++i)
        {
          if (*(_QWORD *)v43 != v18)
            objc_enumerationMutation(v14);
          objc_msgSend(*(id *)(*((_QWORD *)&v42 + 1) + 8 * i), "remote");
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v11, "objectForKey:", v20);
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          v22 = v21 == 0;

          v17 |= v22;
        }
        v16 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v42, v49, 16);
      }
      while (v16);

      if ((v17 & 1) != 0)
      {
        COCoreLogForCategory(5);
        v23 = objc_claimAutoreleasedReturnValue();
        self = v34;
        if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 134217984;
          v48 = v34;
          _os_log_impl(&dword_215E92000, v23, OS_LOG_TYPE_DEFAULT, "%p node added, need to perform update", buf, 0xCu);
        }

        -[COCapabilityAddOn performCapabilitiesUpdate](v34, "performCapabilitiesUpdate");
LABEL_27:

        goto LABEL_28;
      }
    }
    else
    {

    }
    v33 = v4;
    v40 = 0u;
    v41 = 0u;
    v38 = 0u;
    v39 = 0u;
    objc_msgSend(v11, "allKeys");
    obj = (id)objc_claimAutoreleasedReturnValue();
    v24 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v38, v46, 16);
    self = v34;
    if (v24)
    {
      v25 = v24;
      v26 = *(_QWORD *)v39;
      do
      {
        for (j = 0; j != v25; ++j)
        {
          if (*(_QWORD *)v39 != v26)
            objc_enumerationMutation(obj);
          v28 = *(void **)(*((_QWORD *)&v38 + 1) + 8 * j);
          v37[0] = MEMORY[0x24BDAC760];
          v37[1] = 3221225472;
          v37[2] = __53__COCapabilityAddOn_didChangeNodesForMeshController___block_invoke;
          v37[3] = &unk_24D4B11E8;
          v37[4] = v28;
          if (objc_msgSend(v14, "indexOfObjectPassingTest:", v37) == 0x7FFFFFFFFFFFFFFFLL)
          {
            -[COMeshAddOn meshController](self, "meshController");
            v29 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v29, "me");
            v30 = (void *)objc_claimAutoreleasedReturnValue();
            v31 = objc_msgSend(v28, "isEqual:", v30);

            self = v34;
            if ((v31 & 1) == 0)
            {
              COCoreLogForCategory(5);
              v32 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v32, OS_LOG_TYPE_DEFAULT))
              {
                *(_DWORD *)buf = 134217984;
                v48 = v34;
                _os_log_impl(&dword_215E92000, v32, OS_LOG_TYPE_DEFAULT, "%p node removed, dropping gathered Capabilities", buf, 0xCu);
              }

              objc_msgSend(v11, "removeObjectForKey:", v28);
            }
          }
        }
        v25 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v38, v46, 16);
      }
      while (v25);
    }

    -[COCapabilityAddOn setGatheredCapabilities:](self, "setGatheredCapabilities:", v11);
    v4 = v33;
    goto LABEL_27;
  }
LABEL_28:
  v36.receiver = self;
  v36.super_class = (Class)COCapabilityAddOn;
  -[COMeshAddOn didChangeNodesForMeshController:](&v36, sel_didChangeNodesForMeshController_, v4);

}

uint64_t __53__COCapabilityAddOn_didChangeNodesForMeshController___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  uint64_t v4;

  objc_msgSend(a2, "remote");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isEqual:", *(_QWORD *)(a1 + 32));

  return v4;
}

- (NSSet)supportedCapabilities
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
  v8 = __Block_byref_object_copy__5;
  v9 = __Block_byref_object_dispose__5;
  v10 = 0;
  v4[0] = MEMORY[0x24BDAC760];
  v4[1] = 3221225472;
  v4[2] = __42__COCapabilityAddOn_supportedCapabilities__block_invoke;
  v4[3] = &unk_24D4B07E0;
  v4[4] = self;
  v4[5] = &v5;
  -[COCapabilityAddOn _withLock:](self, "_withLock:", v4);
  v2 = (id)v6[5];
  _Block_object_dispose(&v5, 8);

  return (NSSet *)v2;
}

void __42__COCapabilityAddOn_supportedCapabilities__block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  v2 = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 32), "copy");
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

- (void)setSupportedCapabilities:(id)a3
{
  id v4;
  void *v5;
  NSObject *v6;
  uint64_t v7;
  id v8;
  _QWORD v9[4];
  id v10;
  COCapabilityAddOn *v11;
  uint8_t buf[4];
  COCapabilityAddOn *v13;
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  -[COCapabilityAddOn pairLegacyShim](self, "pairLegacyShim");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    COCoreLogForCategory(5);
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134217984;
      v13 = self;
      _os_log_impl(&dword_215E92000, v6, OS_LOG_TYPE_DEFAULT, "%p including Legacy Shim as supported Capability", buf, 0xCu);
    }

    objc_msgSend(v4, "setByAddingObject:", 0x24D4B48B8);
    v7 = objc_claimAutoreleasedReturnValue();

    v4 = (id)v7;
  }
  v9[0] = MEMORY[0x24BDAC760];
  v9[1] = 3221225472;
  v9[2] = __46__COCapabilityAddOn_setSupportedCapabilities___block_invoke;
  v9[3] = &unk_24D4B0858;
  v10 = v4;
  v11 = self;
  v8 = v4;
  -[COCapabilityAddOn _withLock:](self, "_withLock:", v9);

}

void __46__COCapabilityAddOn_setSupportedCapabilities___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  void *v5;
  COCapabilityUpdateCommand *v6;
  _QWORD v7[4];
  id v8;

  if ((objc_msgSend(*(id *)(a1 + 32), "isEqualToSet:", *(_QWORD *)(*(_QWORD *)(a1 + 40) + 32)) & 1) == 0)
  {
    v2 = objc_msgSend(*(id *)(a1 + 32), "copy");
    v3 = *(_QWORD *)(a1 + 40);
    v4 = *(void **)(v3 + 32);
    *(_QWORD *)(v3 + 32) = v2;

    objc_msgSend(*(id *)(a1 + 40), "meshController");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (v5)
    {
      v6 = objc_alloc_init(COCapabilityUpdateCommand);
      v7[0] = MEMORY[0x24BDAC760];
      v7[1] = 3221225472;
      v7[2] = __46__COCapabilityAddOn_setSupportedCapabilities___block_invoke_2;
      v7[3] = &unk_24D4B1210;
      v8 = v5;
      objc_msgSend(v8, "sendCommand:withCompletionHandler:", v6, v7);

    }
    else
    {
      objc_msgSend(*(id *)(a1 + 40), "_setAvailableCapabilities_Unsafe:", *(_QWORD *)(*(_QWORD *)(a1 + 40) + 32));
    }

  }
}

void __46__COCapabilityAddOn_setSupportedCapabilities___block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  id v4;
  NSObject *v5;

  v4 = a3;
  if (v4)
  {
    COCoreLogForCategory(5);
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      __46__COCapabilityAddOn_setSupportedCapabilities___block_invoke_2_cold_1(a1, (uint64_t)v4, v5);

  }
}

- (NSSet)availableCapabilities
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
  v8 = __Block_byref_object_copy__5;
  v9 = __Block_byref_object_dispose__5;
  v10 = 0;
  v4[0] = MEMORY[0x24BDAC760];
  v4[1] = 3221225472;
  v4[2] = __42__COCapabilityAddOn_availableCapabilities__block_invoke;
  v4[3] = &unk_24D4B07E0;
  v4[4] = self;
  v4[5] = &v5;
  -[COCapabilityAddOn _withLock:](self, "_withLock:", v4);
  v2 = (id)v6[5];
  _Block_object_dispose(&v5, 8);

  return (NSSet *)v2;
}

void __42__COCapabilityAddOn_availableCapabilities__block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  v2 = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 40), "copy");
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

- (void)setAvailableCapabilities:(id)a3
{
  id v4;
  id v5;
  _QWORD v6[5];
  id v7;

  v4 = a3;
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __46__COCapabilityAddOn_setAvailableCapabilities___block_invoke;
  v6[3] = &unk_24D4B0858;
  v6[4] = self;
  v7 = v4;
  v5 = v4;
  -[COCapabilityAddOn _withLock:](self, "_withLock:", v6);

}

uint64_t __46__COCapabilityAddOn_setAvailableCapabilities___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_setAvailableCapabilities_Unsafe:", *(_QWORD *)(a1 + 40));
}

- (NSDictionary)gatheredCapabilities
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
  v8 = __Block_byref_object_copy__5;
  v9 = __Block_byref_object_dispose__5;
  v10 = 0;
  v4[0] = MEMORY[0x24BDAC760];
  v4[1] = 3221225472;
  v4[2] = __41__COCapabilityAddOn_gatheredCapabilities__block_invoke;
  v4[3] = &unk_24D4B07E0;
  v4[4] = self;
  v4[5] = &v5;
  -[COCapabilityAddOn _withLock:](self, "_withLock:", v4);
  v2 = (id)v6[5];
  _Block_object_dispose(&v5, 8);

  return (NSDictionary *)v2;
}

void __41__COCapabilityAddOn_gatheredCapabilities__block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  v2 = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 48), "copy");
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

- (void)setGatheredCapabilities:(id)a3
{
  id v4;
  id v5;
  _QWORD v6[4];
  id v7;
  COCapabilityAddOn *v8;

  v4 = a3;
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __45__COCapabilityAddOn_setGatheredCapabilities___block_invoke;
  v6[3] = &unk_24D4B0858;
  v7 = v4;
  v8 = self;
  v5 = v4;
  -[COCapabilityAddOn _withLock:](self, "_withLock:", v6);

}

void __45__COCapabilityAddOn_setGatheredCapabilities___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  int v10;
  COCapabilityUpdateNotification *v11;
  void *v12;
  id v13;
  _QWORD v14[4];
  id v15;

  if ((objc_msgSend(*(id *)(a1 + 32), "isEqualToDictionary:", *(_QWORD *)(*(_QWORD *)(a1 + 40) + 48)) & 1) == 0)
  {
    v2 = objc_msgSend(*(id *)(a1 + 32), "copy");
    v3 = *(_QWORD *)(a1 + 40);
    v4 = *(void **)(v3 + 48);
    *(_QWORD *)(v3 + 48) = v2;

    v5 = (void *)objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 32), "mutableCopy");
    v6 = *(void **)(*(_QWORD *)(a1 + 40) + 48);
    v14[0] = MEMORY[0x24BDAC760];
    v14[1] = 3221225472;
    v14[2] = __45__COCapabilityAddOn_setGatheredCapabilities___block_invoke_2;
    v14[3] = &unk_24D4B1238;
    v13 = v5;
    v15 = v13;
    objc_msgSend(v6, "enumerateKeysAndObjectsUsingBlock:", v14);
    objc_msgSend(*(id *)(a1 + 40), "_setAvailableCapabilities_Unsafe:", v13);
    objc_msgSend(*(id *)(a1 + 40), "meshController");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "leader");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "me");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v8, "isEqual:", v9);

    if (v10)
    {
      v11 = -[COCapabilityUpdateNotification initWithCapabilities:]([COCapabilityUpdateNotification alloc], "initWithCapabilities:", v13);
      objc_msgSend(*(id *)(a1 + 40), "meshController");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "sendNotification:", v11);

    }
  }
}

uint64_t __45__COCapabilityAddOn_setGatheredCapabilities___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "intersectSet:");
}

- (COCapabilityAddOnDelegate)delegate
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
  v8 = __Block_byref_object_copy__5;
  v9 = __Block_byref_object_dispose__5;
  v10 = 0;
  v4[0] = MEMORY[0x24BDAC760];
  v4[1] = 3221225472;
  v4[2] = __29__COCapabilityAddOn_delegate__block_invoke;
  v4[3] = &unk_24D4B07E0;
  v4[4] = self;
  v4[5] = &v5;
  -[COCapabilityAddOn _withLock:](self, "_withLock:", v4);
  v2 = (id)v6[5];
  _Block_object_dispose(&v5, 8);

  return (COCapabilityAddOnDelegate *)v2;
}

void __29__COCapabilityAddOn_delegate__block_invoke(uint64_t a1)
{
  id WeakRetained;
  uint64_t v3;
  void *v4;

  WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 56));
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
  COCapabilityAddOn *v8;

  v4 = a3;
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __33__COCapabilityAddOn_setDelegate___block_invoke;
  v6[3] = &unk_24D4B0858;
  v7 = v4;
  v8 = self;
  v5 = v4;
  -[COCapabilityAddOn _withLock:](self, "_withLock:", v6);

}

void __33__COCapabilityAddOn_setDelegate___block_invoke(uint64_t a1)
{
  void *v2;
  id WeakRetained;

  v2 = *(void **)(a1 + 32);
  WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 40) + 56));
  LOBYTE(v2) = objc_msgSend(v2, "isEqual:", WeakRetained);

  if ((v2 & 1) == 0)
    objc_storeWeak((id *)(*(_QWORD *)(a1 + 40) + 56), *(id *)(a1 + 32));
}

- (id)availableCapabilitiesForNode:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  v4 = a3;
  objc_msgSend(v4, "remote");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
    goto LABEL_2;
  -[COMeshAddOn meshController](self, "meshController");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "listener");
  v9 = (id)objc_claimAutoreleasedReturnValue();

  if (v9 != v4)
  {
    v5 = 0;
LABEL_6:
    v7 = 0;
    goto LABEL_7;
  }
  objc_msgSend(v4, "source");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v5)
    goto LABEL_6;
LABEL_2:
  -[COCapabilityAddOn gatheredCapabilities](self, "gatheredCapabilities");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectForKey:", v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_7:
  return v7;
}

- (void)_notifyDelegateCapabilitiesChanged
{
  id v3;
  void *v4;
  NSObject *v5;
  id v6;
  _QWORD v7[4];
  id v8;
  COCapabilityAddOn *v9;
  id v10;
  id to;

  os_unfair_lock_assert_owner(&self->_lock);
  objc_copyWeak(&to, (id *)&self->_delegate);
  v3 = objc_loadWeakRetained(&to);
  if (v3)
  {
    v4 = (void *)-[NSSet copy](self->_availableCapabilities, "copy");
    dispatch_get_global_queue(0, 0);
    v5 = objc_claimAutoreleasedReturnValue();
    v7[0] = MEMORY[0x24BDAC760];
    v7[1] = 3221225472;
    v7[2] = __55__COCapabilityAddOn__notifyDelegateCapabilitiesChanged__block_invoke;
    v7[3] = &unk_24D4B08D0;
    v8 = v3;
    v9 = self;
    v10 = v4;
    v6 = v4;
    dispatch_async(v5, v7);

  }
  objc_destroyWeak(&to);
}

uint64_t __55__COCapabilityAddOn__notifyDelegateCapabilitiesChanged__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "addOn:availableCapabilitiesChanged:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
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

- (void)_setAvailableCapabilities_Unsafe:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  NSObject *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t i;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  int v29;
  void *v30;
  char v31;
  NSObject *v32;
  id v33;
  void *v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  void *v38;
  uint64_t j;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  int v44;
  void *v45;
  char v46;
  NSObject *v47;
  id v48;
  NSSet *v49;
  NSSet *availableCapabilities;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  COCapabilityAddOn *v55;
  id obj;
  void *v57;
  void *v58;
  __int128 v59;
  __int128 v60;
  __int128 v61;
  __int128 v62;
  __int128 v63;
  __int128 v64;
  __int128 v65;
  __int128 v66;
  _BYTE v67[128];
  uint8_t v68[128];
  uint8_t buf[4];
  COCapabilityAddOn *v70;
  __int16 v71;
  id v72;
  __int16 v73;
  void *v74;
  uint64_t v75;

  v75 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  -[COCapabilityAddOn pairLegacyShim](self, "pairLegacyShim");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    if (-[COCapabilityAddOn _legacyShimOverridesAvailableCapabilities:](self, "_legacyShimOverridesAvailableCapabilities:", v4))
    {
      -[COCapabilityAddOn pairLegacyShim](self, "pairLegacyShim");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "availableCapabilities");
      v57 = (void *)objc_claimAutoreleasedReturnValue();

      COCoreLogForCategory(5);
      v7 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 134218498;
        v70 = self;
        v71 = 2112;
        v72 = v4;
        v73 = 2112;
        v74 = v57;
        _os_log_impl(&dword_215E92000, v7, OS_LOG_TYPE_DEFAULT, "%p overriding available Capabilities(%@) with Legacy Shim Capabilities(%@)", buf, 0x20u);
      }

    }
    else
    {
      v57 = v4;
    }
    -[COMeshAddOn meshController](self, "meshController");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    +[COHomeKitAdapter sharedInstance](COHomeKitAdapter, "sharedInstance");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "currentAccessory");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v10)
    {
      v11 = 0;
LABEL_41:

      v4 = v57;
      goto LABEL_42;
    }
    objc_msgSend(v9, "homeForAccessory:", v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v11)
      goto LABEL_41;
    objc_msgSend(v9, "mediaSystemForAccessory:inHome:", v10, v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v12)
      goto LABEL_41;
    v13 = v12;
    objc_msgSend(v12, "uniqueIdentifier");
    v58 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(MEMORY[0x24BE19E30], "isGlobalMessagingEnabled"))
    {
      v65 = 0u;
      v66 = 0u;
      v63 = 0u;
      v64 = 0u;
      -[COMeshAddOn meshController](self, "meshController");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "nodes");
      v15 = (void *)objc_claimAutoreleasedReturnValue();

      obj = v15;
      v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v63, v68, 16);
      if (!v16)
      {
LABEL_40:

        goto LABEL_41;
      }
      v17 = v16;
      v51 = v13;
      v52 = v11;
      v53 = v10;
      v54 = v9;
      v55 = self;
      v18 = *(_QWORD *)v64;
      do
      {
        for (i = 0; i != v17; ++i)
        {
          if (*(_QWORD *)v64 != v18)
            objc_enumerationMutation(obj);
          v20 = *(void **)(*((_QWORD *)&v63 + 1) + 8 * i);
          objc_msgSend(v8, "nodeManager", v51, v52, v53, v54);
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v20, "remote");
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v21, "nodeControllerForConstituent:", v22);
          v23 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(v23, "rapportTransport");
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v24, "client");
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v25, "destinationDevice");
          v26 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(v26, "mediaSystemIdentifier");
          v27 = (void *)objc_claimAutoreleasedReturnValue();
          v28 = v8;
          v29 = objc_msgSend(v58, "isEqual:", v27);

          if (v29)
          {
            objc_msgSend(v28, "nodes");
            v30 = (void *)objc_claimAutoreleasedReturnValue();
            v31 = objc_msgSend(v30, "containsObject:", v20);

            v8 = v28;
            if ((v31 & 1) == 0)
            {
              COCoreLogForCategory(5);
              v32 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v32, OS_LOG_TYPE_DEFAULT))
              {
                *(_DWORD *)buf = 134218242;
                v70 = v55;
                v71 = 2112;
                v72 = v57;
                _os_log_impl(&dword_215E92000, v32, OS_LOG_TYPE_DEFAULT, "%p overriding available Capabilities(%@) due to legacy peer in pair", buf, 0x16u);
              }

              v33 = objc_alloc_init(MEMORY[0x24BDBCF20]);
              v57 = v33;
            }
          }
          else
          {
            v8 = v28;
          }

        }
        v17 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v63, v68, 16);
      }
      while (v17);
    }
    else
    {
      v51 = v13;
      v52 = v11;
      v53 = v10;
      v54 = v9;
      v55 = self;
      objc_msgSend(v8, "listener");
      v59 = 0u;
      v60 = 0u;
      v61 = 0u;
      v62 = 0u;
      obj = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(obj, "nodes");
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      v35 = objc_msgSend(v34, "countByEnumeratingWithState:objects:count:", &v59, v67, 16);
      if (v35)
      {
        v36 = v35;
        v37 = *(_QWORD *)v60;
        do
        {
          v38 = v8;
          for (j = 0; j != v36; ++j)
          {
            if (*(_QWORD *)v60 != v37)
              objc_enumerationMutation(v34);
            v40 = *(void **)(*((_QWORD *)&v59 + 1) + 8 * j);
            objc_msgSend(v40, "client");
            v41 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v41, "destinationDevice");
            v42 = (void *)objc_claimAutoreleasedReturnValue();

            objc_msgSend(v42, "mediaSystemIdentifier");
            v43 = (void *)objc_claimAutoreleasedReturnValue();
            v44 = objc_msgSend(v58, "isEqual:", v43);

            if (v44)
            {
              objc_msgSend(v38, "nodes");
              v45 = (void *)objc_claimAutoreleasedReturnValue();
              v46 = objc_msgSend(v45, "containsObject:", v40);

              if ((v46 & 1) == 0)
              {
                COCoreLogForCategory(5);
                v47 = objc_claimAutoreleasedReturnValue();
                if (os_log_type_enabled(v47, OS_LOG_TYPE_DEFAULT))
                {
                  *(_DWORD *)buf = 134218242;
                  v70 = v55;
                  v71 = 2112;
                  v72 = v57;
                  _os_log_impl(&dword_215E92000, v47, OS_LOG_TYPE_DEFAULT, "%p overriding available Capabilities(%@) due to legacy peer in pair", buf, 0x16u);
                }

                v48 = objc_alloc_init(MEMORY[0x24BDBCF20]);
                v57 = v48;
              }
            }

          }
          v36 = objc_msgSend(v34, "countByEnumeratingWithState:objects:count:", &v59, v67, 16);
          v8 = v38;
        }
        while (v36);
      }

    }
    self = v55;
    v10 = v53;
    v9 = v54;
    v13 = v51;
    v11 = v52;
    goto LABEL_40;
  }
LABEL_42:
  if ((objc_msgSend(v4, "isEqualToSet:", self->_availableCapabilities) & 1) == 0)
  {
    v49 = (NSSet *)objc_msgSend(v4, "copy");
    availableCapabilities = self->_availableCapabilities;
    self->_availableCapabilities = v49;

    -[COCapabilityAddOn _notifyDelegateCapabilitiesChanged](self, "_notifyDelegateCapabilitiesChanged");
  }

}

- (void)performCapabilitiesUpdate
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x24BDAC8D0];
  v2 = 134217984;
  v3 = a1;
  _os_log_debug_impl(&dword_215E92000, a2, OS_LOG_TYPE_DEBUG, "%p performing Capabilities update", (uint8_t *)&v2, 0xCu);
  OUTLINED_FUNCTION_2_0();
}

void __46__COCapabilityAddOn_performCapabilitiesUpdate__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id WeakRetained;
  NSObject *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;

  v3 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    COCoreLogForCategory(5);
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
      __46__COCapabilityAddOn_performCapabilitiesUpdate__block_invoke_cold_1((uint64_t)WeakRetained, v3, v5);

    if (objc_msgSend(v3, "count"))
    {
      objc_msgSend(WeakRetained, "supportedCapabilities");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = objc_msgSend(v6, "copy");
      v8 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
      v9 = *(void **)(v8 + 40);
      *(_QWORD *)(v8 + 40) = v7;
    }
    else
    {
      objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(WeakRetained, "meshController");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "me");
      v9 = (void *)objc_claimAutoreleasedReturnValue();

      if (v9)
      {
        objc_msgSend(WeakRetained, "supportedCapabilities");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "setObject:forKey:", v11, v9);

      }
      objc_msgSend(WeakRetained, "setGatheredCapabilities:", v6);
    }

  }
}

void __46__COCapabilityAddOn_performCapabilitiesUpdate__block_invoke_28(uint64_t a1, uint64_t a2, void *a3, void *a4, void *a5)
{
  id v8;
  id v9;
  id v10;
  id WeakRetained;
  void *v12;
  uint64_t v13;
  void *v14;
  id v15;
  id v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t i;
  uint64_t v28;
  void *v29;
  void *v30;
  uint64_t v31;
  void *v32;
  void *v33;
  id v34;
  _QWORD v35[5];
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  _BYTE v40[128];
  uint64_t v41;

  v41 = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (!WeakRetained)
    goto LABEL_26;
  if (!v10)
  {
LABEL_5:
    objc_msgSend(v9, "capabilities");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = v14;
    if (v14)
    {
      v15 = v14;
      v12 = v15;
    }
    else
    {
      v15 = objc_alloc_init(MEMORY[0x24BDBCF20]);
    }
    v16 = v15;
    goto LABEL_10;
  }
  objc_msgSend(v10, "domain");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v12, "isEqualToString:", *MEMORY[0x24BE7CC90]))
  {
    v13 = objc_msgSend(v10, "code");

    if (v13 != -6714)
    {
      v16 = 0;
      goto LABEL_11;
    }
    goto LABEL_5;
  }
  v16 = 0;
LABEL_10:

LABEL_11:
  objc_msgSend(WeakRetained, "gatheredCapabilities", a1);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = (void *)objc_msgSend(v17, "mutableCopy");

  objc_msgSend(v8, "remote");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v34 = v8;
  v32 = v16;
  if (v16)
    objc_msgSend(v18, "setObject:forKey:", v16, v19);
  else
    objc_msgSend(v18, "removeObjectForKey:", v19);

  v33 = WeakRetained;
  objc_msgSend(WeakRetained, "meshController");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "nodes");
  v21 = (void *)objc_claimAutoreleasedReturnValue();

  v38 = 0u;
  v39 = 0u;
  v36 = 0u;
  v37 = 0u;
  objc_msgSend(v18, "allKeys");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v36, v40, 16);
  if (v23)
  {
    v24 = v23;
    v25 = *(_QWORD *)v37;
    v26 = MEMORY[0x24BDAC760];
    do
    {
      for (i = 0; i != v24; ++i)
      {
        if (*(_QWORD *)v37 != v25)
          objc_enumerationMutation(v22);
        v28 = *(_QWORD *)(*((_QWORD *)&v36 + 1) + 8 * i);
        v35[0] = v26;
        v35[1] = 3221225472;
        v35[2] = __46__COCapabilityAddOn_performCapabilitiesUpdate__block_invoke_2;
        v35[3] = &unk_24D4B11E8;
        v35[4] = v28;
        if (objc_msgSend(v21, "indexOfObjectPassingTest:", v35) == 0x7FFFFFFFFFFFFFFFLL)
          objc_msgSend(v18, "removeObjectForKey:", v28);
      }
      v24 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v36, v40, 16);
    }
    while (v24);
  }

  WeakRetained = v33;
  objc_msgSend(v33, "meshController");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v29, "me");
  v30 = (void *)objc_claimAutoreleasedReturnValue();

  if (v30)
    objc_msgSend(v18, "setObject:forKey:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(v31 + 32) + 8) + 40), v30);
  objc_msgSend(v33, "setGatheredCapabilities:", v18);

  v8 = v34;
LABEL_26:

}

uint64_t __46__COCapabilityAddOn_performCapabilitiesUpdate__block_invoke_2(uint64_t a1, void *a2)
{
  void *v3;
  uint64_t v4;

  objc_msgSend(a2, "remote");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isEqual:", *(_QWORD *)(a1 + 32));

  return v4;
}

- (void)handleCapabilitiesReadRequest:(id)a3 callback:(id)a4
{
  void (**v5)(id, COCapabilityReadResponse *, _QWORD);
  void *v6;
  COCapabilityReadResponse *v7;

  v5 = (void (**)(id, COCapabilityReadResponse *, _QWORD))a4;
  -[COCapabilityAddOn supportedCapabilities](self, "supportedCapabilities");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = -[COCapabilityReadResponse initWithCapabilities:]([COCapabilityReadResponse alloc], "initWithCapabilities:", v6);
  v5[2](v5, v7, 0);

}

- (void)handleCapabilitiesUpdateNotification:(id)a3
{
  id v4;

  objc_msgSend(a3, "capabilities");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[COCapabilityAddOn setAvailableCapabilities:](self, "setAvailableCapabilities:", v4);

}

- (void)_enableForPairLegacySupport
{
  void *v3;
  _QWORD v4[5];

  v4[0] = MEMORY[0x24BDAC760];
  v4[1] = 3221225472;
  v4[2] = __48__COCapabilityAddOn__enableForPairLegacySupport__block_invoke;
  v4[3] = &unk_24D4B0C80;
  v4[4] = self;
  -[COCapabilityAddOn _withLock:](self, "_withLock:", v4);
  -[COCapabilityAddOn supportedCapabilities](self, "supportedCapabilities");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[COCapabilityAddOn setSupportedCapabilities:](self, "setSupportedCapabilities:", v3);

}

void __48__COCapabilityAddOn__enableForPairLegacySupport__block_invoke(uint64_t a1)
{
  COCapabilityLegacyShim *v2;
  uint64_t v3;
  void *v4;

  v2 = -[COCapabilityLegacyShim initWithDelegate:]([COCapabilityLegacyShim alloc], "initWithDelegate:", *(_QWORD *)(a1 + 32));
  v3 = *(_QWORD *)(a1 + 32);
  v4 = *(void **)(v3 + 64);
  *(_QWORD *)(v3 + 64) = v2;

}

- (void)legacyShim:(id)a3 availableCapabilitiesChanged:(id)a4
{
  NSObject *v5;
  _QWORD block[5];

  -[COMeshAddOn meshControllerQueue](self, "meshControllerQueue", a3, a4);
  v5 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __61__COCapabilityAddOn_legacyShim_availableCapabilitiesChanged___block_invoke;
  block[3] = &unk_24D4B0C80;
  block[4] = self;
  dispatch_async(v5, block);

}

void __61__COCapabilityAddOn_legacyShim_availableCapabilitiesChanged___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  id v5;

  v2 = *(void **)(a1 + 32);
  objc_msgSend(v2, "availableCapabilities");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v2) = objc_msgSend(v2, "_legacyShimOverridesAvailableCapabilities:", v3);

  if ((_DWORD)v2)
  {
    v4 = *(void **)(a1 + 32);
    objc_msgSend(v4, "availableCapabilities");
    v5 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setAvailableCapabilities:", v5);

  }
}

- (BOOL)_legacyShimOverridesAvailableCapabilities:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  int v7;
  NSObject *v8;

  v4 = a3;
  -[COCapabilityAddOn pairLegacyShim](self, "pairLegacyShim");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    -[COMeshAddOn meshController](self, "meshController");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (v6)
      v7 = objc_msgSend(v4, "containsObject:", 0x24D4B48B8) ^ 1;
    else
      LOBYTE(v7) = 0;

  }
  else
  {
    LOBYTE(v7) = 0;
  }

  COCoreLogForCategory(5);
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
    -[COCapabilityAddOn _legacyShimOverridesAvailableCapabilities:].cold.1((uint64_t)self, v7, v8);

  return v7;
}

- (COCapabilityLegacyShim)pairLegacyShim
{
  return self->_pairLegacyShim;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_pairLegacyShim, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_gatheredCapabilities, 0);
  objc_storeStrong((id *)&self->_availableCapabilities, 0);
  objc_storeStrong((id *)&self->_supportedCapabilities, 0);
}

void __46__COCapabilityAddOn_setSupportedCapabilities___block_invoke_2_cold_1(uint64_t a1, uint64_t a2, os_log_t log)
{
  uint64_t v3;
  int v4;
  uint64_t v5;
  __int16 v6;
  uint64_t v7;
  uint64_t v8;

  v8 = *MEMORY[0x24BDAC8D0];
  v3 = *(_QWORD *)(a1 + 32);
  v4 = 134218242;
  v5 = v3;
  v6 = 2112;
  v7 = a2;
  _os_log_error_impl(&dword_215E92000, log, OS_LOG_TYPE_ERROR, "%p failed to force update capabilities (%@)", (uint8_t *)&v4, 0x16u);
  OUTLINED_FUNCTION_2_0();
}

void __46__COCapabilityAddOn_performCapabilitiesUpdate__block_invoke_cold_1(uint64_t a1, void *a2, NSObject *a3)
{
  int v4;
  uint64_t v5;
  __int16 v6;
  uint64_t v7;
  uint64_t v8;

  v8 = *MEMORY[0x24BDAC8D0];
  v4 = 134218240;
  v5 = a1;
  v6 = 2048;
  v7 = objc_msgSend(a2, "count");
  _os_log_debug_impl(&dword_215E92000, a3, OS_LOG_TYPE_DEBUG, "%p update request sent to %lu recipients", (uint8_t *)&v4, 0x16u);
}

- (void)_legacyShimOverridesAvailableCapabilities:(os_log_t)log .cold.1(uint64_t a1, char a2, os_log_t log)
{
  int v3;
  int v4;
  uint64_t v5;
  __int16 v6;
  int v7;
  uint64_t v8;

  v8 = *MEMORY[0x24BDAC8D0];
  if ((a2 & 1) != 0)
    v3 = 89;
  else
    v3 = 78;
  v4 = 134218240;
  v5 = a1;
  v6 = 1024;
  v7 = v3;
  _os_log_debug_impl(&dword_215E92000, log, OS_LOG_TYPE_DEBUG, "%p allowing Legacy Shim override: %c", (uint8_t *)&v4, 0x12u);
  OUTLINED_FUNCTION_2_0();
}

@end
