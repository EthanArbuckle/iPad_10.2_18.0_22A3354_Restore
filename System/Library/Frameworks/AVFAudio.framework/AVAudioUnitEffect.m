@implementation AVAudioUnitEffect

- (AVAudioUnitEffect)initWithAudioComponentDescription:(AudioComponentDescription *)audioComponentDescription
{
  OSType componentType;
  BOOL v6;
  unsigned __int16 v7;
  int v8;
  NSObject *v11;
  objc_super v12;
  __int128 v13;
  UInt32 componentFlagsMask;
  uint8_t buf[4];
  const char *v16;
  __int16 v17;
  int v18;
  __int16 v19;
  char *v20;
  __int16 v21;
  int v22;
  __int16 v23;
  const char *v24;
  __int16 v25;
  const char *v26;
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  componentType = audioComponentDescription->componentType;
  if ((int)audioComponentDescription->componentType <= 1635086445)
  {
    v6 = componentType == 1635083896;
    v7 = 28006;
  }
  else
  {
    v6 = componentType == 1635086446 || componentType == 1635086957;
    v7 = 29304;
  }
  v8 = v7 | 0x61750000;
  if (!v6 && componentType != v8)
  {
    if (AVAudioEngineLogCategory(void)::once != -1)
      dispatch_once(&AVAudioEngineLogCategory(void)::once, &__block_literal_global_7560);
    v11 = *(NSObject **)AVAudioEngineLogCategory(void)::category;
    if (os_log_type_enabled(*(os_log_t *)AVAudioEngineLogCategory(void)::category, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136316418;
      v16 = "AVAEInternal.h";
      v17 = 1024;
      v18 = 71;
      v19 = 2080;
      v20 = "AVAudioUnitEffect.mm";
      v21 = 1024;
      v22 = 26;
      v23 = 2080;
      v24 = "-[AVAudioUnitEffect initWithAudioComponentDescription:]";
      v25 = 2080;
      v26 = "(audioComponentDescription.componentType == kAudioUnitType_Effect) || (audioComponentDescription.componentTy"
            "pe == kAudioUnitType_MusicEffect) || (audioComponentDescription.componentType == kAudioUnitType_Panner) || ("
            "audioComponentDescription.componentType == kAudioUnitType_RemoteEffect) || (audioComponentDescription.compon"
            "entType == kAudioUnitType_RemoteMusicEffect)";
      _os_log_impl(&dword_19B733000, v11, OS_LOG_TYPE_ERROR, "%25s:%-5d required condition is false: [%s:%d:%s: (%s)]", buf, 0x36u);
    }
    objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", CFSTR("com.apple.coreaudio.avfaudio"), CFSTR("required condition is false: %s"), "(audioComponentDescription.componentType == kAudioUnitType_Effect) || (audioComponentDescription.componentType == kAudioUnitType_MusicEffect) || (audioComponentDescription.componentType == kAudioUnitType_Panner) || (audioComponentDescription.componentType == kAudioUnitType_RemoteEffect) || (audioComponentDescription.componentType == kAudioUnitType_RemoteMusicEffect)");
  }
  v13 = *(_OWORD *)&audioComponentDescription->componentType;
  componentFlagsMask = audioComponentDescription->componentFlagsMask;
  v12.receiver = self;
  v12.super_class = (Class)AVAudioUnitEffect;
  return -[AVAudioUnit initWithAudioComponentDescription:](&v12, sel_initWithAudioComponentDescription_, &v13);
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
