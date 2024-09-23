@implementation CMDistributedSensingManagerInternal

- (CMDistributedSensingManagerInternal)init
{
  id v2;
  NSObject *v3;
  uint64_t v4;
  void *v6[2];
  char v7;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)CMDistributedSensingManagerInternal;
  v2 = -[CMDistributedSensingManagerInternal init](&v8, sel_init);
  if (v2)
  {
    v3 = dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_USER_INTERACTIVE, 0);
    *((_QWORD *)v2 + 2) = dispatch_queue_create("com.apple.CoreMotion.CMDistributedSensingManagerInternalQueue", v3);
    *((_QWORD *)v2 + 3) = dispatch_queue_create("com.apple.CoreMotion.CMDistributedSensingManagerClientQueue", v3);
    v4 = operator new();
    sub_18F270374(v6, "com.apple.locationd.registration");
    MEMORY[0x19400100C](v4, v6, *((_QWORD *)v2 + 2));
    *((_QWORD *)v2 + 1) = v4;
    if (v7 < 0)
      operator delete(v6[0]);
    objc_storeWeak((id *)v2 + 4, 0);
    objc_storeWeak((id *)v2 + 5, 0);
    CLConnectionClient::setDefaultMessageHandler();
    CLConnectionClient::setInterruptionHandler();
    CLConnectionClient::start(*((CLConnectionClient **)v2 + 1));
  }
  return (CMDistributedSensingManagerInternal *)v2;
}

- (void)dealloc
{
  objc_super v3;

  dispatch_release((dispatch_object_t)self->_internalQueue);
  self->_internalQueue = 0;
  dispatch_release((dispatch_object_t)self->_clientQueue);
  self->_clientQueue = 0;
  v3.receiver = self;
  v3.super_class = (Class)CMDistributedSensingManagerInternal;
  -[CMDistributedSensingManagerInternal dealloc](&v3, sel_dealloc);
}

- (void)_teardown
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v6;
  void *__p;
  char v8;

  objc_msgSend__unregisterForVehicleStateUpdates(self, a2, v2, v3, v4);
  sub_18F270374(&__p, "DistributedSensing/kCLConnectionMessageDistributedSensingVehicleStateUpdate");
  CLConnectionClient::setHandlerForMessage();
  if (v8 < 0)
    operator delete(__p);
  if (self->_locationdConnection)
  {
    v6 = MEMORY[0x194001018]();
    MEMORY[0x194001438](v6, 0xB0C40BC2CC919);
  }
  self->_locationdConnection = 0;
}

- (void)_handleDaemonMessage:(id)a3 data:(id)a4
{
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  const char *v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  const char *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  const char *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  NSObject *v26;
  NSObject *clientQueue;
  NSObject *v28;
  NSObject *v29;
  const char *v30;
  uint64_t v31;
  uint64_t v32;
  void *v33;
  const char *v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  void *v38;
  NSObject *v39;
  char *v40;
  char *v41;
  _QWORD v42[6];
  _QWORD block[6];
  int v44;
  uint64_t v45;
  uint8_t buf[4];
  uint64_t v47;
  uint64_t v48;

  v48 = *MEMORY[0x1E0C80C00];
  if (!objc_loadWeak((id *)&self->_delegate))
    return;
  if (!a4)
  {
    if (qword_1EE16D8B8 != -1)
      dispatch_once(&qword_1EE16D8B8, &unk_1E2952FA8);
    v28 = qword_1EE16D8C0;
    if (os_log_type_enabled((os_log_t)qword_1EE16D8C0, OS_LOG_TYPE_FAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_18F1DC000, v28, OS_LOG_TYPE_FAULT, "nil dictionary", buf, 2u);
    }
    if (!sub_18F1FCA08(115, 0))
      return;
    bzero(buf, 0x65CuLL);
    if (qword_1EE16D8B8 != -1)
      dispatch_once(&qword_1EE16D8B8, &unk_1E2952FA8);
    LOWORD(v44) = 0;
LABEL_30:
    v40 = (char *)_os_log_send_and_compose_impl();
    sub_18F419700("Generic", 1, 0, 0, "-[CMDistributedSensingManagerInternal _handleDaemonMessage:data:]", "CoreLocation: %s\n", v40);
    if (v40 != (char *)buf)
      free(v40);
    return;
  }
  if (objc_msgSend_isEqualToString_(a3, v7, (uint64_t)CFSTR("DistributedSensing/kCLConnectionMessageDistributedSensingVehicleStateUpdate"), v8, v9))
  {
    if (objc_msgSend_objectForKeyedSubscript_(a4, v10, (uint64_t)CFSTR("CMErrorMessage"), v11, v12))
    {
      v16 = (void *)objc_msgSend_objectForKeyedSubscript_(a4, v13, (uint64_t)CFSTR("CMErrorMessage"), v14, v15);
      v21 = objc_msgSend_integerValue(v16, v17, v18, v19, v20);
      v25 = objc_msgSend_CMErrorWithCode_(CMErrorUtils, v22, v21, v23, v24);
      if (qword_1EE16D8B8 != -1)
        dispatch_once(&qword_1EE16D8B8, &unk_1E2952FA8);
      v26 = qword_1EE16D8C0;
      if (os_log_type_enabled((os_log_t)qword_1EE16D8C0, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        v47 = v25;
        _os_log_impl(&dword_18F1DC000, v26, OS_LOG_TYPE_ERROR, "Vehicle State, error, %@", buf, 0xCu);
      }
      if (sub_18F1FCA08(115, 0))
      {
        bzero(buf, 0x65CuLL);
        if (qword_1EE16D8B8 != -1)
          dispatch_once(&qword_1EE16D8B8, &unk_1E2952FA8);
        v44 = 138412290;
        v45 = v25;
        v41 = (char *)_os_log_send_and_compose_impl();
        sub_18F419700("Generic", 1, 0, 0, "-[CMDistributedSensingManagerInternal _handleDaemonMessage:data:]", "CoreLocation: %s\n", v41);
        if (v41 != (char *)buf)
          free(v41);
      }
      clientQueue = self->_clientQueue;
      block[0] = MEMORY[0x1E0C809B0];
      block[1] = 3221225472;
      block[2] = sub_18F37BA98;
      block[3] = &unk_1E29559D0;
      block[4] = self;
      block[5] = v25;
      dispatch_async(clientQueue, block);
    }
    else if (objc_msgSend_objectForKeyedSubscript_(a4, v13, (uint64_t)CFSTR("CMDistributedSensingVehicleStateUpdateKey"), v14, v15))
    {
      v33 = (void *)objc_msgSend_objectForKeyedSubscript_(a4, v30, (uint64_t)CFSTR("CMDistributedSensingVehicleStateUpdateKey"), v31, v32);
      v38 = (void *)objc_msgSend_copy(v33, v34, v35, v36, v37);
      v39 = self->_clientQueue;
      v42[0] = MEMORY[0x1E0C809B0];
      v42[1] = 3221225472;
      v42[2] = sub_18F37BB04;
      v42[3] = &unk_1E29559D0;
      v42[4] = self;
      v42[5] = v38;
      dispatch_async(v39, v42);

    }
    return;
  }
  if (qword_1EE16D8B8 != -1)
    dispatch_once(&qword_1EE16D8B8, &unk_1E2952FA8);
  v29 = qword_1EE16D8C0;
  if (os_log_type_enabled((os_log_t)qword_1EE16D8C0, OS_LOG_TYPE_FAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_18F1DC000, v29, OS_LOG_TYPE_FAULT, "Unrecognizable dictionary", buf, 2u);
  }
  if (sub_18F1FCA08(115, 0))
  {
    bzero(buf, 0x65CuLL);
    if (qword_1EE16D8B8 != -1)
      dispatch_once(&qword_1EE16D8B8, &unk_1E2952FA8);
    LOWORD(v44) = 0;
    goto LABEL_30;
  }
}

- (void)_registerForVehicleStateUpdates
{
  NSObject *internalQueue;
  _QWORD block[5];

  internalQueue = self->_internalQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = sub_18F37BBC8;
  block[3] = &unk_1E2955938;
  block[4] = self;
  dispatch_async(internalQueue, block);
}

- (void)_unregisterForVehicleStateUpdates
{
  NSObject *internalQueue;
  _QWORD block[5];

  internalQueue = self->_internalQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = sub_18F37BE9C;
  block[3] = &unk_1E2955938;
  block[4] = self;
  dispatch_async(internalQueue, block);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_manager);
  objc_destroyWeak((id *)&self->_delegate);
}

@end
