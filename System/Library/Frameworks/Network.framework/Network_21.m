void sub_183B7D164(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

uint64_t ___ZL45nw_settings_should_be_able_to_use_notify_apisv_block_invoke()
{
  uint64_t result;

  getpid();
  result = sandbox_check();
  if ((_DWORD)result)
    nw_settings_should_be_able_to_use_notify_apis(void)::has_notify_apis = 1;
  return result;
}

xpc_object_t nw_settings_add_settings_from_bitmask(xpc_object_t xdict, uint64_t a2)
{
  const char *v3;
  unsigned int v5;
  _QWORD *v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  NSObject *v12;
  os_log_type_t v13;
  const char *v14;
  char *backtrace_string;
  uint64_t v16;
  _BOOL4 v17;
  char v19;
  os_log_type_t type;
  uint8_t buf[4];
  const char *v22;
  __int16 v23;
  char *v24;
  _QWORD v25[31];

  v25[30] = *MEMORY[0x1E0C80C00];
  v3 = (const char *)nw_setting_libnetcore_datapath_debug;
  v25[0] = 8;
  v25[1] = nw_setting_libnetcore_datapath_debug;
  v25[2] = 16;
  v25[3] = nw_setting_tcpconn_disable_simulate_crash;
  v25[4] = 32;
  v25[5] = nw_setting_boringssl_log_debug;
  v25[6] = 64;
  v25[7] = nw_setting_tcp_enable_auto_tfo;
  v25[8] = 128;
  v25[9] = nw_setting_disable_dns_xpc;
  v25[10] = 256;
  v25[11] = nw_setting_tcpconn_enable_tls_tickets;
  v25[12] = 512;
  v25[13] = nw_setting_channel_enable_qos_override;
  v25[14] = 1024;
  v25[15] = nw_setting_disable_ddr;
  v25[16] = 2048;
  v25[17] = nw_setting_tcpconn_enable_tls_esni;
  v25[18] = 4096;
  v25[19] = nw_setting_context_timer_disable_qos_override;
  v25[20] = 0x2000;
  v25[21] = nw_setting_tcpconn_enable_tls_experiments;
  v25[22] = 0x4000;
  v25[23] = nw_setting_tcpconn_enable_tls_keylog;
  v25[24] = 0x8000;
  v25[25] = nw_setting_disable_swift_tls_privacy_proxy;
  v25[26] = 0x10000;
  v25[28] = 0;
  v25[29] = 0;
  v25[27] = nw_setting_disable_l4s_aqm;
  if (!nw_setting_libnetcore_datapath_debug)
    return xdict;
  v5 = 1;
  v6 = v25;
  while (1)
  {
    if ((*v6 & ~a2) != 0)
    {
      if (xdict)
        xpc_dictionary_set_value(xdict, v3, 0);
      goto LABEL_5;
    }
    if (!xdict)
    {
      xdict = xpc_dictionary_create(0, 0, 0);
      if (!xdict)
        break;
    }
    xpc_dictionary_set_BOOL(xdict, v3, 1);
LABEL_5:
    v6 = &v25[2 * v5];
    v3 = (const char *)v6[1];
    ++v5;
    if (!v3)
      return xdict;
  }
  v7 = pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
  networkd_settings_init(v7);
  *(_DWORD *)buf = 136446210;
  v22 = "nw_settings_add_settings_from_bitmask";
  v8 = (char *)_os_log_send_and_compose_impl();
  type = OS_LOG_TYPE_ERROR;
  v19 = 0;
  v9 = __nwlog_fault(v8, &type, &v19);
  if (!(_DWORD)v9)
    goto LABEL_24;
  if (type != OS_LOG_TYPE_FAULT)
  {
    if (v19)
    {
      backtrace_string = (char *)__nw_create_backtrace_string();
      v16 = pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
      networkd_settings_init(v16);
      v12 = gLogObj;
      v13 = type;
      v17 = os_log_type_enabled((os_log_t)gLogObj, type);
      if (backtrace_string)
      {
        if (v17)
        {
          *(_DWORD *)buf = 136446466;
          v22 = "nw_settings_add_settings_from_bitmask";
          v23 = 2082;
          v24 = backtrace_string;
          _os_log_impl(&dword_182FBE000, v12, v13, "%{public}s xpc_dictionary_create failed, dumping backtrace:%{public}s", buf, 0x16u);
        }
        free(backtrace_string);
        goto LABEL_24;
      }
      if (!v17)
        goto LABEL_24;
      *(_DWORD *)buf = 136446210;
      v22 = "nw_settings_add_settings_from_bitmask";
      v14 = "%{public}s xpc_dictionary_create failed, no backtrace";
    }
    else
    {
      v12 = __nwlog_obj(v9, v10);
      v13 = type;
      if (!os_log_type_enabled(v12, type))
        goto LABEL_24;
      *(_DWORD *)buf = 136446210;
      v22 = "nw_settings_add_settings_from_bitmask";
      v14 = "%{public}s xpc_dictionary_create failed, backtrace limit exceeded";
    }
LABEL_23:
    _os_log_impl(&dword_182FBE000, v12, v13, v14, buf, 0xCu);
    goto LABEL_24;
  }
  v11 = pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
  networkd_settings_init(v11);
  v12 = gLogObj;
  v13 = type;
  if (os_log_type_enabled((os_log_t)gLogObj, type))
  {
    *(_DWORD *)buf = 136446210;
    v22 = "nw_settings_add_settings_from_bitmask";
    v14 = "%{public}s xpc_dictionary_create failed";
    goto LABEL_23;
  }
LABEL_24:
  if (v8)
    free(v8);
  return 0;
}

uint64_t ___ZL35networkd_settings_update_from_tokeni_block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 32) + 16))(*(_QWORD *)(a1 + 32), *(unsigned __int8 *)(a1 + 40));
}

uint64_t ___ZL35networkd_settings_update_from_tokeni_block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 32) + 16))(*(_QWORD *)(a1 + 32), *(unsigned __int8 *)(a1 + 40));
}

uint64_t ___ZL32networkd_settings_read_from_filev_block_invoke(int a1, char *__s1, void *a3)
{
  if (strcmp(__s1, (const char *)nw_settings_managed_settings))
    xpc_dictionary_set_value((xpc_object_t)sCachedSettings, __s1, a3);
  return 1;
}

void ___ZL36networkd_settings_setup_notify_watchv_block_invoke(int a1, int a2)
{
  networkd_settings_update_from_token(a2);
}

int64_t networkd_settings_get_int64(const char *a1)
{
  int64_t int64;

  networkd_settings_init();
  if (!sCachedSettings)
    return 0;
  pthread_mutex_lock(&sSettingsMutex);
  if (sCachedSettings)
    int64 = xpc_dictionary_get_int64((xpc_object_t)sCachedSettings, a1);
  else
    int64 = 0;
  pthread_mutex_unlock(&sSettingsMutex);
  return int64;
}

BOOL networkd_settings_get_BOOL_with_default(const char *a1, _BOOL8 a2)
{
  void *v4;
  Class Class;
  xpc_object_t value;
  void *v7;

  networkd_settings_init();
  if (sCachedSettings)
  {
    pthread_mutex_lock(&sSettingsMutex);
    v4 = (void *)sCachedSettings;
    if (sCachedSettings)
    {
      Class = object_getClass((id)sCachedSettings);
      if (a1)
      {
        if (Class == (Class)MEMORY[0x1E0C812F8])
        {
          value = xpc_dictionary_get_value(v4, a1);
          if (value)
          {
            v7 = value;
            if (object_getClass(value) == (Class)MEMORY[0x1E0C812D0])
              a2 = xpc_BOOL_get_value(v7);
          }
        }
      }
    }
    pthread_mutex_unlock(&sSettingsMutex);
  }
  return a2;
}

BOOL networkd_settings_copy_string(const char *a1)
{
  const char *string;
  char *v3;
  NSObject *v4;
  void *v5;
  _BOOL8 result;
  char *v7;
  NSObject *v8;
  os_log_type_t v9;
  const char *v10;
  char *backtrace_string;
  _BOOL4 v12;
  char v13;
  os_log_type_t type;
  uint8_t buf[4];
  const char *v16;
  __int16 v17;
  char *v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  networkd_settings_init();
  if (!a1)
  {
    __nwlog_obj();
    *(_DWORD *)buf = 136446210;
    v16 = "networkd_settings_copy_string";
    v7 = (char *)_os_log_send_and_compose_impl();
    type = OS_LOG_TYPE_ERROR;
    v13 = 0;
    if (!__nwlog_fault(v7, &type, &v13))
      goto LABEL_24;
    if (type == OS_LOG_TYPE_FAULT)
    {
      v8 = __nwlog_obj();
      v9 = type;
      if (!os_log_type_enabled(v8, type))
        goto LABEL_24;
      *(_DWORD *)buf = 136446210;
      v16 = "networkd_settings_copy_string";
      v10 = "%{public}s called with null name";
    }
    else if (v13)
    {
      backtrace_string = (char *)__nw_create_backtrace_string();
      v8 = __nwlog_obj();
      v9 = type;
      v12 = os_log_type_enabled(v8, type);
      if (backtrace_string)
      {
        if (v12)
        {
          *(_DWORD *)buf = 136446466;
          v16 = "networkd_settings_copy_string";
          v17 = 2082;
          v18 = backtrace_string;
          _os_log_impl(&dword_182FBE000, v8, v9, "%{public}s called with null name, dumping backtrace:%{public}s", buf, 0x16u);
        }
        free(backtrace_string);
        goto LABEL_24;
      }
      if (!v12)
      {
LABEL_24:
        if (v7)
          free(v7);
        return 0;
      }
      *(_DWORD *)buf = 136446210;
      v16 = "networkd_settings_copy_string";
      v10 = "%{public}s called with null name, no backtrace";
    }
    else
    {
      v8 = __nwlog_obj();
      v9 = type;
      if (!os_log_type_enabled(v8, type))
        goto LABEL_24;
      *(_DWORD *)buf = 136446210;
      v16 = "networkd_settings_copy_string";
      v10 = "%{public}s called with null name, backtrace limit exceeded";
    }
    _os_log_impl(&dword_182FBE000, v8, v9, v10, buf, 0xCu);
    goto LABEL_24;
  }
  if (!sCachedSettings)
    return 0;
  pthread_mutex_lock(&sSettingsMutex);
  if (!sCachedSettings)
    goto LABEL_8;
  string = xpc_dictionary_get_string((xpc_object_t)sCachedSettings, a1);
  if (!string)
    goto LABEL_8;
  v3 = strdup(string);
  if (v3)
  {
LABEL_9:
    pthread_mutex_unlock(&sSettingsMutex);
    return (BOOL)v3;
  }
  v4 = __nwlog_obj();
  os_log_type_enabled(v4, OS_LOG_TYPE_ERROR);
  *(_DWORD *)buf = 136446210;
  v16 = "strict_strdup";
  v5 = (void *)_os_log_send_and_compose_impl();
  result = __nwlog_abort((uint64_t)v5);
  if (!result)
  {
    free(v5);
LABEL_8:
    v3 = 0;
    goto LABEL_9;
  }
  __break(1u);
  return result;
}

uint64_t nw_is_dispatch_allowed()
{
  uint64_t result;

  pthread_once(&nw_settings_setup_atfork::pOnce, (void (*)(void))nw_settings_setup_atfork_inner);
  if (sNWIsBetweenForkAndExec == 1 && (sNWParentAllowedDispatch & 1) != 0)
    return 0;
  if ((sNWDispatchAllowedNow & 1) != 0)
    return 1;
  if ((_dispatch_is_fork_of_multithreaded_parent() & 1) != 0 || (_dispatch_is_multithreaded() & 1) == 0)
  {
    getpid();
    if (sandbox_check() != 1)
      return sNWDispatchAllowedNow;
  }
  result = 1;
  sNWDispatchAllowedNow = 1;
  return result;
}

uint64_t nw_settings_register_networkd_privileged()
{
  uint64_t result;

  if ((gIsHelper & 1) == 0)
  {
    gIsHelper = 1;
    nw_allow_use_of_dispatch_internal();
    pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
    return networkd_settings_init();
  }
  return result;
}

uint64_t ___ZL24__nw_signpost_is_enabledv_block_invoke_88147()
{
  const char *v0;
  uint64_t result;
  void *v2;
  Class Class;
  BOOL v4;
  xpc_object_t value;
  void *v6;

  v0 = (const char *)nw_setting_enable_signposts;
  result = networkd_settings_init();
  if (!sCachedSettings)
  {
    v4 = 0;
    goto LABEL_10;
  }
  pthread_mutex_lock(&sSettingsMutex);
  v2 = (void *)sCachedSettings;
  if (!sCachedSettings)
    goto LABEL_7;
  Class = object_getClass((id)sCachedSettings);
  v4 = 0;
  if (!v0 || Class != (Class)MEMORY[0x1E0C812F8])
    goto LABEL_8;
  value = xpc_dictionary_get_value(v2, v0);
  if (value && (v6 = value, object_getClass(value) == (Class)MEMORY[0x1E0C812D0]))
    v4 = xpc_BOOL_get_value(v6);
  else
LABEL_7:
    v4 = 0;
LABEL_8:
  result = pthread_mutex_unlock(&sSettingsMutex);
LABEL_10:
  _nw_signposts_enabled = v4;
  return result;
}

BOOL nw_settings_get_ddr_enabled()
{
  const char *v0;
  void *v1;
  Class Class;
  _BOOL4 v3;
  xpc_object_t value;
  void *v5;

  v0 = (const char *)nw_setting_disable_ddr;
  networkd_settings_init();
  if (!sCachedSettings)
  {
    v3 = 0;
    return !v3;
  }
  pthread_mutex_lock(&sSettingsMutex);
  v1 = (void *)sCachedSettings;
  if (!sCachedSettings)
    goto LABEL_7;
  Class = object_getClass((id)sCachedSettings);
  v3 = 0;
  if (!v0 || Class != (Class)MEMORY[0x1E0C812F8])
    goto LABEL_8;
  value = xpc_dictionary_get_value(v1, v0);
  if (value && (v5 = value, object_getClass(value) == (Class)MEMORY[0x1E0C812D0]))
    v3 = xpc_BOOL_get_value(v5);
  else
LABEL_7:
    v3 = 0;
LABEL_8:
  pthread_mutex_unlock(&sSettingsMutex);
  return !v3;
}

BOOL nw_settings_networkscore_metrics_enabled()
{
  const char *v0;
  void *v1;
  Class Class;
  _BOOL8 v3;
  xpc_object_t value;
  void *v5;

  v0 = (const char *)nw_setting_enable_networkscore_metrics;
  networkd_settings_init();
  if (!sCachedSettings)
    return 0;
  pthread_mutex_lock(&sSettingsMutex);
  v1 = (void *)sCachedSettings;
  if (!sCachedSettings)
    goto LABEL_7;
  Class = object_getClass((id)sCachedSettings);
  v3 = 0;
  if (!v0 || Class != (Class)MEMORY[0x1E0C812F8])
    goto LABEL_8;
  value = xpc_dictionary_get_value(v1, v0);
  if (value && (v5 = value, object_getClass(value) == (Class)MEMORY[0x1E0C812D0]))
    v3 = xpc_BOOL_get_value(v5);
  else
LABEL_7:
    v3 = 0;
LABEL_8:
  pthread_mutex_unlock(&sSettingsMutex);
  return v3;
}

void nw_settings_set_networkscore_sampling_rate_denominator(int64_t value)
{
  const char *v1;
  id v2;

  v1 = (const char *)nw_setting_networkscore_sampling_rate_denominator;
  v2 = xpc_int64_create(value);
  networkd_privileged_set_settings(v1, v2, 0);

}

void sub_183B7DD98(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{

  _Unwind_Resume(a1);
}

int64_t nw_settings_get_networkscore_sampling_rate_denominator()
{
  void *v0;
  void *v1;
  int64_t value;

  v0 = networkd_settings_copy_value_of_type((const char *)nw_setting_networkscore_sampling_rate_denominator, 0);
  v1 = v0;
  if (v0 && object_getClass(v0) == (Class)MEMORY[0x1E0C81328])
    value = xpc_int64_get_value(v1);
  else
    value = 0;

  return value;
}

void sub_183B7DE10(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

uint64_t nw_settings_get_unified_http_enabled()
{
  const char *v0;
  void *v1;
  Class Class;
  _BOOL8 v3;
  xpc_object_t value;
  void *v5;

  v0 = (const char *)nw_setting_enable_unified_http;
  networkd_settings_init();
  if (!sCachedSettings)
    return 1;
  pthread_mutex_lock(&sSettingsMutex);
  v1 = (void *)sCachedSettings;
  if (!sCachedSettings)
    goto LABEL_7;
  Class = object_getClass((id)sCachedSettings);
  v3 = 1;
  if (!v0)
    goto LABEL_8;
  if (Class != (Class)MEMORY[0x1E0C812F8])
    goto LABEL_8;
  value = xpc_dictionary_get_value(v1, v0);
  if (!value)
    goto LABEL_8;
  v5 = value;
  if (object_getClass(value) == (Class)MEMORY[0x1E0C812D0])
    v3 = xpc_BOOL_get_value(v5);
  else
LABEL_7:
    v3 = 1;
LABEL_8:
  pthread_mutex_unlock(&sSettingsMutex);
  return v3;
}

void __cxx_global_var_init_1()
{
  unsigned __int8 v0;
  unsigned __int8 v1;
  uint64_t v2;

  {
    if ((v1 & 1) == 0)
    {
      {
        nw::object::_class(void)::instance = (uint64_t)"object";
        *(_QWORD *)algn_1ECD84F58 = 6;
        xmmword_1ECD84F60 = 0u;
        unk_1ECD84F70 = 0u;
        xmmword_1ECD84F80 = 0u;
        *(_OWORD *)&qword_1ECD84F90 = 0u;
        *(__int128 *)((char *)&xmmword_1ECD84F98 + 8) = 0u;
        *(_OWORD *)&qword_1ECD84FB0 = 0u;
        xmmword_1ECD84FC0 = 0u;
        unk_1ECD84FD0 = 0u;
        qword_1ECD84FE0 = (uint64_t)&qword_1ECD84FE0;
        unk_1ECD84FE8 = &qword_1ECD84FE0;
        qword_1ECD84FF0 = 0;
        dword_1ECD84FF8 = 0;
      }
    }
    nw::object::__redacted_description_def_instance = (uint64_t)nw::object::class_def::register_method_def(qword_1ECD85048, (uint64_t)nw::object::_redacted_description, 0);
    qword_1ECD85048 = v2;
  }
}

void __cxx_global_var_init_86()
{
  unsigned __int8 v0;
  unsigned __int8 v1;
  uint64_t v2;

  {
    if ((v1 & 1) == 0)
    {
      {
        nw::object::_class(void)::instance = (uint64_t)"object";
        *(_QWORD *)algn_1ECD84F58 = 6;
        xmmword_1ECD84F60 = 0u;
        unk_1ECD84F70 = 0u;
        xmmword_1ECD84F80 = 0u;
        *(_OWORD *)&qword_1ECD84F90 = 0u;
        *(__int128 *)((char *)&xmmword_1ECD84F98 + 8) = 0u;
        *(_OWORD *)&qword_1ECD84FB0 = 0u;
        xmmword_1ECD84FC0 = 0u;
        unk_1ECD84FD0 = 0u;
        qword_1ECD84FE0 = (uint64_t)&qword_1ECD84FE0;
        unk_1ECD84FE8 = &qword_1ECD84FE0;
        qword_1ECD84FF0 = 0;
        dword_1ECD84FF8 = 0;
      }
    }
    nw::object::__description_def_instance = (uint64_t)nw::object::class_def::register_method_def(qword_1ECD85060, (uint64_t)nw::object::_description, 0);
    qword_1ECD85060 = v2;
  }
}

void __cxx_global_var_init_1_87()
{
  unsigned __int8 v0;
  unsigned __int8 v1;
  uint64_t v2;

  {
    if ((v1 & 1) == 0)
    {
      {
        nw::object::_class(void)::instance = (uint64_t)"object";
        *(_QWORD *)algn_1ECD84F58 = 6;
        xmmword_1ECD84F60 = 0u;
        unk_1ECD84F70 = 0u;
        xmmword_1ECD84F80 = 0u;
        *(_OWORD *)&qword_1ECD84F90 = 0u;
        *(__int128 *)((char *)&xmmword_1ECD84F98 + 8) = 0u;
        *(_OWORD *)&qword_1ECD84FB0 = 0u;
        xmmword_1ECD84FC0 = 0u;
        unk_1ECD84FD0 = 0u;
        qword_1ECD84FE0 = (uint64_t)&qword_1ECD84FE0;
        unk_1ECD84FE8 = &qword_1ECD84FE0;
        qword_1ECD84FF0 = 0;
        dword_1ECD84FF8 = 0;
      }
    }
    nw::object::__redacted_description_def_instance = (uint64_t)nw::object::class_def::register_method_def(qword_1ECD85048, (uint64_t)nw::object::_redacted_description, 0);
    qword_1ECD85048 = v2;
  }
}

void __cxx_global_var_init_2_88()
{
  unsigned __int8 v0;
  unsigned __int8 v1;
  uint64_t v2;

  {
    if ((v1 & 1) == 0)
    {
      {
        nw::object::_class(void)::instance = (uint64_t)"object";
        *(_QWORD *)algn_1ECD84F58 = 6;
        xmmword_1ECD84F60 = 0u;
        unk_1ECD84F70 = 0u;
        xmmword_1ECD84F80 = 0u;
        *(_OWORD *)&qword_1ECD84F90 = 0u;
        *(__int128 *)((char *)&xmmword_1ECD84F98 + 8) = 0u;
        *(_OWORD *)&qword_1ECD84FB0 = 0u;
        xmmword_1ECD84FC0 = 0u;
        unk_1ECD84FD0 = 0u;
        qword_1ECD84FE0 = (uint64_t)&qword_1ECD84FE0;
        unk_1ECD84FE8 = &qword_1ECD84FE0;
        qword_1ECD84FF0 = 0;
        dword_1ECD84FF8 = 0;
      }
    }
    nw::object::__destroy_def_instance = (uint64_t)nw::object::class_def::register_method_def(qword_1ECD85030, (uint64_t)nw::object::_destroy, 0);
    qword_1ECD85030 = v2;
  }
}

void __cxx_global_var_init_239()
{
  unsigned __int8 v0;
  unsigned __int8 v1;
  uint64_t v2;

  {
    if ((v1 & 1) == 0)
    {
      {
        nw::object::_class(void)::instance = (uint64_t)"object";
        *(_QWORD *)algn_1ECD84F58 = 6;
        xmmword_1ECD84F60 = 0u;
        unk_1ECD84F70 = 0u;
        xmmword_1ECD84F80 = 0u;
        *(_OWORD *)&qword_1ECD84F90 = 0u;
        *(__int128 *)((char *)&xmmword_1ECD84F98 + 8) = 0u;
        *(_OWORD *)&qword_1ECD84FB0 = 0u;
        xmmword_1ECD84FC0 = 0u;
        unk_1ECD84FD0 = 0u;
        qword_1ECD84FE0 = (uint64_t)&qword_1ECD84FE0;
        unk_1ECD84FE8 = &qword_1ECD84FE0;
        qword_1ECD84FF0 = 0;
        dword_1ECD84FF8 = 0;
      }
    }
    nw::object::__description_def_instance = (uint64_t)nw::object::class_def::register_method_def(qword_1ECD85060, (uint64_t)nw::object::_description, 0);
    qword_1ECD85060 = v2;
  }
}

void __cxx_global_var_init_1_240()
{
  unsigned __int8 v0;
  unsigned __int8 v1;
  uint64_t v2;

  {
    if ((v1 & 1) == 0)
    {
      {
        nw::object::_class(void)::instance = (uint64_t)"object";
        *(_QWORD *)algn_1ECD84F58 = 6;
        xmmword_1ECD84F60 = 0u;
        unk_1ECD84F70 = 0u;
        xmmword_1ECD84F80 = 0u;
        *(_OWORD *)&qword_1ECD84F90 = 0u;
        *(__int128 *)((char *)&xmmword_1ECD84F98 + 8) = 0u;
        *(_OWORD *)&qword_1ECD84FB0 = 0u;
        xmmword_1ECD84FC0 = 0u;
        unk_1ECD84FD0 = 0u;
        qword_1ECD84FE0 = (uint64_t)&qword_1ECD84FE0;
        unk_1ECD84FE8 = &qword_1ECD84FE0;
        qword_1ECD84FF0 = 0;
        dword_1ECD84FF8 = 0;
      }
    }
    nw::object::__redacted_description_def_instance = (uint64_t)nw::object::class_def::register_method_def(qword_1ECD85048, (uint64_t)nw::object::_redacted_description, 0);
    qword_1ECD85048 = v2;
  }
}

void __cxx_global_var_init_2_241()
{
  unsigned __int8 v0;
  unsigned __int8 v1;
  uint64_t v2;

  {
    if ((v1 & 1) == 0)
    {
      {
        nw::object::_class(void)::instance = (uint64_t)"object";
        *(_QWORD *)algn_1ECD84F58 = 6;
        xmmword_1ECD84F60 = 0u;
        unk_1ECD84F70 = 0u;
        xmmword_1ECD84F80 = 0u;
        *(_OWORD *)&qword_1ECD84F90 = 0u;
        *(__int128 *)((char *)&xmmword_1ECD84F98 + 8) = 0u;
        *(_OWORD *)&qword_1ECD84FB0 = 0u;
        xmmword_1ECD84FC0 = 0u;
        unk_1ECD84FD0 = 0u;
        qword_1ECD84FE0 = (uint64_t)&qword_1ECD84FE0;
        unk_1ECD84FE8 = &qword_1ECD84FE0;
        qword_1ECD84FF0 = 0;
        dword_1ECD84FF8 = 0;
      }
    }
    nw::object::__destroy_def_instance = (uint64_t)nw::object::class_def::register_method_def(qword_1ECD85030, (uint64_t)nw::object::_destroy, 0);
    qword_1ECD85030 = v2;
  }
}

void __cxx_global_var_init_318()
{
  unsigned __int8 v0;
  unsigned __int8 v1;
  uint64_t v2;

  {
    if ((v1 & 1) == 0)
    {
      {
        nw::object::_class(void)::instance = (uint64_t)"object";
        *(_QWORD *)algn_1ECD84F58 = 6;
        xmmword_1ECD84F60 = 0u;
        unk_1ECD84F70 = 0u;
        xmmword_1ECD84F80 = 0u;
        *(_OWORD *)&qword_1ECD84F90 = 0u;
        *(__int128 *)((char *)&xmmword_1ECD84F98 + 8) = 0u;
        *(_OWORD *)&qword_1ECD84FB0 = 0u;
        xmmword_1ECD84FC0 = 0u;
        unk_1ECD84FD0 = 0u;
        qword_1ECD84FE0 = (uint64_t)&qword_1ECD84FE0;
        unk_1ECD84FE8 = &qword_1ECD84FE0;
        qword_1ECD84FF0 = 0;
        dword_1ECD84FF8 = 0;
      }
    }
    nw::object::__description_def_instance = (uint64_t)nw::object::class_def::register_method_def(qword_1ECD85060, (uint64_t)nw::object::_description, 0);
    qword_1ECD85060 = v2;
  }
}

void __cxx_global_var_init_1_319()
{
  unsigned __int8 v0;
  unsigned __int8 v1;
  uint64_t v2;

  {
    if ((v1 & 1) == 0)
    {
      {
        nw::object::_class(void)::instance = (uint64_t)"object";
        *(_QWORD *)algn_1ECD84F58 = 6;
        xmmword_1ECD84F60 = 0u;
        unk_1ECD84F70 = 0u;
        xmmword_1ECD84F80 = 0u;
        *(_OWORD *)&qword_1ECD84F90 = 0u;
        *(__int128 *)((char *)&xmmword_1ECD84F98 + 8) = 0u;
        *(_OWORD *)&qword_1ECD84FB0 = 0u;
        xmmword_1ECD84FC0 = 0u;
        unk_1ECD84FD0 = 0u;
        qword_1ECD84FE0 = (uint64_t)&qword_1ECD84FE0;
        unk_1ECD84FE8 = &qword_1ECD84FE0;
        qword_1ECD84FF0 = 0;
        dword_1ECD84FF8 = 0;
      }
    }
    nw::object::__redacted_description_def_instance = (uint64_t)nw::object::class_def::register_method_def(qword_1ECD85048, (uint64_t)nw::object::_redacted_description, 0);
    qword_1ECD85048 = v2;
  }
}

void __cxx_global_var_init_2_320()
{
  unsigned __int8 v0;
  unsigned __int8 v1;
  uint64_t v2;

  {
    if ((v1 & 1) == 0)
    {
      {
        nw::object::_class(void)::instance = (uint64_t)"object";
        *(_QWORD *)algn_1ECD84F58 = 6;
        xmmword_1ECD84F60 = 0u;
        unk_1ECD84F70 = 0u;
        xmmword_1ECD84F80 = 0u;
        *(_OWORD *)&qword_1ECD84F90 = 0u;
        *(__int128 *)((char *)&xmmword_1ECD84F98 + 8) = 0u;
        *(_OWORD *)&qword_1ECD84FB0 = 0u;
        xmmword_1ECD84FC0 = 0u;
        unk_1ECD84FD0 = 0u;
        qword_1ECD84FE0 = (uint64_t)&qword_1ECD84FE0;
        unk_1ECD84FE8 = &qword_1ECD84FE0;
        qword_1ECD84FF0 = 0;
        dword_1ECD84FF8 = 0;
      }
    }
    nw::object::__destroy_def_instance = (uint64_t)nw::object::class_def::register_method_def(qword_1ECD85030, (uint64_t)nw::object::_destroy, 0);
    qword_1ECD85030 = v2;
  }
}

void __cxx_global_var_init_481()
{
  unsigned __int8 v0;
  unsigned __int8 v1;
  uint64_t v2;

  {
    if ((v1 & 1) == 0)
    {
      {
        nw::object::_class(void)::instance = (uint64_t)"object";
        *(_QWORD *)algn_1ECD84F58 = 6;
        xmmword_1ECD84F60 = 0u;
        unk_1ECD84F70 = 0u;
        xmmword_1ECD84F80 = 0u;
        *(_OWORD *)&qword_1ECD84F90 = 0u;
        *(__int128 *)((char *)&xmmword_1ECD84F98 + 8) = 0u;
        *(_OWORD *)&qword_1ECD84FB0 = 0u;
        xmmword_1ECD84FC0 = 0u;
        unk_1ECD84FD0 = 0u;
        qword_1ECD84FE0 = (uint64_t)&qword_1ECD84FE0;
        unk_1ECD84FE8 = &qword_1ECD84FE0;
        qword_1ECD84FF0 = 0;
        dword_1ECD84FF8 = 0;
      }
    }
    nw::object::__description_def_instance = (uint64_t)nw::object::class_def::register_method_def(qword_1ECD85060, (uint64_t)nw::object::_description, 0);
    qword_1ECD85060 = v2;
  }
}

void __cxx_global_var_init_1_482()
{
  unsigned __int8 v0;
  unsigned __int8 v1;
  uint64_t v2;

  {
    if ((v1 & 1) == 0)
    {
      {
        nw::object::_class(void)::instance = (uint64_t)"object";
        *(_QWORD *)algn_1ECD84F58 = 6;
        xmmword_1ECD84F60 = 0u;
        unk_1ECD84F70 = 0u;
        xmmword_1ECD84F80 = 0u;
        *(_OWORD *)&qword_1ECD84F90 = 0u;
        *(__int128 *)((char *)&xmmword_1ECD84F98 + 8) = 0u;
        *(_OWORD *)&qword_1ECD84FB0 = 0u;
        xmmword_1ECD84FC0 = 0u;
        unk_1ECD84FD0 = 0u;
        qword_1ECD84FE0 = (uint64_t)&qword_1ECD84FE0;
        unk_1ECD84FE8 = &qword_1ECD84FE0;
        qword_1ECD84FF0 = 0;
        dword_1ECD84FF8 = 0;
      }
    }
    nw::object::__redacted_description_def_instance = (uint64_t)nw::object::class_def::register_method_def(qword_1ECD85048, (uint64_t)nw::object::_redacted_description, 0);
    qword_1ECD85048 = v2;
  }
}

void __cxx_global_var_init_2_483()
{
  unsigned __int8 v0;
  unsigned __int8 v1;
  uint64_t v2;

  {
    if ((v1 & 1) == 0)
    {
      {
        nw::object::_class(void)::instance = (uint64_t)"object";
        *(_QWORD *)algn_1ECD84F58 = 6;
        xmmword_1ECD84F60 = 0u;
        unk_1ECD84F70 = 0u;
        xmmword_1ECD84F80 = 0u;
        *(_OWORD *)&qword_1ECD84F90 = 0u;
        *(__int128 *)((char *)&xmmword_1ECD84F98 + 8) = 0u;
        *(_OWORD *)&qword_1ECD84FB0 = 0u;
        xmmword_1ECD84FC0 = 0u;
        unk_1ECD84FD0 = 0u;
        qword_1ECD84FE0 = (uint64_t)&qword_1ECD84FE0;
        unk_1ECD84FE8 = &qword_1ECD84FE0;
        qword_1ECD84FF0 = 0;
        dword_1ECD84FF8 = 0;
      }
    }
    nw::object::__destroy_def_instance = (uint64_t)nw::object::class_def::register_method_def(qword_1ECD85030, (uint64_t)nw::object::_destroy, 0);
    qword_1ECD85030 = v2;
  }
}

void __cxx_global_var_init_909()
{
  unsigned __int8 v0;
  unsigned __int8 v1;
  uint64_t v2;

  {
    if ((v1 & 1) == 0)
    {
      {
        nw::object::_class(void)::instance = (uint64_t)"object";
        *(_QWORD *)algn_1ECD84F58 = 6;
        xmmword_1ECD84F60 = 0u;
        unk_1ECD84F70 = 0u;
        xmmword_1ECD84F80 = 0u;
        *(_OWORD *)&qword_1ECD84F90 = 0u;
        *(__int128 *)((char *)&xmmword_1ECD84F98 + 8) = 0u;
        *(_OWORD *)&qword_1ECD84FB0 = 0u;
        xmmword_1ECD84FC0 = 0u;
        unk_1ECD84FD0 = 0u;
        qword_1ECD84FE0 = (uint64_t)&qword_1ECD84FE0;
        unk_1ECD84FE8 = &qword_1ECD84FE0;
        qword_1ECD84FF0 = 0;
        dword_1ECD84FF8 = 0;
      }
    }
    nw::object::__description_def_instance = (uint64_t)nw::object::class_def::register_method_def(qword_1ECD85060, (uint64_t)nw::object::_description, 0);
    qword_1ECD85060 = v2;
  }
}

void __cxx_global_var_init_1_910()
{
  unsigned __int8 v0;
  unsigned __int8 v1;
  uint64_t v2;

  {
    if ((v1 & 1) == 0)
    {
      {
        nw::object::_class(void)::instance = (uint64_t)"object";
        *(_QWORD *)algn_1ECD84F58 = 6;
        xmmword_1ECD84F60 = 0u;
        unk_1ECD84F70 = 0u;
        xmmword_1ECD84F80 = 0u;
        *(_OWORD *)&qword_1ECD84F90 = 0u;
        *(__int128 *)((char *)&xmmword_1ECD84F98 + 8) = 0u;
        *(_OWORD *)&qword_1ECD84FB0 = 0u;
        xmmword_1ECD84FC0 = 0u;
        unk_1ECD84FD0 = 0u;
        qword_1ECD84FE0 = (uint64_t)&qword_1ECD84FE0;
        unk_1ECD84FE8 = &qword_1ECD84FE0;
        qword_1ECD84FF0 = 0;
        dword_1ECD84FF8 = 0;
      }
    }
    nw::object::__redacted_description_def_instance = (uint64_t)nw::object::class_def::register_method_def(qword_1ECD85048, (uint64_t)nw::object::_redacted_description, 0);
    qword_1ECD85048 = v2;
  }
}

void __cxx_global_var_init_2_911()
{
  unsigned __int8 v0;
  unsigned __int8 v1;
  uint64_t v2;

  {
    if ((v1 & 1) == 0)
    {
      {
        nw::object::_class(void)::instance = (uint64_t)"object";
        *(_QWORD *)algn_1ECD84F58 = 6;
        xmmword_1ECD84F60 = 0u;
        unk_1ECD84F70 = 0u;
        xmmword_1ECD84F80 = 0u;
        *(_OWORD *)&qword_1ECD84F90 = 0u;
        *(__int128 *)((char *)&xmmword_1ECD84F98 + 8) = 0u;
        *(_OWORD *)&qword_1ECD84FB0 = 0u;
        xmmword_1ECD84FC0 = 0u;
        unk_1ECD84FD0 = 0u;
        qword_1ECD84FE0 = (uint64_t)&qword_1ECD84FE0;
        unk_1ECD84FE8 = &qword_1ECD84FE0;
        qword_1ECD84FF0 = 0;
        dword_1ECD84FF8 = 0;
      }
    }
    nw::object::__destroy_def_instance = (uint64_t)nw::object::class_def::register_method_def(qword_1ECD85030, (uint64_t)nw::object::_destroy, 0);
    qword_1ECD85030 = v2;
  }
}

void __cxx_global_var_init_1132()
{
  unsigned __int8 v0;
  unsigned __int8 v1;
  uint64_t v2;

  {
    if ((v1 & 1) == 0)
    {
      {
        nw::object::_class(void)::instance = (uint64_t)"object";
        *(_QWORD *)algn_1ECD84F58 = 6;
        xmmword_1ECD84F60 = 0u;
        unk_1ECD84F70 = 0u;
        xmmword_1ECD84F80 = 0u;
        *(_OWORD *)&qword_1ECD84F90 = 0u;
        *(__int128 *)((char *)&xmmword_1ECD84F98 + 8) = 0u;
        *(_OWORD *)&qword_1ECD84FB0 = 0u;
        xmmword_1ECD84FC0 = 0u;
        unk_1ECD84FD0 = 0u;
        qword_1ECD84FE0 = (uint64_t)&qword_1ECD84FE0;
        unk_1ECD84FE8 = &qword_1ECD84FE0;
        qword_1ECD84FF0 = 0;
        dword_1ECD84FF8 = 0;
      }
    }
    nw::object::__description_def_instance = (uint64_t)nw::object::class_def::register_method_def(qword_1ECD85060, (uint64_t)nw::object::_description, 0);
    qword_1ECD85060 = v2;
  }
}

void __cxx_global_var_init_1_1133()
{
  unsigned __int8 v0;
  unsigned __int8 v1;
  uint64_t v2;

  {
    if ((v1 & 1) == 0)
    {
      {
        nw::object::_class(void)::instance = (uint64_t)"object";
        *(_QWORD *)algn_1ECD84F58 = 6;
        xmmword_1ECD84F60 = 0u;
        unk_1ECD84F70 = 0u;
        xmmword_1ECD84F80 = 0u;
        *(_OWORD *)&qword_1ECD84F90 = 0u;
        *(__int128 *)((char *)&xmmword_1ECD84F98 + 8) = 0u;
        *(_OWORD *)&qword_1ECD84FB0 = 0u;
        xmmword_1ECD84FC0 = 0u;
        unk_1ECD84FD0 = 0u;
        qword_1ECD84FE0 = (uint64_t)&qword_1ECD84FE0;
        unk_1ECD84FE8 = &qword_1ECD84FE0;
        qword_1ECD84FF0 = 0;
        dword_1ECD84FF8 = 0;
      }
    }
    nw::object::__redacted_description_def_instance = (uint64_t)nw::object::class_def::register_method_def(qword_1ECD85048, (uint64_t)nw::object::_redacted_description, 0);
    qword_1ECD85048 = v2;
  }
}

void __cxx_global_var_init_2_1134()
{
  unsigned __int8 v0;
  unsigned __int8 v1;
  uint64_t v2;

  {
    if ((v1 & 1) == 0)
    {
      {
        nw::object::_class(void)::instance = (uint64_t)"object";
        *(_QWORD *)algn_1ECD84F58 = 6;
        xmmword_1ECD84F60 = 0u;
        unk_1ECD84F70 = 0u;
        xmmword_1ECD84F80 = 0u;
        *(_OWORD *)&qword_1ECD84F90 = 0u;
        *(__int128 *)((char *)&xmmword_1ECD84F98 + 8) = 0u;
        *(_OWORD *)&qword_1ECD84FB0 = 0u;
        xmmword_1ECD84FC0 = 0u;
        unk_1ECD84FD0 = 0u;
        qword_1ECD84FE0 = (uint64_t)&qword_1ECD84FE0;
        unk_1ECD84FE8 = &qword_1ECD84FE0;
        qword_1ECD84FF0 = 0;
        dword_1ECD84FF8 = 0;
      }
    }
    nw::object::__destroy_def_instance = (uint64_t)nw::object::class_def::register_method_def(qword_1ECD85030, (uint64_t)nw::object::_destroy, 0);
    qword_1ECD85030 = v2;
  }
}

void __cxx_global_var_init_1947()
{
  unsigned __int8 v0;
  unsigned __int8 v1;
  uint64_t v2;

  {
    if ((v1 & 1) == 0)
    {
      {
        nw::object::_class(void)::instance = (uint64_t)"object";
        *(_QWORD *)algn_1ECD84F58 = 6;
        xmmword_1ECD84F60 = 0u;
        unk_1ECD84F70 = 0u;
        xmmword_1ECD84F80 = 0u;
        *(_OWORD *)&qword_1ECD84F90 = 0u;
        *(__int128 *)((char *)&xmmword_1ECD84F98 + 8) = 0u;
        *(_OWORD *)&qword_1ECD84FB0 = 0u;
        xmmword_1ECD84FC0 = 0u;
        unk_1ECD84FD0 = 0u;
        qword_1ECD84FE0 = (uint64_t)&qword_1ECD84FE0;
        unk_1ECD84FE8 = &qword_1ECD84FE0;
        qword_1ECD84FF0 = 0;
        dword_1ECD84FF8 = 0;
      }
    }
    nw::object::__description_def_instance = (uint64_t)nw::object::class_def::register_method_def(qword_1ECD85060, (uint64_t)nw::object::_description, 0);
    qword_1ECD85060 = v2;
  }
}

void __cxx_global_var_init_1_1948()
{
  unsigned __int8 v0;
  unsigned __int8 v1;
  uint64_t v2;

  {
    if ((v1 & 1) == 0)
    {
      {
        nw::object::_class(void)::instance = (uint64_t)"object";
        *(_QWORD *)algn_1ECD84F58 = 6;
        xmmword_1ECD84F60 = 0u;
        unk_1ECD84F70 = 0u;
        xmmword_1ECD84F80 = 0u;
        *(_OWORD *)&qword_1ECD84F90 = 0u;
        *(__int128 *)((char *)&xmmword_1ECD84F98 + 8) = 0u;
        *(_OWORD *)&qword_1ECD84FB0 = 0u;
        xmmword_1ECD84FC0 = 0u;
        unk_1ECD84FD0 = 0u;
        qword_1ECD84FE0 = (uint64_t)&qword_1ECD84FE0;
        unk_1ECD84FE8 = &qword_1ECD84FE0;
        qword_1ECD84FF0 = 0;
        dword_1ECD84FF8 = 0;
      }
    }
    nw::object::__redacted_description_def_instance = (uint64_t)nw::object::class_def::register_method_def(qword_1ECD85048, (uint64_t)nw::object::_redacted_description, 0);
    qword_1ECD85048 = v2;
  }
}

void __cxx_global_var_init_2_1949()
{
  unsigned __int8 v0;
  unsigned __int8 v1;
  uint64_t v2;

  {
    if ((v1 & 1) == 0)
    {
      {
        nw::object::_class(void)::instance = (uint64_t)"object";
        *(_QWORD *)algn_1ECD84F58 = 6;
        xmmword_1ECD84F60 = 0u;
        unk_1ECD84F70 = 0u;
        xmmword_1ECD84F80 = 0u;
        *(_OWORD *)&qword_1ECD84F90 = 0u;
        *(__int128 *)((char *)&xmmword_1ECD84F98 + 8) = 0u;
        *(_OWORD *)&qword_1ECD84FB0 = 0u;
        xmmword_1ECD84FC0 = 0u;
        unk_1ECD84FD0 = 0u;
        qword_1ECD84FE0 = (uint64_t)&qword_1ECD84FE0;
        unk_1ECD84FE8 = &qword_1ECD84FE0;
        qword_1ECD84FF0 = 0;
        dword_1ECD84FF8 = 0;
      }
    }
    nw::object::__destroy_def_instance = (uint64_t)nw::object::class_def::register_method_def(qword_1ECD85030, (uint64_t)nw::object::_destroy, 0);
    qword_1ECD85030 = v2;
  }
}

void __cxx_global_var_init_2624()
{
  unsigned __int8 v0;
  unsigned __int8 v1;
  uint64_t v2;

  {
    if ((v1 & 1) == 0)
    {
      {
        nw::object::_class(void)::instance = (uint64_t)"object";
        *(_QWORD *)algn_1ECD84F58 = 6;
        xmmword_1ECD84F60 = 0u;
        unk_1ECD84F70 = 0u;
        xmmword_1ECD84F80 = 0u;
        *(_OWORD *)&qword_1ECD84F90 = 0u;
        *(__int128 *)((char *)&xmmword_1ECD84F98 + 8) = 0u;
        *(_OWORD *)&qword_1ECD84FB0 = 0u;
        xmmword_1ECD84FC0 = 0u;
        unk_1ECD84FD0 = 0u;
        qword_1ECD84FE0 = (uint64_t)&qword_1ECD84FE0;
        unk_1ECD84FE8 = &qword_1ECD84FE0;
        qword_1ECD84FF0 = 0;
        dword_1ECD84FF8 = 0;
      }
    }
    nw::object::__description_def_instance = (uint64_t)nw::object::class_def::register_method_def(qword_1ECD85060, (uint64_t)nw::object::_description, 0);
    qword_1ECD85060 = v2;
  }
}

void __cxx_global_var_init_1_2625()
{
  unsigned __int8 v0;
  unsigned __int8 v1;
  uint64_t v2;

  {
    if ((v1 & 1) == 0)
    {
      {
        nw::object::_class(void)::instance = (uint64_t)"object";
        *(_QWORD *)algn_1ECD84F58 = 6;
        xmmword_1ECD84F60 = 0u;
        unk_1ECD84F70 = 0u;
        xmmword_1ECD84F80 = 0u;
        *(_OWORD *)&qword_1ECD84F90 = 0u;
        *(__int128 *)((char *)&xmmword_1ECD84F98 + 8) = 0u;
        *(_OWORD *)&qword_1ECD84FB0 = 0u;
        xmmword_1ECD84FC0 = 0u;
        unk_1ECD84FD0 = 0u;
        qword_1ECD84FE0 = (uint64_t)&qword_1ECD84FE0;
        unk_1ECD84FE8 = &qword_1ECD84FE0;
        qword_1ECD84FF0 = 0;
        dword_1ECD84FF8 = 0;
      }
    }
    nw::object::__redacted_description_def_instance = (uint64_t)nw::object::class_def::register_method_def(qword_1ECD85048, (uint64_t)nw::object::_redacted_description, 0);
    qword_1ECD85048 = v2;
  }
}

void __cxx_global_var_init_2_2626()
{
  unsigned __int8 v0;
  unsigned __int8 v1;
  uint64_t v2;

  {
    if ((v1 & 1) == 0)
    {
      {
        nw::object::_class(void)::instance = (uint64_t)"object";
        *(_QWORD *)algn_1ECD84F58 = 6;
        xmmword_1ECD84F60 = 0u;
        unk_1ECD84F70 = 0u;
        xmmword_1ECD84F80 = 0u;
        *(_OWORD *)&qword_1ECD84F90 = 0u;
        *(__int128 *)((char *)&xmmword_1ECD84F98 + 8) = 0u;
        *(_OWORD *)&qword_1ECD84FB0 = 0u;
        xmmword_1ECD84FC0 = 0u;
        unk_1ECD84FD0 = 0u;
        qword_1ECD84FE0 = (uint64_t)&qword_1ECD84FE0;
        unk_1ECD84FE8 = &qword_1ECD84FE0;
        qword_1ECD84FF0 = 0;
        dword_1ECD84FF8 = 0;
      }
    }
    nw::object::__destroy_def_instance = (uint64_t)nw::object::class_def::register_method_def(qword_1ECD85030, (uint64_t)nw::object::_destroy, 0);
    qword_1ECD85030 = v2;
  }
}

void __cxx_global_var_init_3132()
{
  unsigned __int8 v0;
  unsigned __int8 v1;
  uint64_t v2;

  {
    if ((v1 & 1) == 0)
    {
      {
        nw::object::_class(void)::instance = (uint64_t)"object";
        *(_QWORD *)algn_1ECD84F58 = 6;
        xmmword_1ECD84F60 = 0u;
        unk_1ECD84F70 = 0u;
        xmmword_1ECD84F80 = 0u;
        *(_OWORD *)&qword_1ECD84F90 = 0u;
        *(__int128 *)((char *)&xmmword_1ECD84F98 + 8) = 0u;
        *(_OWORD *)&qword_1ECD84FB0 = 0u;
        xmmword_1ECD84FC0 = 0u;
        unk_1ECD84FD0 = 0u;
        qword_1ECD84FE0 = (uint64_t)&qword_1ECD84FE0;
        unk_1ECD84FE8 = &qword_1ECD84FE0;
        qword_1ECD84FF0 = 0;
        dword_1ECD84FF8 = 0;
      }
    }
    nw::object::__description_def_instance = (uint64_t)nw::object::class_def::register_method_def(qword_1ECD85060, (uint64_t)nw::object::_description, 0);
    qword_1ECD85060 = v2;
  }
}

void __cxx_global_var_init_1_3133()
{
  unsigned __int8 v0;
  unsigned __int8 v1;
  uint64_t v2;

  {
    if ((v1 & 1) == 0)
    {
      {
        nw::object::_class(void)::instance = (uint64_t)"object";
        *(_QWORD *)algn_1ECD84F58 = 6;
        xmmword_1ECD84F60 = 0u;
        unk_1ECD84F70 = 0u;
        xmmword_1ECD84F80 = 0u;
        *(_OWORD *)&qword_1ECD84F90 = 0u;
        *(__int128 *)((char *)&xmmword_1ECD84F98 + 8) = 0u;
        *(_OWORD *)&qword_1ECD84FB0 = 0u;
        xmmword_1ECD84FC0 = 0u;
        unk_1ECD84FD0 = 0u;
        qword_1ECD84FE0 = (uint64_t)&qword_1ECD84FE0;
        unk_1ECD84FE8 = &qword_1ECD84FE0;
        qword_1ECD84FF0 = 0;
        dword_1ECD84FF8 = 0;
      }
    }
    nw::object::__redacted_description_def_instance = (uint64_t)nw::object::class_def::register_method_def(qword_1ECD85048, (uint64_t)nw::object::_redacted_description, 0);
    qword_1ECD85048 = v2;
  }
}

void __cxx_global_var_init_2_3134()
{
  unsigned __int8 v0;
  unsigned __int8 v1;
  uint64_t v2;

  {
    if ((v1 & 1) == 0)
    {
      {
        nw::object::_class(void)::instance = (uint64_t)"object";
        *(_QWORD *)algn_1ECD84F58 = 6;
        xmmword_1ECD84F60 = 0u;
        unk_1ECD84F70 = 0u;
        xmmword_1ECD84F80 = 0u;
        *(_OWORD *)&qword_1ECD84F90 = 0u;
        *(__int128 *)((char *)&xmmword_1ECD84F98 + 8) = 0u;
        *(_OWORD *)&qword_1ECD84FB0 = 0u;
        xmmword_1ECD84FC0 = 0u;
        unk_1ECD84FD0 = 0u;
        qword_1ECD84FE0 = (uint64_t)&qword_1ECD84FE0;
        unk_1ECD84FE8 = &qword_1ECD84FE0;
        qword_1ECD84FF0 = 0;
        dword_1ECD84FF8 = 0;
      }
    }
    nw::object::__destroy_def_instance = (uint64_t)nw::object::class_def::register_method_def(qword_1ECD85030, (uint64_t)nw::object::_destroy, 0);
    qword_1ECD85030 = v2;
  }
}

void __cxx_global_var_init_3582()
{
  unsigned __int8 v0;
  unsigned __int8 v1;
  uint64_t v2;

  {
    if ((v1 & 1) == 0)
    {
      {
        nw::object::_class(void)::instance = (uint64_t)"object";
        *(_QWORD *)algn_1ECD84F58 = 6;
        xmmword_1ECD84F60 = 0u;
        unk_1ECD84F70 = 0u;
        xmmword_1ECD84F80 = 0u;
        *(_OWORD *)&qword_1ECD84F90 = 0u;
        *(__int128 *)((char *)&xmmword_1ECD84F98 + 8) = 0u;
        *(_OWORD *)&qword_1ECD84FB0 = 0u;
        xmmword_1ECD84FC0 = 0u;
        unk_1ECD84FD0 = 0u;
        qword_1ECD84FE0 = (uint64_t)&qword_1ECD84FE0;
        unk_1ECD84FE8 = &qword_1ECD84FE0;
        qword_1ECD84FF0 = 0;
        dword_1ECD84FF8 = 0;
      }
    }
    nw::object::__description_def_instance = (uint64_t)nw::object::class_def::register_method_def(qword_1ECD85060, (uint64_t)nw::object::_description, 0);
    qword_1ECD85060 = v2;
  }
}

void __cxx_global_var_init_1_3583()
{
  unsigned __int8 v0;
  unsigned __int8 v1;
  uint64_t v2;

  {
    if ((v1 & 1) == 0)
    {
      {
        nw::object::_class(void)::instance = (uint64_t)"object";
        *(_QWORD *)algn_1ECD84F58 = 6;
        xmmword_1ECD84F60 = 0u;
        unk_1ECD84F70 = 0u;
        xmmword_1ECD84F80 = 0u;
        *(_OWORD *)&qword_1ECD84F90 = 0u;
        *(__int128 *)((char *)&xmmword_1ECD84F98 + 8) = 0u;
        *(_OWORD *)&qword_1ECD84FB0 = 0u;
        xmmword_1ECD84FC0 = 0u;
        unk_1ECD84FD0 = 0u;
        qword_1ECD84FE0 = (uint64_t)&qword_1ECD84FE0;
        unk_1ECD84FE8 = &qword_1ECD84FE0;
        qword_1ECD84FF0 = 0;
        dword_1ECD84FF8 = 0;
      }
    }
    nw::object::__redacted_description_def_instance = (uint64_t)nw::object::class_def::register_method_def(qword_1ECD85048, (uint64_t)nw::object::_redacted_description, 0);
    qword_1ECD85048 = v2;
  }
}

void __cxx_global_var_init_2_3584()
{
  unsigned __int8 v0;
  unsigned __int8 v1;
  uint64_t v2;

  {
    if ((v1 & 1) == 0)
    {
      {
        nw::object::_class(void)::instance = (uint64_t)"object";
        *(_QWORD *)algn_1ECD84F58 = 6;
        xmmword_1ECD84F60 = 0u;
        unk_1ECD84F70 = 0u;
        xmmword_1ECD84F80 = 0u;
        *(_OWORD *)&qword_1ECD84F90 = 0u;
        *(__int128 *)((char *)&xmmword_1ECD84F98 + 8) = 0u;
        *(_OWORD *)&qword_1ECD84FB0 = 0u;
        xmmword_1ECD84FC0 = 0u;
        unk_1ECD84FD0 = 0u;
        qword_1ECD84FE0 = (uint64_t)&qword_1ECD84FE0;
        unk_1ECD84FE8 = &qword_1ECD84FE0;
        qword_1ECD84FF0 = 0;
        dword_1ECD84FF8 = 0;
      }
    }
    nw::object::__destroy_def_instance = (uint64_t)nw::object::class_def::register_method_def(qword_1ECD85030, (uint64_t)nw::object::_destroy, 0);
    qword_1ECD85030 = v2;
  }
}

void __cxx_global_var_init_3776()
{
  unsigned __int8 v0;
  unsigned __int8 v1;
  uint64_t v2;

  {
    if ((v1 & 1) == 0)
    {
      {
        nw::object::_class(void)::instance = (uint64_t)"object";
        *(_QWORD *)algn_1ECD84F58 = 6;
        xmmword_1ECD84F60 = 0u;
        unk_1ECD84F70 = 0u;
        xmmword_1ECD84F80 = 0u;
        *(_OWORD *)&qword_1ECD84F90 = 0u;
        *(__int128 *)((char *)&xmmword_1ECD84F98 + 8) = 0u;
        *(_OWORD *)&qword_1ECD84FB0 = 0u;
        xmmword_1ECD84FC0 = 0u;
        unk_1ECD84FD0 = 0u;
        qword_1ECD84FE0 = (uint64_t)&qword_1ECD84FE0;
        unk_1ECD84FE8 = &qword_1ECD84FE0;
        qword_1ECD84FF0 = 0;
        dword_1ECD84FF8 = 0;
      }
    }
    nw::object::__description_def_instance = (uint64_t)nw::object::class_def::register_method_def(qword_1ECD85060, (uint64_t)nw::object::_description, 0);
    qword_1ECD85060 = v2;
  }
}

void __cxx_global_var_init_1_3777()
{
  unsigned __int8 v0;
  unsigned __int8 v1;
  uint64_t v2;

  {
    if ((v1 & 1) == 0)
    {
      {
        nw::object::_class(void)::instance = (uint64_t)"object";
        *(_QWORD *)algn_1ECD84F58 = 6;
        xmmword_1ECD84F60 = 0u;
        unk_1ECD84F70 = 0u;
        xmmword_1ECD84F80 = 0u;
        *(_OWORD *)&qword_1ECD84F90 = 0u;
        *(__int128 *)((char *)&xmmword_1ECD84F98 + 8) = 0u;
        *(_OWORD *)&qword_1ECD84FB0 = 0u;
        xmmword_1ECD84FC0 = 0u;
        unk_1ECD84FD0 = 0u;
        qword_1ECD84FE0 = (uint64_t)&qword_1ECD84FE0;
        unk_1ECD84FE8 = &qword_1ECD84FE0;
        qword_1ECD84FF0 = 0;
        dword_1ECD84FF8 = 0;
      }
    }
    nw::object::__redacted_description_def_instance = (uint64_t)nw::object::class_def::register_method_def(qword_1ECD85048, (uint64_t)nw::object::_redacted_description, 0);
    qword_1ECD85048 = v2;
  }
}

void __cxx_global_var_init_2_3778()
{
  unsigned __int8 v0;
  unsigned __int8 v1;
  uint64_t v2;

  {
    if ((v1 & 1) == 0)
    {
      {
        nw::object::_class(void)::instance = (uint64_t)"object";
        *(_QWORD *)algn_1ECD84F58 = 6;
        xmmword_1ECD84F60 = 0u;
        unk_1ECD84F70 = 0u;
        xmmword_1ECD84F80 = 0u;
        *(_OWORD *)&qword_1ECD84F90 = 0u;
        *(__int128 *)((char *)&xmmword_1ECD84F98 + 8) = 0u;
        *(_OWORD *)&qword_1ECD84FB0 = 0u;
        xmmword_1ECD84FC0 = 0u;
        unk_1ECD84FD0 = 0u;
        qword_1ECD84FE0 = (uint64_t)&qword_1ECD84FE0;
        unk_1ECD84FE8 = &qword_1ECD84FE0;
        qword_1ECD84FF0 = 0;
        dword_1ECD84FF8 = 0;
      }
    }
    nw::object::__destroy_def_instance = (uint64_t)nw::object::class_def::register_method_def(qword_1ECD85030, (uint64_t)nw::object::_destroy, 0);
    qword_1ECD85030 = v2;
  }
}

void __cxx_global_var_init_4261()
{
  unsigned __int8 v0;
  unsigned __int8 v1;
  uint64_t v2;

  {
    if ((v1 & 1) == 0)
    {
      {
        nw::object::_class(void)::instance = (uint64_t)"object";
        *(_QWORD *)algn_1ECD84F58 = 6;
        xmmword_1ECD84F60 = 0u;
        unk_1ECD84F70 = 0u;
        xmmword_1ECD84F80 = 0u;
        *(_OWORD *)&qword_1ECD84F90 = 0u;
        *(__int128 *)((char *)&xmmword_1ECD84F98 + 8) = 0u;
        *(_OWORD *)&qword_1ECD84FB0 = 0u;
        xmmword_1ECD84FC0 = 0u;
        unk_1ECD84FD0 = 0u;
        qword_1ECD84FE0 = (uint64_t)&qword_1ECD84FE0;
        unk_1ECD84FE8 = &qword_1ECD84FE0;
        qword_1ECD84FF0 = 0;
        dword_1ECD84FF8 = 0;
      }
    }
    nw::object::__description_def_instance = (uint64_t)nw::object::class_def::register_method_def(qword_1ECD85060, (uint64_t)nw::object::_description, 0);
    qword_1ECD85060 = v2;
  }
}

void __cxx_global_var_init_1_4262()
{
  unsigned __int8 v0;
  unsigned __int8 v1;
  uint64_t v2;

  {
    if ((v1 & 1) == 0)
    {
      {
        nw::object::_class(void)::instance = (uint64_t)"object";
        *(_QWORD *)algn_1ECD84F58 = 6;
        xmmword_1ECD84F60 = 0u;
        unk_1ECD84F70 = 0u;
        xmmword_1ECD84F80 = 0u;
        *(_OWORD *)&qword_1ECD84F90 = 0u;
        *(__int128 *)((char *)&xmmword_1ECD84F98 + 8) = 0u;
        *(_OWORD *)&qword_1ECD84FB0 = 0u;
        xmmword_1ECD84FC0 = 0u;
        unk_1ECD84FD0 = 0u;
        qword_1ECD84FE0 = (uint64_t)&qword_1ECD84FE0;
        unk_1ECD84FE8 = &qword_1ECD84FE0;
        qword_1ECD84FF0 = 0;
        dword_1ECD84FF8 = 0;
      }
    }
    nw::object::__redacted_description_def_instance = (uint64_t)nw::object::class_def::register_method_def(qword_1ECD85048, (uint64_t)nw::object::_redacted_description, 0);
    qword_1ECD85048 = v2;
  }
}

void __cxx_global_var_init_2_4263()
{
  unsigned __int8 v0;
  unsigned __int8 v1;
  uint64_t v2;

  {
    if ((v1 & 1) == 0)
    {
      {
        nw::object::_class(void)::instance = (uint64_t)"object";
        *(_QWORD *)algn_1ECD84F58 = 6;
        xmmword_1ECD84F60 = 0u;
        unk_1ECD84F70 = 0u;
        xmmword_1ECD84F80 = 0u;
        *(_OWORD *)&qword_1ECD84F90 = 0u;
        *(__int128 *)((char *)&xmmword_1ECD84F98 + 8) = 0u;
        *(_OWORD *)&qword_1ECD84FB0 = 0u;
        xmmword_1ECD84FC0 = 0u;
        unk_1ECD84FD0 = 0u;
        qword_1ECD84FE0 = (uint64_t)&qword_1ECD84FE0;
        unk_1ECD84FE8 = &qword_1ECD84FE0;
        qword_1ECD84FF0 = 0;
        dword_1ECD84FF8 = 0;
      }
    }
    nw::object::__destroy_def_instance = (uint64_t)nw::object::class_def::register_method_def(qword_1ECD85030, (uint64_t)nw::object::_destroy, 0);
    qword_1ECD85030 = v2;
  }
}

void __cxx_global_var_init_5537()
{
  unsigned __int8 v0;
  unsigned __int8 v1;
  uint64_t v2;

  {
    if ((v1 & 1) == 0)
    {
      {
        nw::object::_class(void)::instance = (uint64_t)"object";
        *(_QWORD *)algn_1ECD84F58 = 6;
        xmmword_1ECD84F60 = 0u;
        unk_1ECD84F70 = 0u;
        xmmword_1ECD84F80 = 0u;
        *(_OWORD *)&qword_1ECD84F90 = 0u;
        *(__int128 *)((char *)&xmmword_1ECD84F98 + 8) = 0u;
        *(_OWORD *)&qword_1ECD84FB0 = 0u;
        xmmword_1ECD84FC0 = 0u;
        unk_1ECD84FD0 = 0u;
        qword_1ECD84FE0 = (uint64_t)&qword_1ECD84FE0;
        unk_1ECD84FE8 = &qword_1ECD84FE0;
        qword_1ECD84FF0 = 0;
        dword_1ECD84FF8 = 0;
      }
    }
    nw::object::__description_def_instance = (uint64_t)nw::object::class_def::register_method_def(qword_1ECD85060, (uint64_t)nw::object::_description, 0);
    qword_1ECD85060 = v2;
  }
}

void __cxx_global_var_init_1_5538()
{
  unsigned __int8 v0;
  unsigned __int8 v1;
  uint64_t v2;

  {
    if ((v1 & 1) == 0)
    {
      {
        nw::object::_class(void)::instance = (uint64_t)"object";
        *(_QWORD *)algn_1ECD84F58 = 6;
        xmmword_1ECD84F60 = 0u;
        unk_1ECD84F70 = 0u;
        xmmword_1ECD84F80 = 0u;
        *(_OWORD *)&qword_1ECD84F90 = 0u;
        *(__int128 *)((char *)&xmmword_1ECD84F98 + 8) = 0u;
        *(_OWORD *)&qword_1ECD84FB0 = 0u;
        xmmword_1ECD84FC0 = 0u;
        unk_1ECD84FD0 = 0u;
        qword_1ECD84FE0 = (uint64_t)&qword_1ECD84FE0;
        unk_1ECD84FE8 = &qword_1ECD84FE0;
        qword_1ECD84FF0 = 0;
        dword_1ECD84FF8 = 0;
      }
    }
    nw::object::__redacted_description_def_instance = (uint64_t)nw::object::class_def::register_method_def(qword_1ECD85048, (uint64_t)nw::object::_redacted_description, 0);
    qword_1ECD85048 = v2;
  }
}

void __cxx_global_var_init_2_5539()
{
  unsigned __int8 v0;
  unsigned __int8 v1;
  uint64_t v2;

  {
    if ((v1 & 1) == 0)
    {
      {
        nw::object::_class(void)::instance = (uint64_t)"object";
        *(_QWORD *)algn_1ECD84F58 = 6;
        xmmword_1ECD84F60 = 0u;
        unk_1ECD84F70 = 0u;
        xmmword_1ECD84F80 = 0u;
        *(_OWORD *)&qword_1ECD84F90 = 0u;
        *(__int128 *)((char *)&xmmword_1ECD84F98 + 8) = 0u;
        *(_OWORD *)&qword_1ECD84FB0 = 0u;
        xmmword_1ECD84FC0 = 0u;
        unk_1ECD84FD0 = 0u;
        qword_1ECD84FE0 = (uint64_t)&qword_1ECD84FE0;
        unk_1ECD84FE8 = &qword_1ECD84FE0;
        qword_1ECD84FF0 = 0;
        dword_1ECD84FF8 = 0;
      }
    }
    nw::object::__destroy_def_instance = (uint64_t)nw::object::class_def::register_method_def(qword_1ECD85030, (uint64_t)nw::object::_destroy, 0);
    qword_1ECD85030 = v2;
  }
}

void __cxx_global_var_init_6478()
{
  unsigned __int8 v0;
  unsigned __int8 v1;
  uint64_t v2;

  {
    if ((v1 & 1) == 0)
    {
      {
        nw::object::_class(void)::instance = (uint64_t)"object";
        *(_QWORD *)algn_1ECD84F58 = 6;
        xmmword_1ECD84F60 = 0u;
        unk_1ECD84F70 = 0u;
        xmmword_1ECD84F80 = 0u;
        *(_OWORD *)&qword_1ECD84F90 = 0u;
        *(__int128 *)((char *)&xmmword_1ECD84F98 + 8) = 0u;
        *(_OWORD *)&qword_1ECD84FB0 = 0u;
        xmmword_1ECD84FC0 = 0u;
        unk_1ECD84FD0 = 0u;
        qword_1ECD84FE0 = (uint64_t)&qword_1ECD84FE0;
        unk_1ECD84FE8 = &qword_1ECD84FE0;
        qword_1ECD84FF0 = 0;
        dword_1ECD84FF8 = 0;
      }
    }
    nw::object::__description_def_instance = (uint64_t)nw::object::class_def::register_method_def(qword_1ECD85060, (uint64_t)nw::object::_description, 0);
    qword_1ECD85060 = v2;
  }
}

void __cxx_global_var_init_1_6479()
{
  unsigned __int8 v0;
  unsigned __int8 v1;
  uint64_t v2;

  {
    if ((v1 & 1) == 0)
    {
      {
        nw::object::_class(void)::instance = (uint64_t)"object";
        *(_QWORD *)algn_1ECD84F58 = 6;
        xmmword_1ECD84F60 = 0u;
        unk_1ECD84F70 = 0u;
        xmmword_1ECD84F80 = 0u;
        *(_OWORD *)&qword_1ECD84F90 = 0u;
        *(__int128 *)((char *)&xmmword_1ECD84F98 + 8) = 0u;
        *(_OWORD *)&qword_1ECD84FB0 = 0u;
        xmmword_1ECD84FC0 = 0u;
        unk_1ECD84FD0 = 0u;
        qword_1ECD84FE0 = (uint64_t)&qword_1ECD84FE0;
        unk_1ECD84FE8 = &qword_1ECD84FE0;
        qword_1ECD84FF0 = 0;
        dword_1ECD84FF8 = 0;
      }
    }
    nw::object::__redacted_description_def_instance = (uint64_t)nw::object::class_def::register_method_def(qword_1ECD85048, (uint64_t)nw::object::_redacted_description, 0);
    qword_1ECD85048 = v2;
  }
}

void __cxx_global_var_init_2_6480()
{
  unsigned __int8 v0;
  unsigned __int8 v1;
  uint64_t v2;

  {
    if ((v1 & 1) == 0)
    {
      {
        nw::object::_class(void)::instance = (uint64_t)"object";
        *(_QWORD *)algn_1ECD84F58 = 6;
        xmmword_1ECD84F60 = 0u;
        unk_1ECD84F70 = 0u;
        xmmword_1ECD84F80 = 0u;
        *(_OWORD *)&qword_1ECD84F90 = 0u;
        *(__int128 *)((char *)&xmmword_1ECD84F98 + 8) = 0u;
        *(_OWORD *)&qword_1ECD84FB0 = 0u;
        xmmword_1ECD84FC0 = 0u;
        unk_1ECD84FD0 = 0u;
        qword_1ECD84FE0 = (uint64_t)&qword_1ECD84FE0;
        unk_1ECD84FE8 = &qword_1ECD84FE0;
        qword_1ECD84FF0 = 0;
        dword_1ECD84FF8 = 0;
      }
    }
    nw::object::__destroy_def_instance = (uint64_t)nw::object::class_def::register_method_def(qword_1ECD85030, (uint64_t)nw::object::_destroy, 0);
    qword_1ECD85030 = v2;
  }
}

void __cxx_global_var_init_7143()
{
  unsigned __int8 v0;
  unsigned __int8 v1;
  uint64_t v2;

  {
    if ((v1 & 1) == 0)
    {
      {
        nw::object::_class(void)::instance = (uint64_t)"object";
        *(_QWORD *)algn_1ECD84F58 = 6;
        xmmword_1ECD84F60 = 0u;
        unk_1ECD84F70 = 0u;
        xmmword_1ECD84F80 = 0u;
        *(_OWORD *)&qword_1ECD84F90 = 0u;
        *(__int128 *)((char *)&xmmword_1ECD84F98 + 8) = 0u;
        *(_OWORD *)&qword_1ECD84FB0 = 0u;
        xmmword_1ECD84FC0 = 0u;
        unk_1ECD84FD0 = 0u;
        qword_1ECD84FE0 = (uint64_t)&qword_1ECD84FE0;
        unk_1ECD84FE8 = &qword_1ECD84FE0;
        qword_1ECD84FF0 = 0;
        dword_1ECD84FF8 = 0;
      }
    }
    nw::object::__description_def_instance = (uint64_t)nw::object::class_def::register_method_def(qword_1ECD85060, (uint64_t)nw::object::_description, 0);
    qword_1ECD85060 = v2;
  }
}

void __cxx_global_var_init_1_7144()
{
  unsigned __int8 v0;
  unsigned __int8 v1;
  uint64_t v2;

  {
    if ((v1 & 1) == 0)
    {
      {
        nw::object::_class(void)::instance = (uint64_t)"object";
        *(_QWORD *)algn_1ECD84F58 = 6;
        xmmword_1ECD84F60 = 0u;
        unk_1ECD84F70 = 0u;
        xmmword_1ECD84F80 = 0u;
        *(_OWORD *)&qword_1ECD84F90 = 0u;
        *(__int128 *)((char *)&xmmword_1ECD84F98 + 8) = 0u;
        *(_OWORD *)&qword_1ECD84FB0 = 0u;
        xmmword_1ECD84FC0 = 0u;
        unk_1ECD84FD0 = 0u;
        qword_1ECD84FE0 = (uint64_t)&qword_1ECD84FE0;
        unk_1ECD84FE8 = &qword_1ECD84FE0;
        qword_1ECD84FF0 = 0;
        dword_1ECD84FF8 = 0;
      }
    }
    nw::object::__redacted_description_def_instance = (uint64_t)nw::object::class_def::register_method_def(qword_1ECD85048, (uint64_t)nw::object::_redacted_description, 0);
    qword_1ECD85048 = v2;
  }
}

void __cxx_global_var_init_2_7145()
{
  unsigned __int8 v0;
  unsigned __int8 v1;
  uint64_t v2;

  {
    if ((v1 & 1) == 0)
    {
      {
        nw::object::_class(void)::instance = (uint64_t)"object";
        *(_QWORD *)algn_1ECD84F58 = 6;
        xmmword_1ECD84F60 = 0u;
        unk_1ECD84F70 = 0u;
        xmmword_1ECD84F80 = 0u;
        *(_OWORD *)&qword_1ECD84F90 = 0u;
        *(__int128 *)((char *)&xmmword_1ECD84F98 + 8) = 0u;
        *(_OWORD *)&qword_1ECD84FB0 = 0u;
        xmmword_1ECD84FC0 = 0u;
        unk_1ECD84FD0 = 0u;
        qword_1ECD84FE0 = (uint64_t)&qword_1ECD84FE0;
        unk_1ECD84FE8 = &qword_1ECD84FE0;
        qword_1ECD84FF0 = 0;
        dword_1ECD84FF8 = 0;
      }
    }
    nw::object::__destroy_def_instance = (uint64_t)nw::object::class_def::register_method_def(qword_1ECD85030, (uint64_t)nw::object::_destroy, 0);
    qword_1ECD85030 = v2;
  }
}

void __cxx_global_var_init_7593()
{
  unsigned __int8 v0;
  unsigned __int8 v1;
  uint64_t v2;

  {
    if ((v1 & 1) == 0)
    {
      {
        nw::object::_class(void)::instance = (uint64_t)"object";
        *(_QWORD *)algn_1ECD84F58 = 6;
        xmmword_1ECD84F60 = 0u;
        unk_1ECD84F70 = 0u;
        xmmword_1ECD84F80 = 0u;
        *(_OWORD *)&qword_1ECD84F90 = 0u;
        *(__int128 *)((char *)&xmmword_1ECD84F98 + 8) = 0u;
        *(_OWORD *)&qword_1ECD84FB0 = 0u;
        xmmword_1ECD84FC0 = 0u;
        unk_1ECD84FD0 = 0u;
        qword_1ECD84FE0 = (uint64_t)&qword_1ECD84FE0;
        unk_1ECD84FE8 = &qword_1ECD84FE0;
        qword_1ECD84FF0 = 0;
        dword_1ECD84FF8 = 0;
      }
    }
    nw::object::__description_def_instance = (uint64_t)nw::object::class_def::register_method_def(qword_1ECD85060, (uint64_t)nw::object::_description, 0);
    qword_1ECD85060 = v2;
  }
}

void __cxx_global_var_init_1_7594()
{
  unsigned __int8 v0;
  unsigned __int8 v1;
  uint64_t v2;

  {
    if ((v1 & 1) == 0)
    {
      {
        nw::object::_class(void)::instance = (uint64_t)"object";
        *(_QWORD *)algn_1ECD84F58 = 6;
        xmmword_1ECD84F60 = 0u;
        unk_1ECD84F70 = 0u;
        xmmword_1ECD84F80 = 0u;
        *(_OWORD *)&qword_1ECD84F90 = 0u;
        *(__int128 *)((char *)&xmmword_1ECD84F98 + 8) = 0u;
        *(_OWORD *)&qword_1ECD84FB0 = 0u;
        xmmword_1ECD84FC0 = 0u;
        unk_1ECD84FD0 = 0u;
        qword_1ECD84FE0 = (uint64_t)&qword_1ECD84FE0;
        unk_1ECD84FE8 = &qword_1ECD84FE0;
        qword_1ECD84FF0 = 0;
        dword_1ECD84FF8 = 0;
      }
    }
    nw::object::__redacted_description_def_instance = (uint64_t)nw::object::class_def::register_method_def(qword_1ECD85048, (uint64_t)nw::object::_redacted_description, 0);
    qword_1ECD85048 = v2;
  }
}

void __cxx_global_var_init_2_7595()
{
  unsigned __int8 v0;
  unsigned __int8 v1;
  uint64_t v2;

  {
    if ((v1 & 1) == 0)
    {
      {
        nw::object::_class(void)::instance = (uint64_t)"object";
        *(_QWORD *)algn_1ECD84F58 = 6;
        xmmword_1ECD84F60 = 0u;
        unk_1ECD84F70 = 0u;
        xmmword_1ECD84F80 = 0u;
        *(_OWORD *)&qword_1ECD84F90 = 0u;
        *(__int128 *)((char *)&xmmword_1ECD84F98 + 8) = 0u;
        *(_OWORD *)&qword_1ECD84FB0 = 0u;
        xmmword_1ECD84FC0 = 0u;
        unk_1ECD84FD0 = 0u;
        qword_1ECD84FE0 = (uint64_t)&qword_1ECD84FE0;
        unk_1ECD84FE8 = &qword_1ECD84FE0;
        qword_1ECD84FF0 = 0;
        dword_1ECD84FF8 = 0;
      }
    }
    nw::object::__destroy_def_instance = (uint64_t)nw::object::class_def::register_method_def(qword_1ECD85030, (uint64_t)nw::object::_destroy, 0);
    qword_1ECD85030 = v2;
  }
}

void __cxx_global_var_init_8134()
{
  unsigned __int8 v0;
  unsigned __int8 v1;
  uint64_t v2;

  {
    if ((v1 & 1) == 0)
    {
      {
        nw::object::_class(void)::instance = (uint64_t)"object";
        *(_QWORD *)algn_1ECD84F58 = 6;
        xmmword_1ECD84F60 = 0u;
        unk_1ECD84F70 = 0u;
        xmmword_1ECD84F80 = 0u;
        *(_OWORD *)&qword_1ECD84F90 = 0u;
        *(__int128 *)((char *)&xmmword_1ECD84F98 + 8) = 0u;
        *(_OWORD *)&qword_1ECD84FB0 = 0u;
        xmmword_1ECD84FC0 = 0u;
        unk_1ECD84FD0 = 0u;
        qword_1ECD84FE0 = (uint64_t)&qword_1ECD84FE0;
        unk_1ECD84FE8 = &qword_1ECD84FE0;
        qword_1ECD84FF0 = 0;
        dword_1ECD84FF8 = 0;
      }
    }
    nw::object::__description_def_instance = (uint64_t)nw::object::class_def::register_method_def(qword_1ECD85060, (uint64_t)nw::object::_description, 0);
    qword_1ECD85060 = v2;
  }
}

void __cxx_global_var_init_1_8135()
{
  unsigned __int8 v0;
  unsigned __int8 v1;
  uint64_t v2;

  {
    if ((v1 & 1) == 0)
    {
      {
        nw::object::_class(void)::instance = (uint64_t)"object";
        *(_QWORD *)algn_1ECD84F58 = 6;
        xmmword_1ECD84F60 = 0u;
        unk_1ECD84F70 = 0u;
        xmmword_1ECD84F80 = 0u;
        *(_OWORD *)&qword_1ECD84F90 = 0u;
        *(__int128 *)((char *)&xmmword_1ECD84F98 + 8) = 0u;
        *(_OWORD *)&qword_1ECD84FB0 = 0u;
        xmmword_1ECD84FC0 = 0u;
        unk_1ECD84FD0 = 0u;
        qword_1ECD84FE0 = (uint64_t)&qword_1ECD84FE0;
        unk_1ECD84FE8 = &qword_1ECD84FE0;
        qword_1ECD84FF0 = 0;
        dword_1ECD84FF8 = 0;
      }
    }
    nw::object::__redacted_description_def_instance = (uint64_t)nw::object::class_def::register_method_def(qword_1ECD85048, (uint64_t)nw::object::_redacted_description, 0);
    qword_1ECD85048 = v2;
  }
}

void __cxx_global_var_init_2_8136()
{
  unsigned __int8 v0;
  unsigned __int8 v1;
  uint64_t v2;

  {
    if ((v1 & 1) == 0)
    {
      {
        nw::object::_class(void)::instance = (uint64_t)"object";
        *(_QWORD *)algn_1ECD84F58 = 6;
        xmmword_1ECD84F60 = 0u;
        unk_1ECD84F70 = 0u;
        xmmword_1ECD84F80 = 0u;
        *(_OWORD *)&qword_1ECD84F90 = 0u;
        *(__int128 *)((char *)&xmmword_1ECD84F98 + 8) = 0u;
        *(_OWORD *)&qword_1ECD84FB0 = 0u;
        xmmword_1ECD84FC0 = 0u;
        unk_1ECD84FD0 = 0u;
        qword_1ECD84FE0 = (uint64_t)&qword_1ECD84FE0;
        unk_1ECD84FE8 = &qword_1ECD84FE0;
        qword_1ECD84FF0 = 0;
        dword_1ECD84FF8 = 0;
      }
    }
    nw::object::__destroy_def_instance = (uint64_t)nw::object::class_def::register_method_def(qword_1ECD85030, (uint64_t)nw::object::_destroy, 0);
    qword_1ECD85030 = v2;
  }
}

void __cxx_global_var_init_8360()
{
  unsigned __int8 v0;
  unsigned __int8 v1;
  uint64_t v2;

  {
    if ((v1 & 1) == 0)
    {
      {
        nw::object::_class(void)::instance = (uint64_t)"object";
        *(_QWORD *)algn_1ECD84F58 = 6;
        xmmword_1ECD84F60 = 0u;
        unk_1ECD84F70 = 0u;
        xmmword_1ECD84F80 = 0u;
        *(_OWORD *)&qword_1ECD84F90 = 0u;
        *(__int128 *)((char *)&xmmword_1ECD84F98 + 8) = 0u;
        *(_OWORD *)&qword_1ECD84FB0 = 0u;
        xmmword_1ECD84FC0 = 0u;
        unk_1ECD84FD0 = 0u;
        qword_1ECD84FE0 = (uint64_t)&qword_1ECD84FE0;
        unk_1ECD84FE8 = &qword_1ECD84FE0;
        qword_1ECD84FF0 = 0;
        dword_1ECD84FF8 = 0;
      }
    }
    nw::object::__description_def_instance = (uint64_t)nw::object::class_def::register_method_def(qword_1ECD85060, (uint64_t)nw::object::_description, 0);
    qword_1ECD85060 = v2;
  }
}

void __cxx_global_var_init_1_8361()
{
  unsigned __int8 v0;
  unsigned __int8 v1;
  uint64_t v2;

  {
    if ((v1 & 1) == 0)
    {
      {
        nw::object::_class(void)::instance = (uint64_t)"object";
        *(_QWORD *)algn_1ECD84F58 = 6;
        xmmword_1ECD84F60 = 0u;
        unk_1ECD84F70 = 0u;
        xmmword_1ECD84F80 = 0u;
        *(_OWORD *)&qword_1ECD84F90 = 0u;
        *(__int128 *)((char *)&xmmword_1ECD84F98 + 8) = 0u;
        *(_OWORD *)&qword_1ECD84FB0 = 0u;
        xmmword_1ECD84FC0 = 0u;
        unk_1ECD84FD0 = 0u;
        qword_1ECD84FE0 = (uint64_t)&qword_1ECD84FE0;
        unk_1ECD84FE8 = &qword_1ECD84FE0;
        qword_1ECD84FF0 = 0;
        dword_1ECD84FF8 = 0;
      }
    }
    nw::object::__redacted_description_def_instance = (uint64_t)nw::object::class_def::register_method_def(qword_1ECD85048, (uint64_t)nw::object::_redacted_description, 0);
    qword_1ECD85048 = v2;
  }
}

void __cxx_global_var_init_2_8362()
{
  unsigned __int8 v0;
  unsigned __int8 v1;
  uint64_t v2;

  {
    if ((v1 & 1) == 0)
    {
      {
        nw::object::_class(void)::instance = (uint64_t)"object";
        *(_QWORD *)algn_1ECD84F58 = 6;
        xmmword_1ECD84F60 = 0u;
        unk_1ECD84F70 = 0u;
        xmmword_1ECD84F80 = 0u;
        *(_OWORD *)&qword_1ECD84F90 = 0u;
        *(__int128 *)((char *)&xmmword_1ECD84F98 + 8) = 0u;
        *(_OWORD *)&qword_1ECD84FB0 = 0u;
        xmmword_1ECD84FC0 = 0u;
        unk_1ECD84FD0 = 0u;
        qword_1ECD84FE0 = (uint64_t)&qword_1ECD84FE0;
        unk_1ECD84FE8 = &qword_1ECD84FE0;
        qword_1ECD84FF0 = 0;
        dword_1ECD84FF8 = 0;
      }
    }
    nw::object::__destroy_def_instance = (uint64_t)nw::object::class_def::register_method_def(qword_1ECD85030, (uint64_t)nw::object::_destroy, 0);
    qword_1ECD85030 = v2;
  }
}

void __cxx_global_var_init_10702()
{
  unsigned __int8 v0;
  unsigned __int8 v1;
  uint64_t v2;

  {
    if ((v1 & 1) == 0)
    {
      {
        nw::object::_class(void)::instance = (uint64_t)"object";
        *(_QWORD *)algn_1ECD84F58 = 6;
        xmmword_1ECD84F60 = 0u;
        unk_1ECD84F70 = 0u;
        xmmword_1ECD84F80 = 0u;
        *(_OWORD *)&qword_1ECD84F90 = 0u;
        *(__int128 *)((char *)&xmmword_1ECD84F98 + 8) = 0u;
        *(_OWORD *)&qword_1ECD84FB0 = 0u;
        xmmword_1ECD84FC0 = 0u;
        unk_1ECD84FD0 = 0u;
        qword_1ECD84FE0 = (uint64_t)&qword_1ECD84FE0;
        unk_1ECD84FE8 = &qword_1ECD84FE0;
        qword_1ECD84FF0 = 0;
        dword_1ECD84FF8 = 0;
      }
    }
    nw::object::__description_def_instance = (uint64_t)nw::object::class_def::register_method_def(qword_1ECD85060, (uint64_t)nw::object::_description, 0);
    qword_1ECD85060 = v2;
  }
}

void __cxx_global_var_init_1_10703()
{
  unsigned __int8 v0;
  unsigned __int8 v1;
  uint64_t v2;

  {
    if ((v1 & 1) == 0)
    {
      {
        nw::object::_class(void)::instance = (uint64_t)"object";
        *(_QWORD *)algn_1ECD84F58 = 6;
        xmmword_1ECD84F60 = 0u;
        unk_1ECD84F70 = 0u;
        xmmword_1ECD84F80 = 0u;
        *(_OWORD *)&qword_1ECD84F90 = 0u;
        *(__int128 *)((char *)&xmmword_1ECD84F98 + 8) = 0u;
        *(_OWORD *)&qword_1ECD84FB0 = 0u;
        xmmword_1ECD84FC0 = 0u;
        unk_1ECD84FD0 = 0u;
        qword_1ECD84FE0 = (uint64_t)&qword_1ECD84FE0;
        unk_1ECD84FE8 = &qword_1ECD84FE0;
        qword_1ECD84FF0 = 0;
        dword_1ECD84FF8 = 0;
      }
    }
    nw::object::__redacted_description_def_instance = (uint64_t)nw::object::class_def::register_method_def(qword_1ECD85048, (uint64_t)nw::object::_redacted_description, 0);
    qword_1ECD85048 = v2;
  }
}

void __cxx_global_var_init_2_10704()
{
  unsigned __int8 v0;
  unsigned __int8 v1;
  uint64_t v2;

  {
    if ((v1 & 1) == 0)
    {
      {
        nw::object::_class(void)::instance = (uint64_t)"object";
        *(_QWORD *)algn_1ECD84F58 = 6;
        xmmword_1ECD84F60 = 0u;
        unk_1ECD84F70 = 0u;
        xmmword_1ECD84F80 = 0u;
        *(_OWORD *)&qword_1ECD84F90 = 0u;
        *(__int128 *)((char *)&xmmword_1ECD84F98 + 8) = 0u;
        *(_OWORD *)&qword_1ECD84FB0 = 0u;
        xmmword_1ECD84FC0 = 0u;
        unk_1ECD84FD0 = 0u;
        qword_1ECD84FE0 = (uint64_t)&qword_1ECD84FE0;
        unk_1ECD84FE8 = &qword_1ECD84FE0;
        qword_1ECD84FF0 = 0;
        dword_1ECD84FF8 = 0;
      }
    }
    nw::object::__destroy_def_instance = (uint64_t)nw::object::class_def::register_method_def(qword_1ECD85030, (uint64_t)nw::object::_destroy, 0);
    qword_1ECD85030 = v2;
  }
}

void __cxx_global_var_init_10844()
{
  unsigned __int8 v0;
  unsigned __int8 v1;
  uint64_t v2;

  {
    if ((v1 & 1) == 0)
    {
      {
        nw::object::_class(void)::instance = (uint64_t)"object";
        *(_QWORD *)algn_1ECD84F58 = 6;
        xmmword_1ECD84F60 = 0u;
        unk_1ECD84F70 = 0u;
        xmmword_1ECD84F80 = 0u;
        *(_OWORD *)&qword_1ECD84F90 = 0u;
        *(__int128 *)((char *)&xmmword_1ECD84F98 + 8) = 0u;
        *(_OWORD *)&qword_1ECD84FB0 = 0u;
        xmmword_1ECD84FC0 = 0u;
        unk_1ECD84FD0 = 0u;
        qword_1ECD84FE0 = (uint64_t)&qword_1ECD84FE0;
        unk_1ECD84FE8 = &qword_1ECD84FE0;
        qword_1ECD84FF0 = 0;
        dword_1ECD84FF8 = 0;
      }
    }
    nw::object::__description_def_instance = (uint64_t)nw::object::class_def::register_method_def(qword_1ECD85060, (uint64_t)nw::object::_description, 0);
    qword_1ECD85060 = v2;
  }
}

void __cxx_global_var_init_1_10845()
{
  unsigned __int8 v0;
  unsigned __int8 v1;
  uint64_t v2;

  {
    if ((v1 & 1) == 0)
    {
      {
        nw::object::_class(void)::instance = (uint64_t)"object";
        *(_QWORD *)algn_1ECD84F58 = 6;
        xmmword_1ECD84F60 = 0u;
        unk_1ECD84F70 = 0u;
        xmmword_1ECD84F80 = 0u;
        *(_OWORD *)&qword_1ECD84F90 = 0u;
        *(__int128 *)((char *)&xmmword_1ECD84F98 + 8) = 0u;
        *(_OWORD *)&qword_1ECD84FB0 = 0u;
        xmmword_1ECD84FC0 = 0u;
        unk_1ECD84FD0 = 0u;
        qword_1ECD84FE0 = (uint64_t)&qword_1ECD84FE0;
        unk_1ECD84FE8 = &qword_1ECD84FE0;
        qword_1ECD84FF0 = 0;
        dword_1ECD84FF8 = 0;
      }
    }
    nw::object::__redacted_description_def_instance = (uint64_t)nw::object::class_def::register_method_def(qword_1ECD85048, (uint64_t)nw::object::_redacted_description, 0);
    qword_1ECD85048 = v2;
  }
}

void __cxx_global_var_init_2_10846()
{
  unsigned __int8 v0;
  unsigned __int8 v1;
  uint64_t v2;

  {
    if ((v1 & 1) == 0)
    {
      {
        nw::object::_class(void)::instance = (uint64_t)"object";
        *(_QWORD *)algn_1ECD84F58 = 6;
        xmmword_1ECD84F60 = 0u;
        unk_1ECD84F70 = 0u;
        xmmword_1ECD84F80 = 0u;
        *(_OWORD *)&qword_1ECD84F90 = 0u;
        *(__int128 *)((char *)&xmmword_1ECD84F98 + 8) = 0u;
        *(_OWORD *)&qword_1ECD84FB0 = 0u;
        xmmword_1ECD84FC0 = 0u;
        unk_1ECD84FD0 = 0u;
        qword_1ECD84FE0 = (uint64_t)&qword_1ECD84FE0;
        unk_1ECD84FE8 = &qword_1ECD84FE0;
        qword_1ECD84FF0 = 0;
        dword_1ECD84FF8 = 0;
      }
    }
    nw::object::__destroy_def_instance = (uint64_t)nw::object::class_def::register_method_def(qword_1ECD85030, (uint64_t)nw::object::_destroy, 0);
    qword_1ECD85030 = v2;
  }
}

void __cxx_global_var_init_11086()
{
  unsigned __int8 v0;
  unsigned __int8 v1;
  uint64_t v2;

  {
    if ((v1 & 1) == 0)
    {
      {
        nw::object::_class(void)::instance = (uint64_t)"object";
        *(_QWORD *)algn_1ECD84F58 = 6;
        xmmword_1ECD84F60 = 0u;
        unk_1ECD84F70 = 0u;
        xmmword_1ECD84F80 = 0u;
        *(_OWORD *)&qword_1ECD84F90 = 0u;
        *(__int128 *)((char *)&xmmword_1ECD84F98 + 8) = 0u;
        *(_OWORD *)&qword_1ECD84FB0 = 0u;
        xmmword_1ECD84FC0 = 0u;
        unk_1ECD84FD0 = 0u;
        qword_1ECD84FE0 = (uint64_t)&qword_1ECD84FE0;
        unk_1ECD84FE8 = &qword_1ECD84FE0;
        qword_1ECD84FF0 = 0;
        dword_1ECD84FF8 = 0;
      }
    }
    nw::object::__description_def_instance = (uint64_t)nw::object::class_def::register_method_def(qword_1ECD85060, (uint64_t)nw::object::_description, 0);
    qword_1ECD85060 = v2;
  }
}

void __cxx_global_var_init_1_11087()
{
  unsigned __int8 v0;
  unsigned __int8 v1;
  uint64_t v2;

  {
    if ((v1 & 1) == 0)
    {
      {
        nw::object::_class(void)::instance = (uint64_t)"object";
        *(_QWORD *)algn_1ECD84F58 = 6;
        xmmword_1ECD84F60 = 0u;
        unk_1ECD84F70 = 0u;
        xmmword_1ECD84F80 = 0u;
        *(_OWORD *)&qword_1ECD84F90 = 0u;
        *(__int128 *)((char *)&xmmword_1ECD84F98 + 8) = 0u;
        *(_OWORD *)&qword_1ECD84FB0 = 0u;
        xmmword_1ECD84FC0 = 0u;
        unk_1ECD84FD0 = 0u;
        qword_1ECD84FE0 = (uint64_t)&qword_1ECD84FE0;
        unk_1ECD84FE8 = &qword_1ECD84FE0;
        qword_1ECD84FF0 = 0;
        dword_1ECD84FF8 = 0;
      }
    }
    nw::object::__redacted_description_def_instance = (uint64_t)nw::object::class_def::register_method_def(qword_1ECD85048, (uint64_t)nw::object::_redacted_description, 0);
    qword_1ECD85048 = v2;
  }
}

void __cxx_global_var_init_2_11088()
{
  unsigned __int8 v0;
  unsigned __int8 v1;
  uint64_t v2;

  {
    if ((v1 & 1) == 0)
    {
      {
        nw::object::_class(void)::instance = (uint64_t)"object";
        *(_QWORD *)algn_1ECD84F58 = 6;
        xmmword_1ECD84F60 = 0u;
        unk_1ECD84F70 = 0u;
        xmmword_1ECD84F80 = 0u;
        *(_OWORD *)&qword_1ECD84F90 = 0u;
        *(__int128 *)((char *)&xmmword_1ECD84F98 + 8) = 0u;
        *(_OWORD *)&qword_1ECD84FB0 = 0u;
        xmmword_1ECD84FC0 = 0u;
        unk_1ECD84FD0 = 0u;
        qword_1ECD84FE0 = (uint64_t)&qword_1ECD84FE0;
        unk_1ECD84FE8 = &qword_1ECD84FE0;
        qword_1ECD84FF0 = 0;
        dword_1ECD84FF8 = 0;
      }
    }
    nw::object::__destroy_def_instance = (uint64_t)nw::object::class_def::register_method_def(qword_1ECD85030, (uint64_t)nw::object::_destroy, 0);
    qword_1ECD85030 = v2;
  }
}

void __cxx_global_var_init_11374()
{
  unsigned __int8 v0;
  unsigned __int8 v1;
  uint64_t v2;

  {
    if ((v1 & 1) == 0)
    {
      {
        nw::object::_class(void)::instance = (uint64_t)"object";
        *(_QWORD *)algn_1ECD84F58 = 6;
        xmmword_1ECD84F60 = 0u;
        unk_1ECD84F70 = 0u;
        xmmword_1ECD84F80 = 0u;
        *(_OWORD *)&qword_1ECD84F90 = 0u;
        *(__int128 *)((char *)&xmmword_1ECD84F98 + 8) = 0u;
        *(_OWORD *)&qword_1ECD84FB0 = 0u;
        xmmword_1ECD84FC0 = 0u;
        unk_1ECD84FD0 = 0u;
        qword_1ECD84FE0 = (uint64_t)&qword_1ECD84FE0;
        unk_1ECD84FE8 = &qword_1ECD84FE0;
        qword_1ECD84FF0 = 0;
        dword_1ECD84FF8 = 0;
      }
    }
    nw::object::__description_def_instance = (uint64_t)nw::object::class_def::register_method_def(qword_1ECD85060, (uint64_t)nw::object::_description, 0);
    qword_1ECD85060 = v2;
  }
}

void __cxx_global_var_init_1_11375()
{
  unsigned __int8 v0;
  unsigned __int8 v1;
  uint64_t v2;

  {
    if ((v1 & 1) == 0)
    {
      {
        nw::object::_class(void)::instance = (uint64_t)"object";
        *(_QWORD *)algn_1ECD84F58 = 6;
        xmmword_1ECD84F60 = 0u;
        unk_1ECD84F70 = 0u;
        xmmword_1ECD84F80 = 0u;
        *(_OWORD *)&qword_1ECD84F90 = 0u;
        *(__int128 *)((char *)&xmmword_1ECD84F98 + 8) = 0u;
        *(_OWORD *)&qword_1ECD84FB0 = 0u;
        xmmword_1ECD84FC0 = 0u;
        unk_1ECD84FD0 = 0u;
        qword_1ECD84FE0 = (uint64_t)&qword_1ECD84FE0;
        unk_1ECD84FE8 = &qword_1ECD84FE0;
        qword_1ECD84FF0 = 0;
        dword_1ECD84FF8 = 0;
      }
    }
    nw::object::__redacted_description_def_instance = (uint64_t)nw::object::class_def::register_method_def(qword_1ECD85048, (uint64_t)nw::object::_redacted_description, 0);
    qword_1ECD85048 = v2;
  }
}

void __cxx_global_var_init_2_11376()
{
  unsigned __int8 v0;
  unsigned __int8 v1;
  uint64_t v2;

  {
    if ((v1 & 1) == 0)
    {
      {
        nw::object::_class(void)::instance = (uint64_t)"object";
        *(_QWORD *)algn_1ECD84F58 = 6;
        xmmword_1ECD84F60 = 0u;
        unk_1ECD84F70 = 0u;
        xmmword_1ECD84F80 = 0u;
        *(_OWORD *)&qword_1ECD84F90 = 0u;
        *(__int128 *)((char *)&xmmword_1ECD84F98 + 8) = 0u;
        *(_OWORD *)&qword_1ECD84FB0 = 0u;
        xmmword_1ECD84FC0 = 0u;
        unk_1ECD84FD0 = 0u;
        qword_1ECD84FE0 = (uint64_t)&qword_1ECD84FE0;
        unk_1ECD84FE8 = &qword_1ECD84FE0;
        qword_1ECD84FF0 = 0;
        dword_1ECD84FF8 = 0;
      }
    }
    nw::object::__destroy_def_instance = (uint64_t)nw::object::class_def::register_method_def(qword_1ECD85030, (uint64_t)nw::object::_destroy, 0);
    qword_1ECD85030 = v2;
  }
}

void __cxx_global_var_init_13779()
{
  unsigned __int8 v0;
  unsigned __int8 v1;
  uint64_t v2;

  {
    if ((v1 & 1) == 0)
    {
      {
        nw::object::_class(void)::instance = (uint64_t)"object";
        *(_QWORD *)algn_1ECD84F58 = 6;
        xmmword_1ECD84F60 = 0u;
        unk_1ECD84F70 = 0u;
        xmmword_1ECD84F80 = 0u;
        *(_OWORD *)&qword_1ECD84F90 = 0u;
        *(__int128 *)((char *)&xmmword_1ECD84F98 + 8) = 0u;
        *(_OWORD *)&qword_1ECD84FB0 = 0u;
        xmmword_1ECD84FC0 = 0u;
        unk_1ECD84FD0 = 0u;
        qword_1ECD84FE0 = (uint64_t)&qword_1ECD84FE0;
        unk_1ECD84FE8 = &qword_1ECD84FE0;
        qword_1ECD84FF0 = 0;
        dword_1ECD84FF8 = 0;
      }
    }
    nw::object::__description_def_instance = (uint64_t)nw::object::class_def::register_method_def(qword_1ECD85060, (uint64_t)nw::object::_description, 0);
    qword_1ECD85060 = v2;
  }
}

void __cxx_global_var_init_1_13780()
{
  unsigned __int8 v0;
  unsigned __int8 v1;
  uint64_t v2;

  {
    if ((v1 & 1) == 0)
    {
      {
        nw::object::_class(void)::instance = (uint64_t)"object";
        *(_QWORD *)algn_1ECD84F58 = 6;
        xmmword_1ECD84F60 = 0u;
        unk_1ECD84F70 = 0u;
        xmmword_1ECD84F80 = 0u;
        *(_OWORD *)&qword_1ECD84F90 = 0u;
        *(__int128 *)((char *)&xmmword_1ECD84F98 + 8) = 0u;
        *(_OWORD *)&qword_1ECD84FB0 = 0u;
        xmmword_1ECD84FC0 = 0u;
        unk_1ECD84FD0 = 0u;
        qword_1ECD84FE0 = (uint64_t)&qword_1ECD84FE0;
        unk_1ECD84FE8 = &qword_1ECD84FE0;
        qword_1ECD84FF0 = 0;
        dword_1ECD84FF8 = 0;
      }
    }
    nw::object::__redacted_description_def_instance = (uint64_t)nw::object::class_def::register_method_def(qword_1ECD85048, (uint64_t)nw::object::_redacted_description, 0);
    qword_1ECD85048 = v2;
  }
}

void __cxx_global_var_init_2_13781()
{
  unsigned __int8 v0;
  unsigned __int8 v1;
  uint64_t v2;

  {
    if ((v1 & 1) == 0)
    {
      {
        nw::object::_class(void)::instance = (uint64_t)"object";
        *(_QWORD *)algn_1ECD84F58 = 6;
        xmmword_1ECD84F60 = 0u;
        unk_1ECD84F70 = 0u;
        xmmword_1ECD84F80 = 0u;
        *(_OWORD *)&qword_1ECD84F90 = 0u;
        *(__int128 *)((char *)&xmmword_1ECD84F98 + 8) = 0u;
        *(_OWORD *)&qword_1ECD84FB0 = 0u;
        xmmword_1ECD84FC0 = 0u;
        unk_1ECD84FD0 = 0u;
        qword_1ECD84FE0 = (uint64_t)&qword_1ECD84FE0;
        unk_1ECD84FE8 = &qword_1ECD84FE0;
        qword_1ECD84FF0 = 0;
        dword_1ECD84FF8 = 0;
      }
    }
    nw::object::__destroy_def_instance = (uint64_t)nw::object::class_def::register_method_def(qword_1ECD85030, (uint64_t)nw::object::_destroy, 0);
    qword_1ECD85030 = v2;
  }
}

void __cxx_global_var_init_14360()
{
  unsigned __int8 v0;
  unsigned __int8 v1;
  uint64_t v2;

  {
    if ((v1 & 1) == 0)
    {
      {
        nw::object::_class(void)::instance = (uint64_t)"object";
        *(_QWORD *)algn_1ECD84F58 = 6;
        xmmword_1ECD84F60 = 0u;
        unk_1ECD84F70 = 0u;
        xmmword_1ECD84F80 = 0u;
        *(_OWORD *)&qword_1ECD84F90 = 0u;
        *(__int128 *)((char *)&xmmword_1ECD84F98 + 8) = 0u;
        *(_OWORD *)&qword_1ECD84FB0 = 0u;
        xmmword_1ECD84FC0 = 0u;
        unk_1ECD84FD0 = 0u;
        qword_1ECD84FE0 = (uint64_t)&qword_1ECD84FE0;
        unk_1ECD84FE8 = &qword_1ECD84FE0;
        qword_1ECD84FF0 = 0;
        dword_1ECD84FF8 = 0;
      }
    }
    nw::object::__description_def_instance = (uint64_t)nw::object::class_def::register_method_def(qword_1ECD85060, (uint64_t)nw::object::_description, 0);
    qword_1ECD85060 = v2;
  }
}

void __cxx_global_var_init_1_14361()
{
  unsigned __int8 v0;
  unsigned __int8 v1;
  uint64_t v2;

  {
    if ((v1 & 1) == 0)
    {
      {
        nw::object::_class(void)::instance = (uint64_t)"object";
        *(_QWORD *)algn_1ECD84F58 = 6;
        xmmword_1ECD84F60 = 0u;
        unk_1ECD84F70 = 0u;
        xmmword_1ECD84F80 = 0u;
        *(_OWORD *)&qword_1ECD84F90 = 0u;
        *(__int128 *)((char *)&xmmword_1ECD84F98 + 8) = 0u;
        *(_OWORD *)&qword_1ECD84FB0 = 0u;
        xmmword_1ECD84FC0 = 0u;
        unk_1ECD84FD0 = 0u;
        qword_1ECD84FE0 = (uint64_t)&qword_1ECD84FE0;
        unk_1ECD84FE8 = &qword_1ECD84FE0;
        qword_1ECD84FF0 = 0;
        dword_1ECD84FF8 = 0;
      }
    }
    nw::object::__redacted_description_def_instance = (uint64_t)nw::object::class_def::register_method_def(qword_1ECD85048, (uint64_t)nw::object::_redacted_description, 0);
    qword_1ECD85048 = v2;
  }
}

void __cxx_global_var_init_2_14362()
{
  unsigned __int8 v0;
  unsigned __int8 v1;
  uint64_t v2;

  {
    if ((v1 & 1) == 0)
    {
      {
        nw::object::_class(void)::instance = (uint64_t)"object";
        *(_QWORD *)algn_1ECD84F58 = 6;
        xmmword_1ECD84F60 = 0u;
        unk_1ECD84F70 = 0u;
        xmmword_1ECD84F80 = 0u;
        *(_OWORD *)&qword_1ECD84F90 = 0u;
        *(__int128 *)((char *)&xmmword_1ECD84F98 + 8) = 0u;
        *(_OWORD *)&qword_1ECD84FB0 = 0u;
        xmmword_1ECD84FC0 = 0u;
        unk_1ECD84FD0 = 0u;
        qword_1ECD84FE0 = (uint64_t)&qword_1ECD84FE0;
        unk_1ECD84FE8 = &qword_1ECD84FE0;
        qword_1ECD84FF0 = 0;
        dword_1ECD84FF8 = 0;
      }
    }
    nw::object::__destroy_def_instance = (uint64_t)nw::object::class_def::register_method_def(qword_1ECD85030, (uint64_t)nw::object::_destroy, 0);
    qword_1ECD85030 = v2;
  }
}

void __cxx_global_var_init_14502()
{
  unsigned __int8 v0;
  unsigned __int8 v1;
  uint64_t v2;

  {
    if ((v1 & 1) == 0)
    {
      {
        nw::object::_class(void)::instance = (uint64_t)"object";
        *(_QWORD *)algn_1ECD84F58 = 6;
        xmmword_1ECD84F60 = 0u;
        unk_1ECD84F70 = 0u;
        xmmword_1ECD84F80 = 0u;
        *(_OWORD *)&qword_1ECD84F90 = 0u;
        *(__int128 *)((char *)&xmmword_1ECD84F98 + 8) = 0u;
        *(_OWORD *)&qword_1ECD84FB0 = 0u;
        xmmword_1ECD84FC0 = 0u;
        unk_1ECD84FD0 = 0u;
        qword_1ECD84FE0 = (uint64_t)&qword_1ECD84FE0;
        unk_1ECD84FE8 = &qword_1ECD84FE0;
        qword_1ECD84FF0 = 0;
        dword_1ECD84FF8 = 0;
      }
    }
    nw::object::__description_def_instance = (uint64_t)nw::object::class_def::register_method_def(qword_1ECD85060, (uint64_t)nw::object::_description, 0);
    qword_1ECD85060 = v2;
  }
}

void __cxx_global_var_init_1_14503()
{
  unsigned __int8 v0;
  unsigned __int8 v1;
  uint64_t v2;

  {
    if ((v1 & 1) == 0)
    {
      {
        nw::object::_class(void)::instance = (uint64_t)"object";
        *(_QWORD *)algn_1ECD84F58 = 6;
        xmmword_1ECD84F60 = 0u;
        unk_1ECD84F70 = 0u;
        xmmword_1ECD84F80 = 0u;
        *(_OWORD *)&qword_1ECD84F90 = 0u;
        *(__int128 *)((char *)&xmmword_1ECD84F98 + 8) = 0u;
        *(_OWORD *)&qword_1ECD84FB0 = 0u;
        xmmword_1ECD84FC0 = 0u;
        unk_1ECD84FD0 = 0u;
        qword_1ECD84FE0 = (uint64_t)&qword_1ECD84FE0;
        unk_1ECD84FE8 = &qword_1ECD84FE0;
        qword_1ECD84FF0 = 0;
        dword_1ECD84FF8 = 0;
      }
    }
    nw::object::__redacted_description_def_instance = (uint64_t)nw::object::class_def::register_method_def(qword_1ECD85048, (uint64_t)nw::object::_redacted_description, 0);
    qword_1ECD85048 = v2;
  }
}

void __cxx_global_var_init_2_14504()
{
  unsigned __int8 v0;
  unsigned __int8 v1;
  uint64_t v2;

  {
    if ((v1 & 1) == 0)
    {
      {
        nw::object::_class(void)::instance = (uint64_t)"object";
        *(_QWORD *)algn_1ECD84F58 = 6;
        xmmword_1ECD84F60 = 0u;
        unk_1ECD84F70 = 0u;
        xmmword_1ECD84F80 = 0u;
        *(_OWORD *)&qword_1ECD84F90 = 0u;
        *(__int128 *)((char *)&xmmword_1ECD84F98 + 8) = 0u;
        *(_OWORD *)&qword_1ECD84FB0 = 0u;
        xmmword_1ECD84FC0 = 0u;
        unk_1ECD84FD0 = 0u;
        qword_1ECD84FE0 = (uint64_t)&qword_1ECD84FE0;
        unk_1ECD84FE8 = &qword_1ECD84FE0;
        qword_1ECD84FF0 = 0;
        dword_1ECD84FF8 = 0;
      }
    }
    nw::object::__destroy_def_instance = (uint64_t)nw::object::class_def::register_method_def(qword_1ECD85030, (uint64_t)nw::object::_destroy, 0);
    qword_1ECD85030 = v2;
  }
}

void __cxx_global_var_init_14766()
{
  unsigned __int8 v0;
  unsigned __int8 v1;
  uint64_t v2;

  {
    if ((v1 & 1) == 0)
    {
      {
        nw::object::_class(void)::instance = (uint64_t)"object";
        *(_QWORD *)algn_1ECD84F58 = 6;
        xmmword_1ECD84F60 = 0u;
        unk_1ECD84F70 = 0u;
        xmmword_1ECD84F80 = 0u;
        *(_OWORD *)&qword_1ECD84F90 = 0u;
        *(__int128 *)((char *)&xmmword_1ECD84F98 + 8) = 0u;
        *(_OWORD *)&qword_1ECD84FB0 = 0u;
        xmmword_1ECD84FC0 = 0u;
        unk_1ECD84FD0 = 0u;
        qword_1ECD84FE0 = (uint64_t)&qword_1ECD84FE0;
        unk_1ECD84FE8 = &qword_1ECD84FE0;
        qword_1ECD84FF0 = 0;
        dword_1ECD84FF8 = 0;
      }
    }
    nw::object::__description_def_instance = (uint64_t)nw::object::class_def::register_method_def(qword_1ECD85060, (uint64_t)nw::object::_description, 0);
    qword_1ECD85060 = v2;
  }
}

void __cxx_global_var_init_1_14767()
{
  unsigned __int8 v0;
  unsigned __int8 v1;
  uint64_t v2;

  {
    if ((v1 & 1) == 0)
    {
      {
        nw::object::_class(void)::instance = (uint64_t)"object";
        *(_QWORD *)algn_1ECD84F58 = 6;
        xmmword_1ECD84F60 = 0u;
        unk_1ECD84F70 = 0u;
        xmmword_1ECD84F80 = 0u;
        *(_OWORD *)&qword_1ECD84F90 = 0u;
        *(__int128 *)((char *)&xmmword_1ECD84F98 + 8) = 0u;
        *(_OWORD *)&qword_1ECD84FB0 = 0u;
        xmmword_1ECD84FC0 = 0u;
        unk_1ECD84FD0 = 0u;
        qword_1ECD84FE0 = (uint64_t)&qword_1ECD84FE0;
        unk_1ECD84FE8 = &qword_1ECD84FE0;
        qword_1ECD84FF0 = 0;
        dword_1ECD84FF8 = 0;
      }
    }
    nw::object::__redacted_description_def_instance = (uint64_t)nw::object::class_def::register_method_def(qword_1ECD85048, (uint64_t)nw::object::_redacted_description, 0);
    qword_1ECD85048 = v2;
  }
}

void __cxx_global_var_init_2_14768()
{
  unsigned __int8 v0;
  unsigned __int8 v1;
  uint64_t v2;

  {
    if ((v1 & 1) == 0)
    {
      {
        nw::object::_class(void)::instance = (uint64_t)"object";
        *(_QWORD *)algn_1ECD84F58 = 6;
        xmmword_1ECD84F60 = 0u;
        unk_1ECD84F70 = 0u;
        xmmword_1ECD84F80 = 0u;
        *(_OWORD *)&qword_1ECD84F90 = 0u;
        *(__int128 *)((char *)&xmmword_1ECD84F98 + 8) = 0u;
        *(_OWORD *)&qword_1ECD84FB0 = 0u;
        xmmword_1ECD84FC0 = 0u;
        unk_1ECD84FD0 = 0u;
        qword_1ECD84FE0 = (uint64_t)&qword_1ECD84FE0;
        unk_1ECD84FE8 = &qword_1ECD84FE0;
        qword_1ECD84FF0 = 0;
        dword_1ECD84FF8 = 0;
      }
    }
    nw::object::__destroy_def_instance = (uint64_t)nw::object::class_def::register_method_def(qword_1ECD85030, (uint64_t)nw::object::_destroy, 0);
    qword_1ECD85030 = v2;
  }
}

void __cxx_global_var_init_15055()
{
  unsigned __int8 v0;
  unsigned __int8 v1;
  uint64_t v2;

  {
    if ((v1 & 1) == 0)
    {
      {
        nw::object::_class(void)::instance = (uint64_t)"object";
        *(_QWORD *)algn_1ECD84F58 = 6;
        xmmword_1ECD84F60 = 0u;
        unk_1ECD84F70 = 0u;
        xmmword_1ECD84F80 = 0u;
        *(_OWORD *)&qword_1ECD84F90 = 0u;
        *(__int128 *)((char *)&xmmword_1ECD84F98 + 8) = 0u;
        *(_OWORD *)&qword_1ECD84FB0 = 0u;
        xmmword_1ECD84FC0 = 0u;
        unk_1ECD84FD0 = 0u;
        qword_1ECD84FE0 = (uint64_t)&qword_1ECD84FE0;
        unk_1ECD84FE8 = &qword_1ECD84FE0;
        qword_1ECD84FF0 = 0;
        dword_1ECD84FF8 = 0;
      }
    }
    nw::object::__description_def_instance = (uint64_t)nw::object::class_def::register_method_def(qword_1ECD85060, (uint64_t)nw::object::_description, 0);
    qword_1ECD85060 = v2;
  }
}

void __cxx_global_var_init_1_15056()
{
  unsigned __int8 v0;
  unsigned __int8 v1;
  uint64_t v2;

  {
    if ((v1 & 1) == 0)
    {
      {
        nw::object::_class(void)::instance = (uint64_t)"object";
        *(_QWORD *)algn_1ECD84F58 = 6;
        xmmword_1ECD84F60 = 0u;
        unk_1ECD84F70 = 0u;
        xmmword_1ECD84F80 = 0u;
        *(_OWORD *)&qword_1ECD84F90 = 0u;
        *(__int128 *)((char *)&xmmword_1ECD84F98 + 8) = 0u;
        *(_OWORD *)&qword_1ECD84FB0 = 0u;
        xmmword_1ECD84FC0 = 0u;
        unk_1ECD84FD0 = 0u;
        qword_1ECD84FE0 = (uint64_t)&qword_1ECD84FE0;
        unk_1ECD84FE8 = &qword_1ECD84FE0;
        qword_1ECD84FF0 = 0;
        dword_1ECD84FF8 = 0;
      }
    }
    nw::object::__redacted_description_def_instance = (uint64_t)nw::object::class_def::register_method_def(qword_1ECD85048, (uint64_t)nw::object::_redacted_description, 0);
    qword_1ECD85048 = v2;
  }
}

void __cxx_global_var_init_2_15057()
{
  unsigned __int8 v0;
  unsigned __int8 v1;
  uint64_t v2;

  {
    if ((v1 & 1) == 0)
    {
      {
        nw::object::_class(void)::instance = (uint64_t)"object";
        *(_QWORD *)algn_1ECD84F58 = 6;
        xmmword_1ECD84F60 = 0u;
        unk_1ECD84F70 = 0u;
        xmmword_1ECD84F80 = 0u;
        *(_OWORD *)&qword_1ECD84F90 = 0u;
        *(__int128 *)((char *)&xmmword_1ECD84F98 + 8) = 0u;
        *(_OWORD *)&qword_1ECD84FB0 = 0u;
        xmmword_1ECD84FC0 = 0u;
        unk_1ECD84FD0 = 0u;
        qword_1ECD84FE0 = (uint64_t)&qword_1ECD84FE0;
        unk_1ECD84FE8 = &qword_1ECD84FE0;
        qword_1ECD84FF0 = 0;
        dword_1ECD84FF8 = 0;
      }
    }
    nw::object::__destroy_def_instance = (uint64_t)nw::object::class_def::register_method_def(qword_1ECD85030, (uint64_t)nw::object::_destroy, 0);
    qword_1ECD85030 = v2;
  }
}

void __cxx_global_var_init_15642()
{
  unsigned __int8 v0;
  unsigned __int8 v1;
  uint64_t v2;

  {
    if ((v1 & 1) == 0)
    {
      {
        nw::object::_class(void)::instance = (uint64_t)"object";
        *(_QWORD *)algn_1ECD84F58 = 6;
        xmmword_1ECD84F60 = 0u;
        unk_1ECD84F70 = 0u;
        xmmword_1ECD84F80 = 0u;
        *(_OWORD *)&qword_1ECD84F90 = 0u;
        *(__int128 *)((char *)&xmmword_1ECD84F98 + 8) = 0u;
        *(_OWORD *)&qword_1ECD84FB0 = 0u;
        xmmword_1ECD84FC0 = 0u;
        unk_1ECD84FD0 = 0u;
        qword_1ECD84FE0 = (uint64_t)&qword_1ECD84FE0;
        unk_1ECD84FE8 = &qword_1ECD84FE0;
        qword_1ECD84FF0 = 0;
        dword_1ECD84FF8 = 0;
      }
    }
    nw::object::__description_def_instance = (uint64_t)nw::object::class_def::register_method_def(qword_1ECD85060, (uint64_t)nw::object::_description, 0);
    qword_1ECD85060 = v2;
  }
}

void __cxx_global_var_init_1_15643()
{
  unsigned __int8 v0;
  unsigned __int8 v1;
  uint64_t v2;

  {
    if ((v1 & 1) == 0)
    {
      {
        nw::object::_class(void)::instance = (uint64_t)"object";
        *(_QWORD *)algn_1ECD84F58 = 6;
        xmmword_1ECD84F60 = 0u;
        unk_1ECD84F70 = 0u;
        xmmword_1ECD84F80 = 0u;
        *(_OWORD *)&qword_1ECD84F90 = 0u;
        *(__int128 *)((char *)&xmmword_1ECD84F98 + 8) = 0u;
        *(_OWORD *)&qword_1ECD84FB0 = 0u;
        xmmword_1ECD84FC0 = 0u;
        unk_1ECD84FD0 = 0u;
        qword_1ECD84FE0 = (uint64_t)&qword_1ECD84FE0;
        unk_1ECD84FE8 = &qword_1ECD84FE0;
        qword_1ECD84FF0 = 0;
        dword_1ECD84FF8 = 0;
      }
    }
    nw::object::__redacted_description_def_instance = (uint64_t)nw::object::class_def::register_method_def(qword_1ECD85048, (uint64_t)nw::object::_redacted_description, 0);
    qword_1ECD85048 = v2;
  }
}

void __cxx_global_var_init_2_15644()
{
  unsigned __int8 v0;
  unsigned __int8 v1;
  uint64_t v2;

  {
    if ((v1 & 1) == 0)
    {
      {
        nw::object::_class(void)::instance = (uint64_t)"object";
        *(_QWORD *)algn_1ECD84F58 = 6;
        xmmword_1ECD84F60 = 0u;
        unk_1ECD84F70 = 0u;
        xmmword_1ECD84F80 = 0u;
        *(_OWORD *)&qword_1ECD84F90 = 0u;
        *(__int128 *)((char *)&xmmword_1ECD84F98 + 8) = 0u;
        *(_OWORD *)&qword_1ECD84FB0 = 0u;
        xmmword_1ECD84FC0 = 0u;
        unk_1ECD84FD0 = 0u;
        qword_1ECD84FE0 = (uint64_t)&qword_1ECD84FE0;
        unk_1ECD84FE8 = &qword_1ECD84FE0;
        qword_1ECD84FF0 = 0;
        dword_1ECD84FF8 = 0;
      }
    }
    nw::object::__destroy_def_instance = (uint64_t)nw::object::class_def::register_method_def(qword_1ECD85030, (uint64_t)nw::object::_destroy, 0);
    qword_1ECD85030 = v2;
  }
}

void __cxx_global_var_init_15898()
{
  unsigned __int8 v0;
  unsigned __int8 v1;
  uint64_t v2;

  {
    if ((v1 & 1) == 0)
    {
      {
        nw::object::_class(void)::instance = (uint64_t)"object";
        *(_QWORD *)algn_1ECD84F58 = 6;
        xmmword_1ECD84F60 = 0u;
        unk_1ECD84F70 = 0u;
        xmmword_1ECD84F80 = 0u;
        *(_OWORD *)&qword_1ECD84F90 = 0u;
        *(__int128 *)((char *)&xmmword_1ECD84F98 + 8) = 0u;
        *(_OWORD *)&qword_1ECD84FB0 = 0u;
        xmmword_1ECD84FC0 = 0u;
        unk_1ECD84FD0 = 0u;
        qword_1ECD84FE0 = (uint64_t)&qword_1ECD84FE0;
        unk_1ECD84FE8 = &qword_1ECD84FE0;
        qword_1ECD84FF0 = 0;
        dword_1ECD84FF8 = 0;
      }
    }
    nw::object::__description_def_instance = (uint64_t)nw::object::class_def::register_method_def(qword_1ECD85060, (uint64_t)nw::object::_description, 0);
    qword_1ECD85060 = v2;
  }
}

void __cxx_global_var_init_1_15899()
{
  unsigned __int8 v0;
  unsigned __int8 v1;
  uint64_t v2;

  {
    if ((v1 & 1) == 0)
    {
      {
        nw::object::_class(void)::instance = (uint64_t)"object";
        *(_QWORD *)algn_1ECD84F58 = 6;
        xmmword_1ECD84F60 = 0u;
        unk_1ECD84F70 = 0u;
        xmmword_1ECD84F80 = 0u;
        *(_OWORD *)&qword_1ECD84F90 = 0u;
        *(__int128 *)((char *)&xmmword_1ECD84F98 + 8) = 0u;
        *(_OWORD *)&qword_1ECD84FB0 = 0u;
        xmmword_1ECD84FC0 = 0u;
        unk_1ECD84FD0 = 0u;
        qword_1ECD84FE0 = (uint64_t)&qword_1ECD84FE0;
        unk_1ECD84FE8 = &qword_1ECD84FE0;
        qword_1ECD84FF0 = 0;
        dword_1ECD84FF8 = 0;
      }
    }
    nw::object::__redacted_description_def_instance = (uint64_t)nw::object::class_def::register_method_def(qword_1ECD85048, (uint64_t)nw::object::_redacted_description, 0);
    qword_1ECD85048 = v2;
  }
}

void __cxx_global_var_init_2_15900()
{
  unsigned __int8 v0;
  unsigned __int8 v1;
  uint64_t v2;

  {
    if ((v1 & 1) == 0)
    {
      {
        nw::object::_class(void)::instance = (uint64_t)"object";
        *(_QWORD *)algn_1ECD84F58 = 6;
        xmmword_1ECD84F60 = 0u;
        unk_1ECD84F70 = 0u;
        xmmword_1ECD84F80 = 0u;
        *(_OWORD *)&qword_1ECD84F90 = 0u;
        *(__int128 *)((char *)&xmmword_1ECD84F98 + 8) = 0u;
        *(_OWORD *)&qword_1ECD84FB0 = 0u;
        xmmword_1ECD84FC0 = 0u;
        unk_1ECD84FD0 = 0u;
        qword_1ECD84FE0 = (uint64_t)&qword_1ECD84FE0;
        unk_1ECD84FE8 = &qword_1ECD84FE0;
        qword_1ECD84FF0 = 0;
        dword_1ECD84FF8 = 0;
      }
    }
    nw::object::__destroy_def_instance = (uint64_t)nw::object::class_def::register_method_def(qword_1ECD85030, (uint64_t)nw::object::_destroy, 0);
    qword_1ECD85030 = v2;
  }
}

void __cxx_global_var_init_16242()
{
  unsigned __int8 v0;
  unsigned __int8 v1;
  uint64_t v2;

  {
    if ((v1 & 1) == 0)
    {
      {
        nw::object::_class(void)::instance = (uint64_t)"object";
        *(_QWORD *)algn_1ECD84F58 = 6;
        xmmword_1ECD84F60 = 0u;
        unk_1ECD84F70 = 0u;
        xmmword_1ECD84F80 = 0u;
        *(_OWORD *)&qword_1ECD84F90 = 0u;
        *(__int128 *)((char *)&xmmword_1ECD84F98 + 8) = 0u;
        *(_OWORD *)&qword_1ECD84FB0 = 0u;
        xmmword_1ECD84FC0 = 0u;
        unk_1ECD84FD0 = 0u;
        qword_1ECD84FE0 = (uint64_t)&qword_1ECD84FE0;
        unk_1ECD84FE8 = &qword_1ECD84FE0;
        qword_1ECD84FF0 = 0;
        dword_1ECD84FF8 = 0;
      }
    }
    nw::object::__description_def_instance = (uint64_t)nw::object::class_def::register_method_def(qword_1ECD85060, (uint64_t)nw::object::_description, 0);
    qword_1ECD85060 = v2;
  }
}

void __cxx_global_var_init_1_16243()
{
  unsigned __int8 v0;
  unsigned __int8 v1;
  uint64_t v2;

  {
    if ((v1 & 1) == 0)
    {
      {
        nw::object::_class(void)::instance = (uint64_t)"object";
        *(_QWORD *)algn_1ECD84F58 = 6;
        xmmword_1ECD84F60 = 0u;
        unk_1ECD84F70 = 0u;
        xmmword_1ECD84F80 = 0u;
        *(_OWORD *)&qword_1ECD84F90 = 0u;
        *(__int128 *)((char *)&xmmword_1ECD84F98 + 8) = 0u;
        *(_OWORD *)&qword_1ECD84FB0 = 0u;
        xmmword_1ECD84FC0 = 0u;
        unk_1ECD84FD0 = 0u;
        qword_1ECD84FE0 = (uint64_t)&qword_1ECD84FE0;
        unk_1ECD84FE8 = &qword_1ECD84FE0;
        qword_1ECD84FF0 = 0;
        dword_1ECD84FF8 = 0;
      }
    }
    nw::object::__redacted_description_def_instance = (uint64_t)nw::object::class_def::register_method_def(qword_1ECD85048, (uint64_t)nw::object::_redacted_description, 0);
    qword_1ECD85048 = v2;
  }
}

void __cxx_global_var_init_2_16244()
{
  unsigned __int8 v0;
  unsigned __int8 v1;
  uint64_t v2;

  {
    if ((v1 & 1) == 0)
    {
      {
        nw::object::_class(void)::instance = (uint64_t)"object";
        *(_QWORD *)algn_1ECD84F58 = 6;
        xmmword_1ECD84F60 = 0u;
        unk_1ECD84F70 = 0u;
        xmmword_1ECD84F80 = 0u;
        *(_OWORD *)&qword_1ECD84F90 = 0u;
        *(__int128 *)((char *)&xmmword_1ECD84F98 + 8) = 0u;
        *(_OWORD *)&qword_1ECD84FB0 = 0u;
        xmmword_1ECD84FC0 = 0u;
        unk_1ECD84FD0 = 0u;
        qword_1ECD84FE0 = (uint64_t)&qword_1ECD84FE0;
        unk_1ECD84FE8 = &qword_1ECD84FE0;
        qword_1ECD84FF0 = 0;
        dword_1ECD84FF8 = 0;
      }
    }
    nw::object::__destroy_def_instance = (uint64_t)nw::object::class_def::register_method_def(qword_1ECD85030, (uint64_t)nw::object::_destroy, 0);
    qword_1ECD85030 = v2;
  }
}

void __cxx_global_var_init_16376()
{
  unsigned __int8 v0;
  unsigned __int8 v1;
  uint64_t v2;

  {
    if ((v1 & 1) == 0)
    {
      {
        nw::object::_class(void)::instance = (uint64_t)"object";
        *(_QWORD *)algn_1ECD84F58 = 6;
        xmmword_1ECD84F60 = 0u;
        unk_1ECD84F70 = 0u;
        xmmword_1ECD84F80 = 0u;
        *(_OWORD *)&qword_1ECD84F90 = 0u;
        *(__int128 *)((char *)&xmmword_1ECD84F98 + 8) = 0u;
        *(_OWORD *)&qword_1ECD84FB0 = 0u;
        xmmword_1ECD84FC0 = 0u;
        unk_1ECD84FD0 = 0u;
        qword_1ECD84FE0 = (uint64_t)&qword_1ECD84FE0;
        unk_1ECD84FE8 = &qword_1ECD84FE0;
        qword_1ECD84FF0 = 0;
        dword_1ECD84FF8 = 0;
      }
    }
    nw::object::__description_def_instance = (uint64_t)nw::object::class_def::register_method_def(qword_1ECD85060, (uint64_t)nw::object::_description, 0);
    qword_1ECD85060 = v2;
  }
}

void __cxx_global_var_init_1_16377()
{
  unsigned __int8 v0;
  unsigned __int8 v1;
  uint64_t v2;

  {
    if ((v1 & 1) == 0)
    {
      {
        nw::object::_class(void)::instance = (uint64_t)"object";
        *(_QWORD *)algn_1ECD84F58 = 6;
        xmmword_1ECD84F60 = 0u;
        unk_1ECD84F70 = 0u;
        xmmword_1ECD84F80 = 0u;
        *(_OWORD *)&qword_1ECD84F90 = 0u;
        *(__int128 *)((char *)&xmmword_1ECD84F98 + 8) = 0u;
        *(_OWORD *)&qword_1ECD84FB0 = 0u;
        xmmword_1ECD84FC0 = 0u;
        unk_1ECD84FD0 = 0u;
        qword_1ECD84FE0 = (uint64_t)&qword_1ECD84FE0;
        unk_1ECD84FE8 = &qword_1ECD84FE0;
        qword_1ECD84FF0 = 0;
        dword_1ECD84FF8 = 0;
      }
    }
    nw::object::__redacted_description_def_instance = (uint64_t)nw::object::class_def::register_method_def(qword_1ECD85048, (uint64_t)nw::object::_redacted_description, 0);
    qword_1ECD85048 = v2;
  }
}

void __cxx_global_var_init_2_16378()
{
  unsigned __int8 v0;
  unsigned __int8 v1;
  uint64_t v2;

  {
    if ((v1 & 1) == 0)
    {
      {
        nw::object::_class(void)::instance = (uint64_t)"object";
        *(_QWORD *)algn_1ECD84F58 = 6;
        xmmword_1ECD84F60 = 0u;
        unk_1ECD84F70 = 0u;
        xmmword_1ECD84F80 = 0u;
        *(_OWORD *)&qword_1ECD84F90 = 0u;
        *(__int128 *)((char *)&xmmword_1ECD84F98 + 8) = 0u;
        *(_OWORD *)&qword_1ECD84FB0 = 0u;
        xmmword_1ECD84FC0 = 0u;
        unk_1ECD84FD0 = 0u;
        qword_1ECD84FE0 = (uint64_t)&qword_1ECD84FE0;
        unk_1ECD84FE8 = &qword_1ECD84FE0;
        qword_1ECD84FF0 = 0;
        dword_1ECD84FF8 = 0;
      }
    }
    nw::object::__destroy_def_instance = (uint64_t)nw::object::class_def::register_method_def(qword_1ECD85030, (uint64_t)nw::object::_destroy, 0);
    qword_1ECD85030 = v2;
  }
}

void __cxx_global_var_init_17259()
{
  unsigned __int8 v0;
  unsigned __int8 v1;
  uint64_t v2;

  {
    if ((v1 & 1) == 0)
    {
      {
        nw::object::_class(void)::instance = (uint64_t)"object";
        *(_QWORD *)algn_1ECD84F58 = 6;
        xmmword_1ECD84F60 = 0u;
        unk_1ECD84F70 = 0u;
        xmmword_1ECD84F80 = 0u;
        *(_OWORD *)&qword_1ECD84F90 = 0u;
        *(__int128 *)((char *)&xmmword_1ECD84F98 + 8) = 0u;
        *(_OWORD *)&qword_1ECD84FB0 = 0u;
        xmmword_1ECD84FC0 = 0u;
        unk_1ECD84FD0 = 0u;
        qword_1ECD84FE0 = (uint64_t)&qword_1ECD84FE0;
        unk_1ECD84FE8 = &qword_1ECD84FE0;
        qword_1ECD84FF0 = 0;
        dword_1ECD84FF8 = 0;
      }
    }
    nw::object::__description_def_instance = (uint64_t)nw::object::class_def::register_method_def(qword_1ECD85060, (uint64_t)nw::object::_description, 0);
    qword_1ECD85060 = v2;
  }
}

void __cxx_global_var_init_1_17260()
{
  unsigned __int8 v0;
  unsigned __int8 v1;
  uint64_t v2;

  {
    if ((v1 & 1) == 0)
    {
      {
        nw::object::_class(void)::instance = (uint64_t)"object";
        *(_QWORD *)algn_1ECD84F58 = 6;
        xmmword_1ECD84F60 = 0u;
        unk_1ECD84F70 = 0u;
        xmmword_1ECD84F80 = 0u;
        *(_OWORD *)&qword_1ECD84F90 = 0u;
        *(__int128 *)((char *)&xmmword_1ECD84F98 + 8) = 0u;
        *(_OWORD *)&qword_1ECD84FB0 = 0u;
        xmmword_1ECD84FC0 = 0u;
        unk_1ECD84FD0 = 0u;
        qword_1ECD84FE0 = (uint64_t)&qword_1ECD84FE0;
        unk_1ECD84FE8 = &qword_1ECD84FE0;
        qword_1ECD84FF0 = 0;
        dword_1ECD84FF8 = 0;
      }
    }
    nw::object::__redacted_description_def_instance = (uint64_t)nw::object::class_def::register_method_def(qword_1ECD85048, (uint64_t)nw::object::_redacted_description, 0);
    qword_1ECD85048 = v2;
  }
}

void __cxx_global_var_init_2_17261()
{
  unsigned __int8 v0;
  unsigned __int8 v1;
  uint64_t v2;

  {
    if ((v1 & 1) == 0)
    {
      {
        nw::object::_class(void)::instance = (uint64_t)"object";
        *(_QWORD *)algn_1ECD84F58 = 6;
        xmmword_1ECD84F60 = 0u;
        unk_1ECD84F70 = 0u;
        xmmword_1ECD84F80 = 0u;
        *(_OWORD *)&qword_1ECD84F90 = 0u;
        *(__int128 *)((char *)&xmmword_1ECD84F98 + 8) = 0u;
        *(_OWORD *)&qword_1ECD84FB0 = 0u;
        xmmword_1ECD84FC0 = 0u;
        unk_1ECD84FD0 = 0u;
        qword_1ECD84FE0 = (uint64_t)&qword_1ECD84FE0;
        unk_1ECD84FE8 = &qword_1ECD84FE0;
        qword_1ECD84FF0 = 0;
        dword_1ECD84FF8 = 0;
      }
    }
    nw::object::__destroy_def_instance = (uint64_t)nw::object::class_def::register_method_def(qword_1ECD85030, (uint64_t)nw::object::_destroy, 0);
    qword_1ECD85030 = v2;
  }
}

void __cxx_global_var_init_18082()
{
  unsigned __int8 v0;
  unsigned __int8 v1;
  uint64_t v2;

  {
    if ((v1 & 1) == 0)
    {
      {
        nw::object::_class(void)::instance = (uint64_t)"object";
        *(_QWORD *)algn_1ECD84F58 = 6;
        xmmword_1ECD84F60 = 0u;
        unk_1ECD84F70 = 0u;
        xmmword_1ECD84F80 = 0u;
        *(_OWORD *)&qword_1ECD84F90 = 0u;
        *(__int128 *)((char *)&xmmword_1ECD84F98 + 8) = 0u;
        *(_OWORD *)&qword_1ECD84FB0 = 0u;
        xmmword_1ECD84FC0 = 0u;
        unk_1ECD84FD0 = 0u;
        qword_1ECD84FE0 = (uint64_t)&qword_1ECD84FE0;
        unk_1ECD84FE8 = &qword_1ECD84FE0;
        qword_1ECD84FF0 = 0;
        dword_1ECD84FF8 = 0;
      }
    }
    nw::object::__description_def_instance = (uint64_t)nw::object::class_def::register_method_def(qword_1ECD85060, (uint64_t)nw::object::_description, 0);
    qword_1ECD85060 = v2;
  }
}

void __cxx_global_var_init_1_18083()
{
  unsigned __int8 v0;
  unsigned __int8 v1;
  uint64_t v2;

  {
    if ((v1 & 1) == 0)
    {
      {
        nw::object::_class(void)::instance = (uint64_t)"object";
        *(_QWORD *)algn_1ECD84F58 = 6;
        xmmword_1ECD84F60 = 0u;
        unk_1ECD84F70 = 0u;
        xmmword_1ECD84F80 = 0u;
        *(_OWORD *)&qword_1ECD84F90 = 0u;
        *(__int128 *)((char *)&xmmword_1ECD84F98 + 8) = 0u;
        *(_OWORD *)&qword_1ECD84FB0 = 0u;
        xmmword_1ECD84FC0 = 0u;
        unk_1ECD84FD0 = 0u;
        qword_1ECD84FE0 = (uint64_t)&qword_1ECD84FE0;
        unk_1ECD84FE8 = &qword_1ECD84FE0;
        qword_1ECD84FF0 = 0;
        dword_1ECD84FF8 = 0;
      }
    }
    nw::object::__redacted_description_def_instance = (uint64_t)nw::object::class_def::register_method_def(qword_1ECD85048, (uint64_t)nw::object::_redacted_description, 0);
    qword_1ECD85048 = v2;
  }
}

void __cxx_global_var_init_2_18084()
{
  unsigned __int8 v0;
  unsigned __int8 v1;
  uint64_t v2;

  {
    if ((v1 & 1) == 0)
    {
      {
        nw::object::_class(void)::instance = (uint64_t)"object";
        *(_QWORD *)algn_1ECD84F58 = 6;
        xmmword_1ECD84F60 = 0u;
        unk_1ECD84F70 = 0u;
        xmmword_1ECD84F80 = 0u;
        *(_OWORD *)&qword_1ECD84F90 = 0u;
        *(__int128 *)((char *)&xmmword_1ECD84F98 + 8) = 0u;
        *(_OWORD *)&qword_1ECD84FB0 = 0u;
        xmmword_1ECD84FC0 = 0u;
        unk_1ECD84FD0 = 0u;
        qword_1ECD84FE0 = (uint64_t)&qword_1ECD84FE0;
        unk_1ECD84FE8 = &qword_1ECD84FE0;
        qword_1ECD84FF0 = 0;
        dword_1ECD84FF8 = 0;
      }
    }
    nw::object::__destroy_def_instance = (uint64_t)nw::object::class_def::register_method_def(qword_1ECD85030, (uint64_t)nw::object::_destroy, 0);
    qword_1ECD85030 = v2;
  }
}

void __cxx_global_var_init_18970()
{
  unsigned __int8 v0;
  unsigned __int8 v1;
  uint64_t v2;

  {
    if ((v1 & 1) == 0)
    {
      {
        nw::object::_class(void)::instance = (uint64_t)"object";
        *(_QWORD *)algn_1ECD84F58 = 6;
        xmmword_1ECD84F60 = 0u;
        unk_1ECD84F70 = 0u;
        xmmword_1ECD84F80 = 0u;
        *(_OWORD *)&qword_1ECD84F90 = 0u;
        *(__int128 *)((char *)&xmmword_1ECD84F98 + 8) = 0u;
        *(_OWORD *)&qword_1ECD84FB0 = 0u;
        xmmword_1ECD84FC0 = 0u;
        unk_1ECD84FD0 = 0u;
        qword_1ECD84FE0 = (uint64_t)&qword_1ECD84FE0;
        unk_1ECD84FE8 = &qword_1ECD84FE0;
        qword_1ECD84FF0 = 0;
        dword_1ECD84FF8 = 0;
      }
    }
    nw::object::__description_def_instance = (uint64_t)nw::object::class_def::register_method_def(qword_1ECD85060, (uint64_t)nw::object::_description, 0);
    qword_1ECD85060 = v2;
  }
}

void __cxx_global_var_init_1_18971()
{
  unsigned __int8 v0;
  unsigned __int8 v1;
  uint64_t v2;

  {
    if ((v1 & 1) == 0)
    {
      {
        nw::object::_class(void)::instance = (uint64_t)"object";
        *(_QWORD *)algn_1ECD84F58 = 6;
        xmmword_1ECD84F60 = 0u;
        unk_1ECD84F70 = 0u;
        xmmword_1ECD84F80 = 0u;
        *(_OWORD *)&qword_1ECD84F90 = 0u;
        *(__int128 *)((char *)&xmmword_1ECD84F98 + 8) = 0u;
        *(_OWORD *)&qword_1ECD84FB0 = 0u;
        xmmword_1ECD84FC0 = 0u;
        unk_1ECD84FD0 = 0u;
        qword_1ECD84FE0 = (uint64_t)&qword_1ECD84FE0;
        unk_1ECD84FE8 = &qword_1ECD84FE0;
        qword_1ECD84FF0 = 0;
        dword_1ECD84FF8 = 0;
      }
    }
    nw::object::__redacted_description_def_instance = (uint64_t)nw::object::class_def::register_method_def(qword_1ECD85048, (uint64_t)nw::object::_redacted_description, 0);
    qword_1ECD85048 = v2;
  }
}

void __cxx_global_var_init_2_18972()
{
  unsigned __int8 v0;
  unsigned __int8 v1;
  uint64_t v2;

  {
    if ((v1 & 1) == 0)
    {
      {
        nw::object::_class(void)::instance = (uint64_t)"object";
        *(_QWORD *)algn_1ECD84F58 = 6;
        xmmword_1ECD84F60 = 0u;
        unk_1ECD84F70 = 0u;
        xmmword_1ECD84F80 = 0u;
        *(_OWORD *)&qword_1ECD84F90 = 0u;
        *(__int128 *)((char *)&xmmword_1ECD84F98 + 8) = 0u;
        *(_OWORD *)&qword_1ECD84FB0 = 0u;
        xmmword_1ECD84FC0 = 0u;
        unk_1ECD84FD0 = 0u;
        qword_1ECD84FE0 = (uint64_t)&qword_1ECD84FE0;
        unk_1ECD84FE8 = &qword_1ECD84FE0;
        qword_1ECD84FF0 = 0;
        dword_1ECD84FF8 = 0;
      }
    }
    nw::object::__destroy_def_instance = (uint64_t)nw::object::class_def::register_method_def(qword_1ECD85030, (uint64_t)nw::object::_destroy, 0);
    qword_1ECD85030 = v2;
  }
}

void __cxx_global_var_init_22182()
{
  unsigned __int8 v0;
  unsigned __int8 v1;
  uint64_t v2;

  {
    if ((v1 & 1) == 0)
    {
      {
        nw::object::_class(void)::instance = (uint64_t)"object";
        *(_QWORD *)algn_1ECD84F58 = 6;
        xmmword_1ECD84F60 = 0u;
        unk_1ECD84F70 = 0u;
        xmmword_1ECD84F80 = 0u;
        *(_OWORD *)&qword_1ECD84F90 = 0u;
        *(__int128 *)((char *)&xmmword_1ECD84F98 + 8) = 0u;
        *(_OWORD *)&qword_1ECD84FB0 = 0u;
        xmmword_1ECD84FC0 = 0u;
        unk_1ECD84FD0 = 0u;
        qword_1ECD84FE0 = (uint64_t)&qword_1ECD84FE0;
        unk_1ECD84FE8 = &qword_1ECD84FE0;
        qword_1ECD84FF0 = 0;
        dword_1ECD84FF8 = 0;
      }
    }
    nw::object::__description_def_instance = (uint64_t)nw::object::class_def::register_method_def(qword_1ECD85060, (uint64_t)nw::object::_description, 0);
    qword_1ECD85060 = v2;
  }
}

void __cxx_global_var_init_1_22183()
{
  unsigned __int8 v0;
  unsigned __int8 v1;
  uint64_t v2;

  {
    if ((v1 & 1) == 0)
    {
      {
        nw::object::_class(void)::instance = (uint64_t)"object";
        *(_QWORD *)algn_1ECD84F58 = 6;
        xmmword_1ECD84F60 = 0u;
        unk_1ECD84F70 = 0u;
        xmmword_1ECD84F80 = 0u;
        *(_OWORD *)&qword_1ECD84F90 = 0u;
        *(__int128 *)((char *)&xmmword_1ECD84F98 + 8) = 0u;
        *(_OWORD *)&qword_1ECD84FB0 = 0u;
        xmmword_1ECD84FC0 = 0u;
        unk_1ECD84FD0 = 0u;
        qword_1ECD84FE0 = (uint64_t)&qword_1ECD84FE0;
        unk_1ECD84FE8 = &qword_1ECD84FE0;
        qword_1ECD84FF0 = 0;
        dword_1ECD84FF8 = 0;
      }
    }
    nw::object::__redacted_description_def_instance = (uint64_t)nw::object::class_def::register_method_def(qword_1ECD85048, (uint64_t)nw::object::_redacted_description, 0);
    qword_1ECD85048 = v2;
  }
}

void __cxx_global_var_init_2_22184()
{
  unsigned __int8 v0;
  unsigned __int8 v1;
  uint64_t v2;

  {
    if ((v1 & 1) == 0)
    {
      {
        nw::object::_class(void)::instance = (uint64_t)"object";
        *(_QWORD *)algn_1ECD84F58 = 6;
        xmmword_1ECD84F60 = 0u;
        unk_1ECD84F70 = 0u;
        xmmword_1ECD84F80 = 0u;
        *(_OWORD *)&qword_1ECD84F90 = 0u;
        *(__int128 *)((char *)&xmmword_1ECD84F98 + 8) = 0u;
        *(_OWORD *)&qword_1ECD84FB0 = 0u;
        xmmword_1ECD84FC0 = 0u;
        unk_1ECD84FD0 = 0u;
        qword_1ECD84FE0 = (uint64_t)&qword_1ECD84FE0;
        unk_1ECD84FE8 = &qword_1ECD84FE0;
        qword_1ECD84FF0 = 0;
        dword_1ECD84FF8 = 0;
      }
    }
    nw::object::__destroy_def_instance = (uint64_t)nw::object::class_def::register_method_def(qword_1ECD85030, (uint64_t)nw::object::_destroy, 0);
    qword_1ECD85030 = v2;
  }
}

void __cxx_global_var_init_22835()
{
  unsigned __int8 v0;
  unsigned __int8 v1;
  uint64_t v2;

  {
    if ((v1 & 1) == 0)
    {
      {
        nw::object::_class(void)::instance = (uint64_t)"object";
        *(_QWORD *)algn_1ECD84F58 = 6;
        xmmword_1ECD84F60 = 0u;
        unk_1ECD84F70 = 0u;
        xmmword_1ECD84F80 = 0u;
        *(_OWORD *)&qword_1ECD84F90 = 0u;
        *(__int128 *)((char *)&xmmword_1ECD84F98 + 8) = 0u;
        *(_OWORD *)&qword_1ECD84FB0 = 0u;
        xmmword_1ECD84FC0 = 0u;
        unk_1ECD84FD0 = 0u;
        qword_1ECD84FE0 = (uint64_t)&qword_1ECD84FE0;
        unk_1ECD84FE8 = &qword_1ECD84FE0;
        qword_1ECD84FF0 = 0;
        dword_1ECD84FF8 = 0;
      }
    }
    nw::object::__description_def_instance = (uint64_t)nw::object::class_def::register_method_def(qword_1ECD85060, (uint64_t)nw::object::_description, 0);
    qword_1ECD85060 = v2;
  }
}

void __cxx_global_var_init_1_22836()
{
  unsigned __int8 v0;
  unsigned __int8 v1;
  uint64_t v2;

  {
    if ((v1 & 1) == 0)
    {
      {
        nw::object::_class(void)::instance = (uint64_t)"object";
        *(_QWORD *)algn_1ECD84F58 = 6;
        xmmword_1ECD84F60 = 0u;
        unk_1ECD84F70 = 0u;
        xmmword_1ECD84F80 = 0u;
        *(_OWORD *)&qword_1ECD84F90 = 0u;
        *(__int128 *)((char *)&xmmword_1ECD84F98 + 8) = 0u;
        *(_OWORD *)&qword_1ECD84FB0 = 0u;
        xmmword_1ECD84FC0 = 0u;
        unk_1ECD84FD0 = 0u;
        qword_1ECD84FE0 = (uint64_t)&qword_1ECD84FE0;
        unk_1ECD84FE8 = &qword_1ECD84FE0;
        qword_1ECD84FF0 = 0;
        dword_1ECD84FF8 = 0;
      }
    }
    nw::object::__redacted_description_def_instance = (uint64_t)nw::object::class_def::register_method_def(qword_1ECD85048, (uint64_t)nw::object::_redacted_description, 0);
    qword_1ECD85048 = v2;
  }
}

void __cxx_global_var_init_2_22837()
{
  unsigned __int8 v0;
  unsigned __int8 v1;
  uint64_t v2;

  {
    if ((v1 & 1) == 0)
    {
      {
        nw::object::_class(void)::instance = (uint64_t)"object";
        *(_QWORD *)algn_1ECD84F58 = 6;
        xmmword_1ECD84F60 = 0u;
        unk_1ECD84F70 = 0u;
        xmmword_1ECD84F80 = 0u;
        *(_OWORD *)&qword_1ECD84F90 = 0u;
        *(__int128 *)((char *)&xmmword_1ECD84F98 + 8) = 0u;
        *(_OWORD *)&qword_1ECD84FB0 = 0u;
        xmmword_1ECD84FC0 = 0u;
        unk_1ECD84FD0 = 0u;
        qword_1ECD84FE0 = (uint64_t)&qword_1ECD84FE0;
        unk_1ECD84FE8 = &qword_1ECD84FE0;
        qword_1ECD84FF0 = 0;
        dword_1ECD84FF8 = 0;
      }
    }
    nw::object::__destroy_def_instance = (uint64_t)nw::object::class_def::register_method_def(qword_1ECD85030, (uint64_t)nw::object::_destroy, 0);
    qword_1ECD85030 = v2;
  }
}

void __cxx_global_var_init_22914()
{
  unsigned __int8 v0;
  unsigned __int8 v1;
  uint64_t v2;

  {
    if ((v1 & 1) == 0)
    {
      {
        nw::object::_class(void)::instance = (uint64_t)"object";
        *(_QWORD *)algn_1ECD84F58 = 6;
        xmmword_1ECD84F60 = 0u;
        unk_1ECD84F70 = 0u;
        xmmword_1ECD84F80 = 0u;
        *(_OWORD *)&qword_1ECD84F90 = 0u;
        *(__int128 *)((char *)&xmmword_1ECD84F98 + 8) = 0u;
        *(_OWORD *)&qword_1ECD84FB0 = 0u;
        xmmword_1ECD84FC0 = 0u;
        unk_1ECD84FD0 = 0u;
        qword_1ECD84FE0 = (uint64_t)&qword_1ECD84FE0;
        unk_1ECD84FE8 = &qword_1ECD84FE0;
        qword_1ECD84FF0 = 0;
        dword_1ECD84FF8 = 0;
      }
    }
    nw::object::__description_def_instance = (uint64_t)nw::object::class_def::register_method_def(qword_1ECD85060, (uint64_t)nw::object::_description, 0);
    qword_1ECD85060 = v2;
  }
}

void __cxx_global_var_init_1_22915()
{
  unsigned __int8 v0;
  unsigned __int8 v1;
  uint64_t v2;

  {
    if ((v1 & 1) == 0)
    {
      {
        nw::object::_class(void)::instance = (uint64_t)"object";
        *(_QWORD *)algn_1ECD84F58 = 6;
        xmmword_1ECD84F60 = 0u;
        unk_1ECD84F70 = 0u;
        xmmword_1ECD84F80 = 0u;
        *(_OWORD *)&qword_1ECD84F90 = 0u;
        *(__int128 *)((char *)&xmmword_1ECD84F98 + 8) = 0u;
        *(_OWORD *)&qword_1ECD84FB0 = 0u;
        xmmword_1ECD84FC0 = 0u;
        unk_1ECD84FD0 = 0u;
        qword_1ECD84FE0 = (uint64_t)&qword_1ECD84FE0;
        unk_1ECD84FE8 = &qword_1ECD84FE0;
        qword_1ECD84FF0 = 0;
        dword_1ECD84FF8 = 0;
      }
    }
    nw::object::__redacted_description_def_instance = (uint64_t)nw::object::class_def::register_method_def(qword_1ECD85048, (uint64_t)nw::object::_redacted_description, 0);
    qword_1ECD85048 = v2;
  }
}

void __cxx_global_var_init_2_22916()
{
  unsigned __int8 v0;
  unsigned __int8 v1;
  uint64_t v2;

  {
    if ((v1 & 1) == 0)
    {
      {
        nw::object::_class(void)::instance = (uint64_t)"object";
        *(_QWORD *)algn_1ECD84F58 = 6;
        xmmword_1ECD84F60 = 0u;
        unk_1ECD84F70 = 0u;
        xmmword_1ECD84F80 = 0u;
        *(_OWORD *)&qword_1ECD84F90 = 0u;
        *(__int128 *)((char *)&xmmword_1ECD84F98 + 8) = 0u;
        *(_OWORD *)&qword_1ECD84FB0 = 0u;
        xmmword_1ECD84FC0 = 0u;
        unk_1ECD84FD0 = 0u;
        qword_1ECD84FE0 = (uint64_t)&qword_1ECD84FE0;
        unk_1ECD84FE8 = &qword_1ECD84FE0;
        qword_1ECD84FF0 = 0;
        dword_1ECD84FF8 = 0;
      }
    }
    nw::object::__destroy_def_instance = (uint64_t)nw::object::class_def::register_method_def(qword_1ECD85030, (uint64_t)nw::object::_destroy, 0);
    qword_1ECD85030 = v2;
  }
}

void __cxx_global_var_init_23116()
{
  unsigned __int8 v0;
  unsigned __int8 v1;
  uint64_t v2;

  {
    if ((v1 & 1) == 0)
    {
      {
        nw::object::_class(void)::instance = (uint64_t)"object";
        *(_QWORD *)algn_1ECD84F58 = 6;
        xmmword_1ECD84F60 = 0u;
        unk_1ECD84F70 = 0u;
        xmmword_1ECD84F80 = 0u;
        *(_OWORD *)&qword_1ECD84F90 = 0u;
        *(__int128 *)((char *)&xmmword_1ECD84F98 + 8) = 0u;
        *(_OWORD *)&qword_1ECD84FB0 = 0u;
        xmmword_1ECD84FC0 = 0u;
        unk_1ECD84FD0 = 0u;
        qword_1ECD84FE0 = (uint64_t)&qword_1ECD84FE0;
        unk_1ECD84FE8 = &qword_1ECD84FE0;
        qword_1ECD84FF0 = 0;
        dword_1ECD84FF8 = 0;
      }
    }
    nw::object::__description_def_instance = (uint64_t)nw::object::class_def::register_method_def(qword_1ECD85060, (uint64_t)nw::object::_description, 0);
    qword_1ECD85060 = v2;
  }
}

void __cxx_global_var_init_1_23117()
{
  unsigned __int8 v0;
  unsigned __int8 v1;
  uint64_t v2;

  {
    if ((v1 & 1) == 0)
    {
      {
        nw::object::_class(void)::instance = (uint64_t)"object";
        *(_QWORD *)algn_1ECD84F58 = 6;
        xmmword_1ECD84F60 = 0u;
        unk_1ECD84F70 = 0u;
        xmmword_1ECD84F80 = 0u;
        *(_OWORD *)&qword_1ECD84F90 = 0u;
        *(__int128 *)((char *)&xmmword_1ECD84F98 + 8) = 0u;
        *(_OWORD *)&qword_1ECD84FB0 = 0u;
        xmmword_1ECD84FC0 = 0u;
        unk_1ECD84FD0 = 0u;
        qword_1ECD84FE0 = (uint64_t)&qword_1ECD84FE0;
        unk_1ECD84FE8 = &qword_1ECD84FE0;
        qword_1ECD84FF0 = 0;
        dword_1ECD84FF8 = 0;
      }
    }
    nw::object::__redacted_description_def_instance = (uint64_t)nw::object::class_def::register_method_def(qword_1ECD85048, (uint64_t)nw::object::_redacted_description, 0);
    qword_1ECD85048 = v2;
  }
}

void __cxx_global_var_init_2_23118()
{
  unsigned __int8 v0;
  unsigned __int8 v1;
  uint64_t v2;

  {
    if ((v1 & 1) == 0)
    {
      {
        nw::object::_class(void)::instance = (uint64_t)"object";
        *(_QWORD *)algn_1ECD84F58 = 6;
        xmmword_1ECD84F60 = 0u;
        unk_1ECD84F70 = 0u;
        xmmword_1ECD84F80 = 0u;
        *(_OWORD *)&qword_1ECD84F90 = 0u;
        *(__int128 *)((char *)&xmmword_1ECD84F98 + 8) = 0u;
        *(_OWORD *)&qword_1ECD84FB0 = 0u;
        xmmword_1ECD84FC0 = 0u;
        unk_1ECD84FD0 = 0u;
        qword_1ECD84FE0 = (uint64_t)&qword_1ECD84FE0;
        unk_1ECD84FE8 = &qword_1ECD84FE0;
        qword_1ECD84FF0 = 0;
        dword_1ECD84FF8 = 0;
      }
    }
    nw::object::__destroy_def_instance = (uint64_t)nw::object::class_def::register_method_def(qword_1ECD85030, (uint64_t)nw::object::_destroy, 0);
    qword_1ECD85030 = v2;
  }
}

void __cxx_global_var_init_24157()
{
  unsigned __int8 v0;
  unsigned __int8 v1;
  uint64_t v2;

  {
    if ((v1 & 1) == 0)
    {
      {
        nw::object::_class(void)::instance = (uint64_t)"object";
        *(_QWORD *)algn_1ECD84F58 = 6;
        xmmword_1ECD84F60 = 0u;
        unk_1ECD84F70 = 0u;
        xmmword_1ECD84F80 = 0u;
        *(_OWORD *)&qword_1ECD84F90 = 0u;
        *(__int128 *)((char *)&xmmword_1ECD84F98 + 8) = 0u;
        *(_OWORD *)&qword_1ECD84FB0 = 0u;
        xmmword_1ECD84FC0 = 0u;
        unk_1ECD84FD0 = 0u;
        qword_1ECD84FE0 = (uint64_t)&qword_1ECD84FE0;
        unk_1ECD84FE8 = &qword_1ECD84FE0;
        qword_1ECD84FF0 = 0;
        dword_1ECD84FF8 = 0;
      }
    }
    nw::object::__description_def_instance = (uint64_t)nw::object::class_def::register_method_def(qword_1ECD85060, (uint64_t)nw::object::_description, 0);
    qword_1ECD85060 = v2;
  }
}

void __cxx_global_var_init_1_24158()
{
  unsigned __int8 v0;
  unsigned __int8 v1;
  uint64_t v2;

  {
    if ((v1 & 1) == 0)
    {
      {
        nw::object::_class(void)::instance = (uint64_t)"object";
        *(_QWORD *)algn_1ECD84F58 = 6;
        xmmword_1ECD84F60 = 0u;
        unk_1ECD84F70 = 0u;
        xmmword_1ECD84F80 = 0u;
        *(_OWORD *)&qword_1ECD84F90 = 0u;
        *(__int128 *)((char *)&xmmword_1ECD84F98 + 8) = 0u;
        *(_OWORD *)&qword_1ECD84FB0 = 0u;
        xmmword_1ECD84FC0 = 0u;
        unk_1ECD84FD0 = 0u;
        qword_1ECD84FE0 = (uint64_t)&qword_1ECD84FE0;
        unk_1ECD84FE8 = &qword_1ECD84FE0;
        qword_1ECD84FF0 = 0;
        dword_1ECD84FF8 = 0;
      }
    }
    nw::object::__redacted_description_def_instance = (uint64_t)nw::object::class_def::register_method_def(qword_1ECD85048, (uint64_t)nw::object::_redacted_description, 0);
    qword_1ECD85048 = v2;
  }
}

void __cxx_global_var_init_2_24159()
{
  unsigned __int8 v0;
  unsigned __int8 v1;
  uint64_t v2;

  {
    if ((v1 & 1) == 0)
    {
      {
        nw::object::_class(void)::instance = (uint64_t)"object";
        *(_QWORD *)algn_1ECD84F58 = 6;
        xmmword_1ECD84F60 = 0u;
        unk_1ECD84F70 = 0u;
        xmmword_1ECD84F80 = 0u;
        *(_OWORD *)&qword_1ECD84F90 = 0u;
        *(__int128 *)((char *)&xmmword_1ECD84F98 + 8) = 0u;
        *(_OWORD *)&qword_1ECD84FB0 = 0u;
        xmmword_1ECD84FC0 = 0u;
        unk_1ECD84FD0 = 0u;
        qword_1ECD84FE0 = (uint64_t)&qword_1ECD84FE0;
        unk_1ECD84FE8 = &qword_1ECD84FE0;
        qword_1ECD84FF0 = 0;
        dword_1ECD84FF8 = 0;
      }
    }
    nw::object::__destroy_def_instance = (uint64_t)nw::object::class_def::register_method_def(qword_1ECD85030, (uint64_t)nw::object::_destroy, 0);
    qword_1ECD85030 = v2;
  }
}

void __cxx_global_var_init_25656()
{
  unsigned __int8 v0;
  unsigned __int8 v1;
  uint64_t v2;

  {
    if ((v1 & 1) == 0)
    {
      {
        nw::object::_class(void)::instance = (uint64_t)"object";
        *(_QWORD *)algn_1ECD84F58 = 6;
        xmmword_1ECD84F60 = 0u;
        unk_1ECD84F70 = 0u;
        xmmword_1ECD84F80 = 0u;
        *(_OWORD *)&qword_1ECD84F90 = 0u;
        *(__int128 *)((char *)&xmmword_1ECD84F98 + 8) = 0u;
        *(_OWORD *)&qword_1ECD84FB0 = 0u;
        xmmword_1ECD84FC0 = 0u;
        unk_1ECD84FD0 = 0u;
        qword_1ECD84FE0 = (uint64_t)&qword_1ECD84FE0;
        unk_1ECD84FE8 = &qword_1ECD84FE0;
        qword_1ECD84FF0 = 0;
        dword_1ECD84FF8 = 0;
      }
    }
    nw::object::__description_def_instance = (uint64_t)nw::object::class_def::register_method_def(qword_1ECD85060, (uint64_t)nw::object::_description, 0);
    qword_1ECD85060 = v2;
  }
}

void __cxx_global_var_init_1_25657()
{
  unsigned __int8 v0;
  unsigned __int8 v1;
  uint64_t v2;

  {
    if ((v1 & 1) == 0)
    {
      {
        nw::object::_class(void)::instance = (uint64_t)"object";
        *(_QWORD *)algn_1ECD84F58 = 6;
        xmmword_1ECD84F60 = 0u;
        unk_1ECD84F70 = 0u;
        xmmword_1ECD84F80 = 0u;
        *(_OWORD *)&qword_1ECD84F90 = 0u;
        *(__int128 *)((char *)&xmmword_1ECD84F98 + 8) = 0u;
        *(_OWORD *)&qword_1ECD84FB0 = 0u;
        xmmword_1ECD84FC0 = 0u;
        unk_1ECD84FD0 = 0u;
        qword_1ECD84FE0 = (uint64_t)&qword_1ECD84FE0;
        unk_1ECD84FE8 = &qword_1ECD84FE0;
        qword_1ECD84FF0 = 0;
        dword_1ECD84FF8 = 0;
      }
    }
    nw::object::__redacted_description_def_instance = (uint64_t)nw::object::class_def::register_method_def(qword_1ECD85048, (uint64_t)nw::object::_redacted_description, 0);
    qword_1ECD85048 = v2;
  }
}

void __cxx_global_var_init_2_25658()
{
  unsigned __int8 v0;
  unsigned __int8 v1;
  uint64_t v2;

  {
    if ((v1 & 1) == 0)
    {
      {
        nw::object::_class(void)::instance = (uint64_t)"object";
        *(_QWORD *)algn_1ECD84F58 = 6;
        xmmword_1ECD84F60 = 0u;
        unk_1ECD84F70 = 0u;
        xmmword_1ECD84F80 = 0u;
        *(_OWORD *)&qword_1ECD84F90 = 0u;
        *(__int128 *)((char *)&xmmword_1ECD84F98 + 8) = 0u;
        *(_OWORD *)&qword_1ECD84FB0 = 0u;
        xmmword_1ECD84FC0 = 0u;
        unk_1ECD84FD0 = 0u;
        qword_1ECD84FE0 = (uint64_t)&qword_1ECD84FE0;
        unk_1ECD84FE8 = &qword_1ECD84FE0;
        qword_1ECD84FF0 = 0;
        dword_1ECD84FF8 = 0;
      }
    }
    nw::object::__destroy_def_instance = (uint64_t)nw::object::class_def::register_method_def(qword_1ECD85030, (uint64_t)nw::object::_destroy, 0);
    qword_1ECD85030 = v2;
  }
}

void __cxx_global_var_init_25733()
{
  unsigned __int8 v0;
  unsigned __int8 v1;
  uint64_t v2;

  {
    if ((v1 & 1) == 0)
    {
      {
        nw::object::_class(void)::instance = (uint64_t)"object";
        *(_QWORD *)algn_1ECD84F58 = 6;
        xmmword_1ECD84F60 = 0u;
        unk_1ECD84F70 = 0u;
        xmmword_1ECD84F80 = 0u;
        *(_OWORD *)&qword_1ECD84F90 = 0u;
        *(__int128 *)((char *)&xmmword_1ECD84F98 + 8) = 0u;
        *(_OWORD *)&qword_1ECD84FB0 = 0u;
        xmmword_1ECD84FC0 = 0u;
        unk_1ECD84FD0 = 0u;
        qword_1ECD84FE0 = (uint64_t)&qword_1ECD84FE0;
        unk_1ECD84FE8 = &qword_1ECD84FE0;
        qword_1ECD84FF0 = 0;
        dword_1ECD84FF8 = 0;
      }
    }
    nw::object::__description_def_instance = (uint64_t)nw::object::class_def::register_method_def(qword_1ECD85060, (uint64_t)nw::object::_description, 0);
    qword_1ECD85060 = v2;
  }
}

void __cxx_global_var_init_1_25734()
{
  unsigned __int8 v0;
  unsigned __int8 v1;
  uint64_t v2;

  {
    if ((v1 & 1) == 0)
    {
      {
        nw::object::_class(void)::instance = (uint64_t)"object";
        *(_QWORD *)algn_1ECD84F58 = 6;
        xmmword_1ECD84F60 = 0u;
        unk_1ECD84F70 = 0u;
        xmmword_1ECD84F80 = 0u;
        *(_OWORD *)&qword_1ECD84F90 = 0u;
        *(__int128 *)((char *)&xmmword_1ECD84F98 + 8) = 0u;
        *(_OWORD *)&qword_1ECD84FB0 = 0u;
        xmmword_1ECD84FC0 = 0u;
        unk_1ECD84FD0 = 0u;
        qword_1ECD84FE0 = (uint64_t)&qword_1ECD84FE0;
        unk_1ECD84FE8 = &qword_1ECD84FE0;
        qword_1ECD84FF0 = 0;
        dword_1ECD84FF8 = 0;
      }
    }
    nw::object::__redacted_description_def_instance = (uint64_t)nw::object::class_def::register_method_def(qword_1ECD85048, (uint64_t)nw::object::_redacted_description, 0);
    qword_1ECD85048 = v2;
  }
}

void __cxx_global_var_init_2_25735()
{
  unsigned __int8 v0;
  unsigned __int8 v1;
  uint64_t v2;

  {
    if ((v1 & 1) == 0)
    {
      {
        nw::object::_class(void)::instance = (uint64_t)"object";
        *(_QWORD *)algn_1ECD84F58 = 6;
        xmmword_1ECD84F60 = 0u;
        unk_1ECD84F70 = 0u;
        xmmword_1ECD84F80 = 0u;
        *(_OWORD *)&qword_1ECD84F90 = 0u;
        *(__int128 *)((char *)&xmmword_1ECD84F98 + 8) = 0u;
        *(_OWORD *)&qword_1ECD84FB0 = 0u;
        xmmword_1ECD84FC0 = 0u;
        unk_1ECD84FD0 = 0u;
        qword_1ECD84FE0 = (uint64_t)&qword_1ECD84FE0;
        unk_1ECD84FE8 = &qword_1ECD84FE0;
        qword_1ECD84FF0 = 0;
        dword_1ECD84FF8 = 0;
      }
    }
    nw::object::__destroy_def_instance = (uint64_t)nw::object::class_def::register_method_def(qword_1ECD85030, (uint64_t)nw::object::_destroy, 0);
    qword_1ECD85030 = v2;
  }
}

void __cxx_global_var_init_26589()
{
  unsigned __int8 v0;
  unsigned __int8 v1;
  uint64_t v2;

  {
    if ((v1 & 1) == 0)
    {
      {
        nw::object::_class(void)::instance = (uint64_t)"object";
        *(_QWORD *)algn_1ECD84F58 = 6;
        xmmword_1ECD84F60 = 0u;
        unk_1ECD84F70 = 0u;
        xmmword_1ECD84F80 = 0u;
        *(_OWORD *)&qword_1ECD84F90 = 0u;
        *(__int128 *)((char *)&xmmword_1ECD84F98 + 8) = 0u;
        *(_OWORD *)&qword_1ECD84FB0 = 0u;
        xmmword_1ECD84FC0 = 0u;
        unk_1ECD84FD0 = 0u;
        qword_1ECD84FE0 = (uint64_t)&qword_1ECD84FE0;
        unk_1ECD84FE8 = &qword_1ECD84FE0;
        qword_1ECD84FF0 = 0;
        dword_1ECD84FF8 = 0;
      }
    }
    nw::object::__description_def_instance = (uint64_t)nw::object::class_def::register_method_def(qword_1ECD85060, (uint64_t)nw::object::_description, 0);
    qword_1ECD85060 = v2;
  }
}

void __cxx_global_var_init_1_26590()
{
  unsigned __int8 v0;
  unsigned __int8 v1;
  uint64_t v2;

  {
    if ((v1 & 1) == 0)
    {
      {
        nw::object::_class(void)::instance = (uint64_t)"object";
        *(_QWORD *)algn_1ECD84F58 = 6;
        xmmword_1ECD84F60 = 0u;
        unk_1ECD84F70 = 0u;
        xmmword_1ECD84F80 = 0u;
        *(_OWORD *)&qword_1ECD84F90 = 0u;
        *(__int128 *)((char *)&xmmword_1ECD84F98 + 8) = 0u;
        *(_OWORD *)&qword_1ECD84FB0 = 0u;
        xmmword_1ECD84FC0 = 0u;
        unk_1ECD84FD0 = 0u;
        qword_1ECD84FE0 = (uint64_t)&qword_1ECD84FE0;
        unk_1ECD84FE8 = &qword_1ECD84FE0;
        qword_1ECD84FF0 = 0;
        dword_1ECD84FF8 = 0;
      }
    }
    nw::object::__redacted_description_def_instance = (uint64_t)nw::object::class_def::register_method_def(qword_1ECD85048, (uint64_t)nw::object::_redacted_description, 0);
    qword_1ECD85048 = v2;
  }
}

void __cxx_global_var_init_2_26591()
{
  unsigned __int8 v0;
  unsigned __int8 v1;
  uint64_t v2;

  {
    if ((v1 & 1) == 0)
    {
      {
        nw::object::_class(void)::instance = (uint64_t)"object";
        *(_QWORD *)algn_1ECD84F58 = 6;
        xmmword_1ECD84F60 = 0u;
        unk_1ECD84F70 = 0u;
        xmmword_1ECD84F80 = 0u;
        *(_OWORD *)&qword_1ECD84F90 = 0u;
        *(__int128 *)((char *)&xmmword_1ECD84F98 + 8) = 0u;
        *(_OWORD *)&qword_1ECD84FB0 = 0u;
        xmmword_1ECD84FC0 = 0u;
        unk_1ECD84FD0 = 0u;
        qword_1ECD84FE0 = (uint64_t)&qword_1ECD84FE0;
        unk_1ECD84FE8 = &qword_1ECD84FE0;
        qword_1ECD84FF0 = 0;
        dword_1ECD84FF8 = 0;
      }
    }
    nw::object::__destroy_def_instance = (uint64_t)nw::object::class_def::register_method_def(qword_1ECD85030, (uint64_t)nw::object::_destroy, 0);
    qword_1ECD85030 = v2;
  }
}

void __cxx_global_var_init_26814()
{
  unsigned __int8 v0;
  unsigned __int8 v1;
  uint64_t v2;

  {
    if ((v1 & 1) == 0)
    {
      {
        nw::object::_class(void)::instance = (uint64_t)"object";
        *(_QWORD *)algn_1ECD84F58 = 6;
        xmmword_1ECD84F60 = 0u;
        unk_1ECD84F70 = 0u;
        xmmword_1ECD84F80 = 0u;
        *(_OWORD *)&qword_1ECD84F90 = 0u;
        *(__int128 *)((char *)&xmmword_1ECD84F98 + 8) = 0u;
        *(_OWORD *)&qword_1ECD84FB0 = 0u;
        xmmword_1ECD84FC0 = 0u;
        unk_1ECD84FD0 = 0u;
        qword_1ECD84FE0 = (uint64_t)&qword_1ECD84FE0;
        unk_1ECD84FE8 = &qword_1ECD84FE0;
        qword_1ECD84FF0 = 0;
        dword_1ECD84FF8 = 0;
      }
    }
    nw::object::__description_def_instance = (uint64_t)nw::object::class_def::register_method_def(qword_1ECD85060, (uint64_t)nw::object::_description, 0);
    qword_1ECD85060 = v2;
  }
}

void __cxx_global_var_init_1_26815()
{
  unsigned __int8 v0;
  unsigned __int8 v1;
  uint64_t v2;

  {
    if ((v1 & 1) == 0)
    {
      {
        nw::object::_class(void)::instance = (uint64_t)"object";
        *(_QWORD *)algn_1ECD84F58 = 6;
        xmmword_1ECD84F60 = 0u;
        unk_1ECD84F70 = 0u;
        xmmword_1ECD84F80 = 0u;
        *(_OWORD *)&qword_1ECD84F90 = 0u;
        *(__int128 *)((char *)&xmmword_1ECD84F98 + 8) = 0u;
        *(_OWORD *)&qword_1ECD84FB0 = 0u;
        xmmword_1ECD84FC0 = 0u;
        unk_1ECD84FD0 = 0u;
        qword_1ECD84FE0 = (uint64_t)&qword_1ECD84FE0;
        unk_1ECD84FE8 = &qword_1ECD84FE0;
        qword_1ECD84FF0 = 0;
        dword_1ECD84FF8 = 0;
      }
    }
    nw::object::__redacted_description_def_instance = (uint64_t)nw::object::class_def::register_method_def(qword_1ECD85048, (uint64_t)nw::object::_redacted_description, 0);
    qword_1ECD85048 = v2;
  }
}

void __cxx_global_var_init_2_26816()
{
  unsigned __int8 v0;
  unsigned __int8 v1;
  uint64_t v2;

  {
    if ((v1 & 1) == 0)
    {
      {
        nw::object::_class(void)::instance = (uint64_t)"object";
        *(_QWORD *)algn_1ECD84F58 = 6;
        xmmword_1ECD84F60 = 0u;
        unk_1ECD84F70 = 0u;
        xmmword_1ECD84F80 = 0u;
        *(_OWORD *)&qword_1ECD84F90 = 0u;
        *(__int128 *)((char *)&xmmword_1ECD84F98 + 8) = 0u;
        *(_OWORD *)&qword_1ECD84FB0 = 0u;
        xmmword_1ECD84FC0 = 0u;
        unk_1ECD84FD0 = 0u;
        qword_1ECD84FE0 = (uint64_t)&qword_1ECD84FE0;
        unk_1ECD84FE8 = &qword_1ECD84FE0;
        qword_1ECD84FF0 = 0;
        dword_1ECD84FF8 = 0;
      }
    }
    nw::object::__destroy_def_instance = (uint64_t)nw::object::class_def::register_method_def(qword_1ECD85030, (uint64_t)nw::object::_destroy, 0);
    qword_1ECD85030 = v2;
  }
}

void __cxx_global_var_init_26956()
{
  unsigned __int8 v0;
  unsigned __int8 v1;
  uint64_t v2;

  {
    if ((v1 & 1) == 0)
    {
      {
        nw::object::_class(void)::instance = (uint64_t)"object";
        *(_QWORD *)algn_1ECD84F58 = 6;
        xmmword_1ECD84F60 = 0u;
        unk_1ECD84F70 = 0u;
        xmmword_1ECD84F80 = 0u;
        *(_OWORD *)&qword_1ECD84F90 = 0u;
        *(__int128 *)((char *)&xmmword_1ECD84F98 + 8) = 0u;
        *(_OWORD *)&qword_1ECD84FB0 = 0u;
        xmmword_1ECD84FC0 = 0u;
        unk_1ECD84FD0 = 0u;
        qword_1ECD84FE0 = (uint64_t)&qword_1ECD84FE0;
        unk_1ECD84FE8 = &qword_1ECD84FE0;
        qword_1ECD84FF0 = 0;
        dword_1ECD84FF8 = 0;
      }
    }
    nw::object::__description_def_instance = (uint64_t)nw::object::class_def::register_method_def(qword_1ECD85060, (uint64_t)nw::object::_description, 0);
    qword_1ECD85060 = v2;
  }
}

void __cxx_global_var_init_1_26957()
{
  unsigned __int8 v0;
  unsigned __int8 v1;
  uint64_t v2;

  {
    if ((v1 & 1) == 0)
    {
      {
        nw::object::_class(void)::instance = (uint64_t)"object";
        *(_QWORD *)algn_1ECD84F58 = 6;
        xmmword_1ECD84F60 = 0u;
        unk_1ECD84F70 = 0u;
        xmmword_1ECD84F80 = 0u;
        *(_OWORD *)&qword_1ECD84F90 = 0u;
        *(__int128 *)((char *)&xmmword_1ECD84F98 + 8) = 0u;
        *(_OWORD *)&qword_1ECD84FB0 = 0u;
        xmmword_1ECD84FC0 = 0u;
        unk_1ECD84FD0 = 0u;
        qword_1ECD84FE0 = (uint64_t)&qword_1ECD84FE0;
        unk_1ECD84FE8 = &qword_1ECD84FE0;
        qword_1ECD84FF0 = 0;
        dword_1ECD84FF8 = 0;
      }
    }
    nw::object::__redacted_description_def_instance = (uint64_t)nw::object::class_def::register_method_def(qword_1ECD85048, (uint64_t)nw::object::_redacted_description, 0);
    qword_1ECD85048 = v2;
  }
}

void __cxx_global_var_init_2_26958()
{
  unsigned __int8 v0;
  unsigned __int8 v1;
  uint64_t v2;

  {
    if ((v1 & 1) == 0)
    {
      {
        nw::object::_class(void)::instance = (uint64_t)"object";
        *(_QWORD *)algn_1ECD84F58 = 6;
        xmmword_1ECD84F60 = 0u;
        unk_1ECD84F70 = 0u;
        xmmword_1ECD84F80 = 0u;
        *(_OWORD *)&qword_1ECD84F90 = 0u;
        *(__int128 *)((char *)&xmmword_1ECD84F98 + 8) = 0u;
        *(_OWORD *)&qword_1ECD84FB0 = 0u;
        xmmword_1ECD84FC0 = 0u;
        unk_1ECD84FD0 = 0u;
        qword_1ECD84FE0 = (uint64_t)&qword_1ECD84FE0;
        unk_1ECD84FE8 = &qword_1ECD84FE0;
        qword_1ECD84FF0 = 0;
        dword_1ECD84FF8 = 0;
      }
    }
    nw::object::__destroy_def_instance = (uint64_t)nw::object::class_def::register_method_def(qword_1ECD85030, (uint64_t)nw::object::_destroy, 0);
    qword_1ECD85030 = v2;
  }
}

void __cxx_global_var_init_28098()
{
  unsigned __int8 v0;
  unsigned __int8 v1;
  uint64_t v2;

  {
    if ((v1 & 1) == 0)
    {
      {
        nw::object::_class(void)::instance = (uint64_t)"object";
        *(_QWORD *)algn_1ECD84F58 = 6;
        xmmword_1ECD84F60 = 0u;
        unk_1ECD84F70 = 0u;
        xmmword_1ECD84F80 = 0u;
        *(_OWORD *)&qword_1ECD84F90 = 0u;
        *(__int128 *)((char *)&xmmword_1ECD84F98 + 8) = 0u;
        *(_OWORD *)&qword_1ECD84FB0 = 0u;
        xmmword_1ECD84FC0 = 0u;
        unk_1ECD84FD0 = 0u;
        qword_1ECD84FE0 = (uint64_t)&qword_1ECD84FE0;
        unk_1ECD84FE8 = &qword_1ECD84FE0;
        qword_1ECD84FF0 = 0;
        dword_1ECD84FF8 = 0;
      }
    }
    nw::object::__description_def_instance = (uint64_t)nw::object::class_def::register_method_def(qword_1ECD85060, (uint64_t)nw::object::_description, 0);
    qword_1ECD85060 = v2;
  }
}

void __cxx_global_var_init_1_28099()
{
  unsigned __int8 v0;
  unsigned __int8 v1;
  uint64_t v2;

  {
    if ((v1 & 1) == 0)
    {
      {
        nw::object::_class(void)::instance = (uint64_t)"object";
        *(_QWORD *)algn_1ECD84F58 = 6;
        xmmword_1ECD84F60 = 0u;
        unk_1ECD84F70 = 0u;
        xmmword_1ECD84F80 = 0u;
        *(_OWORD *)&qword_1ECD84F90 = 0u;
        *(__int128 *)((char *)&xmmword_1ECD84F98 + 8) = 0u;
        *(_OWORD *)&qword_1ECD84FB0 = 0u;
        xmmword_1ECD84FC0 = 0u;
        unk_1ECD84FD0 = 0u;
        qword_1ECD84FE0 = (uint64_t)&qword_1ECD84FE0;
        unk_1ECD84FE8 = &qword_1ECD84FE0;
        qword_1ECD84FF0 = 0;
        dword_1ECD84FF8 = 0;
      }
    }
    nw::object::__redacted_description_def_instance = (uint64_t)nw::object::class_def::register_method_def(qword_1ECD85048, (uint64_t)nw::object::_redacted_description, 0);
    qword_1ECD85048 = v2;
  }
}

void __cxx_global_var_init_2_28100()
{
  unsigned __int8 v0;
  unsigned __int8 v1;
  uint64_t v2;

  {
    if ((v1 & 1) == 0)
    {
      {
        nw::object::_class(void)::instance = (uint64_t)"object";
        *(_QWORD *)algn_1ECD84F58 = 6;
        xmmword_1ECD84F60 = 0u;
        unk_1ECD84F70 = 0u;
        xmmword_1ECD84F80 = 0u;
        *(_OWORD *)&qword_1ECD84F90 = 0u;
        *(__int128 *)((char *)&xmmword_1ECD84F98 + 8) = 0u;
        *(_OWORD *)&qword_1ECD84FB0 = 0u;
        xmmword_1ECD84FC0 = 0u;
        unk_1ECD84FD0 = 0u;
        qword_1ECD84FE0 = (uint64_t)&qword_1ECD84FE0;
        unk_1ECD84FE8 = &qword_1ECD84FE0;
        qword_1ECD84FF0 = 0;
        dword_1ECD84FF8 = 0;
      }
    }
    nw::object::__destroy_def_instance = (uint64_t)nw::object::class_def::register_method_def(qword_1ECD85030, (uint64_t)nw::object::_destroy, 0);
    qword_1ECD85030 = v2;
  }
}

void __cxx_global_var_init_28360()
{
  unsigned __int8 v0;
  unsigned __int8 v1;
  uint64_t v2;

  {
    if ((v1 & 1) == 0)
    {
      {
        nw::object::_class(void)::instance = (uint64_t)"object";
        *(_QWORD *)algn_1ECD84F58 = 6;
        xmmword_1ECD84F60 = 0u;
        unk_1ECD84F70 = 0u;
        xmmword_1ECD84F80 = 0u;
        *(_OWORD *)&qword_1ECD84F90 = 0u;
        *(__int128 *)((char *)&xmmword_1ECD84F98 + 8) = 0u;
        *(_OWORD *)&qword_1ECD84FB0 = 0u;
        xmmword_1ECD84FC0 = 0u;
        unk_1ECD84FD0 = 0u;
        qword_1ECD84FE0 = (uint64_t)&qword_1ECD84FE0;
        unk_1ECD84FE8 = &qword_1ECD84FE0;
        qword_1ECD84FF0 = 0;
        dword_1ECD84FF8 = 0;
      }
    }
    nw::object::__description_def_instance = (uint64_t)nw::object::class_def::register_method_def(qword_1ECD85060, (uint64_t)nw::object::_description, 0);
    qword_1ECD85060 = v2;
  }
}

void __cxx_global_var_init_1_28361()
{
  unsigned __int8 v0;
  unsigned __int8 v1;
  uint64_t v2;

  {
    if ((v1 & 1) == 0)
    {
      {
        nw::object::_class(void)::instance = (uint64_t)"object";
        *(_QWORD *)algn_1ECD84F58 = 6;
        xmmword_1ECD84F60 = 0u;
        unk_1ECD84F70 = 0u;
        xmmword_1ECD84F80 = 0u;
        *(_OWORD *)&qword_1ECD84F90 = 0u;
        *(__int128 *)((char *)&xmmword_1ECD84F98 + 8) = 0u;
        *(_OWORD *)&qword_1ECD84FB0 = 0u;
        xmmword_1ECD84FC0 = 0u;
        unk_1ECD84FD0 = 0u;
        qword_1ECD84FE0 = (uint64_t)&qword_1ECD84FE0;
        unk_1ECD84FE8 = &qword_1ECD84FE0;
        qword_1ECD84FF0 = 0;
        dword_1ECD84FF8 = 0;
      }
    }
    nw::object::__redacted_description_def_instance = (uint64_t)nw::object::class_def::register_method_def(qword_1ECD85048, (uint64_t)nw::object::_redacted_description, 0);
    qword_1ECD85048 = v2;
  }
}

void __cxx_global_var_init_2_28362()
{
  unsigned __int8 v0;
  unsigned __int8 v1;
  uint64_t v2;

  {
    if ((v1 & 1) == 0)
    {
      {
        nw::object::_class(void)::instance = (uint64_t)"object";
        *(_QWORD *)algn_1ECD84F58 = 6;
        xmmword_1ECD84F60 = 0u;
        unk_1ECD84F70 = 0u;
        xmmword_1ECD84F80 = 0u;
        *(_OWORD *)&qword_1ECD84F90 = 0u;
        *(__int128 *)((char *)&xmmword_1ECD84F98 + 8) = 0u;
        *(_OWORD *)&qword_1ECD84FB0 = 0u;
        xmmword_1ECD84FC0 = 0u;
        unk_1ECD84FD0 = 0u;
        qword_1ECD84FE0 = (uint64_t)&qword_1ECD84FE0;
        unk_1ECD84FE8 = &qword_1ECD84FE0;
        qword_1ECD84FF0 = 0;
        dword_1ECD84FF8 = 0;
      }
    }
    nw::object::__destroy_def_instance = (uint64_t)nw::object::class_def::register_method_def(qword_1ECD85030, (uint64_t)nw::object::_destroy, 0);
    qword_1ECD85030 = v2;
  }
}

void __cxx_global_var_init_29232()
{
  unsigned __int8 v0;
  unsigned __int8 v1;
  uint64_t v2;

  {
    if ((v1 & 1) == 0)
    {
      {
        nw::object::_class(void)::instance = (uint64_t)"object";
        *(_QWORD *)algn_1ECD84F58 = 6;
        xmmword_1ECD84F60 = 0u;
        unk_1ECD84F70 = 0u;
        xmmword_1ECD84F80 = 0u;
        *(_OWORD *)&qword_1ECD84F90 = 0u;
        *(__int128 *)((char *)&xmmword_1ECD84F98 + 8) = 0u;
        *(_OWORD *)&qword_1ECD84FB0 = 0u;
        xmmword_1ECD84FC0 = 0u;
        unk_1ECD84FD0 = 0u;
        qword_1ECD84FE0 = (uint64_t)&qword_1ECD84FE0;
        unk_1ECD84FE8 = &qword_1ECD84FE0;
        qword_1ECD84FF0 = 0;
        dword_1ECD84FF8 = 0;
      }
    }
    nw::object::__description_def_instance = (uint64_t)nw::object::class_def::register_method_def(qword_1ECD85060, (uint64_t)nw::object::_description, 0);
    qword_1ECD85060 = v2;
  }
}

void __cxx_global_var_init_1_29233()
{
  unsigned __int8 v0;
  unsigned __int8 v1;
  uint64_t v2;

  {
    if ((v1 & 1) == 0)
    {
      {
        nw::object::_class(void)::instance = (uint64_t)"object";
        *(_QWORD *)algn_1ECD84F58 = 6;
        xmmword_1ECD84F60 = 0u;
        unk_1ECD84F70 = 0u;
        xmmword_1ECD84F80 = 0u;
        *(_OWORD *)&qword_1ECD84F90 = 0u;
        *(__int128 *)((char *)&xmmword_1ECD84F98 + 8) = 0u;
        *(_OWORD *)&qword_1ECD84FB0 = 0u;
        xmmword_1ECD84FC0 = 0u;
        unk_1ECD84FD0 = 0u;
        qword_1ECD84FE0 = (uint64_t)&qword_1ECD84FE0;
        unk_1ECD84FE8 = &qword_1ECD84FE0;
        qword_1ECD84FF0 = 0;
        dword_1ECD84FF8 = 0;
      }
    }
    nw::object::__redacted_description_def_instance = (uint64_t)nw::object::class_def::register_method_def(qword_1ECD85048, (uint64_t)nw::object::_redacted_description, 0);
    qword_1ECD85048 = v2;
  }
}

void __cxx_global_var_init_2_29234()
{
  unsigned __int8 v0;
  unsigned __int8 v1;
  uint64_t v2;

  {
    if ((v1 & 1) == 0)
    {
      {
        nw::object::_class(void)::instance = (uint64_t)"object";
        *(_QWORD *)algn_1ECD84F58 = 6;
        xmmword_1ECD84F60 = 0u;
        unk_1ECD84F70 = 0u;
        xmmword_1ECD84F80 = 0u;
        *(_OWORD *)&qword_1ECD84F90 = 0u;
        *(__int128 *)((char *)&xmmword_1ECD84F98 + 8) = 0u;
        *(_OWORD *)&qword_1ECD84FB0 = 0u;
        xmmword_1ECD84FC0 = 0u;
        unk_1ECD84FD0 = 0u;
        qword_1ECD84FE0 = (uint64_t)&qword_1ECD84FE0;
        unk_1ECD84FE8 = &qword_1ECD84FE0;
        qword_1ECD84FF0 = 0;
        dword_1ECD84FF8 = 0;
      }
    }
    nw::object::__destroy_def_instance = (uint64_t)nw::object::class_def::register_method_def(qword_1ECD85030, (uint64_t)nw::object::_destroy, 0);
    qword_1ECD85030 = v2;
  }
}

void __cxx_global_var_init_30187()
{
  unsigned __int8 v0;
  unsigned __int8 v1;
  uint64_t v2;

  {
    if ((v1 & 1) == 0)
    {
      {
        nw::object::_class(void)::instance = (uint64_t)"object";
        *(_QWORD *)algn_1ECD84F58 = 6;
        xmmword_1ECD84F60 = 0u;
        unk_1ECD84F70 = 0u;
        xmmword_1ECD84F80 = 0u;
        *(_OWORD *)&qword_1ECD84F90 = 0u;
        *(__int128 *)((char *)&xmmword_1ECD84F98 + 8) = 0u;
        *(_OWORD *)&qword_1ECD84FB0 = 0u;
        xmmword_1ECD84FC0 = 0u;
        unk_1ECD84FD0 = 0u;
        qword_1ECD84FE0 = (uint64_t)&qword_1ECD84FE0;
        unk_1ECD84FE8 = &qword_1ECD84FE0;
        qword_1ECD84FF0 = 0;
        dword_1ECD84FF8 = 0;
      }
    }
    nw::object::__description_def_instance = (uint64_t)nw::object::class_def::register_method_def(qword_1ECD85060, (uint64_t)nw::object::_description, 0);
    qword_1ECD85060 = v2;
  }
}

void __cxx_global_var_init_1_30188()
{
  unsigned __int8 v0;
  unsigned __int8 v1;
  uint64_t v2;

  {
    if ((v1 & 1) == 0)
    {
      {
        nw::object::_class(void)::instance = (uint64_t)"object";
        *(_QWORD *)algn_1ECD84F58 = 6;
        xmmword_1ECD84F60 = 0u;
        unk_1ECD84F70 = 0u;
        xmmword_1ECD84F80 = 0u;
        *(_OWORD *)&qword_1ECD84F90 = 0u;
        *(__int128 *)((char *)&xmmword_1ECD84F98 + 8) = 0u;
        *(_OWORD *)&qword_1ECD84FB0 = 0u;
        xmmword_1ECD84FC0 = 0u;
        unk_1ECD84FD0 = 0u;
        qword_1ECD84FE0 = (uint64_t)&qword_1ECD84FE0;
        unk_1ECD84FE8 = &qword_1ECD84FE0;
        qword_1ECD84FF0 = 0;
        dword_1ECD84FF8 = 0;
      }
    }
    nw::object::__redacted_description_def_instance = (uint64_t)nw::object::class_def::register_method_def(qword_1ECD85048, (uint64_t)nw::object::_redacted_description, 0);
    qword_1ECD85048 = v2;
  }
}

void __cxx_global_var_init_2_30189()
{
  unsigned __int8 v0;
  unsigned __int8 v1;
  uint64_t v2;

  {
    if ((v1 & 1) == 0)
    {
      {
        nw::object::_class(void)::instance = (uint64_t)"object";
        *(_QWORD *)algn_1ECD84F58 = 6;
        xmmword_1ECD84F60 = 0u;
        unk_1ECD84F70 = 0u;
        xmmword_1ECD84F80 = 0u;
        *(_OWORD *)&qword_1ECD84F90 = 0u;
        *(__int128 *)((char *)&xmmword_1ECD84F98 + 8) = 0u;
        *(_OWORD *)&qword_1ECD84FB0 = 0u;
        xmmword_1ECD84FC0 = 0u;
        unk_1ECD84FD0 = 0u;
        qword_1ECD84FE0 = (uint64_t)&qword_1ECD84FE0;
        unk_1ECD84FE8 = &qword_1ECD84FE0;
        qword_1ECD84FF0 = 0;
        dword_1ECD84FF8 = 0;
      }
    }
    nw::object::__destroy_def_instance = (uint64_t)nw::object::class_def::register_method_def(qword_1ECD85030, (uint64_t)nw::object::_destroy, 0);
    qword_1ECD85030 = v2;
  }
}

void __cxx_global_var_init_30526()
{
  unsigned __int8 v0;
  unsigned __int8 v1;
  uint64_t v2;

  {
    if ((v1 & 1) == 0)
    {
      {
        nw::object::_class(void)::instance = (uint64_t)"object";
        *(_QWORD *)algn_1ECD84F58 = 6;
        xmmword_1ECD84F60 = 0u;
        unk_1ECD84F70 = 0u;
        xmmword_1ECD84F80 = 0u;
        *(_OWORD *)&qword_1ECD84F90 = 0u;
        *(__int128 *)((char *)&xmmword_1ECD84F98 + 8) = 0u;
        *(_OWORD *)&qword_1ECD84FB0 = 0u;
        xmmword_1ECD84FC0 = 0u;
        unk_1ECD84FD0 = 0u;
        qword_1ECD84FE0 = (uint64_t)&qword_1ECD84FE0;
        unk_1ECD84FE8 = &qword_1ECD84FE0;
        qword_1ECD84FF0 = 0;
        dword_1ECD84FF8 = 0;
      }
    }
    nw::object::__description_def_instance = (uint64_t)nw::object::class_def::register_method_def(qword_1ECD85060, (uint64_t)nw::object::_description, 0);
    qword_1ECD85060 = v2;
  }
}

void __cxx_global_var_init_1_30527()
{
  unsigned __int8 v0;
  unsigned __int8 v1;
  uint64_t v2;

  {
    if ((v1 & 1) == 0)
    {
      {
        nw::object::_class(void)::instance = (uint64_t)"object";
        *(_QWORD *)algn_1ECD84F58 = 6;
        xmmword_1ECD84F60 = 0u;
        unk_1ECD84F70 = 0u;
        xmmword_1ECD84F80 = 0u;
        *(_OWORD *)&qword_1ECD84F90 = 0u;
        *(__int128 *)((char *)&xmmword_1ECD84F98 + 8) = 0u;
        *(_OWORD *)&qword_1ECD84FB0 = 0u;
        xmmword_1ECD84FC0 = 0u;
        unk_1ECD84FD0 = 0u;
        qword_1ECD84FE0 = (uint64_t)&qword_1ECD84FE0;
        unk_1ECD84FE8 = &qword_1ECD84FE0;
        qword_1ECD84FF0 = 0;
        dword_1ECD84FF8 = 0;
      }
    }
    nw::object::__redacted_description_def_instance = (uint64_t)nw::object::class_def::register_method_def(qword_1ECD85048, (uint64_t)nw::object::_redacted_description, 0);
    qword_1ECD85048 = v2;
  }
}

void __cxx_global_var_init_2_30528()
{
  unsigned __int8 v0;
  unsigned __int8 v1;
  uint64_t v2;

  {
    if ((v1 & 1) == 0)
    {
      {
        nw::object::_class(void)::instance = (uint64_t)"object";
        *(_QWORD *)algn_1ECD84F58 = 6;
        xmmword_1ECD84F60 = 0u;
        unk_1ECD84F70 = 0u;
        xmmword_1ECD84F80 = 0u;
        *(_OWORD *)&qword_1ECD84F90 = 0u;
        *(__int128 *)((char *)&xmmword_1ECD84F98 + 8) = 0u;
        *(_OWORD *)&qword_1ECD84FB0 = 0u;
        xmmword_1ECD84FC0 = 0u;
        unk_1ECD84FD0 = 0u;
        qword_1ECD84FE0 = (uint64_t)&qword_1ECD84FE0;
        unk_1ECD84FE8 = &qword_1ECD84FE0;
        qword_1ECD84FF0 = 0;
        dword_1ECD84FF8 = 0;
      }
    }
    nw::object::__destroy_def_instance = (uint64_t)nw::object::class_def::register_method_def(qword_1ECD85030, (uint64_t)nw::object::_destroy, 0);
    qword_1ECD85030 = v2;
  }
}

void __cxx_global_var_init_31367()
{
  unsigned __int8 v0;
  unsigned __int8 v1;
  uint64_t v2;

  {
    if ((v1 & 1) == 0)
    {
      {
        nw::object::_class(void)::instance = (uint64_t)"object";
        *(_QWORD *)algn_1ECD84F58 = 6;
        xmmword_1ECD84F60 = 0u;
        unk_1ECD84F70 = 0u;
        xmmword_1ECD84F80 = 0u;
        *(_OWORD *)&qword_1ECD84F90 = 0u;
        *(__int128 *)((char *)&xmmword_1ECD84F98 + 8) = 0u;
        *(_OWORD *)&qword_1ECD84FB0 = 0u;
        xmmword_1ECD84FC0 = 0u;
        unk_1ECD84FD0 = 0u;
        qword_1ECD84FE0 = (uint64_t)&qword_1ECD84FE0;
        unk_1ECD84FE8 = &qword_1ECD84FE0;
        qword_1ECD84FF0 = 0;
        dword_1ECD84FF8 = 0;
      }
    }
    nw::object::__description_def_instance = (uint64_t)nw::object::class_def::register_method_def(qword_1ECD85060, (uint64_t)nw::object::_description, 0);
    qword_1ECD85060 = v2;
  }
}

void __cxx_global_var_init_1_31368()
{
  unsigned __int8 v0;
  unsigned __int8 v1;
  uint64_t v2;

  {
    if ((v1 & 1) == 0)
    {
      {
        nw::object::_class(void)::instance = (uint64_t)"object";
        *(_QWORD *)algn_1ECD84F58 = 6;
        xmmword_1ECD84F60 = 0u;
        unk_1ECD84F70 = 0u;
        xmmword_1ECD84F80 = 0u;
        *(_OWORD *)&qword_1ECD84F90 = 0u;
        *(__int128 *)((char *)&xmmword_1ECD84F98 + 8) = 0u;
        *(_OWORD *)&qword_1ECD84FB0 = 0u;
        xmmword_1ECD84FC0 = 0u;
        unk_1ECD84FD0 = 0u;
        qword_1ECD84FE0 = (uint64_t)&qword_1ECD84FE0;
        unk_1ECD84FE8 = &qword_1ECD84FE0;
        qword_1ECD84FF0 = 0;
        dword_1ECD84FF8 = 0;
      }
    }
    nw::object::__redacted_description_def_instance = (uint64_t)nw::object::class_def::register_method_def(qword_1ECD85048, (uint64_t)nw::object::_redacted_description, 0);
    qword_1ECD85048 = v2;
  }
}

void __cxx_global_var_init_2_31369()
{
  unsigned __int8 v0;
  unsigned __int8 v1;
  uint64_t v2;

  {
    if ((v1 & 1) == 0)
    {
      {
        nw::object::_class(void)::instance = (uint64_t)"object";
        *(_QWORD *)algn_1ECD84F58 = 6;
        xmmword_1ECD84F60 = 0u;
        unk_1ECD84F70 = 0u;
        xmmword_1ECD84F80 = 0u;
        *(_OWORD *)&qword_1ECD84F90 = 0u;
        *(__int128 *)((char *)&xmmword_1ECD84F98 + 8) = 0u;
        *(_OWORD *)&qword_1ECD84FB0 = 0u;
        xmmword_1ECD84FC0 = 0u;
        unk_1ECD84FD0 = 0u;
        qword_1ECD84FE0 = (uint64_t)&qword_1ECD84FE0;
        unk_1ECD84FE8 = &qword_1ECD84FE0;
        qword_1ECD84FF0 = 0;
        dword_1ECD84FF8 = 0;
      }
    }
    nw::object::__destroy_def_instance = (uint64_t)nw::object::class_def::register_method_def(qword_1ECD85030, (uint64_t)nw::object::_destroy, 0);
    qword_1ECD85030 = v2;
  }
}

void __cxx_global_var_init_31560()
{
  unsigned __int8 v0;
  unsigned __int8 v1;
  uint64_t v2;

  {
    if ((v1 & 1) == 0)
    {
      {
        nw::object::_class(void)::instance = (uint64_t)"object";
        *(_QWORD *)algn_1ECD84F58 = 6;
        xmmword_1ECD84F60 = 0u;
        unk_1ECD84F70 = 0u;
        xmmword_1ECD84F80 = 0u;
        *(_OWORD *)&qword_1ECD84F90 = 0u;
        *(__int128 *)((char *)&xmmword_1ECD84F98 + 8) = 0u;
        *(_OWORD *)&qword_1ECD84FB0 = 0u;
        xmmword_1ECD84FC0 = 0u;
        unk_1ECD84FD0 = 0u;
        qword_1ECD84FE0 = (uint64_t)&qword_1ECD84FE0;
        unk_1ECD84FE8 = &qword_1ECD84FE0;
        qword_1ECD84FF0 = 0;
        dword_1ECD84FF8 = 0;
      }
    }
    nw::object::__description_def_instance = (uint64_t)nw::object::class_def::register_method_def(qword_1ECD85060, (uint64_t)nw::object::_description, 0);
    qword_1ECD85060 = v2;
  }
}

void __cxx_global_var_init_1_31561()
{
  unsigned __int8 v0;
  unsigned __int8 v1;
  uint64_t v2;

  {
    if ((v1 & 1) == 0)
    {
      {
        nw::object::_class(void)::instance = (uint64_t)"object";
        *(_QWORD *)algn_1ECD84F58 = 6;
        xmmword_1ECD84F60 = 0u;
        unk_1ECD84F70 = 0u;
        xmmword_1ECD84F80 = 0u;
        *(_OWORD *)&qword_1ECD84F90 = 0u;
        *(__int128 *)((char *)&xmmword_1ECD84F98 + 8) = 0u;
        *(_OWORD *)&qword_1ECD84FB0 = 0u;
        xmmword_1ECD84FC0 = 0u;
        unk_1ECD84FD0 = 0u;
        qword_1ECD84FE0 = (uint64_t)&qword_1ECD84FE0;
        unk_1ECD84FE8 = &qword_1ECD84FE0;
        qword_1ECD84FF0 = 0;
        dword_1ECD84FF8 = 0;
      }
    }
    nw::object::__redacted_description_def_instance = (uint64_t)nw::object::class_def::register_method_def(qword_1ECD85048, (uint64_t)nw::object::_redacted_description, 0);
    qword_1ECD85048 = v2;
  }
}

void __cxx_global_var_init_2_31562()
{
  unsigned __int8 v0;
  unsigned __int8 v1;
  uint64_t v2;

  {
    if ((v1 & 1) == 0)
    {
      {
        nw::object::_class(void)::instance = (uint64_t)"object";
        *(_QWORD *)algn_1ECD84F58 = 6;
        xmmword_1ECD84F60 = 0u;
        unk_1ECD84F70 = 0u;
        xmmword_1ECD84F80 = 0u;
        *(_OWORD *)&qword_1ECD84F90 = 0u;
        *(__int128 *)((char *)&xmmword_1ECD84F98 + 8) = 0u;
        *(_OWORD *)&qword_1ECD84FB0 = 0u;
        xmmword_1ECD84FC0 = 0u;
        unk_1ECD84FD0 = 0u;
        qword_1ECD84FE0 = (uint64_t)&qword_1ECD84FE0;
        unk_1ECD84FE8 = &qword_1ECD84FE0;
        qword_1ECD84FF0 = 0;
        dword_1ECD84FF8 = 0;
      }
    }
    nw::object::__destroy_def_instance = (uint64_t)nw::object::class_def::register_method_def(qword_1ECD85030, (uint64_t)nw::object::_destroy, 0);
    qword_1ECD85030 = v2;
  }
}

void __cxx_global_var_init_32717()
{
  unsigned __int8 v0;
  unsigned __int8 v1;
  uint64_t v2;

  {
    if ((v1 & 1) == 0)
    {
      {
        nw::object::_class(void)::instance = (uint64_t)"object";
        *(_QWORD *)algn_1ECD84F58 = 6;
        xmmword_1ECD84F60 = 0u;
        unk_1ECD84F70 = 0u;
        xmmword_1ECD84F80 = 0u;
        *(_OWORD *)&qword_1ECD84F90 = 0u;
        *(__int128 *)((char *)&xmmword_1ECD84F98 + 8) = 0u;
        *(_OWORD *)&qword_1ECD84FB0 = 0u;
        xmmword_1ECD84FC0 = 0u;
        unk_1ECD84FD0 = 0u;
        qword_1ECD84FE0 = (uint64_t)&qword_1ECD84FE0;
        unk_1ECD84FE8 = &qword_1ECD84FE0;
        qword_1ECD84FF0 = 0;
        dword_1ECD84FF8 = 0;
      }
    }
    nw::object::__description_def_instance = (uint64_t)nw::object::class_def::register_method_def(qword_1ECD85060, (uint64_t)nw::object::_description, 0);
    qword_1ECD85060 = v2;
  }
}

void __cxx_global_var_init_1_32718()
{
  unsigned __int8 v0;
  unsigned __int8 v1;
  uint64_t v2;

  {
    if ((v1 & 1) == 0)
    {
      {
        nw::object::_class(void)::instance = (uint64_t)"object";
        *(_QWORD *)algn_1ECD84F58 = 6;
        xmmword_1ECD84F60 = 0u;
        unk_1ECD84F70 = 0u;
        xmmword_1ECD84F80 = 0u;
        *(_OWORD *)&qword_1ECD84F90 = 0u;
        *(__int128 *)((char *)&xmmword_1ECD84F98 + 8) = 0u;
        *(_OWORD *)&qword_1ECD84FB0 = 0u;
        xmmword_1ECD84FC0 = 0u;
        unk_1ECD84FD0 = 0u;
        qword_1ECD84FE0 = (uint64_t)&qword_1ECD84FE0;
        unk_1ECD84FE8 = &qword_1ECD84FE0;
        qword_1ECD84FF0 = 0;
        dword_1ECD84FF8 = 0;
      }
    }
    nw::object::__redacted_description_def_instance = (uint64_t)nw::object::class_def::register_method_def(qword_1ECD85048, (uint64_t)nw::object::_redacted_description, 0);
    qword_1ECD85048 = v2;
  }
}

void __cxx_global_var_init_2_32719()
{
  unsigned __int8 v0;
  unsigned __int8 v1;
  uint64_t v2;

  {
    if ((v1 & 1) == 0)
    {
      {
        nw::object::_class(void)::instance = (uint64_t)"object";
        *(_QWORD *)algn_1ECD84F58 = 6;
        xmmword_1ECD84F60 = 0u;
        unk_1ECD84F70 = 0u;
        xmmword_1ECD84F80 = 0u;
        *(_OWORD *)&qword_1ECD84F90 = 0u;
        *(__int128 *)((char *)&xmmword_1ECD84F98 + 8) = 0u;
        *(_OWORD *)&qword_1ECD84FB0 = 0u;
        xmmword_1ECD84FC0 = 0u;
        unk_1ECD84FD0 = 0u;
        qword_1ECD84FE0 = (uint64_t)&qword_1ECD84FE0;
        unk_1ECD84FE8 = &qword_1ECD84FE0;
        qword_1ECD84FF0 = 0;
        dword_1ECD84FF8 = 0;
      }
    }
    nw::object::__destroy_def_instance = (uint64_t)nw::object::class_def::register_method_def(qword_1ECD85030, (uint64_t)nw::object::_destroy, 0);
    qword_1ECD85030 = v2;
  }
}

void __cxx_global_var_init_33001()
{
  unsigned __int8 v0;
  unsigned __int8 v1;
  uint64_t v2;

  {
    if ((v1 & 1) == 0)
    {
      {
        nw::object::_class(void)::instance = (uint64_t)"object";
        *(_QWORD *)algn_1ECD84F58 = 6;
        xmmword_1ECD84F60 = 0u;
        unk_1ECD84F70 = 0u;
        xmmword_1ECD84F80 = 0u;
        *(_OWORD *)&qword_1ECD84F90 = 0u;
        *(__int128 *)((char *)&xmmword_1ECD84F98 + 8) = 0u;
        *(_OWORD *)&qword_1ECD84FB0 = 0u;
        xmmword_1ECD84FC0 = 0u;
        unk_1ECD84FD0 = 0u;
        qword_1ECD84FE0 = (uint64_t)&qword_1ECD84FE0;
        unk_1ECD84FE8 = &qword_1ECD84FE0;
        qword_1ECD84FF0 = 0;
        dword_1ECD84FF8 = 0;
      }
    }
    nw::object::__description_def_instance = (uint64_t)nw::object::class_def::register_method_def(qword_1ECD85060, (uint64_t)nw::object::_description, 0);
    qword_1ECD85060 = v2;
  }
}

void __cxx_global_var_init_1_33002()
{
  unsigned __int8 v0;
  unsigned __int8 v1;
  uint64_t v2;

  {
    if ((v1 & 1) == 0)
    {
      {
        nw::object::_class(void)::instance = (uint64_t)"object";
        *(_QWORD *)algn_1ECD84F58 = 6;
        xmmword_1ECD84F60 = 0u;
        unk_1ECD84F70 = 0u;
        xmmword_1ECD84F80 = 0u;
        *(_OWORD *)&qword_1ECD84F90 = 0u;
        *(__int128 *)((char *)&xmmword_1ECD84F98 + 8) = 0u;
        *(_OWORD *)&qword_1ECD84FB0 = 0u;
        xmmword_1ECD84FC0 = 0u;
        unk_1ECD84FD0 = 0u;
        qword_1ECD84FE0 = (uint64_t)&qword_1ECD84FE0;
        unk_1ECD84FE8 = &qword_1ECD84FE0;
        qword_1ECD84FF0 = 0;
        dword_1ECD84FF8 = 0;
      }
    }
    nw::object::__redacted_description_def_instance = (uint64_t)nw::object::class_def::register_method_def(qword_1ECD85048, (uint64_t)nw::object::_redacted_description, 0);
    qword_1ECD85048 = v2;
  }
}

void __cxx_global_var_init_2_33003()
{
  unsigned __int8 v0;
  unsigned __int8 v1;
  uint64_t v2;

  {
    if ((v1 & 1) == 0)
    {
      {
        nw::object::_class(void)::instance = (uint64_t)"object";
        *(_QWORD *)algn_1ECD84F58 = 6;
        xmmword_1ECD84F60 = 0u;
        unk_1ECD84F70 = 0u;
        xmmword_1ECD84F80 = 0u;
        *(_OWORD *)&qword_1ECD84F90 = 0u;
        *(__int128 *)((char *)&xmmword_1ECD84F98 + 8) = 0u;
        *(_OWORD *)&qword_1ECD84FB0 = 0u;
        xmmword_1ECD84FC0 = 0u;
        unk_1ECD84FD0 = 0u;
        qword_1ECD84FE0 = (uint64_t)&qword_1ECD84FE0;
        unk_1ECD84FE8 = &qword_1ECD84FE0;
        qword_1ECD84FF0 = 0;
        dword_1ECD84FF8 = 0;
      }
    }
    nw::object::__destroy_def_instance = (uint64_t)nw::object::class_def::register_method_def(qword_1ECD85030, (uint64_t)nw::object::_destroy, 0);
    qword_1ECD85030 = v2;
  }
}

void __cxx_global_var_init_33250()
{
  unsigned __int8 v0;
  unsigned __int8 v1;
  uint64_t v2;

  {
    if ((v1 & 1) == 0)
    {
      {
        nw::object::_class(void)::instance = (uint64_t)"object";
        *(_QWORD *)algn_1ECD84F58 = 6;
        xmmword_1ECD84F60 = 0u;
        unk_1ECD84F70 = 0u;
        xmmword_1ECD84F80 = 0u;
        *(_OWORD *)&qword_1ECD84F90 = 0u;
        *(__int128 *)((char *)&xmmword_1ECD84F98 + 8) = 0u;
        *(_OWORD *)&qword_1ECD84FB0 = 0u;
        xmmword_1ECD84FC0 = 0u;
        unk_1ECD84FD0 = 0u;
        qword_1ECD84FE0 = (uint64_t)&qword_1ECD84FE0;
        unk_1ECD84FE8 = &qword_1ECD84FE0;
        qword_1ECD84FF0 = 0;
        dword_1ECD84FF8 = 0;
      }
    }
    nw::object::__description_def_instance = (uint64_t)nw::object::class_def::register_method_def(qword_1ECD85060, (uint64_t)nw::object::_description, 0);
    qword_1ECD85060 = v2;
  }
}

void __cxx_global_var_init_1_33251()
{
  unsigned __int8 v0;
  unsigned __int8 v1;
  uint64_t v2;

  {
    if ((v1 & 1) == 0)
    {
      {
        nw::object::_class(void)::instance = (uint64_t)"object";
        *(_QWORD *)algn_1ECD84F58 = 6;
        xmmword_1ECD84F60 = 0u;
        unk_1ECD84F70 = 0u;
        xmmword_1ECD84F80 = 0u;
        *(_OWORD *)&qword_1ECD84F90 = 0u;
        *(__int128 *)((char *)&xmmword_1ECD84F98 + 8) = 0u;
        *(_OWORD *)&qword_1ECD84FB0 = 0u;
        xmmword_1ECD84FC0 = 0u;
        unk_1ECD84FD0 = 0u;
        qword_1ECD84FE0 = (uint64_t)&qword_1ECD84FE0;
        unk_1ECD84FE8 = &qword_1ECD84FE0;
        qword_1ECD84FF0 = 0;
        dword_1ECD84FF8 = 0;
      }
    }
    nw::object::__redacted_description_def_instance = (uint64_t)nw::object::class_def::register_method_def(qword_1ECD85048, (uint64_t)nw::object::_redacted_description, 0);
    qword_1ECD85048 = v2;
  }
}

void __cxx_global_var_init_2_33252()
{
  unsigned __int8 v0;
  unsigned __int8 v1;
  uint64_t v2;

  {
    if ((v1 & 1) == 0)
    {
      {
        nw::object::_class(void)::instance = (uint64_t)"object";
        *(_QWORD *)algn_1ECD84F58 = 6;
        xmmword_1ECD84F60 = 0u;
        unk_1ECD84F70 = 0u;
        xmmword_1ECD84F80 = 0u;
        *(_OWORD *)&qword_1ECD84F90 = 0u;
        *(__int128 *)((char *)&xmmword_1ECD84F98 + 8) = 0u;
        *(_OWORD *)&qword_1ECD84FB0 = 0u;
        xmmword_1ECD84FC0 = 0u;
        unk_1ECD84FD0 = 0u;
        qword_1ECD84FE0 = (uint64_t)&qword_1ECD84FE0;
        unk_1ECD84FE8 = &qword_1ECD84FE0;
        qword_1ECD84FF0 = 0;
        dword_1ECD84FF8 = 0;
      }
    }
    nw::object::__destroy_def_instance = (uint64_t)nw::object::class_def::register_method_def(qword_1ECD85030, (uint64_t)nw::object::_destroy, 0);
    qword_1ECD85030 = v2;
  }
}

void __cxx_global_var_init_33393()
{
  unsigned __int8 v0;
  unsigned __int8 v1;
  uint64_t v2;

  {
    if ((v1 & 1) == 0)
    {
      {
        nw::object::_class(void)::instance = (uint64_t)"object";
        *(_QWORD *)algn_1ECD84F58 = 6;
        xmmword_1ECD84F60 = 0u;
        unk_1ECD84F70 = 0u;
        xmmword_1ECD84F80 = 0u;
        *(_OWORD *)&qword_1ECD84F90 = 0u;
        *(__int128 *)((char *)&xmmword_1ECD84F98 + 8) = 0u;
        *(_OWORD *)&qword_1ECD84FB0 = 0u;
        xmmword_1ECD84FC0 = 0u;
        unk_1ECD84FD0 = 0u;
        qword_1ECD84FE0 = (uint64_t)&qword_1ECD84FE0;
        unk_1ECD84FE8 = &qword_1ECD84FE0;
        qword_1ECD84FF0 = 0;
        dword_1ECD84FF8 = 0;
      }
    }
    nw::object::__description_def_instance = (uint64_t)nw::object::class_def::register_method_def(qword_1ECD85060, (uint64_t)nw::object::_description, 0);
    qword_1ECD85060 = v2;
  }
}

void __cxx_global_var_init_1_33394()
{
  unsigned __int8 v0;
  unsigned __int8 v1;
  uint64_t v2;

  {
    if ((v1 & 1) == 0)
    {
      {
        nw::object::_class(void)::instance = (uint64_t)"object";
        *(_QWORD *)algn_1ECD84F58 = 6;
        xmmword_1ECD84F60 = 0u;
        unk_1ECD84F70 = 0u;
        xmmword_1ECD84F80 = 0u;
        *(_OWORD *)&qword_1ECD84F90 = 0u;
        *(__int128 *)((char *)&xmmword_1ECD84F98 + 8) = 0u;
        *(_OWORD *)&qword_1ECD84FB0 = 0u;
        xmmword_1ECD84FC0 = 0u;
        unk_1ECD84FD0 = 0u;
        qword_1ECD84FE0 = (uint64_t)&qword_1ECD84FE0;
        unk_1ECD84FE8 = &qword_1ECD84FE0;
        qword_1ECD84FF0 = 0;
        dword_1ECD84FF8 = 0;
      }
    }
    nw::object::__redacted_description_def_instance = (uint64_t)nw::object::class_def::register_method_def(qword_1ECD85048, (uint64_t)nw::object::_redacted_description, 0);
    qword_1ECD85048 = v2;
  }
}

void __cxx_global_var_init_2_33395()
{
  unsigned __int8 v0;
  unsigned __int8 v1;
  uint64_t v2;

  {
    if ((v1 & 1) == 0)
    {
      {
        nw::object::_class(void)::instance = (uint64_t)"object";
        *(_QWORD *)algn_1ECD84F58 = 6;
        xmmword_1ECD84F60 = 0u;
        unk_1ECD84F70 = 0u;
        xmmword_1ECD84F80 = 0u;
        *(_OWORD *)&qword_1ECD84F90 = 0u;
        *(__int128 *)((char *)&xmmword_1ECD84F98 + 8) = 0u;
        *(_OWORD *)&qword_1ECD84FB0 = 0u;
        xmmword_1ECD84FC0 = 0u;
        unk_1ECD84FD0 = 0u;
        qword_1ECD84FE0 = (uint64_t)&qword_1ECD84FE0;
        unk_1ECD84FE8 = &qword_1ECD84FE0;
        qword_1ECD84FF0 = 0;
        dword_1ECD84FF8 = 0;
      }
    }
    nw::object::__destroy_def_instance = (uint64_t)nw::object::class_def::register_method_def(qword_1ECD85030, (uint64_t)nw::object::_destroy, 0);
    qword_1ECD85030 = v2;
  }
}

void __cxx_global_var_init_34865()
{
  unsigned __int8 v0;
  unsigned __int8 v1;
  uint64_t v2;

  {
    if ((v1 & 1) == 0)
    {
      {
        nw::object::_class(void)::instance = (uint64_t)"object";
        *(_QWORD *)algn_1ECD84F58 = 6;
        xmmword_1ECD84F60 = 0u;
        unk_1ECD84F70 = 0u;
        xmmword_1ECD84F80 = 0u;
        *(_OWORD *)&qword_1ECD84F90 = 0u;
        *(__int128 *)((char *)&xmmword_1ECD84F98 + 8) = 0u;
        *(_OWORD *)&qword_1ECD84FB0 = 0u;
        xmmword_1ECD84FC0 = 0u;
        unk_1ECD84FD0 = 0u;
        qword_1ECD84FE0 = (uint64_t)&qword_1ECD84FE0;
        unk_1ECD84FE8 = &qword_1ECD84FE0;
        qword_1ECD84FF0 = 0;
        dword_1ECD84FF8 = 0;
      }
    }
    nw::object::__description_def_instance = (uint64_t)nw::object::class_def::register_method_def(qword_1ECD85060, (uint64_t)nw::object::_description, 0);
    qword_1ECD85060 = v2;
  }
}

void __cxx_global_var_init_1_34866()
{
  unsigned __int8 v0;
  unsigned __int8 v1;
  uint64_t v2;

  {
    if ((v1 & 1) == 0)
    {
      {
        nw::object::_class(void)::instance = (uint64_t)"object";
        *(_QWORD *)algn_1ECD84F58 = 6;
        xmmword_1ECD84F60 = 0u;
        unk_1ECD84F70 = 0u;
        xmmword_1ECD84F80 = 0u;
        *(_OWORD *)&qword_1ECD84F90 = 0u;
        *(__int128 *)((char *)&xmmword_1ECD84F98 + 8) = 0u;
        *(_OWORD *)&qword_1ECD84FB0 = 0u;
        xmmword_1ECD84FC0 = 0u;
        unk_1ECD84FD0 = 0u;
        qword_1ECD84FE0 = (uint64_t)&qword_1ECD84FE0;
        unk_1ECD84FE8 = &qword_1ECD84FE0;
        qword_1ECD84FF0 = 0;
        dword_1ECD84FF8 = 0;
      }
    }
    nw::object::__redacted_description_def_instance = (uint64_t)nw::object::class_def::register_method_def(qword_1ECD85048, (uint64_t)nw::object::_redacted_description, 0);
    qword_1ECD85048 = v2;
  }
}

void __cxx_global_var_init_2_34867()
{
  unsigned __int8 v0;
  unsigned __int8 v1;
  uint64_t v2;

  {
    if ((v1 & 1) == 0)
    {
      {
        nw::object::_class(void)::instance = (uint64_t)"object";
        *(_QWORD *)algn_1ECD84F58 = 6;
        xmmword_1ECD84F60 = 0u;
        unk_1ECD84F70 = 0u;
        xmmword_1ECD84F80 = 0u;
        *(_OWORD *)&qword_1ECD84F90 = 0u;
        *(__int128 *)((char *)&xmmword_1ECD84F98 + 8) = 0u;
        *(_OWORD *)&qword_1ECD84FB0 = 0u;
        xmmword_1ECD84FC0 = 0u;
        unk_1ECD84FD0 = 0u;
        qword_1ECD84FE0 = (uint64_t)&qword_1ECD84FE0;
        unk_1ECD84FE8 = &qword_1ECD84FE0;
        qword_1ECD84FF0 = 0;
        dword_1ECD84FF8 = 0;
      }
    }
    nw::object::__destroy_def_instance = (uint64_t)nw::object::class_def::register_method_def(qword_1ECD85030, (uint64_t)nw::object::_destroy, 0);
    qword_1ECD85030 = v2;
  }
}

void __cxx_global_var_init_35284()
{
  unsigned __int8 v0;
  unsigned __int8 v1;
  uint64_t v2;

  {
    if ((v1 & 1) == 0)
    {
      {
        nw::object::_class(void)::instance = (uint64_t)"object";
        *(_QWORD *)algn_1ECD84F58 = 6;
        xmmword_1ECD84F60 = 0u;
        unk_1ECD84F70 = 0u;
        xmmword_1ECD84F80 = 0u;
        *(_OWORD *)&qword_1ECD84F90 = 0u;
        *(__int128 *)((char *)&xmmword_1ECD84F98 + 8) = 0u;
        *(_OWORD *)&qword_1ECD84FB0 = 0u;
        xmmword_1ECD84FC0 = 0u;
        unk_1ECD84FD0 = 0u;
        qword_1ECD84FE0 = (uint64_t)&qword_1ECD84FE0;
        unk_1ECD84FE8 = &qword_1ECD84FE0;
        qword_1ECD84FF0 = 0;
        dword_1ECD84FF8 = 0;
      }
    }
    nw::object::__description_def_instance = (uint64_t)nw::object::class_def::register_method_def(qword_1ECD85060, (uint64_t)nw::object::_description, 0);
    qword_1ECD85060 = v2;
  }
}

void __cxx_global_var_init_1_35285()
{
  unsigned __int8 v0;
  unsigned __int8 v1;
  uint64_t v2;

  {
    if ((v1 & 1) == 0)
    {
      {
        nw::object::_class(void)::instance = (uint64_t)"object";
        *(_QWORD *)algn_1ECD84F58 = 6;
        xmmword_1ECD84F60 = 0u;
        unk_1ECD84F70 = 0u;
        xmmword_1ECD84F80 = 0u;
        *(_OWORD *)&qword_1ECD84F90 = 0u;
        *(__int128 *)((char *)&xmmword_1ECD84F98 + 8) = 0u;
        *(_OWORD *)&qword_1ECD84FB0 = 0u;
        xmmword_1ECD84FC0 = 0u;
        unk_1ECD84FD0 = 0u;
        qword_1ECD84FE0 = (uint64_t)&qword_1ECD84FE0;
        unk_1ECD84FE8 = &qword_1ECD84FE0;
        qword_1ECD84FF0 = 0;
        dword_1ECD84FF8 = 0;
      }
    }
    nw::object::__redacted_description_def_instance = (uint64_t)nw::object::class_def::register_method_def(qword_1ECD85048, (uint64_t)nw::object::_redacted_description, 0);
    qword_1ECD85048 = v2;
  }
}

void __cxx_global_var_init_2_35286()
{
  unsigned __int8 v0;
  unsigned __int8 v1;
  uint64_t v2;

  {
    if ((v1 & 1) == 0)
    {
      {
        nw::object::_class(void)::instance = (uint64_t)"object";
        *(_QWORD *)algn_1ECD84F58 = 6;
        xmmword_1ECD84F60 = 0u;
        unk_1ECD84F70 = 0u;
        xmmword_1ECD84F80 = 0u;
        *(_OWORD *)&qword_1ECD84F90 = 0u;
        *(__int128 *)((char *)&xmmword_1ECD84F98 + 8) = 0u;
        *(_OWORD *)&qword_1ECD84FB0 = 0u;
        xmmword_1ECD84FC0 = 0u;
        unk_1ECD84FD0 = 0u;
        qword_1ECD84FE0 = (uint64_t)&qword_1ECD84FE0;
        unk_1ECD84FE8 = &qword_1ECD84FE0;
        qword_1ECD84FF0 = 0;
        dword_1ECD84FF8 = 0;
      }
    }
    nw::object::__destroy_def_instance = (uint64_t)nw::object::class_def::register_method_def(qword_1ECD85030, (uint64_t)nw::object::_destroy, 0);
    qword_1ECD85030 = v2;
  }
}

void __cxx_global_var_init_36647()
{
  unsigned __int8 v0;
  unsigned __int8 v1;
  uint64_t v2;

  {
    if ((v1 & 1) == 0)
    {
      {
        nw::object::_class(void)::instance = (uint64_t)"object";
        *(_QWORD *)algn_1ECD84F58 = 6;
        xmmword_1ECD84F60 = 0u;
        unk_1ECD84F70 = 0u;
        xmmword_1ECD84F80 = 0u;
        *(_OWORD *)&qword_1ECD84F90 = 0u;
        *(__int128 *)((char *)&xmmword_1ECD84F98 + 8) = 0u;
        *(_OWORD *)&qword_1ECD84FB0 = 0u;
        xmmword_1ECD84FC0 = 0u;
        unk_1ECD84FD0 = 0u;
        qword_1ECD84FE0 = (uint64_t)&qword_1ECD84FE0;
        unk_1ECD84FE8 = &qword_1ECD84FE0;
        qword_1ECD84FF0 = 0;
        dword_1ECD84FF8 = 0;
      }
    }
    nw::object::__description_def_instance = (uint64_t)nw::object::class_def::register_method_def(qword_1ECD85060, (uint64_t)nw::object::_description, 0);
    qword_1ECD85060 = v2;
  }
}

void __cxx_global_var_init_1_36648()
{
  unsigned __int8 v0;
  unsigned __int8 v1;
  uint64_t v2;

  {
    if ((v1 & 1) == 0)
    {
      {
        nw::object::_class(void)::instance = (uint64_t)"object";
        *(_QWORD *)algn_1ECD84F58 = 6;
        xmmword_1ECD84F60 = 0u;
        unk_1ECD84F70 = 0u;
        xmmword_1ECD84F80 = 0u;
        *(_OWORD *)&qword_1ECD84F90 = 0u;
        *(__int128 *)((char *)&xmmword_1ECD84F98 + 8) = 0u;
        *(_OWORD *)&qword_1ECD84FB0 = 0u;
        xmmword_1ECD84FC0 = 0u;
        unk_1ECD84FD0 = 0u;
        qword_1ECD84FE0 = (uint64_t)&qword_1ECD84FE0;
        unk_1ECD84FE8 = &qword_1ECD84FE0;
        qword_1ECD84FF0 = 0;
        dword_1ECD84FF8 = 0;
      }
    }
    nw::object::__redacted_description_def_instance = (uint64_t)nw::object::class_def::register_method_def(qword_1ECD85048, (uint64_t)nw::object::_redacted_description, 0);
    qword_1ECD85048 = v2;
  }
}

void __cxx_global_var_init_2_36649()
{
  unsigned __int8 v0;
  unsigned __int8 v1;
  uint64_t v2;

  {
    if ((v1 & 1) == 0)
    {
      {
        nw::object::_class(void)::instance = (uint64_t)"object";
        *(_QWORD *)algn_1ECD84F58 = 6;
        xmmword_1ECD84F60 = 0u;
        unk_1ECD84F70 = 0u;
        xmmword_1ECD84F80 = 0u;
        *(_OWORD *)&qword_1ECD84F90 = 0u;
        *(__int128 *)((char *)&xmmword_1ECD84F98 + 8) = 0u;
        *(_OWORD *)&qword_1ECD84FB0 = 0u;
        xmmword_1ECD84FC0 = 0u;
        unk_1ECD84FD0 = 0u;
        qword_1ECD84FE0 = (uint64_t)&qword_1ECD84FE0;
        unk_1ECD84FE8 = &qword_1ECD84FE0;
        qword_1ECD84FF0 = 0;
        dword_1ECD84FF8 = 0;
      }
    }
    nw::object::__destroy_def_instance = (uint64_t)nw::object::class_def::register_method_def(qword_1ECD85030, (uint64_t)nw::object::_destroy, 0);
    qword_1ECD85030 = v2;
  }
}

void __cxx_global_var_init_36841()
{
  unsigned __int8 v0;
  unsigned __int8 v1;
  uint64_t v2;

  {
    if ((v1 & 1) == 0)
    {
      {
        nw::object::_class(void)::instance = (uint64_t)"object";
        *(_QWORD *)algn_1ECD84F58 = 6;
        xmmword_1ECD84F60 = 0u;
        unk_1ECD84F70 = 0u;
        xmmword_1ECD84F80 = 0u;
        *(_OWORD *)&qword_1ECD84F90 = 0u;
        *(__int128 *)((char *)&xmmword_1ECD84F98 + 8) = 0u;
        *(_OWORD *)&qword_1ECD84FB0 = 0u;
        xmmword_1ECD84FC0 = 0u;
        unk_1ECD84FD0 = 0u;
        qword_1ECD84FE0 = (uint64_t)&qword_1ECD84FE0;
        unk_1ECD84FE8 = &qword_1ECD84FE0;
        qword_1ECD84FF0 = 0;
        dword_1ECD84FF8 = 0;
      }
    }
    nw::object::__description_def_instance = (uint64_t)nw::object::class_def::register_method_def(qword_1ECD85060, (uint64_t)nw::object::_description, 0);
    qword_1ECD85060 = v2;
  }
}

void __cxx_global_var_init_1_36842()
{
  unsigned __int8 v0;
  unsigned __int8 v1;
  uint64_t v2;

  {
    if ((v1 & 1) == 0)
    {
      {
        nw::object::_class(void)::instance = (uint64_t)"object";
        *(_QWORD *)algn_1ECD84F58 = 6;
        xmmword_1ECD84F60 = 0u;
        unk_1ECD84F70 = 0u;
        xmmword_1ECD84F80 = 0u;
        *(_OWORD *)&qword_1ECD84F90 = 0u;
        *(__int128 *)((char *)&xmmword_1ECD84F98 + 8) = 0u;
        *(_OWORD *)&qword_1ECD84FB0 = 0u;
        xmmword_1ECD84FC0 = 0u;
        unk_1ECD84FD0 = 0u;
        qword_1ECD84FE0 = (uint64_t)&qword_1ECD84FE0;
        unk_1ECD84FE8 = &qword_1ECD84FE0;
        qword_1ECD84FF0 = 0;
        dword_1ECD84FF8 = 0;
      }
    }
    nw::object::__redacted_description_def_instance = (uint64_t)nw::object::class_def::register_method_def(qword_1ECD85048, (uint64_t)nw::object::_redacted_description, 0);
    qword_1ECD85048 = v2;
  }
}

void __cxx_global_var_init_2_36843()
{
  unsigned __int8 v0;
  unsigned __int8 v1;
  uint64_t v2;

  {
    if ((v1 & 1) == 0)
    {
      {
        nw::object::_class(void)::instance = (uint64_t)"object";
        *(_QWORD *)algn_1ECD84F58 = 6;
        xmmword_1ECD84F60 = 0u;
        unk_1ECD84F70 = 0u;
        xmmword_1ECD84F80 = 0u;
        *(_OWORD *)&qword_1ECD84F90 = 0u;
        *(__int128 *)((char *)&xmmword_1ECD84F98 + 8) = 0u;
        *(_OWORD *)&qword_1ECD84FB0 = 0u;
        xmmword_1ECD84FC0 = 0u;
        unk_1ECD84FD0 = 0u;
        qword_1ECD84FE0 = (uint64_t)&qword_1ECD84FE0;
        unk_1ECD84FE8 = &qword_1ECD84FE0;
        qword_1ECD84FF0 = 0;
        dword_1ECD84FF8 = 0;
      }
    }
    nw::object::__destroy_def_instance = (uint64_t)nw::object::class_def::register_method_def(qword_1ECD85030, (uint64_t)nw::object::_destroy, 0);
    qword_1ECD85030 = v2;
  }
}

void __cxx_global_var_init_38450()
{
  unsigned __int8 v0;
  unsigned __int8 v1;
  uint64_t v2;

  {
    if ((v1 & 1) == 0)
    {
      {
        nw::object::_class(void)::instance = (uint64_t)"object";
        *(_QWORD *)algn_1ECD84F58 = 6;
        xmmword_1ECD84F60 = 0u;
        unk_1ECD84F70 = 0u;
        xmmword_1ECD84F80 = 0u;
        *(_OWORD *)&qword_1ECD84F90 = 0u;
        *(__int128 *)((char *)&xmmword_1ECD84F98 + 8) = 0u;
        *(_OWORD *)&qword_1ECD84FB0 = 0u;
        xmmword_1ECD84FC0 = 0u;
        unk_1ECD84FD0 = 0u;
        qword_1ECD84FE0 = (uint64_t)&qword_1ECD84FE0;
        unk_1ECD84FE8 = &qword_1ECD84FE0;
        qword_1ECD84FF0 = 0;
        dword_1ECD84FF8 = 0;
      }
    }
    nw::object::__description_def_instance = (uint64_t)nw::object::class_def::register_method_def(qword_1ECD85060, (uint64_t)nw::object::_description, 0);
    qword_1ECD85060 = v2;
  }
}

void __cxx_global_var_init_1_38451()
{
  unsigned __int8 v0;
  unsigned __int8 v1;
  uint64_t v2;

  {
    if ((v1 & 1) == 0)
    {
      {
        nw::object::_class(void)::instance = (uint64_t)"object";
        *(_QWORD *)algn_1ECD84F58 = 6;
        xmmword_1ECD84F60 = 0u;
        unk_1ECD84F70 = 0u;
        xmmword_1ECD84F80 = 0u;
        *(_OWORD *)&qword_1ECD84F90 = 0u;
        *(__int128 *)((char *)&xmmword_1ECD84F98 + 8) = 0u;
        *(_OWORD *)&qword_1ECD84FB0 = 0u;
        xmmword_1ECD84FC0 = 0u;
        unk_1ECD84FD0 = 0u;
        qword_1ECD84FE0 = (uint64_t)&qword_1ECD84FE0;
        unk_1ECD84FE8 = &qword_1ECD84FE0;
        qword_1ECD84FF0 = 0;
        dword_1ECD84FF8 = 0;
      }
    }
    nw::object::__redacted_description_def_instance = (uint64_t)nw::object::class_def::register_method_def(qword_1ECD85048, (uint64_t)nw::object::_redacted_description, 0);
    qword_1ECD85048 = v2;
  }
}

void __cxx_global_var_init_2_38452()
{
  unsigned __int8 v0;
  unsigned __int8 v1;
  uint64_t v2;

  {
    if ((v1 & 1) == 0)
    {
      {
        nw::object::_class(void)::instance = (uint64_t)"object";
        *(_QWORD *)algn_1ECD84F58 = 6;
        xmmword_1ECD84F60 = 0u;
        unk_1ECD84F70 = 0u;
        xmmword_1ECD84F80 = 0u;
        *(_OWORD *)&qword_1ECD84F90 = 0u;
        *(__int128 *)((char *)&xmmword_1ECD84F98 + 8) = 0u;
        *(_OWORD *)&qword_1ECD84FB0 = 0u;
        xmmword_1ECD84FC0 = 0u;
        unk_1ECD84FD0 = 0u;
        qword_1ECD84FE0 = (uint64_t)&qword_1ECD84FE0;
        unk_1ECD84FE8 = &qword_1ECD84FE0;
        qword_1ECD84FF0 = 0;
        dword_1ECD84FF8 = 0;
      }
    }
    nw::object::__destroy_def_instance = (uint64_t)nw::object::class_def::register_method_def(qword_1ECD85030, (uint64_t)nw::object::_destroy, 0);
    qword_1ECD85030 = v2;
  }
}

void __cxx_global_var_init_39555()
{
  unsigned __int8 v0;
  unsigned __int8 v1;
  uint64_t v2;

  {
    if ((v1 & 1) == 0)
    {
      {
        nw::object::_class(void)::instance = (uint64_t)"object";
        *(_QWORD *)algn_1ECD84F58 = 6;
        xmmword_1ECD84F60 = 0u;
        unk_1ECD84F70 = 0u;
        xmmword_1ECD84F80 = 0u;
        *(_OWORD *)&qword_1ECD84F90 = 0u;
        *(__int128 *)((char *)&xmmword_1ECD84F98 + 8) = 0u;
        *(_OWORD *)&qword_1ECD84FB0 = 0u;
        xmmword_1ECD84FC0 = 0u;
        unk_1ECD84FD0 = 0u;
        qword_1ECD84FE0 = (uint64_t)&qword_1ECD84FE0;
        unk_1ECD84FE8 = &qword_1ECD84FE0;
        qword_1ECD84FF0 = 0;
        dword_1ECD84FF8 = 0;
      }
    }
    nw::object::__description_def_instance = (uint64_t)nw::object::class_def::register_method_def(qword_1ECD85060, (uint64_t)nw::object::_description, 0);
    qword_1ECD85060 = v2;
  }
}

void __cxx_global_var_init_1_39556()
{
  unsigned __int8 v0;
  unsigned __int8 v1;
  uint64_t v2;

  {
    if ((v1 & 1) == 0)
    {
      {
        nw::object::_class(void)::instance = (uint64_t)"object";
        *(_QWORD *)algn_1ECD84F58 = 6;
        xmmword_1ECD84F60 = 0u;
        unk_1ECD84F70 = 0u;
        xmmword_1ECD84F80 = 0u;
        *(_OWORD *)&qword_1ECD84F90 = 0u;
        *(__int128 *)((char *)&xmmword_1ECD84F98 + 8) = 0u;
        *(_OWORD *)&qword_1ECD84FB0 = 0u;
        xmmword_1ECD84FC0 = 0u;
        unk_1ECD84FD0 = 0u;
        qword_1ECD84FE0 = (uint64_t)&qword_1ECD84FE0;
        unk_1ECD84FE8 = &qword_1ECD84FE0;
        qword_1ECD84FF0 = 0;
        dword_1ECD84FF8 = 0;
      }
    }
    nw::object::__redacted_description_def_instance = (uint64_t)nw::object::class_def::register_method_def(qword_1ECD85048, (uint64_t)nw::object::_redacted_description, 0);
    qword_1ECD85048 = v2;
  }
}

void __cxx_global_var_init_2_39557()
{
  unsigned __int8 v0;
  unsigned __int8 v1;
  uint64_t v2;

  {
    if ((v1 & 1) == 0)
    {
      {
        nw::object::_class(void)::instance = (uint64_t)"object";
        *(_QWORD *)algn_1ECD84F58 = 6;
        xmmword_1ECD84F60 = 0u;
        unk_1ECD84F70 = 0u;
        xmmword_1ECD84F80 = 0u;
        *(_OWORD *)&qword_1ECD84F90 = 0u;
        *(__int128 *)((char *)&xmmword_1ECD84F98 + 8) = 0u;
        *(_OWORD *)&qword_1ECD84FB0 = 0u;
        xmmword_1ECD84FC0 = 0u;
        unk_1ECD84FD0 = 0u;
        qword_1ECD84FE0 = (uint64_t)&qword_1ECD84FE0;
        unk_1ECD84FE8 = &qword_1ECD84FE0;
        qword_1ECD84FF0 = 0;
        dword_1ECD84FF8 = 0;
      }
    }
    nw::object::__destroy_def_instance = (uint64_t)nw::object::class_def::register_method_def(qword_1ECD85030, (uint64_t)nw::object::_destroy, 0);
    qword_1ECD85030 = v2;
  }
}

void __cxx_global_var_init_41034()
{
  unsigned __int8 v0;
  unsigned __int8 v1;
  uint64_t v2;

  {
    if ((v1 & 1) == 0)
    {
      {
        nw::object::_class(void)::instance = (uint64_t)"object";
        *(_QWORD *)algn_1ECD84F58 = 6;
        xmmword_1ECD84F60 = 0u;
        unk_1ECD84F70 = 0u;
        xmmword_1ECD84F80 = 0u;
        *(_OWORD *)&qword_1ECD84F90 = 0u;
        *(__int128 *)((char *)&xmmword_1ECD84F98 + 8) = 0u;
        *(_OWORD *)&qword_1ECD84FB0 = 0u;
        xmmword_1ECD84FC0 = 0u;
        unk_1ECD84FD0 = 0u;
        qword_1ECD84FE0 = (uint64_t)&qword_1ECD84FE0;
        unk_1ECD84FE8 = &qword_1ECD84FE0;
        qword_1ECD84FF0 = 0;
        dword_1ECD84FF8 = 0;
      }
    }
    nw::object::__description_def_instance = (uint64_t)nw::object::class_def::register_method_def(qword_1ECD85060, (uint64_t)nw::object::_description, 0);
    qword_1ECD85060 = v2;
  }
}

void __cxx_global_var_init_1_41035()
{
  unsigned __int8 v0;
  unsigned __int8 v1;
  uint64_t v2;

  {
    if ((v1 & 1) == 0)
    {
      {
        nw::object::_class(void)::instance = (uint64_t)"object";
        *(_QWORD *)algn_1ECD84F58 = 6;
        xmmword_1ECD84F60 = 0u;
        unk_1ECD84F70 = 0u;
        xmmword_1ECD84F80 = 0u;
        *(_OWORD *)&qword_1ECD84F90 = 0u;
        *(__int128 *)((char *)&xmmword_1ECD84F98 + 8) = 0u;
        *(_OWORD *)&qword_1ECD84FB0 = 0u;
        xmmword_1ECD84FC0 = 0u;
        unk_1ECD84FD0 = 0u;
        qword_1ECD84FE0 = (uint64_t)&qword_1ECD84FE0;
        unk_1ECD84FE8 = &qword_1ECD84FE0;
        qword_1ECD84FF0 = 0;
        dword_1ECD84FF8 = 0;
      }
    }
    nw::object::__redacted_description_def_instance = (uint64_t)nw::object::class_def::register_method_def(qword_1ECD85048, (uint64_t)nw::object::_redacted_description, 0);
    qword_1ECD85048 = v2;
  }
}

void __cxx_global_var_init_2_41036()
{
  unsigned __int8 v0;
  unsigned __int8 v1;
  uint64_t v2;

  {
    if ((v1 & 1) == 0)
    {
      {
        nw::object::_class(void)::instance = (uint64_t)"object";
        *(_QWORD *)algn_1ECD84F58 = 6;
        xmmword_1ECD84F60 = 0u;
        unk_1ECD84F70 = 0u;
        xmmword_1ECD84F80 = 0u;
        *(_OWORD *)&qword_1ECD84F90 = 0u;
        *(__int128 *)((char *)&xmmword_1ECD84F98 + 8) = 0u;
        *(_OWORD *)&qword_1ECD84FB0 = 0u;
        xmmword_1ECD84FC0 = 0u;
        unk_1ECD84FD0 = 0u;
        qword_1ECD84FE0 = (uint64_t)&qword_1ECD84FE0;
        unk_1ECD84FE8 = &qword_1ECD84FE0;
        qword_1ECD84FF0 = 0;
        dword_1ECD84FF8 = 0;
      }
    }
    nw::object::__destroy_def_instance = (uint64_t)nw::object::class_def::register_method_def(qword_1ECD85030, (uint64_t)nw::object::_destroy, 0);
    qword_1ECD85030 = v2;
  }
}

void __cxx_global_var_init_41459()
{
  unsigned __int8 v0;
  unsigned __int8 v1;
  uint64_t v2;

  {
    if ((v1 & 1) == 0)
    {
      {
        nw::object::_class(void)::instance = (uint64_t)"object";
        *(_QWORD *)algn_1ECD84F58 = 6;
        xmmword_1ECD84F60 = 0u;
        unk_1ECD84F70 = 0u;
        xmmword_1ECD84F80 = 0u;
        *(_OWORD *)&qword_1ECD84F90 = 0u;
        *(__int128 *)((char *)&xmmword_1ECD84F98 + 8) = 0u;
        *(_OWORD *)&qword_1ECD84FB0 = 0u;
        xmmword_1ECD84FC0 = 0u;
        unk_1ECD84FD0 = 0u;
        qword_1ECD84FE0 = (uint64_t)&qword_1ECD84FE0;
        unk_1ECD84FE8 = &qword_1ECD84FE0;
        qword_1ECD84FF0 = 0;
        dword_1ECD84FF8 = 0;
      }
    }
    nw::object::__description_def_instance = (uint64_t)nw::object::class_def::register_method_def(qword_1ECD85060, (uint64_t)nw::object::_description, 0);
    qword_1ECD85060 = v2;
  }
}

void __cxx_global_var_init_1_41460()
{
  unsigned __int8 v0;
  unsigned __int8 v1;
  uint64_t v2;

  {
    if ((v1 & 1) == 0)
    {
      {
        nw::object::_class(void)::instance = (uint64_t)"object";
        *(_QWORD *)algn_1ECD84F58 = 6;
        xmmword_1ECD84F60 = 0u;
        unk_1ECD84F70 = 0u;
        xmmword_1ECD84F80 = 0u;
        *(_OWORD *)&qword_1ECD84F90 = 0u;
        *(__int128 *)((char *)&xmmword_1ECD84F98 + 8) = 0u;
        *(_OWORD *)&qword_1ECD84FB0 = 0u;
        xmmword_1ECD84FC0 = 0u;
        unk_1ECD84FD0 = 0u;
        qword_1ECD84FE0 = (uint64_t)&qword_1ECD84FE0;
        unk_1ECD84FE8 = &qword_1ECD84FE0;
        qword_1ECD84FF0 = 0;
        dword_1ECD84FF8 = 0;
      }
    }
    nw::object::__redacted_description_def_instance = (uint64_t)nw::object::class_def::register_method_def(qword_1ECD85048, (uint64_t)nw::object::_redacted_description, 0);
    qword_1ECD85048 = v2;
  }
}

void __cxx_global_var_init_2_41461()
{
  unsigned __int8 v0;
  unsigned __int8 v1;
  uint64_t v2;

  {
    if ((v1 & 1) == 0)
    {
      {
        nw::object::_class(void)::instance = (uint64_t)"object";
        *(_QWORD *)algn_1ECD84F58 = 6;
        xmmword_1ECD84F60 = 0u;
        unk_1ECD84F70 = 0u;
        xmmword_1ECD84F80 = 0u;
        *(_OWORD *)&qword_1ECD84F90 = 0u;
        *(__int128 *)((char *)&xmmword_1ECD84F98 + 8) = 0u;
        *(_OWORD *)&qword_1ECD84FB0 = 0u;
        xmmword_1ECD84FC0 = 0u;
        unk_1ECD84FD0 = 0u;
        qword_1ECD84FE0 = (uint64_t)&qword_1ECD84FE0;
        unk_1ECD84FE8 = &qword_1ECD84FE0;
        qword_1ECD84FF0 = 0;
        dword_1ECD84FF8 = 0;
      }
    }
    nw::object::__destroy_def_instance = (uint64_t)nw::object::class_def::register_method_def(qword_1ECD85030, (uint64_t)nw::object::_destroy, 0);
    qword_1ECD85030 = v2;
  }
}

void __cxx_global_var_init_41537()
{
  unsigned __int8 v0;
  unsigned __int8 v1;
  uint64_t v2;

  {
    if ((v1 & 1) == 0)
    {
      {
        nw::object::_class(void)::instance = (uint64_t)"object";
        *(_QWORD *)algn_1ECD84F58 = 6;
        xmmword_1ECD84F60 = 0u;
        unk_1ECD84F70 = 0u;
        xmmword_1ECD84F80 = 0u;
        *(_OWORD *)&qword_1ECD84F90 = 0u;
        *(__int128 *)((char *)&xmmword_1ECD84F98 + 8) = 0u;
        *(_OWORD *)&qword_1ECD84FB0 = 0u;
        xmmword_1ECD84FC0 = 0u;
        unk_1ECD84FD0 = 0u;
        qword_1ECD84FE0 = (uint64_t)&qword_1ECD84FE0;
        unk_1ECD84FE8 = &qword_1ECD84FE0;
        qword_1ECD84FF0 = 0;
        dword_1ECD84FF8 = 0;
      }
    }
    nw::object::__description_def_instance = (uint64_t)nw::object::class_def::register_method_def(qword_1ECD85060, (uint64_t)nw::object::_description, 0);
    qword_1ECD85060 = v2;
  }
}

void __cxx_global_var_init_1_41538()
{
  unsigned __int8 v0;
  unsigned __int8 v1;
  uint64_t v2;

  {
    if ((v1 & 1) == 0)
    {
      {
        nw::object::_class(void)::instance = (uint64_t)"object";
        *(_QWORD *)algn_1ECD84F58 = 6;
        xmmword_1ECD84F60 = 0u;
        unk_1ECD84F70 = 0u;
        xmmword_1ECD84F80 = 0u;
        *(_OWORD *)&qword_1ECD84F90 = 0u;
        *(__int128 *)((char *)&xmmword_1ECD84F98 + 8) = 0u;
        *(_OWORD *)&qword_1ECD84FB0 = 0u;
        xmmword_1ECD84FC0 = 0u;
        unk_1ECD84FD0 = 0u;
        qword_1ECD84FE0 = (uint64_t)&qword_1ECD84FE0;
        unk_1ECD84FE8 = &qword_1ECD84FE0;
        qword_1ECD84FF0 = 0;
        dword_1ECD84FF8 = 0;
      }
    }
    nw::object::__redacted_description_def_instance = (uint64_t)nw::object::class_def::register_method_def(qword_1ECD85048, (uint64_t)nw::object::_redacted_description, 0);
    qword_1ECD85048 = v2;
  }
}

void __cxx_global_var_init_2_41539()
{
  unsigned __int8 v0;
  unsigned __int8 v1;
  uint64_t v2;

  {
    if ((v1 & 1) == 0)
    {
      {
        nw::object::_class(void)::instance = (uint64_t)"object";
        *(_QWORD *)algn_1ECD84F58 = 6;
        xmmword_1ECD84F60 = 0u;
        unk_1ECD84F70 = 0u;
        xmmword_1ECD84F80 = 0u;
        *(_OWORD *)&qword_1ECD84F90 = 0u;
        *(__int128 *)((char *)&xmmword_1ECD84F98 + 8) = 0u;
        *(_OWORD *)&qword_1ECD84FB0 = 0u;
        xmmword_1ECD84FC0 = 0u;
        unk_1ECD84FD0 = 0u;
        qword_1ECD84FE0 = (uint64_t)&qword_1ECD84FE0;
        unk_1ECD84FE8 = &qword_1ECD84FE0;
        qword_1ECD84FF0 = 0;
        dword_1ECD84FF8 = 0;
      }
    }
    nw::object::__destroy_def_instance = (uint64_t)nw::object::class_def::register_method_def(qword_1ECD85030, (uint64_t)nw::object::_destroy, 0);
    qword_1ECD85030 = v2;
  }
}

void __cxx_global_var_init_41801()
{
  unsigned __int8 v0;
  unsigned __int8 v1;
  uint64_t v2;

  {
    if ((v1 & 1) == 0)
    {
      {
        nw::object::_class(void)::instance = (uint64_t)"object";
        *(_QWORD *)algn_1ECD84F58 = 6;
        xmmword_1ECD84F60 = 0u;
        unk_1ECD84F70 = 0u;
        xmmword_1ECD84F80 = 0u;
        *(_OWORD *)&qword_1ECD84F90 = 0u;
        *(__int128 *)((char *)&xmmword_1ECD84F98 + 8) = 0u;
        *(_OWORD *)&qword_1ECD84FB0 = 0u;
        xmmword_1ECD84FC0 = 0u;
        unk_1ECD84FD0 = 0u;
        qword_1ECD84FE0 = (uint64_t)&qword_1ECD84FE0;
        unk_1ECD84FE8 = &qword_1ECD84FE0;
        qword_1ECD84FF0 = 0;
        dword_1ECD84FF8 = 0;
      }
    }
    nw::object::__description_def_instance = (uint64_t)nw::object::class_def::register_method_def(qword_1ECD85060, (uint64_t)nw::object::_description, 0);
    qword_1ECD85060 = v2;
  }
}

void __cxx_global_var_init_1_41802()
{
  unsigned __int8 v0;
  unsigned __int8 v1;
  uint64_t v2;

  {
    if ((v1 & 1) == 0)
    {
      {
        nw::object::_class(void)::instance = (uint64_t)"object";
        *(_QWORD *)algn_1ECD84F58 = 6;
        xmmword_1ECD84F60 = 0u;
        unk_1ECD84F70 = 0u;
        xmmword_1ECD84F80 = 0u;
        *(_OWORD *)&qword_1ECD84F90 = 0u;
        *(__int128 *)((char *)&xmmword_1ECD84F98 + 8) = 0u;
        *(_OWORD *)&qword_1ECD84FB0 = 0u;
        xmmword_1ECD84FC0 = 0u;
        unk_1ECD84FD0 = 0u;
        qword_1ECD84FE0 = (uint64_t)&qword_1ECD84FE0;
        unk_1ECD84FE8 = &qword_1ECD84FE0;
        qword_1ECD84FF0 = 0;
        dword_1ECD84FF8 = 0;
      }
    }
    nw::object::__redacted_description_def_instance = (uint64_t)nw::object::class_def::register_method_def(qword_1ECD85048, (uint64_t)nw::object::_redacted_description, 0);
    qword_1ECD85048 = v2;
  }
}

void __cxx_global_var_init_2_41803()
{
  unsigned __int8 v0;
  unsigned __int8 v1;
  uint64_t v2;

  {
    if ((v1 & 1) == 0)
    {
      {
        nw::object::_class(void)::instance = (uint64_t)"object";
        *(_QWORD *)algn_1ECD84F58 = 6;
        xmmword_1ECD84F60 = 0u;
        unk_1ECD84F70 = 0u;
        xmmword_1ECD84F80 = 0u;
        *(_OWORD *)&qword_1ECD84F90 = 0u;
        *(__int128 *)((char *)&xmmword_1ECD84F98 + 8) = 0u;
        *(_OWORD *)&qword_1ECD84FB0 = 0u;
        xmmword_1ECD84FC0 = 0u;
        unk_1ECD84FD0 = 0u;
        qword_1ECD84FE0 = (uint64_t)&qword_1ECD84FE0;
        unk_1ECD84FE8 = &qword_1ECD84FE0;
        qword_1ECD84FF0 = 0;
        dword_1ECD84FF8 = 0;
      }
    }
    nw::object::__destroy_def_instance = (uint64_t)nw::object::class_def::register_method_def(qword_1ECD85030, (uint64_t)nw::object::_destroy, 0);
    qword_1ECD85030 = v2;
  }
}

void __cxx_global_var_init_43589()
{
  unsigned __int8 v0;
  unsigned __int8 v1;
  uint64_t v2;

  {
    if ((v1 & 1) == 0)
    {
      {
        nw::object::_class(void)::instance = (uint64_t)"object";
        *(_QWORD *)algn_1ECD84F58 = 6;
        xmmword_1ECD84F60 = 0u;
        unk_1ECD84F70 = 0u;
        xmmword_1ECD84F80 = 0u;
        *(_OWORD *)&qword_1ECD84F90 = 0u;
        *(__int128 *)((char *)&xmmword_1ECD84F98 + 8) = 0u;
        *(_OWORD *)&qword_1ECD84FB0 = 0u;
        xmmword_1ECD84FC0 = 0u;
        unk_1ECD84FD0 = 0u;
        qword_1ECD84FE0 = (uint64_t)&qword_1ECD84FE0;
        unk_1ECD84FE8 = &qword_1ECD84FE0;
        qword_1ECD84FF0 = 0;
        dword_1ECD84FF8 = 0;
      }
    }
    nw::object::__description_def_instance = (uint64_t)nw::object::class_def::register_method_def(qword_1ECD85060, (uint64_t)nw::object::_description, 0);
    qword_1ECD85060 = v2;
  }
}

void __cxx_global_var_init_1_43590()
{
  unsigned __int8 v0;
  unsigned __int8 v1;
  uint64_t v2;

  {
    if ((v1 & 1) == 0)
    {
      {
        nw::object::_class(void)::instance = (uint64_t)"object";
        *(_QWORD *)algn_1ECD84F58 = 6;
        xmmword_1ECD84F60 = 0u;
        unk_1ECD84F70 = 0u;
        xmmword_1ECD84F80 = 0u;
        *(_OWORD *)&qword_1ECD84F90 = 0u;
        *(__int128 *)((char *)&xmmword_1ECD84F98 + 8) = 0u;
        *(_OWORD *)&qword_1ECD84FB0 = 0u;
        xmmword_1ECD84FC0 = 0u;
        unk_1ECD84FD0 = 0u;
        qword_1ECD84FE0 = (uint64_t)&qword_1ECD84FE0;
        unk_1ECD84FE8 = &qword_1ECD84FE0;
        qword_1ECD84FF0 = 0;
        dword_1ECD84FF8 = 0;
      }
    }
    nw::object::__redacted_description_def_instance = (uint64_t)nw::object::class_def::register_method_def(qword_1ECD85048, (uint64_t)nw::object::_redacted_description, 0);
    qword_1ECD85048 = v2;
  }
}

void __cxx_global_var_init_2_43591()
{
  unsigned __int8 v0;
  unsigned __int8 v1;
  uint64_t v2;

  {
    if ((v1 & 1) == 0)
    {
      {
        nw::object::_class(void)::instance = (uint64_t)"object";
        *(_QWORD *)algn_1ECD84F58 = 6;
        xmmword_1ECD84F60 = 0u;
        unk_1ECD84F70 = 0u;
        xmmword_1ECD84F80 = 0u;
        *(_OWORD *)&qword_1ECD84F90 = 0u;
        *(__int128 *)((char *)&xmmword_1ECD84F98 + 8) = 0u;
        *(_OWORD *)&qword_1ECD84FB0 = 0u;
        xmmword_1ECD84FC0 = 0u;
        unk_1ECD84FD0 = 0u;
        qword_1ECD84FE0 = (uint64_t)&qword_1ECD84FE0;
        unk_1ECD84FE8 = &qword_1ECD84FE0;
        qword_1ECD84FF0 = 0;
        dword_1ECD84FF8 = 0;
      }
    }
    nw::object::__destroy_def_instance = (uint64_t)nw::object::class_def::register_method_def(qword_1ECD85030, (uint64_t)nw::object::_destroy, 0);
    qword_1ECD85030 = v2;
  }
}

void __cxx_global_var_init_44094()
{
  unsigned __int8 v0;
  unsigned __int8 v1;
  uint64_t v2;

  {
    if ((v1 & 1) == 0)
    {
      {
        nw::object::_class(void)::instance = (uint64_t)"object";
        *(_QWORD *)algn_1ECD84F58 = 6;
        xmmword_1ECD84F60 = 0u;
        unk_1ECD84F70 = 0u;
        xmmword_1ECD84F80 = 0u;
        *(_OWORD *)&qword_1ECD84F90 = 0u;
        *(__int128 *)((char *)&xmmword_1ECD84F98 + 8) = 0u;
        *(_OWORD *)&qword_1ECD84FB0 = 0u;
        xmmword_1ECD84FC0 = 0u;
        unk_1ECD84FD0 = 0u;
        qword_1ECD84FE0 = (uint64_t)&qword_1ECD84FE0;
        unk_1ECD84FE8 = &qword_1ECD84FE0;
        qword_1ECD84FF0 = 0;
        dword_1ECD84FF8 = 0;
      }
    }
    nw::object::__description_def_instance = (uint64_t)nw::object::class_def::register_method_def(qword_1ECD85060, (uint64_t)nw::object::_description, 0);
    qword_1ECD85060 = v2;
  }
}

void __cxx_global_var_init_1_44095()
{
  unsigned __int8 v0;
  unsigned __int8 v1;
  uint64_t v2;

  {
    if ((v1 & 1) == 0)
    {
      {
        nw::object::_class(void)::instance = (uint64_t)"object";
        *(_QWORD *)algn_1ECD84F58 = 6;
        xmmword_1ECD84F60 = 0u;
        unk_1ECD84F70 = 0u;
        xmmword_1ECD84F80 = 0u;
        *(_OWORD *)&qword_1ECD84F90 = 0u;
        *(__int128 *)((char *)&xmmword_1ECD84F98 + 8) = 0u;
        *(_OWORD *)&qword_1ECD84FB0 = 0u;
        xmmword_1ECD84FC0 = 0u;
        unk_1ECD84FD0 = 0u;
        qword_1ECD84FE0 = (uint64_t)&qword_1ECD84FE0;
        unk_1ECD84FE8 = &qword_1ECD84FE0;
        qword_1ECD84FF0 = 0;
        dword_1ECD84FF8 = 0;
      }
    }
    nw::object::__redacted_description_def_instance = (uint64_t)nw::object::class_def::register_method_def(qword_1ECD85048, (uint64_t)nw::object::_redacted_description, 0);
    qword_1ECD85048 = v2;
  }
}

void __cxx_global_var_init_2_44096()
{
  unsigned __int8 v0;
  unsigned __int8 v1;
  uint64_t v2;

  {
    if ((v1 & 1) == 0)
    {
      {
        nw::object::_class(void)::instance = (uint64_t)"object";
        *(_QWORD *)algn_1ECD84F58 = 6;
        xmmword_1ECD84F60 = 0u;
        unk_1ECD84F70 = 0u;
        xmmword_1ECD84F80 = 0u;
        *(_OWORD *)&qword_1ECD84F90 = 0u;
        *(__int128 *)((char *)&xmmword_1ECD84F98 + 8) = 0u;
        *(_OWORD *)&qword_1ECD84FB0 = 0u;
        xmmword_1ECD84FC0 = 0u;
        unk_1ECD84FD0 = 0u;
        qword_1ECD84FE0 = (uint64_t)&qword_1ECD84FE0;
        unk_1ECD84FE8 = &qword_1ECD84FE0;
        qword_1ECD84FF0 = 0;
        dword_1ECD84FF8 = 0;
      }
    }
    nw::object::__destroy_def_instance = (uint64_t)nw::object::class_def::register_method_def(qword_1ECD85030, (uint64_t)nw::object::_destroy, 0);
    qword_1ECD85030 = v2;
  }
}

void __cxx_global_var_init_44265()
{
  unsigned __int8 v0;
  unsigned __int8 v1;
  uint64_t v2;

  {
    if ((v1 & 1) == 0)
    {
      {
        nw::object::_class(void)::instance = (uint64_t)"object";
        *(_QWORD *)algn_1ECD84F58 = 6;
        xmmword_1ECD84F60 = 0u;
        unk_1ECD84F70 = 0u;
        xmmword_1ECD84F80 = 0u;
        *(_OWORD *)&qword_1ECD84F90 = 0u;
        *(__int128 *)((char *)&xmmword_1ECD84F98 + 8) = 0u;
        *(_OWORD *)&qword_1ECD84FB0 = 0u;
        xmmword_1ECD84FC0 = 0u;
        unk_1ECD84FD0 = 0u;
        qword_1ECD84FE0 = (uint64_t)&qword_1ECD84FE0;
        unk_1ECD84FE8 = &qword_1ECD84FE0;
        qword_1ECD84FF0 = 0;
        dword_1ECD84FF8 = 0;
      }
    }
    nw::object::__description_def_instance = (uint64_t)nw::object::class_def::register_method_def(qword_1ECD85060, (uint64_t)nw::object::_description, 0);
    qword_1ECD85060 = v2;
  }
}

void __cxx_global_var_init_1_44266()
{
  unsigned __int8 v0;
  unsigned __int8 v1;
  uint64_t v2;

  {
    if ((v1 & 1) == 0)
    {
      {
        nw::object::_class(void)::instance = (uint64_t)"object";
        *(_QWORD *)algn_1ECD84F58 = 6;
        xmmword_1ECD84F60 = 0u;
        unk_1ECD84F70 = 0u;
        xmmword_1ECD84F80 = 0u;
        *(_OWORD *)&qword_1ECD84F90 = 0u;
        *(__int128 *)((char *)&xmmword_1ECD84F98 + 8) = 0u;
        *(_OWORD *)&qword_1ECD84FB0 = 0u;
        xmmword_1ECD84FC0 = 0u;
        unk_1ECD84FD0 = 0u;
        qword_1ECD84FE0 = (uint64_t)&qword_1ECD84FE0;
        unk_1ECD84FE8 = &qword_1ECD84FE0;
        qword_1ECD84FF0 = 0;
        dword_1ECD84FF8 = 0;
      }
    }
    nw::object::__redacted_description_def_instance = (uint64_t)nw::object::class_def::register_method_def(qword_1ECD85048, (uint64_t)nw::object::_redacted_description, 0);
    qword_1ECD85048 = v2;
  }
}

void __cxx_global_var_init_2_44267()
{
  unsigned __int8 v0;
  unsigned __int8 v1;
  uint64_t v2;

  {
    if ((v1 & 1) == 0)
    {
      {
        nw::object::_class(void)::instance = (uint64_t)"object";
        *(_QWORD *)algn_1ECD84F58 = 6;
        xmmword_1ECD84F60 = 0u;
        unk_1ECD84F70 = 0u;
        xmmword_1ECD84F80 = 0u;
        *(_OWORD *)&qword_1ECD84F90 = 0u;
        *(__int128 *)((char *)&xmmword_1ECD84F98 + 8) = 0u;
        *(_OWORD *)&qword_1ECD84FB0 = 0u;
        xmmword_1ECD84FC0 = 0u;
        unk_1ECD84FD0 = 0u;
        qword_1ECD84FE0 = (uint64_t)&qword_1ECD84FE0;
        unk_1ECD84FE8 = &qword_1ECD84FE0;
        qword_1ECD84FF0 = 0;
        dword_1ECD84FF8 = 0;
      }
    }
    nw::object::__destroy_def_instance = (uint64_t)nw::object::class_def::register_method_def(qword_1ECD85030, (uint64_t)nw::object::_destroy, 0);
    qword_1ECD85030 = v2;
  }
}

void __cxx_global_var_init_46053()
{
  unsigned __int8 v0;
  unsigned __int8 v1;
  uint64_t v2;

  {
    if ((v1 & 1) == 0)
    {
      {
        nw::object::_class(void)::instance = (uint64_t)"object";
        *(_QWORD *)algn_1ECD84F58 = 6;
        xmmword_1ECD84F60 = 0u;
        unk_1ECD84F70 = 0u;
        xmmword_1ECD84F80 = 0u;
        *(_OWORD *)&qword_1ECD84F90 = 0u;
        *(__int128 *)((char *)&xmmword_1ECD84F98 + 8) = 0u;
        *(_OWORD *)&qword_1ECD84FB0 = 0u;
        xmmword_1ECD84FC0 = 0u;
        unk_1ECD84FD0 = 0u;
        qword_1ECD84FE0 = (uint64_t)&qword_1ECD84FE0;
        unk_1ECD84FE8 = &qword_1ECD84FE0;
        qword_1ECD84FF0 = 0;
        dword_1ECD84FF8 = 0;
      }
    }
    nw::object::__description_def_instance = (uint64_t)nw::object::class_def::register_method_def(qword_1ECD85060, (uint64_t)nw::object::_description, 0);
    qword_1ECD85060 = v2;
  }
}

void __cxx_global_var_init_1_46054()
{
  unsigned __int8 v0;
  unsigned __int8 v1;
  uint64_t v2;

  {
    if ((v1 & 1) == 0)
    {
      {
        nw::object::_class(void)::instance = (uint64_t)"object";
        *(_QWORD *)algn_1ECD84F58 = 6;
        xmmword_1ECD84F60 = 0u;
        unk_1ECD84F70 = 0u;
        xmmword_1ECD84F80 = 0u;
        *(_OWORD *)&qword_1ECD84F90 = 0u;
        *(__int128 *)((char *)&xmmword_1ECD84F98 + 8) = 0u;
        *(_OWORD *)&qword_1ECD84FB0 = 0u;
        xmmword_1ECD84FC0 = 0u;
        unk_1ECD84FD0 = 0u;
        qword_1ECD84FE0 = (uint64_t)&qword_1ECD84FE0;
        unk_1ECD84FE8 = &qword_1ECD84FE0;
        qword_1ECD84FF0 = 0;
        dword_1ECD84FF8 = 0;
      }
    }
    nw::object::__redacted_description_def_instance = (uint64_t)nw::object::class_def::register_method_def(qword_1ECD85048, (uint64_t)nw::object::_redacted_description, 0);
    qword_1ECD85048 = v2;
  }
}

void __cxx_global_var_init_2_46055()
{
  unsigned __int8 v0;
  unsigned __int8 v1;
  uint64_t v2;

  {
    if ((v1 & 1) == 0)
    {
      {
        nw::object::_class(void)::instance = (uint64_t)"object";
        *(_QWORD *)algn_1ECD84F58 = 6;
        xmmword_1ECD84F60 = 0u;
        unk_1ECD84F70 = 0u;
        xmmword_1ECD84F80 = 0u;
        *(_OWORD *)&qword_1ECD84F90 = 0u;
        *(__int128 *)((char *)&xmmword_1ECD84F98 + 8) = 0u;
        *(_OWORD *)&qword_1ECD84FB0 = 0u;
        xmmword_1ECD84FC0 = 0u;
        unk_1ECD84FD0 = 0u;
        qword_1ECD84FE0 = (uint64_t)&qword_1ECD84FE0;
        unk_1ECD84FE8 = &qword_1ECD84FE0;
        qword_1ECD84FF0 = 0;
        dword_1ECD84FF8 = 0;
      }
    }
    nw::object::__destroy_def_instance = (uint64_t)nw::object::class_def::register_method_def(qword_1ECD85030, (uint64_t)nw::object::_destroy, 0);
    qword_1ECD85030 = v2;
  }
}

void __cxx_global_var_init_46962()
{
  unsigned __int8 v0;
  unsigned __int8 v1;
  uint64_t v2;

  {
    if ((v1 & 1) == 0)
    {
      {
        nw::object::_class(void)::instance = (uint64_t)"object";
        *(_QWORD *)algn_1ECD84F58 = 6;
        xmmword_1ECD84F60 = 0u;
        unk_1ECD84F70 = 0u;
        xmmword_1ECD84F80 = 0u;
        *(_OWORD *)&qword_1ECD84F90 = 0u;
        *(__int128 *)((char *)&xmmword_1ECD84F98 + 8) = 0u;
        *(_OWORD *)&qword_1ECD84FB0 = 0u;
        xmmword_1ECD84FC0 = 0u;
        unk_1ECD84FD0 = 0u;
        qword_1ECD84FE0 = (uint64_t)&qword_1ECD84FE0;
        unk_1ECD84FE8 = &qword_1ECD84FE0;
        qword_1ECD84FF0 = 0;
        dword_1ECD84FF8 = 0;
      }
    }
    nw::object::__description_def_instance = (uint64_t)nw::object::class_def::register_method_def(qword_1ECD85060, (uint64_t)nw::object::_description, 0);
    qword_1ECD85060 = v2;
  }
}

void __cxx_global_var_init_1_46963()
{
  unsigned __int8 v0;
  unsigned __int8 v1;
  uint64_t v2;

  {
    if ((v1 & 1) == 0)
    {
      {
        nw::object::_class(void)::instance = (uint64_t)"object";
        *(_QWORD *)algn_1ECD84F58 = 6;
        xmmword_1ECD84F60 = 0u;
        unk_1ECD84F70 = 0u;
        xmmword_1ECD84F80 = 0u;
        *(_OWORD *)&qword_1ECD84F90 = 0u;
        *(__int128 *)((char *)&xmmword_1ECD84F98 + 8) = 0u;
        *(_OWORD *)&qword_1ECD84FB0 = 0u;
        xmmword_1ECD84FC0 = 0u;
        unk_1ECD84FD0 = 0u;
        qword_1ECD84FE0 = (uint64_t)&qword_1ECD84FE0;
        unk_1ECD84FE8 = &qword_1ECD84FE0;
        qword_1ECD84FF0 = 0;
        dword_1ECD84FF8 = 0;
      }
    }
    nw::object::__redacted_description_def_instance = (uint64_t)nw::object::class_def::register_method_def(qword_1ECD85048, (uint64_t)nw::object::_redacted_description, 0);
    qword_1ECD85048 = v2;
  }
}

void __cxx_global_var_init_2_46964()
{
  unsigned __int8 v0;
  unsigned __int8 v1;
  uint64_t v2;

  {
    if ((v1 & 1) == 0)
    {
      {
        nw::object::_class(void)::instance = (uint64_t)"object";
        *(_QWORD *)algn_1ECD84F58 = 6;
        xmmword_1ECD84F60 = 0u;
        unk_1ECD84F70 = 0u;
        xmmword_1ECD84F80 = 0u;
        *(_OWORD *)&qword_1ECD84F90 = 0u;
        *(__int128 *)((char *)&xmmword_1ECD84F98 + 8) = 0u;
        *(_OWORD *)&qword_1ECD84FB0 = 0u;
        xmmword_1ECD84FC0 = 0u;
        unk_1ECD84FD0 = 0u;
        qword_1ECD84FE0 = (uint64_t)&qword_1ECD84FE0;
        unk_1ECD84FE8 = &qword_1ECD84FE0;
        qword_1ECD84FF0 = 0;
        dword_1ECD84FF8 = 0;
      }
    }
    nw::object::__destroy_def_instance = (uint64_t)nw::object::class_def::register_method_def(qword_1ECD85030, (uint64_t)nw::object::_destroy, 0);
    qword_1ECD85030 = v2;
  }
}

void __cxx_global_var_init_48361()
{
  unsigned __int8 v0;
  unsigned __int8 v1;
  uint64_t v2;

  {
    if ((v1 & 1) == 0)
    {
      {
        nw::object::_class(void)::instance = (uint64_t)"object";
        *(_QWORD *)algn_1ECD84F58 = 6;
        xmmword_1ECD84F60 = 0u;
        unk_1ECD84F70 = 0u;
        xmmword_1ECD84F80 = 0u;
        *(_OWORD *)&qword_1ECD84F90 = 0u;
        *(__int128 *)((char *)&xmmword_1ECD84F98 + 8) = 0u;
        *(_OWORD *)&qword_1ECD84FB0 = 0u;
        xmmword_1ECD84FC0 = 0u;
        unk_1ECD84FD0 = 0u;
        qword_1ECD84FE0 = (uint64_t)&qword_1ECD84FE0;
        unk_1ECD84FE8 = &qword_1ECD84FE0;
        qword_1ECD84FF0 = 0;
        dword_1ECD84FF8 = 0;
      }
    }
    nw::object::__description_def_instance = (uint64_t)nw::object::class_def::register_method_def(qword_1ECD85060, (uint64_t)nw::object::_description, 0);
    qword_1ECD85060 = v2;
  }
}

void __cxx_global_var_init_1_48362()
{
  unsigned __int8 v0;
  unsigned __int8 v1;
  uint64_t v2;

  {
    if ((v1 & 1) == 0)
    {
      {
        nw::object::_class(void)::instance = (uint64_t)"object";
        *(_QWORD *)algn_1ECD84F58 = 6;
        xmmword_1ECD84F60 = 0u;
        unk_1ECD84F70 = 0u;
        xmmword_1ECD84F80 = 0u;
        *(_OWORD *)&qword_1ECD84F90 = 0u;
        *(__int128 *)((char *)&xmmword_1ECD84F98 + 8) = 0u;
        *(_OWORD *)&qword_1ECD84FB0 = 0u;
        xmmword_1ECD84FC0 = 0u;
        unk_1ECD84FD0 = 0u;
        qword_1ECD84FE0 = (uint64_t)&qword_1ECD84FE0;
        unk_1ECD84FE8 = &qword_1ECD84FE0;
        qword_1ECD84FF0 = 0;
        dword_1ECD84FF8 = 0;
      }
    }
    nw::object::__redacted_description_def_instance = (uint64_t)nw::object::class_def::register_method_def(qword_1ECD85048, (uint64_t)nw::object::_redacted_description, 0);
    qword_1ECD85048 = v2;
  }
}

void __cxx_global_var_init_2_48363()
{
  unsigned __int8 v0;
  unsigned __int8 v1;
  uint64_t v2;

  {
    if ((v1 & 1) == 0)
    {
      {
        nw::object::_class(void)::instance = (uint64_t)"object";
        *(_QWORD *)algn_1ECD84F58 = 6;
        xmmword_1ECD84F60 = 0u;
        unk_1ECD84F70 = 0u;
        xmmword_1ECD84F80 = 0u;
        *(_OWORD *)&qword_1ECD84F90 = 0u;
        *(__int128 *)((char *)&xmmword_1ECD84F98 + 8) = 0u;
        *(_OWORD *)&qword_1ECD84FB0 = 0u;
        xmmword_1ECD84FC0 = 0u;
        unk_1ECD84FD0 = 0u;
        qword_1ECD84FE0 = (uint64_t)&qword_1ECD84FE0;
        unk_1ECD84FE8 = &qword_1ECD84FE0;
        qword_1ECD84FF0 = 0;
        dword_1ECD84FF8 = 0;
      }
    }
    nw::object::__destroy_def_instance = (uint64_t)nw::object::class_def::register_method_def(qword_1ECD85030, (uint64_t)nw::object::_destroy, 0);
    qword_1ECD85030 = v2;
  }
}

void __cxx_global_var_init_48714()
{
  unsigned __int8 v0;
  unsigned __int8 v1;
  uint64_t v2;

  {
    if ((v1 & 1) == 0)
    {
      {
        nw::object::_class(void)::instance = (uint64_t)"object";
        *(_QWORD *)algn_1ECD84F58 = 6;
        xmmword_1ECD84F60 = 0u;
        unk_1ECD84F70 = 0u;
        xmmword_1ECD84F80 = 0u;
        *(_OWORD *)&qword_1ECD84F90 = 0u;
        *(__int128 *)((char *)&xmmword_1ECD84F98 + 8) = 0u;
        *(_OWORD *)&qword_1ECD84FB0 = 0u;
        xmmword_1ECD84FC0 = 0u;
        unk_1ECD84FD0 = 0u;
        qword_1ECD84FE0 = (uint64_t)&qword_1ECD84FE0;
        unk_1ECD84FE8 = &qword_1ECD84FE0;
        qword_1ECD84FF0 = 0;
        dword_1ECD84FF8 = 0;
      }
    }
    nw::object::__description_def_instance = (uint64_t)nw::object::class_def::register_method_def(qword_1ECD85060, (uint64_t)nw::object::_description, 0);
    qword_1ECD85060 = v2;
  }
}

void __cxx_global_var_init_1_48715()
{
  unsigned __int8 v0;
  unsigned __int8 v1;
  uint64_t v2;

  {
    if ((v1 & 1) == 0)
    {
      {
        nw::object::_class(void)::instance = (uint64_t)"object";
        *(_QWORD *)algn_1ECD84F58 = 6;
        xmmword_1ECD84F60 = 0u;
        unk_1ECD84F70 = 0u;
        xmmword_1ECD84F80 = 0u;
        *(_OWORD *)&qword_1ECD84F90 = 0u;
        *(__int128 *)((char *)&xmmword_1ECD84F98 + 8) = 0u;
        *(_OWORD *)&qword_1ECD84FB0 = 0u;
        xmmword_1ECD84FC0 = 0u;
        unk_1ECD84FD0 = 0u;
        qword_1ECD84FE0 = (uint64_t)&qword_1ECD84FE0;
        unk_1ECD84FE8 = &qword_1ECD84FE0;
        qword_1ECD84FF0 = 0;
        dword_1ECD84FF8 = 0;
      }
    }
    nw::object::__redacted_description_def_instance = (uint64_t)nw::object::class_def::register_method_def(qword_1ECD85048, (uint64_t)nw::object::_redacted_description, 0);
    qword_1ECD85048 = v2;
  }
}

void __cxx_global_var_init_2_48716()
{
  unsigned __int8 v0;
  unsigned __int8 v1;
  uint64_t v2;

  {
    if ((v1 & 1) == 0)
    {
      {
        nw::object::_class(void)::instance = (uint64_t)"object";
        *(_QWORD *)algn_1ECD84F58 = 6;
        xmmword_1ECD84F60 = 0u;
        unk_1ECD84F70 = 0u;
        xmmword_1ECD84F80 = 0u;
        *(_OWORD *)&qword_1ECD84F90 = 0u;
        *(__int128 *)((char *)&xmmword_1ECD84F98 + 8) = 0u;
        *(_OWORD *)&qword_1ECD84FB0 = 0u;
        xmmword_1ECD84FC0 = 0u;
        unk_1ECD84FD0 = 0u;
        qword_1ECD84FE0 = (uint64_t)&qword_1ECD84FE0;
        unk_1ECD84FE8 = &qword_1ECD84FE0;
        qword_1ECD84FF0 = 0;
        dword_1ECD84FF8 = 0;
      }
    }
    nw::object::__destroy_def_instance = (uint64_t)nw::object::class_def::register_method_def(qword_1ECD85030, (uint64_t)nw::object::_destroy, 0);
    qword_1ECD85030 = v2;
  }
}

void __cxx_global_var_init_49953()
{
  unsigned __int8 v0;
  unsigned __int8 v1;
  uint64_t v2;

  {
    if ((v1 & 1) == 0)
    {
      {
        nw::object::_class(void)::instance = (uint64_t)"object";
        *(_QWORD *)algn_1ECD84F58 = 6;
        xmmword_1ECD84F60 = 0u;
        unk_1ECD84F70 = 0u;
        xmmword_1ECD84F80 = 0u;
        *(_OWORD *)&qword_1ECD84F90 = 0u;
        *(__int128 *)((char *)&xmmword_1ECD84F98 + 8) = 0u;
        *(_OWORD *)&qword_1ECD84FB0 = 0u;
        xmmword_1ECD84FC0 = 0u;
        unk_1ECD84FD0 = 0u;
        qword_1ECD84FE0 = (uint64_t)&qword_1ECD84FE0;
        unk_1ECD84FE8 = &qword_1ECD84FE0;
        qword_1ECD84FF0 = 0;
        dword_1ECD84FF8 = 0;
      }
    }
    nw::object::__description_def_instance = (uint64_t)nw::object::class_def::register_method_def(qword_1ECD85060, (uint64_t)nw::object::_description, 0);
    qword_1ECD85060 = v2;
  }
}

void __cxx_global_var_init_1_49954()
{
  unsigned __int8 v0;
  unsigned __int8 v1;
  uint64_t v2;

  {
    if ((v1 & 1) == 0)
    {
      {
        nw::object::_class(void)::instance = (uint64_t)"object";
        *(_QWORD *)algn_1ECD84F58 = 6;
        xmmword_1ECD84F60 = 0u;
        unk_1ECD84F70 = 0u;
        xmmword_1ECD84F80 = 0u;
        *(_OWORD *)&qword_1ECD84F90 = 0u;
        *(__int128 *)((char *)&xmmword_1ECD84F98 + 8) = 0u;
        *(_OWORD *)&qword_1ECD84FB0 = 0u;
        xmmword_1ECD84FC0 = 0u;
        unk_1ECD84FD0 = 0u;
        qword_1ECD84FE0 = (uint64_t)&qword_1ECD84FE0;
        unk_1ECD84FE8 = &qword_1ECD84FE0;
        qword_1ECD84FF0 = 0;
        dword_1ECD84FF8 = 0;
      }
    }
    nw::object::__redacted_description_def_instance = (uint64_t)nw::object::class_def::register_method_def(qword_1ECD85048, (uint64_t)nw::object::_redacted_description, 0);
    qword_1ECD85048 = v2;
  }
}

void __cxx_global_var_init_2_49955()
{
  unsigned __int8 v0;
  unsigned __int8 v1;
  uint64_t v2;

  {
    if ((v1 & 1) == 0)
    {
      {
        nw::object::_class(void)::instance = (uint64_t)"object";
        *(_QWORD *)algn_1ECD84F58 = 6;
        xmmword_1ECD84F60 = 0u;
        unk_1ECD84F70 = 0u;
        xmmword_1ECD84F80 = 0u;
        *(_OWORD *)&qword_1ECD84F90 = 0u;
        *(__int128 *)((char *)&xmmword_1ECD84F98 + 8) = 0u;
        *(_OWORD *)&qword_1ECD84FB0 = 0u;
        xmmword_1ECD84FC0 = 0u;
        unk_1ECD84FD0 = 0u;
        qword_1ECD84FE0 = (uint64_t)&qword_1ECD84FE0;
        unk_1ECD84FE8 = &qword_1ECD84FE0;
        qword_1ECD84FF0 = 0;
        dword_1ECD84FF8 = 0;
      }
    }
    nw::object::__destroy_def_instance = (uint64_t)nw::object::class_def::register_method_def(qword_1ECD85030, (uint64_t)nw::object::_destroy, 0);
    qword_1ECD85030 = v2;
  }
}

void __cxx_global_var_init_50249()
{
  unsigned __int8 v0;
  unsigned __int8 v1;
  uint64_t v2;

  {
    if ((v1 & 1) == 0)
    {
      {
        nw::object::_class(void)::instance = (uint64_t)"object";
        *(_QWORD *)algn_1ECD84F58 = 6;
        xmmword_1ECD84F60 = 0u;
        unk_1ECD84F70 = 0u;
        xmmword_1ECD84F80 = 0u;
        *(_OWORD *)&qword_1ECD84F90 = 0u;
        *(__int128 *)((char *)&xmmword_1ECD84F98 + 8) = 0u;
        *(_OWORD *)&qword_1ECD84FB0 = 0u;
        xmmword_1ECD84FC0 = 0u;
        unk_1ECD84FD0 = 0u;
        qword_1ECD84FE0 = (uint64_t)&qword_1ECD84FE0;
        unk_1ECD84FE8 = &qword_1ECD84FE0;
        qword_1ECD84FF0 = 0;
        dword_1ECD84FF8 = 0;
      }
    }
    nw::object::__description_def_instance = (uint64_t)nw::object::class_def::register_method_def(qword_1ECD85060, (uint64_t)nw::object::_description, 0);
    qword_1ECD85060 = v2;
  }
}

void __cxx_global_var_init_1_50250()
{
  unsigned __int8 v0;
  unsigned __int8 v1;
  uint64_t v2;

  {
    if ((v1 & 1) == 0)
    {
      {
        nw::object::_class(void)::instance = (uint64_t)"object";
        *(_QWORD *)algn_1ECD84F58 = 6;
        xmmword_1ECD84F60 = 0u;
        unk_1ECD84F70 = 0u;
        xmmword_1ECD84F80 = 0u;
        *(_OWORD *)&qword_1ECD84F90 = 0u;
        *(__int128 *)((char *)&xmmword_1ECD84F98 + 8) = 0u;
        *(_OWORD *)&qword_1ECD84FB0 = 0u;
        xmmword_1ECD84FC0 = 0u;
        unk_1ECD84FD0 = 0u;
        qword_1ECD84FE0 = (uint64_t)&qword_1ECD84FE0;
        unk_1ECD84FE8 = &qword_1ECD84FE0;
        qword_1ECD84FF0 = 0;
        dword_1ECD84FF8 = 0;
      }
    }
    nw::object::__redacted_description_def_instance = (uint64_t)nw::object::class_def::register_method_def(qword_1ECD85048, (uint64_t)nw::object::_redacted_description, 0);
    qword_1ECD85048 = v2;
  }
}

void __cxx_global_var_init_2_50251()
{
  unsigned __int8 v0;
  unsigned __int8 v1;
  uint64_t v2;

  {
    if ((v1 & 1) == 0)
    {
      {
        nw::object::_class(void)::instance = (uint64_t)"object";
        *(_QWORD *)algn_1ECD84F58 = 6;
        xmmword_1ECD84F60 = 0u;
        unk_1ECD84F70 = 0u;
        xmmword_1ECD84F80 = 0u;
        *(_OWORD *)&qword_1ECD84F90 = 0u;
        *(__int128 *)((char *)&xmmword_1ECD84F98 + 8) = 0u;
        *(_OWORD *)&qword_1ECD84FB0 = 0u;
        xmmword_1ECD84FC0 = 0u;
        unk_1ECD84FD0 = 0u;
        qword_1ECD84FE0 = (uint64_t)&qword_1ECD84FE0;
        unk_1ECD84FE8 = &qword_1ECD84FE0;
        qword_1ECD84FF0 = 0;
        dword_1ECD84FF8 = 0;
      }
    }
    nw::object::__destroy_def_instance = (uint64_t)nw::object::class_def::register_method_def(qword_1ECD85030, (uint64_t)nw::object::_destroy, 0);
    qword_1ECD85030 = v2;
  }
}

void __cxx_global_var_init_51498()
{
  unsigned __int8 v0;
  unsigned __int8 v1;
  uint64_t v2;

  {
    if ((v1 & 1) == 0)
    {
      {
        nw::object::_class(void)::instance = (uint64_t)"object";
        *(_QWORD *)algn_1ECD84F58 = 6;
        xmmword_1ECD84F60 = 0u;
        unk_1ECD84F70 = 0u;
        xmmword_1ECD84F80 = 0u;
        *(_OWORD *)&qword_1ECD84F90 = 0u;
        *(__int128 *)((char *)&xmmword_1ECD84F98 + 8) = 0u;
        *(_OWORD *)&qword_1ECD84FB0 = 0u;
        xmmword_1ECD84FC0 = 0u;
        unk_1ECD84FD0 = 0u;
        qword_1ECD84FE0 = (uint64_t)&qword_1ECD84FE0;
        unk_1ECD84FE8 = &qword_1ECD84FE0;
        qword_1ECD84FF0 = 0;
        dword_1ECD84FF8 = 0;
      }
    }
    nw::object::__description_def_instance = (uint64_t)nw::object::class_def::register_method_def(qword_1ECD85060, (uint64_t)nw::object::_description, 0);
    qword_1ECD85060 = v2;
  }
}

void __cxx_global_var_init_1_51499()
{
  unsigned __int8 v0;
  unsigned __int8 v1;
  uint64_t v2;

  {
    if ((v1 & 1) == 0)
    {
      {
        nw::object::_class(void)::instance = (uint64_t)"object";
        *(_QWORD *)algn_1ECD84F58 = 6;
        xmmword_1ECD84F60 = 0u;
        unk_1ECD84F70 = 0u;
        xmmword_1ECD84F80 = 0u;
        *(_OWORD *)&qword_1ECD84F90 = 0u;
        *(__int128 *)((char *)&xmmword_1ECD84F98 + 8) = 0u;
        *(_OWORD *)&qword_1ECD84FB0 = 0u;
        xmmword_1ECD84FC0 = 0u;
        unk_1ECD84FD0 = 0u;
        qword_1ECD84FE0 = (uint64_t)&qword_1ECD84FE0;
        unk_1ECD84FE8 = &qword_1ECD84FE0;
        qword_1ECD84FF0 = 0;
        dword_1ECD84FF8 = 0;
      }
    }
    nw::object::__redacted_description_def_instance = (uint64_t)nw::object::class_def::register_method_def(qword_1ECD85048, (uint64_t)nw::object::_redacted_description, 0);
    qword_1ECD85048 = v2;
  }
}

void __cxx_global_var_init_2_51500()
{
  unsigned __int8 v0;
  unsigned __int8 v1;
  uint64_t v2;

  {
    if ((v1 & 1) == 0)
    {
      {
        nw::object::_class(void)::instance = (uint64_t)"object";
        *(_QWORD *)algn_1ECD84F58 = 6;
        xmmword_1ECD84F60 = 0u;
        unk_1ECD84F70 = 0u;
        xmmword_1ECD84F80 = 0u;
        *(_OWORD *)&qword_1ECD84F90 = 0u;
        *(__int128 *)((char *)&xmmword_1ECD84F98 + 8) = 0u;
        *(_OWORD *)&qword_1ECD84FB0 = 0u;
        xmmword_1ECD84FC0 = 0u;
        unk_1ECD84FD0 = 0u;
        qword_1ECD84FE0 = (uint64_t)&qword_1ECD84FE0;
        unk_1ECD84FE8 = &qword_1ECD84FE0;
        qword_1ECD84FF0 = 0;
        dword_1ECD84FF8 = 0;
      }
    }
    nw::object::__destroy_def_instance = (uint64_t)nw::object::class_def::register_method_def(qword_1ECD85030, (uint64_t)nw::object::_destroy, 0);
    qword_1ECD85030 = v2;
  }
}

void __cxx_global_var_init_51635()
{
  unsigned __int8 v0;
  unsigned __int8 v1;
  uint64_t v2;

  {
    if ((v1 & 1) == 0)
    {
      {
        nw::object::_class(void)::instance = (uint64_t)"object";
        *(_QWORD *)algn_1ECD84F58 = 6;
        xmmword_1ECD84F60 = 0u;
        unk_1ECD84F70 = 0u;
        xmmword_1ECD84F80 = 0u;
        *(_OWORD *)&qword_1ECD84F90 = 0u;
        *(__int128 *)((char *)&xmmword_1ECD84F98 + 8) = 0u;
        *(_OWORD *)&qword_1ECD84FB0 = 0u;
        xmmword_1ECD84FC0 = 0u;
        unk_1ECD84FD0 = 0u;
        qword_1ECD84FE0 = (uint64_t)&qword_1ECD84FE0;
        unk_1ECD84FE8 = &qword_1ECD84FE0;
        qword_1ECD84FF0 = 0;
        dword_1ECD84FF8 = 0;
      }
    }
    nw::object::__description_def_instance = (uint64_t)nw::object::class_def::register_method_def(qword_1ECD85060, (uint64_t)nw::object::_description, 0);
    qword_1ECD85060 = v2;
  }
}

void __cxx_global_var_init_1_51636()
{
  unsigned __int8 v0;
  unsigned __int8 v1;
  uint64_t v2;

  {
    if ((v1 & 1) == 0)
    {
      {
        nw::object::_class(void)::instance = (uint64_t)"object";
        *(_QWORD *)algn_1ECD84F58 = 6;
        xmmword_1ECD84F60 = 0u;
        unk_1ECD84F70 = 0u;
        xmmword_1ECD84F80 = 0u;
        *(_OWORD *)&qword_1ECD84F90 = 0u;
        *(__int128 *)((char *)&xmmword_1ECD84F98 + 8) = 0u;
        *(_OWORD *)&qword_1ECD84FB0 = 0u;
        xmmword_1ECD84FC0 = 0u;
        unk_1ECD84FD0 = 0u;
        qword_1ECD84FE0 = (uint64_t)&qword_1ECD84FE0;
        unk_1ECD84FE8 = &qword_1ECD84FE0;
        qword_1ECD84FF0 = 0;
        dword_1ECD84FF8 = 0;
      }
    }
    nw::object::__redacted_description_def_instance = (uint64_t)nw::object::class_def::register_method_def(qword_1ECD85048, (uint64_t)nw::object::_redacted_description, 0);
    qword_1ECD85048 = v2;
  }
}

void __cxx_global_var_init_2_51637()
{
  unsigned __int8 v0;
  unsigned __int8 v1;
  uint64_t v2;

  {
    if ((v1 & 1) == 0)
    {
      {
        nw::object::_class(void)::instance = (uint64_t)"object";
        *(_QWORD *)algn_1ECD84F58 = 6;
        xmmword_1ECD84F60 = 0u;
        unk_1ECD84F70 = 0u;
        xmmword_1ECD84F80 = 0u;
        *(_OWORD *)&qword_1ECD84F90 = 0u;
        *(__int128 *)((char *)&xmmword_1ECD84F98 + 8) = 0u;
        *(_OWORD *)&qword_1ECD84FB0 = 0u;
        xmmword_1ECD84FC0 = 0u;
        unk_1ECD84FD0 = 0u;
        qword_1ECD84FE0 = (uint64_t)&qword_1ECD84FE0;
        unk_1ECD84FE8 = &qword_1ECD84FE0;
        qword_1ECD84FF0 = 0;
        dword_1ECD84FF8 = 0;
      }
    }
    nw::object::__destroy_def_instance = (uint64_t)nw::object::class_def::register_method_def(qword_1ECD85030, (uint64_t)nw::object::_destroy, 0);
    qword_1ECD85030 = v2;
  }
}

void __cxx_global_var_init_52004()
{
  unsigned __int8 v0;
  unsigned __int8 v1;
  uint64_t v2;

  {
    if ((v1 & 1) == 0)
    {
      {
        nw::object::_class(void)::instance = (uint64_t)"object";
        *(_QWORD *)algn_1ECD84F58 = 6;
        xmmword_1ECD84F60 = 0u;
        unk_1ECD84F70 = 0u;
        xmmword_1ECD84F80 = 0u;
        *(_OWORD *)&qword_1ECD84F90 = 0u;
        *(__int128 *)((char *)&xmmword_1ECD84F98 + 8) = 0u;
        *(_OWORD *)&qword_1ECD84FB0 = 0u;
        xmmword_1ECD84FC0 = 0u;
        unk_1ECD84FD0 = 0u;
        qword_1ECD84FE0 = (uint64_t)&qword_1ECD84FE0;
        unk_1ECD84FE8 = &qword_1ECD84FE0;
        qword_1ECD84FF0 = 0;
        dword_1ECD84FF8 = 0;
      }
    }
    nw::object::__description_def_instance = (uint64_t)nw::object::class_def::register_method_def(qword_1ECD85060, (uint64_t)nw::object::_description, 0);
    qword_1ECD85060 = v2;
  }
}

void __cxx_global_var_init_1_52005()
{
  unsigned __int8 v0;
  unsigned __int8 v1;
  uint64_t v2;

  {
    if ((v1 & 1) == 0)
    {
      {
        nw::object::_class(void)::instance = (uint64_t)"object";
        *(_QWORD *)algn_1ECD84F58 = 6;
        xmmword_1ECD84F60 = 0u;
        unk_1ECD84F70 = 0u;
        xmmword_1ECD84F80 = 0u;
        *(_OWORD *)&qword_1ECD84F90 = 0u;
        *(__int128 *)((char *)&xmmword_1ECD84F98 + 8) = 0u;
        *(_OWORD *)&qword_1ECD84FB0 = 0u;
        xmmword_1ECD84FC0 = 0u;
        unk_1ECD84FD0 = 0u;
        qword_1ECD84FE0 = (uint64_t)&qword_1ECD84FE0;
        unk_1ECD84FE8 = &qword_1ECD84FE0;
        qword_1ECD84FF0 = 0;
        dword_1ECD84FF8 = 0;
      }
    }
    nw::object::__redacted_description_def_instance = (uint64_t)nw::object::class_def::register_method_def(qword_1ECD85048, (uint64_t)nw::object::_redacted_description, 0);
    qword_1ECD85048 = v2;
  }
}

void __cxx_global_var_init_2_52006()
{
  unsigned __int8 v0;
  unsigned __int8 v1;
  uint64_t v2;

  {
    if ((v1 & 1) == 0)
    {
      {
        nw::object::_class(void)::instance = (uint64_t)"object";
        *(_QWORD *)algn_1ECD84F58 = 6;
        xmmword_1ECD84F60 = 0u;
        unk_1ECD84F70 = 0u;
        xmmword_1ECD84F80 = 0u;
        *(_OWORD *)&qword_1ECD84F90 = 0u;
        *(__int128 *)((char *)&xmmword_1ECD84F98 + 8) = 0u;
        *(_OWORD *)&qword_1ECD84FB0 = 0u;
        xmmword_1ECD84FC0 = 0u;
        unk_1ECD84FD0 = 0u;
        qword_1ECD84FE0 = (uint64_t)&qword_1ECD84FE0;
        unk_1ECD84FE8 = &qword_1ECD84FE0;
        qword_1ECD84FF0 = 0;
        dword_1ECD84FF8 = 0;
      }
    }
    nw::object::__destroy_def_instance = (uint64_t)nw::object::class_def::register_method_def(qword_1ECD85030, (uint64_t)nw::object::_destroy, 0);
    qword_1ECD85030 = v2;
  }
}

void __cxx_global_var_init_52732()
{
  unsigned __int8 v0;
  unsigned __int8 v1;
  uint64_t v2;

  {
    if ((v1 & 1) == 0)
    {
      {
        nw::object::_class(void)::instance = (uint64_t)"object";
        *(_QWORD *)algn_1ECD84F58 = 6;
        xmmword_1ECD84F60 = 0u;
        unk_1ECD84F70 = 0u;
        xmmword_1ECD84F80 = 0u;
        *(_OWORD *)&qword_1ECD84F90 = 0u;
        *(__int128 *)((char *)&xmmword_1ECD84F98 + 8) = 0u;
        *(_OWORD *)&qword_1ECD84FB0 = 0u;
        xmmword_1ECD84FC0 = 0u;
        unk_1ECD84FD0 = 0u;
        qword_1ECD84FE0 = (uint64_t)&qword_1ECD84FE0;
        unk_1ECD84FE8 = &qword_1ECD84FE0;
        qword_1ECD84FF0 = 0;
        dword_1ECD84FF8 = 0;
      }
    }
    nw::object::__description_def_instance = (uint64_t)nw::object::class_def::register_method_def(qword_1ECD85060, (uint64_t)nw::object::_description, 0);
    qword_1ECD85060 = v2;
  }
}

void __cxx_global_var_init_1_52733()
{
  unsigned __int8 v0;
  unsigned __int8 v1;
  uint64_t v2;

  {
    if ((v1 & 1) == 0)
    {
      {
        nw::object::_class(void)::instance = (uint64_t)"object";
        *(_QWORD *)algn_1ECD84F58 = 6;
        xmmword_1ECD84F60 = 0u;
        unk_1ECD84F70 = 0u;
        xmmword_1ECD84F80 = 0u;
        *(_OWORD *)&qword_1ECD84F90 = 0u;
        *(__int128 *)((char *)&xmmword_1ECD84F98 + 8) = 0u;
        *(_OWORD *)&qword_1ECD84FB0 = 0u;
        xmmword_1ECD84FC0 = 0u;
        unk_1ECD84FD0 = 0u;
        qword_1ECD84FE0 = (uint64_t)&qword_1ECD84FE0;
        unk_1ECD84FE8 = &qword_1ECD84FE0;
        qword_1ECD84FF0 = 0;
        dword_1ECD84FF8 = 0;
      }
    }
    nw::object::__redacted_description_def_instance = (uint64_t)nw::object::class_def::register_method_def(qword_1ECD85048, (uint64_t)nw::object::_redacted_description, 0);
    qword_1ECD85048 = v2;
  }
}

void __cxx_global_var_init_2_52734()
{
  unsigned __int8 v0;
  unsigned __int8 v1;
  uint64_t v2;

  {
    if ((v1 & 1) == 0)
    {
      {
        nw::object::_class(void)::instance = (uint64_t)"object";
        *(_QWORD *)algn_1ECD84F58 = 6;
        xmmword_1ECD84F60 = 0u;
        unk_1ECD84F70 = 0u;
        xmmword_1ECD84F80 = 0u;
        *(_OWORD *)&qword_1ECD84F90 = 0u;
        *(__int128 *)((char *)&xmmword_1ECD84F98 + 8) = 0u;
        *(_OWORD *)&qword_1ECD84FB0 = 0u;
        xmmword_1ECD84FC0 = 0u;
        unk_1ECD84FD0 = 0u;
        qword_1ECD84FE0 = (uint64_t)&qword_1ECD84FE0;
        unk_1ECD84FE8 = &qword_1ECD84FE0;
        qword_1ECD84FF0 = 0;
        dword_1ECD84FF8 = 0;
      }
    }
    nw::object::__destroy_def_instance = (uint64_t)nw::object::class_def::register_method_def(qword_1ECD85030, (uint64_t)nw::object::_destroy, 0);
    qword_1ECD85030 = v2;
  }
}

void __cxx_global_var_init_54009()
{
  unsigned __int8 v0;
  unsigned __int8 v1;
  uint64_t v2;

  {
    if ((v1 & 1) == 0)
    {
      {
        nw::object::_class(void)::instance = (uint64_t)"object";
        *(_QWORD *)algn_1ECD84F58 = 6;
        xmmword_1ECD84F60 = 0u;
        unk_1ECD84F70 = 0u;
        xmmword_1ECD84F80 = 0u;
        *(_OWORD *)&qword_1ECD84F90 = 0u;
        *(__int128 *)((char *)&xmmword_1ECD84F98 + 8) = 0u;
        *(_OWORD *)&qword_1ECD84FB0 = 0u;
        xmmword_1ECD84FC0 = 0u;
        unk_1ECD84FD0 = 0u;
        qword_1ECD84FE0 = (uint64_t)&qword_1ECD84FE0;
        unk_1ECD84FE8 = &qword_1ECD84FE0;
        qword_1ECD84FF0 = 0;
        dword_1ECD84FF8 = 0;
      }
    }
    nw::object::__description_def_instance = (uint64_t)nw::object::class_def::register_method_def(qword_1ECD85060, (uint64_t)nw::object::_description, 0);
    qword_1ECD85060 = v2;
  }
}

void __cxx_global_var_init_1_54010()
{
  unsigned __int8 v0;
  unsigned __int8 v1;
  uint64_t v2;

  {
    if ((v1 & 1) == 0)
    {
      {
        nw::object::_class(void)::instance = (uint64_t)"object";
        *(_QWORD *)algn_1ECD84F58 = 6;
        xmmword_1ECD84F60 = 0u;
        unk_1ECD84F70 = 0u;
        xmmword_1ECD84F80 = 0u;
        *(_OWORD *)&qword_1ECD84F90 = 0u;
        *(__int128 *)((char *)&xmmword_1ECD84F98 + 8) = 0u;
        *(_OWORD *)&qword_1ECD84FB0 = 0u;
        xmmword_1ECD84FC0 = 0u;
        unk_1ECD84FD0 = 0u;
        qword_1ECD84FE0 = (uint64_t)&qword_1ECD84FE0;
        unk_1ECD84FE8 = &qword_1ECD84FE0;
        qword_1ECD84FF0 = 0;
        dword_1ECD84FF8 = 0;
      }
    }
    nw::object::__redacted_description_def_instance = (uint64_t)nw::object::class_def::register_method_def(qword_1ECD85048, (uint64_t)nw::object::_redacted_description, 0);
    qword_1ECD85048 = v2;
  }
}

void __cxx_global_var_init_2_54011()
{
  unsigned __int8 v0;
  unsigned __int8 v1;
  uint64_t v2;

  {
    if ((v1 & 1) == 0)
    {
      {
        nw::object::_class(void)::instance = (uint64_t)"object";
        *(_QWORD *)algn_1ECD84F58 = 6;
        xmmword_1ECD84F60 = 0u;
        unk_1ECD84F70 = 0u;
        xmmword_1ECD84F80 = 0u;
        *(_OWORD *)&qword_1ECD84F90 = 0u;
        *(__int128 *)((char *)&xmmword_1ECD84F98 + 8) = 0u;
        *(_OWORD *)&qword_1ECD84FB0 = 0u;
        xmmword_1ECD84FC0 = 0u;
        unk_1ECD84FD0 = 0u;
        qword_1ECD84FE0 = (uint64_t)&qword_1ECD84FE0;
        unk_1ECD84FE8 = &qword_1ECD84FE0;
        qword_1ECD84FF0 = 0;
        dword_1ECD84FF8 = 0;
      }
    }
    nw::object::__destroy_def_instance = (uint64_t)nw::object::class_def::register_method_def(qword_1ECD85030, (uint64_t)nw::object::_destroy, 0);
    qword_1ECD85030 = v2;
  }
}

void __cxx_global_var_init_54882()
{
  unsigned __int8 v0;
  unsigned __int8 v1;
  uint64_t v2;

  {
    if ((v1 & 1) == 0)
    {
      {
        nw::object::_class(void)::instance = (uint64_t)"object";
        *(_QWORD *)algn_1ECD84F58 = 6;
        xmmword_1ECD84F60 = 0u;
        unk_1ECD84F70 = 0u;
        xmmword_1ECD84F80 = 0u;
        *(_OWORD *)&qword_1ECD84F90 = 0u;
        *(__int128 *)((char *)&xmmword_1ECD84F98 + 8) = 0u;
        *(_OWORD *)&qword_1ECD84FB0 = 0u;
        xmmword_1ECD84FC0 = 0u;
        unk_1ECD84FD0 = 0u;
        qword_1ECD84FE0 = (uint64_t)&qword_1ECD84FE0;
        unk_1ECD84FE8 = &qword_1ECD84FE0;
        qword_1ECD84FF0 = 0;
        dword_1ECD84FF8 = 0;
      }
    }
    nw::object::__description_def_instance = (uint64_t)nw::object::class_def::register_method_def(qword_1ECD85060, (uint64_t)nw::object::_description, 0);
    qword_1ECD85060 = v2;
  }
}

void __cxx_global_var_init_1_54883()
{
  unsigned __int8 v0;
  unsigned __int8 v1;
  uint64_t v2;

  {
    if ((v1 & 1) == 0)
    {
      {
        nw::object::_class(void)::instance = (uint64_t)"object";
        *(_QWORD *)algn_1ECD84F58 = 6;
        xmmword_1ECD84F60 = 0u;
        unk_1ECD84F70 = 0u;
        xmmword_1ECD84F80 = 0u;
        *(_OWORD *)&qword_1ECD84F90 = 0u;
        *(__int128 *)((char *)&xmmword_1ECD84F98 + 8) = 0u;
        *(_OWORD *)&qword_1ECD84FB0 = 0u;
        xmmword_1ECD84FC0 = 0u;
        unk_1ECD84FD0 = 0u;
        qword_1ECD84FE0 = (uint64_t)&qword_1ECD84FE0;
        unk_1ECD84FE8 = &qword_1ECD84FE0;
        qword_1ECD84FF0 = 0;
        dword_1ECD84FF8 = 0;
      }
    }
    nw::object::__redacted_description_def_instance = (uint64_t)nw::object::class_def::register_method_def(qword_1ECD85048, (uint64_t)nw::object::_redacted_description, 0);
    qword_1ECD85048 = v2;
  }
}

void __cxx_global_var_init_2_54884()
{
  unsigned __int8 v0;
  unsigned __int8 v1;
  uint64_t v2;

  {
    if ((v1 & 1) == 0)
    {
      {
        nw::object::_class(void)::instance = (uint64_t)"object";
        *(_QWORD *)algn_1ECD84F58 = 6;
        xmmword_1ECD84F60 = 0u;
        unk_1ECD84F70 = 0u;
        xmmword_1ECD84F80 = 0u;
        *(_OWORD *)&qword_1ECD84F90 = 0u;
        *(__int128 *)((char *)&xmmword_1ECD84F98 + 8) = 0u;
        *(_OWORD *)&qword_1ECD84FB0 = 0u;
        xmmword_1ECD84FC0 = 0u;
        unk_1ECD84FD0 = 0u;
        qword_1ECD84FE0 = (uint64_t)&qword_1ECD84FE0;
        unk_1ECD84FE8 = &qword_1ECD84FE0;
        qword_1ECD84FF0 = 0;
        dword_1ECD84FF8 = 0;
      }
    }
    nw::object::__destroy_def_instance = (uint64_t)nw::object::class_def::register_method_def(qword_1ECD85030, (uint64_t)nw::object::_destroy, 0);
    qword_1ECD85030 = v2;
  }
}

void __cxx_global_var_init_56325()
{
  unsigned __int8 v0;
  unsigned __int8 v1;
  uint64_t v2;

  {
    if ((v1 & 1) == 0)
    {
      {
        nw::object::_class(void)::instance = (uint64_t)"object";
        *(_QWORD *)algn_1ECD84F58 = 6;
        xmmword_1ECD84F60 = 0u;
        unk_1ECD84F70 = 0u;
        xmmword_1ECD84F80 = 0u;
        *(_OWORD *)&qword_1ECD84F90 = 0u;
        *(__int128 *)((char *)&xmmword_1ECD84F98 + 8) = 0u;
        *(_OWORD *)&qword_1ECD84FB0 = 0u;
        xmmword_1ECD84FC0 = 0u;
        unk_1ECD84FD0 = 0u;
        qword_1ECD84FE0 = (uint64_t)&qword_1ECD84FE0;
        unk_1ECD84FE8 = &qword_1ECD84FE0;
        qword_1ECD84FF0 = 0;
        dword_1ECD84FF8 = 0;
      }
    }
    nw::object::__description_def_instance = (uint64_t)nw::object::class_def::register_method_def(qword_1ECD85060, (uint64_t)nw::object::_description, 0);
    qword_1ECD85060 = v2;
  }
}

void __cxx_global_var_init_1_56326()
{
  unsigned __int8 v0;
  unsigned __int8 v1;
  uint64_t v2;

  {
    if ((v1 & 1) == 0)
    {
      {
        nw::object::_class(void)::instance = (uint64_t)"object";
        *(_QWORD *)algn_1ECD84F58 = 6;
        xmmword_1ECD84F60 = 0u;
        unk_1ECD84F70 = 0u;
        xmmword_1ECD84F80 = 0u;
        *(_OWORD *)&qword_1ECD84F90 = 0u;
        *(__int128 *)((char *)&xmmword_1ECD84F98 + 8) = 0u;
        *(_OWORD *)&qword_1ECD84FB0 = 0u;
        xmmword_1ECD84FC0 = 0u;
        unk_1ECD84FD0 = 0u;
        qword_1ECD84FE0 = (uint64_t)&qword_1ECD84FE0;
        unk_1ECD84FE8 = &qword_1ECD84FE0;
        qword_1ECD84FF0 = 0;
        dword_1ECD84FF8 = 0;
      }
    }
    nw::object::__redacted_description_def_instance = (uint64_t)nw::object::class_def::register_method_def(qword_1ECD85048, (uint64_t)nw::object::_redacted_description, 0);
    qword_1ECD85048 = v2;
  }
}

void __cxx_global_var_init_2_56327()
{
  unsigned __int8 v0;
  unsigned __int8 v1;
  uint64_t v2;

  {
    if ((v1 & 1) == 0)
    {
      {
        nw::object::_class(void)::instance = (uint64_t)"object";
        *(_QWORD *)algn_1ECD84F58 = 6;
        xmmword_1ECD84F60 = 0u;
        unk_1ECD84F70 = 0u;
        xmmword_1ECD84F80 = 0u;
        *(_OWORD *)&qword_1ECD84F90 = 0u;
        *(__int128 *)((char *)&xmmword_1ECD84F98 + 8) = 0u;
        *(_OWORD *)&qword_1ECD84FB0 = 0u;
        xmmword_1ECD84FC0 = 0u;
        unk_1ECD84FD0 = 0u;
        qword_1ECD84FE0 = (uint64_t)&qword_1ECD84FE0;
        unk_1ECD84FE8 = &qword_1ECD84FE0;
        qword_1ECD84FF0 = 0;
        dword_1ECD84FF8 = 0;
      }
    }
    nw::object::__destroy_def_instance = (uint64_t)nw::object::class_def::register_method_def(qword_1ECD85030, (uint64_t)nw::object::_destroy, 0);
    qword_1ECD85030 = v2;
  }
}

void __cxx_global_var_init_56839()
{
  unsigned __int8 v0;
  unsigned __int8 v1;
  uint64_t v2;

  {
    if ((v1 & 1) == 0)
    {
      {
        nw::object::_class(void)::instance = (uint64_t)"object";
        *(_QWORD *)algn_1ECD84F58 = 6;
        xmmword_1ECD84F60 = 0u;
        unk_1ECD84F70 = 0u;
        xmmword_1ECD84F80 = 0u;
        *(_OWORD *)&qword_1ECD84F90 = 0u;
        *(__int128 *)((char *)&xmmword_1ECD84F98 + 8) = 0u;
        *(_OWORD *)&qword_1ECD84FB0 = 0u;
        xmmword_1ECD84FC0 = 0u;
        unk_1ECD84FD0 = 0u;
        qword_1ECD84FE0 = (uint64_t)&qword_1ECD84FE0;
        unk_1ECD84FE8 = &qword_1ECD84FE0;
        qword_1ECD84FF0 = 0;
        dword_1ECD84FF8 = 0;
      }
    }
    nw::object::__description_def_instance = (uint64_t)nw::object::class_def::register_method_def(qword_1ECD85060, (uint64_t)nw::object::_description, 0);
    qword_1ECD85060 = v2;
  }
}

void __cxx_global_var_init_1_56840()
{
  unsigned __int8 v0;
  unsigned __int8 v1;
  uint64_t v2;

  {
    if ((v1 & 1) == 0)
    {
      {
        nw::object::_class(void)::instance = (uint64_t)"object";
        *(_QWORD *)algn_1ECD84F58 = 6;
        xmmword_1ECD84F60 = 0u;
        unk_1ECD84F70 = 0u;
        xmmword_1ECD84F80 = 0u;
        *(_OWORD *)&qword_1ECD84F90 = 0u;
        *(__int128 *)((char *)&xmmword_1ECD84F98 + 8) = 0u;
        *(_OWORD *)&qword_1ECD84FB0 = 0u;
        xmmword_1ECD84FC0 = 0u;
        unk_1ECD84FD0 = 0u;
        qword_1ECD84FE0 = (uint64_t)&qword_1ECD84FE0;
        unk_1ECD84FE8 = &qword_1ECD84FE0;
        qword_1ECD84FF0 = 0;
        dword_1ECD84FF8 = 0;
      }
    }
    nw::object::__redacted_description_def_instance = (uint64_t)nw::object::class_def::register_method_def(qword_1ECD85048, (uint64_t)nw::object::_redacted_description, 0);
    qword_1ECD85048 = v2;
  }
}

void __cxx_global_var_init_2_56841()
{
  unsigned __int8 v0;
  unsigned __int8 v1;
  uint64_t v2;

  {
    if ((v1 & 1) == 0)
    {
      {
        nw::object::_class(void)::instance = (uint64_t)"object";
        *(_QWORD *)algn_1ECD84F58 = 6;
        xmmword_1ECD84F60 = 0u;
        unk_1ECD84F70 = 0u;
        xmmword_1ECD84F80 = 0u;
        *(_OWORD *)&qword_1ECD84F90 = 0u;
        *(__int128 *)((char *)&xmmword_1ECD84F98 + 8) = 0u;
        *(_OWORD *)&qword_1ECD84FB0 = 0u;
        xmmword_1ECD84FC0 = 0u;
        unk_1ECD84FD0 = 0u;
        qword_1ECD84FE0 = (uint64_t)&qword_1ECD84FE0;
        unk_1ECD84FE8 = &qword_1ECD84FE0;
        qword_1ECD84FF0 = 0;
        dword_1ECD84FF8 = 0;
      }
    }
    nw::object::__destroy_def_instance = (uint64_t)nw::object::class_def::register_method_def(qword_1ECD85030, (uint64_t)nw::object::_destroy, 0);
    qword_1ECD85030 = v2;
  }
}

void __cxx_global_var_init_57159()
{
  unsigned __int8 v0;
  unsigned __int8 v1;
  uint64_t v2;

  {
    if ((v1 & 1) == 0)
    {
      {
        nw::object::_class(void)::instance = (uint64_t)"object";
        *(_QWORD *)algn_1ECD84F58 = 6;
        xmmword_1ECD84F60 = 0u;
        unk_1ECD84F70 = 0u;
        xmmword_1ECD84F80 = 0u;
        *(_OWORD *)&qword_1ECD84F90 = 0u;
        *(__int128 *)((char *)&xmmword_1ECD84F98 + 8) = 0u;
        *(_OWORD *)&qword_1ECD84FB0 = 0u;
        xmmword_1ECD84FC0 = 0u;
        unk_1ECD84FD0 = 0u;
        qword_1ECD84FE0 = (uint64_t)&qword_1ECD84FE0;
        unk_1ECD84FE8 = &qword_1ECD84FE0;
        qword_1ECD84FF0 = 0;
        dword_1ECD84FF8 = 0;
      }
    }
    nw::object::__description_def_instance = (uint64_t)nw::object::class_def::register_method_def(qword_1ECD85060, (uint64_t)nw::object::_description, 0);
    qword_1ECD85060 = v2;
  }
}

void __cxx_global_var_init_1_57160()
{
  unsigned __int8 v0;
  unsigned __int8 v1;
  uint64_t v2;

  {
    if ((v1 & 1) == 0)
    {
      {
        nw::object::_class(void)::instance = (uint64_t)"object";
        *(_QWORD *)algn_1ECD84F58 = 6;
        xmmword_1ECD84F60 = 0u;
        unk_1ECD84F70 = 0u;
        xmmword_1ECD84F80 = 0u;
        *(_OWORD *)&qword_1ECD84F90 = 0u;
        *(__int128 *)((char *)&xmmword_1ECD84F98 + 8) = 0u;
        *(_OWORD *)&qword_1ECD84FB0 = 0u;
        xmmword_1ECD84FC0 = 0u;
        unk_1ECD84FD0 = 0u;
        qword_1ECD84FE0 = (uint64_t)&qword_1ECD84FE0;
        unk_1ECD84FE8 = &qword_1ECD84FE0;
        qword_1ECD84FF0 = 0;
        dword_1ECD84FF8 = 0;
      }
    }
    nw::object::__redacted_description_def_instance = (uint64_t)nw::object::class_def::register_method_def(qword_1ECD85048, (uint64_t)nw::object::_redacted_description, 0);
    qword_1ECD85048 = v2;
  }
}

void __cxx_global_var_init_2_57161()
{
  unsigned __int8 v0;
  unsigned __int8 v1;
  uint64_t v2;

  {
    if ((v1 & 1) == 0)
    {
      {
        nw::object::_class(void)::instance = (uint64_t)"object";
        *(_QWORD *)algn_1ECD84F58 = 6;
        xmmword_1ECD84F60 = 0u;
        unk_1ECD84F70 = 0u;
        xmmword_1ECD84F80 = 0u;
        *(_OWORD *)&qword_1ECD84F90 = 0u;
        *(__int128 *)((char *)&xmmword_1ECD84F98 + 8) = 0u;
        *(_OWORD *)&qword_1ECD84FB0 = 0u;
        xmmword_1ECD84FC0 = 0u;
        unk_1ECD84FD0 = 0u;
        qword_1ECD84FE0 = (uint64_t)&qword_1ECD84FE0;
        unk_1ECD84FE8 = &qword_1ECD84FE0;
        qword_1ECD84FF0 = 0;
        dword_1ECD84FF8 = 0;
      }
    }
    nw::object::__destroy_def_instance = (uint64_t)nw::object::class_def::register_method_def(qword_1ECD85030, (uint64_t)nw::object::_destroy, 0);
    qword_1ECD85030 = v2;
  }
}

void __cxx_global_var_init_58138()
{
  unsigned __int8 v0;
  unsigned __int8 v1;
  uint64_t v2;

  {
    if ((v1 & 1) == 0)
    {
      {
        nw::object::_class(void)::instance = (uint64_t)"object";
        *(_QWORD *)algn_1ECD84F58 = 6;
        xmmword_1ECD84F60 = 0u;
        unk_1ECD84F70 = 0u;
        xmmword_1ECD84F80 = 0u;
        *(_OWORD *)&qword_1ECD84F90 = 0u;
        *(__int128 *)((char *)&xmmword_1ECD84F98 + 8) = 0u;
        *(_OWORD *)&qword_1ECD84FB0 = 0u;
        xmmword_1ECD84FC0 = 0u;
        unk_1ECD84FD0 = 0u;
        qword_1ECD84FE0 = (uint64_t)&qword_1ECD84FE0;
        unk_1ECD84FE8 = &qword_1ECD84FE0;
        qword_1ECD84FF0 = 0;
        dword_1ECD84FF8 = 0;
      }
    }
    nw::object::__description_def_instance = (uint64_t)nw::object::class_def::register_method_def(qword_1ECD85060, (uint64_t)nw::object::_description, 0);
    qword_1ECD85060 = v2;
  }
}

void __cxx_global_var_init_1_58139()
{
  unsigned __int8 v0;
  unsigned __int8 v1;
  uint64_t v2;

  {
    if ((v1 & 1) == 0)
    {
      {
        nw::object::_class(void)::instance = (uint64_t)"object";
        *(_QWORD *)algn_1ECD84F58 = 6;
        xmmword_1ECD84F60 = 0u;
        unk_1ECD84F70 = 0u;
        xmmword_1ECD84F80 = 0u;
        *(_OWORD *)&qword_1ECD84F90 = 0u;
        *(__int128 *)((char *)&xmmword_1ECD84F98 + 8) = 0u;
        *(_OWORD *)&qword_1ECD84FB0 = 0u;
        xmmword_1ECD84FC0 = 0u;
        unk_1ECD84FD0 = 0u;
        qword_1ECD84FE0 = (uint64_t)&qword_1ECD84FE0;
        unk_1ECD84FE8 = &qword_1ECD84FE0;
        qword_1ECD84FF0 = 0;
        dword_1ECD84FF8 = 0;
      }
    }
    nw::object::__redacted_description_def_instance = (uint64_t)nw::object::class_def::register_method_def(qword_1ECD85048, (uint64_t)nw::object::_redacted_description, 0);
    qword_1ECD85048 = v2;
  }
}

void __cxx_global_var_init_2_58140()
{
  unsigned __int8 v0;
  unsigned __int8 v1;
  uint64_t v2;

  {
    if ((v1 & 1) == 0)
    {
      {
        nw::object::_class(void)::instance = (uint64_t)"object";
        *(_QWORD *)algn_1ECD84F58 = 6;
        xmmword_1ECD84F60 = 0u;
        unk_1ECD84F70 = 0u;
        xmmword_1ECD84F80 = 0u;
        *(_OWORD *)&qword_1ECD84F90 = 0u;
        *(__int128 *)((char *)&xmmword_1ECD84F98 + 8) = 0u;
        *(_OWORD *)&qword_1ECD84FB0 = 0u;
        xmmword_1ECD84FC0 = 0u;
        unk_1ECD84FD0 = 0u;
        qword_1ECD84FE0 = (uint64_t)&qword_1ECD84FE0;
        unk_1ECD84FE8 = &qword_1ECD84FE0;
        qword_1ECD84FF0 = 0;
        dword_1ECD84FF8 = 0;
      }
    }
    nw::object::__destroy_def_instance = (uint64_t)nw::object::class_def::register_method_def(qword_1ECD85030, (uint64_t)nw::object::_destroy, 0);
    qword_1ECD85030 = v2;
  }
}

void __cxx_global_var_init_59422()
{
  unsigned __int8 v0;
  unsigned __int8 v1;
  uint64_t v2;

  {
    if ((v1 & 1) == 0)
    {
      {
        nw::object::_class(void)::instance = (uint64_t)"object";
        *(_QWORD *)algn_1ECD84F58 = 6;
        xmmword_1ECD84F60 = 0u;
        unk_1ECD84F70 = 0u;
        xmmword_1ECD84F80 = 0u;
        *(_OWORD *)&qword_1ECD84F90 = 0u;
        *(__int128 *)((char *)&xmmword_1ECD84F98 + 8) = 0u;
        *(_OWORD *)&qword_1ECD84FB0 = 0u;
        xmmword_1ECD84FC0 = 0u;
        unk_1ECD84FD0 = 0u;
        qword_1ECD84FE0 = (uint64_t)&qword_1ECD84FE0;
        unk_1ECD84FE8 = &qword_1ECD84FE0;
        qword_1ECD84FF0 = 0;
        dword_1ECD84FF8 = 0;
      }
    }
    nw::object::__description_def_instance = (uint64_t)nw::object::class_def::register_method_def(qword_1ECD85060, (uint64_t)nw::object::_description, 0);
    qword_1ECD85060 = v2;
  }
}

void __cxx_global_var_init_1_59423()
{
  unsigned __int8 v0;
  unsigned __int8 v1;
  uint64_t v2;

  {
    if ((v1 & 1) == 0)
    {
      {
        nw::object::_class(void)::instance = (uint64_t)"object";
        *(_QWORD *)algn_1ECD84F58 = 6;
        xmmword_1ECD84F60 = 0u;
        unk_1ECD84F70 = 0u;
        xmmword_1ECD84F80 = 0u;
        *(_OWORD *)&qword_1ECD84F90 = 0u;
        *(__int128 *)((char *)&xmmword_1ECD84F98 + 8) = 0u;
        *(_OWORD *)&qword_1ECD84FB0 = 0u;
        xmmword_1ECD84FC0 = 0u;
        unk_1ECD84FD0 = 0u;
        qword_1ECD84FE0 = (uint64_t)&qword_1ECD84FE0;
        unk_1ECD84FE8 = &qword_1ECD84FE0;
        qword_1ECD84FF0 = 0;
        dword_1ECD84FF8 = 0;
      }
    }
    nw::object::__redacted_description_def_instance = (uint64_t)nw::object::class_def::register_method_def(qword_1ECD85048, (uint64_t)nw::object::_redacted_description, 0);
    qword_1ECD85048 = v2;
  }
}

void __cxx_global_var_init_2_59424()
{
  unsigned __int8 v0;
  unsigned __int8 v1;
  uint64_t v2;

  {
    if ((v1 & 1) == 0)
    {
      {
        nw::object::_class(void)::instance = (uint64_t)"object";
        *(_QWORD *)algn_1ECD84F58 = 6;
        xmmword_1ECD84F60 = 0u;
        unk_1ECD84F70 = 0u;
        xmmword_1ECD84F80 = 0u;
        *(_OWORD *)&qword_1ECD84F90 = 0u;
        *(__int128 *)((char *)&xmmword_1ECD84F98 + 8) = 0u;
        *(_OWORD *)&qword_1ECD84FB0 = 0u;
        xmmword_1ECD84FC0 = 0u;
        unk_1ECD84FD0 = 0u;
        qword_1ECD84FE0 = (uint64_t)&qword_1ECD84FE0;
        unk_1ECD84FE8 = &qword_1ECD84FE0;
        qword_1ECD84FF0 = 0;
        dword_1ECD84FF8 = 0;
      }
    }
    nw::object::__destroy_def_instance = (uint64_t)nw::object::class_def::register_method_def(qword_1ECD85030, (uint64_t)nw::object::_destroy, 0);
    qword_1ECD85030 = v2;
  }
}

void __cxx_global_var_init_59756()
{
  unsigned __int8 v0;
  unsigned __int8 v1;
  uint64_t v2;

  {
    if ((v1 & 1) == 0)
    {
      {
        nw::object::_class(void)::instance = (uint64_t)"object";
        *(_QWORD *)algn_1ECD84F58 = 6;
        xmmword_1ECD84F60 = 0u;
        unk_1ECD84F70 = 0u;
        xmmword_1ECD84F80 = 0u;
        *(_OWORD *)&qword_1ECD84F90 = 0u;
        *(__int128 *)((char *)&xmmword_1ECD84F98 + 8) = 0u;
        *(_OWORD *)&qword_1ECD84FB0 = 0u;
        xmmword_1ECD84FC0 = 0u;
        unk_1ECD84FD0 = 0u;
        qword_1ECD84FE0 = (uint64_t)&qword_1ECD84FE0;
        unk_1ECD84FE8 = &qword_1ECD84FE0;
        qword_1ECD84FF0 = 0;
        dword_1ECD84FF8 = 0;
      }
    }
    nw::object::__description_def_instance = (uint64_t)nw::object::class_def::register_method_def(qword_1ECD85060, (uint64_t)nw::object::_description, 0);
    qword_1ECD85060 = v2;
  }
}

void __cxx_global_var_init_1_59757()
{
  unsigned __int8 v0;
  unsigned __int8 v1;
  uint64_t v2;

  {
    if ((v1 & 1) == 0)
    {
      {
        nw::object::_class(void)::instance = (uint64_t)"object";
        *(_QWORD *)algn_1ECD84F58 = 6;
        xmmword_1ECD84F60 = 0u;
        unk_1ECD84F70 = 0u;
        xmmword_1ECD84F80 = 0u;
        *(_OWORD *)&qword_1ECD84F90 = 0u;
        *(__int128 *)((char *)&xmmword_1ECD84F98 + 8) = 0u;
        *(_OWORD *)&qword_1ECD84FB0 = 0u;
        xmmword_1ECD84FC0 = 0u;
        unk_1ECD84FD0 = 0u;
        qword_1ECD84FE0 = (uint64_t)&qword_1ECD84FE0;
        unk_1ECD84FE8 = &qword_1ECD84FE0;
        qword_1ECD84FF0 = 0;
        dword_1ECD84FF8 = 0;
      }
    }
    nw::object::__redacted_description_def_instance = (uint64_t)nw::object::class_def::register_method_def(qword_1ECD85048, (uint64_t)nw::object::_redacted_description, 0);
    qword_1ECD85048 = v2;
  }
}

void __cxx_global_var_init_2_59758()
{
  unsigned __int8 v0;
  unsigned __int8 v1;
  uint64_t v2;

  {
    if ((v1 & 1) == 0)
    {
      {
        nw::object::_class(void)::instance = (uint64_t)"object";
        *(_QWORD *)algn_1ECD84F58 = 6;
        xmmword_1ECD84F60 = 0u;
        unk_1ECD84F70 = 0u;
        xmmword_1ECD84F80 = 0u;
        *(_OWORD *)&qword_1ECD84F90 = 0u;
        *(__int128 *)((char *)&xmmword_1ECD84F98 + 8) = 0u;
        *(_OWORD *)&qword_1ECD84FB0 = 0u;
        xmmword_1ECD84FC0 = 0u;
        unk_1ECD84FD0 = 0u;
        qword_1ECD84FE0 = (uint64_t)&qword_1ECD84FE0;
        unk_1ECD84FE8 = &qword_1ECD84FE0;
        qword_1ECD84FF0 = 0;
        dword_1ECD84FF8 = 0;
      }
    }
    nw::object::__destroy_def_instance = (uint64_t)nw::object::class_def::register_method_def(qword_1ECD85030, (uint64_t)nw::object::_destroy, 0);
    qword_1ECD85030 = v2;
  }
}

void __cxx_global_var_init_59793()
{
  unsigned __int8 v0;
  unsigned __int8 v1;
  uint64_t v2;

  {
    if ((v1 & 1) == 0)
    {
      {
        nw::object::_class(void)::instance = (uint64_t)"object";
        *(_QWORD *)algn_1ECD84F58 = 6;
        xmmword_1ECD84F60 = 0u;
        unk_1ECD84F70 = 0u;
        xmmword_1ECD84F80 = 0u;
        *(_OWORD *)&qword_1ECD84F90 = 0u;
        *(__int128 *)((char *)&xmmword_1ECD84F98 + 8) = 0u;
        *(_OWORD *)&qword_1ECD84FB0 = 0u;
        xmmword_1ECD84FC0 = 0u;
        unk_1ECD84FD0 = 0u;
        qword_1ECD84FE0 = (uint64_t)&qword_1ECD84FE0;
        unk_1ECD84FE8 = &qword_1ECD84FE0;
        qword_1ECD84FF0 = 0;
        dword_1ECD84FF8 = 0;
      }
    }
    nw::object::__description_def_instance = (uint64_t)nw::object::class_def::register_method_def(qword_1ECD85060, (uint64_t)nw::object::_description, 0);
    qword_1ECD85060 = v2;
  }
}

void __cxx_global_var_init_1_59794()
{
  unsigned __int8 v0;
  unsigned __int8 v1;
  uint64_t v2;

  {
    if ((v1 & 1) == 0)
    {
      {
        nw::object::_class(void)::instance = (uint64_t)"object";
        *(_QWORD *)algn_1ECD84F58 = 6;
        xmmword_1ECD84F60 = 0u;
        unk_1ECD84F70 = 0u;
        xmmword_1ECD84F80 = 0u;
        *(_OWORD *)&qword_1ECD84F90 = 0u;
        *(__int128 *)((char *)&xmmword_1ECD84F98 + 8) = 0u;
        *(_OWORD *)&qword_1ECD84FB0 = 0u;
        xmmword_1ECD84FC0 = 0u;
        unk_1ECD84FD0 = 0u;
        qword_1ECD84FE0 = (uint64_t)&qword_1ECD84FE0;
        unk_1ECD84FE8 = &qword_1ECD84FE0;
        qword_1ECD84FF0 = 0;
        dword_1ECD84FF8 = 0;
      }
    }
    nw::object::__redacted_description_def_instance = (uint64_t)nw::object::class_def::register_method_def(qword_1ECD85048, (uint64_t)nw::object::_redacted_description, 0);
    qword_1ECD85048 = v2;
  }
}

void __cxx_global_var_init_2_59795()
{
  unsigned __int8 v0;
  unsigned __int8 v1;
  uint64_t v2;

  {
    if ((v1 & 1) == 0)
    {
      {
        nw::object::_class(void)::instance = (uint64_t)"object";
        *(_QWORD *)algn_1ECD84F58 = 6;
        xmmword_1ECD84F60 = 0u;
        unk_1ECD84F70 = 0u;
        xmmword_1ECD84F80 = 0u;
        *(_OWORD *)&qword_1ECD84F90 = 0u;
        *(__int128 *)((char *)&xmmword_1ECD84F98 + 8) = 0u;
        *(_OWORD *)&qword_1ECD84FB0 = 0u;
        xmmword_1ECD84FC0 = 0u;
        unk_1ECD84FD0 = 0u;
        qword_1ECD84FE0 = (uint64_t)&qword_1ECD84FE0;
        unk_1ECD84FE8 = &qword_1ECD84FE0;
        qword_1ECD84FF0 = 0;
        dword_1ECD84FF8 = 0;
      }
    }
    nw::object::__destroy_def_instance = (uint64_t)nw::object::class_def::register_method_def(qword_1ECD85030, (uint64_t)nw::object::_destroy, 0);
    qword_1ECD85030 = v2;
  }
}

void __cxx_global_var_init_59979()
{
  unsigned __int8 v0;
  unsigned __int8 v1;
  uint64_t v2;

  {
    if ((v1 & 1) == 0)
    {
      {
        nw::object::_class(void)::instance = (uint64_t)"object";
        *(_QWORD *)algn_1ECD84F58 = 6;
        xmmword_1ECD84F60 = 0u;
        unk_1ECD84F70 = 0u;
        xmmword_1ECD84F80 = 0u;
        *(_OWORD *)&qword_1ECD84F90 = 0u;
        *(__int128 *)((char *)&xmmword_1ECD84F98 + 8) = 0u;
        *(_OWORD *)&qword_1ECD84FB0 = 0u;
        xmmword_1ECD84FC0 = 0u;
        unk_1ECD84FD0 = 0u;
        qword_1ECD84FE0 = (uint64_t)&qword_1ECD84FE0;
        unk_1ECD84FE8 = &qword_1ECD84FE0;
        qword_1ECD84FF0 = 0;
        dword_1ECD84FF8 = 0;
      }
    }
    nw::object::__description_def_instance = (uint64_t)nw::object::class_def::register_method_def(qword_1ECD85060, (uint64_t)nw::object::_description, 0);
    qword_1ECD85060 = v2;
  }
}

void __cxx_global_var_init_1_59980()
{
  unsigned __int8 v0;
  unsigned __int8 v1;
  uint64_t v2;

  {
    if ((v1 & 1) == 0)
    {
      {
        nw::object::_class(void)::instance = (uint64_t)"object";
        *(_QWORD *)algn_1ECD84F58 = 6;
        xmmword_1ECD84F60 = 0u;
        unk_1ECD84F70 = 0u;
        xmmword_1ECD84F80 = 0u;
        *(_OWORD *)&qword_1ECD84F90 = 0u;
        *(__int128 *)((char *)&xmmword_1ECD84F98 + 8) = 0u;
        *(_OWORD *)&qword_1ECD84FB0 = 0u;
        xmmword_1ECD84FC0 = 0u;
        unk_1ECD84FD0 = 0u;
        qword_1ECD84FE0 = (uint64_t)&qword_1ECD84FE0;
        unk_1ECD84FE8 = &qword_1ECD84FE0;
        qword_1ECD84FF0 = 0;
        dword_1ECD84FF8 = 0;
      }
    }
    nw::object::__redacted_description_def_instance = (uint64_t)nw::object::class_def::register_method_def(qword_1ECD85048, (uint64_t)nw::object::_redacted_description, 0);
    qword_1ECD85048 = v2;
  }
}

void __cxx_global_var_init_2_59981()
{
  unsigned __int8 v0;
  unsigned __int8 v1;
  uint64_t v2;

  {
    if ((v1 & 1) == 0)
    {
      {
        nw::object::_class(void)::instance = (uint64_t)"object";
        *(_QWORD *)algn_1ECD84F58 = 6;
        xmmword_1ECD84F60 = 0u;
        unk_1ECD84F70 = 0u;
        xmmword_1ECD84F80 = 0u;
        *(_OWORD *)&qword_1ECD84F90 = 0u;
        *(__int128 *)((char *)&xmmword_1ECD84F98 + 8) = 0u;
        *(_OWORD *)&qword_1ECD84FB0 = 0u;
        xmmword_1ECD84FC0 = 0u;
        unk_1ECD84FD0 = 0u;
        qword_1ECD84FE0 = (uint64_t)&qword_1ECD84FE0;
        unk_1ECD84FE8 = &qword_1ECD84FE0;
        qword_1ECD84FF0 = 0;
        dword_1ECD84FF8 = 0;
      }
    }
    nw::object::__destroy_def_instance = (uint64_t)nw::object::class_def::register_method_def(qword_1ECD85030, (uint64_t)nw::object::_destroy, 0);
    qword_1ECD85030 = v2;
  }
}

void __cxx_global_var_init_62054()
{
  unsigned __int8 v0;
  unsigned __int8 v1;
  uint64_t v2;

  {
    if ((v1 & 1) == 0)
    {
      {
        nw::object::_class(void)::instance = (uint64_t)"object";
        *(_QWORD *)algn_1ECD84F58 = 6;
        xmmword_1ECD84F60 = 0u;
        unk_1ECD84F70 = 0u;
        xmmword_1ECD84F80 = 0u;
        *(_OWORD *)&qword_1ECD84F90 = 0u;
        *(__int128 *)((char *)&xmmword_1ECD84F98 + 8) = 0u;
        *(_OWORD *)&qword_1ECD84FB0 = 0u;
        xmmword_1ECD84FC0 = 0u;
        unk_1ECD84FD0 = 0u;
        qword_1ECD84FE0 = (uint64_t)&qword_1ECD84FE0;
        unk_1ECD84FE8 = &qword_1ECD84FE0;
        qword_1ECD84FF0 = 0;
        dword_1ECD84FF8 = 0;
      }
    }
    nw::object::__description_def_instance = (uint64_t)nw::object::class_def::register_method_def(qword_1ECD85060, (uint64_t)nw::object::_description, 0);
    qword_1ECD85060 = v2;
  }
}

void __cxx_global_var_init_1_62055()
{
  unsigned __int8 v0;
  unsigned __int8 v1;
  uint64_t v2;

  {
    if ((v1 & 1) == 0)
    {
      {
        nw::object::_class(void)::instance = (uint64_t)"object";
        *(_QWORD *)algn_1ECD84F58 = 6;
        xmmword_1ECD84F60 = 0u;
        unk_1ECD84F70 = 0u;
        xmmword_1ECD84F80 = 0u;
        *(_OWORD *)&qword_1ECD84F90 = 0u;
        *(__int128 *)((char *)&xmmword_1ECD84F98 + 8) = 0u;
        *(_OWORD *)&qword_1ECD84FB0 = 0u;
        xmmword_1ECD84FC0 = 0u;
        unk_1ECD84FD0 = 0u;
        qword_1ECD84FE0 = (uint64_t)&qword_1ECD84FE0;
        unk_1ECD84FE8 = &qword_1ECD84FE0;
        qword_1ECD84FF0 = 0;
        dword_1ECD84FF8 = 0;
      }
    }
    nw::object::__redacted_description_def_instance = (uint64_t)nw::object::class_def::register_method_def(qword_1ECD85048, (uint64_t)nw::object::_redacted_description, 0);
    qword_1ECD85048 = v2;
  }
}

void __cxx_global_var_init_2_62056()
{
  unsigned __int8 v0;
  unsigned __int8 v1;
  uint64_t v2;

  {
    if ((v1 & 1) == 0)
    {
      {
        nw::object::_class(void)::instance = (uint64_t)"object";
        *(_QWORD *)algn_1ECD84F58 = 6;
        xmmword_1ECD84F60 = 0u;
        unk_1ECD84F70 = 0u;
        xmmword_1ECD84F80 = 0u;
        *(_OWORD *)&qword_1ECD84F90 = 0u;
        *(__int128 *)((char *)&xmmword_1ECD84F98 + 8) = 0u;
        *(_OWORD *)&qword_1ECD84FB0 = 0u;
        xmmword_1ECD84FC0 = 0u;
        unk_1ECD84FD0 = 0u;
        qword_1ECD84FE0 = (uint64_t)&qword_1ECD84FE0;
        unk_1ECD84FE8 = &qword_1ECD84FE0;
        qword_1ECD84FF0 = 0;
        dword_1ECD84FF8 = 0;
      }
    }
    nw::object::__destroy_def_instance = (uint64_t)nw::object::class_def::register_method_def(qword_1ECD85030, (uint64_t)nw::object::_destroy, 0);
    qword_1ECD85030 = v2;
  }
}

void __cxx_global_var_init_62175()
{
  unsigned __int8 v0;
  unsigned __int8 v1;
  uint64_t v2;

  {
    if ((v1 & 1) == 0)
    {
      {
        nw::object::_class(void)::instance = (uint64_t)"object";
        *(_QWORD *)algn_1ECD84F58 = 6;
        xmmword_1ECD84F60 = 0u;
        unk_1ECD84F70 = 0u;
        xmmword_1ECD84F80 = 0u;
        *(_OWORD *)&qword_1ECD84F90 = 0u;
        *(__int128 *)((char *)&xmmword_1ECD84F98 + 8) = 0u;
        *(_OWORD *)&qword_1ECD84FB0 = 0u;
        xmmword_1ECD84FC0 = 0u;
        unk_1ECD84FD0 = 0u;
        qword_1ECD84FE0 = (uint64_t)&qword_1ECD84FE0;
        unk_1ECD84FE8 = &qword_1ECD84FE0;
        qword_1ECD84FF0 = 0;
        dword_1ECD84FF8 = 0;
      }
    }
    nw::object::__description_def_instance = (uint64_t)nw::object::class_def::register_method_def(qword_1ECD85060, (uint64_t)nw::object::_description, 0);
    qword_1ECD85060 = v2;
  }
}

void __cxx_global_var_init_1_62176()
{
  unsigned __int8 v0;
  unsigned __int8 v1;
  uint64_t v2;

  {
    if ((v1 & 1) == 0)
    {
      {
        nw::object::_class(void)::instance = (uint64_t)"object";
        *(_QWORD *)algn_1ECD84F58 = 6;
        xmmword_1ECD84F60 = 0u;
        unk_1ECD84F70 = 0u;
        xmmword_1ECD84F80 = 0u;
        *(_OWORD *)&qword_1ECD84F90 = 0u;
        *(__int128 *)((char *)&xmmword_1ECD84F98 + 8) = 0u;
        *(_OWORD *)&qword_1ECD84FB0 = 0u;
        xmmword_1ECD84FC0 = 0u;
        unk_1ECD84FD0 = 0u;
        qword_1ECD84FE0 = (uint64_t)&qword_1ECD84FE0;
        unk_1ECD84FE8 = &qword_1ECD84FE0;
        qword_1ECD84FF0 = 0;
        dword_1ECD84FF8 = 0;
      }
    }
    nw::object::__redacted_description_def_instance = (uint64_t)nw::object::class_def::register_method_def(qword_1ECD85048, (uint64_t)nw::object::_redacted_description, 0);
    qword_1ECD85048 = v2;
  }
}

void __cxx_global_var_init_2_62177()
{
  unsigned __int8 v0;
  unsigned __int8 v1;
  uint64_t v2;

  {
    if ((v1 & 1) == 0)
    {
      {
        nw::object::_class(void)::instance = (uint64_t)"object";
        *(_QWORD *)algn_1ECD84F58 = 6;
        xmmword_1ECD84F60 = 0u;
        unk_1ECD84F70 = 0u;
        xmmword_1ECD84F80 = 0u;
        *(_OWORD *)&qword_1ECD84F90 = 0u;
        *(__int128 *)((char *)&xmmword_1ECD84F98 + 8) = 0u;
        *(_OWORD *)&qword_1ECD84FB0 = 0u;
        xmmword_1ECD84FC0 = 0u;
        unk_1ECD84FD0 = 0u;
        qword_1ECD84FE0 = (uint64_t)&qword_1ECD84FE0;
        unk_1ECD84FE8 = &qword_1ECD84FE0;
        qword_1ECD84FF0 = 0;
        dword_1ECD84FF8 = 0;
      }
    }
    nw::object::__destroy_def_instance = (uint64_t)nw::object::class_def::register_method_def(qword_1ECD85030, (uint64_t)nw::object::_destroy, 0);
    qword_1ECD85030 = v2;
  }
}

void __cxx_global_var_init_62536()
{
  unsigned __int8 v0;
  unsigned __int8 v1;
  uint64_t v2;

  {
    if ((v1 & 1) == 0)
    {
      {
        nw::object::_class(void)::instance = (uint64_t)"object";
        *(_QWORD *)algn_1ECD84F58 = 6;
        xmmword_1ECD84F60 = 0u;
        unk_1ECD84F70 = 0u;
        xmmword_1ECD84F80 = 0u;
        *(_OWORD *)&qword_1ECD84F90 = 0u;
        *(__int128 *)((char *)&xmmword_1ECD84F98 + 8) = 0u;
        *(_OWORD *)&qword_1ECD84FB0 = 0u;
        xmmword_1ECD84FC0 = 0u;
        unk_1ECD84FD0 = 0u;
        qword_1ECD84FE0 = (uint64_t)&qword_1ECD84FE0;
        unk_1ECD84FE8 = &qword_1ECD84FE0;
        qword_1ECD84FF0 = 0;
        dword_1ECD84FF8 = 0;
      }
    }
    nw::object::__description_def_instance = (uint64_t)nw::object::class_def::register_method_def(qword_1ECD85060, (uint64_t)nw::object::_description, 0);
    qword_1ECD85060 = v2;
  }
}

void __cxx_global_var_init_1_62537()
{
  unsigned __int8 v0;
  unsigned __int8 v1;
  uint64_t v2;

  {
    if ((v1 & 1) == 0)
    {
      {
        nw::object::_class(void)::instance = (uint64_t)"object";
        *(_QWORD *)algn_1ECD84F58 = 6;
        xmmword_1ECD84F60 = 0u;
        unk_1ECD84F70 = 0u;
        xmmword_1ECD84F80 = 0u;
        *(_OWORD *)&qword_1ECD84F90 = 0u;
        *(__int128 *)((char *)&xmmword_1ECD84F98 + 8) = 0u;
        *(_OWORD *)&qword_1ECD84FB0 = 0u;
        xmmword_1ECD84FC0 = 0u;
        unk_1ECD84FD0 = 0u;
        qword_1ECD84FE0 = (uint64_t)&qword_1ECD84FE0;
        unk_1ECD84FE8 = &qword_1ECD84FE0;
        qword_1ECD84FF0 = 0;
        dword_1ECD84FF8 = 0;
      }
    }
    nw::object::__redacted_description_def_instance = (uint64_t)nw::object::class_def::register_method_def(qword_1ECD85048, (uint64_t)nw::object::_redacted_description, 0);
    qword_1ECD85048 = v2;
  }
}

void __cxx_global_var_init_2_62538()
{
  unsigned __int8 v0;
  unsigned __int8 v1;
  uint64_t v2;

  {
    if ((v1 & 1) == 0)
    {
      {
        nw::object::_class(void)::instance = (uint64_t)"object";
        *(_QWORD *)algn_1ECD84F58 = 6;
        xmmword_1ECD84F60 = 0u;
        unk_1ECD84F70 = 0u;
        xmmword_1ECD84F80 = 0u;
        *(_OWORD *)&qword_1ECD84F90 = 0u;
        *(__int128 *)((char *)&xmmword_1ECD84F98 + 8) = 0u;
        *(_OWORD *)&qword_1ECD84FB0 = 0u;
        xmmword_1ECD84FC0 = 0u;
        unk_1ECD84FD0 = 0u;
        qword_1ECD84FE0 = (uint64_t)&qword_1ECD84FE0;
        unk_1ECD84FE8 = &qword_1ECD84FE0;
        qword_1ECD84FF0 = 0;
        dword_1ECD84FF8 = 0;
      }
    }
    nw::object::__destroy_def_instance = (uint64_t)nw::object::class_def::register_method_def(qword_1ECD85030, (uint64_t)nw::object::_destroy, 0);
    qword_1ECD85030 = v2;
  }
}

void __cxx_global_var_init_62688()
{
  unsigned __int8 v0;
  unsigned __int8 v1;
  uint64_t v2;

  {
    if ((v1 & 1) == 0)
    {
      {
        nw::object::_class(void)::instance = (uint64_t)"object";
        *(_QWORD *)algn_1ECD84F58 = 6;
        xmmword_1ECD84F60 = 0u;
        unk_1ECD84F70 = 0u;
        xmmword_1ECD84F80 = 0u;
        *(_OWORD *)&qword_1ECD84F90 = 0u;
        *(__int128 *)((char *)&xmmword_1ECD84F98 + 8) = 0u;
        *(_OWORD *)&qword_1ECD84FB0 = 0u;
        xmmword_1ECD84FC0 = 0u;
        unk_1ECD84FD0 = 0u;
        qword_1ECD84FE0 = (uint64_t)&qword_1ECD84FE0;
        unk_1ECD84FE8 = &qword_1ECD84FE0;
        qword_1ECD84FF0 = 0;
        dword_1ECD84FF8 = 0;
      }
    }
    nw::object::__description_def_instance = (uint64_t)nw::object::class_def::register_method_def(qword_1ECD85060, (uint64_t)nw::object::_description, 0);
    qword_1ECD85060 = v2;
  }
}

void __cxx_global_var_init_1_62689()
{
  unsigned __int8 v0;
  unsigned __int8 v1;
  uint64_t v2;

  {
    if ((v1 & 1) == 0)
    {
      {
        nw::object::_class(void)::instance = (uint64_t)"object";
        *(_QWORD *)algn_1ECD84F58 = 6;
        xmmword_1ECD84F60 = 0u;
        unk_1ECD84F70 = 0u;
        xmmword_1ECD84F80 = 0u;
        *(_OWORD *)&qword_1ECD84F90 = 0u;
        *(__int128 *)((char *)&xmmword_1ECD84F98 + 8) = 0u;
        *(_OWORD *)&qword_1ECD84FB0 = 0u;
        xmmword_1ECD84FC0 = 0u;
        unk_1ECD84FD0 = 0u;
        qword_1ECD84FE0 = (uint64_t)&qword_1ECD84FE0;
        unk_1ECD84FE8 = &qword_1ECD84FE0;
        qword_1ECD84FF0 = 0;
        dword_1ECD84FF8 = 0;
      }
    }
    nw::object::__redacted_description_def_instance = (uint64_t)nw::object::class_def::register_method_def(qword_1ECD85048, (uint64_t)nw::object::_redacted_description, 0);
    qword_1ECD85048 = v2;
  }
}

void __cxx_global_var_init_2_62690()
{
  unsigned __int8 v0;
  unsigned __int8 v1;
  uint64_t v2;

  {
    if ((v1 & 1) == 0)
    {
      {
        nw::object::_class(void)::instance = (uint64_t)"object";
        *(_QWORD *)algn_1ECD84F58 = 6;
        xmmword_1ECD84F60 = 0u;
        unk_1ECD84F70 = 0u;
        xmmword_1ECD84F80 = 0u;
        *(_OWORD *)&qword_1ECD84F90 = 0u;
        *(__int128 *)((char *)&xmmword_1ECD84F98 + 8) = 0u;
        *(_OWORD *)&qword_1ECD84FB0 = 0u;
        xmmword_1ECD84FC0 = 0u;
        unk_1ECD84FD0 = 0u;
        qword_1ECD84FE0 = (uint64_t)&qword_1ECD84FE0;
        unk_1ECD84FE8 = &qword_1ECD84FE0;
        qword_1ECD84FF0 = 0;
        dword_1ECD84FF8 = 0;
      }
    }
    nw::object::__destroy_def_instance = (uint64_t)nw::object::class_def::register_method_def(qword_1ECD85030, (uint64_t)nw::object::_destroy, 0);
    qword_1ECD85030 = v2;
  }
}

void __cxx_global_var_init_63543()
{
  unsigned __int8 v0;
  unsigned __int8 v1;
  uint64_t v2;

  {
    if ((v1 & 1) == 0)
    {
      {
        nw::object::_class(void)::instance = (uint64_t)"object";
        *(_QWORD *)algn_1ECD84F58 = 6;
        xmmword_1ECD84F60 = 0u;
        unk_1ECD84F70 = 0u;
        xmmword_1ECD84F80 = 0u;
        *(_OWORD *)&qword_1ECD84F90 = 0u;
        *(__int128 *)((char *)&xmmword_1ECD84F98 + 8) = 0u;
        *(_OWORD *)&qword_1ECD84FB0 = 0u;
        xmmword_1ECD84FC0 = 0u;
        unk_1ECD84FD0 = 0u;
        qword_1ECD84FE0 = (uint64_t)&qword_1ECD84FE0;
        unk_1ECD84FE8 = &qword_1ECD84FE0;
        qword_1ECD84FF0 = 0;
        dword_1ECD84FF8 = 0;
      }
    }
    nw::object::__description_def_instance = (uint64_t)nw::object::class_def::register_method_def(qword_1ECD85060, (uint64_t)nw::object::_description, 0);
    qword_1ECD85060 = v2;
  }
}

void __cxx_global_var_init_1_63544()
{
  unsigned __int8 v0;
  unsigned __int8 v1;
  uint64_t v2;

  {
    if ((v1 & 1) == 0)
    {
      {
        nw::object::_class(void)::instance = (uint64_t)"object";
        *(_QWORD *)algn_1ECD84F58 = 6;
        xmmword_1ECD84F60 = 0u;
        unk_1ECD84F70 = 0u;
        xmmword_1ECD84F80 = 0u;
        *(_OWORD *)&qword_1ECD84F90 = 0u;
        *(__int128 *)((char *)&xmmword_1ECD84F98 + 8) = 0u;
        *(_OWORD *)&qword_1ECD84FB0 = 0u;
        xmmword_1ECD84FC0 = 0u;
        unk_1ECD84FD0 = 0u;
        qword_1ECD84FE0 = (uint64_t)&qword_1ECD84FE0;
        unk_1ECD84FE8 = &qword_1ECD84FE0;
        qword_1ECD84FF0 = 0;
        dword_1ECD84FF8 = 0;
      }
    }
    nw::object::__redacted_description_def_instance = (uint64_t)nw::object::class_def::register_method_def(qword_1ECD85048, (uint64_t)nw::object::_redacted_description, 0);
    qword_1ECD85048 = v2;
  }
}

void __cxx_global_var_init_2_63545()
{
  unsigned __int8 v0;
  unsigned __int8 v1;
  uint64_t v2;

  {
    if ((v1 & 1) == 0)
    {
      {
        nw::object::_class(void)::instance = (uint64_t)"object";
        *(_QWORD *)algn_1ECD84F58 = 6;
        xmmword_1ECD84F60 = 0u;
        unk_1ECD84F70 = 0u;
        xmmword_1ECD84F80 = 0u;
        *(_OWORD *)&qword_1ECD84F90 = 0u;
        *(__int128 *)((char *)&xmmword_1ECD84F98 + 8) = 0u;
        *(_OWORD *)&qword_1ECD84FB0 = 0u;
        xmmword_1ECD84FC0 = 0u;
        unk_1ECD84FD0 = 0u;
        qword_1ECD84FE0 = (uint64_t)&qword_1ECD84FE0;
        unk_1ECD84FE8 = &qword_1ECD84FE0;
        qword_1ECD84FF0 = 0;
        dword_1ECD84FF8 = 0;
      }
    }
    nw::object::__destroy_def_instance = (uint64_t)nw::object::class_def::register_method_def(qword_1ECD85030, (uint64_t)nw::object::_destroy, 0);
    qword_1ECD85030 = v2;
  }
}

void __cxx_global_var_init_63666()
{
  unsigned __int8 v0;
  unsigned __int8 v1;
  uint64_t v2;

  {
    if ((v1 & 1) == 0)
    {
      {
        nw::object::_class(void)::instance = (uint64_t)"object";
        *(_QWORD *)algn_1ECD84F58 = 6;
        xmmword_1ECD84F60 = 0u;
        unk_1ECD84F70 = 0u;
        xmmword_1ECD84F80 = 0u;
        *(_OWORD *)&qword_1ECD84F90 = 0u;
        *(__int128 *)((char *)&xmmword_1ECD84F98 + 8) = 0u;
        *(_OWORD *)&qword_1ECD84FB0 = 0u;
        xmmword_1ECD84FC0 = 0u;
        unk_1ECD84FD0 = 0u;
        qword_1ECD84FE0 = (uint64_t)&qword_1ECD84FE0;
        unk_1ECD84FE8 = &qword_1ECD84FE0;
        qword_1ECD84FF0 = 0;
        dword_1ECD84FF8 = 0;
      }
    }
    nw::object::__description_def_instance = (uint64_t)nw::object::class_def::register_method_def(qword_1ECD85060, (uint64_t)nw::object::_description, 0);
    qword_1ECD85060 = v2;
  }
}

void __cxx_global_var_init_1_63667()
{
  unsigned __int8 v0;
  unsigned __int8 v1;
  uint64_t v2;

  {
    if ((v1 & 1) == 0)
    {
      {
        nw::object::_class(void)::instance = (uint64_t)"object";
        *(_QWORD *)algn_1ECD84F58 = 6;
        xmmword_1ECD84F60 = 0u;
        unk_1ECD84F70 = 0u;
        xmmword_1ECD84F80 = 0u;
        *(_OWORD *)&qword_1ECD84F90 = 0u;
        *(__int128 *)((char *)&xmmword_1ECD84F98 + 8) = 0u;
        *(_OWORD *)&qword_1ECD84FB0 = 0u;
        xmmword_1ECD84FC0 = 0u;
        unk_1ECD84FD0 = 0u;
        qword_1ECD84FE0 = (uint64_t)&qword_1ECD84FE0;
        unk_1ECD84FE8 = &qword_1ECD84FE0;
        qword_1ECD84FF0 = 0;
        dword_1ECD84FF8 = 0;
      }
    }
    nw::object::__redacted_description_def_instance = (uint64_t)nw::object::class_def::register_method_def(qword_1ECD85048, (uint64_t)nw::object::_redacted_description, 0);
    qword_1ECD85048 = v2;
  }
}

void __cxx_global_var_init_2_63668()
{
  unsigned __int8 v0;
  unsigned __int8 v1;
  uint64_t v2;

  {
    if ((v1 & 1) == 0)
    {
      {
        nw::object::_class(void)::instance = (uint64_t)"object";
        *(_QWORD *)algn_1ECD84F58 = 6;
        xmmword_1ECD84F60 = 0u;
        unk_1ECD84F70 = 0u;
        xmmword_1ECD84F80 = 0u;
        *(_OWORD *)&qword_1ECD84F90 = 0u;
        *(__int128 *)((char *)&xmmword_1ECD84F98 + 8) = 0u;
        *(_OWORD *)&qword_1ECD84FB0 = 0u;
        xmmword_1ECD84FC0 = 0u;
        unk_1ECD84FD0 = 0u;
        qword_1ECD84FE0 = (uint64_t)&qword_1ECD84FE0;
        unk_1ECD84FE8 = &qword_1ECD84FE0;
        qword_1ECD84FF0 = 0;
        dword_1ECD84FF8 = 0;
      }
    }
    nw::object::__destroy_def_instance = (uint64_t)nw::object::class_def::register_method_def(qword_1ECD85030, (uint64_t)nw::object::_destroy, 0);
    qword_1ECD85030 = v2;
  }
}

void __cxx_global_var_init_65148()
{
  unsigned __int8 v0;
  unsigned __int8 v1;
  uint64_t v2;

  {
    if ((v1 & 1) == 0)
    {
      {
        nw::object::_class(void)::instance = (uint64_t)"object";
        *(_QWORD *)algn_1ECD84F58 = 6;
        xmmword_1ECD84F60 = 0u;
        unk_1ECD84F70 = 0u;
        xmmword_1ECD84F80 = 0u;
        *(_OWORD *)&qword_1ECD84F90 = 0u;
        *(__int128 *)((char *)&xmmword_1ECD84F98 + 8) = 0u;
        *(_OWORD *)&qword_1ECD84FB0 = 0u;
        xmmword_1ECD84FC0 = 0u;
        unk_1ECD84FD0 = 0u;
        qword_1ECD84FE0 = (uint64_t)&qword_1ECD84FE0;
        unk_1ECD84FE8 = &qword_1ECD84FE0;
        qword_1ECD84FF0 = 0;
        dword_1ECD84FF8 = 0;
      }
    }
    nw::object::__description_def_instance = (uint64_t)nw::object::class_def::register_method_def(qword_1ECD85060, (uint64_t)nw::object::_description, 0);
    qword_1ECD85060 = v2;
  }
}

void __cxx_global_var_init_1_65149()
{
  unsigned __int8 v0;
  unsigned __int8 v1;
  uint64_t v2;

  {
    if ((v1 & 1) == 0)
    {
      {
        nw::object::_class(void)::instance = (uint64_t)"object";
        *(_QWORD *)algn_1ECD84F58 = 6;
        xmmword_1ECD84F60 = 0u;
        unk_1ECD84F70 = 0u;
        xmmword_1ECD84F80 = 0u;
        *(_OWORD *)&qword_1ECD84F90 = 0u;
        *(__int128 *)((char *)&xmmword_1ECD84F98 + 8) = 0u;
        *(_OWORD *)&qword_1ECD84FB0 = 0u;
        xmmword_1ECD84FC0 = 0u;
        unk_1ECD84FD0 = 0u;
        qword_1ECD84FE0 = (uint64_t)&qword_1ECD84FE0;
        unk_1ECD84FE8 = &qword_1ECD84FE0;
        qword_1ECD84FF0 = 0;
        dword_1ECD84FF8 = 0;
      }
    }
    nw::object::__redacted_description_def_instance = (uint64_t)nw::object::class_def::register_method_def(qword_1ECD85048, (uint64_t)nw::object::_redacted_description, 0);
    qword_1ECD85048 = v2;
  }
}

void __cxx_global_var_init_2_65150()
{
  unsigned __int8 v0;
  unsigned __int8 v1;
  uint64_t v2;

  {
    if ((v1 & 1) == 0)
    {
      {
        nw::object::_class(void)::instance = (uint64_t)"object";
        *(_QWORD *)algn_1ECD84F58 = 6;
        xmmword_1ECD84F60 = 0u;
        unk_1ECD84F70 = 0u;
        xmmword_1ECD84F80 = 0u;
        *(_OWORD *)&qword_1ECD84F90 = 0u;
        *(__int128 *)((char *)&xmmword_1ECD84F98 + 8) = 0u;
        *(_OWORD *)&qword_1ECD84FB0 = 0u;
        xmmword_1ECD84FC0 = 0u;
        unk_1ECD84FD0 = 0u;
        qword_1ECD84FE0 = (uint64_t)&qword_1ECD84FE0;
        unk_1ECD84FE8 = &qword_1ECD84FE0;
        qword_1ECD84FF0 = 0;
        dword_1ECD84FF8 = 0;
      }
    }
    nw::object::__destroy_def_instance = (uint64_t)nw::object::class_def::register_method_def(qword_1ECD85030, (uint64_t)nw::object::_destroy, 0);
    qword_1ECD85030 = v2;
  }
}

void __cxx_global_var_init_65929()
{
  unsigned __int8 v0;
  unsigned __int8 v1;
  uint64_t v2;

  {
    if ((v1 & 1) == 0)
    {
      {
        nw::object::_class(void)::instance = (uint64_t)"object";
        *(_QWORD *)algn_1ECD84F58 = 6;
        xmmword_1ECD84F60 = 0u;
        unk_1ECD84F70 = 0u;
        xmmword_1ECD84F80 = 0u;
        *(_OWORD *)&qword_1ECD84F90 = 0u;
        *(__int128 *)((char *)&xmmword_1ECD84F98 + 8) = 0u;
        *(_OWORD *)&qword_1ECD84FB0 = 0u;
        xmmword_1ECD84FC0 = 0u;
        unk_1ECD84FD0 = 0u;
        qword_1ECD84FE0 = (uint64_t)&qword_1ECD84FE0;
        unk_1ECD84FE8 = &qword_1ECD84FE0;
        qword_1ECD84FF0 = 0;
        dword_1ECD84FF8 = 0;
      }
    }
    nw::object::__description_def_instance = (uint64_t)nw::object::class_def::register_method_def(qword_1ECD85060, (uint64_t)nw::object::_description, 0);
    qword_1ECD85060 = v2;
  }
}

void __cxx_global_var_init_1_65930()
{
  unsigned __int8 v0;
  unsigned __int8 v1;
  uint64_t v2;

  {
    if ((v1 & 1) == 0)
    {
      {
        nw::object::_class(void)::instance = (uint64_t)"object";
        *(_QWORD *)algn_1ECD84F58 = 6;
        xmmword_1ECD84F60 = 0u;
        unk_1ECD84F70 = 0u;
        xmmword_1ECD84F80 = 0u;
        *(_OWORD *)&qword_1ECD84F90 = 0u;
        *(__int128 *)((char *)&xmmword_1ECD84F98 + 8) = 0u;
        *(_OWORD *)&qword_1ECD84FB0 = 0u;
        xmmword_1ECD84FC0 = 0u;
        unk_1ECD84FD0 = 0u;
        qword_1ECD84FE0 = (uint64_t)&qword_1ECD84FE0;
        unk_1ECD84FE8 = &qword_1ECD84FE0;
        qword_1ECD84FF0 = 0;
        dword_1ECD84FF8 = 0;
      }
    }
    nw::object::__redacted_description_def_instance = (uint64_t)nw::object::class_def::register_method_def(qword_1ECD85048, (uint64_t)nw::object::_redacted_description, 0);
    qword_1ECD85048 = v2;
  }
}

void __cxx_global_var_init_2_65931()
{
  unsigned __int8 v0;
  unsigned __int8 v1;
  uint64_t v2;

  {
    if ((v1 & 1) == 0)
    {
      {
        nw::object::_class(void)::instance = (uint64_t)"object";
        *(_QWORD *)algn_1ECD84F58 = 6;
        xmmword_1ECD84F60 = 0u;
        unk_1ECD84F70 = 0u;
        xmmword_1ECD84F80 = 0u;
        *(_OWORD *)&qword_1ECD84F90 = 0u;
        *(__int128 *)((char *)&xmmword_1ECD84F98 + 8) = 0u;
        *(_OWORD *)&qword_1ECD84FB0 = 0u;
        xmmword_1ECD84FC0 = 0u;
        unk_1ECD84FD0 = 0u;
        qword_1ECD84FE0 = (uint64_t)&qword_1ECD84FE0;
        unk_1ECD84FE8 = &qword_1ECD84FE0;
        qword_1ECD84FF0 = 0;
        dword_1ECD84FF8 = 0;
      }
    }
    nw::object::__destroy_def_instance = (uint64_t)nw::object::class_def::register_method_def(qword_1ECD85030, (uint64_t)nw::object::_destroy, 0);
    qword_1ECD85030 = v2;
  }
}

void __cxx_global_var_init_66787()
{
  unsigned __int8 v0;
  unsigned __int8 v1;
  uint64_t v2;

  {
    if ((v1 & 1) == 0)
    {
      {
        nw::object::_class(void)::instance = (uint64_t)"object";
        *(_QWORD *)algn_1ECD84F58 = 6;
        xmmword_1ECD84F60 = 0u;
        unk_1ECD84F70 = 0u;
        xmmword_1ECD84F80 = 0u;
        *(_OWORD *)&qword_1ECD84F90 = 0u;
        *(__int128 *)((char *)&xmmword_1ECD84F98 + 8) = 0u;
        *(_OWORD *)&qword_1ECD84FB0 = 0u;
        xmmword_1ECD84FC0 = 0u;
        unk_1ECD84FD0 = 0u;
        qword_1ECD84FE0 = (uint64_t)&qword_1ECD84FE0;
        unk_1ECD84FE8 = &qword_1ECD84FE0;
        qword_1ECD84FF0 = 0;
        dword_1ECD84FF8 = 0;
      }
    }
    nw::object::__description_def_instance = (uint64_t)nw::object::class_def::register_method_def(qword_1ECD85060, (uint64_t)nw::object::_description, 0);
    qword_1ECD85060 = v2;
  }
}

void __cxx_global_var_init_1_66788()
{
  unsigned __int8 v0;
  unsigned __int8 v1;
  uint64_t v2;

  {
    if ((v1 & 1) == 0)
    {
      {
        nw::object::_class(void)::instance = (uint64_t)"object";
        *(_QWORD *)algn_1ECD84F58 = 6;
        xmmword_1ECD84F60 = 0u;
        unk_1ECD84F70 = 0u;
        xmmword_1ECD84F80 = 0u;
        *(_OWORD *)&qword_1ECD84F90 = 0u;
        *(__int128 *)((char *)&xmmword_1ECD84F98 + 8) = 0u;
        *(_OWORD *)&qword_1ECD84FB0 = 0u;
        xmmword_1ECD84FC0 = 0u;
        unk_1ECD84FD0 = 0u;
        qword_1ECD84FE0 = (uint64_t)&qword_1ECD84FE0;
        unk_1ECD84FE8 = &qword_1ECD84FE0;
        qword_1ECD84FF0 = 0;
        dword_1ECD84FF8 = 0;
      }
    }
    nw::object::__redacted_description_def_instance = (uint64_t)nw::object::class_def::register_method_def(qword_1ECD85048, (uint64_t)nw::object::_redacted_description, 0);
    qword_1ECD85048 = v2;
  }
}

void __cxx_global_var_init_2_66789()
{
  unsigned __int8 v0;
  unsigned __int8 v1;
  uint64_t v2;

  {
    if ((v1 & 1) == 0)
    {
      {
        nw::object::_class(void)::instance = (uint64_t)"object";
        *(_QWORD *)algn_1ECD84F58 = 6;
        xmmword_1ECD84F60 = 0u;
        unk_1ECD84F70 = 0u;
        xmmword_1ECD84F80 = 0u;
        *(_OWORD *)&qword_1ECD84F90 = 0u;
        *(__int128 *)((char *)&xmmword_1ECD84F98 + 8) = 0u;
        *(_OWORD *)&qword_1ECD84FB0 = 0u;
        xmmword_1ECD84FC0 = 0u;
        unk_1ECD84FD0 = 0u;
        qword_1ECD84FE0 = (uint64_t)&qword_1ECD84FE0;
        unk_1ECD84FE8 = &qword_1ECD84FE0;
        qword_1ECD84FF0 = 0;
        dword_1ECD84FF8 = 0;
      }
    }
    nw::object::__destroy_def_instance = (uint64_t)nw::object::class_def::register_method_def(qword_1ECD85030, (uint64_t)nw::object::_destroy, 0);
    qword_1ECD85030 = v2;
  }
}

void __cxx_global_var_init_67443()
{
  unsigned __int8 v0;
  unsigned __int8 v1;
  uint64_t v2;

  {
    if ((v1 & 1) == 0)
    {
      {
        nw::object::_class(void)::instance = (uint64_t)"object";
        *(_QWORD *)algn_1ECD84F58 = 6;
        xmmword_1ECD84F60 = 0u;
        unk_1ECD84F70 = 0u;
        xmmword_1ECD84F80 = 0u;
        *(_OWORD *)&qword_1ECD84F90 = 0u;
        *(__int128 *)((char *)&xmmword_1ECD84F98 + 8) = 0u;
        *(_OWORD *)&qword_1ECD84FB0 = 0u;
        xmmword_1ECD84FC0 = 0u;
        unk_1ECD84FD0 = 0u;
        qword_1ECD84FE0 = (uint64_t)&qword_1ECD84FE0;
        unk_1ECD84FE8 = &qword_1ECD84FE0;
        qword_1ECD84FF0 = 0;
        dword_1ECD84FF8 = 0;
      }
    }
    nw::object::__description_def_instance = (uint64_t)nw::object::class_def::register_method_def(qword_1ECD85060, (uint64_t)nw::object::_description, 0);
    qword_1ECD85060 = v2;
  }
}

void __cxx_global_var_init_1_67444()
{
  unsigned __int8 v0;
  unsigned __int8 v1;
  uint64_t v2;

  {
    if ((v1 & 1) == 0)
    {
      {
        nw::object::_class(void)::instance = (uint64_t)"object";
        *(_QWORD *)algn_1ECD84F58 = 6;
        xmmword_1ECD84F60 = 0u;
        unk_1ECD84F70 = 0u;
        xmmword_1ECD84F80 = 0u;
        *(_OWORD *)&qword_1ECD84F90 = 0u;
        *(__int128 *)((char *)&xmmword_1ECD84F98 + 8) = 0u;
        *(_OWORD *)&qword_1ECD84FB0 = 0u;
        xmmword_1ECD84FC0 = 0u;
        unk_1ECD84FD0 = 0u;
        qword_1ECD84FE0 = (uint64_t)&qword_1ECD84FE0;
        unk_1ECD84FE8 = &qword_1ECD84FE0;
        qword_1ECD84FF0 = 0;
        dword_1ECD84FF8 = 0;
      }
    }
    nw::object::__redacted_description_def_instance = (uint64_t)nw::object::class_def::register_method_def(qword_1ECD85048, (uint64_t)nw::object::_redacted_description, 0);
    qword_1ECD85048 = v2;
  }
}

void __cxx_global_var_init_2_67445()
{
  unsigned __int8 v0;
  unsigned __int8 v1;
  uint64_t v2;

  {
    if ((v1 & 1) == 0)
    {
      {
        nw::object::_class(void)::instance = (uint64_t)"object";
        *(_QWORD *)algn_1ECD84F58 = 6;
        xmmword_1ECD84F60 = 0u;
        unk_1ECD84F70 = 0u;
        xmmword_1ECD84F80 = 0u;
        *(_OWORD *)&qword_1ECD84F90 = 0u;
        *(__int128 *)((char *)&xmmword_1ECD84F98 + 8) = 0u;
        *(_OWORD *)&qword_1ECD84FB0 = 0u;
        xmmword_1ECD84FC0 = 0u;
        unk_1ECD84FD0 = 0u;
        qword_1ECD84FE0 = (uint64_t)&qword_1ECD84FE0;
        unk_1ECD84FE8 = &qword_1ECD84FE0;
        qword_1ECD84FF0 = 0;
        dword_1ECD84FF8 = 0;
      }
    }
    nw::object::__destroy_def_instance = (uint64_t)nw::object::class_def::register_method_def(qword_1ECD85030, (uint64_t)nw::object::_destroy, 0);
    qword_1ECD85030 = v2;
  }
}

void __cxx_global_var_init_70340()
{
  unsigned __int8 v0;
  unsigned __int8 v1;
  uint64_t v2;

  {
    if ((v1 & 1) == 0)
    {
      {
        nw::object::_class(void)::instance = (uint64_t)"object";
        *(_QWORD *)algn_1ECD84F58 = 6;
        xmmword_1ECD84F60 = 0u;
        unk_1ECD84F70 = 0u;
        xmmword_1ECD84F80 = 0u;
        *(_OWORD *)&qword_1ECD84F90 = 0u;
        *(__int128 *)((char *)&xmmword_1ECD84F98 + 8) = 0u;
        *(_OWORD *)&qword_1ECD84FB0 = 0u;
        xmmword_1ECD84FC0 = 0u;
        unk_1ECD84FD0 = 0u;
        qword_1ECD84FE0 = (uint64_t)&qword_1ECD84FE0;
        unk_1ECD84FE8 = &qword_1ECD84FE0;
        qword_1ECD84FF0 = 0;
        dword_1ECD84FF8 = 0;
      }
    }
    nw::object::__description_def_instance = (uint64_t)nw::object::class_def::register_method_def(qword_1ECD85060, (uint64_t)nw::object::_description, 0);
    qword_1ECD85060 = v2;
  }
}

void __cxx_global_var_init_1_70341()
{
  unsigned __int8 v0;
  unsigned __int8 v1;
  uint64_t v2;

  {
    if ((v1 & 1) == 0)
    {
      {
        nw::object::_class(void)::instance = (uint64_t)"object";
        *(_QWORD *)algn_1ECD84F58 = 6;
        xmmword_1ECD84F60 = 0u;
        unk_1ECD84F70 = 0u;
        xmmword_1ECD84F80 = 0u;
        *(_OWORD *)&qword_1ECD84F90 = 0u;
        *(__int128 *)((char *)&xmmword_1ECD84F98 + 8) = 0u;
        *(_OWORD *)&qword_1ECD84FB0 = 0u;
        xmmword_1ECD84FC0 = 0u;
        unk_1ECD84FD0 = 0u;
        qword_1ECD84FE0 = (uint64_t)&qword_1ECD84FE0;
        unk_1ECD84FE8 = &qword_1ECD84FE0;
        qword_1ECD84FF0 = 0;
        dword_1ECD84FF8 = 0;
      }
    }
    nw::object::__redacted_description_def_instance = (uint64_t)nw::object::class_def::register_method_def(qword_1ECD85048, (uint64_t)nw::object::_redacted_description, 0);
    qword_1ECD85048 = v2;
  }
}

void __cxx_global_var_init_2_70342()
{
  unsigned __int8 v0;
  unsigned __int8 v1;
  uint64_t v2;

  {
    if ((v1 & 1) == 0)
    {
      {
        nw::object::_class(void)::instance = (uint64_t)"object";
        *(_QWORD *)algn_1ECD84F58 = 6;
        xmmword_1ECD84F60 = 0u;
        unk_1ECD84F70 = 0u;
        xmmword_1ECD84F80 = 0u;
        *(_OWORD *)&qword_1ECD84F90 = 0u;
        *(__int128 *)((char *)&xmmword_1ECD84F98 + 8) = 0u;
        *(_OWORD *)&qword_1ECD84FB0 = 0u;
        xmmword_1ECD84FC0 = 0u;
        unk_1ECD84FD0 = 0u;
        qword_1ECD84FE0 = (uint64_t)&qword_1ECD84FE0;
        unk_1ECD84FE8 = &qword_1ECD84FE0;
        qword_1ECD84FF0 = 0;
        dword_1ECD84FF8 = 0;
      }
    }
    nw::object::__destroy_def_instance = (uint64_t)nw::object::class_def::register_method_def(qword_1ECD85030, (uint64_t)nw::object::_destroy, 0);
    qword_1ECD85030 = v2;
  }
}

void __cxx_global_var_init_70517()
{
  unsigned __int8 v0;
  unsigned __int8 v1;
  uint64_t v2;

  {
    if ((v1 & 1) == 0)
    {
      {
        nw::object::_class(void)::instance = (uint64_t)"object";
        *(_QWORD *)algn_1ECD84F58 = 6;
        xmmword_1ECD84F60 = 0u;
        unk_1ECD84F70 = 0u;
        xmmword_1ECD84F80 = 0u;
        *(_OWORD *)&qword_1ECD84F90 = 0u;
        *(__int128 *)((char *)&xmmword_1ECD84F98 + 8) = 0u;
        *(_OWORD *)&qword_1ECD84FB0 = 0u;
        xmmword_1ECD84FC0 = 0u;
        unk_1ECD84FD0 = 0u;
        qword_1ECD84FE0 = (uint64_t)&qword_1ECD84FE0;
        unk_1ECD84FE8 = &qword_1ECD84FE0;
        qword_1ECD84FF0 = 0;
        dword_1ECD84FF8 = 0;
      }
    }
    nw::object::__description_def_instance = (uint64_t)nw::object::class_def::register_method_def(qword_1ECD85060, (uint64_t)nw::object::_description, 0);
    qword_1ECD85060 = v2;
  }
}

void __cxx_global_var_init_1_70518()
{
  unsigned __int8 v0;
  unsigned __int8 v1;
  uint64_t v2;

  {
    if ((v1 & 1) == 0)
    {
      {
        nw::object::_class(void)::instance = (uint64_t)"object";
        *(_QWORD *)algn_1ECD84F58 = 6;
        xmmword_1ECD84F60 = 0u;
        unk_1ECD84F70 = 0u;
        xmmword_1ECD84F80 = 0u;
        *(_OWORD *)&qword_1ECD84F90 = 0u;
        *(__int128 *)((char *)&xmmword_1ECD84F98 + 8) = 0u;
        *(_OWORD *)&qword_1ECD84FB0 = 0u;
        xmmword_1ECD84FC0 = 0u;
        unk_1ECD84FD0 = 0u;
        qword_1ECD84FE0 = (uint64_t)&qword_1ECD84FE0;
        unk_1ECD84FE8 = &qword_1ECD84FE0;
        qword_1ECD84FF0 = 0;
        dword_1ECD84FF8 = 0;
      }
    }
    nw::object::__redacted_description_def_instance = (uint64_t)nw::object::class_def::register_method_def(qword_1ECD85048, (uint64_t)nw::object::_redacted_description, 0);
    qword_1ECD85048 = v2;
  }
}

void __cxx_global_var_init_2_70519()
{
  unsigned __int8 v0;
  unsigned __int8 v1;
  uint64_t v2;

  {
    if ((v1 & 1) == 0)
    {
      {
        nw::object::_class(void)::instance = (uint64_t)"object";
        *(_QWORD *)algn_1ECD84F58 = 6;
        xmmword_1ECD84F60 = 0u;
        unk_1ECD84F70 = 0u;
        xmmword_1ECD84F80 = 0u;
        *(_OWORD *)&qword_1ECD84F90 = 0u;
        *(__int128 *)((char *)&xmmword_1ECD84F98 + 8) = 0u;
        *(_OWORD *)&qword_1ECD84FB0 = 0u;
        xmmword_1ECD84FC0 = 0u;
        unk_1ECD84FD0 = 0u;
        qword_1ECD84FE0 = (uint64_t)&qword_1ECD84FE0;
        unk_1ECD84FE8 = &qword_1ECD84FE0;
        qword_1ECD84FF0 = 0;
        dword_1ECD84FF8 = 0;
      }
    }
    nw::object::__destroy_def_instance = (uint64_t)nw::object::class_def::register_method_def(qword_1ECD85030, (uint64_t)nw::object::_destroy, 0);
    qword_1ECD85030 = v2;
  }
}

void __cxx_global_var_init_71066()
{
  unsigned __int8 v0;
  unsigned __int8 v1;
  uint64_t v2;

  {
    if ((v1 & 1) == 0)
    {
      {
        nw::object::_class(void)::instance = (uint64_t)"object";
        *(_QWORD *)algn_1ECD84F58 = 6;
        xmmword_1ECD84F60 = 0u;
        unk_1ECD84F70 = 0u;
        xmmword_1ECD84F80 = 0u;
        *(_OWORD *)&qword_1ECD84F90 = 0u;
        *(__int128 *)((char *)&xmmword_1ECD84F98 + 8) = 0u;
        *(_OWORD *)&qword_1ECD84FB0 = 0u;
        xmmword_1ECD84FC0 = 0u;
        unk_1ECD84FD0 = 0u;
        qword_1ECD84FE0 = (uint64_t)&qword_1ECD84FE0;
        unk_1ECD84FE8 = &qword_1ECD84FE0;
        qword_1ECD84FF0 = 0;
        dword_1ECD84FF8 = 0;
      }
    }
    nw::object::__description_def_instance = (uint64_t)nw::object::class_def::register_method_def(qword_1ECD85060, (uint64_t)nw::object::_description, 0);
    qword_1ECD85060 = v2;
  }
}

void __cxx_global_var_init_1_71067()
{
  unsigned __int8 v0;
  unsigned __int8 v1;
  uint64_t v2;

  {
    if ((v1 & 1) == 0)
    {
      {
        nw::object::_class(void)::instance = (uint64_t)"object";
        *(_QWORD *)algn_1ECD84F58 = 6;
        xmmword_1ECD84F60 = 0u;
        unk_1ECD84F70 = 0u;
        xmmword_1ECD84F80 = 0u;
        *(_OWORD *)&qword_1ECD84F90 = 0u;
        *(__int128 *)((char *)&xmmword_1ECD84F98 + 8) = 0u;
        *(_OWORD *)&qword_1ECD84FB0 = 0u;
        xmmword_1ECD84FC0 = 0u;
        unk_1ECD84FD0 = 0u;
        qword_1ECD84FE0 = (uint64_t)&qword_1ECD84FE0;
        unk_1ECD84FE8 = &qword_1ECD84FE0;
        qword_1ECD84FF0 = 0;
        dword_1ECD84FF8 = 0;
      }
    }
    nw::object::__redacted_description_def_instance = (uint64_t)nw::object::class_def::register_method_def(qword_1ECD85048, (uint64_t)nw::object::_redacted_description, 0);
    qword_1ECD85048 = v2;
  }
}

void __cxx_global_var_init_2_71068()
{
  unsigned __int8 v0;
  unsigned __int8 v1;
  uint64_t v2;

  {
    if ((v1 & 1) == 0)
    {
      {
        nw::object::_class(void)::instance = (uint64_t)"object";
        *(_QWORD *)algn_1ECD84F58 = 6;
        xmmword_1ECD84F60 = 0u;
        unk_1ECD84F70 = 0u;
        xmmword_1ECD84F80 = 0u;
        *(_OWORD *)&qword_1ECD84F90 = 0u;
        *(__int128 *)((char *)&xmmword_1ECD84F98 + 8) = 0u;
        *(_OWORD *)&qword_1ECD84FB0 = 0u;
        xmmword_1ECD84FC0 = 0u;
        unk_1ECD84FD0 = 0u;
        qword_1ECD84FE0 = (uint64_t)&qword_1ECD84FE0;
        unk_1ECD84FE8 = &qword_1ECD84FE0;
        qword_1ECD84FF0 = 0;
        dword_1ECD84FF8 = 0;
      }
    }
    nw::object::__destroy_def_instance = (uint64_t)nw::object::class_def::register_method_def(qword_1ECD85030, (uint64_t)nw::object::_destroy, 0);
    qword_1ECD85030 = v2;
  }
}

void __cxx_global_var_init_75661()
{
  unsigned __int8 v0;
  unsigned __int8 v1;
  uint64_t v2;

  {
    if ((v1 & 1) == 0)
    {
      {
        nw::object::_class(void)::instance = (uint64_t)"object";
        *(_QWORD *)algn_1ECD84F58 = 6;
        xmmword_1ECD84F60 = 0u;
        unk_1ECD84F70 = 0u;
        xmmword_1ECD84F80 = 0u;
        *(_OWORD *)&qword_1ECD84F90 = 0u;
        *(__int128 *)((char *)&xmmword_1ECD84F98 + 8) = 0u;
        *(_OWORD *)&qword_1ECD84FB0 = 0u;
        xmmword_1ECD84FC0 = 0u;
        unk_1ECD84FD0 = 0u;
        qword_1ECD84FE0 = (uint64_t)&qword_1ECD84FE0;
        unk_1ECD84FE8 = &qword_1ECD84FE0;
        qword_1ECD84FF0 = 0;
        dword_1ECD84FF8 = 0;
      }
    }
    nw::object::__description_def_instance = (uint64_t)nw::object::class_def::register_method_def(qword_1ECD85060, (uint64_t)nw::object::_description, 0);
    qword_1ECD85060 = v2;
  }
}

void __cxx_global_var_init_1_75662()
{
  unsigned __int8 v0;
  unsigned __int8 v1;
  uint64_t v2;

  {
    if ((v1 & 1) == 0)
    {
      {
        nw::object::_class(void)::instance = (uint64_t)"object";
        *(_QWORD *)algn_1ECD84F58 = 6;
        xmmword_1ECD84F60 = 0u;
        unk_1ECD84F70 = 0u;
        xmmword_1ECD84F80 = 0u;
        *(_OWORD *)&qword_1ECD84F90 = 0u;
        *(__int128 *)((char *)&xmmword_1ECD84F98 + 8) = 0u;
        *(_OWORD *)&qword_1ECD84FB0 = 0u;
        xmmword_1ECD84FC0 = 0u;
        unk_1ECD84FD0 = 0u;
        qword_1ECD84FE0 = (uint64_t)&qword_1ECD84FE0;
        unk_1ECD84FE8 = &qword_1ECD84FE0;
        qword_1ECD84FF0 = 0;
        dword_1ECD84FF8 = 0;
      }
    }
    nw::object::__redacted_description_def_instance = (uint64_t)nw::object::class_def::register_method_def(qword_1ECD85048, (uint64_t)nw::object::_redacted_description, 0);
    qword_1ECD85048 = v2;
  }
}

void __cxx_global_var_init_2_75663()
{
  unsigned __int8 v0;
  unsigned __int8 v1;
  uint64_t v2;

  {
    if ((v1 & 1) == 0)
    {
      {
        nw::object::_class(void)::instance = (uint64_t)"object";
        *(_QWORD *)algn_1ECD84F58 = 6;
        xmmword_1ECD84F60 = 0u;
        unk_1ECD84F70 = 0u;
        xmmword_1ECD84F80 = 0u;
        *(_OWORD *)&qword_1ECD84F90 = 0u;
        *(__int128 *)((char *)&xmmword_1ECD84F98 + 8) = 0u;
        *(_OWORD *)&qword_1ECD84FB0 = 0u;
        xmmword_1ECD84FC0 = 0u;
        unk_1ECD84FD0 = 0u;
        qword_1ECD84FE0 = (uint64_t)&qword_1ECD84FE0;
        unk_1ECD84FE8 = &qword_1ECD84FE0;
        qword_1ECD84FF0 = 0;
        dword_1ECD84FF8 = 0;
      }
    }
    nw::object::__destroy_def_instance = (uint64_t)nw::object::class_def::register_method_def(qword_1ECD85030, (uint64_t)nw::object::_destroy, 0);
    qword_1ECD85030 = v2;
  }
}

void __cxx_global_var_init_3()
{
  unsigned __int8 v0;
  unsigned __int8 v1;
  void (**v2)(nw_string *);
  char *v3;
  NSObject *v4;
  os_log_type_t v5;
  const char *v6;
  char *v7;
  _BOOL4 v8;
  char *backtrace_string;
  _BOOL4 v10;
  unsigned __int8 v11;
  char v12;
  os_log_type_t type;
  uint8_t buf[4];
  const char *v15;
  __int16 v16;
  char *v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  {
    {
      {
        nw::object::_class(void)::instance = (uint64_t)"object";
        *(_QWORD *)algn_1ECD84F58 = 6;
        xmmword_1ECD84F60 = 0u;
        unk_1ECD84F70 = 0u;
        xmmword_1ECD84F80 = 0u;
        *(_OWORD *)&qword_1ECD84F90 = 0u;
        *(__int128 *)((char *)&xmmword_1ECD84F98 + 8) = 0u;
        *(_OWORD *)&qword_1ECD84FB0 = 0u;
        xmmword_1ECD84FC0 = 0u;
        unk_1ECD84FD0 = 0u;
        qword_1ECD84FE0 = (uint64_t)&qword_1ECD84FE0;
        unk_1ECD84FE8 = &qword_1ECD84FE0;
        qword_1ECD84FF0 = 0;
        dword_1ECD84FF8 = 0;
      }
      nw_string::_class(void)::instance = (uint64_t)"OS_nw_string";
      unk_1ECD84EA0 = 12;
      xmmword_1ECD84EA8 = 0u;
      unk_1ECD84EB8 = 0u;
      xmmword_1ECD84EC8 = 0u;
      xmmword_1ECD84EE8 = 0u;
      *(_OWORD *)&qword_1ECD84EF8 = 0u;
      qword_1ECD84F08 = (uint64_t)&nw::object::_class(void)::instance;
      unk_1ECD84F10 = 4096;
      qword_1ECD84F18 = 0;
      qword_1ECD84F20 = 0;
      qword_1ECD84F28 = (uint64_t)&qword_1ECD84F28;
      qword_1ECD84F30 = (uint64_t)&qword_1ECD84F28;
      qword_1ECD84F38 = 0;
      dword_1ECD84F40 = 0;
      xmmword_1ECD84ED8 = 0u;
      nw::object::class_def::setup(&nw::object::_class(void)::instance, (int64x2_t *)&xmmword_1ECD84ED8);
    }
    if ((_BYTE)qword_1ECD85030)
    {
      if (nw::object::__destroy_def_instance < (unint64_t)qword_1ECD84F00)
      {
        v2 = (void (**)(nw_string *))(*(_QWORD *)(*((_QWORD *)&xmmword_1ECD84ED8 + 1)
                                                           + (((unint64_t)(qword_1ECD84EF8
                                                                                + nw::object::__destroy_def_instance) >> 5) & 0x7FFFFFFFFFFFFF8))
                                               + 16
                                               * (qword_1ECD84EF8 + nw::object::__destroy_def_instance));
        *v2 = nw_string::_destroy;
        v2[1] = 0;
LABEL_7:
        return;
      }
      __nwlog_obj();
      *(_DWORD *)buf = 136446210;
      v15 = "register_override_method_def";
      v3 = (char *)_os_log_send_and_compose_impl();
      type = OS_LOG_TYPE_ERROR;
      v12 = 0;
      if (!__nwlog_fault(v3, &type, &v12))
        goto LABEL_37;
      if (type == OS_LOG_TYPE_FAULT)
      {
        v4 = __nwlog_obj();
        v5 = type;
        if (!os_log_type_enabled(v4, type))
          goto LABEL_37;
        *(_DWORD *)buf = 136446210;
        v15 = "register_override_method_def";
        v6 = "%{public}s called with null (def.slot().value() < m_method_table.size())";
        goto LABEL_36;
      }
      if (!v12)
      {
        v4 = __nwlog_obj();
        v5 = type;
        if (!os_log_type_enabled(v4, type))
          goto LABEL_37;
        *(_DWORD *)buf = 136446210;
        v15 = "register_override_method_def";
        v6 = "%{public}s called with null (def.slot().value() < m_method_table.size()), backtrace limit exceeded";
        goto LABEL_36;
      }
      backtrace_string = (char *)__nw_create_backtrace_string();
      v4 = __nwlog_obj();
      v5 = type;
      v10 = os_log_type_enabled(v4, type);
      if (backtrace_string)
      {
        if (v10)
        {
          *(_DWORD *)buf = 136446466;
          v15 = "register_override_method_def";
          v16 = 2082;
          v17 = backtrace_string;
          _os_log_impl(&dword_182FBE000, v4, v5, "%{public}s called with null (def.slot().value() < m_method_table.size()), dumping backtrace:%{public}s", buf, 0x16u);
        }
        free(backtrace_string);
        if (!v3)
          goto LABEL_7;
        goto LABEL_38;
      }
      if (v10)
      {
        *(_DWORD *)buf = 136446210;
        v15 = "register_override_method_def";
        v6 = "%{public}s called with null (def.slot().value() < m_method_table.size()), no backtrace";
LABEL_36:
        _os_log_impl(&dword_182FBE000, v4, v5, v6, buf, 0xCu);
      }
    }
    else
    {
      __nwlog_obj();
      *(_DWORD *)buf = 136446210;
      v15 = "register_override_method_def";
      v3 = (char *)_os_log_send_and_compose_impl();
      type = OS_LOG_TYPE_ERROR;
      v12 = 0;
      if (!__nwlog_fault(v3, &type, &v12))
        goto LABEL_37;
      if (type == OS_LOG_TYPE_FAULT)
      {
        v4 = __nwlog_obj();
        v5 = type;
        if (!os_log_type_enabled(v4, type))
          goto LABEL_37;
        *(_DWORD *)buf = 136446210;
        v15 = "register_override_method_def";
        v6 = "%{public}s called with null (def.slot())";
        goto LABEL_36;
      }
      if (!v12)
      {
        v4 = __nwlog_obj();
        v5 = type;
        if (!os_log_type_enabled(v4, type))
          goto LABEL_37;
        *(_DWORD *)buf = 136446210;
        v15 = "register_override_method_def";
        v6 = "%{public}s called with null (def.slot()), backtrace limit exceeded";
        goto LABEL_36;
      }
      v7 = (char *)__nw_create_backtrace_string();
      v4 = __nwlog_obj();
      v5 = type;
      v8 = os_log_type_enabled(v4, type);
      if (!v7)
      {
        if (!v8)
          goto LABEL_37;
        *(_DWORD *)buf = 136446210;
        v15 = "register_override_method_def";
        v6 = "%{public}s called with null (def.slot()), no backtrace";
        goto LABEL_36;
      }
      if (v8)
      {
        *(_DWORD *)buf = 136446466;
        v15 = "register_override_method_def";
        v16 = 2082;
        v17 = v7;
        _os_log_impl(&dword_182FBE000, v4, v5, "%{public}s called with null (def.slot()), dumping backtrace:%{public}s", buf, 0x16u);
      }
      free(v7);
    }
LABEL_37:
    if (!v3)
      goto LABEL_7;
LABEL_38:
    free(v3);
    goto LABEL_7;
  }
}

void __cxx_global_var_init_75846()
{
  unsigned __int8 v0;
  unsigned __int8 v1;
  uint64_t v2;

  {
    if ((v1 & 1) == 0)
    {
      {
        nw::object::_class(void)::instance = (uint64_t)"object";
        *(_QWORD *)algn_1ECD84F58 = 6;
        xmmword_1ECD84F60 = 0u;
        unk_1ECD84F70 = 0u;
        xmmword_1ECD84F80 = 0u;
        *(_OWORD *)&qword_1ECD84F90 = 0u;
        *(__int128 *)((char *)&xmmword_1ECD84F98 + 8) = 0u;
        *(_OWORD *)&qword_1ECD84FB0 = 0u;
        xmmword_1ECD84FC0 = 0u;
        unk_1ECD84FD0 = 0u;
        qword_1ECD84FE0 = (uint64_t)&qword_1ECD84FE0;
        unk_1ECD84FE8 = &qword_1ECD84FE0;
        qword_1ECD84FF0 = 0;
        dword_1ECD84FF8 = 0;
      }
    }
    nw::object::__description_def_instance = (uint64_t)nw::object::class_def::register_method_def(qword_1ECD85060, (uint64_t)nw::object::_description, 0);
    qword_1ECD85060 = v2;
  }
}

void __cxx_global_var_init_1_75847()
{
  unsigned __int8 v0;
  unsigned __int8 v1;
  uint64_t v2;

  {
    if ((v1 & 1) == 0)
    {
      {
        nw::object::_class(void)::instance = (uint64_t)"object";
        *(_QWORD *)algn_1ECD84F58 = 6;
        xmmword_1ECD84F60 = 0u;
        unk_1ECD84F70 = 0u;
        xmmword_1ECD84F80 = 0u;
        *(_OWORD *)&qword_1ECD84F90 = 0u;
        *(__int128 *)((char *)&xmmword_1ECD84F98 + 8) = 0u;
        *(_OWORD *)&qword_1ECD84FB0 = 0u;
        xmmword_1ECD84FC0 = 0u;
        unk_1ECD84FD0 = 0u;
        qword_1ECD84FE0 = (uint64_t)&qword_1ECD84FE0;
        unk_1ECD84FE8 = &qword_1ECD84FE0;
        qword_1ECD84FF0 = 0;
        dword_1ECD84FF8 = 0;
      }
    }
    nw::object::__redacted_description_def_instance = (uint64_t)nw::object::class_def::register_method_def(qword_1ECD85048, (uint64_t)nw::object::_redacted_description, 0);
    qword_1ECD85048 = v2;
  }
}

void __cxx_global_var_init_2_75848()
{
  unsigned __int8 v0;
  unsigned __int8 v1;
  uint64_t v2;

  {
    if ((v1 & 1) == 0)
    {
      {
        nw::object::_class(void)::instance = (uint64_t)"object";
        *(_QWORD *)algn_1ECD84F58 = 6;
        xmmword_1ECD84F60 = 0u;
        unk_1ECD84F70 = 0u;
        xmmword_1ECD84F80 = 0u;
        *(_OWORD *)&qword_1ECD84F90 = 0u;
        *(__int128 *)((char *)&xmmword_1ECD84F98 + 8) = 0u;
        *(_OWORD *)&qword_1ECD84FB0 = 0u;
        xmmword_1ECD84FC0 = 0u;
        unk_1ECD84FD0 = 0u;
        qword_1ECD84FE0 = (uint64_t)&qword_1ECD84FE0;
        unk_1ECD84FE8 = &qword_1ECD84FE0;
        qword_1ECD84FF0 = 0;
        dword_1ECD84FF8 = 0;
      }
    }
    nw::object::__destroy_def_instance = (uint64_t)nw::object::class_def::register_method_def(qword_1ECD85030, (uint64_t)nw::object::_destroy, 0);
    qword_1ECD85030 = v2;
  }
}

void __cxx_global_var_init_76838()
{
  unsigned __int8 v0;
  unsigned __int8 v1;
  uint64_t v2;

  {
    if ((v1 & 1) == 0)
    {
      {
        nw::object::_class(void)::instance = (uint64_t)"object";
        *(_QWORD *)algn_1ECD84F58 = 6;
        xmmword_1ECD84F60 = 0u;
        unk_1ECD84F70 = 0u;
        xmmword_1ECD84F80 = 0u;
        *(_OWORD *)&qword_1ECD84F90 = 0u;
        *(__int128 *)((char *)&xmmword_1ECD84F98 + 8) = 0u;
        *(_OWORD *)&qword_1ECD84FB0 = 0u;
        xmmword_1ECD84FC0 = 0u;
        unk_1ECD84FD0 = 0u;
        qword_1ECD84FE0 = (uint64_t)&qword_1ECD84FE0;
        unk_1ECD84FE8 = &qword_1ECD84FE0;
        qword_1ECD84FF0 = 0;
        dword_1ECD84FF8 = 0;
      }
    }
    nw::object::__description_def_instance = (uint64_t)nw::object::class_def::register_method_def(qword_1ECD85060, (uint64_t)nw::object::_description, 0);
    qword_1ECD85060 = v2;
  }
}

void __cxx_global_var_init_1_76839()
{
  unsigned __int8 v0;
  unsigned __int8 v1;
  uint64_t v2;

  {
    if ((v1 & 1) == 0)
    {
      {
        nw::object::_class(void)::instance = (uint64_t)"object";
        *(_QWORD *)algn_1ECD84F58 = 6;
        xmmword_1ECD84F60 = 0u;
        unk_1ECD84F70 = 0u;
        xmmword_1ECD84F80 = 0u;
        *(_OWORD *)&qword_1ECD84F90 = 0u;
        *(__int128 *)((char *)&xmmword_1ECD84F98 + 8) = 0u;
        *(_OWORD *)&qword_1ECD84FB0 = 0u;
        xmmword_1ECD84FC0 = 0u;
        unk_1ECD84FD0 = 0u;
        qword_1ECD84FE0 = (uint64_t)&qword_1ECD84FE0;
        unk_1ECD84FE8 = &qword_1ECD84FE0;
        qword_1ECD84FF0 = 0;
        dword_1ECD84FF8 = 0;
      }
    }
    nw::object::__redacted_description_def_instance = (uint64_t)nw::object::class_def::register_method_def(qword_1ECD85048, (uint64_t)nw::object::_redacted_description, 0);
    qword_1ECD85048 = v2;
  }
}

void __cxx_global_var_init_2_76840()
{
  unsigned __int8 v0;
  unsigned __int8 v1;
  uint64_t v2;

  {
    if ((v1 & 1) == 0)
    {
      {
        nw::object::_class(void)::instance = (uint64_t)"object";
        *(_QWORD *)algn_1ECD84F58 = 6;
        xmmword_1ECD84F60 = 0u;
        unk_1ECD84F70 = 0u;
        xmmword_1ECD84F80 = 0u;
        *(_OWORD *)&qword_1ECD84F90 = 0u;
        *(__int128 *)((char *)&xmmword_1ECD84F98 + 8) = 0u;
        *(_OWORD *)&qword_1ECD84FB0 = 0u;
        xmmword_1ECD84FC0 = 0u;
        unk_1ECD84FD0 = 0u;
        qword_1ECD84FE0 = (uint64_t)&qword_1ECD84FE0;
        unk_1ECD84FE8 = &qword_1ECD84FE0;
        qword_1ECD84FF0 = 0;
        dword_1ECD84FF8 = 0;
      }
    }
    nw::object::__destroy_def_instance = (uint64_t)nw::object::class_def::register_method_def(qword_1ECD85030, (uint64_t)nw::object::_destroy, 0);
    qword_1ECD85030 = v2;
  }
}

void __cxx_global_var_init_77424()
{
  unsigned __int8 v0;
  unsigned __int8 v1;
  uint64_t v2;

  {
    if ((v1 & 1) == 0)
    {
      {
        nw::object::_class(void)::instance = (uint64_t)"object";
        *(_QWORD *)algn_1ECD84F58 = 6;
        xmmword_1ECD84F60 = 0u;
        unk_1ECD84F70 = 0u;
        xmmword_1ECD84F80 = 0u;
        *(_OWORD *)&qword_1ECD84F90 = 0u;
        *(__int128 *)((char *)&xmmword_1ECD84F98 + 8) = 0u;
        *(_OWORD *)&qword_1ECD84FB0 = 0u;
        xmmword_1ECD84FC0 = 0u;
        unk_1ECD84FD0 = 0u;
        qword_1ECD84FE0 = (uint64_t)&qword_1ECD84FE0;
        unk_1ECD84FE8 = &qword_1ECD84FE0;
        qword_1ECD84FF0 = 0;
        dword_1ECD84FF8 = 0;
      }
    }
    nw::object::__description_def_instance = (uint64_t)nw::object::class_def::register_method_def(qword_1ECD85060, (uint64_t)nw::object::_description, 0);
    qword_1ECD85060 = v2;
  }
}

void __cxx_global_var_init_1_77425()
{
  unsigned __int8 v0;
  unsigned __int8 v1;
  uint64_t v2;

  {
    if ((v1 & 1) == 0)
    {
      {
        nw::object::_class(void)::instance = (uint64_t)"object";
        *(_QWORD *)algn_1ECD84F58 = 6;
        xmmword_1ECD84F60 = 0u;
        unk_1ECD84F70 = 0u;
        xmmword_1ECD84F80 = 0u;
        *(_OWORD *)&qword_1ECD84F90 = 0u;
        *(__int128 *)((char *)&xmmword_1ECD84F98 + 8) = 0u;
        *(_OWORD *)&qword_1ECD84FB0 = 0u;
        xmmword_1ECD84FC0 = 0u;
        unk_1ECD84FD0 = 0u;
        qword_1ECD84FE0 = (uint64_t)&qword_1ECD84FE0;
        unk_1ECD84FE8 = &qword_1ECD84FE0;
        qword_1ECD84FF0 = 0;
        dword_1ECD84FF8 = 0;
      }
    }
    nw::object::__redacted_description_def_instance = (uint64_t)nw::object::class_def::register_method_def(qword_1ECD85048, (uint64_t)nw::object::_redacted_description, 0);
    qword_1ECD85048 = v2;
  }
}

void __cxx_global_var_init_2_77426()
{
  unsigned __int8 v0;
  unsigned __int8 v1;
  uint64_t v2;

  {
    if ((v1 & 1) == 0)
    {
      {
        nw::object::_class(void)::instance = (uint64_t)"object";
        *(_QWORD *)algn_1ECD84F58 = 6;
        xmmword_1ECD84F60 = 0u;
        unk_1ECD84F70 = 0u;
        xmmword_1ECD84F80 = 0u;
        *(_OWORD *)&qword_1ECD84F90 = 0u;
        *(__int128 *)((char *)&xmmword_1ECD84F98 + 8) = 0u;
        *(_OWORD *)&qword_1ECD84FB0 = 0u;
        xmmword_1ECD84FC0 = 0u;
        unk_1ECD84FD0 = 0u;
        qword_1ECD84FE0 = (uint64_t)&qword_1ECD84FE0;
        unk_1ECD84FE8 = &qword_1ECD84FE0;
        qword_1ECD84FF0 = 0;
        dword_1ECD84FF8 = 0;
      }
    }
    nw::object::__destroy_def_instance = (uint64_t)nw::object::class_def::register_method_def(qword_1ECD85030, (uint64_t)nw::object::_destroy, 0);
    qword_1ECD85030 = v2;
  }
}

void __cxx_global_var_init_77860()
{
  unsigned __int8 v0;
  unsigned __int8 v1;
  uint64_t v2;

  {
    if ((v1 & 1) == 0)
    {
      {
        nw::object::_class(void)::instance = (uint64_t)"object";
        *(_QWORD *)algn_1ECD84F58 = 6;
        xmmword_1ECD84F60 = 0u;
        unk_1ECD84F70 = 0u;
        xmmword_1ECD84F80 = 0u;
        *(_OWORD *)&qword_1ECD84F90 = 0u;
        *(__int128 *)((char *)&xmmword_1ECD84F98 + 8) = 0u;
        *(_OWORD *)&qword_1ECD84FB0 = 0u;
        xmmword_1ECD84FC0 = 0u;
        unk_1ECD84FD0 = 0u;
        qword_1ECD84FE0 = (uint64_t)&qword_1ECD84FE0;
        unk_1ECD84FE8 = &qword_1ECD84FE0;
        qword_1ECD84FF0 = 0;
        dword_1ECD84FF8 = 0;
      }
    }
    nw::object::__description_def_instance = (uint64_t)nw::object::class_def::register_method_def(qword_1ECD85060, (uint64_t)nw::object::_description, 0);
    qword_1ECD85060 = v2;
  }
}

void __cxx_global_var_init_1_77861()
{
  unsigned __int8 v0;
  unsigned __int8 v1;
  uint64_t v2;

  {
    if ((v1 & 1) == 0)
    {
      {
        nw::object::_class(void)::instance = (uint64_t)"object";
        *(_QWORD *)algn_1ECD84F58 = 6;
        xmmword_1ECD84F60 = 0u;
        unk_1ECD84F70 = 0u;
        xmmword_1ECD84F80 = 0u;
        *(_OWORD *)&qword_1ECD84F90 = 0u;
        *(__int128 *)((char *)&xmmword_1ECD84F98 + 8) = 0u;
        *(_OWORD *)&qword_1ECD84FB0 = 0u;
        xmmword_1ECD84FC0 = 0u;
        unk_1ECD84FD0 = 0u;
        qword_1ECD84FE0 = (uint64_t)&qword_1ECD84FE0;
        unk_1ECD84FE8 = &qword_1ECD84FE0;
        qword_1ECD84FF0 = 0;
        dword_1ECD84FF8 = 0;
      }
    }
    nw::object::__redacted_description_def_instance = (uint64_t)nw::object::class_def::register_method_def(qword_1ECD85048, (uint64_t)nw::object::_redacted_description, 0);
    qword_1ECD85048 = v2;
  }
}

void __cxx_global_var_init_2_77862()
{
  unsigned __int8 v0;
  unsigned __int8 v1;
  uint64_t v2;

  {
    if ((v1 & 1) == 0)
    {
      {
        nw::object::_class(void)::instance = (uint64_t)"object";
        *(_QWORD *)algn_1ECD84F58 = 6;
        xmmword_1ECD84F60 = 0u;
        unk_1ECD84F70 = 0u;
        xmmword_1ECD84F80 = 0u;
        *(_OWORD *)&qword_1ECD84F90 = 0u;
        *(__int128 *)((char *)&xmmword_1ECD84F98 + 8) = 0u;
        *(_OWORD *)&qword_1ECD84FB0 = 0u;
        xmmword_1ECD84FC0 = 0u;
        unk_1ECD84FD0 = 0u;
        qword_1ECD84FE0 = (uint64_t)&qword_1ECD84FE0;
        unk_1ECD84FE8 = &qword_1ECD84FE0;
        qword_1ECD84FF0 = 0;
        dword_1ECD84FF8 = 0;
      }
    }
    nw::object::__destroy_def_instance = (uint64_t)nw::object::class_def::register_method_def(qword_1ECD85030, (uint64_t)nw::object::_destroy, 0);
    qword_1ECD85030 = v2;
  }
}

void __cxx_global_var_init_78836()
{
  unsigned __int8 v0;
  unsigned __int8 v1;
  uint64_t v2;

  {
    if ((v1 & 1) == 0)
    {
      {
        nw::object::_class(void)::instance = (uint64_t)"object";
        *(_QWORD *)algn_1ECD84F58 = 6;
        xmmword_1ECD84F60 = 0u;
        unk_1ECD84F70 = 0u;
        xmmword_1ECD84F80 = 0u;
        *(_OWORD *)&qword_1ECD84F90 = 0u;
        *(__int128 *)((char *)&xmmword_1ECD84F98 + 8) = 0u;
        *(_OWORD *)&qword_1ECD84FB0 = 0u;
        xmmword_1ECD84FC0 = 0u;
        unk_1ECD84FD0 = 0u;
        qword_1ECD84FE0 = (uint64_t)&qword_1ECD84FE0;
        unk_1ECD84FE8 = &qword_1ECD84FE0;
        qword_1ECD84FF0 = 0;
        dword_1ECD84FF8 = 0;
      }
    }
    nw::object::__description_def_instance = (uint64_t)nw::object::class_def::register_method_def(qword_1ECD85060, (uint64_t)nw::object::_description, 0);
    qword_1ECD85060 = v2;
  }
}

void __cxx_global_var_init_1_78837()
{
  unsigned __int8 v0;
  unsigned __int8 v1;
  uint64_t v2;

  {
    if ((v1 & 1) == 0)
    {
      {
        nw::object::_class(void)::instance = (uint64_t)"object";
        *(_QWORD *)algn_1ECD84F58 = 6;
        xmmword_1ECD84F60 = 0u;
        unk_1ECD84F70 = 0u;
        xmmword_1ECD84F80 = 0u;
        *(_OWORD *)&qword_1ECD84F90 = 0u;
        *(__int128 *)((char *)&xmmword_1ECD84F98 + 8) = 0u;
        *(_OWORD *)&qword_1ECD84FB0 = 0u;
        xmmword_1ECD84FC0 = 0u;
        unk_1ECD84FD0 = 0u;
        qword_1ECD84FE0 = (uint64_t)&qword_1ECD84FE0;
        unk_1ECD84FE8 = &qword_1ECD84FE0;
        qword_1ECD84FF0 = 0;
        dword_1ECD84FF8 = 0;
      }
    }
    nw::object::__redacted_description_def_instance = (uint64_t)nw::object::class_def::register_method_def(qword_1ECD85048, (uint64_t)nw::object::_redacted_description, 0);
    qword_1ECD85048 = v2;
  }
}

void __cxx_global_var_init_2_78838()
{
  unsigned __int8 v0;
  unsigned __int8 v1;
  uint64_t v2;

  {
    if ((v1 & 1) == 0)
    {
      {
        nw::object::_class(void)::instance = (uint64_t)"object";
        *(_QWORD *)algn_1ECD84F58 = 6;
        xmmword_1ECD84F60 = 0u;
        unk_1ECD84F70 = 0u;
        xmmword_1ECD84F80 = 0u;
        *(_OWORD *)&qword_1ECD84F90 = 0u;
        *(__int128 *)((char *)&xmmword_1ECD84F98 + 8) = 0u;
        *(_OWORD *)&qword_1ECD84FB0 = 0u;
        xmmword_1ECD84FC0 = 0u;
        unk_1ECD84FD0 = 0u;
        qword_1ECD84FE0 = (uint64_t)&qword_1ECD84FE0;
        unk_1ECD84FE8 = &qword_1ECD84FE0;
        qword_1ECD84FF0 = 0;
        dword_1ECD84FF8 = 0;
      }
    }
    nw::object::__destroy_def_instance = (uint64_t)nw::object::class_def::register_method_def(qword_1ECD85030, (uint64_t)nw::object::_destroy, 0);
    qword_1ECD85030 = v2;
  }
}

void __cxx_global_var_init_80439()
{
  unsigned __int8 v0;
  unsigned __int8 v1;
  uint64_t v2;

  {
    if ((v1 & 1) == 0)
    {
      {
        nw::object::_class(void)::instance = (uint64_t)"object";
        *(_QWORD *)algn_1ECD84F58 = 6;
        xmmword_1ECD84F60 = 0u;
        unk_1ECD84F70 = 0u;
        xmmword_1ECD84F80 = 0u;
        *(_OWORD *)&qword_1ECD84F90 = 0u;
        *(__int128 *)((char *)&xmmword_1ECD84F98 + 8) = 0u;
        *(_OWORD *)&qword_1ECD84FB0 = 0u;
        xmmword_1ECD84FC0 = 0u;
        unk_1ECD84FD0 = 0u;
        qword_1ECD84FE0 = (uint64_t)&qword_1ECD84FE0;
        unk_1ECD84FE8 = &qword_1ECD84FE0;
        qword_1ECD84FF0 = 0;
        dword_1ECD84FF8 = 0;
      }
    }
    nw::object::__description_def_instance = (uint64_t)nw::object::class_def::register_method_def(qword_1ECD85060, (uint64_t)nw::object::_description, 0);
    qword_1ECD85060 = v2;
  }
}

void __cxx_global_var_init_1_80440()
{
  unsigned __int8 v0;
  unsigned __int8 v1;
  uint64_t v2;

  {
    if ((v1 & 1) == 0)
    {
      {
        nw::object::_class(void)::instance = (uint64_t)"object";
        *(_QWORD *)algn_1ECD84F58 = 6;
        xmmword_1ECD84F60 = 0u;
        unk_1ECD84F70 = 0u;
        xmmword_1ECD84F80 = 0u;
        *(_OWORD *)&qword_1ECD84F90 = 0u;
        *(__int128 *)((char *)&xmmword_1ECD84F98 + 8) = 0u;
        *(_OWORD *)&qword_1ECD84FB0 = 0u;
        xmmword_1ECD84FC0 = 0u;
        unk_1ECD84FD0 = 0u;
        qword_1ECD84FE0 = (uint64_t)&qword_1ECD84FE0;
        unk_1ECD84FE8 = &qword_1ECD84FE0;
        qword_1ECD84FF0 = 0;
        dword_1ECD84FF8 = 0;
      }
    }
    nw::object::__redacted_description_def_instance = (uint64_t)nw::object::class_def::register_method_def(qword_1ECD85048, (uint64_t)nw::object::_redacted_description, 0);
    qword_1ECD85048 = v2;
  }
}

void __cxx_global_var_init_2_80441()
{
  unsigned __int8 v0;
  unsigned __int8 v1;
  uint64_t v2;

  {
    if ((v1 & 1) == 0)
    {
      {
        nw::object::_class(void)::instance = (uint64_t)"object";
        *(_QWORD *)algn_1ECD84F58 = 6;
        xmmword_1ECD84F60 = 0u;
        unk_1ECD84F70 = 0u;
        xmmword_1ECD84F80 = 0u;
        *(_OWORD *)&qword_1ECD84F90 = 0u;
        *(__int128 *)((char *)&xmmword_1ECD84F98 + 8) = 0u;
        *(_OWORD *)&qword_1ECD84FB0 = 0u;
        xmmword_1ECD84FC0 = 0u;
        unk_1ECD84FD0 = 0u;
        qword_1ECD84FE0 = (uint64_t)&qword_1ECD84FE0;
        unk_1ECD84FE8 = &qword_1ECD84FE0;
        qword_1ECD84FF0 = 0;
        dword_1ECD84FF8 = 0;
      }
    }
    nw::object::__destroy_def_instance = (uint64_t)nw::object::class_def::register_method_def(qword_1ECD85030, (uint64_t)nw::object::_destroy, 0);
    qword_1ECD85030 = v2;
  }
}

void __cxx_global_var_init_81291()
{
  unsigned __int8 v0;
  unsigned __int8 v1;
  uint64_t v2;

  {
    if ((v1 & 1) == 0)
    {
      {
        nw::object::_class(void)::instance = (uint64_t)"object";
        *(_QWORD *)algn_1ECD84F58 = 6;
        xmmword_1ECD84F60 = 0u;
        unk_1ECD84F70 = 0u;
        xmmword_1ECD84F80 = 0u;
        *(_OWORD *)&qword_1ECD84F90 = 0u;
        *(__int128 *)((char *)&xmmword_1ECD84F98 + 8) = 0u;
        *(_OWORD *)&qword_1ECD84FB0 = 0u;
        xmmword_1ECD84FC0 = 0u;
        unk_1ECD84FD0 = 0u;
        qword_1ECD84FE0 = (uint64_t)&qword_1ECD84FE0;
        unk_1ECD84FE8 = &qword_1ECD84FE0;
        qword_1ECD84FF0 = 0;
        dword_1ECD84FF8 = 0;
      }
    }
    nw::object::__description_def_instance = (uint64_t)nw::object::class_def::register_method_def(qword_1ECD85060, (uint64_t)nw::object::_description, 0);
    qword_1ECD85060 = v2;
  }
}

void __cxx_global_var_init_1_81292()
{
  unsigned __int8 v0;
  unsigned __int8 v1;
  uint64_t v2;

  {
    if ((v1 & 1) == 0)
    {
      {
        nw::object::_class(void)::instance = (uint64_t)"object";
        *(_QWORD *)algn_1ECD84F58 = 6;
        xmmword_1ECD84F60 = 0u;
        unk_1ECD84F70 = 0u;
        xmmword_1ECD84F80 = 0u;
        *(_OWORD *)&qword_1ECD84F90 = 0u;
        *(__int128 *)((char *)&xmmword_1ECD84F98 + 8) = 0u;
        *(_OWORD *)&qword_1ECD84FB0 = 0u;
        xmmword_1ECD84FC0 = 0u;
        unk_1ECD84FD0 = 0u;
        qword_1ECD84FE0 = (uint64_t)&qword_1ECD84FE0;
        unk_1ECD84FE8 = &qword_1ECD84FE0;
        qword_1ECD84FF0 = 0;
        dword_1ECD84FF8 = 0;
      }
    }
    nw::object::__redacted_description_def_instance = (uint64_t)nw::object::class_def::register_method_def(qword_1ECD85048, (uint64_t)nw::object::_redacted_description, 0);
    qword_1ECD85048 = v2;
  }
}

void __cxx_global_var_init_2_81293()
{
  unsigned __int8 v0;
  unsigned __int8 v1;
  uint64_t v2;

  {
    if ((v1 & 1) == 0)
    {
      {
        nw::object::_class(void)::instance = (uint64_t)"object";
        *(_QWORD *)algn_1ECD84F58 = 6;
        xmmword_1ECD84F60 = 0u;
        unk_1ECD84F70 = 0u;
        xmmword_1ECD84F80 = 0u;
        *(_OWORD *)&qword_1ECD84F90 = 0u;
        *(__int128 *)((char *)&xmmword_1ECD84F98 + 8) = 0u;
        *(_OWORD *)&qword_1ECD84FB0 = 0u;
        xmmword_1ECD84FC0 = 0u;
        unk_1ECD84FD0 = 0u;
        qword_1ECD84FE0 = (uint64_t)&qword_1ECD84FE0;
        unk_1ECD84FE8 = &qword_1ECD84FE0;
        qword_1ECD84FF0 = 0;
        dword_1ECD84FF8 = 0;
      }
    }
    nw::object::__destroy_def_instance = (uint64_t)nw::object::class_def::register_method_def(qword_1ECD85030, (uint64_t)nw::object::_destroy, 0);
    qword_1ECD85030 = v2;
  }
}

void __cxx_global_var_init_83481()
{
  unsigned __int8 v0;
  unsigned __int8 v1;
  uint64_t v2;

  {
    if ((v1 & 1) == 0)
    {
      {
        nw::object::_class(void)::instance = (uint64_t)"object";
        *(_QWORD *)algn_1ECD84F58 = 6;
        xmmword_1ECD84F60 = 0u;
        unk_1ECD84F70 = 0u;
        xmmword_1ECD84F80 = 0u;
        *(_OWORD *)&qword_1ECD84F90 = 0u;
        *(__int128 *)((char *)&xmmword_1ECD84F98 + 8) = 0u;
        *(_OWORD *)&qword_1ECD84FB0 = 0u;
        xmmword_1ECD84FC0 = 0u;
        unk_1ECD84FD0 = 0u;
        qword_1ECD84FE0 = (uint64_t)&qword_1ECD84FE0;
        unk_1ECD84FE8 = &qword_1ECD84FE0;
        qword_1ECD84FF0 = 0;
        dword_1ECD84FF8 = 0;
      }
    }
    nw::object::__description_def_instance = (uint64_t)nw::object::class_def::register_method_def(qword_1ECD85060, (uint64_t)nw::object::_description, 0);
    qword_1ECD85060 = v2;
  }
}

void __cxx_global_var_init_1_83482()
{
  unsigned __int8 v0;
  unsigned __int8 v1;
  uint64_t v2;

  {
    if ((v1 & 1) == 0)
    {
      {
        nw::object::_class(void)::instance = (uint64_t)"object";
        *(_QWORD *)algn_1ECD84F58 = 6;
        xmmword_1ECD84F60 = 0u;
        unk_1ECD84F70 = 0u;
        xmmword_1ECD84F80 = 0u;
        *(_OWORD *)&qword_1ECD84F90 = 0u;
        *(__int128 *)((char *)&xmmword_1ECD84F98 + 8) = 0u;
        *(_OWORD *)&qword_1ECD84FB0 = 0u;
        xmmword_1ECD84FC0 = 0u;
        unk_1ECD84FD0 = 0u;
        qword_1ECD84FE0 = (uint64_t)&qword_1ECD84FE0;
        unk_1ECD84FE8 = &qword_1ECD84FE0;
        qword_1ECD84FF0 = 0;
        dword_1ECD84FF8 = 0;
      }
    }
    nw::object::__redacted_description_def_instance = (uint64_t)nw::object::class_def::register_method_def(qword_1ECD85048, (uint64_t)nw::object::_redacted_description, 0);
    qword_1ECD85048 = v2;
  }
}

void __cxx_global_var_init_2_83483()
{
  unsigned __int8 v0;
  unsigned __int8 v1;
  uint64_t v2;

  {
    if ((v1 & 1) == 0)
    {
      {
        nw::object::_class(void)::instance = (uint64_t)"object";
        *(_QWORD *)algn_1ECD84F58 = 6;
        xmmword_1ECD84F60 = 0u;
        unk_1ECD84F70 = 0u;
        xmmword_1ECD84F80 = 0u;
        *(_OWORD *)&qword_1ECD84F90 = 0u;
        *(__int128 *)((char *)&xmmword_1ECD84F98 + 8) = 0u;
        *(_OWORD *)&qword_1ECD84FB0 = 0u;
        xmmword_1ECD84FC0 = 0u;
        unk_1ECD84FD0 = 0u;
        qword_1ECD84FE0 = (uint64_t)&qword_1ECD84FE0;
        unk_1ECD84FE8 = &qword_1ECD84FE0;
        qword_1ECD84FF0 = 0;
        dword_1ECD84FF8 = 0;
      }
    }
    nw::object::__destroy_def_instance = (uint64_t)nw::object::class_def::register_method_def(qword_1ECD85030, (uint64_t)nw::object::_destroy, 0);
    qword_1ECD85030 = v2;
  }
}

void __cxx_global_var_init_83545()
{
  unsigned __int8 v0;
  unsigned __int8 v1;
  uint64_t v2;

  {
    if ((v1 & 1) == 0)
    {
      {
        nw::object::_class(void)::instance = (uint64_t)"object";
        *(_QWORD *)algn_1ECD84F58 = 6;
        xmmword_1ECD84F60 = 0u;
        unk_1ECD84F70 = 0u;
        xmmword_1ECD84F80 = 0u;
        *(_OWORD *)&qword_1ECD84F90 = 0u;
        *(__int128 *)((char *)&xmmword_1ECD84F98 + 8) = 0u;
        *(_OWORD *)&qword_1ECD84FB0 = 0u;
        xmmword_1ECD84FC0 = 0u;
        unk_1ECD84FD0 = 0u;
        qword_1ECD84FE0 = (uint64_t)&qword_1ECD84FE0;
        unk_1ECD84FE8 = &qword_1ECD84FE0;
        qword_1ECD84FF0 = 0;
        dword_1ECD84FF8 = 0;
      }
    }
    nw::object::__description_def_instance = (uint64_t)nw::object::class_def::register_method_def(qword_1ECD85060, (uint64_t)nw::object::_description, 0);
    qword_1ECD85060 = v2;
  }
}

void __cxx_global_var_init_1_83546()
{
  unsigned __int8 v0;
  unsigned __int8 v1;
  uint64_t v2;

  {
    if ((v1 & 1) == 0)
    {
      {
        nw::object::_class(void)::instance = (uint64_t)"object";
        *(_QWORD *)algn_1ECD84F58 = 6;
        xmmword_1ECD84F60 = 0u;
        unk_1ECD84F70 = 0u;
        xmmword_1ECD84F80 = 0u;
        *(_OWORD *)&qword_1ECD84F90 = 0u;
        *(__int128 *)((char *)&xmmword_1ECD84F98 + 8) = 0u;
        *(_OWORD *)&qword_1ECD84FB0 = 0u;
        xmmword_1ECD84FC0 = 0u;
        unk_1ECD84FD0 = 0u;
        qword_1ECD84FE0 = (uint64_t)&qword_1ECD84FE0;
        unk_1ECD84FE8 = &qword_1ECD84FE0;
        qword_1ECD84FF0 = 0;
        dword_1ECD84FF8 = 0;
      }
    }
    nw::object::__redacted_description_def_instance = (uint64_t)nw::object::class_def::register_method_def(qword_1ECD85048, (uint64_t)nw::object::_redacted_description, 0);
    qword_1ECD85048 = v2;
  }
}

void __cxx_global_var_init_2_83547()
{
  unsigned __int8 v0;
  unsigned __int8 v1;
  uint64_t v2;

  {
    if ((v1 & 1) == 0)
    {
      {
        nw::object::_class(void)::instance = (uint64_t)"object";
        *(_QWORD *)algn_1ECD84F58 = 6;
        xmmword_1ECD84F60 = 0u;
        unk_1ECD84F70 = 0u;
        xmmword_1ECD84F80 = 0u;
        *(_OWORD *)&qword_1ECD84F90 = 0u;
        *(__int128 *)((char *)&xmmword_1ECD84F98 + 8) = 0u;
        *(_OWORD *)&qword_1ECD84FB0 = 0u;
        xmmword_1ECD84FC0 = 0u;
        unk_1ECD84FD0 = 0u;
        qword_1ECD84FE0 = (uint64_t)&qword_1ECD84FE0;
        unk_1ECD84FE8 = &qword_1ECD84FE0;
        qword_1ECD84FF0 = 0;
        dword_1ECD84FF8 = 0;
      }
    }
    nw::object::__destroy_def_instance = (uint64_t)nw::object::class_def::register_method_def(qword_1ECD85030, (uint64_t)nw::object::_destroy, 0);
    qword_1ECD85030 = v2;
  }
}

void __cxx_global_var_init_84224()
{
  unsigned __int8 v0;
  unsigned __int8 v1;
  uint64_t v2;

  {
    if ((v1 & 1) == 0)
    {
      {
        nw::object::_class(void)::instance = (uint64_t)"object";
        *(_QWORD *)algn_1ECD84F58 = 6;
        xmmword_1ECD84F60 = 0u;
        unk_1ECD84F70 = 0u;
        xmmword_1ECD84F80 = 0u;
        *(_OWORD *)&qword_1ECD84F90 = 0u;
        *(__int128 *)((char *)&xmmword_1ECD84F98 + 8) = 0u;
        *(_OWORD *)&qword_1ECD84FB0 = 0u;
        xmmword_1ECD84FC0 = 0u;
        unk_1ECD84FD0 = 0u;
        qword_1ECD84FE0 = (uint64_t)&qword_1ECD84FE0;
        unk_1ECD84FE8 = &qword_1ECD84FE0;
        qword_1ECD84FF0 = 0;
        dword_1ECD84FF8 = 0;
      }
    }
    nw::object::__description_def_instance = (uint64_t)nw::object::class_def::register_method_def(qword_1ECD85060, (uint64_t)nw::object::_description, 0);
    qword_1ECD85060 = v2;
  }
}

void __cxx_global_var_init_1_84225()
{
  unsigned __int8 v0;
  unsigned __int8 v1;
  uint64_t v2;

  {
    if ((v1 & 1) == 0)
    {
      {
        nw::object::_class(void)::instance = (uint64_t)"object";
        *(_QWORD *)algn_1ECD84F58 = 6;
        xmmword_1ECD84F60 = 0u;
        unk_1ECD84F70 = 0u;
        xmmword_1ECD84F80 = 0u;
        *(_OWORD *)&qword_1ECD84F90 = 0u;
        *(__int128 *)((char *)&xmmword_1ECD84F98 + 8) = 0u;
        *(_OWORD *)&qword_1ECD84FB0 = 0u;
        xmmword_1ECD84FC0 = 0u;
        unk_1ECD84FD0 = 0u;
        qword_1ECD84FE0 = (uint64_t)&qword_1ECD84FE0;
        unk_1ECD84FE8 = &qword_1ECD84FE0;
        qword_1ECD84FF0 = 0;
        dword_1ECD84FF8 = 0;
      }
    }
    nw::object::__redacted_description_def_instance = (uint64_t)nw::object::class_def::register_method_def(qword_1ECD85048, (uint64_t)nw::object::_redacted_description, 0);
    qword_1ECD85048 = v2;
  }
}

void __cxx_global_var_init_2_84226()
{
  unsigned __int8 v0;
  unsigned __int8 v1;
  uint64_t v2;

  {
    if ((v1 & 1) == 0)
    {
      {
        nw::object::_class(void)::instance = (uint64_t)"object";
        *(_QWORD *)algn_1ECD84F58 = 6;
        xmmword_1ECD84F60 = 0u;
        unk_1ECD84F70 = 0u;
        xmmword_1ECD84F80 = 0u;
        *(_OWORD *)&qword_1ECD84F90 = 0u;
        *(__int128 *)((char *)&xmmword_1ECD84F98 + 8) = 0u;
        *(_OWORD *)&qword_1ECD84FB0 = 0u;
        xmmword_1ECD84FC0 = 0u;
        unk_1ECD84FD0 = 0u;
        qword_1ECD84FE0 = (uint64_t)&qword_1ECD84FE0;
        unk_1ECD84FE8 = &qword_1ECD84FE0;
        qword_1ECD84FF0 = 0;
        dword_1ECD84FF8 = 0;
      }
    }
    nw::object::__destroy_def_instance = (uint64_t)nw::object::class_def::register_method_def(qword_1ECD85030, (uint64_t)nw::object::_destroy, 0);
    qword_1ECD85030 = v2;
  }
}

void __cxx_global_var_init_84608()
{
  unsigned __int8 v0;
  unsigned __int8 v1;
  uint64_t v2;

  {
    if ((v1 & 1) == 0)
    {
      {
        nw::object::_class(void)::instance = (uint64_t)"object";
        *(_QWORD *)algn_1ECD84F58 = 6;
        xmmword_1ECD84F60 = 0u;
        unk_1ECD84F70 = 0u;
        xmmword_1ECD84F80 = 0u;
        *(_OWORD *)&qword_1ECD84F90 = 0u;
        *(__int128 *)((char *)&xmmword_1ECD84F98 + 8) = 0u;
        *(_OWORD *)&qword_1ECD84FB0 = 0u;
        xmmword_1ECD84FC0 = 0u;
        unk_1ECD84FD0 = 0u;
        qword_1ECD84FE0 = (uint64_t)&qword_1ECD84FE0;
        unk_1ECD84FE8 = &qword_1ECD84FE0;
        qword_1ECD84FF0 = 0;
        dword_1ECD84FF8 = 0;
      }
    }
    nw::object::__description_def_instance = (uint64_t)nw::object::class_def::register_method_def(qword_1ECD85060, (uint64_t)nw::object::_description, 0);
    qword_1ECD85060 = v2;
  }
}

void __cxx_global_var_init_1_84609()
{
  unsigned __int8 v0;
  unsigned __int8 v1;
  uint64_t v2;

  {
    if ((v1 & 1) == 0)
    {
      {
        nw::object::_class(void)::instance = (uint64_t)"object";
        *(_QWORD *)algn_1ECD84F58 = 6;
        xmmword_1ECD84F60 = 0u;
        unk_1ECD84F70 = 0u;
        xmmword_1ECD84F80 = 0u;
        *(_OWORD *)&qword_1ECD84F90 = 0u;
        *(__int128 *)((char *)&xmmword_1ECD84F98 + 8) = 0u;
        *(_OWORD *)&qword_1ECD84FB0 = 0u;
        xmmword_1ECD84FC0 = 0u;
        unk_1ECD84FD0 = 0u;
        qword_1ECD84FE0 = (uint64_t)&qword_1ECD84FE0;
        unk_1ECD84FE8 = &qword_1ECD84FE0;
        qword_1ECD84FF0 = 0;
        dword_1ECD84FF8 = 0;
      }
    }
    nw::object::__redacted_description_def_instance = (uint64_t)nw::object::class_def::register_method_def(qword_1ECD85048, (uint64_t)nw::object::_redacted_description, 0);
    qword_1ECD85048 = v2;
  }
}

void __cxx_global_var_init_2_84610()
{
  unsigned __int8 v0;
  unsigned __int8 v1;
  uint64_t v2;

  {
    if ((v1 & 1) == 0)
    {
      {
        nw::object::_class(void)::instance = (uint64_t)"object";
        *(_QWORD *)algn_1ECD84F58 = 6;
        xmmword_1ECD84F60 = 0u;
        unk_1ECD84F70 = 0u;
        xmmword_1ECD84F80 = 0u;
        *(_OWORD *)&qword_1ECD84F90 = 0u;
        *(__int128 *)((char *)&xmmword_1ECD84F98 + 8) = 0u;
        *(_OWORD *)&qword_1ECD84FB0 = 0u;
        xmmword_1ECD84FC0 = 0u;
        unk_1ECD84FD0 = 0u;
        qword_1ECD84FE0 = (uint64_t)&qword_1ECD84FE0;
        unk_1ECD84FE8 = &qword_1ECD84FE0;
        qword_1ECD84FF0 = 0;
        dword_1ECD84FF8 = 0;
      }
    }
    nw::object::__destroy_def_instance = (uint64_t)nw::object::class_def::register_method_def(qword_1ECD85030, (uint64_t)nw::object::_destroy, 0);
    qword_1ECD85030 = v2;
  }
}

void __cxx_global_var_init_84989()
{
  unsigned __int8 v0;
  unsigned __int8 v1;
  uint64_t v2;

  {
    if ((v1 & 1) == 0)
    {
      {
        nw::object::_class(void)::instance = (uint64_t)"object";
        *(_QWORD *)algn_1ECD84F58 = 6;
        xmmword_1ECD84F60 = 0u;
        unk_1ECD84F70 = 0u;
        xmmword_1ECD84F80 = 0u;
        *(_OWORD *)&qword_1ECD84F90 = 0u;
        *(__int128 *)((char *)&xmmword_1ECD84F98 + 8) = 0u;
        *(_OWORD *)&qword_1ECD84FB0 = 0u;
        xmmword_1ECD84FC0 = 0u;
        unk_1ECD84FD0 = 0u;
        qword_1ECD84FE0 = (uint64_t)&qword_1ECD84FE0;
        unk_1ECD84FE8 = &qword_1ECD84FE0;
        qword_1ECD84FF0 = 0;
        dword_1ECD84FF8 = 0;
      }
    }
    nw::object::__description_def_instance = (uint64_t)nw::object::class_def::register_method_def(qword_1ECD85060, (uint64_t)nw::object::_description, 0);
    qword_1ECD85060 = v2;
  }
}

void __cxx_global_var_init_1_84990()
{
  unsigned __int8 v0;
  unsigned __int8 v1;
  uint64_t v2;

  {
    if ((v1 & 1) == 0)
    {
      {
        nw::object::_class(void)::instance = (uint64_t)"object";
        *(_QWORD *)algn_1ECD84F58 = 6;
        xmmword_1ECD84F60 = 0u;
        unk_1ECD84F70 = 0u;
        xmmword_1ECD84F80 = 0u;
        *(_OWORD *)&qword_1ECD84F90 = 0u;
        *(__int128 *)((char *)&xmmword_1ECD84F98 + 8) = 0u;
        *(_OWORD *)&qword_1ECD84FB0 = 0u;
        xmmword_1ECD84FC0 = 0u;
        unk_1ECD84FD0 = 0u;
        qword_1ECD84FE0 = (uint64_t)&qword_1ECD84FE0;
        unk_1ECD84FE8 = &qword_1ECD84FE0;
        qword_1ECD84FF0 = 0;
        dword_1ECD84FF8 = 0;
      }
    }
    nw::object::__redacted_description_def_instance = (uint64_t)nw::object::class_def::register_method_def(qword_1ECD85048, (uint64_t)nw::object::_redacted_description, 0);
    qword_1ECD85048 = v2;
  }
}

void __cxx_global_var_init_2_84991()
{
  unsigned __int8 v0;
  unsigned __int8 v1;
  uint64_t v2;

  {
    if ((v1 & 1) == 0)
    {
      {
        nw::object::_class(void)::instance = (uint64_t)"object";
        *(_QWORD *)algn_1ECD84F58 = 6;
        xmmword_1ECD84F60 = 0u;
        unk_1ECD84F70 = 0u;
        xmmword_1ECD84F80 = 0u;
        *(_OWORD *)&qword_1ECD84F90 = 0u;
        *(__int128 *)((char *)&xmmword_1ECD84F98 + 8) = 0u;
        *(_OWORD *)&qword_1ECD84FB0 = 0u;
        xmmword_1ECD84FC0 = 0u;
        unk_1ECD84FD0 = 0u;
        qword_1ECD84FE0 = (uint64_t)&qword_1ECD84FE0;
        unk_1ECD84FE8 = &qword_1ECD84FE0;
        qword_1ECD84FF0 = 0;
        dword_1ECD84FF8 = 0;
      }
    }
    nw::object::__destroy_def_instance = (uint64_t)nw::object::class_def::register_method_def(qword_1ECD85030, (uint64_t)nw::object::_destroy, 0);
    qword_1ECD85030 = v2;
  }
}

void __cxx_global_var_init_85099()
{
  unsigned __int8 v0;
  unsigned __int8 v1;
  uint64_t v2;

  {
    if ((v1 & 1) == 0)
    {
      {
        nw::object::_class(void)::instance = (uint64_t)"object";
        *(_QWORD *)algn_1ECD84F58 = 6;
        xmmword_1ECD84F60 = 0u;
        unk_1ECD84F70 = 0u;
        xmmword_1ECD84F80 = 0u;
        *(_OWORD *)&qword_1ECD84F90 = 0u;
        *(__int128 *)((char *)&xmmword_1ECD84F98 + 8) = 0u;
        *(_OWORD *)&qword_1ECD84FB0 = 0u;
        xmmword_1ECD84FC0 = 0u;
        unk_1ECD84FD0 = 0u;
        qword_1ECD84FE0 = (uint64_t)&qword_1ECD84FE0;
        unk_1ECD84FE8 = &qword_1ECD84FE0;
        qword_1ECD84FF0 = 0;
        dword_1ECD84FF8 = 0;
      }
    }
    nw::object::__description_def_instance = (uint64_t)nw::object::class_def::register_method_def(qword_1ECD85060, (uint64_t)nw::object::_description, 0);
    qword_1ECD85060 = v2;
  }
}

void __cxx_global_var_init_1_85100()
{
  unsigned __int8 v0;
  unsigned __int8 v1;
  uint64_t v2;

  {
    if ((v1 & 1) == 0)
    {
      {
        nw::object::_class(void)::instance = (uint64_t)"object";
        *(_QWORD *)algn_1ECD84F58 = 6;
        xmmword_1ECD84F60 = 0u;
        unk_1ECD84F70 = 0u;
        xmmword_1ECD84F80 = 0u;
        *(_OWORD *)&qword_1ECD84F90 = 0u;
        *(__int128 *)((char *)&xmmword_1ECD84F98 + 8) = 0u;
        *(_OWORD *)&qword_1ECD84FB0 = 0u;
        xmmword_1ECD84FC0 = 0u;
        unk_1ECD84FD0 = 0u;
        qword_1ECD84FE0 = (uint64_t)&qword_1ECD84FE0;
        unk_1ECD84FE8 = &qword_1ECD84FE0;
        qword_1ECD84FF0 = 0;
        dword_1ECD84FF8 = 0;
      }
    }
    nw::object::__redacted_description_def_instance = (uint64_t)nw::object::class_def::register_method_def(qword_1ECD85048, (uint64_t)nw::object::_redacted_description, 0);
    qword_1ECD85048 = v2;
  }
}

void __cxx_global_var_init_2_85101()
{
  unsigned __int8 v0;
  unsigned __int8 v1;
  uint64_t v2;

  {
    if ((v1 & 1) == 0)
    {
      {
        nw::object::_class(void)::instance = (uint64_t)"object";
        *(_QWORD *)algn_1ECD84F58 = 6;
        xmmword_1ECD84F60 = 0u;
        unk_1ECD84F70 = 0u;
        xmmword_1ECD84F80 = 0u;
        *(_OWORD *)&qword_1ECD84F90 = 0u;
        *(__int128 *)((char *)&xmmword_1ECD84F98 + 8) = 0u;
        *(_OWORD *)&qword_1ECD84FB0 = 0u;
        xmmword_1ECD84FC0 = 0u;
        unk_1ECD84FD0 = 0u;
        qword_1ECD84FE0 = (uint64_t)&qword_1ECD84FE0;
        unk_1ECD84FE8 = &qword_1ECD84FE0;
        qword_1ECD84FF0 = 0;
        dword_1ECD84FF8 = 0;
      }
    }
    nw::object::__destroy_def_instance = (uint64_t)nw::object::class_def::register_method_def(qword_1ECD85030, (uint64_t)nw::object::_destroy, 0);
    qword_1ECD85030 = v2;
  }
}

void __cxx_global_var_init_86284()
{
  unsigned __int8 v0;
  unsigned __int8 v1;
  uint64_t v2;

  {
    if ((v1 & 1) == 0)
    {
      {
        nw::object::_class(void)::instance = (uint64_t)"object";
        *(_QWORD *)algn_1ECD84F58 = 6;
        xmmword_1ECD84F60 = 0u;
        unk_1ECD84F70 = 0u;
        xmmword_1ECD84F80 = 0u;
        *(_OWORD *)&qword_1ECD84F90 = 0u;
        *(__int128 *)((char *)&xmmword_1ECD84F98 + 8) = 0u;
        *(_OWORD *)&qword_1ECD84FB0 = 0u;
        xmmword_1ECD84FC0 = 0u;
        unk_1ECD84FD0 = 0u;
        qword_1ECD84FE0 = (uint64_t)&qword_1ECD84FE0;
        unk_1ECD84FE8 = &qword_1ECD84FE0;
        qword_1ECD84FF0 = 0;
        dword_1ECD84FF8 = 0;
      }
    }
    nw::object::__description_def_instance = (uint64_t)nw::object::class_def::register_method_def(qword_1ECD85060, (uint64_t)nw::object::_description, 0);
    qword_1ECD85060 = v2;
  }
}

void __cxx_global_var_init_1_86285()
{
  unsigned __int8 v0;
  unsigned __int8 v1;
  uint64_t v2;

  {
    if ((v1 & 1) == 0)
    {
      {
        nw::object::_class(void)::instance = (uint64_t)"object";
        *(_QWORD *)algn_1ECD84F58 = 6;
        xmmword_1ECD84F60 = 0u;
        unk_1ECD84F70 = 0u;
        xmmword_1ECD84F80 = 0u;
        *(_OWORD *)&qword_1ECD84F90 = 0u;
        *(__int128 *)((char *)&xmmword_1ECD84F98 + 8) = 0u;
        *(_OWORD *)&qword_1ECD84FB0 = 0u;
        xmmword_1ECD84FC0 = 0u;
        unk_1ECD84FD0 = 0u;
        qword_1ECD84FE0 = (uint64_t)&qword_1ECD84FE0;
        unk_1ECD84FE8 = &qword_1ECD84FE0;
        qword_1ECD84FF0 = 0;
        dword_1ECD84FF8 = 0;
      }
    }
    nw::object::__redacted_description_def_instance = (uint64_t)nw::object::class_def::register_method_def(qword_1ECD85048, (uint64_t)nw::object::_redacted_description, 0);
    qword_1ECD85048 = v2;
  }
}

void __cxx_global_var_init_2_86286()
{
  unsigned __int8 v0;
  unsigned __int8 v1;
  uint64_t v2;

  {
    if ((v1 & 1) == 0)
    {
      {
        nw::object::_class(void)::instance = (uint64_t)"object";
        *(_QWORD *)algn_1ECD84F58 = 6;
        xmmword_1ECD84F60 = 0u;
        unk_1ECD84F70 = 0u;
        xmmword_1ECD84F80 = 0u;
        *(_OWORD *)&qword_1ECD84F90 = 0u;
        *(__int128 *)((char *)&xmmword_1ECD84F98 + 8) = 0u;
        *(_OWORD *)&qword_1ECD84FB0 = 0u;
        xmmword_1ECD84FC0 = 0u;
        unk_1ECD84FD0 = 0u;
        qword_1ECD84FE0 = (uint64_t)&qword_1ECD84FE0;
        unk_1ECD84FE8 = &qword_1ECD84FE0;
        qword_1ECD84FF0 = 0;
        dword_1ECD84FF8 = 0;
      }
    }
    nw::object::__destroy_def_instance = (uint64_t)nw::object::class_def::register_method_def(qword_1ECD85030, (uint64_t)nw::object::_destroy, 0);
    qword_1ECD85030 = v2;
  }
}

void __cxx_global_var_init_87155()
{
  unsigned __int8 v0;
  unsigned __int8 v1;
  uint64_t v2;

  {
    if ((v1 & 1) == 0)
    {
      {
        nw::object::_class(void)::instance = (uint64_t)"object";
        *(_QWORD *)algn_1ECD84F58 = 6;
        xmmword_1ECD84F60 = 0u;
        unk_1ECD84F70 = 0u;
        xmmword_1ECD84F80 = 0u;
        *(_OWORD *)&qword_1ECD84F90 = 0u;
        *(__int128 *)((char *)&xmmword_1ECD84F98 + 8) = 0u;
        *(_OWORD *)&qword_1ECD84FB0 = 0u;
        xmmword_1ECD84FC0 = 0u;
        unk_1ECD84FD0 = 0u;
        qword_1ECD84FE0 = (uint64_t)&qword_1ECD84FE0;
        unk_1ECD84FE8 = &qword_1ECD84FE0;
        qword_1ECD84FF0 = 0;
        dword_1ECD84FF8 = 0;
      }
    }
    nw::object::__description_def_instance = (uint64_t)nw::object::class_def::register_method_def(qword_1ECD85060, (uint64_t)nw::object::_description, 0);
    qword_1ECD85060 = v2;
  }
}

void __cxx_global_var_init_1_87156()
{
  unsigned __int8 v0;
  unsigned __int8 v1;
  uint64_t v2;

  {
    if ((v1 & 1) == 0)
    {
      {
        nw::object::_class(void)::instance = (uint64_t)"object";
        *(_QWORD *)algn_1ECD84F58 = 6;
        xmmword_1ECD84F60 = 0u;
        unk_1ECD84F70 = 0u;
        xmmword_1ECD84F80 = 0u;
        *(_OWORD *)&qword_1ECD84F90 = 0u;
        *(__int128 *)((char *)&xmmword_1ECD84F98 + 8) = 0u;
        *(_OWORD *)&qword_1ECD84FB0 = 0u;
        xmmword_1ECD84FC0 = 0u;
        unk_1ECD84FD0 = 0u;
        qword_1ECD84FE0 = (uint64_t)&qword_1ECD84FE0;
        unk_1ECD84FE8 = &qword_1ECD84FE0;
        qword_1ECD84FF0 = 0;
        dword_1ECD84FF8 = 0;
      }
    }
    nw::object::__redacted_description_def_instance = (uint64_t)nw::object::class_def::register_method_def(qword_1ECD85048, (uint64_t)nw::object::_redacted_description, 0);
    qword_1ECD85048 = v2;
  }
}

void __cxx_global_var_init_2_87157()
{
  unsigned __int8 v0;
  unsigned __int8 v1;
  uint64_t v2;

  {
    if ((v1 & 1) == 0)
    {
      {
        nw::object::_class(void)::instance = (uint64_t)"object";
        *(_QWORD *)algn_1ECD84F58 = 6;
        xmmword_1ECD84F60 = 0u;
        unk_1ECD84F70 = 0u;
        xmmword_1ECD84F80 = 0u;
        *(_OWORD *)&qword_1ECD84F90 = 0u;
        *(__int128 *)((char *)&xmmword_1ECD84F98 + 8) = 0u;
        *(_OWORD *)&qword_1ECD84FB0 = 0u;
        xmmword_1ECD84FC0 = 0u;
        unk_1ECD84FD0 = 0u;
        qword_1ECD84FE0 = (uint64_t)&qword_1ECD84FE0;
        unk_1ECD84FE8 = &qword_1ECD84FE0;
        qword_1ECD84FF0 = 0;
        dword_1ECD84FF8 = 0;
      }
    }
    nw::object::__destroy_def_instance = (uint64_t)nw::object::class_def::register_method_def(qword_1ECD85030, (uint64_t)nw::object::_destroy, 0);
    qword_1ECD85030 = v2;
  }
}

void __cxx_global_var_init_87412()
{
  unsigned __int8 v0;
  unsigned __int8 v1;
  uint64_t v2;

  {
    if ((v1 & 1) == 0)
    {
      {
        nw::object::_class(void)::instance = (uint64_t)"object";
        *(_QWORD *)algn_1ECD84F58 = 6;
        xmmword_1ECD84F60 = 0u;
        unk_1ECD84F70 = 0u;
        xmmword_1ECD84F80 = 0u;
        *(_OWORD *)&qword_1ECD84F90 = 0u;
        *(__int128 *)((char *)&xmmword_1ECD84F98 + 8) = 0u;
        *(_OWORD *)&qword_1ECD84FB0 = 0u;
        xmmword_1ECD84FC0 = 0u;
        unk_1ECD84FD0 = 0u;
        qword_1ECD84FE0 = (uint64_t)&qword_1ECD84FE0;
        unk_1ECD84FE8 = &qword_1ECD84FE0;
        qword_1ECD84FF0 = 0;
        dword_1ECD84FF8 = 0;
      }
    }
    nw::object::__description_def_instance = (uint64_t)nw::object::class_def::register_method_def(qword_1ECD85060, (uint64_t)nw::object::_description, 0);
    qword_1ECD85060 = v2;
  }
}

void __cxx_global_var_init_1_87413()
{
  unsigned __int8 v0;
  unsigned __int8 v1;
  uint64_t v2;

  {
    if ((v1 & 1) == 0)
    {
      {
        nw::object::_class(void)::instance = (uint64_t)"object";
        *(_QWORD *)algn_1ECD84F58 = 6;
        xmmword_1ECD84F60 = 0u;
        unk_1ECD84F70 = 0u;
        xmmword_1ECD84F80 = 0u;
        *(_OWORD *)&qword_1ECD84F90 = 0u;
        *(__int128 *)((char *)&xmmword_1ECD84F98 + 8) = 0u;
        *(_OWORD *)&qword_1ECD84FB0 = 0u;
        xmmword_1ECD84FC0 = 0u;
        unk_1ECD84FD0 = 0u;
        qword_1ECD84FE0 = (uint64_t)&qword_1ECD84FE0;
        unk_1ECD84FE8 = &qword_1ECD84FE0;
        qword_1ECD84FF0 = 0;
        dword_1ECD84FF8 = 0;
      }
    }
    nw::object::__redacted_description_def_instance = (uint64_t)nw::object::class_def::register_method_def(qword_1ECD85048, (uint64_t)nw::object::_redacted_description, 0);
    qword_1ECD85048 = v2;
  }
}

void __cxx_global_var_init_2_87414()
{
  unsigned __int8 v0;
  unsigned __int8 v1;
  uint64_t v2;

  {
    if ((v1 & 1) == 0)
    {
      {
        nw::object::_class(void)::instance = (uint64_t)"object";
        *(_QWORD *)algn_1ECD84F58 = 6;
        xmmword_1ECD84F60 = 0u;
        unk_1ECD84F70 = 0u;
        xmmword_1ECD84F80 = 0u;
        *(_OWORD *)&qword_1ECD84F90 = 0u;
        *(__int128 *)((char *)&xmmword_1ECD84F98 + 8) = 0u;
        *(_OWORD *)&qword_1ECD84FB0 = 0u;
        xmmword_1ECD84FC0 = 0u;
        unk_1ECD84FD0 = 0u;
        qword_1ECD84FE0 = (uint64_t)&qword_1ECD84FE0;
        unk_1ECD84FE8 = &qword_1ECD84FE0;
        qword_1ECD84FF0 = 0;
        dword_1ECD84FF8 = 0;
      }
    }
    nw::object::__destroy_def_instance = (uint64_t)nw::object::class_def::register_method_def(qword_1ECD85030, (uint64_t)nw::object::_destroy, 0);
    qword_1ECD85030 = v2;
  }
}

void __cxx_global_var_init_87490()
{
  unsigned __int8 v0;
  unsigned __int8 v1;
  uint64_t v2;

  {
    if ((v1 & 1) == 0)
    {
      {
        nw::object::_class(void)::instance = (uint64_t)"object";
        *(_QWORD *)algn_1ECD84F58 = 6;
        xmmword_1ECD84F60 = 0u;
        unk_1ECD84F70 = 0u;
        xmmword_1ECD84F80 = 0u;
        *(_OWORD *)&qword_1ECD84F90 = 0u;
        *(__int128 *)((char *)&xmmword_1ECD84F98 + 8) = 0u;
        *(_OWORD *)&qword_1ECD84FB0 = 0u;
        xmmword_1ECD84FC0 = 0u;
        unk_1ECD84FD0 = 0u;
        qword_1ECD84FE0 = (uint64_t)&qword_1ECD84FE0;
        unk_1ECD84FE8 = &qword_1ECD84FE0;
        qword_1ECD84FF0 = 0;
        dword_1ECD84FF8 = 0;
      }
    }
    nw::object::__description_def_instance = (uint64_t)nw::object::class_def::register_method_def(qword_1ECD85060, (uint64_t)nw::object::_description, 0);
    qword_1ECD85060 = v2;
  }
}

void __cxx_global_var_init_1_87491()
{
  unsigned __int8 v0;
  unsigned __int8 v1;
  uint64_t v2;

  {
    if ((v1 & 1) == 0)
    {
      {
        nw::object::_class(void)::instance = (uint64_t)"object";
        *(_QWORD *)algn_1ECD84F58 = 6;
        xmmword_1ECD84F60 = 0u;
        unk_1ECD84F70 = 0u;
        xmmword_1ECD84F80 = 0u;
        *(_OWORD *)&qword_1ECD84F90 = 0u;
        *(__int128 *)((char *)&xmmword_1ECD84F98 + 8) = 0u;
        *(_OWORD *)&qword_1ECD84FB0 = 0u;
        xmmword_1ECD84FC0 = 0u;
        unk_1ECD84FD0 = 0u;
        qword_1ECD84FE0 = (uint64_t)&qword_1ECD84FE0;
        unk_1ECD84FE8 = &qword_1ECD84FE0;
        qword_1ECD84FF0 = 0;
        dword_1ECD84FF8 = 0;
      }
    }
    nw::object::__redacted_description_def_instance = (uint64_t)nw::object::class_def::register_method_def(qword_1ECD85048, (uint64_t)nw::object::_redacted_description, 0);
    qword_1ECD85048 = v2;
  }
}

void __cxx_global_var_init_2_87492()
{
  unsigned __int8 v0;
  unsigned __int8 v1;
  uint64_t v2;

  {
    if ((v1 & 1) == 0)
    {
      {
        nw::object::_class(void)::instance = (uint64_t)"object";
        *(_QWORD *)algn_1ECD84F58 = 6;
        xmmword_1ECD84F60 = 0u;
        unk_1ECD84F70 = 0u;
        xmmword_1ECD84F80 = 0u;
        *(_OWORD *)&qword_1ECD84F90 = 0u;
        *(__int128 *)((char *)&xmmword_1ECD84F98 + 8) = 0u;
        *(_OWORD *)&qword_1ECD84FB0 = 0u;
        xmmword_1ECD84FC0 = 0u;
        unk_1ECD84FD0 = 0u;
        qword_1ECD84FE0 = (uint64_t)&qword_1ECD84FE0;
        unk_1ECD84FE8 = &qword_1ECD84FE0;
        qword_1ECD84FF0 = 0;
        dword_1ECD84FF8 = 0;
      }
    }
    nw::object::__destroy_def_instance = (uint64_t)nw::object::class_def::register_method_def(qword_1ECD85030, (uint64_t)nw::object::_destroy, 0);
    qword_1ECD85030 = v2;
  }
}

uint64_t sub_183B91254()
{
  return MEMORY[0x1E0CAE070]();
}

uint64_t sub_183B91260()
{
  return MEMORY[0x1E0CAE080]();
}

uint64_t sub_183B9126C()
{
  return MEMORY[0x1E0CAE0A8]();
}

uint64_t sub_183B91278()
{
  return MEMORY[0x1E0CAE0B8]();
}

uint64_t sub_183B91284()
{
  return MEMORY[0x1E0CAE1A0]();
}

uint64_t sub_183B91290()
{
  return MEMORY[0x1E0CAE1B8]();
}

uint64_t sub_183B9129C()
{
  return MEMORY[0x1E0CAE1D8]();
}

uint64_t sub_183B912A8()
{
  return MEMORY[0x1E0CAE1E8]();
}

uint64_t sub_183B912B4()
{
  return MEMORY[0x1E0CAE6D0]();
}

uint64_t sub_183B912C0()
{
  return MEMORY[0x1E0CAE8A8]();
}

uint64_t sub_183B912CC()
{
  return MEMORY[0x1E0CAE8B8]();
}

uint64_t sub_183B912D8()
{
  return MEMORY[0x1E0CAE8D0]();
}

uint64_t sub_183B912E4()
{
  return MEMORY[0x1E0CAE8D8]();
}

uint64_t sub_183B912F0()
{
  return MEMORY[0x1E0CAE8F0]();
}

uint64_t sub_183B912FC()
{
  return MEMORY[0x1E0CAE8F8]();
}

uint64_t sub_183B91308()
{
  return MEMORY[0x1E0CAE910]();
}

uint64_t sub_183B91314()
{
  return MEMORY[0x1E0CAEE50]();
}

uint64_t sub_183B91320()
{
  return MEMORY[0x1E0CAF990]();
}

uint64_t sub_183B9132C()
{
  return MEMORY[0x1E0CAF998]();
}

uint64_t sub_183B91338()
{
  return MEMORY[0x1E0CAFD38]();
}

uint64_t sub_183B91344()
{
  return MEMORY[0x1E0CAFD90]();
}

uint64_t sub_183B91350()
{
  return MEMORY[0x1E0CAFE08]();
}

uint64_t sub_183B9135C()
{
  return MEMORY[0x1E0CAFE38]();
}

uint64_t sub_183B91368()
{
  return MEMORY[0x1E0CAFED8]();
}

uint64_t sub_183B91374()
{
  return MEMORY[0x1E0CAFF00]();
}

uint64_t sub_183B91380()
{
  return MEMORY[0x1E0CAFF40]();
}

uint64_t sub_183B9138C()
{
  return MEMORY[0x1E0CAFF90]();
}

uint64_t sub_183B91398()
{
  return MEMORY[0x1E0CAFFD0]();
}

uint64_t sub_183B913A4()
{
  return MEMORY[0x1E0CAFFF8]();
}

uint64_t sub_183B913B0()
{
  return MEMORY[0x1E0CB0088]();
}

uint64_t sub_183B913BC()
{
  return MEMORY[0x1E0CB00B0]();
}

uint64_t sub_183B913C8()
{
  return MEMORY[0x1E0CB00E8]();
}

uint64_t sub_183B913D4()
{
  return MEMORY[0x1E0CB0110]();
}

uint64_t sub_183B913E0()
{
  return MEMORY[0x1E0CB0128]();
}

uint64_t sub_183B913EC()
{
  return MEMORY[0x1E0CB0140]();
}

uint64_t sub_183B913F8()
{
  return MEMORY[0x1E0CB0160]();
}

uint64_t sub_183B91404()
{
  return MEMORY[0x1E0CB0188]();
}

uint64_t sub_183B91410()
{
  return MEMORY[0x1E0CB01E0]();
}

uint64_t sub_183B9141C()
{
  return MEMORY[0x1E0CB01F0]();
}

uint64_t sub_183B91428()
{
  return MEMORY[0x1E0CB0228]();
}

uint64_t sub_183B91434()
{
  return MEMORY[0x1E0CB0240]();
}

uint64_t sub_183B91440()
{
  return MEMORY[0x1E0CB0298]();
}

uint64_t sub_183B9144C()
{
  return MEMORY[0x1E0CB02C0]();
}

uint64_t sub_183B91458()
{
  return MEMORY[0x1E0CB03A0]();
}

uint64_t sub_183B91464()
{
  return MEMORY[0x1E0CB03A8]();
}

uint64_t sub_183B91470()
{
  return MEMORY[0x1E0CB0910]();
}

uint64_t sub_183B9147C()
{
  return MEMORY[0x1E0CB0948]();
}

uint64_t sub_183B91488()
{
  return MEMORY[0x1E0CB0970]();
}

uint64_t sub_183B91494()
{
  return MEMORY[0x1E0CB0978]();
}

uint64_t sub_183B914A0()
{
  return MEMORY[0x1E0CB0988]();
}

uint64_t sub_183B914AC()
{
  return MEMORY[0x1E0CB0998]();
}

uint64_t sub_183B914B8()
{
  return MEMORY[0x1E0CB0E38]();
}

uint64_t sub_183B914C4()
{
  return MEMORY[0x1E0DEFAD8]();
}

uint64_t sub_183B914D0()
{
  return MEMORY[0x1E0DEFAE0]();
}

uint64_t sub_183B914DC()
{
  return MEMORY[0x1E0DEFB00]();
}

uint64_t sub_183B914E8()
{
  return MEMORY[0x1E0DEFB38]();
}

uint64_t sub_183B914F4()
{
  return MEMORY[0x1E0DEFB40]();
}

uint64_t sub_183B91500()
{
  return MEMORY[0x1E0DEFB50]();
}

uint64_t sub_183B9150C()
{
  return MEMORY[0x1E0DEFB60]();
}

uint64_t sub_183B91518()
{
  return MEMORY[0x1E0DEFB68]();
}

uint64_t sub_183B91524()
{
  return MEMORY[0x1E0DF2100]();
}

uint64_t sub_183B91530()
{
  return MEMORY[0x1E0DF2108]();
}

uint64_t sub_183B9153C()
{
  return MEMORY[0x1E0DF2110]();
}

uint64_t sub_183B91548()
{
  return MEMORY[0x1E0DF2118]();
}

uint64_t sub_183B91554()
{
  return MEMORY[0x1E0DF2130]();
}

uint64_t sub_183B91560()
{
  return MEMORY[0x1E0DF2150]();
}

uint64_t sub_183B9156C()
{
  return MEMORY[0x1E0DF2170]();
}

uint64_t sub_183B91578()
{
  return MEMORY[0x1E0DF2198]();
}

uint64_t sub_183B91584()
{
  return MEMORY[0x1E0DF2218]();
}

uint64_t sub_183B91590()
{
  return MEMORY[0x1E0DF2220]();
}

uint64_t sub_183B9159C()
{
  return MEMORY[0x1E0DF2228]();
}

uint64_t sub_183B915A8()
{
  return MEMORY[0x1E0DF2238]();
}

uint64_t sub_183B915B4()
{
  return MEMORY[0x1E0DF2240]();
}

uint64_t sub_183B915C0()
{
  return MEMORY[0x1E0DF2248]();
}

uint64_t sub_183B915CC()
{
  return MEMORY[0x1E0DF2258]();
}

uint64_t sub_183B915D8()
{
  return MEMORY[0x1E0DF2268]();
}

uint64_t sub_183B915E4()
{
  return MEMORY[0x1E0DF2010]();
}

uint64_t sub_183B915F0()
{
  return MEMORY[0x1E0DF2018]();
}

uint64_t sub_183B915FC()
{
  return MEMORY[0x1E0DEF4F8]();
}

uint64_t sub_183B91608()
{
  return MEMORY[0x1E0DEF578]();
}

uint64_t sub_183B91614()
{
  return MEMORY[0x1E0DEF5B0]();
}

uint64_t sub_183B91620()
{
  return MEMORY[0x1E0DEF600]();
}

uint64_t sub_183B9162C()
{
  return MEMORY[0x1E0DEF608]();
}

uint64_t sub_183B91638()
{
  return MEMORY[0x1E0DEF648]();
}

uint64_t sub_183B91644()
{
  return MEMORY[0x1E0DE9D70]();
}

uint64_t sub_183B91650()
{
  return MEMORY[0x1E0DF05B0]();
}

uint64_t sub_183B9165C()
{
  return MEMORY[0x1E0DE9E38]();
}

uint64_t sub_183B91668()
{
  return MEMORY[0x1E0DE9E60]();
}

uint64_t sub_183B91674()
{
  return MEMORY[0x1E0DEA1B8]();
}

uint64_t sub_183B91680()
{
  return MEMORY[0x1E0DEA1C0]();
}

uint64_t sub_183B9168C()
{
  return MEMORY[0x1E0DEA3B0]();
}

uint64_t sub_183B91698()
{
  return MEMORY[0x1E0DEA3D0]();
}

uint64_t sub_183B916A4()
{
  return MEMORY[0x1E0DEA428]();
}

uint64_t sub_183B916B0()
{
  return MEMORY[0x1E0DEA430]();
}

uint64_t sub_183B916BC()
{
  return MEMORY[0x1E0DEA568]();
}

uint64_t sub_183B916C8()
{
  return MEMORY[0x1E0DEA588]();
}

uint64_t sub_183B916D4()
{
  return MEMORY[0x1E0CB1940]();
}

uint64_t sub_183B916E0()
{
  return MEMORY[0x1E0CB1980]();
}

uint64_t sub_183B916EC()
{
  return MEMORY[0x1E0CB1990]();
}

uint64_t sub_183B916F8()
{
  return MEMORY[0x1E0CB1998]();
}

uint64_t sub_183B91704()
{
  return MEMORY[0x1E0CB19C0]();
}

uint64_t sub_183B91710()
{
  return MEMORY[0x1E0CB19E8]();
}

uint64_t sub_183B9171C()
{
  return MEMORY[0x1E0CB1A00]();
}

uint64_t sub_183B91728()
{
  return MEMORY[0x1E0CB1A18]();
}

uint64_t sub_183B91734()
{
  return MEMORY[0x1E0DEA5F8]();
}

uint64_t sub_183B91740()
{
  return MEMORY[0x1E0DEA610]();
}

uint64_t sub_183B9174C()
{
  return MEMORY[0x1E0DEA618]();
}

uint64_t sub_183B91758()
{
  return MEMORY[0x1E0DEA630]();
}

uint64_t sub_183B91764()
{
  return MEMORY[0x1E0DEA658]();
}

uint64_t sub_183B91770()
{
  return MEMORY[0x1E0DEA668]();
}

uint64_t sub_183B9177C()
{
  return MEMORY[0x1E0DEA6A0]();
}

uint64_t sub_183B91788()
{
  return MEMORY[0x1E0DEA6A8]();
}

uint64_t sub_183B91794()
{
  return MEMORY[0x1E0DEA6B8]();
}

uint64_t sub_183B917A0()
{
  return MEMORY[0x1E0DEA6F0]();
}

uint64_t sub_183B917AC()
{
  return MEMORY[0x1E0DEA6F8]();
}

uint64_t sub_183B917B8()
{
  return MEMORY[0x1E0DEA728]();
}

uint64_t sub_183B917C4()
{
  return MEMORY[0x1E0DEA758]();
}

uint64_t sub_183B917D0()
{
  return MEMORY[0x1E0DEA7B8]();
}

uint64_t sub_183B917DC()
{
  return MEMORY[0x1E0DEA7C0]();
}

uint64_t sub_183B917E8()
{
  return MEMORY[0x1E0DEA7D0]();
}

uint64_t sub_183B917F4()
{
  return MEMORY[0x1E0DEA800]();
}

uint64_t sub_183B91800()
{
  return MEMORY[0x1E0DEA828]();
}

uint64_t sub_183B9180C()
{
  return MEMORY[0x1E0DEA850]();
}

uint64_t sub_183B91818()
{
  return MEMORY[0x1E0DEA858]();
}

uint64_t sub_183B91824()
{
  return MEMORY[0x1E0DEA860]();
}

uint64_t sub_183B91830()
{
  return MEMORY[0x1E0DEA870]();
}

uint64_t sub_183B9183C()
{
  return MEMORY[0x1E0DEA878]();
}

uint64_t sub_183B91848()
{
  return MEMORY[0x1E0DEA880]();
}

uint64_t sub_183B91854()
{
  return MEMORY[0x1E0DEA908]();
}

uint64_t sub_183B91860()
{
  return MEMORY[0x1E0DEA940]();
}

uint64_t sub_183B9186C()
{
  return MEMORY[0x1E0DEAA08]();
}

uint64_t sub_183B91878()
{
  return MEMORY[0x1E0DEAA40]();
}

uint64_t sub_183B91884()
{
  return MEMORY[0x1E0DEAA50]();
}

uint64_t sub_183B91890()
{
  return MEMORY[0x1E0DEAA58]();
}

uint64_t sub_183B9189C()
{
  return MEMORY[0x1E0DEAA70]();
}

uint64_t sub_183B918A8()
{
  return MEMORY[0x1E0DEAA80]();
}

uint64_t sub_183B918B4()
{
  return MEMORY[0x1E0DEAAA0]();
}

uint64_t sub_183B918C0()
{
  return MEMORY[0x1E0DEAAB8]();
}

uint64_t sub_183B918CC()
{
  return MEMORY[0x1E0DEAAD8]();
}

uint64_t sub_183B918D8()
{
  return MEMORY[0x1E0DEAAF8]();
}

uint64_t sub_183B918E4()
{
  return MEMORY[0x1E0DEAB40]();
}

uint64_t sub_183B918F0()
{
  return MEMORY[0x1E0DEABB0]();
}

uint64_t sub_183B918FC()
{
  return MEMORY[0x1E0DEABC8]();
}

uint64_t sub_183B91908()
{
  return MEMORY[0x1E0DEAC40]();
}

uint64_t sub_183B91914()
{
  return MEMORY[0x1E0DEADA0]();
}

uint64_t sub_183B91920()
{
  return MEMORY[0x1E0CB1AC0]();
}

uint64_t sub_183B9192C()
{
  return MEMORY[0x1E0CB1AE8]();
}

uint64_t sub_183B91938()
{
  return MEMORY[0x1E0DEADB0]();
}

uint64_t sub_183B91944()
{
  return MEMORY[0x1E0DEADB8]();
}

uint64_t sub_183B91950()
{
  return MEMORY[0x1E0DEADC8]();
}

uint64_t sub_183B9195C()
{
  return MEMORY[0x1E0DEADD0]();
}

uint64_t sub_183B91968()
{
  return MEMORY[0x1E0DEADE8]();
}

uint64_t sub_183B91974()
{
  return MEMORY[0x1E0DEAE10]();
}

uint64_t sub_183B91980()
{
  return MEMORY[0x1E0DEAE28]();
}

uint64_t sub_183B9198C()
{
  return MEMORY[0x1E0DEAE38]();
}

uint64_t sub_183B91998()
{
  return MEMORY[0x1E0DEAE58]();
}

uint64_t sub_183B919A4()
{
  return MEMORY[0x1E0DEAE80]();
}

uint64_t sub_183B919B0()
{
  return MEMORY[0x1E0DEAE98]();
}

uint64_t sub_183B919BC()
{
  return MEMORY[0x1E0DEAEC8]();
}

uint64_t sub_183B919C8()
{
  return MEMORY[0x1E0DEAF78]();
}

uint64_t sub_183B919D4()
{
  return MEMORY[0x1E0DF05B8]();
}

uint64_t sub_183B919E0()
{
  return MEMORY[0x1E0DF05C8]();
}

uint64_t sub_183B919EC()
{
  return MEMORY[0x1E0DF05D0]();
}

uint64_t sub_183B919F8()
{
  return MEMORY[0x1E0DF05D8]();
}

uint64_t sub_183B91A04()
{
  return MEMORY[0x1E0DF05E0]();
}

uint64_t sub_183B91A10()
{
  return MEMORY[0x1E0DF0698]();
}

uint64_t sub_183B91A1C()
{
  return MEMORY[0x1E0DF06B8]();
}

uint64_t sub_183B91A28()
{
  return MEMORY[0x1E0DF0748]();
}

uint64_t sub_183B91A34()
{
  return MEMORY[0x1E0DF0750]();
}

uint64_t sub_183B91A40()
{
  return MEMORY[0x1E0DF0790]();
}

uint64_t sub_183B91A4C()
{
  return MEMORY[0x1E0DF07A0]();
}

uint64_t sub_183B91A58()
{
  return MEMORY[0x1E0DF07C0]();
}

uint64_t sub_183B91A64()
{
  return MEMORY[0x1E0DF07D8]();
}

uint64_t sub_183B91A70()
{
  return MEMORY[0x1E0DF07E0]();
}

uint64_t sub_183B91A7C()
{
  return MEMORY[0x1E0DF07E8]();
}

uint64_t sub_183B91A88()
{
  return MEMORY[0x1E0DF07F8]();
}

uint64_t sub_183B91A94()
{
  return MEMORY[0x1E0DF0810]();
}

uint64_t sub_183B91AA0()
{
  return MEMORY[0x1E0DF0820]();
}

uint64_t sub_183B91AAC()
{
  return MEMORY[0x1E0DF0838]();
}

uint64_t sub_183B91AB8()
{
  return MEMORY[0x1E0DF0840]();
}

uint64_t sub_183B91AC4()
{
  return MEMORY[0x1E0DF0860]();
}

uint64_t sub_183B91AD0()
{
  return MEMORY[0x1E0DF0870]();
}

uint64_t sub_183B91ADC()
{
  return MEMORY[0x1E0DF08B8]();
}

uint64_t sub_183B91AE8()
{
  return MEMORY[0x1E0DF08C8]();
}

uint64_t sub_183B91AF4()
{
  return MEMORY[0x1E0DF09D0]();
}

uint64_t sub_183B91B00()
{
  return MEMORY[0x1E0DF09E8]();
}

uint64_t sub_183B91B0C()
{
  return MEMORY[0x1E0DF0A28]();
}

uint64_t sub_183B91B18()
{
  return MEMORY[0x1E0DF0A30]();
}

uint64_t sub_183B91B24()
{
  return MEMORY[0x1E0DF0A40]();
}

uint64_t sub_183B91B30()
{
  return MEMORY[0x1E0DF0A58]();
}

uint64_t sub_183B91B3C()
{
  return MEMORY[0x1E0DF0A68]();
}

uint64_t sub_183B91B48()
{
  return MEMORY[0x1E0DF0A70]();
}

uint64_t sub_183B91B54()
{
  return MEMORY[0x1E0DF0A78]();
}

uint64_t sub_183B91B60()
{
  return MEMORY[0x1E0DF0A88]();
}

uint64_t sub_183B91B6C()
{
  return MEMORY[0x1E0DF0A90]();
}

uint64_t sub_183B91B78()
{
  return MEMORY[0x1E0DF0AA0]();
}

uint64_t sub_183B91B84()
{
  return MEMORY[0x1E0DF0AD0]();
}

uint64_t sub_183B91B90()
{
  return MEMORY[0x1E0DF0AD8]();
}

uint64_t sub_183B91B9C()
{
  return MEMORY[0x1E0DEB120]();
}

uint64_t sub_183B91BA8()
{
  return MEMORY[0x1E0DEB3A0]();
}

uint64_t sub_183B91BB4()
{
  return MEMORY[0x1E0DEB3A8]();
}

uint64_t sub_183B91BC0()
{
  return MEMORY[0x1E0DEB4F8]();
}

uint64_t sub_183B91BCC()
{
  return MEMORY[0x1E0DEB508]();
}

uint64_t sub_183B91BD8()
{
  return MEMORY[0x1E0DEB510]();
}

uint64_t sub_183B91BE4()
{
  return MEMORY[0x1E0DEB518]();
}

uint64_t sub_183B91BF0()
{
  return MEMORY[0x1E0DEB520]();
}

uint64_t sub_183B91BFC()
{
  return MEMORY[0x1E0DF1FC0]();
}

uint64_t sub_183B91C08()
{
  return MEMORY[0x1E0DEB5E8]();
}

uint64_t sub_183B91C14()
{
  return MEMORY[0x1E0DEB618]();
}

uint64_t sub_183B91C20()
{
  return MEMORY[0x1E0DEB660]();
}

uint64_t sub_183B91C2C()
{
  return MEMORY[0x1E0DEB6C0]();
}

uint64_t sub_183B91C38()
{
  return MEMORY[0x1E0DEB790]();
}

uint64_t sub_183B91C44()
{
  return MEMORY[0x1E0DEB7A0]();
}

uint64_t sub_183B91C50()
{
  return MEMORY[0x1E0DEB7D8]();
}

uint64_t sub_183B91C5C()
{
  return MEMORY[0x1E0DEB848]();
}

uint64_t sub_183B91C68()
{
  return MEMORY[0x1E0DF2278]();
}

uint64_t sub_183B91C74()
{
  return MEMORY[0x1E0DF2280]();
}

uint64_t sub_183B91C80()
{
  return MEMORY[0x1E0DF2290]();
}

uint64_t sub_183B91C8C()
{
  return MEMORY[0x1E0DEF810]();
}

uint64_t sub_183B91C98()
{
  return MEMORY[0x1E0DEF8E0]();
}

uint64_t sub_183B91CA4()
{
  return MEMORY[0x1E0DEF8E8]();
}

uint64_t sub_183B91CB0()
{
  return MEMORY[0x1E0DEF900]();
}

uint64_t sub_183B91CBC()
{
  return MEMORY[0x1E0DEF910]();
}

uint64_t sub_183B91CC8()
{
  return MEMORY[0x1E0DF2298]();
}

uint64_t sub_183B91CD4()
{
  return MEMORY[0x1E0DF22A0]();
}

uint64_t sub_183B91CE0()
{
  return MEMORY[0x1E0DF22A8]();
}

uint64_t sub_183B91CEC()
{
  return MEMORY[0x1E0DF22B0]();
}

uint64_t sub_183B91CF8()
{
  return MEMORY[0x1E0DEB940]();
}

uint64_t sub_183B91D04()
{
  return MEMORY[0x1E0DEBAD0]();
}

uint64_t sub_183B91D10()
{
  return MEMORY[0x1E0DEBB68]();
}

uint64_t sub_183B91D1C()
{
  return MEMORY[0x1E0DEBC20]();
}

uint64_t sub_183B91D28()
{
  return MEMORY[0x1E0DEBC90]();
}

uint64_t sub_183B91D34()
{
  return MEMORY[0x1E0CB2540]();
}

uint64_t sub_183B91D40()
{
  return MEMORY[0x1E0DEBE50]();
}

uint64_t sub_183B91D4C()
{
  return MEMORY[0x1E0DEC050]();
}

uint64_t sub_183B91D58()
{
  return MEMORY[0x1E0DEC060]();
}

uint64_t sub_183B91D64()
{
  return MEMORY[0x1E0DEC068]();
}

uint64_t sub_183B91D70()
{
  return MEMORY[0x1E0DEC070]();
}

uint64_t sub_183B91D7C()
{
  return MEMORY[0x1E0DEC248]();
}

uint64_t sub_183B91D88()
{
  return MEMORY[0x1E0DEC250]();
}

uint64_t sub_183B91D94()
{
  return MEMORY[0x1E0DEC280]();
}

uint64_t sub_183B91DA0()
{
  return MEMORY[0x1E0DEC290]();
}

uint64_t sub_183B91DAC()
{
  return MEMORY[0x1E0DEC2A0]();
}

uint64_t sub_183B91DB8()
{
  return MEMORY[0x1E0DEC2A8]();
}

uint64_t sub_183B91DC4()
{
  return MEMORY[0x1E0DEC2B0]();
}

uint64_t sub_183B91DD0()
{
  return MEMORY[0x1E0DEC2C0]();
}

uint64_t sub_183B91DDC()
{
  return MEMORY[0x1E0DEC2F0]();
}

uint64_t sub_183B91DE8()
{
  return MEMORY[0x1E0DEC310]();
}

uint64_t sub_183B91DF4()
{
  return MEMORY[0x1E0DEC3D8]();
}

uint64_t sub_183B91E00()
{
  return MEMORY[0x1E0DEC3E0]();
}

uint64_t sub_183B91E0C()
{
  return MEMORY[0x1E0DEC3E8]();
}

uint64_t sub_183B91E18()
{
  return MEMORY[0x1E0DEC3F8]();
}

uint64_t sub_183B91E24()
{
  return MEMORY[0x1E0DEC430]();
}

uint64_t sub_183B91E30()
{
  return MEMORY[0x1E0DEC438]();
}

uint64_t sub_183B91E3C()
{
  return MEMORY[0x1E0DEC440]();
}

uint64_t sub_183B91E48()
{
  return MEMORY[0x1E0DEC470]();
}

uint64_t sub_183B91E54()
{
  return MEMORY[0x1E0DEC498]();
}

uint64_t sub_183B91E60()
{
  return MEMORY[0x1E0DEC4B8]();
}

uint64_t sub_183B91E6C()
{
  return MEMORY[0x1E0DEC4E0]();
}

uint64_t sub_183B91E78()
{
  return MEMORY[0x1E0DEC588]();
}

uint64_t sub_183B91E84()
{
  return MEMORY[0x1E0DEC660]();
}

uint64_t sub_183B91E90()
{
  return MEMORY[0x1E0DEC670]();
}

uint64_t sub_183B91E9C()
{
  return MEMORY[0x1E0DEC688]();
}

uint64_t sub_183B91EA8()
{
  return MEMORY[0x1E0DEC6C0]();
}

uint64_t sub_183B91EB4()
{
  return MEMORY[0x1E0DEC6C8]();
}

uint64_t sub_183B91EC0()
{
  return MEMORY[0x1E0DEC718]();
}

uint64_t sub_183B91ECC()
{
  return MEMORY[0x1E0DF0B60]();
}

uint64_t sub_183B91ED8()
{
  return MEMORY[0x1E0DF0B98]();
}

uint64_t sub_183B91EE4()
{
  return MEMORY[0x1E0DF0BA0]();
}

uint64_t sub_183B91EF0()
{
  return MEMORY[0x1E0DEC7D0]();
}

uint64_t sub_183B91EFC()
{
  return MEMORY[0x1E0DEC808]();
}

uint64_t sub_183B91F08()
{
  return MEMORY[0x1E0DEC898]();
}

uint64_t sub_183B91F14()
{
  return MEMORY[0x1E0DEC8E0]();
}

uint64_t sub_183B91F20()
{
  return MEMORY[0x1E0DEC970]();
}

uint64_t sub_183B91F2C()
{
  return MEMORY[0x1E0DEFB78]();
}

uint64_t sub_183B91F38()
{
  return MEMORY[0x1E0DEC980]();
}

uint64_t sub_183B91F44()
{
  return MEMORY[0x1E0DEC990]();
}

uint64_t sub_183B91F50()
{
  return MEMORY[0x1E0DECBE0]();
}

uint64_t sub_183B91F5C()
{
  return MEMORY[0x1E0DECBE8]();
}

uint64_t sub_183B91F68()
{
  return MEMORY[0x1E0DECD18]();
}

uint64_t sub_183B91F74()
{
  return MEMORY[0x1E0DECD38]();
}

uint64_t sub_183B91F80()
{
  return MEMORY[0x1E0DECD40]();
}

uint64_t sub_183B91F8C()
{
  return MEMORY[0x1E0DECD50]();
}

uint64_t sub_183B91F98()
{
  return MEMORY[0x1E0DECD70]();
}

uint64_t sub_183B91FA4()
{
  return MEMORY[0x1E0DECDA0]();
}

uint64_t sub_183B91FB0()
{
  return MEMORY[0x1E0DECDA8]();
}

uint64_t sub_183B91FBC()
{
  return MEMORY[0x1E0DECE28]();
}

uint64_t sub_183B91FC8()
{
  return MEMORY[0x1E0DECF28]();
}

uint64_t sub_183B91FD4()
{
  return MEMORY[0x1E0DECF38]();
}

uint64_t sub_183B91FE0()
{
  return MEMORY[0x1E0DECF40]();
}

uint64_t sub_183B91FEC()
{
  return MEMORY[0x1E0DECF88]();
}

uint64_t sub_183B91FF8()
{
  return MEMORY[0x1E0DECFA8]();
}

uint64_t sub_183B92004()
{
  return MEMORY[0x1E0DECFC0]();
}

uint64_t sub_183B92010()
{
  return MEMORY[0x1E0DECFF0]();
}

uint64_t sub_183B9201C()
{
  return MEMORY[0x1E0DED028]();
}

uint64_t sub_183B92028()
{
  return MEMORY[0x1E0DED038]();
}

uint64_t sub_183B92034()
{
  return MEMORY[0x1E0DED058]();
}

uint64_t sub_183B92040()
{
  return MEMORY[0x1E0DED070]();
}

uint64_t sub_183B9204C()
{
  return MEMORY[0x1E0DED0C0]();
}

uint64_t sub_183B92058()
{
  return MEMORY[0x1E0DED0F0]();
}

uint64_t sub_183B92064()
{
  return MEMORY[0x1E0DED120]();
}

uint64_t sub_183B92070()
{
  return MEMORY[0x1E0DED148]();
}

uint64_t sub_183B9207C()
{
  return MEMORY[0x1E0DED158]();
}

uint64_t sub_183B92088()
{
  return MEMORY[0x1E0DED1D0]();
}

uint64_t sub_183B92094()
{
  return MEMORY[0x1E0DED258]();
}

uint64_t sub_183B920A0()
{
  return MEMORY[0x1E0DED290]();
}

uint64_t sub_183B920AC()
{
  return MEMORY[0x1E0DED2B8]();
}

uint64_t sub_183B920B8()
{
  return MEMORY[0x1E0DED388]();
}

uint64_t sub_183B920C4()
{
  return MEMORY[0x1E0DED3D0]();
}

uint64_t sub_183B920D0()
{
  return MEMORY[0x1E0DED4A0]();
}

uint64_t sub_183B920DC()
{
  return MEMORY[0x1E0DED548]();
}

uint64_t sub_183B920E8()
{
  return MEMORY[0x1E0DED5F0]();
}

uint64_t sub_183B920F4()
{
  return MEMORY[0x1E0DED600]();
}

uint64_t sub_183B92100()
{
  return MEMORY[0x1E0DF0E78]();
}

uint64_t sub_183B9210C()
{
  return MEMORY[0x1E0DED628]();
}

uint64_t sub_183B92118()
{
  return MEMORY[0x1E0DED6C8]();
}

uint64_t sub_183B92124()
{
  return MEMORY[0x1E0DED7D0]();
}

uint64_t sub_183B92130()
{
  return MEMORY[0x1E0DED7D8]();
}

uint64_t sub_183B9213C()
{
  return MEMORY[0x1E0DED7E0]();
}

uint64_t sub_183B92148()
{
  return MEMORY[0x1E0DED7F0]();
}

uint64_t sub_183B92154()
{
  return MEMORY[0x1E0DED7F8]();
}

uint64_t sub_183B92160()
{
  return MEMORY[0x1E0DED800]();
}

uint64_t sub_183B9216C()
{
  return MEMORY[0x1E0DED820]();
}

uint64_t sub_183B92178()
{
  return MEMORY[0x1E0DED848]();
}

uint64_t sub_183B92184()
{
  return MEMORY[0x1E0DED858]();
}

uint64_t sub_183B92190()
{
  return MEMORY[0x1E0DED860]();
}

uint64_t sub_183B9219C()
{
  return MEMORY[0x1E0DF0EC0]();
}

uint64_t sub_183B921A8()
{
  return MEMORY[0x1E0DED9C0]();
}

uint64_t sub_183B921B4()
{
  return MEMORY[0x1E0DED9F8]();
}

uint64_t sub_183B921C0()
{
  return MEMORY[0x1E0DEDAE0]();
}

uint64_t sub_183B921CC()
{
  return MEMORY[0x1E0DEDAE8]();
}

uint64_t sub_183B921D8()
{
  return MEMORY[0x1E0DF0EE8]();
}

uint64_t sub_183B921E4()
{
  return MEMORY[0x1E0DF0EF0]();
}

uint64_t sub_183B921F0()
{
  return MEMORY[0x1E0CB2628]();
}

uint64_t sub_183B921FC()
{
  return MEMORY[0x1E0CB2640]();
}

uint64_t sub_183B92208()
{
  return MEMORY[0x1E0DEDB10]();
}

uint64_t sub_183B92214()
{
  return MEMORY[0x1E0DEDB18]();
}

uint64_t sub_183B92220()
{
  return MEMORY[0x1E0DEDB20]();
}

uint64_t sub_183B9222C()
{
  return MEMORY[0x1E0DEDB28]();
}

uint64_t sub_183B92238()
{
  return MEMORY[0x1E0DEDED8]();
}

uint64_t sub_183B92244()
{
  return MEMORY[0x1E0DEDEF0]();
}

uint64_t sub_183B92250()
{
  return MEMORY[0x1E0DEDEF8]();
}

uint64_t sub_183B9225C()
{
  return MEMORY[0x1E0DEDF10]();
}

uint64_t sub_183B92268()
{
  return MEMORY[0x1E0DEDF18]();
}

uint64_t sub_183B92274()
{
  return MEMORY[0x1E0DEDF20]();
}

uint64_t sub_183B92280()
{
  return MEMORY[0x1E0DEDF28]();
}

uint64_t sub_183B9228C()
{
  return MEMORY[0x1E0DEDF40]();
}

uint64_t sub_183B92298()
{
  return MEMORY[0x1E0DEDF80]();
}

uint64_t sub_183B922A4()
{
  return MEMORY[0x1E0DEDFF8]();
}

uint64_t sub_183B922B0()
{
  return MEMORY[0x1E0DEE000]();
}

uint64_t sub_183B922BC()
{
  return MEMORY[0x1E0DEE030]();
}

uint64_t sub_183B922C8()
{
  return MEMORY[0x1E0DEE228]();
}

uint64_t sub_183B922D4()
{
  return MEMORY[0x1E0DEE230]();
}

uint64_t sub_183B922E0()
{
  return MEMORY[0x1E0DEE238]();
}

uint64_t sub_183B922EC()
{
  return MEMORY[0x1E0DEE240]();
}

uint64_t sub_183B922F8()
{
  return MEMORY[0x1E0DEE258]();
}

uint64_t sub_183B92304()
{
  return MEMORY[0x1E0DEE260]();
}

uint64_t sub_183B92310()
{
  return MEMORY[0x1E0DEE268]();
}

uint64_t sub_183B9231C()
{
  return MEMORY[0x1E0DEE270]();
}

uint64_t sub_183B92328()
{
  return MEMORY[0x1E0DEE8B8]();
}

uint64_t sub_183B92334()
{
  return MEMORY[0x1E0DEE8E0]();
}

uint64_t sub_183B92340()
{
  return MEMORY[0x1E0DEE8E8]();
}

uint64_t sub_183B9234C()
{
  return MEMORY[0x1E0DF0F28]();
}

uint64_t sub_183B92358()
{
  return MEMORY[0x1E0DF0F38]();
}

uint64_t sub_183B92364()
{
  return MEMORY[0x1E0DF0F48]();
}

uint64_t sub_183B92370()
{
  return MEMORY[0x1E0DEE978]();
}

unsigned __int8 *__cdecl CC_SHA1(const void *data, CC_LONG len, unsigned __int8 *md)
{
  return (unsigned __int8 *)MEMORY[0x1E0C80328](data, *(_QWORD *)&len, md);
}

int CC_SHA256_Final(unsigned __int8 *md, CC_SHA256_CTX *c)
{
  return MEMORY[0x1E0C80370](md, c);
}

int CC_SHA256_Init(CC_SHA256_CTX *c)
{
  return MEMORY[0x1E0C80378](c);
}

int CC_SHA256_Update(CC_SHA256_CTX *c, const void *data, CC_LONG len)
{
  return MEMORY[0x1E0C80380](c, data, *(_QWORD *)&len);
}

CFAbsoluteTime CFAbsoluteTimeGetCurrent(void)
{
  CFAbsoluteTime result;

  MEMORY[0x1E0C97C58]();
  return result;
}

void CFArrayAppendValue(CFMutableArrayRef theArray, const void *value)
{
  MEMORY[0x1E0C97CF8](theArray, value);
}

Boolean CFArrayContainsValue(CFArrayRef theArray, CFRange range, const void *value)
{
  return MEMORY[0x1E0C97D10](theArray, range.location, range.length, value);
}

CFArrayRef CFArrayCreateCopy(CFAllocatorRef allocator, CFArrayRef theArray)
{
  return (CFArrayRef)MEMORY[0x1E0C97D30](allocator, theArray);
}

CFMutableArrayRef CFArrayCreateMutable(CFAllocatorRef allocator, CFIndex capacity, const CFArrayCallBacks *callBacks)
{
  return (CFMutableArrayRef)MEMORY[0x1E0C97D38](allocator, capacity, callBacks);
}

CFMutableArrayRef CFArrayCreateMutableCopy(CFAllocatorRef allocator, CFIndex capacity, CFArrayRef theArray)
{
  return (CFMutableArrayRef)MEMORY[0x1E0C97D50](allocator, capacity, theArray);
}

CFIndex CFArrayGetCount(CFArrayRef theArray)
{
  return MEMORY[0x1E0C97D60](theArray);
}

CFIndex CFArrayGetFirstIndexOfValue(CFArrayRef theArray, CFRange range, const void *value)
{
  return MEMORY[0x1E0C97D78](theArray, range.location, range.length, value);
}

const void *__cdecl CFArrayGetValueAtIndex(CFArrayRef theArray, CFIndex idx)
{
  return (const void *)MEMORY[0x1E0C97D98](theArray, idx);
}

void CFArrayRemoveValueAtIndex(CFMutableArrayRef theArray, CFIndex idx)
{
  MEMORY[0x1E0C97DC0](theArray, idx);
}

void CFArraySetValueAtIndex(CFMutableArrayRef theArray, CFIndex idx, const void *value)
{
  MEMORY[0x1E0C97DD0](theArray, idx, value);
}

CFTypeID CFBooleanGetTypeID(void)
{
  return MEMORY[0x1E0C97FC8]();
}

Boolean CFBooleanGetValue(CFBooleanRef BOOLean)
{
  return MEMORY[0x1E0C97FE0](BOOLean);
}

CFStringRef CFBundleGetIdentifier(CFBundleRef bundle)
{
  return (CFStringRef)MEMORY[0x1E0C98120](bundle);
}

CFDictionaryRef CFBundleGetInfoDictionary(CFBundleRef bundle)
{
  return (CFDictionaryRef)MEMORY[0x1E0C98130](bundle);
}

CFBundleRef CFBundleGetMainBundle(void)
{
  return (CFBundleRef)MEMORY[0x1E0C98150]();
}

CFTypeRef CFBundleGetValueForInfoDictionaryKey(CFBundleRef bundle, CFStringRef key)
{
  return (CFTypeRef)MEMORY[0x1E0C98180](bundle, key);
}

void CFCharacterSetAddCharactersInString(CFMutableCharacterSetRef theSet, CFStringRef theString)
{
  MEMORY[0x1E0C982A8](theSet, theString);
}

CFMutableCharacterSetRef CFCharacterSetCreateMutableCopy(CFAllocatorRef alloc, CFCharacterSetRef theSet)
{
  return (CFMutableCharacterSetRef)MEMORY[0x1E0C982D0](alloc, theSet);
}

void CFCharacterSetRemoveCharactersInString(CFMutableCharacterSetRef theSet, CFStringRef theString)
{
  MEMORY[0x1E0C98340](theSet, theString);
}

CFDataRef CFDataCreate(CFAllocatorRef allocator, const UInt8 *bytes, CFIndex length)
{
  return (CFDataRef)MEMORY[0x1E0C983A0](allocator, bytes, length);
}

const UInt8 *__cdecl CFDataGetBytePtr(CFDataRef theData)
{
  return (const UInt8 *)MEMORY[0x1E0C983E0](theData);
}

void CFDataGetBytes(CFDataRef theData, CFRange range, UInt8 *buffer)
{
  MEMORY[0x1E0C983F0](theData, range.location, range.length, buffer);
}

CFIndex CFDataGetLength(CFDataRef theData)
{
  return MEMORY[0x1E0C983F8](theData);
}

void CFDictionaryAddValue(CFMutableDictionaryRef theDict, const void *key, const void *value)
{
  MEMORY[0x1E0C98500](theDict, key, value);
}

void CFDictionaryApplyFunction(CFDictionaryRef theDict, CFDictionaryApplierFunction applier, void *context)
{
  MEMORY[0x1E0C98508](theDict, applier, context);
}

CFDictionaryRef CFDictionaryCreate(CFAllocatorRef allocator, const void **keys, const void **values, CFIndex numValues, const CFDictionaryKeyCallBacks *keyCallBacks, const CFDictionaryValueCallBacks *valueCallBacks)
{
  return (CFDictionaryRef)MEMORY[0x1E0C98530](allocator, keys, values, numValues, keyCallBacks, valueCallBacks);
}

CFMutableDictionaryRef CFDictionaryCreateMutable(CFAllocatorRef allocator, CFIndex capacity, const CFDictionaryKeyCallBacks *keyCallBacks, const CFDictionaryValueCallBacks *valueCallBacks)
{
  return (CFMutableDictionaryRef)MEMORY[0x1E0C98550](allocator, capacity, keyCallBacks, valueCallBacks);
}

CFIndex CFDictionaryGetCount(CFDictionaryRef theDict)
{
  return MEMORY[0x1E0C98570](theDict);
}

CFTypeID CFDictionaryGetTypeID(void)
{
  return MEMORY[0x1E0C985A8]();
}

const void *__cdecl CFDictionaryGetValue(CFDictionaryRef theDict, const void *key)
{
  return (const void *)MEMORY[0x1E0C985B8](theDict, key);
}

void CFDictionaryRemoveAllValues(CFMutableDictionaryRef theDict)
{
  MEMORY[0x1E0C985D8](theDict);
}

void CFDictionarySetValue(CFMutableDictionaryRef theDict, const void *key, const void *value)
{
  MEMORY[0x1E0C98610](theDict, key, value);
}

Boolean CFEqual(CFTypeRef cf1, CFTypeRef cf2)
{
  return MEMORY[0x1E0C98620](cf1, cf2);
}

CFErrorRef CFErrorCreate(CFAllocatorRef allocator, CFErrorDomain domain, CFIndex code, CFDictionaryRef userInfo)
{
  return (CFErrorRef)MEMORY[0x1E0C98650](allocator, domain, code, userInfo);
}

CFIndex CFErrorGetCode(CFErrorRef err)
{
  return MEMORY[0x1E0C98660](err);
}

CFErrorDomain CFErrorGetDomain(CFErrorRef err)
{
  return (CFErrorDomain)MEMORY[0x1E0C98670](err);
}

CFTypeID CFGetTypeID(CFTypeRef cf)
{
  return MEMORY[0x1E0C98738](cf);
}

Boolean CFHTTPAuthenticationAppliesToRequest(CFHTTPAuthenticationRef auth, CFHTTPMessageRef request)
{
  return MEMORY[0x1E0C92748](auth, request);
}

CFHTTPAuthenticationRef CFHTTPAuthenticationCreateFromResponse(CFAllocatorRef alloc, CFHTTPMessageRef response)
{
  return (CFHTTPAuthenticationRef)MEMORY[0x1E0C92760](alloc, response);
}

Boolean CFHTTPAuthenticationIsValid(CFHTTPAuthenticationRef auth, CFStreamError *error)
{
  return MEMORY[0x1E0C92768](auth, error);
}

Boolean CFHTTPMessageAppendBytes(CFHTTPMessageRef message, const UInt8 *newBytes, CFIndex numBytes)
{
  return MEMORY[0x1E0C927D8](message, newBytes, numBytes);
}

Boolean CFHTTPMessageApplyCredentials(CFHTTPMessageRef request, CFHTTPAuthenticationRef auth, CFStringRef username, CFStringRef password, CFStreamError *error)
{
  return MEMORY[0x1E0C927E0](request, auth, username, password, error);
}

CFDictionaryRef CFHTTPMessageCopyAllHeaderFields(CFHTTPMessageRef message)
{
  return (CFDictionaryRef)MEMORY[0x1E0C927E8](message);
}

CFDataRef CFHTTPMessageCopyBody(CFHTTPMessageRef message)
{
  return (CFDataRef)MEMORY[0x1E0C927F0](message);
}

CFStringRef CFHTTPMessageCopyHeaderFieldValue(CFHTTPMessageRef message, CFStringRef headerField)
{
  return (CFStringRef)MEMORY[0x1E0C927F8](message, headerField);
}

CFURLRef CFHTTPMessageCopyRequestURL(CFHTTPMessageRef request)
{
  return (CFURLRef)MEMORY[0x1E0C92808](request);
}

CFStringRef CFHTTPMessageCopyResponseStatusLine(CFHTTPMessageRef response)
{
  return (CFStringRef)MEMORY[0x1E0C92810](response);
}

CFDataRef CFHTTPMessageCopySerializedMessage(CFHTTPMessageRef message)
{
  return (CFDataRef)MEMORY[0x1E0C92818](message);
}

CFStringRef CFHTTPMessageCopyVersion(CFHTTPMessageRef message)
{
  return (CFStringRef)MEMORY[0x1E0C92820](message);
}

CFHTTPMessageRef CFHTTPMessageCreateCopy(CFAllocatorRef alloc, CFHTTPMessageRef message)
{
  return (CFHTTPMessageRef)MEMORY[0x1E0C92828](alloc, message);
}

CFHTTPMessageRef CFHTTPMessageCreateEmpty(CFAllocatorRef alloc, Boolean isRequest)
{
  return (CFHTTPMessageRef)MEMORY[0x1E0C92830](alloc, isRequest);
}

CFHTTPMessageRef CFHTTPMessageCreateRequest(CFAllocatorRef alloc, CFStringRef requestMethod, CFURLRef url, CFStringRef httpVersion)
{
  return (CFHTTPMessageRef)MEMORY[0x1E0C92838](alloc, requestMethod, url, httpVersion);
}

CFHTTPMessageRef CFHTTPMessageCreateResponse(CFAllocatorRef alloc, CFIndex statusCode, CFStringRef statusDescription, CFStringRef httpVersion)
{
  return (CFHTTPMessageRef)MEMORY[0x1E0C92840](alloc, statusCode, statusDescription, httpVersion);
}

CFIndex CFHTTPMessageGetResponseStatusCode(CFHTTPMessageRef response)
{
  return MEMORY[0x1E0C92848](response);
}

Boolean CFHTTPMessageIsHeaderComplete(CFHTTPMessageRef message)
{
  return MEMORY[0x1E0C92858](message);
}

void CFHTTPMessageSetHeaderFieldValue(CFHTTPMessageRef message, CFStringRef headerField, CFStringRef value)
{
  MEMORY[0x1E0C92868](message, headerField, value);
}

CFRunLoopSourceRef CFNetworkExecuteProxyAutoConfigurationScript(CFStringRef proxyAutoConfigurationScript, CFURLRef targetURL, CFProxyAutoConfigurationResultCallback cb, CFStreamClientContext *clientContext)
{
  return (CFRunLoopSourceRef)MEMORY[0x1E0C928D0](proxyAutoConfigurationScript, targetURL, cb, clientContext);
}

CFRunLoopSourceRef CFNetworkExecuteProxyAutoConfigurationURL(CFURLRef proxyAutoConfigURL, CFURLRef targetURL, CFProxyAutoConfigurationResultCallback cb, CFStreamClientContext *clientContext)
{
  return (CFRunLoopSourceRef)MEMORY[0x1E0C928D8](proxyAutoConfigURL, targetURL, cb, clientContext);
}

CFNumberRef CFNumberCreate(CFAllocatorRef allocator, CFNumberType theType, const void *valuePtr)
{
  return (CFNumberRef)MEMORY[0x1E0C98928](allocator, theType, valuePtr);
}

CFTypeID CFNumberGetTypeID(void)
{
  return MEMORY[0x1E0C989B8]();
}

Boolean CFNumberGetValue(CFNumberRef number, CFNumberType theType, void *valuePtr)
{
  return MEMORY[0x1E0C989C0](number, theType, valuePtr);
}

Boolean CFPreferencesGetAppBooleanValue(CFStringRef key, CFStringRef applicationID, Boolean *keyExistsAndHasValidFormat)
{
  return MEMORY[0x1E0C98A70](key, applicationID, keyExistsAndHasValidFormat);
}

CFDataRef CFPropertyListCreateData(CFAllocatorRef allocator, CFPropertyListRef propertyList, CFPropertyListFormat format, CFOptionFlags options, CFErrorRef *error)
{
  return (CFDataRef)MEMORY[0x1E0C98AA0](allocator, propertyList, format, options, error);
}

CFPropertyListRef CFPropertyListCreateWithData(CFAllocatorRef allocator, CFDataRef data, CFOptionFlags options, CFPropertyListFormat *format, CFErrorRef *error)
{
  return (CFPropertyListRef)MEMORY[0x1E0C98AD0](allocator, data, options, format, error);
}

void CFRelease(CFTypeRef cf)
{
  MEMORY[0x1E0C98BC0](cf);
}

CFTypeRef CFRetain(CFTypeRef cf)
{
  return (CFTypeRef)MEMORY[0x1E0C98BD0](cf);
}

void CFRunLoopAddSource(CFRunLoopRef rl, CFRunLoopSourceRef source, CFRunLoopMode mode)
{
  MEMORY[0x1E0C98BF8](rl, source, mode);
}

void CFRunLoopAddTimer(CFRunLoopRef rl, CFRunLoopTimerRef timer, CFRunLoopMode mode)
{
  MEMORY[0x1E0C98C00](rl, timer, mode);
}

CFRunLoopRef CFRunLoopGetCurrent(void)
{
  return (CFRunLoopRef)MEMORY[0x1E0C98C30]();
}

void CFRunLoopPerformBlock(CFRunLoopRef rl, CFTypeRef mode, void *block)
{
  MEMORY[0x1E0C98C80](rl, mode, block);
}

void CFRunLoopSourceInvalidate(CFRunLoopSourceRef source)
{
  MEMORY[0x1E0C98CE0](source);
}

CFRunLoopTimerRef CFRunLoopTimerCreate(CFAllocatorRef allocator, CFAbsoluteTime fireDate, CFTimeInterval interval, CFOptionFlags flags, CFIndex order, CFRunLoopTimerCallBack callout, CFRunLoopTimerContext *context)
{
  return (CFRunLoopTimerRef)MEMORY[0x1E0C98D08](allocator, flags, order, callout, context, fireDate, interval);
}

void CFRunLoopTimerInvalidate(CFRunLoopTimerRef timer)
{
  MEMORY[0x1E0C98D48](timer);
}

void CFRunLoopWakeUp(CFRunLoopRef rl)
{
  MEMORY[0x1E0C98D68](rl);
}

void CFStringAppend(CFMutableStringRef theString, CFStringRef appendedString)
{
  MEMORY[0x1E0C98ED8](theString, appendedString);
}

void CFStringAppendCString(CFMutableStringRef theString, const char *cStr, CFStringEncoding encoding)
{
  MEMORY[0x1E0C98EE0](theString, cStr, *(_QWORD *)&encoding);
}

void CFStringAppendCharacters(CFMutableStringRef theString, const UniChar *chars, CFIndex numChars)
{
  MEMORY[0x1E0C98EE8](theString, chars, numChars);
}

void CFStringAppendFormat(CFMutableStringRef theString, CFDictionaryRef formatOptions, CFStringRef format, ...)
{
  MEMORY[0x1E0C98EF0](theString, formatOptions, format);
}

CFComparisonResult CFStringCompare(CFStringRef theString1, CFStringRef theString2, CFStringCompareFlags compareOptions)
{
  return MEMORY[0x1E0C98F10](theString1, theString2, compareOptions);
}

CFComparisonResult CFStringCompareWithOptions(CFStringRef theString1, CFStringRef theString2, CFRange rangeToCompare, CFStringCompareFlags compareOptions)
{
  return MEMORY[0x1E0C98F18](theString1, theString2, rangeToCompare.location, rangeToCompare.length, compareOptions);
}

CFArrayRef CFStringCreateArrayBySeparatingStrings(CFAllocatorRef alloc, CFStringRef theString, CFStringRef separatorString)
{
  return (CFArrayRef)MEMORY[0x1E0C98F58](alloc, theString, separatorString);
}

CFMutableStringRef CFStringCreateMutable(CFAllocatorRef alloc, CFIndex maxLength)
{
  return (CFMutableStringRef)MEMORY[0x1E0C98F90](alloc, maxLength);
}

CFMutableStringRef CFStringCreateMutableCopy(CFAllocatorRef alloc, CFIndex maxLength, CFStringRef theString)
{
  return (CFMutableStringRef)MEMORY[0x1E0C98F98](alloc, maxLength, theString);
}

CFStringRef CFStringCreateWithBytes(CFAllocatorRef alloc, const UInt8 *bytes, CFIndex numBytes, CFStringEncoding encoding, Boolean isExternalRepresentation)
{
  return (CFStringRef)MEMORY[0x1E0C98FB8](alloc, bytes, numBytes, *(_QWORD *)&encoding, isExternalRepresentation);
}

CFStringRef CFStringCreateWithBytesNoCopy(CFAllocatorRef alloc, const UInt8 *bytes, CFIndex numBytes, CFStringEncoding encoding, Boolean isExternalRepresentation, CFAllocatorRef contentsDeallocator)
{
  return (CFStringRef)MEMORY[0x1E0C98FC8](alloc, bytes, numBytes, *(_QWORD *)&encoding, isExternalRepresentation, contentsDeallocator);
}

CFStringRef CFStringCreateWithCString(CFAllocatorRef alloc, const char *cStr, CFStringEncoding encoding)
{
  return (CFStringRef)MEMORY[0x1E0C98FD0](alloc, cStr, *(_QWORD *)&encoding);
}

CFStringRef CFStringCreateWithCStringNoCopy(CFAllocatorRef alloc, const char *cStr, CFStringEncoding encoding, CFAllocatorRef contentsDeallocator)
{
  return (CFStringRef)MEMORY[0x1E0C98FE0](alloc, cStr, *(_QWORD *)&encoding, contentsDeallocator);
}

CFStringRef CFStringCreateWithFormat(CFAllocatorRef alloc, CFDictionaryRef formatOptions, CFStringRef format, ...)
{
  return (CFStringRef)MEMORY[0x1E0C99018](alloc, formatOptions, format);
}

CFStringRef CFStringCreateWithSubstring(CFAllocatorRef alloc, CFStringRef str, CFRange range)
{
  return (CFStringRef)MEMORY[0x1E0C99030](alloc, str, range.location, range.length);
}

CFRange CFStringFind(CFStringRef theString, CFStringRef stringToFind, CFStringCompareFlags compareOptions)
{
  CFIndex v3;
  CFIndex v4;
  CFRange result;

  v3 = MEMORY[0x1E0C99050](theString, stringToFind, compareOptions);
  result.length = v4;
  result.location = v3;
  return result;
}

Boolean CFStringGetCString(CFStringRef theString, char *buffer, CFIndex bufferSize, CFStringEncoding encoding)
{
  return MEMORY[0x1E0C99098](theString, buffer, bufferSize, *(_QWORD *)&encoding);
}

const char *__cdecl CFStringGetCStringPtr(CFStringRef theString, CFStringEncoding encoding)
{
  return (const char *)MEMORY[0x1E0C990A0](theString, *(_QWORD *)&encoding);
}

SInt32 CFStringGetIntValue(CFStringRef str)
{
  return MEMORY[0x1E0C990F0](str);
}

CFIndex CFStringGetLength(CFStringRef theString)
{
  return MEMORY[0x1E0C99100](theString);
}

CFIndex CFStringGetMaximumSizeForEncoding(CFIndex length, CFStringEncoding encoding)
{
  return MEMORY[0x1E0C99118](length, *(_QWORD *)&encoding);
}

CFTypeID CFStringGetTypeID(void)
{
  return MEMORY[0x1E0C99170]();
}

Boolean CFStringHasPrefix(CFStringRef theString, CFStringRef prefix)
{
  return MEMORY[0x1E0C99180](theString, prefix);
}

Boolean CFStringHasSuffix(CFStringRef theString, CFStringRef suffix)
{
  return MEMORY[0x1E0C99190](theString, suffix);
}

void CFStringTrimWhitespace(CFMutableStringRef theString)
{
  MEMORY[0x1E0C99258](theString);
}

CFURLRef CFURLCopyAbsoluteURL(CFURLRef relativeURL)
{
  return (CFURLRef)MEMORY[0x1E0C992C8](relativeURL);
}

CFStringRef CFURLCopyHostName(CFURLRef anURL)
{
  return (CFStringRef)MEMORY[0x1E0C992F0](anURL);
}

CFStringRef CFURLCopyPath(CFURLRef anURL)
{
  return (CFStringRef)MEMORY[0x1E0C99318](anURL);
}

CFStringRef CFURLCopyScheme(CFURLRef anURL)
{
  return (CFStringRef)MEMORY[0x1E0C99348](anURL);
}

CFURLRef CFURLCreateAbsoluteURLWithBytes(CFAllocatorRef alloc, const UInt8 *relativeURLBytes, CFIndex length, CFStringEncoding encoding, CFURLRef baseURL, Boolean useCompatibilityMode)
{
  return (CFURLRef)MEMORY[0x1E0C99360](alloc, relativeURLBytes, length, *(_QWORD *)&encoding, baseURL, useCompatibilityMode);
}

Boolean CFURLCreateDataAndPropertiesFromResource(CFAllocatorRef alloc, CFURLRef url, CFDataRef *resourceData, CFDictionaryRef *properties, CFArrayRef desiredProperties, SInt32 *errorCode)
{
  return MEMORY[0x1E0C993B0](alloc, url, resourceData, properties, desiredProperties, errorCode);
}

CFURLRef CFURLCreateWithString(CFAllocatorRef allocator, CFStringRef URLString, CFURLRef baseURL)
{
  return (CFURLRef)MEMORY[0x1E0C99448](allocator, URLString, baseURL);
}

uint64_t CFURLCredentialCopyPassword()
{
  return MEMORY[0x1E0C92968]();
}

uint64_t CFURLCredentialGetUsername()
{
  return MEMORY[0x1E0C92970]();
}

CFRange CFURLGetByteRangeForComponent(CFURLRef url, CFURLComponentType component, CFRange *rangeIncludingSeparators)
{
  CFIndex v3;
  CFIndex v4;
  CFRange result;

  v3 = MEMORY[0x1E0C99480](url, component, rangeIncludingSeparators);
  result.length = v4;
  result.location = v3;
  return result;
}

CFIndex CFURLGetBytes(CFURLRef url, UInt8 *buffer, CFIndex bufferLength)
{
  return MEMORY[0x1E0C99488](url, buffer, bufferLength);
}

SInt32 CFURLGetPortNumber(CFURLRef anURL)
{
  return MEMORY[0x1E0C99498](anURL);
}

uint64_t CFURLProtectionSpaceCreate()
{
  return MEMORY[0x1E0C92978]();
}

uint64_t CFURLRequestCopyHTTPCookieStorage()
{
  return MEMORY[0x1E0C929A8]();
}

uint64_t CFURLRequestCopyHTTPRequest()
{
  return MEMORY[0x1E0C929B0]();
}

uint64_t CFURLRequestCreateHTTPRequest()
{
  return MEMORY[0x1E0C929B8]();
}

uint64_t CFURLRequestGetProxySettings()
{
  return MEMORY[0x1E0C929D0]();
}

uint64_t CFURLResponseCreateWithHTTPResponse()
{
  return MEMORY[0x1E0C92A58]();
}

uint64_t CFURLResponseGetExpirationTime()
{
  return MEMORY[0x1E0C92A60]();
}

uint64_t CFURLResponseGetHTTPResponse()
{
  return MEMORY[0x1E0C92A68]();
}

uint64_t DNSServiceAttrSetValidationData()
{
  return MEMORY[0x1E0C80408]();
}

DNSServiceAttributeRef DNSServiceAttributeCreate(void)
{
  return (DNSServiceAttributeRef)MEMORY[0x1E0C80410]();
}

void DNSServiceAttributeDeallocate(DNSServiceAttributeRef attr)
{
  MEMORY[0x1E0C80418](attr);
}

uint64_t DNSServiceBrowseEx()
{
  return MEMORY[0x1E0C80428]();
}

DNSServiceErrorType DNSServiceConstructFullName(char *const fullName, const char *const service, const char *const regtype, const char *const domain)
{
  return MEMORY[0x1E0C80430](fullName, service, regtype, domain);
}

DNSServiceErrorType DNSServiceCreateConnection(DNSServiceRef *sdRef)
{
  return MEMORY[0x1E0C80438](sdRef);
}

uint64_t DNSServiceCreateDelegateConnection()
{
  return MEMORY[0x1E0C80440]();
}

DNSServiceErrorType DNSServiceEnumerateDomains(DNSServiceRef *sdRef, DNSServiceFlags flags, uint32_t interfaceIndex, DNSServiceDomainEnumReply callBack, void *context)
{
  return MEMORY[0x1E0C80448](sdRef, *(_QWORD *)&flags, *(_QWORD *)&interfaceIndex, callBack, context);
}

uint64_t DNSServiceErrorCodeToString()
{
  return MEMORY[0x1E0C80450]();
}

DNSServiceErrorType DNSServiceGetAddrInfo(DNSServiceRef *sdRef, DNSServiceFlags flags, uint32_t interfaceIndex, DNSServiceProtocol protocol, const char *hostname, DNSServiceGetAddrInfoReply callBack, void *context)
{
  return MEMORY[0x1E0C80458](sdRef, *(_QWORD *)&flags, *(_QWORD *)&interfaceIndex, *(_QWORD *)&protocol, hostname, callBack, context);
}

uint64_t DNSServiceGetAddrInfoEx()
{
  return MEMORY[0x1E0C80460]();
}

uint64_t DNSServiceGetValidationData()
{
  return MEMORY[0x1E0C80468]();
}

DNSServiceErrorType DNSServiceProcessResult(DNSServiceRef sdRef)
{
  return MEMORY[0x1E0C80470](sdRef);
}

DNSServiceErrorType DNSServiceQueryRecordWithAttribute(DNSServiceRef *sdRef, DNSServiceFlags flags, uint32_t ifindex, const char *name, uint16_t rrtype, uint16_t rrclass, const DNSServiceAttribute *attr, DNSServiceQueryRecordReply callback, void *context)
{
  return MEMORY[0x1E0C80480](sdRef, *(_QWORD *)&flags, *(_QWORD *)&ifindex, name, rrtype, rrclass, attr, callback);
}

void DNSServiceRefDeallocate(DNSServiceRef sdRef)
{
  MEMORY[0x1E0C80490](sdRef);
}

dnssd_sock_t DNSServiceRefSockFD(DNSServiceRef sdRef)
{
  return MEMORY[0x1E0C80498](sdRef);
}

DNSServiceErrorType DNSServiceRegister(DNSServiceRef *sdRef, DNSServiceFlags flags, uint32_t interfaceIndex, const char *name, const char *regtype, const char *domain, const char *host, uint16_t port, uint16_t txtLen, const void *txtRecord, DNSServiceRegisterReply callBack, void *context)
{
  return MEMORY[0x1E0C804A0](sdRef, *(_QWORD *)&flags, *(_QWORD *)&interfaceIndex, name, regtype, domain, host, port);
}

uint64_t DNSServiceResolveEx()
{
  return MEMORY[0x1E0C804C0]();
}

DNSServiceErrorType DNSServiceSetDispatchQueue(DNSServiceRef service, dispatch_queue_t queue)
{
  return MEMORY[0x1E0C804C8](service, queue);
}

uint64_t DNSServiceSetResolverDefaults()
{
  return MEMORY[0x1E0C804D0]();
}

DNSServiceErrorType DNSServiceSleepKeepalive(DNSServiceRef *sdRef, DNSServiceFlags flags, int fd, unsigned int timeout, DNSServiceSleepKeepaliveReply callBack, void *context)
{
  return MEMORY[0x1E0C804D8](sdRef, *(_QWORD *)&flags, *(_QWORD *)&fd, *(_QWORD *)&timeout, callBack, context);
}

DNSServiceErrorType DNSServiceUpdateRecord(DNSServiceRef sdRef, DNSRecordRef recordRef, DNSServiceFlags flags, uint16_t rdlen, const void *rdata, uint32_t ttl)
{
  return MEMORY[0x1E0C804E0](sdRef, recordRef, *(_QWORD *)&flags, rdlen, rdata, *(_QWORD *)&ttl);
}

IOReturn IOPMAssertionCreateWithProperties(CFDictionaryRef AssertionProperties, IOPMAssertionID *AssertionID)
{
  return MEMORY[0x1E0CBB710](AssertionProperties, AssertionID);
}

IOReturn IOPMAssertionRelease(IOPMAssertionID AssertionID)
{
  return MEMORY[0x1E0CBB730](*(_QWORD *)&AssertionID);
}

uint64_t MGCopyAnswer()
{
  return MEMORY[0x1E0DE2B20]();
}

uint64_t MGGetBoolAnswer()
{
  return MEMORY[0x1E0DE2B50]();
}

uint64_t NEHelperCacheCopyAppUUIDMappingExtended()
{
  return MEMORY[0x1E0C80500]();
}

uint64_t NEHelperCacheCopySigningIdentifierMapping()
{
  return MEMORY[0x1E0C80510]();
}

uint64_t NEHelperCopyDataForCertificate()
{
  return MEMORY[0x1E0C80530]();
}

uint64_t NEHelperCopyPerAppDomains()
{
  return MEMORY[0x1E0C80538]();
}

uint64_t NEHelperCopyXPCEndpointForIdentityProxy()
{
  return MEMORY[0x1E0C80540]();
}

Class NSClassFromString(NSString *aClassName)
{
  return (Class)MEMORY[0x1E0CB28A0](aClassName);
}

SEL NSSelectorFromString(NSString *aSelectorName)
{
  return (SEL)MEMORY[0x1E0CB3190](aSelectorName);
}

NSString *__cdecl NSStringFromClass(Class aClass)
{
  return (NSString *)MEMORY[0x1E0CB3200](aClass);
}

NSString *__cdecl NSStringFromSelector(SEL aSelector)
{
  return (NSString *)MEMORY[0x1E0CB3230](aSelector);
}

uint64_t PBDataWriterWriteBOOLField()
{
  return MEMORY[0x1E0D82C10]();
}

uint64_t PBDataWriterWriteDataField()
{
  return MEMORY[0x1E0D82C28]();
}

uint64_t PBDataWriterWriteInt32Field()
{
  return MEMORY[0x1E0D82C58]();
}

uint64_t PBDataWriterWriteStringField()
{
  return MEMORY[0x1E0D82C98]();
}

uint64_t PBDataWriterWriteSubmessage()
{
  return MEMORY[0x1E0D82CB0]();
}

uint64_t PBDataWriterWriteUint32Field()
{
  return MEMORY[0x1E0D82CB8]();
}

uint64_t PBReaderPlaceMark()
{
  return MEMORY[0x1E0D82CE0]();
}

uint64_t PBReaderReadData()
{
  return MEMORY[0x1E0D82CF0]();
}

uint64_t PBReaderReadString()
{
  return MEMORY[0x1E0D82D00]();
}

uint64_t PBReaderRecallMark()
{
  return MEMORY[0x1E0D82D10]();
}

uint64_t PBReaderSkipValueWithTag()
{
  return MEMORY[0x1E0D82D28]();
}

uint64_t PBRepeatedInt32Add()
{
  return MEMORY[0x1E0D82DD8]();
}

uint64_t PBRepeatedInt32Clear()
{
  return MEMORY[0x1E0D82DE0]();
}

uint64_t PBRepeatedInt32Copy()
{
  return MEMORY[0x1E0D82DE8]();
}

uint64_t PBRepeatedInt32Hash()
{
  return MEMORY[0x1E0D82DF0]();
}

uint64_t PBRepeatedInt32IsEqual()
{
  return MEMORY[0x1E0D82DF8]();
}

SecAccessControlRef SecAccessControlCreateWithFlags(CFAllocatorRef allocator, CFTypeRef protection, SecAccessControlCreateFlags flags, CFErrorRef *error)
{
  return (SecAccessControlRef)MEMORY[0x1E0CD5EA8](allocator, protection, flags, error);
}

uint64_t SecCertificateCopyDNSNames()
{
  return MEMORY[0x1E0CD5F58]();
}

uint64_t SecCertificateCreateWithBytes()
{
  return MEMORY[0x1E0CD6008]();
}

CFStringRef SecCopyErrorMessageString(OSStatus status, void *reserved)
{
  return (CFStringRef)MEMORY[0x1E0CD6218](*(_QWORD *)&status, reserved);
}

uint64_t SecGenerateSelfSignedCertificate()
{
  return MEMORY[0x1E0CD6268]();
}

OSStatus SecIdentityCopyPrivateKey(SecIdentityRef identityRef, SecKeyRef *privateKeyRef)
{
  return MEMORY[0x1E0CD6278](identityRef, privateKeyRef);
}

uint64_t SecIdentityCreate()
{
  return MEMORY[0x1E0CD6280]();
}

OSStatus SecItemCopyMatching(CFDictionaryRef query, CFTypeRef *result)
{
  return MEMORY[0x1E0CD6298](query, result);
}

uint64_t SecKeyCopyPublicBytes()
{
  return MEMORY[0x1E0CD6310]();
}

SecKeyRef SecKeyCopyPublicKey(SecKeyRef key)
{
  return (SecKeyRef)MEMORY[0x1E0CD6318](key);
}

uint64_t SecKeyCopySubjectPublicKeyInfo()
{
  return MEMORY[0x1E0CD6328]();
}

SecKeyRef SecKeyCreateRandomKey(CFDictionaryRef parameters, CFErrorRef *error)
{
  return (SecKeyRef)MEMORY[0x1E0CD6388](parameters, error);
}

CFDataRef SecKeyCreateSignature(SecKeyRef key, SecKeyAlgorithm algorithm, CFDataRef dataToSign, CFErrorRef *error)
{
  return (CFDataRef)MEMORY[0x1E0CD6390](key, algorithm, dataToSign, error);
}

SecKeyRef SecKeyCreateWithData(CFDataRef keyData, CFDictionaryRef attributes, CFErrorRef *error)
{
  return (SecKeyRef)MEMORY[0x1E0CD63A0](keyData, attributes, error);
}

Boolean SecKeyVerifySignature(SecKeyRef key, SecKeyAlgorithm algorithm, CFDataRef signedData, CFDataRef signature, CFErrorRef *error)
{
  return MEMORY[0x1E0CD6418](key, algorithm, signedData, signature, error);
}

SecPolicyRef SecPolicyCreateSSL(Boolean server, CFStringRef hostname)
{
  return (SecPolicyRef)MEMORY[0x1E0CD6520](server, hostname);
}

uint64_t SecPolicyCreateSSLWithATSPinning()
{
  return MEMORY[0x1E0CD6528]();
}

CFTypeRef SecTaskCopyValueForEntitlement(SecTaskRef task, CFStringRef entitlement, CFErrorRef *error)
{
  return (CFTypeRef)MEMORY[0x1E0CD65F0](task, entitlement, error);
}

SecTaskRef SecTaskCreateFromSelf(CFAllocatorRef allocator)
{
  return (SecTaskRef)MEMORY[0x1E0CD6610](allocator);
}

CFArrayRef SecTrustCopyCertificateChain(SecTrustRef trust)
{
  return (CFArrayRef)MEMORY[0x1E0CD6648](trust);
}

CFDataRef SecTrustCopyExceptions(SecTrustRef trust)
{
  return (CFDataRef)MEMORY[0x1E0CD6658](trust);
}

SecKeyRef SecTrustCopyKey(SecTrustRef trust)
{
  return (SecKeyRef)MEMORY[0x1E0CD6670](trust);
}

OSStatus SecTrustEvaluateAsyncWithError(SecTrustRef trust, dispatch_queue_t queue, SecTrustWithErrorCallback result)
{
  return MEMORY[0x1E0CD66B8](trust, queue, result);
}

BOOL SecTrustEvaluateWithError(SecTrustRef trust, CFErrorRef *error)
{
  return MEMORY[0x1E0CD66C8](trust, error);
}

BOOL SecTrustSetExceptions(SecTrustRef trust, CFDataRef exceptions)
{
  return MEMORY[0x1E0CD6728](trust, exceptions);
}

uint64_t SecTrustSetPinningPolicyName()
{
  return MEMORY[0x1E0CD6740]();
}

OSStatus SecTrustSetPolicies(SecTrustRef trust, CFTypeRef policies)
{
  return MEMORY[0x1E0CD6748](trust, policies);
}

void *__cdecl _Block_copy(const void *aBlock)
{
  return (void *)MEMORY[0x1E0C80928](aBlock);
}

void _Block_object_assign(void *a1, const void *a2, const int a3)
{
  MEMORY[0x1E0C80940](a1, a2, *(_QWORD *)&a3);
}

void _Block_object_dispose(const void *a1, const int a2)
{
  MEMORY[0x1E0C80948](a1, *(_QWORD *)&a2);
}

void _Block_release(const void *aBlock)
{
  MEMORY[0x1E0C80958](aBlock);
}

uint64_t _CFGetProgname()
{
  return MEMORY[0x1E0C9A1C0]();
}

uint64_t _CFHTTPAuthenticationAppSSOIsPerformDefaultHandlingError()
{
  return MEMORY[0x1E0C92D40]();
}

uint64_t _CFHTTPAuthenticationAppSSOShouldManageURL()
{
  return MEMORY[0x1E0C92D48]();
}

uint64_t _CFHTTPAuthenticationApplyProxyAuthorizationToRequest()
{
  return MEMORY[0x1E0C92D50]();
}

uint64_t _CFHTTPAuthenticationAskAccountsForCreds()
{
  return MEMORY[0x1E0C92D58]();
}

uint64_t _CFHTTPAuthenticationCanRecoverFromKerberosFailure()
{
  return MEMORY[0x1E0C92D60]();
}

uint64_t _CFHTTPAuthenticationCheckOriginAllowedAsThirdParty()
{
  return MEMORY[0x1E0C92D68]();
}

uint64_t _CFHTTPAuthenticationClearAccountRefreshState()
{
  return MEMORY[0x1E0C92D70]();
}

uint64_t _CFHTTPAuthenticationCopySortedAuthSchemes()
{
  return MEMORY[0x1E0C92D78]();
}

uint64_t _CFHTTPAuthenticationCreateFromResponseWithFlags()
{
  return MEMORY[0x1E0C92D80]();
}

uint64_t _CFHTTPAuthenticationCreateNTLMHeaderForRequest()
{
  return MEMORY[0x1E0C92D88]();
}

uint64_t _CFHTTPAuthenticationCreateNegotiateHeaderForRequest()
{
  return MEMORY[0x1E0C92D90]();
}

uint64_t _CFHTTPAuthenticationDisableAppSSO()
{
  return MEMORY[0x1E0C92D98]();
}

uint64_t _CFHTTPAuthenticationFailedToGetKerberosTicket()
{
  return MEMORY[0x1E0C92DA0]();
}

uint64_t _CFHTTPAuthenticationFetchProxyCredentialFromAuthBroker()
{
  return MEMORY[0x1E0C92DA8]();
}

uint64_t _CFHTTPAuthenticationGetAuthHeadersFromAppSSO()
{
  return MEMORY[0x1E0C92DB0]();
}

uint64_t _CFHTTPAuthenticationGetPATAuthHeaders()
{
  return MEMORY[0x1E0C92DB8]();
}

uint64_t _CFHTTPAuthenticationGetPATSchemes()
{
  return MEMORY[0x1E0C92DC0]();
}

uint64_t _CFHTTPAuthenticationGetSchemesDict()
{
  return MEMORY[0x1E0C92DC8]();
}

uint64_t _CFHTTPAuthenticationIsSecondNTLMTransaction()
{
  return MEMORY[0x1E0C92DD0]();
}

uint64_t _CFHTTPAuthenticationSetPreferredScheme()
{
  return MEMORY[0x1E0C92DD8]();
}

uint64_t _CFHTTPAuthenticationUpdateFromResponse()
{
  return MEMORY[0x1E0C92DE0]();
}

uint64_t _CFHTTPAuthenticationUsingAppSSO()
{
  return MEMORY[0x1E0C92DE8]();
}

uint64_t _CFHTTPMessageAddHeaderFieldValue()
{
  return MEMORY[0x1E0C92E00]();
}

uint64_t _CFHTTPMessageSetResponseProxyURL()
{
  return MEMORY[0x1E0C92E08]();
}

uint64_t _CFHTTPMessageSetResponseURL()
{
  return MEMORY[0x1E0C92E10]();
}

uint64_t _CFHostGetTopLevelDomain()
{
  return MEMORY[0x1E0C92EA0]();
}

uint64_t _CFNetworkCopyPreferredLanguageCode()
{
  return MEMORY[0x1E0C92ED8]();
}

uint64_t _CFNetworkErrorCopyLocalizedDescriptionWithHostname()
{
  return MEMORY[0x1E0C92EE0]();
}

uint64_t _CFNetworkErrorGetLocalizedFailureReason()
{
  return MEMORY[0x1E0C92EE8]();
}

uint64_t _CFNetworkErrorGetLocalizedRecoverySuggestion()
{
  return MEMORY[0x1E0C92EF0]();
}

uint64_t _CFNetworkExecuteProxyAutoConfigurationURLDelegated()
{
  return MEMORY[0x1E0C92EF8]();
}

uint64_t _CFStringCreateByAddingPercentEncodingWithAllowedCharacters()
{
  return MEMORY[0x1E0C9A4E8]();
}

uint64_t _CFStringCreateByRemovingPercentEncoding()
{
  return MEMORY[0x1E0C9A4F0]();
}

uint64_t _CFURLComponentsGetURLPathAllowedCharacterSet()
{
  return MEMORY[0x1E0C9A5E8]();
}

uint64_t _CFURLRequestCopyProtocolPropertyForKey()
{
  return MEMORY[0x1E0C92F58]();
}

uint64_t _CFURLResponseMustRevalidate()
{
  return MEMORY[0x1E0C92F80]();
}

uint64_t _CFXPCCreateCFObjectFromXPCObject()
{
  return MEMORY[0x1E0C9A800]();
}

uint64_t _CFXPCCreateXPCObjectFromCFObject()
{
  return MEMORY[0x1E0C9A818]();
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
  MEMORY[0x1E0C80A20](exception_object);
}

const std::locale::facet *__cdecl std::locale::use_facet(const std::locale *this, std::locale::id *a2)
{
  return (const std::locale::facet *)MEMORY[0x1E0DE4248](this, a2);
}

std::locale std::ios_base::getloc(const std::ios_base *this)
{
  return (std::locale)MEMORY[0x1E0DE4258](this);
}

void std::__call_once(std::once_flag::_State_type *a1, void *a2, void (__cdecl *a3)(void *))
{
  MEMORY[0x1E0DE43A8](a1, a2, a3);
}

size_t std::__next_prime(size_t __n)
{
  return MEMORY[0x1E0DE43E8](__n);
}

std::string *__cdecl std::string::append(std::string *this, const std::string::value_type *__s, std::string::size_type __n)
{
  return (std::string *)MEMORY[0x1E0DE4428](this, __s, __n);
}

uint64_t std::ostream::put()
{
  return MEMORY[0x1E0DE4698]();
}

uint64_t std::ostream::flush()
{
  return MEMORY[0x1E0DE46A0]();
}

uint64_t std::ostream::write()
{
  return MEMORY[0x1E0DE46A8]();
}

uint64_t std::ostream::sentry::sentry()
{
  return MEMORY[0x1E0DE46B0]();
}

uint64_t std::ostream::sentry::~sentry()
{
  return MEMORY[0x1E0DE46B8]();
}

uint64_t std::ostream::~ostream()
{
  return MEMORY[0x1E0DE46C8]();
}

uint64_t std::ostream::operator<<()
{
  return MEMORY[0x1E0DE46D0]();
}

{
  return MEMORY[0x1E0DE4700]();
}

{
  return MEMORY[0x1E0DE4708]();
}

{
  return MEMORY[0x1E0DE4718]();
}

{
  return MEMORY[0x1E0DE4728]();
}

uint64_t std::streambuf::basic_streambuf()
{
  return MEMORY[0x1E0DE47E0]();
}

uint64_t std::streambuf::~streambuf()
{
  return MEMORY[0x1E0DE47E8]();
}

void std::__libcpp_verbose_abort(const char *__format, ...)
{
  MEMORY[0x1E0DE4930](__format);
}

std::locale *__cdecl std::locale::locale(std::locale *this, const std::locale *a2)
{
  return (std::locale *)MEMORY[0x1E0DE4B88](this, a2);
}

void std::locale::~locale(std::locale *this)
{
  MEMORY[0x1E0DE4B98](this);
}

const std::locale *__cdecl std::locale::operator=(std::locale *this, const std::locale *a2)
{
  return (const std::locale *)MEMORY[0x1E0DE4BA0](this, a2);
}

unint64_t std::stoull(const std::string *__str, size_t *__idx, int __base)
{
  return MEMORY[0x1E0DE4BA8](__str, __idx, *(_QWORD *)&__base);
}

void std::ios_base::init(std::ios_base *this, void *__sb)
{
  MEMORY[0x1E0DE4C68](this, __sb);
}

void std::ios_base::move(std::ios_base *this, std::ios_base *a2)
{
  MEMORY[0x1E0DE4C70](this, a2);
}

void std::ios_base::clear(std::ios_base *this, std::ios_base::iostate __state)
{
  MEMORY[0x1E0DE4C80](this, *(_QWORD *)&__state);
}

uint64_t std::ios::~ios()
{
  return MEMORY[0x1E0DE4D28]();
}

void std::terminate(void)
{
  MEMORY[0x1E0DE4E18]();
}

void operator delete(void *__p)
{
  off_1E148AF78(__p);
}

uint64_t operator delete()
{
  return off_1E148AF80();
}

void *__cdecl operator new(size_t __sz)
{
  return (void *)off_1E148AF88(__sz);
}

void __assert_rtn(const char *a1, const char *a2, int a3, const char *a4)
{
  MEMORY[0x1E0C80A58](a1, a2, *(_QWORD *)&a3, a4);
}

void *__cxa_begin_catch(void *a1)
{
  return (void *)MEMORY[0x1E0DE5080](a1);
}

int __cxa_guard_acquire(__guard *a1)
{
  return MEMORY[0x1E0DE50B8](a1);
}

void __cxa_guard_release(__guard *a1)
{
  MEMORY[0x1E0DE50C0](a1);
}

int *__error(void)
{
  return (int *)MEMORY[0x1E0C80AC0]();
}

double __exp10(double a1)
{
  double result;

  MEMORY[0x1E0C80AC8](a1);
  return result;
}

int __maskrune(__darwin_ct_rune_t a1, unint64_t a2)
{
  return MEMORY[0x1E0C80B50](*(_QWORD *)&a1, a2);
}

uint64_t __memcpy_chk()
{
  return MEMORY[0x1E0C80B68]();
}

uint64_t __strlcpy_chk()
{
  return MEMORY[0x1E0C80C48]();
}

__darwin_ct_rune_t __tolower(__darwin_ct_rune_t a1)
{
  return MEMORY[0x1E0C80C70](*(_QWORD *)&a1);
}

__darwin_ct_rune_t __toupper(__darwin_ct_rune_t a1)
{
  return MEMORY[0x1E0C80C78](*(_QWORD *)&a1);
}

uint64_t _class_setCustomDeallocInitiation()
{
  return MEMORY[0x1E0DE7940]();
}

uint64_t _dispatch_is_fork_of_multithreaded_parent()
{
  return MEMORY[0x1E0C80D28]();
}

uint64_t _dispatch_is_multithreaded()
{
  return MEMORY[0x1E0C80D30]();
}

uint64_t _dispatch_source_will_reenable_kevent_4NW()
{
  return MEMORY[0x1E0C80DF8]();
}

uint64_t _os_assert_log()
{
  return MEMORY[0x1E0C80FF0]();
}

uint64_t _os_crash()
{
  return MEMORY[0x1E0C81000]();
}

uint64_t _os_crash_msg()
{
  return MEMORY[0x1E0C81008]();
}

uint64_t _os_feature_enabled_impl()
{
  return MEMORY[0x1E0C81010]();
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x1E0C81048](dso, log, type, format, buf, *(_QWORD *)&size);
}

uint64_t _os_log_send_and_compose_impl()
{
  return MEMORY[0x1E0C81068]();
}

uint64_t _os_object_alloc()
{
  return MEMORY[0x1E0C81098]();
}

void _os_signpost_emit_with_name_impl(void *dso, os_log_t log, os_signpost_type_t type, os_signpost_id_t spid, const char *name, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x1E0C810D0](dso, log, type, spid, name, format, buf, *(_QWORD *)&size);
}

uint64_t _swift_isClassOrObjCExistentialType()
{
  return MEMORY[0x1E0DEE9F8]();
}

uint64_t _swift_stdlib_bridgeErrorToNSError()
{
  return MEMORY[0x1E0DEEA28]();
}

uint64_t _swift_stdlib_strtod_clocale()
{
  return MEMORY[0x1E0DEEA50]();
}

uint64_t _swift_stdlib_strtof_clocale()
{
  return MEMORY[0x1E0DEEA58]();
}

uint64_t _symptoms_daemon_fallback_initial_disposition()
{
  return MEMORY[0x1E0C81218]();
}

uint64_t _symptoms_daemon_fallback_subseq_disposition()
{
  return MEMORY[0x1E0C81220]();
}

uint64_t _symptoms_is_daemon_fallback_blacklisted()
{
  return MEMORY[0x1E0C81228]();
}

void abort(void)
{
  MEMORY[0x1E0C813A8]();
}

int accept(int a1, sockaddr *a2, socklen_t *a3)
{
  return MEMORY[0x1E0C813C8](*(_QWORD *)&a1, a2, a3);
}

uint32_t arc4random(void)
{
  return MEMORY[0x1E0C81570]();
}

void arc4random_buf(void *__buf, size_t __nbytes)
{
  MEMORY[0x1E0C81580](__buf, __nbytes);
}

uint32_t arc4random_uniform(uint32_t __upper_bound)
{
  return MEMORY[0x1E0C81588](*(_QWORD *)&__upper_bound);
}

int asprintf(char **a1, const char *a2, ...)
{
  return MEMORY[0x1E0C81608](a1, a2);
}

int atexit(void (*a1)(void))
{
  return MEMORY[0x1E0C81648](a1);
}

int atoi(const char *a1)
{
  return MEMORY[0x1E0C81668](a1);
}

int backtrace(void **a1, int a2)
{
  return MEMORY[0x1E0C816B8](a1, *(_QWORD *)&a2);
}

char **__cdecl backtrace_symbols(void *const *a1, int a2)
{
  return (char **)MEMORY[0x1E0C816C8](a1, *(_QWORD *)&a2);
}

int bind(int a1, const sockaddr *a2, socklen_t a3)
{
  return MEMORY[0x1E0C816F0](*(_QWORD *)&a1, a2, *(_QWORD *)&a3);
}

kern_return_t bootstrap_look_up(mach_port_t bp, const name_t service_name, mach_port_t *sp)
{
  return MEMORY[0x1E0C81708](*(_QWORD *)&bp, service_name, sp);
}

void bzero(void *a1, size_t a2)
{
  MEMORY[0x1E0C81758](a1, a2);
}

uint64_t cc_cmp_safe()
{
  return MEMORY[0x1E0C81870]();
}

uint64_t ccaes_gcm_decrypt_mode()
{
  return MEMORY[0x1E0C818B0]();
}

uint64_t ccaes_gcm_encrypt_mode()
{
  return MEMORY[0x1E0C818B8]();
}

uint64_t ccgcm_one_shot()
{
  return MEMORY[0x1E0C81EF8]();
}

uint64_t cchkdf_expand()
{
  return MEMORY[0x1E0C82098]();
}

uint64_t cchkdf_extract()
{
  return MEMORY[0x1E0C820A0]();
}

uint64_t cchpke_initiator_encrypt()
{
  return MEMORY[0x1E0C820C8]();
}

uint64_t cchpke_initiator_export()
{
  return MEMORY[0x1E0C820D0]();
}

uint64_t cchpke_initiator_setup()
{
  return MEMORY[0x1E0C820D8]();
}

uint64_t cchpke_params_sizeof_aead_key()
{
  return MEMORY[0x1E0C820E0]();
}

uint64_t cchpke_params_sizeof_aead_nonce()
{
  return MEMORY[0x1E0C820E8]();
}

uint64_t cchpke_params_sizeof_aead_tag()
{
  return MEMORY[0x1E0C820F0]();
}

uint64_t cchpke_params_sizeof_kdf_hash()
{
  return MEMORY[0x1E0C820F8]();
}

uint64_t cchpke_params_sizeof_kem_enc()
{
  return MEMORY[0x1E0C82100]();
}

uint64_t cchpke_params_x25519_AESGCM128_HKDF_SHA256()
{
  return MEMORY[0x1E0C82108]();
}

uint64_t cchpke_responder_decrypt()
{
  return MEMORY[0x1E0C82110]();
}

uint64_t cchpke_responder_export()
{
  return MEMORY[0x1E0C82118]();
}

uint64_t cchpke_responder_setup()
{
  return MEMORY[0x1E0C82120]();
}

uint64_t ccrng()
{
  return MEMORY[0x1E0C822A8]();
}

uint64_t ccsha256_di()
{
  return MEMORY[0x1E0C823E0]();
}

uint64_t change_fdguard_np()
{
  return MEMORY[0x1E0C82620]();
}

BOOL class_addMethod(Class cls, SEL name, IMP imp, const char *types)
{
  return MEMORY[0x1E0DE7A50](cls, name, imp, types);
}

Method *__cdecl class_copyMethodList(Class cls, unsigned int *outCount)
{
  return (Method *)MEMORY[0x1E0DE7A78](cls, outCount);
}

id class_createInstance(Class cls, size_t extraBytes)
{
  return (id)MEMORY[0x1E0DE7A90](cls, extraBytes);
}

Method class_getInstanceMethod(Class cls, SEL name)
{
  return (Method)MEMORY[0x1E0DE7AA8](cls, name);
}

size_t class_getInstanceSize(Class cls)
{
  return MEMORY[0x1E0DE7AB0](cls);
}

Ivar class_getInstanceVariable(Class cls, const char *name)
{
  return (Ivar)MEMORY[0x1E0DE7AB8](cls, name);
}

IMP class_replaceMethod(Class cls, SEL name, IMP imp, const char *types)
{
  return (IMP)MEMORY[0x1E0DE7AF0](cls, name, imp, types);
}

__uint64_t clock_gettime_nsec_np(clockid_t __clock_id)
{
  return MEMORY[0x1E0C82670](*(_QWORD *)&__clock_id);
}

int close(int a1)
{
  return MEMORY[0x1E0C82688](*(_QWORD *)&a1);
}

compression_status compression_stream_destroy(compression_stream *stream)
{
  return MEMORY[0x1E0DE5290](stream);
}

compression_status compression_stream_init(compression_stream *stream, compression_stream_operation operation, compression_algorithm algorithm)
{
  return MEMORY[0x1E0DE52A0](stream, *(_QWORD *)&operation, *(_QWORD *)&algorithm);
}

compression_status compression_stream_process(compression_stream *stream, int flags)
{
  return MEMORY[0x1E0DE52B0](stream, *(_QWORD *)&flags);
}

uint64_t config_agent_copy_dns_information()
{
  return MEMORY[0x1E0C826A8]();
}

uint64_t config_agent_copy_proxy_information()
{
  return MEMORY[0x1E0C826B0]();
}

uint64_t config_agent_free_dns_information()
{
  return MEMORY[0x1E0C826B8]();
}

uint64_t config_agent_free_proxy_information()
{
  return MEMORY[0x1E0C826C0]();
}

uint64_t config_agent_update_proxy_information()
{
  return MEMORY[0x1E0C826C8]();
}

int connect(int a1, const sockaddr *a2, socklen_t a3)
{
  return MEMORY[0x1E0C826D8](*(_QWORD *)&a1, a2, *(_QWORD *)&a3);
}

int connectx(int a1, const sa_endpoints_t *a2, sae_associd_t a3, unsigned int a4, const iovec *a5, unsigned int a6, size_t *a7, sae_connid_t *a8)
{
  return MEMORY[0x1E0C826E0](*(_QWORD *)&a1, a2, *(_QWORD *)&a3, *(_QWORD *)&a4, a5, *(_QWORD *)&a6, a7, a8);
}

int deflate(z_streamp strm, int flush)
{
  return MEMORY[0x1E0DE92C0](strm, *(_QWORD *)&flush);
}

int deflateEnd(z_streamp strm)
{
  return MEMORY[0x1E0DE92D0](strm);
}

int deflateInit2_(z_streamp strm, int level, int method, int windowBits, int memLevel, int strategy, const char *version, int stream_size)
{
  return MEMORY[0x1E0DE92D8](strm, *(_QWORD *)&level, *(_QWORD *)&method, *(_QWORD *)&windowBits, *(_QWORD *)&memLevel, *(_QWORD *)&strategy, version, *(_QWORD *)&stream_size);
}

int deflateReset(z_streamp strm)
{
  return MEMORY[0x1E0DE92F8](strm);
}

void dispatch_activate(dispatch_object_t object)
{
  MEMORY[0x1E0C82BC0](object);
}

void dispatch_after(dispatch_time_t when, dispatch_queue_t queue, dispatch_block_t block)
{
  MEMORY[0x1E0C82BC8](when, queue, block);
}

void dispatch_assert_queue_V2(dispatch_queue_t queue)
{
  MEMORY[0x1E0C82BE8](queue);
}

void dispatch_async(dispatch_queue_t queue, dispatch_block_t block)
{
  MEMORY[0x1E0C82C00](queue, block);
}

void dispatch_async_and_wait(dispatch_queue_t queue, dispatch_block_t block)
{
  MEMORY[0x1E0C82C08](queue, block);
}

dispatch_block_t dispatch_block_create(dispatch_block_flags_t flags, dispatch_block_t block)
{
  return (dispatch_block_t)MEMORY[0x1E0C82C60](flags, block);
}

dispatch_block_t dispatch_block_create_with_qos_class(dispatch_block_flags_t flags, dispatch_qos_class_t qos_class, int relative_priority, dispatch_block_t block)
{
  return (dispatch_block_t)MEMORY[0x1E0C82C68](flags, *(_QWORD *)&qos_class, *(_QWORD *)&relative_priority, block);
}

BOOL dispatch_data_apply(dispatch_data_t data, dispatch_data_applier_t applier)
{
  return MEMORY[0x1E0C82CA0](data, applier);
}

dispatch_data_t dispatch_data_create(const void *buffer, size_t size, dispatch_queue_t queue, dispatch_block_t destructor)
{
  return (dispatch_data_t)MEMORY[0x1E0C82CB0](buffer, size, queue, destructor);
}

uint64_t dispatch_data_create_alloc()
{
  return MEMORY[0x1E0C82CB8]();
}

dispatch_data_t dispatch_data_create_concat(dispatch_data_t data1, dispatch_data_t data2)
{
  return (dispatch_data_t)MEMORY[0x1E0C82CC0](data1, data2);
}

dispatch_data_t dispatch_data_create_map(dispatch_data_t data, const void **buffer_ptr, size_t *size_ptr)
{
  return (dispatch_data_t)MEMORY[0x1E0C82CD0](data, buffer_ptr, size_ptr);
}

dispatch_data_t dispatch_data_create_subrange(dispatch_data_t data, size_t offset, size_t length)
{
  return (dispatch_data_t)MEMORY[0x1E0C82CD8](data, offset, length);
}

uint64_t dispatch_data_create_with_transform()
{
  return MEMORY[0x1E0C82CE0]();
}

size_t dispatch_data_get_size(dispatch_data_t data)
{
  return MEMORY[0x1E0C82CE8](data);
}

dispatch_queue_global_t dispatch_get_global_queue(intptr_t identifier, uintptr_t flags)
{
  return (dispatch_queue_global_t)MEMORY[0x1E0C82D00](identifier, flags);
}

dispatch_group_t dispatch_group_create(void)
{
  return (dispatch_group_t)MEMORY[0x1E0C82D20]();
}

void dispatch_group_enter(dispatch_group_t group)
{
  MEMORY[0x1E0C82D28](group);
}

void dispatch_group_leave(dispatch_group_t group)
{
  MEMORY[0x1E0C82D30](group);
}

void dispatch_group_notify(dispatch_group_t group, dispatch_queue_t queue, dispatch_block_t block)
{
  MEMORY[0x1E0C82D38](group, queue, block);
}

void dispatch_io_close(dispatch_io_t channel, dispatch_io_close_flags_t flags)
{
  MEMORY[0x1E0C82D58](channel, flags);
}

dispatch_io_t dispatch_io_create(dispatch_io_type_t type, dispatch_fd_t fd, dispatch_queue_t queue, void *cleanup_handler)
{
  return (dispatch_io_t)MEMORY[0x1E0C82D60](type, *(_QWORD *)&fd, queue, cleanup_handler);
}

void dispatch_io_read(dispatch_io_t channel, off_t offset, size_t length, dispatch_queue_t queue, dispatch_io_handler_t io_handler)
{
  MEMORY[0x1E0C82D80](channel, offset, length, queue, io_handler);
}

void dispatch_io_set_low_water(dispatch_io_t channel, size_t low_water)
{
  MEMORY[0x1E0C82D98](channel, low_water);
}

void dispatch_io_write(dispatch_io_t channel, off_t offset, dispatch_data_t data, dispatch_queue_t queue, dispatch_io_handler_t io_handler)
{
  MEMORY[0x1E0C82DA0](channel, offset, data, queue, io_handler);
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
  MEMORY[0x1E0C82E08](predicate, block);
}

dispatch_queue_attr_t dispatch_queue_attr_make_with_autorelease_frequency(dispatch_queue_attr_t attr, dispatch_autorelease_frequency_t frequency)
{
  return (dispatch_queue_attr_t)MEMORY[0x1E0C82E28](attr, frequency);
}

dispatch_queue_t dispatch_queue_create(const char *label, dispatch_queue_attr_t attr)
{
  return (dispatch_queue_t)MEMORY[0x1E0C82E48](label, attr);
}

dispatch_queue_t dispatch_queue_create_with_target_V2(const char *label, dispatch_queue_attr_t attr, dispatch_queue_t target)
{
  return (dispatch_queue_t)MEMORY[0x1E0C82E50](label, attr, target);
}

void dispatch_release(dispatch_object_t object)
{
  MEMORY[0x1E0C82E98](object);
}

void dispatch_resume(dispatch_object_t object)
{
  MEMORY[0x1E0C82EA0](object);
}

void dispatch_retain(dispatch_object_t object)
{
  MEMORY[0x1E0C82EA8](object);
}

void dispatch_set_context(dispatch_object_t object, void *context)
{
  MEMORY[0x1E0C82EE0](object, context);
}

uint64_t dispatch_set_qos_class_fallback()
{
  return MEMORY[0x1E0C82EF8]();
}

void dispatch_set_target_queue(dispatch_object_t object, dispatch_queue_t queue)
{
  MEMORY[0x1E0C82F08](object, queue);
}

void dispatch_source_cancel(dispatch_source_t source)
{
  MEMORY[0x1E0C82F10](source);
}

dispatch_source_t dispatch_source_create(dispatch_source_type_t type, uintptr_t handle, uintptr_t mask, dispatch_queue_t queue)
{
  return (dispatch_source_t)MEMORY[0x1E0C82F20](type, handle, mask, queue);
}

uintptr_t dispatch_source_get_data(dispatch_source_t source)
{
  return MEMORY[0x1E0C82F28](source);
}

void dispatch_source_set_cancel_handler(dispatch_source_t source, dispatch_block_t handler)
{
  MEMORY[0x1E0C82F48](source, handler);
}

void dispatch_source_set_event_handler(dispatch_source_t source, dispatch_block_t handler)
{
  MEMORY[0x1E0C82F58](source, handler);
}

void dispatch_source_set_timer(dispatch_source_t source, dispatch_time_t start, uint64_t interval, uint64_t leeway)
{
  MEMORY[0x1E0C82F78](source, start, interval, leeway);
}

void dispatch_suspend(dispatch_object_t object)
{
  MEMORY[0x1E0C82F88](object);
}

void dispatch_sync(dispatch_queue_t queue, dispatch_block_t block)
{
  MEMORY[0x1E0C82F90](queue, block);
}

dispatch_time_t dispatch_time(dispatch_time_t when, int64_t delta)
{
  return MEMORY[0x1E0C82FB8](when, delta);
}

dispatch_time_t dispatch_walltime(const timespec *when, int64_t delta)
{
  return MEMORY[0x1E0C82FC8](when, delta);
}

uint64_t dispatch_workloop_copy_current()
{
  return MEMORY[0x1E0C82FD0]();
}

dispatch_workloop_t dispatch_workloop_create_inactive(const char *label)
{
  return (dispatch_workloop_t)MEMORY[0x1E0C82FE0](label);
}

uint64_t dispatch_workloop_is_current()
{
  return MEMORY[0x1E0C82FE8]();
}

uint64_t dispatch_workloop_set_cpupercent()
{
  return MEMORY[0x1E0C82FF8]();
}

uint64_t dispatch_workloop_set_scheduler_priority()
{
  return MEMORY[0x1E0C83010]();
}

void *__cdecl dlopen(const char *__path, int __mode)
{
  return (void *)MEMORY[0x1E0C83040](__path, *(_QWORD *)&__mode);
}

uint64_t dnssd_cname_array_get_cname()
{
  return MEMORY[0x1E0DE5640]();
}

uint64_t dnssd_cname_array_get_count()
{
  return MEMORY[0x1E0DE5648]();
}

uint64_t dnssd_getaddrinfo_activate()
{
  return MEMORY[0x1E0DE5650]();
}

uint64_t dnssd_getaddrinfo_add_resolver_uuid()
{
  return MEMORY[0x1E0DE5658]();
}

uint64_t dnssd_getaddrinfo_create()
{
  return MEMORY[0x1E0DE5660]();
}

uint64_t dnssd_getaddrinfo_invalidate()
{
  return MEMORY[0x1E0DE5668]();
}

uint64_t dnssd_getaddrinfo_prohibit_encrypted_dns()
{
  return MEMORY[0x1E0DE5670]();
}

uint64_t dnssd_getaddrinfo_result_enumerate_alpn_values()
{
  return MEMORY[0x1E0DE5678]();
}

uint64_t dnssd_getaddrinfo_result_enumerate_service_address_hints()
{
  return MEMORY[0x1E0DE5680]();
}

uint64_t dnssd_getaddrinfo_result_get_actual_hostname()
{
  return MEMORY[0x1E0DE5688]();
}

uint64_t dnssd_getaddrinfo_result_get_address()
{
  return MEMORY[0x1E0DE5690]();
}

uint64_t dnssd_getaddrinfo_result_get_cnames()
{
  return MEMORY[0x1E0DE5698]();
}

uint64_t dnssd_getaddrinfo_result_get_doh_uri()
{
  return MEMORY[0x1E0DE56A0]();
}

uint64_t dnssd_getaddrinfo_result_get_ech_config()
{
  return MEMORY[0x1E0DE56A8]();
}

uint64_t dnssd_getaddrinfo_result_get_extended_dns_error_code()
{
  return MEMORY[0x1E0DE56B0]();
}

uint64_t dnssd_getaddrinfo_result_get_extended_dns_error_text()
{
  return MEMORY[0x1E0DE56B8]();
}

uint64_t dnssd_getaddrinfo_result_get_hostname()
{
  return MEMORY[0x1E0DE56C0]();
}

uint64_t dnssd_getaddrinfo_result_get_interface_index()
{
  return MEMORY[0x1E0DE56C8]();
}

uint64_t dnssd_getaddrinfo_result_get_negative_reason()
{
  return MEMORY[0x1E0DE56D0]();
}

uint64_t dnssd_getaddrinfo_result_get_protocol()
{
  return MEMORY[0x1E0DE56D8]();
}

uint64_t dnssd_getaddrinfo_result_get_provider_name()
{
  return MEMORY[0x1E0DE56E0]();
}

uint64_t dnssd_getaddrinfo_result_get_service_name()
{
  return MEMORY[0x1E0DE56E8]();
}

uint64_t dnssd_getaddrinfo_result_get_service_port()
{
  return MEMORY[0x1E0DE56F0]();
}

uint64_t dnssd_getaddrinfo_result_get_service_priority()
{
  return MEMORY[0x1E0DE56F8]();
}

uint64_t dnssd_getaddrinfo_result_get_tracker_can_block_request()
{
  return MEMORY[0x1E0DE5700]();
}

uint64_t dnssd_getaddrinfo_result_get_tracker_hostname()
{
  return MEMORY[0x1E0DE5708]();
}

uint64_t dnssd_getaddrinfo_result_get_tracker_is_approved()
{
  return MEMORY[0x1E0DE5710]();
}

uint64_t dnssd_getaddrinfo_result_get_tracker_owner()
{
  return MEMORY[0x1E0DE5718]();
}

uint64_t dnssd_getaddrinfo_result_get_type()
{
  return MEMORY[0x1E0DE5720]();
}

uint64_t dnssd_getaddrinfo_result_get_validation_data()
{
  return MEMORY[0x1E0DE5728]();
}

uint64_t dnssd_getaddrinfo_result_has_extended_dns_error()
{
  return MEMORY[0x1E0DE5730]();
}

uint64_t dnssd_getaddrinfo_result_is_from_cache()
{
  return MEMORY[0x1E0DE5738]();
}

uint64_t dnssd_getaddrinfo_result_service_is_valid()
{
  return MEMORY[0x1E0DE5740]();
}

uint64_t dnssd_getaddrinfo_set_account_id()
{
  return MEMORY[0x1E0DE5748]();
}

uint64_t dnssd_getaddrinfo_set_delegate_audit_token()
{
  return MEMORY[0x1E0DE5750]();
}

uint64_t dnssd_getaddrinfo_set_delegate_pid()
{
  return MEMORY[0x1E0DE5758]();
}

uint64_t dnssd_getaddrinfo_set_delegate_uuid()
{
  return MEMORY[0x1E0DE5760]();
}

uint64_t dnssd_getaddrinfo_set_event_handler()
{
  return MEMORY[0x1E0DE5768]();
}

uint64_t dnssd_getaddrinfo_set_flags()
{
  return MEMORY[0x1E0DE5770]();
}

uint64_t dnssd_getaddrinfo_set_hostname()
{
  return MEMORY[0x1E0DE5778]();
}

uint64_t dnssd_getaddrinfo_set_interface_index()
{
  return MEMORY[0x1E0DE5780]();
}

uint64_t dnssd_getaddrinfo_set_log_privacy_level()
{
  return MEMORY[0x1E0DE5788]();
}

uint64_t dnssd_getaddrinfo_set_need_encrypted_query()
{
  return MEMORY[0x1E0DE5790]();
}

uint64_t dnssd_getaddrinfo_set_protocols()
{
  return MEMORY[0x1E0DE5798]();
}

uint64_t dnssd_getaddrinfo_set_queue()
{
  return MEMORY[0x1E0DE57A0]();
}

uint64_t dnssd_getaddrinfo_set_result_handler()
{
  return MEMORY[0x1E0DE57A8]();
}

uint64_t dnssd_getaddrinfo_set_service_scheme()
{
  return MEMORY[0x1E0DE57B0]();
}

uint64_t dnssd_getaddrinfo_set_use_failover()
{
  return MEMORY[0x1E0DE57B8]();
}

uint64_t dnssd_getaddrinfo_set_validation_data()
{
  return MEMORY[0x1E0DE57C0]();
}

int dprintf(int a1, const char *a2, ...)
{
  return MEMORY[0x1E0C83068](*(_QWORD *)&a1, a2);
}

int dup(int a1)
{
  return MEMORY[0x1E0C83078](*(_QWORD *)&a1);
}

uint64_t dyld_image_path_containing_address()
{
  return MEMORY[0x1E0C83100]();
}

uint64_t dyld_program_minos_at_least()
{
  return MEMORY[0x1E0C83150]();
}

int fchmod(int a1, mode_t a2)
{
  return MEMORY[0x1E0C832D0](*(_QWORD *)&a1, a2);
}

int fcntl(int a1, int a2, ...)
{
  return MEMORY[0x1E0C83300](*(_QWORD *)&a1, *(_QWORD *)&a2);
}

int ffsctl(int a1, unint64_t a2, void *a3, unsigned int a4)
{
  return MEMORY[0x1E0C83378](*(_QWORD *)&a1, a2, a3, *(_QWORD *)&a4);
}

int flsll(uint64_t a1)
{
  return MEMORY[0x1E0C83428](a1);
}

int fprintf(FILE *a1, const char *a2, ...)
{
  return MEMORY[0x1E0C83478](a1, a2);
}

int fputc(int a1, FILE *a2)
{
  return MEMORY[0x1E0C83488](*(_QWORD *)&a1, a2);
}

void free(void *a1)
{
  MEMORY[0x1E0C834A8](a1);
}

void freeaddrinfo(addrinfo *a1)
{
  MEMORY[0x1E0C834C0](a1);
}

int fstat(int a1, stat *a2)
{
  return MEMORY[0x1E0C83560](*(_QWORD *)&a1, a2);
}

size_t fwrite(const void *__ptr, size_t __size, size_t __nitems, FILE *__stream)
{
  return MEMORY[0x1E0C835E0](__ptr, __size, __nitems, __stream);
}

const char *__cdecl gai_strerror(int a1)
{
  return (const char *)MEMORY[0x1E0C835F0](*(_QWORD *)&a1);
}

int getaddrinfo(const char *a1, const char *a2, const addrinfo *a3, addrinfo **a4)
{
  return MEMORY[0x1E0C835F8](a1, a2, a3, a4);
}

char *__cdecl getenv(const char *a1)
{
  return (char *)MEMORY[0x1E0C83660](a1);
}

int getnameinfo(const sockaddr *a1, socklen_t a2, char *a3, socklen_t a4, char *a5, socklen_t a6, int a7)
{
  return MEMORY[0x1E0C83708](a1, *(_QWORD *)&a2, a3, *(_QWORD *)&a4, a5, *(_QWORD *)&a6, *(_QWORD *)&a7);
}

int getpeername(int a1, sockaddr *a2, socklen_t *a3)
{
  return MEMORY[0x1E0C83748](*(_QWORD *)&a1, a2, a3);
}

pid_t getpid(void)
{
  return MEMORY[0x1E0C83760]();
}

const char *getprogname(void)
{
  return (const char *)MEMORY[0x1E0C83778]();
}

int getrlimit(int a1, rlimit *a2)
{
  return MEMORY[0x1E0C837B8](*(_QWORD *)&a1, a2);
}

servent *__cdecl getservbyport(int a1, const char *a2)
{
  return (servent *)MEMORY[0x1E0C83800](*(_QWORD *)&a1, a2);
}

int getsockname(int a1, sockaddr *a2, socklen_t *a3)
{
  return MEMORY[0x1E0C83810](*(_QWORD *)&a1, a2, a3);
}

int getsockopt(int a1, int a2, int a3, void *a4, socklen_t *a5)
{
  return MEMORY[0x1E0C83818](*(_QWORD *)&a1, *(_QWORD *)&a2, *(_QWORD *)&a3, a4, a5);
}

int gettimeofday(timeval *a1, void *a2)
{
  return MEMORY[0x1E0C83820](a1, a2);
}

uid_t getuid(void)
{
  return MEMORY[0x1E0C83828]();
}

uint64_t guarded_close_np()
{
  return MEMORY[0x1E0C83868]();
}

char *__cdecl if_indextoname(unsigned int a1, char *a2)
{
  return (char *)MEMORY[0x1E0C83900](*(_QWORD *)&a1, a2);
}

unsigned int if_nametoindex(const char *a1)
{
  return MEMORY[0x1E0C83910](a1);
}

IMP imp_implementationWithBlock(id block)
{
  return (IMP)MEMORY[0x1E0DE7B10](block);
}

const char *__cdecl inet_ntop(int a1, const void *a2, char *a3, socklen_t a4)
{
  return (const char *)MEMORY[0x1E0C83968](*(_QWORD *)&a1, a2, a3, *(_QWORD *)&a4);
}

int inet_pton(int a1, const char *a2, void *a3)
{
  return MEMORY[0x1E0C83970](*(_QWORD *)&a1, a2, a3);
}

int inflate(z_streamp strm, int flush)
{
  return MEMORY[0x1E0DE93A0](strm, *(_QWORD *)&flush);
}

int inflateEnd(z_streamp strm)
{
  return MEMORY[0x1E0DE93B8](strm);
}

int inflateInit2_(z_streamp strm, int windowBits, const char *version, int stream_size)
{
  return MEMORY[0x1E0DE93C8](strm, *(_QWORD *)&windowBits, version, *(_QWORD *)&stream_size);
}

int inflateReset(z_streamp strm)
{
  return MEMORY[0x1E0DE93D8](strm);
}

int ioctl(int a1, unint64_t a2, ...)
{
  return MEMORY[0x1E0C83980](*(_QWORD *)&a1, a2);
}

uint64_t is_config_agent_type_dns()
{
  return MEMORY[0x1E0C83988]();
}

uint64_t is_config_agent_type_proxy()
{
  return MEMORY[0x1E0C83990]();
}

ptrdiff_t ivar_getOffset(Ivar v)
{
  return MEMORY[0x1E0DE7B30](v);
}

uint64_t kdebug_is_enabled()
{
  return MEMORY[0x1E0C83A10]();
}

uint64_t kdebug_trace()
{
  return MEMORY[0x1E0C83A20]();
}

int launch_activate_socket(const char *name, int **fds, size_t *cnt)
{
  return MEMORY[0x1E0C83A70](name, fds, cnt);
}

int listen(int a1, int a2)
{
  return MEMORY[0x1E0C83B80](*(_QWORD *)&a1, *(_QWORD *)&a2);
}

tm *__cdecl localtime_r(const time_t *a1, tm *a2)
{
  return (tm *)MEMORY[0x1E0C83BB0](a1, a2);
}

long double log10(long double __x)
{
  long double result;

  MEMORY[0x1E0C83BC0](__x);
  return result;
}

off_t lseek(int a1, off_t a2, int a3)
{
  return MEMORY[0x1E0C83C38](*(_QWORD *)&a1, a2, *(_QWORD *)&a3);
}

uint64_t mach_absolute_time(void)
{
  return MEMORY[0x1E0C83C50]();
}

uint64_t mach_boottime_usec()
{
  return MEMORY[0x1E0C83C60]();
}

uint64_t mach_continuous_approximate_time(void)
{
  return MEMORY[0x1E0C83C68]();
}

uint64_t mach_continuous_time(void)
{
  return MEMORY[0x1E0C83C70]();
}

uint64_t mach_get_times()
{
  return MEMORY[0x1E0C83C88]();
}

kern_return_t mach_port_deallocate(ipc_space_t task, mach_port_name_t name)
{
  return MEMORY[0x1E0C83CF8](*(_QWORD *)&task, *(_QWORD *)&name);
}

kern_return_t mach_timebase_info(mach_timebase_info_t info)
{
  return MEMORY[0x1E0C83DB8](info);
}

kern_return_t mach_vm_allocate(vm_map_t target, mach_vm_address_t *address, mach_vm_size_t size, int flags)
{
  return MEMORY[0x1E0C83DC0](*(_QWORD *)&target, address, size, *(_QWORD *)&flags);
}

kern_return_t mach_vm_deallocate(vm_map_t target, mach_vm_address_t address, mach_vm_size_t size)
{
  return MEMORY[0x1E0C83DD0](*(_QWORD *)&target, address, size);
}

kern_return_t mach_vm_purgable_control(vm_map_t target_task, mach_vm_address_t address, vm_purgable_t control, int *state)
{
  return MEMORY[0x1E0C83DF0](*(_QWORD *)&target_task, address, *(_QWORD *)&control, state);
}

void *__cdecl malloc(size_t __size)
{
  return (void *)MEMORY[0x1E0C83E68](__size);
}

malloc_zone_t *__cdecl malloc_create_zone(vm_size_t start_size, unsigned int flags)
{
  return (malloc_zone_t *)MEMORY[0x1E0C83E78](start_size, *(_QWORD *)&flags);
}

void malloc_set_zone_name(malloc_zone_t *zone, const char *name)
{
  MEMORY[0x1E0C83ED8](zone, name);
}

size_t malloc_size(const void *ptr)
{
  return MEMORY[0x1E0C83EE0](ptr);
}

void *__cdecl malloc_type_calloc(size_t count, size_t size, malloc_type_id_t type_id)
{
  return (void *)MEMORY[0x1E0C83EF8](count, size, type_id);
}

void *__cdecl malloc_type_malloc(size_t size, malloc_type_id_t type_id)
{
  return (void *)MEMORY[0x1E0C83F00](size, type_id);
}

int malloc_type_posix_memalign(void **memptr, size_t alignment, size_t size, malloc_type_id_t type_id)
{
  return MEMORY[0x1E0C83F08](memptr, alignment, size, type_id);
}

void *__cdecl malloc_type_realloc(void *ptr, size_t size, malloc_type_id_t type_id)
{
  return (void *)MEMORY[0x1E0C83F10](ptr, size, type_id);
}

void *__cdecl malloc_type_zone_calloc(malloc_zone_t *zone, size_t count, size_t size, malloc_type_id_t type_id)
{
  return (void *)MEMORY[0x1E0C83F20](zone, count, size, type_id);
}

void *__cdecl malloc_type_zone_memalign(malloc_zone_t *zone, size_t alignment, size_t size, malloc_type_id_t type_id)
{
  return (void *)MEMORY[0x1E0C83F38](zone, alignment, size, type_id);
}

void malloc_zone_free(malloc_zone_t *zone, void *ptr)
{
  MEMORY[0x1E0C83F70](zone, ptr);
}

void *__cdecl memchr(void *__s, int __c, size_t __n)
{
  return (void *)MEMORY[0x1E0C84070](__s, *(_QWORD *)&__c, __n);
}

int memcmp(const void *__s1, const void *__s2, size_t __n)
{
  return MEMORY[0x1E0C84078](__s1, __s2, __n);
}

void *__cdecl memcpy(void *__dst, const void *__src, size_t __n)
{
  return (void *)MEMORY[0x1E0C84088](__dst, __src, __n);
}

void *__cdecl memmove(void *__dst, const void *__src, size_t __len)
{
  return (void *)MEMORY[0x1E0C84098](__dst, __src, __len);
}

void *__cdecl memset(void *__b, int __c, size_t __len)
{
  return (void *)MEMORY[0x1E0C840B0](__b, *(_QWORD *)&__c, __len);
}

IMP method_getImplementation(Method m)
{
  return (IMP)MEMORY[0x1E0DE7B68](m);
}

SEL method_getName(Method m)
{
  return (SEL)MEMORY[0x1E0DE7B70](m);
}

const char *__cdecl method_getTypeEncoding(Method m)
{
  return (const char *)MEMORY[0x1E0DE7B88](m);
}

int mkdir(const char *a1, mode_t a2)
{
  return MEMORY[0x1E0C84160](a1, a2);
}

int mkstemps(char *a1, int a2)
{
  return MEMORY[0x1E0C841B0](a1, *(_QWORD *)&a2);
}

uint64_t ne_session_agent_get_advisory()
{
  return MEMORY[0x1E0C84250]();
}

uint64_t ne_session_always_on_vpn_configs_present()
{
  return MEMORY[0x1E0C84258]();
}

uint64_t ne_session_app_vpn_configs_present()
{
  return MEMORY[0x1E0C84260]();
}

uint64_t ne_session_copy_app_data_from_flow_divert_socket()
{
  return MEMORY[0x1E0C84270]();
}

uint64_t ne_session_get_config_id_from_network_agent()
{
  return MEMORY[0x1E0C84290]();
}

uint64_t ne_session_policy_copy_flow_divert_token()
{
  return MEMORY[0x1E0C842A8]();
}

uint64_t ne_session_service_get_dns_service_id_for_interface()
{
  return MEMORY[0x1E0C842E0]();
}

uint64_t ne_session_service_matches_address_for_interface()
{
  return MEMORY[0x1E0C842E8]();
}

uint64_t ne_tracker_check_is_hostname_blocked()
{
  return MEMORY[0x1E0C84318]();
}

uint64_t ne_tracker_copy_current_stacktrace()
{
  return MEMORY[0x1E0C84320]();
}

uint64_t ne_tracker_create_xcode_issue()
{
  return MEMORY[0x1E0C84328]();
}

uint64_t ne_tracker_get_disposition()
{
  return MEMORY[0x1E0C84330]();
}

uint64_t ne_tracker_should_save_stacktrace()
{
  return MEMORY[0x1E0C84338]();
}

uint64_t necp_client_action()
{
  return MEMORY[0x1E0C84358]();
}

uint64_t necp_open()
{
  return MEMORY[0x1E0C84360]();
}

uint64_t nghttp2_http2_strerror()
{
  return MEMORY[0x1E0DE3BF0]();
}

uint64_t nghttp2_option_del()
{
  return MEMORY[0x1E0DE3BF8]();
}

uint64_t nghttp2_option_new()
{
  return MEMORY[0x1E0DE3C00]();
}

uint64_t nghttp2_option_set_no_auto_window_update()
{
  return MEMORY[0x1E0DE3C08]();
}

uint64_t nghttp2_option_set_no_closed_streams()
{
  return MEMORY[0x1E0DE3C10]();
}

uint64_t nghttp2_option_set_no_http_messaging()
{
  return MEMORY[0x1E0DE3C18]();
}

uint64_t nghttp2_option_set_no_http_semantics()
{
  return MEMORY[0x1E0DE3C20]();
}

uint64_t nghttp2_option_set_no_rfc9113_leading_and_trailing_ws_validation()
{
  return MEMORY[0x1E0DE3C28]();
}

uint64_t nghttp2_option_set_peer_max_concurrent_streams()
{
  return MEMORY[0x1E0DE3C30]();
}

uint64_t nghttp2_priority_spec_init()
{
  return MEMORY[0x1E0DE3C38]();
}

uint64_t nghttp2_session_callbacks_del()
{
  return MEMORY[0x1E0DE3C40]();
}

uint64_t nghttp2_session_callbacks_new()
{
  return MEMORY[0x1E0DE3C48]();
}

uint64_t nghttp2_session_callbacks_set_before_frame_send_callback()
{
  return MEMORY[0x1E0DE3C50]();
}

uint64_t nghttp2_session_callbacks_set_error_callback2()
{
  return MEMORY[0x1E0DE3C58]();
}

uint64_t nghttp2_session_callbacks_set_on_begin_headers_callback()
{
  return MEMORY[0x1E0DE3C60]();
}

uint64_t nghttp2_session_callbacks_set_on_data_chunk_recv_callback()
{
  return MEMORY[0x1E0DE3C68]();
}

uint64_t nghttp2_session_callbacks_set_on_frame_not_send_callback()
{
  return MEMORY[0x1E0DE3C70]();
}

uint64_t nghttp2_session_callbacks_set_on_frame_recv_callback()
{
  return MEMORY[0x1E0DE3C78]();
}

uint64_t nghttp2_session_callbacks_set_on_frame_send_callback()
{
  return MEMORY[0x1E0DE3C80]();
}

uint64_t nghttp2_session_callbacks_set_on_header_callback()
{
  return MEMORY[0x1E0DE3C88]();
}

uint64_t nghttp2_session_callbacks_set_on_invalid_frame_recv_callback()
{
  return MEMORY[0x1E0DE3C90]();
}

uint64_t nghttp2_session_callbacks_set_on_stream_close_callback()
{
  return MEMORY[0x1E0DE3CA0]();
}

uint64_t nghttp2_session_callbacks_set_send_callback()
{
  return MEMORY[0x1E0DE3CA8]();
}

uint64_t nghttp2_session_callbacks_set_send_data_callback()
{
  return MEMORY[0x1E0DE3CB0]();
}

uint64_t nghttp2_session_client_new2()
{
  return MEMORY[0x1E0DE3CB8]();
}

uint64_t nghttp2_session_consume_connection()
{
  return MEMORY[0x1E0DE3CC0]();
}

uint64_t nghttp2_session_consume_stream()
{
  return MEMORY[0x1E0DE3CC8]();
}

uint64_t nghttp2_session_del()
{
  return MEMORY[0x1E0DE3CD0]();
}

uint64_t nghttp2_session_get_remote_window_size()
{
  return MEMORY[0x1E0DE3CE8]();
}

uint64_t nghttp2_session_get_stream_remote_window_size()
{
  return MEMORY[0x1E0DE3CF0]();
}

uint64_t nghttp2_session_mem_recv()
{
  return MEMORY[0x1E0DE3D00]();
}

uint64_t nghttp2_session_send()
{
  return MEMORY[0x1E0DE3D18]();
}

uint64_t nghttp2_session_server_new2()
{
  return MEMORY[0x1E0DE3D20]();
}

uint64_t nghttp2_session_set_local_window_size()
{
  return MEMORY[0x1E0DE3D28]();
}

uint64_t nghttp2_session_want_write()
{
  return MEMORY[0x1E0DE3D50]();
}

uint64_t nghttp2_set_debug_vprintf_callback()
{
  return MEMORY[0x1E0DE3D58]();
}

uint64_t nghttp2_strerror()
{
  return MEMORY[0x1E0DE3D60]();
}

uint64_t nghttp2_submit_data()
{
  return MEMORY[0x1E0DE3D68]();
}

uint64_t nghttp2_submit_goaway()
{
  return MEMORY[0x1E0DE3D70]();
}

uint64_t nghttp2_submit_headers()
{
  return MEMORY[0x1E0DE3D78]();
}

uint64_t nghttp2_submit_ping()
{
  return MEMORY[0x1E0DE3D80]();
}

uint64_t nghttp2_submit_rst_stream()
{
  return MEMORY[0x1E0DE3D98]();
}

uint64_t nghttp2_submit_settings()
{
  return MEMORY[0x1E0DE3DA0]();
}

uint64_t nghttp2_submit_window_update()
{
  return MEMORY[0x1E0DE3DA8]();
}

uint32_t notify_cancel(int token)
{
  return MEMORY[0x1E0C843D8](*(_QWORD *)&token);
}

uint32_t notify_get_state(int token, uint64_t *state64)
{
  return MEMORY[0x1E0C843E8](*(_QWORD *)&token, state64);
}

uint32_t notify_post(const char *name)
{
  return MEMORY[0x1E0C843F8](name);
}

uint32_t notify_register_check(const char *name, int *out_token)
{
  return MEMORY[0x1E0C84400](name, out_token);
}

uint32_t notify_register_dispatch(const char *name, int *out_token, dispatch_queue_t queue, notify_handler_t handler)
{
  return MEMORY[0x1E0C84408](name, out_token, queue, handler);
}

uint32_t notify_set_state(int token, uint64_t state64)
{
  return MEMORY[0x1E0C84428](*(_QWORD *)&token, state64);
}

uint64_t nw_protocol_boringssl_copy_definition()
{
  return MEMORY[0x1E0DE40B0]();
}

uint64_t nw_protocol_boringssl_identifier()
{
  return MEMORY[0x1E0DE40B8]();
}

uint64_t nw_protocol_tcp_identifier()
{
  return MEMORY[0x1E0DE8BA0]();
}

uint64_t nw_tcp_destroy_globals()
{
  return MEMORY[0x1E0DE8BA8]();
}

uint64_t nw_tcp_init_globals()
{
  return MEMORY[0x1E0DE8BB0]();
}

id objc_alloc(Class a1)
{
  return (id)MEMORY[0x1E0DE7BA8](a1);
}

id objc_allocWithZone(Class a1)
{
  return (id)MEMORY[0x1E0DE7BB0](a1);
}

uint64_t objc_alloc_init()
{
  return MEMORY[0x1E0DE7BB8]();
}

id objc_autorelease(id a1)
{
  return (id)MEMORY[0x1E0DE7BD0](a1);
}

id objc_autoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x1E0DE7BE8](a1);
}

id objc_begin_catch(void *exc_buf)
{
  return (id)MEMORY[0x1E0DE7BF0](exc_buf);
}

uint64_t objc_claimAutoreleasedReturnValue()
{
  return MEMORY[0x1E0DE7BF8]();
}

id objc_constructInstance(Class cls, void *bytes)
{
  return (id)MEMORY[0x1E0DE7C00](cls, bytes);
}

void objc_copyWeak(id *to, id *from)
{
  MEMORY[0x1E0DE7C38](to, from);
}

void objc_destroyWeak(id *location)
{
  MEMORY[0x1E0DE7C60](location);
}

void *__cdecl objc_destructInstance(id obj)
{
  return (void *)MEMORY[0x1E0DE7C68](obj);
}

void objc_end_catch(void)
{
  MEMORY[0x1E0DE7C80]();
}

void objc_enumerationMutation(id obj)
{
  MEMORY[0x1E0DE7C90](obj);
}

void objc_exception_rethrow(void)
{
  MEMORY[0x1E0DE7C98]();
}

void objc_exception_throw(id exception)
{
  MEMORY[0x1E0DE7CA0](exception);
}

Class objc_getClass(const char *name)
{
  return (Class)MEMORY[0x1E0DE7CB0](name);
}

id objc_getProperty(id self, SEL _cmd, ptrdiff_t offset, BOOL atomic)
{
  return (id)MEMORY[0x1E0DE7CD0](self, _cmd, offset, atomic);
}

id objc_initWeak(id *location, id val)
{
  return (id)MEMORY[0x1E0DE7CE0](location, val);
}

id objc_loadWeakRetained(id *location)
{
  return (id)MEMORY[0x1E0DE7D08](location);
}

void objc_moveWeak(id *to, id *from)
{
  MEMORY[0x1E0DE7D18](to, from);
}

id objc_msgSend(id a1, SEL a2, ...)
{
  return (id)MEMORY[0x1E0DE7D20](a1, a2);
}

id objc_msgSendSuper2(objc_super *a1, SEL a2, ...)
{
  return (id)MEMORY[0x1E0DE7D30](a1, a2);
}

uint64_t objc_opt_class()
{
  return MEMORY[0x1E0DE7D38]();
}

uint64_t objc_opt_isKindOfClass()
{
  return MEMORY[0x1E0DE7D40]();
}

uint64_t objc_opt_new()
{
  return MEMORY[0x1E0DE7D48]();
}

uint64_t objc_opt_respondsToSelector()
{
  return MEMORY[0x1E0DE7D50]();
}

uint64_t objc_opt_self()
{
  return MEMORY[0x1E0DE7D58]();
}

void objc_release(id a1)
{
  MEMORY[0x1E0DE7D78](a1);
}

id objc_retain(id a1)
{
  return (id)MEMORY[0x1E0DE7E50](a1);
}

id objc_retainAutorelease(id a1)
{
  return (id)MEMORY[0x1E0DE7E58](a1);
}

id objc_retainAutoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x1E0DE7E60](a1);
}

id objc_retainAutoreleasedReturnValue(id a1)
{
  return (id)MEMORY[0x1E0DE7E68](a1);
}

id objc_retainBlock(id a1)
{
  return (id)MEMORY[0x1E0DE7E70](a1);
}

void objc_setProperty_atomic(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
  MEMORY[0x1E0DE7F88](self, _cmd, newValue, offset);
}

void objc_setProperty_atomic_copy(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
  MEMORY[0x1E0DE7F90](self, _cmd, newValue, offset);
}

void objc_setProperty_nonatomic_copy(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
  MEMORY[0x1E0DE7FA0](self, _cmd, newValue, offset);
}

void objc_storeStrong(id *location, id obj)
{
  MEMORY[0x1E0DE7FB0](location, obj);
}

id objc_storeWeak(id *location, id obj)
{
  return (id)MEMORY[0x1E0DE7FB8](location, obj);
}

int objc_sync_enter(id obj)
{
  return MEMORY[0x1E0DE7FC8](obj);
}

int objc_sync_exit(id obj)
{
  return MEMORY[0x1E0DE7FD0](obj);
}

void objc_terminate(void)
{
  MEMORY[0x1E0DE7FD8]();
}

id objc_unsafeClaimAutoreleasedReturnValue(id a1)
{
  return (id)MEMORY[0x1E0DE7FE0](a1);
}

Class object_getClass(id a1)
{
  return (Class)MEMORY[0x1E0DE7FF8](a1);
}

int open(const char *a1, int a2, ...)
{
  return MEMORY[0x1E0C84480](a1, *(_QWORD *)&a2);
}

uint64_t os_buflet_get_data_length()
{
  return MEMORY[0x1E0C84520]();
}

uint64_t os_buflet_get_data_limit()
{
  return MEMORY[0x1E0C84528]();
}

uint64_t os_buflet_get_data_offset()
{
  return MEMORY[0x1E0C84530]();
}

uint64_t os_buflet_get_object_address()
{
  return MEMORY[0x1E0C84538]();
}

uint64_t os_buflet_set_data_length()
{
  return MEMORY[0x1E0C84540]();
}

uint64_t os_channel_advance_slot()
{
  return MEMORY[0x1E0C84548]();
}

uint64_t os_channel_attr_create()
{
  return MEMORY[0x1E0C84550]();
}

uint64_t os_channel_attr_destroy()
{
  return MEMORY[0x1E0C84558]();
}

uint64_t os_channel_attr_get()
{
  return MEMORY[0x1E0C84560]();
}

uint64_t os_channel_attr_set()
{
  return MEMORY[0x1E0C84568]();
}

uint64_t os_channel_attr_set_key()
{
  return MEMORY[0x1E0C84570]();
}

uint64_t os_channel_available_slot_count()
{
  return MEMORY[0x1E0C84578]();
}

uint64_t os_channel_configure_interface_advisory()
{
  return MEMORY[0x1E0C84580]();
}

uint64_t os_channel_create_extended()
{
  return MEMORY[0x1E0C84588]();
}

uint64_t os_channel_destroy()
{
  return MEMORY[0x1E0C84590]();
}

uint64_t os_channel_event_free()
{
  return MEMORY[0x1E0C84598]();
}

uint64_t os_channel_event_get_event_data()
{
  return MEMORY[0x1E0C845A0]();
}

uint64_t os_channel_event_get_next_event()
{
  return MEMORY[0x1E0C845A8]();
}

uint64_t os_channel_flow_admissible()
{
  return MEMORY[0x1E0C845B0]();
}

uint64_t os_channel_flow_adv_get_ce_count()
{
  return MEMORY[0x1E0C845B8]();
}

uint64_t os_channel_get_advisory_region()
{
  return MEMORY[0x1E0C845C0]();
}

uint64_t os_channel_get_fd()
{
  return MEMORY[0x1E0C845C8]();
}

uint64_t os_channel_get_interface_advisory()
{
  return MEMORY[0x1E0C845D0]();
}

uint64_t os_channel_get_next_event_handle()
{
  return MEMORY[0x1E0C845D8]();
}

uint64_t os_channel_get_next_slot()
{
  return MEMORY[0x1E0C845E0]();
}

uint64_t os_channel_get_stats_region()
{
  return MEMORY[0x1E0C845E8]();
}

uint64_t os_channel_is_defunct()
{
  return MEMORY[0x1E0C845F0]();
}

uint64_t os_channel_large_packet_alloc()
{
  return MEMORY[0x1E0C845F8]();
}

uint64_t os_channel_packet_alloc()
{
  return MEMORY[0x1E0C84600]();
}

uint64_t os_channel_packet_free()
{
  return MEMORY[0x1E0C84608]();
}

uint64_t os_channel_packet_pool_purge()
{
  return MEMORY[0x1E0C84610]();
}

uint64_t os_channel_read_attr()
{
  return MEMORY[0x1E0C84618]();
}

uint64_t os_channel_ring_id()
{
  return MEMORY[0x1E0C84620]();
}

uint64_t os_channel_rx_ring()
{
  return MEMORY[0x1E0C84638]();
}

uint64_t os_channel_slot_attach_packet()
{
  return MEMORY[0x1E0C84648]();
}

uint64_t os_channel_slot_detach_packet()
{
  return MEMORY[0x1E0C84650]();
}

uint64_t os_channel_slot_get_packet()
{
  return MEMORY[0x1E0C84658]();
}

uint64_t os_channel_sync()
{
  return MEMORY[0x1E0C84660]();
}

uint64_t os_channel_tx_ring()
{
  return MEMORY[0x1E0C84668]();
}

uint64_t os_inet_checksum()
{
  return MEMORY[0x1E0C846F8]();
}

os_log_t os_log_create(const char *subsystem, const char *category)
{
  return (os_log_t)MEMORY[0x1E0C84728](subsystem, category);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x1E0C84780](oslog, type);
}

uint64_t os_nexus_attr_create()
{
  return MEMORY[0x1E0C84798]();
}

uint64_t os_nexus_attr_destroy()
{
  return MEMORY[0x1E0C847A0]();
}

uint64_t os_nexus_attr_get()
{
  return MEMORY[0x1E0C847A8]();
}

uint64_t os_nexus_attr_set()
{
  return MEMORY[0x1E0C847B0]();
}

uint64_t os_nexus_controller_alloc_provider_instance()
{
  return MEMORY[0x1E0C847B8]();
}

uint64_t os_nexus_controller_bind_provider_instance()
{
  return MEMORY[0x1E0C847C0]();
}

uint64_t os_nexus_controller_create()
{
  return MEMORY[0x1E0C847C8]();
}

uint64_t os_nexus_controller_destroy()
{
  return MEMORY[0x1E0C847D8]();
}

uint64_t os_nexus_controller_free_provider_instance()
{
  return MEMORY[0x1E0C847E0]();
}

uint64_t os_nexus_controller_read_provider_attr()
{
  return MEMORY[0x1E0C847E8]();
}

uint64_t os_nexus_controller_register_provider()
{
  return MEMORY[0x1E0C847F0]();
}

uint64_t os_packet_add_inet_csum_flags()
{
  return MEMORY[0x1E0C84800]();
}

uint64_t os_packet_decrement_use_count()
{
  return MEMORY[0x1E0C84810]();
}

uint64_t os_packet_finalize()
{
  return MEMORY[0x1E0C84818]();
}

uint64_t os_packet_get_aggregation_type()
{
  return MEMORY[0x1E0C84820]();
}

uint64_t os_packet_get_buflet_count()
{
  return MEMORY[0x1E0C84828]();
}

uint64_t os_packet_get_data_length()
{
  return MEMORY[0x1E0C84830]();
}

uint64_t os_packet_get_flow_uuid()
{
  return MEMORY[0x1E0C84838]();
}

uint64_t os_packet_get_inet_checksum()
{
  return MEMORY[0x1E0C84840]();
}

uint64_t os_packet_get_next_buflet()
{
  return MEMORY[0x1E0C84848]();
}

uint64_t os_packet_get_segment_count()
{
  return MEMORY[0x1E0C84850]();
}

uint64_t os_packet_get_trace_id()
{
  return MEMORY[0x1E0C84858]();
}

uint64_t os_packet_get_wake_flag()
{
  return MEMORY[0x1E0C84860]();
}

uint64_t os_packet_increment_use_count()
{
  return MEMORY[0x1E0C84868]();
}

uint64_t os_packet_set_app_metadata()
{
  return MEMORY[0x1E0C84870]();
}

uint64_t os_packet_set_compression_generation_count()
{
  return MEMORY[0x1E0C84878]();
}

uint64_t os_packet_set_expire_time()
{
  return MEMORY[0x1E0C84880]();
}

uint64_t os_packet_set_flow_uuid()
{
  return MEMORY[0x1E0C84888]();
}

uint64_t os_packet_set_inet_checksum()
{
  return MEMORY[0x1E0C84890]();
}

uint64_t os_packet_set_keep_alive()
{
  return MEMORY[0x1E0C84898]();
}

uint64_t os_packet_set_l4s_flag()
{
  return MEMORY[0x1E0C848A0]();
}

uint64_t os_packet_set_packetid()
{
  return MEMORY[0x1E0C848A8]();
}

uint64_t os_packet_set_protocol_segment_size()
{
  return MEMORY[0x1E0C848B0]();
}

uint64_t os_packet_set_service_class()
{
  return MEMORY[0x1E0C848B8]();
}

uint64_t os_packet_set_transport_last_packet()
{
  return MEMORY[0x1E0C848C0]();
}

uint64_t os_packet_set_transport_retransmit()
{
  return MEMORY[0x1E0C848C8]();
}

uint64_t os_packet_set_transport_traffic_background()
{
  return MEMORY[0x1E0C848D0]();
}

uint64_t os_packet_set_transport_traffic_realtime()
{
  return MEMORY[0x1E0C848D8]();
}

uint64_t os_packet_set_tso_flags()
{
  return MEMORY[0x1E0C848E0]();
}

uint64_t os_packet_set_tx_timestamp()
{
  return MEMORY[0x1E0C848E8]();
}

uint64_t os_packet_trace_event()
{
  return MEMORY[0x1E0C848F0]();
}

void os_release(void *object)
{
  MEMORY[0x1E0C84910](object);
}

void *__cdecl os_retain(void *object)
{
  return (void *)MEMORY[0x1E0C84918](object);
}

BOOL os_signpost_enabled(os_log_t log)
{
  return MEMORY[0x1E0C84920](log);
}

os_signpost_id_t os_signpost_id_generate(os_log_t log)
{
  return MEMORY[0x1E0C84928](log);
}

uint64_t os_transaction_create()
{
  return MEMORY[0x1E0C84970]();
}

void os_unfair_lock_assert_owner(const os_unfair_lock *lock)
{
  MEMORY[0x1E0C84990](lock);
}

void os_unfair_lock_lock(os_unfair_lock_t lock)
{
  MEMORY[0x1E0C84998](lock);
}

void os_unfair_lock_unlock(os_unfair_lock_t lock)
{
  MEMORY[0x1E0C849B0](lock);
}

uint64_t os_variant_allows_internal_security_policies()
{
  return MEMORY[0x1E0C849D8]();
}

uint64_t os_variant_has_internal_content()
{
  return MEMORY[0x1E0C849F0]();
}

uint64_t os_variant_has_internal_diagnostics()
{
  return MEMORY[0x1E0C849F8]();
}

ssize_t pread(int __fd, void *__buf, size_t __nbyte, off_t a4)
{
  return MEMORY[0x1E0C84BC8](*(_QWORD *)&__fd, __buf, __nbyte, a4);
}

int proc_pidinfo(int pid, int flavor, uint64_t arg, void *buffer, int buffersize)
{
  return MEMORY[0x1E0C84C40](*(_QWORD *)&pid, *(_QWORD *)&flavor, arg, buffer, *(_QWORD *)&buffersize);
}

int pthread_atfork(void (*a1)(void), void (*a2)(void), void (*a3)(void))
{
  return MEMORY[0x1E0C84CA8](a1, a2, a3);
}

int pthread_mutex_init(pthread_mutex_t *a1, const pthread_mutexattr_t *a2)
{
  return MEMORY[0x1E0C84E20](a1, a2);
}

int pthread_mutex_lock(pthread_mutex_t *a1)
{
  return MEMORY[0x1E0C84E28](a1);
}

int pthread_mutex_unlock(pthread_mutex_t *a1)
{
  return MEMORY[0x1E0C84E38](a1);
}

int pthread_mutexattr_init(pthread_mutexattr_t *a1)
{
  return MEMORY[0x1E0C84E48](a1);
}

int pthread_mutexattr_settype(pthread_mutexattr_t *a1, int a2)
{
  return MEMORY[0x1E0C84E60](a1, *(_QWORD *)&a2);
}

int pthread_once(pthread_once_t *a1, void (*a2)(void))
{
  return MEMORY[0x1E0C84E68](a1, a2);
}

int pthread_rwlock_unlock(pthread_rwlock_t *a1)
{
  return MEMORY[0x1E0C84EB8](a1);
}

int pthread_rwlock_wrlock(pthread_rwlock_t *a1)
{
  return MEMORY[0x1E0C84EC0](a1);
}

int pthread_threadid_np(pthread_t a1, __uint64_t *a2)
{
  return MEMORY[0x1E0C84F38](a1, a2);
}

qos_class_t qos_class_self(void)
{
  return MEMORY[0x1E0C84F80]();
}

uint64_t qpod_conn_create()
{
  return MEMORY[0x1E0DE8450]();
}

uint64_t qpod_conn_decode_datagram()
{
  return MEMORY[0x1E0DE8458]();
}

uint64_t qpod_conn_encode_datagram()
{
  return MEMORY[0x1E0DE8460]();
}

uint64_t qpod_conn_free()
{
  return MEMORY[0x1E0DE8468]();
}

uint64_t quic_fillout_definition_callbacks()
{
  return MEMORY[0x1E0DE8470]();
}

ssize_t read(int a1, void *a2, size_t a3)
{
  return MEMORY[0x1E0C85000](*(_QWORD *)&a1, a2, a3);
}

void *__cdecl reallocf(void *__ptr, size_t __size)
{
  return (void *)MEMORY[0x1E0C85030](__ptr, __size);
}

ssize_t recv(int a1, void *a2, size_t a3, int a4)
{
  return MEMORY[0x1E0C85060](*(_QWORD *)&a1, a2, a3, *(_QWORD *)&a4);
}

ssize_t recvmsg(int a1, msghdr *a2, int a3)
{
  return MEMORY[0x1E0C85070](*(_QWORD *)&a1, a2, *(_QWORD *)&a3);
}

uint64_t sandbox_check()
{
  return MEMORY[0x1E0C85178]();
}

SecCertificateRef sec_certificate_copy_ref(sec_certificate_t certificate)
{
  return (SecCertificateRef)MEMORY[0x1E0CD7120](certificate);
}

uint64_t sec_experiment_run_async_with_sampling_disabled()
{
  return MEMORY[0x1E0CD7130]();
}

SecIdentityRef sec_identity_copy_ref(sec_identity_t identity)
{
  return (SecIdentityRef)MEMORY[0x1E0CD7140](identity);
}

sec_identity_t sec_identity_create(SecIdentityRef identity)
{
  return (sec_identity_t)MEMORY[0x1E0CD7148](identity);
}

sec_identity_t sec_identity_create_with_certificates(SecIdentityRef identity, CFArrayRef certificates)
{
  return (sec_identity_t)MEMORY[0x1E0CD7150](identity, certificates);
}

uint64_t sec_protocol_configuration_copy_singleton()
{
  return MEMORY[0x1E0CD7158]();
}

uint64_t sec_protocol_configuration_copy_transformed_options_for_host()
{
  return MEMORY[0x1E0CD7160]();
}

uint64_t sec_protocol_configuration_tls_required()
{
  return MEMORY[0x1E0CD7168]();
}

uint64_t sec_protocol_configuration_tls_required_for_host()
{
  return MEMORY[0x1E0CD7170]();
}

BOOL sec_protocol_metadata_access_distinguished_names(sec_protocol_metadata_t metadata, void *handler)
{
  return MEMORY[0x1E0CD7180](metadata, handler);
}

BOOL sec_protocol_metadata_access_peer_certificate_chain(sec_protocol_metadata_t metadata, void *handler)
{
  return MEMORY[0x1E0CD7188](metadata, handler);
}

uint64_t sec_protocol_metadata_copy_authenticator()
{
  return MEMORY[0x1E0CD71A0]();
}

uint64_t sec_protocol_metadata_copy_authenticator_trust()
{
  return MEMORY[0x1E0CD71A8]();
}

uint64_t sec_protocol_metadata_copy_connection_id()
{
  return MEMORY[0x1E0CD71B0]();
}

uint64_t sec_protocol_metadata_copy_sec_trust()
{
  return MEMORY[0x1E0CD71C0]();
}

dispatch_data_t sec_protocol_metadata_create_secret(sec_protocol_metadata_t metadata, size_t label_len, const char *label, size_t exporter_length)
{
  return (dispatch_data_t)MEMORY[0x1E0CD71C8](metadata, label_len, label, exporter_length);
}

const char *__cdecl sec_protocol_metadata_get_negotiated_protocol(sec_protocol_metadata_t metadata)
{
  return (const char *)MEMORY[0x1E0CD71D8](metadata);
}

SSLProtocol sec_protocol_metadata_get_negotiated_protocol_version(sec_protocol_metadata_t metadata)
{
  return MEMORY[0x1E0CD71E0](metadata);
}

tls_ciphersuite_t sec_protocol_metadata_get_negotiated_tls_ciphersuite(sec_protocol_metadata_t metadata)
{
  return (unsigned __int16)MEMORY[0x1E0CD71E8](metadata);
}

tls_protocol_version_t sec_protocol_metadata_get_negotiated_tls_protocol_version(sec_protocol_metadata_t metadata)
{
  return (unsigned __int16)MEMORY[0x1E0CD71F0](metadata);
}

BOOL sec_protocol_metadata_peers_are_equal(sec_protocol_metadata_t metadataA, sec_protocol_metadata_t metadataB)
{
  return MEMORY[0x1E0CD7200](metadataA, metadataB);
}

uint64_t sec_protocol_options_access_handle()
{
  return MEMORY[0x1E0CD7208]();
}

void sec_protocol_options_add_tls_application_protocol(sec_protocol_options_t options, const char *application_protocol)
{
  MEMORY[0x1E0CD7218](options, application_protocol);
}

uint64_t sec_protocol_options_add_tls_key_exchange_group()
{
  return MEMORY[0x1E0CD7230]();
}

uint64_t sec_protocol_options_add_transport_specific_application_protocol()
{
  return MEMORY[0x1E0CD7238]();
}

void sec_protocol_options_append_tls_ciphersuite(sec_protocol_options_t options, tls_ciphersuite_t ciphersuite)
{
  MEMORY[0x1E0CD7240](options, ciphersuite);
}

void sec_protocol_options_append_tls_ciphersuite_group(sec_protocol_options_t options, tls_ciphersuite_group_t group)
{
  MEMORY[0x1E0CD7248](options, group);
}

uint64_t sec_protocol_options_apply_config()
{
  return MEMORY[0x1E0CD7250]();
}

uint64_t sec_protocol_options_clear_tls_application_protocols()
{
  return MEMORY[0x1E0CD7258]();
}

uint64_t sec_protocol_options_copy_transport_specific_application_protocol()
{
  return MEMORY[0x1E0CD7268]();
}

BOOL sec_protocol_options_get_enable_encrypted_client_hello(sec_protocol_options_t options)
{
  return MEMORY[0x1E0CD7280](options);
}

uint64_t sec_protocol_options_matches_config()
{
  return MEMORY[0x1E0CD7290]();
}

void sec_protocol_options_set_challenge_block(sec_protocol_options_t options, sec_protocol_challenge_t challenge_block, dispatch_queue_t challenge_queue)
{
  MEMORY[0x1E0CD7298](options, challenge_block, challenge_queue);
}

uint64_t sec_protocol_options_set_connection_id()
{
  return MEMORY[0x1E0CD72A0]();
}

void sec_protocol_options_set_enable_encrypted_client_hello(sec_protocol_options_t options, BOOL enable_encrypted_client_hello)
{
  MEMORY[0x1E0CD72A8](options, enable_encrypted_client_hello);
}

uint64_t sec_protocol_options_set_experiment_identifier()
{
  return MEMORY[0x1E0CD72B0]();
}

void sec_protocol_options_set_local_identity(sec_protocol_options_t options, sec_identity_t identity)
{
  MEMORY[0x1E0CD72B8](options, identity);
}

void sec_protocol_options_set_max_tls_protocol_version(sec_protocol_options_t options, tls_protocol_version_t version)
{
  MEMORY[0x1E0CD72C0](options, version);
}

void sec_protocol_options_set_min_tls_protocol_version(sec_protocol_options_t options, tls_protocol_version_t version)
{
  MEMORY[0x1E0CD72C8](options, version);
}

uint64_t sec_protocol_options_set_new_session_ticket_request()
{
  return MEMORY[0x1E0CD72D0]();
}

uint64_t sec_protocol_options_set_nw_protocol_joining_context()
{
  return MEMORY[0x1E0CD72D8]();
}

void sec_protocol_options_set_peer_authentication_required(sec_protocol_options_t options, BOOL peer_authentication_required)
{
  MEMORY[0x1E0CD72E8](options, peer_authentication_required);
}

uint64_t sec_protocol_options_set_resumed_session_ticket_request()
{
  return MEMORY[0x1E0CD72F0]();
}

uint64_t sec_protocol_options_set_server_raw_public_key_certificates()
{
  return MEMORY[0x1E0CD72F8]();
}

uint64_t sec_protocol_options_set_tls_early_data_enabled()
{
  return MEMORY[0x1E0CD7308]();
}

void sec_protocol_options_set_tls_max_version(sec_protocol_options_t options, SSLProtocol version)
{
  MEMORY[0x1E0CD7320](options, *(_QWORD *)&version);
}

void sec_protocol_options_set_tls_min_version(sec_protocol_options_t options, SSLProtocol version)
{
  MEMORY[0x1E0CD7328](options, *(_QWORD *)&version);
}

void sec_protocol_options_set_tls_server_name(sec_protocol_options_t options, const char *server_name)
{
  MEMORY[0x1E0CD7338](options, server_name);
}

void sec_protocol_options_set_tls_tickets_enabled(sec_protocol_options_t options, BOOL tickets_enabled)
{
  MEMORY[0x1E0CD7348](options, tickets_enabled);
}

void sec_protocol_options_set_verify_block(sec_protocol_options_t options, sec_protocol_verify_t verify_block, dispatch_queue_t verify_block_queue)
{
  MEMORY[0x1E0CD7350](options, verify_block, verify_block_queue);
}

SecTrustRef sec_trust_copy_ref(sec_trust_t trust)
{
  return (SecTrustRef)MEMORY[0x1E0CD7368](trust);
}

const char *__cdecl sel_getName(SEL sel)
{
  return (const char *)MEMORY[0x1E0DE80C8](sel);
}

SEL sel_registerName(const char *str)
{
  return (SEL)MEMORY[0x1E0DE80E8](str);
}

ssize_t send(int a1, const void *a2, size_t a3, int a4)
{
  return MEMORY[0x1E0C852F8](*(_QWORD *)&a1, a2, a3, *(_QWORD *)&a4);
}

ssize_t sendmsg(int a1, const msghdr *a2, int a3)
{
  return MEMORY[0x1E0C85300](*(_QWORD *)&a1, a2, *(_QWORD *)&a3);
}

ssize_t sendto(int a1, const void *a2, size_t a3, int a4, const sockaddr *a5, socklen_t a6)
{
  return MEMORY[0x1E0C85310](*(_QWORD *)&a1, a2, a3, *(_QWORD *)&a4, a5, *(_QWORD *)&a6);
}

int setrlimit(int a1, const rlimit *a2)
{
  return MEMORY[0x1E0C85380](*(_QWORD *)&a1, a2);
}

int setsockopt(int a1, int a2, int a3, const void *a4, socklen_t a5)
{
  return MEMORY[0x1E0C85388](*(_QWORD *)&a1, *(_QWORD *)&a2, *(_QWORD *)&a3, a4, *(_QWORD *)&a5);
}

int shutdown(int a1, int a2)
{
  return MEMORY[0x1E0C853C0](*(_QWORD *)&a1, *(_QWORD *)&a2);
}

uint64_t si_set_nat64_v4_requires_synthesis()
{
  return MEMORY[0x1E0C853C8]();
}

uint64_t si_set_nat64_v4_synthesize()
{
  return MEMORY[0x1E0C853D0]();
}

uint64_t si_set_path_check()
{
  return MEMORY[0x1E0C853D8]();
}

int snprintf(char *__str, size_t __size, const char *__format, ...)
{
  return MEMORY[0x1E0C85440](__str, __size, __format);
}

int socket(int a1, int a2, int a3)
{
  return MEMORY[0x1E0C85450](*(_QWORD *)&a1, *(_QWORD *)&a2, *(_QWORD *)&a3);
}

int sqlite3_bind_blob(sqlite3_stmt *a1, int a2, const void *a3, int n, void (__cdecl *a5)(void *))
{
  return MEMORY[0x1E0DE8580](a1, *(_QWORD *)&a2, a3, *(_QWORD *)&n, a5);
}

int sqlite3_bind_text(sqlite3_stmt *a1, int a2, const char *a3, int a4, void (__cdecl *a5)(void *))
{
  return MEMORY[0x1E0DE85D8](a1, *(_QWORD *)&a2, a3, *(_QWORD *)&a4, a5);
}

int sqlite3_busy_timeout(sqlite3 *a1, int ms)
{
  return MEMORY[0x1E0DE8638](a1, *(_QWORD *)&ms);
}

int sqlite3_close(sqlite3 *a1)
{
  return MEMORY[0x1E0DE8650](a1);
}

const void *__cdecl sqlite3_column_blob(sqlite3_stmt *a1, int iCol)
{
  return (const void *)MEMORY[0x1E0DE8660](a1, *(_QWORD *)&iCol);
}

int sqlite3_column_bytes(sqlite3_stmt *a1, int iCol)
{
  return MEMORY[0x1E0DE8668](a1, *(_QWORD *)&iCol);
}

const unsigned __int8 *__cdecl sqlite3_column_text(sqlite3_stmt *a1, int iCol)
{
  return (const unsigned __int8 *)MEMORY[0x1E0DE86B8](a1, *(_QWORD *)&iCol);
}

int sqlite3_exec(sqlite3 *a1, const char *sql, int (__cdecl *callback)(void *, int, char **, char **), void *a4, char **errmsg)
{
  return MEMORY[0x1E0DE8798](a1, sql, callback, a4, errmsg);
}

int sqlite3_finalize(sqlite3_stmt *pStmt)
{
  return MEMORY[0x1E0DE87C8](pStmt);
}

int sqlite3_open_v2(const char *filename, sqlite3 **ppDb, int flags, const char *zVfs)
{
  return MEMORY[0x1E0DE8870](filename, ppDb, *(_QWORD *)&flags, zVfs);
}

int sqlite3_prepare_v2(sqlite3 *db, const char *zSql, int nByte, sqlite3_stmt **ppStmt, const char **pzTail)
{
  return MEMORY[0x1E0DE8880](db, zSql, *(_QWORD *)&nByte, ppStmt, pzTail);
}

int sqlite3_reset(sqlite3_stmt *pStmt)
{
  return MEMORY[0x1E0DE88B0](pStmt);
}

int sqlite3_step(sqlite3_stmt *a1)
{
  return MEMORY[0x1E0DE89A8](a1);
}

int stat(const char *a1, stat *a2)
{
  return MEMORY[0x1E0C854D8](a1, a2);
}

int strcasecmp(const char *a1, const char *a2)
{
  return MEMORY[0x1E0C85500](a1, a2);
}

char *__cdecl strcasestr(const char *__big, const char *__little)
{
  return (char *)MEMORY[0x1E0C85508](__big, __little);
}

char *__cdecl strchr(char *__s, int __c)
{
  return (char *)MEMORY[0x1E0C85518](__s, *(_QWORD *)&__c);
}

int strcmp(const char *__s1, const char *__s2)
{
  return MEMORY[0x1E0C85520](__s1, __s2);
}

char *__cdecl strdup(const char *__s1)
{
  return (char *)MEMORY[0x1E0C85540](__s1);
}

char *__cdecl strerror(int __errnum)
{
  return (char *)MEMORY[0x1E0C85548](*(_QWORD *)&__errnum);
}

int strerror_r(int __errnum, char *__strerrbuf, size_t __buflen)
{
  return MEMORY[0x1E0C85550](*(_QWORD *)&__errnum, __strerrbuf, __buflen);
}

size_t strftime(char *a1, size_t a2, const char *a3, const tm *a4)
{
  return MEMORY[0x1E0C85558](a1, a2, a3, a4);
}

size_t strlcpy(char *__dst, const char *__source, size_t __size)
{
  return MEMORY[0x1E0C85570](__dst, __source, __size);
}

size_t strlen(const char *__s)
{
  return MEMORY[0x1E0C85578](__s);
}

int strncasecmp(const char *a1, const char *a2, size_t a3)
{
  return MEMORY[0x1E0C85590](a1, a2, a3);
}

int strncmp(const char *__s1, const char *__s2, size_t __n)
{
  return MEMORY[0x1E0C855A8](__s1, __s2, __n);
}

char *__cdecl strncpy(char *__dst, const char *__src, size_t __n)
{
  return (char *)MEMORY[0x1E0C855B0](__dst, __src, __n);
}

char *__cdecl strndup(const char *__s1, size_t __n)
{
  return (char *)MEMORY[0x1E0C855B8](__s1, __n);
}

size_t strnlen(const char *__s1, size_t __n)
{
  return MEMORY[0x1E0C855C0](__s1, __n);
}

char *__cdecl strnstr(const char *__big, const char *__little, size_t __len)
{
  return (char *)MEMORY[0x1E0C855C8](__big, __little, __len);
}

char *__cdecl strstr(char *__s1, const char *__s2)
{
  return (char *)MEMORY[0x1E0C85610](__s1, __s2);
}

uint64_t strtol(const char *__str, char **__endptr, int __base)
{
  return MEMORY[0x1E0C85658](__str, __endptr, *(_QWORD *)&__base);
}

unint64_t strtoull(const char *__str, char **__endptr, int __base)
{
  return MEMORY[0x1E0C856A8](__str, __endptr, *(_QWORD *)&__base);
}

uint64_t swift_allocBox()
{
  return MEMORY[0x1E0DEEA98]();
}

uint64_t swift_allocError()
{
  return MEMORY[0x1E0DEEAA8]();
}

uint64_t swift_allocObject()
{
  return MEMORY[0x1E0DEEAB0]();
}

uint64_t swift_allocateGenericClassMetadata()
{
  return MEMORY[0x1E0DEEAB8]();
}

uint64_t swift_allocateGenericValueMetadata()
{
  return MEMORY[0x1E0DEEAC0]();
}

uint64_t swift_allocateMetadataPack()
{
  return MEMORY[0x1E0DEEAC8]();
}

uint64_t swift_allocateWitnessTablePack()
{
  return MEMORY[0x1E0DEEAD0]();
}

uint64_t swift_arrayDestroy()
{
  return MEMORY[0x1E0DEEAD8]();
}

uint64_t swift_arrayInitWithCopy()
{
  return MEMORY[0x1E0DEEAE0]();
}

uint64_t swift_arrayInitWithTakeBackToFront()
{
  return MEMORY[0x1E0DEEAE8]();
}

uint64_t swift_arrayInitWithTakeFrontToBack()
{
  return MEMORY[0x1E0DEEAF0]();
}

uint64_t swift_beginAccess()
{
  return MEMORY[0x1E0DEEAF8]();
}

uint64_t swift_bridgeObjectRelease()
{
  return MEMORY[0x1E0DEEB08]();
}

uint64_t swift_bridgeObjectRelease_n()
{
  return MEMORY[0x1E0DEEB10]();
}

uint64_t swift_bridgeObjectRetain()
{
  return MEMORY[0x1E0DEEB18]();
}

uint64_t swift_bridgeObjectRetain_n()
{
  return MEMORY[0x1E0DEEB20]();
}

uint64_t swift_checkMetadataState()
{
  return MEMORY[0x1E0DEEB28]();
}

uint64_t swift_conformsToProtocol()
{
  return MEMORY[0x1E0DEEB38]();
}

uint64_t swift_conformsToProtocol2()
{
  return MEMORY[0x1E0DEEB40]();
}

uint64_t swift_deallocClassInstance()
{
  return MEMORY[0x1E0DEEB50]();
}

uint64_t swift_deallocObject()
{
  return MEMORY[0x1E0DEEB60]();
}

uint64_t swift_deallocPartialClassInstance()
{
  return MEMORY[0x1E0DEEB68]();
}

uint64_t swift_dynamicCast()
{
  return MEMORY[0x1E0DEEB80]();
}

uint64_t swift_dynamicCastClass()
{
  return MEMORY[0x1E0DEEB88]();
}

uint64_t swift_dynamicCastClassUnconditional()
{
  return MEMORY[0x1E0DEEB90]();
}

uint64_t swift_dynamicCastMetatype()
{
  return MEMORY[0x1E0DEEB98]();
}

uint64_t swift_dynamicCastObjCClassUnconditional()
{
  return MEMORY[0x1E0DEEBB0]();
}

uint64_t swift_dynamicCastUnknownClassUnconditional()
{
  return MEMORY[0x1E0DEEBD8]();
}

uint64_t swift_endAccess()
{
  return MEMORY[0x1E0DEEBE0]();
}

uint64_t swift_errorRelease()
{
  return MEMORY[0x1E0DEEBF0]();
}

uint64_t swift_errorRetain()
{
  return MEMORY[0x1E0DEEBF8]();
}

uint64_t swift_getAssociatedConformanceWitness()
{
  return MEMORY[0x1E0DEEC00]();
}

uint64_t swift_getAssociatedTypeWitness()
{
  return MEMORY[0x1E0DEEC08]();
}

uint64_t swift_getEnumCaseMultiPayload()
{
  return MEMORY[0x1E0DEEC40]();
}

uint64_t swift_getEnumTagSinglePayloadGeneric()
{
  return MEMORY[0x1E0DEEC48]();
}

uint64_t swift_getForeignTypeMetadata()
{
  return MEMORY[0x1E0DEEC78]();
}

uint64_t swift_getGenericMetadata()
{
  return MEMORY[0x1E0DEECB0]();
}

uint64_t swift_getMetatypeMetadata()
{
  return MEMORY[0x1E0DEECC0]();
}

uint64_t swift_getObjCClassMetadata()
{
  return MEMORY[0x1E0DEECD8]();
}

uint64_t swift_getObjectType()
{
  return MEMORY[0x1E0DEECE0]();
}

uint64_t swift_getSingletonMetadata()
{
  return MEMORY[0x1E0DEECF8]();
}

uint64_t swift_getTupleTypeLayout2()
{
  return MEMORY[0x1E0DEED08]();
}

uint64_t swift_getTupleTypeLayout3()
{
  return MEMORY[0x1E0DEED10]();
}

uint64_t swift_getTupleTypeMetadata()
{
  return MEMORY[0x1E0DEED18]();
}

uint64_t swift_getTupleTypeMetadata2()
{
  return MEMORY[0x1E0DEED20]();
}

uint64_t swift_getTupleTypeMetadata3()
{
  return MEMORY[0x1E0DEED28]();
}

uint64_t swift_getTypeByMangledNameInContext2()
{
  return MEMORY[0x1E0DEED38]();
}

uint64_t swift_getTypeByMangledNameInContextInMetadataState2()
{
  return MEMORY[0x1E0DEED40]();
}

uint64_t swift_getWitnessTable()
{
  return MEMORY[0x1E0DEED50]();
}

uint64_t swift_initClassMetadata2()
{
  return MEMORY[0x1E0DEED58]();
}

uint64_t swift_initEnumMetadataMultiPayload()
{
  return MEMORY[0x1E0DEED60]();
}

uint64_t swift_initStackObject()
{
  return MEMORY[0x1E0DEED78]();
}

uint64_t swift_initStructMetadata()
{
  return MEMORY[0x1E0DEED88]();
}

uint64_t swift_isClassType()
{
  return MEMORY[0x1E0DEED90]();
}

uint64_t swift_isEscapingClosureAtFileLocation()
{
  return MEMORY[0x1E0DEED98]();
}

uint64_t swift_isUniquelyReferenced_native()
{
  return MEMORY[0x1E0DEEDB8]();
}

uint64_t swift_isUniquelyReferenced_nonNull_bridgeObject()
{
  return MEMORY[0x1E0DEEDC8]();
}

uint64_t swift_isUniquelyReferenced_nonNull_native()
{
  return MEMORY[0x1E0DEEDD0]();
}

uint64_t swift_lookUpClassMethod()
{
  return MEMORY[0x1E0DEEDE0]();
}

uint64_t swift_makeBoxUnique()
{
  return MEMORY[0x1E0DEEDE8]();
}

uint64_t swift_once()
{
  return MEMORY[0x1E0DEEE00]();
}

uint64_t swift_release()
{
  return MEMORY[0x1E0DEEE30]();
}

uint64_t swift_release_n()
{
  return MEMORY[0x1E0DEEE38]();
}

uint64_t swift_retain()
{
  return MEMORY[0x1E0DEEE48]();
}

uint64_t swift_retain_n()
{
  return MEMORY[0x1E0DEEE50]();
}

uint64_t swift_setDeallocating()
{
  return MEMORY[0x1E0DEEE70]();
}

uint64_t swift_slowAlloc()
{
  return MEMORY[0x1E0DEEE78]();
}

uint64_t swift_slowDealloc()
{
  return MEMORY[0x1E0DEEE80]();
}

uint64_t swift_stdlib_isStackAllocationSafe()
{
  return MEMORY[0x1E0DEEE88]();
}

uint64_t swift_storeEnumTagMultiPayload()
{
  return MEMORY[0x1E0DEEE98]();
}

uint64_t swift_storeEnumTagSinglePayloadGeneric()
{
  return MEMORY[0x1E0DEEEA0]();
}

uint64_t swift_task_alloc()
{
  return MEMORY[0x1E0DF1000]();
}

uint64_t swift_task_create()
{
  return MEMORY[0x1E0DF1008]();
}

uint64_t swift_task_dealloc()
{
  return MEMORY[0x1E0DF1010]();
}

uint64_t swift_task_localValuePop()
{
  return MEMORY[0x1E0DF1030]();
}

uint64_t swift_task_localValuePush()
{
  return MEMORY[0x1E0DF1038]();
}

uint64_t swift_task_switch()
{
  return MEMORY[0x1E0DF1050]();
}

uint64_t swift_unexpectedError()
{
  return MEMORY[0x1E0DEEEB8]();
}

uint64_t swift_unknownObjectRelease()
{
  return MEMORY[0x1E0DEEEC0]();
}

uint64_t swift_unknownObjectRelease_n()
{
  return MEMORY[0x1E0DEEEC8]();
}

uint64_t swift_unknownObjectRetain()
{
  return MEMORY[0x1E0DEEED0]();
}

uint64_t swift_unknownObjectRetain_n()
{
  return MEMORY[0x1E0DEEED8]();
}

uint64_t swift_unknownObjectWeakAssign()
{
  return MEMORY[0x1E0DEEF20]();
}

uint64_t swift_unknownObjectWeakDestroy()
{
  return MEMORY[0x1E0DEEF38]();
}

uint64_t swift_unknownObjectWeakInit()
{
  return MEMORY[0x1E0DEEF40]();
}

uint64_t swift_unknownObjectWeakLoadStrong()
{
  return MEMORY[0x1E0DEEF48]();
}

uint64_t swift_updateClassMetadata2()
{
  return MEMORY[0x1E0DEEF78]();
}

uint64_t swift_weakDestroy()
{
  return MEMORY[0x1E0DEEF98]();
}

uint64_t swift_weakInit()
{
  return MEMORY[0x1E0DEEFA0]();
}

uint64_t swift_weakLoadStrong()
{
  return MEMORY[0x1E0DEEFA8]();
}

uint64_t swift_willThrow()
{
  return MEMORY[0x1E0DEEFC0]();
}

uint64_t swift_willThrowTypedImpl()
{
  return MEMORY[0x1E0DEEFC8]();
}

uint64_t symptom_framework_init()
{
  return MEMORY[0x1E0C85728]();
}

uint64_t symptom_new()
{
  return MEMORY[0x1E0C85730]();
}

uint64_t symptom_send()
{
  return MEMORY[0x1E0C85738]();
}

uint64_t symptom_send_immediate()
{
  return MEMORY[0x1E0C85740]();
}

uint64_t symptom_set_additional_qualifier()
{
  return MEMORY[0x1E0C85748]();
}

uint64_t symptom_set_qualifier()
{
  return MEMORY[0x1E0C85750]();
}

int sysctl(int *a1, u_int a2, void *a3, size_t *a4, void *a5, size_t a6)
{
  return MEMORY[0x1E0C85798](a1, *(_QWORD *)&a2, a3, a4, a5, a6);
}

int sysctlbyname(const char *a1, void *a2, size_t *a3, void *a4, size_t a5)
{
  return MEMORY[0x1E0C857A0](a1, a2, a3, a4, a5);
}

kern_return_t task_info(task_name_t target_task, task_flavor_t flavor, task_info_t task_info_out, mach_msg_type_number_t *task_info_outCnt)
{
  return MEMORY[0x1E0C85838](*(_QWORD *)&target_task, *(_QWORD *)&flavor, task_info_out, task_info_outCnt);
}

time_t time(time_t *a1)
{
  return MEMORY[0x1E0C85950](a1);
}

uint64_t tls_helper_SSLProtocol_from_version()
{
  return MEMORY[0x1E0DE55C8]();
}

void tzset(void)
{
  MEMORY[0x1E0C85990]();
}

const char *__cdecl u_errorName(UErrorCode code)
{
  return (const char *)MEMORY[0x1E0DE5988](*(_QWORD *)&code);
}

int32_t uidna_nameToASCII(const UIDNA *idna, const UChar *name, int32_t length, UChar *dest, int32_t capacity, UIDNAInfo *pInfo, UErrorCode *pErrorCode)
{
  return MEMORY[0x1E0DE62C0](idna, name, *(_QWORD *)&length, dest, *(_QWORD *)&capacity, pInfo, pErrorCode);
}

UIDNA *__cdecl uidna_openUTS46(uint32_t options, UErrorCode *pErrorCode)
{
  return (UIDNA *)MEMORY[0x1E0DE62E0](*(_QWORD *)&options, pErrorCode);
}

int uname(utsname *a1)
{
  return MEMORY[0x1E0C859A0](a1);
}

int unlink(const char *a1)
{
  return MEMORY[0x1E0C859B8](a1);
}

void uuid_clear(uuid_t uu)
{
  MEMORY[0x1E0C85A00](uu);
}

int uuid_compare(const uuid_t uu1, const uuid_t uu2)
{
  return MEMORY[0x1E0C85A08](uu1, uu2);
}

void uuid_generate(uuid_t out)
{
  MEMORY[0x1E0C85A18](out);
}

void uuid_generate_random(uuid_t out)
{
  MEMORY[0x1E0C85A20](out);
}

int uuid_is_null(const uuid_t uu)
{
  return MEMORY[0x1E0C85A30](uu);
}

int uuid_parse(const uuid_string_t in, uuid_t uu)
{
  return MEMORY[0x1E0C85A38](in, uu);
}

void uuid_unparse(const uuid_t uu, uuid_string_t out)
{
  MEMORY[0x1E0C85A40](uu, out);
}

void uuid_unparse_upper(const uuid_t uu, uuid_string_t out)
{
  MEMORY[0x1E0C85A50](uu, out);
}

int vasprintf(char **a1, const char *a2, va_list a3)
{
  return MEMORY[0x1E0C85A58](a1, a2, a3);
}

ssize_t write(int __fd, const void *__buf, size_t __nbyte)
{
  return MEMORY[0x1E0C85D40](*(_QWORD *)&__fd, __buf, __nbyte);
}

void xpc_array_append_value(xpc_object_t xarray, xpc_object_t value)
{
  MEMORY[0x1E0C85DE0](xarray, value);
}

BOOL xpc_array_apply(xpc_object_t xarray, xpc_array_applier_t applier)
{
  return MEMORY[0x1E0C85DF8](xarray, applier);
}

xpc_object_t xpc_array_create(xpc_object_t *objects, size_t count)
{
  return (xpc_object_t)MEMORY[0x1E0C85E00](objects, count);
}

xpc_object_t xpc_array_create_empty(void)
{
  return (xpc_object_t)MEMORY[0x1E0C85E10]();
}

size_t xpc_array_get_count(xpc_object_t xarray)
{
  return MEMORY[0x1E0C85E30](xarray);
}

int64_t xpc_array_get_int64(xpc_object_t xarray, size_t index)
{
  return MEMORY[0x1E0C85E60](xarray, index);
}

const char *__cdecl xpc_array_get_string(xpc_object_t xarray, size_t index)
{
  return (const char *)MEMORY[0x1E0C85E70](xarray, index);
}

uint64_t xpc_array_get_uint64(xpc_object_t xarray, size_t index)
{
  return MEMORY[0x1E0C85E78](xarray, index);
}

const uint8_t *__cdecl xpc_array_get_uuid(xpc_object_t xarray, size_t index)
{
  return (const uint8_t *)MEMORY[0x1E0C85E80](xarray, index);
}

xpc_object_t xpc_array_get_value(xpc_object_t xarray, size_t index)
{
  return (xpc_object_t)MEMORY[0x1E0C85E90](xarray, index);
}

void xpc_array_set_data(xpc_object_t xarray, size_t index, const void *bytes, size_t length)
{
  MEMORY[0x1E0C85EA8](xarray, index, bytes, length);
}

void xpc_array_set_int64(xpc_object_t xarray, size_t index, int64_t value)
{
  MEMORY[0x1E0C85EC0](xarray, index, value);
}

void xpc_array_set_string(xpc_object_t xarray, size_t index, const char *string)
{
  MEMORY[0x1E0C85ED0](xarray, index, string);
}

void xpc_array_set_uint64(xpc_object_t xarray, size_t index, uint64_t value)
{
  MEMORY[0x1E0C85ED8](xarray, index, value);
}

void xpc_array_set_uuid(xpc_object_t xarray, size_t index, const unsigned __int8 *uuid)
{
  MEMORY[0x1E0C85EE0](xarray, index, uuid);
}

void xpc_array_set_value(xpc_object_t xarray, size_t index, xpc_object_t value)
{
  MEMORY[0x1E0C85EE8](xarray, index, value);
}

xpc_object_t xpc_BOOL_create(BOOL value)
{
  return (xpc_object_t)MEMORY[0x1E0C85EF0](value);
}

BOOL xpc_BOOL_get_value(xpc_object_t xBOOL)
{
  return MEMORY[0x1E0C85F00](xBOOL);
}

void xpc_connection_cancel(xpc_connection_t connection)
{
  MEMORY[0x1E0C85F68](connection);
}

uint64_t xpc_connection_copy_entitlement_value()
{
  return MEMORY[0x1E0C85F78]();
}

xpc_connection_t xpc_connection_create_mach_service(const char *name, dispatch_queue_t targetq, uint64_t flags)
{
  return (xpc_connection_t)MEMORY[0x1E0C85FB0](name, targetq, flags);
}

pid_t xpc_connection_get_pid(xpc_connection_t connection)
{
  return MEMORY[0x1E0C86008](connection);
}

void xpc_connection_resume(xpc_connection_t connection)
{
  MEMORY[0x1E0C86018](connection);
}

void xpc_connection_send_message(xpc_connection_t connection, xpc_object_t message)
{
  MEMORY[0x1E0C86030](connection, message);
}

void xpc_connection_send_message_with_reply(xpc_connection_t connection, xpc_object_t message, dispatch_queue_t replyq, xpc_handler_t handler)
{
  MEMORY[0x1E0C86038](connection, message, replyq, handler);
}

xpc_object_t xpc_connection_send_message_with_reply_sync(xpc_connection_t connection, xpc_object_t message)
{
  return (xpc_object_t)MEMORY[0x1E0C86048](connection, message);
}

void xpc_connection_set_event_handler(xpc_connection_t connection, xpc_handler_t handler)
{
  MEMORY[0x1E0C86080](connection, handler);
}

void xpc_connection_set_target_queue(xpc_connection_t connection, dispatch_queue_t targetq)
{
  MEMORY[0x1E0C860C8](connection, targetq);
}

xpc_object_t xpc_copy(xpc_object_t object)
{
  return (xpc_object_t)MEMORY[0x1E0C860E8](object);
}

char *__cdecl xpc_copy_description(xpc_object_t object)
{
  return (char *)MEMORY[0x1E0C86108](object);
}

uint64_t xpc_create_from_plist()
{
  return MEMORY[0x1E0C86150]();
}

xpc_object_t xpc_data_create(const void *bytes, size_t length)
{
  return (xpc_object_t)MEMORY[0x1E0C86178](bytes, length);
}

xpc_object_t xpc_data_create_with_dispatch_data(dispatch_data_t ddata)
{
  return (xpc_object_t)MEMORY[0x1E0C86188](ddata);
}

size_t xpc_data_get_bytes(xpc_object_t xdata, void *buffer, size_t off, size_t length)
{
  return MEMORY[0x1E0C86190](xdata, buffer, off, length);
}

const void *__cdecl xpc_data_get_bytes_ptr(xpc_object_t xdata)
{
  return (const void *)MEMORY[0x1E0C86198](xdata);
}

size_t xpc_data_get_length(xpc_object_t xdata)
{
  return MEMORY[0x1E0C861A8](xdata);
}

BOOL xpc_dictionary_apply(xpc_object_t xdict, xpc_dictionary_applier_t applier)
{
  return MEMORY[0x1E0C861F0](xdict, applier);
}

uint64_t xpc_dictionary_copy_basic_description()
{
  return MEMORY[0x1E0C861F8]();
}

xpc_object_t xpc_dictionary_create(const char *const *keys, xpc_object_t *values, size_t count)
{
  return (xpc_object_t)MEMORY[0x1E0C86208](keys, values, count);
}

xpc_object_t xpc_dictionary_create_reply(xpc_object_t original)
{
  return (xpc_object_t)MEMORY[0x1E0C86228](original);
}

int xpc_dictionary_dup_fd(xpc_object_t xdict, const char *key)
{
  return MEMORY[0x1E0C86230](xdict, key);
}

xpc_object_t xpc_dictionary_get_array(xpc_object_t xdict, const char *key)
{
  return (xpc_object_t)MEMORY[0x1E0C86248](xdict, key);
}

BOOL xpc_dictionary_get_BOOL(xpc_object_t xdict, const char *key)
{
  return MEMORY[0x1E0C86260](xdict, key);
}

size_t xpc_dictionary_get_count(xpc_object_t xdict)
{
  return MEMORY[0x1E0C86270](xdict);
}

const void *__cdecl xpc_dictionary_get_data(xpc_object_t xdict, const char *key, size_t *length)
{
  return (const void *)MEMORY[0x1E0C86278](xdict, key, length);
}

xpc_object_t xpc_dictionary_get_dictionary(xpc_object_t xdict, const char *key)
{
  return (xpc_object_t)MEMORY[0x1E0C86288](xdict, key);
}

int64_t xpc_dictionary_get_int64(xpc_object_t xdict, const char *key)
{
  return MEMORY[0x1E0C862A0](xdict, key);
}

uint64_t xpc_dictionary_get_pointer()
{
  return MEMORY[0x1E0C862A8]();
}

const char *__cdecl xpc_dictionary_get_string(xpc_object_t xdict, const char *key)
{
  return (const char *)MEMORY[0x1E0C862C8](xdict, key);
}

uint64_t xpc_dictionary_get_uint64(xpc_object_t xdict, const char *key)
{
  return MEMORY[0x1E0C862D0](xdict, key);
}

const uint8_t *__cdecl xpc_dictionary_get_uuid(xpc_object_t xdict, const char *key)
{
  return (const uint8_t *)MEMORY[0x1E0C862D8](xdict, key);
}

xpc_object_t xpc_dictionary_get_value(xpc_object_t xdict, const char *key)
{
  return (xpc_object_t)MEMORY[0x1E0C862E0](xdict, key);
}

void xpc_dictionary_set_BOOL(xpc_object_t xdict, const char *key, BOOL value)
{
  MEMORY[0x1E0C86310](xdict, key, value);
}

void xpc_dictionary_set_data(xpc_object_t xdict, const char *key, const void *bytes, size_t length)
{
  MEMORY[0x1E0C86330](xdict, key, bytes, length);
}

void xpc_dictionary_set_int64(xpc_object_t xdict, const char *key, int64_t value)
{
  MEMORY[0x1E0C86360](xdict, key, value);
}

uint64_t xpc_dictionary_set_pointer()
{
  return MEMORY[0x1E0C86380]();
}

void xpc_dictionary_set_string(xpc_object_t xdict, const char *key, const char *string)
{
  MEMORY[0x1E0C86390](xdict, key, string);
}

void xpc_dictionary_set_uint64(xpc_object_t xdict, const char *key, uint64_t value)
{
  MEMORY[0x1E0C86398](xdict, key, value);
}

void xpc_dictionary_set_uuid(xpc_object_t xdict, const char *key, const unsigned __int8 *uuid)
{
  MEMORY[0x1E0C863B0](xdict, key, uuid);
}

void xpc_dictionary_set_value(xpc_object_t xdict, const char *key, xpc_object_t value)
{
  MEMORY[0x1E0C863B8](xdict, key, value);
}

xpc_object_t xpc_double_create(double value)
{
  return (xpc_object_t)MEMORY[0x1E0C863D0](value);
}

double xpc_double_get_value(xpc_object_t xdouble)
{
  double result;

  MEMORY[0x1E0C863E0](xdouble);
  return result;
}

BOOL xpc_equal(xpc_object_t object1, xpc_object_t object2)
{
  return MEMORY[0x1E0C86420](object1, object2);
}

xpc_object_t xpc_fd_create(int fd)
{
  return (xpc_object_t)MEMORY[0x1E0C864A0](*(_QWORD *)&fd);
}

xpc_type_t xpc_get_type(xpc_object_t object)
{
  return (xpc_type_t)MEMORY[0x1E0C86520](object);
}

size_t xpc_hash(xpc_object_t object)
{
  return MEMORY[0x1E0C86538](object);
}

xpc_object_t xpc_int64_create(int64_t value)
{
  return (xpc_object_t)MEMORY[0x1E0C86568](value);
}

int64_t xpc_int64_get_value(xpc_object_t xint)
{
  return MEMORY[0x1E0C86570](xint);
}

uint64_t xpc_pointer_get_value()
{
  return MEMORY[0x1E0C86648]();
}

void xpc_release(xpc_object_t object)
{
  MEMORY[0x1E0C86658](object);
}

xpc_object_t xpc_retain(xpc_object_t object)
{
  return (xpc_object_t)MEMORY[0x1E0C86660](object);
}

void xpc_set_event_stream_handler(const char *stream, dispatch_queue_t targetq, xpc_handler_t handler)
{
  MEMORY[0x1E0C866E8](stream, targetq, handler);
}

xpc_object_t xpc_string_create(const char *string)
{
  return (xpc_object_t)MEMORY[0x1E0C86720](string);
}

xpc_object_t xpc_string_create_with_format(const char *fmt, ...)
{
  return (xpc_object_t)MEMORY[0x1E0C86730](fmt);
}

size_t xpc_string_get_length(xpc_object_t xstring)
{
  return MEMORY[0x1E0C86748](xstring);
}

const char *__cdecl xpc_string_get_string_ptr(xpc_object_t xstring)
{
  return (const char *)MEMORY[0x1E0C86758](xstring);
}

xpc_object_t xpc_uint64_create(uint64_t value)
{
  return (xpc_object_t)MEMORY[0x1E0C867B0](value);
}

uint64_t xpc_uint64_get_value(xpc_object_t xuint)
{
  return MEMORY[0x1E0C867B8](xuint);
}

xpc_object_t xpc_uuid_create(const unsigned __int8 *uuid)
{
  return (xpc_object_t)MEMORY[0x1E0C867E0](uuid);
}

const uint8_t *__cdecl xpc_uuid_get_bytes(xpc_object_t xuuid)
{
  return (const uint8_t *)MEMORY[0x1E0C867F8](xuuid);
}

const char *__cdecl zError(int a1)
{
  return (const char *)MEMORY[0x1E0DE9400](*(_QWORD *)&a1);
}

uint64_t perform_first_network_use_flow_delayInitStub(double a1)
{
  if (!atomic_load(&dlopenHelperFlag_libcupolicy_dylib))
    dlopenHelper_libcupolicy_dylib(a1);
  return MEMORY[0x1E0DE5638]();
}

uint64_t network_usage_policy_create_client_delayInitStub(double a1)
{
  if (!atomic_load(&dlopenHelperFlag_libcupolicy_dylib))
    dlopenHelper_libcupolicy_dylib(a1);
  return MEMORY[0x1E0DE55F0]();
}

uint64_t nwswifttls_copy_definition_delayInitStub(double a1)
{
  if (!atomic_load((unsigned int *)&dlopenHelperFlag_libnwswifttls_dylib))
    dlopenHelper_libnwswifttls_dylib(a1);
  return MEMORY[0x1E0DE7908]();
}

uint64_t analytics_send_event_delayInitStub(double a1)
{
  if (!atomic_load(&dlopenHelperFlag_CoreAnalytics))
    dlopenHelper_CoreAnalytics(a1);
  return MEMORY[0x1E0D15468]();
}

uint64_t nwrapport_copy_protocol_definition_delayInitStub(double a1)
{
  if (!atomic_load(&dlopenHelperFlag_Rapport))
    dlopenHelper_Rapport(a1);
  return MEMORY[0x1E0D839F8]();
}

uint64_t pcap_create_delayInitStub(double a1)
{
  if (!atomic_load(&dlopenHelperFlag_libpcap_A_dylib))
    dlopenHelper_libpcap_A_dylib(a1);
  return MEMORY[0x1E0DE8100]();
}

uint64_t pcap_activate_delayInitStub(double a1)
{
  if (!atomic_load(&dlopenHelperFlag_libpcap_A_dylib))
    dlopenHelper_libpcap_A_dylib(a1);
  return MEMORY[0x1E0DE80F0]();
}

uint64_t pcap_ng_dump_open_delayInitStub(double a1)
{
  if (!atomic_load(&dlopenHelperFlag_libpcap_A_dylib))
    dlopenHelper_libpcap_A_dylib(a1);
  return MEMORY[0x1E0DE8130]();
}

uint64_t pcap_ng_dump_close_delayInitStub(double a1)
{
  if (!atomic_load(&dlopenHelperFlag_libpcap_A_dylib))
    dlopenHelper_libpcap_A_dylib(a1);
  return MEMORY[0x1E0DE8128]();
}

uint64_t pcap_close_delayInitStub(double a1)
{
  if (!atomic_load(&dlopenHelperFlag_libpcap_A_dylib))
    dlopenHelper_libpcap_A_dylib(a1);
  return MEMORY[0x1E0DE80F8]();
}

uint64_t pcap_ng_block_alloc_delayInitStub(double a1)
{
  if (!atomic_load(&dlopenHelperFlag_libpcap_A_dylib))
    dlopenHelper_libpcap_A_dylib(a1);
  return MEMORY[0x1E0DE8108]();
}

uint64_t pcap_ng_block_reset_delayInitStub(double a1)
{
  if (!atomic_load(&dlopenHelperFlag_libpcap_A_dylib))
    dlopenHelper_libpcap_A_dylib(a1);
  return MEMORY[0x1E0DE8118]();
}

uint64_t pcap_ng_get_enhanced_packet_fields_delayInitStub(double a1)
{
  if (!atomic_load(&dlopenHelperFlag_libpcap_A_dylib))
    dlopenHelper_libpcap_A_dylib(a1);
  return MEMORY[0x1E0DE8140]();
}

uint64_t pcap_ng_block_packet_set_data_delayInitStub(double a1)
{
  if (!atomic_load(&dlopenHelperFlag_libpcap_A_dylib))
    dlopenHelper_libpcap_A_dylib(a1);
  return MEMORY[0x1E0DE8110]();
}

uint64_t pcap_ng_dump_block_delayInitStub(double a1)
{
  if (!atomic_load(&dlopenHelperFlag_libpcap_A_dylib))
    dlopenHelper_libpcap_A_dylib(a1);
  return MEMORY[0x1E0DE8120]();
}

uint64_t pcap_ng_free_block_delayInitStub(double a1)
{
  if (!atomic_load(&dlopenHelperFlag_libpcap_A_dylib))
    dlopenHelper_libpcap_A_dylib(a1);
  return MEMORY[0x1E0DE8138]();
}

uint64_t NEFlowDirectorDestroy_delayInitStub(double a1)
{
  if (!atomic_load(&dlopenHelperFlag_libnetworkextension_dylib))
    dlopenHelper_libnetworkextension_dylib(a1);
  return MEMORY[0x1E0DE7688]();
}

uint64_t NEFlowDirectorCreateBridge_delayInitStub(double a1)
{
  if (!atomic_load(&dlopenHelperFlag_libnetworkextension_dylib))
    dlopenHelper_libnetworkextension_dylib(a1);
  return MEMORY[0x1E0DE7680]();
}

uint64_t NEFlowDirectorStart_delayInitStub(double a1)
{
  if (!atomic_load(&dlopenHelperFlag_libnetworkextension_dylib))
    dlopenHelper_libnetworkextension_dylib(a1);
  return MEMORY[0x1E0DE76D8]();
}

uint64_t ne_filter_protocol_identifier_delayInitStub(double a1)
{
  if (!atomic_load(&dlopenHelperFlag_libnetworkextension_dylib))
    dlopenHelper_libnetworkextension_dylib(a1);
  return MEMORY[0x1E0DE77A8]();
}

double __spoils<X1,X2,X3,X4,X5,X6,X7,X8,X9,X10,X11,X12,X13,X14,X15,X16,X17,Q0,Q1,Q2,Q3,Q4,Q5,Q6,Q7,Q16,Q17,Q18,Q19,Q20,Q21,Q22,Q23,Q24,Q25,Q26,Q27,Q28,Q29,Q30,Q31> dlopenHelper_libnwswifttls_dylib(double a1)
{
  dlopen("/usr/lib/libnwswifttls.dylib", 0);
  atomic_store(1u, (unsigned int *)&dlopenHelperFlag_libnwswifttls_dylib);
  return a1;
}

double __spoils<X1,X2,X3,X4,X5,X6,X7,X8,X9,X10,X11,X12,X13,X14,X15,X16,X17,Q0,Q1,Q2,Q3,Q4,Q5,Q6,Q7,Q16,Q17,Q18,Q19,Q20,Q21,Q22,Q23,Q24,Q25,Q26,Q27,Q28,Q29,Q30,Q31> dlopenHelper_LoggingSupport(double a1)
{
  dlopen("/System/Library/PrivateFrameworks/LoggingSupport.framework/LoggingSupport", 0);
  atomic_store(1u, &dlopenHelperFlag_LoggingSupport);
  return a1;
}

double __spoils<X1,X2,X3,X4,X5,X6,X7,X8,X9,X10,X11,X12,X13,X14,X15,X16,X17,Q0,Q1,Q2,Q3,Q4,Q5,Q6,Q7,Q16,Q17,Q18,Q19,Q20,Q21,Q22,Q23,Q24,Q25,Q26,Q27,Q28,Q29,Q30,Q31> dlopenHelper_CoreAnalytics(double a1)
{
  dlopen("/System/Library/PrivateFrameworks/CoreAnalytics.framework/CoreAnalytics", 0);
  atomic_store(1u, &dlopenHelperFlag_CoreAnalytics);
  return a1;
}

double __spoils<X1,X2,X3,X4,X5,X6,X7,X8,X9,X10,X11,X12,X13,X14,X15,X16,X17,Q0,Q1,Q2,Q3,Q4,Q5,Q6,Q7,Q16,Q17,Q18,Q19,Q20,Q21,Q22,Q23,Q24,Q25,Q26,Q27,Q28,Q29,Q30,Q31> dlopenHelper_Rapport(double a1)
{
  dlopen("/System/Library/PrivateFrameworks/Rapport.framework/Rapport", 0);
  atomic_store(1u, &dlopenHelperFlag_Rapport);
  return a1;
}

double __spoils<X1,X2,X3,X4,X5,X6,X7,X8,X9,X10,X11,X12,X13,X14,X15,X16,X17,Q0,Q1,Q2,Q3,Q4,Q5,Q6,Q7,Q16,Q17,Q18,Q19,Q20,Q21,Q22,Q23,Q24,Q25,Q26,Q27,Q28,Q29,Q30,Q31> dlopenHelper_libcupolicy_dylib(double a1)
{
  dlopen("/usr/lib/libcupolicy.dylib", 0);
  atomic_store(1u, &dlopenHelperFlag_libcupolicy_dylib);
  return a1;
}

double __spoils<X1,X2,X3,X4,X5,X6,X7,X8,X9,X10,X11,X12,X13,X14,X15,X16,X17,Q0,Q1,Q2,Q3,Q4,Q5,Q6,Q7,Q16,Q17,Q18,Q19,Q20,Q21,Q22,Q23,Q24,Q25,Q26,Q27,Q28,Q29,Q30,Q31> dlopenHelper_libpcap_A_dylib(double a1)
{
  dlopen("/usr/lib/libpcap.A.dylib", 0);
  atomic_store(1u, &dlopenHelperFlag_libpcap_A_dylib);
  return a1;
}

double __spoils<X1,X2,X3,X4,X5,X6,X7,X8,X9,X10,X11,X12,X13,X14,X15,X16,X17,Q0,Q1,Q2,Q3,Q4,Q5,Q6,Q7,Q16,Q17,Q18,Q19,Q20,Q21,Q22,Q23,Q24,Q25,Q26,Q27,Q28,Q29,Q30,Q31> dlopenHelper_SymptomAnalytics(double a1)
{
  dlopen("/System/Library/PrivateFrameworks/Symptoms.framework/Frameworks/SymptomAnalytics.framework/SymptomAnalytics", 0);
  atomic_store(1u, &dlopenHelperFlag_SymptomAnalytics);
  return a1;
}

double __spoils<X1,X2,X3,X4,X5,X6,X7,X8,X9,X10,X11,X12,X13,X14,X15,X16,X17,Q0,Q1,Q2,Q3,Q4,Q5,Q6,Q7,Q16,Q17,Q18,Q19,Q20,Q21,Q22,Q23,Q24,Q25,Q26,Q27,Q28,Q29,Q30,Q31> dlopenHelper_CoreWiFi(double a1)
{
  dlopen("/System/Library/PrivateFrameworks/CoreWiFi.framework/CoreWiFi", 0);
  atomic_store(1u, &dlopenHelperFlag_CoreWiFi);
  return a1;
}

double __spoils<X1,X2,X3,X4,X5,X6,X7,X8,X9,X10,X11,X12,X13,X14,X15,X16,X17,Q0,Q1,Q2,Q3,Q4,Q5,Q6,Q7,Q16,Q17,Q18,Q19,Q20,Q21,Q22,Q23,Q24,Q25,Q26,Q27,Q28,Q29,Q30,Q31> dlopenHelper_libnetworkextension_dylib(double a1)
{
  dlopen("/usr/lib/libnetworkextension.dylib", 0);
  atomic_store(1u, &dlopenHelperFlag_libnetworkextension_dylib);
  return a1;
}

double __spoils<X1,X2,X3,X4,X5,X6,X7,X8,X9,X10,X11,X12,X13,X14,X15,X16,X17,Q0,Q1,Q2,Q3,Q4,Q5,Q6,Q7,Q16,Q17,Q18,Q19,Q20,Q21,Q22,Q23,Q24,Q25,Q26,Q27,Q28,Q29,Q30,Q31> dlopenHelper_RunningBoardServices(double a1)
{
  dlopen("/System/Library/PrivateFrameworks/RunningBoardServices.framework/RunningBoardServices", 0);
  atomic_store(1u, (unsigned int *)&dlopenHelperFlag_RunningBoardServices);
  return a1;
}

double __spoils<X1,X2,X3,X4,X5,X6,X7,X8,X9,X10,X11,X12,X13,X14,X15,X16,X17,Q0,Q1,Q2,Q3,Q4,Q5,Q6,Q7,Q16,Q17,Q18,Q19,Q20,Q21,Q22,Q23,Q24,Q25,Q26,Q27,Q28,Q29,Q30,Q31> dlopenHelper_MobileAsset(double a1)
{
  dlopen("/System/Library/PrivateFrameworks/MobileAsset.framework/MobileAsset", 0);
  atomic_store(1u, dlopenHelperFlag_MobileAsset);
  return a1;
}

double __spoils<X1,X2,X3,X4,X5,X6,X7,X8,X9,X10,X11,X12,X13,X14,X15,X16,X17,Q0,Q1,Q2,Q3,Q4,Q5,Q6,Q7,Q16,Q17,Q18,Q19,Q20,Q21,Q22,Q23,Q24,Q25,Q26,Q27,Q28,Q29,Q30,Q31> dlopenHelper_AssertionServices(double a1)
{
  dlopen("/System/Library/PrivateFrameworks/AssertionServices.framework/AssertionServices", 0);
  atomic_store(1u, &dlopenHelperFlag_AssertionServices);
  return a1;
}

double __spoils<X1,X2,X3,X4,X5,X6,X7,X8,X9,X10,X11,X12,X13,X14,X15,X16,X17,Q0,Q1,Q2,Q3,Q4,Q5,Q6,Q7,Q16,Q17,Q18,Q19,Q20,Q21,Q22,Q23,Q24,Q25,Q26,Q27,Q28,Q29,Q30,Q31> dlopenHelper_UserManagement(double a1)
{
  dlopen("/System/Library/PrivateFrameworks/UserManagement.framework/UserManagement", 0);
  atomic_store(1u, (unsigned int *)&dlopenHelperFlag_UserManagement);
  return a1;
}

double gotLoadHelper_x8__OBJC_CLASS___BKSApplicationStateMonitor(double result)
{
  if (!atomic_load(&dlopenHelperFlag_AssertionServices))
    return dlopenHelper_AssertionServices(result);
  return result;
}

double gotLoadHelper_x8__BKSApplicationStateDisplayIDKey(double result)
{
  if (!atomic_load(&dlopenHelperFlag_AssertionServices))
    return dlopenHelper_AssertionServices(result);
  return result;
}

double gotLoadHelper_x8__BKSApplicationStateProcessIDKey(double result)
{
  if (!atomic_load(&dlopenHelperFlag_AssertionServices))
    return dlopenHelper_AssertionServices(result);
  return result;
}

double gotLoadHelper_x8__BKSApplicationStateKey(double result)
{
  if (!atomic_load(&dlopenHelperFlag_AssertionServices))
    return dlopenHelper_AssertionServices(result);
  return result;
}

void gotLoadHelper_x21__OBJC_CLASS___BKSApplicationStateMonitor(double a1)
{
  if (!atomic_load(&dlopenHelperFlag_AssertionServices))
    dlopenHelper_AssertionServices(a1);
}

double gotLoadHelper_x8__network_usage_policy_create_client(double result)
{
  if (!atomic_load(&dlopenHelperFlag_libcupolicy_dylib))
    return dlopenHelper_libcupolicy_dylib(result);
  return result;
}

double gotLoadHelper_x8__nwswifttls_copy_definition(double result)
{
  if (!atomic_load((unsigned int *)&dlopenHelperFlag_libnwswifttls_dylib))
    return dlopenHelper_libnwswifttls_dylib(result);
  return result;
}

double gotLoadHelper_x8__OBJC_CLASS___RPFileTransferSession(double result)
{
  if (!atomic_load(&dlopenHelperFlag_Rapport))
    return dlopenHelper_Rapport(result);
  return result;
}

double gotLoadHelper_x8__OBJC_CLASS___RPFileTransferItem(double result)
{
  if (!atomic_load(&dlopenHelperFlag_Rapport))
    return dlopenHelper_Rapport(result);
  return result;
}

void gotLoadHelper_x19__OBJC_CLASS___OSLogPreferencesSubsystem(double a1)
{
  if (!atomic_load(&dlopenHelperFlag_LoggingSupport))
    dlopenHelper_LoggingSupport(a1);
}

double gotLoadHelper_x8__OBJC_CLASS___MAAssetQuery(double result)
{
  if (!atomic_load(dlopenHelperFlag_MobileAsset))
    return dlopenHelper_MobileAsset(result);
  return result;
}

void gotLoadHelper_x26__OBJC_CLASS___MAAsset(double a1)
{
  if (!atomic_load(dlopenHelperFlag_MobileAsset))
    dlopenHelper_MobileAsset(a1);
}

void gotLoadHelper_x24__OBJC_CLASS___CWFInterface(double a1)
{
  if (!atomic_load(&dlopenHelperFlag_CoreWiFi))
    dlopenHelper_CoreWiFi(a1);
}

double gotLoadHelper_x8__OBJC_CLASS___OSLogEventLiveStream(double result)
{
  if (!atomic_load(&dlopenHelperFlag_LoggingSupport))
    return dlopenHelper_LoggingSupport(result);
  return result;
}

void gotLoadHelper_x19__OBJC_CLASS___OSLogEventLiveSource(double a1)
{
  if (!atomic_load(&dlopenHelperFlag_LoggingSupport))
    dlopenHelper_LoggingSupport(a1);
}

void gotLoadHelper_x19__OBJC_CLASS___RBSProcessHandle(double a1)
{
  if (!atomic_load((unsigned int *)&dlopenHelperFlag_RunningBoardServices))
    dlopenHelper_RunningBoardServices(a1);
}

void gotLoadHelper_x20__OBJC_CLASS___NWActivityXPC(double a1)
{
  if (!atomic_load(&dlopenHelperFlag_SymptomAnalytics))
    dlopenHelper_SymptomAnalytics(a1);
}

double gotLoadHelper_x8__nwrapport_copy_protocol_definition(double result)
{
  if (!atomic_load(&dlopenHelperFlag_Rapport))
    return dlopenHelper_Rapport(result);
  return result;
}

double gotLoadHelper_x8__NEFlowDirectorCreateBridge(double result)
{
  if (!atomic_load(&dlopenHelperFlag_libnetworkextension_dylib))
    return dlopenHelper_libnetworkextension_dylib(result);
  return result;
}

void gotLoadHelper_x20__OBJC_CLASS___UMUserManager(double a1)
{
  if (!atomic_load((unsigned int *)&dlopenHelperFlag_UserManagement))
    dlopenHelper_UserManagement(a1);
}

double gotLoadHelper_x8__ne_filter_protocol_identifier(double result)
{
  if (!atomic_load(&dlopenHelperFlag_libnetworkextension_dylib))
    return dlopenHelper_libnetworkextension_dylib(result);
  return result;
}

void gotLoadHelper_x19__ne_filter_protocol_identifier(double a1)
{
  if (!atomic_load(&dlopenHelperFlag_libnetworkextension_dylib))
    dlopenHelper_libnetworkextension_dylib(a1);
}

void gotLoadHelper_x20__ne_filter_protocol_identifier(double a1)
{
  if (!atomic_load(&dlopenHelperFlag_libnetworkextension_dylib))
    dlopenHelper_libnetworkextension_dylib(a1);
}

