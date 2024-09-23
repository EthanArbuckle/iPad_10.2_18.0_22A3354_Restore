void OUTLINED_FUNCTION_0(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  NSObject *v9;

  _os_log_debug_impl(a1, v9, OS_LOG_TYPE_DEBUG, a4, &a9, 0xCu);
}

void sub_224FB423C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, ...)
{
  va_list va;

  va_start(va, a16);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy_(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose_(uint64_t a1)
{

}

void OUTLINED_FUNCTION_0_0(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 0xCu);
}

void OUTLINED_FUNCTION_1_0(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 2u);
}

void OUTLINED_FUNCTION_6(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_debug_impl(a1, a2, OS_LOG_TYPE_DEBUG, a4, &a9, 2u);
}

void sub_224FB6AF8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id *location, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,id a30,char a31)
{
  objc_destroyWeak(location);
  objc_destroyWeak(&a30);
  _Block_object_dispose(&a31, 8);
  _Unwind_Resume(a1);
}

void OUTLINED_FUNCTION_0_1(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint8_t *a5)
{
  _os_log_debug_impl(a1, a2, OS_LOG_TYPE_DEBUG, a4, a5, 0xCu);
}

void OUTLINED_FUNCTION_1_1(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  NSObject *v9;

  _os_log_debug_impl(a1, v9, OS_LOG_TYPE_DEBUG, a4, &a9, 0x16u);
}

uint64_t OUTLINED_FUNCTION_7(void *a1, const char *a2)
{
  return objc_msgSend(a1, "UTF8String");
}

void OUTLINED_FUNCTION_8(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint8_t *a5)
{
  _os_log_debug_impl(a1, a2, OS_LOG_TYPE_DEBUG, a4, a5, 0x12u);
}

std::ios_base *__cdecl hex(std::ios_base *__str)
{
  unsigned __int8 *v1;
  uint64_t v2;
  uint64_t v3;
  unsigned __int8 *v4;
  int v5;

  v3 = v2;
  v4 = v1;
  printf("%-25.25s = ", (const char *)__str);
  for (; v3; --v3)
  {
    v5 = *v4++;
    printf("%02x", v5);
  }
  return (std::ios_base *)putchar(10);
}

void OUTLINED_FUNCTION_0_2(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 8u);
}

id _DCLogSystem()
{
  if (_DCLogSystem_onceToken != -1)
    dispatch_once(&_DCLogSystem_onceToken, &__block_literal_global_2);
  return (id)_DCLogSystem_log;
}

id _DCAALogSystem()
{
  if (_DCAALogSystem_onceToken != -1)
    dispatch_once(&_DCAALogSystem_onceToken, &__block_literal_global_3);
  return (id)_DCAALogSystem_log;
}

void _DCLogDebugBinary(void *a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id v7;
  void *v8;
  void *v9;
  NSObject *v10;
  uint64_t v11;
  unint64_t v12;
  uint64_t v13;
  unint64_t v14;
  unint64_t v15;
  unint64_t v16;
  NSObject *v17;
  void *v18;
  void *v19;
  void *v20;
  uint8_t buf[4];
  id v22;
  __int16 v23;
  _WORD v24[9];

  *(_QWORD *)&v24[5] = *MEMORY[0x24BDAC8D0];
  v5 = a1;
  v6 = a2;
  v7 = a3;
  if (os_variant_allows_internal_security_policies())
  {
    v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCF50]), "initWithSuiteName:", CFSTR("com.apple.DeviceCheck"));
    if (objc_msgSend(v8, "BOOLForKey:", CFSTR("EnableExtendedBinaryLogs")))
    {
      v19 = v8;
      objc_msgSend(v7, "base64EncodedStringWithOptions:", 0);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = v5;
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138412802;
        v22 = v6;
        v23 = 1024;
        *(_DWORD *)v24 = objc_msgSend(v7, "length");
        v24[2] = 1024;
        *(_DWORD *)&v24[3] = objc_msgSend(v9, "length");
        _os_log_debug_impl(&dword_224FB2000, v10, OS_LOG_TYPE_DEBUG, "**BASE64DATABEGIN(%@:%u:%u)**\n", buf, 0x18u);
      }

      v20 = v9;
      v11 = objc_msgSend(v9, "length");
      if (v11)
      {
        v12 = v11;
        v13 = 0;
        v14 = 0;
        v15 = 128;
        do
        {
          if (v12 >= v15)
            v16 = v15;
          else
            v16 = v12;
          v17 = v10;
          if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
          {
            objc_msgSend(v20, "substringWithRange:", v14, v16 + v13);
            v18 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138412546;
            v22 = v6;
            v23 = 2112;
            *(_QWORD *)v24 = v18;
            _os_log_debug_impl(&dword_224FB2000, v17, OS_LOG_TYPE_DEBUG, "**BASE64DATA     (%@)**[%@]\n", buf, 0x16u);

          }
          v14 += 128;

          v15 += 128;
          v13 -= 128;
        }
        while (v12 > v14);
      }
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
        _DCLogDebugBinary_cold_1((uint64_t)v6, v10);

      v8 = v19;
    }

  }
}

uint64_t aks_ref_key_create(int a1, int a2, unsigned int a3, uint64_t a4, uint64_t a5, void ***a6)
{
  uint64_t v11;
  void *v12;
  void **v13;
  void *v14;
  void **v15;
  uint64_t v16;
  char *v17;
  rsize_t v18;
  void *v20;
  uint64_t v21;
  void *v22;
  void *v23;
  rsize_t v24;
  void *v25;
  size_t v26;

  v11 = 3758097090;
  v12 = der_key_op_create;
  v13 = (void **)calloc(8uLL, 1uLL);
  *v13 = 0;
  encode_list_add_key(v13, (uint64_t)der_key_op, (uint64_t)v12);
  v25 = 0;
  v26 = 0;
  v23 = 0;
  v24 = 0;
  if (!a6)
    goto LABEL_14;
  v14 = calloc(0x50uLL, 1uLL);
  v22 = v14;
  if (!v14)
  {
    v11 = 3758604298;
    goto LABEL_14;
  }
  v15 = (void **)v14;
  memset_s(v14, 0x50uLL, 0, 0x50uLL);
  if (a4 && encode_list_merge_dict((uint64_t)v13)
    || encode_list_add_number(v13, (uint64_t)der_key_keybag_class, a2)
    || encode_list_add_number(v13, (uint64_t)der_key_type, a3)
    || encode_list_dict(v13, &v25, &v26))
  {
LABEL_17:
    aks_ref_key_free((uint64_t *)&v22);
    goto LABEL_14;
  }
  v16 = _aks_operation();
  if ((_DWORD)v16)
  {
    v11 = v16;
    goto LABEL_17;
  }
  v17 = (char *)v23;
  v18 = v24;
  *v15 = v23;
  v15[1] = (void *)v18;
  *((_DWORD *)v15 + 10) = a1;
  v15[2] = &v17[v18];
  v20 = 0;
  v21 = 0;
  if (der_dict_find_value((uint64_t)der_key_ref_key, &v20, &v21))
    v15[4] = v20;
  if (der_dict_find_value((uint64_t)der_key_external_data, &v20, &v21))
    v15[3] = v20;
  v11 = 0;
  *a6 = v15;
  v23 = 0;
  v24 = 0;
LABEL_14:
  encode_list_free(v13);
  memset_s(v13, 8uLL, 0, 8uLL);
  free(v13);
  memset_s(v25, v26, 0, v26);
  free(v25);
  memset_s(v23, v24, 0, v24);
  free(v23);
  return v11;
}

uint64_t aks_ref_key_free(uint64_t *a1)
{
  uint64_t v1;
  void *v2;
  void *v3;

  v1 = *a1;
  if (!*a1)
    return 3758097090;
  *a1 = 0;
  if (*(_QWORD *)v1)
  {
    memset_s(*(void **)v1, *(_QWORD *)(v1 + 8), 0, *(_QWORD *)(v1 + 8));
    free(*(void **)v1);
  }
  v2 = *(void **)(v1 + 48);
  if (v2)
  {
    memset_s(v2, *(_QWORD *)(v1 + 56), 0, *(_QWORD *)(v1 + 56));
    free(*(void **)(v1 + 48));
  }
  v3 = *(void **)(v1 + 64);
  if (v3)
  {
    memset_s(v3, *(_QWORD *)(v1 + 72), 0, *(_QWORD *)(v1 + 72));
    free(*(void **)(v1 + 64));
  }
  memset_s((void *)v1, 0x50uLL, 0, 0x50uLL);
  free((void *)v1);
  return 0;
}

uint64_t _aks_operation()
{
  int v0;
  size_t *v1;
  size_t *v2;
  _QWORD *v3;
  _QWORD *v4;
  size_t v5;
  size_t v6;
  const void *v7;
  const void *v8;
  int v9;
  mach_port_t aks_client_connection;
  mach_port_t v11;
  uint64_t v12;
  void *v13;
  size_t __count;
  uint64_t input;
  _BYTE __src[32768];
  uint64_t v18;

  v0 = MEMORY[0x24BDAC7A8]();
  v2 = v1;
  v4 = v3;
  v6 = v5;
  v8 = v7;
  v9 = v0;
  v18 = *MEMORY[0x24BDAC8D0];
  aks_client_connection = get_aks_client_connection();
  if (aks_client_connection)
  {
    if (v8)
    {
      v11 = aks_client_connection;
      v12 = 3758097090;
      if (der_get_sizeof((uint64_t)v8) == v6)
      {
        bzero(__src, 0x8000uLL);
        __count = 0x8000;
        input = v9;
        v12 = IOConnectCallMethod(v11, 0x2Bu, &input, 1u, v8, v6, 0, 0, __src, &__count);
        if (!(_DWORD)v12 && v4 && v2)
        {
          v13 = calloc(__count, 1uLL);
          *v4 = v13;
          if (v13)
          {
            memcpy(v13, __src, __count);
            v12 = 0;
            *v2 = __count;
          }
          else
          {
            v12 = 3758097085;
          }
        }
      }
    }
    else
    {
      v12 = 3758097090;
    }
  }
  else
  {
    fprintf((FILE *)*MEMORY[0x24BDAC8E8], "%s%s:%s%s%s%s%u:%s%u:%s aks connection failed%s\n", "aks", "", "", "", "_aks_operation", ":", 457, "", 0, "", "");
    v12 = 3758097084;
  }
  memset_s(__src, 0x8000uLL, 0, 0x8000uLL);
  return v12;
}

uint64_t _get_merged_params(uint64_t a1, _QWORD *a2, uint64_t a3)
{
  uint64_t v3;

  v3 = 3758604298;
  if (a1
    && (!*(_QWORD *)(a1 + 48) || !encode_list_merge_dict((uint64_t)a2))
    && (!a3 || !encode_list_merge_dict((uint64_t)a2)))
  {
    encode_list_remove_key(a2, (unsigned __int8 *)der_key_external_data);
    return 0;
  }
  return v3;
}

uint64_t aks_ref_key_get_type(uint64_t a1)
{
  uint64_t result;
  uint64_t v2;
  uint64_t v3;

  if (!*(_QWORD *)(a1 + 32))
    return 0;
  v2 = 0;
  v3 = 0;
  result = der_dict_find_value((uint64_t)der_key_type, &v2, &v3);
  if ((_DWORD)result)
    return der_get_number();
  return result;
}

uint64_t aks_ref_key_get_public_key(_QWORD *a1, _QWORD *a2)
{
  int type;
  uint64_t v5;
  uint64_t v7;
  size_t v8;
  size_t v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  __int128 v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  unsigned int v17;
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  v17 = 0;
  v16 = 0;
  if (!a1[4])
    return 0;
  v14 = 0;
  v15 = 0;
  if (der_dict_find_value((uint64_t)der_key_public_key, &v14, &v15))
  {
    *(_QWORD *)&v13 = v14;
    *((_QWORD *)&v13 + 1) = v14 + v15;
    der_utils_decode_implicit_raw_octet_string(&v13, 4, &v17, &v16);
  }
  type = aks_ref_key_get_type((uint64_t)a1);
  if ((type - 7) < 2)
  {
    v5 = MEMORY[0x22768F338]();
    goto LABEL_9;
  }
  if ((type - 4) <= 1)
  {
    v5 = MEMORY[0x22768F32C]();
LABEL_9:
    if (v5)
    {
      v7 = firebloom_cp_prime_bitlen(v5);
      if (v17 == (unint64_t)(v7 + 7) >> 3)
      {
        if (v16 && !a1[8])
        {
          MEMORY[0x24BDAC7A8]();
          bzero((char *)&v12 - v8, v8);
          ccec_compact_import_pub();
          v9 = (2 * firebloom_cp_prime_size()) | 1;
          v10 = calloc(v9, 1uLL);
          a1[8] = v10;
          a1[9] = v9;
          if (v10)
            ccec_export_pub();
          cc_clear();
        }
        v11 = a1[9];
        v16 = a1[8];
        v17 = v11;
      }
    }
  }
  *a2 = v17;
  return v16;
}

uint64_t aks_ref_key_compute_key(uint64_t *a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v7;
  void *v8;
  void **v9;
  void *__s;
  rsize_t __n;

  v7 = 3758097090;
  v8 = der_key_op_compute_key;
  v9 = (void **)calloc(8uLL, 1uLL);
  *v9 = 0;
  encode_list_add_key(v9, (uint64_t)der_key_op, (uint64_t)v8);
  __s = 0;
  __n = 0;
  if (!_get_merged_params((uint64_t)a1, v9, a2))
  {
    encode_list_remove_key(v9, (unsigned __int8 *)der_key_public_key);
    encode_list_remove_key(v9, (unsigned __int8 *)der_key_ref_key);
    if (!encode_list_add_data(v9, (uint64_t)der_key_public_key, a4)
      && !encode_list_add_der(v9, (uint64_t)der_key_ref_key, *a1, a1[2])
      && !encode_list_dict(v9, &__s, &__n))
    {
      v7 = _aks_operation();
    }
  }
  encode_list_free(v9);
  memset_s(v9, 8uLL, 0, 8uLL);
  free(v9);
  if (__s)
  {
    memset_s(__s, __n, 0, __n);
    free(__s);
  }
  return v7;
}

uint64_t get_aks_client_connection()
{
  uint64_t result;

  if (get_aks_client_dispatch_queue_onceToken != -1)
    dispatch_once(&get_aks_client_dispatch_queue_onceToken, &__block_literal_global_168);
  dispatch_sync((dispatch_queue_t)get_aks_client_dispatch_queue_connection_queue, &__block_literal_global_150);
  result = get_aks_client_connection_connection;
  if (!get_aks_client_connection_connection)
  {
    syslog(3, "failed to open connection to %s\n", "AppleKeyStore");
    return get_aks_client_connection_connection;
  }
  return result;
}

void __get_aks_client_connection_block_invoke()
{
  if (!get_aks_client_connection_connection)
    get_aks_client_connection_connection = _copy_aks_client_connection("IOService:/IOResources/AppleKeyStore", "AppleKeyStore");
}

dispatch_queue_t __get_aks_client_dispatch_queue_block_invoke()
{
  dispatch_queue_t result;

  result = dispatch_queue_create("aks-client-queue", 0);
  get_aks_client_dispatch_queue_connection_queue = (uint64_t)result;
  return result;
}

uint64_t _copy_aks_client_connection(char *path, const char *a2)
{
  mach_port_t v3;
  io_service_t v4;
  task_port_t *v5;
  io_object_t v6;
  kern_return_t v7;
  const __CFDictionary *v8;
  io_service_t MatchingService;
  io_object_t v10;
  uint64_t result;
  kern_return_t v12;
  io_connect_t connect;

  connect = 0;
  v3 = *MEMORY[0x24BDD8B20];
  v4 = IORegistryEntryFromPath(*MEMORY[0x24BDD8B20], path);
  v5 = (task_port_t *)MEMORY[0x24BDAEC58];
  if (!v4 || (v6 = v4, v7 = IOServiceOpen(v4, *MEMORY[0x24BDAEC58], 0, &connect), IOObjectRelease(v6), v7))
  {
    v8 = IOServiceMatching(a2);
    MatchingService = IOServiceGetMatchingService(v3, v8);
    if (MatchingService)
    {
      v10 = MatchingService;
      IOServiceOpen(MatchingService, *v5, 0, &connect);
      IOObjectRelease(v10);
    }
  }
  result = connect;
  if (connect)
  {
    v12 = IOConnectCallMethod(connect, 0, 0, 0, 0, 0, 0, 0, 0, 0);
    result = connect;
    if (v12)
    {
      IOServiceClose(connect);
      return 0;
    }
  }
  return result;
}

unint64_t firebloom_cp_prime_size()
{
  return (unint64_t)(cczp_bitlen() + 7) >> 3;
}

BOOL der_equal(const void *a1, uint64_t a2, const void *a3)
{
  size_t v5;

  v5 = der_get_sizeof((uint64_t)a1);
  return v5 == der_get_sizeof((uint64_t)a3) && memcmp(a1, a3, v5) == 0;
}

uint64_t der_get_sizeof(uint64_t a1)
{
  if (ccder_blob_decode_tag() && ccder_blob_decode_len())
    return a1 - a1;
  else
    return 0;
}

uint64_t der_dict_iterate()
{
  uint64_t result;

  result = ccder_blob_decode_range();
  if ((_DWORD)result)
  {
    if (ccder_blob_decode_sequence_tl())
    {
      result = ccder_blob_decode_tl();
      if ((_DWORD)result)
        return 0;
    }
    else
    {
      return 1;
    }
  }
  return result;
}

uint64_t der_dict_find_value(uint64_t a1, _QWORD *a2, _QWORD *a3)
{
  if (a1)
  {
    der_dict_iterate();
    if (a2)
    {
      if (a3)
      {
        *a2 = 0;
        *a3 = 0;
      }
    }
  }
  return 0;
}

BOOL _dict_find_value_cb(const void *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  _BOOL4 v8;

  v8 = der_equal(*(const void **)a5, *(_QWORD *)a5 + *(unsigned __int8 *)(*(_QWORD *)a5 + 1) + 2, a1);
  if (v8)
  {
    *(_BYTE *)(a5 + 24) = 1;
    *(_QWORD *)(a5 + 8) = a3;
    *(_QWORD *)(a5 + 16) = a3 + a4;
  }
  return !v8;
}

uint64_t der_get_number()
{
  ccder_blob_decode_tl();
  return 0;
}

double der_utils_decode_implicit_raw_octet_string(__int128 *a1, uint64_t a2, _DWORD *a3, _QWORD *a4)
{
  double result;
  __int128 v8;

  v8 = *a1;
  if (ccder_blob_decode_range())
  {
    *a4 = 0;
    *a3 = 0;
    result = *(double *)&v8;
    *a1 = v8;
  }
  return result;
}

uint64_t encode_list_free(void **a1)
{
  void *v2;
  void *v3;

  if (!a1)
    return 0xFFFFFFFFLL;
  while (1)
  {
    v2 = *a1;
    if (!*a1)
      break;
    v3 = (void *)*((_QWORD *)v2 + 1);
    *a1 = *(void **)v2;
    if (v3)
    {
      memset_s(v3, *((_QWORD *)v2 + 2), 0, *((_QWORD *)v2 + 2));
      free(*((void **)v2 + 1));
    }
    memset_s(v2, 0x18uLL, 0, 0x18uLL);
    free(v2);
  }
  return 0;
}

uint64_t encode_list_remove_key(_QWORD *a1, unsigned __int8 *a2)
{
  _QWORD **v2;
  uint64_t result;
  uint64_t v4;
  _QWORD *i;
  void *v6;

  if (!a1)
    return 0xFFFFFFFFLL;
  v2 = (_QWORD **)a1;
  result = (uint64_t)_encode_list_find_key(a1, a2);
  if (result)
  {
    v4 = result;
    for (i = *v2; i != (_QWORD *)result; i = (_QWORD *)*i)
      v2 = (_QWORD **)i;
    *v2 = *(_QWORD **)result;
    v6 = *(void **)(result + 8);
    if (v6)
    {
      memset_s(v6, *(_QWORD *)(v4 + 16), 0, *(_QWORD *)(v4 + 16));
      free(*(void **)(v4 + 8));
    }
    memset_s((void *)v4, 0x18uLL, 0, 0x18uLL);
    free((void *)v4);
    return 0;
  }
  return result;
}

_QWORD *_encode_list_find_key(_QWORD *a1, unsigned __int8 *a2)
{
  _QWORD *v2;
  const void *v5;

  if (!a1)
    return 0;
  v2 = (_QWORD *)*a1;
  if (*a1)
  {
    do
    {
      v5 = (const void *)v2[1];
      if (ccder_blob_decode_sequence_tl() && der_equal(a2, (uint64_t)&a2[a2[1] + 2], v5))
        break;
      v2 = (_QWORD *)*v2;
    }
    while (v2);
  }
  return v2;
}

uint64_t der_key_validate(uint64_t a1)
{
  if ((ccder_blob_decode_tl() & 1) == 0)
  {
    fprintf((FILE *)*MEMORY[0x24BDAC8E8], "%s%s:%s%s%s%s%u:%s%u:%s bad 1%s\n", "aks", "", "", "", "der_key_validate");
    return 0;
  }
  return a1;
}

uint64_t encode_list_merge_dict(uint64_t a1)
{
  if (a1)
    return der_dict_iterate() - 1;
  else
    return 4294967285;
}

uint64_t _merge_dict_cb(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, _QWORD *a5)
{
  unsigned __int8 *v8;
  uint64_t v9;

  v8 = (unsigned __int8 *)der_key_validate(a1);
  if (v8)
  {
    v9 = (uint64_t)v8;
    if (!encode_list_remove_key(a5, v8) && !encode_list_add_der(a5, v9, a3, a3 + a4))
      return 1;
  }
  fprintf((FILE *)*MEMORY[0x24BDAC8E8], "%s%s:%s%s%s%s%u:%s%u:%s fail%s\n", "aks", "", "", "", "_merge_dict_cb", ":", 647, "", 0, "", "");
  return 0;
}

uint64_t encode_list_dict(_QWORD *a1, _QWORD *a2, size_t *a3)
{
  uint64_t v3;
  _QWORD *v7;
  unint64_t v8;
  uint64_t v9;
  uint64_t v10;
  rsize_t v11;
  void *v12;
  void *v13;
  _QWORD *v14;
  _OWORD *v15;
  size_t v16;
  char *v17;
  void *v18;
  unint64_t v19;
  uint64_t v20;
  uint64_t v22;
  char v23;
  char *v25;
  char *v26;

  v3 = 0xFFFFFFFFLL;
  if (a1)
  {
    if (a2)
    {
      if (a3)
      {
        v7 = (_QWORD *)*a1;
        if (*a1)
        {
          v8 = 0;
          v9 = 0;
          v10 = 0;
          do
          {
            v10 += v7[2];
            v7 = (_QWORD *)*v7;
            v9 -= 16;
            --v8;
          }
          while (v7);
          if (v8 >= 0xF000000000000001 && (v11 = -v9, (v12 = calloc(-v9, 1uLL)) != 0))
          {
            v13 = v12;
            v14 = (_QWORD *)*a1;
            if (*a1)
            {
              v15 = v12;
              do
              {
                *v15++ = *(_OWORD *)(v14 + 1);
                v14 = (_QWORD *)*v14;
              }
              while (v14);
            }
            qsort(v12, -(uint64_t)v8, 0x10uLL, (int (__cdecl *)(const void *, const void *))_qsort_compare);
            v16 = ccder_sizeof();
            v17 = (char *)calloc(v16, 1uLL);
            v18 = v17;
            if (v17)
            {
              v25 = v17;
              v26 = &v17[v16];
              v19 = v8 - 1;
              v20 = (uint64_t)v13 - v9 - 8;
              while (!__CFADD__(v19++, 1))
              {
                v22 = v20 - 16;
                v23 = ccder_blob_encode_body();
                v20 = v22;
                if ((v23 & 1) == 0)
                  goto LABEL_16;
              }
              if (!ccder_blob_encode_tl() || v25 != v26)
              {
LABEL_16:
                v3 = 0xFFFFFFFFLL;
                goto LABEL_20;
              }
              v3 = 0;
              *a2 = v18;
              *a3 = v16;
              v18 = 0;
            }
            else
            {
              v3 = 4294967279;
            }
LABEL_20:
            memset_s(v13, v11, 0, v11);
            free(v13);
            if (v18)
            {
              memset_s(v18, v16, 0, v16);
              free(v18);
            }
          }
          else
          {
            return 0xFFFFFFFFLL;
          }
        }
      }
    }
  }
  return v3;
}

uint64_t encode_list_add_der(_QWORD *a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t result;
  size_t v6;
  char *v7;
  char *v8;
  int v9;
  char *v10;
  int v11;
  char *v12;
  _QWORD *v14;
  _QWORD *v15;
  char *v16;
  char *v17;

  result = 0xFFFFFFFFLL;
  if (a1 && a2 && a3 && a4)
  {
    if (der_get_sizeof(a3) <= (unint64_t)(a4 - a3))
    {
      v6 = ccder_sizeof();
      v7 = (char *)calloc(v6, 1uLL);
      if (!v7)
        return 4294967279;
      v8 = v7;
      v16 = &v7[v6];
      if (ccder_blob_encode_body())
      {
        v9 = ccder_blob_encode_body();
        v10 = v16;
        if (!v9)
          v10 = 0;
        v17 = v10;
        v11 = ccder_blob_encode_tl();
        v12 = v17;
        if (!v11)
          v12 = 0;
        if (v12 && v12 == v8)
        {
          v14 = calloc(0x18uLL, 1uLL);
          if (v14)
          {
            v15 = v14;
            result = 0;
            v15[1] = v8;
            v15[2] = v6;
            *v15 = *a1;
            *a1 = v15;
            return result;
          }
        }
      }
      memset_s(v8, v6, 0, v6);
      free(v8);
    }
    return 0xFFFFFFFFLL;
  }
  return result;
}

uint64_t encode_list_add_key(_QWORD *a1, uint64_t a2, uint64_t a3)
{
  return encode_list_add_der(a1, a2, a3, a3 + *(unsigned __int8 *)(a3 + 1) + 2);
}

uint64_t encode_list_add_data(_QWORD *a1, uint64_t a2, uint64_t a3)
{
  uint64_t result;
  size_t v5;
  char *v6;
  char *v7;
  int v8;
  char *v9;
  int v10;
  char *v11;
  BOOL v12;
  _QWORD *v13;
  _QWORD *v14;
  char *v15;
  char *v16;

  result = 0xFFFFFFFFLL;
  if (a1 && a2 && a3)
  {
    ccder_sizeof();
    v5 = ccder_sizeof();
    v6 = (char *)calloc(v5, 1uLL);
    if (v6)
    {
      v7 = v6;
      v15 = &v6[v5];
      if (!ccder_blob_encode_body() || !ccder_blob_encode_tl())
        goto LABEL_19;
      v8 = ccder_blob_encode_body();
      v9 = v15;
      if (!v8)
        v9 = 0;
      v16 = v9;
      v10 = ccder_blob_encode_tl();
      v11 = v16;
      if (!v10)
        v11 = 0;
      v12 = v11 && v11 == v7;
      if (v12 && (v13 = calloc(0x18uLL, 1uLL)) != 0)
      {
        v14 = v13;
        result = 0;
        v14[1] = v7;
        v14[2] = v5;
        *v14 = *a1;
        *a1 = v14;
      }
      else
      {
LABEL_19:
        memset_s(v7, v5, 0, v5);
        free(v7);
        return 0xFFFFFFFFLL;
      }
    }
    else
    {
      return 4294967279;
    }
  }
  return result;
}

uint64_t encode_list_add_number(_QWORD *a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3;
  unint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t result;
  size_t v12;
  char *v13;
  char *v14;
  uint64_t v15;
  int v16;
  char *v17;
  int v18;
  char *v19;
  BOOL v20;
  _QWORD *v21;
  _QWORD *v22;
  char *v23;
  char *v24;
  _QWORD v25[2];

  v3 = a3;
  v25[1] = *MEMORY[0x24BDAC8D0];
  v5 = HIBYTE(a3);
  if ((HIBYTE(a3) + 1) > 1u)
  {
    v10 = 8;
  }
  else
  {
    v6 = 9;
    v7 = 48;
    v8 = 1;
    while ((unint64_t)(v6 - 2) >= 2)
    {
      v9 = a3 >> v7;
      --v6;
      v7 -= 8;
      if ((_DWORD)v5 != v9)
      {
        v8 = v6 - 1;
        goto LABEL_8;
      }
    }
    v6 = 2;
LABEL_8:
    if ((((a3 >> (8 * v8 - 8)) ^ v5) & 0x80) != 0)
      v10 = v6;
    else
      v10 = v8;
  }
  v25[0] = 0;
  result = 0xFFFFFFFFLL;
  if (a1 && a2)
  {
    ccder_sizeof();
    v12 = ccder_sizeof();
    v13 = (char *)calloc(v12, 1uLL);
    if (v13)
    {
      v14 = v13;
      v15 = v10;
      do
      {
        *((_BYTE *)v25 + v15 - 1) = v3;
        v3 >>= 8;
        --v15;
      }
      while (v15);
      v23 = &v13[v12];
      if ((ccder_blob_encode_body() & 1) == 0 || !ccder_blob_encode_tl())
        goto LABEL_30;
      v16 = ccder_blob_encode_body();
      v17 = v23;
      if (!v16)
        v17 = 0;
      v24 = v17;
      v18 = ccder_blob_encode_tl();
      v19 = v24;
      if (!v18)
        v19 = 0;
      v20 = v19 && v19 == v14;
      if (v20 && (v21 = calloc(0x18uLL, 1uLL)) != 0)
      {
        v22 = v21;
        result = 0;
        v22[1] = v14;
        v22[2] = v12;
        *v22 = *a1;
        *a1 = v22;
      }
      else
      {
LABEL_30:
        memset_s(v14, v12, 0, v12);
        free(v14);
        return 0xFFFFFFFFLL;
      }
    }
    else
    {
      return 4294967279;
    }
  }
  return result;
}

uint64_t _qsort_compare(const void **a1, void **a2)
{
  int v2;
  void *__s2;
  const void *v5;

  v5 = *a1;
  __s2 = *a2;
  if (!ccder_blob_decode_sequence_tl()
    || !ccder_blob_decode_sequence_tl()
    || !ccder_blob_decode_tag()
    || !ccder_blob_decode_len()
    || !v5
    || !ccder_blob_decode_tag()
    || !ccder_blob_decode_len()
    || !__s2)
  {
    return 4294967293;
  }
  v2 = memcmp(v5, __s2, 0);
  if (v2 > 0)
    return 1;
  else
    return ((v2 < 0) << 31 >> 31);
}

void _DCLogDebugBinary_cold_1(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x24BDAC8D0];
  v2 = 138412290;
  v3 = a1;
  _os_log_debug_impl(&dword_224FB2000, a2, OS_LOG_TYPE_DEBUG, "**BASE64DATAEND  (%@)**\n", (uint8_t *)&v2, 0xCu);
}

void CFRelease(CFTypeRef cf)
{
  MEMORY[0x24BDBC298](cf);
}

uint64_t DeviceIdentityIsSupported()
{
  return MEMORY[0x24BE2C370]();
}

uint64_t DeviceIdentityIssueClientCertificateWithCompletion()
{
  return MEMORY[0x24BE2C378]();
}

uint64_t DeviceIdentityUCRTAttestationSupported()
{
  return MEMORY[0x24BE2C380]();
}

kern_return_t IOConnectCallMethod(mach_port_t connection, uint32_t selector, const uint64_t *input, uint32_t inputCnt, const void *inputStruct, size_t inputStructCnt, uint64_t *output, uint32_t *outputCnt, void *outputStruct, size_t *outputStructCnt)
{
  return MEMORY[0x24BDD7EF8](*(_QWORD *)&connection, *(_QWORD *)&selector, input, *(_QWORD *)&inputCnt, inputStruct, inputStructCnt, output, outputCnt);
}

kern_return_t IOObjectRelease(io_object_t object)
{
  return MEMORY[0x24BDD86F8](*(_QWORD *)&object);
}

io_registry_entry_t IORegistryEntryFromPath(mach_port_t mainPort, const io_string_t path)
{
  return MEMORY[0x24BDD88C0](*(_QWORD *)&mainPort, path);
}

kern_return_t IOServiceClose(io_connect_t connect)
{
  return MEMORY[0x24BDD8970](*(_QWORD *)&connect);
}

io_service_t IOServiceGetMatchingService(mach_port_t mainPort, CFDictionaryRef matching)
{
  return MEMORY[0x24BDD8988](*(_QWORD *)&mainPort, matching);
}

CFMutableDictionaryRef IOServiceMatching(const char *name)
{
  return (CFMutableDictionaryRef)MEMORY[0x24BDD89A8](name);
}

kern_return_t IOServiceOpen(io_service_t service, task_port_t owningTask, uint32_t type, io_connect_t *connect)
{
  return MEMORY[0x24BDD89B8](*(_QWORD *)&service, *(_QWORD *)&owningTask, *(_QWORD *)&type, connect);
}

CFDataRef SecCertificateCopyData(SecCertificateRef certificate)
{
  return (CFDataRef)MEMORY[0x24BDE8850](certificate);
}

CFDataRef SecKeyCreateSignature(SecKeyRef key, SecKeyAlgorithm algorithm, CFDataRef dataToSign, CFErrorRef *error)
{
  return (CFDataRef)MEMORY[0x24BDE8B38](key, algorithm, dataToSign, error);
}

void _Block_object_dispose(const void *a1, const int a2)
{
  MEMORY[0x24BDAC730](a1, *(_QWORD *)&a2);
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
  MEMORY[0x24BDAC780](exception_object);
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

uint32_t arc4random_uniform(uint32_t __upper_bound)
{
  return MEMORY[0x24BDAD170](*(_QWORD *)&__upper_bound);
}

void bzero(void *a1, size_t a2)
{
  MEMORY[0x24BDAD320](a1, a2);
}

void *__cdecl calloc(size_t __count, size_t __size)
{
  return (void *)MEMORY[0x24BDAD328](__count, __size);
}

uint64_t cc_clear()
{
  return MEMORY[0x24BDAD348]();
}

uint64_t ccaes_gcm_encrypt_mode()
{
  return MEMORY[0x24BDAD380]();
}

uint64_t ccder_blob_decode_len()
{
  return MEMORY[0x24BDAD408]();
}

uint64_t ccder_blob_decode_range()
{
  return MEMORY[0x24BDAD418]();
}

uint64_t ccder_blob_decode_sequence_tl()
{
  return MEMORY[0x24BDAD420]();
}

uint64_t ccder_blob_decode_tag()
{
  return MEMORY[0x24BDAD428]();
}

uint64_t ccder_blob_decode_tl()
{
  return MEMORY[0x24BDAD430]();
}

uint64_t ccder_blob_encode_body()
{
  return MEMORY[0x24BDAD440]();
}

uint64_t ccder_blob_encode_tl()
{
  return MEMORY[0x24BDAD460]();
}

uint64_t ccder_sizeof()
{
  return MEMORY[0x24BDAD4E0]();
}

uint64_t ccec_compact_import_pub()
{
  return MEMORY[0x24BDAD560]();
}

uint64_t ccec_cp_256()
{
  return MEMORY[0x24BDAD590]();
}

uint64_t ccec_cp_384()
{
  return MEMORY[0x24BDAD598]();
}

uint64_t ccec_export_pub()
{
  return MEMORY[0x24BDAD5B0]();
}

uint64_t ccgcm_one_shot()
{
  return MEMORY[0x24BDAD670]();
}

uint64_t cchkdf()
{
  return MEMORY[0x24BDAD690]();
}

uint64_t cczp_bitlen()
{
  return MEMORY[0x24BDAD928]();
}

size_t compression_encode_buffer(uint8_t *dst_buffer, size_t dst_size, const uint8_t *src_buffer, size_t src_size, void *scratch_buffer, compression_algorithm algorithm)
{
  return MEMORY[0x24BEDB988](dst_buffer, dst_size, src_buffer, src_size, scratch_buffer, *(_QWORD *)&algorithm);
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
  MEMORY[0x24BDADE98](predicate, block);
}

dispatch_queue_t dispatch_queue_create(const char *label, dispatch_queue_attr_t attr)
{
  return (dispatch_queue_t)MEMORY[0x24BDADED0](label, attr);
}

void dispatch_sync(dispatch_queue_t queue, dispatch_block_t block)
{
  MEMORY[0x24BDADFE8](queue, block);
}

int fprintf(FILE *a1, const char *a2, ...)
{
  return MEMORY[0x24BDAE428](a1, a2);
}

void free(void *a1)
{
  MEMORY[0x24BDAE450](a1);
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

errno_t memset_s(void *__s, rsize_t __smax, int __c, rsize_t __n)
{
  return MEMORY[0x24BDAEEC8](__s, __smax, *(_QWORD *)&__c, __n);
}

uint64_t mobileactivationErrorHasDomainAndErrorCode()
{
  return MEMORY[0x24BE66A78]();
}

id objc_alloc(Class a1)
{
  return (id)MEMORY[0x24BEDCF68](a1);
}

uint64_t objc_alloc_init()
{
  return MEMORY[0x24BEDCF88]();
}

id objc_autorelease(id a1)
{
  return (id)MEMORY[0x24BEDCFA8](a1);
}

void objc_autoreleasePoolPop(void *context)
{
  MEMORY[0x24BEDCFB0](context);
}

void *objc_autoreleasePoolPush(void)
{
  return (void *)MEMORY[0x24BEDCFC0]();
}

id objc_autoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x24BEDCFD0](a1);
}

uint64_t objc_claimAutoreleasedReturnValue()
{
  return MEMORY[0x24BEDCFE8]();
}

void objc_copyWeak(id *to, id *from)
{
  MEMORY[0x24BEDD030](to, from);
}

void objc_destroyWeak(id *location)
{
  MEMORY[0x24BEDD038](location);
}

void objc_enumerationMutation(id obj)
{
  MEMORY[0x24BEDD068](obj);
}

id objc_getProperty(id self, SEL _cmd, ptrdiff_t offset, BOOL atomic)
{
  return (id)MEMORY[0x24BEDD0B0](self, _cmd, offset, atomic);
}

id objc_initWeak(id *location, id val)
{
  return (id)MEMORY[0x24BEDD0C0](location, val);
}

id objc_loadWeakRetained(id *location)
{
  return (id)MEMORY[0x24BEDD0E8](location);
}

id objc_msgSendSuper2(objc_super *a1, SEL a2, ...)
{
  return (id)MEMORY[0x24BEDD120](a1, a2);
}

uint64_t objc_opt_class()
{
  return MEMORY[0x24BEDD130]();
}

uint64_t objc_opt_isKindOfClass()
{
  return MEMORY[0x24BEDD138]();
}

void objc_release(id a1)
{
  MEMORY[0x24BEDD188](a1);
}

id objc_retain(id a1)
{
  return (id)MEMORY[0x24BEDD2A0](a1);
}

id objc_retainAutorelease(id a1)
{
  return (id)MEMORY[0x24BEDD2A8](a1);
}

id objc_retainAutoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x24BEDD2B0](a1);
}

void objc_setProperty_atomic_copy(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
  MEMORY[0x24BEDD3E0](self, _cmd, newValue, offset);
}

void objc_setProperty_nonatomic_copy(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
  MEMORY[0x24BEDD408](self, _cmd, newValue, offset);
}

void objc_storeStrong(id *location, id obj)
{
  MEMORY[0x24BEDD410](location, obj);
}

os_log_t os_log_create(const char *subsystem, const char *category)
{
  return (os_log_t)MEMORY[0x24BDAF368](subsystem, category);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x24BDAF398](oslog, type);
}

uint64_t os_variant_allows_internal_security_policies()
{
  return MEMORY[0x24BDAF4B0]();
}

int printf(const char *a1, ...)
{
  return MEMORY[0x24BDAF6A8](a1);
}

int putchar(int a1)
{
  return MEMORY[0x24BDAF9F0](*(_QWORD *)&a1);
}

void qsort(void *__base, size_t __nel, size_t __width, int (__cdecl *__compar)(const void *, const void *))
{
  MEMORY[0x24BDAFA18](__base, __nel, __width, __compar);
}

int snprintf(char *__str, size_t __size, const char *__format, ...)
{
  return MEMORY[0x24BDAFE40](__str, __size, __format);
}

char *__cdecl strncpy(char *__dst, const char *__src, size_t __n)
{
  return (char *)MEMORY[0x24BDAFF70](__dst, __src, __n);
}

void syslog(int a1, const char *a2, ...)
{
  MEMORY[0x24BDB0128](*(_QWORD *)&a1, a2);
}

