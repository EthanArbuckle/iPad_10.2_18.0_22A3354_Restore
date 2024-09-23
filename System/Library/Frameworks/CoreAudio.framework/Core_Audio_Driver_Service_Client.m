@implementation Core_Audio_Driver_Service_Client

- (Core_Audio_Driver_Service_Client)init
{
  id v2;
  uint64_t v3;
  void *v4;
  uint64_t v5;
  void *v6;
  objc_super v8;
  id obj[41];

  obj[40] = *(id *)MEMORY[0x1E0C80C00];
  v8.receiver = self;
  v8.super_class = (Class)Core_Audio_Driver_Service_Client;
  v2 = -[Core_Audio_Driver_Service_Client init](&v8, sel_init);
  if (v2)
  {
    objc_msgSend(MEMORY[0x1E0CB3B58], "anonymousListener");
    v3 = objc_claimAutoreleasedReturnValue();
    v4 = (void *)*((_QWORD *)v2 + 3);
    *((_QWORD *)v2 + 3) = v3;

    objc_msgSend(*((id *)v2 + 3), "setDelegate:", v2);
    objc_msgSend(*((id *)v2 + 3), "endpoint");
    v5 = objc_claimAutoreleasedReturnValue();
    v6 = (void *)*((_QWORD *)v2 + 4);
    *((_QWORD *)v2 + 4) = v5;

    objc_msgSend(*((id *)v2 + 3), "resume");
    AMCP::Utility::Dispatch_Queue::Dispatch_Queue((uint64_t)obj, "driver host connection queue");
    objc_storeStrong((id *)v2 + 10, obj[0]);
    AMCP::Utility::Dispatch_Queue::~Dispatch_Queue((AMCP::Utility::Dispatch_Queue *)obj);
  }
  return (Core_Audio_Driver_Service_Client *)v2;
}

- (id)init_with_driver_service_undertaker:(shared_ptr<std::function<void)(std::shared_ptr<Driver_File>
{
  uint64_t *ptr;
  Core_Audio_Driver_Service_Client *v4;
  Core_Audio_Driver_Service_Client *v5;
  std::__shared_weak_count *v6;
  unint64_t *p_shared_owners;
  unint64_t v8;
  std::__shared_weak_count *v9;
  unint64_t *v10;
  unint64_t v11;
  uint64_t v13;
  std::__shared_weak_count *v14;

  ptr = (uint64_t *)a3.__ptr_;
  v4 = -[Core_Audio_Driver_Service_Client init](self, "init", a3.__ptr_, a3.__cntrl_);
  v5 = v4;
  if (v4)
  {
    v6 = (std::__shared_weak_count *)ptr[1];
    v13 = *ptr;
    v14 = v6;
    if (v6)
    {
      p_shared_owners = (unint64_t *)&v6->__shared_owners_;
      do
        v8 = __ldxr(p_shared_owners);
      while (__stxr(v8 + 1, p_shared_owners));
    }
    -[Core_Audio_Driver_Service_Client setDriver_service_undertaker:](v4, "setDriver_service_undertaker:", &v13);
    v9 = v14;
    if (v14)
    {
      v10 = (unint64_t *)&v14->__shared_owners_;
      do
        v11 = __ldaxr(v10);
      while (__stlxr(v11 - 1, v10));
      if (!v11)
      {
        ((void (*)(std::__shared_weak_count *))v9->__on_zero_shared)(v9);
        std::__shared_weak_count::__release_weak(v9);
      }
    }
  }
  return v5;
}

- (void)dealloc
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  objc_super v8;

  v3 = (void *)*((_QWORD *)self + 1);
  if (v3)
  {
    objc_msgSend(v3, "invalidate");
    v4 = (void *)*((_QWORD *)self + 1);
    *((_QWORD *)self + 1) = 0;

  }
  v5 = (void *)*((_QWORD *)self + 3);
  if (v5)
  {
    objc_msgSend(v5, "invalidate");
    objc_msgSend(*((id *)self + 3), "setDelegate:", 0);
    v6 = (void *)*((_QWORD *)self + 3);
    *((_QWORD *)self + 3) = 0;

  }
  v7 = (void *)*((_QWORD *)self + 4);
  if (v7)
  {
    *((_QWORD *)self + 4) = 0;

  }
  v8.receiver = self;
  v8.super_class = (Class)Core_Audio_Driver_Service_Client;
  -[Core_Audio_Driver_Service_Client dealloc](&v8, sel_dealloc);
}

- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4
{
  id v5;
  void *v6;

  v5 = a4;
  objc_msgSend(MEMORY[0x1E0CB3B50], "interfaceWithProtocol:", &unk_1EF133390);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setExportedInterface:", v6);

  objc_msgSend(v5, "setExportedObject:", self);
  objc_msgSend(v5, "setInterruptionHandler:", &__block_literal_global_2797);
  objc_msgSend(v5, "setInvalidationHandler:", &__block_literal_global_7);
  objc_msgSend(v5, "resume");
  -[Core_Audio_Driver_Service_Client setConnection_from_driver_service:](self, "setConnection_from_driver_service:", v5);

  return 1;
}

- (void)send_endpoint_to_driver_service
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  _QWORD v7[5];
  _QWORD v8[5];
  char v9;

  v9 = 1;
  -[Core_Audio_Driver_Service_Client connection_to_driver_service](self, "connection_to_driver_service");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = MEMORY[0x1E0C809B0];
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3321888768;
  v8[2] = __67__Core_Audio_Driver_Service_Client_send_endpoint_to_driver_service__block_invoke;
  v8[3] = &__block_descriptor_40_ea8_32c80_ZTSKZ67__Core_Audio_Driver_Service_Client_send_endpoint_to_driver_service_E3__0_e17_v16__0__NSError_8l;
  v8[4] = &v9;
  objc_msgSend(v3, "synchronousRemoteObjectProxyWithErrorHandler:", v8);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  -[Core_Audio_Driver_Service_Client endpoint](self, "endpoint");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = v4;
  v7[1] = 3321888768;
  v7[2] = __67__Core_Audio_Driver_Service_Client_send_endpoint_to_driver_service__block_invoke_10;
  v7[3] = &__block_descriptor_40_ea8_32c80_ZTSKZ67__Core_Audio_Driver_Service_Client_send_endpoint_to_driver_service_E3__1_e8_v12__0B8l;
  v7[4] = &v9;
  objc_msgSend(v5, "set_driver_service_client_endpoint:reply:", v6, v7);

}

- (void)connect_to_driver_service:(shared_ptr<Driver_File>)a3
{
  Driver_File *ptr;
  std::__shared_weak_count *v5;
  unint64_t *p_shared_owners;
  unint64_t v7;
  std::__shared_weak_count *v8;
  unint64_t *v9;
  unint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  Core_Audio_Driver_Service_Client *v16;
  uint64_t v17;
  Core_Audio_Driver_Service_Client *v18;
  void *v19;
  void *v20;
  void *v21;
  Core_Audio_Driver_Service_Client *v22;
  void *v23;
  void *v24;
  void *v25;
  uint64_t v26;
  std::__shared_weak_count *v27;
  uint64_t aBlock;
  uint64_t v29;
  void *v30;
  void *v31;
  Core_Audio_Driver_Service_Client *v32;

  ptr = a3.__ptr_;
  v5 = (std::__shared_weak_count *)*((_QWORD *)a3.__ptr_ + 1);
  v26 = *(_QWORD *)a3.__ptr_;
  v27 = v5;
  if (v5)
  {
    p_shared_owners = (unint64_t *)&v5->__shared_owners_;
    do
      v7 = __ldxr(p_shared_owners);
    while (__stxr(v7 + 1, p_shared_owners));
  }
  -[Core_Audio_Driver_Service_Client setDriver_file:](self, "setDriver_file:", &v26, a3.__cntrl_);
  v8 = v27;
  if (v27)
  {
    v9 = (unint64_t *)&v27->__shared_owners_;
    do
      v10 = __ldaxr(v9);
    while (__stlxr(v10 - 1, v9));
    if (!v10)
    {
      ((void (*)(std::__shared_weak_count *))v8->__on_zero_shared)(v8);
      std::__shared_weak_count::__release_weak(v8);
    }
  }
  v11 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3B38]), "initWithServiceName:", *(_QWORD *)(*(_QWORD *)ptr + 32));
  -[Core_Audio_Driver_Service_Client setConnection_to_driver_service:](self, "setConnection_to_driver_service:", v11);

  -[Core_Audio_Driver_Service_Client connection_to_driver_service](self, "connection_to_driver_service");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "uniquify");

  objc_msgSend(MEMORY[0x1E0CB3B50], "interfaceWithProtocol:", &unk_1EF135EE0);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[Core_Audio_Driver_Service_Client connection_to_driver_service](self, "connection_to_driver_service");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setRemoteObjectInterface:", v13);

  -[Core_Audio_Driver_Service_Client connection_to_driver_service](self, "connection_to_driver_service");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "setExportedObject:", self);

  v16 = self;
  v17 = MEMORY[0x1E0C809B0];
  aBlock = MEMORY[0x1E0C809B0];
  v29 = 3321888768;
  v30 = ___ZZ62__Core_Audio_Driver_Service_Client_connect_to_driver_service__ENK3__2cvU13block_pointerFvvEEv_block_invoke;
  v31 = &__block_descriptor_40_ea8_32c75_ZTSKZ62__Core_Audio_Driver_Service_Client_connect_to_driver_service__E3__2_e5_v8__0l;
  v18 = v16;
  v32 = v18;
  v19 = _Block_copy(&aBlock);

  -[Core_Audio_Driver_Service_Client connection_to_driver_service](v18, "connection_to_driver_service");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "setInvalidationHandler:", v19);

  -[Core_Audio_Driver_Service_Client connection_to_driver_service](v18, "connection_to_driver_service");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  aBlock = v17;
  v29 = 3321888768;
  v30 = ___ZZ62__Core_Audio_Driver_Service_Client_connect_to_driver_service__ENK3__3cvU13block_pointerFvvEEv_block_invoke;
  v31 = &__block_descriptor_40_ea8_32c75_ZTSKZ62__Core_Audio_Driver_Service_Client_connect_to_driver_service__E3__3_e5_v8__0l;
  v22 = v21;
  v32 = v22;
  v23 = _Block_copy(&aBlock);

  -[Core_Audio_Driver_Service_Client connection_to_driver_service](v18, "connection_to_driver_service");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "setInterruptionHandler:", v23);

  -[Core_Audio_Driver_Service_Client connection_to_driver_service](v18, "connection_to_driver_service");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "resume");

  -[Core_Audio_Driver_Service_Client send_endpoint_to_driver_service](v18, "send_endpoint_to_driver_service");
}

- (id)get_lazy_connection:(shared_ptr<Driver_File>)a3
{
  Driver_File *ptr;
  Core_Audio_Driver_Service_Client *v5;
  std::__shared_weak_count *v6;
  void *v7;
  unint64_t *p_shared_owners;
  unint64_t v9;
  std::__shared_weak_count *v10;
  unint64_t *v11;
  unint64_t v12;
  id v14[2];
  std::__shared_weak_count *v15;
  _QWORD block[5];
  dispatch_queue_t queue[41];

  ptr = a3.__ptr_;
  queue[40] = *(dispatch_queue_t *)MEMORY[0x1E0C80C00];
  -[Core_Audio_Driver_Service_Client queue](self, "queue", a3.__ptr_, a3.__cntrl_);
  v5 = self;
  v7 = *(void **)ptr;
  v6 = (std::__shared_weak_count *)*((_QWORD *)ptr + 1);
  v14[0] = v5;
  v14[1] = v7;
  v15 = v6;
  if (v6)
  {
    p_shared_owners = (unint64_t *)&v6->__shared_owners_;
    do
      v9 = __ldxr(p_shared_owners);
    while (__stxr(v9 + 1, p_shared_owners));
  }
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = ___ZN10applesauce8dispatch2v19sync_implIZ56__Core_Audio_Driver_Service_Client_get_lazy_connection__E3__4EEvPU28objcproto17OS_dispatch_queue8NSObjectOT_NSt3__117integral_constantIbLb1EEE_block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = v14;
  dispatch_sync(queue[0], block);
  v10 = v15;
  if (v15)
  {
    v11 = (unint64_t *)&v15->__shared_owners_;
    do
      v12 = __ldaxr(v11);
    while (__stlxr(v12 - 1, v11));
    if (!v12)
    {
      ((void (*)(std::__shared_weak_count *))v10->__on_zero_shared)(v10);
      std::__shared_weak_count::__release_weak(v10);
    }
  }

  AMCP::Utility::Dispatch_Queue::~Dispatch_Queue((AMCP::Utility::Dispatch_Queue *)queue);
  -[Core_Audio_Driver_Service_Client connection_to_driver_service](v5, "connection_to_driver_service");
  return (id)objc_claimAutoreleasedReturnValue();
}

- (int)load_driver:(shared_ptr<Driver_File>)a3 driver_endpoint:(id *)a4
{
  Driver_File *ptr;
  std::__shared_weak_count *v5;
  unint64_t *p_shared_owners;
  unint64_t v7;
  void *v8;
  std::__shared_weak_count *v9;
  unint64_t *v10;
  unint64_t v11;
  uint64_t v12;
  id v13;
  id v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  int v18;
  _QWORD v20[6];
  _QWORD v21[5];
  id v22;
  int v23;
  uint64_t v24;
  std::__shared_weak_count *v25;
  __shared_weak_count *cntrl;

  ptr = a3.__ptr_;
  v5 = (std::__shared_weak_count *)*((_QWORD *)a3.__ptr_ + 1);
  v24 = *(_QWORD *)a3.__ptr_;
  v25 = v5;
  cntrl = a3.__cntrl_;
  if (v5)
  {
    p_shared_owners = (unint64_t *)&v5->__shared_owners_;
    do
      v7 = __ldxr(p_shared_owners);
    while (__stxr(v7 + 1, p_shared_owners));
  }
  -[Core_Audio_Driver_Service_Client get_lazy_connection:](self, "get_lazy_connection:", &v24, a3.__cntrl_, a4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v25;
  if (v25)
  {
    v10 = (unint64_t *)&v25->__shared_owners_;
    do
      v11 = __ldaxr(v10);
    while (__stlxr(v11 - 1, v10));
    if (!v11)
    {
      ((void (*)(std::__shared_weak_count *))v9->__on_zero_shared)(v9);
      std::__shared_weak_count::__release_weak(v9);
    }
  }
  v23 = 2;
  v12 = MEMORY[0x1E0C809B0];
  v21[0] = MEMORY[0x1E0C809B0];
  v21[1] = 3321888768;
  v21[2] = __64__Core_Audio_Driver_Service_Client_load_driver_driver_endpoint___block_invoke;
  v21[3] = &__block_descriptor_48_ea8_32c77_ZTSKZ64__Core_Audio_Driver_Service_Client_load_driver_driver_endpoint__E3__5_e17_v16__0__NSError_8l;
  v13 = *(id *)(*(_QWORD *)ptr + 8);
  v21[4] = &v23;
  v14 = v13;
  v22 = v14;
  objc_msgSend(v8, "synchronousRemoteObjectProxyWithErrorHandler:", v21);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  v16 = **(_DWORD **)ptr;
  v17 = *(_QWORD *)(*(_QWORD *)ptr + 8);
  v20[0] = v12;
  v20[1] = 3321888768;
  v20[2] = __64__Core_Audio_Driver_Service_Client_load_driver_driver_endpoint___block_invoke_25;
  v20[3] = &__block_descriptor_48_ea8_32c77_ZTSKZ64__Core_Audio_Driver_Service_Client_load_driver_driver_endpoint__E3__6_e34_v20__0i8__NSXPCListenerEndpoint_12l;
  v20[4] = &v23;
  v20[5] = &cntrl;
  objc_msgSend(v15, "load_driver:driver_name:reply:", v16, v17, v20);
  v18 = v23;

  return v18;
}

- (void)tell_driver_service_to_exit
{
  void *v3;
  std::__shared_weak_count *v4;
  unint64_t *p_shared_owners;
  unint64_t v6;
  void *v7;
  _QWORD v8[5];
  _BYTE v9[8];
  std::__shared_weak_count *v10;

  -[Core_Audio_Driver_Service_Client driver_file](self, "driver_file");
  -[Core_Audio_Driver_Service_Client get_lazy_connection:](self, "get_lazy_connection:", v9);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v10;
  if (v10)
  {
    p_shared_owners = (unint64_t *)&v10->__shared_owners_;
    do
      v6 = __ldaxr(p_shared_owners);
    while (__stlxr(v6 - 1, p_shared_owners));
    if (!v6)
    {
      ((void (*)(std::__shared_weak_count *))v4->__on_zero_shared)(v4);
      std::__shared_weak_count::__release_weak(v4);
    }
  }
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3321888768;
  v8[2] = __63__Core_Audio_Driver_Service_Client_tell_driver_service_to_exit__block_invoke;
  v8[3] = &__block_descriptor_33_ea8_32c76_ZTSKZ63__Core_Audio_Driver_Service_Client_tell_driver_service_to_exit_E3__9_e17_v16__0__NSError_8l;
  objc_msgSend(v3, "synchronousRemoteObjectProxyWithErrorHandler:", v8);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "exit_service");

}

- (void)invalidate
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;

  -[Core_Audio_Driver_Service_Client connection_to_driver_service](self, "connection_to_driver_service");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  if (v7)
    objc_msgSend(v7, "invalidate");
  -[Core_Audio_Driver_Service_Client connection_from_driver_service](self, "connection_from_driver_service");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
    objc_msgSend(v3, "invalidate");
  -[Core_Audio_Driver_Service_Client listener](self, "listener");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v5)
    objc_msgSend(v5, "invalidate");

}

- (void)deferred_driver_loaded:(id)a3 reply:(id)a4
{
  id v6;
  void (**v7)(id, _QWORD);
  void *v8;
  id v9;
  id v10;
  NSObject *v11;
  _QWORD *v12;
  id *v13;
  id v14[41];

  v14[40] = *(id *)MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = (void (**)(id, _QWORD))a4;
  -[Core_Audio_Driver_Service_Client delegate](self, "delegate");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8)
  {
    -[Core_Audio_Driver_Service_Client queue](self, "queue");
    v9 = v8;
    v10 = v6;
    v11 = v14[0];
    v12 = (_QWORD *)operator new();
    *v12 = v9;
    v12[1] = v10;
    v13 = 0;
    dispatch_async_f(v11, v12, (dispatch_function_t)applesauce::dispatch::v1::async<-[Core_Audio_Driver_Service_Client deferred_driver_loaded:reply:]::$_10>(NSObject  {objcproto17OS_dispatch_queue}*,-[Core_Audio_Driver_Service_Client deferred_driver_loaded:reply:]::$_10 &&)::{lambda(void *)#1}::__invoke);
    std::unique_ptr<-[Core_Audio_Driver_Service_Client deferred_driver_loaded:reply:]::$_10>::~unique_ptr[abi:ne180100](&v13);

    AMCP::Utility::Dispatch_Queue::~Dispatch_Queue((AMCP::Utility::Dispatch_Queue *)v14);
  }
  v7[2](v7, 0);

}

- (NSXPCConnection)connection_to_driver_service
{
  return (NSXPCConnection *)*((_QWORD *)self + 1);
}

- (void)setConnection_to_driver_service:(id)a3
{
  objc_storeStrong((id *)self + 1, a3);
}

- (AMCP::Utility::Dispatch_Queue)queue
{
  return AMCP::Utility::Dispatch_Queue::Dispatch_Queue(a2, *(dispatch_object_t *)(a1 + 80));
}

- (void)setQueue:(id *)a3
{
  objc_storeStrong((id *)(a1 + 80), *a3);
}

- (Core_Audio_Driver_Service_Client_Callback_Delegate)delegate
{
  return (Core_Audio_Driver_Service_Client_Callback_Delegate *)*((_QWORD *)self + 2);
}

- (void)setDelegate:(id)a3
{
  objc_storeStrong((id *)self + 2, a3);
}

- (NSXPCListener)listener
{
  return (NSXPCListener *)*((_QWORD *)self + 3);
}

- (void)setListener:(id)a3
{
  objc_storeStrong((id *)self + 3, a3);
}

- (NSXPCListenerEndpoint)endpoint
{
  return (NSXPCListenerEndpoint *)*((_QWORD *)self + 4);
}

- (void)setEndpoint:(id)a3
{
  objc_storeStrong((id *)self + 4, a3);
}

- (shared_ptr<std::function<void)driver_service_undertaker
{
  _QWORD *v2;
  uint64_t v3;
  unint64_t *v4;
  unint64_t v5;
  shared_ptr<std::function<void (std::shared_ptr<Driver_File>)>> result;

  v3 = *((_QWORD *)self + 7);
  *v2 = *((_QWORD *)self + 6);
  v2[1] = v3;
  if (v3)
  {
    v4 = (unint64_t *)(v3 + 8);
    do
      v5 = __ldxr(v4);
    while (__stxr(v5 + 1, v4));
  }
  result.__cntrl_ = (__shared_weak_count *)a2;
  result.__ptr_ = self;
  return result;
}

- (void)setDriver_service_undertaker:(shared_ptr<std::function<void)(std::shared_ptr<Driver_File>
{
  uint64_t v3;
  uint64_t v4;
  unint64_t *v5;
  unint64_t v6;
  std::__shared_weak_count *v7;
  unint64_t *p_shared_owners;
  unint64_t v9;

  v4 = *(_QWORD *)a3.__ptr_;
  v3 = *((_QWORD *)a3.__ptr_ + 1);
  if (v3)
  {
    v5 = (unint64_t *)(v3 + 8);
    do
      v6 = __ldxr(v5);
    while (__stxr(v6 + 1, v5));
  }
  v7 = (std::__shared_weak_count *)*((_QWORD *)self + 7);
  *((_QWORD *)self + 6) = v4;
  *((_QWORD *)self + 7) = v3;
  if (v7)
  {
    p_shared_owners = (unint64_t *)&v7->__shared_owners_;
    do
      v9 = __ldaxr(p_shared_owners);
    while (__stlxr(v9 - 1, p_shared_owners));
    if (!v9)
    {
      ((void (*)(std::__shared_weak_count *, SEL))v7->__on_zero_shared)(v7, a2);
      std::__shared_weak_count::__release_weak(v7);
    }
  }
}

- (shared_ptr<Driver_File>)driver_file
{
  _QWORD *v2;
  uint64_t v3;
  unint64_t *v4;
  unint64_t v5;
  shared_ptr<Driver_File> result;

  v3 = *((_QWORD *)self + 9);
  *v2 = *((_QWORD *)self + 8);
  v2[1] = v3;
  if (v3)
  {
    v4 = (unint64_t *)(v3 + 8);
    do
      v5 = __ldxr(v4);
    while (__stxr(v5 + 1, v4));
  }
  result.__cntrl_ = (__shared_weak_count *)a2;
  result.__ptr_ = (Driver_File *)self;
  return result;
}

- (void)setDriver_file:(shared_ptr<Driver_File>)a3
{
  uint64_t v3;
  uint64_t v4;
  unint64_t *v5;
  unint64_t v6;
  std::__shared_weak_count *v7;
  unint64_t *p_shared_owners;
  unint64_t v9;

  v4 = *(_QWORD *)a3.__ptr_;
  v3 = *((_QWORD *)a3.__ptr_ + 1);
  if (v3)
  {
    v5 = (unint64_t *)(v3 + 8);
    do
      v6 = __ldxr(v5);
    while (__stxr(v6 + 1, v5));
  }
  v7 = (std::__shared_weak_count *)*((_QWORD *)self + 9);
  *((_QWORD *)self + 8) = v4;
  *((_QWORD *)self + 9) = v3;
  if (v7)
  {
    p_shared_owners = (unint64_t *)&v7->__shared_owners_;
    do
      v9 = __ldaxr(p_shared_owners);
    while (__stlxr(v9 - 1, p_shared_owners));
    if (!v9)
    {
      ((void (*)(std::__shared_weak_count *, SEL))v7->__on_zero_shared)(v7, a2);
      std::__shared_weak_count::__release_weak(v7);
    }
  }
}

- (NSXPCConnection)connection_from_driver_service
{
  return (NSXPCConnection *)*((_QWORD *)self + 5);
}

- (void)setConnection_from_driver_service:(id)a3
{
  objc_storeStrong((id *)self + 5, a3);
}

- (void).cxx_destruct
{
  AMCP::Utility::Dispatch_Queue::~Dispatch_Queue((AMCP::Utility::Dispatch_Queue *)((char *)self + 80));
  std::shared_ptr<AMCP::Log::Scope>::~shared_ptr[abi:ne180100]((uint64_t)self + 64);
  std::shared_ptr<AMCP::Log::Scope>::~shared_ptr[abi:ne180100]((uint64_t)self + 48);
  objc_storeStrong((id *)self + 5, 0);
  objc_storeStrong((id *)self + 4, 0);
  objc_storeStrong((id *)self + 3, 0);
  objc_storeStrong((id *)self + 2, 0);
  objc_storeStrong((id *)self + 1, 0);
}

- (id).cxx_construct
{
  *((_QWORD *)self + 15) = 0;
  *((_QWORD *)self + 16) = 0;
  *((_OWORD *)self + 3) = 0u;
  *((_OWORD *)self + 4) = 0u;
  *((_OWORD *)self + 5) = 0u;
  *((_OWORD *)self + 6) = 0u;
  *((_WORD *)self + 56) = 0;
  *((_QWORD *)self + 17) = 0;
  *((_QWORD *)self + 18) = 850045863;
  *(_OWORD *)((char *)self + 152) = 0u;
  *(_OWORD *)((char *)self + 168) = 0u;
  *(_OWORD *)((char *)self + 184) = 0u;
  *(_OWORD *)((char *)self + 200) = 0u;
  *(_OWORD *)((char *)self + 216) = 0u;
  *((_QWORD *)self + 29) = 850045863;
  *((_OWORD *)self + 15) = 0u;
  *((_OWORD *)self + 16) = 0u;
  *((_OWORD *)self + 17) = 0u;
  *((_OWORD *)self + 18) = 0u;
  *((_OWORD *)self + 19) = 0u;
  *((_QWORD *)self + 40) = 850045863;
  *(_OWORD *)((char *)self + 328) = 0u;
  *(_OWORD *)((char *)self + 344) = 0u;
  *(_OWORD *)((char *)self + 360) = 0u;
  *(_OWORD *)((char *)self + 376) = 0u;
  *((_QWORD *)self + 49) = dispatch_semaphore_create(0);
  return self;
}

- (id)deferred_driver_loaded:(NSObject  *){objcproto17OS_dispatch_queue} reply:(id)&&
{
  id v2;
  id *v4;

  v4 = (id *)a1;
  v2 = *(id *)a1;
  if (v2)
    objc_msgSend(v2, "deferred_driver_loaded:", *(_QWORD *)(a1 + 8));
  return std::unique_ptr<-[Core_Audio_Driver_Service_Client deferred_driver_loaded:reply:]::$_10>::~unique_ptr[abi:ne180100](&v4);
}

- (id)deferred_driver_loaded:(id *)a1 reply:
{
  id *v2;

  v2 = *a1;
  *a1 = 0;
  if (v2)
  {

    MEMORY[0x1B5E50688](v2, 0x80C40803F642BLL);
  }
  return a1;
}

- (uint64_t)connect_to_driver_service:
{
  uint64_t v2;
  uint64_t v3;

  v2 = *a1;
  *a1 = 0;
  if (v2)
  {
    std::shared_ptr<AMCP::Log::Scope>::~shared_ptr[abi:ne180100](v2 + 16);
    v3 = std::shared_ptr<AMCP::Log::Scope>::~shared_ptr[abi:ne180100](v2);
    MEMORY[0x1B5E50688](v3, 0x20C40DC1BFBCFLL);
  }
  return a1;
}

+ (id)get_driver_name_list:(int)a3
{
  uint64_t v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  id v8;
  _QWORD v10[5];
  _QWORD v11[5];
  id v12;

  v3 = *(_QWORD *)&a3;
  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3B38]), "initWithServiceName:", CFSTR("com.apple.audio.Core-Audio-Driver-Service.helper"));
  objc_msgSend(v4, "uniquify");
  objc_msgSend(MEMORY[0x1E0CB3B50], "interfaceWithProtocol:", &unk_1EF135EE0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setRemoteObjectInterface:", v5);

  objc_msgSend(v4, "resume");
  v12 = 0;
  v6 = MEMORY[0x1E0C809B0];
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3321888768;
  v11[2] = __57__Core_Audio_Driver_Service_Client_get_driver_name_list___block_invoke;
  v11[3] = &__block_descriptor_33_ea8_32c70_ZTSKZ57__Core_Audio_Driver_Service_Client_get_driver_name_list__E3__7_e17_v16__0__NSError_8l;
  objc_msgSend(v4, "synchronousRemoteObjectProxyWithErrorHandler:", v11);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = v6;
  v10[1] = 3321888768;
  v10[2] = __57__Core_Audio_Driver_Service_Client_get_driver_name_list___block_invoke_29;
  v10[3] = &__block_descriptor_40_ea8_32c70_ZTSKZ57__Core_Audio_Driver_Service_Client_get_driver_name_list__E3__8_e17_v16__0__NSArray_8l;
  v10[4] = &v12;
  objc_msgSend(v7, "get_driver_name_list:reply:", v3, v10);
  objc_msgSend(v7, "exit_service");
  objc_msgSend(v4, "invalidate");
  v8 = v12;

  return v8;
}

@end
