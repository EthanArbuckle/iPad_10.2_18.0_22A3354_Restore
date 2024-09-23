@implementation CMStepCounterProxy

- (CMStepCounterProxy)init
{
  id v2;
  uint64_t v3;
  void *__p[2];
  char v6;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)CMStepCounterProxy;
  v2 = -[CMStepCounterProxy init](&v7, sel_init);
  if (v2)
  {
    *((_QWORD *)v2 + 3) = dispatch_queue_create("CMStepCounterQueue", 0);
    v3 = operator new();
    sub_18F270374(__p, "com.apple.locationd.registration");
    MEMORY[0x19400100C](v3, __p, *((_QWORD *)v2 + 3));
    *((_QWORD *)v2 + 1) = v3;
    if (v6 < 0)
      operator delete(__p[0]);
    *((_BYTE *)v2 + 16) = 0;
    *((_QWORD *)v2 + 4) = 0;
    *((_QWORD *)v2 + 5) = 0;
    CLConnectionClient::setDefaultMessageHandler();
    CLConnectionClient::start(*((CLConnectionClient **)v2 + 1));
  }
  return (CMStepCounterProxy *)v2;
}

- (void)dealloc
{
  objc_super v3;

  dispatch_release((dispatch_object_t)self->fInternalQueue);
  v3.receiver = self;
  v3.super_class = (Class)CMStepCounterProxy;
  -[CMStepCounterProxy dealloc](&v3, sel_dealloc);
}

- (void)_teardown
{
  void *fLocationdConnection;

  fLocationdConnection = self->fLocationdConnection;
  if (fLocationdConnection)
  {
    MEMORY[0x194001018](fLocationdConnection, a2);
    JUMPOUT(0x194001438);
  }
}

- (void)_queryStepCountStartingFromInternal:(id)a3 to:(id)a4 toQueue:(id)a5 withHandler:(id)a6
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

- (void)_startStepCountingUpdatesToQueue:(id)a3 updateOn:(int64_t)a4 withHandler:(id)a5
{
  const char *v9;
  unint64_t *p_shared_owners;
  unint64_t v11;
  unint64_t *v12;
  unint64_t v13;
  std::__shared_weak_count *v14;
  unint64_t *v15;
  unint64_t v16;
  std::__shared_weak_count *v17;
  _QWORD v18[9];
  void *__p;
  std::__shared_weak_count *v20;
  char v21;
  const __CFString *v22;
  _QWORD v23[2];

  v23[1] = *MEMORY[0x1E0C80C00];
  self->fStepCountFromStart = -1;
  self->fPrevStepCount = -1;
  sub_18F270374(&__p, "kCLConnectionMessageStepCountUpdate");
  v18[1] = MEMORY[0x1E0C809B0];
  v18[2] = 3221225472;
  v18[3] = sub_18F4B0AE0;
  v18[4] = &unk_1E2958FA8;
  v18[5] = self;
  v18[6] = a3;
  v18[7] = a5;
  v18[8] = a4;
  CLConnectionClient::setHandlerForMessage();
  if (v21 < 0)
    operator delete(__p);
  v22 = CFSTR("kCLConnectionMessageSubscribeKey");
  v23[0] = MEMORY[0x1E0C9AAB0];
  v18[0] = objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x1E0C99D80], v9, (uint64_t)v23, (uint64_t)&v22, 1);
  sub_18F425E5C("kCLConnectionMessageStepCountUpdate", v18, &__p);
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
  self->fStartedUpdates = 1;
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

- (void)_handleQueryResponse:(shared_ptr<CLConnectionMessage>)a3 onQueue:(id)a4 withHandler:(id)a5
{
  __shared_weak_count *var1;
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
  void *v25;
  const char *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  void *v30;
  const char *v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  const char *v36;
  uint64_t v37;
  uint64_t v38;
  NSObject *v39;
  const char *v40;
  uint64_t v41;
  uint64_t v42;
  NSObject *v43;
  char *v44;
  char *v45;
  _QWORD v46[5];
  _QWORD v47[6];
  _QWORD v48[6];
  int v49;
  void *v50;
  uint8_t buf[4];
  void *v52;
  uint64_t v53;

  var1 = a3.var1;
  var0 = (CLConnectionMessage **)a3.var0;
  v53 = *MEMORY[0x1E0C80C00];
  v8 = (void *)MEMORY[0x1E0C99E60];
  v9 = objc_opt_class();
  v10 = objc_opt_class();
  v11 = objc_opt_class();
  v15 = (NSSet *)objc_msgSend_setWithObjects_(v8, v12, v9, v13, v14, v10, v11, 0);
  if (*var0 && (DictionaryOfClasses = (void *)CLConnectionMessage::getDictionaryOfClasses(*var0, v15)) != 0)
  {
    v20 = DictionaryOfClasses;
    v21 = objc_msgSend_objectForKeyedSubscript_(DictionaryOfClasses, v17, (uint64_t)CFSTR("CMErrorMessage"), v18, v19);
    v25 = (void *)objc_msgSend_objectForKeyedSubscript_(v20, v22, (uint64_t)CFSTR("CMPedometerDataObject"), v23, v24);
    v30 = (void *)objc_msgSend_numberOfSteps(v25, v26, v27, v28, v29);
    v35 = objc_msgSend_integerValue(v30, v31, v32, v33, v34);
    if (v21)
    {
      v48[0] = MEMORY[0x1E0C809B0];
      v48[1] = 3221225472;
      v48[2] = sub_18F4B13E0;
      v48[3] = &unk_1E2955B60;
      v48[4] = v21;
      v48[5] = a4;
      objc_msgSend_addOperationWithBlock_(var1, v36, (uint64_t)v48, v37, v38);
    }
    else if (v25)
    {
      v47[0] = MEMORY[0x1E0C809B0];
      v47[1] = 3221225472;
      v47[2] = sub_18F4B1440;
      v47[3] = &unk_1E2955AA8;
      v47[4] = a4;
      v47[5] = v35;
      objc_msgSend_addOperationWithBlock_(var1, v36, (uint64_t)v47, v37, v38);
    }
    else
    {
      if (qword_1EE16D478 != -1)
        dispatch_once(&qword_1EE16D478, &unk_1E2959018);
      v43 = qword_1EE16D470;
      if (os_log_type_enabled((os_log_t)qword_1EE16D470, OS_LOG_TYPE_FAULT))
      {
        *(_DWORD *)buf = 138543362;
        v52 = v20;
        _os_log_impl(&dword_18F1DC000, v43, OS_LOG_TYPE_FAULT, "Unable to parse mesage (%{public}@) for query response", buf, 0xCu);
      }
      if (sub_18F1FCA08(115, 0))
      {
        bzero(buf, 0x65CuLL);
        if (qword_1EE16D478 != -1)
          dispatch_once(&qword_1EE16D478, &unk_1E2959018);
        v49 = 138543362;
        v50 = v20;
        v44 = (char *)_os_log_send_and_compose_impl();
        sub_18F419700("Generic", 1, 0, 0, "-[CMStepCounterProxy _handleQueryResponse:onQueue:withHandler:]", "CoreLocation: %s\n", v44);
        if (v44 != (char *)buf)
          free(v44);
      }
    }
  }
  else
  {
    if (qword_1EE16D478 != -1)
      dispatch_once(&qword_1EE16D478, &unk_1E2959018);
    v39 = qword_1EE16D470;
    if (os_log_type_enabled((os_log_t)qword_1EE16D470, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_18F1DC000, v39, OS_LOG_TYPE_ERROR, "Unable to parse message when checking for availability!", buf, 2u);
    }
    if (sub_18F1FCA08(115, 0))
    {
      bzero(buf, 0x65CuLL);
      if (qword_1EE16D478 != -1)
        dispatch_once(&qword_1EE16D478, &unk_1E2959018);
      LOWORD(v49) = 0;
      v45 = (char *)_os_log_send_and_compose_impl();
      sub_18F419700("Generic", 1, 0, 0, "-[CMStepCounterProxy _handleQueryResponse:onQueue:withHandler:]", "CoreLocation: %s\n", v45);
      if (v45 != (char *)buf)
        free(v45);
    }
    v46[0] = MEMORY[0x1E0C809B0];
    v46[1] = 3221225472;
    v46[2] = sub_18F4B1454;
    v46[3] = &unk_1E2955B10;
    v46[4] = a4;
    objc_msgSend_addOperationWithBlock_(var1, v40, (uint64_t)v46, v41, v42);
  }
}

@end
