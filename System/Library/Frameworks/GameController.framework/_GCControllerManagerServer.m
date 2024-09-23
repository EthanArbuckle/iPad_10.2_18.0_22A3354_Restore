@implementation _GCControllerManagerServer

- (id)logicalDevices
{
  return self->_logicalDevices;
}

- (_GCControllerManagerServer)init
{
  void *v3;
  _GCControllerManagerServer *v4;

  AllControllerProfiles();
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = -[_GCControllerManagerServer initWithControllerProfiles:](self, "initWithControllerProfiles:", v3);

  return v4;
}

- (_GCControllerManagerServer)initWithControllerProfiles:(id)a3
{
  id v4;
  _GCControllerManagerServer *v5;
  uint64_t v6;
  NSMutableDictionary *allDeviceManagers;
  uint64_t v8;
  NSMutableDictionary *physicalDeviceManagers;
  uint64_t v10;
  NSMutableDictionary *logicalDeviceManagers;
  uint64_t v12;
  GCSSettingsStore *settingsStore;
  id v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t i;
  void *v19;
  void *v20;
  NSMutableDictionary *v21;
  void *v22;
  NSMutableDictionary *v23;
  void *v24;
  NSMutableDictionary *v25;
  void *v26;
  void *v27;
  NSMutableDictionary *v28;
  void *v29;
  NSMutableDictionary *v30;
  void *v31;
  NSMutableDictionary *v32;
  void *v33;
  NSMutableSet *v34;
  NSMutableSet *configurations;
  NSMutableSet *v36;
  NSMutableSet *copilotConfigurations;
  uint64_t v38;
  GCUserDefaults *defaults;
  NSArray *copilotSettings;
  void *v41;
  NSMutableDictionary *v42;
  NSMutableDictionary *allDevices;
  NSMutableDictionary *v44;
  NSMutableDictionary *physicalDevices;
  NSMutableDictionary *v46;
  NSMutableDictionary *logicalDevices;
  NSMutableSet *v48;
  NSMutableSet *activeConfigurations;
  NSSet *v50;
  NSSet *activeControllerDevices;
  NSMutableSet *v52;
  NSMutableSet *hidServices;
  NSMutableDictionary *v54;
  NSMutableDictionary *hidServiceOwners;
  NSMutableDictionary *v56;
  NSMutableDictionary *pendingDriverConnections;
  NSMutableDictionary *v58;
  NSMutableDictionary *pendingFilterConnections;
  uint64_t v60;
  _GCControllerManagerServer *v61;
  dispatch_block_t v62;
  NSObject *v63;
  uint64_t v65;
  id v66;
  _QWORD v67[4];
  _GCControllerManagerServer *v68;
  _QWORD block[4];
  _GCControllerManagerServer *v70;
  __int128 v71;
  __int128 v72;
  __int128 v73;
  __int128 v74;
  objc_super v75;
  _BYTE v76[128];
  uint64_t v77;

  v77 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v75.receiver = self;
  v75.super_class = (Class)_GCControllerManagerServer;
  v5 = -[_GCControllerManager init](&v75, sel_init);
  if (v5)
  {
    v6 = objc_msgSend(objc_alloc((Class)&off_254DEBD30), "initWithCapacity:", objc_msgSend(v4, "count"));
    allDeviceManagers = v5->_allDeviceManagers;
    v5->_allDeviceManagers = (NSMutableDictionary *)v6;

    v8 = objc_msgSend(objc_alloc((Class)&off_254DEBD30), "initWithCapacity:", objc_msgSend(v4, "count"));
    physicalDeviceManagers = v5->_physicalDeviceManagers;
    v5->_physicalDeviceManagers = (NSMutableDictionary *)v8;

    v10 = objc_msgSend(objc_alloc((Class)&off_254DEBD30), "initWithCapacity:", objc_msgSend(v4, "count"));
    logicalDeviceManagers = v5->_logicalDeviceManagers;
    v5->_logicalDeviceManagers = (NSMutableDictionary *)v10;

    GCLookupService();
    v12 = objc_claimAutoreleasedReturnValue();
    settingsStore = v5->_settingsStore;
    v65 = 208;
    v5->_settingsStore = (GCSSettingsStore *)v12;

    v73 = 0u;
    v74 = 0u;
    v71 = 0u;
    v72 = 0u;
    v66 = v4;
    v14 = v4;
    v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v71, v76, 16);
    if (v15)
    {
      v16 = v15;
      v17 = *(_QWORD *)v72;
      do
      {
        for (i = 0; i != v16; ++i)
        {
          if (*(_QWORD *)v72 != v17)
            objc_enumerationMutation(v14);
          v19 = *(void **)(*((_QWORD *)&v71 + 1) + 8 * i);
          if (objc_msgSend(v19, "conformsToProtocol:", &unk_254DC73D0, v65))
          {
            objc_msgSend(v19, "deviceManager");
            v20 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v20, "setDeviceRegistry:", v5);
            v21 = v5->_allDeviceManagers;
            objc_msgSend(v20, "identifier");
            v22 = (void *)objc_claimAutoreleasedReturnValue();
            -[NSMutableDictionary setObject:forKey:](v21, "setObject:forKey:", v20, v22);

            if (objc_msgSend(v20, "conformsToProtocol:", &unk_254DC87A8))
            {
              v23 = v5->_physicalDeviceManagers;
              objc_msgSend(v20, "identifier");
              v24 = (void *)objc_claimAutoreleasedReturnValue();
              -[NSMutableDictionary setObject:forKey:](v23, "setObject:forKey:", v20, v24);

            }
            if (objc_msgSend(v20, "conformsToProtocol:", &unk_254DC88A0))
            {
              v25 = v5->_logicalDeviceManagers;
              objc_msgSend(v20, "identifier");
              v26 = (void *)objc_claimAutoreleasedReturnValue();
              -[NSMutableDictionary setObject:forKey:](v25, "setObject:forKey:", v20, v26);

            }
          }
        }
        v16 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v71, v76, 16);
      }
      while (v16);
    }

    v27 = (void *)objc_opt_new();
    objc_msgSend(v27, "setDeviceRegistry:", v5);
    v28 = v5->_allDeviceManagers;
    objc_msgSend(v27, "identifier");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableDictionary setObject:forKey:](v28, "setObject:forKey:", v27, v29);

    v30 = v5->_physicalDeviceManagers;
    objc_msgSend(v27, "identifier");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableDictionary setObject:forKey:](v30, "setObject:forKey:", v27, v31);

    v32 = v5->_logicalDeviceManagers;
    objc_msgSend(v27, "identifier");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableDictionary setObject:forKey:](v32, "setObject:forKey:", v27, v33);

    v5->_configurationsLock._os_unfair_lock_opaque = 0;
    v34 = (NSMutableSet *)objc_alloc_init((Class)&off_254DEBF30);
    configurations = v5->_configurations;
    v5->_configurations = v34;

    v36 = (NSMutableSet *)objc_alloc_init((Class)&off_254DEBF30);
    copilotConfigurations = v5->_copilotConfigurations;
    v5->_copilotConfigurations = v36;

    GCLookupService();
    v38 = objc_claimAutoreleasedReturnValue();
    defaults = v5->_defaults;
    v5->_defaults = (GCUserDefaults *)v38;

    copilotSettings = v5->_copilotSettings;
    v5->_copilotSettings = (NSArray *)MEMORY[0x24BDBD1A8];

    objc_msgSend(*(id *)((char *)&v5->super.super.isa + v65), "copilotFusedControllers");
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v41, "addObserver:forKeyPath:options:context:", v5, CFSTR("values"), 5, 0);

    v42 = (NSMutableDictionary *)objc_alloc_init((Class)&off_254DEBD30);
    allDevices = v5->_allDevices;
    v5->_allDevices = v42;

    v44 = (NSMutableDictionary *)objc_alloc_init((Class)&off_254DEBD30);
    physicalDevices = v5->_physicalDevices;
    v5->_physicalDevices = v44;

    v46 = (NSMutableDictionary *)objc_alloc_init((Class)&off_254DEBD30);
    logicalDevices = v5->_logicalDevices;
    v5->_logicalDevices = v46;

    v48 = (NSMutableSet *)objc_alloc_init((Class)&off_254DEBF30);
    activeConfigurations = v5->_activeConfigurations;
    v5->_activeConfigurations = v48;

    v50 = (NSSet *)objc_alloc_init((Class)&off_254DEBF30);
    activeControllerDevices = v5->_activeControllerDevices;
    v5->_activeControllerDevices = v50;

    v52 = (NSMutableSet *)objc_alloc_init((Class)&off_254DEBF30);
    hidServices = v5->_hidServices;
    v5->_hidServices = v52;

    v54 = (NSMutableDictionary *)objc_alloc_init((Class)&off_254DEBD30);
    hidServiceOwners = v5->_hidServiceOwners;
    v5->_hidServiceOwners = v54;

    v56 = (NSMutableDictionary *)objc_alloc_init((Class)&off_254DEBD30);
    pendingDriverConnections = v5->_pendingDriverConnections;
    v5->_pendingDriverConnections = v56;

    v58 = (NSMutableDictionary *)objc_alloc_init((Class)&off_254DEBD30);
    pendingFilterConnections = v5->_pendingFilterConnections;
    v5->_pendingFilterConnections = v58;

    v60 = MEMORY[0x24BDAC760];
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __57___GCControllerManagerServer_initWithControllerProfiles___block_invoke;
    block[3] = &unk_24D2B2B20;
    v61 = v5;
    v70 = v61;
    v62 = dispatch_block_create_with_qos_class(DISPATCH_BLOCK_ENFORCE_QOS_CLASS, QOS_CLASS_USER_INITIATED, -1, block);
    dispatch_async(MEMORY[0x24BDAC9B8], v62);

    -[_GCControllerManager controllersQueue](v61, "controllersQueue");
    v63 = objc_claimAutoreleasedReturnValue();
    v67[0] = v60;
    v67[1] = 3221225472;
    v67[2] = __57___GCControllerManagerServer_initWithControllerProfiles___block_invoke_2;
    v67[3] = &unk_24D2B2B20;
    v68 = v61;
    dispatch_async(v63, v67);

    v4 = v66;
  }

  return v5;
}

- (void)dealloc
{
  void *v3;
  void *v4;
  objc_super v5;

  -[GCUserDefaults removeObserver:forKeyPath:context:](self->_defaults, "removeObserver:forKeyPath:context:", self, CFSTR("configurations_v1"), 0);
  -[GCSSettingsStore copilotFusedControllers](self->_settingsStore, "copilotFusedControllers");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    -[GCSSettingsStore copilotFusedControllers](self->_settingsStore, "copilotFusedControllers");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "removeObserver:forKeyPath:context:", self, CFSTR("values"), 0);

  }
  v5.receiver = self;
  v5.super_class = (Class)_GCControllerManagerServer;
  -[_GCControllerManager dealloc](&v5, sel_dealloc);
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  int v14;
  NSObject *v15;
  objc_super v16;
  os_activity_scope_state_s state;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  -[GCSSettingsStore copilotFusedControllers](self->_settingsStore, "copilotFusedControllers");
  v13 = (id)objc_claimAutoreleasedReturnValue();
  if (v13 != v11)
  {

LABEL_5:
    v16.receiver = self;
    v16.super_class = (Class)_GCControllerManagerServer;
    -[_GCControllerManagerServer observeValueForKeyPath:ofObject:change:context:](&v16, sel_observeValueForKeyPath_ofObject_change_context_, v10, v11, v12, a6);
    goto LABEL_6;
  }
  v14 = objc_msgSend(v10, "isEqualToString:", CFSTR("values"));

  if (!v14)
    goto LABEL_5;
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  v15 = _os_activity_create(&dword_215181000, "Co-pilot Settings Did Change", MEMORY[0x24BDACB08], OS_ACTIVITY_FLAG_DEFAULT);
  os_activity_scope_enter(v15, &state);
  -[_GCControllerManagerServer _refreshCoPilotSettings]((id *)&self->super.super.isa);
  os_activity_scope_leave(&state);

LABEL_6:
}

- (void)_refreshCoPilotSettings
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[24];
  uint64_t v3;

  v3 = *MEMORY[0x24BDAC8D0];
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0(&dword_215181000, v0, v1, "New co-pilot settings: %@", v2);
  OUTLINED_FUNCTION_5();
}

- (void)_onqueue_refreshControllers
{
  NSObject *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  -[_GCControllerManager controllersQueue](self, "controllersQueue");
  v3 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v3);

  v4 = (void *)objc_msgSend(objc_alloc((Class)&off_254DEBF30), "initWithCapacity:", -[NSMutableDictionary count](self->_logicalDevices, "count"));
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  -[NSMutableDictionary allValues](self->_logicalDevices, "allValues", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v12;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v12 != v8)
          objc_enumerationMutation(v5);
        v10 = *(void **)(*((_QWORD *)&v11 + 1) + 8 * i);
        if (objc_msgSend(v10, "conformsToProtocol:", &unk_254DC9F50))
          objc_msgSend(v4, "addObject:", v10);
      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v7);
  }

  -[_GCControllerManagerServer setActiveControllerDevices:](self, "setActiveControllerDevices:", v4);
}

- (void)_onqueue_refreshLogicalDevices
{
  NSObject *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  NSObject *v10;
  void *v11;
  void *v12;
  NSMutableDictionary *logicalDevices;
  void *v14;
  NSObject *v15;
  NSObject *v16;
  void *v17;
  NSObject *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  NSObject *v24;
  NSObject *v25;
  uint64_t v26;
  _GCControllerManagerServer *v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  NSObject *v32;
  NSMutableDictionary *logicalDeviceManagers;
  void *v34;
  uint64_t v35;
  void *v36;
  void *v37;
  NSObject *v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t i;
  uint64_t v43;
  void *v44;
  void *v45;
  uint64_t v46;
  NSObject *v47;
  NSObject *v48;
  void *v49;
  void *v50;
  char v51;
  void *v52;
  NSObject *v53;
  NSObject *v54;
  const char *v55;
  void *v56;
  void *v57;
  uint64_t v58;
  id v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  NSObject *v64;
  NSObject *v65;
  uint64_t v66;
  NSObject *v67;
  uint64_t v68;
  uint64_t v69;
  uint64_t v70;
  uint64_t v71;
  NSObject *v72;
  void *v73;
  NSObject *v74;
  uint64_t v75;
  uint64_t v76;
  uint64_t v77;
  NSObject *v78;
  void *v79;
  void *v80;
  void *v81;
  id v82;
  id v83;
  id v84;
  uint64_t v85;
  uint64_t v86;
  id v87;
  id v88;
  NSObject *v89;
  uint64_t v90;
  NSMutableSet *obj;
  NSObject *obja;
  _GCControllerManagerServer *v94;
  __int128 v95;
  __int128 v96;
  __int128 v97;
  __int128 v98;
  __int128 v99;
  __int128 v100;
  __int128 v101;
  __int128 v102;
  __int128 v103;
  __int128 v104;
  __int128 v105;
  __int128 v106;
  __int128 v107;
  __int128 v108;
  __int128 v109;
  __int128 v110;
  __int128 v111;
  __int128 v112;
  __int128 v113;
  __int128 v114;
  __int128 v115;
  __int128 v116;
  __int128 v117;
  __int128 v118;
  _BYTE v119[128];
  uint8_t v120[128];
  uint8_t buf[4];
  NSObject *v122;
  __int16 v123;
  NSObject *v124;
  __int16 v125;
  id v126;
  _BYTE v127[128];
  _BYTE v128[128];
  _BYTE v129[128];
  _BYTE v130[128];
  uint64_t v131;

  v131 = *MEMORY[0x24BDAC8D0];
  -[_GCControllerManager controllersQueue](self, "controllersQueue");
  v3 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v3);

  v4 = (void *)objc_opt_new();
  os_unfair_lock_lock(&self->_configurationsLock);
  objc_msgSend(v4, "setConfigurationsIN:", self->_configurations);
  os_unfair_lock_unlock(&self->_configurationsLock);
  objc_msgSend(v4, "setDeviceManagersIN:", self->_logicalDeviceManagers);
  objc_msgSend(v4, "setPhysicalDevicesIN:", self->_physicalDevices);
  objc_msgSend(v4, "evaluate");
  v81 = v4;
  objc_msgSend(v4, "viableConfigurationsOUT");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v84 = objc_alloc_init((Class)&off_254DEBB20);
  v83 = objc_alloc_init((Class)&off_254DEBB20);
  v87 = objc_alloc_init((Class)&off_254DEBB20);
  v82 = objc_alloc_init((Class)&off_254DEBB20);
  v115 = 0u;
  v116 = 0u;
  v117 = 0u;
  v118 = 0u;
  v94 = self;
  obj = self->_activeConfigurations;
  v6 = -[NSMutableSet countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v115, v130, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v116;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v116 != v8)
          objc_enumerationMutation(obj);
        v10 = *(NSObject **)(*((_QWORD *)&v115 + 1) + 8 * v9);
        objc_msgSend(v5, "member:", v10);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v12 = v11;
        if (!v11 || (objc_msgSend(v11, "isEqualToConfiguration:", v10) & 1) == 0)
        {
          logicalDevices = v94->_logicalDevices;
          -[NSObject deviceIdentifier](v10, "deviceIdentifier");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          -[NSMutableDictionary objectForKey:](logicalDevices, "objectForKey:", v14);
          v15 = objc_claimAutoreleasedReturnValue();

          if (v15)
          {
            if (gc_isInternalBuild())
            {
              getGCLogger();
              v18 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG))
              {
                *(_DWORD *)buf = 138412290;
                v122 = v15;
                _os_log_debug_impl(&dword_215181000, v18, OS_LOG_TYPE_DEBUG, "Deactivate logical device: %@", buf, 0xCu);
              }

            }
            -[NSObject manager](v15, "manager");
            v16 = objc_claimAutoreleasedReturnValue();
            if ((objc_opt_respondsToSelector() & 1) != 0)
              -[NSObject deactivateLogical](v15, "deactivateLogical");
            if ((objc_opt_respondsToSelector() & 1) != 0)
              -[NSObject deactivateLogicalDevice:](v16, "deactivateLogicalDevice:", v15);
            objc_msgSend(v87, "addObject:", v15);
            objc_msgSend(v84, "addObject:", v10);
            goto LABEL_15;
          }
          unk_254DEC4F8(&off_254DEC660, "currentHandler");
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v17, "handleFailureInMethod:object:file:lineNumber:description:", a2, v94, CFSTR("GCControllerManagerServer.m"), 256, CFSTR("Can't find device for active configuration: %@"), v10);

          if (gc_isInternalBuild())
          {
            getGCLogger();
            v16 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 138412290;
              v122 = v10;
              _os_log_error_impl(&dword_215181000, v16, OS_LOG_TYPE_ERROR, "#BUG Can't find device for active configuration: %@", buf, 0xCu);
            }
LABEL_15:

          }
        }

        ++v9;
      }
      while (v7 != v9);
      v19 = -[NSMutableSet countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v115, v130, 16);
      v7 = v19;
    }
    while (v19);
  }

  v113 = 0u;
  v114 = 0u;
  v111 = 0u;
  v112 = 0u;
  v88 = v87;
  v20 = objc_msgSend(v88, "countByEnumeratingWithState:objects:count:", &v111, v129, 16);
  if (v20)
  {
    v21 = v20;
    v22 = *(_QWORD *)v112;
    do
    {
      v23 = 0;
      do
      {
        if (*(_QWORD *)v112 != v22)
          objc_enumerationMutation(v88);
        v24 = *(NSObject **)(*((_QWORD *)&v111 + 1) + 8 * v23);
        if (gc_isInternalBuild())
        {
          getGCLogger();
          v25 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v25, OS_LOG_TYPE_DEBUG))
          {
            *(_DWORD *)buf = 138412290;
            v122 = v24;
            _os_log_debug_impl(&dword_215181000, v25, OS_LOG_TYPE_DEBUG, "Unregister device: %@", buf, 0xCu);
          }

        }
        -[_GCControllerManagerServer _onqueue_unregisterLogicalDevice:](v94, "_onqueue_unregisterLogicalDevice:", v24);
        ++v23;
      }
      while (v21 != v23);
      v26 = objc_msgSend(v88, "countByEnumeratingWithState:objects:count:", &v111, v129, 16);
      v21 = v26;
    }
    while (v26);
  }

  v27 = v94;
  -[NSMutableSet gc_removeObjectsInArray:](v94->_activeConfigurations, "gc_removeObjectsInArray:", v84);
  v109 = 0u;
  v110 = 0u;
  v107 = 0u;
  v108 = 0u;
  v89 = v5;
  v28 = -[NSObject countByEnumeratingWithState:objects:count:](v89, "countByEnumeratingWithState:objects:count:", &v107, v128, 16);
  if (v28)
  {
    v29 = v28;
    v30 = *(_QWORD *)v108;
    v85 = *(_QWORD *)v108;
    do
    {
      v31 = 0;
      v86 = v29;
      do
      {
        if (*(_QWORD *)v108 != v30)
          objc_enumerationMutation(v89);
        v32 = *(NSObject **)(*((_QWORD *)&v107 + 1) + 8 * v31);
        if ((-[NSMutableSet containsObject:](v27->_activeConfigurations, "containsObject:", v32) & 1) == 0)
        {
          v90 = v31;
          logicalDeviceManagers = v27->_logicalDeviceManagers;
          -[NSObject deviceBuilderIdentifier](v32, "deviceBuilderIdentifier");
          v34 = (void *)objc_claimAutoreleasedReturnValue();
          -[NSMutableDictionary objectForKey:](logicalDeviceManagers, "objectForKey:", v34);
          v35 = objc_claimAutoreleasedReturnValue();

          obja = v35;
          if (!v35)
          {
            unk_254DEC4F8(&off_254DEC660, "currentHandler");
            v57 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v57, "handleFailureInMethod:object:file:lineNumber:description:", a2, v27, CFSTR("GCControllerManagerServer.m"), 298, CFSTR("Missing device manager for: %@"), v32);

          }
          -[NSObject deviceDependencies](v32, "deviceDependencies");
          v36 = (void *)objc_claimAutoreleasedReturnValue();
          v37 = (void *)objc_msgSend(objc_alloc((Class)&off_254DEBF30), "initWithCapacity:", objc_msgSend(v36, "count"));
          v103 = 0u;
          v104 = 0u;
          v105 = 0u;
          v106 = 0u;
          v38 = v36;
          v39 = -[NSObject countByEnumeratingWithState:objects:count:](v38, "countByEnumeratingWithState:objects:count:", &v103, v127, 16);
          if (v39)
          {
            v40 = v39;
            v41 = *(_QWORD *)v104;
            do
            {
              for (i = 0; i != v40; ++i)
              {
                if (*(_QWORD *)v104 != v41)
                  objc_enumerationMutation(v38);
                v43 = *(_QWORD *)(*((_QWORD *)&v103 + 1) + 8 * i);
                -[NSMutableDictionary objectForKey:](v27->_physicalDevices, "objectForKey:", v43);
                v44 = (void *)objc_claimAutoreleasedReturnValue();
                if (v44)
                {
                  objc_msgSend(v37, "addObject:", v44);
                }
                else
                {
                  unk_254DEC4F8(&off_254DEC660, "currentHandler");
                  v45 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v45, "handleFailureInMethod:object:file:lineNumber:description:", a2, v94, CFSTR("GCControllerManagerServer.m"), 307, CFSTR("Did not find a physical device with identifier '%@', needed for %@"), v43, v32);

                  v27 = v94;
                }

              }
              v40 = -[NSObject countByEnumeratingWithState:objects:count:](v38, "countByEnumeratingWithState:objects:count:", &v103, v127, 16);
            }
            while (v40);
          }

          v46 = -[NSObject count](v38, "count");
          if (v46 != objc_msgSend(v37, "count"))
          {
            v27 = v94;
            v29 = v86;
            v30 = v85;
            if (gc_isInternalBuild())
            {
              getGCLogger();
              v48 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v48, OS_LOG_TYPE_ERROR))
              {
                *(_DWORD *)buf = 138412802;
                v122 = v32;
                v123 = 2112;
                v124 = v38;
                v125 = 2112;
                v126 = v37;
                _os_log_error_impl(&dword_215181000, v48, OS_LOG_TYPE_ERROR, "#BUG Missing dependencies for %@\nExpected: %@\nHave: %@", buf, 0x20u);
              }
LABEL_68:

            }
            v31 = v90;
            goto LABEL_70;
          }
          -[NSObject makeDeviceWithConfiguration:dependencies:](obja, "makeDeviceWithConfiguration:dependencies:", v32, v37);
          v47 = objc_claimAutoreleasedReturnValue();
          v48 = v47;
          v30 = v85;
          v29 = v86;
          if (v47)
          {
            -[NSObject identifier](v47, "identifier");
            v49 = (void *)objc_claimAutoreleasedReturnValue();
            -[NSObject deviceIdentifier](v32, "deviceIdentifier");
            v50 = (void *)objc_claimAutoreleasedReturnValue();
            v51 = objc_msgSend(v49, "isEqual:", v50);

            if ((v51 & 1) != 0)
            {
              objc_msgSend(v82, "addObject:", v48);
              objc_msgSend(v83, "addObject:", v32);
              goto LABEL_67;
            }
            unk_254DEC4F8(&off_254DEC660, "currentHandler");
            v56 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v56, "handleFailureInMethod:object:file:lineNumber:description:", a2, v94, CFSTR("GCControllerManagerServer.m"), 332, CFSTR("Identifier of materialized device %@ does not match its configuration %@"), v48, v32);

            if (!gc_isInternalBuild())
            {
LABEL_67:
              v27 = v94;
              goto LABEL_68;
            }
            getGCLogger();
            v53 = objc_claimAutoreleasedReturnValue();
            if (!os_log_type_enabled(v53, OS_LOG_TYPE_ERROR))
            {
LABEL_73:

              goto LABEL_67;
            }
            *(_DWORD *)buf = 138412546;
            v122 = v48;
            v123 = 2112;
            v124 = v32;
            v54 = v53;
            v55 = "#BUG Identifier of materialized device %@ does not match its configuration %@";
          }
          else
          {
            unk_254DEC4F8(&off_254DEC660, "currentHandler");
            v52 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v52, "handleFailureInMethod:object:file:lineNumber:description:", a2, v94, CFSTR("GCControllerManagerServer.m"), 322, CFSTR("%@ did not return a device for configuration: %@"), obja, v32);

            if (!gc_isInternalBuild())
              goto LABEL_67;
            getGCLogger();
            v53 = objc_claimAutoreleasedReturnValue();
            if (!os_log_type_enabled(v53, OS_LOG_TYPE_ERROR))
              goto LABEL_73;
            *(_DWORD *)buf = 138412546;
            v122 = obja;
            v123 = 2112;
            v124 = v32;
            v54 = v53;
            v55 = "#BUG %@ did not return a device for configuration: %@";
          }
          _os_log_error_impl(&dword_215181000, v54, OS_LOG_TYPE_ERROR, v55, buf, 0x16u);
          goto LABEL_73;
        }
LABEL_70:
        ++v31;
      }
      while (v31 != v29);
      v58 = -[NSObject countByEnumeratingWithState:objects:count:](v89, "countByEnumeratingWithState:objects:count:", &v107, v128, 16);
      v29 = v58;
    }
    while (v58);
  }

  -[NSMutableSet addObjectsFromArray:](v27->_activeConfigurations, "addObjectsFromArray:", v83);
  v101 = 0u;
  v102 = 0u;
  v99 = 0u;
  v100 = 0u;
  v59 = v82;
  v60 = objc_msgSend(v59, "countByEnumeratingWithState:objects:count:", &v99, v120, 16);
  if (v60)
  {
    v61 = v60;
    v62 = *(_QWORD *)v100;
    do
    {
      v63 = 0;
      do
      {
        if (*(_QWORD *)v100 != v62)
          objc_enumerationMutation(v59);
        v64 = *(NSObject **)(*((_QWORD *)&v99 + 1) + 8 * v63);
        if (gc_isInternalBuild())
        {
          getGCLogger();
          v65 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v65, OS_LOG_TYPE_DEBUG))
          {
            *(_DWORD *)buf = 138412290;
            v122 = v64;
            _os_log_debug_impl(&dword_215181000, v65, OS_LOG_TYPE_DEBUG, "Register device: %@", buf, 0xCu);
          }

        }
        -[_GCControllerManagerServer _onqueue_registerLogicalDevice:](v94, "_onqueue_registerLogicalDevice:", v64);
        ++v63;
      }
      while (v61 != v63);
      v66 = objc_msgSend(v59, "countByEnumeratingWithState:objects:count:", &v99, v120, 16);
      v61 = v66;
    }
    while (v66);
  }

  v97 = 0u;
  v98 = 0u;
  v95 = 0u;
  v96 = 0u;
  v67 = v59;
  v68 = -[NSObject countByEnumeratingWithState:objects:count:](v67, "countByEnumeratingWithState:objects:count:", &v95, v119, 16);
  if (v68)
  {
    v69 = v68;
    v70 = *(_QWORD *)v96;
    do
    {
      v71 = 0;
      do
      {
        if (*(_QWORD *)v96 != v70)
          objc_enumerationMutation(v67);
        v72 = *(NSObject **)(*((_QWORD *)&v95 + 1) + 8 * v71);
        if (gc_isInternalBuild())
        {
          getGCLogger();
          v74 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v74, OS_LOG_TYPE_DEBUG))
          {
            *(_DWORD *)buf = 138412290;
            v122 = v72;
            _os_log_debug_impl(&dword_215181000, v74, OS_LOG_TYPE_DEBUG, "Activate logical device: %@", buf, 0xCu);
          }

        }
        -[NSObject manager](v72, "manager");
        v73 = (void *)objc_claimAutoreleasedReturnValue();
        if ((objc_opt_respondsToSelector() & 1) != 0)
          objc_msgSend(v73, "activateLogicalDevice:", v72);
        if ((objc_opt_respondsToSelector() & 1) != 0)
          -[NSObject activateLogical](v72, "activateLogical");

        ++v71;
      }
      while (v69 != v71);
      v75 = -[NSObject countByEnumeratingWithState:objects:count:](v67, "countByEnumeratingWithState:objects:count:", &v95, v119, 16);
      v69 = v75;
    }
    while (v75);
  }

  if (gc_isInternalBuild())
  {
    getGCLogger();
    v78 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v78, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412802;
      v122 = v89;
      v123 = 2112;
      v124 = v67;
      v125 = 2112;
      v126 = v88;
      _os_log_impl(&dword_215181000, v78, OS_LOG_TYPE_DEFAULT, "New configurations: %@\nincomingDevices: %@\noutgoingDevices: %@", buf, 0x20u);
    }

  }
  v76 = -[NSMutableSet count](v94->_activeConfigurations, "count");
  if (v76 != -[NSObject count](v89, "count"))
  {
    unk_254DEC4F8(&off_254DEC660, "currentHandler");
    v79 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v79, "handleFailureInMethod:object:file:lineNumber:description:", a2, v94, CFSTR("GCControllerManagerServer.m"), 366, CFSTR("A configuration is unaccounted for."));

  }
  v77 = -[NSMutableDictionary count](v94->_logicalDevices, "count");
  if (v77 != -[NSMutableSet count](v94->_activeConfigurations, "count"))
  {
    unk_254DEC4F8(&off_254DEC660, "currentHandler");
    v80 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v80, "handleFailureInMethod:object:file:lineNumber:description:", a2, v94, CFSTR("GCControllerManagerServer.m"), 367, CFSTR("We are missing a device."));

  }
  -[_GCControllerManagerServer _onqueue_refreshControllers](v94, "_onqueue_refreshControllers");

}

- (void)_onqueue_registerPhysicalDevice:(id)a3
{
  NSObject *v5;
  void *v6;
  void *v7;
  id v8;
  NSMutableDictionary *allDevices;
  void *v10;
  NSMutableDictionary *physicalDevices;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;

  v16 = a3;
  -[_GCControllerManager controllersQueue](self, "controllersQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v5);

  if ((objc_msgSend(v16, "conformsToProtocol:", &unk_254DCA530) & 1) == 0)
  {
    unk_254DEC4F8(&off_254DEC660, "currentHandler");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("GCControllerManagerServer.m"), 374, CFSTR("%@ is not a <_GCPhysicalDevice>"), v16);

  }
  objc_msgSend(v16, "identifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary objectForKey:](self->_allDevices, "objectForKey:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    -[NSMutableDictionary objectForKey:](self->_allDevices, "objectForKey:", v6);
    v8 = (id)objc_claimAutoreleasedReturnValue();

    if (v8 != v16)
    {
      unk_254DEC4F8(&off_254DEC660, "currentHandler");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("GCControllerManagerServer.m"), 380, CFSTR("Identifier '%@' is already registered. Possible duplicate identifier?"), v6);

    }
  }
  allDevices = self->_allDevices;
  objc_msgSend(v16, "identifier");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary setObject:forKey:](allDevices, "setObject:forKey:", v16, v10);

  physicalDevices = self->_physicalDevices;
  objc_msgSend(v16, "identifier");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary setObject:forKey:](physicalDevices, "setObject:forKey:", v16, v12);

  +[NSNotificationCenter defaultCenter](&off_254DEC7B0, "defaultCenter");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "postNotificationName:object:userInfo:", CFSTR("GCPhysicalDeviceWasRegisteredNotification"), v16, 0);

}

- (void)_onqueue_unregisterPhysicalDevice:(id)a3
{
  NSObject *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;

  v11 = a3;
  -[_GCControllerManager controllersQueue](self, "controllersQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v5);

  objc_msgSend(v11, "identifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary objectForKey:](self->_physicalDevices, "objectForKey:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v7)
  {
    unk_254DEC4F8(&off_254DEC660, "currentHandler");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("GCControllerManagerServer.m"), 392, CFSTR("%@ was not previously registered"), v11);

  }
  -[NSMutableDictionary removeObjectForKey:](self->_physicalDevices, "removeObjectForKey:", v6);
  -[NSMutableDictionary objectForKey:](self->_logicalDevices, "objectForKey:", v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v8)
    -[NSMutableDictionary removeObjectForKey:](self->_allDevices, "removeObjectForKey:", v6);
  +[NSNotificationCenter defaultCenter](&off_254DEC7B0, "defaultCenter");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "postNotificationName:object:userInfo:", CFSTR("GCPhysicalDeviceWasUnregisteredNotification"), v11, 0);

}

- (void)_onqueue_registerLogicalDevice:(id)a3
{
  NSObject *v5;
  void *v6;
  void *v7;
  id v8;
  NSMutableDictionary *allDevices;
  void *v10;
  NSMutableDictionary *logicalDevices;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;

  v16 = a3;
  -[_GCControllerManager controllersQueue](self, "controllersQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v5);

  if ((objc_msgSend(v16, "conformsToProtocol:", &unk_254DCA5E0) & 1) == 0)
  {
    unk_254DEC4F8(&off_254DEC660, "currentHandler");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("GCControllerManagerServer.m"), 402, CFSTR("%@ is not a <_GCLogicalDevice>"), v16);

  }
  objc_msgSend(v16, "identifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary objectForKey:](self->_allDevices, "objectForKey:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    -[NSMutableDictionary objectForKey:](self->_allDevices, "objectForKey:", v6);
    v8 = (id)objc_claimAutoreleasedReturnValue();

    if (v8 != v16)
    {
      unk_254DEC4F8(&off_254DEC660, "currentHandler");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("GCControllerManagerServer.m"), 408, CFSTR("Identifier '%@' is already registered. Possible duplicate identifier?"), v6);

    }
  }
  allDevices = self->_allDevices;
  objc_msgSend(v16, "identifier");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary setObject:forKey:](allDevices, "setObject:forKey:", v16, v10);

  logicalDevices = self->_logicalDevices;
  objc_msgSend(v16, "identifier");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary setObject:forKey:](logicalDevices, "setObject:forKey:", v16, v12);

  +[NSNotificationCenter defaultCenter](&off_254DEC7B0, "defaultCenter");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "postNotificationName:object:userInfo:", CFSTR("GCLogicalDeviceWasRegisteredNotification"), v16, 0);

  -[_GCControllerManagerServer _onqueue_signalGameControllerFocusModeEvent](self, "_onqueue_signalGameControllerFocusModeEvent");
}

- (void)_onqueue_unregisterLogicalDevice:(id)a3
{
  NSObject *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;

  v11 = a3;
  -[_GCControllerManager controllersQueue](self, "controllersQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v5);

  objc_msgSend(v11, "identifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary objectForKey:](self->_logicalDevices, "objectForKey:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v7)
  {
    unk_254DEC4F8(&off_254DEC660, "currentHandler");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("GCControllerManagerServer.m"), 421, CFSTR("%@ was not previously registered"), v11);

  }
  -[NSMutableDictionary removeObjectForKey:](self->_logicalDevices, "removeObjectForKey:", v6);
  -[NSMutableDictionary objectForKey:](self->_physicalDevices, "objectForKey:", v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v8)
    -[NSMutableDictionary removeObjectForKey:](self->_allDevices, "removeObjectForKey:", v6);
  +[NSNotificationCenter defaultCenter](&off_254DEC7B0, "defaultCenter");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "postNotificationName:object:userInfo:", CFSTR("GCLogicalDeviceWasUnregisteredNotification"), v11, 0);

  -[_GCControllerManagerServer _onqueue_signalGameControllerFocusModeEvent](self, "_onqueue_signalGameControllerFocusModeEvent");
}

- (void)deviceManager:(id)a3 deviceDidConnect:(id)a4
{
  id v5;
  NSObject *v6;
  id v7;
  _QWORD v8[5];
  id v9;

  v5 = a4;
  -[_GCControllerManager controllersQueue](self, "controllersQueue");
  v6 = objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __61___GCControllerManagerServer_deviceManager_deviceDidConnect___block_invoke;
  v8[3] = &unk_24D2B2B48;
  v8[4] = self;
  v9 = v5;
  v7 = v5;
  dispatch_barrier_async(v6, v8);

}

- (void)deviceManager:(id)a3 deviceDidDisconnect:(id)a4
{
  id v5;
  NSObject *v6;
  id v7;
  _QWORD v8[5];
  id v9;

  v5 = a4;
  -[_GCControllerManager controllersQueue](self, "controllersQueue");
  v6 = objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __64___GCControllerManagerServer_deviceManager_deviceDidDisconnect___block_invoke;
  v8[3] = &unk_24D2B2B48;
  v8[4] = self;
  v9 = v5;
  v7 = v5;
  dispatch_barrier_async(v6, v8);

}

- (void)_onqueue_signalGameControllerFocusModeEvent
{
  NSObject *v3;
  uint64_t v4;
  uint64_t v5;
  _BOOL8 v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  NSObject *v15;
  const __CFString *v16;
  int v17;
  const __CFString *v18;
  __int16 v19;
  uint64_t v20;
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
  -[_GCControllerManager controllersQueue](self, "controllersQueue");
  v3 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v3);

  v4 = -[NSMutableDictionary count](self->_logicalDevices, "count");
  v5 = -[NSMutableDictionary count](self->_logicalDevices, "count");
  if (gc_isInternalBuild())
  {
    getGCLogger();
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
    {
      v16 = CFSTR("NO");
      if (v4)
        v16 = CFSTR("YES");
      v17 = 138412546;
      v18 = v16;
      v19 = 2048;
      v20 = v5;
      _os_log_impl(&dword_215181000, v15, OS_LOG_TYPE_INFO, "signalGameControllerFocusModeEvent: controllersConnected=%@, numberOfControllersConnected=%lu", (uint8_t *)&v17, 0x16u);
    }

  }
  v6 = v4 != 0;
  BiomeLibrary();
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "GameController");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "Connected");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v9, "source");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_alloc((Class)&off_254DED818);
  +[NSNumber numberWithBool:](&off_254DED908, "numberWithBool:", v6);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  +[NSNumber numberWithUnsignedInteger:](&off_254DED908, "numberWithUnsignedInteger:", v5);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = (void *)objc_msgSend(v11, "initWithIsControllerConnected:numberOfControllersConnected:", v12, v13);

  objc_msgSend(v10, "sendEvent:", v14);
}

- (void)_rebuildCoPilotConfigurations
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[24];
  uint64_t v3;

  v3 = *MEMORY[0x24BDAC8D0];
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0(&dword_215181000, v0, v1, "Co-pilot: Rebuild configurations with settings %@", v2);
  OUTLINED_FUNCTION_5();
}

- (BOOL)hasConfigurationWithIdentifier:(id)a3
{
  os_unfair_lock_s *p_configurationsLock;
  id v5;
  void *v6;

  p_configurationsLock = &self->_configurationsLock;
  v5 = a3;
  os_unfair_lock_lock(p_configurationsLock);
  -[NSMutableSet member:](self->_configurations, "member:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  os_unfair_lock_unlock(p_configurationsLock);
  return v6 != 0;
}

- (id)configurationWithIdentifier:(id)a3
{
  os_unfair_lock_s *p_configurationsLock;
  id v5;
  void *v6;

  p_configurationsLock = &self->_configurationsLock;
  v5 = a3;
  os_unfair_lock_lock(p_configurationsLock);
  -[NSMutableSet member:](self->_configurations, "member:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  os_unfair_lock_unlock(p_configurationsLock);
  return v6;
}

- (BOOL)addConfiguration:(id)a3 replaceExisting:(BOOL)a4
{
  id v6;
  NSMutableSet *configurations;
  void *v8;
  void *v9;
  BOOL v10;
  void *v11;
  NSObject *v13;
  NSObject *v14;
  int v15;
  void *v16;
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  os_unfair_lock_lock(&self->_configurationsLock);
  configurations = self->_configurations;
  objc_msgSend(v6, "identifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableSet member:](configurations, "member:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (!a4 && v9 && (!objc_msgSend(v9, "isTransient") || (objc_msgSend(v6, "isTransient") & 1) != 0))
  {

    os_unfair_lock_unlock(&self->_configurationsLock);
    v10 = 0;
    goto LABEL_11;
  }
  v11 = (void *)objc_msgSend(v6, "copy");

  if (gc_isInternalBuild())
  {
    getGCLogger();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
      -[_GCControllerManagerServer addConfiguration:replaceExisting:].cold.1(v11, v13);

    if (!v9)
      goto LABEL_9;
    goto LABEL_8;
  }
  if (v9)
LABEL_8:
    -[NSMutableSet removeObject:](self->_configurations, "removeObject:", v9);
LABEL_9:
  -[NSMutableSet addObject:](self->_configurations, "addObject:", v11);
  if (gc_isInternalBuild())
  {
    getGCLogger();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
    {
      v15 = 138412290;
      v16 = v11;
      _os_log_impl(&dword_215181000, v14, OS_LOG_TYPE_INFO, "Added configuration: %@", (uint8_t *)&v15, 0xCu);
    }

  }
  os_unfair_lock_unlock(&self->_configurationsLock);
  -[_GCControllerManagerServer _rebuildCoPilotConfigurations]((uint64_t)self);
  v10 = 1;
  v6 = v11;
LABEL_11:

  return v10;
}

- (BOOL)updateConfiguration:(id)a3
{
  id v4;
  NSMutableSet *configurations;
  void *v6;
  void *v7;
  void *v8;
  NSObject *v10;
  NSObject *v11;
  int v12;
  void *v13;
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  os_unfair_lock_lock(&self->_configurationsLock);
  configurations = self->_configurations;
  objc_msgSend(v4, "identifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableSet member:](configurations, "member:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    v8 = (void *)objc_msgSend(v4, "copy");

    if (gc_isInternalBuild())
    {
      getGCLogger();
      v10 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
        -[_GCControllerManagerServer updateConfiguration:].cold.1(v8, v10);

    }
    -[NSMutableSet removeObject:](self->_configurations, "removeObject:", v8);
    -[NSMutableSet addObject:](self->_configurations, "addObject:", v8);
    if (gc_isInternalBuild())
    {
      getGCLogger();
      v11 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
      {
        v12 = 138412290;
        v13 = v8;
        _os_log_impl(&dword_215181000, v11, OS_LOG_TYPE_INFO, "Updated configuration: %@", (uint8_t *)&v12, 0xCu);
      }

    }
    os_unfair_lock_unlock(&self->_configurationsLock);
    -[_GCControllerManagerServer _rebuildCoPilotConfigurations]((uint64_t)self);
  }
  else
  {
    os_unfair_lock_unlock(&self->_configurationsLock);
    v8 = v4;
  }

  return v7 != 0;
}

- (BOOL)removeConfigurationWithIdentifier:(id)a3
{
  id v4;
  void *v5;
  NSObject *v7;
  NSObject *v8;
  int v9;
  void *v10;
  uint64_t v11;

  v11 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  os_unfair_lock_lock(&self->_configurationsLock);
  -[NSMutableSet member:](self->_configurations, "member:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    if (gc_isInternalBuild())
    {
      getGCLogger();
      v7 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
        -[_GCControllerManagerServer removeConfigurationWithIdentifier:].cold.1(v5, v7);

    }
    -[NSMutableSet removeObject:](self->_configurations, "removeObject:", v4);
    if (gc_isInternalBuild())
    {
      getGCLogger();
      v8 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
      {
        v9 = 138412290;
        v10 = v5;
        _os_log_impl(&dword_215181000, v8, OS_LOG_TYPE_INFO, "Removed configuration: %@", (uint8_t *)&v9, 0xCu);
      }

    }
    os_unfair_lock_unlock(&self->_configurationsLock);
    -[_GCControllerManagerServer _rebuildCoPilotConfigurations]((uint64_t)self);
  }
  else
  {
    os_unfair_lock_unlock(&self->_configurationsLock);
  }

  return v5 != 0;
}

- (void)refreshActiveConfigurationsWithCompletion:(id)a3
{
  id v4;
  NSObject *v5;
  NSObject *v6;
  id v7;
  _QWORD v8[5];
  id v9;
  os_activity_scope_state_s state;

  v4 = a3;
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  v5 = _os_activity_create(&dword_215181000, "Refresh Active Configurations", MEMORY[0x24BDACB08], OS_ACTIVITY_FLAG_DEFAULT);
  os_activity_scope_enter(v5, &state);
  -[_GCControllerManager controllersQueue](self, "controllersQueue");
  v6 = objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __72___GCControllerManagerServer_refreshActiveConfigurationsWithCompletion___block_invoke;
  v8[3] = &unk_24D2B2AD0;
  v8[4] = self;
  v9 = v4;
  v7 = v4;
  dispatch_barrier_async(v6, v8);

  os_activity_scope_leave(&state);
}

- (void)refreshActiveConfigurations
{
  NSObject *v3;
  NSObject *v4;
  _QWORD block[5];
  os_activity_scope_state_s state;

  state.opaque[0] = 0;
  state.opaque[1] = 0;
  v3 = _os_activity_create(&dword_215181000, "Refresh Active Configurations", MEMORY[0x24BDACB08], OS_ACTIVITY_FLAG_DEFAULT);
  os_activity_scope_enter(v3, &state);
  -[_GCControllerManager controllersQueue](self, "controllersQueue");
  v4 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __57___GCControllerManagerServer_refreshActiveConfigurations__block_invoke;
  block[3] = &unk_24D2B2B20;
  block[4] = self;
  dispatch_barrier_sync(v4, block);

  os_activity_scope_leave(&state);
}

- (id)makeHIDEventSource:(__IOHIDEventSystemClient *)a3
{
  return 0;
}

- (void)onHIDServiceAdded:(id)a3
{
  id v4;
  void *v5;
  NSObject *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  NSObject *v21;
  uint64_t v22;
  void *v23;
  void *v24;
  id v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  void *v30;
  NSObject *v31;
  uint64_t v32;
  id v33;
  void *v34;
  void *v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  void *v40;
  uint64_t v41;
  void *v42;
  void *v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  void *v48;
  uint64_t v49;
  NSObject *v50;
  NSObject *v51;
  NSObject *log;
  NSObject *v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  __int128 v60;
  __int128 v61;
  __int128 v62;
  __int128 v63;
  __int128 v64;
  __int128 v65;
  __int128 v66;
  __int128 v67;
  __int128 v68;
  __int128 v69;
  __int128 v70;
  __int128 v71;
  __int128 v72;
  __int128 v73;
  _BYTE v74[128];
  _BYTE v75[128];
  uint8_t v76[128];
  uint8_t buf[4];
  id v78;
  __int16 v79;
  id v80;
  _BYTE v81[128];
  _BYTE v82[128];
  uint64_t v83;

  v83 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  -[NSMutableSet member:](self->_hidServices, "member:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v5)
  {
    -[NSMutableSet addObject:](self->_hidServices, "addObject:", v4);
    -[_GCControllerManager registerIPCObject:](self, "registerIPCObject:", v4);
    v53 = (id)*MEMORY[0x24BE3A6A0];
    v70 = 0u;
    v71 = 0u;
    v72 = 0u;
    v73 = 0u;
    -[NSMutableDictionary allValues](self->_physicalDeviceManagers, "allValues");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v70, v82, 16);
    if (v8)
    {
      v9 = v8;
      v10 = *(_QWORD *)v71;
      while (2)
      {
        for (i = 0; i != v9; ++i)
        {
          if (*(_QWORD *)v71 != v10)
            objc_enumerationMutation(v7);
          v12 = *(void **)(*((_QWORD *)&v70 + 1) + 8 * i);
          -[NSMutableDictionary setObject:forKey:](self->_hidServiceOwners, "setObject:forKey:", v12, v4);
          objc_msgSend(v12, "matchHIDService:", v4);
          v6 = objc_claimAutoreleasedReturnValue();
          if (v6 > v53)
          {

            v15 = v12;
            objc_msgSend(v15, "claimHIDService:", v4);
            if (gc_isInternalBuild())
            {
              getGCLogger();
              v50 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v50, OS_LOG_TYPE_DEBUG))
                -[_GCControllerManagerServer onHIDServiceAdded:].cold.1();

            }
            objc_msgSend(v4, "registryID");
            v34 = (void *)objc_claimAutoreleasedReturnValue();
            -[_GCControllerManagerServer _hidqueue_popPendingDriverConnectionsForRegistryID:](self, "_hidqueue_popPendingDriverConnectionsForRegistryID:", v34);
            v35 = (void *)objc_claimAutoreleasedReturnValue();

            v68 = 0u;
            v69 = 0u;
            v66 = 0u;
            v67 = 0u;
            v33 = v35;
            v36 = objc_msgSend(v33, "countByEnumeratingWithState:objects:count:", &v66, v81, 16);
            if (v36)
            {
              v37 = v36;
              v38 = *(_QWORD *)v67;
              do
              {
                v39 = 0;
                do
                {
                  if (*(_QWORD *)v67 != v38)
                    objc_enumerationMutation(v33);
                  v40 = *(void **)(*((_QWORD *)&v66 + 1) + 8 * v39);
                  if ((objc_opt_respondsToSelector() & 1) == 0)
                    goto LABEL_90;
                  if (gc_isInternalBuild())
                  {
                    getGCLogger();
                    log = objc_claimAutoreleasedReturnValue();
                    if (os_log_type_enabled(log, OS_LOG_TYPE_DEBUG))
                    {
                      *(_DWORD *)buf = 138412546;
                      v78 = v40;
                      v79 = 2112;
                      v80 = v15;
                      _os_log_debug_impl(&dword_215181000, log, OS_LOG_TYPE_DEBUG, "Sending previous driver connection %@ to %@", buf, 0x16u);
                    }

                  }
                  if ((objc_msgSend(v15, "acceptDriverConnection:forHIDService:", v40, v4, log) & 1) == 0)
                  {
LABEL_90:
                    if (gc_isInternalBuild())
                    {
                      getGCLogger();
                      log = objc_claimAutoreleasedReturnValue();
                      if (os_log_type_enabled(log, OS_LOG_TYPE_INFO))
                      {
                        *(_DWORD *)buf = 138412546;
                        v78 = v40;
                        v79 = 2112;
                        v80 = v15;
                        _os_log_impl(&dword_215181000, log, OS_LOG_TYPE_INFO, "Dropping incoming driver connection %@ because %@ rejected it.", buf, 0x16u);
                      }

                    }
                    objc_msgSend(v40, "invalidate", log);
                  }
                  ++v39;
                }
                while (v37 != v39);
                v41 = objc_msgSend(v33, "countByEnumeratingWithState:objects:count:", &v66, v81, 16);
                v37 = v41;
              }
              while (v41);
            }

            objc_msgSend(v4, "registryID");
            v42 = (void *)objc_claimAutoreleasedReturnValue();
            -[_GCControllerManagerServer _hidqueue_popPendingFilterConnectionsForRegistryID:](self, "_hidqueue_popPendingFilterConnectionsForRegistryID:", v42);
            v43 = (void *)objc_claimAutoreleasedReturnValue();

            v64 = 0u;
            v65 = 0u;
            v62 = 0u;
            v63 = 0u;
            v25 = v43;
            v44 = objc_msgSend(v25, "countByEnumeratingWithState:objects:count:", &v62, v76, 16);
            if (v44)
            {
              v45 = v44;
              v46 = *(_QWORD *)v63;
              do
              {
                v47 = 0;
                do
                {
                  if (*(_QWORD *)v63 != v46)
                    objc_enumerationMutation(v25);
                  v48 = *(void **)(*((_QWORD *)&v62 + 1) + 8 * v47);
                  if ((objc_opt_respondsToSelector() & 1) == 0)
                    goto LABEL_91;
                  if (gc_isInternalBuild())
                  {
                    getGCLogger();
                    log = objc_claimAutoreleasedReturnValue();
                    if (os_log_type_enabled(log, OS_LOG_TYPE_DEBUG))
                    {
                      *(_DWORD *)buf = 138412546;
                      v78 = v48;
                      v79 = 2112;
                      v80 = v15;
                      _os_log_debug_impl(&dword_215181000, log, OS_LOG_TYPE_DEBUG, "Sending previous filter connection %@ to %@", buf, 0x16u);
                    }

                  }
                  if ((objc_msgSend(v15, "acceptFilterConnection:forHIDService:", v48, v4, log) & 1) == 0)
                  {
LABEL_91:
                    if (gc_isInternalBuild())
                    {
                      getGCLogger();
                      log = objc_claimAutoreleasedReturnValue();
                      if (os_log_type_enabled(log, OS_LOG_TYPE_INFO))
                      {
                        *(_DWORD *)buf = 138412546;
                        v78 = v48;
                        v79 = 2112;
                        v80 = v15;
                        _os_log_impl(&dword_215181000, log, OS_LOG_TYPE_INFO, "Dropping incoming filter connection %@ because %@ rejected it.", buf, 0x16u);
                      }

                    }
                    objc_msgSend(v48, "invalidate", log);
                  }
                  ++v47;
                }
                while (v45 != v47);
                v49 = objc_msgSend(v25, "countByEnumeratingWithState:objects:count:", &v62, v76, 16);
                v45 = v49;
              }
              while (v49);
            }

            goto LABEL_79;
          }
          -[NSMutableDictionary removeObjectForKey:](self->_hidServiceOwners, "removeObjectForKey:", v4);

        }
        v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v70, v82, 16);
        if (v9)
          continue;
        break;
      }
    }

    if (gc_isInternalBuild())
    {
      getGCLogger();
      v51 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v51, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412290;
        v78 = v4;
        _os_log_impl(&dword_215181000, v51, OS_LOG_TYPE_INFO, "No device manager claimed HID service %@.", buf, 0xCu);
      }

    }
    objc_msgSend(v4, "registryID");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[_GCControllerManagerServer _hidqueue_popPendingDriverConnectionsForRegistryID:](self, "_hidqueue_popPendingDriverConnectionsForRegistryID:", v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    v60 = 0u;
    v61 = 0u;
    v58 = 0u;
    v59 = 0u;
    v15 = v14;
    v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v58, v75, 16);
    if (v16)
    {
      v17 = v16;
      v18 = *(_QWORD *)v59;
      do
      {
        v19 = 0;
        do
        {
          if (*(_QWORD *)v59 != v18)
            objc_enumerationMutation(v15);
          v20 = *(void **)(*((_QWORD *)&v58 + 1) + 8 * v19);
          if (gc_isInternalBuild())
          {
            getGCLogger();
            v21 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
            {
              *(_DWORD *)buf = 138412546;
              v78 = v20;
              v79 = 2112;
              v80 = v4;
              _os_log_impl(&dword_215181000, v21, OS_LOG_TYPE_INFO, "Ignoring incoming driver connection %@ because it is for unclaimed service %@", buf, 0x16u);
            }

          }
          ++v19;
        }
        while (v17 != v19);
        v22 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v58, v75, 16);
        v17 = v22;
      }
      while (v22);
    }

    objc_msgSend(v4, "registryID");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    -[_GCControllerManagerServer _hidqueue_popPendingFilterConnectionsForRegistryID:](self, "_hidqueue_popPendingFilterConnectionsForRegistryID:", v23);
    v24 = (void *)objc_claimAutoreleasedReturnValue();

    v56 = 0u;
    v57 = 0u;
    v54 = 0u;
    v55 = 0u;
    v25 = v24;
    v26 = objc_msgSend(v25, "countByEnumeratingWithState:objects:count:", &v54, v74, 16);
    if (v26)
    {
      v27 = v26;
      v28 = *(_QWORD *)v55;
      do
      {
        v29 = 0;
        do
        {
          if (*(_QWORD *)v55 != v28)
            objc_enumerationMutation(v25);
          v30 = *(void **)(*((_QWORD *)&v54 + 1) + 8 * v29);
          if (gc_isInternalBuild())
          {
            getGCLogger();
            v31 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v31, OS_LOG_TYPE_INFO))
            {
              *(_DWORD *)buf = 138412546;
              v78 = v30;
              v79 = 2112;
              v80 = v4;
              _os_log_impl(&dword_215181000, v31, OS_LOG_TYPE_INFO, "Ignoring incoming filter connection %@ because it is for unclaimed service %@", buf, 0x16u);
            }

          }
          ++v29;
        }
        while (v27 != v29);
        v32 = objc_msgSend(v25, "countByEnumeratingWithState:objects:count:", &v54, v74, 16);
        v27 = v32;
      }
      while (v32);
    }
    v33 = v25;
    v6 = v53;
LABEL_79:

    goto LABEL_80;
  }
  if (gc_isInternalBuild())
  {
    getGCLogger();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
      -[_GCControllerManagerServer onHIDServiceAdded:].cold.2();
LABEL_80:

  }
}

- (void)onHIDServiceRemoved:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  NSObject *v7;

  v4 = a3;
  -[NSMutableDictionary objectForKey:](self->_hidServiceOwners, "objectForKey:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v5)
  {
    objc_msgSend(v5, "relinquishHIDService:", v4);
    -[NSMutableDictionary removeObjectForKey:](self->_hidServiceOwners, "removeObjectForKey:", v4);
    -[NSMutableSet removeObject:](self->_hidServices, "removeObject:", v4);
  }
  else if (gc_isInternalBuild())
  {
    getGCLogger();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
      -[_GCControllerManagerServer onHIDServiceRemoved:].cold.1();

  }
}

- (id)_hidqueue_popPendingDriverConnectionsForRegistryID:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->super._hidSystemClientQueue);
  -[NSMutableDictionary objectForKey:](self->_pendingDriverConnections, "objectForKey:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v12;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v12 != v8)
          objc_enumerationMutation(v5);
        objc_setAssociatedObject(*(id *)(*((_QWORD *)&v11 + 1) + 8 * v9++), "DriverConnectionInvalidationRegistrationKey", 0, (void *)1);
      }
      while (v7 != v9);
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v7);
  }
  -[NSMutableDictionary removeObjectForKey:](self->_pendingDriverConnections, "removeObjectForKey:", v4);

  return v5;
}

- (void)_hidqueue_pushPendingDriverConnection:(id)a3 forRegistryID:(id)a4
{
  id v6;
  id v7;
  NSMutableDictionary *v8;
  NSMutableDictionary *pendingDriverConnections;
  id v10;
  void *v11;
  void *v12;
  _QWORD v13[5];
  id v14;
  id v15;

  v6 = a3;
  v7 = a4;
  dispatch_assert_queue_V2((dispatch_queue_t)self->super._hidSystemClientQueue);
  if (!self->_pendingDriverConnections)
  {
    v8 = (NSMutableDictionary *)objc_msgSend(objc_alloc((Class)&off_254DEBD30), "initWithCapacity:", 1);
    pendingDriverConnections = self->_pendingDriverConnections;
    self->_pendingDriverConnections = v8;

  }
  v13[0] = MEMORY[0x24BDAC760];
  v13[1] = 3221225472;
  v13[2] = __82___GCControllerManagerServer__hidqueue_pushPendingDriverConnection_forRegistryID___block_invoke;
  v13[3] = &unk_24D2B2B98;
  v15 = v6;
  v13[4] = self;
  v10 = v7;
  v14 = v10;
  objc_msgSend(v6, "addInvalidationHandler:", v13);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_setAssociatedObject(v6, "DriverConnectionInvalidationRegistrationKey", v11, (void *)1);
  -[NSMutableDictionary objectForKey:](self->_pendingDriverConnections, "objectForKey:", v10);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v12)
  {
    v12 = (void *)objc_msgSend(objc_alloc((Class)&off_254DEBF30), "initWithCapacity:", 1);
    -[NSMutableDictionary setObject:forKey:](self->_pendingDriverConnections, "setObject:forKey:", v12, v10);
  }
  objc_msgSend(v12, "addObject:", v6);

}

- (id)_hidqueue_popPendingFilterConnectionsForRegistryID:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->super._hidSystemClientQueue);
  -[NSMutableDictionary objectForKey:](self->_pendingFilterConnections, "objectForKey:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v12;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v12 != v8)
          objc_enumerationMutation(v5);
        objc_setAssociatedObject(*(id *)(*((_QWORD *)&v11 + 1) + 8 * v9++), "FilterConnectionInvalidationRegistrationKey", 0, (void *)1);
      }
      while (v7 != v9);
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v7);
  }
  -[NSMutableDictionary removeObjectForKey:](self->_pendingFilterConnections, "removeObjectForKey:", v4);

  return v5;
}

- (void)_hidqueue_pushPendingFilterConnection:(id)a3 forRegistryID:(id)a4
{
  id v6;
  id v7;
  NSMutableDictionary *v8;
  NSMutableDictionary *pendingFilterConnections;
  id v10;
  void *v11;
  void *v12;
  _QWORD v13[5];
  id v14;
  id v15;

  v6 = a3;
  v7 = a4;
  dispatch_assert_queue_V2((dispatch_queue_t)self->super._hidSystemClientQueue);
  if (!self->_pendingFilterConnections)
  {
    v8 = (NSMutableDictionary *)objc_msgSend(objc_alloc((Class)&off_254DEBD30), "initWithCapacity:", 1);
    pendingFilterConnections = self->_pendingFilterConnections;
    self->_pendingFilterConnections = v8;

  }
  v13[0] = MEMORY[0x24BDAC760];
  v13[1] = 3221225472;
  v13[2] = __82___GCControllerManagerServer__hidqueue_pushPendingFilterConnection_forRegistryID___block_invoke;
  v13[3] = &unk_24D2B2B98;
  v15 = v6;
  v13[4] = self;
  v10 = v7;
  v14 = v10;
  objc_msgSend(v6, "addInvalidationHandler:", v13);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_setAssociatedObject(v6, "FilterConnectionInvalidationRegistrationKey", v11, (void *)1);
  -[NSMutableDictionary objectForKey:](self->_pendingFilterConnections, "objectForKey:", v10);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v12)
  {
    v12 = (void *)objc_msgSend(objc_alloc((Class)&off_254DEBF30), "initWithCapacity:", 1);
    -[NSMutableDictionary setObject:forKey:](self->_pendingFilterConnections, "setObject:forKey:", v12, v10);
  }
  objc_msgSend(v12, "addObject:", v6);

}

- (NSSet)activeControllerDevices
{
  return (NSSet *)objc_getProperty(self, a2, 312, 1);
}

- (void)setActiveControllerDevices:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 312);
}

- (NSSet)pidsWithKeyboardAndMouseSupport
{
  return (NSSet *)objc_getProperty(self, a2, 320, 1);
}

- (void)setPidsWithKeyboardAndMouseSupport:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 320);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_pidsWithKeyboardAndMouseSupport, 0);
  objc_storeStrong((id *)&self->_activeControllerDevices, 0);
  objc_storeStrong((id *)&self->_lastGeneratedURL, 0);
  objc_storeStrong((id *)&self->_lastGeneratedDirectoryHandle, 0);
  objc_storeStrong((id *)&self->_lastGeneratedName, 0);
  objc_storeStrong((id *)&self->_pendingFilterConnections, 0);
  objc_storeStrong((id *)&self->_pendingDriverConnections, 0);
  objc_storeStrong((id *)&self->_hidServiceOwners, 0);
  objc_storeStrong((id *)&self->_hidServices, 0);
  objc_storeStrong((id *)&self->_activeConfigurations, 0);
  objc_storeStrong((id *)&self->_logicalDevices, 0);
  objc_storeStrong((id *)&self->_physicalDevices, 0);
  objc_storeStrong((id *)&self->_allDevices, 0);
  objc_storeStrong((id *)&self->_copilotConfigurations, 0);
  objc_storeStrong((id *)&self->_settingsStore, 0);
  objc_storeStrong((id *)&self->_copilotSettings, 0);
  objc_storeStrong((id *)&self->_defaults, 0);
  objc_storeStrong((id *)&self->_configurations, 0);
  objc_storeStrong((id *)&self->_logicalDeviceManagers, 0);
  objc_storeStrong((id *)&self->_physicalDeviceManagers, 0);
  objc_storeStrong((id *)&self->_allDeviceManagers, 0);
}

- (BOOL)acceptIncomingDriverConnection:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  id v7;
  _QWORD v9[4];
  id v10;
  _GCControllerManagerServer *v11;
  os_activity_scope_state_s state;

  v4 = a3;
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  v5 = _os_activity_create(&dword_215181000, "Incoming Driver Connection", MEMORY[0x24BDACB08], OS_ACTIVITY_FLAG_DEFAULT);
  os_activity_scope_enter(v5, &state);
  objc_msgSend(v4, "setExportedObject:", self);
  objc_msgSend(v4, "resume");
  objc_msgSend(v4, "remoteProxy");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x24BDAC760];
  v9[1] = 3221225472;
  v9[2] = __74___GCControllerManagerServer_Connections__acceptIncomingDriverConnection___block_invoke;
  v9[3] = &unk_24D2B2BE8;
  v10 = v4;
  v11 = self;
  v7 = v4;
  objc_msgSend(v6, "fetchDeviceRegistryIDWithReply:", v9);

  os_activity_scope_leave(&state);
  return 1;
}

- (void)setLastGeneratedName:(id)a3 directoryHandle:(id)a4 url:(id)a5
{
  NSString *v8;
  NSFileHandle *v9;
  NSURL *v10;
  NSString *lastGeneratedName;
  NSString *v12;
  NSFileHandle *lastGeneratedDirectoryHandle;
  NSFileHandle *v14;
  NSURL *lastGeneratedURL;
  _GCControllerManagerServer *obj;

  v8 = (NSString *)a3;
  v9 = (NSFileHandle *)a4;
  v10 = (NSURL *)a5;
  obj = self;
  objc_sync_enter(obj);
  lastGeneratedName = obj->_lastGeneratedName;
  obj->_lastGeneratedName = v8;
  v12 = v8;

  lastGeneratedDirectoryHandle = obj->_lastGeneratedDirectoryHandle;
  obj->_lastGeneratedDirectoryHandle = v9;
  v14 = v9;

  lastGeneratedURL = obj->_lastGeneratedURL;
  obj->_lastGeneratedURL = v10;

  objc_sync_exit(obj);
}

- (BOOL)getLastGeneratedName:(id *)a3 directoryHandle:(id *)a4 url:(id *)a5
{
  _GCControllerManagerServer *v8;
  NSString *v9;
  NSString *lastGeneratedName;
  NSFileHandle *lastGeneratedDirectoryHandle;
  NSFileHandle *v12;
  NSURL *v13;
  NSURL *lastGeneratedURL;
  BOOL v15;
  BOOL v17;

  v8 = self;
  objc_sync_enter(v8);
  v9 = v8->_lastGeneratedName;
  lastGeneratedName = v8->_lastGeneratedName;
  v8->_lastGeneratedName = 0;

  lastGeneratedDirectoryHandle = v8->_lastGeneratedDirectoryHandle;
  v8->_lastGeneratedDirectoryHandle = 0;
  v12 = lastGeneratedDirectoryHandle;

  v13 = v8->_lastGeneratedURL;
  lastGeneratedURL = v8->_lastGeneratedURL;
  v8->_lastGeneratedURL = 0;

  objc_sync_exit(v8);
  if (a3)
    *a3 = objc_retainAutorelease(v9);
  if (a4)
    *a4 = objc_retainAutorelease(v12);
  if (a5)
    *a5 = objc_retainAutorelease(v13);
  if (v9)
    v15 = v12 == 0;
  else
    v15 = 1;
  v17 = !v15 || v13 != 0;

  return v17;
}

- (id)lastGeneratedURL
{
  _GCControllerManagerServer *v2;
  NSURL *v3;
  NSURL *lastGeneratedURL;

  v2 = self;
  objc_sync_enter(v2);
  v3 = v2->_lastGeneratedURL;
  lastGeneratedURL = v2->_lastGeneratedURL;
  v2->_lastGeneratedURL = 0;

  objc_sync_exit(v2);
  return v3;
}

- (void)addConfiguration:(void *)a1 replaceExisting:(NSObject *)a2 .cold.1(void *a1, NSObject *a2)
{
  void *v3;
  uint64_t v4;
  uint8_t v5[24];
  uint64_t v6;

  v6 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(a1, "debugDescription");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0(&dword_215181000, a2, v4, "Adding configuration: %@", v5);

  OUTLINED_FUNCTION_2();
}

- (void)updateConfiguration:(void *)a1 .cold.1(void *a1, NSObject *a2)
{
  void *v3;
  uint64_t v4;
  uint8_t v5[24];
  uint64_t v6;

  v6 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(a1, "debugDescription");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0(&dword_215181000, a2, v4, "Updating configuration: %@", v5);

  OUTLINED_FUNCTION_2();
}

- (void)removeConfigurationWithIdentifier:(void *)a1 .cold.1(void *a1, NSObject *a2)
{
  void *v3;
  uint64_t v4;
  uint8_t v5[24];
  uint64_t v6;

  v6 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(a1, "debugDescription");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0(&dword_215181000, a2, v4, "Removing configuration: %@", v5);

  OUTLINED_FUNCTION_2();
}

- (void)onHIDServiceAdded:.cold.1()
{
  uint64_t v0;
  NSObject *v1;
  uint8_t v2[12];
  __int16 v3;
  uint64_t v4;
  uint64_t v5;

  v5 = *MEMORY[0x24BDAC8D0];
  OUTLINED_FUNCTION_3();
  v3 = 2112;
  v4 = v0;
  OUTLINED_FUNCTION_6(&dword_215181000, v1, (uint64_t)v1, "Device manager %@ has claimed ownership of HID service %@.", v2);
  OUTLINED_FUNCTION_5();
}

- (void)onHIDServiceAdded:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[24];
  uint64_t v3;

  v3 = *MEMORY[0x24BDAC8D0];
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0(&dword_215181000, v0, v1, "Ignoring added notification for HID service %@, because it is already known.", v2);
  OUTLINED_FUNCTION_5();
}

- (void)onHIDServiceRemoved:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[24];
  uint64_t v3;

  v3 = *MEMORY[0x24BDAC8D0];
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0(&dword_215181000, v0, v1, "Ignoring removed notification for HID service %@, because it was not previously claimed.", v2);
  OUTLINED_FUNCTION_5();
}

@end
