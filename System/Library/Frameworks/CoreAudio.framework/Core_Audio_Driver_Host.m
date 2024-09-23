@implementation Core_Audio_Driver_Host

- (Core_Audio_Driver_Host)init
{
  Core_Audio_Driver_Host *v2;
  uint64_t v3;
  NSXPCListener *listener;
  uint64_t v5;
  NSXPCListenerEndpoint *endpoint;
  _QWORD *v7;
  std::__shared_weak_count *v8;
  unint64_t *v9;
  unint64_t v10;
  char *v11;
  std::__shared_weak_count *v12;
  unint64_t *v13;
  unint64_t v14;
  function<void ()> *f;
  uint64_t v16;
  __int128 v18;
  objc_super v19;

  v19.receiver = self;
  v19.super_class = (Class)Core_Audio_Driver_Host;
  v2 = -[Core_Audio_Driver_Host init](&v19, sel_init);
  if (v2)
  {
    objc_msgSend(MEMORY[0x1E0CB3B58], "anonymousListener");
    v3 = objc_claimAutoreleasedReturnValue();
    listener = v2->_listener;
    v2->_listener = (NSXPCListener *)v3;

    -[NSXPCListener setDelegate:](v2->_listener, "setDelegate:", v2);
    -[NSXPCListener resume](v2->_listener, "resume");
    -[NSXPCListener endpoint](v2->_listener, "endpoint");
    v5 = objc_claimAutoreleasedReturnValue();
    endpoint = v2->_endpoint;
    v2->_endpoint = (NSXPCListenerEndpoint *)v5;

    v7 = operator new(0x20uLL);
    v7[1] = 0;
    v7[2] = 0;
    *v7 = &off_1E6995888;
    *((_DWORD *)v7 + 6) = 0;
    *(_QWORD *)&v18 = v7 + 3;
    *((_QWORD *)&v18 + 1) = v7;
    std::shared_ptr<AMCP::Log::Scope>::operator=[abi:ne180100]((uint64_t)&v2->_config_change_lock, &v18);
    v8 = (std::__shared_weak_count *)*((_QWORD *)&v18 + 1);
    if (*((_QWORD *)&v18 + 1))
    {
      v9 = (unint64_t *)(*((_QWORD *)&v18 + 1) + 8);
      do
        v10 = __ldaxr(v9);
      while (__stlxr(v10 - 1, v9));
      if (!v10)
      {
        ((void (*)(std::__shared_weak_count *))v8->__on_zero_shared)(v8);
        std::__shared_weak_count::__release_weak(v8);
      }
    }
    v2->_current_config_change_token = 0;
    objc_storeStrong((id *)&v2->_driver_protocol, &unk_1EF134980);
    objc_storeStrong((id *)&v2->_driver_host_protocol, &unk_1EF1337C0);
    v11 = (char *)operator new(0x70uLL);
    *((_QWORD *)v11 + 1) = 0;
    *((_QWORD *)v11 + 2) = 0;
    *(_QWORD *)v11 = &off_1E69959C8;
    *((_QWORD *)v11 + 4) = 0;
    *((_QWORD *)v11 + 5) = 0;
    *((_QWORD *)v11 + 3) = 0;
    *((_QWORD *)v11 + 6) = 850045863;
    *(_OWORD *)(v11 + 56) = 0u;
    *(_OWORD *)(v11 + 72) = 0u;
    *(_OWORD *)(v11 + 88) = 0u;
    *((_QWORD *)v11 + 13) = 0;
    *(_QWORD *)&v18 = v11 + 24;
    *((_QWORD *)&v18 + 1) = v11;
    std::shared_ptr<AMCP::Log::Scope>::operator=[abi:ne180100]((uint64_t)&v2->_m_custom_property_type_cache, &v18);
    v12 = (std::__shared_weak_count *)*((_QWORD *)&v18 + 1);
    if (*((_QWORD *)&v18 + 1))
    {
      v13 = (unint64_t *)(*((_QWORD *)&v18 + 1) + 8);
      do
        v14 = __ldaxr(v13);
      while (__stlxr(v14 - 1, v13));
      if (!v14)
      {
        ((void (*)(std::__shared_weak_count *))v12->__on_zero_shared)(v12);
        std::__shared_weak_count::__release_weak(v12);
      }
    }
    f = (function<void ()> *)v2->_m_invalidation_handler.__f_.__f_;
    v2->_m_invalidation_handler.__f_.__f_ = 0;
    if (f == &v2->_m_invalidation_handler)
    {
      v16 = 4;
      f = &v2->_m_invalidation_handler;
      goto LABEL_16;
    }
    if (f)
    {
      v16 = 5;
LABEL_16:
      (*(void (**)(void))(*(_QWORD *)f->__f_.__buf_.__lx + 8 * v16))();
    }
  }
  return v2;
}

- (id)init_with_delegate:(id)a3
{
  id v5;
  Core_Audio_Driver_Host *v6;
  Core_Audio_Driver_Host *v7;

  v5 = a3;
  v6 = -[Core_Audio_Driver_Host init](self, "init");
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_delegate, a3);

  return v7;
}

- (void)dealloc
{
  NSXPCConnection *connection_to_driver;
  NSXPCConnection *v4;
  NSXPCConnection *connection_from_driver;
  NSXPCConnection *v6;
  NSXPCListener *listener;
  NSXPCListener *v8;
  Core_Audio_Driver_Host_Callback_Delegate *delegate;
  NSXPCListenerEndpoint *endpoint;
  objc_super v11;

  connection_to_driver = self->_connection_to_driver;
  if (connection_to_driver)
  {
    -[NSXPCConnection invalidate](connection_to_driver, "invalidate");
    v4 = self->_connection_to_driver;
    self->_connection_to_driver = 0;

  }
  connection_from_driver = self->_connection_from_driver;
  if (connection_from_driver)
  {
    -[NSXPCConnection invalidate](connection_from_driver, "invalidate");
    v6 = self->_connection_from_driver;
    self->_connection_from_driver = 0;

  }
  listener = self->_listener;
  if (listener)
  {
    -[NSXPCListener invalidate](listener, "invalidate");
    v8 = self->_listener;
    self->_listener = 0;

  }
  delegate = self->_delegate;
  if (delegate)
  {
    self->_delegate = 0;

  }
  endpoint = self->_endpoint;
  if (endpoint)
  {
    self->_endpoint = 0;

  }
  v11.receiver = self;
  v11.super_class = (Class)Core_Audio_Driver_Host;
  -[Core_Audio_Driver_Host dealloc](&v11, sel_dealloc);
}

- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  _QWORD v10[5];

  v5 = a4;
  v6 = (void *)MEMORY[0x1E0CB3B50];
  -[Core_Audio_Driver_Host driver_host_protocol](self, "driver_host_protocol");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "interfaceWithProtocol:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setExportedInterface:", v8);

  objc_msgSend(v5, "setExportedObject:", self);
  objc_msgSend(v5, "setInterruptionHandler:", &__block_literal_global_4372);
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __61__Core_Audio_Driver_Host_listener_shouldAcceptNewConnection___block_invoke_2;
  v10[3] = &unk_1E69957F8;
  v10[4] = self;
  objc_msgSend(v5, "setInvalidationHandler:", v10);
  objc_msgSend(v5, "resume");
  -[Core_Audio_Driver_Host setConnection_from_driver:](self, "setConnection_from_driver:", v5);

  return 1;
}

- (void)object_properties_changed:(unsigned int)a3 properties_data:(id)a4 reply:(id)a5
{
  uint64_t v6;
  void (**v8)(id, uint64_t);
  void *v9;
  void *v10;
  uint64_t v11;
  id v12;

  v6 = *(_QWORD *)&a3;
  v12 = a4;
  v8 = (void (**)(id, uint64_t))a5;
  if (objc_msgSend(v12, "length"))
  {
    -[Core_Audio_Driver_Host delegate](self, "delegate");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = v9;
    if (v9)
      objc_msgSend(v9, "object_properties_changed:data:", v6, v12);

    v11 = 0;
  }
  else
  {
    v11 = 561211770;
  }
  v8[2](v8, v11);

}

- (void)request_config_change:(unsigned int)a3 change_action:(unint64_t)a4 reply:(id)a5
{
  uint64_t v6;
  void (**v8)(id, _QWORD, unint64_t);
  os_unfair_lock_s *v9;
  std::__shared_weak_count *v10;
  unint64_t *p_shared_owners;
  unint64_t v12;
  unint64_t v13;
  void *v14;
  void *v15;
  os_unfair_lock_t lock;
  std::__shared_weak_count *v17;

  v6 = *(_QWORD *)&a3;
  v8 = (void (**)(id, _QWORD, unint64_t))a5;
  -[Core_Audio_Driver_Host config_change_lock](self, "config_change_lock");
  v9 = lock;
  os_unfair_lock_lock(lock);
  v10 = v17;
  if (v17)
  {
    p_shared_owners = (unint64_t *)&v17->__shared_owners_;
    do
      v12 = __ldaxr(p_shared_owners);
    while (__stlxr(v12 - 1, p_shared_owners));
    if (!v12)
    {
      ((void (*)(std::__shared_weak_count *))v10->__on_zero_shared)(v10);
      std::__shared_weak_count::__release_weak(v10);
    }
  }
  v13 = -[Core_Audio_Driver_Host current_config_change_token](self, "current_config_change_token") + 1;
  -[Core_Audio_Driver_Host setCurrent_config_change_token:](self, "setCurrent_config_change_token:", v13);
  -[Core_Audio_Driver_Host delegate](self, "delegate");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  if (v14)
  {
    -[Core_Audio_Driver_Host delegate](self, "delegate");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "request_config_change:change_action:change_token:", v6, a4, v13);

  }
  v8[2](v8, 0, v13);
  os_unfair_lock_unlock(v9);

}

- (void)write_storage_settings:(id)a3 storage_data:(id)a4 reply:(id)a5
{
  id v8;
  void (**v9)(id, uint64_t);
  void *v10;
  uint64_t v11;
  CFTypeRef cf;
  unsigned int v13;

  v8 = a3;
  v9 = (void (**)(id, uint64_t))a5;
  v13 = 8;
  cf = 0;
  AMCP::HAL::unpack_property_data(a4, 15, &v13, &cf);
  -[Core_Audio_Driver_Host delegate](self, "delegate");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "write_storage_settings:storage_data:", v8, cf);

  if (cf)
    CFRelease(cf);
  v9[2](v9, v11);

}

- (void)copy_storage_settings:(id)a3 reply:(id)a4
{
  id v6;
  void (**v7)(id, _QWORD, void *);
  void *v8;
  const void *v9;
  void *v10;
  unsigned int v11;
  CFTypeRef cf;

  v6 = a3;
  v7 = (void (**)(id, _QWORD, void *))a4;
  -[Core_Audio_Driver_Host delegate](self, "delegate");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v8, "copy_storage_settings:", v6);
  cf = v9;

  AMCP::HAL::pack_property_data(15, 8u, (CFStringRef *)&cf);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v7[2](v7, v11, v10);
  if (cf)
    CFRelease(cf);

}

- (void)delete_storage_settings:(id)a3 reply:(id)a4
{
  void (**v6)(id, uint64_t);
  void *v7;
  uint64_t v8;
  id v9;

  v9 = a3;
  v6 = (void (**)(id, uint64_t))a4;
  -[Core_Audio_Driver_Host delegate](self, "delegate");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "delete_storage_settings:", v9);

  v6[2](v6, v8);
}

- (int)initialize_driver:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  Core_Audio_Driver_Host *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  int v23;
  _QWORD v25[5];
  _QWORD v26[5];
  _QWORD v27[4];
  Core_Audio_Driver_Host *v28;
  int v29;

  v4 = a3;
  v29 = 2003329396;
  v5 = (void *)MEMORY[0x1B5E50CDC]();
  -[Core_Audio_Driver_Host driver_endpoint](self, "driver_endpoint");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v6)
    -[Core_Audio_Driver_Host setDriver_endpoint:](self, "setDriver_endpoint:", v4);
  -[Core_Audio_Driver_Host connection_to_driver](self, "connection_to_driver");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = MEMORY[0x1E0C809B0];
  if (!v7)
  {
    v9 = objc_alloc(MEMORY[0x1E0CB3B38]);
    -[Core_Audio_Driver_Host driver_endpoint](self, "driver_endpoint");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = (void *)objc_msgSend(v9, "initWithListenerEndpoint:", v10);
    -[Core_Audio_Driver_Host setConnection_to_driver:](self, "setConnection_to_driver:", v11);

    -[Core_Audio_Driver_Host connection_to_driver](self, "connection_to_driver");
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    if (v12)
    {
      v13 = (void *)MEMORY[0x1E0CB3B50];
      -[Core_Audio_Driver_Host driver_protocol](self, "driver_protocol");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "interfaceWithProtocol:", v14);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      -[Core_Audio_Driver_Host connection_to_driver](self, "connection_to_driver");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "setRemoteObjectInterface:", v15);

      v27[0] = v8;
      v27[1] = 3221225472;
      v27[2] = __44__Core_Audio_Driver_Host_initialize_driver___block_invoke;
      v27[3] = &unk_1E69957F8;
      v17 = self;
      v28 = v17;
      -[Core_Audio_Driver_Host connection_to_driver](v17, "connection_to_driver");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "setInvalidationHandler:", v27);

      -[Core_Audio_Driver_Host connection_to_driver](v17, "connection_to_driver");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "resume");

    }
  }
  -[Core_Audio_Driver_Host connection_to_driver](self, "connection_to_driver");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v26[0] = v8;
  v26[1] = 3321888768;
  v26[2] = __44__Core_Audio_Driver_Host_initialize_driver___block_invoke_2;
  v26[3] = &__block_descriptor_33_ea8_32c57_ZTSKZ44__Core_Audio_Driver_Host_initialize_driver__E3__4_e17_v16__0__NSError_8l;
  objc_msgSend(v20, "synchronousRemoteObjectProxyWithErrorHandler:", v26);
  v21 = (void *)objc_claimAutoreleasedReturnValue();

  if (v21)
  {
    -[Core_Audio_Driver_Host endpoint](self, "endpoint");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v25[0] = v8;
    v25[1] = 3321888768;
    v25[2] = __44__Core_Audio_Driver_Host_initialize_driver___block_invoke_65;
    v25[3] = &__block_descriptor_40_ea8_32c57_ZTSKZ44__Core_Audio_Driver_Host_initialize_driver__E3__5_e8_v12__0i8l;
    v25[4] = &v29;
    objc_msgSend(v21, "initialize:reply:", v22, v25);

  }
  objc_autoreleasePoolPop(v5);
  v23 = v29;

  return v23;
}

- (void)set_invalidation_handler:(function<void)(
{
  _QWORD *v4;
  uint64_t v5;
  _BYTE v6[24];
  _BYTE *v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  std::__function::__value_func<void ()(void)>::__value_func[abi:ne180100]((uint64_t)v6, (uint64_t)a3);
  -[Core_Audio_Driver_Host setM_invalidation_handler:](self, "setM_invalidation_handler:", v6);
  v4 = v7;
  if (v7 == v6)
  {
    v5 = 4;
    v4 = v6;
  }
  else
  {
    if (!v7)
      return;
    v5 = 5;
  }
  (*(void (**)(void))(*v4 + 8 * v5))();
}

- (int)perform_device_configuration_change:(unsigned int)a3 action:(unint64_t)a4 change:(unint64_t)a5
{
  uint64_t v7;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  _QWORD v14[5];
  _QWORD v15[5];
  int v16;

  v7 = *(_QWORD *)&a3;
  v16 = 2003329396;
  v9 = (void *)MEMORY[0x1B5E50CDC](self, a2);
  -[Core_Audio_Driver_Host connection_to_driver](self, "connection_to_driver");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = MEMORY[0x1E0C809B0];
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3321888768;
  v15[2] = __76__Core_Audio_Driver_Host_perform_device_configuration_change_action_change___block_invoke;
  v15[3] = &__block_descriptor_40_ea8_32c89_ZTSKZ76__Core_Audio_Driver_Host_perform_device_configuration_change_action_change__E3__6_e17_v16__0__NSError_8l;
  v15[4] = &v16;
  objc_msgSend(v10, "synchronousRemoteObjectProxyWithErrorHandler:", v15);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  v14[0] = v11;
  v14[1] = 3321888768;
  v14[2] = __76__Core_Audio_Driver_Host_perform_device_configuration_change_action_change___block_invoke_69;
  v14[3] = &__block_descriptor_40_ea8_32c89_ZTSKZ76__Core_Audio_Driver_Host_perform_device_configuration_change_action_change__E3__7_e8_v12__0i8l;
  v14[4] = &v16;
  objc_msgSend(v12, "perform_device_configuration_change:action:change:reply:", v7, a4, a5, v14);

  objc_autoreleasePoolPop(v9);
  return v16;
}

- (int)abort_device_configuration_change:(unsigned int)a3 action:(unint64_t)a4 change:(unint64_t)a5
{
  uint64_t v7;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  _QWORD v14[5];
  _QWORD v15[5];
  int v16;

  v7 = *(_QWORD *)&a3;
  v16 = 2003329396;
  v9 = (void *)MEMORY[0x1B5E50CDC](self, a2);
  -[Core_Audio_Driver_Host connection_to_driver](self, "connection_to_driver");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = MEMORY[0x1E0C809B0];
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3321888768;
  v15[2] = __74__Core_Audio_Driver_Host_abort_device_configuration_change_action_change___block_invoke;
  v15[3] = &__block_descriptor_40_ea8_32c87_ZTSKZ74__Core_Audio_Driver_Host_abort_device_configuration_change_action_change__E3__8_e17_v16__0__NSError_8l;
  v15[4] = &v16;
  objc_msgSend(v10, "synchronousRemoteObjectProxyWithErrorHandler:", v15);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  v14[0] = v11;
  v14[1] = 3321888768;
  v14[2] = __74__Core_Audio_Driver_Host_abort_device_configuration_change_action_change___block_invoke_72;
  v14[3] = &__block_descriptor_40_ea8_32c87_ZTSKZ74__Core_Audio_Driver_Host_abort_device_configuration_change_action_change__E3__9_e8_v12__0i8l;
  v14[4] = &v16;
  objc_msgSend(v12, "abort_device_configuration_change:action:change:reply:", v7, a4, a5, v14);

  objc_autoreleasePoolPop(v9);
  return v16;
}

- (int)add_device_client:(unsigned int)a3 client_info:(const AudioServerPlugInClientInfo *)a4
{
  uint64_t v5;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  uint64_t mClientID;
  uint64_t mProcessID;
  _BOOL8 v13;
  CFStringRef mBundleID;
  _QWORD v16[5];
  _QWORD v17[5];
  int v18;

  v5 = *(_QWORD *)&a3;
  v18 = 2003329396;
  v7 = (void *)MEMORY[0x1B5E50CDC](self, a2);
  -[Core_Audio_Driver_Host connection_to_driver](self, "connection_to_driver");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = MEMORY[0x1E0C809B0];
  v17[0] = MEMORY[0x1E0C809B0];
  v17[1] = 3321888768;
  v17[2] = __56__Core_Audio_Driver_Host_add_device_client_client_info___block_invoke;
  v17[3] = &__block_descriptor_40_ea8_32c70_ZTSKZ56__Core_Audio_Driver_Host_add_device_client_client_info__E4__10_e17_v16__0__NSError_8l;
  v17[4] = &v18;
  objc_msgSend(v8, "synchronousRemoteObjectProxyWithErrorHandler:", v17);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  mClientID = a4->mClientID;
  mProcessID = a4->mProcessID;
  v13 = a4->mIsNativeEndian != 0;
  mBundleID = a4->mBundleID;
  v16[0] = v9;
  v16[1] = 3321888768;
  v16[2] = __56__Core_Audio_Driver_Host_add_device_client_client_info___block_invoke_75;
  v16[3] = &__block_descriptor_40_ea8_32c70_ZTSKZ56__Core_Audio_Driver_Host_add_device_client_client_info__E4__11_e8_v12__0i8l;
  v16[4] = &v18;
  objc_msgSend(v10, "add_device_client:client_id:process_id:is_native_endianess:bundle_id:reply:", v5, mClientID, mProcessID, v13, mBundleID, v16);

  objc_autoreleasePoolPop(v7);
  return v18;
}

- (int)remove_device_client:(unsigned int)a3 client_info:(const AudioServerPlugInClientInfo *)a4
{
  uint64_t v5;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  uint64_t mClientID;
  uint64_t mProcessID;
  _BOOL8 v13;
  CFStringRef mBundleID;
  _QWORD v16[5];
  _QWORD v17[5];
  int v18;

  v5 = *(_QWORD *)&a3;
  v18 = 2003329396;
  v7 = (void *)MEMORY[0x1B5E50CDC](self, a2);
  -[Core_Audio_Driver_Host connection_to_driver](self, "connection_to_driver");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = MEMORY[0x1E0C809B0];
  v17[0] = MEMORY[0x1E0C809B0];
  v17[1] = 3321888768;
  v17[2] = __59__Core_Audio_Driver_Host_remove_device_client_client_info___block_invoke;
  v17[3] = &__block_descriptor_40_ea8_32c73_ZTSKZ59__Core_Audio_Driver_Host_remove_device_client_client_info__E4__12_e17_v16__0__NSError_8l;
  v17[4] = &v18;
  objc_msgSend(v8, "synchronousRemoteObjectProxyWithErrorHandler:", v17);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  mClientID = a4->mClientID;
  mProcessID = a4->mProcessID;
  v13 = a4->mIsNativeEndian != 0;
  mBundleID = a4->mBundleID;
  v16[0] = v9;
  v16[1] = 3321888768;
  v16[2] = __59__Core_Audio_Driver_Host_remove_device_client_client_info___block_invoke_78;
  v16[3] = &__block_descriptor_40_ea8_32c73_ZTSKZ59__Core_Audio_Driver_Host_remove_device_client_client_info__E4__13_e8_v12__0i8l;
  v16[4] = &v18;
  objc_msgSend(v10, "remove_device_client:client_id:process_id:is_native_endianess:bundle_id:reply:", v5, mClientID, mProcessID, v13, mBundleID, v16);

  objc_autoreleasePoolPop(v7);
  return v18;
}

- (int)create_device:(id)a3 client_info:(const AudioServerPlugInClientInfo *)a4 out_object_id:(unsigned int *)a5
{
  id v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  uint64_t mClientID;
  uint64_t mProcessID;
  _BOOL8 v15;
  CFStringRef mBundleID;
  _QWORD v18[6];
  _QWORD v19[5];
  int v20;
  unsigned int *v21;

  v8 = a3;
  v21 = a5;
  v20 = 2003329396;
  v9 = (void *)MEMORY[0x1B5E50CDC]();
  -[Core_Audio_Driver_Host connection_to_driver](self, "connection_to_driver");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = MEMORY[0x1E0C809B0];
  v19[0] = MEMORY[0x1E0C809B0];
  v19[1] = 3321888768;
  v19[2] = __66__Core_Audio_Driver_Host_create_device_client_info_out_object_id___block_invoke;
  v19[3] = &__block_descriptor_40_ea8_32c80_ZTSKZ66__Core_Audio_Driver_Host_create_device_client_info_out_object_id__E4__14_e17_v16__0__NSError_8l;
  v19[4] = &v20;
  objc_msgSend(v10, "synchronousRemoteObjectProxyWithErrorHandler:", v19);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  mClientID = a4->mClientID;
  mProcessID = a4->mProcessID;
  v15 = a4->mIsNativeEndian != 0;
  mBundleID = a4->mBundleID;
  v18[0] = v11;
  v18[1] = 3321888768;
  v18[2] = __66__Core_Audio_Driver_Host_create_device_client_info_out_object_id___block_invoke_81;
  v18[3] = &__block_descriptor_48_ea8_32c80_ZTSKZ66__Core_Audio_Driver_Host_create_device_client_info_out_object_id__E4__15_e11_v16__0i8I12l;
  v18[4] = &v20;
  v18[5] = &v21;
  objc_msgSend(v12, "create_device:client_id:process_id:is_native_endianess:bundle_id:reply:", v8, mClientID, mProcessID, v15, mBundleID, v18);

  objc_autoreleasePoolPop(v9);
  LODWORD(v9) = v20;

  return (int)v9;
}

- (int)destroy_device:(unsigned int)a3
{
  uint64_t v3;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  _QWORD v10[5];
  _QWORD v11[5];
  int v12;

  v3 = *(_QWORD *)&a3;
  v12 = 2003329396;
  v5 = (void *)MEMORY[0x1B5E50CDC](self, a2);
  -[Core_Audio_Driver_Host connection_to_driver](self, "connection_to_driver");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = MEMORY[0x1E0C809B0];
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3321888768;
  v11[2] = __41__Core_Audio_Driver_Host_destroy_device___block_invoke;
  v11[3] = &__block_descriptor_40_ea8_32c55_ZTSKZ41__Core_Audio_Driver_Host_destroy_device__E4__16_e17_v16__0__NSError_8l;
  v11[4] = &v12;
  objc_msgSend(v6, "synchronousRemoteObjectProxyWithErrorHandler:", v11);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v10[0] = v7;
  v10[1] = 3321888768;
  v10[2] = __41__Core_Audio_Driver_Host_destroy_device___block_invoke_85;
  v10[3] = &__block_descriptor_40_ea8_32c55_ZTSKZ41__Core_Audio_Driver_Host_destroy_device__E4__17_e8_v12__0i8l;
  v10[4] = &v12;
  objc_msgSend(v8, "destroy_device:reply:", v3, v10);

  objc_autoreleasePoolPop(v5);
  return v12;
}

- (int)object_was_destroyed:(unsigned int)a3
{
  uint64_t v3;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  unint64_t *p_shared_owners;
  unint64_t v10;
  Property_Type_Info *v12;
  std::__shared_weak_count *v13;
  _QWORD v14[5];
  _QWORD v15[5];
  int v16;

  v3 = *(_QWORD *)&a3;
  v16 = 2003329396;
  v5 = (void *)MEMORY[0x1B5E50CDC](self, a2);
  -[Core_Audio_Driver_Host connection_to_driver](self, "connection_to_driver");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = MEMORY[0x1E0C809B0];
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3321888768;
  v15[2] = __47__Core_Audio_Driver_Host_object_was_destroyed___block_invoke;
  v15[3] = &__block_descriptor_40_ea8_32c61_ZTSKZ47__Core_Audio_Driver_Host_object_was_destroyed__E4__18_e17_v16__0__NSError_8l;
  v15[4] = &v16;
  objc_msgSend(v6, "synchronousRemoteObjectProxyWithErrorHandler:", v15);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v14[0] = v7;
  v14[1] = 3321888768;
  v14[2] = __47__Core_Audio_Driver_Host_object_was_destroyed___block_invoke_88;
  v14[3] = &__block_descriptor_40_ea8_32c61_ZTSKZ47__Core_Audio_Driver_Host_object_was_destroyed__E4__19_e8_v12__0i8l;
  v14[4] = &v16;
  objc_msgSend(v8, "object_was_destroyed:reply:", v3, v14);
  -[Core_Audio_Driver_Host m_property_type_info](self, "m_property_type_info");
  Property_Type_Info::remove_custom_properties(v12, v3);
  if (v13)
  {
    p_shared_owners = (unint64_t *)&v13->__shared_owners_;
    do
      v10 = __ldaxr(p_shared_owners);
    while (__stlxr(v10 - 1, p_shared_owners));
    if (!v10)
    {
      ((void (*)())v13->__on_zero_shared)();
      std::__shared_weak_count::__release_weak(v13);
    }
  }

  objc_autoreleasePoolPop(v5);
  return v16;
}

- (int)start_io:(unsigned int)a3 client_info:(unsigned int)a4
{
  uint64_t v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  void *v8;
  int v9;
  _QWORD v11[5];
  _QWORD v12[4];
  int v13;

  v4 = *(_QWORD *)&a4;
  v5 = *(_QWORD *)&a3;
  v13 = 0;
  -[Core_Audio_Driver_Host connection_to_driver](self, "connection_to_driver");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = MEMORY[0x1E0C809B0];
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3321888768;
  v12[2] = __47__Core_Audio_Driver_Host_start_io_client_info___block_invoke;
  v12[3] = &__block_descriptor_33_ea8_32c61_ZTSKZ47__Core_Audio_Driver_Host_start_io_client_info__E4__20_e17_v16__0__NSError_8l;
  objc_msgSend(v6, "synchronousRemoteObjectProxyWithErrorHandler:", v12);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    v11[0] = v7;
    v11[1] = 3321888768;
    v11[2] = __47__Core_Audio_Driver_Host_start_io_client_info___block_invoke_90;
    v11[3] = &__block_descriptor_40_ea8_32c61_ZTSKZ47__Core_Audio_Driver_Host_start_io_client_info__E4__21_e8_v12__0i8l;
    v11[4] = &v13;
    objc_msgSend(v8, "start_io:client_id:reply:", v5, v4, v11);
    v9 = v13;
  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (int)stop_io:(unsigned int)a3 client_info:(unsigned int)a4
{
  uint64_t v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  void *v8;
  int v9;
  _QWORD v11[5];
  _QWORD v12[4];
  int v13;

  v4 = *(_QWORD *)&a4;
  v5 = *(_QWORD *)&a3;
  v13 = 0;
  -[Core_Audio_Driver_Host connection_to_driver](self, "connection_to_driver");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = MEMORY[0x1E0C809B0];
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3321888768;
  v12[2] = __46__Core_Audio_Driver_Host_stop_io_client_info___block_invoke;
  v12[3] = &__block_descriptor_33_ea8_32c60_ZTSKZ46__Core_Audio_Driver_Host_stop_io_client_info__E4__22_e17_v16__0__NSError_8l;
  objc_msgSend(v6, "synchronousRemoteObjectProxyWithErrorHandler:", v12);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    v11[0] = v7;
    v11[1] = 3321888768;
    v11[2] = __46__Core_Audio_Driver_Host_stop_io_client_info___block_invoke_92;
    v11[3] = &__block_descriptor_40_ea8_32c60_ZTSKZ46__Core_Audio_Driver_Host_stop_io_client_info__E4__23_e8_v12__0i8l;
    v11[4] = &v13;
    objc_msgSend(v8, "stop_io:client_id:reply:", v5, v4, v11);
    v9 = v13;
  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (int)start_synchronous_messenger:(unsigned int)a3 client_id:(unsigned int)a4 nominal_sample_rate:(double)a5 io_buffer_frame_size:(unsigned int)a6 work_group_port:(unsigned int)a7 io_messenger:(id)a8
{
  uint64_t v8;
  uint64_t v10;
  uint64_t v11;
  id v13;
  void *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  int v20;
  _QWORD v22[5];
  _QWORD v23[4];
  int v24;

  v8 = *(_QWORD *)&a6;
  v10 = *(_QWORD *)&a4;
  v11 = *(_QWORD *)&a3;
  v13 = a8;
  v24 = 0;
  -[Core_Audio_Driver_Host connection_to_driver](self, "connection_to_driver");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = MEMORY[0x1E0C809B0];
  v23[0] = MEMORY[0x1E0C809B0];
  v23[1] = 3321888768;
  v23[2] = __134__Core_Audio_Driver_Host_start_synchronous_messenger_client_id_nominal_sample_rate_io_buffer_frame_size_work_group_port_io_messenger___block_invoke;
  v23[3] = &__block_descriptor_33_ea8_32c149_ZTSKZ134__Core_Audio_Driver_Host_start_synchronous_messenger_client_id_nominal_sample_rate_io_buffer_frame_size_work_group_port_io_messenger__E4__24_e17_v16__0__NSError_8l;
  objc_msgSend(v14, "synchronousRemoteObjectProxyWithErrorHandler:", v23);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  if (v16)
  {
    v17 = (void *)xpc_mach_send_create();
    +[Core_Audio_XPC_Raw_Transporter object:](Core_Audio_XPC_Raw_Transporter, "object:", v17);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    +[Core_Audio_XPC_Raw_Transporter object:](Core_Audio_XPC_Raw_Transporter, "object:", v13);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v22[0] = v15;
    v22[1] = 3321888768;
    v22[2] = __134__Core_Audio_Driver_Host_start_synchronous_messenger_client_id_nominal_sample_rate_io_buffer_frame_size_work_group_port_io_messenger___block_invoke_95;
    v22[3] = &__block_descriptor_40_ea8_32c149_ZTSKZ134__Core_Audio_Driver_Host_start_synchronous_messenger_client_id_nominal_sample_rate_io_buffer_frame_size_work_group_port_io_messenger__E4__25_e8_v12__0i8l;
    v22[4] = &v24;
    objc_msgSend(v16, "start_synchronous_messenger:client_id:nominal_sample_rate:io_buffer_frame_size:work_group_port:io_messenger:reply:", v11, v10, v8, v18, v19, v22, a5);

    v20 = v24;
  }
  else
  {
    v20 = 0;
  }

  return v20;
}

- (int)stop_synchronous_messenger:(unsigned int)a3 client_id:(unsigned int)a4
{
  uint64_t v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  void *v8;
  int v9;
  _QWORD v11[5];
  _QWORD v12[4];
  int v13;

  v4 = *(_QWORD *)&a4;
  v5 = *(_QWORD *)&a3;
  v13 = 0;
  -[Core_Audio_Driver_Host connection_to_driver](self, "connection_to_driver");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = MEMORY[0x1E0C809B0];
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3321888768;
  v12[2] = __63__Core_Audio_Driver_Host_stop_synchronous_messenger_client_id___block_invoke;
  v12[3] = &__block_descriptor_33_ea8_32c77_ZTSKZ63__Core_Audio_Driver_Host_stop_synchronous_messenger_client_id__E4__26_e17_v16__0__NSError_8l;
  objc_msgSend(v6, "synchronousRemoteObjectProxyWithErrorHandler:", v12);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    v11[0] = v7;
    v11[1] = 3321888768;
    v11[2] = __63__Core_Audio_Driver_Host_stop_synchronous_messenger_client_id___block_invoke_97;
    v11[3] = &__block_descriptor_40_ea8_32c77_ZTSKZ63__Core_Audio_Driver_Host_stop_synchronous_messenger_client_id__E4__27_e8_v12__0i8l;
    v11[4] = &v13;
    objc_msgSend(v8, "stop_synchronous_messenger:client_id:reply:", v5, v4, v11);
    v9 = v13;
  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (void)retain_reply_for_process_boost
{
  void *v2;
  uint64_t v3;
  void *v4;
  _QWORD v5[5];
  _QWORD v6[5];

  -[Core_Audio_Driver_Host connection_to_driver](self, "connection_to_driver");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = MEMORY[0x1E0C809B0];
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3321888768;
  v6[2] = __56__Core_Audio_Driver_Host_retain_reply_for_process_boost__block_invoke;
  v6[3] = &__block_descriptor_33_ea8_32c70_ZTSKZ56__Core_Audio_Driver_Host_retain_reply_for_process_boost_E4__28_e17_v16__0__NSError_8l;
  objc_msgSend(v2, "remoteObjectProxyWithErrorHandler:", v6);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    v5[0] = v3;
    v5[1] = 3321888768;
    v5[2] = __56__Core_Audio_Driver_Host_retain_reply_for_process_boost__block_invoke_99;
    v5[3] = &__block_descriptor_33_ea8_32c70_ZTSKZ56__Core_Audio_Driver_Host_retain_reply_for_process_boost_E4__29_e5_v8__0l;
    objc_msgSend(v4, "retain_reply_for_process_boost:", v5);
  }

}

- (int)register_buffer:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  int v10;
  _QWORD v12[5];
  _QWORD v13[5];
  int v14;

  v4 = a3;
  v14 = 0;
  v5 = (void *)MEMORY[0x1B5E50CDC]();
  -[Core_Audio_Driver_Host connection_to_driver](self, "connection_to_driver");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = MEMORY[0x1E0C809B0];
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3321888768;
  v13[2] = __42__Core_Audio_Driver_Host_register_buffer___block_invoke;
  v13[3] = &__block_descriptor_40_ea8_32c56_ZTSKZ42__Core_Audio_Driver_Host_register_buffer__E4__30_e17_v16__0__NSError_8l;
  v13[4] = &v14;
  objc_msgSend(v6, "synchronousRemoteObjectProxyWithErrorHandler:", v13);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    +[Core_Audio_XPC_Raw_Transporter object:](Core_Audio_XPC_Raw_Transporter, "object:", v4);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v12[0] = v7;
    v12[1] = 3321888768;
    v12[2] = __42__Core_Audio_Driver_Host_register_buffer___block_invoke_101;
    v12[3] = &__block_descriptor_40_ea8_32c56_ZTSKZ42__Core_Audio_Driver_Host_register_buffer__E4__31_e8_v12__0i8l;
    v12[4] = &v14;
    objc_msgSend(v8, "register_io_buffer:reply:", v9, v12);

  }
  objc_autoreleasePoolPop(v5);
  v10 = v14;

  return v10;
}

- (int)unregister_buffer:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  int v10;
  _QWORD v12[5];
  _QWORD v13[5];
  int v14;

  v4 = a3;
  v14 = 0;
  v5 = (void *)MEMORY[0x1B5E50CDC]();
  -[Core_Audio_Driver_Host connection_to_driver](self, "connection_to_driver");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = MEMORY[0x1E0C809B0];
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3321888768;
  v13[2] = __44__Core_Audio_Driver_Host_unregister_buffer___block_invoke;
  v13[3] = &__block_descriptor_40_ea8_32c58_ZTSKZ44__Core_Audio_Driver_Host_unregister_buffer__E4__32_e17_v16__0__NSError_8l;
  v13[4] = &v14;
  objc_msgSend(v6, "synchronousRemoteObjectProxyWithErrorHandler:", v13);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    +[Core_Audio_XPC_Raw_Transporter object:](Core_Audio_XPC_Raw_Transporter, "object:", v4);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v12[0] = v7;
    v12[1] = 3321888768;
    v12[2] = __44__Core_Audio_Driver_Host_unregister_buffer___block_invoke_104;
    v12[3] = &__block_descriptor_40_ea8_32c58_ZTSKZ44__Core_Audio_Driver_Host_unregister_buffer__E4__33_e8_v12__0i8l;
    v12[4] = &v14;
    objc_msgSend(v8, "unregister_io_buffer:reply:", v9, v12);

  }
  objc_autoreleasePoolPop(v5);
  v10 = v14;

  return v10;
}

- (int)has_property:(Driver_Property_Identity *)a3 out_has_property:(char *)a4
{
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  _QWORD v11[5];
  __int128 v12;
  AudioObjectPropertyElement mElement;
  _QWORD v14[5];
  int v15;
  char *v16;

  v16 = a4;
  v15 = 0;
  v6 = (void *)MEMORY[0x1B5E50CDC](self, a2);
  -[Core_Audio_Driver_Host connection_to_driver](self, "connection_to_driver");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = MEMORY[0x1E0C809B0];
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3321888768;
  v14[2] = __56__Core_Audio_Driver_Host_has_property_out_has_property___block_invoke;
  v14[3] = &__block_descriptor_40_ea8_32c70_ZTSKZ56__Core_Audio_Driver_Host_has_property_out_has_property__E4__34_e17_v16__0__NSError_8l;
  v14[4] = &v15;
  objc_msgSend(v7, "synchronousRemoteObjectProxyWithErrorHandler:", v14);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
  {
    v12 = *(_OWORD *)&a3->var0;
    mElement = a3->var2.mElement;
    v11[0] = v8;
    v11[1] = 3321888768;
    v11[2] = __56__Core_Audio_Driver_Host_has_property_out_has_property___block_invoke_107;
    v11[3] = &__block_descriptor_40_ea8_32c70_ZTSKZ56__Core_Audio_Driver_Host_has_property_out_has_property__E4__35_e8_v12__0C8l;
    v11[4] = &v16;
    objc_msgSend(v9, "has_property:reply:", &v12, v11);
  }

  objc_autoreleasePoolPop(v6);
  return v15;
}

- (int)is_property_settable:(Driver_Property_Identity *)a3 out_settable:(char *)a4
{
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  char v11;
  _QWORD v13[6];
  __int128 v14;
  AudioObjectPropertyElement mElement;
  _QWORD v16[5];
  int v17;
  char v18;

  v18 = 0;
  v17 = 2003329396;
  v7 = (void *)MEMORY[0x1B5E50CDC](self, a2);
  -[Core_Audio_Driver_Host connection_to_driver](self, "connection_to_driver");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = MEMORY[0x1E0C809B0];
  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3321888768;
  v16[2] = __60__Core_Audio_Driver_Host_is_property_settable_out_settable___block_invoke;
  v16[3] = &__block_descriptor_40_ea8_32c74_ZTSKZ60__Core_Audio_Driver_Host_is_property_settable_out_settable__E4__36_e17_v16__0__NSError_8l;
  v16[4] = &v17;
  objc_msgSend(v8, "synchronousRemoteObjectProxyWithErrorHandler:", v16);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10)
  {
    v14 = *(_OWORD *)&a3->var0;
    mElement = a3->var2.mElement;
    v13[0] = v9;
    v13[1] = 3321888768;
    v13[2] = __60__Core_Audio_Driver_Host_is_property_settable_out_settable___block_invoke_111;
    v13[3] = &__block_descriptor_48_ea8_32c74_ZTSKZ60__Core_Audio_Driver_Host_is_property_settable_out_settable__E4__37_e11_v16__0i8C12l;
    v13[4] = &v17;
    v13[5] = &v18;
    objc_msgSend(v10, "is_property_settable:reply:", &v14, v13);
    v11 = v18;
  }
  else
  {
    v11 = 0;
  }
  *a4 = v11;

  objc_autoreleasePoolPop(v7);
  return v17;
}

- (int)get_property_data_size:(Driver_Property_Identity *)a3 qualifier_data_size:(unsigned int)a4 qualifier_data:(const void *)a5 out_size:(unsigned int *)a6
{
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  unsigned int property_qualifier_type_code;
  uint64_t *p_shared_owners;
  unint64_t v17;
  unsigned int v18;
  unsigned int v19;
  _QWORD v21[6];
  __int128 v22;
  AudioObjectPropertyElement mElement;
  Property_Type_Info *v24;
  std::__shared_weak_count *v25;
  _QWORD v26[5];
  uint64_t v27;

  v27 = 2003329396;
  v11 = (void *)MEMORY[0x1B5E50CDC](self, a2);
  -[Core_Audio_Driver_Host connection_to_driver](self, "connection_to_driver");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = MEMORY[0x1E0C809B0];
  v26[0] = MEMORY[0x1E0C809B0];
  v26[1] = 3321888768;
  v26[2] = __93__Core_Audio_Driver_Host_get_property_data_size_qualifier_data_size_qualifier_data_out_size___block_invoke;
  v26[3] = &__block_descriptor_40_ea8_32c107_ZTSKZ93__Core_Audio_Driver_Host_get_property_data_size_qualifier_data_size_qualifier_data_out_size__E4__38_e17_v16__0__NSError_8l;
  v26[4] = &v27;
  objc_msgSend(v12, "synchronousRemoteObjectProxyWithErrorHandler:", v26);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  if (v14)
  {
    -[Core_Audio_Driver_Host m_property_type_info](self, "m_property_type_info");
    property_qualifier_type_code = Property_Type_Info::get_property_qualifier_type_code(v24, a3->var0, (AMCP::HAL *)a3->var2.mSelector);
    if (v25)
    {
      p_shared_owners = &v25->__shared_owners_;
      do
        v17 = __ldaxr((unint64_t *)p_shared_owners);
      while (__stlxr(v17 - 1, (unint64_t *)p_shared_owners));
      if (!v17)
      {
        ((void (*)(std::__shared_weak_count *))v25->__on_zero_shared)(v25);
        std::__shared_weak_count::__release_weak(v25);
      }
    }
    if (a5)
    {
      if (((qword_1B5D53210[property_qualifier_type_code] | qword_1B5D53178[property_qualifier_type_code]) & 0xFF00000000) != 0)
        v18 = LODWORD(qword_1B5D53210[property_qualifier_type_code]) | LODWORD(qword_1B5D53178[property_qualifier_type_code]);
      else
        v18 = a4;
      AMCP::HAL::pack_property_data(property_qualifier_type_code, v18, (CFStringRef *)a5);
      a5 = (const void *)objc_claimAutoreleasedReturnValue();
    }
    v22 = *(_OWORD *)&a3->var0;
    mElement = a3->var2.mElement;
    v21[0] = v13;
    v21[1] = 3321888768;
    v21[2] = __93__Core_Audio_Driver_Host_get_property_data_size_qualifier_data_size_qualifier_data_out_size___block_invoke_115;
    v21[3] = &__block_descriptor_48_ea8_32c107_ZTSKZ93__Core_Audio_Driver_Host_get_property_data_size_qualifier_data_size_qualifier_data_out_size__E4__39_e11_v16__0i8I12l;
    v21[4] = &v27;
    v21[5] = (char *)&v27 + 4;
    objc_msgSend(v14, "get_property_data_size:qualifier:reply:", &v22, a5, v21);

    v19 = HIDWORD(v27);
  }
  else
  {
    v19 = 0;
  }
  *a6 = v19;

  objc_autoreleasePoolPop(v11);
  return v27;
}

- (int)get_property_data:(Driver_Property_Identity *)a3 qualifier_data_size:(unsigned int)a4 qualifier_data:(const void *)a5 data_size:(unsigned int)a6 out_data_size:(unsigned int *)a7 out_data:(void *)a8
{
  void *v14;
  void *v15;
  void *v16;
  unint64_t property_data_and_qualifier_type_code;
  std::__shared_weak_count *v18;
  unint64_t *p_shared_owners;
  unint64_t v20;
  unsigned int v21;
  uint64_t v22;
  uint64_t v23;
  id v24;
  unsigned int v25;
  std::__shared_weak_count *v26;
  unint64_t *v27;
  unint64_t v28;
  _QWORD v31[6];
  __int128 v32;
  AudioObjectPropertyElement mElement;
  id v34;
  _QWORD v35[5];
  int v36;
  Property_Type_Info *v37;
  std::__shared_weak_count *v38;
  uint64_t v39;

  v39 = *MEMORY[0x1E0C80C00];
  v36 = 2003329396;
  v14 = (void *)MEMORY[0x1B5E50CDC](self, a2);
  -[Core_Audio_Driver_Host connection_to_driver](self, "connection_to_driver");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v35[0] = MEMORY[0x1E0C809B0];
  v35[1] = 3321888768;
  v35[2] = __112__Core_Audio_Driver_Host_get_property_data_qualifier_data_size_qualifier_data_data_size_out_data_size_out_data___block_invoke;
  v35[3] = &__block_descriptor_40_ea8_32c127_ZTSKZ112__Core_Audio_Driver_Host_get_property_data_qualifier_data_size_qualifier_data_data_size_out_data_size_out_data__E4__40_e17_v16__0__NSError_8l;
  v35[4] = &v36;
  objc_msgSend(v15, "synchronousRemoteObjectProxyWithErrorHandler:", v35);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  if (v16)
  {
    -[Core_Audio_Driver_Host m_property_type_info](self, "m_property_type_info");
    property_data_and_qualifier_type_code = Property_Type_Info::get_property_data_and_qualifier_type_code(v37, a3->var0, (AMCP::HAL *)a3->var2.mSelector);
    v18 = v38;
    if (v38)
    {
      p_shared_owners = (unint64_t *)&v38->__shared_owners_;
      do
        v20 = __ldaxr(p_shared_owners);
      while (__stlxr(v20 - 1, p_shared_owners));
      if (!v20)
      {
        ((void (*)(std::__shared_weak_count *))v18->__on_zero_shared)(v18);
        std::__shared_weak_count::__release_weak(v18);
      }
    }
    if (a5)
    {
      if (((qword_1B5D53210[HIDWORD(property_data_and_qualifier_type_code)] | qword_1B5D53178[HIDWORD(property_data_and_qualifier_type_code)]) & 0xFF00000000) != 0)
        v21 = LODWORD(qword_1B5D53210[HIDWORD(property_data_and_qualifier_type_code)]) | LODWORD(qword_1B5D53178[HIDWORD(property_data_and_qualifier_type_code)]);
      else
        v21 = a4;
      AMCP::HAL::pack_property_data(SHIDWORD(property_data_and_qualifier_type_code), v21, (CFStringRef *)a5);
      a5 = (const void *)objc_claimAutoreleasedReturnValue();
    }
    if (property_data_and_qualifier_type_code > 0x12)
      v22 = 0x100000004;
    else
      v22 = qword_1B5D53210[property_data_and_qualifier_type_code] | qword_1B5D53178[property_data_and_qualifier_type_code];
    v34 = 0;
    if ((v22 & 0xFF00000000) != 0)
      v23 = v22;
    else
      v23 = a6;
    v32 = *(_OWORD *)&a3->var0;
    mElement = a3->var2.mElement;
    v31[0] = MEMORY[0x1E0C809B0];
    v31[1] = 3321888768;
    v31[2] = __112__Core_Audio_Driver_Host_get_property_data_qualifier_data_size_qualifier_data_data_size_out_data_size_out_data___block_invoke_118;
    v31[3] = &__block_descriptor_48_ea8_32c127_ZTSKZ112__Core_Audio_Driver_Host_get_property_data_qualifier_data_size_qualifier_data_data_size_out_data_size_out_data__E4__41_e19_v20__0i8__NSData_12l;
    v31[4] = &v36;
    v31[5] = &v34;
    objc_msgSend(v16, "get_property_data:qualifier:data_size:reply:", &v32, a5, v23, v31);
    if (!v36)
    {
      v24 = v34;
      if (v34)
      {
        *a7 = a6;
        v36 = AMCP::HAL::unpack_property_data(v24, property_data_and_qualifier_type_code, a7, a8);
        if (a3->var2.mSelector == 1668641652)
        {
          v25 = *a7;
          -[Core_Audio_Driver_Host m_property_type_info](self, "m_property_type_info");
          Property_Type_Info::add_custom_properties(v37, a3->var0, v25 / 0xCuLL, (const AudioServerPlugInCustomPropertyInfo *)a8);
          v26 = v38;
          if (v38)
          {
            v27 = (unint64_t *)&v38->__shared_owners_;
            do
              v28 = __ldaxr(v27);
            while (__stlxr(v28 - 1, v27));
            if (!v28)
            {
              ((void (*)(std::__shared_weak_count *))v26->__on_zero_shared)(v26);
              std::__shared_weak_count::__release_weak(v26);
            }
          }
        }
      }
    }

  }
  objc_autoreleasePoolPop(v14);
  return v36;
}

- (int)set_property_data:(Driver_Property_Identity *)a3 qualifier_data_size:(unsigned int)a4 qualifier_data:(const void *)a5 data_size:(unsigned int)a6 data:(const void *)a7
{
  void *v13;
  void *v14;
  void *v15;
  unint64_t property_data_and_qualifier_type_code;
  uint64_t *p_shared_owners;
  unint64_t v18;
  unsigned int v19;
  uint64_t v20;
  unsigned int v21;
  void *v22;
  _QWORD v24[5];
  __int128 v25;
  AudioObjectPropertyElement mElement;
  Property_Type_Info *v27;
  std::__shared_weak_count *v28;
  _QWORD v29[5];
  _DWORD v30[3];

  v30[0] = 2003329396;
  v13 = (void *)MEMORY[0x1B5E50CDC](self, a2);
  -[Core_Audio_Driver_Host connection_to_driver](self, "connection_to_driver");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v29[0] = MEMORY[0x1E0C809B0];
  v29[1] = 3321888768;
  v29[2] = __94__Core_Audio_Driver_Host_set_property_data_qualifier_data_size_qualifier_data_data_size_data___block_invoke;
  v29[3] = &__block_descriptor_40_ea8_32c108_ZTSKZ94__Core_Audio_Driver_Host_set_property_data_qualifier_data_size_qualifier_data_data_size_data__E4__42_e17_v16__0__NSError_8l;
  v29[4] = v30;
  objc_msgSend(v14, "synchronousRemoteObjectProxyWithErrorHandler:", v29);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  if (v15)
  {
    -[Core_Audio_Driver_Host m_property_type_info](self, "m_property_type_info");
    property_data_and_qualifier_type_code = Property_Type_Info::get_property_data_and_qualifier_type_code(v27, a3->var0, (AMCP::HAL *)a3->var2.mSelector);
    if (v28)
    {
      p_shared_owners = &v28->__shared_owners_;
      do
        v18 = __ldaxr((unint64_t *)p_shared_owners);
      while (__stlxr(v18 - 1, (unint64_t *)p_shared_owners));
      if (!v18)
      {
        ((void (*)(std::__shared_weak_count *))v28->__on_zero_shared)(v28);
        std::__shared_weak_count::__release_weak(v28);
      }
    }
    if (a5)
    {
      if (((qword_1B5D53210[HIDWORD(property_data_and_qualifier_type_code)] | qword_1B5D53178[HIDWORD(property_data_and_qualifier_type_code)]) & 0xFF00000000) != 0)
        v19 = LODWORD(qword_1B5D53210[HIDWORD(property_data_and_qualifier_type_code)]) | LODWORD(qword_1B5D53178[HIDWORD(property_data_and_qualifier_type_code)]);
      else
        v19 = a4;
      AMCP::HAL::pack_property_data(SHIDWORD(property_data_and_qualifier_type_code), v19, (CFStringRef *)a5);
      a5 = (const void *)objc_claimAutoreleasedReturnValue();
    }
    if (property_data_and_qualifier_type_code > 0x12)
      v20 = 0x100000004;
    else
      v20 = qword_1B5D53210[property_data_and_qualifier_type_code] | qword_1B5D53178[property_data_and_qualifier_type_code];
    if ((v20 & 0xFF00000000) != 0)
      v21 = v20;
    else
      v21 = a6;
    AMCP::HAL::pack_property_data(property_data_and_qualifier_type_code, v21, (CFStringRef *)a7);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v25 = *(_OWORD *)&a3->var0;
    mElement = a3->var2.mElement;
    v24[0] = MEMORY[0x1E0C809B0];
    v24[1] = 3321888768;
    v24[2] = __94__Core_Audio_Driver_Host_set_property_data_qualifier_data_size_qualifier_data_data_size_data___block_invoke_125;
    v24[3] = &__block_descriptor_40_ea8_32c108_ZTSKZ94__Core_Audio_Driver_Host_set_property_data_qualifier_data_size_qualifier_data_data_size_data__E4__43_e8_v12__0i8l;
    v24[4] = v30;
    objc_msgSend(v15, "set_property_data:qualifier:data:reply:", &v25, a5, v22, v24);

  }
  objc_autoreleasePoolPop(v13);
  return v30[0];
}

- (NSXPCConnection)connection_to_driver
{
  return self->_connection_to_driver;
}

- (void)setConnection_to_driver:(id)a3
{
  objc_storeStrong((id *)&self->_connection_to_driver, a3);
}

- (NSXPCConnection)connection_from_driver
{
  return self->_connection_from_driver;
}

- (void)setConnection_from_driver:(id)a3
{
  objc_storeStrong((id *)&self->_connection_from_driver, a3);
}

- (NSXPCListener)listener
{
  return self->_listener;
}

- (void)setListener:(id)a3
{
  objc_storeStrong((id *)&self->_listener, a3);
}

- (NSXPCListenerEndpoint)endpoint
{
  return self->_endpoint;
}

- (void)setEndpoint:(id)a3
{
  objc_storeStrong((id *)&self->_endpoint, a3);
}

- (Core_Audio_Driver_Host_Callback_Delegate)delegate
{
  return self->_delegate;
}

- (void)setDelegate:(id)a3
{
  objc_storeStrong((id *)&self->_delegate, a3);
}

- (unint64_t)current_config_change_token
{
  return self->_current_config_change_token;
}

- (void)setCurrent_config_change_token:(unint64_t)a3
{
  self->_current_config_change_token = a3;
}

- (Protocol)driver_protocol
{
  return self->_driver_protocol;
}

- (void)setDriver_protocol:(id)a3
{
  objc_storeStrong((id *)&self->_driver_protocol, a3);
}

- (Protocol)driver_host_protocol
{
  return self->_driver_host_protocol;
}

- (void)setDriver_host_protocol:(id)a3
{
  objc_storeStrong((id *)&self->_driver_host_protocol, a3);
}

- (shared_ptr<Property_Type_Info>)m_property_type_info
{
  Property_Type_Info **v2;
  __shared_weak_count *cntrl;
  unint64_t *v4;
  unint64_t v5;
  shared_ptr<Property_Type_Info> result;

  cntrl = self->_m_custom_property_type_cache.__cntrl_;
  *v2 = self->_m_custom_property_type_cache.__ptr_;
  v2[1] = (Property_Type_Info *)cntrl;
  if (cntrl)
  {
    v4 = (unint64_t *)((char *)cntrl + 8);
    do
      v5 = __ldxr(v4);
    while (__stxr(v5 + 1, v4));
  }
  result.__cntrl_ = (__shared_weak_count *)a2;
  result.__ptr_ = (Property_Type_Info *)self;
  return result;
}

- (void)setM_property_type_info:(shared_ptr<Property_Type_Info>)a3
{
  std::shared_ptr<HALS_UCRemotePlugIn>::operator=[abi:ne180100](&self->_m_custom_property_type_cache.__ptr_, *(_QWORD *)a3.__ptr_, *((_QWORD *)a3.__ptr_ + 1));
}

- (function<void)m_invalidation_handler
{
  return (function<void ()> *)std::__function::__value_func<void ()(void)>::__value_func[abi:ne180100]((uint64_t)retstr, (uint64_t)&self->_m_invalidation_handler);
}

- (void)setM_invalidation_handler:(function<void)(
{
  std::function<void ()(void)>::operator=(self->_m_invalidation_handler.__f_.__buf_.__lx, (uint64_t)a3);
}

- (NSXPCListenerEndpoint)driver_endpoint
{
  return self->_driver_endpoint;
}

- (void)setDriver_endpoint:(id)a3
{
  objc_storeStrong((id *)&self->_driver_endpoint, a3);
}

- (shared_ptr<caulk::mach::unfair_lock>)config_change_lock
{
  unfair_lock **v2;
  __shared_weak_count *cntrl;
  unint64_t *v4;
  unint64_t v5;
  shared_ptr<caulk::mach::unfair_lock> result;

  cntrl = self->_config_change_lock.__cntrl_;
  *v2 = self->_config_change_lock.__ptr_;
  v2[1] = (unfair_lock *)cntrl;
  if (cntrl)
  {
    v4 = (unint64_t *)((char *)cntrl + 8);
    do
      v5 = __ldxr(v4);
    while (__stxr(v5 + 1, v4));
  }
  result.__cntrl_ = (__shared_weak_count *)a2;
  result.__ptr_ = (unfair_lock *)self;
  return result;
}

- (void).cxx_destruct
{
  function<void ()> *p_m_invalidation_handler;
  function<void ()> *f;
  uint64_t v5;

  p_m_invalidation_handler = &self->_m_invalidation_handler;
  f = (function<void ()> *)self->_m_invalidation_handler.__f_.__f_;
  if (f == p_m_invalidation_handler)
  {
    v5 = 4;
    f = p_m_invalidation_handler;
    goto LABEL_5;
  }
  if (f)
  {
    v5 = 5;
LABEL_5:
    (*(void (**)(void))(*(_QWORD *)f->__f_.__buf_.__lx + 8 * v5))();
  }
  std::shared_ptr<AMCP::Log::Scope>::~shared_ptr[abi:ne180100]((uint64_t)&self->_config_change_lock);
  std::shared_ptr<AMCP::Log::Scope>::~shared_ptr[abi:ne180100]((uint64_t)&self->_m_custom_property_type_cache);
  objc_storeStrong((id *)&self->_driver_endpoint, 0);
  objc_storeStrong((id *)&self->_driver_host_protocol, 0);
  objc_storeStrong((id *)&self->_driver_protocol, 0);
  objc_storeStrong((id *)&self->_delegate, 0);
  objc_storeStrong((id *)&self->_endpoint, 0);
  objc_storeStrong((id *)&self->_listener, 0);
  objc_storeStrong((id *)&self->_connection_from_driver, 0);
  objc_storeStrong((id *)&self->_connection_to_driver, 0);
}

- (id).cxx_construct
{
  *((_QWORD *)self + 17) = 0;
  *((_OWORD *)self + 5) = 0u;
  *((_OWORD *)self + 6) = 0u;
  return self;
}

@end
