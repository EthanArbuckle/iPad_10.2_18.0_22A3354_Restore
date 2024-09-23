@implementation CLFindMyAccessoryRangingManager

- (CLFindMyAccessoryRangingManager)init
{
  uint64_t v2;

  objc_msgSend_doesNotRecognizeSelector_(self, a2, (uint64_t)a2, v2);
  return 0;
}

- (CLFindMyAccessoryRangingManager)initWithDelegate:(id)a3 delegateQueue:(id)a4
{
  CLFindMyAccessoryRangingManager *v6;
  CLFindMyAccessoryRangingManager *v7;
  uint64_t v8;
  id v10[5];
  id v11;
  objc_super v12;
  id location[2];
  char v14;

  v12.receiver = self;
  v12.super_class = (Class)CLFindMyAccessoryRangingManager;
  v6 = -[CLFindMyAccessoryRangingManager init](&v12, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeWeak((id *)&v6->_delegate, a3);
    if (a4)
    {
      v7->_delegateQueue = (OS_dispatch_queue *)a4;
      dispatch_retain((dispatch_object_t)a4);
    }
    else
    {
      v7->_delegateQueue = (OS_dispatch_queue *)dispatch_queue_create("com.apple.findMyAccessoryRangingManager.privateQueue", 0);
    }
    v8 = operator new();
    sub_18F5D5990(location, "com.apple.locationd.registration");
    MEMORY[0x194002B20](v8, location, v7->_delegateQueue);
    if (v14 < 0)
      operator delete(location[0]);
    sub_18F61BBC8((uint64_t *)&v7->_connection, v8);
    objc_initWeak(location, v7);
    v10[1] = (id)MEMORY[0x1E0C809B0];
    v10[2] = (id)3221225472;
    v10[3] = sub_18F61AD68;
    v10[4] = &unk_1E2991720;
    objc_copyWeak(&v11, location);
    CLConnectionClient::setDefaultMessageHandler();
    objc_copyWeak(v10, location);
    CLConnectionClient::setInterruptionHandler();
    CLConnectionClient::start(v7->_connection.__ptr_.__value_);
    objc_destroyWeak(v10);
    objc_destroyWeak(&v11);
    objc_destroyWeak(location);
  }
  return v7;
}

- (void)handleMessage:(shared_ptr<CLConnectionMessage>)a3
{
  CLConnectionMessage **var0;
  NSObject *v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint8_t buf[4];
  uint64_t v9;
  uint64_t v10;

  var0 = (CLConnectionMessage **)a3.var0;
  v10 = *MEMORY[0x1E0C80C00];
  if (qword_1EE172118 != -1)
    dispatch_once(&qword_1EE172118, &unk_1E2990330);
  v4 = qword_1EE172120;
  if (os_log_type_enabled((os_log_t)qword_1EE172120, OS_LOG_TYPE_ERROR))
  {
    v5 = CLConnectionMessage::name(*var0);
    if (*(char *)(v5 + 23) >= 0)
      v6 = v5;
    else
      v6 = *(_QWORD *)v5;
    *(_DWORD *)buf = 136315138;
    v9 = v6;
    _os_log_impl(&dword_18F5B3000, v4, OS_LOG_TYPE_ERROR, "Got Reply: message: %s", buf, 0xCu);
  }
  if (sub_18F5C4AE0(115, 0))
  {
    bzero(buf, 0x65CuLL);
    if (qword_1EE172118 != -1)
      dispatch_once(&qword_1EE172118, &unk_1E2990330);
    CLConnectionMessage::name(*var0);
    v7 = (char *)_os_log_send_and_compose_impl();
    sub_18F5F2740("Generic", 1, 0, 0, "-[CLFindMyAccessoryRangingManager handleMessage:]", "CoreLocation: %s\n", v7);
    if (v7 != (char *)buf)
      free(v7);
  }
}

- (void)handleInterruption
{
  NSObject *v3;
  id v4;
  const char *v5;
  uint64_t v6;
  const char *v7;
  void *v8;
  id Weak;
  const char *v10;
  char *v11;
  uint64_t v12;
  const __CFString *v13;
  uint8_t buf[1640];
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  if (qword_1EE172118 != -1)
    dispatch_once(&qword_1EE172118, &unk_1E2990330);
  v3 = qword_1EE172120;
  if (os_log_type_enabled((os_log_t)qword_1EE172120, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_18F5B3000, v3, OS_LOG_TYPE_ERROR, "Connection to locationd interrupted!!", buf, 2u);
  }
  if (sub_18F5C4AE0(115, 0))
  {
    bzero(buf, 0x65CuLL);
    if (qword_1EE172118 != -1)
      dispatch_once(&qword_1EE172118, &unk_1E2990330);
    v11 = (char *)_os_log_send_and_compose_impl();
    sub_18F5F2740("Generic", 1, 0, 0, "-[CLFindMyAccessoryRangingManager handleInterruption]", "CoreLocation: %s\n", v11);
    if (v11 != (char *)buf)
      free(v11);
  }
  v4 = objc_alloc(MEMORY[0x1E0CB35C8]);
  v12 = *MEMORY[0x1E0CB2D50];
  v13 = CFSTR("Connection to locationd interrupted!");
  v6 = objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x1E0C99D80], v5, (uint64_t)&v13, (uint64_t)&v12, 1);
  v8 = (void *)objc_msgSend_initWithDomain_code_userInfo_(v4, v7, (uint64_t)CFSTR("kCLErrorDomainPrivate"), 8, v6);
  Weak = objc_loadWeak((id *)&self->_delegate);
  objc_msgSend_findMyAccessoryRangingManager_didFailWithError_forDevice_(Weak, v10, (uint64_t)self, (uint64_t)v8, 0);

}

- (void)connectToDevice:(id)a3
{
  id v4;
  const char *v5;
  uint64_t v6;
  const char *v7;
  void *v8;
  id Weak;
  const char *v10;
  uint64_t v11;
  _QWORD v12[2];

  v12[1] = *MEMORY[0x1E0C80C00];
  v4 = objc_alloc(MEMORY[0x1E0CB35C8]);
  v11 = *MEMORY[0x1E0CB2D50];
  v12[0] = CFSTR("Feature Not Supported");
  v6 = objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x1E0C99D80], v5, (uint64_t)v12, (uint64_t)&v11, 1);
  v8 = (void *)objc_msgSend_initWithDomain_code_userInfo_(v4, v7, (uint64_t)CFSTR("kCLErrorDomainPrivate"), 38, v6);
  Weak = objc_loadWeak((id *)&self->_delegate);
  objc_msgSend_findMyAccessoryRangingManager_didFailWithError_forDevice_(Weak, v10, (uint64_t)self, (uint64_t)v8, 0);

}

- (void)disconnectFromDevice:(id)a3
{
  id v4;
  const char *v5;
  uint64_t v6;
  const char *v7;
  void *v8;
  id Weak;
  const char *v10;
  uint64_t v11;
  _QWORD v12[2];

  v12[1] = *MEMORY[0x1E0C80C00];
  v4 = objc_alloc(MEMORY[0x1E0CB35C8]);
  v11 = *MEMORY[0x1E0CB2D50];
  v12[0] = CFSTR("Feature Not Supported");
  v6 = objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x1E0C99D80], v5, (uint64_t)v12, (uint64_t)&v11, 1);
  v8 = (void *)objc_msgSend_initWithDomain_code_userInfo_(v4, v7, (uint64_t)CFSTR("kCLErrorDomainPrivate"), 38, v6);
  Weak = objc_loadWeak((id *)&self->_delegate);
  objc_msgSend_findMyAccessoryRangingManager_didFailWithError_forDevice_(Weak, v10, (uint64_t)self, (uint64_t)v8, 0);

}

- (void)initRoseWithParameters:(id)a3 onDevice:(id)a4
{
  id v5;
  const char *v6;
  uint64_t v7;
  const char *v8;
  void *v9;
  id Weak;
  const char *v11;
  uint64_t v12;
  _QWORD v13[2];

  v13[1] = *MEMORY[0x1E0C80C00];
  v5 = objc_alloc(MEMORY[0x1E0CB35C8]);
  v12 = *MEMORY[0x1E0CB2D50];
  v13[0] = CFSTR("Feature Not Supported");
  v7 = objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x1E0C99D80], v6, (uint64_t)v13, (uint64_t)&v12, 1);
  v9 = (void *)objc_msgSend_initWithDomain_code_userInfo_(v5, v8, (uint64_t)CFSTR("kCLErrorDomainPrivate"), 38, v7);
  Weak = objc_loadWeak((id *)&self->_delegate);
  objc_msgSend_findMyAccessoryRangingManager_didFailWithError_forDevice_(Weak, v11, (uint64_t)self, (uint64_t)v9, 0);

}

- (void)stopRoseWithParameters:(id)a3 onDevice:(id)a4
{
  id v5;
  const char *v6;
  uint64_t v7;
  const char *v8;
  void *v9;
  id Weak;
  const char *v11;
  uint64_t v12;
  _QWORD v13[2];

  v13[1] = *MEMORY[0x1E0C80C00];
  v5 = objc_alloc(MEMORY[0x1E0CB35C8]);
  v12 = *MEMORY[0x1E0CB2D50];
  v13[0] = CFSTR("Feature Not Supported");
  v7 = objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x1E0C99D80], v6, (uint64_t)v13, (uint64_t)&v12, 1);
  v9 = (void *)objc_msgSend_initWithDomain_code_userInfo_(v5, v8, (uint64_t)CFSTR("kCLErrorDomainPrivate"), 38, v7);
  Weak = objc_loadWeak((id *)&self->_delegate);
  objc_msgSend_findMyAccessoryRangingManager_didFailWithError_forDevice_(Weak, v11, (uint64_t)self, (uint64_t)v9, 0);

}

- (void)setRoseRangingParameters:(id)a3 onDevice:(id)a4
{
  id v5;
  const char *v6;
  uint64_t v7;
  const char *v8;
  void *v9;
  id Weak;
  const char *v11;
  uint64_t v12;
  _QWORD v13[2];

  v13[1] = *MEMORY[0x1E0C80C00];
  v5 = objc_alloc(MEMORY[0x1E0CB35C8]);
  v12 = *MEMORY[0x1E0CB2D50];
  v13[0] = CFSTR("Feature Not Supported");
  v7 = objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x1E0C99D80], v6, (uint64_t)v13, (uint64_t)&v12, 1);
  v9 = (void *)objc_msgSend_initWithDomain_code_userInfo_(v5, v8, (uint64_t)CFSTR("kCLErrorDomainPrivate"), 38, v7);
  Weak = objc_loadWeak((id *)&self->_delegate);
  objc_msgSend_findMyAccessoryRangingManager_didFailWithError_forDevice_(Weak, v11, (uint64_t)self, (uint64_t)v9, 0);

}

- (void)prepareForStartRangingOnDevice:(id)a3
{
  id v4;
  const char *v5;
  uint64_t v6;
  const char *v7;
  void *v8;
  id Weak;
  const char *v10;
  uint64_t v11;
  _QWORD v12[2];

  v12[1] = *MEMORY[0x1E0C80C00];
  v4 = objc_alloc(MEMORY[0x1E0CB35C8]);
  v11 = *MEMORY[0x1E0CB2D50];
  v12[0] = CFSTR("Feature Not Supported");
  v6 = objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x1E0C99D80], v5, (uint64_t)v12, (uint64_t)&v11, 1);
  v8 = (void *)objc_msgSend_initWithDomain_code_userInfo_(v4, v7, (uint64_t)CFSTR("kCLErrorDomainPrivate"), 38, v6);
  Weak = objc_loadWeak((id *)&self->_delegate);
  objc_msgSend_findMyAccessoryRangingManager_didFailWithError_forDevice_(Weak, v10, (uint64_t)self, (uint64_t)v8, 0);

}

- (void)startRangingWithParameters:(id)a3 onDevice:(id)a4
{
  id v5;
  const char *v6;
  uint64_t v7;
  const char *v8;
  void *v9;
  id Weak;
  const char *v11;
  uint64_t v12;
  _QWORD v13[2];

  v13[1] = *MEMORY[0x1E0C80C00];
  v5 = objc_alloc(MEMORY[0x1E0CB35C8]);
  v12 = *MEMORY[0x1E0CB2D50];
  v13[0] = CFSTR("Feature Not Supported");
  v7 = objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x1E0C99D80], v6, (uint64_t)v13, (uint64_t)&v12, 1);
  v9 = (void *)objc_msgSend_initWithDomain_code_userInfo_(v5, v8, (uint64_t)CFSTR("kCLErrorDomainPrivate"), 38, v7);
  Weak = objc_loadWeak((id *)&self->_delegate);
  objc_msgSend_findMyAccessoryRangingManager_didFailWithError_forDevice_(Weak, v11, (uint64_t)self, (uint64_t)v9, 0);

}

- (void)stopRangingOnDevice:(id)a3
{
  id v4;
  const char *v5;
  uint64_t v6;
  const char *v7;
  void *v8;
  id Weak;
  const char *v10;
  uint64_t v11;
  _QWORD v12[2];

  v12[1] = *MEMORY[0x1E0C80C00];
  v4 = objc_alloc(MEMORY[0x1E0CB35C8]);
  v11 = *MEMORY[0x1E0CB2D50];
  v12[0] = CFSTR("Feature Not Supported");
  v6 = objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x1E0C99D80], v5, (uint64_t)v12, (uint64_t)&v11, 1);
  v8 = (void *)objc_msgSend_initWithDomain_code_userInfo_(v4, v7, (uint64_t)CFSTR("kCLErrorDomainPrivate"), 38, v6);
  Weak = objc_loadWeak((id *)&self->_delegate);
  objc_msgSend_findMyAccessoryRangingManager_didFailWithError_forDevice_(Weak, v10, (uint64_t)self, (uint64_t)v8, 0);

}

- (void)startEventCounterOnDevice:(id)a3
{
  id v4;
  const char *v5;
  uint64_t v6;
  const char *v7;
  void *v8;
  id Weak;
  const char *v10;
  uint64_t v11;
  _QWORD v12[2];

  v12[1] = *MEMORY[0x1E0C80C00];
  v4 = objc_alloc(MEMORY[0x1E0CB35C8]);
  v11 = *MEMORY[0x1E0CB2D50];
  v12[0] = CFSTR("Feature Not Supported");
  v6 = objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x1E0C99D80], v5, (uint64_t)v12, (uint64_t)&v11, 1);
  v8 = (void *)objc_msgSend_initWithDomain_code_userInfo_(v4, v7, (uint64_t)CFSTR("kCLErrorDomainPrivate"), 38, v6);
  Weak = objc_loadWeak((id *)&self->_delegate);
  objc_msgSend_findMyAccessoryRangingManager_didFailWithError_forDevice_(Weak, v10, (uint64_t)self, (uint64_t)v8, 0);

}

- (void)stopEventCounterOnDevice:(id)a3
{
  id v4;
  const char *v5;
  uint64_t v6;
  const char *v7;
  void *v8;
  id Weak;
  const char *v10;
  uint64_t v11;
  _QWORD v12[2];

  v12[1] = *MEMORY[0x1E0C80C00];
  v4 = objc_alloc(MEMORY[0x1E0CB35C8]);
  v11 = *MEMORY[0x1E0CB2D50];
  v12[0] = CFSTR("Feature Not Supported");
  v6 = objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x1E0C99D80], v5, (uint64_t)v12, (uint64_t)&v11, 1);
  v8 = (void *)objc_msgSend_initWithDomain_code_userInfo_(v4, v7, (uint64_t)CFSTR("kCLErrorDomainPrivate"), 38, v6);
  Weak = objc_loadWeak((id *)&self->_delegate);
  objc_msgSend_findMyAccessoryRangingManager_didFailWithError_forDevice_(Weak, v10, (uint64_t)self, (uint64_t)v8, 0);

}

- (void)fetchFirmwareVersionFromDevice:(id)a3
{
  id v4;
  const char *v5;
  uint64_t v6;
  const char *v7;
  void *v8;
  id Weak;
  const char *v10;
  uint64_t v11;
  _QWORD v12[2];

  v12[1] = *MEMORY[0x1E0C80C00];
  v4 = objc_alloc(MEMORY[0x1E0CB35C8]);
  v11 = *MEMORY[0x1E0CB2D50];
  v12[0] = CFSTR("Feature Not Supported");
  v6 = objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x1E0C99D80], v5, (uint64_t)v12, (uint64_t)&v11, 1);
  v8 = (void *)objc_msgSend_initWithDomain_code_userInfo_(v4, v7, (uint64_t)CFSTR("kCLErrorDomainPrivate"), 38, v6);
  Weak = objc_loadWeak((id *)&self->_delegate);
  objc_msgSend_findMyAccessoryRangingManager_didFailWithError_forDevice_(Weak, v10, (uint64_t)self, (uint64_t)v8, 0);

}

- (CLFindMyAccessoryRangingManagerDelegate)delegate
{
  return (CLFindMyAccessoryRangingManagerDelegate *)objc_loadWeak((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (void).cxx_destruct
{
  sub_18F61BBC8((uint64_t *)&self->_connection, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

- (id).cxx_construct
{
  *((_QWORD *)self + 3) = 0;
  return self;
}

@end
