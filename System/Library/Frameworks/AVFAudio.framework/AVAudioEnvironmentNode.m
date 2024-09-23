@implementation AVAudioEnvironmentNode

- (AVAudioEnvironmentNode)init
{
  uint64_t v3;
  std::__shared_weak_count *v4;
  std::__shared_weak_count *v5;
  unint64_t *p_shared_owners;
  unint64_t v7;
  unint64_t *p_shared_weak_owners;
  unint64_t v9;
  unint64_t v10;
  AVAudioUnitEQFilterParameters *v16;
  _QWORD *v17;
  uint64_t v18;
  std::__shared_weak_count *v19;
  unint64_t *v20;
  unint64_t v21;
  unint64_t *v22;
  unint64_t v23;
  unint64_t v24;
  uint64_t v25;
  void *v26;
  uint64_t v27;
  unint64_t *v28;
  unint64_t v29;
  objc_super v31;
  __int128 v32;
  void (*v33)(uint64_t);
  void *v34;
  uint64_t v35;
  std::__shared_weak_count *v36;

  v3 = operator new();
  v32 = xmmword_19B85A2D0;
  LODWORD(v33) = 0;
  AVAudioNodeImpl::AVAudioNodeImpl(v3, 0, (const AudioComponentDescription *)&v32, 0);
  *(_QWORD *)v3 = &off_1E3BE9100;
  *(_DWORD *)(v3 + 184) = 1065353216;
  *(_QWORD *)(v3 + 192) = 0;
  *(_DWORD *)(v3 + 200) = 3;
  *(_QWORD *)(v3 + 216) = v3;
  v4 = (std::__shared_weak_count *)operator new(0x30uLL);
  v5 = v4;
  v4->__shared_owners_ = 0;
  p_shared_owners = (unint64_t *)&v4->__shared_owners_;
  v4->__shared_weak_owners_ = 0;
  v4->__vftable = (std::__shared_weak_count_vtbl *)&off_1E3BEB748;
  v4[1].__vftable = 0;
  v4[1].__shared_owners_ = 0;
  v4[1].__shared_weak_owners_ = v3 + 216;
  *(_QWORD *)(v3 + 224) = v4 + 1;
  *(_QWORD *)(v3 + 232) = v4;
  do
    v7 = __ldxr(p_shared_owners);
  while (__stxr(v7 + 1, p_shared_owners));
  p_shared_weak_owners = (unint64_t *)&v4->__shared_weak_owners_;
  do
    v9 = __ldxr(p_shared_weak_owners);
  while (__stxr(v9 + 1, p_shared_weak_owners));
  v4[1].__vftable = (std::__shared_weak_count_vtbl *)&v4[1];
  v4[1].__shared_owners_ = (uint64_t)v4;
  do
    v10 = __ldaxr(p_shared_owners);
  while (__stlxr(v10 - 1, p_shared_owners));
  if (!v10)
  {
    ((void (*)(std::__shared_weak_count *))v4->__on_zero_shared)(v4);
    std::__shared_weak_count::__release_weak(v5);
  }
  *(_BYTE *)(v3 + 240) = 0;
  *(_BYTE *)(v3 + 256) = 0;
  *(_QWORD *)(v3 + 264) = 0;
  *(_DWORD *)(v3 + 272) = 0;
  *(_QWORD *)(v3 + 292) = 1065353216;
  *(_OWORD *)(v3 + 276) = kInitialVectorOrientation;
  *(_DWORD *)(v3 + 300) = 0;
  *(_QWORD *)(v3 + 304) = 0;
  *(_QWORD *)(v3 + 328) = 0;
  *(_QWORD *)(v3 + 336) = 0;
  *(_QWORD *)(v3 + 312) = v3 + 320;
  *(_QWORD *)(v3 + 320) = 0;
  *(_QWORD *)(v3 + 344) = 0x47C3500000000002;
  __asm { FMOV            V0.2S, #1.0 }
  *(_QWORD *)(v3 + 352) = _D0;
  *(_QWORD *)(v3 + 360) = 0;
  *(_QWORD *)(v3 + 368) = 0;
  *(_BYTE *)(v3 + 376) = 0;
  *(_OWORD *)(v3 + 380) = xmmword_19B85A2E0;
  *(_QWORD *)(v3 + 336) = -[AVAudioEnvironmentDistanceAttenuationParameters initWithEnvironment:]([AVAudioEnvironmentDistanceAttenuationParameters alloc], "initWithEnvironment:", v3);
  v16 = [AVAudioUnitEQFilterParameters alloc];
  v17 = (_QWORD *)operator new();
  *v17 = &off_1E3BE98B8;
  v17[1] = v3;
  v17[2] = v3;
  *(_QWORD *)(v3 + 368) = -[AVAudioUnitEQFilterParameters initWithImpl:](v16, "initWithImpl:", v17);
  *(_QWORD *)(v3 + 360) = -[AVAudioEnvironmentReverbParameters initWithEnvironment:]([AVAudioEnvironmentReverbParameters alloc], "initWithEnvironment:", v3);
  v18 = *(_QWORD *)(v3 + 216);
  v19 = *(std::__shared_weak_count **)(v3 + 232);
  if (v19)
  {
    v20 = (unint64_t *)&v19->__shared_owners_;
    do
      v21 = __ldxr(v20);
    while (__stxr(v21 + 1, v20));
    v22 = (unint64_t *)&v19->__shared_weak_owners_;
    do
      v23 = __ldxr(v22);
    while (__stxr(v23 + 1, v22));
    do
      v24 = __ldaxr(v20);
    while (__stlxr(v24 - 1, v20));
    if (!v24)
    {
      ((void (*)(std::__shared_weak_count *))v19->__on_zero_shared)(v19);
      std::__shared_weak_count::__release_weak(v19);
    }
  }
  v25 = objc_msgSend(MEMORY[0x1E0CFF1C0], "sharedInstance");
  v26 = (void *)objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v27 = *MEMORY[0x1E0CFF180];
  *(_QWORD *)&v32 = MEMORY[0x1E0C809B0];
  *((_QWORD *)&v32 + 1) = 3321888768;
  v33 = ___ZN26AVAudioEnvironmentNodeImplC2Ev_block_invoke;
  v34 = &__block_descriptor_48_e8_32c68_ZTSN5caulk14lifetime_guardI26AVAudioEnvironmentNodeImplvE8weak_refE_e24_v16__0__NSNotification_8l;
  v35 = v18;
  v36 = v19;
  if (v19)
  {
    v28 = (unint64_t *)&v19->__shared_weak_owners_;
    do
      v29 = __ldxr(v28);
    while (__stxr(v29 + 1, v28));
  }
  *(_QWORD *)(v3 + 208) = objc_msgSend(v26, "addObserverForName:object:queue:usingBlock:", v27, v25, 0, &v32);
  AVAudioEnvironmentNodeImpl::SetMixerDistanceParameters((AVAudioEnvironmentNodeImpl *)v3);
  AVAudioEnvironmentNodeImpl::UpdateAutomaticOutputType((AVAudioEnvironmentNodeImpl *)v3);
  if (v36)
    std::__shared_weak_count::__release_weak(v36);
  if (v19)
    std::__shared_weak_count::__release_weak(v19);
  v31.receiver = self;
  v31.super_class = (Class)AVAudioEnvironmentNode;
  return -[AVAudioNode initWithImpl:](&v31, sel_initWithImpl_, v3);
}

- (void)setOutputType:(AVAudioEnvironmentOutputType)outputType
{
  void **p_impl;
  AVAudioEnvironmentNodeImpl *v5;
  NSObject *v6;
  int v7;
  NSObject *v8;
  NSObject *v9;
  std::recursive_mutex *v10;
  char v11;
  std::recursive_mutex *v12;
  char v13;
  int v14;
  uint8_t buf[4];
  const char *v16;
  __int16 v17;
  int v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  p_impl = &self->super._impl;
  AVAudioNodeImplBase::GetAttachAndEngineLock((AVAudioNodeImplBase *)&v10, (uint64_t)self->super._impl);
  v5 = (AVAudioEnvironmentNodeImpl *)*p_impl;
  if (*((_QWORD *)v5 + 24) != outputType)
  {
    *((_QWORD *)v5 + 24) = outputType;
    switch(outputType)
    {
      case AVAudioEnvironmentOutputTypeAuto:
        AVAudioEnvironmentNodeImpl::UpdateAutomaticOutputType(v5);
        break;
      case AVAudioEnvironmentOutputTypeHeadphones:
        v14 = 1;
        if (AVAudioEngineLogCategory(void)::once != -1)
          dispatch_once(&AVAudioEngineLogCategory(void)::once, &__block_literal_global_7560);
        v6 = *(NSObject **)AVAudioEngineLogCategory(void)::category;
        v7 = 1;
        if (os_log_type_enabled(*(os_log_t *)AVAudioEngineLogCategory(void)::category, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 136315394;
          v16 = "AVAudioEnvironmentNodeImpl.mm";
          v17 = 1024;
          v18 = 324;
          _os_log_impl(&dword_19B733000, v6, OS_LOG_TYPE_INFO, "%25s:%-5d setting output type = headphones", buf, 0x12u);
        }
        goto LABEL_18;
      case AVAudioEnvironmentOutputTypeBuiltInSpeakers:
        v14 = 2;
        if (AVAudioEngineLogCategory(void)::once != -1)
          dispatch_once(&AVAudioEngineLogCategory(void)::once, &__block_literal_global_7560);
        v8 = *(NSObject **)AVAudioEngineLogCategory(void)::category;
        if (os_log_type_enabled(*(os_log_t *)AVAudioEngineLogCategory(void)::category, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 136315394;
          v16 = "AVAudioEnvironmentNodeImpl.mm";
          v17 = 1024;
          v18 = 329;
          _os_log_impl(&dword_19B733000, v8, OS_LOG_TYPE_INFO, "%25s:%-5d setting output type = built-in speakers", buf, 0x12u);
        }
        v7 = 2;
        goto LABEL_18;
      case AVAudioEnvironmentOutputTypeExternalSpeakers:
        v14 = 3;
        if (AVAudioEngineLogCategory(void)::once != -1)
          dispatch_once(&AVAudioEngineLogCategory(void)::once, &__block_literal_global_7560);
        v9 = *(NSObject **)AVAudioEngineLogCategory(void)::category;
        if (os_log_type_enabled(*(os_log_t *)AVAudioEngineLogCategory(void)::category, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 136315394;
          v16 = "AVAudioEnvironmentNodeImpl.mm";
          v17 = 1024;
          v18 = 319;
          _os_log_impl(&dword_19B733000, v9, OS_LOG_TYPE_INFO, "%25s:%-5d setting output type = external speakers", buf, 0x12u);
        }
        v7 = 3;
LABEL_18:
        if (v7 != *((_DWORD *)v5 + 50))
        {
          *((_DWORD *)v5 + 50) = v7;
          (*(void (**)(AVAudioEnvironmentNodeImpl *, uint64_t, _QWORD, _QWORD, int *, uint64_t))(*(_QWORD *)v5 + 144))(v5, 3100, 0, 0, &v14, 4);
        }
        break;
      default:
        break;
    }
  }
  if (v13)
    std::recursive_mutex::unlock(v12);
  if (v11)
    std::recursive_mutex::unlock(v10);
}

- (AVAudioEnvironmentOutputType)outputType
{
  AVAudioEnvironmentOutputType v3;
  std::recursive_mutex *v5;
  char v6;
  std::recursive_mutex *v7;
  char v8;

  AVAudioNodeImplBase::GetAttachAndEngineLock((AVAudioNodeImplBase *)&v5, (uint64_t)self->super._impl);
  v3 = *((_QWORD *)self->super._impl + 24);
  if (v8)
    std::recursive_mutex::unlock(v7);
  if (v6)
    std::recursive_mutex::unlock(v5);
  return v3;
}

- (void)setOutputVolume:(float)outputVolume
{
  __n128 v5;
  float *impl;
  float v7;
  std::recursive_mutex *v8;
  char v9;
  std::recursive_mutex *v10;
  char v11;

  AVAudioNodeImplBase::GetAttachAndEngineLock((AVAudioNodeImplBase *)&v8, (uint64_t)self->super._impl);
  impl = (float *)self->super._impl;
  if (impl[46] != outputVolume)
  {
    v7 = 1.0;
    if (outputVolume < 1.0)
      v7 = outputVolume;
    if (outputVolume <= 0.0)
      v7 = 0.0;
    impl[46] = v7;
    if (v7 <= 0.0)
      v5.n128_u32[0] = -1024458752;
    else
      v5.n128_f32[0] = log10f(v7) * 20.0;
    (*(void (**)(float *, uint64_t, uint64_t, _QWORD, __n128))(*(_QWORD *)impl + 128))(impl, 3, 2, 0, v5);
  }
  if (v11)
    std::recursive_mutex::unlock(v10);
  if (v9)
    std::recursive_mutex::unlock(v8);
}

- (void)setListenerHeadTrackingEnabled:(BOOL)a3
{
  _BOOL4 v3;
  void **p_impl;
  void *v5;
  NSObject *v6;
  const char *v7;
  std::recursive_mutex *v8;
  char v9;
  std::recursive_mutex *v10;
  char v11;
  _BOOL4 v12;
  uint8_t buf[4];
  const char *v14;
  __int16 v15;
  int v16;
  __int16 v17;
  const char *v18;
  uint64_t v19;

  v3 = a3;
  v19 = *MEMORY[0x1E0C80C00];
  p_impl = &self->super._impl;
  AVAudioNodeImplBase::GetAttachAndEngineLock((AVAudioNodeImplBase *)&v8, (uint64_t)self->super._impl);
  v5 = *p_impl;
  v12 = v3;
  if (((*(uint64_t (**)(void *, uint64_t, _QWORD, _QWORD, _BOOL4 *, uint64_t))(*(_QWORD *)v5 + 144))(v5, 3111, 0, 0, &v12, 4) & 1) == 0)
  {
    if (AVAudioEngineLogCategory(void)::once != -1)
      dispatch_once(&AVAudioEngineLogCategory(void)::once, &__block_literal_global_7560);
    v6 = *(NSObject **)AVAudioEngineLogCategory(void)::category;
    if (os_log_type_enabled(*(os_log_t *)AVAudioEngineLogCategory(void)::category, OS_LOG_TYPE_ERROR))
    {
      v7 = "Enabling";
      v14 = "AVAudioEnvironmentNodeImpl.mm";
      *(_DWORD *)buf = 136315650;
      if (!v12)
        v7 = "Disabling";
      v15 = 1024;
      v16 = 354;
      v17 = 2080;
      v18 = v7;
      _os_log_impl(&dword_19B733000, v6, OS_LOG_TYPE_ERROR, "%25s:%-5d error %s spatial mixer headtracking", buf, 0x1Cu);
    }
  }
  if (v11)
    std::recursive_mutex::unlock(v10);
  if (v9)
    std::recursive_mutex::unlock(v8);
}

- (BOOL)isListenerHeadTrackingEnabled
{
  void **p_impl;
  void *v3;
  NSObject *v4;
  int v5;
  std::recursive_mutex *v7;
  char v8;
  std::recursive_mutex *v9;
  char v10;
  int v11;
  uint8_t buf[4];
  const char *v13;
  __int16 v14;
  int v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  p_impl = &self->super._impl;
  AVAudioNodeImplBase::GetAttachAndEngineLock((AVAudioNodeImplBase *)&v7, (uint64_t)self->super._impl);
  v3 = *p_impl;
  v11 = 0;
  if (((*(uint64_t (**)(void *, uint64_t, _QWORD, _QWORD, int *, uint64_t))(*(_QWORD *)v3 + 152))(v3, 3111, 0, 0, &v11, 4) & 1) == 0)
  {
    if (AVAudioEngineLogCategory(void)::once != -1)
      dispatch_once(&AVAudioEngineLogCategory(void)::once, &__block_literal_global_7560);
    v4 = *(NSObject **)AVAudioEngineLogCategory(void)::category;
    if (os_log_type_enabled(*(os_log_t *)AVAudioEngineLogCategory(void)::category, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      v13 = "AVAudioEnvironmentNodeImpl.mm";
      v14 = 1024;
      v15 = 368;
      _os_log_impl(&dword_19B733000, v4, OS_LOG_TYPE_ERROR, "%25s:%-5d error getting spatial mixer headtracking property", buf, 0x12u);
    }
  }
  v5 = v11;
  if (v10)
    std::recursive_mutex::unlock(v9);
  if (v8)
    std::recursive_mutex::unlock(v7);
  return v5 != 0;
}

- (float)outputVolume
{
  float v3;
  std::recursive_mutex *v5;
  char v6;
  std::recursive_mutex *v7;
  char v8;

  AVAudioNodeImplBase::GetAttachAndEngineLock((AVAudioNodeImplBase *)&v5, (uint64_t)self->super._impl);
  v3 = *((float *)self->super._impl + 46);
  if (v8)
    std::recursive_mutex::unlock(v7);
  if (v6)
    std::recursive_mutex::unlock(v5);
  return v3;
}

- (AVAudioNodeBus)nextAvailableInputBus
{
  _QWORD *impl;
  AVAudioNodeBus v4;
  AVAudioNodeBus v5;
  uint64_t v6;
  std::recursive_mutex *v8;
  char v9;
  std::recursive_mutex *v10;
  char v11;

  AVAudioNodeImplBase::GetAttachAndEngineLock((AVAudioNodeImplBase *)&v8, (uint64_t)self->super._impl);
  impl = self->super._impl;
  v4 = impl[4];
  if (v4)
  {
    v5 = 0;
    v6 = impl[3];
    while (((*(_QWORD *)(v6 + ((v5 >> 3) & 0x1FFFFFFFFFFFFFF8)) >> v5) & 1) != 0)
    {
      if (v4 == ++v5)
      {
        v5 = v4;
        break;
      }
    }
  }
  else
  {
    v5 = 0;
  }
  if (v11)
    std::recursive_mutex::unlock(v10);
  if (v9)
    std::recursive_mutex::unlock(v8);
  return v5;
}

- (NSArray)applicableRenderingAlgorithms
{
  unsigned int v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  NSArray *v12;
  std::recursive_mutex *v14;
  char v15;
  std::recursive_mutex *v16;
  char v17;

  AVAudioNodeImplBase::GetAttachAndEngineLock((AVAudioNodeImplBase *)&v14, (uint64_t)self->super._impl);
  v3 = objc_msgSend((id)(*(uint64_t (**)(void *, _QWORD))(*(_QWORD *)self->super._impl + 48))(self->super._impl, 0), "channelCount");
  v4 = (void *)MEMORY[0x1E0C99D20];
  if (v3 < 3)
  {
    v7 = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", 0);
    v8 = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", 1);
    v9 = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", 2);
    v10 = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", 6);
    v11 = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", 3);
    v6 = objc_msgSend(v4, "arrayWithObjects:", v7, v8, v9, v10, v11, objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", 7), 0);
  }
  else
  {
    v5 = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", 3);
    v6 = objc_msgSend(v4, "arrayWithObjects:", v5, objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", 7), 0);
  }
  v12 = (NSArray *)v6;
  if (v17)
    std::recursive_mutex::unlock(v16);
  if (v15)
    std::recursive_mutex::unlock(v14);
  return v12;
}

- (void)setListenerPosition:(AVAudio3DPoint)listenerPosition
{
  float z;
  float y;
  float x;
  float *impl;
  float *v8;
  float *v9;
  float *v10;
  float *v11;
  BOOL v12;
  std::recursive_mutex *v13;
  char v14;
  std::recursive_mutex *v15;
  char v16;

  z = listenerPosition.z;
  y = listenerPosition.y;
  x = listenerPosition.x;
  AVAudioNodeImplBase::GetAttachAndEngineLock((AVAudioNodeImplBase *)&v13, (uint64_t)self->super._impl);
  impl = (float *)self->super._impl;
  if (impl[66] != x || impl[67] != y || impl[68] != z)
  {
    impl[66] = x;
    impl[67] = y;
    impl[68] = z;
    v8 = (float *)*((_QWORD *)impl + 39);
    v9 = impl + 80;
    if (v8 != impl + 80)
    {
      do
      {
        AVAudio3DMixingImpl::RecalculateAndSetSphericalCoordsOnMixer(*((AVAudio3DMixingImpl **)v8 + 4));
        v10 = (float *)*((_QWORD *)v8 + 1);
        if (v10)
        {
          do
          {
            v11 = v10;
            v10 = *(float **)v10;
          }
          while (v10);
        }
        else
        {
          do
          {
            v11 = (float *)*((_QWORD *)v8 + 2);
            v12 = *(_QWORD *)v11 == (_QWORD)v8;
            v8 = v11;
          }
          while (!v12);
        }
        v8 = v11;
      }
      while (v11 != v9);
    }
  }
  if (v16)
    std::recursive_mutex::unlock(v15);
  if (v14)
    std::recursive_mutex::unlock(v13);
}

- (AVAudio3DPoint)listenerPosition
{
  float *impl;
  float v4;
  float v5;
  float v6;
  float v7;
  float v8;
  float v9;
  std::recursive_mutex *v10;
  char v11;
  std::recursive_mutex *v12;
  char v13;
  AVAudio3DPoint result;

  AVAudioNodeImplBase::GetAttachAndEngineLock((AVAudioNodeImplBase *)&v10, (uint64_t)self->super._impl);
  impl = (float *)self->super._impl;
  v4 = impl[66];
  v5 = impl[67];
  v6 = impl[68];
  if (v13)
    std::recursive_mutex::unlock(v12);
  if (v11)
    std::recursive_mutex::unlock(v10);
  v7 = v4;
  v8 = v5;
  v9 = v6;
  result.z = v9;
  result.y = v8;
  result.x = v7;
  return result;
}

- (void)setListenerVectorOrientation:(AVAudio3DVectorOrientation *)listenerVectorOrientation
{
  void **p_impl;
  char *v5;
  float x;
  float y;
  float z;
  __int128 v9;
  float32x4_t v10;
  float v11;
  float v12;
  float v13;
  float v14;
  float v15;
  float v16;
  int v17;
  float v18;
  float v19;
  float v20;
  float v21;
  float v22;
  float v23;
  float32x4_t v24;
  float32x4_t v25;
  float v26;
  float v27;
  float v28;
  float v29;
  float cosval;
  __float2 v31;
  float v32;
  float v33;
  float v34;
  float v35;
  float v36;
  float v37;
  float v38;
  float v39;
  float v40;
  float v41;
  float v42;
  float v43;
  float v44;
  float v45;
  float v46;
  float v47;
  float v48;
  int v49;
  float v50;
  __float2 v51;
  float v52;
  float v53;
  float v54;
  float v55;
  float v56;
  float v57;
  float v58;
  float v59;
  float v60;
  float v61;
  float v62;
  float v63;
  float v64;
  float v65;
  float v66;
  float v67;
  float v68;
  float v69;
  int v70;
  int32x4_t v71;
  float32x4_t v72;
  float32x4_t v73;
  float v74;
  float v76;
  float v77;
  float v78;
  float v79;
  float32x2_t v80;
  float32x2_t v81;
  float v82;
  float v83;
  float v84;
  float v85;
  float32x2_t v86;
  float32x2_t v87;
  float v88;
  float v89;
  unsigned int v90;
  float32x2_t v91;
  float32x2_t v92;
  float v93;
  float v94;
  float v95;
  float v96;
  float v97;
  float v98;
  float v99;
  float32x2_t v100;
  float32x2_t v101;
  __int128 v102;
  float v103;
  __int128 v104;
  float v105;
  float v106;
  std::recursive_mutex *v107;
  char v108;
  std::recursive_mutex *v109;
  char v110;
  __int128 v111;
  uint64_t v112;

  v112 = *MEMORY[0x1E0C80C00];
  p_impl = &self->super._impl;
  AVAudioNodeImplBase::GetAttachAndEngineLock((AVAudioNodeImplBase *)&v107, (uint64_t)self->super._impl);
  v5 = (char *)*p_impl;
  x = listenerVectorOrientation->forward.x;
  y = listenerVectorOrientation->forward.y;
  z = listenerVectorOrientation->forward.z;
  *(_QWORD *)&v9 = *(_QWORD *)&listenerVectorOrientation->up.x;
  v10.i32[0] = LODWORD(listenerVectorOrientation->forward.x);
  v10.f32[1] = z;
  v10.i64[1] = v9;
  v11 = listenerVectorOrientation->up.z;
  if (((vmaxv_u16((uint16x4_t)vmovn_s32((int32x4_t)vmvnq_s8((int8x16_t)vceqzq_f32(v10)))) & 1) != 0
     || y != 0.0
     || v11 != 0.0)
    && (*((float *)v5 + 69) != x
     || *((float *)v5 + 70) != y
     || *((float *)v5 + 71) != z
     || *((float *)v5 + 72) != *(float *)&v9
     || *((float *)v5 + 73) != *((float *)&v9 + 1)
     || *((float *)v5 + 74) != v11))
  {
    v12 = sqrtf((float)((float)(y * y) + (float)(x * x)) + (float)(z * z));
    if (v12 != 0.0)
    {
      v13 = 1.0 / v12;
      x = x * v13;
      y = y * v13;
      z = z * v13;
    }
    v14 = *((float *)&v9 + 1);
    v15 = sqrtf(vmlas_n_f32(vmuls_lane_f32(*((float *)&v9 + 1), *(float32x2_t *)&v9, 1), *(float *)&v9, *(float *)&v9)+ (float)(v11 * v11));
    if (v15 != 0.0)
    {
      v16 = 1.0 / v15;
      *(float *)&v9 = *(float *)&v9 * v16;
      v14 = *((float *)&v9 + 1) * v16;
      v11 = v11 * v16;
    }
    *((float *)v5 + 69) = x;
    *((float *)v5 + 70) = y;
    *((float *)v5 + 71) = z;
    *((_DWORD *)v5 + 72) = v9;
    *((float *)v5 + 73) = v14;
    *((float *)v5 + 74) = v11;
    v105 = z;
    v106 = v11;
    if (fabsf(z) <= 0.0001)
    {
      *((_DWORD *)v5 + 75) = 0;
      v21 = (double)((SLODWORD(y) >> 31) | 1) * 90.0;
      *((float *)v5 + 76) = v21;
      v22 = 1.0;
      if (v11 <= 1.0)
      {
        v22 = v11;
        if (v11 < -1.0)
          v22 = -1.0;
      }
      v23 = acosf(v22);
      v26 = v106;
      v27 = 57.296;
    }
    else
    {
      v17 = (SLODWORD(x) >> 31) | 1;
      v18 = (float)((float)((float)(x * 0.0) + 0.0) - z) / sqrtf((float)((float)(x * x) + 0.0) + (float)(z * z));
      v103 = x;
      v104 = v9;
      if ((LODWORD(z) & 0x80000000) != 0)
      {
        v28 = 1.0;
        if (v18 <= 1.0)
        {
          v28 = v18;
          if (v18 < -1.0)
            v28 = -1.0;
        }
        v20 = (float)((float)v17 * 57.296) * acosf(v28);
      }
      else
      {
        v19 = 1.0;
        if (v18 <= 1.0)
        {
          v19 = v18;
          if (v18 < -1.0)
            v19 = -1.0;
        }
        v20 = ((float)(acosf(v19) * -57.296) + 180.0) * -(double)v17;
      }
      *((float *)v5 + 75) = v20;
      v31 = __sincosf_stret((float)(v20 * 0.017453) * 0.5);
      cosval = v31.__cosval;
      LODWORD(v29) = *(_QWORD *)&v31;
      v32 = (float)(v29 * 0.0) + (float)(cosval * 0.0);
      v33 = v29 - (float)(cosval * 0.0);
      v34 = cosval + (float)((float)(v29 * 0.0) * 0.0);
      v35 = -v33;
      v36 = -(float)((float)(cosval * 0.0) - (float)(v29 * 0.0));
      v37 = sqrtf((float)((float)((float)(v32 * v32) + (float)(v34 * v34)) + (float)(v33 * v33))+ (float)((float)-(float)((float)(v29 * 0.0) - (float)(cosval * 0.0))* (float)-(float)((float)(v29 * 0.0) - (float)(cosval * 0.0))));
      if (v37 == 0.0)
      {
        v39 = cosval + (float)((float)(v29 * 0.0) * 0.0);
      }
      else
      {
        v38 = 1.0 / v37;
        v39 = v34 * (float)(1.0 / v37);
        v32 = v32 * v38;
        v35 = v38 * v35;
        v36 = v38 * v36;
      }
      v40 = v36 + (float)((float)((float)(v32 * -0.0) + (float)(v39 * 0.0)) + (float)(v35 * -0.0));
      v41 = (float)((float)((float)(v32 * 0.0) + (float)(v39 * 0.0)) - v35) + (float)(v36 * -0.0);
      v42 = (float)((float)(v32 + (float)(v39 * 0.0)) + (float)(v35 * 0.0)) + (float)(v36 * 0.0);
      v43 = (float)((float)((float)(v32 * 0.0) - v39) + (float)(v35 * -0.0)) + (float)(v36 * 0.0);
      v44 = (float)((float)((float)(v34 * v41) - (float)(v40 * v32)) - (float)(v42 * v36)) + (float)(v43 * v35);
      v45 = (float)((float)((float)(v36 * v41) - (float)(v40 * v35)) + (float)(v42 * v34)) - (float)(v43 * v32);
      v46 = (float)((float)((float)-(float)(v35 * v41) - (float)(v40 * v36)) + (float)(v42 * v32)) + (float)(v43 * v34);
      v47 = (float)((float)((float)(y * v45) + (float)(v103 * v44)) + (float)(v105 * v46))
          / sqrtf((float)((float)(v45 * v45) + (float)(v44 * v44)) + (float)(v46 * v46));
      v48 = 1.0;
      if (v47 <= 1.0)
      {
        v48 = v47;
        if (v47 < -1.0)
          v48 = -1.0;
      }
      v49 = (SLODWORD(y) >> 31) | 1;
      v50 = (float)(acosf(v48) * 57.296) * (float)v49;
      *((float *)v5 + 76) = v50;
      v51 = __sincosf_stret((float)(v50 * 0.017453) * 0.5);
      v52 = -(float)((float)(v29 * v51.__sinval) - (float)((float)(cosval * v51.__cosval) * 0.0));
      v53 = (float)(v29 * (float)(v51.__cosval * 0.0)) + (float)(v51.__sinval * cosval);
      v54 = (float)(cosval * (float)(v51.__sinval * -0.0)) + (float)(v51.__cosval * v29);
      v55 = (float)(cosval * v51.__cosval) + (float)((float)(v29 * v51.__sinval) * 0.0);
      v56 = -v54;
      v57 = -(float)((float)((float)(cosval * v51.__cosval) * 0.0) - (float)(v29 * v51.__sinval));
      v58 = sqrtf((float)((float)((float)(v53 * v53) + (float)(v55 * v55)) + (float)(v54 * v54)) + (float)(v52 * v52));
      if (v58 == 0.0)
      {
        v60 = (float)(cosval * v51.__cosval) + (float)((float)(v29 * v51.__sinval) * 0.0);
      }
      else
      {
        v59 = 1.0 / v58;
        v60 = v55 * (float)(1.0 / v58);
        v53 = v53 * v59;
        v56 = v59 * v56;
        v57 = v59 * v57;
      }
      v61 = (float)((float)((float)(v53 * -0.0) + (float)(v60 * 0.0)) - v56) + (float)(v57 * -0.0);
      v62 = (float)((float)((float)(v53 * 0.0) + (float)(v60 * 0.0)) + (float)(v56 * 0.0)) - v57;
      v63 = (float)((float)(v60 + (float)(v53 * -0.0)) + (float)(v56 * 0.0)) + (float)(v57 * 0.0);
      v64 = (float)((float)(v53 + (float)(v60 * 0.0)) + (float)(v56 * -0.0)) + (float)(v57 * 0.0);
      v65 = (float)((float)((float)(v55 * v62) - (float)(v61 * v53)) - (float)(v63 * v57)) + (float)(v64 * v56);
      v66 = (float)((float)((float)(v57 * v62) - (float)(v61 * v56)) + (float)(v63 * v55)) - (float)(v64 * v53);
      v67 = (float)((float)((float)-(float)(v56 * v62) - (float)(v61 * v57)) + (float)(v63 * v53)) + (float)(v64 * v55);
      v68 = (float)((float)((float)(v14 * v66) + (float)(*(float *)&v104 * v65)) + (float)(v106 * v67))
          / sqrtf((float)((float)(v66 * v66) + (float)(v65 * v65)) + (float)(v67 * v67));
      v69 = 1.0;
      if (v68 <= 1.0)
      {
        v69 = v68;
        if (v68 < -1.0)
          v69 = -1.0;
      }
      v23 = acosf(v69) * 57.296;
      v26 = v106;
      v24.i64[1] = *((_QWORD *)&v104 + 1);
      if (COERCE_INT((float)(v67 * *(float *)&v104) - (float)(v65 * v106)) >= 0)
        v70 = (SLODWORD(y) >> 31) | 1;
      else
        v70 = -v49;
      v27 = (float)v70;
    }
    *((float *)v5 + 77) = v23 * v27;
    v25.i64[0] = *(_QWORD *)(v5 + 276);
    v25.f32[2] = v105;
    v71 = (int32x4_t)vnegq_f32(v25);
    v24.i64[0] = *((_QWORD *)v5 + 36);
    v72 = v24;
    v72.f32[2] = v26;
    v73 = vmlsq_f32(vmulq_f32((float32x4_t)vextq_s8((int8x16_t)vuzp1q_s32(v71, v71), (int8x16_t)v71, 0xCuLL), vnegq_f32(v72)), (float32x4_t)vextq_s8((int8x16_t)vuzp1q_s32((int32x4_t)v72, (int32x4_t)v72), (int8x16_t)v72, 0xCuLL), v25);
    v74 = *(float *)&v71.i32[2] + (float)(v24.f32[1] + v73.f32[2]);
    if (v74 >= 0.0)
    {
      v84 = sqrtf(v74 + 1.0);
      v85 = v84 + v84;
      v86 = vrecpe_f32((float32x2_t)COERCE_UNSIGNED_INT(v84 + v84));
      v87 = vmul_f32(v86, vrecps_f32((float32x2_t)COERCE_UNSIGNED_INT(v84 + v84), v86));
      v88 = vmul_f32(v87, vrecps_f32((float32x2_t)COERCE_UNSIGNED_INT(v84 + v84), v87)).f32[0];
      v94 = (float)(v26 - *(float *)&v71.i32[1]) * v88;
      v95 = (float)(*(float *)v71.i32 - v73.f32[1]) * v88;
      v96 = (float)(v73.f32[0] - v24.f32[0]) * v88;
      v83 = v85 * 0.25;
    }
    else
    {
      if (v73.f32[2] >= v24.f32[1] && v73.f32[2] >= *(float *)&v71.i32[2])
      {
        v89 = sqrtf((float)((float)(1.0 - v24.f32[1]) - *(float *)&v71.i32[2]) + v73.f32[2]);
        *(float *)&v90 = v89 + v89;
        v91 = vrecpe_f32((float32x2_t)v90);
        v92 = vmul_f32(v91, vrecps_f32((float32x2_t)v90, v91));
        v93 = vmul_f32(v92, vrecps_f32((float32x2_t)v90, v92)).f32[0];
        v94 = *(float *)&v90 * 0.25;
        v95 = (float)(v24.f32[0] + v73.f32[0]) * v93;
        v96 = (float)(*(float *)v71.i32 + v73.f32[1]) * v93;
        v97 = v26 - *(float *)&v71.i32[1];
LABEL_54:
        v83 = v97 * v93;
        goto LABEL_55;
      }
      v76 = 1.0 - v73.f32[2];
      v77 = *(float *)&v71.i32[1] + v26;
      if (v24.f32[1] >= *(float *)&v71.i32[2])
      {
        v98 = sqrtf(v24.f32[1] + (float)(v76 - *(float *)&v71.i32[2]));
        v99 = v98 + v98;
        v100 = vrecpe_f32((float32x2_t)COERCE_UNSIGNED_INT(v98 + v98));
        v101 = vmul_f32(v100, vrecps_f32((float32x2_t)COERCE_UNSIGNED_INT(v98 + v98), v100));
        v93 = vmul_f32(v101, vrecps_f32((float32x2_t)COERCE_UNSIGNED_INT(v98 + v98), v101)).f32[0];
        v94 = (float)(v24.f32[0] + v73.f32[0]) * v93;
        v95 = v99 * 0.25;
        v96 = v77 * v93;
        v97 = *(float *)v71.i32 - v73.f32[1];
        goto LABEL_54;
      }
      v78 = sqrtf(*(float *)&v71.i32[2] + (float)(v76 - v24.f32[1]));
      v79 = v78 + v78;
      v80 = vrecpe_f32((float32x2_t)COERCE_UNSIGNED_INT(v78 + v78));
      v81 = vmul_f32(v80, vrecps_f32((float32x2_t)COERCE_UNSIGNED_INT(v78 + v78), v80));
      v82 = vmul_f32(v81, vrecps_f32((float32x2_t)COERCE_UNSIGNED_INT(v78 + v78), v81)).f32[0];
      v94 = (float)(*(float *)v71.i32 + v73.f32[1]) * v82;
      v95 = v77 * v82;
      v96 = v79 * 0.25;
      v83 = (float)(v73.f32[0] - v24.f32[0]) * v82;
    }
LABEL_55:
    *(float *)&v102 = -v96;
    *((float *)&v102 + 1) = v94;
    *((float *)&v102 + 2) = -v95;
    *((float *)&v102 + 3) = v83;
    v111 = v102;
    (*(void (**)(char *, uint64_t, _QWORD, _QWORD, __int128 *, uint64_t))(*(_QWORD *)v5 + 144))(v5, 3102, 0, 0, &v111, 16);
  }
  if (v110)
    std::recursive_mutex::unlock(v109);
  if (v108)
    std::recursive_mutex::unlock(v107);
}

- (AVAudio3DVectorOrientation)listenerVectorOrientation
{
  AVAudio3DVectorOrientation *result;
  std::recursive_mutex *v6;
  char v7;
  std::recursive_mutex *v8;
  char v9;

  AVAudioNodeImplBase::GetAttachAndEngineLock((AVAudioNodeImplBase *)&v6, (uint64_t)self->super._impl);
  *retstr = *(AVAudio3DVectorOrientation *)((char *)self->super._impl + 276);
  if (v9)
    std::recursive_mutex::unlock(v8);
  if (v7)
    std::recursive_mutex::unlock(v6);
  return result;
}

- (void)setListenerAngularOrientation:(AVAudio3DAngularOrientation)listenerAngularOrientation
{
  float roll;
  float pitch;
  float yaw;
  char *impl;
  std::recursive_mutex *v8;
  char v9;
  std::recursive_mutex *v10;
  char v11;

  roll = listenerAngularOrientation.roll;
  pitch = listenerAngularOrientation.pitch;
  yaw = listenerAngularOrientation.yaw;
  AVAudioNodeImplBase::GetAttachAndEngineLock((AVAudioNodeImplBase *)&v8, (uint64_t)self->super._impl);
  impl = (char *)self->super._impl;
  if (*((float *)impl + 75) != yaw || *((float *)impl + 76) != pitch || *((float *)impl + 77) != roll)
  {
    *((float *)impl + 75) = yaw;
    *((float *)impl + 76) = pitch;
    *((float *)impl + 77) = roll;
    *(_QWORD *)(impl + 292) = 1065353216;
    *(_OWORD *)(impl + 276) = kInitialVectorOrientation;
    RotateVectorByEulerAngles(yaw, pitch, roll, (AVAudio3DPoint *)impl + 23);
    RotateVectorByEulerAngles(*((float *)impl + 75), *((float *)impl + 76), *((float *)impl + 77), (AVAudio3DPoint *)impl + 24);
    (*(void (**)(char *, uint64_t, _QWORD, _QWORD, float))(*(_QWORD *)impl + 128))(impl, 19, 0, 0, *((float *)impl + 75));
    (*(void (**)(char *, uint64_t, _QWORD, _QWORD, float))(*(_QWORD *)impl + 128))(impl, 20, 0, 0, *((float *)impl + 76));
    (*(void (**)(char *, uint64_t, _QWORD, _QWORD, float))(*(_QWORD *)impl + 128))(impl, 21, 0, 0, *((float *)impl + 77));
  }
  if (v11)
    std::recursive_mutex::unlock(v10);
  if (v9)
    std::recursive_mutex::unlock(v8);
}

- (AVAudio3DAngularOrientation)listenerAngularOrientation
{
  float *impl;
  float v4;
  float v5;
  float v6;
  float v7;
  float v8;
  float v9;
  std::recursive_mutex *v10;
  char v11;
  std::recursive_mutex *v12;
  char v13;
  AVAudio3DAngularOrientation result;

  AVAudioNodeImplBase::GetAttachAndEngineLock((AVAudioNodeImplBase *)&v10, (uint64_t)self->super._impl);
  impl = (float *)self->super._impl;
  v4 = impl[75];
  v5 = impl[76];
  v6 = impl[77];
  if (v13)
    std::recursive_mutex::unlock(v12);
  if (v11)
    std::recursive_mutex::unlock(v10);
  v7 = v4;
  v8 = v5;
  v9 = v6;
  result.roll = v9;
  result.pitch = v8;
  result.yaw = v7;
  return result;
}

- (AVAudioEnvironmentDistanceAttenuationParameters)distanceAttenuationParameters
{
  AVAudioEnvironmentDistanceAttenuationParameters *v3;
  std::recursive_mutex *v5;
  char v6;
  std::recursive_mutex *v7;
  char v8;

  AVAudioNodeImplBase::GetAttachAndEngineLock((AVAudioNodeImplBase *)&v5, (uint64_t)self->super._impl);
  v3 = (AVAudioEnvironmentDistanceAttenuationParameters *)*((_QWORD *)self->super._impl + 42);
  if (v8)
    std::recursive_mutex::unlock(v7);
  if (v6)
    std::recursive_mutex::unlock(v5);
  return v3;
}

- (AVAudioEnvironmentReverbParameters)reverbParameters
{
  AVAudioEnvironmentReverbParameters *v3;
  std::recursive_mutex *v5;
  char v6;
  std::recursive_mutex *v7;
  char v8;

  AVAudioNodeImplBase::GetAttachAndEngineLock((AVAudioNodeImplBase *)&v5, (uint64_t)self->super._impl);
  v3 = (AVAudioEnvironmentReverbParameters *)*((_QWORD *)self->super._impl + 45);
  if (v8)
    std::recursive_mutex::unlock(v7);
  if (v6)
    std::recursive_mutex::unlock(v5);
  return v3;
}

@end
