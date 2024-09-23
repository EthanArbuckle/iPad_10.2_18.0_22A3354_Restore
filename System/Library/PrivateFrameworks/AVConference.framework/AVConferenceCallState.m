@implementation AVConferenceCallState

- (void)dealloc
{
  objc_super v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];

  v3.receiver = self;
  v3.super_class = (Class)AVConferenceCallState;
  -[AVConferenceCallState dealloc](&v3, sel_dealloc);
}

- (BOOL)isAudioPaused
{
  return self->_audioIsPaused;
}

- (void)setAudioIsPaused:(BOOL)a3
{
  self->_audioIsPaused = a3;
}

- (BOOL)isVideoPaused
{
  return self->_isVideoPaused;
}

- (void)setIsVideoPaused:(BOOL)a3
{
  self->_isVideoPaused = a3;
}

- (BOOL)isAudioSending
{
  return self->_isAudioSending;
}

- (void)setIsAudioSending:(BOOL)a3
{
  self->_isAudioSending = a3;
}

- (VCCapabilities)capabilities
{
  return self->_capabilities;
}

- (void)setCapabilities:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 16);
}

- (unsigned)relayedCallType
{
  return self->_relayedCallType;
}

- (void)setRelayedCallType:(unsigned __int8)a3
{
  self->_relayedCallType = a3;
}

@end
