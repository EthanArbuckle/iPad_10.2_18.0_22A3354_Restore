@implementation AVAudioUnitTimeEffect

- (AVAudioUnitTimeEffect)initWithAudioComponentDescription:(AudioComponentDescription *)audioComponentDescription
{
  NSObject *v5;
  objc_super v7;
  __int128 v8;
  UInt32 componentFlagsMask;
  uint8_t buf[4];
  const char *v11;
  __int16 v12;
  int v13;
  __int16 v14;
  char *v15;
  __int16 v16;
  int v17;
  __int16 v18;
  const char *v19;
  __int16 v20;
  const char *v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  if (audioComponentDescription->componentType != 1635083875)
  {
    if (AVAudioEngineLogCategory(void)::once != -1)
      dispatch_once(&AVAudioEngineLogCategory(void)::once, &__block_literal_global_7560);
    v5 = *(NSObject **)AVAudioEngineLogCategory(void)::category;
    if (os_log_type_enabled(*(os_log_t *)AVAudioEngineLogCategory(void)::category, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136316418;
      v11 = "AVAEInternal.h";
      v12 = 1024;
      v13 = 71;
      v14 = 2080;
      v15 = "AVAudioUnitTimeEffect.mm";
      v16 = 1024;
      v17 = 17;
      v18 = 2080;
      v19 = "-[AVAudioUnitTimeEffect initWithAudioComponentDescription:]";
      v20 = 2080;
      v21 = "audioComponentDescription.componentType == kAudioUnitType_FormatConverter";
      _os_log_impl(&dword_19B733000, v5, OS_LOG_TYPE_ERROR, "%25s:%-5d required condition is false: [%s:%d:%s: (%s)]", buf, 0x36u);
    }
    objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", CFSTR("com.apple.coreaudio.avfaudio"), CFSTR("required condition is false: %s"), "audioComponentDescription.componentType == kAudioUnitType_FormatConverter");
  }
  v8 = *(_OWORD *)&audioComponentDescription->componentType;
  componentFlagsMask = audioComponentDescription->componentFlagsMask;
  v7.receiver = self;
  v7.super_class = (Class)AVAudioUnitTimeEffect;
  return -[AVAudioUnit initWithAudioComponentDescription:](&v7, sel_initWithAudioComponentDescription_, &v8);
}

- (BOOL)bypass
{
  int v3;
  int v5;
  std::recursive_mutex *v6;
  char v7;
  std::recursive_mutex *v8;
  char v9;

  AVAudioNodeImplBase::GetAttachAndEngineLock((AVAudioNodeImplBase *)&v6, (uint64_t)-[AVAudioNode impl](self, "impl"));
  v5 = 0;
  (*(void (**)(void *, uint64_t, _QWORD, _QWORD, int *, uint64_t))(*(_QWORD *)self->super.super._impl + 152))(self->super.super._impl, 21, 0, 0, &v5, 4);
  v3 = v5;
  if (v9)
    std::recursive_mutex::unlock(v8);
  if (v7)
    std::recursive_mutex::unlock(v6);
  return v3 != 0;
}

- (void)setBypass:(BOOL)bypass
{
  _BOOL4 v3;
  _BOOL4 v5;
  std::recursive_mutex *v6;
  char v7;
  std::recursive_mutex *v8;
  char v9;

  v3 = bypass;
  AVAudioNodeImplBase::GetAttachAndEngineLock((AVAudioNodeImplBase *)&v6, (uint64_t)-[AVAudioNode impl](self, "impl"));
  v5 = v3;
  (*(void (**)(void *, uint64_t, _QWORD, _QWORD, _BOOL4 *, uint64_t))(*(_QWORD *)self->super.super._impl + 144))(self->super.super._impl, 21, 0, 0, &v5, 4);
  if (v9)
    std::recursive_mutex::unlock(v8);
  if (v7)
    std::recursive_mutex::unlock(v6);
}

@end
