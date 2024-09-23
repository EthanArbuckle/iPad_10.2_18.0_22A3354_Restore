@implementation NWConcrete_nw_connection_group

- (void)dealloc
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  char *v7;
  NSObject *v8;
  os_log_type_t v9;
  char *backtrace_string;
  os_log_type_t v11;
  _BOOL4 v12;
  os_log_type_t v13;
  uint8_t *v14;
  int v15;
  objc_super v16;
  char v17;
  os_log_type_t type;
  uint8_t buf[4];
  const char *v20;
  __int16 v21;
  char *v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  if (!*((_QWORD *)self + 3))
  {
    v3 = (void *)*((_QWORD *)self + 19);
    if (v3)
    {
      free(v3);
      *((_QWORD *)self + 19) = 0;
    }
    v4 = (void *)*((_QWORD *)self + 20);
    if (v4)
    {
      free(v4);
      *((_QWORD *)self + 20) = 0;
    }
    v5 = (void *)*((_QWORD *)self + 10);
    *((_QWORD *)self + 10) = 0;

    goto LABEL_7;
  }
  __nwlog_obj();
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  *(_DWORD *)buf = 136446210;
  v20 = "-[NWConcrete_nw_connection_group dealloc]";
  v15 = 12;
  v14 = buf;
  v7 = (char *)_os_log_send_and_compose_impl();

  type = OS_LOG_TYPE_ERROR;
  v17 = 0;
  if (__nwlog_fault(v7, &type, &v17))
  {
    if (type == OS_LOG_TYPE_FAULT)
    {
      __nwlog_obj();
      v8 = objc_claimAutoreleasedReturnValue();
      v9 = type;
      if (os_log_type_enabled(v8, type))
      {
        *(_DWORD *)buf = 136446210;
        v20 = "-[NWConcrete_nw_connection_group dealloc]";
        _os_log_impl(&dword_182FBE000, v8, v9, "%{public}s over-release of nw_connection_group_t! Object should not be internally retained and deallocating", buf, 0xCu);
      }
    }
    else if (v17)
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
          v20 = "-[NWConcrete_nw_connection_group dealloc]";
          v21 = 2082;
          v22 = backtrace_string;
          _os_log_impl(&dword_182FBE000, v8, v11, "%{public}s over-release of nw_connection_group_t! Object should not be internally retained and deallocating, dumping backtrace:%{public}s", buf, 0x16u);
        }

        free(backtrace_string);
        goto LABEL_24;
      }
      if (v12)
      {
        *(_DWORD *)buf = 136446210;
        v20 = "-[NWConcrete_nw_connection_group dealloc]";
        _os_log_impl(&dword_182FBE000, v8, v11, "%{public}s over-release of nw_connection_group_t! Object should not be internally retained and deallocating, no backtrace", buf, 0xCu);
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
        v20 = "-[NWConcrete_nw_connection_group dealloc]";
        _os_log_impl(&dword_182FBE000, v8, v13, "%{public}s over-release of nw_connection_group_t! Object should not be internally retained and deallocating, backtrace limit exceeded", buf, 0xCu);
      }
    }

  }
LABEL_24:
  if (v7)
    free(v7);
LABEL_7:
  v16.receiver = self;
  v16.super_class = (Class)NWConcrete_nw_connection_group;
  -[NWConcrete_nw_connection_group dealloc](&v16, sel_dealloc, v14, v15);
}

- (NSString)description
{
  const __CFAllocator *v2;
  const char *description;

  v2 = (const __CFAllocator *)*MEMORY[0x1E0C9AE00];
  description = (const char *)nw_connection_group_get_description(self);
  return (NSString *)(id)CFStringCreateWithCString(v2, description, 0x8000100u);
}

- (id)redactedDescription
{
  const __CFAllocator *v2;
  const char *description;

  v2 = (const __CFAllocator *)*MEMORY[0x1E0C9AE00];
  description = (const char *)nw_connection_group_get_description(self);
  return (id)(id)CFStringCreateWithCString(v2, description, 0x8000100u);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)self + 18, 0);
  objc_storeStrong((id *)self + 17, 0);
  objc_storeStrong((id *)self + 14, 0);
  objc_storeStrong((id *)self + 13, 0);
  objc_storeStrong((id *)self + 12, 0);
  objc_storeStrong((id *)self + 11, 0);
  objc_storeStrong((id *)self + 10, 0);
  objc_storeStrong((id *)self + 9, 0);
  objc_storeStrong((id *)self + 8, 0);
  objc_storeStrong((id *)self + 7, 0);
  objc_storeStrong((id *)self + 6, 0);
  objc_storeStrong((id *)self + 4, 0);
  objc_storeStrong((id *)self + 3, 0);
  objc_storeStrong((id *)self + 1, 0);
}

- (id).cxx_construct
{
  *((_DWORD *)self + 43) = 0;
  return self;
}

- (id)initWithDescriptor:(void *)a3 connection:(void *)a4 parameters:
{
  id v7;
  id v8;
  id v9;
  id *v10;
  id *v11;
  _QWORD *v12;
  id v13;
  id v14;
  char *v15;
  NSObject *v16;
  os_log_type_t v17;
  _BOOL8 v18;
  id v19;
  id v20;
  id v21;
  id v22;
  id *v23;
  id v24;
  id v25;
  id v26;
  _BOOL8 v27;
  id v28;
  char *backtrace_string;
  os_log_type_t v30;
  _BOOL4 v31;
  nw_parameters_t v32;
  uint64_t *v33;
  id v34;
  id v35;
  _DWORD *v36;
  int v37;
  NSObject *v38;
  int v39;
  id v40;
  _DWORD *v41;
  int v42;
  nw_endpoint_t v43;
  NSObject *v44;
  NSObject *v45;
  unsigned int v46;
  id v47;
  _DWORD *v48;
  int v49;
  NSObject *v50;
  id v51;
  _BOOL8 v52;
  id v53;
  _DWORD *v54;
  int v55;
  id v56;
  NSObject *v57;
  BOOL logging_disabled;
  char v59;
  nw_connection_t v60;
  char *multicast;
  id v62;
  void *v63;
  id v64;
  nw_listener_t v65;
  id v66;
  NSObject *v67;
  int v68;
  id v69;
  const char *v70;
  NSObject *v71;
  os_log_type_t v72;
  uint32_t v73;
  int v74;
  id v75;
  id v76;
  id *v77;
  os_log_type_t v78;
  _DWORD *v79;
  int v80;
  id v81;
  nw_listener_t v82;
  id v83;
  NSObject *v84;
  int v85;
  id v86;
  int v87;
  nw_connection_t v88;
  NSObject *v89;
  void (**v90)(_QWORD);
  os_unfair_lock_s *v91;
  void *v92;
  unsigned int v93;
  const char *v94;
  id v95;
  char *v96;
  NSObject *v97;
  os_log_type_t v98;
  char *v99;
  os_log_type_t v100;
  _BOOL4 v101;
  os_log_type_t v102;
  id v103;
  BOOL v104;
  NSObject *v105;
  int v106;
  id v107;
  id v108;
  const char *id_string;
  const char *v110;
  NSObject *v111;
  uint32_t v112;
  int v113;
  id v114;
  id v115;
  os_log_type_t v117;
  unsigned int v118;
  const char *v119;
  char *v120;
  os_log_type_t v121;
  _BOOL4 v122;
  unsigned int v123;
  const char *v124;
  os_log_type_t v125;
  unsigned int v126;
  const char *v127;
  void *v128;
  os_log_type_t v129;
  void *v130;
  char *v131;
  NSObject *v132;
  os_log_type_t v133;
  unsigned int v134;
  const char *v135;
  os_log_type_t v136;
  _BOOL4 v137;
  char *v138;
  os_log_type_t v139;
  _BOOL4 v140;
  os_log_type_t v141;
  os_log_type_t v142;
  NSObject *v143;
  int v144;
  const char *v145;
  NSObject *v146;
  int v147;
  const char *v148;
  NSObject *v149;
  int v150;
  id v151;
  _QWORD aBlock[4];
  char *v153;
  nw_connection_t v154;
  _QWORD enumerate_block[6];
  uint64_t v156;
  uint64_t *v157;
  uint64_t v158;
  uint64_t v159;
  os_log_type_t type[8];
  os_log_type_t *v161;
  uint64_t v162;
  __int16 v163;
  objc_super v164;
  uint8_t buf[4];
  const char *v166;
  __int16 v167;
  _BYTE v168[24];
  __int16 v169;
  const char *v170;
  uint64_t v171;

  v171 = *MEMORY[0x1E0C80C00];
  v7 = a2;
  v8 = a3;
  v9 = a4;
  if (!a1)
    goto LABEL_103;
  if (v7)
  {
    v164.receiver = a1;
    v164.super_class = (Class)NWConcrete_nw_connection_group;
    v10 = (id *)objc_msgSendSuper2(&v164, sel_init);
    v11 = v10;
    if (v10)
    {
      a1 = v10;
      *((_DWORD *)v10 + 42) = nw_connection_group_get_next_log_id();
      os_unfair_lock_lock((os_unfair_lock_t)&nw_uuid_generate_insecure(unsigned char *)::uuid_lock);
      if (uuid_is_null((const unsigned __int8 *)&nw_uuid_generate_insecure(unsigned char *)::last_used_uuid))
        goto LABEL_9;
      if ((_QWORD)nw_uuid_generate_insecure(unsigned char *)::last_used_uuid != -1)
      {
        *(_QWORD *)&nw_uuid_generate_insecure(unsigned char *)::last_used_uuid = nw_uuid_generate_insecure(unsigned char *)::last_used_uuid
                                                                               + 1;
        goto LABEL_10;
      }
      if (*((_QWORD *)&nw_uuid_generate_insecure(unsigned char *)::last_used_uuid + 1) == -1)
      {
LABEL_9:
        uuid_generate_random((unsigned __int8 *)&nw_uuid_generate_insecure(unsigned char *)::last_used_uuid);
        BYTE9(nw_uuid_generate_insecure(unsigned char *)::last_used_uuid) = -1;
      }
      else
      {
        ++*((_QWORD *)&nw_uuid_generate_insecure(unsigned char *)::last_used_uuid + 1);
      }
LABEL_10:
      *(_OWORD *)(v11 + 15) = nw_uuid_generate_insecure(unsigned char *)::last_used_uuid;
      os_unfair_lock_unlock((os_unfair_lock_t)&nw_uuid_generate_insecure(unsigned char *)::uuid_lock);
      if (v9)
      {
        v12 = v9;
        v13 = *(id *)(v12[13] + 136);

        LOBYTE(v12) = nw_context_is_inline(v13);
        if ((v12 & 1) != 0)
        {
          pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
          networkd_settings_init();
          v14 = (id)gLogObj;
          *(_DWORD *)buf = 136446210;
          v166 = "-[NWConcrete_nw_connection_group initWithDescriptor:connection:parameters:]";
          v15 = (char *)_os_log_send_and_compose_impl();

          type[0] = OS_LOG_TYPE_ERROR;
          LOBYTE(v156) = 0;
          if (!__nwlog_fault(v15, type, &v156))
            goto LABEL_101;
          if (type[0] == OS_LOG_TYPE_FAULT)
          {
            pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
            networkd_settings_init();
            v16 = (id)gLogObj;
            v17 = type[0];
            if (os_log_type_enabled(v16, type[0]))
            {
              *(_DWORD *)buf = 136446210;
              v166 = "-[NWConcrete_nw_connection_group initWithDescriptor:connection:parameters:]";
              _os_log_impl(&dword_182FBE000, v16, v17, "%{public}s Cannot use nw_connection_group on inline contexts", buf, 0xCu);
            }
LABEL_100:

            goto LABEL_101;
          }
          if (!(_BYTE)v156)
          {
            pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
            networkd_settings_init();
            v16 = (id)gLogObj;
            v78 = type[0];
            if (os_log_type_enabled(v16, type[0]))
            {
              *(_DWORD *)buf = 136446210;
              v166 = "-[NWConcrete_nw_connection_group initWithDescriptor:connection:parameters:]";
              _os_log_impl(&dword_182FBE000, v16, v78, "%{public}s Cannot use nw_connection_group on inline contexts, backtrace limit exceeded", buf, 0xCu);
            }
            goto LABEL_100;
          }
          backtrace_string = (char *)__nw_create_backtrace_string();
          pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
          networkd_settings_init();
          v16 = (id)gLogObj;
          v30 = type[0];
          v31 = os_log_type_enabled(v16, type[0]);
          if (!backtrace_string)
          {
            if (v31)
            {
              *(_DWORD *)buf = 136446210;
              v166 = "-[NWConcrete_nw_connection_group initWithDescriptor:connection:parameters:]";
              _os_log_impl(&dword_182FBE000, v16, v30, "%{public}s Cannot use nw_connection_group on inline contexts, no backtrace", buf, 0xCu);
            }
            goto LABEL_100;
          }
          if (v31)
          {
            *(_DWORD *)buf = 136446466;
            v166 = "-[NWConcrete_nw_connection_group initWithDescriptor:connection:parameters:]";
            v167 = 2082;
            *(_QWORD *)v168 = backtrace_string;
            _os_log_impl(&dword_182FBE000, v16, v30, "%{public}s Cannot use nw_connection_group on inline contexts, dumping backtrace:%{public}s", buf, 0x16u);
          }
LABEL_26:

          free(backtrace_string);
          if (!v15)
            goto LABEL_103;
          goto LABEL_102;
        }
      }
      v18 = nw_array_create();
      v19 = v11[13];
      v11[13] = (id)v18;

      v20 = v11[17];
      v11[17] = 0;

      v21 = v11[18];
      v11[18] = 0;

      *((_DWORD *)v11 + 46) = -1;
      v11[22] = (id)0x40000000000;
      *((_BYTE *)v11 + 190) &= 0x25u;
      *((_DWORD *)v11 + 10) = 0;
      v22 = v11[6];
      v11[6] = 0;

      if (v8)
      {
        v23 = (id *)v8;
        v24 = v23[2];

        v25 = v11[7];
        v11[7] = v24;

        *((_BYTE *)v11 + 190) |= 4u;
      }
      else
      {
        if (v9)
        {
          v26 = v9;
          v27 = -[NWConcrete_nw_parameters initWithParameters:stripConnected:shallowCopy:]((id *)[NWConcrete_nw_parameters alloc], v26, 0, 0);

          v28 = v11[7];
          v11[7] = (id)v27;
        }
        else
        {
          v32 = nw_parameters_create();
          v28 = v11[7];
          v11[7] = v32;
        }

      }
      nw_parameters_set_reuse_local_address((nw_parameters_t)v11[7], 1);
      v33 = nw_group_descriptor_copy(v7);
      v34 = v11[8];
      v11[8] = v33;

      v35 = v11[8];
      if (v35)
      {
        v36 = v35;
        v37 = v36[2];

        if (v37 == 1 && nw_parameters_get_data_mode(v11[7]) == 2)
        {
          if (nw_parameters_get_logging_disabled((uint64_t)v11[7]))
            goto LABEL_103;
          if (__nwlog_connection_group_log::onceToken != -1)
            dispatch_once(&__nwlog_connection_group_log::onceToken, &__block_literal_global_27_44189);
          v38 = (id)gconnection_groupLogObj;
          if (os_log_type_enabled(v38, OS_LOG_TYPE_ERROR))
          {
            v39 = *((_DWORD *)v11 + 42);
            *(_DWORD *)buf = 136446466;
            v166 = "-[NWConcrete_nw_connection_group initWithDescriptor:connection:parameters:]";
            v167 = 1024;
            *(_DWORD *)v168 = v39;
            _os_log_impl(&dword_182FBE000, v38, OS_LOG_TYPE_ERROR, "%{public}s [G%u] cannot create multicast connection group with stream mode parameters", buf, 0x12u);
          }
LABEL_37:

          goto LABEL_103;
        }
        v40 = v11[8];
        if (v40)
        {
          v41 = v40;
          v42 = v41[2];

          if (v42 == 2 && !nw_parameters_has_multiplexed_protocol_in_stack(v11[7]))
          {
            if (nw_parameters_get_logging_disabled((uint64_t)v11[7]))
              goto LABEL_103;
            if (__nwlog_connection_group_log::onceToken != -1)
              dispatch_once(&__nwlog_connection_group_log::onceToken, &__block_literal_global_27_44189);
            v38 = (id)gconnection_groupLogObj;
            if (os_log_type_enabled(v38, OS_LOG_TYPE_ERROR))
            {
              v87 = *((_DWORD *)v11 + 42);
              *(_DWORD *)buf = 136446466;
              v166 = "-[NWConcrete_nw_connection_group initWithDescriptor:connection:parameters:]";
              v167 = 1024;
              *(_DWORD *)v168 = v87;
              _os_log_impl(&dword_182FBE000, v38, OS_LOG_TYPE_ERROR, "%{public}s [G%u] cannot create multiplex connection group with non-multiplex parameters", buf, 0x12u);
            }
            goto LABEL_37;
          }
        }
      }
      v43 = nw_parameters_copy_local_endpoint((nw_parameters_t)v11[7]);
      v44 = v43;
      if (v43)
      {
        v45 = v43;
        v46 = -[NSObject port](v45, "port");

        *((_WORD *)v11 + 94) = __rev16(v46);
      }
      v47 = v11[8];
      if (!v47)
        goto LABEL_110;
      v48 = v47;
      v49 = v48[2];

      if (v49 == 1)
      {
        *(_QWORD *)type = 0;
        v161 = type;
        v162 = 0x2020000000;
        v163 = 0;
        v156 = 0;
        v157 = &v156;
        v158 = 0x2020000000;
        v159 = 0;
        v50 = v11[8];
        enumerate_block[0] = MEMORY[0x1E0C809B0];
        enumerate_block[1] = 3221225472;
        enumerate_block[2] = __75__NWConcrete_nw_connection_group_initWithDescriptor_connection_parameters___block_invoke;
        enumerate_block[3] = &unk_1E149B520;
        enumerate_block[4] = type;
        enumerate_block[5] = &v156;
        nw_group_descriptor_enumerate_endpoints(v50, enumerate_block);
        if (!nw_parameters_get_logging_disabled((uint64_t)v11[7]) && gLogDatapath)
        {
          if (__nwlog_connection_group_log::onceToken != -1)
            dispatch_once(&__nwlog_connection_group_log::onceToken, &__block_literal_global_27_44189);
          v143 = (id)gconnection_groupLogObj;
          if (os_log_type_enabled(v143, OS_LOG_TYPE_DEBUG))
          {
            v144 = *((_DWORD *)a1 + 42);
            v145 = (const char *)v157[3];
            if (!v145)
              v145 = "<ephemeral>";
            *(_DWORD *)buf = 136446722;
            v166 = "-[NWConcrete_nw_connection_group initWithDescriptor:connection:parameters:]";
            v167 = 1024;
            *(_DWORD *)v168 = v144;
            *(_WORD *)&v168[4] = 2080;
            *(_QWORD *)&v168[6] = v145;
            _os_log_impl(&dword_182FBE000, v143, OS_LOG_TYPE_DEBUG, "%{public}s [G%u] using port %s for connection group listener", buf, 0x1Cu);
          }

        }
        v51 = a1[7];
        v52 = -[NWConcrete_nw_parameters initWithParameters:stripConnected:shallowCopy:]((id *)[NWConcrete_nw_parameters alloc], v51, 0, 0);

        if (*((_WORD *)v161 + 12))
          nw_parameters_set_local_endpoint((nw_parameters_t)v52, 0);
        else
          *((_WORD *)v161 + 12) = *((_WORD *)a1 + 94);
        multicast = nw_listener_create_multicast(a1[8], (void *)v52, (const char *)v157[3]);
        v62 = a1[11];
        a1[11] = multicast;

        v63 = (void *)v157[3];
        if (v63)
        {
          free(v63);
          v157[3] = 0;
        }
        v64 = a1[11];
        if (v64)
        {
          if (*((unsigned __int16 *)a1 + 94) == *((unsigned __int16 *)v161 + 12))
            goto LABEL_76;
          nw_parameters_set_allow_socket_access((void *)v52, 1);
          nw_parameters_set_reuse_local_address((nw_parameters_t)v52, 1);
          if (v44)
            nw_parameters_set_local_endpoint((nw_parameters_t)v52, v44);
          v65 = nw_listener_create((nw_parameters_t)v52);
          v66 = a1[12];
          a1[12] = v65;

          if (nw_parameters_get_logging_disabled((uint64_t)a1[7]))
          {
LABEL_76:

            _Block_object_dispose(&v156, 8);
            _Block_object_dispose(type, 8);
            if (!v64)
            {
LABEL_77:
              v77 = 0;
LABEL_143:

              goto LABEL_144;
            }
            goto LABEL_129;
          }
          if (__nwlog_connection_group_log::onceToken != -1)
            dispatch_once(&__nwlog_connection_group_log::onceToken, &__block_literal_global_27_44189);
          v67 = (id)gconnection_groupLogObj;
          if (!os_log_type_enabled(v67, OS_LOG_TYPE_INFO))
          {
LABEL_75:

            goto LABEL_76;
          }
          v68 = *((_DWORD *)a1 + 42);
          v69 = a1[12];
          *(_DWORD *)buf = 136446722;
          v166 = "-[NWConcrete_nw_connection_group initWithDescriptor:connection:parameters:]";
          v167 = 1024;
          *(_DWORD *)v168 = v68;
          *(_WORD *)&v168[4] = 2114;
          *(_QWORD *)&v168[6] = v69;
          v70 = "%{public}s [G%u] creating unicast listener: %{public}@";
          v71 = v67;
          v72 = OS_LOG_TYPE_INFO;
          v73 = 28;
        }
        else
        {
          if (nw_parameters_get_logging_disabled((uint64_t)a1[7]))
            goto LABEL_76;
          if (__nwlog_connection_group_log::onceToken != -1)
            dispatch_once(&__nwlog_connection_group_log::onceToken, &__block_literal_global_27_44189);
          v67 = (id)gconnection_groupLogObj;
          if (!os_log_type_enabled(v67, OS_LOG_TYPE_ERROR))
            goto LABEL_75;
          v74 = *((_DWORD *)a1 + 42);
          v76 = a1[7];
          v75 = a1[8];
          *(_DWORD *)buf = 136446978;
          v166 = "-[NWConcrete_nw_connection_group initWithDescriptor:connection:parameters:]";
          v167 = 1024;
          *(_DWORD *)v168 = v74;
          *(_WORD *)&v168[4] = 2112;
          *(_QWORD *)&v168[6] = v75;
          *(_WORD *)&v168[14] = 2112;
          *(_QWORD *)&v168[16] = v76;
          v70 = "%{public}s [G%u] failed to create listener with descriptor %@, and parameters %@";
          v71 = v67;
          v72 = OS_LOG_TYPE_ERROR;
          v73 = 38;
        }
        _os_log_impl(&dword_182FBE000, v71, v72, v70, buf, v73);
        goto LABEL_75;
      }
      v53 = v11[8];
      if (!v53)
        goto LABEL_110;
      v54 = v53;
      v55 = v54[2];

      v56 = v11[8];
      if (v55 == 2)
      {
        v57 = nw_group_descriptor_copy_member(v56);
        logging_disabled = nw_parameters_get_logging_disabled((uint64_t)v11[7]);
        if (gLogDatapath)
          v59 = logging_disabled;
        else
          v59 = 1;
        if (v8)
        {
          if ((v59 & 1) == 0)
          {
            if (__nwlog_connection_group_log::onceToken != -1)
              dispatch_once(&__nwlog_connection_group_log::onceToken, &__block_literal_global_27_44189);
            v146 = (id)gconnection_groupLogObj;
            if (os_log_type_enabled(v146, OS_LOG_TYPE_DEBUG))
            {
              v147 = *((_DWORD *)v11 + 42);
              v148 = (const char *)v11[7];
              *(_DWORD *)buf = 136447234;
              v166 = "-[NWConcrete_nw_connection_group initWithDescriptor:connection:parameters:]";
              v167 = 1024;
              *(_DWORD *)v168 = v147;
              *(_WORD *)&v168[4] = 2112;
              *(_QWORD *)&v168[6] = v8;
              *(_WORD *)&v168[14] = 2112;
              *(_QWORD *)&v168[16] = v57;
              v169 = 2112;
              v170 = v148;
              _os_log_impl(&dword_182FBE000, v146, OS_LOG_TYPE_DEBUG, "%{public}s [G%u] using provided connection (%@) for multiplex endpoint (%@) and parameters (%@)", buf, 0x30u);
            }

          }
          v60 = (nw_connection_t)v8;
        }
        else
        {
          if ((v59 & 1) == 0)
          {
            if (__nwlog_connection_group_log::onceToken != -1)
              dispatch_once(&__nwlog_connection_group_log::onceToken, &__block_literal_global_27_44189);
            v149 = (id)gconnection_groupLogObj;
            if (os_log_type_enabled(v149, OS_LOG_TYPE_DEBUG))
            {
              v150 = *((_DWORD *)v11 + 42);
              v151 = v11[7];
              *(_DWORD *)buf = 136446978;
              v166 = "-[NWConcrete_nw_connection_group initWithDescriptor:connection:parameters:]";
              v167 = 1024;
              *(_DWORD *)v168 = v150;
              *(_WORD *)&v168[4] = 2112;
              *(_QWORD *)&v168[6] = v57;
              *(_WORD *)&v168[14] = 2112;
              *(_QWORD *)&v168[16] = v151;
              _os_log_impl(&dword_182FBE000, v149, OS_LOG_TYPE_DEBUG, "%{public}s [G%u] creating connection for multiplex endpoint (%@) and parameters (%@)", buf, 0x26u);
            }

          }
          v60 = nw_connection_create(v57, (nw_parameters_t)v11[7]);
        }
        v88 = v60;
        aBlock[0] = MEMORY[0x1E0C809B0];
        aBlock[1] = 3221225472;
        aBlock[2] = __75__NWConcrete_nw_connection_group_initWithDescriptor_connection_parameters___block_invoke_10;
        aBlock[3] = &unk_1E14ACE68;
        v153 = v11;
        v154 = v88;
        v89 = v88;
        v90 = (void (**)(_QWORD))_Block_copy(aBlock);
        v91 = (os_unfair_lock_s *)v11 + 43;
        os_unfair_lock_lock(v91);
        v90[2](v90);
        os_unfair_lock_unlock(v91);

        goto LABEL_129;
      }
      if (!v56)
        goto LABEL_110;
      v79 = v56;
      v80 = v79[2];

      if (v80 == 3)
        goto LABEL_129;
      v81 = a1[8];
      if (!v81)
        goto LABEL_110;
      if (nw_group_descriptor_get_type(v81) == 4)
      {
        v82 = nw_listener_create((nw_parameters_t)a1[7]);
        v83 = a1[11];
        a1[11] = v82;

        if (!a1[11])
        {
          if (!nw_parameters_get_logging_disabled((uint64_t)a1[7]))
          {
            if (__nwlog_connection_group_log::onceToken != -1)
              dispatch_once(&__nwlog_connection_group_log::onceToken, &__block_literal_global_27_44189);
            v84 = (id)gconnection_groupLogObj;
            if (os_log_type_enabled(v84, OS_LOG_TYPE_ERROR))
            {
              v85 = *((_DWORD *)a1 + 42);
              v86 = a1[7];
              *(_DWORD *)buf = 136446722;
              v166 = "-[NWConcrete_nw_connection_group initWithDescriptor:connection:parameters:]";
              v167 = 1024;
              *(_DWORD *)v168 = v85;
              *(_WORD *)&v168[4] = 2112;
              *(_QWORD *)&v168[6] = v86;
              _os_log_impl(&dword_182FBE000, v84, OS_LOG_TYPE_ERROR, "%{public}s [G%u] failed to create listener with parameters %@", buf, 0x1Cu);
            }

          }
          goto LABEL_77;
        }
LABEL_129:
        v103 = a1[11];
        v104 = nw_parameters_get_logging_disabled((uint64_t)a1[7]);
        if (v103)
        {
          if (!v104)
          {
            if (__nwlog_connection_group_log::onceToken != -1)
              dispatch_once(&__nwlog_connection_group_log::onceToken, &__block_literal_global_27_44189);
            v105 = (id)gconnection_groupLogObj;
            if (!os_log_type_enabled(v105, OS_LOG_TYPE_DEFAULT))
              goto LABEL_141;
            v106 = *((_DWORD *)a1 + 42);
            v108 = a1[7];
            v107 = a1[8];
            id_string = nw_listener_get_id_string(a1[11]);
            *(_DWORD *)buf = 136447234;
            v166 = "-[NWConcrete_nw_connection_group initWithDescriptor:connection:parameters:]";
            v167 = 1024;
            *(_DWORD *)v168 = v106;
            *(_WORD *)&v168[4] = 2112;
            *(_QWORD *)&v168[6] = v107;
            *(_WORD *)&v168[14] = 2112;
            *(_QWORD *)&v168[16] = v108;
            v169 = 2080;
            v170 = id_string;
            v110 = "%{public}s [G%u] create with descriptor: %@, parameters: %@, listener: [%s]";
            v111 = v105;
            v112 = 48;
LABEL_140:
            _os_log_impl(&dword_182FBE000, v111, OS_LOG_TYPE_DEFAULT, v110, buf, v112);
LABEL_141:

          }
        }
        else if (!v104)
        {
          if (__nwlog_connection_group_log::onceToken != -1)
            dispatch_once(&__nwlog_connection_group_log::onceToken, &__block_literal_global_27_44189);
          v105 = (id)gconnection_groupLogObj;
          if (!os_log_type_enabled(v105, OS_LOG_TYPE_DEFAULT))
            goto LABEL_141;
          v113 = *((_DWORD *)a1 + 42);
          v115 = a1[7];
          v114 = a1[8];
          *(_DWORD *)buf = 136446978;
          v166 = "-[NWConcrete_nw_connection_group initWithDescriptor:connection:parameters:]";
          v167 = 1024;
          *(_DWORD *)v168 = v113;
          *(_WORD *)&v168[4] = 2112;
          *(_QWORD *)&v168[6] = v114;
          *(_WORD *)&v168[14] = 2112;
          *(_QWORD *)&v168[16] = v115;
          v110 = "%{public}s [G%u] create with descriptor: %@, parameters: %@";
          v111 = v105;
          v112 = 38;
          goto LABEL_140;
        }
        v77 = a1;
        goto LABEL_143;
      }
      if (!a1[8])
      {
LABEL_110:
        pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
        networkd_settings_init();
        v95 = (id)gLogObj;
        *(_DWORD *)buf = 136446210;
        v166 = "-[NWConcrete_nw_connection_group initWithDescriptor:connection:parameters:]";
        v96 = (char *)_os_log_send_and_compose_impl();

        type[0] = OS_LOG_TYPE_ERROR;
        LOBYTE(v156) = 0;
        if (!__nwlog_fault(v96, type, &v156))
          goto LABEL_127;
        if (type[0] == OS_LOG_TYPE_FAULT)
        {
          pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
          networkd_settings_init();
          v97 = (id)gLogObj;
          v98 = type[0];
          if (os_log_type_enabled(v97, type[0]))
          {
            *(_DWORD *)buf = 136446210;
            v166 = "-[NWConcrete_nw_connection_group initWithDescriptor:connection:parameters:]";
            _os_log_impl(&dword_182FBE000, v97, v98, "%{public}s Group descriptor is not set", buf, 0xCu);
          }
        }
        else if ((_BYTE)v156)
        {
          v99 = (char *)__nw_create_backtrace_string();
          pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
          networkd_settings_init();
          v97 = (id)gLogObj;
          v100 = type[0];
          v101 = os_log_type_enabled(v97, type[0]);
          if (v99)
          {
            if (v101)
            {
              *(_DWORD *)buf = 136446466;
              v166 = "-[NWConcrete_nw_connection_group initWithDescriptor:connection:parameters:]";
              v167 = 2082;
              *(_QWORD *)v168 = v99;
              _os_log_impl(&dword_182FBE000, v97, v100, "%{public}s Group descriptor is not set, dumping backtrace:%{public}s", buf, 0x16u);
            }

            free(v99);
            if (!v96)
              goto LABEL_129;
LABEL_128:
            free(v96);
            goto LABEL_129;
          }
          if (v101)
          {
            *(_DWORD *)buf = 136446210;
            v166 = "-[NWConcrete_nw_connection_group initWithDescriptor:connection:parameters:]";
            _os_log_impl(&dword_182FBE000, v97, v100, "%{public}s Group descriptor is not set, no backtrace", buf, 0xCu);
          }
        }
        else
        {
          pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
          networkd_settings_init();
          v97 = (id)gLogObj;
          v102 = type[0];
          if (os_log_type_enabled(v97, type[0]))
          {
            *(_DWORD *)buf = 136446210;
            v166 = "-[NWConcrete_nw_connection_group initWithDescriptor:connection:parameters:]";
            _os_log_impl(&dword_182FBE000, v97, v102, "%{public}s Group descriptor is not set, backtrace limit exceeded", buf, 0xCu);
          }
        }
        goto LABEL_126;
      }
      __nwlog_obj();
      v92 = (void *)objc_claimAutoreleasedReturnValue();
      v93 = nw_group_descriptor_get_type(a1[8]);
      if (v93 > 4)
        v94 = "unknown";
      else
        v94 = off_1E149B878[v93];
      *(_DWORD *)buf = 136446466;
      v166 = "-[NWConcrete_nw_connection_group initWithDescriptor:connection:parameters:]";
      v167 = 2080;
      *(_QWORD *)v168 = v94;
      v96 = (char *)_os_log_send_and_compose_impl();

      type[0] = OS_LOG_TYPE_ERROR;
      LOBYTE(v156) = 0;
      if (__nwlog_fault(v96, type, &v156))
      {
        if (type[0] == OS_LOG_TYPE_FAULT)
        {
          __nwlog_obj();
          v97 = objc_claimAutoreleasedReturnValue();
          v117 = type[0];
          if (os_log_type_enabled(v97, type[0]))
          {
            v118 = nw_group_descriptor_get_type(a1[8]);
            if (v118 > 4)
              v119 = "unknown";
            else
              v119 = off_1E149B878[v118];
            *(_DWORD *)buf = 136446466;
            v166 = "-[NWConcrete_nw_connection_group initWithDescriptor:connection:parameters:]";
            v167 = 2080;
            *(_QWORD *)v168 = v119;
            _os_log_impl(&dword_182FBE000, v97, v117, "%{public}s Unsupported group descriptor type: %s", buf, 0x16u);
          }
LABEL_126:

          goto LABEL_127;
        }
        if (!(_BYTE)v156)
        {
          __nwlog_obj();
          v97 = objc_claimAutoreleasedReturnValue();
          v125 = type[0];
          if (os_log_type_enabled(v97, type[0]))
          {
            v126 = nw_group_descriptor_get_type(a1[8]);
            if (v126 > 4)
              v127 = "unknown";
            else
              v127 = off_1E149B878[v126];
            *(_DWORD *)buf = 136446466;
            v166 = "-[NWConcrete_nw_connection_group initWithDescriptor:connection:parameters:]";
            v167 = 2080;
            *(_QWORD *)v168 = v127;
            _os_log_impl(&dword_182FBE000, v97, v125, "%{public}s Unsupported group descriptor type: %s, backtrace limit exceeded", buf, 0x16u);
          }
          goto LABEL_126;
        }
        v120 = (char *)__nw_create_backtrace_string();
        __nwlog_obj();
        v97 = objc_claimAutoreleasedReturnValue();
        v121 = type[0];
        v122 = os_log_type_enabled(v97, type[0]);
        if (!v120)
        {
          if (v122)
          {
            v134 = nw_group_descriptor_get_type(a1[8]);
            if (v134 > 4)
              v135 = "unknown";
            else
              v135 = off_1E149B878[v134];
            *(_DWORD *)buf = 136446466;
            v166 = "-[NWConcrete_nw_connection_group initWithDescriptor:connection:parameters:]";
            v167 = 2080;
            *(_QWORD *)v168 = v135;
            _os_log_impl(&dword_182FBE000, v97, v121, "%{public}s Unsupported group descriptor type: %s, no backtrace", buf, 0x16u);
          }
          goto LABEL_126;
        }
        if (v122)
        {
          v123 = nw_group_descriptor_get_type(a1[8]);
          if (v123 > 4)
            v124 = "unknown";
          else
            v124 = off_1E149B878[v123];
          *(_DWORD *)buf = 136446722;
          v166 = "-[NWConcrete_nw_connection_group initWithDescriptor:connection:parameters:]";
          v167 = 2080;
          *(_QWORD *)v168 = v124;
          *(_WORD *)&v168[8] = 2082;
          *(_QWORD *)&v168[10] = v120;
          _os_log_impl(&dword_182FBE000, v97, v121, "%{public}s Unsupported group descriptor type: %s, dumping backtrace:%{public}s", buf, 0x20u);
        }

        free(v120);
      }
LABEL_127:
      if (!v96)
        goto LABEL_129;
      goto LABEL_128;
    }
    __nwlog_obj();
    v130 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 136446210;
    v166 = "-[NWConcrete_nw_connection_group initWithDescriptor:connection:parameters:]";
    v131 = (char *)_os_log_send_and_compose_impl();

    type[0] = OS_LOG_TYPE_ERROR;
    LOBYTE(v156) = 0;
    if (__nwlog_fault(v131, type, &v156))
    {
      if (type[0] == OS_LOG_TYPE_FAULT)
      {
        __nwlog_obj();
        v132 = objc_claimAutoreleasedReturnValue();
        v133 = type[0];
        if (os_log_type_enabled(v132, type[0]))
        {
          *(_DWORD *)buf = 136446210;
          v166 = "-[NWConcrete_nw_connection_group initWithDescriptor:connection:parameters:]";
          _os_log_impl(&dword_182FBE000, v132, v133, "%{public}s [super init] failed", buf, 0xCu);
        }
      }
      else if ((_BYTE)v156)
      {
        v138 = (char *)__nw_create_backtrace_string();
        __nwlog_obj();
        v132 = objc_claimAutoreleasedReturnValue();
        v139 = type[0];
        v140 = os_log_type_enabled(v132, type[0]);
        if (v138)
        {
          if (v140)
          {
            *(_DWORD *)buf = 136446466;
            v166 = "-[NWConcrete_nw_connection_group initWithDescriptor:connection:parameters:]";
            v167 = 2082;
            *(_QWORD *)v168 = v138;
            _os_log_impl(&dword_182FBE000, v132, v139, "%{public}s [super init] failed, dumping backtrace:%{public}s", buf, 0x16u);
          }

          free(v138);
          goto LABEL_214;
        }
        if (v140)
        {
          *(_DWORD *)buf = 136446210;
          v166 = "-[NWConcrete_nw_connection_group initWithDescriptor:connection:parameters:]";
          _os_log_impl(&dword_182FBE000, v132, v139, "%{public}s [super init] failed, no backtrace", buf, 0xCu);
        }
      }
      else
      {
        __nwlog_obj();
        v132 = objc_claimAutoreleasedReturnValue();
        v142 = type[0];
        if (os_log_type_enabled(v132, type[0]))
        {
          *(_DWORD *)buf = 136446210;
          v166 = "-[NWConcrete_nw_connection_group initWithDescriptor:connection:parameters:]";
          _os_log_impl(&dword_182FBE000, v132, v142, "%{public}s [super init] failed, backtrace limit exceeded", buf, 0xCu);
        }
      }

    }
LABEL_214:
    if (v131)
      free(v131);
    a1 = 0;
    goto LABEL_103;
  }
  __nwlog_obj();
  v128 = (void *)objc_claimAutoreleasedReturnValue();
  *(_DWORD *)buf = 136446210;
  v166 = "-[NWConcrete_nw_connection_group initWithDescriptor:connection:parameters:]";
  v15 = (char *)_os_log_send_and_compose_impl();

  type[0] = OS_LOG_TYPE_ERROR;
  LOBYTE(v156) = 0;
  if (__nwlog_fault(v15, type, &v156))
  {
    if (type[0] == OS_LOG_TYPE_FAULT)
    {
      __nwlog_obj();
      v16 = objc_claimAutoreleasedReturnValue();
      v129 = type[0];
      if (os_log_type_enabled(v16, type[0]))
      {
        *(_DWORD *)buf = 136446210;
        v166 = "-[NWConcrete_nw_connection_group initWithDescriptor:connection:parameters:]";
        _os_log_impl(&dword_182FBE000, v16, v129, "%{public}s called with null _descriptor", buf, 0xCu);
      }
      goto LABEL_100;
    }
    if (!(_BYTE)v156)
    {
      __nwlog_obj();
      v16 = objc_claimAutoreleasedReturnValue();
      v141 = type[0];
      if (os_log_type_enabled(v16, type[0]))
      {
        *(_DWORD *)buf = 136446210;
        v166 = "-[NWConcrete_nw_connection_group initWithDescriptor:connection:parameters:]";
        _os_log_impl(&dword_182FBE000, v16, v141, "%{public}s called with null _descriptor, backtrace limit exceeded", buf, 0xCu);
      }
      goto LABEL_100;
    }
    backtrace_string = (char *)__nw_create_backtrace_string();
    __nwlog_obj();
    v16 = objc_claimAutoreleasedReturnValue();
    v136 = type[0];
    v137 = os_log_type_enabled(v16, type[0]);
    if (!backtrace_string)
    {
      if (v137)
      {
        *(_DWORD *)buf = 136446210;
        v166 = "-[NWConcrete_nw_connection_group initWithDescriptor:connection:parameters:]";
        _os_log_impl(&dword_182FBE000, v16, v136, "%{public}s called with null _descriptor, no backtrace", buf, 0xCu);
      }
      goto LABEL_100;
    }
    if (v137)
    {
      *(_DWORD *)buf = 136446466;
      v166 = "-[NWConcrete_nw_connection_group initWithDescriptor:connection:parameters:]";
      v167 = 2082;
      *(_QWORD *)v168 = backtrace_string;
      _os_log_impl(&dword_182FBE000, v16, v136, "%{public}s called with null _descriptor, dumping backtrace:%{public}s", buf, 0x16u);
    }
    goto LABEL_26;
  }
LABEL_101:
  if (v15)
LABEL_102:
    free(v15);
LABEL_103:
  v77 = 0;
LABEL_144:

  return v77;
}

@end
