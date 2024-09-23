@implementation VCRateControlServerBag

+ (id)keysWithMode:(int)a3
{
  uint64_t v3;
  id v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v12;
  NSObject *v13;
  _BYTE v14[128];
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  uint8_t buf[4];
  uint64_t v20;
  __int16 v21;
  const char *v22;
  __int16 v23;
  int v24;
  __int16 v25;
  int v26;
  uint64_t v27;

  v3 = *(_QWORD *)&a3;
  v27 = *MEMORY[0x1E0C80C00];
  v5 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  if ((_DWORD)v3 == 6 || (_DWORD)v3 == 1)
  {
    v6 = (void *)objc_msgSend(&unk_1E9EFB448, "allKeys");
    v15 = 0u;
    v16 = 0u;
    v17 = 0u;
    v18 = 0u;
    v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v15, v14, 16);
    if (v7)
    {
      v8 = v7;
      v9 = *(_QWORD *)v16;
      do
      {
        v10 = 0;
        do
        {
          if (*(_QWORD *)v16 != v9)
            objc_enumerationMutation(v6);
          objc_msgSend(v5, "addObjectsFromArray:", objc_msgSend(a1, "groupKeysWithMode:primaryKey:", v3, *(_QWORD *)(*((_QWORD *)&v15 + 1) + 8 * v10++)));
        }
        while (v8 != v10);
        v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v15, v14, 16);
      }
      while (v8);
    }
    return v5;
  }
  else
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 5)
    {
      v12 = VRTraceErrorLogLevelToCSTR();
      v13 = *MEMORY[0x1E0CF2758];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315906;
        v20 = v12;
        v21 = 2080;
        v22 = "+[VCRateControlServerBag keysWithMode:]";
        v23 = 1024;
        v24 = 79;
        v25 = 1024;
        v26 = v3;
        _os_log_impl(&dword_1D8A54000, v13, OS_LOG_TYPE_DEFAULT, "AVCRC [%s] %s:%d Unsupported operating mode %d", buf, 0x22u);
      }
    }

    return (id)MEMORY[0x1E0C9AA60];
  }
}

+ (id)profileNumberKeyWithMode:(int)a3
{
  return (id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@-%@-%@"), objc_msgSend(a1, "prefixForMode:", *(_QWORD *)&a3), CFSTR("profile"), CFSTR("profileNumber"));
}

+ (id)groupKeysWithMode:(int)a3 primaryKey:(id)a4
{
  uint64_t v5;
  id v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  NSObject *v16;
  NSObject *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v21;
  NSObject *v22;
  int v23;
  id obj;
  uint8_t buf[4];
  uint64_t v26;
  __int16 v27;
  const char *v28;
  __int16 v29;
  int v30;
  __int16 v31;
  uint64_t v32;
  __int16 v33;
  int v34;
  _BYTE v35[128];
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  uint64_t v40;

  v5 = *(_QWORD *)&a3;
  v40 = *MEMORY[0x1E0C80C00];
  v7 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  if ((_DWORD)v5 == 1)
  {
    v8 = &unk_1E9EFB470;
    goto LABEL_5;
  }
  if ((_DWORD)v5 == 6)
  {
    v8 = &unk_1E9EFB498;
LABEL_5:
    v23 = v5;
    v9 = objc_msgSend(a1, "prefixForMode:", v5);
    v36 = 0u;
    v37 = 0u;
    v38 = 0u;
    v39 = 0u;
    obj = (id)objc_msgSend(v8, "objectForKey:", a4);
    v10 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v36, v35, 16);
    if (v10)
    {
      v11 = v10;
      v12 = *(_QWORD *)v37;
      do
      {
        v13 = 0;
        do
        {
          if (*(_QWORD *)v37 != v12)
            objc_enumerationMutation(obj);
          v14 = (void *)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@-%@-%@"), v9, a4, *(_QWORD *)(*((_QWORD *)&v36 + 1) + 8 * v13));
          objc_msgSend(v7, "addObject:", v14);
          if ((int)VRTraceGetErrorLogLevelForModule() >= 8)
          {
            v15 = VRTraceErrorLogLevelToCSTR();
            v16 = *MEMORY[0x1E0CF2758];
            v17 = *MEMORY[0x1E0CF2758];
            if (*MEMORY[0x1E0CF2748])
            {
              if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
              {
                v18 = objc_msgSend(v14, "UTF8String");
                *(_DWORD *)buf = 136316162;
                v26 = v15;
                v27 = 2080;
                v28 = "+[VCRateControlServerBag groupKeysWithMode:primaryKey:]";
                v29 = 1024;
                v30 = 118;
                v31 = 2080;
                v32 = v18;
                v33 = 1024;
                v34 = v23;
                _os_log_impl(&dword_1D8A54000, v16, OS_LOG_TYPE_DEFAULT, "AVCRC [%s] %s:%d Adding key:%s for mode %d", buf, 0x2Cu);
              }
            }
            else if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
            {
              v19 = objc_msgSend(v14, "UTF8String");
              *(_DWORD *)buf = 136316162;
              v26 = v15;
              v27 = 2080;
              v28 = "+[VCRateControlServerBag groupKeysWithMode:primaryKey:]";
              v29 = 1024;
              v30 = 118;
              v31 = 2080;
              v32 = v19;
              v33 = 1024;
              v34 = v23;
              _os_log_debug_impl(&dword_1D8A54000, v16, OS_LOG_TYPE_DEBUG, "AVCRC [%s] %s:%d Adding key:%s for mode %d", buf, 0x2Cu);
            }
          }
          ++v13;
        }
        while (v11 != v13);
        v11 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v36, v35, 16);
      }
      while (v11);
    }
    return v7;
  }
  if ((int)VRTraceGetErrorLogLevelForModule() >= 5)
  {
    v21 = VRTraceErrorLogLevelToCSTR();
    v22 = *MEMORY[0x1E0CF2758];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315906;
      v26 = v21;
      v27 = 2080;
      v28 = "+[VCRateControlServerBag groupKeysWithMode:primaryKey:]";
      v29 = 1024;
      v30 = 110;
      v31 = 1024;
      LODWORD(v32) = v5;
      _os_log_impl(&dword_1D8A54000, v22, OS_LOG_TYPE_DEFAULT, "AVCRC [%s] %s:%d Unsupported operating mode %d", buf, 0x22u);
    }
  }

  return 0;
}

+ (id)prefixForMode:(int)a3
{
  void *v4;
  const __CFString *v5;
  uint64_t v7;
  NSObject *v8;
  uint8_t buf[4];
  uint64_t v10;
  __int16 v11;
  const char *v12;
  __int16 v13;
  int v14;
  __int16 v15;
  int v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  if (a3 == 6)
  {
    v4 = (void *)MEMORY[0x1E0CB3940];
    v5 = CFSTR("groupFaceTime");
    return (id)objc_msgSend(v4, "stringWithFormat:", CFSTR("%@-%@-%@"), CFSTR("vc"), CFSTR("vcrc"), v5);
  }
  if (a3 == 1)
  {
    v4 = (void *)MEMORY[0x1E0CB3940];
    v5 = CFSTR("faceTime");
    return (id)objc_msgSend(v4, "stringWithFormat:", CFSTR("%@-%@-%@"), CFSTR("vc"), CFSTR("vcrc"), v5);
  }
  if ((int)VRTraceGetErrorLogLevelForModule() >= 5)
  {
    v7 = VRTraceErrorLogLevelToCSTR();
    v8 = *MEMORY[0x1E0CF2758];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315906;
      v10 = v7;
      v11 = 2080;
      v12 = "+[VCRateControlServerBag prefixForMode:]";
      v13 = 1024;
      v14 = 133;
      v15 = 1024;
      v16 = a3;
      _os_log_impl(&dword_1D8A54000, v8, OS_LOG_TYPE_DEFAULT, "AVCRC [%s] %s:%d Unsupported operating mode %d", buf, 0x22u);
    }
  }
  return &stru_1E9E58EE0;
}

- (VCRateControlServerBag)initWithMode:(int)a3 serverBagDict:(id)a4
{
  VCRateControlServerBag *v6;
  uint64_t v7;
  NSObject *v8;
  _BOOL4 experimentEnabled;
  uint64_t v10;
  uint64_t v11;
  NSObject *v12;
  const char *v13;
  NSObject *v14;
  uint32_t v15;
  uint64_t v16;
  NSObject *v17;
  objc_super v19;
  uint8_t buf[4];
  uint64_t v21;
  __int16 v22;
  const char *v23;
  __int16 v24;
  int v25;
  __int16 v26;
  int v27;
  __int16 v28;
  _BOOL4 v29;
  __int16 v30;
  uint64_t v31;
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  v19.receiver = self;
  v19.super_class = (Class)VCRateControlServerBag;
  v6 = -[VCRateControlServerBag init](&v19, sel_init);
  if (!v6)
    return v6;
  if (a3 != 1 && a3 != 6)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() < 5)
      goto LABEL_15;
    v11 = VRTraceErrorLogLevelToCSTR();
    v12 = *MEMORY[0x1E0CF2758];
    if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
      goto LABEL_15;
    *(_DWORD *)buf = 136315906;
    v21 = v11;
    v22 = 2080;
    v23 = "-[VCRateControlServerBag initWithMode:serverBagDict:]";
    v24 = 1024;
    v25 = 144;
    v26 = 1024;
    v27 = a3;
    v13 = "AVCRC [%s] %s:%d Unsupported operating mode %d";
    v14 = v12;
    v15 = 34;
    goto LABEL_14;
  }
  if (!objc_msgSend(a4, "count"))
  {
    if ((int)VRTraceGetErrorLogLevelForModule() < 5)
      goto LABEL_15;
    v16 = VRTraceErrorLogLevelToCSTR();
    v17 = *MEMORY[0x1E0CF2758];
    if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
      goto LABEL_15;
    *(_DWORD *)buf = 136315650;
    v21 = v16;
    v22 = 2080;
    v23 = "-[VCRateControlServerBag initWithMode:serverBagDict:]";
    v24 = 1024;
    v25 = 150;
    v13 = "AVCRC [%s] %s:%d Server bag dictionary is empty.";
    v14 = v17;
    v15 = 28;
LABEL_14:
    _os_log_impl(&dword_1D8A54000, v14, OS_LOG_TYPE_DEFAULT, v13, buf, v15);
LABEL_15:

    return 0;
  }
  v6->_operatingMode = a3;
  v6->_serverBagDict = (NSDictionary *)a4;
  v6->_experimentGroupIndex = (NSNumber *)&unk_1E9EF6668;
  v6->_experimentEnabled = VCDefaults_GetBoolValueForKey(CFSTR("enableVCRateControlExperiment"), 1);
  v6->_defaultExperimentConfigString = (NSString *)VCDefaults_CopyStringValueForKey(CFSTR("vcrcExperimentConfig"));
  if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
  {
    v7 = VRTraceErrorLogLevelToCSTR();
    v8 = *MEMORY[0x1E0CF2758];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
    {
      experimentEnabled = v6->_experimentEnabled;
      v10 = objc_msgSend((id)objc_msgSend((id)objc_msgSend(a4, "allKeys"), "description"), "UTF8String");
      *(_DWORD *)buf = 136316418;
      v21 = v7;
      v22 = 2080;
      v23 = "-[VCRateControlServerBag initWithMode:serverBagDict:]";
      v24 = 1024;
      v25 = 160;
      v26 = 1024;
      v27 = a3;
      v28 = 1024;
      v29 = experimentEnabled;
      v30 = 2080;
      v31 = v10;
      _os_log_impl(&dword_1D8A54000, v8, OS_LOG_TYPE_DEFAULT, "AVCRC [%s] %s:%d operatingMode=%d, experimentEnabled=%d, keys=%s", buf, 0x32u);
    }
  }
  return v6;
}

- (void)dealloc
{
  objc_super v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];

  v3.receiver = self;
  v3.super_class = (Class)VCRateControlServerBag;
  -[VCRateControlServerBag dealloc](&v3, sel_dealloc);
}

- (BOOL)containsAllSecondaryKeysWithPrimaryKey:(id)a3
{
  id v5;
  id v6;
  void *v7;

  v5 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithArray:", -[NSDictionary allKeys](self->_serverBagDict, "allKeys"));
  objc_msgSend(v5, "addObjectsFromArray:", objc_msgSend(-[VCRateControlServerBag getExperimentConfig:defaultValue:](self, "getExperimentConfig:defaultValue:", 1, &stru_1E9E58EE0), "componentsSeparatedByString:", CFSTR(",")));
  v6 = +[VCRateControlServerBag groupKeysWithMode:primaryKey:](VCRateControlServerBag, "groupKeysWithMode:primaryKey:", self->_operatingMode, a3);
  v7 = (void *)objc_msgSend(MEMORY[0x1E0C99E60], "setWithArray:", v6);
  return objc_msgSend(v7, "isSubsetOfSet:", objc_msgSend(MEMORY[0x1E0C99E60], "setWithArray:", v5));
}

- (id)valueForType:(int)a3 value:(id)a4
{
  id result;
  void *v5;
  double v6;
  double v7;
  uint64_t v8;
  NSObject *v9;

  if (a3 == -1)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      v8 = VRTraceErrorLogLevelToCSTR();
      v9 = *MEMORY[0x1E0CF2758];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
        -[VCRateControlServerBag valueForType:value:].cold.1(v8, v9);
    }
    return &unk_1E9EF6668;
  }
  else
  {
    result = a4;
    if (a3 == 2)
    {
      v5 = (void *)MEMORY[0x1E0CB37E8];
      objc_msgSend(a4, "doubleValue");
      v7 = 100.0;
      return (id)objc_msgSend(v5, "numberWithDouble:", v6 / v7);
    }
    if (a3 == 1)
    {
      v5 = (void *)MEMORY[0x1E0CB37E8];
      objc_msgSend(a4, "doubleValue");
      v7 = 1000.0;
      return (id)objc_msgSend(v5, "numberWithDouble:", v6 / v7);
    }
  }
  return result;
}

- (id)valueForSecondaryKeyWithPrimaryKey:(id)a3 secondaryKey:(id)a4 type:(int)a5
{
  uint64_t v5;
  void *v8;
  id v10;
  uint64_t v11;
  NSObject *v12;

  v5 = *(_QWORD *)&a5;
  v8 = (void *)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@-%@-%@"), +[VCRateControlServerBag prefixForMode:](VCRateControlServerBag, "prefixForMode:", self->_operatingMode), a3, a4);
  if ((objc_msgSend(a3, "isEqualToString:", CFSTR("experiment")) & 1) != 0)
  {
    if (!-[NSDictionary objectForKeyedSubscript:](self->_serverBagDict, "objectForKeyedSubscript:", v8))
      return &stru_1E9E58EE0;
    goto LABEL_6;
  }
  v10 = -[VCRateControlServerBag getExperimentValueForKey:](self, "getExperimentValueForKey:", v8);
  if (v10)
    return -[VCRateControlServerBag valueForType:value:](self, "valueForType:value:", v5, v10);
  if (-[NSDictionary objectForKeyedSubscript:](self->_serverBagDict, "objectForKeyedSubscript:", v8))
  {
LABEL_6:
    v10 = -[NSDictionary objectForKeyedSubscript:](self->_serverBagDict, "objectForKeyedSubscript:", v8);
    return -[VCRateControlServerBag valueForType:value:](self, "valueForType:value:", v5, v10);
  }
  if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
  {
    v11 = VRTraceErrorLogLevelToCSTR();
    v12 = *MEMORY[0x1E0CF2758];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
      -[VCRateControlServerBag valueForSecondaryKeyWithPrimaryKey:secondaryKey:type:].cold.1(v11, v8, v12);
  }
  return &unk_1E9EF6668;
}

- (id)getExperimentConfig:(unsigned __int8)a3 defaultValue:(id)a4
{
  unsigned int v5;
  NSString *v7;
  NSString *defaultExperimentConfigString;
  uint64_t v9;
  NSObject *v10;
  int v12;
  uint64_t v13;
  __int16 v14;
  const char *v15;
  __int16 v16;
  int v17;
  __int16 v18;
  NSString *v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  if (self->_experimentEnabled)
  {
    v5 = a3;
    v7 = -[VCRateControlServerBag valueForSecondaryKeyWithPrimaryKey:secondaryKey:type:](self, "valueForSecondaryKeyWithPrimaryKey:secondaryKey:type:", CFSTR("experiment"), CFSTR("experimentConfig"), 0);
    defaultExperimentConfigString = self->_defaultExperimentConfigString;
    if (defaultExperimentConfigString)
    {
      if ((int)VRTraceGetErrorLogLevelForModule() >= 5)
      {
        v9 = VRTraceErrorLogLevelToCSTR();
        v10 = *MEMORY[0x1E0CF2758];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
        {
          v12 = 136315906;
          v13 = v9;
          v14 = 2080;
          v15 = "-[VCRateControlServerBag getExperimentConfig:defaultValue:]";
          v16 = 1024;
          v17 = 221;
          v18 = 2112;
          v19 = defaultExperimentConfigString;
          _os_log_impl(&dword_1D8A54000, v10, OS_LOG_TYPE_DEFAULT, "AVCRC [%s] %s:%d Use default experiment string:%@", (uint8_t *)&v12, 0x26u);
        }
      }
    }
    else
    {
      defaultExperimentConfigString = v7;
    }
    if (!-[NSString isEqualToString:](defaultExperimentConfigString, "isEqualToString:", &stru_1E9E58EE0))
      return -[NSArray objectAtIndexedSubscript:](-[NSString componentsSeparatedByString:](defaultExperimentConfigString, "componentsSeparatedByString:", CFSTR(";")),
               "objectAtIndexedSubscript:",
               v5);
  }
  return a4;
}

- (int)experimentVersion
{
  int result;

  result = -[VCRateControlServerBag containsAllSecondaryKeysWithPrimaryKey:](self, "containsAllSecondaryKeysWithPrimaryKey:", CFSTR("experiment"));
  if (result)
    return objc_msgSend(-[VCRateControlServerBag getExperimentConfig:defaultValue:](self, "getExperimentConfig:defaultValue:", 0, CFSTR("0")), "intValue");
  return result;
}

- (NSNumber)experimentGroupIndex
{
  BOOL v3;
  NSNumber *experimentGroupIndex;
  id v5;
  NSNumber *v6;
  void *v8;
  double v9;
  uint32_t v10;
  uint64_t v11;
  unsigned __int8 v12;
  double v13;
  double v14;
  double v15;
  double v16;
  NSNumber *v18;
  NSNumber *v19;
  uint64_t v20;
  NSObject *v21;
  int v22;
  uint64_t v23;
  __int16 v24;
  const char *v25;
  __int16 v26;
  int v27;
  __int16 v28;
  int v29;
  __int16 v30;
  id v31;
  __int16 v32;
  double v33;
  uint64_t v34;

  v34 = *MEMORY[0x1E0C80C00];
  v3 = -[NSNumber isEqualToNumber:](self->_experimentGroupIndex, "isEqualToNumber:", &unk_1E9EF6668);
  experimentGroupIndex = self->_experimentGroupIndex;
  if (!v3)
  {
    v6 = experimentGroupIndex;
    return v6;
  }
  self->_experimentGroupIndex = (NSNumber *)&unk_1E9EF6680;
  CFRetain(&unk_1E9EF6680);
  if (experimentGroupIndex)
    CFRelease(experimentGroupIndex);
  if (-[VCRateControlServerBag containsAllSecondaryKeysWithPrimaryKey:](self, "containsAllSecondaryKeysWithPrimaryKey:", CFSTR("experiment")))
  {
    v5 = -[VCRateControlServerBag getExperimentConfig:defaultValue:](self, "getExperimentConfig:defaultValue:", 2, &stru_1E9E58EE0);
    if (objc_msgSend(v5, "isEqualToString:", &stru_1E9E58EE0))
    {
      v6 = self->_experimentGroupIndex;
      return v6;
    }
    v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithArray:", objc_msgSend(v5, "componentsSeparatedByString:", CFSTR(",")));
    objc_msgSend((id)objc_msgSend(v8, "objectAtIndexedSubscript:", 0), "doubleValue");
    if (v9 < 0.05)
      objc_msgSend(v8, "setObject:atIndexedSubscript:", &unk_1E9EFB1D8, 0);
    v10 = arc4random();
    if (objc_msgSend(v8, "count"))
    {
      v11 = 0;
      v12 = 0;
      v13 = (double)v10 / 4294967300.0;
      v14 = 0.0;
      while (1)
      {
        objc_msgSend((id)objc_msgSend(v8, "objectAtIndexedSubscript:", v11), "doubleValue");
        v14 = v14 + v15;
        objc_msgSend((id)objc_msgSend(v8, "objectAtIndexedSubscript:", v11), "doubleValue");
        if (v16 >= 0.05 && v13 <= v14)
          break;
        v11 = ++v12;
        if (objc_msgSend(v8, "count") <= (unint64_t)v12)
          goto LABEL_27;
      }
      v18 = self->_experimentGroupIndex;
      v19 = (NSNumber *)objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedChar:", v12);
      self->_experimentGroupIndex = v19;
      if (v19)
        CFRetain(v19);
      if (v18)
        CFRelease(v18);
      if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
      {
        v20 = VRTraceErrorLogLevelToCSTR();
        v21 = *MEMORY[0x1E0CF2758];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
        {
          v22 = 136316418;
          v23 = v20;
          v24 = 2080;
          v25 = "-[VCRateControlServerBag experimentGroupIndex]";
          v26 = 1024;
          v27 = 263;
          v28 = 1024;
          v29 = v12;
          v30 = 2112;
          v31 = v5;
          v32 = 2048;
          v33 = v13;
          _os_log_impl(&dword_1D8A54000, v21, OS_LOG_TYPE_DEFAULT, "AVCRC [%s] %s:%d VCRC Experiment groupIndex=%d populationDistribution=%@ randomValue=%f", (uint8_t *)&v22, 0x36u);
        }
      }
    }
LABEL_27:

  }
  return self->_experimentGroupIndex;
}

- (id)getExperimentValueForKey:(id)a3
{
  NSNumber *v5;
  uint64_t v6;

  v5 = -[VCRateControlServerBag experimentGroupIndex](self, "experimentGroupIndex");
  if (-[NSNumber isEqualToNumber:](v5, "isEqualToNumber:", &unk_1E9EF6668))
    return 0;
  v6 = objc_msgSend((id)objc_msgSend(-[VCRateControlServerBag getExperimentConfig:defaultValue:](self, "getExperimentConfig:defaultValue:", 1, &stru_1E9E58EE0), "componentsSeparatedByString:", CFSTR(",")), "indexOfObject:", a3);
  if (v6 == 0x7FFFFFFFFFFFFFFFLL)
    return 0;
  else
    return (id)objc_msgSend((id)objc_msgSend((id)objc_msgSend((id)objc_msgSend(-[VCRateControlServerBag getExperimentConfig:defaultValue:](self, "getExperimentConfig:defaultValue:", 3, &stru_1E9E58EE0), "componentsSeparatedByString:", CFSTR(",")), "objectAtIndexedSubscript:", -[NSNumber unsignedIntValue](v5, "unsignedIntValue")), "componentsSeparatedByString:", CFSTR("_")), "objectAtIndexedSubscript:", v6);
}

- (NSDictionary)serverBagDictionary
{
  return self->_serverBagDict;
}

- (void)valueForType:(uint64_t)a1 value:(NSObject *)a2 .cold.1(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;
  __int16 v4;
  const char *v5;
  __int16 v6;
  int v7;
  __int16 v8;
  int v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v2 = 136315906;
  v3 = a1;
  v4 = 2080;
  v5 = "-[VCRateControlServerBag valueForType:value:]";
  v6 = 1024;
  v7 = 189;
  v8 = 1024;
  v9 = -1;
  _os_log_error_impl(&dword_1D8A54000, a2, OS_LOG_TYPE_ERROR, "AVCRC [%s] %s:%d Invalid type=%d", (uint8_t *)&v2, 0x22u);
}

- (void)valueForSecondaryKeyWithPrimaryKey:(uint64_t)a1 secondaryKey:(void *)a2 type:(NSObject *)a3 .cold.1(uint64_t a1, void *a2, NSObject *a3)
{
  int v4;
  uint64_t v5;
  __int16 v6;
  const char *v7;
  __int16 v8;
  int v9;
  __int16 v10;
  uint64_t v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v4 = 136315906;
  v5 = a1;
  v6 = 2080;
  v7 = "-[VCRateControlServerBag valueForSecondaryKeyWithPrimaryKey:secondaryKey:type:]";
  v8 = 1024;
  v9 = 207;
  v10 = 2080;
  v11 = objc_msgSend(a2, "UTF8String");
  _os_log_error_impl(&dword_1D8A54000, a3, OS_LOG_TYPE_ERROR, "AVCRC [%s] %s:%d Could not find key %s in VCRC Server Bag!", (uint8_t *)&v4, 0x26u);
}

@end
