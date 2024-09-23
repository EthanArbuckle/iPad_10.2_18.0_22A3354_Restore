@implementation CMOdometerSuitabilityManagerProxy

- (CMOdometerSuitabilityManagerProxy)initWithOdometerSuitability:(id)a3
{
  CMOdometerSuitabilityManagerProxy *v4;
  CMOdometerSuitabilityManagerProxy *v5;
  uint64_t v6;
  void *__p[2];
  char v9;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)CMOdometerSuitabilityManagerProxy;
  v4 = -[CMOdometerSuitabilityManagerProxy init](&v10, sel_init);
  v5 = v4;
  if (v4)
  {
    v4->_odometerSuitabilityManager = (CMOdometerSuitabilityManager *)a3;
    v4->fInternalQueue = (OS_dispatch_queue *)dispatch_queue_create("com.apple.CoreMotion.CMOdometerSuitability.internal", 0);
    v5->fCallbackQueue = (OS_dispatch_queue *)dispatch_queue_create("com.apple.CoreMotion.CMOdometerSuitability.callback", 0);
    v6 = operator new();
    sub_18F270374(__p, "com.apple.locationd.registration");
    MEMORY[0x19400100C](v6, __p, v5->fInternalQueue);
    v5->fLocationdConnection = (void *)v6;
    if (v9 < 0)
      operator delete(__p[0]);
    v5->fHandler = 0;
  }
  return v5;
}

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)CMOdometerSuitabilityManagerProxy;
  -[CMOdometerSuitabilityManagerProxy dealloc](&v3, sel_dealloc);
}

- (void)_teardown
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v6;

  objc_msgSend__stopOdometerSuitabilityUpdates(self, a2, v2, v3, v4);
  if (self->fLocationdConnection)
  {
    v6 = MEMORY[0x194001018]();
    MEMORY[0x194001438](v6, 0xB0C40BC2CC919);
  }
  self->fLocationdConnection = 0;
}

- (void)_startDaemonConnection
{
  CLConnectionClient::setDefaultMessageHandler();
  CLConnectionClient::setInterruptionHandler();
  CLConnectionClient::start((CLConnectionClient *)self->fLocationdConnection);
}

- (void)_startOdometerSuitabilityUpdatesWithHandler:(id)a3
{
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  const char *v9;
  unint64_t *p_shared_owners;
  unint64_t v11;
  unint64_t *v12;
  unint64_t v13;
  std::__shared_weak_count *v14;
  unint64_t *v15;
  unint64_t v16;
  std::__shared_weak_count *v17;
  _QWORD v18[6];
  void *__p;
  std::__shared_weak_count *v20;
  char v21;
  const __CFString *v22;
  _QWORD v23[2];

  v23[1] = *MEMORY[0x1E0C80C00];

  self->fHandler = (id)objc_msgSend_copy(a3, v5, v6, v7, v8);
  sub_18F270374(&__p, "kCLConnectionMessageOdometerSuitabilityUpdate");
  v18[1] = MEMORY[0x1E0C809B0];
  v18[2] = 3221225472;
  v18[3] = sub_18F3F37BC;
  v18[4] = &unk_1E2955DD8;
  v18[5] = self;
  CLConnectionClient::setHandlerForMessage();
  if (v21 < 0)
    operator delete(__p);
  v22 = CFSTR("kCLConnectionMessageSubscribeKey");
  v23[0] = MEMORY[0x1E0C9AAB0];
  v18[0] = objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x1E0C99D80], v9, (uint64_t)v23, (uint64_t)&v22, 1);
  sub_18F3F3FE8(&__p, v18);
  v17 = v20;
  if (v20)
  {
    p_shared_owners = (unint64_t *)&v20->__shared_owners_;
    do
      v11 = __ldxr(p_shared_owners);
    while (__stxr(v11 + 1, p_shared_owners));
  }
  CLConnectionClient::sendMessage();
  if (v17)
  {
    v12 = (unint64_t *)&v17->__shared_owners_;
    do
      v13 = __ldaxr(v12);
    while (__stlxr(v13 - 1, v12));
    if (!v13)
    {
      ((void (*)(std::__shared_weak_count *))v17->__on_zero_shared)(v17);
      std::__shared_weak_count::__release_weak(v17);
    }
  }
  v14 = v20;
  if (v20)
  {
    v15 = (unint64_t *)&v20->__shared_owners_;
    do
      v16 = __ldaxr(v15);
    while (__stlxr(v16 - 1, v15));
    if (!v16)
    {
      ((void (*)(std::__shared_weak_count *))v14->__on_zero_shared)(v14);
      std::__shared_weak_count::__release_weak(v14);
    }
  }
}

- (void)_stopOdometerSuitabilityUpdates
{
  unint64_t *p_shared_owners;
  unint64_t v4;
  std::__shared_weak_count *v5;
  unint64_t *v6;
  unint64_t v7;
  std::__shared_weak_count *v8;
  unint64_t *v9;
  unint64_t v10;
  void *__p[2];
  char v12;
  uint64_t v13;
  std::__shared_weak_count *v14;
  uint64_t v15;
  std::__shared_weak_count *v16;
  const __CFString *v17;
  _QWORD v18[2];

  v18[1] = *MEMORY[0x1E0C80C00];
  v17 = CFSTR("kCLConnectionMessageSubscribeKey");
  v18[0] = MEMORY[0x1E0C9AAA0];
  __p[0] = (void *)objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x1E0C99D80], a2, (uint64_t)v18, (uint64_t)&v17, 1);
  sub_18F3F3FE8(&v15, __p);
  v13 = v15;
  v14 = v16;
  if (v16)
  {
    p_shared_owners = (unint64_t *)&v16->__shared_owners_;
    do
      v4 = __ldxr(p_shared_owners);
    while (__stxr(v4 + 1, p_shared_owners));
  }
  CLConnectionClient::sendMessage();
  v5 = v14;
  if (v14)
  {
    v6 = (unint64_t *)&v14->__shared_owners_;
    do
      v7 = __ldaxr(v6);
    while (__stlxr(v7 - 1, v6));
    if (!v7)
    {
      ((void (*)(std::__shared_weak_count *))v5->__on_zero_shared)(v5);
      std::__shared_weak_count::__release_weak(v5);
    }
  }
  sub_18F270374(__p, "kCLConnectionMessageOdometerSuitabilityUpdate");
  CLConnectionClient::setHandlerForMessage();
  if (v12 < 0)
    operator delete(__p[0]);

  self->fHandler = 0;
  v8 = v16;
  if (v16)
  {
    v9 = (unint64_t *)&v16->__shared_owners_;
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

- (CMOdometerSuitabilityManager)odometerSuitabilityManager
{
  return self->_odometerSuitabilityManager;
}

- (void)setOdometerSuitabilityManager:(id)a3
{
  self->_odometerSuitabilityManager = (CMOdometerSuitabilityManager *)a3;
}

- (double)startDate
{
  return self->_startDate;
}

- (void)setStartDate:(double)a3
{
  self->_startDate = a3;
}

- (double)suitableForRunning
{
  return self->_suitableForRunning;
}

- (void)setSuitableForRunning:(double)a3
{
  self->_suitableForRunning = a3;
}

- (double)suitableForWalking
{
  return self->_suitableForWalking;
}

- (void)setSuitableForWalking:(double)a3
{
  self->_suitableForWalking = a3;
}

@end
