@implementation CMAltimeter

- (void)stopRelativeAltitudeUpdatesPrivate
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  id internal;
  void **v6;
  uint64_t v7;
  unint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  void *v16;
  _QWORD v17[6];
  int v18;

  internal = self->_internal;
  if (!objc_msgSend_isRelativeAltitudeAvailable(CMAltimeter, a2, v2, v3, v4))
    return;
  v6 = (void **)*((_QWORD *)internal + 9);
  v7 = *((_QWORD *)internal + 10);
  *((_QWORD *)internal + 13) = 0;
  v8 = v7 - (_QWORD)v6;
  if (v8 >= 0x11)
  {
    do
    {
      operator delete(*v6);
      v9 = *((_QWORD *)internal + 10);
      v6 = (void **)(*((_QWORD *)internal + 9) + 8);
      *((_QWORD *)internal + 9) = v6;
      v8 = v9 - (_QWORD)v6;
    }
    while (v8 > 0x10);
  }
  if (v8 >> 3 == 1)
  {
    v10 = 512;
    goto LABEL_8;
  }
  if (v8 >> 3 == 2)
  {
    v10 = 1024;
LABEL_8:
    *((_QWORD *)internal + 12) = v10;
  }
  if (*((_QWORD *)internal + 1))
  {
    if (qword_1EE16E930 != -1)
      dispatch_once(&qword_1EE16E930, &unk_1E2952DE8);
    v11 = qword_1EE16E928;
    v12 = *((_QWORD *)internal + 1);
    v13 = sub_18F204AE4();
    v17[0] = MEMORY[0x1E0C809B0];
    v17[1] = 3221225472;
    v17[2] = sub_18F1F5EE0;
    v17[3] = &unk_1E2956E98;
    v18 = 0;
    v17[4] = v11;
    v17[5] = v12;
    sub_18F1F5E28(v13, (uint64_t)v17);
    v14 = *((_QWORD *)internal + 1);
    if (v14)
      (*(void (**)(uint64_t))(*(_QWORD *)v14 + 8))(v14);
    *((_QWORD *)internal + 1) = 0;
  }
  v15 = (void *)*((_QWORD *)internal + 3);
  if (v15)
  {

    *((_QWORD *)internal + 3) = 0;
  }
  v16 = (void *)*((_QWORD *)internal + 2);
  if (v16)
  {

    *((_QWORD *)internal + 2) = 0;
  }
  *((_BYTE *)internal + 52) = 0;
}

- (void)startRelativeAltitudeUpdatesPrivateToQueue:(id)a3 withHandler:(id)a4
{
  uint64_t v4;
  uint64_t *internal;
  id v10;
  id v11;
  const char *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  _QWORD *v16;
  void *v17;
  const char *v18;
  void *v19;
  const char *v20;

  if (a3)
  {
    if (a4)
      goto LABEL_3;
  }
  else
  {
    v17 = (void *)objc_msgSend_currentHandler(MEMORY[0x1E0CB3488], a2, 0, (uint64_t)a4, v4);
    objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_(v17, v18, (uint64_t)a2, (uint64_t)self, (uint64_t)CFSTR("CMAltimeter.mm"), 923, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("queue"));
    if (a4)
      goto LABEL_3;
  }
  v19 = (void *)objc_msgSend_currentHandler(MEMORY[0x1E0CB3488], a2, (uint64_t)a3, (uint64_t)a4, v4);
  objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_(v19, v20, (uint64_t)a2, (uint64_t)self, (uint64_t)CFSTR("CMAltimeter.mm"), 924, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("handler"));
LABEL_3:
  internal = (uint64_t *)self->_internal;
  if (objc_msgSend_isRelativeAltitudeAvailable(CMAltimeter, a2, (uint64_t)a3, (uint64_t)a4, v4))
  {
    v10 = (id)internal[3];
    if (v10 != a3)
    {

      internal[3] = (uint64_t)a3;
    }
    v11 = (id)internal[2];
    if (v11 != a4)
    {

      internal[2] = objc_msgSend_copy(a4, v12, v13, v14, v15);
    }
    if (!internal[1])
    {
      v16 = (_QWORD *)operator new();
      *v16 = off_1E294C238;
      *v16 = &off_1E294C2A8;
      v16[1] = 0;
      v16[2] = sub_18F4C7B58;
      v16[3] = self;
      internal[1] = (uint64_t)v16;
      if (qword_1EE16E930 != -1)
        dispatch_once(&qword_1EE16E930, &unk_1E2952DE8);
      sub_18F1F4F0C(qword_1EE16E928, 0, internal[1], -1.0);
    }
  }
}

+ (BOOL)isRelativeAltitudeAvailable
{
  sub_18F1F77DC();
  if ((sub_18F1E19B0() & 0xFFFFFFFE) == 0x32)
    return 0;
  if (qword_1EE16E930 != -1)
    dispatch_once(&qword_1EE16E930, &unk_1E2952DE8);
  return qword_1EE16E928 != 0;
}

- (void)stopRelativeAltitudeUpdates
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
  void *v14;
  const char *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  const char *v20;
  uint64_t v21;
  uint64_t v22;
  NSObject *v23;
  char *v24;
  _QWORD v25[5];
  __int16 v26;
  uint8_t buf[1640];
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  if (objc_msgSend_isRelativeAltitudeAvailable(CMAltimeter, a2, v2, v3, v4))
  {
    if (objc_msgSend__bundleBeforeTCCCheck(CMAltimeterInternal, v6, v7, v8, v9)
      && (v14 = (void *)objc_msgSend_mainBundle(MEMORY[0x1E0CB34D0], v10, v11, v12, v13),
          v19 = (void *)objc_msgSend_infoDictionary(v14, v15, v16, v17, v18),
          !objc_msgSend_objectForKeyedSubscript_(v19, v20, (uint64_t)CFSTR("NSMotionUsageDescription"), v21, v22)))
    {
      if (qword_1EE16D488[0] != -1)
        dispatch_once(qword_1EE16D488, &unk_1E2959470);
      v23 = qword_1EE16D480;
      if (os_log_type_enabled((os_log_t)qword_1EE16D480, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_18F1DC000, v23, OS_LOG_TYPE_DEFAULT, "App does not have NSMotionUsageDescription, do not vend relative altimeter", buf, 2u);
      }
      if (sub_18F1FCA08(115, 2))
      {
        bzero(buf, 0x65CuLL);
        if (qword_1EE16D488[0] != -1)
          dispatch_once(qword_1EE16D488, &unk_1E2959470);
        v26 = 0;
        v24 = (char *)_os_log_send_and_compose_impl();
        sub_18F419700("Generic", 1, 0, 2, "-[CMAltimeter stopRelativeAltitudeUpdates]", "CoreLocation: %s\n", v24);
        if (v24 != (char *)buf)
          free(v24);
      }
    }
    else
    {
      v25[0] = MEMORY[0x1E0C809B0];
      v25[1] = 3221225472;
      v25[2] = sub_18F20983C;
      v25[3] = &unk_1E2955938;
      v25[4] = self;
      objc_msgSend_tccServiceMotionAccessWithBlock_(CMMotionUtils, v10, (uint64_t)v25, v12, v13);
    }
  }
}

- (void)startRelativeAltitudeUpdatesToQueue:(NSOperationQueue *)queue withHandler:(CMAltitudeHandler)handler
{
  uint64_t v4;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  const char *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  const char *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  const char *v22;
  uint64_t v23;
  uint64_t v24;
  NSObject *v25;
  char *v26;
  _QWORD v27[7];
  __int16 v28;
  uint8_t buf[1640];
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  if (objc_msgSend_isRelativeAltitudeAvailable(CMAltimeter, a2, (uint64_t)queue, (uint64_t)handler, v4))
  {
    if (objc_msgSend__bundleBeforeTCCCheck(CMAltimeterInternal, v8, v9, v10, v11)
      && (v16 = (void *)objc_msgSend_mainBundle(MEMORY[0x1E0CB34D0], v12, v13, v14, v15),
          v21 = (void *)objc_msgSend_infoDictionary(v16, v17, v18, v19, v20),
          !objc_msgSend_objectForKeyedSubscript_(v21, v22, (uint64_t)CFSTR("NSMotionUsageDescription"), v23, v24)))
    {
      if (qword_1EE16D488[0] != -1)
        dispatch_once(qword_1EE16D488, &unk_1E2959470);
      v25 = qword_1EE16D480;
      if (os_log_type_enabled((os_log_t)qword_1EE16D480, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_18F1DC000, v25, OS_LOG_TYPE_ERROR, "App does not have NSMotionUsageDescription, do not vend relative altimeter", buf, 2u);
      }
      if (sub_18F1FCA08(115, 0))
      {
        bzero(buf, 0x65CuLL);
        if (qword_1EE16D488[0] != -1)
          dispatch_once(qword_1EE16D488, &unk_1E2959470);
        v28 = 0;
        v26 = (char *)_os_log_send_and_compose_impl();
        sub_18F419700("Generic", 1, 0, 0, "-[CMAltimeter startRelativeAltitudeUpdatesToQueue:withHandler:]", "CoreLocation: %s\n", v26);
        if (v26 != (char *)buf)
          free(v26);
      }
    }
    else
    {
      v27[0] = MEMORY[0x1E0C809B0];
      v27[1] = 3221225472;
      v27[2] = sub_18F209490;
      v27[3] = &unk_1E2957580;
      v27[5] = queue;
      v27[6] = handler;
      v27[4] = self;
      objc_msgSend_tccServiceMotionAccessWithBlock_(CMMotionUtils, v12, (uint64_t)v27, v14, v15);
    }
  }
}

+ (void)initialize
{
  const char *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  const char *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  const char *v16;
  CFRunLoopRef Main;

  if ((id)objc_opt_class() == a1)
  {
    v7 = (void *)objc_msgSend_currentThread(MEMORY[0x1E0CB3978], v3, v4, v5, v6);
    if (objc_msgSend_isMainThread(v7, v8, v9, v10, v11)
      && (objc_msgSend_isMultiThreaded(MEMORY[0x1E0CB3978], v12, v13, v14, v15) & 1) == 0)
    {
      objc_msgSend_detachNewThreadSelector_toTarget_withObject_(MEMORY[0x1E0CB3978], v16, (uint64_t)sel_dummySelector_, (uint64_t)a1, 0);
    }
    if (!qword_1ECEDFE00)
    {
      Main = CFRunLoopGetMain();
      sub_18F1E50A4(Main);
    }
  }
}

- (CMAltimeter)init
{
  uint64_t v3;
  CMAltimeter *v4;
  _QWORD v6[6];
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  void (*v10)(uint64_t, uint64_t);
  void (*v11)(uint64_t);
  uint64_t v12;

  v7 = 0;
  v8 = &v7;
  v9 = 0x3052000000;
  v10 = sub_18F206CC8;
  v11 = sub_18F206BF8;
  v12 = 0;
  v3 = sub_18F204AE4();
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = sub_18F4C7CA8;
  v6[3] = &unk_1E2956830;
  v6[4] = self;
  v6[5] = &v7;
  sub_18F1F5E28(v3, (uint64_t)v6);
  v4 = (CMAltimeter *)v8[5];
  _Block_object_dispose(&v7, 8);
  return v4;
}

- (id)initPrivate
{
  CMAltimeter *v2;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)CMAltimeter;
  v2 = -[CMAltimeter init](&v4, sel_init);
  if (v2)
    v2->_internal = objc_alloc_init(CMAltimeterInternal);
  return v2;
}

- (void)dealloc
{
  uint64_t v3;
  objc_super v4;
  _QWORD v5[5];
  _QWORD v6[6];

  v6[0] = 0;
  v6[1] = v6;
  v6[2] = 0x3052000000;
  v6[3] = sub_18F206CC8;
  v6[4] = sub_18F206BF8;
  v6[5] = self;
  v3 = sub_18F204AE4();
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = sub_18F4C7DFC;
  v5[3] = &unk_1E2956858;
  v5[4] = v6;
  sub_18F1F5E28(v3, (uint64_t)v5);
  v4.receiver = self;
  v4.super_class = (Class)CMAltimeter;
  -[CMAltimeter dealloc](&v4, sel_dealloc);
  _Block_object_dispose(v6, 8);
}

- (void)deallocPrivate
{
  void **internal;
  void *v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;

  internal = (void **)self->_internal;
  v4 = (void *)MEMORY[0x194001B4C]();
  objc_msgSend_cancelAllOperations(internal[3], v5, v6, v7, v8);
  objc_msgSend_stopRelativeAltitudeUpdatesPrivate(self, v9, v10, v11, v12);

  objc_autoreleasePoolPop(v4);
}

+ (BOOL)isSignificantElevationAvailable
{
  BOOL result;

  sub_18F1F77DC();
  sub_18F1F77DC();
  result = 0;
  if (sub_18F20C9AC())
  {
    sub_18F1F77DC();
    if ((sub_18F1F7BFC() & 0x8000000) != 0)
      return 1;
  }
  return result;
}

+ (CMAuthorizationStatus)authorizationStatus
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  return objc_msgSend_authorizationStatus(CMMotionUtils, a2, v2, v3, v4);
}

- (void)startSignificantElevationUpdatesWithHandler:(id)a3
{
  uint64_t v3;
  uint64_t v4;
  void *v8;
  const char *v9;
  _QWORD v10[6];

  if (!a3)
  {
    v8 = (void *)objc_msgSend_currentHandler(MEMORY[0x1E0CB3488], a2, 0, v3, v4);
    objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_(v8, v9, (uint64_t)a2, (uint64_t)self, (uint64_t)CFSTR("CMAltimeter.mm"), 891, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("handler"));
  }
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = sub_18F4C7F68;
  v10[3] = &unk_1E2955B38;
  v10[4] = self;
  v10[5] = a3;
  objc_msgSend_tccServiceMotionAccessWithBlock_(CMMotionUtils, a2, (uint64_t)v10, v3, v4);
}

- (void)stopSignificantElevationUpdates
{
  uint64_t v2;
  uint64_t v3;
  _QWORD v4[5];

  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = sub_18F4C7FD0;
  v4[3] = &unk_1E2955938;
  v4[4] = self;
  objc_msgSend_tccServiceMotionAccessWithBlock_(CMMotionUtils, a2, (uint64_t)v4, v2, v3);
}

- (void)querySignificantElevationChangeFromDate:(id)a3 toDate:(id)a4 withHandler:(id)a5
{
  void *v10;
  const char *v11;
  void *v12;
  const char *v13;
  void *v14;
  const char *v15;
  _QWORD v16[8];

  if (a3)
  {
    if (a4)
      goto LABEL_3;
LABEL_6:
    v12 = (void *)objc_msgSend_currentHandler(MEMORY[0x1E0CB3488], a2, (uint64_t)a3, (uint64_t)a4, (uint64_t)a5);
    objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_(v12, v13, (uint64_t)a2, (uint64_t)self, (uint64_t)CFSTR("CMAltimeter.mm"), 907, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("toDate"));
    if (a5)
      goto LABEL_4;
LABEL_7:
    v14 = (void *)objc_msgSend_currentHandler(MEMORY[0x1E0CB3488], a2, (uint64_t)a3, (uint64_t)a4, (uint64_t)a5);
    objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_(v14, v15, (uint64_t)a2, (uint64_t)self, (uint64_t)CFSTR("CMAltimeter.mm"), 908, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("handler"));
    goto LABEL_4;
  }
  v10 = (void *)objc_msgSend_currentHandler(MEMORY[0x1E0CB3488], a2, 0, (uint64_t)a4, (uint64_t)a5);
  objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_(v10, v11, (uint64_t)a2, (uint64_t)self, (uint64_t)CFSTR("CMAltimeter.mm"), 906, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("fromDate"));
  if (!a4)
    goto LABEL_6;
LABEL_3:
  if (!a5)
    goto LABEL_7;
LABEL_4:
  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = sub_18F4C8124;
  v16[3] = &unk_1E2956778;
  v16[4] = self;
  v16[5] = a3;
  v16[6] = a4;
  v16[7] = a5;
  objc_msgSend_tccServiceMotionAccessWithBlock_(CMMotionUtils, a2, (uint64_t)v16, (uint64_t)a4, (uint64_t)a5);
}

- (void)onFilteredPressure:(const Sample *)a3
{
  float *internal;
  unint64_t v5;
  unint64_t v6;
  uint64_t v7;
  char *v8;
  char *v9;
  unint64_t v10;
  char *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  float *v15;
  void *v16;
  uint64_t v17;
  char *v18;
  char *v19;
  int v20;
  char *v21;
  float v22;
  void *v23;
  CMAltitudeData *v24;
  double v25;
  double v26;
  const char *v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  void *v31;
  void *v32;
  uint64_t v33;
  const char *v34;
  uint64_t v35;
  uint64_t v36;
  NSObject *v37;
  const char *v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  void *v42;
  const char *v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  void *v47;
  void *v48;
  const char *v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  void *v53;
  const char *v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  void *v58;
  const char *v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  void *v63;
  const char *v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t v69;
  const char *v70;
  uint64_t v71;
  uint64_t v72;
  uint64_t v73;
  void *v74;
  const char *v75;
  uint64_t v76;
  uint64_t v77;
  uint64_t v78;
  uint64_t v79;
  char *v80;
  _QWORD v81[6];
  int v82;
  uint64_t v83;
  __int16 v84;
  uint64_t v85;
  void *__p[206];

  __p[205] = *(void **)MEMORY[0x1E0C80C00];
  internal = (float *)self->_internal;
  v5 = *((_QWORD *)internal + 13);
  if (v5 >= 3)
  {
    ++*((_QWORD *)internal + 12);
    *((_QWORD *)internal + 13) = v5 - 1;
    sub_18F3CBAE4((uint64_t)(internal + 16), 1);
  }
  sub_18F1FD700((_QWORD *)internal + 8, &a3->acceleration.x);
  v6 = *((_QWORD *)internal + 12);
  v7 = *((_QWORD *)internal + 9);
  v8 = (char *)(v7 + 8 * (v6 >> 10));
  if (*((_QWORD *)internal + 10) == v7)
  {
    v9 = 0;
    v12 = 0;
    v11 = (char *)(v7 + 8 * ((*((_QWORD *)internal + 13) + v6) >> 10));
  }
  else
  {
    v9 = (char *)(*(_QWORD *)v8 + 4 * (*((_QWORD *)internal + 12) & 0x3FFLL));
    v10 = *((_QWORD *)internal + 13) + v6;
    v11 = (char *)(v7 + 8 * (v10 >> 10));
    v12 = *(_QWORD *)v11 + 4 * (v10 & 0x3FF);
  }
  memset(__p, 0, 24);
  if ((char *)v12 == v9
    || (v13 = ((v12 - *(_QWORD *)v11) >> 2) + ((v11 - v8) << 7), v14 = (uint64_t)&v9[-*(_QWORD *)v8], v13 == v14 >> 2))
  {
    v15 = 0;
    v16 = 0;
  }
  else
  {
    sub_18F26FB4C(__p, v13 - (v14 >> 2));
    v17 = 0;
    v18 = (char *)__p[1];
    v19 = *(char **)v8;
    do
    {
      v20 = *(_DWORD *)v9;
      v9 += 4;
      *(_DWORD *)&v18[v17] = v20;
      if (v9 - v19 == 4096)
      {
        v21 = (char *)*((_QWORD *)v8 + 1);
        v8 += 8;
        v19 = v21;
        v9 = v21;
      }
      v17 += 4;
    }
    while (v9 != (char *)v12);
    v15 = (float *)&v18[v17];
    __p[1] = &v18[v17];
    v16 = __p[0];
  }
  v22 = sub_18F3D32B4((uint64_t)v16, v15);
  if (__p[0])
  {
    __p[1] = __p[0];
    operator delete(__p[0]);
  }
  internal[14] = v22;
  if ((sub_18F1F7BFC() & 0x1000000000) == 0 && internal[14] <= 150.0)
  {
    if (!*((_BYTE *)internal + 52))
    {
      *((_BYTE *)internal + 52) = 1;
      *((_OWORD *)internal + 2) = *(_OWORD *)&a3->timestamp;
      internal[12] = (float)(1.0 - powf((float)(v22 * 1000.0) / 101320.0, 0.19026)) * 44331.0;
    }
    if (*((_QWORD *)internal + 3) && *((_QWORD *)internal + 2))
    {
      v23 = (void *)MEMORY[0x194001B4C]();
      v24 = [CMAltitudeData alloc];
      *(float *)&v25 = v22 * 1000.0;
      *(float *)&v26 = internal[12];
      v31 = (void *)objc_msgSend_initWithAltitude_andTimestamp_atBaseAltitude_(v24, v27, v28, v29, v30, v25, a3->timestamp, v26);
      v33 = *((_QWORD *)internal + 2);
      v32 = (void *)*((_QWORD *)internal + 3);
      v81[0] = MEMORY[0x1E0C809B0];
      v81[1] = 3221225472;
      v81[2] = sub_18F4C85A0;
      v81[3] = &unk_1E2955B60;
      v81[4] = v31;
      v81[5] = v33;
      objc_msgSend_addOperationWithBlock_(v32, v34, (uint64_t)v81, v35, v36);
      if (qword_1ECEDEE88 != -1)
        dispatch_once(&qword_1ECEDEE88, &unk_1E2954368);
      v37 = off_1ECEDEE80;
      if (os_log_type_enabled((os_log_t)off_1ECEDEE80, OS_LOG_TYPE_DEBUG))
      {
        v42 = (void *)objc_msgSend_relativeAltitude(v31, v38, v39, v40, v41);
        objc_msgSend_doubleValue(v42, v43, v44, v45, v46);
        v48 = v47;
        v53 = (void *)objc_msgSend_pressure(v31, v49, v50, v51, v52);
        objc_msgSend_doubleValue(v53, v54, v55, v56, v57);
        LODWORD(__p[0]) = 134218240;
        *(void **)((char *)__p + 4) = v48;
        WORD2(__p[1]) = 2048;
        *(void **)((char *)&__p[1] + 6) = v58;
        _os_log_impl(&dword_18F1DC000, v37, OS_LOG_TYPE_DEBUG, "relativeAltitude,%f,pressure,%f", (uint8_t *)__p, 0x16u);
      }
      if (sub_18F1FCA08(115, 2))
      {
        bzero(__p, 0x65CuLL);
        if (qword_1ECEDEE88 != -1)
          dispatch_once(&qword_1ECEDEE88, &unk_1E2954368);
        v63 = (void *)objc_msgSend_relativeAltitude(v31, v59, v60, v61, v62);
        objc_msgSend_doubleValue(v63, v64, v65, v66, v67);
        v69 = v68;
        v74 = (void *)objc_msgSend_pressure(v31, v70, v71, v72, v73);
        objc_msgSend_doubleValue(v74, v75, v76, v77, v78);
        v82 = 134218240;
        v83 = v69;
        v84 = 2048;
        v85 = v79;
        v80 = (char *)_os_log_send_and_compose_impl();
        sub_18F419700("Generic", 1, 0, 2, "-[CMAltimeter onFilteredPressure:]", "CoreLocation: %s\n", v80);
        if (v80 != (char *)__p)
          free(v80);
      }

      objc_autoreleasePoolPop(v23);
    }
  }
}

+ (BOOL)isAbsoluteAltitudeAvailable
{
  NSObject *v2;
  int v3;
  BOOL result;
  char *v5;
  uint8_t buf[1640];
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  if ((sub_18F1F781C() & 0x10) != 0)
  {
    sub_18F1F77DC();
    if ((sub_18F1F7BFC() & 0x8000000000000) != 0)
      return 1;
  }
  if (qword_1EE16D488[0] != -1)
    dispatch_once(qword_1EE16D488, &unk_1E2959470);
  v2 = qword_1EE16D480;
  if (os_log_type_enabled((os_log_t)qword_1EE16D480, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_18F1DC000, v2, OS_LOG_TYPE_ERROR, "altimeter not supported", buf, 2u);
  }
  v3 = sub_18F1FCA08(115, 0);
  result = 0;
  if (v3)
  {
    bzero(buf, 0x65CuLL);
    if (qword_1EE16D488[0] != -1)
      dispatch_once(qword_1EE16D488, &unk_1E2959470);
    v5 = (char *)_os_log_send_and_compose_impl();
    sub_18F419700("Generic", 1, 0, 0, "+[CMAltimeter isAbsoluteAltitudeAvailable]", "CoreLocation: %s\n", v5);
    if (v5 != (char *)buf)
      free(v5);
    return 0;
  }
  return result;
}

- (void)startAbsoluteAltitudeUpdatesToQueue:(NSOperationQueue *)queue withHandler:(CMAbsoluteAltitudeHandler)handler
{
  uint64_t v4;
  uint64_t v8;

  if (objc_msgSend_isAbsoluteAltitudeAvailable(CMAltimeter, a2, (uint64_t)queue, (uint64_t)handler, v4))MEMORY[0x1E0DE7D20](self->_internal, sel__startAbsoluteAltitudeUpdatesToQueue_withHandler_, queue, handler, v8);
}

- (void)stopAbsoluteAltitudeUpdates
{
  ((void (*)(id, char *))MEMORY[0x1E0DE7D20])(self->_internal, sel__stopAbsoluteAltitudeUpdates);
}

- (void)pauseAbsoluteAltitudeUpdates
{
  ((void (*)(id, char *))MEMORY[0x1E0DE7D20])(self->_internal, sel__pauseAbsoluteAltitudeUpdates);
}

- (void)resumeAbsoluteAltitudeUpdates
{
  ((void (*)(id, char *))MEMORY[0x1E0DE7D20])(self->_internal, sel__resumeAbsoluteAltitudeUpdates);
}

- (void)queryElevationProfileFromDate:(id)a3 toDate:(id)a4 withBatchSize:(unint64_t)a5 withHandler:(id)a6
{
  void *v12;
  const char *v13;
  void *v14;
  const char *v15;
  void *v16;
  const char *v17;
  _QWORD v18[9];

  if (a3)
  {
    if (a4)
      goto LABEL_3;
LABEL_6:
    v14 = (void *)objc_msgSend_currentHandler(MEMORY[0x1E0CB3488], a2, (uint64_t)a3, (uint64_t)a4, a5);
    objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_(v14, v15, (uint64_t)a2, (uint64_t)self, (uint64_t)CFSTR("CMAltimeter.mm"), 1069, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("toDate"));
    if (a6)
      goto LABEL_4;
LABEL_7:
    v16 = (void *)objc_msgSend_currentHandler(MEMORY[0x1E0CB3488], a2, (uint64_t)a3, (uint64_t)a4, a5);
    objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_(v16, v17, (uint64_t)a2, (uint64_t)self, (uint64_t)CFSTR("CMAltimeter.mm"), 1070, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("handler"));
    goto LABEL_4;
  }
  v12 = (void *)objc_msgSend_currentHandler(MEMORY[0x1E0CB3488], a2, 0, (uint64_t)a4, a5);
  objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_(v12, v13, (uint64_t)a2, (uint64_t)self, (uint64_t)CFSTR("CMAltimeter.mm"), 1068, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("fromDate"));
  if (!a4)
    goto LABEL_6;
LABEL_3:
  if (!a6)
    goto LABEL_7;
LABEL_4:
  v18[0] = MEMORY[0x1E0C809B0];
  v18[1] = 3221225472;
  v18[2] = sub_18F4C891C;
  v18[3] = &unk_1E2959430;
  v18[4] = self;
  v18[5] = a3;
  v18[7] = a6;
  v18[8] = a5;
  v18[6] = a4;
  objc_msgSend_tccServiceMotionAccessWithBlock_(CMMotionUtils, a2, (uint64_t)v18, (uint64_t)a4, a5);
}

@end
