@implementation VCAudioRelayIOControllerSettings

- (VCAudioRelayIOControllerSettings)initWithAudioFormat:(const tagVCAudioFrameFormat *)a3 remoteCodecInfo:(const _VCRemoteCodecInfo *)a4
{
  VCAudioRelayIOControllerSettings *result;
  __int128 v7;
  __int128 v8;
  objc_super v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v9.receiver = self;
  v9.super_class = (Class)VCAudioRelayIOControllerSettings;
  result = -[VCAudioRelayIOControllerSettings init](&v9, sel_init);
  if (result)
  {
    v7 = *(_OWORD *)&a3->format.mSampleRate;
    v8 = *(_OWORD *)&a3->format.mBytesPerPacket;
    *(_OWORD *)&result->_audioFormat.format.mBitsPerChannel = *(_OWORD *)&a3->format.mBitsPerChannel;
    *(_OWORD *)&result->_audioFormat.format.mBytesPerPacket = v8;
    *(_OWORD *)&result->_audioFormat.format.mSampleRate = v7;
    result->_remoteCodecInfo = *a4;
  }
  return result;
}

- (const)audioFormat
{
  return &self->_audioFormat;
}

- (const)remoteCodecInfo
{
  return &self->_remoteCodecInfo;
}

@end
