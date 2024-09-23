@implementation CMHeadphoneMotionManager

- (CMHeadphoneMotionManager)init
{
  CMHeadphoneMotionManager *v2;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)CMHeadphoneMotionManager;
  v2 = -[CMHeadphoneMotionManager init](&v4, sel_init);
  if (v2)
    v2->_internal = (CMHeadphoneMotionManagerInternal *)objc_opt_new();
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
  objc_super v12;
  _QWORD block[5];

  dispatch_queue_set_specific((dispatch_queue_t)self->_internal->_dispatchQueue, &unk_1EE16E858, &unk_1EE16E858, 0);
  if (dispatch_get_specific(&unk_1EE16E858) == &unk_1EE16E858)
  {
    objc_msgSend_pauseDeviceMotionStreamingPrivate(self, v3, v4, v5, v6);
    objc_msgSend_pauseStatusStreamingPrivate(self, v8, v9, v10, v11);
  }
  else
  {
    dispatchQueue = self->_internal->_dispatchQueue;
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = sub_18F493240;
    block[3] = &unk_1E2955938;
    block[4] = self;
    dispatch_sync(dispatchQueue, block);
  }

  v12.receiver = self;
  v12.super_class = (Class)CMHeadphoneMotionManager;
  -[CMHeadphoneMotionManager dealloc](&v12, sel_dealloc);
}

+ (CMAuthorizationStatus)authorizationStatus
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  return objc_msgSend_authorizationStatus(CMMotionUtils, a2, v2, v3, v4);
}

- (BOOL)isDeviceMotionAvailable
{
  if (qword_1ECEDFC18 != -1)
    dispatch_once(&qword_1ECEDFC18, &unk_1E2955188);
  return byte_1ECEDFC10;
}

- (BOOL)isDeviceMotionActive
{
  return self->_internal->_deviceMotionActive;
}

- (BOOL)isConnectionStatusActive
{
  return self->_internal->_statusStreaming;
}

- (CMDeviceMotion)deviceMotion
{
  return (CMDeviceMotion *)((uint64_t (*)(CMHeadphoneMotionManagerInternal *, char *))MEMORY[0x1E0DE7D20])(self->_internal, sel_deviceMotion);
}

- (void)startDeviceMotionUpdates
{
  uint64_t v2;
  uint64_t v3;
  _QWORD v4[5];

  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = sub_18F493374;
  v4[3] = &unk_1E2955938;
  v4[4] = self;
  objc_msgSend_tccServiceMotionAccessAllowingMacWithBlock_(CMMotionUtils, a2, (uint64_t)v4, v2, v3);
}

- (void)startDeviceMotionUpdatesToQueue:(NSOperationQueue *)queue withHandler:(CMHeadphoneDeviceMotionHandler)handler
{
  uint64_t v4;
  _QWORD v5[7];

  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = sub_18F493440;
  v5[3] = &unk_1E2955BD8;
  v5[4] = self;
  v5[5] = queue;
  v5[6] = handler;
  objc_msgSend_tccServiceMotionAccessAllowingMacWithBlock_(CMMotionUtils, a2, (uint64_t)v5, (uint64_t)handler, v4);
}

- (void)stopDeviceMotionUpdates
{
  uint64_t v2;
  uint64_t v3;
  _QWORD v4[5];

  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = sub_18F493518;
  v4[3] = &unk_1E2955938;
  v4[4] = self;
  objc_msgSend_tccServiceMotionAccessAllowingMacWithBlock_(CMMotionUtils, a2, (uint64_t)v4, v2, v3);
}

- (void)startConnectionStatusUpdates
{
  NSObject *dispatchQueue;
  _QWORD block[5];

  dispatchQueue = self->_internal->_dispatchQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = sub_18F4935D8;
  block[3] = &unk_1E2955938;
  block[4] = self;
  dispatch_sync(dispatchQueue, block);
}

- (void)stopConnectionStatusUpdates
{
  NSObject *dispatchQueue;
  _QWORD block[5];

  dispatchQueue = self->_internal->_dispatchQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = sub_18F49363C;
  block[3] = &unk_1E2955938;
  block[4] = self;
  dispatch_sync(dispatchQueue, block);
}

- (BOOL)hasConnectionClients
{
  id Weak;
  CMHeadphoneMotionManagerInternal *internal;

  Weak = objc_loadWeak((id *)&self->_delegate);
  internal = self->_internal;
  return Weak && internal->_statusActive || internal->_deviceMotionActive;
}

- (id)delegateQueuePrivate
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  id result;

  result = self->_internal->_callbackQueue;
  if (!result)
    return (id)objc_msgSend_mainQueue(MEMORY[0x1E0CB3828], a2, v2, v3, v4);
  return result;
}

- (void)startDeviceMotionUpdatesPrivateToQueue:(id)a3 withHandler:(id)a4
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
  if (objc_msgSend_isDeviceMotionAvailable(self, v7, v8, v9, v10))
  {
    if (!self->_internal->_deviceMotionActive)
    {
      self->_internal->_callbackQueue = (NSOperationQueue *)a3;
      self->_internal->_callbackHandler = (id)objc_msgSend_copy(a4, v11, v12, v13, v14);
      objc_msgSend_resumeDeviceMotionStreamingPrivate(self, v15, v16, v17, v18);
      self->_internal->_deviceMotionActive = 1;
    }
  }
}

- (void)stopDeviceMotionUpdatesPrivate
{
  const char *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  CMHeadphoneMotionManagerInternal *internal;
  const char *v12;
  uint64_t v13;
  uint64_t v14;
  const char *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;

  dispatch_assert_queue_V2((dispatch_queue_t)self->_internal->_dispatchQueue);
  if (objc_msgSend_isDeviceMotionAvailable(self, v3, v4, v5, v6))
  {
    internal = self->_internal;
    if (internal->_deviceMotionActive)
    {
      internal->_deviceMotionActive = 0;
      objc_msgSend_pauseDeviceMotionStreamingPrivate(self, v7, v8, v9, v10);

      self->_internal->_callbackQueue = 0;
      self->_internal->_callbackHandler = 0;
      objc_msgSend_setDeviceMotion_(self->_internal, v12, 0, v13, v14);
      objc_msgSend_disconnect(self->_internal, v15, v16, v17, v18);
    }
  }
}

- (void)resumeDeviceMotionStreamingPrivate
{
  const char *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  CMHeadphoneMotionManagerInternal *internal;
  const char *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  const char *v16;
  void *v17;
  RMConnectionClient *connectionClient;
  _QWORD v19[4];
  id v20;
  id location;

  dispatch_assert_queue_V2((dispatch_queue_t)self->_internal->_dispatchQueue);
  if (objc_msgSend_isDeviceMotionAvailable(self, v3, v4, v5, v6))
  {
    internal = self->_internal;
    if (!internal->_deviceMotionStreaming)
    {
      objc_msgSend_connect(internal, v7, v8, v9, v10);
      objc_msgSend_resumeStatusStreamingPrivate(self, v12, v13, v14, v15);
      v17 = (void *)objc_msgSend_archivedDataWithRootObject_requiringSecureCoding_error_(MEMORY[0x1E0CB36F8], v16, (uint64_t)&unk_1E298C280, 1, 0);
      objc_initWeak(&location, self);
      connectionClient = self->_internal->_connectionClient;
      v19[0] = MEMORY[0x1E0C809B0];
      v19[1] = 3221225472;
      v19[2] = sub_18F4938E0;
      v19[3] = &unk_1E2958C00;
      objc_copyWeak(&v20, &location);
      sub_18F386718((uint64_t)connectionClient, CFSTR("kRMStartStreamingHeadphoneMotion"), v17, v19);
      self->_internal->_deviceMotionStreaming = 1;
      objc_destroyWeak(&v20);
      objc_destroyWeak(&location);
    }
  }
}

- (void)pauseDeviceMotionStreamingPrivate
{
  const char *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  CMHeadphoneMotionManagerInternal *internal;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  const char *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  const char *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;

  dispatch_assert_queue_V2((dispatch_queue_t)self->_internal->_dispatchQueue);
  if (objc_msgSend_isDeviceMotionAvailable(self, v3, v4, v5, v6))
  {
    internal = self->_internal;
    if (internal->_deviceMotionStreaming)
    {
      sub_18F386D88((uint64_t)internal->_connectionClient);
      self->_internal->_deviceMotionStreaming = 0;
      if ((objc_msgSend_hasConnectionClients(self, v8, v9, v10, v11) & 1) == 0)
      {
        objc_msgSend_pauseStatusStreamingPrivate(self, v12, v13, v14, v15);
        objc_msgSend_notifyDeviceDisconnectedEventToClientPrivate(self, v16, v17, v18, v19);
      }
      CFAbsoluteTimeGetCurrent();
      AnalyticsSendEventLazy();
    }
  }
}

- (void)onDeviceMotionPrivate:(id)a3
{
  uint64_t v3;
  uint64_t v4;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  const char *v13;
  uint64_t v14;
  uint64_t v15;
  CMHeadphoneMotionManagerInternal *internal;
  id callbackHandler;
  NSOperationQueue *callbackQueue;
  _QWORD v19[6];

  if (objc_msgSend_isInitialized(a3, a2, (uint64_t)a3, v3, v4))
  {
    objc_msgSend_applyInitialReferencePrivate_(self, v7, (uint64_t)a3, v8, v9);
    objc_msgSend_setDeviceMotion_(self->_internal, v10, (uint64_t)a3, v11, v12);
    if (a3)
    {
      internal = self->_internal;
      callbackHandler = internal->_callbackHandler;
      if (callbackHandler)
      {
        callbackQueue = internal->_callbackQueue;
        v19[0] = MEMORY[0x1E0C809B0];
        v19[1] = 3221225472;
        v19[2] = sub_18F493D7C;
        v19[3] = &unk_1E2955B38;
        v19[4] = a3;
        v19[5] = callbackHandler;
        objc_msgSend_addOperationWithBlock_(callbackQueue, v13, (uint64_t)v19, v14, v15);
      }
    }
  }
}

- (void)applyInitialReferencePrivate:(id)a3
{
  uint64_t v3;
  uint64_t v4;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  const char *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  double v16;
  const char *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  const char *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  double v26;
  const char *v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  void *v31;
  const char *v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  double v36;
  const char *v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  void *v41;
  const char *v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  double v46;
  CMAttitude *v47;
  const char *v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  id v52;
  const char *v53;
  uint64_t v54;
  uint64_t v55;
  NSObject *v56;
  double v57;
  void *v58;
  const char *v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  const char *v64;
  uint64_t v65;
  uint64_t v66;
  double v67;
  char *v68;
  double v69[4];
  double v70[4];
  int v71;
  double v72;
  uint8_t buf[4];
  double v74;
  uint64_t v75;

  v75 = *MEMORY[0x1E0C80C00];
  if (!objc_msgSend_initialReferenceAttitude(self->_internal, a2, (uint64_t)a3, v3, v4))
  {
    v11 = (void *)objc_msgSend_attitude(a3, v7, v8, v9, v10);
    objc_msgSend_quaternion(v11, v12, v13, v14, v15);
    v70[0] = v16;
    v21 = (void *)objc_msgSend_attitude(a3, v17, v18, v19, v20);
    objc_msgSend_quaternion(v21, v22, v23, v24, v25);
    v70[1] = v26;
    v31 = (void *)objc_msgSend_attitude(a3, v27, v28, v29, v30);
    objc_msgSend_quaternion(v31, v32, v33, v34, v35);
    v70[2] = v36;
    v41 = (void *)objc_msgSend_attitude(a3, v37, v38, v39, v40);
    objc_msgSend_quaternion(v41, v42, v43, v44, v45);
    v70[3] = v46;
    sub_18F1E26B4((uint64_t)v69, v70);
    v47 = [CMAttitude alloc];
    v52 = (id)objc_msgSend_initWithQuaternion_(v47, v48, v49, v50, v51, v69[0], v69[1], v69[2], v69[3]);
    objc_msgSend_setInitialReferenceAttitude_(self->_internal, v53, (uint64_t)v52, v54, v55);
    self->_internal->_firstValidDeviceMotionTimestamp = CFAbsoluteTimeGetCurrent();
    if (qword_1ECEDEE78 != -1)
      dispatch_once(&qword_1ECEDEE78, &unk_1E2945148);
    v56 = off_1ECEDEE70;
    if (os_log_type_enabled((os_log_t)off_1ECEDEE70, OS_LOG_TYPE_DEFAULT))
    {
      v57 = self->_internal->_firstValidDeviceMotionTimestamp - self->_internal->_deviceConnectionTimestamp;
      *(_DWORD *)buf = 134349056;
      v74 = v57;
      _os_log_impl(&dword_18F1DC000, v56, OS_LOG_TYPE_DEFAULT, "[CMHeadphoneMotionManager] Initial reference attitude is set after %{public}.3f sec from connection", buf, 0xCu);
    }
    if (sub_18F1FCA08(115, 2))
    {
      bzero(buf, 0x65CuLL);
      if (qword_1ECEDEE78 != -1)
        dispatch_once(&qword_1ECEDEE78, &unk_1E2945148);
      v67 = self->_internal->_firstValidDeviceMotionTimestamp - self->_internal->_deviceConnectionTimestamp;
      v71 = 134349056;
      v72 = v67;
      v68 = (char *)_os_log_send_and_compose_impl();
      sub_18F419700("Generic", 1, 0, 2, "-[CMHeadphoneMotionManager applyInitialReferencePrivate:]", "CoreLocation: %s\n", v68);
      if (v68 != (char *)buf)
        free(v68);
    }
  }
  v58 = (void *)objc_msgSend_attitude(a3, v7, v8, v9, v10);
  v63 = objc_msgSend_initialReferenceAttitude(self->_internal, v59, v60, v61, v62);
  objc_msgSend_multiplyByInverseOfAttitude_(v58, v64, v63, v65, v66);
}

- (void)startStatusUpdatesPrivate
{
  const char *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;

  dispatch_assert_queue_V2((dispatch_queue_t)self->_internal->_dispatchQueue);
  if (objc_msgSend_isDeviceMotionAvailable(self, v3, v4, v5, v6))
  {
    if (!self->_internal->_statusActive)
    {
      objc_msgSend_resumeStatusStreamingPrivate(self, v7, v8, v9, v10);
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
  CMHeadphoneMotionManagerInternal *internal;
  const char *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;

  dispatch_assert_queue_V2((dispatch_queue_t)self->_internal->_dispatchQueue);
  if (objc_msgSend_isDeviceMotionAvailable(self, v3, v4, v5, v6))
  {
    internal = self->_internal;
    if (internal->_statusActive && !internal->_deviceMotionActive)
    {
      objc_msgSend_pauseStatusStreamingPrivate(self, v7, v8, v9, v10);
      self->_internal->_statusActive = 0;
      if ((objc_msgSend_hasConnectionClients(self, v12, v13, v14, v15) & 1) == 0)
        MEMORY[0x1E0DE7D20](self->_internal, sel_disconnectStatus, v16, v17, v18);
    }
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
  CMHeadphoneMotionManagerInternal *internal;
  const char *v12;
  void *v13;
  RMConnectionClient *statusConnectionClient;
  _QWORD v15[4];
  id v16;
  id location;

  dispatch_assert_queue_V2((dispatch_queue_t)self->_internal->_dispatchQueue);
  if (objc_msgSend_isDeviceMotionAvailable(self, v3, v4, v5, v6))
  {
    internal = self->_internal;
    if (!internal->_statusStreaming)
    {
      objc_msgSend_connectStatus(internal, v7, v8, v9, v10);
      v13 = (void *)objc_msgSend_archivedDataWithRootObject_requiringSecureCoding_error_(MEMORY[0x1E0CB36F8], v12, MEMORY[0x1E0C9AA70], 1, 0);
      objc_initWeak(&location, self);
      statusConnectionClient = self->_internal->_statusConnectionClient;
      v15[0] = MEMORY[0x1E0C809B0];
      v15[1] = 3221225472;
      v15[2] = sub_18F494394;
      v15[3] = &unk_1E2958C00;
      objc_copyWeak(&v16, &location);
      sub_18F386718((uint64_t)statusConnectionClient, CFSTR("kRMStartStreamingHeadphoneStatus"), v13, v15);
      self->_internal->_statusStreaming = 1;
      objc_destroyWeak(&v16);
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
  CMHeadphoneMotionManagerInternal *internal;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  const char *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;

  dispatch_assert_queue_V2((dispatch_queue_t)self->_internal->_dispatchQueue);
  if (objc_msgSend_isDeviceMotionAvailable(self, v3, v4, v5, v6))
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
    objc_msgSend_setInitialReferenceAttitude_(self->_internal, v10, 0, v11, v12);
    self->_internal->_deviceConnectionTimestamp = CFAbsoluteTimeGetCurrent();
    MEMORY[0x1E0DE7D20](self, sel_notifyDeviceConnectedEventToClientPrivate, v19, v20, v21);
  }
  else if (objc_msgSend_isEqualToString_(v6, v10, (uint64_t)CFSTR("Disconnect"), v11, v12))
  {
    self->_internal->_deviceConnectionTimestamp = 0.0;
    objc_msgSend_notifyDeviceDisconnectedEventToClientPrivate(self, v13, v14, v15, v16);
  }
  else
  {
    if (qword_1ECEDEE78 != -1)
      dispatch_once(&qword_1ECEDEE78, &unk_1E2945148);
    v17 = off_1ECEDEE70;
    if (os_log_type_enabled((os_log_t)off_1ECEDEE70, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543362;
      v23 = v6;
      _os_log_impl(&dword_18F1DC000, v17, OS_LOG_TYPE_ERROR, "[CMHeadphoneMotionManager] Unknown eventType: %{public}@", buf, 0xCu);
    }
    if (sub_18F1FCA08(115, 0))
    {
      bzero(buf, 0x65CuLL);
      if (qword_1ECEDEE78 != -1)
        dispatch_once(&qword_1ECEDEE78, &unk_1E2945148);
      v18 = (char *)_os_log_send_and_compose_impl();
      sub_18F419700("Generic", 1, 0, 0, "-[CMHeadphoneMotionManager onStatusEventPrivate:]", "CoreLocation: %s\n", v18);
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
  v10[2] = sub_18F4947A4;
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
  v10[2] = sub_18F4949E4;
  v10[3] = &unk_1E2955938;
  v10[4] = self;
  objc_msgSend_addOperationWithBlock_(v6, v7, (uint64_t)v10, v8, v9);
}

- (id)delegate
{
  return objc_loadWeak((id *)&self->_delegate);
}

- (void)setDelegate:(id)delegate
{
  objc_storeWeak((id *)&self->_delegate, delegate);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
}

@end
