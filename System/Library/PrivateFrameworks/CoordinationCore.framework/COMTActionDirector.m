@implementation COMTActionDirector

- (COMessageChannel)messageChannel
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
  v8 = __Block_byref_object_copy_;
  v9 = __Block_byref_object_dispose_;
  v10 = 0;
  v4[0] = MEMORY[0x24BDAC760];
  v4[1] = 3221225472;
  v4[2] = __36__COMTActionDirector_messageChannel__block_invoke;
  v4[3] = &unk_24D4B07E0;
  v4[4] = self;
  v4[5] = &v5;
  -[COMTActionDirector _withLock:](self, "_withLock:", v4);
  v2 = (id)v6[5];
  _Block_object_dispose(&v5, 8);

  return (COMessageChannel *)v2;
}

void __36__COMTActionDirector_messageChannel__block_invoke(uint64_t a1)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), *(id *)(*(_QWORD *)(a1 + 32) + 16));
}

- (BOOL)activated
{
  char v2;
  _QWORD v4[6];
  uint64_t v5;
  uint64_t *v6;
  uint64_t v7;
  char v8;

  v5 = 0;
  v6 = &v5;
  v7 = 0x2020000000;
  v8 = 0;
  v4[0] = MEMORY[0x24BDAC760];
  v4[1] = 3221225472;
  v4[2] = __31__COMTActionDirector_activated__block_invoke;
  v4[3] = &unk_24D4B07E0;
  v4[4] = self;
  v4[5] = &v5;
  -[COMTActionDirector _withLock:](self, "_withLock:", v4);
  v2 = *((_BYTE *)v6 + 24);
  _Block_object_dispose(&v5, 8);
  return v2;
}

uint64_t __31__COMTActionDirector_activated__block_invoke(uint64_t result)
{
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(result + 40) + 8) + 24) = *(_BYTE *)(*(_QWORD *)(result + 32) + 12);
  return result;
}

- (unint64_t)chunkSize
{
  return 6290432;
}

- (void)dealloc
{
  void *v3;
  void *v4;
  objc_super v5;

  -[COMTActionDirector monitor](self, "monitor");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[COMTActionDirector monitorObserver](self, "monitorObserver");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserverForSnapshots:", v4);

  v5.receiver = self;
  v5.super_class = (Class)COMTActionDirector;
  -[COMTActionDirector dealloc](&v5, sel_dealloc);
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

- (BOOL)_activate
{
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  COClusterRoleMonitor *v7;
  COClusterRoleMonitor *monitor;
  NSObject *v9;
  NSObject *monitorObserver;
  void *v11;
  COMessageChannel *messageChannel;
  _QWORD v14[4];
  id v15;
  _QWORD v16[4];
  id v17;
  _QWORD v18[4];
  id v19;
  id location;

  -[COMTActionDirector cluster](self, "cluster");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[COMTActionDirector provider](self, "provider");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_initWeak(&location, self);
  v5 = MEMORY[0x24BDAC760];
  v18[0] = MEMORY[0x24BDAC760];
  v18[1] = 3221225472;
  v18[2] = __31__COMTActionDirector__activate__block_invoke;
  v18[3] = &unk_24D4B0808;
  objc_copyWeak(&v19, &location);
  v6 = (void *)MEMORY[0x2199F3D40](v18);
  objc_msgSend(v4, "clusterRoleMonitorWithCluster:", v3);
  v7 = (COClusterRoleMonitor *)objc_claimAutoreleasedReturnValue();
  monitor = self->_monitor;
  self->_monitor = v7;

  -[COClusterRoleMonitor addObserverForSnapshotsToDispatchQueue:block:](self->_monitor, "addObserverForSnapshotsToDispatchQueue:block:", self->_dispatchQueue, v6);
  v9 = objc_claimAutoreleasedReturnValue();
  monitorObserver = self->_monitorObserver;
  self->_monitorObserver = v9;

  objc_msgSend(v4, "messageChannelWithTopic:cluster:", CFSTR("v1"), v3);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v16[0] = v5;
  v16[1] = 3221225472;
  v16[2] = __31__COMTActionDirector__activate__block_invoke_2;
  v16[3] = &unk_24D4B0830;
  objc_copyWeak(&v17, &location);
  objc_msgSend(v11, "registerHandler:forRequestClass:", v16, objc_opt_class());
  v14[0] = v5;
  v14[1] = 3221225472;
  v14[2] = __31__COMTActionDirector__activate__block_invoke_3;
  v14[3] = &unk_24D4B0880;
  objc_copyWeak(&v15, &location);
  objc_msgSend(v11, "activateWithCompletion:", v14);
  messageChannel = self->_messageChannel;
  self->_messageChannel = (COMessageChannel *)v11;

  objc_destroyWeak(&v15);
  objc_destroyWeak(&v17);
  objc_destroyWeak(&v19);

  objc_destroyWeak(&location);
  return 1;
}

void __31__COMTActionDirector__activate__block_invoke(uint64_t a1, void *a2)
{
  id WeakRetained;
  void *v4;
  id v5;

  v5 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v4 = WeakRetained;
  if (WeakRetained)
    objc_msgSend(WeakRetained, "handleMembersChanged:", v5);

}

void __31__COMTActionDirector__activate__block_invoke_2(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7;
  id v8;
  id WeakRetained;
  void *v10;
  id v11;

  v11 = a2;
  v7 = a3;
  v8 = a4;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    objc_msgSend(v7, "member");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(WeakRetained, "handlePerformActionRequest:from:callback:", v11, v10, v8);

  }
}

void __31__COMTActionDirector__activate__block_invoke_3(uint64_t a1, void *a2)
{
  id v3;
  id WeakRetained;
  _QWORD v5[4];
  id v6;
  id v7;

  v3 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v5[0] = MEMORY[0x24BDAC760];
    v5[1] = 3221225472;
    v5[2] = __31__COMTActionDirector__activate__block_invoke_4;
    v5[3] = &unk_24D4B0858;
    v6 = v3;
    v7 = WeakRetained;
    objc_msgSend(WeakRetained, "_withLock:", v5);

  }
}

void __31__COMTActionDirector__activate__block_invoke_4(uint64_t a1)
{
  _QWORD *v1;
  uint64_t v2;
  id *v3;
  void *v4;
  NSObject *v5;
  void *v6;
  id v7;
  void *v8;
  id v9;
  int v10;
  id v11;
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  v1 = (_QWORD *)(a1 + 32);
  v3 = (id *)(a1 + 40);
  v2 = *(_QWORD *)(a1 + 40);
  if (*(_QWORD *)(a1 + 32))
  {
    v4 = *(void **)(v2 + 16);
    *(_QWORD *)(v2 + 16) = 0;

    COCoreLogForCategory(20);
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      __31__COMTActionDirector__activate__block_invoke_4_cold_1(v3, v1, v5);
  }
  else
  {
    *(_BYTE *)(v2 + 12) = 1;
    objc_msgSend(*v3, "members");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (v6)
    {
      v7 = *v3;
      objc_msgSend(*v3, "members");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "_notifyHandlerOfSnapshotChanges_unsafe:", v8);

    }
    COCoreLogForCategory(20);
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      v9 = *v3;
      v10 = 138543362;
      v11 = v9;
      _os_log_impl(&dword_215E92000, v5, OS_LOG_TYPE_DEFAULT, "%{public}@ message channel activation succeeded", (uint8_t *)&v10, 0xCu);
    }
  }

}

- (id)_requestHandlerForTypedAction:(id)a3
{
  id v4;
  id v5;
  id v6;
  _QWORD v8[4];
  id v9;
  COMTActionDirector *v10;
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
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __52__COMTActionDirector__requestHandlerForTypedAction___block_invoke;
  v8[3] = &unk_24D4B08A8;
  v5 = v4;
  v9 = v5;
  v10 = self;
  v11 = &v12;
  -[COMTActionDirector _withLock:](self, "_withLock:", v8);
  v6 = (id)v13[5];

  _Block_object_dispose(&v12, 8);
  return v6;
}

void __52__COMTActionDirector__requestHandlerForTypedAction___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  void *v8;
  void *v9;
  int v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(*(id *)(a1 + 32), "targetType");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  objc_msgSend(*(id *)(a1 + 40), "actionHandler", 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v12;
    while (2)
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v12 != v6)
          objc_enumerationMutation(v3);
        v8 = *(void **)(*((_QWORD *)&v11 + 1) + 8 * i);
        objc_msgSend(v8, "targetType");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        v10 = objc_msgSend(v9, "isEqualToString:", v2);

        if (v10)
        {
          objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), v8);
          goto LABEL_11;
        }
      }
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
      if (v5)
        continue;
      break;
    }
  }
LABEL_11:

}

- (id)_requestHandlerForAction:(id)a3
{
  id v4;
  id v5;
  id v6;
  _QWORD v8[4];
  id v9;
  COMTActionDirector *v10;
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
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __47__COMTActionDirector__requestHandlerForAction___block_invoke;
  v8[3] = &unk_24D4B08A8;
  v5 = v4;
  v9 = v5;
  v10 = self;
  v11 = &v12;
  -[COMTActionDirector _withLock:](self, "_withLock:", v8);
  v6 = (id)v13[5];

  _Block_object_dispose(&v12, 8);
  return v6;
}

void __47__COMTActionDirector__requestHandlerForAction___block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  void *v8;
  void *v9;
  int v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  v2 = objc_opt_class();
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  objc_msgSend(*(id *)(a1 + 40), "actionHandler", 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v12;
    while (2)
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v12 != v6)
          objc_enumerationMutation(v3);
        v8 = *(void **)(*((_QWORD *)&v11 + 1) + 8 * i);
        objc_msgSend(v8, "actions");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        v10 = objc_msgSend(v9, "containsObject:", v2);

        if (v10)
        {
          objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), v8);
          goto LABEL_11;
        }
      }
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
      if (v5)
        continue;
      break;
    }
  }
LABEL_11:

}

- (void)_notifyHandlerOfSnapshotChanges_unsafe:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  void *v11;
  NSObject *v12;
  _QWORD block[4];
  id v14;
  COMTActionDirector *v15;
  id v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  os_unfair_lock_assert_owner(&self->_lock);
  v19 = 0u;
  v20 = 0u;
  v17 = 0u;
  v18 = 0u;
  -[COMTActionDirector actionHandler](self, "actionHandler");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v18;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v18 != v8)
          objc_enumerationMutation(v5);
        v10 = *(void **)(*((_QWORD *)&v17 + 1) + 8 * i);
        objc_msgSend(v10, "delegate");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        if (v11 && (objc_opt_respondsToSelector() & 1) != 0)
        {
          objc_msgSend(v10, "delegateQueue");
          v12 = objc_claimAutoreleasedReturnValue();
          block[0] = MEMORY[0x24BDAC760];
          block[1] = 3221225472;
          block[2] = __61__COMTActionDirector__notifyHandlerOfSnapshotChanges_unsafe___block_invoke;
          block[3] = &unk_24D4B08D0;
          v14 = v11;
          v15 = self;
          v16 = v4;
          dispatch_async(v12, block);

        }
      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
    }
    while (v7);
  }

}

uint64_t __61__COMTActionDirector__notifyHandlerOfSnapshotChanges_unsafe___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "director:membersChanged:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
}

- (void)handleMembersChanged:(id)a3
{
  id v4;
  id v5;
  _QWORD v6[5];
  id v7;

  v4 = a3;
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __43__COMTActionDirector_handleMembersChanged___block_invoke;
  v6[3] = &unk_24D4B0858;
  v6[4] = self;
  v7 = v4;
  v5 = v4;
  -[COMTActionDirector _withLock:](self, "_withLock:", v6);

}

void __43__COMTActionDirector_handleMembersChanged___block_invoke(uint64_t a1)
{
  void *v2;
  _BYTE *v3;
  id v4;

  objc_msgSend(*(id *)(a1 + 32), "members");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (id)objc_msgSend(v2, "mutableCopy");

  objc_msgSend(v4, "minusSet:", *(_QWORD *)(a1 + 40));
  objc_msgSend(*(id *)(a1 + 32), "setMembers:", *(_QWORD *)(a1 + 40));
  v3 = *(_BYTE **)(a1 + 32);
  if (v3[12])
    objc_msgSend(v3, "_notifyHandlerOfSnapshotChanges_unsafe:", *(_QWORD *)(a1 + 40));

}

- (void)handlePerformActionRequest:(id)a3 from:(id)a4 callback:(id)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t i;
  void *v14;
  id v15;
  void *v16;
  id v17;
  id v18;
  void (**v19)(_QWORD, _QWORD, _QWORD);
  void *v20;
  void *v21;
  id v22;
  void *v23;
  NSObject *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  id v29;
  void *v30;
  id v31;
  id v32;
  id v33;
  void *v34;
  id v35;
  void *v36;
  id obj;
  uint64_t v38;
  id v39;
  uint64_t v40;
  _QWORD v41[4];
  id v42;
  id v43;
  _QWORD block[6];
  id v45;
  id v46;
  id v47;
  void (**v48)(_QWORD, _QWORD, _QWORD);
  _QWORD v49[4];
  id v50;
  id v51;
  id v52;
  COMTActionDirector *v53;
  id v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  _BYTE v59[128];
  uint64_t v60;

  v60 = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v35 = a4;
  v33 = a5;
  v9 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
  v39 = objc_alloc_init(MEMORY[0x24BDBCED8]);
  -[COMTActionDirector dispatchQueue](self, "dispatchQueue");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v55 = 0u;
  v56 = 0u;
  v57 = 0u;
  v58 = 0u;
  v36 = v8;
  v11 = v8;
  v12 = v9;
  objc_msgSend(v11, "actions");
  obj = (id)objc_claimAutoreleasedReturnValue();
  v40 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v55, v59, 16);
  if (v40)
  {
    v38 = *(_QWORD *)v56;
    v34 = v10;
    do
    {
      for (i = 0; i != v40; ++i)
      {
        if (*(_QWORD *)v56 != v38)
          objc_enumerationMutation(obj);
        v14 = *(void **)(*((_QWORD *)&v55 + 1) + 8 * i);
        v15 = objc_alloc_init(MEMORY[0x24BE6B608]);
        objc_msgSend(v12, "addObject:", v15);
        objc_msgSend(v14, "actionIdentifier");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        v49[0] = MEMORY[0x24BDAC760];
        v49[1] = 3221225472;
        v49[2] = __63__COMTActionDirector_handlePerformActionRequest_from_callback___block_invoke;
        v49[3] = &unk_24D4B0920;
        v50 = v10;
        v51 = v39;
        v17 = v16;
        v52 = v17;
        v53 = self;
        v18 = v15;
        v54 = v18;
        v19 = (void (**)(_QWORD, _QWORD, _QWORD))MEMORY[0x2199F3D40](v49);
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
          -[COMTActionDirector _requestHandlerForTypedAction:](self, "_requestHandlerForTypedAction:", v14);
        else
          -[COMTActionDirector _requestHandlerForAction:](self, "_requestHandlerForAction:", v14);
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        v21 = v20;
        if (v20)
        {
          objc_msgSend(v20, "delegate");
          v22 = (id)objc_claimAutoreleasedReturnValue();
          if (v22)
          {
            objc_msgSend(v21, "delegateQueue");
            v23 = v12;
            v24 = objc_claimAutoreleasedReturnValue();
            block[0] = MEMORY[0x24BDAC760];
            block[1] = 3221225472;
            block[2] = __63__COMTActionDirector_handlePerformActionRequest_from_callback___block_invoke_103;
            block[3] = &unk_24D4B0948;
            block[4] = self;
            block[5] = v14;
            v45 = v36;
            v22 = v22;
            v46 = v22;
            v47 = v35;
            v48 = v19;
            dispatch_async(v24, block);

            v12 = v23;
            v10 = v34;

          }
        }
        else
        {
          objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", 0x24D4B4B18, -7003, 0);
          v22 = (id)objc_claimAutoreleasedReturnValue();
          ((void (**)(_QWORD, _QWORD, id))v19)[2](v19, 0, v22);
        }

      }
      v40 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v55, v59, 16);
    }
    while (v40);
  }

  v25 = (void *)MEMORY[0x24BE6B628];
  -[COMTActionDirector dispatchQueue](self, "dispatchQueue");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "schedulerWithDispatchQueue:", v26);
  v27 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BE6B608], "combineAllFutures:ignoringErrors:scheduler:", v12, 1, v27);
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  v41[0] = MEMORY[0x24BDAC760];
  v41[1] = 3221225472;
  v41[2] = __63__COMTActionDirector_handlePerformActionRequest_from_callback___block_invoke_105;
  v41[3] = &unk_24D4B0970;
  v42 = v39;
  v43 = v33;
  v29 = v39;
  v30 = v12;
  v31 = v33;
  v32 = (id)objc_msgSend(v28, "addCompletionBlock:", v41);

}

void __63__COMTActionDirector_handlePerformActionRequest_from_callback___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  void *v8;
  id v9;
  id v10;
  _QWORD v11[4];
  id v12;
  id v13;
  id v14;
  id v15;
  uint64_t v16;
  id v17;

  v5 = a2;
  v6 = a3;
  v11[0] = MEMORY[0x24BDAC760];
  v11[1] = 3221225472;
  v11[2] = __63__COMTActionDirector_handlePerformActionRequest_from_callback___block_invoke_2;
  v11[3] = &unk_24D4B08F8;
  v12 = v5;
  v7 = *(NSObject **)(a1 + 32);
  v13 = *(id *)(a1 + 40);
  v14 = *(id *)(a1 + 48);
  v15 = v6;
  v8 = *(void **)(a1 + 64);
  v16 = *(_QWORD *)(a1 + 56);
  v17 = v8;
  v9 = v6;
  v10 = v5;
  dispatch_async(v7, v11);

}

uint64_t __63__COMTActionDirector_handlePerformActionRequest_from_callback___block_invoke_2(uint64_t a1)
{
  uint64_t v2;
  COMTErrorResult *v3;

  v2 = *(_QWORD *)(a1 + 32);
  if (v2)
  {
    objc_msgSend(*(id *)(a1 + 40), "setObject:forKey:", v2, *(_QWORD *)(a1 + 48));
  }
  else
  {
    if (*(_QWORD *)(a1 + 56))
    {
      v3 = -[COMTErrorResult initWithError:actionIdentifier:]([COMTErrorResult alloc], "initWithError:actionIdentifier:", *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 48));
      objc_msgSend(*(id *)(a1 + 40), "setObject:forKey:", v3, *(_QWORD *)(a1 + 48));
    }
    else
    {
      COCoreLogForCategory(20);
      v3 = (COMTErrorResult *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(&v3->super.super, OS_LOG_TYPE_ERROR))
        __63__COMTActionDirector_handlePerformActionRequest_from_callback___block_invoke_2_cold_1(a1, &v3->super.super);
    }

  }
  return objc_msgSend(*(id *)(a1 + 72), "finishWithNoResult");
}

uint64_t __63__COMTActionDirector_handlePerformActionRequest_from_callback___block_invoke_103(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  int v8;
  uint64_t v9;
  __int16 v10;
  uint64_t v11;
  __int16 v12;
  uint64_t v13;
  __int16 v14;
  uint64_t v15;
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  COCoreLogForCategory(20);
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    v3 = *(_QWORD *)(a1 + 32);
    v4 = *(_QWORD *)(a1 + 40);
    v5 = *(_QWORD *)(a1 + 48);
    v6 = *(_QWORD *)(a1 + 56);
    v8 = 138544130;
    v9 = v3;
    v10 = 2114;
    v11 = v4;
    v12 = 2048;
    v13 = v5;
    v14 = 2048;
    v15 = v6;
    _os_log_impl(&dword_215E92000, v2, OS_LOG_TYPE_DEFAULT, "%{public}@ dispatching %{public}@ for %p to %p", (uint8_t *)&v8, 0x2Au);
  }

  return objc_msgSend(*(id *)(a1 + 56), "director:performAction:from:callback:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 64), *(_QWORD *)(a1 + 72));
}

void __63__COMTActionDirector_handlePerformActionRequest_from_callback___block_invoke_105(uint64_t a1)
{
  uint64_t v1;
  COMTPerformActionResponse *v2;

  v1 = *(_QWORD *)(a1 + 40);
  v2 = -[COMTPerformActionResponse initWithResults:]([COMTPerformActionResponse alloc], "initWithResults:", *(_QWORD *)(a1 + 32));
  (*(void (**)(uint64_t, COMTPerformActionResponse *, _QWORD))(v1 + 16))(v1, v2, 0);

}

+ (id)directorForCluster:(id)a3
{
  id v3;
  void *v4;
  uint64_t v5;
  void *v6;
  COMTActionDirector *v7;
  NSObject *v8;
  int v10;
  COMTActionDirector *v11;
  __int16 v12;
  id v13;
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  v3 = a3;
  os_unfair_lock_lock((os_unfair_lock_t)&directorForCluster__lock);
  v4 = (void *)directorForCluster__directors;
  if (!directorForCluster__directors)
  {
    objc_msgSend(MEMORY[0x24BDD1650], "weakToWeakObjectsMapTable");
    v5 = objc_claimAutoreleasedReturnValue();
    v6 = (void *)directorForCluster__directors;
    directorForCluster__directors = v5;

    v4 = (void *)directorForCluster__directors;
  }
  objc_msgSend(v4, "objectForKey:", v3);
  v7 = (COMTActionDirector *)objc_claimAutoreleasedReturnValue();
  if (!v7)
  {
    v7 = -[COMTActionDirector initWithCluster:]([COMTActionDirector alloc], "initWithCluster:", v3);
    objc_msgSend((id)directorForCluster__directors, "setObject:forKey:", v7, v3);
  }
  os_unfair_lock_unlock((os_unfair_lock_t)&directorForCluster__lock);
  COCoreLogForCategory(20);
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    v10 = 138543618;
    v11 = v7;
    v12 = 2114;
    v13 = v3;
    _os_log_impl(&dword_215E92000, v8, OS_LOG_TYPE_DEFAULT, "%{public}@ returned for cluster %{public}@", (uint8_t *)&v10, 0x16u);
  }

  return v7;
}

- (COMTActionDirector)initWithProvider:(id)a3 cluster:(id)a4
{
  id v7;
  id v8;
  COMTActionDirector *v9;
  COMTActionDirector *v10;
  NSObject *v11;
  dispatch_queue_t v12;
  OS_dispatch_queue *dispatchQueue;
  uint64_t v14;
  NSMutableArray *actionHandler;
  objc_super v17;

  v7 = a3;
  v8 = a4;
  v17.receiver = self;
  v17.super_class = (Class)COMTActionDirector;
  v9 = -[COMTActionDirector init](&v17, sel_init);
  v10 = v9;
  if (v9)
  {
    v9->_lock._os_unfair_lock_opaque = 0;
    objc_storeStrong((id *)&v9->_cluster, a4);
    dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v11 = objc_claimAutoreleasedReturnValue();
    v12 = dispatch_queue_create("com.apple.Coordination.COMTActionDirector", v11);
    dispatchQueue = v10->_dispatchQueue;
    v10->_dispatchQueue = (OS_dispatch_queue *)v12;

    objc_storeStrong((id *)&v10->_provider, a3);
    objc_msgSend(MEMORY[0x24BDBCEB8], "array");
    v14 = objc_claimAutoreleasedReturnValue();
    actionHandler = v10->_actionHandler;
    v10->_actionHandler = (NSMutableArray *)v14;

    -[COMTActionDirector _activate](v10, "_activate");
  }

  return v10;
}

- (COMTActionDirector)initWithCluster:(id)a3
{
  id v4;
  _COMTActionDirectorServiceProvider *v5;
  COMTActionDirector *v6;

  v4 = a3;
  v5 = objc_alloc_init(_COMTActionDirectorServiceProvider);
  v6 = -[COMTActionDirector initWithProvider:cluster:](self, "initWithProvider:cluster:", v5, v4);

  return v6;
}

- (void)requestAction:(id)a3 members:(id)a4 activity:(id)a5 withCompletion:(id)a6
{
  id v10;
  id v11;
  void *v12;
  id v13;
  id v14;
  void *v15;
  id v16;
  id v17;
  _QWORD v18[4];
  id v19;
  id v20;
  _QWORD v21[2];

  v21[1] = *MEMORY[0x24BDAC8D0];
  v10 = a3;
  v11 = a6;
  v21[0] = v10;
  v12 = (void *)MEMORY[0x24BDBCE30];
  v13 = a5;
  v14 = a4;
  objc_msgSend(v12, "arrayWithObjects:count:", v21, 1);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v18[0] = MEMORY[0x24BDAC760];
  v18[1] = 3221225472;
  v18[2] = __68__COMTActionDirector_requestAction_members_activity_withCompletion___block_invoke;
  v18[3] = &unk_24D4B0998;
  v19 = v10;
  v20 = v11;
  v16 = v10;
  v17 = v11;
  -[COMTActionDirector requestActions:members:activity:withCompletion:](self, "requestActions:members:activity:withCompletion:", v15, v14, v13, v18);

}

void __68__COMTActionDirector_requestAction_members_activity_withCompletion___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  void *v4;
  void *v5;
  char isKindOfClass;
  id v7;
  void *v8;
  id v9;
  id v10;

  if (a3)
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
    return;
  }
  objc_msgSend(a2, "results");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "actionIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKey:", v5);
  v9 = (id)objc_claimAutoreleasedReturnValue();

  if (v9)
  {
    objc_opt_class();
    isKindOfClass = objc_opt_isKindOfClass();
    v7 = v9;
    if ((isKindOfClass & 1) == 0)
    {
      v8 = 0;
      goto LABEL_9;
    }
    objc_msgSend(v9, "error");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", 0x24D4B4B18, -7001, 0);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v7 = 0;
LABEL_9:
  v10 = v7;
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

}

- (void)requestAction:(id)a3 members:(id)a4 withCompletion:(id)a5
{
  -[COMTActionDirector requestAction:members:activity:withCompletion:](self, "requestAction:members:activity:withCompletion:", a3, a4, 0, a5);
}

- (void)requestActions:(id)a3 members:(id)a4 activity:(id)a5 withCompletion:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  COMTPerformActionRequest *v14;
  COMTPerformActionRequest *v15;
  NSObject *v16;
  void *v17;
  COMTPerformActionRequest *v18;
  id v19;
  _QWORD v20[4];
  COMTPerformActionRequest *v21;
  id v22;
  id v23;
  uint8_t buf[4];
  COMTActionDirector *v25;
  __int16 v26;
  COMTPerformActionRequest *v27;
  __int16 v28;
  id v29;
  __int16 v30;
  id v31;
  uint64_t v32;

  v32 = *MEMORY[0x24BDAC8D0];
  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  v14 = -[COMTPerformActionRequest initWithActions:]([COMTPerformActionRequest alloc], "initWithActions:", v10);
  v15 = v14;
  if (v12)
    -[COMessageChannelRequest setNetworkActivity:](v14, "setNetworkActivity:", v12);
  COCoreLogForCategory(20);
  v16 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138544130;
    v25 = self;
    v26 = 2048;
    v27 = v15;
    v28 = 2114;
    v29 = v10;
    v30 = 2114;
    v31 = v11;
    _os_log_impl(&dword_215E92000, v16, OS_LOG_TYPE_DEFAULT, "%{public}@ requesting %p for actions %{public}@ from members %{public}@", buf, 0x2Au);
  }

  objc_initWeak((id *)buf, self);
  -[COMTActionDirector messageChannel](self, "messageChannel");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v20[0] = MEMORY[0x24BDAC760];
  v20[1] = 3221225472;
  v20[2] = __69__COMTActionDirector_requestActions_members_activity_withCompletion___block_invoke;
  v20[3] = &unk_24D4B09C0;
  objc_copyWeak(&v23, (id *)buf);
  v18 = v15;
  v21 = v18;
  v19 = v13;
  v22 = v19;
  objc_msgSend(v17, "sendRequest:members:withCompletionHandler:", v18, v11, v20);

  objc_destroyWeak(&v23);
  objc_destroyWeak((id *)buf);

}

void __69__COMTActionDirector_requestActions_members_activity_withCompletion___block_invoke(uint64_t a1, uint64_t a2, void *a3, void *a4)
{
  id v6;
  id v7;
  id WeakRetained;
  NSObject *v9;
  uint64_t v10;
  void (*v11)(void);
  void *v12;
  int v13;
  id v14;
  __int16 v15;
  id v16;
  __int16 v17;
  uint64_t v18;
  __int16 v19;
  id v20;
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  if (WeakRetained)
  {
    COCoreLogForCategory(20);
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      v10 = *(_QWORD *)(a1 + 32);
      v13 = 138544130;
      v14 = WeakRetained;
      v15 = 2048;
      v16 = v6;
      v17 = 2048;
      v18 = v10;
      v19 = 2114;
      v20 = v7;
      _os_log_impl(&dword_215E92000, v9, OS_LOG_TYPE_DEFAULT, "%{public}@ recevied response %p for request %p (error: %{public}@)", (uint8_t *)&v13, 0x2Au);
    }

    if (v7)
    {
      v11 = *(void (**)(void))(*(_QWORD *)(a1 + 40) + 16);
    }
    else
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", 0x24D4B4B18, -7002, 0);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

        goto LABEL_9;
      }
      v11 = *(void (**)(void))(*(_QWORD *)(a1 + 40) + 16);
    }
    v11();
  }
LABEL_9:

}

- (void)requestAction:(id)a3 members:(id)a4 activity:(id)a5 fallback:(id)a6 withCompletion:(id)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  id v20;
  id v21;
  _QWORD v22[4];
  id v23;
  id v24;
  id v25;
  id v26;
  id v27;
  id v28;
  id location;

  v12 = a3;
  v13 = a4;
  v14 = a5;
  v15 = a6;
  v16 = a7;
  objc_initWeak(&location, self);
  v22[0] = MEMORY[0x24BDAC760];
  v22[1] = 3221225472;
  v22[2] = __77__COMTActionDirector_requestAction_members_activity_fallback_withCompletion___block_invoke;
  v22[3] = &unk_24D4B09E8;
  objc_copyWeak(&v28, &location);
  v17 = v15;
  v26 = v17;
  v18 = v12;
  v23 = v18;
  v19 = v13;
  v24 = v19;
  v20 = v14;
  v25 = v20;
  v21 = v16;
  v27 = v21;
  -[COMTActionDirector requestAction:members:activity:withCompletion:](self, "requestAction:members:activity:withCompletion:", v18, v19, v20, v22);

  objc_destroyWeak(&v28);
  objc_destroyWeak(&location);

}

void __77__COMTActionDirector_requestAction_members_activity_fallback_withCompletion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id WeakRetained;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  NSObject *v12;
  uint64_t v13;
  int v14;
  id v15;
  __int16 v16;
  uint64_t v17;
  __int16 v18;
  void *v19;
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  v5 = a2;
  v6 = a3;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 72));
  if (!WeakRetained)
    goto LABEL_13;
  if (!v6)
    goto LABEL_12;
  objc_msgSend(v6, "domain");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v8, "isEqualToString:", 0x24D4B4B18) || objc_msgSend(v6, "code") != -7003)
  {
    objc_msgSend(v6, "domain");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v9, "isEqualToString:", *MEMORY[0x24BE19C88]) & 1) != 0)
    {
      v10 = objc_msgSend(v6, "code");

      if (v10 == -1106)
        goto LABEL_8;
    }
    else
    {

    }
LABEL_12:
    (*(void (**)(void))(*(_QWORD *)(a1 + 64) + 16))();
    goto LABEL_13;
  }

LABEL_8:
  (*(void (**)(void))(*(_QWORD *)(a1 + 56) + 16))();
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  COCoreLogForCategory(20);
  v12 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
  {
    v13 = *(_QWORD *)(a1 + 32);
    v14 = 138412802;
    v15 = WeakRetained;
    v16 = 2048;
    v17 = v13;
    v18 = 2112;
    v19 = v11;
    _os_log_debug_impl(&dword_215E92000, v12, OS_LOG_TYPE_DEBUG, "%@ action %p not handled by remote, using fallback: %@", (uint8_t *)&v14, 0x20u);
  }

  objc_msgSend(WeakRetained, "requestAction:members:activity:withCompletion:", v11, *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 64));
LABEL_13:

}

- (void)requestActions:(id)a3 members:(id)a4 withCompletion:(id)a5
{
  -[COMTActionDirector requestActions:members:activity:withCompletion:](self, "requestActions:members:activity:withCompletion:", a3, a4, 0, a5);
}

- (void)registerHandler:(id)a3 forType:(id)a4 actions:(id)a5 queue:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;
  id v17;
  _QWORD v18[5];
  id v19;
  id v20;
  id v21;
  id v22;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  v18[0] = MEMORY[0x24BDAC760];
  v18[1] = 3221225472;
  v18[2] = __60__COMTActionDirector_registerHandler_forType_actions_queue___block_invoke;
  v18[3] = &unk_24D4B0A10;
  v18[4] = self;
  v19 = v11;
  v20 = v10;
  v21 = v12;
  v22 = v13;
  v14 = v13;
  v15 = v12;
  v16 = v10;
  v17 = v11;
  -[COMTActionDirector _withLock:](self, "_withLock:", v18);

}

void __60__COMTActionDirector_registerHandler_forType_actions_queue___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t i;
  void *v7;
  void *v8;
  int v9;
  void *v10;
  void *v11;
  NSObject *v12;
  COMTActionRequestHandler *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  char v17;
  NSObject *v18;
  id v19;
  uint64_t v20;
  NSObject *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  _QWORD v26[4];
  id v27;
  uint64_t v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  uint8_t buf[4];
  uint64_t v34;
  __int16 v35;
  uint64_t v36;
  __int16 v37;
  uint64_t v38;
  __int16 v39;
  uint64_t v40;
  _BYTE v41[128];
  uint64_t v42;

  v42 = *MEMORY[0x24BDAC8D0];
  v29 = 0u;
  v30 = 0u;
  v31 = 0u;
  v32 = 0u;
  objc_msgSend(*(id *)(a1 + 32), "actionHandler");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v29, v41, 16);
  if (!v3)
    goto LABEL_16;
  v4 = v3;
  v5 = *(_QWORD *)v30;
  while (2)
  {
    for (i = 0; i != v4; ++i)
    {
      if (*(_QWORD *)v30 != v5)
        objc_enumerationMutation(v2);
      v7 = *(void **)(*((_QWORD *)&v29 + 1) + 8 * i);
      objc_msgSend(v7, "targetType");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = objc_msgSend(v8, "isEqualToString:", *(_QWORD *)(a1 + 40));

      if (v9)
      {
        COCoreLogForCategory(20);
        v12 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
          __60__COMTActionDirector_registerHandler_forType_actions_queue___block_invoke_cold_1();
        goto LABEL_15;
      }
      v10 = *(void **)(a1 + 56);
      objc_msgSend(v7, "actions");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      LODWORD(v10) = objc_msgSend(v10, "intersectsSet:", v11);

      if ((_DWORD)v10)
      {
        COCoreLogForCategory(20);
        v12 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
          __60__COMTActionDirector_registerHandler_forType_actions_queue___block_invoke_cold_2();
LABEL_15:

        goto LABEL_16;
      }
    }
    v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v29, v41, 16);
    if (v4)
      continue;
    break;
  }
LABEL_16:

  v13 = -[COMTActionRequestHandler initWithType:actions:delegate:dispatchQueue:]([COMTActionRequestHandler alloc], "initWithType:actions:delegate:dispatchQueue:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 64));
  objc_msgSend(*(id *)(a1 + 32), "actionHandler");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "addObject:", v13);

  objc_msgSend(*(id *)(a1 + 32), "members");
  v15 = objc_claimAutoreleasedReturnValue();
  if (v15)
  {
    v16 = (void *)v15;
    v17 = objc_opt_respondsToSelector();

    if ((v17 & 1) != 0)
    {
      v18 = *(NSObject **)(a1 + 64);
      v26[0] = MEMORY[0x24BDAC760];
      v26[1] = 3221225472;
      v26[2] = __60__COMTActionDirector_registerHandler_forType_actions_queue___block_invoke_116;
      v26[3] = &unk_24D4B0858;
      v19 = *(id *)(a1 + 48);
      v20 = *(_QWORD *)(a1 + 32);
      v27 = v19;
      v28 = v20;
      dispatch_async(v18, v26);

    }
  }
  COCoreLogForCategory(20);
  v21 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
  {
    v22 = *(_QWORD *)(a1 + 32);
    v23 = *(_QWORD *)(a1 + 40);
    v24 = *(_QWORD *)(a1 + 48);
    v25 = *(_QWORD *)(a1 + 56);
    *(_DWORD *)buf = 138544130;
    v34 = v22;
    v35 = 2048;
    v36 = v24;
    v37 = 2114;
    v38 = v23;
    v39 = 2114;
    v40 = v25;
    _os_log_impl(&dword_215E92000, v21, OS_LOG_TYPE_DEFAULT, "%{public}@ registered delegate %p for type %{public}@ and actions %{public}@", buf, 0x2Au);
  }

}

void __60__COMTActionDirector_registerHandler_forType_actions_queue___block_invoke_116(uint64_t a1)
{
  void *v1;
  void *v2;
  id v3;

  v1 = *(void **)(a1 + 32);
  v2 = *(void **)(a1 + 40);
  objc_msgSend(v2, "members");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "director:membersChanged:", v2, v3);

}

- (void)removeHandler:(id)a3
{
  id v4;
  id v5;
  _QWORD v6[5];
  id v7;

  v4 = a3;
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __36__COMTActionDirector_removeHandler___block_invoke;
  v6[3] = &unk_24D4B0858;
  v6[4] = self;
  v7 = v4;
  v5 = v4;
  -[COMTActionDirector _withLock:](self, "_withLock:", v6);

}

void __36__COMTActionDirector_removeHandler___block_invoke(uint64_t a1)
{
  id *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  NSObject *v11;
  void *v12;
  NSObject *v13;
  uint64_t v14;
  uint64_t v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  uint8_t buf[4];
  uint64_t v21;
  __int16 v22;
  uint64_t v23;
  _BYTE v24[128];
  uint64_t v25;

  v25 = *MEMORY[0x24BDAC8D0];
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v2 = (id *)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 32), "actionHandler", 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v16, v24, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v17;
LABEL_3:
    v7 = 0;
    while (1)
    {
      if (*(_QWORD *)v17 != v6)
        objc_enumerationMutation(v3);
      v8 = *(void **)(*((_QWORD *)&v16 + 1) + 8 * v7);
      objc_msgSend(v8, "delegate");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = *(void **)(a1 + 40);

      if (v9 == v10)
        break;
      if (v5 == ++v7)
      {
        v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v16, v24, 16);
        if (v5)
          goto LABEL_3;
        goto LABEL_9;
      }
    }
    v11 = v8;

    if (!v11)
      goto LABEL_14;
    objc_msgSend(*v2, "actionHandler");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "removeObject:", v11);

    COCoreLogForCategory(20);
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      v14 = *(_QWORD *)(a1 + 32);
      v15 = *(_QWORD *)(a1 + 40);
      *(_DWORD *)buf = 138543618;
      v21 = v14;
      v22 = 2048;
      v23 = v15;
      _os_log_impl(&dword_215E92000, v13, OS_LOG_TYPE_DEFAULT, "%{public}@ removed delegate %p", buf, 0x16u);
    }

  }
  else
  {
LABEL_9:

LABEL_14:
    COCoreLogForCategory(20);
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      __36__COMTActionDirector_removeHandler___block_invoke_cold_1();
  }

}

- (OS_dispatch_queue)dispatchQueue
{
  return self->_dispatchQueue;
}

- (COCluster)cluster
{
  return self->_cluster;
}

- (COClusterRoleMonitor)monitor
{
  return self->_monitor;
}

- (NSObject)monitorObserver
{
  return self->_monitorObserver;
}

- (void)setMonitorObserver:(id)a3
{
  objc_storeStrong((id *)&self->_monitorObserver, a3);
}

- (NSSet)members
{
  return self->_members;
}

- (void)setMembers:(id)a3
{
  objc_storeStrong((id *)&self->_members, a3);
}

- (NSMutableArray)actionHandler
{
  return self->_actionHandler;
}

- (void)setActionHandler:(id)a3
{
  objc_storeStrong((id *)&self->_actionHandler, a3);
}

- (COMTActionDirectorServiceProvider)provider
{
  return self->_provider;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_provider, 0);
  objc_storeStrong((id *)&self->_actionHandler, 0);
  objc_storeStrong((id *)&self->_members, 0);
  objc_storeStrong((id *)&self->_monitorObserver, 0);
  objc_storeStrong((id *)&self->_monitor, 0);
  objc_storeStrong((id *)&self->_cluster, 0);
  objc_storeStrong((id *)&self->_dispatchQueue, 0);
  objc_storeStrong((id *)&self->_messageChannel, 0);
}

void __31__COMTActionDirector__activate__block_invoke_4_cold_1(_QWORD *a1, _QWORD *a2, NSObject *a3)
{
  _BYTE v3[24];

  *(_DWORD *)v3 = 138543618;
  *(_QWORD *)&v3[4] = *a1;
  *(_WORD *)&v3[12] = 2114;
  *(_QWORD *)&v3[14] = *a2;
  OUTLINED_FUNCTION_0_0(&dword_215E92000, (uint64_t)a2, a3, "%{public}@ message channel activation failed: %{public}@", *(_QWORD *)v3, *(_QWORD *)&v3[8], *(_QWORD *)&v3[16]);
  OUTLINED_FUNCTION_2_0();
}

void __63__COMTActionDirector_handlePerformActionRequest_from_callback___block_invoke_2_cold_1(uint64_t a1, NSObject *a2)
{
  uint64_t v2;
  int v3;
  uint64_t v4;
  uint64_t v5;

  v5 = *MEMORY[0x24BDAC8D0];
  v2 = *(_QWORD *)(a1 + 64);
  v3 = 138543362;
  v4 = v2;
  _os_log_error_impl(&dword_215E92000, a2, OS_LOG_TYPE_ERROR, "%{public}@ action callback did not provide result or error", (uint8_t *)&v3, 0xCu);
  OUTLINED_FUNCTION_2_0();
}

void __60__COMTActionDirector_registerHandler_forType_actions_queue___block_invoke_cold_1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_0(&dword_215E92000, v0, v1, "%{public}@ failed to register delegate %p: duplicate target");
  OUTLINED_FUNCTION_2_0();
}

void __60__COMTActionDirector_registerHandler_forType_actions_queue___block_invoke_cold_2()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_0(&dword_215E92000, v0, v1, "%{public}@ failed to register delegate %p: duplicate action");
  OUTLINED_FUNCTION_2_0();
}

void __36__COMTActionDirector_removeHandler___block_invoke_cold_1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_0(&dword_215E92000, v0, v1, "%{public}@ failed to remove delegate %p: not found");
  OUTLINED_FUNCTION_2_0();
}

@end
