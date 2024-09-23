@implementation _GCNintendoFusedJoyConDevice

- (_GCNintendoFusedJoyConDevice)initWithLeft:(id)a3 right:(id)a4 manager:(id)a5
{
  id v9;
  id v10;
  id v11;
  _GCNintendoFusedJoyConDevice *v12;
  _GCNintendoFusedJoyConDevice *v13;
  uint64_t v14;
  NSObject *identifier;
  uint64_t v16;
  NSMapTable *clients;
  uint64_t v18;
  NSMapTable *clientPlayerIndicatorEndpoints;
  GCDeviceBattery *v20;
  double v21;
  uint64_t v22;
  GCDeviceBattery *battery;
  uint64_t v24;
  NSMapTable *clientBatteryEndpoints;
  uint64_t v26;
  uint64_t v27;
  void *v28;
  GCHapticCapabilityGraph *v29;
  GCHapticCapabilityGraph *hapticCapabilityGraph;
  _GCNintendoFusedJoyConHapticDriver *v31;
  _GCDriverClientHapticInterface *hapticDriver;
  uint64_t v33;
  NSMapTable *clientSettingsEndpoints;
  uint64_t v35;
  GCSSettingsStoreService *settingsStore;
  void *v37;
  void *v38;
  _QWORD v40[4];
  id v41;
  _QWORD v42[4];
  id v43;
  id location;
  objc_super v45;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v45.receiver = self;
  v45.super_class = (Class)_GCNintendoFusedJoyConDevice;
  v12 = -[_GCNintendoFusedJoyConDevice init](&v45, sel_init);
  v13 = v12;
  if (v12)
  {
    objc_storeWeak((id *)&v12->_manager, v11);
    objc_msgSend((id)objc_opt_class(), "identifierForFusedJoyConDeviceWithLeftDevice:rightDevice:", v9, v10);
    v14 = objc_claimAutoreleasedReturnValue();
    identifier = v13->_identifier;
    v13->_identifier = v14;

    objc_storeStrong((id *)&v13->_leftDevice, a3);
    objc_storeStrong((id *)&v13->_rightDevice, a4);
    +[NSMapTable strongToStrongObjectsMapTable](&off_254DF7908, "strongToStrongObjectsMapTable");
    v16 = objc_claimAutoreleasedReturnValue();
    clients = v13->_clients;
    v13->_clients = (NSMapTable *)v16;

    v13->_indicatedPlayerIndex = -1;
    +[NSMapTable strongToStrongObjectsMapTable](&off_254DF7908, "strongToStrongObjectsMapTable");
    v18 = objc_claimAutoreleasedReturnValue();
    clientPlayerIndicatorEndpoints = v13->_clientPlayerIndicatorEndpoints;
    v13->_clientPlayerIndicatorEndpoints = (NSMapTable *)v18;

    v20 = [GCDeviceBattery alloc];
    LODWORD(v21) = 0;
    v22 = -[GCDeviceBattery initWithLevel:batteryState:](v20, "initWithLevel:batteryState:", -1, v21);
    battery = v13->_battery;
    v13->_battery = (GCDeviceBattery *)v22;

    +[NSMapTable strongToStrongObjectsMapTable](&off_254DF7908, "strongToStrongObjectsMapTable");
    v24 = objc_claimAutoreleasedReturnValue();
    clientBatteryEndpoints = v13->_clientBatteryEndpoints;
    v13->_clientBatteryEndpoints = (NSMapTable *)v24;

    objc_initWeak(&location, v13);
    v26 = MEMORY[0x24BDAC760];
    v42[0] = MEMORY[0x24BDAC760];
    v42[1] = 3221225472;
    v42[2] = __59___GCNintendoFusedJoyConDevice_initWithLeft_right_manager___block_invoke;
    v42[3] = &unk_24D2B4980;
    objc_copyWeak(&v43, &location);
    -[_GCNintendoJoyConDevice setDeviceBatteryComponentBatteryUpdatedHandler:](v13->_leftDevice, "setDeviceBatteryComponentBatteryUpdatedHandler:", v42);
    v40[0] = v26;
    v40[1] = 3221225472;
    v40[2] = __59___GCNintendoFusedJoyConDevice_initWithLeft_right_manager___block_invoke_2;
    v40[3] = &unk_24D2B4980;
    objc_copyWeak(&v41, &location);
    -[_GCNintendoJoyConDevice setDeviceBatteryComponentBatteryUpdatedHandler:](v13->_rightDevice, "setDeviceBatteryComponentBatteryUpdatedHandler:", v40);
    v27 = objc_opt_class();
    loadNSDictionaryFromJSON(v27, CFSTR("JoyConFusedHapticCapabilityGraph"));
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    v29 = -[GCHapticCapabilityGraph initWithJSONDictionaryRepresentation:]([GCHapticCapabilityGraph alloc], "initWithJSONDictionaryRepresentation:", v28);
    hapticCapabilityGraph = v13->_hapticCapabilityGraph;
    v13->_hapticCapabilityGraph = v29;

    v31 = -[_GCNintendoFusedJoyConHapticDriver initWithDevice:]([_GCNintendoFusedJoyConHapticDriver alloc], "initWithDevice:", v13);
    hapticDriver = v13->_hapticDriver;
    v13->_hapticDriver = (_GCDriverClientHapticInterface *)v31;

    +[NSMapTable strongToStrongObjectsMapTable](&off_254DF7908, "strongToStrongObjectsMapTable");
    v33 = objc_claimAutoreleasedReturnValue();
    clientSettingsEndpoints = v13->_clientSettingsEndpoints;
    v13->_clientSettingsEndpoints = (NSMapTable *)v33;

    GCLookupService();
    v35 = objc_claimAutoreleasedReturnValue();
    settingsStore = v13->_settingsStore;
    v13->_settingsStore = (GCSSettingsStoreService *)v35;

    -[GCSSettingsStoreService profiles](v13->_settingsStore, "profiles");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v37, "addObserver:forKeyPath:options:context:", v13, CFSTR("values"), 5, 0);

    -[GCSSettingsStoreService games](v13->_settingsStore, "games");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v38, "addObserver:forKeyPath:options:context:", v13, CFSTR("values"), 5, 0);

    if ((-[GCSSettingsStoreService showGCPreferencesPane](v13->_settingsStore, "showGCPreferencesPane") & 1) == 0)
      -[GCSSettingsStoreService setShowGCPreferencesPane:](v13->_settingsStore, "setShowGCPreferencesPane:", 1);

    objc_destroyWeak(&v41);
    objc_destroyWeak(&v43);
    objc_destroyWeak(&location);
  }

  return v13;
}

- (_GCNintendoFusedJoyConDevice)init
{
  -[_GCNintendoFusedJoyConDevice doesNotRecognizeSelector:](self, "doesNotRecognizeSelector:", a2);

  return 0;
}

- (void)dealloc
{
  GCSSettingsStoreService *settingsStore;
  void *v4;
  void *v5;
  objc_super v6;

  settingsStore = self->_settingsStore;
  if (settingsStore)
  {
    -[GCSSettingsStoreService profiles](settingsStore, "profiles");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "removeObserver:forKeyPath:context:", self, CFSTR("values"), 0);

    -[GCSSettingsStoreService games](self->_settingsStore, "games");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "removeObserver:forKeyPath:context:", self, CFSTR("values"), 0);

  }
  v6.receiver = self;
  v6.super_class = (Class)_GCNintendoFusedJoyConDevice;
  -[_GCNintendoFusedJoyConDevice dealloc](&v6, sel_dealloc);
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  id v10;
  id v11;
  id v12;
  objc_super v13;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  if (objc_msgSend(v10, "isEqualToString:", CFSTR("values")))
  {
    -[_GCNintendoFusedJoyConDevice settingsDidChange](self, "settingsDidChange");
  }
  else
  {
    v13.receiver = self;
    v13.super_class = (Class)_GCNintendoFusedJoyConDevice;
    -[_GCNintendoFusedJoyConDevice observeValueForKeyPath:ofObject:change:context:](&v13, sel_observeValueForKeyPath_ofObject_change_context_, v10, v11, v12, a6);
  }

}

- (void)playerIndicatorXPCProxyServerEndpoint:(id)a3 didReceivePlayerIndexChange:(int64_t)a4
{
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  -[_GCNintendoFusedJoyConDevice setIndicatedPlayerIndex:](self, "setIndicatedPlayerIndex:", a4);
  v13 = 0u;
  v14 = 0u;
  v11 = 0u;
  v12 = 0u;
  -[NSMapTable objectEnumerator](self->_clientPlayerIndicatorEndpoints, "objectEnumerator", 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v12;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v12 != v9)
          objc_enumerationMutation(v6);
        objc_msgSend(*(id *)(*((_QWORD *)&v11 + 1) + 8 * v10++), "setPlayerIndex:", a4);
      }
      while (v8 != v10);
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v8);
  }

}

- (NSSet)components
{
  return +[NSSet setWithObject:](&off_254DEBEC0, "setWithObject:", self);
}

- (id)propertyForKey:(id)a3
{
  return 0;
}

- (NSSet)underlyingDevices
{
  _GCNintendoJoyConDevice *rightDevice;
  void *v3;
  void *v4;
  _QWORD v6[3];

  v6[2] = *MEMORY[0x24BDAC8D0];
  rightDevice = self->_rightDevice;
  v6[0] = self->_leftDevice;
  v6[1] = rightDevice;
  +[NSArray arrayWithObjects:count:](NSArray_0, "arrayWithObjects:count:", v6, 2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  +[NSSet setWithArray:](&off_254DEBEC0, "setWithArray:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSSet *)v4;
}

- (void)activateLogical
{
  -[_GCNintendoJoyConDevice setInputMode:](self->_leftDevice, "setInputMode:", 48);
  -[_GCNintendoJoyConDevice setInputMode:](self->_rightDevice, "setInputMode:", 48);
}

+ (id)identifierForFusedJoyConDeviceWithLeftDevice:(id)a3 rightDevice:(id)a4
{
  id v5;
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;

  v5 = a4;
  v6 = a3;
  v7 = objc_alloc((Class)&off_254DEDEA8);
  objc_msgSend(v6, "identifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "identifier");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = (void *)objc_msgSend(v7, "initWithFormat:", CFSTR("FUSED_JOYCONS(L: %@, R: %@)"), v8, v9);
  return v10;
}

- (_GCDeviceManager)manager
{
  return (_GCDeviceManager *)objc_loadWeakRetained((id *)&self->_manager);
}

- (NSObject)identifier
{
  return objc_getProperty(self, a2, 80, 1);
}

- (_GCDeviceConfiguration)configuration
{
  return self->_configuration;
}

- (void)setConfiguration:(id)a3
{
  objc_storeStrong((id *)&self->_configuration, a3);
}

- (_GCNintendoJoyConDevice)leftDevice
{
  return self->_leftDevice;
}

- (_GCNintendoJoyConDevice)rightDevice
{
  return self->_rightDevice;
}

- (_GCDriverClientHapticInterface)hapticDriver
{
  return self->_hapticDriver;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_hapticDriver, 0);
  objc_storeStrong((id *)&self->_rightDevice, 0);
  objc_storeStrong((id *)&self->_leftDevice, 0);
  objc_storeStrong((id *)&self->_configuration, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_destroyWeak((id *)&self->_manager);
  objc_storeStrong((id *)&self->_hapticCapabilityGraph, 0);
  objc_storeStrong((id *)&self->_clientSettingsEndpoints, 0);
  objc_storeStrong((id *)&self->_settingsStore, 0);
  objc_storeStrong((id *)&self->_clientBatteryEndpoints, 0);
  objc_storeStrong((id *)&self->_battery, 0);
  objc_storeStrong((id *)&self->_clientPlayerIndicatorEndpoints, 0);
  objc_storeStrong((id *)&self->_clients, 0);
}

- (void)_addClient:(id)a3
{
  id v4;
  _GCNintendoFusedJoyConDevice *v5;
  void *v6;
  void *v7;
  NSObject *v8;
  _QWORD v9[4];
  id v10;
  id v11;
  id from;
  id location;

  v4 = a3;
  v5 = self;
  objc_sync_enter(v5);
  if (v4)
  {
    -[NSMapTable objectForKey:](v5->_clients, "objectForKey:", v4);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v6)
    {
      objc_initWeak(&location, v5);
      objc_initWeak(&from, v4);
      v9[0] = MEMORY[0x24BDAC760];
      v9[1] = 3221225472;
      v9[2] = __51___GCNintendoFusedJoyConDevice_Client___addClient___block_invoke;
      v9[3] = &unk_24D2B3EA8;
      objc_copyWeak(&v10, &location);
      objc_copyWeak(&v11, &from);
      objc_msgSend(v4, "addInvalidationHandler:", v9);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSMapTable setObject:forKey:](v5->_clients, "setObject:forKey:", v7, v4);
      if (gc_isInternalBuild())
      {
        getGCLogger();
        v8 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
          -[_GCNintendoFusedJoyConDevice(Client) _addClient:].cold.1();

      }
      objc_destroyWeak(&v11);
      objc_destroyWeak(&v10);
      objc_destroyWeak(&from);
      objc_destroyWeak(&location);
    }
  }
  objc_sync_exit(v5);

}

- (void)_removeClient:(id)a3
{
  id v4;
  _GCNintendoFusedJoyConDevice *v5;
  void *v6;
  NSObject *v7;

  v4 = a3;
  v5 = self;
  objc_sync_enter(v5);
  if (v4)
  {
    -[NSMapTable objectForKey:](v5->_clients, "objectForKey:", v4);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (v6)
    {
      -[NSMapTable removeObjectForKey:](v5->_clientPlayerIndicatorEndpoints, "removeObjectForKey:", v4);
      -[NSMapTable removeObjectForKey:](v5->_clientBatteryEndpoints, "removeObjectForKey:", v4);
      -[NSMapTable removeObjectForKey:](v5->_clientSettingsEndpoints, "removeObjectForKey:", v4);
      -[NSMapTable removeObjectForKey:](v5->_clients, "removeObjectForKey:", v4);
      if (gc_isInternalBuild())
      {
        getGCLogger();
        v7 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
          -[_GCNintendoFusedJoyConDevice(Client) _removeClient:].cold.1();

      }
    }
  }
  objc_sync_exit(v5);

}

- (id)makeControllerForClient:(id)a3
{
  GCProductInformation *v3;
  _GCControllerComponentDescription *v4;
  void *v5;
  uint64_t i;
  _GCNintendoSwitchGamepad *v7;
  _GCControllerComponentDescription *v8;
  void *v9;
  _GCControllerComponentDescription *v10;
  uint64_t j;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  void *v59;
  void *v60;
  void *v61;
  void *v62;
  void *v63;
  void *v64;
  void *v65;
  void *v66;
  void *v67;
  void *v68;
  void *v69;
  void *v70;
  void *v71;
  void *v72;
  void *v73;
  void *v74;
  void *v75;
  void *v76;
  void *v77;
  void *v78;
  void *v79;
  void *v80;
  void *v81;
  void *v82;
  void *v83;
  void *v84;
  void *v85;
  void *v86;
  void *v87;
  void *v88;
  void *v89;
  void *v90;
  void *v91;
  void *v92;
  void *v93;
  void *v94;
  void *v95;
  void *v96;
  void *v97;
  void *v98;
  void *v99;
  void *v100;
  void *v101;
  void *v102;
  void *v103;
  void *v104;
  void *v105;
  void *v106;
  void *v107;
  void *v108;
  void *v109;
  void *v110;
  void *v111;
  void *v112;
  void *v113;
  void *v114;
  _GCControllerInputComponentDescription *v115;
  void *v116;
  _GCControllerInputComponentDescription *v117;
  _GCNintendoFusedJoyConDevice *v118;
  GCPlayerIndicatorXPCProxyServerEndpoint *v119;
  GCPlayerIndicatorXPCProxyServerEndpoint *v120;
  void *v121;
  void *v122;
  void *v123;
  _GCNintendoFusedJoyConDevice *v124;
  GCBatteryXPCProxyServerEndpoint *v125;
  GCBatteryXPCProxyServerEndpoint *v126;
  void *v127;
  void *v128;
  void *v129;
  GCHapticCapabilities *v130;
  void *v131;
  void *v132;
  void *v133;
  GCHapticCapabilities *v134;
  _GCControllerComponentDescription *v135;
  id *v136;
  GCSettingsXPCProxyServerEndpoint *v137;
  id v138;
  void *v139;
  void *v140;
  void *v141;
  void *v142;
  GCSettingsXPCProxyServerEndpoint *v143;
  void *v144;
  void *v145;
  void *v146;
  _GCControllerDescription *v147;
  void *v148;
  _GCControllerDescription *v149;
  void *v151;
  void *v153;
  void *v154;
  void *v155;
  void *v156;
  void *v157;
  void *v158;
  void *v159;
  void *v160;
  void *v161;
  void *v162;
  void *v163;
  void *v164;
  id v165;
  void *v166;
  _OWORD v167[23];
  __int128 v168;
  __int128 v169;
  __int128 v170;
  __int128 v171;
  __int128 v172;
  __int128 v173;
  __int128 v174;
  __int128 v175;
  __int128 v176;
  void *v177;
  _QWORD v178[15];
  void *v179;
  void *v180;
  void *v181;
  void *v182;
  void *v183;
  void *v184;
  void *v185;
  void *v186;
  void *v187;
  void *v188;
  void *v189;
  void *v190;
  void *v191;
  void *v192;
  _QWORD v193[3];

  v193[1] = *MEMORY[0x24BDAC8D0];
  v165 = a3;
  +[NSMutableArray array](&off_254DEBB20, "array");
  v166 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = -[GCProductInformation initWithIdentifier:]([GCProductInformation alloc], "initWithIdentifier:", CFSTR("ProductInfo"));
  -[GCProductInformation setProductCategory:](v3, "setProductCategory:", CFSTR("Nintendo Switch Joy-Con (L/R)"));
  -[GCProductInformation setVendorName:](v3, "setVendorName:", CFSTR("Joy-Con (L/R)"));
  v4 = -[_GCControllerComponentDescription initWithComponent:bindings:]([_GCControllerComponentDescription alloc], "initWithComponent:bindings:", v3, 0);
  objc_msgSend(v166, "addObject:", v4);

  -[_GCNintendoFusedJoyConDevice gamepadEventSource](self, "gamepadEventSource");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v175 = 0u;
  v176 = 0u;
  v173 = 0u;
  v174 = 0u;
  v171 = 0u;
  v172 = 0u;
  v169 = 0u;
  v170 = 0u;
  v168 = 0u;
  memset(v167, 0, sizeof(v167));
  GCExtendedGamepadInitInfoMake(v167);
  for (i = 0; i != 1152; i += 72)
    *(_WORD *)((char *)v167 + i + 8) = 257;
  BYTE1(v168) = 0;
  BYTE9(v172) = 0;
  v7 = -[GCExtendedGamepad initWithIdentifier:info:]([_GCNintendoSwitchGamepad alloc], "initWithIdentifier:info:", CFSTR("PhysicalInput"), v167);
  v8 = [_GCControllerComponentDescription alloc];
  v193[0] = v5;
  +[NSArray arrayWithObjects:count:](NSArray_0, "arrayWithObjects:count:", v193, 1);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = -[_GCControllerComponentDescription initWithComponent:bindings:](v8, "initWithComponent:bindings:", v7, v9);

  objc_msgSend(v166, "addObject:", v10);
  for (j = 0; j != 1584; j += 72)
    __destructor_8_s0_s48_s56_s64((id *)((char *)v167 + j));

  -[_GCNintendoFusedJoyConDevice gamepadEventSource](self, "gamepadEventSource");
  v151 = (void *)objc_claimAutoreleasedReturnValue();
  +[GCDevicePhysicalInputButtonElementDescription descriptionWithIdentifier:](&off_254DE3590, "descriptionWithIdentifier:", CFSTR("button.home"));
  v164 = (void *)objc_claimAutoreleasedReturnValue();
  +[NSSet setWithObject:](&off_254DEBEC0, "setWithObject:", CFSTR("Button Home"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v164, "setAliases:", v12);

  objc_msgSend(v164, "setLocalizedName:", *MEMORY[0x24BE3A538]);
  unk_254DE2B74(&off_254DE2DC8, "symbolWithSFSymbolsName:", CFSTR("house.circle"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v164, "setSymbol:", v13);

  objc_msgSend(v164, "setEventPressedValueField:", 22);
  +[GCDevicePhysicalInputButtonElementDescription descriptionWithIdentifier:](&off_254DE3590, "descriptionWithIdentifier:", CFSTR("button.capture"));
  v163 = (void *)objc_claimAutoreleasedReturnValue();
  +[NSSet setWithObject:](&off_254DEBEC0, "setWithObject:", CFSTR("Button Share"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v163, "setAliases:", v14);

  objc_msgSend(v163, "setLocalizedName:", *MEMORY[0x24BE3A398]);
  unk_254DE2B74(&off_254DE2DC8, "symbolWithSFSymbolsName:", CFSTR("circle.square"));
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v163, "setSymbol:", v15);

  objc_msgSend(v163, "setEventPressedValueField:", 40);
  +[GCDevicePhysicalInputButtonElementDescription descriptionWithIdentifier:](&off_254DE3590, "descriptionWithIdentifier:", CFSTR("button.plus"));
  v162 = (void *)objc_claimAutoreleasedReturnValue();
  +[NSSet setWithObject:](&off_254DEBEC0, "setWithObject:", CFSTR("Button Menu"));
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v162, "setAliases:", v16);

  objc_msgSend(v162, "setLocalizedName:", *MEMORY[0x24BE3A548]);
  unk_254DE2B74(&off_254DE2DC8, "symbolWithSFSymbolsName:", CFSTR("plus.circle"));
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v162, "setSymbol:", v17);

  objc_msgSend(v162, "setEventPressedValueField:", 23);
  +[GCDevicePhysicalInputButtonElementDescription descriptionWithIdentifier:](&off_254DE3590, "descriptionWithIdentifier:", CFSTR("button.minus"));
  v161 = (void *)objc_claimAutoreleasedReturnValue();
  +[NSSet setWithObject:](&off_254DEBEC0, "setWithObject:", CFSTR("Button Options"));
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v161, "setAliases:", v18);

  objc_msgSend(v161, "setLocalizedName:", *MEMORY[0x24BE3A550]);
  unk_254DE2B74(&off_254DE2DC8, "symbolWithSFSymbolsName:", CFSTR("minus.circle"));
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v161, "setSymbol:", v19);

  objc_msgSend(v161, "setEventPressedValueField:", 24);
  +[GCDevicePhysicalInputButtonElementDescription descriptionWithIdentifier:](&off_254DE3590, "descriptionWithIdentifier:", CFSTR("button.a"));
  v160 = (void *)objc_claimAutoreleasedReturnValue();
  +[NSSet setWithObject:](&off_254DEBEC0, "setWithObject:", CFSTR("Button A"));
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v160, "setAliases:", v20);

  objc_msgSend(v160, "setLocalizedName:", *MEMORY[0x24BE3A528]);
  unk_254DE2B74(&off_254DE2DC8, "symbolWithSFSymbolsName:", CFSTR("a.circle"));
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v160, "setSymbol:", v21);

  objc_msgSend(v160, "setEventPressedValueField:", 4);
  +[GCDevicePhysicalInputButtonElementDescription descriptionWithIdentifier:](&off_254DE3590, "descriptionWithIdentifier:", CFSTR("button.b"));
  v159 = (void *)objc_claimAutoreleasedReturnValue();
  +[NSSet setWithObject:](&off_254DEBEC0, "setWithObject:", CFSTR("Button B"));
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v159, "setAliases:", v22);

  objc_msgSend(v159, "setLocalizedName:", *MEMORY[0x24BE3A530]);
  unk_254DE2B74(&off_254DE2DC8, "symbolWithSFSymbolsName:", CFSTR("b.circle"));
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v159, "setSymbol:", v23);

  objc_msgSend(v159, "setEventPressedValueField:", 5);
  +[GCDevicePhysicalInputButtonElementDescription descriptionWithIdentifier:](&off_254DE3590, "descriptionWithIdentifier:", CFSTR("button.x"));
  v158 = (void *)objc_claimAutoreleasedReturnValue();
  +[NSSet setWithObject:](&off_254DEBEC0, "setWithObject:", CFSTR("Button X"));
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v158, "setAliases:", v24);

  objc_msgSend(v158, "setLocalizedName:", *MEMORY[0x24BE3A560]);
  unk_254DE2B74(&off_254DE2DC8, "symbolWithSFSymbolsName:", CFSTR("x.circle"));
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v158, "setSymbol:", v25);

  objc_msgSend(v158, "setEventPressedValueField:", 6);
  +[GCDevicePhysicalInputButtonElementDescription descriptionWithIdentifier:](&off_254DE3590, "descriptionWithIdentifier:", CFSTR("button.y"));
  v157 = (void *)objc_claimAutoreleasedReturnValue();
  +[NSSet setWithObject:](&off_254DEBEC0, "setWithObject:", CFSTR("Button Y"));
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v157, "setAliases:", v26);

  objc_msgSend(v157, "setLocalizedName:", *MEMORY[0x24BE3A568]);
  unk_254DE2B74(&off_254DE2DC8, "symbolWithSFSymbolsName:", CFSTR("y.circle"));
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v157, "setSymbol:", v27);

  objc_msgSend(v157, "setEventPressedValueField:", 7);
  +[GCDevicePhysicalInputButtonElementDescription descriptionWithIdentifier:](&off_254DE3590, "descriptionWithIdentifier:", CFSTR("button.l"));
  v156 = (void *)objc_claimAutoreleasedReturnValue();
  +[NSSet setWithObject:](&off_254DEBEC0, "setWithObject:", CFSTR("Left Shoulder"));
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v156, "setAliases:", v28);

  objc_msgSend(v156, "setLocalizedName:", *MEMORY[0x24BE3A578]);
  unk_254DE2B74(&off_254DE2DC8, "symbolWithSFSymbolsName:", CFSTR("l1.rectangle.roundedbottom"));
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v156, "setSymbol:", v29);

  objc_msgSend(v156, "setEventPressedValueField:", 8);
  +[GCDevicePhysicalInputButtonElementDescription descriptionWithIdentifier:](&off_254DE3590, "descriptionWithIdentifier:", CFSTR("button.r"));
  v155 = (void *)objc_claimAutoreleasedReturnValue();
  +[NSSet setWithObject:](&off_254DEBEC0, "setWithObject:", CFSTR("Right Shoulder"));
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v155, "setAliases:", v30);

  objc_msgSend(v155, "setLocalizedName:", *MEMORY[0x24BE3A5B8]);
  unk_254DE2B74(&off_254DE2DC8, "symbolWithSFSymbolsName:", CFSTR("r1.rectangle.roundedbottom"));
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v155, "setSymbol:", v31);

  objc_msgSend(v155, "setEventPressedValueField:", 9);
  +[GCDevicePhysicalInputButtonElementDescription descriptionWithIdentifier:](&off_254DE3590, "descriptionWithIdentifier:", CFSTR("button.zl"));
  v154 = (void *)objc_claimAutoreleasedReturnValue();
  +[NSSet setWithObject:](&off_254DEBEC0, "setWithObject:", CFSTR("Left Trigger"));
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v154, "setAliases:", v32);

  objc_msgSend(v154, "setLocalizedName:", *MEMORY[0x24BE3A588]);
  unk_254DE2B74(&off_254DE2DC8, "symbolWithSFSymbolsName:", CFSTR("zl.rectangle.roundedtop"));
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v154, "setSymbol:", v33);

  objc_msgSend(v154, "setEventPressedValueField:", 18);
  +[GCDevicePhysicalInputButtonElementDescription descriptionWithIdentifier:](&off_254DE3590, "descriptionWithIdentifier:", CFSTR("button.zr"));
  v153 = (void *)objc_claimAutoreleasedReturnValue();
  +[NSSet setWithObject:](&off_254DEBEC0, "setWithObject:", CFSTR("Right Trigger"));
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v153, "setAliases:", v34);

  objc_msgSend(v153, "setLocalizedName:", *MEMORY[0x24BE3A5C8]);
  unk_254DE2B74(&off_254DE2DC8, "symbolWithSFSymbolsName:", CFSTR("zr.rectangle.roundedtop"));
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v153, "setSymbol:", v35);

  objc_msgSend(v153, "setEventPressedValueField:", 19);
  +[GCDevicePhysicalInputDirectionPadElementDescription descriptionWithIdentifier:](&off_254DE25E8, "descriptionWithIdentifier:", CFSTR("dpad"));
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  +[NSSet setWithObject:](&off_254DEBEC0, "setWithObject:", CFSTR("Direction Pad"));
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v36, "setAliases:", v37);

  objc_msgSend(v36, "setLocalizedName:", *MEMORY[0x24BE3A570]);
  unk_254DE2B74(&off_254DE2DC8, "symbolWithSFSymbolsName:", CFSTR("dpad"));
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v36, "setSymbol:", v38);

  objc_msgSend(v36, "setAnalog:", 0);
  objc_msgSend(v36, "setEventUpValueField:", 0);
  objc_msgSend(v36, "setEventDownValueField:", 1);
  objc_msgSend(v36, "setEventLeftValueField:", 2);
  objc_msgSend(v36, "setEventRightValueField:", 3);
  +[GCDevicePhysicalInputClickableDirectionPadElementDescription descriptionWithIdentifier:](&off_254DE2770, "descriptionWithIdentifier:", CFSTR("stick.left"));
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  +[NSSet setWithObjects:](&off_254DEBEC0, "setWithObjects:", CFSTR("Left Thumbstick"), CFSTR("Left Thumbstick Button"), 0);
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v39, "setAliases:", v40);

  objc_msgSend(v39, "setLocalizedName:", *MEMORY[0x24BE3A580]);
  unk_254DE2B74(&off_254DE2DC8, "symbolWithSFSymbolsName:", CFSTR("l.joystick"));
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v39, "setSymbol:", v41);

  objc_msgSend(v39, "setAnalog:", 1);
  objc_msgSend(v39, "setEventUpValueField:", 10);
  objc_msgSend(v39, "setEventDownValueField:", 11);
  objc_msgSend(v39, "setEventLeftValueField:", 12);
  objc_msgSend(v39, "setEventRightValueField:", 13);
  objc_msgSend(v39, "setEventPressedValueField:", 20);
  +[NSSet setWithObject:](&off_254DEBEC0, "setWithObject:", CFSTR("Left Thumbstick"));
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v39, "localizedName");
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v39, "symbol");
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  unk_254DE2FDC(&off_254DE3248, "sourceWithElementAliases:localizedName:symbol:direction:", v42, v43, v44, 10);
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  v192 = v45;
  +[NSArray arrayWithObjects:count:](NSArray_0, "arrayWithObjects:count:", &v192, 1);
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v39, "setXSources:", v46);

  +[NSSet setWithObject:](&off_254DEBEC0, "setWithObject:", CFSTR("Left Thumbstick"));
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v39, "localizedName");
  v48 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v39, "symbol");
  v49 = (void *)objc_claimAutoreleasedReturnValue();
  unk_254DE2FDC(&off_254DE3248, "sourceWithElementAliases:localizedName:symbol:direction:", v47, v48, v49, 5);
  v50 = (void *)objc_claimAutoreleasedReturnValue();
  v191 = v50;
  +[NSArray arrayWithObjects:count:](NSArray_0, "arrayWithObjects:count:", &v191, 1);
  v51 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v39, "setYSources:", v51);

  +[NSSet setWithObject:](&off_254DEBEC0, "setWithObject:", CFSTR("Left Thumbstick"));
  v52 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v39, "localizedName");
  v53 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v39, "symbol");
  v54 = (void *)objc_claimAutoreleasedReturnValue();
  unk_254DE2FDC(&off_254DE3248, "sourceWithElementAliases:localizedName:symbol:direction:", v52, v53, v54, 1);
  v55 = (void *)objc_claimAutoreleasedReturnValue();
  v190 = v55;
  +[NSArray arrayWithObjects:count:](NSArray_0, "arrayWithObjects:count:", &v190, 1);
  v56 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v39, "setUpSources:", v56);

  +[NSSet setWithObject:](&off_254DEBEC0, "setWithObject:", CFSTR("Left Thumbstick"));
  v57 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v39, "localizedName");
  v58 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v39, "symbol");
  v59 = (void *)objc_claimAutoreleasedReturnValue();
  unk_254DE2FDC(&off_254DE3248, "sourceWithElementAliases:localizedName:symbol:direction:", v57, v58, v59, 2);
  v60 = (void *)objc_claimAutoreleasedReturnValue();
  v189 = v60;
  +[NSArray arrayWithObjects:count:](NSArray_0, "arrayWithObjects:count:", &v189, 1);
  v61 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v39, "setRightSources:", v61);

  +[NSSet setWithObject:](&off_254DEBEC0, "setWithObject:", CFSTR("Left Thumbstick"));
  v62 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v39, "localizedName");
  v63 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v39, "symbol");
  v64 = (void *)objc_claimAutoreleasedReturnValue();
  unk_254DE2FDC(&off_254DE3248, "sourceWithElementAliases:localizedName:symbol:direction:", v62, v63, v64, 4);
  v65 = (void *)objc_claimAutoreleasedReturnValue();
  v188 = v65;
  +[NSArray arrayWithObjects:count:](NSArray_0, "arrayWithObjects:count:", &v188, 1);
  v66 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v39, "setDownSources:", v66);

  +[NSSet setWithObject:](&off_254DEBEC0, "setWithObject:", CFSTR("Left Thumbstick"));
  v67 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v39, "localizedName");
  v68 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v39, "symbol");
  v69 = (void *)objc_claimAutoreleasedReturnValue();
  unk_254DE2FDC(&off_254DE3248, "sourceWithElementAliases:localizedName:symbol:direction:", v67, v68, v69, 8);
  v70 = (void *)objc_claimAutoreleasedReturnValue();
  v187 = v70;
  +[NSArray arrayWithObjects:count:](NSArray_0, "arrayWithObjects:count:", &v187, 1);
  v71 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v39, "setLeftSources:", v71);

  +[NSSet setWithObject:](&off_254DEBEC0, "setWithObject:", CFSTR("Left Thumbstick Button"));
  v72 = (void *)objc_claimAutoreleasedReturnValue();
  unk_254DE2B74(&off_254DE2DC8, "symbolWithSFSymbolsName:", CFSTR("l.joystick.press.down"));
  v73 = (void *)objc_claimAutoreleasedReturnValue();
  unk_254DE2FD0(&off_254DE3248, "sourceWithElementAliases:localizedName:symbol:", v72, *MEMORY[0x24BE3A540], v73);
  v74 = (void *)objc_claimAutoreleasedReturnValue();
  v186 = v74;
  +[NSArray arrayWithObjects:count:](NSArray_0, "arrayWithObjects:count:", &v186, 1);
  v75 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v39, "setPressedSources:", v75);

  +[GCDevicePhysicalInputClickableDirectionPadElementDescription descriptionWithIdentifier:](&off_254DE2770, "descriptionWithIdentifier:", CFSTR("stick.right"));
  v76 = (void *)objc_claimAutoreleasedReturnValue();
  +[NSSet setWithObjects:](&off_254DEBEC0, "setWithObjects:", CFSTR("Right Thumbstick"), CFSTR("Right Thumbstick Button"), 0);
  v77 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v76, "setAliases:", v77);

  objc_msgSend(v76, "setLocalizedName:", *MEMORY[0x24BE3A5C0]);
  unk_254DE2B74(&off_254DE2DC8, "symbolWithSFSymbolsName:", CFSTR("r.joystick"));
  v78 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v76, "setSymbol:", v78);

  objc_msgSend(v76, "setAnalog:", 1);
  objc_msgSend(v76, "setEventUpValueField:", 14);
  objc_msgSend(v76, "setEventDownValueField:", 15);
  objc_msgSend(v76, "setEventLeftValueField:", 16);
  objc_msgSend(v76, "setEventRightValueField:", 17);
  objc_msgSend(v76, "setEventPressedValueField:", 21);
  +[NSSet setWithObject:](&off_254DEBEC0, "setWithObject:", CFSTR("Right Thumbstick"));
  v79 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v76, "localizedName");
  v80 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v76, "symbol");
  v81 = (void *)objc_claimAutoreleasedReturnValue();
  unk_254DE2FDC(&off_254DE3248, "sourceWithElementAliases:localizedName:symbol:direction:", v79, v80, v81, 10);
  v82 = (void *)objc_claimAutoreleasedReturnValue();
  v185 = v82;
  +[NSArray arrayWithObjects:count:](NSArray_0, "arrayWithObjects:count:", &v185, 1);
  v83 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v76, "setXSources:", v83);

  +[NSSet setWithObject:](&off_254DEBEC0, "setWithObject:", CFSTR("Right Thumbstick"));
  v84 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v76, "localizedName");
  v85 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v76, "symbol");
  v86 = (void *)objc_claimAutoreleasedReturnValue();
  unk_254DE2FDC(&off_254DE3248, "sourceWithElementAliases:localizedName:symbol:direction:", v84, v85, v86, 5);
  v87 = (void *)objc_claimAutoreleasedReturnValue();
  v184 = v87;
  +[NSArray arrayWithObjects:count:](NSArray_0, "arrayWithObjects:count:", &v184, 1);
  v88 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v76, "setYSources:", v88);

  +[NSSet setWithObject:](&off_254DEBEC0, "setWithObject:", CFSTR("Right Thumbstick"));
  v89 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v76, "localizedName");
  v90 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v76, "symbol");
  v91 = (void *)objc_claimAutoreleasedReturnValue();
  unk_254DE2FDC(&off_254DE3248, "sourceWithElementAliases:localizedName:symbol:direction:", v89, v90, v91, 1);
  v92 = (void *)objc_claimAutoreleasedReturnValue();
  v183 = v92;
  +[NSArray arrayWithObjects:count:](NSArray_0, "arrayWithObjects:count:", &v183, 1);
  v93 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v76, "setUpSources:", v93);

  +[NSSet setWithObject:](&off_254DEBEC0, "setWithObject:", CFSTR("Right Thumbstick"));
  v94 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v76, "localizedName");
  v95 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v76, "symbol");
  v96 = (void *)objc_claimAutoreleasedReturnValue();
  unk_254DE2FDC(&off_254DE3248, "sourceWithElementAliases:localizedName:symbol:direction:", v94, v95, v96, 2);
  v97 = (void *)objc_claimAutoreleasedReturnValue();
  v182 = v97;
  +[NSArray arrayWithObjects:count:](NSArray_0, "arrayWithObjects:count:", &v182, 1);
  v98 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v76, "setRightSources:", v98);

  +[NSSet setWithObject:](&off_254DEBEC0, "setWithObject:", CFSTR("Right Thumbstick"));
  v99 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v76, "localizedName");
  v100 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v76, "symbol");
  v101 = (void *)objc_claimAutoreleasedReturnValue();
  unk_254DE2FDC(&off_254DE3248, "sourceWithElementAliases:localizedName:symbol:direction:", v99, v100, v101, 4);
  v102 = (void *)objc_claimAutoreleasedReturnValue();
  v181 = v102;
  +[NSArray arrayWithObjects:count:](NSArray_0, "arrayWithObjects:count:", &v181, 1);
  v103 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v76, "setDownSources:", v103);

  +[NSSet setWithObject:](&off_254DEBEC0, "setWithObject:", CFSTR("Right Thumbstick"));
  v104 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v76, "localizedName");
  v105 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v76, "symbol");
  v106 = (void *)objc_claimAutoreleasedReturnValue();
  unk_254DE2FDC(&off_254DE3248, "sourceWithElementAliases:localizedName:symbol:direction:", v104, v105, v106, 8);
  v107 = (void *)objc_claimAutoreleasedReturnValue();
  v180 = v107;
  +[NSArray arrayWithObjects:count:](NSArray_0, "arrayWithObjects:count:", &v180, 1);
  v108 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v76, "setLeftSources:", v108);

  +[NSSet setWithObject:](&off_254DEBEC0, "setWithObject:", CFSTR("Right Thumbstick Button"));
  v109 = (void *)objc_claimAutoreleasedReturnValue();
  unk_254DE2B74(&off_254DE2DC8, "symbolWithSFSymbolsName:", CFSTR("r.joystick.press.down"));
  v110 = (void *)objc_claimAutoreleasedReturnValue();
  unk_254DE2FD0(&off_254DE3248, "sourceWithElementAliases:localizedName:symbol:", v109, *MEMORY[0x24BE3A558], v110);
  v111 = (void *)objc_claimAutoreleasedReturnValue();
  v179 = v111;
  +[NSArray arrayWithObjects:count:](NSArray_0, "arrayWithObjects:count:", &v179, 1);
  v112 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v76, "setPressedSources:", v112);

  v113 = (void *)objc_opt_new();
  v178[0] = v164;
  v178[1] = v163;
  v178[2] = v162;
  v178[3] = v161;
  v178[4] = v160;
  v178[5] = v159;
  v178[6] = v158;
  v178[7] = v157;
  v178[8] = v156;
  v178[9] = v155;
  v178[10] = v154;
  v178[11] = v153;
  v178[12] = v36;
  v178[13] = v39;
  v178[14] = v76;
  +[NSArray arrayWithObjects:count:](NSArray_0, "arrayWithObjects:count:", v178, 15);
  v114 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v113, "setElements:", v114);

  v115 = [_GCControllerInputComponentDescription alloc];
  v177 = v151;
  +[NSArray arrayWithObjects:count:](NSArray_0, "arrayWithObjects:count:", &v177, 1);
  v116 = (void *)objc_claimAutoreleasedReturnValue();
  v117 = -[_GCControllerInputComponentDescription initWithIdentifier:controllerInputs:bindings:](v115, "initWithIdentifier:controllerInputs:bindings:", CFSTR("Input"), v113, v116);

  objc_msgSend(v166, "addObject:", v117);
  v118 = self;
  objc_sync_enter(v118);
  -[NSMapTable objectForKey:](v118->_clientPlayerIndicatorEndpoints, "objectForKey:", v165);
  v119 = (GCPlayerIndicatorXPCProxyServerEndpoint *)objc_claimAutoreleasedReturnValue();
  if (!v119)
  {
    v120 = [GCPlayerIndicatorXPCProxyServerEndpoint alloc];
    +[NSUUID UUID](&off_254DEEE48, "UUID");
    v121 = (void *)objc_claimAutoreleasedReturnValue();
    v119 = -[GCPlayerIndicatorXPCProxyServerEndpoint initWithIdentifier:initialValue:](v120, "initWithIdentifier:initialValue:", v121, v118->_indicatedPlayerIndex);

    -[GCPlayerIndicatorXPCProxyServerEndpoint setDelegate:](v119, "setDelegate:", v118);
    -[NSMapTable setObject:forKey:](v118->_clientPlayerIndicatorEndpoints, "setObject:forKey:", v119, v165);
    objc_msgSend(v165, "IPCObjectRegistry");
    v122 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v122, "registerIPCObject:", v119);

  }
  -[GCPlayerIndicatorXPCProxyServerEndpoint receiverDescription](v119, "receiverDescription");
  v123 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v166, "addObject:", v123);

  objc_sync_exit(v118);
  v124 = v118;
  objc_sync_enter(v124);
  -[NSMapTable objectForKey:](v124->_clientBatteryEndpoints, "objectForKey:", v165);
  v125 = (GCBatteryXPCProxyServerEndpoint *)objc_claimAutoreleasedReturnValue();
  if (!v125)
  {
    v126 = [GCBatteryXPCProxyServerEndpoint alloc];
    +[NSUUID UUID](&off_254DEEE48, "UUID");
    v127 = (void *)objc_claimAutoreleasedReturnValue();
    v125 = -[GCBatteryXPCProxyServerEndpoint initWithIdentifier:initialValue:](v126, "initWithIdentifier:initialValue:", v127, v124->_battery);

    -[GCBatteryXPCProxyServerEndpoint setDelegate:](v125, "setDelegate:", v124);
    -[NSMapTable setObject:forKey:](v124->_clientBatteryEndpoints, "setObject:forKey:", v125, v165);
    objc_msgSend(v165, "IPCObjectRegistry");
    v128 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v128, "registerIPCObject:", v125);

  }
  -[GCBatteryXPCProxyServerEndpoint receiverDescription](v125, "receiverDescription");
  v129 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v166, "addObject:", v129);

  objc_sync_exit(v124);
  v130 = [GCHapticCapabilities alloc];
  -[_GCNintendoJoyConDevice hapticEngines](v124->_leftDevice, "hapticEngines");
  v131 = (void *)objc_claimAutoreleasedReturnValue();
  -[_GCNintendoJoyConDevice hapticEngines](v124->_rightDevice, "hapticEngines");
  v132 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v131, "arrayByAddingObjectsFromArray:", v132);
  v133 = (void *)objc_claimAutoreleasedReturnValue();
  v134 = -[GCHapticCapabilities initWithIdentifier:hapticEnginesInfo:hapticCapabilityGraph:](v130, "initWithIdentifier:hapticEnginesInfo:hapticCapabilityGraph:", CFSTR("HapticCapabilities"), v133, v124->_hapticCapabilityGraph);

  v135 = -[_GCControllerComponentDescription initWithComponent:bindings:]([_GCControllerComponentDescription alloc], "initWithComponent:bindings:", v134, 0);
  objc_msgSend(v166, "addObject:", v135);

  v136 = v124;
  objc_sync_enter(v136);
  objc_msgSend(v136[7], "objectForKey:", v165);
  v137 = (GCSettingsXPCProxyServerEndpoint *)objc_claimAutoreleasedReturnValue();
  if (!v137)
  {
    v138 = v136[6];
    objc_msgSend(v136, "persistentIdentifierForSettings");
    v139 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v165, "bundleIdentifier");
    v140 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v138, "profileForPersistentControllerIdentifier:appBundleIdentifier:", v139, v140);
    v141 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v141, "anonymizedCopy");
    v142 = (void *)objc_claimAutoreleasedReturnValue();

    v143 = [GCSettingsXPCProxyServerEndpoint alloc];
    +[NSUUID UUID](&off_254DEEE48, "UUID");
    v144 = (void *)objc_claimAutoreleasedReturnValue();
    v137 = -[GCSettingsXPCProxyServerEndpoint initWithIdentifier:initialValueForProfile:](v143, "initWithIdentifier:initialValueForProfile:", v144, v142);

    -[GCSettingsXPCProxyServerEndpoint setDelegate:](v137, "setDelegate:", v136);
    objc_msgSend(v136[7], "setObject:forKey:", v137, v165);
    objc_msgSend(v165, "IPCObjectRegistry");
    v145 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v145, "registerIPCObject:", v137);

  }
  -[GCSettingsXPCProxyServerEndpoint receiverDescription](v137, "receiverDescription");
  v146 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v166, "addObject:", v146);

  objc_sync_exit(v136);
  v147 = [_GCControllerDescription alloc];
  objc_msgSend(v136, "identifier");
  v148 = (void *)objc_claimAutoreleasedReturnValue();
  v149 = -[_GCControllerDescription initWithIdentifier:components:](v147, "initWithIdentifier:components:", v148, v166);

  return v149;
}

- (_GCGamepadEventSourceDescription)gamepadEventSource
{
  void *v3;
  void *v4;
  _GCGamepadEventFusionConfig *v5;
  _GCGamepadEventFusionDescription *v6;
  void *v7;
  _GCGamepadEventFusionDescription *v8;
  _QWORD v10[3];

  v10[2] = *MEMORY[0x24BDAC8D0];
  -[_GCNintendoJoyConDevice gamepadEventSource](self->_leftDevice, "gamepadEventSource");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[_GCNintendoJoyConDevice gamepadEventSource](self->_rightDevice, "gamepadEventSource");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = -[_GCGamepadEventFusionConfig initWithSourceCount:]([_GCGamepadEventFusionConfig alloc], "initWithSourceCount:", 2);
  -[_GCGamepadEventFusionConfig setPassRule:forElement:forSourceAtIndex:](v5, "setPassRule:forElement:forSourceAtIndex:", 1, 0, 0);
  -[_GCGamepadEventFusionConfig setPassRule:forElement:forSourceAtIndex:](v5, "setPassRule:forElement:forSourceAtIndex:", 1, 1, 0);
  -[_GCGamepadEventFusionConfig setPassRule:forElement:forSourceAtIndex:](v5, "setPassRule:forElement:forSourceAtIndex:", 1, 2, 0);
  -[_GCGamepadEventFusionConfig setPassRule:forElement:forSourceAtIndex:](v5, "setPassRule:forElement:forSourceAtIndex:", 1, 3, 0);
  -[_GCGamepadEventFusionConfig setPassRule:forElement:forSourceAtIndex:](v5, "setPassRule:forElement:forSourceAtIndex:", 1, 10, 0);
  -[_GCGamepadEventFusionConfig setPassRule:forElement:forSourceAtIndex:](v5, "setPassRule:forElement:forSourceAtIndex:", 1, 11, 0);
  -[_GCGamepadEventFusionConfig setPassRule:forElement:forSourceAtIndex:](v5, "setPassRule:forElement:forSourceAtIndex:", 1, 12, 0);
  -[_GCGamepadEventFusionConfig setPassRule:forElement:forSourceAtIndex:](v5, "setPassRule:forElement:forSourceAtIndex:", 1, 13, 0);
  -[_GCGamepadEventFusionConfig setPassRule:forElement:forSourceAtIndex:](v5, "setPassRule:forElement:forSourceAtIndex:", 1, 8, 0);
  -[_GCGamepadEventFusionConfig setPassRule:forElement:forSourceAtIndex:](v5, "setPassRule:forElement:forSourceAtIndex:", 1, 18, 0);
  -[_GCGamepadEventFusionConfig setPassRule:forElement:forSourceAtIndex:](v5, "setPassRule:forElement:forSourceAtIndex:", 1, 20, 0);
  -[_GCGamepadEventFusionConfig setPassRule:forElement:forSourceAtIndex:](v5, "setPassRule:forElement:forSourceAtIndex:", 1, 24, 0);
  -[_GCGamepadEventFusionConfig setPassRule:forElement:forSourceAtIndex:](v5, "setPassRule:forElement:forSourceAtIndex:", 1, 4, 1);
  -[_GCGamepadEventFusionConfig setPassRule:forElement:forSourceAtIndex:](v5, "setPassRule:forElement:forSourceAtIndex:", 1, 5, 1);
  -[_GCGamepadEventFusionConfig setPassRule:forElement:forSourceAtIndex:](v5, "setPassRule:forElement:forSourceAtIndex:", 1, 6, 1);
  -[_GCGamepadEventFusionConfig setPassRule:forElement:forSourceAtIndex:](v5, "setPassRule:forElement:forSourceAtIndex:", 1, 7, 1);
  -[_GCGamepadEventFusionConfig setPassRule:forElement:forSourceAtIndex:](v5, "setPassRule:forElement:forSourceAtIndex:", 1, 14, 1);
  -[_GCGamepadEventFusionConfig setPassRule:forElement:forSourceAtIndex:](v5, "setPassRule:forElement:forSourceAtIndex:", 1, 15, 1);
  -[_GCGamepadEventFusionConfig setPassRule:forElement:forSourceAtIndex:](v5, "setPassRule:forElement:forSourceAtIndex:", 1, 16, 1);
  -[_GCGamepadEventFusionConfig setPassRule:forElement:forSourceAtIndex:](v5, "setPassRule:forElement:forSourceAtIndex:", 1, 17, 1);
  -[_GCGamepadEventFusionConfig setPassRule:forElement:forSourceAtIndex:](v5, "setPassRule:forElement:forSourceAtIndex:", 1, 9, 1);
  -[_GCGamepadEventFusionConfig setPassRule:forElement:forSourceAtIndex:](v5, "setPassRule:forElement:forSourceAtIndex:", 1, 19, 1);
  -[_GCGamepadEventFusionConfig setPassRule:forElement:forSourceAtIndex:](v5, "setPassRule:forElement:forSourceAtIndex:", 1, 21, 1);
  -[_GCGamepadEventFusionConfig setPassRule:forElement:forSourceAtIndex:](v5, "setPassRule:forElement:forSourceAtIndex:", 1, 22, 1);
  -[_GCGamepadEventFusionConfig setPassRule:forElement:forSourceAtIndex:](v5, "setPassRule:forElement:forSourceAtIndex:", 1, 23, 1);
  v6 = [_GCGamepadEventFusionDescription alloc];
  v10[0] = v3;
  v10[1] = v4;
  +[NSArray arrayWithObjects:count:](NSArray_0, "arrayWithObjects:count:", v10, 2);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = -[_GCGamepadEventFusionDescription initWithConfiguration:sources:](v6, "initWithConfiguration:sources:", v5, v7);

  return (_GCGamepadEventSourceDescription *)v8;
}

- (int64_t)indicatedPlayerIndex
{
  return -[_GCNintendoJoyConDevice indicatedPlayerIndex](self->_leftDevice, "indicatedPlayerIndex");
}

- (void)setIndicatedPlayerIndex:(int64_t)a3
{
  -[_GCNintendoJoyConDevice setIndicatedPlayerIndex:](self->_leftDevice, "setIndicatedPlayerIndex:");
  -[_GCNintendoJoyConDevice setIndicatedPlayerIndex:](self->_rightDevice, "setIndicatedPlayerIndex:", a3);
}

- (id)deviceBatteryComponentBatteryUpdatedHandler
{
  return 0;
}

- (id)deviceBatteryServiceConnectedHandler
{
  return 0;
}

- (void)_refreshBattery
{
  void *v3;
  GCDeviceBattery *battery;
  float v5;
  float v6;
  double v7;
  uint64_t v8;
  uint64_t v9;
  id v10;

  -[_GCNintendoJoyConDevice battery](self->_leftDevice, "battery");
  v10 = (id)objc_claimAutoreleasedReturnValue();
  -[_GCNintendoJoyConDevice battery](self->_rightDevice, "battery");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  battery = self->_battery;
  objc_msgSend(v10, "batteryLevel");
  v6 = v5;
  objc_msgSend(v3, "batteryLevel");
  if (v6 < *(float *)&v7)
    *(float *)&v7 = v6;
  -[GCDeviceBattery _setBatteryLevel:](battery, "_setBatteryLevel:", v7);
  v8 = objc_msgSend(v10, "batteryState");
  if (v8 == objc_msgSend(v3, "batteryState"))
    v9 = objc_msgSend(v10, "batteryState");
  else
    v9 = -1;
  -[GCDeviceBattery _setBatteryState:](self->_battery, "_setBatteryState:", v9);

}

- (void)_propagateBattery
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
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
  -[NSMapTable objectEnumerator](self->_clientBatteryEndpoints, "objectEnumerator", 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v9;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v9 != v6)
          objc_enumerationMutation(v3);
        objc_msgSend(*(id *)(*((_QWORD *)&v8 + 1) + 8 * v7++), "setBattery:", self->_battery);
      }
      while (v5 != v7);
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
    }
    while (v5);
  }

}

- (GCDeviceBattery)battery
{
  -[_GCNintendoFusedJoyConDevice _refreshBattery](self, "_refreshBattery");
  return self->_battery;
}

- (void)settingsDidChange
{
  NSObject *v3;
  _GCNintendoFusedJoyConDevice *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  void *v10;
  GCSSettingsStoreService *settingsStore;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  uint8_t buf[16];
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x24BDAC8D0];
  getGCSettingsLogger();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_215181000, v3, OS_LOG_TYPE_INFO, "settingsDidChange", buf, 2u);
  }

  v4 = self;
  objc_sync_enter(v4);
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  -[NSMapTable keyEnumerator](v4->_clientSettingsEndpoints, "keyEnumerator", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v16, v21, 16);
  if (v6)
  {
    v7 = *(_QWORD *)v17;
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v17 != v7)
          objc_enumerationMutation(v5);
        v9 = *(void **)(*((_QWORD *)&v16 + 1) + 8 * i);
        -[NSMapTable objectForKey:](v4->_clientSettingsEndpoints, "objectForKey:", v9);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        settingsStore = v4->_settingsStore;
        -[_GCNintendoFusedJoyConDevice persistentIdentifierForSettings](v4, "persistentIdentifierForSettings");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "bundleIdentifier");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        -[GCSSettingsStoreService profileForPersistentControllerIdentifier:appBundleIdentifier:](settingsStore, "profileForPersistentControllerIdentifier:appBundleIdentifier:", v12, v13);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "anonymizedCopy");
        v15 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v10, "setSettingsProfile:", v15);
      }
      v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v16, v21, 16);
    }
    while (v6);
  }

  objc_sync_exit(v4);
}

- (id)persistentIdentifierForSettings
{
  void *v3;
  char isKindOfClass;
  __CFString *v5;

  -[_GCNintendoFusedJoyConDevice identifier](self, "identifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  if ((isKindOfClass & 1) != 0)
  {
    -[_GCNintendoFusedJoyConDevice identifier](self, "identifier");
    v5 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v5 = &stru_24D2B85A8;
  }
  return v5;
}

@end
