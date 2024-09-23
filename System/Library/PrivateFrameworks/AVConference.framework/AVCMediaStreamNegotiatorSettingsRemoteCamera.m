@implementation AVCMediaStreamNegotiatorSettingsRemoteCamera

+ (BOOL)isOfferSupported
{
  return +[VCHardwareSettings isRemoteCameraSenderSupported](VCHardwareSettings, "isRemoteCameraSenderSupported");
}

- (AVCMediaStreamNegotiatorSettingsRemoteCamera)initWithOptions:(id)a3 deviceRole:(unsigned __int8)a4 error:(id *)a5
{
  int v6;
  AVCMediaStreamNegotiatorSettingsRemoteCamera *v8;
  VCVideoRuleCollectionsRemoteCamera *v9;
  uint64_t v10;
  uint64_t v11;
  unint64_t v12;
  uint64_t v13;
  uint64_t v14;
  __CFString *v15;
  objc_super v17;
  uint64_t v18;

  v6 = a4;
  v18 = *MEMORY[0x1E0C80C00];
  v17.receiver = self;
  v17.super_class = (Class)AVCMediaStreamNegotiatorSettingsRemoteCamera;
  v8 = -[AVCMediaStreamNegotiatorSettings init](&v17, sel_init);
  if (v8)
  {
    v9 = +[VCVideoRuleCollectionsRemoteCamera sharedInstance](VCVideoRuleCollectionsRemoteCamera, "sharedInstance");
    v8->super._videoRuleCollections = &v9->super;
    if (v9)
    {
      v8->super._tilesPerFrame = +[VCVideoRuleCollectionsRemoteCamera tilesPerFrame](VCVideoRuleCollectionsRemoteCamera, "tilesPerFrame");
      if (v6 == 2
        || v6 == 1
        && +[AVCMediaStreamNegotiatorSettingsRemoteCamera isOfferSupported](AVCMediaStreamNegotiatorSettingsRemoteCamera, "isOfferSupported"))
      {
        if (a3
          && objc_msgSend((id)objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("AVCMediaStreamNegotiatorRemoteCameraDisparityFormat")), "BOOLValue"))
        {
          v8->_isDisparityPixelFormat = 1;
        }
        v10 = 2;
        if (v6 == 1)
          v10 = 3;
        v8->_captureSource = v10;
        v11 = 1;
        if (v6 != 1)
          v11 = 2;
        v8->super._mediaStreamDirection = v11;
        v12 = +[AVCMediaStreamNegotiatorSettings hdrModeWithNegotiatorInitOptions:](AVCMediaStreamNegotiatorSettings, "hdrModeWithNegotiatorInitOptions:", a3);
        if (v12 > 1)
        {
          v15 = CFSTR("HDR mode is not supported");
        }
        else
        {
          if (v12 != 1)
            return v8;
          v13 = objc_msgSend(objc_alloc(MEMORY[0x1E0C99E20]), "initWithObjects:", &unk_1E9EF55A0, &unk_1E9EF55B8, 0);
          v8->super._hdrModesSupported = (NSMutableSet *)v13;
          if (v13)
          {
            v14 = objc_msgSend(objc_alloc(MEMORY[0x1E0C99D20]), "initWithObjects:", &unk_1E9EF55D0, 0);
            v8->super._hdrModePixelFormats = (NSArray *)v14;
            if (v14)
              return v8;
            v15 = CFSTR("Failed to create _hdrModePixelFormats");
          }
          else
          {
            v15 = CFSTR("Failed to create _hdrModesSupported");
          }
        }
      }
      else
      {
        v15 = CFSTR("Hardware does not support offerer device role");
      }
    }
    else
    {
      v15 = CFSTR("no _videoRuleCollections is created");
    }
    if (a5)
      *a5 = v15;

    return 0;
  }
  return v8;
}

- (int64_t)videoStreamMode
{
  return 3;
}

- (int64_t)captureSource
{
  return self->_captureSource;
}

- (int)operatingMode
{
  return 10;
}

- (unint64_t)minBandwidth
{
  if (self->_isDisparityPixelFormat)
    return 500000;
  else
    return 5000000;
}

- (unint64_t)maxBandwidth
{
  return 20000000;
}

- (unsigned)featureListStringType
{
  return 5;
}

@end
