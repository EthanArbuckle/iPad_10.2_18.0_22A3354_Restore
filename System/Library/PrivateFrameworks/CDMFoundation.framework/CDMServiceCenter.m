@implementation CDMServiceCenter

- (void)setSystemState:(int64_t)a3
{
  self->_systemState = a3;
}

- (CDMServiceCenter)initWithConfig:(id)a3
{
  NSObject *v5;
  NSObject *v6;
  NSObject *v7;
  CDMDynamicConfig *v8;
  void *v9;
  CDMDynamicConfig *v10;
  CDMDynamicConfig *currentConfig;
  NSMutableDictionary *v12;
  NSMutableDictionary *commandServicesDict;
  CDMServiceGraphRunner *v14;
  CDMServiceGraphRunner *serviceGraphRunner;
  NSObject *v16;
  NSObject *v17;
  OS_dispatch_queue *v18;
  OS_dispatch_queue *cdmServiceCenterQueue;
  CDMComposerService *v20;
  CDMComposerService *composerService;
  void *v22;
  uint64_t i;
  void *v24;
  void *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t j;
  uint64_t v29;
  void *v30;
  _BOOL4 v31;
  void *v32;
  void *v33;
  void *v34;
  NSArray *v35;
  NSArray *foundationServices;
  NSArray *v37;
  NSArray *dagServices;
  NSArray *v39;
  NSArray *services;
  NSArray *v41;
  NSArray *enabledDAGServiceNames;
  NSArray *v43;
  NSArray *graphServices;
  void *v45;
  id defaultCallback;
  NSObject *v47;
  NSObject *v48;
  NSObject *v49;
  NSObject *v50;
  CDMServiceCenter *result;
  unint64_t v52;
  NSObject *v53;
  os_signpost_id_t spid;
  id v55;
  id obj;
  uint64_t v57;
  uint64_t v58;
  uint8_t v59[8];
  _QWORD aBlock[4];
  id v61;
  id buf[2];
  __int128 v63;
  __int128 v64;
  __int128 v65;
  __int128 v66;
  __int128 v67;
  __int128 v68;
  __int128 v69;
  __int128 v70;
  _BYTE v71[128];
  _BYTE v72[128];
  uint64_t v73;

  v73 = *MEMORY[0x24BDAC8D0];
  v55 = a3;
  CDMOSLoggerForCategory(4);
  v5 = objc_claimAutoreleasedReturnValue();
  spid = os_signpost_id_generate(v5);

  CDMOSLoggerForCategory(4);
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = v6;
  v52 = spid - 1;
  if (spid - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v6))
  {
    LOWORD(buf[0]) = 0;
    _os_signpost_emit_with_name_impl(&dword_21A2A0000, v7, OS_SIGNPOST_INTERVAL_BEGIN, spid, "CDMServiceCenterSetup", "CDM Service Center Setup enableTelemetry=YES", (uint8_t *)buf, 2u);
  }

  if (+[CDMServiceCenterUtils isServiceCenterEnabled:](CDMServiceCenterUtils, "isServiceCenterEnabled:", v55))
  {
    objc_storeStrong((id *)&self->_config, a3);
    v8 = [CDMDynamicConfig alloc];
    objc_msgSend(v55, "defaultLocaleIdentifier");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = -[CDMDynamicConfig initWithLanguageCode:](v8, "initWithLanguageCode:", v9);
    currentConfig = self->_currentConfig;
    self->_currentConfig = v10;

    objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
    v12 = (NSMutableDictionary *)objc_claimAutoreleasedReturnValue();
    commandServicesDict = self->_commandServicesDict;
    self->_commandServicesDict = v12;

    v14 = -[CDMServiceGraphRunner initWithMaxConcurrentCount:]([CDMServiceGraphRunner alloc], "initWithMaxConcurrentCount:", -[CDMConfig maxConcurrentCount](self->_config, "maxConcurrentCount"));
    serviceGraphRunner = self->_serviceGraphRunner;
    self->_serviceGraphRunner = v14;

    -[CDMServiceCenter addObserver:forKeyPath:options:context:](self, "addObserver:forKeyPath:options:context:", self->_serviceGraphRunner, CFSTR("systemState"), 0, 0);
    dispatch_queue_attr_make_with_autorelease_frequency(MEMORY[0x24BDAC9C0], DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v16 = objc_claimAutoreleasedReturnValue();
    dispatch_queue_attr_make_with_qos_class(v16, (dispatch_qos_class_t)+[CDMServiceCenterUtils getServiceCenterQueueQOS](CDMServiceCenterUtils, "getServiceCenterQueueQOS"), 0);
    v17 = objc_claimAutoreleasedReturnValue();
    v18 = (OS_dispatch_queue *)dispatch_queue_create("com.apple.siri.cdm.CDMServiceCenter", v17);
    cdmServiceCenterQueue = self->_cdmServiceCenterQueue;
    self->_cdmServiceCenterQueue = v18;

    +[CDMServiceCenterUtils tryInitDAGServices:](CDMServiceCenterUtils, "tryInitDAGServices:", v55);
    v53 = objc_claimAutoreleasedReturnValue();
    v20 = -[CDMComposerService initWithConfig:]([CDMComposerService alloc], "initWithConfig:", self->_config);
    composerService = self->_composerService;
    self->_composerService = v20;

    objc_msgSend(MEMORY[0x24BDBCEB8], "arrayWithCapacity:", -[NSObject count](v53, "count") + 1);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "addObjectsFromArray:", v53);
    objc_msgSend(v22, "addObject:", self->_composerService);
    v69 = 0u;
    v70 = 0u;
    v67 = 0u;
    v68 = 0u;
    obj = v22;
    v58 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v67, v72, 16);
    if (v58)
    {
      v57 = *(_QWORD *)v68;
      do
      {
        for (i = 0; i != v58; ++i)
        {
          if (*(_QWORD *)v68 != v57)
            objc_enumerationMutation(obj);
          v24 = *(void **)(*((_QWORD *)&v67 + 1) + 8 * i);
          objc_msgSend(v24, "addObserver:", self);
          v65 = 0u;
          v66 = 0u;
          v63 = 0u;
          v64 = 0u;
          objc_msgSend(v24, "supportedCommands");
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          v26 = objc_msgSend(v25, "countByEnumeratingWithState:objects:count:", &v63, v71, 16);
          if (v26)
          {
            v27 = *(_QWORD *)v64;
            do
            {
              for (j = 0; j != v26; ++j)
              {
                if (*(_QWORD *)v64 != v27)
                  objc_enumerationMutation(v25);
                v29 = *(_QWORD *)(*((_QWORD *)&v63 + 1) + 8 * j);
                -[NSMutableDictionary objectForKeyedSubscript:](self->_commandServicesDict, "objectForKeyedSubscript:", v29);
                v30 = (void *)objc_claimAutoreleasedReturnValue();
                v31 = v30 == 0;

                if (v31)
                {
                  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
                  v32 = (void *)objc_claimAutoreleasedReturnValue();
                  -[NSMutableDictionary setObject:forKeyedSubscript:](self->_commandServicesDict, "setObject:forKeyedSubscript:", v32, v29);

                }
                -[NSMutableDictionary objectForKeyedSubscript:](self->_commandServicesDict, "objectForKeyedSubscript:", v29);
                v33 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v33, "addObject:", v24);

              }
              v26 = objc_msgSend(v25, "countByEnumeratingWithState:objects:count:", &v63, v71, 16);
            }
            while (v26);
          }

        }
        v58 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v67, v72, 16);
      }
      while (v58);
    }

    +[CDMServiceCenterUtils tryInitGraphServices:](CDMServiceCenterUtils, "tryInitGraphServices:", v55);
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObject:", self->_composerService);
    v35 = (NSArray *)objc_claimAutoreleasedReturnValue();
    foundationServices = self->_foundationServices;
    self->_foundationServices = v35;

    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithArray:", v53);
    v37 = (NSArray *)objc_claimAutoreleasedReturnValue();
    dagServices = self->_dagServices;
    self->_dagServices = v37;

    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithArray:", obj);
    v39 = (NSArray *)objc_claimAutoreleasedReturnValue();
    services = self->_services;
    self->_services = v39;

    -[CDMServiceCenter extractEnabledServiceNames:](self, "extractEnabledServiceNames:", self->_dagServices);
    v41 = (NSArray *)objc_claimAutoreleasedReturnValue();
    enabledDAGServiceNames = self->_enabledDAGServiceNames;
    self->_enabledDAGServiceNames = v41;

    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithArray:", v34);
    v43 = (NSArray *)objc_claimAutoreleasedReturnValue();
    graphServices = self->_graphServices;
    self->_graphServices = v43;

    -[CDMComposerService updateServices:](self->_composerService, "updateServices:", self->_dagServices);
    -[CDMComposerService updateServiceGraphRunner:](self->_composerService, "updateServiceGraphRunner:", self->_serviceGraphRunner);
    -[CDMComposerService updateGraphServices:](self->_composerService, "updateGraphServices:", self->_graphServices);
    objc_initWeak(buf, self);
    aBlock[0] = MEMORY[0x24BDAC760];
    aBlock[1] = 3221225472;
    aBlock[2] = __35__CDMServiceCenter_initWithConfig___block_invoke;
    aBlock[3] = &unk_24DCAB330;
    objc_copyWeak(&v61, buf);
    v45 = _Block_copy(aBlock);
    defaultCallback = self->_defaultCallback;
    self->_defaultCallback = v45;

    -[CDMServiceCenter setSystemState:](self, "setSystemState:", 1);
    CDMOSLoggerForCategory(4);
    v47 = objc_claimAutoreleasedReturnValue();
    v48 = v47;
    if (v52 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v47))
    {
      *(_WORD *)v59 = 0;
      _os_signpost_emit_with_name_impl(&dword_21A2A0000, v48, OS_SIGNPOST_INTERVAL_END, spid, "CDMServiceCenterSetup", " enableTelemetry=YES ", v59, 2u);
    }

    objc_destroyWeak(&v61);
    objc_destroyWeak(buf);

    v49 = v53;
  }
  else
  {
    CDMOSLoggerForCategory(4);
    v50 = objc_claimAutoreleasedReturnValue();
    if (v52 >= 0xFFFFFFFFFFFFFFFELL)
    {
      v49 = v50;
    }
    else
    {
      v49 = v50;
      if (os_signpost_enabled(v50))
      {
        LOWORD(buf[0]) = 0;
        _os_signpost_emit_with_name_impl(&dword_21A2A0000, v49, OS_SIGNPOST_INTERVAL_END, spid, "CDMServiceCenterSetup", " enableTelemetry=YES ", (uint8_t *)buf, 2u);
      }
    }
  }

  return result;
}

- (int64_t)systemState
{
  return self->_systemState;
}

- (id)extractEnabledServiceNames:(id)a3
{
  id v3;
  void *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  objc_class *v10;
  void *v11;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  v3 = a3;
  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCEB8]), "initWithCapacity:", objc_msgSend(v3, "count"));
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v5 = v3;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v14;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v14 != v8)
          objc_enumerationMutation(v5);
        if (objc_msgSend((id)objc_opt_class(), "isEnabled", v13))
        {
          v10 = (objc_class *)objc_opt_class();
          NSStringFromClass(v10);
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v4, "addObject:", v11);

        }
        ++v9;
      }
      while (v7 != v9);
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v7);
  }

  return v4;
}

uint64_t __46__CDMServiceCenter_handleCommand_forCallback___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "handleSetup:forCallback:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
}

- (id)getEnabledDAGServiceNamesForGraph:(id)a3
{
  void *v4;
  void *v5;
  NSArray *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  uint64_t v11;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  -[objc_class requiredDAGServices](NSClassFromString((NSString *)a3), "requiredDAGServices");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCEB8]), "initWithCapacity:", -[NSArray count](self->_enabledDAGServiceNames, "count"));
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v6 = self->_enabledDAGServiceNames;
  v7 = -[NSArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v14;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v14 != v9)
          objc_enumerationMutation(v6);
        v11 = *(_QWORD *)(*((_QWORD *)&v13 + 1) + 8 * i);
        if (objc_msgSend(v4, "containsObject:", v11, (_QWORD)v13))
          objc_msgSend(v5, "addObject:", v11);
      }
      v8 = -[NSArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v8);
  }

  return v5;
}

- (void)handleSetup:(id)a3 forCallback:(id)a4
{
  unint64_t k;
  NSObject *v7;
  NSObject *v8;
  os_signpost_id_t v9;
  NSObject *v10;
  NSObject *v11;
  void *v12;
  NSObject *v13;
  void *v14;
  NSString *v15;
  Class v16;
  void *v17;
  NSArray *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t i;
  uint64_t v22;
  objc_class *v23;
  void *v24;
  NSArray *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t j;
  uint64_t v29;
  NSMutableDictionary *commandServicesDict;
  void *v31;
  void *v32;
  NSString *v33;
  void *v34;
  NSArray *v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  NSString *v39;
  int v40;
  NSObject *v41;
  NSObject *v42;
  void *v43;
  void *v44;
  _BOOL4 v45;
  NSObject *v46;
  NSObject *v47;
  NSObject *v48;
  NSObject *v49;
  id v50;
  void *v51;
  NSObject *v52;
  NSObject *v53;
  NSObject *v54;
  void *v55;
  void *v56;
  void *v57;
  NSObject *v58;
  const char *v59;
  NSObject *cdmServiceCenterQueue;
  dispatch_block_t v61;
  void *v62;
  void *v63;
  void *v64;
  void *v65;
  NSObject *v66;
  NSObject *v67;
  NSObject *v68;
  NSObject *v69;
  NSObject *v70;
  void *v71;
  void *v72;
  void *v73;
  CDMSetupRequestCommand *v74;
  CDMWarmupRequestCommand *v75;
  NSObject *v76;
  void *v77;
  uint64_t v78;
  uint64_t v79;
  uint64_t m;
  void *v81;
  void *v82;
  void *v83;
  id v84;
  void *v85;
  uint64_t v86;
  NSObject *v87;
  id v88;
  void *v89;
  void *v90;
  id v91;
  uint64_t v92;
  uint64_t v93;
  uint64_t n;
  uint64_t v95;
  dispatch_block_t v96;
  void *v97;
  uint64_t v98;
  char v99;
  uint64_t v100;
  uint64_t ii;
  uint64_t v102;
  void *v103;
  void *v104;
  void *v105;
  const __CFString *v106;
  void *v107;
  NSObject *v108;
  NSObject *v109;
  NSObject *v110;
  NSObject *v111;
  NSObject *v112;
  void *v113;
  void *v114;
  void *v115;
  NSObject *v116;
  NSObject *v117;
  NSObject *v118;
  NSObject *v119;
  dispatch_block_t v120;
  NSObject *v121;
  int v122;
  OS_os_transaction *v123;
  OS_os_transaction *transaction;
  int v125;
  void *v126;
  NSObject *v127;
  void *v128;
  void *v129;
  void *v130;
  void *v131;
  NSObject *v132;
  void *v133;
  void *v134;
  void *v135;
  id v136;
  int v137;
  unint64_t v138;
  void *v139;
  os_signpost_id_t spid;
  void (**v141)(id, _QWORD, void *);
  void *v142;
  id obj;
  id obja;
  id objb;
  void *v146;
  NSObject *group;
  CDMSetupRequestCommand *v148;
  void *v149;
  void *v150;
  void *v151;
  id v152;
  void *v153;
  _QWORD v154[4];
  id v155;
  NSObject *v156;
  _BYTE *v157;
  _QWORD v158[5];
  NSObject *v159;
  __int128 *v160;
  _QWORD v161[6];
  __int128 v162;
  __int128 v163;
  __int128 v164;
  __int128 v165;
  _QWORD v166[5];
  CDMSetupRequestCommand *v167;
  NSObject *v168;
  id v169;
  __int128 *v170;
  __int128 v171;
  __int128 v172;
  __int128 v173;
  __int128 v174;
  __int128 v175;
  __int128 v176;
  __int128 v177;
  __int128 v178;
  _QWORD v179[5];
  id v180;
  __int128 *v181;
  _BYTE *v182;
  _QWORD *v183;
  char v184;
  _QWORD aBlock[6];
  _QWORD v186[5];
  CDMWarmupRequestCommand *v187;
  id v188;
  _QWORD block[5];
  id v190;
  __int128 *v191;
  __int128 *p_buf;
  uint64_t *v193;
  uint64_t v194;
  uint64_t *v195;
  uint64_t v196;
  uint64_t (*v197)(uint64_t, uint64_t);
  void (*v198)(uint64_t);
  id v199;
  __int128 v200;
  __int128 v201;
  __int128 v202;
  __int128 v203;
  __int128 v204;
  __int128 v205;
  __int128 v206;
  __int128 v207;
  __int128 v208;
  __int128 v209;
  __int128 v210;
  __int128 v211;
  uint64_t v212;
  void *v213;
  uint64_t v214;
  void *v215;
  uint8_t v216[4];
  const char *v217;
  __int16 v218;
  void *v219;
  _BYTE v220[24];
  char v221;
  _BYTE v222[128];
  _BYTE v223[128];
  uint8_t v224[128];
  __int128 v225;
  uint64_t v226;
  uint64_t (*v227)(uint64_t, uint64_t);
  void (*v228)(uint64_t);
  id v229;
  _BYTE v230[24];
  uint64_t (*v231)(uint64_t, uint64_t);
  void (*v232)(uint64_t);
  id v233;
  uint64_t v234;
  const __CFString *v235;
  uint64_t v236;
  const __CFString *v237;
  uint64_t v238;
  void *v239;
  __int128 v240;
  uint64_t v241;
  uint64_t (*v242)(uint64_t, uint64_t);
  void (*v243)(uint64_t);
  id v244;
  __int128 buf;
  uint64_t v246;
  uint64_t (*v247)(uint64_t, uint64_t);
  void (*v248)(uint64_t);
  id v249;
  _BYTE v250[128];
  _BYTE v251[128];
  _BYTE v252[128];
  uint64_t v253;

  v253 = *MEMORY[0x24BDAC8D0];
  v152 = a3;
  v141 = (void (**)(id, _QWORD, void *))a4;
  CDMOSLoggerForCategory(4);
  v7 = objc_claimAutoreleasedReturnValue();
  spid = os_signpost_id_generate(v7);

  CDMOSLoggerForCategory(4);
  v8 = objc_claimAutoreleasedReturnValue();
  v9 = os_signpost_id_generate(v8);

  CDMOSLoggerForCategory(4);
  v10 = objc_claimAutoreleasedReturnValue();
  v11 = v10;
  v138 = spid - 1;
  if (spid - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
  {
    LOWORD(buf) = 0;
    _os_signpost_emit_with_name_impl(&dword_21A2A0000, v11, OS_SIGNPOST_INTERVAL_BEGIN, spid, "CDMServicesSetup", "CDM Services Setup enableTelemetry=YES", (uint8_t *)&buf, 2u);
  }

  -[CDMServiceCenter setSystemState:](self, "setSystemState:", 2);
  objc_msgSend(v152, "dynamicConfig");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[CDMServiceCenter mergeConfig:](self, "mergeConfig:", v12);

  CDMOSLoggerForCategory(3);
  v13 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
  {
    LODWORD(buf) = 136315138;
    *(_QWORD *)((char *)&buf + 4) = "-[CDMServiceCenter handleSetup:forCallback:]";
    _os_log_impl(&dword_21A2A0000, v13, OS_LOG_TYPE_INFO, "%s CDM setup started", (uint8_t *)&buf, 0xCu);
  }

  -[CDMServiceCenter readThermalState](self, "readThermalState");
  -[CDMServiceCenter readMemoryPressure](self, "readMemoryPressure");
  v153 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCEB8]), "initWithCapacity:", -[NSArray count](self->_dagServices, "count"));
  -[CDMDynamicConfig graphName](self->_currentConfig, "graphName");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[CDMServiceCenter getEnabledDAGServiceNamesForGraph:](self, "getEnabledDAGServiceNamesForGraph:", v14);
  v151 = (void *)objc_claimAutoreleasedReturnValue();

  -[CDMDynamicConfig graphName](self->_currentConfig, "graphName");
  v15 = (NSString *)objc_claimAutoreleasedReturnValue();
  v16 = NSClassFromString(v15);
  -[CDMDynamicConfig languageCode](self->_currentConfig, "languageCode");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  -[objc_class getAssetsForSetup:](v16, "getAssetsForSetup:", v17);
  v139 = (void *)objc_claimAutoreleasedReturnValue();

  v211 = 0u;
  v210 = 0u;
  v209 = 0u;
  v208 = 0u;
  v18 = self->_dagServices;
  v19 = -[NSArray countByEnumeratingWithState:objects:count:](v18, "countByEnumeratingWithState:objects:count:", &v208, v252, 16);
  if (v19)
  {
    v20 = *(_QWORD *)v209;
    do
    {
      for (i = 0; i != v19; ++i)
      {
        if (*(_QWORD *)v209 != v20)
          objc_enumerationMutation(v18);
        v22 = *(_QWORD *)(*((_QWORD *)&v208 + 1) + 8 * i);
        v23 = (objc_class *)objc_opt_class();
        NSStringFromClass(v23);
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        k = objc_msgSend(v151, "containsObject:", v24);

        if ((_DWORD)k)
          objc_msgSend(v153, "addObject:", v22);
      }
      v19 = -[NSArray countByEnumeratingWithState:objects:count:](v18, "countByEnumeratingWithState:objects:count:", &v208, v252, 16);
    }
    while (v19);
  }

  v206 = 0u;
  v207 = 0u;
  v204 = 0u;
  v205 = 0u;
  v25 = self->_foundationServices;
  v26 = -[NSArray countByEnumeratingWithState:objects:count:](v25, "countByEnumeratingWithState:objects:count:", &v204, v251, 16);
  if (v26)
  {
    v27 = *(_QWORD *)v205;
    do
    {
      for (j = 0; j != v26; ++j)
      {
        if (*(_QWORD *)v205 != v27)
          objc_enumerationMutation(v25);
        v29 = *(_QWORD *)(*((_QWORD *)&v204 + 1) + 8 * j);
        commandServicesDict = self->_commandServicesDict;
        objc_msgSend(v152, "commandName");
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        -[NSMutableDictionary objectForKeyedSubscript:](commandServicesDict, "objectForKeyedSubscript:", v31);
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        k = objc_msgSend(v32, "containsObject:", v29);

        if ((_DWORD)k)
          objc_msgSend(v153, "addObject:", v29);
      }
      v26 = -[NSArray countByEnumeratingWithState:objects:count:](v25, "countByEnumeratingWithState:objects:count:", &v204, v251, 16);
    }
    while (v26);
  }

  v149 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCEB8]), "initWithCapacity:", -[NSArray count](self->_graphServices, "count"));
  -[CDMDynamicConfig graphName](self->_currentConfig, "graphName");
  v33 = (NSString *)objc_claimAutoreleasedReturnValue();
  -[objc_class requiredCDMGraphServices](NSClassFromString(v33), "requiredCDMGraphServices");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v34, "allObjects");
  v150 = (void *)objc_claimAutoreleasedReturnValue();

  v202 = 0u;
  v203 = 0u;
  v200 = 0u;
  v201 = 0u;
  v35 = self->_graphServices;
  v36 = -[NSArray countByEnumeratingWithState:objects:count:](v35, "countByEnumeratingWithState:objects:count:", &v200, v250, 16);
  if (v36)
  {
    v37 = *(_QWORD *)v201;
    do
    {
      for (k = 0; k != v36; ++k)
      {
        if (*(_QWORD *)v201 != v37)
          objc_enumerationMutation(v35);
        v38 = *(_QWORD *)(*((_QWORD *)&v200 + 1) + 8 * k);
        if (objc_msgSend(v150, "containsObject:", objc_opt_class()))
          objc_msgSend(v149, "addObject:", v38);
      }
      v36 = -[NSArray countByEnumeratingWithState:objects:count:](v35, "countByEnumeratingWithState:objects:count:", &v200, v250, 16);
    }
    while (v36);
  }

  *(_QWORD *)&buf = 0;
  *((_QWORD *)&buf + 1) = &buf;
  v246 = 0x3032000000;
  v247 = __Block_byref_object_copy_;
  v248 = __Block_byref_object_dispose_;
  objc_msgSend(v152, "selfMetadata");
  v249 = (id)objc_claimAutoreleasedReturnValue();
  v194 = 0;
  v195 = &v194;
  v196 = 0x3032000000;
  v197 = __Block_byref_object_copy_;
  v198 = __Block_byref_object_dispose_;
  objc_msgSend(v152, "dataDispatcherContext");
  v199 = (id)objc_claimAutoreleasedReturnValue();
  -[CDMDynamicConfig graphName](self->_currentConfig, "graphName");
  v39 = (NSString *)objc_claimAutoreleasedReturnValue();
  v40 = -[objc_class requiresAssets](NSClassFromString(v39), "requiresAssets");

  if (!v40)
  {
    CDMOSLoggerForCategory(3);
    v46 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v46, OS_LOG_TYPE_DEBUG))
    {
      LODWORD(v240) = 136315138;
      *(_QWORD *)((char *)&v240 + 4) = "-[CDMServiceCenter handleSetup:forCallback:]";
      _os_log_debug_impl(&dword_21A2A0000, v46, OS_LOG_TYPE_DEBUG, "%s Assets paths have been provided in CDMDynamicConfig. Skip calling setupAssets.", (uint8_t *)&v240, 0xCu);
    }
    goto LABEL_43;
  }
  CDMOSLoggerForCategory(4);
  v41 = objc_claimAutoreleasedReturnValue();
  v42 = v41;
  k = v9 - 1;
  if (v9 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v41))
  {
    LOWORD(v240) = 0;
    _os_signpost_emit_with_name_impl(&dword_21A2A0000, v42, OS_SIGNPOST_INTERVAL_BEGIN, v9, "CDMServiceCenterAssetsSetup", "CDM Service Center Assets Setup enableTelemetry=YES", (uint8_t *)&v240, 2u);
  }

  objc_msgSend(v152, "dynamicConfig");
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v43, "assetPaths");
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  v45 = v44 == 0;

  if (!v45)
  {
    CDMOSLoggerForCategory(3);
    v46 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v46, OS_LOG_TYPE_DEBUG))
    {
      LODWORD(v240) = 136315138;
      *(_QWORD *)((char *)&v240 + 4) = "-[CDMServiceCenter handleSetup:forCallback:]";
      _os_log_debug_impl(&dword_21A2A0000, v46, OS_LOG_TYPE_DEBUG, "%s Assets paths have been provided in CDMDynamicConfig. Skip calling setupAssets.", (uint8_t *)&v240, 0xCu);
    }
LABEL_43:

    goto LABEL_44;
  }
  *(_QWORD *)&v240 = 0;
  *((_QWORD *)&v240 + 1) = &v240;
  v241 = 0x3032000000;
  v242 = __Block_byref_object_copy_;
  v243 = __Block_byref_object_dispose_;
  v244 = 0;
  cdmServiceCenterQueue = self->_cdmServiceCenterQueue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __44__CDMServiceCenter_handleSetup_forCallback___block_invoke;
  block[3] = &unk_24DCAB3D0;
  block[4] = self;
  v190 = v139;
  v191 = &v240;
  p_buf = &buf;
  v193 = &v194;
  v61 = dispatch_block_create_with_qos_class(DISPATCH_BLOCK_ENFORCE_QOS_CLASS, QOS_CLASS_USER_INITIATED, 0, block);
  dispatch_sync(cdmServiceCenterQueue, v61);

  if (!*(_QWORD *)(*((_QWORD *)&v240 + 1) + 40))
  {

    _Block_object_dispose(&v240, 8);
LABEL_44:
    CDMOSLoggerForCategory(3);
    v47 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v47, OS_LOG_TYPE_INFO))
    {
      LODWORD(v240) = 136315138;
      *(_QWORD *)((char *)&v240 + 4) = "-[CDMServiceCenter handleSetup:forCallback:]";
      _os_log_impl(&dword_21A2A0000, v47, OS_LOG_TYPE_INFO, "%s [insights-cdm-assets]:\nAssets setup successfully!", (uint8_t *)&v240, 0xCu);
    }

    CDMOSLoggerForCategory(4);
    v48 = objc_claimAutoreleasedReturnValue();
    v49 = v48;
    if (v9 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v48))
    {
      LOWORD(v240) = 0;
      _os_signpost_emit_with_name_impl(&dword_21A2A0000, v49, OS_SIGNPOST_INTERVAL_END, v9, "CDMServiceCenterAssetsSetup", " enableTelemetry=YES ", (uint8_t *)&v240, 2u);
    }

    if (+[CDMServiceCenterUtils needEmbeddingConfigsFor:](CDMServiceCenterUtils, "needEmbeddingConfigsFor:", v153))
    {
      v188 = 0;
      -[CDMServiceCenter setupEmbeddingConfigsWithError:](self, "setupEmbeddingConfigsWithError:", &v188);
      v50 = v188;
      if (v50)
      {
        v51 = v50;
        CDMOSLoggerForCategory(3);
        v52 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v52, OS_LOG_TYPE_ERROR))
        {
          LODWORD(v240) = 136315138;
          *(_QWORD *)((char *)&v240 + 4) = "-[CDMServiceCenter handleSetup:forCallback:]";
          _os_log_error_impl(&dword_21A2A0000, v52, OS_LOG_TYPE_ERROR, "%s [ERR]: [insights-cdm-assets]:\nFailed to setup CDM embedding configs!", (uint8_t *)&v240, 0xCu);
        }

        CDMOSLoggerForCategory(4);
        v53 = objc_claimAutoreleasedReturnValue();
        v54 = v53;
        if (v138 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v53))
        {
          LOWORD(v240) = 0;
          _os_signpost_emit_with_name_impl(&dword_21A2A0000, v54, OS_SIGNPOST_INTERVAL_END, spid, "CDMServicesSetup", " enableTelemetry=YES ", (uint8_t *)&v240, 2u);
        }

        if (v141)
        {
          v55 = (void *)MEMORY[0x24BDD1540];
          v236 = *MEMORY[0x24BDD0FC8];
          v237 = CFSTR("Failed to setup CDM embedding configs!");
          objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v237, &v236, 1);
          v56 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v55, "errorWithDomain:code:userInfo:", CFSTR("CDMServiceCenter"), 2, v56);
          v57 = (void *)objc_claimAutoreleasedReturnValue();

          v141[2](v141, 0, v57);
        }

        goto LABEL_147;
      }
      CDMOSLoggerForCategory(3);
      v58 = objc_claimAutoreleasedReturnValue();
      if (!os_log_type_enabled(v58, OS_LOG_TYPE_INFO))
        goto LABEL_76;
      LODWORD(v240) = 136315138;
      *(_QWORD *)((char *)&v240 + 4) = "-[CDMServiceCenter handleSetup:forCallback:]";
      v59 = "%s [insights-cdm-assets]:\nCDM embedding configs setup successfully!";
    }
    else
    {
      CDMOSLoggerForCategory(3);
      v58 = objc_claimAutoreleasedReturnValue();
      if (!os_log_type_enabled(v58, OS_LOG_TYPE_INFO))
        goto LABEL_76;
      LODWORD(v240) = 136315138;
      *(_QWORD *)((char *)&v240 + 4) = "-[CDMServiceCenter handleSetup:forCallback:]";
      v59 = "%s Skipping embeddings config; no embedding service.";
    }
    _os_log_impl(&dword_21A2A0000, v58, OS_LOG_TYPE_INFO, v59, (uint8_t *)&v240, 0xCu);
LABEL_76:

    v74 = [CDMSetupRequestCommand alloc];
    v148 = -[CDMSetupRequestCommand initWithDynamicConfig:selfMetadata:dataDispatcherContext:](v74, "initWithDynamicConfig:selfMetadata:dataDispatcherContext:", self->_currentConfig, *(_QWORD *)(*((_QWORD *)&buf + 1) + 40), v195[5]);
    if (v153 && objc_msgSend(v153, "count"))
    {
      *(_QWORD *)&v240 = 0;
      *((_QWORD *)&v240 + 1) = &v240;
      v241 = 0x3032000000;
      v242 = __Block_byref_object_copy_;
      v243 = __Block_byref_object_dispose_;
      objc_msgSend(MEMORY[0x24BDBCED8], "dictionaryWithCapacity:", objc_msgSend(v153, "count"));
      v244 = (id)objc_claimAutoreleasedReturnValue();
      *(_QWORD *)v230 = 0;
      *(_QWORD *)&v230[8] = v230;
      *(_QWORD *)&v230[16] = 0x3032000000;
      v231 = __Block_byref_object_copy_;
      v232 = __Block_byref_object_dispose_;
      objc_msgSend(MEMORY[0x24BDBCED8], "dictionaryWithCapacity:", objc_msgSend(v153, "count"));
      v233 = (id)objc_claimAutoreleasedReturnValue();
      v186[0] = 0;
      v186[1] = v186;
      v186[2] = 0x3032000000;
      v186[3] = __Block_byref_object_copy_;
      v186[4] = __Block_byref_object_dispose_;
      v75 = [CDMWarmupRequestCommand alloc];
      v187 = -[CDMWarmupRequestCommand initWithDynamicConfig:selfMetadata:](v75, "initWithDynamicConfig:selfMetadata:", self->_currentConfig, *(_QWORD *)(*((_QWORD *)&buf + 1) + 40));
      v137 = objc_msgSend(v152, "shouldPerformWarmup");
      if ((v137 & 1) == 0)
      {
        CDMOSLoggerForCategory(3);
        v76 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v76, OS_LOG_TYPE_DEBUG))
        {
          LODWORD(v225) = 136315138;
          *(_QWORD *)((char *)&v225 + 4) = "-[CDMServiceCenter handleSetup:forCallback:]";
          _os_log_debug_impl(&dword_21A2A0000, v76, OS_LOG_TYPE_DEBUG, "%s Not performing warmup as part of setup", (uint8_t *)&v225, 0xCu);
        }

      }
      aBlock[0] = MEMORY[0x24BDAC760];
      aBlock[1] = 3221225472;
      aBlock[2] = __44__CDMServiceCenter_handleSetup_forCallback___block_invoke_365;
      aBlock[3] = &unk_24DCAB3F8;
      aBlock[4] = &v240;
      aBlock[5] = v230;
      v77 = _Block_copy(aBlock);
      v179[0] = MEMORY[0x24BDAC760];
      v179[1] = 3221225472;
      v179[2] = __44__CDMServiceCenter_handleSetup_forCallback___block_invoke_2;
      v179[3] = &unk_24DCAB448;
      v184 = v137;
      v181 = &v240;
      v179[4] = self;
      v182 = v230;
      v183 = v186;
      v136 = v77;
      v180 = v136;
      v146 = _Block_copy(v179);
      +[CDMSELFLogUtil cdmAllServicesSetupStarted:logMessage:dataDispatcherContext:](CDMSELFLogUtil, "cdmAllServicesSetupStarted:logMessage:dataDispatcherContext:", *(_QWORD *)(*((_QWORD *)&buf + 1) + 40), CFSTR("SELF all services setup started message emitted"), v195[5]);
      if (v137)
        +[CDMSELFLogUtil cdmAllServicesWarmupStarted:logMessage:dataDispatcherContext:](CDMSELFLogUtil, "cdmAllServicesWarmupStarted:logMessage:dataDispatcherContext:", *(_QWORD *)(*((_QWORD *)&buf + 1) + 40), CFSTR("SELF all services warmup started message emitted"), v195[5]);
      *(_QWORD *)&v225 = 0;
      *((_QWORD *)&v225 + 1) = &v225;
      v226 = 0x3032000000;
      v227 = __Block_byref_object_copy_;
      v228 = __Block_byref_object_dispose_;
      v229 = (id)objc_msgSend(objc_alloc(MEMORY[0x24BDBCED8]), "initWithCapacity:", objc_msgSend(v153, "count"));
      v175 = 0u;
      v176 = 0u;
      v177 = 0u;
      v178 = 0u;
      obj = v153;
      v78 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v175, v224, 16);
      if (v78)
      {
        v79 = *(_QWORD *)v176;
        do
        {
          for (m = 0; m != v78; ++m)
          {
            if (*(_QWORD *)v176 != v79)
              objc_enumerationMutation(obj);
            k = *(_QWORD *)(*((_QWORD *)&v175 + 1) + 8 * m);
            v81 = *(void **)(*((_QWORD *)&v240 + 1) + 40);
            objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", objc_msgSend((id)k, "serviceState"));
            v82 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend((id)k, "serviceName");
            v83 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v81, "setObject:forKey:", v82, v83);

            v84 = objc_alloc_init(MEMORY[0x24BE95428]);
            objc_msgSend((id)k, "serviceName");
            v85 = (void *)objc_claimAutoreleasedReturnValue();
            v86 = +[CDMSELFLogUtil stringServiceTypeToEnum:](CDMSELFLogUtil, "stringServiceTypeToEnum:", v85);

            if (!(_DWORD)v86)
            {
              CDMOSLoggerForCategory(3);
              v87 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v87, OS_LOG_TYPE_INFO))
              {
                objc_msgSend((id)k, "serviceName");
                v88 = (id)objc_claimAutoreleasedReturnValue();
                *(_DWORD *)v220 = 136315394;
                *(_QWORD *)&v220[4] = "-[CDMServiceCenter handleSetup:forCallback:]";
                *(_WORD *)&v220[12] = 2114;
                *(_QWORD *)&v220[14] = v88;
                _os_log_impl(&dword_21A2A0000, v87, OS_LOG_TYPE_INFO, "%s [WARN]: Unmapped CDM service type name for setup: %{public}@", v220, 0x16u);

              }
            }
            objc_msgSend(v84, "setServiceType:", v86);
            v89 = *(void **)(*((_QWORD *)&v225 + 1) + 40);
            objc_msgSend((id)k, "serviceName");
            v90 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v89, "setObject:forKey:", v84, v90);

          }
          v78 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v175, v224, 16);
        }
        while (v78);
      }

      v91 = objc_alloc(MEMORY[0x24BDBCEB8]);
      v142 = (void *)objc_msgSend(v91, "initWithCapacity:", objc_msgSend(*(id *)(*((_QWORD *)&v240 + 1) + 40), "count"));
      objc_msgSend(*(id *)(*(_QWORD *)&v230[8] + 40), "removeAllObjects");
      group = dispatch_group_create();
      v171 = 0u;
      v172 = 0u;
      v173 = 0u;
      v174 = 0u;
      obja = obj;
      v92 = objc_msgSend(obja, "countByEnumeratingWithState:objects:count:", &v171, v223, 16);
      if (v92)
      {
        v93 = *(_QWORD *)v172;
        k = (unint64_t)__44__CDMServiceCenter_handleSetup_forCallback___block_invoke_371;
        do
        {
          for (n = 0; n != v92; ++n)
          {
            if (*(_QWORD *)v172 != v93)
              objc_enumerationMutation(obja);
            v95 = *(_QWORD *)(*((_QWORD *)&v171 + 1) + 8 * n);
            dispatch_group_enter(group);
            v166[0] = MEMORY[0x24BDAC760];
            v166[1] = 3221225472;
            v166[2] = __44__CDMServiceCenter_handleSetup_forCallback___block_invoke_371;
            v166[3] = &unk_24DCAB470;
            v166[4] = v95;
            v170 = &v225;
            v167 = v148;
            v169 = v146;
            v168 = group;
            v96 = dispatch_block_create((dispatch_block_flags_t)0, v166);
            dispatch_async((dispatch_queue_t)self->_cdmServiceCenterQueue, v96);

          }
          v92 = objc_msgSend(obja, "countByEnumeratingWithState:objects:count:", &v171, v223, 16);
        }
        while (v92);
      }

      dispatch_group_wait(group, 0xFFFFFFFFFFFFFFFFLL);
      v164 = 0u;
      v165 = 0u;
      v162 = 0u;
      v163 = 0u;
      objc_msgSend(*(id *)(*((_QWORD *)&v240 + 1) + 40), "allKeys");
      v97 = (void *)objc_claimAutoreleasedReturnValue();
      v98 = objc_msgSend(v97, "countByEnumeratingWithState:objects:count:", &v162, v222, 16);
      if (v98)
      {
        v99 = 1;
        v100 = *(_QWORD *)v163;
        objb = v97;
        do
        {
          for (ii = 0; ii != v98; ++ii)
          {
            if (*(_QWORD *)v163 != v100)
              objc_enumerationMutation(objb);
            v102 = *(_QWORD *)(*((_QWORD *)&v162 + 1) + 8 * ii);
            if (-[CDMServiceCenter isServiceNotReady:withServiceStateMap:](self, "isServiceNotReady:withServiceStateMap:", v102, *(_QWORD *)(*((_QWORD *)&v240 + 1) + 40)))
            {
              objc_msgSend(*(id *)(*(_QWORD *)&v230[8] + 40), "objectForKey:", v102);
              v103 = (void *)objc_claimAutoreleasedReturnValue();
              v104 = (void *)MEMORY[0x24BDD17C8];
              objc_msgSend(*(id *)(*((_QWORD *)&v240 + 1) + 40), "objectForKeyedSubscript:", v102);
              v105 = (void *)objc_claimAutoreleasedReturnValue();
              if (v103)
              {
                objc_msgSend(v103, "localizedDescription");
                k = objc_claimAutoreleasedReturnValue();
                v106 = (const __CFString *)k;
              }
              else
              {
                v106 = CFSTR("Service timed out");
              }
              objc_msgSend(v104, "stringWithFormat:", CFSTR("Service: %@, State: %@, Error: %@"), v102, v105, v106, v136);
              v107 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v142, "addObject:", v107);

              if (v103)
              {

                +[CDMDataDispatcherCompletionQueue getDataDispatcherCompletionQueue](CDMDataDispatcherCompletionQueue, "getDataDispatcherCompletionQueue");
                v108 = objc_claimAutoreleasedReturnValue();
                v158[0] = MEMORY[0x24BDAC760];
                v158[1] = 3221225472;
                v158[2] = __44__CDMServiceCenter_handleSetup_forCallback___block_invoke_380;
                v158[3] = &unk_24DCAB4C0;
                v160 = &v225;
                v158[4] = v102;
                v159 = v103;
                dispatch_async(v108, v158);

                v109 = v159;
              }
              else
              {

                +[CDMDataDispatcherCompletionQueue getDataDispatcherCompletionQueue](CDMDataDispatcherCompletionQueue, "getDataDispatcherCompletionQueue");
                v109 = objc_claimAutoreleasedReturnValue();
                v161[0] = MEMORY[0x24BDAC760];
                v161[1] = 3221225472;
                v161[2] = __44__CDMServiceCenter_handleSetup_forCallback___block_invoke_379;
                v161[3] = &unk_24DCAB498;
                v161[4] = v102;
                v161[5] = &v225;
                dispatch_async(v109, v161);
              }

              v99 = 0;
            }
          }
          v97 = objb;
          v98 = objc_msgSend(objb, "countByEnumeratingWithState:objects:count:", &v162, v222, 16);
        }
        while (v98);
      }
      else
      {
        v99 = 1;
      }

      +[CDMDataDispatcher dispatchServiceSetupMetrics:selfMetadata:dataDispatcherContext:](CDMDataDispatcher, "dispatchServiceSetupMetrics:selfMetadata:dataDispatcherContext:", *(_QWORD *)(*((_QWORD *)&v225 + 1) + 40), *(_QWORD *)(*((_QWORD *)&buf + 1) + 40), v195[5]);
      CDMOSLoggerForCategory(4);
      v116 = objc_claimAutoreleasedReturnValue();
      v117 = v116;
      if (v138 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v116))
      {
        *(_WORD *)v220 = 0;
        _os_signpost_emit_with_name_impl(&dword_21A2A0000, v117, OS_SIGNPOST_INTERVAL_END, spid, "CDMServicesSetup", " enableTelemetry=YES ", v220, 2u);
      }

      v118 = dispatch_group_create();
      *(_QWORD *)v220 = 0;
      *(_QWORD *)&v220[8] = v220;
      *(_QWORD *)&v220[16] = 0x2020000000;
      v221 = 1;
      dispatch_group_enter(v118);
      v154[0] = MEMORY[0x24BDAC760];
      v154[1] = 3221225472;
      v154[2] = __44__CDMServiceCenter_handleSetup_forCallback___block_invoke_382;
      v154[3] = &unk_24DCAB4C0;
      v155 = v149;
      v157 = v220;
      v119 = v118;
      v156 = v119;
      v120 = dispatch_block_create((dispatch_block_flags_t)0, v154);
      dispatch_async((dispatch_queue_t)self->_cdmServiceCenterQueue, v120);
      dispatch_group_wait(v119, 0xFFFFFFFFFFFFFFFFLL);
      if ((v99 & 1) != 0)
      {
        if (*(_BYTE *)(*(_QWORD *)&v220[8] + 24))
        {
          -[CDMServiceCenter setSystemState:](self, "setSystemState:", 3);
          CDMOSLoggerForCategory(3);
          v121 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v121, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)v216 = 136315138;
            v217 = "-[CDMServiceCenter handleSetup:forCallback:]";
            _os_log_impl(&dword_21A2A0000, v121, OS_LOG_TYPE_INFO, "%s [insights-cdm-summary]:\nCDM setup successful", v216, 0xCu);
          }

          v122 = v137;
          if (!+[CDMServiceCenterUtils isHostedInDaemon](CDMServiceCenterUtils, "isHostedInDaemon"))
          {
            v123 = (OS_os_transaction *)os_transaction_create();
            transaction = self->transaction;
            self->transaction = v123;

            v122 = v137;
          }
          v141[2](v141, 0, 0);
          if (v122)
            +[CDMSELFLogUtil cdmAllServicesWarmupEnded:logMessage:dataDispatcherContext:](CDMSELFLogUtil, "cdmAllServicesWarmupEnded:logMessage:dataDispatcherContext:", *(_QWORD *)(*((_QWORD *)&buf + 1) + 40), CFSTR("SELF all services warmup ended message emitted"), v195[5]);
          +[CDMSELFLogUtil cdmAllServicesSetupEnded:logMessage:dataDispatcherContext:](CDMSELFLogUtil, "cdmAllServicesSetupEnded:logMessage:dataDispatcherContext:", *(_QWORD *)(*((_QWORD *)&buf + 1) + 40), CFSTR("SELF all services setup ended message emitted"), v195[5]);
        }
        else
        {
          -[CDMServiceCenter setSystemState:](self, "setSystemState:", 4);
          if (v141)
          {
            objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("CDM failed to setup. Not all required graph services setup successfully"));
            v131 = (void *)objc_claimAutoreleasedReturnValue();
            CDMOSLoggerForCategory(3);
            v132 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v132, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)v216 = 136315394;
              v217 = "-[CDMServiceCenter handleSetup:forCallback:]";
              v218 = 2114;
              v219 = v131;
              _os_log_error_impl(&dword_21A2A0000, v132, OS_LOG_TYPE_ERROR, "%s [ERR]: [insights-cdm-summary]:\n%{public}@", v216, 0x16u);
            }

            v133 = (void *)MEMORY[0x24BDD1540];
            v212 = *MEMORY[0x24BDD0FC8];
            v213 = v131;
            objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v213, &v212, 1);
            v134 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v133, "errorWithDomain:code:userInfo:", CFSTR("CDMServiceCenter"), 4, v134);
            v135 = (void *)objc_claimAutoreleasedReturnValue();

            v141[2](v141, 0, v135);
          }
        }
      }
      else
      {
        -[CDMServiceCenter setSystemState:](self, "setSystemState:", 4);
        v125 = v137;
        if (v141)
        {
          objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("CDM failed to setup. The following services are not in ready or disabled state: %@"), v142);
          v126 = (void *)objc_claimAutoreleasedReturnValue();
          CDMOSLoggerForCategory(3);
          v127 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v127, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)v216 = 136315394;
            v217 = "-[CDMServiceCenter handleSetup:forCallback:]";
            v218 = 2114;
            v219 = v126;
            _os_log_error_impl(&dword_21A2A0000, v127, OS_LOG_TYPE_ERROR, "%s [ERR]: [insights-cdm-summary]:\n%{public}@", v216, 0x16u);
          }

          v128 = (void *)MEMORY[0x24BDD1540];
          v214 = *MEMORY[0x24BDD0FC8];
          v215 = v126;
          objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v215, &v214, 1);
          v129 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v128, "errorWithDomain:code:userInfo:", CFSTR("CDMServiceCenter"), 4, v129);
          v130 = (void *)objc_claimAutoreleasedReturnValue();

          v141[2](v141, 0, v130);
          v125 = v137;
        }
        if (v125)
          +[CDMSELFLogUtil cdmAllServicesWarmupFailed:logMessage:dataDispatcherContext:](CDMSELFLogUtil, "cdmAllServicesWarmupFailed:logMessage:dataDispatcherContext:", *(_QWORD *)(*((_QWORD *)&buf + 1) + 40), CFSTR("SELF all services warmup failed message emitted"), v195[5]);
        +[CDMSELFLogUtil cdmAllServicesSetupFailed:logMessage:dataDispatcherContext:](CDMSELFLogUtil, "cdmAllServicesSetupFailed:logMessage:dataDispatcherContext:", *(_QWORD *)(*((_QWORD *)&buf + 1) + 40), CFSTR("SELF all services setup failed message emitted"), v195[5]);
      }

      _Block_object_dispose(v220, 8);
      _Block_object_dispose(&v225, 8);

      _Block_object_dispose(v186, 8);
      _Block_object_dispose(v230, 8);

      _Block_object_dispose(&v240, 8);
    }
    else
    {
      CDMOSLoggerForCategory(3);
      v110 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v110, OS_LOG_TYPE_ERROR))
      {
        LODWORD(v240) = 136315138;
        *(_QWORD *)((char *)&v240 + 4) = "-[CDMServiceCenter handleSetup:forCallback:]";
        _os_log_error_impl(&dword_21A2A0000, v110, OS_LOG_TYPE_ERROR, "%s [ERR]: No services found to setup", (uint8_t *)&v240, 0xCu);
      }

      if (v141)
      {
        CDMOSLoggerForCategory(4);
        v111 = objc_claimAutoreleasedReturnValue();
        v112 = v111;
        if (v138 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v111))
        {
          LOWORD(v240) = 0;
          _os_signpost_emit_with_name_impl(&dword_21A2A0000, v112, OS_SIGNPOST_INTERVAL_END, spid, "CDMServicesSetup", " enableTelemetry=YES ", (uint8_t *)&v240, 2u);
        }

        v113 = (void *)MEMORY[0x24BDD1540];
        v234 = *MEMORY[0x24BDD0FC8];
        v235 = CFSTR("No services found to setup");
        objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v235, &v234, 1);
        v114 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v113, "errorWithDomain:code:userInfo:", CFSTR("CDMServiceCenter"), 3, v114);
        v115 = (void *)objc_claimAutoreleasedReturnValue();

        v141[2](v141, 0, v115);
      }
    }

    goto LABEL_147;
  }
  -[CDMServiceCenter setSystemState:](self, "setSystemState:", 4);
  v62 = (void *)MEMORY[0x24BDD17C8];
  objc_msgSend(*(id *)(*((_QWORD *)&v240 + 1) + 40), "localizedDescription");
  v63 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(*((_QWORD *)&v240 + 1) + 40), "localizedFailureReason");
  v64 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v62, "stringWithFormat:", CFSTR("Failed to setup assets with error:\nDescription: %@\nReason: %@\nAbort setup."), v63, v64);
  v65 = (void *)objc_claimAutoreleasedReturnValue();

  CDMOSLoggerForCategory(3);
  v66 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v66, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)v230 = 136315394;
    *(_QWORD *)&v230[4] = "-[CDMServiceCenter handleSetup:forCallback:]";
    *(_WORD *)&v230[12] = 2114;
    *(_QWORD *)&v230[14] = v65;
    _os_log_error_impl(&dword_21A2A0000, v66, OS_LOG_TYPE_ERROR, "%s [ERR]: [insights-cdm-assets]:\n%{public}@", v230, 0x16u);
  }

  CDMOSLoggerForCategory(4);
  v67 = objc_claimAutoreleasedReturnValue();
  v68 = v67;
  if (k <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v67))
  {
    *(_WORD *)v230 = 0;
    _os_signpost_emit_with_name_impl(&dword_21A2A0000, v68, OS_SIGNPOST_INTERVAL_END, v9, "CDMServiceCenterAssetsSetup", " enableTelemetry=YES ", v230, 2u);
  }

  CDMOSLoggerForCategory(4);
  v69 = objc_claimAutoreleasedReturnValue();
  v70 = v69;
  if (v138 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v69))
  {
    *(_WORD *)v230 = 0;
    _os_signpost_emit_with_name_impl(&dword_21A2A0000, v70, OS_SIGNPOST_INTERVAL_END, spid, "CDMServicesSetup", " enableTelemetry=YES ", v230, 2u);
  }

  if (v141)
  {
    v71 = (void *)MEMORY[0x24BDD1540];
    v238 = *MEMORY[0x24BDD0FC8];
    v239 = v65;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v239, &v238, 1);
    v72 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v71, "errorWithDomain:code:userInfo:", CFSTR("CDMServiceCenter"), 1, v72);
    v73 = (void *)objc_claimAutoreleasedReturnValue();

    v141[2](v141, 0, v73);
  }

  _Block_object_dispose(&v240, 8);
LABEL_147:
  _Block_object_dispose(&v194, 8);

  _Block_object_dispose(&buf, 8);
}

- (BOOL)isServiceNotReady:(id)a3 withServiceStateMap:(id)a4
{
  void *v4;
  BOOL v5;

  objc_msgSend(a4, "objectForKeyedSubscript:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "integerValue") != 2 && objc_msgSend(v4, "integerValue") != 4;

  return v5;
}

- (void)setupEmbeddingConfigsWithError:(id *)a3
{
  CDMEmbeddingConfigs *v5;
  void *v6;
  void *v7;
  CDMEmbeddingConfigs *v8;
  id v9;
  NSObject *v10;
  id v11;
  uint8_t buf[4];
  const char *v13;
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  v5 = [CDMEmbeddingConfigs alloc];
  -[CDMDynamicConfig assetPaths](self->_currentConfig, "assetPaths");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[CDMDynamicConfig embeddingVersion](self->_currentConfig, "embeddingVersion");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = -[CDMEmbeddingConfigs initWithAssetPaths:embeddingVersion:](v5, "initWithAssetPaths:embeddingVersion:", v6, v7);

  v11 = 0;
  -[CDMEmbeddingConfigs setupWithError:](v8, "setupWithError:", &v11);
  v9 = v11;
  if (v9)
  {
    CDMOSLoggerForCategory(3);
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315138;
      v13 = "-[CDMServiceCenter setupEmbeddingConfigsWithError:]";
      _os_log_error_impl(&dword_21A2A0000, v10, OS_LOG_TYPE_ERROR, "%s [ERR]: Error occurs while setup setup CDM embedding configs.", buf, 0xCu);
    }

    *a3 = objc_retainAutorelease(v9);
  }
  else
  {
    -[CDMDynamicConfig setEmbeddingConfigs:](self->_currentConfig, "setEmbeddingConfigs:", v8);
  }

}

- (void)setupAssetsForCDMAssetsInfo:(id)a3 withError:(id *)a4 andSelfMetadata:(id)a5 dataDispatcherContext:(id)a6
{
  id v9;
  id v10;
  os_signpost_id_t v11;
  NSObject *v12;
  NSObject *v13;
  id v14;
  void *v15;
  CDMServiceCenter *v16;
  NSString *v17;
  Class v18;
  void *v19;
  void *v20;
  void *v21;
  id v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  NSObject *v29;
  void *v30;
  void *v31;
  NSObject *v32;
  NSObject *v33;
  id *p_currentConfig;
  CDMDynamicConfig *currentConfig;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  uint64_t v41;
  void *v42;
  void *v43;
  NSObject *v44;
  NSObject *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  os_signpost_id_t spid;
  unint64_t v52;
  id v54;
  id v55;
  id v56;
  _QWORD v57[2];
  _QWORD v58[2];
  uint8_t buf[4];
  const char *v60;
  __int16 v61;
  void *v62;
  uint64_t v63;
  _QWORD v64[3];

  v64[1] = *MEMORY[0x24BDAC8D0];
  v54 = a3;
  v9 = a5;
  v10 = a6;
  v11 = os_signpost_id_generate((os_log_t)CDMLogContext);
  v12 = (id)CDMLogContext;
  v13 = v12;
  v52 = v11 - 1;
  if (v11 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v12))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_21A2A0000, v13, OS_SIGNPOST_INTERVAL_BEGIN, v11, "CDMServiceCenterSetupAssetsForServices", "CDM Service Center setupAssetsForServices enableTelemetry=YES", buf, 2u);
  }
  spid = v11;

  v14 = objc_alloc_init(MEMORY[0x24BDD1880]);
  +[CDMSELFLogUtil cdmAssetSetupStarted:contextId:serviceNames:logMessage:dataDispatcherContext:](CDMSELFLogUtil, "cdmAssetSetupStarted:contextId:serviceNames:logMessage:dataDispatcherContext:", v9, v14, 0, CFSTR("SELF asset setup started message emitted"), v10);
  +[CDMAssetsManager getSingletonCDMAssetsManager](CDMAssetsManager, "getSingletonCDMAssetsManager");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = self;
  objc_sync_enter(v16);
  -[CDMDynamicConfig graphName](v16->_currentConfig, "graphName");
  v17 = (NSString *)objc_claimAutoreleasedReturnValue();
  v18 = NSClassFromString(v17);
  -[CDMDynamicConfig languageCode](v16->_currentConfig, "languageCode");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  -[objc_class getAssetsForSetup:](v18, "getAssetsForSetup:", v19);
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  -[CDMDynamicConfig languageCode](v16->_currentConfig, "languageCode");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v17) = objc_msgSend(v15, "shouldReSetupForLocale:cdmAssetsInfo:", v21, v20);

  if ((_DWORD)v17
    && (v56 = 0,
        -[CDMServiceCenter setupCDMAssetManagerWithError:](v16, "setupCDMAssetManagerWithError:", &v56),
        (v22 = v56) != 0))
  {
    v23 = v22;
    v24 = (void *)MEMORY[0x24BDD17C8];
    -[CDMDynamicConfig languageCode](v16->_currentConfig, "languageCode");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    -[CDMDynamicConfig assetDirPath](v16->_currentConfig, "assetDirPath");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "stringWithFormat:", CFSTR("Error occurs while initializing CDMAssetsManager with locale: %@, asset dir path: %@."), v25, v26);
    v50 = (void *)objc_claimAutoreleasedReturnValue();

    v27 = (void *)MEMORY[0x24BDD1540];
    v63 = *MEMORY[0x24BDD0FC8];
    v64[0] = v50;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v64, &v63, 1);
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "errorWithDomain:code:userInfo:", CFSTR("CDMServiceCenter"), 0, v28);
    *a4 = (id)objc_claimAutoreleasedReturnValue();

    CDMOSLoggerForCategory(3);
    v29 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      v60 = "-[CDMServiceCenter setupAssetsForCDMAssetsInfo:withError:andSelfMetadata:dataDispatcherContext:]";
      v61 = 2114;
      v62 = v50;
      _os_log_error_impl(&dword_21A2A0000, v29, OS_LOG_TYPE_ERROR, "%s [ERR]: %{public}@", buf, 0x16u);
    }

    objc_msgSend(v23, "userInfo");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "objectForKey:", CFSTR("CDMAssetSetupErrorDomain"));
    v31 = (void *)objc_claimAutoreleasedReturnValue();

    +[CDMSELFLogUtil cdmAssetSetupFailed:contextId:errorDomain:errorCode:logMessage:dataDispatcherContext:](CDMSELFLogUtil, "cdmAssetSetupFailed:contextId:errorDomain:errorCode:logMessage:dataDispatcherContext:", v9, v14, objc_msgSend(v31, "intValue"), objc_msgSend(v23, "code"), CFSTR("SELF asset setup failed (CDMAssetsManager initialization error) message emitted"), v10);
    v32 = (id)CDMLogContext;
    v33 = v32;
    if (v52 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v32))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_21A2A0000, v33, OS_SIGNPOST_INTERVAL_END, spid, "CDMServiceCenterSetupAssetsForServices", " enableTelemetry=YES ", buf, 2u);
    }

    objc_sync_exit(v16);
  }
  else
  {

    objc_sync_exit(v16);
    currentConfig = v16->_currentConfig;
    p_currentConfig = (id *)&v16->_currentConfig;
    -[CDMDynamicConfig assetDirPath](currentConfig, "assetDirPath");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    v37 = (void *)MEMORY[0x24BDBCEA0];
    objc_msgSend(*p_currentConfig, "languageCode");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v37, "localeWithLocaleIdentifier:", v38);
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "getAssetsByFactorNamesForCDMAssetsInfo:assetDirPath:locale:", v54, v36, v39);
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    -[CDMDynamicConfig setAssetPaths:](currentConfig, "setAssetPaths:", v40);

    objc_msgSend(*p_currentConfig, "assetCollection");
    v41 = objc_claimAutoreleasedReturnValue();
    objc_msgSend((id)v41, "assetPaths");
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    +[CDMSELFLogUtil cdmAssetsReported:metadata:dataDispatcherContext:](CDMSELFLogUtil, "cdmAssetsReported:metadata:dataDispatcherContext:", v42, v9, v10);

    objc_msgSend(*p_currentConfig, "assetPaths");
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    v55 = 0;
    LOBYTE(v41) = objc_msgSend(v15, "areAssetsAvailableForCDMAssetsInfo:factorToAsset:withError:withSelfMetadata:withSelfContextId:withDataDispatcherContext:", v54, v43, &v55, v9, v14, v10);
    v16 = (CDMServiceCenter *)v55;

    if ((v41 & 1) != 0)
    {
      +[CDMSELFLogUtil cdmAssetSetupEnded:contextId:logMessage:dataDispatcherContext:](CDMSELFLogUtil, "cdmAssetSetupEnded:contextId:logMessage:dataDispatcherContext:", v9, v14, CFSTR("SELF asset setup ended message emitted"), v10);
      v44 = (id)CDMLogContext;
      v45 = v44;
      if (v52 < 0xFFFFFFFFFFFFFFFELL && os_signpost_enabled(v44))
      {
        *(_WORD *)buf = 0;
        _os_signpost_emit_with_name_impl(&dword_21A2A0000, v45, OS_SIGNPOST_INTERVAL_END, spid, "CDMServiceCenterSetupAssetsForServices", " enableTelemetry=YES ", buf, 2u);
      }

    }
    else
    {
      v46 = (void *)MEMORY[0x24BDD1540];
      v57[0] = *MEMORY[0x24BDD0FC8];
      -[CDMServiceCenter localizedDescription](v16, "localizedDescription");
      v47 = (void *)objc_claimAutoreleasedReturnValue();
      v58[0] = v47;
      v57[1] = *MEMORY[0x24BDD0FD8];
      -[CDMServiceCenter localizedFailureReason](v16, "localizedFailureReason");
      v48 = (void *)objc_claimAutoreleasedReturnValue();
      v58[1] = v48;
      objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v58, v57, 2);
      v49 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v46, "errorWithDomain:code:userInfo:", CFSTR("CDMServiceCenter"), 0, v49);
      *a4 = (id)objc_claimAutoreleasedReturnValue();

      +[CDMSELFLogUtil cdmAssetSetupFailed:contextId:errorDomain:errorCode:logMessage:dataDispatcherContext:](CDMSELFLogUtil, "cdmAssetSetupFailed:contextId:errorDomain:errorCode:logMessage:dataDispatcherContext:", v9, v14, 2, 1, CFSTR("SELF asset setup failed (not all assets available) message emitted"), v10);
    }
  }

}

- (void)mergeConfig:(id)a3
{
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  char v8;
  CDMDynamicConfig *currentConfig;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  char v15;
  CDMDynamicConfig *v16;
  void *v17;
  uint64_t v18;
  void *v19;
  void *v20;
  void *v21;
  char v22;
  CDMDynamicConfig *v23;
  void *v24;
  uint64_t v25;
  void *v26;
  void *v27;
  void *v28;
  char v29;
  CDMDynamicConfig *v30;
  void *v31;
  uint64_t v32;
  void *v33;
  void *v34;
  void *v35;
  char v36;
  CDMDynamicConfig *v37;
  void *v38;
  uint64_t v39;
  void *v40;
  void *v41;
  void *v42;
  char v43;
  CDMDynamicConfig *v44;
  void *v45;
  uint64_t v46;
  void *v47;
  void *v48;
  void *v49;
  char v50;
  CDMDynamicConfig *v51;
  void *v52;
  uint64_t v53;
  void *v54;
  void *v55;
  void *v56;
  char v57;
  CDMDynamicConfig *v58;
  void *v59;
  uint64_t v60;
  void *v61;
  void *v62;
  void *v63;
  char v64;
  CDMDynamicConfig *v65;
  void *v66;
  uint64_t v67;
  void *v68;
  void *v69;
  void *v70;
  char v71;
  void *v72;
  id v73;

  v73 = a3;
  objc_msgSend(v73, "languageCode");
  v4 = objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    v5 = (void *)v4;
    objc_msgSend(v73, "languageCode");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[CDMDynamicConfig languageCode](self->_currentConfig, "languageCode");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v6, "isEqualToString:", v7);

    if ((v8 & 1) == 0)
    {
      currentConfig = self->_currentConfig;
      objc_msgSend(v73, "languageCode");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      -[CDMDynamicConfig setLanguageCode:](currentConfig, "setLanguageCode:", v10);

    }
  }
  objc_msgSend(v73, "embeddingVersion");
  v11 = objc_claimAutoreleasedReturnValue();
  if (v11)
  {
    v12 = (void *)v11;
    objc_msgSend(v73, "embeddingVersion");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[CDMDynamicConfig embeddingVersion](self->_currentConfig, "embeddingVersion");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = objc_msgSend(v13, "isEqualToString:", v14);

    if ((v15 & 1) == 0)
    {
      v16 = self->_currentConfig;
      objc_msgSend(v73, "embeddingVersion");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      -[CDMDynamicConfig setEmbeddingVersion:](v16, "setEmbeddingVersion:", v17);

    }
  }
  objc_msgSend(v73, "graphName");
  v18 = objc_claimAutoreleasedReturnValue();
  if (v18)
  {
    v19 = (void *)v18;
    objc_msgSend(v73, "graphName");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    -[CDMDynamicConfig graphName](self->_currentConfig, "graphName");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = objc_msgSend(v20, "isEqualToString:", v21);

    if ((v22 & 1) == 0)
    {
      v23 = self->_currentConfig;
      objc_msgSend(v73, "graphName");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      -[CDMDynamicConfig setGraphName:](v23, "setGraphName:", v24);

    }
  }
  objc_msgSend(v73, "siriVocabularySandboxId");
  v25 = objc_claimAutoreleasedReturnValue();
  if (v25)
  {
    v26 = (void *)v25;
    objc_msgSend(v73, "siriVocabularySandboxId");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    -[CDMDynamicConfig siriVocabularySandboxId](self->_currentConfig, "siriVocabularySandboxId");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    v29 = objc_msgSend(v27, "isEqualToString:", v28);

    if ((v29 & 1) == 0)
    {
      v30 = self->_currentConfig;
      objc_msgSend(v73, "siriVocabularySandboxId");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      -[CDMDynamicConfig setSiriVocabularySandboxId:](v30, "setSiriVocabularySandboxId:", v31);

    }
  }
  objc_msgSend(v73, "assetPaths");
  v32 = objc_claimAutoreleasedReturnValue();
  if (v32)
  {
    v33 = (void *)v32;
    objc_msgSend(v73, "assetPaths");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    -[CDMDynamicConfig assetPaths](self->_currentConfig, "assetPaths");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    v36 = objc_msgSend(v34, "isEqualToDictionary:", v35);

    if ((v36 & 1) == 0)
    {
      v37 = self->_currentConfig;
      objc_msgSend(v73, "assetPaths");
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      -[CDMDynamicConfig setAssetPaths:](v37, "setAssetPaths:", v38);

    }
  }
  objc_msgSend(v73, "assetDirPath");
  v39 = objc_claimAutoreleasedReturnValue();
  if (v39)
  {
    v40 = (void *)v39;
    objc_msgSend(v73, "assetDirPath");
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    -[CDMDynamicConfig assetDirPath](self->_currentConfig, "assetDirPath");
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    v43 = objc_msgSend(v41, "isEqualToString:", v42);

    if ((v43 & 1) == 0)
    {
      v44 = self->_currentConfig;
      objc_msgSend(v73, "assetDirPath");
      v45 = (void *)objc_claimAutoreleasedReturnValue();
      -[CDMDynamicConfig setAssetDirPath:](v44, "setAssetDirPath:", v45);

    }
  }
  objc_msgSend(v73, "overrideSiriVocabSpans");
  v46 = objc_claimAutoreleasedReturnValue();
  if (v46)
  {
    v47 = (void *)v46;
    objc_msgSend(v73, "overrideSiriVocabSpans");
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    -[CDMDynamicConfig overrideSiriVocabSpans](self->_currentConfig, "overrideSiriVocabSpans");
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    v50 = objc_msgSend(v48, "isEqualToArray:", v49);

    if ((v50 & 1) == 0)
    {
      v51 = self->_currentConfig;
      objc_msgSend(v73, "overrideSiriVocabSpans");
      v52 = (void *)objc_claimAutoreleasedReturnValue();
      -[CDMDynamicConfig setOverrideSiriVocabSpans:](v51, "setOverrideSiriVocabSpans:", v52);

    }
  }
  objc_msgSend(v73, "overrideMentions");
  v53 = objc_claimAutoreleasedReturnValue();
  if (v53)
  {
    v54 = (void *)v53;
    objc_msgSend(v73, "overrideMentions");
    v55 = (void *)objc_claimAutoreleasedReturnValue();
    -[CDMDynamicConfig overrideMentions](self->_currentConfig, "overrideMentions");
    v56 = (void *)objc_claimAutoreleasedReturnValue();
    v57 = objc_msgSend(v55, "isEqualToArray:", v56);

    if ((v57 & 1) == 0)
    {
      v58 = self->_currentConfig;
      objc_msgSend(v73, "overrideMentions");
      v59 = (void *)objc_claimAutoreleasedReturnValue();
      -[CDMDynamicConfig setOverrideMentions:](v58, "setOverrideMentions:", v59);

    }
  }
  objc_msgSend(v73, "overrideContextualSpans");
  v60 = objc_claimAutoreleasedReturnValue();
  if (v60)
  {
    v61 = (void *)v60;
    objc_msgSend(v73, "overrideContextualSpans");
    v62 = (void *)objc_claimAutoreleasedReturnValue();
    -[CDMDynamicConfig overrideContextualSpans](self->_currentConfig, "overrideContextualSpans");
    v63 = (void *)objc_claimAutoreleasedReturnValue();
    v64 = objc_msgSend(v62, "isEqualToArray:", v63);

    if ((v64 & 1) == 0)
    {
      v65 = self->_currentConfig;
      objc_msgSend(v73, "overrideContextualSpans");
      v66 = (void *)objc_claimAutoreleasedReturnValue();
      -[CDMDynamicConfig setOverrideContextualSpans:](v65, "setOverrideContextualSpans:", v66);

    }
  }
  objc_msgSend(v73, "serviceStateDirectory");
  v67 = objc_claimAutoreleasedReturnValue();
  if (v67)
  {
    v68 = (void *)v67;
    objc_msgSend(v73, "serviceStateDirectory");
    v69 = (void *)objc_claimAutoreleasedReturnValue();
    -[CDMDynamicConfig serviceStateDirectory](self->_currentConfig, "serviceStateDirectory");
    v70 = (void *)objc_claimAutoreleasedReturnValue();
    v71 = objc_msgSend(v69, "isEqualToString:", v70);

    if ((v71 & 1) == 0)
    {
      objc_msgSend(v73, "serviceStateDirectory");
      v72 = (void *)objc_claimAutoreleasedReturnValue();
      -[CDMDynamicConfig setServiceStateDirectory:](self->_currentConfig, "setServiceStateDirectory:", v72);

    }
  }

}

- (void)setupCDMAssetManagerWithError:(id *)a3
{
  os_signpost_id_t v5;
  NSObject *v6;
  NSObject *v7;
  NSString *v8;
  Class v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  NSObject *v17;
  NSObject *v18;
  NSObject *v19;
  void *v20;
  void *v21;
  id v22;
  uint8_t buf[4];
  const char *v24;
  __int16 v25;
  void *v26;
  __int16 v27;
  void *v28;
  uint64_t v29;

  v29 = *MEMORY[0x24BDAC8D0];
  v5 = os_signpost_id_generate((os_log_t)CDMLogContext);
  v6 = (id)CDMLogContext;
  v7 = v6;
  if (v5 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v6))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_21A2A0000, v7, OS_SIGNPOST_INTERVAL_BEGIN, v5, "CDMServiceCenterAssetsSetup", "CDM Service Center setupCDMAssetManagerWithError enableTelemetry=YES", buf, 2u);
  }

  -[CDMDynamicConfig graphName](self->_currentConfig, "graphName");
  v8 = (NSString *)objc_claimAutoreleasedReturnValue();
  v9 = NSClassFromString(v8);
  -[CDMDynamicConfig languageCode](self->_currentConfig, "languageCode");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[objc_class getAssetsForSetup:](v9, "getAssetsForSetup:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  +[CDMAssetsManager getSingletonCDMAssetsManager](CDMAssetsManager, "getSingletonCDMAssetsManager");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = (void *)MEMORY[0x24BDBCEA0];
  -[CDMDynamicConfig languageCode](self->_currentConfig, "languageCode");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "localeWithLocaleIdentifier:", v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = 0;
  objc_msgSend(v12, "setupForLocale:cdmAssetsInfo:error:", v15, v11, &v22);
  v16 = v22;

  v17 = (id)CDMLogContext;
  v18 = v17;
  if (v5 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v17))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_21A2A0000, v18, OS_SIGNPOST_INTERVAL_END, v5, "CDMServiceCenterAssetsSetup", " enableTelemetry=YES ", buf, 2u);
  }

  if (v16)
  {
    CDMOSLoggerForCategory(3);
    v19 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
    {
      -[CDMDynamicConfig languageCode](self->_currentConfig, "languageCode");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      -[CDMDynamicConfig assetDirPath](self->_currentConfig, "assetDirPath");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 136315650;
      v24 = "-[CDMServiceCenter setupCDMAssetManagerWithError:]";
      v25 = 2114;
      v26 = v20;
      v27 = 2114;
      v28 = v21;
      _os_log_error_impl(&dword_21A2A0000, v19, OS_LOG_TYPE_ERROR, "%s [ERR]: Error occurs while setup CDMAssetsManager with locale: %{public}@, asset dir path: %{public}@. Return NO.", buf, 0x20u);

    }
    *a3 = objc_retainAutorelease(v16);
  }

}

- (void)handleCommand:(id)a3 forCallback:(id)a4
{
  id v6;
  id v7;
  NSObject *cdmServiceCenterQueue;
  void *v9;
  NSObject *v10;
  __CFString *v11;
  void *v12;
  NSObject *v13;
  void *v14;
  void *v15;
  NSObject *v16;
  void *v17;
  void *v18;
  void *v19;
  _QWORD v20[4];
  id v21;
  CDMServiceCenter *v22;
  __CFString *v23;
  id v24;
  _QWORD v25[5];
  id v26;
  id v27;
  _QWORD block[5];
  id v29;
  id v30;
  uint64_t v31;
  const __CFString *v32;
  uint64_t v33;
  const __CFString *v34;
  uint8_t buf[4];
  const char *v36;
  __int16 v37;
  const __CFString *v38;
  uint64_t v39;

  v39 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  if (+[CDMServiceCenterUtils isServiceCenterEnabled:](CDMServiceCenterUtils, "isServiceCenterEnabled:", self->_config))
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      cdmServiceCenterQueue = self->_cdmServiceCenterQueue;
      block[0] = MEMORY[0x24BDAC760];
      block[1] = 3221225472;
      block[2] = __46__CDMServiceCenter_handleCommand_forCallback___block_invoke;
      block[3] = &unk_24DCAC620;
      block[4] = self;
      v29 = v6;
      v30 = v7;
      dispatch_async(cdmServiceCenterQueue, block);

      v9 = v29;
LABEL_6:

      goto LABEL_20;
    }
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v10 = self->_cdmServiceCenterQueue;
      v25[0] = MEMORY[0x24BDAC760];
      v25[1] = 3221225472;
      v25[2] = __46__CDMServiceCenter_handleCommand_forCallback___block_invoke_2;
      v25[3] = &unk_24DCAC620;
      v25[4] = self;
      v26 = v6;
      v27 = v7;
      dispatch_async(v10, v25);

      v9 = v26;
      goto LABEL_6;
    }
    if (-[CDMServiceCenter systemState](self, "systemState") == 3)
    {
      objc_msgSend(v6, "commandName");
      v11 = (__CFString *)objc_claimAutoreleasedReturnValue();
      -[NSMutableDictionary objectForKeyedSubscript:](self->_commandServicesDict, "objectForKeyedSubscript:", v11);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      if (v12)
      {
        v20[0] = MEMORY[0x24BDAC760];
        v20[1] = 3221225472;
        v20[2] = __46__CDMServiceCenter_handleCommand_forCallback___block_invoke_326;
        v20[3] = &unk_24DCAB380;
        v21 = v6;
        v22 = self;
        v24 = v7;
        v23 = v11;
        objc_msgSend(v12, "enumerateObjectsUsingBlock:", v20);

      }
      else
      {
        CDMOSLoggerForCategory(3);
        v16 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 136315394;
          v36 = "-[CDMServiceCenter handleCommand:forCallback:]";
          v37 = 2114;
          v38 = v11;
          _os_log_error_impl(&dword_21A2A0000, v16, OS_LOG_TYPE_ERROR, "%s [ERR]: No service found for command %{public}@", buf, 0x16u);
        }

        if (v7)
        {
          v17 = (void *)MEMORY[0x24BDD1540];
          v31 = *MEMORY[0x24BDD0FC8];
          v32 = CFSTR("No service found for command");
          objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v32, &v31, 1);
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v17, "errorWithDomain:code:userInfo:", CFSTR("CDMServiceCenter"), 0, v18);
          v19 = (void *)objc_claimAutoreleasedReturnValue();

          (*((void (**)(id, _QWORD, void *))v7 + 2))(v7, 0, v19);
        }
      }

      goto LABEL_19;
    }
    CDMOSLoggerForCategory(3);
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      v36 = "-[CDMServiceCenter handleCommand:forCallback:]";
      v37 = 2114;
      v38 = CFSTR("Handle command called but CDM system is not ready");
      _os_log_error_impl(&dword_21A2A0000, v13, OS_LOG_TYPE_ERROR, "%s [ERR]: %{public}@", buf, 0x16u);
    }

    if (v7)
    {
      v14 = (void *)MEMORY[0x24BDD1540];
      v33 = *MEMORY[0x24BDD0FC8];
      v34 = CFSTR("Handle command called but CDM system is not ready");
      objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v34, &v33, 1);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "errorWithDomain:code:userInfo:", CFSTR("CDMServiceCenter"), 0, v15);
      v11 = (__CFString *)objc_claimAutoreleasedReturnValue();

      (*((void (**)(id, _QWORD, __CFString *))v7 + 2))(v7, 0, v11);
LABEL_19:

    }
  }
LABEL_20:

}

void __44__CDMServiceCenter_handleSetup_forCallback___block_invoke(_QWORD *a1)
{
  uint64_t v1;
  void *v2;
  uint64_t v3;
  uint64_t v4;
  id obj;

  v2 = (void *)a1[4];
  v1 = a1[5];
  v3 = a1[7];
  v4 = *(_QWORD *)(a1[6] + 8);
  obj = *(id *)(v4 + 40);
  objc_msgSend(v2, "setupAssetsForCDMAssetsInfo:withError:andSelfMetadata:dataDispatcherContext:", v1, &obj, *(_QWORD *)(*(_QWORD *)(v3 + 8) + 40), *(_QWORD *)(*(_QWORD *)(a1[8] + 8) + 40));
  objc_storeStrong((id *)(v4 + 40), obj);
}

- (void)dealloc
{
  objc_super v3;

  -[CDMServiceCenter cleanup](self, "cleanup");
  v3.receiver = self;
  v3.super_class = (Class)CDMServiceCenter;
  -[CDMServiceCenter dealloc](&v3, sel_dealloc);
}

- (void)cleanup
{
  NSArray *services;
  CDMServiceGraphRunner *serviceGraphRunner;
  _QWORD v5[5];

  services = self->_services;
  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 3221225472;
  v5[2] = __27__CDMServiceCenter_cleanup__block_invoke;
  v5[3] = &unk_24DCAB358;
  v5[4] = self;
  -[NSArray enumerateObjectsUsingBlock:](services, "enumerateObjectsUsingBlock:", v5);
  serviceGraphRunner = self->_serviceGraphRunner;
  if (serviceGraphRunner)
    -[CDMServiceCenter removeObserver:forKeyPath:](self, "removeObserver:forKeyPath:", serviceGraphRunner, CFSTR("systemState"));
}

- (id)getServicesToWarmup:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  NSMutableDictionary *commandServicesDict;
  void *v9;
  void *v10;
  NSArray *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t i;
  void *v16;
  objc_class *v17;
  NSObject *v18;
  int v19;
  void *v20;
  uint64_t v21;
  NSArray *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t j;
  void *v27;
  NSObject *v28;
  void *v29;
  uint64_t v30;
  CDMServiceCenter *v32;
  void *v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  uint8_t v42[128];
  uint8_t buf[4];
  const char *v44;
  __int16 v45;
  void *v46;
  __int16 v47;
  uint64_t v48;
  _BYTE v49[128];
  uint64_t v50;

  v50 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCEB8]), "initWithCapacity:", -[NSArray count](self->_dagServices, "count"));
  -[CDMDynamicConfig graphName](self->_currentConfig, "graphName");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[CDMServiceCenter getEnabledDAGServiceNamesForGraph:](self, "getEnabledDAGServiceNamesForGraph:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  commandServicesDict = self->_commandServicesDict;
  v33 = v4;
  objc_msgSend(v4, "commandName");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary objectForKeyedSubscript:](commandServicesDict, "objectForKeyedSubscript:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v40 = 0u;
  v41 = 0u;
  v38 = 0u;
  v39 = 0u;
  v32 = self;
  v11 = self->_dagServices;
  v12 = -[NSArray countByEnumeratingWithState:objects:count:](v11, "countByEnumeratingWithState:objects:count:", &v38, v49, 16);
  if (v12)
  {
    v13 = v12;
    v14 = *(_QWORD *)v39;
    do
    {
      for (i = 0; i != v13; ++i)
      {
        if (*(_QWORD *)v39 != v14)
          objc_enumerationMutation(v11);
        v16 = *(void **)(*((_QWORD *)&v38 + 1) + 8 * i);
        v17 = (objc_class *)objc_opt_class();
        NSStringFromClass(v17);
        v18 = objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v7, "containsObject:", v18, v32))
        {
          v19 = objc_msgSend(v10, "containsObject:", v16);

          if (!v19)
            continue;
          if (objc_msgSend(v16, "serviceState") == 2)
          {
            objc_msgSend(v5, "addObject:", v16);
            continue;
          }
          CDMOSLoggerForCategory(3);
          v18 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG))
          {
            objc_msgSend(v16, "serviceName");
            v20 = (void *)objc_claimAutoreleasedReturnValue();
            v21 = objc_msgSend(v16, "serviceState");
            *(_DWORD *)buf = 136315650;
            v44 = "-[CDMServiceCenter getServicesToWarmup:]";
            v45 = 2112;
            v46 = v20;
            v47 = 2048;
            v48 = v21;
            _os_log_debug_impl(&dword_21A2A0000, v18, OS_LOG_TYPE_DEBUG, "%s Service %@ is not ready: State:%tu. Skipping warmup.", buf, 0x20u);

          }
        }

      }
      v13 = -[NSArray countByEnumeratingWithState:objects:count:](v11, "countByEnumeratingWithState:objects:count:", &v38, v49, 16);
    }
    while (v13);
  }

  v36 = 0u;
  v37 = 0u;
  v34 = 0u;
  v35 = 0u;
  v22 = v32->_foundationServices;
  v23 = -[NSArray countByEnumeratingWithState:objects:count:](v22, "countByEnumeratingWithState:objects:count:", &v34, v42, 16);
  if (v23)
  {
    v24 = v23;
    v25 = *(_QWORD *)v35;
    do
    {
      for (j = 0; j != v24; ++j)
      {
        if (*(_QWORD *)v35 != v25)
          objc_enumerationMutation(v22);
        v27 = *(void **)(*((_QWORD *)&v34 + 1) + 8 * j);
        if (objc_msgSend(v10, "containsObject:", v27, v32))
        {
          if (objc_msgSend(v27, "serviceState") == 2)
          {
            objc_msgSend(v5, "addObject:", v27);
          }
          else
          {
            CDMOSLoggerForCategory(3);
            v28 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v28, OS_LOG_TYPE_DEBUG))
            {
              objc_msgSend(v27, "serviceName");
              v29 = (void *)objc_claimAutoreleasedReturnValue();
              v30 = objc_msgSend(v27, "serviceState");
              *(_DWORD *)buf = 136315650;
              v44 = "-[CDMServiceCenter getServicesToWarmup:]";
              v45 = 2112;
              v46 = v29;
              v47 = 2048;
              v48 = v30;
              _os_log_debug_impl(&dword_21A2A0000, v28, OS_LOG_TYPE_DEBUG, "%s Service %@ is not ready: State:%tu. Skipping warmup.", buf, 0x20u);

            }
          }
        }
      }
      v24 = -[NSArray countByEnumeratingWithState:objects:count:](v22, "countByEnumeratingWithState:objects:count:", &v34, v42, 16);
    }
    while (v24);
  }

  return v5;
}

- (void)handleWarmup:(id)a3 forCallback:(id)a4
{
  os_signpost_id_t v6;
  NSObject *v7;
  NSObject *v8;
  void *v9;
  NSObject *v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  uint64_t v15;
  dispatch_block_t v16;
  id v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t j;
  uint64_t v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  NSObject *v28;
  void *v29;
  void *v30;
  void *v31;
  NSObject *v32;
  NSObject *v33;
  NSObject *v34;
  NSObject *v35;
  os_signpost_id_t spid;
  unint64_t v37;
  void *v38;
  NSObject *v39;
  void (**v40)(id, _QWORD, void *);
  void *v41;
  id v42;
  void *v43;
  CDMWarmupRequestCommand *v44;
  void *v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  _QWORD block[5];
  CDMWarmupRequestCommand *v51;
  NSObject *v52;
  id v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  _QWORD aBlock[5];
  uint8_t buf[8];
  uint8_t *v60;
  uint64_t v61;
  uint64_t (*v62)(uint64_t, uint64_t);
  void (*v63)(uint64_t);
  id v64;
  uint64_t v65;
  void *v66;
  uint8_t v67[4];
  const char *v68;
  __int16 v69;
  void *v70;
  _BYTE v71[128];
  _BYTE v72[128];
  uint64_t v73;

  v73 = *MEMORY[0x24BDAC8D0];
  v42 = a3;
  v40 = (void (**)(id, _QWORD, void *))a4;
  v6 = os_signpost_id_generate((os_log_t)CDMLogContext);
  v7 = (id)CDMLogContext;
  v8 = v7;
  spid = v6;
  v37 = v6 - 1;
  if (v6 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v7))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_21A2A0000, v8, OS_SIGNPOST_INTERVAL_BEGIN, v6, "CDMServicesWarmup", "CDM Services Warmup enableTelemetry=YES", buf, 2u);
  }

  objc_msgSend(v42, "dynamicConfig");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[CDMServiceCenter mergeConfig:](self, "mergeConfig:", v9);

  -[CDMServiceCenter getServicesToWarmup:](self, "getServicesToWarmup:", v42);
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v41, "count"))
  {
    objc_msgSend(v42, "selfMetadata");
    v39 = objc_claimAutoreleasedReturnValue();
    objc_msgSend(v42, "dataDispatcherContext");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    +[CDMSELFLogUtil cdmAllServicesWarmupStarted:logMessage:dataDispatcherContext:](CDMSELFLogUtil, "cdmAllServicesWarmupStarted:logMessage:dataDispatcherContext:", v39, CFSTR("SELF all services warmup started message emitted"), v38);
    *(_QWORD *)buf = 0;
    v60 = buf;
    v61 = 0x3032000000;
    v62 = __Block_byref_object_copy_;
    v63 = __Block_byref_object_dispose_;
    objc_msgSend(MEMORY[0x24BDBCED8], "dictionaryWithCapacity:", objc_msgSend(v41, "count"));
    v64 = (id)objc_claimAutoreleasedReturnValue();
    aBlock[0] = MEMORY[0x24BDAC760];
    aBlock[1] = 3221225472;
    aBlock[2] = __45__CDMServiceCenter_handleWarmup_forCallback___block_invoke;
    aBlock[3] = &unk_24DCAB3A8;
    aBlock[4] = buf;
    v45 = _Block_copy(aBlock);
    v44 = -[CDMWarmupRequestCommand initWithDynamicConfig:selfMetadata:]([CDMWarmupRequestCommand alloc], "initWithDynamicConfig:selfMetadata:", self->_currentConfig, v39);
    v10 = dispatch_group_create();
    v54 = 0u;
    v55 = 0u;
    v56 = 0u;
    v57 = 0u;
    v11 = v41;
    v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v54, v72, 16);
    if (v12)
    {
      v13 = *(_QWORD *)v55;
      do
      {
        for (i = 0; i != v12; ++i)
        {
          if (*(_QWORD *)v55 != v13)
            objc_enumerationMutation(v11);
          v15 = *(_QWORD *)(*((_QWORD *)&v54 + 1) + 8 * i);
          dispatch_group_enter(v10);
          block[0] = MEMORY[0x24BDAC760];
          block[1] = 3221225472;
          block[2] = __45__CDMServiceCenter_handleWarmup_forCallback___block_invoke_340;
          block[3] = &unk_24DCABC30;
          block[4] = v15;
          v51 = v44;
          v53 = v45;
          v52 = v10;
          v16 = dispatch_block_create((dispatch_block_flags_t)0, block);
          dispatch_async((dispatch_queue_t)self->_cdmServiceCenterQueue, v16);

        }
        v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v54, v72, 16);
      }
      while (v12);
    }

    dispatch_group_wait(v10, 0xFFFFFFFFFFFFFFFFLL);
    v17 = objc_alloc(MEMORY[0x24BDBCEB8]);
    v43 = (void *)objc_msgSend(v17, "initWithCapacity:", objc_msgSend(*((id *)v60 + 5), "count"));
    v48 = 0u;
    v49 = 0u;
    v46 = 0u;
    v47 = 0u;
    objc_msgSend(*((id *)v60 + 5), "allKeys");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v46, v71, 16);
    if (v19)
    {
      v20 = *(_QWORD *)v47;
      do
      {
        for (j = 0; j != v19; ++j)
        {
          if (*(_QWORD *)v47 != v20)
            objc_enumerationMutation(v18);
          v22 = *(_QWORD *)(*((_QWORD *)&v46 + 1) + 8 * j);
          objc_msgSend(*((id *)v60 + 5), "objectForKey:", v22);
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          v24 = (void *)MEMORY[0x24BDD17C8];
          objc_msgSend(v23, "localizedDescription");
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v24, "stringWithFormat:", CFSTR("Service: %@, Error: %@"), v22, v25);
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v43, "addObject:", v26);

        }
        v19 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v46, v71, 16);
      }
      while (v19);
    }

    if (objc_msgSend(v43, "count"))
    {
      if (v40)
      {
        objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("CDM failed to warmup. The following services failed to warmup: %@"), v43);
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        CDMOSLoggerForCategory(3);
        v28 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)v67 = 136315394;
          v68 = "-[CDMServiceCenter handleWarmup:forCallback:]";
          v69 = 2114;
          v70 = v27;
          _os_log_error_impl(&dword_21A2A0000, v28, OS_LOG_TYPE_ERROR, "%s [ERR]: [insights-cdm-summary]:\n%{public}@", v67, 0x16u);
        }

        v29 = (void *)MEMORY[0x24BDD1540];
        v65 = *MEMORY[0x24BDD0FC8];
        v66 = v27;
        objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v66, &v65, 1);
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v29, "errorWithDomain:code:userInfo:", CFSTR("CDMServiceCenter"), 4, v30);
        v31 = (void *)objc_claimAutoreleasedReturnValue();

        v40[2](v40, 0, v31);
      }
      +[CDMSELFLogUtil cdmAllServicesWarmupFailed:logMessage:dataDispatcherContext:](CDMSELFLogUtil, "cdmAllServicesWarmupFailed:logMessage:dataDispatcherContext:", v39, CFSTR("SELF all services warmup failed message emitted"), v38);
    }
    else
    {
      v40[2](v40, 0, 0);
      +[CDMSELFLogUtil cdmAllServicesWarmupEnded:logMessage:dataDispatcherContext:](CDMSELFLogUtil, "cdmAllServicesWarmupEnded:logMessage:dataDispatcherContext:", v39, CFSTR("SELF all services warmup ended message emitted"), v38);
    }
    v34 = (id)CDMLogContext;
    v35 = v34;
    if (v37 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v34))
    {
      *(_WORD *)v67 = 0;
      _os_signpost_emit_with_name_impl(&dword_21A2A0000, v35, OS_SIGNPOST_INTERVAL_END, spid, "CDMServicesWarmup", " enableTelemetry=YES ", v67, 2u);
    }

    _Block_object_dispose(buf, 8);
    v32 = v39;
  }
  else
  {
    if (v40)
      v40[2](v40, 0, 0);
    v32 = (id)CDMLogContext;
    if (v37 <= 0xFFFFFFFFFFFFFFFDLL)
    {
      v33 = v32;
      if (os_signpost_enabled(v32))
      {
        *(_WORD *)buf = 0;
        _os_signpost_emit_with_name_impl(&dword_21A2A0000, v33, OS_SIGNPOST_INTERVAL_END, spid, "CDMServicesWarmup", " enableTelemetry=YES ", buf, 2u);
      }
      v32 = v33;
    }
  }

}

- (void)readThermalState
{
  void *v2;
  NSObject *v3;
  const char *v4;
  int v5;
  const char *v6;
  __int16 v7;
  const __CFString *v8;
  uint64_t v9;

  v9 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BDD1760], "processInfo");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  switch(objc_msgSend(v2, "thermalState"))
  {
    case 0:
      CDMOSLoggerForCategory(3);
      v3 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
      {
        v5 = 136315138;
        v6 = "-[CDMServiceCenter readThermalState]";
        v4 = "%s Thermal state is within normal limits.";
        goto LABEL_6;
      }
      break;
    case 1:
      CDMOSLoggerForCategory(3);
      v3 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
      {
        v5 = 136315138;
        v6 = "-[CDMServiceCenter readThermalState]";
        _os_log_impl(&dword_21A2A0000, v3, OS_LOG_TYPE_INFO, "%s Thermal state is slightly elevated.", (uint8_t *)&v5, 0xCu);
      }
      break;
    case 2:
      CDMOSLoggerForCategory(3);
      v3 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
      {
        v5 = 136315394;
        v6 = "-[CDMServiceCenter readThermalState]";
        v7 = 2114;
        v8 = CFSTR("high");
        goto LABEL_14;
      }
      break;
    case 3:
      CDMOSLoggerForCategory(3);
      v3 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
      {
        v5 = 136315394;
        v6 = "-[CDMServiceCenter readThermalState]";
        v7 = 2114;
        v8 = CFSTR("critical. Performance may be impacted.");
LABEL_14:
        _os_log_error_impl(&dword_21A2A0000, v3, OS_LOG_TYPE_ERROR, "%s [ERR]: Thermal state is %{public}@", (uint8_t *)&v5, 0x16u);
      }
      break;
    default:
      CDMOSLoggerForCategory(3);
      v3 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
      {
        v5 = 136315138;
        v6 = "-[CDMServiceCenter readThermalState]";
        v4 = "%s Unknown thermal state.";
LABEL_6:
        _os_log_debug_impl(&dword_21A2A0000, v3, OS_LOG_TYPE_DEBUG, v4, (uint8_t *)&v5, 0xCu);
      }
      break;
  }

}

- (void)readMemoryPressure
{
  NSObject *v3;
  OS_dispatch_source *v4;
  OS_dispatch_source *memoryPressureSource;
  NSObject *v6;
  _QWORD v7[4];
  id v8;
  id location;

  dispatch_get_global_queue(0, 0);
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = (OS_dispatch_source *)dispatch_source_create(MEMORY[0x24BDAC9F0], 0, 6uLL, v3);
  memoryPressureSource = self->_memoryPressureSource;
  self->_memoryPressureSource = v4;

  objc_initWeak(&location, self);
  v6 = self->_memoryPressureSource;
  if (v6)
  {
    v7[0] = MEMORY[0x24BDAC760];
    v7[1] = 3221225472;
    v7[2] = __38__CDMServiceCenter_readMemoryPressure__block_invoke;
    v7[3] = &unk_24DCAB4E8;
    objc_copyWeak(&v8, &location);
    dispatch_source_set_event_handler(v6, v7);
    dispatch_activate((dispatch_object_t)self->_memoryPressureSource);
    objc_destroyWeak(&v8);
  }
  objc_destroyWeak(&location);
}

- (BOOL)areAssetsAvailable:(id)a3
{
  id v4;
  NSObject *v5;
  char v6;
  void *v7;
  NSString *v8;
  Class v9;
  void *v10;
  void *v11;
  void *v12;
  NSObject *v13;
  NSObject *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  NSObject *v19;
  NSString *v20;
  Class v21;
  void *v22;
  void *v23;
  NSObject *v24;
  char v25;
  NSObject *v26;
  NSObject *v27;
  id obj;
  uint64_t v30;
  NSObject *v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  id v36;
  id v37;
  uint8_t v38[128];
  uint8_t buf[4];
  const char *v40;
  __int16 v41;
  NSObject *v42;
  uint64_t v43;

  v43 = *MEMORY[0x24BDAC8D0];
  v37 = 0;
  -[CDMServiceCenter setupCDMAssetManagerWithError:](self, "setupCDMAssetManagerWithError:", &v37);
  v4 = v37;
  if (!v4)
  {
    +[CDMAssetsManager getSingletonCDMAssetsManager](CDMAssetsManager, "getSingletonCDMAssetsManager");
    v5 = objc_claimAutoreleasedReturnValue();
    -[CDMDynamicConfig graphName](self->_currentConfig, "graphName");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    if (v7)
    {
      -[CDMDynamicConfig graphName](self->_currentConfig, "graphName");
      v8 = (NSString *)objc_claimAutoreleasedReturnValue();
      v9 = NSClassFromString(v8);
      -[CDMDynamicConfig languageCode](self->_currentConfig, "languageCode");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      -[objc_class getAssetsForSetup:](v9, "getAssetsForSetup:", v10);
      v11 = (void *)objc_claimAutoreleasedReturnValue();

      -[CDMDynamicConfig assetPaths](self->_currentConfig, "assetPaths");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v36 = 0;
      v6 = -[NSObject areAssetsAvailableForCDMAssetsInfo:factorToAsset:withError:](v5, "areAssetsAvailableForCDMAssetsInfo:factorToAsset:withError:", v11, v12, &v36);
      v13 = v36;

      obj = v13;
      if (!v13)
      {
LABEL_28:

        goto LABEL_29;
      }
      CDMOSLoggerForCategory(3);
      v14 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136315394;
        v40 = "-[CDMServiceCenter areAssetsAvailable:]";
        v41 = 2114;
        v42 = v13;
        _os_log_error_impl(&dword_21A2A0000, v14, OS_LOG_TYPE_ERROR, "%s [ERR]: Assets availability check failed with error: %{public}@.", buf, 0x16u);
      }
    }
    else
    {
      v34 = 0u;
      v35 = 0u;
      v32 = 0u;
      v33 = 0u;
      +[CDMServiceCenterUtils getAvailableServiceGraphs:](CDMServiceCenterUtils, "getAvailableServiceGraphs:", self->_config);
      obj = (id)objc_claimAutoreleasedReturnValue();
      v15 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v32, v38, 16);
      if (!v15)
      {
        v11 = 0;
        v6 = 1;
        goto LABEL_27;
      }
      v16 = v15;
      v11 = 0;
      v14 = 0;
      v30 = *(_QWORD *)v33;
LABEL_11:
      v17 = 0;
      v18 = v11;
      v19 = v14;
      while (1)
      {
        if (*(_QWORD *)v33 != v30)
          objc_enumerationMutation(obj);
        v20 = *(NSString **)(*((_QWORD *)&v32 + 1) + 8 * v17);
        v21 = NSClassFromString(v20);
        -[CDMDynamicConfig languageCode](self->_currentConfig, "languageCode");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        -[objc_class getAssetsForSetup:](v21, "getAssetsForSetup:", v22);
        v11 = (void *)objc_claimAutoreleasedReturnValue();

        -[CDMDynamicConfig assetPaths](self->_currentConfig, "assetPaths");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        v31 = v19;
        v24 = v5;
        v25 = -[NSObject areAssetsAvailableForCDMAssetsInfo:factorToAsset:withError:](v5, "areAssetsAvailableForCDMAssetsInfo:factorToAsset:withError:", v11, v23, &v31);
        v14 = v31;

        if ((v25 & 1) == 0)
          break;
        ++v17;
        v18 = v11;
        v19 = v14;
        v5 = v24;
        if (v16 == v17)
        {
          v16 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v32, v38, 16);
          v6 = 1;
          if (v16)
            goto LABEL_11;
          v4 = 0;
          goto LABEL_24;
        }
      }
      CDMOSLoggerForCategory(3);
      v26 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v26, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 136315394;
        v40 = "-[CDMServiceCenter areAssetsAvailable:]";
        v41 = 2112;
        v42 = v20;
        _os_log_debug_impl(&dword_21A2A0000, v26, OS_LOG_TYPE_DEBUG, "%s Assets not available for graph: %@", buf, 0x16u);
      }

      v4 = 0;
      v5 = v24;
      if (!v14)
      {
        v6 = 0;
        goto LABEL_27;
      }
      CDMOSLoggerForCategory(3);
      v27 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136315394;
        v40 = "-[CDMServiceCenter areAssetsAvailable:]";
        v41 = 2114;
        v42 = v14;
        _os_log_error_impl(&dword_21A2A0000, v27, OS_LOG_TYPE_ERROR, "%s [ERR]: Assets availability check failed with error: %{public}@.", buf, 0x16u);
      }

      v6 = 0;
    }
LABEL_24:

LABEL_27:
    goto LABEL_28;
  }
  CDMOSLoggerForCategory(3);
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 136315138;
    v40 = "-[CDMServiceCenter areAssetsAvailable:]";
    _os_log_error_impl(&dword_21A2A0000, v5, OS_LOG_TYPE_ERROR, "%s [ERR]: Error occurs while initializing CDMAssetsManager. Return NO.", buf, 0xCu);
  }
  v6 = 0;
LABEL_29:

  return v6;
}

- (BOOL)handleXPCEvent:(id)a3 fromStream:(id)a4 withRegister:(id)a5
{
  id v7;
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  NSObject *v14;
  void *v15;
  id v16;
  uint64_t v17;
  CDMDataDispatcherContext *v18;
  CDMConfig *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  id v24;
  void *v25;
  void *v26;
  NSObject *v27;
  id v28;
  uint64_t v29;
  id v30;
  BOOL v31;
  NSObject *v32;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  id v38;
  id v39;
  uint8_t buf[4];
  const char *v41;
  __int16 v42;
  void *v43;
  uint64_t v44;

  v44 = *MEMORY[0x24BDAC8D0];
  v7 = a3;
  v8 = a4;
  v38 = a5;
  v9 = objc_alloc_init(MEMORY[0x24BE9E0F0]);
  v10 = (void *)MEMORY[0x24BDD17C8];
  objc_msgSend(MEMORY[0x24BDD1880], "UUID");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "UUIDString");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "stringWithFormat:", CFSTR("%@:0"), v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setIdA:", v13);

  CDMOSLoggerForCategory(3);
  v14 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
  {
    objc_msgSend(v9, "idA");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 136315394;
    v41 = "-[CDMServiceCenter handleXPCEvent:fromStream:withRegister:]";
    v42 = 2112;
    v43 = v34;
    _os_log_debug_impl(&dword_21A2A0000, v14, OS_LOG_TYPE_DEBUG, "%s Generated request id with UUID: %@", buf, 0x16u);

  }
  v35 = v9;
  +[CDMSELFLogUtil createSELFMetadataWithRequestId:](CDMSELFLogUtil, "createSELFMetadataWithRequestId:", v9);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = objc_alloc_init(MEMORY[0x24BDD1880]);
  +[XPCStreamEventUtils getXPCEventName:](XPCStreamEventUtils, "getXPCEventName:", v7);
  v17 = objc_claimAutoreleasedReturnValue();
  v18 = objc_alloc_init(CDMDataDispatcherContext);
  v37 = (void *)v17;
  +[CDMSELFLogUtil cdmXpcProcessingStarted:xpcType:xpcSystemEventType:serviceName:metadata:logMessage:dataDispatcherContext:](CDMSELFLogUtil, "cdmXpcProcessingStarted:xpcType:xpcSystemEventType:serviceName:metadata:logMessage:dataDispatcherContext:", v16, 1, +[CDMSELFLogUtil stringXPCSystemEventTypeToEnum:](CDMSELFLogUtil, "stringXPCSystemEventTypeToEnum:", v17), 0, v15, CFSTR("SELF CDM XPC Processing started log emitted"), v18);
  v19 = objc_alloc_init(CDMConfig);
  v20 = (void *)MEMORY[0x24BDBCEA0];
  -[CDMConfig defaultLocaleIdentifier](v19, "defaultLocaleIdentifier");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "localeWithLocaleIdentifier:", v21);
  v22 = (void *)objc_claimAutoreleasedReturnValue();

  v39 = 0;
  +[CDMServiceCenter getDynamicConfigWithAssetCollectionForGraph:withLocale:withError:withSelfMetadata:](CDMServiceCenter, "getDynamicConfigWithAssetCollectionForGraph:withLocale:withError:withSelfMetadata:", CFSTR("CDMNLUServiceGraph"), v22, &v39, 0);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v24 = v39;
  v36 = v7;
  if (v24)
  {
    v25 = v8;
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Failed to set up assets. Aborting XPC activity handling for (streamName=%@)."), v8);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    CDMOSLoggerForCategory(3);
    v27 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      v41 = "-[CDMServiceCenter handleXPCEvent:fromStream:withRegister:]";
      v42 = 2114;
      v43 = v26;
      _os_log_error_impl(&dword_21A2A0000, v27, OS_LOG_TYPE_ERROR, "%s [ERR]: %{public}@", buf, 0x16u);
    }

    v28 = v16;
    v29 = 3;
LABEL_12:
    +[CDMSELFLogUtil cdmXpcProcessingFailed:reason:errorCode:metadata:logMessage:dataDispatcherContext:](CDMSELFLogUtil, "cdmXpcProcessingFailed:reason:errorCode:metadata:logMessage:dataDispatcherContext:", v28, v29, 1, v15, v26, v18);

    v31 = 0;
    goto LABEL_13;
  }
  v30 = v7;
  v25 = v8;
  if ((objc_msgSend(v38, "handleXPCEvent:fromStream:currentConfig:withSelfMetadata:", v30, v8, v23, v15) & 1) == 0)
  {
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("[CDMServiceCenter -handleXPCEvent:fromStream:withRegister:] called with unhandled XPC event (streamName=%@, eventName=%@)"), v8, v37);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    CDMOSLoggerForCategory(3);
    v32 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      v41 = "-[CDMServiceCenter handleXPCEvent:fromStream:withRegister:]";
      v42 = 2114;
      v43 = v26;
      _os_log_error_impl(&dword_21A2A0000, v32, OS_LOG_TYPE_ERROR, "%s [ERR]: %{public}@", buf, 0x16u);
    }

    v28 = v16;
    v29 = 2;
    goto LABEL_12;
  }
  +[CDMSELFLogUtil cdmXpcProcessingEnded:metadata:logMessage:dataDispatcherContext:](CDMSELFLogUtil, "cdmXpcProcessingEnded:metadata:logMessage:dataDispatcherContext:", v16, v15, CFSTR("SELF CDM XPC Processing ended log emitted"), v18);
  v31 = 1;
LABEL_13:

  return v31;
}

- (BOOL)handleXPCActivity:(id)a3 fromIdentifier:(id)a4 withRegister:(id)a5
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  NSObject *v13;
  void *v14;
  id v15;
  CDMDataDispatcherContext *v16;
  CDMConfig *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  id v22;
  void *v23;
  NSObject *v24;
  id v25;
  uint64_t v26;
  void *v27;
  char v28;
  BOOL v29;
  NSObject *v30;
  void *v32;
  void *v33;
  id v34;
  id v35;
  id v36;
  uint8_t buf[4];
  const char *v38;
  __int16 v39;
  void *v40;
  uint64_t v41;

  v41 = *MEMORY[0x24BDAC8D0];
  v35 = a3;
  v7 = a4;
  v34 = a5;
  v8 = objc_alloc_init(MEMORY[0x24BE9E0F0]);
  v9 = (void *)MEMORY[0x24BDD17C8];
  objc_msgSend(MEMORY[0x24BDD1880], "UUID");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "UUIDString");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "stringWithFormat:", CFSTR("%@:0"), v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setIdA:", v12);

  CDMOSLoggerForCategory(3);
  v13 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
  {
    objc_msgSend(v8, "idA");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 136315394;
    v38 = "-[CDMServiceCenter handleXPCActivity:fromIdentifier:withRegister:]";
    v39 = 2112;
    v40 = v32;
    _os_log_debug_impl(&dword_21A2A0000, v13, OS_LOG_TYPE_DEBUG, "%s Generated request id with UUID: %@", buf, 0x16u);

  }
  v33 = v8;
  +[CDMSELFLogUtil createSELFMetadataWithRequestId:](CDMSELFLogUtil, "createSELFMetadataWithRequestId:", v8);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = objc_alloc_init(MEMORY[0x24BDD1880]);
  v16 = objc_alloc_init(CDMDataDispatcherContext);
  +[CDMSELFLogUtil cdmXpcProcessingStarted:xpcType:xpcSystemEventType:serviceName:metadata:logMessage:dataDispatcherContext:](CDMSELFLogUtil, "cdmXpcProcessingStarted:xpcType:xpcSystemEventType:serviceName:metadata:logMessage:dataDispatcherContext:", v15, 2, +[CDMSELFLogUtil stringXPCSystemEventTypeToEnum:](CDMSELFLogUtil, "stringXPCSystemEventTypeToEnum:", v7), 0, v14, CFSTR("SELF CDM XPC Processing started log emitted"), v16);
  v17 = objc_alloc_init(CDMConfig);
  v18 = (void *)MEMORY[0x24BDBCEA0];
  -[CDMConfig defaultLocaleIdentifier](v17, "defaultLocaleIdentifier");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "localeWithLocaleIdentifier:", v19);
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  v36 = 0;
  +[CDMServiceCenter getDynamicConfigWithAssetCollectionForGraph:withLocale:withError:withSelfMetadata:](CDMServiceCenter, "getDynamicConfigWithAssetCollectionForGraph:withLocale:withError:withSelfMetadata:", CFSTR("CDMNLUServiceGraph"), v20, &v36, 0);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = v36;
  if (v22)
  {
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Failed to set up assets. Aborting XPC activity handling for (identifier=%@)."), v7);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    CDMOSLoggerForCategory(3);
    v24 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      v38 = "-[CDMServiceCenter handleXPCActivity:fromIdentifier:withRegister:]";
      v39 = 2114;
      v40 = v23;
      _os_log_error_impl(&dword_21A2A0000, v24, OS_LOG_TYPE_ERROR, "%s [ERR]: %{public}@", buf, 0x16u);
    }

    v25 = v15;
    v26 = 3;
LABEL_12:
    +[CDMSELFLogUtil cdmXpcProcessingFailed:reason:errorCode:metadata:logMessage:dataDispatcherContext:](CDMSELFLogUtil, "cdmXpcProcessingFailed:reason:errorCode:metadata:logMessage:dataDispatcherContext:", v25, v26, 1, v14, v23, v16);

    v29 = 0;
    goto LABEL_13;
  }
  objc_msgSend(v21, "assetCollection");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  v28 = objc_msgSend(v34, "handleXPCActivity:fromIdentifier:withAssetCollection:withSelfMetadata:", v35, v7, v27, v14);

  if ((v28 & 1) == 0)
  {
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("[CDMServiceCenter -handleXPCActivity:fromStream:withRegister:] called with unhandled XPC activity (identifier=%@)"), v7);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    CDMOSLoggerForCategory(3);
    v30 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      v38 = "-[CDMServiceCenter handleXPCActivity:fromIdentifier:withRegister:]";
      v39 = 2114;
      v40 = v23;
      _os_log_error_impl(&dword_21A2A0000, v30, OS_LOG_TYPE_ERROR, "%s [ERR]: %{public}@", buf, 0x16u);
    }

    v25 = v15;
    v26 = 2;
    goto LABEL_12;
  }
  +[CDMSELFLogUtil cdmXpcProcessingEnded:metadata:logMessage:dataDispatcherContext:](CDMSELFLogUtil, "cdmXpcProcessingEnded:metadata:logMessage:dataDispatcherContext:", v15, v14, CFSTR("SELF CDM XPC Processing ended log emitted"), v16);
  v29 = 1;
LABEL_13:

  return v29;
}

- (void)setupAssetsForCDMAssetsInfo:(id)a3 withError:(id *)a4
{
  -[CDMServiceCenter setupAssetsForCDMAssetsInfo:withError:andSelfMetadata:dataDispatcherContext:](self, "setupAssetsForCDMAssetsInfo:withError:andSelfMetadata:dataDispatcherContext:", a3, a4, 0, 0);
}

- (id)getAssetPaths
{
  return -[CDMDynamicConfig assetPaths](self->_currentConfig, "assetPaths");
}

- (id)getServices
{
  return self->_services;
}

- (id)getCurrentConfig
{
  return self->_currentConfig;
}

- (id)getEnabledDAGServiceNames
{
  return self->_enabledDAGServiceNames;
}

- (id)getFoundationServices
{
  return self->_foundationServices;
}

- (int64_t)getSystemState
{
  return self->_systemState;
}

- (void)smService:(id)a3 didPublishCommand:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  void *v9;
  void *v10;
  int v11;
  const char *v12;
  __int16 v13;
  void *v14;
  __int16 v15;
  void *v16;
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  CDMOSLoggerForCategory(3);
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    objc_msgSend(v7, "commandName");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "serviceName");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = 136315650;
    v12 = "-[CDMServiceCenter smService:didPublishCommand:]";
    v13 = 2112;
    v14 = v9;
    v15 = 2112;
    v16 = v10;
    _os_log_impl(&dword_21A2A0000, v8, OS_LOG_TYPE_INFO, "%s Command: %@ Service: %@", (uint8_t *)&v11, 0x20u);

  }
  -[CDMServiceCenter handleCommand:forCallback:](self, "handleCommand:forCallback:", v7, self->_defaultCallback);

}

- (void)smService:(id)a3 didPublishRequest:(id)a4 withResponseCallback:(id)a5
{
  id v8;
  id v9;
  id v10;
  NSObject *v11;
  void *v12;
  void *v13;
  int v14;
  const char *v15;
  __int16 v16;
  void *v17;
  __int16 v18;
  void *v19;
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  CDMOSLoggerForCategory(3);
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
  {
    objc_msgSend(v9, "commandName");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "serviceName");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = 136315650;
    v15 = "-[CDMServiceCenter smService:didPublishRequest:withResponseCallback:]";
    v16 = 2112;
    v17 = v12;
    v18 = 2112;
    v19 = v13;
    _os_log_impl(&dword_21A2A0000, v11, OS_LOG_TYPE_INFO, "%s Command: %@ Service: %@", (uint8_t *)&v14, 0x20u);

  }
  -[CDMServiceCenter handleCommand:forCallback:](self, "handleCommand:forCallback:", v9, v10);

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_memoryPressureSource, 0);
  objc_storeStrong((id *)&self->transaction, 0);
  objc_storeStrong((id *)&self->_currentConfig, 0);
  objc_storeStrong((id *)&self->_cdmServiceCenterQueue, 0);
  objc_storeStrong((id *)&self->_serviceGraphRunner, 0);
  objc_storeStrong(&self->_defaultCallback, 0);
  objc_storeStrong((id *)&self->_commandServicesDict, 0);
  objc_storeStrong((id *)&self->_composerService, 0);
  objc_storeStrong((id *)&self->_graphServices, 0);
  objc_storeStrong((id *)&self->_foundationServices, 0);
  objc_storeStrong((id *)&self->_enabledDAGServiceNames, 0);
  objc_storeStrong((id *)&self->_dagServices, 0);
  objc_storeStrong((id *)&self->_services, 0);
  objc_storeStrong((id *)&self->_config, 0);
}

void __44__CDMServiceCenter_handleSetup_forCallback___block_invoke_365(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;

  v15 = a2;
  v5 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v6 = v15;
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", objc_msgSend(v6, "serviceState"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40);
    objc_msgSend(v6, "serviceName");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setObject:forKeyedSubscript:", v7, v9);

    objc_msgSend(v6, "cmdError");
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    if (v10)
    {
      objc_msgSend(v6, "cmdError");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40);
      objc_msgSend(v6, "serviceName");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "setObject:forKeyedSubscript:", v11, v13);

    }
    else
    {
      if (!v5)
      {
LABEL_7:

        goto LABEL_8;
      }
      v14 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40);
      objc_msgSend(v6, "serviceName");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "setObject:forKeyedSubscript:", v5, v11);
    }

    goto LABEL_7;
  }
LABEL_8:

}

void __44__CDMServiceCenter_handleSetup_forCallback___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;
  uint64_t v19;
  NSObject *v20;
  _QWORD v21[4];
  id v22;
  id v23;
  uint64_t v24;
  uint8_t buf[4];
  const char *v26;
  uint64_t v27;

  v27 = *MEMORY[0x24BDAC8D0];
  v5 = a2;
  v6 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v7 = v5;
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", objc_msgSend(v7, "serviceState"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40);
    objc_msgSend(v7, "serviceName");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setObject:forKeyedSubscript:", v8, v10);

    objc_msgSend(v7, "cmdError");
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    if (v11)
    {
      objc_msgSend(v7, "cmdError");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40);
      objc_msgSend(v7, "serviceName");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "setObject:forKeyedSubscript:", v12, v14);

    }
    else if (v6)
    {
      v15 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40);
      objc_msgSend(v7, "serviceName");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "setObject:forKeyedSubscript:", v6, v12);
    }
    else
    {
      if (!*(_BYTE *)(a1 + 72))
        goto LABEL_7;
      v16 = *(void **)(*(_QWORD *)(a1 + 32) + 64);
      objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40), "commandName");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "objectForKeyedSubscript:", v17);
      v12 = (void *)objc_claimAutoreleasedReturnValue();

      if (v12)
      {
        v21[0] = MEMORY[0x24BDAC760];
        v21[1] = 3221225472;
        v21[2] = __44__CDMServiceCenter_handleSetup_forCallback___block_invoke_3;
        v21[3] = &unk_24DCAB420;
        v18 = v7;
        v19 = *(_QWORD *)(a1 + 64);
        v22 = v18;
        v24 = v19;
        v23 = *(id *)(a1 + 40);
        objc_msgSend(v12, "enumerateObjectsUsingBlock:", v21);

      }
      else
      {
        CDMOSLoggerForCategory(3);
        v20 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 136315138;
          v26 = "-[CDMServiceCenter handleSetup:forCallback:]_block_invoke_2";
          _os_log_impl(&dword_21A2A0000, v20, OS_LOG_TYPE_INFO, "%s [WARN]: No services to warmup!", buf, 0xCu);
        }

      }
    }

LABEL_7:
  }

}

void __44__CDMServiceCenter_handleSetup_forCallback___block_invoke_371(uint64_t a1)
{
  uint64_t v2;
  NSObject *v3;
  uint64_t v4;
  uint64_t v5;
  NSObject *v6;
  _QWORD v7[7];
  _QWORD block[7];
  _QWORD v9[5];
  id v10;

  v9[0] = 0;
  v9[1] = v9;
  v9[2] = 0x3032000000;
  v9[3] = __Block_byref_object_copy_;
  v9[4] = __Block_byref_object_dispose_;
  objc_msgSend(*(id *)(a1 + 32), "serviceName");
  v10 = (id)objc_claimAutoreleasedReturnValue();
  v2 = mach_absolute_time();
  +[CDMDataDispatcherCompletionQueue getDataDispatcherCompletionQueue](CDMDataDispatcherCompletionQueue, "getDataDispatcherCompletionQueue");
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = MEMORY[0x24BDAC760];
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __44__CDMServiceCenter_handleSetup_forCallback___block_invoke_2_373;
  block[3] = &unk_24DCAC078;
  block[4] = *(_QWORD *)(a1 + 64);
  block[5] = v9;
  block[6] = v2;
  dispatch_async(v3, block);

  objc_msgSend(*(id *)(a1 + 32), "handleCommand:withCallback:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 56));
  v5 = mach_absolute_time();
  +[CDMDataDispatcherCompletionQueue getDataDispatcherCompletionQueue](CDMDataDispatcherCompletionQueue, "getDataDispatcherCompletionQueue");
  v6 = objc_claimAutoreleasedReturnValue();
  v7[0] = v4;
  v7[1] = 3221225472;
  v7[2] = __44__CDMServiceCenter_handleSetup_forCallback___block_invoke_374;
  v7[3] = &unk_24DCAC078;
  v7[4] = *(_QWORD *)(a1 + 64);
  v7[5] = v9;
  v7[6] = v5;
  dispatch_async(v6, v7);

  dispatch_group_leave(*(dispatch_group_t *)(a1 + 48));
  _Block_object_dispose(v9, 8);

}

void __44__CDMServiceCenter_handleSetup_forCallback___block_invoke_379(uint64_t a1)
{
  void *v2;
  NSObject *v3;
  id v4;
  uint8_t buf[4];
  const char *v6;
  uint64_t v7;

  v7 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), "objectForKey:", *(_QWORD *)(a1 + 32));
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  if (v2)
  {
    objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), "objectForKey:", *(_QWORD *)(a1 + 32));
    v4 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setFailureReason:", 1);

  }
  else
  {
    CDMOSLoggerForCategory(3);
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315138;
      v6 = "-[CDMServiceCenter handleSetup:forCallback:]_block_invoke";
      _os_log_impl(&dword_21A2A0000, v3, OS_LOG_TYPE_INFO, "%s [WARN]: Unable to retrieve SELF CDM setup metrics object! This log is likely unusable.", buf, 0xCu);
    }

  }
}

void __44__CDMServiceCenter_handleSetup_forCallback___block_invoke_380(uint64_t a1)
{
  void *v2;
  void *v3;
  NSObject *v4;
  id v5;
  uint8_t buf[4];
  const char *v7;
  uint64_t v8;

  v8 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), "objectForKey:", *(_QWORD *)(a1 + 32));
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  if (v2)
  {
    objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), "objectForKey:", *(_QWORD *)(a1 + 32));
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setFailureReason:", 2);

    objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), "objectForKey:", *(_QWORD *)(a1 + 32));
    v5 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setErrorCode:", objc_msgSend(*(id *)(a1 + 40), "code"));

  }
  else
  {
    CDMOSLoggerForCategory(3);
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315138;
      v7 = "-[CDMServiceCenter handleSetup:forCallback:]_block_invoke";
      _os_log_impl(&dword_21A2A0000, v4, OS_LOG_TYPE_INFO, "%s [WARN]: Unable to retrieve SELF CDM setup metrics object! This log is likely unusable.", buf, 0xCu);
    }

  }
}

void __44__CDMServiceCenter_handleSetup_forCallback___block_invoke_382(uint64_t a1)
{
  uint64_t v1;
  id v2;
  __int128 v3;
  _QWORD v4[4];
  __int128 v5;

  v1 = *(_QWORD *)(a1 + 32);
  v4[0] = MEMORY[0x24BDAC760];
  v4[1] = 3221225472;
  v4[2] = __44__CDMServiceCenter_handleSetup_forCallback___block_invoke_2_384;
  v4[3] = &unk_24DCAB538;
  v3 = *(_OWORD *)(a1 + 40);
  v2 = (id)v3;
  v5 = v3;
  +[CDMGraphServiceUtils setupGraphServices:completionHandler:](CDMGraphServiceUtils, "setupGraphServices:completionHandler:", v1, v4);

}

void __44__CDMServiceCenter_handleSetup_forCallback___block_invoke_2_384(uint64_t a1, char a2)
{
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = a2;
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
}

void __44__CDMServiceCenter_handleSetup_forCallback___block_invoke_2_373(uint64_t a1)
{
  void *v2;
  NSObject *v3;
  id v4;
  uint8_t buf[4];
  const char *v6;
  uint64_t v7;

  v7 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), "objectForKey:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40));
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  if (v2)
  {
    objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), "objectForKey:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40));
    v4 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setStartLogicalTimestampInNs:", SiriAnalyticsMachAbsoluteTimeGetNanoseconds());

  }
  else
  {
    CDMOSLoggerForCategory(3);
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315138;
      v6 = "-[CDMServiceCenter handleSetup:forCallback:]_block_invoke_2";
      _os_log_impl(&dword_21A2A0000, v3, OS_LOG_TYPE_INFO, "%s [WARN]: Unable to retrieve SELF CDM setup metrics object! This log is likely unusable.", buf, 0xCu);
    }

  }
}

void __44__CDMServiceCenter_handleSetup_forCallback___block_invoke_374(uint64_t a1)
{
  void *v2;
  NSObject *v3;
  id v4;
  uint8_t buf[4];
  const char *v6;
  uint64_t v7;

  v7 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), "objectForKey:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40));
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  if (v2)
  {
    objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), "objectForKey:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40));
    v4 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setEndLogicalTimestampInNs:", SiriAnalyticsMachAbsoluteTimeGetNanoseconds());

  }
  else
  {
    CDMOSLoggerForCategory(3);
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315138;
      v6 = "-[CDMServiceCenter handleSetup:forCallback:]_block_invoke";
      _os_log_impl(&dword_21A2A0000, v3, OS_LOG_TYPE_INFO, "%s [WARN]: Unable to retrieve SELF CDM setup metrics object! This log is likely unusable.", buf, 0xCu);
    }

  }
}

void __44__CDMServiceCenter_handleSetup_forCallback___block_invoke_3(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  int v5;
  id v6;

  v6 = a2;
  objc_msgSend(v6, "serviceName");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "serviceName");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v3, "isEqualToString:", v4);

  if (v5)
    objc_msgSend(v6, "handleCommand:withCallback:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), *(_QWORD *)(a1 + 40));

}

void __38__CDMServiceCenter_readMemoryPressure__block_invoke(uint64_t a1)
{
  dispatch_source_t *WeakRetained;
  dispatch_source_t *v2;
  int data;
  NSObject *v4;
  int v5;
  const char *v6;
  __int16 v7;
  const __CFString *v8;
  uint64_t v9;

  v9 = *MEMORY[0x24BDAC8D0];
  WeakRetained = (dispatch_source_t *)objc_loadWeakRetained((id *)(a1 + 32));
  v2 = WeakRetained;
  if (WeakRetained)
  {
    data = dispatch_source_get_data(WeakRetained[14]);
    if (data == 4)
    {
      CDMOSLoggerForCategory(3);
      v4 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
      {
        v5 = 136315394;
        v6 = "-[CDMServiceCenter readMemoryPressure]_block_invoke";
        v7 = 2114;
        v8 = CFSTR("critical");
        goto LABEL_10;
      }
LABEL_7:

      goto LABEL_8;
    }
    if (data == 2)
    {
      CDMOSLoggerForCategory(3);
      v4 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
      {
        v5 = 136315394;
        v6 = "-[CDMServiceCenter readMemoryPressure]_block_invoke";
        v7 = 2114;
        v8 = CFSTR("warning");
LABEL_10:
        _os_log_error_impl(&dword_21A2A0000, v4, OS_LOG_TYPE_ERROR, "%s [ERR]: Memory pressure %{public}@", (uint8_t *)&v5, 0x16u);
        goto LABEL_7;
      }
      goto LABEL_7;
    }
  }
LABEL_8:

}

void __45__CDMServiceCenter_handleWarmup_forCallback___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id v7;
  NSObject *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  int v15;
  const char *v16;
  __int16 v17;
  void *v18;
  __int16 v19;
  uint64_t v20;
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
  v5 = a2;
  v6 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v7 = v5;
    CDMOSLoggerForCategory(3);
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      objc_msgSend(v7, "serviceName");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = 136315650;
      v16 = "-[CDMServiceCenter handleWarmup:forCallback:]_block_invoke";
      v17 = 2112;
      v18 = v9;
      v19 = 2048;
      v20 = objc_msgSend(v7, "serviceState");
      _os_log_impl(&dword_21A2A0000, v8, OS_LOG_TYPE_INFO, "%s Warmed up Service: %@ State: %tu", (uint8_t *)&v15, 0x20u);

    }
    objc_msgSend(v7, "cmdError");
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    if (v10)
    {
      objc_msgSend(v7, "cmdError");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40);
      objc_msgSend(v7, "serviceName");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "setObject:forKeyedSubscript:", v11, v13);

    }
    else
    {
      if (!v6)
      {
LABEL_9:

        goto LABEL_10;
      }
      v14 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40);
      objc_msgSend(v7, "serviceName");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "setObject:forKeyedSubscript:", v6, v11);
    }

    goto LABEL_9;
  }
LABEL_10:

}

void __45__CDMServiceCenter_handleWarmup_forCallback___block_invoke_340(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  int v4;
  const char *v5;
  __int16 v6;
  void *v7;
  uint64_t v8;

  v8 = *MEMORY[0x24BDAC8D0];
  CDMOSLoggerForCategory(3);
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    objc_msgSend(*(id *)(a1 + 32), "serviceName");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = 136315394;
    v5 = "-[CDMServiceCenter handleWarmup:forCallback:]_block_invoke";
    v6 = 2112;
    v7 = v3;
    _os_log_impl(&dword_21A2A0000, v2, OS_LOG_TYPE_INFO, "%s Warmup %@", (uint8_t *)&v4, 0x16u);

  }
  objc_msgSend(*(id *)(a1 + 32), "handleCommand:withCallback:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 56));
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 48));
}

uint64_t __46__CDMServiceCenter_handleCommand_forCallback___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "handleWarmup:forCallback:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
}

void __46__CDMServiceCenter_handleCommand_forCallback___block_invoke_326(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  void *v5;
  NSObject *v6;
  id *v7;
  id *v8;
  id *v9;
  id v10;
  dispatch_block_t v11;
  NSObject *v12;
  void *v13;
  NSObject *v14;
  id v15;
  void *v16;
  void *v17;
  _QWORD v18[4];
  id v19;
  id v20;
  id v21;
  _QWORD block[4];
  id v23;
  id v24;
  id v25;
  uint8_t buf[4];
  const char *v27;
  __int16 v28;
  void *v29;
  uint64_t v30;

  v30 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0
    || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
    || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
    || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    CDMOSLoggerForCategory(3);
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
    {
      objc_msgSend(*(id *)(a1 + 32), "commandName");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 136315394;
      v27 = "-[CDMServiceCenter handleCommand:forCallback:]_block_invoke";
      v28 = 2112;
      v29 = v16;
      _os_log_debug_impl(&dword_21A2A0000, v4, OS_LOG_TYPE_DEBUG, "%s Dispatch supported command on _cdmServiceCenterQueue with user initiated priority 37. command=%@", buf, 0x16u);

    }
    v5 = *(void **)(a1 + 32);
    v6 = *(NSObject **)(*(_QWORD *)(a1 + 40) + 88);
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __46__CDMServiceCenter_handleCommand_forCallback___block_invoke_331;
    block[3] = &unk_24DCAC620;
    v7 = &v23;
    v23 = v3;
    v8 = &v24;
    v24 = v5;
    v9 = &v25;
    v25 = *(id *)(a1 + 56);
    v10 = v3;
    v11 = dispatch_block_create_with_qos_class(DISPATCH_BLOCK_ENFORCE_QOS_CLASS, QOS_CLASS_USER_INITIATED, 0, block);
    dispatch_async(v6, v11);

  }
  else
  {
    CDMOSLoggerForCategory(3);
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
    {
      v17 = *(void **)(a1 + 48);
      *(_DWORD *)buf = 136315394;
      v27 = "-[CDMServiceCenter handleCommand:forCallback:]_block_invoke_2";
      v28 = 2112;
      v29 = v17;
      _os_log_debug_impl(&dword_21A2A0000, v12, OS_LOG_TYPE_DEBUG, "%s Dispatch %@ on CDM service center queue with queue's priority.", buf, 0x16u);
    }

    v13 = *(void **)(a1 + 32);
    v14 = *(NSObject **)(*(_QWORD *)(a1 + 40) + 88);
    v18[0] = MEMORY[0x24BDAC760];
    v18[1] = 3221225472;
    v18[2] = __46__CDMServiceCenter_handleCommand_forCallback___block_invoke_333;
    v18[3] = &unk_24DCAC620;
    v7 = &v19;
    v19 = v3;
    v8 = &v20;
    v20 = v13;
    v9 = &v21;
    v21 = *(id *)(a1 + 56);
    v15 = v3;
    dispatch_async(v14, v18);
  }

}

uint64_t __46__CDMServiceCenter_handleCommand_forCallback___block_invoke_331(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "handleCommand:withCallback:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
}

uint64_t __46__CDMServiceCenter_handleCommand_forCallback___block_invoke_333(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "handleCommand:withCallback:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
}

uint64_t __27__CDMServiceCenter_cleanup__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "removeObserver:", *(_QWORD *)(a1 + 32));
}

void __35__CDMServiceCenter_initWithConfig___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  void *v8;
  void *v9;
  CDMGenericSendCommand *v10;
  id WeakRetained;
  int v12;
  const char *v13;
  __int16 v14;
  void *v15;
  __int16 v16;
  void *v17;
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  v5 = a2;
  v6 = a3;
  CDMOSLoggerForCategory(3);
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    objc_msgSend(v5, "commandName");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "localizedDescription");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = 136315650;
    v13 = "-[CDMServiceCenter initWithConfig:]_block_invoke";
    v14 = 2112;
    v15 = v8;
    v16 = 2112;
    v17 = v9;
    _os_log_impl(&dword_21A2A0000, v7, OS_LOG_TYPE_INFO, "%s [CDMCommandOutputCallback-Default] %@ : %@", (uint8_t *)&v12, 0x20u);

  }
  if (!v5 || v6)
  {
    v10 = [CDMGenericSendCommand alloc];
    -[CDMBaseCommand setCmdError:](v10, "setCmdError:", v6);
    WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
    objc_msgSend(WeakRetained, "handleCommand:forCallback:", v10, 0);

  }
  else
  {
    v10 = (CDMGenericSendCommand *)objc_loadWeakRetained((id *)(a1 + 32));
    -[CDMGenericSendCommand handleCommand:forCallback:](v10, "handleCommand:forCallback:", v5, 0);
  }

}

+ (id)getDynamicConfigWithAssetCollectionForGraph:(id)a3 withLocale:(id)a4 withError:(id *)a5 withSelfMetadata:(id)a6
{
  NSString *v9;
  id v10;
  id v11;
  NSObject *v12;
  CDMDynamicConfig *v13;
  void *v14;
  CDMDynamicConfig *v15;
  Class v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  id v21;
  id v22;
  void *v23;
  id v24;
  NSObject *v25;
  CDMDynamicConfig *v26;
  NSObject *v27;
  CDMDynamicConfig *v28;
  void *v29;
  id v30;
  void *v31;
  void *v32;
  CDMDynamicConfig *v33;
  void *v35;
  NSString *v36;
  id v37;
  uint8_t buf[4];
  const char *v39;
  __int16 v40;
  NSString *v41;
  __int16 v42;
  void *v43;
  uint64_t v44;

  v44 = *MEMORY[0x24BDAC8D0];
  v9 = (NSString *)a3;
  v10 = a4;
  v11 = a6;
  CDMOSLoggerForCategory(3);
  v12 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
  {
    objc_msgSend(v10, "localeIdentifier");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 136315650;
    v39 = "+[CDMServiceCenter getDynamicConfigWithAssetCollectionForGraph:withLocale:withError:withSelfMetadata:]";
    v40 = 2112;
    v41 = v9;
    v42 = 2112;
    v43 = v35;
    _os_log_debug_impl(&dword_21A2A0000, v12, OS_LOG_TYPE_DEBUG, "%s Get dynamic configs with asset collection for graph: %@ with locale: %@.", buf, 0x20u);

  }
  v13 = [CDMDynamicConfig alloc];
  objc_msgSend(v10, "localeIdentifier");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = -[CDMDynamicConfig initWithLanguageCode:](v13, "initWithLanguageCode:", v14);

  if (-[NSString length](v9, "length"))
  {
    v16 = NSClassFromString(v9);
    objc_msgSend(v10, "localeIdentifier");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    -[objc_class getAssetsForSetup:](v16, "getAssetsForSetup:", v17);
    v18 = (void *)objc_claimAutoreleasedReturnValue();

    +[CDMAssetsManager getSingletonCDMAssetsManager](CDMAssetsManager, "getSingletonCDMAssetsManager");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "localeIdentifier");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = +[CDMUAFAssetsManager getUAFClientManagersForLocale:withCDMAssetsInfo:](CDMUAFAssetsManager, "getUAFClientManagersForLocale:withCDMAssetsInfo:", v20, v18);

    +[CDMUAFAssetsManager reInitCDMUAFAssetsCache](CDMUAFAssetsManager, "reInitCDMUAFAssetsCache");
    v37 = 0;
    objc_msgSend(v19, "setupForLocale:cdmAssetsInfo:error:", v10, v18, &v37);
    v22 = v37;
    v23 = v22;
    if (v22)
    {
      v24 = objc_retainAutorelease(v22);
      *a5 = v24;
      CDMOSLoggerForCategory(3);
      v25 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136315394;
        v39 = "+[CDMServiceCenter getDynamicConfigWithAssetCollectionForGraph:withLocale:withError:withSelfMetadata:]";
        v40 = 2114;
        v41 = (NSString *)v24;
        _os_log_error_impl(&dword_21A2A0000, v25, OS_LOG_TYPE_ERROR, "%s [ERR]: CDM assets manager failed to setup with error: %{public}@.", buf, 0x16u);
      }

      v26 = v15;
    }
    else
    {
      objc_msgSend(v19, "getAssetsByFactorNamesForCDMAssetsInfo:assetDirPath:locale:", v18, 0, v10);
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      -[CDMDynamicConfig setAssetPaths:](v15, "setAssetPaths:", v29);
      -[CDMDynamicConfig assetCollection](v15, "assetCollection");
      v36 = v9;
      v30 = v11;
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v31, "getAssetPaths");
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      +[CDMSELFLogUtil cdmAssetsReported:metadata:dataDispatcherContext:](CDMSELFLogUtil, "cdmAssetsReported:metadata:dataDispatcherContext:", v32, v30, 0);

      v11 = v30;
      v9 = v36;
      v33 = v15;

    }
  }
  else
  {
    CDMOSLoggerForCategory(3);
    v27 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315138;
      v39 = "+[CDMServiceCenter getDynamicConfigWithAssetCollectionForGraph:withLocale:withError:withSelfMetadata:]";
      _os_log_error_impl(&dword_21A2A0000, v27, OS_LOG_TYPE_ERROR, "%s [ERR]: Some parameters are empty.", buf, 0xCu);
    }

    v28 = v15;
  }

  return v15;
}

@end
