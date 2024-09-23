@implementation NWConcrete_nw_listener

- (BOOL)canHandleNewConnection:(id)a3
{
  id v4;
  void (**v5)(_QWORD);
  int v6;
  NWConcrete_nw_listener *v7;
  id v8;
  uint64_t v9;
  NSObject *v10;
  _QWORD v12[6];
  uint64_t v13;
  uint64_t *v14;
  uint64_t v15;
  char v16;
  uint8_t buf[4];
  const char *v18;
  __int16 v19;
  char *v20;
  __int16 v21;
  id v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  nw_context_assert_queue(*((void **)self + 3));
  v13 = 0;
  v14 = &v13;
  v15 = 0x2020000000;
  v16 = 0;
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __49__NWConcrete_nw_listener_canHandleNewConnection___block_invoke;
  v12[3] = &unk_1E14ACE40;
  v12[4] = self;
  v12[5] = &v13;
  v5 = (void (**)(_QWORD))_Block_copy(v12);
  os_unfair_lock_lock((os_unfair_lock_t)self + 2);
  v5[2](v5);
  os_unfair_lock_unlock((os_unfair_lock_t)self + 2);

  v6 = *((unsigned __int8 *)v14 + 24);
  if (*((_BYTE *)v14 + 24))
  {
    v7 = self;
    v8 = v4;
    objc_msgSend(v8, "suspend");
    v9 = *((_QWORD *)v7 + 2);
    if (v9 && !nw_path_parameters_get_logging_disabled(*(_QWORD *)(v9 + 104)))
    {
      if (__nwlog_listener_log::onceToken != -1)
        dispatch_once(&__nwlog_listener_log::onceToken, &__block_literal_global_33_44199);
      v10 = (id)glistenerLogObj;
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136446722;
        v18 = "nw_listener_suspend_inbox";
        v19 = 2082;
        v20 = (char *)v7 + 42;
        v21 = 2114;
        v22 = v8;
        _os_log_impl(&dword_182FBE000, v10, OS_LOG_TYPE_DEFAULT, "%{public}s [%{public}s] Suspended for %{public}@", buf, 0x20u);
      }

    }
  }
  _Block_object_dispose(&v13, 8);

  return v6 == 0;
}

- (void)updateParametersForNewConnection:(id)a3
{
  NSObject *v4;
  uint64_t v5;
  void (**v6)(_QWORD);
  NSObject *v7;
  _QWORD v8[6];
  _QWORD aBlock[6];
  uint64_t v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t (*v13)(uint64_t, uint64_t);
  void (*v14)(uint64_t);
  id v15;

  v4 = a3;
  nw_context_assert_queue(*((void **)self + 3));
  v10 = 0;
  v11 = &v10;
  v12 = 0x3032000000;
  v13 = __Block_byref_object_copy__17841;
  v14 = __Block_byref_object_dispose__17842;
  v15 = 0;
  v5 = MEMORY[0x1E0C809B0];
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __59__NWConcrete_nw_listener_updateParametersForNewConnection___block_invoke;
  aBlock[3] = &unk_1E14ACE40;
  aBlock[4] = self;
  aBlock[5] = &v10;
  v6 = (void (**)(_QWORD))_Block_copy(aBlock);
  os_unfair_lock_lock((os_unfair_lock_t)self + 2);
  v6[2](v6);
  os_unfair_lock_unlock((os_unfair_lock_t)self + 2);

  if (v11[5])
  {
    v7 = nw_parameters_copy_default_protocol_stack(v4);
    v8[0] = v5;
    v8[1] = 3221225472;
    v8[2] = __59__NWConcrete_nw_listener_updateParametersForNewConnection___block_invoke_2;
    v8[3] = &unk_1E14A1050;
    v8[4] = self;
    v8[5] = &v10;
    nw_protocol_stack_iterate_application_protocols(v7, v8);

  }
  _Block_object_dispose(&v10, 8);

}

- (char)getPeerDeviceID
{
  os_unfair_lock_s *v3;
  void (**v4)(_QWORD);
  char *v5;
  _QWORD v7[6];
  uint64_t v8;
  uint64_t *v9;
  uint64_t v10;
  uint64_t v11;

  nw_context_assert_queue(*((void **)self + 3));
  v8 = 0;
  v9 = &v8;
  v10 = 0x2020000000;
  v11 = 0;
  v3 = (os_unfair_lock_s *)((char *)self + 8);
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __41__NWConcrete_nw_listener_getPeerDeviceID__block_invoke;
  v7[3] = &unk_1E14ACE40;
  v7[4] = self;
  v7[5] = &v8;
  v4 = (void (**)(_QWORD))_Block_copy(v7);
  os_unfair_lock_lock(v3);
  v4[2](v4);
  os_unfair_lock_unlock(v3);

  v5 = (char *)v9[3];
  _Block_object_dispose(&v8, 8);
  return v5;
}

- (void)handleInbound:(id)a3 addProtocolInbox:(BOOL)a4
{
  _BOOL4 v4;
  NSObject *v6;
  uint64_t v7;
  NSObject *v8;
  NWConcrete_nw_listener *v9;
  char *v10;
  void (**v11)(_QWORD);
  NWConcrete_nw_listener *v12;
  void *v13;
  _DWORD *v14;
  int v15;
  uint64_t v16;
  NSObject *v17;
  const char *id_string;
  uint64_t listener_protocol_on_nw_queue;
  uint64_t v20;
  NSObject *v21;
  NWConcrete_nw_listener *v22;
  void *v23;
  uint64_t v24;
  NSObject *v25;
  const char *v26;
  uint64_t v27;
  void (**v28)(_QWORD);
  NSObject *v29;
  nw_group_descriptor_t multiplex;
  id *v31;
  id *v32;
  void (**v33)(_QWORD);
  void *v34;
  dispatch_qos_class_t v35;
  NSObject *v36;
  NSObject *v37;
  uint64_t v38;
  const char *v39;
  _QWORD v40[4];
  NSObject *v41;
  uint64_t *v42;
  _QWORD v43[4];
  id *v44;
  uint64_t *v45;
  _QWORD v46[9];
  uint64_t v47;
  uint64_t *v48;
  uint64_t v49;
  void *(*v50)(uint64_t, uint64_t);
  void (*v51)(uint64_t);
  id v52;
  uint64_t v53;
  uint64_t *v54;
  uint64_t v55;
  void *(*v56)(uint64_t, uint64_t);
  void (*v57)(uint64_t);
  id v58;
  uint64_t v59;
  uint64_t *v60;
  uint64_t v61;
  char v62;
  _QWORD v63[5];
  NSObject *v64;
  _QWORD aBlock[5];
  uint8_t v66[4];
  const char *v67;
  __int16 v68;
  const char *v69;
  _BYTE buf[24];
  __int128 v71;
  id v72;
  uint64_t v73;

  v4 = a4;
  v73 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  nw_context_assert_queue(*((void **)self + 3));
  v7 = *((_QWORD *)self + 2);
  if (v7 && !nw_path_parameters_get_logging_disabled(*(_QWORD *)(v7 + 104)))
  {
    if (__nwlog_listener_log::onceToken != -1)
      dispatch_once(&__nwlog_listener_log::onceToken, &__block_literal_global_33_44199);
    v8 = (id)glistenerLogObj;
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      v9 = self;
      v10 = (char *)v9 + 42;

      *(_DWORD *)buf = 136446978;
      *(_QWORD *)&buf[4] = "-[NWConcrete_nw_listener handleInbound:addProtocolInbox:]";
      *(_WORD *)&buf[12] = 2082;
      *(_QWORD *)&buf[14] = v10;
      *(_WORD *)&buf[22] = 1024;
      LODWORD(v71) = v4;
      WORD2(v71) = 2112;
      *(_QWORD *)((char *)&v71 + 6) = v6;
      _os_log_impl(&dword_182FBE000, v8, OS_LOG_TYPE_DEFAULT, "%{public}s [%{public}s] Handling inbound connection (add inbox %u) %@", buf, 0x26u);
    }

  }
  if (*((_DWORD *)self + 32) == 2 && (*((_BYTE *)self + 302) & 1) == 0)
  {
    aBlock[0] = MEMORY[0x1E0C809B0];
    aBlock[1] = 3221225472;
    aBlock[2] = __57__NWConcrete_nw_listener_handleInbound_addProtocolInbox___block_invoke;
    aBlock[3] = &unk_1E14ACFD0;
    aBlock[4] = self;
    v11 = (void (**)(_QWORD))_Block_copy(aBlock);
    os_unfair_lock_lock((os_unfair_lock_t)self + 2);
    v11[2](v11);
    os_unfair_lock_unlock((os_unfair_lock_t)self + 2);

    v12 = self;
    if (nw_parameters_get_include_peer_to_peer(*((nw_parameters_t *)self + 2))
      && nw_parameters_get_multipath_service(*((nw_parameters_t *)self + 2))
      && (v13 = (void *)*((_QWORD *)v12 + 33)) != 0)
    {
      v14 = v13;
      v15 = v14[2];

      if (v15 == 2)
      {
        v16 = *((_QWORD *)self + 2);
        if (v16 && !nw_path_parameters_get_logging_disabled(*(_QWORD *)(v16 + 104)))
        {
          if (__nwlog_listener_log::onceToken != -1)
            dispatch_once(&__nwlog_listener_log::onceToken, &__block_literal_global_33_44199);
          v17 = (id)glistenerLogObj;
          if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
          {
            id_string = nw_listener_get_id_string(v12);
            *(_DWORD *)buf = 136446722;
            *(_QWORD *)&buf[4] = "-[NWConcrete_nw_listener handleInbound:addProtocolInbox:]";
            *(_WORD *)&buf[12] = 2082;
            *(_QWORD *)&buf[14] = id_string;
            *(_WORD *)&buf[22] = 2112;
            *(_QWORD *)&v71 = v6;
            _os_log_impl(&dword_182FBE000, v17, OS_LOG_TYPE_INFO, "%{public}s [%{public}s] Monitoring connection %@ for AWDL usage", buf, 0x20u);
          }

        }
        v63[0] = MEMORY[0x1E0C809B0];
        v63[1] = 3221225472;
        v63[2] = __57__NWConcrete_nw_listener_handleInbound_addProtocolInbox___block_invoke_38;
        v63[3] = &unk_1E149CC40;
        v63[4] = v12;
        v64 = v6;
        nw_connection_set_interface_use_callback(v64, v63);

      }
    }
    else
    {

    }
    if (v4)
    {
      listener_protocol_on_nw_queue = nw_connection_get_listener_protocol_on_nw_queue(v6, *((void **)self + 2), 0);
      if (listener_protocol_on_nw_queue)
      {
        v20 = *((_QWORD *)self + 2);
        if (v20 && !nw_path_parameters_get_logging_disabled(*(_QWORD *)(v20 + 104)))
        {
          if (__nwlog_listener_log::onceToken != -1)
            dispatch_once(&__nwlog_listener_log::onceToken, &__block_literal_global_33_44199);
          v21 = (id)glistenerLogObj;
          if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
          {
            v22 = v12;

            *(_DWORD *)buf = 136446466;
            *(_QWORD *)&buf[4] = "-[NWConcrete_nw_listener handleInbound:addProtocolInbox:]";
            *(_WORD *)&buf[12] = 2082;
            *(_QWORD *)&buf[14] = (char *)v22 + 42;
            _os_log_impl(&dword_182FBE000, v21, OS_LOG_TYPE_INFO, "%{public}s [%{public}s] Listener found protocol in new connection to create an inbox from", buf, 0x16u);
          }

        }
        v23 = -[nw_listener_inbox_protocol initWithProtocol:delegate:]([nw_listener_inbox_protocol alloc], listener_protocol_on_nw_queue, v12);
        if (v23)
        {
          nw_array_append(*((_QWORD *)v12 + 18), v23);
        }
        else
        {
          v24 = *((_QWORD *)self + 2);
          if (v24 && !nw_path_parameters_get_logging_disabled(*(_QWORD *)(v24 + 104)))
          {
            if (__nwlog_listener_log::onceToken != -1)
              dispatch_once(&__nwlog_listener_log::onceToken, &__block_literal_global_33_44199);
            v25 = (id)glistenerLogObj;
            if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
            {
              v26 = nw_listener_get_id_string(v12);
              v27 = *(_QWORD *)(listener_protocol_on_nw_queue + 16);
              *(_DWORD *)buf = 136446722;
              *(_QWORD *)&buf[4] = "-[NWConcrete_nw_listener handleInbound:addProtocolInbox:]";
              *(_WORD *)&buf[12] = 2082;
              *(_QWORD *)&buf[14] = v26;
              *(_WORD *)&buf[22] = 2082;
              *(_QWORD *)&v71 = v27;
              _os_log_impl(&dword_182FBE000, v25, OS_LOG_TYPE_ERROR, "%{public}s [%{public}s] Failed to create inbox for %{public}s", buf, 0x20u);
            }

          }
        }

      }
    }
    v59 = 0;
    v60 = &v59;
    v61 = 0x2020000000;
    v62 = 0;
    *(_QWORD *)buf = 0;
    *(_QWORD *)&buf[8] = buf;
    *(_QWORD *)&buf[16] = 0x3032000000;
    *(_QWORD *)&v71 = __Block_byref_object_copy__17841;
    *((_QWORD *)&v71 + 1) = __Block_byref_object_dispose__17842;
    v72 = 0;
    v53 = 0;
    v54 = &v53;
    v55 = 0x3032000000;
    v56 = __Block_byref_object_copy__3;
    v57 = __Block_byref_object_dispose__4;
    v58 = 0;
    v47 = 0;
    v48 = &v47;
    v49 = 0x3032000000;
    v50 = __Block_byref_object_copy__3;
    v51 = __Block_byref_object_dispose__4;
    v52 = 0;
    v46[0] = MEMORY[0x1E0C809B0];
    v46[1] = 3221225472;
    v46[2] = __57__NWConcrete_nw_listener_handleInbound_addProtocolInbox___block_invoke_40;
    v46[3] = &unk_1E149CC68;
    v46[4] = v12;
    v46[5] = &v59;
    v46[6] = buf;
    v46[7] = &v53;
    v46[8] = &v47;
    v28 = (void (**)(_QWORD))_Block_copy(v46);
    os_unfair_lock_lock((os_unfair_lock_t)self + 2);
    v28[2](v28);
    os_unfair_lock_unlock((os_unfair_lock_t)self + 2);

    if (v48[5])
    {
      v29 = nw_connection_copy_endpoint(v6);
      multiplex = nw_group_descriptor_create_multiplex(v29);
      v31 = nw_connection_group_create_with_connection(multiplex, v6);
      v43[0] = MEMORY[0x1E0C809B0];
      v43[1] = 3221225472;
      v43[2] = __57__NWConcrete_nw_listener_handleInbound_addProtocolInbox___block_invoke_2;
      v43[3] = &unk_1E14ACE40;
      v44 = v31;
      v45 = &v47;
      v32 = v31;
      v33 = (void (**)(_QWORD))_Block_copy(v43);

    }
    else
    {
      if (!v54[5])
      {
        v38 = *((_QWORD *)self + 2);
        if (!v38 || nw_path_parameters_get_logging_disabled(*(_QWORD *)(v38 + 104)))
        {
          v33 = 0;
          goto LABEL_58;
        }
        if (__nwlog_listener_log::onceToken != -1)
          dispatch_once(&__nwlog_listener_log::onceToken, &__block_literal_global_33_44199);
        v37 = (id)glistenerLogObj;
        if (os_log_type_enabled(v37, OS_LOG_TYPE_ERROR))
        {
          v39 = nw_listener_get_id_string(v12);
          *(_DWORD *)v66 = 136446466;
          v67 = "-[NWConcrete_nw_listener handleInbound:addProtocolInbox:]";
          v68 = 2082;
          v69 = v39;
          _os_log_impl(&dword_182FBE000, v37, OS_LOG_TYPE_ERROR, "%{public}s [%{public}s] Neither connection handler nor connection group handler is set", v66, 0x16u);
        }
        v33 = 0;
        goto LABEL_57;
      }
      v40[0] = MEMORY[0x1E0C809B0];
      v40[1] = 3221225472;
      v40[2] = __57__NWConcrete_nw_listener_handleInbound_addProtocolInbox___block_invoke_3;
      v40[3] = &unk_1E14ACE40;
      v42 = &v53;
      v41 = v6;
      v33 = (void (**)(_QWORD))_Block_copy(v40);
      v29 = v41;
    }

    if (*((_BYTE *)v60 + 24))
    {
LABEL_47:
      v33[2](v33);
LABEL_58:

      _Block_object_dispose(&v47, 8);
      _Block_object_dispose(&v53, 8);

      _Block_object_dispose(buf, 8);
      _Block_object_dispose(&v59, 8);
      goto LABEL_59;
    }
    v34 = *(void **)(*(_QWORD *)&buf[8] + 40);
    if (!v34)
    {
      if (nw_context_is_inline(*((void **)self + 3)))
        goto LABEL_47;
      v34 = *(void **)(*(_QWORD *)&buf[8] + 40);
      if (!v34)
        goto LABEL_58;
    }
    v35 = *((_DWORD *)v12 + 18);
    v36 = v34;
    v37 = dispatch_block_create_with_qos_class((dispatch_block_flags_t)0, v35, 0, v33);
    dispatch_async(v36, v37);

LABEL_57:
    goto LABEL_58;
  }
LABEL_59:

}

- (char)initWithParameters:(void *)a3 multicastDescriptor:
{
  id v6;
  id v7;
  char *v8;
  NSObject *v9;
  id v10;
  NSObject *v11;
  id v12;
  void *v13;
  uint64_t *v14;
  unsigned int v15;
  unsigned int v16;
  int v17;
  NSObject *v19;
  char *v20;
  uint64_t v21;
  NSObject *v22;
  const char *v23;
  uint64_t v24;
  const char *v25;
  NSObject *v26;
  uint32_t v27;
  _BOOL8 host_with_numeric_port;
  const char *v29;
  char *v30;
  id v31;
  char *v32;
  NSObject *v33;
  os_log_type_t v34;
  const char *v36;
  char *v37;
  NSObject *v38;
  os_log_type_t v39;
  os_log_type_t v40;
  os_log_type_t v41;
  void *v42;
  char *v43;
  NSObject *v44;
  os_log_type_t v45;
  void *v46;
  char *v47;
  NSObject *v48;
  os_log_type_t v49;
  char *backtrace_string;
  os_log_type_t v51;
  _BOOL4 v52;
  char *v53;
  os_log_type_t v54;
  _BOOL4 v55;
  os_log_type_t v56;
  os_log_type_t v57;
  char v58;
  os_log_type_t type;
  objc_super v60;
  uint8_t buf[4];
  const char *v62;
  __int16 v63;
  char *v64;
  __int16 v65;
  const char *v66;
  __int16 v67;
  uint64_t v68;
  uint64_t v69;

  v69 = *MEMORY[0x1E0C80C00];
  v6 = a2;
  v7 = a3;
  if (!a1)
  {
LABEL_99:
    v30 = 0;
    goto LABEL_49;
  }
  v60.receiver = a1;
  v60.super_class = (Class)NWConcrete_nw_listener;
  v8 = (char *)objc_msgSendSuper2(&v60, sel_init);
  if (!v8)
  {
    __nwlog_obj();
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 136446210;
    v62 = "-[NWConcrete_nw_listener initWithParameters:multicastDescriptor:]";
    v43 = (char *)_os_log_send_and_compose_impl();

    type = OS_LOG_TYPE_ERROR;
    v58 = 0;
    if (__nwlog_fault(v43, &type, &v58))
    {
      if (type == OS_LOG_TYPE_FAULT)
      {
        __nwlog_obj();
        v44 = objc_claimAutoreleasedReturnValue();
        v45 = type;
        if (os_log_type_enabled(v44, type))
        {
          *(_DWORD *)buf = 136446210;
          v62 = "-[NWConcrete_nw_listener initWithParameters:multicastDescriptor:]";
          _os_log_impl(&dword_182FBE000, v44, v45, "%{public}s [super init] failed", buf, 0xCu);
        }
      }
      else if (v58)
      {
        backtrace_string = (char *)__nw_create_backtrace_string();
        __nwlog_obj();
        v44 = objc_claimAutoreleasedReturnValue();
        v51 = type;
        v52 = os_log_type_enabled(v44, type);
        if (backtrace_string)
        {
          if (v52)
          {
            *(_DWORD *)buf = 136446466;
            v62 = "-[NWConcrete_nw_listener initWithParameters:multicastDescriptor:]";
            v63 = 2082;
            v64 = backtrace_string;
            _os_log_impl(&dword_182FBE000, v44, v51, "%{public}s [super init] failed, dumping backtrace:%{public}s", buf, 0x16u);
          }

          free(backtrace_string);
          goto LABEL_91;
        }
        if (v52)
        {
          *(_DWORD *)buf = 136446210;
          v62 = "-[NWConcrete_nw_listener initWithParameters:multicastDescriptor:]";
          _os_log_impl(&dword_182FBE000, v44, v51, "%{public}s [super init] failed, no backtrace", buf, 0xCu);
        }
      }
      else
      {
        __nwlog_obj();
        v44 = objc_claimAutoreleasedReturnValue();
        v56 = type;
        if (os_log_type_enabled(v44, type))
        {
          *(_DWORD *)buf = 136446210;
          v62 = "-[NWConcrete_nw_listener initWithParameters:multicastDescriptor:]";
          _os_log_impl(&dword_182FBE000, v44, v56, "%{public}s [super init] failed, backtrace limit exceeded", buf, 0xCu);
        }
      }

    }
LABEL_91:
    if (v43)
      free(v43);
    goto LABEL_99;
  }
  if (!v6)
  {
    __nwlog_obj();
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 136446210;
    v62 = "-[NWConcrete_nw_listener initWithParameters:multicastDescriptor:]";
    v47 = (char *)_os_log_send_and_compose_impl();

    type = OS_LOG_TYPE_ERROR;
    v58 = 0;
    if (__nwlog_fault(v47, &type, &v58))
    {
      if (type == OS_LOG_TYPE_FAULT)
      {
        __nwlog_obj();
        v48 = objc_claimAutoreleasedReturnValue();
        v49 = type;
        if (os_log_type_enabled(v48, type))
        {
          *(_DWORD *)buf = 136446210;
          v62 = "-[NWConcrete_nw_listener initWithParameters:multicastDescriptor:]";
          _os_log_impl(&dword_182FBE000, v48, v49, "%{public}s called with null _parameters", buf, 0xCu);
        }
      }
      else if (v58)
      {
        v53 = (char *)__nw_create_backtrace_string();
        __nwlog_obj();
        v48 = objc_claimAutoreleasedReturnValue();
        v54 = type;
        v55 = os_log_type_enabled(v48, type);
        if (v53)
        {
          if (v55)
          {
            *(_DWORD *)buf = 136446466;
            v62 = "-[NWConcrete_nw_listener initWithParameters:multicastDescriptor:]";
            v63 = 2082;
            v64 = v53;
            _os_log_impl(&dword_182FBE000, v48, v54, "%{public}s called with null _parameters, dumping backtrace:%{public}s", buf, 0x16u);
          }

          free(v53);
          goto LABEL_96;
        }
        if (v55)
        {
          *(_DWORD *)buf = 136446210;
          v62 = "-[NWConcrete_nw_listener initWithParameters:multicastDescriptor:]";
          _os_log_impl(&dword_182FBE000, v48, v54, "%{public}s called with null _parameters, no backtrace", buf, 0xCu);
        }
      }
      else
      {
        __nwlog_obj();
        v48 = objc_claimAutoreleasedReturnValue();
        v57 = type;
        if (os_log_type_enabled(v48, type))
        {
          *(_DWORD *)buf = 136446210;
          v62 = "-[NWConcrete_nw_listener initWithParameters:multicastDescriptor:]";
          _os_log_impl(&dword_182FBE000, v48, v57, "%{public}s called with null _parameters, backtrace limit exceeded", buf, 0xCu);
        }
      }

    }
LABEL_96:
    if (v47)
      free(v47);

    goto LABEL_99;
  }
  v9 = v6;
  v10 = *((id *)v9[13].isa + 20);

  if (v10)
  {
LABEL_5:
    objc_storeStrong((id *)v8 + 2, a2);
    v11 = v9;
    v12 = *((id *)v9[13].isa + 17);

    v13 = (void *)*((_QWORD *)v8 + 3);
    *((_QWORD *)v8 + 3) = v12;

    v14 = (uint64_t *)(v8 + 32);
    objc_storeStrong((id *)v8 + 4, a3);
    nw_parameters_set_server_mode(*((void **)v8 + 2), 1);
    do
    {
      v15 = __ldaxr(nw_listener_get_next_id(void)::s_last_listener_id);
      v16 = v15 + 1;
    }
    while (__stlxr(v15 + 1, nw_listener_get_next_id(void)::s_last_listener_id));
    v17 = (unsigned __int16)(v15 + 1);
    if (v16 >= 0x10000 && v17 == 0)
    {
      pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
      networkd_settings_init();
      v19 = (id)gLogObj;
      if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136446466;
        v62 = "nw_listener_get_next_id";
        v63 = 1024;
        LODWORD(v64) = v16;
        _os_log_impl(&dword_182FBE000, v19, OS_LOG_TYPE_ERROR, "%{public}s reached %u listeners, wrapping", buf, 0x12u);
      }

    }
    *((_WORD *)v8 + 20) = v16;
    snprintf(v8 + 42, 6uLL, "L%u", v17);
    v20 = nw_parameters_copy_description_internal(*((NWConcrete_nw_parameters **)v8 + 2), 0);
    v21 = *((_QWORD *)v8 + 2);
    if (*v14)
    {
      if (!v21 || nw_path_parameters_get_logging_disabled(*(_QWORD *)(v21 + 104)))
        goto LABEL_37;
      if (__nwlog_listener_log::onceToken != -1)
        dispatch_once(&__nwlog_listener_log::onceToken, &__block_literal_global_33_44199);
      v22 = (id)glistenerLogObj;
      if (!os_log_type_enabled(v22, OS_LOG_TYPE_DEBUG))
      {
LABEL_36:

LABEL_37:
        if (v20)
          free(v20);
        *((_DWORD *)v8 + 26) = -1;
        v30 = v8;
        goto LABEL_48;
      }
      v23 = "<NULL>";
      v24 = *v14;
      if (v20)
        v23 = v20;
      *(_DWORD *)buf = 136446978;
      v62 = "-[NWConcrete_nw_listener initWithParameters:multicastDescriptor:]";
      v63 = 2082;
      v64 = v8 + 42;
      v65 = 2082;
      v66 = v23;
      v67 = 2114;
      v68 = v24;
      v25 = "%{public}s [%{public}s] created: <%{public}s, %{public}@>";
      v26 = v22;
      v27 = 42;
    }
    else
    {
      if (!v21 || nw_path_parameters_get_logging_disabled(*(_QWORD *)(v21 + 104)))
        goto LABEL_37;
      if (__nwlog_listener_log::onceToken != -1)
        dispatch_once(&__nwlog_listener_log::onceToken, &__block_literal_global_33_44199);
      v22 = (id)glistenerLogObj;
      if (!os_log_type_enabled(v22, OS_LOG_TYPE_DEBUG))
        goto LABEL_36;
      v29 = "<NULL>";
      *(_DWORD *)buf = 136446722;
      v62 = "-[NWConcrete_nw_listener initWithParameters:multicastDescriptor:]";
      v63 = 2082;
      if (v20)
        v29 = v20;
      v64 = v8 + 42;
      v65 = 2082;
      v66 = v29;
      v25 = "%{public}s [%{public}s] created: <%{public}s>";
      v26 = v22;
      v27 = 32;
    }
    _os_log_impl(&dword_182FBE000, v26, OS_LOG_TYPE_DEBUG, v25, buf, v27);
    goto LABEL_36;
  }
  *(_WORD *)buf = 0;
  if ((nw_utilities_port_for_string("0", buf) & 1) != 0)
  {
    host_with_numeric_port = nw_endpoint_create_host_with_numeric_port("::", bswap32(*(unsigned __int16 *)buf) >> 16);
    if (host_with_numeric_port)
    {
      nw_parameters_set_local_endpoint(v9, (nw_endpoint_t)host_with_numeric_port);

      goto LABEL_5;
    }
  }
  pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
  networkd_settings_init();
  v31 = (id)gLogObj;
  *(_DWORD *)buf = 136446210;
  v62 = "-[NWConcrete_nw_listener initWithParameters:multicastDescriptor:]";
  v32 = (char *)_os_log_send_and_compose_impl();

  type = OS_LOG_TYPE_ERROR;
  v58 = 0;
  if (__nwlog_fault(v32, &type, &v58))
  {
    if (type == OS_LOG_TYPE_FAULT)
    {
      pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
      networkd_settings_init();
      v33 = (id)gLogObj;
      v34 = type;
      if (os_log_type_enabled(v33, type))
      {
        *(_DWORD *)buf = 136446210;
        v62 = "-[NWConcrete_nw_listener initWithParameters:multicastDescriptor:]";
        _os_log_impl(&dword_182FBE000, v33, v34, "%{public}s nw_endpoint_create_host failed", buf, 0xCu);
      }
    }
    else if (v58)
    {
      v36 = __nw_create_backtrace_string();
      if (v36)
      {
        v37 = (char *)v36;
        pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
        networkd_settings_init();
        v38 = (id)gLogObj;
        v39 = type;
        if (os_log_type_enabled(v38, type))
        {
          *(_DWORD *)buf = 136446466;
          v62 = "-[NWConcrete_nw_listener initWithParameters:multicastDescriptor:]";
          v63 = 2082;
          v64 = v37;
          _os_log_impl(&dword_182FBE000, v38, v39, "%{public}s nw_endpoint_create_host failed, dumping backtrace:%{public}s", buf, 0x16u);
        }

        free(v37);
        if (!v32)
          goto LABEL_47;
        goto LABEL_46;
      }
      __nwlog_obj();
      v33 = objc_claimAutoreleasedReturnValue();
      v41 = type;
      if (os_log_type_enabled(v33, type))
      {
        *(_DWORD *)buf = 136446210;
        v62 = "-[NWConcrete_nw_listener initWithParameters:multicastDescriptor:]";
        _os_log_impl(&dword_182FBE000, v33, v41, "%{public}s nw_endpoint_create_host failed, no backtrace", buf, 0xCu);
      }
    }
    else
    {
      pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
      networkd_settings_init();
      v33 = (id)gLogObj;
      v40 = type;
      if (os_log_type_enabled(v33, type))
      {
        *(_DWORD *)buf = 136446210;
        v62 = "-[NWConcrete_nw_listener initWithParameters:multicastDescriptor:]";
        _os_log_impl(&dword_182FBE000, v33, v40, "%{public}s nw_endpoint_create_host failed, backtrace limit exceeded", buf, 0xCu);
      }
    }

  }
  if (v32)
LABEL_46:
    free(v32);
LABEL_47:
  v30 = 0;
LABEL_48:

LABEL_49:
  return v30;
}

- (void)handleInboundPacket:(const char *)a3 length:(unsigned __int16)a4 from:(id)a5 to:(id)a6 interface:(id)a7 socket:(id)a8
{
  unsigned int v11;
  id v14;
  id v15;
  id v16;
  id v17;
  uint64_t v18;
  void (**v19)(_QWORD);
  dispatch_data_t v20;
  NSObject *v21;
  void (**v22)(_QWORD);
  void *v23;
  dispatch_qos_class_t v24;
  NSObject *v25;
  dispatch_block_t v26;
  uint64_t v27;
  NSObject *v28;
  NWConcrete_nw_listener *v29;
  char *v30;
  uint64_t v31;
  NWConcrete_nw_listener *v32;
  void *v33;
  char *v34;
  NSObject *v35;
  os_log_type_t v36;
  void *v37;
  os_log_type_t v38;
  void *v39;
  os_log_type_t v40;
  void *v41;
  os_log_type_t v42;
  void *v43;
  os_log_type_t v44;
  void *v45;
  os_log_type_t v46;
  char *backtrace_string;
  os_log_type_t v48;
  _BOOL4 v49;
  char *v50;
  os_log_type_t v51;
  _BOOL4 v52;
  os_log_type_t v53;
  _BOOL4 v54;
  os_log_type_t v55;
  _BOOL4 v56;
  os_log_type_t v57;
  _BOOL4 v58;
  os_log_type_t v59;
  _BOOL4 v60;
  os_log_type_t v61;
  os_log_type_t v62;
  os_log_type_t v63;
  os_log_type_t v64;
  os_log_type_t v65;
  os_log_type_t v66;
  _QWORD v67[4];
  id v68;
  id v69;
  id v70;
  id v71;
  NSObject *v72;
  _BYTE *v73;
  _QWORD aBlock[7];
  os_log_type_t type[8];
  os_log_type_t *v76;
  uint64_t v77;
  uint64_t (*v78)(uint64_t, uint64_t);
  void (*v79)(uint64_t);
  id v80;
  uint8_t v81[4];
  const char *v82;
  __int16 v83;
  char *v84;
  _BYTE buf[24];
  void *(*v86)(uint64_t, uint64_t);
  void (*v87)(uint64_t);
  id v88;
  uint64_t v89;

  v11 = a4;
  v89 = *MEMORY[0x1E0C80C00];
  v14 = a5;
  v15 = a6;
  v16 = a7;
  v17 = a8;
  nw_context_assert_queue(*((void **)self + 3));
  if (!a3)
  {
    __nwlog_obj();
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 136446210;
    *(_QWORD *)&buf[4] = "-[NWConcrete_nw_listener handleInboundPacket:length:from:to:interface:socket:]";
    v34 = (char *)_os_log_send_and_compose_impl();

    type[0] = OS_LOG_TYPE_ERROR;
    v81[0] = 0;
    if (!__nwlog_fault(v34, type, v81))
      goto LABEL_128;
    if (type[0] == OS_LOG_TYPE_FAULT)
    {
      __nwlog_obj();
      v35 = objc_claimAutoreleasedReturnValue();
      v36 = type[0];
      if (os_log_type_enabled(v35, type[0]))
      {
        *(_DWORD *)buf = 136446210;
        *(_QWORD *)&buf[4] = "-[NWConcrete_nw_listener handleInboundPacket:length:from:to:interface:socket:]";
        _os_log_impl(&dword_182FBE000, v35, v36, "%{public}s called with null buffer", buf, 0xCu);
      }
    }
    else if (v81[0])
    {
      backtrace_string = (char *)__nw_create_backtrace_string();
      __nwlog_obj();
      v35 = objc_claimAutoreleasedReturnValue();
      v48 = type[0];
      v49 = os_log_type_enabled(v35, type[0]);
      if (backtrace_string)
      {
        if (v49)
        {
          *(_DWORD *)buf = 136446466;
          *(_QWORD *)&buf[4] = "-[NWConcrete_nw_listener handleInboundPacket:length:from:to:interface:socket:]";
          *(_WORD *)&buf[12] = 2082;
          *(_QWORD *)&buf[14] = backtrace_string;
          _os_log_impl(&dword_182FBE000, v35, v48, "%{public}s called with null buffer, dumping backtrace:%{public}s", buf, 0x16u);
        }

        free(backtrace_string);
LABEL_128:
        if (!v34)
          goto LABEL_30;
LABEL_129:
        free(v34);
        goto LABEL_30;
      }
      if (v49)
      {
        *(_DWORD *)buf = 136446210;
        *(_QWORD *)&buf[4] = "-[NWConcrete_nw_listener handleInboundPacket:length:from:to:interface:socket:]";
        _os_log_impl(&dword_182FBE000, v35, v48, "%{public}s called with null buffer, no backtrace", buf, 0xCu);
      }
    }
    else
    {
      __nwlog_obj();
      v35 = objc_claimAutoreleasedReturnValue();
      v61 = type[0];
      if (os_log_type_enabled(v35, type[0]))
      {
        *(_DWORD *)buf = 136446210;
        *(_QWORD *)&buf[4] = "-[NWConcrete_nw_listener handleInboundPacket:length:from:to:interface:socket:]";
        _os_log_impl(&dword_182FBE000, v35, v61, "%{public}s called with null buffer, backtrace limit exceeded", buf, 0xCu);
      }
    }
LABEL_127:

    goto LABEL_128;
  }
  if (!v11)
  {
    __nwlog_obj();
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 136446210;
    *(_QWORD *)&buf[4] = "-[NWConcrete_nw_listener handleInboundPacket:length:from:to:interface:socket:]";
    v34 = (char *)_os_log_send_and_compose_impl();

    type[0] = OS_LOG_TYPE_ERROR;
    v81[0] = 0;
    if (!__nwlog_fault(v34, type, v81))
      goto LABEL_128;
    if (type[0] == OS_LOG_TYPE_FAULT)
    {
      __nwlog_obj();
      v35 = objc_claimAutoreleasedReturnValue();
      v38 = type[0];
      if (os_log_type_enabled(v35, type[0]))
      {
        *(_DWORD *)buf = 136446210;
        *(_QWORD *)&buf[4] = "-[NWConcrete_nw_listener handleInboundPacket:length:from:to:interface:socket:]";
        _os_log_impl(&dword_182FBE000, v35, v38, "%{public}s called with null length", buf, 0xCu);
      }
      goto LABEL_127;
    }
    if (!v81[0])
    {
      __nwlog_obj();
      v35 = objc_claimAutoreleasedReturnValue();
      v62 = type[0];
      if (os_log_type_enabled(v35, type[0]))
      {
        *(_DWORD *)buf = 136446210;
        *(_QWORD *)&buf[4] = "-[NWConcrete_nw_listener handleInboundPacket:length:from:to:interface:socket:]";
        _os_log_impl(&dword_182FBE000, v35, v62, "%{public}s called with null length, backtrace limit exceeded", buf, 0xCu);
      }
      goto LABEL_127;
    }
    v50 = (char *)__nw_create_backtrace_string();
    __nwlog_obj();
    v35 = objc_claimAutoreleasedReturnValue();
    v51 = type[0];
    v52 = os_log_type_enabled(v35, type[0]);
    if (!v50)
    {
      if (v52)
      {
        *(_DWORD *)buf = 136446210;
        *(_QWORD *)&buf[4] = "-[NWConcrete_nw_listener handleInboundPacket:length:from:to:interface:socket:]";
        _os_log_impl(&dword_182FBE000, v35, v51, "%{public}s called with null length, no backtrace", buf, 0xCu);
      }
      goto LABEL_127;
    }
    if (v52)
    {
      *(_DWORD *)buf = 136446466;
      *(_QWORD *)&buf[4] = "-[NWConcrete_nw_listener handleInboundPacket:length:from:to:interface:socket:]";
      *(_WORD *)&buf[12] = 2082;
      *(_QWORD *)&buf[14] = v50;
      _os_log_impl(&dword_182FBE000, v35, v51, "%{public}s called with null length, dumping backtrace:%{public}s", buf, 0x16u);
    }
    goto LABEL_90;
  }
  if (!v14)
  {
    __nwlog_obj();
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 136446210;
    *(_QWORD *)&buf[4] = "-[NWConcrete_nw_listener handleInboundPacket:length:from:to:interface:socket:]";
    v34 = (char *)_os_log_send_and_compose_impl();

    type[0] = OS_LOG_TYPE_ERROR;
    v81[0] = 0;
    if (!__nwlog_fault(v34, type, v81))
      goto LABEL_128;
    if (type[0] == OS_LOG_TYPE_FAULT)
    {
      __nwlog_obj();
      v35 = objc_claimAutoreleasedReturnValue();
      v40 = type[0];
      if (os_log_type_enabled(v35, type[0]))
      {
        *(_DWORD *)buf = 136446210;
        *(_QWORD *)&buf[4] = "-[NWConcrete_nw_listener handleInboundPacket:length:from:to:interface:socket:]";
        _os_log_impl(&dword_182FBE000, v35, v40, "%{public}s called with null source", buf, 0xCu);
      }
      goto LABEL_127;
    }
    if (!v81[0])
    {
      __nwlog_obj();
      v35 = objc_claimAutoreleasedReturnValue();
      v63 = type[0];
      if (os_log_type_enabled(v35, type[0]))
      {
        *(_DWORD *)buf = 136446210;
        *(_QWORD *)&buf[4] = "-[NWConcrete_nw_listener handleInboundPacket:length:from:to:interface:socket:]";
        _os_log_impl(&dword_182FBE000, v35, v63, "%{public}s called with null source, backtrace limit exceeded", buf, 0xCu);
      }
      goto LABEL_127;
    }
    v50 = (char *)__nw_create_backtrace_string();
    __nwlog_obj();
    v35 = objc_claimAutoreleasedReturnValue();
    v53 = type[0];
    v54 = os_log_type_enabled(v35, type[0]);
    if (!v50)
    {
      if (v54)
      {
        *(_DWORD *)buf = 136446210;
        *(_QWORD *)&buf[4] = "-[NWConcrete_nw_listener handleInboundPacket:length:from:to:interface:socket:]";
        _os_log_impl(&dword_182FBE000, v35, v53, "%{public}s called with null source, no backtrace", buf, 0xCu);
      }
      goto LABEL_127;
    }
    if (v54)
    {
      *(_DWORD *)buf = 136446466;
      *(_QWORD *)&buf[4] = "-[NWConcrete_nw_listener handleInboundPacket:length:from:to:interface:socket:]";
      *(_WORD *)&buf[12] = 2082;
      *(_QWORD *)&buf[14] = v50;
      _os_log_impl(&dword_182FBE000, v35, v53, "%{public}s called with null source, dumping backtrace:%{public}s", buf, 0x16u);
    }
    goto LABEL_90;
  }
  if (!v15)
  {
    __nwlog_obj();
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 136446210;
    *(_QWORD *)&buf[4] = "-[NWConcrete_nw_listener handleInboundPacket:length:from:to:interface:socket:]";
    v34 = (char *)_os_log_send_and_compose_impl();

    type[0] = OS_LOG_TYPE_ERROR;
    v81[0] = 0;
    if (!__nwlog_fault(v34, type, v81))
      goto LABEL_128;
    if (type[0] == OS_LOG_TYPE_FAULT)
    {
      __nwlog_obj();
      v35 = objc_claimAutoreleasedReturnValue();
      v42 = type[0];
      if (os_log_type_enabled(v35, type[0]))
      {
        *(_DWORD *)buf = 136446210;
        *(_QWORD *)&buf[4] = "-[NWConcrete_nw_listener handleInboundPacket:length:from:to:interface:socket:]";
        _os_log_impl(&dword_182FBE000, v35, v42, "%{public}s called with null destination", buf, 0xCu);
      }
      goto LABEL_127;
    }
    if (!v81[0])
    {
      __nwlog_obj();
      v35 = objc_claimAutoreleasedReturnValue();
      v64 = type[0];
      if (os_log_type_enabled(v35, type[0]))
      {
        *(_DWORD *)buf = 136446210;
        *(_QWORD *)&buf[4] = "-[NWConcrete_nw_listener handleInboundPacket:length:from:to:interface:socket:]";
        _os_log_impl(&dword_182FBE000, v35, v64, "%{public}s called with null destination, backtrace limit exceeded", buf, 0xCu);
      }
      goto LABEL_127;
    }
    v50 = (char *)__nw_create_backtrace_string();
    __nwlog_obj();
    v35 = objc_claimAutoreleasedReturnValue();
    v55 = type[0];
    v56 = os_log_type_enabled(v35, type[0]);
    if (!v50)
    {
      if (v56)
      {
        *(_DWORD *)buf = 136446210;
        *(_QWORD *)&buf[4] = "-[NWConcrete_nw_listener handleInboundPacket:length:from:to:interface:socket:]";
        _os_log_impl(&dword_182FBE000, v35, v55, "%{public}s called with null destination, no backtrace", buf, 0xCu);
      }
      goto LABEL_127;
    }
    if (v56)
    {
      *(_DWORD *)buf = 136446466;
      *(_QWORD *)&buf[4] = "-[NWConcrete_nw_listener handleInboundPacket:length:from:to:interface:socket:]";
      *(_WORD *)&buf[12] = 2082;
      *(_QWORD *)&buf[14] = v50;
      _os_log_impl(&dword_182FBE000, v35, v55, "%{public}s called with null destination, dumping backtrace:%{public}s", buf, 0x16u);
    }
    goto LABEL_90;
  }
  if (!v16)
  {
    __nwlog_obj();
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 136446210;
    *(_QWORD *)&buf[4] = "-[NWConcrete_nw_listener handleInboundPacket:length:from:to:interface:socket:]";
    v34 = (char *)_os_log_send_and_compose_impl();

    type[0] = OS_LOG_TYPE_ERROR;
    v81[0] = 0;
    if (!__nwlog_fault(v34, type, v81))
      goto LABEL_128;
    if (type[0] == OS_LOG_TYPE_FAULT)
    {
      __nwlog_obj();
      v35 = objc_claimAutoreleasedReturnValue();
      v44 = type[0];
      if (os_log_type_enabled(v35, type[0]))
      {
        *(_DWORD *)buf = 136446210;
        *(_QWORD *)&buf[4] = "-[NWConcrete_nw_listener handleInboundPacket:length:from:to:interface:socket:]";
        _os_log_impl(&dword_182FBE000, v35, v44, "%{public}s called with null interface", buf, 0xCu);
      }
      goto LABEL_127;
    }
    if (!v81[0])
    {
      __nwlog_obj();
      v35 = objc_claimAutoreleasedReturnValue();
      v65 = type[0];
      if (os_log_type_enabled(v35, type[0]))
      {
        *(_DWORD *)buf = 136446210;
        *(_QWORD *)&buf[4] = "-[NWConcrete_nw_listener handleInboundPacket:length:from:to:interface:socket:]";
        _os_log_impl(&dword_182FBE000, v35, v65, "%{public}s called with null interface, backtrace limit exceeded", buf, 0xCu);
      }
      goto LABEL_127;
    }
    v50 = (char *)__nw_create_backtrace_string();
    __nwlog_obj();
    v35 = objc_claimAutoreleasedReturnValue();
    v57 = type[0];
    v58 = os_log_type_enabled(v35, type[0]);
    if (!v50)
    {
      if (v58)
      {
        *(_DWORD *)buf = 136446210;
        *(_QWORD *)&buf[4] = "-[NWConcrete_nw_listener handleInboundPacket:length:from:to:interface:socket:]";
        _os_log_impl(&dword_182FBE000, v35, v57, "%{public}s called with null interface, no backtrace", buf, 0xCu);
      }
      goto LABEL_127;
    }
    if (v58)
    {
      *(_DWORD *)buf = 136446466;
      *(_QWORD *)&buf[4] = "-[NWConcrete_nw_listener handleInboundPacket:length:from:to:interface:socket:]";
      *(_WORD *)&buf[12] = 2082;
      *(_QWORD *)&buf[14] = v50;
      _os_log_impl(&dword_182FBE000, v35, v57, "%{public}s called with null interface, dumping backtrace:%{public}s", buf, 0x16u);
    }
    goto LABEL_90;
  }
  if (!v17)
  {
    __nwlog_obj();
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 136446210;
    *(_QWORD *)&buf[4] = "-[NWConcrete_nw_listener handleInboundPacket:length:from:to:interface:socket:]";
    v34 = (char *)_os_log_send_and_compose_impl();

    type[0] = OS_LOG_TYPE_ERROR;
    v81[0] = 0;
    if (!__nwlog_fault(v34, type, v81))
      goto LABEL_128;
    if (type[0] == OS_LOG_TYPE_FAULT)
    {
      __nwlog_obj();
      v35 = objc_claimAutoreleasedReturnValue();
      v46 = type[0];
      if (os_log_type_enabled(v35, type[0]))
      {
        *(_DWORD *)buf = 136446210;
        *(_QWORD *)&buf[4] = "-[NWConcrete_nw_listener handleInboundPacket:length:from:to:interface:socket:]";
        _os_log_impl(&dword_182FBE000, v35, v46, "%{public}s called with null socket", buf, 0xCu);
      }
      goto LABEL_127;
    }
    if (!v81[0])
    {
      __nwlog_obj();
      v35 = objc_claimAutoreleasedReturnValue();
      v66 = type[0];
      if (os_log_type_enabled(v35, type[0]))
      {
        *(_DWORD *)buf = 136446210;
        *(_QWORD *)&buf[4] = "-[NWConcrete_nw_listener handleInboundPacket:length:from:to:interface:socket:]";
        _os_log_impl(&dword_182FBE000, v35, v66, "%{public}s called with null socket, backtrace limit exceeded", buf, 0xCu);
      }
      goto LABEL_127;
    }
    v50 = (char *)__nw_create_backtrace_string();
    __nwlog_obj();
    v35 = objc_claimAutoreleasedReturnValue();
    v59 = type[0];
    v60 = os_log_type_enabled(v35, type[0]);
    if (!v50)
    {
      if (v60)
      {
        *(_DWORD *)buf = 136446210;
        *(_QWORD *)&buf[4] = "-[NWConcrete_nw_listener handleInboundPacket:length:from:to:interface:socket:]";
        _os_log_impl(&dword_182FBE000, v35, v59, "%{public}s called with null socket, no backtrace", buf, 0xCu);
      }
      goto LABEL_127;
    }
    if (v60)
    {
      *(_DWORD *)buf = 136446466;
      *(_QWORD *)&buf[4] = "-[NWConcrete_nw_listener handleInboundPacket:length:from:to:interface:socket:]";
      *(_WORD *)&buf[12] = 2082;
      *(_QWORD *)&buf[14] = v50;
      _os_log_impl(&dword_182FBE000, v35, v59, "%{public}s called with null socket, dumping backtrace:%{public}s", buf, 0x16u);
    }
LABEL_90:

    free(v50);
    if (!v34)
      goto LABEL_30;
    goto LABEL_129;
  }
  if (*((_DWORD *)self + 32) == 2 && (*((_BYTE *)self + 302) & 1) == 0)
  {
    *(_QWORD *)buf = 0;
    *(_QWORD *)&buf[8] = buf;
    *(_QWORD *)&buf[16] = 0x3032000000;
    v86 = __Block_byref_object_copy__3;
    v87 = __Block_byref_object_dispose__4;
    v88 = 0;
    *(_QWORD *)type = 0;
    v76 = type;
    v77 = 0x3032000000;
    v78 = __Block_byref_object_copy__17841;
    v79 = __Block_byref_object_dispose__17842;
    v80 = 0;
    v18 = MEMORY[0x1E0C809B0];
    aBlock[0] = MEMORY[0x1E0C809B0];
    aBlock[1] = 3221225472;
    aBlock[2] = __78__NWConcrete_nw_listener_handleInboundPacket_length_from_to_interface_socket___block_invoke;
    aBlock[3] = &unk_1E14A54F0;
    aBlock[4] = self;
    aBlock[5] = buf;
    aBlock[6] = type;
    v19 = (void (**)(_QWORD))_Block_copy(aBlock);
    os_unfair_lock_lock((os_unfair_lock_t)self + 2);
    v19[2](v19);
    os_unfair_lock_unlock((os_unfair_lock_t)self + 2);

    if (*(_QWORD *)(*(_QWORD *)&buf[8] + 40))
    {
      v20 = dispatch_data_create(a3, v11, 0, 0);
      v67[0] = v18;
      v67[1] = 3221225472;
      v67[2] = __78__NWConcrete_nw_listener_handleInboundPacket_length_from_to_interface_socket___block_invoke_41;
      v67[3] = &unk_1E149CC90;
      v73 = buf;
      v68 = v14;
      v69 = v15;
      v70 = v16;
      v71 = v17;
      v21 = v20;
      v72 = v21;
      v22 = (void (**)(_QWORD))_Block_copy(v67);
      v23 = (void *)*((_QWORD *)v76 + 5);
      if (v23)
      {
        v24 = *((_DWORD *)self + 18);
        v25 = v23;
        v26 = dispatch_block_create_with_qos_class((dispatch_block_flags_t)0, v24, 0, v22);
        dispatch_async(v25, v26);

      }
      else if (nw_context_is_inline(*((void **)self + 3)))
      {
        v22[2](v22);
      }

    }
    else
    {
      v31 = *((_QWORD *)self + 2);
      if (!v31 || nw_path_parameters_get_logging_disabled(*(_QWORD *)(v31 + 104)))
        goto LABEL_29;
      if (__nwlog_listener_log::onceToken != -1)
        dispatch_once(&__nwlog_listener_log::onceToken, &__block_literal_global_33_44199);
      v21 = (id)glistenerLogObj;
      if (os_log_type_enabled(v21, OS_LOG_TYPE_DEBUG))
      {
        v32 = self;

        *(_DWORD *)v81 = 136446466;
        v82 = "-[NWConcrete_nw_listener handleInboundPacket:length:from:to:interface:socket:]";
        v83 = 2082;
        v84 = (char *)v32 + 42;
        _os_log_impl(&dword_182FBE000, v21, OS_LOG_TYPE_DEBUG, "%{public}s [%{public}s] ignoring inbound packet: no new packet handler", v81, 0x16u);
      }
    }

LABEL_29:
    _Block_object_dispose(type, 8);

    _Block_object_dispose(buf, 8);
    goto LABEL_30;
  }
  v27 = *((_QWORD *)self + 2);
  if (v27 && !nw_path_parameters_get_logging_disabled(*(_QWORD *)(v27 + 104)))
  {
    if (__nwlog_listener_log::onceToken != -1)
      dispatch_once(&__nwlog_listener_log::onceToken, &__block_literal_global_33_44199);
    v28 = (id)glistenerLogObj;
    if (os_log_type_enabled(v28, OS_LOG_TYPE_DEBUG))
    {
      v29 = self;
      v30 = (char *)v29 + 42;

      *(_DWORD *)buf = 136446466;
      *(_QWORD *)&buf[4] = "-[NWConcrete_nw_listener handleInboundPacket:length:from:to:interface:socket:]";
      *(_WORD *)&buf[12] = 2082;
      *(_QWORD *)&buf[14] = v30;
      _os_log_impl(&dword_182FBE000, v28, OS_LOG_TYPE_DEBUG, "%{public}s [%{public}s] ignoring inbound packet: not ready or no client queue", buf, 0x16u);
    }

  }
LABEL_30:

}

- (void)handleInboxFailed:(id)a3 error:(id)a4
{
  nw_listener_inbox *v6;
  id v7;
  uint64_t v8;
  NSObject *v9;
  NWConcrete_nw_listener *v10;
  char *v11;
  uint64_t v12;
  nw_listener_inbox **v13;
  nw_listener_inbox **v14;
  uint64_t v15;
  uint64_t v16;
  NSObject *v17;
  NWConcrete_nw_listener *v18;
  int v19;
  const char *v20;
  __int16 v21;
  char *v22;
  __int16 v23;
  nw_listener_inbox *v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v6 = (nw_listener_inbox *)a3;
  v7 = a4;
  nw_context_assert_queue(*((void **)self + 3));
  v8 = *((_QWORD *)self + 2);
  if (v8 && !nw_path_parameters_get_logging_disabled(*(_QWORD *)(v8 + 104)))
  {
    if (__nwlog_listener_log::onceToken != -1)
      dispatch_once(&__nwlog_listener_log::onceToken, &__block_literal_global_33_44199);
    v9 = (id)glistenerLogObj;
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      v10 = self;
      v11 = (char *)v10 + 42;

      v19 = 136446722;
      v20 = "-[NWConcrete_nw_listener handleInboxFailed:error:]";
      v21 = 2082;
      v22 = v11;
      v23 = 2114;
      v24 = v6;
      _os_log_impl(&dword_182FBE000, v9, OS_LOG_TYPE_DEFAULT, "%{public}s [%{public}s] inbox failed: %{public}@", (uint8_t *)&v19, 0x20u);
    }

  }
  v12 = *((_QWORD *)self + 18);
  if (!v12 || !v6)
    goto LABEL_18;
  v14 = *(nw_listener_inbox ***)(v12 + 16);
  v13 = *(nw_listener_inbox ***)(v12 + 24);
  if (v14 != v13)
  {
    while (*v14 != v6)
    {
      if (++v14 == v13)
      {
        v14 = *(nw_listener_inbox ***)(v12 + 24);
        break;
      }
    }
  }
  if (v14 != v13)
  {
    nw_array_remove_object(v12, (uint64_t)v6);
    nw_listener_cancel_inbox_on_queue(self, v6);
    v15 = *((_QWORD *)self + 18);
    if (!v15 || *(_QWORD *)(v15 + 24) == *(_QWORD *)(v15 + 16))
      nw_listener_set_state_on_queue(self, 1, v7);
  }
  else
  {
LABEL_18:
    v16 = *((_QWORD *)self + 2);
    if (v16 && !nw_path_parameters_get_logging_disabled(*(_QWORD *)(v16 + 104)))
    {
      if (__nwlog_listener_log::onceToken != -1)
        dispatch_once(&__nwlog_listener_log::onceToken, &__block_literal_global_33_44199);
      v17 = (id)glistenerLogObj;
      if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
      {
        v18 = self;

        v19 = 136446466;
        v20 = "-[NWConcrete_nw_listener handleInboxFailed:error:]";
        v21 = 2082;
        v22 = (char *)v18 + 42;
        _os_log_impl(&dword_182FBE000, v17, OS_LOG_TYPE_DEBUG, "%{public}s [%{public}s] inbox already removed, not cancelling redundantly", (uint8_t *)&v19, 0x16u);
      }

    }
  }

}

- (void)handleInboxCancelComplete:(id)a3
{
  id v4;
  int v5;
  int v6;
  uint64_t v7;
  NSObject *v8;
  NWConcrete_nw_listener *v9;
  char *v10;
  int v11;
  uint64_t v12;
  id v13;
  NWConcrete_nw_listener *v14;
  char *v15;
  NSObject *v16;
  os_log_type_t v17;
  const char *backtrace_string;
  char *v19;
  NSObject *v20;
  os_log_type_t v21;
  os_log_type_t v22;
  os_log_type_t v23;
  char v24;
  os_log_type_t type;
  uint8_t buf[4];
  const char *v27;
  __int16 v28;
  char *v29;
  __int16 v30;
  id v31;
  __int16 v32;
  char *v33;
  uint64_t v34;

  v34 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  nw_context_assert_queue(*((void **)self + 3));
  v5 = *((_DWORD *)self + 74);
  if (v5)
  {
    v6 = v5 - 1;
    *((_DWORD *)self + 74) = v6;
    v7 = *((_QWORD *)self + 2);
    if (v7)
    {
      if (!nw_path_parameters_get_logging_disabled(*(_QWORD *)(v7 + 104)))
      {
        if (__nwlog_listener_log::onceToken != -1)
          dispatch_once(&__nwlog_listener_log::onceToken, &__block_literal_global_33_44199);
        v8 = (id)glistenerLogObj;
        if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
        {
          v9 = self;
          v10 = (char *)v9 + 42;

          v11 = *((_DWORD *)self + 74);
          *(_DWORD *)buf = 136446978;
          v27 = "-[NWConcrete_nw_listener handleInboxCancelComplete:]";
          v28 = 2082;
          v29 = v10;
          v30 = 2114;
          v31 = v4;
          v32 = 1024;
          LODWORD(v33) = v11;
          _os_log_impl(&dword_182FBE000, v8, OS_LOG_TYPE_INFO, "%{public}s [%{public}s] Removing deferral for %{public}@ -> %d", buf, 0x26u);
        }

      }
      v6 = *((_DWORD *)self + 74);
    }
    if (!v6)
    {
      if ((*((_BYTE *)self + 302) & 1) != 0)
      {
        nw_listener_cancel_complete_on_queue(self);
      }
      else if (*((int *)self + 32) <= 2)
      {
        nw_listener_reconcile_inboxes_on_queue(self);
      }
    }
    goto LABEL_36;
  }
  v12 = *((_QWORD *)self + 2);
  if (!v12 || nw_path_parameters_get_logging_disabled(*(_QWORD *)(v12 + 104)))
    goto LABEL_36;
  if (__nwlog_listener_log::onceToken != -1)
    dispatch_once(&__nwlog_listener_log::onceToken, &__block_literal_global_33_44199);
  v13 = (id)glistenerLogObj;
  v14 = self;

  *(_DWORD *)buf = 136446722;
  v27 = "-[NWConcrete_nw_listener handleInboxCancelComplete:]";
  v28 = 2082;
  v29 = (char *)v14 + 42;
  v30 = 2114;
  v31 = v4;
  v15 = (char *)_os_log_send_and_compose_impl();

  type = OS_LOG_TYPE_ERROR;
  v24 = 0;
  if (!__nwlog_fault(v15, &type, &v24))
    goto LABEL_25;
  if (type == OS_LOG_TYPE_FAULT)
  {
    if (__nwlog_listener_log::onceToken != -1)
      dispatch_once(&__nwlog_listener_log::onceToken, &__block_literal_global_33_44199);
    v16 = (id)glistenerLogObj;
    v17 = type;
    if (os_log_type_enabled(v16, type))
    {

      *(_DWORD *)buf = 136446722;
      v27 = "-[NWConcrete_nw_listener handleInboxCancelComplete:]";
      v28 = 2082;
      v29 = (char *)v14 + 42;
      v30 = 2114;
      v31 = v4;
      _os_log_impl(&dword_182FBE000, v16, v17, "%{public}s [%{public}s] Removing deferral for %{public}@ results in invalid defer count", buf, 0x20u);
    }
LABEL_24:

LABEL_25:
    if (!v15)
      goto LABEL_36;
LABEL_26:
    free(v15);
    goto LABEL_36;
  }
  if (!v24)
  {
    if (__nwlog_listener_log::onceToken != -1)
      dispatch_once(&__nwlog_listener_log::onceToken, &__block_literal_global_33_44199);
    v16 = (id)glistenerLogObj;
    v22 = type;
    if (os_log_type_enabled(v16, type))
    {

      *(_DWORD *)buf = 136446722;
      v27 = "-[NWConcrete_nw_listener handleInboxCancelComplete:]";
      v28 = 2082;
      v29 = (char *)v14 + 42;
      v30 = 2114;
      v31 = v4;
      _os_log_impl(&dword_182FBE000, v16, v22, "%{public}s [%{public}s] Removing deferral for %{public}@ results in invalid defer count, backtrace limit exceeded", buf, 0x20u);
    }
    goto LABEL_24;
  }
  backtrace_string = __nw_create_backtrace_string();
  if (!backtrace_string)
  {
    if (__nwlog_listener_log::onceToken != -1)
      dispatch_once(&__nwlog_listener_log::onceToken, &__block_literal_global_33_44199);
    v16 = (id)glistenerLogObj;
    v23 = type;
    if (os_log_type_enabled(v16, type))
    {

      *(_DWORD *)buf = 136446722;
      v27 = "-[NWConcrete_nw_listener handleInboxCancelComplete:]";
      v28 = 2082;
      v29 = (char *)v14 + 42;
      v30 = 2114;
      v31 = v4;
      _os_log_impl(&dword_182FBE000, v16, v23, "%{public}s [%{public}s] Removing deferral for %{public}@ results in invalid defer count, no backtrace", buf, 0x20u);
    }
    goto LABEL_24;
  }
  v19 = (char *)backtrace_string;
  if (__nwlog_listener_log::onceToken != -1)
    dispatch_once(&__nwlog_listener_log::onceToken, &__block_literal_global_33_44199);
  v20 = (id)glistenerLogObj;
  v21 = type;
  if (os_log_type_enabled(v20, type))
  {

    *(_DWORD *)buf = 136446978;
    v27 = "-[NWConcrete_nw_listener handleInboxCancelComplete:]";
    v28 = 2082;
    v29 = (char *)v14 + 42;
    v30 = 2114;
    v31 = v4;
    v32 = 2082;
    v33 = v19;
    _os_log_impl(&dword_182FBE000, v20, v21, "%{public}s [%{public}s] Removing deferral for %{public}@ results in invalid defer count, dumping backtrace:%{public}s", buf, 0x2Au);
  }

  free(v19);
  if (v15)
    goto LABEL_26;
LABEL_36:

}

- (id)getIDSInformation
{
  os_unfair_lock_s *v3;
  void (**v4)(_QWORD);
  id v5;
  _QWORD v7[6];
  uint64_t v8;
  uint64_t *v9;
  uint64_t v10;
  uint64_t (*v11)(uint64_t, uint64_t);
  void (*v12)(uint64_t);
  id v13;

  nw_context_assert_queue(*((void **)self + 3));
  v8 = 0;
  v9 = &v8;
  v10 = 0x3032000000;
  v11 = __Block_byref_object_copy__17841;
  v12 = __Block_byref_object_dispose__17842;
  v13 = 0;
  v3 = (os_unfair_lock_s *)((char *)self + 8);
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __43__NWConcrete_nw_listener_getIDSInformation__block_invoke;
  v7[3] = &unk_1E14ACE40;
  v7[4] = self;
  v7[5] = &v8;
  v4 = (void (**)(_QWORD))_Block_copy(v7);
  os_unfair_lock_lock(v3);
  v4[2](v4);
  os_unfair_lock_unlock(v3);

  v5 = (id)v9[5];
  _Block_object_dispose(&v8, 8);

  return v5;
}

- (void)dealloc
{
  id v3;
  char *v4;
  NSObject *v5;
  os_log_type_t v6;
  id v7;
  char *v8;
  NSObject *v9;
  os_log_type_t v10;
  void *v11;
  void *v12;
  char *backtrace_string;
  os_log_type_t v14;
  _BOOL4 v15;
  char *v16;
  os_log_type_t v17;
  _BOOL4 v18;
  os_log_type_t v19;
  os_log_type_t v20;
  uint8_t *v21;
  int v22;
  objc_super v23;
  char v24;
  os_log_type_t type;
  uint8_t buf[4];
  const char *v27;
  __int16 v28;
  char *v29;
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  if (*((_QWORD *)self + 32))
  {
    pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
    networkd_settings_init();
    v3 = (id)gLogObj;
    *(_DWORD *)buf = 136446210;
    v27 = "-[NWConcrete_nw_listener dealloc]";
    v22 = 12;
    v21 = buf;
    v4 = (char *)_os_log_send_and_compose_impl();

    type = OS_LOG_TYPE_ERROR;
    v24 = 0;
    if (!__nwlog_fault(v4, &type, &v24))
      goto LABEL_7;
    if (type == OS_LOG_TYPE_FAULT)
    {
      pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
      networkd_settings_init();
      v5 = (id)gLogObj;
      v6 = type;
      if (os_log_type_enabled(v5, type))
      {
        *(_DWORD *)buf = 136446210;
        v27 = "-[NWConcrete_nw_listener dealloc]";
        _os_log_impl(&dword_182FBE000, v5, v6, "%{public}s over-release of nw_listener_t! Object should not be internally retained and deallocating", buf, 0xCu);
      }
LABEL_6:

LABEL_7:
      if (!v4)
        goto LABEL_9;
      goto LABEL_8;
    }
    if (!v24)
    {
      pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
      networkd_settings_init();
      v5 = (id)gLogObj;
      v19 = type;
      if (os_log_type_enabled(v5, type))
      {
        *(_DWORD *)buf = 136446210;
        v27 = "-[NWConcrete_nw_listener dealloc]";
        _os_log_impl(&dword_182FBE000, v5, v19, "%{public}s over-release of nw_listener_t! Object should not be internally retained and deallocating, backtrace limit exceeded", buf, 0xCu);
      }
      goto LABEL_6;
    }
    backtrace_string = (char *)__nw_create_backtrace_string();
    pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
    networkd_settings_init();
    v5 = (id)gLogObj;
    v14 = type;
    v15 = os_log_type_enabled(v5, type);
    if (!backtrace_string)
    {
      if (v15)
      {
        *(_DWORD *)buf = 136446210;
        v27 = "-[NWConcrete_nw_listener dealloc]";
        _os_log_impl(&dword_182FBE000, v5, v14, "%{public}s over-release of nw_listener_t! Object should not be internally retained and deallocating, no backtrace", buf, 0xCu);
      }
      goto LABEL_6;
    }
    if (v15)
    {
      *(_DWORD *)buf = 136446466;
      v27 = "-[NWConcrete_nw_listener dealloc]";
      v28 = 2082;
      v29 = backtrace_string;
      _os_log_impl(&dword_182FBE000, v5, v14, "%{public}s over-release of nw_listener_t! Object should not be internally retained and deallocating, dumping backtrace:%{public}s", buf, 0x16u);
    }

    free(backtrace_string);
    if (v4)
LABEL_8:
      free(v4);
  }
LABEL_9:
  if (!*((_QWORD *)self + 34))
    goto LABEL_17;
  pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
  networkd_settings_init();
  v7 = (id)gLogObj;
  *(_DWORD *)buf = 136446210;
  v27 = "-[NWConcrete_nw_listener dealloc]";
  v22 = 12;
  v21 = buf;
  v8 = (char *)_os_log_send_and_compose_impl();

  type = OS_LOG_TYPE_ERROR;
  v24 = 0;
  if (!__nwlog_fault(v8, &type, &v24))
  {
LABEL_15:
    if (!v8)
      goto LABEL_17;
    goto LABEL_16;
  }
  if (type == OS_LOG_TYPE_FAULT)
  {
    pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
    networkd_settings_init();
    v9 = (id)gLogObj;
    v10 = type;
    if (os_log_type_enabled(v9, type))
    {
      *(_DWORD *)buf = 136446210;
      v27 = "-[NWConcrete_nw_listener dealloc]";
      _os_log_impl(&dword_182FBE000, v9, v10, "%{public}s listener advertisers were not cleaned up prior to dealloc", buf, 0xCu);
    }
LABEL_14:

    goto LABEL_15;
  }
  if (!v24)
  {
    pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
    networkd_settings_init();
    v9 = (id)gLogObj;
    v20 = type;
    if (os_log_type_enabled(v9, type))
    {
      *(_DWORD *)buf = 136446210;
      v27 = "-[NWConcrete_nw_listener dealloc]";
      _os_log_impl(&dword_182FBE000, v9, v20, "%{public}s listener advertisers were not cleaned up prior to dealloc, backtrace limit exceeded", buf, 0xCu);
    }
    goto LABEL_14;
  }
  v16 = (char *)__nw_create_backtrace_string();
  pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
  networkd_settings_init();
  v9 = (id)gLogObj;
  v17 = type;
  v18 = os_log_type_enabled(v9, type);
  if (!v16)
  {
    if (v18)
    {
      *(_DWORD *)buf = 136446210;
      v27 = "-[NWConcrete_nw_listener dealloc]";
      _os_log_impl(&dword_182FBE000, v9, v17, "%{public}s listener advertisers were not cleaned up prior to dealloc, no backtrace", buf, 0xCu);
    }
    goto LABEL_14;
  }
  if (v18)
  {
    *(_DWORD *)buf = 136446466;
    v27 = "-[NWConcrete_nw_listener dealloc]";
    v28 = 2082;
    v29 = v16;
    _os_log_impl(&dword_182FBE000, v9, v17, "%{public}s listener advertisers were not cleaned up prior to dealloc, dumping backtrace:%{public}s", buf, 0x16u);
  }

  free(v16);
  if (v8)
LABEL_16:
    free(v8);
LABEL_17:
  v11 = (void *)*((_QWORD *)self + 29);
  if (v11)
  {
    free(v11);
    *((_QWORD *)self + 29) = 0;
  }
  v12 = (void *)*((_QWORD *)self + 7);
  if (v12)
  {
    free(v12);
    *((_QWORD *)self + 7) = 0;
  }
  v23.receiver = self;
  v23.super_class = (Class)NWConcrete_nw_listener;
  -[NWConcrete_nw_listener dealloc](&v23, sel_dealloc, v21, v22);
}

- (NSString)description
{
  NWConcrete_nw_listener *v2;
  os_unfair_lock_s *v3;
  void (**v4)(_QWORD);
  const char *v5;
  __CFString *v6;
  _QWORD v8[4];
  NWConcrete_nw_listener *v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  uint64_t v14;

  v2 = self;
  v3 = (os_unfair_lock_s *)v2;
  v11 = 0;
  v12 = &v11;
  v13 = 0x2020000000;
  v14 = 0;
  if (v2)
  {
    v8[0] = MEMORY[0x1E0C809B0];
    v8[1] = 3221225472;
    v8[2] = __nw_listener_copy_description_block_invoke;
    v8[3] = &unk_1E14ACE40;
    v9 = v2;
    v10 = &v11;
    v4 = (void (**)(_QWORD))_Block_copy(v8);
    os_unfair_lock_lock(v3 + 2);
    v4[2](v4);
    os_unfair_lock_unlock(v3 + 2);

    v5 = (const char *)v12[3];
  }
  else
  {
    v5 = 0;
  }
  _Block_object_dispose(&v11, 8);

  if (v5)
    v6 = (__CFString *)CFStringCreateWithCStringNoCopy((CFAllocatorRef)*MEMORY[0x1E0C9AE00], v5, 0x8000100u, (CFAllocatorRef)*MEMORY[0x1E0C9AE10]);
  else
    v6 = 0;
  return (NSString *)v6;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)self + 36, 0);
  objc_storeStrong((id *)self + 35, 0);
  objc_storeStrong((id *)self + 34, 0);
  objc_storeStrong((id *)self + 33, 0);
  objc_storeStrong((id *)self + 32, 0);
  objc_storeStrong((id *)self + 28, 0);
  objc_storeStrong((id *)self + 27, 0);
  objc_storeStrong((id *)self + 26, 0);
  objc_storeStrong((id *)self + 25, 0);
  objc_storeStrong((id *)self + 24, 0);
  objc_storeStrong((id *)self + 23, 0);
  objc_storeStrong((id *)self + 22, 0);
  objc_storeStrong((id *)self + 21, 0);
  objc_storeStrong((id *)self + 20, 0);
  objc_storeStrong((id *)self + 19, 0);
  objc_storeStrong((id *)self + 18, 0);
  objc_storeStrong((id *)self + 17, 0);
  objc_storeStrong((id *)self + 15, 0);
  objc_storeStrong((id *)self + 14, 0);
  objc_storeStrong((id *)self + 12, 0);
  objc_storeStrong((id *)self + 11, 0);
  objc_storeStrong((id *)self + 10, 0);
  objc_storeStrong((id *)self + 8, 0);
  objc_storeStrong((id *)self + 6, 0);
  objc_storeStrong((id *)self + 4, 0);
  objc_storeStrong((id *)self + 3, 0);
  objc_storeStrong((id *)self + 2, 0);
}

- (id).cxx_construct
{
  *((_DWORD *)self + 2) = 0;
  return self;
}

@end
