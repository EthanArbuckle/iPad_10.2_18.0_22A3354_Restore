@implementation GKInterfacePrioritizer

+ (void)initialize
{
  id v2;
  uint64_t v3;
  NSObject *v4;
  const char *v5;
  int v6;
  uint64_t v7;
  __int16 v8;
  const char *v9;
  __int16 v10;
  int v11;
  __int16 v12;
  const char *v13;
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  v2 = objc_alloc(MEMORY[0x24BDBCED8]);
  gkInterfacePrioritizerTypeToPriorityMap = objc_msgSend(v2, "initWithCapacity:", gkInterfaceTypesCount);
  objc_msgSend((id)gkInterfacePrioritizerTypeToPriorityMap, "setObject:forKeyedSubscript:", &unk_24D470130, *MEMORY[0x24BDF5A40]);
  objc_msgSend((id)gkInterfacePrioritizerTypeToPriorityMap, "setObject:forKeyedSubscript:", &unk_24D470148, *MEMORY[0x24BDF5A48]);
  objc_msgSend((id)gkInterfacePrioritizerTypeToPriorityMap, "setObject:forKeyedSubscript:", &unk_24D470160, *MEMORY[0x24BDF5A38]);
  if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
  {
    v3 = VRTraceErrorLogLevelToCSTR();
    v4 = *MEMORY[0x24BDFDC28];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDFDC28], OS_LOG_TYPE_DEFAULT))
    {
      if (gkInterfacePrioritizerTypeToPriorityMap)
        v5 = (const char *)objc_msgSend((id)objc_msgSend((id)gkInterfacePrioritizerTypeToPriorityMap, "description"), "UTF8String");
      else
        v5 = "<nil>";
      v6 = 136315906;
      v7 = v3;
      v8 = 2080;
      v9 = "+[GKInterfacePrioritizer initialize]";
      v10 = 1024;
      v11 = 91;
      v12 = 2080;
      v13 = v5;
      _os_log_impl(&dword_215C5C000, v4, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d interfaceType2PriorityMap: %s", (uint8_t *)&v6, 0x26u);
    }
  }
  gkInterfaceTypesCount = objc_msgSend((id)gkInterfacePrioritizerTypeToPriorityMap, "count");
}

+ (id)bsdNameToInterfaceTypeMap
{
  CFArrayRef v2;
  void *v3;
  uint64_t v4;
  __int128 v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  const __SCNetworkInterface *v10;
  __CFString *InterfaceType;
  CFStringRef BSDName;
  __CFString *v13;
  BOOL v14;
  uint64_t v15;
  NSObject *v16;
  const char *v17;
  const char *v18;
  uint64_t v19;
  uint64_t v20;
  NSObject *v21;
  const char *v22;
  __int128 v24;
  __CFString *v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  uint8_t buf[4];
  uint64_t v31;
  __int16 v32;
  const char *v33;
  __int16 v34;
  int v35;
  __int16 v36;
  const char *v37;
  __int16 v38;
  const char *v39;
  _BYTE v40[128];
  uint64_t v41;

  v41 = *MEMORY[0x24BDAC8D0];
  v2 = SCNetworkInterfaceCopyAll();
  v3 = (void *)objc_msgSend(MEMORY[0x24BDBCED8], "dictionaryWithCapacity:", -[__CFArray count](v2, "count"));
  v26 = 0u;
  v27 = 0u;
  v28 = 0u;
  v29 = 0u;
  v4 = -[__CFArray countByEnumeratingWithState:objects:count:](v2, "countByEnumeratingWithState:objects:count:", &v26, v40, 16);
  if (v4)
  {
    v6 = v4;
    v7 = *(_QWORD *)v27;
    v8 = *MEMORY[0x24BDF5A40];
    v25 = (__CFString *)*MEMORY[0x24BDF5A38];
    *(_QWORD *)&v5 = 136316162;
    v24 = v5;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v27 != v7)
          objc_enumerationMutation(v2);
        v10 = *(const __SCNetworkInterface **)(*((_QWORD *)&v26 + 1) + 8 * v9);
        InterfaceType = (__CFString *)SCNetworkInterfaceGetInterfaceType(v10);
        BSDName = SCNetworkInterfaceGetBSDName(v10);
        v13 = (__CFString *)BSDName;
        if (InterfaceType)
          v14 = BSDName == 0;
        else
          v14 = 1;
        if (v14)
        {
          if ((int)VRTraceGetErrorLogLevelForModule() >= 5)
          {
            v15 = VRTraceErrorLogLevelToCSTR();
            v16 = *MEMORY[0x24BDFDC28];
            if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDFDC28], OS_LOG_TYPE_DEFAULT))
            {
              if (InterfaceType)
              {
                v17 = (const char *)objc_msgSend((id)-[__CFString description](InterfaceType, "description"), "UTF8String");
                if (v13)
                  goto LABEL_15;
LABEL_25:
                v18 = "<nil>";
              }
              else
              {
                v17 = "<nil>";
                if (!v13)
                  goto LABEL_25;
LABEL_15:
                v18 = (const char *)objc_msgSend((id)-[__CFString description](v13, "description", v24), "UTF8String");
              }
              *(_DWORD *)buf = v24;
              v31 = v15;
              v32 = 2080;
              v33 = "+[GKInterfacePrioritizer bsdNameToInterfaceTypeMap]";
              v34 = 1024;
              v35 = 107;
              v36 = 2080;
              v37 = v17;
              v38 = 2080;
              v39 = v18;
              _os_log_impl(&dword_215C5C000, v16, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d invalid type [%s] or bsd name [%s]", buf, 0x30u);
            }
          }
        }
        else
        {
          if (-[__CFString isEqualToString:](InterfaceType, "isEqualToString:", v8)
            && (_SCNetworkInterfaceIsBluetoothPAN()
             || _SCNetworkInterfaceIsBluetoothPAN_NAP()
             || _SCNetworkInterfaceIsBluetoothP2P()))
          {
            InterfaceType = v25;
          }
          objc_msgSend(v3, "setObject:forKeyedSubscript:", InterfaceType, v13, v24);
        }
        ++v9;
      }
      while (v6 != v9);
      v19 = -[__CFArray countByEnumeratingWithState:objects:count:](v2, "countByEnumeratingWithState:objects:count:", &v26, v40, 16);
      v6 = v19;
    }
    while (v19);
  }
  if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
  {
    v20 = VRTraceErrorLogLevelToCSTR();
    v21 = *MEMORY[0x24BDFDC28];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDFDC28], OS_LOG_TYPE_DEFAULT))
    {
      if (v3)
        v22 = (const char *)objc_msgSend((id)objc_msgSend(v3, "description"), "UTF8String");
      else
        v22 = "<nil>";
      *(_DWORD *)buf = 136315906;
      v31 = v20;
      v32 = 2080;
      v33 = "+[GKInterfacePrioritizer bsdNameToInterfaceTypeMap]";
      v34 = 1024;
      v35 = 123;
      v36 = 2080;
      v37 = v22;
      _os_log_impl(&dword_215C5C000, v21, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d bsdName2interfaceTypeMap: %s", buf, 0x26u);
    }
  }

  return v3;
}

+ (id)prioritizeLocalInterfaces:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  GKInterface *v10;
  uint64_t v11;
  const __CFString *v12;
  void *v13;
  uint64_t v14;
  int ErrorLogLevelForModule;
  os_log_t *v16;
  uint64_t v17;
  NSObject *v18;
  const char *v19;
  uint64_t v20;
  NSObject *v21;
  uint64_t v23;
  NSObject *v24;
  const char *v25;
  unint64_t v26;
  uint64_t v27;
  NSObject *v28;
  const char *v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  uint8_t buf[4];
  uint64_t v35;
  __int16 v36;
  const char *v37;
  __int16 v38;
  int v39;
  __int16 v40;
  const char *v41;
  _BYTE v42[128];
  uint64_t v43;

  v43 = *MEMORY[0x24BDAC8D0];
  if (objc_msgSend(a3, "count"))
  {
    v4 = +[GKInterfacePrioritizer bsdNameToInterfaceTypeMap](GKInterfacePrioritizer, "bsdNameToInterfaceTypeMap");
    v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCEB8]), "initWithCapacity:", objc_msgSend(a3, "count"));
    v30 = 0u;
    v31 = 0u;
    v32 = 0u;
    v33 = 0u;
    v6 = objc_msgSend(a3, "countByEnumeratingWithState:objects:count:", &v30, v42, 16);
    if (v6)
    {
      v7 = v6;
      v8 = *(_QWORD *)v31;
      do
      {
        for (i = 0; i != v7; ++i)
        {
          if (*(_QWORD *)v31 != v8)
            objc_enumerationMutation(a3);
          v10 = +[GKInterface interfaceWithInterfaceIndex:](GKInterface, "interfaceWithInterfaceIndex:", *(_QWORD *)(*((_QWORD *)&v30 + 1) + 8 * i));
          v11 = objc_msgSend(v4, "objectForKeyedSubscript:", -[GKInterface bsdName](v10, "bsdName"));
          if (v11)
            v12 = (const __CFString *)v11;
          else
            v12 = CFSTR("GKInterfaceTypeUnknown");
          -[GKInterface setType:](v10, "setType:", v12);
          v13 = (void *)objc_msgSend((id)gkInterfacePrioritizerTypeToPriorityMap, "objectForKeyedSubscript:", -[GKInterface type](v10, "type"));
          if (v13)
            v14 = objc_msgSend(v13, "unsignedIntValue");
          else
            v14 = gkInterfaceTypesCount;
          -[GKInterface setPriority:](v10, "setPriority:", v14);
          objc_msgSend(v5, "addObject:", v10);
        }
        v7 = objc_msgSend(a3, "countByEnumeratingWithState:objects:count:", &v30, v42, 16);
      }
      while (v7);
    }
    ErrorLogLevelForModule = VRTraceGetErrorLogLevelForModule();
    v16 = (os_log_t *)MEMORY[0x24BDFDC28];
    if (ErrorLogLevelForModule >= 7)
    {
      v17 = VRTraceErrorLogLevelToCSTR();
      v18 = *v16;
      if (os_log_type_enabled(*v16, OS_LOG_TYPE_DEFAULT))
      {
        if (v5)
          v19 = (const char *)objc_msgSend((id)objc_msgSend(v5, "description"), "UTF8String");
        else
          v19 = "<nil>";
        *(_DWORD *)buf = 136315906;
        v35 = v17;
        v36 = 2080;
        v37 = "+[GKInterfacePrioritizer prioritizeLocalInterfaces:]";
        v38 = 1024;
        v39 = 150;
        v40 = 2080;
        v41 = v19;
        _os_log_impl(&dword_215C5C000, v18, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d before sorting %s", buf, 0x26u);
      }
    }
    objc_msgSend(v5, "sortUsingComparator:", &__block_literal_global_2);
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      v23 = VRTraceErrorLogLevelToCSTR();
      v24 = *v16;
      if (os_log_type_enabled(*v16, OS_LOG_TYPE_DEFAULT))
      {
        if (v5)
          v25 = (const char *)objc_msgSend((id)objc_msgSend(v5, "description"), "UTF8String");
        else
          v25 = "<nil>";
        *(_DWORD *)buf = 136315906;
        v35 = v23;
        v36 = 2080;
        v37 = "+[GKInterfacePrioritizer prioritizeLocalInterfaces:]";
        v38 = 1024;
        v39 = 163;
        v40 = 2080;
        v41 = v25;
        _os_log_impl(&dword_215C5C000, v24, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d after sorting %s", buf, 0x26u);
      }
    }
    if (objc_msgSend(v5, "count"))
    {
      v26 = 0;
      do
      {
        objc_msgSend(v5, "setObject:atIndexedSubscript:", objc_msgSend((id)objc_msgSend(v5, "objectAtIndexedSubscript:", v26), "index"), v26);
        ++v26;
      }
      while (v26 < objc_msgSend(v5, "count"));
    }
    if ((int)VRTraceGetErrorLogLevelForModule() > 6)
    {
      v27 = VRTraceErrorLogLevelToCSTR();
      v28 = *v16;
      if (os_log_type_enabled(*v16, OS_LOG_TYPE_DEFAULT))
      {
        if (v5)
          v29 = (const char *)objc_msgSend((id)objc_msgSend(v5, "description"), "UTF8String");
        else
          v29 = "<nil>";
        *(_DWORD *)buf = 136315906;
        v35 = v27;
        v36 = 2080;
        v37 = "+[GKInterfacePrioritizer prioritizeLocalInterfaces:]";
        v38 = 1024;
        v39 = 170;
        v40 = 2080;
        v41 = v29;
        _os_log_impl(&dword_215C5C000, v28, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d ordered interface indices %s", buf, 0x26u);
      }
    }
    return v5;
  }
  else
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      v20 = VRTraceErrorLogLevelToCSTR();
      v21 = *MEMORY[0x24BDFDC28];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDFDC28], OS_LOG_TYPE_ERROR))
        +[GKInterfacePrioritizer prioritizeLocalInterfaces:].cold.1(v20, v21);
    }
    return 0;
  }
}

uint64_t __52__GKInterfacePrioritizer_prioritizeLocalInterfaces___block_invoke(uint64_t a1, void *a2, void *a3)
{
  unsigned int v5;
  unsigned int v7;

  v5 = objc_msgSend(a2, "priority");
  if (v5 < objc_msgSend(a3, "priority"))
    return -1;
  v7 = objc_msgSend(a2, "priority");
  return v7 > objc_msgSend(a3, "priority");
}

+ (void)prioritizeLocalInterfaces:(uint64_t)a1 .cold.1(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;
  __int16 v4;
  const char *v5;
  __int16 v6;
  int v7;
  uint64_t v8;

  v8 = *MEMORY[0x24BDAC8D0];
  v2 = 136315650;
  v3 = a1;
  v4 = 2080;
  v5 = "+[GKInterfacePrioritizer prioritizeLocalInterfaces:]";
  v6 = 1024;
  v7 = 131;
  _os_log_error_impl(&dword_215C5C000, a2, OS_LOG_TYPE_ERROR, " [%s] %s:%d no interfaces at input", (uint8_t *)&v2, 0x1Cu);
}

@end
