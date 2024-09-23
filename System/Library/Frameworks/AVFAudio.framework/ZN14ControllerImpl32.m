@implementation ZN14ControllerImpl32

NSObject *___ZN14ControllerImpl32_configureEngineCompletionBlocksEP17AVVoiceControllerNSt3__110shared_ptrI19AVVCRecordingEngineEE_block_invoke_254(uint64_t a1, char a2)
{
  id WeakRetained;
  std::__shared_weak_count *v5;
  std::__shared_weak_count *v6;
  std::__shared_weak_count *v7;
  uint64_t v8;
  unint64_t *p_shared_owners;
  unint64_t v10;
  unint64_t v11;
  NSObject *v12;
  NSObject *v13;
  id v14;
  unint64_t *v15;
  unint64_t v16;
  std::__shared_weak_count *v18;
  uint8_t buf[4];
  const char *v20;
  __int16 v21;
  int v22;
  __int16 v23;
  id v24;
  __int16 v25;
  uint64_t v26;
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v5 = *(std::__shared_weak_count **)(a1 + 48);
  if (!v5)
  {
    v7 = 0;
    goto LABEL_14;
  }
  v6 = std::__shared_weak_count::lock(v5);
  v7 = v6;
  v18 = v6;
  if (!v6)
  {
LABEL_14:
    v8 = 0;
    goto LABEL_15;
  }
  v8 = *(_QWORD *)(a1 + 40);
  if (!WeakRetained || !v8)
  {
LABEL_15:
    if (kAVVCScope)
    {
      v13 = *(id *)kAVVCScope;
      if (!v13)
        goto LABEL_22;
    }
    else
    {
      v13 = MEMORY[0x1E0C81028];
      v14 = MEMORY[0x1E0C81028];
    }
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315906;
      v20 = "ControllerImpl.mm";
      v21 = 1024;
      v22 = 3966;
      v23 = 2048;
      v24 = WeakRetained;
      v25 = 2048;
      v26 = v8;
      _os_log_impl(&dword_19B733000, v13, OS_LOG_TYPE_ERROR, "%25s:%-5d nil object encountered (avvc: %p, impl: %p). Bailing", buf, 0x26u);
    }

LABEL_22:
    v12 = 0;
    if (!v7)
      goto LABEL_27;
    goto LABEL_23;
  }
  p_shared_owners = (unint64_t *)&v6->__shared_owners_;
  do
    v10 = __ldxr(p_shared_owners);
  while (__stxr(v10 + 1, p_shared_owners));
  RecordLock::RecordLock(buf, v8, v6);
  do
    v11 = __ldaxr(p_shared_owners);
  while (__stlxr(v11 - 1, p_shared_owners));
  if (!v11)
  {
    ((void (*)(std::__shared_weak_count *))v7->__on_zero_shared)(v7);
    std::__shared_weak_count::__release_weak(v7);
  }
  v12 = AVVCRecordingEngine::stopRecord(*(AVVCRecordingEngine **)(a1 + 56), a2);
  VCLocker::~VCLocker((VCLocker *)buf);
  v7 = v18;
  if (v18)
  {
LABEL_23:
    v15 = (unint64_t *)&v7->__shared_owners_;
    do
      v16 = __ldaxr(v15);
    while (__stlxr(v16 - 1, v15));
    if (!v16)
    {
      ((void (*)(std::__shared_weak_count *))v7->__on_zero_shared)(v7);
      std::__shared_weak_count::__release_weak(v7);
    }
  }
LABEL_27:

  return v12;
}

@end
