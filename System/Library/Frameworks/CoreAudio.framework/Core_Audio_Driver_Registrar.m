@implementation Core_Audio_Driver_Registrar

- (Core_Audio_Driver_Registrar)init
{
  id v2;
  _QWORD *v3;
  __int128 v4;
  std::__shared_weak_count *v5;
  unint64_t *p_shared_owners;
  unint64_t v7;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)Core_Audio_Driver_Registrar;
  v2 = -[Core_Audio_Driver_Registrar init](&v9, sel_init);
  if (v2)
  {
    v3 = operator new(0x30uLL);
    v3[1] = 0;
    v3[2] = 0;
    *v3 = &off_1E696C1F8;
    v3[3] = 0;
    v3[4] = 0;
    v3[5] = 0;
    *(_QWORD *)&v4 = v3 + 3;
    *((_QWORD *)&v4 + 1) = v3;
    v5 = (std::__shared_weak_count *)*((_QWORD *)v2 + 3);
    *((_OWORD *)v2 + 1) = v4;
    if (v5)
    {
      p_shared_owners = (unint64_t *)&v5->__shared_owners_;
      do
        v7 = __ldaxr(p_shared_owners);
      while (__stlxr(v7 - 1, p_shared_owners));
      if (!v7)
      {
        ((void (*)(std::__shared_weak_count *))v5->__on_zero_shared)(v5);
        std::__shared_weak_count::__release_weak(v5);
      }
    }
  }
  return (Core_Audio_Driver_Registrar *)v2;
}

- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4
{
  id v5;
  void *v6;
  uint64_t v7;
  id v8;
  unint64_t v9;
  char *v10;
  char *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  unint64_t v15;
  char *v16;
  char *v17;
  char *v18;
  char *v19;
  char *v20;
  __int128 v21;
  char *v22;
  void *v23;
  unint64_t *p_shared_owners;
  unint64_t v25;
  char **v27;
  std::__shared_weak_count *v28;
  _QWORD v29[5];
  id v30;
  _QWORD v31[5];
  _QWORD v32[5];
  id v33;

  v32[0] = 0;
  v32[1] = v32;
  v32[2] = 0x3032000000;
  v32[3] = __Block_byref_object_copy__216;
  v32[4] = __Block_byref_object_dispose__217;
  v33 = a4;
  v5 = v33;
  objc_msgSend(MEMORY[0x1E0CB3B50], "interfaceWithProtocol:", &unk_1EF132978);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setExportedInterface:", v6);

  objc_msgSend(v5, "setExportedObject:", self);
  v7 = MEMORY[0x1E0C809B0];
  v31[0] = MEMORY[0x1E0C809B0];
  v31[1] = 3221225472;
  v31[2] = __66__Core_Audio_Driver_Registrar_listener_shouldAcceptNewConnection___block_invoke;
  v31[3] = &unk_1E696C1A0;
  v31[4] = v32;
  objc_msgSend(v5, "setInterruptionHandler:", v31);
  v29[0] = v7;
  v29[1] = 3221225472;
  v29[2] = __66__Core_Audio_Driver_Registrar_listener_shouldAcceptNewConnection___block_invoke_2;
  v29[3] = &unk_1E696C1C8;
  v29[4] = self;
  v8 = v5;
  v30 = v8;
  objc_msgSend(v8, "setInvalidationHandler:", v29);
  -[Core_Audio_Driver_Registrar connection_infos](self, "connection_infos");
  v10 = v27[1];
  v9 = (unint64_t)v27[2];
  if ((unint64_t)v10 < v9)
  {
    *(_QWORD *)v10 = 0;
    *((_QWORD *)v10 + 1) = v8;
    v11 = v10 + 16;
    goto LABEL_20;
  }
  v12 = (v10 - *v27) >> 4;
  if ((unint64_t)(v12 + 1) >> 60)
    std::vector<std::tuple<std::pair<std::string,std::string>,std::shared_ptr<AMCP::Log::Scope>>>::__throw_length_error[abi:ne180100]();
  v13 = v9 - (_QWORD)*v27;
  v14 = v13 >> 3;
  if (v13 >> 3 <= (unint64_t)(v12 + 1))
    v14 = v12 + 1;
  if ((unint64_t)v13 >= 0x7FFFFFFFFFFFFFF0)
    v15 = 0xFFFFFFFFFFFFFFFLL;
  else
    v15 = v14;
  if (v15)
  {
    if (v15 >> 60)
      std::__throw_bad_array_new_length[abi:ne180100]();
    v16 = (char *)operator new(16 * v15);
  }
  else
  {
    v16 = 0;
  }
  v17 = &v16[16 * v12];
  v18 = &v16[16 * v15];
  *(_QWORD *)v17 = 0;
  *((_QWORD *)v17 + 1) = v8;
  v11 = v17 + 16;
  v19 = *v27;
  v20 = v27[1];
  if (v20 == *v27)
  {
    *v27 = v17;
    v27[1] = v11;
    v27[2] = v18;
    if (!v20)
      goto LABEL_20;
    goto LABEL_19;
  }
  do
  {
    v21 = *((_OWORD *)v20 - 1);
    v20 -= 16;
    *(_QWORD *)v20 = 0;
    *((_QWORD *)v20 + 1) = 0;
    *((_OWORD *)v17 - 1) = v21;
    v17 -= 16;
  }
  while (v20 != v19);
  v22 = *v27;
  v20 = v27[1];
  *v27 = v17;
  v27[1] = v11;
  v27[2] = v18;
  if (v20 != v22)
  {
    do
    {

      v23 = (void *)*((_QWORD *)v20 - 2);
      v20 -= 16;

    }
    while (v20 != v22);
    v20 = v22;
  }
  if (v20)
LABEL_19:
    operator delete(v20);
LABEL_20:
  v27[1] = v11;
  if (v28)
  {
    p_shared_owners = (unint64_t *)&v28->__shared_owners_;
    do
      v25 = __ldaxr(p_shared_owners);
    while (__stlxr(v25 - 1, p_shared_owners));
    if (!v25)
    {
      ((void (*)())v28->__on_zero_shared)();
      std::__shared_weak_count::__release_weak(v28);
    }
  }
  objc_msgSend(v8, "resume");

  _Block_object_dispose(v32, 8);
  return 1;
}

- (void)register_driver:(id)a3 bundle_url:(id)a4 bundle_id:(id)a5 cpu_type:(int)a6 is_using_driver_service:(BOOL)a7 reply:(id)a8
{
  id v14;
  void (**v15)(id, uint64_t);
  id v16;
  AMCP::Log::Scope_Registry *v17;
  unint64_t *v18;
  unint64_t v19;
  id *i;
  AMCP::Log::Scope_Registry *v21;
  NSObject *v22;
  std::__shared_weak_count *v23;
  unint64_t *v24;
  unint64_t v25;
  _opaque_pthread_t *v26;
  mach_port_t v27;
  unint64_t v28;
  char *v29;
  int v30;
  char *v31;
  const char *v33;
  const char *v34;
  _QWORD *v35;
  id v36;
  uint64_t v37;
  uint64_t v38;
  _QWORD *v39;
  uint64_t v40;
  id v41;
  id v42;
  id v43;
  BOOL v44;
  int v45;
  id v46;
  id v47;
  _QWORD v48[3];
  _QWORD *v49;
  uint8_t buf[8];
  _BYTE v51[10];
  __int16 v52;
  int v53;
  __int16 v54;
  const char *v55;
  uint64_t v56;

  v56 = *MEMORY[0x1E0C80C00];
  v42 = a3;
  v43 = a4;
  v14 = a5;
  v15 = (void (**)(id, uint64_t))a8;
  objc_msgSend(MEMORY[0x1E0CB3B38], "currentConnection");
  v16 = (id)objc_claimAutoreleasedReturnValue();
  v17 = (AMCP::Log::Scope_Registry *)-[Core_Audio_Driver_Registrar connection_infos](self, "connection_infos");
  if (*(_QWORD *)v51)
  {
    v18 = (unint64_t *)(*(_QWORD *)v51 + 8);
    do
      v19 = __ldaxr(v18);
    while (__stlxr(v19 - 1, v18));
    if (!v19)
    {
      (*(void (**)(_QWORD))(**(_QWORD **)v51 + 16))(*(_QWORD *)v51);
      std::__shared_weak_count::__release_weak(*(std::__shared_weak_count **)v51);
    }
  }
  for (i = **(id ***)buf; ; i += 2)
  {
    if (i == *(id **)(*(_QWORD *)buf + 8))
    {
      v21 = 0;
      v41 = 0;
      goto LABEL_12;
    }
    if (v16 == i[1])
      break;
  }
  objc_storeStrong(i, a5);
  v41 = *i;
  v17 = (AMCP::Log::Scope_Registry *)i[1];
  v21 = v17;
LABEL_12:
  AMCP::Log::Scope_Registry::get(v17);
  AMCP::Log::Scope_Registry::fetch((AMCP::Log::Scope_Registry *)buf, "com.apple.coreaudio", "AMCP");
  v22 = **(NSObject ***)buf;
  AMCP::Log::Scope::get_os_log_t(**(id **)buf);
  objc_claimAutoreleasedReturnValue();
  v23 = *(std::__shared_weak_count **)v51;
  if (*(_QWORD *)v51)
  {
    v24 = (unint64_t *)(*(_QWORD *)v51 + 8);
    do
      v25 = __ldaxr(v24);
    while (__stlxr(v25 - 1, v24));
    if (!v25)
    {
      ((void (*)(std::__shared_weak_count *))v23->__on_zero_shared)(v23);
      std::__shared_weak_count::__release_weak(v23);
    }
  }
  if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
  {
    v26 = pthread_self();
    v27 = pthread_mach_thread_np(v26);
    v28 = 0;
    v29 = 0;
    v30 = 47;
    do
    {
      v31 = &aLibraryCachesC_4[v28];
      if (v30 == 47)
        v29 = &aLibraryCachesC_4[v28];
      v30 = v31[1];
      if (!v31[1])
        break;
    }
    while (v28++ < 0xFFF);
    if (v29)
      v33 = v29 + 1;
    else
      v33 = "/Library/Caches/com.apple.xbs/Sources/AudioHAL/Source/AMCP/ASP/Portal/Server/Core_Audio_Driver_Registrar.mm";
    if (v14)
      v34 = (const char *)objc_msgSend(objc_retainAutorelease(v14), "UTF8String", v41, v42, v43);
    else
      v34 = "null";
    *(_DWORD *)buf = 67109890;
    *(_DWORD *)&buf[4] = v27;
    *(_WORD *)v51 = 2080;
    *(_QWORD *)&v51[2] = v33;
    v52 = 1024;
    v53 = 83;
    v54 = 2080;
    v55 = v34;
    _os_log_impl(&dword_1B57BA000, v22, OS_LOG_TYPE_DEFAULT, "%6u %32s:%-5d Registering remote driver with bundle id %s", buf, 0x22u);
  }

  v35 = -[Core_Audio_Driver_Registrar registrar](self, "registrar");
  v36 = v14;
  v48[0] = &off_1E696C248;
  v48[1] = v36;
  v48[2] = self;
  v49 = v48;
  *(_QWORD *)buf = v42;
  v47 = v43;
  v46 = v36;
  v45 = a6;
  v44 = a7;
  v37 = v35[9];
  if (!v37)
    std::__throw_bad_function_call[abi:ne180100]();
  v38 = (*(uint64_t (**)(uint64_t, uint8_t *, id *, id *, int *, BOOL *, _QWORD *))(*(_QWORD *)v37 + 48))(v37, buf, &v47, &v46, &v45, &v44, v48);

  v39 = v49;
  if (v49 == v48)
  {
    v40 = 4;
    v39 = v48;
    goto LABEL_36;
  }
  if (v49)
  {
    v40 = 5;
LABEL_36:
    (*(void (**)(void))(*v39 + 8 * v40))();
  }

  v15[2](v15, v38);
}

- (void)registrar
{
  return self->_registrar;
}

- (void)setRegistrar:(void *)a3
{
  self->_registrar = a3;
}

- (shared_ptr<std::vector<Registrar_Connection_Info>>)connection_infos
{
  void **v2;
  __shared_weak_count *cntrl;
  unint64_t *v4;
  unint64_t v5;
  shared_ptr<std::vector<Registrar_Connection_Info>> result;

  cntrl = self->_connection_infos.__cntrl_;
  *v2 = self->_connection_infos.__ptr_;
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

- (void)setConnection_infos:(shared_ptr<std::vector<Registrar_Connection_Info>>)a3
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
  cntrl = self->_connection_infos.__cntrl_;
  self->_connection_infos.__ptr_ = v4;
  self->_connection_infos.__cntrl_ = v3;
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
  std::shared_ptr<AMCP::Log::Scope>::~shared_ptr[abi:ne180100]((uint64_t)&self->_connection_infos);
}

- (id).cxx_construct
{
  *((_QWORD *)self + 2) = 0;
  *((_QWORD *)self + 3) = 0;
  return self;
}

- (uint64_t)register_driver:bundle_url:bundle_id:cpu_type:is_using_driver_service:reply:
{
  if (std::type_info::operator==[abi:ne180100](*(_QWORD *)(a2 + 8), (uint64_t)"Z107-[Core_Audio_Driver_Registrar register_driver:bundle_url:bundle_id:cpu_type:is_using_driver_service:reply:]E3$_1"))
  {
    return a1 + 8;
  }
  else
  {
    return 0;
  }
}

- (void)register_driver:bundle_url:bundle_id:cpu_type:is_using_driver_service:reply:
{
}

- (_QWORD)register_driver:bundle_url:bundle_id:cpu_type:is_using_driver_service:reply:
{
  _QWORD *v2;

  v2 = operator new(0x18uLL);
  *v2 = &off_1E696C248;
  v2[1] = *(id *)(a1 + 8);
  v2[2] = *(id *)(a1 + 16);
  return v2;
}

- (id)register_driver:bundle_url:bundle_id:cpu_type:is_using_driver_service:reply:
{
  id result;

  *a2 = &off_1E696C248;
  a2[1] = *(id *)(a1 + 8);
  result = *(id *)(a1 + 16);
  a2[2] = result;
  return result;
}

@end
