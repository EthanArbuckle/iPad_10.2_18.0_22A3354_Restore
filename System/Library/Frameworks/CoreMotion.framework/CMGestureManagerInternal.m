@implementation CMGestureManagerInternal

- (CMGestureManagerInternal)initWithPriority:(int)a3
{
  CMGestureManagerInternal *v4;
  CMGestureManagerInternal *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)CMGestureManagerInternal;
  v4 = -[CMGestureManagerInternal init](&v7, sel_init);
  v5 = v4;
  if (v4)
  {
    v4->fPriority = a3;
    v4->fPrivateQueue = (OS_dispatch_queue *)dispatch_queue_create("com.apple.CoreMotionCMGestureManagerPrivateQueue", 0);
  }
  return v5;
}

- (void)dealloc
{
  objc_super v3;

  dispatch_release((dispatch_object_t)self->fPrivateQueue);
  self->fPrivateQueue = 0;
  v3.receiver = self;
  v3.super_class = (Class)CMGestureManagerInternal;
  -[CMGestureManagerInternal dealloc](&v3, sel_dealloc);
}

- (void)startGestureUpdatesWithHandlerPrivate:(id)a3
{
  id fGestureHandler;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  NSObject *v11;
  int fPriority;
  const char *v13;
  uint64_t v14;
  uint64_t v15;
  const char *v16;
  uint64_t v17;
  std::__shared_weak_count *v18;
  unint64_t *p_shared_owners;
  unint64_t v20;
  unint64_t *v21;
  unint64_t v22;
  std::__shared_weak_count *v23;
  unint64_t *v24;
  unint64_t v25;
  int v26;
  char *v27;
  void *__p[2];
  char v29;
  std::__shared_weak_count *v30;
  std::__shared_weak_count *v31;
  _QWORD v32[2];
  _QWORD v33[2];
  uint8_t buf[8];
  char v35;
  uint64_t v36;

  v36 = *MEMORY[0x1E0C80C00];
  fGestureHandler = self->fGestureHandler;
  if (fGestureHandler != a3)
  {

    self->fGestureHandler = (id)objc_msgSend_copy(a3, v6, v7, v8, v9);
    if (!self->fLocationdConnection)
    {
      v10 = (void *)operator new();
      sub_18F270374(__p, "com.apple.locationd.registration");
      MEMORY[0x19400100C](v10, __p, self->fPrivateQueue);
      self->fLocationdConnection = v10;
      if (v29 < 0)
        operator delete(__p[0]);
      sub_18F270374(buf, "kCLConnectionMessageGesture");
      CLConnectionClient::setHandlerForMessage();
      if (v35 < 0)
        operator delete(*(void **)buf);
      CLConnectionClient::setDefaultMessageHandler();
      CLConnectionClient::start((CLConnectionClient *)self->fLocationdConnection);
      if (qword_1EE16D400 != -1)
        dispatch_once(&qword_1EE16D400, &unk_1E29451C8);
      v11 = qword_1EE16D408;
      if (os_log_type_enabled((os_log_t)qword_1EE16D408, OS_LOG_TYPE_DEFAULT))
      {
        fPriority = self->fPriority;
        *(_DWORD *)buf = 67240192;
        *(_DWORD *)&buf[4] = fPriority;
        _os_log_impl(&dword_18F1DC000, v11, OS_LOG_TYPE_DEFAULT, "Sending gesture subscription request with priority %{public}d", buf, 8u);
      }
      if (sub_18F1FCA08(115, 2))
      {
        bzero(buf, 0x65CuLL);
        if (qword_1EE16D400 != -1)
          dispatch_once(&qword_1EE16D400, &unk_1E29451C8);
        v26 = self->fPriority;
        LODWORD(v30) = 67240192;
        HIDWORD(v30) = v26;
        v27 = (char *)_os_log_send_and_compose_impl();
        sub_18F419700("Generic", 1, 0, 2, "-[CMGestureManagerInternal startGestureUpdatesWithHandlerPrivate:]", "CoreLocation: %s\n", v27);
        if (v27 != (char *)buf)
          free(v27);
      }
      v32[1] = CFSTR("kCLConnectionMessagePriorityKey");
      v33[0] = MEMORY[0x1E0C9AAB0];
      v32[0] = CFSTR("kCLConnectionMessageSubscribeKey");
      v33[1] = objc_msgSend_numberWithUnsignedInt_(MEMORY[0x1E0CB37E8], v13, self->fPriority, v14, v15);
      v17 = objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x1E0C99D80], v16, (uint64_t)v33, (uint64_t)v32, 2);
      v18 = (std::__shared_weak_count *)operator new(0x70uLL);
      v18->__shared_owners_ = 0;
      p_shared_owners = (unint64_t *)&v18->__shared_owners_;
      v18->__shared_weak_owners_ = 0;
      v18->__vftable = (std::__shared_weak_count_vtbl *)&off_1E2952688;
      sub_18F270374(buf, "kCLConnectionMessageGesture");
      MEMORY[0x19400103C](&v18[1], buf, v17);
      if (v35 < 0)
        operator delete(*(void **)buf);
      v30 = v18 + 1;
      v31 = v18;
      do
        v20 = __ldxr(p_shared_owners);
      while (__stxr(v20 + 1, p_shared_owners));
      CLConnectionClient::sendMessage();
      if (v18)
      {
        v21 = (unint64_t *)&v18->__shared_owners_;
        do
          v22 = __ldaxr(v21);
        while (__stlxr(v22 - 1, v21));
        if (!v22)
        {
          ((void (*)(std::__shared_weak_count *))v18->__on_zero_shared)(v18);
          std::__shared_weak_count::__release_weak(v18);
        }
      }
      v23 = v31;
      if (v31)
      {
        v24 = (unint64_t *)&v31->__shared_owners_;
        do
          v25 = __ldaxr(v24);
        while (__stlxr(v25 - 1, v24));
        if (!v25)
        {
          ((void (*)(std::__shared_weak_count *))v23->__on_zero_shared)(v23);
          std::__shared_weak_count::__release_weak(v23);
        }
      }
    }
  }
}

- (void)stopGestureUpdatesPrivate
{
  NSObject *v3;
  uint64_t v4;
  char *v5;
  uint8_t buf[1640];
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  if (self->fGestureHandler)
  {
    if (qword_1EE16D400 != -1)
      dispatch_once(&qword_1EE16D400, &unk_1E29451C8);
    v3 = qword_1EE16D408;
    if (os_log_type_enabled((os_log_t)qword_1EE16D408, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_18F1DC000, v3, OS_LOG_TYPE_DEFAULT, "Stopping gesture updates", buf, 2u);
    }
    if (sub_18F1FCA08(115, 2))
    {
      bzero(buf, 0x65CuLL);
      if (qword_1EE16D400 != -1)
        dispatch_once(&qword_1EE16D400, &unk_1E29451C8);
      v5 = (char *)_os_log_send_and_compose_impl();
      sub_18F419700("Generic", 1, 0, 2, "-[CMGestureManagerInternal stopGestureUpdatesPrivate]", "CoreLocation: %s\n", v5);
      if (v5 != (char *)buf)
        free(v5);
    }

    self->fGestureHandler = 0;
    if (self->fLocationdConnection)
    {
      v4 = MEMORY[0x194001018]();
      MEMORY[0x194001438](v4, 0xB0C40BC2CC919);
    }
    self->fLocationdConnection = 0;
  }
}

@end
