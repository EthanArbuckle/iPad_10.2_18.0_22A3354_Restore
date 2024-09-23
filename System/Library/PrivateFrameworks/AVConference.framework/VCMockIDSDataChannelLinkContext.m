@implementation VCMockIDSDataChannelLinkContext

- (VCMockIDSDataChannelLinkContext)initWithSourcePort:(signed __int16)a3
{
  int v3;
  VCMockIDSDataChannelLinkContext *v4;
  int v5;
  uint64_t v6;
  NSObject *v7;
  uint64_t v8;
  NSObject *v9;
  int networkType;
  int remoteNetworkType;
  int localLinkFlags;
  int linkID;
  objc_super v15;
  uint8_t buf[4];
  uint64_t v17;
  __int16 v18;
  const char *v19;
  __int16 v20;
  int v21;
  __int16 v22;
  int v23;
  __int16 v24;
  int v25;
  __int16 v26;
  int v27;
  __int16 v28;
  int v29;
  __int16 v30;
  int v31;
  uint64_t v32;

  v3 = a3;
  v32 = *MEMORY[0x1E0C80C00];
  v15.receiver = self;
  v15.super_class = (Class)VCMockIDSDataChannelLinkContext;
  v4 = -[VCMockIDSDataChannelLinkContext init](&v15, sel_init);
  -[IDSDataChannelLinkContext initWithDummyInformation](v4, "initWithDummyInformation");
  v5 = objc_msgSend(+[VCTestMonitorManager sharedManager](VCTestMonitorManager, "sharedManager"), "forceNetworkCellular");
  v4->_forceNetworkCellular = v5;
  if (v5)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      v6 = VRTraceErrorLogLevelToCSTR();
      v7 = *MEMORY[0x1E0CF2758];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315650;
        v17 = v6;
        v18 = 2080;
        v19 = "-[VCMockIDSDataChannelLinkContext initWithSourcePort:]";
        v20 = 1024;
        v21 = 108;
        _os_log_impl(&dword_1D8A54000, v7, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d Mock IDS channel network type as cellular", buf, 0x1Cu);
      }
    }
  }
  v4->_networkType = VCDefaults_GetIntValueForKey(CFSTR("forceIDSLinkIPVersion"), 0);
  v4->_remoteNetworkType = VCDefaults_GetIntValueForKey(CFSTR("forceIDSLinkIPVersion"), 0);
  v4->_localLinkFlags = VCDefaults_GetIntValueForKey(CFSTR("forceIDSLocalLinkFlags"), 0);
  v4->_idsUPlusOneMode = 0;
  v4->_estimatedPerPacketConstantOverhead = 82;
  if (VCDefaults_GetBoolValueForKey(CFSTR("enableTestNetworkRouter"), 0))
    v4->_linkID = v3
                - 127
                * (((v3 + ((-32509 * v3) >> 16)) >> 6)
                 + (((v3 + ((-32509 * v3) >> 16)) & 0x8000) >> 15));
  if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
  {
    v8 = VRTraceErrorLogLevelToCSTR();
    v9 = *MEMORY[0x1E0CF2758];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
    {
      networkType = v4->_networkType;
      remoteNetworkType = v4->_remoteNetworkType;
      localLinkFlags = v4->_localLinkFlags;
      linkID = v4->_linkID;
      *(_DWORD *)buf = 136316930;
      v17 = v8;
      v18 = 2080;
      v19 = "-[VCMockIDSDataChannelLinkContext initWithSourcePort:]";
      v20 = 1024;
      v21 = 120;
      v22 = 1024;
      v23 = networkType;
      v24 = 1024;
      v25 = remoteNetworkType;
      v26 = 1024;
      v27 = localLinkFlags;
      v28 = 1024;
      v29 = linkID;
      v30 = 1024;
      v31 = v3;
      _os_log_impl(&dword_1D8A54000, v9, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d Mock IDS channel context forced _networkType=%u _remoteNetworkType=%u _localLinkFlags=%u _linkID=%u [sourcePort=%u]", buf, 0x3Au);
    }
  }
  return v4;
}

- (unsigned)RATType
{
  if (self->_forceNetworkCellular)
    return 5;
  else
    return 0;
}

- (unsigned)remoteRATType
{
  if (self->_forceNetworkCellular)
    return 5;
  else
    return 0;
}

- (int64_t)connectionType
{
  return 2;
}

- (BOOL)isVirtualRelayLink
{
  return self->_idsUPlusOneMode;
}

- (unsigned)estimatedPerPacketConstantOverhead
{
  return self->_estimatedPerPacketConstantOverhead;
}

- (BOOL)idsUPlusOneMode
{
  return self->_idsUPlusOneMode;
}

- (void)setIdsUPlusOneMode:(BOOL)a3
{
  self->_idsUPlusOneMode = a3;
}

- (unsigned)networkType
{
  return self->_networkType;
}

- (void)setNetworkType:(unsigned __int8)a3
{
  self->_networkType = a3;
}

- (unsigned)remoteNetworkType
{
  return self->_remoteNetworkType;
}

- (void)setRemoteNetworkType:(unsigned __int8)a3
{
  self->_remoteNetworkType = a3;
}

- (unsigned)localLinkFlags
{
  return self->_localLinkFlags;
}

- (char)linkID
{
  return self->_linkID;
}

@end
