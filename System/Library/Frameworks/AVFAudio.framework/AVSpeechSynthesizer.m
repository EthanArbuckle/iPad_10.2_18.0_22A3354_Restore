@implementation AVSpeechSynthesizer

+ (void)initialize
{
  if (_AVLoadSpeechSynthesisImplementation(void)::onceToken != -1)
    dispatch_once(&_AVLoadSpeechSynthesisImplementation(void)::onceToken, &__block_literal_global_4333);
}

+ (AVSpeechSynthesisPersonalVoiceAuthorizationStatus)personalVoiceAuthorizationStatus
{
  return 2;
}

- (BOOL)stopSpeakingAtBoundary:(AVSpeechBoundary)boundary
{
  return 0;
}

- (BOOL)pauseSpeakingAtBoundary:(AVSpeechBoundary)boundary
{
  return 0;
}

- (BOOL)continueSpeaking
{
  return 0;
}

- (id)delegate
{
  return objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)delegate
{
  objc_storeWeak((id *)&self->_delegate, delegate);
}

- (BOOL)isSpeaking
{
  return self->_speaking;
}

- (BOOL)isPaused
{
  return self->_paused;
}

- (NSArray)outputChannels
{
  return self->_outputChannels;
}

- (void)setOutputChannels:(NSArray *)outputChannels
{
  objc_storeStrong((id *)&self->_outputChannels, outputChannels);
}

- (BOOL)usesApplicationAudioSession
{
  return self->_usesApplicationAudioSession;
}

- (void)setUsesApplicationAudioSession:(BOOL)usesApplicationAudioSession
{
  self->_usesApplicationAudioSession = usesApplicationAudioSession;
}

- (BOOL)mixToTelephonyUplink
{
  return self->_mixToTelephonyUplink;
}

- (void)setMixToTelephonyUplink:(BOOL)mixToTelephonyUplink
{
  self->_mixToTelephonyUplink = mixToTelephonyUplink;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_outputChannels, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

@end
