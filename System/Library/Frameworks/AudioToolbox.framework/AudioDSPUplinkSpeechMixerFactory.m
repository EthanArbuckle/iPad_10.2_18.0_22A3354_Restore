@implementation AudioDSPUplinkSpeechMixerFactory

- (AudioDSPUplinkSpeechMixerFactory)init
{
  AudioDSPUplinkSpeechMixerFactory *result;
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)AudioDSPUplinkSpeechMixerFactory;
  result = -[AudioDSPUplinkSpeechMixerFactory init](&v3, sel_init);
  if (result)
  {
    result->_settings.streamDescription.mSampleRate = 24000.0;
    *(_OWORD *)&result->_settings.streamDescription.mFormatID = xmmword_1B6626900;
    *(_OWORD *)&result->_settings.streamDescription.mBytesPerFrame = xmmword_1B6626910;
    result->_settings.maximumFramesPerSlice = 480;
  }
  return result;
}

- (AudioStreamBasicDescription)streamDescription
{
  __int128 v3;

  v3 = *(_OWORD *)&self->mBytesPerFrame;
  *(_OWORD *)&retstr->mSampleRate = *(_OWORD *)&self->mFormatID;
  *(_OWORD *)&retstr->mBytesPerPacket = v3;
  *(Float64 *)&retstr->mBitsPerChannel = self[1].mSampleRate;
  return self;
}

- (void)setStreamDescription:(AudioStreamBasicDescription *)a3
{
  __int128 v3;
  __int128 v4;

  v3 = *(_OWORD *)&a3->mSampleRate;
  v4 = *(_OWORD *)&a3->mBytesPerPacket;
  *(_QWORD *)&self->_settings.streamDescription.mBitsPerChannel = *(_QWORD *)&a3->mBitsPerChannel;
  *(_OWORD *)&self->_settings.streamDescription.mBytesPerPacket = v4;
  *(_OWORD *)&self->_settings.streamDescription.mSampleRate = v3;
}

- (unsigned)maximumFramesPerSlice
{
  return self->_settings.maximumFramesPerSlice;
}

- (void)setMaximumFramesPerSlice:(unsigned int)a3
{
  self->_settings.maximumFramesPerSlice = a3;
}

- (id)createUplinkSpeechMixer
{
  AudioDSPUplinkSpeechMixer *v3;
  __int128 v4;
  _OWORD v6[3];

  v3 = [AudioDSPUplinkSpeechMixer alloc];
  v4 = *(_OWORD *)&self->_settings.streamDescription.mBytesPerPacket;
  v6[0] = *(_OWORD *)&self->_settings.streamDescription.mSampleRate;
  v6[1] = v4;
  v6[2] = *(_OWORD *)&self->_settings.streamDescription.mBitsPerChannel;
  return -[AudioDSPUplinkSpeechMixer initWithSettings:](v3, "initWithSettings:", v6);
}

@end
