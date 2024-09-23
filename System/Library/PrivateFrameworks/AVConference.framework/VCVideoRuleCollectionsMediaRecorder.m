@implementation VCVideoRuleCollectionsMediaRecorder

+ (id)sharedInstance
{
  return +[VCVideoRuleCollectionsMediaRecorderEmbeded sharedInstance](VCVideoRuleCollectionsMediaRecorderEmbeded, "sharedInstance");
}

- (VCVideoRuleCollectionsMediaRecorder)init
{
  VCVideoRuleCollectionsMediaRecorder *v2;
  unsigned int v3;
  int ErrorLogLevelForModule;
  os_log_t *v5;
  uint64_t v6;
  NSObject *v7;
  BOOL v8;
  BOOL v9;
  uint64_t v10;
  NSObject *v11;
  _BOOL4 isHEIFAndHEVCFormatEnabled;
  objc_super v14;
  uint8_t buf[4];
  uint64_t v16;
  __int16 v17;
  const char *v18;
  __int16 v19;
  int v20;
  __int16 v21;
  unsigned int v22;
  __int16 v23;
  unsigned int v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v14.receiver = self;
  v14.super_class = (Class)VCVideoRuleCollectionsMediaRecorder;
  v2 = -[VCVideoRuleCollectionsMediaRecorder init](&v14, sel_init);
  if (v2)
  {
    v3 = +[GKSConnectivitySettings getAbTestMasterLocalSwitches](GKSConnectivitySettings, "getAbTestMasterLocalSwitches") & 0x2000;
    ErrorLogLevelForModule = VRTraceGetErrorLogLevelForModule();
    v5 = (os_log_t *)MEMORY[0x1E0CF2758];
    if (ErrorLogLevelForModule >= 7)
    {
      v6 = VRTraceErrorLogLevelToCSTR();
      v7 = *v5;
      if (os_log_type_enabled(*v5, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315906;
        v16 = v6;
        v17 = 2080;
        v18 = "-[VCVideoRuleCollectionsMediaRecorder init]";
        v19 = 1024;
        v20 = 35;
        v21 = 1024;
        v22 = v3 >> 13;
        _os_log_impl(&dword_1D8A54000, v7, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d Load switch heifHevcLivePhotosEnabled %d", buf, 0x22u);
      }
    }
    v8 = -[VCDefaults enableHEIFAndHEVCForMoments](+[VCDefaults sharedInstance](VCDefaults, "sharedInstance"), "enableHEIFAndHEVCForMoments");
    if (v3)
      v9 = v8;
    else
      v9 = 0;
    v2->_isHEIFAndHEVCFormatEnabled = v9;
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      v10 = VRTraceErrorLogLevelToCSTR();
      v11 = *v5;
      if (os_log_type_enabled(*v5, OS_LOG_TYPE_DEFAULT))
      {
        isHEIFAndHEVCFormatEnabled = v2->_isHEIFAndHEVCFormatEnabled;
        *(_DWORD *)buf = 136316162;
        v16 = v10;
        v17 = 2080;
        v18 = "-[VCVideoRuleCollectionsMediaRecorder init]";
        v19 = 1024;
        v20 = 38;
        v21 = 1024;
        v22 = isHEIFAndHEVCFormatEnabled;
        v23 = 1024;
        v24 = v3 >> 13;
        _os_log_impl(&dword_1D8A54000, v11, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d Initializing media recorder rule collections with HEIF and HEVC enabled:%d and the storebag settings value was: %d", buf, 0x28u);
      }
    }
  }
  return v2;
}

- (unsigned)mediaRecorderCapabilities
{
  return 0;
}

- (id)mediaRecorderImageTypes
{
  return 0;
}

- (id)mediaRecorderVideoCodecs
{
  return 0;
}

@end
