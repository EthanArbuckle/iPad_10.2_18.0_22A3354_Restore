@implementation CRAccNavProvider

- (CRAccNavProvider)initWithDelegate:(id)a3
{
  id v5;
  CRAccNavProvider *v6;
  NSObject *v7;
  dispatch_queue_t v8;
  OS_dispatch_queue *workQueue;
  uint64_t v10;
  NSMutableDictionary *accessoriesIndexed;
  uint64_t v12;
  NSMutableDictionary *activeComponentsIndexed;
  uint64_t v14;
  NSMutableDictionary *activeAccessoryComponentsIndexed;
  uint64_t v16;
  ACCNavigationProvider *iapNavigation;
  objc_super v19;
  uint8_t buf[4];
  CRAccNavProvider *v21;
  uint64_t v22;

  v22 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  v19.receiver = self;
  v19.super_class = (Class)CRAccNavProvider;
  v6 = -[CRAccNavProvider init](&v19, sel_init);
  if (v6)
  {
    CarNavLogging();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      v21 = v6;
      _os_log_impl(&dword_23785A000, v7, OS_LOG_TYPE_DEFAULT, "%{public}@ Setting up iAP Navigation", buf, 0xCu);
    }

    objc_storeStrong((id *)&v6->_delegate, a3);
    v8 = dispatch_queue_create("com.apple.carkit.AccNavProvider", 0);
    workQueue = v6->_workQueue;
    v6->_workQueue = (OS_dispatch_queue *)v8;

    v6->_accessoryLock._os_unfair_lock_opaque = 0;
    v10 = objc_opt_new();
    accessoriesIndexed = v6->_accessoriesIndexed;
    v6->_accessoriesIndexed = (NSMutableDictionary *)v10;

    v12 = objc_opt_new();
    activeComponentsIndexed = v6->_activeComponentsIndexed;
    v6->_activeComponentsIndexed = (NSMutableDictionary *)v12;

    v14 = objc_opt_new();
    activeAccessoryComponentsIndexed = v6->_activeAccessoryComponentsIndexed;
    v6->_activeAccessoryComponentsIndexed = (NSMutableDictionary *)v14;

    v16 = objc_msgSend(objc_alloc(MEMORY[0x24BE00BD0]), "initWithDelegate:", v6);
    iapNavigation = v6->_iapNavigation;
    v6->_iapNavigation = (ACCNavigationProvider *)v16;

  }
  return v6;
}

- (NSArray)activeComponents
{
  os_unfair_lock_s *p_accessoryLock;
  void *v4;

  p_accessoryLock = &self->_accessoryLock;
  os_unfair_lock_lock(&self->_accessoryLock);
  -[CRAccNavProvider _locked_activeComponents](self, "_locked_activeComponents");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  os_unfair_lock_unlock(p_accessoryLock);
  return (NSArray *)v4;
}

- (id)_locked_activeComponents
{
  void *v2;
  void *v3;
  void *v4;

  -[CRAccNavProvider activeComponentsIndexed](self, "activeComponentsIndexed");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "allValues");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "sortedArrayUsingComparator:", &__block_literal_global_0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

uint64_t __44__CRAccNavProvider__locked_activeComponents__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;

  v4 = a3;
  objc_msgSend(a2, "componentIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "componentIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = objc_msgSend(v5, "compare:", v6);
  return v7;
}

- (void)sendInfo:(id)a3 toComponentUID:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  char v15;
  NSObject *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  void *v20;
  NSObject *v21;
  NSObject *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  _QWORD block[4];
  NSObject *v28;
  CRAccNavProvider *v29;
  id v30;
  id v31;
  id v32;
  uint8_t buf[4];
  CRAccNavProvider *v34;
  __int16 v35;
  void *v36;
  __int16 v37;
  uint64_t v38;
  __int16 v39;
  id v40;
  __int16 v41;
  void *v42;
  __int16 v43;
  void *v44;
  uint64_t v45;

  v45 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  os_unfair_lock_lock(&self->_accessoryLock);
  -[CRAccNavProvider activeComponentsIndexed](self, "activeComponentsIndexed");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "objectForKeyedSubscript:", v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
  {
    -[CRAccNavProvider accessoriesIndexed](self, "accessoriesIndexed");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "accessoryUID");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "objectForKeyedSubscript:", v11);
    v12 = (id)objc_claimAutoreleasedReturnValue();

    os_unfair_lock_unlock(&self->_accessoryLock);
    objc_msgSend(v9, "component");
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    if (v13 && v12)
    {
      objc_msgSend(v9, "component");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = objc_msgSend(v14, "isEnabled");

      if ((v15 & 1) == 0)
      {
        CarNavLogging();
        v16 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
        {
          objc_msgSend(v7, "UUIDString");
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v9, "component");
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          v19 = objc_msgSend(v18, "identifier");
          objc_msgSend(v12, "accessoryUID");
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138544130;
          v34 = self;
          v35 = 2114;
          v36 = v17;
          v37 = 2048;
          v38 = v19;
          v39 = 2114;
          v40 = v20;
          _os_log_impl(&dword_23785A000, v16, OS_LOG_TYPE_INFO, "%{public}@: component %{public}@ %lu from %{public}@ not enabled", buf, 0x2Au);

        }
      }
      -[CRAccNavProvider workQueue](self, "workQueue");
      v21 = objc_claimAutoreleasedReturnValue();
      block[0] = MEMORY[0x24BDAC760];
      block[1] = 3221225472;
      block[2] = __44__CRAccNavProvider_sendInfo_toComponentUID___block_invoke;
      block[3] = &unk_250963A50;
      v28 = v6;
      v29 = self;
      v12 = v12;
      v30 = v12;
      v31 = v7;
      v32 = v9;
      dispatch_async(v21, block);

      v22 = v28;
      goto LABEL_12;
    }
  }
  else
  {
    os_unfair_lock_unlock(&self->_accessoryLock);
    v12 = 0;
  }
  CarNavLogging();
  v22 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v22, OS_LOG_TYPE_FAULT))
  {
    objc_msgSend(v7, "UUIDString");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "component");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    -[CRAccNavProvider _componentKeys](self, "_componentKeys");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "valueForKey:", CFSTR("UUIDString"));
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138544642;
    v34 = self;
    v35 = 2114;
    v36 = v23;
    v37 = 2048;
    v38 = (uint64_t)v9;
    v39 = 2048;
    v40 = v12;
    v41 = 2048;
    v42 = v24;
    v43 = 2114;
    v44 = v26;
    _os_log_fault_impl(&dword_23785A000, v22, OS_LOG_TYPE_FAULT, "%{public}@: missing component information.  uid=%{public}@ component=%p accessory=%p component.component=%p compontentsIndexed=%{public}@", buf, 0x3Eu);

  }
LABEL_12:

}

void __44__CRAccNavProvider_sendInfo_toComponentUID___block_invoke(uint64_t a1)
{
  id *v2;
  NSObject *v3;
  NSObject *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  NSObject *v9;
  void *v10;
  NSObject *v11;
  void *v12;
  int v13;
  void *v14;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  void *v18;
  void *v19;
  int v20;
  void *v21;
  uint64_t v22;
  void *v23;
  uint64_t v24;
  void *v25;
  void *v26;
  uint64_t v27;
  uint64_t v28;
  void *v29;
  void *v30;
  uint8_t buf[4];
  uint64_t v32;
  __int16 v33;
  int v34;
  __int16 v35;
  void *v36;
  __int16 v37;
  uint64_t v38;
  __int16 v39;
  uint64_t v40;
  __int16 v41;
  void *v42;
  _QWORD v43[2];

  v43[1] = *MEMORY[0x24BDAC8D0];
  objc_opt_class();
  v2 = (id *)(a1 + 32);
  v3 = *(id *)(a1 + 32);
  if (v3 && (objc_opt_isKindOfClass() & 1) != 0)
  {
    CarNavLogging();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
      __44__CRAccNavProvider_sendInfo_toComponentUID___block_invoke_cold_2(a1, (id *)(a1 + 32));

    v5 = *(void **)(a1 + 48);
    -[NSObject routeGuidance](v3, "routeGuidance");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 64), "component");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v43[0] = v7;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v43, 1);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "updateRouteGuidanceInfo:componentList:", v6, v8);
LABEL_16:

    goto LABEL_19;
  }

  objc_opt_class();
  v3 = *v2;
  if (v3 && (objc_opt_isKindOfClass() & 1) != 0)
  {
    CarNavLogging();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
    {
      v27 = *(_QWORD *)(a1 + 40);
      v13 = -[NSObject index](v3, "index");
      objc_msgSend(*(id *)(a1 + 48), "accessoryUID");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = *(_QWORD *)(a1 + 56);
      objc_msgSend(*(id *)(a1 + 64), "component");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = objc_msgSend(v16, "identifier");
      objc_msgSend(*(id *)(a1 + 32), "accNavInfo");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "cr_dictionary");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138544642;
      v32 = v27;
      v33 = 1024;
      v34 = v13;
      v35 = 2114;
      v36 = v14;
      v37 = 2114;
      v38 = v15;
      v39 = 2048;
      v40 = v17;
      v41 = 2114;
      v42 = v19;
      _os_log_debug_impl(&dword_23785A000, v9, OS_LOG_TYPE_DEBUG, "%{public}@: sending maneuver index=%d accessoryUID=%{public}@ componentUID=%{public}@ component.identifier=%lu parameters=%{public}@", buf, 0x3Au);

    }
    v10 = *(void **)(a1 + 48);
    -[NSObject maneuver](v3, "maneuver");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 64), "component");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v30 = v7;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v30, 1);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "updateManeuverInfo:componentList:", v6, v8);
    goto LABEL_16;
  }

  objc_opt_class();
  v3 = *v2;
  if (v3 && (objc_opt_isKindOfClass() & 1) != 0)
  {
    CarNavLogging();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
    {
      v28 = *(_QWORD *)(a1 + 40);
      v20 = -[NSObject index](v3, "index");
      objc_msgSend(*(id *)(a1 + 48), "accessoryUID");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v22 = *(_QWORD *)(a1 + 56);
      objc_msgSend(*(id *)(a1 + 64), "component");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      v24 = objc_msgSend(v23, "identifier");
      objc_msgSend(*(id *)(a1 + 32), "accNavInfo");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v25, "cr_dictionary");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138544642;
      v32 = v28;
      v33 = 1024;
      v34 = v20;
      v35 = 2114;
      v36 = v21;
      v37 = 2114;
      v38 = v22;
      v39 = 2048;
      v40 = v24;
      v41 = 2114;
      v42 = v26;
      _os_log_debug_impl(&dword_23785A000, v11, OS_LOG_TYPE_DEBUG, "%{public}@: sending laneGuidance index=%d accessoryUID=%{public}@ componentUID=%{public}@ component.identifier=%lu parameters=%{public}@", buf, 0x3Au);

    }
    v12 = *(void **)(a1 + 48);
    -[NSObject laneGuidance](v3, "laneGuidance");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 64), "component");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v29 = v7;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v29, 1);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "updateLaneGuidanceInfo:componentList:", v6, v8);
    goto LABEL_16;
  }

  CarNavLogging();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
    __44__CRAccNavProvider_sendInfo_toComponentUID___block_invoke_cold_1(a1, (id *)(a1 + 32));
LABEL_19:

}

- (void)_broadcastRouteGuidance:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  os_unfair_lock_t lock;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  void *v23;
  _BYTE v24[128];
  uint64_t v25;

  v25 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  CarNavLogging();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    -[CRAccNavProvider _broadcastRouteGuidance:].cold.1((uint64_t)self, v4, v5);

  lock = &self->_accessoryLock;
  os_unfair_lock_lock(&self->_accessoryLock);
  v21 = 0u;
  v22 = 0u;
  v19 = 0u;
  v20 = 0u;
  -[CRAccNavProvider activeComponentsIndexed](self, "activeComponentsIndexed");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "allValues");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v19, v24, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v20;
    do
    {
      for (i = 0; i != v9; ++i)
      {
        if (*(_QWORD *)v20 != v10)
          objc_enumerationMutation(v7);
        v12 = *(void **)(*((_QWORD *)&v19 + 1) + 8 * i);
        -[CRAccNavProvider accessoriesIndexed](self, "accessoriesIndexed", lock);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "accessoryUID");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "objectForKeyedSubscript:", v14);
        v15 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v12, "component");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        v23 = v16;
        objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v23, 1);
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "updateRouteGuidanceInfo:componentList:", v4, v17);

      }
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v19, v24, 16);
    }
    while (v9);
  }

  os_unfair_lock_unlock(lock);
}

- (void)resetActiveComponents
{
  NSObject *v3;
  _QWORD block[5];

  -[CRAccNavProvider workQueue](self, "workQueue");
  v3 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __41__CRAccNavProvider_resetActiveComponents__block_invoke;
  block[3] = &unk_250963A78;
  block[4] = self;
  dispatch_async(v3, block);

}

void __41__CRAccNavProvider_resetActiveComponents__block_invoke(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  id v4;
  int v5;
  uint64_t v6;
  uint64_t v7;

  v7 = *MEMORY[0x24BDAC8D0];
  CarNavLogging();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    v3 = *(_QWORD *)(a1 + 32);
    v5 = 138543362;
    v6 = v3;
    _os_log_impl(&dword_23785A000, v2, OS_LOG_TYPE_DEFAULT, "%{public}@: resetActiveComponents", (uint8_t *)&v5, 0xCu);
  }

  v4 = objc_alloc_init(MEMORY[0x24BE00BD8]);
  objc_msgSend(v4, "setInfo:data:", 1, &unk_2509660B0);
  objc_msgSend(*(id *)(a1 + 32), "_broadcastRouteGuidance:", v4);

}

- (void)sendNoSupportForAppIdentifier:(id)a3
{
  id v4;
  void *v5;
  NSObject *v6;
  _QWORD block[5];
  id v8;
  id v9;

  v4 = a3;
  objc_msgSend((id)objc_opt_class(), "_localizedNameForIdentifier:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    -[CRAccNavProvider workQueue](self, "workQueue");
    v6 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __50__CRAccNavProvider_sendNoSupportForAppIdentifier___block_invoke;
    block[3] = &unk_250963AA0;
    block[4] = self;
    v8 = v4;
    v9 = v5;
    dispatch_async(v6, block);

  }
  else
  {
    -[CRAccNavProvider resetActiveComponents](self, "resetActiveComponents");
  }

}

void __50__CRAccNavProvider_sendNoSupportForAppIdentifier___block_invoke(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  uint64_t v4;
  id v5;
  int v6;
  uint64_t v7;
  __int16 v8;
  uint64_t v9;
  uint64_t v10;

  v10 = *MEMORY[0x24BDAC8D0];
  CarNavLogging();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    v3 = *(_QWORD *)(a1 + 32);
    v4 = *(_QWORD *)(a1 + 40);
    v6 = 138543618;
    v7 = v3;
    v8 = 2114;
    v9 = v4;
    _os_log_impl(&dword_23785A000, v2, OS_LOG_TYPE_DEFAULT, "%{public}@: sendNoSupportForAppIdentifier:%{public}@", (uint8_t *)&v6, 0x16u);
  }

  v5 = objc_alloc_init(MEMORY[0x24BE00BD8]);
  objc_msgSend(v5, "setInfo:data:", 19, *(_QWORD *)(a1 + 48));
  objc_msgSend(v5, "setInfo:data:", 20, MEMORY[0x24BDBD1C0]);
  objc_msgSend(*(id *)(a1 + 32), "_broadcastRouteGuidance:", v5);

}

- (void)navigation:(id)a3 accessoryAttached:(id)a4
{
  id v5;
  NSObject *v6;
  int v7;
  id v8;
  uint64_t v9;

  v9 = *MEMORY[0x24BDAC8D0];
  v5 = a4;
  CarNavLogging();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v7 = 138543362;
    v8 = v5;
    _os_log_impl(&dword_23785A000, v6, OS_LOG_TYPE_DEFAULT, "iAP Accessory is available %{public}@", (uint8_t *)&v7, 0xCu);
  }

  -[CRAccNavProvider _addAccessoryIfNeeded:](self, "_addAccessoryIfNeeded:", v5);
}

- (void)navigation:(id)a3 accessoryDetached:(id)a4
{
  id v5;
  NSObject *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t i;
  uint64_t v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  NSObject *v27;
  void *v28;
  void *v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  uint8_t v34[128];
  uint8_t buf[4];
  id v36;
  __int16 v37;
  void *v38;
  uint64_t v39;

  v39 = *MEMORY[0x24BDAC8D0];
  v5 = a4;
  os_unfair_lock_lock(&self->_accessoryLock);
  CarNavLogging();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    -[CRAccNavProvider _locked_activeComponents](self, "_locked_activeComponents");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v36 = v5;
    v37 = 2114;
    v38 = v7;
    _os_log_impl(&dword_23785A000, v6, OS_LOG_TYPE_DEFAULT, "iAP Accessory is unavailable %{public}@ activeComponents=%{public}@", buf, 0x16u);

  }
  -[CRAccNavProvider accessoriesIndexed](self, "accessoriesIndexed");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "accessoryUID");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "removeObjectForKey:", v9);

  -[CRAccNavProvider activeAccessoryComponentsIndexed](self, "activeAccessoryComponentsIndexed");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "accessoryUID");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "objectForKeyedSubscript:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v12, "count");

  if (v13)
  {
    v32 = 0u;
    v33 = 0u;
    v30 = 0u;
    v31 = 0u;
    -[CRAccNavProvider activeAccessoryComponentsIndexed](self, "activeAccessoryComponentsIndexed", 0);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "accessoryUID");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "objectForKeyedSubscript:", v15);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "allValues");
    v17 = (void *)objc_claimAutoreleasedReturnValue();

    v18 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v30, v34, 16);
    if (v18)
    {
      v19 = v18;
      v20 = *(_QWORD *)v31;
      do
      {
        for (i = 0; i != v19; ++i)
        {
          if (*(_QWORD *)v31 != v20)
            objc_enumerationMutation(v17);
          v22 = *(_QWORD *)(*((_QWORD *)&v30 + 1) + 8 * i);
          -[CRAccNavProvider activeComponentsIndexed](self, "activeComponentsIndexed");
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v23, "removeObjectForKey:", v22);

        }
        v19 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v30, v34, 16);
      }
      while (v19);
    }

  }
  -[CRAccNavProvider activeAccessoryComponentsIndexed](self, "activeAccessoryComponentsIndexed");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "accessoryUID");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "removeObjectForKey:", v25);

  -[CRAccNavProvider _locked_activeComponents](self, "_locked_activeComponents");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  CarNavLogging();
  v27 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
  {
    -[CRAccNavProvider _locked_activeComponents](self, "_locked_activeComponents");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v36 = v5;
    v37 = 2114;
    v38 = v28;
    _os_log_impl(&dword_23785A000, v27, OS_LOG_TYPE_DEFAULT, "iAP Accessory removed %{public}@, new activeComponents=%{public}@", buf, 0x16u);

  }
  os_unfair_lock_unlock(&self->_accessoryLock);
  if (v13)
  {
    -[CRAccNavProvider delegate](self, "delegate");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "session:didUpdateActiveComponents:", self, v26);

  }
}

- (void)navigation:(id)a3 startRouteGuidance:(id)a4 componentList:(id)a5
{
  id v7;
  id v8;
  NSObject *v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t i;
  void *v20;
  void *v21;
  void *v22;
  CRAccNavComponent *v23;
  void *v24;
  CRAccNavComponent *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  os_unfair_lock_s *lock;
  os_unfair_lock_s *locka;
  void *v34;
  CRAccNavProvider *v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  uint8_t v40[128];
  uint8_t buf[4];
  id v42;
  __int16 v43;
  id v44;
  uint64_t v45;

  v45 = *MEMORY[0x24BDAC8D0];
  v7 = a4;
  v8 = a5;
  CarNavLogging();
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543618;
    v42 = v7;
    v43 = 2114;
    v44 = v8;
    _os_log_impl(&dword_23785A000, v9, OS_LOG_TYPE_DEFAULT, "iAP Accessory did enable navigation updates %{public}@ components=%{public}@", buf, 0x16u);
  }

  lock = &self->_accessoryLock;
  os_unfair_lock_lock(&self->_accessoryLock);
  -[CRAccNavProvider _locked_addAccessoryIfNeeded:](self, "_locked_addAccessoryIfNeeded:", v7);
  v10 = v8;
  v34 = v10;
  if (!v10)
  {
    objc_msgSend(v7, "componentList", lock, 0);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "allValues");
    v10 = (id)objc_claimAutoreleasedReturnValue();

  }
  v35 = self;
  -[CRAccNavProvider activeAccessoryComponentsIndexed](self, "activeAccessoryComponentsIndexed", lock);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "accessoryUID");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "objectForKeyedSubscript:", v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  v38 = 0u;
  v39 = 0u;
  v36 = 0u;
  v37 = 0u;
  v15 = v10;
  v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v36, v40, 16);
  if (v16)
  {
    v17 = v16;
    v18 = *(_QWORD *)v37;
    do
    {
      for (i = 0; i != v17; ++i)
      {
        if (*(_QWORD *)v37 != v18)
          objc_enumerationMutation(v15);
        v20 = *(void **)(*((_QWORD *)&v36 + 1) + 8 * i);
        objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", objc_msgSend(v20, "identifier"));
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "objectForKeyedSubscript:", v21);
        v22 = (void *)objc_claimAutoreleasedReturnValue();

        if (!v22)
        {
          v23 = [CRAccNavComponent alloc];
          objc_msgSend(v7, "accessoryUID");
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          v25 = -[CRAccNavComponent initWithAccessoryUID:component:](v23, "initWithAccessoryUID:component:", v24, v20);

          -[CRAccNavProvider activeComponentsIndexed](v35, "activeComponentsIndexed");
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          -[CRAccNavComponent uuid](v25, "uuid");
          v27 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v26, "setObject:forKeyedSubscript:", v25, v27);

          -[CRAccNavComponent uuid](v25, "uuid");
          v28 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", objc_msgSend(v20, "identifier"));
          v29 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v14, "setObject:forKeyedSubscript:", v28, v29);

        }
      }
      v17 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v36, v40, 16);
    }
    while (v17);
  }

  -[CRAccNavProvider _locked_activeComponents](v35, "_locked_activeComponents");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  os_unfair_lock_unlock(locka);
  -[CRAccNavProvider delegate](v35, "delegate");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v31, "session:didUpdateActiveComponents:", v35, v30);

}

- (void)navigation:(id)a3 stopRouteGuidance:(id)a4 componentList:(id)a5
{
  id v7;
  id v8;
  NSObject *v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  unint64_t v14;
  uint64_t i;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  unint64_t v20;
  void *v21;
  void *v22;
  void *v23;
  NSObject *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  os_unfair_lock_t lock;
  void *v31;
  id obj;
  uint64_t v33;
  uint64_t v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  uint8_t v39[128];
  uint8_t buf[4];
  id v41;
  __int16 v42;
  id v43;
  uint64_t v44;

  v44 = *MEMORY[0x24BDAC8D0];
  v7 = a4;
  v8 = a5;
  CarNavLogging();
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543618;
    v41 = v7;
    v42 = 2114;
    v43 = v8;
    _os_log_impl(&dword_23785A000, v9, OS_LOG_TYPE_DEFAULT, "iAP Accessory did disable navigation updates %{public}@ components=%{public}@", buf, 0x16u);
  }

  lock = &self->_accessoryLock;
  os_unfair_lock_lock(&self->_accessoryLock);
  -[CRAccNavProvider _locked_addAccessoryIfNeeded:](self, "_locked_addAccessoryIfNeeded:", v7);
  v10 = v8;
  v11 = v10;
  if (!v10 || (v12 = v10, !objc_msgSend(v10, "count", lock)))
  {
    objc_msgSend(v7, "componentList", lock);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "allValues");
    v12 = (void *)objc_claimAutoreleasedReturnValue();

  }
  v31 = v11;
  v37 = 0u;
  v38 = 0u;
  v35 = 0u;
  v36 = 0u;
  obj = v12;
  v34 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v35, v39, 16);
  if (v34)
  {
    v33 = *(_QWORD *)v36;
    v14 = 0x24BDD1000uLL;
    do
    {
      for (i = 0; i != v34; ++i)
      {
        if (*(_QWORD *)v36 != v33)
          objc_enumerationMutation(obj);
        v16 = *(void **)(*((_QWORD *)&v35 + 1) + 8 * i);
        -[CRAccNavProvider activeAccessoryComponentsIndexed](self, "activeAccessoryComponentsIndexed");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "accessoryUID");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17, "objectForKeyedSubscript:", v18);
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(*(id *)(v14 + 1760), "numberWithUnsignedInteger:", objc_msgSend(v16, "identifier"));
        v20 = v14;
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v19, "objectForKeyedSubscript:", v21);
        v22 = (void *)objc_claimAutoreleasedReturnValue();

        if (v22)
        {
          -[CRAccNavProvider activeComponentsIndexed](self, "activeComponentsIndexed");
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v23, "removeObjectForKey:", v22);

          -[CRAccNavProvider activeAccessoryComponentsIndexed](self, "activeAccessoryComponentsIndexed");
          v24 = objc_claimAutoreleasedReturnValue();
          objc_msgSend(v7, "accessoryUID");
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          -[NSObject objectForKeyedSubscript:](v24, "objectForKeyedSubscript:", v25);
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(*(id *)(v20 + 1760), "numberWithUnsignedInteger:", objc_msgSend(v16, "identifier"));
          v27 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v26, "removeObjectForKey:", v27);

          v14 = v20;
        }
        else
        {
          v14 = v20;
          CarNavLogging();
          v24 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138543618;
            v41 = v7;
            v42 = 2114;
            v43 = v16;
            _os_log_impl(&dword_23785A000, v24, OS_LOG_TYPE_DEFAULT, "Unknown accessory %{public}@ component %{public}@ already deactivated", buf, 0x16u);
          }
        }

      }
      v34 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v35, v39, 16);
    }
    while (v34);
  }

  -[CRAccNavProvider _locked_activeComponents](self, "_locked_activeComponents");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  os_unfair_lock_unlock(lock);
  -[CRAccNavProvider delegate](self, "delegate");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v29, "session:didUpdateActiveComponents:", self, v28);

}

- (void)_addAccessoryIfNeeded:(id)a3
{
  os_unfair_lock_s *p_accessoryLock;
  id v5;

  p_accessoryLock = &self->_accessoryLock;
  v5 = a3;
  os_unfair_lock_lock(p_accessoryLock);
  -[CRAccNavProvider _locked_addAccessoryIfNeeded:](self, "_locked_addAccessoryIfNeeded:", v5);

  os_unfair_lock_unlock(p_accessoryLock);
}

- (void)_locked_addAccessoryIfNeeded:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  NSObject *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  int v18;
  id v19;
  __int16 v20;
  void *v21;
  uint64_t v22;

  v22 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  -[CRAccNavProvider accessoriesIndexed](self, "accessoriesIndexed");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "accessoryUID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKeyedSubscript:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v7)
  {
    CarNavLogging();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(v4, "componentList");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = 138543618;
      v19 = v4;
      v20 = 2114;
      v21 = v9;
      _os_log_impl(&dword_23785A000, v8, OS_LOG_TYPE_DEFAULT, "Unknown accessory %{public}@ components=%{public}@", (uint8_t *)&v18, 0x16u);

    }
    -[CRAccNavProvider accessoriesIndexed](self, "accessoriesIndexed");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "accessoryUID");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setObject:forKeyedSubscript:", v4, v11);

    -[CRAccNavProvider activeAccessoryComponentsIndexed](self, "activeAccessoryComponentsIndexed");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "accessoryUID");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "objectForKeyedSubscript:", v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v14)
    {
      v15 = (void *)objc_opt_new();
      -[CRAccNavProvider activeAccessoryComponentsIndexed](self, "activeAccessoryComponentsIndexed");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "accessoryUID");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "setObject:forKeyedSubscript:", v15, v17);

    }
  }

}

- (id)_componentKeys
{
  os_unfair_lock_s *p_accessoryLock;
  void *v4;
  void *v5;

  p_accessoryLock = &self->_accessoryLock;
  os_unfair_lock_lock(&self->_accessoryLock);
  -[CRAccNavProvider activeComponentsIndexed](self, "activeComponentsIndexed");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "allKeys");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  os_unfair_lock_unlock(p_accessoryLock);
  return v5;
}

+ (id)_localizedNameForIdentifier:(id)a3
{
  void *v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;

  objc_msgSend(MEMORY[0x24BDC1538], "applicationProxyForIdentifier:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "localizedNameForContext:", CFSTR("Car"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v4)
  {
    v6 = v4;
  }
  else
  {
    objc_msgSend(v3, "localizedNameForContext:", 0);
    v6 = (id)objc_claimAutoreleasedReturnValue();
  }
  v7 = v6;

  return v7;
}

- (CRAccNavProviderDelegate)delegate
{
  return self->_delegate;
}

- (OS_dispatch_queue)workQueue
{
  return self->_workQueue;
}

- (void)setWorkQueue:(id)a3
{
  objc_storeStrong((id *)&self->_workQueue, a3);
}

- (ACCNavigationProvider)iapNavigation
{
  return self->_iapNavigation;
}

- (void)setIapNavigation:(id)a3
{
  objc_storeStrong((id *)&self->_iapNavigation, a3);
}

- (os_unfair_lock_s)accessoryLock
{
  return self->_accessoryLock;
}

- (void)setAccessoryLock:(os_unfair_lock_s)a3
{
  self->_accessoryLock = a3;
}

- (NSMutableDictionary)accessoriesIndexed
{
  return self->_accessoriesIndexed;
}

- (void)setAccessoriesIndexed:(id)a3
{
  objc_storeStrong((id *)&self->_accessoriesIndexed, a3);
}

- (NSMutableDictionary)activeComponentsIndexed
{
  return self->_activeComponentsIndexed;
}

- (void)setActiveComponentsIndexed:(id)a3
{
  objc_storeStrong((id *)&self->_activeComponentsIndexed, a3);
}

- (NSMutableDictionary)activeAccessoryComponentsIndexed
{
  return self->_activeAccessoryComponentsIndexed;
}

- (void)setActiveAccessoryComponentsIndexed:(id)a3
{
  objc_storeStrong((id *)&self->_activeAccessoryComponentsIndexed, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_activeAccessoryComponentsIndexed, 0);
  objc_storeStrong((id *)&self->_activeComponentsIndexed, 0);
  objc_storeStrong((id *)&self->_accessoriesIndexed, 0);
  objc_storeStrong((id *)&self->_iapNavigation, 0);
  objc_storeStrong((id *)&self->_workQueue, 0);
  objc_storeStrong((id *)&self->_delegate, 0);
}

void __44__CRAccNavProvider_sendInfo_toComponentUID___block_invoke_cold_1(uint64_t a1, id *a2)
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint8_t v14;

  objc_msgSend(*(id *)(a1 + 48), "accessoryUID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 64), "component");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "identifier");
  objc_msgSend(*a2, "accNavInfo");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "cr_dictionary");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_2(&dword_23785A000, v8, v9, "%{public}@: not sending unknown accessoryUID=%{public}@ componentUID=%{public}@ component.identifier=%lu parameters=%{public}@", v10, v11, v12, v13, v14);

  OUTLINED_FUNCTION_1();
}

void __44__CRAccNavProvider_sendInfo_toComponentUID___block_invoke_cold_2(uint64_t a1, id *a2)
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint8_t v14;

  objc_msgSend(*(id *)(a1 + 48), "accessoryUID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 64), "component");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "identifier");
  objc_msgSend(*a2, "accNavInfo");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "cr_dictionary");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_2(&dword_23785A000, v8, v9, "%{public}@: sending routeGuidance accessoryUID=%{public}@ componentUID=%{public}@ component.identifier=%lu parameters=%{public}@", v10, v11, v12, v13, v14);

  OUTLINED_FUNCTION_1();
}

- (void)_broadcastRouteGuidance:(NSObject *)a3 .cold.1(uint64_t a1, void *a2, NSObject *a3)
{
  void *v5;
  int v6;
  uint64_t v7;
  __int16 v8;
  void *v9;
  uint64_t v10;

  v10 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(a2, "cr_dictionary");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = 138543618;
  v7 = a1;
  v8 = 2114;
  v9 = v5;
  _os_log_debug_impl(&dword_23785A000, a3, OS_LOG_TYPE_DEBUG, "%{public}@: broadcast %{public}@", (uint8_t *)&v6, 0x16u);

}

@end
