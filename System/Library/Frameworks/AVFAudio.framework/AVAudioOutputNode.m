@implementation AVAudioOutputNode

- (BOOL)setManualRenderingPCMFormat:(id)a3 maximumFrameCount:(unsigned int)a4
{
  uint64_t v4;
  NSObject *v7;
  uint64_t v8;
  BOOL v9;
  std::recursive_mutex *v11;
  char v12;
  std::recursive_mutex *v13;
  char v14;
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

  v4 = *(_QWORD *)&a4;
  v27 = *MEMORY[0x1E0C80C00];
  AVAudioNodeImplBase::GetAttachAndEngineLock((AVAudioNodeImplBase *)&v11, (uint64_t)self->super.super._impl);
  if (!-[AVAudioIONode isInManualRenderingMode](self, "isInManualRenderingMode"))
  {
    if (AVAudioEngineLogCategory(void)::once != -1)
      dispatch_once(&AVAudioEngineLogCategory(void)::once, &__block_literal_global_7560);
    v7 = *(NSObject **)AVAudioEngineLogCategory(void)::category;
    if (os_log_type_enabled(*(os_log_t *)AVAudioEngineLogCategory(void)::category, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136316418;
      v16 = "AVAEInternal.h";
      v17 = 1024;
      v18 = 71;
      v19 = 2080;
      v20 = "AVAudioIONode.mm";
      v21 = 1024;
      v22 = 124;
      v23 = 2080;
      v24 = "-[AVAudioOutputNode setManualRenderingPCMFormat:maximumFrameCount:]";
      v25 = 2080;
      v26 = "self.isInManualRenderingMode";
      _os_log_impl(&dword_19B733000, v7, OS_LOG_TYPE_ERROR, "%25s:%-5d required condition is false: [%s:%d:%s: (%s)]", buf, 0x36u);
    }
    objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", CFSTR("com.apple.coreaudio.avfaudio"), CFSTR("required condition is false: %s"), "self.isInManualRenderingMode");
  }
  if (objc_msgSend(-[AVAudioOutputNode manualRenderingFormat](self, "manualRenderingFormat"), "isEqual:", a3)&& -[AVAudioOutputNode manualRenderingMaximumFrameCount](self, "manualRenderingMaximumFrameCount") == (_DWORD)v4)
  {
    goto LABEL_11;
  }
  if ((*(unsigned int (**)(void *, _QWORD, id))(*(_QWORD *)self->super.super._impl + 64))(self->super.super._impl, 0, a3))
  {
    v8 = (*(uint64_t (**)(void *))(*(_QWORD *)self->super.super._impl + 40))(self->super.super._impl);
    (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)v8 + 160))(v8, v4);
LABEL_11:
    v9 = 1;
    goto LABEL_13;
  }
  v9 = 0;
LABEL_13:
  if (v14)
    std::recursive_mutex::unlock(v13);
  if (v12)
    std::recursive_mutex::unlock(v11);
  return v9;
}

- (id)manualRenderingFormat
{
  NSObject *v3;
  AVAudioFormat *v4;
  std::recursive_mutex *v6;
  char v7;
  std::recursive_mutex *v8;
  char v9;
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
  AVAudioNodeImplBase::GetAttachAndEngineLock((AVAudioNodeImplBase *)&v6, (uint64_t)self->super.super._impl);
  if (!-[AVAudioIONode isInManualRenderingMode](self, "isInManualRenderingMode"))
  {
    if (AVAudioEngineLogCategory(void)::once != -1)
      dispatch_once(&AVAudioEngineLogCategory(void)::once, &__block_literal_global_7560);
    v3 = *(NSObject **)AVAudioEngineLogCategory(void)::category;
    if (os_log_type_enabled(*(os_log_t *)AVAudioEngineLogCategory(void)::category, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136316418;
      v11 = "AVAEInternal.h";
      v12 = 1024;
      v13 = 71;
      v14 = 2080;
      v15 = "AVAudioIONode.mm";
      v16 = 1024;
      v17 = 140;
      v18 = 2080;
      v19 = "-[AVAudioOutputNode manualRenderingFormat]";
      v20 = 2080;
      v21 = "self.isInManualRenderingMode";
      _os_log_impl(&dword_19B733000, v3, OS_LOG_TYPE_ERROR, "%25s:%-5d required condition is false: [%s:%d:%s: (%s)]", buf, 0x36u);
    }
    objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", CFSTR("com.apple.coreaudio.avfaudio"), CFSTR("required condition is false: %s"), "self.isInManualRenderingMode");
  }
  v4 = -[AVAudioNode outputFormatForBus:](self, "outputFormatForBus:", 0);
  if (v9)
    std::recursive_mutex::unlock(v8);
  if (v7)
    std::recursive_mutex::unlock(v6);
  return v4;
}

- (unsigned)manualRenderingMaximumFrameCount
{
  NSObject *v3;
  uint64_t v4;
  unsigned int v5;
  std::recursive_mutex *v7;
  char v8;
  std::recursive_mutex *v9;
  char v10;
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
  AVAudioNodeImplBase::GetAttachAndEngineLock((AVAudioNodeImplBase *)&v7, (uint64_t)self->super.super._impl);
  if (!-[AVAudioIONode isInManualRenderingMode](self, "isInManualRenderingMode"))
  {
    if (AVAudioEngineLogCategory(void)::once != -1)
      dispatch_once(&AVAudioEngineLogCategory(void)::once, &__block_literal_global_7560);
    v3 = *(NSObject **)AVAudioEngineLogCategory(void)::category;
    if (os_log_type_enabled(*(os_log_t *)AVAudioEngineLogCategory(void)::category, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136316418;
      v12 = "AVAEInternal.h";
      v13 = 1024;
      v14 = 71;
      v15 = 2080;
      v16 = "AVAudioIONode.mm";
      v17 = 1024;
      v18 = 148;
      v19 = 2080;
      v20 = "-[AVAudioOutputNode manualRenderingMaximumFrameCount]";
      v21 = 2080;
      v22 = "self.isInManualRenderingMode";
      _os_log_impl(&dword_19B733000, v3, OS_LOG_TYPE_ERROR, "%25s:%-5d required condition is false: [%s:%d:%s: (%s)]", buf, 0x36u);
    }
    objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", CFSTR("com.apple.coreaudio.avfaudio"), CFSTR("required condition is false: %s"), "self.isInManualRenderingMode");
  }
  v4 = (*(uint64_t (**)(void *))(*(_QWORD *)self->super.super._impl + 40))(self->super.super._impl);
  v5 = (*(uint64_t (**)(uint64_t))(*(_QWORD *)v4 + 152))(v4);
  if (v10)
    std::recursive_mutex::unlock(v9);
  if (v8)
    std::recursive_mutex::unlock(v7);
  return v5;
}

@end
