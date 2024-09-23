@implementation AVCMediaStreamNegotiatorSettingsRemoteMic

- (AVCMediaStreamNegotiatorSettingsRemoteMic)initWithOptions:(id)a3 deviceRole:(unsigned __int8)a4 error:(id *)a5
{
  int v6;
  AVCMediaStreamNegotiatorSettingsRemoteMic *v8;
  AVCMediaStreamNegotiatorSettingsRemoteMic *v9;
  VCAudioRuleCollection *v10;
  uint64_t v11;
  __CFString *v13;
  objc_super v14;
  uint64_t v15;

  v6 = a4;
  v15 = *MEMORY[0x1E0C80C00];
  v14.receiver = self;
  v14.super_class = (Class)AVCMediaStreamNegotiatorSettingsRemoteMic;
  v8 = -[AVCMediaStreamNegotiatorSettings init](&v14, sel_init);
  v9 = v8;
  if (!v8)
  {
    v10 = 0;
LABEL_12:

    return v9;
  }
  v8->_channelCount = 1;
  v10 = -[VCAudioRuleCollection initWithPhoneContinuity:allowAudioSwitching:sbr:aacBlockSize:isLowLatencyAudio:]([VCAudioRuleCollection alloc], "initWithPhoneContinuity:allowAudioSwitching:sbr:aacBlockSize:isLowLatencyAudio:", 0, 0, 0, 480, 1);
  if (v10)
  {
    v9->super._audioConfiguration = -[VCMediaNegotiatorAudioConfiguration initWithAllowAudioSwitching:allowAudioRecording:useSBR:ssrc:audioUnitNumber:audioRuleCollection:]([VCMediaNegotiatorAudioConfiguration alloc], "initWithAllowAudioSwitching:allowAudioRecording:useSBR:ssrc:audioUnitNumber:audioRuleCollection:", 0, 0, 0, v9->super._localSSRC, 0, v10);
    if (a3
      && objc_msgSend((id)objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("AVCMediaStreamNegotiatorRemoteMicChannelCount")), "intValue") == 4)
    {
      v9->_preferredAudioPayload = 119;
      v9->_channelCount = 4;
    }
    else
    {
      v9->_preferredAudioPayload = 101;
    }
    if (v9->super._audioConfiguration)
    {
      v11 = 1;
      if (v6 != 1)
        v11 = 2;
      v9->super._mediaStreamDirection = v11;
      goto LABEL_12;
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
  return 7;
}

- (int)operatingMode
{
  return 11;
}

- (unint64_t)ptime
{
  return 10;
}

@end
