@implementation CMOnBodyStatusManager

- (CMOnBodyStatusManager)init
{
  const char *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  CMOnBodyStatusManager *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)CMOnBodyStatusManager;
  v6 = -[CMOnBodyStatusManager init](&v8, sel_init);
  if (v6)
  {
    if (objc_msgSend_isOnBodyStatusDetectionAvailable(CMOnBodyStatusManager, v2, v3, v4, v5))
    {
      v6->fPrivateQueue = (OS_dispatch_queue *)dispatch_queue_create("com.apple.CoreMotion.CMOnBodyStatusManagerPrivateQueue", 0);
    }
    else
    {

      return 0;
    }
  }
  return v6;
}

- (void)dealloc
{
  objc_super v2;

  v2.receiver = self;
  v2.super_class = (Class)CMOnBodyStatusManager;
  -[CMOnBodyStatusManager dealloc](&v2, sel_dealloc);
}

+ (BOOL)isOnBodyStatusDetectionAvailable
{
  _BOOL8 v2;

  if ((sub_18F1F7758() & 1) != 0)
    LOBYTE(v2) = 0;
  else
    return ((unint64_t)sub_18F1F7BFC() >> 11) & 1;
  return v2;
}

+ (id)sharedOnBodyStatusManager
{
  if (qword_1ECEDF0D8 != -1)
    dispatch_once(&qword_1ECEDF0D8, &unk_1E2953128);
  return (id)qword_1ECEDF0D0;
}

- (void)startOnBodyStatusDetectionToQueue:(id)a3 withParameters:(id)a4 handler:(id)a5
{
  NSObject *fPrivateQueue;
  _QWORD v6[8];

  fPrivateQueue = self->fPrivateQueue;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = sub_18F39B058;
  v6[3] = &unk_1E2956778;
  v6[4] = self;
  v6[5] = a3;
  v6[6] = a4;
  v6[7] = a5;
  dispatch_async(fPrivateQueue, v6);
}

- (void)stopOnBodyStatusDetection
{
  NSObject *fPrivateQueue;
  _QWORD block[5];

  fPrivateQueue = self->fPrivateQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = sub_18F39B0C0;
  block[3] = &unk_1E2955938;
  block[4] = self;
  dispatch_sync(fPrivateQueue, block);
}

- (void)setPropertiesWithDictionary:(id)a3
{
  NSObject *fPrivateQueue;
  _QWORD v6[6];

  if (sub_18F442404((uint64_t)a3))
  {
    fPrivateQueue = self->fPrivateQueue;
    v6[0] = MEMORY[0x1E0C809B0];
    v6[1] = 3221225472;
    v6[2] = sub_18F39B138;
    v6[3] = &unk_1E29559D0;
    v6[4] = self;
    v6[5] = a3;
    dispatch_sync(fPrivateQueue, v6);
  }
}

- (void)connect
{
  void *v3;
  void *__p;
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
    sub_18F270374(&__p, "kCLConnectionMessageOnBodyDetection");
    CLConnectionClient::setHandlerForMessage();
    if (v5 < 0)
      operator delete(__p);
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

- (void)startOnBodyStatusDetectionPrivateToQueue:(id)a3 withParameters:(id)a4 handler:(id)a5
{
  OS_dispatch_queue *fOnBodyStatusQueue;
  id fOnBodyStatusHandler;
  const char *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  const char *v15;
  unint64_t *p_shared_owners;
  unint64_t v17;
  uint64_t *v18;
  unint64_t v19;
  std::__shared_weak_count *v20;
  unint64_t *v21;
  unint64_t v22;
  unint64_t *v23;
  unint64_t v24;
  unint64_t *v25;
  unint64_t v26;
  std::__shared_weak_count *v27;
  unint64_t *v28;
  unint64_t v29;
  NSObject *v30;
  char *v31;
  std::__shared_weak_count *v32;
  _QWORD v33[3];
  std::__shared_weak_count *v34;
  id v35;
  const __CFString *v36;
  uint64_t v37;
  uint8_t buf[8];
  std::__shared_weak_count *v39;
  uint64_t v40;

  v40 = *MEMORY[0x1E0C80C00];
  v35 = a4;
  if (a3 && a5)
  {
    fOnBodyStatusQueue = self->fOnBodyStatusQueue;
    if (fOnBodyStatusQueue != a3)
    {

      self->fOnBodyStatusQueue = (OS_dispatch_queue *)a3;
    }
    fOnBodyStatusHandler = self->fOnBodyStatusHandler;
    if (fOnBodyStatusHandler != a5)
    {

      self->fOnBodyStatusHandler = (id)objc_msgSend_copy(a5, v11, v12, v13, v14);
    }
    objc_msgSend_connect(self, a2, (uint64_t)a3, (uint64_t)a4, (uint64_t)a5);
    if (sub_18F442404((uint64_t)a4))
    {
      sub_18F35C128("kCLConnectionMessageOnBodyDetectionParams", &v35, buf);
      v33[2] = *(_QWORD *)buf;
      v34 = v39;
      if (v39)
      {
        p_shared_owners = (unint64_t *)&v39->__shared_owners_;
        do
          v17 = __ldxr(p_shared_owners);
        while (__stxr(v17 + 1, p_shared_owners));
      }
      CLConnectionClient::sendMessage();
      if (v34)
      {
        v18 = &v34->__shared_owners_;
        do
          v19 = __ldaxr((unint64_t *)v18);
        while (__stlxr(v19 - 1, (unint64_t *)v18));
        if (!v19)
        {
          ((void (*)(std::__shared_weak_count *))v34->__on_zero_shared)(v34);
          std::__shared_weak_count::__release_weak(v34);
        }
      }
      v20 = v39;
      if (v39)
      {
        v21 = (unint64_t *)&v39->__shared_owners_;
        do
          v22 = __ldaxr(v21);
        while (__stlxr(v22 - 1, v21));
        if (!v22)
        {
          ((void (*)(std::__shared_weak_count *))v20->__on_zero_shared)(v20);
          std::__shared_weak_count::__release_weak(v20);
        }
      }
    }
    if (!self->fSubscribedToOnBodyStatusDetection)
    {
      v36 = CFSTR("kCLConnectionMessageSubscribeKey");
      v37 = MEMORY[0x1E0C9AAB0];
      v33[0] = objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x1E0C99D80], v15, (uint64_t)&v37, (uint64_t)&v36, 1);
      sub_18F39BF9C("kCLConnectionMessageOnBodyDetection", v33, buf);
      v32 = v39;
      if (v39)
      {
        v23 = (unint64_t *)&v39->__shared_owners_;
        do
          v24 = __ldxr(v23);
        while (__stxr(v24 + 1, v23));
      }
      CLConnectionClient::sendMessage();
      if (v32)
      {
        v25 = (unint64_t *)&v32->__shared_owners_;
        do
          v26 = __ldaxr(v25);
        while (__stlxr(v26 - 1, v25));
        if (!v26)
        {
          ((void (*)(std::__shared_weak_count *))v32->__on_zero_shared)(v32);
          std::__shared_weak_count::__release_weak(v32);
        }
      }
      self->fSubscribedToOnBodyStatusDetection = 1;
      v27 = v39;
      if (v39)
      {
        v28 = (unint64_t *)&v39->__shared_owners_;
        do
          v29 = __ldaxr(v28);
        while (__stlxr(v29 - 1, v28));
        if (!v29)
        {
          ((void (*)(std::__shared_weak_count *))v27->__on_zero_shared)(v27);
          std::__shared_weak_count::__release_weak(v27);
        }
      }
    }
  }
  else
  {
    if (qword_1EE16D8C8 != -1)
      dispatch_once(&qword_1EE16D8C8, &unk_1E2955088);
    v30 = qword_1EE16D8D0;
    if (os_log_type_enabled((os_log_t)qword_1EE16D8D0, OS_LOG_TYPE_FAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_18F1DC000, v30, OS_LOG_TYPE_FAULT, "Neither the queue nor the handler can be nil", buf, 2u);
    }
    if (sub_18F1FCA08(115, 0))
    {
      bzero(buf, 0x65CuLL);
      if (qword_1EE16D8C8 != -1)
        dispatch_once(&qword_1EE16D8C8, &unk_1E2955088);
      LOWORD(v33[0]) = 0;
      v31 = (char *)_os_log_send_and_compose_impl();
      sub_18F419700("Generic", 1, 0, 0, "-[CMOnBodyStatusManager startOnBodyStatusDetectionPrivateToQueue:withParameters:handler:]", "CoreLocation: %s\n", v31);
      if (v31 != (char *)buf)
        free(v31);
    }
  }
}

- (void)stopOnBodyStatusDetectionPrivate
{
  unint64_t *p_shared_owners;
  unint64_t v4;
  unint64_t *v5;
  unint64_t v6;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  std::__shared_weak_count *v11;
  unint64_t *v12;
  unint64_t v13;
  std::__shared_weak_count *v14;
  uint64_t v15;
  std::__shared_weak_count *v16;
  uint64_t v17;
  const __CFString *v18;
  _QWORD v19[2];

  v19[1] = *MEMORY[0x1E0C80C00];
  if (self->fOnBodyStatusQueue && self->fOnBodyStatusHandler)
  {
    v18 = CFSTR("kCLConnectionMessageSubscribeKey");
    v19[0] = MEMORY[0x1E0C9AAA0];
    v17 = objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x1E0C99D80], a2, (uint64_t)v19, (uint64_t)&v18, 1);
    sub_18F39BF9C("kCLConnectionMessageOnBodyDetection", &v17, &v15);
    v14 = v16;
    if (v16)
    {
      p_shared_owners = (unint64_t *)&v16->__shared_owners_;
      do
        v4 = __ldxr(p_shared_owners);
      while (__stxr(v4 + 1, p_shared_owners));
    }
    CLConnectionClient::sendMessage();
    if (v14)
    {
      v5 = (unint64_t *)&v14->__shared_owners_;
      do
        v6 = __ldaxr(v5);
      while (__stlxr(v6 - 1, v5));
      if (!v6)
      {
        ((void (*)(std::__shared_weak_count *))v14->__on_zero_shared)(v14);
        std::__shared_weak_count::__release_weak(v14);
      }
    }
    self->fSubscribedToOnBodyStatusDetection = 0;

    self->fOnBodyStatusQueue = 0;
    self->fOnBodyStatusHandler = 0;
    objc_msgSend_disconnect(self, v7, v8, v9, v10);
    v11 = v16;
    if (v16)
    {
      v12 = (unint64_t *)&v16->__shared_owners_;
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

@end
