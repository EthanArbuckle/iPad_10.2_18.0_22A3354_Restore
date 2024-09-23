@implementation AVCMediaStreamNegotiatorSettingsAirplayMirroring

- (AVCMediaStreamNegotiatorSettingsAirplayMirroring)initWithOptions:(id)a3 deviceRole:(unsigned __int8)a4 error:(id *)a5
{
  int v6;
  AVCMediaStreamNegotiatorSettingsAirplayMirroring *v8;
  VCVideoRuleCollectionsScreenAirplay *v9;
  BOOL v10;
  uint64_t v11;
  objc_super v13;
  uint64_t v14;

  v6 = a4;
  v14 = *MEMORY[0x1E0C80C00];
  v13.receiver = self;
  v13.super_class = (Class)AVCMediaStreamNegotiatorSettingsAirplayMirroring;
  v8 = -[AVCMediaStreamNegotiatorSettings init](&v13, sel_init);
  if (v8)
  {
    v9 = +[VCVideoRuleCollectionsScreenAirplay sharedInstance](VCVideoRuleCollectionsScreenAirplay, "sharedInstance");
    v8->super._screenRuleCollections = &v9->super;
    if (v9)
    {
      v8->super._tilesPerFrame = +[VCVideoRuleCollectionsScreenAirplay tilesPerFrameForHDRMode:](VCVideoRuleCollectionsScreenAirplay, "tilesPerFrameForHDRMode:", +[AVCMediaStreamNegotiatorSettings hdrModeWithNegotiatorInitOptions:](AVCMediaStreamNegotiatorSettings, "hdrModeWithNegotiatorInitOptions:", a3));
      v10 = 1;
      if (v6 == 1)
        v11 = 1;
      else
        v11 = 2;
      v8->super._mediaStreamDirection = v11;
      v8->super._blackFrameOnClearScreenEnabledDefault = 1;
      if (v6 == 2)
        v10 = +[VCHardwareSettings deviceClass](VCHardwareSettings, "deviceClass") != 8;
      v8->super._blackFrameOnClearScreenEnabled = v10;
    }
    else
    {
      if (a5)
        *a5 = CFSTR("no _screenRuleCollections is created");

      return 0;
    }
  }
  return v8;
}

- (int64_t)videoStreamMode
{
  return 2;
}

- (int64_t)captureSource
{
  return 1;
}

- (int)operatingMode
{
  return 9;
}

- (unint64_t)maxBandwidth
{
  return 40000000;
}

- (unsigned)featureListStringType
{
  return 4;
}

@end
