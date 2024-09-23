_QWORD *ldap_connection_create_with_hostname(const __CFString *a1, int a2)
{
  char *v3;
  _QWORD *result;
  int v5;
  char *v6;
  char __str[256];
  uint64_t v8;

  v8 = *MEMORY[0x24BDAC8D0];
  v6 = 0;
  _fill_cstring_from_cfstring(&v6, a1, 0);
  v3 = v6;
  snprintf(__str, 0x100uLL, "com.apple.AppleLDAP.%s.%hu", v6, a2);
  result = _ldap_connection_create(__str);
  result[33] = v3;
  *((_WORD *)result + 136) = a2;
  if (a2 == 636)
    v5 = 1026;
  else
    v5 = 1024;
  *((_DWORD *)result + 72) |= v5;
  return result;
}

char *_fill_cstring_from_cfstring(char **a1, const __CFString *a2, char **a3)
{
  char *result;
  const char *v6;
  char *v7;

  v7 = 0;
  result = _cstr_from_cfstring(a2, &v7);
  if (!result)
  {
    *a1 = 0;
    if (!a3)
      return result;
    goto LABEL_7;
  }
  v6 = result;
  result = v7;
  if (!v7)
    result = strdup(v6);
  *a1 = result;
  if (a3)
  {
    result = (char *)strlen(v6);
LABEL_7:
    *a3 = result;
  }
  return result;
}

_QWORD *_ldap_connection_create(const char *a1)
{
  _QWORD *v2;
  _QWORD *v3;
  char __str[128];
  uint64_t v6;

  v6 = *MEMORY[0x24BDAC8D0];
  v2 = ldap_connection_obj_alloc(312);
  if (!v2)
    _ldap_connection_create_cold_1();
  v3 = v2;
  snprintf(__str, 0x80uLL, "%s.state", a1);
  v3[1] = dispatch_queue_create(__str, 0);
  snprintf(__str, 0x80uLL, "%s.ops", a1);
  v3[8] = dispatch_queue_create(__str, 0);
  snprintf(__str, 0x80uLL, "%s.accessor", a1);
  v3[26] = dispatch_queue_create(__str, 0);
  snprintf(__str, 0x80uLL, "%s.delivery", a1);
  v3[3] = dispatch_queue_create(__str, 0);
  v3[4] = dispatch_group_create();
  *((_DWORD *)v3 + 72) = 0;
  *((_BYTE *)v3 + 305) = 1;
  v3[2] = dispatch_group_create();
  v3[7] = dispatch_group_create();
  v3[9] = 0;
  v3[10] = v3 + 9;
  v3[11] = 0;
  v3[28] = 0;
  v3[12] = v3 + 11;
  v3[29] = v3 + 28;
  v3[20] = 0;
  return v3;
}

_QWORD *ldap_connection_create_with_socket(int a1)
{
  _QWORD *v2;
  NSObject *v3;
  const char *v4;
  uint8_t *v5;
  uint32_t v6;
  char *v7;
  int v8;
  __int16 v9;
  socklen_t v11;
  uint8_t buf[4];
  _QWORD *v13;
  __int16 v14;
  int v15;
  __int16 v16;
  socklen_t v17;
  __int16 v18;
  sockaddr *v19;
  char __s1[4];
  _QWORD *v21;
  __int16 v22;
  int v23;
  char __str[256];
  sockaddr v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  uint64_t v33;

  v33 = *MEMORY[0x24BDAC8D0];
  v11 = 16;
  if (a1 == -1)
    return 0;
  v31 = 0u;
  v32 = 0u;
  v29 = 0u;
  v30 = 0u;
  v27 = 0u;
  v28 = 0u;
  v25 = (sockaddr)0;
  v26 = 0u;
  if (getpeername(a1, &v25, &v11))
  {
    snprintf(__str, 0x100uLL, "com.apple.AppleLDAP.sock#%d", a1);
    v2 = _ldap_connection_create(__str);
    *((_DWORD *)v2 + 69) = a1;
    *((_DWORD *)v2 + 72) |= 0x1000u;
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)__s1 = 134218240;
      v21 = v2;
      v22 = 1024;
      v23 = a1;
      v3 = MEMORY[0x24BDACB70];
      v4 = "connection: %p, socket: %d";
      v5 = (uint8_t *)__s1;
      v6 = 18;
LABEL_12:
      _os_log_impl(&dword_215173000, v3, OS_LOG_TYPE_INFO, v4, v5, v6);
      return v2;
    }
    return v2;
  }
  if (v25.sa_family != 30)
  {
    if (v25.sa_family == 2)
    {
      v7 = &v25.sa_data[2];
      v8 = 2;
      goto LABEL_10;
    }
    return 0;
  }
  v7 = &v25.sa_data[6];
  v8 = 30;
LABEL_10:
  inet_ntop(v8, v7, __s1, 0x2Eu);
  v9 = *(_WORD *)v25.sa_data;
  snprintf(__str, 0x100uLL, "com.apple.AppleLDAP.%s.%hu", __s1, *(unsigned __int16 *)v25.sa_data);
  v2 = _ldap_connection_create(__str);
  v2[33] = strdup(__s1);
  *((_WORD *)v2 + 136) = v9;
  *((_DWORD *)v2 + 69) = a1;
  *((_DWORD *)v2 + 72) |= 0x1000u;
  if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 134218754;
    v13 = v2;
    v14 = 1024;
    v15 = a1;
    v16 = 1040;
    v17 = v11;
    v18 = 2098;
    v19 = &v25;
    v3 = MEMORY[0x24BDACB70];
    v4 = "connection: %p, socket: %d, address: %{public,network:sockaddr}.*P";
    v5 = buf;
    v6 = 34;
    goto LABEL_12;
  }
  return v2;
}

_QWORD *ldap_connection_create_with_socket_and_hostname(int a1, const __CFString *a2)
{
  _QWORD *v3;
  char *v4;
  NSObject *v5;
  const char *v6;
  uint32_t v7;
  __int16 v8;
  char *v9;
  char *v11;
  socklen_t v12;
  uint8_t buf[4];
  _QWORD *v14;
  __int16 v15;
  int v16;
  __int16 v17;
  _BYTE v18[14];
  __int16 v19;
  char *v20;
  char __str[256];
  sockaddr v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  uint64_t v30;

  v30 = *MEMORY[0x24BDAC8D0];
  v12 = 16;
  if (a1 == -1)
    return 0;
  v28 = 0u;
  v29 = 0u;
  v26 = 0u;
  v27 = 0u;
  v24 = 0u;
  v25 = 0u;
  v22 = (sockaddr)0;
  v23 = 0u;
  v11 = 0;
  _fill_cstring_from_cfstring(&v11, a2, 0);
  if (getpeername(a1, &v22, &v12))
  {
    snprintf(__str, 0x100uLL, "com.apple.AppleLDAP.sock#%d", a1);
    v3 = _ldap_connection_create(__str);
    *((_DWORD *)v3 + 69) = a1;
    v4 = v11;
    v3[33] = v11;
    *((_DWORD *)v3 + 72) |= 0x1000u;
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 134218498;
      v14 = v3;
      v15 = 1024;
      v16 = a1;
      v17 = 2082;
      *(_QWORD *)v18 = v4;
      v5 = MEMORY[0x24BDACB70];
      v6 = "connection: %p, socket: %d, hostname: %{public}s";
      v7 = 28;
LABEL_9:
      _os_log_impl(&dword_215173000, v5, OS_LOG_TYPE_INFO, v6, buf, v7);
      return v3;
    }
    return v3;
  }
  if (v22.sa_family != 30 && v22.sa_family != 2)
    return 0;
  v8 = *(_WORD *)v22.sa_data;
  v9 = v11;
  snprintf(__str, 0x100uLL, "com.apple.AppleLDAP.%s.%hu", v11, *(unsigned __int16 *)v22.sa_data);
  v3 = _ldap_connection_create(__str);
  v3[33] = v9;
  *((_WORD *)v3 + 136) = v8;
  *((_DWORD *)v3 + 69) = a1;
  *((_DWORD *)v3 + 72) |= 0x1000u;
  if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 134219010;
    v14 = v3;
    v15 = 1024;
    v16 = a1;
    v17 = 1040;
    *(_DWORD *)v18 = v12;
    *(_WORD *)&v18[4] = 2098;
    *(_QWORD *)&v18[6] = &v22;
    v19 = 2082;
    v20 = v9;
    v5 = MEMORY[0x24BDACB70];
    v6 = "connection: %p, socket: %d, address: %{public,network:sockaddr}.*P, hostname: %{public}s";
    v7 = 44;
    goto LABEL_9;
  }
  return v3;
}

_QWORD *ldap_connection_create_with_url(const __CFURL *a1)
{
  CFStringRef v2;
  const __CFString *v3;
  SInt32 v4;
  unsigned __int16 v5;
  _QWORD *v6;
  unsigned __int16 v7;

  v2 = CFURLCopyScheme(a1);
  v3 = CFURLCopyHostName(a1);
  v4 = CFURLGetPortNumber(a1);
  if (CFEqual(v2, CFSTR("ldap")))
  {
    if (v4 == -1)
      v5 = 389;
    else
      v5 = v4;
    v6 = ldap_connection_create_with_hostname(v3, v5);
    if (!v3)
      goto LABEL_13;
    goto LABEL_12;
  }
  if (CFEqual(v2, CFSTR("ldaps")))
  {
    if (v4 == -1)
      v7 = 636;
    else
      v7 = v4;
    v6 = ldap_connection_create_with_hostname(v3, v7);
    *((_DWORD *)v6 + 72) |= 2u;
    if (!v3)
      goto LABEL_13;
    goto LABEL_12;
  }
  v6 = 0;
  if (v3)
LABEL_12:
    CFRelease(v3);
LABEL_13:
  if (v2)
    CFRelease(v2);
  return v6;
}

void ldap_connection_start(_QWORD *a1, int a2, uint64_t a3)
{
  NSObject *v6;
  uint64_t v7;
  NSObject *global_queue;
  NSObject *v9;
  NSObject *v10;
  _QWORD v11[6];
  _QWORD v12[6];
  int v13;
  _QWORD block[5];
  char v15;

  v6 = a1[1];
  v7 = MEMORY[0x24BDAC760];
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 0x40000000;
  block[2] = ___state_set_block_invoke;
  block[3] = &__block_descriptor_tmp_50;
  block[4] = a1;
  v15 = 2;
  dispatch_barrier_sync(v6, block);
  ldap_connection_retain(a1);
  if (a2)
  {
    global_queue = dispatch_get_global_queue(0, 0);
    v12[0] = v7;
    v12[1] = 0x40000000;
    v12[2] = __ldap_connection_start_block_invoke;
    v12[3] = &unk_24D2AF368;
    v13 = a2;
    v12[4] = a3;
    v12[5] = a1;
    dispatch_async(global_queue, v12);
  }
  else
  {
    v9 = a1[2];
    v10 = dispatch_get_global_queue(0, 0);
    v11[0] = v7;
    v11[1] = 0x40000000;
    v11[2] = __ldap_connection_start_block_invoke_2;
    v11[3] = &unk_24D2AF390;
    v11[4] = a3;
    v11[5] = a1;
    dispatch_group_notify(v9, v10, v11);
  }
}

void __ldap_connection_start_block_invoke(uint64_t a1)
{
  NSObject *v2;
  dispatch_time_t v3;
  intptr_t v4;
  uint64_t v5;
  uint64_t v6;

  v2 = *(NSObject **)(*(_QWORD *)(a1 + 40) + 16);
  v3 = dispatch_walltime(0, 1000000000 * *(int *)(a1 + 48));
  v4 = dispatch_group_wait(v2, v3);
  v5 = *(_QWORD *)(a1 + 40);
  if (v4)
    v6 = 3;
  else
    v6 = *(unsigned int *)(v5 + 292);
  _report_connect_status(v5, *(_QWORD *)(a1 + 32), v6);
  ldap_connection_release(*(id *)(a1 + 40));
}

void _report_connect_status(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  NSObject *v7;
  const void *v8;
  _QWORD v9[6];
  uint64_t v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t v13;

  v6 = 0;
  v10 = 0;
  v11 = &v10;
  v12 = 0x2000000000;
  v13 = 0;
  if (!(_DWORD)a3)
  {
    v7 = *(NSObject **)(a1 + 8);
    v9[0] = MEMORY[0x24BDAC760];
    v9[1] = 0x40000000;
    v9[2] = ___report_connect_status_block_invoke;
    v9[3] = &unk_24D2AFA48;
    v9[4] = &v10;
    v9[5] = a1;
    dispatch_sync(v7, v9);
    v6 = v11[3];
  }
  (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(a2 + 16))(a2, a1, v6, a3);
  v8 = (const void *)v11[3];
  if (v8)
  {
    CFRelease(v8);
    v11[3] = 0;
  }
  _Block_object_dispose(&v10, 8);
}

void __ldap_connection_start_block_invoke_2(uint64_t a1)
{
  _report_connect_status(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32), *(unsigned int *)(*(_QWORD *)(a1 + 40) + 292));
  ldap_connection_release(*(id *)(a1 + 40));
}

void ldap_connection_cancel_operations(dispatch_queue_t *context)
{
  dispatch_barrier_sync_f(context[8], context, (dispatch_function_t)_o_ldap_connection_cancel_all_operations);
}

void _o_ldap_connection_cancel_all_operations(uint64_t a1)
{
  uint64_t v2;
  unint64_t *v3;
  uint64_t v4;
  uint64_t v5;
  _QWORD *v6;
  unint64_t *v7;
  unint64_t v8;
  unint64_t v9;
  unint64_t v10;
  unint64_t v11;
  uint64_t v12;
  NSObject *v13;
  NSObject *v14;
  unint64_t v15;
  unint64_t *v16;
  unint64_t *v17;
  unint64_t v18;
  unint64_t v19;
  unint64_t *v20;
  _QWORD v21[6];

  dispatch_assert_queue_V2(*(dispatch_queue_t *)(a1 + 64));
  if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEBUG))
    _o_ldap_connection_cancel_all_operations_cold_1();
  v2 = *(_QWORD *)(a1 + 72);
  if (v2)
  {
    v3 = (unint64_t *)(a1 + 112);
    v4 = MEMORY[0x24BDAC760];
    do
    {
      v5 = *(_QWORD *)(v2 + 8);
      v6 = *(_QWORD **)(v2 + 16);
      if (v5)
      {
        *(_QWORD *)(v5 + 16) = v6;
        v6 = *(_QWORD **)(v2 + 16);
      }
      else
      {
        *(_QWORD *)(a1 + 80) = v6;
      }
      *v6 = v5;
      v7 = (unint64_t *)(v2 + 40);
      do
        v8 = __ldaxr(v7);
      while (__stlxr(v8 | 2, v7));
      do
        v9 = __ldaxr(v7);
      while (__stlxr(v9 & 0xFFFFFFFFFFFFFFF7, v7));
      do
        v10 = __ldaxr(v3);
      while (__stlxr(v10 - 1, v3));
      if ((*(_BYTE *)(v2 + 41) & 8) != 0)
        goto LABEL_16;
      do
        v11 = __ldaxr(v7);
      while (__stlxr(v11 | 1, v7));
      if ((v11 & 1) != 0)
      {
LABEL_16:
        ldap_operation_release((id)v2);
      }
      else
      {
        v12 = *(_QWORD *)(v2 + 32);
        ldap_operation_retain((id)v2);
        v13 = *(NSObject **)(v12 + 56);
        v14 = *(NSObject **)(v12 + 64);
        v21[0] = v4;
        v21[1] = 0x40000000;
        v21[2] = ___ldap_async_operation_block_invoke;
        v21[3] = &__block_descriptor_tmp_104;
        v21[4] = _o_abandon_operation;
        v21[5] = v2;
        dispatch_group_async(v13, v14, v21);
      }
      dispatch_group_leave(*(dispatch_group_t *)(a1 + 56));
      v2 = *(_QWORD *)(a1 + 72);
    }
    while (v2);
  }
  while (1)
  {
    v20 = *(unint64_t **)(a1 + 88);
    if (!v20)
      break;
    v15 = v20[1];
    v16 = (unint64_t *)v20[2];
    if (v15)
    {
      *(_QWORD *)(v15 + 16) = v16;
      v16 = (unint64_t *)v20[2];
    }
    else
    {
      *(_QWORD *)(a1 + 96) = v16;
    }
    *v16 = v15;
    v17 = v20 + 5;
    do
      v18 = __ldaxr(v17);
    while (__stlxr(v18 | 2, v17));
    do
      v19 = __ldaxr(v17);
    while (__stlxr(v19 & 0xFFFFFFFFFFFFFFF7, v17));
    dispatch_group_leave(*(dispatch_group_t *)(a1 + 56));
    ldap_operation_release(v20);
  }
}

void ldap_connection_disconnect(uint64_t a1)
{
  NSObject *v1;
  _QWORD v2[5];
  char v3;

  v1 = *(NSObject **)(a1 + 8);
  v2[0] = MEMORY[0x24BDAC760];
  v2[1] = 0x40000000;
  v2[2] = ___state_set_block_invoke;
  v2[3] = &__block_descriptor_tmp_50;
  v2[4] = a1;
  v3 = 8;
  dispatch_barrier_sync(v1, v2);
}

uint64_t ldap_connection_set_no_cellular(uint64_t a1, char a2)
{
  uint64_t result;
  unsigned int *v5;
  unsigned int v6;
  unsigned int v7;

  result = _ldap_validate_offline(a1);
  v5 = (unsigned int *)(a1 + 288);
  if ((a2 & 1) != 0)
  {
    do
      v6 = __ldaxr(v5);
    while (__stlxr(v6 | 0x200, v5));
  }
  else
  {
    do
      v7 = __ldaxr(v5);
    while (__stlxr(v7 & 0xFFFFFDFF, v5));
  }
  return result;
}

uint64_t _ldap_validate_offline(uint64_t result)
{
  uint64_t v1;
  int v2;
  uint8_t buf[4];
  uint64_t v4;
  __int16 v5;
  int v6;
  __int16 v7;
  int v8;
  uint64_t v9;

  v9 = *MEMORY[0x24BDAC8D0];
  if (*(_BYTE *)(result + 305) != 1)
  {
    v2 = *(char *)(result + 305);
    v1 = result;
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 134218496;
      v4 = v1;
      v5 = 1024;
      v6 = v2;
      v7 = 1024;
      v8 = 1;
      _os_log_error_impl(&dword_215173000, MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR, "connection: %p, invalid state: %{AppleLDAPTypes:state}hhd (expected %{AppleLDAPTypes:state}hhd)", buf, 0x18u);
    }
    __break(1u);
  }
  return result;
}

void ldap_connection_set_source_application_by_bundle(uint64_t a1, uint64_t a2)
{
  NSObject *v4;
  _QWORD v5[6];

  _ldap_validate_offline(a1);
  v4 = *(NSObject **)(a1 + 208);
  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 0x40000000;
  v5[2] = __ldap_connection_set_source_application_by_bundle_block_invoke;
  v5[3] = &__block_descriptor_tmp_29;
  v5[4] = a1;
  v5[5] = a2;
  dispatch_barrier_sync(v4, v5);
}

char *__ldap_connection_set_source_application_by_bundle_block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  char *result;

  v2 = *(_QWORD *)(a1 + 32);
  v3 = *(void **)(v2 + 40);
  if (v3)
  {
    free(v3);
    *(_QWORD *)(*(_QWORD *)(a1 + 32) + 40) = 0;
    v2 = *(_QWORD *)(a1 + 32);
  }
  result = strdup(*(const char **)(a1 + 40));
  *(_QWORD *)(v2 + 40) = result;
  return result;
}

void ldap_connection_set_account_identifier(uint64_t a1, uint64_t a2)
{
  NSObject *v4;
  _QWORD v5[6];

  _ldap_validate_offline(a1);
  v4 = *(NSObject **)(a1 + 208);
  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 0x40000000;
  v5[2] = __ldap_connection_set_account_identifier_block_invoke;
  v5[3] = &__block_descriptor_tmp_30;
  v5[4] = a1;
  v5[5] = a2;
  dispatch_barrier_sync(v4, v5);
}

char *__ldap_connection_set_account_identifier_block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  char *result;

  v2 = *(_QWORD *)(a1 + 32);
  v3 = *(void **)(v2 + 48);
  if (v3)
  {
    free(v3);
    *(_QWORD *)(*(_QWORD *)(a1 + 32) + 48) = 0;
    v2 = *(_QWORD *)(a1 + 32);
  }
  result = strdup(*(const char **)(a1 + 40));
  *(_QWORD *)(v2 + 48) = result;
  return result;
}

void ldap_connection_set_tls(uint64_t a1, int a2, const void *a3)
{
  unsigned int *v6;
  unsigned int v7;
  int v8;
  unsigned int *v9;
  unsigned int v10;
  const void *v11;
  const void *v12;
  NSObject *v13;
  _QWORD block[5];

  _ldap_validate_offline(a1);
  if (a2)
  {
    v6 = (unsigned int *)(a1 + 288);
    do
      v7 = __ldaxr(v6);
    while (__stlxr(v7 | 1, v6));
    v8 = (v7 & 1) == 0;
    if (!a3)
      goto LABEL_13;
LABEL_11:
    v11 = *(const void **)(a1 + 256);
    if (v11)
    {
      if (CFEqual(v11, a3))
        goto LABEL_13;
      v12 = *(const void **)(a1 + 256);
      if (v12)
      {
        CFRelease(v12);
        *(_QWORD *)(a1 + 256) = 0;
      }
    }
    *(_QWORD *)(a1 + 256) = CFRetain(a3);
    goto LABEL_18;
  }
  if (a3)
    _os_assumes_log();
  v9 = (unsigned int *)(a1 + 288);
  do
    v10 = __ldaxr(v9);
  while (__stlxr(v10 & 0xFFFFFFFE, v9));
  v8 = v10 & 1;
  if (a3)
    goto LABEL_11;
LABEL_13:
  if (v8)
  {
LABEL_18:
    v13 = *(NSObject **)(a1 + 208);
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 0x40000000;
    block[2] = __ldap_connection_set_tls_block_invoke;
    block[3] = &__block_descriptor_tmp_31;
    block[4] = a1;
    dispatch_barrier_sync(v13, block);
  }
}

_DWORD *__ldap_connection_set_tls_block_invoke(uint64_t a1)
{
  return _a_clear_failed_hosts(*(_QWORD *)(a1 + 32), 10003);
}

_DWORD *_a_clear_failed_hosts(uint64_t a1, int a2)
{
  _DWORD *result;
  uint64_t v5;
  _QWORD *v6;

  dispatch_assert_queue_V2(*(dispatch_queue_t *)(a1 + 208));
  result = *(_DWORD **)(a1 + 224);
  if (result)
  {
    do
    {
      v5 = *(_QWORD *)result;
      if (result[11] == a2)
      {
        v6 = (_QWORD *)*((_QWORD *)result + 1);
        if (v5)
        {
          *(_QWORD *)(v5 + 8) = v6;
          v6 = (_QWORD *)*((_QWORD *)result + 1);
        }
        else
        {
          *(_QWORD *)(a1 + 232) = v6;
        }
        *v6 = v5;
        free(result);
      }
      result = (_DWORD *)v5;
    }
    while (v5);
  }
  return result;
}

void ldap_connection_add_credential(uint64_t a1, const void *a2, const __CFDictionary *a3)
{
  const void *Value;
  const void *v7;
  BOOL v8;
  NSObject *v9;
  uint64_t v10;
  unsigned int *v11;
  unsigned int v12;
  NSObject *v13;
  _QWORD v14[5];
  _QWORD block[7];

  _ldap_validate_offline(a1);
  if ((CFEqual(a2, CFSTR("simple")) == 1 || CFEqual(a2, CFSTR("CRAM-MD5")) == 1
                                          || CFEqual(a2, CFSTR("DIGEST-MD5")) == 1)
    && ((Value = CFDictionaryGetValue(a3, (const void *)LDAP_MECHANISM_OPTION_RECORD_DN),
         v7 = CFDictionaryGetValue(a3, (const void *)LDAP_MECHANISM_OPTION_PASSWORD),
         Value)
      ? (v8 = v7 == 0)
      : (v8 = 1),
        v8))
  {
    _os_assumes_log();
  }
  else
  {
    v9 = *(NSObject **)(a1 + 208);
    v10 = MEMORY[0x24BDAC760];
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 0x40000000;
    block[2] = __ldap_connection_add_credential_block_invoke;
    block[3] = &__block_descriptor_tmp_32;
    block[4] = a1;
    block[5] = a2;
    block[6] = a3;
    dispatch_barrier_sync(v9, block);
    v11 = (unsigned int *)(a1 + 288);
    do
      v12 = __ldaxr(v11);
    while (__stlxr(v12 | 4, v11));
    v13 = *(NSObject **)(a1 + 208);
    v14[0] = v10;
    v14[1] = 0x40000000;
    v14[2] = __ldap_connection_add_credential_block_invoke_2;
    v14[3] = &__block_descriptor_tmp_33;
    v14[4] = a1;
    dispatch_barrier_sync(v13, v14);
  }
}

void __ldap_connection_add_credential_block_invoke(uint64_t a1)
{
  __CFDictionary *v2;

  v2 = *(__CFDictionary **)(*(_QWORD *)(a1 + 32) + 248);
  if (!v2)
  {
    *(_QWORD *)(*(_QWORD *)(a1 + 32) + 248) = CFDictionaryCreateMutable((CFAllocatorRef)*MEMORY[0x24BDBD240], 0, MEMORY[0x24BDBD6A0], MEMORY[0x24BDBD6B0]);
    v2 = *(__CFDictionary **)(*(_QWORD *)(a1 + 32) + 248);
  }
  CFDictionarySetValue(v2, *(const void **)(a1 + 40), *(const void **)(a1 + 48));
}

_DWORD *__ldap_connection_add_credential_block_invoke_2(uint64_t a1)
{
  return _a_clear_failed_hosts(*(_QWORD *)(a1 + 32), 49);
}

void *ldap_connection_set_disconnect_handler(uint64_t a1, const void *a2)
{
  const void *v4;
  void *result;

  _ldap_validate_offline(a1);
  v4 = *(const void **)(a1 + 280);
  if (v4)
  {
    _Block_release(v4);
    *(_QWORD *)(a1 + 280) = 0;
  }
  result = _Block_copy(a2);
  *(_QWORD *)(a1 + 280) = result;
  return result;
}

_QWORD *ldap_connection_retrieve_record(_DWORD *a1, int a2, const __CFString *a3, const __CFArray *a4, uint64_t a5)
{
  _QWORD *v5;
  int v6;
  char *v12;
  _QWORD v14[6];
  _QWORD v15[5];
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  uint64_t v20;
  char *v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  _QWORD v25[4];

  v5 = 0;
  v25[0] = 0;
  v25[1] = v25;
  v25[2] = 0x2000000000;
  v25[3] = 0;
  v6 = a1[72];
  if ((v6 & 0x100) == 0 && (v6 & 0xC0) != 0)
  {
    v17 = 0u;
    v18 = 0u;
    v23 = 0u;
    v24 = 0u;
    v22 = 0u;
    v19 = 0u;
    v16 = 0u;
    DWORD2(v16) = 4;
    LODWORD(v18) = 0;
    DWORD2(v18) = 1;
    DWORD2(v19) = 8;
    v20 = 11;
    v21 = strdup("objectClass");
    _ldap_set_attributes((uint64_t)&v16, a4);
    _fill_cstring_from_cfstring((char **)&v17 + 1, a3, (char **)&v17);
    v15[0] = MEMORY[0x24BDAC760];
    v15[1] = 0x40000000;
    v15[2] = __ldap_connection_retrieve_record_block_invoke;
    v15[3] = &unk_24D2AF458;
    v15[4] = v25;
    v14[0] = MEMORY[0x24BDAC760];
    v14[1] = 0x40000000;
    v14[2] = __ldap_connection_retrieve_record_block_invoke_2;
    v14[3] = &unk_24D2AF480;
    v14[4] = a5;
    v14[5] = v25;
    v12 = (char *)_ldap_operation_query_create(a1, &v16, a2, v15, v14);
    free_LDAPMessage();
    v5 = _enqueue_operation((uint64_t)a1, v12);
  }
  _Block_object_dispose(v25, 8);
  return v5;
}

uint64_t _ldap_set_attributes(uint64_t result, CFArrayRef theArray)
{
  uint64_t v2;
  uint64_t v4;
  char **v5;
  CFIndex v6;
  char **v7;
  const __CFString *ValueAtIndex;

  v2 = result;
  if (!theArray)
  {
    LODWORD(v4) = 0;
    goto LABEL_7;
  }
  result = CFArrayGetCount(theArray);
  v4 = result;
  if (result < 1)
  {
LABEL_7:
    v5 = 0;
    goto LABEL_8;
  }
  v5 = (char **)malloc_type_calloc(result, 0x10uLL, 0x108004057E67DB5uLL);
  v6 = 0;
  v7 = v5;
  do
  {
    ValueAtIndex = (const __CFString *)CFArrayGetValueAtIndex(theArray, v6);
    result = (uint64_t)_fill_cstring_from_cfstring(v7 + 1, ValueAtIndex, v7);
    ++v6;
    v7 += 2;
  }
  while (v4 != v6);
LABEL_8:
  *(_QWORD *)(v2 + 112) = v5;
  *(_DWORD *)(v2 + 104) = v4;
  return result;
}

uint64_t _ldap_operation_query_create(void *a1, _DWORD *a2, int a3, const void *a4, const void *a5)
{
  _QWORD *v8;
  uint64_t v9;

  v8 = _ldap_base_operation_create(a1, 144, 1024, (uint64_t)_dispose_query, a5);
  v9 = (uint64_t)v8;
  if (v8)
  {
    if (_ldap_operation_simple_init((uint64_t)v8, a2))
    {
      if (a4)
        *(_QWORD *)(v9 + 104) = _Block_copy(a4);
      if (a3)
        _start_query_timer(v9, a3);
    }
    else
    {
      return 0;
    }
  }
  return v9;
}

CFTypeRef __ldap_connection_retrieve_record_block_invoke(uint64_t a1, int a2, CFTypeRef cf)
{
  CFTypeRef result;

  result = CFRetain(cf);
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = cf;
  return result;
}

void __ldap_connection_retrieve_record_block_invoke_2(uint64_t a1)
{
  const void *v2;

  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  v2 = *(const void **)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24);
  if (v2)
  {
    CFRelease(v2);
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = 0;
  }
}

_QWORD *_enqueue_operation(uint64_t a1, char *a2)
{
  _QWORD *v2;
  unint64_t *v4;
  unint64_t v5;
  unint64_t v6;
  uint64_t v7;
  NSObject *v8;
  NSObject *v9;
  _QWORD v11[6];

  v2 = a2;
  if (a2)
  {
    v4 = (unint64_t *)(a2 + 40);
    do
      v5 = __ldaxr(v4);
    while (__stlxr(v5 | 8, v4));
    if ((v5 & 8) != 0)
    {
      ldap_operation_release(a2);
      return 0;
    }
    else
    {
      do
        v6 = __ldaxr(v4);
      while (__stlxr(v6 & 0xFFFFFFFFFFFFFFFDLL, v4));
      ldap_operation_retain(a2);
      dispatch_group_enter(*(dispatch_group_t *)(a1 + 56));
      v2[6] = voucher_copy();
      v7 = v2[4];
      ldap_operation_retain(v2);
      v8 = *(NSObject **)(v7 + 56);
      v9 = *(NSObject **)(v7 + 64);
      v11[0] = MEMORY[0x24BDAC760];
      v11[1] = 0x40000000;
      v11[2] = ___ldap_async_operation_block_invoke;
      v11[3] = &__block_descriptor_tmp_104;
      v11[4] = _o_ldap_queue_operation;
      v11[5] = v2;
      dispatch_group_async(v8, v9, v11);
    }
  }
  return v2;
}

_QWORD *ldap_connection_query_create(void *a1, int a2, unsigned int a3, const __CFString *a4, const __CFString *a5, const __CFArray *a6, unsigned int a7, int a8, const void *a9, const void *a10)
{
  int v14;
  void *v15;
  const void *v16;
  const void *v17;
  const __CFString *v18;
  _QWORD *v20;
  _QWORD *v21;
  char *v22;
  size_t v23;
  void *v24;
  char *v25;
  char *v26;
  int v27;
  uint64_t started;
  char *v29;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  _BYTE v35[64];
  __int128 v36;
  char *v37[4];

  v14 = a2;
  v15 = a1;
  v17 = a9;
  v16 = a10;
  v32 = 0u;
  v33 = 0u;
  v34 = 0u;
  *(_OWORD *)v35 = 0u;
  if (a5)
    v18 = a5;
  else
    v18 = CFSTR("(objectClass=*)");
  memset(&v35[16], 0, 48);
  v36 = 0uLL;
  DWORD2(v32) = 4;
  if (a8)
  {
    v20 = malloc_type_calloc(1uLL, 0x10uLL, 0x1020040D5A9D86FuLL);
    v21 = malloc_type_calloc(1uLL, 0x20uLL, 0x10B0040CF0EF425uLL);
    v37[1] = 0;
    v37[2] = 0;
    v37[0] = (char *)a7;
    v21[2] = 0;
    v22 = strdup("1.2.840.113556.1.4.319");
    *v21 = 22;
    v21[1] = v22;
    v21[3] = malloc_type_calloc(1uLL, 0x10uLL, 0x108004057E67DB5uLL);
    v23 = length_PagedSearchControlValue();
    v24 = malloc_type_malloc(v23, 0x7E39E098uLL);
    *(_QWORD *)(v21[3] + 8) = v24;
    if (v24 && encode_PagedSearchControlValue())
    {
      free(*(void **)(v21[3] + 8));
      *(_QWORD *)(v21[3] + 8) = 0;
    }
    a7 = 0;
    *(_DWORD *)v20 = 1;
    v20[1] = v21;
    *((_QWORD *)&v36 + 1) = v20;
    v14 = a2;
    v16 = a10;
    v17 = a9;
    v15 = a1;
  }
  v37[0] = 0;
  *(_QWORD *)&v34 = a3;
  *(_DWORD *)v35 = 0;
  *((_QWORD *)&v34 + 1) = a7;
  _fill_cstring_from_cfstring((char **)&v33 + 1, a4, (char **)&v33);
  _ldap_set_attributes((uint64_t)&v32, a6);
  v25 = _cstr_from_cfstring(v18, v37);
  memset(&v35[8], 0, 48);
  v26 = v25;
  while (1)
  {
    v27 = *v26;
    if (v27 > 39)
    {
      if (v27 == 40)
      {
        started = _start_filter((int *)&v35[8], v26 + 1);
LABEL_18:
        v26 = (char *)started;
        goto LABEL_19;
      }
      if (v27 == 41)
        goto LABEL_20;
LABEL_17:
      started = _parse_simple_filter((uint64_t)&v35[8], v26, 0);
      goto LABEL_18;
    }
    if (v27 != 32)
      break;
LABEL_19:
    if (!++v26)
    {
LABEL_20:
      free_Filter();
      goto LABEL_21;
    }
  }
  if (*v26)
    goto LABEL_17;
  if (*(_DWORD *)&v35[8])
  {
    v29 = (char *)_ldap_operation_query_create(v15, &v32, v14, v17, v16);
    goto LABEL_24;
  }
LABEL_21:
  if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
    ldap_connection_query_create_cold_1();
  v29 = 0;
LABEL_24:
  free_LDAPMessage();
  if (v37[0])
    free(v37[0]);
  return _enqueue_operation((uint64_t)v15, v29);
}

char *_cstr_from_cfstring(const __CFString *a1, char **a2)
{
  char *CStringPtr;
  CFIndex Length;
  CFIndex v6;
  char *v7;

  *a2 = 0;
  if (!a1)
    return 0;
  CStringPtr = (char *)CFStringGetCStringPtr(a1, 0x8000100u);
  if (!CStringPtr)
  {
    Length = CFStringGetLength(a1);
    v6 = CFStringGetMaximumSizeForEncoding(Length, 0x8000100u) + 1;
    v7 = (char *)malloc_type_malloc(v6, 0x607FD51BuLL);
    if (!v7)
      _ldap_connection_create_cold_1();
    CStringPtr = v7;
    if (!CFStringGetCString(a1, v7, v6, 0x8000100u))
    {
      free(CStringPtr);
      CStringPtr = 0;
    }
    *a2 = CStringPtr;
  }
  return CStringPtr;
}

uint64_t ldap_operation_query_remaining(uint64_t a1)
{
  if ((*(_BYTE *)(a1 + 41) & 4) != 0)
    return *(unsigned int *)(a1 + 140);
  else
    return 0;
}

uint64_t ldap_operation_query_page(uint64_t a1, int a2)
{
  uint64_t v2;
  unint64_t *v3;
  uint64_t v4;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  size_t v10;
  void *v11;
  void *v12;
  void *v13;
  size_t v14;
  void *v15;
  unint64_t v16;

  v3 = (unint64_t *)(a1 + 40);
  v2 = *(_QWORD *)(a1 + 40);
  v4 = 10013;
  if ((v2 & 0x400) != 0 && (*(_QWORD *)(a1 + 40) & 5) != 1)
  {
    if (*(_QWORD *)(a1 + 120))
    {
      if ((v2 & 8) != 0)
      {
        return 10011;
      }
      else
      {
        v7 = *(_QWORD *)(a1 + 32);
        if (decode_LDAPMessage())
        {
          return 10013;
        }
        else
        {
          if (MEMORY[0]
            && (v8 = MEMORY[8], !strncmp(*(const char **)(MEMORY[8] + 8), "1.2.840.113556.1.4.319", MEMORY[0])))
          {
            v9 = *(void **)(*(_QWORD *)(v8 + 24) + 8);
            if (v9)
            {
              free(v9);
              *(_QWORD *)(*(_QWORD *)(MEMORY[8] + 24) + 8) = 0;
            }
            v10 = length_PagedSearchControlValue();
            v11 = malloc_type_malloc(v10, 0xE157F318uLL);
            *(_QWORD *)(*(_QWORD *)(MEMORY[8] + 24) + 8) = v11;
            if (v11 && encode_PagedSearchControlValue())
            {
              free(*(void **)(*(_QWORD *)(MEMORY[8] + 24) + 8));
              *(_QWORD *)(*(_QWORD *)(MEMORY[8] + 24) + 8) = 0;
            }
            v12 = *(void **)(a1 + 120);
            if (v12)
            {
              free(v12);
              *(_QWORD *)(a1 + 120) = 0;
            }
            *(_DWORD *)(a1 + 80) = _ldap_connection_next_messageID(v7);
            v13 = *(void **)(a1 + 88);
            if (v13)
            {
              free(v13);
              *(_QWORD *)(a1 + 88) = 0;
            }
            v14 = length_LDAPMessage();
            v15 = malloc_type_malloc(v14, 0x1C3068C1uLL);
            *(_QWORD *)(a1 + 88) = v15;
            if (v15 && encode_LDAPMessage())
            {
              free(*(void **)(a1 + 88));
              *(_QWORD *)(a1 + 88) = 0;
            }
            do
              v16 = __ldaxr(v3);
            while (__stlxr(v16 & 0xFFFFFFFFFFFFFFFALL, v3));
            if (a2)
              _start_query_timer(a1, a2);
            if (_enqueue_operation(v7, (char *)a1))
              v4 = 0;
            else
              v4 = 10013;
          }
          else
          {
            v4 = 10013;
          }
          free_LDAPMessage();
        }
      }
    }
    else
    {
      return 10012;
    }
  }
  return v4;
}

uint64_t _ldap_connection_next_messageID(uint64_t a1)
{
  NSObject *v1;
  uint64_t v2;
  _QWORD v4[6];
  uint64_t v5;
  uint64_t *v6;
  uint64_t v7;
  int v8;

  v5 = 0;
  v6 = &v5;
  v7 = 0x2000000000;
  v8 = 0;
  v1 = *(NSObject **)(a1 + 208);
  v4[0] = MEMORY[0x24BDAC760];
  v4[1] = 0x40000000;
  v4[2] = ___ldap_connection_next_messageID_block_invoke;
  v4[3] = &unk_24D2AFAB0;
  v4[4] = &v5;
  v4[5] = a1;
  dispatch_sync(v1, v4);
  v2 = *((unsigned int *)v6 + 6);
  _Block_object_dispose(&v5, 8);
  return v2;
}

void _start_query_timer(uint64_t a1, int a2)
{
  uint64_t v4;
  NSObject *v5;
  NSObject *v6;
  dispatch_time_t v7;
  NSObject *v8;
  _QWORD v9[6];

  v4 = *(_QWORD *)(a1 + 32);
  v5 = *(NSObject **)(a1 + 112);
  if (!v5)
  {
    v6 = dispatch_source_create(MEMORY[0x24BDACA18], 0, 0, *(dispatch_queue_t *)(v4 + 64));
    *(_QWORD *)(a1 + 112) = v6;
    if (v6)
      goto LABEL_3;
LABEL_6:
    _os_assumes_log();
    return;
  }
  dispatch_suspend(v5);
  v6 = *(NSObject **)(a1 + 112);
  if (!v6)
    goto LABEL_6;
LABEL_3:
  v7 = dispatch_walltime(0, 1000000000 * a2);
  dispatch_source_set_timer(v6, v7, 0xFFFFFFFFFFFFFFFFLL, 0x3B9ACA00uLL);
  dispatch_set_context(*(dispatch_object_t *)(a1 + 112), (void *)a1);
  v8 = *(NSObject **)(a1 + 112);
  v9[0] = MEMORY[0x24BDAC760];
  v9[1] = 0x40000000;
  v9[2] = ___start_query_timer_block_invoke;
  v9[3] = &__block_descriptor_tmp_107;
  v9[4] = v4;
  v9[5] = a1;
  dispatch_source_set_event_handler(v8, v9);
  dispatch_resume(*(dispatch_object_t *)(a1 + 112));
}

_QWORD *ldap_connection_read_rootdse(_DWORD *a1, int a2, const __CFArray *a3, uint64_t a4)
{
  return ldap_connection_retrieve_record(a1, a2, &stru_24D2B1360, a3, a4);
}

BOOL ldap_connection_has_confidentiality(uint64_t a1)
{
  return (*(_WORD *)(a1 + 288) & 0x4023) != 0;
}

void ldap_operation_cancel(unint64_t *context)
{
  unint64_t v1;
  unint64_t *v2;
  unint64_t v3;

  v1 = context[4];
  v2 = context + 5;
  do
    v3 = __ldaxr(v2);
  while (__stlxr(v3 | 2, v2));
  if ((v3 & 2) == 0)
    dispatch_barrier_sync_f(*(dispatch_queue_t *)(v1 + 64), context, (dispatch_function_t)_o_ldap_operation_cancel_internal);
}

void _o_ldap_operation_cancel_internal(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  _QWORD *v6;
  uint64_t v7;
  _QWORD *v8;
  unint64_t *v9;
  unint64_t v10;
  unint64_t v11;
  unint64_t *v12;
  unint64_t v13;
  unint64_t *v14;
  unint64_t v15;

  v2 = *(_QWORD *)(a1 + 32);
  dispatch_assert_queue_V2(*(dispatch_queue_t *)(v2 + 64));
  v3 = *(_QWORD *)(v2 + 72);
  if (v3)
  {
    while (v3 != a1)
    {
      v3 = *(_QWORD *)(v3 + 8);
      if (!v3)
        goto LABEL_4;
    }
    v5 = *(_QWORD *)(a1 + 8);
    v6 = *(_QWORD **)(a1 + 16);
    if (v5)
    {
      *(_QWORD *)(v5 + 16) = v6;
      v6 = *(_QWORD **)(a1 + 16);
    }
    else
    {
      *(_QWORD *)(v2 + 80) = v6;
    }
    *v6 = v5;
    v9 = (unint64_t *)(a1 + 40);
    do
      v10 = __ldaxr(v9);
    while (__stlxr(v10 & 0xFFFFFFFFFFFFFFF7, v9));
    if ((*(_BYTE *)(a1 + 41) & 8) == 0)
    {
      do
        v11 = __ldaxr(v9);
      while (__stlxr(v11 | 1, v9));
      if ((v11 & 1) == 0)
      {
        if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEBUG))
          _o_ldap_operation_cancel_internal_cold_1();
        dispatch_barrier_sync_f(*(dispatch_queue_t *)(v2 + 64), (void *)a1, (dispatch_function_t)_o_abandon_operation);
      }
    }
    v12 = (unint64_t *)(v2 + 112);
    do
      v13 = __ldaxr(v12);
    while (__stlxr(v13 - 1, v12));
    dispatch_group_leave(*(dispatch_group_t *)(v2 + 56));
    ldap_operation_release((id)a1);
  }
  else
  {
LABEL_4:
    v4 = *(_QWORD *)(v2 + 88);
    if (v4)
    {
      while (v4 != a1)
      {
        v4 = *(_QWORD *)(v4 + 8);
        if (!v4)
          return;
      }
      v7 = *(_QWORD *)(a1 + 8);
      v8 = *(_QWORD **)(a1 + 16);
      if (v7)
      {
        *(_QWORD *)(v7 + 16) = v8;
        v8 = *(_QWORD **)(a1 + 16);
      }
      else
      {
        *(_QWORD *)(v2 + 96) = v8;
      }
      *v8 = v7;
      v14 = (unint64_t *)(a1 + 40);
      do
        v15 = __ldaxr(v14);
      while (__stlxr(v15 & 0xFFFFFFFFFFFFFFF7, v14));
      dispatch_group_leave(*(dispatch_group_t *)(*(_QWORD *)(a1 + 32) + 56));
      ldap_operation_release((id)a1);
    }
  }
}

void ldap_connection_dispose(gss_ctx_id_t *context_handle)
{
  SSLContext *v2;
  gss_ctx_id_t v3;
  NSObject *v4;
  NSObject *v5;
  NSObject *v6;
  NSObject *v7;
  NSObject *v8;
  NSObject *v9;
  NSObject *v10;
  gss_ctx_id_t v11;
  gss_ctx_id_t v12;
  gss_ctx_id_t v13;
  gss_ctx_id_t v14;
  gss_ctx_id_t v15;
  NSObject *v16;
  NSObject *v17;
  NSObject *v18;
  uint64_t v19;
  gss_ctx_id_t_desc_struct *v20;
  gss_ctx_id_t v21;
  gss_ctx_id_t *v22;
  gss_ctx_id_t v23;
  gss_ctx_id_t v24;
  gss_ctx_id_t v25;
  int v26;
  gss_ctx_id_t v27;
  gss_ctx_id_t v28;
  gss_ctx_id_t v29;
  int v30;
  OM_uint32 minor_status;

  v2 = context_handle[16];
  if (v2)
  {
    SSLClose(v2);
    v3 = context_handle[16];
    if (v3)
    {
      CFRelease(v3);
      context_handle[16] = 0;
    }
  }
  if (context_handle[15])
  {
    tcp_connection_cancel();
    if (context_handle[15])
    {
      tcp_connection_release();
      context_handle[15] = 0;
    }
  }
  v4 = context_handle[1];
  if (v4)
  {
    dispatch_release(v4);
    context_handle[1] = 0;
  }
  v5 = context_handle[2];
  if (v5)
  {
    dispatch_release(v5);
    context_handle[2] = 0;
  }
  v6 = context_handle[3];
  if (v6)
  {
    dispatch_release(v6);
    context_handle[3] = 0;
  }
  v7 = context_handle[4];
  if (v7)
  {
    dispatch_release(v7);
    context_handle[4] = 0;
  }
  v8 = context_handle[7];
  if (v8)
  {
    dispatch_release(v8);
    context_handle[7] = 0;
  }
  v9 = context_handle[8];
  if (v9)
  {
    dispatch_release(v9);
    context_handle[8] = 0;
  }
  v10 = context_handle[13];
  if (v10)
  {
    dispatch_release(v10);
    context_handle[13] = 0;
  }
  v11 = context_handle[6];
  if (v11)
  {
    free(v11);
    context_handle[6] = 0;
  }
  v12 = context_handle[5];
  if (v12)
  {
    free(v12);
    context_handle[5] = 0;
  }
  v13 = context_handle[17];
  if (v13)
  {
    free(v13);
    context_handle[17] = 0;
  }
  v14 = context_handle[19];
  if (v14)
  {
    CFRelease(v14);
    context_handle[19] = 0;
  }
  v15 = context_handle[35];
  if (v15)
  {
    _Block_release(v15);
    context_handle[35] = 0;
  }
  v16 = context_handle[22];
  if (v16)
  {
    dispatch_release(v16);
    context_handle[22] = 0;
  }
  minor_status = 0;
  if (context_handle[23])
  {
    gss_delete_sec_context(&minor_status, context_handle + 23, 0);
    context_handle[23] = 0;
  }
  v17 = context_handle[26];
  if (v17)
  {
    dispatch_release(v17);
    context_handle[26] = 0;
  }
  v18 = context_handle[27];
  if (v18)
  {
    dispatch_release(v18);
    context_handle[27] = 0;
  }
  while (1)
  {
    v21 = context_handle[28];
    if (!v21)
      break;
    v19 = *(_QWORD *)v21;
    v20 = (gss_ctx_id_t_desc_struct *)*((_QWORD *)v21 + 1);
    if (*(_QWORD *)v21)
    {
      *(_QWORD *)(v19 + 8) = v20;
      v20 = (gss_ctx_id_t_desc_struct *)*((_QWORD *)v21 + 1);
    }
    else
    {
      context_handle[29] = v20;
    }
    *(_QWORD *)v20 = v19;
    free(v21);
  }
  while (1)
  {
    v22 = (gss_ctx_id_t *)context_handle[20];
    if (!v22)
      break;
    context_handle[20] = *v22;
    free(v22);
  }
  v23 = context_handle[31];
  if (v23)
  {
    CFRelease(v23);
    context_handle[31] = 0;
  }
  v24 = context_handle[32];
  if (v24)
  {
    CFRelease(v24);
    context_handle[32] = 0;
  }
  v25 = context_handle[37];
  if (v25)
  {
    CFRelease(v25);
    context_handle[37] = 0;
  }
  v26 = *((_DWORD *)context_handle + 72);
  if ((v26 & 0x400) != 0 || (v26 & 0x4000) != 0 || (v26 & 0x800) != 0)
  {
    v28 = context_handle[33];
    if (!v28)
      return;
    free(v28);
    goto LABEL_62;
  }
  if ((v26 & 0x1000) != 0)
  {
    v29 = context_handle[33];
    if (v29)
    {
      free(v29);
      context_handle[33] = 0;
    }
    v30 = *((_DWORD *)context_handle + 69);
    if (v30 != -1)
      close(v30);
  }
  else if ((v26 & 0x2000) != 0)
  {
    v27 = context_handle[33];
    if (v27)
    {
      CFRelease(v27);
LABEL_62:
      context_handle[33] = 0;
    }
  }
}

void ldap_operation_dispose(uint64_t a1)
{
  void *v2;
  const void *v3;
  void (*v4)(uint64_t);
  const void *v5;

  v2 = *(void **)(a1 + 32);
  if (v2)
  {
    ldap_connection_release(v2);
    *(_QWORD *)(a1 + 32) = 0;
  }
  v3 = *(const void **)(a1 + 24);
  if (v3)
  {
    _Block_release(v3);
    *(_QWORD *)(a1 + 24) = 0;
  }
  v4 = *(void (**)(uint64_t))(a1 + 72);
  if (v4)
    v4(a1);
  os_release(*(void **)(a1 + 48));
  *(_QWORD *)(a1 + 48) = 0;
  v5 = *(const void **)(a1 + 64);
  if (v5)
  {
    CFRelease(v5);
    *(_QWORD *)(a1 + 64) = 0;
  }
}

const void *ldap_connection_copy_error_string(uint64_t a1)
{
  const void *result;

  result = *(const void **)(a1 + 296);
  if (result)
  {
    CFRetain(result);
    return *(const void **)(a1 + 296);
  }
  return result;
}

const void *ldap_operation_copy_error_string(uint64_t a1)
{
  const void *result;

  result = *(const void **)(a1 + 64);
  if (result)
  {
    CFRetain(result);
    return *(const void **)(a1 + 64);
  }
  return result;
}

void ___state_set_block_invoke(uint64_t a1)
{
  char *v2;
  unsigned int v3;
  int v4;
  int v5;
  int v6;
  uint64_t v7;
  NSObject *v8;
  NSObject *v9;
  _QWORD block[5];
  uint8_t buf[4];
  char *v12;
  __int16 v13;
  unsigned int v14;
  __int16 v15;
  int v16;
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  v2 = *(char **)(a1 + 32);
  v3 = v2[305];
  v4 = *(char *)(a1 + 40);
  if (_valid_state(v3, v4) && (!v2[306] || _valid_state(v2[306], (char)v4)))
  {
    v2[306] = v4;
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_INFO))
    {
      v5 = *(char *)(a1 + 40);
      *(_DWORD *)buf = 134218496;
      v12 = v2;
      v13 = 1024;
      v14 = v3;
      v15 = 1024;
      v16 = v5;
      _os_log_impl(&dword_215173000, MEMORY[0x24BDACB70], OS_LOG_TYPE_INFO, "connection: %p, oldState: %{AppleLDAPTypes:state}hhd, newState: %{AppleLDAPTypes:state}hhd", buf, 0x18u);
      v2 = *(char **)(a1 + 32);
      v6 = v2[305];
    }
    else
    {
      v6 = v3;
    }
    if (v6 == 9)
    {
LABEL_10:
      _s_next_state((uint64_t)v2);
      return;
    }
    if ((char)v6 != 7)
    {
      if ((char)v6 != 1)
        return;
      goto LABEL_10;
    }
    ldap_connection_retain(v2);
    v7 = *(_QWORD *)(a1 + 32);
    v8 = *(NSObject **)(v7 + 56);
    v9 = *(NSObject **)(v7 + 8);
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 0x40000000;
    block[2] = ___state_set_block_invoke_48;
    block[3] = &__block_descriptor_tmp_49;
    block[4] = v7;
    dispatch_group_notify(v8, v9, block);
  }
}

uint64_t _valid_state(unsigned int a1, int a2)
{
  uint64_t result;

  result = 0;
  if (a2 && a1 != a2)
  {
    switch(a2)
    {
      case 1:
        if (a1 == 11)
          goto LABEL_23;
        goto LABEL_27;
      case 2:
        if (a1 != 1)
          goto LABEL_27;
        goto LABEL_23;
      case 3:
        if (a1 != 2)
          goto LABEL_27;
        goto LABEL_23;
      case 4:
        if (a1 != 3)
          goto LABEL_27;
        goto LABEL_23;
      case 5:
        if ((a1 - 3) >= 2u)
          goto LABEL_27;
        goto LABEL_23;
      case 6:
        if (a1 != 5)
          goto LABEL_27;
        goto LABEL_23;
      case 7:
        if (a1 >= 7)
          goto LABEL_27;
        result = (0x58u >> a1) & 1;
        break;
      case 8:
        if (a1 == 1 || a1 - 2 >= 6)
          goto LABEL_27;
        goto LABEL_23;
      case 9:
        if (a1 != 8)
          goto LABEL_27;
        goto LABEL_23;
      case 10:
        if ((a1 - 2) < 8u)
          goto LABEL_23;
        goto LABEL_27;
      case 11:
        if (a1 - 8 >= 3)
          goto LABEL_27;
LABEL_23:
        result = 1;
        break;
      default:
LABEL_27:
        result = 0;
        break;
    }
  }
  return result;
}

void _s_next_state(uint64_t a1)
{
  unsigned int *v2;
  char v3;
  int v4;
  char valid;
  int v6;
  unsigned int v7;
  unsigned int v8;
  unsigned int v9;
  unsigned int v10;
  unsigned int v11;
  unsigned int v12;
  unsigned int v13;
  unsigned int v14;
  void *v15;
  NSObject *v16;
  NSObject *v17;
  void *v18;
  NSObject *global_queue;
  uint64_t v20;
  uint64_t v21;
  void (*v22)(uint64_t);
  void *v23;
  void *v24;
  uint64_t v25;

  dispatch_assert_queue_V2(*(dispatch_queue_t *)(a1 + 8));
  v2 = (unsigned int *)(a1 + 288);
  while (1)
  {
    v3 = *(_BYTE *)(a1 + 306);
    v4 = *(char *)(a1 + 305);
    if (v3)
    {
      valid = _valid_state(*(char *)(a1 + 305), v3);
      *(_BYTE *)(a1 + 306) = 0;
      if ((valid & 1) != 0)
        goto LABEL_22;
    }
    switch(v4)
    {
      case 2:
        dispatch_assert_queue_V2(*(dispatch_queue_t *)(a1 + 8));
        *(_WORD *)(a1 + 305) = 3;
LABEL_50:
        if (!*(_DWORD *)(a1 + 292))
          *(_DWORD *)(a1 + 292) = 10001;
        ldap_connection_retain((id)a1);
        v16 = *(NSObject **)(a1 + 56);
        v17 = *(NSObject **)(a1 + 64);
        v20 = MEMORY[0x24BDAC760];
        v21 = 0x40000000;
        v22 = ___ldap_async_function_block_invoke;
        v23 = &__block_descriptor_tmp_51;
        v18 = _o_start_connection;
        goto LABEL_55;
      case 3:
        if (*(_DWORD *)(a1 + 292))
          v3 = 11;
        else
          v3 = 4;
        goto LABEL_22;
      case 4:
        v6 = *(_DWORD *)(a1 + 292);
        if (v6 == 10003)
        {
          v7 = *v2;
          if ((*v2 & 3) == 0)
            goto LABEL_19;
        }
        else if (!v6)
        {
          v7 = *v2;
LABEL_19:
          *(_DWORD *)(a1 + 292) = 0;
          if ((v7 & 4) != 0)
            v3 = 5;
          else
            v3 = 7;
LABEL_22:
          dispatch_assert_queue_V2(*(dispatch_queue_t *)(a1 + 8));
          *(_BYTE *)(a1 + 305) = v3;
          *(_BYTE *)(a1 + 306) = 0;
          switch(v3)
          {
            case 1:
              goto LABEL_58;
            case 2:
              do
                v8 = __ldaxr(v2);
              while (__stlxr(v8 | 0x40, v2));
              if ((v8 & 0x40) == 0)
              {
                ldap_connection_retain((id)a1);
                do
                  v9 = __ldaxr(v2);
                while (__stlxr(v9 & 0xFFFFFEFF, v2));
                dispatch_group_enter(*(dispatch_group_t *)(a1 + 16));
              }
              continue;
            case 3:
              goto LABEL_50;
            case 4:
              if ((*(_BYTE *)v2 & 3) == 0)
                continue;
              *(_DWORD *)(a1 + 292) = 10003;
              ldap_connection_retain((id)a1);
              v16 = *(NSObject **)(a1 + 56);
              v17 = *(NSObject **)(a1 + 64);
              v20 = MEMORY[0x24BDAC760];
              v21 = 0x40000000;
              v22 = ___ldap_async_function_block_invoke;
              v23 = &__block_descriptor_tmp_51;
              v18 = _o_initiate_tls_handshake;
              goto LABEL_55;
            case 5:
              ldap_connection_retain((id)a1);
              v16 = *(NSObject **)(a1 + 56);
              v17 = *(NSObject **)(a1 + 64);
              v20 = MEMORY[0x24BDAC760];
              v21 = 0x40000000;
              v22 = ___ldap_async_function_block_invoke;
              v23 = &__block_descriptor_tmp_51;
              v18 = _o_read_rootdse;
              goto LABEL_55;
            case 6:
              *(_QWORD *)(a1 + 168) = 0;
              v15 = *(void **)(a1 + 136);
              if (v15)
              {
                free(v15);
                *(_QWORD *)(a1 + 136) = 0;
              }
              ldap_connection_retain((id)a1);
              v16 = *(NSObject **)(a1 + 56);
              v17 = *(NSObject **)(a1 + 64);
              v20 = MEMORY[0x24BDAC760];
              v21 = 0x40000000;
              v22 = ___ldap_async_function_block_invoke;
              v23 = &__block_descriptor_tmp_51;
              v18 = _o_initiate_authentication;
              goto LABEL_55;
            case 7:
              do
                v12 = __ldaxr(v2);
              while (__stlxr(v12 & 0xFFFFFFBF, v2));
              if ((v12 & 0x40) != 0)
              {
                do
                  v13 = __ldaxr(v2);
                while (__stlxr(v13 | 0x80, v2));
                dispatch_group_leave(*(dispatch_group_t *)(a1 + 16));
              }
              return;
            case 8:
              if (!*(_DWORD *)(a1 + 292))
                *(_DWORD *)(a1 + 292) = 10002;
              continue;
            case 9:
              goto LABEL_54;
            case 10:
              goto LABEL_28;
            case 11:
              goto LABEL_41;
            default:
              return;
          }
        }
        dispatch_assert_queue_V2(*(dispatch_queue_t *)(a1 + 8));
        *(_WORD *)(a1 + 305) = 10;
        do
LABEL_28:
          v10 = __ldaxr(v2);
        while (__stlxr(v10 | 0x100, v2));
        do
          v11 = __ldaxr(v2);
        while (__stlxr(v11 & 0xFFFFFF7F, v2));
        if (!*(_DWORD *)(a1 + 292))
          *(_DWORD *)(a1 + 292) = 10001;
        break;
      case 5:
        if (*(_DWORD *)(a1 + 292))
          v3 = 10;
        else
          v3 = 6;
        goto LABEL_22;
      case 6:
        if (*(_DWORD *)(a1 + 292))
          v3 = 10;
        else
          v3 = 7;
        goto LABEL_22;
      case 8:
        dispatch_assert_queue_V2(*(dispatch_queue_t *)(a1 + 8));
        *(_WORD *)(a1 + 305) = 9;
LABEL_54:
        ldap_connection_retain((id)a1);
        v16 = *(NSObject **)(a1 + 56);
        v17 = *(NSObject **)(a1 + 64);
        v20 = MEMORY[0x24BDAC760];
        v21 = 0x40000000;
        v22 = ___ldap_async_function_block_invoke;
        v23 = &__block_descriptor_tmp_51;
        v18 = _o_ldap_unbinding;
        goto LABEL_55;
      case 9:
      case 10:
        dispatch_assert_queue_V2(*(dispatch_queue_t *)(a1 + 8));
        *(_WORD *)(a1 + 305) = 11;
        do
LABEL_41:
          v14 = __ldaxr(v2);
        while (__stlxr(v14 & 0xFFFFFFBF, v2));
        if ((v14 & 0x40) != 0)
          dispatch_group_leave(*(dispatch_group_t *)(a1 + 16));
        ldap_connection_retain((id)a1);
        v16 = *(NSObject **)(a1 + 56);
        v17 = *(NSObject **)(a1 + 64);
        v20 = MEMORY[0x24BDAC760];
        v21 = 0x40000000;
        v22 = ___ldap_async_function_block_invoke;
        v23 = &__block_descriptor_tmp_51;
        v18 = _o_ldap_cleanup;
LABEL_55:
        v24 = v18;
        v25 = a1;
        dispatch_group_async(v16, v17, &v20);
        return;
      case 11:
        dispatch_assert_queue_V2(*(dispatch_queue_t *)(a1 + 8));
        *(_WORD *)(a1 + 305) = 1;
LABEL_58:
        global_queue = dispatch_get_global_queue(0, 0);
        dispatch_async_f(global_queue, (void *)a1, ldap_connection_release);
        return;
      default:
        return;
    }
  }
}

void ___state_set_block_invoke_48(uint64_t a1)
{
  _s_next_state(*(_QWORD *)(a1 + 32));
  ldap_connection_release(*(id *)(a1 + 32));
}

void _o_start_connection(uint64_t a1)
{
  int v2;
  int v3;
  uint64_t v4;
  uint64_t v5;
  int v6;
  int v7;
  sockaddr v8;
  uint64_t v9;
  uint64_t v10;

  v10 = *MEMORY[0x24BDAC8D0];
  dispatch_assert_queue_V2(*(dispatch_queue_t *)(a1 + 64));
  if (*(_QWORD *)(a1 + 120))
  {
    tcp_connection_cancel();
    if (*(_QWORD *)(a1 + 120))
    {
      tcp_connection_release();
      *(_QWORD *)(a1 + 120) = 0;
    }
  }
  v2 = *(_DWORD *)(a1 + 288);
  if ((v2 & 0x400) != 0)
    goto LABEL_10;
  if ((v2 & 0x800) != 0)
  {
LABEL_29:
    dispatch_barrier_sync_f(*(dispatch_queue_t *)(a1 + 8), (void *)a1, (dispatch_function_t)_s_next_state);
    return;
  }
  if ((v2 & 0x1000) != 0)
  {
    if (*(_DWORD *)(a1 + 276) != -1)
    {
      v5 = tcp_connection_create_with_connected_fd();
      *(_QWORD *)(a1 + 120) = v5;
      *(_DWORD *)(a1 + 276) = -1;
      goto LABEL_11;
    }
    if (!*(_QWORD *)(a1 + 264))
      goto LABEL_29;
LABEL_10:
    v5 = tcp_connection_create();
    *(_QWORD *)(a1 + 120) = v5;
LABEL_11:
    v4 = v5;
    goto LABEL_12;
  }
  if ((*(_DWORD *)(a1 + 288) & 0x6000) != 0x4000)
    goto LABEL_29;
  v3 = socket(1, 1, 0);
  v9 = 0;
  memset(v8.sa_data, 0, 96);
  v7 = 1;
  v8.sa_family = 1;
  v8.sa_len = strlen(*(const char **)(a1 + 264)) + 98;
  __strlcpy_chk();
  setsockopt(v3, 0xFFFF, 4130, &v7, 4u);
  if (connect(v3, &v8, v8.sa_len)
    || ioctl(v3, 0x8004667EuLL, &v7) == -1
    || (v5 = tcp_connection_create_with_connected_fd(), *(_QWORD *)(a1 + 120) = v5, (v4 = v5) == 0))
  {
    close(v3);
    v4 = 0;
    v5 = *(_QWORD *)(a1 + 120);
  }
LABEL_12:
  if (v5)
  {
    if ((*(_BYTE *)(a1 + 289) & 0x40) == 0)
    {
      tcp_connection_copy_parameters();
      nw_parameters_set_is_non_app_initiated();
    }
    tcp_connection_allow_client_socket_access();
  }
  if (!v4)
    goto LABEL_29;
  v6 = *(_DWORD *)(a1 + 288);
  if ((v6 & 0x1000) == 0)
  {
    tcp_connection_set_indefinite();
    v6 = *(_DWORD *)(a1 + 288);
  }
  if ((v6 & 0x200) != 0)
    tcp_connection_set_no_cellular();
  if (*(_QWORD *)(a1 + 48))
    tcp_connection_set_account_identifier();
  if (*(_QWORD *)(a1 + 40))
    tcp_connection_set_source_application_by_bundle();
  tcp_connection_set_event_handler();
  tcp_connection_start();
}

void _o_initiate_tls_handshake(uint64_t a1)
{
  _QWORD *v2;
  char *v3;
  _QWORD v4[5];
  __int128 v5;
  uint64_t v6;
  char *v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  uint8_t buf[4];
  uint64_t v15;
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  dispatch_assert_queue_V2(*(dispatch_queue_t *)(a1 + 64));
  if (*(_WORD *)(a1 + 272) == 636)
  {
    _o_negotiate_ssl(a1);
  }
  else
  {
    v12 = 0u;
    v13 = 0u;
    v10 = 0u;
    v11 = 0u;
    v8 = 0u;
    v9 = 0u;
    v5 = 0u;
    DWORD2(v5) = 19;
    v6 = 22;
    v7 = strdup("1.3.6.1.4.1.1466.20037");
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 134217984;
      v15 = a1;
      _os_log_impl(&dword_215173000, MEMORY[0x24BDACB70], OS_LOG_TYPE_INFO, "connection: %p, TLS: send EXOP", buf, 0xCu);
    }
    v4[0] = MEMORY[0x24BDAC760];
    v4[1] = 0x40000000;
    v4[2] = ___o_initiate_tls_handshake_block_invoke;
    v4[3] = &__block_descriptor_tmp_55;
    v4[4] = a1;
    v2 = _ldap_base_operation_create((void *)a1, 104, 512, (uint64_t)_dispose_simple, v4);
    v3 = (char *)_ldap_operation_simple_init((uint64_t)v2, &v5);
    if (!_enqueue_operation_with_release(a1, v3))
    {
      *(_DWORD *)(a1 + 292) = 10003;
      dispatch_barrier_sync_f(*(dispatch_queue_t *)(a1 + 8), (void *)a1, (dispatch_function_t)_s_next_state);
    }
    free_LDAPMessage();
  }
}

void _o_read_rootdse(uint64_t a1)
{
  const __CFArray *v2;
  _QWORD *record;
  _QWORD v4[5];

  v2 = CFArrayCreate((CFAllocatorRef)*MEMORY[0x24BDBD240], (const void **)&LDAP_SUPPORTED_SASL_MECHANISMS, 1, MEMORY[0x24BDBD690]);
  dispatch_assert_queue_V2(*(dispatch_queue_t *)(a1 + 64));
  v4[0] = MEMORY[0x24BDAC760];
  v4[1] = 0x40000000;
  v4[2] = ___o_read_rootdse_block_invoke;
  v4[3] = &__block_descriptor_tmp_73;
  v4[4] = a1;
  record = ldap_connection_retrieve_record((_DWORD *)a1, 10, &stru_24D2B1360, v2, (uint64_t)v4);
  if (record)
    ldap_operation_release(record);
  if (v2)
    CFRelease(v2);
}

void _o_initiate_authentication(uint64_t a1)
{
  uint64_t i;
  _OWORD *v3;
  const void *v4;
  const void *Value;
  const void *v6;
  _OWORD *v7;
  uint64_t v8;

  dispatch_assert_queue_V2(*(dispatch_queue_t *)(a1 + 64));
  if ((*(_BYTE *)(a1 + 288) & 4) != 0)
  {
    if (*(_QWORD *)(a1 + 152))
    {
      for (i = 0; i != 160; i += 32)
      {
        v3 = (_OWORD *)((char *)&unk_24D2AF718 + i);
        v4 = *(const void **)((char *)&unk_24D2AF718 + i + 8);
        if (CFSetContainsValue(*(CFSetRef *)(a1 + 152), v4))
        {
          Value = CFDictionaryGetValue(*(CFDictionaryRef *)(a1 + 248), v4);
          if (Value)
          {
            v6 = Value;
            v7 = malloc_type_malloc(0x20uLL, 0xE0040C8AD4411uLL);
            if (v7)
            {
              v7[1] = v3[1];
              *v7 = *v3;
              *((_QWORD *)v7 + 2) = v6;
              *(_QWORD *)v7 = *(_QWORD *)(a1 + 160);
              *(_QWORD *)(a1 + 160) = v7;
            }
            else
            {
              _os_assumes_log();
            }
          }
        }
      }
    }
    v8 = *(_QWORD *)(a1 + 160);
    if (v8)
    {
      *(_QWORD *)(a1 + 168) = v8;
      (*(void (**)(uint64_t, _QWORD))(v8 + 24))(a1, *(_QWORD *)(v8 + 16));
    }
    else
    {
      *(_DWORD *)(a1 + 292) = 7;
      dispatch_barrier_sync_f(*(dispatch_queue_t *)(a1 + 8), (void *)a1, (dispatch_function_t)_s_next_state);
    }
  }
  else
  {
    _o_ldap_basic_auth(a1, 0);
  }
}

void _o_ldap_unbinding(dispatch_queue_t *a1)
{
  _QWORD *v2;
  char *v3;
  _OWORD v4[8];

  memset(v4, 0, sizeof(v4));
  DWORD2(v4[0]) = 3;
  dispatch_assert_queue_V2(a1[8]);
  v2 = _ldap_base_operation_create(a1, 104, 512, (uint64_t)_dispose_simple, 0);
  v3 = (char *)_ldap_operation_simple_init((uint64_t)v2, v4);
  if (!_enqueue_operation_with_release((uint64_t)a1, v3))
    dispatch_barrier_sync_f(a1[1], a1, (dispatch_function_t)_s_next_state);
}

void _o_ldap_cleanup(uint64_t a1)
{
  unsigned int *v2;
  unsigned int v3;
  int v4;
  NSObject *v5;
  NSObject *global_queue;
  _QWORD v7[5];
  int v8;

  dispatch_assert_queue_V2(*(dispatch_queue_t *)(a1 + 64));
  if (*(_QWORD *)(a1 + 120))
  {
    tcp_connection_cancel();
    if (*(_QWORD *)(a1 + 120))
    {
      tcp_connection_release();
      *(_QWORD *)(a1 + 120) = 0;
    }
  }
  v2 = (unsigned int *)(a1 + 288);
  do
    v3 = __ldaxr(v2);
  while (__stlxr(v3 & 0xFFFFFF7F, v2));
  dispatch_barrier_sync(*(dispatch_queue_t *)(a1 + 208), &__block_literal_global);
  v4 = *(_DWORD *)(a1 + 292);
  dispatch_assert_queue_V2(*(dispatch_queue_t *)(a1 + 64));
  _o_disconnected((NSObject **)a1, a1 + 72, v4);
  _o_disconnected((NSObject **)a1, a1 + 88, v4);
  ldap_connection_retain((id)a1);
  v5 = *(NSObject **)(a1 + 32);
  global_queue = dispatch_get_global_queue(0, 0);
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 0x40000000;
  v7[2] = ___o_disconnect_cleanup_block_invoke;
  v7[3] = &__block_descriptor_tmp_101;
  v7[4] = a1;
  v8 = v4;
  dispatch_group_notify(v5, global_queue, v7);
  dispatch_barrier_sync_f(*(dispatch_queue_t *)(a1 + 8), (void *)a1, (dispatch_function_t)_s_next_state);
}

void ___ldap_async_function_block_invoke(uint64_t a1)
{
  (*(void (**)(_QWORD))(a1 + 32))(*(_QWORD *)(a1 + 40));
  ldap_connection_release(*(id *)(a1 + 40));
}

void ___o_start_connection_block_invoke(uint64_t a1, int a2)
{
  uint64_t v3;
  NSObject *v4;
  _QWORD v5[5];
  char v6;

  v3 = *(_QWORD *)(a1 + 32);
  dispatch_assert_queue_V2(*(dispatch_queue_t *)(v3 + 208));
  if (a2 == 1)
  {
    *(_DWORD *)(v3 + 292) = 0;
    dispatch_barrier_sync_f(*(dispatch_queue_t *)(v3 + 8), (void *)v3, (dispatch_function_t)_s_next_state);
  }
  else if (a2 == 3)
  {
    v4 = *(NSObject **)(v3 + 8);
    v5[0] = MEMORY[0x24BDAC760];
    v5[1] = 0x40000000;
    v5[2] = ___state_set_block_invoke;
    v5[3] = &__block_descriptor_tmp_50;
    v5[4] = v3;
    v6 = 10;
    dispatch_barrier_sync(v4, v5);
  }
}

void ___o_initiate_tls_handshake_block_invoke(uint64_t a1, uint64_t a2, int a3)
{
  uint64_t v4;
  _QWORD *v5;
  NSObject *v6;
  NSObject *v7;
  _QWORD v8[6];

  if (a3)
  {
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      ___o_initiate_tls_handshake_block_invoke_cold_1();
    v4 = *(_QWORD *)(a1 + 32);
    *(_DWORD *)(v4 + 292) = 10003;
    dispatch_barrier_sync_f(*(dispatch_queue_t *)(v4 + 8), (void *)v4, (dispatch_function_t)_s_next_state);
  }
  else
  {
    v5 = *(_QWORD **)(a1 + 32);
    ldap_connection_retain(v5);
    v6 = v5[7];
    v7 = v5[8];
    v8[0] = MEMORY[0x24BDAC760];
    v8[1] = 0x40000000;
    v8[2] = ___ldap_async_function_block_invoke;
    v8[3] = &__block_descriptor_tmp_51;
    v8[4] = _o_negotiate_ssl;
    v8[5] = v5;
    dispatch_group_async(v6, v7, v8);
  }
}

void _o_negotiate_ssl(uint64_t a1)
{
  SSLContext *v2;
  const __CFArray *v3;
  int v4;
  const char *v5;
  SSLContext *v6;
  const void *v7;
  size_t v8;
  NSObject *v9;
  NSObject *global_queue;
  _QWORD block[5];

  dispatch_assert_queue_V2(*(dispatch_queue_t *)(a1 + 64));
  v2 = SSLCreateContext((CFAllocatorRef)*MEMORY[0x24BDBD240], kSSLClientSide, kSSLStreamType);
  *(_QWORD *)(a1 + 128) = v2;
  if (v2)
  {
    SSLSetConnection(v2, (SSLConnectionRef)a1);
    if (SSLSetIOFuncs(*(SSLContextRef *)(a1 + 128), (SSLReadFunc)_secure_read, (SSLWriteFunc)_secure_write))
    {
LABEL_3:
      *(_DWORD *)(a1 + 292) = 10003;
      dispatch_barrier_sync_f(*(dispatch_queue_t *)(a1 + 8), (void *)a1, (dispatch_function_t)_s_next_state);
      return;
    }
    v3 = *(const __CFArray **)(a1 + 256);
    if (v3)
      SSLSetCertificate(*(SSLContextRef *)(a1 + 128), v3);
    v4 = *(_DWORD *)(a1 + 288);
    if ((v4 & 0x400) != 0)
    {
      v6 = *(SSLContext **)(a1 + 128);
      v5 = *(const char **)(a1 + 264);
    }
    else
    {
      if ((v4 & 0x1000) == 0)
      {
LABEL_13:
        SSLSetProtocolVersionMin(*(SSLContextRef *)(a1 + 128), kSSLProtocol3);
        ldap_connection_retain((id)a1);
        v9 = *(NSObject **)(a1 + 16);
        global_queue = dispatch_get_global_queue(0, 0);
        block[0] = MEMORY[0x24BDAC760];
        block[1] = 0x40000000;
        block[2] = ___o_negotiate_ssl_block_invoke;
        block[3] = &__block_descriptor_tmp_56;
        block[4] = a1;
        dispatch_group_async(v9, global_queue, block);
        return;
      }
      v5 = *(const char **)(a1 + 264);
      v6 = *(SSLContext **)(a1 + 128);
      if (!v5)
      {
        SSLClose(*(SSLContextRef *)(a1 + 128));
        v7 = *(const void **)(a1 + 128);
        if (v7)
        {
          CFRelease(v7);
          *(_QWORD *)(a1 + 128) = 0;
        }
        goto LABEL_3;
      }
    }
    v8 = strlen(v5);
    SSLSetPeerDomainName(v6, v5, v8);
    goto LABEL_13;
  }
}

BOOL _enqueue_operation_with_release(uint64_t a1, char *a2)
{
  _QWORD *v2;
  _QWORD *v3;

  v2 = _enqueue_operation(a1, a2);
  v3 = v2;
  if (v2)
    ldap_operation_release(v2);
  return v3 != 0;
}

_QWORD *_ldap_base_operation_create(void *a1, uint64_t a2, uint64_t a3, uint64_t a4, const void *a5)
{
  _QWORD *v9;
  _QWORD *v10;

  v9 = ldap_operation_obj_alloc(a2);
  if (!v9)
    _ldap_connection_create_cold_1();
  v10 = v9;
  v9[4] = ldap_connection_retain(a1);
  *((_DWORD *)v10 + 20) = _ldap_connection_next_messageID((uint64_t)a1);
  v10[9] = a4;
  v10[5] = a3;
  if (a5)
    v10[3] = _Block_copy(a5);
  return v10;
}

void _dispose_simple(uint64_t a1)
{
  void *v2;

  v2 = *(void **)(a1 + 88);
  if (v2)
  {
    free(v2);
    *(_QWORD *)(a1 + 88) = 0;
  }
}

_QWORD *_ldap_operation_simple_init(uint64_t a1, _DWORD *a2)
{
  _QWORD *v2;
  uint64_t v3;
  size_t v4;
  void *v5;
  void **v6;
  uint64_t *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v12;
  int v13;
  void *v14;
  unsigned int v15;
  size_t v16;
  _DWORD *v17;
  uint64_t v18;
  uint64_t length_low;
  void *v20;
  gss_buffer_desc_struct input_message_buffer;
  gss_buffer_desc_struct output_message_buffer;
  OM_uint32 minor_status;

  v2 = (_QWORD *)a1;
  v3 = *(_QWORD *)(a1 + 32);
  *a2 = *(_DWORD *)(a1 + 80);
  v4 = length_LDAPMessage();
  v5 = malloc_type_malloc(v4, 0xFFE998uLL);
  v2[11] = v5;
  v6 = (void **)(v2 + 11);
  if (!v5)
    goto LABEL_4;
  v7 = v2 + 12;
  if (encode_LDAPMessage())
  {
    free(*v6);
    *v6 = 0;
LABEL_4:
    ldap_operation_release(v2);
    return 0;
  }
  if ((*(_BYTE *)(v3 + 288) & 3) == 0 && *(_QWORD *)(v3 + 184))
  {
    v12 = v2[4];
    v13 = (*(_DWORD *)(v12 + 288) >> 5) & 1;
    minor_status = 0;
    output_message_buffer.length = 0;
    output_message_buffer.value = 0;
    v14 = (void *)v2[11];
    input_message_buffer.length = v2[12];
    input_message_buffer.value = v14;
    if (gss_wrap(&minor_status, *(gss_ctx_id_t *)(v12 + 184), v13, *(_DWORD *)(v12 + 192), &input_message_buffer, 0, &output_message_buffer))
    {
      *v6 = 0;
      v2[12] = 0;
    }
    else
    {
      v15 = bswap32(output_message_buffer.length);
      v16 = output_message_buffer.length + 4;
      *v7 = output_message_buffer.length + 4;
      v17 = malloc_type_malloc(v16, 0x275FDC8AuLL);
      *v6 = v17;
      *v17 = v15;
      memcpy((char *)*v6 + 4, output_message_buffer.value, output_message_buffer.length);
      gss_release_buffer(&minor_status, &output_message_buffer);
    }
    gss_release_buffer(&minor_status, &input_message_buffer);
  }
  v18 = *(_QWORD *)(v3 + 200);
  length_low = *v7;
  if (v18)
  {
    output_message_buffer.length = 0;
    LODWORD(input_message_buffer.length) = 0;
    srp_encode(v18, (uint64_t)*v6, length_low, &output_message_buffer, (unsigned int *)&input_message_buffer, v8, v9, v10);
    free(*v6);
    v20 = malloc_type_malloc(LODWORD(input_message_buffer.length), 0xFC734DC1uLL);
    *v6 = v20;
    memcpy(v20, (const void *)output_message_buffer.length, LODWORD(input_message_buffer.length));
    length_low = LODWORD(input_message_buffer.length);
    *v7 = LODWORD(input_message_buffer.length);
  }
  if (!length_low)
    goto LABEL_4;
  return v2;
}

uint64_t _secure_read(uint64_t a1, uint64_t a2, uint64_t a3)
{
  NSObject *v3;
  uint64_t v4;
  _QWORD v6[8];
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  int v10;

  v7 = 0;
  v8 = &v7;
  v9 = 0x2000000000;
  v10 = -9803;
  if ((*(_BYTE *)(a1 + 289) & 1) != 0)
  {
    v4 = 4294957490;
  }
  else
  {
    v3 = *(NSObject **)(a1 + 208);
    v6[0] = MEMORY[0x24BDAC760];
    v6[1] = 0x40000000;
    v6[2] = ___secure_read_block_invoke;
    v6[3] = &unk_24D2AF568;
    v6[4] = &v7;
    v6[5] = a3;
    v6[6] = a1;
    v6[7] = a2;
    dispatch_barrier_sync(v3, v6);
    v4 = *((unsigned int *)v8 + 6);
  }
  _Block_object_dispose(&v7, 8);
  return v4;
}

uint64_t _secure_write(uint64_t a1, void *buffer, size_t *a3)
{
  if (!*(_QWORD *)(a1 + 120) || (*(_BYTE *)(a1 + 289) & 1) != 0)
    return 4294957490;
  dispatch_data_create(buffer, *a3, 0, 0);
  tcp_connection_write();
  return 0;
}

void ___o_negotiate_ssl_block_invoke(uint64_t a1)
{
  uint64_t v2;
  OSStatus v3;
  uint64_t v4;
  NSObject *v5;
  int v6;
  NSObject *v7;
  _QWORD block[5];
  _QWORD v9[3];
  int v10;
  _BYTE buf[40];
  int v12;
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  v2 = *(_QWORD *)(a1 + 32);
  memset(v9, 0, sizeof(v9));
  v10 = 0;
  do
  {
    v3 = SSLHandshake(*(SSLContextRef *)(v2 + 128));
    usleep(0x3E8u);
  }
  while (v3 == -9803);
  if (v3)
  {
    _os_assumes_log();
    v4 = MEMORY[0x24BDAC760];
    v5 = *(NSObject **)(v2 + 208);
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 0x40000000;
    block[2] = ___tls_handshake_loop_block_invoke;
    block[3] = &__block_descriptor_tmp_69;
    block[4] = v2;
    dispatch_barrier_sync(v5, block);
    tcp_connection_get_remote();
    v6 = *(_DWORD *)(v2 + 288);
    if ((v6 & 3) != 0)
    {
      if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 134219010;
        *(_QWORD *)&buf[4] = v2;
        *(_WORD *)&buf[12] = 1040;
        *(_DWORD *)&buf[14] = LOBYTE(v9[0]);
        *(_WORD *)&buf[18] = 2098;
        *(_QWORD *)&buf[20] = v9;
        *(_WORD *)&buf[28] = 1024;
        *(_DWORD *)&buf[30] = v3;
        *(_WORD *)&buf[34] = 1024;
        *(_DWORD *)&buf[36] = v6;
        _os_log_error_impl(&dword_215173000, MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR, "connection: %p, address: %{public,network:sockaddr}.*P, error: %{AppleLDAPTypes:errSSL}d, flags: %{AppleLDAPTypes:flags}d", buf, 0x28u);
      }
      v7 = *(NSObject **)(v2 + 208);
      *(_QWORD *)buf = v4;
      *(_QWORD *)&buf[8] = 0x40000000;
      *(_QWORD *)&buf[16] = ___fail_host_block_invoke;
      *(_QWORD *)&buf[24] = &__block_descriptor_tmp_70;
      *(_QWORD *)&buf[32] = v2;
      v12 = 10003;
      dispatch_barrier_sync(v7, buf);
    }
    else if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134219010;
      *(_QWORD *)&buf[4] = v2;
      *(_WORD *)&buf[12] = 1040;
      *(_DWORD *)&buf[14] = LOBYTE(v9[0]);
      *(_WORD *)&buf[18] = 2098;
      *(_QWORD *)&buf[20] = v9;
      *(_WORD *)&buf[28] = 1024;
      *(_DWORD *)&buf[30] = v3;
      *(_WORD *)&buf[34] = 1024;
      *(_DWORD *)&buf[36] = v6;
      _os_log_impl(&dword_215173000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT, "connection: %p, TLS: auto, address: %{public,network:sockaddr}.*P, error: %{AppleLDAPTypes:errSSL}d, flags: %{AppleLDAPTypes:flags}d", buf, 0x28u);
    }
  }
  else
  {
    *(_DWORD *)(v2 + 292) = 0;
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEBUG))
    {
      tcp_connection_get_remote();
      if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEBUG))
        ___o_negotiate_ssl_block_invoke_cold_1();
    }
  }
  dispatch_barrier_sync_f(*(dispatch_queue_t *)(v2 + 8), (void *)v2, (dispatch_function_t)_s_next_state);
  ldap_connection_release(*(id *)(a1 + 32));
}

void ___secure_read_block_invoke(uint64_t a1)
{
  size_t *v2;
  uint64_t v3;
  size_t v4;
  NSObject *v5;
  NSObject *v6;
  NSObject *v7;
  size_t v8;
  void *buffer_ptr;

  buffer_ptr = 0;
  v2 = *(size_t **)(a1 + 40);
  v3 = *(_QWORD *)(a1 + 48);
  v4 = *v2;
  v8 = 0;
  if ((*(_DWORD *)(v3 + 292) - 10001) > 1)
  {
    v5 = *(NSObject **)(v3 + 216);
    if (v5)
    {
      v6 = dispatch_data_create_map(v5, (const void **)&buffer_ptr, &v8);
      if (v4 <= v8)
      {
        *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = 0;
        memmove(*(void **)(a1 + 56), buffer_ptr, v4);
        v7 = *(NSObject **)(*(_QWORD *)(a1 + 48) + 216);
        if (v7)
        {
          dispatch_release(v7);
          *(_QWORD *)(*(_QWORD *)(a1 + 48) + 216) = 0;
        }
        if (v8 > v4)
          *(_QWORD *)(*(_QWORD *)(a1 + 48) + 216) = dispatch_data_create_subrange(v6, v4, v8 - v4);
      }
      else
      {
        **(_QWORD **)(a1 + 40) = 0;
      }
      if (v6)
        dispatch_release(v6);
    }
    else
    {
      *v2 = 0;
    }
  }
  else
  {
    *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = -9806;
  }
}

void ___secure_write_block_invoke(uint64_t a1, int a2)
{
  uint64_t v3;
  NSObject *v4;
  _QWORD v5[5];
  char v6;

  if (a2)
  {
    if (a2 == 57)
    {
      v3 = *(_QWORD *)(a1 + 32);
      v4 = *(NSObject **)(v3 + 8);
      v5[0] = MEMORY[0x24BDAC760];
      v5[1] = 0x40000000;
      v5[2] = ___state_set_block_invoke;
      v5[3] = &__block_descriptor_tmp_50;
      v5[4] = v3;
      v6 = 11;
      dispatch_barrier_sync(v4, v5);
    }
  }
  else
  {
    _schedule_read(*(_QWORD *)(a1 + 32));
  }
  dispatch_release(*(dispatch_object_t *)(a1 + 40));
}

uint64_t _schedule_read(uint64_t result)
{
  unsigned int *v1;
  unsigned int v2;

  if (result && (*(_BYTE *)(result + 288) & 0xC0) != 0)
  {
    v1 = (unsigned int *)(result + 288);
    do
      v2 = __ldaxr(v1);
    while (__stlxr(v2 | 8, v1));
    if ((v2 & 8) == 0)
      return tcp_connection_read();
  }
  return result;
}

void ___schedule_read_block_invoke(uint64_t a1, NSObject *concat, int a3)
{
  uint64_t v5;
  unsigned int *v6;
  unsigned int v7;
  NSObject *v8;
  char v9;
  NSObject *v10;
  NSObject *v11;
  NSObject *v12;
  NSObject *v13;
  _BYTE v14[24];
  void *v15;
  void (*v16)(uint64_t);
  uint64_t v17;
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  v5 = *(_QWORD *)(a1 + 32);
  dispatch_assert_queue_V2(*(dispatch_queue_t *)(v5 + 208));
  v6 = (unsigned int *)(v5 + 288);
  do
    v7 = __ldaxr(v6);
  while (__stlxr(v7 & 0xFFFFFFF7, v6));
  if (a3)
  {
    if (a3 == 57 || a3 == 54)
    {
      if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)v14 = 134218240;
        *(_QWORD *)&v14[4] = v5;
        *(_WORD *)&v14[12] = 1024;
        *(_DWORD *)&v14[14] = a3;
        _os_log_impl(&dword_215173000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT, "connection: %p, error: %{errno}d", v14, 0x12u);
      }
      v8 = *(NSObject **)(v5 + 8);
      *(_QWORD *)v14 = MEMORY[0x24BDAC760];
      *(_QWORD *)&v14[8] = 0x40000000;
      *(_QWORD *)&v14[16] = ___state_set_block_invoke;
      v15 = &__block_descriptor_tmp_50;
      v16 = (void (*)(uint64_t))v5;
      v9 = 11;
    }
    else
    {
      if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
        ___schedule_read_block_invoke_cold_1();
      v8 = *(NSObject **)(v5 + 8);
      *(_QWORD *)v14 = MEMORY[0x24BDAC760];
      *(_QWORD *)&v14[8] = 0x40000000;
      *(_QWORD *)&v14[16] = ___state_set_block_invoke;
      v15 = &__block_descriptor_tmp_50;
      v16 = (void (*)(uint64_t))v5;
      v9 = 8;
    }
    LOBYTE(v17) = v9;
    dispatch_barrier_sync(v8, v14);
  }
  else
  {
    v10 = *(NSObject **)(v5 + 216);
    if (v10)
    {
      concat = dispatch_data_create_concat(v10, concat);
      v11 = *(NSObject **)(v5 + 216);
      if (v11)
        dispatch_release(v11);
    }
    else
    {
      dispatch_retain(concat);
    }
    *(_QWORD *)(v5 + 216) = concat;
    _schedule_read(v5);
    ldap_connection_retain((id)v5);
    v12 = *(NSObject **)(v5 + 56);
    v13 = *(NSObject **)(v5 + 64);
    *(_QWORD *)v14 = MEMORY[0x24BDAC760];
    *(_QWORD *)&v14[8] = 0x40000000;
    *(_QWORD *)&v14[16] = ___ldap_async_function_block_invoke;
    v15 = &__block_descriptor_tmp_51;
    v16 = _o_process_buffer;
    v17 = v5;
    dispatch_group_async(v12, v13, v14);
  }
}

void _o_process_buffer(uint64_t a1)
{
  SSLContext *v2;
  NSObject *v3;
  uint64_t v4;
  size_t *v5;
  char *v6;
  size_t v7;
  OSStatus v8;
  size_t *v9;
  BOOL v10;
  dispatch_data_t v11;
  NSObject *v12;
  NSObject *concat;
  NSObject *v14;
  NSObject *v15;
  NSObject *v16;
  NSObject *v17;
  unint64_t v18;
  uint64_t v19;
  size_t v20;
  gss_ctx_id_t_desc_struct *v21;
  unsigned int *v22;
  size_t v23;
  uint64_t v24;
  BOOL v25;
  void *value;
  NSObject *v27;
  _QWORD v28[6];
  _QWORD block[6];
  gss_buffer_desc_struct output_message_buffer;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t *v34;
  uint64_t v35;
  uint64_t v36;
  size_t processed;
  void *buffer_ptr;
  OM_uint32 minor_status;
  gss_buffer_desc_struct state;

  processed = 0;
  buffer_ptr = 0;
  v33 = 0;
  v34 = &v33;
  v35 = 0x2000000000;
  v36 = 0;
  dispatch_assert_queue_V2(*(dispatch_queue_t *)(a1 + 64));
  v2 = *(SSLContext **)(a1 + 128);
  if (v2)
  {
    output_message_buffer.length = 0;
    output_message_buffer.value = &output_message_buffer;
    v31 = 0x2000000000;
    v32 = 0;
    LODWORD(state.length) = 0;
    if (SSLGetSessionState(v2, (SSLSessionState *)&state) || LODWORD(state.length) != 2)
    {
      _Block_object_dispose(&output_message_buffer, 8);
      goto LABEL_63;
    }
    v3 = *(NSObject **)(a1 + 208);
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 0x40000000;
    block[2] = ___o_process_buffer_block_invoke;
    block[3] = &unk_24D2AF5D0;
    block[4] = &output_message_buffer;
    block[5] = a1;
    dispatch_sync(v3, block);
    v5 = (size_t *)((char *)output_message_buffer.value + 24);
    v4 = *((_QWORD *)output_message_buffer.value + 3);
    if (v4)
    {
      v6 = 0;
      v7 = 0;
      do
      {
        v6 = (char *)reallocf(v6, v4 + v7);
        processed = 0;
        v8 = SSLRead(*(SSLContextRef *)(a1 + 128), &v6[v7], *v5, &processed);
        v9 = (size_t *)((char *)output_message_buffer.value + 24);
        if (processed)
        {
          v7 += processed;
          if (*v9 > processed)
            *v9 -= processed;
          else
            *v9 = 0;
        }
        else
        {
          SSLGetBufferedReadSize(*(SSLContextRef *)(a1 + 128), v9);
        }
        if (v8)
          v10 = v8 == -9803;
        else
          v10 = 1;
        if (!v10)
          break;
        v5 = (size_t *)((char *)output_message_buffer.value + 24);
        v4 = *((_QWORD *)output_message_buffer.value + 3);
      }
      while (v4);
      if (v7)
      {
        v11 = dispatch_data_create(v6, v7, 0, (dispatch_block_t)*MEMORY[0x24BDAC980]);
        v34[3] = (uint64_t)v11;
      }
      else if (v6)
      {
        free(v6);
      }
    }
    _Block_object_dispose(&output_message_buffer, 8);
  }
  else
  {
    v12 = *(NSObject **)(a1 + 208);
    v28[0] = MEMORY[0x24BDAC760];
    v28[1] = 0x40000000;
    v28[2] = ___o_process_buffer_block_invoke_2;
    v28[3] = &unk_24D2AF5F8;
    v28[4] = &v33;
    v28[5] = a1;
    dispatch_barrier_sync(v12, v28);
  }
  concat = v34[3];
  if (concat)
  {
    v14 = *(NSObject **)(a1 + 104);
    if (!v14)
      goto LABEL_31;
    concat = dispatch_data_create_concat(v14, (dispatch_data_t)v34[3]);
    v15 = *(NSObject **)(a1 + 104);
    if (v15)
    {
      dispatch_release(v15);
      *(_QWORD *)(a1 + 104) = 0;
    }
    v16 = v34[3];
    if (v16)
    {
      dispatch_release(v16);
      v34[3] = 0;
    }
    if (concat)
    {
LABEL_31:
      v17 = dispatch_data_create_map(concat, (const void **)&buffer_ptr, &processed);
      v18 = 0;
      do
      {
        if ((*(_BYTE *)(a1 + 288) & 3) != 0 || (v21 = *(gss_ctx_id_t_desc_struct **)(a1 + 184)) == 0)
        {
          v19 = *(_QWORD *)(a1 + 200);
          if (v19)
          {
            LODWORD(state.length) = 0;
            output_message_buffer.length = 0;
            if (srp_decode(v19, (char *)buffer_ptr + v18, (int)processed - (int)v18, &output_message_buffer, (unsigned int *)&state))
            {
              v20 = processed;
            }
            else
            {
              v20 = processed;
              if (LODWORD(state.length))
                _o_ldap_receive_messages(a1, output_message_buffer.length, LODWORD(state.length));
            }
            v24 = v20 - v18;
          }
          else
          {
            v24 = _o_ldap_receive_messages(a1, (uint64_t)buffer_ptr + v18, processed - v18);
          }
        }
        else
        {
          v22 = (unsigned int *)((char *)buffer_ptr + v18);
          if (processed - v18 < 4)
            v23 = 0;
          else
            v23 = bswap32(*v22);
          v24 = v23 + 4;
          if (v23 + 4 <= processed - v18)
          {
            output_message_buffer.length = 0;
            output_message_buffer.value = 0;
            minor_status = 0;
            state.length = v23;
            state.value = v22 + 1;
            if (gss_unwrap(&minor_status, v21, &state, &output_message_buffer, 0, (gss_qop_t *)(a1 + 192)))
            {
              _os_assumes_log();
            }
            else if (output_message_buffer.length)
            {
              value = output_message_buffer.value;
              _o_ldap_receive_messages(a1, (uint64_t)output_message_buffer.value, output_message_buffer.length);
              if (value)
                free(value);
            }
          }
          else
          {
            v24 = 0;
          }
        }
        v18 += v24;
        if (v24)
          v25 = processed > v18;
        else
          v25 = 0;
      }
      while (v25);
      if (processed <= v18)
      {
        if (v17)
          dispatch_release(v17);
        v27 = concat;
        goto LABEL_62;
      }
      *(_QWORD *)(a1 + 104) = dispatch_data_create_subrange(v17, v18, processed - v18);
      dispatch_release(concat);
      if (v17)
      {
        v27 = v17;
LABEL_62:
        dispatch_release(v27);
      }
    }
  }
LABEL_63:
  _Block_object_dispose(&v33, 8);
}

NSObject *___o_process_buffer_block_invoke(uint64_t a1)
{
  NSObject *result;

  result = *(NSObject **)(*(_QWORD *)(a1 + 40) + 216);
  if (result)
  {
    result = dispatch_data_get_size(result);
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  }
  return result;
}

uint64_t ___o_process_buffer_block_invoke_2(uint64_t result)
{
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(result + 32) + 8) + 24) = *(_QWORD *)(*(_QWORD *)(result + 40) + 216);
  *(_QWORD *)(*(_QWORD *)(result + 40) + 216) = 0;
  return result;
}

uint64_t _o_ldap_receive_messages(uint64_t a1, uint64_t a2, uint64_t a3)
{
  int v5;

  dispatch_assert_queue_V2(*(dispatch_queue_t *)(a1 + 64));
  if (a3)
  {
    while (1)
    {
      v5 = decode_LDAPMessage();
      if (v5)
        break;
      dispatch_assert_queue_V2(*(dispatch_queue_t *)(a1 + 64));
      free_LDAPMessage();
    }
    if (v5 != 1859794437 && os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      _o_ldap_receive_messages_cold_1();
  }
  return 0;
}

void _o_operation_complete(uint64_t a1, uint64_t a2, int a3)
{
  unint64_t *v6;
  uint64_t v7;
  unint64_t v8;
  unint64_t v9;
  NSObject *v10;
  NSObject *v11;
  uint64_t v12;
  _QWORD *v13;
  unint64_t *v14;
  unint64_t v15;
  unint64_t v16;
  void *v17;
  uint64_t v18;
  NSObject *v19;
  NSObject *v20;
  void *v21;
  _QWORD block[6];
  int v23;

  dispatch_assert_queue_V2(*(dispatch_queue_t *)(a1 + 64));
  v6 = (unint64_t *)(a2 + 40);
  if (a3)
    v7 = 5;
  else
    v7 = 1;
  do
    v8 = __ldaxr(v6);
  while (__stlxr(v8 | v7, v6));
  if ((v8 & 1) == 0)
  {
    do
      v9 = __ldaxr(v6);
    while (__stlxr(v9 & 0xFFFFFFFFFFFFFFF7, v6));
    if ((*(_BYTE *)(a2 + 41) & 4) != 0)
    {
      v10 = *(NSObject **)(a2 + 112);
      if (v10)
      {
        dispatch_source_cancel(v10);
        v11 = *(NSObject **)(a2 + 112);
        if (v11)
        {
          dispatch_release(v11);
          *(_QWORD *)(a2 + 112) = 0;
        }
      }
    }
    if ((v9 & 8) != 0)
    {
      v12 = *(_QWORD *)(a2 + 8);
      v13 = *(_QWORD **)(a2 + 16);
      if (v12)
      {
        *(_QWORD *)(v12 + 16) = v13;
        v13 = *(_QWORD **)(a2 + 16);
      }
      else
      {
        *(_QWORD *)(a1 + 80) = v13;
      }
      *v13 = v12;
      if ((*(_BYTE *)(a2 + 41) & 1) == 0)
      {
        v14 = (unint64_t *)(a1 + 112);
        do
          v15 = __ldaxr(v14);
        while (__stlxr(v15 - 1, v14));
      }
      do
        v16 = __ldaxr(v6);
      while (__stlxr(v16 | 2, v6));
      if ((v16 & 2) == 0)
      {
        if (*(_QWORD *)(a2 + 24))
        {
          v17 = *(void **)(a2 + 48);
          if (v17)
          {
            os_retain(v17);
            v18 = voucher_adopt();
          }
          else
          {
            v18 = 0;
          }
          v20 = *(NSObject **)(a1 + 24);
          v19 = *(NSObject **)(a1 + 32);
          block[0] = MEMORY[0x24BDAC760];
          block[1] = 0x40000000;
          block[2] = ___o_operation_complete_block_invoke;
          block[3] = &__block_descriptor_tmp_64;
          v23 = a3;
          block[4] = a1;
          block[5] = a2;
          dispatch_group_async(v19, v20, block);
          if (v18)
          {
            v21 = (void *)voucher_adopt();
            os_release(v21);
          }
        }
        else
        {
          dispatch_group_leave(*(dispatch_group_t *)(a1 + 56));
          ldap_operation_release((id)a2);
        }
      }
      _o_ldap_wakeup(a1);
    }
  }
}

void ___o_operation_complete_block_invoke(uint64_t a1)
{
  int v2;
  BOOL v3;
  uint64_t v4;
  int v5;
  int v6;
  uint64_t v7;
  __int16 v8;
  int v9;
  __int16 v10;
  int v11;
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  v2 = *(_DWORD *)(a1 + 48);
  if (v2)
    v3 = v2 == 10010;
  else
    v3 = 1;
  if (!v3 && os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
  {
    v4 = *(_QWORD *)(a1 + 32);
    v5 = *(_DWORD *)(*(_QWORD *)(a1 + 40) + 80);
    v6 = 134218496;
    v7 = v4;
    v8 = 1024;
    v9 = v5;
    v10 = 1024;
    v11 = v2;
    _os_log_error_impl(&dword_215173000, MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR, "connection: %p, ldap msgid: %u, error: %{AppleLDAPTypes:ldap_error_t}d", (uint8_t *)&v6, 0x18u);
  }
  (*(void (**)(void))(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 24) + 16))();
  dispatch_group_leave(*(dispatch_group_t *)(*(_QWORD *)(a1 + 32) + 56));
  ldap_operation_release(*(id *)(a1 + 40));
}

void _o_ldap_wakeup(uint64_t a1)
{
  unint64_t *v2;
  uint64_t v3;
  uint64_t v4;
  _QWORD *v5;
  _QWORD *v6;
  unint64_t v7;
  int v8;
  uint64_t v9;
  SSLContext *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  int v15;
  size_t processed;
  uint8_t buf[4];
  uint64_t v18;
  __int16 v19;
  int v20;
  __int16 v21;
  int v22;
  __int16 v23;
  int v24;
  uint64_t v25;

  v25 = *MEMORY[0x24BDAC8D0];
  dispatch_assert_queue_V2(*(dispatch_queue_t *)(a1 + 64));
  v2 = (unint64_t *)(a1 + 112);
  if (*(uint64_t *)(a1 + 112) <= 99)
  {
    v3 = *(_QWORD *)(a1 + 88);
    if (v3)
    {
      v4 = *(_QWORD *)(v3 + 8);
      v5 = *(_QWORD **)(v3 + 16);
      if (v4)
      {
        *(_QWORD *)(v4 + 16) = v5;
        v5 = *(_QWORD **)(v3 + 16);
      }
      else
      {
        *(_QWORD *)(a1 + 96) = v5;
      }
      *v5 = v4;
      *(_QWORD *)(v3 + 8) = 0;
      v6 = *(_QWORD **)(a1 + 80);
      *(_QWORD *)(v3 + 16) = v6;
      *v6 = v3;
      *(_QWORD *)(a1 + 80) = v3 + 8;
      do
        v7 = __ldaxr(v2);
      while (__stlxr(v7 + 1, v2));
      if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_INFO))
      {
        v8 = *(_DWORD *)(v3 + 80);
        v9 = *(_QWORD *)(v3 + 96);
        *(_DWORD *)buf = 134218496;
        v18 = a1;
        v19 = 1024;
        v20 = v8;
        v21 = 1024;
        v22 = v9;
        _os_log_impl(&dword_215173000, MEMORY[0x24BDACB70], OS_LOG_TYPE_INFO, "connection: %p, ldap msgid: %d, send data size: %d", buf, 0x18u);
      }
      v10 = *(SSLContext **)(a1 + 128);
      if (v10)
      {
        processed = 0;
        v11 = SSLWrite(v10, *(const void **)(v3 + 88), *(_QWORD *)(v3 + 96), &processed);
        if ((_DWORD)v11)
        {
          if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
          {
            v15 = *(_DWORD *)(v3 + 80);
            *(_DWORD *)buf = 134218752;
            v18 = a1;
            v19 = 1024;
            v20 = v15;
            v21 = 1024;
            v22 = processed;
            v23 = 1024;
            v24 = v11;
            _os_log_error_impl(&dword_215173000, MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR, "connection: %p, ldap msgid: %d, SSL processed: %d, SSL error: %{AppleLDAPTypes:errSSL}d", buf, 0x1Eu);
          }
          goto LABEL_14;
        }
        if (!*(_QWORD *)(v3 + 24))
        {
LABEL_14:
          v12 = *(_QWORD *)(v3 + 32);
          v13 = v3;
          v14 = v11;
LABEL_20:
          _o_operation_complete(v12, v13, v14);
        }
      }
      else
      {
        if (!*(_QWORD *)(a1 + 120))
        {
          v12 = a1;
          v13 = v3;
          v14 = 10001;
          goto LABEL_20;
        }
        ldap_operation_retain((id)v3);
        tcp_connection_write_buffer();
      }
      _schedule_read(a1);
    }
  }
}

void ___o_ldap_wakeup_block_invoke(uint64_t a1, int a2)
{
  uint64_t v4;
  NSObject *v5;
  _QWORD *v6;
  _QWORD v7[5];
  int v8;

  if (a2)
  {
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      ___o_ldap_wakeup_block_invoke_cold_1();
    goto LABEL_4;
  }
  v6 = *(_QWORD **)(a1 + 32);
  if (!v6[3])
  {
LABEL_4:
    v4 = *(_QWORD *)(a1 + 32);
    v5 = *(NSObject **)(*(_QWORD *)(v4 + 32) + 64);
    v7[0] = MEMORY[0x24BDAC760];
    v7[1] = 0x40000000;
    v7[2] = ___o_ldap_wakeup_block_invoke_65;
    v7[3] = &__block_descriptor_tmp_66;
    v7[4] = v4;
    v8 = a2;
    dispatch_barrier_async(v5, v7);
    return;
  }
  ldap_operation_release(v6);
}

void ___o_ldap_wakeup_block_invoke_65(uint64_t a1)
{
  _o_operation_complete(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 32), *(_QWORD *)(a1 + 32), *(unsigned int *)(a1 + 40));
  ldap_operation_release(*(id *)(a1 + 32));
}

void ___o_query_result_block_invoke(uint64_t a1)
{
  (*(void (**)(void))(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 104) + 16))();
  CFRelease(*(CFTypeRef *)(a1 + 48));
  ldap_operation_release(*(id *)(a1 + 40));
}

void ___tls_handshake_loop_block_invoke(uint64_t a1)
{
  const void *v2;

  SSLClose(*(SSLContextRef *)(*(_QWORD *)(a1 + 32) + 128));
  v2 = *(const void **)(*(_QWORD *)(a1 + 32) + 128);
  if (v2)
  {
    CFRelease(v2);
    *(_QWORD *)(*(_QWORD *)(a1 + 32) + 128) = 0;
  }
}

void ___fail_host_block_invoke(uint64_t a1)
{
  uint64_t v2;
  char *v6;
  uint64_t v7;
  uint64_t v8;
  _QWORD *v9;
  uint64_t v10;
  int v11;
  _OWORD v12[2];
  uint8_t buf[4];
  uint64_t v14;
  __int16 v15;
  int v16;
  __int16 v17;
  int v18;
  __int16 v19;
  _OWORD *v20;
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
  if (*(_QWORD *)(*(_QWORD *)(a1 + 32) + 120))
  {
    memset(v12, 0, 28);
    if (tcp_connection_get_remote())
    {
      v2 = *(_QWORD *)(a1 + 32) + 224;
      while (1)
      {
        v2 = *(_QWORD *)v2;
        if (!v2)
          break;
        if (*(_QWORD *)(v2 + 16) == *(_QWORD *)&v12[0]
          && *(_QWORD *)(v2 + 24) == *((_QWORD *)&v12[0] + 1)
          && *(_QWORD *)(v2 + 32) == *(_QWORD *)&v12[1]
          && *(_DWORD *)(v2 + 40) == (unint64_t)DWORD2(v12[1]))
        {
          *(_DWORD *)(v2 + 44) = *(_DWORD *)(a1 + 40);
          *(_QWORD *)(v2 + 48) = time(0) + 60;
          return;
        }
      }
      v6 = (char *)malloc_type_calloc(1uLL, 0x38uLL, 0x10A0040C46062B5uLL);
      *((_DWORD *)v6 + 11) = *(_DWORD *)(a1 + 40);
      *((_QWORD *)v6 + 6) = time(0) + 60;
      *((_OWORD *)v6 + 1) = v12[0];
      *(_OWORD *)(v6 + 28) = *(_OWORD *)((char *)v12 + 12);
      v7 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 224);
      *(_QWORD *)v6 = v7;
      v8 = *(_QWORD *)(a1 + 32);
      if (v7)
        v9 = (_QWORD *)(*(_QWORD *)(v8 + 224) + 8);
      else
        v9 = (_QWORD *)(v8 + 232);
      *v9 = v6;
      *(_QWORD *)(*(_QWORD *)(a1 + 32) + 224) = v6;
      *((_QWORD *)v6 + 1) = *(_QWORD *)(a1 + 32) + 224;
      if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
      {
        v10 = *(_QWORD *)(a1 + 32);
        v11 = *(_DWORD *)(a1 + 40);
        *(_DWORD *)buf = 134218754;
        v14 = v10;
        v15 = 1024;
        v16 = v11;
        v17 = 1040;
        v18 = LOBYTE(v12[0]);
        v19 = 2098;
        v20 = v12;
        _os_log_impl(&dword_215173000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT, "failed connection: %p, error: %{AppleLDAPTypes:ldap_error_t}d, addres: %{public,network:sockaddr}.*P", buf, 0x22u);
      }
    }
  }
}

void ___o_read_rootdse_block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, int a4)
{
  uint64_t v6;
  NSObject *v7;
  uint64_t v8;
  _QWORD v9[6];

  v6 = *(_QWORD *)(a1 + 32);
  v7 = *(NSObject **)(v6 + 208);
  v9[0] = MEMORY[0x24BDAC760];
  v9[1] = 0x40000000;
  v9[2] = ___o_read_rootdse_block_invoke_2;
  v9[3] = &__block_descriptor_tmp_71;
  v9[4] = v6;
  v9[5] = a3;
  dispatch_barrier_sync(v7, v9);
  v8 = *(_QWORD *)(a1 + 32);
  *(_DWORD *)(v8 + 292) = a4;
  dispatch_barrier_sync_f(*(dispatch_queue_t *)(v8 + 8), (void *)v8, (dispatch_function_t)_s_next_state);
}

void ___o_read_rootdse_block_invoke_2(uint64_t a1)
{
  const void *v2;
  const __CFDictionary *v3;
  const __CFArray *Value;
  const __CFArray *v5;
  CFIndex Count;
  CFIndex v7;
  CFIndex i;
  __CFSet *v9;
  const void *ValueAtIndex;

  v2 = *(const void **)(*(_QWORD *)(a1 + 32) + 152);
  if (v2)
  {
    CFRelease(v2);
    *(_QWORD *)(*(_QWORD *)(a1 + 32) + 152) = 0;
  }
  *(_QWORD *)(*(_QWORD *)(a1 + 32) + 152) = CFSetCreateMutable((CFAllocatorRef)*MEMORY[0x24BDBD240], 0, MEMORY[0x24BDBD6B8]);
  v3 = *(const __CFDictionary **)(a1 + 40);
  if (v3)
  {
    Value = (const __CFArray *)CFDictionaryGetValue(v3, (const void *)LDAP_SUPPORTED_SASL_MECHANISMS);
    if (Value)
    {
      v5 = Value;
      Count = CFArrayGetCount(Value);
      if (Count >= 1)
      {
        v7 = Count;
        for (i = 0; i != v7; ++i)
        {
          v9 = *(__CFSet **)(*(_QWORD *)(a1 + 32) + 152);
          ValueAtIndex = CFArrayGetValueAtIndex(v5, i);
          CFSetAddValue(v9, ValueAtIndex);
        }
      }
    }
  }
  CFSetAddValue(*(CFMutableSetRef *)(*(_QWORD *)(a1 + 32) + 152), CFSTR("simple"));
}

void _o_ldap_basic_auth(uint64_t a1, const __CFDictionary *a2)
{
  const __CFString *Value;
  const __CFString *v5;
  _QWORD *v6;
  char *v7;
  int v8;
  _QWORD v9[5];
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _OWORD v13[5];

  if (!_ldap_mechopts_has_valid_dn(a2))
  {
    v8 = 34;
LABEL_13:
    *(_DWORD *)(a1 + 292) = v8;
    _ldap_next_authmechanism((void *)a1);
    return;
  }
  if ((*(_WORD *)(a1 + 288) & 0x4023) == 0)
  {
    v8 = 8;
    goto LABEL_13;
  }
  dispatch_assert_queue_V2(*(dispatch_queue_t *)(a1 + 64));
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  memset(v13, 0, sizeof(v13));
  DWORD2(v10) = 1;
  LODWORD(v11) = 3;
  DWORD2(v12) = 1;
  if (a2)
  {
    Value = (const __CFString *)CFDictionaryGetValue(a2, (const void *)LDAP_MECHANISM_OPTION_RECORD_DN);
    if (Value)
      _fill_cstring_from_cfstring((char **)&v12, Value, (char **)&v11 + 1);
    v5 = (const __CFString *)CFDictionaryGetValue(a2, (const void *)LDAP_MECHANISM_OPTION_PASSWORD);
    if (v5)
      _fill_cstring_from_cfstring((char **)v13 + 1, v5, (char **)v13);
  }
  v9[0] = MEMORY[0x24BDAC760];
  v9[1] = 0x40000000;
  v9[2] = ___o_ldap_basic_auth_block_invoke;
  v9[3] = &__block_descriptor_tmp_76;
  v9[4] = a1;
  v6 = _ldap_base_operation_create((void *)a1, 104, 512, (uint64_t)_dispose_simple, v9);
  v7 = (char *)_ldap_operation_simple_init((uint64_t)v6, &v10);
  if (!_enqueue_operation_with_release(a1, v7))
    dispatch_barrier_sync_f(*(dispatch_queue_t *)(a1 + 8), (void *)a1, (dispatch_function_t)_s_next_state);
  free_LDAPMessage();
}

void _o_ldap_crammd5_auth(uint64_t a1, const __CFDictionary *a2)
{
  _QWORD *v4;
  char *v5;
  _QWORD v6[6];
  _OWORD v7[8];

  dispatch_assert_queue_V2(*(dispatch_queue_t *)(a1 + 64));
  if (_ldap_mechopts_has_valid_dn(a2))
  {
    memset(v7, 0, sizeof(v7));
    _ldap_sasl_fill((uint64_t)v7, CFSTR("CRAM-MD5"), a2, 0);
    v6[0] = MEMORY[0x24BDAC760];
    v6[1] = 0x40000000;
    v6[2] = ___o_ldap_crammd5_auth_block_invoke;
    v6[3] = &__block_descriptor_tmp_81;
    v6[4] = a1;
    v6[5] = a2;
    v4 = _ldap_base_operation_create((void *)a1, 104, 512, (uint64_t)_dispose_simple, v6);
    v5 = (char *)_ldap_operation_simple_init((uint64_t)v4, v7);
    free_LDAPMessage();
    if (!_enqueue_operation_with_release(a1, v5))
      dispatch_barrier_sync_f(*(dispatch_queue_t *)(a1 + 8), (void *)a1, (dispatch_function_t)_s_next_state);
  }
  else
  {
    *(_DWORD *)(a1 + 292) = 34;
    _ldap_next_authmechanism((void *)a1);
  }
}

void _o_ldap_digestmd5_auth(uint64_t a1, const __CFDictionary *a2)
{
  _QWORD *v4;
  char *v5;
  _QWORD v6[6];
  _OWORD v7[8];

  dispatch_assert_queue_V2(*(dispatch_queue_t *)(a1 + 64));
  if (_ldap_mechopts_has_valid_dn(a2))
  {
    memset(v7, 0, sizeof(v7));
    _ldap_sasl_fill((uint64_t)v7, CFSTR("DIGEST-MD5"), a2, 0);
    v6[0] = MEMORY[0x24BDAC760];
    v6[1] = 0x40000000;
    v6[2] = ___o_ldap_digestmd5_auth_block_invoke;
    v6[3] = &__block_descriptor_tmp_83;
    v6[4] = a1;
    v6[5] = a2;
    v4 = _ldap_base_operation_create((void *)a1, 104, 512, (uint64_t)_dispose_simple, v6);
    v5 = (char *)_ldap_operation_simple_init((uint64_t)v4, v7);
    free_LDAPMessage();
    if (!_enqueue_operation_with_release(a1, v5))
      _ldap_next_authmechanism((void *)a1);
  }
  else
  {
    *(_DWORD *)(a1 + 292) = 34;
    _ldap_next_authmechanism((void *)a1);
  }
}

uint64_t _o_ldap_gssapi_auth(uint64_t a1, const void *a2)
{
  void *v4;
  const void *Value;
  const void *v6;
  gss_buffer_desc_struct input_name_buffer;
  OM_uint32 minor_status;

  v4 = malloc_type_malloc(0x28uLL, 0x600409743DB05uLL);
  dispatch_assert_queue_V2(*(dispatch_queue_t *)(a1 + 64));
  *(_QWORD *)v4 = CFRetain(a2);
  Value = CFDictionaryGetValue((CFDictionaryRef)a2, (const void *)LDAP_MECHANISM_OPTION_GSSAPI_INITIATOR_CREDENTIAL);
  *((_QWORD *)v4 + 2) = 0;
  *((_QWORD *)v4 + 3) = Value;
  *((_QWORD *)v4 + 1) = 0;
  v6 = CFDictionaryGetValue((CFDictionaryRef)a2, (const void *)LDAP_MECHANISM_OPTION_GSSAPI_TARGET_NAME);
  *((_QWORD *)v4 + 4) = v6;
  if (v6)
  {
    CFRetain(v6);
  }
  else if ((*(_BYTE *)(a1 + 289) & 4) != 0)
  {
    minor_status = 0;
    input_name_buffer.length = 0;
    input_name_buffer.value = 0;
    input_name_buffer.length = asprintf((char **)&input_name_buffer.value, "ldap@%s", *(const char **)(a1 + 264));
    gss_import_name(&minor_status, &input_name_buffer, MEMORY[0x24BDD1A60], (gss_name_t *)v4 + 4);
    gss_release_buffer(&minor_status, &input_name_buffer);
  }
  return _o_ldap_gssapi_negotiate(a1, (CFDictionaryRef *)v4, 0);
}

void _o_ldap_srp_auth(uint64_t a1, const __CFDictionary *a2)
{
  _QWORD *v4;
  char *v5;
  _QWORD v6[7];
  _OWORD v7[8];

  dispatch_assert_queue_V2(*(dispatch_queue_t *)(a1 + 64));
  if (_ldap_mechopts_has_valid_dn(a2))
  {
    memset(v7, 0, sizeof(v7));
    _ldap_sasl_fill((uint64_t)v7, CFSTR("SRP"), a2, 0);
    v6[0] = MEMORY[0x24BDAC760];
    v6[1] = 0x40000000;
    v6[2] = ___o_ldap_srp_auth_block_invoke;
    v6[3] = &__block_descriptor_tmp_99;
    v6[4] = a1;
    v6[5] = a2;
    v6[6] = 0;
    v4 = _ldap_base_operation_create((void *)a1, 104, 512, (uint64_t)_dispose_simple, v6);
    v5 = (char *)_ldap_operation_simple_init((uint64_t)v4, v7);
    free_LDAPMessage();
    if (!_enqueue_operation_with_release(a1, v5))
      dispatch_barrier_sync_f(*(dispatch_queue_t *)(a1 + 8), (void *)a1, (dispatch_function_t)_s_next_state);
  }
  else
  {
    *(_DWORD *)(a1 + 292) = 34;
    _ldap_next_authmechanism((void *)a1);
  }
}

BOOL _ldap_mechopts_has_valid_dn(const __CFDictionary *a1)
{
  const __CFString *Value;
  char *v2;
  char *v3;
  _BOOL8 v4;
  void *v6;

  Value = (const __CFString *)CFDictionaryGetValue(a1, (const void *)LDAP_MECHANISM_OPTION_RECORD_DN);
  if (!Value)
    return 0;
  v6 = 0;
  v2 = _cstr_from_cfstring(Value, (char **)&v6);
  v3 = _short_username_from_dn(v2);
  v4 = v3 != 0;
  if (v3)
    free(v3);
  if (v6)
    free(v6);
  return v4;
}

void _ldap_next_authmechanism(void *context)
{
  uint64_t *v2;
  uint64_t v3;
  NSObject *v4;
  _QWORD v5[6];

  v2 = (uint64_t *)*((_QWORD *)context + 21);
  if (v2 && (v3 = *v2) != 0)
  {
    *((_QWORD *)context + 21) = v3;
    ldap_connection_retain(context);
    v4 = *((_QWORD *)context + 8);
    v5[0] = MEMORY[0x24BDAC760];
    v5[1] = 0x40000000;
    v5[2] = ___ldap_next_authmechanism_block_invoke;
    v5[3] = &__block_descriptor_tmp_78;
    v5[4] = v3;
    v5[5] = context;
    dispatch_barrier_async(v4, v5);
  }
  else
  {
    dispatch_barrier_sync_f(*((dispatch_queue_t *)context + 1), context, (dispatch_function_t)_s_next_state);
  }
}

void ___o_ldap_basic_auth_block_invoke(uint64_t a1, uint64_t a2, int a3)
{
  uint64_t v3;

  v3 = *(_QWORD *)(a1 + 32);
  *(_DWORD *)(v3 + 292) = a3;
  dispatch_barrier_sync_f(*(dispatch_queue_t *)(v3 + 8), (void *)v3, (dispatch_function_t)_s_next_state);
}

char *_short_username_from_dn(const char *a1)
{
  size_t v2;
  uint64_t v3;
  int v4;
  int v5;
  int v6;
  char v7;
  uint64_t v8;
  uint64_t v9;
  char v10;
  uint64_t v11;
  uint64_t v12;
  __darwin_ct_rune_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  _BYTE *v21;
  char v22;
  const char *v23;
  _BYTE *v24;
  int v26;
  char *v27;
  _BYTE *v29;
  size_t v30;
  _QWORD v31[2];
  uint64_t (*v32)(uint64_t);
  void *v33;
  uint64_t *v34;
  uint64_t *v35;
  uint64_t v36;
  uint64_t *v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t *v41;
  uint64_t v42;
  void *v43;

  v2 = strlen(a1);
  v40 = 0;
  v41 = &v40;
  v42 = 0x2000000000;
  v43 = 0;
  v43 = malloc_type_malloc(v2 + 1, 0xBBC67D4CuLL);
  v36 = 0;
  v37 = &v36;
  v38 = 0x2000000000;
  v39 = 0;
  v31[0] = MEMORY[0x24BDAC760];
  v31[1] = 0x40000000;
  v32 = ___dn_normalize_block_invoke;
  v33 = &unk_24D2AF7E0;
  v34 = &v36;
  v35 = &v40;
  if (v2)
  {
    v3 = 0;
    v4 = 1;
    v5 = 1;
    while (1)
    {
      v6 = a1[v3];
      v7 = a1[v3];
      if (v6 > 60)
      {
        if (v6 == 61)
        {
          v5 = 0;
          v16 = v41[3];
          v17 = v37[3];
          v37[3] = v17 + 1;
          *(_BYTE *)(v16 + v17) = v7;
          goto LABEL_18;
        }
        if (v6 == 92)
        {
          v10 = 92;
          if ((v5 & 1) != 0)
            v10 = __tolower(92);
          v11 = v41[3];
          v12 = v37[3];
          v37[3] = v12 + 1;
          *(_BYTE *)(v11 + v12) = v10;
          if (++v3 < v2)
          {
            v13 = a1[v3];
            if ((v5 & 1) != 0)
              LOBYTE(v13) = __tolower(v13);
            v18 = v41[3];
            v19 = v37[3];
            v37[3] = v19 + 1;
            *(_BYTE *)(v18 + v19) = v13;
          }
          goto LABEL_19;
        }
        goto LABEL_16;
      }
      if (v6 != 32)
        break;
      if (((v5 | v4) & 1) == 0)
      {
        v5 = 0;
LABEL_16:
        v4 = 0;
        v14 = v41[3];
        v15 = v37[3];
        v37[3] = v15 + 1;
        *(_BYTE *)(v14 + v15) = v7;
      }
LABEL_19:
      if (++v3 >= v2)
      {
        v20 = v37[3];
        goto LABEL_23;
      }
    }
    if (v6 == 44)
    {
      v32((uint64_t)v31);
      v8 = v41[3];
      v9 = v37[3];
      v37[3] = v9 + 1;
      *(_BYTE *)(v8 + v9) = v7;
      v5 = 1;
LABEL_18:
      v4 = 1;
      goto LABEL_19;
    }
    goto LABEL_16;
  }
  v20 = 0;
LABEL_23:
  *(_BYTE *)(v41[3] + v20) = 0;
  v21 = (_BYTE *)v41[3];
  _Block_object_dispose(&v36, 8);
  _Block_object_dispose(&v40, 8);
  v22 = *v21;
  if (!*v21)
    goto LABEL_32;
  v23 = 0;
  v24 = v21;
  while (1)
  {
    if (v22 == 61)
    {
      v23 = v24 + 1;
      goto LABEL_31;
    }
    if (v22 == 92)
    {
      if (!*++v24)
        goto LABEL_32;
      goto LABEL_31;
    }
    if (v22 == 44)
      break;
LABEL_31:
    v26 = *++v24;
    v22 = v26;
    if (!v26)
      goto LABEL_32;
  }
  if (v23)
  {
    v29 = &v24[~(unint64_t)v23];
    v30 = (size_t)(v29 + 2);
    if (v29 != (_BYTE *)-2)
    {
      v27 = (char *)malloc_type_malloc((size_t)(v29 + 2), 0xDDC719D8uLL);
      strlcpy(v27, v23, v30);
      goto LABEL_33;
    }
  }
LABEL_32:
  v27 = 0;
LABEL_33:
  free(v21);
  return v27;
}

uint64_t ___dn_normalize_block_invoke(uint64_t result)
{
  uint64_t v1;
  uint64_t v2;
  int v3;

  v1 = *(_QWORD *)(*(_QWORD *)(result + 32) + 8);
  v2 = *(_QWORD *)(v1 + 24) - 1;
  while (v2)
  {
    v3 = *(unsigned __int8 *)(*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(result + 40) + 8) + 24) + v2--);
    if (v3 != 32)
    {
      *(_QWORD *)(v1 + 24) = v2 + 2;
      return result;
    }
  }
  return result;
}

void ___ldap_next_authmechanism_block_invoke(uint64_t a1)
{
  (*(void (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 32) + 24))(*(_QWORD *)(a1 + 40), *(_QWORD *)(*(_QWORD *)(a1 + 32) + 16));
  ldap_connection_release(*(id *)(a1 + 40));
}

char *_ldap_sasl_fill(uint64_t a1, const __CFString *a2, CFDictionaryRef theDict, uint64_t a4)
{
  char *result;

  *(_OWORD *)a1 = 0u;
  *(_OWORD *)(a1 + 16) = 0u;
  *(_OWORD *)(a1 + 96) = 0u;
  *(_OWORD *)(a1 + 112) = 0u;
  *(_OWORD *)(a1 + 64) = 0u;
  *(_OWORD *)(a1 + 80) = 0u;
  *(_OWORD *)(a1 + 32) = 0u;
  *(_OWORD *)(a1 + 48) = 0u;
  *(_DWORD *)(a1 + 8) = 1;
  *(_DWORD *)(a1 + 16) = 3;
  *(_DWORD *)(a1 + 40) = 2;
  *(_QWORD *)(a1 + 64) = a4;
  if (a2)
    _fill_cstring_from_cfstring((char **)(a1 + 56), a2, (char **)(a1 + 48));
  result = (char *)CFDictionaryGetValue(theDict, (const void *)LDAP_MECHANISM_OPTION_RECORD_DN);
  if (result)
    return _fill_cstring_from_cfstring((char **)(a1 + 32), (const __CFString *)result, (char **)(a1 + 24));
  return result;
}

void ___o_ldap_crammd5_auth_block_invoke(uint64_t a1, uint64_t a2, int a3)
{
  const __CFString *Value;
  const __CFString *v5;
  uint64_t v6;
  char *v7;
  char *v8;
  char *v9;
  int v10;
  uint64_t v11;
  _QWORD *v12;
  char *v13;
  void *v14;
  _QWORD *v15;
  char *v16;
  _QWORD v17[5];
  _OWORD v18[8];
  char *v19;
  char *v20;
  char *v21;

  if (_ldap_continue_sasl(*(void **)(a1 + 32), a3))
  {
    Value = (const __CFString *)CFDictionaryGetValue(*(CFDictionaryRef *)(a1 + 40), (const void *)LDAP_MECHANISM_OPTION_RECORD_DN);
    v5 = (const __CFString *)CFDictionaryGetValue(*(CFDictionaryRef *)(a1 + 40), (const void *)LDAP_MECHANISM_OPTION_PASSWORD);
    v21 = 0;
    _cstr_from_cfstring(v5, &v21);
    v6 = heim_cram_md5_create();
    if (v6)
    {
      v7 = (char *)v6;
      v20 = 0;
      v8 = _cstr_from_cfstring(Value, &v20);
      v9 = _short_username_from_dn(v8);
      v19 = 0;
      v10 = asprintf(&v19, "%s %s", v9, v7);
      if (v10 == -1)
      {
        v16 = 0;
      }
      else
      {
        v11 = v10;
        v12 = malloc_type_malloc(0x10uLL, 0x108004057E67DB5uLL);
        memset(v18, 0, sizeof(v18));
        v13 = v19;
        *v12 = v11;
        v12[1] = v13;
        _ldap_sasl_fill((uint64_t)v18, CFSTR("CRAM-MD5"), *(CFDictionaryRef *)(a1 + 40), (uint64_t)v12);
        v14 = *(void **)(a1 + 32);
        v17[0] = MEMORY[0x24BDAC760];
        v17[1] = 0x40000000;
        v17[2] = ___o_ldap_crammd5_auth_block_invoke_2;
        v17[3] = &__block_descriptor_tmp_80;
        v17[4] = v14;
        v15 = _ldap_base_operation_create(v14, 104, 512, (uint64_t)_dispose_simple, v17);
        v16 = (char *)_ldap_operation_simple_init((uint64_t)v15, v18);
        free_LDAPMessage();
      }
      if (v20)
        free(v20);
      if (v9)
        free(v9);
      free(v7);
    }
    else
    {
      v16 = 0;
    }
    if (v21)
    {
      free(v21);
      v21 = 0;
    }
    if (!_enqueue_operation_with_release(*(_QWORD *)(a1 + 32), v16))
      _ldap_next_authmechanism(*(void **)(a1 + 32));
  }
}

BOOL _ldap_continue_sasl(void *context, int a2)
{
  _BOOL8 v4;
  _BOOL8 result;

  v4 = a2 == 0;
  if (!a2)
  {
LABEL_8:
    *((_DWORD *)context + 73) = a2;
    dispatch_barrier_sync_f(*((dispatch_queue_t *)context + 1), context, (dispatch_function_t)_s_next_state);
    return v4;
  }
  if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
    _ldap_continue_sasl_cold_1();
  result = 0;
  if (a2 <= 47)
  {
    if (a2 != 7)
    {
      if (a2 != 14)
        return result;
      if (*((_QWORD *)context + 17))
        return 1;
      _os_assumes_log();
    }
  }
  else if (a2 != 48)
  {
    if (a2 != 80)
    {
      if (a2 != 49)
        return result;
      goto LABEL_8;
    }
    *((_DWORD *)context + 73) = 49;
    dispatch_barrier_sync_f(*((dispatch_queue_t *)context + 1), context, (dispatch_function_t)_s_next_state);
    return 0;
  }
  *((_DWORD *)context + 73) = a2;
  _ldap_next_authmechanism(context);
  return 0;
}

BOOL ___o_ldap_crammd5_auth_block_invoke_2(uint64_t a1, uint64_t a2, int a3)
{
  return _ldap_continue_sasl(*(void **)(a1 + 32), a3);
}

void ___o_ldap_digestmd5_auth_block_invoke(uint64_t a1, uint64_t a2, int a3)
{
  const __CFDictionary *v4;
  uint64_t v5;
  char *v6;
  const __CFString *Value;
  const __CFString *v8;
  char *v9;
  char *v10;
  uint64_t response;
  const char *v12;
  _QWORD *v13;
  void *v14;
  _QWORD *v15;
  _QWORD v16[7];
  char *v17[2];
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  uint64_t v25;
  char *v26;
  char *v27;

  if (_ldap_continue_sasl(*(void **)(a1 + 32), a3))
  {
    v25 = 0;
    v26 = 0;
    v5 = *(_QWORD *)(a1 + 32);
    v4 = *(const __CFDictionary **)(a1 + 40);
    v17[0] = 0;
    v27 = 0;
    v6 = (char *)heim_digest_create();
    if (v6)
    {
      Value = (const __CFString *)CFDictionaryGetValue(v4, (const void *)LDAP_MECHANISM_OPTION_RECORD_DN);
      v8 = (const __CFString *)CFDictionaryGetValue(v4, (const void *)LDAP_MECHANISM_OPTION_PASSWORD);
      if (heim_digest_parse_challenge())
      {
        v9 = 0;
      }
      else
      {
        v10 = _cstr_from_cfstring(Value, &v27);
        v9 = _short_username_from_dn(v10);
        if ((*(_BYTE *)(v5 + 289) & 0x14) != 0 && *(_QWORD *)(v5 + 264))
          asprintf(v17, "ldap/%s", *(const char **)(v5 + 264));
        heim_digest_set_key();
        heim_digest_set_key();
        _cstr_from_cfstring(v8, &v26);
        heim_digest_set_key();
        if (v26)
          free(v26);
      }
      if (v27)
        free(v27);
      if (v9)
        free(v9);
    }
    if (v17[0])
      free(v17[0]);
    if (v6)
    {
      response = heim_digest_create_response();
      if (response)
      {
        v12 = (const char *)response;
        v13 = malloc_type_malloc(0x10uLL, 0x108004057E67DB5uLL);
        v23 = 0u;
        v24 = 0u;
        v22 = 0u;
        v20 = 0u;
        v21 = 0u;
        v18 = 0u;
        v19 = 0u;
        *(_OWORD *)v17 = 0u;
        v13[1] = v12;
        *v13 = strlen(v12);
        _ldap_sasl_fill((uint64_t)v17, CFSTR("DIGEST-MD5"), *(CFDictionaryRef *)(a1 + 40), (uint64_t)v13);
        v14 = *(void **)(a1 + 32);
        v16[0] = MEMORY[0x24BDAC760];
        v16[1] = 0x40000000;
        v16[2] = ___o_ldap_digestmd5_auth_block_invoke_2;
        v16[3] = &__block_descriptor_tmp_82;
        v16[4] = v14;
        v16[5] = v25;
        v16[6] = v6;
        v15 = _ldap_base_operation_create(v14, 104, 512, (uint64_t)_dispose_simple, v16);
        v6 = (char *)_ldap_operation_simple_init((uint64_t)v15, v17);
        *v13 = 0;
        v13[1] = 0;
        free_LDAPMessage();
      }
      else
      {
        heim_digest_release();
        v6 = 0;
      }
    }
    if (!_enqueue_operation_with_release(*(_QWORD *)(a1 + 32), v6))
      _ldap_next_authmechanism(*(void **)(a1 + 32));
  }
}

uint64_t ___o_ldap_digestmd5_auth_block_invoke_2(uint64_t a1, uint64_t a2, int a3)
{
  _QWORD **v5;
  int v6;
  uint64_t *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  NSObject *v16;
  _QWORD v18[3];
  int v19;

  if (a3)
  {
    if (a3 == 49)
    {
      if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
        ___o_ldap_digestmd5_auth_block_invoke_2_cold_2(a1);
      v5 = *(_QWORD ***)(a1 + 32);
      if (*v5[21])
      {
        v6 = 7;
LABEL_13:
        _ldap_continue_sasl(v5, v6);
        return heim_digest_release();
      }
    }
    else
    {
      v5 = *(_QWORD ***)(a1 + 32);
    }
    v6 = a3;
    goto LABEL_13;
  }
  v8 = *(_QWORD *)(a1 + 32);
  v7 = (uint64_t *)(a1 + 32);
  if (!strcmp(*(const char **)(v8 + 136), *(const char **)(a1 + 40)))
  {
    *(_DWORD *)(v8 + 292) = 0;
    v16 = *(NSObject **)(v8 + 8);
    v15 = v8;
  }
  else
  {
    memset(v18, 0, sizeof(v18));
    v19 = 0;
    tcp_connection_get_remote();
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      ___o_ldap_digestmd5_auth_block_invoke_2_cold_1(a1 + 32, (uint64_t)v18, v9, v10, v11, v12, v13, v14);
    v15 = *v7;
    *(_DWORD *)(v15 + 292) = 10004;
    v16 = *(NSObject **)(v15 + 8);
  }
  dispatch_barrier_sync_f(v16, (void *)v15, (dispatch_function_t)_s_next_state);
  return heim_digest_release();
}

uint64_t _o_ldap_gssapi_negotiate(uint64_t a1, CFDictionaryRef *a2, gss_buffer_desc_struct *a3)
{
  OM_uint32 inited;
  _QWORD *v7;
  _QWORD *v8;
  void *value;
  _QWORD *v11;
  char *v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _QWORD v21[6];
  _QWORD v22[6];
  OM_uint32 time_rec;
  OM_uint32 minor_status[2];
  gss_buffer_desc_struct buffer;

  buffer.length = 0;
  buffer.value = 0;
  *(_QWORD *)minor_status = 0;
  time_rec = 0;
  dispatch_assert_queue_V2(*(dispatch_queue_t *)(a1 + 64));
  inited = gss_init_sec_context(&minor_status[1], a2[3], a2 + 1, a2[4], 0, 6u, 0, (gss_channel_bindings_t)a2[2], a3, 0, &buffer, minor_status, &time_rec);
  if (inited)
  {
    if (inited == 1)
    {
      if (buffer.length)
      {
        v22[0] = MEMORY[0x24BDAC760];
        v22[1] = 0x40000000;
        v22[2] = ___o_ldap_gssapi_negotiate_block_invoke;
        v22[3] = &__block_descriptor_tmp_91;
        v22[4] = a1;
        v22[5] = a2;
        v19 = 0u;
        v20 = 0u;
        v17 = 0u;
        v18 = 0u;
        v15 = 0u;
        v16 = 0u;
        v7 = v22;
        v13 = 0u;
        v14 = 0u;
        goto LABEL_6;
      }
    }
    else
    {
      *(_DWORD *)(a1 + 292) = 7;
      _free_ldap_gss_context(a2);
      _ldap_next_authmechanism((void *)a1);
    }
    return gss_release_buffer(&minor_status[1], &buffer);
  }
  v21[0] = MEMORY[0x24BDAC760];
  v21[1] = 0x40000000;
  v21[2] = ___o_ldap_gssapi_negotiate_block_invoke_3;
  v21[3] = &__block_descriptor_tmp_93;
  v21[4] = a1;
  v21[5] = a2;
  v19 = 0u;
  v20 = 0u;
  v17 = 0u;
  v18 = 0u;
  v15 = 0u;
  v16 = 0u;
  v7 = v21;
  v13 = 0u;
  v14 = 0u;
  if (!buffer.length)
  {
    v8 = 0;
    goto LABEL_10;
  }
LABEL_6:
  v8 = malloc_type_malloc(0x10uLL, 0x108004057E67DB5uLL);
  value = buffer.value;
  *v8 = buffer.length;
  v8[1] = value;
LABEL_10:
  _ldap_sasl_fill((uint64_t)&v13, CFSTR("GSSAPI"), *a2, (uint64_t)v8);
  v11 = _ldap_base_operation_create((void *)a1, 104, 512, (uint64_t)_dispose_simple, v7);
  v12 = (char *)_ldap_operation_simple_init((uint64_t)v11, &v13);
  if (!_enqueue_operation_with_release(a1, v12))
  {
    *(_DWORD *)(a1 + 292) = 7;
    _free_ldap_gss_context(a2);
    _ldap_next_authmechanism((void *)a1);
  }
  return free_LDAPMessage();
}

void ___o_ldap_gssapi_negotiate_block_invoke(uint64_t a1, uint64_t a2, int a3)
{
  _QWORD v4[4];

  if (_ldap_continue_sasl(*(void **)(a1 + 32), a3))
  {
    v4[0] = MEMORY[0x24BDAC760];
    v4[1] = 0x40000000;
    v4[2] = ___o_ldap_gssapi_negotiate_block_invoke_2;
    v4[3] = &__block_descriptor_tmp_90;
    dispatch_sync(*(dispatch_queue_t *)(*(_QWORD *)(a1 + 32) + 64), v4);
  }
  else
  {
    _free_ldap_gss_context(*(void **)(a1 + 40));
  }
}

void _free_ldap_gss_context(void *a1)
{
  const void *v2;
  void *v3;
  const void *v4;
  OM_uint32 minor_status;

  v2 = *(const void **)a1;
  if (v2)
  {
    CFRelease(v2);
    *(_QWORD *)a1 = 0;
  }
  v3 = (void *)*((_QWORD *)a1 + 2);
  if (v3)
  {
    free(v3);
    *((_QWORD *)a1 + 2) = 0;
  }
  minor_status = 0;
  if (*((_QWORD *)a1 + 1))
    gss_delete_sec_context(&minor_status, (gss_ctx_id_t *)a1 + 1, 0);
  *((_QWORD *)a1 + 3) = 0;
  v4 = (const void *)*((_QWORD *)a1 + 4);
  if (v4)
    CFRelease(v4);
  free(a1);
}

uint64_t ___o_ldap_gssapi_negotiate_block_invoke_2(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  _QWORD v5[2];

  v2 = *(_QWORD *)(a1 + 32);
  v1 = *(_QWORD *)(a1 + 40);
  v3 = *(_QWORD *)(v2 + 136);
  v5[0] = *(_QWORD *)(v2 + 144);
  v5[1] = v3;
  return _o_ldap_gssapi_negotiate(v2, v1, v5);
}

void ___o_ldap_gssapi_negotiate_block_invoke_3(uint64_t a1, uint64_t a2, int a3)
{
  _QWORD v4[4];

  if (_ldap_continue_sasl(*(void **)(a1 + 32), a3))
  {
    v4[0] = MEMORY[0x24BDAC760];
    v4[1] = 0x40000000;
    v4[2] = ___o_ldap_gssapi_negotiate_block_invoke_4;
    v4[3] = &__block_descriptor_tmp_92;
    dispatch_sync(*(dispatch_queue_t *)(*(_QWORD *)(a1 + 32) + 64), v4);
  }
  else
  {
    _free_ldap_gss_context(*(void **)(a1 + 40));
  }
}

uint64_t ___o_ldap_gssapi_negotiate_block_invoke_4(uint64_t a1)
{
  uint64_t v1;
  CFDictionaryRef *v2;
  void *v3;
  BOOL v4;
  int v5;
  const __CFBoolean *Value;
  const __CFBoolean *v7;
  _BYTE *v8;
  unsigned int *v9;
  unsigned int v10;
  unsigned int *v11;
  unsigned int v12;
  unsigned int v13;
  int v14;
  char v15;
  char v16;
  unsigned int *v17;
  unsigned int v18;
  unsigned int v19;
  unsigned int *v20;
  unsigned int v21;
  int v22;
  unsigned int *v23;
  unsigned int v24;
  unsigned int v25;
  _QWORD *v26;
  void *v27;
  _QWORD *v28;
  char *v29;
  gss_buffer_desc_struct v31;
  _QWORD v32[6];
  gss_buffer_desc_struct v33[8];
  gss_buffer_desc_struct v34;
  OM_uint32 minor_status;
  gss_buffer_desc_struct output_message_buffer;

  v1 = *(_QWORD *)(a1 + 32);
  v2 = *(CFDictionaryRef **)(a1 + 40);
  v3 = *(void **)(v1 + 136);
  v31.length = *(_QWORD *)(v1 + 144);
  v31.value = v3;
  output_message_buffer.length = 0;
  output_message_buffer.value = 0;
  minor_status = 0;
  dispatch_assert_queue_V2(*(dispatch_queue_t *)(v1 + 64));
  if (gss_unwrap(&minor_status, v2[1], &v31, &output_message_buffer, 0, (gss_qop_t *)(v1 + 192)))
    v4 = 0;
  else
    v4 = output_message_buffer.length >= 4;
  if (!v4)
    goto LABEL_5;
  Value = (const __CFBoolean *)CFDictionaryGetValue(*v2, (const void *)LDAP_MECHANISM_OPTION_GSSAPI_INTEGRITY);
  v7 = (const __CFBoolean *)CFDictionaryGetValue(*v2, (const void *)LDAP_MECHANISM_OPTION_GSSAPI_CONFIDENTIALITY);
  v8 = output_message_buffer.value;
  v34.length = 0;
  v34.value = 0;
  if (!v7)
  {
    v11 = (unsigned int *)(v1 + 288);
    if ((*(_BYTE *)output_message_buffer.value & 4) != 0)
    {
      do
        v13 = __ldaxr(v11);
      while (__stlxr(v13 | 0x20, v11));
      goto LABEL_16;
    }
    do
      v12 = __ldaxr(v11);
    while (__stlxr(v12 & 0xFFFFFFDF, v11));
LABEL_24:
    v14 = 0;
    v16 = 1;
    v15 = 2;
    if (!Value)
      goto LABEL_17;
    goto LABEL_25;
  }
  if (CFBooleanGetValue(v7) != 1)
  {
    *v8 &= ~4u;
    v20 = (unsigned int *)(v1 + 288);
    do
      v21 = __ldaxr(v20);
    while (__stlxr(v21 & 0xFFFFFFDF, v20));
    goto LABEL_24;
  }
  v9 = (unsigned int *)(v1 + 288);
  do
    v10 = __ldaxr(v9);
  while (__stlxr(v10 | 0x20, v9));
  if ((*v8 & 4) == 0)
  {
LABEL_5:
    v5 = 10004;
LABEL_34:
    *(_DWORD *)(v1 + 292) = v5;
    _free_ldap_gss_context(v2);
    _ldap_next_authmechanism((void *)v1);
    return gss_release_buffer(&minor_status, &output_message_buffer);
  }
LABEL_16:
  v14 = 1;
  v15 = 4;
  v16 = 4;
  if (!Value)
  {
LABEL_17:
    v17 = (unsigned int *)(v1 + 288);
    if ((*v8 & 2) == 0)
    {
      do
        v18 = __ldaxr(v17);
      while (__stlxr(v18 & 0xFFFFFFEF, v17));
LABEL_30:
      v15 = v16;
      goto LABEL_31;
    }
    do
      v19 = __ldaxr(v17);
    while (__stlxr(v19 | 0x10, v17));
    goto LABEL_31;
  }
LABEL_25:
  v22 = CFBooleanGetValue(Value);
  v23 = (unsigned int *)(v1 + 288);
  if (v22 != 1)
  {
    do
      v25 = __ldaxr(v23);
    while (__stlxr(v25 & 0xFFFFFFEF, v23));
    goto LABEL_30;
  }
  do
    v24 = __ldaxr(v23);
  while (__stlxr(v24 | 0x10, v23));
  if ((*v8 & 2) == 0)
    goto LABEL_5;
LABEL_31:
  *v8 = v15;
  if (gss_wrap(&minor_status, v2[1], v14, *(_DWORD *)(v1 + 192), &output_message_buffer, 0, &v34))
    goto LABEL_33;
  v26 = malloc_type_malloc(0x10uLL, 0x108004057E67DB5uLL);
  memset(v33, 0, sizeof(v33));
  v27 = v34.value;
  *v26 = v34.length;
  v26[1] = v27;
  _ldap_sasl_fill((uint64_t)v33, CFSTR("GSSAPI"), *v2, (uint64_t)v26);
  v32[0] = MEMORY[0x24BDAC760];
  v32[1] = 0x40000000;
  v32[2] = ___o_ldap_gssapi_security_block_invoke;
  v32[3] = &__block_descriptor_tmp_95;
  v32[4] = v1;
  v32[5] = v2;
  v28 = _ldap_base_operation_create((void *)v1, 104, 512, (uint64_t)_dispose_simple, v32);
  v29 = (char *)_ldap_operation_simple_init((uint64_t)v28, v33);
  free_LDAPMessage();
  if (!_enqueue_operation_with_release(v1, v29))
  {
LABEL_33:
    v5 = 7;
    goto LABEL_34;
  }
  return gss_release_buffer(&minor_status, &output_message_buffer);
}

void ___o_ldap_gssapi_security_block_invoke(uint64_t a1, uint64_t a2, int a3)
{
  uint64_t v4;
  void *v5;
  NSObject *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  _QWORD v10[6];
  uint8_t buf[4];
  uint64_t v12;
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  v4 = *(_QWORD *)(a1 + 32);
  if (a3)
  {
    v5 = *(void **)(a1 + 40);
    *(_DWORD *)(v4 + 292) = 7;
    _free_ldap_gss_context(v5);
    _ldap_next_authmechanism((void *)v4);
  }
  else
  {
    if ((*(_BYTE *)(v4 + 288) & 0x30) != 0)
    {
      v6 = *(NSObject **)(v4 + 208);
      v10[0] = MEMORY[0x24BDAC760];
      v10[1] = 0x40000000;
      v10[2] = ___o_ldap_gssapi_security_block_invoke_2;
      v10[3] = &__block_descriptor_tmp_94;
      v7 = *(_QWORD *)(a1 + 40);
      v10[4] = v4;
      v10[5] = v7;
      dispatch_barrier_sync(v6, v10);
    }
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_INFO))
    {
      v8 = *(_QWORD *)(a1 + 32);
      *(_DWORD *)buf = 134217984;
      v12 = v8;
      _os_log_impl(&dword_215173000, MEMORY[0x24BDACB70], OS_LOG_TYPE_INFO, "connection: %p, GSSAPI: negotiated", buf, 0xCu);
    }
    _free_ldap_gss_context(*(void **)(a1 + 40));
    v9 = *(_QWORD *)(a1 + 32);
    *(_DWORD *)(v9 + 292) = 0;
    dispatch_barrier_sync_f(*(dispatch_queue_t *)(v9 + 8), (void *)v9, (dispatch_function_t)_s_next_state);
  }
}

uint64_t ___o_ldap_gssapi_security_block_invoke_2(uint64_t result)
{
  *(_QWORD *)(*(_QWORD *)(result + 32) + 184) = *(_QWORD *)(*(_QWORD *)(result + 40) + 8);
  *(_QWORD *)(*(_QWORD *)(result + 40) + 8) = 0;
  return result;
}

void ___o_ldap_srp_auth_block_invoke(uint64_t a1, uint64_t a2, int a3)
{
  const __CFString *Value;
  const __CFString *v5;
  char *v6;
  char *v7;
  char *v8;
  unsigned int v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  _QWORD *v13;
  uint64_t v14;
  void *v15;
  _QWORD *v16;
  char *v17;
  _DWORD *v18;
  _QWORD v19[5];
  int8x16_t v20;
  _OWORD v21[2];
  void *v22[2];
  void *v23[2];
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  unsigned int v28;
  uint64_t v29;
  char *v30;
  char *v31;

  if (_ldap_continue_sasl(*(void **)(a1 + 32), a3))
  {
    Value = (const __CFString *)CFDictionaryGetValue(*(CFDictionaryRef *)(a1 + 40), (const void *)LDAP_MECHANISM_OPTION_RECORD_DN);
    v5 = (const __CFString *)CFDictionaryGetValue(*(CFDictionaryRef *)(a1 + 40), (const void *)LDAP_MECHANISM_OPTION_PASSWORD);
    v30 = 0;
    v31 = 0;
    v29 = 0;
    v28 = 0;
    v6 = _cstr_from_cfstring(Value, &v30);
    v7 = _short_username_from_dn(v6);
    v8 = _cstr_from_cfstring(v5, &v31);
    v9 = srp_client_mech_new((_QWORD *)(a1 + 48), v7, v7, v8);
    if (v9
      || (v9 = srp_client_mech_step(*(_QWORD *)(a1 + 48), (unsigned int *)"", 0, &v29, &v28, v10, v11, v12), v9 > 1))
    {
      v18 = *(_DWORD **)(a1 + 32);
      v18[73] = v9;
      _ldap_next_authmechanism(v18);
      v17 = 0;
    }
    else
    {
      v26 = 0u;
      v27 = 0u;
      v25 = 0u;
      *(_OWORD *)v23 = 0u;
      v24 = 0u;
      *(_OWORD *)v22 = 0u;
      memset(v21, 0, sizeof(v21));
      v13 = malloc_type_malloc(0x10uLL, 0x108004057E67DB5uLL);
      v14 = v29;
      *v13 = v28;
      v13[1] = v14;
      _ldap_sasl_fill((uint64_t)v21, CFSTR("SRP"), *(CFDictionaryRef *)(a1 + 40), (uint64_t)v13);
      v15 = *(void **)(a1 + 32);
      v19[0] = MEMORY[0x24BDAC760];
      v19[1] = 0x40000000;
      v19[2] = ___o_ldap_srp_auth_block_invoke_2;
      v19[3] = &__block_descriptor_tmp_98;
      v19[4] = v15;
      v20 = vextq_s8(*(int8x16_t *)(a1 + 40), *(int8x16_t *)(a1 + 40), 8uLL);
      v16 = _ldap_base_operation_create(v15, 104, 512, (uint64_t)_dispose_simple, v19);
      v17 = (char *)_ldap_operation_simple_init((uint64_t)v16, v21);
      if (v23[1])
      {
        free(v23[1]);
        v23[1] = 0;
      }
      if (v22[0])
        free(v22[0]);
      free(v13);
    }
    if (v30)
      free(v30);
    if (v7)
      free(v7);
    if (v31)
      free(v31);
    if (!_enqueue_operation_with_release(*(_QWORD *)(a1 + 32), v17))
      _ldap_next_authmechanism(*(void **)(a1 + 32));
  }
}

void ___o_ldap_srp_auth_block_invoke_2(uint64_t a1, uint64_t a2, int a3)
{
  _QWORD *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  unsigned int v8;
  void *v9;
  _QWORD *v10;
  char *v11;
  _DWORD *v12;
  _QWORD v13[4];
  __int128 v14;
  unsigned int v15;
  void *v16;
  _OWORD v17[2];
  void *v18[2];
  void *v19[2];
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;

  if (_ldap_continue_sasl(*(void **)(a1 + 32), a3))
  {
    v22 = 0u;
    v23 = 0u;
    v20 = 0u;
    v21 = 0u;
    *(_OWORD *)v18 = 0u;
    *(_OWORD *)v19 = 0u;
    memset(v17, 0, sizeof(v17));
    v4 = malloc_type_malloc(0x10uLL, 0x108004057E67DB5uLL);
    v16 = 0;
    v15 = 0;
    v8 = srp_client_mech_step(*(_QWORD *)(a1 + 40), *(unsigned int **)(*(_QWORD *)(a1 + 32) + 136), *(unsigned int *)(*(_QWORD *)(a1 + 32) + 144), &v16, &v15, v5, v6, v7);
    if (v8 > 1)
    {
      v12 = *(_DWORD **)(a1 + 32);
      v12[73] = v8;
      _ldap_next_authmechanism(v12);
      if (!v4)
        return;
    }
    else
    {
      v9 = v16;
      *v4 = v15;
      v4[1] = v9;
      _ldap_sasl_fill((uint64_t)v17, CFSTR("SRP"), *(CFDictionaryRef *)(a1 + 48), (uint64_t)v4);
      v13[0] = MEMORY[0x24BDAC760];
      v13[1] = 0x40000000;
      v13[2] = ___o_ldap_srp_auth_block_invoke_3;
      v13[3] = &__block_descriptor_tmp_97;
      v14 = *(_OWORD *)(a1 + 32);
      v10 = _ldap_base_operation_create((void *)v14, 104, 512, (uint64_t)_dispose_simple, v13);
      v11 = (char *)_ldap_operation_simple_init((uint64_t)v10, v17);
      if (!_enqueue_operation_with_release(*(_QWORD *)(a1 + 32), v11))
        _ldap_next_authmechanism(*(void **)(a1 + 32));
      if (v16)
      {
        free(v16);
        v16 = 0;
      }
      if (v19[1])
      {
        free(v19[1]);
        v19[1] = 0;
      }
      if (v18[0])
        free(v18[0]);
    }
    free(v4);
  }
}

void ___o_ldap_srp_auth_block_invoke_3(uint64_t a1, uint64_t a2, int a3)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  unsigned int v7;
  unsigned int *v8;
  unsigned int v9;
  unsigned int *v10;
  unsigned int v11;
  _DWORD *v12;
  int v13;
  uint64_t v14;

  v14 = 0;
  v13 = 0;
  *(_QWORD *)(*(_QWORD *)(a1 + 32) + 200) = *(_QWORD *)(a1 + 40);
  if (_ldap_continue_sasl(*(void **)(a1 + 32), a3))
  {
    v7 = srp_client_mech_step(*(_QWORD *)(a1 + 40), *(unsigned int **)(*(_QWORD *)(a1 + 32) + 136), *(unsigned int *)(*(_QWORD *)(a1 + 32) + 144), &v14, &v13, v4, v5, v6);
    if (v7 > 1)
    {
      v12 = *(_DWORD **)(a1 + 32);
      v12[73] = v7;
      _ldap_next_authmechanism(v12);
    }
    else
    {
      if (srp_has_confidentiality(*(_QWORD *)(a1 + 40)))
      {
        v8 = (unsigned int *)(*(_QWORD *)(a1 + 32) + 288);
        do
          v9 = __ldaxr(v8);
        while (__stlxr(v9 | 0x20, v8));
      }
      if (srp_has_confidentiality(*(_QWORD *)(a1 + 40)))
      {
        v10 = (unsigned int *)(*(_QWORD *)(a1 + 32) + 288);
        do
          v11 = __ldaxr(v10);
        while (__stlxr(v11 | 0x10, v10));
      }
    }
  }
}

void _o_disconnected(NSObject **a1, uint64_t a2, int a3)
{
  unint64_t *v6;
  uint64_t v7;
  unint64_t **v8;
  unint64_t *v9;
  unint64_t *v10;
  unint64_t v11;
  NSObject *v12;
  NSObject *v13;
  _QWORD block[6];
  int v15;

  dispatch_assert_queue_V2(a1[8]);
  v6 = *(unint64_t **)a2;
  if (*(_QWORD *)a2)
  {
    v7 = MEMORY[0x24BDAC760];
    do
    {
      v9 = (unint64_t *)v6[1];
      v8 = (unint64_t **)v6[2];
      if (v9)
      {
        v9[2] = (unint64_t)v8;
        v8 = (unint64_t **)v6[2];
      }
      else
      {
        *(_QWORD *)(a2 + 8) = v8;
      }
      *v8 = v9;
      v10 = v6 + 5;
      do
        v11 = __ldaxr(v10);
      while (__stlxr(v11 & 0xFFFFFFFFFFFFFFF7, v10));
      if ((*(_BYTE *)v10 & 2) != 0 || !v6[3])
      {
        dispatch_group_leave(a1[7]);
        ldap_operation_release(v6);
      }
      else
      {
        v13 = a1[3];
        v12 = a1[4];
        block[0] = v7;
        block[1] = 0x40000000;
        block[2] = ___o_disconnected_block_invoke;
        block[3] = &__block_descriptor_tmp_102;
        v15 = a3;
        block[4] = v6;
        block[5] = a1;
        dispatch_group_async(v12, v13, block);
      }
      v6 = v9;
    }
    while (v9);
  }
}

void ___o_disconnect_cleanup_block_invoke(uint64_t a1)
{
  _QWORD *v2;
  uint64_t v3;

  v2 = *(_QWORD **)(a1 + 32);
  v3 = v2[35];
  if (v3)
  {
    (*(void (**)(void))(v3 + 16))();
    v2 = *(_QWORD **)(a1 + 32);
  }
  ldap_connection_release(v2);
}

void ___o_disconnected_block_invoke(uint64_t a1)
{
  (*(void (**)(void))(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 24) + 16))();
  dispatch_group_leave(*(dispatch_group_t *)(*(_QWORD *)(a1 + 40) + 56));
  ldap_operation_release(*(id *)(a1 + 32));
}

void ___report_connect_status_block_invoke(uint64_t a1)
{
  uint64_t v2;
  int v3;
  _QWORD v4[3];
  int v5;
  uint8_t buf[4];
  uint64_t v7;
  __int16 v8;
  char *v9;
  __int16 v10;
  int v11;
  __int16 v12;
  _QWORD *v13;
  __int16 v14;
  int v15;
  char cStr[16];
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  _BYTE v30[31];
  uint64_t v31;

  v31 = *MEMORY[0x24BDAC8D0];
  v29 = 0u;
  memset(v30, 0, sizeof(v30));
  v27 = 0u;
  v28 = 0u;
  v25 = 0u;
  v26 = 0u;
  v23 = 0u;
  v24 = 0u;
  v21 = 0u;
  v22 = 0u;
  v19 = 0u;
  v20 = 0u;
  v17 = 0u;
  v18 = 0u;
  *(_OWORD *)cStr = 0u;
  if (tcp_connection_get_hostname())
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = CFStringCreateWithCString((CFAllocatorRef)*MEMORY[0x24BDBD240], cStr, 0x8000100u);
  if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_INFO))
  {
    memset(v4, 0, sizeof(v4));
    v5 = 0;
    tcp_connection_get_remote();
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_INFO))
    {
      v2 = *(_QWORD *)(a1 + 40);
      v3 = *(_DWORD *)(v2 + 288);
      *(_DWORD *)buf = 134219010;
      v7 = v2;
      v8 = 2082;
      v9 = cStr;
      v10 = 1040;
      v11 = LOBYTE(v4[0]);
      v12 = 2098;
      v13 = v4;
      v14 = 1024;
      v15 = v3;
      _os_log_impl(&dword_215173000, MEMORY[0x24BDACB70], OS_LOG_TYPE_INFO, "connection: %p, host: %{public}s, address: %{public,network:sockaddr}.*P, flags: %{AppleLDAPTypes:flags}d", buf, 0x2Cu);
    }
  }
}

void _o_abandon_operation(uint64_t a1)
{
  int v2;
  _QWORD *v3;
  char *v4;
  unint64_t *v5;
  unint64_t v6;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;

  dispatch_assert_queue_V2(*(dispatch_queue_t *)(*(_QWORD *)(a1 + 32) + 64));
  v7 = 0u;
  v8 = 0u;
  v13 = 0u;
  v14 = 0u;
  v11 = 0u;
  v12 = 0u;
  v9 = 0u;
  v10 = 0u;
  v2 = *(_DWORD *)(a1 + 80);
  DWORD2(v7) = 18;
  LODWORD(v8) = v2;
  v3 = _ldap_base_operation_create(*(void **)(a1 + 32), 104, 512, (uint64_t)_dispose_simple, 0);
  v4 = (char *)_ldap_operation_simple_init((uint64_t)v3, &v7);
  v5 = (unint64_t *)(v4 + 40);
  do
    v6 = __ldaxr(v5);
  while (__stlxr(v6 | 0x800, v5));
  _enqueue_operation_with_release(*(_QWORD *)(a1 + 32), v4);
  ldap_operation_release((id)a1);
}

void ___ldap_async_operation_block_invoke(uint64_t a1)
{
  (*(void (**)(_QWORD))(a1 + 32))(*(_QWORD *)(a1 + 40));
  ldap_operation_release(*(id *)(a1 + 40));
}

void _dispose_query(_QWORD *a1)
{
  void *v2;
  const void *v3;
  void *v4;
  NSObject *v5;
  NSObject *v6;

  v2 = (void *)a1[11];
  if (v2)
  {
    free(v2);
    a1[11] = 0;
  }
  v3 = (const void *)a1[13];
  if (v3)
  {
    _Block_release(v3);
    a1[13] = 0;
  }
  v4 = (void *)a1[15];
  if (v4)
  {
    free(v4);
    a1[15] = 0;
  }
  v5 = a1[14];
  if (v5)
  {
    dispatch_source_cancel(v5);
    v6 = a1[14];
    if (v6)
    {
      dispatch_release(v6);
      a1[14] = 0;
    }
  }
}

void _o_ldap_queue_operation(_QWORD *a1)
{
  uint64_t v2;
  _QWORD *v3;
  _QWORD *v4;
  _QWORD *v5;
  uint64_t v6;
  NSObject *v7;
  NSObject *v8;
  _QWORD v9[6];

  v2 = a1[4];
  dispatch_assert_queue_V2(*(dispatch_queue_t *)(v2 + 64));
  a1[1] = 0;
  v3 = a1 + 1;
  if ((a1[5] & 0x100) != 0)
  {
    v5 = *(_QWORD **)(v2 + 80);
    a1[2] = v5;
    *v5 = a1;
    *(_QWORD *)(v2 + 80) = v3;
    v6 = a1[4];
    ldap_operation_retain(a1);
    v7 = *(NSObject **)(v6 + 56);
    v8 = *(NSObject **)(v6 + 64);
    v9[0] = MEMORY[0x24BDAC760];
    v9[1] = 0x40000000;
    v9[2] = ___ldap_async_operation_block_invoke;
    v9[3] = &__block_descriptor_tmp_104;
    v9[4] = _o_ldap_chained_operation_next;
    v9[5] = a1;
    dispatch_group_async(v7, v8, v9);
  }
  else
  {
    v4 = *(_QWORD **)(v2 + 96);
    a1[2] = v4;
    *v4 = a1;
    *(_QWORD *)(v2 + 96) = v3;
    _o_ldap_wakeup(v2);
  }
}

void _o_ldap_chained_operation_next(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t (*v4)(uint64_t, _QWORD *);
  int v5;
  BOOL v6;
  void *v7;
  _QWORD v8[6];

  v3 = *(_QWORD *)(a1 + 96);
  v2 = *(_QWORD *)(a1 + 104);
  *(_QWORD *)(a1 + 96) = v3 + 1;
  v4 = *(uint64_t (**)(uint64_t, _QWORD *))(v2 + 8 * v3);
  dispatch_assert_queue_V2(*(dispatch_queue_t *)(*(_QWORD *)(a1 + 32) + 64));
  v5 = *(_DWORD *)(a1 + 56);
  if (v4)
    v6 = v5 == 0;
  else
    v6 = 0;
  if (v6)
  {
    v7 = *(void **)(a1 + 88);
    if (v7)
    {
      ldap_operation_release(v7);
      *(_QWORD *)(a1 + 88) = 0;
    }
    v8[0] = MEMORY[0x24BDAC760];
    v8[1] = 0x40000000;
    v8[2] = ___o_ldap_chained_operation_next_block_invoke;
    v8[3] = &__block_descriptor_tmp_105;
    v8[4] = a1;
    v8[5] = a1;
    *(_QWORD *)(a1 + 88) = v4(a1, v8);
  }
  else
  {
    _o_operation_complete(*(_QWORD *)(a1 + 32), a1, v5);
  }
}

void ___o_ldap_chained_operation_next_block_invoke(uint64_t a1, uint64_t a2, int a3)
{
  uint64_t v4;
  const void *v5;
  uint64_t v7;
  _QWORD *v8;
  uint64_t v9;
  NSObject *v10;
  NSObject *v11;
  _QWORD v12[6];

  v4 = *(_QWORD *)(a1 + 32);
  *(_DWORD *)(v4 + 56) = a3;
  v5 = *(const void **)(a2 + 64);
  if (v5)
  {
    CFRetain(v5);
    v7 = *(_QWORD *)(a2 + 64);
    v4 = *(_QWORD *)(a1 + 32);
  }
  else
  {
    v7 = 0;
  }
  *(_QWORD *)(v4 + 64) = v7;
  v8 = *(_QWORD **)(a1 + 40);
  v9 = v8[4];
  ldap_operation_retain(v8);
  v10 = *(NSObject **)(v9 + 56);
  v11 = *(NSObject **)(v9 + 64);
  v12[0] = MEMORY[0x24BDAC760];
  v12[1] = 0x40000000;
  v12[2] = ___ldap_async_operation_block_invoke;
  v12[3] = &__block_descriptor_tmp_104;
  v12[4] = _o_ldap_chained_operation_next;
  v12[5] = v8;
  dispatch_group_async(v10, v11, v12);
}

uint64_t _start_filter(int *a1, char *a2)
{
  uint64_t v2;
  int v3;

  v2 = -1;
  switch(*a2)
  {
    case '!':
      v3 = 3;
      goto LABEL_8;
    case '"':
    case '#':
    case '$':
    case '%':
    case '\'':
      return _parse_simple_filter((uint64_t)a1, a2, 1);
    case '&':
      v3 = 1;
      goto LABEL_8;
    case '(':
      return v2;
    case ')':
      return (uint64_t)(a2 + 1);
    default:
      if (!*a2)
        return v2;
      if (*a2 != 124)
        return _parse_simple_filter((uint64_t)a1, a2, 1);
      v3 = 2;
LABEL_8:
      *a1 = v3;
      return _parse_compound_filter((uint64_t)a1, a2 + 1);
  }
}

uint64_t _parse_simple_filter(uint64_t a1, char *a2, int a3)
{
  uint64_t v6;
  int v7;
  char *v8;
  char *v9;
  uint64_t result;
  unint64_t v11;
  char v12;
  int v13;
  uint64_t v14;
  int v15;
  char v16;
  char v17[128];
  uint64_t v18;

  v6 = 0;
  v18 = *MEMORY[0x24BDAC8D0];
  while (1)
  {
    while (1)
    {
      v7 = *a2;
      if (v7 != 32)
        break;
      if (a2 == (char *)-1)
        return -1;
      ++a2;
    }
    if (!*a2)
    {
      if ((a3 & 1) != 0)
        return -1;
      else
        return (uint64_t)(a2 - 1);
    }
    if (v7 == 41)
    {
      if (a3)
        return (uint64_t)(a2 + 1);
      else
        return -1;
    }
    if (v7 != 40)
      break;
    v8 = (char *)reallocf(*(void **)(a1 + 16), 48 * v6 + 48);
    *(_QWORD *)(a1 + 16) = v8;
    v9 = &v8[48 * v6];
    *(_OWORD *)v9 = 0u;
    *((_OWORD *)v9 + 1) = 0u;
    *((_OWORD *)v9 + 2) = 0u;
    result = _start_filter();
    if (result == -1)
      return result;
    a2 = (char *)result;
    *(_DWORD *)(a1 + 8) = ++v6;
  }
  v11 = 0;
  v12 = *a2;
  v13 = 1;
  while (v12 > 125)
  {
    if (v12 == 126)
    {
      if (a2[1] == 61)
      {
        v13 = 0;
        v15 = 9;
        goto LABEL_32;
      }
    }
    else
    {
LABEL_28:
      v17[v11++] = v12;
      if (v11 > 0x7F)
        return -1;
    }
LABEL_29:
    if (a2 == (char *)-1)
      return -1;
    v16 = *++a2;
    v12 = v16;
  }
  v14 = 1;
  v15 = 4;
  switch(v12)
  {
    case ':':
      if (a2[1] != 61)
        goto LABEL_29;
      v13 = 0;
      v15 = 10;
      break;
    case '<':
      if (a2[1] != 61)
        goto LABEL_29;
      v13 = 0;
      v15 = 7;
      break;
    case '=':
      goto LABEL_33;
    case '>':
      if (a2[1] != 61)
        goto LABEL_29;
      v13 = 0;
      v15 = 6;
      break;
    default:
      goto LABEL_28;
  }
LABEL_32:
  v14 = 2;
LABEL_33:
  *(_DWORD *)a1 = v15;
  v17[v11] = 0;
  return _parse_rh_exp(a1, &a2[v14], v17, v13, a3);
}

uint64_t _parse_compound_filter(uint64_t a1, char *a2)
{
  int v4;
  int v5;
  char *v6;
  char *v7;
  uint64_t result;

  v4 = 0;
  while (1)
  {
    v5 = *a2;
    if (v5 != 32)
      break;
    if (a2 == (char *)-1)
      return -1;
LABEL_7:
    ++a2;
  }
  if (v5 == 40)
  {
    v6 = (char *)reallocf(*(void **)(a1 + 16), 48 * (v4 + 1));
    *(_QWORD *)(a1 + 16) = v6;
    v7 = &v6[48 * v4];
    *(_OWORD *)v7 = 0u;
    *((_OWORD *)v7 + 1) = 0u;
    *((_OWORD *)v7 + 2) = 0u;
    result = _start_filter();
    if (result == -1)
      return result;
    a2 = (char *)result;
    *(_DWORD *)(a1 + 8) = ++v4;
    goto LABEL_7;
  }
  if (v5 == 41)
    return (uint64_t)a2;
  else
    return -1;
}

uint64_t _parse_rh_exp(uint64_t a1, char *__s, char *a3, int a4, int a5)
{
  char *v7;
  size_t v9;
  _BYTE *v10;
  char v11;
  char v12;
  uint64_t v13;
  uint64_t v14;
  _BYTE *i;
  int v16;
  int v17;
  unsigned int v18;
  char v19;
  char v20;
  _BYTE *v21;

  v7 = __s;
  v9 = strlen(__s);
  v10 = malloc_type_calloc(v9, 1uLL, 0x100004077774924uLL);
  v11 = 0;
  v12 = 0;
  v13 = 0;
  v14 = MEMORY[0x24BDAC740];
LABEL_2:
  for (i = v7 + 2; ; ++i)
  {
    v16 = (char)*(i - 2);
    if (v16 != 92)
      break;
    v17 = (char)*(i - 1);
    if (!*(i - 1))
      goto LABEL_35;
    if (v17 < 0)
    {
      if (!__maskrune((char)*(i - 1), 0x10000uLL))
        goto LABEL_13;
    }
    else if ((*(_DWORD *)(v14 + 4 * v17 + 60) & 0x10000) == 0)
    {
      goto LABEL_13;
    }
    v18 = (char)*i;
    if ((v18 & 0x80000000) != 0)
    {
      if (__maskrune(v18, 0x10000uLL))
      {
LABEL_25:
        v19 = 16 * v17;
        if (v17 > 64)
          v19 = 16 * v17 - 112;
        v10[v13] = v19;
        v20 = *i - 48;
        if ((char)*i > 64)
          v20 = (*i & 0x1F) + 9;
        v10[v13++] = v20 | v19;
LABEL_30:
        if (i != (_BYTE *)-1)
        {
          v7 = i + 1;
          goto LABEL_2;
        }
        goto LABEL_35;
      }
    }
    else if ((*(_DWORD *)(v14 + 4 * v18 + 60) & 0x10000) != 0)
    {
      goto LABEL_25;
    }
LABEL_13:
    v10[v13] = v17;
  }
  if (v16 > 40)
  {
    if (v16 != 41)
    {
      if (v16 == 42)
      {
        if (!a4)
          goto LABEL_35;
        i -= 2;
        v11 |= v13 == 0;
        v12 |= v13 != 0;
        goto LABEL_30;
      }
LABEL_23:
      v10[v13++] = v16;
LABEL_24:
      i -= 2;
      goto LABEL_30;
    }
    if (a5)
    {
      v21 = i - 2;
      _filter_finish(a1, a3, v10, v13, v11 & 1, v12 & 1);
      return (uint64_t)v21;
    }
  }
  else
  {
    if (*(i - 2))
    {
      if (v16 == 32 && !v13)
        goto LABEL_24;
      goto LABEL_23;
    }
    if ((a5 & 1) == 0)
    {
      _filter_finish(a1, a3, v10, v13, v11 & 1, v12 & 1);
      return (uint64_t)(i - 3);
    }
  }
LABEL_35:
  if (v10)
    free(v10);
  return -1;
}

_DWORD *_filter_finish(uint64_t a1, char *__s1, _BYTE *a3, uint64_t a4, int a5, int a6)
{
  _DWORD *result;
  int v13;

  if ((a5 & 1) == 0 && !a6)
  {
    *(_QWORD *)(a1 + 16) = strdup(__s1);
    result = (_DWORD *)strlen(__s1);
    *(_QWORD *)(a1 + 8) = result;
    *(_QWORD *)(a1 + 24) = a4;
    *(_QWORD *)(a1 + 32) = a3;
    return result;
  }
  if (!a3)
    goto LABEL_10;
  if (!*a3)
  {
    free(a3);
LABEL_10:
    *(_DWORD *)a1 = 8;
    *(_QWORD *)(a1 + 16) = strdup(__s1);
    result = (_DWORD *)strlen(__s1);
    *(_QWORD *)(a1 + 8) = result;
    return result;
  }
  *(_DWORD *)a1 = 5;
  *(_QWORD *)(a1 + 16) = strdup(__s1);
  *(_QWORD *)(a1 + 8) = strlen(__s1);
  *(_DWORD *)(a1 + 24) = 1;
  result = malloc_type_calloc(1uLL, 0x18uLL, 0x10800404ACF7207uLL);
  *(_QWORD *)(a1 + 32) = result;
  if (a5 && a6)
  {
    v13 = 2;
  }
  else if (a6)
  {
    v13 = 1;
  }
  else
  {
    v13 = 3;
  }
  *result = v13;
  *(_QWORD *)(*(_QWORD *)(a1 + 32) + 16) = a3;
  *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) = a4;
  return result;
}

uint64_t ___ldap_connection_next_messageID_block_invoke(uint64_t result)
{
  uint64_t v1;
  int v2;
  int v3;

  v1 = *(_QWORD *)(result + 40);
  v2 = *(_DWORD *)(v1 + 240);
  if (v2 >= -1)
    v3 = v2 + 1;
  else
    v3 = 1;
  *(_DWORD *)(v1 + 240) = v3;
  *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(result + 32) + 8) + 24) = v3;
  return result;
}

void ___start_query_timer_block_invoke(uint64_t a1)
{
  _o_operation_complete(*(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40), 3);
}

uint64_t OUTLINED_FUNCTION_1()
{
  return _os_assert_log();
}

void OUTLINED_FUNCTION_2(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 0x12u);
}

void OUTLINED_FUNCTION_5(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 0x1Cu);
}

uint64_t free_Filter()
{
  return _asn1_free_top();
}

uint64_t decode_LDAPMessage()
{
  return _asn1_decode_top();
}

uint64_t encode_LDAPMessage()
{
  return _asn1_encode();
}

uint64_t length_LDAPMessage()
{
  return _asn1_length();
}

uint64_t free_LDAPMessage()
{
  return _asn1_free_top();
}

uint64_t decode_pkts_input(uint64_t a1, char *__src, unsigned int a3, void **a4, _DWORD *a5, unsigned int *a6, uint64_t (*a7)(uint64_t, _QWORD, _QWORD, _DWORD *, _DWORD *), uint64_t a8)
{
  unsigned int v12;
  unsigned int v15;
  uint64_t v16;
  size_t v17;
  BOOL v18;
  unsigned int v19;
  unsigned int v20;
  size_t v21;
  void *v22;
  unsigned int v23;
  unsigned int v24;
  unsigned int v25;
  void *v26;
  uint64_t result;
  unsigned int v28;
  _DWORD __n[3];

  *a6 = 0;
  if (a3)
  {
    v12 = a3;
    memset(__n, 0, sizeof(__n));
    v16 = a1 + 8;
    v15 = *(_DWORD *)a1;
    do
    {
      if (v15)
      {
        if (v12 >= v15)
          v17 = v15;
        else
          v17 = v12;
        memcpy((void *)(v16 - v15), __src, v17);
        v18 = *(_DWORD *)a1 == (_DWORD)v17;
        *(_DWORD *)a1 -= v17;
        if (!v18)
          return 0;
        v19 = *(_DWORD *)(a1 + 4);
        v20 = bswap32(v19);
        *(_DWORD *)(a1 + 8) = v20;
        if (!v19)
          return 0xFFFFFFFFLL;
        v21 = *(unsigned int *)(a1 + 28);
        if (v20 > v21)
        {
          fprintf((FILE *)*MEMORY[0x24BDAC8D8], "encoded packet size too big (%d > %d)", v20, v21);
          return 0xFFFFFFFFLL;
        }
        if (!*(_QWORD *)(a1 + 16))
        {
          v22 = malloc_type_malloc(v21, 0xBDF22F0AuLL);
          *(_QWORD *)(a1 + 16) = v22;
          if (!v22)
            return 4294967294;
        }
        v23 = 0;
        v24 = v12 - v17;
        __src += v17;
        *(_DWORD *)(a1 + 24) = 0;
      }
      else
      {
        v23 = *(_DWORD *)(a1 + 24);
        v24 = v12;
      }
      v25 = *(_DWORD *)(a1 + 8) - v23;
      v26 = (void *)(*(_QWORD *)(a1 + 16) + v23);
      v12 = v24 - v25;
      if (v24 < v25)
      {
        memcpy(v26, __src, v24);
        result = 0;
        *(_DWORD *)(a1 + 24) += v24;
        return result;
      }
      memcpy(v26, __src, *(_DWORD *)(a1 + 8) - v23);
      result = a7(a8, *(_QWORD *)(a1 + 16), *(unsigned int *)(a1 + 8), &__n[1], __n);
      if ((_DWORD)result)
        return result;
      result = conditional_realloc(a4, a5, *a6 + __n[0] + 1);
      if ((_DWORD)result)
        return result;
      __src += v25;
      memcpy((char *)*a4 + *a6, *(const void **)&__n[1], __n[0]);
      v28 = *a6 + __n[0];
      *a6 = v28;
      *((_BYTE *)*a4 + v28) = 0;
      v15 = 4;
      *(_DWORD *)a1 = 4;
    }
    while (v12);
  }
  return 0;
}

uint64_t conditional_realloc(void **a1, _DWORD *a2, size_t size)
{
  uint64_t result;
  int v6;
  size_t v7;
  void *v8;
  int v9;
  void *v10;

  result = 4294967289;
  if (a1 && a2)
  {
    v6 = size;
    if (*a1)
    {
      LODWORD(v7) = *a2;
      if (*a2 < size)
      {
        do
          v7 = (2 * v7);
        while (v7 < size);
        v8 = reallocf(*a1, v7);
        *a1 = v8;
        v9 = v8 ? v7 : 0;
        *a2 = v9;
        if (!v8)
          return 4294967294;
      }
    }
    else
    {
      v10 = malloc_type_malloc(size, 0xAFD549FBuLL);
      *a1 = v10;
      if (!v10)
      {
        *a2 = 0;
        return 4294967294;
      }
      *a2 = v6;
    }
    return 0;
  }
  return result;
}

double srp_encode(uint64_t a1, uint64_t a2, uint64_t a3, _QWORD *a4, unsigned int *a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  _QWORD *v11;
  double result;
  const char *v13;
  unsigned int v14;
  unsigned int v15;
  char v16;
  __int128 v17;

  if (a1 && a4 && a5)
  {
    v11 = (_QWORD *)(a1 + 888);
    if (conditional_realloc((void **)(a1 + 888), (_DWORD *)(a1 + 912), (a3 + 84)))
      return result;
    *a5 = 4;
    if ((*(_BYTE *)(a1 + 360) & 2) != 0)
    {
      *a5 += chacha20_poly1305_encrypt();
      if ((*(_BYTE *)(a1 + 360) & 2) != 0)
      {
        v14 = *a5 + chacha20_poly1305_final();
        *a5 = v14;
        result = *(double *)&v17;
        *(_OWORD *)(*v11 + v14) = v17;
        v15 = *a5;
        *a5 += 16;
        *(_DWORD *)*v11 = bswap32(v15 + 12);
        *a4 = *v11;
        return result;
      }
    }
    v13 = "confidentiality integrity layer required";
  }
  else
  {
    v13 = "Bad parameter";
  }
  SETERROR(a1, v13, a3, (uint64_t)a4, (uint64_t)a5, a6, a7, a8, v16);
  return result;
}

uint64_t srp_decode(uint64_t a1, char *a2, unsigned int a3, _QWORD *a4, unsigned int *a5)
{
  uint64_t result;

  result = decode_pkts_input(a1 + 936, a2, a3, (void **)(a1 + 896), (_DWORD *)(a1 + 920), a5, (uint64_t (*)(uint64_t, _QWORD, _QWORD, _DWORD *, _DWORD *))srp_decode_packet, a1);
  *a4 = *(_QWORD *)(a1 + 896);
  return result;
}

uint64_t srp_decode_packet(uint64_t a1, uint64_t a2, size_t a3, _QWORD *a4, _DWORD *a5)
{
  _QWORD *v8;
  uint64_t result;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  int v16;
  char v17;

  v8 = (_QWORD *)(a1 + 904);
  result = conditional_realloc((void **)(a1 + 904), (_DWORD *)(a1 + 928), a3);
  if (!(_DWORD)result)
  {
    if ((*(_BYTE *)(a1 + 360) & 2) != 0)
    {
      *a5 = chacha20_poly1305_decrypt();
      v16 = chacha20_poly1305_verify();
      result = 0;
      *a5 += v16;
      *a4 = *v8;
    }
    else
    {
      SETERROR(a1, "confidentiality integrity layer required", v10, v11, v12, v13, v14, v15, v17);
      return 4294967289;
    }
  }
  return result;
}

uint64_t srp_common_context_init(_QWORD *a1)
{
  uint64_t result;

  bzero(a1, 0x3D0uLL);
  *(_DWORD *)a1 = 1;
  a1[3] = CCCreateBigNum();
  a1[4] = CCCreateBigNum();
  a1[6] = CCCreateBigNum();
  a1[7] = CCCreateBigNum();
  a1[8] = CCCreateBigNum();
  result = ccrng();
  a1[2] = result;
  return result;
}

uint64_t cc_get_digestbyname(const char *a1)
{
  if (!strcmp(a1, "sha512"))
    return ccsha512_di();
  if (!strcmp(a1, "sha384"))
    return ccsha384_di();
  if (!strcmp(a1, "sha256"))
    return ccsha256_di();
  if (!strcmp(a1, "sha224"))
    return ccsha224_di();
  return 0;
}

void SETERROR(uint64_t a1, const char *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, char a9)
{
  void *v10;
  char *v11;

  v11 = 0;
  vasprintf(&v11, a2, &a9);
  v10 = *(void **)(a1 + 968);
  if (v10)
    free(v10);
  *(_QWORD *)(a1 + 968) = v11;
}

uint64_t srp_client_mech_new(_QWORD *a1, const char *a2, const char *a3, const char *a4)
{
  _QWORD *v8;
  _QWORD *v9;
  char *v10;
  uint64_t result;

  v8 = malloc_type_malloc(0x3D0uLL, 0x1070040C3537DAAuLL);
  if (!v8)
    return 4294967294;
  v9 = v8;
  bzero(v8, 0x3D0uLL);
  srp_common_context_init(v9);
  v9[28] = strdup(a2);
  v9[27] = strdup(a3);
  v10 = strdup(a4);
  result = 0;
  v9[29] = v10;
  *a1 = v9;
  return result;
}

uint64_t srp_client_mech_step(uint64_t a1, unsigned int *a2, uint64_t a3, _QWORD *a4, _DWORD *a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  int v9;
  const char *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  const char *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  const char *v36;
  size_t v37;
  void *v38;
  uint64_t v39;
  uint64_t v40;
  char v41;
  uint64_t Buffer;
  FILE *v43;
  const char *v44;
  size_t v45;
  FILE *v46;
  const char *v47;
  size_t v48;
  int v49;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  size_t v55;
  void *v56;
  int started;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  size_t v64;
  void *v65;
  size_t v66;
  CCRNGStatus Bytes;
  uint64_t v68;
  uint64_t v69;
  uint64_t v70;
  uint64_t v71;
  uint64_t v72;
  uint64_t v73;
  char derivedKeyLen;
  __int128 v75;
  __int128 v76;
  int v77;
  uint64_t v78;
  void *v79;
  uint8_t derivedKey[8];
  uint64_t v81;

  v81 = *MEMORY[0x24BDAC8D0];
  *a4 = 0;
  *a5 = 0;
  v9 = *(_DWORD *)a1;
  if (*(_DWORD *)a1 != 3)
  {
    if (v9 != 2)
    {
      if (v9 == 1)
      {
        if ((_DWORD)a3)
        {
          v12 = "Invalid input to first step of SRP";
LABEL_6:
          SETERROR(a1, v12, a3, (uint64_t)a4, (uint64_t)a5, a6, a7, a8, derivedKeyLen);
          return 4294967291;
        }
        *(_QWORD *)derivedKey = 0;
        Buffer = MakeBuffer((void **)(a1 + 344), (_DWORD *)(a1 + 352), (int64_t *)derivedKey, "%s%s%s%o", (uint64_t)a5, a6, a7, a8, *(_QWORD *)(a1 + 216));
        *a5 = *(_DWORD *)derivedKey;
        if ((_DWORD)Buffer)
        {
LABEL_32:
          v13 = Buffer;
          v43 = (FILE *)*MEMORY[0x24BDAC8D8];
          v44 = "Error making output buffer\n";
          v45 = 27;
LABEL_33:
          fwrite(v44, v45, 1uLL, v43);
          return v13;
        }
        *a4 = *(_QWORD *)(a1 + 344);
        v49 = 2;
LABEL_39:
        *(_DWORD *)a1 = v49;
        return 1;
      }
      fprintf((FILE *)*MEMORY[0x24BDAC8D8], "Invalid SRP client step %d\n", v9);
      return 0xFFFFFFFFLL;
    }
    LOBYTE(v78) = 0;
    v22 = UnBuffer(a1, a2, a3, "%c%m%m%o%m%q%s", (uint64_t)a5, a6, a7, a8, (uint64_t)&v78);
    if ((_DWORD)v22)
    {
      v13 = v22;
      SETERROR(a1, "Error UnBuffering input in step 2", v23, v24, v25, v26, v27, v28, derivedKeyLen);
      return v13;
    }
    v37 = ccz_write_uint_size();
    v38 = malloc_type_malloc(v37, 0x70D4CB4EuLL);
    ccz_write_uint();
    if (ccz_write_uint_size() != 1)
      goto LABEL_34;
    BYTE4(v78) = 0;
    ccz_write_uint();
    v39 = SBYTE4(v78);
    set_ccsrp_groups();
    v40 = 0;
    while (v37 != (unint64_t)Ng_tab[v40] >> 3
         || memcmp(v38, (const void *)Ng_tab[v40 + 2], v37)
         || Ng_tab[v40 + 3] != v39)
    {
      v40 += 5;
      if (v40 == 20)
      {
        v41 = 0;
        goto LABEL_25;
      }
    }
    *(_QWORD *)(a1 + 40) = Ng_tab[v40 + 4];
    v41 = 1;
LABEL_25:
    if (v38)
      free(v38);
    if ((v41 & 1) != 0)
    {
      if ((int)ccz_cmpi() < 1 || (ccz_cmp() & 0x80000000) == 0)
      {
        v12 = "Illegal value for 'B'";
        goto LABEL_6;
      }
      v75 = 0u;
      v76 = 0u;
      v51 = ParseOptions(a1, *(char **)(a1 + 256), (int *)&v75, 0);
      if ((_DWORD)v51)
      {
        v13 = v51;
        v43 = (FILE *)*MEMORY[0x24BDAC8D8];
        v44 = "Error parsing SRP server options\n";
        v45 = 33;
        goto LABEL_33;
      }
      *(_OWORD *)(a1 + 264) = 0u;
      *(_OWORD *)(a1 + 280) = 0u;
      *(_BYTE *)(a1 + 268) = 1;
      *(_DWORD *)(a1 + 272) = 1;
      *(_DWORD *)(a1 + 264) = 1;
      v52 = *((_QWORD *)&v76 + 1);
      if (*((_QWORD *)&v76 + 1) >= 0x7FFFFFFBuLL)
        v52 = 2147483643;
      *(_QWORD *)(a1 + 288) = v52;
      *(_DWORD *)(a1 + 280) = 1;
      v53 = OptionsToString((int *)(a1 + 264), (char **)(a1 + 248));
      if ((_DWORD)v53)
      {
        v13 = v53;
        v43 = (FILE *)*MEMORY[0x24BDAC8D8];
        v44 = "Error converting client options to an option string\n";
        v45 = 52;
        goto LABEL_33;
      }
      if (SetMDA((_DWORD *)(a1 + 264), a1))
      {
        v36 = "Error setting MDA";
        goto LABEL_16;
      }
      v54 = ccdh_ccn_size();
      *(_QWORD *)(a1 + 8) = malloc_type_malloc(48 * ((4 * (**(_QWORD **)(a1 + 336) + v54) + 95) / 0x30uLL), 0x400A2AC0F1uLL);
      ccsrp_ctx_init();
      v55 = 8 * MEMORY[0x2199DD7B0](*(_QWORD *)(*(_QWORD *)(a1 + 8) + 8));
      v56 = malloc_type_malloc(v55, 0xBE6426DAuLL);
      bzero(v56, v55);
      started = ccsrp_client_start_authentication();
      if (started)
      {
        SETERROR(a1, "ccsrp_client_start_authentication failed: %d", v58, v59, v60, v61, v62, v63, started);
        return 0xFFFFFFFFLL;
      }
      ccz_read_uint();
      free(v56);
      v64 = 8 * MEMORY[0x2199DD7B0](*(_QWORD *)(*(_QWORD *)(a1 + 8) + 8));
      v65 = malloc_type_malloc(v64, 0xAF010F05uLL);
      bzero(v65, v64);
      ccz_write_uint();
      v66 = strlen(*(const char **)(a1 + 232));
      if (!CCKeyDerivationPBKDF(2u, *(const char **)(a1 + 232), v66, *(const uint8_t **)(a1 + 312), *(_QWORD *)(a1 + 320), 5u, *(_DWORD *)(a1 + 328), derivedKey, 0x80uLL))
      {
        *(_QWORD *)(a1 + 208) = ccsrp_get_session_key_length();
        v13 = ccsrp_client_process_challenge();
        free(v65);
        if ((_DWORD)v13)
        {
          v43 = (FILE *)*MEMORY[0x24BDAC8D8];
          v44 = "Error creating M1\n";
          v45 = 18;
          goto LABEL_33;
        }
        Bytes = CCRandomGenerateBytes((void *)(a1 + 296), 0x10uLL);
        if (Bytes)
        {
          SETERROR(a1, "Error reading random bytes for cIV: %d", v68, v69, v70, v71, v72, v73, Bytes);
          return 4294967286;
        }
        v79 = 0;
        Buffer = MakeBuffer((void **)(a1 + 344), (_DWORD *)(a1 + 352), (int64_t *)&v79, "%m%o%s%o", v70, v71, v72, v73, *(_QWORD *)(a1 + 64));
        *a5 = (_DWORD)v79;
        if ((_DWORD)Buffer)
          goto LABEL_32;
        *a4 = *(_QWORD *)(a1 + 344);
        v49 = 3;
        goto LABEL_39;
      }
      v46 = (FILE *)*MEMORY[0x24BDAC8D8];
      v47 = "Error hashing client password\n";
      v48 = 30;
    }
    else
    {
LABEL_34:
      v46 = (FILE *)*MEMORY[0x24BDAC8D8];
      v47 = "Values of 'N' and 'g' are not recommended\n";
      v48 = 42;
    }
    fwrite(v47, v48, 1uLL, v46);
    return 0xFFFFFFFFLL;
  }
  v79 = 0;
  *(_QWORD *)derivedKey = 0;
  *(_QWORD *)&v75 = 0;
  v78 = 0;
  v77 = 0;
  v14 = UnBuffer(a1, a2, a3, "%-o%-o%s%u", (uint64_t)a5, a6, a7, a8, (uint64_t)&v78 + 4);
  if ((_DWORD)v14)
  {
    v13 = v14;
    v21 = "Error UnBuffering input in step 3";
LABEL_41:
    SETERROR(a1, v21, v15, v16, v17, v18, v19, v20, derivedKeyLen);
    goto LABEL_42;
  }
  v29 = HIDWORD(v78);
  if (ccsrp_get_session_key_length() != v29)
  {
    v13 = 4294967286;
    v21 = "SRP Server M2 length wrong";
    goto LABEL_41;
  }
  if (!ccsrp_client_verify_session())
  {
    v13 = 4294967286;
    v21 = "SRP Server spoof detected. M2 incorrect";
    goto LABEL_41;
  }
  if (LayerInit(a1 + 264, a1))
  {
    v36 = "Error initializing security layer";
LABEL_16:
    SETERROR(a1, v36, v30, v31, v32, v33, v34, v35, derivedKeyLen);
    return 0xFFFFFFFFLL;
  }
  v13 = 0;
LABEL_42:
  if (v79)
    free(v79);
  return v13;
}

uint64_t srp_has_confidentiality(uint64_t a1)
{
  return (*(unsigned __int8 *)(a1 + 360) >> 1) & 1;
}

uint64_t UnBuffer(uint64_t a1, unsigned int *a2, uint64_t a3, unsigned __int8 *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  unsigned int v10;
  _BYTE *v11;
  const char *v12;
  const char *v13;
  uint64_t result;
  int v15;
  uint64_t v16;
  unsigned __int8 *v17;
  unint64_t v18;
  unsigned int **v19;
  size_t v20;
  unsigned int v21;
  unsigned int v22;
  unsigned int v23;
  _QWORD **v24;
  _QWORD *v25;
  unsigned int **v26;
  unsigned int v27;
  unsigned int v28;
  unsigned int **v29;
  unsigned int *v30;
  void *v31;
  unsigned int **v32;
  void *v33;
  const char *v34;
  uint64_t v35;
  char v36;
  unsigned int **v37;

  if (!a2 || a3 <= 3)
  {
    v36 = a3;
    v34 = "Buffer is not big enough to be SRP buffer: %d\n";
    goto LABEL_56;
  }
  v10 = bswap32(*a2);
  if (v10 != (_DWORD)a3 - 4)
  {
    v34 = "SRP Buffer isn't of the right length\n";
    goto LABEL_56;
  }
  v11 = a2 + 1;
  v37 = (unsigned int **)&a9;
  v12 = "Buffer is not big enough to be SRP MPI\n";
  v13 = "Buffer is not big enough to be SRP os\n";
  while (2)
  {
    result = *a4;
    if ((_DWORD)result != 37)
    {
      if (!*a4)
        goto LABEL_54;
      if (*v11 != (_DWORD)result)
        goto LABEL_53;
      ++v11;
      --v10;
      goto LABEL_37;
    }
    v15 = a4[1];
    if (v15 == 45)
      v16 = 2;
    else
      v16 = 1;
    if (v15 == 45)
      v17 = a4 + 2;
    else
      v17 = a4 + 1;
    HIDWORD(v18) = (char)a4[v16] - 99;
    LODWORD(v18) = HIDWORD(v18);
    switch((v18 >> 1))
    {
      case 0u:
        if (v10)
        {
          v19 = v37++;
          *(_BYTE *)*v19 = *v11;
          goto LABEL_19;
        }
        v13 = "Buffer is not big enough to be SRP char\n";
        goto LABEL_44;
      case 5u:
        v21 = v10 - 2;
        if (v10 < 2)
          goto LABEL_52;
        v22 = bswap32(*(unsigned __int16 *)v11);
        if (v21 < HIWORD(v22))
        {
          v12 = "Not enough data for this SRP MPI\n";
          goto LABEL_50;
        }
        LODWORD(v20) = HIWORD(v22);
        v11 += 2;
        ++v37;
        ccz_zero();
        ccz_read_uint();
        goto LABEL_36;
      case 6u:
        if (!v10)
        {
LABEL_44:
          v35 = a1;
          v34 = v13;
          goto LABEL_57;
        }
        v23 = *v11++;
        v20 = v23;
        v21 = v10 - 1;
        if (v10 - 1 < v23)
        {
          v12 = "Not enough data for this SRP os\n";
          goto LABEL_50;
        }
        **v37 = v20;
        v24 = (_QWORD **)(v37 + 1);
        v37 += 2;
        v25 = *v24;
        if (v15 == 45)
        {
          *v25 = v11;
        }
        else
        {
          v33 = malloc_type_malloc(v20, 0xB8D39F34uLL);
          *v25 = v33;
          if (!v33)
          {
LABEL_42:
            result = 4294967294;
            v10 = v21;
            goto LABEL_54;
          }
          memcpy(v33, v11, v20);
        }
        goto LABEL_36;
      case 7u:
        if (v10 < 8)
        {
          v12 = "Buffer is not big enough to be SRP uint64_t\n";
          goto LABEL_52;
        }
        v26 = v37++;
        *(_QWORD *)*v26 = bswap64(*(_QWORD *)v11);
        LODWORD(v20) = 8;
        goto LABEL_35;
      case 8u:
        v21 = v10 - 2;
        if (v10 < 2)
        {
          v12 = "Buffer is not big enough to be SRP UTF8\n";
          goto LABEL_52;
        }
        v27 = *(unsigned __int16 *)v11;
        v11 += 2;
        v28 = bswap32(v27);
        if (v21 >= HIWORD(v28))
        {
          v20 = HIWORD(v28);
          v29 = v37++;
          v30 = *v29;
          v31 = malloc_type_malloc((v20 + 1), 0x97446187uLL);
          *(_QWORD *)v30 = v31;
          if (!v31)
            goto LABEL_42;
          memcpy(v31, v11, v20);
          *(_BYTE *)(*(_QWORD *)v30 + v20) = 0;
LABEL_36:
          v11 += v20;
          v10 = v21 - v20;
          a4 = v17;
LABEL_37:
          ++a4;
          continue;
        }
        v12 = "Not enough data for this SRP UTF8\n";
LABEL_50:
        v10 = v21;
LABEL_52:
        SETERROR(a1, v12, a3, (uint64_t)a4, a5, a6, a7, a8, v36);
LABEL_53:
        result = 4294967291;
LABEL_54:
        if (v10)
        {
          v34 = "Extra data in SRP buffer\n";
LABEL_56:
          v35 = a1;
LABEL_57:
          SETERROR(v35, v34, a3, (uint64_t)a4, a5, a6, a7, a8, v36);
          return 4294967291;
        }
        return result;
      case 9u:
        if (v10 < 4)
        {
          v12 = "Buffer is not big enough to be SRP uint\n";
          goto LABEL_52;
        }
        v32 = v37++;
        **v32 = bswap32(*(unsigned __int16 *)v11) >> 16;
        LODWORD(v20) = 4;
LABEL_35:
        v21 = v10;
        goto LABEL_36;
      default:
        if (*v11 != a4[v16])
          goto LABEL_53;
LABEL_19:
        LODWORD(v20) = 1;
        goto LABEL_35;
    }
  }
}

uint64_t MakeBuffer(void **a1, _DWORD *a2, int64_t *a3, _BYTE *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  _BYTE *v9;
  unint64_t v13;
  _BYTE *i;
  int v15;
  unint64_t v16;
  size_t v17;
  unsigned int *v18;
  unsigned int v19;
  const char **v20;
  uint64_t result;
  char *v22;
  int v23;
  uint64_t v24;
  int v25;
  unint64_t v26;
  int *v27;
  uint64_t v28;
  uint64_t *v29;
  size_t v30;
  const void *v31;
  unint64_t *v32;
  const char **v33;
  const char *v34;
  size_t v35;
  unsigned int *v36;
  FILE *v37;
  const char *v38;
  size_t v39;
  _DWORD *v40;
  int64_t v41;
  const char **v42;
  _QWORD *v43;
  uint64_t *v44;

  v9 = a4;
  v13 = 0;
  v42 = (const char **)&a9;
  for (i = a4; *i != 37; ++i)
  {
    if (!*i)
    {
      if (v13 < 0x7FFFFFFC)
      {
        result = conditional_realloc(a1, a2, (v13 + 4));
        if (!(_DWORD)result)
        {
          v22 = (char *)*a1 + 4;
          v44 = &a9;
          while (1)
          {
            v23 = *v9;
            if (v23 == 37)
            {
              v25 = *++v9;
              LOBYTE(v23) = v25;
              HIDWORD(v26) = v25 - 99;
              LODWORD(v26) = v25 - 99;
              switch((v26 >> 1))
              {
                case 0u:
                  v27 = (int *)v44++;
                  v23 = *v27;
                  goto LABEL_22;
                case 5u:
                  ++v44;
                  v28 = ccz_write_uint_size();
                  ccz_write_uint();
                  *(_WORD *)v22 = bswap32(v28) >> 16;
                  v24 = v28 + 2;
                  break;
                case 6u:
                  v29 = v44;
                  v30 = *(int *)v44;
                  v44 += 2;
                  v31 = (const void *)v29[1];
                  *v22 = v30;
                  memcpy(v22 + 1, v31, v30);
                  v24 = v30 + 1;
                  break;
                case 7u:
                  v32 = (unint64_t *)v44++;
                  *(_QWORD *)v22 = bswap64(*v32);
                  v24 = 8;
                  break;
                case 8u:
                  v33 = (const char **)v44++;
                  v34 = *v33;
                  v35 = strlen(*v33);
                  *(_WORD *)v22 = bswap32(v35) >> 16;
                  memcpy(v22 + 2, v34, v35);
                  v24 = v35 + 2;
                  break;
                case 9u:
                  v36 = (unsigned int *)v44++;
                  *(_DWORD *)v22 = bswap32(*v36);
                  v24 = 4;
                  break;
                default:
                  goto LABEL_22;
              }
            }
            else
            {
              if (!*v9)
              {
                result = 0;
                goto LABEL_35;
              }
LABEL_22:
              *v22 = v23;
              v24 = 1;
            }
            v22 += v24;
            ++v9;
          }
        }
      }
      else
      {
        fwrite("String too long to create SRP buffer string\n", 0x2CuLL, 1uLL, (FILE *)*MEMORY[0x24BDAC8D8]);
        return 0xFFFFFFFFLL;
      }
      return result;
    }
LABEL_4:
    ++v13;
LABEL_5:
    ;
  }
  v15 = *++i;
  HIDWORD(v16) = v15 - 99;
  LODWORD(v16) = v15 - 99;
  switch((v16 >> 1))
  {
    case 0u:
      ++v42;
      goto LABEL_4;
    case 5u:
      ++v42;
      v17 = ccz_write_uint_size();
      if (v17 < 0x10000)
        goto LABEL_14;
      v37 = (FILE *)*MEMORY[0x24BDAC8D8];
      v38 = "String too long to create mpi string\n";
      v39 = 37;
      goto LABEL_34;
    case 6u:
      v18 = (unsigned int *)v42;
      v43 = v42 + 1;
      v19 = *v18;
      if (v19 < 0x100)
      {
        v13 += v19 + 1;
        v42 = (const char **)(v43 + 1);
        goto LABEL_5;
      }
      v37 = (FILE *)*MEMORY[0x24BDAC8D8];
      v38 = "String too long to create os string\n";
      v39 = 36;
LABEL_34:
      fwrite(v38, v39, 1uLL, v37);
      v22 = 0;
      result = 0xFFFFFFFFLL;
LABEL_35:
      v40 = *a1;
      v41 = v22 - (_BYTE *)*a1;
      *a3 = v41;
      *v40 = bswap32(v41 - 4);
      return result;
    case 7u:
      ++v42;
      v13 += 8;
      goto LABEL_5;
    case 8u:
      v20 = v42++;
      v17 = strlen(*v20);
      if (v17 >= 0x10000)
      {
        v37 = (FILE *)*MEMORY[0x24BDAC8D8];
        v38 = "String too long to create utf8 string\n";
        v39 = 38;
        goto LABEL_34;
      }
LABEL_14:
      v13 += v17 + 2;
      goto LABEL_5;
    case 9u:
      ++v42;
      v13 += 4;
      goto LABEL_5;
    default:
      goto LABEL_4;
  }
}

uint64_t set_ccsrp_groups()
{
  uint64_t result;

  qword_254DB27A0 = ccsrp_gp_rfc5054_1024();
  qword_254DB27C8 = ccsrp_gp_rfc5054_2048();
  qword_254DB27F0 = ccsrp_gp_rfc5054_4096();
  result = ccsrp_gp_rfc5054_8192();
  qword_254DB2818 = result;
  return result;
}

uint64_t OptionsToString(int *a1, char **a2)
{
  char *v4;
  char *v5;
  int v6;
  BOOL v7;
  size_t v8;
  char *v9;
  char *v10;
  char *v11;
  char *v12;
  char *v13;
  size_t v14;
  int v15;
  char *v16;
  char *v17;
  uint64_t result;

  v4 = (char *)malloc_type_malloc(1uLL, 0xE8F6629AuLL);
  if (!v4)
    return 4294967294;
  v5 = v4;
  *v4 = 0;
  v6 = *a1;
  v7 = (*a1 & 1) == 0;
  if ((*a1 & 1) != 0)
  {
    v9 = (char *)reallocf(v4, 0xDuLL);
    if (!v9)
      return 4294967294;
    v5 = v9;
    v8 = 13;
    strlcat(v9, "mda=", 0xDuLL);
    strlcat(v5, "SHA-512", 0xDuLL);
  }
  else
  {
    v8 = 1;
  }
  if (*((_BYTE *)a1 + 4))
  {
    v8 += 17;
    v10 = (char *)reallocf(v5, v8);
    if (!v10)
      return 4294967294;
    v5 = v10;
    if ((v6 & 1) != 0)
      strlcat(v10, ",", v8);
    strlcat(v5, "replay_detection", v8);
    v7 = 0;
  }
  if ((a1[2] & 1) != 0)
  {
    v8 += 44;
    v11 = (char *)reallocf(v5, v8);
    if (!v11)
      return 4294967294;
    v5 = v11;
    if (!v7)
      strlcat(v11, ",", v8);
    strlcat(v5, "confidentiality+integrity=", v8);
    strlcat(v5, "ChaCha20-Poly1305", v8);
    v7 = 0;
  }
  if ((a1[4] & 1) != 0)
  {
    v8 += 25;
    v12 = (char *)reallocf(v5, v8);
    if (!v12)
      return 4294967294;
    v5 = v12;
    if (!v7)
      strlcat(v12, ",", v8);
    strlcat(v5, "kdf=", v8);
    strlcat(v5, "SALTED-SHA512-PBKDF2", v8);
    v7 = 0;
  }
  if (a1[2] && *((_QWORD *)a1 + 3) <= 0x7FFFFFFAuLL)
  {
    v8 += 25;
    v13 = (char *)reallocf(v5, v8);
    if (!v13)
      return 4294967294;
    v5 = v13;
    if (!v7)
      strlcat(v13, ",", v8);
    strlcat(v5, "maxbuffersize=", v8);
    v14 = strlen(v5);
    snprintf(&v5[v14], v8 - v14, "%lu", *((_QWORD *)a1 + 3));
    v7 = 0;
  }
  v15 = a1[3];
  if ((v15 & 1) != 0)
  {
    v8 += 27;
    v16 = (char *)reallocf(v5, v8);
    if (!v16)
      return 4294967294;
    v5 = v16;
    if (!v7)
      strlcat(v16, ",", v8);
    strlcat(v5, "mandatory=", v8);
    strlcat(v5, "replay_detection", v8);
    v7 = 0;
    v15 = a1[3];
  }
  if ((v15 & 2) == 0)
  {
LABEL_37:
    result = 0;
    *a2 = v5;
    return result;
  }
  v17 = (char *)reallocf(v5, v8 + 36);
  if (v17)
  {
    v5 = v17;
    if (!v7)
      strlcat(v17, ",", v8 + 36);
    strlcat(v5, "mandatory=", v8 + 36);
    strlcat(v5, "confidentiality+integrity", v8 + 36);
    goto LABEL_37;
  }
  return 4294967294;
}

uint64_t ParseOptions(uint64_t a1, char *__s, int *a3, char a4)
{
  char *v6;
  size_t v7;
  size_t v8;
  char *v9;
  char *v10;
  unint64_t v11;
  char *v12;
  char *v13;
  uint64_t v14;
  char *v15;
  __darwin_ct_rune_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  int v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  int v31;
  int v32;
  int v33;
  int v34;
  int v35;
  unint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  int v43;
  const char *v44;
  const char *v45;
  char v47;

  *(_OWORD *)a3 = 0u;
  *((_OWORD *)a3 + 1) = 0u;
  *((_QWORD *)a3 + 3) = 2147483643;
  if (__s)
  {
    v6 = __s;
    while (1)
    {
      v7 = strlen(v6);
      if (!v7)
        return 0;
      v8 = v7;
      v9 = strchr(v6, 44);
      if (v9)
        v10 = v9;
      else
        v10 = &v6[v8];
      v11 = v10 - v6;
      v12 = (char *)malloc_type_malloc(v10 - v6 + 1, 0xE0D51E1AuLL);
      if (!v12)
        return 4294967294;
      v13 = v12;
      if (v10 != v6)
      {
        if (v11 <= 1)
          v14 = 1;
        else
          v14 = v10 - v6;
        v15 = v12;
        do
        {
          v16 = *v6++;
          *v15++ = __tolower(v16);
          --v14;
        }
        while (v14);
      }
      v13[v11] = 0;
      v6 = v10 + 1;
      v17 = *v10;
      if (!strncasecmp(v13, "mda=", 4uLL))
      {
        v32 = strcasecmp(v13 + 4, "SHA-512");
        if ((a4 & 1) != 0)
        {
          if (v32)
          {
            *a3 = 0;
            SETERROR(a1, "SRP MDA %s not supported", v18, v19, v20, v21, v22, v23, (_BYTE)v13 + 4);
            goto LABEL_57;
          }
          v33 = *a3;
          if (*a3)
          {
            *a3 = 0;
            v44 = "Multiple SRP MDAs given";
            goto LABEL_56;
          }
        }
        else
        {
          v33 = *a3;
        }
        *a3 = v33 | (v32 == 0);
      }
      else if (!strcasecmp(v13, "replay_detection"))
      {
        if (*((_BYTE *)a3 + 4))
        {
          v44 = "SRP Replay Detection option appears twice";
          goto LABEL_56;
        }
        *((_BYTE *)a3 + 4) = 1;
      }
      else if (!strncasecmp(v13, "confidentiality+integrity=", 0x1AuLL))
      {
        v34 = strcasecmp(v13 + 26, "ChaCha20-Poly1305");
        if ((a4 & 1) != 0)
        {
          if (v34)
          {
            a3[2] = 0;
            SETERROR(a1, "SRP Confidentiality+Integrity option %s not supported", v25, v26, v27, v28, v29, v30, (_BYTE)v13 + 26);
            goto LABEL_60;
          }
          v35 = a3[2];
          if (v35)
          {
            a3[2] = 0;
            v45 = "Multiple SRP Confidentiality+Integrity options given";
LABEL_59:
            SETERROR(a1, v45, v25, v26, v27, v28, v29, v30, v47);
LABEL_60:
            v17 = 0xFFFFFFFFLL;
            goto LABEL_61;
          }
        }
        else
        {
          v35 = a3[2];
        }
        a3[2] = v35 | (v34 == 0);
      }
      else if ((a4 & 1) == 0 && !strncasecmp(v13, "mandatory=", 0xAuLL))
      {
        if (!strcasecmp(v13 + 10, "replay_detection"))
        {
          v43 = a3[3] | 1;
        }
        else
        {
          if (strncasecmp(v13 + 10, "confidentiality+integrity", 0x19uLL))
          {
            v47 = (_BYTE)v13 + 10;
            v44 = "Mandatory SRP option %s not supported";
LABEL_56:
            SETERROR(a1, v44, v18, v19, v20, v21, v22, v23, v47);
LABEL_57:
            v17 = 4294967291;
LABEL_61:
            free(v13);
            return v17;
          }
          v43 = a3[3] | 2;
        }
        a3[3] = v43;
      }
      else if (!strncasecmp(v13, "maxbuffersize=", 0xEuLL))
      {
        v36 = strtoul(v13 + 14, 0, 10);
        *((_QWORD *)a3 + 3) = v36;
        if (v36 > 0x7FFFFFFB)
        {
          SETERROR(a1, "SRP Maxbuffersize %lu too big (> %u)", v37, v38, v39, v40, v41, v42, v36);
          goto LABEL_57;
        }
      }
      else if (!strncasecmp(v13, "kdf=", 4uLL))
      {
        v24 = strcasecmp(v13 + 4, "SALTED-SHA512-PBKDF2");
        if ((a4 & 1) != 0)
        {
          if (v24)
          {
            a3[4] = 0;
            SETERROR(a1, "SRP KDF option %s not supported", v25, v26, v27, v28, v29, v30, (_BYTE)v13 + 4);
            goto LABEL_60;
          }
          v31 = a3[4];
          if (v31)
          {
            a3[4] = 0;
            v45 = "Multiple SRP KDF options given";
            goto LABEL_59;
          }
        }
        else
        {
          v31 = a3[4];
        }
        a3[4] = v31 | (v24 == 0);
      }
      free(v13);
      if (!(_DWORD)v17)
        return v17;
    }
  }
  return 0;
}

uint64_t SetMDA(_DWORD *a1, uint64_t a2)
{
  uint64_t digestbyname;
  uint64_t result;

  if (*a1 == 1)
  {
    digestbyname = cc_get_digestbyname("sha512");
    result = 0;
    *(_QWORD *)(a2 + 336) = digestbyname;
  }
  else
  {
    fwrite("Unable to find SRP MDA option now\n", 0x22uLL, 1uLL, (FILE *)*MEMORY[0x24BDAC8D8]);
    return 0xFFFFFFFFLL;
  }
  return result;
}

uint64_t LayerInit(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  int v5;
  FILE *v6;
  const char *v7;
  size_t v8;
  uint64_t result;

  v4 = *(_QWORD *)(a1 + 24);
  if (*(_BYTE *)(a1 + 4))
  {
    *(_DWORD *)(a2 + 360) |= 1u;
    v5 = *(_DWORD *)(a1 + 8);
    if (!v5)
    {
      v5 = 1;
      *(_DWORD *)(a1 + 8) = 1;
    }
  }
  else
  {
    v5 = *(_DWORD *)(a1 + 8);
    if (!v5)
      goto LABEL_10;
  }
  *(_DWORD *)(a2 + 360) |= 2u;
  if (v5 == 1)
  {
    if (strcasecmp("ChaCha20-Poly1305", "ChaCha20-Poly1305"))
    {
      v6 = (FILE *)*MEMORY[0x24BDAC8D8];
      v7 = "Unsupported SRP confidentiality+integrity layer option, not ChaCha20-Poly1305\n";
LABEL_13:
      v8 = 78;
      goto LABEL_14;
    }
    LODWORD(v4) = v4 - 16;
    chacha20_poly1305_init_64x64();
    chacha20_poly1305_init_64x64();
LABEL_10:
    if (*(_DWORD *)(a1 + 16) == 1)
    {
      result = 0;
      *(_OWORD *)(a2 + 936) = 0u;
      *(_OWORD *)(a2 + 952) = 0u;
      *(_DWORD *)(a2 + 936) = 4;
      *(_DWORD *)(a2 + 964) = v4 - 4;
      return result;
    }
    v6 = (FILE *)*MEMORY[0x24BDAC8D8];
    v7 = "Unable to find SRP KDF layer option, kdf=SALTED-SHA512-PBKDF2 option required\n";
    goto LABEL_13;
  }
  v6 = (FILE *)*MEMORY[0x24BDAC8D8];
  v7 = "Unable to find SRP confidentiality+integrity layer option\n";
  v8 = 58;
LABEL_14:
  fwrite(v7, v8, 1uLL, v6);
  return 0xFFFFFFFFLL;
}

id ldap_connection_obj_alloc(uint64_t a1)
{
  size_t v1;
  objc_class *v2;

  v1 = a1 - 8;
  v2 = (objc_class *)objc_opt_class();
  return class_createInstance(v2, v1);
}

id ldap_operation_obj_alloc(uint64_t a1)
{
  size_t v1;
  objc_class *v2;

  v1 = a1 - 8;
  v2 = (objc_class *)objc_opt_class();
  return class_createInstance(v2, v1);
}

uint64_t decode_PagedSearchControlValue()
{
  return _asn1_decode_top();
}

uint64_t encode_PagedSearchControlValue()
{
  return _asn1_encode();
}

uint64_t length_PagedSearchControlValue()
{
  return _asn1_length();
}

uint64_t free_PagedSearchControlValue()
{
  return _asn1_free_top();
}

void _ldap_connection_create_cold_1()
{
  OUTLINED_FUNCTION_1();
  _os_crash();
  __break(1u);
}

void _o_ldap_connection_cancel_all_operations_cold_1()
{
  uint64_t v0;
  uint8_t v1[12];
  __int16 v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x24BDAC8D0];
  OUTLINED_FUNCTION_3();
  v2 = 2048;
  v3 = v0;
  _os_log_debug_impl(&dword_215173000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEBUG, "connection: %p, cancel operation count: %ld", v1, 0x16u);
  OUTLINED_FUNCTION_0();
}

void ldap_connection_query_create_cold_1()
{
  uint64_t v0;
  uint8_t v1[12];
  __int16 v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x24BDAC8D0];
  OUTLINED_FUNCTION_3();
  v2 = 2080;
  v3 = v0;
  _os_log_error_impl(&dword_215173000, MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR, "connection: %p, invalid filter provided: %s", v1, 0x16u);
  OUTLINED_FUNCTION_0();
}

void _o_ldap_operation_cancel_internal_cold_1()
{
  int v0;
  uint8_t v1[12];
  __int16 v2;
  int v3;
  uint64_t v4;

  v4 = *MEMORY[0x24BDAC8D0];
  OUTLINED_FUNCTION_3();
  v2 = 1024;
  v3 = v0;
  _os_log_debug_impl(&dword_215173000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEBUG, "abandon connection: %p, ldap msgid: %d", v1, 0x12u);
  OUTLINED_FUNCTION_0();
}

void ___o_initiate_tls_handshake_block_invoke_cold_1()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint8_t v5;

  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_2(&dword_215173000, MEMORY[0x24BDACB70], v0, "connection: %p, error: %{AppleLDAPTypes:ldap_error_t}d", v1, v2, v3, v4, v5);
  OUTLINED_FUNCTION_0();
}

void ___o_negotiate_ssl_block_invoke_cold_1()
{
  uint8_t v0[24];
  uint64_t v1;

  v1 = *MEMORY[0x24BDAC8D0];
  OUTLINED_FUNCTION_3();
  _os_log_debug_impl(&dword_215173000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEBUG, "connection: %p, TLS: negotiated", v0, 0xCu);
  OUTLINED_FUNCTION_0();
}

void ___schedule_read_block_invoke_cold_1()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint8_t v5;

  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_2(&dword_215173000, MEMORY[0x24BDACB70], v0, "connection: %p, error: %{errno}d", v1, v2, v3, v4, v5);
  OUTLINED_FUNCTION_0();
}

void _o_ldap_receive_messages_cold_1()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint8_t v5;

  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_2(&dword_215173000, MEMORY[0x24BDACB70], v0, "connection: %p, error: %{AppleLDAPTypes:asn1err}d", v1, v2, v3, v4, v5);
  OUTLINED_FUNCTION_0();
}

void ___o_ldap_wakeup_block_invoke_cold_1()
{
  int v0;
  __int16 v1;
  int v2;
  uint8_t v3[14];
  int v4;
  __int16 v5;
  int v6;
  uint64_t v7;

  v7 = *MEMORY[0x24BDAC8D0];
  OUTLINED_FUNCTION_6();
  v4 = v0;
  v5 = v1;
  v6 = v2;
  _os_log_error_impl(&dword_215173000, MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR, "connection: %p, ldap msgid: %d, tcp_connection error: %{errno}d", v3, 0x18u);
  OUTLINED_FUNCTION_0();
}

void _ldap_continue_sasl_cold_1()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint8_t v5;

  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_5(&dword_215173000, MEMORY[0x24BDACB70], v0, "connection: %p, mech: %{public}@, error: %{AppleLDAPTypes:ldap_error_t}d", v1, v2, v3, v4, v5);
}

void ___o_ldap_digestmd5_auth_block_invoke_2_cold_1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_5(&dword_215173000, MEMORY[0x24BDACB70], a3, "connection: %p, address: %{public,network:sockaddr}.*P, DIGEST-MD5 response: invalid", a5, a6, a7, a8, 2u);
}

void ___o_ldap_digestmd5_auth_block_invoke_2_cold_2(uint64_t a1)
{
  uint64_t v1;
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x24BDAC8D0];
  v1 = *(_QWORD *)(a1 + 32);
  v2 = 134217984;
  v3 = v1;
  _os_log_error_impl(&dword_215173000, MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR, "connection: %p, credentials: invalid", (uint8_t *)&v2, 0xCu);
  OUTLINED_FUNCTION_0();
}

uint64_t CCCreateBigNum()
{
  return MEMORY[0x24BDAC0E0]();
}

int CCKeyDerivationPBKDF(CCPBKDFAlgorithm algorithm, const char *password, size_t passwordLen, const uint8_t *salt, size_t saltLen, CCPseudoRandomAlgorithm prf, unsigned int rounds, uint8_t *derivedKey, size_t derivedKeyLen)
{
  return MEMORY[0x24BDAC280](*(_QWORD *)&algorithm, password, passwordLen, salt, saltLen, *(_QWORD *)&prf, *(_QWORD *)&rounds, derivedKey);
}

CCRNGStatus CCRandomGenerateBytes(void *bytes, size_t count)
{
  return MEMORY[0x24BDAC2D0](bytes, count);
}

void CFArrayAppendValue(CFMutableArrayRef theArray, const void *value)
{
  MEMORY[0x24BDBB7C8](theArray, value);
}

CFArrayRef CFArrayCreate(CFAllocatorRef allocator, const void **values, CFIndex numValues, const CFArrayCallBacks *callBacks)
{
  return (CFArrayRef)MEMORY[0x24BDBB7F0](allocator, values, numValues, callBacks);
}

CFMutableArrayRef CFArrayCreateMutable(CFAllocatorRef allocator, CFIndex capacity, const CFArrayCallBacks *callBacks)
{
  return (CFMutableArrayRef)MEMORY[0x24BDBB808](allocator, capacity, callBacks);
}

CFIndex CFArrayGetCount(CFArrayRef theArray)
{
  return MEMORY[0x24BDBB820](theArray);
}

const void *__cdecl CFArrayGetValueAtIndex(CFArrayRef theArray, CFIndex idx)
{
  return (const void *)MEMORY[0x24BDBB860](theArray, idx);
}

Boolean CFBooleanGetValue(CFBooleanRef BOOLean)
{
  return MEMORY[0x24BDBBA20](BOOLean);
}

CFDataRef CFDataCreate(CFAllocatorRef allocator, const UInt8 *bytes, CFIndex length)
{
  return (CFDataRef)MEMORY[0x24BDBBC98](allocator, bytes, length);
}

CFMutableDictionaryRef CFDictionaryCreateMutable(CFAllocatorRef allocator, CFIndex capacity, const CFDictionaryKeyCallBacks *keyCallBacks, const CFDictionaryValueCallBacks *valueCallBacks)
{
  return (CFMutableDictionaryRef)MEMORY[0x24BDBBDF0](allocator, capacity, keyCallBacks, valueCallBacks);
}

const void *__cdecl CFDictionaryGetValue(CFDictionaryRef theDict, const void *key)
{
  return (const void *)MEMORY[0x24BDBBE30](theDict, key);
}

void CFDictionarySetValue(CFMutableDictionaryRef theDict, const void *key, const void *value)
{
  MEMORY[0x24BDBBE60](theDict, key, value);
}

Boolean CFEqual(CFTypeRef cf1, CFTypeRef cf2)
{
  return MEMORY[0x24BDBBE68](cf1, cf2);
}

void CFRelease(CFTypeRef cf)
{
  MEMORY[0x24BDBC298](cf);
}

CFTypeRef CFRetain(CFTypeRef cf)
{
  return (CFTypeRef)MEMORY[0x24BDBC2A8](cf);
}

void CFSetAddValue(CFMutableSetRef theSet, const void *value)
{
  MEMORY[0x24BDBC3C0](theSet, value);
}

Boolean CFSetContainsValue(CFSetRef theSet, const void *value)
{
  return MEMORY[0x24BDBC3D0](theSet, value);
}

CFMutableSetRef CFSetCreateMutable(CFAllocatorRef allocator, CFIndex capacity, const CFSetCallBacks *callBacks)
{
  return (CFMutableSetRef)MEMORY[0x24BDBC3E8](allocator, capacity, callBacks);
}

CFStringRef CFStringCreateWithBytes(CFAllocatorRef alloc, const UInt8 *bytes, CFIndex numBytes, CFStringEncoding encoding, Boolean isExternalRepresentation)
{
  return (CFStringRef)MEMORY[0x24BDBC558](alloc, bytes, numBytes, *(_QWORD *)&encoding, isExternalRepresentation);
}

CFStringRef CFStringCreateWithCString(CFAllocatorRef alloc, const char *cStr, CFStringEncoding encoding)
{
  return (CFStringRef)MEMORY[0x24BDBC568](alloc, cStr, *(_QWORD *)&encoding);
}

Boolean CFStringGetCString(CFStringRef theString, char *buffer, CFIndex bufferSize, CFStringEncoding encoding)
{
  return MEMORY[0x24BDBC600](theString, buffer, bufferSize, *(_QWORD *)&encoding);
}

const char *__cdecl CFStringGetCStringPtr(CFStringRef theString, CFStringEncoding encoding)
{
  return (const char *)MEMORY[0x24BDBC610](theString, *(_QWORD *)&encoding);
}

CFIndex CFStringGetLength(CFStringRef theString)
{
  return MEMORY[0x24BDBC658](theString);
}

CFIndex CFStringGetMaximumSizeForEncoding(CFIndex length, CFStringEncoding encoding)
{
  return MEMORY[0x24BDBC660](length, *(_QWORD *)&encoding);
}

CFStringRef CFURLCopyHostName(CFURLRef anURL)
{
  return (CFStringRef)MEMORY[0x24BDBC7A0](anURL);
}

CFStringRef CFURLCopyScheme(CFURLRef anURL)
{
  return (CFStringRef)MEMORY[0x24BDBC7D8](anURL);
}

SInt32 CFURLGetPortNumber(CFURLRef anURL)
{
  return MEMORY[0x24BDBC8A0](anURL);
}

OSStatus SSLClose(SSLContextRef context)
{
  return MEMORY[0x24BDE8658](context);
}

SSLContextRef SSLCreateContext(CFAllocatorRef alloc, SSLProtocolSide protocolSide, SSLConnectionType connectionType)
{
  return (SSLContextRef)MEMORY[0x24BDE8668](alloc, *(_QWORD *)&protocolSide, *(_QWORD *)&connectionType);
}

OSStatus SSLGetBufferedReadSize(SSLContextRef context, size_t *bufferSize)
{
  return MEMORY[0x24BDE8670](context, bufferSize);
}

OSStatus SSLGetSessionState(SSLContextRef context, SSLSessionState *state)
{
  return MEMORY[0x24BDE86A0](context, state);
}

OSStatus SSLHandshake(SSLContextRef context)
{
  return MEMORY[0x24BDE86A8](context);
}

OSStatus SSLRead(SSLContextRef context, void *data, size_t dataLength, size_t *processed)
{
  return MEMORY[0x24BDE86E0](context, data, dataLength, processed);
}

OSStatus SSLSetCertificate(SSLContextRef context, CFArrayRef certRefs)
{
  return MEMORY[0x24BDE86E8](context, certRefs);
}

OSStatus SSLSetConnection(SSLContextRef context, SSLConnectionRef connection)
{
  return MEMORY[0x24BDE86F8](context, connection);
}

OSStatus SSLSetIOFuncs(SSLContextRef context, SSLReadFunc readFunc, SSLWriteFunc writeFunc)
{
  return MEMORY[0x24BDE8708](context, readFunc, writeFunc);
}

OSStatus SSLSetPeerDomainName(SSLContextRef context, const char *peerName, size_t peerNameLen)
{
  return MEMORY[0x24BDE8718](context, peerName, peerNameLen);
}

OSStatus SSLSetProtocolVersionMin(SSLContextRef context, SSLProtocol minVersion)
{
  return MEMORY[0x24BDE8730](context, *(_QWORD *)&minVersion);
}

OSStatus SSLWrite(SSLContextRef context, const void *data, size_t dataLength, size_t *processed)
{
  return MEMORY[0x24BDE8750](context, data, dataLength, processed);
}

void *__cdecl _Block_copy(const void *aBlock)
{
  return (void *)MEMORY[0x24BDAC720](aBlock);
}

void _Block_object_dispose(const void *a1, const int a2)
{
  MEMORY[0x24BDAC730](a1, *(_QWORD *)&a2);
}

void _Block_release(const void *aBlock)
{
  MEMORY[0x24BDAC738](aBlock);
}

int __maskrune(__darwin_ct_rune_t a1, unint64_t a2)
{
  return MEMORY[0x24BDAC838](*(_QWORD *)&a1, a2);
}

uint64_t __strlcpy_chk()
{
  return MEMORY[0x24BDAC910]();
}

__darwin_ct_rune_t __tolower(__darwin_ct_rune_t a1)
{
  return MEMORY[0x24BDAC930](*(_QWORD *)&a1);
}

uint64_t _asn1_decode_top()
{
  return MEMORY[0x24BEDBD60]();
}

uint64_t _asn1_encode()
{
  return MEMORY[0x24BEDBD68]();
}

uint64_t _asn1_free_top()
{
  return MEMORY[0x24BEDBD70]();
}

uint64_t _asn1_length()
{
  return MEMORY[0x24BEDBD78]();
}

uint64_t _os_assert_log()
{
  return MEMORY[0x24BDACB40]();
}

uint64_t _os_assumes_log()
{
  return MEMORY[0x24BDACB48]();
}

uint64_t _os_crash()
{
  return MEMORY[0x24BDACB50]();
}

void _os_log_debug_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x24BDACB68](dso, log, type, format, buf, *(_QWORD *)&size);
}

void _os_log_error_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x24BDACB80](dso, log, type, format, buf, *(_QWORD *)&size);
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x24BDACB90](dso, log, type, format, buf, *(_QWORD *)&size);
}

int asprintf(char **a1, const char *a2, ...)
{
  return MEMORY[0x24BDAD200](a1, a2);
}

void bzero(void *a1, size_t a2)
{
  MEMORY[0x24BDAD320](a1, a2);
}

uint64_t ccdh_ccn_size()
{
  return MEMORY[0x24BDAD528]();
}

uint64_t ccdh_gp_n()
{
  return MEMORY[0x24BDAD530]();
}

uint64_t ccrng()
{
  return MEMORY[0x24BDAD758]();
}

uint64_t ccsha224_di()
{
  return MEMORY[0x24BDAD820]();
}

uint64_t ccsha256_di()
{
  return MEMORY[0x24BDAD828]();
}

uint64_t ccsha384_di()
{
  return MEMORY[0x24BDAD838]();
}

uint64_t ccsha512_di()
{
  return MEMORY[0x24BDAD840]();
}

uint64_t ccsrp_client_process_challenge()
{
  return MEMORY[0x24BDAD850]();
}

uint64_t ccsrp_client_start_authentication()
{
  return MEMORY[0x24BDAD860]();
}

uint64_t ccsrp_client_verify_session()
{
  return MEMORY[0x24BDAD868]();
}

uint64_t ccsrp_ctx_init()
{
  return MEMORY[0x24BDAD870]();
}

uint64_t ccsrp_get_session_key_length()
{
  return MEMORY[0x24BDAD8A0]();
}

uint64_t ccsrp_gp_rfc5054_1024()
{
  return MEMORY[0x24BDAD8A8]();
}

uint64_t ccsrp_gp_rfc5054_2048()
{
  return MEMORY[0x24BDAD8B0]();
}

uint64_t ccsrp_gp_rfc5054_4096()
{
  return MEMORY[0x24BDAD8C0]();
}

uint64_t ccsrp_gp_rfc5054_8192()
{
  return MEMORY[0x24BDAD8C8]();
}

uint64_t ccz_cmp()
{
  return MEMORY[0x24BDAD8F8]();
}

uint64_t ccz_cmpi()
{
  return MEMORY[0x24BDAD900]();
}

uint64_t ccz_read_uint()
{
  return MEMORY[0x24BDAD908]();
}

uint64_t ccz_write_uint()
{
  return MEMORY[0x24BDAD910]();
}

uint64_t ccz_write_uint_size()
{
  return MEMORY[0x24BDAD918]();
}

uint64_t ccz_zero()
{
  return MEMORY[0x24BDAD920]();
}

uint64_t chacha20_poly1305_decrypt()
{
  return MEMORY[0x24BE29B78]();
}

uint64_t chacha20_poly1305_encrypt()
{
  return MEMORY[0x24BE29B90]();
}

uint64_t chacha20_poly1305_final()
{
  return MEMORY[0x24BE29BA8]();
}

uint64_t chacha20_poly1305_init_64x64()
{
  return MEMORY[0x24BE29BB0]();
}

uint64_t chacha20_poly1305_verify()
{
  return MEMORY[0x24BE29BB8]();
}

id class_createInstance(Class cls, size_t extraBytes)
{
  return (id)MEMORY[0x24BEDCE88](cls, extraBytes);
}

int close(int a1)
{
  return MEMORY[0x24BDAD9D8](*(_QWORD *)&a1);
}

int connect(int a1, const sockaddr *a2, socklen_t a3)
{
  return MEMORY[0x24BDADA10](*(_QWORD *)&a1, a2, *(_QWORD *)&a3);
}

void dispatch_assert_queue_V2(dispatch_queue_t queue)
{
  MEMORY[0x24BDADCA8](queue);
}

void dispatch_async(dispatch_queue_t queue, dispatch_block_t block)
{
  MEMORY[0x24BDADCC0](queue, block);
}

void dispatch_async_f(dispatch_queue_t queue, void *context, dispatch_function_t work)
{
  MEMORY[0x24BDADCD8](queue, context, work);
}

void dispatch_barrier_async(dispatch_queue_t queue, dispatch_block_t block)
{
  MEMORY[0x24BDADCE0](queue, block);
}

void dispatch_barrier_sync(dispatch_queue_t queue, dispatch_block_t block)
{
  MEMORY[0x24BDADCF8](queue, block);
}

void dispatch_barrier_sync_f(dispatch_queue_t queue, void *context, dispatch_function_t work)
{
  MEMORY[0x24BDADD00](queue, context, work);
}

dispatch_data_t dispatch_data_create(const void *buffer, size_t size, dispatch_queue_t queue, dispatch_block_t destructor)
{
  return (dispatch_data_t)MEMORY[0x24BDADD60](buffer, size, queue, destructor);
}

dispatch_data_t dispatch_data_create_concat(dispatch_data_t data1, dispatch_data_t data2)
{
  return (dispatch_data_t)MEMORY[0x24BDADD70](data1, data2);
}

dispatch_data_t dispatch_data_create_map(dispatch_data_t data, const void **buffer_ptr, size_t *size_ptr)
{
  return (dispatch_data_t)MEMORY[0x24BDADD78](data, buffer_ptr, size_ptr);
}

dispatch_data_t dispatch_data_create_subrange(dispatch_data_t data, size_t offset, size_t length)
{
  return (dispatch_data_t)MEMORY[0x24BDADD80](data, offset, length);
}

size_t dispatch_data_get_size(dispatch_data_t data)
{
  return MEMORY[0x24BDADD90](data);
}

dispatch_queue_global_t dispatch_get_global_queue(intptr_t identifier, uintptr_t flags)
{
  return (dispatch_queue_global_t)MEMORY[0x24BDADDA8](identifier, flags);
}

void dispatch_group_async(dispatch_group_t group, dispatch_queue_t queue, dispatch_block_t block)
{
  MEMORY[0x24BDADDB8](group, queue, block);
}

dispatch_group_t dispatch_group_create(void)
{
  return (dispatch_group_t)MEMORY[0x24BDADDC8]();
}

void dispatch_group_enter(dispatch_group_t group)
{
  MEMORY[0x24BDADDD0](group);
}

void dispatch_group_leave(dispatch_group_t group)
{
  MEMORY[0x24BDADDD8](group);
}

void dispatch_group_notify(dispatch_group_t group, dispatch_queue_t queue, dispatch_block_t block)
{
  MEMORY[0x24BDADDE0](group, queue, block);
}

intptr_t dispatch_group_wait(dispatch_group_t group, dispatch_time_t timeout)
{
  return MEMORY[0x24BDADDF0](group, timeout);
}

dispatch_queue_t dispatch_queue_create(const char *label, dispatch_queue_attr_t attr)
{
  return (dispatch_queue_t)MEMORY[0x24BDADED0](label, attr);
}

void dispatch_release(dispatch_object_t object)
{
  MEMORY[0x24BDADF10](object);
}

void dispatch_resume(dispatch_object_t object)
{
  MEMORY[0x24BDADF18](object);
}

void dispatch_retain(dispatch_object_t object)
{
  MEMORY[0x24BDADF20](object);
}

void dispatch_set_context(dispatch_object_t object, void *context)
{
  MEMORY[0x24BDADF40](object, context);
}

void dispatch_source_cancel(dispatch_source_t source)
{
  MEMORY[0x24BDADF68](source);
}

dispatch_source_t dispatch_source_create(dispatch_source_type_t type, uintptr_t handle, uintptr_t mask, dispatch_queue_t queue)
{
  return (dispatch_source_t)MEMORY[0x24BDADF70](type, handle, mask, queue);
}

void dispatch_source_set_event_handler(dispatch_source_t source, dispatch_block_t handler)
{
  MEMORY[0x24BDADFB0](source, handler);
}

void dispatch_source_set_timer(dispatch_source_t source, dispatch_time_t start, uint64_t interval, uint64_t leeway)
{
  MEMORY[0x24BDADFD0](source, start, interval, leeway);
}

void dispatch_suspend(dispatch_object_t object)
{
  MEMORY[0x24BDADFE0](object);
}

void dispatch_sync(dispatch_queue_t queue, dispatch_block_t block)
{
  MEMORY[0x24BDADFE8](queue, block);
}

dispatch_time_t dispatch_walltime(const timespec *when, int64_t delta)
{
  return MEMORY[0x24BDAE008](when, delta);
}

int fprintf(FILE *a1, const char *a2, ...)
{
  return MEMORY[0x24BDAE428](a1, a2);
}

void free(void *a1)
{
  MEMORY[0x24BDAE450](a1);
}

size_t fwrite(const void *__ptr, size_t __size, size_t __nitems, FILE *__stream)
{
  return MEMORY[0x24BDAE590](__ptr, __size, __nitems, __stream);
}

int getpeername(int a1, sockaddr *a2, socklen_t *a3)
{
  return MEMORY[0x24BDAE6C0](*(_QWORD *)&a1, a2, a3);
}

OM_uint32 gss_delete_sec_context(OM_uint32 *minor_status, gss_ctx_id_t *context_handle, gss_buffer_t output_token)
{
  return MEMORY[0x24BDD1AE0](minor_status, context_handle, output_token);
}

OM_uint32 gss_import_name(OM_uint32 *minor_status, gss_buffer_t input_name_buffer, gss_const_OID input_name_type, gss_name_t *output_name)
{
  return MEMORY[0x24BDD1AF8](minor_status, input_name_buffer, input_name_type, output_name);
}

OM_uint32 gss_init_sec_context(OM_uint32 *minor_status, gss_cred_id_t initiator_cred_handle, gss_ctx_id_t *context_handle, gss_name_t target_name, gss_OID input_mech_type, OM_uint32 req_flags, OM_uint32 time_req, gss_channel_bindings_t input_chan_bindings, gss_buffer_t input_token, gss_OID *actual_mech_type, gss_buffer_t output_token, OM_uint32 *ret_flags, OM_uint32 *time_rec)
{
  return MEMORY[0x24BDD1B00](minor_status, initiator_cred_handle, context_handle, target_name, input_mech_type, *(_QWORD *)&req_flags, *(_QWORD *)&time_req, input_chan_bindings);
}

OM_uint32 gss_release_buffer(OM_uint32 *minor_status, gss_buffer_t buffer)
{
  return MEMORY[0x24BDD1B38](minor_status, buffer);
}

OM_uint32 gss_unwrap(OM_uint32 *minor_status, gss_ctx_id_t context_handle, gss_buffer_t input_message_buffer, gss_buffer_t output_message_buffer, int *conf_state, gss_qop_t *qop_state)
{
  return MEMORY[0x24BDD1B60](minor_status, context_handle, input_message_buffer, output_message_buffer, conf_state, qop_state);
}

OM_uint32 gss_wrap(OM_uint32 *minor_status, gss_ctx_id_t context_handle, int conf_req_flag, gss_qop_t qop_req, gss_buffer_t input_message_buffer, int *conf_state, gss_buffer_t output_message_buffer)
{
  return MEMORY[0x24BDD1B68](minor_status, context_handle, *(_QWORD *)&conf_req_flag, *(_QWORD *)&qop_req, input_message_buffer, conf_state, output_message_buffer);
}

uint64_t heim_cram_md5_create()
{
  return MEMORY[0x24BE18D78]();
}

uint64_t heim_digest_create()
{
  return MEMORY[0x24BE18D80]();
}

uint64_t heim_digest_create_response()
{
  return MEMORY[0x24BE18D88]();
}

uint64_t heim_digest_parse_challenge()
{
  return MEMORY[0x24BE18D90]();
}

uint64_t heim_digest_release()
{
  return MEMORY[0x24BE18D98]();
}

uint64_t heim_digest_set_key()
{
  return MEMORY[0x24BE18DA0]();
}

const char *__cdecl inet_ntop(int a1, const void *a2, char *a3, socklen_t a4)
{
  return (const char *)MEMORY[0x24BDAE8B0](*(_QWORD *)&a1, a2, a3, *(_QWORD *)&a4);
}

int ioctl(int a1, unint64_t a2, ...)
{
  return MEMORY[0x24BDAE8C8](*(_QWORD *)&a1, a2);
}

void *__cdecl malloc_type_calloc(size_t count, size_t size, malloc_type_id_t type_id)
{
  return (void *)MEMORY[0x24BDAED70](count, size, type_id);
}

void *__cdecl malloc_type_malloc(size_t size, malloc_type_id_t type_id)
{
  return (void *)MEMORY[0x24BDAED78](size, type_id);
}

int memcmp(const void *__s1, const void *__s2, size_t __n)
{
  return MEMORY[0x24BDAEE78](__s1, __s2, __n);
}

void *__cdecl memcpy(void *__dst, const void *__src, size_t __n)
{
  return (void *)MEMORY[0x24BDAEE80](__dst, __src, __n);
}

void *__cdecl memmove(void *__dst, const void *__src, size_t __len)
{
  return (void *)MEMORY[0x24BDAEE98](__dst, __src, __len);
}

uint64_t nw_parameters_set_is_non_app_initiated()
{
  return MEMORY[0x24BDE16B8]();
}

id objc_msgSendSuper2(objc_super *a1, SEL a2, ...)
{
  return (id)MEMORY[0x24BEDD120](a1, a2);
}

uint64_t objc_opt_class()
{
  return MEMORY[0x24BEDD130]();
}

void objc_release(id a1)
{
  MEMORY[0x24BEDD188](a1);
}

id objc_retain(id a1)
{
  return (id)MEMORY[0x24BEDD2A0](a1);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x24BDAF398](oslog, type);
}

void os_release(void *object)
{
  MEMORY[0x24BDAF3F0](object);
}

void *__cdecl os_retain(void *object)
{
  return (void *)MEMORY[0x24BDAF3F8](object);
}

void *__cdecl reallocf(void *__ptr, size_t __size)
{
  return (void *)MEMORY[0x24BDAFAB8](__ptr, __size);
}

int setsockopt(int a1, int a2, int a3, const void *a4, socklen_t a5)
{
  return MEMORY[0x24BDAFD78](*(_QWORD *)&a1, *(_QWORD *)&a2, *(_QWORD *)&a3, a4, *(_QWORD *)&a5);
}

int snprintf(char *__str, size_t __size, const char *__format, ...)
{
  return MEMORY[0x24BDAFE40](__str, __size, __format);
}

int socket(int a1, int a2, int a3)
{
  return MEMORY[0x24BDAFE50](*(_QWORD *)&a1, *(_QWORD *)&a2, *(_QWORD *)&a3);
}

int strcasecmp(const char *a1, const char *a2)
{
  return MEMORY[0x24BDAFED0](a1, a2);
}

char *__cdecl strchr(char *__s, int __c)
{
  return (char *)MEMORY[0x24BDAFEE8](__s, *(_QWORD *)&__c);
}

int strcmp(const char *__s1, const char *__s2)
{
  return MEMORY[0x24BDAFEF0](__s1, __s2);
}

char *__cdecl strdup(const char *__s1)
{
  return (char *)MEMORY[0x24BDAFF10](__s1);
}

size_t strlcat(char *__dst, const char *__source, size_t __size)
{
  return MEMORY[0x24BDAFF30](__dst, __source, __size);
}

size_t strlcpy(char *__dst, const char *__source, size_t __size)
{
  return MEMORY[0x24BDAFF38](__dst, __source, __size);
}

size_t strlen(const char *__s)
{
  return MEMORY[0x24BDAFF40](__s);
}

int strncasecmp(const char *a1, const char *a2, size_t a3)
{
  return MEMORY[0x24BDAFF50](a1, a2, a3);
}

int strncmp(const char *__s1, const char *__s2, size_t __n)
{
  return MEMORY[0x24BDAFF68](__s1, __s2, __n);
}

unint64_t strtoul(const char *__str, char **__endptr, int __base)
{
  return MEMORY[0x24BDB0030](__str, __endptr, *(_QWORD *)&__base);
}

uint64_t tcp_connection_allow_client_socket_access()
{
  return MEMORY[0x24BDE2638]();
}

uint64_t tcp_connection_cancel()
{
  return MEMORY[0x24BDE2640]();
}

uint64_t tcp_connection_copy_parameters()
{
  return MEMORY[0x24BDE2648]();
}

uint64_t tcp_connection_create()
{
  return MEMORY[0x24BDE2650]();
}

uint64_t tcp_connection_create_with_connected_fd()
{
  return MEMORY[0x24BDE2658]();
}

uint64_t tcp_connection_get_hostname()
{
  return MEMORY[0x24BDE2660]();
}

uint64_t tcp_connection_get_remote()
{
  return MEMORY[0x24BDE2668]();
}

uint64_t tcp_connection_read()
{
  return MEMORY[0x24BDE2670]();
}

uint64_t tcp_connection_release()
{
  return MEMORY[0x24BDE2678]();
}

uint64_t tcp_connection_set_account_identifier()
{
  return MEMORY[0x24BDE2680]();
}

uint64_t tcp_connection_set_event_handler()
{
  return MEMORY[0x24BDE2688]();
}

uint64_t tcp_connection_set_indefinite()
{
  return MEMORY[0x24BDE2690]();
}

uint64_t tcp_connection_set_no_cellular()
{
  return MEMORY[0x24BDE2698]();
}

uint64_t tcp_connection_set_source_application_by_bundle()
{
  return MEMORY[0x24BDE26A0]();
}

uint64_t tcp_connection_start()
{
  return MEMORY[0x24BDE26A8]();
}

uint64_t tcp_connection_write()
{
  return MEMORY[0x24BDE26B0]();
}

uint64_t tcp_connection_write_buffer()
{
  return MEMORY[0x24BDE26B8]();
}

time_t time(time_t *a1)
{
  return MEMORY[0x24BDB0240](a1);
}

int usleep(useconds_t a1)
{
  return MEMORY[0x24BDB02E8](*(_QWORD *)&a1);
}

int vasprintf(char **a1, const char *a2, va_list a3)
{
  return MEMORY[0x24BDB0358](a1, a2, a3);
}

uint64_t voucher_adopt()
{
  return MEMORY[0x24BDB0400]();
}

