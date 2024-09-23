@implementation AVCMediaStreamNegotiatorSettingsCoreDeviceSystemAudio

- (AVCMediaStreamNegotiatorSettingsCoreDeviceSystemAudio)initWithOptions:(id)a3 deviceRole:(unsigned __int8)a4 error:(id *)a5
{
  int v6;
  AVCMediaStreamNegotiatorSettingsCoreDeviceSystemAudio *v8;
  AVCMediaStreamNegotiatorSettingsCoreDeviceSystemAudio *v9;
  VCAudioRuleCollection *v10;
  void *v11;
  VCMediaNegotiatorAudioConfiguration *v12;
  uint64_t v13;
  __CFString *v15;
  objc_super v16;
  uint64_t v17;

  v6 = a4;
  v17 = *MEMORY[0x1E0C80C00];
  v16.receiver = self;
  v16.super_class = (Class)AVCMediaStreamNegotiatorSettingsCoreDeviceSystemAudio;
  v8 = -[AVCMediaStreamNegotiatorSettings init](&v16, sel_init);
  v9 = v8;
  if (!v8)
  {
    v10 = 0;
LABEL_13:

    return v9;
  }
  v8->_preferredAudioPayload = 101;
  v10 = -[VCAudioRuleCollection initWithPhoneContinuity:allowAudioSwitching:sbr:aacBlockSize:isLowLatencyAudio:]([VCAudioRuleCollection alloc], "initWithPhoneContinuity:allowAudioSwitching:sbr:aacBlockSize:isLowLatencyAudio:", 0, 0, 0, 480, 1);
  if (!v10)
  {

    v9 = 0;
    *a5 = CFSTR("audioRules init failed");
    goto LABEL_13;
  }
  if (v6 == 1 && objc_msgSend(a3, "objectForKey:", CFSTR("AVCMediaStreamNegotiatorAccessNetworkType")))
  {
    v11 = (void *)objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("AVCMediaStreamNegotiatorAccessNetworkType"));
    if (!v11)
    {
      v15 = CFSTR("cannot get accessNetworkType from Init options");
      goto LABEL_18;
    }
    v9->super._accessNetworkType = (int)objc_msgSend(v11, "intValue");
  }
  v12 = -[VCMediaNegotiatorAudioConfiguration initWithAllowAudioSwitching:allowAudioRecording:useSBR:ssrc:audioUnitNumber:audioRuleCollection:]([VCMediaNegotiatorAudioConfiguration alloc], "initWithAllowAudioSwitching:allowAudioRecording:useSBR:ssrc:audioUnitNumber:audioRuleCollection:", 0, 0, 0, v9->super._localSSRC, 0, v10);
  v9->super._audioConfiguration = v12;
  if (v12)
  {
    if (v6 == 1)
      v13 = 2;
    else
      v13 = 1;
    v9->super._mediaStreamDirection = v13;
    v9->super._shouldSetJitterBufferMode = 1;
    goto LABEL_13;
  }
  v15 = CFSTR("_audioConfiguration init failed");
LABEL_18:

  if (a5)
    *a5 = v15;

  return 0;
}

- (int)preferredAudioCodec
{
  return self->_preferredAudioPayload;
}

- (int64_t)audioStreamMode
{
  return 8;
}

- (int)operatingMode
{
  return 12;
}

- (unint64_t)audioChannelCount
{
  return 2;
}

- (unint64_t)ptime
{
  if (-[AVCMediaStreamNegotiatorSettings accessNetworkType](self, "accessNetworkType") == 1)
    return 10;
  else
    return 20;
}

- (unint64_t)preferredMediaBitRate
{
  if (-[AVCMediaStreamNegotiatorSettings accessNetworkType](self, "accessNetworkType") == 1)
    return 320000;
  else
    return 128000;
}

- (unsigned)jitterBufferMode
{
  return -[AVCMediaStreamNegotiatorSettings accessNetworkType](self, "accessNetworkType") != 1;
}

@end
