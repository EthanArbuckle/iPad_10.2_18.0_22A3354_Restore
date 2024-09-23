@implementation ApplePhotonDetectorServicesGetLuxAsync

uint64_t __ApplePhotonDetectorServicesGetLuxAsync_block_invoke(uint64_t result)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;

  v1 = result;
  v2 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(result + 32) + 8) + 24);
  if (*(_QWORD *)(v2 + 8))
  {
    ++*(_QWORD *)(v2 + 80);
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(result + 40) + 8) + 24) = 1;
  }
  else
  {
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(result + 40) + 8) + 24) = 0;
    result = connect(*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(result + 32) + 8) + 24) + 8, "com.apple.applephotondetectorservicesqueue");
    *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(v1 + 48) + 8) + 24) = result;
    if (!*(_DWORD *)(*(_QWORD *)(*(_QWORD *)(v1 + 48) + 8) + 24))
    {
      v3 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(v1 + 32) + 8) + 24);
      ++*(_QWORD *)(v3 + 80);
    }
  }
  return result;
}

void __ApplePhotonDetectorServicesGetLuxAsync_block_invoke_18(uint64_t a1, void *a2)
{
  const char *string;
  int v4;
  const char *v5;
  __int16 v6;
  const char *v7;
  uint64_t v8;

  v8 = *MEMORY[0x24BDAC8D0];
  if (MEMORY[0x23B7F94D4](a2) == MEMORY[0x24BDACFB8] && os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
  {
    string = xpc_dictionary_get_string(a2, (const char *)*MEMORY[0x24BDACF40]);
    v4 = 136315394;
    v5 = "ApplePhotonDetectorServicesGetLuxAsync_block_invoke";
    v6 = 2080;
    v7 = string;
    _os_log_impl(&dword_236A3A000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT, "%s: Received error %s\n", (uint8_t *)&v4, 0x16u);
  }
}

void __ApplePhotonDetectorServicesGetLuxAsync_block_invoke_20(uint64_t a1, void *a2)
{
  uint64_t v4;
  const void *data;
  size_t v6;
  int v7;
  NSObject *v8;
  const char *v9;
  uint32_t v10;
  uint64_t v11;
  unint64_t v12;
  unsigned int v13;
  _QWORD *v14;
  int v15;
  uint64_t v16;
  NSObject *v17;
  _QWORD v18[7];
  size_t length;
  _QWORD __dst[460];
  uint8_t buf[4];
  const char *v22;
  __int16 v23;
  size_t v24;
  __int16 v25;
  uint64_t v26;
  uint64_t v27;

  v27 = *MEMORY[0x24BDAC8D0];
  v4 = MEMORY[0x23B7F94D4](a2);
  bzero(__dst, 0xE60uLL);
  if (v4 == MEMORY[0x24BDACFA0])
  {
    length = 0;
    data = xpc_dictionary_get_data(a2, *(const char **)(*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) + 32), &length);
    if (data)
    {
      v6 = length;
      if (length == 3680)
      {
        memcpy(__dst, data, sizeof(__dst));
        if (BYTE4(__dst[13]))
          goto LABEL_17;
        v7 = -536870184;
        if (!os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
          goto LABEL_16;
        *(_DWORD *)buf = 136315138;
        v22 = "ApplePhotonDetectorServicesGetLuxAsync_block_invoke";
        v8 = MEMORY[0x24BDACB70];
        v9 = "%s: lux cache is not ready with valid data\n";
        goto LABEL_12;
      }
      v7 = -536870209;
      if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315650;
        v22 = "ApplePhotonDetectorServicesGetLuxAsync_block_invoke";
        v23 = 2048;
        v24 = v6;
        v25 = 2048;
        v26 = 3680;
        v8 = MEMORY[0x24BDACB70];
        v9 = "%s: Received reply with unexpected length %lu. Expected %lu\n";
        v10 = 32;
        goto LABEL_15;
      }
    }
    else
    {
      v7 = -536870209;
      if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315138;
        v22 = "ApplePhotonDetectorServicesGetLuxAsync_block_invoke";
        v8 = MEMORY[0x24BDACB70];
        v9 = "%s: Could not get the required data\n";
LABEL_12:
        v10 = 12;
LABEL_15:
        _os_log_impl(&dword_236A3A000, v8, OS_LOG_TYPE_DEFAULT, v9, buf, v10);
      }
    }
LABEL_16:
    *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = v7;
    goto LABEL_17;
  }
  if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    v22 = "ApplePhotonDetectorServicesGetLuxAsync_block_invoke";
    _os_log_impl(&dword_236A3A000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT, "%s: Received a response of an unknown type\n", buf, 0xCu);
  }
  *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = -536870199;
LABEL_17:
  if (*(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24))
  {
    v11 = *(_QWORD *)(a1 + 48);
    *(_BYTE *)(v11 + 36) = 0;
  }
  else
  {
    v11 = *(_QWORD *)(a1 + 48);
    if (*(_BYTE *)(v11 + 36))
    {
      v12 = 0;
      v13 = __dst[13];
      do
      {
        v14 = &__dst[3 * v13 + 1];
        v15 = *((_DWORD *)v14 + 1);
        *(_DWORD *)(*(_QWORD *)v11 + 4 * v12) = *(_DWORD *)v14;
        *(_QWORD *)(*(_QWORD *)(v11 + 16) + 8 * v12) = v14[1];
        *(_BYTE *)(*(_QWORD *)(v11 + 24) + v12) = *((_BYTE *)v14 + 16);
        v11 = *(_QWORD *)(a1 + 48);
        *(_DWORD *)(*(_QWORD *)(v11 + 8) + 4 * v12) = v15;
        v13 = ((_BYTE)v13 + 1) & 3;
        ++v12;
      }
      while (v12 < *(unsigned __int8 *)(v11 + 36));
    }
  }
  *(_DWORD *)(v11 + 32) = *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24);
  v16 = *(_QWORD *)(a1 + 56);
  if (v16)
  {
    v18[0] = MEMORY[0x24BDAC760];
    v18[1] = 0x40000000;
    v18[2] = __ApplePhotonDetectorServicesGetLuxAsync_block_invoke_21;
    v18[3] = &__block_descriptor_tmp_22;
    v18[4] = v16;
    v18[5] = v11;
    v17 = *(NSObject **)(a1 + 64);
    v18[6] = *(_QWORD *)(a1 + 72);
    dispatch_async(v17, v18);
    dispatch_release(*(dispatch_object_t *)(a1 + 64));
  }
  disconnectFromDaemon(*(NSObject ***)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24));
}

uint64_t __ApplePhotonDetectorServicesGetLuxAsync_block_invoke_21(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(a1 + 32))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
}

void __ApplePhotonDetectorServicesGetLuxAsync_block_invoke_24(uint64_t a1, void *a2)
{
  uint64_t v4;
  char v5;
  float v6;
  float v7;
  const void *data;
  size_t v9;
  int v10;
  NSObject *v11;
  const char *v12;
  uint32_t v13;
  uint64_t v14;
  uint64_t v15;
  int *v16;
  int v17;
  unsigned int v18;
  unsigned int v19;
  int v20;
  char v21;
  float v22;
  uint64_t v23;
  uint64_t v24;
  NSObject *v25;
  _QWORD v26[7];
  size_t length;
  uint8_t buf[4];
  const char *v29;
  __int16 v30;
  _BYTE v31[10];
  uint64_t v32;
  uint64_t v33;

  v33 = *MEMORY[0x24BDAC8D0];
  if (MEMORY[0x23B7F94D4](a2) == MEMORY[0x24BDACFA0])
  {
    length = 0;
    data = xpc_dictionary_get_data(a2, *(const char **)(*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) + 32), &length);
    if (data)
    {
      v9 = length;
      if (length == 3680)
      {
        v6 = *((float *)data + 2);
        v7 = *((float *)data + 3);
        v4 = *((_QWORD *)data + 2);
        v5 = *((_BYTE *)data + 24);
        v10 = *((_DWORD *)data + 7);
LABEL_14:
        *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = v10;
        goto LABEL_15;
      }
      v6 = 0.0;
      if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315650;
        v29 = "ApplePhotonDetectorServicesGetLuxAsync_block_invoke";
        v30 = 2048;
        *(_QWORD *)v31 = v9;
        *(_WORD *)&v31[8] = 2048;
        v32 = 3680;
        v11 = MEMORY[0x24BDACB70];
        v12 = "%s: Received reply with unexpected length %lu. Expected %lu\n";
        v13 = 32;
        goto LABEL_12;
      }
    }
    else
    {
      v6 = 0.0;
      if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315138;
        v29 = "ApplePhotonDetectorServicesGetLuxAsync_block_invoke";
        v11 = MEMORY[0x24BDACB70];
        v12 = "%s: Could not get the required data\n";
        v13 = 12;
LABEL_12:
        _os_log_impl(&dword_236A3A000, v11, OS_LOG_TYPE_DEFAULT, v12, buf, v13);
      }
    }
    v4 = 0;
    v5 = 0;
    v10 = -536870209;
    v7 = 0.0;
    goto LABEL_14;
  }
  if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    v29 = "ApplePhotonDetectorServicesGetLuxAsync_block_invoke";
    _os_log_impl(&dword_236A3A000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT, "%s: Received a response of an unknown type\n", buf, 0xCu);
  }
  v4 = 0;
  v5 = 0;
  *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = -536870199;
  v6 = 0.0;
  v7 = 0.0;
LABEL_15:
  if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) + 80))
    goto LABEL_33;
  v14 = *(_QWORD *)(a1 + 64);
  v15 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v16 = *(int **)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24);
  v17 = *v16;
  v18 = *(unsigned __int8 *)(v14 + 36);
  v19 = v18 - *v16;
  if (v18 >= *v16)
  {
    v21 = 0;
    v20 = *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24);
    if (v20)
      v22 = 0.0;
    else
      v22 = v6;
    if (v20)
      v4 = 0;
    *(float *)(*(_QWORD *)v14 + 4 * v19) = v22;
    *(_QWORD *)(*(_QWORD *)(v14 + 16) + 8 * v19) = v4;
    if (v20)
      v7 = 0.0;
    *(float *)(*(_QWORD *)(v14 + 8) + 4 * v19) = v7;
    if (v20)
      v5 = 0;
    *(_BYTE *)(*(_QWORD *)(v14 + 24) + v19) = v5;
    *v16 = v17 - 1;
    if (v17 != 1)
      goto LABEL_32;
    v21 = 1;
  }
  else
  {
    v20 = -536870168;
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315650;
      v29 = "UpdateLuxInfo";
      v30 = 1024;
      *(_DWORD *)v31 = v17;
      *(_WORD *)&v31[4] = 1024;
      *(_DWORD *)&v31[6] = v18;
      _os_log_impl(&dword_236A3A000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT, "%s: currentCount is greater than the number of samples requested, currentCount = %d, numSamples = %d\n", buf, 0x18u);
    }
    v21 = 0;
  }
  *(_DWORD *)(v14 + 32) = v20;
LABEL_32:
  *(_BYTE *)(v15 + 24) = v21;
LABEL_33:
  if (*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24))
  {
    v23 = *(_QWORD *)(a1 + 72);
    if (v23)
    {
      v26[0] = MEMORY[0x24BDAC760];
      v26[1] = 0x40000000;
      v26[2] = __ApplePhotonDetectorServicesGetLuxAsync_block_invoke_25;
      v26[3] = &__block_descriptor_tmp_26;
      v24 = *(_QWORD *)(a1 + 64);
      v26[4] = v23;
      v26[5] = v24;
      v25 = *(NSObject **)(a1 + 80);
      v26[6] = *(_QWORD *)(a1 + 88);
      dispatch_async(v25, v26);
      dispatch_release(*(dispatch_object_t *)(a1 + 80));
    }
    disconnectFromDaemon(*(NSObject ***)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24));
    free(*(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24));
  }
}

uint64_t __ApplePhotonDetectorServicesGetLuxAsync_block_invoke_25(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(a1 + 32))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
}

@end
