@implementation AXMOutputManagerConfiguration

- (id)description
{
  void *v3;
  void *v4;
  unint64_t components;
  void *v6;
  void *v7;
  void *v8;

  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  components = self->_components;
  if ((components & 1) == 0)
  {
    if ((components & 2) == 0)
      goto LABEL_3;
LABEL_7:
    objc_msgSend(v4, "addObject:", CFSTR("Sounds"));
    if ((self->_components & 4) == 0)
      goto LABEL_5;
    goto LABEL_4;
  }
  objc_msgSend(v3, "addObject:", CFSTR("Speech"));
  components = self->_components;
  if ((components & 2) != 0)
    goto LABEL_7;
LABEL_3:
  if ((components & 4) != 0)
LABEL_4:
    objc_msgSend(v4, "addObject:", CFSTR("Haptics"));
LABEL_5:
  v6 = (void *)MEMORY[0x1E0CB3940];
  objc_msgSend(v4, "componentsJoinedByString:", CFSTR(", "));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "stringWithFormat:", CFSTR("[%@] usesPrivateAudioSession=%ld hapticEngineUsesAutoShutdown=%ld hapticEngineAutoShutdownTimeout=%.2f hapticEngineUsesHapticsOnly=%ld"), v7, self->_usesPrivateAudioSession, self->_hapticEngineUsesAutoShutdown, *(_QWORD *)&self->_hapticEngineAutoShutdownTimeout, self->_hapticEngineUsesHapticsOnly);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (unint64_t)components
{
  return self->_components;
}

- (void)setComponents:(unint64_t)a3
{
  self->_components = a3;
}

- (BOOL)usesPrivateAudioSession
{
  return self->_usesPrivateAudioSession;
}

- (void)setUsesPrivateAudioSession:(BOOL)a3
{
  self->_usesPrivateAudioSession = a3;
}

- (BOOL)hapticEngineUsesAutoShutdown
{
  return self->_hapticEngineUsesAutoShutdown;
}

- (void)setHapticEngineUsesAutoShutdown:(BOOL)a3
{
  self->_hapticEngineUsesAutoShutdown = a3;
}

- (double)hapticEngineAutoShutdownTimeout
{
  return self->_hapticEngineAutoShutdownTimeout;
}

- (void)setHapticEngineAutoShutdownTimeout:(double)a3
{
  self->_hapticEngineAutoShutdownTimeout = a3;
}

- (BOOL)hapticEngineUsesHapticsOnly
{
  return self->_hapticEngineUsesHapticsOnly;
}

- (void)setHapticEngineUsesHapticsOnly:(BOOL)a3
{
  self->_hapticEngineUsesHapticsOnly = a3;
}

@end
