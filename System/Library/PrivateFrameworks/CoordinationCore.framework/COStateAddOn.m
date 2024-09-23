@implementation COStateAddOn

- (COStateAddOn)init
{
  COStateAddOn *v2;
  uint64_t v3;
  NSMutableArray *outstandingUpdateRequests;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)COStateAddOn;
  v2 = -[COMeshAddOn init](&v6, sel_init);
  if (v2)
  {
    objc_msgSend(MEMORY[0x24BDBCEB8], "array");
    v3 = objc_claimAutoreleasedReturnValue();
    outstandingUpdateRequests = v2->_outstandingUpdateRequests;
    v2->_outstandingUpdateRequests = (NSMutableArray *)v3;

    v2->_stateConstructionGeneration = 0;
    v2->_lock._os_unfair_lock_opaque = 0;
  }
  return v2;
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

- (COStateAddOnDelegate)delegate
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
  v8 = __Block_byref_object_copy__19;
  v9 = __Block_byref_object_dispose__19;
  v10 = 0;
  v4[0] = MEMORY[0x24BDAC760];
  v4[1] = 3221225472;
  v4[2] = __24__COStateAddOn_delegate__block_invoke;
  v4[3] = &unk_24D4B07E0;
  v4[4] = self;
  v4[5] = &v5;
  -[COStateAddOn _withLock:](self, "_withLock:", v4);
  v2 = (id)v6[5];
  _Block_object_dispose(&v5, 8);

  return (COStateAddOnDelegate *)v2;
}

void __24__COStateAddOn_delegate__block_invoke(uint64_t a1)
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
  COStateAddOn *v8;

  v4 = a3;
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __28__COStateAddOn_setDelegate___block_invoke;
  v6[3] = &unk_24D4B0858;
  v7 = v4;
  v8 = self;
  v5 = v4;
  -[COStateAddOn _withLock:](self, "_withLock:", v6);

}

void __28__COStateAddOn_setDelegate___block_invoke(uint64_t a1)
{
  void *v2;
  id WeakRetained;

  v2 = *(void **)(a1 + 32);
  WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 40) + 56));
  LOBYTE(v2) = objc_msgSend(v2, "isEqual:", WeakRetained);

  if ((v2 & 1) == 0)
    objc_storeWeak((id *)(*(_QWORD *)(a1 + 40) + 56), *(id *)(a1 + 32));
}

- (void)setDictionary:(id)a3 suite:(id)a4 withCallback:(id)a5
{
  id v8;
  id v9;
  id v10;
  NSObject *v11;
  void *v12;
  void *v13;
  int v14;
  void *v15;
  __int16 v16;
  id v17;
  __int16 v18;
  id v19;
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  COCoreLogForCategory(6);
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
  {
    -[COMeshAddOn meshController](self, "meshController");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = 134218498;
    v15 = v13;
    v16 = 2112;
    v17 = v8;
    v18 = 2112;
    v19 = v9;
    _os_log_debug_impl(&dword_215E92000, v11, OS_LOG_TYPE_DEBUG, "%p setting state %@ for suite %@", (uint8_t *)&v14, 0x20u);

  }
  objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setValue:forKey:", v8, v9);
  -[COStateAddOn sendStateUpdates:removals:withCallback:](self, "sendStateUpdates:removals:withCallback:", v12, 0, v10);

}

- (void)removeKeyPaths:(id)a3 suite:(id)a4 withCallback:(id)a5
{
  id v8;
  id v9;
  id v10;
  NSObject *v11;
  void *v12;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  COCoreLogForCategory(6);
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
    -[COStateAddOn removeKeyPaths:suite:withCallback:].cold.1();

  objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setObject:forKey:", v8, v9);
  -[COStateAddOn sendStateUpdates:removals:withCallback:](self, "sendStateUpdates:removals:withCallback:", 0, v12, v10);

}

- (void)sendStateUpdates:(id)a3 removals:(id)a4 withCallback:(id)a5
{
  id v8;
  id v9;
  id v10;
  NSObject *v11;
  COStateUpdateRequest *v12;
  void *v13;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  COCoreLogForCategory(6);
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
    -[COStateAddOn sendStateUpdates:removals:withCallback:].cold.1();

  v12 = -[COStateUpdateRequest initWithUpdates:removals:]([COStateUpdateRequest alloc], "initWithUpdates:removals:", v8, v9);
  -[COMeshAddOn meshController](self, "meshController");
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  if (v13)
    -[COStateAddOn _sendRequest:withRetryCount:withCallback:](self, "_sendRequest:withRetryCount:withCallback:", v12, 5, v10);
  else
    -[COStateAddOn _handleUpdates:removals:](self, "_handleUpdates:removals:", v8, v9);

}

- (void)_sendRequest:(id)a3 withRetryCount:(int64_t)a4 withCallback:(id)a5
{
  id v8;
  void (**v9)(id, void *);
  id v10;
  void *v11;
  void *v12;
  NSObject *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  _QWORD v21[4];
  id v22;
  void (**v23)(id, void *);
  id v24[2];
  id location;

  v8 = a3;
  v9 = (void (**)(id, void *))a5;
  if (a4 <= 0)
  {
    COCoreLogForCategory(6);
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      -[COStateAddOn _sendRequest:withRetryCount:withCallback:].cold.1((uint64_t)v8, v13, v14, v15, v16, v17, v18, v19);

    objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", CFSTR("COMeshNodeErrorDomain"), -4002, 0);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v9[2](v9, v20);

  }
  else
  {
    objc_initWeak(&location, self);
    v21[0] = MEMORY[0x24BDAC760];
    v21[1] = 3221225472;
    v21[2] = __57__COStateAddOn__sendRequest_withRetryCount_withCallback___block_invoke;
    v21[3] = &unk_24D4B33F8;
    objc_copyWeak(v24, &location);
    v10 = v8;
    v22 = v10;
    v24[1] = (id)a4;
    v23 = v9;
    v11 = (void *)MEMORY[0x2199F3D40](v21);
    -[COMeshAddOn meshController](self, "meshController");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "sendRequest:withCompletionHandler:", v10, v11);

    objc_destroyWeak(v24);
    objc_destroyWeak(&location);
  }

}

void __57__COStateAddOn__sendRequest_withRetryCount_withCallback___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  id WeakRetained;
  NSObject *v8;
  uint64_t v9;
  void *v10;
  void *v11;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  if (WeakRetained)
  {
    if (a5)
    {
      COCoreLogForCategory(6);
      v8 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
        __57__COStateAddOn__sendRequest_withRetryCount_withCallback___block_invoke_cold_1(a1, v8, v9);

      objc_msgSend(WeakRetained, "_sendRequest:withRetryCount:withCallback:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 56) - 1, *(_QWORD *)(a1 + 40));
    }
    else
    {
      objc_msgSend(*(id *)(a1 + 32), "updates");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 32), "removals");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(WeakRetained, "_handleUpdates:removals:", v10, v11);

      (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
    }
  }

}

- (void)_handleUpdates:(id)a3 removals:(id)a4
{
  id v6;
  NSObject *v7;
  void *v8;
  unint64_t v9;
  char *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t i;
  uint64_t v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  char v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  char *v33;
  uint64_t v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t j;
  uint64_t v45;
  void *v46;
  void *v47;
  void *v48;
  NSDictionary *meshState;
  NSObject *v50;
  void *v51;
  id obj;
  void *v53;
  void *v54;
  uint64_t v55;
  id v56;
  uint64_t v57;
  char *v58;
  id v59;
  NSDictionary *v60;
  void *v61;
  uint64_t v62;
  void *v63;
  uint64_t v64;
  id v65;
  char *v66;
  uint64_t v67;
  void *v68;
  void *v69;
  COStateAddOn *v70;
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
  __int128 v83;
  __int128 v84;
  __int128 v85;
  __int128 v86;
  _BYTE v87[128];
  _BYTE v88[128];
  _BYTE v89[128];
  uint8_t v90[128];
  uint8_t buf[4];
  COStateAddOn *v92;
  __int16 v93;
  id v94;
  __int16 v95;
  id v96;
  uint64_t v97;

  v97 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v56 = a4;
  COCoreLogForCategory(6);
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134218498;
    v92 = self;
    v93 = 2112;
    v94 = v6;
    v95 = 2112;
    v96 = v56;
    _os_log_impl(&dword_215E92000, v7, OS_LOG_TYPE_DEFAULT, "%p handling updates %@ and removals %@", buf, 0x20u);
  }

  -[COStateAddOn meshState](self, "meshState");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v60 = (NSDictionary *)objc_msgSend(v8, "mutableCopy");

  v9 = 0x24BDBC000uLL;
  objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  v54 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  v53 = (void *)objc_claimAutoreleasedReturnValue();
  v83 = 0u;
  v84 = 0u;
  v85 = 0u;
  v86 = 0u;
  objc_msgSend(v6, "allKeys");
  obj = (id)objc_claimAutoreleasedReturnValue();
  v69 = v6;
  v70 = self;
  v57 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v83, v90, 16);
  if (v57)
  {
    v55 = *(_QWORD *)v84;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v84 != v55)
          objc_enumerationMutation(obj);
        v11 = *(_QWORD *)(*((_QWORD *)&v83 + 1) + 8 * (_QWORD)v10);
        -[COStateAddOn meshState](self, "meshState");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "objectForKeyedSubscript:", v11);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v58 = v10;
        if (v13)
        {
          -[COStateAddOn meshState](self, "meshState");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v14, "objectForKeyedSubscript:", v11);
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          v63 = (void *)objc_msgSend(v15, "mutableCopy");

          v9 = 0x24BDBC000;
        }
        else
        {
          objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
          v63 = (void *)objc_claimAutoreleasedReturnValue();
        }

        objc_msgSend(*(id *)(v9 + 3800), "dictionary");
        v61 = (void *)objc_claimAutoreleasedReturnValue();
        v79 = 0u;
        v80 = 0u;
        v81 = 0u;
        v82 = 0u;
        v16 = v69;
        objc_msgSend(v69, "objectForKeyedSubscript:", v11);
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17, "allKeys");
        v18 = (void *)objc_claimAutoreleasedReturnValue();

        v65 = v18;
        v19 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v79, v89, 16);
        if (v19)
        {
          v20 = v19;
          v67 = *(_QWORD *)v80;
          do
          {
            for (i = 0; i != v20; ++i)
            {
              if (*(_QWORD *)v80 != v67)
                objc_enumerationMutation(v65);
              v22 = *(_QWORD *)(*((_QWORD *)&v79 + 1) + 8 * i);
              -[COStateAddOn meshState](self, "meshState");
              v23 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v23, "objectForKeyedSubscript:", v11);
              v24 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v24, "objectForKeyedSubscript:", v22);
              v25 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v16, "objectForKeyedSubscript:", v11);
              v26 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v26, "objectForKeyedSubscript:", v22);
              v27 = (void *)objc_claimAutoreleasedReturnValue();
              v28 = objc_msgSend(v25, "isEqual:", v27);

              v16 = v69;
              if ((v28 & 1) == 0)
              {
                objc_msgSend(v69, "objectForKeyedSubscript:", v11);
                v29 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v29, "objectForKeyedSubscript:", v22);
                v30 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v61, "setObject:forKey:", v30, v22);

                objc_msgSend(v69, "objectForKeyedSubscript:", v11);
                v31 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v31, "objectForKeyedSubscript:", v22);
                v32 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v63, "setObject:forKey:", v32, v22);

              }
              self = v70;
            }
            v20 = objc_msgSend(v65, "countByEnumeratingWithState:objects:count:", &v79, v89, 16);
          }
          while (v20);
        }

        if (objc_msgSend(v61, "count"))
          objc_msgSend(v54, "setObject:forKey:", v61, v11);
        -[NSDictionary setObject:forKey:](v60, "setObject:forKey:", v63, v11);

        v10 = v58 + 1;
        v9 = 0x24BDBC000uLL;
      }
      while (v58 + 1 != (char *)v57);
      v57 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v83, v90, 16);
    }
    while (v57);
  }

  v77 = 0u;
  v78 = 0u;
  v75 = 0u;
  v76 = 0u;
  objc_msgSend(v56, "allKeys");
  v59 = (id)objc_claimAutoreleasedReturnValue();
  v64 = objc_msgSend(v59, "countByEnumeratingWithState:objects:count:", &v75, v88, 16);
  if (v64)
  {
    v62 = *(_QWORD *)v76;
    do
    {
      v33 = 0;
      do
      {
        if (*(_QWORD *)v76 != v62)
          objc_enumerationMutation(v59);
        v34 = *(_QWORD *)(*((_QWORD *)&v75 + 1) + 8 * (_QWORD)v33);
        -[COStateAddOn meshState](self, "meshState");
        v35 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v35, "objectForKeyedSubscript:", v34);
        v36 = (void *)objc_claimAutoreleasedReturnValue();
        v66 = v33;
        if (v36)
        {
          -[COStateAddOn meshState](self, "meshState");
          v37 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v37, "objectForKeyedSubscript:", v34);
          v38 = (void *)objc_claimAutoreleasedReturnValue();
          v68 = (void *)objc_msgSend(v38, "mutableCopy");

        }
        else
        {
          objc_msgSend(*(id *)(v9 + 3800), "dictionary");
          v68 = (void *)objc_claimAutoreleasedReturnValue();
        }

        objc_msgSend(MEMORY[0x24BDBCEF0], "set");
        v39 = (void *)objc_claimAutoreleasedReturnValue();
        v71 = 0u;
        v72 = 0u;
        v73 = 0u;
        v74 = 0u;
        objc_msgSend(v56, "objectForKeyedSubscript:", v34);
        v40 = (void *)objc_claimAutoreleasedReturnValue();
        v41 = objc_msgSend(v40, "countByEnumeratingWithState:objects:count:", &v71, v87, 16);
        if (v41)
        {
          v42 = v41;
          v43 = *(_QWORD *)v72;
          do
          {
            for (j = 0; j != v42; ++j)
            {
              if (*(_QWORD *)v72 != v43)
                objc_enumerationMutation(v40);
              v45 = *(_QWORD *)(*((_QWORD *)&v71 + 1) + 8 * j);
              -[COStateAddOn meshState](self, "meshState");
              v46 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v46, "objectForKeyedSubscript:", v34);
              v47 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v47, "objectForKeyedSubscript:", v45);
              v48 = (void *)objc_claimAutoreleasedReturnValue();

              if (v48)
              {
                objc_msgSend(v39, "addObject:", v45);
                objc_msgSend(v68, "removeObjectForKey:", v45);
              }
              self = v70;
            }
            v42 = objc_msgSend(v40, "countByEnumeratingWithState:objects:count:", &v71, v87, 16);
          }
          while (v42);
        }

        if (objc_msgSend(v39, "count"))
          objc_msgSend(v53, "setObject:forKey:", v39, v34);
        -[NSDictionary setObject:forKey:](v60, "setObject:forKey:", v68, v34);

        v33 = v66 + 1;
        v9 = 0x24BDBC000;
      }
      while (v66 + 1 != (char *)v64);
      v64 = objc_msgSend(v59, "countByEnumeratingWithState:objects:count:", &v75, v88, 16);
    }
    while (v64);
  }

  meshState = self->_meshState;
  self->_meshState = v60;

  if (objc_msgSend(v54, "count") || objc_msgSend(v53, "count"))
  {
    COCoreLogForCategory(6);
    v50 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v50, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134218498;
      v92 = self;
      v93 = 2112;
      v94 = v54;
      v95 = 2112;
      v96 = v53;
      _os_log_impl(&dword_215E92000, v50, OS_LOG_TYPE_DEFAULT, "%p informing delegates of changes. Updates Diff = %@ and Removals Diff %@", buf, 0x20u);
    }

    -[COStateAddOn delegate](self, "delegate");
    v51 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v51, "addOn:receivedUpdates:removals:", self, v54, v53);

  }
}

- (void)meshController:(id)a3 didTransitionToState:(unint64_t)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  int v10;
  objc_super v11;

  v6 = a3;
  v7 = v6;
  if (a4 == 3)
  {
    objc_msgSend(v6, "me");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "leader");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v8, "isEqual:", v9);

    if (v10)
      -[COStateAddOn _constructMeshState](self, "_constructMeshState");
  }
  v11.receiver = self;
  v11.super_class = (Class)COStateAddOn;
  -[COMeshAddOn meshController:didTransitionToState:](&v11, sel_meshController_didTransitionToState_, v7, a4);

}

- (void)didAddToMeshController:(id)a3
{
  id v4;
  uint64_t v5;
  _QWORD v6[4];
  id v7;
  _QWORD v8[4];
  id v9;
  _QWORD v10[4];
  id v11;
  _QWORD v12[4];
  id v13;
  id location;
  objc_super v15;

  v4 = a3;
  v15.receiver = self;
  v15.super_class = (Class)COStateAddOn;
  -[COMeshAddOn didAddToMeshController:](&v15, sel_didAddToMeshController_, v4);
  objc_initWeak(&location, self);
  v5 = MEMORY[0x24BDAC760];
  v12[0] = MEMORY[0x24BDAC760];
  v12[1] = 3221225472;
  v12[2] = __39__COStateAddOn_didAddToMeshController___block_invoke;
  v12[3] = &unk_24D4B1170;
  objc_copyWeak(&v13, &location);
  objc_msgSend(v4, "registerHandler:forRequestClass:", v12, objc_opt_class());
  v10[0] = v5;
  v10[1] = 3221225472;
  v10[2] = __39__COStateAddOn_didAddToMeshController___block_invoke_2;
  v10[3] = &unk_24D4B1170;
  objc_copyWeak(&v11, &location);
  objc_msgSend(v4, "registerHandler:forRequestClass:", v10, objc_opt_class());
  v8[0] = v5;
  v8[1] = 3221225472;
  v8[2] = __39__COStateAddOn_didAddToMeshController___block_invoke_3;
  v8[3] = &unk_24D4B11C0;
  objc_copyWeak(&v9, &location);
  objc_msgSend(v4, "registerHandler:forNotificationClass:", v8, objc_opt_class());
  v6[0] = v5;
  v6[1] = 3221225472;
  v6[2] = __39__COStateAddOn_didAddToMeshController___block_invoke_4;
  v6[3] = &unk_24D4B11C0;
  objc_copyWeak(&v7, &location);
  objc_msgSend(v4, "registerHandler:forNotificationClass:", v6, objc_opt_class());
  objc_destroyWeak(&v7);
  objc_destroyWeak(&v9);
  objc_destroyWeak(&v11);
  objc_destroyWeak(&v13);
  objc_destroyWeak(&location);

}

void __39__COStateAddOn_didAddToMeshController___block_invoke(uint64_t a1, void *a2, void *a3)
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
    objc_msgSend(WeakRetained, "_handleStateReadRequest:callback:", v8, v5);

}

void __39__COStateAddOn_didAddToMeshController___block_invoke_2(uint64_t a1, void *a2, void *a3)
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
    objc_msgSend(WeakRetained, "_handleStateUpdateRequest:callback:", v8, v5);

}

void __39__COStateAddOn_didAddToMeshController___block_invoke_3(uint64_t a1, void *a2)
{
  id WeakRetained;
  void *v4;
  id v5;

  v5 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v4 = WeakRetained;
  if (WeakRetained)
    objc_msgSend(WeakRetained, "_handleStateNotification:", v5);

}

void __39__COStateAddOn_didAddToMeshController___block_invoke_4(uint64_t a1, void *a2)
{
  id WeakRetained;
  void *v4;
  id v5;

  v5 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v4 = WeakRetained;
  if (WeakRetained)
    objc_msgSend(WeakRetained, "_handleStateUpdateNotification:", v5);

}

- (void)willRemoveFromMeshController:(id)a3
{
  id v4;
  objc_super v5;

  v4 = a3;
  objc_msgSend(v4, "deregisterHandlerForRequestClass:", objc_opt_class());
  objc_msgSend(v4, "deregisterHandlerForRequestClass:", objc_opt_class());
  objc_msgSend(v4, "deregisterHandlerForNotificationClass:", objc_opt_class());
  objc_msgSend(v4, "deregisterHandlerForNotificationClass:", objc_opt_class());
  v5.receiver = self;
  v5.super_class = (Class)COStateAddOn;
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
  objc_super v10;

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
    -[COStateAddOn _constructMeshState](self, "_constructMeshState");
  v10.receiver = self;
  v10.super_class = (Class)COStateAddOn;
  -[COMeshAddOn didChangeNodesForMeshController:](&v10, sel_didChangeNodesForMeshController_, v4);

}

- (void)_constructMeshState
{
  NSObject *v3;
  id WeakRetained;
  _QWORD v5[7];
  id v6;
  id location;
  _QWORD v8[5];
  id v9;
  _QWORD v10[4];
  _QWORD v11[5];
  id v12;

  -[COMeshAddOn meshControllerQueue](self, "meshControllerQueue");
  v3 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v3);

  ++self->_stateConstructionGeneration;
  self->_isConstructingState = 1;
  v11[0] = 0;
  v11[1] = v11;
  v11[2] = 0x3032000000;
  v11[3] = __Block_byref_object_copy__19;
  v11[4] = __Block_byref_object_dispose__19;
  v12 = 0;
  v10[0] = 0;
  v10[1] = v10;
  v10[2] = 0x2020000000;
  v10[3] = 0;
  v8[0] = 0;
  v8[1] = v8;
  v8[2] = 0x3032000000;
  v8[3] = __Block_byref_object_copy__19;
  v8[4] = __Block_byref_object_dispose__19;
  v9 = 0;
  objc_initWeak(&location, self);
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 3221225472;
  v5[2] = __35__COStateAddOn__constructMeshState__block_invoke;
  v5[3] = &unk_24D4B34C0;
  objc_copyWeak(&v6, &location);
  v5[4] = v8;
  v5[5] = v11;
  v5[6] = v10;
  objc_msgSend(WeakRetained, "stateForAddOn:withCallback:", self, v5);

  objc_destroyWeak(&v6);
  objc_destroyWeak(&location);
  _Block_object_dispose(v8, 8);

  _Block_object_dispose(v10, 8);
  _Block_object_dispose(v11, 8);

}

void __35__COStateAddOn__constructMeshState__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id WeakRetained;
  void *v5;
  NSObject *v6;
  _QWORD v7[4];
  id v8;
  void *v9;
  uint64_t v10;
  __int128 v11;
  id v12;

  v3 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  v5 = WeakRetained;
  if (WeakRetained)
  {
    objc_msgSend(WeakRetained, "meshControllerQueue");
    v6 = objc_claimAutoreleasedReturnValue();
    v7[0] = MEMORY[0x24BDAC760];
    v7[1] = 3221225472;
    v7[2] = __35__COStateAddOn__constructMeshState__block_invoke_2;
    v7[3] = &unk_24D4B3498;
    v10 = *(_QWORD *)(a1 + 32);
    v8 = v3;
    v9 = v5;
    objc_copyWeak(&v12, (id *)(a1 + 56));
    v11 = *(_OWORD *)(a1 + 40);
    dispatch_async(v6, v7);

    objc_destroyWeak(&v12);
  }

}

void __35__COStateAddOn__constructMeshState__block_invoke_2(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  NSObject *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  COStateReadRequest *v9;
  void *v10;
  uint64_t v11;
  void (**v12)(_QWORD);
  void *v13;
  _BOOL4 v14;
  void *v15;
  void (**v16)(_QWORD);
  uint64_t v17;
  _QWORD v18[6];
  id v19[2];
  _QWORD v20[4];
  id v21;
  __int128 v22;
  id v23;
  _QWORD v24[5];
  id v25[2];
  uint8_t buf[4];
  void *v27;
  __int16 v28;
  uint64_t v29;
  __int16 v30;
  uint64_t v31;
  uint64_t v32;

  v32 = *MEMORY[0x24BDAC8D0];
  v2 = objc_msgSend(*(id *)(a1 + 32), "copy");
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

  COCoreLogForCategory(6);
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(*(id *)(a1 + 40), "meshController");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40);
    v8 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 32);
    *(_DWORD *)buf = 134218498;
    v27 = v6;
    v28 = 2112;
    v29 = v7;
    v30 = 2048;
    v31 = v8;
    _os_log_impl(&dword_215E92000, v5, OS_LOG_TYPE_DEFAULT, "%p constructing mesh post election. Self state = %@. generation = %lu ", buf, 0x20u);

  }
  v9 = objc_alloc_init(COStateReadRequest);
  v10 = *(void **)(*(_QWORD *)(a1 + 40) + 32);
  v11 = MEMORY[0x24BDAC760];
  v24[0] = MEMORY[0x24BDAC760];
  v24[1] = 3221225472;
  v24[2] = __35__COStateAddOn__constructMeshState__block_invoke_36;
  v24[3] = &unk_24D4B3420;
  objc_copyWeak(v25, (id *)(a1 + 72));
  v24[4] = *(_QWORD *)(a1 + 48);
  v25[1] = v10;
  v12 = (void (**)(_QWORD))MEMORY[0x2199F3D40](v24);
  objc_msgSend(*(id *)(a1 + 40), "meshController");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = v13 == 0;

  if (v14)
    v12[2](v12);
  objc_msgSend(*(id *)(a1 + 40), "meshController");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v20[0] = v11;
  v20[1] = 3221225472;
  v20[2] = __35__COStateAddOn__constructMeshState__block_invoke_37;
  v20[3] = &unk_24D4B3448;
  v22 = *(_OWORD *)(a1 + 56);
  objc_copyWeak(&v23, (id *)(a1 + 72));
  v16 = v12;
  v21 = v16;
  v18[0] = v11;
  v18[1] = 3221225472;
  v18[2] = __35__COStateAddOn__constructMeshState__block_invoke_2_39;
  v18[3] = &unk_24D4B3470;
  objc_copyWeak(v19, (id *)(a1 + 72));
  v17 = *(_QWORD *)(a1 + 48);
  v18[4] = *(_QWORD *)(a1 + 64);
  v18[5] = v17;
  v19[1] = v10;
  objc_msgSend(v15, "broadcastRequest:includingSelf:recipientsCallback:completionHandler:", v9, 0, v20, v18);

  objc_destroyWeak(v19);
  objc_destroyWeak(&v23);

  objc_destroyWeak(v25);
}

void __35__COStateAddOn__constructMeshState__block_invoke_36(uint64_t a1)
{
  _QWORD *WeakRetained;
  NSObject *v3;
  COStateNotification *v4;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    COCoreLogForCategory(6);
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
      __35__COStateAddOn__constructMeshState__block_invoke_36_cold_1(v3);

    v4 = -[COStateNotification initWithState:]([COStateNotification alloc], "initWithState:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40));
    objc_msgSend(WeakRetained, "_handleStateNotification:", v4);
    if (WeakRetained[4] == *(_QWORD *)(a1 + 48))
      objc_msgSend(WeakRetained, "_processOutstandingUpdateRequests");

  }
}

void __35__COStateAddOn__constructMeshState__block_invoke_37(uint64_t a1, void *a2)
{
  id WeakRetained;
  id v5;

  v5 = a2;
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), a2);
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = objc_msgSend(v5, "count");
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  if (WeakRetained && !objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), "count"))
    (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

}

void __35__COStateAddOn__constructMeshState__block_invoke_2_39(uint64_t a1, uint64_t a2, void *a3, void *a4, uint64_t a5)
{
  id v8;
  id v9;
  _QWORD *WeakRetained;
  NSObject *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  NSObject *v18;
  NSObject *v19;
  void *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t i;
  uint64_t v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t j;
  uint64_t v33;
  void *v34;
  uint64_t v35;
  void *v36;
  NSObject *v37;
  void *v38;
  void *v39;
  void *v40;
  uint64_t v41;
  _QWORD *v42;
  id v43;
  id v44;
  id obj;
  uint64_t v46;
  uint64_t v47;
  void *v48;
  NSObject *v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  _BYTE v58[128];
  uint8_t v59[128];
  uint8_t buf[4];
  void *v61;
  __int16 v62;
  id v63;
  __int16 v64;
  NSObject *v65;
  __int16 v66;
  uint64_t v67;
  uint64_t v68;

  v68 = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v9 = a4;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  if (WeakRetained)
  {
    if (a5)
    {
      COCoreLogForCategory(6);
      v11 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
        __35__COStateAddOn__constructMeshState__block_invoke_2_39_cold_1((uint64_t)v8, v11, v12, v13, v14, v15, v16, v17);
    }
    else
    {
      v43 = v9;
      objc_msgSend(v9, "state");
      v18 = objc_claimAutoreleasedReturnValue();
      COCoreLogForCategory(6);
      v19 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG))
      {
        objc_msgSend(WeakRetained, "meshController");
        v40 = (void *)objc_claimAutoreleasedReturnValue();
        v41 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) - 1;
        *(_DWORD *)buf = 134218754;
        v61 = v40;
        v62 = 2048;
        v63 = v8;
        v64 = 2112;
        v65 = v18;
        v66 = 2048;
        v67 = v41;
        _os_log_debug_impl(&dword_215E92000, v19, OS_LOG_TYPE_DEBUG, "%p received COStateReadResponse from %p. Response state = %@. Waiting for %lu more responses", buf, 0x2Au);

      }
      v42 = WeakRetained;
      v44 = v8;

      v49 = v18;
      -[NSObject allKeys](v18, "allKeys");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v48 = (void *)objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), "mutableCopy");
      v54 = 0u;
      v55 = 0u;
      v56 = 0u;
      v57 = 0u;
      obj = v20;
      v21 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v54, v59, 16);
      if (v21)
      {
        v22 = v21;
        v46 = *(_QWORD *)v55;
        v47 = a1;
        do
        {
          for (i = 0; i != v22; ++i)
          {
            if (*(_QWORD *)v55 != v46)
              objc_enumerationMutation(obj);
            v24 = *(_QWORD *)(*((_QWORD *)&v54 + 1) + 8 * i);
            objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), "objectForKeyedSubscript:", v24, v42);
            v25 = (void *)objc_claimAutoreleasedReturnValue();
            if (v25)
            {
              objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), "objectForKeyedSubscript:", v24);
              v26 = (void *)objc_claimAutoreleasedReturnValue();
              v27 = (void *)objc_msgSend(v26, "mutableCopy");

            }
            else
            {
              objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
              v27 = (void *)objc_claimAutoreleasedReturnValue();
            }

            -[NSObject objectForKeyedSubscript:](v49, "objectForKeyedSubscript:", v24);
            v28 = (void *)objc_claimAutoreleasedReturnValue();
            v50 = 0u;
            v51 = 0u;
            v52 = 0u;
            v53 = 0u;
            v29 = objc_msgSend(v28, "countByEnumeratingWithState:objects:count:", &v50, v58, 16);
            if (v29)
            {
              v30 = v29;
              v31 = *(_QWORD *)v51;
              do
              {
                for (j = 0; j != v30; ++j)
                {
                  if (*(_QWORD *)v51 != v31)
                    objc_enumerationMutation(v28);
                  v33 = *(_QWORD *)(*((_QWORD *)&v50 + 1) + 8 * j);
                  objc_msgSend(v28, "objectForKeyedSubscript:", v33);
                  v34 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v27, "setObject:forKey:", v34, v33);

                }
                v30 = objc_msgSend(v28, "countByEnumeratingWithState:objects:count:", &v50, v58, 16);
              }
              while (v30);
            }
            objc_msgSend(v48, "setObject:forKey:", v27, v24);

            a1 = v47;
          }
          v22 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v54, v59, 16);
        }
        while (v22);
      }

      v35 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
      v36 = *(void **)(v35 + 40);
      *(_QWORD *)(v35 + 40) = v48;

      v9 = v43;
      v8 = v44;
      WeakRetained = v42;
      v11 = v49;
    }

    if (!--*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
    {
      objc_msgSend(WeakRetained, "_broadcastMeshState:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40));
      if (WeakRetained[4] == *(_QWORD *)(a1 + 56))
      {
        COCoreLogForCategory(6);
        v37 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v37, OS_LOG_TYPE_DEFAULT))
        {
          objc_msgSend(WeakRetained, "meshController");
          v38 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v38, "meshName");
          v39 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138412290;
          v61 = v39;
          _os_log_impl(&dword_215E92000, v37, OS_LOG_TYPE_DEFAULT, "Done with all outstanding mesh constructions %@, processing outstanding update requests if any", buf, 0xCu);

        }
        objc_msgSend(WeakRetained, "_processOutstandingUpdateRequests");
      }
    }
  }

}

- (void)_processOutstandingUpdateRequests
{
  NSObject *v3;
  void *v4;
  NSMutableArray *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t j;
  void *v15;
  void *v16;
  void *v17;
  NSObject *v18;
  uint8_t v19[16];
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  _BYTE v28[128];
  _BYTE v29[128];
  uint64_t v30;

  v30 = *MEMORY[0x24BDAC8D0];
  -[COMeshAddOn meshControllerQueue](self, "meshControllerQueue");
  v3 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v3);

  self->_isConstructingState = 0;
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[NSMutableArray count](self->_outstandingUpdateRequests, "count"))
  {
    v26 = 0u;
    v27 = 0u;
    v24 = 0u;
    v25 = 0u;
    v5 = self->_outstandingUpdateRequests;
    v6 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v24, v29, 16);
    if (v6)
    {
      v7 = v6;
      v8 = *(_QWORD *)v25;
      do
      {
        for (i = 0; i != v7; ++i)
        {
          if (*(_QWORD *)v25 != v8)
            objc_enumerationMutation(v5);
          objc_msgSend(v4, "addObject:", *(_QWORD *)(*((_QWORD *)&v24 + 1) + 8 * i));
        }
        v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v24, v29, 16);
      }
      while (v7);
    }

  }
  -[NSMutableArray removeAllObjects](self->_outstandingUpdateRequests, "removeAllObjects");
  v22 = 0u;
  v23 = 0u;
  v20 = 0u;
  v21 = 0u;
  v10 = v4;
  v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v20, v28, 16);
  if (v11)
  {
    v12 = v11;
    v13 = *(_QWORD *)v21;
    do
    {
      for (j = 0; j != v12; ++j)
      {
        if (*(_QWORD *)v21 != v13)
          objc_enumerationMutation(v10);
        v15 = *(void **)(*((_QWORD *)&v20 + 1) + 8 * j);
        objc_msgSend(v15, "request");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "callback");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        -[COStateAddOn _handleStateUpdateRequest:callback:](self, "_handleStateUpdateRequest:callback:", v16, v17);

      }
      v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v20, v28, 16);
    }
    while (v12);
  }

  COCoreLogForCategory(6);
  v18 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v19 = 0;
    _os_log_impl(&dword_215E92000, v18, OS_LOG_TYPE_DEFAULT, "Done processing outstanding update requests", v19, 2u);
  }

}

- (void)_broadcastMeshState:(id)a3
{
  id v4;
  NSObject *v5;
  COStateNotification *v6;
  NSObject *v7;
  void *v8;
  uint8_t v9[16];

  v4 = a3;
  -[COMeshAddOn meshControllerQueue](self, "meshControllerQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v5);

  v6 = -[COStateNotification initWithState:]([COStateNotification alloc], "initWithState:", v4);
  COCoreLogForCategory(6);
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v9 = 0;
    _os_log_impl(&dword_215E92000, v7, OS_LOG_TYPE_DEFAULT, "Sending state notification to all clients", v9, 2u);
  }

  -[COMeshAddOn meshController](self, "meshController");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "sendNotification:", v6);

  -[COStateAddOn _handleStateNotification:](self, "_handleStateNotification:", v6);
}

- (void)_handleStateNotification:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  void *v7;
  char v8;
  NSObject *v9;
  void *v10;
  void *v11;
  void *v12;
  _QWORD v13[5];
  id v14;
  uint8_t buf[4];
  void *v16;
  __int16 v17;
  void *v18;
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  -[COMeshAddOn meshControllerQueue](self, "meshControllerQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v5);

  objc_msgSend(v4, "state");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  -[COStateAddOn meshState](self, "meshState");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "isEqualToDictionary:", v6);

  if ((v8 & 1) != 0)
  {
    COCoreLogForCategory(6);
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      -[COMeshAddOn meshController](self, "meshController");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      -[COStateAddOn meshState](self, "meshState");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 134218242;
      v16 = v10;
      v17 = 2112;
      v18 = v11;
      _os_log_impl(&dword_215E92000, v9, OS_LOG_TYPE_DEFAULT, "%p handling state notification. No changes to current mesh state %@", buf, 0x16u);

    }
  }
  else
  {
    -[COStateAddOn meshState](self, "meshState");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13[0] = MEMORY[0x24BDAC760];
    v13[1] = 3221225472;
    v13[2] = __41__COStateAddOn__handleStateNotification___block_invoke;
    v13[3] = &unk_24D4B34E8;
    v13[4] = self;
    v14 = v6;
    determineStateChanges(v12, v14, v13);

  }
}

void __41__COStateAddOn__handleStateNotification___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  id WeakRetained;
  int v12;
  void *v13;
  __int16 v14;
  void *v15;
  __int16 v16;
  uint64_t v17;
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  v6 = a2;
  COCoreLogForCategory(6);
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(*(id *)(a1 + 32), "meshController");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "meshState");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = *(_QWORD *)(a1 + 40);
    v12 = 134218498;
    v13 = v8;
    v14 = 2112;
    v15 = v9;
    v16 = 2112;
    v17 = v10;
    _os_log_impl(&dword_215E92000, v7, OS_LOG_TYPE_DEFAULT, "%p handling state notification. Updating current mesh state %@ with new mesh state %@", (uint8_t *)&v12, 0x20u);

  }
  objc_msgSend(*(id *)(a1 + 32), "setMeshState:", *(_QWORD *)(a1 + 40));
  WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 56));
  objc_msgSend(WeakRetained, "addOn:receivedUpdates:removals:", *(_QWORD *)(a1 + 32), v6, v5);

}

- (void)_handleStateUpdateNotification:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  id v7;

  v4 = a3;
  -[COMeshAddOn meshControllerQueue](self, "meshControllerQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v5);

  objc_msgSend(v4, "updates");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "removals");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  -[COStateAddOn _handleUpdates:removals:](self, "_handleUpdates:removals:", v7, v6);
}

- (void)_handleStateReadRequest:(id)a3 callback:(id)a4
{
  id v5;
  NSObject *v6;
  id WeakRetained;
  id v8;
  _QWORD v9[4];
  id v10;

  v5 = a4;
  -[COMeshAddOn meshControllerQueue](self, "meshControllerQueue");
  v6 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v6);

  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  v9[0] = MEMORY[0x24BDAC760];
  v9[1] = 3221225472;
  v9[2] = __49__COStateAddOn__handleStateReadRequest_callback___block_invoke;
  v9[3] = &unk_24D4B3510;
  v10 = v5;
  v8 = v5;
  objc_msgSend(WeakRetained, "stateForAddOn:withCallback:", self, v9);

}

void __49__COStateAddOn__handleStateReadRequest_callback___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  COStateReadResponse *v4;

  v3 = a2;
  v4 = -[COStateReadResponse initWithState:]([COStateReadResponse alloc], "initWithState:", v3);

  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)_handleStateUpdateRequest:(id)a3 callback:(id)a4
{
  id v6;
  void (**v7)(id, COOutstandingRequests *, _QWORD);
  NSObject *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  char v13;
  NSObject *v14;
  void *v15;
  void *v16;
  NSObject *v17;
  COOutstandingRequests *v18;
  void *v19;
  COStateUpdateNotification *v20;
  void *v21;
  void *v22;
  COStateUpdateNotification *v23;
  void *v24;
  void *v25;
  void *v26;
  int v27;
  COStateAddOn *v28;
  __int16 v29;
  void *v30;
  __int16 v31;
  void *v32;
  uint64_t v33;

  v33 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = (void (**)(id, COOutstandingRequests *, _QWORD))a4;
  -[COMeshAddOn meshControllerQueue](self, "meshControllerQueue");
  v8 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v8);

  -[COMeshAddOn meshController](self, "meshController");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "me");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[COMeshAddOn meshController](self, "meshController");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "leader");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v10, "isEqual:", v12);

  if ((v13 & 1) != 0)
  {
    COCoreLogForCategory(6);
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(v6, "updates");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "removals");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v27 = 134218498;
      v28 = self;
      v29 = 2112;
      v30 = v15;
      v31 = 2112;
      v32 = v16;
      _os_log_impl(&dword_215E92000, v14, OS_LOG_TYPE_DEFAULT, "%p leader processing state update request [updates = %@, removals = %@]", (uint8_t *)&v27, 0x20u);

    }
    if (self->_isConstructingState)
    {
      COCoreLogForCategory(6);
      v17 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(v27) = 0;
        _os_log_impl(&dword_215E92000, v17, OS_LOG_TYPE_DEFAULT, "We are currently in the middle of constructing the mesh state. Defering update requests", (uint8_t *)&v27, 2u);
      }

      v18 = objc_alloc_init(COOutstandingRequests);
      -[COOutstandingRequests setRequest:](v18, "setRequest:", v6);
      -[COOutstandingRequests setCallback:](v18, "setCallback:", v7);
      -[NSMutableArray addObject:](self->_outstandingUpdateRequests, "addObject:", v18);
    }
    else
    {
      v18 = objc_alloc_init(COStateUpdateResponse);
      v7[2](v7, v18, 0);
      v20 = [COStateUpdateNotification alloc];
      objc_msgSend(v6, "updates");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "removals");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      v23 = -[COStateUpdateNotification initWithUpdates:removals:](v20, "initWithUpdates:removals:", v21, v22);

      -[COMeshAddOn meshController](self, "meshController");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "sendNotification:", v23);

      objc_msgSend(v6, "updates");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "removals");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      -[COStateAddOn _handleUpdates:removals:](self, "_handleUpdates:removals:", v25, v26);

    }
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", CFSTR("COMeshNodeErrorDomain"), -4002, 0);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    ((void (**)(id, COOutstandingRequests *, void *))v7)[2](v7, 0, v19);

  }
}

- (NSDictionary)meshState
{
  return self->_meshState;
}

- (void)setMeshState:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 64);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_meshState, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_outstandingUpdateRequests, 0);
}

- (void)removeKeyPaths:suite:withCallback:.cold.1()
{
  NSObject *v0;
  uint8_t v1[24];
  uint64_t v2;

  v2 = *MEMORY[0x24BDAC8D0];
  OUTLINED_FUNCTION_6_0();
  OUTLINED_FUNCTION_9(&dword_215E92000, v0, (uint64_t)v0, "Removing keyPath %@ for suite %@", v1);
  OUTLINED_FUNCTION_2_0();
}

- (void)sendStateUpdates:removals:withCallback:.cold.1()
{
  NSObject *v0;
  uint8_t v1[24];
  uint64_t v2;

  v2 = *MEMORY[0x24BDAC8D0];
  OUTLINED_FUNCTION_6_0();
  OUTLINED_FUNCTION_9(&dword_215E92000, v0, (uint64_t)v0, "Updating state of the mesh. updates = %@ removals = %@", v1);
  OUTLINED_FUNCTION_2_0();
}

- (void)_sendRequest:(uint64_t)a3 withRetryCount:(uint64_t)a4 withCallback:(uint64_t)a5 .cold.1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_215E92000, a2, a3, "Failed to send request %@ too many times", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_2_0();
}

void __57__COStateAddOn__sendRequest_withRetryCount_withCallback___block_invoke_cold_1(uint64_t a1, NSObject *a2, uint64_t a3)
{
  uint64_t v3;
  uint64_t v4;
  int v5;
  uint64_t v6;
  __int16 v7;
  uint64_t v8;
  uint64_t v9;

  v9 = *MEMORY[0x24BDAC8D0];
  v3 = *(_QWORD *)(a1 + 32);
  v4 = *(_QWORD *)(a1 + 56) - 1;
  v5 = 138412546;
  v6 = v3;
  v7 = 2048;
  v8 = v4;
  OUTLINED_FUNCTION_9(&dword_215E92000, a2, a3, "Failed to send request %@.  Remaining retries = %ld", (uint8_t *)&v5);
  OUTLINED_FUNCTION_2_0();
}

void __35__COStateAddOn__constructMeshState__block_invoke_36_cold_1(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_debug_impl(&dword_215E92000, log, OS_LOG_TYPE_DEBUG, "We are the only ones in the mesh", v1, 2u);
}

void __35__COStateAddOn__constructMeshState__block_invoke_2_39_cold_1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_215E92000, a2, a3, "Failed to get state from node %@", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_2_0();
}

@end
