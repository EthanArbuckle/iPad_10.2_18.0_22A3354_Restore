@implementation AVCMediaStreamNegotiatorSettingsRemoteDesktopScreenSharing

- (AVCMediaStreamNegotiatorSettingsRemoteDesktopScreenSharing)initWithOptions:(id)a3 deviceRole:(unsigned __int8)a4 error:(id *)a5
{
  int v6;
  AVCMediaStreamNegotiatorSettingsRemoteDesktopScreenSharing *v8;
  void *v9;
  VCVideoRuleCollectionsScreenAirplay *v10;
  NSMutableSet *v11;
  unint64_t v12;
  uint64_t v13;
  __CFString *v15;
  objc_super v16;
  uint64_t v17;

  v6 = a4;
  v17 = *MEMORY[0x1E0C80C00];
  v16.receiver = self;
  v16.super_class = (Class)AVCMediaStreamNegotiatorSettingsRemoteDesktopScreenSharing;
  v8 = -[AVCMediaStreamNegotiatorSettings init](&v16, sel_init);
  if (!v8)
    return v8;
  if (v6 == 1 && objc_msgSend(a3, "objectForKey:", CFSTR("AVCMediaStreamNegotiatorAccessNetworkType")))
  {
    v9 = (void *)objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("AVCMediaStreamNegotiatorAccessNetworkType"));
    if (!v9)
    {
      v15 = CFSTR("cannot get accessNetworkType from Init options");
      goto LABEL_16;
    }
    v8->super._accessNetworkType = (int)objc_msgSend(v9, "intValue");
  }
  v10 = +[VCVideoRuleCollectionsScreenAirplay sharedInstance](VCVideoRuleCollectionsScreenAirplay, "sharedInstance");
  v8->super._screenRuleCollections = &v10->super;
  if (v10)
  {
    v8->super._tilesPerFrame = 4;
    v11 = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E0C99E20]);
    v8->super._hdrModesSupported = v11;
    if (v11)
    {
      -[NSMutableSet addObject:](v11, "addObject:", &unk_1E9EF6A58);
      v12 = +[AVCMediaStreamNegotiatorSettings hdrModeWithNegotiatorInitOptions:](AVCMediaStreamNegotiatorSettings, "hdrModeWithNegotiatorInitOptions:", a3);
      -[NSMutableSet addObject:](v8->super._hdrModesSupported, "addObject:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v12));
      if (v6 == 1)
        v13 = 2;
      else
        v13 = 1;
      v8->super._mediaStreamDirection = v13;
      v8->super._shouldSetJitterBufferMode = 1;
      v8->super._blackFrameOnClearScreenEnabledDefault = 1;
      v8->super._blackFrameOnClearScreenEnabled = 1;
      return v8;
    }
    v15 = CFSTR("_hdrModesSupported creation failed");
  }
  else
  {
    v15 = CFSTR("no _screenRuleCollections is created");
  }
LABEL_16:
  if (a5)
    *a5 = v15;

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
  return 9;
}

- (unint64_t)minBandwidth
{
  return 20000000;
}

- (unint64_t)maxBandwidth
{
  return 60000000;
}

- (BOOL)rtcpTimeOutEnabled
{
  return 1;
}

- (double)rtcpTimeOutInterval
{
  return 3.0;
}

- (double)rtcpSendInterval
{
  return 1.0;
}

- (int)connectionType
{
  return 7;
}

- (unsigned)jitterBufferMode
{
  return 0;
}

- (unsigned)featureListStringType
{
  return 4;
}

@end
