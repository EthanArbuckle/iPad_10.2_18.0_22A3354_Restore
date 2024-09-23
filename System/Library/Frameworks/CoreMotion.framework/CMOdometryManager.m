@implementation CMOdometryManager

+ (BOOL)isAvailable
{
  _BOOL8 result;

  if ((sub_18F375EC4() & 1) != 0)
    return 1;
  if (qword_1ECEDEF68 != -1)
    dispatch_once(&qword_1ECEDEF68, &unk_1E2952F48);
  if (qword_1ECEDEF70 != -1)
    dispatch_once(&qword_1ECEDEF70, &unk_1E2944F60);
  result = 1;
  if ((dword_1ECEDEF5C - 99) >= 0x23)
    return dword_1ECEDEF5C == 258;
  return result;
}

- (CMOdometryManager)init
{
  uint64_t v3;
  CMOdometryManager *v4;
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
  v10 = sub_18F206C24;
  v11 = sub_18F206B88;
  v12 = 0;
  v3 = sub_18F204AE4();
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = sub_18F3E5C14;
  v6[3] = &unk_1E2956830;
  v6[4] = self;
  v6[5] = &v7;
  sub_18F1F5E28(v3, (uint64_t)v6);
  v4 = (CMOdometryManager *)v8[5];
  _Block_object_dispose(&v7, 8);
  return v4;
}

- (id)initPrivate
{
  CMOdometryManager *v2;
  const char *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)CMOdometryManager;
  v2 = -[CMOdometryManager init](&v8, sel_init);
  if (v2)
  {
    v2->_internal = (id)objc_opt_new();
    objc_msgSend_setupBIO(v2, v3, v4, v5, v6);
  }
  return v2;
}

- (void)dealloc
{
  uint64_t v3;
  const char *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  objc_super v8;
  _QWORD v9[5];
  _QWORD v10[6];

  v10[0] = 0;
  v10[1] = v10;
  v10[2] = 0x3052000000;
  v10[3] = sub_18F206C24;
  v10[4] = sub_18F206B88;
  v10[5] = self;
  v3 = sub_18F204AE4();
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = sub_18F3E5D78;
  v9[3] = &unk_1E2956858;
  v9[4] = v10;
  sub_18F1F5E28(v3, (uint64_t)v9);
  objc_msgSend_teardownBIO(self, v4, v5, v6, v7);
  v8.receiver = self;
  v8.super_class = (Class)CMOdometryManager;
  -[CMOdometryManager dealloc](&v8, sel_dealloc);
  _Block_object_dispose(v10, 8);
}

- (void)deallocPrivate
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  objc_msgSend_stopOdometryUpdatesPrivate(self, a2, v2, v3, v4);

}

- (void)setupBIO
{
  uint64_t v3;
  void *__p[2];
  char v5;

  self->_backgroundInertialOdometryQueue = 0;
  self->_referenceFrameBIO = 1;
  self->_backgroundInertialOdometryHandler = 0;
  self->_xpcQueue = (OS_dispatch_queue *)dispatch_queue_create("com.apple.CoreMotion.CMOdometryManagerPrivateQueue", 0);
  v3 = operator new();
  sub_18F270374(__p, "com.apple.locationd.registration");
  MEMORY[0x19400100C](v3, __p, self->_xpcQueue);
  if (v5 < 0)
    operator delete(__p[0]);
  sub_18F331ACC((uint64_t *)&self->_locationdConnection, v3);
  CLConnectionClient::setDefaultMessageHandler();
  CLConnectionClient::setInterruptionHandler();
  CLConnectionClient::start(self->_locationdConnection.__ptr_.__value_);
}

- (void)teardownBIO
{
  NSObject *xpcQueue;
  uint64_t v4;
  _QWORD block[5];

  self->_backgroundInertialOdometryHandler = 0;
  self->_backgroundInertialOdometryQueue = 0;
  sub_18F331ACC((uint64_t *)&self->_locationdConnection, 0);
  xpcQueue = self->_xpcQueue;
  v4 = MEMORY[0x1E0C809B0];
  self->_xpcQueue = 0;
  block[0] = v4;
  block[1] = 3221225472;
  block[2] = sub_18F3E6348;
  block[3] = &unk_1E2955938;
  block[4] = xpcQueue;
  dispatch_async(xpcQueue, block);
}

- (void)startOdometryUpdatesToQueue:(id)a3 withHandler:(id)a4
{
  uint64_t v7;
  _QWORD v8[7];

  v7 = sub_18F204AE4();
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = sub_18F3E63C4;
  v8[3] = &unk_1E2955BD8;
  v8[4] = self;
  v8[5] = a3;
  v8[6] = a4;
  sub_18F1F5E28(v7, (uint64_t)v8);
}

- (void)startOdometryUpdatesUsingReferenceFrame:(unint64_t)a3 toQueue:(id)a4 withHandler:(id)a5
{
  uint64_t v9;
  _QWORD v10[8];

  v9 = sub_18F204AE4();
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = sub_18F3E6450;
  v10[3] = &unk_1E29568A8;
  v10[4] = self;
  v10[5] = a4;
  v10[6] = a5;
  v10[7] = a3;
  sub_18F1F5E28(v9, (uint64_t)v10);
}

- (void)stopOdometryUpdates
{
  uint64_t v3;
  _QWORD v4[5];

  v3 = sub_18F204AE4();
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = sub_18F3E64C0;
  v4[3] = &unk_1E2955938;
  v4[4] = self;
  sub_18F1F5E28(v3, (uint64_t)v4);
}

- (double)odometryUpdateInterval
{
  return *((double *)self->_internal + 32);
}

- (void)setOdometryUpdateInterval:(double)a3
{
  uint64_t v5;
  _QWORD v6[6];

  v5 = sub_18F204AE4();
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = sub_18F3E6544;
  v6[3] = &unk_1E2956590;
  v6[4] = self;
  *(double *)&v6[5] = a3;
  sub_18F1F5E28(v5, (uint64_t)v6);
}

- (void)startBackgroundUpdatesToQueue:(id)a3 withHandler:(id)a4
{
  MEMORY[0x1E0DE7D20](self, sel_startBackgroundUpdatesPrivateUsingReferenceFrame_toQueue_withHandler_, 1, a3, a4);
}

- (void)startBackgroundUpdatesUsingReferenceFrame:(unint64_t)a3 toQueue:(id)a4 withHandler:(id)a5
{
  MEMORY[0x1E0DE7D20](self, sel_startBackgroundUpdatesPrivateUsingReferenceFrame_toQueue_withHandler_, a3, a4, a5);
}

- (void)stopBackgroundUpdates
{
  ((void (*)(CMOdometryManager *, char *))MEMORY[0x1E0DE7D20])(self, sel_stopBackgroundUpdatesPrivate);
}

- (void)startOdometryUpdatesToQueue:(id)a3 withHandler:(id)a4 usingReferenceFrame:(unint64_t)a5
{
  uint64_t v9;
  _QWORD v10[8];

  v9 = sub_18F204AE4();
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = sub_18F3E65E4;
  v10[3] = &unk_1E29568A8;
  v10[4] = self;
  v10[5] = a3;
  v10[6] = a4;
  v10[7] = a5;
  sub_18F1F5E28(v9, (uint64_t)v10);
}

- (void)startBackgroundUpdatesToQueue:(id)a3 withHandler:(id)a4 usingReferenceFrame:(unint64_t)a5
{
  uint64_t v9;
  _QWORD v10[8];

  v9 = sub_18F204AE4();
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = sub_18F3E666C;
  v10[3] = &unk_1E29568A8;
  v10[4] = self;
  v10[5] = a3;
  v10[6] = a4;
  v10[7] = a5;
  sub_18F1F5E28(v9, (uint64_t)v10);
}

- (void)setOdometryUpdateIntervalPrivate:(double)a3
{
  double *internal;
  double v5;
  char *v6;
  NSObject *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  __int128 buf;
  void (*v13)(uint64_t);
  void *v14;
  uint64_t v15;
  uint64_t v16;
  char *v17;
  int v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  internal = (double *)self->_internal;
  v5 = 0.1;
  if (a3 >= 0.1)
    v5 = a3;
  internal[32] = v5;
  if (*((_QWORD *)internal + 31))
  {
    if (qword_1EE16D918 != -1)
      dispatch_once(&qword_1EE16D918, &unk_1E29450E8);
    v6 = (char *)(internal + 32);
    v7 = qword_1EE16D920;
    if (os_log_type_enabled((os_log_t)qword_1EE16D920, OS_LOG_TYPE_DEFAULT))
    {
      LODWORD(buf) = 134349056;
      *(double *)((char *)&buf + 4) = a3;
      _os_log_impl(&dword_18F1DC000, v7, OS_LOG_TYPE_DEFAULT, "Requesting CMOdometry updates with interval: %{public}f", (uint8_t *)&buf, 0xCu);
    }
    if (sub_18F1FCA08(115, 2))
    {
      bzero(&buf, 0x65CuLL);
      if (qword_1EE16D918 != -1)
        dispatch_once(&qword_1EE16D918, &unk_1E29450E8);
      v11 = (char *)_os_log_send_and_compose_impl();
      sub_18F419700("Generic", 1, 0, 2, "-[CMOdometryManager setOdometryUpdateIntervalPrivate:]", "CoreLocation: %s\n", v11);
      if (v11 != (char *)&buf)
        free(v11);
    }
    v8 = sub_18F44E460();
    v9 = *((_QWORD *)internal + 31);
    v10 = sub_18F204AE4();
    *(_QWORD *)&buf = MEMORY[0x1E0C809B0];
    *((_QWORD *)&buf + 1) = 3221225472;
    v13 = sub_18F20741C;
    v14 = &unk_1E2956EB8;
    v18 = 0;
    v15 = v8;
    v16 = v9;
    v17 = v6;
    sub_18F1F5E28(v10, (uint64_t)&buf);
  }
}

- (void)sendOdometryToClientPrivate
{
  double *internal;
  uint64_t v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  double v9;
  double v10;
  void *v11;
  uint64_t v12;
  unint64_t v13;
  id v14;
  const char *v15;
  uint64_t v16;
  const char *v17;
  void *v18;
  void *v19;
  const char *v20;
  uint64_t v21;
  uint64_t v22;
  NSObject *v23;
  uint64_t v24;
  NSObject *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  double v29;
  const char *v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  double v34;
  const char *v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  CMOdometry *v39;
  double v40;
  const char *v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  double v46;
  const char *v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  double v52;
  const char *v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  double v58;
  const char *v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  double v64;
  const char *v65;
  void *v66;
  const char *v67;
  uint64_t v68;
  uint64_t v69;
  uint64_t v70;
  void *v71;
  char *v72;
  char *v73;
  uint64_t v74;
  void *v75;
  uint64_t v76;
  uint64_t v77;
  _QWORD v78[6];
  __int16 v79;
  _QWORD v80[6];
  uint8_t buf[1632];
  uint64_t v82;
  _QWORD v83[3];

  v83[1] = *MEMORY[0x1E0C80C00];
  sub_18F204AE4();
  sub_18F3DE6D4();
  internal = (double *)self->_internal;
  if (*((_QWORD *)internal + 34) && *((_QWORD *)internal + 33))
  {
    v4 = MEMORY[0x194001B4C]();
    v10 = internal[15];
    if (v10 == 0.0)
      __assert_rtn("-[CMOdometryManager sendOdometryToClientPrivate]", "CMOdometryManager.mm", 275, "timestampSecs != 0.");
    v11 = (void *)v4;
    v12 = *((_QWORD *)internal + 33);
    v13 = *((_QWORD *)internal + 2);
    if (v13 >= *((_QWORD *)internal + 25))
    {
      v74 = *((_QWORD *)internal + 33);
      v75 = (void *)v4;
      if (v13 >= *((_QWORD *)internal + 20))
      {
        if (*((_QWORD *)internal + 22) <= v13)
        {
          *(float *)&v9 = *((float *)internal + 34) - *((float *)internal + 6);
          v77 = objc_msgSend_numberWithFloat_(MEMORY[0x1E0CB37E8], v5, v6, v7, v8, v9);
          v13 = *((_QWORD *)internal + 2);
        }
        else
        {
          v77 = 0;
        }
        if (*((_QWORD *)internal + 23) <= v13)
        {
          *(float *)&v9 = *((float *)internal + 35) - *((float *)internal + 7);
          v76 = objc_msgSend_numberWithFloat_(MEMORY[0x1E0CB37E8], v5, v6, v7, v8, v9);
          v13 = *((_QWORD *)internal + 2);
        }
        else
        {
          v76 = 0;
        }
        if (*((_QWORD *)internal + 24) <= v13)
        {
          *(float *)&v9 = *((float *)internal + 36) - *((float *)internal + 8);
          v24 = objc_msgSend_numberWithFloat_(MEMORY[0x1E0CB37E8], v5, v6, v7, v8, v9);
        }
        else
        {
          v24 = 0;
        }
      }
      else
      {
        if (qword_1EE16D918 != -1)
          dispatch_once(&qword_1EE16D918, &unk_1E29450E8);
        v23 = qword_1EE16D920;
        if (os_log_type_enabled((os_log_t)qword_1EE16D920, OS_LOG_TYPE_INFO))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_18F1DC000, v23, OS_LOG_TYPE_INFO, "Position rollover", buf, 2u);
        }
        if (sub_18F1FCA08(115, 2))
        {
          bzero(buf, 0x65CuLL);
          if (qword_1EE16D918 != -1)
            dispatch_once(&qword_1EE16D918, &unk_1E29450E8);
          v79 = 0;
          v72 = (char *)_os_log_send_and_compose_impl();
          sub_18F419700("Generic", 1, 0, 2, "-[CMOdometryManager sendOdometryToClientPrivate]", "CoreLocation: %s\n", v72);
          if (v72 != (char *)buf)
            free(v72);
        }
        v24 = 0;
        v76 = 0;
        v77 = 0;
      }
      if (*((_QWORD *)internal + 2) >= *((_QWORD *)internal + 21))
      {
        *(float *)&v9 = *((float *)internal + 37) - *((float *)internal + 9);
        v26 = objc_msgSend_numberWithFloat_(MEMORY[0x1E0CB37E8], v5, v6, v7, v8, v9);
        *(float *)&v29 = *((float *)internal + 38) - *((float *)internal + 10);
        v27 = objc_msgSend_numberWithFloat_(MEMORY[0x1E0CB37E8], v30, v31, v32, v33, v29);
        *(float *)&v34 = *((float *)internal + 39) - *((float *)internal + 11);
        v28 = objc_msgSend_numberWithFloat_(MEMORY[0x1E0CB37E8], v35, v36, v37, v38, v34);
      }
      else
      {
        if (qword_1EE16D918 != -1)
          dispatch_once(&qword_1EE16D918, &unk_1E29450E8);
        v25 = qword_1EE16D920;
        if (os_log_type_enabled((os_log_t)qword_1EE16D920, OS_LOG_TYPE_INFO))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_18F1DC000, v25, OS_LOG_TYPE_INFO, "Velocity rollover", buf, 2u);
        }
        if (sub_18F1FCA08(115, 2))
        {
          bzero(buf, 0x65CuLL);
          if (qword_1EE16D918 != -1)
            dispatch_once(&qword_1EE16D918, &unk_1E29450E8);
          v79 = 0;
          v73 = (char *)_os_log_send_and_compose_impl();
          sub_18F419700("Generic", 1, 0, 2, "-[CMOdometryManager sendOdometryToClientPrivate]", "CoreLocation: %s\n", v73);
          if (v73 != (char *)buf)
            free(v73);
        }
        v26 = 0;
        v27 = 0;
        v28 = 0;
      }
      v39 = [CMOdometry alloc];
      LODWORD(v40) = *((_DWORD *)internal + 52);
      v45 = objc_msgSend_numberWithFloat_(MEMORY[0x1E0CB37E8], v41, v42, v43, v44, v40);
      LODWORD(v46) = *((_DWORD *)internal + 53);
      v51 = objc_msgSend_numberWithFloat_(MEMORY[0x1E0CB37E8], v47, v48, v49, v50, v46);
      LODWORD(v52) = *((_DWORD *)internal + 54);
      v57 = objc_msgSend_numberWithFloat_(MEMORY[0x1E0CB37E8], v53, v54, v55, v56, v52);
      LODWORD(v58) = *((_DWORD *)internal + 55);
      v63 = objc_msgSend_numberWithFloat_(MEMORY[0x1E0CB37E8], v59, v60, v61, v62, v58);
      LODWORD(v64) = *((_DWORD *)internal + 56);
      v66 = (void *)objc_msgSend_initWithDeltaPositionX_deltaPositionY_deltaPositionZ_deltaVelocityX_deltaVelocityY_deltaVelocityZ_quaternionX_quaternionY_quaternionZ_quaternionW_rotationArbitraryToTrueNorth_staticFlag_timestamp_(v39, v65, v77, v76, v24, v26, v27, v28, v64, v10, v45, v51, v57, v63, 0);
      v18 = v66;
      if (*((_QWORD *)internal + 30) == 8)
        objc_msgSend_rotateArbitraryToTrueNorth(v66, v67, v68, v69, v70);
      v71 = (void *)*((_QWORD *)internal + 34);
      v78[0] = MEMORY[0x1E0C809B0];
      v78[1] = 3221225472;
      v78[2] = sub_18F3E6E84;
      v78[3] = &unk_1E2955B60;
      v78[4] = v18;
      v78[5] = v74;
      objc_msgSend_addOperationWithBlock_(v71, v67, (uint64_t)v78, v69, v70);
      v11 = v75;
    }
    else
    {
      v14 = objc_alloc(MEMORY[0x1E0CB35C8]);
      v82 = *MEMORY[0x1E0CB2D50];
      v83[0] = CFSTR("Reference frame has changed for the incoming delta position updates due to unexpected DeviceMotion reinitialization.");
      v16 = objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x1E0C99D80], v15, (uint64_t)v83, (uint64_t)&v82, 1);
      v18 = (void *)objc_msgSend_initWithDomain_code_userInfo_(v14, v17, (uint64_t)CFSTR("CMErrorDomainPrivate"), 103, v16);
      v19 = (void *)*((_QWORD *)internal + 34);
      v80[0] = MEMORY[0x1E0C809B0];
      v80[1] = 3221225472;
      v80[2] = sub_18F3E6E70;
      v80[3] = &unk_1E2955B60;
      v80[4] = v18;
      v80[5] = v12;
      objc_msgSend_addOperationWithBlock_(v19, v20, (uint64_t)v80, v21, v22);
    }

    objc_autoreleasePoolPop(v11);
  }
}

- (void)feedOdometryData:(const InertialOdometryData *)a3
{
  uint64_t v5;
  NSObject *v6;
  char *v7;
  _QWORD v8[6];
  __int16 v9;
  uint8_t buf[1640];
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  if (a3)
  {
    v5 = sub_18F204AE4();
    v8[0] = MEMORY[0x1E0C809B0];
    v8[1] = 3221225472;
    v8[2] = sub_18F3E7068;
    v8[3] = &unk_1E2956590;
    v8[4] = self;
    v8[5] = a3;
    sub_18F1F5E28(v5, (uint64_t)v8);
  }
  else
  {
    if (qword_1EE16D918 != -1)
      dispatch_once(&qword_1EE16D918, &unk_1E29450E8);
    v6 = qword_1EE16D920;
    if (os_log_type_enabled((os_log_t)qword_1EE16D920, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_18F1DC000, v6, OS_LOG_TYPE_ERROR, "Invalid data parameter!", buf, 2u);
    }
    if (sub_18F1FCA08(115, 0))
    {
      bzero(buf, 0x65CuLL);
      if (qword_1EE16D918 != -1)
        dispatch_once(&qword_1EE16D918, &unk_1E29450E8);
      v9 = 0;
      v7 = (char *)_os_log_send_and_compose_impl();
      sub_18F419700("Generic", 1, 0, 0, "-[CMOdometryManager feedOdometryData:]", "CoreLocation: %s\n", v7);
      if (v7 != (char *)buf)
        free(v7);
    }
  }
}

- (void)startOdometryUpdatesPrivateUsingReferenceFrame:(unint64_t)a3 toQueue:(id)a4 withHandler:(id)a5
{
  id internal;
  NSObject *v10;
  id v11;
  id v12;
  const char *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  _QWORD *v17;
  uint64_t v18;
  NSObject *v19;
  NSObject *v20;
  NSObject *v21;
  char *v22;
  char *v23;
  uint8_t buf[4];
  int v25;
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  sub_18F204AE4();
  sub_18F3DE6D4();
  internal = self->_internal;
  if (!+[CMOdometryManager isAvailable]_0())
  {
    if (qword_1EE16D918 != -1)
      dispatch_once(&qword_1EE16D918, &unk_1E29450E8);
    v19 = qword_1EE16D920;
    if (os_log_type_enabled((os_log_t)qword_1EE16D920, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_18F1DC000, v19, OS_LOG_TYPE_ERROR, "InertialOdometry not available", buf, 2u);
    }
    if (!sub_18F1FCA08(115, 0))
      return;
    bzero(buf, 0x65CuLL);
    if (qword_1EE16D918 == -1)
    {
LABEL_41:
      v23 = (char *)_os_log_send_and_compose_impl();
      sub_18F419700("Generic", 1, 0, 0, "-[CMOdometryManager startOdometryUpdatesPrivateUsingReferenceFrame:toQueue:withHandler:]", "CoreLocation: %s\n", v23);
      if (v23 != (char *)buf)
        free(v23);
      return;
    }
LABEL_43:
    dispatch_once(&qword_1EE16D918, &unk_1E29450E8);
    goto LABEL_41;
  }
  if (*((double *)internal + 32) <= 0.0)
  {
    if (qword_1EE16D918 != -1)
      dispatch_once(&qword_1EE16D918, &unk_1E29450E8);
    v20 = qword_1EE16D920;
    if (os_log_type_enabled((os_log_t)qword_1EE16D920, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_18F1DC000, v20, OS_LOG_TYPE_ERROR, "Invalid update interval", buf, 2u);
    }
    if (!sub_18F1FCA08(115, 0))
      return;
    bzero(buf, 0x65CuLL);
    if (qword_1EE16D918 == -1)
      goto LABEL_41;
    goto LABEL_43;
  }
  if (a3 == 1 || a3 == 8)
  {
    if (qword_1EE16D918 != -1)
      dispatch_once(&qword_1EE16D918, &unk_1E29450E8);
    v10 = qword_1EE16D920;
    if (os_log_type_enabled((os_log_t)qword_1EE16D920, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 67240192;
      v25 = a3;
      _os_log_impl(&dword_18F1DC000, v10, OS_LOG_TYPE_DEFAULT, "Starting InertialOdometry updates with reference frame: %{public}d", buf, 8u);
    }
    if (sub_18F1FCA08(115, 2))
    {
      bzero(buf, 0x65CuLL);
      if (qword_1EE16D918 != -1)
        dispatch_once(&qword_1EE16D918, &unk_1E29450E8);
      v22 = (char *)_os_log_send_and_compose_impl();
      sub_18F419700("Generic", 1, 0, 2, "-[CMOdometryManager startOdometryUpdatesPrivateUsingReferenceFrame:toQueue:withHandler:]", "CoreLocation: %s\n", v22);
      if (v22 != (char *)buf)
        free(v22);
    }
    *((_QWORD *)internal + 30) = a3;
    v11 = (id)*((_QWORD *)internal + 34);
    if (v11 != a4)
    {

      *((_QWORD *)internal + 34) = a4;
    }
    v12 = (id)*((_QWORD *)internal + 33);
    if (v12 != a5)
    {

      *((_QWORD *)internal + 33) = objc_msgSend_copy(a5, v13, v14, v15, v16);
    }
    if (!*((_QWORD *)internal + 31))
    {
      v17 = (_QWORD *)operator new();
      *v17 = off_1E294C238;
      *v17 = &off_1E2944358;
      v17[1] = 0;
      v17[2] = sub_18F3E5AEC;
      v17[3] = self;
      *((_QWORD *)internal + 31) = v17;
      v18 = sub_18F44E460();
      sub_18F1F4F0C(v18, 0, *((_QWORD *)internal + 31), *((double *)internal + 32));
    }
    return;
  }
  if (qword_1EE16D918 != -1)
    dispatch_once(&qword_1EE16D918, &unk_1E29450E8);
  v21 = qword_1EE16D920;
  if (os_log_type_enabled((os_log_t)qword_1EE16D920, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_18F1DC000, v21, OS_LOG_TYPE_ERROR, "Invalid reference frame", buf, 2u);
  }
  if (sub_18F1FCA08(115, 0))
  {
    bzero(buf, 0x65CuLL);
    if (qword_1EE16D918 == -1)
      goto LABEL_41;
    goto LABEL_43;
  }
}

- (void)stopOdometryUpdatesPrivate
{
  char *internal;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  NSObject *v8;
  void *v9;
  void *v10;
  char *v11;
  uint8_t buf[8];
  uint64_t v13;
  uint64_t *(*v14)(uint64_t);
  void *v15;
  uint64_t v16;
  uint64_t v17;
  int v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  sub_18F204AE4();
  sub_18F3DE6D4();
  internal = (char *)self->_internal;
  if (+[CMOdometryManager isAvailable]_0())
  {
    if (*((_QWORD *)internal + 31))
    {
      v4 = sub_18F44E460();
      v5 = *((_QWORD *)internal + 31);
      v6 = sub_18F204AE4();
      *(_QWORD *)buf = MEMORY[0x1E0C809B0];
      v13 = 3221225472;
      v14 = sub_18F1F5EE0;
      v15 = &unk_1E2956E98;
      v18 = 0;
      v16 = v4;
      v17 = v5;
      sub_18F1F5E28(v6, (uint64_t)buf);
      v7 = *((_QWORD *)internal + 31);
      if (v7)
        (*(void (**)(uint64_t))(*(_QWORD *)v7 + 8))(v7);
      *((_QWORD *)internal + 31) = 0;
      if (qword_1EE16D918 != -1)
        dispatch_once(&qword_1EE16D918, &unk_1E29450E8);
      v8 = qword_1EE16D920;
      if (os_log_type_enabled((os_log_t)qword_1EE16D920, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_18F1DC000, v8, OS_LOG_TYPE_DEFAULT, "Stopping InertialOdometry updates", buf, 2u);
      }
      if (sub_18F1FCA08(115, 2))
      {
        bzero(buf, 0x65CuLL);
        if (qword_1EE16D918 != -1)
          dispatch_once(&qword_1EE16D918, &unk_1E29450E8);
        v11 = (char *)_os_log_send_and_compose_impl();
        sub_18F419700("Generic", 1, 0, 2, "-[CMOdometryManager stopOdometryUpdatesPrivate]", "CoreLocation: %s\n", v11);
        if (v11 != (char *)buf)
          free(v11);
      }
    }
    v9 = (void *)*((_QWORD *)internal + 34);
    if (v9)
    {

      *((_QWORD *)internal + 34) = 0;
    }
    v10 = (void *)*((_QWORD *)internal + 33);
    if (v10)
    {

      *((_QWORD *)internal + 33) = 0;
    }
    internal[232] = 0;
    *(_OWORD *)(internal + 216) = 0u;
    *(_OWORD *)(internal + 200) = 0u;
    *(_OWORD *)(internal + 184) = 0u;
    *(_OWORD *)(internal + 168) = 0u;
    *(_OWORD *)(internal + 152) = 0u;
    *(_OWORD *)(internal + 136) = 0u;
    *(_OWORD *)(internal + 120) = 0u;
    *(_OWORD *)(internal + 104) = 0u;
    *(_OWORD *)(internal + 88) = 0u;
    *(_OWORD *)(internal + 72) = 0u;
    *(_OWORD *)(internal + 56) = 0u;
    *(_OWORD *)(internal + 40) = 0u;
    *(_OWORD *)(internal + 24) = 0u;
    *(_OWORD *)(internal + 8) = 0u;
  }
}

- (void)startBackgroundUpdatesPrivateUsingReferenceFrame:(unint64_t)a3 toQueue:(id)a4 withHandler:(id)a5
{
  uint64_t v10;
  NSObject *xpcQueue;
  NSObject *v12;
  NSObject *v13;
  void *v14;
  const char *v15;
  void *v16;
  const char *v17;
  char *v18;
  _QWORD block[7];
  id v20[2];
  _QWORD v21[4];
  id v22;
  __int16 v23;
  id location[206];

  location[205] = *(id *)MEMORY[0x1E0C80C00];
  if (a4)
  {
    if (a5)
      goto LABEL_3;
  }
  else
  {
    v14 = (void *)objc_msgSend_currentHandler(MEMORY[0x1E0CB3488], a2, a3, 0, (uint64_t)a5);
    objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_(v14, v15, (uint64_t)a2, (uint64_t)self, (uint64_t)CFSTR("CMOdometryManager.mm"), 455, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("queue"));
    if (a5)
      goto LABEL_3;
  }
  v16 = (void *)objc_msgSend_currentHandler(MEMORY[0x1E0CB3488], a2, a3, (uint64_t)a4, (uint64_t)a5);
  objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_(v16, v17, (uint64_t)a2, (uint64_t)self, (uint64_t)CFSTR("CMOdometryManager.mm"), 456, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("handler"));
LABEL_3:
  if (!+[CMOdometryManager isAvailable]_0())
  {
    if (qword_1EE16D918 != -1)
      dispatch_once(&qword_1EE16D918, &unk_1E29450E8);
    v12 = qword_1EE16D920;
    if (os_log_type_enabled((os_log_t)qword_1EE16D920, OS_LOG_TYPE_ERROR))
    {
      LOWORD(location[0]) = 0;
      _os_log_impl(&dword_18F1DC000, v12, OS_LOG_TYPE_ERROR, "Background InertialOdometry not available", (uint8_t *)location, 2u);
    }
    if (!sub_18F1FCA08(115, 0))
      return;
    bzero(location, 0x65CuLL);
    if (qword_1EE16D918 != -1)
      dispatch_once(&qword_1EE16D918, &unk_1E29450E8);
    v23 = 0;
LABEL_26:
    v18 = (char *)_os_log_send_and_compose_impl();
    sub_18F419700("Generic", 1, 0, 0, "-[CMOdometryManager startBackgroundUpdatesPrivateUsingReferenceFrame:toQueue:withHandler:]", "CoreLocation: %s\n", v18);
    if (v18 != (char *)location)
      free(v18);
    return;
  }
  if (a3 == 1 || a3 == 8)
  {
    objc_initWeak(location, self);
    v10 = MEMORY[0x1E0C809B0];
    v21[0] = MEMORY[0x1E0C809B0];
    v21[1] = 3221225472;
    v21[2] = sub_18F3E7D68;
    v21[3] = &unk_1E29559F8;
    objc_copyWeak(&v22, location);
    xpcQueue = self->_xpcQueue;
    block[0] = v10;
    block[1] = 3221225472;
    block[2] = sub_18F3E7EF4;
    block[3] = &unk_1E2957088;
    objc_copyWeak(v20, location);
    block[4] = a4;
    block[5] = a5;
    v20[1] = (id)a3;
    block[6] = v21;
    dispatch_async(xpcQueue, block);
    objc_destroyWeak(v20);
    objc_destroyWeak(&v22);
    objc_destroyWeak(location);
    return;
  }
  if (qword_1EE16D918 != -1)
    dispatch_once(&qword_1EE16D918, &unk_1E29450E8);
  v13 = qword_1EE16D920;
  if (os_log_type_enabled((os_log_t)qword_1EE16D920, OS_LOG_TYPE_ERROR))
  {
    LOWORD(location[0]) = 0;
    _os_log_impl(&dword_18F1DC000, v13, OS_LOG_TYPE_ERROR, "Invalid reference frame", (uint8_t *)location, 2u);
  }
  if (sub_18F1FCA08(115, 0))
  {
    bzero(location, 0x65CuLL);
    if (qword_1EE16D918 != -1)
      dispatch_once(&qword_1EE16D918, &unk_1E29450E8);
    v23 = 0;
    goto LABEL_26;
  }
}

- (void)stopBackgroundUpdatesPrivate
{
  NSObject *xpcQueue;
  _QWORD v4[4];
  id v5;
  id location;

  if (+[CMOdometryManager isAvailable]_0())
  {
    objc_initWeak(&location, self);
    xpcQueue = self->_xpcQueue;
    v4[0] = MEMORY[0x1E0C809B0];
    v4[1] = 3221225472;
    v4[2] = sub_18F3E8308;
    v4[3] = &unk_1E29570B0;
    objc_copyWeak(&v5, &location);
    dispatch_async(xpcQueue, v4);
    objc_destroyWeak(&v5);
    objc_destroyWeak(&location);
  }
}

- (void).cxx_destruct
{
  sub_18F331ACC((uint64_t *)&self->_locationdConnection, 0);
}

- (id).cxx_construct
{
  *((_QWORD *)self + 2) = 0;
  return self;
}

@end
