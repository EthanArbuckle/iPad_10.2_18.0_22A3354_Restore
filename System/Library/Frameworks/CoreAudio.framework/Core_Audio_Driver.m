@implementation Core_Audio_Driver

- (Core_Audio_Driver)init
{
  Core_Audio_Driver *v2;
  Core_Audio_Driver *v3;
  NSXPCListener *listener;
  NSXPCListenerEndpoint *endpoint;
  Core_Audio_Driver_Host_Proxy *driver_host_proxy;
  _QWORD *v7;
  std::__shared_weak_count *v8;
  unint64_t *v9;
  unint64_t v10;
  _QWORD *v11;
  shared_ptr<std::map<unsigned long long, void *>> v12;
  std::__shared_weak_count *cntrl;
  unint64_t *p_shared_owners;
  unint64_t v15;
  char *v16;
  shared_ptr<std::unordered_map<AMCP::Portal::IPC::io_messenger_id_t, std::shared_ptr<AMCP::Portal::IPC::IO_Receiver>>> v17;
  std::__shared_weak_count *v18;
  unint64_t *v19;
  unint64_t v20;
  _QWORD *v21;
  shared_ptr<std::vector<std::pair<AMCP::Portal::IPC::shared_buffer_info_t, applesauce::xpc::dict>>> v22;
  std::__shared_weak_count *v23;
  unint64_t *v24;
  unint64_t v25;
  NSObject *v26;
  NSObject *v27;
  dispatch_queue_t v28;
  OS_dispatch_queue *concurrent_queue;
  char *v30;
  std::__shared_weak_count *v31;
  unint64_t *v32;
  unint64_t v33;
  _QWORD *v34;
  std::__shared_weak_count *v35;
  unint64_t *v36;
  unint64_t v37;
  function<void ()> *f;
  uint64_t v39;
  __int128 v41;
  objc_super v42;

  v42.receiver = self;
  v42.super_class = (Class)Core_Audio_Driver;
  v2 = -[Core_Audio_Driver init](&v42, sel_init);
  v3 = v2;
  if (v2)
  {
    listener = v2->_listener;
    v2->_listener = 0;

    endpoint = v3->_endpoint;
    v3->_endpoint = 0;

    driver_host_proxy = v3->_driver_host_proxy;
    v3->_driver_host_proxy = 0;

    v3->_asp_interface = 0;
    v3->_host_interface = 0;
    v7 = operator new(0x20uLL);
    v7[1] = 0;
    v7[2] = 0;
    *v7 = &off_1E6995888;
    *((_DWORD *)v7 + 6) = 0;
    *(_QWORD *)&v41 = v7 + 3;
    *((_QWORD *)&v41 + 1) = v7;
    std::shared_ptr<AMCP::Log::Scope>::operator=[abi:ne180100]((uint64_t)&v3->_config_change_info_lock, &v41);
    v8 = (std::__shared_weak_count *)*((_QWORD *)&v41 + 1);
    if (*((_QWORD *)&v41 + 1))
    {
      v9 = (unint64_t *)(*((_QWORD *)&v41 + 1) + 8);
      do
        v10 = __ldaxr(v9);
      while (__stlxr(v10 - 1, v9));
      if (!v10)
      {
        ((void (*)(std::__shared_weak_count *))v8->__on_zero_shared)(v8);
        std::__shared_weak_count::__release_weak(v8);
      }
    }
    v11 = operator new(0x30uLL);
    v11[1] = 0;
    v11[2] = 0;
    *v11 = &off_1E69958D8;
    v11[4] = 0;
    v11[3] = v11 + 4;
    v11[5] = 0;
    v12.__ptr_ = v11 + 3;
    v12.__cntrl_ = (__shared_weak_count *)v11;
    cntrl = (std::__shared_weak_count *)v3->_config_change_info_map.__cntrl_;
    v3->_config_change_info_map = v12;
    if (cntrl)
    {
      p_shared_owners = (unint64_t *)&cntrl->__shared_owners_;
      do
        v15 = __ldaxr(p_shared_owners);
      while (__stlxr(v15 - 1, p_shared_owners));
      if (!v15)
      {
        ((void (*)(std::__shared_weak_count *))cntrl->__on_zero_shared)(cntrl);
        std::__shared_weak_count::__release_weak(cntrl);
      }
    }
    v16 = (char *)operator new(0x40uLL);
    *((_QWORD *)v16 + 1) = 0;
    *((_QWORD *)v16 + 2) = 0;
    *(_QWORD *)v16 = &off_1E6995928;
    *(_OWORD *)(v16 + 40) = 0u;
    *(_OWORD *)(v16 + 24) = 0u;
    *((_DWORD *)v16 + 14) = 1065353216;
    v17.__ptr_ = v16 + 24;
    v17.__cntrl_ = (__shared_weak_count *)v16;
    v18 = (std::__shared_weak_count *)v3->_io_receivers.__cntrl_;
    v3->_io_receivers = v17;
    if (v18)
    {
      v19 = (unint64_t *)&v18->__shared_owners_;
      do
        v20 = __ldaxr(v19);
      while (__stlxr(v20 - 1, v19));
      if (!v20)
      {
        ((void (*)(std::__shared_weak_count *))v18->__on_zero_shared)(v18);
        std::__shared_weak_count::__release_weak(v18);
      }
    }
    v21 = operator new(0x30uLL);
    v21[1] = 0;
    v21[2] = 0;
    *v21 = &off_1E6995978;
    v21[3] = 0;
    v21[4] = 0;
    v21[5] = 0;
    v22.__ptr_ = v21 + 3;
    v22.__cntrl_ = (__shared_weak_count *)v21;
    v23 = (std::__shared_weak_count *)v3->_io_buffer_list.__cntrl_;
    v3->_io_buffer_list = v22;
    if (v23)
    {
      v24 = (unint64_t *)&v23->__shared_owners_;
      do
        v25 = __ldaxr(v24);
      while (__stlxr(v25 - 1, v24));
      if (!v25)
      {
        ((void (*)(std::__shared_weak_count *))v23->__on_zero_shared)(v23);
        std::__shared_weak_count::__release_weak(v23);
      }
    }
    dispatch_queue_attr_make_with_autorelease_frequency(MEMORY[0x1E0C80D50], DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v26 = objc_claimAutoreleasedReturnValue();
    dispatch_queue_attr_make_with_qos_class(v26, QOS_CLASS_DEFAULT, 0);
    v27 = objc_claimAutoreleasedReturnValue();

    v28 = dispatch_queue_create("Property_Listener_Gateway IO Queue", v27);
    concurrent_queue = v3->_concurrent_queue;
    v3->_concurrent_queue = (OS_dispatch_queue *)v28;

    v30 = (char *)operator new(0x70uLL);
    *((_QWORD *)v30 + 1) = 0;
    *((_QWORD *)v30 + 2) = 0;
    *(_QWORD *)v30 = &off_1E69959C8;
    *((_QWORD *)v30 + 4) = 0;
    *((_QWORD *)v30 + 5) = 0;
    *((_QWORD *)v30 + 3) = 0;
    *((_QWORD *)v30 + 6) = 850045863;
    *(_OWORD *)(v30 + 56) = 0u;
    *(_OWORD *)(v30 + 72) = 0u;
    *(_OWORD *)(v30 + 88) = 0u;
    *((_QWORD *)v30 + 13) = 0;
    *(_QWORD *)&v41 = v30 + 24;
    *((_QWORD *)&v41 + 1) = v30;
    std::shared_ptr<AMCP::Log::Scope>::operator=[abi:ne180100]((uint64_t)&v3->_m_custom_property_type_cache, &v41);
    v31 = (std::__shared_weak_count *)*((_QWORD *)&v41 + 1);
    if (*((_QWORD *)&v41 + 1))
    {
      v32 = (unint64_t *)(*((_QWORD *)&v41 + 1) + 8);
      do
        v33 = __ldaxr(v32);
      while (__stlxr(v33 - 1, v32));
      if (!v33)
      {
        ((void (*)(std::__shared_weak_count *))v31->__on_zero_shared)(v31);
        std::__shared_weak_count::__release_weak(v31);
      }
    }
    v34 = operator new(0x20uLL);
    v34[1] = 0;
    v34[2] = 0;
    *v34 = &off_1E6995888;
    *((_DWORD *)v34 + 6) = 0;
    *(_QWORD *)&v41 = v34 + 3;
    *((_QWORD *)&v41 + 1) = v34;
    std::shared_ptr<AMCP::Log::Scope>::operator=[abi:ne180100]((uint64_t)&v3->_io_receiver_lock, &v41);
    v35 = (std::__shared_weak_count *)*((_QWORD *)&v41 + 1);
    if (*((_QWORD *)&v41 + 1))
    {
      v36 = (unint64_t *)(*((_QWORD *)&v41 + 1) + 8);
      do
        v37 = __ldaxr(v36);
      while (__stlxr(v37 - 1, v36));
      if (!v37)
      {
        ((void (*)(std::__shared_weak_count *))v35->__on_zero_shared)(v35);
        std::__shared_weak_count::__release_weak(v35);
      }
    }
    f = (function<void ()> *)v3->_m_invalidation_handler.__f_.__f_;
    v3->_m_invalidation_handler.__f_.__f_ = 0;
    if (f == &v3->_m_invalidation_handler)
    {
      v39 = 4;
      f = &v3->_m_invalidation_handler;
    }
    else
    {
      if (!f)
      {
LABEL_37:

        return v3;
      }
      v39 = 5;
    }
    (*(void (**)(void))(*(_QWORD *)f->__f_.__buf_.__lx + 8 * v39))();
    goto LABEL_37;
  }
  return v3;
}

- (id)init_driver_interface:(AudioServerPlugInDriverInterface *)a3 invalidation_handler:(function<void)(
{
  Core_Audio_Driver *v6;
  uint64_t v7;
  NSXPCListener *listener;
  void *v9;
  uint64_t v10;
  NSXPCListenerEndpoint *endpoint;
  ULONG (__cdecl *AddRef)(void *);

  v6 = -[Core_Audio_Driver init](self, "init");
  if (v6)
  {
    objc_msgSend(MEMORY[0x1E0CB3B58], "anonymousListener");
    v7 = objc_claimAutoreleasedReturnValue();
    listener = v6->_listener;
    v6->_listener = (NSXPCListener *)v7;

    -[NSXPCListener setDelegate:](v6->_listener, "setDelegate:", v6);
    -[NSXPCListener resume](v6->_listener, "resume");
    -[Core_Audio_Driver listener](v6, "listener");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "endpoint");
    v10 = objc_claimAutoreleasedReturnValue();
    endpoint = v6->_endpoint;
    v6->_endpoint = (NSXPCListenerEndpoint *)v10;

    std::function<void ()(void)>::operator=(v6->_m_invalidation_handler.__f_.__buf_.__lx, (uint64_t)a4);
    v6->_asp_interface = a3;
    if (a3)
    {
      AddRef = (*a3)->AddRef;
      if (AddRef)
        ((void (*)(AudioServerPlugInDriverInterface **))AddRef)(a3);
    }
  }
  return v6;
}

- (void)dealloc
{
  AudioServerPlugInDriverInterface **asp_interface;
  void (*Release)(void);
  NSXPCListener *listener;
  NSXPCListener *v6;
  Core_Audio_Driver_Host_Proxy *driver_host_proxy;
  objc_super v8;

  asp_interface = self->_asp_interface;
  if (asp_interface)
  {
    Release = (void (*)(void))(*asp_interface)->Release;
    if (Release)
    {
      Release();
      self->_asp_interface = 0;
    }
  }
  listener = self->_listener;
  if (listener)
  {
    -[NSXPCListener invalidate](listener, "invalidate");
    v6 = self->_listener;
    self->_listener = 0;

  }
  driver_host_proxy = self->_driver_host_proxy;
  self->_driver_host_proxy = 0;

  v8.receiver = self;
  v8.super_class = (Class)Core_Audio_Driver;
  -[Core_Audio_Driver dealloc](&v8, sel_dealloc);
}

- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4
{
  id v5;
  void *v6;
  _QWORD v8[5];

  v5 = a4;
  objc_msgSend(MEMORY[0x1E0CB3B50], "interfaceWithProtocol:", &unk_1EF134980);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setExportedInterface:", v6);

  objc_msgSend(v5, "setExportedObject:", self);
  objc_msgSend(v5, "setInterruptionHandler:", &__block_literal_global_11355);
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __56__Core_Audio_Driver_listener_shouldAcceptNewConnection___block_invoke_2;
  v8[3] = &unk_1E69957F8;
  v8[4] = self;
  objc_msgSend(v5, "setInvalidationHandler:", v8);
  objc_msgSend(v5, "resume");

  return 1;
}

- (void)store_change_info:(void *)a3 for_token:(unint64_t)a4
{
  os_unfair_lock_s *v7;
  unint64_t *v8;
  unint64_t v9;
  AMCP::Log::Scope_Registry *v10;
  uint64_t **v11;
  uint64_t *v12;
  uint64_t **v13;
  uint64_t **v14;
  uint64_t *v15;
  unint64_t v16;
  BOOL v17;
  uint64_t **v18;
  uint64_t **v19;
  unint64_t v20;
  uint64_t *v21;
  uint64_t *v22;
  uint64_t *p_shared_owners;
  unint64_t v24;
  NSObject *v25;
  std::__shared_weak_count *v26;
  unint64_t *v27;
  unint64_t v28;
  _opaque_pthread_t *v29;
  mach_port_t v30;
  void *exception;
  __int128 v32;
  uint64_t v33;
  uint64_t (**v34)();
  __int128 v35;
  uint64_t v36;
  std::runtime_error v37;
  std::runtime_error v38;
  void *v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  int v43;
  char v44;
  uint64_t **v45;
  std::__shared_weak_count *v46;
  uint8_t buf[8];
  _BYTE v48[10];
  __int16 v49;
  int v50;
  const char *v51;
  const char *v52;
  int v53;
  uint64_t v54;

  v54 = *MEMORY[0x1E0C80C00];
  -[Core_Audio_Driver config_change_info_lock](self, "config_change_info_lock");
  v7 = *(os_unfair_lock_s **)buf;
  os_unfair_lock_lock(*(os_unfair_lock_t *)buf);
  if (*(_QWORD *)v48)
  {
    v8 = (unint64_t *)(*(_QWORD *)v48 + 8);
    do
      v9 = __ldaxr(v8);
    while (__stlxr(v9 - 1, v8));
    if (!v9)
    {
      (*(void (**)(_QWORD))(**(_QWORD **)v48 + 16))(*(_QWORD *)v48);
      std::__shared_weak_count::__release_weak(*(std::__shared_weak_count **)v48);
    }
  }
  v10 = (AMCP::Log::Scope_Registry *)-[Core_Audio_Driver config_change_info_map](self, "config_change_info_map");
  v11 = v45;
  v13 = v45 + 1;
  v12 = v45[1];
  if (v12)
  {
    v14 = v45 + 1;
    v15 = v45[1];
    do
    {
      v16 = v15[4];
      v17 = v16 >= a4;
      if (v16 >= a4)
        v18 = (uint64_t **)v15;
      else
        v18 = (uint64_t **)(v15 + 1);
      if (v17)
        v14 = (uint64_t **)v15;
      v15 = *v18;
    }
    while (*v18);
    if (v14 != v13 && (unint64_t)v14[4] <= a4)
    {
      AMCP::Log::Scope_Registry::get(v10);
      AMCP::Log::Scope_Registry::fetch((AMCP::Log::Scope_Registry *)buf, "com.apple.coreaudio", "AMCP");
      v25 = **(NSObject ***)buf;
      AMCP::Log::Scope::get_os_log_t(**(id **)buf);
      objc_claimAutoreleasedReturnValue();
      v26 = *(std::__shared_weak_count **)v48;
      if (*(_QWORD *)v48)
      {
        v27 = (unint64_t *)(*(_QWORD *)v48 + 8);
        do
          v28 = __ldaxr(v27);
        while (__stlxr(v28 - 1, v27));
        if (!v28)
        {
          ((void (*)(std::__shared_weak_count *))v26->__on_zero_shared)(v26);
          std::__shared_weak_count::__release_weak(v26);
        }
      }
      if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
      {
        v29 = pthread_self();
        v30 = pthread_mach_thread_np(v29);
        *(_DWORD *)buf = 67109634;
        *(_DWORD *)&buf[4] = v30;
        *(_WORD *)v48 = 2080;
        *(_QWORD *)&v48[2] = "Core_Audio_Driver.mm";
        v49 = 1024;
        v50 = 135;
        _os_log_error_impl(&dword_1B57BA000, v25, OS_LOG_TYPE_ERROR, "%6u %32s:%-5d Throwing Exception: change token/info item is already in the map", buf, 0x18u);
      }

      AMCP::Utility::With_Realtime_Disabled::With_Realtime_Disabled((AMCP::Utility::With_Realtime_Disabled *)&v44);
      exception = __cxa_allocate_exception(0x40uLL);
      std::runtime_error::runtime_error(&v37, "change token/info item is already in the map!");
      std::runtime_error::runtime_error(&v38, &v37);
      v40 = 0;
      v41 = 0;
      v42 = 0;
      v43 = -1;
      v38.__vftable = (std::runtime_error_vtbl *)&off_1E69A1FB8;
      v39 = &unk_1E69A1FE0;
      boost::exception_detail::clone_impl<boost::exception_detail::error_info_injector<std::runtime_error>>::clone_impl((uint64_t)buf, (uint64_t)&v38);
      v51 = "-[Core_Audio_Driver store_change_info:for_token:]";
      v52 = "/Library/Caches/com.apple.xbs/Sources/AudioHAL/Source/AMCP/ASP/Portal/Driver/Core_Audio_Driver.mm";
      v53 = 135;
      applesauce::backtrace::snapshot_N<64>::snapshot_N((char **)&v32);
      v34 = off_1E69A20A0;
      v35 = v32;
      v36 = v33;
      v32 = 0uLL;
      v33 = 0;
      boost::exception_detail::set_info_rv<boost::error_info<applesauce::exceptions::tag_backtrace,applesauce::backtrace::snapshot_N<64>>>::set<boost::exception_detail::clone_impl<boost::exception_detail::error_info_injector<std::runtime_error>>>((uint64_t)buf, (uint64_t)&v34);
      boost::exception_detail::clone_impl<boost::exception_detail::error_info_injector<std::runtime_error>>::clone_impl((uint64_t)exception, (uint64_t)buf);
    }
    while (1)
    {
      while (1)
      {
        v19 = (uint64_t **)v12;
        v20 = v12[4];
        if (v20 <= a4)
          break;
        v12 = *v19;
        v13 = v19;
        if (!*v19)
          goto LABEL_24;
      }
      if (v20 >= a4)
        break;
      v12 = v19[1];
      if (!v12)
      {
        v13 = v19 + 1;
        goto LABEL_24;
      }
    }
  }
  else
  {
    v19 = v45 + 1;
LABEL_24:
    v21 = (uint64_t *)operator new(0x30uLL);
    v21[4] = a4;
    v21[5] = (uint64_t)a3;
    *v21 = 0;
    v21[1] = 0;
    v21[2] = (uint64_t)v19;
    *v13 = v21;
    v22 = (uint64_t *)**v11;
    if (v22)
    {
      *v11 = v22;
      v21 = *v13;
    }
    std::__tree_balance_after_insert[abi:ne180100]<std::__tree_node_base<void *> *>(v11[1], v21);
    v11[2] = (uint64_t *)((char *)v11[2] + 1);
  }
  if (v46)
  {
    p_shared_owners = &v46->__shared_owners_;
    do
      v24 = __ldaxr((unint64_t *)p_shared_owners);
    while (__stlxr(v24 - 1, (unint64_t *)p_shared_owners));
    if (!v24)
    {
      ((void (*)(std::__shared_weak_count *))v46->__on_zero_shared)(v46);
      std::__shared_weak_count::__release_weak(v46);
    }
  }
  os_unfair_lock_unlock(v7);
}

- (void)initialize:(id)a3 reply:(id)a4
{
  uint64_t v6;
  id v7;
  void (**v8)(id, uint64_t);
  AudioServerPlugInDriverInterface **v9;
  id v10;
  void *v11;
  uint64_t v12;

  v6 = 2003329396;
  v7 = a3;
  v8 = (void (**)(id, uint64_t))a4;
  v9 = -[Core_Audio_Driver asp_interface](self, "asp_interface");
  v10 = -[Core_Audio_Driver_Host_Proxy init_with_host_endpoint:driver:]([Core_Audio_Driver_Host_Proxy alloc], "init_with_host_endpoint:driver:", v7, self);
  -[Core_Audio_Driver setDriver_host_proxy:](self, "setDriver_host_proxy:", v10);

  -[Core_Audio_Driver driver_host_proxy](self, "driver_host_proxy");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "get_host_interface");

  if (v9 && v12)
    v6 = ((uint64_t (*)(AudioServerPlugInDriverInterface **, uint64_t))(*v9)->Initialize)(v9, v12);
  v8[2](v8, v6);

}

- (void)perform_device_configuration_change:(unsigned int)a3 action:(unint64_t)a4 change:(unint64_t)a5 reply:(id)a6
{
  id v10;
  NSObject *v11;
  Core_Audio_Driver *v12;
  void *v13;
  Core_Audio_Driver *v14;
  _QWORD block[4];
  Core_Audio_Driver *v16;
  unsigned int v17;
  unint64_t v18;
  unint64_t v19;
  id v20;

  v10 = a6;
  -[Core_Audio_Driver concurrent_queue](self, "concurrent_queue");
  v11 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3321888768;
  block[2] = __77__Core_Audio_Driver_perform_device_configuration_change_action_change_reply___block_invoke;
  block[3] = &__block_descriptor_72_ea8_32c90_ZTSKZ77__Core_Audio_Driver_perform_device_configuration_change_action_change_reply__E3__9_e5_v8__0l;
  v12 = self;
  v13 = _Block_copy(v10);
  v14 = v12;
  v16 = v14;
  v17 = a3;
  v18 = a4;
  v19 = a5;
  v20 = _Block_copy(v13);
  dispatch_async(v11, block);

}

- (void)abort_device_configuration_change:(unsigned int)a3 action:(unint64_t)a4 change:(unint64_t)a5 reply:(id)a6
{
  id v10;
  NSObject *v11;
  Core_Audio_Driver *v12;
  void *v13;
  Core_Audio_Driver *v14;
  _QWORD block[4];
  Core_Audio_Driver *v16;
  unsigned int v17;
  unint64_t v18;
  unint64_t v19;
  id v20;

  v10 = a6;
  -[Core_Audio_Driver concurrent_queue](self, "concurrent_queue");
  v11 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3321888768;
  block[2] = __75__Core_Audio_Driver_abort_device_configuration_change_action_change_reply___block_invoke;
  block[3] = &__block_descriptor_72_ea8_32c89_ZTSKZ75__Core_Audio_Driver_abort_device_configuration_change_action_change_reply__E4__10_e5_v8__0l;
  v12 = self;
  v13 = _Block_copy(v10);
  v14 = v12;
  v16 = v14;
  v17 = a3;
  v18 = a4;
  v19 = a5;
  v20 = _Block_copy(v13);
  dispatch_async(v11, block);

}

- (int)create_and_start_io_receiver:(unsigned int)a3 client_id:(unsigned int)a4 nominal_sample_rate:(double)a5 io_buffer_frame_size:(unsigned int)a6 work_group_port:(id)a7 io_messenger:(id)a8
{
  uint64_t v12;
  AudioServerPlugInDriverInterface **v14;
  unint64_t *v15;
  unint64_t v16;
  uint64_t *v17;
  unint64_t *v18;
  unint64_t v19;
  unint64_t *v20;
  unint64_t v21;
  AMCP::Log::Scope_Registry *v22;
  unint64_t *v23;
  unint64_t v24;
  char *v25;
  unint64_t *v26;
  id v27;
  id v28;
  void *v29;
  caulk::mach::details *v30;
  void *v31;
  const BOOL *v32;
  std::__shared_weak_count *v33;
  unint64_t *p_shared_owners;
  __int128 v35;
  std::__shared_weak_count *shared_owners;
  unint64_t v37;
  unint64_t v38;
  unint64_t *p_shared_weak_owners;
  unint64_t v40;
  NSObject *v41;
  std::__shared_weak_count *v42;
  unint64_t *v43;
  unint64_t v44;
  int v45;
  std::__shared_weak_count *v46;
  unint64_t *v47;
  __int128 v48;
  std::__shared_weak_count *v49;
  unint64_t v50;
  unint64_t *v51;
  unint64_t v52;
  unint64_t v53;
  unint64_t *v54;
  unint64_t v55;
  unint64_t v56;
  std::__shared_weak_count *v57;
  unint64_t *v58;
  unint64_t v59;
  AMCP::Log::Scope_Registry *v60;
  _QWORD *v61;
  void *v62;
  unint64_t v63;
  unint64_t *v64;
  unint64_t v65;
  unint64_t v66;
  std::__shared_weak_count *v67;
  unint64_t *v68;
  unint64_t v69;
  uint64_t v70;
  _QWORD *v71;
  _QWORD *v72;
  uint64_t v73;
  uint64_t (**v74)();
  unint64_t v75;
  unint64_t v76;
  unint64_t v77;
  uint8x8_t v78;
  uint64_t **v79;
  uint64_t *v80;
  unint64_t v81;
  char *v83;
  _QWORD *v84;
  float v85;
  float v86;
  _BOOL8 v87;
  unint64_t v88;
  unint64_t v89;
  int8x8_t prime;
  uint64_t (*v91)();
  uint64_t (*v92)();
  uint64_t v93;
  _QWORD *v94;
  unint64_t v95;
  uint8x8_t v96;
  unint64_t v97;
  uint8x8_t v98;
  uint64_t v99;
  _QWORD *v100;
  unint64_t v101;
  uint64_t (**v102)();
  uint64_t (*v103)();
  unint64_t v104;
  Core_Audio_Driver *v105;
  std::__shared_weak_count *v106;
  unint64_t *v107;
  unint64_t v108;
  std::__shared_weak_count *v109;
  uint64_t *v110;
  unint64_t *v111;
  unint64_t v112;
  uint64_t v113;
  uint64_t v114;
  int v115;
  BOOL v116;
  void *v117;
  id v118;
  void *v119;
  std::__shared_weak_count *v120;
  unint64_t *v121;
  unint64_t v122;
  id v123;
  char *v124;
  uint64_t v125;
  void *v126;
  uint64_t v127;
  __int128 v128;
  __int128 v129;
  __int128 v130;
  std::__shared_weak_count *v131;
  unint64_t *v132;
  unint64_t v133;
  const BOOL *v134;
  uint64_t v135;
  uint64_t v136;
  AMCP::Log::Scope_Registry *v137;
  uint64_t v138;
  std::string::size_type v139;
  uint64_t (**v140)();
  unint64_t *v141;
  unint64_t v142;
  std::string::size_type v143;
  std::string::size_type v144;
  unint64_t *v145;
  unint64_t v146;
  NSObject *v147;
  std::__shared_weak_count *v148;
  unint64_t *v149;
  unint64_t v150;
  std::string::size_type v151;
  uint64_t (**v152)();
  unint64_t *v153;
  unint64_t v154;
  __int128 v155;
  unint64_t *v156;
  unint64_t v157;
  uint64_t v158;
  uint64_t v159;
  unint64_t *v160;
  unint64_t v161;
  int v162;
  uint64_t v163;
  unint64_t *v164;
  unint64_t v165;
  std::__shared_weak_count *v166;
  unint64_t *v167;
  unint64_t v168;
  unint64_t *v169;
  unint64_t v170;
  unint64_t *v172;
  unint64_t v173;
  uint64_t (*v174)();
  _opaque_pthread_t *v175;
  mach_port_t v176;
  _opaque_pthread_t *v177;
  mach_port_t v178;
  NSObject *v179;
  std::__shared_weak_count *v180;
  unint64_t *v181;
  unint64_t v182;
  _opaque_pthread_t *v183;
  mach_port_t v184;
  std::runtime_error *v185;
  int v186;
  uint64_t v187;
  std::runtime_error v188;
  NSObject *v189;
  std::__shared_weak_count *v190;
  unint64_t *v191;
  unint64_t v192;
  _opaque_pthread_t *v193;
  mach_port_t v194;
  std::runtime_error *v195;
  int v196;
  uint64_t v197;
  std::runtime_error v198;
  NSObject *v199;
  _opaque_pthread_t *v200;
  mach_port_t v201;
  void *exception;
  NSObject *v203;
  std::__shared_weak_count *v204;
  unint64_t *v205;
  unint64_t v206;
  _opaque_pthread_t *v207;
  mach_port_t v208;
  std::runtime_error *v209;
  int v210;
  uint64_t v211;
  std::runtime_error v212;
  __int128 v213;
  __int128 v214;
  __int128 v215;
  __int128 v216;
  void *v217;
  char *v218;
  char *v219;
  unsigned int v220;
  _QWORD *v221;
  os_unfair_lock_s *lock;
  id v223;
  std::__shared_weak_count *v224;
  Core_Audio_Driver *v225;
  std::string::size_type v226;
  id v227;
  id v228;
  std::__shared_weak_count *v229;
  std::runtime_error v230;
  std::string::size_type v231;
  std::runtime_error v232;
  std::string __p;
  std::string v234;
  uint64_t v235;
  _BYTE v236[29];
  uint64_t (**v237)();
  std::string v238;
  uint64_t v239[7];
  _BYTE buf[48];
  uint64_t v241;
  uint64_t v242;
  int v243;
  uint64_t v244;

  v12 = *(_QWORD *)&a3;
  v244 = *MEMORY[0x1E0C80C00];
  v227 = a7;
  v228 = a8;
  if (!v228)
  {
    AMCP::Log::Scope_Registry::get(0);
    AMCP::Log::Scope_Registry::fetch((AMCP::Log::Scope_Registry *)buf, "com.apple.coreaudio", "AMCP");
    v41 = **(NSObject ***)buf;
    AMCP::Log::Scope::get_os_log_t(**(id **)buf);
    objc_claimAutoreleasedReturnValue();
    v42 = *(std::__shared_weak_count **)&buf[8];
    if (*(_QWORD *)&buf[8])
    {
      v43 = (unint64_t *)(*(_QWORD *)&buf[8] + 8);
      do
        v44 = __ldaxr(v43);
      while (__stlxr(v44 - 1, v43));
      if (!v44)
      {
        ((void (*)(std::__shared_weak_count *))v42->__on_zero_shared)(v42);
        std::__shared_weak_count::__release_weak(v42);
      }
    }
    if (os_log_type_enabled(v41, OS_LOG_TYPE_ERROR))
    {
      v175 = pthread_self();
      v176 = pthread_mach_thread_np(v175);
      *(_DWORD *)buf = 67109634;
      *(_DWORD *)&buf[4] = v176;
      *(_WORD *)&buf[8] = 2080;
      *(_QWORD *)&buf[10] = "Core_Audio_Driver.mm";
      *(_WORD *)&buf[18] = 1024;
      *(_DWORD *)&buf[20] = 274;
      _os_log_error_impl(&dword_1B57BA000, v41, OS_LOG_TYPE_ERROR, "%6u %32s:%-5d io messenger/buffer is nil", buf, 0x18u);
    }

    v45 = 1852797029;
    goto LABEL_261;
  }
  v14 = -[Core_Audio_Driver asp_interface](self, "asp_interface");
  -[Core_Audio_Driver io_receiver_lock](self, "io_receiver_lock");
  lock = *(os_unfair_lock_s **)buf;
  os_unfair_lock_lock(*(os_unfair_lock_t *)buf);
  if (*(_QWORD *)&buf[8])
  {
    v15 = (unint64_t *)(*(_QWORD *)&buf[8] + 8);
    do
      v16 = __ldaxr(v15);
    while (__stlxr(v16 - 1, v15));
    if (!v16)
    {
      (*(void (**)(_QWORD))(**(_QWORD **)&buf[8] + 16))(*(_QWORD *)&buf[8]);
      std::__shared_weak_count::__release_weak(*(std::__shared_weak_count **)&buf[8]);
    }
  }
  -[Core_Audio_Driver io_receivers](self, "io_receivers");
  v17 = *(uint64_t **)(*(_QWORD *)buf + 16);
  -[Core_Audio_Driver io_receivers](self, "io_receivers");
  for (; v17; v17 = (uint64_t *)*v17)
  {
    if (*((_DWORD *)v17 + 4) == (_DWORD)v12 && *((_DWORD *)v17 + 5) == a4)
      break;
  }
  if (v234.__r_.__value_.__l.__size_)
  {
    v18 = (unint64_t *)(v234.__r_.__value_.__l.__size_ + 8);
    do
      v19 = __ldaxr(v18);
    while (__stlxr(v19 - 1, v18));
    if (!v19)
    {
      (*(void (**)(std::string::size_type))(*(_QWORD *)v234.__r_.__value_.__l.__size_ + 16))(v234.__r_.__value_.__l.__size_);
      std::__shared_weak_count::__release_weak((std::__shared_weak_count *)v234.__r_.__value_.__l.__size_);
    }
  }
  if (*(_QWORD *)&buf[8])
  {
    v20 = (unint64_t *)(*(_QWORD *)&buf[8] + 8);
    do
      v21 = __ldaxr(v20);
    while (__stlxr(v21 - 1, v20));
    if (!v21)
    {
      (*(void (**)(_QWORD))(**(_QWORD **)&buf[8] + 16))(*(_QWORD *)&buf[8]);
      std::__shared_weak_count::__release_weak(*(std::__shared_weak_count **)&buf[8]);
    }
  }
  v22 = (AMCP::Log::Scope_Registry *)-[Core_Audio_Driver io_receivers](self, "io_receivers");
  if (*(_QWORD *)&buf[8])
  {
    v23 = (unint64_t *)(*(_QWORD *)&buf[8] + 8);
    do
      v24 = __ldaxr(v23);
    while (__stlxr(v24 - 1, v23));
    if (!v24)
    {
      (*(void (**)(_QWORD))(**(_QWORD **)&buf[8] + 16))(*(_QWORD *)&buf[8]);
      std::__shared_weak_count::__release_weak(*(std::__shared_weak_count **)&buf[8]);
    }
  }
  if (v17)
  {
    AMCP::Log::Scope_Registry::get(v22);
    AMCP::Log::Scope_Registry::fetch((AMCP::Log::Scope_Registry *)buf, "com.apple.coreaudio", "AMCP");
    v199 = **(NSObject ***)buf;
    AMCP::Log::Scope::get_os_log_t(**(id **)buf);
    objc_claimAutoreleasedReturnValue();
    std::shared_ptr<AMCP::Log::Scope>::~shared_ptr[abi:ne180100]((uint64_t)buf);
    if (os_log_type_enabled(v199, OS_LOG_TYPE_ERROR))
    {
      v200 = pthread_self();
      v201 = pthread_mach_thread_np(v200);
      *(_DWORD *)buf = 67109890;
      *(_DWORD *)&buf[4] = v201;
      *(_WORD *)&buf[8] = 2080;
      *(_QWORD *)&buf[10] = "Core_Audio_Driver.mm";
      *(_WORD *)&buf[18] = 1024;
      *(_DWORD *)&buf[20] = 286;
      *(_WORD *)&buf[24] = 2080;
      *(_QWORD *)&buf[26] = "find_result != self.io_receivers->end()";
      _os_log_error_impl(&dword_1B57BA000, v199, OS_LOG_TYPE_ERROR, "%6u %32s:%-5d Throwing Exception: %s IO Messenger was already created", buf, 0x22u);
    }

    AMCP::Utility::With_Realtime_Disabled::With_Realtime_Disabled((AMCP::Utility::With_Realtime_Disabled *)&v232);
    exception = __cxa_allocate_exception(0x40uLL);
    std::runtime_error::runtime_error(&v230, "IO Messenger was already created");
    std::runtime_error::runtime_error((std::runtime_error *)&v234, &v230);
    v235 = 0;
    *(_QWORD *)v236 = 0;
    *(_QWORD *)&v236[8] = 0;
    *(_DWORD *)&v236[16] = -1;
    v234.__r_.__value_.__r.__words[0] = (std::string::size_type)&off_1E69A1FB8;
    v234.__r_.__value_.__r.__words[2] = (std::string::size_type)&unk_1E69A1FE0;
    boost::exception_detail::clone_impl<boost::exception_detail::error_info_injector<std::runtime_error>>::clone_impl((uint64_t)buf, (uint64_t)&v234);
    *(_QWORD *)&buf[32] = "-[Core_Audio_Driver create_and_start_io_receiver:client_id:nominal_sample_rate:io_buffer_frame"
                          "_size:work_group_port:io_messenger:]";
    *(_QWORD *)&buf[40] = "/Library/Caches/com.apple.xbs/Sources/AudioHAL/Source/AMCP/ASP/Portal/Driver/Core_Audio_Driver.mm";
    LODWORD(v241) = 286;
    applesauce::backtrace::snapshot_N<64>::snapshot_N(&__p.__r_.__value_.__l.__data_);
    v238 = __p;
    v237 = off_1E69A20A0;
    memset(&__p, 0, sizeof(__p));
    boost::exception_detail::set_info_rv<boost::error_info<applesauce::exceptions::tag_backtrace,applesauce::backtrace::snapshot_N<64>>>::set<boost::exception_detail::clone_impl<boost::exception_detail::error_info_injector<std::runtime_error>>>((uint64_t)buf, (uint64_t)&v237);
    boost::exception_detail::clone_impl<boost::exception_detail::error_info_injector<std::runtime_error>>::clone_impl((uint64_t)exception, (uint64_t)buf);
  }
  objc_msgSend(v228, "object");
  v220 = a6;
  v217 = (void *)objc_claimAutoreleasedReturnValue();
  v25 = (char *)operator new(0xC0uLL);
  *(_OWORD *)(v25 + 8) = 0u;
  v26 = (unint64_t *)(v25 + 8);
  *(_QWORD *)v25 = &off_1E6995A18;
  v27 = v217;
  *((_OWORD *)v25 + 11) = 0u;
  *((_QWORD *)v25 + 3) = &off_1E6993898;
  v226 = (std::string::size_type)(v25 + 24);
  *((_OWORD *)v25 + 2) = 0u;
  v218 = v25 + 56;
  v219 = v25 + 40;
  *(_OWORD *)(v25 + 104) = 0u;
  *(_OWORD *)(v25 + 120) = 0u;
  *((_OWORD *)v25 + 3) = 0u;
  *((_QWORD *)v25 + 8) = 0;
  *((_DWORD *)v25 + 34) = 1065353216;
  v221 = v25 + 144;
  *((_QWORD *)v25 + 21) = 0;
  v28 = v27;
  caulk::mach::details::release_os_object(0, v29);
  v30 = (caulk::mach::details *)*((_QWORD *)v25 + 4);
  v223 = v28;
  *((_QWORD *)v25 + 4) = v28;
  caulk::mach::details::release_os_object(v30, v31);
  v224 = (std::__shared_weak_count *)v25;
  v225 = self;
  if (AMCP::Feature_Flags::access_event_link_oop_io(0, v32))
  {
    v33 = (std::__shared_weak_count *)operator new(0xD8uLL);
    v33->__shared_owners_ = 0;
    p_shared_owners = (unint64_t *)&v33->__shared_owners_;
    v33->__shared_weak_owners_ = 0;
    v33->__vftable = (std::__shared_weak_count_vtbl *)&off_1E69938C8;
    v33[1].std::__shared_count = 0u;
    *(_OWORD *)&v33[1].__shared_weak_owners_ = 0u;
    *(_OWORD *)&v33[2].__shared_owners_ = 0u;
    v33[3].std::__shared_count = 0u;
    *(_OWORD *)&v33[3].__shared_weak_owners_ = 0u;
    *(_OWORD *)&v33[4].__shared_owners_ = 0u;
    v33[5].std::__shared_count = 0u;
    *(_OWORD *)&v33[5].__shared_weak_owners_ = 0u;
    *(_OWORD *)&v33[6].__shared_owners_ = 0u;
    v33[7].std::__shared_count = 0u;
    *(_OWORD *)&v33[7].__shared_weak_owners_ = 0u;
    *(_OWORD *)&v33[8].__shared_owners_ = 0u;
    MEMORY[0x1B5E4FF20](&v33[4]);
    v33[5].__shared_owners_ = 0;
    v33[6].__shared_weak_owners_ = 0;
    v33[8].__vftable = 0;
    v33[8].__shared_owners_ = 0x3FD0000000000000;
    LOWORD(v33[8].__shared_weak_owners_) = 0;
    *(_QWORD *)&v35 = v33 + 1;
    *((_QWORD *)&v35 + 1) = v33;
    shared_owners = (std::__shared_weak_count *)v33[1].__shared_owners_;
    if (shared_owners)
    {
      v37 = (unint64_t)v224;
      if (shared_owners->__shared_owners_ != -1)
      {
LABEL_56:
        v57 = *(std::__shared_weak_count **)(v37 + 48);
        *(_OWORD *)(v37 + 40) = v35;
        if (v57)
        {
          v58 = (unint64_t *)&v57->__shared_owners_;
          do
            v59 = __ldaxr(v58);
          while (__stlxr(v59 - 1, v58));
          if (!v59)
          {
            ((void (*)(std::__shared_weak_count *))v57->__on_zero_shared)(v57);
            std::__shared_weak_count::__release_weak(v57);
          }
        }
        caulk::make_string((caulk *)"IO Receiver: %u", (uint64_t)&__p, v12);
        v60 = (AMCP::Log::Scope_Registry *)caulk::ipc::synchronous_messenger::eventlink_receiver::ingest_connection_info();
        v61 = *(_QWORD **)v219;
        v62 = v223;
        if (!*(_QWORD *)(*(_QWORD *)v219 + 16) || !v61[3] || !v61[5] || !v61[6] || !v61[8])
        {
          AMCP::Log::Scope_Registry::get(v60);
          AMCP::Log::Scope_Registry::fetch((AMCP::Log::Scope_Registry *)buf, "com.apple.coreaudio", "AMCP");
          v189 = **(NSObject ***)buf;
          AMCP::Log::Scope::get_os_log_t(**(id **)buf);
          objc_claimAutoreleasedReturnValue();
          v190 = *(std::__shared_weak_count **)&buf[8];
          if (*(_QWORD *)&buf[8])
          {
            v191 = (unint64_t *)(*(_QWORD *)&buf[8] + 8);
            do
              v192 = __ldaxr(v191);
            while (__stlxr(v192 - 1, v191));
            if (!v192)
            {
              ((void (*)(std::__shared_weak_count *))v190->__on_zero_shared)(v190);
              std::__shared_weak_count::__release_weak(v190);
            }
          }
          if (os_log_type_enabled(v189, OS_LOG_TYPE_ERROR))
          {
            v193 = pthread_self();
            v194 = pthread_mach_thread_np(v193);
            *(_DWORD *)buf = 67109890;
            *(_DWORD *)&buf[4] = v194;
            *(_WORD *)&buf[8] = 2080;
            *(_QWORD *)&buf[10] = "IO_Receiver.mm";
            *(_WORD *)&buf[18] = 1024;
            *(_DWORD *)&buf[20] = 86;
            *(_WORD *)&buf[24] = 2080;
            *(_QWORD *)&buf[26] = "!m_event_link_receiver->is_valid()";
            _os_log_error_impl(&dword_1B57BA000, v189, OS_LOG_TYPE_ERROR, "%6u %32s:%-5d Throwing Exception: %s Failed to unpack connection info", buf, 0x22u);
          }

          AMCP::Utility::With_Realtime_Disabled::With_Realtime_Disabled((AMCP::Utility::With_Realtime_Disabled *)v239);
          v195 = (std::runtime_error *)__cxa_allocate_exception(0x40uLL);
          std::runtime_error::runtime_error(&v232, "Failed to unpack connection info");
          std::runtime_error::runtime_error((std::runtime_error *)&v234, &v232);
          v235 = 0;
          *(_QWORD *)v236 = 0;
          *(_QWORD *)&v236[8] = 0;
          *(_DWORD *)&v236[16] = -1;
          v234.__r_.__value_.__r.__words[0] = (std::string::size_type)&off_1E69A1FB8;
          v234.__r_.__value_.__r.__words[2] = (std::string::size_type)&unk_1E69A1FE0;
          boost::exception_detail::clone_impl<boost::exception_detail::error_info_injector<std::runtime_error>>::clone_impl((uint64_t)buf, (uint64_t)&v234);
          *(_QWORD *)&buf[32] = "AMCP::Portal::IPC::IO_Receiver::IO_Receiver(__strong xpc_object_t, AudioServerPlugInDriv"
                                "erRef, AudioObjectID, UInt32)";
          *(_QWORD *)&buf[40] = "/Library/Caches/com.apple.xbs/Sources/AudioHAL/Source/AMCP/ASP/Portal/Driver/IO_Receiver.mm";
          LODWORD(v241) = 86;
          std::vector<void *>::vector(&v230);
          v196 = backtrace((void **)&v230.~runtime_error, (unint64_t)(v230.__imp_.__imp_ - (const char *)v230.__vftable) >> 3);
          std::vector<void *>::resize((char **)&v230, v196);
          *(std::runtime_error *)&v238.__r_.__value_.__l.__data_ = v230;
          v237 = off_1E69A20A0;
          v238.__r_.__value_.__r.__words[2] = v231;
          v230.__vftable = 0;
          v230.__imp_.__imp_ = 0;
          v231 = 0;
          boost::exception_detail::set_info_rv<boost::error_info<applesauce::exceptions::tag_backtrace,applesauce::backtrace::snapshot_N<64>>>::set<boost::exception_detail::clone_impl<boost::exception_detail::error_info_injector<std::runtime_error>>>((uint64_t)buf, (uint64_t)&v237);
          v195[3].__imp_.__imp_ = (const char *)&unk_1E69A1F88;
          std::runtime_error::runtime_error(v195, (const std::runtime_error *)buf);
          v195[1].__vftable = (std::runtime_error_vtbl *)&unk_1E69A2000;
          v197 = *(_QWORD *)&buf[24];
          v195[1].__imp_.__imp_ = *(const char **)&buf[24];
          if (v197)
            (*(void (**)(uint64_t))(*(_QWORD *)v197 + 24))(v197);
          v198 = *(std::runtime_error *)&buf[32];
          LODWORD(v195[3].__vftable) = v241;
          v195[2] = v198;
          v195->__vftable = (std::runtime_error_vtbl *)&off_1E69A1EE8;
          v195[1].__vftable = (std::runtime_error_vtbl *)&unk_1E69A1F20;
          v195[3].__imp_.__imp_ = (const char *)&unk_1E69A1F58;
        }
        if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0)
          operator delete(__p.__r_.__value_.__l.__data_);
        goto LABEL_87;
      }
      do
        v38 = __ldxr(p_shared_owners);
      while (__stxr(v38 + 1, p_shared_owners));
      v215 = v35;
      p_shared_weak_owners = (unint64_t *)&v33->__shared_weak_owners_;
      do
        v40 = __ldxr(p_shared_weak_owners);
      while (__stxr(v40 + 1, p_shared_weak_owners));
      v33[1].__vftable = (std::__shared_weak_count_vtbl *)&v33[1];
      v33[1].__shared_owners_ = (uint64_t)v33;
      std::__shared_weak_count::__release_weak(shared_owners);
      v35 = v215;
    }
    else
    {
      v37 = (unint64_t)v224;
      do
        v53 = __ldxr(p_shared_owners);
      while (__stxr(v53 + 1, p_shared_owners));
      v54 = (unint64_t *)&v33->__shared_weak_owners_;
      do
        v55 = __ldxr(v54);
      while (__stxr(v55 + 1, v54));
      v33[1].__vftable = (std::__shared_weak_count_vtbl *)&v33[1];
      v33[1].__shared_owners_ = (uint64_t)v33;
    }
    do
      v56 = __ldaxr(p_shared_owners);
    while (__stlxr(v56 - 1, p_shared_owners));
    if (!v56)
    {
      v216 = v35;
      ((void (*)(std::__shared_weak_count *))v33->__on_zero_shared)(v33);
      std::__shared_weak_count::__release_weak(v33);
      v35 = v216;
    }
    goto LABEL_56;
  }
  v46 = (std::__shared_weak_count *)operator new(0xD8uLL);
  v46->__shared_owners_ = 0;
  v47 = (unint64_t *)&v46->__shared_owners_;
  v46->__shared_weak_owners_ = 0;
  v46->__vftable = (std::__shared_weak_count_vtbl *)&off_1E6993918;
  v46[1].std::__shared_count = 0u;
  *(_OWORD *)&v46[1].__shared_weak_owners_ = 0u;
  *(_OWORD *)&v46[3].__shared_weak_owners_ = 0u;
  *(_OWORD *)&v46[2].__shared_owners_ = 0u;
  v46[3].std::__shared_count = 0u;
  *(_OWORD *)&v46[4].__shared_owners_ = 0u;
  v46[5].std::__shared_count = 0u;
  *(_OWORD *)&v46[5].__shared_weak_owners_ = 0u;
  *(_OWORD *)&v46[6].__shared_owners_ = 0u;
  v46[7].std::__shared_count = 0u;
  *(_OWORD *)&v46[7].__shared_weak_owners_ = 0u;
  *(_OWORD *)&v46[8].__shared_owners_ = 0u;
  MEMORY[0x1B5E4FF20](&v46[3].__shared_weak_owners_);
  MEMORY[0x1B5E4FF20](&v46[4]);
  MEMORY[0x1B5E4FF20](&v46[4].__shared_owners_);
  v46[5].__shared_weak_owners_ = 0;
  v46[7].__vftable = 0;
  v46[8].__shared_owners_ = 0;
  LOWORD(v46[8].__shared_weak_owners_) = 0;
  *(_QWORD *)&v48 = v46 + 1;
  *((_QWORD *)&v48 + 1) = v46;
  v49 = (std::__shared_weak_count *)v46[1].__shared_owners_;
  if (!v49)
  {
    v37 = (unint64_t)v224;
    do
      v63 = __ldxr(v47);
    while (__stxr(v63 + 1, v47));
    v64 = (unint64_t *)&v46->__shared_weak_owners_;
    do
      v65 = __ldxr(v64);
    while (__stxr(v65 + 1, v64));
    v46[1].__vftable = (std::__shared_weak_count_vtbl *)&v46[1];
    v46[1].__shared_owners_ = (uint64_t)v46;
    goto LABEL_73;
  }
  v37 = (unint64_t)v224;
  if (v49->__shared_owners_ == -1)
  {
    do
      v50 = __ldxr(v47);
    while (__stxr(v50 + 1, v47));
    v213 = v48;
    v51 = (unint64_t *)&v46->__shared_weak_owners_;
    do
      v52 = __ldxr(v51);
    while (__stxr(v52 + 1, v51));
    v46[1].__vftable = (std::__shared_weak_count_vtbl *)&v46[1];
    v46[1].__shared_owners_ = (uint64_t)v46;
    std::__shared_weak_count::__release_weak(v49);
    v48 = v213;
    do
LABEL_73:
      v66 = __ldaxr(v47);
    while (__stlxr(v66 - 1, v47));
    if (!v66)
    {
      v214 = v48;
      ((void (*)(std::__shared_weak_count *))v46->__on_zero_shared)(v46);
      std::__shared_weak_count::__release_weak(v46);
      v48 = v214;
    }
  }
  v67 = *(std::__shared_weak_count **)(v37 + 64);
  *(_OWORD *)(v37 + 56) = v48;
  if (v67)
  {
    v68 = (unint64_t *)&v67->__shared_owners_;
    do
      v69 = __ldaxr(v68);
    while (__stlxr(v69 - 1, v68));
    if (!v69)
    {
      ((void (*)(std::__shared_weak_count *))v67->__on_zero_shared)(v67);
      std::__shared_weak_count::__release_weak(v67);
    }
  }
  v60 = (AMCP::Log::Scope_Registry *)caulk::ipc::synchronous_messenger::semaphore_receiver::ingest_connection_info();
  v70 = *(_QWORD *)v218;
  v62 = v223;
  if (!*(_QWORD *)(*(_QWORD *)v218 + 16)
    || !*(_QWORD *)(v70 + 24)
    || !*(_QWORD *)(v70 + 40)
    || !*(_QWORD *)(v70 + 48)
    || !*(_DWORD *)(v70 + 64)
    || !*(_DWORD *)(v70 + 72))
  {
    AMCP::Log::Scope_Registry::get(v60);
    AMCP::Log::Scope_Registry::fetch((AMCP::Log::Scope_Registry *)buf, "com.apple.coreaudio", "AMCP");
    v179 = **(NSObject ***)buf;
    AMCP::Log::Scope::get_os_log_t(**(id **)buf);
    objc_claimAutoreleasedReturnValue();
    v180 = *(std::__shared_weak_count **)&buf[8];
    if (*(_QWORD *)&buf[8])
    {
      v181 = (unint64_t *)(*(_QWORD *)&buf[8] + 8);
      do
        v182 = __ldaxr(v181);
      while (__stlxr(v182 - 1, v181));
      if (!v182)
      {
        ((void (*)(std::__shared_weak_count *))v180->__on_zero_shared)(v180);
        std::__shared_weak_count::__release_weak(v180);
      }
    }
    if (os_log_type_enabled(v179, OS_LOG_TYPE_ERROR))
    {
      v183 = pthread_self();
      v184 = pthread_mach_thread_np(v183);
      *(_DWORD *)buf = 67109890;
      *(_DWORD *)&buf[4] = v184;
      *(_WORD *)&buf[8] = 2080;
      *(_QWORD *)&buf[10] = "IO_Receiver.mm";
      *(_WORD *)&buf[18] = 1024;
      *(_DWORD *)&buf[20] = 92;
      *(_WORD *)&buf[24] = 2080;
      *(_QWORD *)&buf[26] = "!m_receiver->is_valid()";
      _os_log_error_impl(&dword_1B57BA000, v179, OS_LOG_TYPE_ERROR, "%6u %32s:%-5d Throwing Exception: %s Failed to unpack connection info", buf, 0x22u);
    }

    AMCP::Utility::With_Realtime_Disabled::With_Realtime_Disabled((AMCP::Utility::With_Realtime_Disabled *)&v232);
    v185 = (std::runtime_error *)__cxa_allocate_exception(0x40uLL);
    std::runtime_error::runtime_error(&v230, "Failed to unpack connection info");
    std::runtime_error::runtime_error((std::runtime_error *)&v234, &v230);
    v235 = 0;
    *(_QWORD *)v236 = 0;
    *(_QWORD *)&v236[8] = 0;
    *(_DWORD *)&v236[16] = -1;
    v234.__r_.__value_.__r.__words[0] = (std::string::size_type)&off_1E69A1FB8;
    v234.__r_.__value_.__r.__words[2] = (std::string::size_type)&unk_1E69A1FE0;
    boost::exception_detail::clone_impl<boost::exception_detail::error_info_injector<std::runtime_error>>::clone_impl((uint64_t)buf, (uint64_t)&v234);
    *(_QWORD *)&buf[32] = "AMCP::Portal::IPC::IO_Receiver::IO_Receiver(__strong xpc_object_t, AudioServerPlugInDriverRef,"
                          " AudioObjectID, UInt32)";
    *(_QWORD *)&buf[40] = "/Library/Caches/com.apple.xbs/Sources/AudioHAL/Source/AMCP/ASP/Portal/Driver/IO_Receiver.mm";
    LODWORD(v241) = 92;
    std::vector<void *>::vector(&__p);
    v186 = backtrace((void **)__p.__r_.__value_.__l.__data_, (__p.__r_.__value_.__l.__size_ - __p.__r_.__value_.__r.__words[0]) >> 3);
    std::vector<void *>::resize(&__p.__r_.__value_.__l.__data_, v186);
    v238 = __p;
    v237 = off_1E69A20A0;
    memset(&__p, 0, sizeof(__p));
    boost::exception_detail::set_info_rv<boost::error_info<applesauce::exceptions::tag_backtrace,applesauce::backtrace::snapshot_N<64>>>::set<boost::exception_detail::clone_impl<boost::exception_detail::error_info_injector<std::runtime_error>>>((uint64_t)buf, (uint64_t)&v237);
    v185[3].__imp_.__imp_ = (const char *)&unk_1E69A1F88;
    std::runtime_error::runtime_error(v185, (const std::runtime_error *)buf);
    v185[1].__vftable = (std::runtime_error_vtbl *)&unk_1E69A2000;
    v187 = *(_QWORD *)&buf[24];
    v185[1].__imp_.__imp_ = *(const char **)&buf[24];
    if (v187)
      (*(void (**)(uint64_t))(*(_QWORD *)v187 + 24))(v187);
    v188 = *(std::runtime_error *)&buf[32];
    LODWORD(v185[3].__vftable) = v241;
    v185[2] = v188;
    v185->__vftable = (std::runtime_error_vtbl *)&off_1E69A1EE8;
    v185[1].__vftable = (std::runtime_error_vtbl *)&unk_1E69A1F20;
    v185[3].__imp_.__imp_ = (const char *)&unk_1E69A1F58;
  }
LABEL_87:
  *(_QWORD *)(v37 + 72) = v14;
  if (!v14)
  {
    AMCP::Log::Scope_Registry::get(v60);
    AMCP::Log::Scope_Registry::fetch((AMCP::Log::Scope_Registry *)buf, "com.apple.coreaudio", "AMCP");
    v203 = **(NSObject ***)buf;
    AMCP::Log::Scope::get_os_log_t(**(id **)buf);
    objc_claimAutoreleasedReturnValue();
    v204 = *(std::__shared_weak_count **)&buf[8];
    if (*(_QWORD *)&buf[8])
    {
      v205 = (unint64_t *)(*(_QWORD *)&buf[8] + 8);
      do
        v206 = __ldaxr(v205);
      while (__stlxr(v206 - 1, v205));
      if (!v206)
      {
        ((void (*)(std::__shared_weak_count *))v204->__on_zero_shared)(v204);
        std::__shared_weak_count::__release_weak(v204);
      }
    }
    if (os_log_type_enabled(v203, OS_LOG_TYPE_ERROR))
    {
      v207 = pthread_self();
      v208 = pthread_mach_thread_np(v207);
      *(_DWORD *)buf = 67109890;
      *(_DWORD *)&buf[4] = v208;
      *(_WORD *)&buf[8] = 2080;
      *(_QWORD *)&buf[10] = "IO_Receiver.mm";
      *(_WORD *)&buf[18] = 1024;
      *(_DWORD *)&buf[20] = 96;
      *(_WORD *)&buf[24] = 2080;
      *(_QWORD *)&buf[26] = "(m_asp_interface) == nullptr";
      _os_log_error_impl(&dword_1B57BA000, v203, OS_LOG_TYPE_ERROR, "%6u %32s:%-5d Throwing Exception: %s ASP interface is null", buf, 0x22u);
    }

    AMCP::Utility::With_Realtime_Disabled::With_Realtime_Disabled((AMCP::Utility::With_Realtime_Disabled *)&v232);
    v209 = (std::runtime_error *)__cxa_allocate_exception(0x40uLL);
    std::runtime_error::runtime_error(&v230, "ASP interface is null");
    std::runtime_error::runtime_error((std::runtime_error *)&v234, &v230);
    v235 = 0;
    *(_QWORD *)v236 = 0;
    *(_QWORD *)&v236[8] = 0;
    *(_DWORD *)&v236[16] = -1;
    v234.__r_.__value_.__r.__words[0] = (std::string::size_type)&off_1E69A1FB8;
    v234.__r_.__value_.__r.__words[2] = (std::string::size_type)&unk_1E69A1FE0;
    boost::exception_detail::clone_impl<boost::exception_detail::error_info_injector<std::runtime_error>>::clone_impl((uint64_t)buf, (uint64_t)&v234);
    *(_QWORD *)&buf[32] = "AMCP::Portal::IPC::IO_Receiver::IO_Receiver(__strong xpc_object_t, AudioServerPlugInDriverRef,"
                          " AudioObjectID, UInt32)";
    *(_QWORD *)&buf[40] = "/Library/Caches/com.apple.xbs/Sources/AudioHAL/Source/AMCP/ASP/Portal/Driver/IO_Receiver.mm";
    LODWORD(v241) = 96;
    std::vector<void *>::vector(&__p);
    v210 = backtrace((void **)__p.__r_.__value_.__l.__data_, (__p.__r_.__value_.__l.__size_ - __p.__r_.__value_.__r.__words[0]) >> 3);
    std::vector<void *>::resize(&__p.__r_.__value_.__l.__data_, v210);
    v238 = __p;
    v237 = off_1E69A20A0;
    memset(&__p, 0, sizeof(__p));
    boost::exception_detail::set_info_rv<boost::error_info<applesauce::exceptions::tag_backtrace,applesauce::backtrace::snapshot_N<64>>>::set<boost::exception_detail::clone_impl<boost::exception_detail::error_info_injector<std::runtime_error>>>((uint64_t)buf, (uint64_t)&v237);
    v209[3].__imp_.__imp_ = (const char *)&unk_1E69A1F88;
    std::runtime_error::runtime_error(v209, (const std::runtime_error *)buf);
    v209[1].__vftable = (std::runtime_error_vtbl *)&unk_1E69A2000;
    v211 = *(_QWORD *)&buf[24];
    v209[1].__imp_.__imp_ = *(const char **)&buf[24];
    if (v211)
      (*(void (**)(uint64_t))(*(_QWORD *)v211 + 24))(v211);
    v212 = *(std::runtime_error *)&buf[32];
    LODWORD(v209[3].__vftable) = v241;
    v209[2] = v212;
    v209->__vftable = (std::runtime_error_vtbl *)&off_1E69A1EE8;
    v209[1].__vftable = (std::runtime_error_vtbl *)&unk_1E69A1F20;
    v209[3].__imp_.__imp_ = (const char *)&unk_1E69A1F58;
  }
  *(_DWORD *)(v37 + 80) = v12;
  *(_DWORD *)(v37 + 84) = a4;
  *(_DWORD *)(v37 + 96) = 4096;
  *(_QWORD *)(v37 + 88) = 0x40E5888000000000;
  v71 = *(_QWORD **)(v37 + 168);
  *(_QWORD *)(v37 + 168) = 0;
  v72 = v221;
  if (v71 == v221)
  {
    v73 = 4;
  }
  else
  {
    if (!v71)
      goto LABEL_93;
    v73 = 5;
    v72 = v71;
  }
  (*(void (**)(void))(*v72 + 8 * v73))();
LABEL_93:

  v229 = (std::__shared_weak_count *)v37;
  -[Core_Audio_Driver io_receivers](self, "io_receivers");
  v74 = v237;
  LODWORD(v234.__r_.__value_.__l.__data_) = v12;
  HIDWORD(v234.__r_.__value_.__r.__words[0]) = a4;
  v234.__r_.__value_.__l.__size_ = v226;
  v234.__r_.__value_.__r.__words[2] = v37;
  do
    v75 = __ldxr(v26);
  while (__stxr(v75 + 1, v26));
  v76 = 0xC6A4A7935BD1E995
      * ((0xC6A4A7935BD1E995 * ((0xC6A4A7935BD1E995 * a4) ^ ((0xC6A4A7935BD1E995 * a4) >> 47))) ^ (0x35A98F4D286A90B9 * ((0xC6A4A7935BD1E995 * v12) ^ ((0xC6A4A7935BD1E995 * v12) >> 47)) + 3864292196u))
      + 3864292196u;
  v77 = (unint64_t)v74[1];
  if (!v77)
    goto LABEL_116;
  v78 = (uint8x8_t)vcnt_s8((int8x8_t)v77);
  v78.i16[0] = vaddlv_u8(v78);
  if (v78.u32[0] > 1uLL)
  {
    v37 = 0xC6A4A7935BD1E995
        * ((0xC6A4A7935BD1E995 * ((0xC6A4A7935BD1E995 * a4) ^ ((0xC6A4A7935BD1E995 * a4) >> 47))) ^ (0x35A98F4D286A90B9 * ((0xC6A4A7935BD1E995 * v12) ^ ((0xC6A4A7935BD1E995 * v12) >> 47)) + 3864292196u))
        + 3864292196u;
    if (v76 >= v77)
      v37 = v76 % v77;
  }
  else
  {
    v37 = v76 & (v77 - 1);
  }
  v79 = (uint64_t **)*((_QWORD *)*v74 + v37);
  if (!v79 || (v80 = *v79) == 0)
  {
LABEL_116:
    v83 = (char *)operator new(0x28uLL);
    v84 = v74 + 2;
    *(_QWORD *)buf = v83;
    *(_QWORD *)&buf[8] = v74 + 2;
    *(_QWORD *)v83 = 0;
    *((_QWORD *)v83 + 1) = v76;
    *((_QWORD *)v83 + 2) = v12 | ((unint64_t)a4 << 32);
    *(_OWORD *)(v83 + 24) = *(_OWORD *)&v234.__r_.__value_.__r.__words[1];
    *(_OWORD *)&v234.__r_.__value_.__r.__words[1] = 0uLL;
    buf[16] = 1;
    v85 = (float)((unint64_t)v74[3] + 1);
    v86 = *((float *)v74 + 8);
    if (v77 && (float)(v86 * (float)v77) >= v85)
    {
LABEL_162:
      v102 = (uint64_t (**)())*((_QWORD *)*v74 + v37);
      v103 = *(uint64_t (**)())buf;
      if (v102)
      {
        **(_QWORD **)buf = *v102;
      }
      else
      {
        **(_QWORD **)buf = v74[2];
        v74[2] = v103;
        *((_QWORD *)*v74 + v37) = v84;
        if (!*(_QWORD *)v103)
        {
LABEL_171:
          *(_QWORD *)buf = 0;
          v74[3] = (uint64_t (*)())((char *)v74[3] + 1);
          std::unique_ptr<std::__hash_node<std::__hash_value_type<AMCP::Portal::IPC::io_messenger_id_t,std::shared_ptr<AMCP::Portal::IPC::IO_Sender>>,void *>,std::__hash_node_destructor<std::allocator<std::__hash_node<std::__hash_value_type<AMCP::Portal::IPC::io_messenger_id_t,std::shared_ptr<AMCP::Portal::IPC::IO_Sender>>,void *>>>>::reset[abi:ne180100]((uint64_t)buf);
          v105 = v225;
          goto LABEL_172;
        }
        v104 = *(_QWORD *)(*(_QWORD *)v103 + 8);
        if ((v77 & (v77 - 1)) != 0)
        {
          if (v104 >= v77)
            v104 %= v77;
        }
        else
        {
          v104 &= v77 - 1;
        }
        v102 = (uint64_t (**)())((char *)*v74 + 8 * v104);
      }
      *v102 = v103;
      goto LABEL_171;
    }
    v87 = 1;
    if (v77 >= 3)
      v87 = (v77 & (v77 - 1)) != 0;
    v88 = v87 | (2 * v77);
    v89 = vcvtps_u32_f32(v85 / v86);
    if (v88 <= v89)
      prime = (int8x8_t)v89;
    else
      prime = (int8x8_t)v88;
    if (*(_QWORD *)&prime == 1)
    {
      prime = (int8x8_t)2;
    }
    else if ((*(_QWORD *)&prime & (*(_QWORD *)&prime - 1)) != 0)
    {
      prime = (int8x8_t)std::__next_prime(*(_QWORD *)&prime);
    }
    v77 = (unint64_t)v74[1];
    if (*(_QWORD *)&prime > v77)
      goto LABEL_128;
    if (*(_QWORD *)&prime < v77)
    {
      v97 = vcvtps_u32_f32((float)(unint64_t)v74[3] / *((float *)v74 + 8));
      if (v77 < 3 || (v98 = (uint8x8_t)vcnt_s8((int8x8_t)v77), v98.i16[0] = vaddlv_u8(v98), v98.u32[0] > 1uLL))
      {
        v97 = std::__next_prime(v97);
      }
      else
      {
        v99 = 1 << -(char)__clz(v97 - 1);
        if (v97 >= 2)
          v97 = v99;
      }
      if (*(_QWORD *)&prime <= v97)
        prime = (int8x8_t)v97;
      if (*(_QWORD *)&prime >= v77)
      {
        v77 = (unint64_t)v74[1];
      }
      else
      {
        if (prime)
        {
LABEL_128:
          if (*(_QWORD *)&prime >> 61)
            std::__throw_bad_array_new_length[abi:ne180100]();
          v91 = (uint64_t (*)())operator new(8 * *(_QWORD *)&prime);
          v92 = *v74;
          *v74 = v91;
          if (v92)
            operator delete(v92);
          v93 = 0;
          v74[1] = (uint64_t (*)())prime;
          do
            *((_QWORD *)*v74 + v93++) = 0;
          while (*(_QWORD *)&prime != v93);
          v94 = (_QWORD *)*v84;
          if (*v84)
          {
            v95 = v94[1];
            v96 = (uint8x8_t)vcnt_s8(prime);
            v96.i16[0] = vaddlv_u8(v96);
            if (v96.u32[0] > 1uLL)
            {
              if (v95 >= *(_QWORD *)&prime)
                v95 %= *(_QWORD *)&prime;
            }
            else
            {
              v95 &= *(_QWORD *)&prime - 1;
            }
            *((_QWORD *)*v74 + v95) = v84;
            v100 = (_QWORD *)*v94;
            if (*v94)
            {
              do
              {
                v101 = v100[1];
                if (v96.u32[0] > 1uLL)
                {
                  if (v101 >= *(_QWORD *)&prime)
                    v101 %= *(_QWORD *)&prime;
                }
                else
                {
                  v101 &= *(_QWORD *)&prime - 1;
                }
                if (v101 != v95)
                {
                  if (!*((_QWORD *)*v74 + v101))
                  {
                    *((_QWORD *)*v74 + v101) = v94;
                    goto LABEL_153;
                  }
                  *v94 = *v100;
                  *v100 = **((_QWORD **)*v74 + v101);
                  **((_QWORD **)*v74 + v101) = v100;
                  v100 = v94;
                }
                v101 = v95;
LABEL_153:
                v94 = v100;
                v100 = (_QWORD *)*v100;
                v95 = v101;
              }
              while (v100);
            }
          }
          v77 = (unint64_t)prime;
          goto LABEL_157;
        }
        v174 = *v74;
        *v74 = 0;
        if (v174)
          operator delete(v174);
        v77 = 0;
        v74[1] = 0;
      }
    }
LABEL_157:
    if ((v77 & (v77 - 1)) != 0)
    {
      if (v76 >= v77)
        v37 = v76 % v77;
      else
        v37 = 0xC6A4A7935BD1E995
            * ((0xC6A4A7935BD1E995 * ((0xC6A4A7935BD1E995 * a4) ^ ((0xC6A4A7935BD1E995 * a4) >> 47))) ^ (0x35A98F4D286A90B9 * ((0xC6A4A7935BD1E995 * v12) ^ ((0xC6A4A7935BD1E995 * v12) >> 47)) + 3864292196u))
            + 3864292196u;
    }
    else
    {
      v37 = (v77 - 1) & v76;
    }
    goto LABEL_162;
  }
  while (1)
  {
    v81 = v80[1];
    if (v81 == v76)
      break;
    if (v78.u32[0] > 1uLL)
    {
      if (v81 >= v77)
        v81 %= v77;
    }
    else
    {
      v81 &= v77 - 1;
    }
    if (v81 != v37)
      goto LABEL_116;
LABEL_115:
    v80 = (uint64_t *)*v80;
    if (!v80)
      goto LABEL_116;
  }
  if (*((_DWORD *)v80 + 4) != (_DWORD)v12 || *((_DWORD *)v80 + 5) != a4)
    goto LABEL_115;
  v172 = (unint64_t *)&v224->__shared_owners_;
  do
    v173 = __ldaxr(v172);
  while (__stlxr(v173 - 1, v172));
  v105 = v225;
  if (!v173)
  {
    ((void (*)(std::__shared_weak_count *))v224->__on_zero_shared)(v224);
    std::__shared_weak_count::__release_weak(v224);
  }
LABEL_172:
  v106 = (std::__shared_weak_count *)v238.__r_.__value_.__r.__words[0];
  if (v238.__r_.__value_.__r.__words[0])
  {
    v107 = (unint64_t *)(v238.__r_.__value_.__r.__words[0] + 8);
    do
      v108 = __ldaxr(v107);
    while (__stlxr(v108 - 1, v107));
    if (!v108)
    {
      ((void (*)(std::__shared_weak_count *))v106->__on_zero_shared)(v106);
      std::__shared_weak_count::__release_weak(v106);
    }
  }
  -[Core_Audio_Driver io_buffer_list](v105, "io_buffer_list");
  v110 = *(uint64_t **)buf;
  v109 = *(std::__shared_weak_count **)&buf[8];
  if (*(_QWORD *)&buf[8])
  {
    v111 = (unint64_t *)(*(_QWORD *)&buf[8] + 8);
    do
      v112 = __ldaxr(v111);
    while (__stlxr(v112 - 1, v111));
    if (!v112)
    {
      ((void (*)(std::__shared_weak_count *))v109->__on_zero_shared)(v109);
      std::__shared_weak_count::__release_weak(v109);
    }
  }
  v113 = *v110;
  v114 = v110[1];
  while (v113 != v114)
  {
    if (*(_DWORD *)v113 == (_DWORD)v12)
    {
      v115 = *(_DWORD *)(v113 + 4);
      if (v115)
        v116 = v115 == a4;
      else
        v116 = 1;
      if (v116)
      {
        v117 = *(void **)(v113 + 16);
        AMCP::Log::Scope::get_os_log_t(v117);
        objc_claimAutoreleasedReturnValue();
        AMCP::Portal::IPC::IO_Receiver::register_buffer(v226, v117);

      }
    }
    v113 += 24;
  }
  *(double *)(v226 + 64) = a5;
  *(_DWORD *)(v226 + 72) = v220;
  objc_msgSend(v227, "object");
  v118 = (id)objc_claimAutoreleasedReturnValue();
  v119 = v118;
  if (v118 && MEMORY[0x1B5E5145C](v118) == MEMORY[0x1E0C81338])
  {
    v123 = v119;
    xpc_mach_send_copy_right();

    caulk::make_string((caulk *)"IO Receiver: %u %u", (uint64_t)&v234, *(unsigned int *)(v226 + 56), *(unsigned int *)(v226 + 60));
    caulk::mach::os_workgroup_managed::make();
    v124 = (char *)operator new(0x58uLL);
    *((_QWORD *)v124 + 2) = 0;
    v125 = MEMORY[0x1E0DDB760];
    *(_QWORD *)v124 = &off_1E6993968;
    *((_QWORD *)v124 + 1) = 0;
    *((_QWORD *)v124 + 3) = v125 + 16;
    *(_OWORD *)(v124 + 40) = 0u;
    *(_OWORD *)(v124 + 56) = 0u;
    *(_OWORD *)(v124 + 65) = 0u;
    *((_QWORD *)v124 + 4) = *(_QWORD *)&buf[8];
    *(_QWORD *)&buf[8] = 0;
    caulk::mach::details::release_os_object(0, v126);
    v127 = *((_QWORD *)v124 + 9);
    v128 = *(_OWORD *)(v124 + 40);
    v129 = *(_OWORD *)&buf[32];
    *(_OWORD *)(v124 + 40) = *(_OWORD *)&buf[16];
    v130 = *(_OWORD *)(v124 + 56);
    *(_OWORD *)(v124 + 56) = v129;
    *((_QWORD *)v124 + 9) = v241;
    *(_OWORD *)&buf[16] = v128;
    *(_OWORD *)&buf[32] = v130;
    v241 = v127;
    LOBYTE(v127) = v124[80];
    v124[80] = v242;
    LOBYTE(v242) = v127;
    v237 = (uint64_t (**)())(v124 + 24);
    v238.__r_.__value_.__r.__words[0] = (std::string::size_type)v124;
    std::shared_ptr<AMCP::Log::Scope>::operator=[abi:ne180100](v226 + 152, (__int128 *)&v237);
    v131 = (std::__shared_weak_count *)v238.__r_.__value_.__r.__words[0];
    if (v238.__r_.__value_.__r.__words[0])
    {
      v132 = (unint64_t *)(v238.__r_.__value_.__r.__words[0] + 8);
      do
        v133 = __ldaxr(v132);
      while (__stlxr(v133 - 1, v132));
      if (!v133)
      {
        ((void (*)(std::__shared_weak_count *))v131->__on_zero_shared)(v131);
        std::__shared_weak_count::__release_weak(v131);
      }
    }
    caulk::mach::os_workgroup_managed::~os_workgroup_managed((caulk::mach::os_workgroup_managed *)buf);
    if (SHIBYTE(v234.__r_.__value_.__r.__words[2]) < 0)
      operator delete(v234.__r_.__value_.__l.__data_);
  }
  else
  {
    *(_QWORD *)buf = 0;
    *(_QWORD *)&buf[8] = 0;
    std::shared_ptr<AMCP::Log::Scope>::operator=[abi:ne180100](v226 + 152, (__int128 *)buf);
    v120 = *(std::__shared_weak_count **)&buf[8];
    if (*(_QWORD *)&buf[8])
    {
      v121 = (unint64_t *)(*(_QWORD *)&buf[8] + 8);
      do
        v122 = __ldaxr(v121);
      while (__stlxr(v122 - 1, v121));
      if (!v122)
      {
        ((void (*)(std::__shared_weak_count *))v120->__on_zero_shared)(v120);
        std::__shared_weak_count::__release_weak(v120);
      }
    }
  }

  if (AMCP::Feature_Flags::access_event_link_oop_io(0, v134))
  {
    v135 = *(_QWORD *)(v226 + 16);
    *(_QWORD *)buf = &off_1E6993A08;
    *(_QWORD *)&buf[8] = v226;
    *(_QWORD *)&buf[24] = buf;
    std::function<void ()(caulk::ipc::mapped_memory &)>::operator=((_QWORD *)(v135 + 112), buf);
  }
  else
  {
    v136 = *(_QWORD *)(v226 + 32);
    *(_QWORD *)buf = &off_1E6993A08;
    *(_QWORD *)&buf[8] = v226;
    *(_QWORD *)&buf[24] = buf;
    std::function<void ()(caulk::ipc::mapped_memory &)>::operator=((_QWORD *)(v136 + 120), buf);
  }
  v137 = *(AMCP::Log::Scope_Registry **)&buf[24];
  if (*(_BYTE **)&buf[24] == buf)
  {
    v138 = 4;
    v137 = (AMCP::Log::Scope_Registry *)buf;
LABEL_213:
    v137 = (AMCP::Log::Scope_Registry *)(*(uint64_t (**)(void))(*(_QWORD *)v137 + 8 * v138))();
  }
  else if (*(_QWORD *)&buf[24])
  {
    v138 = 5;
    goto LABEL_213;
  }
  *(_OWORD *)&v238.__r_.__value_.__r.__words[1] = 0uLL;
  v140 = *(uint64_t (***)())(v226 + 16);
  v139 = *(_QWORD *)(v226 + 24);
  if (v139)
  {
    v141 = (unint64_t *)(v139 + 8);
    do
      v142 = __ldxr(v141);
    while (__stxr(v142 + 1, v141));
  }
  v237 = v140;
  v238.__r_.__value_.__r.__words[0] = v139;
  v144 = *(_QWORD *)(v226 + 32);
  v143 = *(_QWORD *)(v226 + 40);
  if (v143)
  {
    v145 = (unint64_t *)(v143 + 8);
    do
      v146 = __ldxr(v145);
    while (__stxr(v146 + 1, v145));
  }
  v238.__r_.__value_.__l.__size_ = v144;
  v238.__r_.__value_.__r.__words[2] = v143;
  if (!*(_QWORD *)(v226 + 152))
  {
    AMCP::Log::Scope_Registry::get(v137);
    AMCP::Log::Scope_Registry::fetch((AMCP::Log::Scope_Registry *)buf, "com.apple.coreaudio", "AMCP");
    v147 = **(NSObject ***)buf;
    AMCP::Log::Scope::get_os_log_t(**(id **)buf);
    objc_claimAutoreleasedReturnValue();
    v148 = *(std::__shared_weak_count **)&buf[8];
    if (*(_QWORD *)&buf[8])
    {
      v149 = (unint64_t *)(*(_QWORD *)&buf[8] + 8);
      do
        v150 = __ldaxr(v149);
      while (__stlxr(v150 - 1, v149));
      if (!v150)
      {
        ((void (*)(std::__shared_weak_count *))v148->__on_zero_shared)(v148);
        std::__shared_weak_count::__release_weak(v148);
      }
    }
    if (os_log_type_enabled(v147, OS_LOG_TYPE_ERROR))
    {
      v177 = pthread_self();
      v178 = pthread_mach_thread_np(v177);
      *(_DWORD *)buf = 67109634;
      *(_DWORD *)&buf[4] = v178;
      *(_WORD *)&buf[8] = 2080;
      *(_QWORD *)&buf[10] = "IO_Receiver.mm";
      *(_WORD *)&buf[18] = 1024;
      *(_DWORD *)&buf[20] = 315;
      _os_log_error_impl(&dword_1B57BA000, v147, OS_LOG_TYPE_ERROR, "%6u %32s:%-5d IO_Receiver::start_message_thread: work group is null!", buf, 0x18u);
    }

  }
  std::string::basic_string[abi:ne180100]<0>(&__p, "io receiver spawner");
  if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0)
    std::string::__init_copy_ctor_external(&v234, __p.__r_.__value_.__l.__data_, __p.__r_.__value_.__l.__size_);
  else
    v234 = __p;
  LOBYTE(v235) = 1;
  v236[0] = 0;
  v236[20] = 0;
  *(_DWORD *)&v236[24] = 1;
  v236[28] = 1;
  v152 = v237;
  v151 = v238.__r_.__value_.__r.__words[0];
  *(_QWORD *)buf = v237;
  *(_QWORD *)&buf[8] = v238.__r_.__value_.__r.__words[0];
  if (v238.__r_.__value_.__r.__words[0])
  {
    v153 = (unint64_t *)(v238.__r_.__value_.__r.__words[0] + 8);
    do
      v154 = __ldxr(v153);
    while (__stxr(v154 + 1, v153));
  }
  v155 = *(_OWORD *)&v238.__r_.__value_.__r.__words[1];
  *(_OWORD *)&buf[16] = *(_OWORD *)&v238.__r_.__value_.__r.__words[1];
  if (v238.__r_.__value_.__r.__words[2])
  {
    v156 = (unint64_t *)(v238.__r_.__value_.__r.__words[2] + 8);
    do
      v157 = __ldxr(v156);
    while (__stxr(v157 + 1, v156));
  }
  *(_QWORD *)&buf[32] = *(_QWORD *)(v226 + 64);
  *(_DWORD *)&buf[40] = *(_DWORD *)(v226 + 72);
  v159 = *(_QWORD *)(v226 + 152);
  v158 = *(_QWORD *)(v226 + 160);
  v241 = v159;
  v242 = v158;
  if (v158)
  {
    v160 = (unint64_t *)(v158 + 8);
    do
      v161 = __ldxr(v160);
    while (__stxr(v161 + 1, v160));
  }
  v243 = *(_DWORD *)(v226 + 56);
  v162 = v243;
  v230.__vftable = 0;
  LOBYTE(v230.__imp_.__imp_) = 0;
  v163 = operator new();
  memset(buf, 0, 32);
  v232.__vftable = *(std::runtime_error_vtbl **)&buf[32];
  LODWORD(v232.__imp_.__imp_) = *(_DWORD *)&buf[40];
  v241 = 0;
  v242 = 0;
  std::__optional_copy_base<std::string,false>::__optional_copy_base[abi:ne180100]((std::string *)v163, (__int128 *)&v234);
  *(_OWORD *)(v163 + 32) = *(_OWORD *)v236;
  *(_OWORD *)(v163 + 45) = *(_OWORD *)&v236[13];
  *(_QWORD *)(v163 + 64) = v152;
  *(_QWORD *)(v163 + 72) = v151;
  *(_OWORD *)(v163 + 80) = v155;
  *(_QWORD *)(v163 + 96) = v232.__vftable;
  *(_DWORD *)(v163 + 104) = v232.__imp_.__imp_;
  *(_QWORD *)(v163 + 112) = v159;
  *(_QWORD *)(v163 + 120) = v158;
  *(_DWORD *)(v163 + 128) = v162;
  v239[0] = v163;
  caulk::thread::start((caulk::thread *)&v230, (caulk::thread::attributes *)v163, (void *(*)(void *))caulk::thread_proxy<std::tuple<caulk::thread::attributes,AMCP::Portal::IPC::IO_Receiver::start_message_thread(void)::$_1,std::tuple<>>>, (void *)v163);
  v239[0] = 0;
  std::unique_ptr<std::tuple<caulk::thread::attributes,AMCP::Portal::IPC::IO_Receiver::start_message_thread(void)::$_1,std::tuple<>>>::~unique_ptr[abi:ne180100](v239);
  if (SHIBYTE(v234.__r_.__value_.__r.__words[2]) < 0)
    operator delete(v234.__r_.__value_.__l.__data_);
  if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0)
    operator delete(__p.__r_.__value_.__l.__data_);
  caulk::thread::~thread((caulk::thread *)&v230);
  if (*((_QWORD *)&v155 + 1))
  {
    v164 = (unint64_t *)(*((_QWORD *)&v155 + 1) + 8);
    do
      v165 = __ldaxr(v164);
    while (__stlxr(v165 - 1, v164));
    if (!v165)
    {
      (*(void (**)(_QWORD))(**((_QWORD **)&v155 + 1) + 16))(*((_QWORD *)&v155 + 1));
      std::__shared_weak_count::__release_weak(*((std::__shared_weak_count **)&v155 + 1));
    }
  }
  v166 = (std::__shared_weak_count *)v238.__r_.__value_.__r.__words[0];
  if (v238.__r_.__value_.__r.__words[0])
  {
    v167 = (unint64_t *)(v238.__r_.__value_.__r.__words[0] + 8);
    do
      v168 = __ldaxr(v167);
    while (__stlxr(v168 - 1, v167));
    if (!v168)
    {
      ((void (*)(std::__shared_weak_count *))v166->__on_zero_shared)(v166);
      std::__shared_weak_count::__release_weak(v166);
    }
  }
  if (v229)
  {
    v169 = (unint64_t *)&v229->__shared_owners_;
    do
      v170 = __ldaxr(v169);
    while (__stlxr(v170 - 1, v169));
    if (!v170)
    {
      ((void (*)(std::__shared_weak_count *))v229->__on_zero_shared)(v229);
      std::__shared_weak_count::__release_weak(v229);
    }
  }
  os_unfair_lock_unlock(lock);
  v45 = 0;
LABEL_261:

  return v45;
}

- (int)destroy_io_receiver:(unsigned int)a3 client_id:(unsigned int)a4
{
  os_unfair_lock_s *v7;
  std::__shared_weak_count *v8;
  unint64_t *p_shared_owners;
  unint64_t v10;
  std::__shared_weak_count *v11;
  unint64_t *v12;
  unint64_t v13;
  os_unfair_lock_t lock;
  std::__shared_weak_count *v16;

  -[Core_Audio_Driver io_receiver_lock](self, "io_receiver_lock");
  v7 = lock;
  os_unfair_lock_lock(lock);
  v8 = v16;
  if (v16)
  {
    p_shared_owners = (unint64_t *)&v16->__shared_owners_;
    do
      v10 = __ldaxr(p_shared_owners);
    while (__stlxr(v10 - 1, p_shared_owners));
    if (!v10)
    {
      ((void (*)(std::__shared_weak_count *))v8->__on_zero_shared)(v8);
      std::__shared_weak_count::__release_weak(v8);
    }
  }
  -[Core_Audio_Driver io_receivers](self, "io_receivers");
  std::__hash_table<std::__hash_value_type<AMCP::Portal::IPC::io_messenger_id_t,std::shared_ptr<AMCP::Portal::IPC::IO_Receiver>>,std::__unordered_map_hasher<AMCP::Portal::IPC::io_messenger_id_t,std::__hash_value_type<AMCP::Portal::IPC::io_messenger_id_t,std::shared_ptr<AMCP::Portal::IPC::IO_Receiver>>,std::hash<AMCP::Portal::IPC::io_messenger_id_t>,std::equal_to<AMCP::Portal::IPC::io_messenger_id_t>,true>,std::__unordered_map_equal<AMCP::Portal::IPC::io_messenger_id_t,std::__hash_value_type<AMCP::Portal::IPC::io_messenger_id_t,std::shared_ptr<AMCP::Portal::IPC::IO_Receiver>>,std::equal_to<AMCP::Portal::IPC::io_messenger_id_t>,std::hash<AMCP::Portal::IPC::io_messenger_id_t>,true>,std::allocator<std::__hash_value_type<AMCP::Portal::IPC::io_messenger_id_t,std::shared_ptr<AMCP::Portal::IPC::IO_Receiver>>>>::__erase_unique<AMCP::Portal::IPC::io_messenger_id_t>(lock, a3, a4);
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
  os_unfair_lock_unlock(v7);
  return 0;
}

- (int)destroy_io_receiver:(unsigned int)a3
{
  unint64_t *p_shared_owners;
  unint64_t v6;
  unint64_t *v7;
  unint64_t v8;
  _QWORD *v9;
  unsigned int *v10;
  unsigned int *v11;
  unsigned int *v12;
  uint64_t v13;
  unint64_t v14;
  unint64_t v15;
  char *v16;
  char *v17;
  unsigned int *v18;
  uint64_t v19;
  unsigned int *v20;
  unint64_t *v21;
  unint64_t v22;
  os_unfair_lock_t lock;
  std::__shared_weak_count *v25;

  -[Core_Audio_Driver io_receiver_lock](self, "io_receiver_lock");
  os_unfair_lock_lock(lock);
  if (v25)
  {
    p_shared_owners = (unint64_t *)&v25->__shared_owners_;
    do
      v6 = __ldaxr(p_shared_owners);
    while (__stlxr(v6 - 1, p_shared_owners));
    if (!v6)
    {
      ((void (*)())v25->__on_zero_shared)();
      std::__shared_weak_count::__release_weak(v25);
    }
  }
  -[Core_Audio_Driver io_receivers](self, "io_receivers");
  if (v25)
  {
    v7 = (unint64_t *)&v25->__shared_owners_;
    do
      v8 = __ldaxr(v7);
    while (__stlxr(v8 - 1, v7));
    if (!v8)
    {
      ((void (*)())v25->__on_zero_shared)();
      std::__shared_weak_count::__release_weak(v25);
    }
  }
  v9 = *(_QWORD **)&lock[4]._os_unfair_lock_opaque;
  if (v9)
  {
    v10 = 0;
    v11 = 0;
    v12 = 0;
    do
    {
      if (*((_DWORD *)v9 + 4) == a3)
      {
        if (v11 >= v12)
        {
          v13 = ((char *)v11 - (char *)v10) >> 3;
          v14 = v13 + 1;
          if ((unint64_t)(v13 + 1) >> 61)
            std::vector<std::tuple<std::pair<std::string,std::string>,std::shared_ptr<AMCP::Log::Scope>>>::__throw_length_error[abi:ne180100]();
          if (v12 - v10 > v14)
            v14 = v12 - v10;
          if ((unint64_t)((char *)v12 - (char *)v10) >= 0x7FFFFFFFFFFFFFF8)
            v15 = 0x1FFFFFFFFFFFFFFFLL;
          else
            v15 = v14;
          if (v15)
          {
            if (v15 >> 61)
              std::__throw_bad_array_new_length[abi:ne180100]();
            v16 = (char *)operator new(8 * v15);
          }
          else
          {
            v16 = 0;
          }
          v17 = &v16[8 * v13];
          *(_QWORD *)v17 = v9[2];
          v18 = (unsigned int *)(v17 + 8);
          while (v11 != v10)
          {
            v19 = *((_QWORD *)v11 - 1);
            v11 -= 2;
            *((_QWORD *)v17 - 1) = v19;
            v17 -= 8;
          }
          v12 = (unsigned int *)&v16[8 * v15];
          if (v10)
            operator delete(v10);
          v10 = (unsigned int *)v17;
          v11 = v18;
        }
        else
        {
          *(_QWORD *)v11 = v9[2];
          v11 += 2;
        }
      }
      v9 = (_QWORD *)*v9;
    }
    while (v9);
    if (v10 != v11)
    {
      v20 = v10;
      do
      {
        -[Core_Audio_Driver io_receivers](self, "io_receivers");
        std::__hash_table<std::__hash_value_type<AMCP::Portal::IPC::io_messenger_id_t,std::shared_ptr<AMCP::Portal::IPC::IO_Receiver>>,std::__unordered_map_hasher<AMCP::Portal::IPC::io_messenger_id_t,std::__hash_value_type<AMCP::Portal::IPC::io_messenger_id_t,std::shared_ptr<AMCP::Portal::IPC::IO_Receiver>>,std::hash<AMCP::Portal::IPC::io_messenger_id_t>,std::equal_to<AMCP::Portal::IPC::io_messenger_id_t>,true>,std::__unordered_map_equal<AMCP::Portal::IPC::io_messenger_id_t,std::__hash_value_type<AMCP::Portal::IPC::io_messenger_id_t,std::shared_ptr<AMCP::Portal::IPC::IO_Receiver>>,std::equal_to<AMCP::Portal::IPC::io_messenger_id_t>,std::hash<AMCP::Portal::IPC::io_messenger_id_t>,true>,std::allocator<std::__hash_value_type<AMCP::Portal::IPC::io_messenger_id_t,std::shared_ptr<AMCP::Portal::IPC::IO_Receiver>>>>::__erase_unique<AMCP::Portal::IPC::io_messenger_id_t>(lock, *v20, v20[1]);
        if (v25)
        {
          v21 = (unint64_t *)&v25->__shared_owners_;
          do
            v22 = __ldaxr(v21);
          while (__stlxr(v22 - 1, v21));
          if (!v22)
          {
            ((void (*)())v25->__on_zero_shared)();
            std::__shared_weak_count::__release_weak(v25);
          }
        }
        v20 += 2;
      }
      while (v20 != v11);
    }
    if (v10)
      operator delete(v10);
  }
  os_unfair_lock_unlock(lock);
  return 0;
}

- (void)add_device_client:(unsigned int)a3 client_id:(unsigned int)a4 process_id:(int)a5 is_native_endianess:(BOOL)a6 bundle_id:(id)a7 reply:(id)a8
{
  uint64_t v12;
  id v14;
  void (**v15)(id, uint64_t);
  AudioServerPlugInDriverInterface **v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;

  v12 = *(_QWORD *)&a3;
  v19 = *MEMORY[0x1E0C80C00];
  v14 = a7;
  v15 = (void (**)(id, uint64_t))a8;
  v16 = -[Core_Audio_Driver asp_interface](self, "asp_interface", __PAIR64__(a5, a4), a6, v14, v19);
  v17 = ((uint64_t (*)(AudioServerPlugInDriverInterface **, uint64_t, uint64_t *))(*v16)->AddDeviceClient)(v16, v12, &v18);
  v15[2](v15, v17);

}

- (void)remove_device_client:(unsigned int)a3 client_id:(unsigned int)a4 process_id:(int)a5 is_native_endianess:(BOOL)a6 bundle_id:(id)a7 reply:(id)a8
{
  uint64_t v12;
  id v14;
  void (**v15)(id, uint64_t);
  AudioServerPlugInDriverInterface **v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;

  v12 = *(_QWORD *)&a3;
  v19 = *MEMORY[0x1E0C80C00];
  v14 = a7;
  v15 = (void (**)(id, uint64_t))a8;
  v16 = -[Core_Audio_Driver asp_interface](self, "asp_interface", __PAIR64__(a5, a4), a6, v14, v19);
  v17 = ((uint64_t (*)(AudioServerPlugInDriverInterface **, uint64_t, uint64_t *))(*v16)->RemoveDeviceClient)(v16, v12, &v18);
  v15[2](v15, v17);

}

- (void)create_device:(id)a3 client_id:(unsigned int)a4 process_id:(int)a5 is_native_endianess:(BOOL)a6 bundle_id:(id)a7 reply:(id)a8
{
  id v14;
  id v15;
  void (**v16)(id, uint64_t, _QWORD);
  AudioServerPlugInDriverInterface **v17;
  uint64_t v18;
  unsigned int v19;
  _DWORD v20[2];
  _BOOL8 v21;
  id v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v14 = a3;
  v15 = a7;
  v16 = (void (**)(id, uint64_t, _QWORD))a8;
  v19 = 0;
  v20[0] = a4;
  v20[1] = a5;
  v22 = v15;
  v21 = a6;
  v17 = -[Core_Audio_Driver asp_interface](self, "asp_interface");
  v18 = ((uint64_t (*)(AudioServerPlugInDriverInterface **, id, _DWORD *, unsigned int *))(*v17)->CreateDevice)(v17, v14, v20, &v19);
  v16[2](v16, v18, v19);

}

- (void)destroy_device:(unsigned int)a3 reply:(id)a4
{
  uint64_t v4;
  void (**v6)(id, uint64_t);
  AudioServerPlugInDriverInterface **v7;
  uint64_t v8;

  v4 = *(_QWORD *)&a3;
  v6 = (void (**)(id, uint64_t))a4;
  v7 = -[Core_Audio_Driver asp_interface](self, "asp_interface");
  v8 = ((uint64_t (*)(AudioServerPlugInDriverInterface **, uint64_t))(*v7)->DestroyDevice)(v7, v4);
  -[Core_Audio_Driver destroy_io_receiver:](self, "destroy_io_receiver:", v4);
  v6[2](v6, v8);

}

- (void)object_was_destroyed:(unsigned int)a3 reply:(id)a4
{
  void (**v6)(id, _QWORD);
  std::__shared_weak_count *v7;
  unint64_t *p_shared_owners;
  unint64_t v9;
  Property_Type_Info *v10;
  std::__shared_weak_count *v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v6 = (void (**)(id, _QWORD))a4;
  -[Core_Audio_Driver m_property_type_info](self, "m_property_type_info");
  Property_Type_Info::remove_custom_properties(v10, a3);
  v7 = v11;
  if (v11)
  {
    p_shared_owners = (unint64_t *)&v11->__shared_owners_;
    do
      v9 = __ldaxr(p_shared_owners);
    while (__stlxr(v9 - 1, p_shared_owners));
    if (!v9)
    {
      ((void (*)(std::__shared_weak_count *))v7->__on_zero_shared)(v7);
      std::__shared_weak_count::__release_weak(v7);
    }
  }
  v6[2](v6, 0);

}

- (int)handle_register_buffer:(dict)a3
{
  os_unfair_lock_s *buffer_key;
  unint64_t v6;
  unint64_t v7;
  os_unfair_lock_s *v8;
  unint64_t *v9;
  unint64_t v10;
  _OWORD *v11;
  _OWORD *v12;
  unint64_t *p_shared_owners;
  unint64_t v14;
  unint64_t *v15;
  unint64_t v16;
  AMCP::Log::Scope_Registry *v17;
  _OWORD *v18;
  unint64_t *v19;
  unint64_t v20;
  NSObject *v21;
  std::__shared_weak_count *v22;
  unint64_t *v23;
  unint64_t v24;
  _opaque_pthread_t *v25;
  mach_port_t v26;
  unint64_t v27;
  unint64_t v28;
  uint64_t v29;
  unint64_t v30;
  unint64_t v31;
  uint64_t v32;
  unint64_t v33;
  char *v34;
  char *v35;
  uint64_t v36;
  id *v37;
  id *v38;
  id *v39;
  id *v40;
  void *v41;
  void *v42;
  unint64_t *v43;
  unint64_t v44;
  _QWORD *v45;
  unint64_t *v46;
  unint64_t v47;
  std::__shared_weak_count *v48;
  unint64_t *v49;
  unint64_t v50;
  std::__shared_weak_count *v51;
  unint64_t *v52;
  unint64_t v53;
  uint64_t v54;
  uint64_t *v56;
  std::__shared_weak_count *v57;
  os_unfair_lock_t lock;
  __int128 v59;
  __int16 v60;
  int v61;
  __int16 v62;
  int v63;
  __int16 v64;
  int v65;
  uint64_t v66;

  v66 = *MEMORY[0x1E0C80C00];
  buffer_key = (os_unfair_lock_s *)get_buffer_key((const dict *)a3.var0.fObj);
  v7 = v6;
  -[Core_Audio_Driver io_receiver_lock](self, "io_receiver_lock");
  v8 = lock;
  os_unfair_lock_lock(lock);
  if ((_QWORD)v59)
  {
    v9 = (unint64_t *)(v59 + 8);
    do
      v10 = __ldaxr(v9);
    while (__stlxr(v10 - 1, v9));
    if (!v10)
    {
      (*(void (**)(_QWORD))(*(_QWORD *)v59 + 16))(v59);
      std::__shared_weak_count::__release_weak((std::__shared_weak_count *)v59);
    }
  }
  -[Core_Audio_Driver io_buffer_list](self, "io_buffer_list");
  v11 = *(_OWORD **)&lock->_os_unfair_lock_opaque;
  -[Core_Audio_Driver io_buffer_list](self, "io_buffer_list");
  v12 = (_OWORD *)v56[1];
  if (v11 != v12)
  {
    while (*v11 != __PAIR128__(v7, (unint64_t)buffer_key))
    {
      v11 = (_OWORD *)((char *)v11 + 24);
      if (v11 == v12)
      {
        v11 = (_OWORD *)v56[1];
        break;
      }
    }
  }
  if (v57)
  {
    p_shared_owners = (unint64_t *)&v57->__shared_owners_;
    do
      v14 = __ldaxr(p_shared_owners);
    while (__stlxr(v14 - 1, p_shared_owners));
    if (!v14)
    {
      ((void (*)())v57->__on_zero_shared)();
      std::__shared_weak_count::__release_weak(v57);
    }
  }
  if ((_QWORD)v59)
  {
    v15 = (unint64_t *)(v59 + 8);
    do
      v16 = __ldaxr(v15);
    while (__stlxr(v16 - 1, v15));
    if (!v16)
    {
      (*(void (**)(_QWORD))(*(_QWORD *)v59 + 16))(v59);
      std::__shared_weak_count::__release_weak((std::__shared_weak_count *)v59);
    }
  }
  v17 = (AMCP::Log::Scope_Registry *)-[Core_Audio_Driver io_buffer_list](self, "io_buffer_list");
  v18 = *(_OWORD **)&lock[2]._os_unfair_lock_opaque;
  if ((_QWORD)v59)
  {
    v19 = (unint64_t *)(v59 + 8);
    do
      v20 = __ldaxr(v19);
    while (__stlxr(v20 - 1, v19));
    if (!v20)
    {
      (*(void (**)(_QWORD))(*(_QWORD *)v59 + 16))(v59);
      std::__shared_weak_count::__release_weak((std::__shared_weak_count *)v59);
    }
  }
  if (v11 != v18)
  {
    AMCP::Log::Scope_Registry::get(v17);
    AMCP::Log::Scope_Registry::fetch((AMCP::Log::Scope_Registry *)&lock, "com.apple.coreaudio", "AMCP");
    v21 = *(NSObject **)&lock->_os_unfair_lock_opaque;
    AMCP::Log::Scope::get_os_log_t(*(id *)&lock->_os_unfair_lock_opaque);
    objc_claimAutoreleasedReturnValue();
    v22 = (std::__shared_weak_count *)v59;
    if ((_QWORD)v59)
    {
      v23 = (unint64_t *)(v59 + 8);
      do
        v24 = __ldaxr(v23);
      while (__stlxr(v24 - 1, v23));
      if (!v24)
      {
        ((void (*)(std::__shared_weak_count *))v22->__on_zero_shared)(v22);
        std::__shared_weak_count::__release_weak(v22);
      }
    }
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
    {
      v25 = pthread_self();
      v26 = pthread_mach_thread_np(v25);
      LODWORD(lock) = 67110402;
      HIDWORD(lock) = v26;
      LOWORD(v59) = 2080;
      *(_QWORD *)((char *)&v59 + 2) = "Core_Audio_Driver.mm";
      WORD5(v59) = 1024;
      HIDWORD(v59) = 499;
      v60 = 1024;
      v61 = (int)buffer_key;
      v62 = 1024;
      v63 = HIDWORD(buffer_key);
      v64 = 1024;
      v65 = v7;
      _os_log_error_impl(&dword_1B57BA000, v21, OS_LOG_TYPE_ERROR, "%6u %32s:%-5d Buffer was already registered! device id: %u, client id: %u, stream id: %u", (uint8_t *)&lock, 0x2Au);
    }
    goto LABEL_76;
  }
  -[Core_Audio_Driver io_buffer_list](self, "io_buffer_list");
  lock = buffer_key;
  *(_QWORD *)&v59 = v7;
  applesauce::xpc::object::object((applesauce::xpc::object *)((char *)&v59 + 8), *(const applesauce::xpc::object **)a3.var0.fObj);
  v27 = v56[1];
  v28 = v56[2];
  if (v27 < v28)
  {
    v29 = std::pair<AMCP::Portal::IPC::shared_buffer_info_t,applesauce::xpc::dict>::pair[abi:ne180100](v27, (uint64_t)&lock)+ 24;
    v56[1] = v29;
    goto LABEL_52;
  }
  v30 = 0xAAAAAAAAAAAAAAABLL * ((uint64_t)(v27 - *v56) >> 3);
  if (v30 + 1 > 0xAAAAAAAAAAAAAAALL)
    std::vector<std::tuple<std::pair<std::string,std::string>,std::shared_ptr<AMCP::Log::Scope>>>::__throw_length_error[abi:ne180100]();
  v31 = 0xAAAAAAAAAAAAAAABLL * ((uint64_t)(v28 - *v56) >> 3);
  v32 = 2 * v31;
  if (2 * v31 <= v30 + 1)
    v32 = v30 + 1;
  if (v31 >= 0x555555555555555)
    v33 = 0xAAAAAAAAAAAAAAALL;
  else
    v33 = v32;
  if (v33)
  {
    if (v33 > 0xAAAAAAAAAAAAAAALL)
      std::__throw_bad_array_new_length[abi:ne180100]();
    v34 = (char *)operator new(24 * v33);
  }
  else
  {
    v34 = 0;
  }
  v35 = &v34[24 * v33];
  v36 = std::pair<AMCP::Portal::IPC::shared_buffer_info_t,applesauce::xpc::dict>::pair[abi:ne180100]((uint64_t)&v34[24 * v30], (uint64_t)&lock);
  v29 = v36 + 24;
  v38 = (id *)*v56;
  v37 = (id *)v56[1];
  if (v37 == (id *)*v56)
  {
    *v56 = v36;
    v56[1] = v29;
    v56[2] = (uint64_t)v35;
    if (!v37)
      goto LABEL_52;
    goto LABEL_51;
  }
  do
  {
    v37 -= 3;
    v36 = std::pair<AMCP::Portal::IPC::shared_buffer_info_t,applesauce::xpc::dict>::pair[abi:ne180100](v36 - 24, (uint64_t)v37);
  }
  while (v37 != v38);
  v39 = (id *)*v56;
  v37 = (id *)v56[1];
  *v56 = v36;
  v56[1] = v29;
  v56[2] = (uint64_t)v35;
  if (v37 != v39)
  {
    do
    {
      v41 = *(v37 - 1);
      v40 = v37 - 1;
      *v40 = 0;

      v37 = v40 - 2;
    }
    while (v37 != v39);
    v37 = v39;
  }
  if (v37)
LABEL_51:
    operator delete(v37);
LABEL_52:
  v56[1] = v29;
  v42 = (void *)*((_QWORD *)&v59 + 1);
  *((_QWORD *)&v59 + 1) = 0;

  if (v57)
  {
    v43 = (unint64_t *)&v57->__shared_owners_;
    do
      v44 = __ldaxr(v43);
    while (__stlxr(v44 - 1, v43));
    if (!v44)
    {
      ((void (*)())v57->__on_zero_shared)();
      std::__shared_weak_count::__release_weak(v57);
    }
  }
  -[Core_Audio_Driver io_receivers](self, "io_receivers");
  v45 = *(_QWORD **)&lock[4]._os_unfair_lock_opaque;
  -[Core_Audio_Driver io_receivers](self, "io_receivers");
  for (; v45; v45 = (_QWORD *)*v45)
  {
    if ((os_unfair_lock_s *)v45[2] == buffer_key)
      break;
  }
  if (v57)
  {
    v46 = (unint64_t *)&v57->__shared_owners_;
    do
      v47 = __ldaxr(v46);
    while (__stlxr(v47 - 1, v46));
    if (!v47)
    {
      ((void (*)())v57->__on_zero_shared)();
      std::__shared_weak_count::__release_weak(v57);
    }
  }
  v48 = (std::__shared_weak_count *)v59;
  if ((_QWORD)v59)
  {
    v49 = (unint64_t *)(v59 + 8);
    do
      v50 = __ldaxr(v49);
    while (__stlxr(v50 - 1, v49));
    if (!v50)
    {
      ((void (*)(std::__shared_weak_count *))v48->__on_zero_shared)(v48);
      std::__shared_weak_count::__release_weak(v48);
    }
  }
  -[Core_Audio_Driver io_receivers](self, "io_receivers");
  v51 = (std::__shared_weak_count *)v59;
  if ((_QWORD)v59)
  {
    v52 = (unint64_t *)(v59 + 8);
    do
      v53 = __ldaxr(v52);
    while (__stlxr(v53 - 1, v52));
    if (!v53)
    {
      ((void (*)(std::__shared_weak_count *))v51->__on_zero_shared)(v51);
      std::__shared_weak_count::__release_weak(v51);
      if (!v45)
        goto LABEL_77;
      goto LABEL_75;
    }
  }
  if (v45)
  {
LABEL_75:
    v54 = v45[3];
    v21 = *(NSObject **)a3.var0.fObj;
    AMCP::Log::Scope::get_os_log_t(v21);
    objc_claimAutoreleasedReturnValue();
    AMCP::Portal::IPC::IO_Receiver::register_buffer(v54, v21);
LABEL_76:

  }
LABEL_77:
  os_unfair_lock_unlock(v8);
  return 0;
}

- (int)handle_unregister_buffer:(dict)a3
{
  unint64_t buffer_key;
  unint64_t v6;
  unint64_t v7;
  os_unfair_lock_s *v8;
  unint64_t *v9;
  unint64_t v10;
  void (__cdecl *v11)(std::runtime_error *__hidden);
  void (__cdecl *v12)(std::runtime_error *__hidden);
  unint64_t *v13;
  unint64_t v14;
  unint64_t *v15;
  unint64_t v16;
  AMCP::Log::Scope_Registry *v17;
  void (__cdecl *v18)(std::runtime_error *__hidden);
  unint64_t *v19;
  unint64_t v20;
  os_unfair_lock_t v21;
  void (__cdecl *v22)(std::runtime_error *__hidden);
  id v23;
  xpc_object_t v24;
  void *v25;
  void *v26;
  void (__cdecl *v27)(std::runtime_error *__hidden);
  void (__cdecl *v28)(std::runtime_error *__hidden);
  unint64_t *v29;
  unint64_t v30;
  _QWORD *v31;
  unint64_t *v32;
  unint64_t v33;
  unint64_t *v34;
  unint64_t v35;
  unint64_t *v36;
  unint64_t v37;
  _QWORD *v38;
  NSObject *v39;
  xpc_object_t v40;
  id v41;
  void *v42;
  xpc_object_t v43;
  id v44;
  unsigned int v45;
  unsigned int v46;
  unsigned int v47;
  unsigned int v48;
  _QWORD *v49;
  uint64_t *v50;
  int8x8_t v51;
  unint64_t v52;
  uint8x8_t v53;
  std::__shared_weak_count *v54;
  unint64_t *v55;
  unint64_t v56;
  int v57;
  _opaque_pthread_t *v58;
  mach_port_t v59;
  uint64_t *v60;
  uint64_t *v61;
  unint64_t v62;
  unint64_t v63;
  uint64_t v64;
  unint64_t v65;
  xpc_object_t v66;
  xpc_object_t v67;
  xpc_object_t v68;
  xpc_object_t v69;
  id v70;
  NSObject *v72;
  _opaque_pthread_t *v73;
  mach_port_t v74;
  void *exception;
  __int128 v76;
  uint64_t v77;
  uint64_t (**v78)();
  __int128 v79;
  uint64_t v80;
  std::runtime_error v81;
  std::runtime_error v82;
  void *v83;
  uint64_t v84;
  uint64_t v85;
  uint64_t v86;
  int v87;
  char v88;
  unsigned int v89[4];
  xpc_object_t v90;
  xpc_object_t v91;
  xpc_object_t v92;
  xpc_object_t v93;
  xpc_object_t v94;
  id v95;
  uint8_t buf[8];
  _BYTE v97[10];
  __int16 v98;
  int v99;
  __int16 v100;
  _BYTE v101[22];
  int v102;
  uint64_t v103;

  v103 = *MEMORY[0x1E0C80C00];
  buffer_key = get_buffer_key((const dict *)a3.var0.fObj);
  v7 = v6;
  -[Core_Audio_Driver io_receiver_lock](self, "io_receiver_lock");
  v8 = *(os_unfair_lock_s **)buf;
  os_unfair_lock_lock(*(os_unfair_lock_t *)buf);
  if (*(_QWORD *)v97)
  {
    v9 = (unint64_t *)(*(_QWORD *)v97 + 8);
    do
      v10 = __ldaxr(v9);
    while (__stlxr(v10 - 1, v9));
    if (!v10)
    {
      (*(void (**)(_QWORD))(**(_QWORD **)v97 + 16))(*(_QWORD *)v97);
      std::__shared_weak_count::__release_weak(*(std::__shared_weak_count **)v97);
    }
  }
  -[Core_Audio_Driver io_buffer_list](self, "io_buffer_list");
  v11 = **(void (__cdecl ***)(std::runtime_error *__hidden))buf;
  -[Core_Audio_Driver io_buffer_list](self, "io_buffer_list");
  v12 = v82.~runtime_error_0;
  if (v11 != v12)
  {
    while (*(_OWORD *)v11 != __PAIR128__(v7, buffer_key))
    {
      v11 = (void (__cdecl *)(std::runtime_error *__hidden))((char *)v11 + 24);
      if (v11 == v12)
      {
        v11 = v82.~runtime_error_0;
        break;
      }
    }
  }
  if (v82.__imp_.__imp_)
  {
    v13 = (unint64_t *)(v82.__imp_.__imp_ + 8);
    do
      v14 = __ldaxr(v13);
    while (__stlxr(v14 - 1, v13));
    if (!v14)
    {
      (*(void (**)(const char *))(*(_QWORD *)v82.__imp_.__imp_ + 16))(v82.__imp_.__imp_);
      std::__shared_weak_count::__release_weak((std::__shared_weak_count *)v82.__imp_.__imp_);
    }
  }
  if (*(_QWORD *)v97)
  {
    v15 = (unint64_t *)(*(_QWORD *)v97 + 8);
    do
      v16 = __ldaxr(v15);
    while (__stlxr(v16 - 1, v15));
    if (!v16)
    {
      (*(void (**)(_QWORD))(**(_QWORD **)v97 + 16))(*(_QWORD *)v97);
      std::__shared_weak_count::__release_weak(*(std::__shared_weak_count **)v97);
    }
  }
  v17 = (AMCP::Log::Scope_Registry *)-[Core_Audio_Driver io_buffer_list](self, "io_buffer_list");
  v18 = *(void (__cdecl **)(std::runtime_error *__hidden))(*(_QWORD *)buf + 8);
  if (*(_QWORD *)v97)
  {
    v19 = (unint64_t *)(*(_QWORD *)v97 + 8);
    do
      v20 = __ldaxr(v19);
    while (__stlxr(v20 - 1, v19));
    if (!v20)
    {
      (*(void (**)(_QWORD))(**(_QWORD **)v97 + 16))(*(_QWORD *)v97);
      std::__shared_weak_count::__release_weak(*(std::__shared_weak_count **)v97);
    }
  }
  if (v11 == v18)
  {
    AMCP::Log::Scope_Registry::get(v17);
    AMCP::Log::Scope_Registry::fetch((AMCP::Log::Scope_Registry *)buf, "com.apple.coreaudio", "AMCP");
    v39 = **(NSObject ***)buf;
    AMCP::Log::Scope::get_os_log_t(**(id **)buf);
    objc_claimAutoreleasedReturnValue();
    v54 = *(std::__shared_weak_count **)v97;
    if (*(_QWORD *)v97)
    {
      v55 = (unint64_t *)(*(_QWORD *)v97 + 8);
      do
        v56 = __ldaxr(v55);
      while (__stlxr(v56 - 1, v55));
      if (!v56)
      {
        ((void (*)(std::__shared_weak_count *))v54->__on_zero_shared)(v54);
        std::__shared_weak_count::__release_weak(v54);
      }
    }
    v57 = 560947818;
    if (os_log_type_enabled(v39, OS_LOG_TYPE_ERROR))
    {
      v58 = pthread_self();
      v59 = pthread_mach_thread_np(v58);
      *(_DWORD *)buf = 67110402;
      *(_DWORD *)&buf[4] = v59;
      *(_WORD *)v97 = 2080;
      *(_QWORD *)&v97[2] = "Core_Audio_Driver.mm";
      v98 = 1024;
      v99 = 551;
      v100 = 1024;
      *(_DWORD *)v101 = buffer_key;
      *(_WORD *)&v101[4] = 1024;
      *(_DWORD *)&v101[6] = HIDWORD(buffer_key);
      *(_WORD *)&v101[10] = 1024;
      *(_DWORD *)&v101[12] = v7;
      _os_log_error_impl(&dword_1B57BA000, v39, OS_LOG_TYPE_ERROR, "%6u %32s:%-5d Could not find buffer key in map! device id: %u, client id: %u, stream id: %u", buf, 0x2Au);
    }
    goto LABEL_94;
  }
  -[Core_Audio_Driver io_buffer_list](self, "io_buffer_list");
  v21 = *(os_unfair_lock_t *)buf;
  v22 = *(void (__cdecl **)(std::runtime_error *__hidden))(*(_QWORD *)buf + 8);
  if ((void (__cdecl *)(std::runtime_error *__hidden))((char *)v11 + 24) != v22)
  {
    do
    {
      *(_OWORD *)v11 = *(_OWORD *)((char *)v11 + 24);
      v23 = *((id *)v11 + 5);
      v24 = xpc_null_create();
      v25 = (void *)*((_QWORD *)v11 + 5);
      *((_QWORD *)v11 + 5) = v24;

      v26 = (void *)*((_QWORD *)v11 + 2);
      *((_QWORD *)v11 + 2) = v23;

      v27 = (void (__cdecl *)(std::runtime_error *__hidden))((char *)v11 + 24);
      v28 = (void (__cdecl *)(std::runtime_error *__hidden))((char *)v11 + 48);
      v11 = (void (__cdecl *)(std::runtime_error *__hidden))((char *)v11 + 24);
    }
    while (v28 != v22);
    v11 = v27;
  }
  std::vector<std::pair<AMCP::Portal::IPC::shared_buffer_info_t,applesauce::xpc::dict>>::__base_destruct_at_end[abi:ne180100]((uint64_t)v21, (uint64_t)v11);
  if (*(_QWORD *)v97)
  {
    v29 = (unint64_t *)(*(_QWORD *)v97 + 8);
    do
      v30 = __ldaxr(v29);
    while (__stlxr(v30 - 1, v29));
    if (!v30)
    {
      (*(void (**)(_QWORD))(**(_QWORD **)v97 + 16))(*(_QWORD *)v97);
      std::__shared_weak_count::__release_weak(*(std::__shared_weak_count **)v97);
    }
  }
  -[Core_Audio_Driver io_receivers](self, "io_receivers");
  v31 = *(_QWORD **)(*(_QWORD *)buf + 16);
  -[Core_Audio_Driver io_receivers](self, "io_receivers");
  for (; v31; v31 = (_QWORD *)*v31)
  {
    if (v31[2] == buffer_key)
      break;
  }
  if (v82.__imp_.__imp_)
  {
    v32 = (unint64_t *)(v82.__imp_.__imp_ + 8);
    do
      v33 = __ldaxr(v32);
    while (__stlxr(v33 - 1, v32));
    if (!v33)
    {
      (*(void (**)(const char *))(*(_QWORD *)v82.__imp_.__imp_ + 16))(v82.__imp_.__imp_);
      std::__shared_weak_count::__release_weak((std::__shared_weak_count *)v82.__imp_.__imp_);
    }
  }
  if (*(_QWORD *)v97)
  {
    v34 = (unint64_t *)(*(_QWORD *)v97 + 8);
    do
      v35 = __ldaxr(v34);
    while (__stlxr(v35 - 1, v34));
    if (!v35)
    {
      (*(void (**)(_QWORD))(**(_QWORD **)v97 + 16))(*(_QWORD *)v97);
      std::__shared_weak_count::__release_weak(*(std::__shared_weak_count **)v97);
    }
  }
  -[Core_Audio_Driver io_receivers](self, "io_receivers");
  if (!*(_QWORD *)v97)
    goto LABEL_51;
  v36 = (unint64_t *)(*(_QWORD *)v97 + 8);
  do
    v37 = __ldaxr(v36);
  while (__stlxr(v37 - 1, v36));
  if (!v37)
  {
    (*(void (**)(_QWORD))(**(_QWORD **)v97 + 16))(*(_QWORD *)v97);
    std::__shared_weak_count::__release_weak(*(std::__shared_weak_count **)v97);
    if (v31)
      goto LABEL_52;
  }
  else
  {
LABEL_51:
    if (v31)
    {
LABEL_52:
      v38 = (_QWORD *)v31[3];
      AMCP::Log::Scope::get_os_log_t(*(id *)a3.var0.fObj);
      v39 = (id)objc_claimAutoreleasedReturnValue();
      v40 = v39;
      if (!v39)
        v40 = xpc_null_create();

      v41 = v40;
      v42 = v41;
      v95 = v41;
      if (!v41 || MEMORY[0x1B5E5145C](v41) != MEMORY[0x1E0C812F8])
      {
        v43 = xpc_null_create();
        v44 = v95;
        v95 = v43;

      }
      *(_QWORD *)buf = &v95;
      *(_QWORD *)v97 = "buffer shared memory";
      applesauce::xpc::dict::object_proxy::operator applesauce::xpc::object(&v94, (uint64_t)buf);
      *(_QWORD *)buf = &v95;
      *(_QWORD *)v97 = "buffer device id";
      applesauce::xpc::dict::object_proxy::operator applesauce::xpc::object(&v93, (uint64_t)buf);
      v45 = applesauce::xpc::dyn_cast_or_default((applesauce::xpc *)&v93, 0);
      *(_QWORD *)buf = &v95;
      *(_QWORD *)v97 = "buffer client id";
      applesauce::xpc::dict::object_proxy::operator applesauce::xpc::object(&v92, (uint64_t)buf);
      v46 = applesauce::xpc::dyn_cast_or_default((applesauce::xpc *)&v92, 0);
      *(_QWORD *)buf = &v95;
      *(_QWORD *)v97 = "buffer stream id";
      applesauce::xpc::dict::object_proxy::operator applesauce::xpc::object(&v91, (uint64_t)buf);
      v47 = applesauce::xpc::dyn_cast_or_default((applesauce::xpc *)&v91, 0);
      *(_QWORD *)buf = &v95;
      *(_QWORD *)v97 = "buffer type";
      applesauce::xpc::dict::object_proxy::operator applesauce::xpc::object(&v90, (uint64_t)buf);
      v48 = applesauce::xpc::dyn_cast_or_default((applesauce::xpc *)&v90, 0);
      v89[0] = v45;
      v89[1] = v46;
      v49 = v38 + 10;
      v89[2] = v47;
      v89[3] = v48;
      v50 = std::__hash_table<std::__hash_value_type<AMCP::Portal::IPC::shared_buffer_info_t,std::tuple<NSObject  {objcproto13OS_xpc_object}* {__strong},std::shared_ptr<caulk::ipc::mapped_memory>,void *>>,std::__unordered_map_hasher<AMCP::Portal::IPC::shared_buffer_info_t,std::__hash_value_type<AMCP::Portal::IPC::shared_buffer_info_t,std::tuple<NSObject  {objcproto13OS_xpc_object}* {__strong},std::shared_ptr<caulk::ipc::mapped_memory>,void *>>,std::hash<AMCP::Portal::IPC::shared_buffer_info_t>,std::equal_to<AMCP::Portal::IPC::shared_buffer_info_t>,true>,std::__unordered_map_equal<AMCP::Portal::IPC::shared_buffer_info_t,std::__hash_value_type<AMCP::Portal::IPC::shared_buffer_info_t,std::tuple<NSObject  {objcproto13OS_xpc_object}* {__strong},std::shared_ptr<caulk::ipc::mapped_memory>,void *>>,std::equal_to<AMCP::Portal::IPC::shared_buffer_info_t>,std::hash<AMCP::Portal::IPC::shared_buffer_info_t>,true>,std::allocator<std::__hash_value_type<AMCP::Portal::IPC::shared_buffer_info_t,std::tuple<NSObject  {objcproto13OS_xpc_object}* {__strong},std::shared_ptr<caulk::ipc::mapped_memory>,void *>>>>::find<AMCP::Portal::IPC::shared_buffer_info_t>(v38 + 10, v89);
      if (!v50)
      {
        AMCP::Log::Scope_Registry::get(0);
        AMCP::Log::Scope_Registry::fetch((AMCP::Log::Scope_Registry *)buf, "com.apple.coreaudio", "AMCP");
        v72 = **(NSObject ***)buf;
        AMCP::Log::Scope::get_os_log_t(**(id **)buf);
        objc_claimAutoreleasedReturnValue();
        std::shared_ptr<AMCP::Log::Scope>::~shared_ptr[abi:ne180100]((uint64_t)buf);
        if (os_log_type_enabled(v72, OS_LOG_TYPE_ERROR))
        {
          v73 = pthread_self();
          v74 = pthread_mach_thread_np(v73);
          *(_DWORD *)buf = 67109890;
          *(_DWORD *)&buf[4] = v74;
          *(_WORD *)v97 = 2080;
          *(_QWORD *)&v97[2] = "IO_Receiver.mm";
          v98 = 1024;
          v99 = 182;
          v100 = 2080;
          *(_QWORD *)v101 = "find_result == m_shared_memory_map.end()";
          _os_log_error_impl(&dword_1B57BA000, v72, OS_LOG_TYPE_ERROR, "%6u %32s:%-5d Throwing Exception: %s buffer key doesnt exist in the map!", buf, 0x22u);
        }

        AMCP::Utility::With_Realtime_Disabled::With_Realtime_Disabled((AMCP::Utility::With_Realtime_Disabled *)&v88);
        exception = __cxa_allocate_exception(0x40uLL);
        std::runtime_error::runtime_error(&v81, "buffer key doesnt exist in the map!");
        std::runtime_error::runtime_error(&v82, &v81);
        v84 = 0;
        v85 = 0;
        v86 = 0;
        v87 = -1;
        v82.__vftable = (std::runtime_error_vtbl *)&off_1E69A1FB8;
        v83 = &unk_1E69A1FE0;
        boost::exception_detail::clone_impl<boost::exception_detail::error_info_injector<std::runtime_error>>::clone_impl((uint64_t)buf, (uint64_t)&v82);
        *(_QWORD *)&v101[6] = "void AMCP::Portal::IPC::IO_Receiver::unregister_buffer(__strong xpc_object_t)";
        *(_QWORD *)&v101[14] = "/Library/Caches/com.apple.xbs/Sources/AudioHAL/Source/AMCP/ASP/Portal/Driver/IO_Receiver.mm";
        v102 = 182;
        applesauce::backtrace::snapshot_N<64>::snapshot_N((char **)&v76);
        v78 = off_1E69A20A0;
        v79 = v76;
        v80 = v77;
        v76 = 0uLL;
        v77 = 0;
        boost::exception_detail::set_info_rv<boost::error_info<applesauce::exceptions::tag_backtrace,applesauce::backtrace::snapshot_N<64>>>::set<boost::exception_detail::clone_impl<boost::exception_detail::error_info_injector<std::runtime_error>>>((uint64_t)buf, (uint64_t)&v78);
        boost::exception_detail::clone_impl<boost::exception_detail::error_info_injector<std::runtime_error>>::clone_impl((uint64_t)exception, (uint64_t)buf);
      }
      v51 = (int8x8_t)v38[11];
      v52 = v50[1];
      v53 = (uint8x8_t)vcnt_s8(v51);
      v53.i16[0] = vaddlv_u8(v53);
      if (v53.u32[0] > 1uLL)
      {
        if (v52 >= *(_QWORD *)&v51)
          v52 %= *(_QWORD *)&v51;
      }
      else
      {
        v52 &= *(_QWORD *)&v51 - 1;
      }
      v60 = *(uint64_t **)(*v49 + 8 * v52);
      do
      {
        v61 = v60;
        v60 = (uint64_t *)*v60;
      }
      while (v60 != v50);
      if (v61 == v38 + 12)
        goto LABEL_84;
      v62 = v61[1];
      if (v53.u32[0] > 1uLL)
      {
        if (v62 >= *(_QWORD *)&v51)
          v62 %= *(_QWORD *)&v51;
      }
      else
      {
        v62 &= *(_QWORD *)&v51 - 1;
      }
      if (v62 != v52)
      {
LABEL_84:
        if (!*v50)
          goto LABEL_85;
        v63 = *(_QWORD *)(*v50 + 8);
        if (v53.u32[0] > 1uLL)
        {
          if (v63 >= *(_QWORD *)&v51)
            v63 %= *(_QWORD *)&v51;
        }
        else
        {
          v63 &= *(_QWORD *)&v51 - 1;
        }
        if (v63 != v52)
LABEL_85:
          *(_QWORD *)(*v49 + 8 * v52) = 0;
      }
      v64 = *v50;
      if (*v50)
      {
        v65 = *(_QWORD *)(v64 + 8);
        if (v53.u32[0] > 1uLL)
        {
          if (v65 >= *(_QWORD *)&v51)
            v65 %= *(_QWORD *)&v51;
        }
        else
        {
          v65 &= *(_QWORD *)&v51 - 1;
        }
        if (v65 != v52)
        {
          *(_QWORD *)(*v49 + 8 * v65) = v61;
          v64 = *v50;
        }
      }
      *v61 = v64;
      *v50 = 0;
      --v38[13];
      *(_QWORD *)buf = v50;
      *(_QWORD *)v97 = v38 + 12;
      v97[8] = 1;
      std::unique_ptr<std::__hash_node<std::__hash_value_type<AMCP::Address,std::shared_ptr<AMCP::Core::Operation>>,void *>,std::__hash_node_destructor<std::allocator<std::__hash_node<std::__hash_value_type<AMCP::Address,std::shared_ptr<AMCP::Core::Operation>>,void *>>>>::reset[abi:ne180100]((uint64_t)buf);
      v66 = v90;
      v90 = 0;

      v67 = v91;
      v91 = 0;

      v68 = v92;
      v92 = 0;

      v69 = v93;
      v93 = 0;

      v70 = v95;
      v95 = 0;

      v57 = 0;
LABEL_94:

      goto LABEL_95;
    }
  }
  v57 = 0;
LABEL_95:
  os_unfair_lock_unlock(v8);
  return v57;
}

- (void)register_io_buffer:(id)a3 reply:(id)a4
{
  id v6;
  void (**v7)(id, _QWORD);
  id v8;
  xpc_object_t v9;
  id v10;
  void *v11;
  const applesauce::xpc::object *v12;
  uint64_t v13;
  id v14;
  id v15;

  v6 = a3;
  v7 = (void (**)(id, _QWORD))a4;
  objc_msgSend(v6, "object");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  v9 = v8;
  if (!v8)
    v9 = xpc_null_create();

  v10 = v9;
  v11 = v10;
  if (!v10 || (v12 = (const applesauce::xpc::object *)v10, MEMORY[0x1B5E5145C](v10) != MEMORY[0x1E0C812F8]))
  {
    v12 = (const applesauce::xpc::object *)xpc_null_create();

  }
  applesauce::xpc::object::object((applesauce::xpc::object *)&v15, v12);
  v13 = -[Core_Audio_Driver handle_register_buffer:](self, "handle_register_buffer:", &v15);
  v14 = v15;
  v15 = 0;

  v7[2](v7, v13);
}

- (void)unregister_io_buffer:(id)a3 reply:(id)a4
{
  id v6;
  void (**v7)(id, _QWORD);
  id v8;
  xpc_object_t v9;
  id v10;
  void *v11;
  const applesauce::xpc::object *v12;
  uint64_t v13;
  id v14;
  id v15;

  v6 = a3;
  v7 = (void (**)(id, _QWORD))a4;
  objc_msgSend(v6, "object");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  v9 = v8;
  if (!v8)
    v9 = xpc_null_create();

  v10 = v9;
  v11 = v10;
  if (!v10 || (v12 = (const applesauce::xpc::object *)v10, MEMORY[0x1B5E5145C](v10) != MEMORY[0x1E0C812F8]))
  {
    v12 = (const applesauce::xpc::object *)xpc_null_create();

  }
  applesauce::xpc::object::object((applesauce::xpc::object *)&v15, v12);
  v13 = -[Core_Audio_Driver handle_unregister_buffer:](self, "handle_unregister_buffer:", &v15);
  v14 = v15;
  v15 = 0;

  v7[2](v7, v13);
}

- (void)start_io:(unsigned int)a3 client_id:(unsigned int)a4 reply:(id)a5
{
  uint64_t v5;
  uint64_t v6;
  void (**v8)(id, uint64_t);
  AudioServerPlugInDriverInterface **v9;
  uint64_t v10;

  v5 = *(_QWORD *)&a4;
  v6 = *(_QWORD *)&a3;
  v8 = (void (**)(id, uint64_t))a5;
  v9 = -[Core_Audio_Driver asp_interface](self, "asp_interface");
  v10 = ((uint64_t (*)(AudioServerPlugInDriverInterface **, uint64_t, uint64_t))(*v9)->StartIO)(v9, v6, v5);
  v8[2](v8, v10);

}

- (void)stop_io:(unsigned int)a3 client_id:(unsigned int)a4 reply:(id)a5
{
  uint64_t v5;
  uint64_t v6;
  AudioServerPlugInDriverInterface **v8;
  uint64_t v9;
  void *v10;
  void (**v11)(void);
  void (**v12)(id, uint64_t);

  v5 = *(_QWORD *)&a4;
  v6 = *(_QWORD *)&a3;
  v12 = (void (**)(id, uint64_t))a5;
  v8 = -[Core_Audio_Driver asp_interface](self, "asp_interface");
  v9 = ((uint64_t (*)(AudioServerPlugInDriverInterface **, uint64_t, uint64_t))(*v8)->StopIO)(v8, v6, v5);
  v12[2](v12, v9);
  -[Core_Audio_Driver process_boost_reply](self, "process_boost_reply");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10)
  {
    -[Core_Audio_Driver process_boost_reply](self, "process_boost_reply");
    v11 = (void (**)(void))objc_claimAutoreleasedReturnValue();
    v11[2]();

    -[Core_Audio_Driver setProcess_boost_reply:](self, "setProcess_boost_reply:", 0);
  }

}

- (void)start_synchronous_messenger:(unsigned int)a3 client_id:(unsigned int)a4 nominal_sample_rate:(double)a5 io_buffer_frame_size:(unsigned int)a6 work_group_port:(id)a7 io_messenger:(id)a8 reply:(id)a9
{
  uint64_t v11;
  uint64_t v13;
  uint64_t v14;
  id v16;
  id v17;
  void (**v18)(id, _QWORD);

  v11 = *(_QWORD *)&a6;
  v13 = *(_QWORD *)&a4;
  v14 = *(_QWORD *)&a3;
  v16 = a7;
  v17 = a8;
  v18 = (void (**)(id, _QWORD))a9;
  v18[2](v18, -[Core_Audio_Driver create_and_start_io_receiver:client_id:nominal_sample_rate:io_buffer_frame_size:work_group_port:io_messenger:](self, "create_and_start_io_receiver:client_id:nominal_sample_rate:io_buffer_frame_size:work_group_port:io_messenger:", v14, v13, v11, v16, v17, a5));

}

- (void)stop_synchronous_messenger:(unsigned int)a3 client_id:(unsigned int)a4 reply:(id)a5
{
  void (**v8)(id, _QWORD);
  os_unfair_lock_s *v9;
  std::__shared_weak_count *v10;
  unint64_t *p_shared_owners;
  unint64_t v12;
  uint64_t *v13;
  uint64_t *v14;
  std::__shared_weak_count *v15;
  unint64_t *v16;
  unint64_t v17;
  std::__shared_weak_count *v18;
  unint64_t *v19;
  unint64_t v20;
  os_unfair_lock_t lock;
  std::__shared_weak_count *v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v8 = (void (**)(id, _QWORD))a5;
  -[Core_Audio_Driver io_receiver_lock](self, "io_receiver_lock");
  v9 = lock;
  os_unfair_lock_lock(lock);
  v10 = v22;
  if (v22)
  {
    p_shared_owners = (unint64_t *)&v22->__shared_owners_;
    do
      v12 = __ldaxr(p_shared_owners);
    while (__stlxr(v12 - 1, p_shared_owners));
    if (!v12)
    {
      ((void (*)(std::__shared_weak_count *))v10->__on_zero_shared)(v10);
      std::__shared_weak_count::__release_weak(v10);
    }
  }
  -[Core_Audio_Driver io_receivers](self, "io_receivers");
  v13 = std::__hash_table<std::__hash_value_type<AMCP::Portal::IPC::io_messenger_id_t,std::shared_ptr<AMCP::Portal::IPC::IO_Sender>>,std::__unordered_map_hasher<AMCP::Portal::IPC::io_messenger_id_t,std::__hash_value_type<AMCP::Portal::IPC::io_messenger_id_t,std::shared_ptr<AMCP::Portal::IPC::IO_Sender>>,std::hash<AMCP::Portal::IPC::io_messenger_id_t>,std::equal_to<AMCP::Portal::IPC::io_messenger_id_t>,true>,std::__unordered_map_equal<AMCP::Portal::IPC::io_messenger_id_t,std::__hash_value_type<AMCP::Portal::IPC::io_messenger_id_t,std::shared_ptr<AMCP::Portal::IPC::IO_Sender>>,std::equal_to<AMCP::Portal::IPC::io_messenger_id_t>,std::hash<AMCP::Portal::IPC::io_messenger_id_t>,true>,std::allocator<std::__hash_value_type<AMCP::Portal::IPC::io_messenger_id_t,std::shared_ptr<AMCP::Portal::IPC::IO_Sender>>>>::find<AMCP::Portal::IPC::io_messenger_id_t>(lock, a3, a4);
  if (!v13)
    std::__throw_out_of_range[abi:ne180100]("unordered_map::at: key not found");
  v14 = v13;
  v15 = v22;
  if (v22)
  {
    v16 = (unint64_t *)&v22->__shared_owners_;
    do
      v17 = __ldaxr(v16);
    while (__stlxr(v17 - 1, v16));
    if (!v17)
    {
      ((void (*)(std::__shared_weak_count *))v15->__on_zero_shared)(v15);
      std::__shared_weak_count::__release_weak(v15);
    }
  }
  caulk::ipc::synchronous_messenger::semaphore_receiver::stop(*(caulk::ipc::synchronous_messenger::semaphore_receiver **)(v14[3] + 32), 5.0);
  -[Core_Audio_Driver io_receivers](self, "io_receivers");
  std::__hash_table<std::__hash_value_type<AMCP::Portal::IPC::io_messenger_id_t,std::shared_ptr<AMCP::Portal::IPC::IO_Receiver>>,std::__unordered_map_hasher<AMCP::Portal::IPC::io_messenger_id_t,std::__hash_value_type<AMCP::Portal::IPC::io_messenger_id_t,std::shared_ptr<AMCP::Portal::IPC::IO_Receiver>>,std::hash<AMCP::Portal::IPC::io_messenger_id_t>,std::equal_to<AMCP::Portal::IPC::io_messenger_id_t>,true>,std::__unordered_map_equal<AMCP::Portal::IPC::io_messenger_id_t,std::__hash_value_type<AMCP::Portal::IPC::io_messenger_id_t,std::shared_ptr<AMCP::Portal::IPC::IO_Receiver>>,std::equal_to<AMCP::Portal::IPC::io_messenger_id_t>,std::hash<AMCP::Portal::IPC::io_messenger_id_t>,true>,std::allocator<std::__hash_value_type<AMCP::Portal::IPC::io_messenger_id_t,std::shared_ptr<AMCP::Portal::IPC::IO_Receiver>>>>::__erase_unique<AMCP::Portal::IPC::io_messenger_id_t>(lock, a3, a4);
  v18 = v22;
  if (v22)
  {
    v19 = (unint64_t *)&v22->__shared_owners_;
    do
      v20 = __ldaxr(v19);
    while (__stlxr(v20 - 1, v19));
    if (!v20)
    {
      ((void (*)(std::__shared_weak_count *))v18->__on_zero_shared)(v18);
      std::__shared_weak_count::__release_weak(v18);
    }
  }
  os_unfair_lock_unlock(v9);
  v8[2](v8, 0);

}

- (void)has_property:(Driver_Property_Identity *)a3 reply:(id)a4
{
  void (**v6)(id, uint64_t);
  AudioServerPlugInDriverInterface **v7;
  uint64_t v8;

  v6 = (void (**)(id, uint64_t))a4;
  v7 = -[Core_Audio_Driver asp_interface](self, "asp_interface");
  v8 = ((uint64_t (*)(AudioServerPlugInDriverInterface **, _QWORD, _QWORD, AudioObjectPropertyAddress *))(*v7)->HasProperty)(v7, a3->var0, a3->var1, &a3->var2);
  v6[2](v6, v8);

}

- (void)release_unpacked_cf_objects:(unsigned int)a3 qualifier_data:(id)a4 data_type:(unsigned int)a5 data:(id)a6
{
  id v9;
  id v10;
  id v11;
  const void *v12;
  id v13;
  void *v14;
  id v15;
  const void *v16;
  id v17;

  v9 = a4;
  v10 = a6;
  v17 = v9;
  if (v17)
  {
    v11 = objc_retainAutorelease(v17);
    if (objc_msgSend(v11, "bytes"))
    {
      if (a3 <= 0x10 && ((1 << a3) & 0x18040) != 0)
      {
        v12 = *(const void **)objc_msgSend(objc_retainAutorelease(v11), "bytes");
        if (v12)
          CFRelease(v12);
      }
    }
  }

  v13 = v10;
  v14 = v13;
  if (v13)
  {
    v15 = objc_retainAutorelease(v13);
    if (objc_msgSend(v15, "bytes"))
    {
      if (a5 <= 0x10 && ((1 << a5) & 0x18040) != 0)
      {
        v16 = *(const void **)objc_msgSend(objc_retainAutorelease(v15), "bytes");
        if (v16)
          CFRelease(v16);
      }
    }
  }

}

- (void)is_property_settable:(Driver_Property_Identity *)a3 reply:(id)a4
{
  void (**v6)(id, uint64_t, _QWORD);
  AudioServerPlugInDriverInterface **v7;
  uint64_t v8;
  _BYTE v9[25];
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v6 = (void (**)(id, uint64_t, _QWORD))a4;
  v9[0] = 0;
  v7 = -[Core_Audio_Driver asp_interface](self, "asp_interface");
  v8 = ((uint64_t (*)(AudioServerPlugInDriverInterface **, _QWORD, _QWORD, AudioObjectPropertyAddress *, _BYTE *))(*v7)->IsPropertySettable)(v7, a3->var0, a3->var1, &a3->var2, v9);
  v6[2](v6, v8, v9[0]);

}

- (void)get_property_data_size:(Driver_Property_Identity *)a3 qualifier:(id)a4 reply:(id)a5
{
  void (**v8)(id, uint64_t, _QWORD);
  AudioServerPlugInDriverInterface **v9;
  AudioObjectPropertyAddress *p_var2;
  unsigned int property_qualifier_type_code;
  std::__shared_weak_count *v12;
  unint64_t *p_shared_owners;
  unint64_t v14;
  uint64_t v15;
  uint64_t v16;
  OSStatus (__cdecl *GetPropertyDataSize)(AudioServerPlugInDriverRef, AudioObjectID, pid_t, const AudioObjectPropertyAddress *, UInt32, const void *, UInt32 *);
  uint64_t var0;
  uint64_t var1;
  id v20;
  uint64_t v21;
  id v22;
  unsigned int v23;
  id v24;
  std::__shared_weak_count *v25;
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v22 = a4;
  v8 = (void (**)(id, uint64_t, _QWORD))a5;
  v23 = 0;
  v9 = -[Core_Audio_Driver asp_interface](self, "asp_interface");
  -[Core_Audio_Driver m_property_type_info](self, "m_property_type_info");
  p_var2 = &a3->var2;
  property_qualifier_type_code = Property_Type_Info::get_property_qualifier_type_code((Property_Type_Info *)v24, a3->var0, (AMCP::HAL *)a3->var2.mSelector);
  v12 = v25;
  if (v25)
  {
    p_shared_owners = (unint64_t *)&v25->__shared_owners_;
    do
      v14 = __ldaxr(p_shared_owners);
    while (__stlxr(v14 - 1, p_shared_owners));
    if (!v14)
    {
      ((void (*)(std::__shared_weak_count *))v12->__on_zero_shared)(v12);
      std::__shared_weak_count::__release_weak(v12);
    }
  }
  unpack_data_from_qualifier((uint64_t)&v24, property_qualifier_type_code, v22);
  v16 = v25;
  v15 = HIDWORD(v25);
  GetPropertyDataSize = (*v9)->GetPropertyDataSize;
  var0 = a3->var0;
  var1 = a3->var1;
  v20 = objc_retainAutorelease(v24);
  v21 = ((uint64_t (*)(AudioServerPlugInDriverInterface **, uint64_t, uint64_t, AudioObjectPropertyAddress *, uint64_t, uint64_t, unsigned int *))GetPropertyDataSize)(v9, var0, var1, p_var2, v16, objc_msgSend(v20, "bytes"), &v23);
  v8[2](v8, v21, v23);
  -[Core_Audio_Driver release_unpacked_cf_objects:qualifier_data:data_type:data:](self, "release_unpacked_cf_objects:qualifier_data:data_type:data:", v15, v20, 0, 0);

}

- (void)get_property_data:(Driver_Property_Identity *)a3 qualifier:(id)a4 data_size:(unsigned int)a5 reply:(id)a6
{
  unsigned int property_qualifier_type_code;
  std::__shared_weak_count *v11;
  unint64_t *p_shared_owners;
  unint64_t v13;
  uint64_t v14;
  Property_Type_Info *v15;
  unsigned int var0;
  AMCP::HAL *mSelector;
  std::mutex *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t *v21;
  int v22;
  unsigned int hal_property_value_type_code;
  std::__shared_weak_count *v24;
  unint64_t *v25;
  unint64_t v26;
  uint64_t v27;
  uint64_t v28;
  void *v29;
  OSStatus (__cdecl *GetPropertyData)(AudioServerPlugInDriverRef, AudioObjectID, pid_t, const AudioObjectPropertyAddress *, UInt32, const void *, UInt32, UInt32 *, void *);
  uint64_t v31;
  uint64_t var1;
  Property_Type_Info *v33;
  uint64_t v34;
  id v35;
  uint64_t v36;
  void *v37;
  std::__shared_weak_count *v38;
  unint64_t *v39;
  unint64_t v40;
  unsigned int v41;
  Property_Type_Info *v42;
  AudioObjectPropertyAddress *p_var2;
  unsigned int v44;
  AudioServerPlugInDriverInterface **v45;
  id v46;
  void (**v47)(id, uint64_t, void *);
  Core_Audio_Driver *v48;
  unsigned int v49;
  Property_Type_Info *v50;
  std::__shared_weak_count *v51;
  uint64_t v52;

  v52 = *MEMORY[0x1E0C80C00];
  v46 = a4;
  v47 = (void (**)(id, uint64_t, void *))a6;
  v48 = self;
  v45 = -[Core_Audio_Driver asp_interface](self, "asp_interface");
  -[Core_Audio_Driver m_property_type_info](self, "m_property_type_info");
  p_var2 = &a3->var2;
  property_qualifier_type_code = Property_Type_Info::get_property_qualifier_type_code(v50, a3->var0, (AMCP::HAL *)a3->var2.mSelector);
  v11 = v51;
  if (v51)
  {
    p_shared_owners = (unint64_t *)&v51->__shared_owners_;
    do
      v13 = __ldaxr(p_shared_owners);
    while (__stlxr(v13 - 1, p_shared_owners));
    if (!v13)
    {
      ((void (*)(std::__shared_weak_count *))v11->__on_zero_shared)(v11);
      std::__shared_weak_count::__release_weak(v11);
    }
  }
  unpack_data_from_qualifier((uint64_t)&v50, property_qualifier_type_code, v46);
  v42 = v50;
  v14 = v51;
  v41 = HIDWORD(v51);
  -[Core_Audio_Driver m_property_type_info](v48, "m_property_type_info");
  v15 = v50;
  var0 = a3->var0;
  mSelector = (AMCP::HAL *)a3->var2.mSelector;
  v18 = (std::mutex *)((char *)v50 + 24);
  std::mutex::lock((std::mutex *)((char *)v50 + 24));
  v19 = *(_QWORD *)v15;
  v20 = *((_QWORD *)v15 + 1);
  if (*(_QWORD *)v15 != v20)
  {
    while (*(_DWORD *)v19 != var0)
    {
      v19 += 48;
      if (v19 == v20)
        goto LABEL_16;
    }
  }
  if (v19 == v20
    || (v21 = std::__hash_table<std::__hash_value_type<unsigned int,std::optional<unsigned int>>,std::__unordered_map_hasher<unsigned int,std::__hash_value_type<unsigned int,std::optional<unsigned int>>,std::hash<unsigned int>,std::equal_to<unsigned int>,true>,std::__unordered_map_equal<unsigned int,std::__hash_value_type<unsigned int,std::optional<unsigned int>>,std::equal_to<unsigned int>,std::hash<unsigned int>,true>,std::allocator<std::__hash_value_type<unsigned int,std::optional<unsigned int>>>>::find<unsigned int>((_QWORD *)(v19 + 8), mSelector)) == 0)
  {
LABEL_16:
    hal_property_value_type_code = AMCP::HAL::get_hal_property_value_type_code(mSelector);
  }
  else
  {
    v22 = *((_DWORD *)v21 + 5);
    switch(v22)
    {
      case 1918990199:
        hal_property_value_type_code = 1;
        break;
      case 1886155636:
        hal_property_value_type_code = 15;
        break;
      case 1667658612:
        hal_property_value_type_code = 6;
        break;
      default:
        hal_property_value_type_code = 0;
        break;
    }
  }
  std::mutex::unlock(v18);
  v24 = v51;
  if (v51)
  {
    v25 = (unint64_t *)&v51->__shared_owners_;
    do
      v26 = __ldaxr(v25);
    while (__stlxr(v26 - 1, v25));
    if (!v26)
    {
      ((void (*)(std::__shared_weak_count *))v24->__on_zero_shared)(v24);
      std::__shared_weak_count::__release_weak(v24);
    }
  }
  v44 = hal_property_value_type_code;
  if (hal_property_value_type_code > 0x12)
    v27 = 0x100000004;
  else
    v27 = qword_1B5D53210[hal_property_value_type_code] | qword_1B5D53178[hal_property_value_type_code];
  if ((v27 & 0xFF00000000) != 0)
    v28 = v27;
  else
    v28 = a5;
  v49 = v28;
  v29 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DF8]), "initWithLength:", v28);
  GetPropertyData = (*v45)->GetPropertyData;
  v31 = a3->var0;
  var1 = a3->var1;
  v33 = objc_retainAutorelease(v42);
  v34 = -[Property_Type_Info bytes](v33, "bytes");
  v35 = objc_retainAutorelease(v29);
  v36 = ((uint64_t (*)(AudioServerPlugInDriverInterface **, uint64_t, uint64_t, AudioObjectPropertyAddress *, uint64_t, uint64_t, uint64_t, unsigned int *, uint64_t))GetPropertyData)(v45, v31, var1, p_var2, v14, v34, v28, &v49, objc_msgSend(v35, "mutableBytes"));
  if ((_DWORD)v36)
  {
    v37 = 0;
  }
  else
  {
    if (p_var2->mSelector == 1668641652)
    {
      -[Core_Audio_Driver m_property_type_info](v48, "m_property_type_info");
      Property_Type_Info::add_custom_properties(v50, a3->var0, v49 / 0xCuLL, (const AudioServerPlugInCustomPropertyInfo *)objc_msgSend(objc_retainAutorelease(v35), "bytes"));
      v38 = v51;
      if (v51)
      {
        v39 = (unint64_t *)&v51->__shared_owners_;
        do
          v40 = __ldaxr(v39);
        while (__stlxr(v40 - 1, v39));
        if (!v40)
        {
          ((void (*)(std::__shared_weak_count *))v38->__on_zero_shared)(v38);
          std::__shared_weak_count::__release_weak(v38);
        }
      }
    }
    AMCP::HAL::pack_property_data(v44, v49, (CFStringRef *)objc_msgSend(objc_retainAutorelease(v35), "bytes"));
    v37 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v47[2](v47, v36, v37);
  -[Core_Audio_Driver release_unpacked_cf_objects:qualifier_data:data_type:data:](v48, "release_unpacked_cf_objects:qualifier_data:data_type:data:", v41, v33, v44, v35);

}

- (void)set_property_data:(Driver_Property_Identity *)a3 qualifier:(id)a4 data:(id)a5 reply:(id)a6
{
  AudioServerPlugInDriverInterface **v10;
  AudioObjectPropertyAddress *p_var2;
  uint64_t property_data_and_qualifier_type_code;
  unint64_t *v13;
  unint64_t v14;
  uint64_t v15;
  id v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  unsigned int v20;
  AMCP::Log::Scope_Registry *v21;
  uint64_t v22;
  OSStatus (__cdecl *SetPropertyData)(AudioServerPlugInDriverRef, AudioObjectID, pid_t, const AudioObjectPropertyAddress *, UInt32, const void *, UInt32, const void *);
  uint64_t var0;
  uint64_t var1;
  uint64_t v26;
  id v27;
  uint64_t v28;
  NSObject *v29;
  _opaque_pthread_t *v30;
  mach_port_t v31;
  void *exception;
  NSObject *v33;
  _opaque_pthread_t *v34;
  mach_port_t v35;
  void *v36;
  unsigned int v37;
  Core_Audio_Driver *v38;
  id v39;
  void (**v40)(id, uint64_t);
  id v41;
  id v42;
  Property_Type_Info *v43;
  Property_Type_Info *v44;
  char v45;
  unsigned int v46;
  __int128 v47;
  uint64_t v48;
  uint64_t (**v49)();
  __int128 v50;
  uint64_t v51;
  std::runtime_error v52;
  std::runtime_error v53;
  void *v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  int v58;
  Property_Type_Info *buf;
  _BYTE v60[10];
  __int16 v61;
  int v62;
  __int16 v63;
  _BYTE v64[14];
  const char *v65;
  int v66;
  uint64_t v67;

  v67 = *MEMORY[0x1E0C80C00];
  v41 = a4;
  v42 = a5;
  v40 = (void (**)(id, uint64_t))a6;
  v38 = self;
  v10 = -[Core_Audio_Driver asp_interface](self, "asp_interface");
  -[Core_Audio_Driver m_property_type_info](self, "m_property_type_info");
  p_var2 = &a3->var2;
  property_data_and_qualifier_type_code = Property_Type_Info::get_property_data_and_qualifier_type_code(buf, a3->var0, (AMCP::HAL *)a3->var2.mSelector);
  if (*(_QWORD *)v60)
  {
    v13 = (unint64_t *)(*(_QWORD *)v60 + 8);
    do
      v14 = __ldaxr(v13);
    while (__stlxr(v14 - 1, v13));
    if (!v14)
    {
      (*(void (**)(_QWORD))(**(_QWORD **)v60 + 16))(*(_QWORD *)v60);
      std::__shared_weak_count::__release_weak(*(std::__shared_weak_count **)v60);
    }
  }
  unpack_data_from_qualifier((uint64_t)&buf, HIDWORD(property_data_and_qualifier_type_code), v41);
  v43 = buf;
  v15 = *(unsigned int *)v60;
  v37 = *(_DWORD *)&v60[4];
  v16 = v42;
  if (!v16)
  {
    AMCP::Log::Scope_Registry::get(0);
    AMCP::Log::Scope_Registry::fetch((AMCP::Log::Scope_Registry *)&buf, "com.apple.coreaudio", "AMCP");
    v29 = *(NSObject **)buf;
    AMCP::Log::Scope::get_os_log_t(*(id *)buf);
    objc_claimAutoreleasedReturnValue();
    std::shared_ptr<AMCP::Log::Scope>::~shared_ptr[abi:ne180100]((uint64_t)&buf);
    if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
    {
      v30 = pthread_self();
      v31 = pthread_mach_thread_np(v30);
      LODWORD(buf) = 67109890;
      HIDWORD(buf) = v31;
      *(_WORD *)v60 = 2080;
      *(_QWORD *)&v60[2] = "Core_Audio_Driver.mm";
      v61 = 1024;
      v62 = 682;
      v63 = 2080;
      *(_QWORD *)v64 = "value == nil";
      _os_log_error_impl(&dword_1B57BA000, v29, OS_LOG_TYPE_ERROR, "%6u %32s:%-5d Throwing Exception: %s Value is nil, cannot unpack data", (uint8_t *)&buf, 0x22u);
    }

    AMCP::Utility::With_Realtime_Disabled::With_Realtime_Disabled((AMCP::Utility::With_Realtime_Disabled *)&v46);
    exception = __cxa_allocate_exception(0x40uLL);
    std::runtime_error::runtime_error(&v52, "Value is nil, cannot unpack data");
    std::runtime_error::runtime_error(&v53, &v52);
    v55 = 0;
    v56 = 0;
    v57 = 0;
    v58 = -1;
    v53.__vftable = (std::runtime_error_vtbl *)&off_1E69A1FB8;
    v54 = &unk_1E69A1FE0;
    boost::exception_detail::clone_impl<boost::exception_detail::error_info_injector<std::runtime_error>>::clone_impl((uint64_t)&buf, (uint64_t)&v53);
    *(_QWORD *)&v64[6] = "std::tuple<NSData *, UInt32, AMCP::HAL::HAL_Property_Type_Code> unpack_data_from_value(AMCP::HA"
                         "L::HAL_Property_Type_Code, NSData *__strong)";
    v65 = "/Library/Caches/com.apple.xbs/Sources/AudioHAL/Source/AMCP/ASP/Portal/Driver/Core_Audio_Driver.mm";
    v66 = 682;
    applesauce::backtrace::snapshot_N<64>::snapshot_N((char **)&v47);
    v50 = v47;
    v51 = v48;
    v47 = 0uLL;
    v48 = 0;
    v49 = off_1E69A20A0;
    boost::exception_detail::set_info_rv<boost::error_info<applesauce::exceptions::tag_backtrace,applesauce::backtrace::snapshot_N<64>>>::set<boost::exception_detail::clone_impl<boost::exception_detail::error_info_injector<std::runtime_error>>>((uint64_t)&buf, (uint64_t)&v49);
    boost::exception_detail::clone_impl<boost::exception_detail::error_info_injector<std::runtime_error>>::clone_impl((uint64_t)exception, (uint64_t)&buf);
  }
  if (property_data_and_qualifier_type_code >= 0x13)
  {
    v46 = 0;
    v20 = 4;
  }
  else
  {
    v17 = property_data_and_qualifier_type_code;
    v18 = qword_1B5D53178[v17];
    v19 = qword_1B5D53210[v17];
    v20 = v19 | v18;
    if (((v19 | v18) & 0xFF00000000) == 0)
      v20 = objc_msgSend(v16, "length");
  }
  v46 = v20;
  v39 = objc_retainAutorelease((id)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DF8]), "initWithLength:", objc_msgSend(v16, "length")));
  v21 = (AMCP::Log::Scope_Registry *)AMCP::HAL::unpack_property_data(v16, property_data_and_qualifier_type_code, &v46, (_QWORD *)objc_msgSend(v39, "mutableBytes"));
  if ((_DWORD)v21)
  {
    AMCP::Log::Scope_Registry::get(v21);
    AMCP::Log::Scope_Registry::fetch((AMCP::Log::Scope_Registry *)&buf, "com.apple.coreaudio", "AMCP");
    v33 = *(NSObject **)buf;
    AMCP::Log::Scope::get_os_log_t(*(id *)buf);
    objc_claimAutoreleasedReturnValue();
    std::shared_ptr<AMCP::Log::Scope>::~shared_ptr[abi:ne180100]((uint64_t)&buf);
    if (os_log_type_enabled(v33, OS_LOG_TYPE_ERROR))
    {
      v34 = pthread_self();
      v35 = pthread_mach_thread_np(v34);
      LODWORD(buf) = 67109890;
      HIDWORD(buf) = v35;
      *(_WORD *)v60 = 2080;
      *(_QWORD *)&v60[2] = "Core_Audio_Driver.mm";
      v61 = 1024;
      v62 = 687;
      v63 = 2080;
      *(_QWORD *)v64 = "data_error != kAudioHardwareNoError";
      _os_log_error_impl(&dword_1B57BA000, v33, OS_LOG_TYPE_ERROR, "%6u %32s:%-5d Throwing Exception: %s Failed to unpack value", (uint8_t *)&buf, 0x22u);
    }

    AMCP::Utility::With_Realtime_Disabled::With_Realtime_Disabled((AMCP::Utility::With_Realtime_Disabled *)&v45);
    v36 = __cxa_allocate_exception(0x40uLL);
    std::runtime_error::runtime_error(&v52, "Failed to unpack value");
    std::runtime_error::runtime_error(&v53, &v52);
    v55 = 0;
    v56 = 0;
    v57 = 0;
    v58 = -1;
    v53.__vftable = (std::runtime_error_vtbl *)&off_1E69A1FB8;
    v54 = &unk_1E69A1FE0;
    boost::exception_detail::clone_impl<boost::exception_detail::error_info_injector<std::runtime_error>>::clone_impl((uint64_t)&buf, (uint64_t)&v53);
    *(_QWORD *)&v64[6] = "std::tuple<NSData *, UInt32, AMCP::HAL::HAL_Property_Type_Code> unpack_data_from_value(AMCP::HA"
                         "L::HAL_Property_Type_Code, NSData *__strong)";
    v65 = "/Library/Caches/com.apple.xbs/Sources/AudioHAL/Source/AMCP/ASP/Portal/Driver/Core_Audio_Driver.mm";
    v66 = 687;
    applesauce::backtrace::snapshot_N<64>::snapshot_N((char **)&v47);
    v50 = v47;
    v51 = v48;
    v47 = 0uLL;
    v48 = 0;
    v49 = off_1E69A20A0;
    boost::exception_detail::set_info_rv<boost::error_info<applesauce::exceptions::tag_backtrace,applesauce::backtrace::snapshot_N<64>>>::set<boost::exception_detail::clone_impl<boost::exception_detail::error_info_injector<std::runtime_error>>>((uint64_t)&buf, (uint64_t)&v49);
    boost::exception_detail::clone_impl<boost::exception_detail::error_info_injector<std::runtime_error>>::clone_impl((uint64_t)v36, (uint64_t)&buf);
  }
  v22 = v46;

  SetPropertyData = (*v10)->SetPropertyData;
  var0 = a3->var0;
  var1 = a3->var1;
  v44 = objc_retainAutorelease(v43);
  v26 = -[Property_Type_Info bytes](v44, "bytes");
  v27 = objc_retainAutorelease(v39);
  v28 = ((uint64_t (*)(AudioServerPlugInDriverInterface **, uint64_t, uint64_t, AudioObjectPropertyAddress *, uint64_t, uint64_t, uint64_t, uint64_t))SetPropertyData)(v10, var0, var1, p_var2, v15, v26, v22, objc_msgSend(v27, "bytes"));
  v40[2](v40, v28);
  -[Core_Audio_Driver release_unpacked_cf_objects:qualifier_data:data_type:data:](v38, "release_unpacked_cf_objects:qualifier_data:data_type:data:", v37, v44, property_data_and_qualifier_type_code, v27);

}

- (Core_Audio_Driver_Host_Proxy)driver_host_proxy
{
  return self->_driver_host_proxy;
}

- (void)setDriver_host_proxy:(id)a3
{
  objc_storeStrong((id *)&self->_driver_host_proxy, a3);
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

- (AudioServerPlugInDriverInterface)asp_interface
{
  return self->_asp_interface;
}

- (void)setAsp_interface:(AudioServerPlugInDriverInterface *)a3
{
  self->_asp_interface = a3;
}

- (AudioServerPlugInHostInterface)host_interface
{
  return self->_host_interface;
}

- (void)setHost_interface:(AudioServerPlugInHostInterface *)a3
{
  self->_host_interface = a3;
}

- (shared_ptr<caulk::mach::unfair_lock>)config_change_info_lock
{
  unfair_lock **v2;
  __shared_weak_count *cntrl;
  unint64_t *v4;
  unint64_t v5;
  shared_ptr<caulk::mach::unfair_lock> result;

  cntrl = self->_config_change_info_lock.__cntrl_;
  *v2 = self->_config_change_info_lock.__ptr_;
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

- (shared_ptr<std::map<unsigned)config_change_info_map
{
  void **v2;
  __shared_weak_count *cntrl;
  unint64_t *v4;
  unint64_t v5;
  shared_ptr<std::map<unsigned long long, void *>> result;

  cntrl = self->_config_change_info_map.__cntrl_;
  *v2 = self->_config_change_info_map.__ptr_;
  v2[1] = cntrl;
  if (cntrl)
  {
    v4 = (unint64_t *)((char *)cntrl + 8);
    do
      v5 = __ldxr(v4);
    while (__stxr(v5 + 1, v4));
  }
  result.__cntrl_ = (__shared_weak_count *)a2;
  result.__ptr_ = self;
  return result;
}

- (void)setConfig_change_info_map:(shared_ptr<std:(void *>>)a3 :map<unsigned long)long
{
  __shared_weak_count *v3;
  void *v4;
  unint64_t *v5;
  unint64_t v6;
  __shared_weak_count *cntrl;
  unint64_t *v8;
  unint64_t v9;

  v4 = *(void **)a3.__ptr_;
  v3 = (__shared_weak_count *)*((_QWORD *)a3.__ptr_ + 1);
  if (v3)
  {
    v5 = (unint64_t *)((char *)v3 + 8);
    do
      v6 = __ldxr(v5);
    while (__stxr(v6 + 1, v5));
  }
  cntrl = self->_config_change_info_map.__cntrl_;
  self->_config_change_info_map.__ptr_ = v4;
  self->_config_change_info_map.__cntrl_ = v3;
  if (cntrl)
  {
    v8 = (unint64_t *)((char *)cntrl + 8);
    do
      v9 = __ldaxr(v8);
    while (__stlxr(v9 - 1, v8));
    if (!v9)
    {
      (*(void (**)(__shared_weak_count *, SEL))(*(_QWORD *)cntrl + 16))(cntrl, a2);
      std::__shared_weak_count::__release_weak((std::__shared_weak_count *)cntrl);
    }
  }
}

- (OS_dispatch_queue)concurrent_queue
{
  return self->_concurrent_queue;
}

- (void)setConcurrent_queue:(id)a3
{
  objc_storeStrong((id *)&self->_concurrent_queue, a3);
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

- (shared_ptr<caulk::mach::unfair_lock>)io_receiver_lock
{
  unfair_lock **v2;
  __shared_weak_count *cntrl;
  unint64_t *v4;
  unint64_t v5;
  shared_ptr<caulk::mach::unfair_lock> result;

  cntrl = self->_io_receiver_lock.__cntrl_;
  *v2 = self->_io_receiver_lock.__ptr_;
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

- (void)setIo_receiver_lock:(shared_ptr<caulk::mach::unfair_lock>)a3
{
  __shared_weak_count *v3;
  unfair_lock *v4;
  unint64_t *v5;
  unint64_t v6;
  __shared_weak_count *cntrl;
  unint64_t *v8;
  unint64_t v9;

  v4 = *(unfair_lock **)a3.__ptr_;
  v3 = (__shared_weak_count *)*((_QWORD *)a3.__ptr_ + 1);
  if (v3)
  {
    v5 = (unint64_t *)((char *)v3 + 8);
    do
      v6 = __ldxr(v5);
    while (__stxr(v6 + 1, v5));
  }
  cntrl = self->_io_receiver_lock.__cntrl_;
  self->_io_receiver_lock.__ptr_ = v4;
  self->_io_receiver_lock.__cntrl_ = v3;
  if (cntrl)
  {
    v8 = (unint64_t *)((char *)cntrl + 8);
    do
      v9 = __ldaxr(v8);
    while (__stlxr(v9 - 1, v8));
    if (!v9)
    {
      (*(void (**)(__shared_weak_count *, SEL))(*(_QWORD *)cntrl + 16))(cntrl, a2);
      std::__shared_weak_count::__release_weak((std::__shared_weak_count *)cntrl);
    }
  }
}

- (function<void)m_invalidation_handler
{
  return (function<void ()> *)std::__function::__value_func<void ()(void)>::__value_func[abi:ne180100]((uint64_t)retstr, (uint64_t)&self->_m_invalidation_handler);
}

- (void)setM_invalidation_handler:(function<void)(
{
  std::function<void ()(void)>::operator=(self->_m_invalidation_handler.__f_.__buf_.__lx, (uint64_t)a3);
}

- (id)process_boost_reply
{
  return self->_process_boost_reply;
}

- (void)setProcess_boost_reply:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 56);
}

- (shared_ptr<std::unordered_map<AMCP::Portal::IPC::io_messenger_id_t,)io_receivers
{
  void **v2;
  __shared_weak_count *cntrl;
  unint64_t *v4;
  unint64_t v5;
  shared_ptr<std::unordered_map<AMCP::Portal::IPC::io_messenger_id_t, std::shared_ptr<AMCP::Portal::IPC::IO_Receiver>>> result;

  cntrl = self->_io_receivers.__cntrl_;
  *v2 = self->_io_receivers.__ptr_;
  v2[1] = cntrl;
  if (cntrl)
  {
    v4 = (unint64_t *)((char *)cntrl + 8);
    do
      v5 = __ldxr(v4);
    while (__stxr(v5 + 1, v4));
  }
  result.__cntrl_ = (__shared_weak_count *)a2;
  result.__ptr_ = self;
  return result;
}

- (void)setIo_receivers:()shared_ptr<std:(std::shared_ptr<AMCP::Portal::IPC::IO_Receiver>>>)a3 :unordered_map<AMCP::Portal::IPC::io_messenger_id_t
{
  __shared_weak_count *v3;
  void *v4;
  unint64_t *v5;
  unint64_t v6;
  __shared_weak_count *cntrl;
  unint64_t *v8;
  unint64_t v9;

  v4 = *(void **)a3.__ptr_;
  v3 = (__shared_weak_count *)*((_QWORD *)a3.__ptr_ + 1);
  if (v3)
  {
    v5 = (unint64_t *)((char *)v3 + 8);
    do
      v6 = __ldxr(v5);
    while (__stxr(v6 + 1, v5));
  }
  cntrl = self->_io_receivers.__cntrl_;
  self->_io_receivers.__ptr_ = v4;
  self->_io_receivers.__cntrl_ = v3;
  if (cntrl)
  {
    v8 = (unint64_t *)((char *)cntrl + 8);
    do
      v9 = __ldaxr(v8);
    while (__stlxr(v9 - 1, v8));
    if (!v9)
    {
      (*(void (**)(__shared_weak_count *, SEL))(*(_QWORD *)cntrl + 16))(cntrl, a2);
      std::__shared_weak_count::__release_weak((std::__shared_weak_count *)cntrl);
    }
  }
}

- (shared_ptr<std::vector<std::pair<AMCP::Portal::IPC::shared_buffer_info_t,)io_buffer_list
{
  void **v2;
  __shared_weak_count *cntrl;
  unint64_t *v4;
  unint64_t v5;
  shared_ptr<std::vector<std::pair<AMCP::Portal::IPC::shared_buffer_info_t, applesauce::xpc::dict>>> result;

  cntrl = self->_io_buffer_list.__cntrl_;
  *v2 = self->_io_buffer_list.__ptr_;
  v2[1] = cntrl;
  if (cntrl)
  {
    v4 = (unint64_t *)((char *)cntrl + 8);
    do
      v5 = __ldxr(v4);
    while (__stxr(v5 + 1, v4));
  }
  result.__cntrl_ = (__shared_weak_count *)a2;
  result.__ptr_ = self;
  return result;
}

- (void)setIo_buffer_list:()shared_ptr<std:(applesauce::xpc::dict>>>)a3 :vector<std::pair<AMCP::Portal::IPC::shared_buffer_info_t
{
  __shared_weak_count *v3;
  void *v4;
  unint64_t *v5;
  unint64_t v6;
  __shared_weak_count *cntrl;
  unint64_t *v8;
  unint64_t v9;

  v4 = *(void **)a3.__ptr_;
  v3 = (__shared_weak_count *)*((_QWORD *)a3.__ptr_ + 1);
  if (v3)
  {
    v5 = (unint64_t *)((char *)v3 + 8);
    do
      v6 = __ldxr(v5);
    while (__stxr(v6 + 1, v5));
  }
  cntrl = self->_io_buffer_list.__cntrl_;
  self->_io_buffer_list.__ptr_ = v4;
  self->_io_buffer_list.__cntrl_ = v3;
  if (cntrl)
  {
    v8 = (unint64_t *)((char *)cntrl + 8);
    do
      v9 = __ldaxr(v8);
    while (__stlxr(v9 - 1, v8));
    if (!v9)
    {
      (*(void (**)(__shared_weak_count *, SEL))(*(_QWORD *)cntrl + 16))(cntrl, a2);
      std::__shared_weak_count::__release_weak((std::__shared_weak_count *)cntrl);
    }
  }
}

- (void).cxx_destruct
{
  function<void ()> *p_m_invalidation_handler;
  function<void ()> *f;
  uint64_t v5;
  __shared_weak_count *cntrl;
  unint64_t *v7;
  unint64_t v8;

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
  std::shared_ptr<AMCP::Log::Scope>::~shared_ptr[abi:ne180100]((uint64_t)&self->_io_buffer_list);
  std::shared_ptr<AMCP::Log::Scope>::~shared_ptr[abi:ne180100]((uint64_t)&self->_io_receivers);
  std::shared_ptr<AMCP::Log::Scope>::~shared_ptr[abi:ne180100]((uint64_t)&self->_io_receiver_lock);
  std::shared_ptr<AMCP::Log::Scope>::~shared_ptr[abi:ne180100]((uint64_t)&self->_m_custom_property_type_cache);
  cntrl = self->_config_change_info_map.__cntrl_;
  if (cntrl)
  {
    v7 = (unint64_t *)((char *)cntrl + 8);
    do
      v8 = __ldaxr(v7);
    while (__stlxr(v8 - 1, v7));
    if (!v8)
    {
      (*(void (**)(__shared_weak_count *))(*(_QWORD *)cntrl + 16))(cntrl);
      std::__shared_weak_count::__release_weak((std::__shared_weak_count *)cntrl);
    }
  }
  std::shared_ptr<AMCP::Log::Scope>::~shared_ptr[abi:ne180100]((uint64_t)&self->_config_change_info_lock);
  objc_storeStrong(&self->_process_boost_reply, 0);
  objc_storeStrong((id *)&self->_concurrent_queue, 0);
  objc_storeStrong((id *)&self->_endpoint, 0);
  objc_storeStrong((id *)&self->_listener, 0);
  objc_storeStrong((id *)&self->_driver_host_proxy, 0);
}

- (id).cxx_construct
{
  *((_QWORD *)self + 23) = 0;
  *((_OWORD *)self + 4) = 0u;
  *((_OWORD *)self + 5) = 0u;
  *((_OWORD *)self + 6) = 0u;
  *((_OWORD *)self + 7) = 0u;
  *((_OWORD *)self + 8) = 0u;
  *((_OWORD *)self + 9) = 0u;
  return self;
}

@end
