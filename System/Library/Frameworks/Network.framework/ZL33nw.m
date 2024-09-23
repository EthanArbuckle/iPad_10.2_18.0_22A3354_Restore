@implementation ZL33nw

char *___ZL33nw_masque_handle_connect_responseP9nw_masqueP20nw_protocol_metadata_block_invoke_156(char *result, char *__s1)
{
  char *v3;
  size_t v4;
  int v5;
  char *v6;
  NSObject *v7;
  os_log_type_t v8;
  const char *v9;
  char *backtrace_string;
  _BOOL4 v11;
  BOOL v12;
  char *v13;
  char v14;
  os_log_type_t type;
  uint8_t buf[4];
  const char *v17;
  __int16 v18;
  char *v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  if (!__s1)
    return result;
  v3 = result;
  *(_BYTE *)(*(_QWORD *)(*((_QWORD *)result + 4) + 8) + 24) = strstr(__s1, "expired routing") != 0;
  *(_BYTE *)(*(_QWORD *)(*((_QWORD *)v3 + 5) + 8) + 24) = strstr(__s1, "received-status=") != 0;
  if (!*((_QWORD *)v3 + 10))
  {
    __nwlog_obj();
    *(_DWORD *)buf = 136446210;
    v17 = "nw_masque_get_dns_failure_reason_from_proxy_status";
    v6 = (char *)_os_log_send_and_compose_impl();
    type = OS_LOG_TYPE_ERROR;
    v14 = 0;
    if (!__nwlog_fault(v6, &type, &v14))
      goto LABEL_25;
    if (type == OS_LOG_TYPE_FAULT)
    {
      v7 = __nwlog_obj();
      v8 = type;
      if (!os_log_type_enabled(v7, type))
        goto LABEL_25;
      *(_DWORD *)buf = 136446210;
      v17 = "nw_masque_get_dns_failure_reason_from_proxy_status";
      v9 = "%{public}s called with null masque";
    }
    else if (v14)
    {
      backtrace_string = (char *)__nw_create_backtrace_string();
      v7 = __nwlog_obj();
      v8 = type;
      v11 = os_log_type_enabled(v7, type);
      if (backtrace_string)
      {
        if (v11)
        {
          *(_DWORD *)buf = 136446466;
          v17 = "nw_masque_get_dns_failure_reason_from_proxy_status";
          v18 = 2082;
          v19 = backtrace_string;
          _os_log_impl(&dword_182FBE000, v7, v8, "%{public}s called with null masque, dumping backtrace:%{public}s", buf, 0x16u);
        }
        free(backtrace_string);
        goto LABEL_25;
      }
      if (!v11)
      {
LABEL_25:
        if (v6)
          free(v6);
        goto LABEL_27;
      }
      *(_DWORD *)buf = 136446210;
      v17 = "nw_masque_get_dns_failure_reason_from_proxy_status";
      v9 = "%{public}s called with null masque, no backtrace";
    }
    else
    {
      v7 = __nwlog_obj();
      v8 = type;
      if (!os_log_type_enabled(v7, type))
        goto LABEL_25;
      *(_DWORD *)buf = 136446210;
      v17 = "nw_masque_get_dns_failure_reason_from_proxy_status";
      v9 = "%{public}s called with null masque, backtrace limit exceeded";
    }
    _os_log_impl(&dword_182FBE000, v7, v8, v9, buf, 0xCu);
    goto LABEL_25;
  }
  v4 = strlen(__s1);
  if (!strnstr(__s1, "error=dns_error", v4))
  {
LABEL_27:
    v5 = 0;
    goto LABEL_28;
  }
  if (strnstr(__s1, "info-code=15", v4))
  {
    v5 = 1;
  }
  else if (strnstr(__s1, "info-code=16", v4))
  {
    v5 = 2;
  }
  else if (strnstr(__s1, "info-code=17", v4))
  {
    v5 = 3;
  }
  else
  {
    v5 = 0;
  }
LABEL_28:
  *(_DWORD *)(*(_QWORD *)(*((_QWORD *)v3 + 6) + 8) + 24) = v5;
  v12 = strstr(__s1, "error=dns_error") && !*(_DWORD *)(*(_QWORD *)(*((_QWORD *)v3 + 6) + 8) + 24)
     || strstr(__s1, "error=destination_ip_prohibited")
     || strstr(__s1, "error=destination_ip_unroutable")
     || strstr(__s1, "error=destination_not_found")
     || strstr(__s1, "error=destination_unavailable") != 0;
  *(_BYTE *)(*(_QWORD *)(*((_QWORD *)v3 + 7) + 8) + 24) = v12;
  *(_BYTE *)(*(_QWORD *)(*((_QWORD *)v3 + 8) + 8) + 24) = strstr(__s1, "error=resource_uses_reverse_proxy") != 0;
  result = strstr(__s1, "error=connection_refused");
  if (result)
  {
    v13 = v3 + 72;
  }
  else
  {
    result = strstr(__s1, "error=connection_timeout");
    if (!result)
      return result;
    result = (char *)nw_endpoint_get_type(*(nw_endpoint_t *)(*((_QWORD *)v3 + 10) + 312));
    v13 = v3 + 72;
    if ((_DWORD)result == 1)
      v13 = v3 + 56;
  }
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)v13 + 8) + 24) = 1;
  return result;
}

@end
