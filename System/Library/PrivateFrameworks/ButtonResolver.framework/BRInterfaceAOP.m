@implementation BRInterfaceAOP

- (BRInterfaceAOP)init
{
  return -[BRInterfaceAOP initWithFastHaptics:](self, "initWithFastHaptics:", 0);
}

- (BRInterfaceAOP)initWithFastHaptics:(BOOL)a3
{
  BRInterfaceAOP *v4;
  BRInterfaceAOP *v5;
  void *v6;
  NSString **v7;
  NSString *v8;
  objc_class *v9;
  NSMutableArray *v10;
  NSMutableDictionary *v11;
  NSObject *v13;
  objc_super v14;

  v14.receiver = self;
  v14.super_class = (Class)BRInterfaceAOP;
  v4 = -[BRInterface init](&v14, sel_init);
  v5 = v4;
  if (v4)
  {
    v4->_fastHaptics = a3;
    v4->_service = 0;
    v4->_connect = 0;
    v4->_notificationPort = 0;
    v4->_arrivalNotification = 0;
    v4->_isReady = 0;
    v4->_maxAssetSlots = 0;
    v4->_notificationBlock = 0;
    v6 = dlopen("/System/Library/PrivateFrameworks/Haptics.framework/Haptics", 1);
    if (!v6)
      goto LABEL_8;
    v7 = (NSString **)dlsym(v6, "HAButtonHapticsLoaderServiceIsAvailableNotification");
    v8 = *v7;
    v5->_notificationName = *v7;
    if (!v8)
      goto LABEL_8;
    objc_msgSend((id)objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter"), "addObserver:selector:name:object:", v5, sel__receiveLoaderAvailableNotification_, v5->_notificationName, 0);
    v9 = -[objc_class sharedInstance](NSClassFromString(CFSTR("HAButtonHapticsLoader")), "sharedInstance");
    v5->_loader = v9;
    if (!v9
      || (v5->_freeSlots = 0,
          v10 = (NSMutableArray *)objc_alloc_init(MEMORY[0x24BDBCEB8]),
          (v5->_slotArray = v10) == 0)
      || (v11 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x24BDBCED8]), (v5->_stateDict = v11) == 0))
    {
LABEL_8:
      v13 = _BRLog_log_0;
      if (!_BRLog_log_0)
      {
        v13 = os_log_create("com.apple.ButtonResolver", "default");
        _BRLog_log_0 = (uint64_t)v13;
      }
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
        -[BRInterfaceAOP initWithFastHaptics:].cold.1(v13);

      return 0;
    }
  }
  return v5;
}

- (void)dealloc
{
  io_connect_t connect;
  io_object_t service;
  io_object_t arrivalNotification;
  IONotificationPort *notificationPort;
  objc_super v7;

  connect = self->_connect;
  if (connect)
  {
    IOServiceClose(connect);
    IOObjectRelease(self->_connect);
  }
  service = self->_service;
  if (service)
    IOObjectRelease(service);
  arrivalNotification = self->_arrivalNotification;
  if (arrivalNotification)
    IOObjectRelease(arrivalNotification);
  notificationPort = self->_notificationPort;
  if (notificationPort)
    IONotificationPortDestroy(notificationPort);

  v7.receiver = self;
  v7.super_class = (Class)BRInterfaceAOP;
  -[BRInterface dealloc](&v7, sel_dealloc);
}

- (id)description
{
  void *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)BRInterfaceAOP;
  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD16A8]), "initWithString:", -[BRInterface description](&v5, sel_description));
  objc_msgSend(v3, "appendFormat:", CFSTR("Service: %u;\n"), self->_service);
  objc_msgSend(v3, "appendFormat:", CFSTR("Connection: %u;\n"), self->_connect);
  objc_msgSend(v3, "appendFormat:", CFSTR("Loader: %@;\n"), self->_loader);
  objc_msgSend(v3, "appendFormat:", CFSTR("FreeSlots: %@;\n"), self->_freeSlots);
  objc_msgSend(v3, "appendFormat:", CFSTR("SlotData: %@;\n"), self->_slotArray);
  objc_msgSend(v3, "appendFormat:", CFSTR("StateData: %@;\n"), self->_stateDict);
  return v3;
}

- (id)propertyList
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  NSMutableIndexSet *freeSlots;
  uint64_t v8;
  uint64_t i;
  NSMutableArray *slotArray;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t j;
  void *v15;
  NSMutableDictionary *stateDict;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t k;
  void *v21;
  NSObject *v22;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  objc_super v32;
  _BYTE v33[128];
  _BYTE v34[128];
  uint64_t v35;

  v35 = *MEMORY[0x24BDAC8D0];
  v32.receiver = self;
  v32.super_class = (Class)BRInterfaceAOP;
  v3 = (void *)objc_msgSend(MEMORY[0x24BDBCED8], "dictionaryWithDictionary:", -[BRInterface propertyList](&v32, sel_propertyList));
  v4 = (void *)objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v5 = (void *)objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v6 = (void *)objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  freeSlots = self->_freeSlots;
  if (freeSlots)
  {
    v8 = -[NSMutableIndexSet firstIndex](freeSlots, "firstIndex");
    if (v8 != 0x7FFFFFFFFFFFFFFFLL)
    {
      for (i = v8;
            i != 0x7FFFFFFFFFFFFFFFLL;
            i = -[NSMutableIndexSet indexGreaterThanIndex:](self->_freeSlots, "indexGreaterThanIndex:", i))
      {
        objc_msgSend(v4, "addObject:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", i));
      }
    }
  }
  objc_msgSend(v3, "setObject:forKey:", v4, CFSTR("FreeSlots"));
  v30 = 0u;
  v31 = 0u;
  v28 = 0u;
  v29 = 0u;
  slotArray = self->_slotArray;
  v11 = -[NSMutableArray countByEnumeratingWithState:objects:count:](slotArray, "countByEnumeratingWithState:objects:count:", &v28, v34, 16);
  if (v11)
  {
    v12 = v11;
    v13 = *(_QWORD *)v29;
    do
    {
      for (j = 0; j != v12; ++j)
      {
        if (*(_QWORD *)v29 != v13)
          objc_enumerationMutation(slotArray);
        v15 = *(void **)(*((_QWORD *)&v28 + 1) + 8 * j);
        if (objc_msgSend(v15, "propertyList"))
          objc_msgSend(v5, "addObject:", objc_msgSend(v15, "propertyList"));
      }
      v12 = -[NSMutableArray countByEnumeratingWithState:objects:count:](slotArray, "countByEnumeratingWithState:objects:count:", &v28, v34, 16);
    }
    while (v12);
  }
  objc_msgSend(v3, "setObject:forKey:", v5, CFSTR("SlotData"));
  v26 = 0u;
  v27 = 0u;
  v24 = 0u;
  v25 = 0u;
  stateDict = self->_stateDict;
  v17 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:](stateDict, "countByEnumeratingWithState:objects:count:", &v24, v33, 16);
  if (v17)
  {
    v18 = v17;
    v19 = *(_QWORD *)v25;
    do
    {
      for (k = 0; k != v18; ++k)
      {
        if (*(_QWORD *)v25 != v19)
          objc_enumerationMutation(stateDict);
        v21 = (void *)-[NSMutableDictionary objectForKeyedSubscript:](self->_stateDict, "objectForKeyedSubscript:", *(_QWORD *)(*((_QWORD *)&v24 + 1) + 8 * k));
        if (objc_msgSend(v21, "propertyList"))
          objc_msgSend(v6, "addObject:", objc_msgSend(v21, "propertyList"));
      }
      v18 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:](stateDict, "countByEnumeratingWithState:objects:count:", &v24, v33, 16);
    }
    while (v18);
  }
  objc_msgSend(v3, "setObject:forKey:", v6, CFSTR("StateData"));
  v22 = _BRLog_log_0;
  if (!_BRLog_log_0)
  {
    v22 = os_log_create("com.apple.ButtonResolver", "default");
    _BRLog_log_0 = (uint64_t)v22;
  }
  if (os_log_type_enabled(v22, OS_LOG_TYPE_DEBUG))
    -[BRInterfaceAOP propertyList].cold.1();
  return v3;
}

+ (id)interface
{
  id result;
  int v3;
  __int128 v4;
  int v5;
  __int128 v6;
  int v7;
  uint64_t v8;

  v8 = *MEMORY[0x24BDAC8D0];
  if (MGGetSInt32Answer() == 1)
    return -[BRInterfaceAOP initWithFastHaptics:]([BRInterfaceAOP alloc], "initWithFastHaptics:", 0);
  v7 = -337121064;
  v6 = xmmword_215E61AB8;
  v5 = 450980336;
  v4 = xmmword_215E61ACC;
  v3 = MGIsDeviceOneOfType();
  result = 0;
  if (v3)
    return -[BRInterfaceAOP initWithFastHaptics:]([BRInterfaceAOP alloc], "initWithFastHaptics:", 1, &v4, 0);
  return result;
}

- (unint64_t)unusedAssetSlots
{
  unint64_t result;

  result = (unint64_t)self->_freeSlots;
  if (result)
    return objc_msgSend((id)result, "count");
  return result;
}

- (BOOL)setGlobalConfigs:(id)a3 error:(id *)a4
{
  BOOL v8;
  void *v10;

  -[BRInterface timestampWithLabel:](self, "timestampWithLabel:", objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@ %@"), NSStringFromSelector(a2), CFSTR("start")));
  if (-[BRInterfaceAOP _setGlobalAOPConfigsFromBRFConfigs:](self, "_setGlobalAOPConfigsFromBRFConfigs:", a3))
  {
    v8 = 0;
  }
  else
  {
    v10 = (void *)objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", *MEMORY[0x24BDD1100], -536870167, 0);
    v8 = v10 != 0;
    if (a4 && v10)
    {
      *a4 = v10;
      v8 = 1;
    }
  }
  -[BRInterface timestampWithLabel:](self, "timestampWithLabel:", objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@ %@"), NSStringFromSelector(a2), CFSTR("end")));
  return !v8;
}

- (BOOL)setConfigs:(id)a3 withAssets:(id)a4 forStates:(id)a5 error:(id *)a6
{
  BRInterfaceAOP *v10;
  id v11;
  unint64_t v12;
  unint64_t v13;
  void *v14;
  uint64_t v15;
  NSMutableDictionary *stateDict;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t i;
  void *v21;
  void *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t j;
  void *v27;
  void *v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  void *v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t k;
  void *v38;
  BRSlotData *v39;
  int v40;
  NSObject *v41;
  const char *v42;
  const char *v43;
  const char *v44;
  uint64_t v45;
  uint64_t v46;
  void *v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t m;
  void *v51;
  unint64_t v52;
  uint64_t v53;
  void *v54;
  void *v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  BRStateData *v61;
  NSMutableDictionary *v62;
  unint64_t v63;
  uint64_t v64;
  uint64_t v65;
  void *v66;
  void *v67;
  uint64_t v68;
  uint64_t v69;
  uint64_t v70;
  uint64_t v71;
  void *v72;
  uint64_t v73;
  uint64_t v74;
  uint64_t v75;
  uint64_t v76;
  NSMutableDictionary *v77;
  uint64_t v78;
  uint64_t v79;
  uint64_t v80;
  uint64_t v81;
  void *v82;
  void *v83;
  int v84;
  NSObject *v85;
  uint64_t v86;
  const char *v87;
  uint64_t v88;
  void *v90;
  uint64_t v91;
  uint64_t v92;
  void *v93;
  id *v94;
  id v96;
  id v97;
  id v98;
  id v99;
  id obj;
  id *p_isa;
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
  __int16 v118;
  __int128 v119;
  __int128 v120;
  __int128 v121;
  __int128 v122;
  __int128 v123;
  __int128 v124;
  __int128 v125;
  __int128 v126;
  __int128 v127;
  __int128 v128;
  __int128 v129;
  __int128 v130;
  __int128 v131;
  __int128 v132;
  __int128 v133;
  __int128 v134;
  uint64_t v135;
  _BYTE v136[128];
  _BYTE v137[128];
  _BYTE v138[128];
  uint8_t v139[128];
  uint8_t buf[4];
  const char *v141;
  __int16 v142;
  void *v143;
  __int16 v144;
  uint64_t v145;
  __int16 v146;
  const char *v147;
  __int16 v148;
  const char *v149;
  _BYTE v150[128];
  _BYTE v151[128];
  _BYTE v152[128];
  _BYTE v153[128];
  uint64_t v154;

  v10 = self;
  v154 = *MEMORY[0x24BDAC8D0];
  v135 = 0;
  -[BRInterface timestampWithLabel:](self, "timestampWithLabel:", objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@ %@"), NSStringFromSelector(a2), CFSTR("start")));
  v97 = a3;
  v94 = a6;
  if (!a3 || !a4)
  {
LABEL_133:
    v90 = (void *)MEMORY[0x24BDD1540];
    v91 = *MEMORY[0x24BDD1100];
    v92 = -536870206;
    goto LABEL_134;
  }
  v96 = (id)-[NSMutableIndexSet mutableCopy](v10->_freeSlots, "mutableCopy");
  obj = (id)objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  v11 = (id)objc_msgSend(objc_alloc(MEMORY[0x24BDBCEB8]), "initWithArray:copyItems:", v10->_slotArray, 1);
  v93 = (void *)objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  p_isa = (id *)&v10->super.super.isa;
  v98 = a5;
  v99 = a4;
  if (objc_msgSend(a5, "count"))
  {
    v12 = 0;
    do
    {
      v13 = objc_msgSend((id)objc_msgSend(a5, "objectAtIndexedSubscript:", v12), "unsignedIntegerValue");
      v14 = (void *)objc_msgSend(v97, "objectAtIndexedSubscript:", v12);
      v15 = objc_msgSend(v14, "objectForKeyedSubscript:", CFSTR("Speed"))
          ? objc_msgSend((id)objc_msgSend(v14, "objectForKeyedSubscript:", CFSTR("Speed")), "unsignedIntegerValue")
          : 3;
      if (v13 > 0x10)
        goto LABEL_133;
      v133 = 0u;
      v134 = 0u;
      v131 = 0u;
      v132 = 0u;
      stateDict = v10->_stateDict;
      v17 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:](stateDict, "countByEnumeratingWithState:objects:count:", &v131, v153, 16);
      if (v17)
      {
        v18 = v17;
        v19 = *(_QWORD *)v132;
        while (2)
        {
          for (i = 0; i != v18; ++i)
          {
            if (*(_QWORD *)v132 != v19)
              objc_enumerationMutation(stateDict);
            v21 = (void *)objc_msgSend(p_isa[13], "objectForKeyedSubscript:", *(_QWORD *)(*((_QWORD *)&v131 + 1) + 8 * i));
            if (objc_msgSend(v21, "state") == v13)
            {
              v129 = 0u;
              v130 = 0u;
              v127 = 0u;
              v128 = 0u;
              v22 = (void *)objc_msgSend(v21, "speedSlots");
              v23 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v127, v152, 16);
              if (v23)
              {
                v24 = v23;
                v25 = *(_QWORD *)v128;
                while (2)
                {
                  for (j = 0; j != v24; ++j)
                  {
                    if (*(_QWORD *)v128 != v25)
                      objc_enumerationMutation(v22);
                    v27 = *(void **)(*((_QWORD *)&v127 + 1) + 8 * j);
                    if (objc_msgSend(v27, "unsignedIntegerValue") == v15)
                    {
                      v28 = (void *)objc_msgSend(p_isa, "dataForSlot:fromArray:", objc_msgSend((id)objc_msgSend(v21, "speedSlots"), "objectForKeyedSubscript:", v27), v11);
                      if (v28)
                        objc_msgSend(v28, "setRefCount:", objc_msgSend(v28, "refCount") - 1);
                      goto LABEL_29;
                    }
                  }
                  v24 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v127, v152, 16);
                  if (v24)
                    continue;
                  break;
                }
              }
              goto LABEL_29;
            }
          }
          v18 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:](stateDict, "countByEnumeratingWithState:objects:count:", &v131, v153, 16);
          if (v18)
            continue;
          break;
        }
      }
LABEL_29:
      ++v12;
      a5 = v98;
      v10 = (BRInterfaceAOP *)p_isa;
      a4 = v99;
    }
    while (v12 < objc_msgSend(v98, "count"));
  }
  v125 = 0u;
  v126 = 0u;
  v123 = 0u;
  v124 = 0u;
  v29 = objc_msgSend(a4, "countByEnumeratingWithState:objects:count:", &v123, v151, 16);
  if (v29)
  {
    v30 = v29;
    v31 = *(_QWORD *)v124;
    do
    {
      v32 = 0;
      do
      {
        if (*(_QWORD *)v124 != v31)
          objc_enumerationMutation(a4);
        v33 = *(void **)(*((_QWORD *)&v123 + 1) + 8 * v32);
        if ((objc_msgSend(v33, "isNull") & 1) == 0)
        {
          v121 = 0u;
          v122 = 0u;
          v119 = 0u;
          v120 = 0u;
          v34 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v119, v150, 16);
          if (v34)
          {
            v35 = v34;
            v36 = *(_QWORD *)v120;
            while (2)
            {
              for (k = 0; k != v35; ++k)
              {
                if (*(_QWORD *)v120 != v36)
                  objc_enumerationMutation(v11);
                v38 = *(void **)(*((_QWORD *)&v119 + 1) + 8 * k);
                if (objc_msgSend((id)objc_msgSend(v38, "asset"), "isEqual:", v33))
                {
                  objc_msgSend(v38, "setRefCount:", objc_msgSend(v38, "refCount") + 1);
                  goto LABEL_52;
                }
              }
              v35 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v119, v150, 16);
              if (v35)
                continue;
              break;
            }
          }
          v39 = objc_alloc_init(BRSlotData);
          if ((objc_msgSend(v33, "isNull") & 1) == 0)
          {
            v118 = 0;
            v40 = objc_msgSend(p_isa[10], "hapticAssetType:hasAudio:hasHaptic:error:", objc_msgSend(v33, "type"), (char *)&v118 + 1, &v118, &v135);
            v41 = _BRLog_log_0;
            if (!_BRLog_log_0)
            {
              v41 = os_log_create("com.apple.ButtonResolver", "default");
              _BRLog_log_0 = (uint64_t)v41;
            }
            if (os_log_type_enabled(v41, OS_LOG_TYPE_DEBUG))
            {
              v42 = "NO";
              if (HIBYTE(v118))
                v43 = "YES";
              else
                v43 = "NO";
              if ((_BYTE)v118)
                v44 = "YES";
              else
                v44 = "NO";
              *(_DWORD *)buf = 136316162;
              if (v40)
                v42 = "YES";
              v141 = "-[BRInterfaceAOP setConfigs:withAssets:forStates:error:]";
              v142 = 2112;
              v143 = v33;
              v144 = 2080;
              v145 = (uint64_t)v43;
              v146 = 2080;
              v147 = v44;
              v148 = 2080;
              v149 = v42;
              _os_log_debug_impl(&dword_215E56000, v41, OS_LOG_TYPE_DEBUG, "%s get asset components: %@ audio: %s haptic: %s success: %s", buf, 0x34u);
              if (!v40)
                goto LABEL_136;
            }
            else if (!v40)
            {
              goto LABEL_136;
            }
            objc_msgSend(v33, "setHasAudio:", HIBYTE(v118));
            objc_msgSend(v33, "setHasHaptic:", v118);
            a4 = v99;
          }
          -[BRSlotData setAsset:](v39, "setAsset:", v33);
          -[BRSlotData setRefCount:](v39, "setRefCount:", 1);
          objc_msgSend(v11, "addObject:", v39);
        }
LABEL_52:
        ++v32;
      }
      while (v32 != v30);
      v45 = objc_msgSend(a4, "countByEnumeratingWithState:objects:count:", &v123, v151, 16);
      v30 = v45;
    }
    while (v45);
  }
  objc_msgSend(p_isa, "timestampWithLabel:", objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@ %@"), NSStringFromSelector(a2), CFSTR("hapticComponents")));
  v116 = 0u;
  v117 = 0u;
  v114 = 0u;
  v115 = 0u;
  v46 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v114, v139, 16);
  v47 = v98;
  if (v46)
  {
    v48 = v46;
    v49 = *(_QWORD *)v115;
    do
    {
      for (m = 0; m != v48; ++m)
      {
        if (*(_QWORD *)v115 != v49)
          objc_enumerationMutation(v11);
        v51 = *(void **)(*((_QWORD *)&v114 + 1) + 8 * m);
        if (!objc_msgSend(v51, "refCount"))
        {
          objc_msgSend(v96, "addIndex:", objc_msgSend((id)objc_msgSend(v51, "slot"), "unsignedIntegerValue"));
          objc_msgSend(v93, "addObject:", v51);
        }
      }
      v48 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v114, v139, 16);
    }
    while (v48);
  }
  objc_msgSend(v11, "removeObjectsInArray:", v93);
  if (!objc_msgSend(v98, "count"))
  {
LABEL_108:
    v10 = (BRInterfaceAOP *)p_isa;
    if (!objc_msgSend(p_isa, "disableStates:clearAsset:error:", v47, 0, &v135))
      goto LABEL_129;
    objc_msgSend(p_isa, "timestampWithLabel:", objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@ %@"), NSStringFromSelector(a2), CFSTR("disabledStates")));
    v104 = 0u;
    v105 = 0u;
    v102 = 0u;
    v103 = 0u;
    v78 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v102, v136, 16);
    if (v78)
    {
      v79 = v78;
      v80 = *(_QWORD *)v103;
      do
      {
        v81 = 0;
        do
        {
          if (*(_QWORD *)v103 != v80)
            objc_enumerationMutation(v11);
          v82 = *(void **)(*((_QWORD *)&v102 + 1) + 8 * v81);
          if ((objc_msgSend(v82, "isProgrammed") & 1) == 0)
          {
            v83 = (void *)objc_msgSend(v82, "asset");
            if ((objc_msgSend(v83, "isNull") & 1) == 0)
            {
              v84 = -[HAButtonHapticsLoader loadButtonHapticOfType:withParameters:atSlot:error:](v10->_loader, "loadButtonHapticOfType:withParameters:atSlot:error:", objc_msgSend(v83, "type"), objc_msgSend(v83, "parameters"), objc_msgSend((id)objc_msgSend(v82, "slot"), "integerValue"), &v135);
              v85 = _BRLog_log_0;
              if (!_BRLog_log_0)
              {
                v85 = os_log_create("com.apple.ButtonResolver", "default");
                _BRLog_log_0 = (uint64_t)v85;
              }
              if (os_log_type_enabled(v85, OS_LOG_TYPE_DEBUG))
              {
                v86 = objc_msgSend(v82, "slot");
                *(_DWORD *)buf = 136315906;
                v87 = "NO";
                if (v84)
                  v87 = "YES";
                v141 = "-[BRInterfaceAOP setConfigs:withAssets:forStates:error:]";
                v142 = 2112;
                v143 = v83;
                v144 = 2112;
                v145 = v86;
                v146 = 2080;
                v147 = v87;
                _os_log_debug_impl(&dword_215E56000, v85, OS_LOG_TYPE_DEBUG, "%s loaded asset: %@ at slot: %@ success: %s", buf, 0x2Au);
              }
              v10 = (BRInterfaceAOP *)p_isa;
              if (!v84)
                goto LABEL_129;
            }
            objc_msgSend(v82, "setIsProgrammed:", 1);
          }
          ++v81;
        }
        while (v79 != v81);
        v88 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v102, v136, 16);
        v79 = v88;
      }
      while (v88);
    }
    -[BRInterface timestampWithLabel:](v10, "timestampWithLabel:", objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@ %@"), NSStringFromSelector(a2), CFSTR("loadedHaptics")));
    if (-[BRInterfaceAOP _setStateAOPConfigsFromStateData:andSlotData:](v10, "_setStateAOPConfigsFromStateData:andSlotData:", obj, v11))
    {

      v10->_freeSlots = (NSMutableIndexSet *)v96;
      v10->_slotArray = (NSMutableArray *)v11;
      -[BRInterfaceAOP mergeStateChanges:into:](v10, "mergeStateChanges:into:", obj, v10->_stateDict);
      goto LABEL_129;
    }
    v90 = (void *)MEMORY[0x24BDD1540];
    v91 = *MEMORY[0x24BDD1100];
    v92 = -536870167;
LABEL_134:
    v135 = objc_msgSend(v90, "errorWithDomain:code:userInfo:", v91, v92, 0);
    goto LABEL_129;
  }
  v52 = 0;
  while (1)
  {
    v53 = objc_msgSend((id)objc_msgSend(v47, "objectAtIndexedSubscript:", v52), "unsignedIntegerValue");
    v54 = (void *)objc_msgSend(a4, "objectAtIndexedSubscript:", v52);
    v55 = (void *)objc_msgSend(v97, "objectAtIndexedSubscript:", v52);
    if (objc_msgSend(v55, "objectForKeyedSubscript:", CFSTR("Speed")))
      v56 = objc_msgSend((id)objc_msgSend(v55, "objectForKeyedSubscript:", CFSTR("Speed")), "unsignedIntegerValue");
    else
      v56 = 3;
    v112 = 0u;
    v113 = 0u;
    v110 = 0u;
    v111 = 0u;
    v57 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v110, v138, 16);
    if (v57)
    {
      v58 = v57;
      v59 = *(_QWORD *)v111;
LABEL_81:
      v60 = 0;
      while (1)
      {
        if (*(_QWORD *)v111 != v59)
          objc_enumerationMutation(obj);
        v61 = (BRStateData *)objc_msgSend(obj, "objectForKey:", *(_QWORD *)(*((_QWORD *)&v110 + 1) + 8 * v60));
        if (-[BRStateData state](v61, "state") == v53)
          break;
        if (v58 == ++v60)
        {
          v58 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v110, v138, 16);
          if (v58)
            goto LABEL_81;
          goto LABEL_89;
        }
      }
      if (v61)
        goto LABEL_90;
    }
LABEL_89:
    v61 = -[BRStateData initWithState:enabled:]([BRStateData alloc], "initWithState:enabled:", v53, 1);
LABEL_90:
    v62 = -[BRStateData speedConfigs](v61, "speedConfigs");
    v63 = 0x24BDD1000uLL;
    -[NSMutableDictionary setObject:forKeyedSubscript:](v62, "setObject:forKeyedSubscript:", v55, objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", v56));
    if (objc_msgSend(v54, "isNull"))
    {
      v64 = -[BRStateData speedSlots](v61, "speedSlots");
      v65 = objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", v56);
      v66 = (void *)v64;
      v67 = &unk_24D4A5CD0;
LABEL_103:
      objc_msgSend(v66, "setObject:forKeyedSubscript:", v67, v65);
      goto LABEL_104;
    }
    v108 = 0u;
    v109 = 0u;
    v106 = 0u;
    v107 = 0u;
    v68 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v106, v137, 16);
    if (v68)
      break;
LABEL_104:
    objc_msgSend(obj, "setObject:forKeyedSubscript:", v61, objc_msgSend(*(id *)(v63 + 1760), "numberWithUnsignedInteger:", v53));
    ++v52;
    v47 = v98;
    a4 = v99;
    if (v52 >= objc_msgSend(v98, "count"))
      goto LABEL_108;
  }
  v69 = v68;
  v70 = *(_QWORD *)v107;
LABEL_94:
  v71 = 0;
  while (1)
  {
    if (*(_QWORD *)v107 != v70)
      objc_enumerationMutation(v11);
    v72 = *(void **)(*((_QWORD *)&v106 + 1) + 8 * v71);
    if (objc_msgSend(v54, "isEqual:", objc_msgSend(v72, "asset")))
      break;
    if (v69 == ++v71)
    {
      v69 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v106, v137, 16);
      v63 = 0x24BDD1000;
      if (v69)
        goto LABEL_94;
      goto LABEL_104;
    }
  }
  if (objc_msgSend(v72, "slot"))
  {
    v73 = objc_msgSend(v72, "slot");
    v74 = -[BRStateData speedSlots](v61, "speedSlots");
    v63 = 0x24BDD1000uLL;
    v65 = objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", v56);
    v66 = (void *)v74;
    v67 = (void *)v73;
    goto LABEL_103;
  }
  v63 = 0x24BDD1000uLL;
  if (objc_msgSend(v96, "count"))
  {
    v75 = objc_msgSend(v96, "firstIndex");
    objc_msgSend(v96, "removeIndex:", v75);
    objc_msgSend(v72, "setSlot:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", v75));
    v76 = objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", v75);
    v77 = -[BRStateData speedSlots](v61, "speedSlots");
    -[NSMutableDictionary setObject:forKeyedSubscript:](v77, "setObject:forKeyedSubscript:", v76, objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", v56));
    objc_msgSend(v72, "setIsProgrammed:", 0);
    goto LABEL_104;
  }
  v135 = objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", *MEMORY[0x24BDD1100], -536870210, 0);
LABEL_136:
  v10 = (BRInterfaceAOP *)p_isa;
LABEL_129:
  if (v94 && v135)
    *v94 = (id)v135;
  -[BRInterface timestampWithLabel:](v10, "timestampWithLabel:", objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@ %@"), NSStringFromSelector(a2), CFSTR("end")));
  return v135 == 0;
}

- (BOOL)enableStates:(id)a3 error:(id *)a4
{
  const char *v5;
  unint64_t v7;
  void *v8;
  uint64_t i;
  unint64_t v10;
  unint64_t v11;
  NSMutableDictionary *stateDict;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  id v18;
  id v19;
  BOOL v20;
  uint64_t v21;
  void *v22;
  const char *v24;
  id obj;
  uint64_t v27;
  uint64_t v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  _BYTE v37[128];
  _BYTE v38[128];
  uint64_t v39;

  v5 = a2;
  v39 = *MEMORY[0x24BDAC8D0];
  v7 = 0x24BDD1000uLL;
  -[BRInterface timestampWithLabel:](self, "timestampWithLabel:", objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@ %@"), NSStringFromSelector(a2), CFSTR("start")));
  v8 = (void *)objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  v33 = 0u;
  v34 = 0u;
  v35 = 0u;
  v36 = 0u;
  obj = a3;
  v28 = objc_msgSend(a3, "countByEnumeratingWithState:objects:count:", &v33, v38, 16);
  if (v28)
  {
    v27 = *(_QWORD *)v34;
    v24 = v5;
    while (2)
    {
      for (i = 0; i != v28; ++i)
      {
        if (*(_QWORD *)v34 != v27)
          objc_enumerationMutation(obj);
        v10 = objc_msgSend(*(id *)(*((_QWORD *)&v33 + 1) + 8 * i), "unsignedIntegerValue");
        if (v10 > 0x10
          || (v11 = v10,
              v31 = 0u,
              v32 = 0u,
              v29 = 0u,
              v30 = 0u,
              stateDict = self->_stateDict,
              (v13 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:](stateDict, "countByEnumeratingWithState:objects:count:", &v29, v37, 16)) == 0))
        {
LABEL_21:
          v21 = -536870206;
          v5 = v24;
          v7 = 0x24BDD1000uLL;
          goto LABEL_22;
        }
        v14 = v13;
        v15 = *(_QWORD *)v30;
LABEL_9:
        v16 = 0;
        while (1)
        {
          if (*(_QWORD *)v30 != v15)
            objc_enumerationMutation(stateDict);
          v17 = (void *)-[NSMutableDictionary objectForKeyedSubscript:](self->_stateDict, "objectForKeyedSubscript:", *(_QWORD *)(*((_QWORD *)&v29 + 1) + 8 * v16));
          if (objc_msgSend(v17, "state") == v11)
            break;
          if (v14 == ++v16)
          {
            v14 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:](stateDict, "countByEnumeratingWithState:objects:count:", &v29, v37, 16);
            if (v14)
              goto LABEL_9;
            goto LABEL_21;
          }
        }
        v18 = (id)objc_msgSend(v17, "copy");
        if (!v18)
          goto LABEL_21;
        v19 = v18;
        objc_msgSend(v18, "setEnabled:", 1);
        objc_msgSend(v8, "setObject:forKeyedSubscript:", v19, objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", v11));
      }
      v5 = v24;
      v7 = 0x24BDD1000;
      v28 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v33, v38, 16);
      if (v28)
        continue;
      break;
    }
  }
  if (-[BRInterfaceAOP _setStateAOPConfigsFromStateData:andSlotData:](self, "_setStateAOPConfigsFromStateData:andSlotData:", v8, self->_slotArray))
  {
    -[BRInterfaceAOP mergeStateChanges:into:](self, "mergeStateChanges:into:", v8, self->_stateDict);
    v20 = 0;
  }
  else
  {
    v21 = -536870167;
LABEL_22:
    v22 = (void *)objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", *MEMORY[0x24BDD1100], v21, 0);
    v20 = v22 != 0;
    if (a4 && v22)
    {
      *a4 = v22;
      v20 = 1;
    }
  }
  -[BRInterface timestampWithLabel:](self, "timestampWithLabel:", objc_msgSend(*(id *)(v7 + 1992), "stringWithFormat:", CFSTR("%@ %@"), NSStringFromSelector(v5), CFSTR("end")));
  return !v20;
}

- (BOOL)disableStates:(id)a3 clearAsset:(BOOL)a4 error:(id *)a5
{
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  unint64_t v10;
  unint64_t v11;
  NSMutableDictionary *stateDict;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t j;
  void *v17;
  id v18;
  id v19;
  uint64_t v20;
  void *v21;
  void *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t k;
  id v27;
  void *v28;
  BOOL v29;
  const char *v30;
  unint64_t v31;
  uint64_t v33;
  void *v34;
  id obj;
  uint64_t v38;
  _BOOL4 v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  id v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  _BYTE v60[128];
  _BYTE v61[128];
  _BYTE v62[128];
  _BYTE v63[128];
  uint64_t v64;

  v39 = a4;
  v64 = *MEMORY[0x24BDAC8D0];
  -[BRInterface timestampWithLabel:](self, "timestampWithLabel:", objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@ %@"), NSStringFromSelector(a2), CFSTR("start")));
  v43 = (id)objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  v56 = 0u;
  v57 = 0u;
  v58 = 0u;
  v59 = 0u;
  obj = a3;
  v7 = objc_msgSend(a3, "countByEnumeratingWithState:objects:count:", &v56, v63, 16);
  if (v7)
  {
    v8 = v7;
    v41 = *(_QWORD *)v57;
    while (2)
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v57 != v41)
          objc_enumerationMutation(obj);
        v10 = objc_msgSend(*(id *)(*((_QWORD *)&v56 + 1) + 8 * i), "unsignedIntegerValue");
        if (v10 > 0x10)
        {
          v33 = -536870206;
          goto LABEL_45;
        }
        v11 = v10;
        v54 = 0u;
        v55 = 0u;
        v52 = 0u;
        v53 = 0u;
        stateDict = self->_stateDict;
        v13 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:](stateDict, "countByEnumeratingWithState:objects:count:", &v52, v62, 16);
        if (v13)
        {
          v14 = v13;
          v15 = *(_QWORD *)v53;
          while (2)
          {
            for (j = 0; j != v14; ++j)
            {
              if (*(_QWORD *)v53 != v15)
                objc_enumerationMutation(stateDict);
              v17 = (void *)-[NSMutableDictionary objectForKeyedSubscript:](self->_stateDict, "objectForKeyedSubscript:", *(_QWORD *)(*((_QWORD *)&v52 + 1) + 8 * j));
              if (objc_msgSend(v17, "state") == v11)
              {
                v18 = (id)objc_msgSend(v17, "copy");
                if (v18)
                {
                  v19 = v18;
                  objc_msgSend(v18, "setEnabled:", 0);
                  objc_msgSend(v43, "setObject:forKeyedSubscript:", v19, objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", v11));
                }
                goto LABEL_18;
              }
            }
            v14 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:](stateDict, "countByEnumeratingWithState:objects:count:", &v52, v62, 16);
            if (v14)
              continue;
            break;
          }
        }
LABEL_18:
        ;
      }
      v8 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v56, v63, 16);
      if (v8)
        continue;
      break;
    }
  }
  if (-[BRInterfaceAOP _setStateAOPConfigsFromStateData:andSlotData:](self, "_setStateAOPConfigsFromStateData:andSlotData:", v43, self->_slotArray))
  {
    if (v39)
    {
      v50 = 0u;
      v51 = 0u;
      v48 = 0u;
      v49 = 0u;
      v40 = objc_msgSend(v43, "countByEnumeratingWithState:objects:count:", &v48, v61, 16);
      if (v40)
      {
        v38 = *(_QWORD *)v49;
        do
        {
          v20 = 0;
          do
          {
            if (*(_QWORD *)v49 != v38)
              objc_enumerationMutation(v43);
            v42 = v20;
            v21 = (void *)objc_msgSend(v43, "objectForKeyedSubscript:", *(_QWORD *)(*((_QWORD *)&v48 + 1) + 8 * v20));
            v44 = 0u;
            v45 = 0u;
            v46 = 0u;
            v47 = 0u;
            v22 = (void *)objc_msgSend(v21, "speedSlots");
            v23 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v44, v60, 16);
            if (v23)
            {
              v24 = v23;
              v25 = *(_QWORD *)v45;
              do
              {
                for (k = 0; k != v24; ++k)
                {
                  if (*(_QWORD *)v45 != v25)
                    objc_enumerationMutation(v22);
                  v27 = -[BRInterfaceAOP dataForSlot:fromArray:](self, "dataForSlot:fromArray:", objc_msgSend((id)objc_msgSend(v21, "speedSlots"), "objectForKeyedSubscript:", *(_QWORD *)(*((_QWORD *)&v44 + 1) + 8 * k)), self->_slotArray);
                  if (v27)
                  {
                    v28 = v27;
                    objc_msgSend(v27, "setRefCount:", objc_msgSend(v27, "refCount") - 1);
                    if (!objc_msgSend(v28, "refCount"))
                    {
                      -[NSMutableIndexSet addIndex:](self->_freeSlots, "addIndex:", objc_msgSend((id)objc_msgSend(v28, "slot"), "unsignedIntegerValue"));
                      -[NSMutableArray removeObject:](self->_slotArray, "removeObject:", v28);
                    }
                  }
                }
                v24 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v44, v60, 16);
              }
              while (v24);
            }
            v20 = v42 + 1;
          }
          while (v42 + 1 != v40);
          v40 = objc_msgSend(v43, "countByEnumeratingWithState:objects:count:", &v48, v61, 16);
        }
        while (v40);
      }
      -[NSMutableDictionary removeObjectsForKeys:](self->_stateDict, "removeObjectsForKeys:", obj);
    }
    else
    {
      -[BRInterfaceAOP mergeStateChanges:into:](self, "mergeStateChanges:into:", v43, self->_stateDict);
    }
    v29 = 0;
LABEL_42:
    v30 = a2;
    v31 = 0x24BDD1000uLL;
    goto LABEL_43;
  }
  v33 = -536870167;
LABEL_45:
  v34 = (void *)objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", *MEMORY[0x24BDD1100], v33, 0);
  v29 = v34 != 0;
  if (!a5)
    goto LABEL_42;
  v30 = a2;
  v31 = 0x24BDD1000;
  if (v34)
  {
    *a5 = v34;
    v29 = 1;
  }
LABEL_43:
  -[BRInterface timestampWithLabel:](self, "timestampWithLabel:", objc_msgSend(*(id *)(v31 + 1992), "stringWithFormat:", CFSTR("%@ %@"), NSStringFromSelector(v30), CFSTR("end")));
  return !v29;
}

- (id)dataForSlot:(id)a3 fromArray:(id)a4
{
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
  if (!a3)
    return 0;
  if (objc_msgSend(a3, "integerValue") == -1)
    return 0;
  v14 = 0u;
  v15 = 0u;
  v12 = 0u;
  v13 = 0u;
  v6 = objc_msgSend(a4, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (!v6)
    return 0;
  v7 = v6;
  v8 = *(_QWORD *)v13;
LABEL_5:
  v9 = 0;
  while (1)
  {
    if (*(_QWORD *)v13 != v8)
      objc_enumerationMutation(a4);
    v10 = *(void **)(*((_QWORD *)&v12 + 1) + 8 * v9);
    if ((objc_msgSend(a3, "isEqualToNumber:", objc_msgSend(v10, "slot")) & 1) != 0)
      return v10;
    if (v7 == ++v9)
    {
      v7 = objc_msgSend(a4, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
      v10 = 0;
      if (v7)
        goto LABEL_5;
      return v10;
    }
  }
}

- (void)mergeStateChanges:(id)a3 into:(id)a4
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
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
  v6 = objc_msgSend(a3, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v11;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v11 != v8)
          objc_enumerationMutation(a3);
        objc_msgSend(a4, "setObject:forKeyedSubscript:", objc_msgSend(a3, "objectForKeyedSubscript:", *(_QWORD *)(*((_QWORD *)&v10 + 1) + 8 * v9)), *(_QWORD *)(*((_QWORD *)&v10 + 1) + 8 * v9));
        ++v9;
      }
      while (v7 != v9);
      v7 = objc_msgSend(a3, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    }
    while (v7);
  }
}

- (BOOL)playState:(unint64_t)a3 forSpeed:(unint64_t)a4 error:(id *)a5
{
  kern_return_t v8;
  void *v10;
  uint64_t input;
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  -[BRInterface timestampWithLabel:](self, "timestampWithLabel:", objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@ %@"), NSStringFromSelector(a2), CFSTR("start"), a4, a3, 0, v12));
  v8 = IOConnectCallScalarMethod(self->_connect, 2u, &input, 3u, 0, 0);
  if (v8)
  {
    v10 = (void *)objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", *MEMORY[0x24BDD1100], -536870167, 0);
    if (a5)
    {
      if (v10)
        *a5 = v10;
    }
  }
  -[BRInterface timestampWithLabel:](self, "timestampWithLabel:", objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@ %@"), NSStringFromSelector(a2), CFSTR("end")));
  return v8 == 0;
}

- (void)scheduleReadyNotificationWithBlock:(id)a3
{
  OS_dispatch_queue *v5;
  _QWORD v6[6];

  v5 = -[BRInterface queue](self, "queue");
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __53__BRInterfaceAOP_scheduleReadyNotificationWithBlock___block_invoke;
  v6[3] = &unk_24D4A3E88;
  v6[4] = self;
  v6[5] = a3;
  dispatch_sync((dispatch_queue_t)v5, v6);
  -[BRInterfaceAOP _findService](self, "_findService");
}

uint64_t __53__BRInterfaceAOP_scheduleReadyNotificationWithBlock___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(a1 + 40), "copy");
  *(_QWORD *)(*(_QWORD *)(a1 + 32) + 64) = result;
  return result;
}

- (BOOL)updateReadyState
{
  NSObject *v3;
  NSObject *v5;
  unint64_t v6;
  const char *v7;
  int v8;
  const char *v9;
  NSObject *v10;
  _BYTE v11[22];
  __int16 v12;
  const char *v13;
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  v3 = _BRLog_log_0;
  if (!_BRLog_log_0)
  {
    v3 = os_log_create("com.apple.ButtonResolver", "default");
    _BRLog_log_0 = (uint64_t)v3;
  }
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
  {
    if (self->_isReady)
      v7 = "YES";
    else
      v7 = "NO";
    v8 = -[HAButtonHapticsLoader serviceAvailable](self->_loader, "serviceAvailable");
    *(_DWORD *)v11 = 136315650;
    *(_QWORD *)&v11[4] = "-[BRInterfaceAOP updateReadyState]";
    if (v8)
      v9 = "YES";
    else
      v9 = "NO";
    *(_WORD *)&v11[12] = 2080;
    *(_QWORD *)&v11[14] = v7;
    v12 = 2080;
    v13 = v9;
    _os_log_debug_impl(&dword_215E56000, v3, OS_LOG_TYPE_DEBUG, "%s isReady: %s loaderReady: %s", v11, 0x20u);
  }
  if (!self->_isReady
    && self->_service
    && -[HAButtonHapticsLoader serviceAvailable](self->_loader, "serviceAvailable"))
  {
    v5 = _BRLog_log_0;
    if (!_BRLog_log_0)
    {
      v5 = os_log_create("com.apple.ButtonResolver", "default");
      _BRLog_log_0 = (uint64_t)v5;
    }
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
      -[BRInterfaceAOP updateReadyState].cold.2(v5);
    if (-[HAButtonHapticsLoader maxNumberOfSlots](self->_loader, "maxNumberOfSlots", *(_OWORD *)v11) < 1)
      v6 = 0;
    else
      v6 = -[HAButtonHapticsLoader maxNumberOfSlots](self->_loader, "maxNumberOfSlots");
    self->_maxAssetSlots = v6;
    self->_freeSlots = (NSMutableIndexSet *)objc_msgSend(objc_alloc(MEMORY[0x24BDD1698]), "initWithIndexesInRange:", 0, self->_maxAssetSlots);
    -[BRInterfaceAOP _setDefaultAOPConfigs](self, "_setDefaultAOPConfigs");
    self->_isReady = 1;
    if (self->_notificationBlock)
    {
      dispatch_async((dispatch_queue_t)-[BRInterface queue](self, "queue"), self->_notificationBlock);

      self->_notificationBlock = 0;
    }
    else
    {
      v10 = _BRLog_log_0;
      if (!_BRLog_log_0)
      {
        v10 = os_log_create("com.apple.ButtonResolver", "default");
        _BRLog_log_0 = (uint64_t)v10;
      }
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
        -[BRInterfaceAOP updateReadyState].cold.1(v10);
    }
  }
  return self->_isReady;
}

- (void)_findService
{
  OS_dispatch_queue *v3;
  _QWORD block[5];

  v3 = -[BRInterface queue](self, "queue");
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __30__BRInterfaceAOP__findService__block_invoke;
  block[3] = &unk_24D4A3E38;
  block[4] = self;
  dispatch_async((dispatch_queue_t)v3, block);
}

void __30__BRInterfaceAOP__findService__block_invoke(uint64_t a1)
{
  _QWORD *v2;
  IONotificationPort *v3;
  uint64_t v4;
  IONotificationPort *v5;
  const char *v6;
  const __CFDictionary *v7;

  *(_QWORD *)(*(_QWORD *)(a1 + 32) + 48) = IONotificationPortCreate(*MEMORY[0x24BDD8B20]);
  v2 = *(_QWORD **)(a1 + 32);
  v3 = (IONotificationPort *)v2[6];
  if (v3)
  {
    IONotificationPortSetDispatchQueue(v3, (dispatch_queue_t)objc_msgSend(v2, "queue"));
    v4 = *(_QWORD *)(a1 + 32);
    v5 = *(IONotificationPort **)(v4 + 48);
    if (*(_BYTE *)(v4 + 113))
      v6 = "AppleSPUHapticsAudioDriver";
    else
      v6 = "AppleSPUButtonDriver";
    v7 = IOServiceNameMatching(v6);
    if (!IOServiceAddMatchingNotification(v5, "IOServiceMatched", v7, (IOServiceMatchingCallback)AOPMatchedCallback, *(void **)(a1 + 32), (io_iterator_t *)(*(_QWORD *)(a1 + 32) + 56)))AOPMatchedCallback(*(void **)(a1 + 32), *(_DWORD *)(*(_QWORD *)(a1 + 32) + 56));
  }
}

- (void)_receiveLoaderAvailableNotification:(id)a3
{
  NSObject *v5;
  OS_dispatch_queue *v6;
  _QWORD block[5];

  v5 = _BRLog_log_0;
  if (!_BRLog_log_0)
  {
    v5 = os_log_create("com.apple.ButtonResolver", "default");
    _BRLog_log_0 = (uint64_t)v5;
  }
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    -[BRInterfaceAOP _receiveLoaderAvailableNotification:].cold.1();
  if (objc_msgSend((id)objc_msgSend(a3, "name"), "isEqual:", self->_notificationName))
  {
    v6 = -[BRInterface queue](self, "queue");
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __54__BRInterfaceAOP__receiveLoaderAvailableNotification___block_invoke;
    block[3] = &unk_24D4A3E38;
    block[4] = self;
    dispatch_async((dispatch_queue_t)v6, block);
  }
}

uint64_t __54__BRInterfaceAOP__receiveLoaderAvailableNotification___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "updateReadyState");
}

- (BOOL)_serviceSetProperty:(void *)a3 forKey:(__CFString *)a4
{
  NSObject *v7;
  unsigned int *p_service;
  uint64_t v9;
  NSObject *v11;

  v7 = _BRLog_log_0;
  if (!_BRLog_log_0)
  {
    v7 = os_log_create("com.apple.ButtonResolver", "default");
    _BRLog_log_0 = (uint64_t)v7;
  }
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
    -[BRInterfaceAOP _serviceSetProperty:forKey:].cold.2();
  p_service = &self->_service;
  v9 = IORegistryEntrySetCFProperty(*p_service, a4, a3);
  if ((_DWORD)v9)
  {
    v11 = _BRLog_log_0;
    if (!_BRLog_log_0)
    {
      v11 = os_log_create("com.apple.ButtonResolver", "default");
      _BRLog_log_0 = (uint64_t)v11;
    }
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      -[BRInterfaceAOP _serviceSetProperty:forKey:].cold.1(p_service, v9, v11);
  }
  return (_DWORD)v9 == 0;
}

- (BOOL)_setDefaultAOPConfigs
{
  _BOOL4 v3;

  v3 = -[BRInterfaceAOP _serviceSetProperty:forKey:](self, "_serviceSetProperty:forKey:", &unk_24D4A6460, CFSTR("GlobalConfig"));
  if (v3)
    LOBYTE(v3) = -[BRInterfaceAOP _serviceSetProperty:forKey:](self, "_serviceSetProperty:forKey:", &unk_24D4A6848, CFSTR("StateConfig"));
  return v3;
}

- (BOOL)_setGlobalAOPConfigsFromBRFConfigs:(id)a3
{
  uint64_t v5;
  uint64_t v6;
  const __CFString *v8;
  _QWORD v9[2];

  v9[1] = *MEMORY[0x24BDAC8D0];
  v5 = objc_msgSend(a3, "count");
  if (v5)
  {
    v6 = +[BRInterfaceAOP _convertForceFeel:](BRInterfaceAOP, "_convertForceFeel:", objc_msgSend((id)objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("ForceFeel")), "unsignedIntegerValue"));
    if ((_DWORD)v6 == 3)
    {
      LOBYTE(v5) = 0;
    }
    else
    {
      v8 = CFSTR("GlobalForceFeel");
      v9[0] = objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", v6);
      LOBYTE(v5) = -[BRInterfaceAOP _serviceSetProperty:forKey:](self, "_serviceSetProperty:forKey:", objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v9, &v8, 1), CFSTR("GlobalConfig"));
    }
  }
  return v5;
}

- (BOOL)_setStateAOPConfigsFromStateData:(id)a3 andSlotData:(id)a4
{
  uint64_t v5;
  void *v6;
  unsigned int v7;
  uint64_t v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  uint64_t v13;
  void *v14;
  unsigned int v15;
  int v16;
  double v17;
  uint64_t v18;
  uint64_t v20;
  id v21;
  uint64_t v22;
  uint64_t v23;
  id obj;
  uint64_t v27;
  void *v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  _BYTE v37[128];
  _QWORD v38[2];
  _QWORD v39[2];
  _BYTE v40[128];
  uint64_t v41;

  v41 = *MEMORY[0x24BDAC8D0];
  v28 = (void *)objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  if (!objc_msgSend(a3, "count"))
    return 1;
  v35 = 0u;
  v36 = 0u;
  v33 = 0u;
  v34 = 0u;
  v22 = objc_msgSend(a3, "countByEnumeratingWithState:objects:count:", &v33, v40, 16);
  if (v22)
  {
    v20 = *(_QWORD *)v34;
    v21 = a3;
    do
    {
      v5 = 0;
      do
      {
        if (*(_QWORD *)v34 != v20)
          objc_enumerationMutation(a3);
        v23 = v5;
        v6 = (void *)objc_msgSend(a3, "objectForKey:", *(_QWORD *)(*((_QWORD *)&v33 + 1) + 8 * v5));
        v7 = +[BRInterfaceAOP _convertClickState:](BRInterfaceAOP, "_convertClickState:", objc_msgSend(v6, "state"));
        v38[0] = CFSTR("StateButtonState");
        v8 = objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", v7);
        v38[1] = CFSTR("StateEnable");
        v39[0] = v8;
        v39[1] = objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", objc_msgSend(v6, "enabled"));
        v9 = (id)objc_msgSend((id)objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v39, v38, 2), "mutableCopy");
        if ((objc_msgSend(v6, "enabled") & 1) != 0)
        {
          v31 = 0u;
          v32 = 0u;
          v29 = 0u;
          v30 = 0u;
          obj = (id)objc_msgSend(v6, "speedConfigs");
          v10 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v29, v37, 16);
          if (v10)
          {
            v11 = v10;
            v27 = *(_QWORD *)v30;
            do
            {
              for (i = 0; i != v11; ++i)
              {
                if (*(_QWORD *)v30 != v27)
                  objc_enumerationMutation(obj);
                v13 = *(_QWORD *)(*((_QWORD *)&v29 + 1) + 8 * i);
                objc_msgSend(v9, "setObject:forKey:", v13, CFSTR("StateSpeed"));
                objc_msgSend(v9, "setObject:forKey:", objc_msgSend((id)objc_msgSend(v6, "speedSlots"), "objectForKeyedSubscript:", v13), CFSTR("StateSlot"));
                v14 = (void *)objc_msgSend(-[BRInterfaceAOP dataForSlot:fromArray:](self, "dataForSlot:fromArray:", objc_msgSend((id)objc_msgSend(v6, "speedSlots"), "objectForKeyedSubscript:", v13), a4), "asset");
                v15 = objc_msgSend(v14, "hasAudio");
                if (objc_msgSend(v14, "hasHaptic"))
                  v16 = 2;
                else
                  v16 = 0;
                objc_msgSend(v9, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", v16 | v15), CFSTR("StateHapticType"));
                if (objc_msgSend((id)objc_msgSend((id)objc_msgSend(v6, "speedConfigs"), "objectForKeyedSubscript:", v13), "objectForKeyedSubscript:", CFSTR("MinTime")))
                {
                  objc_msgSend(v9, "setObject:forKey:", objc_msgSend((id)objc_msgSend((id)objc_msgSend(v6, "speedConfigs"), "objectForKeyedSubscript:", v13), "objectForKeyedSubscript:", CFSTR("MinTime")), CFSTR("StateMinTime"));
                }
                if (objc_msgSend((id)objc_msgSend((id)objc_msgSend(v6, "speedConfigs"), "objectForKeyedSubscript:", v13), "objectForKeyedSubscript:", CFSTR("MaxTime")))
                {
                  objc_msgSend(v9, "setObject:forKey:", objc_msgSend((id)objc_msgSend((id)objc_msgSend(v6, "speedConfigs"), "objectForKeyedSubscript:", v13), "objectForKeyedSubscript:", CFSTR("MaxTime")), CFSTR("StateMaxTime"));
                }
                if (objc_msgSend((id)objc_msgSend((id)objc_msgSend(v6, "speedConfigs"), "objectForKeyedSubscript:", v13), "objectForKeyedSubscript:", CFSTR("Gain")))
                {
                  objc_msgSend((id)objc_msgSend((id)objc_msgSend((id)objc_msgSend(v6, "speedConfigs"), "objectForKeyedSubscript:", v13), "objectForKeyedSubscript:", CFSTR("Gain")), "doubleValue");
                  LODWORD(v18) = vcvtd_n_s64_f64(v17, 0x10uLL);
                  objc_msgSend(v9, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", v18), CFSTR("StateGain"));
                }
                objc_msgSend(v28, "addObject:", (id)objc_msgSend(v9, "copy"));
              }
              v11 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v29, v37, 16);
            }
            while (v11);
          }
        }
        else
        {
          objc_msgSend(v28, "addObject:", v9);
        }
        v5 = v23 + 1;
        a3 = v21;
      }
      while (v23 + 1 != v22);
      v22 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &v33, v40, 16);
    }
    while (v22);
  }
  return -[BRInterfaceAOP _serviceSetProperty:forKey:](self, "_serviceSetProperty:forKey:", v28, CFSTR("StateConfig"));
}

+ (int)_convertForceFeel:(unint64_t)a3
{
  if (a3 >= 3)
    return 3;
  else
    return a3;
}

+ (int)_convertClickState:(unint64_t)a3
{
  if (a3 >= 0x11)
    return 17;
  else
    return a3;
}

- (BOOL)isReady
{
  return self->_isReady;
}

- (unint64_t)maxAssetSlots
{
  return self->_maxAssetSlots;
}

- (unsigned)service
{
  return self->_service;
}

- (void)setService:(unsigned int)a3
{
  self->_service = a3;
}

- (unsigned)connect
{
  return self->_connect;
}

- (void)setConnect:(unsigned int)a3
{
  self->_connect = a3;
}

- (BOOL)fastHaptics
{
  return self->_fastHaptics;
}

- (void)initWithFastHaptics:(os_log_t)log .cold.1(os_log_t log)
{
  int v1;
  const char *v2;
  uint64_t v3;

  v3 = *MEMORY[0x24BDAC8D0];
  v1 = 136315138;
  v2 = "-[BRInterfaceAOP initWithFastHaptics:]";
  _os_log_error_impl(&dword_215E56000, log, OS_LOG_TYPE_ERROR, "%s failed!", (uint8_t *)&v1, 0xCu);
  OUTLINED_FUNCTION_1();
}

- (void)propertyList
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_3(&dword_215E56000, v0, v1, "%s %@", v2, v3, v4, v5, 2u);
  OUTLINED_FUNCTION_1();
}

- (void)updateReadyState
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_debug_impl(&dword_215E56000, log, OS_LOG_TYPE_DEBUG, "BRInterfaceAOP is ready!", v1, 2u);
}

- (void)_receiveLoaderAvailableNotification:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_3(&dword_215E56000, v0, v1, "%s notification: %@", v2, v3, v4, v5, 2u);
  OUTLINED_FUNCTION_1();
}

- (void)_serviceSetProperty:(NSObject *)a3 forKey:.cold.1(_DWORD *a1, uint64_t a2, NSObject *a3)
{
  _BYTE v3[20];

  *(_DWORD *)v3 = 136315650;
  *(_QWORD *)&v3[4] = "-[BRInterfaceAOP _serviceSetProperty:forKey:]";
  *(_DWORD *)&v3[14] = *a1;
  *(_WORD *)&v3[18] = 1024;
  OUTLINED_FUNCTION_1_0(&dword_215E56000, a2, a3, "%s error setting property on service %u, code: %d", *(const char **)v3, (unint64_t)"-[BRInterfaceAOP _serviceSetProperty:forKey:]" >> 32, *(_DWORD *)&v3[16]);
  OUTLINED_FUNCTION_1();
}

- (void)_serviceSetProperty:forKey:.cold.2()
{
  __int16 v0;
  uint64_t v1;
  os_log_t v2;
  int v3[5];
  __int16 v4;
  uint64_t v5;
  uint64_t v6;

  v6 = *MEMORY[0x24BDAC8D0];
  v3[0] = 136315650;
  OUTLINED_FUNCTION_0_0();
  v4 = v0;
  v5 = v1;
  _os_log_debug_impl(&dword_215E56000, v2, OS_LOG_TYPE_DEBUG, "%s property: %@ key: %@", (uint8_t *)v3, 0x20u);
}

@end
