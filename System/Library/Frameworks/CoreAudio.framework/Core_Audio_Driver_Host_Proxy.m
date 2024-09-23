@implementation Core_Audio_Driver_Host_Proxy

- (Core_Audio_Driver_Host_Proxy)init
{
  Core_Audio_Driver_Host_Proxy *v2;
  Core_Audio_Driver_Host_Proxy *v3;
  NSXPCConnection *connection_to_host;
  _QWORD *v5;
  Core_Audio_Driver_Host_Proxy *v6;
  std::__shared_weak_count *v7;
  unint64_t *v8;
  unint64_t v9;
  Core_Audio_Driver *driver;
  __int128 v12;
  objc_super v13;

  v13.receiver = self;
  v13.super_class = (Class)Core_Audio_Driver_Host_Proxy;
  v2 = -[Core_Audio_Driver_Host_Proxy init](&v13, sel_init);
  v3 = v2;
  if (v2)
  {
    connection_to_host = v2->_connection_to_host;
    v2->_connection_to_host = 0;

    v5 = operator new(0x48uLL);
    v5[1] = 0;
    v5[2] = 0;
    *v5 = &off_1E6970110;
    v6 = v3;
    v5[3] = Host_Interface::properties_changed;
    v5[4] = Host_Interface::copy_from_storage;
    v5[5] = Host_Interface::write_to_storage;
    v5[7] = Host_Interface::request_device_configuration_change;
    v5[8] = v6;
    v5[6] = Host_Interface::delete_from_storage;
    *(_QWORD *)&v12 = v5 + 3;
    *((_QWORD *)&v12 + 1) = v5;
    std::shared_ptr<AMCP::Log::Scope>::operator=[abi:ne180100]((uint64_t)&v6->_host_interface, &v12);
    v7 = (std::__shared_weak_count *)*((_QWORD *)&v12 + 1);
    if (*((_QWORD *)&v12 + 1))
    {
      v8 = (unint64_t *)(*((_QWORD *)&v12 + 1) + 8);
      do
        v9 = __ldaxr(v8);
      while (__stlxr(v9 - 1, v8));
      if (!v9)
      {
        ((void (*)(std::__shared_weak_count *))v7->__on_zero_shared)(v7);
        std::__shared_weak_count::__release_weak(v7);
      }
    }
    driver = v6->_driver;
    v6->_driver = 0;

  }
  return v3;
}

- (id)init_with_host_endpoint:(id)a3 driver:(id)a4
{
  id v6;
  id v7;
  Core_Audio_Driver_Host_Proxy *v8;
  uint64_t v9;
  NSXPCConnection *connection_to_host;
  void *v11;
  _QWORD *v12;
  Core_Audio_Driver_Host_Proxy *v13;
  std::__shared_weak_count *v14;
  unint64_t *v15;
  unint64_t v16;
  __int128 v18;
  objc_super v19;

  v6 = a3;
  v7 = a4;
  v19.receiver = self;
  v19.super_class = (Class)Core_Audio_Driver_Host_Proxy;
  v8 = -[Core_Audio_Driver_Host_Proxy init](&v19, sel_init);
  if (v8)
  {
    v9 = objc_msgSend(objc_alloc(MEMORY[0x1E0CB3B38]), "initWithListenerEndpoint:", v6);
    connection_to_host = v8->_connection_to_host;
    v8->_connection_to_host = (NSXPCConnection *)v9;

    objc_msgSend(MEMORY[0x1E0CB3B50], "interfaceWithProtocol:", &unk_1EF1337C0);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSXPCConnection setRemoteObjectInterface:](v8->_connection_to_host, "setRemoteObjectInterface:", v11);

    -[NSXPCConnection resume](v8->_connection_to_host, "resume");
    v12 = operator new(0x48uLL);
    v12[1] = 0;
    v12[2] = 0;
    *v12 = &off_1E6970110;
    v13 = v8;
    v12[3] = Host_Interface::properties_changed;
    v12[4] = Host_Interface::copy_from_storage;
    v12[5] = Host_Interface::write_to_storage;
    v12[7] = Host_Interface::request_device_configuration_change;
    v12[8] = v13;
    v12[6] = Host_Interface::delete_from_storage;
    *(_QWORD *)&v18 = v12 + 3;
    *((_QWORD *)&v18 + 1) = v12;
    std::shared_ptr<AMCP::Log::Scope>::operator=[abi:ne180100]((uint64_t)&v13->_host_interface, &v18);
    v14 = (std::__shared_weak_count *)*((_QWORD *)&v18 + 1);
    if (*((_QWORD *)&v18 + 1))
    {
      v15 = (unint64_t *)(*((_QWORD *)&v18 + 1) + 8);
      do
        v16 = __ldaxr(v15);
      while (__stlxr(v16 - 1, v15));
      if (!v16)
      {
        ((void (*)(std::__shared_weak_count *))v14->__on_zero_shared)(v14);
        std::__shared_weak_count::__release_weak(v14);
      }
    }
    objc_storeStrong((id *)&v13->_driver, a4);
  }

  return v8;
}

- (AudioServerPlugInHostInterface)get_host_interface
{
  unint64_t *p_shared_owners;
  unint64_t v3;
  AudioServerPlugInHostInterface *v5;
  std::__shared_weak_count *v6;

  -[Core_Audio_Driver_Host_Proxy host_interface](self, "host_interface");
  if (v6)
  {
    p_shared_owners = (unint64_t *)&v6->__shared_owners_;
    do
      v3 = __ldaxr(p_shared_owners);
    while (__stlxr(v3 - 1, p_shared_owners));
    if (!v3)
    {
      ((void (*)())v6->__on_zero_shared)();
      std::__shared_weak_count::__release_weak(v6);
    }
  }
  return v5;
}

- (int)driver_properties_changed:(unsigned int)a3 properties_data:(id)a4
{
  uint64_t v4;
  id v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  int v11;
  _QWORD v13[5];
  _QWORD v14[6];
  int v15;
  char v16;

  v4 = *(_QWORD *)&a3;
  v6 = a4;
  v16 = 0;
  v15 = 2003329396;
  -[Core_Audio_Driver_Host_Proxy connection_to_host](self, "connection_to_host");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = MEMORY[0x1E0C809B0];
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3321888768;
  v14[2] = __74__Core_Audio_Driver_Host_Proxy_driver_properties_changed_properties_data___block_invoke;
  v14[3] = &__block_descriptor_48_ea8_32c87_ZTSKZ74__Core_Audio_Driver_Host_Proxy_driver_properties_changed_properties_data__E3__4_e17_v16__0__NSError_8l;
  v14[4] = &v15;
  v14[5] = &v16;
  objc_msgSend(v7, "synchronousRemoteObjectProxyWithErrorHandler:", v14);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v13[0] = v8;
  v13[1] = 3321888768;
  v13[2] = __74__Core_Audio_Driver_Host_Proxy_driver_properties_changed_properties_data___block_invoke_16;
  v13[3] = &__block_descriptor_40_ea8_32c87_ZTSKZ74__Core_Audio_Driver_Host_Proxy_driver_properties_changed_properties_data__E3__5_e8_v12__0i8l;
  v13[4] = &v15;
  objc_msgSend(v9, "object_properties_changed:properties_data:reply:", v4, v6, v13);
  if (v16)
  {
    -[Core_Audio_Driver_Host_Proxy connection_to_host](self, "connection_to_host");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "invalidate");

  }
  v11 = v15;

  return v11;
}

- (PropertyListRef)copy_from_driver_storage:(StringRef)a3
{
  mcp_applesauce::CF::PropertyListRef *v3;
  mcp_applesauce::CF::PropertyListRef *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *isa;
  id v10;
  PropertyListRef v11;
  CFTypeRef cf;
  unsigned int v13;
  _QWORD v14[6];
  id v15;
  _QWORD v16[5];
  int v17;

  v5 = v3;
  v17 = 0;
  -[Core_Audio_Driver_Host_Proxy connection_to_host](self, "connection_to_host");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = MEMORY[0x1E0C809B0];
  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3321888768;
  v16[2] = __57__Core_Audio_Driver_Host_Proxy_copy_from_driver_storage___block_invoke;
  v16[3] = &__block_descriptor_40_ea8_32c70_ZTSKZ57__Core_Audio_Driver_Host_Proxy_copy_from_driver_storage__E3__6_e17_v16__0__NSError_8l;
  v16[4] = &v17;
  objc_msgSend(v6, "synchronousRemoteObjectProxyWithErrorHandler:", v16);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  isa = a3.var0.var0->isa;
  v14[0] = v7;
  v14[1] = 3321888768;
  v14[2] = __57__Core_Audio_Driver_Host_Proxy_copy_from_driver_storage___block_invoke_20;
  v14[3] = &__block_descriptor_48_ea8_32c70_ZTSKZ57__Core_Audio_Driver_Host_Proxy_copy_from_driver_storage__E3__7_e19_v20__0i8__NSData_12l;
  v14[4] = &v17;
  v14[5] = &v15;
  v15 = 0;
  objc_msgSend(v8, "copy_storage_settings:reply:", isa, v14);
  v10 = v15;
  if (v17 || !v15)
  {
    *(_QWORD *)v5 = 0;
  }
  else
  {
    v13 = 8;
    cf = 0;
    v17 = AMCP::HAL::unpack_property_data(v15, 15, &v13, &cf);
    if (v17 || !cf)
    {
      *(_QWORD *)v5 = 0;
    }
    else
    {
      mcp_applesauce::CF::PropertyListRef::from_get(v5, cf);
      CFRelease(cf);
    }
    v10 = v15;
  }

  return v11;
}

- (int)write_to_driver_storage:(StringRef)a3 property_list:(PropertyListRef)a4
{
  void *v6;
  uint64_t v7;
  void *v8;
  int v9;
  void *v10;
  void *isa;
  _QWORD v13[5];
  CFStringRef v14;
  _QWORD v15[5];
  int v16;

  v16 = 0;
  -[Core_Audio_Driver_Host_Proxy connection_to_host](self, "connection_to_host");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = MEMORY[0x1E0C809B0];
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3321888768;
  v15[2] = __70__Core_Audio_Driver_Host_Proxy_write_to_driver_storage_property_list___block_invoke;
  v15[3] = &__block_descriptor_40_ea8_32c83_ZTSKZ70__Core_Audio_Driver_Host_Proxy_write_to_driver_storage_property_list__E3__8_e17_v16__0__NSError_8l;
  v15[4] = &v16;
  objc_msgSend(v6, "synchronousRemoteObjectProxyWithErrorHandler:", v15);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = 560947818;

  v14 = *(CFStringRef *)a4.var0.var0;
  if (v14)
  {
    AMCP::HAL::pack_property_data(15, 8u, &v14);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if (v10)
    {
      isa = a3.var0.var0->isa;
      v13[0] = v7;
      v13[1] = 3321888768;
      v13[2] = __70__Core_Audio_Driver_Host_Proxy_write_to_driver_storage_property_list___block_invoke_24;
      v13[3] = &__block_descriptor_40_ea8_32c83_ZTSKZ70__Core_Audio_Driver_Host_Proxy_write_to_driver_storage_property_list__E3__9_e8_v12__0i8l;
      v13[4] = &v16;
      objc_msgSend(v8, "write_storage_settings:storage_data:reply:", isa, v10, v13);
      v9 = v16;
    }

  }
  return v9;
}

- (int)delete_from_driver_storage:(StringRef)a3
{
  void *v4;
  uint64_t v5;
  void *v6;
  void *isa;
  _QWORD v9[5];
  _QWORD v10[5];
  int v11;

  v11 = 0;
  -[Core_Audio_Driver_Host_Proxy connection_to_host](self, "connection_to_host");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = MEMORY[0x1E0C809B0];
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3321888768;
  v10[2] = __59__Core_Audio_Driver_Host_Proxy_delete_from_driver_storage___block_invoke;
  v10[3] = &__block_descriptor_40_ea8_32c73_ZTSKZ59__Core_Audio_Driver_Host_Proxy_delete_from_driver_storage__E4__10_e17_v16__0__NSError_8l;
  v10[4] = &v11;
  objc_msgSend(v4, "synchronousRemoteObjectProxyWithErrorHandler:", v10);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  isa = a3.var0.var0->isa;
  v9[0] = v5;
  v9[1] = 3321888768;
  v9[2] = __59__Core_Audio_Driver_Host_Proxy_delete_from_driver_storage___block_invoke_27;
  v9[3] = &__block_descriptor_40_ea8_32c73_ZTSKZ59__Core_Audio_Driver_Host_Proxy_delete_from_driver_storage__E4__11_e8_v12__0i8l;
  v9[4] = &v11;
  objc_msgSend(v6, "delete_storage_settings:reply:", isa, v9);
  LODWORD(v4) = v11;

  return (int)v4;
}

- (int)driver_request_config_change:(unsigned int)a3 change_action:(unint64_t)a4 change_info:(void *)a5
{
  uint64_t v7;
  void *v9;
  AMCP::Log::Scope_Registry *v10;
  NSObject *v11;
  std::__shared_weak_count *v12;
  unint64_t *v13;
  unint64_t v14;
  void *v15;
  BOOL v16;
  void *v17;
  uint64_t v18;
  void *v19;
  void *v20;
  void *v21;
  _opaque_pthread_t *v23;
  mach_port_t v24;
  unint64_t v25;
  char *v26;
  int v27;
  char *v28;
  const char *v30;
  _QWORD v31[6];
  _QWORD v32[6];
  uint64_t v33;
  int v34;
  uint8_t buf[8];
  _BYTE v36[10];
  __int16 v37;
  int v38;
  uint64_t v39;

  v7 = *(_QWORD *)&a3;
  v39 = *MEMORY[0x1E0C80C00];
  v34 = 2003329396;
  v33 = 0;
  -[Core_Audio_Driver_Host_Proxy connection_to_host](self, "connection_to_host");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v9)
  {
    AMCP::Log::Scope_Registry::get(v10);
    AMCP::Log::Scope_Registry::fetch((AMCP::Log::Scope_Registry *)buf, "com.apple.coreaudio", "AMCP");
    v11 = **(NSObject ***)buf;
    AMCP::Log::Scope::get_os_log_t(**(id **)buf);
    objc_claimAutoreleasedReturnValue();
    v12 = *(std::__shared_weak_count **)v36;
    if (*(_QWORD *)v36)
    {
      v13 = (unint64_t *)(*(_QWORD *)v36 + 8);
      do
        v14 = __ldaxr(v13);
      while (__stlxr(v14 - 1, v13));
      if (!v14)
      {
        ((void (*)(std::__shared_weak_count *))v12->__on_zero_shared)(v12);
        std::__shared_weak_count::__release_weak(v12);
      }
    }
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      v23 = pthread_self();
      v24 = pthread_mach_thread_np(v23);
      v25 = 0;
      v26 = 0;
      v27 = 47;
      do
      {
        v28 = &aLibraryCachesC_22[v25];
        if (v27 == 47)
          v26 = &aLibraryCachesC_22[v25];
        v27 = v28[1];
        if (!v28[1])
          break;
      }
      while (v25++ < 0xFFF);
      if (v26)
        v30 = v26 + 1;
      else
        v30 = "/Library/Caches/com.apple.xbs/Sources/AudioHAL/Source/AMCP/ASP/Portal/Driver/Core_Audio_Driver_Host_Proxy.mm";
      *(_DWORD *)buf = 67109634;
      *(_DWORD *)&buf[4] = v24;
      *(_WORD *)v36 = 2080;
      *(_QWORD *)&v36[2] = v30;
      v37 = 1024;
      v38 = 232;
      _os_log_error_impl(&dword_1B57BA000, v11, OS_LOG_TYPE_ERROR, "%6u %32s:%-5d No connection to host", buf, 0x18u);
    }

  }
  buf[0] = 0;
  -[Core_Audio_Driver_Host_Proxy connection_to_host](self, "connection_to_host");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = v15 == 0;

  if (!v16)
  {
    -[Core_Audio_Driver_Host_Proxy connection_to_host](self, "connection_to_host");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = MEMORY[0x1E0C809B0];
    v32[0] = MEMORY[0x1E0C809B0];
    v32[1] = 3321888768;
    v32[2] = __87__Core_Audio_Driver_Host_Proxy_driver_request_config_change_change_action_change_info___block_invoke;
    v32[3] = &__block_descriptor_48_ea8_32c101_ZTSKZ87__Core_Audio_Driver_Host_Proxy_driver_request_config_change_change_action_change_info__E4__12_e17_v16__0__NSError_8l;
    v32[4] = &v34;
    v32[5] = buf;
    objc_msgSend(v17, "synchronousRemoteObjectProxyWithErrorHandler:", v32);
    v19 = (void *)objc_claimAutoreleasedReturnValue();

    v31[0] = v18;
    v31[1] = 3321888768;
    v31[2] = __87__Core_Audio_Driver_Host_Proxy_driver_request_config_change_change_action_change_info___block_invoke_33;
    v31[3] = &__block_descriptor_48_ea8_32c101_ZTSKZ87__Core_Audio_Driver_Host_Proxy_driver_request_config_change_change_action_change_info__E4__13_e11_v20__0i8Q12l;
    v31[4] = &v34;
    v31[5] = &v33;
    objc_msgSend(v19, "request_config_change:change_action:reply:", v7, a4, v31);
    -[Core_Audio_Driver_Host_Proxy driver](self, "driver");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "store_change_info:for_token:", a5, v33);

    if (buf[0])
    {
      -[Core_Audio_Driver_Host_Proxy connection_to_host](self, "connection_to_host");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "invalidate");

    }
  }
  return v34;
}

- (NSXPCConnection)connection_to_host
{
  return self->_connection_to_host;
}

- (void)setConnection_to_host:(id)a3
{
  objc_storeStrong((id *)&self->_connection_to_host, a3);
}

- (shared_ptr<Host_Interface>)host_interface
{
  Host_Interface **v2;
  __shared_weak_count *cntrl;
  unint64_t *v4;
  unint64_t v5;
  shared_ptr<Host_Interface> result;

  cntrl = self->_host_interface.__cntrl_;
  *v2 = self->_host_interface.__ptr_;
  v2[1] = (Host_Interface *)cntrl;
  if (cntrl)
  {
    v4 = (unint64_t *)((char *)cntrl + 8);
    do
      v5 = __ldxr(v4);
    while (__stxr(v5 + 1, v4));
  }
  result.__cntrl_ = (__shared_weak_count *)a2;
  result.__ptr_ = (Host_Interface *)self;
  return result;
}

- (shared_ptr<caulk::mach::unfair_lock>)driver_storage_lock
{
  unfair_lock **v2;
  __shared_weak_count *cntrl;
  unint64_t *v4;
  unint64_t v5;
  shared_ptr<caulk::mach::unfair_lock> result;

  cntrl = self->_driver_storage_lock.__cntrl_;
  *v2 = self->_driver_storage_lock.__ptr_;
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

- (DictionaryRef)driver_storage
{
  __CFDictionary **v2;
  __CFDictionary **v3;
  __CFDictionary *mCFObject;

  v3 = v2;
  mCFObject = self->_driver_storage.mObject.mCFObject;
  if (mCFObject)
    self = (Core_Audio_Driver_Host_Proxy *)CFRetain(self->_driver_storage.mObject.mCFObject);
  *v3 = mCFObject;
  return (DictionaryRef)self;
}

- (void)setDriver_storage:(DictionaryRef)a3
{
  __CFDictionary *mCFObject;
  const void *v5;

  mCFObject = self->_driver_storage.mObject.mCFObject;
  v5 = *(const void **)a3.mObject.mCFObject;
  self->_driver_storage.mObject.mCFObject = *(__CFDictionary **)a3.mObject.mCFObject;
  if (v5)
    CFRetain(v5);
  if (mCFObject)
    CFRelease(mCFObject);
}

- (Core_Audio_Driver)driver
{
  return self->_driver;
}

- (void)setDriver:(id)a3
{
  objc_storeStrong((id *)&self->_driver, a3);
}

- (void).cxx_destruct
{
  __shared_weak_count *cntrl;
  unint64_t *v4;
  unint64_t v5;
  __CFDictionary *mCFObject;

  std::shared_ptr<AMCP::Log::Scope>::~shared_ptr[abi:ne180100]((uint64_t)&self->_driver_storage_lock);
  cntrl = self->_host_interface.__cntrl_;
  if (cntrl)
  {
    v4 = (unint64_t *)((char *)cntrl + 8);
    do
      v5 = __ldaxr(v4);
    while (__stlxr(v5 - 1, v4));
    if (!v5)
    {
      (*(void (**)(__shared_weak_count *))(*(_QWORD *)cntrl + 16))(cntrl);
      std::__shared_weak_count::__release_weak((std::__shared_weak_count *)cntrl);
    }
  }
  objc_storeStrong((id *)&self->_driver, 0);
  mCFObject = self->_driver_storage.mObject.mCFObject;
  if (mCFObject)
    CFRelease(mCFObject);
  objc_storeStrong((id *)&self->_connection_to_host, 0);
}

- (id).cxx_construct
{
  *((_QWORD *)self + 2) = 0;
  *((_OWORD *)self + 2) = 0u;
  *((_OWORD *)self + 3) = 0u;
  return self;
}

@end
