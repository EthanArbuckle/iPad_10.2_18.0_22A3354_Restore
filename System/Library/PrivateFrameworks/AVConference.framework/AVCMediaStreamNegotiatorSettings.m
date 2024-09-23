@implementation AVCMediaStreamNegotiatorSettings

- (AVCMediaStreamNegotiatorSettings)init
{
  AVCMediaStreamNegotiatorSettings *v2;
  objc_super v4;
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  v4.receiver = self;
  v4.super_class = (Class)AVCMediaStreamNegotiatorSettings;
  v2 = -[AVCMediaStreamNegotiatorSettings init](&v4, sel_init);
  if (v2)
  {
    v2->_localSSRC = RTPGenerateSSRC();
    v2->_tilesPerFrame = 1;
  }
  return v2;
}

- (void)dealloc
{
  objc_super v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];

  v3.receiver = self;
  v3.super_class = (Class)AVCMediaStreamNegotiatorSettings;
  -[AVCMediaStreamNegotiatorSettings dealloc](&v3, sel_dealloc);
}

- (int64_t)videoStreamMode
{
  return -1;
}

- (int64_t)audioStreamMode
{
  return -1;
}

- (int64_t)captureSource
{
  return 2;
}

- (int)operatingMode
{
  objc_exception_throw((id)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s must be overridden in a subclass/category"), "-[AVCMediaStreamNegotiatorSettings operatingMode]"), 0));
}

- (int)preferredAudioCodec
{
  return 128;
}

- (unint64_t)ptime
{
  return 20;
}

- (unint64_t)minBandwidth
{
  return 20000000;
}

- (unint64_t)maxBandwidth
{
  return 20000000;
}

- (BOOL)rtcpTimeOutEnabled
{
  return 0;
}

- (double)rtcpTimeOutInterval
{
  return 0.0;
}

- (double)rtcpSendInterval
{
  return 5.0;
}

- (unsigned)jitterBufferMode
{
  return 0;
}

- (unint64_t)audioChannelCount
{
  return 1;
}

- (unint64_t)preferredMediaBitRate
{
  return 128000;
}

- (unsigned)featureListStringType
{
  return 0;
}

- (NSDictionary)featureListString
{
  return (NSDictionary *)+[VCVideoFeatureListStringHelper newLocalFeaturesStringWithType:](VCVideoFeatureListStringHelper, "newLocalFeaturesStringWithType:", -[AVCMediaStreamNegotiatorSettings featureListStringType](self, "featureListStringType"));
}

- (int)connectionType
{
  return 4;
}

+ (id)negotiatorSettingsForMode:(int64_t)a3 deviceRole:(unsigned __int8)a4 options:(id)a5 errorString:(id *)a6
{
  void *v8;
  void *v9;

  if ((unint64_t)(a3 - 1) >= 0xA)
  {
    v9 = (void *)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Failed to init AVCMediaStreamNegotiatorSettings for mode=%ld"), a4, a5, a3);
LABEL_5:
    v8 = 0;
    *a6 = v9;
    return v8;
  }
  v8 = (void *)objc_msgSend(objc_alloc(*off_1E9E56938[a3 - 1]), "initWithOptions:deviceRole:error:", a5, a4, a6);
  v9 = (void *)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Failed to init AVCMediaStreamNegotiatorSettings for mode=%ld"), a3);
  if (!v8)
    goto LABEL_5;
  return v8;
}

+ (unint64_t)hdrModeWithNegotiatorInitOptions:(id)a3
{
  unint64_t result;

  if (!a3)
    return 0;
  result = objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("AVCMediaStreamNegotiatorHDRMode"));
  if (result)
    return objc_msgSend((id)objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("AVCMediaStreamNegotiatorHDRMode")), "unsignedIntValue");
  return result;
}

- (VCVideoRuleCollections)videoRuleCollections
{
  return self->_videoRuleCollections;
}

- (VCVideoRuleCollections)screenRuleCollections
{
  return self->_screenRuleCollections;
}

- (VCMediaNegotiatorAudioConfiguration)audioConfiguration
{
  return self->_audioConfiguration;
}

- (unsigned)localSSRC
{
  return self->_localSSRC;
}

- (NSSet)hdrModesSupported
{
  return &self->_hdrModesSupported->super;
}

- (int64_t)mediaStreamDirection
{
  return self->_mediaStreamDirection;
}

- (BOOL)shouldSetJitterBufferMode
{
  return self->_shouldSetJitterBufferMode;
}

- (int64_t)accessNetworkType
{
  return self->_accessNetworkType;
}

- (void)setAccessNetworkType:(int64_t)a3
{
  self->_accessNetworkType = a3;
}

- (NSArray)hdrModePixelFormats
{
  return self->_hdrModePixelFormats;
}

- (int64_t)tilesPerFrame
{
  return self->_tilesPerFrame;
}

- (BOOL)shouldApply16AlignedAdjustment
{
  return self->_shouldApply16AlignedAdjustment;
}

- (BOOL)blackFrameOnClearScreenEnabled
{
  return self->_blackFrameOnClearScreenEnabled;
}

- (BOOL)blackFrameOnClearScreenEnabledDefault
{
  return self->_blackFrameOnClearScreenEnabledDefault;
}

- (NSString)audioDeviceUID
{
  return self->_audioDeviceUID;
}

@end
