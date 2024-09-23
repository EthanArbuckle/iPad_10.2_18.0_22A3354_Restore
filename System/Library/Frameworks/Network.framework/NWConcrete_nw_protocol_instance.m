@implementation NWConcrete_nw_protocol_instance

- (nw_protocol)getProtocolStructure
{
  if (self)
    return (nw_protocol *)&self[-1].paths_log_id_num;
  else
    return 0;
}

- (NWConcrete_nw_protocol_instance)init
{
  NWConcrete_nw_protocol_instance *v2;
  NWConcrete_nw_protocol_instance *v3;
  NWConcrete_nw_protocol_instance *v4;
  void *v6;
  char *v7;
  NSObject *v8;
  os_log_type_t v9;
  char *backtrace_string;
  os_log_type_t v11;
  _BOOL4 v12;
  os_log_type_t v13;
  char v14;
  os_log_type_t type;
  objc_super v16;
  uint8_t buf[4];
  const char *v18;
  __int16 v19;
  char *v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v16.receiver = self;
  v16.super_class = (Class)NWConcrete_nw_protocol_instance;
  v2 = -[NWConcrete_nw_protocol_instance init](&v16, sel_init);
  v3 = v2;
  if (v2)
  {
    v2->empty_frame_pool.tqh_first = 0;
    v2->empty_frame_pool.tqh_last = &v2->empty_frame_pool.tqh_first;
    v2->pending_inbound_frames.tqh_last = 0;
    *(_QWORD *)&v2->pending_inbound_frame_count = &v2->pending_inbound_frames.tqh_last;
    v2->handle = 0;
    v2->context = (OS_nw_context *)&v2->handle;
    v2->inbound_frames.tqh_first = 0;
    v2->inbound_frames.tqh_last = &v2->inbound_frames.tqh_first;
    v2->outbound_frames.tqh_last = 0;
    *(_QWORD *)&v2->empty_frame_pool_count = &v2->outbound_frames.tqh_last;
    LODWORD(v2->outbound_frames.tqh_first) = 0;
    v4 = v2;
    goto LABEL_3;
  }
  __nwlog_obj();
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  *(_DWORD *)buf = 136446210;
  v18 = "-[NWConcrete_nw_protocol_instance init]";
  v7 = (char *)_os_log_send_and_compose_impl();

  type = OS_LOG_TYPE_ERROR;
  v14 = 0;
  if (__nwlog_fault(v7, &type, &v14))
  {
    if (type == OS_LOG_TYPE_FAULT)
    {
      __nwlog_obj();
      v8 = objc_claimAutoreleasedReturnValue();
      v9 = type;
      if (os_log_type_enabled(v8, type))
      {
        *(_DWORD *)buf = 136446210;
        v18 = "-[NWConcrete_nw_protocol_instance init]";
        _os_log_impl(&dword_182FBE000, v8, v9, "%{public}s [super init] failed", buf, 0xCu);
      }
    }
    else if (v14)
    {
      backtrace_string = (char *)__nw_create_backtrace_string();
      __nwlog_obj();
      v8 = objc_claimAutoreleasedReturnValue();
      v11 = type;
      v12 = os_log_type_enabled(v8, type);
      if (backtrace_string)
      {
        if (v12)
        {
          *(_DWORD *)buf = 136446466;
          v18 = "-[NWConcrete_nw_protocol_instance init]";
          v19 = 2082;
          v20 = backtrace_string;
          _os_log_impl(&dword_182FBE000, v8, v11, "%{public}s [super init] failed, dumping backtrace:%{public}s", buf, 0x16u);
        }

        free(backtrace_string);
        goto LABEL_20;
      }
      if (v12)
      {
        *(_DWORD *)buf = 136446210;
        v18 = "-[NWConcrete_nw_protocol_instance init]";
        _os_log_impl(&dword_182FBE000, v8, v11, "%{public}s [super init] failed, no backtrace", buf, 0xCu);
      }
    }
    else
    {
      __nwlog_obj();
      v8 = objc_claimAutoreleasedReturnValue();
      v13 = type;
      if (os_log_type_enabled(v8, type))
      {
        *(_DWORD *)buf = 136446210;
        v18 = "-[NWConcrete_nw_protocol_instance init]";
        _os_log_impl(&dword_182FBE000, v8, v13, "%{public}s [super init] failed, backtrace limit exceeded", buf, 0xCu);
      }
    }

  }
LABEL_20:
  if (v7)
    free(v7);
LABEL_3:

  return v3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->level, 0);
  objc_storeStrong((id *)&self->derived_ipv4_endpoint, 0);
  objc_storeStrong((id *)&self->current_setup_path_parameters, 0);
  objc_storeStrong((id *)&self->current_setup_path_local_endpoint, 0);
  objc_storeStrong((id *)&self->current_setup_path_endpoint, 0);
  objc_storeStrong((id *)&self->current_setup_path, 0);
  objc_storeStrong((id *)&self->primary_path, 0);
  objc_storeStrong(&self->wakeup_block, 0);
  objc_storeStrong(&self->wakeup, 0);
  objc_storeStrong((id *)&self->new_flow_metadata, 0);
  objc_storeStrong((id *)&self->last_accepted_flow, 0);
  objc_storeStrong((id *)&self->custom_flow_mapping_table, 0);
  objc_storeStrong((id *)&self->pending_outbound_frames.tqh_first, 0);
  objc_storeStrong((id *)&self->protocol_outbound_data_limit, 0);
  objc_storeStrong((id *)&self->options, 0);
  objc_storeStrong((id *)&self->parameters, 0);
  objc_storeStrong((id *)&self->endpoint, 0);
  objc_storeStrong(&self->destroy_timer, 0);
  objc_storeStrong((id *)&self->listen_handler, 0);
  objc_storeStrong((id *)&self->parent_definition, 0);
}

- (void)destroy
{
  nw_frame **tqh_last;
  nw_frame **v4;
  os_unfair_lock_s *v5;
  uint32_t os_unfair_lock_opaque;
  id v7;
  void *v8;
  NSObject *v9;
  os_log_type_t v10;
  OS_nw_array *outbound_data_requests;
  char *flow_registration;
  uint64_t v13;
  os_unfair_lock_s *v14;
  _QWORD *v15;
  id v16;
  uint64_t v17;
  const char *v18;
  void *v19;
  NSObject *v20;
  os_log_type_t v21;
  uint64_t v22;
  const char *v23;
  void *v24;
  char v25;
  char *v26;
  os_log_type_t v27;
  _BOOL4 v28;
  uint64_t v29;
  const char *v30;
  uint64_t v31;
  void *v32;
  char v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t (*v36)(_QWORD *, unsigned __int16 *, uint64_t);
  char v37;
  char *backtrace_string;
  os_log_type_t v39;
  _BOOL4 v40;
  os_log_type_t v41;
  uint64_t v42;
  const char *v43;
  os_log_type_t v44;
  uint64_t v45;
  const char *v46;
  void *v47;
  const char *v48;
  const char *v49;
  char *v50;
  NSObject *v51;
  os_log_type_t v52;
  const char *v53;
  void *v54;
  char *v55;
  NSObject *v56;
  os_log_type_t v57;
  char *v58;
  _BOOL4 v59;
  const char *v60;
  char *v61;
  os_log_type_t v62;
  _BOOL4 v63;
  os_log_type_t v64;
  const char *v65;
  const char *v66;
  NSObject *v67;
  uint64_t v68;
  OS_nw_parameters *parameters;
  uint64_t v70;
  uint64_t v71;
  void (**v72)(_QWORD);
  const void *v73;
  os_log_type_t v74;
  os_log_type_t v75;
  _QWORD v76[5];
  char v77;
  os_log_type_t v78;
  unsigned __int16 *p_paths_log_id_num;
  char v80;
  os_log_type_t type[8];
  char v82;
  uint8_t buf[4];
  const char *v84;
  __int16 v85;
  _BYTE v86[28];
  __int16 v87;
  uint64_t v88;
  __int16 v89;
  NWConcrete_nw_protocol_instance *v90;
  __int16 v91;
  char *v92;
  uint64_t v93;

  v93 = *MEMORY[0x1E0C80C00];
  tqh_last = self->outbound_frames.tqh_last;
  if (tqh_last)
  {
    do
    {
      v4 = (nw_frame **)tqh_last[2];

      tqh_last = v4;
    }
    while (v4);
  }
  v5 = (os_unfair_lock_s *)self->pending_outbound_frames.tqh_last;
  if (v5)
  {
    os_unfair_lock_opaque = v5[10]._os_unfair_lock_opaque;
    if (!os_unfair_lock_opaque)
    {
LABEL_13:
      _nw_hash_table_release(v5, (uint64_t)a2);
      self->pending_outbound_frames.tqh_last = 0;
      goto LABEL_14;
    }
    pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
    networkd_settings_init();
    v7 = (id)gLogObj;
    *(_DWORD *)buf = 136446722;
    v84 = "-[NWConcrete_nw_protocol_instance destroy]";
    v85 = 1024;
    *(_DWORD *)v86 = os_unfair_lock_opaque;
    *(_WORD *)&v86[4] = 2048;
    *(_QWORD *)&v86[6] = self;
    v8 = (void *)_os_log_send_and_compose_impl();

    type[0] = OS_LOG_TYPE_ERROR;
    LOBYTE(p_paths_log_id_num) = 0;
    if (__nwlog_fault((const char *)v8, type, &p_paths_log_id_num))
    {
      if (type[0] == OS_LOG_TYPE_FAULT)
      {
        pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
        networkd_settings_init();
        v9 = (id)gLogObj;
        v10 = type[0];
        if (os_log_type_enabled(v9, type[0]))
        {
          *(_DWORD *)buf = 136446722;
          v84 = "-[NWConcrete_nw_protocol_instance destroy]";
          v85 = 1024;
          *(_DWORD *)v86 = os_unfair_lock_opaque;
          *(_WORD *)&v86[4] = 2048;
          *(_QWORD *)&v86[6] = self;
          _os_log_impl(&dword_182FBE000, v9, v10, "%{public}s Flow table is not empty (%u) when protocol instance %p is deallocated", buf, 0x1Cu);
        }
      }
      else if ((_BYTE)p_paths_log_id_num)
      {
        backtrace_string = (char *)__nw_create_backtrace_string();
        pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
        networkd_settings_init();
        v9 = (id)gLogObj;
        v39 = type[0];
        v40 = os_log_type_enabled(v9, type[0]);
        if (backtrace_string)
        {
          if (v40)
          {
            *(_DWORD *)buf = 136446978;
            v84 = "-[NWConcrete_nw_protocol_instance destroy]";
            v85 = 1024;
            *(_DWORD *)v86 = os_unfair_lock_opaque;
            *(_WORD *)&v86[4] = 2048;
            *(_QWORD *)&v86[6] = self;
            *(_WORD *)&v86[14] = 2082;
            *(_QWORD *)&v86[16] = backtrace_string;
            _os_log_impl(&dword_182FBE000, v9, v39, "%{public}s Flow table is not empty (%u) when protocol instance %p is deallocated, dumping backtrace:%{public}s", buf, 0x26u);
          }

          free(backtrace_string);
          if (!v8)
          {
LABEL_12:
            v5 = (os_unfair_lock_s *)self->pending_outbound_frames.tqh_last;
            if (!v5)
              goto LABEL_14;
            goto LABEL_13;
          }
LABEL_11:
          free(v8);
          goto LABEL_12;
        }
        if (v40)
        {
          *(_DWORD *)buf = 136446722;
          v84 = "-[NWConcrete_nw_protocol_instance destroy]";
          v85 = 1024;
          *(_DWORD *)v86 = os_unfair_lock_opaque;
          *(_WORD *)&v86[4] = 2048;
          *(_QWORD *)&v86[6] = self;
          _os_log_impl(&dword_182FBE000, v9, v39, "%{public}s Flow table is not empty (%u) when protocol instance %p is deallocated, no backtrace", buf, 0x1Cu);
        }
      }
      else
      {
        pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
        networkd_settings_init();
        v9 = (id)gLogObj;
        v44 = type[0];
        if (os_log_type_enabled(v9, type[0]))
        {
          *(_DWORD *)buf = 136446722;
          v84 = "-[NWConcrete_nw_protocol_instance destroy]";
          v85 = 1024;
          *(_DWORD *)v86 = os_unfair_lock_opaque;
          *(_WORD *)&v86[4] = 2048;
          *(_QWORD *)&v86[6] = self;
          _os_log_impl(&dword_182FBE000, v9, v44, "%{public}s Flow table is not empty (%u) when protocol instance %p is deallocated, backtrace limit exceeded", buf, 0x1Cu);
        }
      }

    }
    if (!v8)
      goto LABEL_12;
    goto LABEL_11;
  }
LABEL_14:
  outbound_data_requests = self->outbound_data_requests;
  if (outbound_data_requests)
  {
    _nw_hash_table_release((os_unfair_lock_s *)outbound_data_requests, (uint64_t)a2);
    self->outbound_data_requests = 0;
  }
  flow_registration = (char *)self->flow_registration;
  if (flow_registration)
  {
    v76[0] = MEMORY[0x1E0C809B0];
    v76[1] = 3221225472;
    v76[2] = __42__NWConcrete_nw_protocol_instance_destroy__block_invoke_54;
    v76[3] = &unk_1E14AC340;
    v76[4] = self;
    nw_hash_table_apply(flow_registration, (uint64_t)v76);
    v14 = (os_unfair_lock_s *)self->flow_registration;
    if (v14)
    {
      _nw_hash_table_release(v14, v13);
      self->flow_registration = 0;
    }
  }
  v15 = *(_QWORD **)&self[-1].log_str[25];
  if (v15)
  {
    if (SBYTE5(self->flow_in_connected) < 0)
      goto LABEL_35;
    pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
    networkd_settings_init();
    v16 = (id)gLogObj;
    v17 = *(_QWORD *)&self[-1].log_str[25];
    v18 = "invalid";
    if (v17 && *(_QWORD *)(v17 + 16))
      v18 = *(const char **)(v17 + 16);
    *(_DWORD *)buf = 136447490;
    v84 = "-[NWConcrete_nw_protocol_instance destroy]";
    v85 = 2082;
    *(_QWORD *)v86 = (char *)&self->flow_in_connected + 7;
    *(_WORD *)&v86[8] = 2080;
    *(_QWORD *)&v86[10] = " ";
    *(_WORD *)&v86[18] = 2080;
    *(_QWORD *)&v86[20] = v18;
    v87 = 2048;
    v88 = v17;
    v89 = 2048;
    v90 = self;
    v19 = (void *)_os_log_send_and_compose_impl();

    type[0] = OS_LOG_TYPE_ERROR;
    LOBYTE(p_paths_log_id_num) = 0;
    if (__nwlog_fault((const char *)v19, type, &p_paths_log_id_num))
    {
      if (type[0] == OS_LOG_TYPE_FAULT)
      {
        pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
        networkd_settings_init();
        v20 = (id)gLogObj;
        v21 = type[0];
        if (os_log_type_enabled(v20, type[0]))
        {
          v22 = *(_QWORD *)&self[-1].log_str[25];
          v23 = "invalid";
          if (v22 && *(_QWORD *)(v22 + 16))
            v23 = *(const char **)(v22 + 16);
          *(_DWORD *)buf = 136447490;
          v84 = "-[NWConcrete_nw_protocol_instance destroy]";
          v85 = 2082;
          *(_QWORD *)v86 = (char *)&self->flow_in_connected + 7;
          *(_WORD *)&v86[8] = 2080;
          *(_QWORD *)&v86[10] = " ";
          *(_WORD *)&v86[18] = 2080;
          *(_QWORD *)&v86[20] = v23;
          v87 = 2048;
          v88 = v22;
          v89 = 2048;
          v90 = self;
          _os_log_impl(&dword_182FBE000, v20, v21, "%{public}s %{public}s%sOutput handler %s:%p is not null when protocol instance %p is deallocated", buf, 0x3Eu);
        }
      }
      else if ((_BYTE)p_paths_log_id_num)
      {
        v26 = (char *)__nw_create_backtrace_string();
        pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
        networkd_settings_init();
        v20 = (id)gLogObj;
        v27 = type[0];
        v28 = os_log_type_enabled(v20, type[0]);
        if (v26)
        {
          if (v28)
          {
            v29 = *(_QWORD *)&self[-1].log_str[25];
            v30 = "invalid";
            if (v29 && *(_QWORD *)(v29 + 16))
              v30 = *(const char **)(v29 + 16);
            *(_DWORD *)buf = 136447746;
            v84 = "-[NWConcrete_nw_protocol_instance destroy]";
            v85 = 2082;
            *(_QWORD *)v86 = (char *)&self->flow_in_connected + 7;
            *(_WORD *)&v86[8] = 2080;
            *(_QWORD *)&v86[10] = " ";
            *(_WORD *)&v86[18] = 2080;
            *(_QWORD *)&v86[20] = v30;
            v87 = 2048;
            v88 = v29;
            v89 = 2048;
            v90 = self;
            v91 = 2082;
            v92 = v26;
            _os_log_impl(&dword_182FBE000, v20, v27, "%{public}s %{public}s%sOutput handler %s:%p is not null when protocol instance %p is deallocated, dumping backtrace:%{public}s", buf, 0x48u);
          }

          free(v26);
          if (!v19)
          {
LABEL_34:
            v15 = *(_QWORD **)&self[-1].log_str[25];
            if (v15)
            {
LABEL_35:
              v24 = (void *)v15[5];
              if (v24 == &nw_protocol_ref_counted_handle)
              {
                v31 = v15[11];
                if (v31)
                  v15[11] = v31 + 1;
                v25 = -1;
              }
              else
              {
                v25 = 0;
              }
              *(_QWORD *)type = v15;
              v82 = v25;
              v32 = *(void **)&self[-1].log_str[33];
              if (v32 == &nw_protocol_ref_counted_handle)
              {
                v34 = *(_QWORD *)&self[-1].log_str[81];
                if (v34)
                  *(_QWORD *)&self[-1].log_str[81] = v34 + 1;
                v33 = -1;
              }
              else
              {
                v33 = 0;
              }
              p_paths_log_id_num = &self[-1].paths_log_id_num;
              v80 = v33;
              v35 = v15[3];
              if (v35)
              {
                v36 = *(uint64_t (**)(_QWORD *, unsigned __int16 *, uint64_t))(v35 + 8);
                if (v36)
                {
                  v37 = v36(v15, &self[-1].paths_log_id_num, 1);
                  if (v32 != &nw_protocol_ref_counted_handle)
                    goto LABEL_57;
                  goto LABEL_124;
                }
              }
              __nwlog_obj();
              v47 = (void *)objc_claimAutoreleasedReturnValue();
              v48 = (const char *)v15[2];
              if (!v48)
                v48 = "invalid";
              *(_DWORD *)buf = 136446722;
              v84 = "__nw_protocol_remove_input_handler";
              v85 = 2082;
              *(_QWORD *)v86 = v48;
              *(_WORD *)&v86[8] = 2048;
              *(_QWORD *)&v86[10] = v15;
              v49 = (const char *)_os_log_send_and_compose_impl();

              v78 = OS_LOG_TYPE_ERROR;
              v77 = 0;
              v50 = (char *)v49;
              if (!__nwlog_fault(v49, &v78, &v77))
              {
LABEL_121:
                if (v50)
                  free(v50);
                v37 = 0;
                if (v32 != &nw_protocol_ref_counted_handle)
                {
LABEL_57:
                  if (v24 != &nw_protocol_ref_counted_handle)
                    goto LABEL_58;
                  goto LABEL_125;
                }
LABEL_124:
                nw::release_if_needed<nw_protocol *>((uint64_t *)&p_paths_log_id_num);
                if (v24 != &nw_protocol_ref_counted_handle)
                {
LABEL_58:
                  if ((v37 & 1) != 0)
                  {
LABEL_130:
                    v68 = *(_QWORD *)&self[-1].log_str[25];
                    if (v68)
                    {
                      if (*(_UNKNOWN **)(v68 + 40) == &nw_protocol_ref_counted_handle)
                      {
                        v70 = *(_QWORD *)(v68 + 88);
                        if (v70)
                        {
                          v71 = v70 - 1;
                          *(_QWORD *)(v68 + 88) = v71;
                          if (!v71)
                          {
                            v72 = *(void (***)(_QWORD))(v68 + 64);
                            if (v72)
                            {
                              *(_QWORD *)(v68 + 64) = 0;
                              v72[2](v72);
                              _Block_release(v72);
                            }
                            if ((*(_BYTE *)(v68 + 72) & 1) != 0)
                            {
                              v73 = *(const void **)(v68 + 64);
                              if (v73)
                                _Block_release(v73);
                            }
                            free((void *)v68);
                          }
                        }
                      }
                      *(_QWORD *)&self[-1].log_str[25] = 0;
                    }
                    goto LABEL_133;
                  }
LABEL_126:
                  if ((SBYTE5(self->flow_in_connected) & 0x80000000) == 0)
                  {
                    pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
                    networkd_settings_init();
                    v67 = (id)gLogObj;
                    if (os_log_type_enabled(v67, OS_LOG_TYPE_ERROR))
                    {
                      *(_DWORD *)buf = 136446722;
                      v84 = "-[NWConcrete_nw_protocol_instance destroy]";
                      v85 = 2082;
                      *(_QWORD *)v86 = (char *)&self->flow_in_connected + 7;
                      *(_WORD *)&v86[8] = 2080;
                      *(_QWORD *)&v86[10] = " ";
                      _os_log_impl(&dword_182FBE000, v67, OS_LOG_TYPE_ERROR, "%{public}s %{public}s%sUnable to remove output handler", buf, 0x20u);
                    }

                  }
                  goto LABEL_130;
                }
LABEL_125:
                nw::release_if_needed<nw_protocol *>((uint64_t *)type);
                if ((v37 & 1) != 0)
                  goto LABEL_130;
                goto LABEL_126;
              }
              if (v78 == OS_LOG_TYPE_FAULT)
              {
                __nwlog_obj();
                v51 = objc_claimAutoreleasedReturnValue();
                v52 = v78;
                if (os_log_type_enabled(v51, v78))
                {
                  v53 = (const char *)v15[2];
                  if (!v53)
                    v53 = "invalid";
                  *(_DWORD *)buf = 136446722;
                  v84 = "__nw_protocol_remove_input_handler";
                  v85 = 2082;
                  *(_QWORD *)v86 = v53;
                  *(_WORD *)&v86[8] = 2048;
                  *(_QWORD *)&v86[10] = v15;
                  _os_log_impl(&dword_182FBE000, v51, v52, "%{public}s protocol %{public}s (%p) has invalid remove_input_handler callback", buf, 0x20u);
                }
              }
              else if (v77)
              {
                v58 = (char *)__nw_create_backtrace_string();
                __nwlog_obj();
                v51 = objc_claimAutoreleasedReturnValue();
                v75 = v78;
                v59 = os_log_type_enabled(v51, v78);
                if (v58)
                {
                  if (v59)
                  {
                    v60 = (const char *)v15[2];
                    if (!v60)
                      v60 = "invalid";
                    *(_DWORD *)buf = 136446978;
                    v84 = "__nw_protocol_remove_input_handler";
                    v85 = 2082;
                    *(_QWORD *)v86 = v60;
                    *(_WORD *)&v86[8] = 2048;
                    *(_QWORD *)&v86[10] = v15;
                    *(_WORD *)&v86[18] = 2082;
                    *(_QWORD *)&v86[20] = v58;
                    _os_log_impl(&dword_182FBE000, v51, v75, "%{public}s protocol %{public}s (%p) has invalid remove_input_handler callback, dumping backtrace:%{public}s", buf, 0x2Au);
                  }

                  free(v58);
                  goto LABEL_120;
                }
                if (v59)
                {
                  v66 = (const char *)v15[2];
                  if (!v66)
                    v66 = "invalid";
                  *(_DWORD *)buf = 136446722;
                  v84 = "__nw_protocol_remove_input_handler";
                  v85 = 2082;
                  *(_QWORD *)v86 = v66;
                  *(_WORD *)&v86[8] = 2048;
                  *(_QWORD *)&v86[10] = v15;
                  _os_log_impl(&dword_182FBE000, v51, v75, "%{public}s protocol %{public}s (%p) has invalid remove_input_handler callback, no backtrace", buf, 0x20u);
                }
              }
              else
              {
                __nwlog_obj();
                v51 = objc_claimAutoreleasedReturnValue();
                v64 = v78;
                if (os_log_type_enabled(v51, v78))
                {
                  v65 = (const char *)v15[2];
                  if (!v65)
                    v65 = "invalid";
                  *(_DWORD *)buf = 136446722;
                  v84 = "__nw_protocol_remove_input_handler";
                  v85 = 2082;
                  *(_QWORD *)v86 = v65;
                  *(_WORD *)&v86[8] = 2048;
                  *(_QWORD *)&v86[10] = v15;
                  _os_log_impl(&dword_182FBE000, v51, v64, "%{public}s protocol %{public}s (%p) has invalid remove_input_handler callback, backtrace limit exceeded", buf, 0x20u);
                }
              }

LABEL_120:
              v50 = (char *)v49;
              goto LABEL_121;
            }
            __nwlog_obj();
            v54 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 136446210;
            v84 = "__nw_protocol_remove_input_handler";
            v55 = (char *)_os_log_send_and_compose_impl();

            type[0] = OS_LOG_TYPE_ERROR;
            LOBYTE(p_paths_log_id_num) = 0;
            if (__nwlog_fault(v55, type, &p_paths_log_id_num))
            {
              if (type[0] == OS_LOG_TYPE_FAULT)
              {
                __nwlog_obj();
                v56 = objc_claimAutoreleasedReturnValue();
                v57 = type[0];
                if (os_log_type_enabled(v56, type[0]))
                {
                  *(_DWORD *)buf = 136446210;
                  v84 = "__nw_protocol_remove_input_handler";
                  _os_log_impl(&dword_182FBE000, v56, v57, "%{public}s called with null protocol", buf, 0xCu);
                }
              }
              else if ((_BYTE)p_paths_log_id_num)
              {
                v61 = (char *)__nw_create_backtrace_string();
                __nwlog_obj();
                v56 = objc_claimAutoreleasedReturnValue();
                v62 = type[0];
                v63 = os_log_type_enabled(v56, type[0]);
                if (v61)
                {
                  if (v63)
                  {
                    *(_DWORD *)buf = 136446466;
                    v84 = "__nw_protocol_remove_input_handler";
                    v85 = 2082;
                    *(_QWORD *)v86 = v61;
                    _os_log_impl(&dword_182FBE000, v56, v62, "%{public}s called with null protocol, dumping backtrace:%{public}s", buf, 0x16u);
                  }

                  free(v61);
                  goto LABEL_150;
                }
                if (v63)
                {
                  *(_DWORD *)buf = 136446210;
                  v84 = "__nw_protocol_remove_input_handler";
                  _os_log_impl(&dword_182FBE000, v56, v62, "%{public}s called with null protocol, no backtrace", buf, 0xCu);
                }
              }
              else
              {
                __nwlog_obj();
                v56 = objc_claimAutoreleasedReturnValue();
                v74 = type[0];
                if (os_log_type_enabled(v56, type[0]))
                {
                  *(_DWORD *)buf = 136446210;
                  v84 = "__nw_protocol_remove_input_handler";
                  _os_log_impl(&dword_182FBE000, v56, v74, "%{public}s called with null protocol, backtrace limit exceeded", buf, 0xCu);
                }
              }

            }
LABEL_150:
            if (v55)
              free(v55);
            goto LABEL_126;
          }
LABEL_33:
          free(v19);
          goto LABEL_34;
        }
        if (v28)
        {
          v45 = *(_QWORD *)&self[-1].log_str[25];
          v46 = "invalid";
          if (v45 && *(_QWORD *)(v45 + 16))
            v46 = *(const char **)(v45 + 16);
          *(_DWORD *)buf = 136447490;
          v84 = "-[NWConcrete_nw_protocol_instance destroy]";
          v85 = 2082;
          *(_QWORD *)v86 = (char *)&self->flow_in_connected + 7;
          *(_WORD *)&v86[8] = 2080;
          *(_QWORD *)&v86[10] = " ";
          *(_WORD *)&v86[18] = 2080;
          *(_QWORD *)&v86[20] = v46;
          v87 = 2048;
          v88 = v45;
          v89 = 2048;
          v90 = self;
          _os_log_impl(&dword_182FBE000, v20, v27, "%{public}s %{public}s%sOutput handler %s:%p is not null when protocol instance %p is deallocated, no backtrace", buf, 0x3Eu);
        }
      }
      else
      {
        pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
        networkd_settings_init();
        v20 = (id)gLogObj;
        v41 = type[0];
        if (os_log_type_enabled(v20, type[0]))
        {
          v42 = *(_QWORD *)&self[-1].log_str[25];
          v43 = "invalid";
          if (v42 && *(_QWORD *)(v42 + 16))
            v43 = *(const char **)(v42 + 16);
          *(_DWORD *)buf = 136447490;
          v84 = "-[NWConcrete_nw_protocol_instance destroy]";
          v85 = 2082;
          *(_QWORD *)v86 = (char *)&self->flow_in_connected + 7;
          *(_WORD *)&v86[8] = 2080;
          *(_QWORD *)&v86[10] = " ";
          *(_WORD *)&v86[18] = 2080;
          *(_QWORD *)&v86[20] = v43;
          v87 = 2048;
          v88 = v42;
          v89 = 2048;
          v90 = self;
          _os_log_impl(&dword_182FBE000, v20, v41, "%{public}s %{public}s%sOutput handler %s:%p is not null when protocol instance %p is deallocated, backtrace limit exceeded", buf, 0x3Eu);
        }
      }

    }
    if (!v19)
      goto LABEL_34;
    goto LABEL_33;
  }
LABEL_133:
  parameters = self->parameters;
  if (parameters)
    nw_association_unregister(parameters, self);
}

@end
