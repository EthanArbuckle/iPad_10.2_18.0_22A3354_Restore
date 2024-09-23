@implementation VCVideoRuleCollectionsMediaRecorderEmbeded

- (VCVideoRuleCollectionsMediaRecorderEmbeded)initWithHardwareSettings:(id)a3
{
  VCVideoRuleCollectionsMediaRecorderEmbeded *result;
  objc_super v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  v5.receiver = self;
  v5.super_class = (Class)VCVideoRuleCollectionsMediaRecorderEmbeded;
  result = -[VCVideoRuleCollectionsMediaRecorder init](&v5, sel_init);
  if (result)
    result->_hardwareSettings = (VCHardwareSettingsEmbeddedProtocol *)a3;
  return result;
}

+ (id)sharedInstance
{
  void *v2;

  v2 = (void *)objc_opt_class();
  objc_sync_enter(v2);
  if (!sharedInstance__videoRulesCollections_22)
    sharedInstance__videoRulesCollections_22 = -[VCVideoRuleCollectionsMediaRecorderEmbeded initWithHardwareSettings:]([VCVideoRuleCollectionsMediaRecorderEmbeded alloc], "initWithHardwareSettings:", +[VCHardwareSettingsEmbedded sharedInstance](VCHardwareSettingsEmbedded, "sharedInstance"));
  objc_sync_exit(v2);
  return (id)sharedInstance__videoRulesCollections_22;
}

- (unsigned)mediaRecorderCapabilities
{
  if (-[VCVideoRuleCollectionsMediaRecorderEmbeded isSupportedDeviceClass](self, "isSupportedDeviceClass")
    && -[VCVideoRuleCollectionsMediaRecorderEmbeded isSupportedChipID](self, "isSupportedChipID"))
  {
    return 2;
  }
  else
  {
    return 0;
  }
}

- (id)mediaRecorderImageTypes
{
  void *v3;
  void *v4;

  if (!-[VCVideoRuleCollectionsMediaRecorderEmbeded isSupportedDeviceClass](self, "isSupportedDeviceClass")
    || !-[VCVideoRuleCollectionsMediaRecorderEmbeded isSupportedChipID](self, "isSupportedChipID"))
  {
    return 0;
  }
  v3 = (void *)objc_msgSend(MEMORY[0x1E0C99E20], "setWithObjects:", &unk_1E9EF56C0, 0);
  v4 = v3;
  if (self->super._isHEIFAndHEVCFormatEnabled)
    objc_msgSend(v3, "addObject:", &unk_1E9EF56D8);
  return v4;
}

- (id)mediaRecorderVideoCodecs
{
  void *v3;

  if (!-[VCVideoRuleCollectionsMediaRecorderEmbeded isSupportedDeviceClass](self, "isSupportedDeviceClass")
    || !-[VCVideoRuleCollectionsMediaRecorderEmbeded isSupportedChipID](self, "isSupportedChipID"))
  {
    return 0;
  }
  v3 = (void *)objc_msgSend(MEMORY[0x1E0C99E20], "setWithObjects:", &unk_1E9EF5690, 0);
  if (-[VCHardwareSettingsEmbeddedProtocol supportHEVC](self->_hardwareSettings, "supportHEVC")
    && self->super._isHEIFAndHEVCFormatEnabled)
  {
    objc_msgSend(v3, "addObject:", &unk_1E9EF56A8);
  }
  return v3;
}

- (BOOL)isSupportedDeviceClass
{
  VCHardwareSettingsEmbeddedProtocol **p_hardwareSettings;
  uint64_t v3;
  uint64_t v4;
  NSObject *v5;
  _BOOL4 v6;

  p_hardwareSettings = &self->_hardwareSettings;
  v3 = -[VCHardwareSettingsEmbeddedProtocol deviceClass](self->_hardwareSettings, "deviceClass");
  if ((unint64_t)(v3 - 1) < 8 && ((0x8Fu >> (v3 - 1)) & 1) != 0)
  {
    LOBYTE(v6) = 1;
    return v6;
  }
  if ((int)VRTraceGetErrorLogLevelForModule() < 3)
    goto LABEL_6;
  v4 = VRTraceErrorLogLevelToCSTR();
  v5 = *MEMORY[0x1E0CF2758];
  v6 = os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR);
  if (v6)
  {
    -[VCVideoRuleCollectionsMediaRecorderEmbeded isSupportedDeviceClass].cold.1(v4, (id *)p_hardwareSettings, v5);
LABEL_6:
    LOBYTE(v6) = 0;
  }
  return v6;
}

- (BOOL)isSupportedChipID
{
  uint64_t v2;

  v2 = -[VCHardwareSettingsEmbeddedProtocol chipId](self->_hardwareSettings, "chipId");
  return v2 != 35152 && v2 != 35157;
}

- (void)isSupportedDeviceClass
{
  int v5;
  int v6;
  uint64_t v7;
  __int16 v8;
  const char *v9;
  __int16 v10;
  int v11;
  __int16 v12;
  int v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v5 = objc_msgSend(*a2, "deviceClass");
  v6 = 136315906;
  v7 = a1;
  v8 = 2080;
  v9 = "-[VCVideoRuleCollectionsMediaRecorderEmbeded isSupportedDeviceClass]";
  v10 = 1024;
  v11 = 167;
  v12 = 1024;
  v13 = v5;
  _os_log_error_impl(&dword_1D8A54000, a3, OS_LOG_TYPE_ERROR, " [%s] %s:%d No media recorder supported for device class %d", (uint8_t *)&v6, 0x22u);
}

@end
