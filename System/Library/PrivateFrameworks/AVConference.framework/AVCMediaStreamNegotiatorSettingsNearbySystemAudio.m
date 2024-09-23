@implementation AVCMediaStreamNegotiatorSettingsNearbySystemAudio

- (AVCMediaStreamNegotiatorSettingsNearbySystemAudio)initWithOptions:(id)a3 deviceRole:(unsigned __int8)a4 error:(id *)a5
{
  uint64_t v6;
  AVCMediaStreamNegotiatorSettingsNearbySystemAudio *v7;
  AVCMediaStreamNegotiatorSettingsNearbySystemAudio *v8;
  VCAudioRuleCollection *v9;
  VCMediaNegotiatorAudioConfiguration *v10;
  uint64_t v11;
  __CFString *v13;
  objc_super v14;
  uint64_t v15;

  v6 = a4;
  v15 = *MEMORY[0x1E0C80C00];
  v14.receiver = self;
  v14.super_class = (Class)AVCMediaStreamNegotiatorSettingsNearbySystemAudio;
  v7 = -[AVCMediaStreamNegotiatorSettings initWithOptions:deviceRole:error:](&v14, sel_initWithOptions_deviceRole_error_, a3);
  v8 = v7;
  if (!v7)
  {
    v9 = 0;
LABEL_9:

    return v8;
  }
  v7->_preferredAudioPayload = 101;
  v9 = -[VCAudioRuleCollection initWithPhoneContinuity:allowAudioSwitching:sbr:aacBlockSize:isLowLatencyAudio:]([VCAudioRuleCollection alloc], "initWithPhoneContinuity:allowAudioSwitching:sbr:aacBlockSize:isLowLatencyAudio:", 0, 0, 0, 480, 1);
  if (v9)
  {
    v8->super._accessNetworkType = 1;
    v10 = -[VCMediaNegotiatorAudioConfiguration initWithAllowAudioSwitching:allowAudioRecording:useSBR:ssrc:audioUnitNumber:audioRuleCollection:]([VCMediaNegotiatorAudioConfiguration alloc], "initWithAllowAudioSwitching:allowAudioRecording:useSBR:ssrc:audioUnitNumber:audioRuleCollection:", 0, 0, 0, v8->super._localSSRC, 0, v9);
    v8->super._audioConfiguration = v10;
    if (v10)
    {
      if ((_DWORD)v6 == 1)
        v11 = 1;
      else
        v11 = 2;
      v8->super._mediaStreamDirection = v11;
      v8->super._shouldSetJitterBufferMode = 1;
      -[AVCMediaStreamNegotiatorSettingsNearbySystemAudio setAudioDeviceUIDForDeviceRole:](v8, "setAudioDeviceUIDForDeviceRole:", v6);
      goto LABEL_9;
    }
    v13 = CFSTR("_audioConfiguration init failed");
  }
  else
  {
    v13 = CFSTR("audioRules init failed");
  }

  if (a5)
    *a5 = v13;

  return 0;
}

- (int)preferredAudioCodec
{
  return self->_preferredAudioPayload;
}

- (int64_t)audioStreamMode
{
  return 10;
}

- (int)operatingMode
{
  return 12;
}

- (unint64_t)ptime
{
  return 10;
}

- (unint64_t)preferredMediaBitRate
{
  return 320000;
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

- (unint64_t)audioChannelCount
{
  return 2;
}

@end
