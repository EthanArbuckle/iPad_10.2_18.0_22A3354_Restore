@implementation AVCMediaStreamNegotiatorSettingsNearbyScreenSharing

- (AVCMediaStreamNegotiatorSettingsNearbyScreenSharing)initWithOptions:(id)a3 deviceRole:(unsigned __int8)a4 error:(id *)a5
{
  int v6;
  AVCMediaStreamNegotiatorSettingsNearbyScreenSharing *v8;
  void *v9;
  VCVideoRuleCollectionsScreenAirplay *v10;
  NSMutableSet *v11;
  uint64_t v12;
  __CFString *v14;
  objc_super v15;
  uint64_t v16;

  v6 = a4;
  v16 = *MEMORY[0x1E0C80C00];
  v15.receiver = self;
  v15.super_class = (Class)AVCMediaStreamNegotiatorSettingsNearbyScreenSharing;
  v8 = -[AVCMediaStreamNegotiatorSettings initWithOptions:deviceRole:error:](&v15, sel_initWithOptions_deviceRole_error_);
  if (!v8)
    return v8;
  if (v6 == 1 && objc_msgSend(a3, "objectForKey:", CFSTR("AVCMediaStreamNegotiatorAccessNetworkType")))
  {
    v9 = (void *)objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("AVCMediaStreamNegotiatorAccessNetworkType"));
    if (!v9)
    {
      v14 = CFSTR("cannot get accessNetworkType from Init options");
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
      -[NSMutableSet addObject:](v11, "addObject:", &unk_1E9EF4D60);
      if (v6 == 1)
        v12 = 1;
      else
        v12 = 2;
      v8->super._mediaStreamDirection = v12;
      v8->super._shouldSetJitterBufferMode = 1;
      return v8;
    }
    v14 = CFSTR("_hdrModesSupported creation failed");
  }
  else
  {
    v14 = CFSTR("no _screenRuleCollections is created");
  }
LABEL_16:
  if (a5)
    *a5 = v14;

  return 0;
}

- (int64_t)videoStreamMode
{
  return 5;
}

- (int64_t)captureSource
{
  return 1;
}

- (int)operatingMode
{
  return 8;
}

- (unint64_t)maxBandwidth
{
  return 40000000;
}

- (BOOL)rtcpTimeOutEnabled
{
  return 1;
}

- (double)rtcpTimeOutInterval
{
  return 8.0;
}

- (double)rtcpSendInterval
{
  return 1.0;
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
