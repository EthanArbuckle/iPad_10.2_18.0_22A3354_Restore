@implementation CLGNSSStateQueryAssertionResponse

- (CLGNSSStateQueryAssertionResponse)initWithRegistrationMessageName:(const char *)a3 messagePayload:(id)a4 callbackQueue:(id)a5 completionHandler:(id)a6
{
  id v10;
  _QWORD *v11;
  uint64_t v12;
  NSObject *v13;
  const char *v14;
  unint64_t *v15;
  unint64_t v16;
  std::__shared_weak_count *v17;
  unint64_t *p_shared_owners;
  unint64_t v19;
  std::__shared_weak_count *v20;
  unint64_t *v21;
  unint64_t v22;
  const char *v24;
  char *v25;
  objc_super v26;
  uint64_t v27;
  std::__shared_weak_count *v28;
  void *__p[2];
  char v30;
  id v31;
  char *v32;
  _BYTE v33[22];
  _BYTE buf[24];
  void *v35;
  _QWORD *v36;
  uint64_t v37;

  v37 = *MEMORY[0x1E0C80C00];
  v26.receiver = self;
  v26.super_class = (Class)CLGNSSStateQueryAssertionResponse;
  v10 = -[CLGNSSStateQueryAssertionResponse init](&v26, sel_init);
  if (v10)
  {
    v11 = (_QWORD *)operator new();
    v31 = a4;
    v32 = (char *)a3;
    *v11 = a5;
    v11[1] = _Block_copy(a6);
    v12 = operator new();
    sub_18F5D5990(__p, "com.apple.locationd.registration");
    MEMORY[0x194002B20](v12, __p, *v11);
    if (v30 < 0)
      operator delete(__p[0]);
    v11[2] = v12;
    if (qword_1ECD8E758 != -1)
      dispatch_once(&qword_1ECD8E758, &unk_1E2990D30);
    v13 = qword_1ECD8E750;
    if (os_log_type_enabled((os_log_t)qword_1ECD8E750, OS_LOG_TYPE_DEFAULT))
    {
      v14 = "NULL";
      if (a3)
        v14 = a3;
      *(_DWORD *)buf = 136315394;
      *(_QWORD *)&buf[4] = v14;
      *(_WORD *)&buf[12] = 2112;
      *(_QWORD *)&buf[14] = a4;
      _os_log_impl(&dword_18F5B3000, v13, OS_LOG_TYPE_DEFAULT, "#CLGNSSStateQueryAssertion,client,CLGnssDisablementAssertionInternal,name,%s,dict,%@", buf, 0x16u);
    }
    if (sub_18F5C4AE0(115, 2))
    {
      bzero(buf, 0x65CuLL);
      if (qword_1ECD8E758 != -1)
        dispatch_once(&qword_1ECD8E758, &unk_1E2990D30);
      v24 = "NULL";
      if (a3)
        v24 = a3;
      *(_DWORD *)v33 = 136315394;
      *(_QWORD *)&v33[4] = v24;
      *(_WORD *)&v33[12] = 2112;
      *(_QWORD *)&v33[14] = a4;
      v25 = (char *)_os_log_send_and_compose_impl();
      sub_18F5F2740("Generic", 1, 0, 2, "CLGNSSStateQueryAssertionResponseInternal::CLGNSSStateQueryAssertionResponseInternal(dispatch_queue_t, const char *, NSDictionary *, CLGNSSStateQueryAssertionResponseCallback)", "CoreLocation: %s\n", v25);
      if (v25 != buf)
        free(v25);
    }
    dispatch_retain((dispatch_object_t)*v11);
    sub_18F5D5990(buf, (char *)a3);
    CLConnectionClient::setHandlerForMessage();
    if ((buf[23] & 0x80000000) != 0)
      operator delete(*(void **)buf);
    *(_QWORD *)buf = MEMORY[0x1E0C809B0];
    *(_QWORD *)&buf[8] = 3221225472;
    *(_QWORD *)&buf[16] = sub_18F5F29C4;
    v35 = &unk_1E29913A8;
    v36 = v11;
    CLConnectionClient::setDefaultMessageHandler();
    CLConnectionClient::start((CLConnectionClient *)v11[2]);
    sub_18F5F3D54(&v32, &v31, v33);
    v27 = *(_QWORD *)v33;
    v28 = *(std::__shared_weak_count **)&v33[8];
    if (*(_QWORD *)&v33[8])
    {
      v15 = (unint64_t *)(*(_QWORD *)&v33[8] + 8);
      do
        v16 = __ldxr(v15);
      while (__stxr(v16 + 1, v15));
    }
    CLConnectionClient::sendMessage();
    v17 = v28;
    if (v28)
    {
      p_shared_owners = (unint64_t *)&v28->__shared_owners_;
      do
        v19 = __ldaxr(p_shared_owners);
      while (__stlxr(v19 - 1, p_shared_owners));
      if (!v19)
      {
        ((void (*)(std::__shared_weak_count *))v17->__on_zero_shared)(v17);
        std::__shared_weak_count::__release_weak(v17);
      }
    }
    v20 = *(std::__shared_weak_count **)&v33[8];
    if (*(_QWORD *)&v33[8])
    {
      v21 = (unint64_t *)(*(_QWORD *)&v33[8] + 8);
      do
        v22 = __ldaxr(v21);
      while (__stlxr(v22 - 1, v21));
      if (!v22)
      {
        ((void (*)(std::__shared_weak_count *))v20->__on_zero_shared)(v20);
        std::__shared_weak_count::__release_weak(v20);
      }
    }
    sub_18F5F3280((uint64_t *)v10 + 1, (uint64_t)v11);
  }
  return (CLGNSSStateQueryAssertionResponse *)v10;
}

- (void)invalidate
{
  CLGNSSStateQueryAssertionResponseInternal *value;

  value = self->fInternal.__ptr_.__value_;
  if (value)
    sub_18F5F2D44((uint64_t)value);
}

- (void)dealloc
{
  uint64_t *p_fInternal;
  objc_super v4;

  p_fInternal = (uint64_t *)&self->fInternal;
  sub_18F5F3280((uint64_t *)&self->fInternal, 0);
  sub_18F5F3280(p_fInternal, 0);
  v4.receiver = self;
  v4.super_class = (Class)CLGNSSStateQueryAssertionResponse;
  -[CLGNSSStateQueryAssertionResponse dealloc](&v4, sel_dealloc);
}

+ (id)newAssertionForBundleIdentifier:(id)a3 withReason:(id)a4 callbackQueue:(id)a5 completionHandler:(id)a6
{
  NSObject *v10;
  const char *v11;
  uint64_t v12;
  uint64_t v13;
  id v14;
  const char *v15;
  uint64_t v16;
  uint64_t v17;
  id v18;
  char *v20;
  uint8_t buf[1640];
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  if (qword_1ECD8E758 != -1)
    dispatch_once(&qword_1ECD8E758, &unk_1E2990D30);
  v10 = qword_1ECD8E750;
  if (os_log_type_enabled((os_log_t)qword_1ECD8E750, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_18F5B3000, v10, OS_LOG_TYPE_INFO, "#CLGNSSStateQueryAssertion,client,newAssertionForBundleIdentifier", buf, 2u);
  }
  if (sub_18F5C4AE0(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_1ECD8E758 != -1)
      dispatch_once(&qword_1ECD8E758, &unk_1E2990D30);
    v20 = (char *)_os_log_send_and_compose_impl();
    sub_18F5F2740("Generic", 1, 0, 2, "+[CLGNSSStateQueryAssertionResponse newAssertionForBundleIdentifier:withReason:callbackQueue:completionHandler:]", "CoreLocation: %s\n", v20);
    if (v20 != (char *)buf)
      free(v20);
  }
  v14 = (id)objc_msgSend_copy(a3, v11, v12, v13);
  v18 = (id)objc_msgSend_copy(a4, v15, v16, v17);
  return (id)sub_18F5F3470((uint64_t)v14, &stru_1E2993188, (uint64_t)v18, (uint64_t)a5, (uint64_t)a6);
}

+ (id)newAssertionForBundle:(id)a3 withReason:(id)a4 callbackQueue:(id)a5 completionHandler:(id)a6
{
  NSObject *v10;
  const char *v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  const char *v15;
  uint64_t v16;
  uint64_t v17;
  const char *v18;
  const char *v19;
  uint64_t v20;
  uint64_t v21;
  id v22;
  char *v24;
  uint8_t buf[1640];
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  if (qword_1ECD8E758 != -1)
    dispatch_once(&qword_1ECD8E758, &unk_1E2990D30);
  v10 = qword_1ECD8E750;
  if (os_log_type_enabled((os_log_t)qword_1ECD8E750, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_18F5B3000, v10, OS_LOG_TYPE_INFO, "#CLGNSSStateQueryAssertion,client,newAssertionForBundle", buf, 2u);
  }
  if (sub_18F5C4AE0(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_1ECD8E758 != -1)
      dispatch_once(&qword_1ECD8E758, &unk_1E2990D30);
    v24 = (char *)_os_log_send_and_compose_impl();
    sub_18F5F2740("Generic", 1, 0, 2, "+[CLGNSSStateQueryAssertionResponse newAssertionForBundle:withReason:callbackQueue:completionHandler:]", "CoreLocation: %s\n", v24);
    if (v24 != (char *)buf)
      free(v24);
  }
  v14 = (void *)objc_msgSend_bundlePath(a3, v11, v12, v13);
  v18 = (const char *)(id)objc_msgSend_copy(v14, v15, v16, v17);
  v22 = (id)objc_msgSend_copy(a4, v19, v20, v21);
  return (id)sub_18F5F3470((uint64_t)&stru_1E2993188, v18, (uint64_t)v22, (uint64_t)a5, (uint64_t)a6);
}

- (void).cxx_destruct
{
  sub_18F5F3280((uint64_t *)&self->fInternal, 0);
}

- (id).cxx_construct
{
  *((_QWORD *)self + 1) = 0;
  return self;
}

@end
