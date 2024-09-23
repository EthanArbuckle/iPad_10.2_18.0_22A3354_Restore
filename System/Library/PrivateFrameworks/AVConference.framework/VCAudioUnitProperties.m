@implementation VCAudioUnitProperties

- (void)dealloc
{
  objc_super v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];

  v3.receiver = self;
  v3.super_class = (Class)VCAudioUnitProperties;
  -[VCAudioUnitProperties dealloc](&v3, sel_dealloc);
}

- (id)description
{
  unsigned int v3;
  const char *v4;
  __int128 v5;
  void *v6;
  id v7;
  uint64_t audioUnitType;
  char *v9;
  objc_super v11;
  char v12[16];
  __int128 v13;
  __int128 v14;
  __int128 v15;
  char __str[16];
  __int128 v17;
  __int128 v18;
  __int128 v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v3 = self->_audioUnitType - 1;
  if (v3 > 3)
    v4 = "unknown";
  else
    v4 = off_1E9E560B0[v3];
  *(_QWORD *)&v5 = 0xAAAAAAAAAAAAAAAALL;
  *((_QWORD *)&v5 + 1) = 0xAAAAAAAAAAAAAAAALL;
  v18 = v5;
  v19 = v5;
  *(_OWORD *)__str = v5;
  v17 = v5;
  *(_OWORD *)v12 = v5;
  v13 = v5;
  v14 = v5;
  v15 = v5;
  v6 = (void *)MEMORY[0x1E0CB3940];
  v11.receiver = self;
  v11.super_class = (Class)VCAudioUnitProperties;
  v7 = -[VCAudioUnitProperties description](&v11, sel_description);
  audioUnitType = self->_audioUnitType;
  v9 = FormatToCStr((uint64_t)&self->_frameFormatMic, __str, 0x40uLL);
  return (id)objc_msgSend(v6, "stringWithFormat:", CFSTR("%@ type=%s(%d) micFormat=%s, %u speakerFormat=%s, %u operatingRole=%d deviceRole=%d vpOperatingMode=%d vpEnableSpatialChat=%d audioRecording=%d enableDNNVAD=%d"), v7, v4, audioUnitType, v9, self->_frameFormatMic.samplesPerFrame, FormatToCStr((uint64_t)&self->_frameFormatSpeaker, v12, 0x40uLL), self->_frameFormatSpeaker.samplesPerFrame, self->_operatingMode, self->_deviceRole, self->_vpOperatingMode, self->_vpEnableSpatialChat, self->_allowAudioRecording, self->_enableDNNVAD);
}

- (VoiceIOFarEndVersionInfo)farEndVersionInfo
{
  __int128 v3;
  __int128 v4;
  __int128 v5;
  __int128 v6;

  v3 = *(_OWORD *)&self[1].farEndOSVersion[16];
  v4 = *(_OWORD *)&self[1].farEndOSVersion[48];
  *(_OWORD *)&retstr->farEndOSVersion[32] = *(_OWORD *)&self[1].farEndOSVersion[32];
  *(_OWORD *)&retstr->farEndOSVersion[48] = v4;
  retstr->farEndAUVersion = self[1].farEndAUVersion;
  v5 = *(_OWORD *)&self[1].farEndHwModel[16];
  v6 = *(_OWORD *)&self[1].farEndHwModel[48];
  *(_OWORD *)&retstr->farEndHwModel[32] = *(_OWORD *)&self[1].farEndHwModel[32];
  *(_OWORD *)&retstr->farEndHwModel[48] = v6;
  *(_OWORD *)retstr->farEndOSVersion = *(_OWORD *)self[1].farEndOSVersion;
  *(_OWORD *)&retstr->farEndOSVersion[16] = v3;
  *(_OWORD *)retstr->farEndHwModel = *(_OWORD *)self[1].farEndHwModel;
  *(_OWORD *)&retstr->farEndHwModel[16] = v5;
  return self;
}

- (void)setFarEndVersionInfo:(VoiceIOFarEndVersionInfo *)a3
{
  __int128 v3;
  __int128 v4;
  __int128 v5;
  __int128 v6;
  __int128 v7;
  __int128 v8;

  *(_OWORD *)self->_farEndVersionInfo.farEndHwModel = *(_OWORD *)a3->farEndHwModel;
  v3 = *(_OWORD *)&a3->farEndHwModel[16];
  v4 = *(_OWORD *)&a3->farEndHwModel[32];
  v5 = *(_OWORD *)&a3->farEndHwModel[48];
  *(_OWORD *)self->_farEndVersionInfo.farEndOSVersion = *(_OWORD *)a3->farEndOSVersion;
  *(_OWORD *)&self->_farEndVersionInfo.farEndHwModel[48] = v5;
  *(_OWORD *)&self->_farEndVersionInfo.farEndHwModel[32] = v4;
  *(_OWORD *)&self->_farEndVersionInfo.farEndHwModel[16] = v3;
  v6 = *(_OWORD *)&a3->farEndOSVersion[16];
  v7 = *(_OWORD *)&a3->farEndOSVersion[32];
  v8 = *(_OWORD *)&a3->farEndOSVersion[48];
  self->_farEndVersionInfo.farEndAUVersion = a3->farEndAUVersion;
  *(_OWORD *)&self->_farEndVersionInfo.farEndOSVersion[48] = v8;
  *(_OWORD *)&self->_farEndVersionInfo.farEndOSVersion[32] = v7;
  *(_OWORD *)&self->_farEndVersionInfo.farEndOSVersion[16] = v6;
  self->_isFarEndVersionInfoValid = 1;
}

- (tagVCAudioFrameFormat)frameFormatMic
{
  return &self->_frameFormatMic;
}

- (tagVCAudioFrameFormat)frameFormatSpeaker
{
  return &self->_frameFormatSpeaker;
}

- (unsigned)audioUnitType
{
  return self->_audioUnitType;
}

- (void)setAudioUnitType:(unsigned int)a3
{
  self->_audioUnitType = a3;
}

- (BOOL)allowAudioRecording
{
  return self->_allowAudioRecording;
}

- (void)setAllowAudioRecording:(BOOL)a3
{
  self->_allowAudioRecording = a3;
}

- (int)operatingMode
{
  return self->_operatingMode;
}

- (void)setOperatingMode:(int)a3
{
  self->_operatingMode = a3;
}

- (double)remoteCodecSampleRate
{
  return self->_remoteCodecSampleRate;
}

- (void)setRemoteCodecSampleRate:(double)a3
{
  self->_remoteCodecSampleRate = a3;
}

- (unsigned)remoteCodecType
{
  return self->_remoteCodecType;
}

- (void)setRemoteCodecType:(unsigned int)a3
{
  self->_remoteCodecType = a3;
}

- (unsigned)vpOperatingMode
{
  return self->_vpOperatingMode;
}

- (void)setVpOperatingMode:(unsigned int)a3
{
  self->_vpOperatingMode = a3;
}

- (BOOL)vpEnableSpatialChat
{
  return self->_vpEnableSpatialChat;
}

- (void)setVpEnableSpatialChat:(BOOL)a3
{
  self->_vpEnableSpatialChat = a3;
}

- (int)deviceRole
{
  return self->_deviceRole;
}

- (void)setDeviceRole:(int)a3
{
  self->_deviceRole = a3;
}

- (BOOL)isFarEndVersionInfoValid
{
  return self->_isFarEndVersionInfoValid;
}

- (BOOL)enableDNNVAD
{
  return self->_enableDNNVAD;
}

- (void)setEnableDNNVAD:(BOOL)a3
{
  self->_enableDNNVAD = a3;
}

- (VCAudioUnitSpatialContext)spatialContext
{
  return self->_spatialContext;
}

- (void)setSpatialContext:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 288);
}

- (unsigned)audioSessionId
{
  return self->_audioSessionId;
}

- (void)setAudioSessionId:(unsigned int)a3
{
  self->_audioSessionId = a3;
}

@end
