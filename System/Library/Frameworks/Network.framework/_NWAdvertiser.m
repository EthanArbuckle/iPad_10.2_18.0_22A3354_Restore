@implementation _NWAdvertiser

- (void)dealloc
{
  uint64_t v3;
  id v4;
  const char *id_string;
  char *v6;
  NSObject *v7;
  os_log_type_t v8;
  const char *v9;
  OS_nw_path_evaluator *evaluator;
  const char *backtrace_string;
  char *v12;
  NSObject *v13;
  os_log_type_t v14;
  const char *v15;
  os_log_type_t v16;
  const char *v17;
  os_log_type_t v18;
  const char *v19;
  uint8_t *v20;
  int v21;
  objc_super v22;
  char v23;
  os_log_type_t type;
  uint8_t buf[4];
  const char *v26;
  __int16 v27;
  const char *v28;
  __int16 v29;
  char *v30;
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  if (self->dnsref)
  {
    v3 = *((_QWORD *)self->listener + 2);
    if (v3)
    {
      if (!nw_path_parameters_get_logging_disabled(*(_QWORD *)(v3 + 104)))
      {
        if (__nwlog_listener_log::onceToken != -1)
          dispatch_once(&__nwlog_listener_log::onceToken, &__block_literal_global_33_44199);
        v4 = (id)glistenerLogObj;
        id_string = nw_listener_get_id_string(self->listener);
        *(_DWORD *)buf = 136446466;
        v26 = "-[_NWAdvertiser dealloc]";
        v27 = 2082;
        v28 = id_string;
        v21 = 22;
        v20 = buf;
        v6 = (char *)_os_log_send_and_compose_impl();

        type = OS_LOG_TYPE_ERROR;
        v23 = 0;
        if (!__nwlog_fault(v6, &type, &v23))
        {
LABEL_13:
          if (!v6)
            goto LABEL_15;
          goto LABEL_14;
        }
        if (type == OS_LOG_TYPE_FAULT)
        {
          if (__nwlog_listener_log::onceToken != -1)
            dispatch_once(&__nwlog_listener_log::onceToken, &__block_literal_global_33_44199);
          v7 = (id)glistenerLogObj;
          v8 = type;
          if (os_log_type_enabled(v7, type))
          {
            v9 = nw_listener_get_id_string(self->listener);
            *(_DWORD *)buf = 136446466;
            v26 = "-[_NWAdvertiser dealloc]";
            v27 = 2082;
            v28 = v9;
            _os_log_impl(&dword_182FBE000, v7, v8, "%{public}s [%{public}s] dnsref is not NULL", buf, 0x16u);
          }
LABEL_12:

          goto LABEL_13;
        }
        if (!v23)
        {
          if (__nwlog_listener_log::onceToken != -1)
            dispatch_once(&__nwlog_listener_log::onceToken, &__block_literal_global_33_44199);
          v7 = (id)glistenerLogObj;
          v16 = type;
          if (os_log_type_enabled(v7, type))
          {
            v17 = nw_listener_get_id_string(self->listener);
            *(_DWORD *)buf = 136446466;
            v26 = "-[_NWAdvertiser dealloc]";
            v27 = 2082;
            v28 = v17;
            _os_log_impl(&dword_182FBE000, v7, v16, "%{public}s [%{public}s] dnsref is not NULL, backtrace limit exceeded", buf, 0x16u);
          }
          goto LABEL_12;
        }
        backtrace_string = __nw_create_backtrace_string();
        if (!backtrace_string)
        {
          if (__nwlog_listener_log::onceToken != -1)
            dispatch_once(&__nwlog_listener_log::onceToken, &__block_literal_global_33_44199);
          v7 = (id)glistenerLogObj;
          v18 = type;
          if (os_log_type_enabled(v7, type))
          {
            v19 = nw_listener_get_id_string(self->listener);
            *(_DWORD *)buf = 136446466;
            v26 = "-[_NWAdvertiser dealloc]";
            v27 = 2082;
            v28 = v19;
            _os_log_impl(&dword_182FBE000, v7, v18, "%{public}s [%{public}s] dnsref is not NULL, no backtrace", buf, 0x16u);
          }
          goto LABEL_12;
        }
        v12 = (char *)backtrace_string;
        if (__nwlog_listener_log::onceToken != -1)
          dispatch_once(&__nwlog_listener_log::onceToken, &__block_literal_global_33_44199);
        v13 = (id)glistenerLogObj;
        v14 = type;
        if (os_log_type_enabled(v13, type))
        {
          v15 = nw_listener_get_id_string(self->listener);
          *(_DWORD *)buf = 136446722;
          v26 = "-[_NWAdvertiser dealloc]";
          v27 = 2082;
          v28 = v15;
          v29 = 2082;
          v30 = v12;
          _os_log_impl(&dword_182FBE000, v13, v14, "%{public}s [%{public}s] dnsref is not NULL, dumping backtrace:%{public}s", buf, 0x20u);
        }

        free(v12);
        if (v6)
LABEL_14:
          free(v6);
      }
    }
  }
LABEL_15:
  evaluator = self->evaluator;
  if (evaluator)
    nw_path_evaluator_cancel(evaluator);
  v22.receiver = self;
  v22.super_class = (Class)_NWAdvertiser;
  -[_NWAdvertiser dealloc](&v22, sel_dealloc, v20, v21);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->flow_registrations, 0);
  objc_storeStrong((id *)&self->children, 0);
  objc_storeStrong((id *)&self->parameters, 0);
  objc_storeStrong((id *)&self->evaluator, 0);
  objc_destroyWeak((id *)&self->parent);
  objc_storeStrong((id *)&self->advertise, 0);
  objc_storeStrong((id *)&self->listener, 0);
}

- (id)initFor:(void *)a3 descriptor:(void *)a4 parent:(void *)a5 parameters:
{
  id v10;
  id v11;
  id v12;
  id v13;
  id *v14;
  id v15;
  _BOOL8 v16;
  id v17;
  void *v19;
  char *v20;
  NSObject *v21;
  os_log_type_t v22;
  void *v23;
  os_log_type_t v24;
  char *backtrace_string;
  os_log_type_t v26;
  _BOOL4 v27;
  char *v28;
  os_log_type_t v29;
  _BOOL4 v30;
  os_log_type_t v31;
  os_log_type_t v32;
  objc_super v33;
  char v34;
  os_log_type_t type;
  uint8_t buf[4];
  const char *v37;
  __int16 v38;
  char *v39;
  uint64_t v40;

  v40 = *MEMORY[0x1E0C80C00];
  v10 = a2;
  v11 = a3;
  v12 = a4;
  v13 = a5;
  if (!a1)
    goto LABEL_6;
  if (!v10)
  {
    __nwlog_obj();
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 136446210;
    v37 = "-[_NWAdvertiser initFor:descriptor:parent:parameters:]";
    v20 = (char *)_os_log_send_and_compose_impl();

    type = OS_LOG_TYPE_ERROR;
    v34 = 0;
    if (!__nwlog_fault(v20, &type, &v34))
      goto LABEL_40;
    if (type == OS_LOG_TYPE_FAULT)
    {
      __nwlog_obj();
      v21 = objc_claimAutoreleasedReturnValue();
      v22 = type;
      if (os_log_type_enabled(v21, type))
      {
        *(_DWORD *)buf = 136446210;
        v37 = "-[_NWAdvertiser initFor:descriptor:parent:parameters:]";
        _os_log_impl(&dword_182FBE000, v21, v22, "%{public}s called with null _listener", buf, 0xCu);
      }
    }
    else if (v34)
    {
      backtrace_string = (char *)__nw_create_backtrace_string();
      __nwlog_obj();
      v21 = objc_claimAutoreleasedReturnValue();
      v26 = type;
      v27 = os_log_type_enabled(v21, type);
      if (backtrace_string)
      {
        if (v27)
        {
          *(_DWORD *)buf = 136446466;
          v37 = "-[_NWAdvertiser initFor:descriptor:parent:parameters:]";
          v38 = 2082;
          v39 = backtrace_string;
          _os_log_impl(&dword_182FBE000, v21, v26, "%{public}s called with null _listener, dumping backtrace:%{public}s", buf, 0x16u);
        }

        free(backtrace_string);
LABEL_40:
        if (!v20)
        {
LABEL_42:

          a1 = 0;
          goto LABEL_6;
        }
LABEL_41:
        free(v20);
        goto LABEL_42;
      }
      if (v27)
      {
        *(_DWORD *)buf = 136446210;
        v37 = "-[_NWAdvertiser initFor:descriptor:parent:parameters:]";
        _os_log_impl(&dword_182FBE000, v21, v26, "%{public}s called with null _listener, no backtrace", buf, 0xCu);
      }
    }
    else
    {
      __nwlog_obj();
      v21 = objc_claimAutoreleasedReturnValue();
      v31 = type;
      if (os_log_type_enabled(v21, type))
      {
        *(_DWORD *)buf = 136446210;
        v37 = "-[_NWAdvertiser initFor:descriptor:parent:parameters:]";
        _os_log_impl(&dword_182FBE000, v21, v31, "%{public}s called with null _listener, backtrace limit exceeded", buf, 0xCu);
      }
    }
LABEL_39:

    goto LABEL_40;
  }
  if (!v11)
  {
    __nwlog_obj();
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 136446210;
    v37 = "-[_NWAdvertiser initFor:descriptor:parent:parameters:]";
    v20 = (char *)_os_log_send_and_compose_impl();

    type = OS_LOG_TYPE_ERROR;
    v34 = 0;
    if (!__nwlog_fault(v20, &type, &v34))
      goto LABEL_40;
    if (type == OS_LOG_TYPE_FAULT)
    {
      __nwlog_obj();
      v21 = objc_claimAutoreleasedReturnValue();
      v24 = type;
      if (os_log_type_enabled(v21, type))
      {
        *(_DWORD *)buf = 136446210;
        v37 = "-[_NWAdvertiser initFor:descriptor:parent:parameters:]";
        _os_log_impl(&dword_182FBE000, v21, v24, "%{public}s called with null _descriptor", buf, 0xCu);
      }
    }
    else if (v34)
    {
      v28 = (char *)__nw_create_backtrace_string();
      __nwlog_obj();
      v21 = objc_claimAutoreleasedReturnValue();
      v29 = type;
      v30 = os_log_type_enabled(v21, type);
      if (v28)
      {
        if (v30)
        {
          *(_DWORD *)buf = 136446466;
          v37 = "-[_NWAdvertiser initFor:descriptor:parent:parameters:]";
          v38 = 2082;
          v39 = v28;
          _os_log_impl(&dword_182FBE000, v21, v29, "%{public}s called with null _descriptor, dumping backtrace:%{public}s", buf, 0x16u);
        }

        free(v28);
        if (!v20)
          goto LABEL_42;
        goto LABEL_41;
      }
      if (v30)
      {
        *(_DWORD *)buf = 136446210;
        v37 = "-[_NWAdvertiser initFor:descriptor:parent:parameters:]";
        _os_log_impl(&dword_182FBE000, v21, v29, "%{public}s called with null _descriptor, no backtrace", buf, 0xCu);
      }
    }
    else
    {
      __nwlog_obj();
      v21 = objc_claimAutoreleasedReturnValue();
      v32 = type;
      if (os_log_type_enabled(v21, type))
      {
        *(_DWORD *)buf = 136446210;
        v37 = "-[_NWAdvertiser initFor:descriptor:parent:parameters:]";
        _os_log_impl(&dword_182FBE000, v21, v32, "%{public}s called with null _descriptor, backtrace limit exceeded", buf, 0xCu);
      }
    }
    goto LABEL_39;
  }
  v33.receiver = a1;
  v33.super_class = (Class)_NWAdvertiser;
  v14 = (id *)objc_msgSendSuper2(&v33, sel_init);
  a1 = v14;
  if (v14)
  {
    objc_storeStrong(v14 + 1, a2);
    objc_storeStrong(a1 + 2, a3);
    objc_storeWeak(a1 + 3, v12);
    v15 = v13;
    v16 = -[NWConcrete_nw_parameters initWithParameters:stripConnected:shallowCopy:]((id *)[NWConcrete_nw_parameters alloc], v15, 0, 0);

    v17 = a1[5];
    a1[5] = (id)v16;

    nw_parameters_set_multipath_service((nw_parameters_t)a1[5], nw_multipath_service_disabled);
  }
LABEL_6:

  return a1;
}

- (void)start
{
  uint64_t v2;
  NSObject *v3;
  const char *id_string;
  NSObject *v5;
  id v6;
  NWConcrete_nw_path_evaluator *evaluator_for_advertise;
  void *v8;
  void *v9;
  uint64_t v10;
  NSObject *v11;
  const char *v12;
  os_unfair_lock_s *v13;
  os_unfair_lock_s *v14;
  id *v15;
  id v16;
  uint64_t v17;
  NSObject *v18;
  const char *v19;
  id v20;
  uint64_t v21;
  nw_parameters_t *v22;
  nw_parameters_t v23;
  _BOOL4 v24;
  uint64_t v25;
  int v26;
  uint64_t v27;
  NSObject *v28;
  const char *v29;
  nw_interface_t v30;
  uint64_t v31;
  id v32;
  const char *v33;
  void *v34;
  NSObject *v35;
  os_log_type_t v36;
  const char *v37;
  const char *backtrace_string;
  char *v39;
  NSObject *v40;
  os_log_type_t v41;
  const char *v42;
  os_log_type_t v43;
  const char *v44;
  os_log_type_t v45;
  const char *v46;
  DNSServiceFlags v47;
  NSObject *v48;
  int isa;
  uint32_t v50;
  nw_txt_record_t v51;
  nw_txt_record_t v52;
  uint16_t txtLen;
  Class txtRecord;
  const char *bonjour_name;
  const char *bonjour_type;
  const char *bonjour_domain;
  DNSServiceErrorType v58;
  _DNSServiceRef_t *v59;
  _BOOL8 v60;
  void *v61;
  _DWORD *dns_error;
  _QWORD v63[4];
  id v64;
  id location;
  uint8_t buf[4];
  const char *v67;
  __int16 v68;
  const char *v69;
  __int16 v70;
  nw_interface_t v71;
  __int16 v72;
  char *v73;
  char __str[8];
  uint64_t v75;
  uint64_t v76;

  v76 = *MEMORY[0x1E0C80C00];
  nw_context_assert_queue(*(void **)(*(_QWORD *)(a1 + 8) + 24));
  v2 = *(_QWORD *)(*(_QWORD *)(a1 + 8) + 16);
  if (v2 && !nw_path_parameters_get_logging_disabled(*(_QWORD *)(v2 + 104)))
  {
    if (__nwlog_listener_log::onceToken != -1)
      dispatch_once(&__nwlog_listener_log::onceToken, &__block_literal_global_33_44199);
    v3 = (id)glistenerLogObj;
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
    {
      id_string = nw_listener_get_id_string(*(void **)(a1 + 8));
      v5 = *(NSObject **)(a1 + 16);
      *(_DWORD *)buf = 136446722;
      v67 = "-[_NWAdvertiser start]";
      v68 = 2082;
      v69 = id_string;
      v70 = 2112;
      v71 = v5;
      _os_log_impl(&dword_182FBE000, v3, OS_LOG_TYPE_DEBUG, "%{public}s [%{public}s] start advertise %@", buf, 0x20u);
    }

  }
  if (!*(_QWORD *)(a1 + 32))
  {
    *(_QWORD *)__str = 0;
    v75 = 0;
    snprintf(__str, 0x10uLL, "%d", *(unsigned __int16 *)(*(_QWORD *)(a1 + 8) + 300));
    v6 = nw_listener_copy_parameters_with_port(*(void **)(a1 + 40), __str, 0);
    evaluator_for_advertise = nw_path_create_evaluator_for_advertise(*(void **)(a1 + 16), v6);
    v8 = *(void **)(a1 + 32);
    *(_QWORD *)(a1 + 32) = evaluator_for_advertise;

    if (*(_QWORD *)(a1 + 32))
    {
      objc_initWeak(&location, (id)a1);
      v9 = *(void **)(a1 + 32);
      v63[0] = MEMORY[0x1E0C809B0];
      v63[1] = 3221225472;
      v63[2] = __22___NWAdvertiser_start__block_invoke;
      v63[3] = &unk_1E14AC8E0;
      objc_copyWeak(&v64, &location);
      nw_path_evaluator_set_update_handler(v9, 0, v63);
      v10 = *(_QWORD *)(*(_QWORD *)(a1 + 8) + 16);
      if (v10 && !nw_path_parameters_get_logging_disabled(*(_QWORD *)(v10 + 104)))
      {
        if (__nwlog_listener_log::onceToken != -1)
          dispatch_once(&__nwlog_listener_log::onceToken, &__block_literal_global_33_44199);
        v11 = (id)glistenerLogObj;
        if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
        {
          v12 = nw_listener_get_id_string(*(void **)(a1 + 8));
          *(_DWORD *)buf = 136446466;
          v67 = "-[_NWAdvertiser start]";
          v68 = 2082;
          v69 = v12;
          _os_log_impl(&dword_182FBE000, v11, OS_LOG_TYPE_INFO, "%{public}s [%{public}s] Starting advertiser", buf, 0x16u);
        }

      }
      v13 = *(os_unfair_lock_s **)(a1 + 32);
      if (v13)
      {
        v14 = v13 + 24;
        v15 = v13;
        os_unfair_lock_lock(v14);
        v16 = v15[6];
        os_unfair_lock_unlock(v14);

      }
      else
      {
        v16 = 0;
      }
      v20 = v16;
      nw_context_assert_queue(*(void **)(*(_QWORD *)(a1 + 8) + 24));
      v21 = *(_QWORD *)(a1 + 8);
      if ((*(_DWORD *)(v21 + 128) - 1) <= 1 && (*(_BYTE *)(v21 + 302) & 1) == 0)
      {
        -[_NWAdvertiser updateFlows:](a1, v20);
        -[_NWAdvertiser reconcileChildren:](a1, v20);
      }

      objc_destroyWeak(&v64);
      objc_destroyWeak(&location);
    }
    else
    {
      v17 = *(_QWORD *)(*(_QWORD *)(a1 + 8) + 16);
      if (v17 && !nw_path_parameters_get_logging_disabled(*(_QWORD *)(v17 + 104)))
      {
        if (__nwlog_listener_log::onceToken != -1)
          dispatch_once(&__nwlog_listener_log::onceToken, &__block_literal_global_33_44199);
        v18 = (id)glistenerLogObj;
        if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
        {
          v19 = nw_listener_get_id_string(*(void **)(a1 + 8));
          *(_DWORD *)buf = 136446466;
          v67 = "-[_NWAdvertiser start]";
          v68 = 2082;
          v69 = v19;
          _os_log_impl(&dword_182FBE000, v18, OS_LOG_TYPE_ERROR, "%{public}s [%{public}s] nw_path_create_evaluator_for_advertise failed", buf, 0x16u);
        }

      }
    }

  }
  if (!*(_QWORD *)(a1 + 64) && nw_advertise_descriptor_get_type(*(void **)(a1 + 16)) == 1)
  {
    if (nw_parameters_get_use_awdl(*(void **)(*(_QWORD *)(a1 + 8) + 16)))
    {
      v22 = (nw_parameters_t *)*(id *)(a1 + 8);
      if (nw_parameters_get_include_peer_to_peer(v22[2])
        && nw_parameters_get_multipath_service(v22[2])
        && (v23 = v22[33]) != 0)
      {
        v24 = nw_advertise_descriptor_get_type(v23) == 2;

        v25 = *(_QWORD *)(a1 + 8);
        if (v24 && !*(_WORD *)(v25 + 240))
          goto LABEL_40;
      }
      else
      {

        v25 = *(_QWORD *)(a1 + 8);
      }
      v27 = *(_QWORD *)(v25 + 16);
      if (v27 && !nw_path_parameters_get_logging_disabled(*(_QWORD *)(v27 + 104)))
      {
        if (__nwlog_listener_log::onceToken != -1)
          dispatch_once(&__nwlog_listener_log::onceToken, &__block_literal_global_33_44199);
        v28 = (id)glistenerLogObj;
        if (os_log_type_enabled(v28, OS_LOG_TYPE_INFO))
        {
          v29 = nw_listener_get_id_string(*(void **)(a1 + 8));
          *(_DWORD *)buf = 136446466;
          v67 = "-[_NWAdvertiser start]";
          v68 = 2082;
          v69 = v29;
          _os_log_impl(&dword_182FBE000, v28, OS_LOG_TYPE_INFO, "%{public}s [%{public}s] Including kDNSServiceFlagsIncludeAWDL", buf, 0x16u);
        }

      }
      v26 = 0x100000;
LABEL_50:
      v30 = nw_parameters_copy_required_interface(*(nw_parameters_t *)(*(_QWORD *)(a1 + 8) + 208));
      if (!nw_parameters_get_use_p2p(*(void **)(*(_QWORD *)(a1 + 8) + 208)))
        goto LABEL_83;
      v26 |= 0x20000u;
      if (!v30)
        goto LABEL_83;
      v31 = *(_QWORD *)(*(_QWORD *)(a1 + 8) + 16);
      if (!v31 || nw_path_parameters_get_logging_disabled(*(_QWORD *)(v31 + 104)))
        goto LABEL_83;
      if (__nwlog_listener_log::onceToken != -1)
        dispatch_once(&__nwlog_listener_log::onceToken, &__block_literal_global_33_44199);
      v32 = (id)glistenerLogObj;
      v33 = nw_listener_get_id_string(*(void **)(a1 + 8));
      *(_DWORD *)buf = 136446722;
      v67 = "-[_NWAdvertiser start]";
      v68 = 2082;
      v69 = v33;
      v70 = 2082;
      v71 = v30 + 13;
      v34 = (void *)_os_log_send_and_compose_impl();

      __str[0] = 16;
      LOBYTE(location) = 0;
      if (__nwlog_fault((const char *)v34, __str, &location))
      {
        if (__str[0] == 17)
        {
          if (__nwlog_listener_log::onceToken != -1)
            dispatch_once(&__nwlog_listener_log::onceToken, &__block_literal_global_33_44199);
          v35 = (id)glistenerLogObj;
          v36 = __str[0];
          if (os_log_type_enabled(v35, (os_log_type_t)__str[0]))
          {
            v37 = nw_listener_get_id_string(*(void **)(a1 + 8));
            *(_DWORD *)buf = 136446722;
            v67 = "-[_NWAdvertiser start]";
            v68 = 2082;
            v69 = v37;
            v70 = 2082;
            v71 = v30 + 13;
            _os_log_impl(&dword_182FBE000, v35, v36, "%{public}s [%{public}s] Client specified an interface (%{public}s) and RegisterP2P", buf, 0x20u);
          }
        }
        else if ((_BYTE)location)
        {
          backtrace_string = __nw_create_backtrace_string();
          if (backtrace_string)
          {
            v39 = (char *)backtrace_string;
            if (__nwlog_listener_log::onceToken != -1)
              dispatch_once(&__nwlog_listener_log::onceToken, &__block_literal_global_33_44199);
            v40 = (id)glistenerLogObj;
            v41 = __str[0];
            if (os_log_type_enabled(v40, (os_log_type_t)__str[0]))
            {
              v42 = nw_listener_get_id_string(*(void **)(a1 + 8));
              *(_DWORD *)buf = 136446978;
              v67 = "-[_NWAdvertiser start]";
              v68 = 2082;
              v69 = v42;
              v70 = 2082;
              v71 = v30 + 13;
              v72 = 2082;
              v73 = v39;
              _os_log_impl(&dword_182FBE000, v40, v41, "%{public}s [%{public}s] Client specified an interface (%{public}s) and RegisterP2P, dumping backtrace:%{public}s", buf, 0x2Au);
            }

            free(v39);
            if (!v34)
            {
LABEL_83:
              if (nw_advertise_descriptor_get_no_auto_rename(*(nw_advertise_descriptor_t *)(a1 + 16)))
                v47 = v26 | 8;
              else
                v47 = v26;
              if (nw_parameters_get_required_interface_type(*(nw_parameters_t *)(*(_QWORD *)(a1 + 8) + 208)) != nw_interface_type_loopback)
              {
                if (!v30)
                {
                  v50 = 0;
                  goto LABEL_92;
                }
                v48 = v30;
                isa = (int)v48[12].isa;

                if (isa != 4)
                {
                  v50 = (uint32_t)v48[1].isa;
                  goto LABEL_92;
                }
              }
              v50 = -1;
LABEL_92:
              v51 = nw_advertise_descriptor_copy_txt_record_object(*(nw_advertise_descriptor_t *)(a1 + 16));
              v52 = v51;
              if (v51)
              {
                txtLen = (uint16_t)v51[2].isa;
                txtRecord = v51[1].isa;
              }
              else
              {
                txtLen = 0;
                txtRecord = 0;
              }
              bonjour_name = (const char *)nw_advertise_descriptor_get_bonjour_name(*(void **)(a1 + 16));
              bonjour_type = (const char *)nw_advertise_descriptor_get_bonjour_type(*(void **)(a1 + 16));
              if (nw_parameters_get_local_only(*(nw_parameters_t *)(a1 + 40)))
                bonjour_domain = "local.";
              else
                bonjour_domain = (const char *)nw_advertise_descriptor_get_bonjour_domain(*(void **)(a1 + 16));
              v58 = DNSServiceRegister((DNSServiceRef *)(a1 + 64), v47, v50, bonjour_name, bonjour_type, bonjour_domain, 0, bswap32(*(unsigned __int16 *)(*(_QWORD *)(a1 + 8) + 300)) >> 16, txtLen, txtRecord, (DNSServiceRegisterReply)_NWAdvertiser_dnssd_handler, (void *)a1);
              if (v58
                || (v59 = *(_DNSServiceRef_t **)(a1 + 64),
                    v60 = nw_context_copy_workloop(*(void **)(*(_QWORD *)(a1 + 8) + 24)),
                    v58 = DNSServiceSetDispatchQueue(v59, (dispatch_queue_t)v60),
                    (id)v60,
                    v58))
              {
                v61 = *(void **)(a1 + 8);
                dns_error = nw_error_create_dns_error(v58);
                nw_listener_set_state_on_queue(v61, 3, dns_error);

              }
              return;
            }
LABEL_82:
            free(v34);
            goto LABEL_83;
          }
          if (__nwlog_listener_log::onceToken != -1)
            dispatch_once(&__nwlog_listener_log::onceToken, &__block_literal_global_33_44199);
          v35 = (id)glistenerLogObj;
          v45 = __str[0];
          if (os_log_type_enabled(v35, (os_log_type_t)__str[0]))
          {
            v46 = nw_listener_get_id_string(*(void **)(a1 + 8));
            *(_DWORD *)buf = 136446722;
            v67 = "-[_NWAdvertiser start]";
            v68 = 2082;
            v69 = v46;
            v70 = 2082;
            v71 = v30 + 13;
            _os_log_impl(&dword_182FBE000, v35, v45, "%{public}s [%{public}s] Client specified an interface (%{public}s) and RegisterP2P, no backtrace", buf, 0x20u);
          }
        }
        else
        {
          if (__nwlog_listener_log::onceToken != -1)
            dispatch_once(&__nwlog_listener_log::onceToken, &__block_literal_global_33_44199);
          v35 = (id)glistenerLogObj;
          v43 = __str[0];
          if (os_log_type_enabled(v35, (os_log_type_t)__str[0]))
          {
            v44 = nw_listener_get_id_string(*(void **)(a1 + 8));
            *(_DWORD *)buf = 136446722;
            v67 = "-[_NWAdvertiser start]";
            v68 = 2082;
            v69 = v44;
            v70 = 2082;
            v71 = v30 + 13;
            _os_log_impl(&dword_182FBE000, v35, v43, "%{public}s [%{public}s] Client specified an interface (%{public}s) and RegisterP2P, backtrace limit exceeded", buf, 0x20u);
          }
        }

      }
      if (!v34)
        goto LABEL_83;
      goto LABEL_82;
    }
LABEL_40:
    v26 = 0;
    goto LABEL_50;
  }
}

- (void)updateFlows:(uint64_t)a1
{
  _QWORD *v3;
  uint64_t v4;
  uint64_t v5;
  _QWORD *v6;
  void *v7;
  _QWORD *v8;
  id v9;
  _QWORD v10[5];
  id v11;
  _QWORD v12[5];
  _QWORD v13[4];
  id v14;
  _QWORD *v15;

  v9 = a2;
  v3 = nw_dictionary_create();
  v4 = *(_QWORD *)(a1 + 56);
  v5 = MEMORY[0x1E0C809B0];
  if (v4)
  {
    v13[0] = MEMORY[0x1E0C809B0];
    v13[1] = 3221225472;
    v13[2] = __29___NWAdvertiser_updateFlows___block_invoke;
    v13[3] = &unk_1E14A3C38;
    v14 = v9;
    v15 = v3;
    nw_dictionary_apply(v4, (uint64_t)v13);

  }
  v12[0] = v5;
  v12[1] = 3221225472;
  v12[2] = __29___NWAdvertiser_updateFlows___block_invoke_2;
  v12[3] = &unk_1E14A8D48;
  v12[4] = a1;
  nw_dictionary_apply((uint64_t)v3, (uint64_t)v12);
  v10[0] = v5;
  v10[1] = 3221225472;
  v10[2] = __29___NWAdvertiser_updateFlows___block_invoke_6;
  v10[3] = &unk_1E14A5198;
  v10[4] = a1;
  v6 = nw_dictionary_create();
  v11 = v6;
  nw_path_enumerate_browse_options(v9, v10);
  v7 = *(void **)(a1 + 56);
  *(_QWORD *)(a1 + 56) = v6;
  v8 = v6;

}

- (void)reconcileChildren:(uint64_t)a1
{
  void *v3;
  void *v4;
  id v5;
  id WeakRetained;
  id *v7;
  void *v8;
  id v9;

  v9 = a2;
  v3 = *(void **)(a1 + 8);
  v4 = *(void **)(a1 + 48);
  v5 = nw_path_copy_discovered_endpoints(v9);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 24));
  v7 = nw_listener_reconcile_advertised_endpoints(v3, v4, v5, v9, WeakRetained);
  v8 = *(void **)(a1 + 48);
  *(_QWORD *)(a1 + 48) = v7;

}

- (void)stop
{
  uint64_t v2;
  NSObject *v3;
  const char *id_string;
  uint64_t (*v5)(uint64_t, uint64_t);
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  uint64_t v11;
  id v12;
  void *v13;
  void *v14;
  uint64_t v15;
  id WeakRetained;
  _BOOL4 v17;
  os_unfair_lock_s *v18;
  uint64_t v19;
  void (**v20)(_QWORD);
  void *v21;
  dispatch_qos_class_t v22;
  NSObject *v23;
  dispatch_block_t v24;
  _QWORD v25[6];
  _QWORD aBlock[8];
  uint64_t v27;
  uint64_t *v28;
  uint64_t v29;
  uint64_t (*v30)(uint64_t, uint64_t);
  void (*v31)(uint64_t);
  id v32;
  uint64_t v33;
  uint64_t *v34;
  uint64_t v35;
  void *(*v36)(uint64_t, uint64_t);
  void (*v37)(uint64_t);
  id v38;
  _QWORD v39[6];
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  _BYTE buf[24];
  uint64_t (*v45)(uint64_t, uint64_t);
  void (*v46)(uint64_t);
  id v47;
  _BYTE v48[128];
  uint64_t v49;

  v49 = *MEMORY[0x1E0C80C00];
  if (a1)
  {
    nw_context_assert_queue(*(void **)(*(_QWORD *)(a1 + 8) + 24));
    v2 = *(_QWORD *)(*(_QWORD *)(a1 + 8) + 16);
    if (v2 && !nw_path_parameters_get_logging_disabled(*(_QWORD *)(v2 + 104)))
    {
      if (__nwlog_listener_log::onceToken != -1)
        dispatch_once(&__nwlog_listener_log::onceToken, &__block_literal_global_33_44199);
      v3 = (id)glistenerLogObj;
      if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
      {
        id_string = nw_listener_get_id_string(*(void **)(a1 + 8));
        v5 = *(uint64_t (**)(uint64_t, uint64_t))(a1 + 16);
        *(_DWORD *)buf = 136446722;
        *(_QWORD *)&buf[4] = "-[_NWAdvertiser stop]";
        *(_WORD *)&buf[12] = 2082;
        *(_QWORD *)&buf[14] = id_string;
        *(_WORD *)&buf[22] = 2112;
        v45 = v5;
        _os_log_impl(&dword_182FBE000, v3, OS_LOG_TYPE_DEBUG, "%{public}s [%{public}s] stop advertise %@", buf, 0x20u);
      }

    }
    v42 = 0u;
    v43 = 0u;
    v40 = 0u;
    v41 = 0u;
    v6 = *(id *)(a1 + 48);
    v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v40, v48, 16);
    if (v7)
    {
      v8 = *(_QWORD *)v41;
      do
      {
        for (i = 0; i != v7; ++i)
        {
          if (*(_QWORD *)v41 != v8)
            objc_enumerationMutation(v6);
          -[_NWAdvertiser stop](*(_QWORD *)(*((_QWORD *)&v40 + 1) + 8 * i));
        }
        v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v40, v48, 16);
      }
      while (v7);
    }

    v10 = *(void **)(a1 + 48);
    *(_QWORD *)(a1 + 48) = 0;

    v11 = *(_QWORD *)(a1 + 64);
    if (v11)
    {
      *(_QWORD *)(a1 + 64) = 0;
      v12 = nw_parameters_copy_context(*(void **)(*(_QWORD *)(a1 + 8) + 16));
      v39[0] = MEMORY[0x1E0C809B0];
      v39[1] = 3221225472;
      v39[2] = __21___NWAdvertiser_stop__block_invoke;
      v39[3] = &unk_1E14AA348;
      v39[4] = a1;
      v39[5] = v11;
      nw_queue_context_async_if_needed(v12, v39);

    }
    v13 = *(void **)(a1 + 32);
    if (v13)
    {
      nw_path_evaluator_cancel(v13);
      v14 = *(void **)(a1 + 32);
      *(_QWORD *)(a1 + 32) = 0;

    }
    v15 = *(_QWORD *)(a1 + 8);
    if (*(_DWORD *)(v15 + 128) == 2 && (*(_BYTE *)(v15 + 302) & 1) == 0)
    {
      WeakRetained = objc_loadWeakRetained((id *)(a1 + 24));
      v17 = WeakRetained == 0;

      if (v17)
      {
        *(_QWORD *)buf = 0;
        *(_QWORD *)&buf[8] = buf;
        *(_QWORD *)&buf[16] = 0x3032000000;
        v45 = __Block_byref_object_copy__17841;
        v46 = __Block_byref_object_dispose__17842;
        v47 = 0;
        v33 = 0;
        v34 = &v33;
        v35 = 0x3032000000;
        v36 = __Block_byref_object_copy__3;
        v37 = __Block_byref_object_dispose__4;
        v38 = 0;
        v27 = 0;
        v28 = &v27;
        v29 = 0x3032000000;
        v30 = __Block_byref_object_copy__17841;
        v31 = __Block_byref_object_dispose__17842;
        v32 = 0;
        v18 = *(os_unfair_lock_s **)(a1 + 8);
        v19 = MEMORY[0x1E0C809B0];
        aBlock[0] = MEMORY[0x1E0C809B0];
        aBlock[1] = 3221225472;
        aBlock[2] = __21___NWAdvertiser_stop__block_invoke_2;
        aBlock[3] = &unk_1E149DD80;
        aBlock[4] = a1;
        aBlock[5] = buf;
        aBlock[6] = &v33;
        aBlock[7] = &v27;
        v20 = (void (**)(_QWORD))_Block_copy(aBlock);
        v18 += 2;
        os_unfair_lock_lock(v18);
        v20[2](v20);
        os_unfair_lock_unlock(v18);

        if (v34[5])
        {
          v21 = *(void **)(*(_QWORD *)&buf[8] + 40);
          if (v21)
          {
            if (v28[5])
            {
              v22 = *(_DWORD *)(*(_QWORD *)(a1 + 8) + 72);
              v25[0] = v19;
              v25[1] = 3221225472;
              v25[2] = __21___NWAdvertiser_stop__block_invoke_3;
              v25[3] = &unk_1E149CC18;
              v25[4] = &v33;
              v25[5] = &v27;
              v23 = v21;
              v24 = dispatch_block_create_with_qos_class((dispatch_block_flags_t)0, v22, 0, v25);
              dispatch_async(v23, v24);

            }
          }
        }
        _Block_object_dispose(&v27, 8);

        _Block_object_dispose(&v33, 8);
        _Block_object_dispose(buf, 8);

      }
    }
  }
}

@end
