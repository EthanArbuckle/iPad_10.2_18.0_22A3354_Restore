@implementation COMessageChannelRapportTransport

- (COMessageChannelRapportTransport)initWithIdentifier:(id)a3 delegate:(id)a4 dispatchQueue:(id)a5
{
  objc_class *v8;
  id v9;
  id v10;
  id v11;
  id v12;
  COMessageChannelRapportTransport *v13;

  v8 = (objc_class *)MEMORY[0x24BE7CBF0];
  v9 = a5;
  v10 = a4;
  v11 = a3;
  v12 = objc_alloc_init(v8);
  objc_msgSend(v12, "setControlFlags:", 2052);
  objc_msgSend(v12, "setDispatchQueue:", v9);
  v13 = -[COMessageChannelRapportTransport initWithIdentifier:delegate:companionLink:dispatchQueue:](self, "initWithIdentifier:delegate:companionLink:dispatchQueue:", v11, v10, v12, v9);

  return v13;
}

- (COMessageChannelRapportTransport)initWithIdentifier:(id)a3 delegate:(id)a4 companionLink:(id)a5 dispatchQueue:(id)a6
{
  id v11;
  id v12;
  id v13;
  id v14;
  COMessageChannelRapportTransport *v15;
  COMessageChannelRapportTransport *v16;
  uint64_t v17;
  NSString *requestIdentifier;
  uint64_t v19;
  NSMutableDictionary *activeMemberDevices;
  objc_super v22;

  v11 = a3;
  v12 = a4;
  v13 = a5;
  v14 = a6;
  v22.receiver = self;
  v22.super_class = (Class)COMessageChannelRapportTransport;
  v15 = -[COMessageChannelRapportTransport init](&v22, sel_init);
  v16 = v15;
  if (v15)
  {
    objc_storeStrong((id *)&v15->_identifier, a3);
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@-messageChannel-request"), v11);
    v17 = objc_claimAutoreleasedReturnValue();
    requestIdentifier = v16->_requestIdentifier;
    v16->_requestIdentifier = (NSString *)v17;

    objc_storeStrong((id *)&v16->_queue, a6);
    objc_storeStrong((id *)&v16->_companionLinkClient, a5);
    objc_storeWeak((id *)&v16->_delegate, v12);
    objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
    v19 = objc_claimAutoreleasedReturnValue();
    activeMemberDevices = v16->_activeMemberDevices;
    v16->_activeMemberDevices = (NSMutableDictionary *)v19;

  }
  return v16;
}

- (NSArray)activeMembers
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
  v8 = __Block_byref_object_copy__0;
  v9 = __Block_byref_object_dispose__0;
  v10 = 0;
  v4[0] = MEMORY[0x24BDAC760];
  v4[1] = 3221225472;
  v4[2] = __49__COMessageChannelRapportTransport_activeMembers__block_invoke;
  v4[3] = &unk_24CD3EEA8;
  v4[4] = self;
  v4[5] = &v5;
  -[COMessageChannelRapportTransport _withLock:](self, "_withLock:", v4);
  v2 = (id)v6[5];
  _Block_object_dispose(&v5, 8);

  return (NSArray *)v2;
}

void __49__COMessageChannelRapportTransport_activeMembers__block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  id v5;

  objc_msgSend(*(id *)(a1 + 32), "activeMemberDevices");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "allKeys");
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

- (void)addHomeKitGroupIdentifiers:(id)a3
{
  id v4;
  uint64_t v5;
  id v6;
  NSObject *queue;
  _QWORD block[5];
  id v9;
  _QWORD *v10;
  _QWORD v11[5];
  id v12;
  uint64_t *v13;
  _QWORD *v14;
  uint64_t v15;
  uint64_t *v16;
  uint64_t v17;
  char v18;
  _QWORD v19[5];
  id v20;

  v4 = a3;
  v19[0] = 0;
  v19[1] = v19;
  v19[2] = 0x3032000000;
  v19[3] = __Block_byref_object_copy__0;
  v19[4] = __Block_byref_object_dispose__0;
  v20 = 0;
  v15 = 0;
  v16 = &v15;
  v17 = 0x2020000000;
  v5 = MEMORY[0x24BDAC760];
  v18 = 0;
  v11[0] = MEMORY[0x24BDAC760];
  v11[1] = 3221225472;
  v11[2] = __63__COMessageChannelRapportTransport_addHomeKitGroupIdentifiers___block_invoke;
  v11[3] = &unk_24CD3EED0;
  v11[4] = self;
  v6 = v4;
  v12 = v6;
  v13 = &v15;
  v14 = v19;
  -[COMessageChannelRapportTransport _withLock:](self, "_withLock:", v11);
  if (*((_BYTE *)v16 + 24))
  {
    queue = self->_queue;
    block[0] = v5;
    block[1] = 3221225472;
    block[2] = __63__COMessageChannelRapportTransport_addHomeKitGroupIdentifiers___block_invoke_15;
    block[3] = &unk_24CD3EEF8;
    block[4] = self;
    v10 = v19;
    v9 = v6;
    dispatch_async(queue, block);

  }
  _Block_object_dispose(&v15, 8);
  _Block_object_dispose(v19, 8);

}

void __63__COMessageChannelRapportTransport_addHomeKitGroupIdentifiers___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  NSObject *v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  int v19;
  uint64_t v20;
  __int16 v21;
  uint64_t v22;
  uint64_t v23;

  v23 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(*(id *)(a1 + 32), "groupHKIdentifiers");
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  if (v2)
  {
    objc_msgSend(*(id *)(a1 + 32), "groupHKIdentifiers");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setByAddingObjectsFromSet:", *(_QWORD *)(a1 + 40));
    v4 = objc_claimAutoreleasedReturnValue();
    v5 = *(_QWORD *)(a1 + 32);
    v6 = *(void **)(v5 + 24);
    *(_QWORD *)(v5 + 24) = v4;

  }
  else
  {
    objc_msgSend(MEMORY[0x24BDBCF20], "setWithSet:", *(_QWORD *)(a1 + 40));
    v7 = objc_claimAutoreleasedReturnValue();
    v8 = *(_QWORD *)(a1 + 32);
    v3 = *(void **)(v8 + 24);
    *(_QWORD *)(v8 + 24) = v7;
  }

  if (*(_BYTE *)(*(_QWORD *)(a1 + 32) + 12))
  {
    COLogForCategory(9);
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      v10 = *(_QWORD *)(a1 + 32);
      v11 = *(_QWORD *)(a1 + 40);
      v19 = 134218242;
      v20 = v10;
      v21 = 2112;
      v22 = v11;
      _os_log_impl(&dword_21214B000, v9, OS_LOG_TYPE_DEFAULT, "%p Adding HomeKit identifiers %@ after activation", (uint8_t *)&v19, 0x16u);
    }

    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = 1;
    objc_msgSend(*(id *)(a1 + 32), "companionLinkClient");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "activeDevices");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = objc_msgSend(v13, "mutableCopy");
    v15 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
    v16 = *(void **)(v15 + 40);
    *(_QWORD *)(v15 + 40) = v14;

    objc_msgSend(*(id *)(a1 + 32), "companionLinkClient");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "localDevice");
    v18 = (void *)objc_claimAutoreleasedReturnValue();

    if (v18)
      objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40), "addObject:", v18);

  }
}

void __63__COMessageChannelRapportTransport_addHomeKitGroupIdentifiers___block_invoke_15(uint64_t a1)
{
  NSObject *v2;
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  void *v8;
  void *v9;
  void *v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  COLogForCategory(9);
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
    __63__COMessageChannelRapportTransport_addHomeKitGroupIdentifiers___block_invoke_15_cold_1(a1, v2);

  v13 = 0u;
  v14 = 0u;
  v11 = 0u;
  v12 = 0u;
  v3 = *(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40);
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v12;
    do
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v12 != v6)
          objc_enumerationMutation(v3);
        v8 = *(void **)(*((_QWORD *)&v11 + 1) + 8 * i);
        v9 = *(void **)(a1 + 40);
        objc_msgSend(v8, "homeKitIdentifier", (_QWORD)v11);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        LODWORD(v9) = objc_msgSend(v9, "containsObject:", v10);

        if ((_DWORD)v9)
          objc_msgSend(*(id *)(a1 + 32), "_onqueue_handleDeviceFound:", v8);
      }
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v5);
  }

}

- (void)removeHomeKitGroupIdentifiers:(id)a3
{
  id v4;
  NSObject *v5;
  NSObject *queue;
  id v7;
  _QWORD v8[5];
  id v9;
  uint8_t buf[4];
  COMessageChannelRapportTransport *v11;
  __int16 v12;
  id v13;
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  COLogForCategory(9);
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134218242;
    v11 = self;
    v12 = 2112;
    v13 = v4;
    _os_log_impl(&dword_21214B000, v5, OS_LOG_TYPE_DEFAULT, "%p Removing HomeKit identifiers %@", buf, 0x16u);
  }

  queue = self->_queue;
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __66__COMessageChannelRapportTransport_removeHomeKitGroupIdentifiers___block_invoke;
  v8[3] = &unk_24CD3EF20;
  v8[4] = self;
  v9 = v4;
  v7 = v4;
  dispatch_async(queue, v8);

}

void __66__COMessageChannelRapportTransport_removeHomeKitGroupIdentifiers___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  void *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  void *v11;
  void *v12;
  int v13;
  NSObject *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  id obj;
  uint64_t v21;
  void *v22;
  uint64_t v23;
  uint64_t v24;
  _QWORD v25[4];
  id v26;
  id v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  uint8_t buf[4];
  uint64_t v37;
  __int16 v38;
  void *v39;
  _BYTE v40[128];
  _BYTE v41[128];
  uint64_t v42;

  v42 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(*(id *)(a1 + 32), "activeMemberDevices");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = (void *)objc_msgSend(v2, "copy");

  v34 = 0u;
  v35 = 0u;
  v32 = 0u;
  v33 = 0u;
  obj = *(id *)(a1 + 40);
  v23 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v32, v41, 16);
  if (v23)
  {
    v21 = *(_QWORD *)v33;
    do
    {
      v3 = 0;
      do
      {
        if (*(_QWORD *)v33 != v21)
          objc_enumerationMutation(obj);
        v24 = v3;
        v4 = *(void **)(*((_QWORD *)&v32 + 1) + 8 * v3);
        v28 = 0u;
        v29 = 0u;
        v30 = 0u;
        v31 = 0u;
        v5 = v22;
        v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v28, v40, 16);
        if (v6)
        {
          v7 = v6;
          v8 = *(_QWORD *)v29;
          do
          {
            for (i = 0; i != v7; ++i)
            {
              if (*(_QWORD *)v29 != v8)
                objc_enumerationMutation(v5);
              v10 = *(void **)(*((_QWORD *)&v28 + 1) + 8 * i);
              objc_msgSend(v10, "homeKitIdentifier");
              v11 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v4, "UUIDString");
              v12 = (void *)objc_claimAutoreleasedReturnValue();
              v13 = objc_msgSend(v11, "isEqualToString:", v12);

              if (v13)
              {
                COLogForCategory(9);
                v14 = objc_claimAutoreleasedReturnValue();
                if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
                {
                  v15 = *(_QWORD *)(a1 + 32);
                  *(_DWORD *)buf = 134218242;
                  v37 = v15;
                  v38 = 2112;
                  v39 = v10;
                  _os_log_impl(&dword_21214B000, v14, OS_LOG_TYPE_DEFAULT, "%p Removing member %@ from active member list", buf, 0x16u);
                }

                v16 = *(void **)(a1 + 32);
                objc_msgSend(v16, "activeMemberDevices");
                v17 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v17, "objectForKey:", v10);
                v18 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v16, "_onqueue_handleDeviceLost:", v18);

              }
            }
            v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v28, v40, 16);
          }
          while (v7);
        }

        v3 = v24 + 1;
      }
      while (v24 + 1 != v23);
      v23 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v32, v41, 16);
    }
    while (v23);
  }

  v25[0] = MEMORY[0x24BDAC760];
  v25[1] = 3221225472;
  v25[2] = __66__COMessageChannelRapportTransport_removeHomeKitGroupIdentifiers___block_invoke_16;
  v25[3] = &unk_24CD3EF20;
  v19 = *(void **)(a1 + 40);
  v26 = *(id *)(a1 + 32);
  v27 = v19;
  objc_msgSend(v26, "_withLock:", v25);

}

void __66__COMessageChannelRapportTransport_removeHomeKitGroupIdentifiers___block_invoke_16(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;

  objc_msgSend(*(id *)(a1 + 32), "groupHKIdentifiers");
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  if (v2)
  {
    objc_msgSend(*(id *)(a1 + 32), "groupHKIdentifiers");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = (void *)objc_msgSend(v3, "mutableCopy");

    objc_msgSend(v4, "minusSet:", *(_QWORD *)(a1 + 40));
    v5 = *(_QWORD *)(a1 + 32);
    v6 = *(void **)(v5 + 24);
    *(_QWORD *)(v5 + 24) = v4;

  }
}

- (void)activateWithCompletion:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  RPCompanionLinkClient *companionLinkClient;
  void *v8;
  uint64_t v9;
  RPCompanionLinkClient *v10;
  RPCompanionLinkClient *v11;
  RPCompanionLinkClient *v12;
  RPCompanionLinkClient *v13;
  RPCompanionLinkClient *v14;
  id v15;
  _QWORD v16[4];
  id v17;
  id v18;
  _QWORD v19[4];
  id v20;
  _QWORD v21[4];
  id v22;
  _QWORD v23[4];
  id v24;
  _QWORD v25[4];
  id v26;
  _QWORD v27[4];
  id v28;
  id location;
  uint8_t buf[4];
  COMessageChannelRapportTransport *v31;
  __int16 v32;
  void *v33;
  uint64_t v34;

  v34 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  objc_initWeak(&location, self);
  COLogForCategory(9);
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    -[COMessageChannelRapportTransport requestIdentifier](self, "requestIdentifier");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 134218242;
    v31 = self;
    v32 = 2112;
    v33 = v6;
    _os_log_impl(&dword_21214B000, v5, OS_LOG_TYPE_DEFAULT, "%p Going to register handler for %@", buf, 0x16u);

  }
  companionLinkClient = self->_companionLinkClient;
  -[COMessageChannelRapportTransport requestIdentifier](self, "requestIdentifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = MEMORY[0x24BDAC760];
  v27[0] = MEMORY[0x24BDAC760];
  v27[1] = 3221225472;
  v27[2] = __59__COMessageChannelRapportTransport_activateWithCompletion___block_invoke;
  v27[3] = &unk_24CD3EF70;
  objc_copyWeak(&v28, &location);
  -[RPCompanionLinkClient registerRequestID:options:handler:](companionLinkClient, "registerRequestID:options:handler:", v8, 0, v27);

  v10 = self->_companionLinkClient;
  v25[0] = v9;
  v25[1] = 3221225472;
  v25[2] = __59__COMessageChannelRapportTransport_activateWithCompletion___block_invoke_3;
  v25[3] = &unk_24CD3EF98;
  objc_copyWeak(&v26, &location);
  -[RPCompanionLinkClient setDeviceChangedHandler:](v10, "setDeviceChangedHandler:", v25);
  v11 = self->_companionLinkClient;
  v23[0] = v9;
  v23[1] = 3221225472;
  v23[2] = __59__COMessageChannelRapportTransport_activateWithCompletion___block_invoke_2_20;
  v23[3] = &unk_24CD3EFC0;
  objc_copyWeak(&v24, &location);
  -[RPCompanionLinkClient setLocalDeviceUpdatedHandler:](v11, "setLocalDeviceUpdatedHandler:", v23);
  v12 = self->_companionLinkClient;
  v21[0] = v9;
  v21[1] = 3221225472;
  v21[2] = __59__COMessageChannelRapportTransport_activateWithCompletion___block_invoke_2_23;
  v21[3] = &unk_24CD3EFC0;
  objc_copyWeak(&v22, &location);
  -[RPCompanionLinkClient setDeviceFoundHandler:](v12, "setDeviceFoundHandler:", v21);
  v13 = self->_companionLinkClient;
  v19[0] = v9;
  v19[1] = 3221225472;
  v19[2] = __59__COMessageChannelRapportTransport_activateWithCompletion___block_invoke_2_25;
  v19[3] = &unk_24CD3EFC0;
  objc_copyWeak(&v20, &location);
  -[RPCompanionLinkClient setDeviceLostHandler:](v13, "setDeviceLostHandler:", v19);
  v14 = self->_companionLinkClient;
  v16[0] = v9;
  v16[1] = 3221225472;
  v16[2] = __59__COMessageChannelRapportTransport_activateWithCompletion___block_invoke_2_27;
  v16[3] = &unk_24CD3F010;
  objc_copyWeak(&v18, &location);
  v15 = v4;
  v17 = v15;
  -[RPCompanionLinkClient activateWithCompletion:](v14, "activateWithCompletion:", v16);

  objc_destroyWeak(&v18);
  objc_destroyWeak(&v20);
  objc_destroyWeak(&v22);
  objc_destroyWeak(&v24);
  objc_destroyWeak(&v26);
  objc_destroyWeak(&v28);
  objc_destroyWeak(&location);

}

void __59__COMessageChannelRapportTransport_activateWithCompletion___block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7;
  id v8;
  id v9;
  NSObject **WeakRetained;
  NSObject **v11;
  NSObject *v12;
  _QWORD v13[5];
  id v14;
  id v15;
  id v16;

  v7 = a2;
  v8 = a3;
  v9 = a4;
  WeakRetained = (NSObject **)objc_loadWeakRetained((id *)(a1 + 32));
  v11 = WeakRetained;
  if (WeakRetained)
  {
    v12 = WeakRetained[7];
    v13[0] = MEMORY[0x24BDAC760];
    v13[1] = 3221225472;
    v13[2] = __59__COMessageChannelRapportTransport_activateWithCompletion___block_invoke_2;
    v13[3] = &unk_24CD3EF48;
    v13[4] = WeakRetained;
    v14 = v7;
    v15 = v8;
    v16 = v9;
    dispatch_async(v12, v13);

  }
}

uint64_t __59__COMessageChannelRapportTransport_activateWithCompletion___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_onqueue_handleIncomingRequest:options:responseHandler:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56));
}

void __59__COMessageChannelRapportTransport_activateWithCompletion___block_invoke_3(uint64_t a1, void *a2)
{
  id v3;
  _QWORD *WeakRetained;
  NSObject *v5;
  NSObject *v6;
  _QWORD v7[5];
  id v8;
  uint8_t buf[4];
  _QWORD *v10;
  __int16 v11;
  id v12;
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    COLogForCategory(9);
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134218242;
      v10 = WeakRetained;
      v11 = 2112;
      v12 = v3;
      _os_log_impl(&dword_21214B000, v5, OS_LOG_TYPE_DEFAULT, "%p device changed %@", buf, 0x16u);
    }

    v6 = WeakRetained[7];
    v7[0] = MEMORY[0x24BDAC760];
    v7[1] = 3221225472;
    v7[2] = __59__COMessageChannelRapportTransport_activateWithCompletion___block_invoke_18;
    v7[3] = &unk_24CD3EF20;
    v7[4] = WeakRetained;
    v8 = v3;
    dispatch_async(v6, v7);

  }
}

uint64_t __59__COMessageChannelRapportTransport_activateWithCompletion___block_invoke_18(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_onqueue_handleDeviceFound:", *(_QWORD *)(a1 + 40));
}

void __59__COMessageChannelRapportTransport_activateWithCompletion___block_invoke_2_20(uint64_t a1, void *a2)
{
  id v3;
  _QWORD *WeakRetained;
  NSObject *v5;
  NSObject *v6;
  _QWORD v7[5];
  id v8;
  uint8_t buf[4];
  _QWORD *v10;
  __int16 v11;
  id v12;
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    COLogForCategory(9);
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134218242;
      v10 = WeakRetained;
      v11 = 2112;
      v12 = v3;
      _os_log_impl(&dword_21214B000, v5, OS_LOG_TYPE_DEFAULT, "%p local device updated %@", buf, 0x16u);
    }

    v6 = WeakRetained[7];
    v7[0] = MEMORY[0x24BDAC760];
    v7[1] = 3221225472;
    v7[2] = __59__COMessageChannelRapportTransport_activateWithCompletion___block_invoke_21;
    v7[3] = &unk_24CD3EF20;
    v7[4] = WeakRetained;
    v8 = v3;
    dispatch_async(v6, v7);

  }
}

uint64_t __59__COMessageChannelRapportTransport_activateWithCompletion___block_invoke_21(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_onqueue_handleDeviceFound:", *(_QWORD *)(a1 + 40));
}

void __59__COMessageChannelRapportTransport_activateWithCompletion___block_invoke_2_23(uint64_t a1, void *a2)
{
  id v3;
  _QWORD *WeakRetained;
  NSObject *v5;
  NSObject *v6;
  _QWORD v7[5];
  id v8;
  uint8_t buf[4];
  _QWORD *v10;
  __int16 v11;
  id v12;
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    COLogForCategory(9);
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134218242;
      v10 = WeakRetained;
      v11 = 2112;
      v12 = v3;
      _os_log_impl(&dword_21214B000, v5, OS_LOG_TYPE_DEFAULT, "%p device found %@", buf, 0x16u);
    }

    v6 = WeakRetained[7];
    v7[0] = MEMORY[0x24BDAC760];
    v7[1] = 3221225472;
    v7[2] = __59__COMessageChannelRapportTransport_activateWithCompletion___block_invoke_24;
    v7[3] = &unk_24CD3EF20;
    v7[4] = WeakRetained;
    v8 = v3;
    dispatch_async(v6, v7);

  }
}

uint64_t __59__COMessageChannelRapportTransport_activateWithCompletion___block_invoke_24(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_onqueue_handleDeviceFound:", *(_QWORD *)(a1 + 40));
}

void __59__COMessageChannelRapportTransport_activateWithCompletion___block_invoke_2_25(uint64_t a1, void *a2)
{
  id v3;
  _QWORD *WeakRetained;
  NSObject *v5;
  NSObject *v6;
  _QWORD v7[5];
  id v8;
  uint8_t buf[4];
  _QWORD *v10;
  __int16 v11;
  id v12;
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    COLogForCategory(9);
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134218242;
      v10 = WeakRetained;
      v11 = 2112;
      v12 = v3;
      _os_log_impl(&dword_21214B000, v5, OS_LOG_TYPE_DEFAULT, "%p device lost %@", buf, 0x16u);
    }

    v6 = WeakRetained[7];
    v7[0] = MEMORY[0x24BDAC760];
    v7[1] = 3221225472;
    v7[2] = __59__COMessageChannelRapportTransport_activateWithCompletion___block_invoke_26;
    v7[3] = &unk_24CD3EF20;
    v7[4] = WeakRetained;
    v8 = v3;
    dispatch_async(v6, v7);

  }
}

uint64_t __59__COMessageChannelRapportTransport_activateWithCompletion___block_invoke_26(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_onqueue_handleDeviceLost:", *(_QWORD *)(a1 + 40));
}

void __59__COMessageChannelRapportTransport_activateWithCompletion___block_invoke_2_27(uint64_t a1, void *a2)
{
  id v3;
  id WeakRetained;
  NSObject *v5;
  _QWORD block[5];

  v3 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
    *((_BYTE *)WeakRetained + 12) = 1;
    v5 = *((_QWORD *)WeakRetained + 7);
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __59__COMessageChannelRapportTransport_activateWithCompletion___block_invoke_3_28;
    block[3] = &unk_24CD3EFE8;
    block[4] = WeakRetained;
    dispatch_async(v5, block);
  }

}

void __59__COMessageChannelRapportTransport_activateWithCompletion___block_invoke_3_28(uint64_t a1)
{
  void *v1;
  void *v2;
  id v3;

  v1 = *(void **)(a1 + 32);
  objc_msgSend(v1, "companionLinkClient");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "localDevice");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "_onqueue_handleDeviceFound:", v2);

}

- (void)sendRequest:(id)a3 to:(id)a4 withCompletionHandler:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  NSObject *v17;
  void *v18;
  void *v19;
  id v20;
  void *v21;
  _QWORD v22[5];
  id v23;
  id v24;
  uint8_t buf[4];
  COMessageChannelRapportTransport *v26;
  __int16 v27;
  void *v28;
  __int16 v29;
  id v30;
  _QWORD v31[2];
  _QWORD v32[3];

  v32[2] = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  -[COMessageChannelRapportTransport activeMemberDevices](self, "activeMemberDevices");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "objectForKey:", v9);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (v12)
  {
    v31[0] = CFSTR("data");
    -[COMessageChannelRapportTransport _serializedDataForRequest:](self, "_serializedDataForRequest:", v8);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v32[0] = v13;
    v31[1] = CFSTR("className");
    -[COMessageChannelRapportTransport _payloadTypeFromClass:](self, "_payloadTypeFromClass:", objc_opt_class());
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v32[1] = v14;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v32, v31, 2);
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    -[COMessageChannelRapportTransport requestIdentifier](self, "requestIdentifier");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    COLogForCategory(9);
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134218498;
      v26 = self;
      v27 = 2112;
      v28 = v16;
      v29 = 2112;
      v30 = v9;
      _os_log_impl(&dword_21214B000, v17, OS_LOG_TYPE_DEFAULT, "%p sending message %@ to member %@", buf, 0x20u);
    }

    -[COMessageChannelRapportTransport companionLinkClient](self, "companionLinkClient");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "effectiveIdentifier");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v22[0] = MEMORY[0x24BDAC760];
    v22[1] = 3221225472;
    v22[2] = __73__COMessageChannelRapportTransport_sendRequest_to_withCompletionHandler___block_invoke;
    v22[3] = &unk_24CD3F038;
    v22[4] = self;
    v23 = v16;
    v24 = v10;
    v20 = v16;
    objc_msgSend(v18, "sendRequestID:request:destinationID:options:responseHandler:", v20, v15, v19, 0, v22);

  }
  else
  {
    objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", CFSTR("COMessageChannelErrorDomain"), -1111, 0);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    (*((void (**)(id, _QWORD, void *))v10 + 2))(v10, 0, v21);

  }
}

void __73__COMessageChannelRapportTransport_sendRequest_to_withCompletionHandler___block_invoke(_QWORD *a1, void *a2, void *a3, void *a4)
{
  id v7;
  id v8;
  void *v9;
  uint64_t v10;
  NSObject *v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  NSString *v17;
  void *v18;
  uint64_t v19;
  id v20;
  uint8_t buf[4];
  uint64_t v22;
  __int16 v23;
  uint64_t v24;
  __int16 v25;
  uint64_t v26;
  __int16 v27;
  id v28;
  uint64_t v29;

  v29 = *MEMORY[0x24BDAC8D0];
  v7 = a2;
  v8 = a4;
  objc_msgSend(a3, "objectForKey:", *MEMORY[0x24BE7CD20]);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "unsignedIntegerValue");

  COLogForCategory(9);
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    v12 = a1[4];
    v13 = a1[5];
    *(_DWORD *)buf = 134218754;
    v22 = v12;
    v23 = 2112;
    v24 = v13;
    v25 = 2048;
    v26 = v10;
    v27 = 2114;
    v28 = v8;
    _os_log_impl(&dword_21214B000, v11, OS_LOG_TYPE_DEFAULT, "%p received callback for request %@. XID = 0x%llX. Error = %{public}@", buf, 0x2Au);
  }

  if (v8)
  {
    v19 = *MEMORY[0x24BDD1398];
    v20 = v8;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v20, &v19, 1);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", CFSTR("COMessageChannelErrorDomain"), -1204, v14);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(void))(a1[6] + 16))();

  }
  else if (v7)
  {
    objc_msgSend(v7, "objectForKey:", CFSTR("data"));
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_msgSend(v7, "objectForKey:", CFSTR("className"));
      v17 = (NSString *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BDD1620], "unarchivedObjectOfClass:fromData:error:", NSClassFromString(v17), v16, 0);
      v18 = (void *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      v18 = 0;
    }
    (*(void (**)(void))(a1[6] + 16))();

  }
  else
  {
    (*(void (**)(void))(a1[6] + 16))();
  }

}

- (void)_onqueue_handleIncomingRequest:(id)a3 options:(id)a4 responseHandler:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  NSObject *v14;
  void *v15;
  void *v16;
  id v17;
  uint64_t v18;
  void *v19;
  uint64_t v20;
  NSObject *v21;
  void *v22;
  void *v23;
  NSString *v24;
  Class v25;
  void *v26;
  id v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  uint64_t v32;
  void *v33;
  NSObject *v34;
  void *v35;
  void *v36;
  id v37;
  uint64_t v38;
  uint64_t v39;
  id v40;
  uint64_t v41;
  uint64_t i;
  void *v43;
  void *v44;
  void *v45;
  NSObject *v46;
  NSObject *v47;
  void *v48;
  NSObject *v49;
  NSObject *v50;
  void *v51;
  void *v52;
  void (**v53)(_QWORD, _QWORD, _QWORD, _QWORD);
  id v54;
  id v55;
  uint64_t v56;
  uint64_t v57;
  _QWORD v58[5];
  void (**v59)(_QWORD, _QWORD, _QWORD, _QWORD);
  id v60;
  __int128 v61;
  __int128 v62;
  __int128 v63;
  __int128 v64;
  uint8_t buf[4];
  COMessageChannelRapportTransport *v66;
  __int16 v67;
  uint64_t v68;
  __int16 v69;
  uint64_t v70;
  __int16 v71;
  void *v72;
  const __CFString *v73;
  NSString *v74;
  uint64_t v75;
  id v76;
  _BYTE v77[128];
  uint64_t v78;

  v78 = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  objc_msgSend(v9, "objectForKey:", *MEMORY[0x24BE7CD00]);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v11)
  {
    objc_msgSend(v9, "objectForKeyedSubscript:", *MEMORY[0x24BE7CCF8]);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[COMessageChannelRapportTransport companionLinkClient](self, "companionLinkClient");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "localDevice");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "identifier");
    v14 = objc_claimAutoreleasedReturnValue();

    if (!-[NSObject isEqual:](v14, "isEqual:", v11))
    {
      objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", CFSTR("COMessageChannelErrorDomain"), -1117, 0);
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      COLogForCategory(9);
      v34 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v34, OS_LOG_TYPE_ERROR))
        -[COMessageChannelRapportTransport _onqueue_handleIncomingRequest:options:responseHandler:].cold.2((uint64_t)self, (uint64_t)v8, v34);

      (*((void (**)(id, _QWORD, _QWORD, void *))v10 + 2))(v10, 0, 0, v33);
      goto LABEL_47;
    }
    -[COMessageChannelRapportTransport companionLinkClient](self, "companionLinkClient");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "localDevice");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "idsDeviceIdentifier");
    v17 = v10;
    v18 = objc_claimAutoreleasedReturnValue();

    v11 = (void *)v18;
    v10 = v17;
  }
  objc_msgSend(v9, "objectForKey:", *MEMORY[0x24BE7CD20]);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = objc_msgSend(v19, "unsignedIntegerValue");

  COLogForCategory(9);
  v21 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134218498;
    v66 = self;
    v67 = 2114;
    v68 = (uint64_t)v11;
    v69 = 2048;
    v70 = v20;
    _os_log_impl(&dword_21214B000, v21, OS_LOG_TYPE_DEFAULT, "%p incoming request from IDS=%{public}@. XID = 0x%llX", buf, 0x20u);
  }

  -[COMessageChannelRapportTransport _onqueue_activeMemberWithIDSIdentifier:](self, "_onqueue_activeMemberWithIDSIdentifier:", v11);
  v14 = objc_claimAutoreleasedReturnValue();
  if (v14)
    goto LABEL_7;
  -[COMessageChannelRapportTransport groupHKIdentifiers](self, "groupHKIdentifiers");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  v32 = objc_msgSend(v31, "count");

  if (!v32)
  {
    -[COMessageChannelRapportTransport companionLinkClient](self, "companionLinkClient");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v35, "activeDevices");
    v36 = (void *)objc_claimAutoreleasedReturnValue();

    v63 = 0u;
    v64 = 0u;
    v61 = 0u;
    v62 = 0u;
    v37 = v36;
    v38 = objc_msgSend(v37, "countByEnumeratingWithState:objects:count:", &v61, v77, 16);
    if (v38)
    {
      v39 = v38;
      v55 = v8;
      v57 = v20;
      v40 = v10;
      v41 = *(_QWORD *)v62;
      while (2)
      {
        for (i = 0; i != v39; ++i)
        {
          if (*(_QWORD *)v62 != v41)
            objc_enumerationMutation(v37);
          v43 = *(void **)(*((_QWORD *)&v61 + 1) + 8 * i);
          objc_msgSend(v43, "idsDeviceIdentifier");
          v44 = (void *)objc_claimAutoreleasedReturnValue();
          if (objc_msgSend(v44, "isEqualToString:", v11))
          {
            -[COMessageChannelRapportTransport _onqueue_memberFromRPCompanionLinkDevice:](self, "_onqueue_memberFromRPCompanionLinkDevice:", v43);
            v14 = objc_claimAutoreleasedReturnValue();
            if (v14)
            {
              -[COMessageChannelRapportTransport activeMemberDevices](self, "activeMemberDevices");
              v45 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v45, "setObject:forKey:", v43, v14);

              COLogForCategory(9);
              v46 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v46, OS_LOG_TYPE_DEFAULT))
              {
                *(_DWORD *)buf = 134218242;
                v66 = self;
                v67 = 2114;
                v68 = (uint64_t)v11;
                _os_log_impl(&dword_21214B000, v46, OS_LOG_TYPE_DEFAULT, "%p did not find an active member for IDS=%{public}@ so creating one on demand", buf, 0x16u);
              }

              -[COMessageChannelRapportTransport delegate](self, "delegate");
              v47 = objc_claimAutoreleasedReturnValue();
              v10 = v40;
              if ((objc_opt_respondsToSelector() & 1) != 0)
                -[NSObject didFindMember:](v47, "didFindMember:", v14);
            }
            else
            {
              COLogForCategory(9);
              v47 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v47, OS_LOG_TYPE_ERROR))
                -[COMessageChannelRapportTransport _onqueue_handleIncomingRequest:options:responseHandler:].cold.1();
              v10 = v40;
            }
            v20 = v57;

            v8 = v55;
            goto LABEL_52;
          }

        }
        v39 = objc_msgSend(v37, "countByEnumeratingWithState:objects:count:", &v61, v77, 16);
        if (v39)
          continue;
        break;
      }
      v14 = 0;
      v10 = v40;
      v8 = v55;
      v20 = v57;
    }
    else
    {
      v14 = 0;
    }
LABEL_52:

LABEL_7:
    -[COMessageChannelRapportTransport delegate](self, "delegate");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_opt_respondsToSelector() & 1) == 0)
    {
LABEL_46:

      goto LABEL_47;
    }
    v56 = v20;
    objc_msgSend(v8, "objectForKey:", CFSTR("data"));
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
      goto LABEL_42;
    v53 = (void (**)(_QWORD, _QWORD, _QWORD, _QWORD))v10;
    v54 = v8;
    objc_msgSend(v8, "objectForKey:", CFSTR("className"));
    v24 = (NSString *)objc_claimAutoreleasedReturnValue();
    v25 = NSClassFromString(v24);
    if (v25)
    {
      v60 = 0;
      objc_msgSend(MEMORY[0x24BDD1620], "unarchivedObjectOfClass:fromData:error:", v25, v23, &v60);
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      v27 = v60;
      if (!v27)
      {

LABEL_40:
        v10 = v53;
        if (v26)
        {
          v58[0] = MEMORY[0x24BDAC760];
          v58[1] = 3221225472;
          v58[2] = __91__COMessageChannelRapportTransport__onqueue_handleIncomingRequest_options_responseHandler___block_invoke;
          v58[3] = &unk_24CD3F060;
          v58[4] = self;
          v59 = v53;
          objc_msgSend(v22, "didReceiveRequest:from:withCompletionHandler:", v26, v14, v58);

LABEL_45:
          goto LABEL_46;
        }
LABEL_42:
        objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", CFSTR("COMessageChannelErrorDomain"), -1104, 0);
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        COLogForCategory(9);
        v50 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v50, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 134218754;
          v66 = self;
          v67 = 2114;
          v68 = 0;
          v69 = 2048;
          v70 = v56;
          v71 = 2114;
          v72 = v26;
          _os_log_error_impl(&dword_21214B000, v50, OS_LOG_TYPE_ERROR, "%p failed to encode incoming request %{public}@ XID=0x%llX. error = %{public}@", buf, 0x2Au);
        }

        (*((void (**)(id, _QWORD, _QWORD, void *))v10 + 2))(v10, 0, 0, v26);
        goto LABEL_45;
      }
      v28 = v27;
      v51 = (void *)MEMORY[0x24BDD1540];
      v52 = v23;
      v75 = *MEMORY[0x24BDD1398];
      v76 = v27;
      objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v76, &v75, 1);
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v51, "errorWithDomain:code:userInfo:", CFSTR("COMessageChannelErrorDomain"), -1104, v29);
      v30 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v52 = v23;
      v48 = (void *)MEMORY[0x24BDD1540];
      v73 = CFSTR("COMessageChannelUnknownClassErrorKey");
      v74 = v24;
      objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v74, &v73, 1);
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v48, "errorWithDomain:code:userInfo:", CFSTR("COMessageChannelErrorDomain"), -1104, v29);
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      v26 = 0;
      v28 = 0;
    }

    if (v30)
    {
      COLogForCategory(9);
      v49 = objc_claimAutoreleasedReturnValue();
      v8 = v54;
      v23 = v52;
      if (os_log_type_enabled(v49, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 134218754;
        v66 = self;
        v67 = 2114;
        v68 = (uint64_t)v26;
        v69 = 2048;
        v70 = v56;
        v71 = 2114;
        v72 = v30;
        _os_log_error_impl(&dword_21214B000, v49, OS_LOG_TYPE_ERROR, "%p failed to encode incoming request %{public}@ XID=0x%llX. error = %{public}@", buf, 0x2Au);
      }

      v10 = v53;
      ((void (**)(_QWORD, _QWORD, _QWORD, void *))v53)[2](v53, 0, 0, v30);

      goto LABEL_45;
    }
    v8 = v54;
    v23 = v52;
    goto LABEL_40;
  }
  COLogForCategory(9);
  v14 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134218240;
    v66 = self;
    v67 = 2048;
    v68 = v20;
    _os_log_impl(&dword_21214B000, v14, OS_LOG_TYPE_DEFAULT, "%p incoming request (XID = 0x%llX) from device not in our group, not creating one on demand", buf, 0x16u);
  }
LABEL_47:

}

void __91__COMessageChannelRapportTransport__onqueue_handleIncomingRequest_options_responseHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void (*v7)(void);
  void *v8;
  void *v9;
  void *v10;
  _QWORD v11[2];
  _QWORD v12[3];

  v12[2] = *MEMORY[0x24BDAC8D0];
  v5 = a2;
  v6 = a3;
  if (v6)
  {
    v7 = *(void (**)(void))(*(_QWORD *)(a1 + 40) + 16);
  }
  else
  {
    if (v5)
    {
      objc_msgSend(*(id *)(a1 + 32), "_serializeDataForResponse:", v5);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v11[0] = CFSTR("data");
      v11[1] = CFSTR("className");
      v12[0] = v8;
      objc_msgSend(*(id *)(a1 + 32), "_payloadTypeFromClass:", objc_opt_class());
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v12[1] = v9;
      objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v12, v11, 2);
      v10 = (void *)objc_claimAutoreleasedReturnValue();

      (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
      goto LABEL_6;
    }
    v7 = *(void (**)(void))(*(_QWORD *)(a1 + 40) + 16);
  }
  v7();
LABEL_6:

}

- (void)_onqueue_handleDeviceFound:(id)a3
{
  id v4;
  NSObject *v5;
  NSObject *v6;
  void *v7;
  void *v8;
  void *v9;
  NSObject *v10;
  int v11;
  COMessageChannelRapportTransport *v12;
  __int16 v13;
  id v14;
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  COLogForCategory(9);
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v11 = 134218242;
    v12 = self;
    v13 = 2112;
    v14 = v4;
    _os_log_impl(&dword_21214B000, v5, OS_LOG_TYPE_DEFAULT, "%p handling device found %@", (uint8_t *)&v11, 0x16u);
  }

  if (-[COMessageChannelRapportTransport _onqueue_devicePresentInGroup:](self, "_onqueue_devicePresentInGroup:", v4))
  {
    COLogForCategory(9);
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      v11 = 134218242;
      v12 = self;
      v13 = 2112;
      v14 = v4;
      _os_log_impl(&dword_21214B000, v6, OS_LOG_TYPE_DEFAULT, "%p found device is in our group %@", (uint8_t *)&v11, 0x16u);
    }

    -[COMessageChannelRapportTransport delegate](self, "delegate");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[COMessageChannelRapportTransport _onqueue_memberFromRPCompanionLinkDevice:](self, "_onqueue_memberFromRPCompanionLinkDevice:", v4);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (v8)
    {
      -[COMessageChannelRapportTransport activeMemberDevices](self, "activeMemberDevices");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "setObject:forKey:", v4, v8);

      if ((objc_opt_respondsToSelector() & 1) != 0)
        objc_msgSend(v7, "didFindMember:", v8);
    }
    else
    {
      COLogForCategory(9);
      v10 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
        -[COMessageChannelRapportTransport _onqueue_handleDeviceFound:].cold.1();

    }
  }

}

- (void)_onqueue_handleDeviceLost:(id)a3
{
  id v4;
  NSObject *v5;
  NSObject *v6;
  void *v7;
  void *v8;
  void *v9;
  int v10;
  COMessageChannelRapportTransport *v11;
  __int16 v12;
  id v13;
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  COLogForCategory(9);
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v10 = 134218242;
    v11 = self;
    v12 = 2112;
    v13 = v4;
    _os_log_impl(&dword_21214B000, v5, OS_LOG_TYPE_DEFAULT, "%p device lost %@", (uint8_t *)&v10, 0x16u);
  }

  if (-[COMessageChannelRapportTransport _onqueue_devicePresentInGroup:](self, "_onqueue_devicePresentInGroup:", v4))
  {
    COLogForCategory(9);
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      v10 = 134218242;
      v11 = self;
      v12 = 2112;
      v13 = v4;
      _os_log_impl(&dword_21214B000, v6, OS_LOG_TYPE_DEFAULT, "%p lost device is in our group %@", (uint8_t *)&v10, 0x16u);
    }

    -[COMessageChannelRapportTransport delegate](self, "delegate");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[COMessageChannelRapportTransport _onqueue_memberFromRPCompanionLinkDevice:](self, "_onqueue_memberFromRPCompanionLinkDevice:", v4);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[COMessageChannelRapportTransport activeMemberDevices](self, "activeMemberDevices");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "removeObjectForKey:", v8);

    if ((objc_opt_respondsToSelector() & 1) != 0)
      objc_msgSend(v7, "didLoseMember:", v8);

  }
}

- (void)_onqueue_handleDeviceUpdated:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  void *v7;
  int v8;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  void *v16;
  char v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  uint8_t v22[128];
  uint8_t buf[4];
  COMessageChannelRapportTransport *v24;
  __int16 v25;
  id v26;
  uint64_t v27;

  v27 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  COLogForCategory(9);
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134218242;
    v24 = self;
    v25 = 2112;
    v26 = v4;
    _os_log_impl(&dword_21214B000, v5, OS_LOG_TYPE_DEFAULT, "%p device updated %@", buf, 0x16u);
  }

  objc_msgSend(v4, "homeKitIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    -[COMessageChannelRapportTransport groupHKIdentifiers](self, "groupHKIdentifiers");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "containsObject:", v6);

    if (v8)
    {
      v20 = 0u;
      v21 = 0u;
      v18 = 0u;
      v19 = 0u;
      -[COMessageChannelRapportTransport activeMemberDevices](self, "activeMemberDevices", 0);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "allKeys");
      v10 = (void *)objc_claimAutoreleasedReturnValue();

      v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
      if (v11)
      {
        v12 = v11;
        v13 = *(_QWORD *)v19;
        while (2)
        {
          v14 = 0;
          do
          {
            if (*(_QWORD *)v19 != v13)
              objc_enumerationMutation(v10);
            objc_msgSend(*(id *)(*((_QWORD *)&v18 + 1) + 8 * v14), "homeKitIdentifier");
            v15 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v6, "UUIDString");
            v16 = (void *)objc_claimAutoreleasedReturnValue();
            v17 = objc_msgSend(v15, "isEqualToString:", v16);

            if ((v17 & 1) != 0)
            {

              goto LABEL_15;
            }
            ++v14;
          }
          while (v12 != v14);
          v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
          if (v12)
            continue;
          break;
        }
      }

      -[COMessageChannelRapportTransport _onqueue_handleDeviceFound:](self, "_onqueue_handleDeviceFound:", v4);
    }
  }
LABEL_15:

}

- (BOOL)_onqueue_devicePresentInGroup:(id)a3
{
  id v4;
  void *v5;
  id v6;
  _QWORD v8[5];
  id v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  char v14;

  v4 = a3;
  objc_msgSend(v4, "homeKitIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = 0;
  v12 = &v11;
  v13 = 0x2020000000;
  v14 = 0;
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __66__COMessageChannelRapportTransport__onqueue_devicePresentInGroup___block_invoke;
  v8[3] = &unk_24CD3F088;
  v10 = &v11;
  v8[4] = self;
  v6 = v5;
  v9 = v6;
  -[COMessageChannelRapportTransport _withLock:](self, "_withLock:", v8);
  LOBYTE(self) = *((_BYTE *)v12 + 24);

  _Block_object_dispose(&v11, 8);
  return (char)self;
}

void __66__COMessageChannelRapportTransport__onqueue_devicePresentInGroup___block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "groupHKIdentifiers");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = objc_msgSend(v2, "containsObject:", *(_QWORD *)(a1 + 40));

}

- (id)_onqueue_activeMemberWithIDSIdentifier:(id)a3
{
  id v4;
  void *v5;
  id v6;
  id v7;
  _QWORD v9[4];
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
  v15 = __Block_byref_object_copy__0;
  v16 = __Block_byref_object_dispose__0;
  v17 = 0;
  -[COMessageChannelRapportTransport activeMemberDevices](self, "activeMemberDevices");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x24BDAC760];
  v9[1] = 3221225472;
  v9[2] = __75__COMessageChannelRapportTransport__onqueue_activeMemberWithIDSIdentifier___block_invoke;
  v9[3] = &unk_24CD3F0B0;
  v6 = v4;
  v10 = v6;
  v11 = &v12;
  objc_msgSend(v5, "enumerateKeysAndObjectsUsingBlock:", v9);

  v7 = (id)v13[5];
  _Block_object_dispose(&v12, 8);

  return v7;
}

void __75__COMessageChannelRapportTransport__onqueue_activeMemberWithIDSIdentifier___block_invoke(uint64_t a1, void *a2)
{
  void *v4;
  int v5;
  id v6;

  v6 = a2;
  objc_msgSend(v6, "IDSIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "isEqualToString:", *(_QWORD *)(a1 + 32));

  if (v5)
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), a2);

}

- (id)_onqueue_memberFromRPCompanionLinkDevice:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  COClusterMember *v10;
  NSObject *v11;

  v4 = a3;
  objc_msgSend(v4, "homeKitIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "idsDeviceIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (v5)
    {
      objc_msgSend(v5, "UUIDString");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "setObject:forKey:", v8, CFSTR("accessory"));

    }
    objc_msgSend(v7, "setObject:forKey:", v6, CFSTR("IDS"));
    if ((objc_msgSend(v4, "flags") & 0x40) != 0)
      v9 = 1;
    else
      v9 = 3;
    v10 = -[COClusterMember initWithType:deviceMetadata:]([COClusterMember alloc], "initWithType:deviceMetadata:", v9, v7);
    -[COClusterMember setDevice:](v10, "setDevice:", v4);

  }
  else
  {
    COLogForCategory(9);
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      -[COMessageChannelRapportTransport _onqueue_memberFromRPCompanionLinkDevice:].cold.1((uint64_t)self, v11);

    v10 = 0;
  }

  return v10;
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

- (id)_serializeDataForResponse:(id)a3
{
  return (id)objc_msgSend(MEMORY[0x24BDD1618], "archivedDataWithRootObject:requiringSecureCoding:error:", a3, 1, 0);
}

- (id)_serializedDataForRequest:(id)a3
{
  return (id)objc_msgSend(MEMORY[0x24BDD1618], "archivedDataWithRootObject:requiringSecureCoding:error:", a3, 1, 0);
}

- (id)_payloadTypeFromClass:(Class)a3
{
  if (!a3)
    return 0;
  NSStringFromClass(a3);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (Class)_payloadClassFromType:(id)a3
{
  return NSClassFromString((NSString *)a3);
}

- (COMessageChannelRapportTransportDelegate)delegate
{
  return (COMessageChannelRapportTransportDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (NSSet)groupHKIdentifiers
{
  return self->_groupHKIdentifiers;
}

- (RPCompanionLinkClient)companionLinkClient
{
  return self->_companionLinkClient;
}

- (void)setCompanionLinkClient:(id)a3
{
  objc_storeStrong((id *)&self->_companionLinkClient, a3);
}

- (NSString)identifier
{
  return self->_identifier;
}

- (void)setIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_identifier, a3);
}

- (NSString)requestIdentifier
{
  return self->_requestIdentifier;
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (void)setQueue:(id)a3
{
  objc_storeStrong((id *)&self->_queue, a3);
}

- (NSMutableDictionary)activeMemberDevices
{
  return self->_activeMemberDevices;
}

- (void)setActiveMemberDevices:(id)a3
{
  objc_storeStrong((id *)&self->_activeMemberDevices, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_activeMemberDevices, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_requestIdentifier, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_storeStrong((id *)&self->_companionLinkClient, 0);
  objc_storeStrong((id *)&self->_groupHKIdentifiers, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

void __63__COMessageChannelRapportTransport_addHomeKitGroupIdentifiers___block_invoke_15_cold_1(uint64_t a1, NSObject *a2)
{
  uint64_t v2;
  uint64_t v3;
  int v4;
  uint64_t v5;
  __int16 v6;
  uint64_t v7;
  uint64_t v8;

  v8 = *MEMORY[0x24BDAC8D0];
  v2 = *(_QWORD *)(a1 + 32);
  v3 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40);
  v4 = 134218242;
  v5 = v2;
  v6 = 2112;
  v7 = v3;
  _os_log_debug_impl(&dword_21214B000, a2, OS_LOG_TYPE_DEBUG, "%p checking active rapport devices %@", (uint8_t *)&v4, 0x16u);
  OUTLINED_FUNCTION_1();
}

- (void)_onqueue_handleIncomingRequest:options:responseHandler:.cold.1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0(&dword_21214B000, v0, v1, "%p unable to produce an on-demand member from device %@");
  OUTLINED_FUNCTION_1();
}

- (void)_onqueue_handleIncomingRequest:(uint64_t)a1 options:(uint64_t)a2 responseHandler:(NSObject *)a3 .cold.2(uint64_t a1, uint64_t a2, NSObject *a3)
{
  _BYTE v3[24];

  *(_DWORD *)v3 = 134218242;
  *(_QWORD *)&v3[4] = a1;
  *(_WORD *)&v3[12] = 2114;
  *(_QWORD *)&v3[14] = a2;
  OUTLINED_FUNCTION_0(&dword_21214B000, a2, a3, "%p incoming request %{public}@ does not have an IDS identifier field", *(_QWORD *)v3, *(_QWORD *)&v3[8], *(_QWORD *)&v3[16]);
  OUTLINED_FUNCTION_1();
}

- (void)_onqueue_handleDeviceFound:.cold.1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0(&dword_21214B000, v0, v1, "%p Unable to produce a member for device %@");
  OUTLINED_FUNCTION_1();
}

- (void)_onqueue_memberFromRPCompanionLinkDevice:(uint64_t)a1 .cold.1(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;
  __int16 v4;
  uint64_t v5;
  uint64_t v6;

  v6 = *MEMORY[0x24BDAC8D0];
  v2 = 134218242;
  v3 = a1;
  v4 = 2112;
  v5 = 0;
  _os_log_error_impl(&dword_21214B000, a2, OS_LOG_TYPE_ERROR, "%p failed to create a member for device. IDS identifier = %@", (uint8_t *)&v2, 0x16u);
  OUTLINED_FUNCTION_1();
}

@end
