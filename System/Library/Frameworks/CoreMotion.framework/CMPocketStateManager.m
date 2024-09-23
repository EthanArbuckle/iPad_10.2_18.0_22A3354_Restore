@implementation CMPocketStateManager

- (CMPocketStateManager)init
{
  CMPocketStateManager *v2;
  NSObject *fPrivateQueue;
  _QWORD v5[4];
  id v6;
  id location;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)CMPocketStateManager;
  v2 = -[CMPocketStateManager init](&v8, sel_init);
  if (v2)
  {
    v2->fQueryBlocks = (NSMutableArray *)objc_opt_new();
    v2->fQueryTimer = 0;
    v2->fPrivateQueue = (OS_dispatch_queue *)dispatch_queue_create("com.apple.CoreMotion.CMPocketStatePrivateQueue", 0);
    v2->fCachedState = 0;
    objc_initWeak(&location, v2);
    fPrivateQueue = v2->fPrivateQueue;
    v5[0] = MEMORY[0x1E0C809B0];
    v5[1] = 3221225472;
    v5[2] = sub_18F476984;
    v5[3] = &unk_1E29570B0;
    objc_copyWeak(&v6, &location);
    dispatch_async(fPrivateQueue, v5);
    objc_destroyWeak(&v6);
    objc_destroyWeak(&location);
  }
  return v2;
}

- (void)_prepareDispatcher
{
  const char *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  Dispatcher *v7;
  Dispatcher *value;
  uint64_t v9;
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  const char *v15;

  if (qword_1EE16E478 != -1)
    dispatch_once(&qword_1EE16E478, &unk_1E2953E28);
  if (!self->fDispatcher.__ptr_.__value_)
  {
    *(_QWORD *)&self->fMaxMonitorTime = qword_1EE16E300;
    v7 = (Dispatcher *)operator new();
    v7->var0 = (void **)off_1E294C238;
    v7->var0 = (void **)&off_1E294C5F0;
    v7->var1 = 0;
    v7[1].var0 = (void **)sub_18F476B98;
    v7[1].var1 = self;
    value = self->fDispatcher.__ptr_.__value_;
    self->fDispatcher.__ptr_.__value_ = v7;
    if (value)
      (*((void (**)(Dispatcher *))value->var0 + 1))(value);
    if (objc_msgSend_isPocketStateAvailable(CMPocketStateManager, v3, v4, v5, v6))
    {
      v9 = sub_18F3DECC0();
      sub_18F1F4F0C(v9, 0, (uint64_t)self->fDispatcher.__ptr_.__value_, -1.0);
      v14 = (void *)objc_msgSend_defaultCenter(MEMORY[0x1E0CB35B0], v10, v11, v12, v13);
      objc_msgSend_addObserver_selector_name_object_suspensionBehavior_(v14, v15, (uint64_t)self, (uint64_t)sel_onNotification_, (uint64_t)CFSTR("CMSetPocketStateNotification"), 0, 4);
    }
  }
}

- (void)dealloc
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  const char *v11;
  uint64_t v12;
  Dispatcher *value;
  uint64_t v14;
  NSMutableArray *fQueryBlocks;
  NSObject *fQueryTimer;
  objc_super v17;
  _QWORD v18[6];
  int v19;

  if (objc_msgSend_isPocketStateAvailable(CMPocketStateManager, a2, v2, v3, v4))
  {
    v10 = (void *)objc_msgSend_defaultCenter(MEMORY[0x1E0CB35B0], v6, v7, v8, v9);
    objc_msgSend_removeObserver_name_object_(v10, v11, (uint64_t)self, (uint64_t)CFSTR("CMSetPocketStateNotification"), 0);
    if (self->fDispatcher.__ptr_.__value_)
    {
      v12 = sub_18F3DECC0();
      value = self->fDispatcher.__ptr_.__value_;
      v14 = sub_18F204AE4();
      v18[0] = MEMORY[0x1E0C809B0];
      v18[1] = 3221225472;
      v18[2] = sub_18F1F5EE0;
      v18[3] = &unk_1E2956E98;
      v19 = 0;
      v18[4] = v12;
      v18[5] = value;
      sub_18F1F5E28(v14, (uint64_t)v18);
    }
  }
  fQueryBlocks = self->fQueryBlocks;
  if (fQueryBlocks)

  fQueryTimer = self->fQueryTimer;
  if (fQueryTimer)
  {
    dispatch_source_cancel(fQueryTimer);
    dispatch_release((dispatch_object_t)self->fQueryTimer);
    self->fQueryTimer = 0;
  }
  dispatch_release((dispatch_object_t)self->fPrivateQueue);
  v17.receiver = self;
  v17.super_class = (Class)CMPocketStateManager;
  -[CMPocketStateManager dealloc](&v17, sel_dealloc);
}

- (void)setDelegate:(id)a3
{
  self->_delegate = (CMPocketStateDelegate *)a3;
  ((void (*)(CMPocketStateManager *, char *, _QWORD))MEMORY[0x1E0DE7D20])(self, sel_onPocketStateUpdated_, self->fCachedState);
}

+ (BOOL)isPocketStateAvailable
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  NSObject *v5;
  char *v7;
  uint8_t buf[1640];
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  if (qword_1ECEDFBC8 != -1)
    dispatch_once(&qword_1ECEDFBC8, &unk_1E2954B28);
  if (!byte_1ECEDFBC0)
    return objc_msgSend_isPocketStateSupported(CMPocketStateManager, a2, v2, v3, v4);
  if (qword_1EE16D6B8 != -1)
    dispatch_once(&qword_1EE16D6B8, &unk_1E29589D8);
  v5 = qword_1EE16D6B0;
  if (os_log_type_enabled((os_log_t)qword_1EE16D6B0, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_18F1DC000, v5, OS_LOG_TYPE_DEFAULT, "Pocket state disabled by defaults write", buf, 2u);
  }
  if (sub_18F1FCA08(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_1EE16D6B8 != -1)
      dispatch_once(&qword_1EE16D6B8, &unk_1E29589D8);
    v7 = (char *)_os_log_send_and_compose_impl();
    sub_18F419700("Generic", 1, 0, 2, "+[CMPocketStateManager isPocketStateAvailable]", "CoreLocation: %s\n", v7);
    if (v7 != (char *)buf)
      free(v7);
  }
  return 0;
}

+ (BOOL)isPocketStateSupported
{
  sub_18F1F77DC();
  if ((sub_18F20C9AC() & 1) != 0)
    return 1;
  sub_18F1F77DC();
  return sub_18F1E1B00();
}

- (void)_disableDispatcher
{
  NSObject *v3;
  NSObject *fPrivateQueue;
  char *v5;
  _QWORD block[5];
  __int16 v7;
  uint8_t buf[1640];
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  if (qword_1EE16D6B8 != -1)
    dispatch_once(&qword_1EE16D6B8, &unk_1E29589D8);
  v3 = qword_1EE16D6B0;
  if (os_log_type_enabled((os_log_t)qword_1EE16D6B0, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_18F1DC000, v3, OS_LOG_TYPE_DEFAULT, "disabling dispatcher", buf, 2u);
  }
  if (sub_18F1FCA08(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_1EE16D6B8 != -1)
      dispatch_once(&qword_1EE16D6B8, &unk_1E29589D8);
    v7 = 0;
    v5 = (char *)_os_log_send_and_compose_impl();
    sub_18F419700("Generic", 1, 0, 2, "-[CMPocketStateManager _disableDispatcher]", "CoreLocation: %s\n", v5);
    if (v5 != (char *)buf)
      free(v5);
  }
  fPrivateQueue = self->fPrivateQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = sub_18F477148;
  block[3] = &unk_1E2955938;
  block[4] = self;
  dispatch_sync(fPrivateQueue, block);
}

- (int64_t)translateInternalState:(int)a3
{
  if ((a3 - 1) > 3)
    return 0;
  else
    return qword_18F509298[a3 - 1];
}

- (int)translateExternalState:(int64_t)a3
{
  if ((unint64_t)(a3 - 1) > 2)
    return 3;
  else
    return dword_18F5092B8[a3 - 1];
}

- (id)externalStateToString:(int64_t)a3
{
  if ((unint64_t)a3 > 3)
    return CFSTR("Unknown");
  else
    return off_1E29589F8[a3];
}

- (void)addToAggdScalarWithName:(id)a3 andScalar:(unint64_t)a4
{
  NSObject *fPrivateQueue;
  _QWORD v5[6];

  if (MEMORY[0x1E0CF6398])
  {
    fPrivateQueue = self->fPrivateQueue;
    v5[0] = MEMORY[0x1E0C809B0];
    v5[1] = 3221225472;
    v5[2] = sub_18F477290;
    v5[3] = &unk_1E2956590;
    v5[4] = a3;
    v5[5] = a4;
    dispatch_async(fPrivateQueue, v5);
  }
}

- (void)queryStateOntoQueue:(id)a3 withTimeout:(double)a4 andHandler:(id)a5
{
  ((void (*)(CMPocketStateManager *, char *, id, id))MEMORY[0x1E0DE7D20])(self, sel_queryStateOntoQueue_andMonitorFor_withTimeout_andHandler_, a3, a5);
}

- (void)queryStateOntoQueue:(id)a3 andMonitorFor:(double)a4 withTimeout:(double)a5 andHandler:(id)a6
{
  uint64_t v6;
  const char *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  NSObject *v16;
  uint64_t v17;
  __CFNotificationCenter *DarwinNotifyCenter;
  NSObject *fPrivateQueue;
  NSObject *v20;
  uint64_t v21;
  char *v22;
  char *v23;
  _QWORD block[9];
  int v25;
  double v26;
  uint8_t buf[4];
  double v28;
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  if ((objc_msgSend_isPocketStateAvailable(CMPocketStateManager, a2, (uint64_t)a3, (uint64_t)a6, v6) & 1) != 0
    || (objc_msgSend_isPocketStateSupported(CMPocketStateManager, v12, v13, v14, v15) & 1) != 0)
  {
    if (qword_1EE16D6B8 != -1)
      dispatch_once(&qword_1EE16D6B8, &unk_1E29589D8);
    v16 = qword_1EE16D6B0;
    if (os_log_type_enabled((os_log_t)qword_1EE16D6B0, OS_LOG_TYPE_DEFAULT))
    {
      v17 = mach_absolute_time();
      *(_DWORD *)buf = 134217984;
      v28 = sub_18F1FD20C(v17);
      _os_log_impl(&dword_18F1DC000, v16, OS_LOG_TYPE_DEFAULT, "QueryRequest,%f", buf, 0xCu);
    }
    if (sub_18F1FCA08(115, 2))
    {
      bzero(buf, 0x65CuLL);
      if (qword_1EE16D6B8 != -1)
        dispatch_once(&qword_1EE16D6B8, &unk_1E29589D8);
      v21 = mach_absolute_time();
      v25 = 134217984;
      v26 = sub_18F1FD20C(v21);
      v22 = (char *)_os_log_send_and_compose_impl();
      sub_18F419700("Generic", 1, 0, 2, "-[CMPocketStateManager queryStateOntoQueue:andMonitorFor:withTimeout:andHandler:]", "CoreLocation: %s\n", v22);
      if (v22 != (char *)buf)
        free(v22);
    }
    DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
    CFNotificationCenterPostNotification(DarwinNotifyCenter, CFSTR("com.apple.CoreMotion.PocketState.queryStart"), 0, 0, 4u);
    fPrivateQueue = self->fPrivateQueue;
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = sub_18F477844;
    block[3] = &unk_1E2956A88;
    block[4] = self;
    block[5] = a3;
    block[6] = a6;
    *(double *)&block[7] = a5;
    *(double *)&block[8] = a4;
    dispatch_sync(fPrivateQueue, block);
  }
  else
  {
    if (qword_1EE16D6B8 != -1)
      dispatch_once(&qword_1EE16D6B8, &unk_1E29589D8);
    v20 = qword_1EE16D6B0;
    if (os_log_type_enabled((os_log_t)qword_1EE16D6B0, OS_LOG_TYPE_FAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_18F1DC000, v20, OS_LOG_TYPE_FAULT, "Pocket state query is called on an unsupported platform", buf, 2u);
    }
    if (sub_18F1FCA08(115, 0))
    {
      bzero(buf, 0x65CuLL);
      if (qword_1EE16D6B8 != -1)
        dispatch_once(&qword_1EE16D6B8, &unk_1E29589D8);
      LOWORD(v25) = 0;
      v23 = (char *)_os_log_send_and_compose_impl();
      sub_18F419700("Generic", 1, 0, 0, "-[CMPocketStateManager queryStateOntoQueue:andMonitorFor:withTimeout:andHandler:]", "CoreLocation: %s\n", v23);
      if (v23 != (char *)buf)
        free(v23);
    }
  }
}

- (void)onNotification:(id)a3
{
  uint64_t v5;
  _QWORD v6[6];

  v5 = sub_18F204AE4();
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = sub_18F4785C0;
  v6[3] = &unk_1E29559D0;
  v6[4] = a3;
  v6[5] = self;
  sub_18F1F5E28(v5, (uint64_t)v6);
}

- (void)onPocketStateUpdated:(int)a3
{
  NSObject *fPrivateQueue;
  _QWORD v4[5];
  int v5;

  fPrivateQueue = self->fPrivateQueue;
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = sub_18F478830;
  v4[3] = &unk_1E29589B8;
  v4[4] = self;
  v5 = a3;
  dispatch_async(fPrivateQueue, v4);
}

- (CMPocketStateDelegate)delegate
{
  return self->_delegate;
}

- (void).cxx_destruct
{
  Dispatcher *value;

  value = self->fDispatcher.__ptr_.__value_;
  self->fDispatcher.__ptr_.__value_ = 0;
  if (value)
    (*((void (**)(Dispatcher *))value->var0 + 1))(value);
}

- (id).cxx_construct
{
  *((_QWORD *)self + 4) = 0;
  return self;
}

@end
