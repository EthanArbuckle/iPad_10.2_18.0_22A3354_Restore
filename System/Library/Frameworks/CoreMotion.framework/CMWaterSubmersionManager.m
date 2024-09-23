@implementation CMWaterSubmersionManager

+ (BOOL)waterSubmersionAvailable
{
  if (qword_1ECEDEF70 != -1)
    dispatch_once(&qword_1ECEDEF70, &unk_1E2944F60);
  return ((dword_1ECEDEF5C - 115) < 0x13) & (0x787E1u >> (dword_1ECEDEF5C - 115));
}

+ (CMAuthorizationStatus)authorizationStatus
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  return objc_msgSend_authorizationStatus(CMMotionUtils, a2, v2, v3, v4);
}

+ (BOOL)isAuthorizedAndEntitled
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  int hasEntitlement;

  if (objc_msgSend_authorizationStatus(CMMotionUtils, a2, v2, v3, v4) == 3)
  {
    if ((objc_msgSend_hasEntitlement_(CMMotionUtils, v5, (uint64_t)CFSTR("com.apple.developer.submerged-depth-and-pressure"), v6, v7) & 1) != 0|| (hasEntitlement = objc_msgSend_hasEntitlement_(CMMotionUtils, v8, (uint64_t)CFSTR("com.apple.developer.submerged-shallow-depth-and-pressure"), v9, v10)) != 0)
    {
      LOBYTE(hasEntitlement) = 1;
    }
  }
  else
  {
    LOBYTE(hasEntitlement) = 0;
  }
  return hasEntitlement;
}

- (void)notifySubmersionStateProcessingCompleted
{
  uint64_t v2;
  std::__shared_weak_count *v3;
  unint64_t *p_shared_owners;
  unint64_t v5;
  unint64_t *v6;
  unint64_t v7;
  unint64_t *v8;
  unint64_t v9;
  void *__p[2];
  char v11;
  const __CFString *v12;
  _QWORD v13[2];

  v13[1] = *MEMORY[0x1E0C80C00];
  v12 = CFSTR("WaterSubmersion/kCLConnectionMessageWaterSubmersionCompletionHandler");
  v13[0] = MEMORY[0x1E0C9AAB0];
  v2 = objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x1E0C99D80], a2, (uint64_t)v13, (uint64_t)&v12, 1);
  v3 = (std::__shared_weak_count *)operator new(0x70uLL);
  v3->__shared_owners_ = 0;
  p_shared_owners = (unint64_t *)&v3->__shared_owners_;
  v3->__shared_weak_owners_ = 0;
  v3->__vftable = (std::__shared_weak_count_vtbl *)&off_1E2952688;
  sub_18F270374(__p, "WaterSubmersion/kCLConnectionMessageWaterSubmersionCompletionHandler");
  MEMORY[0x19400103C](&v3[1], __p, v2);
  if (v11 < 0)
    operator delete(__p[0]);
  do
    v5 = __ldxr(p_shared_owners);
  while (__stxr(v5 + 1, p_shared_owners));
  CLConnectionClient::sendMessage();
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
  if (v3)
  {
    v8 = (unint64_t *)&v3->__shared_owners_;
    do
      v9 = __ldaxr(v8);
    while (__stlxr(v9 - 1, v8));
    if (!v9)
    {
      ((void (*)(std::__shared_weak_count *))v3->__on_zero_shared)(v3);
      std::__shared_weak_count::__release_weak(v3);
    }
  }
}

- (NSMeasurement)maximumDepth
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
  NSMeasurement *result;
  uint64_t hasEntitlement;
  CLSubmersionStateMachine *v15;
  const char *v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  id v20;
  const char *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  double v25;
  double v26;
  const char *v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  const char *v32;
  uint64_t v33;
  uint64_t v34;

  if (!objc_msgSend_waterSubmersionAvailable(CMWaterSubmersionManager, a2, v2, v3, v4)
    || !objc_msgSend_isAuthorizedAndEntitled(CMWaterSubmersionManager, v6, v7, v8, v9))
  {
    return 0;
  }
  result = self->_maximumDepth;
  if (!result)
  {
    hasEntitlement = objc_msgSend_hasEntitlement_(CMMotionUtils, v10, (uint64_t)CFSTR("com.apple.developer.submerged-depth-and-pressure"), v11, v12);
    v15 = [CLSubmersionStateMachine alloc];
    v19 = (void *)objc_msgSend_initWithType_(v15, v16, hasEntitlement, v17, v18);
    v20 = objc_alloc(MEMORY[0x1E0CB3758]);
    objc_msgSend_pastMaxDepthThreshold(v19, v21, v22, v23, v24);
    v26 = v25;
    v31 = objc_msgSend_meters(MEMORY[0x1E0CB3AD8], v27, v28, v29, v30);
    self->_maximumDepth = (NSMeasurement *)objc_msgSend_initWithDoubleValue_unit_(v20, v32, v31, v33, v34, v26);

    return self->_maximumDepth;
  }
  return result;
}

- (CMWaterSubmersionManager)init
{
  CMWaterSubmersionManager *v2;
  dispatch_queue_t v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)CMWaterSubmersionManager;
  v2 = -[CMWaterSubmersionManager init](&v5, sel_init);
  if (v2)
  {
    v3 = dispatch_queue_create("com.apple.CoreMotion.CMWaterSubmersionManager", 0);
    v2->_locationConnection = 0;
    v2->_dispatchQueue = (OS_dispatch_queue *)v3;
    v2->_maximumDepth = 0;
  }
  return v2;
}

- (void)dealloc
{
  const char *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  NSObject *dispatchQueue;
  objc_super v8;
  _QWORD block[5];

  dispatch_queue_set_specific((dispatch_queue_t)self->_dispatchQueue, &unk_1EE16E840, &unk_1EE16E840, 0);
  if (dispatch_get_specific(&unk_1EE16E840) == &unk_1EE16E840)
  {
    objc_msgSend__disconnect(self, v3, v4, v5, v6);
  }
  else
  {
    dispatchQueue = self->_dispatchQueue;
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = sub_18F400CE8;
    block[3] = &unk_1E2955938;
    block[4] = self;
    dispatch_sync(dispatchQueue, block);
  }

  self->_dispatchQueue = 0;
  self->_maximumDepth = 0;
  v8.receiver = self;
  v8.super_class = (Class)CMWaterSubmersionManager;
  -[CMWaterSubmersionManager dealloc](&v8, sel_dealloc);
}

- (void)setDelegate:(id)delegate
{
  uint64_t v3;
  uint64_t v4;
  _QWORD v5[6];

  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = sub_18F400D4C;
  v5[3] = &unk_1E29559D0;
  v5[4] = self;
  v5[5] = delegate;
  objc_msgSend_tccServiceMotionAccessWithBlock_(CMMotionUtils, a2, (uint64_t)v5, v3, v4);
}

- (void)_setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (void)_connect
{
  void *v3;
  const char *v4;
  uint64_t v5;
  std::__shared_weak_count *v6;
  unint64_t *p_shared_owners;
  unint64_t v8;
  unint64_t *v9;
  unint64_t v10;
  unint64_t *v11;
  unint64_t v12;
  id v13;
  id location;
  void *__p[2];
  char v16;
  void *v17[2];
  char v18;
  const __CFString *v19;
  _QWORD v20[2];

  v20[1] = *MEMORY[0x1E0C80C00];
  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  if (!self->_locationConnection)
  {
    v3 = (void *)operator new();
    sub_18F270374(__p, "com.apple.locationd.registration");
    MEMORY[0x19400100C](v3, __p, self->_dispatchQueue);
    self->_locationConnection = v3;
    if (v16 < 0)
      operator delete(__p[0]);
    objc_initWeak(&location, self);
    objc_copyWeak(&v13, &location);
    CLConnectionClient::setDefaultMessageHandler();
    CLConnectionClient::start((CLConnectionClient *)self->_locationConnection);
    v19 = CFSTR("kCLConnectionMessageSubscribeKey");
    v20[0] = MEMORY[0x1E0C9AAB0];
    v5 = objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x1E0C99D80], v4, (uint64_t)v20, (uint64_t)&v19, 1);
    v6 = (std::__shared_weak_count *)operator new(0x70uLL);
    v6->__shared_owners_ = 0;
    p_shared_owners = (unint64_t *)&v6->__shared_owners_;
    v6->__shared_weak_owners_ = 0;
    v6->__vftable = (std::__shared_weak_count_vtbl *)&off_1E2952688;
    sub_18F270374(v17, "WaterSubmersion/kCLConnectionMessageWaterSubmersionSubscription");
    MEMORY[0x19400103C](&v6[1], v17, v5);
    if (v18 < 0)
      operator delete(v17[0]);
    do
      v8 = __ldxr(p_shared_owners);
    while (__stxr(v8 + 1, p_shared_owners));
    CLConnectionClient::sendMessage();
    if (v6)
    {
      v9 = (unint64_t *)&v6->__shared_owners_;
      do
        v10 = __ldaxr(v9);
      while (__stlxr(v10 - 1, v9));
      if (!v10)
      {
        ((void (*)(std::__shared_weak_count *))v6->__on_zero_shared)(v6);
        std::__shared_weak_count::__release_weak(v6);
      }
    }
    if (v6)
    {
      v11 = (unint64_t *)&v6->__shared_owners_;
      do
        v12 = __ldaxr(v11);
      while (__stlxr(v12 - 1, v11));
      if (!v12)
      {
        ((void (*)(std::__shared_weak_count *))v6->__on_zero_shared)(v6);
        std::__shared_weak_count::__release_weak(v6);
      }
    }
    objc_destroyWeak(&v13);
    objc_destroyWeak(&location);
  }
}

- (void)_handleMessage:(shared_ptr<CLConnectionMessage>)a3
{
  CLConnectionMessage **var0;
  _QWORD *v5;
  int v6;
  CLConnectionMessage *v7;
  objc_class *v8;
  uint64_t ObjectOfClass;
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  const char *v15;
  uint64_t v16;
  uint64_t v17;
  _QWORD *v18;
  int v19;
  CLConnectionMessage *v20;
  objc_class *v21;
  uint64_t v22;
  const char *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  void *v27;
  const char *v28;
  uint64_t v29;
  uint64_t v30;
  _QWORD *v31;
  int v32;
  CLConnectionMessage *v33;
  objc_class *v34;
  uint64_t v35;
  const char *v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  void *v40;
  const char *v41;
  uint64_t v42;
  uint64_t v43;
  _QWORD *v44;
  int v45;
  CLConnectionMessage *v46;
  objc_class *v47;
  uint64_t v48;
  const char *v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  void *v53;
  const char *v54;
  uint64_t v55;
  uint64_t v56;
  _QWORD v57[6];
  _QWORD v58[6];
  _QWORD v59[6];
  _QWORD v60[6];

  var0 = (CLConnectionMessage **)a3.var0;
  v5 = (_QWORD *)CLConnectionMessage::name(*(CLConnectionMessage **)a3.var0);
  v6 = *((char *)v5 + 23);
  if (v6 < 0)
  {
    if (v5[1] != 62)
      goto LABEL_9;
    v5 = (_QWORD *)*v5;
  }
  else if (v6 != 62)
  {
    goto LABEL_9;
  }
  if (!memcmp(v5, "WaterSubmersion/kCLConnectionMessageWaterSubmersionEventUpdate", 0x3EuLL))
  {
    objc_loadWeak((id *)&self->_delegate);
    if ((objc_opt_respondsToSelector() & 1) == 0)
      return;
    v7 = *var0;
    v8 = (objc_class *)objc_opt_class();
    ObjectOfClass = CLConnectionMessage::getObjectOfClass(v7, v8);
    v14 = (void *)objc_msgSend_mainQueue(MEMORY[0x1E0CB3828], v10, v11, v12, v13);
    v60[0] = MEMORY[0x1E0C809B0];
    v60[1] = 3221225472;
    v60[2] = sub_18F4014DC;
    v60[3] = &unk_1E29559D0;
    v60[4] = self;
    v60[5] = ObjectOfClass;
    objc_msgSend_addOperationWithBlock_(v14, v15, (uint64_t)v60, v16, v17);
  }
LABEL_9:
  v18 = (_QWORD *)CLConnectionMessage::name(*var0);
  v19 = *((char *)v18 + 23);
  if (v19 < 0)
  {
    if (v18[1] != 68)
      goto LABEL_17;
    v18 = (_QWORD *)*v18;
  }
  else if (v19 != 68)
  {
    goto LABEL_17;
  }
  if (!memcmp(v18, "WaterSubmersion/kCLConnectionMessageWaterSubmersionMeasurementUpdate", 0x44uLL))
  {
    objc_loadWeak((id *)&self->_delegate);
    if ((objc_opt_respondsToSelector() & 1) == 0)
      return;
    v20 = *var0;
    v21 = (objc_class *)objc_opt_class();
    v22 = CLConnectionMessage::getObjectOfClass(v20, v21);
    v27 = (void *)objc_msgSend_mainQueue(MEMORY[0x1E0CB3828], v23, v24, v25, v26);
    v59[0] = MEMORY[0x1E0C809B0];
    v59[1] = 3221225472;
    v59[2] = sub_18F401508;
    v59[3] = &unk_1E29559D0;
    v59[4] = self;
    v59[5] = v22;
    objc_msgSend_addOperationWithBlock_(v27, v28, (uint64_t)v59, v29, v30);
  }
LABEL_17:
  v31 = (_QWORD *)CLConnectionMessage::name(*var0);
  v32 = *((char *)v31 + 23);
  if (v32 < 0)
  {
    if (v31[1] != 68)
      goto LABEL_25;
    v31 = (_QWORD *)*v31;
  }
  else if (v32 != 68)
  {
    goto LABEL_25;
  }
  if (!memcmp(v31, "WaterSubmersion/kCLConnectionMessageWaterSubmersionTemperatureUpdate", 0x44uLL))
  {
    objc_loadWeak((id *)&self->_delegate);
    if ((objc_opt_respondsToSelector() & 1) == 0)
      return;
    v33 = *var0;
    v34 = (objc_class *)objc_opt_class();
    v35 = CLConnectionMessage::getObjectOfClass(v33, v34);
    v40 = (void *)objc_msgSend_mainQueue(MEMORY[0x1E0CB3828], v36, v37, v38, v39);
    v58[0] = MEMORY[0x1E0C809B0];
    v58[1] = 3221225472;
    v58[2] = sub_18F401534;
    v58[3] = &unk_1E29559D0;
    v58[4] = self;
    v58[5] = v35;
    objc_msgSend_addOperationWithBlock_(v40, v41, (uint64_t)v58, v42, v43);
  }
LABEL_25:
  v44 = (_QWORD *)CLConnectionMessage::name(*var0);
  v45 = *((char *)v44 + 23);
  if (v45 < 0)
  {
    if (v44[1] != 64)
      return;
    v44 = (_QWORD *)*v44;
  }
  else if (v45 != 64)
  {
    return;
  }
  if (!memcmp(v44, "WaterSubmersion/kCLConnectionMessageWaterSubmersionErrorOccurred", 0x40uLL))
  {
    objc_loadWeak((id *)&self->_delegate);
    if ((objc_opt_respondsToSelector() & 1) != 0)
    {
      v46 = *var0;
      v47 = (objc_class *)objc_opt_class();
      v48 = CLConnectionMessage::getObjectOfClass(v46, v47);
      v53 = (void *)objc_msgSend_mainQueue(MEMORY[0x1E0CB3828], v49, v50, v51, v52);
      v57[0] = MEMORY[0x1E0C809B0];
      v57[1] = 3221225472;
      v57[2] = sub_18F401560;
      v57[3] = &unk_1E29559D0;
      v57[4] = self;
      v57[5] = v48;
      objc_msgSend_addOperationWithBlock_(v53, v54, (uint64_t)v57, v55, v56);
    }
  }
}

- (void)_disconnect
{
  uint64_t v3;

  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  if (self->_locationConnection)
  {
    v3 = MEMORY[0x194001018]();
    MEMORY[0x194001438](v3, 0xB0C40BC2CC919);
    self->_locationConnection = 0;
  }
}

- (id)delegate
{
  return objc_loadWeak((id *)&self->_delegate);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
}

@end
