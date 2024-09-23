@implementation CMCatherineFeederInternal

- (CMCatherineFeederInternal)init
{
  CMCatherineFeederInternal *v2;
  uint64_t v3;
  const char *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *__p[2];
  char v10;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)CMCatherineFeederInternal;
  v2 = -[CMCatherineFeederInternal init](&v11, sel_init);
  if (v2)
  {
    v2->fInternalQueue = (OS_dispatch_queue *)dispatch_queue_create("com.apple.CoreMotion.CMCatherineFeeder.internal", 0);
    v3 = operator new();
    sub_18F270374(__p, "com.apple.locationd.registration");
    MEMORY[0x19400100C](v3, __p, v2->fInternalQueue);
    v2->fLocationdConnection = (void *)v3;
    if (v10 < 0)
      operator delete(__p[0]);
    objc_msgSend__startDaemonConnection(v2, v4, v5, v6, v7);
  }
  return v2;
}

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)CMCatherineFeederInternal;
  -[CMCatherineFeederInternal dealloc](&v3, sel_dealloc);
}

- (void)_teardown
{
  void *fLocationdConnection;
  uint64_t v4;

  fLocationdConnection = self->fLocationdConnection;
  if (fLocationdConnection)
  {
    v4 = MEMORY[0x194001018](fLocationdConnection, a2);
    MEMORY[0x194001438](v4, 0xB0C40BC2CC919);
  }
  self->fLocationdConnection = 0;
}

- (void)_startDaemonConnection
{
  CLConnectionClient::setDefaultMessageHandler();
  CLConnectionClient::start((CLConnectionClient *)self->fLocationdConnection);
}

- (void)_feedCatherine:(double)a3 confidence:(double)a4 timestamp:(double)a5
{
  CMCatherineData *v8;
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
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
  v8 = [CMCatherineData alloc];
  v13 = (void *)objc_msgSend_initWithCatherine_confidence_timestamp_(v8, v9, v10, v11, v12, a3, a4, a5);
  v26 = CFSTR("kCLConnectionMessageCatherineDataKey");
  v27[0] = v13;
  v25 = objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x1E0C99D80], v14, (uint64_t)v27, (uint64_t)&v26, 1);

  sub_18F489C98("kCLConnectionMessageCatherineData", &v25, &v23);
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

@end
