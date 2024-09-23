@implementation CMContextConfigurationManager

- (CMContextConfigurationManager)init
{
  CMContextConfigurationManager *v2;
  uint64_t v3;
  const char *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *__p[2];
  char v10;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)CMContextConfigurationManager;
  v2 = -[CMContextConfigurationManager init](&v11, sel_init);
  if (v2)
  {
    v2->fInternalQueue = (OS_dispatch_queue *)dispatch_queue_create("com.apple.CoreMotion.CMContextConfigurationManager", 0);
    v3 = operator new();
    sub_18F270374(__p, "com.apple.locationd.registration");
    MEMORY[0x19400100C](v3, __p, v2->fInternalQueue);
    v2->fLocationdConnection = (void *)v3;
    if (v10 < 0)
      operator delete(__p[0]);
    objc_msgSend_connect(v2, v4, v5, v6, v7);
  }
  return v2;
}

- (void)dealloc
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  objc_super v6;

  objc_msgSend_disconnect(self, a2, v2, v3, v4);
  v6.receiver = self;
  v6.super_class = (Class)CMContextConfigurationManager;
  -[CMContextConfigurationManager dealloc](&v6, sel_dealloc);
}

- (void)connect
{
  id v3;
  id location;

  CLConnectionClient::setDefaultMessageHandler();
  objc_initWeak(&location, self);
  objc_copyWeak(&v3, &location);
  CLConnectionClient::setInterruptionHandler();
  CLConnectionClient::start((CLConnectionClient *)self->fLocationdConnection);
  objc_destroyWeak(&v3);
  objc_destroyWeak(&location);
}

- (void)disconnect
{
  void *fLocationdConnection;
  uint64_t v4;

  fLocationdConnection = self->fLocationdConnection;
  if (fLocationdConnection)
  {
    v4 = MEMORY[0x194001018](fLocationdConnection, a2);
    MEMORY[0x194001438](v4, 0xB0C40BC2CC919);
    self->fLocationdConnection = 0;
    dispatch_release((dispatch_object_t)self->fInternalQueue);
    self->fInternalQueue = 0;
  }
}

- (void)writeContextConfiguration:(id)a3 withHandler:(id)a4
{
  uint64_t v4;
  unint64_t *p_shared_owners;
  unint64_t v9;
  unint64_t *v10;
  unint64_t v11;
  std::__shared_weak_count *v12;
  unint64_t *v13;
  unint64_t v14;
  NSObject *v15;
  const char *v16;
  uint64_t v17;
  void *v19;
  const char *v20;
  char *v21;
  std::__shared_weak_count *v22;
  uint64_t v23;
  const __CFString *v24;
  id v25;
  uint8_t buf[8];
  std::__shared_weak_count *v27;
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  if (!a4)
  {
    v19 = (void *)objc_msgSend_currentHandler(MEMORY[0x1E0CB3488], a2, (uint64_t)a3, 0, v4);
    objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_(v19, v20, (uint64_t)a2, (uint64_t)self, (uint64_t)CFSTR("CMContextConfigurationManager.mm"), 83, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("handler"));
  }
  if (self->fLocationdConnection)
  {
    v24 = CFSTR("CMContextConfigurationKey");
    v25 = a3;
    v23 = objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x1E0C99D80], a2, (uint64_t)&v25, (uint64_t)&v24, 1);
    sub_18F3ED90C("kCLConnectionMessageWriteContextConfiguration", &v23, buf);
    v22 = v27;
    if (v27)
    {
      p_shared_owners = (unint64_t *)&v27->__shared_owners_;
      do
        v9 = __ldxr(p_shared_owners);
      while (__stxr(v9 + 1, p_shared_owners));
    }
    CLConnectionClient::sendMessage();
    if (v22)
    {
      v10 = (unint64_t *)&v22->__shared_owners_;
      do
        v11 = __ldaxr(v10);
      while (__stlxr(v11 - 1, v10));
      if (!v11)
      {
        ((void (*)(std::__shared_weak_count *))v22->__on_zero_shared)(v22);
        std::__shared_weak_count::__release_weak(v22);
      }
    }
    v12 = v27;
    if (v27)
    {
      v13 = (unint64_t *)&v27->__shared_owners_;
      do
        v14 = __ldaxr(v13);
      while (__stlxr(v14 - 1, v13));
      if (!v14)
      {
        ((void (*)(std::__shared_weak_count *))v12->__on_zero_shared)(v12);
        std::__shared_weak_count::__release_weak(v12);
      }
    }
  }
  else
  {
    if (qword_1EE16D8E8 != -1)
      dispatch_once(&qword_1EE16D8E8, &unk_1E2954EA8);
    v15 = qword_1EE16D8F0;
    if (os_log_type_enabled((os_log_t)qword_1EE16D8F0, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_18F1DC000, v15, OS_LOG_TYPE_ERROR, "Error in writeContextConfiguration. Invalid locationd connection", buf, 2u);
    }
    if (sub_18F1FCA08(115, 0))
    {
      bzero(buf, 0x65CuLL);
      if (qword_1EE16D8E8 != -1)
        dispatch_once(&qword_1EE16D8E8, &unk_1E2954EA8);
      LOWORD(v23) = 0;
      v21 = (char *)_os_log_send_and_compose_impl();
      sub_18F419700("Generic", 1, 0, 0, "-[CMContextConfigurationManager writeContextConfiguration:withHandler:]", "CoreLocation: %s\n", v21);
      if (v21 != (char *)buf)
        free(v21);
    }
    v17 = objc_msgSend_errorWithDomain_code_userInfo_(MEMORY[0x1E0CB35C8], v16, (uint64_t)CFSTR("CMErrorDomain"), 103, 0);
    (*((void (**)(id, uint64_t))a4 + 2))(a4, v17);
  }
}

@end
