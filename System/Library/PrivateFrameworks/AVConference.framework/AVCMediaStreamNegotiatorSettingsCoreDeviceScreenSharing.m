@implementation AVCMediaStreamNegotiatorSettingsCoreDeviceScreenSharing

- (AVCMediaStreamNegotiatorSettingsCoreDeviceScreenSharing)initWithOptions:(id)a3 deviceRole:(unsigned __int8)a4 error:(id *)a5
{
  int v6;
  AVCMediaStreamNegotiatorSettingsCoreDeviceScreenSharing *v8;
  void *v9;
  VCVideoRuleCollectionsScreenAirplay *v10;
  uint64_t v11;
  __CFString *v13;
  objc_super v14;
  uint64_t v15;

  v6 = a4;
  v15 = *MEMORY[0x1E0C80C00];
  v14.receiver = self;
  v14.super_class = (Class)AVCMediaStreamNegotiatorSettingsCoreDeviceScreenSharing;
  v8 = -[AVCMediaStreamNegotiatorSettings init](&v14, sel_init);
  if (!v8)
    return v8;
  if (v6 == 1 && objc_msgSend(a3, "objectForKey:", CFSTR("AVCMediaStreamNegotiatorAccessNetworkType")))
  {
    v9 = (void *)objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("AVCMediaStreamNegotiatorAccessNetworkType"));
    if (!v9)
    {
      v13 = CFSTR("cannot get accessNetworkType from Init options");
      goto LABEL_14;
    }
    v8->super._accessNetworkType = (int)objc_msgSend(v9, "intValue");
  }
  v10 = +[VCVideoRuleCollectionsScreenAirplay sharedInstance](VCVideoRuleCollectionsScreenAirplay, "sharedInstance");
  v8->super._screenRuleCollections = &v10->super;
  if (v10)
  {
    if (v6 == 1)
      v11 = 2;
    else
      v11 = 1;
    v8->super._mediaStreamDirection = v11;
    v8->super._shouldSetJitterBufferMode = 1;
    v8->super._shouldApply16AlignedAdjustment = 1;
    v8->super._blackFrameOnClearScreenEnabledDefault = 1;
    v8->super._blackFrameOnClearScreenEnabled = 1;
    return v8;
  }
  v13 = CFSTR("no _screenRuleCollections is created");
LABEL_14:
  if (a5)
    *a5 = v13;

  return 0;
}

- (int64_t)videoStreamMode
{
  return 4;
}

- (int64_t)captureSource
{
  return 1;
}

- (int)operatingMode
{
  return 6;
}

- (unint64_t)minBandwidth
{
  return 333000;
}

- (unint64_t)maxBandwidth
{
  return 6000000;
}

- (int)connectionType
{
  return 3;
}

- (unsigned)jitterBufferMode
{
  return -[AVCMediaStreamNegotiatorSettings accessNetworkType](self, "accessNetworkType") != 1;
}

- (id)featureListString
{
  uint64_t v3;
  void *v4;
  void *v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  v6 = 0;
  if (VCPCodecCopyProperties())
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
        -[AVCMediaStreamNegotiatorSettingsCoreDeviceScreenSharing featureListString].cold.2();
    }
    goto LABEL_14;
  }
  v3 = objc_opt_new();
  if (!v3)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
        -[AVCMediaStreamNegotiatorSettingsCoreDeviceScreenSharing featureListString].cold.1();
    }
LABEL_14:
    v4 = 0;
    goto LABEL_7;
  }
  v4 = (void *)v3;
  if (-[NSMutableArray containsObject:](-[VCVideoRuleCollections supportedPayloads](self->super._screenRuleCollections, "supportedPayloads"), "containsObject:", &unk_1E9EF4FD0))objc_msgSend(v4, "setObject:forKeyedSubscript:", objc_msgSend(0, "objectForKey:", CFSTR("VCPCodec_AVC1")), &unk_1E9EF4FD0);
  if (-[NSMutableArray containsObject:](-[VCVideoRuleCollections supportedPayloads](self->super._screenRuleCollections, "supportedPayloads", 0, v7), "containsObject:", &unk_1E9EF4FE8))objc_msgSend(v4, "setObject:forKeyedSubscript:", objc_msgSend(v6, "objectForKey:", CFSTR("VCPCodec_LRP")), &unk_1E9EF4FE8);
LABEL_7:

  return v4;
}

- (void)featureListString
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_1D8A54000, v0, v1, " [%s] %s:%d Failed to get feature list string from VCP", v2, v3, v4, v5, 2u);
}

@end
