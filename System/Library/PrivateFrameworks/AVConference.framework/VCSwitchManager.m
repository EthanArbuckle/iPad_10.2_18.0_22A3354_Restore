@implementation VCSwitchManager

- (void)initializeLocalSwitches
{
  uint64_t v3;
  NSObject *v4;
  uint64_t v5;
  NSObject *v6;
  unsigned int localSwitches;
  int v8;
  uint64_t v9;
  __int16 v10;
  const char *v11;
  __int16 v12;
  int v13;
  __int16 v14;
  unsigned int v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  if (VCDefaults_GetBoolValueForKey(CFSTR("enableDiscreteSwitchSettingsForTesting"), 0)
    || +[GKSConnectivitySettings getAbTestingState](GKSConnectivitySettings, "getAbTestingState") == 1)
  {
    -[VCSwitchManager setupLocalSwitchesIndividually](self, "setupLocalSwitchesIndividually");
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      v3 = VRTraceErrorLogLevelToCSTR();
      v4 = *MEMORY[0x1E0CF2758];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
      {
        v8 = 136315650;
        v9 = v3;
        v10 = 2080;
        v11 = "-[VCSwitchManager initializeLocalSwitches]";
        v12 = 1024;
        v13 = 51;
        _os_log_impl(&dword_1D8A54000, v4, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d SwitchManager: Setting individual local switches for the purpose of QA testing", (uint8_t *)&v8, 0x1Cu);
      }
    }
  }
  else
  {
    self->_localSwitches = +[GKSConnectivitySettings getAbTestMasterLocalSwitches](GKSConnectivitySettings, "getAbTestMasterLocalSwitches");
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      v5 = VRTraceErrorLogLevelToCSTR();
      v6 = *MEMORY[0x1E0CF2758];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
      {
        localSwitches = self->_localSwitches;
        v8 = 136315906;
        v9 = v5;
        v10 = 2080;
        v11 = "-[VCSwitchManager initializeLocalSwitches]";
        v12 = 1024;
        v13 = 65;
        v14 = 1024;
        v15 = localSwitches;
        _os_log_impl(&dword_1D8A54000, v6, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d SwitchManager: Non-seed build - using master local switch: %08X", (uint8_t *)&v8, 0x22u);
      }
    }
    -[VCSwitchManager updateDuplicationEnhancementSwitches](self, "updateDuplicationEnhancementSwitches");
  }
}

- (void)setupLocalOnOffSwitches
{
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  double v29;
  double v30;

  -[VCSwitchManager setupLocalOnOffSwitchesFromMasterSwitch](self, "setupLocalOnOffSwitchesFromMasterSwitch");
  v3 = (double)arc4random() / 4294967300.0;
  +[GKSConnectivitySettings getThresholdForSwitch:](GKSConnectivitySettings, "getThresholdForSwitch:", 32);
  self->_localSwitches |= 32 * (v3 <= v4);
  v5 = (double)arc4random() / 4294967300.0;
  +[GKSConnectivitySettings getThresholdForSwitch:](GKSConnectivitySettings, "getThresholdForSwitch:", 0x20000);
  self->_localSwitches |= (v5 <= v6) << 17;
  v7 = (double)arc4random() / 4294967300.0;
  +[GKSConnectivitySettings getThresholdForSwitch:](GKSConnectivitySettings, "getThresholdForSwitch:", 0x40000);
  self->_localSwitches |= (v7 <= v8) << 18;
  v9 = (double)arc4random() / 4294967300.0;
  +[GKSConnectivitySettings getThresholdForSwitch:](GKSConnectivitySettings, "getThresholdForSwitch:", 0x80000);
  self->_localSwitches |= (v9 <= v10) << 19;
  v11 = (double)arc4random() / 4294967300.0;
  +[GKSConnectivitySettings getThresholdForSwitch:](GKSConnectivitySettings, "getThresholdForSwitch:", 0x100000);
  self->_localSwitches |= (v11 <= v12) << 20;
  v13 = (double)arc4random() / 4294967300.0;
  +[GKSConnectivitySettings getThresholdForSwitch:](GKSConnectivitySettings, "getThresholdForSwitch:", 0x200000);
  self->_localSwitches |= (v13 <= v14) << 21;
  v15 = (double)arc4random() / 4294967300.0;
  +[GKSConnectivitySettings getThresholdForSwitch:](GKSConnectivitySettings, "getThresholdForSwitch:", 0x800000);
  self->_localSwitches |= (v15 <= v16) << 23;
  v17 = (double)arc4random() / 4294967300.0;
  +[GKSConnectivitySettings getThresholdForSwitch:](GKSConnectivitySettings, "getThresholdForSwitch:", 0x1000000);
  self->_localSwitches |= (v17 <= v18) << 24;
  v19 = (double)arc4random() / 4294967300.0;
  +[GKSConnectivitySettings getThresholdForSwitch:](GKSConnectivitySettings, "getThresholdForSwitch:", 0x2000000);
  self->_localSwitches |= (v19 <= v20) << 25;
  v21 = (double)arc4random() / 4294967300.0;
  +[GKSConnectivitySettings getThresholdForSwitch:](GKSConnectivitySettings, "getThresholdForSwitch:", 0x4000000);
  self->_localSwitches |= (v21 <= v22) << 26;
  v23 = (double)arc4random() / 4294967300.0;
  +[GKSConnectivitySettings getThresholdForSwitch:](GKSConnectivitySettings, "getThresholdForSwitch:", 0x8000000);
  self->_localSwitches |= (v23 <= v24) << 27;
  v25 = (double)arc4random() / 4294967300.0;
  +[GKSConnectivitySettings getThresholdForSwitch:](GKSConnectivitySettings, "getThresholdForSwitch:", 0x10000000);
  self->_localSwitches |= (v25 <= v26) << 28;
  v27 = (double)arc4random() / 4294967300.0;
  +[GKSConnectivitySettings getThresholdForSwitch:](GKSConnectivitySettings, "getThresholdForSwitch:", 0x20000000);
  self->_localSwitches |= (v27 <= v28) << 29;
  v29 = (double)arc4random() / 4294967300.0;
  +[GKSConnectivitySettings getThresholdForSwitch:](GKSConnectivitySettings, "getThresholdForSwitch:", 0x40000000);
  self->_localSwitches |= (v29 <= v30) << 30;
}

- (void)setupLocalABTestSwitches
{
  -[VCSwitchManager setupLocalAudioTestGroupSwitches](self, "setupLocalAudioTestGroupSwitches");
  -[VCSwitchManager setupLocalVideoTestGroupSwitches](self, "setupLocalVideoTestGroupSwitches");
  -[VCSwitchManager setupLocalNetworkTestGroupSwitches](self, "setupLocalNetworkTestGroupSwitches");
  -[VCSwitchManager setupLocalRateControlTestGroupSwitches](self, "setupLocalRateControlTestGroupSwitches");
  -[VCSwitchManager setupLocalDuplicationTestGroupSwitches](self, "setupLocalDuplicationTestGroupSwitches");
}

- (void)setupLocalSwitchesIndividually
{
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  double v29;
  double v30;
  double v31;
  double v32;
  double v33;
  double v34;
  double v35;
  double v36;
  double v37;
  double v38;
  double v39;
  double v40;
  double v41;
  double v42;
  double v43;
  double v44;
  double v45;
  double v46;
  double v47;
  double v48;
  double v49;
  double v50;
  double v51;
  double v52;
  double v53;
  double v54;
  double v55;
  double v56;
  double v57;
  double v58;
  double v59;
  double v60;
  double v61;
  double v62;
  double v63;
  double v64;

  self->_localSwitches = 0;
  v3 = (double)arc4random() / 4294967300.0;
  +[GKSConnectivitySettings getThresholdForSwitch:](GKSConnectivitySettings, "getThresholdForSwitch:", 1);
  self->_localSwitches |= v3 <= v4;
  v5 = (double)arc4random() / 4294967300.0;
  +[GKSConnectivitySettings getThresholdForSwitch:](GKSConnectivitySettings, "getThresholdForSwitch:", 2);
  self->_localSwitches |= 2 * (v5 <= v6);
  v7 = (double)arc4random() / 4294967300.0;
  +[GKSConnectivitySettings getThresholdForSwitch:](GKSConnectivitySettings, "getThresholdForSwitch:", 4);
  self->_localSwitches |= 4 * (v7 <= v8);
  v9 = (double)arc4random() / 4294967300.0;
  +[GKSConnectivitySettings getThresholdForSwitch:](GKSConnectivitySettings, "getThresholdForSwitch:", 8);
  self->_localSwitches |= 8 * (v9 <= v10);
  v11 = (double)arc4random() / 4294967300.0;
  +[GKSConnectivitySettings getThresholdForSwitch:](GKSConnectivitySettings, "getThresholdForSwitch:", 16);
  self->_localSwitches |= 16 * (v11 <= v12);
  v13 = (double)arc4random() / 4294967300.0;
  +[GKSConnectivitySettings getThresholdForSwitch:](GKSConnectivitySettings, "getThresholdForSwitch:", 32);
  self->_localSwitches |= 32 * (v13 <= v14);
  v15 = (double)arc4random() / 4294967300.0;
  +[GKSConnectivitySettings getThresholdForSwitch:](GKSConnectivitySettings, "getThresholdForSwitch:", 64);
  self->_localSwitches |= (v15 <= v16) << 6;
  v17 = (double)arc4random() / 4294967300.0;
  +[GKSConnectivitySettings getThresholdForSwitch:](GKSConnectivitySettings, "getThresholdForSwitch:", 128);
  self->_localSwitches |= (v17 <= v18) << 7;
  v19 = (double)arc4random() / 4294967300.0;
  +[GKSConnectivitySettings getThresholdForSwitch:](GKSConnectivitySettings, "getThresholdForSwitch:", 256);
  self->_localSwitches |= (v19 <= v20) << 8;
  v21 = (double)arc4random() / 4294967300.0;
  +[GKSConnectivitySettings getThresholdForSwitch:](GKSConnectivitySettings, "getThresholdForSwitch:", 512);
  self->_localSwitches |= (v21 <= v22) << 9;
  v23 = (double)arc4random() / 4294967300.0;
  +[GKSConnectivitySettings getThresholdForSwitch:](GKSConnectivitySettings, "getThresholdForSwitch:", 1024);
  self->_localSwitches |= (v23 <= v24) << 10;
  v25 = (double)arc4random() / 4294967300.0;
  +[GKSConnectivitySettings getThresholdForSwitch:](GKSConnectivitySettings, "getThresholdForSwitch:", 2048);
  self->_localSwitches |= (v25 <= v26) << 11;
  v27 = (double)arc4random() / 4294967300.0;
  +[GKSConnectivitySettings getThresholdForSwitch:](GKSConnectivitySettings, "getThresholdForSwitch:", 4096);
  self->_localSwitches |= (v27 <= v28) << 12;
  v29 = (double)arc4random() / 4294967300.0;
  +[GKSConnectivitySettings getThresholdForSwitch:](GKSConnectivitySettings, "getThresholdForSwitch:", 0x2000);
  self->_localSwitches |= (v29 <= v30) << 13;
  v31 = (double)arc4random() / 4294967300.0;
  +[GKSConnectivitySettings getThresholdForSwitch:](GKSConnectivitySettings, "getThresholdForSwitch:", 0x4000);
  self->_localSwitches |= (v31 <= v32) << 14;
  v33 = (double)arc4random() / 4294967300.0;
  +[GKSConnectivitySettings getThresholdForSwitch:](GKSConnectivitySettings, "getThresholdForSwitch:", 0x8000);
  self->_localSwitches |= (v33 <= v34) << 15;
  v35 = (double)arc4random() / 4294967300.0;
  +[GKSConnectivitySettings getThresholdForSwitch:](GKSConnectivitySettings, "getThresholdForSwitch:", 0x10000);
  self->_localSwitches |= (v35 <= v36) << 16;
  v37 = (double)arc4random() / 4294967300.0;
  +[GKSConnectivitySettings getThresholdForSwitch:](GKSConnectivitySettings, "getThresholdForSwitch:", 0x20000);
  self->_localSwitches |= (v37 <= v38) << 17;
  v39 = (double)arc4random() / 4294967300.0;
  +[GKSConnectivitySettings getThresholdForSwitch:](GKSConnectivitySettings, "getThresholdForSwitch:", 0x40000);
  self->_localSwitches |= (v39 <= v40) << 18;
  v41 = (double)arc4random() / 4294967300.0;
  +[GKSConnectivitySettings getThresholdForSwitch:](GKSConnectivitySettings, "getThresholdForSwitch:", 0x80000);
  self->_localSwitches |= (v41 <= v42) << 19;
  v43 = (double)arc4random() / 4294967300.0;
  +[GKSConnectivitySettings getThresholdForSwitch:](GKSConnectivitySettings, "getThresholdForSwitch:", 0x100000);
  self->_localSwitches |= (v43 <= v44) << 20;
  v45 = (double)arc4random() / 4294967300.0;
  +[GKSConnectivitySettings getThresholdForSwitch:](GKSConnectivitySettings, "getThresholdForSwitch:", 0x200000);
  self->_localSwitches |= (v45 <= v46) << 21;
  v47 = (double)arc4random() / 4294967300.0;
  +[GKSConnectivitySettings getThresholdForSwitch:](GKSConnectivitySettings, "getThresholdForSwitch:", 0x400000);
  self->_localSwitches |= (v47 <= v48) << 22;
  v49 = (double)arc4random() / 4294967300.0;
  +[GKSConnectivitySettings getThresholdForSwitch:](GKSConnectivitySettings, "getThresholdForSwitch:", 0x800000);
  self->_localSwitches |= (v49 <= v50) << 23;
  v51 = (double)arc4random() / 4294967300.0;
  +[GKSConnectivitySettings getThresholdForSwitch:](GKSConnectivitySettings, "getThresholdForSwitch:", 0x1000000);
  self->_localSwitches |= (v51 <= v52) << 24;
  v53 = (double)arc4random() / 4294967300.0;
  +[GKSConnectivitySettings getThresholdForSwitch:](GKSConnectivitySettings, "getThresholdForSwitch:", 0x2000000);
  self->_localSwitches |= (v53 <= v54) << 25;
  v55 = (double)arc4random() / 4294967300.0;
  +[GKSConnectivitySettings getThresholdForSwitch:](GKSConnectivitySettings, "getThresholdForSwitch:", 0x4000000);
  self->_localSwitches |= (v55 <= v56) << 26;
  v57 = (double)arc4random() / 4294967300.0;
  +[GKSConnectivitySettings getThresholdForSwitch:](GKSConnectivitySettings, "getThresholdForSwitch:", 0x8000000);
  self->_localSwitches |= (v57 <= v58) << 27;
  v59 = (double)arc4random() / 4294967300.0;
  +[GKSConnectivitySettings getThresholdForSwitch:](GKSConnectivitySettings, "getThresholdForSwitch:", 0x10000000);
  self->_localSwitches |= (v59 <= v60) << 28;
  v61 = (double)arc4random() / 4294967300.0;
  +[GKSConnectivitySettings getThresholdForSwitch:](GKSConnectivitySettings, "getThresholdForSwitch:", 0x20000000);
  self->_localSwitches |= (v61 <= v62) << 29;
  v63 = (double)arc4random() / 4294967300.0;
  +[GKSConnectivitySettings getThresholdForSwitch:](GKSConnectivitySettings, "getThresholdForSwitch:", 0x40000000);
  self->_localSwitches |= (v63 <= v64) << 30;
}

- (void)setupLocalOnOffSwitchesFromMasterSwitch
{
  self->_localSwitches |= +[GKSConnectivitySettings getAbTestMasterLocalSwitches](GKSConnectivitySettings, "getAbTestMasterLocalSwitches") & 0x403800;
}

- (void)setupLocalAudioTestGroupSwitches
{
  void *v3;
  int v4;
  uint64_t v5;
  NSObject *v6;
  int v7;
  uint64_t v8;
  __int16 v9;
  const char *v10;
  __int16 v11;
  int v12;
  __int16 v13;
  int v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v3 = (void *)objc_msgSend(+[GKSConnectivitySettings getTestGroupPermutations:](GKSConnectivitySettings, "getTestGroupPermutations:", 0), "componentsSeparatedByString:", CFSTR(","));
  if (objc_msgSend(v3, "count"))
  {
    v4 = objc_msgSend((id)objc_msgSend(v3, "objectAtIndexedSubscript:", arc4random_uniform(objc_msgSend(v3, "count"))), "unsignedIntValue");
    self->_localSwitches |= (2 * (v4 & 1)) | ((v4 & 2) << 13) | ((v4 & 2) << 14);
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      v5 = VRTraceErrorLogLevelToCSTR();
      v6 = *MEMORY[0x1E0CF2758];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
      {
        v7 = 136315906;
        v8 = v5;
        v9 = 2080;
        v10 = "-[VCSwitchManager setupLocalAudioTestGroupSwitches]";
        v11 = 1024;
        v12 = 163;
        v13 = 1024;
        v14 = v4;
        _os_log_impl(&dword_1D8A54000, v6, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d SwitchManager: selectedAudioTestGroupPermutation: %08X", (uint8_t *)&v7, 0x22u);
      }
    }
  }
}

- (void)setupLocalVideoTestGroupSwitches
{
  void *v3;
  int v4;
  uint64_t v5;
  NSObject *v6;
  int v7;
  uint64_t v8;
  __int16 v9;
  const char *v10;
  __int16 v11;
  int v12;
  __int16 v13;
  int v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v3 = (void *)objc_msgSend(+[GKSConnectivitySettings getTestGroupPermutations:](GKSConnectivitySettings, "getTestGroupPermutations:", 1), "componentsSeparatedByString:", CFSTR(","));
  if (objc_msgSend(v3, "count"))
  {
    v4 = objc_msgSend((id)objc_msgSend(v3, "objectAtIndexedSubscript:", arc4random_uniform(objc_msgSend(v3, "count"))), "unsignedIntValue");
    self->_localSwitches |= (4 * (v4 & 7)) | (v4 << 6) & 0x200;
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      v5 = VRTraceErrorLogLevelToCSTR();
      v6 = *MEMORY[0x1E0CF2758];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
      {
        v7 = 136315906;
        v8 = v5;
        v9 = 2080;
        v10 = "-[VCSwitchManager setupLocalVideoTestGroupSwitches]";
        v11 = 1024;
        v12 = 179;
        v13 = 1024;
        v14 = v4;
        _os_log_impl(&dword_1D8A54000, v6, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d SwitchManager: selectedVideoTestGroupPermutation: %08X", (uint8_t *)&v7, 0x22u);
      }
    }
  }
}

- (void)setupLocalNetworkTestGroupSwitches
{
  void *v3;
  int v4;
  uint64_t v5;
  NSObject *v6;
  int v7;
  uint64_t v8;
  __int16 v9;
  const char *v10;
  __int16 v11;
  int v12;
  __int16 v13;
  int v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v3 = (void *)objc_msgSend(+[GKSConnectivitySettings getTestGroupPermutations:](GKSConnectivitySettings, "getTestGroupPermutations:", 2), "componentsSeparatedByString:", CFSTR(","));
  if (objc_msgSend(v3, "count"))
  {
    v4 = objc_msgSend((id)objc_msgSend(v3, "objectAtIndexedSubscript:", arc4random_uniform(objc_msgSend(v3, "count"))), "unsignedIntValue");
    self->_localSwitches |= v4 & 1;
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      v5 = VRTraceErrorLogLevelToCSTR();
      v6 = *MEMORY[0x1E0CF2758];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
      {
        v7 = 136315906;
        v8 = v5;
        v9 = 2080;
        v10 = "-[VCSwitchManager setupLocalNetworkTestGroupSwitches]";
        v11 = 1024;
        v12 = 192;
        v13 = 1024;
        v14 = v4;
        _os_log_impl(&dword_1D8A54000, v6, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d SwitchManager: selectedNetworkTestGroupPermutation: %08X", (uint8_t *)&v7, 0x22u);
      }
    }
  }
}

- (void)setupLocalRateControlTestGroupSwitches
{
  void *v3;
  int v4;
  uint64_t v5;
  NSObject *v6;
  int v7;
  uint64_t v8;
  __int16 v9;
  const char *v10;
  __int16 v11;
  int v12;
  __int16 v13;
  int v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v3 = (void *)objc_msgSend(+[GKSConnectivitySettings getTestGroupPermutations:](GKSConnectivitySettings, "getTestGroupPermutations:", 3), "componentsSeparatedByString:", CFSTR(","));
  if (objc_msgSend(v3, "count"))
  {
    v4 = objc_msgSend((id)objc_msgSend(v3, "objectAtIndexedSubscript:", arc4random_uniform(objc_msgSend(v3, "count"))), "unsignedIntValue");
    self->_localSwitches |= (v4 & 1) << 10;
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      v5 = VRTraceErrorLogLevelToCSTR();
      v6 = *MEMORY[0x1E0CF2758];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
      {
        v7 = 136315906;
        v8 = v5;
        v9 = 2080;
        v10 = "-[VCSwitchManager setupLocalRateControlTestGroupSwitches]";
        v11 = 1024;
        v12 = 205;
        v13 = 1024;
        v14 = v4;
        _os_log_impl(&dword_1D8A54000, v6, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d SwitchManager: selectedRateControlTestGroupPermutation: %08X", (uint8_t *)&v7, 0x22u);
      }
    }
  }
}

- (void)setupLocalDuplicationTestGroupSwitches
{
  void *v3;
  int v4;
  uint64_t v5;
  NSObject *v6;
  int v7;
  uint64_t v8;
  __int16 v9;
  const char *v10;
  __int16 v11;
  int v12;
  __int16 v13;
  int v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v3 = (void *)objc_msgSend(+[GKSConnectivitySettings getTestGroupPermutations:](GKSConnectivitySettings, "getTestGroupPermutations:", 4), "componentsSeparatedByString:", CFSTR(","));
  if (objc_msgSend(v3, "count"))
  {
    v4 = objc_msgSend((id)objc_msgSend(v3, "objectAtIndexedSubscript:", arc4random_uniform(objc_msgSend(v3, "count"))), "unsignedIntValue");
    self->_localSwitches |= ((v4 & 7) << 6) | (v4 << 13) & 0x10000;
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      v5 = VRTraceErrorLogLevelToCSTR();
      v6 = *MEMORY[0x1E0CF2758];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
      {
        v7 = 136315906;
        v8 = v5;
        v9 = 2080;
        v10 = "-[VCSwitchManager setupLocalDuplicationTestGroupSwitches]";
        v11 = 1024;
        v12 = 221;
        v13 = 1024;
        v14 = v4;
        _os_log_impl(&dword_1D8A54000, v6, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d SwitchManager: selectedDuplicationTestGroupPermutation: %08X", (uint8_t *)&v7, 0x22u);
      }
    }
  }
}

- (void)updateDuplicationEnhancementSwitches
{
  unsigned int localSwitches;
  uint64_t v4;
  NSObject *v5;
  unsigned int v6;
  int v7;
  uint64_t v8;
  __int16 v9;
  const char *v10;
  __int16 v11;
  int v12;
  __int16 v13;
  unsigned int v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  localSwitches = self->_localSwitches;
  if ((localSwitches & 0x2000000) == 0)
    self->_localSwitches = localSwitches & 0xFFFEFF7F;
  if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
  {
    v4 = VRTraceErrorLogLevelToCSTR();
    v5 = *MEMORY[0x1E0CF2758];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
    {
      v6 = self->_localSwitches;
      v7 = 136315906;
      v8 = v4;
      v9 = 2080;
      v10 = "-[VCSwitchManager updateDuplicationEnhancementSwitches]";
      v11 = 1024;
      v12 = 236;
      v13 = 1024;
      v14 = v6;
      _os_log_impl(&dword_1D8A54000, v5, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d SwitchManager: updateDuplicationEnhancementSwitches updates local switches to: %08X", (uint8_t *)&v7, 0x22u);
    }
  }
}

- (void)negotiateSwitches
{
  self->_negotiatedSwitches = self->_remoteSwitches & 0x6C1E0351 | self->_localSwitches & 0x13E1FCAE;
}

- (void)negotiateSwitchesForIsCaller:(BOOL)a3
{
  uint64_t localSwitches;

  localSwitches = self->_localSwitches;
  if (!a3)
    localSwitches = self->_remoteSwitches;
  self->_negotiatedSwitches = -[VCSwitchManager applyNegotiationRulesUsingLocalSwitches:negotiatedSwitches:](self, "applyNegotiationRulesUsingLocalSwitches:negotiatedSwitches:", self->_localSwitches, localSwitches);
}

- (void)setRemoteSwitches:(unsigned int)a3 isCaller:(BOOL)a4
{
  _BOOL4 v4;
  uint64_t localSwitches;

  v4 = a4;
  localSwitches = *(_QWORD *)&a3;
  if (v4)
    localSwitches = self->_localSwitches;
  self->_remoteSwitches = -[VCSwitchManager applyNegotiationRulesUsingLocalSwitches:negotiatedSwitches:](self, "applyNegotiationRulesUsingLocalSwitches:negotiatedSwitches:", *(_QWORD *)&a3, localSwitches);
}

- (BOOL)isSwitchEnabled:(unsigned int)a3
{
  return (self->_negotiatedSwitches & a3) != 0;
}

- (BOOL)isLocalSwitchEnabled:(unsigned int)a3
{
  return (self->_localSwitches & a3) != 0;
}

- (unsigned)applyNegotiationRulesUsingLocalSwitches:(unsigned int)a3 negotiatedSwitches:(unsigned int)a4
{
  return a4 & 0x6C1E0351 | a3 & 0x13E1FCAE;
}

- (id)description
{
  objc_class *v3;
  NSString *v4;
  unsigned int negotiatedSwitches;
  void *v7;

  v7 = (void *)MEMORY[0x1E0CB3940];
  v3 = (objc_class *)objc_opt_class();
  v4 = NSStringFromClass(v3);
  negotiatedSwitches = self->_negotiatedSwitches;
  return (id)objc_msgSend(v7, "stringWithFormat:", CFSTR("%@[%p] LocalSwitches[%08X] RemoteSwitches[%08X] NegotiatedSwitches[%08X] preferRelayOverP2P[%d] alwaysOnAudioRedundancy[%d] highFec[%d] lowFpsVideo[%d] vplrFec[%d] fastMediaDuplication[%d] iRATRtp[%d] preWarmCell[%d] duplicateImportantPkts[%d] allowBurstyLossRampDown[%d] hevcWifiTiers[%d] viewpointCorrection[%d] heifHevcLivePhotos[%d] wifiLowTierRedundancy[%d] cellularLowTierRedundancy[%d] iRATMetrics[%d] fecHeaderV1[%d] updatedAFRCHeader[%d] secureMessaging[%d] disableSIP[%d] wifiAssistDuplication[%d] wifiAssistBudgetStatus[%d] wifiAssistStatusBar[%d] lowNetworkMode[%d] duplicationEnhancement[%d] videoJB[%d] iRATDuplication[%d], wrmRSSIThreshold[%d] mediaDrivenDuplication[%d] UseVideoJitterForVideoPlayoutEnabled[%d] UseRTTForFIRThrottlingEnabled[%d]"), v4, self, self->_localSwitches, self->_remoteSwitches, negotiatedSwitches, negotiatedSwitches & 1, (negotiatedSwitches >> 1) & 1, (negotiatedSwitches >> 2) & 1, (negotiatedSwitches >> 3) & 1, (negotiatedSwitches >> 4) & 1, (negotiatedSwitches >> 6) & 1, (negotiatedSwitches >> 7) & 1, (negotiatedSwitches >> 8) & 1, (negotiatedSwitches >> 9) & 1, (negotiatedSwitches >> 10) & 1, (negotiatedSwitches >> 11) & 1,
               (negotiatedSwitches >> 12) & 1,
               (negotiatedSwitches >> 13) & 1,
               (negotiatedSwitches >> 14) & 1,
               (negotiatedSwitches >> 15) & 1,
               HIWORD(negotiatedSwitches) & 1,
               (negotiatedSwitches >> 17) & 1,
               (negotiatedSwitches >> 18) & 1,
               (negotiatedSwitches >> 19) & 1,
               (negotiatedSwitches >> 20) & 1,
               (negotiatedSwitches >> 21) & 1,
               (negotiatedSwitches >> 22) & 1,
               (negotiatedSwitches >> 23) & 1,
               HIBYTE(negotiatedSwitches) & 1,
               (negotiatedSwitches >> 25) & 1,
               (negotiatedSwitches >> 26) & 1,
               (negotiatedSwitches >> 27) & 1,
               (negotiatedSwitches >> 28) & 1,
               (negotiatedSwitches >> 29) & 1,
               (negotiatedSwitches >> 5) & 1,
               (negotiatedSwitches >> 30) & 1);
}

- (unsigned)localSwitches
{
  return self->_localSwitches;
}

- (void)setLocalSwitches:(unsigned int)a3
{
  self->_localSwitches = a3;
}

- (unsigned)remoteSwitches
{
  return self->_remoteSwitches;
}

- (void)setRemoteSwitches:(unsigned int)a3
{
  self->_remoteSwitches = a3;
}

- (unsigned)negotiatedSwitches
{
  return self->_negotiatedSwitches;
}

- (void)setNegotiatedSwitches:(unsigned int)a3
{
  self->_negotiatedSwitches = a3;
}

@end
