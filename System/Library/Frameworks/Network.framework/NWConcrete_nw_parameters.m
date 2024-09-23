@implementation NWConcrete_nw_parameters

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->metadata, 0);
  objc_storeStrong((id *)&self->main_document_url_endpoint, 0);
  objc_storeStrong((id *)&self->url_endpoint, 0);
  objc_storeStrong((id *)&self->raced_proxy_config, 0);
  objc_storeStrong((id *)&self->effective_proxy_config, 0);
  objc_storeStrong((id *)&self->custom_proxy_configs, 0);
  objc_storeStrong((id *)&self->proxy_options, 0);
  objc_storeStrong((id *)&self->transforms, 0);
  objc_storeStrong((id *)&self->default_stack, 0);
  objc_storeStrong((id *)&self->initial_data_payload, 0);
  objc_storeStrong((id *)&self->extra_parent_ids, 0);
  objc_storeStrong((id *)&self->tls_session_id, 0);
  objc_storeStrong((id *)&self->path_parameters, 0);
}

- (id)initWithStack:(id *)a1
{
  id v4;
  NWConcrete_nw_path_parameters *v5;
  id v6;
  _DWORD *v7;
  __int128 v8;
  NSObject *v9;
  int v10;
  const char *v11;
  int int64;
  void *v14;
  char *v15;
  NSObject *v16;
  os_log_type_t v17;
  void *v18;
  char *v19;
  NSObject *v20;
  os_log_type_t v21;
  char *backtrace_string;
  os_log_type_t v23;
  _BOOL4 v24;
  char *v25;
  os_log_type_t v26;
  _BOOL4 v27;
  os_log_type_t v28;
  os_log_type_t v29;
  char v30;
  objc_super v31;
  uint8_t buf[4];
  const char *v33;
  __int16 v34;
  int v35;
  _OWORD buffer[3];
  uint64_t v37;
  uint64_t v38;

  v38 = *MEMORY[0x1E0C80C00];
  v4 = a2;
  if (!a1)
    goto LABEL_18;
  v31.receiver = a1;
  v31.super_class = (Class)NWConcrete_nw_parameters;
  a1 = (id *)objc_msgSendSuper2(&v31, sel_init);
  if (!a1)
  {
    __nwlog_obj();
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(buffer[0]) = 136446210;
    *(_QWORD *)((char *)buffer + 4) = "-[NWConcrete_nw_parameters initWithStack:]";
    v15 = (char *)_os_log_send_and_compose_impl();

    buf[0] = 16;
    v30 = 0;
    if (__nwlog_fault(v15, buf, &v30))
    {
      if (buf[0] == 17)
      {
        __nwlog_obj();
        v16 = objc_claimAutoreleasedReturnValue();
        v17 = buf[0];
        if (os_log_type_enabled(v16, (os_log_type_t)buf[0]))
        {
          LODWORD(buffer[0]) = 136446210;
          *(_QWORD *)((char *)buffer + 4) = "-[NWConcrete_nw_parameters initWithStack:]";
          _os_log_impl(&dword_182FBE000, v16, v17, "%{public}s [super init] failed", (uint8_t *)buffer, 0xCu);
        }
      }
      else if (v30)
      {
        backtrace_string = (char *)__nw_create_backtrace_string();
        __nwlog_obj();
        v16 = objc_claimAutoreleasedReturnValue();
        v23 = buf[0];
        v24 = os_log_type_enabled(v16, (os_log_type_t)buf[0]);
        if (backtrace_string)
        {
          if (v24)
          {
            LODWORD(buffer[0]) = 136446466;
            *(_QWORD *)((char *)buffer + 4) = "-[NWConcrete_nw_parameters initWithStack:]";
            WORD6(buffer[0]) = 2082;
            *(_QWORD *)((char *)buffer + 14) = backtrace_string;
            _os_log_impl(&dword_182FBE000, v16, v23, "%{public}s [super init] failed, dumping backtrace:%{public}s", (uint8_t *)buffer, 0x16u);
          }

          free(backtrace_string);
          goto LABEL_48;
        }
        if (v24)
        {
          LODWORD(buffer[0]) = 136446210;
          *(_QWORD *)((char *)buffer + 4) = "-[NWConcrete_nw_parameters initWithStack:]";
          _os_log_impl(&dword_182FBE000, v16, v23, "%{public}s [super init] failed, no backtrace", (uint8_t *)buffer, 0xCu);
        }
      }
      else
      {
        __nwlog_obj();
        v16 = objc_claimAutoreleasedReturnValue();
        v28 = buf[0];
        if (os_log_type_enabled(v16, (os_log_type_t)buf[0]))
        {
          LODWORD(buffer[0]) = 136446210;
          *(_QWORD *)((char *)buffer + 4) = "-[NWConcrete_nw_parameters initWithStack:]";
          _os_log_impl(&dword_182FBE000, v16, v28, "%{public}s [super init] failed, backtrace limit exceeded", (uint8_t *)buffer, 0xCu);
        }
      }

    }
LABEL_48:
    if (v15)
      free(v15);
    goto LABEL_56;
  }
  v5 = objc_alloc_init(NWConcrete_nw_path_parameters);
  v6 = a1[13];
  a1[13] = v5;

  if (!a1[13])
  {
    __nwlog_obj();
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(buffer[0]) = 136446210;
    *(_QWORD *)((char *)buffer + 4) = "-[NWConcrete_nw_parameters initWithStack:]";
    v19 = (char *)_os_log_send_and_compose_impl();

    buf[0] = 16;
    v30 = 0;
    if (__nwlog_fault(v19, buf, &v30))
    {
      if (buf[0] == 17)
      {
        __nwlog_obj();
        v20 = objc_claimAutoreleasedReturnValue();
        v21 = buf[0];
        if (os_log_type_enabled(v20, (os_log_type_t)buf[0]))
        {
          LODWORD(buffer[0]) = 136446210;
          *(_QWORD *)((char *)buffer + 4) = "-[NWConcrete_nw_parameters initWithStack:]";
          _os_log_impl(&dword_182FBE000, v20, v21, "%{public}s called with null self->path_parameters", (uint8_t *)buffer, 0xCu);
        }
      }
      else if (v30)
      {
        v25 = (char *)__nw_create_backtrace_string();
        __nwlog_obj();
        v20 = objc_claimAutoreleasedReturnValue();
        v26 = buf[0];
        v27 = os_log_type_enabled(v20, (os_log_type_t)buf[0]);
        if (v25)
        {
          if (v27)
          {
            LODWORD(buffer[0]) = 136446466;
            *(_QWORD *)((char *)buffer + 4) = "-[NWConcrete_nw_parameters initWithStack:]";
            WORD6(buffer[0]) = 2082;
            *(_QWORD *)((char *)buffer + 14) = v25;
            _os_log_impl(&dword_182FBE000, v20, v26, "%{public}s called with null self->path_parameters, dumping backtrace:%{public}s", (uint8_t *)buffer, 0x16u);
          }

          free(v25);
          goto LABEL_53;
        }
        if (v27)
        {
          LODWORD(buffer[0]) = 136446210;
          *(_QWORD *)((char *)buffer + 4) = "-[NWConcrete_nw_parameters initWithStack:]";
          _os_log_impl(&dword_182FBE000, v20, v26, "%{public}s called with null self->path_parameters, no backtrace", (uint8_t *)buffer, 0xCu);
        }
      }
      else
      {
        __nwlog_obj();
        v20 = objc_claimAutoreleasedReturnValue();
        v29 = buf[0];
        if (os_log_type_enabled(v20, (os_log_type_t)buf[0]))
        {
          LODWORD(buffer[0]) = 136446210;
          *(_QWORD *)((char *)buffer + 4) = "-[NWConcrete_nw_parameters initWithStack:]";
          _os_log_impl(&dword_182FBE000, v20, v29, "%{public}s called with null self->path_parameters, backtrace limit exceeded", (uint8_t *)buffer, 0xCu);
        }
      }

    }
LABEL_53:
    if (v19)
      free(v19);

LABEL_56:
    a1 = 0;
    goto LABEL_18;
  }
  *((_DWORD *)a1[13] + 16) = getpid();
  *((_DWORD *)a1[13] + 17) = getuid();
  v7 = a1[13];
  a1[12] = (id)((unint64_t)a1[12] | 0x8000040);
  v37 = 0;
  memset(buffer, 0, sizeof(buffer));
  if (proc_pidinfo(v7[16], 17, 1uLL, buffer, 56) == 56)
  {
    v8 = buffer[0];
    *(_OWORD *)((char *)a1[13] + 24) = buffer[0];
    *(_OWORD *)((char *)a1[13] + 8) = v8;
  }
  else
  {
    pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
    networkd_settings_init();
    v9 = (id)gLogObj;
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      v10 = *((_DWORD *)a1[13] + 16);
      *(_DWORD *)buf = 136446466;
      v33 = "-[NWConcrete_nw_parameters initWithStack:]";
      v34 = 1024;
      v35 = v10;
      _os_log_impl(&dword_182FBE000, v9, OS_LOG_TYPE_ERROR, "%{public}s Failed to convert from local PID (%d) to UUID", buf, 0x12u);
    }

  }
  v11 = (const char *)nw_setting_multipath_service_type;
  networkd_settings_init();
  if (sCachedSettings)
  {
    pthread_mutex_lock(&sSettingsMutex);
    if (sCachedSettings)
      int64 = xpc_dictionary_get_int64((xpc_object_t)sCachedSettings, v11);
    else
      int64 = 0;
    pthread_mutex_unlock(&sSettingsMutex);
  }
  else
  {
    int64 = 0;
  }
  *(_DWORD *)((char *)a1[13] + 103) = int64;
  objc_storeStrong(a1 + 19, a2);
  if (nw_context_copy_implicit_context::onceToken[0] != -1)
    dispatch_once(nw_context_copy_implicit_context::onceToken, &__block_literal_global_14);
  objc_storeStrong((id *)a1[13] + 17, (id)nw_context_copy_implicit_context::implicit_context);
LABEL_18:

  return a1;
}

- (BOOL)initWithParameters:(char)a3 stripConnected:(int)a4 shallowCopy:
{
  char *v7;
  char *v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  void *v13;
  id v14;
  id v15;
  char *v16;
  NWConcrete_nw_path_parameters *v17;
  NWConcrete_nw_path_parameters *v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  uint64_t v23;
  const char *v24;
  char *v25;
  const char *v26;
  char *v27;
  const char *v28;
  char *v29;
  void *v30;
  NWConcrete_nw_protocol_options *v31;
  OS_nw_context *context;
  void *v33;
  NWConcrete_nw_protocol_options *v34;
  OS_nw_protocol_options *transport_options;
  id *v36;
  void *v37;
  NWConcrete_nw_protocol_options *v38;
  OS_nw_interface *required_interface;
  void *v40;
  NWConcrete_nw_path_parameters *v41;
  const char *v42;
  char *v43;
  const char *v44;
  char *v45;
  _BOOL8 v46;
  id v47;
  unsigned __int8 *v48;
  void *v49;
  id v50;
  NWConcrete_nw_protocol_stack *v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  OS_nw_array *persistent_application_protocols;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  OS_nw_array *application_protocols;
  NWConcrete_nw_protocol_stack *v60;
  unsigned __int8 **v61;
  void ***v62;
  NWConcrete_nw_protocol_stack *v63;
  id v64;
  _BOOL8 v65;
  id v66;
  unsigned __int8 *v67;
  id *v68;
  id v69;
  void *v70;
  NSObject *v71;
  os_log_type_t v72;
  void *v73;
  const char *v74;
  char *v75;
  NSObject *v76;
  os_log_type_t v77;
  os_log_type_t v78;
  os_log_type_t v79;
  id v80;
  void ***v81;
  void ***v82;
  id v83;
  void *v84;
  id v85;
  void *v86;
  id v87;
  void *v88;
  id v89;
  id v90;
  void *v91;
  xpc_object_t v92;
  id v93;
  _BOOL8 result;
  void *v95;
  char *v96;
  NSObject *v97;
  os_log_type_t v98;
  void *v99;
  char *v100;
  NSObject *v101;
  os_log_type_t v102;
  void *v103;
  char *v104;
  NSObject *v105;
  os_log_type_t v106;
  NSObject *v107;
  void *v108;
  NSObject *v109;
  void *v110;
  char *backtrace_string;
  os_log_type_t v112;
  _BOOL4 v113;
  void *v114;
  char *v115;
  NSObject *v116;
  os_log_type_t v117;
  char *v118;
  os_log_type_t v119;
  _BOOL4 v120;
  void *v121;
  char *v122;
  NSObject *v123;
  os_log_type_t v124;
  char *v125;
  os_log_type_t v126;
  _BOOL4 v127;
  NSObject *v128;
  void *v129;
  NSObject *v130;
  void *v131;
  NSObject *v132;
  void *v133;
  NSObject *v134;
  void *v135;
  char *v136;
  os_log_type_t v137;
  _BOOL4 v138;
  char *v139;
  os_log_type_t v140;
  _BOOL4 v141;
  os_log_type_t v142;
  os_log_type_t v143;
  os_log_type_t v144;
  os_log_type_t v145;
  os_log_type_t v146;
  _QWORD v147[4];
  id *v148;
  _QWORD v149[4];
  id *v150;
  objc_super v151;
  char v152;
  os_log_type_t v153;
  uint8_t buf[4];
  const char *v155;
  __int16 v156;
  uint64_t v157;
  __int16 v158;
  uint64_t v159;
  uint64_t v160;

  v160 = *MEMORY[0x1E0C80C00];
  v7 = a2;
  if (!a1)
    goto LABEL_103;
  v151.receiver = a1;
  v151.super_class = (Class)NWConcrete_nw_parameters;
  v8 = (char *)objc_msgSendSuper2(&v151, sel_init);
  a1 = (id *)v8;
  if (!v8)
  {
    __nwlog_obj();
    v95 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 136446210;
    v155 = "-[NWConcrete_nw_parameters initWithParameters:stripConnected:shallowCopy:]";
    v96 = (char *)_os_log_send_and_compose_impl();

    v153 = OS_LOG_TYPE_ERROR;
    v152 = 0;
    if (__nwlog_fault(v96, &v153, &v152))
    {
      if (v153 == OS_LOG_TYPE_FAULT)
      {
        __nwlog_obj();
        v97 = objc_claimAutoreleasedReturnValue();
        v98 = v153;
        if (os_log_type_enabled(v97, v153))
        {
          *(_DWORD *)buf = 136446210;
          v155 = "-[NWConcrete_nw_parameters initWithParameters:stripConnected:shallowCopy:]";
          _os_log_impl(&dword_182FBE000, v97, v98, "%{public}s [super init] failed", buf, 0xCu);
        }
      }
      else if (v152)
      {
        backtrace_string = (char *)__nw_create_backtrace_string();
        __nwlog_obj();
        v97 = objc_claimAutoreleasedReturnValue();
        v112 = v153;
        v113 = os_log_type_enabled(v97, v153);
        if (backtrace_string)
        {
          if (v113)
          {
            *(_DWORD *)buf = 136446466;
            v155 = "-[NWConcrete_nw_parameters initWithParameters:stripConnected:shallowCopy:]";
            v156 = 2082;
            v157 = (uint64_t)backtrace_string;
            _os_log_impl(&dword_182FBE000, v97, v112, "%{public}s [super init] failed, dumping backtrace:%{public}s", buf, 0x16u);
          }

          free(backtrace_string);
          goto LABEL_178;
        }
        if (v113)
        {
          *(_DWORD *)buf = 136446210;
          v155 = "-[NWConcrete_nw_parameters initWithParameters:stripConnected:shallowCopy:]";
          _os_log_impl(&dword_182FBE000, v97, v112, "%{public}s [super init] failed, no backtrace", buf, 0xCu);
        }
      }
      else
      {
        __nwlog_obj();
        v97 = objc_claimAutoreleasedReturnValue();
        v142 = v153;
        if (os_log_type_enabled(v97, v153))
        {
          *(_DWORD *)buf = 136446210;
          v155 = "-[NWConcrete_nw_parameters initWithParameters:stripConnected:shallowCopy:]";
          _os_log_impl(&dword_182FBE000, v97, v142, "%{public}s [super init] failed, backtrace limit exceeded", buf, 0xCu);
        }
      }

    }
LABEL_178:
    if (v96)
      free(v96);
    goto LABEL_192;
  }
  if (!v7)
  {
    __nwlog_obj();
    v99 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 136446210;
    v155 = "-[NWConcrete_nw_parameters initWithParameters:stripConnected:shallowCopy:]";
    v100 = (char *)_os_log_send_and_compose_impl();

    v153 = OS_LOG_TYPE_ERROR;
    v152 = 0;
    if (__nwlog_fault(v100, &v153, &v152))
    {
      if (v153 == OS_LOG_TYPE_FAULT)
      {
        __nwlog_obj();
        v101 = objc_claimAutoreleasedReturnValue();
        v102 = v153;
        if (os_log_type_enabled(v101, v153))
        {
          *(_DWORD *)buf = 136446210;
          v155 = "-[NWConcrete_nw_parameters initWithParameters:stripConnected:shallowCopy:]";
          _os_log_impl(&dword_182FBE000, v101, v102, "%{public}s called with null parameters", buf, 0xCu);
        }
      }
      else if (v152)
      {
        v118 = (char *)__nw_create_backtrace_string();
        __nwlog_obj();
        v101 = objc_claimAutoreleasedReturnValue();
        v119 = v153;
        v120 = os_log_type_enabled(v101, v153);
        if (v118)
        {
          if (v120)
          {
            *(_DWORD *)buf = 136446466;
            v155 = "-[NWConcrete_nw_parameters initWithParameters:stripConnected:shallowCopy:]";
            v156 = 2082;
            v157 = (uint64_t)v118;
            _os_log_impl(&dword_182FBE000, v101, v119, "%{public}s called with null parameters, dumping backtrace:%{public}s", buf, 0x16u);
          }

          free(v118);
          goto LABEL_183;
        }
        if (v120)
        {
          *(_DWORD *)buf = 136446210;
          v155 = "-[NWConcrete_nw_parameters initWithParameters:stripConnected:shallowCopy:]";
          _os_log_impl(&dword_182FBE000, v101, v119, "%{public}s called with null parameters, no backtrace", buf, 0xCu);
        }
      }
      else
      {
        __nwlog_obj();
        v101 = objc_claimAutoreleasedReturnValue();
        v143 = v153;
        if (os_log_type_enabled(v101, v153))
        {
          *(_DWORD *)buf = 136446210;
          v155 = "-[NWConcrete_nw_parameters initWithParameters:stripConnected:shallowCopy:]";
          _os_log_impl(&dword_182FBE000, v101, v143, "%{public}s called with null parameters, backtrace limit exceeded", buf, 0xCu);
        }
      }

    }
LABEL_183:
    if (v100)
      free(v100);
    goto LABEL_191;
  }
  v9 = *(_OWORD *)(v7 + 8);
  *(_OWORD *)(v8 + 24) = *(_OWORD *)(v7 + 24);
  *(_OWORD *)(v8 + 8) = v9;
  v10 = *(_OWORD *)(v7 + 40);
  v11 = *(_OWORD *)(v7 + 56);
  v12 = *(_OWORD *)(v7 + 72);
  *(_OWORD *)(v8 + 88) = *(_OWORD *)(v7 + 88);
  *(_OWORD *)(v8 + 72) = v12;
  *(_OWORD *)(v8 + 56) = v11;
  *(_OWORD *)(v8 + 40) = v10;
  v13 = (void *)*((_QWORD *)v7 + 13);
  if (a4)
  {
    v14 = v13;
    v15 = a1[13];
    a1[13] = v14;
    goto LABEL_30;
  }
  v16 = v13;
  if (!v16)
  {
    __nwlog_obj();
    v114 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 136446210;
    v155 = "nw_path_parameters_copy";
    v115 = (char *)_os_log_send_and_compose_impl();

    v153 = OS_LOG_TYPE_ERROR;
    v152 = 0;
    if (__nwlog_fault(v115, &v153, &v152))
    {
      if (v153 == OS_LOG_TYPE_FAULT)
      {
        __nwlog_obj();
        v116 = objc_claimAutoreleasedReturnValue();
        v117 = v153;
        if (os_log_type_enabled(v116, v153))
        {
          *(_DWORD *)buf = 136446210;
          v155 = "nw_path_parameters_copy";
          _os_log_impl(&dword_182FBE000, v116, v117, "%{public}s called with null original", buf, 0xCu);
        }
      }
      else if (v152)
      {
        v136 = (char *)__nw_create_backtrace_string();
        __nwlog_obj();
        v116 = objc_claimAutoreleasedReturnValue();
        v137 = v153;
        v138 = os_log_type_enabled(v116, v153);
        if (v136)
        {
          if (v138)
          {
            *(_DWORD *)buf = 136446466;
            v155 = "nw_path_parameters_copy";
            v156 = 2082;
            v157 = (uint64_t)v136;
            _os_log_impl(&dword_182FBE000, v116, v137, "%{public}s called with null original, dumping backtrace:%{public}s", buf, 0x16u);
          }

          free(v136);
          goto LABEL_202;
        }
        if (v138)
        {
          *(_DWORD *)buf = 136446210;
          v155 = "nw_path_parameters_copy";
          _os_log_impl(&dword_182FBE000, v116, v137, "%{public}s called with null original, no backtrace", buf, 0xCu);
        }
      }
      else
      {
        __nwlog_obj();
        v116 = objc_claimAutoreleasedReturnValue();
        v145 = v153;
        if (os_log_type_enabled(v116, v153))
        {
          *(_DWORD *)buf = 136446210;
          v155 = "nw_path_parameters_copy";
          _os_log_impl(&dword_182FBE000, v116, v145, "%{public}s called with null original, backtrace limit exceeded", buf, 0xCu);
        }
      }

    }
LABEL_202:
    if (v115)
      free(v115);
    v18 = 0;
    goto LABEL_29;
  }
  v17 = objc_alloc_init(NWConcrete_nw_path_parameters);
  v18 = v17;
  if (v17)
  {
    v19 = *(_OWORD *)(v16 + 8);
    v20 = *(_OWORD *)(v16 + 24);
    v21 = *(_OWORD *)(v16 + 40);
    *(_OWORD *)&v17->process_path_value.delegated_upid = *(_OWORD *)(v16 + 56);
    *(_OWORD *)v17->process_path_value.persona_id = v21;
    *(_OWORD *)v17->process_path_value.e_proc_uuid = v20;
    *(_OWORD *)v17->process_path_value.proc_uuid = v19;
    v22 = *(_OWORD *)(v16 + 72);
    *(_OWORD *)((char *)&v17->path_value.companion_preference + 2) = *(_OWORD *)(v16 + 86);
    *(_OWORD *)&v17->path_value.traffic_class = v22;
    v23 = *(_QWORD *)(v16 + 102);
    BYTE2(v17->joinable_path_value.multipath_service) = v16[110];
    *(_QWORD *)((char *)&v17->path_value + 30) = v23;
    v24 = (const char *)*((_QWORD *)v16 + 14);
    if (v24)
    {
      v25 = strdup(v24);
      if (!v25)
      {
        __nwlog_obj();
        v128 = objc_claimAutoreleasedReturnValue();
        os_log_type_enabled(v128, OS_LOG_TYPE_ERROR);
        *(_DWORD *)buf = 136446210;
        v155 = "strict_strdup";
        v129 = (void *)_os_log_send_and_compose_impl();

        result = __nwlog_abort((uint64_t)v129);
        if (result)
          goto LABEL_210;
        free(v129);
      }
      *(_QWORD *)&v18->joinable_path_value.fallback_mode = v25;
    }
    v26 = (const char *)*((_QWORD *)v16 + 15);
    if (v26)
    {
      v27 = strdup(v26);
      if (!v27)
      {
        __nwlog_obj();
        v130 = objc_claimAutoreleasedReturnValue();
        os_log_type_enabled(v130, OS_LOG_TYPE_ERROR);
        *(_DWORD *)buf = 136446210;
        v155 = "strict_strdup";
        v131 = (void *)_os_log_send_and_compose_impl();

        result = __nwlog_abort((uint64_t)v131);
        if (result)
          goto LABEL_210;
        free(v131);
      }
      v18->account_id = v27;
    }
    v28 = (const char *)*((_QWORD *)v16 + 16);
    if (v28)
    {
      v29 = strdup(v28);
      if (!v29)
      {
        __nwlog_obj();
        v132 = objc_claimAutoreleasedReturnValue();
        os_log_type_enabled(v132, OS_LOG_TYPE_ERROR);
        *(_DWORD *)buf = 136446210;
        v155 = "strict_strdup";
        v133 = (void *)_os_log_send_and_compose_impl();

        result = __nwlog_abort((uint64_t)v133);
        if (result)
          goto LABEL_210;
        free(v133);
      }
      v18->attribution_context = v29;
    }
    objc_storeStrong((id *)&v18->attributed_bundle, *((id *)v16 + 17));
    v30 = (void *)*((_QWORD *)v16 + 18);
    if (v30)
    {
      v31 = nw_protocol_options_copy(v30);
      context = v18->context;
      v18->context = (OS_nw_context *)v31;

    }
    v33 = (void *)*((_QWORD *)v16 + 19);
    if (v33)
    {
      v34 = nw_protocol_options_copy(v33);
      transport_options = v18->transport_options;
      v18->transport_options = (OS_nw_protocol_options *)v34;

    }
    objc_storeStrong((id *)&v18->internet_options, *((id *)v16 + 20));
    objc_storeStrong((id *)&v18->local_address, *((id *)v16 + 21));
    if (*((_QWORD *)v16 + 22))
    {
      v36 = (id *)malloc_type_calloc(1uLL, 0x90uLL, 0xEAFB8F1AuLL);
      if (!v36)
      {
        __nwlog_obj();
        v134 = objc_claimAutoreleasedReturnValue();
        os_log_type_enabled(v134, OS_LOG_TYPE_ERROR);
        *(_DWORD *)buf = 136446722;
        v155 = "strict_calloc";
        v156 = 2048;
        v157 = 1;
        v158 = 2048;
        v159 = 144;
        v135 = (void *)_os_log_send_and_compose_impl();

        result = __nwlog_abort((uint64_t)v135);
        if (result)
          goto LABEL_210;
        free(v135);
      }
      v18->required_interface = (OS_nw_interface *)v36;
      objc_storeStrong(v36, **((id **)v16 + 22));
      objc_storeStrong((id *)v18->required_interface + 1, *(id *)(*((_QWORD *)v16 + 22) + 8));
      objc_storeStrong((id *)v18->required_interface + 2, *(id *)(*((_QWORD *)v16 + 22) + 16));
      objc_storeStrong((id *)v18->required_interface + 3, *(id *)(*((_QWORD *)v16 + 22) + 24));
      objc_storeStrong((id *)v18->required_interface + 4, *(id *)(*((_QWORD *)v16 + 22) + 32));
      objc_storeStrong((id *)v18->required_interface + 5, *(id *)(*((_QWORD *)v16 + 22) + 40));
      objc_storeStrong((id *)v18->required_interface + 6, *(id *)(*((_QWORD *)v16 + 22) + 48));
      if ((a3 & 1) == 0)
      {
        objc_storeStrong((id *)v18->required_interface + 7, *(id *)(*((_QWORD *)v16 + 22) + 56));
        objc_storeStrong((id *)v18->required_interface + 8, *(id *)(*((_QWORD *)v16 + 22) + 64));
        objc_storeStrong((id *)v18->required_interface + 9, *(id *)(*((_QWORD *)v16 + 22) + 72));
        objc_storeStrong((id *)v18->required_interface + 10, *(id *)(*((_QWORD *)v16 + 22) + 80));
        objc_storeStrong((id *)v18->required_interface + 11, *(id *)(*((_QWORD *)v16 + 22) + 88));
        objc_storeStrong((id *)v18->required_interface + 12, *(id *)(*((_QWORD *)v16 + 22) + 96));
        objc_storeStrong((id *)v18->required_interface + 13, *(id *)(*((_QWORD *)v16 + 22) + 104));
        objc_storeStrong((id *)v18->required_interface + 14, *(id *)(*((_QWORD *)v16 + 22) + 112));
        objc_storeStrong((id *)v18->required_interface + 15, *(id *)(*((_QWORD *)v16 + 22) + 120));
      }
      v37 = *(void **)(*((_QWORD *)v16 + 22) + 128);
      if (v37)
      {
        v38 = nw_protocol_options_copy(v37);
        required_interface = v18->required_interface;
        v40 = (void *)*((_QWORD *)required_interface + 16);
        *((_QWORD *)required_interface + 16) = v38;

        objc_storeStrong((id *)v18->required_interface + 17, *(id *)(*((_QWORD *)v16 + 22) + 136));
      }
    }
    v41 = v18;
    goto LABEL_28;
  }
  __nwlog_obj();
  v121 = (void *)objc_claimAutoreleasedReturnValue();
  *(_DWORD *)buf = 136446210;
  v155 = "nw_path_parameters_copy";
  v122 = (char *)_os_log_send_and_compose_impl();

  v153 = OS_LOG_TYPE_ERROR;
  v152 = 0;
  if (__nwlog_fault(v122, &v153, &v152))
  {
    if (v153 == OS_LOG_TYPE_FAULT)
    {
      __nwlog_obj();
      v123 = objc_claimAutoreleasedReturnValue();
      v124 = v153;
      if (os_log_type_enabled(v123, v153))
      {
        *(_DWORD *)buf = 136446210;
        v155 = "nw_path_parameters_copy";
        _os_log_impl(&dword_182FBE000, v123, v124, "%{public}s called with null copy", buf, 0xCu);
      }
    }
    else if (v152)
    {
      v139 = (char *)__nw_create_backtrace_string();
      __nwlog_obj();
      v123 = objc_claimAutoreleasedReturnValue();
      v140 = v153;
      v141 = os_log_type_enabled(v123, v153);
      if (v139)
      {
        if (v141)
        {
          *(_DWORD *)buf = 136446466;
          v155 = "nw_path_parameters_copy";
          v156 = 2082;
          v157 = (uint64_t)v139;
          _os_log_impl(&dword_182FBE000, v123, v140, "%{public}s called with null copy, dumping backtrace:%{public}s", buf, 0x16u);
        }

        free(v139);
        goto LABEL_208;
      }
      if (v141)
      {
        *(_DWORD *)buf = 136446210;
        v155 = "nw_path_parameters_copy";
        _os_log_impl(&dword_182FBE000, v123, v140, "%{public}s called with null copy, no backtrace", buf, 0xCu);
      }
    }
    else
    {
      __nwlog_obj();
      v123 = objc_claimAutoreleasedReturnValue();
      v146 = v153;
      if (os_log_type_enabled(v123, v153))
      {
        *(_DWORD *)buf = 136446210;
        v155 = "nw_path_parameters_copy";
        _os_log_impl(&dword_182FBE000, v123, v146, "%{public}s called with null copy, backtrace limit exceeded", buf, 0xCu);
      }
    }

  }
LABEL_208:
  if (v122)
    free(v122);
LABEL_28:

LABEL_29:
  v15 = a1[13];
  a1[13] = v18;
LABEL_30:

  if (!a1[13])
  {
    __nwlog_obj();
    v103 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 136446210;
    v155 = "-[NWConcrete_nw_parameters initWithParameters:stripConnected:shallowCopy:]";
    v104 = (char *)_os_log_send_and_compose_impl();

    v153 = OS_LOG_TYPE_ERROR;
    v152 = 0;
    if (__nwlog_fault(v104, &v153, &v152))
    {
      if (v153 == OS_LOG_TYPE_FAULT)
      {
        __nwlog_obj();
        v105 = objc_claimAutoreleasedReturnValue();
        v106 = v153;
        if (os_log_type_enabled(v105, v153))
        {
          *(_DWORD *)buf = 136446210;
          v155 = "-[NWConcrete_nw_parameters initWithParameters:stripConnected:shallowCopy:]";
          _os_log_impl(&dword_182FBE000, v105, v106, "%{public}s called with null self->path_parameters", buf, 0xCu);
        }
      }
      else if (v152)
      {
        v125 = (char *)__nw_create_backtrace_string();
        __nwlog_obj();
        v105 = objc_claimAutoreleasedReturnValue();
        v126 = v153;
        v127 = os_log_type_enabled(v105, v153);
        if (v125)
        {
          if (v127)
          {
            *(_DWORD *)buf = 136446466;
            v155 = "-[NWConcrete_nw_parameters initWithParameters:stripConnected:shallowCopy:]";
            v156 = 2082;
            v157 = (uint64_t)v125;
            _os_log_impl(&dword_182FBE000, v105, v126, "%{public}s called with null self->path_parameters, dumping backtrace:%{public}s", buf, 0x16u);
          }

          free(v125);
          goto LABEL_189;
        }
        if (v127)
        {
          *(_DWORD *)buf = 136446210;
          v155 = "-[NWConcrete_nw_parameters initWithParameters:stripConnected:shallowCopy:]";
          _os_log_impl(&dword_182FBE000, v105, v126, "%{public}s called with null self->path_parameters, no backtrace", buf, 0xCu);
        }
      }
      else
      {
        __nwlog_obj();
        v105 = objc_claimAutoreleasedReturnValue();
        v144 = v153;
        if (os_log_type_enabled(v105, v153))
        {
          *(_DWORD *)buf = 136446210;
          v155 = "-[NWConcrete_nw_parameters initWithParameters:stripConnected:shallowCopy:]";
          _os_log_impl(&dword_182FBE000, v105, v144, "%{public}s called with null self->path_parameters, backtrace limit exceeded", buf, 0xCu);
        }
      }

    }
LABEL_189:
    if (v104)
      free(v104);
LABEL_191:

LABEL_192:
    a1 = 0;
LABEL_103:

    return (BOOL)a1;
  }
  v42 = (const char *)*((_QWORD *)v7 + 14);
  if (v42)
  {
    v43 = strdup(v42);
    if (!v43)
    {
      __nwlog_obj();
      v107 = objc_claimAutoreleasedReturnValue();
      os_log_type_enabled(v107, OS_LOG_TYPE_ERROR);
      *(_DWORD *)buf = 136446210;
      v155 = "strict_strdup";
      v108 = (void *)_os_log_send_and_compose_impl();

      result = __nwlog_abort((uint64_t)v108);
      if (result)
        goto LABEL_210;
      free(v108);
    }
    a1[14] = v43;
  }
  v44 = (const char *)*((_QWORD *)v7 + 15);
  if (!v44)
    goto LABEL_37;
  v45 = strdup(v44);
  if (v45)
  {
LABEL_36:
    a1[15] = v45;
LABEL_37:
    objc_storeStrong(a1 + 16, *((id *)v7 + 16));
    if ((a3 & 1) != 0)
      *((_DWORD *)a1[13] + 21) = 0;
    else
      objc_storeStrong(a1 + 22, *((id *)v7 + 22));
    if (*((_QWORD *)v7 + 20))
    {
      v46 = nw_array_create();
      v47 = a1[20];
      a1[20] = (id)v46;

      v48 = (unsigned __int8 *)*((_QWORD *)v7 + 20);
      v149[0] = MEMORY[0x1E0C809B0];
      v149[1] = 3221225472;
      v149[2] = __74__NWConcrete_nw_parameters_initWithParameters_stripConnected_shallowCopy___block_invoke;
      v149[3] = &unk_1E14AC200;
      v150 = a1;
      nw_array_apply(v48, (uint64_t)v149);

    }
    objc_storeStrong(a1 + 23, *((id *)v7 + 23));
    objc_storeStrong(a1 + 24, *((id *)v7 + 24));
    objc_storeStrong(a1 + 17, *((id *)v7 + 17));
    objc_storeStrong(a1 + 18, *((id *)v7 + 18));
    v49 = (void *)*((_QWORD *)v7 + 19);
    if (v49)
    {
      if (a4)
      {
        v50 = v49;
        v51 = objc_alloc_init(NWConcrete_nw_protocol_stack);
        if (v51)
        {
          v52 = *((_QWORD *)v50 + 1);
          if (v52)
          {
            v53 = nw_array_create();
            if (v53 != v52)
            {
              v54 = v53;
              std::vector<nw_object_wrapper_t>::__assign_with_size[abi:nn180100]<nw_object_wrapper_t*,nw_object_wrapper_t*>(v53 + 16, *(void ***)(v52 + 16), *(void ***)(v52 + 24), (uint64_t)(*(_QWORD *)(v52 + 24) - *(_QWORD *)(v52 + 16)) >> 3);
              v52 = v54;
            }
            persistent_application_protocols = v51->persistent_application_protocols;
            v51->persistent_application_protocols = (OS_nw_array *)v52;

          }
          v56 = *((_QWORD *)v50 + 2);
          if (v56)
          {
            v57 = nw_array_create();
            if (v57 != v56)
            {
              v58 = v57;
              std::vector<nw_object_wrapper_t>::__assign_with_size[abi:nn180100]<nw_object_wrapper_t*,nw_object_wrapper_t*>(v57 + 16, *(void ***)(v56 + 16), *(void ***)(v56 + 24), (uint64_t)(*(_QWORD *)(v56 + 24) - *(_QWORD *)(v56 + 16)) >> 3);
              v56 = v58;
            }
            application_protocols = v51->application_protocols;
            v51->application_protocols = (OS_nw_array *)v56;

          }
          objc_storeStrong((id *)&v51->transport_protocol, *((id *)v50 + 3));
          objc_storeStrong((id *)&v51->secondary_transport_protocol, *((id *)v50 + 4));
          objc_storeStrong((id *)&v51->original_proxied_transport_protocol, *((id *)v50 + 5));
          objc_storeStrong((id *)&v51->internet_protocol, *((id *)v50 + 6));
          v60 = v51;
          goto LABEL_80;
        }
        pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
        networkd_settings_init();
        v69 = (id)gLogObj;
        *(_DWORD *)buf = 136446210;
        v155 = "nw_protocol_stack_shallow_copy";
        v70 = (void *)_os_log_send_and_compose_impl();

        v153 = OS_LOG_TYPE_ERROR;
        v152 = 0;
        if (__nwlog_fault((const char *)v70, &v153, &v152))
        {
          if (v153 == OS_LOG_TYPE_FAULT)
          {
            pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
            networkd_settings_init();
            v71 = (id)gLogObj;
            v72 = v153;
            if (os_log_type_enabled(v71, v153))
            {
              *(_DWORD *)buf = 136446210;
              v155 = "nw_protocol_stack_shallow_copy";
              _os_log_impl(&dword_182FBE000, v71, v72, "%{public}s [[nw_protocol_stack alloc] init] failed", buf, 0xCu);
            }
          }
          else if (v152)
          {
            v74 = __nw_create_backtrace_string();
            if (v74)
            {
              v75 = (char *)v74;
              pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
              networkd_settings_init();
              v76 = (id)gLogObj;
              v77 = v153;
              if (os_log_type_enabled(v76, v153))
              {
                *(_DWORD *)buf = 136446466;
                v155 = "nw_protocol_stack_shallow_copy";
                v156 = 2082;
                v157 = (uint64_t)v75;
                _os_log_impl(&dword_182FBE000, v76, v77, "%{public}s [[nw_protocol_stack alloc] init] failed, dumping backtrace:%{public}s", buf, 0x16u);
              }

              free(v75);
              if (!v70)
              {
LABEL_80:

                v80 = a1[19];
                a1[19] = v51;

                v62 = (void ***)*((_QWORD *)v7 + 21);
                if (!v62)
                {
                  v73 = (void *)*((_QWORD *)v7 + 25);
                  if (!v73)
                    goto LABEL_95;
                  goto LABEL_94;
                }
LABEL_81:
                v81 = (void ***)nw_array_create();
                if (v81 != v62)
                {
                  v82 = v81;
                  std::vector<nw_object_wrapper_t>::__assign_with_size[abi:nn180100]<nw_object_wrapper_t*,nw_object_wrapper_t*>((uint64_t)(v81 + 2), v62[2], v62[3], v62[3] - v62[2]);
                  v62 = v82;
                }
                v68 = (id *)a1[21];
                a1[21] = v62;
                goto LABEL_84;
              }
LABEL_79:
              free(v70);
              goto LABEL_80;
            }
            __nwlog_obj();
            v71 = objc_claimAutoreleasedReturnValue();
            v79 = v153;
            if (os_log_type_enabled(v71, v153))
            {
              *(_DWORD *)buf = 136446210;
              v155 = "nw_protocol_stack_shallow_copy";
              _os_log_impl(&dword_182FBE000, v71, v79, "%{public}s [[nw_protocol_stack alloc] init] failed, no backtrace", buf, 0xCu);
            }
          }
          else
          {
            pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
            networkd_settings_init();
            v71 = (id)gLogObj;
            v78 = v153;
            if (os_log_type_enabled(v71, v153))
            {
              *(_DWORD *)buf = 136446210;
              v155 = "nw_protocol_stack_shallow_copy";
              _os_log_impl(&dword_182FBE000, v71, v78, "%{public}s [[nw_protocol_stack alloc] init] failed, backtrace limit exceeded", buf, 0xCu);
            }
          }

        }
        if (!v70)
          goto LABEL_80;
        goto LABEL_79;
      }
      v63 = nw_protocol_stack_copy(v49);
      v64 = a1[19];
      a1[19] = v63;

      v61 = (unsigned __int8 **)(v7 + 168);
      if (!*((_QWORD *)v7 + 21))
      {
        v73 = (void *)*((_QWORD *)v7 + 25);
        if (!v73)
        {
LABEL_88:
          v86 = (void *)*((_QWORD *)v7 + 26);
          if (!v86)
          {
LABEL_98:
            v91 = (void *)*((_QWORD *)v7 + 27);
            if (v91)
            {
              if (a4)
                v92 = v91;
              else
                v92 = xpc_copy(v91);
              v93 = a1[27];
              a1[27] = v92;

            }
            goto LABEL_103;
          }
          goto LABEL_92;
        }
LABEL_87:
        v83 = v73;
        v84 = (void *)objc_msgSend(v83, "copyEndpoint");
        nw_endpoint_copy_properties(v83, v84);

        v85 = a1[25];
        a1[25] = v84;

        goto LABEL_88;
      }
    }
    else
    {
      v61 = (unsigned __int8 **)(v7 + 168);
      v62 = (void ***)*((_QWORD *)v7 + 21);
      if (!v62)
      {
LABEL_85:
        v73 = (void *)*((_QWORD *)v7 + 25);
        if (!v73)
        {
          v86 = (void *)*((_QWORD *)v7 + 26);
          if (!v86)
            goto LABEL_98;
          if (!a4)
          {
LABEL_92:
            v87 = v86;
            v88 = (void *)objc_msgSend(v87, "copyEndpoint");
            nw_endpoint_copy_properties(v87, v88);

            v89 = a1[26];
            a1[26] = v88;
LABEL_97:

            goto LABEL_98;
          }
LABEL_96:
          v90 = v86;
          v89 = a1[26];
          a1[26] = v90;
          goto LABEL_97;
        }
        if ((a4 & 1) == 0)
          goto LABEL_87;
LABEL_94:
        objc_storeStrong(a1 + 25, v73);
LABEL_95:
        v86 = (void *)*((_QWORD *)v7 + 26);
        if (!v86)
          goto LABEL_98;
        goto LABEL_96;
      }
      if (a4)
        goto LABEL_81;
    }
    v65 = nw_array_create();
    v66 = a1[21];
    a1[21] = (id)v65;

    v67 = *v61;
    v147[0] = MEMORY[0x1E0C809B0];
    v147[1] = 3221225472;
    v147[2] = __74__NWConcrete_nw_parameters_initWithParameters_stripConnected_shallowCopy___block_invoke_2;
    v147[3] = &unk_1E14AC200;
    v148 = a1;
    nw_array_apply(v67, (uint64_t)v147);
    v68 = v148;
LABEL_84:

    goto LABEL_85;
  }
  __nwlog_obj();
  v109 = objc_claimAutoreleasedReturnValue();
  os_log_type_enabled(v109, OS_LOG_TYPE_ERROR);
  *(_DWORD *)buf = 136446210;
  v155 = "strict_strdup";
  v110 = (void *)_os_log_send_and_compose_impl();

  result = __nwlog_abort((uint64_t)v110);
  if (!result)
  {
    free(v110);
    goto LABEL_36;
  }
LABEL_210:
  __break(1u);
  return result;
}

- (NSString)description
{
  char *v2;

  v2 = nw_parameters_copy_description_internal(self, 0);
  if (v2)
    v2 = (char *)CFStringCreateWithCStringNoCopy((CFAllocatorRef)*MEMORY[0x1E0C9AE00], v2, 0x8000100u, (CFAllocatorRef)*MEMORY[0x1E0C9AE10]);
  return (NSString *)v2;
}

- (void)dealloc
{
  char *e_bundle_id;
  char *proxy_bundle_id;
  objc_super v5;

  e_bundle_id = self->e_bundle_id;
  if (e_bundle_id)
  {
    free(e_bundle_id);
    self->e_bundle_id = 0;
  }
  proxy_bundle_id = self->proxy_bundle_id;
  if (proxy_bundle_id)
  {
    free(proxy_bundle_id);
    self->proxy_bundle_id = 0;
  }
  v5.receiver = self;
  v5.super_class = (Class)NWConcrete_nw_parameters;
  -[NWConcrete_nw_parameters dealloc](&v5, sel_dealloc);
}

@end
