@implementation CMHeadphoneActivityManager

- (CMHeadphoneActivityManager)init
{
  CMHeadphoneActivityManager *v2;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)CMHeadphoneActivityManager;
  v2 = -[CMHeadphoneActivityManager init](&v4, sel_init);
  if (v2)
    v2->_internal = (CMHeadphoneActivityManagerInternal *)objc_opt_new();
  return v2;
}

- (void)dealloc
{
  const char *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  NSObject *dispatchQueue;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  const char *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  objc_super v16;
  _QWORD block[5];

  dispatch_queue_set_specific((dispatch_queue_t)self->_internal->_dispatchQueue, &unk_1EE16E850, &unk_1EE16E850, 0);
  if (dispatch_get_specific(&unk_1EE16E850) == &unk_1EE16E850)
  {
    objc_msgSend_pauseActivityStreamingPrivate(self, v3, v4, v5, v6);
    objc_msgSend_pauseStatusStreamingPrivate(self, v8, v9, v10, v11);
    objc_msgSend_stopMslLoggingPrivate(self->_internal, v12, v13, v14, v15);
  }
  else
  {
    dispatchQueue = self->_internal->_dispatchQueue;
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = sub_18F48BDB4;
    block[3] = &unk_1E2955938;
    block[4] = self;
    dispatch_sync(dispatchQueue, block);
  }

  v16.receiver = self;
  v16.super_class = (Class)CMHeadphoneActivityManager;
  -[CMHeadphoneActivityManager dealloc](&v16, sel_dealloc);
}

+ (int64_t)authorizationStatus
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  return objc_msgSend_authorizationStatus(CMMotionUtils, a2, v2, v3, v4);
}

- (BOOL)isActivityAvailable
{
  if (qword_1ECEDFBF8 != -1)
    dispatch_once(&qword_1ECEDFBF8, &unk_1E2958BD8);
  return byte_1ECEDFBF0;
}

- (BOOL)isActivityActive
{
  return self->_internal->_activityActive;
}

- (BOOL)isStatusActive
{
  return self->_internal->_statusActive;
}

- (void)startActivityUpdatesToQueue:(id)a3 withHandler:(id)a4
{
  uint64_t v4;
  _QWORD v5[7];

  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = sub_18F48BEF4;
  v5[3] = &unk_1E2955BD8;
  v5[4] = self;
  v5[5] = a3;
  v5[6] = a4;
  objc_msgSend_tccServiceMotionAccessAllowingMacWithBlock_(CMMotionUtils, a2, (uint64_t)v5, (uint64_t)a4, v4);
}

- (void)stopActivityUpdates
{
  uint64_t v2;
  uint64_t v3;
  _QWORD v4[5];

  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = sub_18F48BFCC;
  v4[3] = &unk_1E2955938;
  v4[4] = self;
  objc_msgSend_tccServiceMotionAccessAllowingMacWithBlock_(CMMotionUtils, a2, (uint64_t)v4, v2, v3);
}

- (void)startStatusUpdatesToQueue:(id)a3 withHandler:(id)a4
{
  NSObject *dispatchQueue;
  _QWORD block[7];

  dispatchQueue = self->_internal->_dispatchQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = sub_18F48C090;
  block[3] = &unk_1E2955BD8;
  block[4] = self;
  block[5] = a3;
  block[6] = a4;
  dispatch_async(dispatchQueue, block);
}

- (void)stopStatusUpdates
{
  NSObject *dispatchQueue;
  _QWORD block[5];

  dispatchQueue = self->_internal->_dispatchQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = sub_18F48C0FC;
  block[3] = &unk_1E2955938;
  block[4] = self;
  dispatch_sync(dispatchQueue, block);
}

- (BOOL)mslLoggingEnabled
{
  NSObject *dispatchQueue;
  char v3;
  _QWORD v5[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  char v9;

  v6 = 0;
  v7 = &v6;
  v8 = 0x2020000000;
  v9 = 0;
  dispatchQueue = self->_internal->_dispatchQueue;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = sub_18F48C198;
  v5[3] = &unk_1E2956830;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(dispatchQueue, v5);
  v3 = *((_BYTE *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

- (void)startMslLoggingWithFilenamePrefix:(id)a3 filePath:(id)a4
{
  NSObject *dispatchQueue;
  _QWORD block[7];

  dispatchQueue = self->_internal->_dispatchQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = sub_18F48C22C;
  block[3] = &unk_1E2958100;
  block[4] = self;
  block[5] = a3;
  block[6] = a4;
  dispatch_async(dispatchQueue, block);
}

- (void)stopMslLogging
{
  NSObject *dispatchQueue;
  _QWORD block[5];

  dispatchQueue = self->_internal->_dispatchQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = sub_18F48C29C;
  block[3] = &unk_1E2955938;
  block[4] = self;
  dispatch_sync(dispatchQueue, block);
}

- (id)delegateQueuePrivate
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  id result;

  result = self->_internal->_activityCallbackQueue;
  if (!result)
    return (id)objc_msgSend_mainQueue(MEMORY[0x1E0CB3828], a2, v2, v3, v4);
  return result;
}

- (BOOL)hasConnectionClients
{
  CMHeadphoneActivityManagerInternal *internal;

  internal = self->_internal;
  return internal->_statusHandler || internal->_activityHandler != 0;
}

- (void)startActivityUpdatesPrivateToQueue:(id)a3 withHandler:(id)a4
{
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  const char *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  const char *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;

  dispatch_assert_queue_V2((dispatch_queue_t)self->_internal->_dispatchQueue);
  if (objc_msgSend_isActivityAvailable(self, v7, v8, v9, v10))
  {
    if (!self->_internal->_activityActive)
    {
      self->_internal->_activityCallbackQueue = (NSOperationQueue *)a3;
      self->_internal->_activityHandler = (id)objc_msgSend_copy(a4, v11, v12, v13, v14);
      objc_msgSend_resumeActivityStreamingPrivate(self, v15, v16, v17, v18);
      self->_internal->_activityActive = 1;
    }
  }
}

- (void)stopActivityUpdatesPrivate
{
  const char *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;

  dispatch_assert_queue_V2((dispatch_queue_t)self->_internal->_dispatchQueue);
  if (objc_msgSend_isActivityAvailable(self, v3, v4, v5, v6))
  {
    if (self->_internal->_activityActive)
    {
      objc_msgSend_pauseActivityStreamingPrivate(self, v7, v8, v9, v10);
      self->_internal->_activityActive = 0;

      self->_internal->_activityCallbackQueue = 0;
      self->_internal->_activityHandler = 0;
      MEMORY[0x1E0DE7D20](self->_internal, sel_disconnectActivity, v11, v12, v13);
    }
  }
}

- (void)resumeActivityStreamingPrivate
{
  const char *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  CMHeadphoneActivityManagerInternal *internal;
  const char *v12;
  void *v13;
  RMConnectionClient *activityConnectionClient;
  _QWORD v15[4];
  id v16;
  id location;

  dispatch_assert_queue_V2((dispatch_queue_t)self->_internal->_dispatchQueue);
  if (objc_msgSend_isActivityAvailable(self, v3, v4, v5, v6))
  {
    internal = self->_internal;
    if (!internal->_activityStreaming)
    {
      objc_msgSend_connectActivity(internal, v7, v8, v9, v10);
      v13 = (void *)objc_msgSend_archivedDataWithRootObject_requiringSecureCoding_error_(MEMORY[0x1E0CB36F8], v12, MEMORY[0x1E0C9AA70], 1, 0);
      objc_initWeak(&location, self);
      activityConnectionClient = self->_internal->_activityConnectionClient;
      v15[0] = MEMORY[0x1E0C809B0];
      v15[1] = 3221225472;
      v15[2] = sub_18F48C510;
      v15[3] = &unk_1E2958C00;
      objc_copyWeak(&v16, &location);
      sub_18F386718((uint64_t)activityConnectionClient, CFSTR("kRMStartStreamingHeadphoneActivity"), v13, v15);
      self->_internal->_activityStreaming = 1;
      objc_destroyWeak(&v16);
      objc_destroyWeak(&location);
    }
  }
}

- (void)pauseActivityStreamingPrivate
{
  const char *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  CMHeadphoneActivityManagerInternal *internal;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  const char *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;

  dispatch_assert_queue_V2((dispatch_queue_t)self->_internal->_dispatchQueue);
  if (objc_msgSend_isActivityAvailable(self, v3, v4, v5, v6))
  {
    internal = self->_internal;
    if (internal->_activityStreaming)
    {
      internal->_activityStreaming = 0;
      sub_18F386D88((uint64_t)self->_internal->_activityConnectionClient);
      if ((objc_msgSend_hasConnectionClients(self, v8, v9, v10, v11) & 1) == 0)
        objc_msgSend_notifyDeviceDisconnectedEventToClientPrivate(self, v12, v13, v14, v15);
    }
  }
}

- (void)onActivityPrivate:(id)a3 error:(id)a4
{
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  CFAbsoluteTime Current;
  CMHeadphoneActivityManagerInternal *internal;
  id activityHandler;
  BOOL v13;
  NSOperationQueue *activityCallbackQueue;
  _QWORD v15[7];

  Current = CFAbsoluteTimeGetCurrent();
  internal = self->_internal;
  if (Current >= internal->_startTime)
  {
    activityHandler = internal->_activityHandler;
    if (activityHandler)
      v13 = ((unint64_t)a3 | (unint64_t)a4) == 0;
    else
      v13 = 1;
    if (!v13)
    {
      activityCallbackQueue = internal->_activityCallbackQueue;
      v15[0] = MEMORY[0x1E0C809B0];
      v15[1] = 3221225472;
      v15[2] = sub_18F48C7D8;
      v15[3] = &unk_1E2955BD8;
      v15[4] = a3;
      v15[5] = a4;
      v15[6] = activityHandler;
      objc_msgSend_addOperationWithBlock_(activityCallbackQueue, v7, (uint64_t)v15, v8, v9);
    }
  }
}

- (void)startStatusUpdatesPrivateToQueue:(id)a3 withHandler:(id)a4
{
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  const char *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  const char *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;

  dispatch_assert_queue_V2((dispatch_queue_t)self->_internal->_dispatchQueue);
  if (objc_msgSend_isStatusAvailable(self, v7, v8, v9, v10))
  {
    if (!self->_internal->_statusActive)
    {
      self->_internal->_statusCallbackQueue = (NSOperationQueue *)a3;
      self->_internal->_statusHandler = (id)objc_msgSend_copy(a4, v11, v12, v13, v14);
      objc_msgSend_resumeStatusStreamingPrivate(self, v15, v16, v17, v18);
      self->_internal->_statusActive = 1;
    }
  }
}

- (void)stopStatusUpdatesPrivate
{
  const char *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  const char *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;

  dispatch_assert_queue_V2((dispatch_queue_t)self->_internal->_dispatchQueue);
  if (objc_msgSend_isStatusAvailable(self, v3, v4, v5, v6) && self->_internal->_statusActive)
  {
    objc_msgSend_pauseStatusStreamingPrivate(self, v7, v8, v9, v10);
    self->_internal->_statusActive = 0;

    self->_internal->_statusCallbackQueue = 0;
    self->_internal->_statusHandler = 0;
    if ((objc_msgSend_hasConnectionClients(self, v11, v12, v13, v14) & 1) == 0)
      MEMORY[0x1E0DE7D20](self->_internal, sel_disconnectStatus, v15, v16, v17);
  }
}

- (void)resumeStatusStreamingPrivate
{
  const char *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  CMHeadphoneActivityManagerInternal *internal;
  const char *v12;
  uint64_t v13;
  const char *v14;
  void *v15;
  RMConnectionClient *statusConnectionClient;
  _QWORD v17[4];
  id v18;
  id location;
  const __CFString *v20;
  _QWORD v21[2];

  v21[1] = *MEMORY[0x1E0C80C00];
  dispatch_assert_queue_V2((dispatch_queue_t)self->_internal->_dispatchQueue);
  if (objc_msgSend_isStatusAvailable(self, v3, v4, v5, v6))
  {
    internal = self->_internal;
    if (!internal->_statusStreaming)
    {
      objc_msgSend_connectStatus(internal, v7, v8, v9, v10);
      v20 = CFSTR("RequireActivitySupport");
      v21[0] = MEMORY[0x1E0C9AAB0];
      v13 = objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x1E0C99D80], v12, (uint64_t)v21, (uint64_t)&v20, 1);
      v15 = (void *)objc_msgSend_archivedDataWithRootObject_requiringSecureCoding_error_(MEMORY[0x1E0CB36F8], v14, v13, 1, 0);
      objc_initWeak(&location, self);
      statusConnectionClient = self->_internal->_statusConnectionClient;
      v17[0] = MEMORY[0x1E0C809B0];
      v17[1] = 3221225472;
      v17[2] = sub_18F48CC40;
      v17[3] = &unk_1E2958C00;
      objc_copyWeak(&v18, &location);
      sub_18F386718((uint64_t)statusConnectionClient, CFSTR("kRMStartStreamingHeadphoneStatus"), v15, v17);
      self->_internal->_statusStreaming = 1;
      objc_destroyWeak(&v18);
      objc_destroyWeak(&location);
    }
  }
}

- (void)pauseStatusStreamingPrivate
{
  const char *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  CMHeadphoneActivityManagerInternal *internal;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  const char *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;

  dispatch_assert_queue_V2((dispatch_queue_t)self->_internal->_dispatchQueue);
  if (objc_msgSend_isStatusAvailable(self, v3, v4, v5, v6))
  {
    internal = self->_internal;
    if (internal->_statusStreaming)
    {
      internal->_statusStreaming = 0;
      sub_18F386D88((uint64_t)self->_internal->_statusConnectionClient);
      if ((objc_msgSend_hasConnectionClients(self, v8, v9, v10, v11) & 1) == 0)
        objc_msgSend_notifyDeviceDisconnectedEventToClientPrivate(self, v12, v13, v14, v15);
    }
  }
}

- (void)onStatusEventPrivate:(id)a3
{
  uint64_t v3;
  uint64_t v4;
  void *v6;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  const char *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  NSObject *v17;
  char *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint8_t buf[4];
  void *v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v6 = (void *)objc_msgSend_objectForKeyedSubscript_(a3, a2, (uint64_t)CFSTR("EventType"), v3, v4);
  if (objc_msgSend_isEqualToString_(v6, v7, (uint64_t)CFSTR("Connect"), v8, v9))
  {
    self->_internal->_startTime = CFAbsoluteTimeGetCurrent() + 1.0;
    MEMORY[0x1E0DE7D20](self, sel_notifyDeviceConnectedEventToClientPrivate, v19, v20, v21);
  }
  else if (objc_msgSend_isEqualToString_(v6, v10, (uint64_t)CFSTR("Disconnect"), v11, v12))
  {
    self->_internal->_startTime = 1.79769313e308;
    objc_msgSend_notifyDeviceDisconnectedEventToClientPrivate(self, v13, v14, v15, v16);
  }
  else
  {
    if (qword_1ECEDEE78 != -1)
      dispatch_once(&qword_1ECEDEE78, &unk_1E2958C40);
    v17 = off_1ECEDEE70;
    if (os_log_type_enabled((os_log_t)off_1ECEDEE70, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543362;
      v23 = v6;
      _os_log_impl(&dword_18F1DC000, v17, OS_LOG_TYPE_ERROR, "[CMHeadphoneActivityManager] Unknown eventType: %{public}@", buf, 0xCu);
    }
    if (sub_18F1FCA08(115, 0))
    {
      bzero(buf, 0x65CuLL);
      if (qword_1ECEDEE78 != -1)
        dispatch_once(&qword_1ECEDEE78, &unk_1E2958C40);
      v18 = (char *)_os_log_send_and_compose_impl();
      sub_18F419700("Generic", 1, 0, 0, "-[CMHeadphoneActivityManager onStatusEventPrivate:]", "CoreLocation: %s\n", v18);
      if (v18 != (char *)buf)
        free(v18);
    }
  }
}

- (void)notifyDeviceConnectedEventToClientPrivate
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  void *v6;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  _QWORD v10[5];

  v6 = (void *)objc_msgSend_delegateQueuePrivate(self, a2, v2, v3, v4);
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = sub_18F48D050;
  v10[3] = &unk_1E2955938;
  v10[4] = self;
  objc_msgSend_addOperationWithBlock_(v6, v7, (uint64_t)v10, v8, v9);
}

- (void)notifyDeviceDisconnectedEventToClientPrivate
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  void *v6;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  _QWORD v10[5];

  v6 = (void *)objc_msgSend_delegateQueuePrivate(self, a2, v2, v3, v4);
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = sub_18F48D450;
  v10[3] = &unk_1E2955938;
  v10[4] = self;
  objc_msgSend_addOperationWithBlock_(v6, v7, (uint64_t)v10, v8, v9);
}

@end
