@implementation CiderDelegate

- (id)init:(shared_ptr<RouteSessionAttributes>)a3
{
  RouteSessionAttributes *ptr;
  CiderDelegate *v4;
  CiderObject *v5;
  std::__shared_weak_count *v6;
  unint64_t *p_shared_owners;
  unint64_t v8;
  uint64_t v9;
  CiderObject *mObject;
  std::__shared_weak_count *v11;
  unint64_t *v12;
  unint64_t v13;
  uint64_t v15;
  std::__shared_weak_count *v16;
  objc_super v17;

  ptr = a3.__ptr_;
  v17.receiver = self;
  v17.super_class = (Class)CiderDelegate;
  v4 = -[CiderDelegate init](&v17, sel_init, a3.__ptr_, a3.__cntrl_);
  if (v4)
  {
    v5 = [CiderObject alloc];
    v6 = (std::__shared_weak_count *)*((_QWORD *)ptr + 1);
    v15 = *(_QWORD *)ptr;
    v16 = v6;
    if (v6)
    {
      p_shared_owners = (unint64_t *)&v6->__shared_owners_;
      do
        v8 = __ldxr(p_shared_owners);
      while (__stxr(v8 + 1, p_shared_owners));
    }
    v9 = -[CiderObject init:](v5, "init:", &v15);
    mObject = v4->mObject;
    v4->mObject = (CiderObject *)v9;

    v11 = v16;
    if (v16)
    {
      v12 = (unint64_t *)&v16->__shared_owners_;
      do
        v13 = __ldaxr(v12);
      while (__stlxr(v13 - 1, v12));
      if (!v13)
      {
        ((void (*)(std::__shared_weak_count *))v11->__on_zero_shared)(v11);
        std::__shared_weak_count::__release_weak(v11);
      }
    }
  }
  return v4;
}

- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4
{
  util *v5;
  NSObject *v6;
  void *v7;
  uint64_t v8;
  _QWORD v10[5];
  _QWORD v11[5];
  uint8_t buf[4];
  const char *v13;
  __int16 v14;
  int v15;
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  v5 = (util *)a4;
  util::server_log(v5);
  v6 = objc_retainAutorelease((id)util::server_log(void)::sLogCat);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    v13 = "InCider.mm";
    v14 = 1024;
    v15 = 99;
    _os_log_impl(&dword_237B88000, v6, OS_LOG_TYPE_DEFAULT, "%25s:%-5d New XPC connection created", buf, 0x12u);
  }
  -[util setExportedObject:](v5, "setExportedObject:", self->mObject);
  objc_msgSend(MEMORY[0x24BDD1990], "interfaceWithProtocol:", &unk_256873E40);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[util setExportedInterface:](v5, "setExportedInterface:", v7);

  v8 = MEMORY[0x24BDAC760];
  v11[0] = MEMORY[0x24BDAC760];
  v11[1] = 3221225472;
  v11[2] = __52__CiderDelegate_listener_shouldAcceptNewConnection___block_invoke;
  v11[3] = &unk_2509A2420;
  v11[4] = self;
  -[util setInterruptionHandler:](v5, "setInterruptionHandler:", v11);
  v10[0] = v8;
  v10[1] = 3221225472;
  v10[2] = __52__CiderDelegate_listener_shouldAcceptNewConnection___block_invoke_63;
  v10[3] = &unk_2509A2420;
  v10[4] = self;
  -[util setInvalidationHandler:](v5, "setInvalidationHandler:", v10);
  -[util resume](v5, "resume");

  return 1;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->mObject, 0);
}

void __52__CiderDelegate_listener_shouldAcceptNewConnection___block_invoke(uint64_t a1)
{
  NSObject *v1;
  int v2;
  const char *v3;
  __int16 v4;
  int v5;
  uint64_t v6;

  v6 = *MEMORY[0x24BDAC8D0];
  util::server_log((util *)objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "clearReporterOpts"));
  v1 = objc_retainAutorelease((id)util::server_log(void)::sLogCat);
  if (os_log_type_enabled(v1, OS_LOG_TYPE_DEFAULT))
  {
    v2 = 136315394;
    v3 = "InCider.mm";
    v4 = 1024;
    v5 = 105;
    _os_log_impl(&dword_237B88000, v1, OS_LOG_TYPE_DEFAULT, "%25s:%-5d Existing XPC connection interrupted, cleared reporter optionals", (uint8_t *)&v2, 0x12u);
  }
}

void __52__CiderDelegate_listener_shouldAcceptNewConnection___block_invoke_63(uint64_t a1)
{
  NSObject *v1;
  int v2;
  const char *v3;
  __int16 v4;
  int v5;
  uint64_t v6;

  v6 = *MEMORY[0x24BDAC8D0];
  util::server_log((util *)objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "clearReporterOpts"));
  v1 = objc_retainAutorelease((id)util::server_log(void)::sLogCat);
  if (os_log_type_enabled(v1, OS_LOG_TYPE_DEFAULT))
  {
    v2 = 136315394;
    v3 = "InCider.mm";
    v4 = 1024;
    v5 = 109;
    _os_log_impl(&dword_237B88000, v1, OS_LOG_TYPE_DEFAULT, "%25s:%-5d Existing XPC connection invalidated, cleared reporter optionals", (uint8_t *)&v2, 0x12u);
  }
}

@end
