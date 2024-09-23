@implementation CMIndoorOutdoorManager

+ (BOOL)isIndoorOutdoorStateAvailable
{
  sub_18F1F77DC();
  sub_18F1F77DC();
  return sub_18F20C9AC();
}

- (CMIndoorOutdoorManager)init
{
  CMIndoorOutdoorManager *v2;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)CMIndoorOutdoorManager;
  v2 = -[CMIndoorOutdoorManager init](&v4, sel_init);
  if (v2)
    v2->_internal = (CMIndoorOutdoorManagerInternal *)objc_opt_new();
  return v2;
}

- (void)dealloc
{
  NSObject *internalQueue;
  objc_super v4;
  _QWORD block[5];

  internalQueue = self->_internal->_internalQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = sub_18F3C5724;
  block[3] = &unk_1E2955938;
  block[4] = self;
  dispatch_sync(internalQueue, block);

  v4.receiver = self;
  v4.super_class = (Class)CMIndoorOutdoorManager;
  -[CMIndoorOutdoorManager dealloc](&v4, sel_dealloc);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
  self->_internal->_delegate = (CMIndoorOutdoorDelegate *)a3;
  self->_internal->_sender = self;
}

- (void)startIndoorOutdoorUpdates
{
  NSObject *v3;
  void *v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  const char *v13;
  uint64_t v14;
  id Weak;
  const char *v16;
  uint64_t v17;
  char *v18;
  uint8_t buf[1640];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  if (qword_1EE16D8F8 != -1)
    dispatch_once(&qword_1EE16D8F8, &unk_1E2955248);
  v3 = qword_1EE16D900;
  if (os_log_type_enabled((os_log_t)qword_1EE16D900, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_18F1DC000, v3, OS_LOG_TYPE_DEFAULT, "IndoorOutdoor, starting indoor/outdoor updates", buf, 2u);
  }
  if (sub_18F1FCA08(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_1EE16D8F8 != -1)
      dispatch_once(&qword_1EE16D8F8, &unk_1E2955248);
    v18 = (char *)_os_log_send_and_compose_impl();
    sub_18F419700("Generic", 1, 0, 2, "-[CMIndoorOutdoorManager startIndoorOutdoorUpdates]", "CoreLocation: %s\n", v18);
    if (v18 != (char *)buf)
      free(v18);
  }
  v4 = (void *)objc_opt_class();
  if ((objc_msgSend_isIndoorOutdoorStateAvailable(v4, v5, v6, v7, v8) & 1) != 0)
  {
    objc_msgSend__startIndoorOutdoorUpdates(self->_internal, v9, v10, v11, v12);
  }
  else
  {
    objc_loadWeak((id *)&self->_delegate);
    if ((objc_opt_respondsToSelector() & 1) != 0)
    {
      v14 = objc_msgSend_errorWithDomain_code_userInfo_(MEMORY[0x1E0CB35C8], v13, (uint64_t)CFSTR("CMErrorDomain"), 109, 0);
      Weak = objc_loadWeak((id *)&self->_delegate);
      objc_msgSend_indoorOutdoorManager_failedToStartUpdatesWithError_(Weak, v16, (uint64_t)self, v14, v17);
    }
  }
}

- (void)stopIndoorOutdoorUpdates
{
  NSObject *v3;
  const char *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint8_t buf[1640];
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  if (qword_1EE16D8F8 != -1)
    dispatch_once(&qword_1EE16D8F8, &unk_1E2955248);
  v3 = qword_1EE16D900;
  if (os_log_type_enabled((os_log_t)qword_1EE16D900, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_18F1DC000, v3, OS_LOG_TYPE_DEFAULT, "IndoorOutdoor, stopping indoor/outdoor updates", buf, 2u);
  }
  if (sub_18F1FCA08(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_1EE16D8F8 != -1)
      dispatch_once(&qword_1EE16D8F8, &unk_1E2955248);
    v8 = (char *)_os_log_send_and_compose_impl();
    sub_18F419700("Generic", 1, 0, 2, "-[CMIndoorOutdoorManager stopIndoorOutdoorUpdates]", "CoreLocation: %s\n", v8);
    if (v8 != (char *)buf)
      free(v8);
  }
  objc_msgSend__stopIndoorOutdoorUpdates(self->_internal, v4, v5, v6, v7);
}

- (void)lastKnownIndoorOutdoorStateWithHandler:(id)a3
{
  NSObject *v5;
  void *v6;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  const char *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  char *v15;
  uint8_t buf[1640];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  if (qword_1EE16D8F8 != -1)
    dispatch_once(&qword_1EE16D8F8, &unk_1E2955248);
  v5 = qword_1EE16D900;
  if (os_log_type_enabled((os_log_t)qword_1EE16D900, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_18F1DC000, v5, OS_LOG_TYPE_DEFAULT, "IndoorOutdoor, getting last known state", buf, 2u);
  }
  if (sub_18F1FCA08(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_1EE16D8F8 != -1)
      dispatch_once(&qword_1EE16D8F8, &unk_1E2955248);
    v15 = (char *)_os_log_send_and_compose_impl();
    sub_18F419700("Generic", 1, 0, 2, "-[CMIndoorOutdoorManager lastKnownIndoorOutdoorStateWithHandler:]", "CoreLocation: %s\n", v15);
    if (v15 != (char *)buf)
      free(v15);
  }
  v6 = (void *)objc_opt_class();
  if ((objc_msgSend_isIndoorOutdoorStateAvailable(v6, v7, v8, v9, v10) & 1) != 0)
  {
    objc_msgSend__lastKnownIndoorOutdoorStateWithHandler_(self->_internal, v11, (uint64_t)a3, v12, v13);
  }
  else
  {
    v14 = objc_msgSend_errorWithDomain_code_userInfo_(MEMORY[0x1E0CB35C8], v11, (uint64_t)CFSTR("CMErrorDomain"), 109, 0);
    (*((void (**)(id, _QWORD, uint64_t))a3 + 2))(a3, 0, v14);
  }
}

- (CMIndoorOutdoorDelegate)delegate
{
  return (CMIndoorOutdoorDelegate *)objc_loadWeak((id *)&self->_delegate);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
}

@end
