@implementation CMActivityManagerInternal

- (CMActivityManagerInternal)init
{
  CMActivityManagerInternal *v2;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)CMActivityManagerInternal;
  v2 = -[CMActivityManagerInternal init](&v4, sel_init);
  if (v2)
    v2->fPrivateQueue = (OS_dispatch_queue *)dispatch_queue_create("com.apple.CoreMotion.CMActivityManagerPrivateQueue", 0);
  return v2;
}

- (void)dealloc
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  id fActivityHandler;
  NSObject *fSidebandOverrideSemaphore;
  NSObject *fSidebandOverrideQueue;
  objc_super v9;

  objc_msgSend_disconnect(self, a2, v2, v3, v4);
  fActivityHandler = self->fActivityHandler;
  if (fActivityHandler)
  {

    self->fActivityHandler = 0;
  }
  dispatch_release((dispatch_object_t)self->fPrivateQueue);
  self->fPrivateQueue = 0;
  fSidebandOverrideSemaphore = self->fSidebandOverrideSemaphore;
  if (fSidebandOverrideSemaphore)
    dispatch_release(fSidebandOverrideSemaphore);
  fSidebandOverrideQueue = self->fSidebandOverrideQueue;
  if (fSidebandOverrideQueue)
    dispatch_release(fSidebandOverrideQueue);
  v9.receiver = self;
  v9.super_class = (Class)CMActivityManagerInternal;
  -[CMActivityManagerInternal dealloc](&v9, sel_dealloc);
}

- (void)connect
{
  void *v3;
  void *v4[2];
  char v5;
  void *v6[2];
  char v7;

  if (!self->fLocationdConnection)
  {
    v3 = (void *)operator new();
    sub_18F270374(v6, "com.apple.locationd.registration");
    MEMORY[0x19400100C](v3, v6, self->fPrivateQueue);
    self->fLocationdConnection = v3;
    if (v7 < 0)
      operator delete(v6[0]);
    sub_18F270374(v4, "kCLConnectionMessageMotionState");
    CLConnectionClient::setHandlerForMessage();
    if (v5 < 0)
      operator delete(v4[0]);
    sub_18F270374(v4, "kCLConnectionMessageSidebandOverride");
    CLConnectionClient::setHandlerForMessage();
    if (v5 < 0)
      operator delete(v4[0]);
    sub_18F270374(v4, "kCLConnectionMessageMotionStateSim");
    CLConnectionClient::setHandlerForMessage();
    if (v5 < 0)
      operator delete(v4[0]);
    CLConnectionClient::setInterruptionHandler();
    CLConnectionClient::setDefaultMessageHandler();
    CLConnectionClient::start((CLConnectionClient *)self->fLocationdConnection);
  }
}

- (void)disconnect
{
  void *fLocationdConnection;
  uint64_t v4;

  fLocationdConnection = self->fLocationdConnection;
  if (fLocationdConnection)
  {
    v4 = MEMORY[0x194001018](fLocationdConnection, a2);
    MEMORY[0x194001438](v4, 0xB0C40BC2CC919);
    self->fLocationdConnection = 0;
  }
}

- (void)startActivityUpdatesWithHandlerPrivate:(id)a3
{
  id fActivityHandler;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  const char *v14;
  unint64_t *p_shared_owners;
  unint64_t v16;
  unint64_t *v17;
  unint64_t v18;
  std::__shared_weak_count *v19;
  unint64_t *v20;
  unint64_t v21;
  std::__shared_weak_count *v22;
  uint64_t v23;
  std::__shared_weak_count *v24;
  uint64_t v25;
  const __CFString *v26;
  _QWORD v27[2];

  v27[1] = *MEMORY[0x1E0C80C00];
  fActivityHandler = self->fActivityHandler;
  if (fActivityHandler != a3)
  {

    self->fActivityHandler = (id)objc_msgSend_copy(a3, v6, v7, v8, v9);
    objc_msgSend_connect(self, v10, v11, v12, v13);
    if (!self->fSubscribedToMotionState)
    {
      v26 = CFSTR("kCLConnectionMessageSubscribeKey");
      v27[0] = MEMORY[0x1E0C9AAB0];
      v25 = objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x1E0C99D80], v14, (uint64_t)v27, (uint64_t)&v26, 1);
      sub_18F41EB40(&v23, &v25);
      v22 = v24;
      if (v24)
      {
        p_shared_owners = (unint64_t *)&v24->__shared_owners_;
        do
          v16 = __ldxr(p_shared_owners);
        while (__stxr(v16 + 1, p_shared_owners));
      }
      CLConnectionClient::sendMessage();
      if (v22)
      {
        v17 = (unint64_t *)&v22->__shared_owners_;
        do
          v18 = __ldaxr(v17);
        while (__stlxr(v18 - 1, v17));
        if (!v18)
        {
          ((void (*)(std::__shared_weak_count *))v22->__on_zero_shared)(v22);
          std::__shared_weak_count::__release_weak(v22);
        }
      }
      self->fSubscribedToMotionState = 1;
      v19 = v24;
      if (v24)
      {
        v20 = (unint64_t *)&v24->__shared_owners_;
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
  }
}

- (void)stopActivityUpdatesPrivate
{
  unint64_t *p_shared_owners;
  unint64_t v4;
  uint64_t *v5;
  unint64_t v6;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  std::__shared_weak_count *v11;
  unint64_t *v12;
  unint64_t v13;
  void *__p;
  char v15;
  uint64_t v16;
  std::__shared_weak_count *v17;
  uint64_t v18;
  std::__shared_weak_count *v19;
  uint64_t v20;
  const __CFString *v21;
  _QWORD v22[2];

  v22[1] = *MEMORY[0x1E0C80C00];
  if (self->fActivityHandler)
  {
    v21 = CFSTR("kCLConnectionMessageSubscribeKey");
    v22[0] = MEMORY[0x1E0C9AAA0];
    v20 = objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x1E0C99D80], a2, (uint64_t)v22, (uint64_t)&v21, 1);
    sub_18F41EB40(&v18, &v20);
    v16 = v18;
    v17 = v19;
    if (v19)
    {
      p_shared_owners = (unint64_t *)&v19->__shared_owners_;
      do
        v4 = __ldxr(p_shared_owners);
      while (__stxr(v4 + 1, p_shared_owners));
    }
    CLConnectionClient::sendMessage();
    if (v17)
    {
      v5 = &v17->__shared_owners_;
      do
        v6 = __ldaxr((unint64_t *)v5);
      while (__stlxr(v6 - 1, (unint64_t *)v5));
      if (!v6)
      {
        ((void (*)(std::__shared_weak_count *))v17->__on_zero_shared)(v17);
        std::__shared_weak_count::__release_weak(v17);
      }
    }
    sub_18F270374(&__p, "kCLConnectionMessageMotionState");
    CLConnectionClient::setHandlerForMessage();
    if (v15 < 0)
      operator delete(__p);
    self->fSubscribedToMotionState = 0;

    self->fActivityHandler = 0;
    if (!self->fSidebandOverrideSemaphore)
      objc_msgSend_disconnect(self, v7, v8, v9, v10);
    v11 = v19;
    if (v19)
    {
      v12 = (unint64_t *)&v19->__shared_owners_;
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
}

- (void)overrideOscarSideband:(BOOL)a3 withState:(int64_t)a4
{
  uint64_t v4;
  _BOOL8 v6;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  const char *v11;
  uint64_t v12;
  uint64_t v13;
  const char *v14;
  unint64_t *p_shared_owners;
  unint64_t v16;
  unint64_t *v17;
  unint64_t v18;
  std::__shared_weak_count *v19;
  unint64_t *v20;
  unint64_t v21;
  std::__shared_weak_count *v22;
  uint64_t v23;
  std::__shared_weak_count *v24;
  uint64_t v25;
  _QWORD v26[2];
  _QWORD v27[3];

  v27[2] = *MEMORY[0x1E0C80C00];
  if (!self->fSidebandOverrideSemaphore)
    __assert_rtn("-[CMActivityManagerInternal overrideOscarSideband:withState:]", "CMActivityManager.mm", 219, "fSidebandOverrideSemaphore && \"fSidbandOverrideSemaphore not initialized.\");
  v6 = a3;
  objc_msgSend_connect(self, a2, a3, a4, v4);
  if (self->fLocationdConnection)
  {
    v26[0] = CFSTR("CMOverrideSidebandOverride");
    v27[0] = objc_msgSend_numberWithBool_(MEMORY[0x1E0CB37E8], v8, v6, v9, v10);
    v26[1] = CFSTR("CMStateSidebandState");
    v27[1] = objc_msgSend_numberWithInteger_(MEMORY[0x1E0CB37E8], v11, a4, v12, v13);
    v25 = objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x1E0C99D80], v14, (uint64_t)v27, (uint64_t)v26, 2);
    self->fSidebandOverrideWaiting = 1;
    sub_18F3ED590("kCLConnectionMessageSidebandOverride", &v25, &v23);
    v22 = v24;
    if (v24)
    {
      p_shared_owners = (unint64_t *)&v24->__shared_owners_;
      do
        v16 = __ldxr(p_shared_owners);
      while (__stxr(v16 + 1, p_shared_owners));
    }
    CLConnectionClient::sendMessage();
    if (v22)
    {
      v17 = (unint64_t *)&v22->__shared_owners_;
      do
        v18 = __ldaxr(v17);
      while (__stlxr(v18 - 1, v17));
      if (!v18)
      {
        ((void (*)(std::__shared_weak_count *))v22->__on_zero_shared)(v22);
        std::__shared_weak_count::__release_weak(v22);
      }
    }
    v19 = v24;
    if (v24)
    {
      v20 = (unint64_t *)&v24->__shared_owners_;
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
    self->fSidebandOverrideResult = 3;
    dispatch_semaphore_signal((dispatch_semaphore_t)self->fSidebandOverrideSemaphore);
  }
}

- (void)simulateMotionState:(BOOL)a3 withState:(int64_t)a4
{
  uint64_t v4;
  _BOOL8 v6;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  const char *v11;
  uint64_t v12;
  uint64_t v13;
  const char *v14;
  unint64_t *p_shared_owners;
  unint64_t v16;
  unint64_t *v17;
  unint64_t v18;
  std::__shared_weak_count *v19;
  unint64_t *v20;
  unint64_t v21;
  std::__shared_weak_count *v22;
  uint64_t v23;
  std::__shared_weak_count *v24;
  uint64_t v25;
  _QWORD v26[2];
  _QWORD v27[3];

  v27[2] = *MEMORY[0x1E0C80C00];
  if (!self->fMotionStateSimSemaphore)
    __assert_rtn("-[CMActivityManagerInternal simulateMotionState:withState:]", "CMActivityManager.mm", 238, "fMotionStateSimSemaphore && \"fMotionStateSimSemaphore not initialized.\");
  v6 = a3;
  objc_msgSend_connect(self, a2, a3, a4, v4);
  if (self->fLocationdConnection)
  {
    v26[0] = CFSTR("CMMotionStateSim");
    v27[0] = objc_msgSend_numberWithBool_(MEMORY[0x1E0CB37E8], v8, v6, v9, v10);
    v26[1] = CFSTR("CMMotionStateSimState");
    v27[1] = objc_msgSend_numberWithInteger_(MEMORY[0x1E0CB37E8], v11, a4, v12, v13);
    v25 = objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x1E0C99D80], v14, (uint64_t)v27, (uint64_t)v26, 2);
    self->fMotionStateSimWaiting = 1;
    sub_18F41EBF4("kCLConnectionMessageMotionStateSim", &v25, &v23);
    v22 = v24;
    if (v24)
    {
      p_shared_owners = (unint64_t *)&v24->__shared_owners_;
      do
        v16 = __ldxr(p_shared_owners);
      while (__stxr(v16 + 1, p_shared_owners));
    }
    CLConnectionClient::sendMessage();
    if (v22)
    {
      v17 = (unint64_t *)&v22->__shared_owners_;
      do
        v18 = __ldaxr(v17);
      while (__stlxr(v18 - 1, v17));
      if (!v18)
      {
        ((void (*)(std::__shared_weak_count *))v22->__on_zero_shared)(v22);
        std::__shared_weak_count::__release_weak(v22);
      }
    }
    v19 = v24;
    if (v24)
    {
      v20 = (unint64_t *)&v24->__shared_owners_;
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
    self->fMotionStateSimResult = 3;
    dispatch_semaphore_signal((dispatch_semaphore_t)self->fMotionStateSimSemaphore);
  }
}

- (void)simulateMotionStateYouthWithState:(int64_t)a3
{
  uint64_t v3;
  uint64_t v4;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  const char *v10;
  unint64_t *p_shared_owners;
  unint64_t v12;
  unint64_t *v13;
  unint64_t v14;
  std::__shared_weak_count *v15;
  unint64_t *v16;
  unint64_t v17;
  std::__shared_weak_count *v18;
  uint64_t v19;
  std::__shared_weak_count *v20;
  uint64_t v21;
  const __CFString *v22;
  _QWORD v23[2];

  v23[1] = *MEMORY[0x1E0C80C00];
  objc_msgSend_connect(self, a2, a3, v3, v4);
  if (self->fLocationdConnection)
  {
    v22 = CFSTR("CMMotionStateSimState");
    v23[0] = objc_msgSend_numberWithInteger_(MEMORY[0x1E0CB37E8], v7, a3, v8, v9);
    v21 = objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x1E0C99D80], v10, (uint64_t)v23, (uint64_t)&v22, 1);
    sub_18F3515BC("kCLConnectionMessageMotionStateYouthSim", &v21, &v19);
    v18 = v20;
    if (v20)
    {
      p_shared_owners = (unint64_t *)&v20->__shared_owners_;
      do
        v12 = __ldxr(p_shared_owners);
      while (__stxr(v12 + 1, p_shared_owners));
    }
    CLConnectionClient::sendMessage();
    if (v18)
    {
      v13 = (unint64_t *)&v18->__shared_owners_;
      do
        v14 = __ldaxr(v13);
      while (__stlxr(v14 - 1, v13));
      if (!v14)
      {
        ((void (*)(std::__shared_weak_count *))v18->__on_zero_shared)(v18);
        std::__shared_weak_count::__release_weak(v18);
      }
    }
    v15 = v20;
    if (v20)
    {
      v16 = (unint64_t *)&v20->__shared_owners_;
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
    self->fMotionStateYouthSimResult = 3;
  }
}

@end
