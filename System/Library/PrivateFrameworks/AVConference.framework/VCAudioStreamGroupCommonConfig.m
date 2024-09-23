@implementation VCAudioStreamGroupCommonConfig

- (void)dealloc
{
  objc_super v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];

  v3.receiver = self;
  v3.super_class = (Class)VCAudioStreamGroupCommonConfig;
  -[VCAudioStreamGroupCommonConfig dealloc](&v3, sel_dealloc);
}

- (int)processID
{
  return self->_processID;
}

- (void)setProcessID:(int)a3
{
  self->_processID = a3;
}

- (BOOL)isGKVoiceChat
{
  return self->_isGKVoiceChat;
}

- (void)setIsGKVoiceChat:(BOOL)a3
{
  self->_isGKVoiceChat = a3;
}

- (BOOL)isMuted
{
  return self->_isMuted;
}

- (void)setIsMuted:(BOOL)a3
{
  self->_isMuted = a3;
}

- (unsigned)preferredIOSampleRate
{
  return self->_preferredIOSampleRate;
}

- (void)setPreferredIOSampleRate:(unsigned int)a3
{
  self->_preferredIOSampleRate = a3;
}

- (unsigned)preferredIOSamplesPerFrame
{
  return self->_preferredIOSamplesPerFrame;
}

- (void)setPreferredIOSamplesPerFrame:(unsigned int)a3
{
  self->_preferredIOSamplesPerFrame = a3;
}

- (unsigned)audioSessionID
{
  return self->_audioSessionID;
}

- (void)setAudioSessionID:(unsigned int)a3
{
  self->_audioSessionID = a3;
}

- (void)didProcessSamplesCallback
{
  return self->_didProcessSamplesCallback;
}

- (void)setDidProcessSamplesCallback:(void *)a3
{
  self->_didProcessSamplesCallback = a3;
}

- (void)didProcessSamplesCallbackContext
{
  return self->_didProcessSamplesCallbackContext;
}

- (void)setDidProcessSamplesCallbackContext:(void *)a3
{
  self->_didProcessSamplesCallbackContext = a3;
}

- (int64_t)powerSpectrumStreamToken
{
  return self->_powerSpectrumStreamToken;
}

- (void)setPowerSpectrumStreamToken:(int64_t)a3
{
  self->_powerSpectrumStreamToken = a3;
}

- (unsigned)audioChannelIndex
{
  return self->_audioChannelIndex;
}

- (void)setAudioChannelIndex:(unsigned int)a3
{
  self->_audioChannelIndex = a3;
}

- (unint64_t)spatialAudioSourceID
{
  return self->_spatialAudioSourceID;
}

- (void)setSpatialAudioSourceID:(unint64_t)a3
{
  self->_spatialAudioSourceID = a3;
}

- (VCAudioCaptionsCoordinator)captionsCoordinator
{
  return self->_captionsCoordinator;
}

- (void)setCaptionsCoordinator:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 72);
}

@end
