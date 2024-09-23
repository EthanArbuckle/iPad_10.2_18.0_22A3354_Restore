@implementation _GCDefaultLogicalDevice

- (_GCDefaultLogicalDevice)initWithPhysicalDevice:(id)a3 configuration:(id)a4 manager:(id)a5
{
  id v9;
  id v10;
  _GCDefaultLogicalDevice *v11;
  uint64_t v12;
  NSObject *identifier;
  uint64_t v14;
  NSMapTable *clients;
  uint64_t v16;
  NSMutableDictionary *pidToAnalytics;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t i;
  void *v22;
  uint64_t v23;
  NSMapTable *clientPlayerIndicatorEndpoints;
  void *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t j;
  void *v29;
  dispatch_semaphore_t v30;
  NSObject *v31;
  dispatch_time_t v32;
  uint64_t v33;
  GCDeviceLight *light;
  GCDeviceLight *v35;
  GCColor *v36;
  double v37;
  double v38;
  double v39;
  GCColor *v40;
  uint64_t v41;
  GCDeviceLight *v42;
  uint64_t v43;
  NSMapTable *clientLightEndpoints;
  void *v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t k;
  void *v49;
  dispatch_semaphore_t v50;
  NSObject *v51;
  dispatch_time_t v52;
  uint64_t v53;
  NSArray *adaptiveTriggerStatuses;
  id v55;
  id v56;
  uint64_t v57;
  NSArray *v58;
  uint64_t v59;
  NSMapTable *clientAdaptiveTriggersEndpoints;
  uint64_t v61;
  NSMapTable *pidToAdaptiveTriggersComponent;
  void *v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t m;
  void *v67;
  dispatch_semaphore_t v68;
  NSObject *v69;
  dispatch_time_t v70;
  uint64_t v71;
  NSMapTable *clientMotionEndpoints;
  void *v73;
  uint64_t v74;
  uint64_t v75;
  uint64_t n;
  void *v77;
  dispatch_semaphore_t v78;
  NSObject *v79;
  dispatch_time_t v80;
  uint64_t v81;
  GCDeviceBattery *battery;
  GCDeviceBattery *v83;
  double v84;
  uint64_t v85;
  GCDeviceBattery *v86;
  uint64_t v87;
  NSMapTable *clientBatteryEndpoints;
  void *v89;
  uint64_t v90;
  uint64_t v91;
  uint64_t ii;
  void *v93;
  uint64_t v94;
  NSMapTable *clientGameIntentEndpoints;
  void *v96;
  uint64_t v97;
  uint64_t v98;
  uint64_t jj;
  void *v100;
  id WeakRetained;
  uint64_t v102;
  NSMapTable *clientSettingsEndpoints;
  uint64_t v104;
  GCSSettingsStoreService *settingsStore;
  void *v106;
  void *v107;
  _GCDefaultLogicalDevice *v108;
  NSObject *v110;
  NSObject *v111;
  GCDeviceLight *v112;
  NSObject *v113;
  NSObject *v114;
  NSArray *v115;
  NSObject *v116;
  NSObject *v117;
  NSObject *v118;
  GCDeviceBattery *v119;
  NSObject *v120;
  NSObject *v121;
  uint64_t v122;
  uint64_t v123;
  uint64_t v124;
  uint64_t v125;
  uint64_t v126;
  uint64_t v127;
  uint64_t v128;
  NSObject *v129;
  uint64_t v130;
  uint64_t v131;
  uint64_t v132;
  uint64_t v133;
  uint64_t v134;
  uint64_t v135;
  uint64_t v136;
  NSObject *v137;
  uint64_t v138;
  uint64_t v139;
  uint64_t v140;
  uint64_t v141;
  uint64_t v142;
  uint64_t v143;
  uint64_t v144;
  id v145;
  __int128 v146;
  __int128 v147;
  __int128 v148;
  __int128 v149;
  _QWORD v150[4];
  id v151;
  uint8_t buf[16];
  __int128 v153;
  __int128 v154;
  __int128 v155;
  __int128 v156;
  _QWORD v157[4];
  id v158;
  _QWORD v159[4];
  NSObject *v160;
  __int128 v161;
  __int128 v162;
  __int128 v163;
  __int128 v164;
  _QWORD v165[4];
  NSObject *v166;
  __int128 v167;
  __int128 v168;
  __int128 v169;
  __int128 v170;
  _QWORD v171[4];
  id v172;
  _QWORD v173[4];
  NSObject *v174;
  __int128 v175;
  __int128 v176;
  __int128 v177;
  __int128 v178;
  _QWORD v179[4];
  NSObject *v180;
  __int128 v181;
  __int128 v182;
  __int128 v183;
  __int128 v184;
  __int128 v185;
  __int128 v186;
  __int128 v187;
  __int128 v188;
  objc_super v189;
  _BYTE v190[128];
  _BYTE v191[128];
  _BYTE v192[128];
  _BYTE v193[128];
  _QWORD v194[2];
  _BYTE v195[128];
  id location[3];
  _BYTE v197[128];
  _BYTE v198[128];
  uint64_t v199;

  v199 = *MEMORY[0x24BDAC8D0];
  v145 = a3;
  v9 = a4;
  v10 = a5;
  v189.receiver = self;
  v189.super_class = (Class)_GCDefaultLogicalDevice;
  v11 = -[_GCDefaultLogicalDevice init](&v189, sel_init);

  if (v11)
  {
    objc_msgSend(v9, "deviceIdentifier");
    v12 = objc_claimAutoreleasedReturnValue();
    identifier = v11->_identifier;
    v11->_identifier = v12;

    objc_storeStrong((id *)&v11->_underlyingDevice, a3);
    objc_storeStrong((id *)&v11->_configuration, a4);
    objc_storeWeak((id *)&v11->_manager, v10);
    +[NSMapTable strongToStrongObjectsMapTable](&off_254DF7908, "strongToStrongObjectsMapTable");
    v14 = objc_claimAutoreleasedReturnValue();
    clients = v11->_clients;
    v11->_clients = (NSMapTable *)v14;

    v16 = objc_opt_new();
    pidToAnalytics = v11->_pidToAnalytics;
    v11->_pidToAnalytics = (NSMutableDictionary *)v16;

    v187 = 0u;
    v188 = 0u;
    v185 = 0u;
    v186 = 0u;
    -[_GCDefaultLogicalDevice components](v11, "components");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v185, v198, 16);
    if (v19)
    {
      v20 = *(_QWORD *)v186;
      do
      {
        for (i = 0; i != v19; ++i)
        {
          if (*(_QWORD *)v186 != v20)
            objc_enumerationMutation(v18);
          v22 = *(void **)(*((_QWORD *)&v185 + 1) + 8 * i);
          if (objc_msgSend(v22, "conformsToProtocol:", &unk_254DCA0C0))
            objc_storeStrong((id *)&v11->_devicePlayerIndicatorComponent, v22);
        }
        v19 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v185, v198, 16);
      }
      while (v19);
    }

    if (v11->_devicePlayerIndicatorComponent)
    {
      v11->_indicatedPlayerIndex = -1;
      +[NSMapTable strongToStrongObjectsMapTable](&off_254DF7908, "strongToStrongObjectsMapTable");
      v23 = objc_claimAutoreleasedReturnValue();
      clientPlayerIndicatorEndpoints = v11->_clientPlayerIndicatorEndpoints;
      v11->_clientPlayerIndicatorEndpoints = (NSMapTable *)v23;

    }
    v183 = 0u;
    v184 = 0u;
    v181 = 0u;
    v182 = 0u;
    -[_GCDefaultLogicalDevice components](v11, "components");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v26 = objc_msgSend(v25, "countByEnumeratingWithState:objects:count:", &v181, v197, 16);
    if (v26)
    {
      v27 = *(_QWORD *)v182;
      do
      {
        for (j = 0; j != v26; ++j)
        {
          if (*(_QWORD *)v182 != v27)
            objc_enumerationMutation(v25);
          v29 = *(void **)(*((_QWORD *)&v181 + 1) + 8 * j);
          if (objc_msgSend(v29, "conformsToProtocol:", &unk_254DCF840))
            objc_storeStrong((id *)&v11->_deviceLightComponent, v29);
        }
        v26 = objc_msgSend(v25, "countByEnumeratingWithState:objects:count:", &v181, v197, 16);
      }
      while (v26);
    }

    if (v11->_deviceLightComponent)
    {
      v30 = dispatch_semaphore_create(0);
      v179[0] = MEMORY[0x24BDAC760];
      v179[1] = 3221225472;
      v179[2] = __72___GCDefaultLogicalDevice_initWithPhysicalDevice_configuration_manager___block_invoke;
      v179[3] = &unk_24D2B2B20;
      v31 = v30;
      v180 = v31;
      -[_GCDeviceLightComponent setDeviceLightServiceConnectedHandler:](v11->_deviceLightComponent, "setDeviceLightServiceConnectedHandler:", v179);
      if (gc_isInternalBuild())
      {
        getGCLogger();
        v110 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v110, OS_LOG_TYPE_INFO))
        {
          LOWORD(location[0]) = 0;
          _os_log_impl(&dword_215181000, v110, OS_LOG_TYPE_INFO, "Waiting for driver light service to be brought up", (uint8_t *)location, 2u);
        }

      }
      v32 = dispatch_time(0, 1000000000);
      dispatch_semaphore_wait(v31, v32);
      -[_GCDeviceLightComponent light](v11->_deviceLightComponent, "light");
      v33 = objc_claimAutoreleasedReturnValue();
      light = v11->_light;
      v11->_light = (GCDeviceLight *)v33;

      if (!v11->_light)
      {
        if (gc_isInternalBuild())
        {
          getGCLogger();
          v121 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v121, OS_LOG_TYPE_ERROR))
            -[_GCDefaultLogicalDevice initWithPhysicalDevice:configuration:manager:].cold.3(v121, v122, v123, v124, v125, v126, v127, v128);

        }
        v35 = [GCDeviceLight alloc];
        v36 = [GCColor alloc];
        LODWORD(v37) = 1056997505;
        LODWORD(v38) = 1040220289;
        LODWORD(v39) = 1017159841;
        v40 = -[GCColor initWithRed:green:blue:](v36, "initWithRed:green:blue:", v37, v38, v39);
        v41 = -[GCDeviceLight initWithColor:](v35, "initWithColor:", v40);
        v42 = v11->_light;
        v11->_light = (GCDeviceLight *)v41;

      }
      if (gc_isInternalBuild())
      {
        getGCLogger();
        v111 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v111, OS_LOG_TYPE_INFO))
        {
          v112 = v11->_light;
          LODWORD(location[0]) = 138412290;
          *(id *)((char *)location + 4) = v112;
          _os_log_impl(&dword_215181000, v111, OS_LOG_TYPE_INFO, "Initialize device light component light value to %@", (uint8_t *)location, 0xCu);
        }

      }
      +[NSMapTable strongToStrongObjectsMapTable](&off_254DF7908, "strongToStrongObjectsMapTable");
      v43 = objc_claimAutoreleasedReturnValue();
      clientLightEndpoints = v11->_clientLightEndpoints;
      v11->_clientLightEndpoints = (NSMapTable *)v43;

    }
    v177 = 0u;
    v178 = 0u;
    v175 = 0u;
    v176 = 0u;
    -[_GCDefaultLogicalDevice components](v11, "components");
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    v46 = objc_msgSend(v45, "countByEnumeratingWithState:objects:count:", &v175, v195, 16);
    if (v46)
    {
      v47 = *(_QWORD *)v176;
      do
      {
        for (k = 0; k != v46; ++k)
        {
          if (*(_QWORD *)v176 != v47)
            objc_enumerationMutation(v45);
          v49 = *(void **)(*((_QWORD *)&v175 + 1) + 8 * k);
          if (objc_msgSend(v49, "conformsToProtocol:", &unk_254DCF9B0))
            objc_storeStrong((id *)&v11->_deviceAdaptiveTriggersComponent, v49);
        }
        v46 = objc_msgSend(v45, "countByEnumeratingWithState:objects:count:", &v175, v195, 16);
      }
      while (v46);
    }

    if (v11->_deviceAdaptiveTriggersComponent)
    {
      v50 = dispatch_semaphore_create(0);
      v173[0] = MEMORY[0x24BDAC760];
      v173[1] = 3221225472;
      v173[2] = __72___GCDefaultLogicalDevice_initWithPhysicalDevice_configuration_manager___block_invoke_147;
      v173[3] = &unk_24D2B2B20;
      v51 = v50;
      v174 = v51;
      -[_GCDeviceAdaptiveTriggersComponent setDeviceAdaptiveTriggersServiceConnectedHandler:](v11->_deviceAdaptiveTriggersComponent, "setDeviceAdaptiveTriggersServiceConnectedHandler:", v173);
      if (gc_isInternalBuild())
      {
        getGCLogger();
        v113 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v113, OS_LOG_TYPE_INFO))
        {
          LOWORD(location[0]) = 0;
          _os_log_impl(&dword_215181000, v113, OS_LOG_TYPE_INFO, "Waiting for driver adaptive trigger service to be brought up", (uint8_t *)location, 2u);
        }

      }
      v52 = dispatch_time(0, 1000000000);
      dispatch_semaphore_wait(v51, v52);
      -[_GCDeviceAdaptiveTriggersComponent triggerStatuses](v11->_deviceAdaptiveTriggersComponent, "triggerStatuses");
      v53 = objc_claimAutoreleasedReturnValue();
      adaptiveTriggerStatuses = v11->_adaptiveTriggerStatuses;
      v11->_adaptiveTriggerStatuses = (NSArray *)v53;

      if (!v11->_adaptiveTriggerStatuses)
      {
        if (gc_isInternalBuild())
        {
          getGCLogger();
          v129 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v129, OS_LOG_TYPE_ERROR))
            -[_GCDefaultLogicalDevice initWithPhysicalDevice:configuration:manager:].cold.2(v129, v130, v131, v132, v133, v134, v135, v136);

        }
        v55 = -[GCDeviceAdaptiveTriggersStatusPayload initFeedbackWithStatus:armPosition:mode:]([GCDeviceAdaptiveTriggersStatusPayload alloc], "initFeedbackWithStatus:armPosition:mode:", 0, 0, 0);
        v194[0] = v55;
        v56 = -[GCDeviceAdaptiveTriggersStatusPayload initFeedbackWithStatus:armPosition:mode:]([GCDeviceAdaptiveTriggersStatusPayload alloc], "initFeedbackWithStatus:armPosition:mode:", 0, 0, 0);
        v194[1] = v56;
        +[NSArray arrayWithObjects:count:](NSArray_0, "arrayWithObjects:count:", v194, 2);
        v57 = objc_claimAutoreleasedReturnValue();
        v58 = v11->_adaptiveTriggerStatuses;
        v11->_adaptiveTriggerStatuses = (NSArray *)v57;

      }
      if (gc_isInternalBuild())
      {
        getGCLogger();
        v114 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v114, OS_LOG_TYPE_INFO))
        {
          v115 = v11->_adaptiveTriggerStatuses;
          LODWORD(location[0]) = 138412290;
          *(id *)((char *)location + 4) = v115;
          _os_log_impl(&dword_215181000, v114, OS_LOG_TYPE_INFO, "Initialize device battery component value to %@", (uint8_t *)location, 0xCu);
        }

      }
      +[NSMapTable strongToStrongObjectsMapTable](&off_254DF7908, "strongToStrongObjectsMapTable");
      v59 = objc_claimAutoreleasedReturnValue();
      clientAdaptiveTriggersEndpoints = v11->_clientAdaptiveTriggersEndpoints;
      v11->_clientAdaptiveTriggersEndpoints = (NSMapTable *)v59;

      +[NSMapTable strongToStrongObjectsMapTable](&off_254DF7908, "strongToStrongObjectsMapTable");
      v61 = objc_claimAutoreleasedReturnValue();
      pidToAdaptiveTriggersComponent = v11->_pidToAdaptiveTriggersComponent;
      v11->_pidToAdaptiveTriggersComponent = (NSMapTable *)v61;

      objc_initWeak(location, v11);
      v171[0] = MEMORY[0x24BDAC760];
      v171[1] = 3221225472;
      v171[2] = __72___GCDefaultLogicalDevice_initWithPhysicalDevice_configuration_manager___block_invoke_150;
      v171[3] = &unk_24D2B4BF0;
      objc_copyWeak(&v172, location);
      -[_GCDeviceAdaptiveTriggersComponent setDeviceAdaptiveTriggersComponentStatusUpdatedHandler:](v11->_deviceAdaptiveTriggersComponent, "setDeviceAdaptiveTriggersComponentStatusUpdatedHandler:", v171);
      objc_destroyWeak(&v172);
      objc_destroyWeak(location);

    }
    v169 = 0u;
    v170 = 0u;
    v167 = 0u;
    v168 = 0u;
    -[_GCDefaultLogicalDevice components](v11, "components");
    v63 = (void *)objc_claimAutoreleasedReturnValue();
    v64 = objc_msgSend(v63, "countByEnumeratingWithState:objects:count:", &v167, v193, 16);
    if (v64)
    {
      v65 = *(_QWORD *)v168;
      do
      {
        for (m = 0; m != v64; ++m)
        {
          if (*(_QWORD *)v168 != v65)
            objc_enumerationMutation(v63);
          v67 = *(void **)(*((_QWORD *)&v167 + 1) + 8 * m);
          if (objc_msgSend(v67, "conformsToProtocol:", &unk_254DCF790))
            objc_storeStrong((id *)&v11->_deviceMotionComponent, v67);
        }
        v64 = objc_msgSend(v63, "countByEnumeratingWithState:objects:count:", &v167, v193, 16);
      }
      while (v64);
    }

    if (v11->_deviceMotionComponent)
    {
      v68 = dispatch_semaphore_create(0);
      v165[0] = MEMORY[0x24BDAC760];
      v165[1] = 3221225472;
      v165[2] = __72___GCDefaultLogicalDevice_initWithPhysicalDevice_configuration_manager___block_invoke_2;
      v165[3] = &unk_24D2B2B20;
      v69 = v68;
      v166 = v69;
      -[_GCDeviceMotionComponent setDeviceMotionServiceConnectedHandler:](v11->_deviceMotionComponent, "setDeviceMotionServiceConnectedHandler:", v165);
      if (gc_isInternalBuild())
      {
        getGCLogger();
        v116 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v116, OS_LOG_TYPE_INFO))
        {
          LOWORD(location[0]) = 0;
          _os_log_impl(&dword_215181000, v116, OS_LOG_TYPE_INFO, "Waiting for driver motion service to be brought up", (uint8_t *)location, 2u);
        }

      }
      v70 = dispatch_time(0, 1000000000);
      dispatch_semaphore_wait(v69, v70);
      v11->_motionSensorsActive = 0;
      -[_GCDeviceMotionComponent setSensorsActive:](v11->_deviceMotionComponent, "setSensorsActive:", 0);
      +[NSMapTable strongToStrongObjectsMapTable](&off_254DF7908, "strongToStrongObjectsMapTable");
      v71 = objc_claimAutoreleasedReturnValue();
      clientMotionEndpoints = v11->_clientMotionEndpoints;
      v11->_clientMotionEndpoints = (NSMapTable *)v71;

    }
    v163 = 0u;
    v164 = 0u;
    v161 = 0u;
    v162 = 0u;
    -[_GCDefaultLogicalDevice components](v11, "components");
    v73 = (void *)objc_claimAutoreleasedReturnValue();
    v74 = objc_msgSend(v73, "countByEnumeratingWithState:objects:count:", &v161, v192, 16);
    if (v74)
    {
      v75 = *(_QWORD *)v162;
      do
      {
        for (n = 0; n != v74; ++n)
        {
          if (*(_QWORD *)v162 != v75)
            objc_enumerationMutation(v73);
          v77 = *(void **)(*((_QWORD *)&v161 + 1) + 8 * n);
          if (objc_msgSend(v77, "conformsToProtocol:", &unk_254DCA1D8))
            objc_storeStrong((id *)&v11->_deviceBatteryComponent, v77);
        }
        v74 = objc_msgSend(v73, "countByEnumeratingWithState:objects:count:", &v161, v192, 16);
      }
      while (v74);
    }

    if (v11->_deviceBatteryComponent)
    {
      v78 = dispatch_semaphore_create(0);
      v159[0] = MEMORY[0x24BDAC760];
      v159[1] = 3221225472;
      v159[2] = __72___GCDefaultLogicalDevice_initWithPhysicalDevice_configuration_manager___block_invoke_178;
      v159[3] = &unk_24D2B2B20;
      v79 = v78;
      v160 = v79;
      -[_GCDeviceBatteryComponent setDeviceBatteryServiceConnectedHandler:](v11->_deviceBatteryComponent, "setDeviceBatteryServiceConnectedHandler:", v159);
      if (gc_isInternalBuild())
      {
        getGCLogger();
        v117 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v117, OS_LOG_TYPE_INFO))
        {
          LOWORD(location[0]) = 0;
          _os_log_impl(&dword_215181000, v117, OS_LOG_TYPE_INFO, "Waiting for driver battery service to be brought up", (uint8_t *)location, 2u);
        }

      }
      v80 = dispatch_time(0, 1000000000);
      dispatch_semaphore_wait(v79, v80);
      -[_GCDeviceBatteryComponent battery](v11->_deviceBatteryComponent, "battery");
      v81 = objc_claimAutoreleasedReturnValue();
      battery = v11->_battery;
      v11->_battery = (GCDeviceBattery *)v81;

      if (!v11->_battery)
      {
        if (gc_isInternalBuild())
        {
          getGCLogger();
          v137 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v137, OS_LOG_TYPE_ERROR))
            -[_GCDefaultLogicalDevice initWithPhysicalDevice:configuration:manager:].cold.1(v137, v138, v139, v140, v141, v142, v143, v144);

        }
        v83 = [GCDeviceBattery alloc];
        LODWORD(v84) = 0;
        v85 = -[GCDeviceBattery initWithLevel:batteryState:](v83, "initWithLevel:batteryState:", -1, v84);
        v86 = v11->_battery;
        v11->_battery = (GCDeviceBattery *)v85;

      }
      if (gc_isInternalBuild())
      {
        getGCLogger();
        v118 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v118, OS_LOG_TYPE_INFO))
        {
          v119 = v11->_battery;
          LODWORD(location[0]) = 138412290;
          *(id *)((char *)location + 4) = v119;
          _os_log_impl(&dword_215181000, v118, OS_LOG_TYPE_INFO, "Initialize device battery component value to %@", (uint8_t *)location, 0xCu);
        }

      }
      +[NSMapTable strongToStrongObjectsMapTable](&off_254DF7908, "strongToStrongObjectsMapTable");
      v87 = objc_claimAutoreleasedReturnValue();
      clientBatteryEndpoints = v11->_clientBatteryEndpoints;
      v11->_clientBatteryEndpoints = (NSMapTable *)v87;

      objc_initWeak(location, v11);
      v157[0] = MEMORY[0x24BDAC760];
      v157[1] = 3221225472;
      v157[2] = __72___GCDefaultLogicalDevice_initWithPhysicalDevice_configuration_manager___block_invoke_180;
      v157[3] = &unk_24D2B4980;
      objc_copyWeak(&v158, location);
      -[_GCDeviceBatteryComponent setDeviceBatteryComponentBatteryUpdatedHandler:](v11->_deviceBatteryComponent, "setDeviceBatteryComponentBatteryUpdatedHandler:", v157);
      objc_destroyWeak(&v158);
      objc_destroyWeak(location);

    }
    v155 = 0u;
    v156 = 0u;
    v153 = 0u;
    v154 = 0u;
    -[_GCDefaultLogicalDevice components](v11, "components");
    v89 = (void *)objc_claimAutoreleasedReturnValue();
    v90 = objc_msgSend(v89, "countByEnumeratingWithState:objects:count:", &v153, v191, 16);
    if (v90)
    {
      v91 = *(_QWORD *)v154;
      do
      {
        for (ii = 0; ii != v90; ++ii)
        {
          if (*(_QWORD *)v154 != v91)
            objc_enumerationMutation(v89);
          v93 = *(void **)(*((_QWORD *)&v153 + 1) + 8 * ii);
          if (objc_msgSend(v93, "conformsToProtocol:", &unk_254DCFBE0))
            objc_storeStrong((id *)&v11->_deviceGameIntentComponent, v93);
        }
        v90 = objc_msgSend(v89, "countByEnumeratingWithState:objects:count:", &v153, v191, 16);
      }
      while (v90);
    }

    if (v11->_deviceGameIntentComponent)
    {
      objc_initWeak(location, v11);
      +[NSMapTable strongToStrongObjectsMapTable](&off_254DF7908, "strongToStrongObjectsMapTable");
      v94 = objc_claimAutoreleasedReturnValue();
      clientGameIntentEndpoints = v11->_clientGameIntentEndpoints;
      v11->_clientGameIntentEndpoints = (NSMapTable *)v94;

      if (gc_isInternalBuild())
      {
        getGCLogger();
        v120 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v120, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_215181000, v120, OS_LOG_TYPE_DEFAULT, "Setting intent handler", buf, 2u);
        }

      }
      v150[0] = MEMORY[0x24BDAC760];
      v150[1] = 3221225472;
      v150[2] = __72___GCDefaultLogicalDevice_initWithPhysicalDevice_configuration_manager___block_invoke_189;
      v150[3] = &unk_24D2B4C18;
      objc_copyWeak(&v151, location);
      -[_GCDeviceGameIntentComponent setDeviceGameIntentComponentGameIntentTriggeredHandler:](v11->_deviceGameIntentComponent, "setDeviceGameIntentComponentGameIntentTriggeredHandler:", v150);
      objc_destroyWeak(&v151);
      objc_destroyWeak(location);
    }
    v148 = 0u;
    v149 = 0u;
    v146 = 0u;
    v147 = 0u;
    -[_GCDefaultLogicalDevice components](v11, "components");
    v96 = (void *)objc_claimAutoreleasedReturnValue();
    v97 = objc_msgSend(v96, "countByEnumeratingWithState:objects:count:", &v146, v190, 16);
    if (v97)
    {
      v98 = *(_QWORD *)v147;
      do
      {
        for (jj = 0; jj != v97; ++jj)
        {
          if (*(_QWORD *)v147 != v98)
            objc_enumerationMutation(v96);
          v100 = *(void **)(*((_QWORD *)&v146 + 1) + 8 * jj);
          if (objc_msgSend(v100, "conformsToProtocol:", &unk_254DCD370))
            objc_storeWeak((id *)&v11->_deviceSettingsComponent, v100);
        }
        v97 = objc_msgSend(v96, "countByEnumeratingWithState:objects:count:", &v146, v190, 16);
      }
      while (v97);
    }

    WeakRetained = objc_loadWeakRetained((id *)&v11->_deviceSettingsComponent);
    if (WeakRetained)
    {
      +[NSMapTable strongToStrongObjectsMapTable](&off_254DF7908, "strongToStrongObjectsMapTable");
      v102 = objc_claimAutoreleasedReturnValue();
      clientSettingsEndpoints = v11->_clientSettingsEndpoints;
      v11->_clientSettingsEndpoints = (NSMapTable *)v102;

      GCLookupService();
      v104 = objc_claimAutoreleasedReturnValue();
      settingsStore = v11->_settingsStore;
      v11->_settingsStore = (GCSSettingsStoreService *)v104;

      -[GCSSettingsStoreService profiles](v11->_settingsStore, "profiles");
      v106 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v106, "addObserver:forKeyPath:options:context:", v11, CFSTR("values"), 5, 0);

      -[GCSSettingsStoreService games](v11->_settingsStore, "games");
      v107 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v107, "addObserver:forKeyPath:options:context:", v11, CFSTR("values"), 5, 0);

      if ((-[GCSSettingsStoreService showGCPreferencesPane](v11->_settingsStore, "showGCPreferencesPane") & 1) == 0)
        -[GCSSettingsStoreService setShowGCPreferencesPane:](v11->_settingsStore, "setShowGCPreferencesPane:", 1);
    }
  }
  v108 = v11;

  return v108;
}

- (_GCDefaultLogicalDevice)init
{
  -[_GCDefaultLogicalDevice doesNotRecognizeSelector:](self, "doesNotRecognizeSelector:", a2);

  return 0;
}

- (NSString)description
{
  return +[NSString stringWithFormat:](&off_254DEDEA8, "stringWithFormat:", CFSTR("<%@ '%@'>"), objc_opt_class(), self->_identifier);
}

- (id)redactedDescription
{
  return +[NSString stringWithFormat:](&off_254DEDEA8, "stringWithFormat:", CFSTR("<%@ '#%llx'>"), objc_opt_class(), -[NSObject hash](self->_identifier, "hash"));
}

- (NSString)debugDescription
{
  objc_class *v3;
  void *v4;
  void *v5;

  v3 = (objc_class *)objc_opt_class();
  NSStringFromClass(v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  +[NSString stringWithFormat:](&off_254DEDEA8, "stringWithFormat:", CFSTR("<%@ %p '%@'>"), v4, self, self->_identifier);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v5;
}

- (BOOL)conformsToProtocol:(id)a3
{
  objc_super v4;

  if (&unk_254DCE9B0 == a3)
    return 0;
  v4.receiver = self;
  v4.super_class = (Class)_GCDefaultLogicalDevice;
  return -[_GCDefaultLogicalDevice conformsToProtocol:](&v4, sel_conformsToProtocol_);
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
    -[_GCDefaultLogicalDevice settingsDidChange](self, "settingsDidChange");
  }
  else
  {
    v13.receiver = self;
    v13.super_class = (Class)_GCDefaultLogicalDevice;
    -[_GCDefaultLogicalDevice observeValueForKeyPath:ofObject:change:context:](&v13, sel_observeValueForKeyPath_ofObject_change_context_, v10, v11, v12, a6);
  }

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
  v6.super_class = (Class)_GCDefaultLogicalDevice;
  -[_GCDefaultLogicalDevice dealloc](&v6, sel_dealloc);
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
  self->_indicatedPlayerIndex = a4;
  -[_GCDevicePlayerIndexIndicatorComponent setIndicatedPlayerIndex:](self->_devicePlayerIndicatorComponent, "setIndicatedPlayerIndex:", a4);
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

- (void)lightXPCProxyServerEndpoint:(id)a3 didReceiveLightChange:(id)a4
{
  id v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  v6 = a4;
  objc_storeStrong((id *)&self->_light, a4);
  self->_lightClientOverrideEnabled = 1;
  if (!self->_lightUserOverrideEnabled)
    -[_GCDeviceLightComponent setLight:](self->_deviceLightComponent, "setLight:", v6);
  v14 = 0u;
  v15 = 0u;
  v12 = 0u;
  v13 = 0u;
  -[NSMapTable objectEnumerator](self->_clientLightEndpoints, "objectEnumerator", 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v13;
    do
    {
      for (i = 0; i != v9; ++i)
      {
        if (*(_QWORD *)v13 != v10)
          objc_enumerationMutation(v7);
        objc_msgSend(*(id *)(*((_QWORD *)&v12 + 1) + 8 * i), "setLight:", v6);
      }
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v9);
  }

}

- (void)adaptiveTriggersXPCProxyServerEndpoint:(id)a3 didReceiveAdaptiveTriggersChange:(id)a4 forIndex:(int)a5
{
  uint64_t v5;
  id v8;
  id v9;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  id v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  void *v18;
  char v19;
  id v20;
  NSMapTable *pidToAdaptiveTriggersComponent;
  void *v22;
  void *v23;
  int activeApplicationPID;
  NSObject *v25;
  uint64_t v26;
  void *context;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  uint8_t v32[128];
  uint8_t buf[4];
  id v34;
  __int16 v35;
  id v36;
  __int16 v37;
  int v38;
  uint64_t v39;

  v5 = *(_QWORD *)&a5;
  v39 = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v9 = a4;
  if (gc_isInternalBuild())
  {
    getGCLogger();
    v25 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v25, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412802;
      v34 = v8;
      v35 = 2112;
      v36 = v9;
      v37 = 1024;
      v38 = v5;
      _os_log_impl(&dword_215181000, v25, OS_LOG_TYPE_INFO, "adaptiveTriggersXPCProxyServerEndpoint:%@ didReceiveAdaptiveTriggersChange:%@ forIndex:%d", buf, 0x1Cu);
    }

  }
  v10 = (void *)MEMORY[0x2199DE97C]();
  v28 = 0u;
  v29 = 0u;
  v30 = 0u;
  v31 = 0u;
  -[NSMapTable keyEnumerator](self->_clientAdaptiveTriggersEndpoints, "keyEnumerator");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v28, v32, 16);
  if (v12)
  {
    v13 = v12;
    v26 = v5;
    context = v10;
    v14 = v9;
    v15 = *(_QWORD *)v29;
LABEL_4:
    v16 = 0;
    while (1)
    {
      if (*(_QWORD *)v29 != v15)
        objc_enumerationMutation(v11);
      v17 = *(void **)(*((_QWORD *)&v28 + 1) + 8 * v16);
      -[NSMapTable objectForKey:](self->_clientAdaptiveTriggersEndpoints, "objectForKey:", v17, v26);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = objc_msgSend(v18, "isEqual:", v8);

      if ((v19 & 1) != 0)
        break;
      if (v13 == ++v16)
      {
        v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v28, v32, 16);
        if (v13)
          goto LABEL_4;
        v20 = v11;
        v9 = v14;
        v10 = context;
        goto LABEL_16;
      }
    }
    v20 = v17;

    v9 = v14;
    v10 = context;
    if (!v20)
      goto LABEL_17;
    pidToAdaptiveTriggersComponent = self->_pidToAdaptiveTriggersComponent;
    +[NSNumber numberWithInt:](&off_254DED908, "numberWithInt:", objc_msgSend(v20, "processIdentifier"));
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMapTable objectForKey:](pidToAdaptiveTriggersComponent, "objectForKey:", v22);
    v23 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v23, "setObject:atIndexedSubscript:", v14, (int)v26);
    activeApplicationPID = self->_activeApplicationPID;
    if (activeApplicationPID == objc_msgSend(v20, "processIdentifier"))
      -[_GCDeviceAdaptiveTriggersComponent setAdaptiveTriggersPayload:forIndex:](self->_deviceAdaptiveTriggersComponent, "setAdaptiveTriggersPayload:forIndex:", v14, v26);

  }
  else
  {
    v20 = v11;
  }
LABEL_16:

LABEL_17:
  objc_autoreleasePoolPop(v10);

}

- (void)gameIntentXPCProxyServerEndpoint:(id)a3 didReceiveGameIntent:(int64_t)a4
{
  id GKDaemonProxyClass;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  id v11;

  if (a4 == 3)
  {
    GKDaemonProxyClass = getGKDaemonProxyClass();
    objc_msgSend(getGKLocalPlayerClass(), "local");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(GKDaemonProxyClass, "proxyForPlayer:", v5);
    v11 = (id)objc_claimAutoreleasedReturnValue();

    objc_msgSend(getGKGameClass(), "currentGame");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "internal");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    v8 = getpid();
    getGKDashboardLaunchContextGameController();
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "utilityService");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "openDashboardAsRemoteAlertForGame:hostPID:deeplink:launchContext:", v7, v8, 0, v9);

  }
  else
  {
    +[GCGameIntentManager instance](GCGameIntentManager, "instance", a3);
    v11 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "toggleGamesFolder");
  }

}

- (void)systemGestureXPCProxyServerEndpoint:(id)a3 disableSystemGestureForInput:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  int v9;
  id v10;
  __int16 v11;
  id v12;
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  if (gc_isInternalBuild())
  {
    getGCLogger();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      v9 = 138412546;
      v10 = v6;
      v11 = 2112;
      v12 = v7;
      _os_log_impl(&dword_215181000, v8, OS_LOG_TYPE_DEFAULT, "systemGestureXPCProxyServerEndpoint:%@ disableSystemGestureForInput: %@", (uint8_t *)&v9, 0x16u);
    }

  }
  -[_GCDefaultLogicalDevice systemGestureXPCProxyServerEndpoint:didSetSystemGestureStateForInput:enabled:](self, "systemGestureXPCProxyServerEndpoint:didSetSystemGestureStateForInput:enabled:", v6, v7, 0);

}

- (void)systemGestureXPCProxyServerEndpoint:(id)a3 enableSystemGestureForInput:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  int v9;
  id v10;
  __int16 v11;
  id v12;
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  if (gc_isInternalBuild())
  {
    getGCLogger();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      v9 = 138412546;
      v10 = v6;
      v11 = 2112;
      v12 = v7;
      _os_log_impl(&dword_215181000, v8, OS_LOG_TYPE_DEFAULT, "systemGestureXPCProxyServerEndpoint:%@ enableSystemGestureForInput: %@", (uint8_t *)&v9, 0x16u);
    }

  }
  -[_GCDefaultLogicalDevice systemGestureXPCProxyServerEndpoint:didSetSystemGestureStateForInput:enabled:](self, "systemGestureXPCProxyServerEndpoint:didSetSystemGestureStateForInput:enabled:", v6, v7, 1);

}

- (void)systemGestureXPCProxyServerEndpoint:(id)a3 didSetSystemGestureStateForInput:(id)a4 enabled:(BOOL)a5
{
  _BOOL4 v5;
  id v8;
  id v9;
  _GCDefaultLogicalDevice *v10;
  void *v11;
  id v12;
  uint64_t v13;
  void *i;
  void *v15;
  void *v16;
  int v17;
  _GCDefaultLogicalDevice *v18;
  void *v19;
  GCSystemGesturesState *v20;
  GCSystemGesturesState *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  GCSystemGesturesState *v29;
  void *v30;
  GCSystemGesturesState *v31;
  _BOOL4 v32;
  void *context;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  _BYTE v38[128];
  uint64_t v39;

  v5 = a5;
  v39 = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v9 = a4;
  context = (void *)MEMORY[0x2199DE97C]();
  v10 = self;
  objc_sync_enter(v10);
  v34 = 0u;
  v35 = 0u;
  v36 = 0u;
  v37 = 0u;
  -[NSMapTable keyEnumerator](v10->_clientSystemGestureEndpoints, "keyEnumerator");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = (id)objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v34, v38, 16);
  v32 = v5;
  if (v12)
  {
    v13 = *(_QWORD *)v35;
    while (2)
    {
      for (i = 0; i != v12; i = (char *)i + 1)
      {
        if (*(_QWORD *)v35 != v13)
          objc_enumerationMutation(v11);
        v15 = *(void **)(*((_QWORD *)&v34 + 1) + 8 * (_QWORD)i);
        -[NSMapTable objectForKey:](v10->_clientSystemGestureEndpoints, "objectForKey:", v15);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        v17 = objc_msgSend(v16, "isEqual:", v8);

        if (v17)
        {
          v12 = v15;
          goto LABEL_11;
        }
      }
      v12 = (id)objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v34, v38, 16);
      if (v12)
        continue;
      break;
    }
  }
LABEL_11:

  objc_sync_exit(v10);
  if (v12)
  {
    v18 = v10;
    objc_sync_enter(v18);
    +[NSNumber numberWithInt:](&off_254DED908, "numberWithInt:", objc_msgSend(v12, "processIdentifier"));
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMapTable objectForKey:](v18->_pidToSystemGesturesState, "objectForKey:", v19);
    v20 = (GCSystemGesturesState *)objc_claimAutoreleasedReturnValue();
    if (!v20)
    {
      v21 = [GCSystemGesturesState alloc];
      v22 = (void *)objc_opt_new();
      v23 = (void *)objc_opt_new();
      objc_msgSend(v12, "bundleIdentifier");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = -[GCSystemGesturesState initWithEnabledSystemGestures:disabledSystemGestures:bundleIdentifier:](v21, "initWithEnabledSystemGestures:disabledSystemGestures:bundleIdentifier:", v22, v23, v24);

    }
    -[GCSystemGesturesState disabledSystemGestureInputNames](v20, "disabledSystemGestureInputNames");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v26 = (void *)objc_msgSend(v25, "mutableCopy");

    -[GCSystemGesturesState enabledSystemGestureInputNames](v20, "enabledSystemGestureInputNames");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    v28 = (void *)objc_msgSend(v27, "mutableCopy");

    if (v32)
    {
      objc_msgSend(v28, "addObject:", v9);
      objc_msgSend(v26, "removeObject:", v9);
    }
    else
    {
      objc_msgSend(v28, "removeObject:", v9);
      objc_msgSend(v26, "addObject:", v9);
    }
    v29 = [GCSystemGesturesState alloc];
    objc_msgSend(v12, "bundleIdentifier");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    v31 = -[GCSystemGesturesState initWithEnabledSystemGestures:disabledSystemGestures:bundleIdentifier:](v29, "initWithEnabledSystemGestures:disabledSystemGestures:bundleIdentifier:", v28, v26, v30);

    -[NSMapTable setObject:forKey:](v18->_pidToSystemGesturesState, "setObject:forKey:", v31, v19);
    objc_sync_exit(v18);

    LODWORD(v30) = v18->_activeApplicationPID;
    if ((_DWORD)v30 == objc_msgSend(v12, "processIdentifier"))
      -[_GCDefaultLogicalDevice setActiveSystemGesturesState:](v18, "setActiveSystemGesturesState:", v31);

  }
  objc_autoreleasePoolPop(context);

}

- (void)motionXPCProxyServerEndpoint:(id)a3 didReceiveSensorsActiveChange:(BOOL)a4
{
  _BOOL8 v4;
  id v6;
  NSObject *v7;
  int v8;
  id v9;
  __int16 v10;
  _BOOL4 v11;
  uint64_t v12;

  v4 = a4;
  v12 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  if (gc_isInternalBuild())
  {
    getGCLogger();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      v8 = 138412546;
      v9 = v6;
      v10 = 1024;
      v11 = v4;
      _os_log_impl(&dword_215181000, v7, OS_LOG_TYPE_INFO, "motionXPCProxyServerEndpoint:%@ %d", (uint8_t *)&v8, 0x12u);
    }

  }
  -[_GCDeviceMotionComponent setSensorsActive:](self->_deviceMotionComponent, "setSensorsActive:", v4);

}

- (id)propertyForKey:(id)a3
{
  return (id)-[_GCPhysicalDevice propertyForKey:](self->_underlyingDevice, "propertyForKey:", a3);
}

- (NSSet)components
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  +[NSMutableArray array](&off_254DEBB20, "array");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  -[_GCDefaultLogicalDevice underlyingDevice](self, "underlyingDevice", 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "components");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v13;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v13 != v8)
          objc_enumerationMutation(v5);
        objc_msgSend(v3, "addObject:", *(_QWORD *)(*((_QWORD *)&v12 + 1) + 8 * v9++));
      }
      while (v7 != v9);
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v7);
  }

  objc_msgSend(v3, "addObject:", self);
  +[NSSet setWithArray:](&off_254DEBEC0, "setWithArray:", v3);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSSet *)v10;
}

- (NSSet)underlyingDevices
{
  _QWORD v3[2];

  v3[1] = *MEMORY[0x24BDAC8D0];
  v3[0] = self->_underlyingDevice;
  +[NSArray arrayWithObjects:count:](NSArray_0, "arrayWithObjects:count:", v3, 1);
  return (NSSet *)(id)objc_claimAutoreleasedReturnValue();
}

- (void)activateLogical
{
  _GCDevicePlayerIndexIndicatorComponent *devicePlayerIndicatorComponent;

  devicePlayerIndicatorComponent = self->_devicePlayerIndicatorComponent;
  if (devicePlayerIndicatorComponent)
  {
    self->_indicatedPlayerIndex = -1;
    -[_GCDevicePlayerIndexIndicatorComponent setIndicatedPlayerIndex:](devicePlayerIndicatorComponent, "setIndicatedPlayerIndex:", -1);
  }
}

- (void)deactivateLogical
{
  -[_GCDefaultLogicalDevice stopObservingClientStateChangesForAllClients](self, "stopObservingClientStateChangesForAllClients");
  -[_GCDefaultLogicalDevice stopTrackingSessionsForAllClients](self, "stopTrackingSessionsForAllClients");
}

- (void)startTrackingSessionForClient:(id)a3
{
  NSMutableDictionary *v4;
  _GCDefaultLogicalDevice *v5;
  void *v6;
  NSMutableDictionary *pidToAnalytics;
  void *v8;
  void *v9;
  void *v10;
  char v11;
  void *v12;
  void *v13;
  GCLogicalDeviceAnalytics *v14;
  void *v15;
  void *v16;
  void *v17;
  GCLogicalDeviceAnalytics *v18;
  NSMutableDictionary *v19;
  void *v20;
  NSObject *v21;
  NSObject *v22;
  NSMutableDictionary *v23;
  int v24;
  NSMutableDictionary *v25;
  __int16 v26;
  GCLogicalDeviceAnalytics *v27;
  uint64_t v28;

  v28 = *MEMORY[0x24BDAC8D0];
  v4 = (NSMutableDictionary *)a3;
  v5 = self;
  objc_sync_enter(v5);
  -[NSMutableDictionary bundleIdentifier](v4, "bundleIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    pidToAnalytics = v5->_pidToAnalytics;
    +[NSNumber numberWithInt:](&off_254DED908, "numberWithInt:", -[NSMutableDictionary processIdentifier](v4, "processIdentifier"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableDictionary objectForKeyedSubscript:](pidToAnalytics, "objectForKeyedSubscript:", v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v9)
    {
      -[_GCDefaultLogicalDevice delegate](v5, "delegate");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = objc_opt_respondsToSelector();

      -[_GCDefaultLogicalDevice delegate](v5, "delegate");
      if ((v11 & 1) != 0)
      {
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "logicalDeviceControllerDetailedProductCategory:", v5);
      }
      else
      {
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "logicalDeviceControllerProductCategory:", v5);
      }
      v13 = (void *)objc_claimAutoreleasedReturnValue();

      v14 = [GCLogicalDeviceAnalytics alloc];
      +[_GCDaemonSettings instance](_GCDaemonSettings, "instance");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "anonymizedIdentifierForControllerIdentifier:", v5->_identifier);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSMutableDictionary bundleIdentifier](v4, "bundleIdentifier");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = -[GCLogicalDeviceAnalytics initWithAnonymousIdentifier:bundleIdentifier:productCategory:](v14, "initWithAnonymousIdentifier:bundleIdentifier:productCategory:", v16, v17, v13);

      v19 = v5->_pidToAnalytics;
      +[NSNumber numberWithInt:](&off_254DED908, "numberWithInt:", -[NSMutableDictionary processIdentifier](v4, "processIdentifier"));
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSMutableDictionary setObject:forKeyedSubscript:](v19, "setObject:forKeyedSubscript:", v18, v20);

      if (gc_isInternalBuild())
      {
        getGCAnalyticsLogger();
        v21 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
        {
          v24 = 138412546;
          v25 = v4;
          v26 = 2112;
          v27 = v18;
          _os_log_impl(&dword_215181000, v21, OS_LOG_TYPE_INFO, "startTrackingSessionForClient: %@ with analytics: %@", (uint8_t *)&v24, 0x16u);
        }

      }
      if (gc_isInternalBuild())
      {
        getGCAnalyticsLogger();
        v22 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
        {
          v23 = v5->_pidToAnalytics;
          v24 = 138412290;
          v25 = v23;
          _os_log_impl(&dword_215181000, v22, OS_LOG_TYPE_INFO, "startTrackingSessionForClient: _pidToAnalytics = %@", (uint8_t *)&v24, 0xCu);
        }

      }
    }
  }
  objc_sync_exit(v5);

}

- (void)stopTrackingSessionForClient:(id)a3
{
  NSMutableDictionary *v4;
  _GCDefaultLogicalDevice *v5;
  void *v6;
  NSMutableDictionary *pidToAnalytics;
  void *v8;
  void *v9;
  NSMutableDictionary *v10;
  void *v11;
  void *v12;
  NSMutableDictionary *v13;
  void *v14;
  NSObject *v15;
  NSObject *v16;
  NSMutableDictionary *v17;
  int v18;
  NSMutableDictionary *v19;
  __int16 v20;
  void *v21;
  uint64_t v22;

  v22 = *MEMORY[0x24BDAC8D0];
  v4 = (NSMutableDictionary *)a3;
  v5 = self;
  objc_sync_enter(v5);
  -[NSMutableDictionary bundleIdentifier](v4, "bundleIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    pidToAnalytics = v5->_pidToAnalytics;
    +[NSNumber numberWithInt:](&off_254DED908, "numberWithInt:", -[NSMutableDictionary processIdentifier](v4, "processIdentifier"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableDictionary objectForKeyedSubscript:](pidToAnalytics, "objectForKeyedSubscript:", v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    if (v9)
    {
      v10 = v5->_pidToAnalytics;
      +[NSNumber numberWithInt:](&off_254DED908, "numberWithInt:", -[NSMutableDictionary processIdentifier](v4, "processIdentifier"));
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSMutableDictionary objectForKeyedSubscript:](v10, "objectForKeyedSubscript:", v11);
      v12 = (void *)objc_claimAutoreleasedReturnValue();

      v13 = v5->_pidToAnalytics;
      +[NSNumber numberWithInt:](&off_254DED908, "numberWithInt:", -[NSMutableDictionary processIdentifier](v4, "processIdentifier"));
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSMutableDictionary removeObjectForKey:](v13, "removeObjectForKey:", v14);

      if (gc_isInternalBuild())
      {
        getGCAnalyticsLogger();
        v15 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
        {
          v18 = 138412546;
          v19 = v4;
          v20 = 2112;
          v21 = v12;
          _os_log_impl(&dword_215181000, v15, OS_LOG_TYPE_INFO, "stopTrackingSessionForClient: %@ with analytics: %@", (uint8_t *)&v18, 0x16u);
        }

      }
      if (gc_isInternalBuild())
      {
        getGCAnalyticsLogger();
        v16 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
        {
          v17 = v5->_pidToAnalytics;
          v18 = 138412290;
          v19 = v17;
          _os_log_impl(&dword_215181000, v16, OS_LOG_TYPE_INFO, "stopTrackingSessionForClient: _pidToAnalytics = %@", (uint8_t *)&v18, 0xCu);
        }

      }
      objc_msgSend(v12, "flushSessionAndSendCAEvent");

    }
  }
  objc_sync_exit(v5);

}

- (void)stopTrackingSessionsForAllClients
{
  _GCDefaultLogicalDevice *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  NSObject *v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  uint8_t buf[8];
  _BYTE v13[128];
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  v2 = self;
  objc_sync_enter(v2);
  if (gc_isInternalBuild())
  {
    getGCAnalyticsLogger();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_215181000, v7, OS_LOG_TYPE_INFO, "stopTrackingSessionsForAllClients", buf, 2u);
    }

  }
  v10 = 0u;
  v11 = 0u;
  v8 = 0u;
  v9 = 0u;
  -[NSMutableDictionary allValues](v2->_pidToAnalytics, "allValues", 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v8, v13, 16);
  if (v4)
  {
    v5 = *(_QWORD *)v9;
    do
    {
      v6 = 0;
      do
      {
        if (*(_QWORD *)v9 != v5)
          objc_enumerationMutation(v3);
        objc_msgSend(*(id *)(*((_QWORD *)&v8 + 1) + 8 * v6++), "flushSessionAndSendCAEvent");
      }
      while (v4 != v6);
      v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v8, v13, 16);
    }
    while (v4);
  }

  objc_sync_exit(v2);
}

- (BOOL)_addClient:(id)a3
{
  id v4;
  _GCDefaultLogicalDevice *v5;
  void *v6;
  BOOL v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  NSObject *v14;
  uint64_t v15;
  uint64_t v16;
  void (*v17)(uint64_t);
  void *v18;
  id v19;
  id v20;
  id from;
  id location;

  v4 = a3;
  if (v4)
  {
    v5 = self;
    objc_sync_enter(v5);
    -[NSMapTable objectForKey:](v5->_clients, "objectForKey:", v4);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (v6)
    {
      v7 = 1;
    }
    else
    {
      objc_initWeak(&location, v5);
      objc_initWeak(&from, v4);
      v15 = MEMORY[0x24BDAC760];
      v16 = 3221225472;
      v17 = __38___GCDefaultLogicalDevice__addClient___block_invoke;
      v18 = &unk_24D2B3EA8;
      objc_copyWeak(&v19, &location);
      objc_copyWeak(&v20, &from);
      objc_msgSend(v4, "addInvalidationHandler:", &v15);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = v8 != 0;
      if (v8)
      {
        -[NSMapTable setObject:forKey:](v5->_clients, "setObject:forKey:", v8, v4, v15, v16, v17, v18);
        +[GCApplicationStateMonitor sharedInstance](GCApplicationStateMonitor, "sharedInstance");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "addObserver:forProcessIdentifier:", v5, objc_msgSend(v4, "processIdentifier"));

        -[_GCDefaultLogicalDevice startTrackingSessionForClient:](v5, "startTrackingSessionForClient:", v4);
        +[GCApplicationStateMonitor sharedInstance](GCApplicationStateMonitor, "sharedInstance");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        -[_GCDefaultLogicalDevice setActiveApplicationPID:](v5, "setActiveApplicationPID:", objc_msgSend(v10, "frontmostApplication"));

        +[GCApplicationStateMonitor sharedInstance](GCApplicationStateMonitor, "sharedInstance");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        +[GCApplicationStateMonitor sharedInstance](GCApplicationStateMonitor, "sharedInstance");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        -[_GCDefaultLogicalDevice setActiveApplicationCanReceiveEvents:](v5, "setActiveApplicationCanReceiveEvents:", objc_msgSend(v11, "applicationCanReceiveEvents:", objc_msgSend(v12, "frontmostApplication")));

        if (gc_isInternalBuild())
        {
          getGCLogger();
          v14 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
            -[_GCDefaultLogicalDevice _addClient:].cold.1();

        }
      }

      objc_destroyWeak(&v20);
      objc_destroyWeak(&v19);
      objc_destroyWeak(&from);
      objc_destroyWeak(&location);
    }
    objc_sync_exit(v5);

  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (void)_removeClient:(id)a3
{
  id v4;
  _GCDefaultLogicalDevice *v5;
  void *v6;
  NSMapTable *pidToAdaptiveTriggersComponent;
  void *v8;
  NSMapTable *pidToSystemGesturesState;
  void *v10;
  NSObject *v11;

  v4 = a3;
  v5 = self;
  objc_sync_enter(v5);
  if (v4)
  {
    -[NSMapTable objectForKey:](v5->_clients, "objectForKey:", v4);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (v6)
    {
      -[_GCDefaultLogicalDevice stopObservingClientStateChanges:](v5, "stopObservingClientStateChanges:", v4);
      -[_GCDefaultLogicalDevice stopTrackingSessionForClient:](v5, "stopTrackingSessionForClient:", v4);
      -[NSMapTable removeObjectForKey:](v5->_clientPlayerIndicatorEndpoints, "removeObjectForKey:", v4);
      -[NSMapTable removeObjectForKey:](v5->_clientLightEndpoints, "removeObjectForKey:", v4);
      -[NSMapTable removeObjectForKey:](v5->_clientAdaptiveTriggersEndpoints, "removeObjectForKey:", v4);
      -[NSMapTable removeObjectForKey:](v5->_clientMotionEndpoints, "removeObjectForKey:", v4);
      -[NSMapTable removeObjectForKey:](v5->_clientBatteryEndpoints, "removeObjectForKey:", v4);
      -[NSMapTable removeObjectForKey:](v5->_clientGameIntentEndpoints, "removeObjectForKey:", v4);
      -[NSMapTable removeObjectForKey:](v5->_clientSettingsEndpoints, "removeObjectForKey:", v4);
      -[NSMapTable removeObjectForKey:](v5->_clientSystemGestureEndpoints, "removeObjectForKey:", v4);
      -[NSMapTable objectForKey:](v5->_clients, "objectForKey:", v4);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSMapTable removeObjectForKey:](v5->_clients, "removeObjectForKey:", v4);
      pidToAdaptiveTriggersComponent = v5->_pidToAdaptiveTriggersComponent;
      +[NSNumber numberWithInt:](&off_254DED908, "numberWithInt:", objc_msgSend(v4, "processIdentifier"));
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSMapTable removeObjectForKey:](pidToAdaptiveTriggersComponent, "removeObjectForKey:", v8);

      pidToSystemGesturesState = v5->_pidToSystemGesturesState;
      +[NSNumber numberWithInt:](&off_254DED908, "numberWithInt:", objc_msgSend(v4, "processIdentifier"));
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSMapTable removeObjectForKey:](pidToSystemGesturesState, "removeObjectForKey:", v10);

      if (gc_isInternalBuild())
      {
        getGCLogger();
        v11 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
          -[_GCDefaultLogicalDevice _removeClient:].cold.1();

      }
    }
  }
  else
  {
    v6 = 0;
  }
  objc_sync_exit(v5);

}

- (void)stopObservingClientStateChangesForAllClients
{
  void *v2;
  _GCDefaultLogicalDevice *obj;

  obj = self;
  objc_sync_enter(obj);
  +[GCApplicationStateMonitor sharedInstance](GCApplicationStateMonitor, "sharedInstance");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "removeObserver:", obj);

  -[_GCDefaultLogicalDevice setActiveApplicationPID:](obj, "setActiveApplicationPID:", 0);
  objc_sync_exit(obj);

}

- (void)stopObservingClientStateChanges:(id)a3
{
  id v4;
  _GCDefaultLogicalDevice *v5;
  uint64_t v6;
  void *v7;
  NSObject *v8;
  int v9;
  _GCDefaultLogicalDevice *v10;
  __int16 v11;
  int v12;
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v5 = self;
  objc_sync_enter(v5);
  v6 = objc_msgSend(v4, "processIdentifier");
  +[GCApplicationStateMonitor sharedInstance](GCApplicationStateMonitor, "sharedInstance");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "removeObserver:forProcessIdentifier:", v5, v6);

  if ((_DWORD)v6 == v5->_activeApplicationPID)
  {
    if (gc_isInternalBuild())
    {
      getGCAppStateMonitorLogger();
      v8 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      {
        v9 = 138412546;
        v10 = v5;
        v11 = 1024;
        v12 = v6;
        _os_log_impl(&dword_215181000, v8, OS_LOG_TYPE_DEFAULT, "%@ stopped observing changes for PID %d, which was the active application", (uint8_t *)&v9, 0x12u);
      }

    }
    -[_GCDefaultLogicalDevice setActiveApplicationPID:](v5, "setActiveApplicationPID:", 0);
  }
  objc_sync_exit(v5);

}

- (void)applicationForegrounded:(int)a3
{
  uint64_t v3;
  _GCDefaultLogicalDevice *v4;
  NSObject *v5;
  int v6;
  _GCDefaultLogicalDevice *v7;
  __int16 v8;
  int v9;
  uint64_t v10;

  v3 = *(_QWORD *)&a3;
  v10 = *MEMORY[0x24BDAC8D0];
  v4 = self;
  objc_sync_enter(v4);
  if (gc_isInternalBuild())
  {
    getGCAppStateMonitorLogger();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      v6 = 138412546;
      v7 = v4;
      v8 = 1024;
      v9 = v3;
      _os_log_impl(&dword_215181000, v5, OS_LOG_TYPE_DEFAULT, "%@ application foregrounded: %d", (uint8_t *)&v6, 0x12u);
    }

  }
  -[_GCDefaultLogicalDevice setActiveApplicationPID:](v4, "setActiveApplicationPID:", v3);
  objc_sync_exit(v4);

}

- (void)applicationBackgrounded:(int)a3
{
  _GCDefaultLogicalDevice *v4;
  NSObject *v5;
  int v6;
  _GCDefaultLogicalDevice *v7;
  __int16 v8;
  int v9;
  uint64_t v10;

  v10 = *MEMORY[0x24BDAC8D0];
  v4 = self;
  objc_sync_enter(v4);
  if (gc_isInternalBuild())
  {
    getGCAppStateMonitorLogger();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      v6 = 138412546;
      v7 = v4;
      v8 = 1024;
      v9 = a3;
      _os_log_impl(&dword_215181000, v5, OS_LOG_TYPE_DEFAULT, "%@ application backgrounded: %d", (uint8_t *)&v6, 0x12u);
    }

  }
  if (v4->_activeApplicationPID == a3)
    -[_GCDefaultLogicalDevice setActiveApplicationPID:](v4, "setActiveApplicationPID:", 0);
  objc_sync_exit(v4);

}

- (void)applicationCanReceiveEventsDidChange:(BOOL)a3 forPID:(int)a4
{
  _BOOL8 v5;
  _GCDefaultLogicalDevice *v6;
  NSObject *v7;
  int v8;
  _GCDefaultLogicalDevice *v9;
  __int16 v10;
  _BOOL4 v11;
  __int16 v12;
  int v13;
  uint64_t v14;

  v5 = a3;
  v14 = *MEMORY[0x24BDAC8D0];
  v6 = self;
  objc_sync_enter(v6);
  if (gc_isInternalBuild())
  {
    getGCAppStateMonitorLogger();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      v8 = 138412802;
      v9 = v6;
      v10 = 1024;
      v11 = v5;
      v12 = 1024;
      v13 = a4;
      _os_log_impl(&dword_215181000, v7, OS_LOG_TYPE_DEFAULT, "%@ application can receive events did change: %d forPID: %d", (uint8_t *)&v8, 0x18u);
    }

  }
  if (v6->_activeApplicationPID == a4)
    -[_GCDefaultLogicalDevice setActiveApplicationCanReceiveEvents:](v6, "setActiveApplicationCanReceiveEvents:", v5);
  objc_sync_exit(v6);

}

- (void)setActiveApplicationCanReceiveEvents:(BOOL)a3
{
  -[_GCDeviceGameIntentComponent setEnableGlobalGameControllerFunctionality:](self->_deviceGameIntentComponent, "setEnableGlobalGameControllerFunctionality:", !a3);
}

- (void)setActiveApplicationPID:(int)a3
{
  uint64_t v3;
  NSMutableDictionary *pidToAnalytics;
  void *v6;
  void *v7;
  NSMutableDictionary *v8;
  void *v9;
  void *v10;
  _GCDeviceGameIntentComponent *deviceGameIntentComponent;
  void *v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  id v18;
  _GCDeviceAdaptiveTriggersComponent *deviceAdaptiveTriggersComponent;
  id v20;
  _GCDeviceAdaptiveTriggersComponent *v21;
  id v22;
  _GCDeviceGameIntentComponent *v23;
  id v24;
  GCSystemGesturesState *v25;
  NSMapTable *pidToAdaptiveTriggersComponent;
  void *v27;
  void *v28;
  unint64_t v29;
  void *v30;
  void *v31;
  id WeakRetained;
  _GCDefaultLogicalDevice *v33;
  void *v34;
  id v35;
  uint64_t v36;
  void *i;
  void *v38;
  NSMapTable *pidToSystemGesturesState;
  void *v40;
  void *v41;
  NSObject *v42;
  int activeApplicationPID;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  _BYTE v52[128];
  uint8_t v53[128];
  uint8_t buf[4];
  int v55;
  __int16 v56;
  int v57;
  uint64_t v58;

  v3 = *(_QWORD *)&a3;
  v58 = *MEMORY[0x24BDAC8D0];
  if (gc_isInternalBuild())
  {
    getGCAppStateMonitorLogger();
    v42 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v42, OS_LOG_TYPE_DEFAULT))
    {
      activeApplicationPID = self->_activeApplicationPID;
      *(_DWORD *)buf = 67109376;
      v55 = activeApplicationPID;
      v56 = 1024;
      v57 = v3;
      _os_log_impl(&dword_215181000, v42, OS_LOG_TYPE_DEFAULT, "setActiveApplicationPID - was %d now %d", buf, 0xEu);
    }

  }
  if (self->_activeApplicationPID != (_DWORD)v3)
  {
    pidToAnalytics = self->_pidToAnalytics;
    +[NSNumber numberWithInt:](&off_254DED908, "numberWithInt:");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableDictionary objectForKeyedSubscript:](pidToAnalytics, "objectForKeyedSubscript:", v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    if (v7)
      objc_msgSend(v7, "pauseSession");
    self->_activeApplicationPID = v3;
    v8 = self->_pidToAnalytics;
    +[NSNumber numberWithInt:](&off_254DED908, "numberWithInt:", v3);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableDictionary objectForKeyedSubscript:](v8, "objectForKeyedSubscript:", v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    if (v10)
      objc_msgSend(v10, "resumeSession");
    if (self->_activeApplicationPID)
    {
      deviceGameIntentComponent = self->_deviceGameIntentComponent;
      if (deviceGameIntentComponent)
        deviceGameIntentComponent = (_GCDeviceGameIntentComponent *)-[_GCDeviceGameIntentComponent setEnableGlobalGameControllerFunctionality:](deviceGameIntentComponent, "setEnableGlobalGameControllerFunctionality:", 0);
      v12 = (void *)MEMORY[0x2199DE97C](deviceGameIntentComponent);
      if (self->_deviceAdaptiveTriggersComponent)
      {
        v50 = 0u;
        v51 = 0u;
        v48 = 0u;
        v49 = 0u;
        -[NSMapTable keyEnumerator](self->_clientAdaptiveTriggersEndpoints, "keyEnumerator");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v48, v53, 16);
        if (v14)
        {
          v15 = *(_QWORD *)v49;
LABEL_13:
          v16 = 0;
          while (1)
          {
            if (*(_QWORD *)v49 != v15)
              objc_enumerationMutation(v13);
            v17 = *(void **)(*((_QWORD *)&v48 + 1) + 8 * v16);
            if (objc_msgSend(v17, "processIdentifier") == self->_activeApplicationPID)
              break;
            if (v14 == ++v16)
            {
              v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v48, v53, 16);
              if (v14)
                goto LABEL_13;
              goto LABEL_19;
            }
          }
          v18 = v17;

          if (!v18)
            goto LABEL_32;
          pidToAdaptiveTriggersComponent = self->_pidToAdaptiveTriggersComponent;
          +[NSNumber numberWithInt:](&off_254DED908, "numberWithInt:", objc_msgSend(v18, "processIdentifier"));
          v27 = (void *)objc_claimAutoreleasedReturnValue();
          -[NSMapTable objectForKey:](pidToAdaptiveTriggersComponent, "objectForKey:", v27);
          v28 = (void *)objc_claimAutoreleasedReturnValue();

          if (objc_msgSend(v28, "count"))
          {
            v29 = 0;
            do
            {
              objc_msgSend(v28, "objectAtIndexedSubscript:", v29);
              v30 = (void *)objc_claimAutoreleasedReturnValue();
              -[_GCDeviceAdaptiveTriggersComponent setAdaptiveTriggersPayload:forIndex:](self->_deviceAdaptiveTriggersComponent, "setAdaptiveTriggersPayload:forIndex:", v30, v29);

              ++v29;
            }
            while (objc_msgSend(v28, "count") > v29);
          }

        }
        else
        {
LABEL_19:
          v18 = v13;
        }

      }
LABEL_32:
      objc_autoreleasePoolPop(v12);
      v31 = (void *)MEMORY[0x2199DE97C]();
      WeakRetained = objc_loadWeakRetained((id *)&self->_deviceSystemGestureComponent);

      if (WeakRetained)
      {
        v33 = self;
        objc_sync_enter(v33);
        v44 = 0u;
        v45 = 0u;
        v46 = 0u;
        v47 = 0u;
        -[NSMapTable keyEnumerator](v33->_clientSystemGestureEndpoints, "keyEnumerator", 0);
        v34 = (void *)objc_claimAutoreleasedReturnValue();
        v35 = (id)objc_msgSend(v34, "countByEnumeratingWithState:objects:count:", &v44, v52, 16);
        if (v35)
        {
          v36 = *(_QWORD *)v45;
          while (2)
          {
            for (i = 0; i != v35; i = (char *)i + 1)
            {
              if (*(_QWORD *)v45 != v36)
                objc_enumerationMutation(v34);
              v38 = *(void **)(*((_QWORD *)&v44 + 1) + 8 * (_QWORD)i);
              if (objc_msgSend(v38, "processIdentifier") == self->_activeApplicationPID)
              {
                v35 = v38;
                goto LABEL_43;
              }
            }
            v35 = (id)objc_msgSend(v34, "countByEnumeratingWithState:objects:count:", &v44, v52, 16);
            if (v35)
              continue;
            break;
          }
        }
LABEL_43:

        objc_sync_exit(v33);
        if (v35)
        {
          pidToSystemGesturesState = v33->_pidToSystemGesturesState;
          +[NSNumber numberWithInt:](&off_254DED908, "numberWithInt:", objc_msgSend(v35, "processIdentifier"));
          v40 = (void *)objc_claimAutoreleasedReturnValue();
          -[NSMapTable objectForKey:](pidToSystemGesturesState, "objectForKey:", v40);
          v41 = (void *)objc_claimAutoreleasedReturnValue();

          -[_GCDefaultLogicalDevice setActiveSystemGesturesState:](v33, "setActiveSystemGesturesState:", v41);
        }

      }
      objc_autoreleasePoolPop(v31);
    }
    else
    {
      deviceAdaptiveTriggersComponent = self->_deviceAdaptiveTriggersComponent;
      if (deviceAdaptiveTriggersComponent)
      {
        v20 = -[GCDeviceAdaptiveTriggersPayload initOff]([GCDeviceAdaptiveTriggersPayload alloc], "initOff");
        -[_GCDeviceAdaptiveTriggersComponent setAdaptiveTriggersPayload:forIndex:](deviceAdaptiveTriggersComponent, "setAdaptiveTriggersPayload:forIndex:", v20, 0);

        v21 = self->_deviceAdaptiveTriggersComponent;
        v22 = -[GCDeviceAdaptiveTriggersPayload initOff]([GCDeviceAdaptiveTriggersPayload alloc], "initOff");
        -[_GCDeviceAdaptiveTriggersComponent setAdaptiveTriggersPayload:forIndex:](v21, "setAdaptiveTriggersPayload:forIndex:", v22, 1);

      }
      v23 = self->_deviceGameIntentComponent;
      if (v23)
        -[_GCDeviceGameIntentComponent setEnableGlobalGameControllerFunctionality:](v23, "setEnableGlobalGameControllerFunctionality:", 1);
      v24 = objc_loadWeakRetained((id *)&self->_deviceSystemGestureComponent);

      if (v24)
      {
        v25 = objc_alloc_init(GCSystemGesturesState);
        -[_GCDefaultLogicalDevice setActiveSystemGesturesState:](self, "setActiveSystemGesturesState:", v25);

      }
    }
    -[_GCDefaultLogicalDevice updateLightForActiveClient](self, "updateLightForActiveClient");

  }
}

- (void)updateLightForActiveClient
{
  void *v3;
  id WeakRetained;
  _GCDefaultLogicalDevice *v5;
  void *v6;
  id v7;
  uint64_t v8;
  void *i;
  void *v10;
  GCSSettingsStoreService *settingsStore;
  void *v12;
  void *v13;
  void *v14;
  GCColor *v15;
  GCDeviceLight *v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x24BDAC8D0];
  v3 = (void *)MEMORY[0x2199DE97C](self, a2);
  if (self->_deviceLightComponent)
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->_deviceSettingsComponent);

    if (WeakRetained)
    {
      v5 = self;
      objc_sync_enter(v5);
      v17 = 0u;
      v18 = 0u;
      v19 = 0u;
      v20 = 0u;
      -[NSMapTable keyEnumerator](v5->_clientLightEndpoints, "keyEnumerator", 0);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = (id)objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
      if (v7)
      {
        v8 = *(_QWORD *)v18;
        while (2)
        {
          for (i = 0; i != v7; i = (char *)i + 1)
          {
            if (*(_QWORD *)v18 != v8)
              objc_enumerationMutation(v6);
            v10 = *(void **)(*((_QWORD *)&v17 + 1) + 8 * (_QWORD)i);
            if (objc_msgSend(v10, "processIdentifier") == v5->_activeApplicationPID)
            {
              v7 = v10;
              goto LABEL_13;
            }
          }
          v7 = (id)objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
          if (v7)
            continue;
          break;
        }
      }
LABEL_13:

      objc_sync_exit(v5);
      settingsStore = v5->_settingsStore;
      -[_GCDefaultLogicalDevice persistentIdentifierForSettings](v5, "persistentIdentifierForSettings");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      if (v7)
      {
        objc_msgSend(v7, "bundleIdentifier");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        -[GCSSettingsStoreService profileForPersistentControllerIdentifier:appBundleIdentifier:](settingsStore, "profileForPersistentControllerIdentifier:appBundleIdentifier:", v12, v13);
        v14 = (void *)objc_claimAutoreleasedReturnValue();

      }
      else
      {
        -[GCSSettingsStoreService profileForPersistentControllerIdentifier:appBundleIdentifier:](settingsStore, "profileForPersistentControllerIdentifier:appBundleIdentifier:", v12, 0);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
      }

      if (objc_msgSend(v14, "lightbarColor"))
      {
        v15 = -[GCColor initWithColorPreset:]([GCColor alloc], "initWithColorPreset:", objc_msgSend(v14, "lightbarColor"));
        v16 = -[GCDeviceLight initWithColor:]([GCDeviceLight alloc], "initWithColor:", v15);
        -[_GCDeviceLightComponent setLight:](self->_deviceLightComponent, "setLight:", v16);

        v5->_lightUserOverrideEnabled = 1;
      }
      else
      {
        v5->_lightUserOverrideEnabled = 0;
        if (v5->_lightClientOverrideEnabled)
          -[_GCDeviceLightComponent setLight:](self->_deviceLightComponent, "setLight:", v5->_light);
      }

    }
  }
  objc_autoreleasePoolPop(v3);
}

- (NSObject)identifier
{
  return objc_getProperty(self, a2, 248, 1);
}

- (_GCDeviceManager)manager
{
  return (_GCDeviceManager *)objc_loadWeakRetained((id *)&self->_manager);
}

- (_GCDeviceConfiguration)configuration
{
  return self->_configuration;
}

- (_GCDefaultLogicalDeviceDelegate)delegate
{
  return (_GCDefaultLogicalDeviceDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (_GCPhysicalDevice)underlyingDevice
{
  return self->_underlyingDevice;
}

- (int)activeApplicationPID
{
  return self->_activeApplicationPID;
}

- (BOOL)activeApplicationCanReceiveEvents
{
  return self->_activeApplicationCanReceiveEvents;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_configuration, 0);
  objc_destroyWeak((id *)&self->_manager);
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_storeStrong((id *)&self->_pidToAnalytics, 0);
  objc_storeStrong((id *)&self->_clientSystemGestureEndpoints, 0);
  objc_storeStrong((id *)&self->_pidToSystemGesturesState, 0);
  objc_storeStrong((id *)&self->_activeSystemGesturesState, 0);
  objc_destroyWeak((id *)&self->_deviceSystemGestureComponent);
  objc_storeStrong((id *)&self->_clientGameIntentEndpoints, 0);
  objc_storeStrong((id *)&self->_deviceGameIntentComponent, 0);
  objc_storeStrong((id *)&self->_clientSettingsEndpoints, 0);
  objc_destroyWeak((id *)&self->_deviceSettingsComponent);
  objc_storeStrong((id *)&self->_settingsStore, 0);
  objc_storeStrong((id *)&self->_clientBatteryEndpoints, 0);
  objc_storeStrong((id *)&self->_battery, 0);
  objc_storeStrong((id *)&self->_deviceBatteryComponent, 0);
  objc_storeStrong((id *)&self->_clientMotionEndpoints, 0);
  objc_storeStrong((id *)&self->_deviceMotionComponent, 0);
  objc_storeStrong((id *)&self->_clientLightEndpoints, 0);
  objc_storeStrong((id *)&self->_light, 0);
  objc_storeStrong((id *)&self->_deviceLightComponent, 0);
  objc_storeStrong((id *)&self->_clientAdaptiveTriggersEndpoints, 0);
  objc_storeStrong((id *)&self->_pidToAdaptiveTriggersComponent, 0);
  objc_storeStrong((id *)&self->_adaptiveTriggerStatuses, 0);
  objc_storeStrong((id *)&self->_deviceAdaptiveTriggersComponent, 0);
  objc_storeStrong((id *)&self->_clientPlayerIndicatorEndpoints, 0);
  objc_storeStrong((id *)&self->_devicePlayerIndicatorComponent, 0);
  objc_storeStrong((id *)&self->_clients, 0);
  objc_storeStrong((id *)&self->_underlyingDevice, 0);
}

- (id)makeControllerForClient:(id)a3
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  GCProductInformation *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  unsigned int v20;
  void *v21;
  void *v22;
  int v23;
  unsigned int v24;
  uint64_t v25;
  void *v26;
  _GCControllerComponentDescription *v27;
  GCHIDInformation *v28;
  void *v29;
  void *v30;
  _GCControllerComponentDescription *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  int v38;
  void *v39;
  void *v40;
  char v41;
  _GCControllerComponentDescription *v42;
  void *v43;
  _GCControllerComponentDescription *v44;
  void *v45;
  void *v46;
  _GCControllerComponentDescription *v47;
  void *v48;
  _GCControllerComponentDescription *v49;
  _GCDefaultLogicalDevice *v50;
  GCMotionXPCProxyServerEndpoint *v51;
  GCMotionXPCProxyServerEndpoint *v52;
  void *v53;
  void *v54;
  void *v55;
  id v56;
  uint64_t v57;
  void *v58;
  uint64_t v59;
  uint64_t i;
  void *v61;
  id v62;
  GCHapticCapabilities *v63;
  void *v64;
  void *v65;
  GCHapticCapabilities *v66;
  _GCControllerComponentDescription *v67;
  _GCDefaultLogicalDevice *v68;
  GCPlayerIndicatorXPCProxyServerEndpoint *v69;
  GCPlayerIndicatorXPCProxyServerEndpoint *v70;
  void *v71;
  void *v72;
  void *v73;
  _GCDefaultLogicalDevice *v74;
  GCLightXPCProxyServerEndpoint *v75;
  GCLightXPCProxyServerEndpoint *v76;
  void *v77;
  void *v78;
  void *v79;
  _GCDefaultLogicalDevice *v80;
  GCAdaptiveTriggersXPCProxyServerEndpoint *v81;
  GCAdaptiveTriggersXPCProxyServerEndpoint *v82;
  void *v83;
  void *v84;
  void *v85;
  void *v86;
  id v87;
  id v88;
  NSMapTable *pidToAdaptiveTriggersComponent;
  void *v90;
  _GCDefaultLogicalDevice *v91;
  GCBatteryXPCProxyServerEndpoint *v92;
  GCBatteryXPCProxyServerEndpoint *v93;
  void *v94;
  void *v95;
  void *v96;
  _GCDefaultLogicalDevice *v97;
  GCGameIntentXPCProxyServerEndpoint *v98;
  GCGameIntentXPCProxyServerEndpoint *v99;
  void *v100;
  void *v101;
  void *v102;
  id WeakRetained;
  _GCDefaultLogicalDevice *v104;
  void *v105;
  void *v106;
  int v107;
  GCSystemGestureXPCProxyServerEndpoint *v108;
  void *v109;
  uint64_t v110;
  GCSystemGestureXPCProxyServerEndpoint *v111;
  void *v112;
  void *v113;
  id v114;
  _GCDefaultLogicalDevice *v115;
  GCSettingsXPCProxyServerEndpoint *v116;
  GCSSettingsStoreService *settingsStore;
  void *v118;
  void *v119;
  void *v120;
  void *v121;
  GCSettingsXPCProxyServerEndpoint *v122;
  void *v123;
  void *v124;
  void *v125;
  void *v126;
  id v127;
  void *v128;
  void *v130;
  NSObject *v131;
  SEL v132;
  void *v133;
  __int128 v134;
  __int128 v135;
  __int128 v136;
  __int128 v137;
  _BYTE v138[128];
  void *v139;
  void *v140;
  uint8_t buf[4];
  uint64_t v142;
  void *v143;
  _QWORD v144[3];

  v144[1] = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  if (-[_GCDefaultLogicalDevice _addClient:](self, "_addClient:", v5))
  {
    v132 = a2;
    -[_GCDefaultLogicalDevice delegate](self, "delegate");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_opt_respondsToSelector() & 1) != 0)
    {
      objc_msgSend(v6, "logicalDevice:makeControllerForClient:", self, v5);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_94:

      goto LABEL_95;
    }
    -[_GCDefaultLogicalDevice components](self, "components");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    +[NSMutableArray array](&off_254DEBB20, "array");
    v133 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = -[GCProductInformation initWithIdentifier:]([GCProductInformation alloc], "initWithIdentifier:", CFSTR("ProductInfo"));
    objc_msgSend(v6, "logicalDeviceControllerProductCategory:", self);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[GCProductInformation setProductCategory:](v9, "setProductCategory:", v10);

    if ((objc_opt_respondsToSelector() & 1) != 0)
      objc_msgSend(v6, "logicalDeviceControllerDetailedProductCategory:", self);
    else
      -[GCProductInformation productCategory](v9, "productCategory");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[GCProductInformation setDetailedProductCategory:](v9, "setDetailedProductCategory:", v11);

    if ((objc_opt_respondsToSelector() & 1) != 0)
    {
      objc_msgSend(v6, "logicalDeviceControllerVendorName:", self);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      if (v12)
      {
        -[GCProductInformation setVendorName:](v9, "setVendorName:", v12);
      }
      else
      {
        -[_GCDefaultLogicalDevice underlyingDevice](self, "underlyingDevice");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "propertyForKey:", CFSTR("Product"));
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        -[GCProductInformation setVendorName:](v9, "setVendorName:", v15);

      }
    }
    else
    {
      -[_GCDefaultLogicalDevice underlyingDevice](self, "underlyingDevice");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "propertyForKey:", CFSTR("Product"));
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      -[GCProductInformation setVendorName:](v9, "setVendorName:", v13);

    }
    +[_GCDaemonSettings instance](_GCDaemonSettings, "instance");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "anonymizedIdentifierForControllerIdentifier:", self->_identifier);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    -[GCProductInformation setAnonymizedIdentifier:](v9, "setAnonymizedIdentifier:", v17);

    if ((objc_opt_respondsToSelector() & 1) != 0)
    {
      +[NSNumber numberWithBool:](&off_254DED908, "numberWithBool:", objc_msgSend(v6, "logicalDeviceControllerIsAttachedToHost:", self));
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      -[GCProductInformation setAttachedToDevice:](v9, "setAttachedToDevice:", v18);
    }
    else
    {
      -[_GCDefaultLogicalDevice underlyingDevice](self, "underlyingDevice");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "propertyForKey:", CFSTR("GameControllerFormFitting"));
      v18 = (void *)objc_claimAutoreleasedReturnValue();

      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
        v20 = objc_msgSend(v18, "BOOLValue");
      else
        v20 = 0;
      -[_GCDefaultLogicalDevice underlyingDevice](self, "underlyingDevice");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "propertyForKey:", CFSTR("IAPHIDAccessoryCategory"));
      v22 = (void *)objc_claimAutoreleasedReturnValue();

      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
        v23 = objc_msgSend(v22, "intValue");
      else
        v23 = -1;
      if (v23 == 3)
        v24 = 1;
      else
        v24 = v20;
      if (v23 == 4)
        v25 = 1;
      else
        v25 = v24;
      +[NSNumber numberWithBool:](&off_254DED908, "numberWithBool:", v25);
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      -[GCProductInformation setAttachedToDevice:](v9, "setAttachedToDevice:", v26);

    }
    v27 = -[_GCControllerComponentDescription initWithComponent:bindings:]([_GCControllerComponentDescription alloc], "initWithComponent:bindings:", v9, 0);
    objc_msgSend(v133, "addObject:", v27);

    v28 = -[GCHIDInformation initWithIdentifier:]([GCHIDInformation alloc], "initWithIdentifier:", CFSTR("HIDInfo"));
    -[_GCDefaultLogicalDevice underlyingDevice](self, "underlyingDevice");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "propertyForKey:", CFSTR("RegistryID"));
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    -[GCHIDInformation setRegistryID:](v28, "setRegistryID:", v30);

    v31 = -[_GCControllerComponentDescription initWithComponent:bindings:]([_GCControllerComponentDescription alloc], "initWithComponent:bindings:", v28, 0);
    objc_msgSend(v133, "addObject:", v31);

    -[_GCDefaultLogicalDevice _makeControllerGamepadEventSource](self, "_makeControllerGamepadEventSource");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    if (v32)
    {
      if ((objc_opt_respondsToSelector() & 1) != 0)
      {
        v144[0] = v32;
        +[NSArray arrayWithObjects:count:](NSArray_0, "arrayWithObjects:count:", v144, 1);
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "logicalDevice:makeControllerInputDescriptionWithIdentifier:bindings:", self, CFSTR("Input"), v33);
        v34 = (void *)objc_claimAutoreleasedReturnValue();

        if (v34)
          objc_msgSend(v133, "addObject:", v34);

      }
      if ((objc_opt_respondsToSelector() & 1) != 0
        && (v143 = v32,
            +[NSArray arrayWithObjects:count:](NSArray_0, "arrayWithObjects:count:", &v143, 1),
            v35 = (void *)objc_claimAutoreleasedReturnValue(),
            objc_msgSend(v6, "logicalDevice:makeControllerPhysicalInputProfileDescriptionWithIdentifier:bindings:", self, CFSTR("PhysicalInput"), v35), v36 = (void *)objc_claimAutoreleasedReturnValue(), v35, v36))
      {
        objc_msgSend(v133, "addObject:", v36);
      }
      else
      {
        objc_msgSend(v6, "logicalDevice:makeControllerPhysicalInputProfileWithIdentifier:", self, CFSTR("PhysicalInput"));
        v36 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v36, "setGlyphFlags:", 0);
        -[_GCDefaultLogicalDevice underlyingDevice](self, "underlyingDevice");
        v37 = (void *)objc_claimAutoreleasedReturnValue();
        v38 = objc_msgSend(v37, "conformsToProtocol:", &unk_254DCFCB0);

        if (v38)
        {
          -[_GCDefaultLogicalDevice underlyingDevice](self, "underlyingDevice");
          v39 = (void *)objc_claimAutoreleasedReturnValue();
          -[_GCDefaultLogicalDevice underlyingDevice](self, "underlyingDevice");
          v40 = (void *)objc_claimAutoreleasedReturnValue();
          v41 = objc_opt_respondsToSelector();

          if ((v41 & 1) != 0)
          {
            objc_msgSend(v36, "setGlyphFlags:", objc_msgSend(v39, "getGlyphFlags"));
            if (gc_isInternalBuild())
            {
              getGCLogger();
              v131 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v131, OS_LOG_TYPE_INFO))
              {
                *(_DWORD *)buf = 134217984;
                v142 = objc_msgSend(v36, "glyphFlags");
                _os_log_impl(&dword_215181000, v131, OS_LOG_TYPE_INFO, "Determined physical input profile glyph flags: %ld", buf, 0xCu);
              }

            }
          }

        }
        if (objc_msgSend(v36, "conformsToProtocol:", &unk_254DC37C8))
        {
          v42 = [_GCControllerComponentDescription alloc];
          v140 = v32;
          +[NSArray arrayWithObjects:count:](NSArray_0, "arrayWithObjects:count:", &v140, 1);
          v43 = (void *)objc_claimAutoreleasedReturnValue();
          v44 = -[_GCControllerComponentDescription initWithComponent:bindings:](v42, "initWithComponent:bindings:", v36, v43);

          objc_msgSend(v133, "addObject:", v44);
        }
      }

    }
    if (self->_deviceMotionComponent)
    {
      objc_msgSend(v6, "logicalDevice:makeControllerMotionWithIdentifier:", self, CFSTR("Motion"));
      v45 = (void *)objc_claimAutoreleasedReturnValue();
      -[_GCDeviceMotionComponent motionEventSource](self->_deviceMotionComponent, "motionEventSource");
      v46 = (void *)objc_claimAutoreleasedReturnValue();
      v47 = [_GCControllerComponentDescription alloc];
      v139 = v46;
      +[NSArray arrayWithObjects:count:](NSArray_0, "arrayWithObjects:count:", &v139, 1);
      v48 = (void *)objc_claimAutoreleasedReturnValue();
      v49 = -[_GCControllerComponentDescription initWithComponent:bindings:](v47, "initWithComponent:bindings:", v45, v48);

      objc_msgSend(v133, "addObject:", v49);
      v50 = self;
      objc_sync_enter(v50);
      -[NSMapTable objectForKey:](v50->_clientMotionEndpoints, "objectForKey:", v5);
      v51 = (GCMotionXPCProxyServerEndpoint *)objc_claimAutoreleasedReturnValue();
      if (!v51)
      {
        v52 = [GCMotionXPCProxyServerEndpoint alloc];
        +[NSUUID UUID](&off_254DEEE48, "UUID");
        v53 = (void *)objc_claimAutoreleasedReturnValue();
        v51 = -[GCMotionXPCProxyServerEndpoint initWithIdentifier:initialValue:](v52, "initWithIdentifier:initialValue:", v53, 0);

        -[GCMotionXPCProxyServerEndpoint setDelegate:](v51, "setDelegate:", v50);
        -[NSMapTable setObject:forKey:](v50->_clientMotionEndpoints, "setObject:forKey:", v51, v5);
        objc_msgSend(v5, "IPCObjectRegistry");
        v54 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v54, "registerIPCObject:", v51);

      }
      -[GCMotionXPCProxyServerEndpoint receiverDescription](v51, "receiverDescription");
      v55 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v133, "addObject:", v55);

      objc_sync_exit(v50);
    }
    v136 = 0u;
    v137 = 0u;
    v134 = 0u;
    v135 = 0u;
    v56 = v8;
    v57 = objc_msgSend(v56, "countByEnumeratingWithState:objects:count:", &v134, v138, 16);
    v58 = v56;
    if (v57)
    {
      v58 = 0;
      v59 = *(_QWORD *)v135;
      do
      {
        for (i = 0; i != v57; ++i)
        {
          if (*(_QWORD *)v135 != v59)
            objc_enumerationMutation(v56);
          v61 = *(void **)(*((_QWORD *)&v134 + 1) + 8 * i);
          if (objc_msgSend(v61, "conformsToProtocol:", &unk_254DCA250))
          {
            v62 = v61;

            v58 = v62;
          }
        }
        v57 = objc_msgSend(v56, "countByEnumeratingWithState:objects:count:", &v134, v138, 16);
      }
      while (v57);

      if (!v58)
        goto LABEL_59;
      v63 = [GCHapticCapabilities alloc];
      objc_msgSend(v58, "hapticEngines");
      v64 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v58, "hapticCapabilityGraph");
      v65 = (void *)objc_claimAutoreleasedReturnValue();
      v66 = -[GCHapticCapabilities initWithIdentifier:hapticEnginesInfo:hapticCapabilityGraph:](v63, "initWithIdentifier:hapticEnginesInfo:hapticCapabilityGraph:", CFSTR("HapticCapabilities"), v64, v65);

      v67 = -[_GCControllerComponentDescription initWithComponent:bindings:]([_GCControllerComponentDescription alloc], "initWithComponent:bindings:", v66, 0);
      objc_msgSend(v133, "addObject:", v67);

    }
LABEL_59:
    if (self->_devicePlayerIndicatorComponent)
    {
      v68 = self;
      objc_sync_enter(v68);
      -[NSMapTable objectForKey:](v68->_clientPlayerIndicatorEndpoints, "objectForKey:", v5);
      v69 = (GCPlayerIndicatorXPCProxyServerEndpoint *)objc_claimAutoreleasedReturnValue();
      if (!v69)
      {
        v70 = [GCPlayerIndicatorXPCProxyServerEndpoint alloc];
        +[NSUUID UUID](&off_254DEEE48, "UUID");
        v71 = (void *)objc_claimAutoreleasedReturnValue();
        v69 = -[GCPlayerIndicatorXPCProxyServerEndpoint initWithIdentifier:initialValue:](v70, "initWithIdentifier:initialValue:", v71, v68->_indicatedPlayerIndex);

        -[GCPlayerIndicatorXPCProxyServerEndpoint setDelegate:](v69, "setDelegate:", v68);
        -[NSMapTable setObject:forKey:](v68->_clientPlayerIndicatorEndpoints, "setObject:forKey:", v69, v5);
        objc_msgSend(v5, "IPCObjectRegistry");
        v72 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v72, "registerIPCObject:", v69);

      }
      -[GCPlayerIndicatorXPCProxyServerEndpoint receiverDescription](v69, "receiverDescription");
      v73 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v133, "addObject:", v73);

      objc_sync_exit(v68);
    }
    if (self->_deviceLightComponent)
    {
      v74 = self;
      objc_sync_enter(v74);
      -[NSMapTable objectForKey:](v74->_clientLightEndpoints, "objectForKey:", v5);
      v75 = (GCLightXPCProxyServerEndpoint *)objc_claimAutoreleasedReturnValue();
      if (!v75)
      {
        v76 = [GCLightXPCProxyServerEndpoint alloc];
        +[NSUUID UUID](&off_254DEEE48, "UUID");
        v77 = (void *)objc_claimAutoreleasedReturnValue();
        v75 = -[GCLightXPCProxyServerEndpoint initWithIdentifier:initialValue:](v76, "initWithIdentifier:initialValue:", v77, v74->_light);

        -[GCLightXPCProxyServerEndpoint setDelegate:](v75, "setDelegate:", v74);
        -[NSMapTable setObject:forKey:](v74->_clientLightEndpoints, "setObject:forKey:", v75, v5);
        objc_msgSend(v5, "IPCObjectRegistry");
        v78 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v78, "registerIPCObject:", v75);

      }
      -[GCLightXPCProxyServerEndpoint receiverDescription](v75, "receiverDescription");
      v79 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v133, "addObject:", v79);

      objc_sync_exit(v74);
    }
    if (self->_deviceAdaptiveTriggersComponent)
    {
      v80 = self;
      objc_sync_enter(v80);
      -[NSMapTable objectForKey:](v80->_clientAdaptiveTriggersEndpoints, "objectForKey:", v5);
      v81 = (GCAdaptiveTriggersXPCProxyServerEndpoint *)objc_claimAutoreleasedReturnValue();
      if (!v81)
      {
        v82 = [GCAdaptiveTriggersXPCProxyServerEndpoint alloc];
        +[NSUUID UUID](&off_254DEEE48, "UUID");
        v83 = (void *)objc_claimAutoreleasedReturnValue();
        v81 = -[GCAdaptiveTriggersXPCProxyServerEndpoint initWithIdentifier:initialStatuses:](v82, "initWithIdentifier:initialStatuses:", v83, v80->_adaptiveTriggerStatuses);

        -[GCAdaptiveTriggersXPCProxyServerEndpoint setDelegate:](v81, "setDelegate:", v80);
        -[NSMapTable setObject:forKey:](v80->_clientAdaptiveTriggersEndpoints, "setObject:forKey:", v81, v5);
        objc_msgSend(v5, "IPCObjectRegistry");
        v84 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v84, "registerIPCObject:", v81);

      }
      -[GCAdaptiveTriggersXPCProxyServerEndpoint receiverDescription](v81, "receiverDescription");
      v85 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v133, "addObject:", v85);

      v86 = (void *)objc_opt_new();
      v87 = -[GCDeviceAdaptiveTriggersPayload initOff]([GCDeviceAdaptiveTriggersPayload alloc], "initOff");
      objc_msgSend(v86, "addObject:", v87);

      v88 = -[GCDeviceAdaptiveTriggersPayload initOff]([GCDeviceAdaptiveTriggersPayload alloc], "initOff");
      objc_msgSend(v86, "addObject:", v88);

      pidToAdaptiveTriggersComponent = v80->_pidToAdaptiveTriggersComponent;
      +[NSNumber numberWithInt:](&off_254DED908, "numberWithInt:", objc_msgSend(v5, "processIdentifier"));
      v90 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSMapTable setObject:forKey:](pidToAdaptiveTriggersComponent, "setObject:forKey:", v86, v90);

      objc_sync_exit(v80);
    }
    if (self->_deviceBatteryComponent)
    {
      v91 = self;
      objc_sync_enter(v91);
      -[NSMapTable objectForKey:](v91->_clientBatteryEndpoints, "objectForKey:", v5);
      v92 = (GCBatteryXPCProxyServerEndpoint *)objc_claimAutoreleasedReturnValue();
      if (!v92)
      {
        v93 = [GCBatteryXPCProxyServerEndpoint alloc];
        +[NSUUID UUID](&off_254DEEE48, "UUID");
        v94 = (void *)objc_claimAutoreleasedReturnValue();
        v92 = -[GCBatteryXPCProxyServerEndpoint initWithIdentifier:initialValue:](v93, "initWithIdentifier:initialValue:", v94, v91->_battery);

        -[GCBatteryXPCProxyServerEndpoint setDelegate:](v92, "setDelegate:", v91);
        -[NSMapTable setObject:forKey:](v91->_clientBatteryEndpoints, "setObject:forKey:", v92, v5);
        objc_msgSend(v5, "IPCObjectRegistry");
        v95 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v95, "registerIPCObject:", v92);

      }
      -[GCBatteryXPCProxyServerEndpoint receiverDescription](v92, "receiverDescription");
      v96 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v133, "addObject:", v96);

      objc_sync_exit(v91);
    }
    if (self->_deviceGameIntentComponent)
    {
      v97 = self;
      objc_sync_enter(v97);
      -[NSMapTable objectForKey:](v97->_clientGameIntentEndpoints, "objectForKey:", v5);
      v98 = (GCGameIntentXPCProxyServerEndpoint *)objc_claimAutoreleasedReturnValue();
      if (!v98)
      {
        v99 = [GCGameIntentXPCProxyServerEndpoint alloc];
        +[NSUUID UUID](&off_254DEEE48, "UUID");
        v100 = (void *)objc_claimAutoreleasedReturnValue();
        v98 = -[GCGameIntentXPCProxyServerEndpoint initWithIdentifier:](v99, "initWithIdentifier:", v100);

        -[GCGameIntentXPCProxyServerEndpoint setDelegate:](v98, "setDelegate:", v97);
        -[NSMapTable setObject:forKey:](v97->_clientGameIntentEndpoints, "setObject:forKey:", v98, v5);
        objc_msgSend(v5, "IPCObjectRegistry");
        v101 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v101, "registerIPCObject:", v98);

      }
      -[GCGameIntentXPCProxyServerEndpoint receiverDescription](v98, "receiverDescription");
      v102 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v133, "addObject:", v102);

      objc_sync_exit(v97);
    }
    WeakRetained = objc_loadWeakRetained((id *)&self->_deviceSystemGestureComponent);

    if (WeakRetained)
    {
      v104 = self;
      objc_sync_enter(v104);
      -[NSMapTable objectForKey:](v104->_clientSystemGestureEndpoints, "objectForKey:", v5);
      v105 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v105)
      {
        objc_msgSend(v5, "bundleIdentifier");
        v106 = (void *)objc_claimAutoreleasedReturnValue();
        v107 = objc_msgSend(v106, "isEqualToString:", CFSTR("com.apple.controlcenter"));

        if (v107)
        {
          v108 = [GCSystemGestureXPCProxyServerEndpoint alloc];
          +[NSUUID UUID](&off_254DEEE48, "UUID");
          v109 = (void *)objc_claimAutoreleasedReturnValue();
          v110 = -[GCSystemGestureXPCProxyServerEndpoint initSystemGestureObserverWithIdentifier:initialValue:](v108, "initSystemGestureObserverWithIdentifier:initialValue:", v109, v104->_activeSystemGesturesState);
        }
        else
        {
          v111 = [GCSystemGestureXPCProxyServerEndpoint alloc];
          +[NSUUID UUID](&off_254DEEE48, "UUID");
          v109 = (void *)objc_claimAutoreleasedReturnValue();
          v110 = -[GCSystemGestureXPCProxyServerEndpoint initWithIdentifier:](v111, "initWithIdentifier:", v109);
        }
        v105 = (void *)v110;

        objc_msgSend(v105, "setDelegate:", v104);
        -[NSMapTable setObject:forKey:](v104->_clientSystemGestureEndpoints, "setObject:forKey:", v105, v5);
        objc_msgSend(v5, "IPCObjectRegistry");
        v112 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v112, "registerIPCObject:", v105);

      }
      objc_msgSend(v105, "receiverDescription");
      v113 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v133, "addObject:", v113);

      objc_sync_exit(v104);
    }
    v114 = objc_loadWeakRetained((id *)&self->_deviceSettingsComponent);

    if (v114)
    {
      v115 = self;
      objc_sync_enter(v115);
      -[NSMapTable objectForKey:](v115->_clientSettingsEndpoints, "objectForKey:", v5);
      v116 = (GCSettingsXPCProxyServerEndpoint *)objc_claimAutoreleasedReturnValue();
      if (!v116)
      {
        settingsStore = v115->_settingsStore;
        -[_GCDefaultLogicalDevice persistentIdentifierForSettings](v115, "persistentIdentifierForSettings");
        v118 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "bundleIdentifier");
        v119 = (void *)objc_claimAutoreleasedReturnValue();
        -[GCSSettingsStoreService profileForPersistentControllerIdentifier:appBundleIdentifier:](settingsStore, "profileForPersistentControllerIdentifier:appBundleIdentifier:", v118, v119);
        v120 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v120, "anonymizedCopy");
        v121 = (void *)objc_claimAutoreleasedReturnValue();

        v122 = [GCSettingsXPCProxyServerEndpoint alloc];
        +[NSUUID UUID](&off_254DEEE48, "UUID");
        v123 = (void *)objc_claimAutoreleasedReturnValue();
        v116 = -[GCSettingsXPCProxyServerEndpoint initWithIdentifier:initialValueForProfile:](v122, "initWithIdentifier:initialValueForProfile:", v123, v121);

        -[GCSettingsXPCProxyServerEndpoint setDelegate:](v116, "setDelegate:", v115);
        -[NSMapTable setObject:forKey:](v115->_clientSettingsEndpoints, "setObject:forKey:", v116, v5);
        objc_msgSend(v5, "IPCObjectRegistry");
        v124 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v124, "registerIPCObject:", v116);

      }
      -[GCSettingsXPCProxyServerEndpoint receiverDescription](v116, "receiverDescription");
      v125 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v133, "addObject:", v125);

      objc_sync_exit(v115);
    }
    v126 = (void *)objc_opt_class();
    if ((objc_opt_respondsToSelector() & 1) != 0)
    {
      v126 = (void *)objc_msgSend(v6, "logicalDeviceControllerDescriptionClass:", self);
      if ((objc_msgSend(v126, "isSubclassOfClass:", objc_opt_class()) & 1) == 0)
      {
        unk_254DEC4F8(&off_254DEC660, "currentHandler");
        v130 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v130, "handleFailureInMethod:object:file:lineNumber:description:", v132, self, CFSTR("_GCDefaultLogicalDevice.m"), 1290, CFSTR("Assertion failed: [descriptionClass isSubclassOfClass:_GCControllerDescription.class]"));

      }
    }
    v127 = objc_alloc((Class)v126);
    -[_GCDefaultLogicalDevice identifier](self, "identifier");
    v128 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = (void *)objc_msgSend(v127, "initWithIdentifier:components:", v128, v133);

    goto LABEL_94;
  }
  v7 = 0;
LABEL_95:

  return v7;
}

- (id)_makeControllerGamepadEventSource
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  uint64_t i;
  void *v8;
  id v9;
  void *v10;
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
  -[_GCDefaultLogicalDevice components](self, "components", 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v3)
  {
    v4 = v3;
    v5 = 0;
    v6 = *(_QWORD *)v13;
    do
    {
      for (i = 0; i != v4; ++i)
      {
        if (*(_QWORD *)v13 != v6)
          objc_enumerationMutation(v2);
        v8 = *(void **)(*((_QWORD *)&v12 + 1) + 8 * i);
        if (objc_msgSend(v8, "conformsToProtocol:", &unk_254DCA028))
        {
          v9 = v8;

          v5 = v9;
        }
      }
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v4);
  }
  else
  {
    v5 = 0;
  }

  objc_msgSend(v5, "gamepadEventSource");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

- (void)settingsDidChange
{
  NSObject *v3;
  _GCDefaultLogicalDevice *v4;
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
        -[_GCDefaultLogicalDevice persistentIdentifierForSettings](v4, "persistentIdentifierForSettings");
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

  -[_GCDefaultLogicalDevice updateLightForActiveClient](v4, "updateLightForActiveClient");
  objc_sync_exit(v4);

}

- (id)persistentIdentifierForSettings
{
  void *v3;
  char isKindOfClass;
  __CFString *v5;

  -[_GCDefaultLogicalDevice identifier](self, "identifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  if ((isKindOfClass & 1) != 0)
  {
    -[_GCDefaultLogicalDevice identifier](self, "identifier");
    v5 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v5 = &stru_24D2B85A8;
  }
  return v5;
}

- (void)setActiveSystemGesturesState:(id)a3
{
  GCSystemGesturesState *v4;
  GCSystemGesturesState **p_activeSystemGesturesState;
  _GCDefaultLogicalDevice *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  NSObject *v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  uint8_t v17[128];
  uint8_t buf[4];
  _GCDefaultLogicalDevice *v19;
  __int16 v20;
  GCSystemGesturesState *v21;
  uint64_t v22;

  v22 = *MEMORY[0x24BDAC8D0];
  v4 = (GCSystemGesturesState *)a3;
  if (!v4)
    v4 = objc_alloc_init(GCSystemGesturesState);
  p_activeSystemGesturesState = &self->_activeSystemGesturesState;
  if (self->_activeSystemGesturesState != v4)
  {
    if (gc_isInternalBuild())
    {
      getGCLogger();
      v12 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412546;
        v19 = self;
        v20 = 2112;
        v21 = v4;
        _os_log_impl(&dword_215181000, v12, OS_LOG_TYPE_INFO, "%@ setActiveSystemGesturesState - %@", buf, 0x16u);
      }

    }
    objc_storeStrong((id *)&self->_activeSystemGesturesState, v4);
    v6 = self;
    objc_sync_enter(v6);
    v13 = 0u;
    v14 = 0u;
    v15 = 0u;
    v16 = 0u;
    -[NSMapTable objectEnumerator](v6->_clientSystemGestureEndpoints, "objectEnumerator", 0);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    if (v8)
    {
      v9 = *(_QWORD *)v14;
      do
      {
        for (i = 0; i != v8; ++i)
        {
          if (*(_QWORD *)v14 != v9)
            objc_enumerationMutation(v7);
          v11 = *(void **)(*((_QWORD *)&v13 + 1) + 8 * i);
          if (objc_msgSend(v11, "isSystemGestureObserver"))
            objc_msgSend(v11, "setSystemGesturesState:", *p_activeSystemGesturesState);
        }
        v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
      }
      while (v8);
    }

    objc_sync_exit(v6);
  }

}

- (GCSystemGesturesState)activeSystemGesturesState
{
  return self->_activeSystemGesturesState;
}

- (id)makeSyntheticController
{
  _GCSyntheticControllerDescription *v3;
  void *v4;
  void *v5;
  _GCSyntheticControllerDescription *v6;

  v3 = [_GCSyntheticControllerDescription alloc];
  -[_GCDefaultLogicalDevice identifier](self, "identifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[_GCDefaultLogicalDevice persistentIdentifierForSettings](self, "persistentIdentifierForSettings");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[_GCSyntheticControllerDescription initWithControllerIdentifier:persistentIdentifier:](v3, "initWithControllerIdentifier:persistentIdentifier:", v4, v5);

  return v6;
}

- (id)hapticDriver
{
  void *v2;
  void *v3;

  -[_GCPhysicalDevice driverConnection](self->_underlyingDevice, "driverConnection");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "remoteProxy");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (void)initWithPhysicalDevice:(uint64_t)a3 configuration:(uint64_t)a4 manager:(uint64_t)a5 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_14(&dword_215181000, a1, a3, "Unable to receive response from driver battery service!", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_3_2();
}

- (void)initWithPhysicalDevice:(uint64_t)a3 configuration:(uint64_t)a4 manager:(uint64_t)a5 .cold.2(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_14(&dword_215181000, a1, a3, "Unable to receive response from driver adaptive trigger service!", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_3_2();
}

- (void)initWithPhysicalDevice:(uint64_t)a3 configuration:(uint64_t)a4 manager:(uint64_t)a5 .cold.3(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_14(&dword_215181000, a1, a3, "Unable to receive response from driver light service!", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_3_2();
}

- (void)_addClient:.cold.1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_2_12();
  OUTLINED_FUNCTION_1_13(&dword_215181000, v0, v1, "Device %@ client added: %@");
}

- (void)_removeClient:.cold.1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_2_12();
  OUTLINED_FUNCTION_1_13(&dword_215181000, v0, v1, "Device %@ client removed: %@");
}

@end
