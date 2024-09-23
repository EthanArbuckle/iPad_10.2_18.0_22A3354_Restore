@implementation COCompanionLinkClientFactory

- (COCompanionLinkClientFactory)initWithDispatchQueue:(id)a3
{
  id v5;
  COCompanionLinkClientFactory *v6;
  COCompanionLinkClientFactory *v7;
  uint64_t v8;
  NSHashTable *locals;
  uint64_t v10;
  NSMapTable *clients;
  uint64_t v12;
  NSMutableDictionary *activeDevices;
  NSObject *v14;
  objc_super v16;
  uint8_t buf[4];
  COCompanionLinkClientFactory *v18;
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  v16.receiver = self;
  v16.super_class = (Class)COCompanionLinkClientFactory;
  v6 = -[COCompanionLinkClientFactory init](&v16, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_dispatchQueue, a3);
    objc_msgSend(MEMORY[0x24BDD15C0], "weakObjectsHashTable");
    v8 = objc_claimAutoreleasedReturnValue();
    locals = v7->_locals;
    v7->_locals = (NSHashTable *)v8;

    objc_msgSend(MEMORY[0x24BDD1650], "strongToStrongObjectsMapTable");
    v10 = objc_claimAutoreleasedReturnValue();
    clients = v7->_clients;
    v7->_clients = (NSMapTable *)v10;

    objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
    v12 = objc_claimAutoreleasedReturnValue();
    activeDevices = v7->_activeDevices;
    v7->_activeDevices = (NSMutableDictionary *)v12;

    COCoreLogForCategory(19);
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134217984;
      v18 = v7;
      _os_log_impl(&dword_215E92000, v14, OS_LOG_TYPE_DEFAULT, "%p companion link factory created", buf, 0xCu);
    }

  }
  return v7;
}

- (COCompanionLinkClientFactory)init
{
  if (init_onceToken != -1)
    dispatch_once(&init_onceToken, &__block_literal_global);
  return -[COCompanionLinkClientFactory initWithDispatchQueue:](self, "initWithDispatchQueue:", init_queue);
}

void __36__COCompanionLinkClientFactory_init__block_invoke()
{
  NSObject *v0;
  dispatch_queue_t v1;
  void *v2;
  NSObject *attr;

  dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  v0 = objc_claimAutoreleasedReturnValue();
  dispatch_queue_attr_make_with_qos_class(v0, QOS_CLASS_USER_INTERACTIVE, 0);
  attr = objc_claimAutoreleasedReturnValue();

  v1 = dispatch_queue_create("com.apple.coordination.COCompanionLinkClientFactory", attr);
  v2 = (void *)init_queue;
  init_queue = (uint64_t)v1;

}

- (Class)companionLinkClientClass
{
  return (Class)objc_opt_class();
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

- (id)activeDevices
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
  v4[2] = __45__COCompanionLinkClientFactory_activeDevices__block_invoke;
  v4[3] = &unk_24D4B07E0;
  v4[4] = self;
  v4[5] = &v5;
  -[COCompanionLinkClientFactory _withLock:](self, "_withLock:", v4);
  v2 = (id)v6[5];
  _Block_object_dispose(&v5, 8);

  return v2;
}

void __45__COCompanionLinkClientFactory_activeDevices__block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "allValues");
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

- (BOOL)_isKnownDevice:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t j;
  void *v18;
  char v19;
  BOOL v20;
  uint64_t v22;
  uint64_t v23;
  void *v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  _BYTE v33[128];
  _BYTE v34[128];
  uint64_t v35;

  v35 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  os_unfair_lock_assert_owner(&self->_lock);
  objc_msgSend(v4, "idsDeviceIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    -[COCompanionLinkClientFactory clients](self, "clients");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "objectForKey:", v5);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v7 = 0;
  }
  if (objc_msgSend(v7, "count") == 1)
  {
    v31 = 0u;
    v32 = 0u;
    v29 = 0u;
    v30 = 0u;
    -[COCompanionLinkClientFactory locals](self, "locals");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v29, v34, 16);
    if (v23)
    {
      v9 = *(_QWORD *)v30;
      v24 = v8;
      v22 = *(_QWORD *)v30;
      do
      {
        for (i = 0; i != v23; ++i)
        {
          if (*(_QWORD *)v30 != v9)
            objc_enumerationMutation(v8);
          v11 = *(void **)(*((_QWORD *)&v29 + 1) + 8 * i);
          v25 = 0u;
          v26 = 0u;
          v27 = 0u;
          v28 = 0u;
          objc_msgSend(v11, "rapport");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v12, "activeDevices");
          v13 = (void *)objc_claimAutoreleasedReturnValue();

          v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v25, v33, 16);
          if (v14)
          {
            v15 = v14;
            v16 = *(_QWORD *)v26;
            while (2)
            {
              for (j = 0; j != v15; ++j)
              {
                if (*(_QWORD *)v26 != v16)
                  objc_enumerationMutation(v13);
                objc_msgSend(*(id *)(*((_QWORD *)&v25 + 1) + 8 * j), "idsDeviceIdentifier");
                v18 = (void *)objc_claimAutoreleasedReturnValue();
                v19 = objc_msgSend(v18, "isEqualToString:", v5);

                if ((v19 & 1) != 0)
                {

                  v20 = 1;
                  v8 = v24;
                  goto LABEL_24;
                }
              }
              v15 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v25, v33, 16);
              if (v15)
                continue;
              break;
            }
          }

          v8 = v24;
          v9 = v22;
        }
        v20 = 0;
        v23 = objc_msgSend(v24, "countByEnumeratingWithState:objects:count:", &v29, v34, 16);
      }
      while (v23);
    }
    else
    {
      v20 = 0;
    }
LABEL_24:

  }
  else
  {
    v20 = 1;
  }

  return v20;
}

- (id)_clientsForRapportClient_unsafe:(id)a3
{
  id v4;
  id v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  id v12;
  uint64_t v13;
  void *v14;
  uint64_t j;
  uint64_t v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t k;
  void *v22;
  id v23;
  uint64_t v24;
  uint64_t v26;
  uint64_t v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  _BYTE v40[128];
  _BYTE v41[128];
  _BYTE v42[128];
  uint64_t v43;

  v43 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  os_unfair_lock_assert_owner(&self->_lock);
  v5 = objc_alloc_init(MEMORY[0x24BDBCE30]);
  v36 = 0u;
  v37 = 0u;
  v38 = 0u;
  v39 = 0u;
  -[COCompanionLinkClientFactory locals](self, "locals");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v36, v42, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v37;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v37 != v9)
          objc_enumerationMutation(v6);
        v11 = *(void **)(*((_QWORD *)&v36 + 1) + 8 * i);
        objc_msgSend(v11, "rapport");
        v12 = (id)objc_claimAutoreleasedReturnValue();

        if (v12 == v4)
        {
          objc_msgSend(v5, "arrayByAddingObject:", v11);
          v13 = objc_claimAutoreleasedReturnValue();

          v5 = (id)v13;
        }
      }
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v36, v42, 16);
    }
    while (v8);
  }

  -[COCompanionLinkClientFactory clients](self, "clients");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v32 = 0u;
  v33 = 0u;
  v34 = 0u;
  v35 = 0u;
  v27 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v32, v41, 16);
  if (v27)
  {
    v26 = *(_QWORD *)v33;
    do
    {
      for (j = 0; j != v27; ++j)
      {
        if (*(_QWORD *)v33 != v26)
          objc_enumerationMutation(v14);
        v16 = *(_QWORD *)(*((_QWORD *)&v32 + 1) + 8 * j);
        v28 = 0u;
        v29 = 0u;
        v30 = 0u;
        v31 = 0u;
        objc_msgSend(v14, "objectForKey:", v16, v26);
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        v18 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v28, v40, 16);
        if (v18)
        {
          v19 = v18;
          v20 = *(_QWORD *)v29;
          do
          {
            for (k = 0; k != v19; ++k)
            {
              if (*(_QWORD *)v29 != v20)
                objc_enumerationMutation(v17);
              v22 = *(void **)(*((_QWORD *)&v28 + 1) + 8 * k);
              objc_msgSend(v22, "rapport");
              v23 = (id)objc_claimAutoreleasedReturnValue();

              if (v23 == v4)
              {
                objc_msgSend(v5, "arrayByAddingObject:", v22);
                v24 = objc_claimAutoreleasedReturnValue();

                v5 = (id)v24;
              }
            }
            v19 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v28, v40, 16);
          }
          while (v19);
        }

      }
      v27 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v32, v41, 16);
    }
    while (v27);
  }

  return v5;
}

- (id)_reuseableRapportClientInClientsList:(id)a3
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
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
  v3 = a3;
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v11;
LABEL_3:
    v7 = 0;
    while (1)
    {
      if (*(_QWORD *)v11 != v6)
        objc_enumerationMutation(v3);
      objc_msgSend(*(id *)(*((_QWORD *)&v10 + 1) + 8 * v7), "rapport", (_QWORD)v10);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      if ((objc_msgSend(v8, "co_CompanionLinkClientFlags") & 0xC) == 0)
        break;

      if (v5 == ++v7)
      {
        v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
        if (v5)
          goto LABEL_3;
        goto LABEL_9;
      }
    }
  }
  else
  {
LABEL_9:
    v8 = 0;
  }

  return v8;
}

- (id)companionLinkClientForCurrentDevice
{
  NSObject *v3;
  void *v4;
  void *v5;
  id v6;
  _QWORD v8[6];
  uint64_t v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t (*v12)(uint64_t, uint64_t);
  void (*v13)(uint64_t);
  id v14;
  uint8_t buf[4];
  COCompanionLinkClientFactory *v16;
  __int16 v17;
  void *v18;
  __int16 v19;
  void *v20;
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
  v9 = 0;
  v10 = &v9;
  v11 = 0x3032000000;
  v12 = __Block_byref_object_copy__0;
  v13 = __Block_byref_object_dispose__0;
  v14 = 0;
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __67__COCompanionLinkClientFactory_companionLinkClientForCurrentDevice__block_invoke;
  v8[3] = &unk_24D4B0B18;
  v8[4] = self;
  v8[5] = &v9;
  -[COCompanionLinkClientFactory _withLock:](self, "_withLock:", v8);
  COCoreLogForCategory(19);
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    v4 = (void *)v10[5];
    objc_msgSend(v4, "rapport");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 134218496;
    v16 = self;
    v17 = 2048;
    v18 = v4;
    v19 = 2048;
    v20 = v5;
    _os_log_impl(&dword_215E92000, v3, OS_LOG_TYPE_DEFAULT, "%p returning %p for current device use riding on %p", buf, 0x20u);

  }
  v6 = (id)v10[5];
  _Block_object_dispose(&v9, 8);

  return v6;
}

void __67__COCompanionLinkClientFactory_companionLinkClientForCurrentDevice__block_invoke(uint64_t a1)
{
  id *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  NSObject *v8;
  uint64_t v9;
  COCompanionLinkClient *v10;
  uint64_t v11;
  void *v12;
  _QWORD v13[4];
  id v14;
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
  id v29;
  _QWORD v30[4];
  id v31;
  id v32;
  _QWORD v33[4];
  id v34;
  id v35;
  _QWORD v36[4];
  id v37;
  id v38;
  _QWORD v39[4];
  id v40;
  id v41;
  id from;
  id location;
  uint8_t buf[4];
  uint64_t v45;
  __int16 v46;
  void *v47;
  __int16 v48;
  void *v49;
  uint64_t v50;

  v50 = *MEMORY[0x24BDAC8D0];
  v2 = (id *)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 32), "locals");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*v2, "_reuseableRapportClientInClientsList:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v4)
  {
    v5 = (void *)objc_msgSend(*(id *)(a1 + 32), "companionLinkClientClass");
    objc_msgSend(*(id *)(a1 + 32), "dispatchQueue");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "co_companionLinkClientForDiscoveryOnDispatchQueue:", v6);
    v4 = (void *)objc_claimAutoreleasedReturnValue();

    objc_initWeak(&location, *(id *)(a1 + 32));
    objc_initWeak(&from, v4);
    v7 = MEMORY[0x24BDAC760];
    v39[0] = MEMORY[0x24BDAC760];
    v39[1] = 3221225472;
    v39[2] = __67__COCompanionLinkClientFactory_companionLinkClientForCurrentDevice__block_invoke_2;
    v39[3] = &unk_24D4B0A78;
    objc_copyWeak(&v40, &location);
    objc_copyWeak(&v41, &from);
    objc_msgSend(v4, "setInterruptionHandler:", v39);
    v36[0] = v7;
    v36[1] = 3221225472;
    v36[2] = __67__COCompanionLinkClientFactory_companionLinkClientForCurrentDevice__block_invoke_3;
    v36[3] = &unk_24D4B0A78;
    objc_copyWeak(&v37, &location);
    objc_copyWeak(&v38, &from);
    objc_msgSend(v4, "setStateUpdatedHandler:", v36);
    v33[0] = v7;
    v33[1] = 3221225472;
    v33[2] = __67__COCompanionLinkClientFactory_companionLinkClientForCurrentDevice__block_invoke_4;
    v33[3] = &unk_24D4B0A78;
    objc_copyWeak(&v34, &location);
    objc_copyWeak(&v35, &from);
    objc_msgSend(v4, "setErrorFlagsChangedHandler:", v33);
    v30[0] = v7;
    v30[1] = 3221225472;
    v30[2] = __67__COCompanionLinkClientFactory_companionLinkClientForCurrentDevice__block_invoke_5;
    v30[3] = &unk_24D4B0A78;
    objc_copyWeak(&v31, &location);
    objc_copyWeak(&v32, &from);
    objc_msgSend(v4, "setDisconnectHandler:", v30);
    v27[0] = v7;
    v27[1] = 3221225472;
    v27[2] = __67__COCompanionLinkClientFactory_companionLinkClientForCurrentDevice__block_invoke_6;
    v27[3] = &unk_24D4B0A78;
    objc_copyWeak(&v28, &location);
    objc_copyWeak(&v29, &from);
    objc_msgSend(v4, "setInvalidationHandler:", v27);
    v25[0] = v7;
    v25[1] = 3221225472;
    v25[2] = __67__COCompanionLinkClientFactory_companionLinkClientForCurrentDevice__block_invoke_7;
    v25[3] = &unk_24D4B0AA0;
    objc_copyWeak(&v26, &location);
    objc_msgSend(v4, "setDeviceFoundHandler:", v25);
    v23[0] = v7;
    v23[1] = 3221225472;
    v23[2] = __67__COCompanionLinkClientFactory_companionLinkClientForCurrentDevice__block_invoke_8;
    v23[3] = &unk_24D4B0AA0;
    objc_copyWeak(&v24, &location);
    objc_msgSend(v4, "setDeviceLostHandler:", v23);
    v21[0] = v7;
    v21[1] = 3221225472;
    v21[2] = __67__COCompanionLinkClientFactory_companionLinkClientForCurrentDevice__block_invoke_9;
    v21[3] = &unk_24D4B0AC8;
    objc_copyWeak(&v22, &location);
    objc_msgSend(v4, "setDeviceChangedHandler:", v21);
    v19[0] = v7;
    v19[1] = 3221225472;
    v19[2] = __67__COCompanionLinkClientFactory_companionLinkClientForCurrentDevice__block_invoke_10;
    v19[3] = &unk_24D4B0AA0;
    objc_copyWeak(&v20, &location);
    objc_msgSend(v4, "setLocalDeviceUpdatedHandler:", v19);
    v16[0] = v7;
    v16[1] = 3221225472;
    v16[2] = __67__COCompanionLinkClientFactory_companionLinkClientForCurrentDevice__block_invoke_11;
    v16[3] = &unk_24D4B0AF0;
    objc_copyWeak(&v17, &location);
    objc_copyWeak(&v18, &from);
    objc_msgSend(v4, "setRequestIDRegistrationCompletion:", v16);
    v13[0] = v7;
    v13[1] = 3221225472;
    v13[2] = __67__COCompanionLinkClientFactory_companionLinkClientForCurrentDevice__block_invoke_12;
    v13[3] = &unk_24D4B0AF0;
    objc_copyWeak(&v14, &location);
    objc_copyWeak(&v15, &from);
    objc_msgSend(v4, "setEventIDRegistrationCompletion:", v13);
    COCoreLogForCategory(19);
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      v9 = *(_QWORD *)(a1 + 32);
      *(_DWORD *)buf = 134218498;
      v45 = v9;
      v46 = 2048;
      v47 = v4;
      v48 = 2112;
      v49 = v4;
      _os_log_impl(&dword_215E92000, v8, OS_LOG_TYPE_DEFAULT, "%p created new local link %p (%@)", buf, 0x20u);
    }

    objc_destroyWeak(&v15);
    objc_destroyWeak(&v14);
    objc_destroyWeak(&v18);
    objc_destroyWeak(&v17);
    objc_destroyWeak(&v20);
    objc_destroyWeak(&v22);
    objc_destroyWeak(&v24);
    objc_destroyWeak(&v26);
    objc_destroyWeak(&v29);
    objc_destroyWeak(&v28);
    objc_destroyWeak(&v32);
    objc_destroyWeak(&v31);
    objc_destroyWeak(&v35);
    objc_destroyWeak(&v34);
    objc_destroyWeak(&v38);
    objc_destroyWeak(&v37);
    objc_destroyWeak(&v41);
    objc_destroyWeak(&v40);
    objc_destroyWeak(&from);
    objc_destroyWeak(&location);
  }
  v10 = -[COCompanionLinkClient initWithCompanionLinkClient:]([COCompanionLinkClient alloc], "initWithCompanionLinkClient:", v4);
  v11 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v12 = *(void **)(v11 + 40);
  *(_QWORD *)(v11 + 40) = v10;

  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), "setFactory:", *(_QWORD *)(a1 + 32));
  objc_msgSend(v3, "addObject:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40));

}

void __67__COCompanionLinkClientFactory_companionLinkClientForCurrentDevice__block_invoke_2(uint64_t a1)
{
  id v2;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v2 = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained && v2)
    objc_msgSend(WeakRetained, "didInterrupt:", v2);

}

void __67__COCompanionLinkClientFactory_companionLinkClientForCurrentDevice__block_invoke_3(uint64_t a1)
{
  id v2;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v2 = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained && v2)
    objc_msgSend(WeakRetained, "didUpdateState:", v2);

}

void __67__COCompanionLinkClientFactory_companionLinkClientForCurrentDevice__block_invoke_4(uint64_t a1)
{
  id v2;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v2 = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained && v2)
    objc_msgSend(WeakRetained, "didChangeErrorFlags:", v2);

}

void __67__COCompanionLinkClientFactory_companionLinkClientForCurrentDevice__block_invoke_5(uint64_t a1)
{
  id v2;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v2 = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained && v2)
    objc_msgSend(WeakRetained, "didDisconnect:", v2);

}

void __67__COCompanionLinkClientFactory_companionLinkClientForCurrentDevice__block_invoke_6(uint64_t a1)
{
  id v2;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v2 = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained && v2)
    objc_msgSend(WeakRetained, "didInvalidate:", v2);

}

void __67__COCompanionLinkClientFactory_companionLinkClientForCurrentDevice__block_invoke_7(uint64_t a1, void *a2)
{
  id WeakRetained;
  void *v4;
  id v5;

  v5 = a2;
  objc_msgSend(v5, "setValue:forKey:", 0, CFSTR("siriInfo"));
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v4 = WeakRetained;
  if (WeakRetained)
    objc_msgSend(WeakRetained, "didFindDevice:", v5);

}

void __67__COCompanionLinkClientFactory_companionLinkClientForCurrentDevice__block_invoke_8(uint64_t a1, void *a2)
{
  id WeakRetained;
  void *v4;
  id v5;

  v5 = a2;
  objc_msgSend(v5, "setValue:forKey:", 0, CFSTR("siriInfo"));
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v4 = WeakRetained;
  if (WeakRetained)
    objc_msgSend(WeakRetained, "didLoseDevice:", v5);

}

void __67__COCompanionLinkClientFactory_companionLinkClientForCurrentDevice__block_invoke_9(uint64_t a1, void *a2, uint64_t a3)
{
  id WeakRetained;
  void *v6;
  id v7;

  v7 = a2;
  objc_msgSend(v7, "setValue:forKey:", 0, CFSTR("siriInfo"));
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v6 = WeakRetained;
  if (WeakRetained)
    objc_msgSend(WeakRetained, "didChangeDevice:flags:", v7, a3);

}

void __67__COCompanionLinkClientFactory_companionLinkClientForCurrentDevice__block_invoke_10(uint64_t a1, void *a2)
{
  id WeakRetained;
  void *v4;
  id v5;

  v5 = a2;
  objc_msgSend(v5, "setValue:forKey:", 0, CFSTR("siriInfo"));
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v4 = WeakRetained;
  if (WeakRetained)
    objc_msgSend(WeakRetained, "didUpdateLocalDevice:", v5);

}

void __67__COCompanionLinkClientFactory_companionLinkClientForCurrentDevice__block_invoke_11(uint64_t a1, void *a2)
{
  id WeakRetained;
  id v4;
  void *v5;
  id v6;

  v6 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v4 = objc_loadWeakRetained((id *)(a1 + 40));
  v5 = v4;
  if (WeakRetained && v4)
    objc_msgSend(WeakRetained, "didRegisterRequestID:client:", v6, v4);

}

void __67__COCompanionLinkClientFactory_companionLinkClientForCurrentDevice__block_invoke_12(uint64_t a1, void *a2)
{
  id WeakRetained;
  id v4;
  void *v5;
  id v6;

  v6 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v4 = objc_loadWeakRetained((id *)(a1 + 40));
  v5 = v4;
  if (WeakRetained && v4)
    objc_msgSend(WeakRetained, "didRegisterEventID:client:", v6, v4);

}

- (id)companionLinkClientForDevice:(id)a3 withIDSIdentifier:(id)a4
{
  id v6;
  id v7;
  id v8;
  id v9;
  NSObject *v10;
  void *v11;
  void *v12;
  id v13;
  uint64_t v15;
  uint64_t v16;
  void (*v17)(uint64_t);
  void *v18;
  id v19;
  id v20;
  COCompanionLinkClientFactory *v21;
  uint64_t *v22;
  uint64_t v23;
  uint64_t *v24;
  uint64_t v25;
  uint64_t (*v26)(uint64_t, uint64_t);
  void (*v27)(uint64_t);
  id v28;
  uint8_t buf[4];
  COCompanionLinkClientFactory *v30;
  __int16 v31;
  void *v32;
  __int16 v33;
  void *v34;
  uint64_t v35;

  v35 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  v23 = 0;
  v24 = &v23;
  v25 = 0x3032000000;
  v26 = __Block_byref_object_copy__0;
  v27 = __Block_byref_object_dispose__0;
  v28 = 0;
  v15 = MEMORY[0x24BDAC760];
  v16 = 3221225472;
  v17 = __79__COCompanionLinkClientFactory_companionLinkClientForDevice_withIDSIdentifier___block_invoke;
  v18 = &unk_24D4B0B40;
  v8 = v6;
  v19 = v8;
  v9 = v7;
  v20 = v9;
  v21 = self;
  v22 = &v23;
  -[COCompanionLinkClientFactory _withLock:](self, "_withLock:", &v15);
  COCoreLogForCategory(19);
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    v11 = (void *)v24[5];
    objc_msgSend(v11, "rapport", v15, v16, v17, v18, v19);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 134218496;
    v30 = self;
    v31 = 2048;
    v32 = v11;
    v33 = 2048;
    v34 = v12;
    _os_log_impl(&dword_215E92000, v10, OS_LOG_TYPE_DEFAULT, "%p returning %p for device use riding on %p", buf, 0x20u);

  }
  v13 = (id)v24[5];

  _Block_object_dispose(&v23, 8);
  return v13;
}

void __79__COCompanionLinkClientFactory_companionLinkClientForDevice_withIDSIdentifier___block_invoke(uint64_t a1)
{
  void *v2;
  char v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  NSObject *v11;
  uint64_t v12;
  COCompanionLinkClient *v13;
  uint64_t v14;
  void *v15;
  _QWORD v16[4];
  id v17;
  id v18;
  _QWORD v19[4];
  id v20;
  id v21;
  _QWORD v22[4];
  id v23;
  id v24;
  _QWORD v25[4];
  id v26;
  id v27;
  _QWORD v28[4];
  id v29;
  id v30;
  id from;
  id location;
  uint8_t buf[4];
  uint64_t v34;
  __int16 v35;
  void *v36;
  __int16 v37;
  void *v38;
  uint64_t v39;

  v39 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(*(id *)(a1 + 32), "idsDeviceIdentifier");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isEqualToString:", *(_QWORD *)(a1 + 40));

  if ((v3 & 1) == 0)
    objc_msgSend(*(id *)(a1 + 32), "setValue:forKey:", *(_QWORD *)(a1 + 40), CFSTR("idsDeviceIdentifier"));
  objc_msgSend(*(id *)(a1 + 48), "clients");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKey:", *(_QWORD *)(a1 + 40));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 48), "_reuseableRapportClientInClientsList:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v6)
  {
    if (!v5)
    {
      objc_msgSend(MEMORY[0x24BDD15C0], "weakObjectsHashTable");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "setObject:forKey:", v5, *(_QWORD *)(a1 + 40));
    }
    v7 = (void *)objc_msgSend(*(id *)(a1 + 48), "companionLinkClientClass");
    v8 = *(_QWORD *)(a1 + 32);
    objc_msgSend(*(id *)(a1 + 48), "dispatchQueue");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "co_companionLinkClientToDevice:dispatchQueue:", v8, v9);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    objc_initWeak(&location, *(id *)(a1 + 48));
    objc_initWeak(&from, v6);
    v10 = MEMORY[0x24BDAC760];
    v28[0] = MEMORY[0x24BDAC760];
    v28[1] = 3221225472;
    v28[2] = __79__COCompanionLinkClientFactory_companionLinkClientForDevice_withIDSIdentifier___block_invoke_2;
    v28[3] = &unk_24D4B0A78;
    objc_copyWeak(&v29, &location);
    objc_copyWeak(&v30, &from);
    objc_msgSend(v6, "setInterruptionHandler:", v28);
    v25[0] = v10;
    v25[1] = 3221225472;
    v25[2] = __79__COCompanionLinkClientFactory_companionLinkClientForDevice_withIDSIdentifier___block_invoke_3;
    v25[3] = &unk_24D4B0A78;
    objc_copyWeak(&v26, &location);
    objc_copyWeak(&v27, &from);
    objc_msgSend(v6, "setStateUpdatedHandler:", v25);
    v22[0] = v10;
    v22[1] = 3221225472;
    v22[2] = __79__COCompanionLinkClientFactory_companionLinkClientForDevice_withIDSIdentifier___block_invoke_4;
    v22[3] = &unk_24D4B0A78;
    objc_copyWeak(&v23, &location);
    objc_copyWeak(&v24, &from);
    objc_msgSend(v6, "setErrorFlagsChangedHandler:", v22);
    v19[0] = v10;
    v19[1] = 3221225472;
    v19[2] = __79__COCompanionLinkClientFactory_companionLinkClientForDevice_withIDSIdentifier___block_invoke_5;
    v19[3] = &unk_24D4B0A78;
    objc_copyWeak(&v20, &location);
    objc_copyWeak(&v21, &from);
    objc_msgSend(v6, "setDisconnectHandler:", v19);
    v16[0] = v10;
    v16[1] = 3221225472;
    v16[2] = __79__COCompanionLinkClientFactory_companionLinkClientForDevice_withIDSIdentifier___block_invoke_6;
    v16[3] = &unk_24D4B0A78;
    objc_copyWeak(&v17, &location);
    objc_copyWeak(&v18, &from);
    objc_msgSend(v6, "setInvalidationHandler:", v16);
    COCoreLogForCategory(19);
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      v12 = *(_QWORD *)(a1 + 48);
      *(_DWORD *)buf = 134218498;
      v34 = v12;
      v35 = 2048;
      v36 = v6;
      v37 = 2112;
      v38 = v6;
      _os_log_impl(&dword_215E92000, v11, OS_LOG_TYPE_DEFAULT, "%p created new device link %p (%@)", buf, 0x20u);
    }

    objc_destroyWeak(&v18);
    objc_destroyWeak(&v17);
    objc_destroyWeak(&v21);
    objc_destroyWeak(&v20);
    objc_destroyWeak(&v24);
    objc_destroyWeak(&v23);
    objc_destroyWeak(&v27);
    objc_destroyWeak(&v26);
    objc_destroyWeak(&v30);
    objc_destroyWeak(&v29);
    objc_destroyWeak(&from);
    objc_destroyWeak(&location);
  }
  v13 = -[COCompanionLinkClient initWithCompanionLinkClient:]([COCompanionLinkClient alloc], "initWithCompanionLinkClient:", v6);
  v14 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
  v15 = *(void **)(v14 + 40);
  *(_QWORD *)(v14 + 40) = v13;

  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40), "setFactory:", *(_QWORD *)(a1 + 48));
  objc_msgSend(v5, "addObject:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40));

}

void __79__COCompanionLinkClientFactory_companionLinkClientForDevice_withIDSIdentifier___block_invoke_2(uint64_t a1)
{
  id v2;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v2 = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained && v2)
    objc_msgSend(WeakRetained, "didInterrupt:", v2);

}

void __79__COCompanionLinkClientFactory_companionLinkClientForDevice_withIDSIdentifier___block_invoke_3(uint64_t a1)
{
  id v2;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v2 = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained && v2)
    objc_msgSend(WeakRetained, "didUpdateState:", v2);

}

void __79__COCompanionLinkClientFactory_companionLinkClientForDevice_withIDSIdentifier___block_invoke_4(uint64_t a1)
{
  id v2;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v2 = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained && v2)
    objc_msgSend(WeakRetained, "didChangeErrorFlags:", v2);

}

void __79__COCompanionLinkClientFactory_companionLinkClientForDevice_withIDSIdentifier___block_invoke_5(uint64_t a1)
{
  id v2;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v2 = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained && v2)
    objc_msgSend(WeakRetained, "didDisconnect:", v2);

}

void __79__COCompanionLinkClientFactory_companionLinkClientForDevice_withIDSIdentifier___block_invoke_6(uint64_t a1)
{
  id v2;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v2 = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained && v2)
    objc_msgSend(WeakRetained, "didInvalidate:", v2);

}

- (void)didFindDevice:(id)a3
{
  void *v4;
  id v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  void *v11;
  NSObject *v12;
  NSObject *v13;
  id v14;
  _QWORD block[4];
  id v16;
  id v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _QWORD v22[5];
  id v23;
  uint64_t *v24;
  uint64_t v25;
  uint64_t *v26;
  uint64_t v27;
  uint64_t (*v28)(uint64_t, uint64_t);
  void (*v29)(uint64_t);
  id v30;
  _BYTE v31[128];
  uint64_t v32;

  v32 = *MEMORY[0x24BDAC8D0];
  v14 = a3;
  objc_msgSend(v14, "idsDeviceIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    v25 = 0;
    v26 = &v25;
    v27 = 0x3032000000;
    v28 = __Block_byref_object_copy__0;
    v29 = __Block_byref_object_dispose__0;
    v30 = 0;
    v22[0] = MEMORY[0x24BDAC760];
    v22[1] = 3221225472;
    v22[2] = __46__COCompanionLinkClientFactory_didFindDevice___block_invoke;
    v22[3] = &unk_24D4B08A8;
    v22[4] = self;
    v5 = v14;
    v23 = v5;
    v24 = &v25;
    -[COCompanionLinkClientFactory _withLock:](self, "_withLock:", v22);
    v20 = 0u;
    v21 = 0u;
    v18 = 0u;
    v19 = 0u;
    v6 = (id)v26[5];
    v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v18, v31, 16);
    if (v7)
    {
      v8 = *(_QWORD *)v19;
      do
      {
        for (i = 0; i != v7; ++i)
        {
          if (*(_QWORD *)v19 != v8)
            objc_enumerationMutation(v6);
          v10 = *(void **)(*((_QWORD *)&v18 + 1) + 8 * i);
          objc_msgSend(v10, "deviceFoundHandler");
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          if (v11 && (objc_msgSend(v10, "flags") & 0xA) == 2)
          {
            objc_msgSend(v10, "dispatchQueue");
            v12 = objc_claimAutoreleasedReturnValue();
            block[0] = MEMORY[0x24BDAC760];
            block[1] = 3221225472;
            block[2] = __46__COCompanionLinkClientFactory_didFindDevice___block_invoke_13;
            block[3] = &unk_24D4B0B68;
            v17 = v11;
            v16 = v5;
            dispatch_async(v12, block);

          }
        }
        v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v18, v31, 16);
      }
      while (v7);
    }

    _Block_object_dispose(&v25, 8);
  }
  else
  {
    COCoreLogForCategory(19);
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      -[COCompanionLinkClientFactory didFindDevice:].cold.1((uint64_t)self, (uint64_t)v14, v13);

  }
}

void __46__COCompanionLinkClientFactory_didFindDevice___block_invoke(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  int v13;
  uint64_t v14;
  __int16 v15;
  uint64_t v16;
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  COCoreLogForCategory(19);
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    v3 = *(_QWORD *)(a1 + 32);
    v4 = *(_QWORD *)(a1 + 40);
    v13 = 134218242;
    v14 = v3;
    v15 = 2112;
    v16 = v4;
    _os_log_impl(&dword_215E92000, v2, OS_LOG_TYPE_DEFAULT, "%p informing locals of found %@", (uint8_t *)&v13, 0x16u);
  }

  objc_msgSend(*(id *)(a1 + 32), "locals");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "allObjects");
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v8 = *(void **)(v7 + 40);
  *(_QWORD *)(v7 + 40) = v6;

  v9 = *(_QWORD *)(a1 + 32);
  v10 = *(void **)(a1 + 40);
  v11 = *(void **)(v9 + 16);
  objc_msgSend(v10, "idsDeviceIdentifier");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setObject:forKey:", v10, v12);

}

uint64_t __46__COCompanionLinkClientFactory_didFindDevice___block_invoke_13(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));
}

- (void)didLoseDevice:(id)a3
{
  void *v4;
  BOOL v5;
  id v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  void *v12;
  NSObject *v13;
  id v14;
  _QWORD block[4];
  id v16;
  id v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _QWORD v22[5];
  id v23;
  uint64_t *v24;
  uint64_t v25;
  uint64_t *v26;
  uint64_t v27;
  uint64_t (*v28)(uint64_t, uint64_t);
  void (*v29)(uint64_t);
  id v30;
  _BYTE v31[128];
  uint64_t v32;

  v32 = *MEMORY[0x24BDAC8D0];
  v25 = 0;
  v26 = &v25;
  v27 = 0x3032000000;
  v28 = __Block_byref_object_copy__0;
  v29 = __Block_byref_object_dispose__0;
  v30 = 0;
  v14 = a3;
  objc_msgSend(v14, "idsDeviceIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4 == 0;

  if (!v5)
  {
    v22[0] = MEMORY[0x24BDAC760];
    v22[1] = 3221225472;
    v22[2] = __46__COCompanionLinkClientFactory_didLoseDevice___block_invoke;
    v22[3] = &unk_24D4B08A8;
    v22[4] = self;
    v6 = v14;
    v23 = v6;
    v24 = &v25;
    -[COCompanionLinkClientFactory _withLock:](self, "_withLock:", v22);
    v20 = 0u;
    v21 = 0u;
    v18 = 0u;
    v19 = 0u;
    v7 = (id)v26[5];
    v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v18, v31, 16);
    if (v8)
    {
      v9 = *(_QWORD *)v19;
      do
      {
        for (i = 0; i != v8; ++i)
        {
          if (*(_QWORD *)v19 != v9)
            objc_enumerationMutation(v7);
          v11 = *(void **)(*((_QWORD *)&v18 + 1) + 8 * i);
          objc_msgSend(v11, "deviceLostHandler");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          if (v12 && (objc_msgSend(v11, "flags") & 0xA) == 2)
          {
            objc_msgSend(v11, "dispatchQueue");
            v13 = objc_claimAutoreleasedReturnValue();
            block[0] = MEMORY[0x24BDAC760];
            block[1] = 3221225472;
            block[2] = __46__COCompanionLinkClientFactory_didLoseDevice___block_invoke_14;
            block[3] = &unk_24D4B0B68;
            v17 = v12;
            v16 = v6;
            dispatch_async(v13, block);

          }
        }
        v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v18, v31, 16);
      }
      while (v8);
    }

  }
  _Block_object_dispose(&v25, 8);

}

void __46__COCompanionLinkClientFactory_didLoseDevice___block_invoke(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  int v12;
  uint64_t v13;
  __int16 v14;
  uint64_t v15;
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  COCoreLogForCategory(19);
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    v3 = *(_QWORD *)(a1 + 32);
    v4 = *(_QWORD *)(a1 + 40);
    v12 = 134218242;
    v13 = v3;
    v14 = 2112;
    v15 = v4;
    _os_log_impl(&dword_215E92000, v2, OS_LOG_TYPE_DEFAULT, "%p informing locals of lost %@", (uint8_t *)&v12, 0x16u);
  }

  objc_msgSend(*(id *)(a1 + 32), "locals");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "allObjects");
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v8 = *(void **)(v7 + 40);
  *(_QWORD *)(v7 + 40) = v6;

  v9 = *(void **)(a1 + 40);
  v10 = *(void **)(*(_QWORD *)(a1 + 32) + 16);
  objc_msgSend(v9, "idsDeviceIdentifier");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "removeObjectForKey:", v11);

}

uint64_t __46__COCompanionLinkClientFactory_didLoseDevice___block_invoke_14(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));
}

- (void)didChangeDevice:(id)a3 flags:(unsigned int)a4
{
  id v6;
  id v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  void *v13;
  NSObject *v14;
  NSObject *v15;
  _QWORD block[4];
  id v17;
  id v18;
  unsigned int v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  _QWORD v24[5];
  id v25;
  uint64_t *v26;
  uint64_t *v27;
  uint64_t v28;
  uint64_t *v29;
  uint64_t v30;
  uint64_t (*v31)(uint64_t, uint64_t);
  void (*v32)(uint64_t);
  id v33;
  uint64_t v34;
  uint64_t *v35;
  uint64_t v36;
  uint64_t (*v37)(uint64_t, uint64_t);
  void (*v38)(uint64_t);
  id v39;
  uint8_t v40[128];
  uint8_t buf[4];
  COCompanionLinkClientFactory *v42;
  __int16 v43;
  id v44;
  uint64_t v45;

  v45 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v34 = 0;
  v35 = &v34;
  v36 = 0x3032000000;
  v37 = __Block_byref_object_copy__0;
  v38 = __Block_byref_object_dispose__0;
  v39 = 0;
  v28 = 0;
  v29 = &v28;
  v30 = 0x3032000000;
  v31 = __Block_byref_object_copy__0;
  v32 = __Block_byref_object_dispose__0;
  v33 = 0;
  v24[0] = MEMORY[0x24BDAC760];
  v24[1] = 3221225472;
  v24[2] = __54__COCompanionLinkClientFactory_didChangeDevice_flags___block_invoke;
  v24[3] = &unk_24D4B0B90;
  v26 = &v34;
  v24[4] = self;
  v7 = v6;
  v25 = v7;
  v27 = &v28;
  -[COCompanionLinkClientFactory _withLock:](self, "_withLock:", v24);
  if (v35[5])
  {
    v22 = 0u;
    v23 = 0u;
    v20 = 0u;
    v21 = 0u;
    v8 = (id)v29[5];
    v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v20, v40, 16);
    if (v9)
    {
      v10 = *(_QWORD *)v21;
      do
      {
        for (i = 0; i != v9; ++i)
        {
          if (*(_QWORD *)v21 != v10)
            objc_enumerationMutation(v8);
          v12 = *(void **)(*((_QWORD *)&v20 + 1) + 8 * i);
          objc_msgSend(v12, "deviceChangedHandler");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          if (v13 && (objc_msgSend(v12, "flags") & 0xA) == 2)
          {
            objc_msgSend(v12, "dispatchQueue");
            v14 = objc_claimAutoreleasedReturnValue();
            block[0] = MEMORY[0x24BDAC760];
            block[1] = 3221225472;
            block[2] = __54__COCompanionLinkClientFactory_didChangeDevice_flags___block_invoke_15;
            block[3] = &unk_24D4B0BB8;
            v18 = v13;
            v17 = v7;
            v19 = a4;
            dispatch_async(v14, block);

          }
        }
        v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v20, v40, 16);
      }
      while (v9);
    }

  }
  else
  {
    COCoreLogForCategory(19);
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134218242;
      v42 = self;
      v43 = 2112;
      v44 = v7;
      _os_log_impl(&dword_215E92000, v15, OS_LOG_TYPE_DEFAULT, "%p device updated which wasn't in our active list. Treating as found device %@", buf, 0x16u);
    }

    -[COCompanionLinkClientFactory didFindDevice:](self, "didFindDevice:", v7);
  }

  _Block_object_dispose(&v28, 8);
  _Block_object_dispose(&v34, 8);

}

void __54__COCompanionLinkClientFactory_didChangeDevice_flags___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  id v13;

  v2 = *(void **)(*(_QWORD *)(a1 + 32) + 16);
  objc_msgSend(*(id *)(a1 + 40), "idsDeviceIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKey:", v3);
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v6 = *(void **)(v5 + 40);
  *(_QWORD *)(v5 + 40) = v4;

  if (v4)
  {
    v7 = *(void **)(a1 + 40);
    v8 = *(void **)(*(_QWORD *)(a1 + 32) + 16);
    objc_msgSend(v7, "idsDeviceIdentifier");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setObject:forKey:", v7, v9);

  }
  objc_msgSend(*(id *)(a1 + 32), "locals");
  v13 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "allObjects");
  v10 = objc_claimAutoreleasedReturnValue();
  v11 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
  v12 = *(void **)(v11 + 40);
  *(_QWORD *)(v11 + 40) = v10;

}

uint64_t __54__COCompanionLinkClientFactory_didChangeDevice_flags___block_invoke_15(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32), *(unsigned int *)(a1 + 48));
}

- (void)didUpdateLocalDevice:(id)a3
{
  id v4;
  id v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  void *v11;
  NSObject *v12;
  _QWORD v13[4];
  id v14;
  id v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _QWORD v20[5];
  id v21;
  uint64_t *v22;
  uint64_t v23;
  uint64_t *v24;
  uint64_t v25;
  uint64_t (*v26)(uint64_t, uint64_t);
  void (*v27)(uint64_t);
  id v28;
  _BYTE v29[128];
  uint64_t v30;

  v30 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v23 = 0;
  v24 = &v23;
  v25 = 0x3032000000;
  v26 = __Block_byref_object_copy__0;
  v27 = __Block_byref_object_dispose__0;
  v28 = 0;
  v20[0] = MEMORY[0x24BDAC760];
  v20[1] = 3221225472;
  v20[2] = __53__COCompanionLinkClientFactory_didUpdateLocalDevice___block_invoke;
  v20[3] = &unk_24D4B08A8;
  v20[4] = self;
  v5 = v4;
  v21 = v5;
  v22 = &v23;
  -[COCompanionLinkClientFactory _withLock:](self, "_withLock:", v20);
  v18 = 0u;
  v19 = 0u;
  v16 = 0u;
  v17 = 0u;
  v6 = (id)v24[5];
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v16, v29, 16);
  if (v7)
  {
    v8 = *(_QWORD *)v17;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v17 != v8)
          objc_enumerationMutation(v6);
        v10 = *(void **)(*((_QWORD *)&v16 + 1) + 8 * i);
        objc_msgSend(v10, "localDeviceUpdatedHandler");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        if (v11 && (objc_msgSend(v10, "flags") & 0xA) == 2)
        {
          objc_msgSend(v10, "dispatchQueue");
          v12 = objc_claimAutoreleasedReturnValue();
          v13[0] = MEMORY[0x24BDAC760];
          v13[1] = 3221225472;
          v13[2] = __53__COCompanionLinkClientFactory_didUpdateLocalDevice___block_invoke_16;
          v13[3] = &unk_24D4B0B68;
          v15 = v11;
          v14 = v5;
          dispatch_async(v12, v13);

        }
      }
      v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v16, v29, 16);
    }
    while (v7);
  }

  _Block_object_dispose(&v23, 8);
}

void __53__COCompanionLinkClientFactory_didUpdateLocalDevice___block_invoke(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;

  COCoreLogForCategory(19);
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
    __53__COCompanionLinkClientFactory_didUpdateLocalDevice___block_invoke_cold_1(a1, v2);

  objc_msgSend(*(id *)(a1 + 32), "locals");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "allObjects");
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v6 = *(void **)(v5 + 40);
  *(_QWORD *)(v5 + 40) = v4;

}

uint64_t __53__COCompanionLinkClientFactory_didUpdateLocalDevice___block_invoke_16(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));
}

- (void)didInterrupt:(id)a3
{
  id v4;
  id v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _QWORD v14[5];
  id v15;
  uint64_t *v16;
  uint64_t v17;
  uint64_t *v18;
  uint64_t v19;
  uint64_t (*v20)(uint64_t, uint64_t);
  void (*v21)(uint64_t);
  id v22;
  _BYTE v23[128];
  uint64_t v24;

  v24 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v17 = 0;
  v18 = &v17;
  v19 = 0x3032000000;
  v20 = __Block_byref_object_copy__0;
  v21 = __Block_byref_object_dispose__0;
  v22 = 0;
  v14[0] = MEMORY[0x24BDAC760];
  v14[1] = 3221225472;
  v14[2] = __45__COCompanionLinkClientFactory_didInterrupt___block_invoke;
  v14[3] = &unk_24D4B0BE0;
  v16 = &v17;
  v14[4] = self;
  v5 = v4;
  v15 = v5;
  -[COCompanionLinkClientFactory _withLock:](self, "_withLock:", v14);
  v12 = 0u;
  v13 = 0u;
  v10 = 0u;
  v11 = 0u;
  v6 = (id)v18[5];
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v10, v23, 16);
  if (v7)
  {
    v8 = *(_QWORD *)v11;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v11 != v8)
          objc_enumerationMutation(v6);
        objc_msgSend(*(id *)(*((_QWORD *)&v10 + 1) + 8 * v9++), "didInterrupt", (_QWORD)v10);
      }
      while (v7 != v9);
      v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v10, v23, 16);
    }
    while (v7);
  }

  _Block_object_dispose(&v17, 8);
}

void __45__COCompanionLinkClientFactory_didInterrupt___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  objc_msgSend(*(id *)(a1 + 32), "_clientsForRapportClient_unsafe:", *(_QWORD *)(a1 + 40));
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

- (void)didUpdateState:(id)a3
{
  id v4;
  id v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _QWORD v14[5];
  id v15;
  uint64_t *v16;
  uint64_t v17;
  uint64_t *v18;
  uint64_t v19;
  uint64_t (*v20)(uint64_t, uint64_t);
  void (*v21)(uint64_t);
  id v22;
  _BYTE v23[128];
  uint64_t v24;

  v24 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v17 = 0;
  v18 = &v17;
  v19 = 0x3032000000;
  v20 = __Block_byref_object_copy__0;
  v21 = __Block_byref_object_dispose__0;
  v22 = 0;
  v14[0] = MEMORY[0x24BDAC760];
  v14[1] = 3221225472;
  v14[2] = __47__COCompanionLinkClientFactory_didUpdateState___block_invoke;
  v14[3] = &unk_24D4B0BE0;
  v16 = &v17;
  v14[4] = self;
  v5 = v4;
  v15 = v5;
  -[COCompanionLinkClientFactory _withLock:](self, "_withLock:", v14);
  v12 = 0u;
  v13 = 0u;
  v10 = 0u;
  v11 = 0u;
  v6 = (id)v18[5];
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v10, v23, 16);
  if (v7)
  {
    v8 = *(_QWORD *)v11;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v11 != v8)
          objc_enumerationMutation(v6);
        objc_msgSend(*(id *)(*((_QWORD *)&v10 + 1) + 8 * v9++), "didUpdateState", (_QWORD)v10);
      }
      while (v7 != v9);
      v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v10, v23, 16);
    }
    while (v7);
  }

  _Block_object_dispose(&v17, 8);
}

void __47__COCompanionLinkClientFactory_didUpdateState___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  objc_msgSend(*(id *)(a1 + 32), "_clientsForRapportClient_unsafe:", *(_QWORD *)(a1 + 40));
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

- (void)didChangeErrorFlags:(id)a3
{
  id v4;
  id v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _QWORD v14[5];
  id v15;
  uint64_t *v16;
  uint64_t v17;
  uint64_t *v18;
  uint64_t v19;
  uint64_t (*v20)(uint64_t, uint64_t);
  void (*v21)(uint64_t);
  id v22;
  _BYTE v23[128];
  uint64_t v24;

  v24 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v17 = 0;
  v18 = &v17;
  v19 = 0x3032000000;
  v20 = __Block_byref_object_copy__0;
  v21 = __Block_byref_object_dispose__0;
  v22 = 0;
  v14[0] = MEMORY[0x24BDAC760];
  v14[1] = 3221225472;
  v14[2] = __52__COCompanionLinkClientFactory_didChangeErrorFlags___block_invoke;
  v14[3] = &unk_24D4B0BE0;
  v16 = &v17;
  v14[4] = self;
  v5 = v4;
  v15 = v5;
  -[COCompanionLinkClientFactory _withLock:](self, "_withLock:", v14);
  v12 = 0u;
  v13 = 0u;
  v10 = 0u;
  v11 = 0u;
  v6 = (id)v18[5];
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v10, v23, 16);
  if (v7)
  {
    v8 = *(_QWORD *)v11;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v11 != v8)
          objc_enumerationMutation(v6);
        objc_msgSend(*(id *)(*((_QWORD *)&v10 + 1) + 8 * v9++), "didChangeErrorFlags", (_QWORD)v10);
      }
      while (v7 != v9);
      v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v10, v23, 16);
    }
    while (v7);
  }

  _Block_object_dispose(&v17, 8);
}

void __52__COCompanionLinkClientFactory_didChangeErrorFlags___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  objc_msgSend(*(id *)(a1 + 32), "_clientsForRapportClient_unsafe:", *(_QWORD *)(a1 + 40));
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

- (void)didDisconnect:(id)a3
{
  id v4;
  id v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _QWORD v14[4];
  id v15;
  COCompanionLinkClientFactory *v16;
  uint64_t *v17;
  uint64_t v18;
  uint64_t *v19;
  uint64_t v20;
  uint64_t (*v21)(uint64_t, uint64_t);
  void (*v22)(uint64_t);
  id v23;
  _BYTE v24[128];
  uint64_t v25;

  v25 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v18 = 0;
  v19 = &v18;
  v20 = 0x3032000000;
  v21 = __Block_byref_object_copy__0;
  v22 = __Block_byref_object_dispose__0;
  v23 = 0;
  v14[0] = MEMORY[0x24BDAC760];
  v14[1] = 3221225472;
  v14[2] = __46__COCompanionLinkClientFactory_didDisconnect___block_invoke;
  v14[3] = &unk_24D4B0C08;
  v5 = v4;
  v16 = self;
  v17 = &v18;
  v15 = v5;
  -[COCompanionLinkClientFactory _withLock:](self, "_withLock:", v14);
  v12 = 0u;
  v13 = 0u;
  v10 = 0u;
  v11 = 0u;
  v6 = (id)v19[5];
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v10, v24, 16);
  if (v7)
  {
    v8 = *(_QWORD *)v11;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v11 != v8)
          objc_enumerationMutation(v6);
        objc_msgSend(*(id *)(*((_QWORD *)&v10 + 1) + 8 * v9++), "didDisconnect", (_QWORD)v10);
      }
      while (v7 != v9);
      v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v10, v24, 16);
    }
    while (v7);
  }

  _Block_object_dispose(&v18, 8);
}

void __46__COCompanionLinkClientFactory_didDisconnect___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  objc_msgSend(*(id *)(a1 + 32), "co_SetCompanionLinkClientFlags:", objc_msgSend(*(id *)(a1 + 32), "co_CompanionLinkClientFlags") | 4);
  objc_msgSend(*(id *)(a1 + 40), "_clientsForRapportClient_unsafe:", *(_QWORD *)(a1 + 32));
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

- (void)didInvalidate:(id)a3
{
  id v4;
  id v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _QWORD v14[4];
  id v15;
  COCompanionLinkClientFactory *v16;
  uint64_t *v17;
  uint64_t v18;
  uint64_t *v19;
  uint64_t v20;
  uint64_t (*v21)(uint64_t, uint64_t);
  void (*v22)(uint64_t);
  id v23;
  _BYTE v24[128];
  uint64_t v25;

  v25 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v18 = 0;
  v19 = &v18;
  v20 = 0x3032000000;
  v21 = __Block_byref_object_copy__0;
  v22 = __Block_byref_object_dispose__0;
  v23 = 0;
  v14[0] = MEMORY[0x24BDAC760];
  v14[1] = 3221225472;
  v14[2] = __46__COCompanionLinkClientFactory_didInvalidate___block_invoke;
  v14[3] = &unk_24D4B0C08;
  v5 = v4;
  v16 = self;
  v17 = &v18;
  v15 = v5;
  -[COCompanionLinkClientFactory _withLock:](self, "_withLock:", v14);
  v12 = 0u;
  v13 = 0u;
  v10 = 0u;
  v11 = 0u;
  v6 = (id)v19[5];
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v10, v24, 16);
  if (v7)
  {
    v8 = *(_QWORD *)v11;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v11 != v8)
          objc_enumerationMutation(v6);
        objc_msgSend(*(id *)(*((_QWORD *)&v10 + 1) + 8 * v9++), "didInvalidate", (_QWORD)v10);
      }
      while (v7 != v9);
      v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v10, v24, 16);
    }
    while (v7);
  }

  _Block_object_dispose(&v18, 8);
}

void __46__COCompanionLinkClientFactory_didInvalidate___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  objc_msgSend(*(id *)(a1 + 32), "co_SetCompanionLinkClientFlags:", objc_msgSend(*(id *)(a1 + 32), "co_CompanionLinkClientFlags") | 8);
  objc_msgSend(*(id *)(a1 + 40), "_clientsForRapportClient_unsafe:", *(_QWORD *)(a1 + 32));
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

- (void)didActivate:(id)a3 error:(id)a4
{
  id v6;
  id v7;
  id v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _QWORD v17[4];
  id v18;
  COCompanionLinkClientFactory *v19;
  uint64_t *v20;
  uint64_t v21;
  uint64_t *v22;
  uint64_t v23;
  uint64_t (*v24)(uint64_t, uint64_t);
  void (*v25)(uint64_t);
  id v26;
  _BYTE v27[128];
  uint64_t v28;

  v28 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  v21 = 0;
  v22 = &v21;
  v23 = 0x3032000000;
  v24 = __Block_byref_object_copy__0;
  v25 = __Block_byref_object_dispose__0;
  v26 = 0;
  v17[0] = MEMORY[0x24BDAC760];
  v17[1] = 3221225472;
  v17[2] = __50__COCompanionLinkClientFactory_didActivate_error___block_invoke;
  v17[3] = &unk_24D4B0C08;
  v8 = v6;
  v19 = self;
  v20 = &v21;
  v18 = v8;
  -[COCompanionLinkClientFactory _withLock:](self, "_withLock:", v17);
  v15 = 0u;
  v16 = 0u;
  v13 = 0u;
  v14 = 0u;
  v9 = (id)v22[5];
  v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v13, v27, 16);
  if (v10)
  {
    v11 = *(_QWORD *)v14;
    do
    {
      v12 = 0;
      do
      {
        if (*(_QWORD *)v14 != v11)
          objc_enumerationMutation(v9);
        objc_msgSend(*(id *)(*((_QWORD *)&v13 + 1) + 8 * v12++), "didActivateWithError:", v7, (_QWORD)v13);
      }
      while (v10 != v12);
      v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v13, v27, 16);
    }
    while (v10);
  }

  _Block_object_dispose(&v21, 8);
}

void __50__COCompanionLinkClientFactory_didActivate_error___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  objc_msgSend(*(id *)(a1 + 32), "co_SetCompanionLinkClientFlags:", objc_msgSend(*(id *)(a1 + 32), "co_CompanionLinkClientFlags") | 2);
  objc_msgSend(*(id *)(a1 + 40), "_clientsForRapportClient_unsafe:", *(_QWORD *)(a1 + 32));
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

- (void)didRegisterRequestID:(id)a3 client:(id)a4
{
  id v6;
  id v7;
  id v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _QWORD v19[5];
  id v20;
  uint64_t *v21;
  uint64_t v22;
  uint64_t *v23;
  uint64_t v24;
  uint64_t (*v25)(uint64_t, uint64_t);
  void (*v26)(uint64_t);
  id v27;
  _BYTE v28[128];
  uint64_t v29;

  v29 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  v22 = 0;
  v23 = &v22;
  v24 = 0x3032000000;
  v25 = __Block_byref_object_copy__0;
  v26 = __Block_byref_object_dispose__0;
  v27 = 0;
  v19[0] = MEMORY[0x24BDAC760];
  v19[1] = 3221225472;
  v19[2] = __60__COCompanionLinkClientFactory_didRegisterRequestID_client___block_invoke;
  v19[3] = &unk_24D4B0BE0;
  v21 = &v22;
  v19[4] = self;
  v8 = v7;
  v20 = v8;
  -[COCompanionLinkClientFactory _withLock:](self, "_withLock:", v19);
  v17 = 0u;
  v18 = 0u;
  v15 = 0u;
  v16 = 0u;
  v9 = (id)v23[5];
  v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v15, v28, 16);
  if (v10)
  {
    v11 = *(_QWORD *)v16;
    do
    {
      v12 = 0;
      do
      {
        if (*(_QWORD *)v16 != v11)
          objc_enumerationMutation(v9);
        objc_msgSend(*(id *)(*((_QWORD *)&v15 + 1) + 8 * v12), "requestIDRegistrationCompletion", (_QWORD)v15);
        v13 = objc_claimAutoreleasedReturnValue();
        v14 = (void *)v13;
        if (v13)
          (*(void (**)(uint64_t, id))(v13 + 16))(v13, v6);

        ++v12;
      }
      while (v10 != v12);
      v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v15, v28, 16);
    }
    while (v10);
  }

  _Block_object_dispose(&v22, 8);
}

void __60__COCompanionLinkClientFactory_didRegisterRequestID_client___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  objc_msgSend(*(id *)(a1 + 32), "_clientsForRapportClient_unsafe:", *(_QWORD *)(a1 + 40));
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

- (void)didRegisterEventID:(id)a3 client:(id)a4
{
  id v6;
  id v7;
  id v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _QWORD v19[5];
  id v20;
  uint64_t *v21;
  uint64_t v22;
  uint64_t *v23;
  uint64_t v24;
  uint64_t (*v25)(uint64_t, uint64_t);
  void (*v26)(uint64_t);
  id v27;
  _BYTE v28[128];
  uint64_t v29;

  v29 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  v22 = 0;
  v23 = &v22;
  v24 = 0x3032000000;
  v25 = __Block_byref_object_copy__0;
  v26 = __Block_byref_object_dispose__0;
  v27 = 0;
  v19[0] = MEMORY[0x24BDAC760];
  v19[1] = 3221225472;
  v19[2] = __58__COCompanionLinkClientFactory_didRegisterEventID_client___block_invoke;
  v19[3] = &unk_24D4B0BE0;
  v21 = &v22;
  v19[4] = self;
  v8 = v7;
  v20 = v8;
  -[COCompanionLinkClientFactory _withLock:](self, "_withLock:", v19);
  v17 = 0u;
  v18 = 0u;
  v15 = 0u;
  v16 = 0u;
  v9 = (id)v23[5];
  v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v15, v28, 16);
  if (v10)
  {
    v11 = *(_QWORD *)v16;
    do
    {
      v12 = 0;
      do
      {
        if (*(_QWORD *)v16 != v11)
          objc_enumerationMutation(v9);
        objc_msgSend(*(id *)(*((_QWORD *)&v15 + 1) + 8 * v12), "eventIDRegistrationCompletion", (_QWORD)v15);
        v13 = objc_claimAutoreleasedReturnValue();
        v14 = (void *)v13;
        if (v13)
          (*(void (**)(uint64_t, id))(v13 + 16))(v13, v6);

        ++v12;
      }
      while (v10 != v12);
      v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v15, v28, 16);
    }
    while (v10);
  }

  _Block_object_dispose(&v22, 8);
}

void __58__COCompanionLinkClientFactory_didRegisterEventID_client___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  objc_msgSend(*(id *)(a1 + 32), "_clientsForRapportClient_unsafe:", *(_QWORD *)(a1 + 40));
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

- (void)activateCompanionLinkClient:(id)a3
{
  id v4;
  id v5;
  _QWORD v6[4];
  id v7;
  COCompanionLinkClientFactory *v8;

  v4 = a3;
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __60__COCompanionLinkClientFactory_activateCompanionLinkClient___block_invoke;
  v6[3] = &unk_24D4B0858;
  v7 = v4;
  v8 = self;
  v5 = v4;
  -[COCompanionLinkClientFactory _withLock:](self, "_withLock:", v6);

}

void __60__COCompanionLinkClientFactory_activateCompanionLinkClient___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  NSObject *v5;
  uint64_t v6;
  void *v7;
  char v8;
  NSObject *v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  void *v16;
  NSObject *v17;
  id v18;
  _QWORD v19[4];
  id v20;
  id v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  _QWORD v26[4];
  id v27;
  id v28;
  id v29;
  char v30;
  id location;
  uint8_t v32[128];
  uint8_t buf[4];
  uint64_t v34;
  __int16 v35;
  void *v36;
  __int16 v37;
  void *v38;
  uint64_t v39;

  v39 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(*(id *)(a1 + 32), "rapport");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "co_CompanionLinkClientFlags");
  v4 = v3;
  if ((v3 & 1) == 0)
  {
    COCoreLogForCategory(19);
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      v6 = *(_QWORD *)(a1 + 40);
      *(_DWORD *)buf = 134218498;
      v34 = v6;
      v35 = 2048;
      v36 = v2;
      v37 = 2112;
      v38 = v2;
      _os_log_impl(&dword_215E92000, v5, OS_LOG_TYPE_DEFAULT, "%p activating %p (%@)", buf, 0x20u);
    }

    objc_msgSend(v2, "co_SetCompanionLinkClientFlags:", v4 | 1);
    objc_msgSend(*(id *)(a1 + 32), "destinationDevice");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (v7)
      v8 = objc_msgSend(*(id *)(a1 + 40), "_isKnownDevice:", v7);
    else
      v8 = 0;
    objc_initWeak((id *)buf, *(id *)(a1 + 40));
    objc_initWeak(&location, v2);
    v26[0] = MEMORY[0x24BDAC760];
    v26[1] = 3221225472;
    v26[2] = __60__COCompanionLinkClientFactory_activateCompanionLinkClient___block_invoke_17;
    v26[3] = &unk_24D4B0C30;
    objc_copyWeak(&v28, (id *)buf);
    objc_copyWeak(&v29, &location);
    v30 = v8;
    v18 = v7;
    v27 = v18;
    objc_msgSend(v2, "activateWithCompletion:", v26);

    objc_destroyWeak(&v29);
    objc_destroyWeak(&v28);
    objc_destroyWeak(&location);
    objc_destroyWeak((id *)buf);
LABEL_21:

    goto LABEL_22;
  }
  if ((v3 & 2) != 0)
  {
    COCoreLogForCategory(19);
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      v10 = *(_QWORD *)(a1 + 40);
      *(_DWORD *)buf = 134218498;
      v34 = v10;
      v35 = 2048;
      v36 = v2;
      v37 = 2112;
      v38 = v2;
      _os_log_impl(&dword_215E92000, v9, OS_LOG_TYPE_DEFAULT, "%p already activated %p (%@)", buf, 0x20u);
    }

    v24 = 0u;
    v25 = 0u;
    v22 = 0u;
    v23 = 0u;
    objc_msgSend(*(id *)(a1 + 40), "_clientsForRapportClient_unsafe:", v2);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v22, v32, 16);
    if (v12)
    {
      v13 = *(_QWORD *)v23;
LABEL_11:
      v14 = 0;
      while (1)
      {
        if (*(_QWORD *)v23 != v13)
          objc_enumerationMutation(v11);
        objc_msgSend(*(id *)(*((_QWORD *)&v22 + 1) + 8 * v14), "activationError");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        if (v15)
          break;
        if (v12 == ++v14)
        {
          v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v22, v32, 16);
          if (v12)
            goto LABEL_11;
          goto LABEL_17;
        }
      }
    }
    else
    {
LABEL_17:
      v15 = 0;
    }

    v16 = *(void **)(a1 + 32);
    v17 = *(NSObject **)(*(_QWORD *)(a1 + 40) + 24);
    v19[0] = MEMORY[0x24BDAC760];
    v19[1] = 3221225472;
    v19[2] = __60__COCompanionLinkClientFactory_activateCompanionLinkClient___block_invoke_19;
    v19[3] = &unk_24D4B0858;
    v20 = v16;
    v21 = v15;
    v18 = v15;
    dispatch_async(v17, v19);

    goto LABEL_21;
  }
LABEL_22:

}

void __60__COCompanionLinkClientFactory_activateCompanionLinkClient___block_invoke_17(uint64_t a1, void *a2)
{
  id WeakRetained;
  id v4;
  void *v5;
  id v6;

  v6 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v4 = objc_loadWeakRetained((id *)(a1 + 48));
  v5 = v4;
  if (WeakRetained)
  {
    if (v4)
    {
      objc_msgSend(WeakRetained, "didActivate:error:", v4, v6);
      if (!v6 && !*(_BYTE *)(a1 + 56) && *(_QWORD *)(a1 + 32))
        objc_msgSend(WeakRetained, "didFindDevice:");
    }
  }

}

uint64_t __60__COCompanionLinkClientFactory_activateCompanionLinkClient___block_invoke_19(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(a1 + 32), "didActivateWithError:", *(_QWORD *)(a1 + 40));
  if (!*(_QWORD *)(a1 + 40))
  {
    if (objc_msgSend(*(id *)(a1 + 32), "usingOnDemandConnection"))
      objc_msgSend(*(id *)(a1 + 32), "didUpdateState");
    result = objc_msgSend(*(id *)(a1 + 32), "errorFlags");
    if (result)
      return objc_msgSend(*(id *)(a1 + 32), "didChangeErrorFlags");
  }
  return result;
}

- (void)invalidateCompanionLinkClient:(id)a3
{
  id v4;
  id v5;
  _QWORD v6[4];
  id v7;
  COCompanionLinkClientFactory *v8;

  v4 = a3;
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __62__COCompanionLinkClientFactory_invalidateCompanionLinkClient___block_invoke;
  v6[3] = &unk_24D4B0858;
  v7 = v4;
  v8 = self;
  v5 = v4;
  -[COCompanionLinkClientFactory _withLock:](self, "_withLock:", v6);

}

void __62__COCompanionLinkClientFactory_invalidateCompanionLinkClient___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  uint64_t v7;
  NSObject *v8;
  _BOOL4 v9;
  uint64_t v10;
  void *v11;
  NSObject *v12;
  uint64_t v13;
  _QWORD v14[4];
  id v15;
  _QWORD v16[4];
  id v17;
  uint8_t buf[4];
  uint64_t v19;
  __int16 v20;
  void *v21;
  __int16 v22;
  void *v23;
  uint64_t v24;

  v24 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(*(id *)(a1 + 32), "rapport");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "_clientsForRapportClient_unsafe:", v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = MEMORY[0x24BDAC760];
  v16[0] = MEMORY[0x24BDAC760];
  v16[1] = 3221225472;
  v16[2] = __62__COCompanionLinkClientFactory_invalidateCompanionLinkClient___block_invoke_2;
  v16[3] = &unk_24D4B0C58;
  v17 = *(id *)(a1 + 32);
  objc_msgSend(v3, "indexesOfObjectsPassingTest:", v16);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectsAtIndexes:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = objc_msgSend(v6, "count");
  COCoreLogForCategory(19);
  v8 = objc_claimAutoreleasedReturnValue();
  v9 = os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT);
  if (v7)
  {
    if (v9)
    {
      v10 = *(_QWORD *)(a1 + 40);
      *(_DWORD *)buf = 134218498;
      v19 = v10;
      v20 = 2048;
      v21 = v2;
      v22 = 2112;
      v23 = v2;
      _os_log_impl(&dword_215E92000, v8, OS_LOG_TYPE_DEFAULT, "%p already invalidated %p (%@)", buf, 0x20u);
    }

    v11 = *(void **)(a1 + 32);
    v12 = *(NSObject **)(*(_QWORD *)(a1 + 40) + 24);
    v14[0] = v4;
    v14[1] = 3221225472;
    v14[2] = __62__COCompanionLinkClientFactory_invalidateCompanionLinkClient___block_invoke_21;
    v14[3] = &unk_24D4B0C80;
    v15 = v11;
    dispatch_async(v12, v14);

  }
  else
  {
    if (v9)
    {
      v13 = *(_QWORD *)(a1 + 40);
      *(_DWORD *)buf = 134218498;
      v19 = v13;
      v20 = 2048;
      v21 = v2;
      v22 = 2112;
      v23 = v2;
      _os_log_impl(&dword_215E92000, v8, OS_LOG_TYPE_DEFAULT, "%p invalidating %p (%@)", buf, 0x20u);
    }

    objc_msgSend(v2, "co_SetCompanionLinkClientFlags:", objc_msgSend(v2, "co_CompanionLinkClientFlags") | 8);
    objc_msgSend(v2, "invalidate");
  }

}

uint64_t __62__COCompanionLinkClientFactory_invalidateCompanionLinkClient___block_invoke_2(uint64_t a1, void *a2)
{
  if (*(void **)(a1 + 32) == a2)
    return 0;
  else
    return objc_msgSend(a2, "isInvalidated") ^ 1;
}

uint64_t __62__COCompanionLinkClientFactory_invalidateCompanionLinkClient___block_invoke_21(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "didInvalidate");
}

- (void)removeClient:(id)a3
{
  id v4;
  id v5;
  _QWORD v6[5];
  id v7;

  v4 = a3;
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __45__COCompanionLinkClientFactory_removeClient___block_invoke;
  v6[3] = &unk_24D4B0858;
  v6[4] = self;
  v7 = v4;
  v5 = v4;
  -[COCompanionLinkClientFactory _withLock:](self, "_withLock:", v6);

}

void __45__COCompanionLinkClientFactory_removeClient___block_invoke(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  int v10;
  uint64_t v11;
  __int16 v12;
  uint64_t v13;
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  COCoreLogForCategory(19);
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    v3 = *(_QWORD *)(a1 + 32);
    v4 = *(_QWORD *)(a1 + 40);
    v10 = 134218240;
    v11 = v3;
    v12 = 2048;
    v13 = v4;
    _os_log_impl(&dword_215E92000, v2, OS_LOG_TYPE_DEFAULT, "%p removing knowledge of %p", (uint8_t *)&v10, 0x16u);
  }

  objc_msgSend(*(id *)(a1 + 32), "locals");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "removeObject:", *(_QWORD *)(a1 + 40));

  objc_msgSend(*(id *)(a1 + 40), "destinationDevice");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "idsDeviceIdentifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    objc_msgSend(*(id *)(a1 + 32), "clients");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "objectForKey:", v7);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "removeObject:", *(_QWORD *)(a1 + 40));
    if (!objc_msgSend(v9, "count"))
      objc_msgSend(v8, "removeObjectForKey:", v7);

  }
}

- (OS_dispatch_queue)dispatchQueue
{
  return self->_dispatchQueue;
}

- (NSHashTable)locals
{
  return self->_locals;
}

- (void)setLocals:(id)a3
{
  objc_storeStrong((id *)&self->_locals, a3);
}

- (NSMapTable)clients
{
  return self->_clients;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_clients, 0);
  objc_storeStrong((id *)&self->_locals, 0);
  objc_storeStrong((id *)&self->_dispatchQueue, 0);
  objc_storeStrong((id *)&self->_activeDevices, 0);
}

- (void)didFindDevice:(os_log_t)log .cold.1(uint64_t a1, uint64_t a2, os_log_t log)
{
  int v3;
  uint64_t v4;
  __int16 v5;
  uint64_t v6;
  uint64_t v7;

  v7 = *MEMORY[0x24BDAC8D0];
  v3 = 134218242;
  v4 = a1;
  v5 = 2112;
  v6 = a2;
  _os_log_error_impl(&dword_215E92000, log, OS_LOG_TYPE_ERROR, "%p found device %@ which doesn't have an IDS identifier. Deferring informing locals about this device", (uint8_t *)&v3, 0x16u);
}

void __53__COCompanionLinkClientFactory_didUpdateLocalDevice___block_invoke_cold_1(uint64_t a1, NSObject *a2)
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
  v3 = *(_QWORD *)(a1 + 40);
  v4 = 134218242;
  v5 = v2;
  v6 = 2112;
  v7 = v3;
  _os_log_debug_impl(&dword_215E92000, a2, OS_LOG_TYPE_DEBUG, "%p informing locals of updated %@", (uint8_t *)&v4, 0x16u);
}

@end
