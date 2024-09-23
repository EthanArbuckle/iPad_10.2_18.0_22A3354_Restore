@implementation AVAudioUnitGenerator

- (AVAudioUnitGenerator)initWithAudioComponentDescription:(AudioComponentDescription *)audioComponentDescription
{
  NSObject *v6;
  objc_super v8;
  __int128 v9;
  UInt32 componentFlagsMask;
  uint8_t buf[4];
  const char *v12;
  __int16 v13;
  int v14;
  __int16 v15;
  char *v16;
  __int16 v17;
  int v18;
  __int16 v19;
  const char *v20;
  __int16 v21;
  const char *v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  if (audioComponentDescription->componentType != 1635084142 && audioComponentDescription->componentType != 1635086951)
  {
    if (AVAudioEngineLogCategory(void)::once != -1)
      dispatch_once(&AVAudioEngineLogCategory(void)::once, &__block_literal_global_7560);
    v6 = *(NSObject **)AVAudioEngineLogCategory(void)::category;
    if (os_log_type_enabled(*(os_log_t *)AVAudioEngineLogCategory(void)::category, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136316418;
      v12 = "AVAEInternal.h";
      v13 = 1024;
      v14 = 71;
      v15 = 2080;
      v16 = "AVAudioUnitGenerator.mm";
      v17 = 1024;
      v18 = 24;
      v19 = 2080;
      v20 = "-[AVAudioUnitGenerator initWithAudioComponentDescription:]";
      v21 = 2080;
      v22 = "(audioComponentDescription.componentType == kAudioUnitType_Generator) || (audioComponentDescription.componen"
            "tType == kAudioUnitType_RemoteGenerator)";
      _os_log_impl(&dword_19B733000, v6, OS_LOG_TYPE_ERROR, "%25s:%-5d required condition is false: [%s:%d:%s: (%s)]", buf, 0x36u);
    }
    objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", CFSTR("com.apple.coreaudio.avfaudio"), CFSTR("required condition is false: %s"), "(audioComponentDescription.componentType == kAudioUnitType_Generator) || (audioComponentDescription.componentType == kAudioUnitType_RemoteGenerator)");
  }
  v9 = *(_OWORD *)&audioComponentDescription->componentType;
  componentFlagsMask = audioComponentDescription->componentFlagsMask;
  v8.receiver = self;
  v8.super_class = (Class)AVAudioUnitGenerator;
  return -[AVAudioUnit initWithAudioComponentDescription:](&v8, sel_initWithAudioComponentDescription_, &v9);
}

- (BOOL)bypass
{
  int v3;
  int v5;
  std::recursive_mutex *v6;
  char v7;
  std::recursive_mutex *v8;
  char v9;

  AVAudioNodeImplBase::GetAttachAndEngineLock((AVAudioNodeImplBase *)&v6, (uint64_t)self->super.super._impl);
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
  AVAudioNodeImplBase::GetAttachAndEngineLock((AVAudioNodeImplBase *)&v6, (uint64_t)self->super.super._impl);
  v5 = v3;
  (*(void (**)(void *, uint64_t, _QWORD, _QWORD, _BOOL4 *, uint64_t))(*(_QWORD *)self->super.super._impl + 144))(self->super.super._impl, 21, 0, 0, &v5, 4);
  if (v9)
    std::recursive_mutex::unlock(v8);
  if (v7)
    std::recursive_mutex::unlock(v6);
}

@end
