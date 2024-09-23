@implementation VCConnectionManagerIDS

- (void)setUpVTable
{
  self->super._vTable.copyConnection = _VCConnectionManagerIDS_CopyConnection;
  self->super._vTable.updateConnectionForDuplication = _VCConnectionManagerIDS_UpdateConnectionForDuplication;
  self->super._vTable.synchronizeParticipantGenerationCounter = _VCConnectionManagerIDS_SynchronizeParticipantGenerationCounter;
  self->super._vTable.isSourceOnCellularIPv6 = _VCConnectionManagerIDS_IsSourceOnCellularIPv6;
  self->super._vTable.copyPrimaryConnection = _VCConnectionManagerIDS_CopyPrimaryConnection;
  self->super._vTable.setPrimaryConnection = _VCConnectionManagerIDS_SetPrimaryConnection;
  self->super._vTable.updatePacketAndByteCount = _VCConnectionManagerIDS_UpdatePacketAndByteCount;
  self->super._vTable.updatePersistentPacketCounts = _VCConnectionManagerIDS_UpdatePersistentPacketCounts;
  self->super._vTable.addLinkProbingTelemetry = _VCConnectionManagerIDS_AddLinkProbingTelemetry_0;
}

- (VCConnectionManagerIDS)initWithMultiwayEnabled:(BOOL)a3
{
  VCConnectionManagerIDS *v4;
  _BOOL4 v5;
  uint64_t v6;
  NSObject *v7;
  _BOOL4 enableCoreMotionDetection;
  _BOOL4 enableMotionBasedDuplication;
  objc_super v11;
  uint8_t buf[4];
  uint64_t v13;
  __int16 v14;
  const char *v15;
  __int16 v16;
  int v17;
  __int16 v18;
  _BOOL4 v19;
  __int16 v20;
  _BOOL4 v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v11.receiver = self;
  v11.super_class = (Class)VCConnectionManagerIDS;
  v4 = -[VCConnectionManager init](&v11, sel_init);
  if (v4)
  {
    v4->super._statsRecorder = objc_alloc_init(VCStatsRecorder);
    v4->_multiwayBitrateArbiter = objc_alloc_init(VCSessionBitrateArbiter);
    v4->_oneToOneBitrateArbiter = -[VCBitrateArbiter initWithDeviceRole:callLogFile:]([VCBitrateArbiter alloc], "initWithDeviceRole:callLogFile:", 0, 0);
    v4->_isMultiwaySession = a3;
    v4->super._connectionSelector = -[VCConnectionSelector initWithMultiwayEnabled:]([VCConnectionSelector alloc], "initWithMultiwayEnabled:", v4->_isMultiwaySession);
    v5 = +[GKSConnectivitySettings isFeatureEnabledForStorebagKey:userDefaultKey:featureFlagDomain:featureFlagName:](GKSConnectivitySettings, "isFeatureEnabledForStorebagKey:userDefaultKey:featureFlagDomain:featureFlagName:", CFSTR("vc-core-motion-detection-enabled"), CFSTR("coreMotionDetectionEnabled"), "AVConference", "UseCoreMotionDetection");
    v4->_enableCoreMotionDetection = v5;
    if (v5)
      v4->super._coreMotionManager = -[VCCoreMotionManager initWithDelegate:]([VCCoreMotionManager alloc], "initWithDelegate:", v4);
    v4->super._enableMotionBasedDuplication = +[GKSConnectivitySettings isFeatureEnabledForStorebagKey:userDefaultKey:featureFlagDomain:featureFlagName:](GKSConnectivitySettings, "isFeatureEnabledForStorebagKey:userDefaultKey:featureFlagDomain:featureFlagName:", CFSTR("vc-motion-based-duplication-enabled"), CFSTR("motionBasedDuplicationEnabled"), "AVConference", "EnableMotionBasedDuplication");
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      v6 = VRTraceErrorLogLevelToCSTR();
      v7 = *MEMORY[0x1E0CF2758];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
      {
        enableCoreMotionDetection = v4->_enableCoreMotionDetection;
        enableMotionBasedDuplication = v4->super._enableMotionBasedDuplication;
        *(_DWORD *)buf = 136316162;
        v13 = v6;
        v14 = 2080;
        v15 = "-[VCConnectionManagerIDS initWithMultiwayEnabled:]";
        v16 = 1024;
        v17 = 76;
        v18 = 1024;
        v19 = enableCoreMotionDetection;
        v20 = 1024;
        v21 = enableMotionBasedDuplication;
        _os_log_impl(&dword_1D8A54000, v7, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d enableCoreMotionDetection=%d enableMotionBasedDuplication=%d", buf, 0x28u);
      }
    }
    v4->super._isRTXSupported = 1;
  }
  return v4;
}

- (void)dealloc
{
  objc_super v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];

  v3.receiver = self;
  v3.super_class = (Class)VCConnectionManagerIDS;
  -[VCConnectionManager dealloc](&v3, sel_dealloc);
}

- (void)reportActiveConnectionOneToOne:(id)a3 isAudioOnly:(BOOL)a4
{
  unsigned int v6;
  unsigned int v7;
  unsigned int v8;
  _QWORD v9[3];
  _QWORD v10[4];

  v10[3] = *MEMORY[0x1E0C80C00];
  if (a4)
  {
    v6 = -[VCBitrateArbiter maxAllowedAudioOnlyBitrateForConnection:](self->_oneToOneBitrateArbiter, "maxAllowedAudioOnlyBitrateForConnection:", objc_msgSend(a3, "localConnectionType"));
    v7 = -[VCBitrateArbiter maxAllowedAudioOnlyBitrateForConnection:](self->_oneToOneBitrateArbiter, "maxAllowedAudioOnlyBitrateForConnection:", objc_msgSend(a3, "remoteConnectionType"));
  }
  else
  {
    v6 = -[VCBitrateArbiter maxAllowedBitrateForVCConnection:forLocalInterface:](self->_oneToOneBitrateArbiter, "maxAllowedBitrateForVCConnection:forLocalInterface:", a3, 1);
    v7 = -[VCBitrateArbiter maxAllowedBitrateForVCConnection:forLocalInterface:](self->_oneToOneBitrateArbiter, "maxAllowedBitrateForVCConnection:forLocalInterface:", a3, 0);
  }
  v8 = v7;
  v9[0] = CFSTR("localBitrateCap");
  v10[0] = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", 1000 * v6);
  v9[1] = CFSTR("remoteBitrateCap");
  v10[1] = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", 1000 * v8);
  v9[2] = CFSTR("connectionDataMode");
  v10[2] = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedChar:", VCConnection_GetDataMode((uint64_t)a3));
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v10, v9, 3);
  reportingGenericEvent();
}

- (void)reportFirstActiveConnectionOneToOne:(id)a3 remoteOSVersion:(id)a4 redState:(BOOL)a5 isAudioOnly:(BOOL)a6
{
  _BOOL8 v6;
  unsigned int v10;
  unsigned int v11;
  unsigned int v12;
  uint64_t v13;
  const __CFString *v14;
  _QWORD v15[5];
  _QWORD v16[6];

  v6 = a5;
  v16[5] = *MEMORY[0x1E0C80C00];
  if (a6)
  {
    v10 = -[VCBitrateArbiter maxAllowedAudioOnlyBitrateForConnection:](self->_oneToOneBitrateArbiter, "maxAllowedAudioOnlyBitrateForConnection:", objc_msgSend(a3, "localConnectionType"));
    v11 = -[VCBitrateArbiter maxAllowedAudioOnlyBitrateForConnection:](self->_oneToOneBitrateArbiter, "maxAllowedAudioOnlyBitrateForConnection:", objc_msgSend(a3, "remoteConnectionType"));
  }
  else
  {
    v10 = -[VCBitrateArbiter maxAllowedBitrateForVCConnection:forLocalInterface:](self->_oneToOneBitrateArbiter, "maxAllowedBitrateForVCConnection:forLocalInterface:", a3, 1);
    v11 = -[VCBitrateArbiter maxAllowedBitrateForVCConnection:forLocalInterface:](self->_oneToOneBitrateArbiter, "maxAllowedBitrateForVCConnection:forLocalInterface:", a3, 0);
  }
  v12 = v11;
  v15[0] = CFSTR("RedState");
  v16[0] = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v6);
  v15[1] = CFSTR("WAState");
  v13 = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedChar:", -[VCWifiAssistManager wifiAssistState](+[VCWifiAssistManager sharedInstance](VCWifiAssistManager, "sharedInstance"), "wifiAssistState"));
  v14 = CFSTR("unknown");
  if (a4)
    v14 = (const __CFString *)a4;
  v16[1] = v13;
  v16[2] = v14;
  v15[2] = CFSTR("REMBUILD");
  v15[3] = CFSTR("localBitrateCap");
  v16[3] = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", 1000 * v10);
  v15[4] = CFSTR("remoteBitrateCap");
  v16[4] = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", 1000 * v12);
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v16, v15, 5);
  reportingGenericEvent();
}

- (unsigned)uplinkAudioOnlyBitrateCapOneToOne:(id)a3
{
  unsigned int v5;
  unsigned int v6;
  unsigned int v7;

  v5 = -[VCBitrateArbiter maxAllowedAudioOnlyBitrateForConnection:](self->_oneToOneBitrateArbiter, "maxAllowedAudioOnlyBitrateForConnection:", objc_msgSend(a3, "localConnectionType"));
  v6 = -[VCBitrateArbiter maxAllowedAudioOnlyBitrateForConnection:](self->_oneToOneBitrateArbiter, "maxAllowedAudioOnlyBitrateForConnection:", objc_msgSend(a3, "remoteConnectionType"));
  if (v6)
    v7 = v6;
  else
    v7 = 40;
  if (v5 < v7)
    v7 = v5;
  return 1000 * v7;
}

- (unsigned)uplinkBitrateCapOneToOne:(id)a3
{
  unsigned int v5;
  unsigned int v6;
  unsigned int v7;
  unsigned int v8;
  unsigned int v9;
  unsigned int v10;

  v5 = -[VCBitrateArbiter maxAllowedBitrateForVCConnection:forLocalInterface:](self->_oneToOneBitrateArbiter, "maxAllowedBitrateForVCConnection:forLocalInterface:", a3, 1);
  v6 = -[VCBitrateArbiter maxAllowedBitrateForVCConnection:forLocalInterface:](self->_oneToOneBitrateArbiter, "maxAllowedBitrateForVCConnection:forLocalInterface:", a3, 0);
  if (v6)
    v7 = v6;
  else
    v7 = 100;
  if (v5 < v7)
    v7 = v5;
  v8 = 1000 * v7;
  v9 = 1000
     * -[VCConnectionManagerIDS oneToOneBitrateCapForConnectionWithType:](self, "oneToOneBitrateCapForConnectionWithType:", objc_msgSend(a3, "type"));
  if (v8 >= v9)
    v10 = v9;
  else
    v10 = v8;
  if (v9)
    return v10;
  else
    return v8;
}

- (unsigned)oneToOneBitrateCapForConnectionWithType:(unsigned int)a3
{
  unsigned int v4;
  unsigned int v5;
  uint64_t v6;
  NSObject *v7;
  const char *v8;
  uint64_t v9;
  int v11;
  uint64_t v12;
  __int16 v13;
  const char *v14;
  __int16 v15;
  int v16;
  __int16 v17;
  unsigned int v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  if (a3 - 3 > 1)
    return 0;
  v4 = -[VCBitrateArbiter maxAllowedBitrateTCPRelay](self->_oneToOneBitrateArbiter, "maxAllowedBitrateTCPRelay");
  if (v4)
  {
    v5 = v4;
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      v6 = VRTraceErrorLogLevelToCSTR();
      v7 = *MEMORY[0x1E0CF2758];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
      {
        v11 = 136315906;
        v12 = v6;
        v13 = 2080;
        v14 = "-[VCConnectionManagerIDS oneToOneBitrateCapForConnectionWithType:]";
        v15 = 1024;
        v16 = 149;
        v17 = 1024;
        v18 = v5;
        v8 = " [%s] %s:%d TCP connectionLimitedBitrate=%u";
LABEL_10:
        _os_log_impl(&dword_1D8A54000, v7, OS_LOG_TYPE_DEFAULT, v8, (uint8_t *)&v11, 0x22u);
      }
    }
  }
  else
  {
    v5 = -[VCBitrateArbiter maxAllowedBitrateWifi](self->_oneToOneBitrateArbiter, "maxAllowedBitrateWifi");
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      v9 = VRTraceErrorLogLevelToCSTR();
      v7 = *MEMORY[0x1E0CF2758];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
      {
        v11 = 136315906;
        v12 = v9;
        v13 = 2080;
        v14 = "-[VCConnectionManagerIDS oneToOneBitrateCapForConnectionWithType:]";
        v15 = 1024;
        v16 = 152;
        v17 = 1024;
        v18 = v5;
        v8 = " [%s] %s:%d Use general wifi relay connectionLimitedBitrate=%u for TCP";
        goto LABEL_10;
      }
    }
  }
  return v5;
}

- (void)applyConstrainWithThreshold:(id)a3 inBandwidth:(unsigned int *)a4 thredshold:(unsigned int)a5
{
  uint64_t v8;
  NSObject *v9;
  unsigned int v10;
  const __CFString *v11;
  uint64_t v12;
  NSObject *v13;
  const char *v14;
  NSObject *v15;
  uint32_t v16;
  uint64_t v17;
  NSObject *v18;
  int v19;
  uint64_t v20;
  __int16 v21;
  const char *v22;
  __int16 v23;
  int v24;
  __int16 v25;
  _BYTE v26[10];
  VCConnectionManagerIDS *v27;
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  if (!a4)
  {
    if ((VCConnectionManagerIDS *)objc_opt_class() == self)
    {
      if ((int)VRTraceGetErrorLogLevelForModule() < 5)
        return;
      v12 = VRTraceErrorLogLevelToCSTR();
      v13 = *MEMORY[0x1E0CF2758];
      if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
        return;
      v19 = 136315650;
      v20 = v12;
      v21 = 2080;
      v22 = "-[VCConnectionManagerIDS applyConstrainWithThreshold:inBandwidth:thredshold:]";
      v23 = 1024;
      v24 = 162;
      v14 = " [%s] %s:%d inBandwidth is null";
      v15 = v13;
      v16 = 28;
    }
    else
    {
      if ((objc_opt_respondsToSelector() & 1) != 0)
        v11 = (const __CFString *)-[VCConnectionManagerIDS performSelector:](self, "performSelector:", sel_logPrefix);
      else
        v11 = &stru_1E9E58EE0;
      if ((int)VRTraceGetErrorLogLevelForModule() < 5)
        return;
      v17 = VRTraceErrorLogLevelToCSTR();
      v18 = *MEMORY[0x1E0CF2758];
      if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
        return;
      v19 = 136316162;
      v20 = v17;
      v21 = 2080;
      v22 = "-[VCConnectionManagerIDS applyConstrainWithThreshold:inBandwidth:thredshold:]";
      v23 = 1024;
      v24 = 162;
      v25 = 2112;
      *(_QWORD *)v26 = v11;
      *(_WORD *)&v26[8] = 2048;
      v27 = self;
      v14 = " [%s] %s:%d %@(%p) inBandwidth is null";
      v15 = v18;
      v16 = 48;
    }
    _os_log_impl(&dword_1D8A54000, v15, OS_LOG_TYPE_DEFAULT, v14, (uint8_t *)&v19, v16);
    return;
  }
  if (-[VCConnectionManager shouldLimitMultiwayBandwidthWhenConstrained](self, "shouldLimitMultiwayBandwidthWhenConstrained", a3)&& *a4 > a5)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      v8 = VRTraceErrorLogLevelToCSTR();
      v9 = *MEMORY[0x1E0CF2758];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
      {
        v10 = *a4;
        v19 = 136316162;
        v20 = v8;
        v21 = 2080;
        v22 = "-[VCConnectionManagerIDS applyConstrainWithThreshold:inBandwidth:thredshold:]";
        v23 = 1024;
        v24 = 164;
        v25 = 1024;
        *(_DWORD *)v26 = v10;
        *(_WORD *)&v26[4] = 1024;
        *(_DWORD *)&v26[6] = a5;
        _os_log_impl(&dword_1D8A54000, v9, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d isConstrained, limit from inBandwidth=%u to threshold=%u", (uint8_t *)&v19, 0x28u);
      }
    }
    *a4 = a5;
  }
}

- (unsigned)uplinkBitrateCapForConnection:(id)a3
{
  unsigned int v5;
  unsigned int v6;
  int IsLocalExpensive;
  VCSessionBitrateArbiter *multiwayBitrateArbiter;
  unsigned int v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v10 = 0;
  switch(objc_msgSend(a3, "localConnectionType"))
  {
    case 0xFFFFFFFF:
    case 3u:
    case 4u:
    case 5u:
    case 7u:
      v5 = -[VCSessionBitrateArbiter maxBitrateWiFiUplink](self->_multiwayBitrateArbiter, "maxBitrateWiFiUplink");
      goto LABEL_3;
    case 0u:
      v5 = -[VCSessionBitrateArbiter maxBitrate2GUplink](self->_multiwayBitrateArbiter, "maxBitrate2GUplink");
      goto LABEL_3;
    case 1u:
      v5 = -[VCSessionBitrateArbiter maxBitrate3GUplink](self->_multiwayBitrateArbiter, "maxBitrate3GUplink");
      goto LABEL_3;
    case 2u:
    case 6u:
      IsLocalExpensive = VCConnection_IsLocalExpensive((uint64_t)a3);
      multiwayBitrateArbiter = self->_multiwayBitrateArbiter;
      if (IsLocalExpensive)
        v5 = -[VCSessionBitrateArbiter maxBitrateExpensiveUplink](multiwayBitrateArbiter, "maxBitrateExpensiveUplink");
      else
        v5 = -[VCSessionBitrateArbiter maxBitrateNonExpensiveUplink](multiwayBitrateArbiter, "maxBitrateNonExpensiveUplink");
LABEL_3:
      v6 = v5;
      v10 = v5;
      break;
    default:
      v6 = 0;
      break;
  }
  if (VCConnection_IsLocalConstrained((uint64_t)a3))
  {
    -[VCConnectionManagerIDS applyConstrainWithThreshold:inBandwidth:thredshold:](self, "applyConstrainWithThreshold:inBandwidth:thredshold:", a3, &v10, -[VCSessionBitrateArbiter maxBitrateExpensiveUplink](self->_multiwayBitrateArbiter, "maxBitrateExpensiveUplink"));
    return v10;
  }
  return v6;
}

- (unsigned)downlinkBitrateCapForConnection:(id)a3
{
  unsigned int v5;
  unsigned int v6;
  int IsLocalExpensive;
  VCSessionBitrateArbiter *multiwayBitrateArbiter;
  unsigned int v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v10 = 0;
  switch(objc_msgSend(a3, "localConnectionType"))
  {
    case 0xFFFFFFFF:
    case 3u:
    case 4u:
    case 5u:
    case 7u:
      v5 = -[VCSessionBitrateArbiter maxBitrateWiFiDownlink](self->_multiwayBitrateArbiter, "maxBitrateWiFiDownlink");
      goto LABEL_3;
    case 0u:
      v5 = -[VCSessionBitrateArbiter maxBitrate2GDownlink](self->_multiwayBitrateArbiter, "maxBitrate2GDownlink");
      goto LABEL_3;
    case 1u:
      v5 = -[VCSessionBitrateArbiter maxBitrate3GDownlink](self->_multiwayBitrateArbiter, "maxBitrate3GDownlink");
      goto LABEL_3;
    case 2u:
    case 6u:
      IsLocalExpensive = VCConnection_IsLocalExpensive((uint64_t)a3);
      multiwayBitrateArbiter = self->_multiwayBitrateArbiter;
      if (IsLocalExpensive)
        v5 = -[VCSessionBitrateArbiter maxBitrateExpensiveDownlink](multiwayBitrateArbiter, "maxBitrateExpensiveDownlink");
      else
        v5 = -[VCSessionBitrateArbiter maxBitrateNonExpensiveDownlink](multiwayBitrateArbiter, "maxBitrateNonExpensiveDownlink");
LABEL_3:
      v6 = v5;
      v10 = v5;
      break;
    default:
      v6 = 0;
      break;
  }
  if (VCConnection_IsLocalConstrained((uint64_t)a3))
  {
    -[VCConnectionManagerIDS applyConstrainWithThreshold:inBandwidth:thredshold:](self, "applyConstrainWithThreshold:inBandwidth:thredshold:", a3, &v10, -[VCSessionBitrateArbiter maxBitrateExpensiveDownlink](self->_multiwayBitrateArbiter, "maxBitrateExpensiveDownlink"));
    return v10;
  }
  return v6;
}

- (int)addConnection:(id)a3
{
  _opaque_pthread_rwlock_t *p_stateRWlock;
  id v6;
  _BOOL8 v7;
  int v8;
  BOOL v9;
  id v10;
  _BOOL4 isInitialConnectionEstablished;
  NSObject *delegateQueue;
  void *v13;
  int v14;
  uint64_t v15;
  NSObject *v16;
  const char *v17;
  int ErrorLogLevelForModule;
  os_log_t *v19;
  uint64_t v20;
  NSObject *v21;
  uint64_t v22;
  NSObject *v23;
  NSMutableArray *v24;
  const char *v25;
  const char *v26;
  uint64_t v27;
  NSObject *v28;
  int IsLocalOnCellular;
  NSObject *v30;
  uint64_t v31;
  NSObject *v32;
  NSMutableArray *connectionArray;
  const char *v34;
  uint64_t v35;
  const char *v37;
  uint64_t v38;
  const char *v39;
  _QWORD v40[6];
  BOOL v41;
  _QWORD block[5];
  _QWORD v43[6];
  uint8_t buf[4];
  uint64_t v45;
  __int16 v46;
  const char *v47;
  __int16 v48;
  int v49;
  __int16 v50;
  uint64_t v51;
  __int16 v52;
  uint64_t v53;
  __int16 v54;
  const char *v55;
  __int16 v56;
  const char *v57;
  uint64_t v58;

  v58 = *MEMORY[0x1E0C80C00];
  if (a3)
  {
    p_stateRWlock = &self->super._stateRWlock;
    pthread_rwlock_wrlock(&self->super._stateRWlock);
    if (-[VCConnectionManagerIDS addConnectionToConnectionArray:](self, "addConnectionToConnectionArray:", a3))
    {
      -[VCConnectionManagerIDS updateAllBitrateCapsForConnectionInternal:](self, "updateAllBitrateCapsForConnectionInternal:", a3);
      v6 = -[VCConnectionManagerIDS lastPrimaryConnectionInUse](self, "lastPrimaryConnectionInUse");
      v7 = !self->_isMultiwaySession || -[VCConnectionManager isOneToOneModeEnabled](self, "isOneToOneModeEnabled");
      v9 = -[VCConnectionSelector selectPrimaryAndSecondaryWithConnection:isEndToEnd:](self->super._connectionSelector, "selectPrimaryAndSecondaryWithConnection:isEndToEnd:", a3, v7);
      VCConnectionManager_UpdateConnectionForDuplication((uint64_t)self);
      if (-[VCConnectionManagerIDS shouldUpdateServerBasedConnection:](self, "shouldUpdateServerBasedConnection:", a3))
      {
        -[VCConnectionSelector updateSelectedConnectionsForGroupType:connectionAdded:](self->super._connectionSelector, "updateSelectedConnectionsForGroupType:connectionAdded:", 0, a3);
        if (self->_optIntoExistingSubscribedStreams)
          -[VCConnectionManagerDelegate optIntoExistingSubscribedStreamsForConnection:](-[VCConnectionManager delegate](self, "delegate"), "optIntoExistingSubscribedStreamsForConnection:", a3);
        v10 = -[VCConnectionSelector connectionForGroupType:isPrimary:](self->super._connectionSelector, "connectionForGroupType:isPrimary:", 0, 1);
        if (v10)
          -[VCLinkProbingHandler setQRLinkID:](self->super._linkProbingHandler, "setQRLinkID:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedChar:", VCConnectionIDS_LinkID((uint64_t)v10)));
      }
      if (v9)
      {
        isInitialConnectionEstablished = self->super._isInitialConnectionEstablished;
        if (self->super._isInitialConnectionEstablished
          && -[NSMutableArray count](self->super._connectionArray, "count") == 1
          && -[VCConnectionManager isOneToOneModeEnabled](self, "isOneToOneModeEnabled"))
        {
          delegateQueue = self->super._delegateQueue;
          block[0] = MEMORY[0x1E0C809B0];
          block[1] = 3221225472;
          block[2] = __40__VCConnectionManagerIDS_addConnection___block_invoke_2;
          block[3] = &unk_1E9E521C0;
          block[4] = self;
          dispatch_async(delegateQueue, block);
        }
        v13 = (void *)VCConnectionManager_CopyPrimaryConnection((uint64_t)self);
        v14 = VCConnection_Priority((uint64_t)a3);
        if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
        {
          v15 = VRTraceErrorLogLevelToCSTR();
          v16 = *MEMORY[0x1E0CF2758];
          if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
          {
            v17 = "SECONDARY";
            if (v14 == 2)
              v17 = "PRIMARY";
            v39 = v17;
            v38 = objc_msgSend((id)objc_msgSend(a3, "description"), "UTF8String");
            if (v13)
              v37 = (const char *)objc_msgSend((id)objc_msgSend(v13, "description"), "UTF8String");
            else
              v37 = "<nil>";
            if (-[VCConnectionManagerIDS secondaryConnection](self, "secondaryConnection"))
              v26 = (const char *)objc_msgSend((id)objc_msgSend(-[VCConnectionManagerIDS secondaryConnection](self, "secondaryConnection"), "description"), "UTF8String");
            else
              v26 = "<nil>";
            *(_DWORD *)buf = 136316674;
            v45 = v15;
            v46 = 2080;
            v47 = "-[VCConnectionManagerIDS addConnection:]";
            v48 = 1024;
            v49 = 288;
            v50 = 2080;
            v51 = (uint64_t)v39;
            v52 = 2080;
            v53 = v38;
            v54 = 2080;
            v55 = v37;
            v56 = 2080;
            v57 = v26;
            _os_log_impl(&dword_1D8A54000, v16, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d HandoverReport: add result %s IDS connection %s. Primary: %s, secondary: %s", buf, 0x44u);
          }
        }
        if (v13)
          CFRelease(v13);
        -[VCConnectionManager checkpointPrimaryConnection:](self, "checkpointPrimaryConnection:", a3);
        if (v14 == 2)
        {
          if (v6)
          {
            -[VCConnectionManager primaryConnectionChanged:oldPrimaryConnection:](self, "primaryConnectionChanged:oldPrimaryConnection:", a3, v6);
          }
          else
          {
            -[VCConnectionManager configureNWConnectionMonitor:](self, "configureNWConnectionMonitor:", a3);
            IsLocalOnCellular = VCConnection_IsLocalOnCellular((uint64_t)a3);
            self->super._isPrimaryLocalUsingCell = IsLocalOnCellular;
            VCConnectionManager_UseCellPrimaryInterface((uint64_t)self, IsLocalOnCellular);
          }
        }
        v30 = self->super._delegateQueue;
        v40[0] = MEMORY[0x1E0C809B0];
        v40[1] = 3221225472;
        v40[2] = __40__VCConnectionManagerIDS_addConnection___block_invoke_39;
        v40[3] = &unk_1E9E52210;
        v40[4] = self;
        v40[5] = a3;
        v41 = !isInitialConnectionEstablished;
        dispatch_async(v30, v40);
        if (!self->super._isInitialConnectionEstablished)
          self->super._isInitialConnectionEstablished = 1;
        if (self->super._duplicationPending
          && (int)VCConnectionManager_GetNumberOfConnectionsInternal((uint64_t (**)(void))self) >= 2)
        {
          VCConnectionManager_SetDuplicationEnabledInternal((uint64_t)self, 1);
        }

        -[VCConnectionManagerIDS reportConnection:isInitialConnection:](self, "reportConnection:isInitialConnection:", a3, !isInitialConnectionEstablished);
        -[VCConnectionManager reportConnectionUpdateWithRespCode:](self, "reportConnectionUpdateWithRespCode:", 0);
        if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
        {
          v31 = VRTraceErrorLogLevelToCSTR();
          v32 = *MEMORY[0x1E0CF2758];
          if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
          {
            connectionArray = self->super._connectionArray;
            if (connectionArray)
            {
              v34 = (const char *)objc_msgSend((id)-[NSMutableArray description](connectionArray, "description"), "UTF8String");
              connectionArray = self->super._connectionArray;
            }
            else
            {
              v34 = "<nil>";
            }
            v35 = -[NSMutableArray count](connectionArray, "count");
            *(_DWORD *)buf = 136316162;
            v45 = v31;
            v46 = 2080;
            v47 = "-[VCConnectionManagerIDS addConnection:]";
            v48 = 1024;
            v49 = 322;
            v50 = 2080;
            v51 = (uint64_t)v34;
            v52 = 2048;
            v53 = v35;
            _os_log_impl(&dword_1D8A54000, v32, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d HandoverReport: connection array %s has %lu connections", buf, 0x30u);
          }
        }
      }
      else
      {
        VCConnection_SetPriority((uint64_t)a3, -1);

        ErrorLogLevelForModule = VRTraceGetErrorLogLevelForModule();
        v19 = (os_log_t *)MEMORY[0x1E0CF2758];
        if (ErrorLogLevelForModule >= 6)
        {
          v20 = VRTraceErrorLogLevelToCSTR();
          v21 = *v19;
          if (os_log_type_enabled(*v19, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 136315906;
            v45 = v20;
            v46 = 2080;
            v47 = "-[VCConnectionManagerIDS addConnection:]";
            v48 = 1024;
            v49 = 263;
            v50 = 2080;
            v51 = objc_msgSend((id)objc_msgSend(a3, "description"), "UTF8String");
            _os_log_impl(&dword_1D8A54000, v21, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d HandoverReport: add result backup IDS connection %s", buf, 0x26u);
          }
        }
        if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
        {
          v22 = VRTraceErrorLogLevelToCSTR();
          v23 = *v19;
          if (os_log_type_enabled(*v19, OS_LOG_TYPE_DEFAULT))
          {
            v24 = self->super._connectionArray;
            if (v24)
            {
              v25 = (const char *)objc_msgSend((id)-[NSMutableArray description](v24, "description"), "UTF8String");
              v24 = self->super._connectionArray;
            }
            else
            {
              v25 = "<nil>";
            }
            v27 = -[NSMutableArray count](v24, "count");
            *(_DWORD *)buf = 136316162;
            v45 = v22;
            v46 = 2080;
            v47 = "-[VCConnectionManagerIDS addConnection:]";
            v48 = 1024;
            v49 = 264;
            v50 = 2080;
            v51 = (uint64_t)v25;
            v52 = 2048;
            v53 = v27;
            _os_log_impl(&dword_1D8A54000, v23, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d HandoverReport: connection array %s has %lu connections", buf, 0x30u);
          }
        }
        if (-[VCConnectionManagerIDS canOptOutAllStreamsForConnection:](self, "canOptOutAllStreamsForConnection:", a3))
        {
          v28 = self->super._delegateQueue;
          v43[0] = MEMORY[0x1E0C809B0];
          v43[1] = 3221225472;
          v43[2] = __40__VCConnectionManagerIDS_addConnection___block_invoke;
          v43[3] = &unk_1E9E52238;
          v43[4] = self;
          v43[5] = a3;
          dispatch_async(v28, v43);
        }
        -[VCConnectionManager reportConnectionUpdateWithRespCode:](self, "reportConnectionUpdateWithRespCode:", 0);
      }
    }
    pthread_rwlock_unlock(p_stateRWlock);
    return 0;
  }
  else
  {
    v8 = -2144796671;
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
        -[VCConnectionManagerIDS addConnection:].cold.1();
    }
  }
  return v8;
}

uint64_t __40__VCConnectionManagerIDS_addConnection___block_invoke(uint64_t a1)
{
  return objc_msgSend((id)objc_msgSend(*(id *)(a1 + 32), "delegate"), "optOutAllStreamsForConnection:", *(_QWORD *)(a1 + 40));
}

uint64_t __40__VCConnectionManagerIDS_addConnection___block_invoke_2(uint64_t a1)
{
  return objc_msgSend((id)objc_msgSend(*(id *)(a1 + 32), "delegate"), "setRemoteDeviceVersionIDS");
}

uint64_t __40__VCConnectionManagerIDS_addConnection___block_invoke_39(uint64_t a1)
{
  return objc_msgSend((id)objc_msgSend(*(id *)(a1 + 32), "delegate"), "connectionCallback:isInitialConnection:", *(_QWORD *)(a1 + 40), *(unsigned __int8 *)(a1 + 48));
}

- (void)reselectPrimaryConnection
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
  OUTLINED_FUNCTION_2_3(&dword_1D8A54000, v0, v1, " [%s] %s:%d HandoverReport: no connection available after link is removed!", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

- (void)handleSecondaryConnectionRemoved
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
  OUTLINED_FUNCTION_2_3(&dword_1D8A54000, v0, v1, " [%s] %s:%d HandoverReport: no secondary connection available after link is removed!", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

- (int)removeConnection:(id)a3
{
  id v5;
  NSMutableArray *connectionArray;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  id v12;
  unsigned int v13;
  int v14;
  id v15;
  uint64_t v16;
  NSObject *v17;
  NSMutableArray *v18;
  const char *v19;
  int v21;
  uint64_t v22;
  __int16 v23;
  const char *v24;
  __int16 v25;
  int v26;
  __int16 v27;
  const char *v28;
  __int16 v29;
  uint64_t v30;
  _BYTE v31[128];
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  uint64_t v36;

  v36 = *MEMORY[0x1E0C80C00];
  if (a3)
  {
    v5 = a3;
    pthread_rwlock_wrlock(&self->super._stateRWlock);
    v32 = 0u;
    v33 = 0u;
    v34 = 0u;
    v35 = 0u;
    connectionArray = self->super._connectionArray;
    v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:](connectionArray, "countByEnumeratingWithState:objects:count:", &v32, v31, 16);
    if (v7)
    {
      v8 = v7;
      v9 = *(_QWORD *)v33;
      while (2)
      {
        for (i = 0; i != v8; ++i)
        {
          if (*(_QWORD *)v33 != v9)
            objc_enumerationMutation(connectionArray);
          v11 = *(void **)(*((_QWORD *)&v32 + 1) + 8 * i);
          if (VCConnection_Equal((uint64_t)v11, (uint64_t)a3))
          {
            v12 = v11;
            -[VCConnectionManagerIDS removeFromConnectionArray:](self, "removeFromConnectionArray:", v11);
            v13 = VCConnection_Priority((uint64_t)v11);
            if ((v13 & 0xFFFFFFFE) == 2)
            {
              -[VCConnectionManagerIDS handlePrimaryConnectionRemoved](self, "handlePrimaryConnectionRemoved");
            }
            else if (v13 <= 1)
            {
              -[VCConnectionManagerIDS handleSecondaryConnectionRemoved](self, "handleSecondaryConnectionRemoved");
            }

            goto LABEL_19;
          }
        }
        v8 = -[NSMutableArray countByEnumeratingWithState:objects:count:](connectionArray, "countByEnumeratingWithState:objects:count:", &v32, v31, 16);
        if (v8)
          continue;
        break;
      }
    }
LABEL_19:
    if (-[VCConnectionManagerIDS shouldUpdateServerBasedConnection:](self, "shouldUpdateServerBasedConnection:", a3))
    {
      -[VCConnectionSelector updateSelectedConnectionsForGroupType:connectionRemoved:connectionArray:](self->super._connectionSelector, "updateSelectedConnectionsForGroupType:connectionRemoved:connectionArray:", 0, a3, self->super._connectionArray);
      if (self->_optIntoExistingSubscribedStreams)
        -[VCConnectionManagerDelegate optOutAllStreamsForConnection:](-[VCConnectionManager delegate](self, "delegate"), "optOutAllStreamsForConnection:", a3);
      v15 = -[VCConnectionSelector connectionForGroupType:isPrimary:](self->super._connectionSelector, "connectionForGroupType:isPrimary:", 0, 1);
      if (v15)
        -[VCLinkProbingHandler setQRLinkID:](self->super._linkProbingHandler, "setQRLinkID:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedChar:", VCConnectionIDS_LinkID((uint64_t)v15)));
    }
    VCConnectionManager_UpdateConnectionForDuplication((uint64_t)self);
    -[VCConnectionManagerIDS resetPacketCountAndByteCountWithConnection:](self, "resetPacketCountAndByteCountWithConnection:", a3);
    -[VCConnectionManager reportConnectionUpdateWithResponseCode:delay:](self, "reportConnectionUpdateWithResponseCode:delay:", 1, 2.0);
    if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
    {
      v16 = VRTraceErrorLogLevelToCSTR();
      v17 = *MEMORY[0x1E0CF2758];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
      {
        v18 = self->super._connectionArray;
        if (v18)
        {
          v19 = (const char *)objc_msgSend((id)-[NSMutableArray description](v18, "description"), "UTF8String");
          v18 = self->super._connectionArray;
        }
        else
        {
          v19 = "<nil>";
        }
        v21 = 136316162;
        v22 = v16;
        v23 = 2080;
        v24 = "-[VCConnectionManagerIDS removeConnection:]";
        v25 = 1024;
        v26 = 442;
        v27 = 2080;
        v28 = v19;
        v29 = 2048;
        v30 = -[NSMutableArray count](v18, "count");
        _os_log_impl(&dword_1D8A54000, v17, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d HandoverReport: connection array %s has %lu connections", (uint8_t *)&v21, 0x30u);
      }
    }
    pthread_rwlock_unlock(&self->super._stateRWlock);

    return 0;
  }
  else
  {
    v14 = -2144796671;
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
        -[VCConnectionManagerIDS removeConnection:].cold.1();
    }
  }
  return v14;
}

- (void)resetParticipantGenerationCounter
{
  NSObject *delegateQueue;
  _QWORD v3[6];

  v3[5] = *MEMORY[0x1E0C80C00];
  delegateQueue = self->super._delegateQueue;
  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __59__VCConnectionManagerIDS_resetParticipantGenerationCounter__block_invoke;
  v3[3] = &unk_1E9E521C0;
  v3[4] = self;
  dispatch_async(delegateQueue, v3);
}

uint64_t __59__VCConnectionManagerIDS_resetParticipantGenerationCounter__block_invoke(uint64_t a1)
{
  return objc_msgSend((id)objc_msgSend(*(id *)(a1 + 32), "delegate"), "resetParticipantGenerationCounter");
}

- (void)optOutAllStreamsForNonPrimaryConnections
{
  uint64_t v3;
  NSObject *v4;
  NSMutableArray *connectionArray;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  uint64_t v11;
  NSObject *delegateQueue;
  _QWORD v13[6];
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
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  if (!self->_optIntoExistingSubscribedStreams)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
    {
      v3 = VRTraceErrorLogLevelToCSTR();
      v4 = *MEMORY[0x1E0CF2758];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315650;
        v20 = v3;
        v21 = 2080;
        v22 = "-[VCConnectionManagerIDS optOutAllStreamsForNonPrimaryConnections]";
        v23 = 1024;
        v24 = 503;
        _os_log_impl(&dword_1D8A54000, v4, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d Opting out all streams for non primary connections!", buf, 0x1Cu);
      }
    }
    v17 = 0u;
    v18 = 0u;
    v15 = 0u;
    v16 = 0u;
    connectionArray = self->super._connectionArray;
    v6 = -[NSMutableArray countByEnumeratingWithState:objects:count:](connectionArray, "countByEnumeratingWithState:objects:count:", &v15, v14, 16);
    if (v6)
    {
      v7 = v6;
      v8 = *(_QWORD *)v16;
      v9 = MEMORY[0x1E0C809B0];
      do
      {
        for (i = 0; i != v7; ++i)
        {
          if (*(_QWORD *)v16 != v8)
            objc_enumerationMutation(connectionArray);
          v11 = *(_QWORD *)(*((_QWORD *)&v15 + 1) + 8 * i);
          if (VCConnection_Priority(v11) != 2)
          {
            delegateQueue = self->super._delegateQueue;
            v13[0] = v9;
            v13[1] = 3221225472;
            v13[2] = __66__VCConnectionManagerIDS_optOutAllStreamsForNonPrimaryConnections__block_invoke;
            v13[3] = &unk_1E9E52238;
            v13[4] = self;
            v13[5] = v11;
            dispatch_async(delegateQueue, v13);
          }
        }
        v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:](connectionArray, "countByEnumeratingWithState:objects:count:", &v15, v14, 16);
      }
      while (v7);
    }
  }
}

uint64_t __66__VCConnectionManagerIDS_optOutAllStreamsForNonPrimaryConnections__block_invoke(uint64_t a1)
{
  return objc_msgSend((id)objc_msgSend(*(id *)(a1 + 32), "delegate"), "optOutAllStreamsForConnection:", *(_QWORD *)(a1 + 40));
}

- (unsigned)getPacketCountWithIndex:(unsigned __int8)a3 isOutgoing:(BOOL)a4
{
  _BOOL4 v4;
  unsigned int v5;
  _opaque_pthread_rwlock_t *p_stateRWlock;
  int *v8;
  unsigned int v9;

  v4 = a4;
  v5 = a3;
  p_stateRWlock = &self->super._stateRWlock;
  pthread_rwlock_rdlock(&self->super._stateRWlock);
  v8 = &OBJC_IVAR___VCConnectionManagerIDS__receivedPacketCount;
  if (v4)
    v8 = &OBJC_IVAR___VCConnectionManagerIDS__sentPacketCount;
  v9 = *(_DWORD *)((char *)&self->super.super.isa + 4 * v5 + *v8);
  pthread_rwlock_unlock(p_stateRWlock);
  return v9;
}

- (unsigned)getByteCountWithIndex:(unsigned __int8)a3 isOutgoing:(BOOL)a4
{
  _BOOL4 v4;
  unsigned int v5;
  _opaque_pthread_rwlock_t *p_stateRWlock;
  int *v8;
  unsigned int v9;

  v4 = a4;
  v5 = a3;
  p_stateRWlock = &self->super._stateRWlock;
  pthread_rwlock_rdlock(&self->super._stateRWlock);
  v8 = &OBJC_IVAR___VCConnectionManagerIDS__receivedByteCount;
  if (v4)
    v8 = &OBJC_IVAR___VCConnectionManagerIDS__sentByteCount;
  v9 = *(_DWORD *)((char *)&self->super.super.isa + 4 * v5 + *v8);
  pthread_rwlock_unlock(p_stateRWlock);
  return v9;
}

- (id)getPrimaryConnectionToBeCompared
{
  return (id)VCConnectionManager_CopyPrimaryConnection((uint64_t)self);
}

- (void)updateCellularMTU:(int)a3
{
  uint64_t v3;
  _opaque_pthread_rwlock_t *p_stateRWlock;
  NSMutableArray *connectionArray;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  _BYTE v11[128];
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  uint64_t v16;

  v3 = *(_QWORD *)&a3;
  v16 = *MEMORY[0x1E0C80C00];
  p_stateRWlock = &self->super._stateRWlock;
  pthread_rwlock_wrlock(&self->super._stateRWlock);
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  connectionArray = self->super._connectionArray;
  v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:](connectionArray, "countByEnumeratingWithState:objects:count:", &v12, v11, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v13;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v13 != v9)
          objc_enumerationMutation(connectionArray);
        objc_msgSend(*(id *)(*((_QWORD *)&v12 + 1) + 8 * v10++), "setConnectionMTU:", v3);
      }
      while (v8 != v10);
      v8 = -[NSMutableArray countByEnumeratingWithState:objects:count:](connectionArray, "countByEnumeratingWithState:objects:count:", &v12, v11, 16);
    }
    while (v8);
  }
  pthread_rwlock_unlock(p_stateRWlock);
}

- (void)updateAllBitrateCapsForConnection:(id)a3
{
  _opaque_pthread_rwlock_t *p_stateRWlock;

  p_stateRWlock = &self->super._stateRWlock;
  pthread_rwlock_wrlock(&self->super._stateRWlock);
  -[VCConnectionManagerIDS updateAllBitrateCapsForConnectionInternal:](self, "updateAllBitrateCapsForConnectionInternal:", a3);
  pthread_rwlock_unlock(p_stateRWlock);
}

- (void)updateAllBitrateCapsForConnectionInternal:(id)a3
{
  objc_msgSend(a3, "setUplinkBitrateCap:", -[VCConnectionManagerIDS uplinkBitrateCapForConnection:](self, "uplinkBitrateCapForConnection:"));
  objc_msgSend(a3, "setDownlinkBitrateCap:", -[VCConnectionManagerIDS downlinkBitrateCapForConnection:](self, "downlinkBitrateCapForConnection:", a3));
  objc_msgSend(a3, "setUplinkAudioBitrateCapOneToOne:", -[VCConnectionManagerIDS uplinkAudioOnlyBitrateCapOneToOne:](self, "uplinkAudioOnlyBitrateCapOneToOne:", a3));
  objc_msgSend(a3, "setUplinkBitrateCapOneToOne:", -[VCConnectionManagerIDS uplinkBitrateCapOneToOne:](self, "uplinkBitrateCapOneToOne:", a3));
}

- (void)updateCellularTech:(int)a3 forLocalInterface:(BOOL)a4
{
  _BOOL4 v4;
  _opaque_pthread_rwlock_t *p_stateRWlock;
  NSMutableArray *connectionArray;
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

  v4 = a4;
  v18 = *MEMORY[0x1E0C80C00];
  p_stateRWlock = &self->super._stateRWlock;
  pthread_rwlock_wrlock(&self->super._stateRWlock);
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  connectionArray = self->super._connectionArray;
  v8 = -[NSMutableArray countByEnumeratingWithState:objects:count:](connectionArray, "countByEnumeratingWithState:objects:count:", &v14, v13, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v15;
    do
    {
      for (i = 0; i != v9; ++i)
      {
        if (*(_QWORD *)v15 != v10)
          objc_enumerationMutation(connectionArray);
        v12 = *(_QWORD *)(*((_QWORD *)&v14 + 1) + 8 * i);
        if (v4)
        {
          VCConnection_SetLocalCellTech(v12);
          -[VCConnectionManagerIDS updateAllBitrateCapsForConnectionInternal:](self, "updateAllBitrateCapsForConnectionInternal:", v12);
        }
        else
        {
          VCConnection_SetRemoteCellTech(v12);
          -[VCConnectionManagerIDS internalUpdateOneToOneBitrateCapsForConnection:](self, "internalUpdateOneToOneBitrateCapsForConnection:", v12);
        }
      }
      v9 = -[NSMutableArray countByEnumeratingWithState:objects:count:](connectionArray, "countByEnumeratingWithState:objects:count:", &v14, v13, 16);
    }
    while (v9);
  }
  pthread_rwlock_unlock(p_stateRWlock);
}

- (void)updateOneToOneBitrateCapsForConnection:(id)a3
{
  _opaque_pthread_rwlock_t *p_stateRWlock;

  p_stateRWlock = &self->super._stateRWlock;
  pthread_rwlock_wrlock(&self->super._stateRWlock);
  -[VCConnectionManagerIDS internalUpdateOneToOneBitrateCapsForConnection:](self, "internalUpdateOneToOneBitrateCapsForConnection:", a3);
  pthread_rwlock_unlock(p_stateRWlock);
}

- (void)internalUpdateOneToOneBitrateCapsForConnection:(id)a3
{
  objc_msgSend(a3, "setUplinkAudioBitrateCapOneToOne:", -[VCConnectionManagerIDS uplinkAudioOnlyBitrateCapOneToOne:](self, "uplinkAudioOnlyBitrateCapOneToOne:"));
  objc_msgSend(a3, "setUplinkBitrateCapOneToOne:", -[VCConnectionManagerIDS uplinkBitrateCapOneToOne:](self, "uplinkBitrateCapOneToOne:", a3));
}

- (void)setPreferredLocalInterfaceForDuplication:(unsigned __int8)a3
{
  int v3;
  _opaque_pthread_rwlock_t *p_stateRWlock;
  uint64_t v6;
  NSObject *v7;
  const char *v8;
  int v9;
  uint64_t v10;
  __int16 v11;
  const char *v12;
  __int16 v13;
  int v14;
  __int16 v15;
  const char *v16;
  uint64_t v17;

  v3 = a3;
  v17 = *MEMORY[0x1E0C80C00];
  p_stateRWlock = &self->super._stateRWlock;
  pthread_rwlock_wrlock(&self->super._stateRWlock);
  if (self->super._preferredLocalInterfaceForDuplication == v3)
  {
    pthread_rwlock_unlock(p_stateRWlock);
  }
  else
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      v6 = VRTraceErrorLogLevelToCSTR();
      v7 = *MEMORY[0x1E0CF2758];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
      {
        v8 = "Cellular";
        v10 = v6;
        v9 = 136315906;
        v12 = "-[VCConnectionManagerIDS setPreferredLocalInterfaceForDuplication:]";
        v11 = 2080;
        if (!v3)
          v8 = "WiFi";
        v13 = 1024;
        v14 = 598;
        v15 = 2080;
        v16 = v8;
        _os_log_impl(&dword_1D8A54000, v7, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d HandoverReport: updated preferred local interface for duplication to %s", (uint8_t *)&v9, 0x26u);
      }
    }
    self->super._preferredLocalInterfaceForDuplication = v3;
    VCConnectionManager_UpdateConnectionForDuplication((uint64_t)self);
    pthread_rwlock_unlock(p_stateRWlock);
  }
}

- (void)setPreferredRemoteInterfaceForDuplication:(unsigned __int8)a3
{
  _VCConnectionManagerIDS_SetPreferredRemoteInterfaceForDuplication((uint64_t)self, a3);
}

- (BOOL)shouldAcceptDataFromSourceDestinationInfo:(tagVCSourceDestinationInfo *)a3
{
  _opaque_pthread_rwlock_t *p_stateRWlock;
  uint64_t v6;
  const void *v7;
  BOOL v8;

  p_stateRWlock = &self->super._stateRWlock;
  pthread_rwlock_rdlock(&self->super._stateRWlock);
  v6 = VCConnectionManager_CopyPrimaryConnection((uint64_t)self);
  if (v6)
  {
    v7 = (const void *)v6;
    v8 = VCConnectionIDS_MatchesChannelTokenWithSourceDestinationInfo(v6, (uint64_t)a3);
    CFRelease(v7);
  }
  else
  {
    v8 = 0;
  }
  pthread_rwlock_unlock(p_stateRWlock);
  return v8;
}

- (void)updateSessionStats:(unsigned __int16)a3
{
  uint64_t v3;
  uint64_t v5;
  const void *v6;
  uint64_t v7;

  v3 = a3;
  v5 = VCConnectionManager_CopyConnectionForQuality((uint64_t)self, 1);
  if (v5)
  {
    v6 = (const void *)v5;
    v7 = VCConnectionIDS_LinkID(v5);
    -[VCStatsRecorder updateSessionStats:connection:totalPacketSent:totalPacketReceived:](self->super._statsRecorder, "updateSessionStats:connection:totalPacketSent:totalPacketReceived:", v3, v6, -[VCConnectionManagerIDS getPacketCountWithIndex:isOutgoing:](self, "getPacketCountWithIndex:isOutgoing:", v7, 1), -[VCConnectionManagerIDS getPacketCountWithIndex:isOutgoing:](self, "getPacketCountWithIndex:isOutgoing:", v7, 0));
    CFRelease(v6);
  }
  else if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
  {
    VRTraceErrorLogLevelToCSTR();
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
      -[VCConnectionManagerIDS updateSessionStats:].cold.1();
  }
}

- (void)updateStatResponseResult:(id)a3
{
  -[VCLinkProbingHandler updateQRProbingResult:](self->super._linkProbingHandler, "updateQRProbingResult:", a3);
}

- (void)updateEncryptionConfig:(id)a3
{
  uint64_t v4;
  NSObject *v5;
  NSString *gecoVersion;
  int v7;
  uint64_t v8;
  __int16 v9;
  const char *v10;
  __int16 v11;
  int v12;
  __int16 v13;
  NSString *v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  -[VCConnectionManager setGecoVersion:](self, "setGecoVersion:", objc_msgSend(a3, "objectForKeyedSubscript:", *MEMORY[0x1E0D340B0]));
  if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
  {
    v4 = VRTraceErrorLogLevelToCSTR();
    v5 = *MEMORY[0x1E0CF2758];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
    {
      gecoVersion = self->super._gecoVersion;
      v7 = 136315906;
      v8 = v4;
      v9 = 2080;
      v10 = "-[VCConnectionManagerIDS updateEncryptionConfig:]";
      v11 = 1024;
      v12 = 725;
      v13 = 2112;
      v14 = gecoVersion;
      _os_log_impl(&dword_1D8A54000, v5, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d Reported GECO version=%@", (uint8_t *)&v7, 0x26u);
    }
  }
}

- (void)addDuplicationConnectionUpdateTelemetryWithSuggestedLinkTypeCombo:(id)a3 payload:(id)a4
{
  if (-[VCConnectionManagerIDS connectionForDuplication](self, "connectionForDuplication"))
    VCConnectionManager_AddDuplicationSelectionLogicTelemetryForConnection((uint64_t)self, (uint64_t)-[VCConnectionManagerIDS connectionForDuplication](self, "connectionForDuplication"), (uint64_t)a3, a4);
}

- (void)resetPacketCountAndByteCountWithConnection:(id)a3
{
  int v4;

  v4 = VCConnectionIDS_LinkID((uint64_t)a3);
  self->_sentPacketCount[v4] = 0;
  self->_sentByteCount[v4] = 0;
  self->_receivedPacketCount[v4] = 0;
  self->_receivedByteCount[v4] = 0;
}

- (BOOL)shouldKeepAllConnections
{
  return (self->super._connectionSelectionVersion - 3) < 0xFFFFFFFE;
}

- (BOOL)shouldPreferWiredConnections
{
  return (self->super._connectionSelectionVersion - 1) >= 4
      && objc_msgSend(+[GKSConnectivitySettings getStorebagValueForStorebagKey:userDefaultKey:defaultValue:isDoubleType:](GKSConnectivitySettings, "getStorebagValueForStorebagKey:userDefaultKey:defaultValue:isDoubleType:", CFSTR("vc-prefer-wired-over-wifi"), CFSTR("preferWiredOverWiFiEnabled"), &unk_1E9EF5B70, 0), "intValue") != 0;
}

- (BOOL)shouldReplaceConnection:(id)a3 withConnection:(id)a4
{
  int IsRelay;
  int v8;
  int connectionSelectionVersion;

  IsRelay = VCConnection_IsRelay((uint64_t)a4);
  if (IsRelay != VCConnection_IsRelay((uint64_t)a3)
    || (IsRelay = VCConnection_IsIPv6((uint64_t)a4), IsRelay != VCConnection_IsIPv6((uint64_t)a3)))
  {
    LOBYTE(v8) = IsRelay ^ 1;
    return v8;
  }
  connectionSelectionVersion = self->super._connectionSelectionVersion;
  if ((connectionSelectionVersion - 3) < 4)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      v8 = os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR);
      if (!v8)
        return v8;
      -[VCConnectionManagerIDS shouldReplaceConnection:withConnection:].cold.1();
    }
    goto LABEL_11;
  }
  if (connectionSelectionVersion != 2)
  {
LABEL_11:
    LOBYTE(v8) = 0;
    return v8;
  }
  LOBYTE(v8) = objc_msgSend((id)objc_msgSend((id)objc_msgSend(a3, "connectionUUID"), "UUIDString"), "compare:", objc_msgSend((id)objc_msgSend(a4, "connectionUUID"), "UUIDString")) == 1;
  return v8;
}

- (BOOL)addConnectionToConnectionArray:(id)a3
{
  NSMutableArray *connectionArray;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  uint64_t v10;
  const void *v11;
  NSMutableArray *v12;
  uint64_t v13;
  uint64_t v14;
  unsigned __int8 v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  int v19;
  int v20;
  uint64_t v21;
  void *v22;
  VCLinkProbingHandler *linkProbingHandler;
  BOOL v24;
  int ErrorLogLevelForModule;
  uint64_t v26;
  NSObject *v27;
  const char *v28;
  uint64_t IsLocalOnWiFi;
  uint64_t v31;
  NSObject *v32;
  const char *v33;
  uint64_t v34;
  uint64_t v35;
  uint8_t buf[4];
  uint64_t v37;
  __int16 v38;
  const char *v39;
  __int16 v40;
  int v41;
  __int16 v42;
  const char *v43;
  _BYTE v44[128];
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  _BYTE v49[128];
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  uint64_t v54;

  v54 = *MEMORY[0x1E0C80C00];
  v50 = 0u;
  v51 = 0u;
  v52 = 0u;
  v53 = 0u;
  connectionArray = self->super._connectionArray;
  v6 = -[NSMutableArray countByEnumeratingWithState:objects:count:](connectionArray, "countByEnumeratingWithState:objects:count:", &v50, v49, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v51;
    while (2)
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v51 != v8)
          objc_enumerationMutation(connectionArray);
        v10 = *(_QWORD *)(*((_QWORD *)&v50 + 1) + 8 * i);
        if (!VCConnectionIDS_LinkID(v10))
        {
          v11 = (const void *)VCConnectionManager_CopyPrimaryConnection((uint64_t)self);
          if (VCConnection_Equal((uint64_t)v11, v10))
          {
            VCConnectionManager_SetPrimaryConnection((uint64_t)self);
          }
          else if (VCConnection_Equal((uint64_t)-[VCConnectionManagerIDS secondaryConnection](self, "secondaryConnection"), v10))
          {
            -[VCConnectionManagerIDS setSecondaryConnection:](self, "setSecondaryConnection:", 0);
          }
          if (v11)
            CFRelease(v11);
          -[VCConnectionManagerIDS removeFromConnectionArray:](self, "removeFromConnectionArray:", v10);
          goto LABEL_17;
        }
      }
      v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:](connectionArray, "countByEnumeratingWithState:objects:count:", &v50, v49, 16);
      if (v7)
        continue;
      break;
    }
  }
LABEL_17:
  v47 = 0u;
  v48 = 0u;
  v45 = 0u;
  v46 = 0u;
  v12 = self->super._connectionArray;
  v13 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v12, "countByEnumeratingWithState:objects:count:", &v45, v44, 16, 328);
  if (!v13)
  {
    v15 = 0;
    goto LABEL_35;
  }
  v14 = v13;
  v15 = 0;
  v16 = *(_QWORD *)v46;
LABEL_19:
  v17 = 0;
  while (1)
  {
    if (*(_QWORD *)v46 != v16)
      objc_enumerationMutation(v12);
    v18 = *(void **)(*((_QWORD *)&v45 + 1) + 8 * v17);
    if ((VCConnection_Equal((uint64_t)a3, (uint64_t)v18) & 1) != 0)
      return 0;
    if (self->_isMultiwaySession)
      goto LABEL_31;
    v19 = self->super._duplicationEnhancementEnabled
        ? objc_msgSend(a3, "isOnSameInterfacesAndQRSessionWithConnection:", v18)
        : VCConnection_IsOnSameInterfacesWithConnection((uint64_t)a3);
    v20 = v19;
    if (!-[VCConnectionManagerIDS shouldKeepAllConnections](self, "shouldKeepAllConnections"))
    {
      if (v20)
        break;
    }
    if (objc_msgSend(a3, "compare:isPrimary:selectionPolicy:", v18, 1, -[VCConnectionManagerIDS getConnectionSelectionPolicy](self, "getConnectionSelectionPolicy")) != 1)++v15;
LABEL_31:
    if (v14 == ++v17)
    {
      v14 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v12, "countByEnumeratingWithState:objects:count:", &v45, v44, 16);
      if (v14)
        goto LABEL_19;
      goto LABEL_35;
    }
  }
  v24 = -[VCConnectionManagerIDS shouldReplaceConnection:withConnection:](self, "shouldReplaceConnection:withConnection:", v18, a3);
  ErrorLogLevelForModule = VRTraceGetErrorLogLevelForModule();
  if (!v24)
  {
    if (ErrorLogLevelForModule >= 7)
    {
      v31 = VRTraceErrorLogLevelToCSTR();
      v32 = *MEMORY[0x1E0CF2758];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
      {
        if (a3)
          v33 = (const char *)objc_msgSend((id)objc_msgSend(a3, "description"), "UTF8String");
        else
          v33 = "<nil>";
        *(_DWORD *)buf = 136315906;
        v37 = v31;
        v38 = 2080;
        v39 = "-[VCConnectionManagerIDS addConnectionToConnectionArray:]";
        v40 = 1024;
        v41 = 908;
        v42 = 2080;
        v43 = v33;
        _os_log_impl(&dword_1D8A54000, v32, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d HandoverReport: new connection %s is not added, stop keep alive", buf, 0x26u);
      }
    }
    -[VCConnectionManager delegate](self, "delegate");
    if ((objc_opt_respondsToSelector() & 1) != 0)
      -[VCConnectionManagerDelegate discardConnection:](-[VCConnectionManager delegate](self, "delegate"), "discardConnection:", a3);
    return 0;
  }
  if (ErrorLogLevelForModule >= 7)
  {
    v26 = VRTraceErrorLogLevelToCSTR();
    v27 = *MEMORY[0x1E0CF2758];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
    {
      if (v18)
        v28 = (const char *)objc_msgSend((id)objc_msgSend(v18, "description"), "UTF8String");
      else
        v28 = "<nil>";
      *(_DWORD *)buf = 136315906;
      v37 = v26;
      v38 = 2080;
      v39 = "-[VCConnectionManagerIDS addConnectionToConnectionArray:]";
      v40 = 1024;
      v41 = 914;
      v42 = 2080;
      v43 = v28;
      _os_log_impl(&dword_1D8A54000, v27, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d HandoverReport: connection %s is replaced, stop keep alive", buf, 0x26u);
    }
  }
  -[VCConnectionManager delegate](self, "delegate");
  if ((objc_opt_respondsToSelector() & 1) != 0)
    -[VCConnectionManagerDelegate discardConnection:](-[VCConnectionManager delegate](self, "delegate"), "discardConnection:", v18);
  -[VCConnectionManagerIDS removeFromConnectionArray:](self, "removeFromConnectionArray:", v18);
LABEL_35:
  v21 = VCConnectionIDS_LinkID((uint64_t)a3);
  v22 = (void *)objc_msgSend((id)objc_msgSend(a3, "connectionUUID"), "copy");
  -[NSMutableDictionary setObject:forKeyedSubscript:](self->super._mapLinkIDToLinkUUID, "setObject:forKeyedSubscript:", v22, objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedChar:", v21));

  objc_msgSend(*(id *)((char *)&self->super.super.isa + v34), "insertObject:atIndex:", a3, v15);
  if (VCConnectionManager_IsDuplicationConnectionCandidate((uint64_t)self, (uint64_t)a3))
  {
    if (-[VCLinkProbingHandler isLinkProbingActive](self->super._linkProbingHandler, "isLinkProbingActive"))
    {
      linkProbingHandler = self->super._linkProbingHandler;
      v35 = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", VCConnection_ConnectionID((uint64_t)a3));
      -[VCLinkProbingHandler startActiveProbingOnLinks:](linkProbingHandler, "startActiveProbingOnLinks:", objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v35, 1));
    }
    else if (!VCConnectionManager_AreAllLinkProbingTriggersInactive((uint64_t)self))
    {
      VCConnectionManager_SetActiveLinkProbingEnabled((uint64_t)self, 1);
    }
  }
  IsLocalOnWiFi = VCConnection_IsLocalOnWiFi((uint64_t)a3);
  -[VCConnectionManagerIDS updateDuplicationStateWithConnectionOperation:isLocalOnWiFi:isRemoteOnWiFi:](self, "updateDuplicationStateWithConnectionOperation:isLocalOnWiFi:isRemoteOnWiFi:", 0, IsLocalOnWiFi, VCConnection_IsRemoteOnWiFi((uint64_t)a3));
  return 1;
}

- (void)removeFromConnectionArray:(id)a3
{
  VCLinkProbingHandler *linkProbingHandler;
  uint64_t IsLocalOnWiFi;
  _QWORD v7[2];

  v7[1] = *MEMORY[0x1E0C80C00];
  if (-[VCLinkProbingHandler isLinkProbingActive](self->super._linkProbingHandler, "isLinkProbingActive"))
  {
    linkProbingHandler = self->super._linkProbingHandler;
    v7[0] = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", VCConnection_ConnectionID((uint64_t)a3));
    -[VCLinkProbingHandler stopActiveProbingOnLinks:resetStats:](linkProbingHandler, "stopActiveProbingOnLinks:resetStats:", objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v7, 1), 1);
  }
  IsLocalOnWiFi = VCConnection_IsLocalOnWiFi((uint64_t)a3);
  -[VCConnectionManagerIDS updateDuplicationStateWithConnectionOperation:isLocalOnWiFi:isRemoteOnWiFi:](self, "updateDuplicationStateWithConnectionOperation:isLocalOnWiFi:isRemoteOnWiFi:", 1, IsLocalOnWiFi, VCConnection_IsRemoteOnWiFi((uint64_t)a3));
  -[NSMutableArray removeObject:](self->super._connectionArray, "removeObject:", a3);
}

- (void)updateDuplicationStateWithConnectionOperation:(int)a3 isLocalOnWiFi:(BOOL)a4 isRemoteOnWiFi:(BOOL)a5
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  v6 = 0x100000000;
  if (!a4)
    v6 = 0;
  v7 = v6 | a3;
  v8 = 0x10000000000;
  if (!a5)
    v8 = 0;
  if ((VCDuplicationHandler_HandleDuplicationStateUpdateEvent(self->super._duplicationHandler, 13, v7 | v8) & 1) != 0)
    VCConnectionManager_SetDuplicationEnabledInternal((uint64_t)self, -[VCConnectionManager isDuplicationEnabled](self, "isDuplicationEnabled"));
}

- (void)updateNegotiatedSettingsOnetoOne:(id)a3
{
  -[VCBitrateArbiter updateNegotiatedSettings:](self->_oneToOneBitrateArbiter, "updateNegotiatedSettings:", a3);
}

- (void)reportConnection:(id)a3 isInitialConnection:(BOOL)a4
{
  _BOOL4 v4;
  int IsEndToEndLink;
  int v8;
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  int relayServerProvider;
  const char *v13;
  const char *v14;
  uint64_t v15;
  NSObject *v16;
  uint64_t v17;
  _BOOL8 EyeContactEnabledBoolValue;
  int v19;
  void *v20;
  const __CFString *v21;
  const char *v22;
  void *v23;
  CFStringRef v24;
  CFStringRef v25;
  uint64_t v26;
  unsigned int v27;
  objc_super v28;
  _QWORD v29[16];
  _QWORD v30[16];
  uint8_t buf[4];
  uint64_t v32;
  __int16 v33;
  const char *v34;
  __int16 v35;
  int v36;
  uint64_t v37;

  v4 = a4;
  v37 = *MEMORY[0x1E0C80C00];
  IsEndToEndLink = VCConnection_IsEndToEndLink((uint64_t)a3);
  if (!-[VCConnectionManager isOneToOneModeEnabled](self, "isOneToOneModeEnabled") || IsEndToEndLink)
  {
    v8 = VCConnection_Priority((uint64_t)a3);
    if (self->super._reportingAgent)
    {
      v27 = v8 & 0xFFFFFFFE;
      if (VCConnection_IsRelay((uint64_t)a3))
        v9 = "relay";
      else
        v9 = "p2p";
      v10 = VCConnectionManager_ConnectionInterfaceType((uint64_t)a3, 1);
      v11 = VCConnectionManager_ConnectionInterfaceType((uint64_t)a3, 0);
      if (v4)
      {
        relayServerProvider = self->super._relayServerProvider;
        v13 = "QRSUN";
        if (relayServerProvider == 2)
          v13 = "QRSAP";
        if (relayServerProvider == 1)
          v14 = "QRSAK";
        else
          v14 = v13;
      }
      else
      {
        v14 = "";
      }
      objc_msgSend(a3, "sharedDigestKey");
      reportingSetDigestKey();
      v17 = objc_msgSend(a3, "relaySessionToken");
      EyeContactEnabledBoolValue = VCDefaults_GetEyeContactEnabledBoolValue(1);
      v29[0] = CFSTR("ConnectionType");
      v30[0] = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", v9);
      v30[1] = &stru_1E9E58EE0;
      v29[1] = CFSTR("LocalCandidate");
      v29[2] = CFSTR("RemoteCandidate");
      v30[2] = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", v14);
      v29[3] = CFSTR("LocalInterfaceType");
      v30[3] = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", v10);
      v29[4] = CFSTR("RemoteInterfaceType");
      v30[4] = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", v11);
      v29[5] = CFSTR("relayServer");
      v30[5] = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", v14);
      v29[6] = CFSTR("relayType");
      v30[6] = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", objc_msgSend(a3, "type"));
      v29[7] = CFSTR("VPN");
      v19 = objc_msgSend(a3, "isVPN");
      v20 = &unk_1E9EF5B88;
      if (v19)
        v20 = &unk_1E9EF5B70;
      v21 = CFSTR("Unknown");
      if (v17)
        v21 = (const __CFString *)v17;
      v30[7] = v20;
      v30[8] = v21;
      v29[8] = CFSTR("IDSToken");
      v29[9] = CFSTR("VPCENABLED");
      v30[9] = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", EyeContactEnabledBoolValue);
      v29[10] = CFSTR("EndToEnd");
      if (IsEndToEndLink)
        v22 = "1";
      else
        v22 = "0";
      v30[10] = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", v22);
      v29[11] = CFSTR("QuicPod");
      v30[11] = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", VCConnectionIDS_IsQUICPod((uint64_t)a3));
      v29[12] = CFSTR("Rpsd");
      v30[12] = +[VCConnectionIDS VCConnectionIDS_RPS:](VCConnectionIDS, "VCConnectionIDS_RPS:", a3);
      v29[13] = CFSTR("Cpsd");
      v30[13] = +[VCConnectionIDS VCConnectionIDS_CDBPS:](VCConnectionIDS, "VCConnectionIDS_CDBPS:", a3);
      v29[14] = CFSTR("ConnProtocolType");
      v30[14] = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", objc_msgSend(a3, "linkConnectionType"));
      v29[15] = CFSTR("MaxMTU");
      v30[15] = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", objc_msgSend(a3, "maxConnectionMTU"));
      v23 = (void *)objc_msgSend((id)objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v30, v29, 16), "mutableCopy");
      v24 = VCConnectionManager_CopySuggestedLinkTypeCombo((uint64_t)self);
      if (v24)
      {
        v25 = v24;
        objc_msgSend(v23, "setObject:forKeyedSubscript:", v24, CFSTR("SLTS"));
        CFRelease(v25);
      }
      if (v27 == 2)
        VCConnectionManager_AddTelemetryForPacketHistoryInternal((uint64_t)self, (uint64_t)v23);
      v26 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@_ABT"), CFSTR("QuicPod"));
      objc_msgSend(v23, "setObject:forKeyedSubscript:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->super._gftTLEEnabled), v26);
      objc_msgSend(v23, "setObject:forKeyedSubscript:", self->super._gecoVersion, CFSTR("GECO_ABT"));
      VCConnectionManager_AddTelemetryForConnection((uint64_t)self, (uint64_t)a3, v23);
      VCConnection_ReportingQRServerConfig((uint64_t)a3);
      reportingGenericEvent();

      v28.receiver = self;
      v28.super_class = (Class)VCConnectionManagerIDS;
      -[VCConnectionManager reportConnection:isInitialConnection:](&v28, sel_reportConnection_isInitialConnection_, a3, v4);
    }
    else if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      v15 = VRTraceErrorLogLevelToCSTR();
      v16 = *MEMORY[0x1E0CF2758];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315650;
        v32 = v15;
        v33 = 2080;
        v34 = "-[VCConnectionManagerIDS reportConnection:isInitialConnection:]";
        v35 = 1024;
        v36 = 1011;
        _os_log_impl(&dword_1D8A54000, v16, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d reportConnection: reportingAgent is nil, can not report connections", buf, 0x1Cu);
      }
    }
  }
}

- (void)reportCurrentPrimaryConnection
{
  _opaque_pthread_rwlock_t *p_stateRWlock;

  p_stateRWlock = &self->super._stateRWlock;
  pthread_rwlock_rdlock(&self->super._stateRWlock);
  -[VCConnectionManagerIDS reportConnection:isInitialConnection:](self, "reportConnection:isInitialConnection:", (id)VCConnectionManager_CopyPrimaryConnection((uint64_t)self), 1);
  pthread_rwlock_unlock(p_stateRWlock);
}

- (void)useConnectionAsPrimary:(id)a3
{
  -[VCConnectionSelector useConnectionAsPrimary:](self->super._connectionSelector, "useConnectionAsPrimary:", a3);
}

- (BOOL)shouldDropCurrentPrimaryConnectionWithConnectionStats:(id *)a3
{
  int v4;
  id v6;
  uint64_t v7;
  int IsEndToEndLink;
  char v9;
  int v10;

  if ((self->super._connectionSelectionVersion - 1) < 2
    || self->super._localConnectionStats.isConnectionPaused
    || self->super._remoteConnectionStats.isConnectionPaused)
  {
    goto LABEL_4;
  }
  v6 = (id)VCConnectionManager_CopyPrimaryConnection((uint64_t)self);
  v4 = objc_msgSend(v6, "isVPN");
  if (!v4)
    return v4;
  pthread_rwlock_rdlock(&self->super._stateRWlock);
  if ((unint64_t)-[NSMutableArray count](self->super._connectionArray, "count") < 2
    || ((v7 = -[NSMutableArray objectAtIndex:](self->super._connectionArray, "objectAtIndex:", 1),
         IsEndToEndLink = VCConnection_IsEndToEndLink(v7),
         !-[VCConnectionManager isOneToOneModeEnabled](self, "isOneToOneModeEnabled"))
     || (IsEndToEndLink & 1) == 0)
    && ((-[VCConnectionManager isOneToOneModeEnabled](self, "isOneToOneModeEnabled") | IsEndToEndLink) & 1) != 0)
  {
    pthread_rwlock_unlock(&self->super._stateRWlock);
LABEL_4:
    LOBYTE(v4) = 0;
    return v4;
  }
  if (self->super._connectionSelectionVersion == 3)
  {
    v9 = objc_msgSend(v6, "isOnSameInterfacesAndQRSessionWithConnection:", v7);
    pthread_rwlock_unlock(&self->super._stateRWlock);
    if ((v9 & 1) == 0)
      goto LABEL_4;
  }
  else
  {
    v10 = VCConnection_IsOnSameInterfacesWithConnection((uint64_t)v6);
    pthread_rwlock_unlock(&self->super._stateRWlock);
    if (!v10)
      goto LABEL_4;
  }
  if (a3->var4 <= 5.0)
    goto LABEL_4;
  LOBYTE(v4) = !self->super._enableDuplication;
  return v4;
}

- (BOOL)shouldUpdateServerBasedConnection:(id)a3
{
  if (self->_isMultiwaySession)
    return VCConnection_IsEndToEndLink((uint64_t)a3) ^ 1;
  else
    return 0;
}

- (BOOL)canOptOutAllStreamsForConnection:(id)a3
{
  if (self->_isMultiwaySession && !self->_optIntoExistingSubscribedStreams)
    return VCConnection_IsEndToEndLink((uint64_t)a3) ^ 1;
  else
    return 0;
}

- (void)startActiveProbingWithOptions:(id)a3
{
  NSObject *delegateQueue;
  _QWORD block[7];

  block[6] = *MEMORY[0x1E0C80C00];
  if (-[VCConnectionManager delegate](self, "delegate"))
  {
    delegateQueue = self->super._delegateQueue;
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __56__VCConnectionManagerIDS_startActiveProbingWithOptions___block_invoke;
    block[3] = &unk_1E9E52238;
    block[4] = self;
    block[5] = a3;
    dispatch_async(delegateQueue, block);
  }
}

uint64_t __56__VCConnectionManagerIDS_startActiveProbingWithOptions___block_invoke(uint64_t a1)
{
  return objc_msgSend((id)objc_msgSend(*(id *)(a1 + 32), "delegate"), "startActiveProbingWithOptions:", *(_QWORD *)(a1 + 40));
}

- (void)stopActiveProbingWithOptions:(id)a3
{
  NSObject *delegateQueue;
  _QWORD block[7];

  block[6] = *MEMORY[0x1E0C80C00];
  if (-[VCConnectionManager delegate](self, "delegate"))
  {
    delegateQueue = self->super._delegateQueue;
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __55__VCConnectionManagerIDS_stopActiveProbingWithOptions___block_invoke;
    block[3] = &unk_1E9E52238;
    block[4] = self;
    block[5] = a3;
    dispatch_async(delegateQueue, block);
  }
}

uint64_t __55__VCConnectionManagerIDS_stopActiveProbingWithOptions___block_invoke(uint64_t a1)
{
  return objc_msgSend((id)objc_msgSend(*(id *)(a1 + 32), "delegate"), "stopActiveProbingWithOptions:", *(_QWORD *)(a1 + 40));
}

- (void)queryProbingResultsWithOptions:(id)a3
{
  NSObject *delegateQueue;
  _QWORD block[7];

  block[6] = *MEMORY[0x1E0C80C00];
  if (-[VCConnectionManager delegate](self, "delegate"))
  {
    delegateQueue = self->super._delegateQueue;
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __57__VCConnectionManagerIDS_queryProbingResultsWithOptions___block_invoke;
    block[3] = &unk_1E9E52238;
    block[4] = self;
    block[5] = a3;
    dispatch_async(delegateQueue, block);
  }
}

uint64_t __57__VCConnectionManagerIDS_queryProbingResultsWithOptions___block_invoke(uint64_t a1)
{
  return objc_msgSend((id)objc_msgSend(*(id *)(a1 + 32), "delegate"), "queryProbingResultsWithOptions:", *(_QWORD *)(a1 + 40));
}

- (void)flushLinkProbingStatusWithOptions:(id)a3
{
  NSObject *delegateQueue;
  _QWORD block[7];

  block[6] = *MEMORY[0x1E0C80C00];
  if (-[VCConnectionManager delegate](self, "delegate"))
  {
    delegateQueue = self->super._delegateQueue;
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __60__VCConnectionManagerIDS_flushLinkProbingStatusWithOptions___block_invoke;
    block[3] = &unk_1E9E52238;
    block[4] = self;
    block[5] = a3;
    dispatch_async(delegateQueue, block);
  }
}

uint64_t __60__VCConnectionManagerIDS_flushLinkProbingStatusWithOptions___block_invoke(uint64_t a1)
{
  return objc_msgSend((id)objc_msgSend(*(id *)(a1 + 32), "delegate"), "flushLinkProbingStatusWithOptions:", *(_QWORD *)(a1 + 40));
}

- (void)didUpdateLinkPreferenceOrder:(id)a3
{
  _opaque_pthread_rwlock_t *p_stateRWlock;
  uint64_t v6;
  NSObject *v7;
  int v8;
  uint64_t v9;
  __int16 v10;
  const char *v11;
  __int16 v12;
  int v13;
  __int16 v14;
  uint64_t v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  p_stateRWlock = &self->super._stateRWlock;
  pthread_rwlock_wrlock(&self->super._stateRWlock);
  if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
  {
    v6 = VRTraceErrorLogLevelToCSTR();
    v7 = *MEMORY[0x1E0CF2758];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
    {
      v8 = 136315906;
      v9 = v6;
      v10 = 2080;
      v11 = "-[VCConnectionManagerIDS didUpdateLinkPreferenceOrder:]";
      v12 = 1024;
      v13 = 1172;
      v14 = 2112;
      v15 = objc_msgSend((id)objc_msgSend(a3, "valueForKey:", CFSTR("description")), "componentsJoinedByString:", CFSTR(","));
      _os_log_impl(&dword_1D8A54000, v7, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d HandoverReport: Updated link preference order: %@", (uint8_t *)&v8, 0x26u);
    }
  }
  -[VCConnectionSelector setLinkPreferenceOrder:](self->super._connectionSelector, "setLinkPreferenceOrder:", a3);
  VCConnectionManager_UpdateConnectionForDuplication((uint64_t)self);
  pthread_rwlock_unlock(p_stateRWlock);
}

- (void)didLinkProbingLockdownEnd
{
  if (!VCConnectionManager_AreAllLinkProbingTriggersInactive((uint64_t)self))
    VCConnectionManager_SetActiveLinkProbingEnabled((uint64_t)self, 1);
}

- (void)requestStatsWithOptions:(id)a3
{
  NSObject *delegateQueue;
  _QWORD block[7];

  block[6] = *MEMORY[0x1E0C80C00];
  delegateQueue = self->super._delegateQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __50__VCConnectionManagerIDS_requestStatsWithOptions___block_invoke;
  block[3] = &unk_1E9E52238;
  block[4] = self;
  block[5] = a3;
  dispatch_async(delegateQueue, block);
}

uint64_t __50__VCConnectionManagerIDS_requestStatsWithOptions___block_invoke(uint64_t a1)
{
  return objc_msgSend((id)objc_msgSend(*(id *)(a1 + 32), "delegate"), "requestStatsWithOptions:", *(_QWORD *)(a1 + 40));
}

- (void)didReceiveStatsResponse:(BOOL)a3
{
  NSObject *callbackQueue;
  _QWORD block[5];
  BOOL v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  callbackQueue = self->super._callbackQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __50__VCConnectionManagerIDS_didReceiveStatsResponse___block_invoke;
  block[3] = &unk_1E9E521E8;
  v5 = a3;
  block[4] = self;
  dispatch_async(callbackQueue, block);
}

void __50__VCConnectionManagerIDS_didReceiveStatsResponse___block_invoke(uint64_t a1)
{
  int v1;
  uint64_t v2;
  int v3;

  v1 = *(unsigned __int8 *)(a1 + 40);
  v2 = *(_QWORD *)(a1 + 32);
  if (v1)
    v3 = 3;
  else
    v3 = 2;
  VCConnectionManager_UpdateNetworkOutageStatus(v2, v3);
}

- ($85B13D066EE34EC5DDC86B20300AB7FA)getConnectionSelectionPolicy
{
  return -[VCConnectionSelector getConnectionSelectionPolicy](self->super._connectionSelector, "getConnectionSelectionPolicy");
}

- (void)updateConnectionSelectionPolicyWithPreferE2E:(BOOL)a3
{
  _opaque_pthread_rwlock_t *p_stateRWlock;
  _BYTE v6[6];
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  p_stateRWlock = &self->super._stateRWlock;
  pthread_rwlock_wrlock(&self->super._stateRWlock);
  v6[0] = self->super._preferRelayOverP2PEnabled;
  v6[1] = 0;
  v6[2] = -[VCConnectionManagerIDS shouldKeepAllConnections](self, "shouldKeepAllConnections");
  v6[3] = self->_isMultiwaySession;
  v6[4] = a3;
  v6[5] = -[VCConnectionManagerIDS shouldPreferWiredConnections](self, "shouldPreferWiredConnections");
  -[VCConnectionSelector updateConnectionSelectionPolicy:](self->super._connectionSelector, "updateConnectionSelectionPolicy:", v6);
  pthread_rwlock_unlock(p_stateRWlock);
}

- (id)secondaryConnection
{
  return -[VCConnectionSelector secondaryConnection](self->super._connectionSelector, "secondaryConnection");
}

- (id)connectionForDuplication
{
  return (id)(id)VCConnectionSelector_CopyConnectionForDuplication((uint64_t)self->super._connectionSelector);
}

- (id)lastPrimaryConnectionInUse
{
  return -[VCConnectionSelector lastPrimaryConnectionInUse](self->super._connectionSelector, "lastPrimaryConnectionInUse");
}

- (void)setSecondaryConnection:(id)a3
{
  -[VCConnectionSelector setSecondaryConnection:](self->super._connectionSelector, "setSecondaryConnection:", a3);
}

- (void)setConnectionForDuplication:(id)a3
{
  -[VCConnectionSelector setConnectionForDuplication:](self->super._connectionSelector, "setConnectionForDuplication:", a3);
}

- (void)setLastPrimaryConnectionInUse:(id)a3
{
  -[VCConnectionSelector setLastPrimaryConnectionInUse:](self->super._connectionSelector, "setLastPrimaryConnectionInUse:", a3);
}

- (void)setOptIntoExistingSubscribedStreams:(BOOL)a3
{
  NSMutableArray *connectionArray;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  id v12;
  NSObject *delegateQueue;
  _opaque_pthread_rwlock_t *p_stateRWlock;
  _QWORD block[6];
  _BYTE v16[128];
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  p_stateRWlock = &self->super._stateRWlock;
  pthread_rwlock_rdlock(&self->super._stateRWlock);
  self->_optIntoExistingSubscribedStreams = a3;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  connectionArray = self->super._connectionArray;
  v6 = -[NSMutableArray countByEnumeratingWithState:objects:count:](connectionArray, "countByEnumeratingWithState:objects:count:", &v17, v16, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v18;
    v9 = MEMORY[0x1E0C809B0];
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v18 != v8)
          objc_enumerationMutation(connectionArray);
        v11 = *(void **)(*((_QWORD *)&v17 + 1) + 8 * i);
        if ((VCConnection_IsEndToEndLink((uint64_t)v11) & 1) == 0)
        {
          v12 = v11;
          delegateQueue = self->super._delegateQueue;
          block[0] = v9;
          block[1] = 3221225472;
          block[2] = __62__VCConnectionManagerIDS_setOptIntoExistingSubscribedStreams___block_invoke;
          block[3] = &unk_1E9E52238;
          block[4] = v11;
          block[5] = self;
          dispatch_async(delegateQueue, block);
        }
      }
      v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:](connectionArray, "countByEnumeratingWithState:objects:count:", &v17, v16, 16);
    }
    while (v7);
  }
  pthread_rwlock_unlock(p_stateRWlock);
}

void __62__VCConnectionManagerIDS_setOptIntoExistingSubscribedStreams___block_invoke(uint64_t a1)
{
  int v2;
  uint64_t v3;
  BOOL v4;
  _BOOL4 IsDuplicationEnabled;

  v2 = VCConnection_Priority(*(_QWORD *)(a1 + 32));
  v3 = *(_QWORD *)(a1 + 40);
  if (*(_BYTE *)(v3 + 7666))
    v4 = 1;
  else
    v4 = v2 == 2;
  if (!v4)
  {
    if (v2
      || (IsDuplicationEnabled = VCDuplicationHandler_IsDuplicationEnabled(*(_QWORD *)(v3 + 624)),
          v3 = *(_QWORD *)(a1 + 40),
          !IsDuplicationEnabled))
    {
      objc_msgSend((id)objc_msgSend((id)v3, "delegate"), "optOutAllStreamsForConnection:", *(_QWORD *)(a1 + 32));
      goto LABEL_13;
    }
    if (!*(_BYTE *)(v3 + 7666))
      goto LABEL_13;
    goto LABEL_7;
  }
  if (*(_BYTE *)(v3 + 7666))
LABEL_7:
    objc_msgSend((id)objc_msgSend((id)v3, "delegate"), "optIntoExistingSubscribedStreamsForConnection:", *(_QWORD *)(a1 + 32));
LABEL_13:

}

- (BOOL)isEndToEndLinkAvailable
{
  _opaque_pthread_rwlock_t *p_stateRWlock;
  NSMutableArray *connectionArray;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  BOOL v9;
  _BYTE v11[128];
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  p_stateRWlock = &self->super._stateRWlock;
  pthread_rwlock_rdlock(&self->super._stateRWlock);
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  connectionArray = self->super._connectionArray;
  v5 = -[NSMutableArray countByEnumeratingWithState:objects:count:](connectionArray, "countByEnumeratingWithState:objects:count:", &v12, v11, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v13;
    while (2)
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v13 != v7)
          objc_enumerationMutation(connectionArray);
        if ((VCConnection_IsEndToEndLink(*(_QWORD *)(*((_QWORD *)&v12 + 1) + 8 * i)) & 1) != 0)
        {
          v9 = 1;
          goto LABEL_11;
        }
      }
      v6 = -[NSMutableArray countByEnumeratingWithState:objects:count:](connectionArray, "countByEnumeratingWithState:objects:count:", &v12, v11, 16);
      if (v6)
        continue;
      break;
    }
  }
  v9 = 0;
LABEL_11:
  pthread_rwlock_unlock(p_stateRWlock);
  return v9;
}

- (BOOL)isEndToEndLinkWithCellAvailable:(BOOL)a3
{
  _BOOL4 v3;
  _opaque_pthread_rwlock_t *p_stateRWlock;
  NSMutableArray *connectionArray;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  uint64_t v11;
  BOOL v12;
  _BYTE v14[128];
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  uint64_t v19;

  v3 = a3;
  v19 = *MEMORY[0x1E0C80C00];
  p_stateRWlock = &self->super._stateRWlock;
  pthread_rwlock_rdlock(&self->super._stateRWlock);
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  connectionArray = self->super._connectionArray;
  v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:](connectionArray, "countByEnumeratingWithState:objects:count:", &v15, v14, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v16;
    while (2)
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v16 != v9)
          objc_enumerationMutation(connectionArray);
        v11 = *(_QWORD *)(*((_QWORD *)&v15 + 1) + 8 * i);
        if (VCConnection_IsEndToEndLink(v11)
          && (v3 && (VCConnection_IsLocalOnCellular(v11) & 1) != 0 || (VCConnection_IsRemoteOnCellular(v11) & 1) != 0))
        {
          v12 = 1;
          goto LABEL_14;
        }
      }
      v8 = -[NSMutableArray countByEnumeratingWithState:objects:count:](connectionArray, "countByEnumeratingWithState:objects:count:", &v15, v14, 16);
      if (v8)
        continue;
      break;
    }
  }
  v12 = 0;
LABEL_14:
  pthread_rwlock_unlock(p_stateRWlock);
  return v12;
}

- (BOOL)optIntoExistingSubscribedStreams
{
  return self->_optIntoExistingSubscribedStreams;
}

uint64_t ___VCConnectionManagerIDS_SynchronizeParticipantGenerationCounter_block_invoke(uint64_t a1)
{
  return objc_msgSend((id)objc_msgSend(*(id *)(a1 + 32), "delegate"), "updateParticipantGenerationCounter:", *(unsigned __int8 *)(a1 + 40));
}

void ___VCConnectionManagerIDS_UpdateConnectionForDuplication_block_invoke(uint64_t a1)
{
  const void *v2;
  id v3;

  objc_msgSend((id)objc_msgSend(*(id *)(a1 + 32), "delegate"), "didEnableDuplication:activeConnection:", *(unsigned __int8 *)(a1 + 56), *(_QWORD *)(a1 + 40));
  if (*(_BYTE *)(a1 + 57) != 4)
  {
    v3 = objc_alloc_init(MEMORY[0x1E0C99E08]);
    objc_msgSend(*(id *)(a1 + 32), "addDuplicationConnectionUpdateTelemetryWithSuggestedLinkTypeCombo:payload:", *(_QWORD *)(a1 + 48));
    v2 = *(const void **)(a1 + 48);
    if (v2)
      CFRelease(v2);
    VCConnectionManager_AddLinkProbingTelemetry(*(_QWORD *)(a1 + 32));
    reportingGenericEvent();

  }
}

- (void)addConnection:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_6_5(&dword_1D8A54000, v0, v1, " [%s] %s:%d HandoverReport: %s received a nil VCConnection!", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

- (void)removeConnection:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_6_5(&dword_1D8A54000, v0, v1, " [%s] %s:%d HandoverReport: %s received a nil VCConnection!", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

- (void)updateSessionStats:.cold.1()
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
  OUTLINED_FUNCTION_0(&dword_1D8A54000, v0, v1, " [%s] %s:%d Connection is NIL", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

- (void)shouldReplaceConnection:withConnection:.cold.1()
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
  OUTLINED_FUNCTION_0(&dword_1D8A54000, v0, v1, " [%s] %s:%d HandoverReport: Should not call this to choose one of the connections!", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

@end
