@implementation AVVoiceController

- (void)finalize
{
  std::__shared_weak_count *v3;
  unint64_t *p_shared_owners;
  unint64_t v5;
  objc_super v6;
  ControllerImpl *v7;
  std::__shared_weak_count *v8;
  _BYTE v9[8];

  TraceMethod::TraceMethod((TraceMethod *)v9, "finalize");
  -[AVVoiceController impl](self, "impl");
  -[AVVoiceController sessionCleanup](self, "sessionCleanup");
  if (v7)
    ControllerImpl::cleanup(v7, self);
  v6.receiver = self;
  v6.super_class = (Class)AVVoiceController;
  -[AVVoiceController finalize](&v6, sel_finalize);
  v3 = v8;
  if (v8)
  {
    p_shared_owners = (unint64_t *)&v8->__shared_owners_;
    do
      v5 = __ldaxr(p_shared_owners);
    while (__stlxr(v5 - 1, p_shared_owners));
    if (!v5)
    {
      ((void (*)(std::__shared_weak_count *))v3->__on_zero_shared)(v3);
      std::__shared_weak_count::__release_weak(v3);
    }
  }
  TraceMethod::~TraceMethod((TraceMethod *)v9);
}

- (void)cleanSlateWithError:(id *)a3
{
  NSObject *v5;
  id v6;
  uint64_t v7;
  std::__shared_weak_count *v8;
  unint64_t *p_shared_owners;
  unint64_t v10;
  int64_t v11;
  id v12;
  std::__shared_weak_count *v13;
  unint64_t *v14;
  unint64_t v15;
  id v16;
  int v17;
  char v18;
  __int128 v19;
  __int128 v20;
  _BYTE buf[18];
  __int16 v22;
  AVVoiceController *v23;
  _BYTE v24[160];
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  self->mClientAPIClutch = 1;
  v17 = 4139;
  v18 = 1;
  v19 = 0u;
  v20 = 0u;
  kdebug_trace();
  ElapsedTime::ElapsedTime((ElapsedTime *)v24, "-[AVVoiceController cleanSlateWithError:]", 0, 0);
  if (kAVVCScope)
  {
    v5 = *(id *)kAVVCScope;
    if (!v5)
      goto LABEL_8;
  }
  else
  {
    v5 = MEMORY[0x1E0C81028];
    v6 = MEMORY[0x1E0C81028];
  }
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315650;
    *(_QWORD *)&buf[4] = "AVVoiceController.mm";
    *(_WORD *)&buf[12] = 1024;
    *(_DWORD *)&buf[14] = 783;
    v22 = 2048;
    v23 = self;
    _os_log_impl(&dword_19B733000, v5, OS_LOG_TYPE_DEFAULT, "%25s:%-5d #### AVVoiceController: cleanSlate: [self = %p] ####", buf, 0x1Cu);
  }

LABEL_8:
  -[AVVoiceController impl](self, "impl");
  if (*(_QWORD *)buf)
  {
    v7 = *(_QWORD *)(*(_QWORD *)buf + 184);
    v8 = *(std::__shared_weak_count **)&buf[8];
    *(_QWORD *)buf = 0;
    *(_QWORD *)&buf[8] = 0;
    if (v8)
    {
      p_shared_owners = (unint64_t *)&v8->__shared_owners_;
      do
        v10 = __ldaxr(p_shared_owners);
      while (__stlxr(v10 - 1, p_shared_owners));
      if (!v10)
      {
        ((void (*)(std::__shared_weak_count *))v8->__on_zero_shared)(v8);
        std::__shared_weak_count::__release_weak(v8);
      }
    }
    -[AVVoiceController setRecordDelegate:](self, "setRecordDelegate:", 0);
    -[AVVoiceController _teardownWithError:](self, "_teardownWithError:", a3);
    v16 = 0;
    v11 = -[AVVoiceController _bringUp:withError:](self, "_bringUp:withError:", v7, &v16);
    v12 = v16;
    if (a3 && v11)
    {
      objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CB2F90], v11, 0);
      *a3 = (id)objc_claimAutoreleasedReturnValue();
    }
    self->mClientAPIClutch = 0;

  }
  v13 = *(std::__shared_weak_count **)&buf[8];
  if (*(_QWORD *)&buf[8])
  {
    v14 = (unint64_t *)(*(_QWORD *)&buf[8] + 8);
    do
      v15 = __ldaxr(v14);
    while (__stlxr(v15 - 1, v14));
    if (!v15)
    {
      ((void (*)(std::__shared_weak_count *))v13->__on_zero_shared)(v13);
      std::__shared_weak_count::__release_weak(v13);
    }
  }
  ElapsedTime::~ElapsedTime((ElapsedTime *)v24);
  TraceWrapper::~TraceWrapper((TraceWrapper *)&v17);
}

- (void)removeStream:(unint64_t)a3 completion:(id)a4
{
  id v6;
  uint64_t v7;
  NSObject *v8;
  id v9;
  _BOOL4 mClientAPIClutch;
  std::__shared_weak_count *v11;
  unint64_t *v12;
  unint64_t v13;
  unint64_t *p_shared_owners;
  unint64_t v15;
  std::__shared_weak_count *v16;
  unint64_t *v17;
  unint64_t v18;
  _QWORD v19[5];
  id v20;
  id v21;
  uint64_t v22;
  std::__shared_weak_count *v23;
  unint64_t v24;
  uint64_t v25;
  std::__shared_weak_count *v26;
  uint8_t buf[4];
  const char *v28;
  __int16 v29;
  int v30;
  __int16 v31;
  uint64_t v32;
  __int16 v33;
  _BOOL4 v34;
  uint64_t v35;

  v35 = *MEMORY[0x1E0C80C00];
  v6 = a4;
  -[AVVoiceController impl](self, "impl");
  v7 = v25;
  if (v25 && !self->mClientAPIClutch)
  {
    v19[0] = MEMORY[0x1E0C809B0];
    v19[1] = 3321888768;
    v19[2] = __45__AVVoiceController_removeStream_completion___block_invoke;
    v19[3] = &unk_1E3BEAC98;
    v22 = v25;
    v23 = v26;
    if (v26)
    {
      p_shared_owners = (unint64_t *)&v26->__shared_owners_;
      do
        v15 = __ldxr(p_shared_owners);
      while (__stxr(v15 + 1, p_shared_owners));
    }
    v24 = a3;
    v19[4] = self;
    v20 = 0;
    v21 = v6;
    ControllerImpl::safeWork(v7, v19, (uint64_t)"-[AVVoiceController removeStream:completion:]");

    v16 = v23;
    if (v23)
    {
      v17 = (unint64_t *)&v23->__shared_owners_;
      do
        v18 = __ldaxr(v17);
      while (__stlxr(v18 - 1, v17));
      if (!v18)
      {
        ((void (*)(std::__shared_weak_count *))v16->__on_zero_shared)(v16);
        std::__shared_weak_count::__release_weak(v16);
      }
    }
  }
  else
  {
    if (kAVVCScope)
    {
      v8 = *(id *)kAVVCScope;
      if (!v8)
        goto LABEL_10;
    }
    else
    {
      v8 = MEMORY[0x1E0C81028];
      v9 = MEMORY[0x1E0C81028];
    }
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      mClientAPIClutch = self->mClientAPIClutch;
      *(_DWORD *)buf = 136315906;
      v28 = "AVVoiceController.mm";
      v29 = 1024;
      v30 = 808;
      v31 = 2048;
      v32 = v25;
      v33 = 1024;
      v34 = mClientAPIClutch;
      _os_log_impl(&dword_19B733000, v8, OS_LOG_TYPE_ERROR, "%25s:%-5d Invalid operation. impl(%p) ClientAPIClutch(%d)", buf, 0x22u);
    }

  }
LABEL_10:
  v11 = v26;
  if (v26)
  {
    v12 = (unint64_t *)&v26->__shared_owners_;
    do
      v13 = __ldaxr(v12);
    while (__stlxr(v13 - 1, v12));
    if (!v13)
    {
      ((void (*)(std::__shared_weak_count *))v11->__on_zero_shared)(v11);
      std::__shared_weak_count::__release_weak(v11);
    }
  }

}

- (void)teardownWithError:(id *)a3
{
  NSObject *v5;
  id v6;
  int v7;
  char v8;
  __int128 v9;
  __int128 v10;
  uint8_t buf[4];
  const char *v12;
  __int16 v13;
  int v14;
  __int16 v15;
  AVVoiceController *v16;
  _BYTE v17[160];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  self->mClientAPIClutch = 1;
  v7 = 4138;
  v8 = 1;
  v9 = 0u;
  v10 = 0u;
  kdebug_trace();
  ElapsedTime::ElapsedTime((ElapsedTime *)v17, "-[AVVoiceController teardownWithError:]", 0, 0);
  if (kAVVCScope)
  {
    v5 = *(id *)kAVVCScope;
    if (!v5)
      goto LABEL_8;
  }
  else
  {
    v5 = MEMORY[0x1E0C81028];
    v6 = MEMORY[0x1E0C81028];
  }
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315650;
    v12 = "AVVoiceController.mm";
    v13 = 1024;
    v14 = 828;
    v15 = 2048;
    v16 = self;
    _os_log_impl(&dword_19B733000, v5, OS_LOG_TYPE_DEFAULT, "%25s:%-5d #### AVVoiceController: teardownWithError: [self = %p] ####", buf, 0x1Cu);
  }

LABEL_8:
  if (a3)
    *a3 = 0;
  -[AVVoiceController setRecordDelegate:](self, "setRecordDelegate:", 0);
  -[AVVoiceController _teardownWithError:](self, "_teardownWithError:", a3);
  ElapsedTime::~ElapsedTime((ElapsedTime *)v17);
  TraceWrapper::~TraceWrapper((TraceWrapper *)&v7);
}

- (void)_teardownWithError:(id *)a3
{
  uint64_t *impl;
  ControllerImpl *v5;
  unint64_t *p_shared_owners;
  unint64_t v7;
  std::__shared_weak_count *v8;
  unint64_t *v9;
  unint64_t v10;
  uint64_t v11;
  std::__shared_weak_count *v12;
  unint64_t *v13;
  unint64_t v14;
  std::__shared_weak_count *v15;
  unint64_t *v16;
  unint64_t v17;
  _QWORD v18[6];
  std::__shared_weak_count *v19;
  ControllerImpl *v20;
  std::__shared_weak_count *v21;

  impl = (uint64_t *)self->_impl;
  v20 = 0;
  v21 = 0;
  if (impl)
  {
    std::shared_ptr<ControllerImpl>::operator=[abi:ne180100](&v20, *impl, impl[1]);
    v5 = v20;
    if (v20)
    {
      v18[0] = MEMORY[0x1E0C809B0];
      v18[1] = 3321888768;
      v18[2] = __40__AVVoiceController__teardownWithError___block_invoke;
      v18[3] = &unk_1E3BEA238;
      v18[4] = self;
      v18[5] = v20;
      v19 = v21;
      if (v21)
      {
        p_shared_owners = (unint64_t *)&v21->__shared_owners_;
        do
          v7 = __ldxr(p_shared_owners);
        while (__stxr(v7 + 1, p_shared_owners));
      }
      ControllerImpl::safeWorkSync((uint64_t)v5, v18);
      if (IsSerializationEnabled(void)::onceToken != -1)
        dispatch_once(&IsSerializationEnabled(void)::onceToken, &__block_literal_global_132);
      if (IsSerializationEnabled(void)::enable)
        ControllerImpl::safeAllQueuesBarrier(v20);
      v8 = v21;
      v20 = 0;
      v21 = 0;
      if (v8)
      {
        v9 = (unint64_t *)&v8->__shared_owners_;
        do
          v10 = __ldaxr(v9);
        while (__stlxr(v10 - 1, v9));
        if (!v10)
        {
          ((void (*)(std::__shared_weak_count *))v8->__on_zero_shared)(v8);
          std::__shared_weak_count::__release_weak(v8);
        }
      }
      v11 = std::shared_ptr<AVVCRecordingEngine>::~shared_ptr[abi:ne180100]((uint64_t)impl);
      MEMORY[0x1A1AC5BD4](v11, 0x20C40A4A59CD2);
      self->_impl = 0;
      v12 = v19;
      if (v19)
      {
        v13 = (unint64_t *)&v19->__shared_owners_;
        do
          v14 = __ldaxr(v13);
        while (__stlxr(v14 - 1, v13));
        if (!v14)
        {
          ((void (*)(std::__shared_weak_count *))v12->__on_zero_shared)(v12);
          std::__shared_weak_count::__release_weak(v12);
        }
      }
    }
  }
  v15 = v21;
  if (v21)
  {
    v16 = (unint64_t *)&v21->__shared_owners_;
    do
      v17 = __ldaxr(v16);
    while (__stlxr(v17 - 1, v16));
    if (!v17)
    {
      ((void (*)(std::__shared_weak_count *, SEL, id *))v15->__on_zero_shared)(v15, a2, a3);
      std::__shared_weak_count::__release_weak(v15);
    }
  }
}

- (void)dealloc
{
  NSObject *v3;
  id v4;
  uint64_t *impl;
  uint64_t v6;
  std::__shared_weak_count *v7;
  unint64_t *p_shared_owners;
  unint64_t v9;
  NSObject *v10;
  id v11;
  NSObject *v12;
  NSObject *v13;
  unint64_t *v14;
  unint64_t v15;
  AVVoiceController *v16;
  NSObject *v17;
  NSObject *v18;
  uint64_t **ObjectMap;
  uint64_t *v20;
  uint64_t *v21;
  uint64_t *v22;
  unint64_t v23;
  BOOL v24;
  uint64_t **v25;
  uint64_t *v26;
  uint64_t *v27;
  uint64_t *v28;
  BOOL v29;
  NSObject *v30;
  id v31;
  AVVoiceController *v32;
  id v33;
  id v34;
  NSObject *v35;
  void *v36;
  void *v37;
  NSObject *v38;
  id v39;
  id v40;
  NSObject *v41;
  void *v42;
  void *v43;
  objc_super v44;
  char v45[8];
  int v46;
  char v47;
  __int128 v48;
  __int128 v49;
  uint8_t v50[160];
  uint8_t buf[4];
  const char *v52;
  __int16 v53;
  int v54;
  __int16 v55;
  AVVoiceController *v56;
  __int16 v57;
  void *v58;
  uint64_t v59;

  v59 = *MEMORY[0x1E0C80C00];
  v46 = 4114;
  v47 = 1;
  v48 = 0u;
  v49 = 0u;
  kdebug_trace();
  TraceMethod::TraceMethod((TraceMethod *)v45, "dealloc");
  ElapsedTime::ElapsedTime((ElapsedTime *)v50, "-[AVVoiceController dealloc]", 0, 0);
  if (kAVVCScope)
  {
    v3 = *(id *)kAVVCScope;
    if (!v3)
      goto LABEL_8;
  }
  else
  {
    v3 = MEMORY[0x1E0C81028];
    v4 = MEMORY[0x1E0C81028];
  }
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315650;
    v52 = "AVVoiceController.mm";
    v53 = 1024;
    v54 = 929;
    v55 = 2048;
    v56 = self;
    _os_log_impl(&dword_19B733000, v3, OS_LOG_TYPE_DEFAULT, "%25s:%-5d [enforce 1 avvc] #### AVVoiceController: dealloc [self == %p] ####", buf, 0x1Cu);
  }

LABEL_8:
  impl = (uint64_t *)self->_impl;
  if (!impl)
    goto LABEL_28;
  v6 = *impl;
  v7 = (std::__shared_weak_count *)impl[1];
  if (v7)
  {
    p_shared_owners = (unint64_t *)&v7->__shared_owners_;
    do
      v9 = __ldxr(p_shared_owners);
    while (__stxr(v9 + 1, p_shared_owners));
  }
  if (!*(_BYTE *)(v6 + 520))
  {
    if (kAVVCScope)
    {
      v10 = *(id *)kAVVCScope;
      if (!v10)
      {
LABEL_20:
        v12 = *(NSObject **)kAVVCScope;
        CALog::Scope::oslog(*(id *)kAVVCScope);
        v13 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v13, OS_LOG_TYPE_FAULT))
        {
          *(_DWORD *)buf = 134217984;
          v52 = (const char *)self;
          _os_log_fault_impl(&dword_19B733000, v12, OS_LOG_TYPE_FAULT, "In dealloc without prior teardownWithError: call. Controller(%p)", buf, 0xCu);
        }

        goto LABEL_23;
      }
    }
    else
    {
      v10 = MEMORY[0x1E0C81028];
      v11 = MEMORY[0x1E0C81028];
    }
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315650;
      v52 = "AVVoiceController.mm";
      v53 = 1024;
      v54 = 935;
      v55 = 2048;
      v56 = self;
      _os_log_impl(&dword_19B733000, v10, OS_LOG_TYPE_ERROR, "%25s:%-5d In dealloc without prior teardownWithError: call. Controller(%p)", buf, 0x1Cu);
    }

    goto LABEL_20;
  }
LABEL_23:
  if (v7)
  {
    v14 = (unint64_t *)&v7->__shared_owners_;
    do
      v15 = __ldaxr(v14);
    while (__stlxr(v15 - 1, v14));
    if (!v15)
    {
      ((void (*)(std::__shared_weak_count *))v7->__on_zero_shared)(v7);
      std::__shared_weak_count::__release_weak(v7);
    }
  }
LABEL_28:
  v16 = self;
  if (kAVVCScope)
  {
    if ((*(_BYTE *)(kAVVCScope + 8) & 1) != 0)
    {
      v17 = *(id *)kAVVCScope;
      if (v17)
      {
        v18 = v17;
        if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 136315650;
          v52 = "AVVCUtils.mm";
          v53 = 1024;
          v54 = 87;
          v55 = 2048;
          v56 = v16;
          _os_log_impl(&dword_19B733000, v18, OS_LOG_TYPE_DEBUG, "%25s:%-5d UnregisterObject: unregistering %p", buf, 0x1Cu);
        }

      }
    }
  }
  if (!ObjectExists(v16))
  {
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_19B733000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, " ASSERTION FAILED: unregistering a nonexistent object!", buf, 2u);
    }
    __break(1u);
  }
  pthread_mutex_lock(&MapLocker::sMapLock);
  ObjectMap = (uint64_t **)GetObjectMap();
  v20 = ObjectMap[1];
  if (!v20)
    goto LABEL_46;
  v21 = (uint64_t *)(ObjectMap + 1);
  v22 = ObjectMap[1];
  do
  {
    v23 = v22[4];
    v24 = v23 >= (unint64_t)v16;
    if (v23 >= (unint64_t)v16)
      v25 = (uint64_t **)v22;
    else
      v25 = (uint64_t **)(v22 + 1);
    if (v24)
      v21 = v22;
    v22 = *v25;
  }
  while (*v25);
  if (v21 == (uint64_t *)(ObjectMap + 1) || v21[4] > (unint64_t)v16)
LABEL_46:
    v21 = (uint64_t *)(ObjectMap + 1);
  v26 = (uint64_t *)v21[1];
  if (v26)
  {
    do
    {
      v27 = v26;
      v26 = (uint64_t *)*v26;
    }
    while (v26);
  }
  else
  {
    v28 = v21;
    do
    {
      v27 = (uint64_t *)v28[2];
      v29 = *v27 == (_QWORD)v28;
      v28 = v27;
    }
    while (!v29);
  }
  if (*ObjectMap == v21)
    *ObjectMap = v27;
  ObjectMap[2] = (uint64_t *)((char *)ObjectMap[2] - 1);
  std::__tree_remove[abi:ne180100]<std::__tree_node_base<void *> *>(v20, v21);
  operator delete(v21);
  pthread_mutex_unlock(&MapLocker::sMapLock);

  if (kAVVCScope)
  {
    v30 = *(id *)kAVVCScope;
    if (!v30)
      goto LABEL_62;
  }
  else
  {
    v30 = MEMORY[0x1E0C81028];
    v31 = MEMORY[0x1E0C81028];
  }
  if (os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    v52 = "AVVoiceController.mm";
    v53 = 1024;
    v54 = 941;
    _os_log_impl(&dword_19B733000, v30, OS_LOG_TYPE_DEFAULT, "%25s:%-5d #### AVVoiceController: exiting dealloc ####", buf, 0x12u);
  }

LABEL_62:
  v32 = v16;
  if (kAVVCScope)
  {
    v33 = *(id *)kAVVCScope;
    if (!v33)
      goto LABEL_69;
  }
  else
  {
    v33 = (id)MEMORY[0x1E0C81028];
    v34 = MEMORY[0x1E0C81028];
  }
  v35 = v33;
  if (os_log_type_enabled(v35, OS_LOG_TYPE_DEFAULT))
  {
    GetAVVCSingleInstanceSemaphore();
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v36, "debugDescription");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 136315906;
    v52 = "AVVoiceController.mm";
    v53 = 1024;
    v54 = 137;
    v55 = 2048;
    v56 = v32;
    v57 = 2112;
    v58 = v37;
    _os_log_impl(&dword_19B733000, v35, OS_LOG_TYPE_DEFAULT, "%25s:%-5d [enforce 1 avvc] before signal avvc(%p), %@", buf, 0x26u);

  }
LABEL_69:
  GetAVVCSingleInstanceSemaphore();
  v38 = objc_claimAutoreleasedReturnValue();
  dispatch_semaphore_signal(v38);

  if (kAVVCScope)
  {
    v39 = *(id *)kAVVCScope;
    if (!v39)
      goto LABEL_76;
  }
  else
  {
    v39 = (id)MEMORY[0x1E0C81028];
    v40 = MEMORY[0x1E0C81028];
  }
  v41 = v39;
  if (os_log_type_enabled(v41, OS_LOG_TYPE_DEFAULT))
  {
    GetAVVCSingleInstanceSemaphore();
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v42, "debugDescription");
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 136315906;
    v52 = "AVVoiceController.mm";
    v53 = 1024;
    v54 = 139;
    v55 = 2048;
    v56 = v32;
    v57 = 2112;
    v58 = v43;
    _os_log_impl(&dword_19B733000, v41, OS_LOG_TYPE_DEFAULT, "%25s:%-5d [enforce 1 avvc] after signal avvc(%p), %@", buf, 0x26u);

  }
LABEL_76:

  ElapsedTime::~ElapsedTime((ElapsedTime *)v50);
  TraceMethod::~TraceMethod((TraceMethod *)v45);
  TraceWrapper::~TraceWrapper((TraceWrapper *)&v46);
  v44.receiver = v32;
  v44.super_class = (Class)AVVoiceController;
  -[AVVoiceController dealloc](&v44, sel_dealloc);
}

- (void)enableMiniDucking:(BOOL)a3
{
  _BOOL4 v3;
  NSObject *v5;
  id v6;
  NSObject *v7;
  id v8;
  _BOOL4 mClientAPIClutch;
  std::__shared_weak_count *v10;
  unint64_t *v11;
  unint64_t v12;
  unint64_t *p_shared_owners;
  unint64_t v14;
  std::__shared_weak_count *v15;
  unint64_t *v16;
  unint64_t v17;
  _QWORD v18[5];
  std::__shared_weak_count *v19;
  BOOL v20;
  uint64_t v21;
  std::__shared_weak_count *v22;
  uint8_t buf[4];
  const char *v24;
  __int16 v25;
  int v26;
  __int16 v27;
  uint64_t v28;
  __int16 v29;
  _BOOL4 v30;
  uint64_t v31;

  v3 = a3;
  v31 = *MEMORY[0x1E0C80C00];
  if (kAVVCScope)
  {
    v5 = *(id *)kAVVCScope;
    if (!v5)
      goto LABEL_8;
  }
  else
  {
    v5 = MEMORY[0x1E0C81028];
    v6 = MEMORY[0x1E0C81028];
  }
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315650;
    v24 = "AVVoiceController.mm";
    v25 = 1024;
    v26 = 949;
    v27 = 1024;
    LODWORD(v28) = v3;
    _os_log_impl(&dword_19B733000, v5, OS_LOG_TYPE_DEFAULT, "%25s:%-5d #### AVVoiceController: enableMiniDucking: %d", buf, 0x18u);
  }

LABEL_8:
  -[AVVoiceController impl](self, "impl");
  if (v21 && !self->mClientAPIClutch)
  {
    v18[0] = MEMORY[0x1E0C809B0];
    v18[1] = 3321888768;
    v18[2] = __39__AVVoiceController_enableMiniDucking___block_invoke;
    v18[3] = &__block_descriptor_49_ea8_32c42_ZTSNSt3__110shared_ptrI14ControllerImplEE_e5_v8__0l;
    v18[4] = v21;
    v19 = v22;
    if (v22)
    {
      p_shared_owners = (unint64_t *)&v22->__shared_owners_;
      do
        v14 = __ldxr(p_shared_owners);
      while (__stxr(v14 + 1, p_shared_owners));
    }
    v20 = v3;
    ControllerImpl::safeWorkSync(v21, v18);
    v15 = v19;
    if (v19)
    {
      v16 = (unint64_t *)&v19->__shared_owners_;
      do
        v17 = __ldaxr(v16);
      while (__stlxr(v17 - 1, v16));
      if (!v17)
      {
        ((void (*)(std::__shared_weak_count *))v15->__on_zero_shared)(v15);
        std::__shared_weak_count::__release_weak(v15);
      }
    }
  }
  else
  {
    if (kAVVCScope)
    {
      v7 = *(id *)kAVVCScope;
      if (!v7)
        goto LABEL_17;
    }
    else
    {
      v7 = MEMORY[0x1E0C81028];
      v8 = MEMORY[0x1E0C81028];
    }
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      mClientAPIClutch = self->mClientAPIClutch;
      *(_DWORD *)buf = 136315906;
      v24 = "AVVoiceController.mm";
      v25 = 1024;
      v26 = 950;
      v27 = 2048;
      v28 = v21;
      v29 = 1024;
      v30 = mClientAPIClutch;
      _os_log_impl(&dword_19B733000, v7, OS_LOG_TYPE_ERROR, "%25s:%-5d Invalid operation. impl(%p) ClientAPIClutch(%d)", buf, 0x22u);
    }

  }
LABEL_17:
  v10 = v22;
  if (v22)
  {
    v11 = (unint64_t *)&v22->__shared_owners_;
    do
      v12 = __ldaxr(v11);
    while (__stlxr(v12 - 1, v11));
    if (!v12)
    {
      ((void (*)(std::__shared_weak_count *))v10->__on_zero_shared)(v10);
      std::__shared_weak_count::__release_weak(v10);
    }
  }
}

- (BOOL)IsDeviceAvailableInLocalRoute:(id)a3 error:(id *)a4
{
  id v5;
  NSObject *v6;
  id v7;
  int v9;
  const char *v10;
  __int16 v11;
  int v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  if (a4)
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CB2F90], -4, 0);
    *a4 = (id)objc_claimAutoreleasedReturnValue();
  }
  if (kAVVCScope)
  {
    v6 = *(id *)kAVVCScope;
    if (!v6)
      goto LABEL_10;
  }
  else
  {
    v6 = MEMORY[0x1E0C81028];
    v7 = MEMORY[0x1E0C81028];
  }
  if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
  {
    v9 = 136315394;
    v10 = "AVVoiceController.mm";
    v11 = 1024;
    v12 = 993;
    _os_log_impl(&dword_19B733000, v6, OS_LOG_TYPE_ERROR, "%25s:%-5d ### unimplemented in this platform", (uint8_t *)&v9, 0x12u);
  }

LABEL_10:
  return 1;
}

- (BOOL)setAlertSoundFromURL:(id)a3 forType:(int)a4
{
  id v6;
  NSObject *v7;
  id v8;
  _BOOL4 mClientAPIClutch;
  unint64_t *p_shared_owners;
  unint64_t v11;
  id v13;
  id v14;
  NSObject *v15;
  void *v16;
  id v17;
  uint64_t v18;
  std::__shared_weak_count *v19;
  uint8_t buf[4];
  const char *v21;
  __int16 v22;
  int v23;
  __int16 v24;
  uint64_t v25;
  __int16 v26;
  int v27;
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  -[AVVoiceController impl](self, "impl");
  if (!v18 || self->mClientAPIClutch)
  {
    if (kAVVCScope)
    {
      v7 = *(id *)kAVVCScope;
      if (!v7)
        goto LABEL_10;
    }
    else
    {
      v7 = MEMORY[0x1E0C81028];
      v8 = MEMORY[0x1E0C81028];
    }
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      mClientAPIClutch = self->mClientAPIClutch;
      *(_DWORD *)buf = 136315906;
      v21 = "AVVoiceController.mm";
      v22 = 1024;
      v23 = 1000;
      v24 = 2048;
      v25 = v18;
      v26 = 1024;
      v27 = mClientAPIClutch;
      _os_log_impl(&dword_19B733000, v7, OS_LOG_TYPE_ERROR, "%25s:%-5d Invalid operation. impl(%p) ClientAPIClutch(%d)", buf, 0x22u);
    }

    goto LABEL_10;
  }
  if (!kAVVCScope)
  {
    v13 = (id)MEMORY[0x1E0C81028];
    v14 = MEMORY[0x1E0C81028];
    goto LABEL_21;
  }
  v13 = *(id *)kAVVCScope;
  if (v13)
  {
LABEL_21:
    v15 = v13;
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(v6, "absoluteString");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 136315906;
      v21 = "AVVoiceController.mm";
      v22 = 1024;
      v23 = 1002;
      v24 = 2112;
      v25 = (uint64_t)v16;
      v26 = 1024;
      v27 = a4;
      _os_log_impl(&dword_19B733000, v15, OS_LOG_TYPE_DEFAULT, "%25s:%-5d #### AVVoiceController: setAlertSoundFromURL: %@ forType: %d ####", buf, 0x22u);

    }
  }
  if ((a4 - 4) > 0xFFFFFFFC)
  {
    LOBYTE(self) = ControllerImpl::setAlertURL(v18, self, a4, v6) == 0;
    goto LABEL_11;
  }
  if (kAVVCScope)
  {
    self = (AVVoiceController *)*(id *)kAVVCScope;
    if (!self)
      goto LABEL_11;
  }
  else
  {
    self = (AVVoiceController *)MEMORY[0x1E0C81028];
    v17 = MEMORY[0x1E0C81028];
  }
  if (os_log_type_enabled(&self->super, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 136315394;
    v21 = "AVVoiceController.mm";
    v22 = 1024;
    v23 = 1004;
    _os_log_impl(&dword_19B733000, &self->super, OS_LOG_TYPE_ERROR, "%25s:%-5d setAlertSoundFromURL:forType: Illegal alertType", buf, 0x12u);
  }

LABEL_10:
  LOBYTE(self) = 0;
LABEL_11:
  if (v19)
  {
    p_shared_owners = (unint64_t *)&v19->__shared_owners_;
    do
      v11 = __ldaxr(p_shared_owners);
    while (__stlxr(v11 - 1, p_shared_owners));
    if (!v11)
    {
      ((void (*)())v19->__on_zero_shared)();
      std::__shared_weak_count::__release_weak(v19);
    }
  }

  return (char)self;
}

- (AVVoiceControllerRecordDelegate)recordDelegate
{
  NSObject *v3;
  id v4;
  _BOOL4 mClientAPIClutch;
  id v6;
  std::__shared_weak_count *v7;
  unint64_t *v8;
  unint64_t v9;
  unint64_t *p_shared_owners;
  unint64_t v12;
  std::__shared_weak_count *v13;
  unint64_t *v14;
  unint64_t v15;
  _QWORD v16[6];
  std::__shared_weak_count *v17;
  uint64_t v18;
  std::__shared_weak_count *v19;
  uint64_t v20;
  uint64_t *v21;
  uint64_t v22;
  uint64_t (*v23)(uint64_t, uint64_t);
  void (*v24)(uint64_t);
  id v25;
  uint8_t buf[4];
  const char *v27;
  __int16 v28;
  int v29;
  __int16 v30;
  uint64_t v31;
  __int16 v32;
  _BOOL4 v33;
  uint64_t v34;

  v34 = *MEMORY[0x1E0C80C00];
  v20 = 0;
  v21 = &v20;
  v22 = 0x3032000000;
  v23 = __Block_byref_object_copy__183;
  v24 = __Block_byref_object_dispose__184;
  v25 = 0;
  -[AVVoiceController impl](self, "impl");
  if (!v18 || self->mClientAPIClutch)
  {
    if (kAVVCScope)
    {
      v3 = *(id *)kAVVCScope;
      if (!v3)
      {
LABEL_10:
        v6 = 0;
        goto LABEL_11;
      }
    }
    else
    {
      v3 = MEMORY[0x1E0C81028];
      v4 = MEMORY[0x1E0C81028];
    }
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    {
      mClientAPIClutch = self->mClientAPIClutch;
      *(_DWORD *)buf = 136315906;
      v27 = "AVVoiceController.mm";
      v28 = 1024;
      v29 = 1019;
      v30 = 2048;
      v31 = v18;
      v32 = 1024;
      v33 = mClientAPIClutch;
      _os_log_impl(&dword_19B733000, v3, OS_LOG_TYPE_ERROR, "%25s:%-5d Invalid operation. impl(%p) ClientAPIClutch(%d)", buf, 0x22u);
    }

    goto LABEL_10;
  }
  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3321888768;
  v16[2] = __35__AVVoiceController_recordDelegate__block_invoke;
  v16[3] = &unk_1E3BEA200;
  v16[4] = &v20;
  v16[5] = v18;
  v17 = v19;
  if (v19)
  {
    p_shared_owners = (unint64_t *)&v19->__shared_owners_;
    do
      v12 = __ldxr(p_shared_owners);
    while (__stxr(v12 + 1, p_shared_owners));
  }
  ControllerImpl::safeWorkSync(v18, v16);
  v6 = (id)v21[5];
  v13 = v17;
  if (v17)
  {
    v14 = (unint64_t *)&v17->__shared_owners_;
    do
      v15 = __ldaxr(v14);
    while (__stlxr(v15 - 1, v14));
    if (!v15)
    {
      ((void (*)(std::__shared_weak_count *))v13->__on_zero_shared)(v13);
      std::__shared_weak_count::__release_weak(v13);
    }
  }
LABEL_11:
  v7 = v19;
  if (v19)
  {
    v8 = (unint64_t *)&v19->__shared_owners_;
    do
      v9 = __ldaxr(v8);
    while (__stlxr(v9 - 1, v8));
    if (!v9)
    {
      ((void (*)(std::__shared_weak_count *))v7->__on_zero_shared)(v7);
      std::__shared_weak_count::__release_weak(v7);
    }
  }
  _Block_object_dispose(&v20, 8);

  return (AVVoiceControllerRecordDelegate *)v6;
}

- (void)setRecordDelegate:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  uint64_t v7;
  unint64_t *v8;
  unint64_t v9;
  std::__shared_weak_count *v10;
  unint64_t *p_shared_owners;
  unint64_t v12;
  std::__shared_weak_count *v13;
  unint64_t *v14;
  unint64_t v15;
  _QWORD v16[4];
  id v17;
  AVVoiceController *v18;
  uint64_t v19;
  std::__shared_weak_count *v20;
  _BYTE buf[18];
  __int16 v22;
  id v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (kAVVCScope)
  {
    v5 = *(id *)kAVVCScope;
    if (!v5)
      goto LABEL_8;
  }
  else
  {
    v5 = MEMORY[0x1E0C81028];
    v6 = MEMORY[0x1E0C81028];
  }
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315650;
    *(_QWORD *)&buf[4] = "AVVoiceController.mm";
    *(_WORD *)&buf[12] = 1024;
    *(_DWORD *)&buf[14] = 1029;
    v22 = 2048;
    v23 = v4;
    _os_log_impl(&dword_19B733000, v5, OS_LOG_TYPE_DEFAULT, "%25s:%-5d #### AVVoiceController: setRecordDelegate: %p ####", buf, 0x1Cu);
  }

LABEL_8:
  -[AVVoiceController impl](self, "impl");
  v7 = *(_QWORD *)buf;
  if (*(_QWORD *)buf)
  {
    v16[0] = MEMORY[0x1E0C809B0];
    v16[1] = 3321888768;
    v16[2] = __39__AVVoiceController_setRecordDelegate___block_invoke;
    v16[3] = &unk_1E3BEA6B0;
    v17 = v4;
    v19 = v7;
    v20 = *(std::__shared_weak_count **)&buf[8];
    if (*(_QWORD *)&buf[8])
    {
      v8 = (unint64_t *)(*(_QWORD *)&buf[8] + 8);
      do
        v9 = __ldxr(v8);
      while (__stxr(v9 + 1, v8));
    }
    v18 = self;
    ControllerImpl::safeWorkSync(v7, v16);
    v10 = v20;
    if (v20)
    {
      p_shared_owners = (unint64_t *)&v20->__shared_owners_;
      do
        v12 = __ldaxr(p_shared_owners);
      while (__stlxr(v12 - 1, p_shared_owners));
      if (!v12)
      {
        ((void (*)(std::__shared_weak_count *))v10->__on_zero_shared)(v10);
        std::__shared_weak_count::__release_weak(v10);
      }
    }

  }
  v13 = *(std::__shared_weak_count **)&buf[8];
  if (*(_QWORD *)&buf[8])
  {
    v14 = (unint64_t *)(*(_QWORD *)&buf[8] + 8);
    do
      v15 = __ldaxr(v14);
    while (__stlxr(v15 - 1, v14));
    if (!v15)
    {
      ((void (*)(std::__shared_weak_count *))v13->__on_zero_shared)(v13);
      std::__shared_weak_count::__release_weak(v13);
    }
  }

}

- (Endpointer)endpointerDelegate
{
  NSObject *v3;
  id v4;
  _BOOL4 mClientAPIClutch;
  id v6;
  std::__shared_weak_count *v7;
  unint64_t *v8;
  unint64_t v9;
  unint64_t *p_shared_owners;
  unint64_t v12;
  std::__shared_weak_count *v13;
  unint64_t *v14;
  unint64_t v15;
  _QWORD v16[6];
  std::__shared_weak_count *v17;
  uint64_t v18;
  std::__shared_weak_count *v19;
  uint64_t v20;
  uint64_t *v21;
  uint64_t v22;
  uint64_t (*v23)(uint64_t, uint64_t);
  void (*v24)(uint64_t);
  id v25;
  uint8_t buf[4];
  const char *v27;
  __int16 v28;
  int v29;
  __int16 v30;
  uint64_t v31;
  __int16 v32;
  _BOOL4 v33;
  uint64_t v34;

  v34 = *MEMORY[0x1E0C80C00];
  v20 = 0;
  v21 = &v20;
  v22 = 0x3032000000;
  v23 = __Block_byref_object_copy__183;
  v24 = __Block_byref_object_dispose__184;
  v25 = 0;
  -[AVVoiceController impl](self, "impl");
  if (!v18 || self->mClientAPIClutch)
  {
    if (kAVVCScope)
    {
      v3 = *(id *)kAVVCScope;
      if (!v3)
      {
LABEL_10:
        v6 = 0;
        goto LABEL_11;
      }
    }
    else
    {
      v3 = MEMORY[0x1E0C81028];
      v4 = MEMORY[0x1E0C81028];
    }
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    {
      mClientAPIClutch = self->mClientAPIClutch;
      *(_DWORD *)buf = 136315906;
      v27 = "AVVoiceController.mm";
      v28 = 1024;
      v29 = 1054;
      v30 = 2048;
      v31 = v18;
      v32 = 1024;
      v33 = mClientAPIClutch;
      _os_log_impl(&dword_19B733000, v3, OS_LOG_TYPE_ERROR, "%25s:%-5d Invalid operation. impl(%p) ClientAPIClutch(%d)", buf, 0x22u);
    }

    goto LABEL_10;
  }
  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3321888768;
  v16[2] = __39__AVVoiceController_endpointerDelegate__block_invoke;
  v16[3] = &unk_1E3BEA200;
  v16[4] = &v20;
  v16[5] = v18;
  v17 = v19;
  if (v19)
  {
    p_shared_owners = (unint64_t *)&v19->__shared_owners_;
    do
      v12 = __ldxr(p_shared_owners);
    while (__stxr(v12 + 1, p_shared_owners));
  }
  ControllerImpl::safeWorkSync(v18, v16);
  v6 = (id)v21[5];
  v13 = v17;
  if (v17)
  {
    v14 = (unint64_t *)&v17->__shared_owners_;
    do
      v15 = __ldaxr(v14);
    while (__stlxr(v15 - 1, v14));
    if (!v15)
    {
      ((void (*)(std::__shared_weak_count *))v13->__on_zero_shared)(v13);
      std::__shared_weak_count::__release_weak(v13);
    }
  }
LABEL_11:
  v7 = v19;
  if (v19)
  {
    v8 = (unint64_t *)&v19->__shared_owners_;
    do
      v9 = __ldaxr(v8);
    while (__stlxr(v9 - 1, v8));
    if (!v9)
    {
      ((void (*)(std::__shared_weak_count *))v7->__on_zero_shared)(v7);
      std::__shared_weak_count::__release_weak(v7);
    }
  }
  _Block_object_dispose(&v20, 8);

  return (Endpointer *)v6;
}

- (void)setEndpointerDelegate:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  uint64_t v7;
  NSObject *v8;
  id v9;
  _BOOL4 mClientAPIClutch;
  std::__shared_weak_count *v11;
  unint64_t *v12;
  unint64_t v13;
  unint64_t *p_shared_owners;
  unint64_t v15;
  std::__shared_weak_count *v16;
  unint64_t *v17;
  unint64_t v18;
  _QWORD v19[5];
  id v20;
  uint64_t v21;
  std::__shared_weak_count *v22;
  uint64_t v23;
  std::__shared_weak_count *v24;
  uint8_t buf[4];
  const char *v26;
  __int16 v27;
  int v28;
  __int16 v29;
  uint64_t v30;
  __int16 v31;
  _BOOL4 v32;
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (kAVVCScope)
  {
    v5 = *(id *)kAVVCScope;
    if (!v5)
      goto LABEL_8;
  }
  else
  {
    v5 = MEMORY[0x1E0C81028];
    v6 = MEMORY[0x1E0C81028];
  }
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    v26 = "AVVoiceController.mm";
    v27 = 1024;
    v28 = 1064;
    _os_log_impl(&dword_19B733000, v5, OS_LOG_TYPE_DEFAULT, "%25s:%-5d #### AVVoiceController: setEndpointerDelegate ####", buf, 0x12u);
  }

LABEL_8:
  -[AVVoiceController impl](self, "impl");
  v7 = v23;
  if (v23 && !self->mClientAPIClutch)
  {
    v19[0] = MEMORY[0x1E0C809B0];
    v19[1] = 3321888768;
    v19[2] = __43__AVVoiceController_setEndpointerDelegate___block_invoke;
    v19[3] = &unk_1E3BEA6B0;
    v21 = v23;
    v22 = v24;
    if (v24)
    {
      p_shared_owners = (unint64_t *)&v24->__shared_owners_;
      do
        v15 = __ldxr(p_shared_owners);
      while (__stxr(v15 + 1, p_shared_owners));
    }
    v19[4] = self;
    v20 = v4;
    ControllerImpl::safeWorkSync(v7, v19);

    v16 = v22;
    if (v22)
    {
      v17 = (unint64_t *)&v22->__shared_owners_;
      do
        v18 = __ldaxr(v17);
      while (__stlxr(v18 - 1, v17));
      if (!v18)
      {
        ((void (*)(std::__shared_weak_count *))v16->__on_zero_shared)(v16);
        std::__shared_weak_count::__release_weak(v16);
      }
    }
  }
  else
  {
    if (kAVVCScope)
    {
      v8 = *(id *)kAVVCScope;
      if (!v8)
        goto LABEL_17;
    }
    else
    {
      v8 = MEMORY[0x1E0C81028];
      v9 = MEMORY[0x1E0C81028];
    }
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      mClientAPIClutch = self->mClientAPIClutch;
      *(_DWORD *)buf = 136315906;
      v26 = "AVVoiceController.mm";
      v27 = 1024;
      v28 = 1065;
      v29 = 2048;
      v30 = v23;
      v31 = 1024;
      v32 = mClientAPIClutch;
      _os_log_impl(&dword_19B733000, v8, OS_LOG_TYPE_ERROR, "%25s:%-5d Invalid operation. impl(%p) ClientAPIClutch(%d)", buf, 0x22u);
    }

  }
LABEL_17:
  v11 = v24;
  if (v24)
  {
    v12 = (unint64_t *)&v24->__shared_owners_;
    do
      v13 = __ldaxr(v12);
    while (__stlxr(v13 - 1, v12));
    if (!v13)
    {
      ((void (*)(std::__shared_weak_count *))v11->__on_zero_shared)(v11);
      std::__shared_weak_count::__release_weak(v11);
    }
  }

}

- (int)recordEndpointMode
{
  NSObject *v3;
  id v4;
  _BOOL4 mClientAPIClutch;
  int v6;
  unint64_t *p_shared_owners;
  unint64_t v8;
  std::__shared_weak_count *v9;
  unint64_t *v10;
  unint64_t v11;
  std::__shared_weak_count *v12;
  unint64_t *v13;
  unint64_t v14;
  _QWORD v16[6];
  std::__shared_weak_count *v17;
  uint64_t v18;
  std::__shared_weak_count *v19;
  _BYTE buf[28];
  __int16 v21;
  _BOOL4 v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  -[AVVoiceController impl](self, "impl");
  if (!v18 || self->mClientAPIClutch)
  {
    if (kAVVCScope)
    {
      v3 = *(id *)kAVVCScope;
      if (!v3)
      {
LABEL_10:
        v6 = 0;
        goto LABEL_20;
      }
    }
    else
    {
      v3 = MEMORY[0x1E0C81028];
      v4 = MEMORY[0x1E0C81028];
    }
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    {
      mClientAPIClutch = self->mClientAPIClutch;
      *(_DWORD *)buf = 136315906;
      *(_QWORD *)&buf[4] = "AVVoiceController.mm";
      *(_WORD *)&buf[12] = 1024;
      *(_DWORD *)&buf[14] = 1074;
      *(_WORD *)&buf[18] = 2048;
      *(_QWORD *)&buf[20] = v18;
      v21 = 1024;
      v22 = mClientAPIClutch;
      _os_log_impl(&dword_19B733000, v3, OS_LOG_TYPE_ERROR, "%25s:%-5d Invalid operation. impl(%p) ClientAPIClutch(%d)", buf, 0x22u);
    }

    goto LABEL_10;
  }
  *(_QWORD *)buf = 0;
  *(_QWORD *)&buf[8] = buf;
  *(_QWORD *)&buf[16] = 0x2020000000;
  *(_DWORD *)&buf[24] = 0;
  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3321888768;
  v16[2] = __39__AVVoiceController_recordEndpointMode__block_invoke;
  v16[3] = &unk_1E3BEA200;
  v16[4] = buf;
  v16[5] = v18;
  v17 = v19;
  if (v19)
  {
    p_shared_owners = (unint64_t *)&v19->__shared_owners_;
    do
      v8 = __ldxr(p_shared_owners);
    while (__stxr(v8 + 1, p_shared_owners));
  }
  ControllerImpl::safeWorkSync(v18, v16);
  v6 = *(_DWORD *)(*(_QWORD *)&buf[8] + 24);
  v9 = v17;
  if (v17)
  {
    v10 = (unint64_t *)&v17->__shared_owners_;
    do
      v11 = __ldaxr(v10);
    while (__stlxr(v11 - 1, v10));
    if (!v11)
    {
      ((void (*)(std::__shared_weak_count *))v9->__on_zero_shared)(v9);
      std::__shared_weak_count::__release_weak(v9);
    }
  }
  _Block_object_dispose(buf, 8);
LABEL_20:
  v12 = v19;
  if (v19)
  {
    v13 = (unint64_t *)&v19->__shared_owners_;
    do
      v14 = __ldaxr(v13);
    while (__stlxr(v14 - 1, v13));
    if (!v14)
    {
      ((void (*)(std::__shared_weak_count *))v12->__on_zero_shared)(v12);
      std::__shared_weak_count::__release_weak(v12);
    }
  }
  return v6;
}

- (void)setRecordEndpointMode:(int)a3
{
  NSObject *v5;
  id v6;
  NSObject *v7;
  id v8;
  _BOOL4 mClientAPIClutch;
  std::__shared_weak_count *v10;
  unint64_t *v11;
  unint64_t v12;
  unint64_t *p_shared_owners;
  unint64_t v14;
  std::__shared_weak_count *v15;
  unint64_t *v16;
  unint64_t v17;
  _QWORD v18[5];
  std::__shared_weak_count *v19;
  int v20;
  uint64_t v21;
  std::__shared_weak_count *v22;
  uint8_t buf[4];
  const char *v24;
  __int16 v25;
  int v26;
  __int16 v27;
  uint64_t v28;
  __int16 v29;
  _BOOL4 v30;
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  if (kAVVCScope)
  {
    v5 = *(id *)kAVVCScope;
    if (!v5)
      goto LABEL_8;
  }
  else
  {
    v5 = MEMORY[0x1E0C81028];
    v6 = MEMORY[0x1E0C81028];
  }
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315650;
    v24 = "AVVoiceController.mm";
    v25 = 1024;
    v26 = 1084;
    v27 = 1024;
    LODWORD(v28) = a3;
    _os_log_impl(&dword_19B733000, v5, OS_LOG_TYPE_DEFAULT, "%25s:%-5d #### AVVoiceController: setRecordEndpointMode: %d ####", buf, 0x18u);
  }

LABEL_8:
  -[AVVoiceController impl](self, "impl");
  if (v21 && !self->mClientAPIClutch)
  {
    v18[0] = MEMORY[0x1E0C809B0];
    v18[1] = 3321888768;
    v18[2] = __43__AVVoiceController_setRecordEndpointMode___block_invoke;
    v18[3] = &__block_descriptor_52_ea8_32c42_ZTSNSt3__110shared_ptrI14ControllerImplEE_e5_v8__0l;
    v18[4] = v21;
    v19 = v22;
    if (v22)
    {
      p_shared_owners = (unint64_t *)&v22->__shared_owners_;
      do
        v14 = __ldxr(p_shared_owners);
      while (__stxr(v14 + 1, p_shared_owners));
    }
    v20 = a3;
    ControllerImpl::safeWork(v21, v18, (uint64_t)"-[AVVoiceController setRecordEndpointMode:]");
    v15 = v19;
    if (v19)
    {
      v16 = (unint64_t *)&v19->__shared_owners_;
      do
        v17 = __ldaxr(v16);
      while (__stlxr(v17 - 1, v16));
      if (!v17)
      {
        ((void (*)(std::__shared_weak_count *))v15->__on_zero_shared)(v15);
        std::__shared_weak_count::__release_weak(v15);
      }
    }
  }
  else
  {
    if (kAVVCScope)
    {
      v7 = *(id *)kAVVCScope;
      if (!v7)
        goto LABEL_17;
    }
    else
    {
      v7 = MEMORY[0x1E0C81028];
      v8 = MEMORY[0x1E0C81028];
    }
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      mClientAPIClutch = self->mClientAPIClutch;
      *(_DWORD *)buf = 136315906;
      v24 = "AVVoiceController.mm";
      v25 = 1024;
      v26 = 1085;
      v27 = 2048;
      v28 = v21;
      v29 = 1024;
      v30 = mClientAPIClutch;
      _os_log_impl(&dword_19B733000, v7, OS_LOG_TYPE_ERROR, "%25s:%-5d Invalid operation. impl(%p) ClientAPIClutch(%d)", buf, 0x22u);
    }

  }
LABEL_17:
  v10 = v22;
  if (v22)
  {
    v11 = (unint64_t *)&v22->__shared_owners_;
    do
      v12 = __ldaxr(v11);
    while (__stlxr(v12 - 1, v11));
    if (!v12)
    {
      ((void (*)(std::__shared_weak_count *))v10->__on_zero_shared)(v10);
      std::__shared_weak_count::__release_weak(v10);
    }
  }
}

- (double)recordStartWaitTime
{
  NSObject *v3;
  id v4;
  _BOOL4 mClientAPIClutch;
  double v6;
  unint64_t *p_shared_owners;
  unint64_t v8;
  std::__shared_weak_count *v9;
  unint64_t *v10;
  unint64_t v11;
  std::__shared_weak_count *v12;
  unint64_t *v13;
  unint64_t v14;
  _QWORD v16[6];
  std::__shared_weak_count *v17;
  uint64_t v18;
  std::__shared_weak_count *v19;
  _BYTE buf[34];
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  -[AVVoiceController impl](self, "impl");
  if (!v18 || self->mClientAPIClutch)
  {
    if (kAVVCScope)
    {
      v3 = *(id *)kAVVCScope;
      if (!v3)
      {
LABEL_10:
        v6 = 0.0;
        goto LABEL_20;
      }
    }
    else
    {
      v3 = MEMORY[0x1E0C81028];
      v4 = MEMORY[0x1E0C81028];
    }
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    {
      mClientAPIClutch = self->mClientAPIClutch;
      *(_DWORD *)buf = 136315906;
      *(_QWORD *)&buf[4] = "AVVoiceController.mm";
      *(_WORD *)&buf[12] = 1024;
      *(_DWORD *)&buf[14] = 1098;
      *(_WORD *)&buf[18] = 2048;
      *(_QWORD *)&buf[20] = v18;
      *(_WORD *)&buf[28] = 1024;
      *(_DWORD *)&buf[30] = mClientAPIClutch;
      _os_log_impl(&dword_19B733000, v3, OS_LOG_TYPE_ERROR, "%25s:%-5d Invalid operation. impl(%p) ClientAPIClutch(%d)", buf, 0x22u);
    }

    goto LABEL_10;
  }
  *(_QWORD *)buf = 0;
  *(_QWORD *)&buf[8] = buf;
  *(_QWORD *)&buf[16] = 0x2020000000;
  *(_QWORD *)&buf[24] = 0;
  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3321888768;
  v16[2] = __40__AVVoiceController_recordStartWaitTime__block_invoke;
  v16[3] = &unk_1E3BEA200;
  v16[4] = buf;
  v16[5] = v18;
  v17 = v19;
  if (v19)
  {
    p_shared_owners = (unint64_t *)&v19->__shared_owners_;
    do
      v8 = __ldxr(p_shared_owners);
    while (__stxr(v8 + 1, p_shared_owners));
  }
  ControllerImpl::safeWorkSync(v18, v16);
  v6 = *(double *)(*(_QWORD *)&buf[8] + 24);
  v9 = v17;
  if (v17)
  {
    v10 = (unint64_t *)&v17->__shared_owners_;
    do
      v11 = __ldaxr(v10);
    while (__stlxr(v11 - 1, v10));
    if (!v11)
    {
      ((void (*)(std::__shared_weak_count *))v9->__on_zero_shared)(v9);
      std::__shared_weak_count::__release_weak(v9);
    }
  }
  _Block_object_dispose(buf, 8);
LABEL_20:
  v12 = v19;
  if (v19)
  {
    v13 = (unint64_t *)&v19->__shared_owners_;
    do
      v14 = __ldaxr(v13);
    while (__stlxr(v14 - 1, v13));
    if (!v14)
    {
      ((void (*)(std::__shared_weak_count *))v12->__on_zero_shared)(v12);
      std::__shared_weak_count::__release_weak(v12);
    }
  }
  return v6;
}

- (void)setRecordStartWaitTime:(double)a3
{
  NSObject *v5;
  id v6;
  NSObject *v7;
  id v8;
  _BOOL4 mClientAPIClutch;
  std::__shared_weak_count *v10;
  unint64_t *v11;
  unint64_t v12;
  unint64_t *p_shared_owners;
  unint64_t v14;
  std::__shared_weak_count *v15;
  unint64_t *v16;
  unint64_t v17;
  _QWORD v18[6];
  std::__shared_weak_count *v19;
  double v20;
  std::__shared_weak_count *v21;
  uint8_t buf[4];
  const char *v23;
  __int16 v24;
  int v25;
  __int16 v26;
  double v27;
  __int16 v28;
  _BOOL4 v29;
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  if (kAVVCScope)
  {
    v5 = *(id *)kAVVCScope;
    if (!v5)
      goto LABEL_8;
  }
  else
  {
    v5 = MEMORY[0x1E0C81028];
    v6 = MEMORY[0x1E0C81028];
  }
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315650;
    v23 = "AVVoiceController.mm";
    v24 = 1024;
    v25 = 1108;
    v26 = 2048;
    v27 = a3;
    _os_log_impl(&dword_19B733000, v5, OS_LOG_TYPE_DEFAULT, "%25s:%-5d #### AVVoiceController: recordStartWaitTime: %f ####", buf, 0x1Cu);
  }

LABEL_8:
  -[AVVoiceController impl](self, "impl");
  if (v20 == 0.0 || self->mClientAPIClutch)
  {
    if (kAVVCScope)
    {
      v7 = *(id *)kAVVCScope;
      if (!v7)
        goto LABEL_17;
    }
    else
    {
      v7 = MEMORY[0x1E0C81028];
      v8 = MEMORY[0x1E0C81028];
    }
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      mClientAPIClutch = self->mClientAPIClutch;
      *(_DWORD *)buf = 136315906;
      v23 = "AVVoiceController.mm";
      v24 = 1024;
      v25 = 1109;
      v26 = 2048;
      v27 = v20;
      v28 = 1024;
      v29 = mClientAPIClutch;
      _os_log_impl(&dword_19B733000, v7, OS_LOG_TYPE_ERROR, "%25s:%-5d Invalid operation. impl(%p) ClientAPIClutch(%d)", buf, 0x22u);
    }

  }
  else
  {
    v18[0] = MEMORY[0x1E0C809B0];
    v18[1] = 3321888768;
    v18[2] = __44__AVVoiceController_setRecordStartWaitTime___block_invoke;
    v18[3] = &__block_descriptor_56_ea8_40c42_ZTSNSt3__110shared_ptrI14ControllerImplEE_e5_v8__0l;
    *(double *)&v18[4] = a3;
    *(double *)&v18[5] = v20;
    v19 = v21;
    if (v21)
    {
      p_shared_owners = (unint64_t *)&v21->__shared_owners_;
      do
        v14 = __ldxr(p_shared_owners);
      while (__stxr(v14 + 1, p_shared_owners));
    }
    ControllerImpl::safeWork(*(uint64_t *)&v20, v18, (uint64_t)"-[AVVoiceController setRecordStartWaitTime:]");
    v15 = v19;
    if (v19)
    {
      v16 = (unint64_t *)&v19->__shared_owners_;
      do
        v17 = __ldaxr(v16);
      while (__stlxr(v17 - 1, v16));
      if (!v17)
      {
        ((void (*)(std::__shared_weak_count *))v15->__on_zero_shared)(v15);
        std::__shared_weak_count::__release_weak(v15);
      }
    }
  }
LABEL_17:
  v10 = v21;
  if (v21)
  {
    v11 = (unint64_t *)&v21->__shared_owners_;
    do
      v12 = __ldaxr(v11);
    while (__stlxr(v12 - 1, v11));
    if (!v12)
    {
      ((void (*)(std::__shared_weak_count *))v10->__on_zero_shared)(v10);
      std::__shared_weak_count::__release_weak(v10);
    }
  }
}

- (double)recordInterspeechWaitTime
{
  NSObject *v3;
  id v4;
  _BOOL4 mClientAPIClutch;
  double v6;
  unint64_t *p_shared_owners;
  unint64_t v8;
  std::__shared_weak_count *v9;
  unint64_t *v10;
  unint64_t v11;
  std::__shared_weak_count *v12;
  unint64_t *v13;
  unint64_t v14;
  _QWORD v16[6];
  std::__shared_weak_count *v17;
  uint64_t v18;
  std::__shared_weak_count *v19;
  _BYTE buf[34];
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  -[AVVoiceController impl](self, "impl");
  if (!v18 || self->mClientAPIClutch)
  {
    if (kAVVCScope)
    {
      v3 = *(id *)kAVVCScope;
      if (!v3)
      {
LABEL_10:
        v6 = 0.0;
        goto LABEL_20;
      }
    }
    else
    {
      v3 = MEMORY[0x1E0C81028];
      v4 = MEMORY[0x1E0C81028];
    }
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    {
      mClientAPIClutch = self->mClientAPIClutch;
      *(_DWORD *)buf = 136315906;
      *(_QWORD *)&buf[4] = "AVVoiceController.mm";
      *(_WORD *)&buf[12] = 1024;
      *(_DWORD *)&buf[14] = 1125;
      *(_WORD *)&buf[18] = 2048;
      *(_QWORD *)&buf[20] = v18;
      *(_WORD *)&buf[28] = 1024;
      *(_DWORD *)&buf[30] = mClientAPIClutch;
      _os_log_impl(&dword_19B733000, v3, OS_LOG_TYPE_ERROR, "%25s:%-5d Invalid operation. impl(%p) ClientAPIClutch(%d)", buf, 0x22u);
    }

    goto LABEL_10;
  }
  *(_QWORD *)buf = 0;
  *(_QWORD *)&buf[8] = buf;
  *(_QWORD *)&buf[16] = 0x2020000000;
  *(_QWORD *)&buf[24] = 0;
  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3321888768;
  v16[2] = __46__AVVoiceController_recordInterspeechWaitTime__block_invoke;
  v16[3] = &unk_1E3BEA200;
  v16[4] = buf;
  v16[5] = v18;
  v17 = v19;
  if (v19)
  {
    p_shared_owners = (unint64_t *)&v19->__shared_owners_;
    do
      v8 = __ldxr(p_shared_owners);
    while (__stxr(v8 + 1, p_shared_owners));
  }
  ControllerImpl::safeWorkSync(v18, v16);
  v6 = *(double *)(*(_QWORD *)&buf[8] + 24);
  v9 = v17;
  if (v17)
  {
    v10 = (unint64_t *)&v17->__shared_owners_;
    do
      v11 = __ldaxr(v10);
    while (__stlxr(v11 - 1, v10));
    if (!v11)
    {
      ((void (*)(std::__shared_weak_count *))v9->__on_zero_shared)(v9);
      std::__shared_weak_count::__release_weak(v9);
    }
  }
  _Block_object_dispose(buf, 8);
LABEL_20:
  v12 = v19;
  if (v19)
  {
    v13 = (unint64_t *)&v19->__shared_owners_;
    do
      v14 = __ldaxr(v13);
    while (__stlxr(v14 - 1, v13));
    if (!v14)
    {
      ((void (*)(std::__shared_weak_count *))v12->__on_zero_shared)(v12);
      std::__shared_weak_count::__release_weak(v12);
    }
  }
  return v6;
}

- (void)setRecordInterspeechWaitTime:(double)a3
{
  NSObject *v5;
  id v6;
  _BOOL4 mClientAPIClutch;
  std::__shared_weak_count *v8;
  unint64_t *v9;
  unint64_t v10;
  unint64_t *p_shared_owners;
  unint64_t v12;
  std::__shared_weak_count *v13;
  unint64_t *v14;
  unint64_t v15;
  _QWORD v16[6];
  std::__shared_weak_count *v17;
  uint64_t v18;
  std::__shared_weak_count *v19;
  uint8_t buf[4];
  const char *v21;
  __int16 v22;
  int v23;
  __int16 v24;
  uint64_t v25;
  __int16 v26;
  _BOOL4 v27;
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  -[AVVoiceController impl](self, "impl");
  if (v18 && !self->mClientAPIClutch)
  {
    v16[0] = MEMORY[0x1E0C809B0];
    v16[1] = 3321888768;
    v16[2] = __50__AVVoiceController_setRecordInterspeechWaitTime___block_invoke;
    v16[3] = &__block_descriptor_56_ea8_40c42_ZTSNSt3__110shared_ptrI14ControllerImplEE_e5_v8__0l;
    *(double *)&v16[4] = a3;
    v16[5] = v18;
    v17 = v19;
    if (v19)
    {
      p_shared_owners = (unint64_t *)&v19->__shared_owners_;
      do
        v12 = __ldxr(p_shared_owners);
      while (__stxr(v12 + 1, p_shared_owners));
    }
    ControllerImpl::safeWork(v18, v16, (uint64_t)"-[AVVoiceController setRecordInterspeechWaitTime:]");
    v13 = v17;
    if (v17)
    {
      v14 = (unint64_t *)&v17->__shared_owners_;
      do
        v15 = __ldaxr(v14);
      while (__stlxr(v15 - 1, v14));
      if (!v15)
      {
        ((void (*)(std::__shared_weak_count *))v13->__on_zero_shared)(v13);
        std::__shared_weak_count::__release_weak(v13);
      }
    }
  }
  else
  {
    if (kAVVCScope)
    {
      v5 = *(id *)kAVVCScope;
      if (!v5)
        goto LABEL_10;
    }
    else
    {
      v5 = MEMORY[0x1E0C81028];
      v6 = MEMORY[0x1E0C81028];
    }
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      mClientAPIClutch = self->mClientAPIClutch;
      *(_DWORD *)buf = 136315906;
      v21 = "AVVoiceController.mm";
      v22 = 1024;
      v23 = 1135;
      v24 = 2048;
      v25 = v18;
      v26 = 1024;
      v27 = mClientAPIClutch;
      _os_log_impl(&dword_19B733000, v5, OS_LOG_TYPE_ERROR, "%25s:%-5d Invalid operation. impl(%p) ClientAPIClutch(%d)", buf, 0x22u);
    }

  }
LABEL_10:
  v8 = v19;
  if (v19)
  {
    v9 = (unint64_t *)&v19->__shared_owners_;
    do
      v10 = __ldaxr(v9);
    while (__stlxr(v10 - 1, v9));
    if (!v10)
    {
      ((void (*)(std::__shared_weak_count *))v8->__on_zero_shared)(v8);
      std::__shared_weak_count::__release_weak(v8);
    }
  }
}

- (double)recordEndWaitTime
{
  NSObject *v3;
  id v4;
  _BOOL4 mClientAPIClutch;
  double v6;
  unint64_t *p_shared_owners;
  unint64_t v8;
  std::__shared_weak_count *v9;
  unint64_t *v10;
  unint64_t v11;
  std::__shared_weak_count *v12;
  unint64_t *v13;
  unint64_t v14;
  _QWORD v16[6];
  std::__shared_weak_count *v17;
  uint64_t v18;
  std::__shared_weak_count *v19;
  _BYTE buf[34];
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  -[AVVoiceController impl](self, "impl");
  if (!v18 || self->mClientAPIClutch)
  {
    if (kAVVCScope)
    {
      v3 = *(id *)kAVVCScope;
      if (!v3)
      {
LABEL_10:
        v6 = 0.0;
        goto LABEL_20;
      }
    }
    else
    {
      v3 = MEMORY[0x1E0C81028];
      v4 = MEMORY[0x1E0C81028];
    }
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    {
      mClientAPIClutch = self->mClientAPIClutch;
      *(_DWORD *)buf = 136315906;
      *(_QWORD *)&buf[4] = "AVVoiceController.mm";
      *(_WORD *)&buf[12] = 1024;
      *(_DWORD *)&buf[14] = 1152;
      *(_WORD *)&buf[18] = 2048;
      *(_QWORD *)&buf[20] = v18;
      *(_WORD *)&buf[28] = 1024;
      *(_DWORD *)&buf[30] = mClientAPIClutch;
      _os_log_impl(&dword_19B733000, v3, OS_LOG_TYPE_ERROR, "%25s:%-5d Invalid operation. impl(%p) ClientAPIClutch(%d)", buf, 0x22u);
    }

    goto LABEL_10;
  }
  *(_QWORD *)buf = 0;
  *(_QWORD *)&buf[8] = buf;
  *(_QWORD *)&buf[16] = 0x2020000000;
  *(_QWORD *)&buf[24] = 0;
  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3321888768;
  v16[2] = __38__AVVoiceController_recordEndWaitTime__block_invoke;
  v16[3] = &unk_1E3BEA200;
  v16[4] = buf;
  v16[5] = v18;
  v17 = v19;
  if (v19)
  {
    p_shared_owners = (unint64_t *)&v19->__shared_owners_;
    do
      v8 = __ldxr(p_shared_owners);
    while (__stxr(v8 + 1, p_shared_owners));
  }
  ControllerImpl::safeWorkSync(v18, v16);
  v6 = *(double *)(*(_QWORD *)&buf[8] + 24);
  v9 = v17;
  if (v17)
  {
    v10 = (unint64_t *)&v17->__shared_owners_;
    do
      v11 = __ldaxr(v10);
    while (__stlxr(v11 - 1, v10));
    if (!v11)
    {
      ((void (*)(std::__shared_weak_count *))v9->__on_zero_shared)(v9);
      std::__shared_weak_count::__release_weak(v9);
    }
  }
  _Block_object_dispose(buf, 8);
LABEL_20:
  v12 = v19;
  if (v19)
  {
    v13 = (unint64_t *)&v19->__shared_owners_;
    do
      v14 = __ldaxr(v13);
    while (__stlxr(v14 - 1, v13));
    if (!v14)
    {
      ((void (*)(std::__shared_weak_count *))v12->__on_zero_shared)(v12);
      std::__shared_weak_count::__release_weak(v12);
    }
  }
  return v6;
}

- (void)setRecordEndWaitTime:(double)a3
{
  NSObject *v5;
  id v6;
  _BOOL4 mClientAPIClutch;
  std::__shared_weak_count *v8;
  unint64_t *v9;
  unint64_t v10;
  unint64_t *p_shared_owners;
  unint64_t v12;
  std::__shared_weak_count *v13;
  unint64_t *v14;
  unint64_t v15;
  _QWORD v16[6];
  std::__shared_weak_count *v17;
  uint64_t v18;
  std::__shared_weak_count *v19;
  uint8_t buf[4];
  const char *v21;
  __int16 v22;
  int v23;
  __int16 v24;
  uint64_t v25;
  __int16 v26;
  _BOOL4 v27;
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  -[AVVoiceController impl](self, "impl");
  if (v18 && !self->mClientAPIClutch)
  {
    v16[0] = MEMORY[0x1E0C809B0];
    v16[1] = 3321888768;
    v16[2] = __42__AVVoiceController_setRecordEndWaitTime___block_invoke;
    v16[3] = &__block_descriptor_56_ea8_40c42_ZTSNSt3__110shared_ptrI14ControllerImplEE_e5_v8__0l;
    *(double *)&v16[4] = a3;
    v16[5] = v18;
    v17 = v19;
    if (v19)
    {
      p_shared_owners = (unint64_t *)&v19->__shared_owners_;
      do
        v12 = __ldxr(p_shared_owners);
      while (__stxr(v12 + 1, p_shared_owners));
    }
    ControllerImpl::safeWork(v18, v16, (uint64_t)"-[AVVoiceController setRecordEndWaitTime:]");
    v13 = v17;
    if (v17)
    {
      v14 = (unint64_t *)&v17->__shared_owners_;
      do
        v15 = __ldaxr(v14);
      while (__stlxr(v15 - 1, v14));
      if (!v15)
      {
        ((void (*)(std::__shared_weak_count *))v13->__on_zero_shared)(v13);
        std::__shared_weak_count::__release_weak(v13);
      }
    }
  }
  else
  {
    if (kAVVCScope)
    {
      v5 = *(id *)kAVVCScope;
      if (!v5)
        goto LABEL_10;
    }
    else
    {
      v5 = MEMORY[0x1E0C81028];
      v6 = MEMORY[0x1E0C81028];
    }
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      mClientAPIClutch = self->mClientAPIClutch;
      *(_DWORD *)buf = 136315906;
      v21 = "AVVoiceController.mm";
      v22 = 1024;
      v23 = 1162;
      v24 = 2048;
      v25 = v18;
      v26 = 1024;
      v27 = mClientAPIClutch;
      _os_log_impl(&dword_19B733000, v5, OS_LOG_TYPE_ERROR, "%25s:%-5d Invalid operation. impl(%p) ClientAPIClutch(%d)", buf, 0x22u);
    }

  }
LABEL_10:
  v8 = v19;
  if (v19)
  {
    v9 = (unint64_t *)&v19->__shared_owners_;
    do
      v10 = __ldaxr(v9);
    while (__stlxr(v10 - 1, v9));
    if (!v10)
    {
      ((void (*)(std::__shared_weak_count *))v8->__on_zero_shared)(v8);
      std::__shared_weak_count::__release_weak(v8);
    }
  }
}

- (void)setAlertVolume:(float)a3
{
  NSObject *v5;
  id v6;
  NSObject *v7;
  id v8;
  _BOOL4 mClientAPIClutch;
  std::__shared_weak_count *v10;
  unint64_t *v11;
  unint64_t v12;
  unint64_t *p_shared_owners;
  unint64_t v14;
  std::__shared_weak_count *v15;
  unint64_t *v16;
  unint64_t v17;
  _QWORD v18[5];
  std::__shared_weak_count *v19;
  float v20;
  double v21;
  std::__shared_weak_count *v22;
  uint8_t buf[4];
  const char *v24;
  __int16 v25;
  int v26;
  __int16 v27;
  double v28;
  __int16 v29;
  _BOOL4 v30;
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  if (kAVVCScope)
  {
    v5 = *(id *)kAVVCScope;
    if (!v5)
      goto LABEL_8;
  }
  else
  {
    v5 = MEMORY[0x1E0C81028];
    v6 = MEMORY[0x1E0C81028];
  }
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315650;
    v24 = "AVVoiceController.mm";
    v25 = 1024;
    v26 = 1180;
    v27 = 2048;
    v28 = a3;
    _os_log_impl(&dword_19B733000, v5, OS_LOG_TYPE_DEFAULT, "%25s:%-5d #### AVVoiceController: setAlertVolume: %f ####", buf, 0x1Cu);
  }

LABEL_8:
  -[AVVoiceController impl](self, "impl");
  if (v21 == 0.0 || self->mClientAPIClutch)
  {
    if (kAVVCScope)
    {
      v7 = *(id *)kAVVCScope;
      if (!v7)
        goto LABEL_17;
    }
    else
    {
      v7 = MEMORY[0x1E0C81028];
      v8 = MEMORY[0x1E0C81028];
    }
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      mClientAPIClutch = self->mClientAPIClutch;
      *(_DWORD *)buf = 136315906;
      v24 = "AVVoiceController.mm";
      v25 = 1024;
      v26 = 1181;
      v27 = 2048;
      v28 = v21;
      v29 = 1024;
      v30 = mClientAPIClutch;
      _os_log_impl(&dword_19B733000, v7, OS_LOG_TYPE_ERROR, "%25s:%-5d Invalid operation. impl(%p) ClientAPIClutch(%d)", buf, 0x22u);
    }

  }
  else
  {
    v18[0] = MEMORY[0x1E0C809B0];
    v18[1] = 3321888768;
    v18[2] = __36__AVVoiceController_setAlertVolume___block_invoke;
    v18[3] = &__block_descriptor_52_ea8_32c42_ZTSNSt3__110shared_ptrI14ControllerImplEE_e5_v8__0l;
    *(double *)&v18[4] = v21;
    v19 = v22;
    if (v22)
    {
      p_shared_owners = (unint64_t *)&v22->__shared_owners_;
      do
        v14 = __ldxr(p_shared_owners);
      while (__stxr(v14 + 1, p_shared_owners));
    }
    v20 = a3;
    ControllerImpl::safeWork(*(uint64_t *)&v21, v18, (uint64_t)"-[AVVoiceController setAlertVolume:]");
    v15 = v19;
    if (v19)
    {
      v16 = (unint64_t *)&v19->__shared_owners_;
      do
        v17 = __ldaxr(v16);
      while (__stlxr(v17 - 1, v16));
      if (!v17)
      {
        ((void (*)(std::__shared_weak_count *))v15->__on_zero_shared)(v15);
        std::__shared_weak_count::__release_weak(v15);
      }
    }
  }
LABEL_17:
  v10 = v22;
  if (v22)
  {
    v11 = (unint64_t *)&v22->__shared_owners_;
    do
      v12 = __ldaxr(v11);
    while (__stlxr(v12 - 1, v11));
    if (!v12)
    {
      ((void (*)(std::__shared_weak_count *))v10->__on_zero_shared)(v10);
      std::__shared_weak_count::__release_weak(v10);
    }
  }
}

- (float)alertVolume
{
  NSObject *v3;
  id v4;
  _BOOL4 mClientAPIClutch;
  float v6;
  unint64_t *p_shared_owners;
  unint64_t v8;
  uint64_t v10;
  std::__shared_weak_count *v11;
  uint8_t buf[4];
  const char *v13;
  __int16 v14;
  int v15;
  __int16 v16;
  uint64_t v17;
  __int16 v18;
  _BOOL4 v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  -[AVVoiceController impl](self, "impl");
  if (v10 && !self->mClientAPIClutch)
  {
    v6 = *(float *)(v10 + 400);
    goto LABEL_12;
  }
  if (!kAVVCScope)
  {
    v3 = MEMORY[0x1E0C81028];
    v4 = MEMORY[0x1E0C81028];
    goto LABEL_7;
  }
  v3 = *(id *)kAVVCScope;
  if (v3)
  {
LABEL_7:
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    {
      mClientAPIClutch = self->mClientAPIClutch;
      *(_DWORD *)buf = 136315906;
      v13 = "AVVoiceController.mm";
      v14 = 1024;
      v15 = 1197;
      v16 = 2048;
      v17 = v10;
      v18 = 1024;
      v19 = mClientAPIClutch;
      _os_log_impl(&dword_19B733000, v3, OS_LOG_TYPE_ERROR, "%25s:%-5d Invalid operation. impl(%p) ClientAPIClutch(%d)", buf, 0x22u);
    }

  }
  v6 = 0.0;
LABEL_12:
  if (v11)
  {
    p_shared_owners = (unint64_t *)&v11->__shared_owners_;
    do
      v8 = __ldaxr(p_shared_owners);
    while (__stlxr(v8 - 1, p_shared_owners));
    if (!v8)
    {
      ((void (*)())v11->__on_zero_shared)();
      std::__shared_weak_count::__release_weak(v11);
    }
  }
  return v6;
}

- (unint64_t)getAlertStartTime
{
  NSObject *v3;
  id v4;
  _BOOL4 mClientAPIClutch;
  unint64_t v6;
  unint64_t *p_shared_owners;
  unint64_t v8;
  uint64_t v10;
  std::__shared_weak_count *v11;
  uint8_t buf[4];
  const char *v13;
  __int16 v14;
  int v15;
  __int16 v16;
  uint64_t v17;
  __int16 v18;
  _BOOL4 v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  -[AVVoiceController impl](self, "impl");
  if (v10 && !self->mClientAPIClutch)
  {
    v6 = *(_QWORD *)(v10 + 376);
    goto LABEL_12;
  }
  if (!kAVVCScope)
  {
    v3 = MEMORY[0x1E0C81028];
    v4 = MEMORY[0x1E0C81028];
    goto LABEL_7;
  }
  v3 = *(id *)kAVVCScope;
  if (v3)
  {
LABEL_7:
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    {
      mClientAPIClutch = self->mClientAPIClutch;
      *(_DWORD *)buf = 136315906;
      v13 = "AVVoiceController.mm";
      v14 = 1024;
      v15 = 1205;
      v16 = 2048;
      v17 = v10;
      v18 = 1024;
      v19 = mClientAPIClutch;
      _os_log_impl(&dword_19B733000, v3, OS_LOG_TYPE_ERROR, "%25s:%-5d Invalid operation. impl(%p) ClientAPIClutch(%d)", buf, 0x22u);
    }

  }
  v6 = 0;
LABEL_12:
  if (v11)
  {
    p_shared_owners = (unint64_t *)&v11->__shared_owners_;
    do
      v8 = __ldaxr(p_shared_owners);
    while (__stlxr(v8 - 1, p_shared_owners));
    if (!v8)
    {
      ((void (*)())v11->__on_zero_shared)();
      std::__shared_weak_count::__release_weak(v11);
    }
  }
  return v6;
}

- (NSDictionary)metrics
{
  AVVoiceController *v2;
  _QWORD *v3;
  AVVoiceController *v4;
  id v5;
  _QWORD v7[2];
  void (*v8)(uint64_t);
  void *v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  uint64_t (*v14)(uint64_t, uint64_t);
  void (*v15)(uint64_t);
  id v16;

  v11 = 0;
  v12 = &v11;
  v13 = 0x3032000000;
  v14 = __Block_byref_object_copy__183;
  v15 = __Block_byref_object_dispose__184;
  v16 = 0;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v8 = __28__AVVoiceController_metrics__block_invoke;
  v9 = &unk_1E3BECFE0;
  v10 = &v11;
  v2 = self;
  v3 = v7;
  if (IsSerializationEnabled(void)::onceToken != -1)
    dispatch_once(&IsSerializationEnabled(void)::onceToken, &__block_literal_global_132);
  if (IsSerializationEnabled(void)::enable)
  {
    v8((uint64_t)v3);
  }
  else
  {
    v4 = v2;
    objc_sync_enter(v4);
    v8((uint64_t)v3);
    objc_sync_exit(v4);

  }
  v5 = (id)v12[5];
  _Block_object_dispose(&v11, 8);

  return (NSDictionary *)v5;
}

- (AVVoiceController)initWithError:(id *)a3
{
  return (AVVoiceController *)-[AVVoiceController initVoiceControllerForClient:withError:](self, "initVoiceControllerForClient:withError:", 1, a3);
}

- (id)initVoiceControllerForClient:(int64_t)a3 withError:(id *)a4
{
  NSObject *v7;
  id v8;
  AVVoiceController *v9;
  id v10;
  id v11;
  NSObject *v12;
  void *v13;
  void *v14;
  NSObject *v15;
  dispatch_time_t v16;
  intptr_t v17;
  id v18;
  id v19;
  NSObject *v20;
  void *v21;
  uint64_t v22;
  void *v23;
  const char *v24;
  NSObject *v25;
  id v26;
  NSObject *v27;
  NSObject *v28;
  AVVoiceController *v29;
  AVVoiceController *v30;
  AVVoiceController *v31;
  NSObject *v32;
  NSObject *v33;
  uint64_t ObjectMap;
  uint64_t v35;
  _QWORD *v36;
  _QWORD *v37;
  _QWORD *v38;
  unint64_t v39;
  _QWORD *v40;
  uint64_t v41;
  uint64_t v42;
  id v43;
  NSObject *v44;
  AVVoiceController *v45;
  id v46;
  id v48;
  objc_super v49;
  int v50;
  char v51;
  __int128 v52;
  __int128 v53;
  uint8_t v54[160];
  uint8_t buf[4];
  const char *v56;
  __int16 v57;
  _BYTE v58[24];
  __int16 v59;
  uint64_t v60;
  uint64_t v61;

  v61 = *MEMORY[0x1E0C80C00];
  v50 = 4133;
  v51 = 1;
  v52 = 0u;
  v53 = 0u;
  kdebug_trace();
  Initialize_Logging();
  ElapsedTime::ElapsedTime((ElapsedTime *)v54, "-[AVVoiceController initVoiceControllerForClient:withError:]", 0, 0);
  if (kAVVCScope)
  {
    v7 = *(id *)kAVVCScope;
    if (!v7)
      goto LABEL_8;
  }
  else
  {
    v7 = MEMORY[0x1E0C81028];
    v8 = MEMORY[0x1E0C81028];
  }
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315906;
    v56 = "AVVoiceController.mm";
    v57 = 1024;
    *(_DWORD *)v58 = 1243;
    *(_WORD *)&v58[4] = 1024;
    *(_DWORD *)&v58[6] = a3;
    *(_WORD *)&v58[10] = 2048;
    *(_QWORD *)&v58[12] = self;
    _os_log_impl(&dword_19B733000, v7, OS_LOG_TYPE_DEFAULT, "%25s:%-5d [enforce 1 avvc] #### AVVoiceController: initVoiceControllerForClient:(%d) (V2): [self == %p]", buf, 0x22u);
  }

LABEL_8:
  v9 = self;
  if (kAVVCScope)
  {
    v10 = *(id *)kAVVCScope;
    if (!v10)
      goto LABEL_15;
  }
  else
  {
    v10 = (id)MEMORY[0x1E0C81028];
    v11 = MEMORY[0x1E0C81028];
  }
  v12 = v10;
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    GetAVVCSingleInstanceSemaphore();
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "debugDescription");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 136315906;
    v56 = "AVVoiceController.mm";
    v57 = 1024;
    *(_DWORD *)v58 = 124;
    *(_WORD *)&v58[4] = 2048;
    *(_QWORD *)&v58[6] = v9;
    *(_WORD *)&v58[14] = 2112;
    *(_QWORD *)&v58[16] = v14;
    _os_log_impl(&dword_19B733000, v12, OS_LOG_TYPE_DEFAULT, "%25s:%-5d [enforce 1 avvc] before wait controller(%p), %@", buf, 0x26u);

  }
LABEL_15:
  GetAVVCSingleInstanceSemaphore();
  v15 = objc_claimAutoreleasedReturnValue();
  v16 = dispatch_time(0, 7500000000);
  v17 = dispatch_semaphore_wait(v15, v16);

  if (kAVVCScope)
  {
    v18 = *(id *)kAVVCScope;
    if (!v18)
      goto LABEL_24;
  }
  else
  {
    v18 = (id)MEMORY[0x1E0C81028];
    v19 = MEMORY[0x1E0C81028];
  }
  v20 = v18;
  if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
  {
    GetAVVCSingleInstanceSemaphore();
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "debugDescription");
    v22 = objc_claimAutoreleasedReturnValue();
    v23 = (void *)v22;
    v56 = "AVVoiceController.mm";
    v57 = 1024;
    v24 = " TIMEDOUT!";
    *(_DWORD *)v58 = 126;
    *(_WORD *)&v58[4] = 2080;
    *(_DWORD *)buf = 136316162;
    if (!v17)
      v24 = "";
    *(_QWORD *)&v58[6] = v24;
    *(_WORD *)&v58[14] = 2048;
    *(_QWORD *)&v58[16] = v9;
    v59 = 2112;
    v60 = v22;
    _os_log_impl(&dword_19B733000, v20, OS_LOG_TYPE_DEFAULT, "%25s:%-5d [enforce 1 avvc] after wait%s controller(%p), %@", buf, 0x30u);

  }
LABEL_24:
  if (v17)
  {
    if (kAVVCScope)
    {
      v25 = *(id *)kAVVCScope;
      if (!v25)
      {
LABEL_32:
        v27 = *(NSObject **)kAVVCScope;
        CALog::Scope::oslog(*(id *)kAVVCScope);
        v28 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v28, OS_LOG_TYPE_FAULT))
        {
          *(_DWORD *)buf = 136315394;
          v56 = "BlockIfAnotherAVVCIsStillAlive";
          v57 = 2048;
          *(_QWORD *)v58 = v9;
          _os_log_fault_impl(&dword_19B733000, v27, OS_LOG_TYPE_FAULT, "[enforce 1 avvc] %s Timed out waiting to initialize, which means multiple AVVC objects exist simultaneously. Controller(%p)", buf, 0x16u);
        }

        goto LABEL_35;
      }
    }
    else
    {
      v25 = MEMORY[0x1E0C81028];
      v26 = MEMORY[0x1E0C81028];
    }
    if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315394;
      v56 = "AVVoiceController.mm";
      v57 = 1024;
      *(_DWORD *)v58 = 129;
      _os_log_impl(&dword_19B733000, v25, OS_LOG_TYPE_DEFAULT, "%25s:%-5d [enforce 1 avvc] Timed out waiting to initialize, which means multiple AVVC objects exist simultaneously", buf, 0x12u);
    }

    goto LABEL_32;
  }
LABEL_35:

  v49.receiver = v9;
  v49.super_class = (Class)AVVoiceController;
  v29 = -[AVVoiceController init](&v49, sel_init);
  v30 = v29;
  if (v29)
  {
    v31 = v29;
    if (kAVVCScope)
    {
      if ((*(_BYTE *)(kAVVCScope + 8) & 1) != 0)
      {
        v32 = *(id *)kAVVCScope;
        if (v32)
        {
          v33 = v32;
          if (os_log_type_enabled(v32, OS_LOG_TYPE_DEBUG))
          {
            *(_DWORD *)buf = 136315650;
            v56 = "AVVCUtils.mm";
            v57 = 1024;
            *(_DWORD *)v58 = 80;
            *(_WORD *)&v58[4] = 2048;
            *(_QWORD *)&v58[6] = v31;
            _os_log_impl(&dword_19B733000, v33, OS_LOG_TYPE_DEBUG, "%25s:%-5d RegisterObject: registering %p", buf, 0x1Cu);
          }

        }
      }
    }
    pthread_mutex_lock(&MapLocker::sMapLock);
    ObjectMap = GetObjectMap();
    v35 = ObjectMap;
    v37 = (_QWORD *)(ObjectMap + 8);
    v36 = *(_QWORD **)(ObjectMap + 8);
    if (v36)
    {
      while (1)
      {
        while (1)
        {
          v38 = v36;
          v39 = v36[4];
          if ((unint64_t)v31 >= v39)
            break;
          v36 = (_QWORD *)*v38;
          v37 = v38;
          if (!*v38)
            goto LABEL_50;
        }
        if (v39 >= (unint64_t)v31)
          break;
        v36 = (_QWORD *)v38[1];
        if (!v36)
        {
          v37 = v38 + 1;
          goto LABEL_50;
        }
      }
    }
    else
    {
      v38 = (_QWORD *)(ObjectMap + 8);
LABEL_50:
      v40 = operator new(0x30uLL);
      v40[4] = v31;
      *((_BYTE *)v40 + 40) = 1;
      *v40 = 0;
      v40[1] = 0;
      v40[2] = v38;
      *v37 = v40;
      v41 = **(_QWORD **)v35;
      if (v41)
      {
        *(_QWORD *)v35 = v41;
        v40 = (_QWORD *)*v37;
      }
      std::__tree_balance_after_insert[abi:ne180100]<std::__tree_node_base<void *> *>(*(uint64_t **)(v35 + 8), v40);
      ++*(_QWORD *)(v35 + 16);
    }
    pthread_mutex_unlock(&MapLocker::sMapLock);

    v42 = -[AVVoiceController _bringUp:withError:](v31, "_bringUp:withError:", a3, a4);
    if (v42)
    {
      if (a4)
      {
        objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CB2F90], v42, 0);
        *a4 = (id)objc_claimAutoreleasedReturnValue();
      }
      v48 = 0;
      -[AVVoiceController _teardownWithError:](v31, "_teardownWithError:", &v48, v42);
      v43 = v48;
      if (kAVVCScope)
      {
        v44 = *(id *)kAVVCScope;
        if (!v44)
        {
LABEL_64:

          v45 = 0;
          goto LABEL_65;
        }
      }
      else
      {
        v44 = MEMORY[0x1E0C81028];
        v46 = MEMORY[0x1E0C81028];
      }
      if (os_log_type_enabled(v44, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136315650;
        v56 = "AVVoiceController.mm";
        v57 = 1024;
        *(_DWORD *)v58 = 1258;
        *(_WORD *)&v58[4] = 2112;
        *(_QWORD *)&v58[6] = v43;
        _os_log_impl(&dword_19B733000, v44, OS_LOG_TYPE_ERROR, "%25s:%-5d Failed to initialize. Teardown error: %@", buf, 0x1Cu);
      }

      goto LABEL_64;
    }
  }
  v45 = v30;
LABEL_65:
  ElapsedTime::~ElapsedTime((ElapsedTime *)v54);
  TraceWrapper::~TraceWrapper((TraceWrapper *)&v50);

  return v45;
}

- (int64_t)_bringUp:(int64_t)a3 withError:(id *)a4
{
  std::__shared_weak_count *v7;
  unint64_t *p_shared_owners;
  uint64_t v9;
  std::__shared_weak_count *shared_weak_owners;
  unint64_t v11;
  unint64_t *p_shared_weak_owners;
  unint64_t v13;
  unint64_t v14;
  unint64_t *v15;
  unint64_t v16;
  unint64_t v17;
  _QWORD *v18;
  uint64_t v19;
  std::__shared_weak_count *v20;
  unint64_t *v21;
  unint64_t v22;
  uint64_t v23;
  uint64_t *v24;
  NSObject *v25;
  unint64_t *v26;
  unint64_t v27;
  std::__shared_weak_count *v28;
  unint64_t *v29;
  unint64_t v30;
  int64_t v31;
  id v32;
  uint64_t v33;
  std::__shared_weak_count *v34;
  unint64_t *v35;
  unint64_t v36;
  _QWORD v38[7];
  std::__shared_weak_count *v39;
  uint64_t v40;
  std::__shared_weak_count *v41;
  uint64_t v42;
  uint64_t *v43;
  uint64_t v44;
  uint64_t v45;
  uint8_t buf[4];
  const char *v47;
  __int16 v48;
  int v49;
  __int16 v50;
  uint64_t v51;
  uint64_t v52;

  v52 = *MEMORY[0x1E0C80C00];
  v42 = 0;
  v43 = &v42;
  v44 = 0x2020000000;
  v45 = 0;
  v7 = (std::__shared_weak_count *)operator new(0x288uLL);
  v7->__shared_owners_ = 0;
  p_shared_owners = (unint64_t *)&v7->__shared_owners_;
  v7->__shared_weak_owners_ = 0;
  v7->__vftable = (std::__shared_weak_count_vtbl *)&off_1E3BE9CE8;
  ControllerImpl::ControllerImpl((uint64_t)&v7[1], a3, a4);
  v40 = v9;
  v41 = v7;
  shared_weak_owners = (std::__shared_weak_count *)v7[1].__shared_weak_owners_;
  if (shared_weak_owners)
  {
    if (shared_weak_owners->__shared_owners_ != -1)
      goto LABEL_14;
    do
      v11 = __ldxr(p_shared_owners);
    while (__stxr(v11 + 1, p_shared_owners));
    p_shared_weak_owners = (unint64_t *)&v7->__shared_weak_owners_;
    do
      v13 = __ldxr(p_shared_weak_owners);
    while (__stxr(v13 + 1, p_shared_weak_owners));
    v7[1].__shared_owners_ = v9;
    v7[1].__shared_weak_owners_ = (uint64_t)v7;
    std::__shared_weak_count::__release_weak(shared_weak_owners);
  }
  else
  {
    do
      v14 = __ldxr(p_shared_owners);
    while (__stxr(v14 + 1, p_shared_owners));
    v15 = (unint64_t *)&v7->__shared_weak_owners_;
    do
      v16 = __ldxr(v15);
    while (__stxr(v16 + 1, v15));
    v7[1].__shared_owners_ = v9;
    v7[1].__shared_weak_owners_ = (uint64_t)v7;
  }
  do
    v17 = __ldaxr(p_shared_owners);
  while (__stlxr(v17 - 1, p_shared_owners));
  if (!v17)
  {
    ((void (*)(std::__shared_weak_count *))v7->__on_zero_shared)(v7);
    std::__shared_weak_count::__release_weak(v7);
  }
LABEL_14:
  v18 = (_QWORD *)operator new();
  v19 = v40;
  v20 = v41;
  *v18 = v40;
  v18[1] = v20;
  if (v20)
  {
    v21 = (unint64_t *)&v20->__shared_owners_;
    do
      v22 = __ldxr(v21);
    while (__stxr(v22 + 1, v21));
  }
  self->_impl = v18;
  if (*a4)
  {
    v23 = objc_msgSend(*a4, "code");
    v43[3] = v23;
  }
  else
  {
    -[AVVoiceController sessionSetup](self, "sessionSetup");
    -[AVVoiceController configureVoiceTriggerClientCompletionBlocks](self, "configureVoiceTriggerClientCompletionBlocks");
    v38[0] = MEMORY[0x1E0C809B0];
    v38[1] = 3321888768;
    v38[2] = __40__AVVoiceController__bringUp_withError___block_invoke;
    v38[3] = &unk_1E3BEA640;
    v38[6] = v19;
    v39 = v20;
    if (v20)
    {
      v26 = (unint64_t *)&v20->__shared_owners_;
      do
        v27 = __ldxr(v26);
      while (__stxr(v27 + 1, v26));
    }
    v38[4] = self;
    v38[5] = &v42;
    ControllerImpl::safeWorkSync(v19, v38);
    v28 = v39;
    if (v39)
    {
      v29 = (unint64_t *)&v39->__shared_owners_;
      do
        v30 = __ldaxr(v29);
      while (__stlxr(v30 - 1, v29));
      if (!v30)
      {
        ((void (*)(std::__shared_weak_count *))v28->__on_zero_shared)(v28);
        std::__shared_weak_count::__release_weak(v28);
      }
    }
  }
  v24 = v43;
  if (v43[3])
  {
    if (kAVVCScope)
    {
      v25 = *(id *)kAVVCScope;
      if (!v25)
      {
LABEL_36:
        v31 = v24[3];
        goto LABEL_37;
      }
    }
    else
    {
      v25 = MEMORY[0x1E0C81028];
      v32 = MEMORY[0x1E0C81028];
    }
    if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
    {
      v33 = v24[3];
      *(_DWORD *)buf = 136315650;
      v47 = "AVVoiceController.mm";
      v48 = 1024;
      v49 = 1294;
      v50 = 2048;
      v51 = v33;
      _os_log_impl(&dword_19B733000, v25, OS_LOG_TYPE_ERROR, "%25s:%-5d _bringUp: Failed to create ControllerImpl or configureAlerts - error (%ld)", buf, 0x1Cu);
    }

    v24 = v43;
    goto LABEL_36;
  }
  v31 = 0;
LABEL_37:
  v34 = v41;
  if (v41)
  {
    v35 = (unint64_t *)&v41->__shared_owners_;
    do
      v36 = __ldaxr(v35);
    while (__stlxr(v36 - 1, v35));
    if (!v36)
    {
      ((void (*)(std::__shared_weak_count *))v34->__on_zero_shared)(v34);
      std::__shared_weak_count::__release_weak(v34);
    }
  }
  _Block_object_dispose(&v42, 8);
  return v31;
}

- (void)setContext:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  id v8;
  id v9;
  NSObject *v10;
  void *v11;
  void *v12;
  void *v13;
  std::__shared_weak_count *v14;
  unint64_t *v15;
  unint64_t v16;
  int v17;
  char v18;
  __int128 v19;
  __int128 v20;
  _BYTE buf[18];
  __int16 v22;
  AVVoiceController *v23;
  __int16 v24;
  void *v25;
  __int16 v26;
  void *v27;
  _BYTE v28[160];
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v17 = 4134;
  v18 = 1;
  v19 = 0u;
  v20 = 0u;
  kdebug_trace();
  ElapsedTime::ElapsedTime((ElapsedTime *)v28, "-[AVVoiceController setContext:completion:]", 0, 0);
  if (kAVVCScope)
  {
    v8 = *(id *)kAVVCScope;
    if (!v8)
      goto LABEL_8;
  }
  else
  {
    v8 = (id)MEMORY[0x1E0C81028];
    v9 = MEMORY[0x1E0C81028];
  }
  v10 = v8;
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    Get4CCFromInt(objc_msgSend(v6, "activationMode"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "activationDeviceUID");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 136316162;
    *(_QWORD *)&buf[4] = "AVVoiceController.mm";
    *(_WORD *)&buf[12] = 1024;
    *(_DWORD *)&buf[14] = 1304;
    v22 = 2048;
    v23 = self;
    v24 = 2112;
    v25 = v11;
    v26 = 2112;
    v27 = v12;
    _os_log_impl(&dword_19B733000, v10, OS_LOG_TYPE_DEFAULT, "%25s:%-5d #### AVVoiceController[self = %p]: setContext:streamType:completion: activationMode(%@), deviceUID(%@)", buf, 0x30u);

  }
LABEL_8:
  -[AVVoiceController impl](self, "impl");
  if (*(_QWORD *)buf && !self->mClientAPIClutch)
  {
    ControllerImpl::setContext(*(uint64_t *)buf, self, v6, v7);
  }
  else if (v7)
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CB2F90], -11780, 0);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    (*((void (**)(id, _QWORD, _QWORD, void *))v7 + 2))(v7, 0, 0, v13);

  }
  v14 = *(std::__shared_weak_count **)&buf[8];
  if (*(_QWORD *)&buf[8])
  {
    v15 = (unint64_t *)(*(_QWORD *)&buf[8] + 8);
    do
      v16 = __ldaxr(v15);
    while (__stlxr(v16 - 1, v15));
    if (!v16)
    {
      ((void (*)(std::__shared_weak_count *))v14->__on_zero_shared)(v14);
      std::__shared_weak_count::__release_weak(v14);
    }
  }
  ElapsedTime::~ElapsedTime((ElapsedTime *)v28);
  TraceWrapper::~TraceWrapper((TraceWrapper *)&v17);

}

- (unint64_t)setContext:(id)a3 error:(id *)a4
{
  id v6;
  id v7;
  id v8;
  NSObject *v9;
  void *v10;
  void *v11;
  NSObject *v12;
  id v13;
  _BOOL4 mClientAPIClutch;
  unint64_t *p_shared_owners;
  unint64_t v16;
  int v18;
  uint64_t v19;
  std::__shared_weak_count *v20;
  NSObject *v21;
  int v22;
  char v23;
  __int128 v24;
  __int128 v25;
  uint8_t buf[4];
  const char *v27;
  __int16 v28;
  int v29;
  __int16 v30;
  AVVoiceController *v31;
  __int16 v32;
  void *v33;
  __int16 v34;
  void *v35;
  _BYTE v36[160];
  uint64_t v37;

  v37 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v22 = 4134;
  v23 = 1;
  v24 = 0u;
  v25 = 0u;
  kdebug_trace();
  ElapsedTime::ElapsedTime((ElapsedTime *)v36, "-[AVVoiceController setContext:error:]", 0, 0);
  if (kAVVCScope)
  {
    v7 = *(id *)kAVVCScope;
    if (!v7)
      goto LABEL_8;
  }
  else
  {
    v7 = (id)MEMORY[0x1E0C81028];
    v8 = MEMORY[0x1E0C81028];
  }
  v9 = v7;
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    Get4CCFromInt(objc_msgSend(v6, "activationMode"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "activationDeviceUID");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 136316162;
    v27 = "AVVoiceController.mm";
    v28 = 1024;
    v29 = 1318;
    v30 = 2048;
    v31 = self;
    v32 = 2112;
    v33 = v10;
    v34 = 2112;
    v35 = v11;
    _os_log_impl(&dword_19B733000, v9, OS_LOG_TYPE_DEFAULT, "%25s:%-5d #### AVVoiceController[self = %p]: setContext: activationMode(%@), deviceUID(%@)", buf, 0x30u);

  }
LABEL_8:
  v21 = 0;
  -[AVVoiceController impl](self, "impl");
  if (v19 && !self->mClientAPIClutch)
  {
    v18 = ControllerImpl::setContext(v19, self, v6, (uint64_t)&v21, 0);
    if (v18)
    {
      if (a4)
      {
        objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CB2F90], v18, 0);
        *a4 = (id)objc_claimAutoreleasedReturnValue();
      }
      v12 = 0;
      v21 = 0;
    }
    else
    {
      v12 = v21;
    }
  }
  else
  {
    if (kAVVCScope)
    {
      v12 = *(id *)kAVVCScope;
      if (!v12)
        goto LABEL_17;
    }
    else
    {
      v12 = MEMORY[0x1E0C81028];
      v13 = MEMORY[0x1E0C81028];
    }
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      mClientAPIClutch = self->mClientAPIClutch;
      *(_DWORD *)buf = 136315906;
      v27 = "AVVoiceController.mm";
      v28 = 1024;
      v29 = 1320;
      v30 = 2048;
      v31 = (AVVoiceController *)v19;
      v32 = 1024;
      LODWORD(v33) = mClientAPIClutch;
      _os_log_impl(&dword_19B733000, v12, OS_LOG_TYPE_ERROR, "%25s:%-5d Invalid operation. impl(%p) ClientAPIClutch(%d)", buf, 0x22u);
    }

    v12 = 0;
  }
LABEL_17:
  if (v20)
  {
    p_shared_owners = (unint64_t *)&v20->__shared_owners_;
    do
      v16 = __ldaxr(p_shared_owners);
    while (__stlxr(v16 - 1, p_shared_owners));
    if (!v16)
    {
      ((void (*)())v20->__on_zero_shared)();
      std::__shared_weak_count::__release_weak(v20);
    }
  }
  ElapsedTime::~ElapsedTime((ElapsedTime *)v36);
  TraceWrapper::~TraceWrapper((TraceWrapper *)&v22);

  return (unint64_t)v12;
}

- (unint64_t)setContext:(id)a3 streamType:(int64_t *)a4 error:(id *)a5
{
  id v8;
  id v9;
  id v10;
  NSObject *v11;
  void *v12;
  void *v13;
  NSObject *v14;
  id v15;
  _BOOL4 mClientAPIClutch;
  unint64_t *p_shared_owners;
  unint64_t v18;
  int v20;
  uint64_t v21;
  std::__shared_weak_count *v22;
  NSObject *v23;
  int v24;
  char v25;
  __int128 v26;
  __int128 v27;
  uint8_t buf[4];
  const char *v29;
  __int16 v30;
  int v31;
  __int16 v32;
  AVVoiceController *v33;
  __int16 v34;
  void *v35;
  __int16 v36;
  void *v37;
  _BYTE v38[160];
  uint64_t v39;

  v39 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v24 = 4134;
  v25 = 1;
  v26 = 0u;
  v27 = 0u;
  kdebug_trace();
  ElapsedTime::ElapsedTime((ElapsedTime *)v38, "-[AVVoiceController setContext:streamType:error:]", 0, 0);
  if (kAVVCScope)
  {
    v9 = *(id *)kAVVCScope;
    if (!v9)
      goto LABEL_8;
  }
  else
  {
    v9 = (id)MEMORY[0x1E0C81028];
    v10 = MEMORY[0x1E0C81028];
  }
  v11 = v9;
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    Get4CCFromInt(objc_msgSend(v8, "activationMode"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "activationDeviceUID");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 136316162;
    v29 = "AVVoiceController.mm";
    v30 = 1024;
    v31 = 1335;
    v32 = 2048;
    v33 = self;
    v34 = 2112;
    v35 = v12;
    v36 = 2112;
    v37 = v13;
    _os_log_impl(&dword_19B733000, v11, OS_LOG_TYPE_DEFAULT, "%25s:%-5d #### AVVoiceController[self = %p]: setContext: activationMode(%@), deviceUID(%@)", buf, 0x30u);

  }
LABEL_8:
  v23 = 0;
  -[AVVoiceController impl](self, "impl");
  if (v21 && !self->mClientAPIClutch)
  {
    v20 = ControllerImpl::setContext(v21, self, v8, (uint64_t)&v23, (uint64_t)a4);
    if (v20)
    {
      if (a5)
      {
        objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CB2F90], v20, 0);
        *a5 = (id)objc_claimAutoreleasedReturnValue();
      }
      v14 = 0;
      v23 = 0;
    }
    else
    {
      v14 = v23;
    }
  }
  else
  {
    if (kAVVCScope)
    {
      v14 = *(id *)kAVVCScope;
      if (!v14)
        goto LABEL_17;
    }
    else
    {
      v14 = MEMORY[0x1E0C81028];
      v15 = MEMORY[0x1E0C81028];
    }
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      mClientAPIClutch = self->mClientAPIClutch;
      *(_DWORD *)buf = 136315906;
      v29 = "AVVoiceController.mm";
      v30 = 1024;
      v31 = 1337;
      v32 = 2048;
      v33 = (AVVoiceController *)v21;
      v34 = 1024;
      LODWORD(v35) = mClientAPIClutch;
      _os_log_impl(&dword_19B733000, v14, OS_LOG_TYPE_ERROR, "%25s:%-5d Invalid operation. impl(%p) ClientAPIClutch(%d)", buf, 0x22u);
    }

    v14 = 0;
  }
LABEL_17:
  if (v22)
  {
    p_shared_owners = (unint64_t *)&v22->__shared_owners_;
    do
      v18 = __ldaxr(p_shared_owners);
    while (__stlxr(v18 - 1, p_shared_owners));
    if (!v18)
    {
      ((void (*)())v22->__on_zero_shared)();
      std::__shared_weak_count::__release_weak(v22);
    }
  }
  ElapsedTime::~ElapsedTime((ElapsedTime *)v38);
  TraceWrapper::~TraceWrapper((TraceWrapper *)&v24);

  return (unint64_t)v14;
}

- (void)prepareRecordForStream:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  id v8;
  id v9;
  NSObject *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  void *v16;
  std::__shared_weak_count *v17;
  unint64_t *v18;
  unint64_t v19;
  int v20;
  char v21;
  __int128 v22;
  __int128 v23;
  _BYTE buf[18];
  __int16 v25;
  AVVoiceController *v26;
  __int16 v27;
  uint64_t v28;
  __int16 v29;
  uint64_t v30;
  __int16 v31;
  void *v32;
  _BYTE v33[160];
  uint64_t v34;

  v34 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v20 = 4135;
  v21 = 1;
  v22 = 0u;
  v23 = 0u;
  kdebug_trace();
  ElapsedTime::ElapsedTime((ElapsedTime *)v33, "-[AVVoiceController prepareRecordForStream:completion:]", 0, 0);
  if (kAVVCScope)
  {
    v8 = *(id *)kAVVCScope;
    if (!v8)
      goto LABEL_8;
  }
  else
  {
    v8 = (id)MEMORY[0x1E0C81028];
    v9 = MEMORY[0x1E0C81028];
  }
  v10 = v8;
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    v11 = objc_msgSend(v6, "streamID");
    objc_msgSend(v6, "recordBufferDuration");
    v13 = v12;
    objc_msgSend(v6, "avAudioSettings");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 136316418;
    *(_QWORD *)&buf[4] = "AVVoiceController.mm";
    *(_WORD *)&buf[12] = 1024;
    *(_DWORD *)&buf[14] = 1351;
    v25 = 2048;
    v26 = self;
    v27 = 2048;
    v28 = v11;
    v29 = 2048;
    v30 = v13;
    v31 = 2112;
    v32 = v14;
    _os_log_impl(&dword_19B733000, v10, OS_LOG_TYPE_DEFAULT, "%25s:%-5d !! DEPRECATED !! #### AVVoiceController[self = %p]: prepareRecordForStream: streamHandle(%lu), bufferDuration(%f), settings: %@", buf, 0x3Au);

  }
LABEL_8:
  -[AVVoiceController impl](self, "impl");
  if (*(_QWORD *)buf && !self->mClientAPIClutch)
  {
    ControllerImpl::prepareRecordForStream(*(uint64_t *)buf, v6, v7);
  }
  else if (v7)
  {
    v15 = objc_msgSend(v6, "streamID");
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CB2F90], -11780, 0);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    (*((void (**)(id, uint64_t, _QWORD, void *))v7 + 2))(v7, v15, 0, v16);

  }
  v17 = *(std::__shared_weak_count **)&buf[8];
  if (*(_QWORD *)&buf[8])
  {
    v18 = (unint64_t *)(*(_QWORD *)&buf[8] + 8);
    do
      v19 = __ldaxr(v18);
    while (__stlxr(v19 - 1, v18));
    if (!v19)
    {
      ((void (*)(std::__shared_weak_count *))v17->__on_zero_shared)(v17);
      std::__shared_weak_count::__release_weak(v17);
    }
  }
  ElapsedTime::~ElapsedTime((ElapsedTime *)v33);
  TraceWrapper::~TraceWrapper((TraceWrapper *)&v20);

}

- (BOOL)prepareRecordForStream:(id)a3 error:(id *)a4
{
  AVVCPrepareRecordSettings *v6;
  id v7;
  id v8;
  NSObject *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  NSObject *v14;
  id v15;
  _BOOL4 mClientAPIClutch;
  BOOL v17;
  unint64_t *p_shared_owners;
  unint64_t v19;
  int v21;
  ControllerImpl *v22;
  std::__shared_weak_count *v23;
  int v24;
  char v25;
  __int128 v26;
  __int128 v27;
  uint8_t buf[4];
  const char *v29;
  __int16 v30;
  int v31;
  __int16 v32;
  AVVoiceController *v33;
  __int16 v34;
  uint64_t v35;
  __int16 v36;
  uint64_t v37;
  __int16 v38;
  void *v39;
  _BYTE v40[160];
  uint64_t v41;

  v41 = *MEMORY[0x1E0C80C00];
  v6 = (AVVCPrepareRecordSettings *)a3;
  v24 = 4135;
  v25 = 1;
  v26 = 0u;
  v27 = 0u;
  kdebug_trace();
  ElapsedTime::ElapsedTime((ElapsedTime *)v40, "-[AVVoiceController prepareRecordForStream:error:]", 0, 0);
  if (kAVVCScope)
  {
    v7 = *(id *)kAVVCScope;
    if (!v7)
      goto LABEL_8;
  }
  else
  {
    v7 = (id)MEMORY[0x1E0C81028];
    v8 = MEMORY[0x1E0C81028];
  }
  v9 = v7;
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    v10 = -[AVVCPrepareRecordSettings streamID](v6, "streamID");
    -[AVVCPrepareRecordSettings recordBufferDuration](v6, "recordBufferDuration");
    v12 = v11;
    -[AVVCPrepareRecordSettings avAudioSettings](v6, "avAudioSettings");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 136316418;
    v29 = "AVVoiceController.mm";
    v30 = 1024;
    v31 = 1364;
    v32 = 2048;
    v33 = self;
    v34 = 2048;
    v35 = v10;
    v36 = 2048;
    v37 = v12;
    v38 = 2112;
    v39 = v13;
    _os_log_impl(&dword_19B733000, v9, OS_LOG_TYPE_DEFAULT, "%25s:%-5d #### AVVoiceController[self = %p]: prepareRecordForStream: streamHandle(%lu), bufferDuration(%f), settings: %@", buf, 0x3Au);

  }
LABEL_8:
  -[AVVoiceController impl](self, "impl");
  if (!v22 || self->mClientAPIClutch)
  {
    if (kAVVCScope)
    {
      v14 = *(id *)kAVVCScope;
      if (!v14)
      {
LABEL_17:
        v17 = 0;
        goto LABEL_18;
      }
    }
    else
    {
      v14 = MEMORY[0x1E0C81028];
      v15 = MEMORY[0x1E0C81028];
    }
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      mClientAPIClutch = self->mClientAPIClutch;
      *(_DWORD *)buf = 136315906;
      v29 = "AVVoiceController.mm";
      v30 = 1024;
      v31 = 1366;
      v32 = 2048;
      v33 = (AVVoiceController *)v22;
      v34 = 1024;
      LODWORD(v35) = mClientAPIClutch;
      _os_log_impl(&dword_19B733000, v14, OS_LOG_TYPE_ERROR, "%25s:%-5d Invalid operation. impl(%p) ClientAPIClutch(%d)", buf, 0x22u);
    }

    goto LABEL_17;
  }
  v21 = ControllerImpl::prepareRecordForStream(v22, self, v6);
  v17 = v21 == 0;
  if (a4 && v21)
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CB2F90], v21, 0);
    v17 = 0;
    *a4 = (id)objc_claimAutoreleasedReturnValue();
  }
LABEL_18:
  if (v23)
  {
    p_shared_owners = (unint64_t *)&v23->__shared_owners_;
    do
      v19 = __ldaxr(p_shared_owners);
    while (__stlxr(v19 - 1, p_shared_owners));
    if (!v19)
    {
      ((void (*)())v23->__on_zero_shared)();
      std::__shared_weak_count::__release_weak(v23);
    }
  }
  ElapsedTime::~ElapsedTime((ElapsedTime *)v40);
  TraceWrapper::~TraceWrapper((TraceWrapper *)&v24);

  return v17;
}

- (void)startRecordWithSettings:(id)a3 completion:(id)a4 alertCompletion:(id)a5 audioCallback:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  id v14;
  id v15;
  NSObject *v16;
  uint64_t v17;
  void *v18;
  std::__shared_weak_count *v19;
  unint64_t *v20;
  unint64_t v21;
  int v22;
  char v23;
  __int128 v24;
  __int128 v25;
  _BYTE buf[18];
  __int16 v27;
  AVVoiceController *v28;
  __int16 v29;
  uint64_t v30;
  __int16 v31;
  uint64_t v32;
  __int16 v33;
  int v34;
  __int16 v35;
  int v36;
  __int16 v37;
  int v38;
  _BYTE v39[160];
  uint64_t v40;

  v40 = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  v22 = 4136;
  v23 = 1;
  v24 = 0u;
  v25 = 0u;
  kdebug_trace();
  ElapsedTime::ElapsedTime((ElapsedTime *)v39, "-[AVVoiceController startRecordWithSettings:completion:alertCompletion:audioCallback:]", 0, 0);
  if (kAVVCScope)
  {
    v14 = *(id *)kAVVCScope;
    if (!v14)
      goto LABEL_8;
  }
  else
  {
    v14 = (id)MEMORY[0x1E0C81028];
    v15 = MEMORY[0x1E0C81028];
  }
  v16 = v14;
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136316930;
    *(_QWORD *)&buf[4] = "AVVoiceController.mm";
    *(_WORD *)&buf[12] = 1024;
    *(_DWORD *)&buf[14] = 1381;
    v27 = 2048;
    v28 = self;
    v29 = 2048;
    v30 = objc_msgSend(v10, "streamID");
    v31 = 2048;
    v32 = objc_msgSend(v10, "startHostTime");
    v33 = 1024;
    v34 = objc_msgSend(v10, "startAlert");
    v35 = 1024;
    v36 = objc_msgSend(v10, "stopAlert");
    v37 = 1024;
    v38 = objc_msgSend(v10, "stopOnErrorAlert");
    _os_log_impl(&dword_19B733000, v16, OS_LOG_TYPE_DEFAULT, "%25s:%-5d !! DEPRECATED !! #### AVVoiceController[self = %p]: startRecordWithSettings:completion:alertCompletion:audioCallback: streamHandle(%lu), startTime(%llu). AlertsOverride(%d,%d,%d)", buf, 0x42u);
  }

LABEL_8:
  -[AVVoiceController impl](self, "impl");
  if (*(_QWORD *)buf && !self->mClientAPIClutch)
  {
    ControllerImpl::startRecordForStream(*(uint64_t *)buf, self, v10, v11, v12, v13);
  }
  else if (v11)
  {
    v17 = objc_msgSend(v10, "streamID");
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CB2F90], -11780, 0);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    (*((void (**)(id, uint64_t, _QWORD, _QWORD, void *))v11 + 2))(v11, v17, 0, 0, v18);

  }
  v19 = *(std::__shared_weak_count **)&buf[8];
  if (*(_QWORD *)&buf[8])
  {
    v20 = (unint64_t *)(*(_QWORD *)&buf[8] + 8);
    do
      v21 = __ldaxr(v20);
    while (__stlxr(v21 - 1, v20));
    if (!v21)
    {
      ((void (*)(std::__shared_weak_count *))v19->__on_zero_shared)(v19);
      std::__shared_weak_count::__release_weak(v19);
    }
  }
  ElapsedTime::~ElapsedTime((ElapsedTime *)v39);
  TraceWrapper::~TraceWrapper((TraceWrapper *)&v22);

}

- (void)startRecordForStream:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  id v8;
  id v9;
  NSObject *v10;
  uint64_t v11;
  uint64_t v12;
  int v13;
  int v14;
  int v15;
  int v16;
  const char *v17;
  uint64_t v18;
  void *v19;
  std::__shared_weak_count *v20;
  unint64_t *v21;
  unint64_t v22;
  int v23;
  char v24;
  __int128 v25;
  __int128 v26;
  _BYTE buf[18];
  __int16 v28;
  AVVoiceController *v29;
  __int16 v30;
  uint64_t v31;
  __int16 v32;
  uint64_t v33;
  __int16 v34;
  int v35;
  __int16 v36;
  int v37;
  __int16 v38;
  int v39;
  __int16 v40;
  const char *v41;
  _BYTE v42[160];
  uint64_t v43;

  v43 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v23 = 4136;
  v24 = 1;
  v25 = 0u;
  v26 = 0u;
  kdebug_trace();
  ElapsedTime::ElapsedTime((ElapsedTime *)v42, "-[AVVoiceController startRecordForStream:completion:]", 0, 0);
  if (kAVVCScope)
  {
    v8 = *(id *)kAVVCScope;
    if (!v8)
      goto LABEL_10;
  }
  else
  {
    v8 = (id)MEMORY[0x1E0C81028];
    v9 = MEMORY[0x1E0C81028];
  }
  v10 = v8;
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    v11 = objc_msgSend(v6, "streamID");
    v12 = objc_msgSend(v6, "startHostTime");
    v13 = objc_msgSend(v6, "startAlert");
    v14 = objc_msgSend(v6, "stopAlert");
    v15 = objc_msgSend(v6, "stopOnErrorAlert");
    v16 = objc_msgSend(v6, "skipAlert");
    v17 = " will NOT skip alert";
    *(_DWORD *)buf = 136317186;
    *(_QWORD *)&buf[4] = "AVVoiceController.mm";
    *(_DWORD *)&buf[14] = 1395;
    *(_WORD *)&buf[12] = 1024;
    if (v16)
      v17 = " will skip alert";
    v28 = 2048;
    v29 = self;
    v30 = 2048;
    v31 = v11;
    v32 = 2048;
    v33 = v12;
    v34 = 1024;
    v35 = v13;
    v36 = 1024;
    v37 = v14;
    v38 = 1024;
    v39 = v15;
    v40 = 2080;
    v41 = v17;
    _os_log_impl(&dword_19B733000, v10, OS_LOG_TYPE_DEFAULT, "%25s:%-5d #### AVVoiceController[self = %p]: startRecordForStream:completion: streamHandle(%lu), startTime(%llu). AlertsOverride(%d,%d,%d,%s)", buf, 0x4Cu);
  }

LABEL_10:
  -[AVVoiceController impl](self, "impl");
  if (*(_QWORD *)buf && !self->mClientAPIClutch)
  {
    ControllerImpl::startRecordForStream(*(uint64_t *)buf, self, v6, v7);
  }
  else if (v7)
  {
    v18 = objc_msgSend(v6, "streamID");
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CB2F90], -11780, 0);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    (*((void (**)(id, uint64_t, _QWORD, _QWORD, void *))v7 + 2))(v7, v18, 0, 0, v19);

  }
  v20 = *(std::__shared_weak_count **)&buf[8];
  if (*(_QWORD *)&buf[8])
  {
    v21 = (unint64_t *)(*(_QWORD *)&buf[8] + 8);
    do
      v22 = __ldaxr(v21);
    while (__stlxr(v22 - 1, v21));
    if (!v22)
    {
      ((void (*)(std::__shared_weak_count *))v20->__on_zero_shared)(v20);
      std::__shared_weak_count::__release_weak(v20);
    }
  }
  ElapsedTime::~ElapsedTime((ElapsedTime *)v42);
  TraceWrapper::~TraceWrapper((TraceWrapper *)&v23);

}

- (BOOL)startRecordForStream:(id)a3 error:(id *)a4
{
  AVVCStartRecordSettings *v6;
  id v7;
  id v8;
  NSObject *v9;
  uint64_t v10;
  uint64_t v11;
  int v12;
  int v13;
  int v14;
  _BOOL4 v15;
  const char *v16;
  NSObject *v17;
  id v18;
  _BOOL4 mClientAPIClutch;
  BOOL v20;
  int started;
  unint64_t *p_shared_owners;
  unint64_t v23;
  ControllerImpl *v25;
  std::__shared_weak_count *v26;
  uint8_t buf[4];
  const char *v28;
  __int16 v29;
  int v30;
  __int16 v31;
  AVVoiceController *v32;
  __int16 v33;
  uint64_t v34;
  __int16 v35;
  uint64_t v36;
  __int16 v37;
  int v38;
  __int16 v39;
  int v40;
  __int16 v41;
  int v42;
  __int16 v43;
  const char *v44;
  _BYTE v45[160];
  uint64_t v46;

  v46 = *MEMORY[0x1E0C80C00];
  v6 = (AVVCStartRecordSettings *)a3;
  kdebug_trace();
  ElapsedTime::ElapsedTime((ElapsedTime *)v45, "-[AVVoiceController startRecordForStream:error:]", 0, 0);
  if (kAVVCScope)
  {
    v7 = *(id *)kAVVCScope;
    if (!v7)
      goto LABEL_10;
  }
  else
  {
    v7 = (id)MEMORY[0x1E0C81028];
    v8 = MEMORY[0x1E0C81028];
  }
  v9 = v7;
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    v10 = -[AVVCStartRecordSettings streamID](v6, "streamID");
    v11 = -[AVVCStartRecordSettings startHostTime](v6, "startHostTime");
    v12 = -[AVVCStartRecordSettings startAlert](v6, "startAlert");
    v13 = -[AVVCStartRecordSettings stopAlert](v6, "stopAlert");
    v14 = -[AVVCStartRecordSettings stopOnErrorAlert](v6, "stopOnErrorAlert");
    v15 = -[AVVCStartRecordSettings skipAlert](v6, "skipAlert");
    v16 = " will NOT skip alert";
    *(_DWORD *)buf = 136317186;
    v28 = "AVVoiceController.mm";
    v30 = 1409;
    v29 = 1024;
    if (v15)
      v16 = " will skip alert";
    v31 = 2048;
    v32 = self;
    v33 = 2048;
    v34 = v10;
    v35 = 2048;
    v36 = v11;
    v37 = 1024;
    v38 = v12;
    v39 = 1024;
    v40 = v13;
    v41 = 1024;
    v42 = v14;
    v43 = 2080;
    v44 = v16;
    _os_log_impl(&dword_19B733000, v9, OS_LOG_TYPE_DEFAULT, "%25s:%-5d #### AVVoiceController[self = %p]: startRecordForStream: streamHandle(%lu), startTime(%llu). AlertsOverride(%d,%d,%d,%s)", buf, 0x4Cu);
  }

LABEL_10:
  -[AVVoiceController impl](self, "impl");
  if (!v25 || self->mClientAPIClutch)
  {
    if (kAVVCScope)
    {
      v17 = *(id *)kAVVCScope;
      if (!v17)
      {
LABEL_19:
        v20 = 0;
        goto LABEL_24;
      }
    }
    else
    {
      v17 = MEMORY[0x1E0C81028];
      v18 = MEMORY[0x1E0C81028];
    }
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
    {
      mClientAPIClutch = self->mClientAPIClutch;
      *(_DWORD *)buf = 136315906;
      v28 = "AVVoiceController.mm";
      v29 = 1024;
      v30 = 1411;
      v31 = 2048;
      v32 = (AVVoiceController *)v25;
      v33 = 1024;
      LODWORD(v34) = mClientAPIClutch;
      _os_log_impl(&dword_19B733000, v17, OS_LOG_TYPE_ERROR, "%25s:%-5d Invalid operation. impl(%p) ClientAPIClutch(%d)", buf, 0x22u);
    }

    goto LABEL_19;
  }
  started = ControllerImpl::startRecordForStream(v25, self, v6);
  v20 = started == 0;
  if (a4 && started)
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CB2F90], started, 0);
    *a4 = (id)objc_claimAutoreleasedReturnValue();
  }
  kdebug_trace();
LABEL_24:
  if (v26)
  {
    p_shared_owners = (unint64_t *)&v26->__shared_owners_;
    do
      v23 = __ldaxr(p_shared_owners);
    while (__stlxr(v23 - 1, p_shared_owners));
    if (!v23)
    {
      ((void (*)())v26->__on_zero_shared)();
      std::__shared_weak_count::__release_weak(v26);
    }
  }
  ElapsedTime::~ElapsedTime((ElapsedTime *)v45);

  return v20;
}

- (void)configureAlertBehaviorForStream:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  id v8;
  id v9;
  NSObject *v10;
  void *v11;
  std::__shared_weak_count *v12;
  unint64_t *v13;
  unint64_t v14;
  int v15;
  char v16;
  __int128 v17;
  __int128 v18;
  _BYTE buf[18];
  __int16 v20;
  AVVoiceController *v21;
  __int16 v22;
  uint64_t v23;
  __int16 v24;
  int v25;
  __int16 v26;
  int v27;
  __int16 v28;
  int v29;
  _BYTE v30[160];
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v15 = 4147;
  v16 = 1;
  v17 = 0u;
  v18 = 0u;
  kdebug_trace();
  ElapsedTime::ElapsedTime((ElapsedTime *)v30, "-[AVVoiceController configureAlertBehaviorForStream:completion:]", 0, 0);
  if (kAVVCScope)
  {
    v8 = *(id *)kAVVCScope;
    if (!v8)
      goto LABEL_8;
  }
  else
  {
    v8 = (id)MEMORY[0x1E0C81028];
    v9 = MEMORY[0x1E0C81028];
  }
  v10 = v8;
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136316674;
    *(_QWORD *)&buf[4] = "AVVoiceController.mm";
    *(_WORD *)&buf[12] = 1024;
    *(_DWORD *)&buf[14] = 1427;
    v20 = 2048;
    v21 = self;
    v22 = 2048;
    v23 = objc_msgSend(v6, "streamID");
    v24 = 1024;
    v25 = objc_msgSend(v6, "startAlert");
    v26 = 1024;
    v27 = objc_msgSend(v6, "stopAlert");
    v28 = 1024;
    v29 = objc_msgSend(v6, "stopOnErrorAlert");
    _os_log_impl(&dword_19B733000, v10, OS_LOG_TYPE_DEFAULT, "%25s:%-5d #### AVVoiceController[self = %p]: configureAlertBehaviorForStream:completion: streamHandle(%lu), AlertsOverride(%d,%d,%d)", buf, 0x38u);
  }

LABEL_8:
  -[AVVoiceController impl](self, "impl");
  if (*(_QWORD *)buf && !self->mClientAPIClutch)
  {
    ControllerImpl::configureAlertBehaviorForStream(*(uint64_t *)buf, self, v6, v7);
  }
  else if (v7)
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CB2F90], -11780, 0);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    (*((void (**)(id, void *))v7 + 2))(v7, v11);

  }
  v12 = *(std::__shared_weak_count **)&buf[8];
  if (*(_QWORD *)&buf[8])
  {
    v13 = (unint64_t *)(*(_QWORD *)&buf[8] + 8);
    do
      v14 = __ldaxr(v13);
    while (__stlxr(v14 - 1, v13));
    if (!v14)
    {
      ((void (*)(std::__shared_weak_count *))v12->__on_zero_shared)(v12);
      std::__shared_weak_count::__release_weak(v12);
    }
  }
  ElapsedTime::~ElapsedTime((ElapsedTime *)v30);
  TraceWrapper::~TraceWrapper((TraceWrapper *)&v15);

}

- (BOOL)configureAlertBehaviorForStream:(id)a3 error:(id *)a4
{
  AVVCConfigureAlertBehaviorSettings *v6;
  id v7;
  id v8;
  NSObject *v9;
  NSObject *v10;
  id v11;
  _BOOL4 mClientAPIClutch;
  BOOL v13;
  unint64_t *p_shared_owners;
  unint64_t v15;
  int v17;
  ControllerImpl *v18;
  std::__shared_weak_count *v19;
  int v20;
  char v21;
  __int128 v22;
  __int128 v23;
  uint8_t buf[4];
  const char *v25;
  __int16 v26;
  int v27;
  __int16 v28;
  AVVoiceController *v29;
  __int16 v30;
  uint64_t v31;
  __int16 v32;
  int v33;
  __int16 v34;
  int v35;
  __int16 v36;
  int v37;
  _BYTE v38[160];
  uint64_t v39;

  v39 = *MEMORY[0x1E0C80C00];
  v6 = (AVVCConfigureAlertBehaviorSettings *)a3;
  v20 = 4147;
  v21 = 1;
  v22 = 0u;
  v23 = 0u;
  kdebug_trace();
  ElapsedTime::ElapsedTime((ElapsedTime *)v38, "-[AVVoiceController configureAlertBehaviorForStream:error:]", 0, 0);
  if (kAVVCScope)
  {
    v7 = *(id *)kAVVCScope;
    if (!v7)
      goto LABEL_8;
  }
  else
  {
    v7 = (id)MEMORY[0x1E0C81028];
    v8 = MEMORY[0x1E0C81028];
  }
  v9 = v7;
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136316674;
    v25 = "AVVoiceController.mm";
    v26 = 1024;
    v27 = 1441;
    v28 = 2048;
    v29 = self;
    v30 = 2048;
    v31 = -[AVVCConfigureAlertBehaviorSettings streamID](v6, "streamID");
    v32 = 1024;
    v33 = -[AVVCConfigureAlertBehaviorSettings startAlert](v6, "startAlert");
    v34 = 1024;
    v35 = -[AVVCConfigureAlertBehaviorSettings stopAlert](v6, "stopAlert");
    v36 = 1024;
    v37 = -[AVVCConfigureAlertBehaviorSettings stopOnErrorAlert](v6, "stopOnErrorAlert");
    _os_log_impl(&dword_19B733000, v9, OS_LOG_TYPE_DEFAULT, "%25s:%-5d #### AVVoiceController[self = %p]: configureAlertBehaviorForStream: streamHandle(%lu), AlertsOverride(%d,%d,%d)", buf, 0x38u);
  }

LABEL_8:
  -[AVVoiceController impl](self, "impl");
  if (!v18 || self->mClientAPIClutch)
  {
    if (kAVVCScope)
    {
      v10 = *(id *)kAVVCScope;
      if (!v10)
      {
LABEL_17:
        v13 = 0;
        goto LABEL_18;
      }
    }
    else
    {
      v10 = MEMORY[0x1E0C81028];
      v11 = MEMORY[0x1E0C81028];
    }
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      mClientAPIClutch = self->mClientAPIClutch;
      *(_DWORD *)buf = 136315906;
      v25 = "AVVoiceController.mm";
      v26 = 1024;
      v27 = 1443;
      v28 = 2048;
      v29 = (AVVoiceController *)v18;
      v30 = 1024;
      LODWORD(v31) = mClientAPIClutch;
      _os_log_impl(&dword_19B733000, v10, OS_LOG_TYPE_ERROR, "%25s:%-5d Invalid operation. impl(%p) ClientAPIClutch(%d)", buf, 0x22u);
    }

    goto LABEL_17;
  }
  v17 = ControllerImpl::configureAlertBehaviorForStream(v18, self, v6);
  v13 = v17 == 0;
  if (a4 && v17)
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CB2F90], v17, 0);
    v13 = 0;
    *a4 = (id)objc_claimAutoreleasedReturnValue();
  }
LABEL_18:
  if (v19)
  {
    p_shared_owners = (unint64_t *)&v19->__shared_owners_;
    do
      v15 = __ldaxr(p_shared_owners);
    while (__stlxr(v15 - 1, p_shared_owners));
    if (!v15)
    {
      ((void (*)())v19->__on_zero_shared)();
      std::__shared_weak_count::__release_weak(v19);
    }
  }
  ElapsedTime::~ElapsedTime((ElapsedTime *)v38);
  TraceWrapper::~TraceWrapper((TraceWrapper *)&v20);

  return v13;
}

- (void)stopRecordForStream:(unint64_t)a3 completion:(id)a4
{
  id v6;
  NSObject *v7;
  id v8;
  void *v9;
  std::__shared_weak_count *v10;
  unint64_t *v11;
  unint64_t v12;
  int v13;
  char v14;
  __int128 v15;
  __int128 v16;
  _BYTE buf[18];
  __int16 v18;
  AVVoiceController *v19;
  __int16 v20;
  unint64_t v21;
  _BYTE v22[160];
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v6 = a4;
  v13 = 4137;
  v14 = 1;
  v15 = 0u;
  v16 = 0u;
  kdebug_trace();
  ElapsedTime::ElapsedTime((ElapsedTime *)v22, "-[AVVoiceController stopRecordForStream:completion:]", 0, 0);
  if (kAVVCScope)
  {
    v7 = *(id *)kAVVCScope;
    if (!v7)
      goto LABEL_8;
  }
  else
  {
    v7 = MEMORY[0x1E0C81028];
    v8 = MEMORY[0x1E0C81028];
  }
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315906;
    *(_QWORD *)&buf[4] = "AVVoiceController.mm";
    *(_WORD *)&buf[12] = 1024;
    *(_DWORD *)&buf[14] = 1458;
    v18 = 2048;
    v19 = self;
    v20 = 2048;
    v21 = a3;
    _os_log_impl(&dword_19B733000, v7, OS_LOG_TYPE_DEFAULT, "%25s:%-5d !! DEPRECATED !! #### AVVoiceController[self = %p]: stopRecordForStream: streamHandle(%lu)", buf, 0x26u);
  }

LABEL_8:
  -[AVVoiceController impl](self, "impl");
  if (*(_QWORD *)buf && !self->mClientAPIClutch)
  {
    ControllerImpl::stopRecordForStream(*(uint64_t *)buf, self, a3, v6);
  }
  else if (v6)
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CB2F90], -11780, 0);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    (*((void (**)(id, unint64_t, _QWORD, _QWORD, void *))v6 + 2))(v6, a3, 0, 0, v9);

  }
  v10 = *(std::__shared_weak_count **)&buf[8];
  if (*(_QWORD *)&buf[8])
  {
    v11 = (unint64_t *)(*(_QWORD *)&buf[8] + 8);
    do
      v12 = __ldaxr(v11);
    while (__stlxr(v12 - 1, v11));
    if (!v12)
    {
      ((void (*)(std::__shared_weak_count *))v10->__on_zero_shared)(v10);
      std::__shared_weak_count::__release_weak(v10);
    }
  }
  ElapsedTime::~ElapsedTime((ElapsedTime *)v22);
  TraceWrapper::~TraceWrapper((TraceWrapper *)&v13);

}

- (BOOL)stopRecordForStream:(unint64_t)a3 error:(id *)a4
{
  NSObject *v7;
  id v8;
  NSObject *v9;
  id v10;
  _BOOL4 mClientAPIClutch;
  BOOL v12;
  int v13;
  int v14;
  NSObject *v15;
  NSObject *v16;
  unint64_t *p_shared_owners;
  unint64_t v18;
  ControllerImpl *v20;
  std::__shared_weak_count *v21;
  uint8_t buf[4];
  const char *v23;
  __int16 v24;
  int v25;
  __int16 v26;
  unint64_t v27;
  __int16 v28;
  unint64_t v29;
  _BYTE v30[160];
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  kdebug_trace();
  ElapsedTime::ElapsedTime((ElapsedTime *)v30, "-[AVVoiceController stopRecordForStream:error:]", 0, 0);
  if (kAVVCScope)
  {
    v7 = *(id *)kAVVCScope;
    if (!v7)
      goto LABEL_8;
  }
  else
  {
    v7 = MEMORY[0x1E0C81028];
    v8 = MEMORY[0x1E0C81028];
  }
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315906;
    v23 = "AVVoiceController.mm";
    v24 = 1024;
    v25 = 1471;
    v26 = 2048;
    v27 = (unint64_t)self;
    v28 = 2048;
    v29 = a3;
    _os_log_impl(&dword_19B733000, v7, OS_LOG_TYPE_DEFAULT, "%25s:%-5d #### AVVoiceController[self = %p]: stopRecordForStream: streamHandle(%lu)", buf, 0x26u);
  }

LABEL_8:
  -[AVVoiceController impl](self, "impl");
  if (!v20 || self->mClientAPIClutch)
  {
    if (kAVVCScope)
    {
      v9 = *(id *)kAVVCScope;
      if (!v9)
      {
LABEL_17:
        v12 = 0;
        goto LABEL_32;
      }
    }
    else
    {
      v9 = MEMORY[0x1E0C81028];
      v10 = MEMORY[0x1E0C81028];
    }
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      mClientAPIClutch = self->mClientAPIClutch;
      *(_DWORD *)buf = 136315906;
      v23 = "AVVoiceController.mm";
      v24 = 1024;
      v25 = 1473;
      v26 = 2048;
      v27 = (unint64_t)v20;
      v28 = 1024;
      LODWORD(v29) = mClientAPIClutch;
      _os_log_impl(&dword_19B733000, v9, OS_LOG_TYPE_ERROR, "%25s:%-5d Invalid operation. impl(%p) ClientAPIClutch(%d)", buf, 0x22u);
    }

    goto LABEL_17;
  }
  v13 = ControllerImpl::stopRecordForStream(v20, self, a3);
  v14 = v13;
  if (v13)
  {
    v12 = v13 != -11781 && v13 != -11793;
    if (v13 != -11793 && v13 != -11781 && v13 != -308)
    {
      v15 = *(NSObject **)kAVVCScope;
      CALog::Scope::oslog(*(id *)kAVVCScope);
      v16 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_FAULT))
      {
        *(_DWORD *)buf = 136315650;
        v23 = "-[AVVoiceController stopRecordForStream:error:]";
        v24 = 1024;
        v25 = v14;
        v26 = 2048;
        v27 = a3;
        _os_log_fault_impl(&dword_19B733000, v15, OS_LOG_TYPE_FAULT, "%s unexpected error (%d) returned from stopRecordForStream for streamHandle(%lu)", buf, 0x1Cu);
      }

    }
    if (a4)
    {
      objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CB2F90], v14, 0);
      *a4 = (id)objc_claimAutoreleasedReturnValue();
    }
  }
  else
  {
    v12 = 1;
  }
  kdebug_trace();
LABEL_32:
  if (v21)
  {
    p_shared_owners = (unint64_t *)&v21->__shared_owners_;
    do
      v18 = __ldaxr(p_shared_owners);
    while (__stlxr(v18 - 1, p_shared_owners));
    if (!v18)
    {
      ((void (*)())v21->__on_zero_shared)();
      std::__shared_weak_count::__release_weak(v21);
    }
  }
  ElapsedTime::~ElapsedTime((ElapsedTime *)v30);
  return v12;
}

- (int64_t)getCurrentStreamState:(unint64_t)a3
{
  NSObject *v5;
  unint64_t CurrentStreamStateForStream;
  id v7;
  _BOOL4 mClientAPIClutch;
  unint64_t *p_shared_owners;
  unint64_t v10;
  id v12;
  const char *v13;
  ControllerImpl *v14;
  std::__shared_weak_count *v15;
  uint8_t buf[4];
  const char *v17;
  __int16 v18;
  int v19;
  __int16 v20;
  AVVoiceController *v21;
  __int16 v22;
  unint64_t v23;
  __int16 v24;
  const char *v25;
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  -[AVVoiceController impl](self, "impl");
  if (v14 && !self->mClientAPIClutch)
  {
    CurrentStreamStateForStream = ControllerImpl::getCurrentStreamStateForStream(v14, self, a3);
    if (kAVVCScope)
    {
      v5 = *(id *)kAVVCScope;
      if (!v5)
        goto LABEL_11;
    }
    else
    {
      v5 = MEMORY[0x1E0C81028];
      v12 = MEMORY[0x1E0C81028];
    }
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      if (CurrentStreamStateForStream > 6)
        v13 = "ILLEGAL";
      else
        v13 = off_1E3BEC7D0[CurrentStreamStateForStream];
      *(_DWORD *)buf = 136316162;
      v17 = "AVVoiceController.mm";
      v18 = 1024;
      v19 = 1495;
      v20 = 2048;
      v21 = self;
      v22 = 2048;
      v23 = a3;
      v24 = 2080;
      v25 = v13;
      _os_log_impl(&dword_19B733000, v5, OS_LOG_TYPE_DEFAULT, "%25s:%-5d #### AVVoiceController[self = %p]: getCurrentStreamState: streamHandle(%lu). State(%s)", buf, 0x30u);
    }
    goto LABEL_10;
  }
  if (!kAVVCScope)
  {
    v5 = MEMORY[0x1E0C81028];
    v7 = MEMORY[0x1E0C81028];
    goto LABEL_7;
  }
  v5 = *(id *)kAVVCScope;
  if (v5)
  {
LABEL_7:
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      mClientAPIClutch = self->mClientAPIClutch;
      *(_DWORD *)buf = 136315906;
      v17 = "AVVoiceController.mm";
      v18 = 1024;
      v19 = 1493;
      v20 = 2048;
      v21 = (AVVoiceController *)v14;
      v22 = 1024;
      LODWORD(v23) = mClientAPIClutch;
      _os_log_impl(&dword_19B733000, v5, OS_LOG_TYPE_ERROR, "%25s:%-5d Invalid operation. impl(%p) ClientAPIClutch(%d)", buf, 0x22u);
    }
    CurrentStreamStateForStream = 0;
LABEL_10:

    goto LABEL_11;
  }
  CurrentStreamStateForStream = 0;
LABEL_11:
  if (v15)
  {
    p_shared_owners = (unint64_t *)&v15->__shared_owners_;
    do
      v10 = __ldaxr(p_shared_owners);
    while (__stlxr(v10 - 1, p_shared_owners));
    if (!v10)
    {
      ((void (*)())v15->__on_zero_shared)();
      std::__shared_weak_count::__release_weak(v15);
    }
  }
  return CurrentStreamStateForStream;
}

- (id)getRecordDeviceInfoForStream:(unint64_t)a3
{
  NSObject *v5;
  id v6;
  NSObject *v7;
  id v8;
  _BOOL4 mClientAPIClutch;
  void *v10;
  unint64_t *p_shared_owners;
  unint64_t v12;
  ControllerImpl *v14;
  std::__shared_weak_count *v15;
  uint8_t buf[4];
  const char *v17;
  __int16 v18;
  int v19;
  __int16 v20;
  AVVoiceController *v21;
  __int16 v22;
  unint64_t v23;
  _BYTE v24[160];
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  ElapsedTime::ElapsedTime((ElapsedTime *)v24, "-[AVVoiceController getRecordDeviceInfoForStream:]", 0, 0);
  if (kAVVCScope)
  {
    v5 = *(id *)kAVVCScope;
    if (!v5)
      goto LABEL_8;
  }
  else
  {
    v5 = MEMORY[0x1E0C81028];
    v6 = MEMORY[0x1E0C81028];
  }
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315906;
    v17 = "AVVoiceController.mm";
    v18 = 1024;
    v19 = 1502;
    v20 = 2048;
    v21 = self;
    v22 = 2048;
    v23 = a3;
    _os_log_impl(&dword_19B733000, v5, OS_LOG_TYPE_DEFAULT, "%25s:%-5d #### AVVoiceController[self = %p]: getRecordDeviceInfoForStream: streamHandle(%lu)", buf, 0x26u);
  }

LABEL_8:
  -[AVVoiceController impl](self, "impl");
  if (v14 && !self->mClientAPIClutch)
  {
    ControllerImpl::getRecordDeviceInfoForStream(v14, self, a3);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    goto LABEL_19;
  }
  if (!kAVVCScope)
  {
    v7 = MEMORY[0x1E0C81028];
    v8 = MEMORY[0x1E0C81028];
    goto LABEL_14;
  }
  v7 = *(id *)kAVVCScope;
  if (v7)
  {
LABEL_14:
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      mClientAPIClutch = self->mClientAPIClutch;
      *(_DWORD *)buf = 136315906;
      v17 = "AVVoiceController.mm";
      v18 = 1024;
      v19 = 1503;
      v20 = 2048;
      v21 = (AVVoiceController *)v14;
      v22 = 1024;
      LODWORD(v23) = mClientAPIClutch;
      _os_log_impl(&dword_19B733000, v7, OS_LOG_TYPE_ERROR, "%25s:%-5d Invalid operation. impl(%p) ClientAPIClutch(%d)", buf, 0x22u);
    }

  }
  v10 = 0;
LABEL_19:
  if (v15)
  {
    p_shared_owners = (unint64_t *)&v15->__shared_owners_;
    do
      v12 = __ldaxr(p_shared_owners);
    while (__stlxr(v12 - 1, p_shared_owners));
    if (!v12)
    {
      ((void (*)())v15->__on_zero_shared)();
      std::__shared_weak_count::__release_weak(v15);
    }
  }
  ElapsedTime::~ElapsedTime((ElapsedTime *)v24);
  return v10;
}

- (BOOL)activateAudioSessionForStream:(unint64_t)a3 isPrewarm:(BOOL)a4 error:(id *)a5
{
  _BOOL4 v6;
  NSObject *v9;
  id v10;
  NSObject *v11;
  id v12;
  _BOOL4 mClientAPIClutch;
  int v14;
  int v15;
  unint64_t *p_shared_owners;
  unint64_t v17;
  ControllerImpl *v19;
  std::__shared_weak_count *v20;
  int v21;
  char v22;
  __int128 v23;
  __int128 v24;
  uint8_t buf[4];
  const char *v26;
  __int16 v27;
  int v28;
  __int16 v29;
  AVVoiceController *v30;
  __int16 v31;
  _BOOL4 v32;
  __int16 v33;
  unint64_t v34;
  _BYTE v35[160];
  uint64_t v36;

  v6 = a4;
  v36 = *MEMORY[0x1E0C80C00];
  v21 = 4144;
  v22 = 1;
  v23 = 0u;
  v24 = 0u;
  kdebug_trace();
  ElapsedTime::ElapsedTime((ElapsedTime *)v35, "-[AVVoiceController activateAudioSessionForStream:isPrewarm:error:]", 0, 0);
  if (kAVVCScope)
  {
    v9 = *(id *)kAVVCScope;
    if (!v9)
      goto LABEL_8;
  }
  else
  {
    v9 = MEMORY[0x1E0C81028];
    v10 = MEMORY[0x1E0C81028];
  }
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136316162;
    v26 = "AVVoiceController.mm";
    v27 = 1024;
    v28 = 1512;
    v29 = 2048;
    v30 = self;
    v31 = 1024;
    v32 = v6;
    v33 = 2048;
    v34 = a3;
    _os_log_impl(&dword_19B733000, v9, OS_LOG_TYPE_DEFAULT, "%25s:%-5d #### AVVoiceController[self = %p]: activateAudioSessionForStream isPrewarm(%d). streamHandle(%lu)", buf, 0x2Cu);
  }

LABEL_8:
  -[AVVoiceController impl](self, "impl");
  if (v19 && !self->mClientAPIClutch)
  {
    v14 = ControllerImpl::activateAudioSessionForStream(v19, self, a3, v6, 1);
    v15 = v14;
    if (a5 && v14)
    {
      objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CB2F90], v14, 0);
      *a5 = (id)objc_claimAutoreleasedReturnValue();
    }
    LOBYTE(v11) = v15 == 0;
  }
  else
  {
    if (kAVVCScope)
    {
      v11 = *(id *)kAVVCScope;
      if (!v11)
        goto LABEL_21;
    }
    else
    {
      v11 = MEMORY[0x1E0C81028];
      v12 = MEMORY[0x1E0C81028];
    }
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      mClientAPIClutch = self->mClientAPIClutch;
      *(_DWORD *)buf = 136315906;
      v26 = "AVVoiceController.mm";
      v27 = 1024;
      v28 = 1513;
      v29 = 2048;
      v30 = (AVVoiceController *)v19;
      v31 = 1024;
      v32 = mClientAPIClutch;
      _os_log_impl(&dword_19B733000, v11, OS_LOG_TYPE_ERROR, "%25s:%-5d Invalid operation. impl(%p) ClientAPIClutch(%d)", buf, 0x22u);
    }

    LOBYTE(v11) = 0;
  }
LABEL_21:
  if (v20)
  {
    p_shared_owners = (unint64_t *)&v20->__shared_owners_;
    do
      v17 = __ldaxr(p_shared_owners);
    while (__stlxr(v17 - 1, p_shared_owners));
    if (!v17)
    {
      ((void (*)())v20->__on_zero_shared)();
      std::__shared_weak_count::__release_weak(v20);
    }
  }
  ElapsedTime::~ElapsedTime((ElapsedTime *)v35);
  TraceWrapper::~TraceWrapper((TraceWrapper *)&v21);
  return (char)v11;
}

- (BOOL)activateAudioSessionForStream:(unint64_t)a3 isPrewarm:(BOOL)a4 recordMode:(BOOL)a5 error:(id *)a6
{
  _BOOL4 v7;
  _BOOL4 v8;
  NSObject *v11;
  id v12;
  NSObject *v13;
  id v14;
  _BOOL4 mClientAPIClutch;
  int v16;
  int v17;
  unint64_t *p_shared_owners;
  unint64_t v19;
  ControllerImpl *v21;
  std::__shared_weak_count *v22;
  int v23;
  char v24;
  __int128 v25;
  __int128 v26;
  uint8_t buf[4];
  const char *v28;
  __int16 v29;
  int v30;
  __int16 v31;
  AVVoiceController *v32;
  __int16 v33;
  _BOOL4 v34;
  __int16 v35;
  _BOOL4 v36;
  __int16 v37;
  unint64_t v38;
  _BYTE v39[160];
  uint64_t v40;

  v7 = a5;
  v8 = a4;
  v40 = *MEMORY[0x1E0C80C00];
  v23 = 4144;
  v24 = 1;
  v25 = 0u;
  v26 = 0u;
  kdebug_trace();
  ElapsedTime::ElapsedTime((ElapsedTime *)v39, "-[AVVoiceController activateAudioSessionForStream:isPrewarm:recordMode:error:]", 0, 0);
  if (kAVVCScope)
  {
    v11 = *(id *)kAVVCScope;
    if (!v11)
      goto LABEL_8;
  }
  else
  {
    v11 = MEMORY[0x1E0C81028];
    v12 = MEMORY[0x1E0C81028];
  }
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136316418;
    v28 = "AVVoiceController.mm";
    v29 = 1024;
    v30 = 1525;
    v31 = 2048;
    v32 = self;
    v33 = 1024;
    v34 = v8;
    v35 = 1024;
    v36 = v7;
    v37 = 2048;
    v38 = a3;
    _os_log_impl(&dword_19B733000, v11, OS_LOG_TYPE_DEFAULT, "%25s:%-5d #### AVVoiceController[self = %p]: activateAudioSessionForStream isPrewarm(%d), switchRecordMode(%d). streamHandle(%lu)", buf, 0x32u);
  }

LABEL_8:
  -[AVVoiceController impl](self, "impl");
  if (v21 && !self->mClientAPIClutch)
  {
    v16 = ControllerImpl::activateAudioSessionForStream(v21, self, a3, v8, v7);
    v17 = v16;
    if (a6 && v16)
    {
      objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CB2F90], v16, 0);
      *a6 = (id)objc_claimAutoreleasedReturnValue();
    }
    LOBYTE(v13) = v17 == 0;
  }
  else
  {
    if (kAVVCScope)
    {
      v13 = *(id *)kAVVCScope;
      if (!v13)
        goto LABEL_21;
    }
    else
    {
      v13 = MEMORY[0x1E0C81028];
      v14 = MEMORY[0x1E0C81028];
    }
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      mClientAPIClutch = self->mClientAPIClutch;
      *(_DWORD *)buf = 136315906;
      v28 = "AVVoiceController.mm";
      v29 = 1024;
      v30 = 1526;
      v31 = 2048;
      v32 = (AVVoiceController *)v21;
      v33 = 1024;
      v34 = mClientAPIClutch;
      _os_log_impl(&dword_19B733000, v13, OS_LOG_TYPE_ERROR, "%25s:%-5d Invalid operation. impl(%p) ClientAPIClutch(%d)", buf, 0x22u);
    }

    LOBYTE(v13) = 0;
  }
LABEL_21:
  if (v22)
  {
    p_shared_owners = (unint64_t *)&v22->__shared_owners_;
    do
      v19 = __ldaxr(p_shared_owners);
    while (__stlxr(v19 - 1, p_shared_owners));
    if (!v19)
    {
      ((void (*)())v22->__on_zero_shared)();
      std::__shared_weak_count::__release_weak(v22);
    }
  }
  ElapsedTime::~ElapsedTime((ElapsedTime *)v39);
  TraceWrapper::~TraceWrapper((TraceWrapper *)&v23);
  return (char)v13;
}

- (void)deactivateAudioSessionWithOptions:(unint64_t)a3
{
  NSObject *v5;
  id v6;
  NSObject *v7;
  id v8;
  _BOOL4 mClientAPIClutch;
  unint64_t *p_shared_owners;
  unint64_t v11;
  uint64_t v12;
  std::__shared_weak_count *v13;
  int v14;
  char v15;
  __int128 v16;
  __int128 v17;
  uint8_t buf[4];
  const char *v19;
  __int16 v20;
  int v21;
  __int16 v22;
  AVVoiceController *v23;
  __int16 v24;
  unint64_t v25;
  _BYTE v26[160];
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v14 = 4144;
  v15 = 1;
  v16 = 0u;
  v17 = 0u;
  kdebug_trace();
  ElapsedTime::ElapsedTime((ElapsedTime *)v26, "-[AVVoiceController deactivateAudioSessionWithOptions:]", 0, 0);
  if (kAVVCScope)
  {
    v5 = *(id *)kAVVCScope;
    if (!v5)
      goto LABEL_8;
  }
  else
  {
    v5 = MEMORY[0x1E0C81028];
    v6 = MEMORY[0x1E0C81028];
  }
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315906;
    v19 = "AVVoiceController.mm";
    v20 = 1024;
    v21 = 1538;
    v22 = 2048;
    v23 = self;
    v24 = 2048;
    v25 = a3;
    _os_log_impl(&dword_19B733000, v5, OS_LOG_TYPE_DEFAULT, "%25s:%-5d #### AVVoiceController[self = %p]: deactivateAudioSessionWithOptions(%lu)", buf, 0x26u);
  }

LABEL_8:
  -[AVVoiceController impl](self, "impl");
  if (v12 && !self->mClientAPIClutch)
  {
    ControllerImpl::deactivateAudioSessionWithOptions(v12, self, a3, *(_QWORD *)(v12 + 472), 0);
  }
  else
  {
    if (kAVVCScope)
    {
      v7 = *(id *)kAVVCScope;
      if (!v7)
        goto LABEL_18;
    }
    else
    {
      v7 = MEMORY[0x1E0C81028];
      v8 = MEMORY[0x1E0C81028];
    }
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      mClientAPIClutch = self->mClientAPIClutch;
      *(_DWORD *)buf = 136315906;
      v19 = "AVVoiceController.mm";
      v20 = 1024;
      v21 = 1539;
      v22 = 2048;
      v23 = (AVVoiceController *)v12;
      v24 = 1024;
      LODWORD(v25) = mClientAPIClutch;
      _os_log_impl(&dword_19B733000, v7, OS_LOG_TYPE_ERROR, "%25s:%-5d Invalid operation. impl(%p) ClientAPIClutch(%d)", buf, 0x22u);
    }

  }
LABEL_18:
  if (v13)
  {
    p_shared_owners = (unint64_t *)&v13->__shared_owners_;
    do
      v11 = __ldaxr(p_shared_owners);
    while (__stlxr(v11 - 1, p_shared_owners));
    if (!v11)
    {
      ((void (*)())v13->__on_zero_shared)();
      std::__shared_weak_count::__release_weak(v13);
    }
  }
  ElapsedTime::~ElapsedTime((ElapsedTime *)v26);
  TraceWrapper::~TraceWrapper((TraceWrapper *)&v14);
}

- (void)deactivateAudioSessionForStream:(unint64_t)a3 withOptions:(unint64_t)a4 completion:(id)a5
{
  id v8;
  NSObject *v9;
  id v10;
  NSObject *v11;
  id v12;
  _BOOL4 mClientAPIClutch;
  unint64_t *p_shared_owners;
  unint64_t v15;
  uint64_t v16;
  std::__shared_weak_count *v17;
  int v18;
  char v19;
  __int128 v20;
  __int128 v21;
  uint8_t buf[4];
  const char *v23;
  __int16 v24;
  int v25;
  __int16 v26;
  AVVoiceController *v27;
  __int16 v28;
  int v29;
  __int16 v30;
  unint64_t v31;
  _BYTE v32[160];
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
  v8 = a5;
  v18 = 4144;
  v19 = 1;
  v20 = 0u;
  v21 = 0u;
  kdebug_trace();
  ElapsedTime::ElapsedTime((ElapsedTime *)v32, "-[AVVoiceController deactivateAudioSessionForStream:withOptions:completion:]", 0, 0);
  if (kAVVCScope)
  {
    v9 = *(id *)kAVVCScope;
    if (!v9)
      goto LABEL_8;
  }
  else
  {
    v9 = MEMORY[0x1E0C81028];
    v10 = MEMORY[0x1E0C81028];
  }
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136316162;
    v23 = "AVVoiceController.mm";
    v24 = 1024;
    v25 = 1547;
    v26 = 2048;
    v27 = self;
    v28 = 1024;
    v29 = a3;
    v30 = 2048;
    v31 = a4;
    _os_log_impl(&dword_19B733000, v9, OS_LOG_TYPE_DEFAULT, "%25s:%-5d #### AVVoiceController[self = %p]: deactivateAudioSessionForStream:(%d) withOptions(%lu) completion:", buf, 0x2Cu);
  }

LABEL_8:
  -[AVVoiceController impl](self, "impl");
  if (v16 && !self->mClientAPIClutch)
  {
    ControllerImpl::deactivateAudioSessionWithOptions(v16, self, a4, a3, v8);
  }
  else
  {
    if (kAVVCScope)
    {
      v11 = *(id *)kAVVCScope;
      if (!v11)
        goto LABEL_18;
    }
    else
    {
      v11 = MEMORY[0x1E0C81028];
      v12 = MEMORY[0x1E0C81028];
    }
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      mClientAPIClutch = self->mClientAPIClutch;
      *(_DWORD *)buf = 136315906;
      v23 = "AVVoiceController.mm";
      v24 = 1024;
      v25 = 1548;
      v26 = 2048;
      v27 = (AVVoiceController *)v16;
      v28 = 1024;
      v29 = mClientAPIClutch;
      _os_log_impl(&dword_19B733000, v11, OS_LOG_TYPE_ERROR, "%25s:%-5d Invalid operation. impl(%p) ClientAPIClutch(%d)", buf, 0x22u);
    }

  }
LABEL_18:
  if (v17)
  {
    p_shared_owners = (unint64_t *)&v17->__shared_owners_;
    do
      v15 = __ldaxr(p_shared_owners);
    while (__stlxr(v15 - 1, p_shared_owners));
    if (!v15)
    {
      ((void (*)())v17->__on_zero_shared)();
      std::__shared_weak_count::__release_weak(v17);
    }
  }
  ElapsedTime::~ElapsedTime((ElapsedTime *)v32);
  TraceWrapper::~TraceWrapper((TraceWrapper *)&v18);

}

- (void)deactivateAudioSessionForStream:(unint64_t)a3 withOptions:(unint64_t)a4 error:(id *)a5
{
  NSObject *v9;
  id v10;
  NSObject *v11;
  id v12;
  _BOOL4 mClientAPIClutch;
  unint64_t *p_shared_owners;
  unint64_t v15;
  uint64_t v16;
  std::__shared_weak_count *v17;
  int v18;
  char v19;
  __int128 v20;
  __int128 v21;
  uint8_t buf[4];
  const char *v23;
  __int16 v24;
  int v25;
  __int16 v26;
  AVVoiceController *v27;
  __int16 v28;
  int v29;
  __int16 v30;
  unint64_t v31;
  _BYTE v32[160];
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
  v18 = 4144;
  v19 = 1;
  v20 = 0u;
  v21 = 0u;
  kdebug_trace();
  ElapsedTime::ElapsedTime((ElapsedTime *)v32, "-[AVVoiceController deactivateAudioSessionForStream:withOptions:error:]", 0, 0);
  if (kAVVCScope)
  {
    v9 = *(id *)kAVVCScope;
    if (!v9)
      goto LABEL_8;
  }
  else
  {
    v9 = MEMORY[0x1E0C81028];
    v10 = MEMORY[0x1E0C81028];
  }
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136316162;
    v23 = "AVVoiceController.mm";
    v24 = 1024;
    v25 = 1556;
    v26 = 2048;
    v27 = self;
    v28 = 1024;
    v29 = a3;
    v30 = 2048;
    v31 = a4;
    _os_log_impl(&dword_19B733000, v9, OS_LOG_TYPE_DEFAULT, "%25s:%-5d #### AVVoiceController[self = %p]: deactivateAudioSessionForStream:(%d) withOptions(%lu)", buf, 0x2Cu);
  }

LABEL_8:
  -[AVVoiceController impl](self, "impl");
  if (v16 && !self->mClientAPIClutch)
  {
    ControllerImpl::deactivateAudioSessionWithOptions(v16, self, a4, a3, a5);
  }
  else
  {
    if (kAVVCScope)
    {
      v11 = *(id *)kAVVCScope;
      if (!v11)
        goto LABEL_18;
    }
    else
    {
      v11 = MEMORY[0x1E0C81028];
      v12 = MEMORY[0x1E0C81028];
    }
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      mClientAPIClutch = self->mClientAPIClutch;
      *(_DWORD *)buf = 136315906;
      v23 = "AVVoiceController.mm";
      v24 = 1024;
      v25 = 1557;
      v26 = 2048;
      v27 = (AVVoiceController *)v16;
      v28 = 1024;
      v29 = mClientAPIClutch;
      _os_log_impl(&dword_19B733000, v11, OS_LOG_TYPE_ERROR, "%25s:%-5d Invalid operation. impl(%p) ClientAPIClutch(%d)", buf, 0x22u);
    }

  }
LABEL_18:
  if (v17)
  {
    p_shared_owners = (unint64_t *)&v17->__shared_owners_;
    do
      v15 = __ldaxr(p_shared_owners);
    while (__stlxr(v15 - 1, p_shared_owners));
    if (!v15)
    {
      ((void (*)())v17->__on_zero_shared)();
      std::__shared_weak_count::__release_weak(v17);
    }
  }
  ElapsedTime::~ElapsedTime((ElapsedTime *)v32);
  TraceWrapper::~TraceWrapper((TraceWrapper *)&v18);
}

- (int64_t)getCurrentSessionState
{
  NSObject *v3;
  id v4;
  _BOOL4 mClientAPIClutch;
  int64_t AVVCSessionState;
  unint64_t *p_shared_owners;
  unint64_t v8;
  ControllerImpl *v10;
  std::__shared_weak_count *v11;
  uint8_t buf[4];
  const char *v13;
  __int16 v14;
  int v15;
  __int16 v16;
  ControllerImpl *v17;
  __int16 v18;
  _BOOL4 v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  -[AVVoiceController impl](self, "impl");
  if (v10 && !self->mClientAPIClutch)
  {
    AVVCSessionState = ControllerImpl::getAVVCSessionState(v10, 0);
    goto LABEL_12;
  }
  if (!kAVVCScope)
  {
    v3 = MEMORY[0x1E0C81028];
    v4 = MEMORY[0x1E0C81028];
    goto LABEL_7;
  }
  v3 = *(id *)kAVVCScope;
  if (v3)
  {
LABEL_7:
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    {
      mClientAPIClutch = self->mClientAPIClutch;
      *(_DWORD *)buf = 136315906;
      v13 = "AVVoiceController.mm";
      v14 = 1024;
      v15 = 1563;
      v16 = 2048;
      v17 = v10;
      v18 = 1024;
      v19 = mClientAPIClutch;
      _os_log_impl(&dword_19B733000, v3, OS_LOG_TYPE_ERROR, "%25s:%-5d Invalid operation. impl(%p) ClientAPIClutch(%d)", buf, 0x22u);
    }

  }
  AVVCSessionState = 0;
LABEL_12:
  if (v11)
  {
    p_shared_owners = (unint64_t *)&v11->__shared_owners_;
    do
      v8 = __ldaxr(p_shared_owners);
    while (__stlxr(v8 - 1, p_shared_owners));
    if (!v8)
    {
      ((void (*)())v11->__on_zero_shared)();
      std::__shared_weak_count::__release_weak(v11);
    }
  }
  return AVVCSessionState;
}

- (int64_t)getCurrentSessionStateForStream:(unint64_t)a3
{
  NSObject *v5;
  id v6;
  _BOOL4 mClientAPIClutch;
  int64_t AVVCSessionState;
  unint64_t *p_shared_owners;
  unint64_t v10;
  ControllerImpl *v12;
  std::__shared_weak_count *v13;
  uint8_t buf[4];
  const char *v15;
  __int16 v16;
  int v17;
  __int16 v18;
  ControllerImpl *v19;
  __int16 v20;
  _BOOL4 v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  -[AVVoiceController impl](self, "impl");
  if (v12 && !self->mClientAPIClutch)
  {
    AVVCSessionState = ControllerImpl::getAVVCSessionState(v12, a3);
    goto LABEL_12;
  }
  if (!kAVVCScope)
  {
    v5 = MEMORY[0x1E0C81028];
    v6 = MEMORY[0x1E0C81028];
    goto LABEL_7;
  }
  v5 = *(id *)kAVVCScope;
  if (v5)
  {
LABEL_7:
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      mClientAPIClutch = self->mClientAPIClutch;
      *(_DWORD *)buf = 136315906;
      v15 = "AVVoiceController.mm";
      v16 = 1024;
      v17 = 1568;
      v18 = 2048;
      v19 = v12;
      v20 = 1024;
      v21 = mClientAPIClutch;
      _os_log_impl(&dword_19B733000, v5, OS_LOG_TYPE_ERROR, "%25s:%-5d Invalid operation. impl(%p) ClientAPIClutch(%d)", buf, 0x22u);
    }

  }
  AVVCSessionState = 0;
LABEL_12:
  if (v13)
  {
    p_shared_owners = (unint64_t *)&v13->__shared_owners_;
    do
      v10 = __ldaxr(p_shared_owners);
    while (__stlxr(v10 - 1, p_shared_owners));
    if (!v10)
    {
      ((void (*)())v13->__on_zero_shared)();
      std::__shared_weak_count::__release_weak(v13);
    }
  }
  return AVVCSessionState;
}

- (BOOL)setContextForStream:(id)a3 forStream:(unint64_t)a4 error:(id *)a5
{
  AVVCContextSettings *v8;
  id v9;
  id v10;
  NSObject *v11;
  void *v12;
  void *v13;
  NSObject *v14;
  id v15;
  _BOOL4 mClientAPIClutch;
  BOOL v17;
  unint64_t *p_shared_owners;
  unint64_t v19;
  int v21;
  uint64_t v22;
  uint64_t v23;
  ControllerImpl *v24;
  std::__shared_weak_count *v25;
  int v26;
  char v27;
  __int128 v28;
  __int128 v29;
  uint8_t buf[4];
  const char *v31;
  __int16 v32;
  int v33;
  __int16 v34;
  AVVoiceController *v35;
  __int16 v36;
  void *v37;
  __int16 v38;
  void *v39;
  __int16 v40;
  unint64_t v41;
  _BYTE v42[160];
  uint64_t v43;

  v43 = *MEMORY[0x1E0C80C00];
  v8 = (AVVCContextSettings *)a3;
  v26 = 4146;
  v27 = 1;
  v28 = 0u;
  v29 = 0u;
  kdebug_trace();
  ElapsedTime::ElapsedTime((ElapsedTime *)v42, "-[AVVoiceController setContextForStream:forStream:error:]", 0, 0);
  if (kAVVCScope)
  {
    v9 = *(id *)kAVVCScope;
    if (!v9)
      goto LABEL_8;
  }
  else
  {
    v9 = (id)MEMORY[0x1E0C81028];
    v10 = MEMORY[0x1E0C81028];
  }
  v11 = v9;
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    Get4CCFromInt(-[AVVCContextSettings activationMode](v8, "activationMode"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[AVVCContextSettings activationDeviceUID](v8, "activationDeviceUID");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 136316418;
    v31 = "AVVoiceController.mm";
    v32 = 1024;
    v33 = 1576;
    v34 = 2048;
    v35 = self;
    v36 = 2112;
    v37 = v12;
    v38 = 2112;
    v39 = v13;
    v40 = 2048;
    v41 = a4;
    _os_log_impl(&dword_19B733000, v11, OS_LOG_TYPE_DEFAULT, "%25s:%-5d #### AVVoiceController[self = %p]: setContextForStream: activationMode(%@), deviceUID(%@). streamHandle(%lu)", buf, 0x3Au);

  }
LABEL_8:
  -[AVVoiceController impl](self, "impl");
  if (!v24 || self->mClientAPIClutch)
  {
    if (kAVVCScope)
    {
      v14 = *(id *)kAVVCScope;
      if (!v14)
      {
LABEL_17:
        v17 = 0;
        goto LABEL_18;
      }
    }
    else
    {
      v14 = MEMORY[0x1E0C81028];
      v15 = MEMORY[0x1E0C81028];
    }
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      mClientAPIClutch = self->mClientAPIClutch;
      *(_DWORD *)buf = 136315906;
      v31 = "AVVoiceController.mm";
      v32 = 1024;
      v33 = 1577;
      v34 = 2048;
      v35 = (AVVoiceController *)v24;
      v36 = 1024;
      LODWORD(v37) = mClientAPIClutch;
      _os_log_impl(&dword_19B733000, v14, OS_LOG_TYPE_ERROR, "%25s:%-5d Invalid operation. impl(%p) ClientAPIClutch(%d)", buf, 0x22u);
    }

    goto LABEL_17;
  }
  v21 = ControllerImpl::setContextForStream(v24, self, v8, a4);
  v17 = v21 == 0;
  if (a5 && v21)
  {
    v22 = v21;
    if (v21 == 560557673)
      v22 = -11785;
    if (v21 == -66671)
      v23 = -11785;
    else
      v23 = v22;
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CB2F90], v23, 0);
    v17 = 0;
    *a5 = (id)objc_claimAutoreleasedReturnValue();
  }
LABEL_18:
  if (v25)
  {
    p_shared_owners = (unint64_t *)&v25->__shared_owners_;
    do
      v19 = __ldaxr(p_shared_owners);
    while (__stlxr(v19 - 1, p_shared_owners));
    if (!v19)
    {
      ((void (*)())v25->__on_zero_shared)();
      std::__shared_weak_count::__release_weak(v25);
    }
  }
  ElapsedTime::~ElapsedTime((ElapsedTime *)v42);
  TraceWrapper::~TraceWrapper((TraceWrapper *)&v26);

  return v17;
}

- (void)playAlert:(int)a3 withOverride:(int64_t)a4 completion:(id)a5
{
  id v8;
  NSObject *v9;
  id v10;
  NSObject *v11;
  id v12;
  _BOOL4 mClientAPIClutch;
  unint64_t *p_shared_owners;
  unint64_t v15;
  uint64_t v16;
  std::__shared_weak_count *v17;
  int v18;
  char v19;
  __int128 v20;
  __int128 v21;
  uint8_t buf[4];
  const char *v23;
  __int16 v24;
  int v25;
  __int16 v26;
  AVVoiceController *v27;
  __int16 v28;
  int v29;
  __int16 v30;
  int v31;
  _BYTE v32[160];
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
  v8 = a5;
  v18 = 4145;
  v19 = 1;
  v20 = 0u;
  v21 = 0u;
  kdebug_trace();
  ElapsedTime::ElapsedTime((ElapsedTime *)v32, "-[AVVoiceController playAlert:withOverride:completion:]", 0, 0);
  if (kAVVCScope)
  {
    v9 = *(id *)kAVVCScope;
    if (!v9)
      goto LABEL_8;
  }
  else
  {
    v9 = MEMORY[0x1E0C81028];
    v10 = MEMORY[0x1E0C81028];
  }
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136316162;
    v23 = "AVVoiceController.mm";
    v24 = 1024;
    v25 = 1592;
    v26 = 2048;
    v27 = self;
    v28 = 1024;
    v29 = a3;
    v30 = 1024;
    v31 = a4;
    _os_log_impl(&dword_19B733000, v9, OS_LOG_TYPE_DEFAULT, "%25s:%-5d #### AVVoiceController[self = %p]: playAlert alertType(%d). overrideMode(%d)", buf, 0x28u);
  }

LABEL_8:
  -[AVVoiceController impl](self, "impl");
  if (v16 && !self->mClientAPIClutch)
  {
    ControllerImpl::playAlertWithCompletion(v16, self, a3, a4, v8);
  }
  else
  {
    if (kAVVCScope)
    {
      v11 = *(id *)kAVVCScope;
      if (!v11)
        goto LABEL_18;
    }
    else
    {
      v11 = MEMORY[0x1E0C81028];
      v12 = MEMORY[0x1E0C81028];
    }
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      mClientAPIClutch = self->mClientAPIClutch;
      *(_DWORD *)buf = 136315906;
      v23 = "AVVoiceController.mm";
      v24 = 1024;
      v25 = 1593;
      v26 = 2048;
      v27 = (AVVoiceController *)v16;
      v28 = 1024;
      v29 = mClientAPIClutch;
      _os_log_impl(&dword_19B733000, v11, OS_LOG_TYPE_ERROR, "%25s:%-5d Invalid operation. impl(%p) ClientAPIClutch(%d)", buf, 0x22u);
    }

  }
LABEL_18:
  if (v17)
  {
    p_shared_owners = (unint64_t *)&v17->__shared_owners_;
    do
      v15 = __ldaxr(p_shared_owners);
    while (__stlxr(v15 - 1, p_shared_owners));
    if (!v15)
    {
      ((void (*)())v17->__on_zero_shared)();
      std::__shared_weak_count::__release_weak(v17);
    }
  }
  ElapsedTime::~ElapsedTime((ElapsedTime *)v32);
  TraceWrapper::~TraceWrapper((TraceWrapper *)&v18);

}

- (BOOL)playAlertSoundForType:(int)a3 overrideMode:(int64_t)a4
{
  uint64_t v7;
  NSObject *v8;
  id v9;
  const char *v10;
  NSObject *v11;
  uint32_t v12;
  unint64_t *p_shared_owners;
  unint64_t v14;
  NSObject *v16;
  id v17;
  int v18;
  id v19;
  uint64_t v20;
  std::__shared_weak_count *v21;
  int v22;
  char v23;
  __int128 v24;
  __int128 v25;
  uint8_t buf[4];
  const char *v27;
  __int16 v28;
  int v29;
  __int16 v30;
  AVVoiceController *v31;
  __int16 v32;
  int v33;
  __int16 v34;
  int v35;
  _BYTE v36[160];
  uint64_t v37;

  v37 = *MEMORY[0x1E0C80C00];
  v22 = 4145;
  v23 = 1;
  v24 = 0u;
  v25 = 0u;
  kdebug_trace();
  ElapsedTime::ElapsedTime((ElapsedTime *)v36, "-[AVVoiceController playAlertSoundForType:overrideMode:]", 0, 0);
  -[AVVoiceController impl](self, "impl");
  v7 = v20;
  if (!v20 || *(_BYTE *)(v20 + 521) || self->mClientAPIClutch)
  {
    if (kAVVCScope)
    {
      v8 = *(id *)kAVVCScope;
      if (!v8)
        goto LABEL_12;
    }
    else
    {
      v8 = MEMORY[0x1E0C81028];
      v9 = MEMORY[0x1E0C81028];
    }
    if (!os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      goto LABEL_11;
    *(_DWORD *)buf = 136315394;
    v27 = "AVVoiceController.mm";
    v28 = 1024;
    v29 = 1604;
    v10 = "%25s:%-5d call to playAlertSoundForType blocked because mediaserverd is dead";
    v11 = v8;
    v12 = 18;
    goto LABEL_10;
  }
  if (kAVVCScope)
  {
    v16 = *(id *)kAVVCScope;
    if (!v16)
      goto LABEL_25;
  }
  else
  {
    v16 = MEMORY[0x1E0C81028];
    v17 = MEMORY[0x1E0C81028];
  }
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136316162;
    v27 = "AVVoiceController.mm";
    v28 = 1024;
    v29 = 1608;
    v30 = 2048;
    v31 = self;
    v32 = 1024;
    v33 = a3;
    v34 = 1024;
    v35 = a4;
    _os_log_impl(&dword_19B733000, v16, OS_LOG_TYPE_DEFAULT, "%25s:%-5d #### AVVoiceController[self = %p]: playAlertSoundForStream: alertType(%d) overrideMode(%d)", buf, 0x28u);
  }

  v7 = v20;
LABEL_25:
  v18 = ControllerImpl::playAlertWithOverride(v7, self, a3, a4);
  if (!v18)
  {
    LOBYTE(v8) = 1;
    goto LABEL_12;
  }
  if (kAVVCScope)
  {
    v8 = *(id *)kAVVCScope;
    if (!v8)
      goto LABEL_12;
  }
  else
  {
    v8 = MEMORY[0x1E0C81028];
    v19 = MEMORY[0x1E0C81028];
  }
  if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 136315650;
    v27 = "AVVoiceController.mm";
    v28 = 1024;
    v29 = 1611;
    v30 = 1024;
    LODWORD(v31) = v18;
    v10 = "%25s:%-5d playAlertSoundForStream failed with error : %d";
    v11 = v8;
    v12 = 24;
LABEL_10:
    _os_log_impl(&dword_19B733000, v11, OS_LOG_TYPE_ERROR, v10, buf, v12);
  }
LABEL_11:

  LOBYTE(v8) = 0;
LABEL_12:
  if (v21)
  {
    p_shared_owners = (unint64_t *)&v21->__shared_owners_;
    do
      v14 = __ldaxr(p_shared_owners);
    while (__stlxr(v14 - 1, p_shared_owners));
    if (!v14)
    {
      ((void (*)())v21->__on_zero_shared)();
      std::__shared_weak_count::__release_weak(v21);
    }
  }
  ElapsedTime::~ElapsedTime((ElapsedTime *)v36);
  TraceWrapper::~TraceWrapper((TraceWrapper *)&v22);
  return (char)v8;
}

- (double)getRecordBufferDurationForStream:(unint64_t)a3
{
  NSObject *v5;
  id v6;
  _BOOL4 mClientAPIClutch;
  double RecordBufferDurationForStream;
  unint64_t *p_shared_owners;
  unint64_t v10;
  ControllerImpl *v12;
  std::__shared_weak_count *v13;
  uint8_t buf[4];
  const char *v15;
  __int16 v16;
  int v17;
  __int16 v18;
  ControllerImpl *v19;
  __int16 v20;
  _BOOL4 v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  -[AVVoiceController impl](self, "impl");
  if (v12 && !self->mClientAPIClutch)
  {
    RecordBufferDurationForStream = ControllerImpl::getRecordBufferDurationForStream(v12, a3);
    goto LABEL_12;
  }
  if (!kAVVCScope)
  {
    v5 = MEMORY[0x1E0C81028];
    v6 = MEMORY[0x1E0C81028];
    goto LABEL_7;
  }
  v5 = *(id *)kAVVCScope;
  if (v5)
  {
LABEL_7:
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      mClientAPIClutch = self->mClientAPIClutch;
      *(_DWORD *)buf = 136315906;
      v15 = "AVVoiceController.mm";
      v16 = 1024;
      v17 = 1618;
      v18 = 2048;
      v19 = v12;
      v20 = 1024;
      v21 = mClientAPIClutch;
      _os_log_impl(&dword_19B733000, v5, OS_LOG_TYPE_ERROR, "%25s:%-5d Invalid operation. impl(%p) ClientAPIClutch(%d)", buf, 0x22u);
    }

  }
  RecordBufferDurationForStream = 0.0;
LABEL_12:
  if (v13)
  {
    p_shared_owners = (unint64_t *)&v13->__shared_owners_;
    do
      v10 = __ldaxr(p_shared_owners);
    while (__stlxr(v10 - 1, p_shared_owners));
    if (!v10)
    {
      ((void (*)())v13->__on_zero_shared)();
      std::__shared_weak_count::__release_weak(v13);
    }
  }
  return RecordBufferDurationForStream;
}

- (id)getRecordSettingsForStream:(unint64_t)a3
{
  NSObject *v5;
  id v6;
  _BOOL4 mClientAPIClutch;
  void *v8;
  unint64_t *p_shared_owners;
  unint64_t v10;
  ControllerImpl *v12;
  std::__shared_weak_count *v13;
  uint8_t buf[4];
  const char *v15;
  __int16 v16;
  int v17;
  __int16 v18;
  ControllerImpl *v19;
  __int16 v20;
  _BOOL4 v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  -[AVVoiceController impl](self, "impl");
  if (v12 && !self->mClientAPIClutch)
  {
    ControllerImpl::getRecordSettingsForStream(v12, self, a3);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    goto LABEL_12;
  }
  if (!kAVVCScope)
  {
    v5 = MEMORY[0x1E0C81028];
    v6 = MEMORY[0x1E0C81028];
    goto LABEL_7;
  }
  v5 = *(id *)kAVVCScope;
  if (v5)
  {
LABEL_7:
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      mClientAPIClutch = self->mClientAPIClutch;
      *(_DWORD *)buf = 136315906;
      v15 = "AVVoiceController.mm";
      v16 = 1024;
      v17 = 1624;
      v18 = 2048;
      v19 = v12;
      v20 = 1024;
      v21 = mClientAPIClutch;
      _os_log_impl(&dword_19B733000, v5, OS_LOG_TYPE_ERROR, "%25s:%-5d Invalid operation. impl(%p) ClientAPIClutch(%d)", buf, 0x22u);
    }

  }
  v8 = 0;
LABEL_12:
  if (v13)
  {
    p_shared_owners = (unint64_t *)&v13->__shared_owners_;
    do
      v10 = __ldaxr(p_shared_owners);
    while (__stlxr(v10 - 1, p_shared_owners));
    if (!v10)
    {
      ((void (*)())v13->__on_zero_shared)();
      std::__shared_weak_count::__release_weak(v13);
    }
  }
  return v8;
}

- (BOOL)isMeteringEnabledForStream:(unint64_t)a3
{
  NSObject *v5;
  id v6;
  _BOOL4 mClientAPIClutch;
  char isMeteringEnabledForStream;
  unint64_t *p_shared_owners;
  unint64_t v10;
  ControllerImpl *v12;
  std::__shared_weak_count *v13;
  uint8_t buf[4];
  const char *v15;
  __int16 v16;
  int v17;
  __int16 v18;
  ControllerImpl *v19;
  __int16 v20;
  _BOOL4 v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  -[AVVoiceController impl](self, "impl");
  if (v12 && !self->mClientAPIClutch)
  {
    isMeteringEnabledForStream = ControllerImpl::isMeteringEnabledForStream(v12, a3);
    goto LABEL_12;
  }
  if (!kAVVCScope)
  {
    v5 = MEMORY[0x1E0C81028];
    v6 = MEMORY[0x1E0C81028];
    goto LABEL_7;
  }
  v5 = *(id *)kAVVCScope;
  if (v5)
  {
LABEL_7:
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      mClientAPIClutch = self->mClientAPIClutch;
      *(_DWORD *)buf = 136315906;
      v15 = "AVVoiceController.mm";
      v16 = 1024;
      v17 = 1630;
      v18 = 2048;
      v19 = v12;
      v20 = 1024;
      v21 = mClientAPIClutch;
      _os_log_impl(&dword_19B733000, v5, OS_LOG_TYPE_ERROR, "%25s:%-5d Invalid operation. impl(%p) ClientAPIClutch(%d)", buf, 0x22u);
    }

  }
  isMeteringEnabledForStream = 0;
LABEL_12:
  if (v13)
  {
    p_shared_owners = (unint64_t *)&v13->__shared_owners_;
    do
      v10 = __ldaxr(p_shared_owners);
    while (__stlxr(v10 - 1, p_shared_owners));
    if (!v10)
    {
      ((void (*)())v13->__on_zero_shared)();
      std::__shared_weak_count::__release_weak(v13);
    }
  }
  return isMeteringEnabledForStream;
}

- (BOOL)updateMeterForStream:(unint64_t)a3
{
  NSObject *v5;
  id v6;
  _BOOL4 mClientAPIClutch;
  char updated;
  unint64_t *p_shared_owners;
  unint64_t v10;
  ControllerImpl *v12;
  std::__shared_weak_count *v13;
  uint8_t buf[4];
  const char *v15;
  __int16 v16;
  int v17;
  __int16 v18;
  ControllerImpl *v19;
  __int16 v20;
  _BOOL4 v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  -[AVVoiceController impl](self, "impl");
  if (v12 && !self->mClientAPIClutch)
  {
    updated = ControllerImpl::updateMeterLevelForStream(v12, a3);
    goto LABEL_12;
  }
  if (!kAVVCScope)
  {
    v5 = MEMORY[0x1E0C81028];
    v6 = MEMORY[0x1E0C81028];
    goto LABEL_7;
  }
  v5 = *(id *)kAVVCScope;
  if (v5)
  {
LABEL_7:
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      mClientAPIClutch = self->mClientAPIClutch;
      *(_DWORD *)buf = 136315906;
      v15 = "AVVoiceController.mm";
      v16 = 1024;
      v17 = 1635;
      v18 = 2048;
      v19 = v12;
      v20 = 1024;
      v21 = mClientAPIClutch;
      _os_log_impl(&dword_19B733000, v5, OS_LOG_TYPE_ERROR, "%25s:%-5d Invalid operation. impl(%p) ClientAPIClutch(%d)", buf, 0x22u);
    }

  }
  updated = 0;
LABEL_12:
  if (v13)
  {
    p_shared_owners = (unint64_t *)&v13->__shared_owners_;
    do
      v10 = __ldaxr(p_shared_owners);
    while (__stlxr(v10 - 1, p_shared_owners));
    if (!v10)
    {
      ((void (*)())v13->__on_zero_shared)();
      std::__shared_weak_count::__release_weak(v13);
    }
  }
  return updated;
}

- (float)getPeakPowerForStream:(unint64_t)a3 forChannel:(unint64_t)a4
{
  int v4;
  NSObject *v7;
  id v8;
  _BOOL4 mClientAPIClutch;
  float PeakPowerForStreamAndChannel;
  unint64_t *p_shared_owners;
  unint64_t v12;
  ControllerImpl *v14;
  std::__shared_weak_count *v15;
  uint8_t buf[4];
  const char *v17;
  __int16 v18;
  int v19;
  __int16 v20;
  ControllerImpl *v21;
  __int16 v22;
  _BOOL4 v23;
  uint64_t v24;

  v4 = a4;
  v24 = *MEMORY[0x1E0C80C00];
  -[AVVoiceController impl](self, "impl");
  if (v14 && !self->mClientAPIClutch)
  {
    PeakPowerForStreamAndChannel = ControllerImpl::getPeakPowerForStreamAndChannel(v14, a3, v4);
    goto LABEL_12;
  }
  if (!kAVVCScope)
  {
    v7 = MEMORY[0x1E0C81028];
    v8 = MEMORY[0x1E0C81028];
    goto LABEL_7;
  }
  v7 = *(id *)kAVVCScope;
  if (v7)
  {
LABEL_7:
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      mClientAPIClutch = self->mClientAPIClutch;
      *(_DWORD *)buf = 136315906;
      v17 = "AVVoiceController.mm";
      v18 = 1024;
      v19 = 1640;
      v20 = 2048;
      v21 = v14;
      v22 = 1024;
      v23 = mClientAPIClutch;
      _os_log_impl(&dword_19B733000, v7, OS_LOG_TYPE_ERROR, "%25s:%-5d Invalid operation. impl(%p) ClientAPIClutch(%d)", buf, 0x22u);
    }

  }
  PeakPowerForStreamAndChannel = 0.0;
LABEL_12:
  if (v15)
  {
    p_shared_owners = (unint64_t *)&v15->__shared_owners_;
    do
      v12 = __ldaxr(p_shared_owners);
    while (__stlxr(v12 - 1, p_shared_owners));
    if (!v12)
    {
      ((void (*)())v15->__on_zero_shared)();
      std::__shared_weak_count::__release_weak(v15);
    }
  }
  return PeakPowerForStreamAndChannel;
}

- (float)getAveragePowerForStream:(unint64_t)a3 forChannel:(unint64_t)a4
{
  int v4;
  NSObject *v7;
  id v8;
  _BOOL4 mClientAPIClutch;
  float AveragePowerForStreamAndChannel;
  unint64_t *p_shared_owners;
  unint64_t v12;
  ControllerImpl *v14;
  std::__shared_weak_count *v15;
  uint8_t buf[4];
  const char *v17;
  __int16 v18;
  int v19;
  __int16 v20;
  ControllerImpl *v21;
  __int16 v22;
  _BOOL4 v23;
  uint64_t v24;

  v4 = a4;
  v24 = *MEMORY[0x1E0C80C00];
  -[AVVoiceController impl](self, "impl");
  if (v14 && !self->mClientAPIClutch)
  {
    AveragePowerForStreamAndChannel = ControllerImpl::getAveragePowerForStreamAndChannel(v14, a3, v4);
    goto LABEL_12;
  }
  if (!kAVVCScope)
  {
    v7 = MEMORY[0x1E0C81028];
    v8 = MEMORY[0x1E0C81028];
    goto LABEL_7;
  }
  v7 = *(id *)kAVVCScope;
  if (v7)
  {
LABEL_7:
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      mClientAPIClutch = self->mClientAPIClutch;
      *(_DWORD *)buf = 136315906;
      v17 = "AVVoiceController.mm";
      v18 = 1024;
      v19 = 1645;
      v20 = 2048;
      v21 = v14;
      v22 = 1024;
      v23 = mClientAPIClutch;
      _os_log_impl(&dword_19B733000, v7, OS_LOG_TYPE_ERROR, "%25s:%-5d Invalid operation. impl(%p) ClientAPIClutch(%d)", buf, 0x22u);
    }

  }
  AveragePowerForStreamAndChannel = 0.0;
LABEL_12:
  if (v15)
  {
    p_shared_owners = (unint64_t *)&v15->__shared_owners_;
    do
      v12 = __ldaxr(p_shared_owners);
    while (__stlxr(v12 - 1, p_shared_owners));
    if (!v12)
    {
      ((void (*)())v15->__on_zero_shared)();
      std::__shared_weak_count::__release_weak(v15);
    }
  }
  return AveragePowerForStreamAndChannel;
}

- (void)setRecordStatusChangeBlock:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  NSObject *v7;
  id v8;
  _BOOL4 mClientAPIClutch;
  unint64_t *p_shared_owners;
  unint64_t v11;
  uint64_t v12;
  std::__shared_weak_count *v13;
  uint8_t buf[4];
  const char *v15;
  __int16 v16;
  int v17;
  __int16 v18;
  AVVoiceController *v19;
  __int16 v20;
  _BOOL4 v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (kAVVCScope)
  {
    v5 = *(id *)kAVVCScope;
    if (!v5)
      goto LABEL_8;
  }
  else
  {
    v5 = MEMORY[0x1E0C81028];
    v6 = MEMORY[0x1E0C81028];
  }
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315650;
    v15 = "AVVoiceController.mm";
    v16 = 1024;
    v17 = 1650;
    v18 = 2048;
    v19 = self;
    _os_log_impl(&dword_19B733000, v5, OS_LOG_TYPE_DEFAULT, "%25s:%-5d #### AVVoiceController[self = %p]: setRecordStatusChangeBlock", buf, 0x1Cu);
  }

LABEL_8:
  -[AVVoiceController impl](self, "impl");
  if (v12 && !self->mClientAPIClutch)
  {
    ControllerImpl::setRecordStatusChangeBlock(v12, v4);
  }
  else
  {
    if (kAVVCScope)
    {
      v7 = *(id *)kAVVCScope;
      if (!v7)
        goto LABEL_18;
    }
    else
    {
      v7 = MEMORY[0x1E0C81028];
      v8 = MEMORY[0x1E0C81028];
    }
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      mClientAPIClutch = self->mClientAPIClutch;
      *(_DWORD *)buf = 136315906;
      v15 = "AVVoiceController.mm";
      v16 = 1024;
      v17 = 1651;
      v18 = 2048;
      v19 = (AVVoiceController *)v12;
      v20 = 1024;
      v21 = mClientAPIClutch;
      _os_log_impl(&dword_19B733000, v7, OS_LOG_TYPE_ERROR, "%25s:%-5d Invalid operation. impl(%p) ClientAPIClutch(%d)", buf, 0x22u);
    }

  }
LABEL_18:
  if (v13)
  {
    p_shared_owners = (unint64_t *)&v13->__shared_owners_;
    do
      v11 = __ldaxr(p_shared_owners);
    while (__stlxr(v11 - 1, p_shared_owners));
    if (!v11)
    {
      ((void (*)())v13->__on_zero_shared)();
      std::__shared_weak_count::__release_weak(v13);
    }
  }

}

- (BOOL)enableSmartRoutingConsiderationForStream:(unint64_t)a3 enable:(BOOL)a4 error:(id *)a5
{
  _BOOL4 v6;
  NSObject *v9;
  id v10;
  NSObject *v11;
  id v12;
  _BOOL4 mClientAPIClutch;
  int v14;
  int v15;
  unint64_t *p_shared_owners;
  unint64_t v17;
  ControllerImpl *v19;
  std::__shared_weak_count *v20;
  uint8_t buf[4];
  const char *v22;
  __int16 v23;
  int v24;
  __int16 v25;
  AVVoiceController *v26;
  __int16 v27;
  unint64_t v28;
  __int16 v29;
  _BOOL4 v30;
  _BYTE v31[160];
  uint64_t v32;

  v6 = a4;
  v32 = *MEMORY[0x1E0C80C00];
  ElapsedTime::ElapsedTime((ElapsedTime *)v31, "-[AVVoiceController enableSmartRoutingConsiderationForStream:enable:error:]", 0, 0);
  if (kAVVCScope)
  {
    v9 = *(id *)kAVVCScope;
    if (!v9)
      goto LABEL_8;
  }
  else
  {
    v9 = MEMORY[0x1E0C81028];
    v10 = MEMORY[0x1E0C81028];
  }
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136316162;
    v22 = "AVVoiceController.mm";
    v23 = 1024;
    v24 = 1660;
    v25 = 2048;
    v26 = self;
    v27 = 2048;
    v28 = a3;
    v29 = 1024;
    v30 = v6;
    _os_log_impl(&dword_19B733000, v9, OS_LOG_TYPE_DEFAULT, "%25s:%-5d #### AVVoiceController[self = %p]: enableSmartRoutingConsideration: streamHandle(%lu), enable : %d", buf, 0x2Cu);
  }

LABEL_8:
  -[AVVoiceController impl](self, "impl");
  if (v19 && !self->mClientAPIClutch)
  {
    v14 = ControllerImpl::enableSmartRoutingConsideration(v19, a3, v6);
    v15 = v14;
    if (a5 && v14)
    {
      objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CB2F90], v14, 0);
      *a5 = (id)objc_claimAutoreleasedReturnValue();
    }
    LOBYTE(v11) = v15 == 0;
  }
  else
  {
    if (kAVVCScope)
    {
      v11 = *(id *)kAVVCScope;
      if (!v11)
        goto LABEL_21;
    }
    else
    {
      v11 = MEMORY[0x1E0C81028];
      v12 = MEMORY[0x1E0C81028];
    }
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      mClientAPIClutch = self->mClientAPIClutch;
      *(_DWORD *)buf = 136315906;
      v22 = "AVVoiceController.mm";
      v23 = 1024;
      v24 = 1662;
      v25 = 2048;
      v26 = (AVVoiceController *)v19;
      v27 = 1024;
      LODWORD(v28) = mClientAPIClutch;
      _os_log_impl(&dword_19B733000, v11, OS_LOG_TYPE_ERROR, "%25s:%-5d Invalid operation. impl(%p) ClientAPIClutch(%d)", buf, 0x22u);
    }

    LOBYTE(v11) = 0;
  }
LABEL_21:
  if (v20)
  {
    p_shared_owners = (unint64_t *)&v20->__shared_owners_;
    do
      v17 = __ldaxr(p_shared_owners);
    while (__stlxr(v17 - 1, p_shared_owners));
    if (!v17)
    {
      ((void (*)())v20->__on_zero_shared)();
      std::__shared_weak_count::__release_weak(v20);
    }
  }
  ElapsedTime::~ElapsedTime((ElapsedTime *)v31);
  return (char)v11;
}

- (BOOL)setRecordModeForStream:(unint64_t)a3 recordMode:(int64_t)a4 error:(id *)a5
{
  NSObject *v9;
  id v10;
  NSObject *v11;
  id v12;
  _BOOL4 mClientAPIClutch;
  int v14;
  int v15;
  unint64_t *p_shared_owners;
  unint64_t v17;
  uint64_t v19;
  std::__shared_weak_count *v20;
  int v21;
  char v22;
  __int128 v23;
  __int128 v24;
  uint8_t buf[4];
  const char *v26;
  __int16 v27;
  int v28;
  __int16 v29;
  AVVoiceController *v30;
  __int16 v31;
  unint64_t v32;
  __int16 v33;
  int v34;
  _BYTE v35[160];
  uint64_t v36;

  v36 = *MEMORY[0x1E0C80C00];
  v21 = 4122;
  v22 = 1;
  v23 = 0u;
  v24 = 0u;
  kdebug_trace();
  ElapsedTime::ElapsedTime((ElapsedTime *)v35, "-[AVVoiceController setRecordModeForStream:recordMode:error:]", 0, 0);
  if (kAVVCScope)
  {
    v9 = *(id *)kAVVCScope;
    if (!v9)
      goto LABEL_8;
  }
  else
  {
    v9 = MEMORY[0x1E0C81028];
    v10 = MEMORY[0x1E0C81028];
  }
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136316162;
    v26 = "AVVoiceController.mm";
    v27 = 1024;
    v28 = 1680;
    v29 = 2048;
    v30 = self;
    v31 = 2048;
    v32 = a3;
    v33 = 1024;
    v34 = a4;
    _os_log_impl(&dword_19B733000, v9, OS_LOG_TYPE_DEFAULT, "%25s:%-5d #### AVVoiceController[self = %p]: setRecordModeForStream: streamHandle(%lu), mode : %d", buf, 0x2Cu);
  }

LABEL_8:
  if (!a4)
  {
    LOBYTE(v11) = 0;
    goto LABEL_28;
  }
  -[AVVoiceController impl](self, "impl");
  if (v19 && !self->mClientAPIClutch)
  {
    v14 = ControllerImpl::setRecordModeForStream(v19, a3, a4);
    v15 = v14;
    if (a5 && v14)
    {
      objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CB2F90], v14, 0);
      *a5 = (id)objc_claimAutoreleasedReturnValue();
    }
    LOBYTE(v11) = v15 == 0;
    goto LABEL_23;
  }
  if (!kAVVCScope)
  {
    v11 = MEMORY[0x1E0C81028];
    v12 = MEMORY[0x1E0C81028];
    goto LABEL_16;
  }
  v11 = *(id *)kAVVCScope;
  if (v11)
  {
LABEL_16:
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      mClientAPIClutch = self->mClientAPIClutch;
      *(_DWORD *)buf = 136315906;
      v26 = "AVVoiceController.mm";
      v27 = 1024;
      v28 = 1686;
      v29 = 2048;
      v30 = (AVVoiceController *)v19;
      v31 = 1024;
      LODWORD(v32) = mClientAPIClutch;
      _os_log_impl(&dword_19B733000, v11, OS_LOG_TYPE_ERROR, "%25s:%-5d Invalid operation. impl(%p) ClientAPIClutch(%d)", buf, 0x22u);
    }

    LOBYTE(v11) = 0;
  }
LABEL_23:
  if (v20)
  {
    p_shared_owners = (unint64_t *)&v20->__shared_owners_;
    do
      v17 = __ldaxr(p_shared_owners);
    while (__stlxr(v17 - 1, p_shared_owners));
    if (!v17)
    {
      ((void (*)())v20->__on_zero_shared)();
      std::__shared_weak_count::__release_weak(v20);
    }
  }
LABEL_28:
  ElapsedTime::~ElapsedTime((ElapsedTime *)v35);
  TraceWrapper::~TraceWrapper((TraceWrapper *)&v21);
  return (char)v11;
}

- (int64_t)getRecordModeForStream:(unint64_t)a3
{
  NSObject *v5;
  id v6;
  NSObject *v7;
  id v8;
  _BOOL4 mClientAPIClutch;
  int64_t RecordModeForStream;
  unint64_t *p_shared_owners;
  unint64_t v12;
  ControllerImpl *v14;
  std::__shared_weak_count *v15;
  uint8_t buf[4];
  const char *v17;
  __int16 v18;
  int v19;
  __int16 v20;
  AVVoiceController *v21;
  __int16 v22;
  unint64_t v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  if (kAVVCScope)
  {
    v5 = *(id *)kAVVCScope;
    if (!v5)
      goto LABEL_8;
  }
  else
  {
    v5 = MEMORY[0x1E0C81028];
    v6 = MEMORY[0x1E0C81028];
  }
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315906;
    v17 = "AVVoiceController.mm";
    v18 = 1024;
    v19 = 1701;
    v20 = 2048;
    v21 = self;
    v22 = 2048;
    v23 = a3;
    _os_log_impl(&dword_19B733000, v5, OS_LOG_TYPE_DEFAULT, "%25s:%-5d #### AVVoiceController[self = %p]: getRecordModeForStream: streamHandle(%lu)", buf, 0x26u);
  }

LABEL_8:
  -[AVVoiceController impl](self, "impl");
  if (v14 && !self->mClientAPIClutch)
  {
    RecordModeForStream = ControllerImpl::getRecordModeForStream(v14, a3);
    goto LABEL_19;
  }
  if (!kAVVCScope)
  {
    v7 = MEMORY[0x1E0C81028];
    v8 = MEMORY[0x1E0C81028];
    goto LABEL_14;
  }
  v7 = *(id *)kAVVCScope;
  if (v7)
  {
LABEL_14:
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      mClientAPIClutch = self->mClientAPIClutch;
      *(_DWORD *)buf = 136315906;
      v17 = "AVVoiceController.mm";
      v18 = 1024;
      v19 = 1703;
      v20 = 2048;
      v21 = (AVVoiceController *)v14;
      v22 = 1024;
      LODWORD(v23) = mClientAPIClutch;
      _os_log_impl(&dword_19B733000, v7, OS_LOG_TYPE_ERROR, "%25s:%-5d Invalid operation. impl(%p) ClientAPIClutch(%d)", buf, 0x22u);
    }

  }
  RecordModeForStream = 0;
LABEL_19:
  if (v15)
  {
    p_shared_owners = (unint64_t *)&v15->__shared_owners_;
    do
      v12 = __ldaxr(p_shared_owners);
    while (__stlxr(v12 - 1, p_shared_owners));
    if (!v12)
    {
      ((void (*)())v15->__on_zero_shared)();
      std::__shared_weak_count::__release_weak(v15);
    }
  }
  return RecordModeForStream;
}

- (BOOL)setAnnounceCallsEnabledForStream:(unint64_t)a3 enable:(BOOL)a4
{
  _BOOL4 v4;
  NSObject *v7;
  id v8;
  NSObject *v9;
  id v10;
  _BOOL4 mClientAPIClutch;
  BOOL v12;
  unint64_t *p_shared_owners;
  unint64_t v14;
  ControllerImpl *v16;
  std::__shared_weak_count *v17;
  uint8_t buf[4];
  const char *v19;
  __int16 v20;
  int v21;
  __int16 v22;
  AVVoiceController *v23;
  __int16 v24;
  unint64_t v25;
  __int16 v26;
  _BOOL4 v27;
  uint64_t v28;

  v4 = a4;
  v28 = *MEMORY[0x1E0C80C00];
  if (kAVVCScope)
  {
    v7 = *(id *)kAVVCScope;
    if (!v7)
      goto LABEL_8;
  }
  else
  {
    v7 = MEMORY[0x1E0C81028];
    v8 = MEMORY[0x1E0C81028];
  }
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136316162;
    v19 = "AVVoiceController.mm";
    v20 = 1024;
    v21 = 1715;
    v22 = 2048;
    v23 = self;
    v24 = 2048;
    v25 = a3;
    v26 = 1024;
    v27 = v4;
    _os_log_impl(&dword_19B733000, v7, OS_LOG_TYPE_DEFAULT, "%25s:%-5d #### AVVoiceController[self = %p]: setAnnounceCallsEnabledForStream: streamHandle(%lu), enable : %d", buf, 0x2Cu);
  }

LABEL_8:
  -[AVVoiceController impl](self, "impl");
  if (v16 && !self->mClientAPIClutch)
  {
    v12 = ControllerImpl::setAnnounceCallsEnabledForStream(v16, a3, v4) == 0;
    goto LABEL_19;
  }
  if (!kAVVCScope)
  {
    v9 = MEMORY[0x1E0C81028];
    v10 = MEMORY[0x1E0C81028];
    goto LABEL_14;
  }
  v9 = *(id *)kAVVCScope;
  if (v9)
  {
LABEL_14:
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      mClientAPIClutch = self->mClientAPIClutch;
      *(_DWORD *)buf = 136315906;
      v19 = "AVVoiceController.mm";
      v20 = 1024;
      v21 = 1717;
      v22 = 2048;
      v23 = (AVVoiceController *)v16;
      v24 = 1024;
      LODWORD(v25) = mClientAPIClutch;
      _os_log_impl(&dword_19B733000, v9, OS_LOG_TYPE_ERROR, "%25s:%-5d Invalid operation. impl(%p) ClientAPIClutch(%d)", buf, 0x22u);
    }

  }
  v12 = 0;
LABEL_19:
  if (v17)
  {
    p_shared_owners = (unint64_t *)&v17->__shared_owners_;
    do
      v14 = __ldaxr(p_shared_owners);
    while (__stlxr(v14 - 1, p_shared_owners));
    if (!v14)
    {
      ((void (*)())v17->__on_zero_shared)();
      std::__shared_weak_count::__release_weak(v17);
    }
  }
  return v12;
}

- (void)getInputChannelInfoForStream:(unint64_t)a3 completion:(id)a4
{
  id v6;
  NSObject *v7;
  id v8;
  void *v9;
  unint64_t *p_shared_owners;
  unint64_t v11;
  uint64_t v12;
  std::__shared_weak_count *v13;
  uint8_t buf[4];
  const char *v15;
  __int16 v16;
  int v17;
  __int16 v18;
  AVVoiceController *v19;
  __int16 v20;
  unint64_t v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v6 = a4;
  -[AVVoiceController impl](self, "impl");
  if (kAVVCScope)
  {
    v7 = *(id *)kAVVCScope;
    if (!v7)
      goto LABEL_8;
  }
  else
  {
    v7 = MEMORY[0x1E0C81028];
    v8 = MEMORY[0x1E0C81028];
  }
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315906;
    v15 = "AVVoiceController.mm";
    v16 = 1024;
    v17 = 1728;
    v18 = 2048;
    v19 = self;
    v20 = 2048;
    v21 = a3;
    _os_log_impl(&dword_19B733000, v7, OS_LOG_TYPE_DEFAULT, "%25s:%-5d #### AVVoiceController[self = %p]: getInputChannelInfoForStream: streamHandle(%lu)", buf, 0x26u);
  }

LABEL_8:
  if (v12 && !self->mClientAPIClutch)
  {
    ControllerImpl::getInputChannelInfoForStream(v12, v6);
  }
  else if (v6)
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CB2F90], -11780, 0);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    (*((void (**)(id, _QWORD, void *))v6 + 2))(v6, 0, v9);

  }
  if (v13)
  {
    p_shared_owners = (unint64_t *)&v13->__shared_owners_;
    do
      v11 = __ldaxr(p_shared_owners);
    while (__stlxr(v11 - 1, p_shared_owners));
    if (!v11)
    {
      ((void (*)())v13->__on_zero_shared)();
      std::__shared_weak_count::__release_weak(v13);
    }
  }

}

- (BOOL)setDuckOthersForStream:(unint64_t)a3 withSettings:(id)a4 error:(id *)a5
{
  id v8;
  NSObject *v9;
  id v10;
  NSObject *v11;
  id v12;
  _BOOL4 mClientAPIClutch;
  id v14;
  char v15;
  std::__shared_weak_count *v16;
  unint64_t *p_shared_owners;
  unint64_t v18;
  id v20;
  id v21;
  AVVoiceController *v22;
  std::__shared_weak_count *v23;
  uint8_t buf[4];
  const char *v25;
  __int16 v26;
  int v27;
  __int16 v28;
  AVVoiceController *v29;
  __int16 v30;
  unint64_t v31;
  __int16 v32;
  id v33;
  _BYTE v34[160];
  uint64_t v35;

  v35 = *MEMORY[0x1E0C80C00];
  v8 = a4;
  ElapsedTime::ElapsedTime((ElapsedTime *)v34, "-[AVVoiceController setDuckOthersForStream:withSettings:error:]", 0, 0);
  if (kAVVCScope)
  {
    v9 = *(id *)kAVVCScope;
    if (!v9)
      goto LABEL_8;
  }
  else
  {
    v9 = MEMORY[0x1E0C81028];
    v10 = MEMORY[0x1E0C81028];
  }
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136316162;
    v25 = "AVVoiceController.mm";
    v26 = 1024;
    v27 = 1743;
    v28 = 2048;
    v29 = self;
    v30 = 2048;
    v31 = a3;
    v32 = 2112;
    v33 = v8;
    _os_log_impl(&dword_19B733000, v9, OS_LOG_TYPE_DEFAULT, "%25s:%-5d #### AVVoiceController[self = %p]: setDuckOthersForStream: streamHandle(%lu), duckSettings(%@)", buf, 0x30u);
  }

LABEL_8:
  -[AVVoiceController impl](self, "impl");
  if (!v22 || self->mClientAPIClutch)
  {
    if (kAVVCScope)
    {
      v11 = *(id *)kAVVCScope;
      if (!v11)
      {
LABEL_17:
        v14 = 0;
        v15 = 0;
        goto LABEL_18;
      }
    }
    else
    {
      v11 = MEMORY[0x1E0C81028];
      v12 = MEMORY[0x1E0C81028];
    }
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      mClientAPIClutch = self->mClientAPIClutch;
      *(_DWORD *)buf = 136315906;
      v25 = "AVVoiceController.mm";
      v26 = 1024;
      v27 = 1745;
      v28 = 2048;
      v29 = v22;
      v30 = 1024;
      LODWORD(v31) = mClientAPIClutch;
      _os_log_impl(&dword_19B733000, v11, OS_LOG_TYPE_ERROR, "%25s:%-5d Invalid operation. impl(%p) ClientAPIClutch(%d)", buf, 0x22u);
    }

    goto LABEL_17;
  }
  v21 = 0;
  v15 = ControllerImpl::setDuckOthersForStream((uint64_t)v22, a3, v8, &v21);
  v20 = v21;
  v14 = v20;
  if (a5)
  {
    v14 = objc_retainAutorelease(v20);
    *a5 = v14;
  }
LABEL_18:
  v16 = v23;
  if (v23)
  {
    p_shared_owners = (unint64_t *)&v23->__shared_owners_;
    do
      v18 = __ldaxr(p_shared_owners);
    while (__stlxr(v18 - 1, p_shared_owners));
    if (!v18)
    {
      ((void (*)(std::__shared_weak_count *))v16->__on_zero_shared)(v16);
      std::__shared_weak_count::__release_weak(v16);
    }
  }

  ElapsedTime::~ElapsedTime((ElapsedTime *)v34);
  return v15;
}

- (BOOL)isDuckingSupportedOnPickedRouteForStream:(unint64_t)a3 error:(id *)a4
{
  uint64_t v7;
  NSObject *v8;
  id v9;
  _BOOL4 mClientAPIClutch;
  id v11;
  char isDuckingSupportedOnPickedRouteForStream;
  std::__shared_weak_count *v13;
  unint64_t *p_shared_owners;
  unint64_t v15;
  NSObject *v17;
  id v18;
  id v19;
  id v20;
  AVVoiceController *v21;
  std::__shared_weak_count *v22;
  uint8_t buf[4];
  const char *v24;
  __int16 v25;
  int v26;
  __int16 v27;
  AVVoiceController *v28;
  __int16 v29;
  unint64_t v30;
  _BYTE v31[160];
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  ElapsedTime::ElapsedTime((ElapsedTime *)v31, "-[AVVoiceController isDuckingSupportedOnPickedRouteForStream:error:]", 0, 0);
  -[AVVoiceController impl](self, "impl");
  v7 = (uint64_t)v21;
  if (!v21 || self->mClientAPIClutch)
  {
    if (kAVVCScope)
    {
      v8 = *(id *)kAVVCScope;
      if (!v8)
      {
LABEL_10:
        v11 = 0;
        isDuckingSupportedOnPickedRouteForStream = 0;
        goto LABEL_11;
      }
    }
    else
    {
      v8 = MEMORY[0x1E0C81028];
      v9 = MEMORY[0x1E0C81028];
    }
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      mClientAPIClutch = self->mClientAPIClutch;
      *(_DWORD *)buf = 136315906;
      v24 = "AVVoiceController.mm";
      v25 = 1024;
      v26 = 1759;
      v27 = 2048;
      v28 = v21;
      v29 = 1024;
      LODWORD(v30) = mClientAPIClutch;
      _os_log_impl(&dword_19B733000, v8, OS_LOG_TYPE_ERROR, "%25s:%-5d Invalid operation. impl(%p) ClientAPIClutch(%d)", buf, 0x22u);
    }

    goto LABEL_10;
  }
  if (!kAVVCScope)
  {
    v17 = MEMORY[0x1E0C81028];
    v18 = MEMORY[0x1E0C81028];
    goto LABEL_21;
  }
  v17 = *(id *)kAVVCScope;
  if (v17)
  {
LABEL_21:
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315906;
      v24 = "AVVoiceController.mm";
      v25 = 1024;
      v26 = 1760;
      v27 = 2048;
      v28 = self;
      v29 = 2048;
      v30 = a3;
      _os_log_impl(&dword_19B733000, v17, OS_LOG_TYPE_DEFAULT, "%25s:%-5d #### AVVoiceController[self = %p]: isDuckingSupportedOnPickedRouteForStream: streamHandle(%lu)", buf, 0x26u);
    }

    v7 = (uint64_t)v21;
  }
  v20 = 0;
  isDuckingSupportedOnPickedRouteForStream = ControllerImpl::isDuckingSupportedOnPickedRouteForStream(v7, a3, &v20);
  v19 = v20;
  v11 = v19;
  if (a4)
  {
    v11 = objc_retainAutorelease(v19);
    *a4 = v11;
  }
LABEL_11:
  v13 = v22;
  if (v22)
  {
    p_shared_owners = (unint64_t *)&v22->__shared_owners_;
    do
      v15 = __ldaxr(p_shared_owners);
    while (__stlxr(v15 - 1, p_shared_owners));
    if (!v15)
    {
      ((void (*)(std::__shared_weak_count *))v13->__on_zero_shared)(v13);
      std::__shared_weak_count::__release_weak(v13);
    }
  }

  ElapsedTime::~ElapsedTime((ElapsedTime *)v31);
  return isDuckingSupportedOnPickedRouteForStream;
}

- (void)enableTriangleModeForStream:(unint64_t)a3 enable:(BOOL)a4 withCompletion:(id)a5
{
  _BOOL4 v5;
  id v8;
  NSObject *v9;
  id v10;
  void *v11;
  unint64_t *p_shared_owners;
  unint64_t v13;
  uint64_t v14;
  std::__shared_weak_count *v15;
  uint8_t buf[4];
  const char *v17;
  __int16 v18;
  int v19;
  __int16 v20;
  AVVoiceController *v21;
  __int16 v22;
  unint64_t v23;
  __int16 v24;
  _BOOL4 v25;
  _BYTE v26[160];
  uint64_t v27;

  v5 = a4;
  v27 = *MEMORY[0x1E0C80C00];
  v8 = a5;
  ElapsedTime::ElapsedTime((ElapsedTime *)v26, "-[AVVoiceController enableTriangleModeForStream:enable:withCompletion:]", 0, 0);
  -[AVVoiceController impl](self, "impl");
  if (kAVVCScope)
  {
    v9 = *(id *)kAVVCScope;
    if (!v9)
      goto LABEL_8;
  }
  else
  {
    v9 = MEMORY[0x1E0C81028];
    v10 = MEMORY[0x1E0C81028];
  }
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136316162;
    v17 = "AVVoiceController.mm";
    v18 = 1024;
    v19 = 1774;
    v20 = 2048;
    v21 = self;
    v22 = 2048;
    v23 = a3;
    v24 = 1024;
    v25 = v5;
    _os_log_impl(&dword_19B733000, v9, OS_LOG_TYPE_DEFAULT, "%25s:%-5d #### AVVoiceController[self = %p]: enableTriangleModeForStream: streamHandle(%lu), opt value : %d", buf, 0x2Cu);
  }

LABEL_8:
  if (v14 && !self->mClientAPIClutch)
  {
    ControllerImpl::enableTriangleModeForStream(v14, a3, v5, v8);
  }
  else if (v8)
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CB2F90], -11780, 0);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    (*((void (**)(id, unint64_t, _QWORD, void *))v8 + 2))(v8, a3, 0, v11);

  }
  if (v15)
  {
    p_shared_owners = (unint64_t *)&v15->__shared_owners_;
    do
      v13 = __ldaxr(p_shared_owners);
    while (__stlxr(v13 - 1, p_shared_owners));
    if (!v13)
    {
      ((void (*)())v15->__on_zero_shared)();
      std::__shared_weak_count::__release_weak(v15);
    }
  }
  ElapsedTime::~ElapsedTime((ElapsedTime *)v26);

}

- (void)getPlaybackRouteForStream:(unint64_t)a3 withCompletion:(id)a4
{
  id v6;
  id v7;
  id v8;
  NSObject *v9;
  void *v10;
  uint64_t v11;
  std::__shared_weak_count *v12;
  unint64_t *v13;
  unint64_t v14;
  unint64_t *v15;
  unint64_t v16;
  std::__shared_weak_count *v17;
  unint64_t *p_shared_owners;
  unint64_t v19;
  _QWORD v20[4];
  id v21;
  uint64_t v22;
  std::__shared_weak_count *v23;
  unint64_t v24;
  _BYTE buf[18];
  __int16 v26;
  unint64_t v27;
  __int16 v28;
  void *v29;
  _BYTE v30[160];
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  v6 = a4;
  ElapsedTime::ElapsedTime((ElapsedTime *)v30, "-[AVVoiceController getPlaybackRouteForStream:withCompletion:]", 0, 0);
  if (kAVVCScope)
  {
    v7 = *(id *)kAVVCScope;
    if (!v7)
      goto LABEL_8;
  }
  else
  {
    v7 = (id)MEMORY[0x1E0C81028];
    v8 = MEMORY[0x1E0C81028];
  }
  v9 = v7;
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    v10 = _Block_copy(v6);
    *(_DWORD *)buf = 136315906;
    *(_QWORD *)&buf[4] = "AVVoiceController.mm";
    *(_WORD *)&buf[12] = 1024;
    *(_DWORD *)&buf[14] = 1786;
    v26 = 2048;
    v27 = a3;
    v28 = 2048;
    v29 = v10;
    _os_log_impl(&dword_19B733000, v9, OS_LOG_TYPE_DEFAULT, "%25s:%-5d ### getPlaybackRouteForStream: streamHandle(%lu) completionBlock(%p)", buf, 0x26u);

  }
LABEL_8:
  -[AVVoiceController impl](self, "impl");
  v11 = *(_QWORD *)buf;
  if (*(_QWORD *)buf && !self->mClientAPIClutch)
  {
    v20[0] = MEMORY[0x1E0C809B0];
    v20[1] = 3321888768;
    v20[2] = __62__AVVoiceController_getPlaybackRouteForStream_withCompletion___block_invoke;
    v20[3] = &unk_1E3BEA488;
    v22 = *(_QWORD *)buf;
    v23 = *(std::__shared_weak_count **)&buf[8];
    if (*(_QWORD *)&buf[8])
    {
      v15 = (unint64_t *)(*(_QWORD *)&buf[8] + 8);
      do
        v16 = __ldxr(v15);
      while (__stxr(v16 + 1, v15));
    }
    v24 = a3;
    v21 = v6;
    ControllerImpl::safeWork(v11, v20, (uint64_t)"-[AVVoiceController getPlaybackRouteForStream:withCompletion:]");

    v17 = v23;
    if (v23)
    {
      p_shared_owners = (unint64_t *)&v23->__shared_owners_;
      do
        v19 = __ldaxr(p_shared_owners);
      while (__stlxr(v19 - 1, p_shared_owners));
      if (!v19)
      {
        ((void (*)(std::__shared_weak_count *))v17->__on_zero_shared)(v17);
        std::__shared_weak_count::__release_weak(v17);
      }
    }
  }
  else if (v6)
  {
    (*((void (**)(id, _QWORD))v6 + 2))(v6, 0);
  }
  v12 = *(std::__shared_weak_count **)&buf[8];
  if (*(_QWORD *)&buf[8])
  {
    v13 = (unint64_t *)(*(_QWORD *)&buf[8] + 8);
    do
      v14 = __ldaxr(v13);
    while (__stlxr(v14 - 1, v13));
    if (!v14)
    {
      ((void (*)(std::__shared_weak_count *))v12->__on_zero_shared)(v12);
      std::__shared_weak_count::__release_weak(v12);
    }
  }
  ElapsedTime::~ElapsedTime((ElapsedTime *)v30);

}

- (id)getPlaybackRouteForStream:(unint64_t)a3 withError:(id *)a4
{
  NSObject *v6;
  id v7;
  NSObject *v8;
  id v9;
  _BOOL4 mClientAPIClutch;
  id v11;
  NSObject *v12;
  id v13;
  unint64_t *p_shared_owners;
  unint64_t v15;
  uint64_t v17;
  std::__shared_weak_count *v18;
  id v19;
  _BYTE buf[40];
  unint64_t v21;
  id *v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v19 = 0;
  if (kAVVCScope)
  {
    v6 = *(id *)kAVVCScope;
    if (!v6)
      goto LABEL_8;
  }
  else
  {
    v6 = MEMORY[0x1E0C81028];
    v7 = MEMORY[0x1E0C81028];
  }
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315650;
    *(_QWORD *)&buf[4] = "AVVoiceController.mm";
    *(_WORD *)&buf[12] = 1024;
    *(_DWORD *)&buf[14] = 1805;
    *(_WORD *)&buf[18] = 2048;
    *(_QWORD *)&buf[20] = a3;
    _os_log_impl(&dword_19B733000, v6, OS_LOG_TYPE_DEFAULT, "%25s:%-5d ### getPlaybackRouteForStream:withError: streamHandle(%lu)", buf, 0x1Cu);
  }

LABEL_8:
  -[AVVoiceController impl](self, "impl");
  if (v17 && !self->mClientAPIClutch)
  {
    *(_QWORD *)buf = MEMORY[0x1E0C809B0];
    *(_QWORD *)&buf[8] = 3221225472;
    *(_QWORD *)&buf[16] = ___ZN14ControllerImpl16getPlaybackRouteEPU8__strongP8NSStringm_block_invoke;
    *(_QWORD *)&buf[24] = &__block_descriptor_56_e41_v16__0__NSObject_OS_dispatch_semaphore__8l;
    *(_QWORD *)&buf[32] = v17;
    v21 = a3;
    v22 = &v19;
    makeSynchronous(buf);
    if (kAVVCScope)
    {
      v12 = *(id *)kAVVCScope;
      if (!v12)
      {
LABEL_25:
        v11 = v19;
        goto LABEL_26;
      }
    }
    else
    {
      v12 = MEMORY[0x1E0C81028];
      v13 = MEMORY[0x1E0C81028];
    }
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315650;
      *(_QWORD *)&buf[4] = "AVVoiceController.mm";
      *(_WORD *)&buf[12] = 1024;
      *(_DWORD *)&buf[14] = 1812;
      *(_WORD *)&buf[18] = 2112;
      *(_QWORD *)&buf[20] = v19;
      _os_log_impl(&dword_19B733000, v12, OS_LOG_TYPE_DEFAULT, "%25s:%-5d Playback route: %@", buf, 0x1Cu);
    }

    goto LABEL_25;
  }
  if (!kAVVCScope)
  {
    v8 = MEMORY[0x1E0C81028];
    v9 = MEMORY[0x1E0C81028];
    goto LABEL_14;
  }
  v8 = *(id *)kAVVCScope;
  if (v8)
  {
LABEL_14:
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      mClientAPIClutch = self->mClientAPIClutch;
      *(_DWORD *)buf = 136315906;
      *(_QWORD *)&buf[4] = "AVVoiceController.mm";
      *(_WORD *)&buf[12] = 1024;
      *(_DWORD *)&buf[14] = 1807;
      *(_WORD *)&buf[18] = 2048;
      *(_QWORD *)&buf[20] = v17;
      *(_WORD *)&buf[28] = 1024;
      *(_DWORD *)&buf[30] = mClientAPIClutch;
      _os_log_impl(&dword_19B733000, v8, OS_LOG_TYPE_ERROR, "%25s:%-5d Invalid operation. impl(%p) ClientAPIClutch(%d)", buf, 0x22u);
    }

  }
  v11 = 0;
LABEL_26:
  if (v18)
  {
    p_shared_owners = (unint64_t *)&v18->__shared_owners_;
    do
      v15 = __ldaxr(p_shared_owners);
    while (__stlxr(v15 - 1, p_shared_owners));
    if (!v15)
    {
      ((void (*)())v18->__on_zero_shared)();
      std::__shared_weak_count::__release_weak(v18);
    }
  }

  return v11;
}

- (void)startKeepAliveQueueForStream:(unint64_t)a3 completion:(id)a4
{
  id v6;
  id v7;
  id v8;
  NSObject *v9;
  void *v10;
  void *v11;
  unint64_t *p_shared_owners;
  unint64_t v13;
  uint64_t v14;
  std::__shared_weak_count *v15;
  uint8_t buf[4];
  const char *v17;
  __int16 v18;
  int v19;
  __int16 v20;
  AVVoiceController *v21;
  __int16 v22;
  unint64_t v23;
  __int16 v24;
  void *v25;
  _BYTE v26[160];
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v6 = a4;
  ElapsedTime::ElapsedTime((ElapsedTime *)v26, "-[AVVoiceController startKeepAliveQueueForStream:completion:]", 0, 0);
  -[AVVoiceController impl](self, "impl");
  if (kAVVCScope)
  {
    v7 = *(id *)kAVVCScope;
    if (!v7)
      goto LABEL_8;
  }
  else
  {
    v7 = (id)MEMORY[0x1E0C81028];
    v8 = MEMORY[0x1E0C81028];
  }
  v9 = v7;
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    v10 = _Block_copy(v6);
    *(_DWORD *)buf = 136316162;
    v17 = "AVVoiceController.mm";
    v18 = 1024;
    v19 = 1821;
    v20 = 2048;
    v21 = self;
    v22 = 2048;
    v23 = a3;
    v24 = 2048;
    v25 = v10;
    _os_log_impl(&dword_19B733000, v9, OS_LOG_TYPE_DEFAULT, "%25s:%-5d #### AVVoiceController[self = %p]: startKeepAliveQueueForStream: streamHandle(%lu) completion(%p)", buf, 0x30u);

  }
LABEL_8:
  if (v14 && !self->mClientAPIClutch)
  {
    ControllerImpl::startKeepAliveQueueForStream(v14, a3, v6);
  }
  else if (v6)
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CB2F90], -11780, 0);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    (*((void (**)(id, unint64_t, _QWORD, void *))v6 + 2))(v6, a3, 0, v11);

  }
  if (v15)
  {
    p_shared_owners = (unint64_t *)&v15->__shared_owners_;
    do
      v13 = __ldaxr(p_shared_owners);
    while (__stlxr(v13 - 1, p_shared_owners));
    if (!v13)
    {
      ((void (*)())v15->__on_zero_shared)();
      std::__shared_weak_count::__release_weak(v15);
    }
  }
  ElapsedTime::~ElapsedTime((ElapsedTime *)v26);

}

- (void)stopKeepAliveQueueForStream:(unint64_t)a3 completion:(id)a4
{
  id v6;
  id v7;
  id v8;
  NSObject *v9;
  void *v10;
  void *v11;
  unint64_t *p_shared_owners;
  unint64_t v13;
  uint64_t v14;
  std::__shared_weak_count *v15;
  uint8_t buf[4];
  const char *v17;
  __int16 v18;
  int v19;
  __int16 v20;
  AVVoiceController *v21;
  __int16 v22;
  unint64_t v23;
  __int16 v24;
  void *v25;
  _BYTE v26[160];
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v6 = a4;
  ElapsedTime::ElapsedTime((ElapsedTime *)v26, "-[AVVoiceController stopKeepAliveQueueForStream:completion:]", 0, 0);
  -[AVVoiceController impl](self, "impl");
  if (kAVVCScope)
  {
    v7 = *(id *)kAVVCScope;
    if (!v7)
      goto LABEL_8;
  }
  else
  {
    v7 = (id)MEMORY[0x1E0C81028];
    v8 = MEMORY[0x1E0C81028];
  }
  v9 = v7;
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    v10 = _Block_copy(v6);
    *(_DWORD *)buf = 136316162;
    v17 = "AVVoiceController.mm";
    v18 = 1024;
    v19 = 1834;
    v20 = 2048;
    v21 = self;
    v22 = 2048;
    v23 = a3;
    v24 = 2048;
    v25 = v10;
    _os_log_impl(&dword_19B733000, v9, OS_LOG_TYPE_DEFAULT, "%25s:%-5d #### AVVoiceController[self = %p]: stopKeepAliveQueueForStream: streamHandle(%lu) completion(%p)", buf, 0x30u);

  }
LABEL_8:
  if (v14 && !self->mClientAPIClutch)
  {
    ControllerImpl::stopKeepAliveQueueForStream(v14, a3, v6);
  }
  else if (v6)
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CB2F90], -11780, 0);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    (*((void (**)(id, unint64_t, _QWORD, void *))v6 + 2))(v6, a3, 0, v11);

  }
  if (v15)
  {
    p_shared_owners = (unint64_t *)&v15->__shared_owners_;
    do
      v13 = __ldaxr(p_shared_owners);
    while (__stlxr(v13 - 1, p_shared_owners));
    if (!v13)
    {
      ((void (*)())v15->__on_zero_shared)();
      std::__shared_weak_count::__release_weak(v15);
    }
  }
  ElapsedTime::~ElapsedTime((ElapsedTime *)v26);

}

- (void)getDeviceLatenciesForStream:(unint64_t)a3 withCompletion:(id)a4
{
  id v6;
  id v7;
  id v8;
  NSObject *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  std::__shared_weak_count *v13;
  unint64_t *v14;
  unint64_t v15;
  unint64_t *v16;
  unint64_t v17;
  std::__shared_weak_count *v18;
  unint64_t *p_shared_owners;
  unint64_t v20;
  _QWORD v21[4];
  id v22;
  uint64_t v23;
  std::__shared_weak_count *v24;
  unint64_t v25;
  _BYTE buf[18];
  __int16 v27;
  AVVoiceController *v28;
  __int16 v29;
  unint64_t v30;
  __int16 v31;
  void *v32;
  _BYTE v33[160];
  uint64_t v34;

  v34 = *MEMORY[0x1E0C80C00];
  v6 = a4;
  ElapsedTime::ElapsedTime((ElapsedTime *)v33, "-[AVVoiceController getDeviceLatenciesForStream:withCompletion:]", 0, 0);
  if (kAVVCScope)
  {
    v7 = *(id *)kAVVCScope;
    if (!v7)
      goto LABEL_8;
  }
  else
  {
    v7 = (id)MEMORY[0x1E0C81028];
    v8 = MEMORY[0x1E0C81028];
  }
  v9 = v7;
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    v10 = _Block_copy(v6);
    *(_DWORD *)buf = 136316162;
    *(_QWORD *)&buf[4] = "AVVoiceController.mm";
    *(_WORD *)&buf[12] = 1024;
    *(_DWORD *)&buf[14] = 1846;
    v27 = 2048;
    v28 = self;
    v29 = 2048;
    v30 = a3;
    v31 = 2048;
    v32 = v10;
    _os_log_impl(&dword_19B733000, v9, OS_LOG_TYPE_DEFAULT, "%25s:%-5d #### AVVoiceController[self = %p]: getDeviceLatenciesForStream: streamHandle(%lu), completionBlock(%p)", buf, 0x30u);

  }
LABEL_8:
  -[AVVoiceController impl](self, "impl");
  v11 = *(_QWORD *)buf;
  if (*(_QWORD *)buf && !self->mClientAPIClutch)
  {
    v21[0] = MEMORY[0x1E0C809B0];
    v21[1] = 3321888768;
    v21[2] = __64__AVVoiceController_getDeviceLatenciesForStream_withCompletion___block_invoke;
    v21[3] = &unk_1E3BEA488;
    v23 = *(_QWORD *)buf;
    v24 = *(std::__shared_weak_count **)&buf[8];
    if (*(_QWORD *)&buf[8])
    {
      v16 = (unint64_t *)(*(_QWORD *)&buf[8] + 8);
      do
        v17 = __ldxr(v16);
      while (__stxr(v17 + 1, v16));
    }
    v25 = a3;
    v22 = v6;
    ControllerImpl::safeWork(v11, v21, (uint64_t)"-[AVVoiceController getDeviceLatenciesForStream:withCompletion:]");

    v18 = v24;
    if (v24)
    {
      p_shared_owners = (unint64_t *)&v24->__shared_owners_;
      do
        v20 = __ldaxr(p_shared_owners);
      while (__stlxr(v20 - 1, p_shared_owners));
      if (!v20)
      {
        ((void (*)(std::__shared_weak_count *))v18->__on_zero_shared)(v18);
        std::__shared_weak_count::__release_weak(v18);
      }
    }
  }
  else if (v6)
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CB2F90], -11780, 0);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    (*((void (**)(id, _QWORD, void *))v6 + 2))(v6, 0, v12);

  }
  v13 = *(std::__shared_weak_count **)&buf[8];
  if (*(_QWORD *)&buf[8])
  {
    v14 = (unint64_t *)(*(_QWORD *)&buf[8] + 8);
    do
      v15 = __ldaxr(v14);
    while (__stlxr(v15 - 1, v14));
    if (!v15)
    {
      ((void (*)(std::__shared_weak_count *))v13->__on_zero_shared)(v13);
      std::__shared_weak_count::__release_weak(v13);
    }
  }
  ElapsedTime::~ElapsedTime((ElapsedTime *)v33);

}

- (BOOL)setEnableInterruptionByRecordingClientsForStream:(unint64_t)a3 enable:(BOOL)a4 error:(id *)a5
{
  _BOOL4 v6;
  NSObject *v9;
  id v10;
  int v11;
  int v12;
  std::__shared_weak_count *v13;
  unint64_t *v14;
  unint64_t v15;
  unint64_t *p_shared_owners;
  unint64_t v18;
  std::__shared_weak_count *v19;
  unint64_t *v20;
  unint64_t v21;
  _QWORD v22[6];
  std::__shared_weak_count *v23;
  unint64_t v24;
  BOOL v25;
  uint64_t v26;
  std::__shared_weak_count *v27;
  _BYTE buf[28];
  __int16 v29;
  unint64_t v30;
  __int16 v31;
  _BOOL4 v32;
  _BYTE v33[160];
  uint64_t v34;

  v6 = a4;
  v34 = *MEMORY[0x1E0C80C00];
  ElapsedTime::ElapsedTime((ElapsedTime *)v33, "-[AVVoiceController setEnableInterruptionByRecordingClientsForStream:enable:error:]", 0, 0);
  if (kAVVCScope)
  {
    v9 = *(id *)kAVVCScope;
    if (!v9)
      goto LABEL_8;
  }
  else
  {
    v9 = MEMORY[0x1E0C81028];
    v10 = MEMORY[0x1E0C81028];
  }
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136316162;
    *(_QWORD *)&buf[4] = "AVVoiceController.mm";
    *(_WORD *)&buf[12] = 1024;
    *(_DWORD *)&buf[14] = 1861;
    *(_WORD *)&buf[18] = 2048;
    *(_QWORD *)&buf[20] = self;
    v29 = 2048;
    v30 = a3;
    v31 = 1024;
    v32 = v6;
    _os_log_impl(&dword_19B733000, v9, OS_LOG_TYPE_DEFAULT, "%25s:%-5d #### AVVoiceController[self = %p]: setEnableInterruptionByRecordingClientForStream: streamHandle(%lu) enable(%d)", buf, 0x2Cu);
  }

LABEL_8:
  -[AVVoiceController impl](self, "impl");
  *(_QWORD *)buf = 0;
  *(_QWORD *)&buf[8] = buf;
  *(_QWORD *)&buf[16] = 0x2020000000;
  *(_DWORD *)&buf[24] = 0;
  if (v26 && !self->mClientAPIClutch)
  {
    v22[0] = MEMORY[0x1E0C809B0];
    v22[1] = 3321888768;
    v22[2] = __83__AVVoiceController_setEnableInterruptionByRecordingClientsForStream_enable_error___block_invoke;
    v22[3] = &unk_1E3BE5148;
    v22[4] = buf;
    v22[5] = v26;
    v23 = v27;
    if (v27)
    {
      p_shared_owners = (unint64_t *)&v27->__shared_owners_;
      do
        v18 = __ldxr(p_shared_owners);
      while (__stxr(v18 + 1, p_shared_owners));
    }
    v24 = a3;
    v25 = v6;
    ControllerImpl::safeWork(v26, v22, (uint64_t)"-[AVVoiceController setEnableInterruptionByRecordingClientsForStream:enable:error:]");
    v19 = v23;
    if (v23)
    {
      v20 = (unint64_t *)&v23->__shared_owners_;
      do
        v21 = __ldaxr(v20);
      while (__stlxr(v21 - 1, v20));
      if (!v21)
      {
        ((void (*)(std::__shared_weak_count *))v19->__on_zero_shared)(v19);
        std::__shared_weak_count::__release_weak(v19);
      }
    }
  }
  else
  {
    *(_DWORD *)&buf[24] = -11780;
  }
  v11 = *(_DWORD *)(*(_QWORD *)&buf[8] + 24);
  v12 = v11;
  if (a5 && v11)
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CB2F90], v11, 0);
    *a5 = (id)objc_claimAutoreleasedReturnValue();
  }
  _Block_object_dispose(buf, 8);
  v13 = v27;
  if (v27)
  {
    v14 = (unint64_t *)&v27->__shared_owners_;
    do
      v15 = __ldaxr(v14);
    while (__stlxr(v15 - 1, v14));
    if (!v15)
    {
      ((void (*)(std::__shared_weak_count *))v13->__on_zero_shared)(v13);
      std::__shared_weak_count::__release_weak(v13);
    }
  }
  ElapsedTime::~ElapsedTime((ElapsedTime *)v33);
  return v12 == 0;
}

- (id)mockPluginEndpoint
{
  NSObject *v3;
  id v4;
  _BOOL4 mClientAPIClutch;
  void *v6;
  unint64_t *p_shared_owners;
  unint64_t v8;
  uint64_t v10;
  std::__shared_weak_count *v11;
  uint8_t buf[4];
  const char *v13;
  __int16 v14;
  int v15;
  __int16 v16;
  uint64_t v17;
  __int16 v18;
  _BOOL4 v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  -[AVVoiceController impl](self, "impl");
  if (v10 && !self->mClientAPIClutch)
  {
    objc_msgSend(*(id *)(v10 + 464), "mockPluginEndpoint");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    goto LABEL_12;
  }
  if (!kAVVCScope)
  {
    v3 = MEMORY[0x1E0C81028];
    v4 = MEMORY[0x1E0C81028];
    goto LABEL_7;
  }
  v3 = *(id *)kAVVCScope;
  if (v3)
  {
LABEL_7:
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    {
      mClientAPIClutch = self->mClientAPIClutch;
      *(_DWORD *)buf = 136315906;
      v13 = "AVVoiceController.mm";
      v14 = 1024;
      v15 = 1892;
      v16 = 2048;
      v17 = v10;
      v18 = 1024;
      v19 = mClientAPIClutch;
      _os_log_impl(&dword_19B733000, v3, OS_LOG_TYPE_ERROR, "%25s:%-5d Invalid operation. impl(%p) ClientAPIClutch(%d)", buf, 0x22u);
    }

  }
  v6 = 0;
LABEL_12:
  if (v11)
  {
    p_shared_owners = (unint64_t *)&v11->__shared_owners_;
    do
      v8 = __ldaxr(p_shared_owners);
    while (__stlxr(v8 - 1, p_shared_owners));
    if (!v8)
    {
      ((void (*)())v11->__on_zero_shared)();
      std::__shared_weak_count::__release_weak(v11);
    }
  }
  return v6;
}

- (unint64_t)alertStartTime
{
  return self->_alertStartTime;
}

void __83__AVVoiceController_setEnableInterruptionByRecordingClientsForStream_enable_error___block_invoke(uint64_t a1)
{
  unint64_t v2;
  char v3;
  uint64_t v4;
  unint64_t *p_shared_owners;
  unint64_t v6;
  std::__shared_weak_count *v7;
  unint64_t *v8;
  unint64_t v9;
  NSObject *v10;
  id v11;
  int v12;
  std::__shared_weak_count *v13;
  unint64_t *v14;
  unint64_t v15;
  std::__shared_weak_count *v16;
  unint64_t *v17;
  unint64_t v18;
  uint64_t v19;
  std::__shared_weak_count *v20;
  uint64_t v21;
  uint64_t *v22;
  uint64_t v23;
  int v24;
  uint64_t v25;
  std::__shared_weak_count *v26;
  _BYTE buf[32];
  uint64_t *v28;
  uint64_t v29;
  std::__shared_weak_count *v30;
  char v31;
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  v2 = *(_QWORD *)(a1 + 56);
  v3 = *(_BYTE *)(a1 + 64);
  std::shared_ptr<AVVCRecordingEngine>::shared_ptr[abi:ne180100]<AVVCRecordingEngine,void>(&v25, *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8), *(std::__shared_weak_count **)(*(_QWORD *)(a1 + 40) + 16));
  v21 = 0;
  v22 = &v21;
  v23 = 0x2020000000;
  v24 = 0;
  ControllerImpl::_lookupEngineForStreamID((ControllerImpl *)&v19, *(_QWORD *)(v25 + 576), *(std::__shared_weak_count **)(v25 + 584), v2);
  v4 = v19;
  if (!v19)
  {
    if (kAVVCScope)
    {
      v10 = *(id *)kAVVCScope;
      if (!v10)
      {
LABEL_17:
        *((_DWORD *)v22 + 6) = -11793;
        goto LABEL_18;
      }
    }
    else
    {
      v10 = MEMORY[0x1E0C81028];
      v11 = MEMORY[0x1E0C81028];
    }
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315650;
      *(_QWORD *)&buf[4] = "ControllerImpl.mm";
      *(_WORD *)&buf[12] = 1024;
      *(_DWORD *)&buf[14] = 6789;
      *(_WORD *)&buf[18] = 2048;
      *(_QWORD *)&buf[20] = v2;
      _os_log_impl(&dword_19B733000, v10, OS_LOG_TYPE_ERROR, "%25s:%-5d setPrefersBeingInterruptedByNextActiveRecordingClient: Cannot find recording engine for streamID(%lu). Returning.", buf, 0x1Cu);
    }

    goto LABEL_17;
  }
  *(_QWORD *)buf = MEMORY[0x1E0C809B0];
  *(_QWORD *)&buf[8] = 3321888768;
  *(_QWORD *)&buf[16] = ___ZN14ControllerImpl48setEnableInterruptionByRecordingClientsForStreamEmb_block_invoke;
  *(_QWORD *)&buf[24] = &unk_1E3BE50A0;
  v29 = v19;
  v30 = v20;
  if (v20)
  {
    p_shared_owners = (unint64_t *)&v20->__shared_owners_;
    do
      v6 = __ldxr(p_shared_owners);
    while (__stxr(v6 + 1, p_shared_owners));
  }
  v31 = v3;
  v28 = &v21;
  (*(void (**)(uint64_t, _BYTE *, const char *))(*(_QWORD *)v4 + 360))(v4, buf, "setEnableInterruptionByRecordingClientsForStream");
  v7 = v30;
  if (v30)
  {
    v8 = (unint64_t *)&v30->__shared_owners_;
    do
      v9 = __ldaxr(v8);
    while (__stlxr(v9 - 1, v8));
    if (!v9)
    {
      ((void (*)(std::__shared_weak_count *))v7->__on_zero_shared)(v7);
      std::__shared_weak_count::__release_weak(v7);
    }
  }
LABEL_18:
  v12 = *((_DWORD *)v22 + 6);
  v13 = v20;
  if (v20)
  {
    v14 = (unint64_t *)&v20->__shared_owners_;
    do
      v15 = __ldaxr(v14);
    while (__stlxr(v15 - 1, v14));
    if (!v15)
    {
      ((void (*)(std::__shared_weak_count *))v13->__on_zero_shared)(v13);
      std::__shared_weak_count::__release_weak(v13);
    }
  }
  _Block_object_dispose(&v21, 8);
  v16 = v26;
  if (v26)
  {
    v17 = (unint64_t *)&v26->__shared_owners_;
    do
      v18 = __ldaxr(v17);
    while (__stlxr(v18 - 1, v17));
    if (!v18)
    {
      ((void (*)(std::__shared_weak_count *))v16->__on_zero_shared)(v16);
      std::__shared_weak_count::__release_weak(v16);
    }
  }
  *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = v12;
}

void __64__AVVoiceController_getDeviceLatenciesForStream_withCompletion___block_invoke(uint64_t a1)
{
  unint64_t v1;
  uint64_t v2;
  id v3;
  void *v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  float v13;
  void *v14;
  void *v15;
  float v16;
  double v17;
  void *v18;
  float v19;
  double v20;
  void *v21;
  float v22;
  double v23;
  void *v24;
  void *v25;
  NSObject *v26;
  NSObject *v27;
  id v28;
  id v29;
  uint64_t v30;
  id v31;
  NSObject *v32;
  id v33;
  std::__shared_weak_count *v34;
  unint64_t *p_shared_owners;
  unint64_t v36;
  uint64_t v37;
  std::__shared_weak_count *v38;
  _BYTE buf[40];
  double v40;
  _BYTE v41[10];
  __int16 v42;
  double v43;
  uint64_t v44;

  v44 = *MEMORY[0x1E0C80C00];
  v1 = *(_QWORD *)(a1 + 56);
  v2 = *(_QWORD *)(a1 + 40);
  v3 = *(id *)(a1 + 32);
  std::shared_ptr<AVVCRecordingEngine>::shared_ptr[abi:ne180100]<AVVCRecordingEngine,void>(&v37, *(_QWORD *)(v2 + 8), *(std::__shared_weak_count **)(v2 + 16));
  ControllerImpl::sessionManagerForStreamID(v37, v1, 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v4, "sessionState") != 7)
  {
    if (kAVVCScope)
    {
      v27 = *(id *)kAVVCScope;
      if (!v27)
      {
LABEL_12:
        objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CB2F90], -11782, 0);
        *(double *)&v26 = COERCE_DOUBLE(objc_claimAutoreleasedReturnValue());
        v25 = 0;
        goto LABEL_17;
      }
    }
    else
    {
      v27 = MEMORY[0x1E0C81028];
      v28 = MEMORY[0x1E0C81028];
    }
    if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315650;
      *(_QWORD *)&buf[4] = "ControllerImpl.mm";
      *(_WORD *)&buf[12] = 1024;
      *(_DWORD *)&buf[14] = 6765;
      *(_WORD *)&buf[18] = 2048;
      *(_QWORD *)&buf[20] = v1;
      _os_log_impl(&dword_19B733000, v27, OS_LOG_TYPE_DEFAULT, "%25s:%-5d getDeviceLatencies: Session for streamID(%lu) is not active !!!.", buf, 0x1Cu);
    }

    goto LABEL_12;
  }
  objc_msgSend(v4, "inputLatency");
  v6 = v5;
  objc_msgSend(v4, "outputLatency");
  v8 = v7;
  objc_msgSend(v4, "inputSafetyOffset");
  v10 = v9;
  objc_msgSend(v4, "outputSafetyOffset");
  v12 = v11;
  v13 = v6;
  v14 = (void *)MEMORY[0x1E0C99D80];
  *(float *)&v11 = v13;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v11);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = v8;
  *(float *)&v17 = v16;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v17);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = v10;
  *(float *)&v20 = v19;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v20);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = v12;
  *(float *)&v23 = v22;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v23);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "dictionaryWithObjectsAndKeys:", v15, CFSTR("AVVCCurrentInputDeviceLatency"), v18, CFSTR("AVVCCurrentOutputDeviceLatency"), v21, CFSTR("AVVCCurrentInputSafetyOffset"), v24, CFSTR("AVVCCurrentOutputSafetyOffset"), 0);
  v25 = (void *)objc_claimAutoreleasedReturnValue();

  if (kAVVCScope)
  {
    *(double *)&v26 = COERCE_DOUBLE(*(id *)kAVVCScope);
    if (*(double *)&v26 == 0.0)
      goto LABEL_17;
  }
  else
  {
    *(double *)&v26 = MEMORY[0x1E0C81028];
    v29 = MEMORY[0x1E0C81028];
  }
  if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136316674;
    *(_QWORD *)&buf[4] = "ControllerImpl.mm";
    *(_WORD *)&buf[12] = 1024;
    *(_DWORD *)&buf[14] = 6762;
    *(_WORD *)&buf[18] = 2048;
    *(_QWORD *)&buf[20] = v1;
    *(_WORD *)&buf[28] = 2048;
    *(double *)&buf[30] = v13;
    *(_WORD *)&buf[38] = 2048;
    v40 = v16;
    *(_WORD *)v41 = 2048;
    *(double *)&v41[2] = v19;
    v42 = 2048;
    v43 = v22;
    _os_log_impl(&dword_19B733000, v26, OS_LOG_TYPE_DEFAULT, "%25s:%-5d getDeviceLatencies: streamID(%lu) : input Latency(%f), output latency(%f), input safety offset (%f), output safety offset (%f)", buf, 0x44u);
  }

  *(double *)&v26 = 0.0;
LABEL_17:
  v30 = v37;
  *(_QWORD *)buf = MEMORY[0x1E0C809B0];
  *(_QWORD *)&buf[8] = 3221225472;
  *(_QWORD *)&buf[16] = ___ZN14ControllerImpl18getDeviceLatenciesEmU13block_pointerFvP12NSDictionaryP7NSErrorE_block_invoke;
  *(_QWORD *)&buf[24] = &unk_1E3BECE90;
  v31 = v3;
  v40 = *(double *)&v26;
  *(_QWORD *)v41 = v31;
  *(_QWORD *)&buf[32] = v25;
  v32 = v26;
  v33 = v25;
  ControllerImpl::safeNotifyAlwaysAsync(v30, v3 != 0, buf);

  v34 = v38;
  if (v38)
  {
    p_shared_owners = (unint64_t *)&v38->__shared_owners_;
    do
      v36 = __ldaxr(p_shared_owners);
    while (__stlxr(v36 - 1, p_shared_owners));
    if (!v36)
    {
      ((void (*)(std::__shared_weak_count *))v34->__on_zero_shared)(v34);
      std::__shared_weak_count::__release_weak(v34);
    }
  }

}

void __62__AVVoiceController_getPlaybackRouteForStream_withCompletion___block_invoke(uint64_t a1)
{
  ControllerImpl::getPlaybackRoute(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 56), *(void **)(a1 + 32));
}

uint64_t __40__AVVoiceController__bringUp_withError___block_invoke(uint64_t a1)
{
  uint64_t result;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 48) + 464), "setParentVoiceController:", *(_QWORD *)(a1 + 32));
  result = ControllerImpl::configureAlerts(*(ControllerImpl **)(a1 + 48), *(AVVoiceController **)(a1 + 32));
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = (int)result;
  return result;
}

void __28__AVVoiceController_metrics__block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  id v5;

  +[AVVCMetricsManager sharedManager](AVVCMetricsManager, "sharedManager");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "retrieveMetrics");
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

void __36__AVVoiceController_setAlertVolume___block_invoke(uint64_t a1)
{
  uint64_t v1;
  float v2;
  std::__shared_weak_count *v4;
  unint64_t *p_shared_owners;
  unint64_t v6;
  unint64_t *v7;
  unint64_t v8;
  OpaqueAudioQueue *AlertQueueFromImplQueue;
  _BYTE v10[16];

  v1 = *(_QWORD *)(a1 + 32);
  v2 = *(float *)(a1 + 48);
  if (*(float *)(v1 + 400) != v2)
  {
    *(float *)(v1 + 400) = v2;
    v4 = *(std::__shared_weak_count **)(a1 + 40);
    if (v4)
    {
      p_shared_owners = (unint64_t *)&v4->__shared_owners_;
      do
        v6 = __ldxr(p_shared_owners);
      while (__stxr(v6 + 1, p_shared_owners));
    }
    AlertLock::AlertLock(v10, v1, v4);
    if (v4)
    {
      v7 = (unint64_t *)&v4->__shared_owners_;
      do
        v8 = __ldaxr(v7);
      while (__stlxr(v8 - 1, v7));
      if (!v8)
      {
        ((void (*)(std::__shared_weak_count *))v4->__on_zero_shared)(v4);
        std::__shared_weak_count::__release_weak(v4);
      }
    }
    if (ControllerImpl::getAlertQueueFromImplQueue(*(ControllerImpl **)(a1 + 32)))
    {
      AlertQueueFromImplQueue = (OpaqueAudioQueue *)ControllerImpl::getAlertQueueFromImplQueue(*(ControllerImpl **)(a1 + 32));
      AudioQueueSetParameter(AlertQueueFromImplQueue, 1u, *(AudioQueueParameterValue *)(*(_QWORD *)(a1 + 32) + 400));
    }
    VCLocker::~VCLocker((VCLocker *)v10);
  }
}

void __42__AVVoiceController_setRecordEndWaitTime___block_invoke(uint64_t a1)
{
  double v2;
  uint64_t v3;
  std::__shared_weak_count *v4;
  unint64_t *p_shared_owners;
  unint64_t v6;
  std::__shared_weak_count *v7;
  unint64_t *v8;
  unint64_t v9;
  _QWORD v10[6];
  std::__shared_weak_count *v11;

  v2 = *(double *)(a1 + 32);
  v3 = *(_QWORD *)(a1 + 40);
  if (v2 != *(double *)(v3 + 448))
  {
    v10[0] = MEMORY[0x1E0C809B0];
    v10[1] = 3321888768;
    v10[2] = __42__AVVoiceController_setRecordEndWaitTime___block_invoke_2;
    v10[3] = &__block_descriptor_56_ea8_40c42_ZTSNSt3__110shared_ptrI14ControllerImplEE_e5_v8__0l;
    *(double *)&v10[4] = v2;
    v4 = *(std::__shared_weak_count **)(a1 + 48);
    v10[5] = v3;
    v11 = v4;
    if (v4)
    {
      p_shared_owners = (unint64_t *)&v4->__shared_owners_;
      do
        v6 = __ldxr(p_shared_owners);
      while (__stxr(v6 + 1, p_shared_owners));
    }
    ControllerImpl::safeNotify(v3, (uint64_t)"setRecordEndWaitTime", v10);
    v7 = v11;
    if (v11)
    {
      v8 = (unint64_t *)&v11->__shared_owners_;
      do
        v9 = __ldaxr(v8);
      while (__stlxr(v9 - 1, v8));
      if (!v9)
      {
        ((void (*)(std::__shared_weak_count *))v7->__on_zero_shared)(v7);
        std::__shared_weak_count::__release_weak(v7);
      }
    }
  }
}

void __42__AVVoiceController_setRecordEndWaitTime___block_invoke_2(uint64_t a1)
{
  double v2;
  double v3;
  double v4;
  uint64_t v5;
  id WeakRetained;

  v2 = *(double *)(a1 + 32);
  v3 = fmax(v2, 0.25);
  if (v2 == -1.0)
    v4 = -1.0;
  else
    v4 = v3;
  v5 = *(_QWORD *)(a1 + 40);
  *(double *)(v5 + 448) = v4;
  WeakRetained = objc_loadWeakRetained((id *)(v5 + 416));
  objc_msgSend(WeakRetained, "setEndWaitTime:", *(double *)(*(_QWORD *)(a1 + 40) + 448));

}

double __38__AVVoiceController_recordEndWaitTime__block_invoke(uint64_t a1)
{
  double result;

  result = *(double *)(*(_QWORD *)(a1 + 40) + 448);
  *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  return result;
}

void __50__AVVoiceController_setRecordInterspeechWaitTime___block_invoke(uint64_t a1)
{
  double v2;
  uint64_t v3;
  std::__shared_weak_count *v4;
  unint64_t *p_shared_owners;
  unint64_t v6;
  std::__shared_weak_count *v7;
  unint64_t *v8;
  unint64_t v9;
  _QWORD v10[6];
  std::__shared_weak_count *v11;

  v2 = *(double *)(a1 + 32);
  v3 = *(_QWORD *)(a1 + 40);
  if (v2 != *(double *)(v3 + 440))
  {
    v10[0] = MEMORY[0x1E0C809B0];
    v10[1] = 3321888768;
    v10[2] = __50__AVVoiceController_setRecordInterspeechWaitTime___block_invoke_2;
    v10[3] = &__block_descriptor_56_ea8_40c42_ZTSNSt3__110shared_ptrI14ControllerImplEE_e5_v8__0l;
    *(double *)&v10[4] = v2;
    v4 = *(std::__shared_weak_count **)(a1 + 48);
    v10[5] = v3;
    v11 = v4;
    if (v4)
    {
      p_shared_owners = (unint64_t *)&v4->__shared_owners_;
      do
        v6 = __ldxr(p_shared_owners);
      while (__stxr(v6 + 1, p_shared_owners));
    }
    ControllerImpl::safeNotify(v3, (uint64_t)"setRecordInterspeechWaitTime", v10);
    v7 = v11;
    if (v11)
    {
      v8 = (unint64_t *)&v11->__shared_owners_;
      do
        v9 = __ldaxr(v8);
      while (__stlxr(v9 - 1, v8));
      if (!v9)
      {
        ((void (*)(std::__shared_weak_count *))v7->__on_zero_shared)(v7);
        std::__shared_weak_count::__release_weak(v7);
      }
    }
  }
}

void __50__AVVoiceController_setRecordInterspeechWaitTime___block_invoke_2(uint64_t a1)
{
  double v2;
  double v3;
  double v4;
  uint64_t v5;
  id WeakRetained;

  v2 = *(double *)(a1 + 32);
  v3 = fmax(v2, 0.25);
  if (v2 == -1.0)
    v4 = -1.0;
  else
    v4 = v3;
  v5 = *(_QWORD *)(a1 + 40);
  *(double *)(v5 + 440) = v4;
  WeakRetained = objc_loadWeakRetained((id *)(v5 + 416));
  objc_msgSend(WeakRetained, "setInterspeechWaitTime:", *(double *)(*(_QWORD *)(a1 + 40) + 440));

}

double __46__AVVoiceController_recordInterspeechWaitTime__block_invoke(uint64_t a1)
{
  double result;

  result = *(double *)(*(_QWORD *)(a1 + 40) + 440);
  *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  return result;
}

void __44__AVVoiceController_setRecordStartWaitTime___block_invoke(uint64_t a1)
{
  double v2;
  uint64_t v3;
  std::__shared_weak_count *v4;
  unint64_t *p_shared_owners;
  unint64_t v6;
  std::__shared_weak_count *v7;
  unint64_t *v8;
  unint64_t v9;
  _QWORD v10[6];
  std::__shared_weak_count *v11;

  v2 = *(double *)(a1 + 32);
  v3 = *(_QWORD *)(a1 + 40);
  if (v2 != *(double *)(v3 + 432))
  {
    v10[0] = MEMORY[0x1E0C809B0];
    v10[1] = 3321888768;
    v10[2] = __44__AVVoiceController_setRecordStartWaitTime___block_invoke_2;
    v10[3] = &__block_descriptor_56_ea8_40c42_ZTSNSt3__110shared_ptrI14ControllerImplEE_e5_v8__0l;
    *(double *)&v10[4] = v2;
    v4 = *(std::__shared_weak_count **)(a1 + 48);
    v10[5] = v3;
    v11 = v4;
    if (v4)
    {
      p_shared_owners = (unint64_t *)&v4->__shared_owners_;
      do
        v6 = __ldxr(p_shared_owners);
      while (__stxr(v6 + 1, p_shared_owners));
    }
    ControllerImpl::safeNotify(v3, (uint64_t)"setRecordStartWaitTime", v10);
    v7 = v11;
    if (v11)
    {
      v8 = (unint64_t *)&v11->__shared_owners_;
      do
        v9 = __ldaxr(v8);
      while (__stlxr(v9 - 1, v8));
      if (!v9)
      {
        ((void (*)(std::__shared_weak_count *))v7->__on_zero_shared)(v7);
        std::__shared_weak_count::__release_weak(v7);
      }
    }
  }
}

void __44__AVVoiceController_setRecordStartWaitTime___block_invoke_2(uint64_t a1)
{
  double v2;
  double v3;
  double v4;
  uint64_t v5;
  id WeakRetained;

  v2 = *(double *)(a1 + 32);
  v3 = fmax(v2, 0.25);
  if (v2 == -1.0)
    v4 = -1.0;
  else
    v4 = v3;
  v5 = *(_QWORD *)(a1 + 40);
  *(double *)(v5 + 432) = v4;
  WeakRetained = objc_loadWeakRetained((id *)(v5 + 416));
  objc_msgSend(WeakRetained, "setStartWaitTime:", *(double *)(*(_QWORD *)(a1 + 40) + 432));

}

double __40__AVVoiceController_recordStartWaitTime__block_invoke(uint64_t a1)
{
  double result;

  result = *(double *)(*(_QWORD *)(a1 + 40) + 432);
  *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  return result;
}

void __43__AVVoiceController_setRecordEndpointMode___block_invoke(uint64_t a1)
{
  uint64_t v2;
  int v3;
  std::__shared_weak_count *v4;
  unint64_t *p_shared_owners;
  unint64_t v6;
  std::__shared_weak_count *v7;
  unint64_t *v8;
  unint64_t v9;
  _QWORD v10[5];
  std::__shared_weak_count *v11;
  int v12;

  v2 = *(_QWORD *)(a1 + 32);
  v3 = *(_DWORD *)(a1 + 48);
  if (*(_DWORD *)(v2 + 428) != v3)
  {
    v10[0] = MEMORY[0x1E0C809B0];
    v10[1] = 3321888768;
    v10[2] = __43__AVVoiceController_setRecordEndpointMode___block_invoke_2;
    v10[3] = &__block_descriptor_52_ea8_32c42_ZTSNSt3__110shared_ptrI14ControllerImplEE_e5_v8__0l;
    v4 = *(std::__shared_weak_count **)(a1 + 40);
    v10[4] = v2;
    v11 = v4;
    if (v4)
    {
      p_shared_owners = (unint64_t *)&v4->__shared_owners_;
      do
        v6 = __ldxr(p_shared_owners);
      while (__stxr(v6 + 1, p_shared_owners));
      v3 = *(_DWORD *)(a1 + 48);
    }
    v12 = v3;
    ControllerImpl::safeNotify(v2, (uint64_t)"setRecordEndpointMode", v10);
    v7 = v11;
    if (v11)
    {
      v8 = (unint64_t *)&v11->__shared_owners_;
      do
        v9 = __ldaxr(v8);
      while (__stlxr(v9 - 1, v8));
      if (!v9)
      {
        ((void (*)(std::__shared_weak_count *))v7->__on_zero_shared)(v7);
        std::__shared_weak_count::__release_weak(v7);
      }
    }
  }
}

void __43__AVVoiceController_setRecordEndpointMode___block_invoke_2(uint64_t a1)
{
  uint64_t v2;
  id WeakRetained;
  uint64_t v4;
  id v5;

  v2 = *(_QWORD *)(a1 + 32);
  *(_DWORD *)(v2 + 428) = *(_DWORD *)(a1 + 48);
  WeakRetained = objc_loadWeakRetained((id *)(v2 + 416));
  if (*(_DWORD *)(a1 + 48) == 1)
    v4 = 1;
  else
    v4 = 2;
  v5 = WeakRetained;
  objc_msgSend(WeakRetained, "setEndpointMode:", v4);

}

uint64_t __39__AVVoiceController_recordEndpointMode__block_invoke(uint64_t result)
{
  *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(result + 32) + 8) + 24) = *(_DWORD *)(*(_QWORD *)(result + 40) + 428);
  return result;
}

void __43__AVVoiceController_setEndpointerDelegate___block_invoke(uint64_t a1)
{
  ControllerImpl::setEndpointerDelegate(*(_QWORD *)(a1 + 48), *(void **)(a1 + 32), *(void **)(a1 + 40), 0);
}

void __39__AVVoiceController_endpointerDelegate__block_invoke(uint64_t a1)
{
  id WeakRetained;
  uint64_t v3;
  void *v4;

  WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 40) + 416));
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = WeakRetained;

}

void __39__AVVoiceController_setRecordDelegate___block_invoke(uint64_t a1)
{
  id v2;
  id WeakRetained;
  AVVoiceController *v4;
  std::__shared_weak_count *v5;
  uint64_t v6;
  unint64_t *p_shared_owners;
  unint64_t v8;
  std::__shared_weak_count *v9;
  unint64_t *v10;
  unint64_t v11;
  _QWORD v12[4];
  id v13;
  uint64_t v14;
  std::__shared_weak_count *v15;

  v2 = *(id *)(a1 + 32);
  WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 48) + 168));

  if (v2 != WeakRetained)
  {
    ControllerImpl::waitForAllStopRecordCompletion(*(ControllerImpl **)(a1 + 48), v4);
    v12[0] = MEMORY[0x1E0C809B0];
    v12[1] = 3321888768;
    v12[2] = __39__AVVoiceController_setRecordDelegate___block_invoke_2;
    v12[3] = &unk_1E3BEA238;
    v6 = *(_QWORD *)(a1 + 48);
    v5 = *(std::__shared_weak_count **)(a1 + 56);
    v14 = v6;
    v15 = v5;
    if (v5)
    {
      p_shared_owners = (unint64_t *)&v5->__shared_owners_;
      do
        v8 = __ldxr(p_shared_owners);
      while (__stxr(v8 + 1, p_shared_owners));
    }
    v13 = *(id *)(a1 + 32);
    ControllerImpl::safeNotifySync(v6, (uint64_t)"set record delegate", v12);

    v9 = v15;
    if (v15)
    {
      v10 = (unint64_t *)&v15->__shared_owners_;
      do
        v11 = __ldaxr(v10);
      while (__stlxr(v11 - 1, v10));
      if (!v11)
      {
        ((void (*)(std::__shared_weak_count *))v9->__on_zero_shared)(v9);
        std::__shared_weak_count::__release_weak(v9);
      }
    }
  }
}

id __39__AVVoiceController_setRecordDelegate___block_invoke_2(uint64_t a1)
{
  return objc_storeWeak((id *)(*(_QWORD *)(a1 + 40) + 168), *(id *)(a1 + 32));
}

void __35__AVVoiceController_recordDelegate__block_invoke(uint64_t a1)
{
  id WeakRetained;
  uint64_t v3;
  void *v4;

  WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 40) + 168));
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = WeakRetained;

}

void __39__AVVoiceController_enableMiniDucking___block_invoke(uint64_t a1)
{
  uint64_t v2;
  std::__shared_weak_count *v3;
  unint64_t *p_shared_owners;
  unint64_t v5;
  unint64_t *v6;
  unint64_t v7;
  _BYTE v8[16];

  v2 = *(_QWORD *)(a1 + 32);
  v3 = *(std::__shared_weak_count **)(a1 + 40);
  if (v3)
  {
    p_shared_owners = (unint64_t *)&v3->__shared_owners_;
    do
      v5 = __ldxr(p_shared_owners);
    while (__stxr(v5 + 1, p_shared_owners));
  }
  SessionLock::SessionLock(v8, v2, v3);
  if (v3)
  {
    v6 = (unint64_t *)&v3->__shared_owners_;
    do
      v7 = __ldaxr(v6);
    while (__stlxr(v7 - 1, v6));
    if (!v7)
    {
      ((void (*)(std::__shared_weak_count *))v3->__on_zero_shared)(v3);
      std::__shared_weak_count::__release_weak(v3);
    }
  }
  ControllerImpl::enableMiniDucking(*(ControllerImpl **)(a1 + 32), *(unsigned __int8 *)(a1 + 48));
  VCLocker::~VCLocker((VCLocker *)v8);
}

void __40__AVVoiceController__teardownWithError___block_invoke(uint64_t a1)
{
  NSObject *v1;
  id v2;
  void *v3;
  uint64_t v4;
  std::__shared_weak_count *v5;
  unint64_t *p_shared_owners;
  unint64_t v7;
  unint64_t *v8;
  unint64_t v9;
  id v10;
  NSObject *v11;
  id v12;
  void *v13;
  void *v14;
  id v15;
  uint64_t v16;
  NSObject *v17;
  uint64_t v18;
  uint64_t i;
  void *v20;
  unsigned int v21;
  id v22;
  NSObject *v23;
  NSObject *v24;
  uint64_t v25;
  void *v26;
  void *v27;
  void *v28;
  uint64_t v29;
  NSObject *v30;
  id v31;
  void *v32;
  id v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  id v39[3];
  _BYTE v40[16];
  uint8_t v41[128];
  uint8_t buf[4];
  const char *v43;
  __int16 v44;
  int v45;
  __int16 v46;
  id v47;
  uint64_t v48;

  v48 = *MEMORY[0x1E0C80C00];
  if (kAVVCScope)
  {
    v1 = *(id *)kAVVCScope;
    if (!v1)
      goto LABEL_8;
  }
  else
  {
    v1 = MEMORY[0x1E0C81028];
    v2 = MEMORY[0x1E0C81028];
  }
  if (os_log_type_enabled(v1, OS_LOG_TYPE_DEFAULT))
  {
    v3 = *(void **)(a1 + 32);
    *(_DWORD *)buf = 136315650;
    v43 = "AVVoiceController.mm";
    v44 = 1024;
    v45 = 849;
    v46 = 2048;
    v47 = v3;
    _os_log_impl(&dword_19B733000, v1, OS_LOG_TYPE_DEFAULT, "%25s:%-5d beginning teardown. self == %p", buf, 0x1Cu);
  }

LABEL_8:
  objc_msgSend(*(id *)(a1 + 32), "sessionCleanup");
  ControllerImpl::cleanup(*(ControllerImpl **)(a1 + 40), *(AVVoiceController **)(a1 + 32));
  ControllerImpl::deleteRecordingEngines(*(ControllerImpl **)(a1 + 40));
  v4 = *(_QWORD *)(a1 + 40);
  if (*(_BYTE *)(v4 + 521))
    goto LABEL_41;
  v5 = *(std::__shared_weak_count **)(a1 + 48);
  v39[1] = *(id *)(a1 + 40);
  v39[2] = v5;
  if (v5)
  {
    p_shared_owners = (unint64_t *)&v5->__shared_owners_;
    do
      v7 = __ldxr(p_shared_owners);
    while (__stxr(v7 + 1, p_shared_owners));
  }
  SessionLock::SessionLock(v40, v4, v5);
  if (v5)
  {
    v8 = (unint64_t *)&v5->__shared_owners_;
    do
      v9 = __ldaxr(v8);
    while (__stlxr(v9 - 1, v8));
    if (!v9)
    {
      ((void (*)(std::__shared_weak_count *))v5->__on_zero_shared)(v5);
      std::__shared_weak_count::__release_weak(v5);
    }
  }
  ControllerImpl::sessionManagerForStreamID(*(_QWORD *)(a1 + 40), 0, 0);
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  v39[0] = 0;
  objc_msgSend(v32, "setActive:withOptions:error:", 0, objc_msgSend(v32, "getSessionActivationOptions"), v39);
  v10 = v39[0];
  if (!v10)
    goto LABEL_25;
  if (!kAVVCScope)
  {
    v11 = MEMORY[0x1E0C81028];
    v12 = MEMORY[0x1E0C81028];
    goto LABEL_22;
  }
  v11 = *(id *)kAVVCScope;
  if (v11)
  {
LABEL_22:
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315650;
      v43 = "AVVoiceController.mm";
      v44 = 1024;
      v45 = 868;
      v46 = 2112;
      v47 = v10;
      _os_log_impl(&dword_19B733000, v11, OS_LOG_TYPE_ERROR, "%25s:%-5d setActive(false): failed with error: %@", buf, 0x1Cu);
    }

  }
LABEL_25:
  +[AVVCSessionFactory sharedInstance](AVVCSessionFactory, "sharedInstance");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "auxSessionManagers");
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  v37 = 0u;
  v38 = 0u;
  v35 = 0u;
  v36 = 0u;
  v15 = v14;
  v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v35, v41, 16);
  if (!v16)
    goto LABEL_40;
  v17 = MEMORY[0x1E0C81028];
  v18 = *(_QWORD *)v36;
  do
  {
    for (i = 0; i != v16; ++i)
    {
      if (*(_QWORD *)v36 != v18)
        objc_enumerationMutation(v15);
      v20 = *(void **)(*((_QWORD *)&v35 + 1) + 8 * i);
      v21 = objc_msgSend(v20, "getSessionActivationOptions");
      v34 = v10;
      objc_msgSend(v20, "setActive:withOptions:error:", 0, v21, &v34);
      v22 = v34;

      v10 = v22;
      if (v22)
      {
        if (kAVVCScope)
        {
          v23 = *(id *)kAVVCScope;
          if (!v23)
            continue;
        }
        else
        {
          v24 = v17;
          v23 = v17;
        }
        if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 136315650;
          v43 = "AVVoiceController.mm";
          v44 = 1024;
          v45 = 877;
          v46 = 2112;
          v47 = v10;
          _os_log_impl(&dword_19B733000, v23, OS_LOG_TYPE_ERROR, "%25s:%-5d setActive(false): failed with error: %@", buf, 0x1Cu);
        }

      }
    }
    v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v35, v41, 16);
  }
  while (v16);
LABEL_40:

  VCLocker::~VCLocker((VCLocker *)v40);
  v4 = *(_QWORD *)(a1 + 40);
LABEL_41:
  objc_storeWeak((id *)(v4 + 416), 0);
  v25 = *(_QWORD *)(a1 + 40);
  v26 = *(void **)(v25 + 456);
  *(_QWORD *)(v25 + 456) = 0;

  +[AVVoiceTriggerClient sharedInstance](AVVoiceTriggerClient, "sharedInstance");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "setAVVCServerCrashedBlock:", 0);

  +[AVVoiceTriggerClient sharedInstance](AVVoiceTriggerClient, "sharedInstance");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "setAVVCServerResetBlock:", 0);

  v29 = *(_QWORD *)(a1 + 40);
  *(_BYTE *)(v29 + 520) = 1;
  objc_msgSend(*(id *)(v29 + 464), "setParentVoiceController:", 0);
  if (kAVVCScope)
  {
    v30 = *(id *)kAVVCScope;
    if (!v30)
      return;
  }
  else
  {
    v30 = MEMORY[0x1E0C81028];
    v31 = MEMORY[0x1E0C81028];
  }
  if (os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315650;
    v43 = "ControllerImpl.mm";
    v44 = 1024;
    v45 = 487;
    v46 = 1024;
    LODWORD(v47) = 1;
    _os_log_impl(&dword_19B733000, v30, OS_LOG_TYPE_DEFAULT, "%25s:%-5d ControllerImpl::setAVVCTeardownCompleted(%d)", buf, 0x18u);
  }

}

void __45__AVVoiceController_removeStream_completion___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  uint64_t v4;
  std::__shared_weak_count *v5;
  unint64_t v6;
  unint64_t *p_shared_owners;
  unint64_t v8;
  id v9;
  uint64_t v10;
  std::__shared_weak_count *v11;
  unint64_t *v12;
  unint64_t v13;
  _QWORD v14[4];
  id v15;
  uint64_t v16;
  std::__shared_weak_count *v17;
  uint64_t v18;

  v2 = *(void **)(a1 + 32);
  v3 = *(void **)(a1 + 40);
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3321888768;
  v14[2] = __45__AVVoiceController_removeStream_completion___block_invoke_2;
  v14[3] = &unk_1E3BEA488;
  v4 = *(_QWORD *)(a1 + 56);
  v5 = *(std::__shared_weak_count **)(a1 + 64);
  v6 = *(_QWORD *)(a1 + 72);
  v16 = v4;
  v17 = v5;
  if (v5)
  {
    p_shared_owners = (unint64_t *)&v5->__shared_owners_;
    do
      v8 = __ldxr(p_shared_owners);
    while (__stxr(v8 + 1, p_shared_owners));
  }
  v9 = *(id *)(a1 + 48);
  v10 = *(_QWORD *)(a1 + 72);
  v15 = v9;
  v18 = v10;
  ControllerImpl::_removeEngineFromMap(v4, v2, v6, v3, v14);

  v11 = v17;
  if (v17)
  {
    v12 = (unint64_t *)&v17->__shared_owners_;
    do
      v13 = __ldaxr(v12);
    while (__stlxr(v13 - 1, v12));
    if (!v13)
    {
      ((void (*)(std::__shared_weak_count *))v11->__on_zero_shared)(v11);
      std::__shared_weak_count::__release_weak(v11);
    }
  }
}

void __45__AVVoiceController_removeStream_completion___block_invoke_2(uint64_t a1)
{
  uint64_t v2;
  id v3;
  uint64_t v4;
  _QWORD v5[4];
  id v6;
  uint64_t v7;

  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __45__AVVoiceController_removeStream_completion___block_invoke_3;
  v5[3] = &unk_1E3BECB48;
  v2 = *(_QWORD *)(a1 + 40);
  v3 = *(id *)(a1 + 32);
  v4 = *(_QWORD *)(a1 + 56);
  v6 = v3;
  v7 = v4;
  ControllerImpl::safeNotify(v2, (uint64_t)"removeStream", v5);

}

uint64_t __45__AVVoiceController_removeStream_completion___block_invoke_3(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(uint64_t, _QWORD, _QWORD))(result + 16))(result, *(_QWORD *)(a1 + 40), 0);
  return result;
}

- (shared_ptr<ControllerImpl>)impl
{
  _QWORD *v2;
  uint64_t *impl;
  shared_ptr<ControllerImpl> result;

  impl = (uint64_t *)self->_impl;
  *v2 = 0;
  v2[1] = 0;
  if (impl)
    self = (AVVoiceController *)std::shared_ptr<ControllerImpl>::operator=[abi:ne180100](v2, *impl, impl[1]);
  result.var1 = (__shared_weak_count *)a2;
  result.var0 = (ControllerImpl *)self;
  return result;
}

- (void)sessionSetup
{
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  unint64_t *p_shared_owners;
  unint64_t v8;
  uint64_t v9;
  std::__shared_weak_count *v10;
  _QWORD v11[4];
  id v12;
  _QWORD v13[4];
  id v14;
  id location;

  objc_initWeak(&location, self);
  v3 = MEMORY[0x1E0C809B0];
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __60__AVVoiceController_AVVoiceControllerInternal__sessionSetup__block_invoke;
  v13[3] = &unk_1E3BEB468;
  objc_copyWeak(&v14, &location);
  +[AVVCSessionFactory sharedInstance](AVVCSessionFactory, "sharedInstance");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setSessionWasCreatedBlock:", v13);

  v11[0] = v3;
  v11[1] = 3221225472;
  v11[2] = __60__AVVoiceController_AVVoiceControllerInternal__sessionSetup__block_invoke_2;
  v11[3] = &unk_1E3BEB468;
  objc_copyWeak(&v12, &location);
  +[AVVCSessionFactory sharedInstance](AVVCSessionFactory, "sharedInstance");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setSessionWillBeDestroyedBlock:", v11);

  -[AVVoiceController impl](self, "impl");
  if (v9)
  {
    ControllerImpl::sessionManagerForStreamID(v9, 0, 0);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[AVVoiceController setSessionNotifications:](self, "setSessionNotifications:", v6);

  }
  if (v10)
  {
    p_shared_owners = (unint64_t *)&v10->__shared_owners_;
    do
      v8 = __ldaxr(p_shared_owners);
    while (__stlxr(v8 - 1, p_shared_owners));
    if (!v8)
    {
      ((void (*)())v10->__on_zero_shared)();
      std::__shared_weak_count::__release_weak(v10);
    }
  }
  objc_destroyWeak(&v12);
  objc_destroyWeak(&v14);
  objc_destroyWeak(&location);
}

- (void)sessionCleanup
{
  void *v3;
  void *v4;
  void *v5;
  unint64_t *p_shared_owners;
  unint64_t v7;
  uint64_t v8;
  std::__shared_weak_count *v9;

  +[AVVCSessionFactory sharedInstance](AVVCSessionFactory, "sharedInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setSessionWasCreatedBlock:", 0);

  +[AVVCSessionFactory sharedInstance](AVVCSessionFactory, "sharedInstance");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setSessionWillBeDestroyedBlock:", 0);

  -[AVVoiceController impl](self, "impl");
  if (v8)
  {
    ControllerImpl::sessionManagerForStreamID(v8, 0, 0);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[AVVoiceController removeSessionNotifications:](self, "removeSessionNotifications:", v5);

  }
  if (v9)
  {
    p_shared_owners = (unint64_t *)&v9->__shared_owners_;
    do
      v7 = __ldaxr(p_shared_owners);
    while (__stlxr(v7 - 1, p_shared_owners));
    if (!v7)
    {
      ((void (*)())v9->__on_zero_shared)();
      std::__shared_weak_count::__release_weak(v9);
    }
  }
}

- (void)setSessionNotifications:(id)a3
{
  id v4;
  id v5;
  id v6;
  NSObject *v7;
  int v8;
  uint64_t v9;
  void *v10;
  const char *v11;
  _BYTE v12[28];
  __int16 v13;
  uint64_t v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (v4)
  {
    if (kAVVCScope)
    {
      v5 = *(id *)kAVVCScope;
      if (!v5)
      {
LABEL_11:
        objc_msgSend(v4, "setupSessionNotifications:", self, *(_OWORD *)v12, *(_QWORD *)&v12[16]);
        goto LABEL_12;
      }
    }
    else
    {
      v5 = (id)MEMORY[0x1E0C81028];
      v6 = MEMORY[0x1E0C81028];
    }
    v7 = v5;
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      v8 = objc_msgSend(v4, "isPrimary");
      objc_msgSend(v4, "audioSession");
      v9 = objc_claimAutoreleasedReturnValue();
      v10 = (void *)v9;
      v11 = "aux";
      *(_QWORD *)&v12[4] = "AVVoiceController.mm";
      *(_WORD *)&v12[12] = 1024;
      *(_DWORD *)&v12[14] = 298;
      *(_DWORD *)v12 = 136315906;
      if (v8)
        v11 = "primary";
      *(_WORD *)&v12[18] = 2080;
      *(_QWORD *)&v12[20] = v11;
      v13 = 2048;
      v14 = v9;
      _os_log_impl(&dword_19B733000, v7, OS_LOG_TYPE_DEFAULT, "%25s:%-5d setSessionNotifications: setting up notifications for %s session(%p)", v12, 0x26u);

    }
    goto LABEL_11;
  }
LABEL_12:

}

- (void)removeSessionNotifications:(id)a3
{
  id v4;
  id v5;
  id v6;
  NSObject *v7;
  int v8;
  uint64_t v9;
  void *v10;
  const char *v11;
  _BYTE v12[28];
  __int16 v13;
  uint64_t v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (v4)
  {
    if (kAVVCScope)
    {
      v5 = *(id *)kAVVCScope;
      if (!v5)
      {
LABEL_11:
        objc_msgSend(v4, "removeSessionNotifications:", self, *(_OWORD *)v12, *(_QWORD *)&v12[16]);
        goto LABEL_12;
      }
    }
    else
    {
      v5 = (id)MEMORY[0x1E0C81028];
      v6 = MEMORY[0x1E0C81028];
    }
    v7 = v5;
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      v8 = objc_msgSend(v4, "isPrimary");
      objc_msgSend(v4, "audioSession");
      v9 = objc_claimAutoreleasedReturnValue();
      v10 = (void *)v9;
      v11 = "aux";
      *(_QWORD *)&v12[4] = "AVVoiceController.mm";
      *(_WORD *)&v12[12] = 1024;
      *(_DWORD *)&v12[14] = 308;
      *(_DWORD *)v12 = 136315906;
      if (v8)
        v11 = "primary";
      *(_WORD *)&v12[18] = 2080;
      *(_QWORD *)&v12[20] = v11;
      v13 = 2048;
      v14 = v9;
      _os_log_impl(&dword_19B733000, v7, OS_LOG_TYPE_DEFAULT, "%25s:%-5d removeSessionNotifications: removing all notifications for %s session(%p)", v12, 0x26u);

    }
    goto LABEL_11;
  }
LABEL_12:

}

- (void)hardwareConfigChanged:(int)a3
{
  uint64_t v3;
  uint64_t v5;
  NSObject *v6;
  id v7;
  id WeakRetained;
  id v9;
  char v10;
  NSObject *v11;
  id v12;
  unint64_t *p_shared_owners;
  unint64_t v14;
  uint64_t v15;
  std::__shared_weak_count *v16;
  uint8_t buf[4];
  const char *v18;
  __int16 v19;
  int v20;
  uint64_t v21;

  v3 = *(_QWORD *)&a3;
  v21 = *MEMORY[0x1E0C80C00];
  -[AVVoiceController impl](self, "impl");
  v5 = v15;
  if (v15)
  {
    if (kAVVCScope)
    {
      v6 = *(id *)kAVVCScope;
      if (!v6)
        goto LABEL_9;
    }
    else
    {
      v6 = MEMORY[0x1E0C81028];
      v7 = MEMORY[0x1E0C81028];
    }
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315394;
      v18 = "AVVoiceController.mm";
      v19 = 1024;
      v20 = 318;
      _os_log_impl(&dword_19B733000, v6, OS_LOG_TYPE_DEFAULT, "%25s:%-5d #### hardwareConfigChanged: ####", buf, 0x12u);
    }

    v5 = v15;
LABEL_9:
    WeakRetained = objc_loadWeakRetained((id *)(v5 + 168));
    if (WeakRetained)
    {
      v9 = objc_loadWeakRetained((id *)(v15 + 168));
      v10 = objc_opt_respondsToSelector();

      if ((v10 & 1) != 0)
      {
        v11 = objc_loadWeakRetained((id *)(v15 + 168));
        -[NSObject voiceControllerRecordHardwareConfigurationDidChange:toConfiguration:](v11, "voiceControllerRecordHardwareConfigurationDidChange:toConfiguration:", self, v3);
LABEL_18:

        goto LABEL_19;
      }
    }
    if (kAVVCScope)
    {
      v11 = *(id *)kAVVCScope;
      if (!v11)
        goto LABEL_19;
    }
    else
    {
      v11 = MEMORY[0x1E0C81028];
      v12 = MEMORY[0x1E0C81028];
    }
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 136315394;
      v18 = "AVVoiceController.mm";
      v19 = 1024;
      v20 = 323;
      _os_log_impl(&dword_19B733000, v11, OS_LOG_TYPE_DEBUG, "%25s:%-5d WARNING: delegate is nil or does not respond to voiceControllerRecordHardwareConfigurationDidChange:toConfiguration:", buf, 0x12u);
    }
    goto LABEL_18;
  }
LABEL_19:
  if (v16)
  {
    p_shared_owners = (unint64_t *)&v16->__shared_owners_;
    do
      v14 = __ldaxr(p_shared_owners);
    while (__stlxr(v14 - 1, p_shared_owners));
    if (!v14)
    {
      ((void (*)())v16->__on_zero_shared)();
      std::__shared_weak_count::__release_weak(v16);
    }
  }
}

- (void)handleInterruption:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  void *v7;
  uint64_t v8;
  unint64_t *p_shared_owners;
  unint64_t v10;
  std::__shared_weak_count *v11;
  unint64_t *v12;
  unint64_t v13;
  id v14;
  std::__shared_weak_count *v15;
  unint64_t *v16;
  unint64_t v17;
  _QWORD v18[4];
  id v19;
  NSObject *v20;
  AVVoiceController *v21;
  uint64_t v22;
  std::__shared_weak_count *v23;
  uint64_t v24;
  std::__shared_weak_count *v25;
  uint8_t buf[4];
  const char *v27;
  __int16 v28;
  int v29;
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[AVVoiceController impl](self, "impl");
  if (v24)
  {
    objc_msgSend(v4, "userInfo");
    v5 = objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "object");
    v6 = (id)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
LABEL_13:

      goto LABEL_20;
    }
    objc_msgSend(v4, "object");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    if (v7)
    {
      v8 = v24;
      v18[0] = MEMORY[0x1E0C809B0];
      v18[1] = 3321888768;
      v18[2] = __67__AVVoiceController_AVVoiceControllerInternal__handleInterruption___block_invoke;
      v18[3] = &unk_1E3BEA9F8;
      v6 = v7;
      v19 = v6;
      v22 = v24;
      v23 = v25;
      if (v25)
      {
        p_shared_owners = (unint64_t *)&v25->__shared_owners_;
        do
          v10 = __ldxr(p_shared_owners);
        while (__stxr(v10 + 1, p_shared_owners));
      }
      v20 = v5;
      v21 = self;
      ControllerImpl::dispatchAndSafeWork(v8, v18, (uint64_t)"-[AVVoiceController(AVVoiceControllerInternal) handleInterruption:]");

      v11 = v23;
      if (v23)
      {
        v12 = (unint64_t *)&v23->__shared_owners_;
        do
          v13 = __ldaxr(v12);
        while (__stlxr(v13 - 1, v12));
        if (!v13)
        {
          ((void (*)(std::__shared_weak_count *))v11->__on_zero_shared)(v11);
          std::__shared_weak_count::__release_weak(v11);
        }
      }

      goto LABEL_13;
    }
  }
  else
  {
    if (kAVVCScope)
    {
      v5 = *(id *)kAVVCScope;
      if (!v5)
        goto LABEL_21;
    }
    else
    {
      v5 = MEMORY[0x1E0C81028];
      v14 = MEMORY[0x1E0C81028];
    }
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      v27 = "AVVoiceController.mm";
      v28 = 1024;
      v29 = 334;
      _os_log_impl(&dword_19B733000, v5, OS_LOG_TYPE_ERROR, "%25s:%-5d handleInterruption: ControllerImpl is nil. Bailing!", buf, 0x12u);
    }
  }
LABEL_20:

LABEL_21:
  v15 = v25;
  if (v25)
  {
    v16 = (unint64_t *)&v25->__shared_owners_;
    do
      v17 = __ldaxr(v16);
    while (__stlxr(v17 - 1, v16));
    if (!v17)
    {
      ((void (*)(std::__shared_weak_count *))v15->__on_zero_shared)(v15);
      std::__shared_weak_count::__release_weak(v15);
    }
  }

}

- (void)handleRouteChange:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  id v10;
  unint64_t *p_shared_owners;
  unint64_t v12;
  std::__shared_weak_count *v13;
  unint64_t *v14;
  unint64_t v15;
  id v16;
  std::__shared_weak_count *v17;
  unint64_t *v18;
  unint64_t v19;
  _QWORD v20[4];
  NSObject *v21;
  id v22;
  AVVoiceController *v23;
  uint64_t v24;
  std::__shared_weak_count *v25;
  uint64_t v26;
  std::__shared_weak_count *v27;
  uint8_t buf[4];
  const char *v29;
  __int16 v30;
  int v31;
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[AVVoiceController impl](self, "impl");
  if (!v26)
  {
    if (kAVVCScope)
    {
      v5 = *(id *)kAVVCScope;
      if (!v5)
        goto LABEL_20;
    }
    else
    {
      v5 = MEMORY[0x1E0C81028];
      v16 = MEMORY[0x1E0C81028];
    }
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      v29 = "AVVoiceController.mm";
      v30 = 1024;
      v31 = 360;
      _os_log_impl(&dword_19B733000, v5, OS_LOG_TYPE_ERROR, "%25s:%-5d handleRouteChange: ControllerImpl is nil. Bailing!", buf, 0x12u);
    }
    goto LABEL_19;
  }
  objc_msgSend(v4, "object");
  v5 = objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
LABEL_19:

    goto LABEL_20;
  }
  objc_msgSend(v4, "object");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    v7 = objc_alloc(MEMORY[0x1E0C99E08]);
    objc_msgSend(v4, "userInfo");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = (void *)objc_msgSend(v7, "initWithDictionary:", v8);

    v20[0] = MEMORY[0x1E0C809B0];
    v20[1] = 3321888768;
    v20[2] = __66__AVVoiceController_AVVoiceControllerInternal__handleRouteChange___block_invoke;
    v20[3] = &unk_1E3BEA9F8;
    v5 = v6;
    v21 = v5;
    v10 = v9;
    v22 = v10;
    v24 = v26;
    v25 = v27;
    if (v27)
    {
      p_shared_owners = (unint64_t *)&v27->__shared_owners_;
      do
        v12 = __ldxr(p_shared_owners);
      while (__stxr(v12 + 1, p_shared_owners));
    }
    v23 = self;
    ControllerImpl::dispatchAndSafeWork(v26, v20, (uint64_t)"-[AVVoiceController(AVVoiceControllerInternal) handleRouteChange:]");
    v13 = v25;
    if (v25)
    {
      v14 = (unint64_t *)&v25->__shared_owners_;
      do
        v15 = __ldaxr(v14);
      while (__stlxr(v15 - 1, v14));
      if (!v15)
      {
        ((void (*)(std::__shared_weak_count *))v13->__on_zero_shared)(v13);
        std::__shared_weak_count::__release_weak(v13);
      }
    }

    goto LABEL_19;
  }
LABEL_20:
  v17 = v27;
  if (v27)
  {
    v18 = (unint64_t *)&v27->__shared_owners_;
    do
      v19 = __ldaxr(v18);
    while (__stlxr(v19 - 1, v18));
    if (!v19)
    {
      ((void (*)(std::__shared_weak_count *))v17->__on_zero_shared)(v17);
      std::__shared_weak_count::__release_weak(v17);
    }
  }

}

- (void)handleMediaServerDeath:(id)a3
{
  void (**v4)(_QWORD);
  uint64_t v5;
  BOOL v6;
  unint64_t *p_shared_owners;
  unint64_t v8;
  std::__shared_weak_count *v9;
  unint64_t *v10;
  unint64_t v11;
  NSObject *v12;
  id v13;
  std::__shared_weak_count *v14;
  unint64_t *v15;
  unint64_t v16;
  _QWORD v17[5];
  void (**v18)(_QWORD);
  uint64_t v19;
  std::__shared_weak_count *v20;
  BOOL v21;
  uint64_t v22;
  std::__shared_weak_count *v23;
  int v24;
  char v25;
  __int128 v26;
  __int128 v27;
  uint8_t buf[4];
  const char *v29;
  __int16 v30;
  int v31;
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  v4 = (void (**)(_QWORD))a3;
  v24 = 4110;
  v25 = 0;
  v26 = 0u;
  v27 = 0u;
  kdebug_trace();
  -[AVVoiceController impl](self, "impl");
  v5 = v22;
  if (v22)
  {
    v6 = !self->mClientAPIClutch;
    v17[0] = MEMORY[0x1E0C809B0];
    v17[1] = 3321888768;
    v17[2] = __71__AVVoiceController_AVVoiceControllerInternal__handleMediaServerDeath___block_invoke;
    v17[3] = &unk_1E3BE5DD0;
    v21 = v6;
    v19 = v22;
    v20 = v23;
    if (v23)
    {
      p_shared_owners = (unint64_t *)&v23->__shared_owners_;
      do
        v8 = __ldxr(p_shared_owners);
      while (__stxr(v8 + 1, p_shared_owners));
    }
    v17[4] = self;
    v18 = v4;
    ControllerImpl::dispatchAndSafeWork(v5, v17, (uint64_t)"-[AVVoiceController(AVVoiceControllerInternal) handleMediaServerDeath:]");

    v9 = v20;
    if (v20)
    {
      v10 = (unint64_t *)&v20->__shared_owners_;
      do
        v11 = __ldaxr(v10);
      while (__stlxr(v11 - 1, v10));
      if (!v11)
      {
        ((void (*)(std::__shared_weak_count *))v9->__on_zero_shared)(v9);
        std::__shared_weak_count::__release_weak(v9);
      }
    }
    goto LABEL_19;
  }
  if (!kAVVCScope)
  {
    v12 = MEMORY[0x1E0C81028];
    v13 = MEMORY[0x1E0C81028];
    goto LABEL_14;
  }
  v12 = *(id *)kAVVCScope;
  if (v12)
  {
LABEL_14:
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      v29 = "AVVoiceController.mm";
      v30 = 1024;
      v31 = 388;
      _os_log_impl(&dword_19B733000, v12, OS_LOG_TYPE_ERROR, "%25s:%-5d handleMediaServerDeath: ControllerImpl is nil. Bailing!", buf, 0x12u);
    }

  }
  if (v4)
    v4[2](v4);
LABEL_19:
  v14 = v23;
  if (v23)
  {
    v15 = (unint64_t *)&v23->__shared_owners_;
    do
      v16 = __ldaxr(v15);
    while (__stlxr(v16 - 1, v15));
    if (!v16)
    {
      ((void (*)(std::__shared_weak_count *))v14->__on_zero_shared)(v14);
      std::__shared_weak_count::__release_weak(v14);
    }
  }
  TraceWrapper::~TraceWrapper((TraceWrapper *)&v24);

}

- (void)handleMediaServerReset:(id)a3
{
  void (**v4)(_QWORD);
  uint64_t v5;
  BOOL v6;
  unint64_t *p_shared_owners;
  unint64_t v8;
  std::__shared_weak_count *v9;
  unint64_t *v10;
  unint64_t v11;
  NSObject *v12;
  id v13;
  std::__shared_weak_count *v14;
  unint64_t *v15;
  unint64_t v16;
  _QWORD v17[5];
  void (**v18)(_QWORD);
  uint64_t v19;
  std::__shared_weak_count *v20;
  BOOL v21;
  uint64_t v22;
  std::__shared_weak_count *v23;
  int v24;
  char v25;
  __int128 v26;
  __int128 v27;
  uint8_t buf[4];
  const char *v29;
  __int16 v30;
  int v31;
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  v4 = (void (**)(_QWORD))a3;
  v24 = 4111;
  v25 = 0;
  v26 = 0u;
  v27 = 0u;
  kdebug_trace();
  -[AVVoiceController impl](self, "impl");
  v5 = v22;
  if (v22)
  {
    v6 = !self->mClientAPIClutch;
    v17[0] = MEMORY[0x1E0C809B0];
    v17[1] = 3321888768;
    v17[2] = __71__AVVoiceController_AVVoiceControllerInternal__handleMediaServerReset___block_invoke;
    v17[3] = &unk_1E3BE5DD0;
    v21 = v6;
    v19 = v22;
    v20 = v23;
    if (v23)
    {
      p_shared_owners = (unint64_t *)&v23->__shared_owners_;
      do
        v8 = __ldxr(p_shared_owners);
      while (__stxr(v8 + 1, p_shared_owners));
    }
    v17[4] = self;
    v18 = v4;
    ControllerImpl::dispatchAndSafeWork(v5, v17, (uint64_t)"-[AVVoiceController(AVVoiceControllerInternal) handleMediaServerReset:]");

    v9 = v20;
    if (v20)
    {
      v10 = (unint64_t *)&v20->__shared_owners_;
      do
        v11 = __ldaxr(v10);
      while (__stlxr(v11 - 1, v10));
      if (!v11)
      {
        ((void (*)(std::__shared_weak_count *))v9->__on_zero_shared)(v9);
        std::__shared_weak_count::__release_weak(v9);
      }
    }
    goto LABEL_19;
  }
  if (!kAVVCScope)
  {
    v12 = MEMORY[0x1E0C81028];
    v13 = MEMORY[0x1E0C81028];
    goto LABEL_14;
  }
  v12 = *(id *)kAVVCScope;
  if (v12)
  {
LABEL_14:
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      v29 = "AVVoiceController.mm";
      v30 = 1024;
      v31 = 423;
      _os_log_impl(&dword_19B733000, v12, OS_LOG_TYPE_ERROR, "%25s:%-5d handleMediaServerReset: ControllerImpl is nil. Bailing!", buf, 0x12u);
    }

  }
  if (v4)
    v4[2](v4);
LABEL_19:
  v14 = v23;
  if (v23)
  {
    v15 = (unint64_t *)&v23->__shared_owners_;
    do
      v16 = __ldaxr(v15);
    while (__stlxr(v16 - 1, v15));
    if (!v16)
    {
      ((void (*)(std::__shared_weak_count *))v14->__on_zero_shared)(v14);
      std::__shared_weak_count::__release_weak(v14);
    }
  }
  TraceWrapper::~TraceWrapper((TraceWrapper *)&v24);

}

- (void)configureVoiceTriggerClientCompletionBlocks
{
  uint64_t v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  id v8;
  NSObject *v9;
  void *v10;
  void *v11;
  _QWORD v12[4];
  id v13;
  _QWORD aBlock[4];
  id v15;
  id location;
  uint8_t buf[4];
  const char *v18;
  __int16 v19;
  int v20;
  __int16 v21;
  void *v22;
  __int16 v23;
  void *v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  objc_initWeak(&location, self);
  v2 = MEMORY[0x1E0C809B0];
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __91__AVVoiceController_AVVoiceControllerInternal__configureVoiceTriggerClientCompletionBlocks__block_invoke;
  aBlock[3] = &unk_1E3BEB490;
  objc_copyWeak(&v15, &location);
  v3 = _Block_copy(aBlock);
  v12[0] = v2;
  v12[1] = 3221225472;
  v12[2] = __91__AVVoiceController_AVVoiceControllerInternal__configureVoiceTriggerClientCompletionBlocks__block_invoke_2;
  v12[3] = &unk_1E3BEB490;
  objc_copyWeak(&v13, &location);
  v4 = _Block_copy(v12);
  +[AVVoiceTriggerClient sharedInstance](AVVoiceTriggerClient, "sharedInstance");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setAVVCServerCrashedBlock:", v3);

  +[AVVoiceTriggerClient sharedInstance](AVVoiceTriggerClient, "sharedInstance");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setAVVCServerResetBlock:", v4);

  if (kAVVCScope)
  {
    v7 = *(id *)kAVVCScope;
    if (!v7)
      goto LABEL_8;
  }
  else
  {
    v7 = (id)MEMORY[0x1E0C81028];
    v8 = MEMORY[0x1E0C81028];
  }
  v9 = v7;
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    v10 = _Block_copy(v3);
    v11 = _Block_copy(v4);
    *(_DWORD *)buf = 136315906;
    v18 = "AVVoiceController.mm";
    v19 = 1024;
    v20 = 485;
    v21 = 2048;
    v22 = v10;
    v23 = 2048;
    v24 = v11;
    _os_log_impl(&dword_19B733000, v9, OS_LOG_TYPE_DEFAULT, "%25s:%-5d configureVoiceTriggerClientCompletionBlocks: crashBlock: %p resetBlock: %p", buf, 0x26u);

  }
LABEL_8:
  objc_destroyWeak(&v13);
  objc_destroyWeak(&v15);
  objc_destroyWeak(&location);

}

- (void)handlePluginDidPublishDevice:(id)a3 withDevice:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  id v9;
  unint64_t *p_shared_owners;
  unint64_t v11;
  uint64_t v12;
  std::__shared_weak_count *v13;
  uint8_t buf[4];
  const char *v15;
  __int16 v16;
  int v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  -[AVVoiceController impl](self, "impl");
  if (v12)
  {
    ControllerImpl::handlePluginDidPublishDevice(self, v6, v7);
  }
  else
  {
    if (kAVVCScope)
    {
      v8 = *(id *)kAVVCScope;
      if (!v8)
        goto LABEL_10;
    }
    else
    {
      v8 = MEMORY[0x1E0C81028];
      v9 = MEMORY[0x1E0C81028];
    }
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      v15 = "AVVoiceController.mm";
      v16 = 1024;
      v17 = 494;
      _os_log_impl(&dword_19B733000, v8, OS_LOG_TYPE_ERROR, "%25s:%-5d Error! handlePluginDidPublishDevice: ControllerImpl is NULL", buf, 0x12u);
    }

  }
LABEL_10:
  if (v13)
  {
    p_shared_owners = (unint64_t *)&v13->__shared_owners_;
    do
      v11 = __ldaxr(p_shared_owners);
    while (__stlxr(v11 - 1, p_shared_owners));
    if (!v11)
    {
      ((void (*)())v13->__on_zero_shared)();
      std::__shared_weak_count::__release_weak(v13);
    }
  }

}

- (void)handlePluginDidUnpublishDevice:(id)a3 withDevice:(id)a4
{
  id v6;
  id v7;
  uint64_t v8;
  unint64_t *p_shared_owners;
  unint64_t v10;
  std::__shared_weak_count *v11;
  unint64_t *v12;
  unint64_t v13;
  NSObject *v14;
  id v15;
  std::__shared_weak_count *v16;
  unint64_t *v17;
  unint64_t v18;
  _QWORD v19[5];
  id v20;
  id v21;
  uint64_t v22;
  std::__shared_weak_count *v23;
  uint64_t v24;
  std::__shared_weak_count *v25;
  uint8_t buf[4];
  const char *v27;
  __int16 v28;
  int v29;
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  -[AVVoiceController impl](self, "impl");
  v8 = v24;
  if (v24)
  {
    v19[0] = MEMORY[0x1E0C809B0];
    v19[1] = 3321888768;
    v19[2] = __90__AVVoiceController_AVVoiceControllerInternal__handlePluginDidUnpublishDevice_withDevice___block_invoke;
    v19[3] = &unk_1E3BEA9F8;
    v22 = v24;
    v23 = v25;
    if (v25)
    {
      p_shared_owners = (unint64_t *)&v25->__shared_owners_;
      do
        v10 = __ldxr(p_shared_owners);
      while (__stxr(v10 + 1, p_shared_owners));
    }
    v19[4] = self;
    v20 = v6;
    v21 = v7;
    ControllerImpl::dispatchAndSafeWork(v8, v19, (uint64_t)"-[AVVoiceController(AVVoiceControllerInternal) handlePluginDidUnpublishDevice:withDevice:]");

    v11 = v23;
    if (v23)
    {
      v12 = (unint64_t *)&v23->__shared_owners_;
      do
        v13 = __ldaxr(v12);
      while (__stlxr(v13 - 1, v12));
      if (!v13)
      {
        ((void (*)(std::__shared_weak_count *))v11->__on_zero_shared)(v11);
        std::__shared_weak_count::__release_weak(v11);
      }
    }
  }
  else
  {
    if (kAVVCScope)
    {
      v14 = *(id *)kAVVCScope;
      if (!v14)
        goto LABEL_17;
    }
    else
    {
      v14 = MEMORY[0x1E0C81028];
      v15 = MEMORY[0x1E0C81028];
    }
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      v27 = "AVVoiceController.mm";
      v28 = 1024;
      v29 = 503;
      _os_log_impl(&dword_19B733000, v14, OS_LOG_TYPE_ERROR, "%25s:%-5d Error! handlePluginDidUNpublishDevice: ControllerImpl is NULL", buf, 0x12u);
    }

  }
LABEL_17:
  v16 = v25;
  if (v25)
  {
    v17 = (unint64_t *)&v25->__shared_owners_;
    do
      v18 = __ldaxr(v17);
    while (__stlxr(v18 - 1, v17));
    if (!v18)
    {
      ((void (*)(std::__shared_weak_count *))v16->__on_zero_shared)(v16);
      std::__shared_weak_count::__release_weak(v16);
    }
  }

}

- (void)beganRecording:(unint64_t)a3 status:(int)a4
{
  uint64_t v7;
  NSObject *v8;
  id v9;
  id WeakRetained;
  id v11;
  char v12;
  id v13;
  NSObject *v14;
  id v15;
  id v16;
  char v17;
  id v18;
  id v19;
  id v20;
  char v21;
  id v22;
  id v23;
  id v24;
  unint64_t *p_shared_owners;
  unint64_t v26;
  uint64_t v27;
  std::__shared_weak_count *v28;
  uint8_t buf[4];
  _BYTE v30[20];
  uint64_t v31;
  unint64_t v32;
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
  -[AVVoiceController impl](self, "impl");
  v7 = v27;
  if (v27)
  {
    if (kAVVCScope)
    {
      v8 = *(id *)kAVVCScope;
      if (!v8)
        goto LABEL_9;
    }
    else
    {
      v8 = MEMORY[0x1E0C81028];
      v9 = MEMORY[0x1E0C81028];
    }
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136316162;
      *(_QWORD *)v30 = "AVVoiceController.mm";
      *(_WORD *)&v30[8] = 1024;
      *(_DWORD *)&v30[10] = 525;
      *(_WORD *)&v30[14] = 1024;
      *(_DWORD *)&v30[16] = a4 == 0;
      LOWORD(v31) = 1024;
      *(_DWORD *)((char *)&v31 + 2) = a4;
      HIWORD(v31) = 2048;
      v32 = a3;
      _os_log_impl(&dword_19B733000, v8, OS_LOG_TYPE_DEFAULT, "%25s:%-5d #### beganRecording: (success = %d status = %d streamID = %llu) ####", buf, 0x28u);
    }

    v7 = v27;
LABEL_9:
    WeakRetained = objc_loadWeakRetained((id *)(v7 + 168));
    if (WeakRetained
      && (v11 = objc_loadWeakRetained((id *)(v27 + 168)),
          v12 = objc_opt_respondsToSelector(),
          v11,
          WeakRetained,
          (v12 & 1) != 0))
    {
      if (a4)
      {
        v13 = objc_alloc(MEMORY[0x1E0CB35C8]);
        v14 = objc_msgSend(v13, "initWithDomain:code:userInfo:", *MEMORY[0x1E0CB2F90], a4, 0);
      }
      else
      {
        v14 = 0;
      }
      v23 = objc_loadWeakRetained((id *)(v27 + 168));
      objc_msgSend(v23, "voiceControllerDidStartRecording:forStream:successfully:error:", self, a3, a4 == 0, v14);

    }
    else
    {
      v15 = objc_loadWeakRetained((id *)(v27 + 168));
      if (v15
        && (v16 = objc_loadWeakRetained((id *)(v27 + 168)),
            v17 = objc_opt_respondsToSelector(),
            v16,
            v15,
            (v17 & 1) != 0))
      {
        if (a4)
        {
          v18 = objc_alloc(MEMORY[0x1E0CB35C8]);
          v14 = objc_msgSend(v18, "initWithDomain:code:userInfo:", *MEMORY[0x1E0CB2F90], a4, 0);
        }
        else
        {
          v14 = 0;
        }
        v24 = objc_loadWeakRetained((id *)(v27 + 168));
        objc_msgSend(v24, "voiceControllerDidStartRecording:successfully:error:", self, a4 == 0, v14);

      }
      else
      {
        v19 = objc_loadWeakRetained((id *)(v27 + 168));
        if (v19
          && (v20 = objc_loadWeakRetained((id *)(v27 + 168)),
              v21 = objc_opt_respondsToSelector(),
              v20,
              v19,
              (v21 & 1) != 0))
        {
          v14 = objc_loadWeakRetained((id *)(v27 + 168));
          -[NSObject voiceControllerDidStartRecording:successfully:](v14, "voiceControllerDidStartRecording:successfully:", self, a4 == 0);
        }
        else
        {
          if (kAVVCScope)
          {
            v14 = *(id *)kAVVCScope;
            if (!v14)
              goto LABEL_31;
          }
          else
          {
            v14 = MEMORY[0x1E0C81028];
            v22 = MEMORY[0x1E0C81028];
          }
          if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
          {
            *(_DWORD *)buf = 136315394;
            *(_QWORD *)v30 = "AVVoiceController.mm";
            *(_WORD *)&v30[8] = 1024;
            *(_DWORD *)&v30[10] = 539;
            _os_log_impl(&dword_19B733000, v14, OS_LOG_TYPE_DEBUG, "%25s:%-5d WARNING: delegate is nil or does not respond to voiceControllerDidStartRecording: variants", buf, 0x12u);
          }
        }
      }
    }

LABEL_31:
    ProfileMetrics(CFSTR("AVVC_PROFILE_Prop_RecordStarted"));
    *(_DWORD *)buf = 4115;
    v30[0] = 0;
    *(_OWORD *)&v30[4] = (unint64_t)a4;
    v31 = 0;
    v32 = 0;
    kdebug_trace();
    TraceWrapper::~TraceWrapper((TraceWrapper *)buf);
  }
  if (v28)
  {
    p_shared_owners = (unint64_t *)&v28->__shared_owners_;
    do
      v26 = __ldaxr(p_shared_owners);
    while (__stlxr(v26 - 1, p_shared_owners));
    if (!v26)
    {
      ((void (*)())v28->__on_zero_shared)();
      std::__shared_weak_count::__release_weak(v28);
    }
  }
}

- (void)finishedRecording:(unint64_t)a3 status:(int)a4
{
  unint64_t v4;
  uint64_t v7;
  NSObject *v8;
  NSObject *v9;
  id v10;
  id v11;
  BOOL v12;
  int v13;
  id WeakRetained;
  id v15;
  char v16;
  id v17;
  id v18;
  id v19;
  char v20;
  id v21;
  NSObject *v22;
  id v23;
  unint64_t *p_shared_owners;
  unint64_t v25;
  uint64_t v26;
  std::__shared_weak_count *v27;
  uint8_t buf[4];
  _BYTE v29[20];
  uint64_t v30;
  unint64_t v31;
  uint64_t v32;

  LODWORD(v4) = a4;
  v32 = *MEMORY[0x1E0C80C00];
  if (ObjectExists(self))
  {
    -[AVVoiceController impl](self, "impl");
    v7 = v26;
    if (!v26)
      goto LABEL_38;
    if (kAVVCScope)
    {
      v8 = *(id *)kAVVCScope;
      if (!v8)
        goto LABEL_23;
    }
    else
    {
      v8 = MEMORY[0x1E0C81028];
      v11 = MEMORY[0x1E0C81028];
    }
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136316162;
      *(_QWORD *)v29 = "AVVoiceController.mm";
      v12 = (_DWORD)v4 == -11789 || (_DWORD)v4 == 0;
      *(_WORD *)&v29[8] = 1024;
      v13 = v12;
      *(_DWORD *)&v29[10] = 559;
      *(_WORD *)&v29[14] = 1024;
      *(_DWORD *)&v29[16] = v13;
      LOWORD(v30) = 1024;
      *(_DWORD *)((char *)&v30 + 2) = v4;
      HIWORD(v30) = 2048;
      v31 = a3;
      _os_log_impl(&dword_19B733000, v8, OS_LOG_TYPE_DEFAULT, "%25s:%-5d #### AVVoiceController: Recording finished (success = %d status = %d streamID = %llu) ####", buf, 0x28u);
    }

    v7 = v26;
LABEL_23:
    WeakRetained = objc_loadWeakRetained((id *)(v7 + 168));
    if (WeakRetained)
    {
      v15 = objc_loadWeakRetained((id *)(v26 + 168));
      v16 = objc_opt_respondsToSelector();

      if ((v16 & 1) != 0)
      {
        v17 = objc_loadWeakRetained((id *)(v26 + 168));
        v4 = (int)v4;
        objc_msgSend(v17, "voiceControllerDidStopRecording:forStream:forReason:", self, a3, (int)v4);

LABEL_37:
        *(_DWORD *)buf = 4116;
        v29[0] = 0;
        *(_OWORD *)&v29[4] = v4;
        v30 = 0;
        v31 = 0;
        kdebug_trace();
        TraceWrapper::~TraceWrapper((TraceWrapper *)buf);
LABEL_38:
        if (v27)
        {
          p_shared_owners = (unint64_t *)&v27->__shared_owners_;
          do
            v25 = __ldaxr(p_shared_owners);
          while (__stlxr(v25 - 1, p_shared_owners));
          if (!v25)
          {
            ((void (*)())v27->__on_zero_shared)();
            std::__shared_weak_count::__release_weak(v27);
          }
        }
        return;
      }
    }
    v18 = objc_loadWeakRetained((id *)(v26 + 168));
    if (v18)
    {
      v19 = objc_loadWeakRetained((id *)(v26 + 168));
      v20 = objc_opt_respondsToSelector();

      if ((v20 & 1) != 0)
      {
        v21 = objc_loadWeakRetained((id *)(v26 + 168));
        v4 = (int)v4;
        objc_msgSend(v21, "voiceControllerDidStopRecording:forReason:", self, (int)v4);

        goto LABEL_37;
      }
    }
    if (kAVVCScope)
    {
      v22 = *(id *)kAVVCScope;
      if (!v22)
      {
LABEL_36:
        v4 = (int)v4;
        goto LABEL_37;
      }
    }
    else
    {
      v22 = MEMORY[0x1E0C81028];
      v23 = MEMORY[0x1E0C81028];
    }
    if (os_log_type_enabled(v22, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 136315394;
      *(_QWORD *)v29 = "AVVoiceController.mm";
      *(_WORD *)&v29[8] = 1024;
      *(_DWORD *)&v29[10] = 568;
      _os_log_impl(&dword_19B733000, v22, OS_LOG_TYPE_DEBUG, "%25s:%-5d WARNING: delegate is nil or does not respond to voiceControllerDidStopRecording:forReason:", buf, 0x12u);
    }

    goto LABEL_36;
  }
  if (kAVVCScope)
  {
    v9 = *(id *)kAVVCScope;
    if (!v9)
      return;
  }
  else
  {
    v9 = MEMORY[0x1E0C81028];
    v10 = MEMORY[0x1E0C81028];
  }
  if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 136315394;
    *(_QWORD *)v29 = "AVVoiceController.mm";
    *(_WORD *)&v29[8] = 1024;
    *(_DWORD *)&v29[10] = 550;
    _os_log_impl(&dword_19B733000, v9, OS_LOG_TYPE_ERROR, "%25s:%-5d finishedRecording -> called after AVVC object destroyed -- ignoring call and possibly leaking ControllerImpl", buf, 0x12u);
  }

}

- (void)startpointDetected
{
  uint64_t v3;
  NSObject *v4;
  NSObject *v5;
  id v6;
  id v7;
  id WeakRetained;
  id v9;
  char v10;
  NSObject *v11;
  id v12;
  unint64_t *p_shared_owners;
  unint64_t v14;
  uint64_t v15;
  std::__shared_weak_count *v16;
  uint8_t buf[4];
  const char *v18;
  __int16 v19;
  int v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  if (ObjectExists(self))
  {
    -[AVVoiceController impl](self, "impl");
    v3 = v15;
    if (!v15)
      goto LABEL_27;
    if (kAVVCScope)
    {
      v4 = *(id *)kAVVCScope;
      if (!v4)
        goto LABEL_17;
    }
    else
    {
      v4 = MEMORY[0x1E0C81028];
      v7 = MEMORY[0x1E0C81028];
    }
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315394;
      v18 = "AVVoiceController.mm";
      v19 = 1024;
      v20 = 584;
      _os_log_impl(&dword_19B733000, v4, OS_LOG_TYPE_DEFAULT, "%25s:%-5d #### startpointDetected: ####", buf, 0x12u);
    }

    v3 = v15;
LABEL_17:
    WeakRetained = objc_loadWeakRetained((id *)(v3 + 168));
    if (WeakRetained
      && (v9 = objc_loadWeakRetained((id *)(v15 + 168)),
          v10 = objc_opt_respondsToSelector(),
          v9,
          WeakRetained,
          (v10 & 1) != 0))
    {
      v11 = objc_loadWeakRetained((id *)(v15 + 168));
      -[NSObject voiceControllerDidDetectStartpoint:](v11, "voiceControllerDidDetectStartpoint:", self);
    }
    else
    {
      if (kAVVCScope)
      {
        v11 = *(id *)kAVVCScope;
        if (!v11)
        {
LABEL_27:
          if (v16)
          {
            p_shared_owners = (unint64_t *)&v16->__shared_owners_;
            do
              v14 = __ldaxr(p_shared_owners);
            while (__stlxr(v14 - 1, p_shared_owners));
            if (!v14)
            {
              ((void (*)())v16->__on_zero_shared)();
              std::__shared_weak_count::__release_weak(v16);
            }
          }
          return;
        }
      }
      else
      {
        v11 = MEMORY[0x1E0C81028];
        v12 = MEMORY[0x1E0C81028];
      }
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 136315394;
        v18 = "AVVoiceController.mm";
        v19 = 1024;
        v20 = 589;
        _os_log_impl(&dword_19B733000, v11, OS_LOG_TYPE_DEBUG, "%25s:%-5d WARNING: delegate is nil or does not respond to voiceControllerDidDetectStartpoint:", buf, 0x12u);
      }
    }

    goto LABEL_27;
  }
  if (kAVVCScope)
  {
    v5 = *(id *)kAVVCScope;
    if (!v5)
      return;
  }
  else
  {
    v5 = MEMORY[0x1E0C81028];
    v6 = MEMORY[0x1E0C81028];
  }
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 136315394;
    v18 = "AVVoiceController.mm";
    v19 = 1024;
    v20 = 576;
    _os_log_impl(&dword_19B733000, v5, OS_LOG_TYPE_DEBUG, "%25s:%-5d startpointDetected -> called after object destroyed -- ignoring call", buf, 0x12u);
  }

}

- (void)interspeechPointDetectedAtTime:(double)a3
{
  uint64_t v5;
  NSObject *v6;
  NSObject *v7;
  id v8;
  id v9;
  id WeakRetained;
  id v11;
  char v12;
  NSObject *v13;
  id v14;
  id v15;
  char v16;
  id v17;
  unint64_t *p_shared_owners;
  unint64_t v19;
  uint64_t v20;
  std::__shared_weak_count *v21;
  uint8_t buf[4];
  const char *v23;
  __int16 v24;
  int v25;
  __int16 v26;
  double v27;
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  if (ObjectExists(self))
  {
    -[AVVoiceController impl](self, "impl");
    v5 = v20;
    if (!v20)
      goto LABEL_30;
    if (kAVVCScope)
    {
      v6 = *(id *)kAVVCScope;
      if (!v6)
        goto LABEL_17;
    }
    else
    {
      v6 = MEMORY[0x1E0C81028];
      v9 = MEMORY[0x1E0C81028];
    }
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315650;
      v23 = "AVVoiceController.mm";
      v24 = 1024;
      v25 = 603;
      v26 = 2048;
      v27 = a3;
      _os_log_impl(&dword_19B733000, v6, OS_LOG_TYPE_DEFAULT, "%25s:%-5d #### interspeechPointDetected: time %.2f seconds ####", buf, 0x1Cu);
    }

    v5 = v20;
LABEL_17:
    WeakRetained = objc_loadWeakRetained((id *)(v5 + 168));
    if (WeakRetained
      && (v11 = objc_loadWeakRetained((id *)(v20 + 168)),
          v12 = objc_opt_respondsToSelector(),
          v11,
          WeakRetained,
          (v12 & 1) != 0))
    {
      v13 = objc_loadWeakRetained((id *)(v20 + 168));
      -[NSObject voiceControllerDidDetectEndpoint:ofType:atTime:](v13, "voiceControllerDidDetectEndpoint:ofType:atTime:", self, 1, a3);
    }
    else
    {
      v14 = objc_loadWeakRetained((id *)(v20 + 168));
      if (v14
        && (v15 = objc_loadWeakRetained((id *)(v20 + 168)),
            v16 = objc_opt_respondsToSelector(),
            v15,
            v14,
            (v16 & 1) != 0))
      {
        v13 = objc_loadWeakRetained((id *)(v20 + 168));
        -[NSObject voiceControllerDidDetectEndpoint:ofType:](v13, "voiceControllerDidDetectEndpoint:ofType:", self, 1);
      }
      else
      {
        if (kAVVCScope)
        {
          v13 = *(id *)kAVVCScope;
          if (!v13)
          {
LABEL_30:
            if (v21)
            {
              p_shared_owners = (unint64_t *)&v21->__shared_owners_;
              do
                v19 = __ldaxr(p_shared_owners);
              while (__stlxr(v19 - 1, p_shared_owners));
              if (!v19)
              {
                ((void (*)())v21->__on_zero_shared)();
                std::__shared_weak_count::__release_weak(v21);
              }
            }
            return;
          }
        }
        else
        {
          v13 = MEMORY[0x1E0C81028];
          v17 = MEMORY[0x1E0C81028];
        }
        if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 136315394;
          v23 = "AVVoiceController.mm";
          v24 = 1024;
          v25 = 611;
          _os_log_impl(&dword_19B733000, v13, OS_LOG_TYPE_DEBUG, "%25s:%-5d WARNING: delegate is nil or does not respond to voiceControllerDidDetectEndpoint:ofType:", buf, 0x12u);
        }
      }
    }

    goto LABEL_30;
  }
  if (kAVVCScope)
  {
    v7 = *(id *)kAVVCScope;
    if (!v7)
      return;
  }
  else
  {
    v7 = MEMORY[0x1E0C81028];
    v8 = MEMORY[0x1E0C81028];
  }
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 136315394;
    v23 = "AVVoiceController.mm";
    v24 = 1024;
    v25 = 596;
    _os_log_impl(&dword_19B733000, v7, OS_LOG_TYPE_DEBUG, "%25s:%-5d interspeechPointDetected -> called after object destroyed -- ignoring call", buf, 0x12u);
  }

}

- (void)endpointDetectedAtTime:(double)a3
{
  uint64_t v5;
  NSObject *v6;
  NSObject *v7;
  id v8;
  id v9;
  id WeakRetained;
  id v11;
  char v12;
  NSObject *v13;
  id v14;
  id v15;
  char v16;
  id v17;
  unint64_t *p_shared_owners;
  unint64_t v19;
  uint64_t v20;
  std::__shared_weak_count *v21;
  uint8_t buf[4];
  const char *v23;
  __int16 v24;
  int v25;
  __int16 v26;
  double v27;
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  if (ObjectExists(self))
  {
    -[AVVoiceController impl](self, "impl");
    v5 = v20;
    if (!v20)
      goto LABEL_30;
    if (kAVVCScope)
    {
      v6 = *(id *)kAVVCScope;
      if (!v6)
        goto LABEL_17;
    }
    else
    {
      v6 = MEMORY[0x1E0C81028];
      v9 = MEMORY[0x1E0C81028];
    }
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315650;
      v23 = "AVVoiceController.mm";
      v24 = 1024;
      v25 = 625;
      v26 = 2048;
      v27 = a3;
      _os_log_impl(&dword_19B733000, v6, OS_LOG_TYPE_DEFAULT, "%25s:%-5d #### endpointDetected: time %.2f seconds ####", buf, 0x1Cu);
    }

    v5 = v20;
LABEL_17:
    WeakRetained = objc_loadWeakRetained((id *)(v5 + 168));
    if (WeakRetained
      && (v11 = objc_loadWeakRetained((id *)(v20 + 168)),
          v12 = objc_opt_respondsToSelector(),
          v11,
          WeakRetained,
          (v12 & 1) != 0))
    {
      v13 = objc_loadWeakRetained((id *)(v20 + 168));
      -[NSObject voiceControllerDidDetectEndpoint:ofType:atTime:](v13, "voiceControllerDidDetectEndpoint:ofType:atTime:", self, 2, a3);
    }
    else
    {
      v14 = objc_loadWeakRetained((id *)(v20 + 168));
      if (v14
        && (v15 = objc_loadWeakRetained((id *)(v20 + 168)),
            v16 = objc_opt_respondsToSelector(),
            v15,
            v14,
            (v16 & 1) != 0))
      {
        v13 = objc_loadWeakRetained((id *)(v20 + 168));
        -[NSObject voiceControllerDidDetectEndpoint:ofType:](v13, "voiceControllerDidDetectEndpoint:ofType:", self, 2);
      }
      else
      {
        if (kAVVCScope)
        {
          v13 = *(id *)kAVVCScope;
          if (!v13)
          {
LABEL_30:
            if (v21)
            {
              p_shared_owners = (unint64_t *)&v21->__shared_owners_;
              do
                v19 = __ldaxr(p_shared_owners);
              while (__stlxr(v19 - 1, p_shared_owners));
              if (!v19)
              {
                ((void (*)())v21->__on_zero_shared)();
                std::__shared_weak_count::__release_weak(v21);
              }
            }
            return;
          }
        }
        else
        {
          v13 = MEMORY[0x1E0C81028];
          v17 = MEMORY[0x1E0C81028];
        }
        if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 136315394;
          v23 = "AVVoiceController.mm";
          v24 = 1024;
          v25 = 633;
          _os_log_impl(&dword_19B733000, v13, OS_LOG_TYPE_DEBUG, "%25s:%-5d WARNING: delegate is nil or does not respond to voiceControllerDidDetectEndpoint:ofType:", buf, 0x12u);
        }
      }
    }

    goto LABEL_30;
  }
  if (kAVVCScope)
  {
    v7 = *(id *)kAVVCScope;
    if (!v7)
      return;
  }
  else
  {
    v7 = MEMORY[0x1E0C81028];
    v8 = MEMORY[0x1E0C81028];
  }
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 136315394;
    v23 = "AVVoiceController.mm";
    v24 = 1024;
    v25 = 618;
    _os_log_impl(&dword_19B733000, v7, OS_LOG_TYPE_DEBUG, "%25s:%-5d endpointDetected -> called after object destroyed -- ignoring call", buf, 0x12u);
  }

}

- (void)encodeError:(int)a3
{
  uint64_t v5;
  id v6;
  id v7;
  NSObject *v8;
  id WeakRetained;
  id v10;
  char v11;
  id v12;
  NSObject *v13;
  id v14;
  id v15;
  unint64_t *p_shared_owners;
  unint64_t v17;
  uint64_t v18;
  std::__shared_weak_count *v19;
  uint8_t v20[16];
  uint8_t buf[4];
  const char *v22;
  __int16 v23;
  int v24;
  __int16 v25;
  uint8_t *v26;
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  -[AVVoiceController impl](self, "impl");
  v5 = v18;
  if (v18)
  {
    if (kAVVCScope)
    {
      v6 = *(id *)kAVVCScope;
      if (!v6)
        goto LABEL_9;
    }
    else
    {
      v6 = (id)MEMORY[0x1E0C81028];
      v7 = MEMORY[0x1E0C81028];
    }
    v8 = v6;
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      CAX4CCString::CAX4CCString((CAX4CCString *)v20, a3);
      *(_DWORD *)buf = 136315650;
      v22 = "AVVoiceController.mm";
      v23 = 1024;
      v24 = 643;
      v25 = 2080;
      v26 = v20;
      _os_log_impl(&dword_19B733000, v8, OS_LOG_TYPE_ERROR, "%25s:%-5d     Reporting encoder error %s via delegate", buf, 0x1Cu);
    }

    v5 = v18;
LABEL_9:
    WeakRetained = objc_loadWeakRetained((id *)(v5 + 168));
    if (WeakRetained)
    {
      v10 = objc_loadWeakRetained((id *)(v18 + 168));
      v11 = objc_opt_respondsToSelector();

      if ((v11 & 1) != 0)
      {
        v12 = objc_alloc(MEMORY[0x1E0CB35C8]);
        v13 = objc_msgSend(v12, "initWithDomain:code:userInfo:", *MEMORY[0x1E0CB2F90], a3, 0);
        v14 = objc_loadWeakRetained((id *)(v18 + 168));
        objc_msgSend(v14, "voiceControllerEncoderErrorDidOccur:error:", self, v13);

LABEL_18:
        goto LABEL_19;
      }
    }
    if (kAVVCScope)
    {
      v13 = *(id *)kAVVCScope;
      if (!v13)
        goto LABEL_19;
    }
    else
    {
      v13 = MEMORY[0x1E0C81028];
      v15 = MEMORY[0x1E0C81028];
    }
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315394;
      v22 = "AVVoiceController.mm";
      v23 = 1024;
      v24 = 649;
      _os_log_impl(&dword_19B733000, v13, OS_LOG_TYPE_DEFAULT, "%25s:%-5d encodeError detected but no record delegate, or notify selector not supported", buf, 0x12u);
    }
    goto LABEL_18;
  }
LABEL_19:
  if (v19)
  {
    p_shared_owners = (unint64_t *)&v19->__shared_owners_;
    do
      v17 = __ldaxr(p_shared_owners);
    while (__stlxr(v17 - 1, p_shared_owners));
    if (!v17)
    {
      ((void (*)())v19->__on_zero_shared)();
      std::__shared_weak_count::__release_weak(v19);
    }
  }
}

- (void)alertPlaybackFinishedWithSettings:(id)a3
{
  id v4;
  id WeakRetained;
  id v6;
  char v7;
  id v8;
  id v9;
  id v10;
  id v11;
  char v12;
  id v13;
  id v14;
  id v15;
  NSObject *v16;
  const char *v17;
  NSObject *v18;
  uint32_t v19;
  id v20;
  unint64_t *p_shared_owners;
  unint64_t v22;
  uint64_t v23;
  std::__shared_weak_count *v24;
  uint8_t buf[4];
  const char *v26;
  __int16 v27;
  int v28;
  __int16 v29;
  int v30;
  __int16 v31;
  int v32;
  __int16 v33;
  uint64_t v34;
  uint64_t v35;

  v35 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[AVVoiceController impl](self, "impl");
  if (v23)
  {
    WeakRetained = objc_loadWeakRetained((id *)(v23 + 168));
    if (WeakRetained)
    {
      v6 = objc_loadWeakRetained((id *)(v23 + 168));
      v7 = objc_opt_respondsToSelector();

      if ((v7 & 1) != 0)
      {
        v8 = objc_loadWeakRetained((id *)(v23 + 168));
        objc_msgSend(v8, "voiceControllerDidFinishAlertPlayback:withSettings:error:", self, v4, 0);

        if (kAVVCScope)
        {
          v9 = *(id *)kAVVCScope;
          if (!v9)
            goto LABEL_20;
        }
        else
        {
          v9 = (id)MEMORY[0x1E0C81028];
          v15 = MEMORY[0x1E0C81028];
        }
        v16 = v9;
        if (!os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
          goto LABEL_19;
        *(_DWORD *)buf = 136316162;
        v26 = "AVVoiceController.mm";
        v27 = 1024;
        v28 = 661;
        v29 = 1024;
        v30 = objc_msgSend(v4, "type");
        v31 = 1024;
        v32 = objc_msgSend(v4, "mode");
        v33 = 2048;
        v34 = objc_msgSend(v4, "alertEndTime");
        v17 = "%25s:%-5d Calling alert playback finished delegate. Settings { Type: %d, Mode: %d, alertEndTime: %llu }";
        v18 = v16;
        v19 = 40;
        goto LABEL_18;
      }
    }
    v10 = objc_loadWeakRetained((id *)(v23 + 168));
    if (v10)
    {
      v11 = objc_loadWeakRetained((id *)(v23 + 168));
      v12 = objc_opt_respondsToSelector();

      if ((v12 & 1) != 0)
      {
        v13 = objc_loadWeakRetained((id *)(v23 + 168));
        objc_msgSend(v13, "voiceControllerDidFinishAlertPlayback:ofType:error:", self, objc_msgSend(v4, "type"), 0);

        if (kAVVCScope)
        {
          v14 = *(id *)kAVVCScope;
          if (!v14)
            goto LABEL_20;
        }
        else
        {
          v14 = (id)MEMORY[0x1E0C81028];
          v20 = MEMORY[0x1E0C81028];
        }
        v16 = v14;
        if (!os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
          goto LABEL_19;
        *(_DWORD *)buf = 136315650;
        v26 = "AVVoiceController.mm";
        v27 = 1024;
        v28 = 665;
        v29 = 1024;
        v30 = objc_msgSend(v4, "type");
        v17 = "%25s:%-5d Calling alert playback finished delegate. Type: %d";
        v18 = v16;
        v19 = 24;
LABEL_18:
        _os_log_impl(&dword_19B733000, v18, OS_LOG_TYPE_DEFAULT, v17, buf, v19);
LABEL_19:

      }
    }
  }
LABEL_20:
  if (v24)
  {
    p_shared_owners = (unint64_t *)&v24->__shared_owners_;
    do
      v22 = __ldaxr(p_shared_owners);
    while (__stlxr(v22 - 1, p_shared_owners));
    if (!v22)
    {
      ((void (*)())v24->__on_zero_shared)();
      std::__shared_weak_count::__release_weak(v24);
    }
  }

}

- (void)notifyStreamInvalidated:(unint64_t)a3
{
  id WeakRetained;
  id v6;
  char v7;
  NSObject *v8;
  NSObject *v9;
  id v10;
  id v11;
  unint64_t *p_shared_owners;
  unint64_t v13;
  uint64_t v14;
  std::__shared_weak_count *v15;
  uint8_t buf[4];
  const char *v17;
  __int16 v18;
  int v19;
  __int16 v20;
  unint64_t v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  -[AVVoiceController impl](self, "impl");
  if (v14)
  {
    WeakRetained = objc_loadWeakRetained((id *)(v14 + 168));
    if (WeakRetained)
    {
      v6 = objc_loadWeakRetained((id *)(v14 + 168));
      v7 = objc_opt_respondsToSelector();

      if ((v7 & 1) != 0)
      {
        if (kAVVCScope)
        {
          v8 = *(id *)kAVVCScope;
          if (!v8)
          {
LABEL_17:
            v9 = objc_loadWeakRetained((id *)(v14 + 168));
            -[NSObject voiceControllerStreamInvalidated:forStream:](v9, "voiceControllerStreamInvalidated:forStream:", self, a3);
LABEL_18:

            goto LABEL_19;
          }
        }
        else
        {
          v8 = MEMORY[0x1E0C81028];
          v11 = MEMORY[0x1E0C81028];
        }
        if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 136315650;
          v17 = "AVVoiceController.mm";
          v18 = 1024;
          v19 = 676;
          v20 = 2048;
          v21 = a3;
          _os_log_impl(&dword_19B733000, v8, OS_LOG_TYPE_DEFAULT, "%25s:%-5d Notifying streamHandle(%lu) invalidated", buf, 0x1Cu);
        }

        goto LABEL_17;
      }
    }
    if (kAVVCScope)
    {
      v9 = *(id *)kAVVCScope;
      if (!v9)
        goto LABEL_19;
    }
    else
    {
      v9 = MEMORY[0x1E0C81028];
      v10 = MEMORY[0x1E0C81028];
    }
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315650;
      v17 = "AVVoiceController.mm";
      v18 = 1024;
      v19 = 680;
      v20 = 2048;
      v21 = a3;
      _os_log_impl(&dword_19B733000, v9, OS_LOG_TYPE_DEFAULT, "%25s:%-5d streamHandle(%lu) invalidated but no record delegate, or notify selector not supported", buf, 0x1Cu);
    }
    goto LABEL_18;
  }
LABEL_19:
  if (v15)
  {
    p_shared_owners = (unint64_t *)&v15->__shared_owners_;
    do
      v13 = __ldaxr(p_shared_owners);
    while (__stlxr(v13 - 1, p_shared_owners));
    if (!v13)
    {
      ((void (*)())v15->__on_zero_shared)();
      std::__shared_weak_count::__release_weak(v15);
    }
  }
}

- (void)notifyEventOccured:(unint64_t)a3 error:(id)a4
{
  id v6;
  id WeakRetained;
  id v8;
  char v9;
  NSObject *v10;
  NSObject *v11;
  id v12;
  id v13;
  unint64_t *p_shared_owners;
  unint64_t v15;
  uint64_t v16;
  std::__shared_weak_count *v17;
  uint8_t buf[4];
  const char *v19;
  __int16 v20;
  int v21;
  __int16 v22;
  unint64_t v23;
  __int16 v24;
  id v25;
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v6 = a4;
  -[AVVoiceController impl](self, "impl");
  if (v16)
  {
    WeakRetained = objc_loadWeakRetained((id *)(v16 + 168));
    if (!WeakRetained
      || (v8 = objc_loadWeakRetained((id *)(v16 + 168)),
          v9 = objc_opt_respondsToSelector(),
          v8,
          WeakRetained,
          (v9 & 1) == 0))
    {
      if (kAVVCScope)
      {
        v11 = *(id *)kAVVCScope;
        if (!v11)
          goto LABEL_19;
      }
      else
      {
        v11 = MEMORY[0x1E0C81028];
        v12 = MEMORY[0x1E0C81028];
      }
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315394;
        v19 = "AVVoiceController.mm";
        v20 = 1024;
        v21 = 695;
        _os_log_impl(&dword_19B733000, v11, OS_LOG_TYPE_DEFAULT, "%25s:%-5d WARNING: delegate does not respond to voiceControllerEventOccurred:forStream:error:", buf, 0x12u);
      }
      goto LABEL_18;
    }
    if (kAVVCScope)
    {
      v10 = *(id *)kAVVCScope;
      if (!v10)
      {
LABEL_17:
        v11 = objc_loadWeakRetained((id *)(v16 + 168));
        -[NSObject voiceControllerEventOccurred:forStream:error:](v11, "voiceControllerEventOccurred:forStream:error:", self, a3, v6);
LABEL_18:

        goto LABEL_19;
      }
    }
    else
    {
      v10 = MEMORY[0x1E0C81028];
      v13 = MEMORY[0x1E0C81028];
    }
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315906;
      v19 = "AVVoiceController.mm";
      v20 = 1024;
      v21 = 691;
      v22 = 2048;
      v23 = a3;
      v24 = 2112;
      v25 = v6;
      _os_log_impl(&dword_19B733000, v10, OS_LOG_TYPE_DEFAULT, "%25s:%-5d Notifying streamHandle(%lu) that an event occured: %@", buf, 0x26u);
    }

    goto LABEL_17;
  }
LABEL_19:
  if (v17)
  {
    p_shared_owners = (unint64_t *)&v17->__shared_owners_;
    do
      v15 = __ldaxr(p_shared_owners);
    while (__stlxr(v15 - 1, p_shared_owners));
    if (!v15)
    {
      ((void (*)())v17->__on_zero_shared)();
      std::__shared_weak_count::__release_weak(v17);
    }
  }

}

- (void)beginRecordInterruptionWithContext:(id)a3
{
  id v4;
  id WeakRetained;
  id v6;
  char v7;
  NSObject *v8;
  id v9;
  id v10;
  char v11;
  NSObject *v12;
  NSObject *v13;
  id v14;
  id v15;
  id v16;
  unint64_t *p_shared_owners;
  unint64_t v18;
  uint64_t v19;
  std::__shared_weak_count *v20;
  uint8_t buf[4];
  const char *v22;
  __int16 v23;
  int v24;
  __int16 v25;
  id v26;
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[AVVoiceController impl](self, "impl");
  if (v19)
  {
    WeakRetained = objc_loadWeakRetained((id *)(v19 + 168));
    if (WeakRetained)
    {
      v6 = objc_loadWeakRetained((id *)(v19 + 168));
      v7 = objc_opt_respondsToSelector();

      if ((v7 & 1) != 0)
      {
        if (kAVVCScope)
        {
          v8 = *(id *)kAVVCScope;
          if (!v8)
          {
LABEL_22:
            v13 = objc_loadWeakRetained((id *)(v19 + 168));
            -[NSObject voiceControllerBeginRecordInterruption:withContext:](v13, "voiceControllerBeginRecordInterruption:withContext:", self, v4);
LABEL_28:

            goto LABEL_29;
          }
        }
        else
        {
          v8 = MEMORY[0x1E0C81028];
          v15 = MEMORY[0x1E0C81028];
        }
        if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 136315650;
          v22 = "AVVoiceController.mm";
          v23 = 1024;
          v24 = 708;
          v25 = 2112;
          v26 = v4;
          _os_log_impl(&dword_19B733000, v8, OS_LOG_TYPE_DEFAULT, "%25s:%-5d handleInterruptStart: notifying with context: %@", buf, 0x1Cu);
        }

        goto LABEL_22;
      }
    }
    v9 = objc_loadWeakRetained((id *)(v19 + 168));
    if (!v9
      || (v10 = objc_loadWeakRetained((id *)(v19 + 168)),
          v11 = objc_opt_respondsToSelector(),
          v10,
          v9,
          (v11 & 1) == 0))
    {
      if (kAVVCScope)
      {
        v13 = *(id *)kAVVCScope;
        if (!v13)
          goto LABEL_29;
      }
      else
      {
        v13 = MEMORY[0x1E0C81028];
        v14 = MEMORY[0x1E0C81028];
      }
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315394;
        v22 = "AVVoiceController.mm";
        v23 = 1024;
        v24 = 715;
        _os_log_impl(&dword_19B733000, v13, OS_LOG_TYPE_DEFAULT, "%25s:%-5d handleInterruptStart: WARNING: delegate does not respond to voiceControllerBeginRecordInterruption:", buf, 0x12u);
      }
      goto LABEL_28;
    }
    if (kAVVCScope)
    {
      v12 = *(id *)kAVVCScope;
      if (!v12)
      {
LABEL_27:
        v13 = objc_loadWeakRetained((id *)(v19 + 168));
        -[NSObject voiceControllerBeginRecordInterruption:](v13, "voiceControllerBeginRecordInterruption:", self);
        goto LABEL_28;
      }
    }
    else
    {
      v12 = MEMORY[0x1E0C81028];
      v16 = MEMORY[0x1E0C81028];
    }
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315394;
      v22 = "AVVoiceController.mm";
      v23 = 1024;
      v24 = 711;
      _os_log_impl(&dword_19B733000, v12, OS_LOG_TYPE_DEFAULT, "%25s:%-5d handleInterruptStart: notifying without context", buf, 0x12u);
    }

    goto LABEL_27;
  }
LABEL_29:
  if (v20)
  {
    p_shared_owners = (unint64_t *)&v20->__shared_owners_;
    do
      v18 = __ldaxr(p_shared_owners);
    while (__stlxr(v18 - 1, p_shared_owners));
    if (!v18)
    {
      ((void (*)())v20->__on_zero_shared)();
      std::__shared_weak_count::__release_weak(v20);
    }
  }

}

- (void)endRecordInterruption
{
  id WeakRetained;
  id v4;
  char v5;
  NSObject *v6;
  id v7;
  id v8;
  unint64_t *p_shared_owners;
  unint64_t v10;
  uint64_t v11;
  std::__shared_weak_count *v12;
  uint8_t buf[4];
  const char *v14;
  __int16 v15;
  int v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  -[AVVoiceController impl](self, "impl");
  if (v11)
  {
    WeakRetained = objc_loadWeakRetained((id *)(v11 + 168));
    if (WeakRetained)
    {
      v4 = objc_loadWeakRetained((id *)(v11 + 168));
      v5 = objc_opt_respondsToSelector();

      if ((v5 & 1) != 0)
      {
        if (kAVVCScope)
        {
          v6 = *(id *)kAVVCScope;
          if (!v6)
          {
LABEL_11:
            v8 = objc_loadWeakRetained((id *)(v11 + 168));
            objc_msgSend(v8, "voiceControllerEndRecordInterruption:", self);

            goto LABEL_12;
          }
        }
        else
        {
          v6 = MEMORY[0x1E0C81028];
          v7 = MEMORY[0x1E0C81028];
        }
        if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 136315394;
          v14 = "AVVoiceController.mm";
          v15 = 1024;
          v16 = 726;
          _os_log_impl(&dword_19B733000, v6, OS_LOG_TYPE_DEFAULT, "%25s:%-5d handleInterruptStop: notifying", buf, 0x12u);
        }

        goto LABEL_11;
      }
    }
  }
LABEL_12:
  if (v12)
  {
    p_shared_owners = (unint64_t *)&v12->__shared_owners_;
    do
      v10 = __ldaxr(p_shared_owners);
    while (__stlxr(v10 - 1, p_shared_owners));
    if (!v10)
    {
      ((void (*)())v12->__on_zero_shared)();
      std::__shared_weak_count::__release_weak(v12);
    }
  }
}

- (void)beginAudioSessionActivate:(BOOL)a3
{
  _BOOL8 v3;
  id WeakRetained;
  id v6;
  char v7;
  NSObject *v8;
  id v9;
  id v10;
  unint64_t *p_shared_owners;
  unint64_t v12;
  uint64_t v13;
  std::__shared_weak_count *v14;
  uint8_t buf[4];
  const char *v16;
  __int16 v17;
  int v18;
  __int16 v19;
  _BOOL4 v20;
  uint64_t v21;

  v3 = a3;
  v21 = *MEMORY[0x1E0C80C00];
  -[AVVoiceController impl](self, "impl");
  if (v13)
  {
    WeakRetained = objc_loadWeakRetained((id *)(v13 + 168));
    if (WeakRetained)
    {
      v6 = objc_loadWeakRetained((id *)(v13 + 168));
      v7 = objc_opt_respondsToSelector();

      if ((v7 & 1) != 0)
      {
        if (kAVVCScope)
        {
          v8 = *(id *)kAVVCScope;
          if (!v8)
          {
LABEL_11:
            v10 = objc_loadWeakRetained((id *)(v13 + 168));
            objc_msgSend(v10, "voiceControllerWillSetAudioSessionActive:willActivate:", self, v3);

            goto LABEL_12;
          }
        }
        else
        {
          v8 = MEMORY[0x1E0C81028];
          v9 = MEMORY[0x1E0C81028];
        }
        if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 136315650;
          v16 = "AVVoiceController.mm";
          v17 = 1024;
          v18 = 738;
          v19 = 1024;
          v20 = v3;
          _os_log_impl(&dword_19B733000, v8, OS_LOG_TYPE_DEFAULT, "%25s:%-5d Calling record delegate's voiceControllerWillSetAudioSessionActive. Going active? : %d", buf, 0x18u);
        }

        goto LABEL_11;
      }
    }
  }
LABEL_12:
  if (v14)
  {
    p_shared_owners = (unint64_t *)&v14->__shared_owners_;
    do
      v12 = __ldaxr(p_shared_owners);
    while (__stlxr(v12 - 1, p_shared_owners));
    if (!v12)
    {
      ((void (*)())v14->__on_zero_shared)();
      std::__shared_weak_count::__release_weak(v14);
    }
  }
}

- (void)endAudioSessionActivate:(BOOL)a3
{
  _BOOL8 v3;
  id WeakRetained;
  id v6;
  char v7;
  NSObject *v8;
  id v9;
  id v10;
  unint64_t *p_shared_owners;
  unint64_t v12;
  uint64_t v13;
  std::__shared_weak_count *v14;
  uint8_t buf[4];
  const char *v16;
  __int16 v17;
  int v18;
  __int16 v19;
  _BOOL4 v20;
  uint64_t v21;

  v3 = a3;
  v21 = *MEMORY[0x1E0C80C00];
  -[AVVoiceController impl](self, "impl");
  if (v13)
  {
    WeakRetained = objc_loadWeakRetained((id *)(v13 + 168));
    if (WeakRetained)
    {
      v6 = objc_loadWeakRetained((id *)(v13 + 168));
      v7 = objc_opt_respondsToSelector();

      if ((v7 & 1) != 0)
      {
        if (kAVVCScope)
        {
          v8 = *(id *)kAVVCScope;
          if (!v8)
          {
LABEL_11:
            v10 = objc_loadWeakRetained((id *)(v13 + 168));
            objc_msgSend(v10, "voiceControllerDidSetAudioSessionActive:isActivated:", self, v3);

            goto LABEL_12;
          }
        }
        else
        {
          v8 = MEMORY[0x1E0C81028];
          v9 = MEMORY[0x1E0C81028];
        }
        if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 136315650;
          v16 = "AVVoiceController.mm";
          v17 = 1024;
          v18 = 750;
          v19 = 1024;
          v20 = v3;
          _os_log_impl(&dword_19B733000, v8, OS_LOG_TYPE_DEFAULT, "%25s:%-5d Calling record delegate's voiceControllerDidSetAudioSessionActive. Going active? : %d", buf, 0x18u);
        }

        goto LABEL_11;
      }
    }
  }
LABEL_12:
  if (v14)
  {
    p_shared_owners = (unint64_t *)&v14->__shared_owners_;
    do
      v12 = __ldaxr(p_shared_owners);
    while (__stlxr(v12 - 1, p_shared_owners));
    if (!v12)
    {
      ((void (*)())v14->__on_zero_shared)();
      std::__shared_weak_count::__release_weak(v14);
    }
  }
}

void __90__AVVoiceController_AVVoiceControllerInternal__handlePluginDidUnpublishDevice_withDevice___block_invoke(uint64_t a1)
{
  void *v1;
  void *v2;
  uint64_t v3;
  id v4;
  id v5;
  id v6;
  id v7;
  id v8;
  NSObject *v9;
  void *v10;
  void *v11;
  int v12;
  const char *v13;
  __int16 v14;
  int v15;
  __int16 v16;
  id v17;
  __int16 v18;
  id v19;
  __int16 v20;
  void *v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v1 = *(void **)(a1 + 40);
  v2 = *(void **)(a1 + 48);
  v3 = *(_QWORD *)(a1 + 56);
  v4 = *(id *)(a1 + 32);
  v5 = v1;
  v6 = v2;
  if (kAVVCScope)
  {
    v7 = *(id *)kAVVCScope;
    if (!v7)
      goto LABEL_8;
  }
  else
  {
    v7 = (id)MEMORY[0x1E0C81028];
    v8 = MEMORY[0x1E0C81028];
  }
  v9 = v7;
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(v6, "deviceIdentifier");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = 136316162;
    v13 = "ControllerImpl.mm";
    v14 = 1024;
    v15 = 728;
    v16 = 2048;
    v17 = v5;
    v18 = 2048;
    v19 = v6;
    v20 = 2112;
    v21 = v10;
    _os_log_impl(&dword_19B733000, v9, OS_LOG_TYPE_DEFAULT, "%25s:%-5d handlePluginDidUnpublishDevice notification for plugin(%p), device(%p), deviceID(%@)", (uint8_t *)&v12, 0x30u);

  }
LABEL_8:
  objc_msgSend(v6, "deviceIdentifier");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  ControllerImpl::_removeEngineFromMap(v3, v4, 0, v11, &__block_literal_global_4910);

}

void __91__AVVoiceController_AVVoiceControllerInternal__configureVoiceTriggerClientCompletionBlocks__block_invoke(uint64_t a1, void *a2)
{
  id WeakRetained;
  void *v4;
  void (**v5)(void);

  v5 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v4 = WeakRetained;
  if (WeakRetained)
  {
    objc_msgSend(WeakRetained, "handleMediaServerDeath:", v5);
  }
  else if (v5)
  {
    v5[2]();
  }

}

void __91__AVVoiceController_AVVoiceControllerInternal__configureVoiceTriggerClientCompletionBlocks__block_invoke_2(uint64_t a1, void *a2)
{
  id WeakRetained;
  void *v4;
  void (**v5)(void);

  v5 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v4 = WeakRetained;
  if (WeakRetained)
  {
    objc_msgSend(WeakRetained, "handleMediaServerReset:", v5);
  }
  else if (v5)
  {
    v5[2]();
  }

}

void __71__AVVoiceController_AVVoiceControllerInternal__handleMediaServerReset___block_invoke(uint64_t a1, AVVoiceController *a2)
{
  uint64_t v3;
  id v4;
  std::__shared_weak_count *v5;
  uint64_t v6;
  unint64_t *p_shared_owners;
  unint64_t v8;
  std::__shared_weak_count *v9;
  unint64_t *v10;
  unint64_t v11;
  _QWORD v12[5];
  id v13;
  uint64_t v14;
  std::__shared_weak_count *v15;

  if (*(_BYTE *)(a1 + 64))
    ControllerImpl::handleServerReset(*(ControllerImpl **)(a1 + 48), a2);
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3321888768;
  v12[2] = __71__AVVoiceController_AVVoiceControllerInternal__handleMediaServerReset___block_invoke_2;
  v12[3] = &unk_1E3BEA5D0;
  v3 = *(_QWORD *)(a1 + 48);
  v4 = *(id *)(a1 + 40);
  v6 = *(_QWORD *)(a1 + 48);
  v5 = *(std::__shared_weak_count **)(a1 + 56);
  v13 = v4;
  v14 = v6;
  v15 = v5;
  if (v5)
  {
    p_shared_owners = (unint64_t *)&v5->__shared_owners_;
    do
      v8 = __ldxr(p_shared_owners);
    while (__stxr(v8 + 1, p_shared_owners));
  }
  v12[4] = *(_QWORD *)(a1 + 32);
  ControllerImpl::safeNotify(v3, (uint64_t)"notify server reset", v12);
  v9 = v15;
  if (v15)
  {
    v10 = (unint64_t *)&v15->__shared_owners_;
    do
      v11 = __ldaxr(v10);
    while (__stlxr(v11 - 1, v10));
    if (!v11)
    {
      ((void (*)(std::__shared_weak_count *))v9->__on_zero_shared)(v9);
      std::__shared_weak_count::__release_weak(v9);
    }
  }

}

void __71__AVVoiceController_AVVoiceControllerInternal__handleMediaServerReset___block_invoke_2(_QWORD *a1)
{
  uint64_t v2;
  id WeakRetained;
  id v4;
  char v5;
  id v6;
  id v7;

  v2 = a1[5];
  if (v2)
  {
    (*(void (**)(void))(v2 + 16))();
  }
  else
  {
    WeakRetained = objc_loadWeakRetained((id *)(a1[6] + 168));
    if (WeakRetained)
    {
      v6 = WeakRetained;
      v4 = objc_loadWeakRetained((id *)(a1[6] + 168));
      v5 = objc_opt_respondsToSelector();

      if ((v5 & 1) != 0)
      {
        v7 = objc_loadWeakRetained((id *)(a1[6] + 168));
        objc_msgSend(v7, "voiceControllerMediaServicesWereReset:", a1[4]);

      }
    }
  }
}

void __71__AVVoiceController_AVVoiceControllerInternal__handleMediaServerDeath___block_invoke(uint64_t a1)
{
  std::__shared_weak_count *v2;
  uint64_t v3;
  uint64_t v4;
  unint64_t *p_shared_weak_owners;
  unint64_t v6;
  unint64_t *v7;
  unint64_t v8;
  _QWORD v9[5];
  id v10;
  uint64_t v11;
  std::__shared_weak_count *v12;

  if (*(_BYTE *)(a1 + 64))
    ControllerImpl::handleServerDeath(*(ControllerImpl **)(a1 + 48), *(AVVoiceController **)(a1 + 32));
  v3 = *(_QWORD *)(a1 + 48);
  v2 = *(std::__shared_weak_count **)(a1 + 56);
  v4 = v3;
  if (v2)
  {
    p_shared_weak_owners = (unint64_t *)&v2->__shared_weak_owners_;
    do
      v6 = __ldxr(p_shared_weak_owners);
    while (__stxr(v6 + 1, p_shared_weak_owners));
    v4 = *(_QWORD *)(a1 + 48);
  }
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3321888768;
  v9[2] = __71__AVVoiceController_AVVoiceControllerInternal__handleMediaServerDeath___block_invoke_2;
  v9[3] = &unk_1E3BE6000;
  v10 = *(id *)(a1 + 40);
  v11 = v3;
  v12 = v2;
  if (v2)
  {
    v7 = (unint64_t *)&v2->__shared_weak_owners_;
    do
      v8 = __ldxr(v7);
    while (__stxr(v8 + 1, v7));
  }
  v9[4] = *(_QWORD *)(a1 + 32);
  ControllerImpl::safeNotify(v4, (uint64_t)"notify server death", v9);
  if (v12)
    std::__shared_weak_count::__release_weak(v12);

  if (v2)
    std::__shared_weak_count::__release_weak(v2);
}

void __71__AVVoiceController_AVVoiceControllerInternal__handleMediaServerDeath___block_invoke_2(_QWORD *a1)
{
  uint64_t v2;
  std::__shared_weak_count *v3;
  std::__shared_weak_count *v4;
  uint64_t v5;
  id *v6;
  id WeakRetained;
  void *v8;
  id v9;
  char v10;
  id v11;
  NSObject *v12;
  id v13;
  unint64_t *p_shared_owners;
  unint64_t v15;
  uint64_t v16;
  uint8_t buf[4];
  const char *v18;
  __int16 v19;
  int v20;
  __int16 v21;
  uint64_t v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v2 = a1[5];
  if (v2)
  {
    (*(void (**)(void))(v2 + 16))();
    return;
  }
  v3 = (std::__shared_weak_count *)a1[7];
  if (!v3)
  {
    v4 = 0;
    goto LABEL_10;
  }
  v4 = std::__shared_weak_count::lock(v3);
  if (!v4 || (v5 = a1[6], (v16 = v5) == 0))
  {
LABEL_10:
    if (kAVVCScope)
    {
      v12 = *(id *)kAVVCScope;
      if (!v12)
        goto LABEL_17;
    }
    else
    {
      v12 = MEMORY[0x1E0C81028];
      v13 = MEMORY[0x1E0C81028];
    }
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315650;
      v18 = "AVVoiceController.mm";
      v19 = 1024;
      v20 = 409;
      v21 = 2048;
      v22 = 0;
      _os_log_impl(&dword_19B733000, v12, OS_LOG_TYPE_ERROR, "%25s:%-5d nil object encountered (impl: %p). Bailing", buf, 0x1Cu);
    }

LABEL_17:
    if (!v4)
      return;
    goto LABEL_18;
  }
  v6 = (id *)(v5 + 168);
  WeakRetained = objc_loadWeakRetained((id *)(v5 + 168));
  if (WeakRetained)
  {
    v8 = WeakRetained;
    v9 = objc_loadWeakRetained(v6);
    v10 = objc_opt_respondsToSelector();

    if ((v10 & 1) != 0)
    {
      v11 = objc_loadWeakRetained(v6);
      objc_msgSend(v11, "voiceControllerMediaServicesWereLost:", a1[4], v16, v4);

    }
  }
LABEL_18:
  p_shared_owners = (unint64_t *)&v4->__shared_owners_;
  do
    v15 = __ldaxr(p_shared_owners);
  while (__stlxr(v15 - 1, p_shared_owners));
  if (!v15)
  {
    ((void (*)(std::__shared_weak_count *))v4->__on_zero_shared)(v4);
    std::__shared_weak_count::__release_weak(v4);
  }
}

void __66__AVVoiceController_AVVoiceControllerInternal__handleRouteChange___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  NSObject *v5;
  id v6;
  const char *v7;
  uint64_t v8;
  id v9;
  id v10;
  id v11;
  NSObject *v12;
  AVAudioSessionRouteDescription *v13;
  char *v14;
  id v15;
  id v16;
  NSObject *v17;
  AVAudioSessionRouteDescription *v18;
  char *v19;
  void *v20;
  id v21;
  id v22;
  NSObject *v23;
  unint64_t v24;
  const char *v25;
  _BYTE v26[18];
  __int16 v27;
  const char *v28;
  __int16 v29;
  uint64_t v30;
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "currentRoute");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (v2)
    objc_msgSend(*(id *)(a1 + 40), "setObject:forKey:", v2, CFSTR("AVAudioSessionRouteChangeCurrentRouteKey"));
  v3 = *(void **)(a1 + 32);
  ControllerImpl::audioSessionForStreamID(*(_QWORD *)(a1 + 56), 0, 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (kAVVCScope)
  {
    v5 = *(id *)kAVVCScope;
    if (!v5)
      goto LABEL_12;
  }
  else
  {
    v5 = MEMORY[0x1E0C81028];
    v6 = MEMORY[0x1E0C81028];
  }
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v7 = "aux";
    v8 = *(_QWORD *)(a1 + 32);
    *(_DWORD *)v26 = 136315906;
    *(_QWORD *)&v26[4] = "AVVoiceController.mm";
    *(_WORD *)&v26[12] = 1024;
    if (v3 == v4)
      v7 = "primary";
    *(_DWORD *)&v26[14] = 373;
    v27 = 2080;
    v28 = v7;
    v29 = 2048;
    v30 = v8;
    _os_log_impl(&dword_19B733000, v5, OS_LOG_TYPE_DEFAULT, "%25s:%-5d #### AVVoiceController handleRouteChange: %s session (%p)", v26, 0x26u);
  }

LABEL_12:
  v9 = *(id *)(a1 + 40);
  if (kAVVCScope)
  {
    v10 = *(id *)kAVVCScope;
    if (!v10)
      goto LABEL_19;
  }
  else
  {
    v10 = (id)MEMORY[0x1E0C81028];
    v11 = MEMORY[0x1E0C81028];
  }
  v12 = v10;
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(v9, "objectForKey:", CFSTR("AVAudioSessionRouteChangeCurrentRouteKey"));
    v13 = (AVAudioSessionRouteDescription *)objc_claimAutoreleasedReturnValue();
    _logRouteDesc(v13);
    v14 = (char *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)v26 = 136315650;
    *(_QWORD *)&v26[4] = "AVVCUtils.mm";
    *(_WORD *)&v26[12] = 1024;
    *(_DWORD *)&v26[14] = 1111;
    v27 = 2112;
    v28 = v14;
    _os_log_impl(&dword_19B733000, v12, OS_LOG_TYPE_DEFAULT, "%25s:%-5d CurrentRoute: %@", v26, 0x1Cu);

  }
LABEL_19:
  if (kAVVCScope)
  {
    v15 = *(id *)kAVVCScope;
    if (!v15)
      goto LABEL_26;
  }
  else
  {
    v15 = (id)MEMORY[0x1E0C81028];
    v16 = MEMORY[0x1E0C81028];
  }
  v17 = v15;
  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(v9, "objectForKey:", *MEMORY[0x1E0CFF190]);
    v18 = (AVAudioSessionRouteDescription *)objc_claimAutoreleasedReturnValue();
    _logRouteDesc(v18);
    v19 = (char *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)v26 = 136315650;
    *(_QWORD *)&v26[4] = "AVVCUtils.mm";
    *(_WORD *)&v26[12] = 1024;
    *(_DWORD *)&v26[14] = 1112;
    v27 = 2112;
    v28 = v19;
    _os_log_impl(&dword_19B733000, v17, OS_LOG_TYPE_DEFAULT, "%25s:%-5d PreviousRoute: %@", v26, 0x1Cu);

  }
LABEL_26:
  objc_msgSend(v9, "objectForKey:", *MEMORY[0x1E0CFF198], *(_OWORD *)v26);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  if (kAVVCScope)
  {
    v21 = *(id *)kAVVCScope;
    if (!v21)
      goto LABEL_38;
  }
  else
  {
    v21 = (id)MEMORY[0x1E0C81028];
    v22 = MEMORY[0x1E0C81028];
  }
  v23 = v21;
  if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
  {
    if (v20)
    {
      v24 = objc_msgSend(v20, "unsignedIntegerValue");
      if (v24 > 8)
        v25 = 0;
      else
        v25 = off_1E3BEB3A8[v24];
    }
    else
    {
      v25 = "null";
    }
    *(_DWORD *)v26 = 136315650;
    *(_QWORD *)&v26[4] = "AVVCUtils.mm";
    *(_WORD *)&v26[12] = 1024;
    *(_DWORD *)&v26[14] = 1114;
    v27 = 2080;
    v28 = v25;
    _os_log_impl(&dword_19B733000, v23, OS_LOG_TYPE_DEFAULT, "%25s:%-5d RouteChangeReason: %s", v26, 0x1Cu);
  }

LABEL_38:
  ControllerImpl::handleRouteChange(*(ControllerImpl **)(a1 + 56), *(AVVoiceController **)(a1 + 48), *(AVAudioSession **)(a1 + 32), *(NSDictionary **)(a1 + 40));

}

void __67__AVVoiceController_AVVoiceControllerInternal__handleInterruption___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  NSObject *v4;
  id v5;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  int v11;
  const char *v12;
  __int16 v13;
  int v14;
  __int16 v15;
  const char *v16;
  __int16 v17;
  uint64_t v18;
  __int16 v19;
  uint64_t v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v2 = *(void **)(a1 + 32);
  ControllerImpl::audioSessionForStreamID(*(_QWORD *)(a1 + 56), 0, 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (kAVVCScope)
  {
    v4 = *(id *)kAVVCScope;
    if (!v4)
      goto LABEL_10;
  }
  else
  {
    v4 = MEMORY[0x1E0C81028];
    v5 = MEMORY[0x1E0C81028];
  }
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v6 = "aux";
    v7 = *(_QWORD *)(a1 + 32);
    v8 = *(_QWORD *)(a1 + 40);
    if (v2 == v3)
      v6 = "primary";
    v11 = 136316162;
    v12 = "AVVoiceController.mm";
    v13 = 1024;
    v14 = 342;
    v15 = 2080;
    v16 = v6;
    v17 = 2048;
    v18 = v7;
    v19 = 2112;
    v20 = v8;
    _os_log_impl(&dword_19B733000, v4, OS_LOG_TYPE_DEFAULT, "%25s:%-5d #### AVVoiceController handleInterruption: %s session (%p), %@", (uint8_t *)&v11, 0x30u);
  }

LABEL_10:
  objc_msgSend(*(id *)(a1 + 40), "objectForKey:", *MEMORY[0x1E0CFF030]);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "unsignedLongValue");
  if (v10)
  {
    if (v10 == 1)
      ControllerImpl::handleInterruptStart(*(ControllerImpl **)(a1 + 56), *(AVVoiceController **)(a1 + 48), *(AVAudioSession **)(a1 + 32), *(NSDictionary **)(a1 + 40));
  }
  else
  {
    ControllerImpl::handleInterruptStop(*(ControllerImpl **)(a1 + 56), *(AVVoiceController **)(a1 + 48), *(AVAudioSession **)(a1 + 32), *(NSDictionary **)(a1 + 40));
  }

}

void __60__AVVoiceController_AVVoiceControllerInternal__sessionSetup__block_invoke(uint64_t a1, void *a2)
{
  id *v2;
  id v3;
  id WeakRetained;

  v2 = (id *)(a1 + 32);
  v3 = a2;
  WeakRetained = objc_loadWeakRetained(v2);
  objc_msgSend(WeakRetained, "setSessionNotifications:", v3);

}

void __60__AVVoiceController_AVVoiceControllerInternal__sessionSetup__block_invoke_2(uint64_t a1, void *a2)
{
  id *v2;
  id v3;
  id WeakRetained;

  v2 = (id *)(a1 + 32);
  v3 = a2;
  WeakRetained = objc_loadWeakRetained(v2);
  objc_msgSend(WeakRetained, "removeSessionNotifications:", v3);

}

@end
