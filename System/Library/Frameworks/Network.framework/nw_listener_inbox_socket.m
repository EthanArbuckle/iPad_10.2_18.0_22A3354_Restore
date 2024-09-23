@implementation nw_listener_inbox_socket

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
  v9 = __Block_byref_object_copy__66400;
  v10 = __Block_byref_object_dispose__66401;
  v11 = 0;
  p_lock = &self->super._lock;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __39__nw_listener_inbox_socket_description__block_invoke;
  v5[3] = &unk_1E14ACE40;
  v5[4] = self;
  v5[5] = &v6;
  os_unfair_lock_lock(&self->super._lock);
  __39__nw_listener_inbox_socket_description__block_invoke((uint64_t)v5);
  os_unfair_lock_unlock(p_lock);
  v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return v3;
}

- (nw_listener_inbox_socket)initWithParameters:(id)a3 delegate:(id)a4
{
  id v7;
  id v8;
  nw_listener_inbox_socket *v9;
  int ip_protocol;
  int v11;
  nw_listener_inbox_socket *v12;
  id v13;
  char *v14;
  NSObject *v15;
  os_log_type_t v16;
  char *backtrace_string;
  os_log_type_t v19;
  _BOOL4 v20;
  os_log_type_t v21;
  char v22;
  os_log_type_t type;
  objc_super v24;
  uint8_t buf[4];
  const char *v26;
  __int16 v27;
  int v28;
  __int16 v29;
  char *v30;
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  v24.receiver = self;
  v24.super_class = (Class)nw_listener_inbox_socket;
  v9 = -[nw_listener_inbox initWithDelegate:](&v24, sel_initWithDelegate_, v8);
  ip_protocol = nw_parameters_get_ip_protocol(v7);
  v11 = ip_protocol;
  if (ip_protocol != 6 && ip_protocol != 17)
  {
    pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
    networkd_settings_init();
    v13 = (id)gLogObj;
    *(_DWORD *)buf = 136446466;
    v26 = "-[nw_listener_inbox_socket initWithParameters:delegate:]";
    v27 = 1024;
    v28 = v11;
    v14 = (char *)_os_log_send_and_compose_impl();

    type = OS_LOG_TYPE_ERROR;
    v22 = 0;
    if (__nwlog_fault(v14, &type, &v22))
    {
      if (type == OS_LOG_TYPE_FAULT)
      {
        pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
        networkd_settings_init();
        v15 = (id)gLogObj;
        v16 = type;
        if (os_log_type_enabled(v15, type))
        {
          *(_DWORD *)buf = 136446466;
          v26 = "-[nw_listener_inbox_socket initWithParameters:delegate:]";
          v27 = 1024;
          v28 = v11;
          _os_log_impl(&dword_182FBE000, v15, v16, "%{public}s Cannot create listener with IP Protocol %u", buf, 0x12u);
        }
      }
      else if (v22)
      {
        backtrace_string = (char *)__nw_create_backtrace_string();
        pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
        networkd_settings_init();
        v15 = (id)gLogObj;
        v19 = type;
        v20 = os_log_type_enabled(v15, type);
        if (backtrace_string)
        {
          if (v20)
          {
            *(_DWORD *)buf = 136446722;
            v26 = "-[nw_listener_inbox_socket initWithParameters:delegate:]";
            v27 = 1024;
            v28 = v11;
            v29 = 2082;
            v30 = backtrace_string;
            _os_log_impl(&dword_182FBE000, v15, v19, "%{public}s Cannot create listener with IP Protocol %u, dumping backtrace:%{public}s", buf, 0x1Cu);
          }

          free(backtrace_string);
          if (!v14)
            goto LABEL_11;
          goto LABEL_10;
        }
        if (v20)
        {
          *(_DWORD *)buf = 136446466;
          v26 = "-[nw_listener_inbox_socket initWithParameters:delegate:]";
          v27 = 1024;
          v28 = v11;
          _os_log_impl(&dword_182FBE000, v15, v19, "%{public}s Cannot create listener with IP Protocol %u, no backtrace", buf, 0x12u);
        }
      }
      else
      {
        pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
        networkd_settings_init();
        v15 = (id)gLogObj;
        v21 = type;
        if (os_log_type_enabled(v15, type))
        {
          *(_DWORD *)buf = 136446466;
          v26 = "-[nw_listener_inbox_socket initWithParameters:delegate:]";
          v27 = 1024;
          v28 = v11;
          _os_log_impl(&dword_182FBE000, v15, v21, "%{public}s Cannot create listener with IP Protocol %u, backtrace limit exceeded", buf, 0x12u);
        }
      }

    }
    if (!v14)
    {
LABEL_11:
      v12 = 0;
      goto LABEL_12;
    }
LABEL_10:
    free(v14);
    goto LABEL_11;
  }
  v9->_ipProtocol = ip_protocol;
  objc_storeStrong((id *)&v9->super._parameters, a3);
  objc_storeStrong((id *)&v9->super._delegate, a4);
  v9->_sockfd_from_client = -1;
  v12 = v9;
LABEL_12:

  return v12;
}

- (id)start
{
  int v3;
  NSObject *posix_error;
  int v5;
  _DWORD *v6;
  int v7;
  id v8;
  char *v9;
  NSObject *v10;
  os_log_type_t v11;
  int v12;
  OS_nw_fd_wrapper *v13;
  OS_nw_fd_wrapper *sockfd_wrapper_for_connection_group_only;
  int error_code;
  id v16;
  os_log_type_t v17;
  NSObject *v18;
  char *backtrace_string;
  os_log_type_t v20;
  _BOOL4 v21;
  id v22;
  char *v23;
  NSObject *v24;
  os_log_type_t v25;
  char *v26;
  os_log_type_t v27;
  _BOOL4 v28;
  os_log_type_t v29;
  char *v30;
  os_log_type_t v31;
  _BOOL4 v32;
  os_log_type_t v33;
  os_log_type_t v34;
  OS_nw_endpoint *address;
  OS_nw_endpoint *local_endpoint;
  OS_nw_interface *v37;
  OS_nw_interface *interface;
  OS_nw_interface *v39;
  OS_nw_endpoint *v40;
  NSObject *v41;
  const sockaddr *v42;
  int sa_family;
  int v44;
  void *v45;
  NSObject *v46;
  os_log_type_t v47;
  int v48;
  void *v49;
  os_log_type_t v50;
  OS_nw_interface *v51;
  OS_nw_interface *v52;
  OS_nw_interface *v53;
  int v54;
  int v55;
  id v56;
  NSObject *v57;
  os_log_type_t v58;
  id v59;
  int v60;
  uint64_t v61;
  void *source;
  int v63;
  id v64;
  char *v65;
  NSObject *v66;
  os_log_type_t v67;
  char *v68;
  os_log_type_t v69;
  _BOOL4 v70;
  os_log_type_t v71;
  _BOOL4 v72;
  os_log_type_t v73;
  os_log_type_t v74;
  os_log_type_t v75;
  _BOOL4 v76;
  os_log_type_t v77;
  _BOOL4 v78;
  os_log_type_t v79;
  os_log_type_t v80;
  _QWORD v82[4];
  _DWORD *v83;
  nw_listener_inbox_socket *v84;
  _QWORD v85[5];
  int v86;
  char v87;
  os_log_type_t v88;
  os_log_type_t v89[4];
  socklen_t v90;
  int v91;
  int sockfd_from_client;
  os_log_type_t type[4];
  const char *v94;
  __int16 v95;
  int v96;
  __int16 v97;
  _BYTE v98[14];
  sockaddr buf[8];
  uint64_t v100;

  v100 = *MEMORY[0x1E0C80C00];
  sockfd_from_client = self->_sockfd_from_client;
  v3 = sockfd_from_client;
  self->_sockfd_from_client = -1;
  if (v3 < 0)
  {
    posix_error = nw_listener_socket_inbox_create_socket(self->super._parameters, self->_listenUUID, &sockfd_from_client);
    v5 = sockfd_from_client;
    if (posix_error)
      return posix_error;
  }
  else
  {
    posix_error = 0;
    v5 = v3;
  }
  if ((v5 & 0x80000000) == 0)
  {
    v6 = nw_fd_wrapper_create(v5);
    v91 = 1;
    if (ioctl(sockfd_from_client, 0x8004667EuLL, &v91) < 0)
    {
      posix_error = nw_error_create_posix_error(**(_DWORD **)(_ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3))
                                                                        + 8));
      error_code = nw_error_get_error_code(posix_error);
      pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
      networkd_settings_init();
      v16 = (id)gLogObj;
      *(_DWORD *)&buf[0].sa_len = 136446466;
      *(_QWORD *)&buf[0].sa_data[2] = "-[nw_listener_inbox_socket start]";
      *(_WORD *)&buf[0].sa_data[10] = 1024;
      *(_DWORD *)&buf[0].sa_data[12] = error_code;
      v9 = (char *)_os_log_send_and_compose_impl();

      type[0] = OS_LOG_TYPE_ERROR;
      LOBYTE(v90) = 0;
      if (!__nwlog_fault(v9, type, &v90))
        goto LABEL_158;
      if (type[0] == OS_LOG_TYPE_FAULT)
      {
        pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
        networkd_settings_init();
        v10 = (id)gLogObj;
        v17 = type[0];
        if (os_log_type_enabled(v10, type[0]))
        {
          *(_DWORD *)&buf[0].sa_len = 136446466;
          *(_QWORD *)&buf[0].sa_data[2] = "-[nw_listener_inbox_socket start]";
          *(_WORD *)&buf[0].sa_data[10] = 1024;
          *(_DWORD *)&buf[0].sa_data[12] = error_code;
          _os_log_impl(&dword_182FBE000, v10, v17, "%{public}s FIONBIO failed %{darwin.errno}d", &buf[0].sa_len, 0x12u);
        }
      }
      else if ((_BYTE)v90)
      {
        backtrace_string = (char *)__nw_create_backtrace_string();
        pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
        networkd_settings_init();
        v10 = (id)gLogObj;
        v20 = type[0];
        v21 = os_log_type_enabled(v10, type[0]);
        if (backtrace_string)
        {
          if (v21)
          {
            *(_DWORD *)&buf[0].sa_len = 136446722;
            *(_QWORD *)&buf[0].sa_data[2] = "-[nw_listener_inbox_socket start]";
            *(_WORD *)&buf[0].sa_data[10] = 1024;
            *(_DWORD *)&buf[0].sa_data[12] = error_code;
            *(_WORD *)buf[1].sa_data = 2082;
            *(_QWORD *)&buf[1].sa_data[2] = backtrace_string;
            _os_log_impl(&dword_182FBE000, v10, v20, "%{public}s FIONBIO failed %{darwin.errno}d, dumping backtrace:%{public}s", &buf[0].sa_len, 0x1Cu);
          }

          free(backtrace_string);
          if (!v9)
            goto LABEL_160;
          goto LABEL_159;
        }
        if (v21)
        {
          *(_DWORD *)&buf[0].sa_len = 136446466;
          *(_QWORD *)&buf[0].sa_data[2] = "-[nw_listener_inbox_socket start]";
          *(_WORD *)&buf[0].sa_data[10] = 1024;
          *(_DWORD *)&buf[0].sa_data[12] = error_code;
          _os_log_impl(&dword_182FBE000, v10, v20, "%{public}s FIONBIO failed %{darwin.errno}d, no backtrace", &buf[0].sa_len, 0x12u);
        }
      }
      else
      {
        pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
        networkd_settings_init();
        v10 = (id)gLogObj;
        v29 = type[0];
        if (os_log_type_enabled(v10, type[0]))
        {
          *(_DWORD *)&buf[0].sa_len = 136446466;
          *(_QWORD *)&buf[0].sa_data[2] = "-[nw_listener_inbox_socket start]";
          *(_WORD *)&buf[0].sa_data[10] = 1024;
          *(_DWORD *)&buf[0].sa_data[12] = error_code;
          _os_log_impl(&dword_182FBE000, v10, v29, "%{public}s FIONBIO failed %{darwin.errno}d, backtrace limit exceeded", &buf[0].sa_len, 0x12u);
        }
      }
      goto LABEL_58;
    }
    if (nw_parameters_get_tfo(self->super._parameters) && setsockopt(sockfd_from_client, 6, 261, &v91, 4u))
    {
      posix_error = nw_error_create_posix_error(**(_DWORD **)(_ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3))
                                                                        + 8));
      v7 = nw_error_get_error_code(posix_error);
      pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
      networkd_settings_init();
      v8 = (id)gLogObj;
      *(_DWORD *)&buf[0].sa_len = 136446722;
      *(_QWORD *)&buf[0].sa_data[2] = "-[nw_listener_inbox_socket start]";
      *(_WORD *)&buf[0].sa_data[10] = 1024;
      *(_DWORD *)&buf[0].sa_data[12] = sockfd_from_client;
      *(_WORD *)buf[1].sa_data = 1024;
      *(_DWORD *)&buf[1].sa_data[2] = v7;
      v9 = (char *)_os_log_send_and_compose_impl();

      type[0] = OS_LOG_TYPE_ERROR;
      LOBYTE(v90) = 0;
      if (!__nwlog_fault(v9, type, &v90))
        goto LABEL_158;
      if (type[0] == OS_LOG_TYPE_FAULT)
      {
        pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
        networkd_settings_init();
        v10 = (id)gLogObj;
        v11 = type[0];
        if (os_log_type_enabled(v10, type[0]))
        {
          *(_DWORD *)&buf[0].sa_len = 136446722;
          *(_QWORD *)&buf[0].sa_data[2] = "-[nw_listener_inbox_socket start]";
          *(_WORD *)&buf[0].sa_data[10] = 1024;
          *(_DWORD *)&buf[0].sa_data[12] = sockfd_from_client;
          *(_WORD *)buf[1].sa_data = 1024;
          *(_DWORD *)&buf[1].sa_data[2] = v7;
          _os_log_impl(&dword_182FBE000, v10, v11, "%{public}s setsockopt(%d, TCP_FASTOPEN, 1) failed %{darwin.errno}d", &buf[0].sa_len, 0x18u);
        }
LABEL_58:

        goto LABEL_158;
      }
      if (!(_BYTE)v90)
      {
        __nwlog_obj();
        v10 = objc_claimAutoreleasedReturnValue();
        v33 = type[0];
        if (os_log_type_enabled(v10, type[0]))
        {
          *(_DWORD *)&buf[0].sa_len = 136446722;
          *(_QWORD *)&buf[0].sa_data[2] = "-[nw_listener_inbox_socket start]";
          *(_WORD *)&buf[0].sa_data[10] = 1024;
          *(_DWORD *)&buf[0].sa_data[12] = sockfd_from_client;
          *(_WORD *)buf[1].sa_data = 1024;
          *(_DWORD *)&buf[1].sa_data[2] = v7;
          _os_log_impl(&dword_182FBE000, v10, v33, "%{public}s setsockopt(%d, TCP_FASTOPEN, 1) failed %{darwin.errno}d, backtrace limit exceeded", &buf[0].sa_len, 0x18u);
        }
        goto LABEL_58;
      }
      v26 = (char *)__nw_create_backtrace_string();
      __nwlog_obj();
      v10 = objc_claimAutoreleasedReturnValue();
      v27 = type[0];
      v28 = os_log_type_enabled(v10, type[0]);
      if (!v26)
      {
        if (v28)
        {
          *(_DWORD *)&buf[0].sa_len = 136446722;
          *(_QWORD *)&buf[0].sa_data[2] = "-[nw_listener_inbox_socket start]";
          *(_WORD *)&buf[0].sa_data[10] = 1024;
          *(_DWORD *)&buf[0].sa_data[12] = sockfd_from_client;
          *(_WORD *)buf[1].sa_data = 1024;
          *(_DWORD *)&buf[1].sa_data[2] = v7;
          _os_log_impl(&dword_182FBE000, v10, v27, "%{public}s setsockopt(%d, TCP_FASTOPEN, 1) failed %{darwin.errno}d, no backtrace", &buf[0].sa_len, 0x18u);
        }
        goto LABEL_58;
      }
      if (v28)
      {
        *(_DWORD *)&buf[0].sa_len = 136446978;
        *(_QWORD *)&buf[0].sa_data[2] = "-[nw_listener_inbox_socket start]";
        *(_WORD *)&buf[0].sa_data[10] = 1024;
        *(_DWORD *)&buf[0].sa_data[12] = sockfd_from_client;
        *(_WORD *)buf[1].sa_data = 1024;
        *(_DWORD *)&buf[1].sa_data[2] = v7;
        *(_WORD *)&buf[1].sa_data[6] = 2082;
        *(_QWORD *)&buf[1].sa_data[8] = v26;
        _os_log_impl(&dword_182FBE000, v10, v27, "%{public}s setsockopt(%d, TCP_FASTOPEN, 1) failed %{darwin.errno}d, dumping backtrace:%{public}s", &buf[0].sa_len, 0x22u);
      }

LABEL_119:
      free(v26);
      if (!v9)
        goto LABEL_160;
      goto LABEL_159;
    }
    self->_sockfd_for_logging_only_do_not_close_or_use = sockfd_from_client;
    if (-[nw_listener_inbox multicast](self, "multicast"))
    {
      v12 = dup(sockfd_from_client);
      v13 = (OS_nw_fd_wrapper *)nw_fd_wrapper_create(v12);
      sockfd_wrapper_for_connection_group_only = self->_sockfd_wrapper_for_connection_group_only;
      self->_sockfd_wrapper_for_connection_group_only = v13;
    }
    else
    {
      sockfd_wrapper_for_connection_group_only = self->_sockfd_wrapper_for_connection_group_only;
      self->_sockfd_wrapper_for_connection_group_only = 0;
    }

    if (v3 >= 0)
    {
      pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
      networkd_settings_init();
      v18 = (id)gLogObj;
      if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)&buf[0].sa_len = 136446466;
        *(_QWORD *)&buf[0].sa_data[2] = "-[nw_listener_inbox_socket start]";
        *(_WORD *)&buf[0].sa_data[10] = 1024;
        *(_DWORD *)&buf[0].sa_data[12] = sockfd_from_client;
        _os_log_impl(&dword_182FBE000, v18, OS_LOG_TYPE_DEFAULT, "%{public}s Not guarding fd %d", &buf[0].sa_len, 0x12u);
      }

      goto LABEL_67;
    }
    if ((nw_fd_wrapper_guard(v6) & 1) != 0)
      goto LABEL_67;
    pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
    networkd_settings_init();
    v22 = (id)gLogObj;
    *(_DWORD *)&buf[0].sa_len = 136446466;
    *(_QWORD *)&buf[0].sa_data[2] = "-[nw_listener_inbox_socket start]";
    *(_WORD *)&buf[0].sa_data[10] = 1024;
    *(_DWORD *)&buf[0].sa_data[12] = sockfd_from_client;
    v23 = (char *)_os_log_send_and_compose_impl();

    type[0] = OS_LOG_TYPE_ERROR;
    LOBYTE(v90) = 0;
    if (__nwlog_fault(v23, type, &v90))
    {
      if (type[0] == OS_LOG_TYPE_FAULT)
      {
        pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
        networkd_settings_init();
        v24 = (id)gLogObj;
        v25 = type[0];
        if (os_log_type_enabled(v24, type[0]))
        {
          *(_DWORD *)&buf[0].sa_len = 136446466;
          *(_QWORD *)&buf[0].sa_data[2] = "-[nw_listener_inbox_socket start]";
          *(_WORD *)&buf[0].sa_data[10] = 1024;
          *(_DWORD *)&buf[0].sa_data[12] = sockfd_from_client;
          _os_log_impl(&dword_182FBE000, v24, v25, "%{public}s Failed to protect fd %d", &buf[0].sa_len, 0x12u);
        }
      }
      else if ((_BYTE)v90)
      {
        v30 = (char *)__nw_create_backtrace_string();
        __nwlog_obj();
        v24 = objc_claimAutoreleasedReturnValue();
        v31 = type[0];
        v32 = os_log_type_enabled(v24, type[0]);
        if (v30)
        {
          if (v32)
          {
            *(_DWORD *)&buf[0].sa_len = 136446722;
            *(_QWORD *)&buf[0].sa_data[2] = "-[nw_listener_inbox_socket start]";
            *(_WORD *)&buf[0].sa_data[10] = 1024;
            *(_DWORD *)&buf[0].sa_data[12] = sockfd_from_client;
            *(_WORD *)buf[1].sa_data = 2082;
            *(_QWORD *)&buf[1].sa_data[2] = v30;
            _os_log_impl(&dword_182FBE000, v24, v31, "%{public}s Failed to protect fd %d, dumping backtrace:%{public}s", &buf[0].sa_len, 0x1Cu);
          }

          free(v30);
          goto LABEL_65;
        }
        if (v32)
        {
          *(_DWORD *)&buf[0].sa_len = 136446466;
          *(_QWORD *)&buf[0].sa_data[2] = "-[nw_listener_inbox_socket start]";
          *(_WORD *)&buf[0].sa_data[10] = 1024;
          *(_DWORD *)&buf[0].sa_data[12] = sockfd_from_client;
          _os_log_impl(&dword_182FBE000, v24, v31, "%{public}s Failed to protect fd %d, no backtrace", &buf[0].sa_len, 0x12u);
        }
      }
      else
      {
        __nwlog_obj();
        v24 = objc_claimAutoreleasedReturnValue();
        v34 = type[0];
        if (os_log_type_enabled(v24, type[0]))
        {
          *(_DWORD *)&buf[0].sa_len = 136446466;
          *(_QWORD *)&buf[0].sa_data[2] = "-[nw_listener_inbox_socket start]";
          *(_WORD *)&buf[0].sa_data[10] = 1024;
          *(_DWORD *)&buf[0].sa_data[12] = sockfd_from_client;
          _os_log_impl(&dword_182FBE000, v24, v34, "%{public}s Failed to protect fd %d, backtrace limit exceeded", &buf[0].sa_len, 0x12u);
        }
      }

    }
LABEL_65:
    if (v23)
      free(v23);
LABEL_67:
    memset(buf, 0, sizeof(buf));
    v90 = 128;
    if (!getsockname(sockfd_from_client, buf, &v90))
    {
      address = (OS_nw_endpoint *)nw_endpoint_create_address(buf);
      local_endpoint = self->super._local_endpoint;
      self->super._local_endpoint = address;

    }
    v37 = (OS_nw_interface *)nw_parameters_copy_required_interface((nw_parameters_t)self->super._parameters);
    interface = self->super._interface;
    self->super._interface = v37;

    v39 = self->super._interface;
    if (v39)
    {
      v40 = self->super._local_endpoint;
      if (v40)
      {
LABEL_71:
        if (!v39 || (nw_endpoint_set_interface(v40, v39), (v39 = self->super._interface) == 0))
        {
LABEL_101:
          v59 = nw_parameters_copy_context(self->super._parameters);
          v60 = sockfd_from_client;
          v85[0] = MEMORY[0x1E0C809B0];
          v85[1] = 3221225472;
          v85[2] = __33__nw_listener_inbox_socket_start__block_invoke;
          v85[3] = &unk_1E14AB378;
          v85[4] = self;
          v86 = sockfd_from_client;
          v82[0] = MEMORY[0x1E0C809B0];
          v82[1] = 3221225472;
          v82[2] = __33__nw_listener_inbox_socket_start__block_invoke_2;
          v82[3] = &unk_1E14ACE68;
          v83 = v6;
          v84 = self;
          self->_source = (void *)nw_queue_context_create_source(v59, v60, 1, 0, v85, v82);

          source = self->_source;
          if (source)
          {
            nw_queue_activate_source((uint64_t)source, v61);
            posix_error = 0;
LABEL_129:

            goto LABEL_160;
          }
          posix_error = -[NWConcrete_nw_error initWithDomain:code:]([NWConcrete_nw_error alloc], 1, 12);
          v63 = nw_error_get_error_code(posix_error);
          pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
          networkd_settings_init();
          v64 = (id)gLogObj;
          *(_DWORD *)type = 136446466;
          v94 = "-[nw_listener_inbox_socket start]";
          v95 = 1024;
          v96 = v63;
          v65 = (char *)_os_log_send_and_compose_impl();

          v89[0] = OS_LOG_TYPE_ERROR;
          v88 = OS_LOG_TYPE_DEFAULT;
          if (__nwlog_fault(v65, v89, &v88))
          {
            if (v89[0] == OS_LOG_TYPE_FAULT)
            {
              pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
              networkd_settings_init();
              v66 = (id)gLogObj;
              v67 = v89[0];
              if (os_log_type_enabled(v66, v89[0]))
              {
                *(_DWORD *)type = 136446466;
                v94 = "-[nw_listener_inbox_socket start]";
                v95 = 1024;
                v96 = v63;
                _os_log_impl(&dword_182FBE000, v66, v67, "%{public}s nw_queue_context_create_source failed %{darwin.errno}d", (uint8_t *)type, 0x12u);
              }
            }
            else if (v88)
            {
              v68 = (char *)__nw_create_backtrace_string();
              __nwlog_obj();
              v66 = objc_claimAutoreleasedReturnValue();
              v69 = v89[0];
              v70 = os_log_type_enabled(v66, v89[0]);
              if (v68)
              {
                if (v70)
                {
                  *(_DWORD *)type = 136446722;
                  v94 = "-[nw_listener_inbox_socket start]";
                  v95 = 1024;
                  v96 = v63;
                  v97 = 2082;
                  *(_QWORD *)v98 = v68;
                  _os_log_impl(&dword_182FBE000, v66, v69, "%{public}s nw_queue_context_create_source failed %{darwin.errno}d, dumping backtrace:%{public}s", (uint8_t *)type, 0x1Cu);
                }

                free(v68);
                if (!v65)
                  goto LABEL_129;
                goto LABEL_128;
              }
              if (v70)
              {
                *(_DWORD *)type = 136446466;
                v94 = "-[nw_listener_inbox_socket start]";
                v95 = 1024;
                v96 = v63;
                _os_log_impl(&dword_182FBE000, v66, v69, "%{public}s nw_queue_context_create_source failed %{darwin.errno}d, no backtrace", (uint8_t *)type, 0x12u);
              }
            }
            else
            {
              __nwlog_obj();
              v66 = objc_claimAutoreleasedReturnValue();
              v73 = v89[0];
              if (os_log_type_enabled(v66, v89[0]))
              {
                *(_DWORD *)type = 136446466;
                v94 = "-[nw_listener_inbox_socket start]";
                v95 = 1024;
                v96 = v63;
                _os_log_impl(&dword_182FBE000, v66, v73, "%{public}s nw_queue_context_create_source failed %{darwin.errno}d, backtrace limit exceeded", (uint8_t *)type, 0x12u);
              }
            }

          }
          if (!v65)
            goto LABEL_129;
LABEL_128:
          free(v65);
          goto LABEL_129;
        }
        goto LABEL_94;
      }
LABEL_93:
      if (!v39)
        goto LABEL_101;
LABEL_94:
      v53 = v39;
      v54 = *((_DWORD *)v53 + 25);

      if (v54 != 4001 || !setsockopt(sockfd_from_client, 0xFFFF, 4376, &v91, 4u))
        goto LABEL_101;
      posix_error = nw_error_create_posix_error(**(_DWORD **)(_ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3))
                                                                        + 8));
      v55 = nw_error_get_error_code(posix_error);
      pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
      networkd_settings_init();
      v56 = (id)gLogObj;
      *(_DWORD *)type = 136446722;
      v94 = "-[nw_listener_inbox_socket start]";
      v95 = 1024;
      v96 = sockfd_from_client;
      v97 = 1024;
      *(_DWORD *)v98 = v55;
      v9 = (char *)_os_log_send_and_compose_impl();

      v89[0] = OS_LOG_TYPE_ERROR;
      v88 = OS_LOG_TYPE_DEFAULT;
      if (__nwlog_fault(v9, v89, &v88))
      {
        if (v89[0] == OS_LOG_TYPE_FAULT)
        {
          __nwlog_obj();
          v57 = objc_claimAutoreleasedReturnValue();
          v58 = v89[0];
          if (os_log_type_enabled(v57, v89[0]))
          {
            *(_DWORD *)type = 136446722;
            v94 = "-[nw_listener_inbox_socket start]";
            v95 = 1024;
            v96 = sockfd_from_client;
            v97 = 1024;
            *(_DWORD *)v98 = v55;
            _os_log_impl(&dword_182FBE000, v57, v58, "%{public}s setsockopt(%d, SO_INTCOPROC_ALLOW, 1) failed %{darwin.errno}d", (uint8_t *)type, 0x18u);
          }
        }
        else if (v88)
        {
          v26 = (char *)__nw_create_backtrace_string();
          __nwlog_obj();
          v57 = objc_claimAutoreleasedReturnValue();
          v71 = v89[0];
          v72 = os_log_type_enabled(v57, v89[0]);
          if (v26)
          {
            if (v72)
            {
              *(_DWORD *)type = 136446978;
              v94 = "-[nw_listener_inbox_socket start]";
              v95 = 1024;
              v96 = sockfd_from_client;
              v97 = 1024;
              *(_DWORD *)v98 = v55;
              *(_WORD *)&v98[4] = 2082;
              *(_QWORD *)&v98[6] = v26;
              _os_log_impl(&dword_182FBE000, v57, v71, "%{public}s setsockopt(%d, SO_INTCOPROC_ALLOW, 1) failed %{darwin.errno}d, dumping backtrace:%{public}s", (uint8_t *)type, 0x22u);
            }

            goto LABEL_119;
          }
          if (v72)
          {
            *(_DWORD *)type = 136446722;
            v94 = "-[nw_listener_inbox_socket start]";
            v95 = 1024;
            v96 = sockfd_from_client;
            v97 = 1024;
            *(_DWORD *)v98 = v55;
            _os_log_impl(&dword_182FBE000, v57, v71, "%{public}s setsockopt(%d, SO_INTCOPROC_ALLOW, 1) failed %{darwin.errno}d, no backtrace", (uint8_t *)type, 0x18u);
          }
        }
        else
        {
          __nwlog_obj();
          v57 = objc_claimAutoreleasedReturnValue();
          v74 = v89[0];
          if (os_log_type_enabled(v57, v89[0]))
          {
            *(_DWORD *)type = 136446722;
            v94 = "-[nw_listener_inbox_socket start]";
            v95 = 1024;
            v96 = sockfd_from_client;
            v97 = 1024;
            *(_DWORD *)v98 = v55;
            _os_log_impl(&dword_182FBE000, v57, v74, "%{public}s setsockopt(%d, SO_INTCOPROC_ALLOW, 1) failed %{darwin.errno}d, backtrace limit exceeded", (uint8_t *)type, 0x18u);
          }
        }

      }
LABEL_158:
      if (v9)
LABEL_159:
        free(v9);
LABEL_160:

      return posix_error;
    }
    v41 = self->super._local_endpoint;
    if (v41)
    {
      v42 = nw_endpoint_get_address(v41);
      if (v42)
      {
        *(_DWORD *)v89 = 0;
        v90 = 4;
        sa_family = v42->sa_family;
        if (sa_family == 30)
        {
          if (getsockopt(sockfd_from_client, 41, 125, v89, &v90))
          {
            posix_error = nw_error_create_posix_error(**(_DWORD **)(_ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3))
                                                                              + 8));
            v48 = nw_error_get_error_code(posix_error);
            __nwlog_obj();
            v49 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)type = 136446722;
            v94 = "-[nw_listener_inbox_socket start]";
            v95 = 1024;
            v96 = sockfd_from_client;
            v97 = 1024;
            *(_DWORD *)v98 = v48;
            v9 = (char *)_os_log_send_and_compose_impl();

            v88 = OS_LOG_TYPE_ERROR;
            v87 = 0;
            if (!__nwlog_fault(v9, &v88, &v87))
              goto LABEL_158;
            if (v88 == OS_LOG_TYPE_FAULT)
            {
              __nwlog_obj();
              v46 = objc_claimAutoreleasedReturnValue();
              v50 = v88;
              if (os_log_type_enabled(v46, v88))
              {
                *(_DWORD *)type = 136446722;
                v94 = "-[nw_listener_inbox_socket start]";
                v95 = 1024;
                v96 = sockfd_from_client;
                v97 = 1024;
                *(_DWORD *)v98 = v48;
                _os_log_impl(&dword_182FBE000, v46, v50, "%{public}s getsockopt(%d, IPV6_BOUND_IF) failed %{darwin.errno}d", (uint8_t *)type, 0x18u);
              }
              goto LABEL_157;
            }
            if (!v87)
            {
              __nwlog_obj();
              v46 = objc_claimAutoreleasedReturnValue();
              v80 = v88;
              if (os_log_type_enabled(v46, v88))
              {
                *(_DWORD *)type = 136446722;
                v94 = "-[nw_listener_inbox_socket start]";
                v95 = 1024;
                v96 = sockfd_from_client;
                v97 = 1024;
                *(_DWORD *)v98 = v48;
                _os_log_impl(&dword_182FBE000, v46, v80, "%{public}s getsockopt(%d, IPV6_BOUND_IF) failed %{darwin.errno}d, backtrace limit exceeded", (uint8_t *)type, 0x18u);
              }
              goto LABEL_157;
            }
            v26 = (char *)__nw_create_backtrace_string();
            __nwlog_obj();
            v46 = objc_claimAutoreleasedReturnValue();
            v77 = v88;
            v78 = os_log_type_enabled(v46, v88);
            if (!v26)
            {
              if (v78)
              {
                *(_DWORD *)type = 136446722;
                v94 = "-[nw_listener_inbox_socket start]";
                v95 = 1024;
                v96 = sockfd_from_client;
                v97 = 1024;
                *(_DWORD *)v98 = v48;
                _os_log_impl(&dword_182FBE000, v46, v77, "%{public}s getsockopt(%d, IPV6_BOUND_IF) failed %{darwin.errno}d, no backtrace", (uint8_t *)type, 0x18u);
              }
              goto LABEL_157;
            }
            if (v78)
            {
              *(_DWORD *)type = 136446978;
              v94 = "-[nw_listener_inbox_socket start]";
              v95 = 1024;
              v96 = sockfd_from_client;
              v97 = 1024;
              *(_DWORD *)v98 = v48;
              *(_WORD *)&v98[4] = 2082;
              *(_QWORD *)&v98[6] = v26;
              _os_log_impl(&dword_182FBE000, v46, v77, "%{public}s getsockopt(%d, IPV6_BOUND_IF) failed %{darwin.errno}d, dumping backtrace:%{public}s", (uint8_t *)type, 0x22u);
            }
            goto LABEL_140;
          }
        }
        else
        {
          if (sa_family != 2)
            goto LABEL_92;
          if (getsockopt(sockfd_from_client, 0, 25, v89, &v90))
          {
            posix_error = nw_error_create_posix_error(**(_DWORD **)(_ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3))
                                                                              + 8));
            v44 = nw_error_get_error_code(posix_error);
            __nwlog_obj();
            v45 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)type = 136446722;
            v94 = "-[nw_listener_inbox_socket start]";
            v95 = 1024;
            v96 = sockfd_from_client;
            v97 = 1024;
            *(_DWORD *)v98 = v44;
            v9 = (char *)_os_log_send_and_compose_impl();

            v88 = OS_LOG_TYPE_ERROR;
            v87 = 0;
            if (!__nwlog_fault(v9, &v88, &v87))
              goto LABEL_158;
            if (v88 == OS_LOG_TYPE_FAULT)
            {
              __nwlog_obj();
              v46 = objc_claimAutoreleasedReturnValue();
              v47 = v88;
              if (os_log_type_enabled(v46, v88))
              {
                *(_DWORD *)type = 136446722;
                v94 = "-[nw_listener_inbox_socket start]";
                v95 = 1024;
                v96 = sockfd_from_client;
                v97 = 1024;
                *(_DWORD *)v98 = v44;
                _os_log_impl(&dword_182FBE000, v46, v47, "%{public}s getsockopt(%d, IP_BOUND_IF) failed %{darwin.errno}d", (uint8_t *)type, 0x18u);
              }
LABEL_157:

              goto LABEL_158;
            }
            if (!v87)
            {
              __nwlog_obj();
              v46 = objc_claimAutoreleasedReturnValue();
              v79 = v88;
              if (os_log_type_enabled(v46, v88))
              {
                *(_DWORD *)type = 136446722;
                v94 = "-[nw_listener_inbox_socket start]";
                v95 = 1024;
                v96 = sockfd_from_client;
                v97 = 1024;
                *(_DWORD *)v98 = v44;
                _os_log_impl(&dword_182FBE000, v46, v79, "%{public}s getsockopt(%d, IP_BOUND_IF) failed %{darwin.errno}d, backtrace limit exceeded", (uint8_t *)type, 0x18u);
              }
              goto LABEL_157;
            }
            v26 = (char *)__nw_create_backtrace_string();
            __nwlog_obj();
            v46 = objc_claimAutoreleasedReturnValue();
            v75 = v88;
            v76 = os_log_type_enabled(v46, v88);
            if (!v26)
            {
              if (v76)
              {
                *(_DWORD *)type = 136446722;
                v94 = "-[nw_listener_inbox_socket start]";
                v95 = 1024;
                v96 = sockfd_from_client;
                v97 = 1024;
                *(_DWORD *)v98 = v44;
                _os_log_impl(&dword_182FBE000, v46, v75, "%{public}s getsockopt(%d, IP_BOUND_IF) failed %{darwin.errno}d, no backtrace", (uint8_t *)type, 0x18u);
              }
              goto LABEL_157;
            }
            if (v76)
            {
              *(_DWORD *)type = 136446978;
              v94 = "-[nw_listener_inbox_socket start]";
              v95 = 1024;
              v96 = sockfd_from_client;
              v97 = 1024;
              *(_DWORD *)v98 = v44;
              *(_WORD *)&v98[4] = 2082;
              *(_QWORD *)&v98[6] = v26;
              _os_log_impl(&dword_182FBE000, v46, v75, "%{public}s getsockopt(%d, IP_BOUND_IF) failed %{darwin.errno}d, dumping backtrace:%{public}s", (uint8_t *)type, 0x22u);
            }
LABEL_140:

            goto LABEL_119;
          }
        }
        if (*(_DWORD *)v89)
        {
          v51 = (OS_nw_interface *)nw_interface_create_with_index(*(unsigned int *)v89);
          v52 = self->super._interface;
          self->super._interface = v51;

        }
      }
    }
LABEL_92:
    v39 = self->super._interface;
    v40 = self->super._local_endpoint;
    if (v40)
      goto LABEL_71;
    goto LABEL_93;
  }
  return posix_error;
}

- (BOOL)suspend
{
  _BOOL4 v3;
  NSObject *v4;
  objc_super v6;
  uint8_t buf[4];
  const char *v8;
  __int16 v9;
  nw_listener_inbox_socket *v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v6.receiver = self;
  v6.super_class = (Class)nw_listener_inbox_socket;
  v3 = -[nw_listener_inbox suspend](&v6, sel_suspend);
  if (v3 && self->_source)
  {
    pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
    networkd_settings_init();
    v4 = (id)gLogObj;
    if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136446466;
      v8 = "-[nw_listener_inbox_socket suspend]";
      v9 = 2114;
      v10 = self;
      _os_log_impl(&dword_182FBE000, v4, OS_LOG_TYPE_INFO, "%{public}s Suspended inbox %{public}@", buf, 0x16u);
    }

    nw_queue_suspend_source((uint64_t)self->_source);
  }
  return v3;
}

- (BOOL)resume
{
  _BOOL4 v3;
  NSObject *v4;
  uint64_t v5;
  objc_super v7;
  uint8_t buf[4];
  const char *v9;
  __int16 v10;
  nw_listener_inbox_socket *v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v7.receiver = self;
  v7.super_class = (Class)nw_listener_inbox_socket;
  v3 = -[nw_listener_inbox resume](&v7, sel_resume);
  if (v3 && self->_source)
  {
    pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
    networkd_settings_init();
    v4 = (id)gLogObj;
    if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136446466;
      v9 = "-[nw_listener_inbox_socket resume]";
      v10 = 2114;
      v11 = self;
      _os_log_impl(&dword_182FBE000, v4, OS_LOG_TYPE_INFO, "%{public}s Resumed inbox %{public}@", buf, 0x16u);
    }

    nw_queue_resume_source((uint64_t)self->_source, v5);
  }
  return v3;
}

- (BOOL)cancel
{
  void *source;
  OS_nw_fd_wrapper *sockfd_wrapper_for_connection_group_only;

  source = self->_source;
  if (source)
  {
    nw_queue_cancel_source((uint64_t)self->_source, (uint64_t)a2);
    self->_source = 0;
  }
  sockfd_wrapper_for_connection_group_only = self->_sockfd_wrapper_for_connection_group_only;
  if (sockfd_wrapper_for_connection_group_only)
  {
    self->_sockfd_wrapper_for_connection_group_only = 0;

  }
  return source != 0;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sockfd_wrapper_for_connection_group_only, 0);
}

- (void)initWithParameters:(void *)a3 delegate:(_OWORD *)a4 necpUUID:
{
  id v7;
  id v8;
  uint64_t v9;

  v7 = a2;
  v8 = a3;
  if (a1)
  {
    v9 = objc_msgSend(a1, "initWithParameters:delegate:", v7, v8);
    a1 = (void *)v9;
    if (v9)
      *(_OWORD *)(v9 + 89) = *a4;
  }

  return a1;
}

@end
