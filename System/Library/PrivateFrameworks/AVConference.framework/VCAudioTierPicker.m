@implementation VCAudioTierPicker

- (VCAudioTierPicker)initWithConfig:(id *)a3
{
  VCAudioTierPicker *v4;
  __int128 v5;
  _OWORD v7[3];
  objc_super v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  v8.receiver = self;
  v8.super_class = (Class)VCAudioTierPicker;
  v4 = -[VCAudioTierPicker init](&v8, sel_init);
  if (v4)
  {
    v4->_tierTablePlist = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    v4->_audioPayloads = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E0C99E20]);
    v5 = *(_OWORD *)&a3->var2;
    v7[0] = *(_OWORD *)&a3->var0;
    v7[1] = v5;
    v7[2] = *(_OWORD *)&a3->var4;
    if (!-[VCAudioTierPicker setupTierPickerForConfig:](v4, "setupTierPickerForConfig:", v7))
    {

      return 0;
    }
  }
  return v4;
}

- (BOOL)reconfigureTierPicker:(id *)a3
{
  uint64_t v5;
  NSObject *v6;
  int mode;
  int var0;
  __int128 v9;
  _BYTE v11[48];
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
  {
    v5 = VRTraceErrorLogLevelToCSTR();
    v6 = *MEMORY[0x1E0CF2758];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
    {
      mode = self->_config.mode;
      var0 = a3->var0;
      *(_DWORD *)v11 = 136316162;
      *(_QWORD *)&v11[4] = v5;
      *(_WORD *)&v11[12] = 2080;
      *(_QWORD *)&v11[14] = "-[VCAudioTierPicker reconfigureTierPicker:]";
      *(_WORD *)&v11[22] = 1024;
      *(_DWORD *)&v11[24] = 227;
      *(_WORD *)&v11[28] = 1024;
      *(_DWORD *)&v11[30] = mode;
      *(_WORD *)&v11[34] = 1024;
      *(_DWORD *)&v11[36] = var0;
      _os_log_impl(&dword_1D8A54000, v6, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d Reconfiguring audio tier picker (%u -> %u)", v11, 0x28u);
    }
  }

  self->_tierTablesForRedNumPayloads = 0;
  self->_bitrateLimits = 0;
  v9 = *(_OWORD *)&a3->var2;
  *(_OWORD *)v11 = *(_OWORD *)&a3->var0;
  *(_OWORD *)&v11[16] = v9;
  *(_OWORD *)&v11[32] = *(_OWORD *)&a3->var4;
  return -[VCAudioTierPicker setupTierPickerForConfig:](self, "setupTierPickerForConfig:", v11);
}

- (id)configToString:(id *)a3
{
  return (id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("{ VCAudioTierPickerConfig: mode=%d headerSize=%lu usingCellular=%d isUseCaseWatchContinuity=%d defaultMaxCap=%lu alwaysOnAudioRedundancyEnabled=%d cellularAllowRedLowBitratesEnabled=%d wifiAllowRedLowBitratesEnabled=%d supportedAudioPayloadConfigs=(%@) supportedPacketsPerBundle=(%@) supportedRedNumPayloads=(%@) }"), a3->var0, a3->var4, a3->var5, a3->var6, a3->var7, a3->var8, a3->var9, a3->var10, a3->var1, a3->var2, a3->var3);
}

- (void)logTierPickerConfig:(id *)a3
{
  uint64_t v4;
  NSObject *v5;
  int var0;
  uint64_t var4;
  _BOOL4 var5;
  _BOOL4 var6;
  uint64_t var7;
  _BOOL4 var8;
  _BOOL4 var9;
  _BOOL4 var10;
  __CFArray *var2;
  __CFArray *var3;
  __CFArray *var1;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t i;
  uint64_t v21;
  uint64_t v22;
  NSObject *v23;
  _BYTE v24[128];
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  uint8_t buf[4];
  uint64_t v30;
  __int16 v31;
  const char *v32;
  __int16 v33;
  int v34;
  __int16 v35;
  _BYTE v36[14];
  __int16 v37;
  _BOOL4 v38;
  __int16 v39;
  _BOOL4 v40;
  __int16 v41;
  uint64_t v42;
  __int16 v43;
  _BOOL4 v44;
  __int16 v45;
  _BOOL4 v46;
  __int16 v47;
  _BOOL4 v48;
  __int16 v49;
  __CFArray *v50;
  __int16 v51;
  __CFArray *v52;
  uint64_t v53;

  v53 = *MEMORY[0x1E0C80C00];
  if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
  {
    v4 = VRTraceErrorLogLevelToCSTR();
    v5 = *MEMORY[0x1E0CF2758];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
    {
      var0 = a3->var0;
      var4 = a3->var4;
      var5 = a3->var5;
      var6 = a3->var6;
      var7 = a3->var7;
      var8 = a3->var8;
      var9 = a3->var9;
      var10 = a3->var10;
      var2 = a3->var2;
      var3 = a3->var3;
      *(_DWORD *)buf = 136318210;
      v30 = v4;
      v31 = 2080;
      v32 = "-[VCAudioTierPicker logTierPickerConfig:]";
      v33 = 1024;
      v34 = 241;
      v35 = 1024;
      *(_DWORD *)v36 = var0;
      *(_WORD *)&v36[4] = 2048;
      *(_QWORD *)&v36[6] = var4;
      v37 = 1024;
      v38 = var5;
      v39 = 1024;
      v40 = var6;
      v41 = 2048;
      v42 = var7;
      v43 = 1024;
      v44 = var8;
      v45 = 1024;
      v46 = var9;
      v47 = 1024;
      v48 = var10;
      v49 = 2112;
      v50 = var2;
      v51 = 2112;
      v52 = var3;
      _os_log_impl(&dword_1D8A54000, v5, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d { VCAudioTierPickerConfig: mode=%d headerSize=%lu usingCellular=%d isUseCaseWatchContinuity=%d defaultMaxCap=%lu alwaysOnAudioRedundancyEnabled=%d cellularAllowRedLowBitratesEnabled=%d wifiAllowRedLowBitratesEnabled=%d supportedPacketsPerBundle=(%@) supportedRedNumPayloads=(%@) }", buf, 0x68u);
    }
  }
  v27 = 0u;
  v28 = 0u;
  v25 = 0u;
  v26 = 0u;
  var1 = a3->var1;
  v17 = -[__CFArray countByEnumeratingWithState:objects:count:](var1, "countByEnumeratingWithState:objects:count:", &v25, v24, 16);
  if (v17)
  {
    v18 = v17;
    v19 = *(_QWORD *)v26;
    do
    {
      for (i = 0; i != v18; ++i)
      {
        if (*(_QWORD *)v26 != v19)
          objc_enumerationMutation(var1);
        v21 = *(_QWORD *)(*((_QWORD *)&v25 + 1) + 8 * i);
        if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
        {
          v22 = VRTraceErrorLogLevelToCSTR();
          v23 = *MEMORY[0x1E0CF2758];
          if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 136315906;
            v30 = v22;
            v31 = 2080;
            v32 = "-[VCAudioTierPicker logTierPickerConfig:]";
            v33 = 1024;
            v34 = 243;
            v35 = 2112;
            *(_QWORD *)v36 = v21;
            _os_log_impl(&dword_1D8A54000, v23, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d  { VCAudioTierPickerConfig: supportedAudioPayloadConfig=(%@)}", buf, 0x26u);
          }
        }
      }
      v18 = -[__CFArray countByEnumeratingWithState:objects:count:](var1, "countByEnumeratingWithState:objects:count:", &v25, v24, 16);
    }
    while (v18);
  }
}

- (BOOL)setupTierPickerForConfig:(id *)a3
{
  int var0;
  int ErrorLogLevelForModule;
  uint64_t v7;
  NSObject *v8;
  __int128 v9;
  id v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  NSMutableDictionary *v14;
  BitrateLimits *v15;
  __CFArray *var3;
  uint64_t v17;
  void **p_cache;
  uint64_t v19;
  os_log_t *v20;
  uint64_t i;
  void *v22;
  int v23;
  int v24;
  uint64_t v25;
  NSObject *v26;
  int v27;
  _BOOL4 var11;
  _BOOL4 var5;
  uint64_t v30;
  id v31;
  uint64_t v32;
  NSObject *v33;
  int v34;
  _BOOL4 v35;
  _BOOL4 v36;
  uint64_t v37;
  void *v38;
  __CFArray *var2;
  __CFArray *var1;
  uint64_t v41;
  __CFArray *v42;
  __CFArray *v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t j;
  void *v48;
  void *v49;
  BOOL v50;
  int v51;
  uint64_t v52;
  NSObject *v53;
  uint64_t v54;
  int v55;
  uint64_t v57;
  __CFArray *v58;
  uint64_t v59;
  _BYTE v60[128];
  __int128 v61;
  __int128 v62;
  __int128 v63;
  __int128 v64;
  _BYTE buf[48];
  uint64_t v66;
  _BYTE v67[128];
  __int128 v68;
  __int128 v69;
  __int128 v70;
  __int128 v71;
  uint64_t v72;

  v72 = *MEMORY[0x1E0C80C00];
  var0 = a3->var0;
  ErrorLogLevelForModule = VRTraceGetErrorLogLevelForModule();
  if (!var0)
  {
    if (ErrorLogLevelForModule >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
        -[VCAudioTierPicker setupTierPickerForConfig:].cold.1();
    }
    return 0;
  }
  if (ErrorLogLevelForModule >= 7)
  {
    v7 = VRTraceErrorLogLevelToCSTR();
    v8 = *MEMORY[0x1E0CF2758];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
    {
      v9 = *(_OWORD *)&a3->var2;
      *(_OWORD *)buf = *(_OWORD *)&a3->var0;
      *(_OWORD *)&buf[16] = v9;
      *(_OWORD *)&buf[32] = *(_OWORD *)&a3->var4;
      v10 = -[VCAudioTierPicker configToString:](self, "configToString:", buf);
      *(_DWORD *)buf = 136315906;
      *(_QWORD *)&buf[4] = v7;
      *(_WORD *)&buf[12] = 2080;
      *(_QWORD *)&buf[14] = "-[VCAudioTierPicker setupTierPickerForConfig:]";
      *(_WORD *)&buf[22] = 1024;
      *(_DWORD *)&buf[24] = 253;
      *(_WORD *)&buf[28] = 2112;
      *(_QWORD *)&buf[30] = v10;
      _os_log_impl(&dword_1D8A54000, v8, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d Setting up Audio Tier Picker with config %@", buf, 0x26u);
    }
  }
  v11 = *(_OWORD *)&a3->var2;
  *(_OWORD *)buf = *(_OWORD *)&a3->var0;
  *(_OWORD *)&buf[16] = v11;
  *(_OWORD *)&buf[32] = *(_OWORD *)&a3->var4;
  -[VCAudioTierPicker logTierPickerConfig:](self, "logTierPickerConfig:", buf);
  v12 = *(_OWORD *)&a3->var0;
  v13 = *(_OWORD *)&a3->var2;
  *(_OWORD *)&self->_config.headerSize = *(_OWORD *)&a3->var4;
  *(_OWORD *)&self->_config.supportedPacketsPerBundle = v13;
  *(_OWORD *)&self->_config.mode = v12;
  v14 = (NSMutableDictionary *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E08]), "initWithCapacity:", -[__CFArray count](a3->var3, "count"));
  self->_tierTablesForRedNumPayloads = v14;
  if (!v14)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
        -[VCAudioTierPicker setupTierPickerForConfig:].cold.2();
    }
    return 0;
  }
  v15 = -[BitrateLimits initWithOperatingMode:withBitrateCap:useCaseWatchContinuity:]([BitrateLimits alloc], "initWithOperatingMode:withBitrateCap:useCaseWatchContinuity:", a3->var0, a3->var7, a3->var6);
  self->_bitrateLimits = v15;
  if (!v15)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
        -[VCAudioTierPicker setupTierPickerForConfig:].cold.3();
    }
    return 0;
  }
  v70 = 0u;
  v71 = 0u;
  v68 = 0u;
  v69 = 0u;
  var3 = a3->var3;
  v17 = -[__CFArray countByEnumeratingWithState:objects:count:](var3, "countByEnumeratingWithState:objects:count:", &v68, v67, 16);
  p_cache = AVCQoSMonitor.cache;
  if (v17)
  {
    v19 = v17;
    v59 = *(_QWORD *)v69;
    v20 = (os_log_t *)MEMORY[0x1E0CF2758];
    v58 = var3;
    while (2)
    {
      for (i = 0; i != v19; ++i)
      {
        if (*(_QWORD *)v69 != v59)
          objc_enumerationMutation(var3);
        v22 = *(void **)(*((_QWORD *)&v68 + 1) + 8 * i);
        v23 = objc_msgSend(p_cache + 393, "usePlistForAudioTierTableFromMode:", a3->var0);
        v24 = VRTraceGetErrorLogLevelForModule();
        if (v23)
        {
          if (v24 >= 7)
          {
            v25 = VRTraceErrorLogLevelToCSTR();
            v26 = *v20;
            if (os_log_type_enabled(*v20, OS_LOG_TYPE_DEFAULT))
            {
              v27 = a3->var0;
              var11 = a3->var11;
              var5 = a3->var5;
              v30 = objc_msgSend(v22, "unsignedLongValue");
              *(_DWORD *)buf = 136316674;
              *(_QWORD *)&buf[4] = v25;
              *(_WORD *)&buf[12] = 2080;
              *(_QWORD *)&buf[14] = "-[VCAudioTierPicker setupTierPickerForConfig:]";
              *(_WORD *)&buf[22] = 1024;
              *(_DWORD *)&buf[24] = 284;
              *(_WORD *)&buf[28] = 1024;
              *(_DWORD *)&buf[30] = v27;
              p_cache = (void **)(AVCQoSMonitor + 16);
              *(_WORD *)&buf[34] = 1024;
              *(_DWORD *)&buf[36] = var11;
              var3 = v58;
              *(_WORD *)&buf[40] = 1024;
              *(_DWORD *)&buf[42] = var5;
              v20 = (os_log_t *)MEMORY[0x1E0CF2758];
              *(_WORD *)&buf[46] = 2048;
              v66 = v30;
              _os_log_impl(&dword_1D8A54000, v26, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d Using plist for audio tier table for config.mode=%d isIPv4=%{BOOL}d isCellular=%{BOOL}d redNumPayloads=%lu", buf, 0x38u);
            }
          }
          v31 = -[VCAudioTierPicker generateAudioTiersDictFromPlistForBitrateLimits:tierPickerConfig:redNumPayloads:](self, "generateAudioTiersDictFromPlistForBitrateLimits:tierPickerConfig:redNumPayloads:", self->_bitrateLimits, a3, objc_msgSend(v22, "unsignedIntegerValue"));
          if (!v31)
          {
            v51 = VRTraceGetErrorLogLevelForModule();
            if (v51 >= 3)
            {
              v52 = VRTraceErrorLogLevelToCSTR();
              v53 = *v20;
              if (os_log_type_enabled(*v20, OS_LOG_TYPE_ERROR))
              {
                v54 = objc_msgSend(v22, "unsignedLongValue");
                v55 = a3->var0;
                *(_DWORD *)buf = 136316162;
                *(_QWORD *)&buf[4] = v52;
                *(_WORD *)&buf[12] = 2080;
                *(_QWORD *)&buf[14] = "-[VCAudioTierPicker setupTierPickerForConfig:]";
                *(_WORD *)&buf[22] = 1024;
                *(_DWORD *)&buf[24] = 287;
                *(_WORD *)&buf[28] = 2048;
                *(_QWORD *)&buf[30] = v54;
                *(_WORD *)&buf[38] = 1024;
                *(_DWORD *)&buf[40] = v55;
                _os_log_error_impl(&dword_1D8A54000, v53, OS_LOG_TYPE_ERROR, " [%s] %s:%d Failed to load Audio Tier map from plist for redNumPayloads=%lu. config.mode=%d", buf, 0x2Cu);
              }
            }
            return 0;
          }
        }
        else
        {
          if (v24 >= 7)
          {
            v32 = VRTraceErrorLogLevelToCSTR();
            v33 = *v20;
            if (os_log_type_enabled(*v20, OS_LOG_TYPE_DEFAULT))
            {
              v34 = a3->var0;
              v35 = a3->var11;
              v36 = a3->var5;
              v37 = objc_msgSend(v22, "unsignedLongValue");
              *(_DWORD *)buf = 136316674;
              *(_QWORD *)&buf[4] = v32;
              *(_WORD *)&buf[12] = 2080;
              *(_QWORD *)&buf[14] = "-[VCAudioTierPicker setupTierPickerForConfig:]";
              *(_WORD *)&buf[22] = 1024;
              *(_DWORD *)&buf[24] = 291;
              *(_WORD *)&buf[28] = 1024;
              *(_DWORD *)&buf[30] = v34;
              v20 = (os_log_t *)MEMORY[0x1E0CF2758];
              *(_WORD *)&buf[34] = 1024;
              *(_DWORD *)&buf[36] = v35;
              var3 = v58;
              *(_WORD *)&buf[40] = 1024;
              *(_DWORD *)&buf[42] = v36;
              p_cache = AVCQoSMonitor.cache;
              *(_WORD *)&buf[46] = 2048;
              v66 = v37;
              _os_log_impl(&dword_1D8A54000, v33, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d Using algorithm for audio tier table for config.mode=%d isIPv4=%{BOOL}d isCellular=%{BOOL}d redNumPayloads=%lu", buf, 0x38u);
            }
          }
          v38 = p_cache + 393;
          var1 = a3->var1;
          var2 = a3->var2;
          v41 = objc_msgSend(v22, "unsignedIntegerValue");
          LOBYTE(v57) = a3->var6;
          v42 = var2;
          p_cache = AVCQoSMonitor.cache;
          v31 = +[VCAudioTierPicker selectHighestQualityAudioTiers:forBitrateLimits:isHardLimit:](VCAudioTierPicker, "selectHighestQualityAudioTiers:forBitrateLimits:isHardLimit:", objc_msgSend(v38, "allPossibleCombinations:supportedPacketsPerBundle:redNumPayloads:headerSize:tierPickerMode:usingCellular:useCaseWatchContinuity:", var1, v42, v41, a3->var4, a3->var0, a3->var5, v57), self->_bitrateLimits, a3->var0 == 6);
          if (!v31)
          {
            if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
            {
              VRTraceErrorLogLevelToCSTR();
              if (os_log_type_enabled(*v20, OS_LOG_TYPE_ERROR))
                -[VCAudioTierPicker setupTierPickerForConfig:].cold.4();
            }
            return 0;
          }
        }
        -[NSMutableDictionary setObject:forKeyedSubscript:](self->_tierTablesForRedNumPayloads, "setObject:forKeyedSubscript:", v31, v22);
      }
      v19 = -[__CFArray countByEnumeratingWithState:objects:count:](var3, "countByEnumeratingWithState:objects:count:", &v68, v67, 16);
      if (v19)
        continue;
      break;
    }
  }
  -[VCAudioTierPicker generateAudioPayloadsFromConfig:](self, "generateAudioPayloadsFromConfig:", a3);
  if ((objc_msgSend(p_cache + 393, "usePlistForAudioTierTableFromMode:", a3->var0) & 1) == 0
    && !+[VCDefaults BOOLeanValueForKey:defaultValue:](VCDefaults, "BOOLeanValueForKey:defaultValue:", CFSTR("alwaysOnAudioRedundancyDisabled"), !a3->var8))
  {
    -[VCAudioTierPicker setupAlwaysOnRedTiersForSupportedRed:usingCellular:](self, "setupAlwaysOnRedTiersForSupportedRed:usingCellular:", a3->var3, a3->var5);
  }
  v63 = 0u;
  v64 = 0u;
  v61 = 0u;
  v62 = 0u;
  v43 = a3->var3;
  v44 = -[__CFArray countByEnumeratingWithState:objects:count:](v43, "countByEnumeratingWithState:objects:count:", &v61, v60, 16);
  if (v44)
  {
    v45 = v44;
    v46 = *(_QWORD *)v62;
    do
    {
      for (j = 0; j != v45; ++j)
      {
        if (*(_QWORD *)v62 != v46)
          objc_enumerationMutation(v43);
        -[VCAudioTierPicker printCreatedAudioTiers:](self, "printCreatedAudioTiers:", -[NSMutableDictionary objectForKeyedSubscript:](self->_tierTablesForRedNumPayloads, "objectForKeyedSubscript:", *(_QWORD *)(*((_QWORD *)&v61 + 1) + 8 * j)));
      }
      v45 = -[__CFArray countByEnumeratingWithState:objects:count:](v43, "countByEnumeratingWithState:objects:count:", &v61, v60, 16);
    }
    while (v45);
  }
  v48 = (void *)-[NSMutableDictionary objectForKeyedSubscript:](self->_tierTablesForRedNumPayloads, "objectForKeyedSubscript:", -[__CFArray objectAtIndexedSubscript:](a3->var3, "objectAtIndexedSubscript:", 0));
  self->_defaultTier = (VCAudioTier *)objc_msgSend(v48, "objectForKeyedSubscript:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", -[BitrateLimits defaultValueForNetwork:](self->_bitrateLimits, "defaultValueForNetwork:", a3->var5)));
  v49 = (void *)-[NSMutableDictionary objectForKeyedSubscript:](self->_tierTablesForRedNumPayloads, "objectForKeyedSubscript:", -[__CFArray objectAtIndexedSubscript:](a3->var3, "objectAtIndexedSubscript:", 0));
  v50 = 1;
  self->_fallbackTier = (VCAudioTier *)objc_msgSend(v49, "objectForKeyedSubscript:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", -[BitrateLimits defaultValueForNetwork:](self->_bitrateLimits, "defaultValueForNetwork:", 1)));
  return v50;
}

+ (int)tierPickerModeToAVConferenceOperatingMode:(unsigned __int8)a3
{
  if (a3 > 9u)
    return 2;
  else
    return dword_1D910F330[(char)a3];
}

+ (unsigned)operatingModeToTierPickerMode:(int)a3 isLowLatency:(BOOL)a4 preferPlistForTierTable:(BOOL)a5
{
  unsigned __int8 v5;
  BOOL v6;
  char v7;

  v5 = 7;
  switch(a3)
  {
    case 0:
    case 10:
      v5 = 0;
      break;
    case 1:
    case 4:
      if (a5)
        v5 = 5;
      else
        v5 = 4;
      v6 = !a4;
      v7 = 9;
      goto LABEL_12;
    case 2:
      if (a5)
        v5 = 3;
      else
        v5 = 2;
      v6 = !a4;
      v7 = 8;
LABEL_12:
      if (!v6)
        v5 = v7;
      break;
    case 3:
    case 5:
    case 8:
    case 9:
    case 11:
    case 12:
    case 13:
      v5 = 1;
      break;
    case 6:
      v5 = 6;
      break;
    default:
      return v5;
  }
  return v5;
}

- (void)setupAlwaysOnRedTiersForSupportedRed:(id)a3 usingCellular:(BOOL)a4
{
  _BOOL4 v4;
  NSMutableDictionary *tierTablesForRedNumPayloads;
  uint64_t v8;
  NSMutableDictionary *v9;
  id v10;
  uint64_t v11;

  if (a3)
  {
    v4 = a4;
    if (-[NSArray containsObject:](-[BitrateLimits limits](self->_bitrateLimits, "limits"), "containsObject:", &unk_1E9EF6008)&& (unint64_t)objc_msgSend(a3, "count") >= 2)
    {
      objc_msgSend((id)-[NSMutableDictionary objectForKeyedSubscript:](self->_tierTablesForRedNumPayloads, "objectForKeyedSubscript:", objc_msgSend(a3, "objectAtIndexedSubscript:", 0)), "setObject:forKeyedSubscript:", objc_msgSend((id)-[NSMutableDictionary objectForKeyedSubscript:](self->_tierTablesForRedNumPayloads, "objectForKeyedSubscript:", objc_msgSend(a3, "objectAtIndexedSubscript:", 1)), "objectForKeyedSubscript:", &unk_1E9EF6008), &unk_1E9EF6008);
    }
    if (-[NSArray containsObject:](-[BitrateLimits limits](self->_bitrateLimits, "limits"), "containsObject:", &unk_1E9EF6020)&& (unint64_t)objc_msgSend(a3, "count") >= 3)
    {
      objc_msgSend((id)-[NSMutableDictionary objectForKeyedSubscript:](self->_tierTablesForRedNumPayloads, "objectForKeyedSubscript:", objc_msgSend(a3, "objectAtIndexedSubscript:", 0)), "setObject:forKeyedSubscript:", objc_msgSend((id)-[NSMutableDictionary objectForKeyedSubscript:](self->_tierTablesForRedNumPayloads, "objectForKeyedSubscript:", objc_msgSend(a3, "objectAtIndexedSubscript:", 2)), "objectForKeyedSubscript:", &unk_1E9EF6020), &unk_1E9EF6020);
      objc_msgSend((id)-[NSMutableDictionary objectForKeyedSubscript:](self->_tierTablesForRedNumPayloads, "objectForKeyedSubscript:", objc_msgSend(a3, "objectAtIndexedSubscript:", 1)), "setObject:forKeyedSubscript:", objc_msgSend((id)-[NSMutableDictionary objectForKeyedSubscript:](self->_tierTablesForRedNumPayloads, "objectForKeyedSubscript:", objc_msgSend(a3, "objectAtIndexedSubscript:", 2)), "objectForKeyedSubscript:", &unk_1E9EF6020), &unk_1E9EF6020);
    }
    if (-[NSArray containsObject:](-[BitrateLimits limits](self->_bitrateLimits, "limits"), "containsObject:", &unk_1E9EF6038)&& (unint64_t)objc_msgSend(a3, "count") >= 4)
    {
      tierTablesForRedNumPayloads = self->_tierTablesForRedNumPayloads;
      if (v4)
      {
        objc_msgSend((id)-[NSMutableDictionary objectForKeyedSubscript:](self->_tierTablesForRedNumPayloads, "objectForKeyedSubscript:", objc_msgSend(a3, "objectAtIndexedSubscript:", 0)), "setObject:forKeyedSubscript:", objc_msgSend((id)-[NSMutableDictionary objectForKeyedSubscript:](tierTablesForRedNumPayloads, "objectForKeyedSubscript:", objc_msgSend(a3, "objectAtIndexedSubscript:", 2)), "objectForKeyedSubscript:", &unk_1E9EF6038), &unk_1E9EF6038);
        objc_msgSend((id)-[NSMutableDictionary objectForKeyedSubscript:](self->_tierTablesForRedNumPayloads, "objectForKeyedSubscript:", objc_msgSend(a3, "objectAtIndexedSubscript:", 1)), "setObject:forKeyedSubscript:", objc_msgSend((id)-[NSMutableDictionary objectForKeyedSubscript:](self->_tierTablesForRedNumPayloads, "objectForKeyedSubscript:", objc_msgSend(a3, "objectAtIndexedSubscript:", 2)), "objectForKeyedSubscript:", &unk_1E9EF6038), &unk_1E9EF6038);
        v8 = objc_msgSend((id)-[NSMutableDictionary objectForKeyedSubscript:](self->_tierTablesForRedNumPayloads, "objectForKeyedSubscript:", objc_msgSend(a3, "objectAtIndexedSubscript:", 3)), "objectForKeyedSubscript:", &unk_1E9EF6020);
        v9 = self->_tierTablesForRedNumPayloads;
        v10 = a3;
        v11 = 3;
      }
      else
      {
        objc_msgSend((id)-[NSMutableDictionary objectForKeyedSubscript:](self->_tierTablesForRedNumPayloads, "objectForKeyedSubscript:", objc_msgSend(a3, "objectAtIndexedSubscript:", 0)), "setObject:forKeyedSubscript:", objc_msgSend((id)-[NSMutableDictionary objectForKeyedSubscript:](tierTablesForRedNumPayloads, "objectForKeyedSubscript:", objc_msgSend(a3, "objectAtIndexedSubscript:", 3)), "objectForKeyedSubscript:", &unk_1E9EF6038), &unk_1E9EF6038);
        objc_msgSend((id)-[NSMutableDictionary objectForKeyedSubscript:](self->_tierTablesForRedNumPayloads, "objectForKeyedSubscript:", objc_msgSend(a3, "objectAtIndexedSubscript:", 1)), "setObject:forKeyedSubscript:", objc_msgSend((id)-[NSMutableDictionary objectForKeyedSubscript:](self->_tierTablesForRedNumPayloads, "objectForKeyedSubscript:", objc_msgSend(a3, "objectAtIndexedSubscript:", 3)), "objectForKeyedSubscript:", &unk_1E9EF6038), &unk_1E9EF6038);
        v8 = objc_msgSend((id)-[NSMutableDictionary objectForKeyedSubscript:](self->_tierTablesForRedNumPayloads, "objectForKeyedSubscript:", objc_msgSend(a3, "objectAtIndexedSubscript:", 3)), "objectForKeyedSubscript:", &unk_1E9EF6038);
        v9 = self->_tierTablesForRedNumPayloads;
        v10 = a3;
        v11 = 2;
      }
      objc_msgSend((id)-[NSMutableDictionary objectForKeyedSubscript:](v9, "objectForKeyedSubscript:", objc_msgSend(v10, "objectAtIndexedSubscript:", v11)), "setObject:forKeyedSubscript:", v8, &unk_1E9EF6038);
    }
  }
  else if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
  {
    VRTraceErrorLogLevelToCSTR();
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
      -[VCAudioTierPicker setupAlwaysOnRedTiersForSupportedRed:usingCellular:].cold.1();
  }
}

- (void)dealloc
{
  objc_super v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];

  v3.receiver = self;
  v3.super_class = (Class)VCAudioTierPicker;
  -[VCAudioTierPicker dealloc](&v3, sel_dealloc);
}

+ (BOOL)arrayHasObject:(id)a3 withPayloadType:(int)a4
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  _BYTE v11[128];
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v6 = objc_msgSend(a3, "countByEnumeratingWithState:objects:count:", &v12, v11, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v13;
    while (2)
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v13 != v8)
          objc_enumerationMutation(a3);
        if (objc_msgSend(*(id *)(*((_QWORD *)&v12 + 1) + 8 * v9), "payload") == a4)
        {
          LOBYTE(v6) = 1;
          return v6;
        }
        ++v9;
      }
      while (v7 != v9);
      v6 = objc_msgSend(a3, "countByEnumeratingWithState:objects:count:", &v12, v11, 16);
      v7 = v6;
      if (v6)
        continue;
      break;
    }
  }
  return v6;
}

+ (id)allPossibleCombinations:(id)a3 supportedPacketsPerBundle:(id)a4 redNumPayloads:(unsigned int)a5 headerSize:(unsigned int)a6 tierPickerMode:(unsigned __int8)a7 usingCellular:(BOOL)a8 useCaseWatchContinuity:(BOOL)a9
{
  _BOOL4 v11;
  _BOOL4 v12;
  _BOOL4 v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t i;
  uint64_t v22;
  VCAudioTier *v23;
  VCAudioTier *v24;
  id obj;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  id v30;
  unsigned int v31;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  _BOOL4 v36;
  unsigned int v37;
  id v39;
  _QWORD v40[4];
  _BYTE v41[128];
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  _BYTE v46[128];
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  _BYTE v51[128];
  __int128 v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  uint64_t v56;

  v36 = a8;
  v37 = a7;
  v56 = *MEMORY[0x1E0C80C00];
  v39 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v11 = +[VCAudioTierPicker arrayHasObject:withPayloadType:](VCAudioTierPicker, "arrayHasObject:withPayloadType:", a3, 97)|| +[VCAudioTierPicker arrayHasObject:withPayloadType:](VCAudioTierPicker, "arrayHasObject:withPayloadType:", a3, 98)|| +[VCAudioTierPicker arrayHasObject:withPayloadType:](VCAudioTierPicker, "arrayHasObject:withPayloadType:", a3, 108);
  v12 = +[VCAudioTierPicker arrayHasObject:withPayloadType:](VCAudioTierPicker, "arrayHasObject:withPayloadType:", a3, 119);
  v13 = +[VCAudioTierPicker arrayHasObject:withPayloadType:](VCAudioTierPicker, "arrayHasObject:withPayloadType:", a3, 108);
  v31 = +[VCAudioTierPicker tierPickerModeToAVConferenceOperatingMode:](VCAudioTierPicker, "tierPickerModeToAVConferenceOperatingMode:", v37);
  v52 = 0u;
  v53 = 0u;
  v54 = 0u;
  v55 = 0u;
  obj = a3;
  v28 = objc_msgSend(a3, "countByEnumeratingWithState:objects:count:", &v52, v51, 16);
  if (v28)
  {
    v27 = *(_QWORD *)v53;
    do
    {
      v14 = 0;
      do
      {
        if (*(_QWORD *)v53 != v27)
          objc_enumerationMutation(obj);
        v29 = v14;
        v15 = *(void **)(*((_QWORD *)&v52 + 1) + 8 * v14);
        v47 = 0u;
        v48 = 0u;
        v49 = 0u;
        v50 = 0u;
        v30 = (id)objc_msgSend(v15, "supportedBitrates");
        v34 = objc_msgSend(v30, "countByEnumeratingWithState:objects:count:", &v47, v46, 16);
        if (v34)
        {
          v33 = *(_QWORD *)v48;
          do
          {
            v16 = 0;
            do
            {
              if (*(_QWORD *)v48 != v33)
                objc_enumerationMutation(v30);
              v35 = v16;
              v17 = objc_msgSend(*(id *)(*((_QWORD *)&v47 + 1) + 8 * v16), "unsignedIntValue");
              memset(&v40[1], 170, 24);
              v40[0] = v15;
              LOBYTE(v40[1]) = +[VCAudioTier bundlingAppliedByCodecForPayload:mode:](VCAudioTier, "bundlingAppliedByCodecForPayload:mode:", objc_msgSend(v15, "payload"), v31);
              HIDWORD(v40[1]) = v17;
              LODWORD(v40[2]) = 0;
              HIDWORD(v40[2]) = a5;
              v40[3] = a6;
              if (+[VCPayloadUtils canBundleExternallyForPayload:forBundlingScheme:operatingMode:](VCPayloadUtils, "canBundleExternallyForPayload:forBundlingScheme:operatingMode:", objc_msgSend(v15, "payload"), 1, v31))
              {
                v44 = 0u;
                v45 = 0u;
                v42 = 0u;
                v43 = 0u;
                v18 = objc_msgSend(a4, "countByEnumeratingWithState:objects:count:", &v42, v41, 16);
                if (v18)
                {
                  v19 = v18;
                  v20 = *(_QWORD *)v43;
                  do
                  {
                    for (i = 0; i != v19; ++i)
                    {
                      if (*(_QWORD *)v43 != v20)
                        objc_enumerationMutation(a4);
                      v22 = objc_msgSend(*(id *)(*((_QWORD *)&v42 + 1) + 8 * i), "unsignedIntValue");
                      if ((!v12 || objc_msgSend(v15, "payload") != 106)
                        && (!v11 || objc_msgSend(v15, "payload") != 119)
                        && (!v13
                         || objc_msgSend(v15, "payload") != 97
                         && objc_msgSend(v15, "payload") != 98)
                        && (a9
                         || !+[VCAudioTierPicker shouldFilterTierForPayloadConfig:bitRate:packetsPerBundle:mode:redNumPayloads:cellular:](VCAudioTierPicker, "shouldFilterTierForPayloadConfig:bitRate:packetsPerBundle:mode:redNumPayloads:cellular:", v15, v17, v22, v37, a5, v36)))
                      {
                        LODWORD(v40[2]) = v22;
                        v23 = -[VCAudioTier initWithConfig:]([VCAudioTier alloc], "initWithConfig:", v40);
                        objc_msgSend(v39, "addObject:", v23);

                      }
                    }
                    v19 = objc_msgSend(a4, "countByEnumeratingWithState:objects:count:", &v42, v41, 16);
                  }
                  while (v19);
                }
              }
              else if ((!v12
                      || objc_msgSend(v15, "payload") != 122
                      && objc_msgSend(v15, "payload") != 121)
                     && (!v13
                      || objc_msgSend(v15, "payload") != 97
                      && objc_msgSend(v15, "payload") != 98))
              {
                LODWORD(v40[2]) = 1;
                v24 = -[VCAudioTier initWithConfig:]([VCAudioTier alloc], "initWithConfig:", v40);
                objc_msgSend(v39, "addObject:", v24);

              }
              v16 = v35 + 1;
            }
            while (v35 + 1 != v34);
            v34 = objc_msgSend(v30, "countByEnumeratingWithState:objects:count:", &v47, v46, 16);
          }
          while (v34);
        }
        v14 = v29 + 1;
      }
      while (v29 + 1 != v28);
      v28 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v52, v51, 16);
    }
    while (v28);
  }
  return v39;
}

+ (BOOL)usePlistForAudioTierTableFromMode:(unsigned __int8)a3
{
  BOOL result;
  const __CFString *v4;

  result = 1;
  switch(a3)
  {
    case 3u:
    case 5u:
      v4 = CFSTR("usePlistForAudioTierTable");
      goto LABEL_4;
    case 6u:
      v4 = CFSTR("usePlistForAudioTierTableGFT");
LABEL_4:
      result = VCDefaults_GetBoolValueForKey(v4, 1);
      break;
    case 8u:
    case 9u:
      return result;
    default:
      result = 0;
      break;
  }
  return result;
}

+ (BOOL)isModeAudioOnly:(unsigned __int8)a3
{
  return a3 == 8 || (a3 & 0xFE) == 2;
}

+ (BOOL)isModeAudioVideo:(unsigned __int8)a3
{
  return a3 == 9 || (a3 & 0xFE) == 4;
}

+ (BOOL)isModeV2:(unsigned __int8)a3
{
  return a3 == 3 || a3 == 5;
}

+ (BOOL)isModeLowLatency:(unsigned __int8)a3
{
  return (a3 & 0xFE) == 8;
}

+ (BOOL)isModePlistSupported:(unsigned __int8)a3
{
  int v3;
  BOOL result;

  v3 = a3;
  result = objc_msgSend(a1, "isU1ModeWithPlistSupport:");
  if (v3 == 6)
    return 1;
  return result;
}

+ (BOOL)isU1ModeWithPlistSupport:(unsigned __int8)a3
{
  uint64_t v3;

  v3 = a3;
  return +[VCAudioTierPicker isModeV2:](VCAudioTierPicker, "isModeV2:")
      || +[VCAudioTierPicker isModeLowLatency:](VCAudioTierPicker, "isModeLowLatency:", v3);
}

- (id)generateAudioTiersDictFromPlistForBitrateLimits:(id)a3 tierPickerConfig:(id *)a4 redNumPayloads:(unsigned int)a5
{
  uint64_t v8;
  uint64_t v9;
  id v10;
  id v11;
  void *v12;
  const __CFString *v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t i;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v25;
  NSObject *v26;
  uint64_t v27;
  int v28;
  _BOOL4 v29;
  _BOOL4 v30;
  int v31;
  const char *v32;
  NSObject *v33;
  uint32_t v34;
  int ErrorLogLevelForModule;
  uint64_t v36;
  NSObject *v37;
  uint64_t v38;
  int var0;
  uint64_t v40;
  NSObject *v41;
  uint64_t v42;
  int v43;
  _BOOL4 var11;
  _BOOL4 var5;
  _BOOL4 v46;
  _BOOL4 v47;
  id obj;
  uint64_t v49;
  uint64_t v50;
  id v51;
  uint8_t buf[4];
  uint64_t v54;
  __int16 v55;
  const char *v56;
  __int16 v57;
  int v58;
  __int16 v59;
  uint64_t v60;
  __int16 v61;
  int v62;
  __int16 v63;
  unsigned int v64;
  __int16 v65;
  _BOOL4 v66;
  __int16 v67;
  unsigned int v68;
  __int16 v69;
  int v70;
  _BYTE v71[128];
  __int128 v72;
  __int128 v73;
  __int128 v74;
  __int128 v75;
  _BYTE v76[128];
  __int128 v77;
  __int128 v78;
  __int128 v79;
  __int128 v80;
  _BYTE v81[128];
  __int128 v82;
  __int128 v83;
  __int128 v84;
  __int128 v85;
  uint64_t v86;

  v86 = *MEMORY[0x1E0C80C00];
  v8 = -[VCDefaults forceAudioPayload](+[VCDefaults sharedInstance](VCDefaults, "sharedInstance"), "forceAudioPayload");
  v9 = 45;
  if (!a4->var5)
    v9 = 46;
  v47 = +[VCDefaults BOOLeanValueForKey:defaultValue:](VCDefaults, "BOOLeanValueForKey:defaultValue:", CFSTR("rateControlAllowRedLowBitrate"), *(&a4->var0 + v9));
  v46 = +[VCDefaults BOOLeanValueForKey:defaultValue:](VCDefaults, "BOOLeanValueForKey:defaultValue:", CFSTR("alwaysOnAudioRedundancyDisabled"), !a4->var8);
  v10 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  v11 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v12 = v11;
  if (v10)
  {
    if (v11)
    {
      if (+[VCAudioTierPicker isModePlistSupported:](VCAudioTierPicker, "isModePlistSupported:", a4->var0))
      {
        if (a4->var0 == 6)
          v13 = CFSTR("AudioTiers_GFT");
        else
          v13 = CFSTR("AudioTiers_U1");
        v51 = -[VCAudioTierPicker loadAudioTiersFromPlist:](self, "loadAudioTiersFromPlist:", v13);
        if (v51)
        {
          v84 = 0u;
          v85 = 0u;
          v82 = 0u;
          v83 = 0u;
          obj = (id)objc_msgSend(a3, "limits");
          v49 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v82, v81, 16);
          if (v49)
          {
            v50 = *(_QWORD *)v83;
            while (1)
            {
              v14 = 0;
LABEL_13:
              if (*(_QWORD *)v83 != v50)
                objc_enumerationMutation(obj);
              v15 = *(void **)(*((_QWORD *)&v82 + 1) + 8 * v14);
              objc_msgSend(v12, "removeAllObjects");
              if (a4->var0 == 6)
              {
                if (!+[VCAudioTierPicker loadVCAudioTierFromTierTable:bitrate:redNumPayloads:outEntryArray:](VCAudioTierPicker, "loadVCAudioTierFromTierTable:bitrate:redNumPayloads:outEntryArray:", v51, objc_msgSend(v15, "unsignedIntValue"), a5, v12))
                {
                  ErrorLogLevelForModule = VRTraceGetErrorLogLevelForModule();
                  if (ErrorLogLevelForModule >= 3)
                  {
                    v36 = VRTraceErrorLogLevelToCSTR();
                    v37 = *MEMORY[0x1E0CF2758];
                    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
                    {
                      v38 = objc_msgSend(v15, "integerValue");
                      var0 = a4->var0;
                      *(_DWORD *)buf = 136316418;
                      v54 = v36;
                      v55 = 2080;
                      v56 = "-[VCAudioTierPicker generateAudioTiersDictFromPlistForBitrateLimits:tierPickerConfig:redNumPayloads:]";
                      v57 = 1024;
                      v58 = 585;
                      v59 = 2048;
                      v60 = v38;
                      v61 = 1024;
                      v62 = var0;
                      v63 = 1024;
                      v64 = a5;
                      v32 = " [%s] %s:%d bitrateTier=%ld not found in plist for mode=%d redNumPayloads=%u";
                      v33 = v37;
                      v34 = 50;
                      goto LABEL_48;
                    }
                  }
                  goto LABEL_49;
                }
              }
              else if (!+[VCAudioTierPicker loadVCAudioTierFromTierTable:config:allowRedAtLowBitrate:alwaysOnAudioRedundancyDisabled:redNumPayloads:tierBitrate:outEntryArray:](VCAudioTierPicker, "loadVCAudioTierFromTierTable:config:allowRedAtLowBitrate:alwaysOnAudioRedundancyDisabled:redNumPayloads:tierBitrate:outEntryArray:", v51, a4, v47, v46, a5, objc_msgSend(v15, "integerValue"), v12))
              {
                if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
                {
                  v40 = VRTraceErrorLogLevelToCSTR();
                  v41 = *MEMORY[0x1E0CF2758];
                  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
                  {
                    v42 = objc_msgSend(v15, "integerValue");
                    v43 = a4->var0;
                    var11 = a4->var11;
                    var5 = a4->var5;
                    *(_DWORD *)buf = 136316930;
                    v54 = v40;
                    v55 = 2080;
                    v56 = "-[VCAudioTierPicker generateAudioTiersDictFromPlistForBitrateLimits:tierPickerConfig:redNumPayloads:]";
                    v57 = 1024;
                    v58 = 589;
                    v59 = 2048;
                    v60 = v42;
                    v61 = 1024;
                    v62 = v43;
                    v63 = 1024;
                    v64 = var11;
                    v65 = 1024;
                    v66 = var5;
                    v67 = 1024;
                    v68 = a5;
                    v32 = " [%s] %s:%d bitrateTier=%ld not found in plist for mode=%d isIPv4=%{BOOL}d celluar=%{BOOL}d redNumPayloads=%u";
                    v33 = v41;
                    v34 = 62;
                    goto LABEL_48;
                  }
                }
                goto LABEL_49;
              }
              if ((_DWORD)v8 != 128)
              {
                v79 = 0u;
                v80 = 0u;
                v77 = 0u;
                v78 = 0u;
                v16 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v77, v76, 16);
                if (v16)
                {
                  v17 = v16;
                  v18 = *(_QWORD *)v78;
                  do
                  {
                    for (i = 0; i != v17; ++i)
                    {
                      if (*(_QWORD *)v78 != v18)
                        objc_enumerationMutation(v12);
                      objc_msgSend(*(id *)(*((_QWORD *)&v77 + 1) + 8 * i), "setPayload:", v8);
                    }
                    v17 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v77, v76, 16);
                  }
                  while (v17);
                }
              }
              v74 = 0u;
              v75 = 0u;
              v72 = 0u;
              v73 = 0u;
              v20 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v72, v71, 16);
              if (!v20)
                break;
              v21 = v20;
              v22 = *(_QWORD *)v73;
LABEL_29:
              v23 = 0;
              while (1)
              {
                if (*(_QWORD *)v73 != v22)
                  objc_enumerationMutation(v12);
                if (-[VCAudioTierPicker addEntryMatchingPayloadToAudioTierMap:config:entry:bitrateTier:forcedPayload:](self, "addEntryMatchingPayloadToAudioTierMap:config:entry:bitrateTier:forcedPayload:", v10, a4, *(_QWORD *)(*((_QWORD *)&v72 + 1) + 8 * v23), v15, v8))
                {
                  break;
                }
                if (v21 == ++v23)
                {
                  v21 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v72, v71, 16);
                  if (v21)
                    goto LABEL_29;
                  goto LABEL_39;
                }
              }
              if (++v14 != v49)
                goto LABEL_13;
              v49 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v82, v81, 16);
              if (!v49)
              {

                return v10;
              }
            }
LABEL_39:
            if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
            {
              v25 = VRTraceErrorLogLevelToCSTR();
              v26 = *MEMORY[0x1E0CF2758];
              if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
              {
                v27 = objc_msgSend(v15, "integerValue");
                v28 = a4->var0;
                v29 = a4->var11;
                v30 = a4->var5;
                v31 = -[__CFArray count](a4->var1, "count");
                *(_DWORD *)buf = 136317186;
                v54 = v25;
                v55 = 2080;
                v56 = "-[VCAudioTierPicker generateAudioTiersDictFromPlistForBitrateLimits:tierPickerConfig:redNumPayloads:]";
                v57 = 1024;
                v58 = 611;
                v59 = 2048;
                v60 = v27;
                v61 = 1024;
                v62 = v28;
                v63 = 1024;
                v64 = v29;
                v65 = 1024;
                v66 = v30;
                v67 = 1024;
                v68 = a5;
                v69 = 1024;
                v70 = v31;
                v32 = " [%s] %s:%d No matching payload found for bitrateTier=%ld in plist for mode=%d isIPv4=%{BOOL}d cel"
                      "lular=%{BOOL}d redNumPayloads=%u supported payload count=%d";
                v33 = v26;
                v34 = 68;
LABEL_48:
                _os_log_error_impl(&dword_1D8A54000, v33, OS_LOG_TYPE_ERROR, v32, buf, v34);
              }
            }
          }
        }
        else if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
        {
          VRTraceErrorLogLevelToCSTR();
          if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
            -[VCAudioTierPicker generateAudioTiersDictFromPlistForBitrateLimits:tierPickerConfig:redNumPayloads:].cold.3();
        }
      }
      else if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        VRTraceErrorLogLevelToCSTR();
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
          -[VCAudioTierPicker generateAudioTiersDictFromPlistForBitrateLimits:tierPickerConfig:redNumPayloads:].cold.4();
      }
    }
    else if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
        -[VCAudioTierPicker generateAudioTiersDictFromPlistForBitrateLimits:tierPickerConfig:redNumPayloads:].cold.2();
    }
  }
  else if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
  {
    VRTraceErrorLogLevelToCSTR();
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
      -[VCAudioTierPicker generateAudioTiersDictFromPlistForBitrateLimits:tierPickerConfig:redNumPayloads:].cold.1();
  }
LABEL_49:

  return 0;
}

- (BOOL)addEntryMatchingPayloadToAudioTierMap:(id)a3 config:(id *)a4 entry:(id)a5 bitrateTier:(id)a6 forcedPayload:(int)a7
{
  __CFArray *var1;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  int v17;
  int v18;
  unsigned int var4;
  VCAudioTier *v20;
  uint64_t v22;
  BOOL v23;
  int v24;
  int v25;
  int v26;
  unsigned int v27;
  int v28;
  _BYTE v29[128];
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  uint64_t v34;

  v34 = *MEMORY[0x1E0C80C00];
  v30 = 0u;
  v31 = 0u;
  v32 = 0u;
  v33 = 0u;
  var1 = a4->var1;
  v12 = -[__CFArray countByEnumeratingWithState:objects:count:](var1, "countByEnumeratingWithState:objects:count:", &v30, v29, 16, a6, *(_QWORD *)&a7);
  if (v12)
  {
    v13 = v12;
    v14 = *(_QWORD *)v31;
    while (2)
    {
      v15 = 0;
      do
      {
        if (*(_QWORD *)v31 != v14)
          objc_enumerationMutation(var1);
        v16 = *(void **)(*((_QWORD *)&v30 + 1) + 8 * v15);
        v17 = objc_msgSend(v16, "payload");
        if (v17 == objc_msgSend(a5, "payload"))
        {
          v23 = +[VCAudioTier bundlingAppliedByCodecForPayload:mode:](VCAudioTier, "bundlingAppliedByCodecForPayload:mode:", objc_msgSend(a5, "payload", v16, 0xAAAAAAAAAAAAAAAALL), +[VCAudioTierPicker tierPickerModeToAVConferenceOperatingMode:](VCAudioTierPicker, "tierPickerModeToAVConferenceOperatingMode:", a4->var0));
          v24 = objc_msgSend(a5, "codecBitrate");
          v25 = objc_msgSend(a5, "packetsPerBundle");
          v18 = objc_msgSend(a5, "redNumPayloads");
          var4 = a4->var4;
          v26 = v18;
          v27 = var4;
          v28 = VCPayloadUtils_ShortREDBitrateForPayload(objc_msgSend(a5, "payload"), 0);
          v20 = -[VCAudioTier initWithConfig:]([VCAudioTier alloc], "initWithConfig:", &v22);
          objc_msgSend(a3, "setObject:forKeyedSubscript:", v20, a6);

          LOBYTE(v12) = 1;
          return v12;
        }
        ++v15;
      }
      while (v13 != v15);
      v12 = -[__CFArray countByEnumeratingWithState:objects:count:](var1, "countByEnumeratingWithState:objects:count:", &v30, v29, 16);
      v13 = v12;
      if (v12)
        continue;
      break;
    }
  }
  return v12;
}

- (id)loadAudioTiersFromPlist:(id)a3
{
  if (!-[NSMutableDictionary objectForKeyedSubscript:](self->_tierTablePlist, "objectForKeyedSubscript:"))
    -[NSMutableDictionary setObject:forKeyedSubscript:](self->_tierTablePlist, "setObject:forKeyedSubscript:", objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithContentsOfFile:", objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class()), "pathForResource:ofType:", a3, CFSTR("plist"))), a3);
  return (id)-[NSMutableDictionary objectForKeyedSubscript:](self->_tierTablePlist, "objectForKeyedSubscript:", a3);
}

+ (BOOL)isLowBitrateAudioTier:(unsigned int)a3
{
  return a3 < 0x5209;
}

+ (BOOL)isAlwaysOnRedAudioTier:(unsigned int)a3 redNumPayloads:(unsigned int)a4 usingCellular:(BOOL)a5
{
  BOOL v5;
  BOOL v8;

  v5 = a3 == 120000 && a4 == 0;
  if (v5 || a3 == 170000 && a4 < 2 || a3 == 220000 && a4 < 3 || a3 == 220000 && a4 == 3 && a5)
    return 1;
  v8 = a3 == 200000 && a4 == 0;
  return a3 == 267000 && a4 < 2 || v8;
}

+ (BOOL)loadVCAudioTierFromTierTable:(id)a3 config:(id *)a4 allowRedAtLowBitrate:(BOOL)a5 alwaysOnAudioRedundancyDisabled:(BOOL)a6 redNumPayloads:(unsigned int)a7 tierBitrate:(unsigned int)a8 outEntryArray:(id)a9
{
  _BOOL4 v9;
  const __CFString *v12;
  void *v13;
  const __CFString *v14;
  void *v15;
  const __CFString *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  void *v27;
  void *v28;
  VCAudioTierPickerPlistEntry *v29;
  void *v30;
  VCAudioTierPickerPlistEntry *v31;
  _BOOL4 v32;
  uint64_t v33;
  NSObject *v34;
  int v35;
  _BOOL4 v36;
  _BOOL4 v37;
  const char *v38;
  NSObject *v39;
  uint32_t v40;
  uint64_t v41;
  NSObject *v42;
  int var0;
  _BOOL4 var11;
  uint64_t v45;
  NSObject *v46;
  int v47;
  _BOOL4 v48;
  _BOOL4 var5;
  uint64_t v50;
  NSObject *v51;
  int v52;
  _BOOL4 v53;
  _BOOL4 v54;
  uint64_t v55;
  int v56;
  _BOOL4 v57;
  _BOOL4 v58;
  const $874264D99418FF75A48C4C64EBA5A14C *v60;
  _BOOL4 v61;
  _BYTE v64[128];
  __int128 v65;
  __int128 v66;
  __int128 v67;
  __int128 v68;
  uint8_t buf[4];
  uint64_t v70;
  __int16 v71;
  const char *v72;
  __int16 v73;
  int v74;
  __int16 v75;
  int v76;
  __int16 v77;
  _BOOL4 v78;
  __int16 v79;
  _BOOL4 v80;
  __int16 v81;
  unsigned int v82;
  __int16 v83;
  unsigned int v84;
  uint64_t v85;

  v61 = a6;
  v85 = *MEMORY[0x1E0C80C00];
  if (!a9)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      v32 = os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR);
      if (!v32)
        return v32;
      +[VCAudioTierPicker loadVCAudioTierFromTierTable:config:allowRedAtLowBitrate:alwaysOnAudioRedundancyDisabled:redNumPayloads:tierBitrate:outEntryArray:].cold.1();
    }
    goto LABEL_40;
  }
  v9 = a5;
  if (objc_msgSend(a1, "isModeAudioOnly:", a4->var0))
    v12 = CFSTR("modeAudio");
  else
    v12 = CFSTR("modeVideo");
  v13 = (void *)objc_msgSend(a3, "objectForKeyedSubscript:", v12);
  if (!v13)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      v32 = os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR);
      if (!v32)
        return v32;
      +[VCAudioTierPicker loadVCAudioTierFromTierTable:config:allowRedAtLowBitrate:alwaysOnAudioRedundancyDisabled:redNumPayloads:tierBitrate:outEntryArray:].cold.2();
    }
    goto LABEL_40;
  }
  if (a4->var11)
    v14 = CFSTR("IPv4");
  else
    v14 = CFSTR("IPv6");
  v15 = (void *)objc_msgSend(v13, "objectForKeyedSubscript:", v14);
  if (!v15)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() < 3)
      goto LABEL_40;
    v41 = VRTraceErrorLogLevelToCSTR();
    v42 = *MEMORY[0x1E0CF2758];
    v32 = os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR);
    if (!v32)
      return v32;
    var0 = a4->var0;
    var11 = a4->var11;
    *(_DWORD *)buf = 136316162;
    v70 = v41;
    v71 = 2080;
    v72 = "+[VCAudioTierPicker loadVCAudioTierFromTierTable:config:allowRedAtLowBitrate:alwaysOnAudioRedundancyDisabled:r"
          "edNumPayloads:tierBitrate:outEntryArray:]";
    v73 = 1024;
    v74 = 713;
    v75 = 1024;
    v76 = var0;
    v77 = 1024;
    v78 = var11;
    v38 = " [%s] %s:%d No tier table entry for mode=%d and isIPv4=%{BOOL}d";
    v39 = v42;
    v40 = 40;
LABEL_39:
    _os_log_error_impl(&dword_1D8A54000, v39, OS_LOG_TYPE_ERROR, v38, buf, v40);
LABEL_40:
    LOBYTE(v32) = 0;
    return v32;
  }
  if (a4->var5)
    v16 = CFSTR("cellular");
  else
    v16 = CFSTR("WiFi");
  v17 = (void *)objc_msgSend(v15, "objectForKeyedSubscript:", v16);
  if (!v17)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() < 3)
      goto LABEL_40;
    v45 = VRTraceErrorLogLevelToCSTR();
    v46 = *MEMORY[0x1E0CF2758];
    v32 = os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR);
    if (!v32)
      return v32;
    v47 = a4->var0;
    v48 = a4->var11;
    var5 = a4->var5;
    *(_DWORD *)buf = 136316418;
    v70 = v45;
    v71 = 2080;
    v72 = "+[VCAudioTierPicker loadVCAudioTierFromTierTable:config:allowRedAtLowBitrate:alwaysOnAudioRedundancyDisabled:r"
          "edNumPayloads:tierBitrate:outEntryArray:]";
    v73 = 1024;
    v74 = 715;
    v75 = 1024;
    v76 = v47;
    v77 = 1024;
    v78 = v48;
    v79 = 1024;
    v80 = var5;
    v38 = " [%s] %s:%d No tier table entry for mode=%d and isIPv4=%{BOOL}d cellular=%{BOOL}d";
    v39 = v46;
    v40 = 46;
    goto LABEL_39;
  }
  v18 = (void *)objc_msgSend(v17, "objectForKeyedSubscript:", CFSTR("redNumPayloads"));
  v19 = (void *)objc_msgSend(v18, "objectForKeyedSubscript:", objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", a7), "stringValue"));
  if (!v19)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() < 3)
      goto LABEL_40;
    v50 = VRTraceErrorLogLevelToCSTR();
    v51 = *MEMORY[0x1E0CF2758];
    v32 = os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR);
    if (!v32)
      return v32;
    v52 = a4->var0;
    v53 = a4->var11;
    v54 = a4->var5;
    *(_DWORD *)buf = 136316674;
    v70 = v50;
    v71 = 2080;
    v72 = "+[VCAudioTierPicker loadVCAudioTierFromTierTable:config:allowRedAtLowBitrate:alwaysOnAudioRedundancyDisabled:r"
          "edNumPayloads:tierBitrate:outEntryArray:]";
    v73 = 1024;
    v74 = 717;
    v75 = 1024;
    v76 = v52;
    v77 = 1024;
    v78 = v53;
    v79 = 1024;
    v80 = v54;
    v81 = 1024;
    v82 = a7;
    v38 = " [%s] %s:%d No tier table entry for mode=%d and isIPv4=%{BOOL}d cellular=%{BOOL}d redNumPayloads=%u";
    v39 = v51;
    v40 = 52;
    goto LABEL_39;
  }
  v20 = (void *)objc_msgSend(v19, "objectForKeyedSubscript:", CFSTR("bitrateTier"));
  v21 = (void *)objc_msgSend((id)objc_msgSend(v20, "objectForKeyedSubscript:", objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", a8), "stringValue")), "objectForKeyedSubscript:", CFSTR("payloads"));
  if (!v21)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() < 3)
      goto LABEL_40;
    v55 = VRTraceErrorLogLevelToCSTR();
    v34 = *MEMORY[0x1E0CF2758];
    v32 = os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR);
    if (!v32)
      return v32;
    v56 = a4->var0;
    v57 = a4->var11;
    v58 = a4->var5;
    *(_DWORD *)buf = 136316930;
    v70 = v55;
    v71 = 2080;
    v72 = "+[VCAudioTierPicker loadVCAudioTierFromTierTable:config:allowRedAtLowBitrate:alwaysOnAudioRedundancyDisabled:r"
          "edNumPayloads:tierBitrate:outEntryArray:]";
    v73 = 1024;
    v74 = 719;
    v75 = 1024;
    v76 = v56;
    v77 = 1024;
    v78 = v57;
    v79 = 1024;
    v80 = v58;
    v81 = 1024;
    v82 = a7;
    v83 = 1024;
    v84 = a8;
    v38 = " [%s] %s:%d No payloads array for mode=%d and isIPv4=%{BOOL}d cellular=%{BOOL}d redNumPayloads=%u tierBitrate=%u";
LABEL_38:
    v39 = v34;
    v40 = 58;
    goto LABEL_39;
  }
  v22 = v21;
  v67 = 0u;
  v68 = 0u;
  v65 = 0u;
  v66 = 0u;
  v23 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &v65, v64, 16);
  if (v23)
  {
    v24 = v23;
    v60 = a4;
    v25 = *(_QWORD *)v66;
LABEL_18:
    v26 = 0;
    while (1)
    {
      if (*(_QWORD *)v66 != v25)
        objc_enumerationMutation(v22);
      if ((v27 = *(void **)(*((_QWORD *)&v65 + 1) + 8 * v26), v9)
        && +[VCAudioTierPicker isLowBitrateAudioTier:](VCAudioTierPicker, "isLowBitrateAudioTier:", a8)
        || v61
        && +[VCAudioTierPicker isAlwaysOnRedAudioTier:redNumPayloads:usingCellular:](VCAudioTierPicker, "isAlwaysOnRedAudioTier:redNumPayloads:usingCellular:", a8, a7, v60->var5))
      {
        v28 = (void *)objc_msgSend(v27, "mutableCopy", v60);
        objc_msgSend(v28, "setObject:forKeyedSubscript:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", a7), CFSTR("redNumPayloads"));
      }
      else
      {
        v28 = 0;
      }
      v29 = [VCAudioTierPickerPlistEntry alloc];
      v30 = v28 ? v28 : v27;
      v31 = -[VCAudioTierPickerPlistEntry initWithDictionary:](v29, "initWithDictionary:", v30, v60);

      if (!v31)
        break;
      objc_msgSend(a9, "addObject:", v31);

      if (v24 == ++v26)
      {
        v24 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v65, v64, 16);
        if (v24)
          goto LABEL_18;
        goto LABEL_33;
      }
    }
    if ((int)VRTraceGetErrorLogLevelForModule() < 3)
      goto LABEL_40;
    v33 = VRTraceErrorLogLevelToCSTR();
    v34 = *MEMORY[0x1E0CF2758];
    v32 = os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR);
    if (v32)
    {
      v35 = v60->var0;
      v36 = v60->var11;
      v37 = v60->var5;
      *(_DWORD *)buf = 136316930;
      v70 = v33;
      v71 = 2080;
      v72 = "+[VCAudioTierPicker loadVCAudioTierFromTierTable:config:allowRedAtLowBitrate:alwaysOnAudioRedundancyDisabled"
            ":redNumPayloads:tierBitrate:outEntryArray:]";
      v73 = 1024;
      v74 = 731;
      v75 = 1024;
      v76 = v35;
      v77 = 1024;
      v78 = v36;
      v79 = 1024;
      v80 = v37;
      v81 = 1024;
      v82 = a7;
      v83 = 1024;
      v84 = a8;
      v38 = " [%s] %s:%d Invalid entry in tier dictionary for mode=%d and isIPv4=%{BOOL}d cellular=%{BOOL}d redNumPayload"
            "s=%u tierBitrate=%u";
      goto LABEL_38;
    }
  }
  else
  {
LABEL_33:
    LOBYTE(v32) = 1;
  }
  return v32;
}

+ (BOOL)loadVCAudioTierFromTierTable:(id)a3 bitrate:(unsigned int)a4 redNumPayloads:(unsigned int)a5 outEntryArray:(id)a6
{
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  VCAudioTierPickerPlistEntry *v20;
  BOOL v21;
  uint64_t v22;
  NSObject *v23;
  uint64_t v25;
  NSObject *v26;
  int v27;
  _BYTE v28[128];
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  uint8_t buf[4];
  uint64_t v34;
  __int16 v35;
  const char *v36;
  __int16 v37;
  int v38;
  __int16 v39;
  int v40;
  __int16 v41;
  int v42;
  uint64_t v43;

  v43 = *MEMORY[0x1E0C80C00];
  if (!a6)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
        +[VCAudioTierPicker loadVCAudioTierFromTierTable:bitrate:redNumPayloads:outEntryArray:].cold.1();
    }
    goto LABEL_26;
  }
  v7 = *(_QWORD *)&a5;
  v8 = *(_QWORD *)&a4;
  v9 = (void *)objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("networkBitrate"));
  v10 = (void *)objc_msgSend((id)objc_msgSend(v9, "objectForKeyedSubscript:", objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", v8), "stringValue")), "objectForKeyedSubscript:", CFSTR("redNumPayloads"));
  v11 = (void *)objc_msgSend((id)objc_msgSend(v10, "objectForKeyedSubscript:", objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", v7), "stringValue")), "mutableCopy");
  if (!v11)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      v25 = VRTraceErrorLogLevelToCSTR();
      v26 = *MEMORY[0x1E0CF2758];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136316162;
        v34 = v25;
        v35 = 2080;
        v36 = "+[VCAudioTierPicker loadVCAudioTierFromTierTable:bitrate:redNumPayloads:outEntryArray:]";
        v37 = 1024;
        v38 = 751;
        v39 = 1024;
        v40 = v8;
        v41 = 1024;
        v42 = v7;
        _os_log_error_impl(&dword_1D8A54000, v26, OS_LOG_TYPE_ERROR, " [%s] %s:%d No tier table entry for bitrate=%u redNumPayloads=%u", buf, 0x28u);
      }
    }
LABEL_26:
    v12 = 0;
LABEL_17:
    v21 = 0;
    goto LABEL_19;
  }
  v12 = v11;
  v13 = (void *)objc_msgSend(v11, "objectForKeyedSubscript:", CFSTR("payloads"));
  if (!v13)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
        +[VCAudioTierPicker loadVCAudioTierFromTierTable:bitrate:redNumPayloads:outEntryArray:].cold.2();
    }
    goto LABEL_17;
  }
  v14 = v13;
  v31 = 0u;
  v32 = 0u;
  v29 = 0u;
  v30 = 0u;
  v15 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v29, v28, 16);
  if (v15)
  {
    v16 = v15;
    v27 = v8;
    v17 = *(_QWORD *)v30;
LABEL_6:
    v18 = 0;
    while (1)
    {
      if (*(_QWORD *)v30 != v17)
        objc_enumerationMutation(v14);
      v19 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v29 + 1) + 8 * v18), "mutableCopy");
      objc_msgSend(v19, "setObject:forKeyedSubscript:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", v7), CFSTR("redNumPayloads"));
      v20 = -[VCAudioTierPickerPlistEntry initWithDictionary:]([VCAudioTierPickerPlistEntry alloc], "initWithDictionary:", v19);

      if (!v20)
        break;
      objc_msgSend(a6, "addObject:", v20);

      if (v16 == ++v18)
      {
        v16 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v29, v28, 16);
        if (v16)
          goto LABEL_6;
        v21 = 1;
        goto LABEL_19;
      }
    }
    if ((int)VRTraceGetErrorLogLevelForModule() < 3)
    {
      v21 = 0;
      goto LABEL_19;
    }
    v22 = VRTraceErrorLogLevelToCSTR();
    v23 = *MEMORY[0x1E0CF2758];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136316162;
      v34 = v22;
      v35 = 2080;
      v36 = "+[VCAudioTierPicker loadVCAudioTierFromTierTable:bitrate:redNumPayloads:outEntryArray:]";
      v37 = 1024;
      v38 = 762;
      v39 = 1024;
      v40 = v27;
      v41 = 1024;
      v42 = v7;
      _os_log_error_impl(&dword_1D8A54000, v23, OS_LOG_TYPE_ERROR, " [%s] %s:%d Invalid entry in tier dictionary for bitrate=%u redNumPayloads=%u", buf, 0x28u);
    }
    goto LABEL_17;
  }
  v21 = 1;
LABEL_19:

  return v21;
}

+ (id)selectHighestQualityAudioTiers:(id)a3 forBitrateLimits:(id)a4 isHardLimit:(BOOL)a5
{
  uint64_t v5;
  uint64_t v6;
  void *v7;
  uint64_t i;
  void *v9;
  float v10;
  float v11;
  int v12;
  double v13;
  int v14;
  int v15;
  uint64_t v16;
  void *v17;
  BOOL v18;
  uint64_t v19;
  int v20;
  const char *v21;
  unsigned int v22;
  unsigned int v23;
  BOOL v24;
  NSObject *v25;
  NSObject *v26;
  uint64_t v27;
  uint64_t v28;
  id obj;
  uint64_t v31;
  uint64_t v32;
  id v34;
  uint64_t v35;
  _BOOL4 v37;
  uint64_t v38;
  void *v39;
  uint64_t v40;
  int v41;
  uint64_t v42;
  uint8_t buf[4];
  uint64_t v44;
  __int16 v45;
  const char *v46;
  __int16 v47;
  int v48;
  __int16 v49;
  int v50;
  __int16 v51;
  uint64_t v52;
  __int16 v53;
  double v54;
  __int16 v55;
  int v56;
  __int16 v57;
  int v58;
  __int16 v59;
  int v60;
  __int16 v61;
  const char *v62;
  _BYTE v63[128];
  __int128 v64;
  __int128 v65;
  __int128 v66;
  __int128 v67;
  _BYTE v68[128];
  __int128 v69;
  __int128 v70;
  __int128 v71;
  __int128 v72;
  uint64_t v73;

  v37 = a5;
  v73 = *MEMORY[0x1E0C80C00];
  v34 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  v69 = 0u;
  v70 = 0u;
  v71 = 0u;
  v72 = 0u;
  obj = (id)objc_msgSend(a4, "limits");
  v32 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v69, v68, 16);
  if (!v32)
    return v34;
  v31 = *(_QWORD *)v70;
LABEL_3:
  v5 = 0;
LABEL_4:
  if (*(_QWORD *)v70 != v31)
    objc_enumerationMutation(obj);
  v39 = *(void **)(*((_QWORD *)&v69 + 1) + 8 * v5);
  v6 = objc_msgSend((id)objc_msgSend((id)objc_msgSend(a4, "limits"), "lastObject"), "integerValue");
  v64 = 0u;
  v65 = 0u;
  v66 = 0u;
  v67 = 0u;
  v40 = objc_msgSend(a3, "countByEnumeratingWithState:objects:count:", &v64, v63, 16);
  if (v40)
  {
    v35 = v5;
    v7 = 0;
    v38 = *(_QWORD *)v65;
    v41 = v6;
    while (1)
    {
      for (i = 0; i != v40; ++i)
      {
        if (*(_QWORD *)v65 != v38)
          objc_enumerationMutation(a3);
        v9 = *(void **)(*((_QWORD *)&v64 + 1) + 8 * i);
        objc_msgSend((id)objc_msgSend(v9, "payloadConfig"), "qualityForBitRate:", objc_msgSend(v9, "audioCodecBitrate"));
        v11 = v10;
        v12 = objc_msgSend(v39, "integerValue");
        if (!v37 || (int)objc_msgSend(v9, "networkBitrate") <= v12)
        {
          v13 = v11;
          v14 = v12 - objc_msgSend(v9, "networkBitrate");
          if (v14 >= 0)
            v15 = v14;
          else
            v15 = -v14;
          v16 = v6;
          v17 = v7;
          v18 = v15 + (int)((1.0 - v13) * (double)v12 * 0.5) < (int)v6 || v7 == 0;
          v7 = v9;
          v19 = (v15 + (int)((1.0 - v13) * (double)v12 * 0.5));
          v20 = v15;
          v21 = " new";
          if (v18)
            goto LABEL_31;
          if (v15 >= v41)
          {
            v7 = v17;
          }
          else
          {
            v7 = v17;
            if (objc_msgSend((id)objc_msgSend(v17, "payloadConfig"), "isEqual:", objc_msgSend(v9, "payloadConfig")))
            {
              v22 = objc_msgSend(v7, "audioCodecBitrate");
              v23 = objc_msgSend(v9, "audioCodecBitrate");
              v24 = v22 >= v23;
              if (v22 >= v23)
              {
                v20 = v41;
              }
              else
              {
                v7 = v9;
                v20 = v15;
              }
              if (v24)
                v21 = "";
              else
                v21 = " new";
              v19 = v16;
              goto LABEL_31;
            }
          }
          v19 = v16;
          v20 = v41;
          v21 = "";
LABEL_31:
          if ((int)VRTraceGetErrorLogLevelForModule() >= 8)
          {
            v42 = VRTraceErrorLogLevelToCSTR();
            v25 = *MEMORY[0x1E0CF2758];
            v26 = *MEMORY[0x1E0CF2758];
            if (*MEMORY[0x1E0CF2748])
            {
              if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
              {
                v27 = objc_msgSend((id)objc_msgSend(v9, "description"), "UTF8String");
                *(_DWORD *)buf = 136317442;
                v44 = v42;
                v45 = 2080;
                v46 = "+[VCAudioTierPicker selectHighestQualityAudioTiers:forBitrateLimits:isHardLimit:]";
                v47 = 1024;
                v48 = 815;
                v49 = 1024;
                v50 = v12;
                v51 = 2080;
                v52 = v27;
                v53 = 2048;
                v54 = v13;
                v55 = 1024;
                v56 = (int)((1.0 - v13) * (double)v12 * 0.5);
                v57 = 1024;
                v58 = v15;
                v59 = 1024;
                v60 = v15 + v56;
                v61 = 2080;
                v62 = v21;
                _os_log_impl(&dword_1D8A54000, v25, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d AudioTierSelection %d: %s quality[%f] diff=%d+%d=%d)%s", buf, 0x52u);
              }
            }
            else if (os_log_type_enabled(v26, OS_LOG_TYPE_DEBUG))
            {
              v28 = objc_msgSend((id)objc_msgSend(v9, "description"), "UTF8String");
              *(_DWORD *)buf = 136317442;
              v44 = v42;
              v45 = 2080;
              v46 = "+[VCAudioTierPicker selectHighestQualityAudioTiers:forBitrateLimits:isHardLimit:]";
              v47 = 1024;
              v48 = 815;
              v49 = 1024;
              v50 = v12;
              v51 = 2080;
              v52 = v28;
              v53 = 2048;
              v54 = v13;
              v55 = 1024;
              v56 = (int)((1.0 - v13) * (double)v12 * 0.5);
              v57 = 1024;
              v58 = v15;
              v59 = 1024;
              v60 = v15 + v56;
              v61 = 2080;
              v62 = v21;
              _os_log_debug_impl(&dword_1D8A54000, v25, OS_LOG_TYPE_DEBUG, " [%s] %s:%d AudioTierSelection %d: %s quality[%f] diff=%d+%d=%d)%s", buf, 0x52u);
            }
          }
          v6 = v19;
          v41 = v20;
          continue;
        }
      }
      v40 = objc_msgSend(a3, "countByEnumeratingWithState:objects:count:", &v64, v63, 16);
      if (!v40)
      {
        if (!v7)
          break;
        objc_msgSend(v34, "setObject:forKeyedSubscript:", v7, v39);
        v5 = v35 + 1;
        if (v35 + 1 == v32)
        {
          v32 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v69, v68, 16);
          if (!v32)
            return v34;
          goto LABEL_3;
        }
        goto LABEL_4;
      }
    }
  }

  return 0;
}

- (void)printCreatedAudioTiers:(id)a3
{
  id v3;
  void *v5;
  _BOOL8 v6;
  void *v7;
  uint64_t v8;
  __int128 v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  void *v14;
  uint64_t v15;
  NSObject *v16;
  uint64_t v17;
  _BOOL8 v18;
  id v19;
  void *v20;
  const char *v21;
  int v22;
  uint64_t v23;
  __int128 v24;
  VCAudioTierPicker *v25;
  uint64_t v26;
  uint8_t buf[4];
  uint64_t v28;
  __int16 v29;
  const char *v30;
  __int16 v31;
  int v32;
  __int16 v33;
  const char *v34;
  __int16 v35;
  int v36;
  __int16 v37;
  uint64_t v38;
  _BYTE v39[128];
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  uint64_t v44;

  v3 = a3;
  v44 = *MEMORY[0x1E0C80C00];
  v5 = (void *)objc_msgSend((id)objc_msgSend(a3, "allKeys"), "sortedArrayUsingSelector:", sel_compare_);
  v25 = self;
  v6 = +[VCAudioTierPicker usePlistForAudioTierTableFromMode:](VCAudioTierPicker, "usePlistForAudioTierTableFromMode:", self->_config.mode);
  v40 = 0u;
  v41 = 0u;
  v42 = 0u;
  v43 = 0u;
  v7 = (void *)objc_msgSend(v5, "reverseObjectEnumerator");
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v40, v39, 16);
  if (v8)
  {
    v10 = v8;
    v11 = *(_QWORD *)v41;
    *(_QWORD *)&v9 = 136316418;
    v24 = v9;
    do
    {
      v12 = 0;
      v26 = v10;
      do
      {
        if (*(_QWORD *)v41 != v11)
          objc_enumerationMutation(v7);
        v13 = *(void **)(*((_QWORD *)&v40 + 1) + 8 * v12);
        v14 = (void *)objc_msgSend(v3, "objectForKeyedSubscript:", v13, v24);
        if ((v6
           || (objc_msgSend(v13, "integerValue") > 10000 || !objc_msgSend(v14, "redNumPayloads"))
           && (objc_msgSend(v13, "integerValue") > 16000 || objc_msgSend(v14, "redNumPayloads") <= 1)
           && (objc_msgSend(v13, "integerValue") > 21000 || objc_msgSend(v14, "redNumPayloads") <= 2))
          && (int)VRTraceGetErrorLogLevelForModule() >= 7)
        {
          v15 = VRTraceErrorLogLevelToCSTR();
          v16 = *MEMORY[0x1E0CF2758];
          if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
          {
            v17 = v11;
            v18 = v6;
            v19 = v3;
            v20 = v7;
            if (+[VCAudioTierPicker isModeAudioVideo:](VCAudioTierPicker, "isModeAudioVideo:", v25->_config.mode))
            {
              v21 = "Video";
            }
            else
            {
              v21 = "Audio";
            }
            v22 = objc_msgSend(v13, "integerValue");
            v23 = objc_msgSend((id)objc_msgSend(v14, "description"), "UTF8String");
            *(_DWORD *)buf = v24;
            v28 = v15;
            v29 = 2080;
            v30 = "-[VCAudioTierPicker printCreatedAudioTiers:]";
            v31 = 1024;
            v32 = 846;
            v33 = 2080;
            v34 = v21;
            v7 = v20;
            v3 = v19;
            v6 = v18;
            v11 = v17;
            v10 = v26;
            v35 = 1024;
            v36 = v22;
            v37 = 2080;
            v38 = v23;
            _os_log_impl(&dword_1D8A54000, v16, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d (%s) %d: %s", buf, 0x36u);
          }
        }
        ++v12;
      }
      while (v10 != v12);
      v10 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v40, v39, 16);
    }
    while (v10);
  }
}

+ (BOOL)shouldFilterTierForPayloadConfig:(id)a3 bitRate:(unsigned int)a4 packetsPerBundle:(unsigned int)a5 mode:(unsigned __int8)a6 redNumPayloads:(unsigned int)a7 cellular:(BOOL)a8
{
  _BOOL4 v8;
  uint64_t v9;
  int v14;
  int v15;
  int v18;
  char v19;

  v8 = a8;
  v9 = a6;
  v14 = objc_msgSend(a3, "payload");
  if (v14 == 104)
  {
    if (a4 >> 5 < 0x271)
      return 1;
  }
  else if (v14 == 119)
  {
    if (a4 >> 6 > 0x176)
      return 1;
  }
  else if (v14 == 106 && a4 - 20001 < 0xFFFFE0BF)
  {
    return 1;
  }
  if ((_DWORD)v9 != 6)
  {
    if (v8)
    {
      if (a5 >= 3)
        return 0;
    }
    else if (a4 >> 5 > 0x270 || a5 >= 3)
    {
      v18 = objc_msgSend(a3, "payload");
      switch(v18)
      {
        case 'w':
          if (a5 == 3)
            return 0;
          break;
        case 'h':
          if (a5 != 3)
            return 0;
          break;
        case 'e':
          v19 = objc_msgSend(a1, "isModeLowLatency:", v9);
          if (a5 < 2 || (v19 & 1) == 0)
            return 0;
          break;
        default:
          return 0;
      }
    }
    return 1;
  }
  v15 = objc_msgSend(a3, "payload");
  return a4 >> 4 < 0x753 && v15 == 104;
}

+ (id)valueForNetworkBitrate:(id)a3 networkBitrate:(unsigned int)a4
{
  uint64_t v4;
  void *v6;
  unint64_t v7;
  unint64_t v8;
  unint64_t v9;

  v4 = *(_QWORD *)&a4;
  v6 = (void *)objc_msgSend((id)objc_msgSend(a3, "allKeys"), "sortedArrayUsingSelector:", sel_compare_);
  v7 = objc_msgSend(v6, "count") - 1;
  v8 = +[VCArrayUtils insertionIndexForValue:array:](VCArrayUtils, "insertionIndexForValue:array:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", v4), v6);
  if (v7 >= v8)
    v9 = v8;
  else
    v9 = v7;
  return (id)objc_msgSend(a3, "objectForKeyedSubscript:", objc_msgSend(v6, "objectAtIndexedSubscript:", v9));
}

- (id)tierForNetworkBitrate:(unint64_t)a3 withLegacyDuplication:(int)a4
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  _BOOL4 v9;
  int v10;
  BOOL v11;
  unint64_t v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  int ErrorLogLevelForModule;
  uint64_t v19;
  NSObject *v20;
  const char *v21;
  uint8_t buf[4];
  uint64_t v24;
  __int16 v25;
  const char *v26;
  __int16 v27;
  int v28;
  __int16 v29;
  const char *v30;
  __int16 v31;
  int v32;
  _QWORD v33[3];
  _QWORD v34[3];
  _QWORD v35[3];
  _QWORD v36[3];
  _QWORD v37[3];
  _QWORD v38[3];
  _QWORD v39[3];
  _QWORD v40[3];
  _QWORD v41[3];
  _QWORD v42[3];
  _QWORD v43[3];
  _QWORD v44[3];
  _QWORD v45[6];
  _QWORD v46[6];
  _QWORD v47[3];
  _QWORD v48[3];
  _QWORD v49[3];
  _QWORD v50[3];
  _QWORD v51[3];
  _QWORD v52[3];
  _QWORD v53[3];
  _QWORD v54[3];
  _QWORD v55[3];
  _QWORD v56[3];
  _QWORD v57[3];
  _QWORD v58[3];
  _QWORD v59[3];
  _QWORD v60[3];
  _QWORD v61[3];
  _QWORD v62[3];
  _QWORD v63[8];
  _QWORD v64[10];

  v64[8] = *MEMORY[0x1E0C80C00];
  v6 = 100;
  v7 = 150;
  if (a4 != 150)
    v7 = 100;
  if (a4 == 200)
    v8 = 200;
  else
    v8 = v7;
  v9 = +[VCAudioTierPicker isModeAudioOnly:](VCAudioTierPicker, "isModeAudioOnly:", self->_config.mode);
  v10 = self->_config.mode == 7 || v9;
  v11 = v10 == 0;
  v12 = 100000;
  if (!v11)
    v12 = 20000;
  if (v12 < a3)
    v6 = v8;
  if (+[VCAudioTierPicker isModeAudioVideo:](VCAudioTierPicker, "isModeAudioVideo:"))
  {
    v61[0] = &unk_1E9EF61E8;
    v61[1] = &unk_1E9EF6200;
    v62[0] = &unk_1E9EF6098;
    v62[1] = &unk_1E9EF6098;
    v61[2] = &unk_1E9EF6218;
    v62[2] = &unk_1E9EF6098;
    v63[0] = &unk_1E9EF61D0;
    v64[0] = objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v62, v61, 3);
    v63[1] = &unk_1E9EF6230;
    v59[0] = &unk_1E9EF61E8;
    v59[1] = &unk_1E9EF6200;
    v60[0] = &unk_1E9EF60B0;
    v60[1] = &unk_1E9EF60B0;
    v59[2] = &unk_1E9EF6218;
    v60[2] = &unk_1E9EF60B0;
    v64[1] = objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v60, v59, 3);
    v63[2] = &unk_1E9EF61B8;
    v57[0] = &unk_1E9EF61E8;
    v57[1] = &unk_1E9EF6200;
    v58[0] = &unk_1E9EF6140;
    v58[1] = &unk_1E9EF6140;
    v57[2] = &unk_1E9EF6218;
    v58[2] = &unk_1E9EF6140;
    v64[2] = objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v58, v57, 3);
    v63[3] = &unk_1E9EF6248;
    v55[0] = &unk_1E9EF61E8;
    v55[1] = &unk_1E9EF6200;
    v56[0] = &unk_1E9EF6158;
    v56[1] = &unk_1E9EF6158;
    v55[2] = &unk_1E9EF6218;
    v56[2] = &unk_1E9EF6158;
    v64[3] = objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v56, v55, 3);
    v63[4] = &unk_1E9EF6260;
    v53[0] = &unk_1E9EF61E8;
    v53[1] = &unk_1E9EF6200;
    v54[0] = &unk_1E9EF6170;
    v54[1] = &unk_1E9EF6170;
    v53[2] = &unk_1E9EF6218;
    v54[2] = &unk_1E9EF6170;
    v64[4] = objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v54, v53, 3);
    v63[5] = &unk_1E9EF6278;
    v51[0] = &unk_1E9EF61E8;
    v51[1] = &unk_1E9EF6200;
    v52[0] = &unk_1E9EF6188;
    v52[1] = &unk_1E9EF6188;
    v51[2] = &unk_1E9EF6218;
    v52[2] = &unk_1E9EF6188;
    v64[5] = objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v52, v51, 3);
    v63[6] = &unk_1E9EF6290;
    v49[0] = &unk_1E9EF61E8;
    v49[1] = &unk_1E9EF6200;
    v50[0] = &unk_1E9EF61A0;
    v50[1] = &unk_1E9EF61A0;
    v49[2] = &unk_1E9EF6218;
    v50[2] = &unk_1E9EF61A0;
    v64[6] = objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v50, v49, 3);
    v63[7] = &unk_1E9EF62A8;
    v47[0] = &unk_1E9EF61E8;
    v47[1] = &unk_1E9EF6200;
    v48[0] = &unk_1E9EF61B8;
    v48[1] = &unk_1E9EF61B8;
    v47[2] = &unk_1E9EF6218;
    v48[2] = &unk_1E9EF61B8;
    v64[7] = objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v48, v47, 3);
    v13 = +[VCAudioTierPicker valueForNetworkBitrate:networkBitrate:](VCAudioTierPicker, "valueForNetworkBitrate:networkBitrate:", objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v64, v63, 8), a3);
    v14 = (void *)objc_msgSend(v13, "objectForKey:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v6));
    v15 = v14;
    if (self->_config.usingCellular && objc_msgSend(v14, "integerValue") > 32000)
      v15 = &unk_1E9EF6170;
    goto LABEL_24;
  }
  if (self->_config.mode != 6)
  {
    v43[0] = &unk_1E9EF61E8;
    v43[1] = &unk_1E9EF6200;
    v44[0] = &unk_1E9EF6098;
    v44[1] = &unk_1E9EF6098;
    v43[2] = &unk_1E9EF6218;
    v44[2] = &unk_1E9EF6098;
    v45[0] = &unk_1E9EF62C0;
    v46[0] = objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v44, v43, 3);
    v45[1] = &unk_1E9EF6140;
    v41[0] = &unk_1E9EF61E8;
    v41[1] = &unk_1E9EF6200;
    v42[0] = &unk_1E9EF60B0;
    v42[1] = &unk_1E9EF60B0;
    v41[2] = &unk_1E9EF6218;
    v42[2] = &unk_1E9EF60B0;
    v46[1] = objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v42, v41, 3);
    v45[2] = &unk_1E9EF6230;
    v39[0] = &unk_1E9EF61E8;
    v39[1] = &unk_1E9EF6200;
    v40[0] = &unk_1E9EF60C8;
    v40[1] = &unk_1E9EF60C8;
    v39[2] = &unk_1E9EF6218;
    v40[2] = &unk_1E9EF60C8;
    v46[2] = objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v40, v39, 3);
    v45[3] = &unk_1E9EF61A0;
    v37[0] = &unk_1E9EF61E8;
    v37[1] = &unk_1E9EF6200;
    v38[0] = &unk_1E9EF60F8;
    v38[1] = &unk_1E9EF60E0;
    v37[2] = &unk_1E9EF6218;
    v38[2] = &unk_1E9EF60B0;
    v46[3] = objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v38, v37, 3);
    v45[4] = &unk_1E9EF61B8;
    v35[0] = &unk_1E9EF61E8;
    v35[1] = &unk_1E9EF6200;
    v36[0] = &unk_1E9EF6110;
    v36[1] = &unk_1E9EF60F8;
    v35[2] = &unk_1E9EF6218;
    v36[2] = &unk_1E9EF60E0;
    v46[4] = objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v36, v35, 3);
    v45[5] = &unk_1E9EF62D8;
    v33[0] = &unk_1E9EF61E8;
    v33[1] = &unk_1E9EF6200;
    v34[0] = &unk_1E9EF6128;
    v34[1] = &unk_1E9EF6110;
    v33[2] = &unk_1E9EF6218;
    v34[2] = &unk_1E9EF60F8;
    v46[5] = objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v34, v33, 3);
    v17 = +[VCAudioTierPicker valueForNetworkBitrate:networkBitrate:](VCAudioTierPicker, "valueForNetworkBitrate:networkBitrate:", objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v46, v45, 6), a3);
    v15 = (void *)objc_msgSend(v17, "objectForKey:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v6));
LABEL_24:
    v16 = (void *)objc_msgSend((id)-[NSMutableDictionary objectForKeyedSubscript:](self->_tierTablesForRedNumPayloads, "objectForKeyedSubscript:", &unk_1E9EF62F0), "objectForKeyedSubscript:", v15);
    ErrorLogLevelForModule = VRTraceGetErrorLogLevelForModule();
    if (v16)
    {
      if (ErrorLogLevelForModule >= 7)
      {
        v19 = VRTraceErrorLogLevelToCSTR();
        v20 = *MEMORY[0x1E0CF2758];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
        {
          if (+[VCAudioTierPicker isModeAudioVideo:](VCAudioTierPicker, "isModeAudioVideo:", self->_config.mode))
          {
            v21 = "video";
          }
          else
          {
            v21 = "audio";
          }
          *(_DWORD *)buf = 136316162;
          v24 = v19;
          v25 = 2080;
          v26 = "-[VCAudioTierPicker tierForNetworkBitrate:withLegacyDuplication:]";
          v27 = 1024;
          v28 = 984;
          v29 = 2080;
          v30 = v21;
          v31 = 1024;
          v32 = objc_msgSend(v15, "integerValue");
          _os_log_impl(&dword_1D8A54000, v20, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d (%s) Using tier: %d", buf, 0x2Cu);
        }
      }
    }
    else
    {
      if (ErrorLogLevelForModule >= 3)
      {
        VRTraceErrorLogLevelToCSTR();
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
          -[VCAudioTierPicker tierForNetworkBitrate:withLegacyDuplication:].cold.1();
      }
      return self->_fallbackTier;
    }
    return v16;
  }
  if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
  {
    VRTraceErrorLogLevelToCSTR();
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
      -[VCAudioTierPicker tierForNetworkBitrate:withLegacyDuplication:].cold.2();
  }
  return 0;
}

- (id)chooseMultiwayAudioTierForRedPayload:(unint64_t)a3
{
  void *v5;
  unsigned int v6;
  void *v7;
  uint64_t v8;
  void *v9;
  NSMutableDictionary *tierTablesForRedNumPayloads;
  _QWORD v12[8];
  _QWORD v13[4];
  uint64_t v14;
  uint64_t *v15;
  uint64_t v16;
  void (*v17)(uint64_t, uint64_t);
  void (*v18)(uint64_t);
  uint64_t v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v14 = 0;
  v15 = &v14;
  v16 = 0x3052000000;
  v17 = __Block_byref_object_copy__29;
  v18 = __Block_byref_object_dispose__29;
  v19 = 0xAAAAAAAAAAAAAAAALL;
  v5 = (void *)-[NSMutableDictionary objectForKeyedSubscript:](self->_tierTablesForRedNumPayloads, "objectForKeyedSubscript:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:"));
  v19 = objc_msgSend(v5, "objectForKeyedSubscript:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", -[BitrateLimits defaultValueForNetwork:](self->_bitrateLimits, "defaultValueForNetwork:", self->_config.usingCellular)));
  if ((int)a3 >= 1)
  {
    v6 = a3 + 1;
    do
    {
      if (v15[5])
        break;
      if (-[NSMutableDictionary objectForKeyedSubscript:](self->_tierTablesForRedNumPayloads, "objectForKeyedSubscript:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v6 - 2)))
      {
        v7 = (void *)-[NSMutableDictionary objectForKeyedSubscript:](self->_tierTablesForRedNumPayloads, "objectForKeyedSubscript:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v6 - 2));
        v8 = objc_msgSend(v7, "objectForKeyedSubscript:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", -[BitrateLimits defaultValueForNetwork:](self->_bitrateLimits, "defaultValueForNetwork:", self->_config.usingCellular)));
        v15[5] = v8;
      }
      --v6;
    }
    while (v6 > 1);
  }
  v9 = (void *)v15[5];
  if (!v9)
  {
    v13[0] = 0;
    v13[1] = v13;
    v13[2] = 0x2020000000;
    v13[3] = 0;
    tierTablesForRedNumPayloads = self->_tierTablesForRedNumPayloads;
    v12[0] = MEMORY[0x1E0C809B0];
    v12[1] = 3221225472;
    v12[2] = __58__VCAudioTierPicker_chooseMultiwayAudioTierForRedPayload___block_invoke;
    v12[3] = &unk_1E9E57150;
    v12[4] = self;
    v12[5] = &v14;
    v12[6] = v13;
    v12[7] = a3;
    -[NSMutableDictionary enumerateKeysAndObjectsUsingBlock:](tierTablesForRedNumPayloads, "enumerateKeysAndObjectsUsingBlock:", v12);
    _Block_object_dispose(v13, 8);
    v9 = (void *)v15[5];
  }
  _Block_object_dispose(&v14, 8);
  return v9;
}

uint64_t __58__VCAudioTierPicker_chooseMultiwayAudioTierForRedPayload___block_invoke(_QWORD *a1, void *a2, void *a3)
{
  _QWORD *v6;
  unint64_t v7;
  uint64_t result;

  if (*(_QWORD *)(*(_QWORD *)(a1[5] + 8) + 40))
  {
    v6 = a1 + 6;
    v7 = *(_QWORD *)(*(_QWORD *)(a1[6] + 8) + 24) - a1[7];
    result = objc_msgSend(a2, "unsignedIntegerValue");
    if (v7 <= result - a1[7])
      return result;
    *(_QWORD *)(*(_QWORD *)(a1[5] + 8) + 40) = objc_msgSend(a3, "objectForKeyedSubscript:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend(*(id *)(a1[4] + 32), "defaultValueForNetwork:", *(unsigned __int8 *)(a1[4] + 76))));
    result = objc_msgSend(a2, "unsignedIntegerValue");
  }
  else
  {
    *(_QWORD *)(*(_QWORD *)(a1[5] + 8) + 40) = objc_msgSend(a3, "objectForKeyedSubscript:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend(*(id *)(a1[4] + 32), "defaultValueForNetwork:", *(unsigned __int8 *)(a1[4] + 76))));
    result = objc_msgSend(a2, "unsignedIntegerValue");
    v6 = a1 + 6;
  }
  *(_QWORD *)(*(_QWORD *)(*v6 + 8) + 24) = result;
  return result;
}

- (id)tierForNetworkBitrate:(unint64_t)a3 withRedNumPayloads:(unint64_t)a4
{
  id v7;
  void *v8;
  _QWORD *v9;
  _QWORD *v10;
  _QWORD v12[9];
  _QWORD v13[9];
  _QWORD v14[9];
  _QWORD v15[10];

  v15[9] = *MEMORY[0x1E0C80C00];
  v7 = (id)objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:");
  if (+[VCAudioTierPicker isModeAudioVideo:](VCAudioTierPicker, "isModeAudioVideo:", self->_config.mode))
  {
    v14[0] = &unk_1E9EF61D0;
    v14[1] = &unk_1E9EF6230;
    v15[0] = &unk_1E9EF6098;
    v15[1] = &unk_1E9EF60B0;
    v14[2] = &unk_1E9EF61B8;
    v14[3] = &unk_1E9EF6248;
    v15[2] = &unk_1E9EF6140;
    v15[3] = &unk_1E9EF6158;
    v14[4] = &unk_1E9EF6260;
    v14[5] = &unk_1E9EF6278;
    v15[4] = &unk_1E9EF6170;
    v15[5] = &unk_1E9EF6188;
    v14[6] = &unk_1E9EF6308;
    v14[7] = &unk_1E9EF6290;
    v15[6] = &unk_1E9EF61A0;
    v15[7] = &unk_1E9EF61B8;
    v14[8] = &unk_1E9EF62A8;
    v15[8] = &unk_1E9EF6008;
    v8 = (void *)MEMORY[0x1E0C99D80];
    v9 = v15;
    v10 = v14;
LABEL_5:
    v7 = +[VCAudioTierPicker valueForNetworkBitrate:networkBitrate:](VCAudioTierPicker, "valueForNetworkBitrate:networkBitrate:", objc_msgSend(v8, "dictionaryWithObjects:forKeys:count:", v9, v10, 9), a3);
    return -[VCAudioTierPicker tierForAudioBitrate:withRedNumPayloads:](self, "tierForAudioBitrate:withRedNumPayloads:", objc_msgSend(v7, "unsignedIntValue"), a4);
  }
  if (self->_config.mode != 6)
  {
    v12[0] = &unk_1E9EF62C0;
    v12[1] = &unk_1E9EF6140;
    v13[0] = &unk_1E9EF6098;
    v13[1] = &unk_1E9EF60B0;
    v12[2] = &unk_1E9EF6230;
    v12[3] = &unk_1E9EF61A0;
    v13[2] = &unk_1E9EF60C8;
    v13[3] = &unk_1E9EF60F8;
    v12[4] = &unk_1E9EF61B8;
    v12[5] = &unk_1E9EF6320;
    v13[4] = &unk_1E9EF6110;
    v13[5] = &unk_1E9EF6128;
    v12[6] = &unk_1E9EF6260;
    v12[7] = &unk_1E9EF6338;
    v13[6] = &unk_1E9EF6008;
    v13[7] = &unk_1E9EF6020;
    v12[8] = &unk_1E9EF6278;
    v13[8] = &unk_1E9EF6038;
    v8 = (void *)MEMORY[0x1E0C99D80];
    v9 = v13;
    v10 = v12;
    goto LABEL_5;
  }
  return -[VCAudioTierPicker tierForAudioBitrate:withRedNumPayloads:](self, "tierForAudioBitrate:withRedNumPayloads:", objc_msgSend(v7, "unsignedIntValue"), a4);
}

- (id)tierForAudioBitrate:(unint64_t)a3 withRedNumPayloads:(unint64_t)a4
{
  id v7;
  int ErrorLogLevelForModule;
  uint64_t v9;
  NSObject *v10;
  const char *v11;
  NSObject *v12;
  uint32_t v13;
  void *v14;
  unint64_t v15;
  uint64_t v16;
  NSObject *v17;
  void *v18;
  int v19;
  uint64_t v20;
  uint64_t v21;
  NSObject *v22;
  id v23;
  uint64_t v24;
  uint64_t v25;
  NSObject *v26;
  const char *v27;
  int v28;
  int v29;
  uint64_t v30;
  const __CFString *v31;
  uint64_t v32;
  NSObject *v33;
  VCAudioTier *fallbackTier;
  const char *v35;
  NSObject *v36;
  uint32_t v37;
  uint64_t v38;
  NSObject *v39;
  VCAudioTier *v41;
  int v42;
  uint64_t v43;
  __int16 v44;
  const char *v45;
  __int16 v46;
  int v47;
  __int16 v48;
  _BYTE v49[20];
  _BYTE v50[10];
  VCAudioTier *v51;
  uint64_t v52;

  v52 = *MEMORY[0x1E0C80C00];
  if (self->_config.mode == 6)
  {
    v7 = -[VCAudioTierPicker chooseMultiwayAudioTierForRedPayload:](self, "chooseMultiwayAudioTierForRedPayload:", a4);
    ErrorLogLevelForModule = VRTraceGetErrorLogLevelForModule();
    if (v7)
    {
      if (ErrorLogLevelForModule >= 7)
      {
        v9 = VRTraceErrorLogLevelToCSTR();
        v10 = *MEMORY[0x1E0CF2758];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
        {
          v42 = 136316162;
          v43 = v9;
          v44 = 2080;
          v45 = "-[VCAudioTierPicker tierForAudioBitrate:withRedNumPayloads:]";
          v46 = 1024;
          v47 = 1058;
          v48 = 1024;
          *(_DWORD *)v49 = a3;
          *(_WORD *)&v49[4] = 2112;
          *(_QWORD *)&v49[6] = v7;
          v11 = " [%s] %s:%d Tier for bitrate %d -> %@";
          v12 = v10;
          v13 = 44;
LABEL_39:
          _os_log_impl(&dword_1D8A54000, v12, OS_LOG_TYPE_DEFAULT, v11, (uint8_t *)&v42, v13);
          return v7;
        }
      }
    }
    else
    {
      if (ErrorLogLevelForModule >= 3)
      {
        VRTraceErrorLogLevelToCSTR();
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
          -[VCAudioTierPicker tierForAudioBitrate:withRedNumPayloads:].cold.1();
      }
      return 0;
    }
    return v7;
  }
  v14 = (void *)objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a3);
  if (+[VCAudioTierPicker isModeAudioVideo:](VCAudioTierPicker, "isModeAudioVideo:", self->_config.mode)
    && a3 <= 0xA410
    && self->_config.usingCellular
    && objc_msgSend(v14, "integerValue") > 32000)
  {
    v14 = &unk_1E9EF6170;
  }
  v15 = -[VCAudioTierPicker adjustedRedNumPayloadsForLowBitrateAudioTier:redNumPayloads:](self, "adjustedRedNumPayloadsForLowBitrateAudioTier:redNumPayloads:", v14, a4);
  if (v15 >= 4)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 5)
    {
      v16 = VRTraceErrorLogLevelToCSTR();
      v17 = *MEMORY[0x1E0CF2758];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
      {
        v42 = 136316162;
        v43 = v16;
        v44 = 2080;
        v45 = "-[VCAudioTierPicker tierForAudioBitrate:withRedNumPayloads:]";
        v46 = 1024;
        v47 = 1076;
        v48 = 1024;
        *(_DWORD *)v49 = v15;
        *(_WORD *)&v49[4] = 1024;
        *(_DWORD *)&v49[6] = 3;
        _os_log_impl(&dword_1D8A54000, v17, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d Cap exceeded for number of red payloads:%d using %d instead", (uint8_t *)&v42, 0x28u);
      }
    }
    v15 = 3;
  }
  v18 = (void *)-[NSMutableDictionary objectForKeyedSubscript:](self->_tierTablesForRedNumPayloads, "objectForKeyedSubscript:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v15));
  if (!v18)
  {
    if (v15 <= 2)
      v19 = 2;
    else
      v19 = v15;
    LODWORD(v20) = v15;
    do
    {
      if (v19 == (_DWORD)v20)
      {
        v18 = 0;
        goto LABEL_32;
      }
      v20 = (v20 + 1);
    }
    while (!-[NSMutableDictionary objectForKeyedSubscript:](self->_tierTablesForRedNumPayloads, "objectForKeyedSubscript:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", v20)));
    if ((int)VRTraceGetErrorLogLevelForModule() >= 5)
    {
      v21 = VRTraceErrorLogLevelToCSTR();
      v22 = *MEMORY[0x1E0CF2758];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
      {
        v42 = 136316162;
        v43 = v21;
        v44 = 2080;
        v45 = "-[VCAudioTierPicker tierForAudioBitrate:withRedNumPayloads:]";
        v46 = 1024;
        v47 = 1085;
        v48 = 1024;
        *(_DWORD *)v49 = v15;
        *(_WORD *)&v49[4] = 1024;
        *(_DWORD *)&v49[6] = v20;
        _os_log_impl(&dword_1D8A54000, v22, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d RED value of %d is not supported. Next RED value: %d", (uint8_t *)&v42, 0x28u);
      }
    }
    v18 = (void *)-[NSMutableDictionary objectForKeyedSubscript:](self->_tierTablesForRedNumPayloads, "objectForKeyedSubscript:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", v20));
  }
LABEL_32:
  v23 = +[VCArrayUtils closestValueLessThanOrEqualToValue:array:](VCArrayUtils, "closestValueLessThanOrEqualToValue:array:", v14, objc_msgSend((id)objc_msgSend(v18, "allKeys"), "sortedArrayUsingSelector:", sel_compare_));
  v24 = objc_msgSend(v18, "objectForKeyedSubscript:", v23);
  if (!v24)
  {
    if ((VCAudioTierPicker *)objc_opt_class() == self)
    {
      if ((int)VRTraceGetErrorLogLevelForModule() < 3)
        return self->_fallbackTier;
      v32 = VRTraceErrorLogLevelToCSTR();
      v33 = *MEMORY[0x1E0CF2758];
      if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
        return self->_fallbackTier;
      fallbackTier = self->_fallbackTier;
      v42 = 136316162;
      v43 = v32;
      v44 = 2080;
      v45 = "-[VCAudioTierPicker tierForAudioBitrate:withRedNumPayloads:]";
      v46 = 1024;
      v47 = 1096;
      v48 = 2048;
      *(_QWORD *)v49 = a3;
      *(_WORD *)&v49[8] = 2112;
      *(_QWORD *)&v49[10] = fallbackTier;
      v35 = " [%s] %s:%d No corresponding tier found for audioBitrate=%lu, using fallback=%@";
      v36 = v33;
      v37 = 48;
    }
    else
    {
      if ((objc_opt_respondsToSelector() & 1) != 0)
        v31 = (const __CFString *)-[VCAudioTierPicker performSelector:](self, "performSelector:", sel_logPrefix);
      else
        v31 = &stru_1E9E58EE0;
      if ((int)VRTraceGetErrorLogLevelForModule() < 3)
        return self->_fallbackTier;
      v38 = VRTraceErrorLogLevelToCSTR();
      v39 = *MEMORY[0x1E0CF2758];
      if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
        return self->_fallbackTier;
      v41 = self->_fallbackTier;
      v42 = 136316674;
      v43 = v38;
      v44 = 2080;
      v45 = "-[VCAudioTierPicker tierForAudioBitrate:withRedNumPayloads:]";
      v46 = 1024;
      v47 = 1096;
      v48 = 2112;
      *(_QWORD *)v49 = v31;
      *(_WORD *)&v49[8] = 2048;
      *(_QWORD *)&v49[10] = self;
      *(_WORD *)&v49[18] = 2048;
      *(_QWORD *)v50 = a3;
      *(_WORD *)&v50[8] = 2112;
      v51 = v41;
      v35 = " [%s] %s:%d %@(%p) No corresponding tier found for audioBitrate=%lu, using fallback=%@";
      v36 = v39;
      v37 = 68;
    }
    _os_log_error_impl(&dword_1D8A54000, v36, OS_LOG_TYPE_ERROR, v35, (uint8_t *)&v42, v37);
    return self->_fallbackTier;
  }
  v7 = (id)v24;
  if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
  {
    v25 = VRTraceErrorLogLevelToCSTR();
    v26 = *MEMORY[0x1E0CF2758];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
    {
      if (+[VCAudioTierPicker isModeAudioVideo:](VCAudioTierPicker, "isModeAudioVideo:", self->_config.mode))
      {
        v27 = "video";
      }
      else
      {
        v27 = "audio";
      }
      v28 = objc_msgSend(v14, "intValue");
      v29 = objc_msgSend(v23, "intValue");
      v30 = objc_msgSend((id)objc_msgSend(v7, "description"), "UTF8String");
      v42 = 136316674;
      v43 = v25;
      v44 = 2080;
      v45 = "-[VCAudioTierPicker tierForAudioBitrate:withRedNumPayloads:]";
      v46 = 1024;
      v47 = 1103;
      v48 = 2080;
      *(_QWORD *)v49 = v27;
      *(_WORD *)&v49[8] = 1024;
      *(_DWORD *)&v49[10] = v28;
      *(_WORD *)&v49[14] = 1024;
      *(_DWORD *)&v49[16] = v29;
      *(_WORD *)v50 = 2080;
      *(_QWORD *)&v50[2] = v30;
      v11 = " [%s] %s:%d (%s) Using tier: bitrate=%d, closestAudioBitrate=%d %s";
      v12 = v26;
      v13 = 60;
      goto LABEL_39;
    }
  }
  return v7;
}

- (unint64_t)adjustedRedNumPayloadsForLowBitrateAudioTier:(id)a3 redNumPayloads:(unint64_t)a4
{
  uint64_t v7;
  unsigned int v8;
  unint64_t v9;
  unint64_t v10;

  if (!+[VCAudioTierPicker usePlistForAudioTierTableFromMode:](VCAudioTierPicker, "usePlistForAudioTierTableFromMode:", self->_config.mode))
  {
    v7 = 85;
    if (!self->_config.usingCellular)
      v7 = 86;
    if (!+[VCDefaults BOOLeanValueForKey:defaultValue:](VCDefaults, "BOOLeanValueForKey:defaultValue:", CFSTR("rateControlAllowRedLowBitrate"), *((unsigned __int8 *)&self->super.isa + v7)))
    {
      v8 = objc_msgSend(a3, "unsignedIntegerValue");
      v9 = 2;
      if (a4 < 2)
        v9 = a4;
      if (v8 >= 0x5209)
        v9 = a4;
      if (v8 <= 0x3E80)
        v10 = a4 != 0;
      else
        v10 = v9;
      if (v8 >= 0x2711)
        return v10;
      else
        return 0;
    }
  }
  return a4;
}

- (id)allActiveAudioTiers
{
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  _BYTE v10[128];
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v3 = (void *)objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v4 = (void *)-[NSMutableDictionary allValues](self->_tierTablesForRedNumPayloads, "allValues");
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v11, v10, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v12;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v12 != v7)
          objc_enumerationMutation(v4);
        objc_msgSend(v3, "addObjectsFromArray:", objc_msgSend(*(id *)(*((_QWORD *)&v11 + 1) + 8 * v8++), "allValues"));
      }
      while (v6 != v8);
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v11, v10, 16);
    }
    while (v6);
  }
  return v3;
}

- (id)allPayloadsFromAllTierTables
{
  return (id)-[NSMutableSet allObjects](self->_audioPayloads, "allObjects");
}

- (void)generateAudioPayloadsFromConfig:(id *)a3
{
  int64_t v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  __CFArray *var3;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t k;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t m;
  id v23;
  void *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t j;
  id obj;
  _BYTE v30[128];
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  _BYTE v35[128];
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  _BYTE v40[128];
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  _BYTE v45[128];
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  uint64_t v50;

  v50 = *MEMORY[0x1E0C80C00];
  v5 = +[VCHardwareSettings deviceClass](VCHardwareSettings, "deviceClass");
  -[NSMutableSet removeAllObjects](self->_audioPayloads, "removeAllObjects");
  if (+[VCAudioTierPicker usePlistForAudioTierTableFromMode:](VCAudioTierPicker, "usePlistForAudioTierTableFromMode:", a3->var0))
  {
    if (a3->var0 == 6)
    {
      v6 = -[VCAudioTierPicker loadAudioTiersFromPlist:](self, "loadAudioTiersFromPlist:", CFSTR("AudioTiers_GFT"));
      v46 = 0u;
      v47 = 0u;
      v48 = 0u;
      v49 = 0u;
      obj = (id)objc_msgSend((id)objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("networkBitrate")), "allKeys");
      v7 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v46, v45, 16);
      if (v7)
      {
        v8 = v7;
        v9 = *(_QWORD *)v47;
        do
        {
          for (i = 0; i != v8; ++i)
          {
            if (*(_QWORD *)v47 != v9)
              objc_enumerationMutation(obj);
            -[VCAudioTierPicker addPayloadsFromGFTRedNumPayloadsDict:isDeviceClassWolf:](self, "addPayloadsFromGFTRedNumPayloadsDict:isDeviceClassWolf:", objc_msgSend((id)objc_msgSend((id)objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("networkBitrate")), "objectForKeyedSubscript:", *(_QWORD *)(*((_QWORD *)&v46 + 1) + 8 * i)), "objectForKeyedSubscript:", CFSTR("redNumPayloads")), v5 == 8);
          }
          v8 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v46, v45, 16);
        }
        while (v8);
      }
    }
    else
    {
      v23 = -[VCAudioTierPicker loadAudioTiersFromPlist:](self, "loadAudioTiersFromPlist:", CFSTR("AudioTiers_U1"));
      v24 = (void *)objc_msgSend(v23, "allKeys");
      v41 = 0u;
      v42 = 0u;
      v43 = 0u;
      v44 = 0u;
      v25 = objc_msgSend(v24, "countByEnumeratingWithState:objects:count:", &v41, v40, 16);
      if (v25)
      {
        v26 = v25;
        v27 = *(_QWORD *)v42;
        do
        {
          for (j = 0; j != v26; ++j)
          {
            if (*(_QWORD *)v42 != v27)
              objc_enumerationMutation(v24);
            -[VCAudioTierPicker addPayloadsFromU1IPVerDict:config:mode:](self, "addPayloadsFromU1IPVerDict:config:mode:", objc_msgSend(v23, "objectForKeyedSubscript:", *(_QWORD *)(*((_QWORD *)&v41 + 1) + 8 * j)), a3, *(_QWORD *)(*((_QWORD *)&v41 + 1) + 8 * j));
          }
          v26 = objc_msgSend(v24, "countByEnumeratingWithState:objects:count:", &v41, v40, 16);
        }
        while (v26);
      }
    }
  }
  else
  {
    v38 = 0u;
    v39 = 0u;
    v36 = 0u;
    v37 = 0u;
    var3 = a3->var3;
    v12 = -[__CFArray countByEnumeratingWithState:objects:count:](var3, "countByEnumeratingWithState:objects:count:", &v36, v35, 16);
    if (v12)
    {
      v13 = v12;
      v14 = *(_QWORD *)v37;
      do
      {
        for (k = 0; k != v13; ++k)
        {
          if (*(_QWORD *)v37 != v14)
            objc_enumerationMutation(var3);
          v16 = (void *)-[NSMutableDictionary objectForKeyedSubscript:](self->_tierTablesForRedNumPayloads, "objectForKeyedSubscript:", *(_QWORD *)(*((_QWORD *)&v36 + 1) + 8 * k));
          v17 = (void *)objc_msgSend(v16, "allKeys");
          v31 = 0u;
          v32 = 0u;
          v33 = 0u;
          v34 = 0u;
          v18 = (void *)objc_msgSend(v17, "reverseObjectEnumerator");
          v19 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v31, v30, 16);
          if (v19)
          {
            v20 = v19;
            v21 = *(_QWORD *)v32;
            do
            {
              for (m = 0; m != v20; ++m)
              {
                if (*(_QWORD *)v32 != v21)
                  objc_enumerationMutation(v18);
                -[VCAudioTierPicker addPayloadFromTier:](self, "addPayloadFromTier:", objc_msgSend(v16, "objectForKeyedSubscript:", *(_QWORD *)(*((_QWORD *)&v31 + 1) + 8 * m)));
              }
              v20 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v31, v30, 16);
            }
            while (v20);
          }
        }
        v13 = -[__CFArray countByEnumeratingWithState:objects:count:](var3, "countByEnumeratingWithState:objects:count:", &v36, v35, 16);
      }
      while (v13);
    }
  }
}

- (void)addPayloadFromTier:(id)a3
{
  uint64_t v4;

  if (a3)
  {
    v4 = objc_msgSend((id)objc_msgSend(a3, "payloadConfig"), "payload");
    -[NSMutableSet addObject:](self->_audioPayloads, "addObject:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", v4));
  }
}

- (void)addPayloadsFromU1IPVerDict:(id)a3 config:(id *)a4 mode:(id)a5
{
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  id obj;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  _BYTE v21[128];
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  _BYTE v26[128];
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  if (a3)
  {
    v27 = 0u;
    v28 = 0u;
    v29 = 0u;
    v30 = 0u;
    obj = (id)objc_msgSend(a3, "allKeys");
    v17 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v27, v26, 16);
    if (v17)
    {
      v16 = *(_QWORD *)v28;
      do
      {
        v7 = 0;
        do
        {
          if (*(_QWORD *)v28 != v16)
            objc_enumerationMutation(obj);
          v18 = v7;
          v8 = *(void **)(*((_QWORD *)&v27 + 1) + 8 * v7);
          v9 = (void *)objc_msgSend((id)objc_msgSend(a3, "objectForKeyedSubscript:", v8), "allKeys");
          v22 = 0u;
          v23 = 0u;
          v24 = 0u;
          v25 = 0u;
          v10 = v9;
          v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v22, v21, 16);
          if (v11)
          {
            v12 = v11;
            v13 = *(_QWORD *)v23;
            do
            {
              for (i = 0; i != v12; ++i)
              {
                if (*(_QWORD *)v23 != v13)
                  objc_enumerationMutation(v10);
                -[VCAudioTierPicker addPayloadsFromU1RedNumPayloadsDict:config:mode:isIPv4:isCellular:](self, "addPayloadsFromU1RedNumPayloadsDict:config:mode:isIPv4:isCellular:", objc_msgSend((id)objc_msgSend((id)objc_msgSend(a3, "objectForKeyedSubscript:", v8), "objectForKeyedSubscript:", *(_QWORD *)(*((_QWORD *)&v22 + 1) + 8 * i)), "objectForKeyedSubscript:", CFSTR("redNumPayloads")), a4, a5, objc_msgSend(v8, "isEqualToString:", CFSTR("IPv4")), objc_msgSend(*(id *)(*((_QWORD *)&v22 + 1) + 8 * i), "isEqualToString:", CFSTR("cellular")));
              }
              v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v22, v21, 16);
            }
            while (v12);
          }
          v7 = v18 + 1;
        }
        while (v18 + 1 != v17);
        v17 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v27, v26, 16);
      }
      while (v17);
    }
  }
}

- (void)addPayloadsFromU1RedNumPayloadsDict:(id)a3 config:(id *)a4 mode:(id)a5 isIPv4:(BOOL)a6 isCellular:(BOOL)a7
{
  _BOOL4 v7;
  _BOOL4 v8;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t i;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t j;
  uint64_t v23;
  uint64_t v24;
  NSObject *v25;
  int v26;
  int v27;
  id v28;
  unint64_t v29;
  id obj;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  id v34;
  uint64_t v35;
  void *v36;
  _BYTE v38[128];
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  uint8_t buf[4];
  uint64_t v44;
  __int16 v45;
  const char *v46;
  __int16 v47;
  int v48;
  __int16 v49;
  id v50;
  __int16 v51;
  int v52;
  __int16 v53;
  int v54;
  __int16 v55;
  int v56;
  __int16 v57;
  int v58;
  _BYTE v59[128];
  __int128 v60;
  __int128 v61;
  __int128 v62;
  __int128 v63;
  _BYTE v64[128];
  __int128 v65;
  __int128 v66;
  __int128 v67;
  __int128 v68;
  uint64_t v69;

  v69 = *MEMORY[0x1E0C80C00];
  if (a3)
  {
    v7 = a7;
    v8 = a6;
    v65 = 0u;
    v66 = 0u;
    v67 = 0u;
    v68 = 0u;
    obj = (id)objc_msgSend(a3, "allKeys", a3, a4);
    v31 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v65, v64, 16);
    if (v31)
    {
      v32 = *(_QWORD *)v66;
      v29 = __PAIR64__(v7, v8);
      v28 = a5;
      do
      {
        v11 = 0;
        do
        {
          if (*(_QWORD *)v66 != v32)
            objc_enumerationMutation(obj);
          v33 = v11;
          v36 = *(void **)(*((_QWORD *)&v65 + 1) + 8 * v11);
          v12 = (void *)objc_msgSend((id)objc_msgSend((id)objc_msgSend(a3, "objectForKeyedSubscript:", v28, v29), "objectForKeyedSubscript:", CFSTR("bitrateTier")), "allKeys");
          v60 = 0u;
          v61 = 0u;
          v62 = 0u;
          v63 = 0u;
          v34 = v12;
          v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v60, v59, 16);
          if (v13)
          {
            v14 = v13;
            v35 = *(_QWORD *)v61;
            while (2)
            {
              for (i = 0; i != v14; ++i)
              {
                if (*(_QWORD *)v61 != v35)
                  objc_enumerationMutation(v34);
                v16 = *(void **)(*((_QWORD *)&v60 + 1) + 8 * i);
                v17 = (void *)objc_msgSend((id)objc_msgSend((id)objc_msgSend((id)objc_msgSend(a3, "objectForKeyedSubscript:", v36), "objectForKeyedSubscript:", CFSTR("bitrateTier")), "objectForKeyedSubscript:", v16), "objectForKeyedSubscript:", CFSTR("payloads"));
                if (!v17)
                {
                  if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
                  {
                    v24 = VRTraceErrorLogLevelToCSTR();
                    v25 = *MEMORY[0x1E0CF2758];
                    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
                    {
                      v26 = objc_msgSend(v36, "intValue");
                      v27 = objc_msgSend(v16, "intValue");
                      *(_DWORD *)buf = 136316930;
                      v44 = v24;
                      v45 = 2080;
                      v46 = "-[VCAudioTierPicker addPayloadsFromU1RedNumPayloadsDict:config:mode:isIPv4:isCellular:]";
                      v47 = 1024;
                      v48 = 1232;
                      v49 = 2112;
                      v50 = v28;
                      v51 = 1024;
                      v52 = v29;
                      v53 = 1024;
                      v54 = HIDWORD(v29);
                      v55 = 1024;
                      v56 = v26;
                      v57 = 1024;
                      v58 = v27;
                      _os_log_error_impl(&dword_1D8A54000, v25, OS_LOG_TYPE_ERROR, " [%s] %s:%d No payloads array for mode=%@ and isIPv4=%{BOOL}d isCellular=%{BOOL}d redNumPayloads=%u tierBitrate=%u", buf, 0x3Eu);
                    }
                  }
                  return;
                }
                v18 = v17;
                v41 = 0u;
                v42 = 0u;
                v39 = 0u;
                v40 = 0u;
                v19 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v39, v38, 16);
                if (v19)
                {
                  v20 = v19;
                  v21 = *(_QWORD *)v40;
                  do
                  {
                    for (j = 0; j != v20; ++j)
                    {
                      if (*(_QWORD *)v40 != v21)
                        objc_enumerationMutation(v18);
                      v23 = objc_msgSend((id)objc_msgSend(*(id *)(*((_QWORD *)&v39 + 1) + 8 * j), "objectForKeyedSubscript:", CFSTR("payload")), "integerValue");
                      -[NSMutableSet addObject:](self->_audioPayloads, "addObject:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", v23));
                    }
                    v20 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v39, v38, 16);
                  }
                  while (v20);
                }
              }
              v14 = objc_msgSend(v34, "countByEnumeratingWithState:objects:count:", &v60, v59, 16);
              if (v14)
                continue;
              break;
            }
          }
          v11 = v33 + 1;
        }
        while (v33 + 1 != v31);
        v31 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v65, v64, 16);
      }
      while (v31);
    }
  }
}

- (void)addPayloadsFromGFTPayloadsArray:(id)a3
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  _BYTE v10[128];
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v5 = objc_msgSend(a3, "countByEnumeratingWithState:objects:count:", &v11, v10, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v12;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v12 != v7)
          objc_enumerationMutation(a3);
        v9 = objc_msgSend((id)objc_msgSend(*(id *)(*((_QWORD *)&v11 + 1) + 8 * v8), "objectForKeyedSubscript:", CFSTR("payload")), "integerValue");
        -[NSMutableSet addObject:](self->_audioPayloads, "addObject:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", v9));
        ++v8;
      }
      while (v6 != v8);
      v6 = objc_msgSend(a3, "countByEnumeratingWithState:objects:count:", &v11, v10, 16);
    }
    while (v6);
  }
}

- (void)addPayloadsFromGFTRedNumPayloadsDict:(id)a3 isDeviceClassWolf:(BOOL)a4
{
  int v4;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  uint64_t v12;
  _BYTE v13[128];
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  if (a3)
  {
    v4 = a4;
    v7 = (void *)objc_msgSend(a3, "allKeys");
    v14 = 0u;
    v15 = 0u;
    v16 = 0u;
    v17 = 0u;
    v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v14, v13, 16);
    if (v8)
    {
      v9 = v8;
      v10 = *(_QWORD *)v15;
      do
      {
        for (i = 0; i != v9; ++i)
        {
          if (*(_QWORD *)v15 != v10)
            objc_enumerationMutation(v7);
          v12 = *(_QWORD *)(*((_QWORD *)&v14 + 1) + 8 * i);
          if (objc_msgSend((id)objc_msgSend((id)objc_msgSend(a3, "objectForKeyedSubscript:", v12), "objectForKeyedSubscript:", CFSTR("lowLatencyAudioDevice")), "BOOLValue") == v4)-[VCAudioTierPicker addPayloadsFromGFTPayloadsArray:](self, "addPayloadsFromGFTPayloadsArray:", objc_msgSend((id)objc_msgSend(a3, "objectForKeyedSubscript:", v12), "objectForKeyedSubscript:", CFSTR("payloads")));
        }
        v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v14, v13, 16);
      }
      while (v9);
    }
  }
}

- (VCAudioTier)defaultTier
{
  return self->_defaultTier;
}

- ($874264D99418FF75A48C4C64EBA5A14C)config
{
  $874264D99418FF75A48C4C64EBA5A14C *result;

  objc_copyStruct(retstr, &self->_config, 48, 1, 0);
  return result;
}

- (void)setConfig:(id *)a3
{
  objc_copyStruct(&self->_config, a3, 48, 1, 0);
}

- (BitrateLimits)bitrateLimits
{
  return self->_bitrateLimits;
}

- (void)setBitrateLimits:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 32);
}

- (void)setupTierPickerForConfig:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_1D8A54000, v0, v1, " [%s] %s:%d Cannot setup audio tier picker, invalid mode", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

- (void)setupTierPickerForConfig:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_1D8A54000, v0, v1, " [%s] %s:%d Error allocating _tierTabledForRedNumPayloads", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

- (void)setupTierPickerForConfig:.cold.3()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_1D8A54000, v0, v1, " [%s] %s:%d Error allocating _bitrateLimits", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

- (void)setupTierPickerForConfig:.cold.4()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_1D8A54000, v0, v1, " [%s] %s:%d VCAudioTierPicker failed to generate tiers", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

- (void)setupAlwaysOnRedTiersForSupportedRed:usingCellular:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_1D8A54000, v0, v1, " [%s] %s:%d Unable to setup always on red tiers, as supportedRedNumPayloads is nil", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

- (void)generateAudioTiersDictFromPlistForBitrateLimits:tierPickerConfig:redNumPayloads:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_1D8A54000, v0, v1, " [%s] %s:%d Failed to allocate the audio tiers dictionary", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

- (void)generateAudioTiersDictFromPlistForBitrateLimits:tierPickerConfig:redNumPayloads:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_1D8A54000, v0, v1, " [%s] %s:%d Failed to allocate the payload array", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

- (void)generateAudioTiersDictFromPlistForBitrateLimits:tierPickerConfig:redNumPayloads:.cold.3()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_1D8A54000, v0, v1, " [%s] %s:%d Unable to load tier table from plist file", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

- (void)generateAudioTiersDictFromPlistForBitrateLimits:tierPickerConfig:redNumPayloads:.cold.4()
{
  uint64_t v0;
  os_log_t v1;
  const char *v2;
  const char *v3;
  int v4;

  OUTLINED_FUNCTION_8_0();
  OUTLINED_FUNCTION_9();
  OUTLINED_FUNCTION_5(&dword_1D8A54000, v0, v1, " [%s] %s:%d Unsupported audioTierPickerMode=%d", v2, v3, v4, 571);
  OUTLINED_FUNCTION_3();
}

+ (void)loadVCAudioTierFromTierTable:config:allowRedAtLowBitrate:alwaysOnAudioRedundancyDisabled:redNumPayloads:tierBitrate:outEntryArray:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_1D8A54000, v0, v1, " [%s] %s:%d entry cannot be NULL", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

+ (void)loadVCAudioTierFromTierTable:config:allowRedAtLowBitrate:alwaysOnAudioRedundancyDisabled:redNumPayloads:tierBitrate:outEntryArray:.cold.2()
{
  uint64_t v0;
  os_log_t v1;
  const char *v2;
  const char *v3;
  int v4;

  OUTLINED_FUNCTION_8_0();
  OUTLINED_FUNCTION_9();
  OUTLINED_FUNCTION_5(&dword_1D8A54000, v0, v1, " [%s] %s:%d No tier table entry for mode=%d", v2, v3, v4, 711);
  OUTLINED_FUNCTION_3();
}

+ (void)loadVCAudioTierFromTierTable:bitrate:redNumPayloads:outEntryArray:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_1D8A54000, v0, v1, " [%s] %s:%d entry cannot be NULL", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

+ (void)loadVCAudioTierFromTierTable:bitrate:redNumPayloads:outEntryArray:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_1D8A54000, v0, v1, " [%s] %s:%d No payloads array. entry cannot be NULL", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

- (void)tierForNetworkBitrate:withLegacyDuplication:.cold.1()
{
  uint64_t v0;
  os_log_t v1;
  uint8_t v2[24];
  int v3;
  __int16 v4;
  uint64_t v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_8_0();
  OUTLINED_FUNCTION_9();
  v3 = 981;
  v4 = 2112;
  v5 = v0;
  _os_log_error_impl(&dword_1D8A54000, v1, OS_LOG_TYPE_ERROR, " [%s] %s:%d No corresponding tier found for AudioBitRate, using fallback: %@", v2, 0x26u);
  OUTLINED_FUNCTION_3();
}

- (void)tierForNetworkBitrate:withLegacyDuplication:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_1D8A54000, v0, v1, " [%s] %s:%d Multiway doesn't use legacy duplication. Tier not found!", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

- (void)tierForAudioBitrate:withRedNumPayloads:.cold.1()
{
  __int16 v0;
  uint64_t v1;
  os_log_t v2;
  const char *v3;
  _BYTE v4[14];

  OUTLINED_FUNCTION_2();
  *(_WORD *)&v4[4] = v0;
  *(_QWORD *)&v4[6] = "-[VCAudioTierPicker tierForAudioBitrate:withRedNumPayloads:]";
  OUTLINED_FUNCTION_5(&dword_1D8A54000, v1, v2, " [%s] %s:%d Tier for bitrate %d not found!", v3, *(const char **)v4, (unint64_t)"-[VCAudioTierPicker tierForAudioBitrate:withRedNumPayloads:]" >> 16, 1056);
  OUTLINED_FUNCTION_3();
}

@end
