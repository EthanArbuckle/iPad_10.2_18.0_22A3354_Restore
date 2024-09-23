@implementation VCConnectionIDS

- (void)setUpVTable
{
  self->super._vTable.isLocalOnCellular = _VCConnectionIDS_IsLocalOnCellular;
  self->super._vTable.isRemoteOnCellular = _VCConnectionIDS_IsRemoteOnCellular;
  self->super._vTable.matchesSourceDestinationInfo = _VCConnectionIDS_MatchesSourceDestinationInfo;
  self->super._vTable.sourceDestinationInfo = _VCConnectionIDS_SourceDestinationInfo;
  self->super._vTable.isRelay = _VCConnectionIDS_IsRelay;
  self->super._vTable.equal = _VCConnectionIDS_Equal;
  self->super._vTable.isIPv6 = _VCConnectionIDS_IsIPv6;
  self->super._vTable.localCellTech = _VCConnectionIDS_LocalCellTech;
  self->super._vTable.setLocalCellTech = _VCConnectionIDS_SetLocalCellTech;
  self->super._vTable.remoteCellTech = _VCConnectionIDS_RemoteCellTech;
  self->super._vTable.setRemoteCellTech = _VCConnectionIDS_SetRemoteCellTech;
  self->super._vTable.copyDescription = _VCConnectionIDS_CopyDescription;
  self->super._vTable.isLocalOnWiFiOrWired = _VCConnectionIDS_IsLocalOnWiFiOrWired;
  self->super._vTable.isRemoteOnWiFiOrWired = _VCConnectionIDS_IsRemoteOnWiFiOrWired;
  self->super._vTable.isLocalOnWiFi = _VCConnectionIDS_IsLocalOnWiFi;
  self->super._vTable.isRemoteOnWiFi = _VCConnectionIDS_IsRemoteOnWiFi;
  self->super._vTable.isLocalOnWired = _VCConnectionIDS_IsLocalOnWired;
  self->super._vTable.isRemoteOnWired = _VCConnectionIDS_IsRemoteOnWired;
  self->super._vTable.isOnSameInterfacesWithConnection = _VCConnectionIDS_IsOnSameInterfacesWithConnection;
  self->super._vTable.isEndToEndLink = _VCConnectionIDS_IsEndToEndLink;
  self->super._vTable.connectionID = _VCConnectionIDS_ConnectionID;
  self->super._vTable.isLocalExpensive = _VCConnectionIDS_IsLocalExpensive;
  self->super._vTable.isLocalConstrained = _VCConnectionIDS_IsLocalConstrained;
  self->super._vTable.isRemoteExpensive = _VCConnectionIDS_IsRemoteExpensive;
  self->super._vTable.isRemoteConstrained = _VCConnectionIDS_IsRemoteConstrained;
  self->super._vTable.reportingIPVersion = _VCConnectionIDS_ReportingIPVersion;
  self->super._vTable.reportingQRServerConfig = _VCConnectionIDS_ReportingQRServerConfig;
  self->super._vTable.isHopByHopEncryptionSupported = _VCConnectionIDS_IsHopByHopEncryptionSupported;
}

- (VCConnectionIDS)initWithLinkContext:(id)a3 dataChannelToken:(unsigned int)a4
{
  uint64_t v4;
  VCConnectionIDS *v6;
  VCConnectionIDS *v7;
  uint64_t v8;
  uint64_t v10;
  unsigned int v11;
  int v12;
  objc_super v14;
  uint64_t v15;

  v4 = *(_QWORD *)&a4;
  v15 = *MEMORY[0x1E0C80C00];
  v14.receiver = self;
  v14.super_class = (Class)VCConnectionIDS;
  v6 = -[VCConnection init](&v14, sel_init);
  v7 = v6;
  if (v6)
  {
    v6->super._connectionType = 2;
    v6->_linkContext = (IDSDataChannelLinkContext *)a3;
    v7->_datagramChannelToken = v4;
    v7->_datagramChannel = (VCDatagramChannelIDS *)-[VCDatagramChannelManager datagramChannelWithChannelToken:](+[VCDatagramChannelManager sharedInstance](VCDatagramChannelManager, "sharedInstance"), "datagramChannelWithChannelToken:", v4);
    v8 = -[VCDefaults localRATTypeOverride](+[VCDefaults sharedInstance](VCDefaults, "sharedInstance"), "localRATTypeOverride");
    if ((v8 + 1) <= 0xA && ((1 << (v8 + 1)) & 0x403) != 0)
      v8 = -[IDSDataChannelLinkContext RATType](v7->_linkContext, "RATType");
    v7->_localCellTech = VCConnectionIDSCellTechForRATType(v8);
    if (VCConnection_IsLocalOnCellular((uint64_t)v7))
      v7->_localCellTech = -[VCConnectionIDS cellTechForSoMask:fallbackTo:](v7, "cellTechForSoMask:fallbackTo:", -[IDSDataChannelLinkContext localDataSoMask](v7->_linkContext, "localDataSoMask"), v7->_localCellTech);
    v7->_isQUICPod = -[IDSDataChannelLinkContext isQUICPod](v7->_linkContext, "isQUICPod");
    v7->_remoteCellTech = VCConnectionIDSCellTechForRATType(-[IDSDataChannelLinkContext remoteRATType](v7->_linkContext, "remoteRATType"));
    if (VCConnection_IsRemoteOnCellular((uint64_t)v7))
      v7->_remoteCellTech = -[VCConnectionIDS cellTechForSoMask:fallbackTo:](v7, "cellTechForSoMask:fallbackTo:", -[IDSDataChannelLinkContext remoteDataSoMask](v7->_linkContext, "remoteDataSoMask"), v7->_remoteCellTech);
    v10 = -[IDSDataChannelLinkContext connectionType](v7->_linkContext, "connectionType");
    if ((unint64_t)(v10 - 1) > 4)
      v11 = 0;
    else
      v11 = dword_1D910D7A4[v10 - 1];
    v7->_type = v11;
    v7->_linkConnectionType = -[IDSDataChannelLinkContext connectionType](v7->_linkContext, "connectionType");
    v12 = -[IDSDataChannelLinkContext maxMTU](v7->_linkContext, "maxMTU");
    v7->_maxConnectionMTU = v12;
    v7->_connectionMTU = v12;
    -[VCConnection setLinkFlags:](v7, "setLinkFlags:", -[IDSDataChannelLinkContext localLinkFlags](v7->_linkContext, "localLinkFlags") & 2 | -[IDSDataChannelLinkContext localLinkFlags](v7->_linkContext, "localLinkFlags") & 1);
    -[VCConnection setRemoteLinkFlags:](v7, "setRemoteLinkFlags:", -[IDSDataChannelLinkContext remoteLinkFlags](v7->_linkContext, "remoteLinkFlags") & 2 | -[IDSDataChannelLinkContext remoteLinkFlags](v7->_linkContext, "remoteLinkFlags") & 1);
    v7->_isLocalDelegated = (-[IDSDataChannelLinkContext localLinkFlags](v7->_linkContext, "localLinkFlags") & 4) != 0;
    v7->_isRemoteDelegated = (-[IDSDataChannelLinkContext remoteLinkFlags](v7->_linkContext, "remoteLinkFlags") & 4) != 0;
    v7->_isVirtualRelayLink = -[IDSDataChannelLinkContext isVirtualRelayLink](v7->_linkContext, "isVirtualRelayLink");
    v7->_relayProtocolStackDescription = -[IDSDataChannelLinkContext relayProtocolStackDescription](v7->_linkContext, "relayProtocolStackDescription");
    v7->_channelDataBaseProtocolStackDescription = -[IDSDataChannelLinkContext channelDataBaseProtocolStackDescription](v7->_linkContext, "channelDataBaseProtocolStackDescription");
    v7->super._constantConnectionOverhead = -[IDSDataChannelLinkContext estimatedPerPacketConstantOverhead](v7->_linkContext, "estimatedPerPacketConstantOverhead");
  }
  return v7;
}

- (void)dealloc
{
  objc_super v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];

  v3.receiver = self;
  v3.super_class = (Class)VCConnectionIDS;
  -[VCConnection dealloc](&v3, sel_dealloc);
}

- (NSString)description
{
  return (NSString *)(id)_VCConnectionIDS_CopyDescription((uint64_t)self);
}

- (NSString)relaySessionToken
{
  return (NSString *)objc_msgSend((id)-[NSData __imHexString](-[IDSDataChannelLinkContext relaySessionToken](self->_linkContext, "relaySessionToken"), "__imHexString"), "lowercaseString");
}

- (NSData)sharedDigestKey
{
  return (NSData *)(id)-[NSData copy](-[IDSDataChannelLinkContext relaySessionKey](self->_linkContext, "relaySessionKey"), "copy");
}

- (BOOL)isLocalOn5G
{
  return (self->_localCellTech & 0xFFFFFFFE) == 8;
}

- (BOOL)isRemoteOn5G
{
  return (self->_remoteCellTech & 0xFFFFFFFE) == 8;
}

- (BOOL)isVPN
{
  return self->_isLocalDelegated || self->_isRemoteDelegated;
}

- (NSString)localInterfaceName
{
  if ((objc_opt_respondsToSelector() & 1) != 0)
    return (NSString *)-[IDSDataChannelLinkContext performSelector:](self->_linkContext, "performSelector:", sel_localInterfaceName);
  else
    return 0;
}

- (BOOL)isWifiToWifi
{
  int IsLocalExpensive;
  int IsRemoteExpensive;
  int IsLocalConstrained;
  int IsRemoteConstrained;
  BOOL v7;
  uint64_t v8;
  NSObject *v9;
  NSObject *v10;
  int v12;
  uint64_t v13;
  __int16 v14;
  const char *v15;
  __int16 v16;
  int v17;
  __int16 v18;
  int v19;
  __int16 v20;
  int v21;
  __int16 v22;
  _BOOL4 v23;
  __int16 v24;
  int v25;
  __int16 v26;
  int v27;
  __int16 v28;
  _BOOL4 v29;
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  IsLocalExpensive = VCConnection_IsLocalExpensive((uint64_t)self);
  IsRemoteExpensive = VCConnection_IsRemoteExpensive((uint64_t)self);
  IsLocalConstrained = VCConnection_IsLocalConstrained((uint64_t)self);
  IsRemoteConstrained = VCConnection_IsRemoteConstrained((uint64_t)self);
  v7 = ((IsLocalExpensive & 1) == 0 && !IsLocalConstrained
     || VCConnection_IsLocalOnWiFiOrWired((uint64_t)self))
    && (!(IsRemoteExpensive | IsRemoteConstrained) || VCConnection_IsRemoteOnWiFiOrWired((uint64_t)self));
  if ((int)VRTraceGetErrorLogLevelForModule() >= 8)
  {
    v8 = VRTraceErrorLogLevelToCSTR();
    v9 = *MEMORY[0x1E0CF2758];
    v10 = *MEMORY[0x1E0CF2758];
    if (*MEMORY[0x1E0CF2748])
    {
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
      {
        v12 = 136317186;
        v13 = v8;
        v14 = 2080;
        v15 = "-[VCConnectionIDS isWifiToWifi]";
        v16 = 1024;
        v17 = 272;
        v18 = 1024;
        v19 = IsLocalExpensive;
        v20 = 1024;
        v21 = IsLocalConstrained;
        v22 = 1024;
        v23 = -[VCConnectionIDS isLocalOn5G](self, "isLocalOn5G");
        v24 = 1024;
        v25 = IsRemoteExpensive;
        v26 = 1024;
        v27 = IsRemoteConstrained;
        v28 = 1024;
        v29 = -[VCConnectionIDS isRemoteOn5G](self, "isRemoteOn5G");
        _os_log_impl(&dword_1D8A54000, v9, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d [Local] Expensive %d, constraint %d, 5G %d. [Remote] Expensive %d, constraint %d, 5G %d", (uint8_t *)&v12, 0x40u);
      }
    }
    else if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
    {
      v12 = 136317186;
      v13 = v8;
      v14 = 2080;
      v15 = "-[VCConnectionIDS isWifiToWifi]";
      v16 = 1024;
      v17 = 272;
      v18 = 1024;
      v19 = IsLocalExpensive;
      v20 = 1024;
      v21 = IsLocalConstrained;
      v22 = 1024;
      v23 = -[VCConnectionIDS isLocalOn5G](self, "isLocalOn5G");
      v24 = 1024;
      v25 = IsRemoteExpensive;
      v26 = 1024;
      v27 = IsRemoteConstrained;
      v28 = 1024;
      v29 = -[VCConnectionIDS isRemoteOn5G](self, "isRemoteOn5G");
      _os_log_debug_impl(&dword_1D8A54000, v9, OS_LOG_TYPE_DEBUG, " [%s] %s:%d [Local] Expensive %d, constraint %d, 5G %d. [Remote] Expensive %d, constraint %d, 5G %d", (uint8_t *)&v12, 0x40u);
    }
  }
  return v7;
}

+ (id)VCConnectionIDS_RPS:(id)a3
{
  void *v3;

  if (a3)
  {
    v3 = (void *)*((_QWORD *)a3 + 41);
    if (v3)
      return v3;
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
        +[VCConnectionIDS VCConnectionIDS_RPS:].cold.2();
    }
  }
  else if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
  {
    VRTraceErrorLogLevelToCSTR();
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
      +[VCConnectionIDS VCConnectionIDS_RPS:].cold.1();
  }
  return &stru_1E9E58EE0;
}

+ (id)VCConnectionIDS_CDBPS:(id)a3
{
  void *v3;

  if (a3)
  {
    v3 = (void *)*((_QWORD *)a3 + 42);
    if (v3)
      return v3;
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
        +[VCConnectionIDS VCConnectionIDS_CDBPS:].cold.2();
    }
  }
  else if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
  {
    VRTraceErrorLogLevelToCSTR();
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
      +[VCConnectionIDS VCConnectionIDS_CDBPS:].cold.1();
  }
  return &stru_1E9E58EE0;
}

- (BOOL)serverIsDegraded
{
  return -[IDSDataChannelLinkContext serverIsDegraded](self->_linkContext, "serverIsDegraded");
}

- (id)connectionQRSessionID
{
  return -[IDSDataChannelLinkContext QRSessionID](self->_linkContext, "QRSessionID");
}

- (void)setConnectionMTU:(int)a3
{
  self->_connectionMTU = a3;
}

- (int)connectionMTU
{
  return self->_connectionMTU;
}

+ (unsigned)worstCaseNetworkOverheadInBytesWithNumOfStreamId:(int)a3 isPriorityIncluded:(BOOL)a4
{
  int v4;

  if (a4)
    v4 = 45;
  else
    v4 = 44;
  return ((a3 > 1) | (2 * a3)) + v4 + 56;
}

- (NSUUID)connectionUUID
{
  return -[IDSDataChannelLinkContext linkUUID](self->_linkContext, "linkUUID");
}

- (int)localConnectionType
{
  if ((VCConnection_IsLocalOnWiFiOrWired((uint64_t)self) & 1) != 0)
    return 3;
  VCConnection_LocalCellTech((uint64_t)self);
  return GetConnectionTypeFromCellTech();
}

- (int)remoteConnectionType
{
  if ((VCConnection_IsRemoteOnWiFiOrWired((uint64_t)self) & 1) != 0)
    return 3;
  VCConnection_RemoteCellTech((uint64_t)self);
  return GetConnectionTypeFromCellTech();
}

- (int64_t)linkConnectionType
{
  return self->_linkConnectionType;
}

- (NSString)localInterfaceTypeString
{
  VCConnection_IsLocalOnCellular((uint64_t)self);
  VCConnection_LocalCellTech((uint64_t)self);
  return (NSString *)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", CelltechToStr());
}

- (NSString)remoteInterfaceTypeString
{
  VCConnection_IsRemoteOnCellular((uint64_t)self);
  VCConnection_RemoteCellTech((uint64_t)self);
  return (NSString *)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", CelltechToStr());
}

- (void)setCellularMTU:(int)a3
{
  if (VCConnection_IsLocalOnCellular((uint64_t)self))
    self->_connectionMTU = a3;
}

- (unsigned)updateMaxConnectionMTU:(unsigned __int16)a3
{
  int v3;
  int connectionMTU;
  unsigned int v6;
  unsigned __int16 v7;
  int v8;
  BOOL v9;
  unsigned __int16 v10;
  uint64_t v11;
  NSObject *v12;
  int v14;
  uint64_t v15;
  __int16 v16;
  const char *v17;
  __int16 v18;
  int v19;
  __int16 v20;
  int v21;
  __int16 v22;
  int v23;
  __int16 v24;
  int IsLocalOnCellular;
  __int16 v26;
  int v27;
  uint64_t v28;

  v3 = a3;
  v28 = *MEMORY[0x1E0C80C00];
  if ((VCConnection_IsLocalOnCellular((uint64_t)self) & 1) != 0
    || VCConnection_IsRemoteOnCellular((uint64_t)self))
  {
    connectionMTU = self->_connectionMTU;
    v6 = VCConnection_IsIPv6((uint64_t)self) ? 1280 : 1450;
    v7 = (_WORD)connectionMTU ? connectionMTU : v3;
    v8 = v7;
    v9 = v7 >= v6 || v7 == 0;
    v10 = v9 ? v6 : v7;
    if (v10 != v3)
    {
      if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
      {
        v11 = VRTraceErrorLogLevelToCSTR();
        v12 = *MEMORY[0x1E0CF2758];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
        {
          v14 = 136316674;
          v15 = v11;
          v16 = 2080;
          v17 = "-[VCConnectionIDS updateMaxConnectionMTU:]";
          v18 = 1024;
          v19 = 460;
          v20 = 1024;
          v21 = v3;
          v22 = 1024;
          v23 = v10;
          v24 = 1024;
          IsLocalOnCellular = VCConnection_IsLocalOnCellular((uint64_t)self);
          v26 = 1024;
          v27 = v8;
          _os_log_impl(&dword_1D8A54000, v12, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d UpdateMTU MTU: %d -> %d Cellular: %d/%d", (uint8_t *)&v14, 0x34u);
        }
      }
      self->_maxConnectionMTU = v10;
      LOWORD(v3) = v10;
    }
  }
  return v3;
}

- (BOOL)isOnSameQRSessionWithConnection:(id)a3
{
  unint64_t v4;
  uint64_t v5;
  uint64_t v6;
  NSObject *v7;
  NSObject *v8;
  _BOOL4 v9;
  int v11;
  uint64_t v12;
  __int16 v13;
  const char *v14;
  __int16 v15;
  int v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  if (a3)
  {
    v4 = -[VCConnectionIDS connectionQRSessionID](self, "connectionQRSessionID");
    v5 = objc_msgSend(a3, "connectionQRSessionID");
    if (v4 && v5)
      LOBYTE(v5) = objc_msgSend((id)v4, "isEqual:", v5);
    else
      LOBYTE(v5) = (v4 | v5) == 0;
  }
  else
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 8)
    {
      v6 = VRTraceErrorLogLevelToCSTR();
      v7 = *MEMORY[0x1E0CF2758];
      v8 = *MEMORY[0x1E0CF2758];
      if (*MEMORY[0x1E0CF2748])
      {
        v9 = os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT);
        LOBYTE(v5) = 0;
        if (!v9)
          return v5;
        v11 = 136315650;
        v12 = v6;
        v13 = 2080;
        v14 = "-[VCConnectionIDS isOnSameQRSessionWithConnection:]";
        v15 = 1024;
        v16 = 490;
        _os_log_impl(&dword_1D8A54000, v7, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d VCConnection: connection to check is nil", (uint8_t *)&v11, 0x1Cu);
      }
      else
      {
        LODWORD(v5) = os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG);
        if (!(_DWORD)v5)
          return v5;
        -[VCConnectionIDS isOnSameQRSessionWithConnection:].cold.1();
      }
    }
    LOBYTE(v5) = 0;
  }
  return v5;
}

- (BOOL)isOnSameInterfacesAndQRSessionWithConnection:(id)a3
{
  int ErrorLogLevelForModule;
  _BYTE *v6;
  NSObject **v7;
  uint64_t v8;
  NSObject *v9;
  NSObject *v10;
  uint64_t v11;
  NSObject *v12;
  NSObject *v13;
  _BOOL4 v14;
  uint64_t v15;
  NSObject *v16;
  NSObject *v17;
  const char *v18;
  int v20;
  uint64_t v21;
  __int16 v22;
  const char *v23;
  __int16 v24;
  int v25;
  __int16 v26;
  const char *v27;
  __int16 v28;
  uint64_t v29;
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  ErrorLogLevelForModule = VRTraceGetErrorLogLevelForModule();
  if (!a3)
  {
    if (ErrorLogLevelForModule >= 8)
    {
      v11 = VRTraceErrorLogLevelToCSTR();
      v12 = *MEMORY[0x1E0CF2758];
      v13 = *MEMORY[0x1E0CF2758];
      if (*MEMORY[0x1E0CF2748])
      {
        LOBYTE(v14) = 0;
        if (!os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
          return v14;
        v20 = 136315650;
        v21 = v11;
        v22 = 2080;
        v23 = "-[VCConnectionIDS isOnSameInterfacesAndQRSessionWithConnection:]";
        v24 = 1024;
        v25 = 505;
        _os_log_impl(&dword_1D8A54000, v12, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d VCConnection: connection to check is nil", (uint8_t *)&v20, 0x1Cu);
      }
      else if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
      {
        -[VCConnectionIDS isOnSameInterfacesAndQRSessionWithConnection:].cold.1();
      }
    }
    LOBYTE(v14) = 0;
    return v14;
  }
  v6 = (_BYTE *)MEMORY[0x1E0CF2748];
  v7 = (NSObject **)MEMORY[0x1E0CF2758];
  if (ErrorLogLevelForModule >= 8)
  {
    v8 = VRTraceErrorLogLevelToCSTR();
    v9 = *v7;
    v10 = *v7;
    if (*v6)
    {
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
      {
        v20 = 136316162;
        v21 = v8;
        v22 = 2080;
        v23 = "-[VCConnectionIDS isOnSameInterfacesAndQRSessionWithConnection:]";
        v24 = 1024;
        v25 = 508;
        v26 = 2080;
        v27 = -[NSString UTF8String](-[VCConnectionIDS description](self, "description"), "UTF8String");
        v28 = 2080;
        v29 = objc_msgSend((id)objc_msgSend(a3, "description"), "UTF8String");
        _os_log_impl(&dword_1D8A54000, v9, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d VCConnection: isOnSameInterfacesAndQRSessionWithConnection: %s vs. %s", (uint8_t *)&v20, 0x30u);
      }
    }
    else if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
    {
      v20 = 136316162;
      v21 = v8;
      v22 = 2080;
      v23 = "-[VCConnectionIDS isOnSameInterfacesAndQRSessionWithConnection:]";
      v24 = 1024;
      v25 = 508;
      v26 = 2080;
      v27 = -[NSString UTF8String](-[VCConnectionIDS description](self, "description"), "UTF8String");
      v28 = 2080;
      v29 = objc_msgSend((id)objc_msgSend(a3, "description"), "UTF8String");
      _os_log_debug_impl(&dword_1D8A54000, v9, OS_LOG_TYPE_DEBUG, " [%s] %s:%d VCConnection: isOnSameInterfacesAndQRSessionWithConnection: %s vs. %s", (uint8_t *)&v20, 0x30u);
    }
  }
  if (VCConnection_IsOnSameInterfacesWithConnection((uint64_t)self))
    v14 = -[VCConnectionIDS isOnSameQRSessionWithConnection:](self, "isOnSameQRSessionWithConnection:", a3);
  else
    v14 = 0;
  if ((int)VRTraceGetErrorLogLevelForModule() >= 8)
  {
    v15 = VRTraceErrorLogLevelToCSTR();
    v16 = *v7;
    v17 = *v7;
    if (*v6)
    {
      if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
      {
        v18 = "NO";
        v21 = v15;
        v20 = 136315906;
        v23 = "-[VCConnectionIDS isOnSameInterfacesAndQRSessionWithConnection:]";
        v22 = 2080;
        if (v14)
          v18 = "YES";
        v24 = 1024;
        v25 = 510;
        v26 = 2080;
        v27 = v18;
        _os_log_impl(&dword_1D8A54000, v16, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d VCConnection: isOnSameInterfacesAndQRSessionWithConnection: %s", (uint8_t *)&v20, 0x26u);
      }
    }
    else if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
    {
      -[VCConnectionIDS isOnSameInterfacesAndQRSessionWithConnection:].cold.2(v15, v14, v16);
    }
  }
  return v14;
}

- (int)cellTechForSoMask:(unsigned int)a3 fallbackTo:(int)a4
{
  int v5;

  if ((a3 & 1) != 0)
    a4 = 5;
  if ((a3 & 8) != 0)
    v5 = 9;
  else
    v5 = a4;
  if ((a3 & 4) != 0)
    return 8;
  else
    return v5;
}

- (unsigned)datagramChannelToken
{
  return self->_datagramChannelToken;
}

- (VCDatagramChannelIDS)datagramChannel
{
  return self->_datagramChannel;
}

- (unsigned)type
{
  return self->_type;
}

- (unsigned)uplinkBitrateCap
{
  return self->_uplinkBitrateCap;
}

- (void)setUplinkBitrateCap:(unsigned int)a3
{
  self->_uplinkBitrateCap = a3;
}

- (unsigned)downlinkBitrateCap
{
  return self->_downlinkBitrateCap;
}

- (void)setDownlinkBitrateCap:(unsigned int)a3
{
  self->_downlinkBitrateCap = a3;
}

- (unsigned)uplinkAudioBitrateCapOneToOne
{
  return self->_uplinkAudioBitrateCapOneToOne;
}

- (void)setUplinkAudioBitrateCapOneToOne:(unsigned int)a3
{
  self->_uplinkAudioBitrateCapOneToOne = a3;
}

- (unsigned)uplinkBitrateCapOneToOne
{
  return self->_uplinkBitrateCapOneToOne;
}

- (void)setUplinkBitrateCapOneToOne:(unsigned int)a3
{
  self->_uplinkBitrateCapOneToOne = a3;
}

- (BOOL)isLocalDelegated
{
  return self->_isLocalDelegated;
}

- (BOOL)isRemoteDelegated
{
  return self->_isRemoteDelegated;
}

- (BOOL)isVirtualRelayLink
{
  return self->_isVirtualRelayLink;
}

- (int)maxConnectionMTU
{
  return self->_maxConnectionMTU;
}

- (void)setMaxConnectionMTU:(int)a3
{
  self->_maxConnectionMTU = a3;
}

- (BOOL)isQUICPod
{
  return self->_isQUICPod;
}

- (void)setIsQUICPod:(BOOL)a3
{
  self->_isQUICPod = a3;
}

- (NSString)relayProtocolStackDescription
{
  return (NSString *)objc_getProperty(self, a2, 328, 1);
}

- (void)setRelayProtocolStackDescription:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 328);
}

- (NSString)channelDataBaseProtocolStackDescription
{
  return (NSString *)objc_getProperty(self, a2, 336, 1);
}

- (void)setChannelDataBaseProtocolStackDescription:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 336);
}

+ (void)VCConnectionIDS_RPS:.cold.1()
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
  OUTLINED_FUNCTION_0(&dword_1D8A54000, v0, v1, " [%s] %s:%d Passed connection is nil", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

+ (void)VCConnectionIDS_RPS:.cold.2()
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
  OUTLINED_FUNCTION_0(&dword_1D8A54000, v0, v1, " [%s] %s:%d Relay protcol description has not been set yet", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

+ (void)VCConnectionIDS_CDBPS:.cold.1()
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
  OUTLINED_FUNCTION_0(&dword_1D8A54000, v0, v1, " [%s] %s:%d Passed connection is nil", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

+ (void)VCConnectionIDS_CDBPS:.cold.2()
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
  OUTLINED_FUNCTION_0(&dword_1D8A54000, v0, v1, " [%s] %s:%d Channel protocol description has not been set yet", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

- (void)isOnSameQRSessionWithConnection:.cold.1()
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
  OUTLINED_FUNCTION_2_3(&dword_1D8A54000, v0, v1, " [%s] %s:%d VCConnection: connection to check is nil", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

- (void)isOnSameInterfacesAndQRSessionWithConnection:.cold.1()
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
  OUTLINED_FUNCTION_2_3(&dword_1D8A54000, v0, v1, " [%s] %s:%d VCConnection: connection to check is nil", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

- (void)isOnSameInterfacesAndQRSessionWithConnection:(os_log_t)log .cold.2(uint64_t a1, char a2, os_log_t log)
{
  const char *v3;
  int v4;
  uint64_t v5;
  __int16 v6;
  const char *v7;
  __int16 v8;
  int v9;
  __int16 v10;
  const char *v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v3 = "NO";
  v5 = a1;
  v4 = 136315906;
  v7 = "-[VCConnectionIDS isOnSameInterfacesAndQRSessionWithConnection:]";
  v6 = 2080;
  v8 = 1024;
  v9 = 510;
  if ((a2 & 1) != 0)
    v3 = "YES";
  v10 = 2080;
  v11 = v3;
  _os_log_debug_impl(&dword_1D8A54000, log, OS_LOG_TYPE_DEBUG, " [%s] %s:%d VCConnection: isOnSameInterfacesAndQRSessionWithConnection: %s", (uint8_t *)&v4, 0x26u);
  OUTLINED_FUNCTION_3();
}

@end
