@implementation CMAltimeterInternal

- (void)_stopRelativeAltitudeUpdates
{
  NSObject *value;
  _QWORD block[5];

  value = self->fPressureSamples.__size_.__value_;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = sub_18F206E04;
  block[3] = &unk_1E2955938;
  block[4] = self;
  dispatch_async(value, block);
}

- (void)_startRelativeAltitudeUpdates
{
  NSObject *value;
  _QWORD block[5];

  if ((sub_18F1F7BFC() & 0x1000000000) != 0)
  {
    value = self->fPressureSamples.__size_.__value_;
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = sub_18F4C6ED8;
    block[3] = &unk_1E2955938;
    block[4] = self;
    dispatch_async(value, block);
  }
}

- (CMAltimeterInternal)init
{
  CMAltimeterInternal *v2;
  CMAltimeterInternal *v3;
  uint64_t v4;
  void *__p[2];
  char v12;
  void *v13[2];
  char v14;
  objc_super v15;

  v15.receiver = self;
  v15.super_class = (Class)CMAltimeterInternal;
  v2 = -[CMAltimeterInternal init](&v15, sel_init);
  v3 = v2;
  if (v2)
  {
    *((_BYTE *)&v2->fBaseAltimeterSample.acceleration + 12) = 0;
    v2->fRelativeAltimeterHandler = 0;
    v2->fRelativeAltimeterQueue = 0;
    v2->fFilteredPressureDispatcher = 0;
    v2->fPressureSamples.__size_.__value_ = (unint64_t)dispatch_queue_create("com.apple.CoreMotion.CMAltimeterInternalQueue", 0);
    v3->fInternalQueue = (OS_dispatch_queue *)dispatch_queue_create("com.apple.CoreMotion.CMAltimeterAppQueue", 0);
    v4 = operator new();
    sub_18F270374(v13, "com.apple.locationd.registration");
    MEMORY[0x19400100C](v4, v13, v3->fPressureSamples.__size_.__value_);
    v3->fAppQueue = (OS_dispatch_queue *)v4;
    if (v14 < 0)
      operator delete(v13[0]);
    __asm { FMOV            V0.2D, #-1.0 }
    *(_OWORD *)&v3->fSignificantElevationSampleHandler = _Q0;
    LOBYTE(v3->fElevationDescendedOffset) = 0;
    v3->fBarometricBaseAltitude = 3.4028e38;
    *(_QWORD *)&v3->fStopSignificantElevationUpdates = 0x47EFFFFFE0000000;
    LOBYTE(v3->fFilteredElevationOffset) = 1;
    sub_18F270374(__p, "kCLConnectionMessageSignificantElevationUpdate");
    CLConnectionClient::setHandlerForMessage();
    if (v12 < 0)
      operator delete(__p[0]);
    sub_18F270374(__p, "kCLConnectionMessageFilteredElevationUpdate");
    CLConnectionClient::setHandlerForMessage();
    if (v12 < 0)
      operator delete(__p[0]);
    sub_18F270374(__p, "kCLConnectionMessageAbsoluteAltitudeUpdate");
    CLConnectionClient::setHandlerForMessage();
    if (v12 < 0)
      operator delete(__p[0]);
    CLConnectionClient::start((CLConnectionClient *)v3->fAppQueue);
  }
  return v3;
}

- (void)dealloc
{
  objc_super v3;

  _Block_release(self->fLocationdConnection);
  self->fLocationdConnection = 0;
  _Block_release(self->fHandler);
  self->fHandler = 0;
  dispatch_release((dispatch_object_t)self->fPressureSamples.__size_.__value_);
  self->fPressureSamples.__size_.__value_ = 0;
  dispatch_release((dispatch_object_t)self->fInternalQueue);
  self->fInternalQueue = 0;
  v3.receiver = self;
  v3.super_class = (Class)CMAltimeterInternal;
  -[CMAltimeterInternal dealloc](&v3, sel_dealloc);
}

- (void)_teardown
{
  uint64_t v3;
  void *__p;
  char v5;

  sub_18F270374(&__p, "kCLConnectionMessageSignificantElevationUpdate");
  CLConnectionClient::setHandlerForMessage();
  if (v5 < 0)
    operator delete(__p);
  if (self->fAppQueue)
  {
    v3 = MEMORY[0x194001018]();
    MEMORY[0x194001438](v3, 0xB0C40BC2CC919);
  }
  self->fAppQueue = 0;
}

- (void)_startElevationUpdatesWithHandler:(id)a3
{
  NSObject *value;
  _QWORD v4[6];

  value = self->fPressureSamples.__size_.__value_;
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = sub_18F4C5448;
  v4[3] = &unk_1E2955B38;
  v4[4] = self;
  v4[5] = a3;
  dispatch_async(value, v4);
}

- (void)_stopElevationUpdates
{
  NSObject *value;
  _QWORD block[5];

  value = self->fPressureSamples.__size_.__value_;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = sub_18F4C5634;
  block[3] = &unk_1E2955938;
  block[4] = self;
  dispatch_async(value, block);
}

- (void)_startSignificantElevationUpdatesWithHandler:(id)a3
{
  NSObject *value;
  _QWORD v4[6];

  value = self->fPressureSamples.__size_.__value_;
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = sub_18F4C5820;
  v4[3] = &unk_1E2955B38;
  v4[4] = self;
  v4[5] = a3;
  dispatch_async(value, v4);
}

- (void)_stopSignificantElevationUpdates
{
  NSObject *value;
  _QWORD block[5];

  value = self->fPressureSamples.__size_.__value_;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = sub_18F4C5A0C;
  block[3] = &unk_1E2955938;
  block[4] = self;
  dispatch_async(value, block);
}

- (void)_querySignificantElevationChangeFromDate:(id)a3 toDate:(id)a4 withHandler:(id)a5
{
  NSObject *value;
  _QWORD v6[8];

  value = self->fPressureSamples.__size_.__value_;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = sub_18F4C5BE8;
  v6[3] = &unk_1E2956778;
  v6[4] = self;
  v6[5] = a3;
  v6[6] = a4;
  v6[7] = a5;
  dispatch_async(value, v6);
}

- (void)_queryElevationProfileFromDate:(id)a3 toDate:(id)a4 withBatchSize:(unint64_t)a5 fromRecordId:(int)a6 withHandler:(id)a7
{
  NSObject *value;
  _QWORD v8[9];
  int v9;

  value = self->fPressureSamples.__size_.__value_;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = sub_18F4C63F4;
  v8[3] = &unk_1E2959408;
  v8[4] = a3;
  v8[5] = a4;
  v8[7] = a7;
  v8[8] = a5;
  v9 = a6;
  v8[6] = self;
  dispatch_async(value, v8);
}

- (void)_queryElevationProfileFromDate:(id)a3 toDate:(id)a4 withBatchSize:(unint64_t)a5 withHandler:(id)a6
{
  NSObject *value;
  _QWORD block[9];

  value = self->fPressureSamples.__size_.__value_;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = sub_18F4C6C38;
  block[3] = &unk_1E2959430;
  block[4] = self;
  block[5] = a3;
  block[7] = a6;
  block[8] = a5;
  block[6] = a4;
  dispatch_async(value, block);
}

+ (BOOL)_bundleBeforeTCCCheck
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  const char *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;

  v5 = (void *)objc_msgSend_mainBundle(MEMORY[0x1E0CB34D0], a2, v2, v3, v4);
  v10 = (void *)objc_msgSend_infoDictionary(v5, v6, v7, v8, v9);
  v14 = objc_msgSend_objectForKeyedSubscript_(v10, v11, (uint64_t)CFSTR("DTPlatformVersion"), v12, v13);
  return MEMORY[0x1E0DE7D20](CMAltimeterInternal, sel__bundleBeforeTCCCheck_, v14, v15, v16);
}

+ (BOOL)_bundleBeforeTCCCheck:(id)a3
{
  NSObject *v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  const char *v9;
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
  void *v20;
  const char *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  const char *v25;
  uint64_t v26;
  uint64_t v27;
  void *v29;
  const char *v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  const char *v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  const char *v38;
  uint64_t v39;
  uint64_t v40;
  void *v41;
  const char *v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  const char *v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  char *v50;
  uint8_t buf[4];
  uint64_t v52;
  uint64_t v53;

  v53 = *MEMORY[0x1E0C80C00];
  if (!a3)
    return 1;
  if (qword_1EE16D488[0] != -1)
    dispatch_once(qword_1EE16D488, &unk_1E2959470);
  v4 = qword_1EE16D480;
  if (os_log_type_enabled((os_log_t)qword_1EE16D480, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 136315138;
    v52 = objc_msgSend_UTF8String(a3, v5, v6, v7, v8);
    _os_log_impl(&dword_18F1DC000, v4, OS_LOG_TYPE_DEBUG, "app sdk version, %s", buf, 0xCu);
  }
  if (sub_18F1FCA08(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_1EE16D488[0] != -1)
      dispatch_once(qword_1EE16D488, &unk_1E2959470);
    objc_msgSend_UTF8String(a3, v46, v47, v48, v49);
    v50 = (char *)_os_log_send_and_compose_impl();
    sub_18F419700("Generic", 1, 0, 2, "+[CMAltimeterInternal _bundleBeforeTCCCheck:]", "CoreLocation: %s\n", v50);
    if (v50 != (char *)buf)
      free(v50);
  }
  v12 = (void *)objc_msgSend_componentsSeparatedByString_(a3, v9, (uint64_t)CFSTR("."), v10, v11);
  if (!objc_msgSend_count(v12, v13, v14, v15, v16))
    return 1;
  v20 = (void *)objc_msgSend_objectAtIndexedSubscript_(v12, v17, 0, v18, v19);
  if ((int)objc_msgSend_intValue(v20, v21, v22, v23, v24) < 17)
    return 1;
  v29 = (void *)objc_msgSend_objectAtIndexedSubscript_(v12, v25, 0, v26, v27);
  if ((int)objc_msgSend_intValue(v29, v30, v31, v32, v33) > 17)
    return 0;
  if ((unint64_t)objc_msgSend_count(v12, v34, v35, v36, v37) < 2)
    return 1;
  v41 = (void *)objc_msgSend_objectAtIndexedSubscript_(v12, v38, 1, v39, v40);
  return (int)objc_msgSend_intValue(v41, v42, v43, v44, v45) < 5;
}

- (void)_releaseHandlerObjects
{

  *(_QWORD *)&self->fStopRelativeAltitudeUpdates = 0;
  _Block_release(self->fAbsoluteAltitudeClientQueue);
  self->fAbsoluteAltitudeClientQueue = 0;
}

- (void)_startAbsoluteAltitudeUpdatesToQueue:(id)a3 withHandler:(id)a4
{
  uint64_t v4;
  _QWORD v5[7];

  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = sub_18F4C70D8;
  v5[3] = &unk_1E2955C70;
  v5[5] = self;
  v5[6] = a4;
  v5[4] = a3;
  objc_msgSend_tccServiceMotionAccessWithBlock_(CMMotionUtils, a2, (uint64_t)v5, (uint64_t)a4, v4);
}

- (void)_stopAbsoluteAltitudeUpdates
{
  uint64_t v2;
  uint64_t v3;
  _QWORD v4[5];

  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = sub_18F4C7330;
  v4[3] = &unk_1E2955938;
  v4[4] = self;
  objc_msgSend_tccServiceMotionAccessWithBlock_(CMMotionUtils, a2, (uint64_t)v4, v2, v3);
}

- (void)_handleAbsoluteAltitudeUpdate:(shared_ptr<CLConnectionMessage>)a3
{
  CLConnectionMessage **var0;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  NSSet *v12;
  void *DictionaryOfClasses;
  const char *v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  uint64_t v18;
  const char *v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  NSObject *v23;
  const char *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  const char *v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  char *v32;
  NSObject *v33;
  NSObject *v34;
  id v35;
  NSObject *value;
  NSObject *v37;
  _QWORD block[6];
  int v39;
  int v40;
  uint8_t buf[4];
  int v42;
  uint64_t v43;

  v43 = *MEMORY[0x1E0C80C00];
  if (!*(_QWORD *)a3.var0)
  {
    if (qword_1EE16D6C8 != -1)
      dispatch_once(&qword_1EE16D6C8, &unk_1E2959450);
    v33 = qword_1EE16D6C0;
    if (os_log_type_enabled((os_log_t)qword_1EE16D6C0, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_18F1DC000, v33, OS_LOG_TYPE_ERROR, "Error; NULL message received in AbsoluteAltimeter update",
        buf,
        2u);
    }
    if (!sub_18F1FCA08(115, 0))
      return;
    bzero(buf, 0x65CuLL);
    if (qword_1EE16D6C8 != -1)
      dispatch_once(&qword_1EE16D6C8, &unk_1E2959450);
    LOWORD(v39) = 0;
LABEL_29:
    v32 = (char *)_os_log_send_and_compose_impl();
    sub_18F419700("Generic", 1, 0, 0, "-[CMAltimeterInternal _handleAbsoluteAltitudeUpdate:]", "CoreLocation: %s\n", v32);
    if (v32 == (char *)buf)
      return;
    goto LABEL_30;
  }
  var0 = (CLConnectionMessage **)a3.var0;
  v5 = (void *)MEMORY[0x1E0C99E60];
  v6 = objc_opt_class();
  v7 = objc_opt_class();
  v8 = objc_opt_class();
  v12 = (NSSet *)objc_msgSend_setWithObjects_(v5, v9, v6, v10, v11, v7, v8, 0);
  DictionaryOfClasses = (void *)CLConnectionMessage::getDictionaryOfClasses(*var0, v12);
  if (!DictionaryOfClasses)
  {
    if (qword_1EE16D6C8 != -1)
      dispatch_once(&qword_1EE16D6C8, &unk_1E2959450);
    v34 = qword_1EE16D6C0;
    if (os_log_type_enabled((os_log_t)qword_1EE16D6C0, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_18F1DC000, v34, OS_LOG_TYPE_ERROR, "Error; NULL dictionary received in AbsoluteAltimeter update",
        buf,
        2u);
    }
    if (!sub_18F1FCA08(115, 0))
      return;
    bzero(buf, 0x65CuLL);
    if (qword_1EE16D6C8 != -1)
      dispatch_once(&qword_1EE16D6C8, &unk_1E2959450);
    LOWORD(v39) = 0;
    goto LABEL_29;
  }
  v17 = DictionaryOfClasses;
  v18 = objc_msgSend_objectForKeyedSubscript_(DictionaryOfClasses, v14, (uint64_t)CFSTR("CMErrorMessage"), v15, v16);
  if (v18)
  {
    v22 = (void *)v18;
    if (qword_1EE16D6C8 != -1)
      dispatch_once(&qword_1EE16D6C8, &unk_1E2959450);
    v23 = qword_1EE16D6C0;
    if (os_log_type_enabled((os_log_t)qword_1EE16D6C0, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 67109120;
      v42 = objc_msgSend_intValue(v22, v24, v25, v26, v27);
      _os_log_impl(&dword_18F1DC000, v23, OS_LOG_TYPE_ERROR, "Error %d received in AbsoluteAltimeter update", buf, 8u);
    }
    if (!sub_18F1FCA08(115, 0))
      return;
    bzero(buf, 0x65CuLL);
    if (qword_1EE16D6C8 != -1)
      dispatch_once(&qword_1EE16D6C8, &unk_1E2959450);
    v39 = 67109120;
    v40 = objc_msgSend_intValue(v22, v28, v29, v30, v31);
    v32 = (char *)_os_log_send_and_compose_impl();
    sub_18F419700("Generic", 1, 0, 0, "-[CMAltimeterInternal _handleAbsoluteAltitudeUpdate:]", "CoreLocation: %s\n", v32);
    if (v32 == (char *)buf)
      return;
LABEL_30:
    free(v32);
    return;
  }
  v35 = (id)objc_msgSend_objectForKeyedSubscript_(v17, v19, (uint64_t)CFSTR("CMAbsoluteAltitudeKey"), v20, v21);
  if (v35)
  {
    value = self->fPressureSamples.__size_.__value_;
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = sub_18F4C7A70;
    block[3] = &unk_1E29559D0;
    block[4] = self;
    block[5] = v35;
    dispatch_async(value, block);
    return;
  }
  if (qword_1EE16D6C8 != -1)
    dispatch_once(&qword_1EE16D6C8, &unk_1E2959450);
  v37 = qword_1EE16D6C0;
  if (os_log_type_enabled((os_log_t)qword_1EE16D6C0, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_18F1DC000, v37, OS_LOG_TYPE_ERROR, "Error; NULL data received in AbsoluteAltimeter update",
      buf,
      2u);
  }
  if (sub_18F1FCA08(115, 0))
  {
    bzero(buf, 0x65CuLL);
    if (qword_1EE16D6C8 != -1)
      dispatch_once(&qword_1EE16D6C8, &unk_1E2959450);
    LOWORD(v39) = 0;
    goto LABEL_29;
  }
}

- (void).cxx_destruct
{
  sub_18F3CBA50(&self->fMostRecentFilteredPressure);
}

- (id).cxx_construct
{
  *((_OWORD *)self + 5) = 0u;
  *((_OWORD *)self + 6) = 0u;
  *((_OWORD *)self + 4) = 0u;
  return self;
}

@end
