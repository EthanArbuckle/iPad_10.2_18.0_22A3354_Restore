@implementation VCSessionBitrateArbiter

- (VCSessionBitrateArbiter)init
{
  VCSessionBitrateArbiter *v2;
  VCSessionBitrateArbiter *v3;
  objc_super v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  v5.receiver = self;
  v5.super_class = (Class)VCSessionBitrateArbiter;
  v2 = -[VCSessionBitrateArbiter init](&v5, sel_init);
  v3 = v2;
  if (v2)
  {
    -[VCSessionBitrateArbiter readHardwareValues](v2, "readHardwareValues");
    -[VCSessionBitrateArbiter readStoreBagValues](v3, "readStoreBagValues");
  }
  return v3;
}

- (void)dealloc
{
  objc_super v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];

  v3.receiver = self;
  v3.super_class = (Class)VCSessionBitrateArbiter;
  -[VCSessionBitrateArbiter dealloc](&v3, sel_dealloc);
}

- (BOOL)rangeCheck:(unsigned int)a3
{
  unsigned int v3;
  uint64_t v5;
  NSObject *v6;

  v3 = a3 - 100000;
  if (a3 - 100000 >= 0x5F98A9 && (int)VRTraceGetErrorLogLevelForModule() >= 3)
  {
    v5 = VRTraceErrorLogLevelToCSTR();
    v6 = *MEMORY[0x1E0CF2758];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
      -[VCSessionBitrateArbiter rangeCheck:].cold.1(v5, a3, v6);
  }
  return v3 < 0x5F98A9;
}

- (void)readHardwareValues
{
  *(_OWORD *)&self->_maxBitrate2GUplink = xmmword_1D910D8C0;
  *(_OWORD *)&self->_maxBitrateExpensiveUplink = xmmword_1D910D8D0;
  *(int32x2_t *)&self->_maxBitrateWiFiUplink = vdup_n_s32(0x611F48u);
}

- (unsigned)bitrateForStoreBagKey:(id)a3 connectionType:(int)a4 currentBitrate:(unsigned int)a5 isExpensive:(BOOL)a6
{
  _BOOL4 v6;
  uint64_t v11;
  int ErrorLogLevelForModule;
  uint64_t v13;
  NSObject *v14;
  uint64_t v15;
  NSObject *v16;
  int v18;
  uint64_t v19;
  __int16 v20;
  const char *v21;
  __int16 v22;
  int v23;
  __int16 v24;
  _BYTE v25[10];
  _BYTE v26[10];
  __int16 v27;
  int v28;
  uint64_t v29;

  v6 = a6;
  v29 = *MEMORY[0x1E0C80C00];
  v11 = 1000
      * objc_msgSend(-[NSDictionary objectForKeyedSubscript:](self->_currentSettings, "objectForKeyedSubscript:"), "intValue");
  if (-[VCSessionBitrateArbiter rangeCheck:](self, "rangeCheck:", v11))
  {
    ErrorLogLevelForModule = VRTraceGetErrorLogLevelForModule();
    if (!a5)
    {
      if (ErrorLogLevelForModule >= 7)
      {
        v15 = VRTraceErrorLogLevelToCSTR();
        v16 = *MEMORY[0x1E0CF2758];
        a5 = 0;
        if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
          return a5;
        v18 = 136316674;
        v19 = v15;
        v20 = 2080;
        v21 = "-[VCSessionBitrateArbiter bitrateForStoreBagKey:connectionType:currentBitrate:isExpensive:]";
        v22 = 1024;
        v23 = 96;
        v24 = 1024;
        *(_DWORD *)v25 = a4;
        *(_WORD *)&v25[4] = 1024;
        *(_DWORD *)&v25[6] = v6;
        *(_WORD *)v26 = 2112;
        *(_QWORD *)&v26[2] = a3;
        v27 = 1024;
        v28 = v11;
        _os_log_impl(&dword_1D8A54000, v16, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d Hardware does not support connection type %d isExpensive %d, ignored %@ storebag value of %d", (uint8_t *)&v18, 0x38u);
      }
      return 0;
    }
    if (ErrorLogLevelForModule >= 7)
    {
      v13 = VRTraceErrorLogLevelToCSTR();
      v14 = *MEMORY[0x1E0CF2758];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
      {
        v18 = 136316674;
        v19 = v13;
        v20 = 2080;
        v21 = "-[VCSessionBitrateArbiter bitrateForStoreBagKey:connectionType:currentBitrate:isExpensive:]";
        v22 = 1024;
        v23 = 93;
        v24 = 2112;
        *(_QWORD *)v25 = a3;
        *(_WORD *)&v25[8] = 1024;
        *(_DWORD *)v26 = a4;
        *(_WORD *)&v26[4] = 1024;
        *(_DWORD *)&v26[6] = v6;
        v27 = 1024;
        v28 = v11;
        _os_log_impl(&dword_1D8A54000, v14, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d Overriding %@ for connection type %d isExpensive %d with storebag value of %d", (uint8_t *)&v18, 0x38u);
      }
    }
    return v11;
  }
  return a5;
}

- (void)readStoreBagValues
{
  uint64_t v3;
  NSObject *v4;
  NSDictionary *currentSettings;
  const char *v6;
  int v7;
  uint64_t v8;
  __int16 v9;
  const char *v10;
  __int16 v11;
  int v12;
  __int16 v13;
  const char *v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  self->_currentSettings = (NSDictionary *)+[GKSConnectivitySettings getAllSettings](GKSConnectivitySettings, "getAllSettings");
  if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
  {
    v3 = VRTraceErrorLogLevelToCSTR();
    v4 = *MEMORY[0x1E0CF2758];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
    {
      currentSettings = self->_currentSettings;
      if (currentSettings)
        v6 = -[NSString UTF8String](-[NSDictionary description](currentSettings, "description"), "UTF8String");
      else
        v6 = "<nil>";
      v7 = 136315906;
      v8 = v3;
      v9 = 2080;
      v10 = "-[VCSessionBitrateArbiter readStoreBagValues]";
      v11 = 1024;
      v12 = 106;
      v13 = 2080;
      v14 = v6;
      _os_log_impl(&dword_1D8A54000, v4, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d Current bag settings: %s\n", (uint8_t *)&v7, 0x26u);
    }
  }
  self->_maxBitrate2GUplink = -[VCSessionBitrateArbiter bitrateForStoreBagKey:connectionType:currentBitrate:isExpensive:](self, "bitrateForStoreBagKey:connectionType:currentBitrate:isExpensive:", CFSTR("vc-max-bitrate-2g-uplink"), 0, self->_maxBitrate2GUplink, 1);
  self->_maxBitrate2GDownlink = -[VCSessionBitrateArbiter bitrateForStoreBagKey:connectionType:currentBitrate:isExpensive:](self, "bitrateForStoreBagKey:connectionType:currentBitrate:isExpensive:", CFSTR("vc-max-bitrate-2g-downlink"), 0, self->_maxBitrate2GDownlink, 1);
  self->_maxBitrate3GUplink = -[VCSessionBitrateArbiter bitrateForStoreBagKey:connectionType:currentBitrate:isExpensive:](self, "bitrateForStoreBagKey:connectionType:currentBitrate:isExpensive:", CFSTR("vc-max-bitrate-3g-uplink"), 1, self->_maxBitrate3GUplink, 1);
  self->_maxBitrate3GDownlink = -[VCSessionBitrateArbiter bitrateForStoreBagKey:connectionType:currentBitrate:isExpensive:](self, "bitrateForStoreBagKey:connectionType:currentBitrate:isExpensive:", CFSTR("vc-max-bitrate-3g-downlink"), 1, self->_maxBitrate3GDownlink, 1);
  self->_maxBitrateExpensiveUplink = -[VCSessionBitrateArbiter bitrateForStoreBagKey:connectionType:currentBitrate:isExpensive:](self, "bitrateForStoreBagKey:connectionType:currentBitrate:isExpensive:", CFSTR("vc-max-bitrate-lte-uplink"), 2, self->_maxBitrateExpensiveUplink, 1);
  self->_maxBitrateNonExpensiveUplink = -[VCSessionBitrateArbiter bitrateForStoreBagKey:connectionType:currentBitrate:isExpensive:](self, "bitrateForStoreBagKey:connectionType:currentBitrate:isExpensive:", CFSTR("vc-max-bitrate-nonexpensive-uplink"), 6, self->_maxBitrateNonExpensiveUplink, 0);
  self->_maxBitrateExpensiveDownlink = -[VCSessionBitrateArbiter bitrateForStoreBagKey:connectionType:currentBitrate:isExpensive:](self, "bitrateForStoreBagKey:connectionType:currentBitrate:isExpensive:", CFSTR("vc-max-bitrate-lte-downlink"), 2, self->_maxBitrateExpensiveDownlink, 1);
  self->_maxBitrateNonExpensiveDownlink = -[VCSessionBitrateArbiter bitrateForStoreBagKey:connectionType:currentBitrate:isExpensive:](self, "bitrateForStoreBagKey:connectionType:currentBitrate:isExpensive:", CFSTR("vc-max-bitrate-nonexpensive-downlink"), 6, self->_maxBitrateNonExpensiveDownlink, 0);
  if ((VRTraceIsInternalOSInstalled() & 1) == 0)
    self->_maxBitrateWiFiUplink = -[VCSessionBitrateArbiter bitrateForStoreBagKey:connectionType:currentBitrate:isExpensive:](self, "bitrateForStoreBagKey:connectionType:currentBitrate:isExpensive:", CFSTR("vc-max-bitrate-wifi-uplink"), 3, self->_maxBitrateWiFiUplink, 0);
  self->_maxBitrateWiFiDownlink = -[VCSessionBitrateArbiter bitrateForStoreBagKey:connectionType:currentBitrate:isExpensive:](self, "bitrateForStoreBagKey:connectionType:currentBitrate:isExpensive:", CFSTR("vc-max-bitrate-wifi-downlink"), 3, self->_maxBitrateWiFiDownlink, 0);
}

- (unsigned)maxBitrate2GUplink
{
  return self->_maxBitrate2GUplink;
}

- (unsigned)maxBitrate3GUplink
{
  return self->_maxBitrate3GUplink;
}

- (unsigned)maxBitrateWiFiUplink
{
  return self->_maxBitrateWiFiUplink;
}

- (unsigned)maxBitrate2GDownlink
{
  return self->_maxBitrate2GDownlink;
}

- (unsigned)maxBitrate3GDownlink
{
  return self->_maxBitrate3GDownlink;
}

- (unsigned)maxBitrateWiFiDownlink
{
  return self->_maxBitrateWiFiDownlink;
}

- (unsigned)maxBitrateExpensiveUplink
{
  return self->_maxBitrateExpensiveUplink;
}

- (unsigned)maxBitrateNonExpensiveUplink
{
  return self->_maxBitrateNonExpensiveUplink;
}

- (unsigned)maxBitrateExpensiveDownlink
{
  return self->_maxBitrateExpensiveDownlink;
}

- (unsigned)maxBitrateNonExpensiveDownlink
{
  return self->_maxBitrateNonExpensiveDownlink;
}

- (void)rangeCheck:(os_log_t)log .cold.1(uint64_t a1, int a2, os_log_t log)
{
  int v3;
  uint64_t v4;
  __int16 v5;
  const char *v6;
  __int16 v7;
  int v8;
  __int16 v9;
  int v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v3 = 136315906;
  v4 = a1;
  v5 = 2080;
  v6 = "-[VCSessionBitrateArbiter rangeCheck:]";
  v7 = 1024;
  v8 = 66;
  v9 = 1024;
  v10 = a2;
  _os_log_error_impl(&dword_1D8A54000, log, OS_LOG_TYPE_ERROR, " [%s] %s:%d VCSessionBitrateArbiter: value %d failed bitrate range check, ignored", (uint8_t *)&v3, 0x22u);
}

@end
