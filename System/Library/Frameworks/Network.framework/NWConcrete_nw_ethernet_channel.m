@implementation NWConcrete_nw_ethernet_channel

- (void)dealloc
{
  NSObject *v3;
  NWConcrete_nw_ethernet_channel *v4;
  int v5;
  const char *v6;
  NSObject *v7;
  uint32_t v8;
  objc_super v9;
  uint8_t buf[4];
  const char *v11;
  __int16 v12;
  NWConcrete_nw_ethernet_channel *v13;
  __int16 v14;
  int v15;
  __int16 v16;
  char *v17;
  __int16 v18;
  int v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  if (self && *((_QWORD *)self + 19))
  {
    pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
    networkd_settings_init();
    v3 = (id)gLogObj;
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
    {
      v4 = (NWConcrete_nw_ethernet_channel *)*((_QWORD *)self + 3);
      v5 = *((_DWORD *)self + 42);
      *(_DWORD *)buf = 136447234;
      v11 = "-[NWConcrete_nw_ethernet_channel dealloc]";
      v12 = 2080;
      v13 = v4;
      v14 = 1042;
      v15 = 16;
      v16 = 2098;
      v17 = (char *)self + 115;
      v18 = 1024;
      v19 = v5;
      v6 = "%{public}s [%s: nexus instance %{public,uuid_t}.16P <fd %d>] dealloc";
      v7 = v3;
      v8 = 44;
LABEL_7:
      _os_log_impl(&dword_182FBE000, v7, OS_LOG_TYPE_DEBUG, v6, buf, v8);
    }
  }
  else
  {
    pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
    networkd_settings_init();
    v3 = (id)gLogObj;
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 136446466;
      v11 = "-[NWConcrete_nw_ethernet_channel dealloc]";
      v12 = 2114;
      v13 = self;
      v6 = "%{public}s [%{public}@] dealloc";
      v7 = v3;
      v8 = 22;
      goto LABEL_7;
    }
  }

  -[NWConcrete_nw_ethernet_channel close]((uint64_t)self);
  v9.receiver = self;
  v9.super_class = (Class)NWConcrete_nw_ethernet_channel;
  -[NWConcrete_nw_ethernet_channel dealloc](&v9, sel_dealloc);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)self + 11, 0);
  objc_storeStrong((id *)self + 10, 0);
  objc_storeStrong((id *)self + 9, 0);
  objc_storeStrong((id *)self + 8, 0);
  objc_storeStrong((id *)self + 7, 0);
  objc_storeStrong((id *)self + 6, 0);
  objc_storeStrong((id *)self + 5, 0);
  objc_storeStrong((id *)self + 2, 0);
}

- (id).cxx_construct
{
  *((_DWORD *)self + 2) = 0;
  return self;
}

- (void)close
{
  uint64_t v2;
  NSObject *v3;
  _BOOL4 v4;
  uint64_t v5;
  int v6;
  const char *v7;
  NSObject *v8;
  uint32_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  int v17;
  const char *v18;
  __int16 v19;
  uint64_t v20;
  __int16 v21;
  int v22;
  __int16 v23;
  uint64_t v24;
  __int16 v25;
  int v26;
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  if (!a1)
    return;
  v2 = *(_QWORD *)(a1 + 152);
  pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
  networkd_settings_init();
  v3 = (id)gLogObj;
  v4 = os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG);
  if (v2)
  {
    if (v4)
    {
      v5 = *(_QWORD *)(a1 + 24);
      v6 = *(_DWORD *)(a1 + 168);
      v17 = 136447234;
      v18 = "-[NWConcrete_nw_ethernet_channel close]";
      v19 = 2080;
      v20 = v5;
      v21 = 1042;
      v22 = 16;
      v23 = 2098;
      v24 = a1 + 115;
      v25 = 1024;
      v26 = v6;
      v7 = "%{public}s [%s: nexus instance %{public,uuid_t}.16P <fd %d>] close";
      v8 = v3;
      v9 = 44;
LABEL_7:
      _os_log_impl(&dword_182FBE000, v8, OS_LOG_TYPE_DEBUG, v7, (uint8_t *)&v17, v9);
    }
  }
  else if (v4)
  {
    v17 = 136446466;
    v18 = "-[NWConcrete_nw_ethernet_channel close]";
    v19 = 2114;
    v20 = a1;
    v7 = "%{public}s [%{public}@] close";
    v8 = v3;
    v9 = 22;
    goto LABEL_7;
  }

  v10 = *(void **)(a1 + 40);
  *(_QWORD *)(a1 + 40) = 0;

  v11 = *(void **)(a1 + 56);
  *(_QWORD *)(a1 + 56) = 0;

  v12 = *(void **)(a1 + 64);
  *(_QWORD *)(a1 + 64) = 0;

  -[NWConcrete_nw_ethernet_channel closeChannel:](a1, 0);
  v13 = *(void **)(a1 + 72);
  if (v13)
  {
    nw_path_evaluator_cancel(v13);
    v14 = *(void **)(a1 + 72);
    *(_QWORD *)(a1 + 72) = 0;

  }
  v15 = *(void **)(a1 + 80);
  if (v15)
  {
    nw_path_flow_registration_close(v15);
    v16 = *(void **)(a1 + 80);
    *(_QWORD *)(a1 + 80) = 0;

  }
}

- (void)closeChannel:(uint64_t)a1
{
  uint64_t v4;
  NSObject *v5;
  _BOOL4 v6;
  uint64_t v7;
  int v8;
  const char *v9;
  NSObject *v10;
  uint32_t v11;
  _DWORD *posix_error;
  uint64_t v13;
  NSObject *v14;
  _BOOL4 v15;
  uint64_t v16;
  int v17;
  const char *v18;
  NSObject *v19;
  uint32_t v20;
  uint64_t v21;
  NSObject *v22;
  uint64_t v23;
  int v24;
  void *v25;
  void *v26;
  int v27;
  const char *v28;
  __int16 v29;
  uint64_t v30;
  __int16 v31;
  int v32;
  __int16 v33;
  uint64_t v34;
  __int16 v35;
  int v36;
  uint64_t v37;

  v37 = *MEMORY[0x1E0C80C00];
  if (!a1)
    return;
  v4 = *(_QWORD *)(a1 + 152);
  pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
  networkd_settings_init();
  v5 = (id)gLogObj;
  v6 = os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG);
  if (v4)
  {
    if (!v6)
      goto LABEL_8;
    v7 = *(_QWORD *)(a1 + 24);
    v8 = *(_DWORD *)(a1 + 168);
    v27 = 136447234;
    v28 = "-[NWConcrete_nw_ethernet_channel closeChannel:]";
    v29 = 2080;
    v30 = v7;
    v31 = 1042;
    v32 = 16;
    v33 = 2098;
    v34 = a1 + 115;
    v35 = 1024;
    v36 = v8;
    v9 = "%{public}s [%s: nexus instance %{public,uuid_t}.16P <fd %d>] closeChannel";
    v10 = v5;
    v11 = 44;
  }
  else
  {
    if (!v6)
      goto LABEL_8;
    v27 = 136446466;
    v28 = "-[NWConcrete_nw_ethernet_channel closeChannel:]";
    v29 = 2114;
    v30 = a1;
    v9 = "%{public}s [%{public}@] closeChannel";
    v10 = v5;
    v11 = 22;
  }
  _os_log_impl(&dword_182FBE000, v10, OS_LOG_TYPE_DEBUG, v9, (uint8_t *)&v27, v11);
LABEL_8:

  if (!*(_BYTE *)(a1 + 113))
  {
    if (a2)
      posix_error = nw_error_create_posix_error(a2);
    else
      posix_error = 0;
    -[NWConcrete_nw_ethernet_channel updateClientState:error:](a1, 4, posix_error);

  }
  if (!*(_QWORD *)(a1 + 104))
    goto LABEL_21;
  v13 = *(_QWORD *)(a1 + 152);
  pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
  networkd_settings_init();
  v14 = (id)gLogObj;
  v15 = os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG);
  if (v13)
  {
    if (v15)
    {
      v16 = *(_QWORD *)(a1 + 24);
      v17 = *(_DWORD *)(a1 + 168);
      v27 = 136447234;
      v28 = "-[NWConcrete_nw_ethernet_channel closeChannel:]";
      v29 = 2080;
      v30 = v16;
      v31 = 1042;
      v32 = 16;
      v33 = 2098;
      v34 = a1 + 115;
      v35 = 1024;
      v36 = v17;
      v18 = "%{public}s [%s: nexus instance %{public,uuid_t}.16P <fd %d>] close: cancel input";
      v19 = v14;
      v20 = 44;
LABEL_19:
      _os_log_impl(&dword_182FBE000, v19, OS_LOG_TYPE_DEBUG, v18, (uint8_t *)&v27, v20);
    }
  }
  else if (v15)
  {
    v27 = 136446466;
    v28 = "-[NWConcrete_nw_ethernet_channel closeChannel:]";
    v29 = 2114;
    v30 = a1;
    v18 = "%{public}s [%{public}@] close: cancel input";
    v19 = v14;
    v20 = 22;
    goto LABEL_19;
  }

  nw_queue_cancel_source(*(_QWORD *)(a1 + 104), v21);
  *(_QWORD *)(a1 + 104) = 0;
  *(_BYTE *)(a1 + 112) = 0;
LABEL_21:
  if (*(_QWORD *)(a1 + 152))
  {
    pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
    networkd_settings_init();
    v22 = (id)gLogObj;
    if (os_log_type_enabled(v22, OS_LOG_TYPE_DEBUG))
    {
      v23 = *(_QWORD *)(a1 + 24);
      v24 = *(_DWORD *)(a1 + 168);
      v27 = 136447234;
      v28 = "-[NWConcrete_nw_ethernet_channel closeChannel:]";
      v29 = 2080;
      v30 = v23;
      v31 = 1042;
      v32 = 16;
      v33 = 2098;
      v34 = a1 + 115;
      v35 = 1024;
      v36 = v24;
      _os_log_impl(&dword_182FBE000, v22, OS_LOG_TYPE_DEBUG, "%{public}s [%s: nexus instance %{public,uuid_t}.16P <fd %d>] close: cancel channel", (uint8_t *)&v27, 0x2Cu);
    }

    os_channel_destroy();
    *(_QWORD *)(a1 + 152) = 0;
  }
  *(_DWORD *)(a1 + 168) = -1;
  *(_QWORD *)(a1 + 176) = 0;
  *(_QWORD *)(a1 + 184) = 0;
  if (*(_QWORD *)(a1 + 160))
  {
    os_channel_attr_destroy();
    *(_QWORD *)(a1 + 160) = 0;
  }
  v25 = *(void **)(a1 + 16);
  *(_QWORD *)(a1 + 16) = 0;

  *(_DWORD *)(a1 + 132) = 0;
  uuid_clear((unsigned __int8 *)(a1 + 115));
  uuid_clear((unsigned __int8 *)(a1 + 136));
  v26 = *(void **)(a1 + 88);
  *(_QWORD *)(a1 + 88) = 0;

  *(_WORD *)(a1 + 100) = 0;
  *(_DWORD *)(a1 + 96) = 0;
}

- (void)updateClientState:(void *)a3 error:
{
  id v5;
  const void *v6;
  NSObject *v7;
  _QWORD block[4];
  id v9;
  _QWORD *v10;
  int v11;
  _QWORD v12[5];
  id v13;

  v5 = a3;
  v6 = *(const void **)(a1 + 48);
  if (v6 && *(_QWORD *)(a1 + 40))
  {
    v12[0] = 0;
    v12[1] = v12;
    v12[2] = 0x3032000000;
    v12[3] = __Block_byref_object_copy__1943;
    v12[4] = __Block_byref_object_dispose__1944;
    v13 = _Block_copy(v6);
    v7 = *(NSObject **)(a1 + 40);
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __58__NWConcrete_nw_ethernet_channel_updateClientState_error___block_invoke;
    block[3] = &unk_1E14AB500;
    v10 = v12;
    v11 = a2;
    v9 = v5;
    dispatch_async(v7, block);

    _Block_object_dispose(v12, 8);
  }

}

- (unsigned)initWithEtherType:(void *)a3 interface:(void *)a4 parameters:
{
  char *v8;
  nw_parameters_t v9;
  char *v10;
  unsigned __int16 *v11;
  _WORD *v12;
  nw_interface_t *v13;
  char *v14;
  void *v15;
  void *v16;
  id v17;
  void *v18;
  id v19;
  uint64_t v20;
  NSObject *v21;
  _BOOL4 v22;
  char *v23;
  int v24;
  unsigned __int16 *v25;
  NWConcrete_nw_path_evaluator *evaluator_for_custom_ether;
  void *v27;
  uint64_t v28;
  NSObject *v29;
  _BOOL4 v30;
  int v31;
  int v32;
  char *v33;
  uint64_t v34;
  int v35;
  char *v36;
  void *v38;
  char *v39;
  NSObject *v40;
  os_log_type_t v41;
  char *backtrace_string;
  os_log_type_t v43;
  _BOOL4 v44;
  void *v45;
  char *v46;
  NSObject *v47;
  os_log_type_t v48;
  char *v49;
  os_log_type_t v50;
  _BOOL4 v51;
  os_log_type_t v52;
  os_log_type_t v53;
  char v54;
  os_log_type_t type;
  objc_super v56;
  uint8_t buf[4];
  const char *v58;
  __int16 v59;
  char *v60;
  __int16 v61;
  int v62;
  __int16 v63;
  char *v64;
  __int16 v65;
  int v66;
  __int16 v67;
  int v68;
  __int16 v69;
  uint64_t v70;
  uint64_t v71;

  v71 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  if (!a1)
    goto LABEL_17;
  v56.receiver = a1;
  v56.super_class = (Class)NWConcrete_nw_ethernet_channel;
  v10 = (char *)objc_msgSendSuper2(&v56, sel_init);
  v11 = (unsigned __int16 *)v10;
  if (!v10)
  {
    __nwlog_obj();
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 136446210;
    v58 = "-[NWConcrete_nw_ethernet_channel initWithEtherType:interface:parameters:]";
    v39 = (char *)_os_log_send_and_compose_impl();

    type = OS_LOG_TYPE_ERROR;
    v54 = 0;
    if (__nwlog_fault(v39, &type, &v54))
    {
      if (type == OS_LOG_TYPE_FAULT)
      {
        __nwlog_obj();
        v40 = objc_claimAutoreleasedReturnValue();
        v41 = type;
        if (os_log_type_enabled(v40, type))
        {
          *(_DWORD *)buf = 136446210;
          v58 = "-[NWConcrete_nw_ethernet_channel initWithEtherType:interface:parameters:]";
          _os_log_impl(&dword_182FBE000, v40, v41, "%{public}s [super init] failed", buf, 0xCu);
        }
      }
      else if (v54)
      {
        backtrace_string = (char *)__nw_create_backtrace_string();
        __nwlog_obj();
        v40 = objc_claimAutoreleasedReturnValue();
        v43 = type;
        v44 = os_log_type_enabled(v40, type);
        if (backtrace_string)
        {
          if (v44)
          {
            *(_DWORD *)buf = 136446466;
            v58 = "-[NWConcrete_nw_ethernet_channel initWithEtherType:interface:parameters:]";
            v59 = 2082;
            v60 = backtrace_string;
            _os_log_impl(&dword_182FBE000, v40, v43, "%{public}s [super init] failed, dumping backtrace:%{public}s", buf, 0x16u);
          }

          free(backtrace_string);
          goto LABEL_61;
        }
        if (v44)
        {
          *(_DWORD *)buf = 136446210;
          v58 = "-[NWConcrete_nw_ethernet_channel initWithEtherType:interface:parameters:]";
          _os_log_impl(&dword_182FBE000, v40, v43, "%{public}s [super init] failed, no backtrace", buf, 0xCu);
        }
      }
      else
      {
        __nwlog_obj();
        v40 = objc_claimAutoreleasedReturnValue();
        v52 = type;
        if (os_log_type_enabled(v40, type))
        {
          *(_DWORD *)buf = 136446210;
          v58 = "-[NWConcrete_nw_ethernet_channel initWithEtherType:interface:parameters:]";
          _os_log_impl(&dword_182FBE000, v40, v52, "%{public}s [super init] failed, backtrace limit exceeded", buf, 0xCu);
        }
      }

    }
LABEL_61:
    if (v39)
      free(v39);
    goto LABEL_17;
  }
  *((_WORD *)v10 + 6) = a2;
  v12 = v10 + 12;
  v13 = (nw_interface_t *)(v10 + 16);
  objc_storeStrong((id *)v10 + 2, a3);
  v14 = v8 + 104;
  if (!v8)
    v14 = 0;
  *((_QWORD *)v11 + 3) = v14;
  v15 = (void *)*((_QWORD *)v11 + 8);
  *((_QWORD *)v11 + 8) = 0;

  v16 = (void *)*((_QWORD *)v11 + 5);
  *((_QWORD *)v11 + 5) = 0;

  *((_BYTE *)v11 + 113) = 0;
  if (*v12 && *v13)
  {
    if (v9)
    {
      v9 = v9;
      v17 = *((id *)v9[13].isa + 17);

      v18 = (void *)*((_QWORD *)v11 + 8);
      *((_QWORD *)v11 + 8) = v17;

      v19 = *((id *)v11 + 8);
      if (v19)
        goto LABEL_22;
    }
    else
    {
      v9 = nw_parameters_create();
    }
    if (nw_context_copy_implicit_context::onceToken[0] != -1)
      dispatch_once(nw_context_copy_implicit_context::onceToken, &__block_literal_global_14);
    v19 = (id)nw_context_copy_implicit_context::implicit_context;
    nw_parameters_set_context(v9, v19);
LABEL_22:
    if (!nw_context_is_inline(v19))
    {
      nw_parameters_require_interface(v9, *v13);
      evaluator_for_custom_ether = nw_path_create_evaluator_for_custom_ether(v9, v11[6]);
      v27 = (void *)*((_QWORD *)v11 + 9);
      *((_QWORD *)v11 + 9) = evaluator_for_custom_ether;

      if (*((_QWORD *)v11 + 9))
      {
        v25 = v11;
LABEL_33:

        goto LABEL_34;
      }
      v28 = *((_QWORD *)v11 + 19);
      pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
      networkd_settings_init();
      v29 = (id)gLogObj;
      v30 = os_log_type_enabled(v29, OS_LOG_TYPE_ERROR);
      if (v28)
      {
        if (v30)
        {
          v31 = *((_DWORD *)v11 + 42);
          v32 = v11[6];
          v34 = *((_QWORD *)v11 + 2);
          v33 = (char *)*((_QWORD *)v11 + 3);
          *(_DWORD *)buf = 136447746;
          v58 = "-[NWConcrete_nw_ethernet_channel initWithEtherType:interface:parameters:]";
          v59 = 2080;
          v60 = v33;
          v61 = 1042;
          v62 = 16;
          v63 = 2098;
          v64 = (char *)v11 + 115;
          v65 = 1024;
          v66 = v31;
          v67 = 1024;
          v68 = v32;
          v69 = 2112;
          v70 = v34;
          _os_log_impl(&dword_182FBE000, v29, OS_LOG_TYPE_ERROR, "%{public}s [%s: nexus instance %{public,uuid_t}.16P <fd %d>] initWithEtherType: failed to create evaluator for ethertype %X interface %@", buf, 0x3Cu);
        }
      }
      else if (v30)
      {
        v35 = v11[6];
        v36 = (char *)*((_QWORD *)v11 + 2);
        *(_DWORD *)buf = 136446978;
        v58 = "-[NWConcrete_nw_ethernet_channel initWithEtherType:interface:parameters:]";
        v59 = 2114;
        v60 = (char *)v11;
        v61 = 1024;
        v62 = v35;
        v63 = 2112;
        v64 = v36;
        _os_log_impl(&dword_182FBE000, v29, OS_LOG_TYPE_ERROR, "%{public}s [%{public}@] initWithEtherType: failed to create evaluator for ethertype %X interface %@", buf, 0x26u);
      }

LABEL_32:
      v25 = 0;
      goto LABEL_33;
    }
    __nwlog_obj();
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 136446210;
    v58 = "-[NWConcrete_nw_ethernet_channel initWithEtherType:interface:parameters:]";
    v46 = (char *)_os_log_send_and_compose_impl();

    type = OS_LOG_TYPE_ERROR;
    v54 = 0;
    if (__nwlog_fault(v46, &type, &v54))
    {
      if (type == OS_LOG_TYPE_FAULT)
      {
        __nwlog_obj();
        v47 = objc_claimAutoreleasedReturnValue();
        v48 = type;
        if (os_log_type_enabled(v47, type))
        {
          *(_DWORD *)buf = 136446210;
          v58 = "-[NWConcrete_nw_ethernet_channel initWithEtherType:interface:parameters:]";
          _os_log_impl(&dword_182FBE000, v47, v48, "%{public}s Cannot use nw_ethernet_channel on inline contexts", buf, 0xCu);
        }
      }
      else if (v54)
      {
        v49 = (char *)__nw_create_backtrace_string();
        __nwlog_obj();
        v47 = objc_claimAutoreleasedReturnValue();
        v50 = type;
        v51 = os_log_type_enabled(v47, type);
        if (v49)
        {
          if (v51)
          {
            *(_DWORD *)buf = 136446466;
            v58 = "-[NWConcrete_nw_ethernet_channel initWithEtherType:interface:parameters:]";
            v59 = 2082;
            v60 = v49;
            _os_log_impl(&dword_182FBE000, v47, v50, "%{public}s Cannot use nw_ethernet_channel on inline contexts, dumping backtrace:%{public}s", buf, 0x16u);
          }

          free(v49);
          goto LABEL_69;
        }
        if (v51)
        {
          *(_DWORD *)buf = 136446210;
          v58 = "-[NWConcrete_nw_ethernet_channel initWithEtherType:interface:parameters:]";
          _os_log_impl(&dword_182FBE000, v47, v50, "%{public}s Cannot use nw_ethernet_channel on inline contexts, no backtrace", buf, 0xCu);
        }
      }
      else
      {
        __nwlog_obj();
        v47 = objc_claimAutoreleasedReturnValue();
        v53 = type;
        if (os_log_type_enabled(v47, type))
        {
          *(_DWORD *)buf = 136446210;
          v58 = "-[NWConcrete_nw_ethernet_channel initWithEtherType:interface:parameters:]";
          _os_log_impl(&dword_182FBE000, v47, v53, "%{public}s Cannot use nw_ethernet_channel on inline contexts, backtrace limit exceeded", buf, 0xCu);
        }
      }

    }
LABEL_69:
    if (v46)
      free(v46);
    goto LABEL_32;
  }
  v20 = *((_QWORD *)v11 + 19);
  pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
  networkd_settings_init();
  v21 = (id)gLogObj;
  v22 = os_log_type_enabled(v21, OS_LOG_TYPE_ERROR);
  if (v20)
  {
    if (v22)
    {
      v23 = (char *)*((_QWORD *)v11 + 3);
      v24 = *((_DWORD *)v11 + 42);
      *(_DWORD *)buf = 136447234;
      v58 = "-[NWConcrete_nw_ethernet_channel initWithEtherType:interface:parameters:]";
      v59 = 2080;
      v60 = v23;
      v61 = 1042;
      v62 = 16;
      v63 = 2098;
      v64 = (char *)v11 + 115;
      v65 = 1024;
      v66 = v24;
      _os_log_impl(&dword_182FBE000, v21, OS_LOG_TYPE_ERROR, "%{public}s [%s: nexus instance %{public,uuid_t}.16P <fd %d>] initWithEtherType: must specify ethertype and interface", buf, 0x2Cu);
    }
  }
  else if (v22)
  {
    *(_DWORD *)buf = 136446466;
    v58 = "-[NWConcrete_nw_ethernet_channel initWithEtherType:interface:parameters:]";
    v59 = 2114;
    v60 = (char *)v11;
    _os_log_impl(&dword_182FBE000, v21, OS_LOG_TYPE_ERROR, "%{public}s [%{public}@] initWithEtherType: must specify ethertype and interface", buf, 0x16u);
  }

LABEL_17:
  v25 = 0;
LABEL_34:

  return v25;
}

- (uint64_t)createChannel
{
  NSObject *v2;
  uint64_t v3;
  int v4;
  void *v6;
  id v7;
  uint64_t v8;
  NSObject *v9;
  _BOOL4 v10;
  uint64_t v11;
  int v12;
  NSObject *v13;
  uint64_t nexus_key;
  int v15;
  uint64_t v16;
  NSObject *v17;
  NSObject *v18;
  _BOOL4 v19;
  uint64_t v20;
  int v21;
  int v22;
  const char *v23;
  NSObject *v24;
  uint32_t v25;
  uint64_t v26;
  _BOOL4 v27;
  uint64_t v28;
  int v29;
  _BOOL4 v30;
  uint64_t v31;
  int v32;
  int v33;
  uint64_t v34;
  int v35;
  void *v36;
  char *v37;
  NSObject *v38;
  os_log_type_t v39;
  void *v40;
  os_log_type_t v41;
  int v42;
  void *v43;
  os_log_type_t v44;
  char *backtrace_string;
  os_log_type_t v46;
  _BOOL4 v47;
  char *v48;
  os_log_type_t v49;
  _BOOL4 v50;
  uint64_t extended;
  int fd;
  uint64_t v53;
  NSObject *v54;
  _BOOL4 v55;
  uint64_t v56;
  int v57;
  const char *v58;
  NSObject *v59;
  uint32_t v60;
  os_log_type_t v61;
  os_log_type_t v62;
  _BOOL4 v63;
  os_log_type_t v64;
  void *v65;
  int v66;
  char *v67;
  NSObject *v68;
  os_log_type_t v69;
  int v70;
  os_log_type_t v71;
  void *v72;
  char *v73;
  NSObject *v74;
  os_log_type_t v75;
  char *v77;
  os_log_type_t v78;
  _BOOL4 v79;
  int v80;
  uint64_t v81;
  void *v82;
  uint64_t v83;
  uint64_t v84;
  char *v85;
  NSObject *v86;
  os_log_type_t v87;
  uint64_t v88;
  uint64_t v89;
  char *v90;
  os_log_type_t v91;
  _BOOL4 v92;
  char *v93;
  os_log_type_t v94;
  _BOOL4 v95;
  uint64_t v96;
  uint64_t v97;
  void *v98;
  char *v99;
  NSObject *v100;
  os_log_type_t v101;
  os_log_type_t v102;
  int v103;
  int v104;
  os_log_type_t v105;
  os_log_type_t v106;
  uint64_t v107;
  uint64_t v108;
  char *v109;
  os_log_type_t v110;
  _BOOL4 v111;
  uint64_t v112;
  uint64_t v113;
  os_log_type_t v114;
  void *v115;
  int v116;
  os_log_type_t v117;
  int v118;
  os_log_type_t v119;
  _BOOL4 v120;
  int v121;
  os_log_type_t v122;
  int v123;
  int v124;
  char v125;
  os_log_type_t type[11];
  os_log_type_t v127;
  int v128;
  uint8_t buf[4];
  const char *v130;
  __int16 v131;
  _BYTE v132[30];
  __int128 v133;
  __int16 v134;
  _BYTE v135[14];
  __int16 v136;
  int v137;
  uint64_t v138;

  v138 = *MEMORY[0x1E0C80C00];
  v128 = 0;
  if (!*(_QWORD *)(a1 + 152))
  {
    v6 = *(void **)(a1 + 88);
    if (!v6)
    {
      pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
      networkd_settings_init();
      v13 = (id)gLogObj;
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136446466;
        v130 = "-[NWConcrete_nw_ethernet_channel createChannel]";
        v131 = 2114;
        *(_QWORD *)v132 = a1;
        _os_log_impl(&dword_182FBE000, v13, OS_LOG_TYPE_ERROR, "%{public}s [%{public}@] createChannel: no flow", buf, 0x16u);
      }

      return 0;
    }
    v7 = v6;
    *(_DWORD *)(a1 + 132) = *((_DWORD *)v7 + 42);
    if (uuid_is_null((const unsigned __int8 *)v7 + 128))
    {

      v8 = *(_QWORD *)(a1 + 152);
      pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
      networkd_settings_init();
      v9 = (id)gLogObj;
      v10 = os_log_type_enabled(v9, OS_LOG_TYPE_ERROR);
      if (v8)
      {
        if (v10)
        {
          v11 = *(_QWORD *)(a1 + 24);
          v12 = *(_DWORD *)(a1 + 168);
          *(_DWORD *)buf = 136447234;
          v130 = "-[NWConcrete_nw_ethernet_channel createChannel]";
          v131 = 2080;
          *(_QWORD *)v132 = v11;
          *(_WORD *)&v132[8] = 1042;
          *(_DWORD *)&v132[10] = 16;
          *(_WORD *)&v132[14] = 2098;
          *(_QWORD *)&v132[16] = a1 + 115;
          *(_WORD *)&v132[24] = 1024;
          *(_DWORD *)&v132[26] = v12;
          _os_log_impl(&dword_182FBE000, v9, OS_LOG_TYPE_ERROR, "%{public}s [%s: nexus instance %{public,uuid_t}.16P <fd %d>] createChannel: no nexus instance / port", buf, 0x2Cu);
        }
      }
      else if (v10)
      {
        *(_DWORD *)buf = 136446466;
        v130 = "-[NWConcrete_nw_ethernet_channel createChannel]";
        v131 = 2114;
        *(_QWORD *)v132 = a1;
        _os_log_impl(&dword_182FBE000, v9, OS_LOG_TYPE_ERROR, "%{public}s [%{public}@] createChannel: no nexus instance / port", buf, 0x16u);
      }
LABEL_33:

      return 0;
    }
    *(_OWORD *)(a1 + 115) = *((_OWORD *)v7 + 8);

    if ((nw_path_flow_get_id(*(void **)(a1 + 88), (_OWORD *)(a1 + 136)) & 1) == 0)
    {
      v26 = *(_QWORD *)(a1 + 152);
      pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
      networkd_settings_init();
      v9 = (id)gLogObj;
      v27 = os_log_type_enabled(v9, OS_LOG_TYPE_ERROR);
      if (v26)
      {
        if (v27)
        {
          v28 = *(_QWORD *)(a1 + 24);
          v29 = *(_DWORD *)(a1 + 168);
          *(_DWORD *)buf = 136447234;
          v130 = "-[NWConcrete_nw_ethernet_channel createChannel]";
          v131 = 2080;
          *(_QWORD *)v132 = v28;
          *(_WORD *)&v132[8] = 1042;
          *(_DWORD *)&v132[10] = 16;
          *(_WORD *)&v132[14] = 2098;
          *(_QWORD *)&v132[16] = a1 + 115;
          *(_WORD *)&v132[24] = 1024;
          *(_DWORD *)&v132[26] = v29;
          _os_log_impl(&dword_182FBE000, v9, OS_LOG_TYPE_ERROR, "%{public}s [%s: nexus instance %{public,uuid_t}.16P <fd %d>] createChannel: no flow id", buf, 0x2Cu);
        }
      }
      else if (v27)
      {
        *(_DWORD *)buf = 136446466;
        v130 = "-[NWConcrete_nw_ethernet_channel createChannel]";
        v131 = 2114;
        *(_QWORD *)v132 = a1;
        _os_log_impl(&dword_182FBE000, v9, OS_LOG_TYPE_ERROR, "%{public}s [%{public}@] createChannel: no flow id", buf, 0x16u);
      }
      goto LABEL_33;
    }
    nexus_key = nw_path_flow_get_nexus_key(*(void **)(a1 + 88), &v128);
    v15 = v128;
    v16 = *(_QWORD *)(a1 + 152);
    pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
    networkd_settings_init();
    v17 = (id)gLogObj;
    v18 = v17;
    if (!nexus_key || !v15)
    {
      v30 = os_log_type_enabled(v17, OS_LOG_TYPE_ERROR);
      if (v16)
      {
        if (v30)
        {
          v31 = *(_QWORD *)(a1 + 24);
          v32 = *(_DWORD *)(a1 + 168);
          *(_DWORD *)buf = 136447234;
          v130 = "-[NWConcrete_nw_ethernet_channel createChannel]";
          v131 = 2080;
          *(_QWORD *)v132 = v31;
          *(_WORD *)&v132[8] = 1042;
          *(_DWORD *)&v132[10] = 16;
          *(_WORD *)&v132[14] = 2098;
          *(_QWORD *)&v132[16] = a1 + 115;
          *(_WORD *)&v132[24] = 1024;
          *(_DWORD *)&v132[26] = v32;
          _os_log_impl(&dword_182FBE000, v18, OS_LOG_TYPE_ERROR, "%{public}s [%s: nexus instance %{public,uuid_t}.16P <fd %d>] createChannel: no flow key or key length", buf, 0x2Cu);
        }
      }
      else if (v30)
      {
        *(_DWORD *)buf = 136446466;
        v130 = "-[NWConcrete_nw_ethernet_channel createChannel]";
        v131 = 2114;
        *(_QWORD *)v132 = a1;
        _os_log_impl(&dword_182FBE000, v18, OS_LOG_TYPE_ERROR, "%{public}s [%{public}@] createChannel: no flow key or key length", buf, 0x16u);
      }

      return 0;
    }
    v19 = os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG);
    if (v16)
    {
      if (!v19)
        goto LABEL_37;
      v20 = *(_QWORD *)(a1 + 24);
      v21 = *(_DWORD *)(a1 + 168);
      v22 = *(_DWORD *)(a1 + 132);
      *(_DWORD *)buf = 136448514;
      v130 = "-[NWConcrete_nw_ethernet_channel createChannel]";
      v131 = 2080;
      *(_QWORD *)v132 = v20;
      *(_WORD *)&v132[8] = 1042;
      *(_DWORD *)&v132[10] = 16;
      *(_WORD *)&v132[14] = 2098;
      *(_QWORD *)&v132[16] = a1 + 115;
      *(_WORD *)&v132[24] = 1024;
      *(_DWORD *)&v132[26] = v21;
      LOWORD(v133) = 1042;
      *(_DWORD *)((char *)&v133 + 2) = 16;
      WORD3(v133) = 2098;
      *((_QWORD *)&v133 + 1) = a1 + 136;
      v134 = 1042;
      *(_DWORD *)v135 = 16;
      *(_WORD *)&v135[4] = 2098;
      *(_QWORD *)&v135[6] = a1 + 115;
      v136 = 1024;
      v137 = v22;
      v23 = "%{public}s [%s: nexus instance %{public,uuid_t}.16P <fd %d>] Establishing channel for flow id %{public, uuid"
            "_t}.16P nexus instance %{public, uuid_t}.16P port %d";
      v24 = v18;
      v25 = 82;
    }
    else
    {
      if (!v19)
        goto LABEL_37;
      v33 = *(_DWORD *)(a1 + 132);
      *(_DWORD *)buf = 136447746;
      v130 = "-[NWConcrete_nw_ethernet_channel createChannel]";
      v131 = 2114;
      *(_QWORD *)v132 = a1;
      *(_WORD *)&v132[8] = 1042;
      *(_DWORD *)&v132[10] = 16;
      *(_WORD *)&v132[14] = 2098;
      *(_QWORD *)&v132[16] = a1 + 136;
      *(_WORD *)&v132[24] = 1042;
      *(_DWORD *)&v132[26] = 16;
      LOWORD(v133) = 2098;
      *(_QWORD *)((char *)&v133 + 2) = a1 + 115;
      WORD5(v133) = 1024;
      HIDWORD(v133) = v33;
      v23 = "%{public}s [%{public}@] Establishing channel for flow id %{public, uuid_t}.16P nexus instance %{public, uuid_t}.16P port %d";
      v24 = v18;
      v25 = 60;
    }
    _os_log_impl(&dword_182FBE000, v24, OS_LOG_TYPE_DEBUG, v23, buf, v25);
LABEL_37:

    v34 = os_channel_attr_create();
    *(_QWORD *)(a1 + 160) = v34;
    if (v34)
    {
      v35 = os_channel_attr_set_key();
      if (v35)
      {
        __nwlog_obj();
        v36 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 136446722;
        v130 = "-[NWConcrete_nw_ethernet_channel createChannel]";
        v131 = 2112;
        *(_QWORD *)v132 = a1;
        *(_WORD *)&v132[8] = 1024;
        *(_DWORD *)&v132[10] = v35;
        v37 = (char *)_os_log_send_and_compose_impl();

        type[0] = OS_LOG_TYPE_ERROR;
        v127 = OS_LOG_TYPE_DEFAULT;
        if (!__nwlog_fault(v37, type, &v127))
          goto LABEL_107;
        if (type[0] == OS_LOG_TYPE_FAULT)
        {
          __nwlog_obj();
          v38 = objc_claimAutoreleasedReturnValue();
          v39 = type[0];
          if (os_log_type_enabled(v38, type[0]))
          {
            *(_DWORD *)buf = 136446722;
            v130 = "-[NWConcrete_nw_ethernet_channel createChannel]";
            v131 = 2112;
            *(_QWORD *)v132 = a1;
            *(_WORD *)&v132[8] = 1024;
            *(_DWORD *)&v132[10] = v35;
            _os_log_impl(&dword_182FBE000, v38, v39, "%{public}s %@: createChannel failed to set key <err %d> ", buf, 0x1Cu);
          }
LABEL_106:

          goto LABEL_107;
        }
        if (v127 == OS_LOG_TYPE_DEFAULT)
        {
          __nwlog_obj();
          v38 = objc_claimAutoreleasedReturnValue();
          v61 = type[0];
          if (os_log_type_enabled(v38, type[0]))
          {
            *(_DWORD *)buf = 136446722;
            v130 = "-[NWConcrete_nw_ethernet_channel createChannel]";
            v131 = 2112;
            *(_QWORD *)v132 = a1;
            *(_WORD *)&v132[8] = 1024;
            *(_DWORD *)&v132[10] = v35;
            _os_log_impl(&dword_182FBE000, v38, v61, "%{public}s %@: createChannel failed to set key <err %d> , backtrace limit exceeded", buf, 0x1Cu);
          }
          goto LABEL_106;
        }
        backtrace_string = (char *)__nw_create_backtrace_string();
        __nwlog_obj();
        v38 = objc_claimAutoreleasedReturnValue();
        v46 = type[0];
        v47 = os_log_type_enabled(v38, type[0]);
        if (!backtrace_string)
        {
          if (v47)
          {
            *(_DWORD *)buf = 136446722;
            v130 = "-[NWConcrete_nw_ethernet_channel createChannel]";
            v131 = 2112;
            *(_QWORD *)v132 = a1;
            *(_WORD *)&v132[8] = 1024;
            *(_DWORD *)&v132[10] = v35;
            _os_log_impl(&dword_182FBE000, v38, v46, "%{public}s %@: createChannel failed to set key <err %d> , no backtrace", buf, 0x1Cu);
          }
          goto LABEL_106;
        }
        if (v47)
        {
          *(_DWORD *)buf = 136446978;
          v130 = "-[NWConcrete_nw_ethernet_channel createChannel]";
          v131 = 2112;
          *(_QWORD *)v132 = a1;
          *(_WORD *)&v132[8] = 1024;
          *(_DWORD *)&v132[10] = v35;
          *(_WORD *)&v132[14] = 2082;
          *(_QWORD *)&v132[16] = backtrace_string;
          _os_log_impl(&dword_182FBE000, v38, v46, "%{public}s %@: createChannel failed to set key <err %d> , dumping backtrace:%{public}s", buf, 0x26u);
        }
LABEL_81:

        free(backtrace_string);
        goto LABEL_107;
      }
      v42 = os_channel_attr_set();
      if (v42)
      {
        __nwlog_obj();
        v43 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 136446722;
        v130 = "-[NWConcrete_nw_ethernet_channel createChannel]";
        v131 = 2112;
        *(_QWORD *)v132 = a1;
        *(_WORD *)&v132[8] = 1024;
        *(_DWORD *)&v132[10] = v42;
        v37 = (char *)_os_log_send_and_compose_impl();

        type[0] = OS_LOG_TYPE_ERROR;
        v127 = OS_LOG_TYPE_DEFAULT;
        if (!__nwlog_fault(v37, type, &v127))
          goto LABEL_107;
        if (type[0] == OS_LOG_TYPE_FAULT)
        {
          __nwlog_obj();
          v38 = objc_claimAutoreleasedReturnValue();
          v44 = type[0];
          if (os_log_type_enabled(v38, type[0]))
          {
            *(_DWORD *)buf = 136446722;
            v130 = "-[NWConcrete_nw_ethernet_channel createChannel]";
            v131 = 2112;
            *(_QWORD *)v132 = a1;
            *(_WORD *)&v132[8] = 1024;
            *(_DWORD *)&v132[10] = v42;
            _os_log_impl(&dword_182FBE000, v38, v44, "%{public}s %@: createChannel failed to set user-packet-pool attribute <err %d> ", buf, 0x1Cu);
          }
          goto LABEL_106;
        }
        if (v127 == OS_LOG_TYPE_DEFAULT)
        {
          __nwlog_obj();
          v38 = objc_claimAutoreleasedReturnValue();
          v71 = type[0];
          if (os_log_type_enabled(v38, type[0]))
          {
            *(_DWORD *)buf = 136446722;
            v130 = "-[NWConcrete_nw_ethernet_channel createChannel]";
            v131 = 2112;
            *(_QWORD *)v132 = a1;
            *(_WORD *)&v132[8] = 1024;
            *(_DWORD *)&v132[10] = v42;
            _os_log_impl(&dword_182FBE000, v38, v71, "%{public}s %@: createChannel failed to set user-packet-pool attribute <err %d> , backtrace limit exceeded", buf, 0x1Cu);
          }
          goto LABEL_106;
        }
        backtrace_string = (char *)__nw_create_backtrace_string();
        __nwlog_obj();
        v38 = objc_claimAutoreleasedReturnValue();
        v62 = type[0];
        v63 = os_log_type_enabled(v38, type[0]);
        if (!backtrace_string)
        {
          if (v63)
          {
            *(_DWORD *)buf = 136446722;
            v130 = "-[NWConcrete_nw_ethernet_channel createChannel]";
            v131 = 2112;
            *(_QWORD *)v132 = a1;
            *(_WORD *)&v132[8] = 1024;
            *(_DWORD *)&v132[10] = v42;
            _os_log_impl(&dword_182FBE000, v38, v62, "%{public}s %@: createChannel failed to set user-packet-pool attribute <err %d> , no backtrace", buf, 0x1Cu);
          }
          goto LABEL_106;
        }
        if (v63)
        {
          *(_DWORD *)buf = 136446978;
          v130 = "-[NWConcrete_nw_ethernet_channel createChannel]";
          v131 = 2112;
          *(_QWORD *)v132 = a1;
          *(_WORD *)&v132[8] = 1024;
          *(_DWORD *)&v132[10] = v42;
          *(_WORD *)&v132[14] = 2082;
          *(_QWORD *)&v132[16] = backtrace_string;
          _os_log_impl(&dword_182FBE000, v38, v62, "%{public}s %@: createChannel failed to set user-packet-pool attribute <err %d> , dumping backtrace:%{public}s", buf, 0x26u);
        }
        goto LABEL_81;
      }
      if (*(_DWORD *)(a1 + 132) < 0x10000u)
      {
        extended = os_channel_create_extended();
        *(_QWORD *)(a1 + 152) = extended;
        if (extended)
        {
          fd = os_channel_get_fd();
          *(_DWORD *)(a1 + 168) = fd;
          if ((fd & 0x80000000) == 0)
          {
            v53 = *(_QWORD *)(a1 + 152);
            __nwlog_obj();
            v54 = objc_claimAutoreleasedReturnValue();
            v55 = os_log_type_enabled(v54, OS_LOG_TYPE_DEBUG);
            if (v53)
            {
              if (v55)
              {
                v56 = *(_QWORD *)(a1 + 24);
                v57 = *(_DWORD *)(a1 + 168);
                *(_DWORD *)buf = 136447234;
                v130 = "-[NWConcrete_nw_ethernet_channel createChannel]";
                v131 = 2080;
                *(_QWORD *)v132 = v56;
                *(_WORD *)&v132[8] = 1042;
                *(_DWORD *)&v132[10] = 16;
                *(_WORD *)&v132[14] = 2098;
                *(_QWORD *)&v132[16] = a1 + 115;
                *(_WORD *)&v132[24] = 1024;
                *(_DWORD *)&v132[26] = v57;
                v58 = "%{public}s [%s: nexus instance %{public,uuid_t}.16P <fd %d>] createChannel: created channel";
                v59 = v54;
                v60 = 44;
LABEL_118:
                _os_log_impl(&dword_182FBE000, v59, OS_LOG_TYPE_DEBUG, v58, buf, v60);
              }
            }
            else if (v55)
            {
              *(_DWORD *)buf = 136446466;
              v130 = "-[NWConcrete_nw_ethernet_channel createChannel]";
              v131 = 2114;
              *(_QWORD *)v132 = a1;
              v58 = "%{public}s [%{public}@] createChannel: created channel";
              v59 = v54;
              v60 = 22;
              goto LABEL_118;
            }

            *(_QWORD *)(a1 + 176) = os_channel_rx_ring();
            v81 = os_channel_tx_ring();
            *(_QWORD *)(a1 + 184) = v81;
            if (*(_QWORD *)(a1 + 176) && v81)
            {
              os_channel_read_attr();
              *(_QWORD *)type = 0;
              os_channel_attr_get();
              *(_WORD *)(a1 + 172) = 0;
              __nwlog_obj();
              v98 = (void *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = 136446466;
              v130 = "-[NWConcrete_nw_ethernet_channel createChannel]";
              v131 = 2112;
              *(_QWORD *)v132 = a1;
              v99 = (char *)_os_log_send_and_compose_impl();

              v127 = OS_LOG_TYPE_ERROR;
              v125 = 0;
              if (__nwlog_fault(v99, &v127, &v125))
              {
                if (v127 == OS_LOG_TYPE_FAULT)
                {
                  __nwlog_obj();
                  v100 = objc_claimAutoreleasedReturnValue();
                  v101 = v127;
                  if (os_log_type_enabled(v100, v127))
                  {
                    *(_DWORD *)buf = 136446466;
                    v130 = "-[NWConcrete_nw_ethernet_channel createChannel]";
                    v131 = 2112;
                    *(_QWORD *)v132 = a1;
                    _os_log_impl(&dword_182FBE000, v100, v101, "%{public}s %@: createChannel: channel slot size 0, clean up channel", buf, 0x16u);
                  }
                }
                else if (v125)
                {
                  v109 = (char *)__nw_create_backtrace_string();
                  __nwlog_obj();
                  v100 = objc_claimAutoreleasedReturnValue();
                  v110 = v127;
                  v111 = os_log_type_enabled(v100, v127);
                  if (v109)
                  {
                    if (v111)
                    {
                      *(_DWORD *)buf = 136446722;
                      v130 = "-[NWConcrete_nw_ethernet_channel createChannel]";
                      v131 = 2112;
                      *(_QWORD *)v132 = a1;
                      *(_WORD *)&v132[8] = 2082;
                      *(_QWORD *)&v132[10] = v109;
                      _os_log_impl(&dword_182FBE000, v100, v110, "%{public}s %@: createChannel: channel slot size 0, clean up channel, dumping backtrace:%{public}s", buf, 0x20u);
                    }

                    free(v109);
                    goto LABEL_180;
                  }
                  if (v111)
                  {
                    *(_DWORD *)buf = 136446466;
                    v130 = "-[NWConcrete_nw_ethernet_channel createChannel]";
                    v131 = 2112;
                    *(_QWORD *)v132 = a1;
                    _os_log_impl(&dword_182FBE000, v100, v110, "%{public}s %@: createChannel: channel slot size 0, clean up channel, no backtrace", buf, 0x16u);
                  }
                }
                else
                {
                  __nwlog_obj();
                  v100 = objc_claimAutoreleasedReturnValue();
                  v114 = v127;
                  if (os_log_type_enabled(v100, v127))
                  {
                    *(_DWORD *)buf = 136446466;
                    v130 = "-[NWConcrete_nw_ethernet_channel createChannel]";
                    v131 = 2112;
                    *(_QWORD *)v132 = a1;
                    _os_log_impl(&dword_182FBE000, v100, v114, "%{public}s %@: createChannel: channel slot size 0, clean up channel, backtrace limit exceeded", buf, 0x16u);
                  }
                }

              }
LABEL_180:
              if (v99)
                free(v99);
              -[NWConcrete_nw_ethernet_channel closeChannel:](a1, 0);
              return 0;
            }
            __nwlog_obj();
            v82 = (void *)objc_claimAutoreleasedReturnValue();
            v83 = *(_QWORD *)(a1 + 176);
            v84 = *(_QWORD *)(a1 + 184);
            *(_DWORD *)buf = 136446978;
            v130 = "-[NWConcrete_nw_ethernet_channel createChannel]";
            v131 = 2112;
            *(_QWORD *)v132 = a1;
            *(_WORD *)&v132[8] = 2048;
            *(_QWORD *)&v132[10] = v83;
            *(_WORD *)&v132[18] = 2048;
            *(_QWORD *)&v132[20] = v84;
            v85 = (char *)_os_log_send_and_compose_impl();

            type[0] = OS_LOG_TYPE_ERROR;
            v127 = OS_LOG_TYPE_DEFAULT;
            if (!__nwlog_fault(v85, type, &v127))
              goto LABEL_171;
            if (type[0] == OS_LOG_TYPE_FAULT)
            {
              __nwlog_obj();
              v86 = objc_claimAutoreleasedReturnValue();
              v87 = type[0];
              if (os_log_type_enabled(v86, type[0]))
              {
                v88 = *(_QWORD *)(a1 + 176);
                v89 = *(_QWORD *)(a1 + 184);
                *(_DWORD *)buf = 136446978;
                v130 = "-[NWConcrete_nw_ethernet_channel createChannel]";
                v131 = 2112;
                *(_QWORD *)v132 = a1;
                *(_WORD *)&v132[8] = 2048;
                *(_QWORD *)&v132[10] = v88;
                *(_WORD *)&v132[18] = 2048;
                *(_QWORD *)&v132[20] = v89;
                _os_log_impl(&dword_182FBE000, v86, v87, "%{public}s %@: createChannel failed to get input / output rings (%lX %lX)", buf, 0x2Au);
              }
            }
            else if (v127)
            {
              v93 = (char *)__nw_create_backtrace_string();
              __nwlog_obj();
              v86 = objc_claimAutoreleasedReturnValue();
              v94 = type[0];
              v95 = os_log_type_enabled(v86, type[0]);
              if (v93)
              {
                if (v95)
                {
                  v96 = *(_QWORD *)(a1 + 176);
                  v97 = *(_QWORD *)(a1 + 184);
                  *(_DWORD *)buf = 136447234;
                  v130 = "-[NWConcrete_nw_ethernet_channel createChannel]";
                  v131 = 2112;
                  *(_QWORD *)v132 = a1;
                  *(_WORD *)&v132[8] = 2048;
                  *(_QWORD *)&v132[10] = v96;
                  *(_WORD *)&v132[18] = 2048;
                  *(_QWORD *)&v132[20] = v97;
                  *(_WORD *)&v132[28] = 2082;
                  *(_QWORD *)&v133 = v93;
                  _os_log_impl(&dword_182FBE000, v86, v94, "%{public}s %@: createChannel failed to get input / output rings (%lX %lX), dumping backtrace:%{public}s", buf, 0x34u);
                }

                free(v93);
                goto LABEL_171;
              }
              if (v95)
              {
                v112 = *(_QWORD *)(a1 + 176);
                v113 = *(_QWORD *)(a1 + 184);
                *(_DWORD *)buf = 136446978;
                v130 = "-[NWConcrete_nw_ethernet_channel createChannel]";
                v131 = 2112;
                *(_QWORD *)v132 = a1;
                *(_WORD *)&v132[8] = 2048;
                *(_QWORD *)&v132[10] = v112;
                *(_WORD *)&v132[18] = 2048;
                *(_QWORD *)&v132[20] = v113;
                _os_log_impl(&dword_182FBE000, v86, v94, "%{public}s %@: createChannel failed to get input / output rings (%lX %lX), no backtrace", buf, 0x2Au);
              }
            }
            else
            {
              __nwlog_obj();
              v86 = objc_claimAutoreleasedReturnValue();
              v106 = type[0];
              if (os_log_type_enabled(v86, type[0]))
              {
                v107 = *(_QWORD *)(a1 + 176);
                v108 = *(_QWORD *)(a1 + 184);
                *(_DWORD *)buf = 136446978;
                v130 = "-[NWConcrete_nw_ethernet_channel createChannel]";
                v131 = 2112;
                *(_QWORD *)v132 = a1;
                *(_WORD *)&v132[8] = 2048;
                *(_QWORD *)&v132[10] = v107;
                *(_WORD *)&v132[18] = 2048;
                *(_QWORD *)&v132[20] = v108;
                _os_log_impl(&dword_182FBE000, v86, v106, "%{public}s %@: createChannel failed to get input / output rings (%lX %lX), backtrace limit exceeded", buf, 0x2Au);
              }
            }

LABEL_171:
            if (v85)
              free(v85);
LABEL_173:
            -[NWConcrete_nw_ethernet_channel closeChannel:](a1, 0);
            return 0;
          }
          __nwlog_obj();
          v72 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 136446466;
          v130 = "-[NWConcrete_nw_ethernet_channel createChannel]";
          v131 = 2112;
          *(_QWORD *)v132 = a1;
          v73 = (char *)_os_log_send_and_compose_impl();

          type[0] = OS_LOG_TYPE_ERROR;
          v127 = OS_LOG_TYPE_DEFAULT;
          if (__nwlog_fault(v73, type, &v127))
          {
            if (type[0] == OS_LOG_TYPE_FAULT)
            {
              __nwlog_obj();
              v74 = objc_claimAutoreleasedReturnValue();
              v75 = type[0];
              if (os_log_type_enabled(v74, type[0]))
              {
                *(_DWORD *)buf = 136446466;
                v130 = "-[NWConcrete_nw_ethernet_channel createChannel]";
                v131 = 2112;
                *(_QWORD *)v132 = a1;
                _os_log_impl(&dword_182FBE000, v74, v75, "%{public}s %@: createChannel failed to get channel fd", buf, 0x16u);
              }
            }
            else if (v127)
            {
              v90 = (char *)__nw_create_backtrace_string();
              __nwlog_obj();
              v74 = objc_claimAutoreleasedReturnValue();
              v91 = type[0];
              v92 = os_log_type_enabled(v74, type[0]);
              if (v90)
              {
                if (v92)
                {
                  *(_DWORD *)buf = 136446722;
                  v130 = "-[NWConcrete_nw_ethernet_channel createChannel]";
                  v131 = 2112;
                  *(_QWORD *)v132 = a1;
                  *(_WORD *)&v132[8] = 2082;
                  *(_QWORD *)&v132[10] = v90;
                  _os_log_impl(&dword_182FBE000, v74, v91, "%{public}s %@: createChannel failed to get channel fd, dumping backtrace:%{public}s", buf, 0x20u);
                }

                free(v90);
                goto LABEL_165;
              }
              if (v92)
              {
                *(_DWORD *)buf = 136446466;
                v130 = "-[NWConcrete_nw_ethernet_channel createChannel]";
                v131 = 2112;
                *(_QWORD *)v132 = a1;
                _os_log_impl(&dword_182FBE000, v74, v91, "%{public}s %@: createChannel failed to get channel fd, no backtrace", buf, 0x16u);
              }
            }
            else
            {
              __nwlog_obj();
              v74 = objc_claimAutoreleasedReturnValue();
              v105 = type[0];
              if (os_log_type_enabled(v74, type[0]))
              {
                *(_DWORD *)buf = 136446466;
                v130 = "-[NWConcrete_nw_ethernet_channel createChannel]";
                v131 = 2112;
                *(_QWORD *)v132 = a1;
                _os_log_impl(&dword_182FBE000, v74, v105, "%{public}s %@: createChannel failed to get channel fd, backtrace limit exceeded", buf, 0x16u);
              }
            }

          }
LABEL_165:
          if (v73)
            free(v73);
          goto LABEL_173;
        }
        __nwlog_obj();
        v65 = (void *)objc_claimAutoreleasedReturnValue();
        v66 = *(_DWORD *)(a1 + 132);
        *(_DWORD *)buf = 136447746;
        v130 = "-[NWConcrete_nw_ethernet_channel createChannel]";
        v131 = 2112;
        *(_QWORD *)v132 = a1;
        *(_WORD *)&v132[8] = 1042;
        *(_DWORD *)&v132[10] = 16;
        *(_WORD *)&v132[14] = 2098;
        *(_QWORD *)&v132[16] = a1 + 136;
        *(_WORD *)&v132[24] = 1042;
        *(_DWORD *)&v132[26] = 16;
        LOWORD(v133) = 2098;
        *(_QWORD *)((char *)&v133 + 2) = a1 + 115;
        WORD5(v133) = 1024;
        HIDWORD(v133) = v66;
        v67 = (char *)_os_log_send_and_compose_impl();

        type[0] = OS_LOG_TYPE_ERROR;
        v127 = OS_LOG_TYPE_DEFAULT;
        if (__nwlog_fault(v67, type, &v127))
        {
          if (type[0] == OS_LOG_TYPE_FAULT)
          {
            __nwlog_obj();
            v68 = objc_claimAutoreleasedReturnValue();
            v69 = type[0];
            if (os_log_type_enabled(v68, type[0]))
            {
              v70 = *(_DWORD *)(a1 + 132);
              *(_DWORD *)buf = 136447746;
              v130 = "-[NWConcrete_nw_ethernet_channel createChannel]";
              v131 = 2112;
              *(_QWORD *)v132 = a1;
              *(_WORD *)&v132[8] = 1042;
              *(_DWORD *)&v132[10] = 16;
              *(_WORD *)&v132[14] = 2098;
              *(_QWORD *)&v132[16] = a1 + 136;
              *(_WORD *)&v132[24] = 1042;
              *(_DWORD *)&v132[26] = 16;
              LOWORD(v133) = 2098;
              *(_QWORD *)((char *)&v133 + 2) = a1 + 115;
              WORD5(v133) = 1024;
              HIDWORD(v133) = v70;
              _os_log_impl(&dword_182FBE000, v68, v69, "%{public}s %@: Failed to create channel for flow id %{public, uuid_t}.16P nexus instance %{public, uuid_t}.16P port %u", buf, 0x3Cu);
            }
          }
          else if (v127)
          {
            v77 = (char *)__nw_create_backtrace_string();
            __nwlog_obj();
            v68 = objc_claimAutoreleasedReturnValue();
            v78 = type[0];
            v79 = os_log_type_enabled(v68, type[0]);
            if (v77)
            {
              if (v79)
              {
                v80 = *(_DWORD *)(a1 + 132);
                *(_DWORD *)buf = 136448002;
                v130 = "-[NWConcrete_nw_ethernet_channel createChannel]";
                v131 = 2112;
                *(_QWORD *)v132 = a1;
                *(_WORD *)&v132[8] = 1042;
                *(_DWORD *)&v132[10] = 16;
                *(_WORD *)&v132[14] = 2098;
                *(_QWORD *)&v132[16] = a1 + 136;
                *(_WORD *)&v132[24] = 1042;
                *(_DWORD *)&v132[26] = 16;
                LOWORD(v133) = 2098;
                *(_QWORD *)((char *)&v133 + 2) = a1 + 115;
                WORD5(v133) = 1024;
                HIDWORD(v133) = v80;
                v134 = 2082;
                *(_QWORD *)v135 = v77;
                _os_log_impl(&dword_182FBE000, v68, v78, "%{public}s %@: Failed to create channel for flow id %{public, uuid_t}.16P nexus instance %{public, uuid_t}.16P port %u, dumping backtrace:%{public}s", buf, 0x46u);
              }

              free(v77);
              goto LABEL_148;
            }
            if (v79)
            {
              v104 = *(_DWORD *)(a1 + 132);
              *(_DWORD *)buf = 136447746;
              v130 = "-[NWConcrete_nw_ethernet_channel createChannel]";
              v131 = 2112;
              *(_QWORD *)v132 = a1;
              *(_WORD *)&v132[8] = 1042;
              *(_DWORD *)&v132[10] = 16;
              *(_WORD *)&v132[14] = 2098;
              *(_QWORD *)&v132[16] = a1 + 136;
              *(_WORD *)&v132[24] = 1042;
              *(_DWORD *)&v132[26] = 16;
              LOWORD(v133) = 2098;
              *(_QWORD *)((char *)&v133 + 2) = a1 + 115;
              WORD5(v133) = 1024;
              HIDWORD(v133) = v104;
              _os_log_impl(&dword_182FBE000, v68, v78, "%{public}s %@: Failed to create channel for flow id %{public, uuid_t}.16P nexus instance %{public, uuid_t}.16P port %u, no backtrace", buf, 0x3Cu);
            }
          }
          else
          {
            __nwlog_obj();
            v68 = objc_claimAutoreleasedReturnValue();
            v102 = type[0];
            if (os_log_type_enabled(v68, type[0]))
            {
              v103 = *(_DWORD *)(a1 + 132);
              *(_DWORD *)buf = 136447746;
              v130 = "-[NWConcrete_nw_ethernet_channel createChannel]";
              v131 = 2112;
              *(_QWORD *)v132 = a1;
              *(_WORD *)&v132[8] = 1042;
              *(_DWORD *)&v132[10] = 16;
              *(_WORD *)&v132[14] = 2098;
              *(_QWORD *)&v132[16] = a1 + 136;
              *(_WORD *)&v132[24] = 1042;
              *(_DWORD *)&v132[26] = 16;
              LOWORD(v133) = 2098;
              *(_QWORD *)((char *)&v133 + 2) = a1 + 115;
              WORD5(v133) = 1024;
              HIDWORD(v133) = v103;
              _os_log_impl(&dword_182FBE000, v68, v102, "%{public}s %@: Failed to create channel for flow id %{public, uuid_t}.16P nexus instance %{public, uuid_t}.16P port %u, backtrace limit exceeded", buf, 0x3Cu);
            }
          }

        }
LABEL_148:
        if (v67)
          free(v67);
        goto LABEL_173;
      }
      __nwlog_obj();
      v115 = (void *)objc_claimAutoreleasedReturnValue();
      v116 = *(_DWORD *)(a1 + 132);
      *(_DWORD *)buf = 136446466;
      v130 = "-[NWConcrete_nw_ethernet_channel createChannel]";
      v131 = 1024;
      *(_DWORD *)v132 = v116;
      v37 = (char *)_os_log_send_and_compose_impl();

      type[0] = OS_LOG_TYPE_ERROR;
      v127 = OS_LOG_TYPE_DEFAULT;
      if (!__nwlog_fault(v37, type, &v127))
      {
LABEL_107:
        if (v37)
          free(v37);
        return 0;
      }
      if (type[0] == OS_LOG_TYPE_FAULT)
      {
        __nwlog_obj();
        v38 = objc_claimAutoreleasedReturnValue();
        v117 = type[0];
        if (os_log_type_enabled(v38, type[0]))
        {
          v118 = *(_DWORD *)(a1 + 132);
          *(_DWORD *)buf = 136446466;
          v130 = "-[NWConcrete_nw_ethernet_channel createChannel]";
          v131 = 1024;
          *(_DWORD *)v132 = v118;
          _os_log_impl(&dword_182FBE000, v38, v117, "%{public}s port %u > NEXUS_PORT_MAX", buf, 0x12u);
        }
        goto LABEL_106;
      }
      if (v127 == OS_LOG_TYPE_DEFAULT)
      {
        __nwlog_obj();
        v38 = objc_claimAutoreleasedReturnValue();
        v122 = type[0];
        if (os_log_type_enabled(v38, type[0]))
        {
          v123 = *(_DWORD *)(a1 + 132);
          *(_DWORD *)buf = 136446466;
          v130 = "-[NWConcrete_nw_ethernet_channel createChannel]";
          v131 = 1024;
          *(_DWORD *)v132 = v123;
          _os_log_impl(&dword_182FBE000, v38, v122, "%{public}s port %u > NEXUS_PORT_MAX, backtrace limit exceeded", buf, 0x12u);
        }
        goto LABEL_106;
      }
      v48 = (char *)__nw_create_backtrace_string();
      __nwlog_obj();
      v38 = objc_claimAutoreleasedReturnValue();
      v119 = type[0];
      v120 = os_log_type_enabled(v38, type[0]);
      if (!v48)
      {
        if (v120)
        {
          v124 = *(_DWORD *)(a1 + 132);
          *(_DWORD *)buf = 136446466;
          v130 = "-[NWConcrete_nw_ethernet_channel createChannel]";
          v131 = 1024;
          *(_DWORD *)v132 = v124;
          _os_log_impl(&dword_182FBE000, v38, v119, "%{public}s port %u > NEXUS_PORT_MAX, no backtrace", buf, 0x12u);
        }
        goto LABEL_106;
      }
      if (v120)
      {
        v121 = *(_DWORD *)(a1 + 132);
        *(_DWORD *)buf = 136446722;
        v130 = "-[NWConcrete_nw_ethernet_channel createChannel]";
        v131 = 1024;
        *(_DWORD *)v132 = v121;
        *(_WORD *)&v132[4] = 2082;
        *(_QWORD *)&v132[6] = v48;
        _os_log_impl(&dword_182FBE000, v38, v119, "%{public}s port %u > NEXUS_PORT_MAX, dumping backtrace:%{public}s", buf, 0x1Cu);
      }
    }
    else
    {
      __nwlog_obj();
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 136446466;
      v130 = "-[NWConcrete_nw_ethernet_channel createChannel]";
      v131 = 2112;
      *(_QWORD *)v132 = a1;
      v37 = (char *)_os_log_send_and_compose_impl();

      type[0] = OS_LOG_TYPE_ERROR;
      v127 = OS_LOG_TYPE_DEFAULT;
      if (!__nwlog_fault(v37, type, &v127))
        goto LABEL_107;
      if (type[0] == OS_LOG_TYPE_FAULT)
      {
        __nwlog_obj();
        v38 = objc_claimAutoreleasedReturnValue();
        v41 = type[0];
        if (os_log_type_enabled(v38, type[0]))
        {
          *(_DWORD *)buf = 136446466;
          v130 = "-[NWConcrete_nw_ethernet_channel createChannel]";
          v131 = 2112;
          *(_QWORD *)v132 = a1;
          _os_log_impl(&dword_182FBE000, v38, v41, "%{public}s %@: createChannel failed to create channel attributes", buf, 0x16u);
        }
        goto LABEL_106;
      }
      if (v127 == OS_LOG_TYPE_DEFAULT)
      {
        __nwlog_obj();
        v38 = objc_claimAutoreleasedReturnValue();
        v64 = type[0];
        if (os_log_type_enabled(v38, type[0]))
        {
          *(_DWORD *)buf = 136446466;
          v130 = "-[NWConcrete_nw_ethernet_channel createChannel]";
          v131 = 2112;
          *(_QWORD *)v132 = a1;
          _os_log_impl(&dword_182FBE000, v38, v64, "%{public}s %@: createChannel failed to create channel attributes, backtrace limit exceeded", buf, 0x16u);
        }
        goto LABEL_106;
      }
      v48 = (char *)__nw_create_backtrace_string();
      __nwlog_obj();
      v38 = objc_claimAutoreleasedReturnValue();
      v49 = type[0];
      v50 = os_log_type_enabled(v38, type[0]);
      if (!v48)
      {
        if (v50)
        {
          *(_DWORD *)buf = 136446466;
          v130 = "-[NWConcrete_nw_ethernet_channel createChannel]";
          v131 = 2112;
          *(_QWORD *)v132 = a1;
          _os_log_impl(&dword_182FBE000, v38, v49, "%{public}s %@: createChannel failed to create channel attributes, no backtrace", buf, 0x16u);
        }
        goto LABEL_106;
      }
      if (v50)
      {
        *(_DWORD *)buf = 136446722;
        v130 = "-[NWConcrete_nw_ethernet_channel createChannel]";
        v131 = 2112;
        *(_QWORD *)v132 = a1;
        *(_WORD *)&v132[8] = 2082;
        *(_QWORD *)&v132[10] = v48;
        _os_log_impl(&dword_182FBE000, v38, v49, "%{public}s %@: createChannel failed to create channel attributes, dumping backtrace:%{public}s", buf, 0x20u);
      }
    }

    free(v48);
    goto LABEL_107;
  }
  pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
  networkd_settings_init();
  v2 = (id)gLogObj;
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
  {
    v3 = *(_QWORD *)(a1 + 24);
    v4 = *(_DWORD *)(a1 + 168);
    *(_DWORD *)buf = 136447234;
    v130 = "-[NWConcrete_nw_ethernet_channel createChannel]";
    v131 = 2080;
    *(_QWORD *)v132 = v3;
    *(_WORD *)&v132[8] = 1042;
    *(_DWORD *)&v132[10] = 16;
    *(_WORD *)&v132[14] = 2098;
    *(_QWORD *)&v132[16] = a1 + 115;
    *(_WORD *)&v132[24] = 1024;
    *(_DWORD *)&v132[26] = v4;
    _os_log_impl(&dword_182FBE000, v2, OS_LOG_TYPE_DEBUG, "%{public}s [%s: nexus instance %{public,uuid_t}.16P <fd %d>] createChannel: channel already exists", buf, 0x2Cu);
  }

  return 1;
}

@end
