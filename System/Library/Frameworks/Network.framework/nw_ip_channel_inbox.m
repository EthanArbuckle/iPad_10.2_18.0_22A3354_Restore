@implementation nw_ip_channel_inbox

- (id)initWithPath:(void *)a3 flow:(void *)a4 parameters:(void *)a5 delegate:
{
  id v10;
  id v11;
  id v12;
  void *v13;
  id *v14;
  id *v15;
  int *v16;
  id *v17;
  id v18;
  id v19;
  id *v20;
  id v21;
  id v22;
  int protocol_level;
  NSObject *v24;
  const sockaddr *address;
  int sa_family;
  BOOL v27;
  id v28;
  char *v29;
  NSObject *v30;
  os_log_type_t v31;
  BOOL v32;
  _QWORD *v33;
  _DWORD *v34;
  id v35;
  id v36;
  unsigned int v37;
  NSObject *v38;
  _BOOL8 v39;
  id v40;
  id v41;
  char *v42;
  NSObject *v43;
  os_log_type_t v44;
  id v45;
  char *v46;
  os_log_type_t v47;
  _BOOL4 v48;
  char can_support_user_packet_pool;
  char v50;
  _QWORD *v51;
  uint64_t v52;
  int v53;
  id v54;
  uint64_t protocol_handler;
  _DWORD *v56;
  NSObject *v57;
  char *v58;
  id v59;
  char *v60;
  NSObject *v61;
  os_log_type_t v62;
  const char *v63;
  char *v64;
  NSObject *v65;
  os_log_type_t v66;
  id v67;
  os_log_type_t v68;
  char *v69;
  os_log_type_t v70;
  _BOOL4 v71;
  os_log_type_t v72;
  id v73;
  os_log_type_t v74;
  id v75;
  os_log_type_t v76;
  void *v78;
  char *v79;
  NSObject *v80;
  os_log_type_t v81;
  void *v82;
  char *v83;
  NSObject *v84;
  os_log_type_t v85;
  void *v86;
  char *v87;
  NSObject *v88;
  os_log_type_t v89;
  void *v90;
  char *v91;
  NSObject *v92;
  os_log_type_t v93;
  char *backtrace_string;
  os_log_type_t v95;
  _BOOL4 v96;
  char *v97;
  os_log_type_t v98;
  _BOOL4 v99;
  char *v100;
  os_log_type_t v101;
  _BOOL4 v102;
  char *v103;
  os_log_type_t v104;
  _BOOL4 v105;
  void *v106;
  id v107;
  char *v108;
  NSObject *v109;
  os_log_type_t v110;
  id v111;
  const char *v112;
  NSObject *v113;
  os_log_type_t v114;
  const char *v115;
  const char *v116;
  char *v117;
  os_log_type_t v118;
  _BOOL4 v119;
  id v120;
  os_log_type_t v121;
  os_log_type_t v122;
  os_log_type_t v123;
  os_log_type_t v124;
  char *v125;
  _BOOL4 v126;
  const char *v127;
  _BOOL4 v128;
  os_log_type_t v129;
  id v130;
  id v131;
  char *v132;
  void *v133;
  id v134;
  objc_super v135;
  char v136;
  _BYTE buf[22];
  __int16 v138;
  char *v139;
  os_log_type_t uu[24];
  uint64_t v141;

  v141 = *MEMORY[0x1E0C80C00];
  v10 = a2;
  v11 = a3;
  v134 = a4;
  v12 = a5;
  v13 = v12;
  v133 = v10;
  if (!a1)
    goto LABEL_103;
  if (!v10)
  {
    __nwlog_obj();
    v78 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 136446210;
    *(_QWORD *)&buf[4] = "-[nw_ip_channel_inbox initWithPath:flow:parameters:delegate:]";
    v79 = (char *)_os_log_send_and_compose_impl();

    uu[0] = OS_LOG_TYPE_ERROR;
    v136 = 0;
    if (__nwlog_fault(v79, uu, &v136))
    {
      if (uu[0] == OS_LOG_TYPE_FAULT)
      {
        __nwlog_obj();
        v80 = objc_claimAutoreleasedReturnValue();
        v81 = uu[0];
        if (os_log_type_enabled(v80, uu[0]))
        {
          *(_DWORD *)buf = 136446210;
          *(_QWORD *)&buf[4] = "-[nw_ip_channel_inbox initWithPath:flow:parameters:delegate:]";
          _os_log_impl(&dword_182FBE000, v80, v81, "%{public}s called with null path", buf, 0xCu);
        }
      }
      else if (v136)
      {
        backtrace_string = (char *)__nw_create_backtrace_string();
        __nwlog_obj();
        v80 = objc_claimAutoreleasedReturnValue();
        v95 = uu[0];
        v96 = os_log_type_enabled(v80, uu[0]);
        if (backtrace_string)
        {
          if (v96)
          {
            *(_DWORD *)buf = 136446466;
            *(_QWORD *)&buf[4] = "-[nw_ip_channel_inbox initWithPath:flow:parameters:delegate:]";
            *(_WORD *)&buf[12] = 2082;
            *(_QWORD *)&buf[14] = backtrace_string;
            _os_log_impl(&dword_182FBE000, v80, v95, "%{public}s called with null path, dumping backtrace:%{public}s", buf, 0x16u);
          }

          free(backtrace_string);
          goto LABEL_188;
        }
        if (v96)
        {
          *(_DWORD *)buf = 136446210;
          *(_QWORD *)&buf[4] = "-[nw_ip_channel_inbox initWithPath:flow:parameters:delegate:]";
          _os_log_impl(&dword_182FBE000, v80, v95, "%{public}s called with null path, no backtrace", buf, 0xCu);
        }
      }
      else
      {
        __nwlog_obj();
        v80 = objc_claimAutoreleasedReturnValue();
        v121 = uu[0];
        if (os_log_type_enabled(v80, uu[0]))
        {
          *(_DWORD *)buf = 136446210;
          *(_QWORD *)&buf[4] = "-[nw_ip_channel_inbox initWithPath:flow:parameters:delegate:]";
          _os_log_impl(&dword_182FBE000, v80, v121, "%{public}s called with null path, backtrace limit exceeded", buf, 0xCu);
        }
      }

    }
LABEL_188:
    if (v79)
      free(v79);
    goto LABEL_208;
  }
  if (!v11)
  {
    __nwlog_obj();
    v82 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 136446210;
    *(_QWORD *)&buf[4] = "-[nw_ip_channel_inbox initWithPath:flow:parameters:delegate:]";
    v83 = (char *)_os_log_send_and_compose_impl();

    uu[0] = OS_LOG_TYPE_ERROR;
    v136 = 0;
    if (__nwlog_fault(v83, uu, &v136))
    {
      if (uu[0] == OS_LOG_TYPE_FAULT)
      {
        __nwlog_obj();
        v84 = objc_claimAutoreleasedReturnValue();
        v85 = uu[0];
        if (os_log_type_enabled(v84, uu[0]))
        {
          *(_DWORD *)buf = 136446210;
          *(_QWORD *)&buf[4] = "-[nw_ip_channel_inbox initWithPath:flow:parameters:delegate:]";
          _os_log_impl(&dword_182FBE000, v84, v85, "%{public}s called with null flow", buf, 0xCu);
        }
      }
      else if (v136)
      {
        v97 = (char *)__nw_create_backtrace_string();
        __nwlog_obj();
        v84 = objc_claimAutoreleasedReturnValue();
        v98 = uu[0];
        v99 = os_log_type_enabled(v84, uu[0]);
        if (v97)
        {
          if (v99)
          {
            *(_DWORD *)buf = 136446466;
            *(_QWORD *)&buf[4] = "-[nw_ip_channel_inbox initWithPath:flow:parameters:delegate:]";
            *(_WORD *)&buf[12] = 2082;
            *(_QWORD *)&buf[14] = v97;
            _os_log_impl(&dword_182FBE000, v84, v98, "%{public}s called with null flow, dumping backtrace:%{public}s", buf, 0x16u);
          }

          free(v97);
          goto LABEL_194;
        }
        if (v99)
        {
          *(_DWORD *)buf = 136446210;
          *(_QWORD *)&buf[4] = "-[nw_ip_channel_inbox initWithPath:flow:parameters:delegate:]";
          _os_log_impl(&dword_182FBE000, v84, v98, "%{public}s called with null flow, no backtrace", buf, 0xCu);
        }
      }
      else
      {
        __nwlog_obj();
        v84 = objc_claimAutoreleasedReturnValue();
        v122 = uu[0];
        if (os_log_type_enabled(v84, uu[0]))
        {
          *(_DWORD *)buf = 136446210;
          *(_QWORD *)&buf[4] = "-[nw_ip_channel_inbox initWithPath:flow:parameters:delegate:]";
          _os_log_impl(&dword_182FBE000, v84, v122, "%{public}s called with null flow, backtrace limit exceeded", buf, 0xCu);
        }
      }

    }
LABEL_194:
    if (v83)
      free(v83);
    goto LABEL_208;
  }
  if (!v134)
  {
    __nwlog_obj();
    v86 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 136446210;
    *(_QWORD *)&buf[4] = "-[nw_ip_channel_inbox initWithPath:flow:parameters:delegate:]";
    v87 = (char *)_os_log_send_and_compose_impl();

    uu[0] = OS_LOG_TYPE_ERROR;
    v136 = 0;
    if (__nwlog_fault(v87, uu, &v136))
    {
      if (uu[0] == OS_LOG_TYPE_FAULT)
      {
        __nwlog_obj();
        v88 = objc_claimAutoreleasedReturnValue();
        v89 = uu[0];
        if (os_log_type_enabled(v88, uu[0]))
        {
          *(_DWORD *)buf = 136446210;
          *(_QWORD *)&buf[4] = "-[nw_ip_channel_inbox initWithPath:flow:parameters:delegate:]";
          _os_log_impl(&dword_182FBE000, v88, v89, "%{public}s called with null parameters", buf, 0xCu);
        }
      }
      else if (v136)
      {
        v100 = (char *)__nw_create_backtrace_string();
        __nwlog_obj();
        v88 = objc_claimAutoreleasedReturnValue();
        v101 = uu[0];
        v102 = os_log_type_enabled(v88, uu[0]);
        if (v100)
        {
          if (v102)
          {
            *(_DWORD *)buf = 136446466;
            *(_QWORD *)&buf[4] = "-[nw_ip_channel_inbox initWithPath:flow:parameters:delegate:]";
            *(_WORD *)&buf[12] = 2082;
            *(_QWORD *)&buf[14] = v100;
            _os_log_impl(&dword_182FBE000, v88, v101, "%{public}s called with null parameters, dumping backtrace:%{public}s", buf, 0x16u);
          }

          free(v100);
          goto LABEL_200;
        }
        if (v102)
        {
          *(_DWORD *)buf = 136446210;
          *(_QWORD *)&buf[4] = "-[nw_ip_channel_inbox initWithPath:flow:parameters:delegate:]";
          _os_log_impl(&dword_182FBE000, v88, v101, "%{public}s called with null parameters, no backtrace", buf, 0xCu);
        }
      }
      else
      {
        __nwlog_obj();
        v88 = objc_claimAutoreleasedReturnValue();
        v123 = uu[0];
        if (os_log_type_enabled(v88, uu[0]))
        {
          *(_DWORD *)buf = 136446210;
          *(_QWORD *)&buf[4] = "-[nw_ip_channel_inbox initWithPath:flow:parameters:delegate:]";
          _os_log_impl(&dword_182FBE000, v88, v123, "%{public}s called with null parameters, backtrace limit exceeded", buf, 0xCu);
        }
      }

    }
LABEL_200:
    if (v87)
      free(v87);
    goto LABEL_208;
  }
  if (!v12)
  {
    __nwlog_obj();
    v90 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 136446210;
    *(_QWORD *)&buf[4] = "-[nw_ip_channel_inbox initWithPath:flow:parameters:delegate:]";
    v91 = (char *)_os_log_send_and_compose_impl();

    uu[0] = OS_LOG_TYPE_ERROR;
    v136 = 0;
    if (__nwlog_fault(v91, uu, &v136))
    {
      if (uu[0] == OS_LOG_TYPE_FAULT)
      {
        __nwlog_obj();
        v92 = objc_claimAutoreleasedReturnValue();
        v93 = uu[0];
        if (os_log_type_enabled(v92, uu[0]))
        {
          *(_DWORD *)buf = 136446210;
          *(_QWORD *)&buf[4] = "-[nw_ip_channel_inbox initWithPath:flow:parameters:delegate:]";
          _os_log_impl(&dword_182FBE000, v92, v93, "%{public}s called with null delegate", buf, 0xCu);
        }
      }
      else if (v136)
      {
        v103 = (char *)__nw_create_backtrace_string();
        __nwlog_obj();
        v92 = objc_claimAutoreleasedReturnValue();
        v104 = uu[0];
        v105 = os_log_type_enabled(v92, uu[0]);
        if (v103)
        {
          if (v105)
          {
            *(_DWORD *)buf = 136446466;
            *(_QWORD *)&buf[4] = "-[nw_ip_channel_inbox initWithPath:flow:parameters:delegate:]";
            *(_WORD *)&buf[12] = 2082;
            *(_QWORD *)&buf[14] = v103;
            _os_log_impl(&dword_182FBE000, v92, v104, "%{public}s called with null delegate, dumping backtrace:%{public}s", buf, 0x16u);
          }

          free(v103);
          goto LABEL_206;
        }
        if (v105)
        {
          *(_DWORD *)buf = 136446210;
          *(_QWORD *)&buf[4] = "-[nw_ip_channel_inbox initWithPath:flow:parameters:delegate:]";
          _os_log_impl(&dword_182FBE000, v92, v104, "%{public}s called with null delegate, no backtrace", buf, 0xCu);
        }
      }
      else
      {
        __nwlog_obj();
        v92 = objc_claimAutoreleasedReturnValue();
        v124 = uu[0];
        if (os_log_type_enabled(v92, uu[0]))
        {
          *(_DWORD *)buf = 136446210;
          *(_QWORD *)&buf[4] = "-[nw_ip_channel_inbox initWithPath:flow:parameters:delegate:]";
          _os_log_impl(&dword_182FBE000, v92, v124, "%{public}s called with null delegate, backtrace limit exceeded", buf, 0xCu);
        }
      }

    }
LABEL_206:
    if (v91)
      free(v91);
LABEL_208:

    goto LABEL_102;
  }
  v135.receiver = a1;
  v135.super_class = (Class)nw_ip_channel_inbox;
  v14 = (id *)objc_msgSendSuper2(&v135, sel_initWithDelegate_, v12);
  a1 = v14;
  if (!v14)
    goto LABEL_103;
  v15 = v14;
  objc_storeStrong(v14 + 8, a2);
  v16 = &OBJC_IVAR___NWURLLoaderData__URL;
  objc_storeStrong(a1 + 9, a3);
  objc_storeStrong(a1 + 6, a4);
  v17 = (id *)v11;
  v18 = v17[2];

  v19 = a1[5];
  a1[5] = v18;

  v20 = v17;
  v21 = v20[4];

  v22 = a1[4];
  a1[4] = v21;

  if (!a1[4])
  {
    pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
    networkd_settings_init();
    v28 = (id)gLogObj;
    *(_DWORD *)buf = 136446466;
    *(_QWORD *)&buf[4] = "-[nw_ip_channel_inbox initWithPath:flow:parameters:delegate:]";
    *(_WORD *)&buf[12] = 2114;
    *(_QWORD *)&buf[14] = v20;
    v29 = (char *)_os_log_send_and_compose_impl();

    uu[0] = OS_LOG_TYPE_ERROR;
    v136 = 0;
    if (__nwlog_fault(v29, uu, &v136))
    {
      if (uu[0] == OS_LOG_TYPE_FAULT)
      {
        pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
        networkd_settings_init();
        v30 = (id)gLogObj;
        v31 = uu[0];
        if (os_log_type_enabled(v30, uu[0]))
        {
          *(_DWORD *)buf = 136446466;
          *(_QWORD *)&buf[4] = "-[nw_ip_channel_inbox initWithPath:flow:parameters:delegate:]";
          *(_WORD *)&buf[12] = 2114;
          *(_QWORD *)&buf[14] = v20;
          _os_log_impl(&dword_182FBE000, v30, v31, "%{public}s flow (%{public}@) does not specify local endpoint", buf, 0x16u);
        }
      }
      else if (v136)
      {
        v46 = (char *)__nw_create_backtrace_string();
        pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
        networkd_settings_init();
        v30 = (id)gLogObj;
        v47 = uu[0];
        v48 = os_log_type_enabled(v30, uu[0]);
        if (v46)
        {
          if (v48)
          {
            *(_DWORD *)buf = 136446722;
            *(_QWORD *)&buf[4] = "-[nw_ip_channel_inbox initWithPath:flow:parameters:delegate:]";
            *(_WORD *)&buf[12] = 2114;
            *(_QWORD *)&buf[14] = v20;
            v138 = 2082;
            v139 = v46;
            _os_log_impl(&dword_182FBE000, v30, v47, "%{public}s flow (%{public}@) does not specify local endpoint, dumping backtrace:%{public}s", buf, 0x20u);
          }

          free(v46);
          if (!v29)
            goto LABEL_101;
          goto LABEL_82;
        }
        if (v48)
        {
          *(_DWORD *)buf = 136446466;
          *(_QWORD *)&buf[4] = "-[nw_ip_channel_inbox initWithPath:flow:parameters:delegate:]";
          *(_WORD *)&buf[12] = 2114;
          *(_QWORD *)&buf[14] = v20;
          _os_log_impl(&dword_182FBE000, v30, v47, "%{public}s flow (%{public}@) does not specify local endpoint, no backtrace", buf, 0x16u);
        }
      }
      else
      {
        pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
        networkd_settings_init();
        v30 = (id)gLogObj;
        v68 = uu[0];
        if (os_log_type_enabled(v30, uu[0]))
        {
          *(_DWORD *)buf = 136446466;
          *(_QWORD *)&buf[4] = "-[nw_ip_channel_inbox initWithPath:flow:parameters:delegate:]";
          *(_WORD *)&buf[12] = 2114;
          *(_QWORD *)&buf[14] = v20;
          _os_log_impl(&dword_182FBE000, v30, v68, "%{public}s flow (%{public}@) does not specify local endpoint, backtrace limit exceeded", buf, 0x16u);
        }
      }

    }
    if (!v29)
      goto LABEL_101;
LABEL_82:
    free(v29);
    goto LABEL_101;
  }
  protocol_level = nw_path_flow_get_protocol_level(v20);
  *((_DWORD *)a1 + 14) = protocol_level;
  if (!protocol_level)
  {
    pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
    networkd_settings_init();
    v24 = (id)gLogObj;
    if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136446210;
      *(_QWORD *)&buf[4] = "-[nw_ip_channel_inbox initWithPath:flow:parameters:delegate:]";
      _os_log_impl(&dword_182FBE000, v24, OS_LOG_TYPE_ERROR, "%{public}s flow level undefined, using internet-level", buf, 0xCu);
    }

    *((_DWORD *)a1 + 14) = 2;
  }
  address = nw_endpoint_get_address((nw_endpoint_t)a1[4]);
  a1[19] = (id)address;
  if (!address)
  {
    __nwlog_obj();
    v106 = (void *)objc_claimAutoreleasedReturnValue();
    v107 = a1[4];
    *(_DWORD *)buf = 136446466;
    *(_QWORD *)&buf[4] = "-[nw_ip_channel_inbox initWithPath:flow:parameters:delegate:]";
    *(_WORD *)&buf[12] = 2112;
    *(_QWORD *)&buf[14] = v107;
    v108 = (char *)_os_log_send_and_compose_impl();

    uu[0] = OS_LOG_TYPE_ERROR;
    v136 = 0;
    if (__nwlog_fault(v108, uu, &v136))
    {
      if (uu[0] == OS_LOG_TYPE_FAULT)
      {
        __nwlog_obj();
        v109 = objc_claimAutoreleasedReturnValue();
        v110 = uu[0];
        if (os_log_type_enabled(v109, uu[0]))
        {
          v111 = v15[4];
          *(_DWORD *)buf = 136446466;
          *(_QWORD *)&buf[4] = "-[nw_ip_channel_inbox initWithPath:flow:parameters:delegate:]";
          *(_WORD *)&buf[12] = 2112;
          *(_QWORD *)&buf[14] = v111;
          _os_log_impl(&dword_182FBE000, v109, v110, "%{public}s endpoint %@ is not an address", buf, 0x16u);
        }
      }
      else if (v136)
      {
        v117 = (char *)__nw_create_backtrace_string();
        __nwlog_obj();
        v109 = objc_claimAutoreleasedReturnValue();
        v118 = uu[0];
        v119 = os_log_type_enabled(v109, uu[0]);
        if (v117)
        {
          if (v119)
          {
            v120 = v15[4];
            *(_DWORD *)buf = 136446722;
            *(_QWORD *)&buf[4] = "-[nw_ip_channel_inbox initWithPath:flow:parameters:delegate:]";
            *(_WORD *)&buf[12] = 2112;
            *(_QWORD *)&buf[14] = v120;
            v138 = 2082;
            v139 = v117;
            _os_log_impl(&dword_182FBE000, v109, v118, "%{public}s endpoint %@ is not an address, dumping backtrace:%{public}s", buf, 0x20u);
          }

          free(v117);
          goto LABEL_219;
        }
        if (v119)
        {
          v131 = v15[4];
          *(_DWORD *)buf = 136446466;
          *(_QWORD *)&buf[4] = "-[nw_ip_channel_inbox initWithPath:flow:parameters:delegate:]";
          *(_WORD *)&buf[12] = 2112;
          *(_QWORD *)&buf[14] = v131;
          _os_log_impl(&dword_182FBE000, v109, v118, "%{public}s endpoint %@ is not an address, no backtrace", buf, 0x16u);
        }
      }
      else
      {
        __nwlog_obj();
        v109 = objc_claimAutoreleasedReturnValue();
        v129 = uu[0];
        if (os_log_type_enabled(v109, uu[0]))
        {
          v130 = v15[4];
          *(_DWORD *)buf = 136446466;
          *(_QWORD *)&buf[4] = "-[nw_ip_channel_inbox initWithPath:flow:parameters:delegate:]";
          *(_WORD *)&buf[12] = 2112;
          *(_QWORD *)&buf[14] = v130;
          _os_log_impl(&dword_182FBE000, v109, v129, "%{public}s endpoint %@ is not an address, backtrace limit exceeded", buf, 0x16u);
        }
      }

    }
LABEL_219:
    if (v108)
      free(v108);
    goto LABEL_101;
  }
  sa_family = address->sa_family;
  if (sa_family != 30)
  {
    if (sa_family == 2)
    {
      v27 = *(_DWORD *)&address->sa_data[2] != 0;
      goto LABEL_26;
    }
    pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
    networkd_settings_init();
    v40 = (id)gLogObj;
    v41 = a1[4];
    *(_DWORD *)buf = 136446466;
    *(_QWORD *)&buf[4] = "-[nw_ip_channel_inbox initWithPath:flow:parameters:delegate:]";
    *(_WORD *)&buf[12] = 2112;
    *(_QWORD *)&buf[14] = v41;
    v42 = (char *)_os_log_send_and_compose_impl();

    uu[0] = OS_LOG_TYPE_ERROR;
    v136 = 0;
    if (__nwlog_fault(v42, uu, &v136))
    {
      if (uu[0] == OS_LOG_TYPE_FAULT)
      {
        pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
        networkd_settings_init();
        v43 = (id)gLogObj;
        v44 = uu[0];
        if (os_log_type_enabled(v43, uu[0]))
        {
          v45 = v15[4];
          *(_DWORD *)buf = 136446466;
          *(_QWORD *)&buf[4] = "-[nw_ip_channel_inbox initWithPath:flow:parameters:delegate:]";
          *(_WORD *)&buf[12] = 2112;
          *(_QWORD *)&buf[14] = v45;
          _os_log_impl(&dword_182FBE000, v43, v44, "%{public}s endpoint %@ is not IPv4 or IPv6 address", buf, 0x16u);
        }
      }
      else if (v136)
      {
        v63 = __nw_create_backtrace_string();
        if (v63)
        {
          v64 = (char *)v63;
          pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
          networkd_settings_init();
          v65 = (id)gLogObj;
          v66 = uu[0];
          if (os_log_type_enabled(v65, uu[0]))
          {
            v67 = v15[4];
            *(_DWORD *)buf = 136446722;
            *(_QWORD *)&buf[4] = "-[nw_ip_channel_inbox initWithPath:flow:parameters:delegate:]";
            *(_WORD *)&buf[12] = 2112;
            *(_QWORD *)&buf[14] = v67;
            v138 = 2082;
            v139 = v64;
            _os_log_impl(&dword_182FBE000, v65, v66, "%{public}s endpoint %@ is not IPv4 or IPv6 address, dumping backtrace:%{public}s", buf, 0x20u);
          }

          free(v64);
          if (!v42)
            goto LABEL_101;
          goto LABEL_91;
        }
        __nwlog_obj();
        v43 = objc_claimAutoreleasedReturnValue();
        v74 = uu[0];
        if (os_log_type_enabled(v43, uu[0]))
        {
          v75 = v15[4];
          *(_DWORD *)buf = 136446466;
          *(_QWORD *)&buf[4] = "-[nw_ip_channel_inbox initWithPath:flow:parameters:delegate:]";
          *(_WORD *)&buf[12] = 2112;
          *(_QWORD *)&buf[14] = v75;
          _os_log_impl(&dword_182FBE000, v43, v74, "%{public}s endpoint %@ is not IPv4 or IPv6 address, no backtrace", buf, 0x16u);
        }
      }
      else
      {
        pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
        networkd_settings_init();
        v43 = (id)gLogObj;
        v72 = uu[0];
        if (os_log_type_enabled(v43, uu[0]))
        {
          v73 = v15[4];
          *(_DWORD *)buf = 136446466;
          *(_QWORD *)&buf[4] = "-[nw_ip_channel_inbox initWithPath:flow:parameters:delegate:]";
          *(_WORD *)&buf[12] = 2112;
          *(_QWORD *)&buf[14] = v73;
          _os_log_impl(&dword_182FBE000, v43, v72, "%{public}s endpoint %@ is not IPv4 or IPv6 address, backtrace limit exceeded", buf, 0x16u);
        }
      }

    }
    if (!v42)
      goto LABEL_101;
LABEL_91:
    free(v42);
    goto LABEL_101;
  }
  v32 = !*(_DWORD *)&address->sa_data[6]
     && !*(_DWORD *)&address->sa_data[10]
     && !*(_DWORD *)&address[1].sa_len
     && *(_DWORD *)&address[1].sa_data[2] == 0;
  v27 = !v32;
LABEL_26:
  *((_BYTE *)a1 + 167) = *((_BYTE *)a1 + 167) & 0xFE | v27;
  *((_WORD *)a1 + 82) = *((_WORD *)a1[19] + 1);
  v33 = v134;
  v34 = *(id *)(v33[13] + 136);

  if (!v34)
  {
    __nwlog_obj();
    *(_DWORD *)buf = 136446210;
    *(_QWORD *)&buf[4] = "nw_channel_create_with_nexus_flow";
    v112 = (const char *)_os_log_send_and_compose_impl();
    uu[0] = OS_LOG_TYPE_ERROR;
    v136 = 0;
    v132 = (char *)v112;
    if (!__nwlog_fault(v112, uu, &v136))
      goto LABEL_227;
    if (uu[0] != OS_LOG_TYPE_FAULT)
    {
      if (!v136)
      {
        v113 = __nwlog_obj();
        v114 = uu[0];
        if (!os_log_type_enabled(v113, uu[0]))
          goto LABEL_227;
        *(_DWORD *)buf = 136446210;
        *(_QWORD *)&buf[4] = "nw_channel_create_with_nexus_flow";
        v115 = "%{public}s called with null context, backtrace limit exceeded";
        goto LABEL_226;
      }
      v125 = (char *)__nw_create_backtrace_string();
      v113 = __nwlog_obj();
      v114 = uu[0];
      v126 = os_log_type_enabled(v113, uu[0]);
      if (!v125)
      {
        v16 = &OBJC_IVAR___NWURLLoaderData__URL;
        if (!v126)
          goto LABEL_227;
        *(_DWORD *)buf = 136446210;
        *(_QWORD *)&buf[4] = "nw_channel_create_with_nexus_flow";
        v115 = "%{public}s called with null context, no backtrace";
        goto LABEL_226;
      }
      if (v126)
      {
        *(_DWORD *)buf = 136446466;
        *(_QWORD *)&buf[4] = "nw_channel_create_with_nexus_flow";
        *(_WORD *)&buf[12] = 2082;
        *(_QWORD *)&buf[14] = v125;
        v127 = "%{public}s called with null context, dumping backtrace:%{public}s";
LABEL_183:
        _os_log_impl(&dword_182FBE000, v113, v114, v127, buf, 0x16u);
      }
LABEL_184:
      free(v125);
      v16 = &OBJC_IVAR___NWURLLoaderData__URL;
      goto LABEL_227;
    }
    v113 = __nwlog_obj();
    v114 = uu[0];
    if (!os_log_type_enabled(v113, uu[0]))
      goto LABEL_227;
    *(_DWORD *)buf = 136446210;
    *(_QWORD *)&buf[4] = "nw_channel_create_with_nexus_flow";
    v115 = "%{public}s called with null context";
LABEL_226:
    _os_log_impl(&dword_182FBE000, v113, v114, v115, buf, 0xCu);
LABEL_227:
    if (v132)
      free(v132);
    goto LABEL_31;
  }
  v35 = a1[9];
  if (!v35)
  {
    __nwlog_obj();
    *(_DWORD *)buf = 136446210;
    *(_QWORD *)&buf[4] = "nw_channel_create_with_nexus_flow";
    v116 = (const char *)_os_log_send_and_compose_impl();
    uu[0] = OS_LOG_TYPE_ERROR;
    v136 = 0;
    v132 = (char *)v116;
    if (!__nwlog_fault(v116, uu, &v136))
      goto LABEL_227;
    if (uu[0] == OS_LOG_TYPE_FAULT)
    {
      v113 = __nwlog_obj();
      v114 = uu[0];
      if (!os_log_type_enabled(v113, uu[0]))
        goto LABEL_227;
      *(_DWORD *)buf = 136446210;
      *(_QWORD *)&buf[4] = "nw_channel_create_with_nexus_flow";
      v115 = "%{public}s called with null flow";
      goto LABEL_226;
    }
    if (!v136)
    {
      v113 = __nwlog_obj();
      v114 = uu[0];
      if (!os_log_type_enabled(v113, uu[0]))
        goto LABEL_227;
      *(_DWORD *)buf = 136446210;
      *(_QWORD *)&buf[4] = "nw_channel_create_with_nexus_flow";
      v115 = "%{public}s called with null flow, backtrace limit exceeded";
      goto LABEL_226;
    }
    v125 = (char *)__nw_create_backtrace_string();
    v113 = __nwlog_obj();
    v114 = uu[0];
    v128 = os_log_type_enabled(v113, uu[0]);
    if (v125)
    {
      if (v128)
      {
        *(_DWORD *)buf = 136446466;
        *(_QWORD *)&buf[4] = "nw_channel_create_with_nexus_flow";
        *(_WORD *)&buf[12] = 2082;
        *(_QWORD *)&buf[14] = v125;
        v127 = "%{public}s called with null flow, dumping backtrace:%{public}s";
        goto LABEL_183;
      }
      goto LABEL_184;
    }
    v16 = &OBJC_IVAR___NWURLLoaderData__URL;
    if (!v128)
      goto LABEL_227;
    *(_DWORD *)buf = 136446210;
    *(_QWORD *)&buf[4] = "nw_channel_create_with_nexus_flow";
    v115 = "%{public}s called with null flow, no backtrace";
    goto LABEL_226;
  }
  memset(uu, 0, 16);
  v36 = v35;
  v37 = *((_DWORD *)v36 + 42);
  if (uuid_is_null((const unsigned __int8 *)v36 + 128))
  {

    v16 = &OBJC_IVAR___NWURLLoaderData__URL;
    pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
    networkd_settings_init();
    v38 = gLogObj;
    if (os_log_type_enabled((os_log_t)gLogObj, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136446466;
      *(_QWORD *)&buf[4] = "nw_channel_create_with_nexus_flow";
      *(_WORD *)&buf[12] = 2114;
      *(_QWORD *)&buf[14] = v36;
      _os_log_impl(&dword_182FBE000, v38, OS_LOG_TYPE_ERROR, "%{public}s nw_path_flow_get_nexus_instance for %{public}@ returned false", buf, 0x16u);
    }
LABEL_31:
    v39 = 0;
    goto LABEL_50;
  }
  *(_OWORD *)uu = *((_OWORD *)v36 + 8);

  *(_QWORD *)buf = 0;
  *(_QWORD *)&buf[8] = 0;
  can_support_user_packet_pool = nw_path_flow_nexus_can_support_user_packet_pool(v36);
  if (nw_path_flow_nexus_should_use_event_ring(v36))
    v50 = 2;
  else
    v50 = 0;
  buf[12] = v50 | can_support_user_packet_pool;
  v51 = v36;
  v52 = v51[1];
  if (!v52 || (v53 = *((_DWORD *)v51 + 40)) == 0)
  {
    v53 = 0;
    v52 = 0;
  }
  *(_DWORD *)&buf[8] = v53;

  v16 = &OBJC_IVAR___NWURLLoaderData__URL;
  *(_QWORD *)buf = v52;
  v39 = nw_channel_create_with_attributes(v34, (unsigned __int8 *)uu, v37, (uint64_t)buf);
LABEL_50:
  v54 = a1[10];
  a1[10] = (id)v39;

  if (!a1[10])
  {
    pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
    networkd_settings_init();
    v57 = (id)gLogObj;
    if (os_log_type_enabled(v57, OS_LOG_TYPE_ERROR))
    {
      v58 = *(char **)((char *)v15 + v16[970]);
      *(_DWORD *)buf = 136446722;
      *(_QWORD *)&buf[4] = "-[nw_ip_channel_inbox initWithPath:flow:parameters:delegate:]";
      *(_WORD *)&buf[12] = 2114;
      *(_QWORD *)&buf[14] = v13;
      v138 = 2114;
      v139 = v58;
      _os_log_impl(&dword_182FBE000, v57, OS_LOG_TYPE_ERROR, "%{public}s %{public}@ nw_channel_create_with_nexus_flow for %{public}@ failed", buf, 0x20u);
    }

    goto LABEL_102;
  }
  a1[13] = nw_ip_channel_inbox_protocol_identifier;
  a1[14] = &nw_ip_channel_inbox_protocol_callbacks;
  a1[16] = a1;
  nw_path_flow_get_id(*(id *)((char *)a1 + v16[970]), a1 + 11);
  nw_channel_set_close_automatically((uint64_t)a1[10], 1);
  nw_channel_set_defer_input_available((uint64_t)a1[10], 1);
  nw_channel_set_protocol_level((uint64_t)a1[10], *((_DWORD *)a1 + 14));
  protocol_handler = nw_channel_get_protocol_handler((uint64_t)a1[10]);
  if (((**(uint64_t (***)(uint64_t, uint64_t))(protocol_handler + 24))(protocol_handler, (uint64_t)(a1 + 11)) & 1) == 0)
  {
    pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
    networkd_settings_init();
    v59 = (id)gLogObj;
    *(_DWORD *)buf = 136446210;
    *(_QWORD *)&buf[4] = "-[nw_ip_channel_inbox initWithPath:flow:parameters:delegate:]";
    v60 = (char *)_os_log_send_and_compose_impl();

    uu[0] = OS_LOG_TYPE_ERROR;
    v136 = 0;
    if (__nwlog_fault(v60, uu, &v136))
    {
      if (uu[0] == OS_LOG_TYPE_FAULT)
      {
        pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
        networkd_settings_init();
        v61 = (id)gLogObj;
        v62 = uu[0];
        if (os_log_type_enabled(v61, uu[0]))
        {
          *(_DWORD *)buf = 136446210;
          *(_QWORD *)&buf[4] = "-[nw_ip_channel_inbox initWithPath:flow:parameters:delegate:]";
          _os_log_impl(&dword_182FBE000, v61, v62, "%{public}s channel protocol add_input_handler failed", buf, 0xCu);
        }
      }
      else if (v136)
      {
        v69 = (char *)__nw_create_backtrace_string();
        __nwlog_obj();
        v61 = objc_claimAutoreleasedReturnValue();
        v70 = uu[0];
        v71 = os_log_type_enabled(v61, uu[0]);
        if (v69)
        {
          if (v71)
          {
            *(_DWORD *)buf = 136446466;
            *(_QWORD *)&buf[4] = "-[nw_ip_channel_inbox initWithPath:flow:parameters:delegate:]";
            *(_WORD *)&buf[12] = 2082;
            *(_QWORD *)&buf[14] = v69;
            _os_log_impl(&dword_182FBE000, v61, v70, "%{public}s channel protocol add_input_handler failed, dumping backtrace:%{public}s", buf, 0x16u);
          }

          free(v69);
          if (!v60)
            goto LABEL_101;
          goto LABEL_100;
        }
        if (v71)
        {
          *(_DWORD *)buf = 136446210;
          *(_QWORD *)&buf[4] = "-[nw_ip_channel_inbox initWithPath:flow:parameters:delegate:]";
          _os_log_impl(&dword_182FBE000, v61, v70, "%{public}s channel protocol add_input_handler failed, no backtrace", buf, 0xCu);
        }
      }
      else
      {
        __nwlog_obj();
        v61 = objc_claimAutoreleasedReturnValue();
        v76 = uu[0];
        if (os_log_type_enabled(v61, uu[0]))
        {
          *(_DWORD *)buf = 136446210;
          *(_QWORD *)&buf[4] = "-[nw_ip_channel_inbox initWithPath:flow:parameters:delegate:]";
          _os_log_impl(&dword_182FBE000, v61, v76, "%{public}s channel protocol add_input_handler failed, backtrace limit exceeded", buf, 0xCu);
        }
      }

    }
    if (!v60)
    {
LABEL_101:

LABEL_102:
      a1 = 0;
      goto LABEL_103;
    }
LABEL_100:
    free(v60);
    goto LABEL_101;
  }
  (*(void (**)(uint64_t, char *))(*(_QWORD *)(protocol_handler + 24) + 24))(protocol_handler, (char *)a1 + 88);
  *((_BYTE *)a1 + 166) = nw_parameters_get_ip_protocol(v33);
  v56 = a1[5];
  if (v56)
    LODWORD(v56) = v56[2];
  *((_DWORD *)a1 + 40) = (_DWORD)v56;
  a1 = a1;
  a1[16] = a1;
LABEL_103:

  return a1;
}

- (id)description
{
  os_unfair_lock_s *p_lock;
  id v3;
  _QWORD v5[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  uint64_t (*v9)(uint64_t, uint64_t);
  void (*v10)(uint64_t);
  id v11;

  v6 = 0;
  v7 = &v6;
  v8 = 0x3032000000;
  v9 = __Block_byref_object_copy__51996;
  v10 = __Block_byref_object_dispose__51997;
  v11 = 0;
  p_lock = &self->super._lock;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __34__nw_ip_channel_inbox_description__block_invoke;
  v5[3] = &unk_1E14ACE40;
  v5[4] = self;
  v5[5] = &v6;
  os_unfair_lock_lock(&self->super._lock);
  __34__nw_ip_channel_inbox_description__block_invoke((uint64_t)v5);
  os_unfair_lock_unlock(p_lock);
  v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return v3;
}

- (BOOL)cancel
{
  nw_protocol *p_protocol;
  nw_protocol *output_handler;
  void *handle;

  p_protocol = &self->_protocol;
  output_handler = self->_protocol.output_handler;
  if (output_handler)
    ((void (*)(void))output_handler->callbacks->remove_input_handler)();
  handle = p_protocol->handle;
  if (handle)
  {
    p_protocol->handle = 0;

  }
  return 0;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_channel, 0);
  objc_storeStrong((id *)&self->_flow, 0);
  objc_storeStrong((id *)&self->_path, 0);
}

@end
