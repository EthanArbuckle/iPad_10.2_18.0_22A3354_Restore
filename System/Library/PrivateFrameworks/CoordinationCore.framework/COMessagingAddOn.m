@implementation COMessagingAddOn

- (COMessagingAddOn)init
{
  COMessagingAddOn *v2;
  COMessagingAddOn *v3;
  uint64_t v4;
  NSMutableArray *queuedIncomingRequests;
  dispatch_source_t v6;
  OS_dispatch_source *timer;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)COMessagingAddOn;
  v2 = -[COMeshAddOn init](&v9, sel_init);
  v3 = v2;
  if (v2)
  {
    v2->_lock._os_unfair_lock_opaque = 0;
    objc_msgSend(MEMORY[0x24BDBCEB8], "array");
    v4 = objc_claimAutoreleasedReturnValue();
    queuedIncomingRequests = v3->_queuedIncomingRequests;
    v3->_queuedIncomingRequests = (NSMutableArray *)v4;

    v6 = dispatch_source_create(MEMORY[0x24BDACA18], 0, 0, 0);
    timer = v3->_timer;
    v3->_timer = (OS_dispatch_source *)v6;

    -[COMessagingAddOn _configureTimer](v3, "_configureTimer");
  }
  return v3;
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

- (COMessagingAddOnDelegate)delegate
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
  v8 = __Block_byref_object_copy__30;
  v9 = __Block_byref_object_dispose__30;
  v10 = 0;
  v4[0] = MEMORY[0x24BDAC760];
  v4[1] = 3221225472;
  v4[2] = __28__COMessagingAddOn_delegate__block_invoke;
  v4[3] = &unk_24D4B07E0;
  v4[4] = self;
  v4[5] = &v5;
  -[COMessagingAddOn _withLock:](self, "_withLock:", v4);
  v2 = (id)v6[5];
  _Block_object_dispose(&v5, 8);

  return (COMessagingAddOnDelegate *)v2;
}

void __28__COMessagingAddOn_delegate__block_invoke(uint64_t a1)
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
  COMessagingAddOn *v8;

  v4 = a3;
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __32__COMessagingAddOn_setDelegate___block_invoke;
  v6[3] = &unk_24D4B0858;
  v7 = v4;
  v8 = self;
  v5 = v4;
  -[COMessagingAddOn _withLock:](self, "_withLock:", v6);

}

void __32__COMessagingAddOn_setDelegate___block_invoke(uint64_t a1)
{
  void *v2;
  id WeakRetained;

  v2 = *(void **)(a1 + 32);
  WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 40) + 32));
  LOBYTE(v2) = objc_msgSend(v2, "isEqual:", WeakRetained);

  if ((v2 & 1) == 0)
    objc_storeWeak((id *)(*(_QWORD *)(a1 + 40) + 32), *(id *)(a1 + 32));
}

- (void)sendRequest:(id)a3 members:(id)a4 withCompletionHandler:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  uint64_t i;
  uint64_t v16;
  void *v17;
  void *v18;
  int v19;
  id v20;
  void *v21;
  void *v22;
  void *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t j;
  void *v28;
  void *v29;
  void *v30;
  int v31;
  id v32;
  uint64_t v33;
  void *v34;
  COMessagingAddOn *v35;
  id v36;
  id v37;
  uint64_t v38;
  id obj;
  uint64_t v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  _BYTE v49[128];
  _BYTE v50[128];
  uint64_t v51;

  v51 = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  -[COMeshAddOn meshController](self, "meshController");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = v11;
  if (!v9)
  {
    objc_msgSend(v11, "sendRequest:withCompletionHandler:", v8, v10);

    goto LABEL_28;
  }
  objc_msgSend(v11, "nodeForMe");
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  v47 = 0u;
  v48 = 0u;
  v45 = 0u;
  v46 = 0u;
  v32 = v9;
  obj = v9;
  v40 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v45, v50, 16);
  if (!v40)
    goto LABEL_26;
  v14 = *(_QWORD *)v46;
  v37 = v8;
  v38 = *MEMORY[0x24BE19C88];
  v35 = self;
  v36 = v10;
  v33 = *(_QWORD *)v46;
  v34 = v13;
  do
  {
    for (i = 0; i != v40; ++i)
    {
      if (*(_QWORD *)v46 != v14)
        objc_enumerationMutation(obj);
      v16 = *(_QWORD *)(*((_QWORD *)&v45 + 1) + 8 * i);
      objc_msgSend(v13, "memberSnapshot");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "member");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = objc_msgSend(v18, "isEqualToMember:", v16);

      if (v19)
      {
        v20 = v13;
        if (v20)
          goto LABEL_9;
      }
      else
      {
        v43 = 0u;
        v44 = 0u;
        v41 = 0u;
        v42 = 0u;
        -[COMeshAddOn meshController](self, "meshController");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v22, "nodes");
        v23 = (void *)objc_claimAutoreleasedReturnValue();

        v24 = objc_msgSend(v23, "countByEnumeratingWithState:objects:count:", &v41, v49, 16);
        if (v24)
        {
          v25 = v24;
          v26 = *(_QWORD *)v42;
          while (2)
          {
            for (j = 0; j != v25; ++j)
            {
              if (*(_QWORD *)v42 != v26)
                objc_enumerationMutation(v23);
              v28 = *(void **)(*((_QWORD *)&v41 + 1) + 8 * j);
              objc_msgSend(v28, "memberSnapshot");
              v29 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v29, "member");
              v30 = (void *)objc_claimAutoreleasedReturnValue();
              v31 = objc_msgSend(v30, "isEqualToMember:", v16);

              if (v31)
              {
                v20 = v28;
                goto LABEL_20;
              }
            }
            v25 = objc_msgSend(v23, "countByEnumeratingWithState:objects:count:", &v41, v49, 16);
            if (v25)
              continue;
            break;
          }
          v20 = 0;
LABEL_20:
          v10 = v36;
          v8 = v37;
          v13 = v34;
          self = v35;
          v14 = v33;
        }
        else
        {
          v20 = 0;
        }

        if (v20)
        {
LABEL_9:
          -[COMeshAddOn meshController](self, "meshController");
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v21, "sendRequest:toPeer:withCompletionHandler:", v8, v20, v10);
          goto LABEL_24;
        }
      }
      objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", v38, -1111, 0);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      (*((void (**)(id, id, _QWORD, _QWORD, void *))v10 + 2))(v10, v8, 0, 0, v21);
LABEL_24:

    }
    v40 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v45, v50, 16);
  }
  while (v40);
LABEL_26:

  v9 = v32;
LABEL_28:

}

- (void)broadcastRequest:(id)a3 recipientsCallback:(id)a4 completionHandler:(id)a5
{
  id v8;
  id v9;
  id v10;
  id v11;

  v8 = a5;
  v9 = a4;
  v10 = a3;
  -[COMeshAddOn meshController](self, "meshController");
  v11 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "broadcastRequest:includingSelf:recipientsCallback:completionHandler:", v10, 1, v9, v8);

}

- (void)didAddToMeshController:(id)a3
{
  id v4;
  _QWORD v5[4];
  id v6;
  id location;
  objc_super v8;

  v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)COMessagingAddOn;
  -[COMeshAddOn didAddToMeshController:](&v8, sel_didAddToMeshController_, v4);
  objc_initWeak(&location, self);
  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 3221225472;
  v5[2] = __43__COMessagingAddOn_didAddToMeshController___block_invoke;
  v5[3] = &unk_24D4B1170;
  objc_copyWeak(&v6, &location);
  objc_msgSend(v4, "registerHandler:forRequestClass:", v5, objc_opt_class());
  objc_destroyWeak(&v6);
  objc_destroyWeak(&location);

}

void __43__COMessagingAddOn_didAddToMeshController___block_invoke(uint64_t a1, void *a2, void *a3)
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
    objc_msgSend(WeakRetained, "_handleRequest:callback:", v8, v5);

}

- (void)willRemoveFromMeshController:(id)a3
{
  id v4;
  NSObject *v5;
  objc_super v6;

  v4 = a3;
  objc_msgSend(v4, "deregisterHandlerForRequestClass:", objc_opt_class());
  -[COMessagingAddOn timer](self, "timer");
  v5 = objc_claimAutoreleasedReturnValue();
  dispatch_source_set_timer(v5, 0xFFFFFFFFFFFFFFFFLL, 0xFFFFFFFFFFFFFFFFLL, 0x3B9ACA00uLL);

  -[COMessagingAddOn setTimerEnabled:](self, "setTimerEnabled:", 0);
  v6.receiver = self;
  v6.super_class = (Class)COMessagingAddOn;
  -[COMeshAddOn willRemoveFromMeshController:](&v6, sel_willRemoveFromMeshController_, v4);

}

- (void)didChangeNodesForMeshController:(id)a3
{
  void *v4;
  void *v5;
  uint64_t v6;
  __int128 v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  void *v12;
  void *v13;
  NSObject *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  __int128 v20;
  uint64_t v21;
  void *v22;
  COMessagingAddOn *v23;
  id obj;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  objc_super v29;
  uint8_t buf[4];
  COMessagingAddOn *v31;
  __int16 v32;
  void *v33;
  _BYTE v34[128];
  uint64_t v35;

  v35 = *MEMORY[0x24BDAC8D0];
  v29.receiver = self;
  v29.super_class = (Class)COMessagingAddOn;
  -[COMeshAddOn didChangeNodesForMeshController:](&v29, sel_didChangeNodesForMeshController_, a3);
  -[COMeshAddOn meshController](self, "meshController");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "nodes");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = self;
  v25 = 0u;
  v26 = 0u;
  v27 = 0u;
  v28 = 0u;
  -[COMessagingAddOn queuedIncomingRequests](self, "queuedIncomingRequests");
  obj = (id)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v25, v34, 16);
  if (v6)
  {
    v8 = v6;
    v9 = *(_QWORD *)v26;
    *(_QWORD *)&v7 = 134218242;
    v20 = v7;
    v21 = *(_QWORD *)v26;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v26 != v9)
          objc_enumerationMutation(obj);
        v11 = *(void **)(*((_QWORD *)&v25 + 1) + 8 * i);
        objc_msgSend(v11, "senderNode", v20);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v5, "containsObject:", v12))
        {
          objc_msgSend(v12, "memberSnapshot");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          if (v13)
          {
            COCoreLogForCategory(10);
            v14 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
            {
              objc_msgSend(v11, "request");
              v15 = (void *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = v20;
              v31 = v23;
              v32 = 2112;
              v33 = v15;
              _os_log_impl(&dword_215E92000, v14, OS_LOG_TYPE_DEFAULT, "%p Add-on found a snapshot for queued request %@", buf, 0x16u);

            }
            -[COMessagingAddOn delegate](v23, "delegate");
            v16 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v11, "request");
            v17 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v11, "callback");
            v18 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v16, "addOn:receivedRequest:callback:", v23, v17, v18);

            objc_msgSend(v22, "addObject:", v11);
            v9 = v21;
          }

        }
      }
      v8 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v25, v34, 16);
    }
    while (v8);
  }

  -[COMessagingAddOn queuedIncomingRequests](v23, "queuedIncomingRequests");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "removeObjectsInArray:", v22);

}

- (void)_handleRequest:(id)a3 callback:(id)a4
{
  id v6;
  NSObject *v7;
  void *v8;
  void *v9;
  COMessagingQueuedIncomingRequest *v10;
  void *v11;
  int v12;
  COMessagingAddOn *v13;
  __int16 v14;
  id v15;
  __int16 v16;
  void *v17;
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  objc_msgSend(v6, "sender");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "memberSnapshot");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (v9)
  {
    -[COMessagingAddOn delegate](self, "delegate");
    v10 = (COMessagingQueuedIncomingRequest *)objc_claimAutoreleasedReturnValue();
    -[COMessagingQueuedIncomingRequest addOn:receivedRequest:callback:](v10, "addOn:receivedRequest:callback:", self, v6, v7);
  }
  else
  {
    v10 = -[COMessagingQueuedIncomingRequest initWithRequest:callback:]([COMessagingQueuedIncomingRequest alloc], "initWithRequest:callback:", v6, v7);

    -[COMessagingAddOn queuedIncomingRequests](self, "queuedIncomingRequests");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "addObject:", v10);

    -[COMessagingAddOn _timerRequestAdded:](self, "_timerRequestAdded:", v10);
    COCoreLogForCategory(10);
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      v12 = 134218498;
      v13 = self;
      v14 = 2112;
      v15 = v6;
      v16 = 2112;
      v17 = v8;
      _os_log_impl(&dword_215E92000, v7, OS_LOG_TYPE_DEFAULT, "%p Add-on received a request %@ from node %@ with missing snapshot. Enqueuing request", (uint8_t *)&v12, 0x20u);
    }
  }

}

- (void)_configureTimer
{
  NSObject *v3;
  NSObject *v4;
  NSObject *v5;
  uint64_t v6;
  uint64_t v7;
  void (*v8)(uint64_t);
  void *v9;
  id v10;
  id location;

  -[COMessagingAddOn timer](self, "timer");
  v3 = objc_claimAutoreleasedReturnValue();
  dispatch_source_set_timer(v3, 0xFFFFFFFFFFFFFFFFLL, 0xFFFFFFFFFFFFFFFFLL, 0x3B9ACA00uLL);

  -[COMessagingAddOn setTimerEnabled:](self, "setTimerEnabled:", 0);
  objc_initWeak(&location, self);
  -[COMessagingAddOn timer](self, "timer");
  v4 = objc_claimAutoreleasedReturnValue();
  v6 = MEMORY[0x24BDAC760];
  v7 = 3221225472;
  v8 = __35__COMessagingAddOn__configureTimer__block_invoke;
  v9 = &unk_24D4B0CD8;
  objc_copyWeak(&v10, &location);
  dispatch_source_set_event_handler(v4, &v6);

  -[COMessagingAddOn timer](self, "timer", v6, v7, v8, v9);
  v5 = objc_claimAutoreleasedReturnValue();
  dispatch_activate(v5);

  objc_destroyWeak(&v10);
  objc_destroyWeak(&location);
}

void __35__COMessagingAddOn__configureTimer__block_invoke(uint64_t a1)
{
  id WeakRetained;
  void *v2;
  NSObject *v3;
  _QWORD block[5];

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v2 = WeakRetained;
  if (WeakRetained)
  {
    objc_msgSend(WeakRetained, "meshControllerQueue");
    v3 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __35__COMessagingAddOn__configureTimer__block_invoke_2;
    block[3] = &unk_24D4B0C80;
    block[4] = v2;
    dispatch_async(v3, block);

  }
}

uint64_t __35__COMessagingAddOn__configureTimer__block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_timerFired");
}

- (void)_timerFired
{
  uint64_t v3;
  int v4;
  uint64_t v5;
  __int16 v6;
  uint64_t v7;
  uint64_t v8;

  v8 = *MEMORY[0x24BDAC8D0];
  v3 = *(_QWORD *)(*(_QWORD *)a2 + 24);
  v4 = 134218240;
  v5 = a1;
  v6 = 2048;
  v7 = v3;
  OUTLINED_FUNCTION_9(&dword_215E92000, a3, (uint64_t)a3, "%p cleanup timer reconfiguring to %llu", (uint8_t *)&v4);
}

void __31__COMessagingAddOn__timerFired__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  NSObject *v9;
  void *v10;
  void (**v11)(_QWORD, _QWORD, _QWORD);

  v3 = a2;
  v4 = objc_msgSend(v3, "remainingTimeUsingCurrentTime:", *(_QWORD *)(a1 + 56));
  if (v4 < 1)
  {
    COCoreLogForCategory(10);
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      __31__COMessagingAddOn__timerFired__block_invoke_cold_1(a1, v3, v9);

    objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", CFSTR("COMeshNodeErrorDomain"), -4000, 0);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "callback");
    v11 = (void (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
    ((void (**)(_QWORD, _QWORD, void *))v11)[2](v11, 0, v10);

    objc_msgSend(*(id *)(a1 + 40), "addObject:", v3);
  }
  else
  {
    v5 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
    v6 = *(_QWORD *)(v5 + 24);
    if (v6 >= v4)
      v7 = v4;
    else
      v7 = *(_QWORD *)(v5 + 24);
    if (v6)
      v8 = v7;
    else
      v8 = v4;
    *(_QWORD *)(v5 + 24) = v8;
  }

}

- (void)_timerRequestAdded:(id)a3
{
  NSObject *v4;
  uint64_t v5;
  NSObject *v6;
  dispatch_time_t v7;

  if (!-[COMessagingAddOn isTimerEnabled](self, "isTimerEnabled", a3))
  {
    COCoreLogForCategory(10);
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
      -[COMessagingAddOn _timerRequestAdded:].cold.1((uint64_t)self, v4, v5);

    -[COMessagingAddOn setTimerEnabled:](self, "setTimerEnabled:", 1);
    -[COMessagingAddOn timer](self, "timer");
    v6 = objc_claimAutoreleasedReturnValue();
    v7 = dispatch_time(0, 300000000000);
    dispatch_source_set_timer(v6, v7, 0xFFFFFFFFFFFFFFFFLL, 0x3B9ACA00uLL);

  }
}

- (OS_dispatch_source)timer
{
  return self->_timer;
}

- (BOOL)isTimerEnabled
{
  return self->_timerEnabled;
}

- (void)setTimerEnabled:(BOOL)a3
{
  self->_timerEnabled = a3;
}

- (NSMutableArray)queuedIncomingRequests
{
  return self->_queuedIncomingRequests;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_queuedIncomingRequests, 0);
  objc_storeStrong((id *)&self->_timer, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

void __31__COMessagingAddOn__timerFired__block_invoke_cold_1(uint64_t a1, void *a2, NSObject *a3)
{
  uint64_t v4;
  void *v5;
  int v6;
  uint64_t v7;
  __int16 v8;
  void *v9;
  uint64_t v10;

  v10 = *MEMORY[0x24BDAC8D0];
  v4 = *(_QWORD *)(a1 + 32);
  objc_msgSend(a2, "request");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = 134218242;
  v7 = v4;
  v8 = 2112;
  v9 = v5;
  _os_log_error_impl(&dword_215E92000, a3, OS_LOG_TYPE_ERROR, "%p enqueued request %@ expired before being passed to a node", (uint8_t *)&v6, 0x16u);

}

- (void)_timerRequestAdded:(uint64_t)a3 .cold.1(uint64_t a1, NSObject *a2, uint64_t a3)
{
  int v3;
  uint64_t v4;
  __int16 v5;
  uint64_t v6;
  uint64_t v7;

  v7 = *MEMORY[0x24BDAC8D0];
  v3 = 134218240;
  v4 = a1;
  v5 = 2048;
  v6 = 0x4072C00000000000;
  OUTLINED_FUNCTION_9(&dword_215E92000, a2, a3, "%p enabling cleanup timer for %f seconds.", (uint8_t *)&v3);
}

@end
