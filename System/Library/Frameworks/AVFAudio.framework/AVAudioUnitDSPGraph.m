@implementation AVAudioUnitDSPGraph

- (AVAudioUnitDSPGraph)init
{
  objc_super v4;
  __int128 v5;
  int v6;

  if (!-[AVAudioUnitDSPGraph loadAudioDSPManager](self, "loadAudioDSPManager"))
    return 0;
  v6 = 0;
  v5 = *(_OWORD *)"xfuagpsdlppa";
  v4.receiver = self;
  v4.super_class = (Class)AVAudioUnitDSPGraph;
  return -[AVAudioUnit initWithAudioComponentDescription:](&v4, sel_initWithAudioComponentDescription_, &v5);
}

- (BOOL)loadAudioDSPManager
{
  char v2;
  _QWORD block[5];
  uint64_t v5;
  uint64_t *v6;
  uint64_t v7;
  char v8;

  v5 = 0;
  v6 = &v5;
  v7 = 0x2020000000;
  v8 = 1;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __42__AVAudioUnitDSPGraph_loadAudioDSPManager__block_invoke;
  block[3] = &unk_1E3BECFE0;
  block[4] = &v5;
  if (-[AVAudioUnitDSPGraph loadAudioDSPManager]::once != -1)
    dispatch_once(&-[AVAudioUnitDSPGraph loadAudioDSPManager]::once, block);
  v2 = *((_BYTE *)v6 + 24);
  _Block_object_dispose(&v5, 8);
  return v2;
}

- (BOOL)loadDSPGraphAtURL:(id)a3 error:(id *)a4
{
  uint64_t v6;
  BOOL v7;
  int v8;
  BOOL v9;
  uint64_t v11;
  std::recursive_mutex *v12;
  char v13;
  std::recursive_mutex *v14;
  char v15;

  if (a4)
  {
    *a4 = 0;
    v6 = objc_msgSend(a3, "relativePath");
    if (!v6)
    {
      v7 = 0;
      *a4 = (id)objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("com.apple.coreaudio.avfaudio"), -50, 0);
      return v7;
    }
  }
  else
  {
    v6 = objc_msgSend(a3, "relativePath");
    if (!v6)
      return 0;
  }
  AVAudioNodeImplBase::GetAttachAndEngineLock((AVAudioNodeImplBase *)&v12, (uint64_t)self->super.super._impl);
  v11 = v6;
  v8 = (*(uint64_t (**)(void *, uint64_t, _QWORD, _QWORD, uint64_t *, uint64_t))(*(_QWORD *)self->super.super._impl
                                                                                      + 160))(self->super.super._impl, 1685287015, 0, 0, &v11, 8);
  v7 = v8 == 0;
  if (v8)
    v9 = a4 == 0;
  else
    v9 = 1;
  if (!v9)
    *a4 = (id)objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("com.apple.coreaudio.avfaudio"), v8, 0);
  if (v15)
    std::recursive_mutex::unlock(v14);
  if (v13)
    std::recursive_mutex::unlock(v12);
  return v7;
}

- (BOOL)loadAudioUnitProcessingStripAtURL:(id)a3 error:(id *)a4
{
  int v6;
  BOOL v7;
  BOOL v8;
  std::recursive_mutex *v10;
  char v11;
  std::recursive_mutex *v12;
  char v13;
  uint64_t v14;

  if (a4)
    *a4 = 0;
  v14 = objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithContentsOfURL:error:", a3, a4);
  if (!v14)
    return 0;
  AVAudioNodeImplBase::GetAttachAndEngineLock((AVAudioNodeImplBase *)&v10, (uint64_t)self->super.super._impl);
  v6 = (*(uint64_t (**)(void *, uint64_t, _QWORD, _QWORD, uint64_t *, uint64_t))(*(_QWORD *)self->super.super._impl
                                                                                      + 160))(self->super.super._impl, 1635087216, 0, 0, &v14, 8);
  v7 = v6 == 0;
  if (v6)
    v8 = a4 == 0;
  else
    v8 = 1;
  if (!v8)
    *a4 = (id)objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("com.apple.coreaudio.avfaudio"), v6, 0);
  if (v13)
    std::recursive_mutex::unlock(v12);
  if (v11)
    std::recursive_mutex::unlock(v10);
  return v7;
}

- (NSURL)dspGraphURL
{
  void **p_impl;
  int v3;
  NSObject *v4;
  NSURL *v5;
  std::recursive_mutex *v7;
  char v8;
  std::recursive_mutex *v9;
  char v10;
  CFTypeRef cf;
  uint8_t buf[4];
  const char *v13;
  __int16 v14;
  int v15;
  __int16 v16;
  int v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  cf = 0;
  p_impl = &self->super.super._impl;
  AVAudioNodeImplBase::GetAttachAndEngineLock((AVAudioNodeImplBase *)&v7, (uint64_t)self->super.super._impl);
  v3 = (*(uint64_t (**)(void *, uint64_t, _QWORD, _QWORD, CFTypeRef *, uint64_t))(*(_QWORD *)*p_impl + 152))(*p_impl, 1685287015, 0, 0, &cf, 8);
  if (v3)
  {
    if (AVAudioEngineLogCategory(void)::once != -1)
      dispatch_once(&AVAudioEngineLogCategory(void)::once, &__block_literal_global_7560);
    v4 = *(NSObject **)AVAudioEngineLogCategory(void)::category;
    if (os_log_type_enabled(*(os_log_t *)AVAudioEngineLogCategory(void)::category, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 136315650;
      v13 = "AVAudioUnitDSPGraph.mm";
      v14 = 1024;
      v15 = 115;
      v16 = 1024;
      v17 = v3;
      _os_log_impl(&dword_19B733000, v4, OS_LOG_TYPE_DEBUG, "%25s:%-5d unable to get property kAUDSPGraphProperty_GraphTextFilePath %i", buf, 0x18u);
    }
  }
  else if (cf)
  {
    v5 = (NSURL *)objc_msgSend(MEMORY[0x1E0C99E98], "fileURLWithPath:", (id)CFMakeCollectable(cf));
    goto LABEL_9;
  }
  v5 = 0;
LABEL_9:
  if (v10)
    std::recursive_mutex::unlock(v9);
  if (v8)
    std::recursive_mutex::unlock(v7);
  return v5;
}

- (NSURL)auProcessingStripURL
{
  void **p_impl;
  int v3;
  NSObject *v4;
  NSURL *v5;
  std::recursive_mutex *v7;
  char v8;
  std::recursive_mutex *v9;
  char v10;
  CFTypeRef cf;
  uint8_t buf[4];
  const char *v13;
  __int16 v14;
  int v15;
  __int16 v16;
  int v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  cf = 0;
  p_impl = &self->super.super._impl;
  AVAudioNodeImplBase::GetAttachAndEngineLock((AVAudioNodeImplBase *)&v7, (uint64_t)self->super.super._impl);
  v3 = (*(uint64_t (**)(void *, uint64_t, _QWORD, _QWORD, CFTypeRef *, uint64_t))(*(_QWORD *)*p_impl + 152))(*p_impl, 1635087216, 0, 0, &cf, 8);
  if (v3)
  {
    if (AVAudioEngineLogCategory(void)::once != -1)
      dispatch_once(&AVAudioEngineLogCategory(void)::once, &__block_literal_global_7560);
    v4 = *(NSObject **)AVAudioEngineLogCategory(void)::category;
    if (os_log_type_enabled(*(os_log_t *)AVAudioEngineLogCategory(void)::category, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 136315650;
      v13 = "AVAudioUnitDSPGraph.mm";
      v14 = 1024;
      v15 = 130;
      v16 = 1024;
      v17 = v3;
      _os_log_impl(&dword_19B733000, v4, OS_LOG_TYPE_DEBUG, "%25s:%-5d unable to get property kAUDSPGraphProperty_AUStrip %i", buf, 0x18u);
    }
  }
  else if (cf)
  {
    v5 = (NSURL *)objc_msgSend(MEMORY[0x1E0C99E98], "fileURLWithPath:", (id)CFMakeCollectable(cf));
    goto LABEL_9;
  }
  v5 = 0;
LABEL_9:
  if (v10)
    std::recursive_mutex::unlock(v9);
  if (v8)
    std::recursive_mutex::unlock(v7);
  return v5;
}

void __42__AVAudioUnitDSPGraph_loadAudioDSPManager__block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t (*v3)(void);
  unsigned __int8 v4;
  NSObject *v5;
  uint64_t (*v6)(void);
  int v7;
  const char *v8;
  __int16 v9;
  int v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v2 = dlopen("/System/Library/Frameworks/AudioToolbox.framework/libAudioDSP.dylib", 1);
  v3 = (uint64_t (*)(void))dlsym(v2, "GetAudioDSPManager");
  if (v3)
  {
    v4 = atomic_load((unsigned __int8 *)&_ZGVZZ42__AVAudioUnitDSPGraph_loadAudioDSPManager_EUb_E8instance);
    if ((v4 & 1) == 0)
    {
      v6 = v3;
      if (__cxa_guard_acquire(&_ZGVZZ42__AVAudioUnitDSPGraph_loadAudioDSPManager_EUb_E8instance))
      {
        _ZZZ42__AVAudioUnitDSPGraph_loadAudioDSPManager_EUb_E8instance = v6();
        __cxa_guard_release(&_ZGVZZ42__AVAudioUnitDSPGraph_loadAudioDSPManager_EUb_E8instance);
      }
    }
    (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)_ZZZ42__AVAudioUnitDSPGraph_loadAudioDSPManager_EUb_E8instance
                                             + 24))(_ZZZ42__AVAudioUnitDSPGraph_loadAudioDSPManager_EUb_E8instance, 3);
  }
  else
  {
    if (AVAudioEngineLogCategory(void)::once != -1)
      dispatch_once(&AVAudioEngineLogCategory(void)::once, &__block_literal_global_7560);
    v5 = *(NSObject **)AVAudioEngineLogCategory(void)::category;
    if (os_log_type_enabled(*(os_log_t *)AVAudioEngineLogCategory(void)::category, OS_LOG_TYPE_ERROR))
    {
      v7 = 136315394;
      v8 = "AVAudioUnitDSPGraph.mm";
      v9 = 1024;
      v10 = 51;
      _os_log_impl(&dword_19B733000, v5, OS_LOG_TYPE_ERROR, "%25s:%-5d Error: Unable to call RegisterAudioUnits_Internal from libAudioDSP.dylib.", (uint8_t *)&v7, 0x12u);
    }
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = 0;
  }
}

@end
