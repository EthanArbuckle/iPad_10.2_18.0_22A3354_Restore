@implementation ATThreadSafeHeadTracker

- (ATThreadSafeHeadTracker)initWithRateLimit:(float)a3 detectPredictionAnchor:(BOOL)a4 userContext:(void *)a5 factory:(void *)a6 execution:(void *)a7 finalizer:(void *)a8
{
  ATThreadSafeHeadTracker *v14;
  ATThreadSafeHeadTracker *v15;
  _OWORD *v16;
  float v17;
  uint64_t v18;
  __int128 v19;
  __int128 v20;
  std::__shared_weak_count *v21;
  unint64_t *v22;
  unint64_t v23;
  _OWORD *v24;
  float v25;
  uint64_t v26;
  __int128 v27;
  __int128 v28;
  unint64_t *v29;
  ThreadSafeHeadTracker *ptr;
  std::__shared_weak_count *v31;
  uint64_t v32;
  unint64_t *p_shared_weak_owners;
  unint64_t v34;
  NSObject *v35;
  NSObject *v36;
  uint64_t v37;
  unint64_t *v38;
  unint64_t v39;
  void *v40;
  id *v41;
  void *v42;
  id v43;
  unint64_t *v44;
  unint64_t v45;
  uint64_t v46;
  void *v47;
  unint64_t *v48;
  unint64_t v49;
  unint64_t *v50;
  unint64_t v51;
  void *v52;
  objc_class *v53;
  uint64_t v54;
  SWSystemSleepMonitor *sleepMonitor;
  ATThreadSafeHeadTracker *result;
  void *v57;
  void *v58;
  objc_super v59;
  _QWORD v60[5];
  std::__shared_weak_count *v61;
  _QWORD handler[5];
  std::__shared_weak_count *v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  void *v67;
  uint64_t v68;
  std::__shared_weak_count *v69;
  __int128 block;
  void *v71;
  void *v72;
  ThreadSafeHeadTracker *v73;
  uint64_t v74;
  std::__shared_weak_count *v75;

  v59.receiver = self;
  v59.super_class = (Class)ATThreadSafeHeadTracker;
  v14 = -[ATThreadSafeHeadTracker init](&v59, sel_init);
  v15 = v14;
  if (!v14)
    return v15;
  if (a6 && a7 && a8)
  {
    v16 = operator new(0xE0uLL);
    *(_OWORD *)((char *)v16 + 8) = 0u;
    *(_QWORD *)v16 = &off_1E450FD58;
    v16[2] = 0u;
    v17 = 1.0 / a3;
    if (a3 <= 0.0)
      v17 = 0.01;
    *((float *)v16 + 12) = v17;
    *((_DWORD *)v16 + 13) = 0;
    *((_QWORD *)v16 + 7) = 0;
    *((_QWORD *)v16 + 8) = a6;
    *((_QWORD *)v16 + 9) = a5;
    *((_QWORD *)v16 + 10) = a7;
    *((_QWORD *)v16 + 11) = a8;
    v18 = MEMORY[0x1E0C83FF0];
    v19 = *(_OWORD *)(MEMORY[0x1E0C83FF0] + 16);
    v16[6] = *MEMORY[0x1E0C83FF0];
    v16[7] = v19;
    v20 = *(_OWORD *)(v18 + 48);
    v16[8] = *(_OWORD *)(v18 + 32);
    v16[9] = v20;
    *((_QWORD *)v16 + 20) = 0;
    *((_QWORD *)v16 + 22) = 0;
    *((_BYTE *)v16 + 184) = a4;
    *((_QWORD *)v16 + 24) = 0;
    *((_BYTE *)v16 + 200) = 1;
    *((_DWORD *)v16 + 51) = 0;
    *((_DWORD *)v16 + 52) = 0;
    *(_QWORD *)&block = v16 + 2;
    *((_QWORD *)&block + 1) = v16;
    std::shared_ptr<AT::IOBinding::Impl>::__enable_weak_this[abi:ne180100]<AT::IOBinding::Impl,AT::IOBinding::Impl,void>((uint64_t)&block, (_QWORD *)v16 + 4, (uint64_t)(v16 + 2));
    std::shared_ptr<PowerUsageWatchdog::ClientDescription>::operator=[abi:ne180100]((uint64_t)&v14->_impl, &block);
    v21 = (std::__shared_weak_count *)*((_QWORD *)&block + 1);
    if (*((_QWORD *)&block + 1))
    {
      v22 = (unint64_t *)(*((_QWORD *)&block + 1) + 8);
      do
        v23 = __ldaxr(v22);
      while (__stlxr(v23 - 1, v22));
      goto LABEL_16;
    }
  }
  else
  {
    v24 = operator new(0xE0uLL);
    *(_OWORD *)((char *)v24 + 8) = 0u;
    *(_QWORD *)v24 = &off_1E450FD58;
    v24[2] = 0u;
    v25 = 1.0 / a3;
    if (a3 <= 0.0)
      v25 = 0.01;
    *((float *)v24 + 12) = v25;
    *((_DWORD *)v24 + 13) = 0;
    *((_QWORD *)v24 + 7) = 0;
    *((_QWORD *)v24 + 8) = CreateDefaultPredictor;
    *((_QWORD *)v24 + 9) = 0;
    *((_QWORD *)v24 + 10) = ExecuteDefaultPredictor;
    *((_QWORD *)v24 + 11) = FinalizeDefaultPredictor;
    v26 = MEMORY[0x1E0C83FF0];
    v27 = *(_OWORD *)(MEMORY[0x1E0C83FF0] + 16);
    v24[6] = *MEMORY[0x1E0C83FF0];
    v24[7] = v27;
    v28 = *(_OWORD *)(v26 + 48);
    v24[8] = *(_OWORD *)(v26 + 32);
    v24[9] = v28;
    *((_QWORD *)v24 + 20) = 0;
    *((_QWORD *)v24 + 22) = 0;
    *((_BYTE *)v24 + 184) = a4;
    *((_QWORD *)v24 + 24) = 0;
    *((_BYTE *)v24 + 200) = 1;
    *((_DWORD *)v24 + 51) = 0;
    *((_DWORD *)v24 + 52) = 0;
    *(_QWORD *)&block = v24 + 2;
    *((_QWORD *)&block + 1) = v24;
    std::shared_ptr<AT::IOBinding::Impl>::__enable_weak_this[abi:ne180100]<AT::IOBinding::Impl,AT::IOBinding::Impl,void>((uint64_t)&block, (_QWORD *)v24 + 4, (uint64_t)(v24 + 2));
    std::shared_ptr<PowerUsageWatchdog::ClientDescription>::operator=[abi:ne180100]((uint64_t)&v14->_impl, &block);
    v21 = (std::__shared_weak_count *)*((_QWORD *)&block + 1);
    if (*((_QWORD *)&block + 1))
    {
      v29 = (unint64_t *)(*((_QWORD *)&block + 1) + 8);
      do
        v23 = __ldaxr(v29);
      while (__stlxr(v23 - 1, v29));
LABEL_16:
      if (!v23)
      {
        ((void (*)(std::__shared_weak_count *))v21->__on_zero_shared)(v21);
        std::__shared_weak_count::__release_weak(v21);
      }
    }
  }
  ptr = v15->_impl.__ptr_;
  v32 = *(_QWORD *)ptr;
  v31 = (std::__shared_weak_count *)*((_QWORD *)ptr + 1);
  if (v31)
  {
    p_shared_weak_owners = (unint64_t *)&v31->__shared_weak_owners_;
    do
      v34 = __ldxr(p_shared_weak_owners);
    while (__stxr(v34 + 1, p_shared_weak_owners));
  }
  dispatch_get_global_queue(25, 0);
  v35 = objc_claimAutoreleasedReturnValue();
  v36 = v35;
  v37 = MEMORY[0x1E0C809B0];
  *(_QWORD *)&block = MEMORY[0x1E0C809B0];
  *((_QWORD *)&block + 1) = 3321888768;
  v71 = ___ZN21ThreadSafeHeadTracker10InitializeEv_block_invoke;
  v72 = &__block_descriptor_56_ea8_40c46_ZTSNSt3__18weak_ptrI21ThreadSafeHeadTrackerEE_e5_v8__0l;
  v73 = ptr;
  v74 = v32;
  v75 = v31;
  if (v31)
  {
    v38 = (unint64_t *)&v31->__shared_weak_owners_;
    do
      v39 = __ldxr(v38);
    while (__stxr(v39 + 1, v38));
  }
  dispatch_async(v35, &block);

  if (!*((_BYTE *)ptr + 152))
    goto LABEL_39;
  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  v64 = 0;
  v65 = (uint64_t)&v64;
  v66 = 0x2020000000;
  v41 = (id *)getAVAudioSessionRouteChangeNotificationSymbolLoc(void)::ptr;
  v67 = (void *)getAVAudioSessionRouteChangeNotificationSymbolLoc(void)::ptr;
  if (!getAVAudioSessionRouteChangeNotificationSymbolLoc(void)::ptr)
  {
    v42 = AudioSessionLibrary();
    v41 = (id *)dlsym(v42, "AVAudioSessionRouteChangeNotification");
    *(_QWORD *)(v65 + 24) = v41;
    getAVAudioSessionRouteChangeNotificationSymbolLoc(void)::ptr = (uint64_t)v41;
  }
  _Block_object_dispose(&v64, 8);
  if (v41)
  {
    v43 = *v41;
    v64 = v37;
    v65 = 3321888768;
    v66 = (uint64_t)___ZN21ThreadSafeHeadTracker10InitializeEv_block_invoke_76;
    v67 = &__block_descriptor_48_ea8_32c46_ZTSNSt3__18weak_ptrI21ThreadSafeHeadTrackerEE_e24_v16__0__NSNotification_8l;
    v68 = v32;
    v69 = v31;
    if (v31)
    {
      v44 = (unint64_t *)&v31->__shared_weak_owners_;
      do
        v45 = __ldxr(v44);
      while (__stxr(v45 + 1, v44));
    }
    objc_msgSend(v40, "addObserverForName:object:queue:usingBlock:", v43, 0, 0, &v64);
    v46 = objc_claimAutoreleasedReturnValue();
    v47 = (void *)*((_QWORD *)ptr + 20);
    *((_QWORD *)ptr + 20) = v46;

    handler[0] = v37;
    handler[1] = 3321888768;
    handler[2] = ___ZN21ThreadSafeHeadTracker10InitializeEv_block_invoke_80;
    handler[3] = &__block_descriptor_48_ea8_32c46_ZTSNSt3__18weak_ptrI21ThreadSafeHeadTrackerEE_e8_v12__0i8l;
    handler[4] = v32;
    v63 = v31;
    if (v31)
    {
      v48 = (unint64_t *)&v31->__shared_weak_owners_;
      do
        v49 = __ldxr(v48);
      while (__stxr(v49 + 1, v48));
    }
    notify_register_dispatch("com.apple.coreaudio.attsht.outputlatency", (int *)ptr + 44, v36, handler);

    if (v63)
      std::__shared_weak_count::__release_weak(v63);
    if (v69)
      std::__shared_weak_count::__release_weak(v69);

LABEL_39:
    v60[0] = v37;
    v60[1] = 3321888768;
    v60[2] = ___ZN21ThreadSafeHeadTracker10InitializeEv_block_invoke_84;
    v60[3] = &__block_descriptor_48_ea8_32c46_ZTSNSt3__18weak_ptrI21ThreadSafeHeadTrackerEE_e8_v12__0i8l;
    v60[4] = v32;
    v61 = v31;
    if (v31)
    {
      v50 = (unint64_t *)&v31->__shared_weak_owners_;
      do
        v51 = __ldxr(v50);
      while (__stxr(v51 + 1, v50));
    }
    notify_register_dispatch("com.apple.coreaudio.attsht", (int *)ptr + 43, v36, v60);

    if (v61)
      std::__shared_weak_count::__release_weak(v61);
    if (v75)
      std::__shared_weak_count::__release_weak(v75);
    if (v31)
      std::__shared_weak_count::__release_weak(v31);
    v64 = 0;
    v65 = (uint64_t)&v64;
    v66 = 0x2050000000;
    v52 = (void *)getSWSystemSleepMonitorClass(void)::softClass;
    v67 = (void *)getSWSystemSleepMonitorClass(void)::softClass;
    if (!getSWSystemSleepMonitorClass(void)::softClass)
    {
      *(_QWORD *)&block = v37;
      *((_QWORD *)&block + 1) = 3221225472;
      v71 = ___ZL28getSWSystemSleepMonitorClassv_block_invoke;
      v72 = &unk_1E4519C48;
      v73 = (ThreadSafeHeadTracker *)&v64;
      ___ZL28getSWSystemSleepMonitorClassv_block_invoke((uint64_t)&block);
      v52 = *(void **)(v65 + 24);
    }
    v53 = objc_retainAutorelease(v52);
    _Block_object_dispose(&v64, 8);
    v54 = objc_msgSend([v53 alloc], "initWithIdentifier:queue:", CFSTR("ATThreadSafeHeadTracker"), v36);
    sleepMonitor = v15->_sleepMonitor;
    v15->_sleepMonitor = (SWSystemSleepMonitor *)v54;

    -[SWSystemSleepMonitor addObserver:](v15->_sleepMonitor, "addObserver:", v15);
    return v15;
  }
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v57 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "NSString *getAVAudioSessionRouteChangeNotification()");
  v58 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v57, "handleFailureInFunction:file:lineNumber:description:", v58, CFSTR("ATThreadSafeHeadTracker.mm"), 38, CFSTR("%s"), dlerror());

  __break(1u);
  return result;
}

- (void)dealloc
{
  objc_super v3;

  -[SWSystemSleepMonitor removeObserver:](self->_sleepMonitor, "removeObserver:", self);
  -[SWSystemSleepMonitor invalidate](self->_sleepMonitor, "invalidate");
  v3.receiver = self;
  v3.super_class = (Class)ATThreadSafeHeadTracker;
  -[ATThreadSafeHeadTracker dealloc](&v3, sel_dealloc);
}

- (void)handleSystemSleepMonitorDidWakeFromSleep
{
  NSObject *v3;
  ThreadSafeHeadTracker *ptr;
  uint64_t v5;
  unint64_t v6;
  unint64_t v7;
  NSObject *v8;
  uint8_t v9[16];
  uint8_t buf[16];
  uint8_t v11[16];

  ATThreadSafeHeadTrackerLog();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v9 = 0;
    _os_log_impl(&dword_1A0F4D000, v3, OS_LOG_TYPE_DEFAULT, "re-creating predictor after system did wake from sleep", v9, 2u);
  }

  ptr = self->_impl.__ptr_;
  v5 = (*((uint64_t (**)(_QWORD))ptr + 4))(*((_QWORD *)ptr + 5));
  if (v5)
  {
    v6 = v5;
    os_unfair_lock_lock((os_unfair_lock_t)ptr + 5);
    v7 = atomic_load((unint64_t *)ptr + 3);
    atomic_store(v6, (unint64_t *)ptr + 3);
    os_unfair_lock_unlock((os_unfair_lock_t)ptr + 5);
    if (v7)
      (*((void (**)(unint64_t))ptr + 7))(v7);
    ATThreadSafeHeadTrackerLog();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1A0F4D000, v8, OS_LOG_TYPE_DEFAULT, "swapped in recreated predictor and destroyed old predictor", buf, 2u);
    }
  }
  else
  {
    ATThreadSafeHeadTrackerLog();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)v11 = 0;
      _os_log_error_impl(&dword_1A0F4D000, v8, OS_LOG_TYPE_ERROR, "ATTSHT failed to recreate predictor", v11, 2u);
    }
  }

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sleepMonitor, 0);
  std::shared_ptr<PowerUsageWatchdog::ClientDescription>::~shared_ptr[abi:ne180100]((uint64_t)&self->_impl);
}

- (id).cxx_construct
{
  *((_QWORD *)self + 1) = 0;
  *((_QWORD *)self + 2) = 0;
  return self;
}

@end
