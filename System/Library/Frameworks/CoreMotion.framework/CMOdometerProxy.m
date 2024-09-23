@implementation CMOdometerProxy

- (CMOdometerProxy)initWithOdometer:(id)a3
{
  CMOdometerProxy *v4;
  CMOdometerProxy *v5;
  uint64_t v6;
  void *__p[2];
  char v9;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)CMOdometerProxy;
  v4 = -[CMOdometerProxy init](&v10, sel_init);
  v5 = v4;
  if (v4)
  {
    v4->_odometer = (CMOdometer *)a3;
    v4->fInternalQueue = (OS_dispatch_queue *)dispatch_queue_create("com.apple.CoreMotion.CMOdometer.internal", 0);
    v5->fCallbackQueue = (OS_dispatch_queue *)dispatch_queue_create("com.apple.CoreMotion.CMOdometer.callback", 0);
    v6 = operator new();
    sub_18F270374(__p, "com.apple.locationd.registration");
    MEMORY[0x19400100C](v6, __p, v5->fInternalQueue);
    v5->fLocationdConnection = (void *)v6;
    if (v9 < 0)
      operator delete(__p[0]);
    v5->fHandler = 0;
    v5->fGpsAvailability = -1;
  }
  return v5;
}

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)CMOdometerProxy;
  -[CMOdometerProxy dealloc](&v3, sel_dealloc);
}

- (void)_teardown
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;

  objc_msgSend__stopOdometerGpsAvailability(self, a2, v2, v3, v4);
  objc_msgSend__stopOdometerUpdates(self, v6, v7, v8, v9);
  objc_msgSend__stopCyclingWorkoutDistanceUpdates(self, v10, v11, v12, v13);
  if (self->fLocationdConnection)
  {
    v14 = MEMORY[0x194001018]();
    MEMORY[0x194001438](v14, 0xB0C40BC2CC919);
  }
  self->fLocationdConnection = 0;
}

- (void)_startDaemonConnection
{
  uint64_t v3;
  const char *v4;
  unint64_t *p_shared_owners;
  unint64_t v6;
  unint64_t *v7;
  unint64_t v8;
  std::__shared_weak_count *v9;
  unint64_t *v10;
  unint64_t v11;
  std::__shared_weak_count *v12;
  _QWORD v13[11];
  void *__p;
  std::__shared_weak_count *v15;
  char v16;
  const __CFString *v17;
  _QWORD v18[2];

  v18[1] = *MEMORY[0x1E0C80C00];
  CLConnectionClient::setDefaultMessageHandler();
  sub_18F270374(&__p, "kCLConnectionMessageOdometerGpsAvailability");
  v3 = MEMORY[0x1E0C809B0];
  v13[6] = MEMORY[0x1E0C809B0];
  v13[7] = 3221225472;
  v13[8] = sub_18F39C6C4;
  v13[9] = &unk_1E2955DD8;
  v13[10] = self;
  CLConnectionClient::setHandlerForMessage();
  if (v16 < 0)
    operator delete(__p);
  v13[1] = v3;
  v13[2] = 3221225472;
  v13[3] = sub_18F39C7B4;
  v13[4] = &unk_1E2955938;
  v13[5] = self;
  CLConnectionClient::setInterruptionHandler();
  CLConnectionClient::start((CLConnectionClient *)self->fLocationdConnection);
  v17 = CFSTR("kCLConnectionMessageSubscribeKey");
  v18[0] = MEMORY[0x1E0C9AAB0];
  v13[0] = objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x1E0C99D80], v4, (uint64_t)v18, (uint64_t)&v17, 1);
  sub_18F39E62C("kCLConnectionMessageOdometerGpsAvailability", v13, &__p);
  v12 = v15;
  if (v15)
  {
    p_shared_owners = (unint64_t *)&v15->__shared_owners_;
    do
      v6 = __ldxr(p_shared_owners);
    while (__stxr(v6 + 1, p_shared_owners));
  }
  CLConnectionClient::sendMessage();
  if (v12)
  {
    v7 = (unint64_t *)&v12->__shared_owners_;
    do
      v8 = __ldaxr(v7);
    while (__stlxr(v8 - 1, v7));
    if (!v8)
    {
      ((void (*)(std::__shared_weak_count *))v12->__on_zero_shared)(v12);
      std::__shared_weak_count::__release_weak(v12);
    }
  }
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

- (void)_startOdometerUpdatesWithHandler:(id)a3
{
  uint64_t v3;
  uint64_t v4;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  const char *v11;
  unint64_t *p_shared_owners;
  unint64_t v13;
  unint64_t *v14;
  unint64_t v15;
  std::__shared_weak_count *v16;
  unint64_t *v17;
  unint64_t v18;
  std::__shared_weak_count *v19;
  _QWORD v20[6];
  void *__p;
  std::__shared_weak_count *v22;
  char v23;
  const __CFString *v24;
  _QWORD v25[2];

  v25[1] = *MEMORY[0x1E0C80C00];
  objc_msgSend_setTotalDistance_(self, a2, (uint64_t)a3, v3, v4, -1.0);

  self->fHandler = (id)objc_msgSend_copy(a3, v7, v8, v9, v10);
  sub_18F270374(&__p, "kCLConnectionMessageStartOdometerUpdate");
  v20[1] = MEMORY[0x1E0C809B0];
  v20[2] = 3221225472;
  v20[3] = sub_18F39CBBC;
  v20[4] = &unk_1E2955DD8;
  v20[5] = self;
  CLConnectionClient::setHandlerForMessage();
  if (v23 < 0)
    operator delete(__p);
  v24 = CFSTR("kCLConnectionMessageSubscribeKey");
  v25[0] = MEMORY[0x1E0C9AAB0];
  v20[0] = objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x1E0C99D80], v11, (uint64_t)v25, (uint64_t)&v24, 1);
  sub_18F352BEC("kCLConnectionMessageStartOdometerUpdate", v20, &__p);
  v19 = v22;
  if (v22)
  {
    p_shared_owners = (unint64_t *)&v22->__shared_owners_;
    do
      v13 = __ldxr(p_shared_owners);
    while (__stxr(v13 + 1, p_shared_owners));
  }
  CLConnectionClient::sendMessage();
  if (v19)
  {
    v14 = (unint64_t *)&v19->__shared_owners_;
    do
      v15 = __ldaxr(v14);
    while (__stlxr(v15 - 1, v14));
    if (!v15)
    {
      ((void (*)(std::__shared_weak_count *))v19->__on_zero_shared)(v19);
      std::__shared_weak_count::__release_weak(v19);
    }
  }
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

- (void)_stopOdometerGpsAvailability
{
  unint64_t *p_shared_owners;
  unint64_t v3;
  std::__shared_weak_count *v4;
  unint64_t *v5;
  unint64_t v6;
  std::__shared_weak_count *v7;
  unint64_t *v8;
  unint64_t v9;
  void *__p[2];
  char v11;
  uint64_t v12;
  std::__shared_weak_count *v13;
  uint64_t v14;
  std::__shared_weak_count *v15;
  const __CFString *v16;
  _QWORD v17[2];

  v17[1] = *MEMORY[0x1E0C80C00];
  v16 = CFSTR("kCLConnectionMessageSubscribeKey");
  v17[0] = MEMORY[0x1E0C9AAA0];
  __p[0] = (void *)objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x1E0C99D80], a2, (uint64_t)v17, (uint64_t)&v16, 1);
  sub_18F39E62C("kCLConnectionMessageOdometerGpsAvailability", __p, &v14);
  v12 = v14;
  v13 = v15;
  if (v15)
  {
    p_shared_owners = (unint64_t *)&v15->__shared_owners_;
    do
      v3 = __ldxr(p_shared_owners);
    while (__stxr(v3 + 1, p_shared_owners));
  }
  CLConnectionClient::sendMessage();
  v4 = v13;
  if (v13)
  {
    v5 = (unint64_t *)&v13->__shared_owners_;
    do
      v6 = __ldaxr(v5);
    while (__stlxr(v6 - 1, v5));
    if (!v6)
    {
      ((void (*)(std::__shared_weak_count *))v4->__on_zero_shared)(v4);
      std::__shared_weak_count::__release_weak(v4);
    }
  }
  sub_18F270374(__p, "kCLConnectionMessageOdometerGpsAvailability");
  CLConnectionClient::setHandlerForMessage();
  if (v11 < 0)
    operator delete(__p[0]);
  v7 = v15;
  if (v15)
  {
    v8 = (unint64_t *)&v15->__shared_owners_;
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

- (void)_stopOdometerUpdates
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
  sub_18F352BEC("kCLConnectionMessageStartOdometerUpdate", __p, &v15);
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
  sub_18F270374(__p, "kCLConnectionMessageStartOdometerUpdate");
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

- (void)_startCyclingWorkoutDistanceUpdatesWithHandler:(id)a3
{
  uint64_t v3;
  uint64_t v4;
  const char *v7;
  unint64_t *p_shared_owners;
  unint64_t v9;
  unint64_t *v10;
  unint64_t v11;
  std::__shared_weak_count *v12;
  unint64_t *v13;
  unint64_t v14;
  std::__shared_weak_count *v15;
  _QWORD v16[7];
  void *__p;
  std::__shared_weak_count *v18;
  char v19;
  const __CFString *v20;
  _QWORD v21[2];

  v21[1] = *MEMORY[0x1E0C80C00];
  objc_msgSend_setTotalCyclingDistance_(self, a2, (uint64_t)a3, v3, v4, -1.0);
  sub_18F270374(&__p, "kCLConnectionMessageCyclingWorkoutDistanceUpdate");
  v16[1] = MEMORY[0x1E0C809B0];
  v16[2] = 3221225472;
  v16[3] = sub_18F39D5D0;
  v16[4] = &unk_1E2955B88;
  v16[5] = self;
  v16[6] = a3;
  CLConnectionClient::setHandlerForMessage();
  if (v19 < 0)
    operator delete(__p);
  v20 = CFSTR("kCLConnectionMessageSubscribeKey");
  v21[0] = MEMORY[0x1E0C9AAB0];
  v16[0] = objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x1E0C99D80], v7, (uint64_t)v21, (uint64_t)&v20, 1);
  sub_18F39E75C(&__p, v16);
  v15 = v18;
  if (v18)
  {
    p_shared_owners = (unint64_t *)&v18->__shared_owners_;
    do
      v9 = __ldxr(p_shared_owners);
    while (__stxr(v9 + 1, p_shared_owners));
  }
  CLConnectionClient::sendMessage();
  if (v15)
  {
    v10 = (unint64_t *)&v15->__shared_owners_;
    do
      v11 = __ldaxr(v10);
    while (__stlxr(v11 - 1, v10));
    if (!v11)
    {
      ((void (*)(std::__shared_weak_count *))v15->__on_zero_shared)(v15);
      std::__shared_weak_count::__release_weak(v15);
    }
  }
  v12 = v18;
  if (v18)
  {
    v13 = (unint64_t *)&v18->__shared_owners_;
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

- (void)_stopCyclingWorkoutDistanceUpdates
{
  unint64_t *p_shared_owners;
  unint64_t v3;
  std::__shared_weak_count *v4;
  unint64_t *v5;
  unint64_t v6;
  std::__shared_weak_count *v7;
  unint64_t *v8;
  unint64_t v9;
  void *__p[2];
  char v11;
  uint64_t v12;
  std::__shared_weak_count *v13;
  uint64_t v14;
  std::__shared_weak_count *v15;
  const __CFString *v16;
  _QWORD v17[2];

  v17[1] = *MEMORY[0x1E0C80C00];
  v16 = CFSTR("kCLConnectionMessageSubscribeKey");
  v17[0] = MEMORY[0x1E0C9AAA0];
  __p[0] = (void *)objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x1E0C99D80], a2, (uint64_t)v17, (uint64_t)&v16, 1);
  sub_18F39E75C(&v14, __p);
  v12 = v14;
  v13 = v15;
  if (v15)
  {
    p_shared_owners = (unint64_t *)&v15->__shared_owners_;
    do
      v3 = __ldxr(p_shared_owners);
    while (__stxr(v3 + 1, p_shared_owners));
  }
  CLConnectionClient::sendMessage();
  v4 = v13;
  if (v13)
  {
    v5 = (unint64_t *)&v13->__shared_owners_;
    do
      v6 = __ldaxr(v5);
    while (__stlxr(v6 - 1, v5));
    if (!v6)
    {
      ((void (*)(std::__shared_weak_count *))v4->__on_zero_shared)(v4);
      std::__shared_weak_count::__release_weak(v4);
    }
  }
  sub_18F270374(__p, "kCLConnectionMessageCyclingWorkoutDistanceUpdate");
  CLConnectionClient::setHandlerForMessage();
  if (v11 < 0)
    operator delete(__p[0]);
  v7 = v15;
  if (v15)
  {
    v8 = (unint64_t *)&v15->__shared_owners_;
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

- (CMOdometer)odometer
{
  return self->_odometer;
}

- (void)setOdometer:(id)a3
{
  self->_odometer = (CMOdometer *)a3;
}

- (double)totalDistance
{
  return self->_totalDistance;
}

- (void)setTotalDistance:(double)a3
{
  self->_totalDistance = a3;
}

- (double)averageSpeed
{
  return self->_averageSpeed;
}

- (void)setAverageSpeed:(double)a3
{
  self->_averageSpeed = a3;
}

- (double)startDate
{
  return self->_startDate;
}

- (void)setStartDate:(double)a3
{
  self->_startDate = a3;
}

- (double)totalCyclingDistance
{
  return self->_totalCyclingDistance;
}

- (void)setTotalCyclingDistance:(double)a3
{
  self->_totalCyclingDistance = a3;
}

- (double)cyclingStartDate
{
  return self->_cyclingStartDate;
}

- (void)setCyclingStartDate:(double)a3
{
  self->_cyclingStartDate = a3;
}

@end
