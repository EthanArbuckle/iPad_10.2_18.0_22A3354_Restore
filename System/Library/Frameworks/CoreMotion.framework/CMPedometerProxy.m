@implementation CMPedometerProxy

- (void)_handleQueryResponse:(shared_ptr<CLConnectionMessage>)a3 onQueue:(id)a4 withHandler:(id)a5
{
  NSObject *var1;
  CLConnectionMessage **var0;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  const char *v12;
  uint64_t v13;
  uint64_t v14;
  NSSet *v15;
  void *DictionaryOfClasses;
  const char *v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  uint64_t v21;
  const char *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  _QWORD *v26;
  NSObject *v27;
  NSObject *v28;
  char *v29;
  char *v30;
  _QWORD block[6];
  _QWORD v32[7];
  _QWORD v33[7];
  int v34;
  void *v35;
  uint8_t buf[4];
  void *v37;
  uint64_t v38;

  var1 = a3.var1;
  var0 = (CLConnectionMessage **)a3.var0;
  v38 = *MEMORY[0x1E0C80C00];
  v8 = (void *)MEMORY[0x1E0C99E60];
  v9 = objc_opt_class();
  v10 = objc_opt_class();
  v11 = objc_opt_class();
  v15 = (NSSet *)objc_msgSend_setWithObjects_(v8, v12, v9, v13, v14, v10, v11, 0);
  if (!*var0 || (DictionaryOfClasses = (void *)CLConnectionMessage::getDictionaryOfClasses(*var0, v15)) == 0)
  {
    if (qword_1EE16D478 != -1)
      dispatch_once(&qword_1EE16D478, &unk_1E2943B30);
    v27 = qword_1EE16D470;
    if (os_log_type_enabled((os_log_t)qword_1EE16D470, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_18F1DC000, v27, OS_LOG_TYPE_ERROR, "Unable to parse message when checking for availability!", buf, 2u);
    }
    if (sub_18F1FCA08(115, 0))
    {
      bzero(buf, 0x65CuLL);
      if (qword_1EE16D478 != -1)
        dispatch_once(&qword_1EE16D478, &unk_1E2943B30);
      LOWORD(v34) = 0;
      v30 = (char *)_os_log_send_and_compose_impl();
      sub_18F419700("Generic", 1, 0, 0, "-[CMPedometerProxy _handleQueryResponse:onQueue:withHandler:]", "CoreLocation: %s\n", v30);
      if (v30 != (char *)buf)
        free(v30);
    }
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = sub_18F42307C;
    block[3] = &unk_1E2955B60;
    block[4] = 0;
    block[5] = a4;
    v26 = block;
    goto LABEL_11;
  }
  v20 = DictionaryOfClasses;
  v21 = objc_msgSend_objectForKeyedSubscript_(DictionaryOfClasses, v17, (uint64_t)CFSTR("CMErrorMessage"), v18, v19);
  v25 = objc_msgSend_objectForKeyedSubscript_(v20, v22, (uint64_t)CFSTR("CMPedometerDataObject"), v23, v24);
  if (v21)
  {
    v33[0] = MEMORY[0x1E0C809B0];
    v33[1] = 3221225472;
    v33[2] = sub_18F423014;
    v33[3] = &unk_1E2957580;
    v33[5] = v21;
    v33[6] = a4;
    v33[4] = v20;
    v26 = v33;
LABEL_11:
    dispatch_async(var1, v26);
    return;
  }
  if (v25)
  {
    v32[0] = MEMORY[0x1E0C809B0];
    v32[1] = 3221225472;
    v32[2] = sub_18F1E3460;
    v32[3] = &unk_1E2957580;
    v32[5] = v20;
    v32[6] = a4;
    v32[4] = v25;
    v26 = v32;
    goto LABEL_11;
  }
  if (qword_1EE16D478 != -1)
    dispatch_once(&qword_1EE16D478, &unk_1E2943B30);
  v28 = qword_1EE16D470;
  if (os_log_type_enabled((os_log_t)qword_1EE16D470, OS_LOG_TYPE_FAULT))
  {
    *(_DWORD *)buf = 138543362;
    v37 = v20;
    _os_log_impl(&dword_18F1DC000, v28, OS_LOG_TYPE_FAULT, "Unable to parse message (%{public}@) for query response ", buf, 0xCu);
  }
  if (sub_18F1FCA08(115, 0))
  {
    bzero(buf, 0x65CuLL);
    if (qword_1EE16D478 != -1)
      dispatch_once(&qword_1EE16D478, &unk_1E2943B30);
    v34 = 138543362;
    v35 = v20;
    v29 = (char *)_os_log_send_and_compose_impl();
    sub_18F419700("Generic", 1, 0, 0, "-[CMPedometerProxy _handleQueryResponse:onQueue:withHandler:]", "CoreLocation: %s\n", v29);
    if (v29 != (char *)buf)
      free(v29);
  }
}

- (void)_teardown
{
  uint64_t v3;
  void *__p;
  char v5;

  sub_18F270374(&__p, "kCLConnectionMessageStepCountUpdate");
  CLConnectionClient::setHandlerForMessage();
  if (v5 < 0)
    operator delete(__p);
  if (self->fLocationdConnection)
  {
    v3 = MEMORY[0x194001018]();
    MEMORY[0x194001438](v3, 0xB0C40BC2CC919);
  }
  self->fLocationdConnection = 0;
}

- (void)dealloc
{
  objc_super v3;

  _Block_release(self->fOffsetUpdateHandler);
  self->fOffsetUpdateHandler = 0;

  self->fCumulativeUpdateHandler = 0;
  _Block_release(self->fEventHandler);
  self->fEventHandler = 0;
  dispatch_release((dispatch_object_t)self->fInternalQueue);
  self->fInternalQueue = 0;
  dispatch_release((dispatch_object_t)self->fAppQueue);
  self->fAppQueue = 0;
  v3.receiver = self;
  v3.super_class = (Class)CMPedometerProxy;
  -[CMPedometerProxy dealloc](&v3, sel_dealloc);
}

- (void)_internalQueryPedometerDataFromDate:(id)a3 toDate:(id)a4 onQueue:(id)a5 withHandler:(id)a6
{
  void *v7;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  const char *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  const char *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  const char *v21;
  unint64_t *p_shared_owners;
  unint64_t v23;
  unint64_t *v24;
  unint64_t v25;
  std::__shared_weak_count *v26;
  unint64_t *v27;
  unint64_t v28;
  std::__shared_weak_count *v29;
  uint64_t v30;
  std::__shared_weak_count *v31;
  uint64_t v32;
  _QWORD v33[2];
  _QWORD v34[3];

  v34[2] = *MEMORY[0x1E0C80C00];
  v33[0] = CFSTR("CMPedometerStartTime");
  v7 = (void *)MEMORY[0x1E0CB37E8];
  objc_msgSend_timeIntervalSinceReferenceDate(a3, a2, (uint64_t)a3, (uint64_t)a4, (uint64_t)a5);
  v34[0] = objc_msgSend_numberWithDouble_(v7, v8, v9, v10, v11);
  v33[1] = CFSTR("CMPedometerStopTime");
  v12 = (void *)MEMORY[0x1E0CB37E8];
  objc_msgSend_timeIntervalSinceReferenceDate(a4, v13, v14, v15, v16);
  v34[1] = objc_msgSend_numberWithDouble_(v12, v17, v18, v19, v20);
  v32 = objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x1E0C99D80], v21, (uint64_t)v34, (uint64_t)v33, 2);
  sub_18F41EBF4("kCLConnectionMessageStepCountQuery", &v32, &v30);
  v29 = v31;
  if (v31)
  {
    p_shared_owners = (unint64_t *)&v31->__shared_owners_;
    do
      v23 = __ldxr(p_shared_owners);
    while (__stxr(v23 + 1, p_shared_owners));
  }
  CLConnectionClient::sendMessage();
  if (v29)
  {
    v24 = (unint64_t *)&v29->__shared_owners_;
    do
      v25 = __ldaxr(v24);
    while (__stlxr(v25 - 1, v24));
    if (!v25)
    {
      ((void (*)(std::__shared_weak_count *))v29->__on_zero_shared)(v29);
      std::__shared_weak_count::__release_weak(v29);
    }
  }
  v26 = v31;
  if (v31)
  {
    v27 = (unint64_t *)&v31->__shared_owners_;
    do
      v28 = __ldaxr(v27);
    while (__stlxr(v28 - 1, v27));
    if (!v28)
    {
      ((void (*)(std::__shared_weak_count *))v26->__on_zero_shared)(v26);
      std::__shared_weak_count::__release_weak(v26);
    }
  }
}

- (CMPedometerProxy)init
{
  char *v2;
  uint64_t v3;
  const char *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  const char *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void *__p[2];
  char v18;
  void *v19[2];
  char v20;
  objc_super v21;

  v21.receiver = self;
  v21.super_class = (Class)CMPedometerProxy;
  v2 = -[CMPedometerProxy init](&v21, sel_init);
  if (v2)
  {
    *((_QWORD *)v2 + 1) = dispatch_queue_create("com.apple.CoreMotion.CMPedometerInternalQueue", 0);
    *((_QWORD *)v2 + 2) = dispatch_queue_create("com.apple.CoreMotion.CMPedometerUpdateQueue", 0);
    v3 = operator new();
    sub_18F270374(v19, "com.apple.locationd.registration");
    MEMORY[0x19400100C](v3, v19, *((_QWORD *)v2 + 1));
    *((_QWORD *)v2 + 3) = v3;
    if (v20 < 0)
      operator delete(v19[0]);
    *(_OWORD *)(v2 + 121) = 0u;
    *((_OWORD *)v2 + 6) = 0u;
    *((_OWORD *)v2 + 7) = 0u;
    *((_OWORD *)v2 + 4) = 0u;
    *((_OWORD *)v2 + 5) = 0u;
    *((_OWORD *)v2 + 2) = 0u;
    *((_OWORD *)v2 + 3) = 0u;
    v2[137] = objc_msgSend_isFloorCountingAvailable(CMPedometer, v4, v5, v6, v7);
    v2[138] = objc_msgSend_isPaceAvailable(CMPedometer, v8, v9, v10, v11);
    *((_QWORD *)v2 + 18) = 0;
    v2[152] = 0;
    *(_QWORD *)(v2 + 164) = 0;
    *(_QWORD *)(v2 + 156) = 0;
    *((_DWORD *)v2 + 43) = 0;
    v2[176] = objc_msgSend_isAllDayElevationAvailable(CMPedometer, v12, v13, v14, v15);
    *((_DWORD *)v2 + 45) = 0;
    sub_18F270374(__p, "kCLConnectionMessageStepCountUpdate");
    CLConnectionClient::setHandlerForMessage();
    if (v18 < 0)
      operator delete(__p[0]);
    sub_18F270374(__p, "kCLConnectionMessagePedometerEvent");
    CLConnectionClient::setHandlerForMessage();
    if (v18 < 0)
      operator delete(__p[0]);
    CLConnectionClient::setInterruptionHandler();
    CLConnectionClient::start(*((CLConnectionClient **)v2 + 3));
  }
  return (CMPedometerProxy *)v2;
}

- (void)_stopPedometerUpdates
{
  NSObject *fInternalQueue;
  _QWORD block[5];

  fInternalQueue = self->fInternalQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = sub_18F1E0CF0;
  block[3] = &unk_1E2955938;
  block[4] = self;
  dispatch_async(fInternalQueue, block);
}

- (void)_startPedometerUpdatesFromDate:(id)a3 withHandler:(id)a4
{
  NSObject *fInternalQueue;
  _QWORD block[7];

  fInternalQueue = self->fInternalQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = sub_18F209384;
  block[3] = &unk_1E2955C70;
  block[5] = a3;
  block[6] = a4;
  block[4] = self;
  dispatch_async(fInternalQueue, block);
}

- (void)_queryPedometerDataFromDate:(id)a3 toDate:(id)a4 withHandler:(id)a5
{
  NSObject *fInternalQueue;
  _QWORD v6[8];

  fInternalQueue = self->fInternalQueue;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = sub_18F422F8C;
  v6[3] = &unk_1E2956778;
  v6[4] = self;
  v6[5] = a3;
  v6[6] = a4;
  v6[7] = a5;
  dispatch_async(fInternalQueue, v6);
}

- (void)_startPedometerUpdatesSinceDataRecord:(id)a3 withHandler:(id)a4
{
  uint64_t v4;
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  const char *v14;

  if ((objc_msgSend_isStepCountingAvailable(CMPedometer, a2, (uint64_t)a3, (uint64_t)a4, v4) & 1) == 0)
  {
    v13 = (void *)objc_msgSend_currentHandler(MEMORY[0x1E0CB3488], v9, v10, v11, v12);
    objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_(v13, v14, (uint64_t)a2, (uint64_t)self, (uint64_t)CFSTR("CMPedometer.mm"), 408, CFSTR("Step Counting not available on this platform."));
  }
  objc_msgSend__queryPedometerDataSinceDataRecord_withHandler_shouldStartUpdates_(self, v9, (uint64_t)a3, (uint64_t)a4, 1);
}

- (void)_subscribeToCumulativePedometerUpdates:(id)a3
{
  const char *v5;
  unint64_t *p_shared_owners;
  unint64_t v7;
  unint64_t *v8;
  unint64_t v9;
  std::__shared_weak_count *v10;
  unint64_t *v11;
  unint64_t v12;
  std::__shared_weak_count *v13;
  uint64_t v14;
  uint64_t v15;
  std::__shared_weak_count *v16;
  const __CFString *v17;
  _QWORD v18[2];

  v18[1] = *MEMORY[0x1E0C80C00];

  self->fCumulativeUpdateHandler = 0;
  self->fCumulativeUpdateHandler = a3;
  v17 = CFSTR("kCLConnectionMessageSubscribeKey");
  v18[0] = MEMORY[0x1E0C9AAB0];
  v14 = objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x1E0C99D80], v5, (uint64_t)v18, (uint64_t)&v17, 1);
  sub_18F425E5C("kCLConnectionMessageStepCountUpdate", &v14, &v15);
  v13 = v16;
  if (v16)
  {
    p_shared_owners = (unint64_t *)&v16->__shared_owners_;
    do
      v7 = __ldxr(p_shared_owners);
    while (__stxr(v7 + 1, p_shared_owners));
  }
  CLConnectionClient::sendMessage();
  if (v13)
  {
    v8 = (unint64_t *)&v13->__shared_owners_;
    do
      v9 = __ldaxr(v8);
    while (__stlxr(v9 - 1, v8));
    if (!v9)
    {
      ((void (*)(std::__shared_weak_count *))v13->__on_zero_shared)(v13);
      std::__shared_weak_count::__release_weak(v13);
    }
  }
  v10 = v16;
  if (v16)
  {
    v11 = (unint64_t *)&v16->__shared_owners_;
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

- (void)_queryPedometerDataSinceDataRecord:(id)a3 withHandler:(id)a4 shouldStartUpdates:(BOOL)a5
{
  NSObject *fInternalQueue;
  _QWORD v6[7];
  BOOL v7;

  fInternalQueue = self->fInternalQueue;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = sub_18F423324;
  v6[3] = &unk_1E2957228;
  v6[4] = a3;
  v6[5] = self;
  v6[6] = a4;
  v7 = a5;
  dispatch_async(fInternalQueue, v6);
}

- (void)_handleRecordQueryResponse:(shared_ptr<CLConnectionMessage>)a3 withHandler:(id)a4 shouldStartUpdates:(BOOL)a5
{
  __shared_weak_count *var1;
  CLConnectionMessage **var0;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  const char *v14;
  uint64_t v15;
  uint64_t v16;
  NSSet *v17;
  void *DictionaryOfClasses;
  const char *v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  uint64_t v23;
  const char *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  NSObject *fAppQueue;
  _QWORD *v29;
  void *v30;
  const char *v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  const char *v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  void *v40;
  const char *v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  const char *v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t Object;
  const char *v50;
  _QWORD v51[6];
  char v52;
  _QWORD v53[7];
  char v54;
  _QWORD v55[7];
  char v56;
  _QWORD block[5];

  var1 = a3.var1;
  var0 = (CLConnectionMessage **)a3.var0;
  v9 = (void *)MEMORY[0x1E0C99E60];
  v10 = objc_opt_class();
  v11 = objc_opt_class();
  v12 = objc_opt_class();
  v13 = objc_opt_class();
  v17 = (NSSet *)objc_msgSend_setWithObjects_(v9, v14, v10, v15, v16, v11, v12, v13, 0);
  if (!*var0 || (DictionaryOfClasses = (void *)CLConnectionMessage::getDictionaryOfClasses(*var0, v17)) == 0)
  {
    fAppQueue = self->fAppQueue;
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = sub_18F423794;
    block[3] = &unk_1E2955B10;
    block[4] = var1;
    v29 = block;
    goto LABEL_6;
  }
  v22 = DictionaryOfClasses;
  v23 = objc_msgSend_objectForKeyedSubscript_(DictionaryOfClasses, v19, (uint64_t)CFSTR("CMErrorMessage"), v20, v21);
  v27 = objc_msgSend_objectForKeyedSubscript_(v22, v24, (uint64_t)CFSTR("CMPedometerDataArray"), v25, v26);
  if (v23)
  {
    fAppQueue = self->fAppQueue;
    v55[0] = MEMORY[0x1E0C809B0];
    v55[1] = 3221225472;
    v55[2] = sub_18F4237E0;
    v55[3] = &unk_1E29575D0;
    v55[5] = self;
    v55[6] = var1;
    v56 = (char)a4;
    v55[4] = v23;
    v29 = v55;
LABEL_6:
    dispatch_async(fAppQueue, v29);
    return;
  }
  v30 = (void *)v27;
  fAppQueue = self->fAppQueue;
  if (!v30)
  {
    v51[0] = MEMORY[0x1E0C809B0];
    v51[1] = 3221225472;
    v51[2] = sub_18F4238D4;
    v51[3] = &unk_1E29575F8;
    v52 = (char)a4;
    v51[4] = self;
    v51[5] = var1;
    v29 = v51;
    goto LABEL_6;
  }
  v53[0] = MEMORY[0x1E0C809B0];
  v53[1] = 3221225472;
  v53[2] = sub_18F423868;
  v53[3] = &unk_1E29575D0;
  v53[5] = self;
  v53[6] = var1;
  v54 = (char)a4;
  v53[4] = v30;
  dispatch_async(fAppQueue, v53);
  v35 = objc_msgSend_count(v30, v31, v32, v33, v34);
  v40 = (void *)objc_msgSend_maxPedometerEntries(CMPedometerData, v36, v37, v38, v39);
  if (v35 == objc_msgSend_unsignedIntegerValue(v40, v41, v42, v43, v44))
  {
    Object = objc_msgSend_lastObject(v30, v45, v46, v47, v48);
    objc_msgSend__queryPedometerDataSinceDataRecord_withHandler_shouldStartUpdates_(self, v50, Object, (uint64_t)var1, (uint64_t)a4);
  }
}

- (void)_startPedometerEventUpdatesWithHandler:(id)a3
{
  NSObject *fInternalQueue;
  _QWORD v4[6];

  fInternalQueue = self->fInternalQueue;
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = sub_18F423998;
  v4[3] = &unk_1E2955B38;
  v4[4] = self;
  v4[5] = a3;
  dispatch_async(fInternalQueue, v4);
}

- (void)_stopPedometerEventUpdates
{
  NSObject *fInternalQueue;
  _QWORD block[5];

  fInternalQueue = self->fInternalQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = sub_18F423B74;
  block[3] = &unk_1E2955938;
  block[4] = self;
  dispatch_async(fInternalQueue, block);
}

- (id)_strideCalibrationDump
{
  const char *v2;
  uint64_t v3;
  uint64_t v4;
  unint64_t *p_shared_owners;
  unint64_t v6;
  std::__shared_weak_count *v7;
  unint64_t *v8;
  unint64_t v9;
  const std::string *v10;
  CLConnectionMessage *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  const char *v16;
  uint64_t v17;
  uint64_t v18;
  NSSet *v19;
  id v20;
  NSObject *v21;
  std::__shared_weak_count *v22;
  unint64_t *v23;
  unint64_t v24;
  std::__shared_weak_count *v25;
  unint64_t *v26;
  unint64_t v27;
  char *v29;
  uint64_t v30;
  std::__shared_weak_count *v31;
  CLConnectionMessage *v32;
  std::__shared_weak_count *v33;
  uint64_t v34;
  std::__shared_weak_count *v35;
  uint8_t buf[1640];
  uint64_t v37;

  v37 = *MEMORY[0x1E0C80C00];
  sub_18F3514A0("kCLConnectionMessageStrideCalibrationDump", &v34);
  v30 = v34;
  v31 = v35;
  if (v35)
  {
    p_shared_owners = (unint64_t *)&v35->__shared_owners_;
    do
      v6 = __ldxr(p_shared_owners);
    while (__stxr(v6 + 1, p_shared_owners));
  }
  objc_msgSend_sendMessageSync_(CMMotionUtils, v2, (uint64_t)&v30, v3, v4);
  v7 = v31;
  if (v31)
  {
    v8 = (unint64_t *)&v31->__shared_owners_;
    do
      v9 = __ldaxr(v8);
    while (__stlxr(v9 - 1, v8));
    if (!v9)
    {
      ((void (*)(std::__shared_weak_count *))v7->__on_zero_shared)(v7);
      std::__shared_weak_count::__release_weak(v7);
    }
  }
  if (!v32
    || (v10 = (const std::string *)CLConnectionMessage::name(v32),
        !std::string::compare(v10, "kCLConnectionMessageError")))
  {
    if (qword_1EE16D478 != -1)
      dispatch_once(&qword_1EE16D478, &unk_1E2943B30);
    v21 = qword_1EE16D470;
    if (os_log_type_enabled((os_log_t)qword_1EE16D470, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_18F1DC000, v21, OS_LOG_TYPE_ERROR, "Error occurred while trying to write stride calibration data to file!", buf, 2u);
    }
    if (sub_18F1FCA08(115, 0))
    {
      bzero(buf, 0x65CuLL);
      if (qword_1EE16D478 != -1)
        dispatch_once(&qword_1EE16D478, &unk_1E2943B30);
      v29 = (char *)_os_log_send_and_compose_impl();
      sub_18F419700("Generic", 1, 0, 0, "-[CMPedometerProxy _strideCalibrationDump]", "CoreLocation: %s\n", v29);
      if (v29 != (char *)buf)
        free(v29);
    }
    v20 = 0;
  }
  else
  {
    v11 = v32;
    v12 = (void *)MEMORY[0x1E0C99E60];
    v13 = objc_opt_class();
    v14 = objc_opt_class();
    v15 = objc_opt_class();
    v19 = (NSSet *)objc_msgSend_setWithObjects_(v12, v16, v13, v17, v18, v14, v15, 0);
    v20 = (id)CLConnectionMessage::getObjectOfClasses(v11, v19);
  }
  v22 = v33;
  if (v33)
  {
    v23 = (unint64_t *)&v33->__shared_owners_;
    do
      v24 = __ldaxr(v23);
    while (__stlxr(v24 - 1, v23));
    if (!v24)
    {
      ((void (*)(std::__shared_weak_count *))v22->__on_zero_shared)(v22);
      std::__shared_weak_count::__release_weak(v22);
    }
  }
  v25 = v35;
  if (v35)
  {
    v26 = (unint64_t *)&v35->__shared_owners_;
    do
      v27 = __ldaxr(v26);
    while (__stlxr(v27 - 1, v26));
    if (!v27)
    {
      ((void (*)(std::__shared_weak_count *))v25->__on_zero_shared)(v25);
      std::__shared_weak_count::__release_weak(v25);
    }
  }
  return v20;
}

- (void)_queryPedometerCalibrationBinsWithHandler:(id)a3 forType:(int64_t)a4 forRemote:(BOOL)a5
{
  _BOOL8 v5;
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  const char *v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  const char *v19;
  uint64_t v20;
  uint64_t v21;
  const char *v22;
  uint64_t v23;
  unint64_t *p_shared_owners;
  unint64_t v25;
  std::__shared_weak_count *v26;
  unint64_t *v27;
  unint64_t v28;
  std::__shared_weak_count *v29;
  unint64_t *v30;
  unint64_t v31;
  NSObject *v32;
  NSObject *fAppQueue;
  char *v34;
  _QWORD v35[6];
  uint64_t v36;
  std::__shared_weak_count *v37;
  uint64_t v38;
  _QWORD block[5];
  _QWORD v40[2];
  _QWORD v41[2];
  uint8_t buf[8];
  std::__shared_weak_count *v43;
  uint64_t v44;

  v5 = a5;
  v44 = *MEMORY[0x1E0C80C00];
  if (a5 && (sub_18F1F77DC(), !sub_18F375A50()))
  {
    if (qword_1EE16D478 != -1)
      dispatch_once(&qword_1EE16D478, &unk_1E2943B30);
    v32 = qword_1EE16D470;
    if (os_log_type_enabled((os_log_t)qword_1EE16D470, OS_LOG_TYPE_FAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_18F1DC000, v32, OS_LOG_TYPE_FAULT, "Remote calibrations not available on this platform", buf, 2u);
    }
    if (sub_18F1FCA08(115, 0))
    {
      bzero(buf, 0x65CuLL);
      if (qword_1EE16D478 != -1)
        dispatch_once(&qword_1EE16D478, &unk_1E2943B30);
      LOWORD(v38) = 0;
      v34 = (char *)_os_log_send_and_compose_impl();
      sub_18F419700("Generic", 1, 0, 0, "-[CMPedometerProxy _queryPedometerCalibrationBinsWithHandler:forType:forRemote:]", "CoreLocation: %s\n", v34);
      if (v34 != (char *)buf)
        free(v34);
    }
    fAppQueue = self->fAppQueue;
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = sub_18F4243F8;
    block[3] = &unk_1E2955B10;
    block[4] = a3;
    dispatch_async(fAppQueue, block);
  }
  else
  {
    v40[0] = CFSTR("CMPedometerFetchRemoteCalibrations");
    v41[0] = objc_msgSend_numberWithBool_(MEMORY[0x1E0CB37E8], a2, v5, a4, a5);
    v40[1] = CFSTR("CMPedometerCalibrationTypeId");
    v41[1] = objc_msgSend_numberWithInteger_(MEMORY[0x1E0CB37E8], v9, a4, v10, v11);
    v38 = objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x1E0C99D80], v12, (uint64_t)v41, (uint64_t)v40, 2);
    sub_18F3ED90C("kCLConnectionMessagePedometerCalibrationQuery", &v38, buf);
    v13 = (void *)MEMORY[0x1E0C99E60];
    v14 = objc_opt_class();
    v15 = objc_opt_class();
    v16 = objc_opt_class();
    v17 = objc_opt_class();
    v18 = objc_opt_class();
    v23 = objc_msgSend_setWithObjects_(v13, v19, v14, v20, v21, v15, v16, v17, v18, 0);
    v36 = *(_QWORD *)buf;
    v37 = v43;
    if (v43)
    {
      p_shared_owners = (unint64_t *)&v43->__shared_owners_;
      do
        v25 = __ldxr(p_shared_owners);
      while (__stxr(v25 + 1, p_shared_owners));
    }
    v35[0] = MEMORY[0x1E0C809B0];
    v35[1] = 3221225472;
    v35[2] = sub_18F424448;
    v35[3] = &unk_1E29568D0;
    v35[4] = self;
    v35[5] = a3;
    objc_msgSend_sendMessage_withReplyClasses_callback_(CMMotionUtils, v22, (uint64_t)&v36, v23, (uint64_t)v35);
    v26 = v37;
    if (v37)
    {
      v27 = (unint64_t *)&v37->__shared_owners_;
      do
        v28 = __ldaxr(v27);
      while (__stlxr(v28 - 1, v27));
      if (!v28)
      {
        ((void (*)(std::__shared_weak_count *))v26->__on_zero_shared)(v26);
        std::__shared_weak_count::__release_weak(v26);
      }
    }
    v29 = v43;
    if (v43)
    {
      v30 = (unint64_t *)&v43->__shared_owners_;
      do
        v31 = __ldaxr(v30);
      while (__stlxr(v31 - 1, v30));
      if (!v31)
      {
        ((void (*)(std::__shared_weak_count *))v29->__on_zero_shared)(v29);
        std::__shared_weak_count::__release_weak(v29);
      }
    }
  }
}

@end
