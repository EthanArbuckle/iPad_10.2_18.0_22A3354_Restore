@implementation AVAudioInputNode

- (float)rate
{
  std::recursive_mutex *v3;
  char v4;
  std::recursive_mutex *v5;
  char v6;

  AVAudioNodeImplBase::GetAttachAndEngineLock((AVAudioNodeImplBase *)&v3, (uint64_t)self->super.super._impl);
  if (v6)
    std::recursive_mutex::unlock(v5);
  if (v4)
    std::recursive_mutex::unlock(v3);
  return 1.0;
}

- (BOOL)setManualRenderingInputPCMFormat:(AVAudioFormat *)format inputBlock:(AVAudioIONodeInputBlock)block
{
  char v7;
  std::recursive_mutex *v9;
  char v10;
  std::recursive_mutex *v11;
  char v12;

  AVAudioNodeImplBase::GetAttachAndEngineLock((AVAudioNodeImplBase *)&v9, (uint64_t)self->super.super._impl);
  if (-[AVAudioIONode isInManualRenderingMode](self, "isInManualRenderingMode"))
    v7 = AVAudioEngineImpl::SetInputNodeRenderCallback(*(AVAudioNodeImplBase ***)(-[AVAudioEngine implementation](-[AVAudioNode engine](self, "engine"), "implementation")+ 8), (uint64_t)format, (uint64_t)block);
  else
    v7 = 0;
  if (v12)
    std::recursive_mutex::unlock(v11);
  if (v10)
    std::recursive_mutex::unlock(v9);
  return v7;
}

- (BOOL)isVoiceProcessingBypassed
{
  BOOL v3;
  int v5;
  std::recursive_mutex *v6;
  char v7;
  std::recursive_mutex *v8;
  char v9;

  AVAudioNodeImplBase::GetAttachAndEngineLock((AVAudioNodeImplBase *)&v6, (uint64_t)self->super.super._impl);
  if (-[AVAudioIONode isVoiceProcessingEnabled](self, "isVoiceProcessingEnabled"))
  {
    v5 = 0;
    (*(void (**)(void *, uint64_t, _QWORD, uint64_t, int *, uint64_t))(*(_QWORD *)self->super.super._impl + 152))(self->super.super._impl, 2100, 0, 1, &v5, 4);
    v3 = v5 != 0;
  }
  else
  {
    v3 = 0;
  }
  if (v9)
    std::recursive_mutex::unlock(v8);
  if (v7)
    std::recursive_mutex::unlock(v6);
  return v3;
}

- (void)setVoiceProcessingBypassed:(BOOL)voiceProcessingBypassed
{
  _BOOL4 v3;
  _BOOL4 v5;
  std::recursive_mutex *v6;
  char v7;
  std::recursive_mutex *v8;
  char v9;

  v3 = voiceProcessingBypassed;
  AVAudioNodeImplBase::GetAttachAndEngineLock((AVAudioNodeImplBase *)&v6, (uint64_t)self->super.super._impl);
  if (-[AVAudioIONode isVoiceProcessingEnabled](self, "isVoiceProcessingEnabled"))
  {
    v5 = v3;
    (*(void (**)(void *, uint64_t, _QWORD, uint64_t, _BOOL4 *, uint64_t))(*(_QWORD *)self->super.super._impl
                                                                                + 144))(self->super.super._impl, 2100, 0, 1, &v5, 4);
  }
  if (v9)
    std::recursive_mutex::unlock(v8);
  if (v7)
    std::recursive_mutex::unlock(v6);
}

- (BOOL)isVoiceProcessingAGCEnabled
{
  BOOL v3;
  int v5;
  std::recursive_mutex *v6;
  char v7;
  std::recursive_mutex *v8;
  char v9;

  AVAudioNodeImplBase::GetAttachAndEngineLock((AVAudioNodeImplBase *)&v6, (uint64_t)self->super.super._impl);
  if (-[AVAudioIONode isVoiceProcessingEnabled](self, "isVoiceProcessingEnabled"))
  {
    v5 = 0;
    (*(void (**)(void *, uint64_t, _QWORD, uint64_t, int *, uint64_t))(*(_QWORD *)self->super.super._impl + 152))(self->super.super._impl, 2101, 0, 1, &v5, 4);
    v3 = v5 != 0;
  }
  else
  {
    v3 = 0;
  }
  if (v9)
    std::recursive_mutex::unlock(v8);
  if (v7)
    std::recursive_mutex::unlock(v6);
  return v3;
}

- (void)setVoiceProcessingAGCEnabled:(BOOL)voiceProcessingAGCEnabled
{
  _BOOL4 v3;
  _BOOL4 v5;
  std::recursive_mutex *v6;
  char v7;
  std::recursive_mutex *v8;
  char v9;

  v3 = voiceProcessingAGCEnabled;
  AVAudioNodeImplBase::GetAttachAndEngineLock((AVAudioNodeImplBase *)&v6, (uint64_t)self->super.super._impl);
  if (-[AVAudioIONode isVoiceProcessingEnabled](self, "isVoiceProcessingEnabled"))
  {
    v5 = v3;
    (*(void (**)(void *, uint64_t, _QWORD, uint64_t, _BOOL4 *, uint64_t))(*(_QWORD *)self->super.super._impl
                                                                                + 144))(self->super.super._impl, 2101, 0, 1, &v5, 4);
  }
  if (v9)
    std::recursive_mutex::unlock(v8);
  if (v7)
    std::recursive_mutex::unlock(v6);
}

- (BOOL)isVoiceProcessingInputMuted
{
  BOOL v3;
  int v5;
  std::recursive_mutex *v6;
  char v7;
  std::recursive_mutex *v8;
  char v9;

  AVAudioNodeImplBase::GetAttachAndEngineLock((AVAudioNodeImplBase *)&v6, (uint64_t)self->super.super._impl);
  if (-[AVAudioIONode isVoiceProcessingEnabled](self, "isVoiceProcessingEnabled"))
  {
    v5 = 0;
    (*(void (**)(void *, uint64_t, _QWORD, uint64_t, int *, uint64_t))(*(_QWORD *)self->super.super._impl + 152))(self->super.super._impl, 2104, 0, 1, &v5, 4);
    v3 = v5 != 0;
  }
  else
  {
    v3 = 0;
  }
  if (v9)
    std::recursive_mutex::unlock(v8);
  if (v7)
    std::recursive_mutex::unlock(v6);
  return v3;
}

- (void)setVoiceProcessingInputMuted:(BOOL)voiceProcessingInputMuted
{
  _BOOL4 v3;
  _BOOL4 v5;
  std::recursive_mutex *v6;
  char v7;
  std::recursive_mutex *v8;
  char v9;

  v3 = voiceProcessingInputMuted;
  AVAudioNodeImplBase::GetAttachAndEngineLock((AVAudioNodeImplBase *)&v6, (uint64_t)self->super.super._impl);
  if (-[AVAudioIONode isVoiceProcessingEnabled](self, "isVoiceProcessingEnabled"))
  {
    v5 = v3;
    (*(void (**)(void *, uint64_t, _QWORD, uint64_t, _BOOL4 *, uint64_t))(*(_QWORD *)self->super.super._impl
                                                                                + 144))(self->super.super._impl, 2104, 0, 1, &v5, 4);
  }
  if (v9)
    std::recursive_mutex::unlock(v8);
  if (v7)
    std::recursive_mutex::unlock(v6);
}

- (BOOL)setMutedSpeechActivityEventListener:(void *)listenerBlock
{
  char v5;
  _QWORD v7[5];
  _QWORD *v8;
  std::recursive_mutex *v9;
  char v10;
  std::recursive_mutex *v11;
  char v12;

  AVAudioNodeImplBase::GetAttachAndEngineLock((AVAudioNodeImplBase *)&v9, (uint64_t)self->super.super._impl);
  if (-[AVAudioIONode isVoiceProcessingEnabled](self, "isVoiceProcessingEnabled"))
  {
    v8 = 0;
    if (listenerBlock)
    {
      v7[0] = MEMORY[0x1E0C809B0];
      v7[1] = 3221225472;
      v7[2] = __56__AVAudioInputNode_setMutedSpeechActivityEventListener___block_invoke;
      v7[3] = &unk_1E3BEB2D0;
      v7[4] = listenerBlock;
      v8 = v7;
    }
    v5 = (*(uint64_t (**)(void *, uint64_t, _QWORD, _QWORD, _QWORD **, uint64_t))(*(_QWORD *)self->super.super._impl
                                                                                        + 144))(self->super.super._impl, 2106, 0, 0, &v8, 8);
  }
  else
  {
    v5 = 0;
  }
  if (v12)
    std::recursive_mutex::unlock(v11);
  if (v10)
    std::recursive_mutex::unlock(v9);
  return v5;
}

- (AVAudioVoiceProcessingOtherAudioDuckingConfiguration)voiceProcessingOtherAudioDuckingConfiguration
{
  unsigned int v3;
  AVAudioVoiceProcessingOtherAudioDuckingLevel v4;
  uint64_t v5;
  _BOOL8 v6;
  AVAudioVoiceProcessingOtherAudioDuckingLevel v7;
  uint64_t v8;
  std::recursive_mutex *v9;
  char v10;
  std::recursive_mutex *v11;
  char v12;
  AVAudioVoiceProcessingOtherAudioDuckingConfiguration result;

  AVAudioNodeImplBase::GetAttachAndEngineLock((AVAudioNodeImplBase *)&v9, (uint64_t)self->super.super._impl);
  if (-[AVAudioIONode isVoiceProcessingEnabled](self, "isVoiceProcessingEnabled"))
  {
    v8 = 0;
    v3 = (*(uint64_t (**)(void *, uint64_t, _QWORD, _QWORD, uint64_t *, uint64_t))(*(_QWORD *)self->super.super._impl
                                                                                        + 152))(self->super.super._impl, 2108, 0, 0, &v8, 8);
    if (v3)
      v4 = (unint64_t)HIDWORD(v8);
    else
      v4 = AVAudioVoiceProcessingOtherAudioDuckingLevelDefault;
    if ((_BYTE)v8)
      v5 = v3;
    else
      v5 = 0;
  }
  else
  {
    v4 = AVAudioVoiceProcessingOtherAudioDuckingLevelDefault;
    v5 = 0;
  }
  if (v12)
    std::recursive_mutex::unlock(v11);
  if (v10)
    std::recursive_mutex::unlock(v9);
  v6 = v5;
  v7 = v4;
  result.duckingLevel = v7;
  result.enableAdvancedDucking = v6;
  return result;
}

- (void)setVoiceProcessingOtherAudioDuckingConfiguration:(AVAudioVoiceProcessingOtherAudioDuckingConfiguration)voiceProcessingOtherAudioDuckingConfiguration
{
  int duckingLevel;
  BOOL enableAdvancedDucking;
  _DWORD v6[2];
  std::recursive_mutex *v7;
  char v8;
  std::recursive_mutex *v9;
  char v10;

  duckingLevel = voiceProcessingOtherAudioDuckingConfiguration.duckingLevel;
  enableAdvancedDucking = voiceProcessingOtherAudioDuckingConfiguration.enableAdvancedDucking;
  AVAudioNodeImplBase::GetAttachAndEngineLock((AVAudioNodeImplBase *)&v7, (uint64_t)self->super.super._impl);
  if (-[AVAudioIONode isVoiceProcessingEnabled](self, "isVoiceProcessingEnabled"))
  {
    v6[0] = enableAdvancedDucking;
    v6[1] = duckingLevel;
    (*(void (**)(void *, uint64_t, _QWORD, _QWORD, _DWORD *, uint64_t))(*(_QWORD *)self->super.super._impl
                                                                               + 144))(self->super.super._impl, 2108, 0, 0, v6, 8);
  }
  if (v10)
    std::recursive_mutex::unlock(v9);
  if (v8)
    std::recursive_mutex::unlock(v7);
}

uint64_t __56__AVAudioInputNode_setMutedSpeechActivityEventListener___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

@end
