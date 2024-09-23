@implementation CMSuppressionManager

+ (BOOL)isAvailable
{
  unint64_t v2;

  if (qword_1EE16E438 != -1)
    dispatch_once(&qword_1EE16E438, &unk_1E2943840);
  v2 = ((unint64_t)sub_18F1F7BFC() >> 8) & 1;
  if (byte_1EE16E430)
    return 1;
  else
    return v2;
}

+ (BOOL)isSourceAvailable:(unint64_t)a3
{
  uint64_t v3;
  uint64_t v4;
  BOOL result;

  result = objc_msgSend_isAvailable(CMSuppressionManager, a2, a3, v3, v4);
  if (a3 >= 0x20)
    return 0;
  return result;
}

- (CMSuppressionManager)init
{
  uint64_t v3;
  CMSuppressionManager *v4;
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
  v10 = sub_18F206CB8;
  v11 = sub_18F206BEC;
  v12 = 0;
  v3 = sub_18F204AE4();
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = sub_18F4B7BF8;
  v6[3] = &unk_1E2956830;
  v6[4] = self;
  v6[5] = &v7;
  sub_18F1F5E28(v3, (uint64_t)v6);
  v4 = (CMSuppressionManager *)v8[5];
  _Block_object_dispose(&v7, 8);
  return v4;
}

- (CMSuppressionManager)initWithClientType:(int64_t)a3
{
  uint64_t v5;
  CMSuppressionManager *v6;
  _QWORD v8[7];
  uint64_t v9;
  uint64_t *v10;
  uint64_t v11;
  void (*v12)(uint64_t, uint64_t);
  void (*v13)(uint64_t);
  uint64_t v14;

  v9 = 0;
  v10 = &v9;
  v11 = 0x3052000000;
  v12 = sub_18F206CB8;
  v13 = sub_18F206BEC;
  v14 = 0;
  v5 = sub_18F204AE4();
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = sub_18F4B7CF8;
  v8[3] = &unk_1E2959108;
  v8[4] = self;
  v8[5] = &v9;
  v8[6] = a3;
  sub_18F1F5E28(v5, (uint64_t)v8);
  v6 = (CMSuppressionManager *)v10[5];
  _Block_object_dispose(&v9, 8);
  return v6;
}

- (id)initPrivateWithClientType:(int64_t)a3
{
  CMSuppressionManager *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)CMSuppressionManager;
  v4 = -[CMSuppressionManager init](&v6, sel_init);
  if (v4)
  {
    v4->_internal = objc_alloc_init(CMSuppressionManagerInternal);
    v4->_isCameraCapturePose = 1;
    v4->_cameraCapturePoseUIHint = 0;
    v4->_suppressionClientType = a3;
  }
  return v4;
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
  v6[3] = sub_18F206CB8;
  v6[4] = sub_18F206BEC;
  v6[5] = self;
  v3 = sub_18F204AE4();
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = sub_18F4B7E60;
  v5[3] = &unk_1E2956858;
  v5[4] = v6;
  sub_18F1F5E28(v3, (uint64_t)v5);
  v4.receiver = self;
  v4.super_class = (Class)CMSuppressionManager;
  -[CMSuppressionManager dealloc](&v4, sel_dealloc);
  _Block_object_dispose(v6, 8);
}

- (void)deallocPrivate
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
  const char *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;

  objc_msgSend_stopSuppressionUpdatesPrivate(self, a2, v2, v3, v4);
  objc_msgSend_stopViewObstructedStateUpdatesPrivate(self, v6, v7, v8, v9);
  objc_msgSend_stopCameraCapturePoseUpdatesPrivate(self, v10, v11, v12, v13);
  objc_msgSend_teardownPrivate(self->_internal, v14, v15, v16, v17);

}

- (void)connect
{
  id internal;
  uint64_t v3;
  void *__p[2];
  char v5;

  internal = self->_internal;
  if (!*((_QWORD *)internal + 27))
  {
    *((_QWORD *)internal + 28) = dispatch_queue_create("com.apple.CoreMotion.CMSuppressionManager", 0);
    v3 = operator new();
    sub_18F270374(__p, "com.apple.locationd.registration");
    MEMORY[0x19400100C](v3, __p, *((_QWORD *)internal + 28));
    *((_QWORD *)internal + 27) = v3;
    if (v5 < 0)
      operator delete(__p[0]);
    CLConnectionClient::setDefaultMessageHandler();
    CLConnectionClient::setInterruptionHandler();
    CLConnectionClient::start(*((CLConnectionClient **)internal + 27));
    dispatch_sync(*((dispatch_queue_t *)internal + 28), &unk_1E2959128);
  }
}

- (void)sendServiceRequestPrivate
{
  const char *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  _QWORD *internal;
  uint64_t v8;
  _BOOL8 v9;
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  const char *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  const char *v19;
  uint64_t v20;
  uint64_t v21;
  const char *v22;
  uint64_t v23;
  uint64_t v24;
  const char *v25;
  unint64_t *p_shared_owners;
  unint64_t v27;
  unint64_t *v28;
  unint64_t v29;
  std::__shared_weak_count *v30;
  unint64_t *v31;
  unint64_t v32;
  std::__shared_weak_count *v33;
  uint64_t v34;
  std::__shared_weak_count *v35;
  uint64_t v36;
  _QWORD v37[3];
  _QWORD v38[4];

  v38[3] = *MEMORY[0x1E0C80C00];
  sub_18F204AE4();
  sub_18F3DE6D4();
  objc_msgSend_connect(self, v3, v4, v5, v6);
  internal = self->_internal;
  v8 = *((unsigned __int8 *)internal + 232);
  v9 = (internal[42] & 0x18) != 0;
  v37[0] = CFSTR("CMEclipseServiceEnable");
  v38[0] = objc_msgSend_numberWithBool_(MEMORY[0x1E0CB37E8], v10, v8, v11, v12);
  v37[1] = CFSTR("CMSuppressionManagerClientType");
  v13 = (void *)MEMORY[0x1E0CB37E8];
  v18 = objc_msgSend_suppressionClientType(self, v14, v15, v16, v17);
  v38[1] = objc_msgSend_numberWithInteger_(v13, v19, v18, v20, v21);
  v37[2] = CFSTR("CMSuppressionManagerAlwaysOnViewObstructedRequested");
  v38[2] = objc_msgSend_numberWithBool_(MEMORY[0x1E0CB37E8], v22, v9, v23, v24);
  v36 = objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x1E0C99D80], v25, (uint64_t)v38, (uint64_t)v37, 3);
  sub_18F35C128("kCLConnectionMessageEclipseServiceRequest", &v36, &v34);
  v33 = v35;
  if (v35)
  {
    p_shared_owners = (unint64_t *)&v35->__shared_owners_;
    do
      v27 = __ldxr(p_shared_owners);
    while (__stxr(v27 + 1, p_shared_owners));
  }
  CLConnectionClient::sendMessage();
  if (v33)
  {
    v28 = (unint64_t *)&v33->__shared_owners_;
    do
      v29 = __ldaxr(v28);
    while (__stlxr(v29 - 1, v28));
    if (!v29)
    {
      ((void (*)(std::__shared_weak_count *))v33->__on_zero_shared)(v33);
      std::__shared_weak_count::__release_weak(v33);
    }
  }
  v30 = v35;
  if (v35)
  {
    v31 = (unint64_t *)&v35->__shared_owners_;
    do
      v32 = __ldaxr(v31);
    while (__stlxr(v32 - 1, v31));
    if (!v32)
    {
      ((void (*)(std::__shared_weak_count *))v30->__on_zero_shared)(v30);
      std::__shared_weak_count::__release_weak(v30);
    }
  }
}

- (void)sendViewObstructedRequestPrivate
{
  const char *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  const char *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  const char *v15;
  uint64_t v16;
  uint64_t v17;
  const char *v18;
  uint64_t v19;
  unint64_t *p_shared_owners;
  unint64_t v21;
  std::__shared_weak_count *v22;
  unint64_t *v23;
  unint64_t v24;
  std::__shared_weak_count *v25;
  unint64_t *v26;
  unint64_t v27;
  _QWORD v28[4];
  char v29;
  uint64_t v30;
  std::__shared_weak_count *v31;
  uint64_t v32;
  std::__shared_weak_count *v33;
  uint64_t v34;
  const __CFString *v35;
  _QWORD v36[2];

  v36[1] = *MEMORY[0x1E0C80C00];
  sub_18F204AE4();
  sub_18F3DE6D4();
  objc_msgSend_connect(self, v3, v4, v5, v6);
  v7 = *((unsigned __int8 *)self->_internal + 233);
  v35 = CFSTR("CMViewObstructedStateEnable");
  v36[0] = objc_msgSend_numberWithBool_(MEMORY[0x1E0CB37E8], v8, v7, v9, v10);
  v34 = objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x1E0C99D80], v11, (uint64_t)v36, (uint64_t)&v35, 1);
  sub_18F3C33B0("kCLConnectionMessageEclipseViewObstructedStateRequest", &v34, &v32);
  v12 = (void *)MEMORY[0x1E0C99E60];
  v13 = objc_opt_class();
  v14 = objc_opt_class();
  v19 = objc_msgSend_setWithObjects_(v12, v15, v13, v16, v17, v14, 0);
  v30 = v32;
  v31 = v33;
  if (v33)
  {
    p_shared_owners = (unint64_t *)&v33->__shared_owners_;
    do
      v21 = __ldxr(p_shared_owners);
    while (__stxr(v21 + 1, p_shared_owners));
  }
  v28[0] = MEMORY[0x1E0C809B0];
  v28[1] = 3221225472;
  v28[2] = sub_18F4B8B6C;
  v28[3] = &unk_1E2959148;
  v29 = v7;
  objc_msgSend_sendMessage_withReplyClasses_callback_(CMMotionUtils, v18, (uint64_t)&v30, v19, (uint64_t)v28);
  v22 = v31;
  if (v31)
  {
    v23 = (unint64_t *)&v31->__shared_owners_;
    do
      v24 = __ldaxr(v23);
    while (__stlxr(v24 - 1, v23));
    if (!v24)
    {
      ((void (*)(std::__shared_weak_count *))v22->__on_zero_shared)(v22);
      std::__shared_weak_count::__release_weak(v22);
    }
  }
  v25 = v33;
  if (v33)
  {
    v26 = (unint64_t *)&v33->__shared_owners_;
    do
      v27 = __ldaxr(v26);
    while (__stlxr(v27 - 1, v26));
    if (!v27)
    {
      ((void (*)(std::__shared_weak_count *))v25->__on_zero_shared)(v25);
      std::__shared_weak_count::__release_weak(v25);
    }
  }
}

- (void)startService
{
  uint64_t v3;
  _QWORD v4[5];

  v3 = sub_18F204AE4();
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = sub_18F4B9090;
  v4[3] = &unk_1E2955938;
  v4[4] = self;
  sub_18F1F6514(v3, (uint64_t)v4);
}

- (void)stopService
{
  uint64_t v3;
  _QWORD v4[5];

  v3 = sub_18F204AE4();
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = sub_18F4B940C;
  v4[3] = &unk_1E2955938;
  v4[4] = self;
  sub_18F1F6514(v3, (uint64_t)v4);
}

- (void)startSuppressionUpdatesToQueue:(id)a3 withHandler:(id)a4
{
  uint64_t v7;
  _QWORD v8[7];

  v7 = sub_18F204AE4();
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = sub_18F4B97A4;
  v8[3] = &unk_1E2955BD8;
  v8[4] = self;
  v8[5] = a3;
  v8[6] = a4;
  sub_18F1F6514(v7, (uint64_t)v8);
}

- (void)startSuppressionUpdatesToQueue:(id)a3 withOptions:(unint64_t)a4 withHandler:(id)a5
{
  uint64_t v9;
  _QWORD v10[8];

  v9 = sub_18F204AE4();
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = sub_18F4B9830;
  v10[3] = &unk_1E29568A8;
  v10[4] = self;
  v10[5] = a3;
  v10[6] = a5;
  v10[7] = a4;
  sub_18F1F6514(v9, (uint64_t)v10);
}

- (void)stopSuppressionUpdates
{
  uint64_t v3;
  _QWORD v4[5];

  v3 = sub_18F204AE4();
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = sub_18F4B9B18;
  v4[3] = &unk_1E2955938;
  v4[4] = self;
  sub_18F1F6514(v3, (uint64_t)v4);
}

- (void)didDetectSignificantUserInteraction
{
  uint64_t v3;
  _QWORD v4[5];

  if (qword_1EE16E8E0 != -1)
    dispatch_once(&qword_1EE16E8E0, &unk_1E2953948);
  if (qword_1EE16E8E8)
  {
    v3 = sub_18F204AE4();
    v4[0] = MEMORY[0x1E0C809B0];
    v4[1] = 3221225472;
    v4[2] = sub_18F4B9BB4;
    v4[3] = &unk_1E2955938;
    v4[4] = self;
    sub_18F1F6514(v3, (uint64_t)v4);
  }
}

- (void)startCameraCapturePoseUpdatesToQueue:(id)a3 withHandler:(id)a4
{
  NSObject *v7;
  uint64_t v8;
  char *v9;
  _QWORD v10[7];
  __int16 v11;
  uint8_t buf[1640];
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  if (qword_1EE16D438 != -1)
    dispatch_once(&qword_1EE16D438, &unk_1E2954C28);
  v7 = off_1EE16D428;
  if (os_log_type_enabled((os_log_t)off_1EE16D428, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_18F1DC000, v7, OS_LOG_TYPE_DEFAULT, "Starting CameraCapturePose updates", buf, 2u);
  }
  if (sub_18F1FCA08(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_1EE16D438 != -1)
      dispatch_once(&qword_1EE16D438, &unk_1E2954C28);
    v11 = 0;
    v9 = (char *)_os_log_send_and_compose_impl();
    sub_18F419700("Generic", 1, 0, 2, "-[CMSuppressionManager startCameraCapturePoseUpdatesToQueue:withHandler:]", "CoreLocation: %s\n", v9);
    if (v9 != (char *)buf)
      free(v9);
  }
  v8 = sub_18F204AE4();
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = sub_18F4B9FB0;
  v10[3] = &unk_1E2955BD8;
  v10[4] = self;
  v10[5] = a3;
  v10[6] = a4;
  sub_18F1F6514(v8, (uint64_t)v10);
}

- (void)stopCameraCapturePoseUpdates
{
  NSObject *v3;
  uint64_t v4;
  char *v5;
  _QWORD v6[5];
  __int16 v7;
  uint8_t buf[1640];
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  if (qword_1EE16D438 != -1)
    dispatch_once(&qword_1EE16D438, &unk_1E2954C28);
  v3 = off_1EE16D428;
  if (os_log_type_enabled((os_log_t)off_1EE16D428, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_18F1DC000, v3, OS_LOG_TYPE_DEFAULT, "Stopping CameraCapturePose updates", buf, 2u);
  }
  if (sub_18F1FCA08(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_1EE16D438 != -1)
      dispatch_once(&qword_1EE16D438, &unk_1E2954C28);
    v7 = 0;
    v5 = (char *)_os_log_send_and_compose_impl();
    sub_18F419700("Generic", 1, 0, 2, "-[CMSuppressionManager stopCameraCapturePoseUpdates]", "CoreLocation: %s\n", v5);
    if (v5 != (char *)buf)
      free(v5);
  }
  v4 = sub_18F204AE4();
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = sub_18F4BA18C;
  v6[3] = &unk_1E2955938;
  v6[4] = self;
  sub_18F1F6514(v4, (uint64_t)v6);
}

- (void)simulateSignificantUserInteraction
{
  NSObject *v2;
  uint64_t v3;
  char *v4;
  uint8_t buf[1640];
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  if (qword_1EE16D438 != -1)
    dispatch_once(&qword_1EE16D438, &unk_1E2954C28);
  v2 = off_1EE16D428;
  if (os_log_type_enabled((os_log_t)off_1EE16D428, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_18F1DC000, v2, OS_LOG_TYPE_DEFAULT, "Simulated significant user interaction detected", buf, 2u);
  }
  if (sub_18F1FCA08(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_1EE16D438 != -1)
      dispatch_once(&qword_1EE16D438, &unk_1E2954C28);
    v4 = (char *)_os_log_send_and_compose_impl();
    sub_18F419700("Generic", 1, 0, 2, "-[CMSuppressionManager simulateSignificantUserInteraction]", "CoreLocation: %s\n", v4);
    if (v4 != (char *)buf)
      free(v4);
  }
  if (qword_1EE16E8E0 != -1)
    dispatch_once(&qword_1EE16E8E0, &unk_1E2953948);
  if (qword_1EE16E8E8)
  {
    v3 = sub_18F204AE4();
    sub_18F1F6514(v3, (uint64_t)&unk_1E2955368);
  }
}

- (id)viewObstructedBlocking
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  id v6;
  NSObject *v7;
  char *v9;
  _QWORD v10[5];
  __int16 v11;
  uint8_t buf[8];
  uint8_t *v13;
  uint64_t v14;
  void (*v15)(uint64_t, uint64_t);
  void (*v16)(uint64_t);
  uint64_t v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  if ((objc_msgSend_isAvailable(CMSuppressionManager, a2, v2, v3, v4) & 1) != 0)
  {
    *(_QWORD *)buf = 0;
    v13 = buf;
    v14 = 0x3052000000;
    v15 = sub_18F206CB8;
    v16 = sub_18F206BEC;
    v17 = 0;
    v5 = sub_18F204AE4();
    v10[0] = MEMORY[0x1E0C809B0];
    v10[1] = 3221225472;
    v10[2] = sub_18F4BA5E4;
    v10[3] = &unk_1E2956858;
    v10[4] = buf;
    sub_18F1F5E28(v5, (uint64_t)v10);
    v6 = *((id *)v13 + 5);
    _Block_object_dispose(buf, 8);
  }
  else
  {
    if (qword_1EE16D438 != -1)
      dispatch_once(&qword_1EE16D438, &unk_1E2954C28);
    v7 = off_1EE16D428;
    if (os_log_type_enabled((os_log_t)off_1EE16D428, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_18F1DC000, v7, OS_LOG_TYPE_ERROR, "Suppression is not supported on this hardware.", buf, 2u);
    }
    if (sub_18F1FCA08(115, 0))
    {
      bzero(buf, 0x65CuLL);
      if (qword_1EE16D438 != -1)
        dispatch_once(&qword_1EE16D438, &unk_1E2954C28);
      v11 = 0;
      v9 = (char *)_os_log_send_and_compose_impl();
      sub_18F419700("Generic", 1, 0, 0, "-[CMSuppressionManager viewObstructedBlocking]", "CoreLocation: %s\n", v9);
      if (v9 != (char *)buf)
        free(v9);
    }
    return 0;
  }
  return v6;
}

- (void)sendSuppressionEventToClientPrivate
{
  id internal;
  uint64_t v4;
  double v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  double v11;
  CMSuppressionEvent *v12;
  const char *v13;
  void *FacedownStatic;
  NSObject *v15;
  const char *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  const char *v23;
  uint64_t v24;
  uint64_t v25;
  void *v26;
  uint64_t v27;
  const char *v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  char *v35;
  _QWORD v36[6];
  int v37;
  uint64_t v38;
  __int16 v39;
  uint64_t v40;
  __int16 v41;
  void *v42;
  __int16 v43;
  double v44;
  uint8_t buf[4];
  uint64_t v46;
  __int16 v47;
  uint64_t v48;
  __int16 v49;
  void *v50;
  __int16 v51;
  double v52;
  uint64_t v53;

  v53 = *MEMORY[0x1E0C80C00];
  sub_18F204AE4();
  sub_18F3DE6D4();
  internal = self->_internal;
  if (*((_QWORD *)internal + 7))
  {
    v4 = MEMORY[0x194001B4C]();
    if ((unint64_t)(*((_QWORD *)internal + 2) - 1) > 1
      || !*((_QWORD *)internal + 3)
      || (v5 = *((double *)internal + 1), v5 == 0.0))
    {
      __assert_rtn("-[CMSuppressionManager sendSuppressionEventToClientPrivate]", "CMSuppressionManager.mm", 492, "internal->fCurrentSuppressionEvent.isInitialized()");
    }
    v6 = (void *)v4;
    v7 = *((_QWORD *)internal + 42);
    if ((v7 & 0xF) != 0)
      v8 = *((_QWORD *)internal + 2);
    else
      v8 = 0;
    if ((v7 & 0xF) != 0)
      v9 = *((_QWORD *)internal + 3);
    else
      v9 = 0;
    if ((v7 & 0x10) != 0)
    {
      v10 = *((_QWORD *)internal + 4);
      v11 = *((double *)internal + 5);
    }
    else
    {
      v10 = 0;
      v11 = 10000.0;
    }
    v12 = [CMSuppressionEvent alloc];
    FacedownStatic = (void *)objc_msgSend_initWithEventType_reason_facedownState_timestamp_timeSinceLastFacedownStatic_(v12, v13, v8, v9, v10, v5, v11);
    if (qword_1EE16D438 != -1)
      dispatch_once(&qword_1EE16D438, &unk_1E2954C28);
    v15 = off_1EE16D428;
    if (os_log_type_enabled((os_log_t)off_1EE16D428, OS_LOG_TYPE_DEFAULT))
    {
      v20 = objc_msgSend_suppressionClientType(self, v16, v17, v18, v19);
      v21 = *((_QWORD *)internal + 43);
      v22 = mach_absolute_time();
      *(_DWORD *)buf = 134349826;
      v46 = v20;
      v47 = 2114;
      v48 = v21;
      v49 = 2114;
      v50 = FacedownStatic;
      v51 = 2050;
      v52 = sub_18F1FD20C(v22);
      _os_log_impl(&dword_18F1DC000, v15, OS_LOG_TYPE_DEFAULT, "[%{public}ld][%{public}@] Sending to client: %{public}@,now,%{public}f", buf, 0x2Au);
    }
    if (sub_18F1FCA08(115, 2))
    {
      bzero(buf, 0x65CuLL);
      if (qword_1EE16D438 != -1)
        dispatch_once(&qword_1EE16D438, &unk_1E2954C28);
      v32 = objc_msgSend_suppressionClientType(self, v28, v29, v30, v31);
      v33 = *((_QWORD *)internal + 43);
      v34 = mach_absolute_time();
      v37 = 134349826;
      v38 = v32;
      v39 = 2114;
      v40 = v33;
      v41 = 2114;
      v42 = FacedownStatic;
      v43 = 2050;
      v44 = sub_18F1FD20C(v34);
      v35 = (char *)_os_log_send_and_compose_impl();
      sub_18F419700("Generic", 1, 0, 2, "-[CMSuppressionManager sendSuppressionEventToClientPrivate]", "CoreLocation: %s\n", v35);
      if (v35 != (char *)buf)
        free(v35);
    }
    v27 = *((_QWORD *)internal + 6);
    v26 = (void *)*((_QWORD *)internal + 7);
    v36[0] = MEMORY[0x1E0C809B0];
    v36[1] = 3221225472;
    v36[2] = sub_18F4BA9C0;
    v36[3] = &unk_1E2955B60;
    v36[4] = FacedownStatic;
    v36[5] = v27;
    objc_msgSend_addOperationWithBlock_(v26, v23, (uint64_t)v36, v24, v25);

    objc_autoreleasePoolPop(v6);
  }
}

- (void)onEclipseData:(const Suppress *)a3
{
  NSObject *v5;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  int fLux_low;
  uint64_t v12;
  const char *v13;
  uint64_t v14;
  NSObject *v15;
  const char *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  char *v20;
  char *v21;
  uint8_t buf[4];
  uint64_t v23;
  __int16 v24;
  int v25;
  __int16 v26;
  uint64_t v27;
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  if (a3)
  {
    if (qword_1EE16D438 != -1)
      dispatch_once(&qword_1EE16D438, &unk_1E2954C28);
    v5 = off_1EE16D428;
    if (os_log_type_enabled((os_log_t)off_1EE16D428, OS_LOG_TYPE_INFO))
    {
      v10 = objc_msgSend_suppressionClientType(self, v6, v7, v8, v9);
      fLux_low = LOBYTE(a3->fLux);
      v12 = *(_QWORD *)&a3->fType;
      *(_DWORD *)buf = 134349568;
      v23 = v10;
      v24 = 1026;
      v25 = fLux_low;
      v26 = 2050;
      v27 = v12;
      _os_log_impl(&dword_18F1DC000, v5, OS_LOG_TYPE_INFO, "[%{public}ld] Incoming view obstructed event, shouldSuppress,%{public}u, timestampSecs,%{public}f", buf, 0x1Cu);
    }
    if (sub_18F1FCA08(115, 2))
    {
      bzero(buf, 0x65CuLL);
      if (qword_1EE16D438 != -1)
        dispatch_once(&qword_1EE16D438, &unk_1E2954C28);
      objc_msgSend_suppressionClientType(self, v16, v17, v18, v19);
      v20 = (char *)_os_log_send_and_compose_impl();
      sub_18F419700("Generic", 1, 0, 2, "-[CMSuppressionManager onEclipseData:]", "CoreLocation: %s\n", v20);
      if (v20 != (char *)buf)
        free(v20);
    }
    if (LOBYTE(a3->fLux))
      v14 = 1;
    else
      v14 = 2;
    if (BYTE1(a3->fLux))
      objc_msgSend_feedViewObstructedEvent_facedown_timeSinceLastFacedownStatic_timestamp_force_(self, v13, v14, 1, 0, *(double *)&a3->fFacedownStatic, *(double *)&a3->fType);
    else
      objc_msgSend_feedViewObstructedEvent_facedown_timeSinceLastFacedownStatic_timestamp_force_(self, v13, v14, 2, 0, *(double *)&a3->fFacedownStatic, *(double *)&a3->fType);
  }
  else
  {
    if (qword_1EE16D438 != -1)
      dispatch_once(&qword_1EE16D438, &unk_1E2954C28);
    v15 = off_1EE16D428;
    if (os_log_type_enabled((os_log_t)off_1EE16D428, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_18F1DC000, v15, OS_LOG_TYPE_ERROR, "Invalid data parameter!", buf, 2u);
    }
    if (sub_18F1FCA08(115, 0))
    {
      bzero(buf, 0x65CuLL);
      if (qword_1EE16D438 != -1)
        dispatch_once(&qword_1EE16D438, &unk_1E2954C28);
      v21 = (char *)_os_log_send_and_compose_impl();
      sub_18F419700("Generic", 1, 0, 0, "-[CMSuppressionManager onEclipseData:]", "CoreLocation: %s\n", v21);
      if (v21 != (char *)buf)
        free(v21);
    }
  }
}

- (void)onNotification:(id)a3
{
  uint64_t v3;
  uint64_t v4;
  void *v7;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  const char *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  const char *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  const char *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  BOOL v25;
  NSObject *v26;
  void *v27;
  const char *v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  int v32;
  uint64_t v33;
  NSObject *v34;
  const char *v35;
  uint64_t v36;
  uint64_t v37;
  const char *v38;
  uint64_t v39;
  uint64_t v40;
  NSObject *v41;
  NSObject *v42;
  char *v43;
  uint64_t v44;
  double v45;
  const char *v46;
  uint64_t v47;
  double v48;
  const char *v49;
  uint64_t v50;
  uint64_t v51;
  double v52;
  const char *v53;
  uint64_t v54;
  const char *v55;
  uint64_t v56;
  uint64_t v57;
  const char *v58;
  uint64_t v59;
  uint64_t v60;
  char *v61;
  uint8_t buf[4];
  uint64_t v63;
  __int16 v64;
  uint64_t v65;
  uint64_t v66;

  v66 = *MEMORY[0x1E0C80C00];
  v7 = (void *)objc_msgSend_userInfo(a3, a2, (uint64_t)a3, v3, v4);
  v11 = (void *)objc_msgSend_objectForKeyedSubscript_(v7, v8, (uint64_t)CFSTR("CMSuppressionEventTypeKey"), v9, v10);
  v16 = (void *)objc_msgSend_userInfo(a3, v12, v13, v14, v15);
  v20 = objc_msgSend_objectForKeyedSubscript_(v16, v17, (uint64_t)CFSTR("CMSuppressionEventReasonKey"), v18, v19);
  if (v11)
    v25 = v20 == 0;
  else
    v25 = 1;
  if (v25)
  {
    if (qword_1EE16D438 != -1)
      dispatch_once(&qword_1EE16D438, &unk_1E2954C28);
    v26 = off_1EE16D428;
    if (os_log_type_enabled((os_log_t)off_1EE16D428, OS_LOG_TYPE_FAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_18F1DC000, v26, OS_LOG_TYPE_FAULT, "Invalid notification payload!", buf, 2u);
    }
    if (!sub_18F1FCA08(115, 0))
      return;
    bzero(buf, 0x65CuLL);
    if (qword_1EE16D438 == -1)
    {
LABEL_37:
      v43 = (char *)_os_log_send_and_compose_impl();
      sub_18F419700("Generic", 1, 0, 0, "-[CMSuppressionManager onNotification:]", "CoreLocation: %s\n", v43);
      if (v43 != (char *)buf)
        free(v43);
      return;
    }
LABEL_47:
    dispatch_once(&qword_1EE16D438, &unk_1E2954C28);
    goto LABEL_37;
  }
  v27 = (void *)v20;
  v32 = objc_msgSend_intValue(v11, v21, v22, v23, v24);
  v33 = objc_msgSend_unsignedIntValue(v27, v28, v29, v30, v31);
  if (qword_1EE16D438 != -1)
    dispatch_once(&qword_1EE16D438, &unk_1E2954C28);
  v34 = off_1EE16D428;
  if (os_log_type_enabled((os_log_t)off_1EE16D428, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138543618;
    v63 = objc_msgSend_stringForEventType_(CMSuppressionEvent, v35, v32, v36, v37);
    v64 = 2114;
    v65 = objc_msgSend_stringForEventReason_(CMSuppressionEvent, v38, v33, v39, v40);
    _os_log_impl(&dword_18F1DC000, v34, OS_LOG_TYPE_INFO, "Incoming suppression notification: %{public}@ (%{public}@)", buf, 0x16u);
  }
  if (sub_18F1FCA08(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_1EE16D438 != -1)
      dispatch_once(&qword_1EE16D438, &unk_1E2954C28);
    objc_msgSend_stringForEventType_(CMSuppressionEvent, v55, v32, v56, v57);
    objc_msgSend_stringForEventReason_(CMSuppressionEvent, v58, v33, v59, v60);
    v61 = (char *)_os_log_send_and_compose_impl();
    sub_18F419700("Generic", 1, 0, 2, "-[CMSuppressionManager onNotification:]", "CoreLocation: %s\n", v61);
    if (v61 != (char *)buf)
      free(v61);
  }
  if ((v32 - 1) >= 2)
  {
    if (qword_1EE16D438 != -1)
      dispatch_once(&qword_1EE16D438, &unk_1E2954C28);
    v41 = off_1EE16D428;
    if (os_log_type_enabled((os_log_t)off_1EE16D428, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)buf = 134349056;
      v63 = v32;
      _os_log_impl(&dword_18F1DC000, v41, OS_LOG_TYPE_FAULT, "Notification event type %{public}lu is invalid!", buf, 0xCu);
    }
    if (!sub_18F1FCA08(115, 0))
      return;
    bzero(buf, 0x65CuLL);
    if (qword_1EE16D438 == -1)
      goto LABEL_37;
    goto LABEL_47;
  }
  if ((v33 & 7) != 0)
  {
    if ((v33 & 1) != 0)
    {
      v44 = mach_absolute_time();
      v45 = sub_18F1FD20C(v44);
      objc_msgSend_feedViewObstructedEvent_facedown_timeSinceLastFacedownStatic_timestamp_force_(self, v46, v32, 2, 0, 0.0, v45);
      if ((v33 & 2) == 0)
      {
LABEL_22:
        if ((v33 & 4) == 0)
          return;
LABEL_41:
        v51 = mach_absolute_time();
        v52 = sub_18F1FD20C(v51);
        objc_msgSend_feedDevicePresenceEvent_timestamp_force_(self, v53, v32, 0, v54, v52);
        return;
      }
    }
    else if ((v33 & 2) == 0)
    {
      goto LABEL_22;
    }
    v47 = mach_absolute_time();
    v48 = sub_18F1FD20C(v47);
    objc_msgSend_feedSmartPowerNapEvent_timestamp_force_(self, v49, v32, 0, v50, v48);
    if ((v33 & 4) == 0)
      return;
    goto LABEL_41;
  }
  if (qword_1EE16D438 != -1)
    dispatch_once(&qword_1EE16D438, &unk_1E2954C28);
  v42 = off_1EE16D428;
  if (os_log_type_enabled((os_log_t)off_1EE16D428, OS_LOG_TYPE_FAULT))
  {
    *(_DWORD *)buf = 134349056;
    v63 = v33;
    _os_log_impl(&dword_18F1DC000, v42, OS_LOG_TYPE_FAULT, "Notification event reason %{public}lu is invalid!", buf, 0xCu);
  }
  if (sub_18F1FCA08(115, 0))
  {
    bzero(buf, 0x65CuLL);
    if (qword_1EE16D438 == -1)
      goto LABEL_37;
    goto LABEL_47;
  }
}

- (void)updateCurrentSuppressionEvent:(int64_t)a3 timestamp:(double)a4 reason:(unint64_t)a5 facedownState:(unint64_t)a6 timeSinceLastFacedownStatic:(double)a7
{
  double *internal;
  NSObject *v14;
  const char *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  const char *v21;
  uint64_t v22;
  uint64_t v23;
  const char *v24;
  uint64_t v25;
  uint64_t v26;
  const char *v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  const char *v31;
  uint64_t v32;
  uint64_t v33;
  const char *v34;
  uint64_t v35;
  uint64_t v36;
  char *v37;
  uint8_t buf[4];
  uint64_t v39;
  __int16 v40;
  uint64_t v41;
  __int16 v42;
  uint64_t v43;
  __int16 v44;
  uint64_t v45;
  __int16 v46;
  double v47;
  uint64_t v48;

  v48 = *MEMORY[0x1E0C80C00];
  sub_18F204AE4();
  sub_18F3DE6D4();
  internal = (double *)self->_internal;
  if (qword_1EE16D438 != -1)
    dispatch_once(&qword_1EE16D438, &unk_1E2954C28);
  v14 = off_1EE16D428;
  if (os_log_type_enabled((os_log_t)off_1EE16D428, OS_LOG_TYPE_DEFAULT))
  {
    v19 = objc_msgSend_suppressionClientType(self, v15, v16, v17, v18);
    v20 = *((_QWORD *)internal + 43);
    *(_DWORD *)buf = 134350082;
    v39 = v19;
    v40 = 2114;
    v41 = v20;
    v42 = 2114;
    v43 = objc_msgSend_stringForEventType_(CMSuppressionEvent, v21, a3, v22, v23);
    v44 = 2114;
    v45 = objc_msgSend_stringForEventReason_(CMSuppressionEvent, v24, a5, v25, v26);
    v46 = 2050;
    v47 = a4;
    _os_log_impl(&dword_18F1DC000, v14, OS_LOG_TYPE_DEFAULT, "[%{public}ld][%{public}@] ==== Updating current suppression event: %{public}@ (%{public}@) @ %{public}f", buf, 0x34u);
  }
  if (sub_18F1FCA08(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_1EE16D438 != -1)
      dispatch_once(&qword_1EE16D438, &unk_1E2954C28);
    objc_msgSend_suppressionClientType(self, v27, v28, v29, v30);
    objc_msgSend_stringForEventType_(CMSuppressionEvent, v31, a3, v32, v33);
    objc_msgSend_stringForEventReason_(CMSuppressionEvent, v34, a5, v35, v36);
    v37 = (char *)_os_log_send_and_compose_impl();
    sub_18F419700("Generic", 1, 0, 2, "-[CMSuppressionManager updateCurrentSuppressionEvent:timestamp:reason:facedownState:timeSinceLastFacedownStatic:]", "CoreLocation: %s\n", v37);
    if (v37 != (char *)buf)
      free(v37);
  }
  internal[1] = a4;
  *((_QWORD *)internal + 2) = a3;
  *((_QWORD *)internal + 3) = a5;
  *((_QWORD *)internal + 4) = a6;
  internal[5] = a7;
}

- (CMSuppressionEventStruct)currentSuppressionEvent
{
  uint64_t v5;
  uint64_t *v6;
  __int128 v7;
  CMSuppressionEventStruct *result;
  _QWORD v9[6];
  uint64_t v10;
  uint64_t *v11;
  uint64_t v12;
  __n128 (*v13)(uint64_t, uint64_t);
  uint64_t (*v14)();
  void *v15;
  __int128 v16;
  __int128 v17;
  uint64_t v18;

  v10 = 0;
  v11 = &v10;
  v13 = sub_18F4BB6F4;
  v14 = nullsub_180;
  v12 = 0x5812000000;
  v15 = &unk_18F58364E;
  v16 = 0u;
  v17 = 0u;
  v18 = 0;
  v5 = sub_18F204AE4();
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = sub_18F4BB70C;
  v9[3] = &unk_1E2956C30;
  v9[4] = self;
  v9[5] = &v10;
  sub_18F1F5E28(v5, (uint64_t)v9);
  v6 = v11;
  v7 = *((_OWORD *)v11 + 4);
  *(_OWORD *)&retstr->timestamp = *((_OWORD *)v11 + 3);
  *(_OWORD *)&retstr->reason = v7;
  *(_QWORD *)&retstr->timeSinceLastFacedownStatic = v6[10];
  _Block_object_dispose(&v10, 8);
  return result;
}

- (void)feedViewObstructedEvent:(int64_t)a3 facedown:(unint64_t)a4 timeSinceLastFacedownStatic:(double)a5 timestamp:(double)a6 force:(BOOL)a7
{
  uint64_t v13;
  _QWORD v14[9];
  BOOL v15;

  v13 = sub_18F204AE4();
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = sub_18F4BB7C4;
  v14[3] = &unk_1E2959170;
  v15 = a7;
  v14[4] = self;
  v14[5] = a3;
  *(double *)&v14[6] = a6;
  v14[7] = a4;
  *(double *)&v14[8] = a5;
  sub_18F1F6514(v13, (uint64_t)v14);
}

- (void)feedSmartPowerNapEvent:(int64_t)a3 timestamp:(double)a4 force:(BOOL)a5
{
  uint64_t v9;
  _QWORD v10[7];
  BOOL v11;

  v9 = sub_18F204AE4();
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = sub_18F4BBE00;
  v10[3] = &unk_1E2959198;
  v11 = a5;
  v10[4] = self;
  v10[5] = a3;
  *(double *)&v10[6] = a4;
  sub_18F1F6514(v9, (uint64_t)v10);
}

- (void)feedDevicePresenceEvent:(int64_t)a3 timestamp:(double)a4 force:(BOOL)a5
{
  uint64_t v9;
  _QWORD v10[7];
  BOOL v11;

  v9 = sub_18F204AE4();
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = sub_18F4BC608;
  v10[3] = &unk_1E2959198;
  v11 = a5;
  v10[4] = self;
  v10[5] = a3;
  *(double *)&v10[6] = a4;
  sub_18F1F6514(v9, (uint64_t)v10);
}

- (void)updateSuppressionStateAndSendToClient
{
  id internal;
  uint64_t v4;
  uint64_t v5;
  double v6;
  void **p_vtable;
  NSObject *v8;
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  const char *v15;
  uint64_t v16;
  uint64_t v17;
  const char *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  unint64_t v22;
  double v23;
  uint64_t v24;
  unint64_t v25;
  double v26;
  uint64_t v27;
  double v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  NSObject *v32;
  const char *v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  const char *v37;
  uint64_t v38;
  uint64_t v39;
  CMSuppressionManager *v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  const char *v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  const char *v48;
  NSObject *v49;
  const char *v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  void **v55;
  uint64_t v56;
  const char *v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  const char *v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  const char *v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t v68;
  const char *v69;
  uint64_t v70;
  uint64_t v71;
  const char *v72;
  uint64_t v73;
  uint64_t v74;
  char *v75;
  const char *v76;
  uint64_t v77;
  uint64_t v78;
  uint64_t v79;
  const char *v80;
  uint64_t v81;
  uint64_t v82;
  uint64_t v83;
  const char *v84;
  uint64_t v85;
  uint64_t v86;
  const char *v87;
  uint64_t v88;
  uint64_t v89;
  char *v90;
  const char *v91;
  uint64_t v92;
  uint64_t v93;
  uint64_t v94;
  const char *v95;
  uint64_t v96;
  uint64_t v97;
  const char *v98;
  uint64_t v99;
  uint64_t v100;
  char *v101;
  uint64_t v102;
  uint64_t v103;
  uint8_t buf[4];
  uint64_t v105;
  __int16 v106;
  uint64_t v107;
  __int16 v108;
  uint64_t v109;
  __int16 v110;
  uint64_t v111;
  __int16 v112;
  double v113;
  uint64_t v114;

  v114 = *MEMORY[0x1E0C80C00];
  sub_18F204AE4();
  sub_18F3DE6D4();
  internal = self->_internal;
  v5 = *((_QWORD *)internal + 2);
  v4 = *((_QWORD *)internal + 3);
  v6 = *((double *)internal + 1);
  p_vtable = &OBJC_METACLASS___CMCardioFitnessSummary.vtable;
  if (qword_1EE16D438 != -1)
    dispatch_once(&qword_1EE16D438, &unk_1E2954C28);
  v8 = off_1EE16D428;
  if (os_log_type_enabled((os_log_t)off_1EE16D428, OS_LOG_TYPE_INFO))
  {
    v13 = objc_msgSend_suppressionClientType(self, v9, v10, v11, v12);
    v14 = *((_QWORD *)internal + 43);
    *(_DWORD *)buf = 134350082;
    v105 = v13;
    v106 = 2114;
    v107 = v14;
    v108 = 2114;
    v109 = objc_msgSend_stringForEventType_(CMSuppressionEvent, v15, v5, v16, v17);
    v110 = 2114;
    v111 = objc_msgSend_stringForEventReason_(CMSuppressionEvent, v18, v4, v19, v20);
    v112 = 2050;
    v113 = v6;
    _os_log_impl(&dword_18F1DC000, v8, OS_LOG_TYPE_INFO, "[%{public}ld][%{public}@] Previous: %{public}@ (%{public}@) @ %{public}f", buf, 0x34u);
  }
  if (sub_18F1FCA08(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_1EE16D438 != -1)
      dispatch_once(&qword_1EE16D438, &unk_1E2954C28);
    objc_msgSend_suppressionClientType(self, v80, v81, v82, v83);
    objc_msgSend_stringForEventType_(CMSuppressionEvent, v84, v5, v85, v86);
    objc_msgSend_stringForEventReason_(CMSuppressionEvent, v87, v4, v88, v89);
    v90 = (char *)_os_log_send_and_compose_impl();
    sub_18F419700("Generic", 1, 0, 2, "-[CMSuppressionManager updateSuppressionStateAndSendToClient]", "CoreLocation: %s\n", v90);
    if (v90 != (char *)buf)
      free(v90);
  }
  v21 = *((_QWORD *)internal + 10);
  if (v21 != 1)
  {
    v22 = v4 & 0xFFFFFFFFFFFFFFFELL;
    goto LABEL_10;
  }
  v22 = v4 | 1;
  v23 = *((double *)internal + 9);
  if (v23 <= 0.0)
LABEL_10:
    v23 = 0.0;
  v24 = *((_QWORD *)internal + 16);
  if (v24 != 1)
  {
    v25 = v22 & 0xFFFFFFFFFFFFFFFDLL;
    goto LABEL_15;
  }
  v25 = v22 | 2;
  v26 = *((double *)internal + 15);
  if (v26 <= v23)
LABEL_15:
    v26 = v23;
  v27 = *((_QWORD *)internal + 12);
  v28 = *((double *)internal + 13);
  v29 = *((_QWORD *)internal + 21);
  if (v29 == 1)
  {
    v30 = v25 | 4;
    if (*((double *)internal + 20) > v26)
      v26 = *((double *)internal + 20);
    v31 = 1;
  }
  else
  {
    v30 = v25 & 0xFFFFFFFFFFFFFFFBLL;
    v31 = 1;
    if (v21 != 1 && v24 != 1)
    {
      if (v21 == 2 && *((double *)internal + 9) > v26)
      {
        v30 = 1;
        v26 = *((double *)internal + 9);
      }
      if (v24 == 2 && *((double *)internal + 15) > v26)
      {
        v30 = 2;
        v26 = *((double *)internal + 15);
      }
      if (v29 == 2 && *((double *)internal + 20) > v26)
      {
        v30 = 4;
        v26 = *((double *)internal + 20);
      }
      if (v26 == 0.0)
        __assert_rtn("-[CMSuppressionManager updateSuppressionStateAndSendToClient]", "CMSuppressionManager.mm", 787, "nextTimestamp != 0.");
      v31 = 2;
    }
  }
  if (qword_1EE16D438 != -1)
    dispatch_once(&qword_1EE16D438, &unk_1E2954C28);
  v32 = off_1EE16D428;
  if (os_log_type_enabled((os_log_t)off_1EE16D428, OS_LOG_TYPE_INFO))
  {
    v102 = objc_msgSend_suppressionClientType(self, v33, v34, v35, v36);
    v103 = *((_QWORD *)internal + 43);
    v40 = self;
    v41 = v4;
    v42 = v5;
    v43 = objc_msgSend_stringForEventType_(CMSuppressionEvent, v37, v31, v38, v39);
    v47 = objc_msgSend_stringForEventReason_(CMSuppressionEvent, v44, v30, v45, v46);
    *(_DWORD *)buf = 134350082;
    v105 = v102;
    v106 = 2114;
    v107 = v103;
    p_vtable = &OBJC_METACLASS___CMCardioFitnessSummary.vtable;
    v108 = 2114;
    v109 = v43;
    v5 = v42;
    v4 = v41;
    self = v40;
    v110 = 2114;
    v111 = v47;
    v112 = 2050;
    v113 = v26;
    _os_log_impl(&dword_18F1DC000, v32, OS_LOG_TYPE_INFO, "[%{public}ld][%{public}@] Next: %{public}@ (%{public}@) @ %{public}f", buf, 0x34u);
  }
  if (sub_18F1FCA08(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_1EE16D438 != -1)
      dispatch_once(&qword_1EE16D438, &unk_1E2954C28);
    objc_msgSend_suppressionClientType(self, v91, v92, v93, v94);
    objc_msgSend_stringForEventType_(CMSuppressionEvent, v95, v31, v96, v97);
    objc_msgSend_stringForEventReason_(CMSuppressionEvent, v98, v30, v99, v100);
    v101 = (char *)_os_log_send_and_compose_impl();
    sub_18F419700("Generic", 1, 0, 2, "-[CMSuppressionManager updateSuppressionStateAndSendToClient]", "CoreLocation: %s\n", v101);
    if (v101 != (char *)buf)
      free(v101);
    p_vtable = (void **)(&OBJC_METACLASS___CMCardioFitnessSummary + 24);
  }
  if (v31 == v5 && v30 == v4)
  {
    if (p_vtable[135] != (void *)-1)
      dispatch_once(&qword_1EE16D438, &unk_1E2954C28);
    v49 = off_1EE16D428;
    if (os_log_type_enabled((os_log_t)off_1EE16D428, OS_LOG_TYPE_INFO))
    {
      v54 = objc_msgSend_suppressionClientType(self, v50, v51, v52, v53);
      v55 = p_vtable;
      v56 = *((_QWORD *)internal + 43);
      v60 = objc_msgSend_stringForEventType_(CMSuppressionEvent, v57, v5, v58, v59);
      v64 = objc_msgSend_stringForEventReason_(CMSuppressionEvent, v61, v4, v62, v63);
      *(_DWORD *)buf = 134350082;
      v105 = v54;
      v106 = 2114;
      v107 = v56;
      p_vtable = v55;
      v108 = 2114;
      v109 = v60;
      v110 = 2114;
      v111 = v64;
      v112 = 2050;
      v113 = v6;
      _os_log_impl(&dword_18F1DC000, v49, OS_LOG_TYPE_INFO, "[%{public}ld][%{public}@] No Transition: %{public}@ (%{public}@) @ %{public}f", buf, 0x34u);
    }
    if (sub_18F1FCA08(115, 2))
    {
      bzero(buf, 0x65CuLL);
      if (p_vtable[135] != (void *)-1)
        dispatch_once(&qword_1EE16D438, &unk_1E2954C28);
      objc_msgSend_suppressionClientType(self, v65, v66, v67, v68);
      objc_msgSend_stringForEventType_(CMSuppressionEvent, v69, v5, v70, v71);
      objc_msgSend_stringForEventReason_(CMSuppressionEvent, v72, v4, v73, v74);
      v75 = (char *)_os_log_send_and_compose_impl();
      sub_18F419700("Generic", 1, 0, 2, "-[CMSuppressionManager updateSuppressionStateAndSendToClient]", "CoreLocation: %s\n", v75);
      if (v75 != (char *)buf)
        free(v75);
    }
  }
  else
  {
    objc_msgSend_updateCurrentSuppressionEvent_timestamp_reason_facedownState_timeSinceLastFacedownStatic_(self, v48, v31, v30, v27, v26, v28);
    objc_msgSend_sendSuppressionEventToClientPrivate(self, v76, v77, v78, v79);
  }
}

- (void)startSuppressionUpdatesPrivateToQueue:(id)a3 withOptions:(unint64_t)a4 withHandler:(id)a5
{
  id internal;
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  const char *v13;
  id v14;
  id v15;
  const char *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  const char *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  _QWORD *v24;
  _QWORD *v25;
  uint64_t v26;
  NSObject *v27;
  id v28;
  const char *v29;
  uint64_t v30;
  uint64_t v31;
  void *v32;
  const char *v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  const char *v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  void *v41;
  const char *v42;
  _QWORD v43[6];

  sub_18F204AE4();
  sub_18F3DE6D4();
  internal = self->_internal;
  if (objc_msgSend_isAvailable(CMSuppressionManager, v9, v10, v11, v12))
  {
    v14 = (id)*((_QWORD *)internal + 7);
    if (v14 != a3)
    {

      *((_QWORD *)internal + 7) = a3;
    }
    v15 = (id)*((_QWORD *)internal + 6);
    if (v15 != a5)
    {

      *((_QWORD *)internal + 6) = objc_msgSend_copy(a5, v16, v17, v18, v19);
    }
    objc_msgSend_updateCurrentSuppressionEvent_timestamp_reason_facedownState_timeSinceLastFacedownStatic_(self, v13, 0, 0, 0, 0.0, 0.0);
    if ((*((_BYTE *)internal + 336) & 0x19) != 0 && !*((_QWORD *)internal + 14) && (sub_18F1F7BFC() & 0x100) != 0)
    {
      v24 = (_QWORD *)operator new();
      *v24 = off_1E294C238;
      *v24 = &off_1E294C4A0;
      v24[1] = 0;
      v24[2] = sub_18F4B793C;
      v24[3] = self;
      *((_QWORD *)internal + 14) = v24;
      if (qword_1EE16E8E0 != -1)
        dispatch_once(&qword_1EE16E8E0, &unk_1E2953948);
      sub_18F1F4F0C(qword_1EE16E8E8, 0, *((_QWORD *)internal + 14), -1.0);
    }
    if (qword_1EE16E8E0 != -1)
      dispatch_once(&qword_1EE16E8E0, &unk_1E2953948);
    if (qword_1EE16E8E8 && !*((_QWORD *)internal + 41))
    {
      v25 = (_QWORD *)operator new();
      *v25 = off_1E294C238;
      *v25 = &off_1E2959238;
      v25[1] = 0;
      v25[2] = sub_18F4B7954;
      v25[3] = self;
      *((_QWORD *)internal + 41) = v25;
      if (qword_1EE16E8E0 != -1)
        dispatch_once(&qword_1EE16E8E0, &unk_1E2953948);
      sub_18F1F4F0C(qword_1EE16E8E8, 2, *((_QWORD *)internal + 41), -1.0);
    }
    v26 = *((_QWORD *)internal + 42);
    if ((v26 & 2) != 0 && !*((_QWORD *)internal + 25))
    {
      *((_QWORD *)internal + 25) = objc_alloc_init((Class)off_1ECEDEEA0[0]());
      v27 = *((_QWORD *)internal + 8);
      v43[0] = MEMORY[0x1E0C809B0];
      v43[1] = 3221225472;
      v43[2] = sub_18F4BD890;
      v43[3] = &unk_1E29559D0;
      v43[4] = internal;
      v43[5] = self;
      dispatch_async(v27, v43);
      v26 = *((_QWORD *)internal + 42);
    }
    if ((v26 & 4) != 0 && !*((_QWORD *)internal + 26))
    {
      v28 = objc_alloc((Class)off_1ECEDEEA8[0]());
      v32 = (void *)objc_msgSend_initWithDelegate_(v28, v29, (uint64_t)self, v30, v31);
      *((_QWORD *)internal + 26) = v32;
      objc_msgSend_registerForWatchPresence(v32, v33, v34, v35, v36);
      objc_msgSend_getCurrentWatchPresenceStatus(*((void **)internal + 26), v37, v38, v39, v40);
    }
    v41 = (void *)objc_msgSend_defaultCenter(MEMORY[0x1E0CB35B0], v20, v21, v22, v23);
    objc_msgSend_addObserver_selector_name_object_suspensionBehavior_(v41, v42, (uint64_t)self, (uint64_t)sel_onNotification_, (uint64_t)CFSTR("CMSuppressionEventSendNotification"), 0, 4);
  }
}

- (void)stopSuppressionUpdatesPrivate
{
  char *internal;
  const char *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  NSObject *v8;
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  CMSuppressionManager *v14;
  uint64_t v15;
  const char *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  const char *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  const char *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  const char *v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  void *v35;
  const char *v36;
  const char *v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  void *v42;
  void *v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  void *v53;
  void *v54;
  const char *v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  const char *v59;
  uint64_t v60;
  uint64_t v61;
  const char *v62;
  uint64_t v63;
  uint64_t v64;
  const char *v65;
  uint64_t v66;
  uint64_t v67;
  char *v68;
  _BYTE buf[24];
  void *v70;
  _BYTE v71[20];
  __int16 v72;
  uint64_t v73;
  __int16 v74;
  uint64_t v75;
  __int16 v76;
  uint64_t v77;
  uint64_t v78;

  v78 = *MEMORY[0x1E0C80C00];
  sub_18F204AE4();
  sub_18F3DE6D4();
  internal = (char *)self->_internal;
  if (objc_msgSend_isAvailable(CMSuppressionManager, v4, v5, v6, v7))
  {
    if (qword_1EE16D438 != -1)
      dispatch_once(&qword_1EE16D438, &unk_1E2954C28);
    v8 = off_1EE16D428;
    if (os_log_type_enabled((os_log_t)off_1EE16D428, OS_LOG_TYPE_DEFAULT))
    {
      v13 = objc_msgSend_suppressionClientType(self, v9, v10, v11, v12);
      v14 = self;
      v15 = *((_QWORD *)internal + 43);
      v19 = objc_msgSend_stringForEventType_(CMSuppressionEvent, v16, *((_QWORD *)internal + 10), v17, v18);
      v20 = *((_QWORD *)internal + 9);
      v24 = objc_msgSend_stringForEventType_(CMSuppressionEvent, v21, *((_QWORD *)internal + 16), v22, v23);
      v25 = *((_QWORD *)internal + 15);
      v29 = objc_msgSend_stringForEventType_(CMSuppressionEvent, v26, *((_QWORD *)internal + 21), v27, v28);
      v30 = *((_QWORD *)internal + 20);
      *(_DWORD *)buf = 134350850;
      *(_QWORD *)&buf[4] = v13;
      *(_WORD *)&buf[12] = 2114;
      *(_QWORD *)&buf[14] = v15;
      self = v14;
      *(_WORD *)&buf[22] = 2114;
      v70 = (void *)v19;
      *(_WORD *)v71 = 2050;
      *(_QWORD *)&v71[2] = v20;
      *(_WORD *)&v71[10] = 2114;
      *(_QWORD *)&v71[12] = v24;
      v72 = 2050;
      v73 = v25;
      v74 = 2114;
      v75 = v29;
      v76 = 2050;
      v77 = v30;
      _os_log_impl(&dword_18F1DC000, v8, OS_LOG_TYPE_DEFAULT, "[%{public}ld][%{public}@] Stopping suppression updates. Final states: VO: %{public}@ @ %{public}f, SPN: %{public}@ @ %{public}f, DP: %{public}@ @ %{public}f", buf, 0x52u);
    }
    if (sub_18F1FCA08(115, 2))
    {
      bzero(buf, 0x65CuLL);
      if (qword_1EE16D438 != -1)
        dispatch_once(&qword_1EE16D438, &unk_1E2954C28);
      objc_msgSend_suppressionClientType(self, v55, v56, v57, v58);
      objc_msgSend_stringForEventType_(CMSuppressionEvent, v59, *((_QWORD *)internal + 10), v60, v61);
      objc_msgSend_stringForEventType_(CMSuppressionEvent, v62, *((_QWORD *)internal + 16), v63, v64);
      objc_msgSend_stringForEventType_(CMSuppressionEvent, v65, *((_QWORD *)internal + 21), v66, v67);
      v68 = (char *)_os_log_send_and_compose_impl();
      sub_18F419700("Generic", 1, 0, 2, "-[CMSuppressionManager stopSuppressionUpdatesPrivate]", "CoreLocation: %s\n", v68);
      if (v68 != buf)
        free(v68);
    }
    v35 = (void *)objc_msgSend_defaultCenter(MEMORY[0x1E0CB35B0], v31, v32, v33, v34);
    objc_msgSend_removeObserver_name_object_(v35, v36, (uint64_t)self, (uint64_t)CFSTR("CMSuppressionEventSendNotification"), 0);
    v41 = *((_QWORD *)internal + 42);
    if ((v41 & 2) != 0)
    {
      v42 = (void *)*((_QWORD *)internal + 25);
      if (v42)
      {
        objc_msgSend_unregister(v42, v37, v38, v39, v40);

        *((_QWORD *)internal + 25) = 0;
        v41 = *((_QWORD *)internal + 42);
      }
    }
    if ((v41 & 4) != 0)
    {
      v43 = (void *)*((_QWORD *)internal + 26);
      if (v43)
      {
        objc_msgSend_unregisterForWatchPresence(v43, v37, v38, v39, v40);

        *((_QWORD *)internal + 26) = 0;
        v41 = *((_QWORD *)internal + 42);
      }
    }
    v44 = MEMORY[0x1E0C809B0];
    if ((v41 & 0x19) != 0 && *((_QWORD *)internal + 14))
    {
      if (qword_1EE16E8E0 != -1)
        dispatch_once(&qword_1EE16E8E0, &unk_1E2953948);
      v45 = qword_1EE16E8E8;
      v46 = *((_QWORD *)internal + 14);
      v47 = sub_18F204AE4();
      *(_QWORD *)buf = v44;
      *(_QWORD *)&buf[8] = 3221225472;
      *(_QWORD *)&buf[16] = sub_18F1F5EE0;
      v70 = &unk_1E2956E98;
      *(_DWORD *)&v71[16] = 0;
      *(_QWORD *)v71 = v45;
      *(_QWORD *)&v71[8] = v46;
      sub_18F1F5E28(v47, (uint64_t)buf);
      v48 = *((_QWORD *)internal + 14);
      if (v48)
        (*(void (**)(uint64_t))(*(_QWORD *)v48 + 8))(v48);
      *((_QWORD *)internal + 14) = 0;
    }
    if (*((_QWORD *)internal + 41))
    {
      if (qword_1EE16E8E0 != -1)
        dispatch_once(&qword_1EE16E8E0, &unk_1E2953948);
      v49 = qword_1EE16E8E8;
      v50 = *((_QWORD *)internal + 41);
      v51 = sub_18F204AE4();
      *(_QWORD *)buf = v44;
      *(_QWORD *)&buf[8] = 3221225472;
      *(_QWORD *)&buf[16] = sub_18F1F5EE0;
      v70 = &unk_1E2956E98;
      *(_DWORD *)&v71[16] = 2;
      *(_QWORD *)v71 = v49;
      *(_QWORD *)&v71[8] = v50;
      sub_18F1F5E28(v51, (uint64_t)buf);
      v52 = *((_QWORD *)internal + 41);
      if (v52)
        (*(void (**)(uint64_t))(*(_QWORD *)v52 + 8))(v52);
      *((_QWORD *)internal + 41) = 0;
      self->_isCameraCapturePose = 1;
      self->_cameraCapturePoseUIHint = 0;
    }
    v53 = (void *)*((_QWORD *)internal + 7);
    if (v53)
    {

      *((_QWORD *)internal + 7) = 0;
    }
    v54 = (void *)*((_QWORD *)internal + 6);
    if (v54)
    {

      *((_QWORD *)internal + 6) = 0;
    }
    *((_QWORD *)internal + 5) = 0;
    *(_OWORD *)(internal + 24) = 0u;
    *(_OWORD *)(internal + 8) = 0u;
    *(_OWORD *)(internal + 72) = 0u;
    *(_OWORD *)(internal + 88) = 0u;
    *((_QWORD *)internal + 13) = 0;
    *(_OWORD *)(internal + 120) = 0u;
    *(_OWORD *)(internal + 136) = 0u;
    *(_OWORD *)(internal + 152) = 0u;
    *(_OWORD *)(internal + 168) = 0u;
    *(_OWORD *)(internal + 184) = 0u;
  }
}

- (void)onViewObstructedStateData:(const ViewObstructedState *)a3
{
  char *internal;
  __int128 v5;
  __int128 v6;
  __int128 v7;
  float v8;
  uint64_t v9;
  NSObject *v10;
  char *v11;
  _QWORD v12[5];
  float v13;
  __int16 v14;
  uint8_t buf[1640];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  if (a3)
  {
    internal = (char *)self->_internal;
    v5 = *(_OWORD *)&a3->fSuppress.fTimeSinceLastFacedownStatic;
    v6 = *(_OWORD *)&a3->fMeanProbabilities[3];
    v7 = *(_OWORD *)&a3->fSuppress.fOrientation;
    *((_DWORD *)internal + 74) = LODWORD(a3->fMeanProbabilities[7]);
    *(_OWORD *)(internal + 248) = v7;
    *(_OWORD *)(internal + 264) = v5;
    *(_OWORD *)(internal + 280) = v6;
    v8 = *(double *)&a3->fType;
    v9 = sub_18F204AE4();
    v12[0] = MEMORY[0x1E0C809B0];
    v12[1] = 3221225472;
    v12[2] = sub_18F4BE1AC;
    v12[3] = &unk_1E29589B8;
    v12[4] = self;
    v13 = v8;
    sub_18F1F6514(v9, (uint64_t)v12);
  }
  else
  {
    if (qword_1EE16D438 != -1)
      dispatch_once(&qword_1EE16D438, &unk_1E2954C28);
    v10 = off_1EE16D428;
    if (os_log_type_enabled((os_log_t)off_1EE16D428, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_18F1DC000, v10, OS_LOG_TYPE_ERROR, "Invalid data parameter!", buf, 2u);
    }
    if (sub_18F1FCA08(115, 0))
    {
      bzero(buf, 0x65CuLL);
      if (qword_1EE16D438 != -1)
        dispatch_once(&qword_1EE16D438, &unk_1E2954C28);
      v14 = 0;
      v11 = (char *)_os_log_send_and_compose_impl();
      sub_18F419700("Generic", 1, 0, 0, "-[CMSuppressionManager onViewObstructedStateData:]", "CoreLocation: %s\n", v11);
      if (v11 != (char *)buf)
        free(v11);
    }
  }
}

- (void)onCameraCapturePoseData:(const CameraCapturePose *)a3
{
  BOOL var1;
  uint64_t var2;
  uint64_t v6;
  NSObject *v7;
  char *v8;
  _QWORD v9[6];
  BOOL v10;
  __int16 v11;
  uint8_t buf[1640];
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  if (a3)
  {
    var1 = a3->var1;
    var2 = a3->var2;
    v6 = sub_18F204AE4();
    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 3221225472;
    v9[2] = sub_18F4BE394;
    v9[3] = &unk_1E29574B8;
    v10 = var1;
    v9[4] = self;
    v9[5] = var2;
    sub_18F1F6514(v6, (uint64_t)v9);
  }
  else
  {
    if (qword_1EE16D438 != -1)
      dispatch_once(&qword_1EE16D438, &unk_1E2954C28);
    v7 = off_1EE16D428;
    if (os_log_type_enabled((os_log_t)off_1EE16D428, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_18F1DC000, v7, OS_LOG_TYPE_ERROR, "Invalid data parameter!", buf, 2u);
    }
    if (sub_18F1FCA08(115, 0))
    {
      bzero(buf, 0x65CuLL);
      if (qword_1EE16D438 != -1)
        dispatch_once(&qword_1EE16D438, &unk_1E2954C28);
      v11 = 0;
      v8 = (char *)_os_log_send_and_compose_impl();
      sub_18F419700("Generic", 1, 0, 0, "-[CMSuppressionManager onCameraCapturePoseData:]", "CoreLocation: %s\n", v8);
      if (v8 != (char *)buf)
        free(v8);
    }
  }
}

- (void)startViewObstructedStateUpdatesToQueue:(id)a3 withHandler:(id)a4
{
  NSObject *v7;
  uint64_t v8;
  char *v9;
  _QWORD v10[7];
  __int16 v11;
  uint8_t buf[1640];
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  if (qword_1EE16D438 != -1)
    dispatch_once(&qword_1EE16D438, &unk_1E2954C28);
  v7 = off_1EE16D428;
  if (os_log_type_enabled((os_log_t)off_1EE16D428, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_18F1DC000, v7, OS_LOG_TYPE_DEFAULT, "Starting view obstructed state updates.", buf, 2u);
  }
  if (sub_18F1FCA08(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_1EE16D438 != -1)
      dispatch_once(&qword_1EE16D438, &unk_1E2954C28);
    v11 = 0;
    v9 = (char *)_os_log_send_and_compose_impl();
    sub_18F419700("Generic", 1, 0, 2, "-[CMSuppressionManager startViewObstructedStateUpdatesToQueue:withHandler:]", "CoreLocation: %s\n", v9);
    if (v9 != (char *)buf)
      free(v9);
  }
  v8 = sub_18F204AE4();
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = sub_18F4BE618;
  v10[3] = &unk_1E2955BD8;
  v10[4] = self;
  v10[5] = a3;
  v10[6] = a4;
  sub_18F1F6514(v8, (uint64_t)v10);
}

- (void)stopViewObstructedStateUpdates
{
  NSObject *v3;
  uint64_t v4;
  char *v5;
  _QWORD v6[5];
  __int16 v7;
  uint8_t buf[1640];
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  if (qword_1EE16D438 != -1)
    dispatch_once(&qword_1EE16D438, &unk_1E2954C28);
  v3 = off_1EE16D428;
  if (os_log_type_enabled((os_log_t)off_1EE16D428, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_18F1DC000, v3, OS_LOG_TYPE_DEFAULT, "Stopping view obstructed state updates.", buf, 2u);
  }
  if (sub_18F1FCA08(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_1EE16D438 != -1)
      dispatch_once(&qword_1EE16D438, &unk_1E2954C28);
    v7 = 0;
    v5 = (char *)_os_log_send_and_compose_impl();
    sub_18F419700("Generic", 1, 0, 2, "-[CMSuppressionManager stopViewObstructedStateUpdates]", "CoreLocation: %s\n", v5);
    if (v5 != (char *)buf)
      free(v5);
  }
  v4 = sub_18F204AE4();
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = sub_18F4BE820;
  v6[3] = &unk_1E2955938;
  v6[4] = self;
  sub_18F1F6514(v4, (uint64_t)v6);
}

- (void)sendViewObstructedStateToClientPrivate:(float)a3
{
  char *internal;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  unint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  const char *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  id v19;
  const char *v20;
  uint64_t v21;
  uint64_t v22;
  const char *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  void *v27;
  double v28;
  uint64_t i;
  uint64_t v30;
  const char *v31;
  uint64_t v32;
  uint64_t v33;
  NSObject *v34;
  int v35;
  int v36;
  int v37;
  int v38;
  double v39;
  double v40;
  CMViewObstructedStateEvent *v41;
  double v42;
  double v43;
  const char *v44;
  void *ShouldSupress_currentState_orientation_motionType_lux_pocketProbability_meanProbabilitiesFloatArray;
  uint64_t v46;
  void *v47;
  const char *v48;
  uint64_t v49;
  uint64_t v50;
  int v51;
  int v52;
  int v53;
  int v54;
  double v55;
  double v56;
  char *v57;
  _QWORD v58[6];
  int v59;
  double v60;
  __int16 v61;
  int v62;
  __int16 v63;
  int v64;
  __int16 v65;
  int v66;
  __int16 v67;
  int v68;
  __int16 v69;
  double v70;
  __int16 v71;
  double v72;
  __int16 v73;
  void *v74;
  _BYTE __p[12];
  __int16 v76;
  int v77;
  __int16 v78;
  int v79;
  __int16 v80;
  int v81;
  __int16 v82;
  int v83;
  __int16 v84;
  double v85;
  __int16 v86;
  double v87;
  __int16 v88;
  void *v89;
  uint64_t v90;

  v90 = *MEMORY[0x1E0C80C00];
  sub_18F204AE4();
  sub_18F3DE6D4();
  internal = (char *)self->_internal;
  if (*((_QWORD *)internal + 7))
  {
    v9 = (void *)MEMORY[0x194001B4C]();
    v10 = internal[253];
    if (v10 > 6)
      v11 = objc_msgSend_stringWithUTF8String_(MEMORY[0x1E0CB3940], v6, (uint64_t)"Unexpected", v7, v8);
    else
      v11 = objc_msgSend_stringWithUTF8String_(MEMORY[0x1E0CB3940], v6, (uint64_t)off_1E2959278[v10], v7, v8);
    v12 = v11;
    v13 = (void *)MEMORY[0x1E0CB3940];
    sub_18F3EEED8(internal[254], __p);
    if (v79 >= 0)
      v17 = objc_msgSend_stringWithUTF8String_(v13, v14, (uint64_t)__p, v15, v16);
    else
      v17 = objc_msgSend_stringWithUTF8String_(v13, v14, *(uint64_t *)__p, v15, v16);
    v18 = v17;
    if (SHIBYTE(v79) < 0)
      operator delete(*(void **)__p);
    v19 = objc_alloc(MEMORY[0x1E0C99DE8]);
    v27 = (void *)objc_msgSend_initWithCapacity_(v19, v20, 8, v21, v22);
    for (i = 0; i != 32; i += 4)
    {
      LODWORD(v28) = *(_DWORD *)&internal[i + 268];
      v30 = objc_msgSend_numberWithFloat_(MEMORY[0x1E0CB37E8], v23, v24, v25, v26, v28);
      objc_msgSend_addObject_(v27, v31, v30, v32, v33);
    }
    if (qword_1EE16D438 != -1)
      dispatch_once(&qword_1EE16D438, &unk_1E2954C28);
    v34 = off_1EE16D428;
    if (os_log_type_enabled((os_log_t)off_1EE16D428, OS_LOG_TYPE_INFO))
    {
      v35 = internal[250];
      v36 = internal[252];
      v37 = internal[253];
      v38 = internal[254];
      v39 = *(float *)(internal + 255);
      v40 = *(float *)(internal + 259);
      *(_DWORD *)__p = 134350850;
      *(double *)&__p[4] = a3;
      v76 = 1026;
      v77 = v35;
      v78 = 1026;
      v79 = v36;
      v80 = 1026;
      v81 = v37;
      v82 = 1026;
      v83 = v38;
      v84 = 2050;
      v85 = v39;
      v86 = 2050;
      v87 = v40;
      v88 = 2114;
      v89 = v27;
      _os_log_impl(&dword_18F1DC000, v34, OS_LOG_TYPE_INFO, "Incoming view obstructed state event, timestampSecs,%{public}f,shouldSuppress,%{public}u,currentState,%{public}u,orientation,%{public}u,motionType,%{public}u,lux,%{public}f,pocketProbability,%{public}f,meanProbabilities,%{public}@", __p, 0x42u);
    }
    if (sub_18F1FCA08(115, 2))
    {
      bzero(__p, 0x65CuLL);
      if (qword_1EE16D438 != -1)
        dispatch_once(&qword_1EE16D438, &unk_1E2954C28);
      v51 = internal[250];
      v52 = internal[252];
      v53 = internal[253];
      v54 = internal[254];
      v55 = *(float *)(internal + 255);
      v56 = *(float *)(internal + 259);
      v59 = 134350850;
      v60 = a3;
      v61 = 1026;
      v62 = v51;
      v63 = 1026;
      v64 = v52;
      v65 = 1026;
      v66 = v53;
      v67 = 1026;
      v68 = v54;
      v69 = 2050;
      v70 = v55;
      v71 = 2050;
      v72 = v56;
      v73 = 2114;
      v74 = v27;
      v57 = (char *)_os_log_send_and_compose_impl();
      sub_18F419700("Generic", 1, 0, 2, "-[CMSuppressionManager sendViewObstructedStateToClientPrivate:]", "CoreLocation: %s\n", v57);
      if (v57 != __p)
        free(v57);
    }
    v41 = [CMViewObstructedStateEvent alloc];
    LODWORD(v42) = *(_DWORD *)(internal + 255);
    LODWORD(v43) = *(_DWORD *)(internal + 259);
    ShouldSupress_currentState_orientation_motionType_lux_pocketProbability_meanProbabilitiesFloatArray = (void *)objc_msgSend_initWithShouldSupress_currentState_orientation_motionType_lux_pocketProbability_meanProbabilitiesFloatArray_(v41, v44, internal[250], internal[252], v12, v18, v27, v42, v43);
    v46 = *((_QWORD *)internal + 30);
    v47 = (void *)*((_QWORD *)internal + 7);
    v58[0] = MEMORY[0x1E0C809B0];
    v58[1] = 3221225472;
    v58[2] = sub_18F4BEC74;
    v58[3] = &unk_1E2955B60;
    v58[4] = ShouldSupress_currentState_orientation_motionType_lux_pocketProbability_meanProbabilitiesFloatArray;
    v58[5] = v46;
    objc_msgSend_addOperationWithBlock_(v47, v48, (uint64_t)v58, v49, v50);

    objc_autoreleasePoolPop(v9);
  }
}

- (void)startViewObstructedStateUpdatesPrivateToQueue:(id)a3 withHandler:(id)a4
{
  _QWORD *internal;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  id v12;
  id v13;
  const char *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  _QWORD *v18;

  sub_18F204AE4();
  sub_18F3DE6D4();
  internal = self->_internal;
  if (objc_msgSend_isAvailable(CMSuppressionManager, v8, v9, v10, v11))
  {
    v12 = (id)internal[7];
    if (v12 != a3)
    {

      internal[7] = a3;
    }
    v13 = (id)internal[30];
    if (v13 != a4)
    {

      internal[30] = objc_msgSend_copy(a4, v14, v15, v16, v17);
    }
    if (qword_1EE16E8E0 != -1)
      dispatch_once(&qword_1EE16E8E0, &unk_1E2953948);
    if (qword_1EE16E8E8)
    {
      v18 = (_QWORD *)operator new();
      *v18 = off_1E294C238;
      *v18 = &off_1E294C468;
      v18[1] = 0;
      v18[2] = sub_18F4B7948;
      v18[3] = self;
      internal[38] = v18;
      if (qword_1EE16E8E0 != -1)
        dispatch_once(&qword_1EE16E8E0, &unk_1E2953948);
      sub_18F1F4F0C(qword_1EE16E8E8, 1, internal[38], -1.0);
    }
  }
}

- (void)stopViewObstructedStateUpdatesPrivate
{
  char *internal;
  const char *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  char *v14;
  _QWORD v15[6];
  int v16;

  sub_18F204AE4();
  sub_18F3DE6D4();
  internal = (char *)self->_internal;
  if (objc_msgSend_isAvailable(CMSuppressionManager, v4, v5, v6, v7))
  {
    if (*((_QWORD *)internal + 38))
    {
      if (qword_1EE16E8E0 != -1)
        dispatch_once(&qword_1EE16E8E0, &unk_1E2953948);
      v8 = qword_1EE16E8E8;
      v9 = *((_QWORD *)internal + 38);
      v10 = sub_18F204AE4();
      v15[0] = MEMORY[0x1E0C809B0];
      v15[1] = 3221225472;
      v15[2] = sub_18F1F5EE0;
      v15[3] = &unk_1E2956E98;
      v16 = 1;
      v15[4] = v8;
      v15[5] = v9;
      sub_18F1F5E28(v10, (uint64_t)v15);
      v11 = *((_QWORD *)internal + 38);
      if (v11)
        (*(void (**)(uint64_t))(*(_QWORD *)v11 + 8))(v11);
      *((_QWORD *)internal + 38) = 0;
    }
    v12 = (void *)*((_QWORD *)internal + 7);
    if (v12)
    {

      *((_QWORD *)internal + 7) = 0;
    }
    v13 = (void *)*((_QWORD *)internal + 30);
    if (v13)
    {

      *((_QWORD *)internal + 30) = 0;
    }
    *(_OWORD *)(internal + 248) = 0u;
    v14 = internal + 248;
    *((_DWORD *)v14 + 12) = 0;
    *((_OWORD *)v14 + 1) = 0u;
    *((_OWORD *)v14 + 2) = 0u;
  }
}

- (void)startCameraCapturePoseUpdatesPrivateToQueue:(id)a3 withHandler:(id)a4
{
  _QWORD *internal;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  id v12;
  id v13;
  const char *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;

  sub_18F204AE4();
  sub_18F3DE6D4();
  internal = self->_internal;
  if (objc_msgSend_isAvailable(CMSuppressionManager, v8, v9, v10, v11))
  {
    v12 = (id)internal[39];
    if (v12 != a3)
    {

      internal[39] = a3;
    }
    v13 = (id)internal[40];
    if (v13 != a4)
    {

      internal[40] = objc_msgSend_copy(a4, v14, v15, v16, v17);
    }
  }
}

- (void)stopCameraCapturePoseUpdatesPrivate
{
  _QWORD *internal;
  const char *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;

  sub_18F204AE4();
  sub_18F3DE6D4();
  internal = self->_internal;
  if (objc_msgSend_isAvailable(CMSuppressionManager, v4, v5, v6, v7))
  {
    v8 = (void *)internal[39];
    if (v8)
    {

      internal[39] = 0;
    }
    v9 = (void *)internal[40];
    if (v9)
    {

      internal[40] = 0;
    }
  }
}

- (void)handleSmartPowerNapState:(unsigned __int8)a3
{
  int v3;
  NSObject *v5;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  double v12;
  const char *v13;
  uint64_t v14;
  const char *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  char *v19;
  uint8_t buf[4];
  uint64_t v21;
  __int16 v22;
  int v23;
  uint64_t v24;

  v3 = a3;
  v24 = *MEMORY[0x1E0C80C00];
  if (qword_1EE16D438 != -1)
    dispatch_once(&qword_1EE16D438, &unk_1E2954C28);
  v5 = off_1EE16D428;
  if (os_log_type_enabled((os_log_t)off_1EE16D428, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 134349312;
    v21 = objc_msgSend_suppressionClientType(self, v6, v7, v8, v9);
    v22 = 1026;
    v23 = v3;
    _os_log_impl(&dword_18F1DC000, v5, OS_LOG_TYPE_INFO, "[%{public}ld] Incoming smart power nap event, %{public}u", buf, 0x12u);
  }
  if (sub_18F1FCA08(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_1EE16D438 != -1)
      dispatch_once(&qword_1EE16D438, &unk_1E2954C28);
    objc_msgSend_suppressionClientType(self, v15, v16, v17, v18);
    v19 = (char *)_os_log_send_and_compose_impl();
    sub_18F419700("Generic", 1, 0, 2, "-[CMSuppressionManager handleSmartPowerNapState:]", "CoreLocation: %s\n", v19);
    if (v19 != (char *)buf)
      free(v19);
  }
  if (v3 == 1)
  {
    v10 = 1;
  }
  else
  {
    if (v3)
      return;
    v10 = 2;
  }
  v11 = mach_absolute_time();
  v12 = sub_18F1FD20C(v11);
  objc_msgSend_feedSmartPowerNapEvent_timestamp_force_(self, v13, v10, 0, v14, v12);
}

- (void)managerDidDetectEvent:(unint64_t)a3
{
  NSObject *v5;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  double v12;
  const char *v13;
  uint64_t v14;
  const char *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  char *v19;
  uint8_t buf[4];
  uint64_t v21;
  __int16 v22;
  unint64_t v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  if (qword_1EE16D438 != -1)
    dispatch_once(&qword_1EE16D438, &unk_1E2954C28);
  v5 = off_1EE16D428;
  if (os_log_type_enabled((os_log_t)off_1EE16D428, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 134349312;
    v21 = objc_msgSend_suppressionClientType(self, v6, v7, v8, v9);
    v22 = 2050;
    v23 = a3;
    _os_log_impl(&dword_18F1DC000, v5, OS_LOG_TYPE_INFO, "[%{public}ld] Incoming device presence event, %{public}lu", buf, 0x16u);
  }
  if (sub_18F1FCA08(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_1EE16D438 != -1)
      dispatch_once(&qword_1EE16D438, &unk_1E2954C28);
    objc_msgSend_suppressionClientType(self, v15, v16, v17, v18);
    v19 = (char *)_os_log_send_and_compose_impl();
    sub_18F419700("Generic", 1, 0, 2, "-[CMSuppressionManager managerDidDetectEvent:]", "CoreLocation: %s\n", v19);
    if (v19 != (char *)buf)
      free(v19);
  }
  if (a3 == 1)
  {
    v10 = 2;
  }
  else
  {
    if (a3 != 2)
      return;
    v10 = 1;
  }
  v11 = mach_absolute_time();
  v12 = sub_18F1FD20C(v11);
  objc_msgSend_feedDevicePresenceEvent_timestamp_force_(self, v13, v10, 0, v14, v12);
}

- (void)managerDidFindError:(unint64_t)a3
{
  NSObject *v4;
  const char *v5;
  char *v6;
  uint8_t buf[4];
  const char *v8;
  __int16 v9;
  unint64_t v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  if (qword_1EE16D438 != -1)
    dispatch_once(&qword_1EE16D438, &unk_1E2954C28);
  v4 = off_1EE16D428;
  if (os_log_type_enabled((os_log_t)off_1EE16D428, OS_LOG_TYPE_ERROR))
  {
    if (a3 > 5)
      v5 = "Unexpected";
    else
      v5 = off_1E29592B0[a3];
    *(_DWORD *)buf = 136446466;
    v8 = v5;
    v9 = 2050;
    v10 = a3;
    _os_log_impl(&dword_18F1DC000, v4, OS_LOG_TYPE_ERROR, "Device presence error: %{public}s %{public}lu", buf, 0x16u);
  }
  if (sub_18F1FCA08(115, 0))
  {
    bzero(buf, 0x65CuLL);
    if (qword_1EE16D438 != -1)
      dispatch_once(&qword_1EE16D438, &unk_1E2954C28);
    v6 = (char *)_os_log_send_and_compose_impl();
    sub_18F419700("Generic", 1, 0, 0, "-[CMSuppressionManager managerDidFindError:]", "CoreLocation: %s\n", v6);
    if (v6 != (char *)buf)
      free(v6);
  }
}

- (BOOL)isCameraCapturePose
{
  return self->_isCameraCapturePose;
}

- (int64_t)cameraCapturePoseUIHint
{
  return self->_cameraCapturePoseUIHint;
}

- (int64_t)suppressionClientType
{
  return self->_suppressionClientType;
}

@end
