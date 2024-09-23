__n128 __Block_byref_object_copy_(uint64_t a1, uint64_t a2)
{
  __n128 result;
  __int128 v3;
  __int128 v4;

  *(_OWORD *)(a1 + 40) = *(_OWORD *)(a2 + 40);
  result = *(__n128 *)(a2 + 56);
  v3 = *(_OWORD *)(a2 + 72);
  v4 = *(_OWORD *)(a2 + 88);
  *(_QWORD *)(a1 + 104) = *(_QWORD *)(a2 + 104);
  *(_OWORD *)(a1 + 88) = v4;
  *(_OWORD *)(a1 + 72) = v3;
  *(__n128 *)(a1 + 56) = result;
  return result;
}

void disconnect(xpc_connection_t *a1)
{
  _xpc_connection_s *v2;

  v2 = *a1;
  if (v2)
  {
    xpc_connection_set_event_handler(v2, &__block_literal_global);
    xpc_connection_cancel(*a1);
    xpc_release(*a1);
    *a1 = 0;
  }
}

void ApplePhotonDetectorServicesGetLux(dispatch_object_t object, uint64_t *a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  _DWORD *v7;
  _DWORD *v8;
  _QWORD *v9;
  _BYTE *v10;
  int v11;
  _xpc_connection_s *v12;
  xpc_object_t v13;
  void *v14;
  NSObject *v15;
  const char *v16;
  NSObject *v17;
  const char *v18;
  unint64_t v19;
  NSObject *v20;
  xpc_object_t v21;
  const void *data;
  size_t v23;
  const void *v24;
  unsigned int v25;
  _QWORD *v26;
  NSObject *v27;
  const char *v28;
  uint32_t v29;
  size_t v30;
  _QWORD v31[5];
  _QWORD block[9];
  int v33;
  char v34;
  size_t length;
  _QWORD handler[7];
  uint64_t v37;
  uint64_t *v38;
  uint64_t v39;
  __n128 (*v40)(uint64_t, uint64_t);
  uint64_t (*v41)();
  _BYTE v42[64];
  uint64_t v43;
  uint8_t v44[4];
  const char *v45;
  __int16 v46;
  size_t v47;
  __int16 v48;
  uint64_t v49;
  _QWORD buf[464];

  buf[461] = *MEMORY[0x24BDAC8D0];
  if (!object || !a2)
  {
    if (!os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
      return;
    LODWORD(buf[0]) = 136315138;
    *(_QWORD *)((char *)buf + 4) = "ApplePhotonDetectorServicesGetLux";
    v15 = MEMORY[0x24BDACB70];
    v16 = "%s: Invalid arguments, exiting\n";
    goto LABEL_26;
  }
  if (!*((_BYTE *)a2 + 36))
  {
    if (!os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
      return;
    LODWORD(buf[0]) = 136315138;
    *(_QWORD *)((char *)buf + 4) = "ApplePhotonDetectorServicesGetLux";
    v15 = MEMORY[0x24BDACB70];
    v16 = "%s: Error! Client requested 0 samples. Exiting\n";
LABEL_26:
    _os_log_impl(&dword_236A3A000, v15, OS_LOG_TYPE_DEFAULT, v16, (uint8_t *)buf, 0xCu);
    return;
  }
  v4 = *a2;
  if ((!*a2 || !a2[2] || !a2[1]) && os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
  {
    v6 = a2[1];
    v5 = a2[2];
    LODWORD(buf[0]) = 136315906;
    *(_QWORD *)((char *)buf + 4) = "ApplePhotonDetectorServicesGetLux";
    WORD2(buf[1]) = 2048;
    *(_QWORD *)((char *)&buf[1] + 6) = v4;
    HIWORD(buf[2]) = 2048;
    buf[3] = v5;
    LOWORD(buf[4]) = 2048;
    *(_QWORD *)((char *)&buf[4] + 2) = v6;
    _os_log_impl(&dword_236A3A000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT, "%s: lux samples = %p, abs time = %p, gains = %p\n", (uint8_t *)buf, 0x2Au);
  }
  if (!a2[3] && os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
  {
    LODWORD(buf[0]) = 136315138;
    *(_QWORD *)((char *)buf + 4) = "ApplePhotonDetectorServicesGetLux";
    _os_log_impl(&dword_236A3A000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT, "%s: Memory for coexFlags not allocated by the client\n", (uint8_t *)buf, 0xCu);
  }
  dispatch_retain(object);
  v7 = malloc_type_calloc(*((unsigned __int8 *)a2 + 36), 4uLL, 0x100004052888210uLL);
  v8 = malloc_type_calloc(*((unsigned __int8 *)a2 + 36), 4uLL, 0x100004052888210uLL);
  v9 = malloc_type_calloc(*((unsigned __int8 *)a2 + 36), 8uLL, 0x100004000313F17uLL);
  v10 = malloc_type_calloc(*((unsigned __int8 *)a2 + 36), 1uLL, 0x100004077774924uLL);
  v37 = 0;
  v38 = &v37;
  v39 = 0x7002000000;
  v40 = __Block_byref_object_copy_;
  v41 = __Block_byref_object_dispose_;
  bzero(buf, 0xE60uLL);
  v43 = 0;
  memset(v42, 0, sizeof(v42));
  if (!v7 || !v9 || !v8)
  {
    v11 = -536870211;
    if (!os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
      goto LABEL_32;
    *(_DWORD *)v44 = 136315138;
    v45 = "ApplePhotonDetectorServicesGetLux";
    v17 = MEMORY[0x24BDACB70];
    v18 = "%s: Could not allocate memory to store lux information\n";
LABEL_31:
    _os_log_impl(&dword_236A3A000, v17, OS_LOG_TYPE_DEFAULT, v18, v44, 0xCu);
    goto LABEL_32;
  }
  if (!v10)
  {
    v11 = -536870211;
    if (!os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
      goto LABEL_32;
    *(_DWORD *)v44 = 136315138;
    v45 = "ApplePhotonDetectorServicesGetLux";
    v17 = MEMORY[0x24BDACB70];
    v18 = "%s: Could not allocate memory to store coex flags information\n";
    goto LABEL_31;
  }
  v11 = connect((uint64_t)v42, "com.apple.applephotondetectorservicesqueue");
  if (v11)
    goto LABEL_32;
  v12 = (_xpc_connection_s *)v38[5];
  handler[0] = MEMORY[0x24BDAC760];
  handler[1] = 0x40000000;
  handler[2] = __ApplePhotonDetectorServicesGetLux_block_invoke;
  handler[3] = &unk_25080A1D8;
  handler[4] = &v37;
  handler[5] = object;
  handler[6] = a2;
  xpc_connection_set_event_handler(v12, handler);
  xpc_connection_activate((xpc_connection_t)v38[5]);
  if (!isIspPowered((uint64_t)(v38 + 5)))
  {
    if (*((_BYTE *)a2 + 36))
    {
LABEL_49:
      v19 = 0;
      while (1)
      {
        v21 = sendSynchronousXpcMsgWithReply();
        v14 = v21;
        if (!v21)
        {
          v11 = -536870209;
          if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)v44 = 136315138;
            v45 = "ApplePhotonDetectorServicesGetLux";
            _os_log_impl(&dword_236A3A000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT, "%s: Did not receive a reply from daemon\n", v44, 0xCu);
          }
LABEL_58:
          v14 = 0;
          goto LABEL_34;
        }
        if (MEMORY[0x23B7F94D4](v21) != MEMORY[0x24BDACFA0])
          break;
        length = 0;
        data = xpc_dictionary_get_data(v14, (const char *)v38[8], &length);
        v23 = length;
        if (length != 3680)
        {
          if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)v44 = 136315650;
            v45 = "ApplePhotonDetectorServicesGetLux";
            v46 = 2048;
            v47 = v23;
            v48 = 2048;
            v49 = 3680;
            _os_log_impl(&dword_236A3A000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT, "%s: Received reply with unexpected length %lu. Expected %lu\n", v44, 0x20u);
          }
          v11 = -536870209;
          goto LABEL_34;
        }
        memcpy(buf, data, 0xE60uLL);
        v7[v19] = buf[1];
        v9[v19] = buf[2];
        v8[v19] = HIDWORD(buf[1]);
        v11 = HIDWORD(buf[3]);
        v10[v19] = buf[3];
        xpc_release(v14);
        if (++v19 >= *((unsigned __int8 *)a2 + 36))
          goto LABEL_58;
      }
      v11 = -536870199;
      if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)v44 = 136315138;
        v45 = "ApplePhotonDetectorServicesGetLux";
        _os_log_impl(&dword_236A3A000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT, "%s: Received an unexpected event\n", v44, 0xCu);
      }
      goto LABEL_34;
    }
    v11 = 0;
LABEL_32:
    v14 = 0;
    goto LABEL_33;
  }
  if (*((unsigned __int8 *)a2 + 36) > 4u)
    goto LABEL_49;
  v13 = sendSynchronousXpcMsgWithReply();
  v14 = v13;
  v11 = -536870209;
  if (v13)
  {
    if (MEMORY[0x23B7F94D4](v13) != MEMORY[0x24BDACFA0])
    {
LABEL_21:
      v11 = 0;
      goto LABEL_33;
    }
    length = 0;
    v24 = xpc_dictionary_get_data(v14, (const char *)v38[8], &length);
    if (length == 3680)
    {
      memcpy(buf, v24, 0xE60uLL);
      if (BYTE4(buf[13]))
      {
        if (*((_BYTE *)a2 + 36))
        {
          v19 = 0;
          v25 = buf[13];
          do
          {
            v26 = &buf[3 * v25 + 1];
            v7[v19] = *(_DWORD *)v26;
            v9[v19] = v26[1];
            v8[v19] = *((_DWORD *)v26 + 1);
            v10[v19] = *((_BYTE *)v26 + 16);
            v25 = ((_BYTE)v25 + 1) & 3;
            ++v19;
          }
          while (v19 < *((unsigned __int8 *)a2 + 36));
          v11 = 0;
          goto LABEL_34;
        }
        goto LABEL_21;
      }
      v11 = -536870184;
      if (!os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
        goto LABEL_33;
      *(_DWORD *)v44 = 136315138;
      v45 = "ApplePhotonDetectorServicesGetLux";
      v27 = MEMORY[0x24BDACB70];
      v28 = "%s: lux cache is not ready with valid data\n";
      v29 = 12;
    }
    else
    {
      v30 = length;
      if (!os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
        goto LABEL_33;
      *(_DWORD *)v44 = 136315650;
      v45 = "ApplePhotonDetectorServicesGetLux";
      v46 = 2048;
      v47 = v30;
      v48 = 2048;
      v49 = 3680;
      v27 = MEMORY[0x24BDACB70];
      v28 = "%s: Received reply with unexpected length %lu. Expected %lu\n";
      v29 = 32;
    }
    _os_log_impl(&dword_236A3A000, v27, OS_LOG_TYPE_DEFAULT, v28, v44, v29);
  }
LABEL_33:
  LOBYTE(v19) = 0;
LABEL_34:
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 0x40000000;
  block[2] = __ApplePhotonDetectorServicesGetLux_block_invoke_8;
  block[3] = &__block_descriptor_tmp_9;
  v34 = v19;
  block[4] = a2;
  block[5] = v7;
  block[6] = v8;
  block[7] = v9;
  block[8] = v10;
  v33 = v11;
  dispatch_sync(object, block);
  if (v14)
    xpc_release(v14);
  v20 = v38[6];
  if (v20)
  {
    v31[0] = MEMORY[0x24BDAC760];
    v31[1] = 0x40000000;
    v31[2] = __ApplePhotonDetectorServicesGetLux_block_invoke_2;
    v31[3] = &unk_25080A220;
    v31[4] = &v37;
    dispatch_sync(v20, v31);
    dispatch_release((dispatch_object_t)v38[6]);
    v38[6] = 0;
  }
  dispatch_release(object);
  if (v7)
    free(v7);
  if (v9)
    free(v9);
  if (v8)
    free(v8);
  if (v10)
    free(v10);
  _Block_object_dispose(&v37, 8);
}

void sub_236A3BADC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,char a33)
{
  _Block_object_dispose(&a33, 8);
  _Unwind_Resume(a1);
}

BOOL isIspPowered(uint64_t a1)
{
  xpc_object_t v2;
  void *v3;
  _BOOL8 v4;
  NSObject *v5;
  const char *v6;
  uint32_t v7;
  _BYTE *data;
  size_t v9;
  size_t length;
  uint8_t buf[4];
  const char *v13;
  __int16 v14;
  size_t v15;
  __int16 v16;
  uint64_t v17;
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  v2 = sendSynchronousXpcMsgWithReply();
  if (v2)
  {
    v3 = v2;
    if (MEMORY[0x23B7F94D4]() == MEMORY[0x24BDACFA0])
    {
      length = 0;
      data = xpc_dictionary_get_data(v3, *(const char **)(a1 + 24), &length);
      v9 = length;
      if (length == 3680)
      {
        v4 = data[8] != 0;
      }
      else
      {
        v4 = 0;
        if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 136315650;
          v13 = "isIspPowered";
          v14 = 2048;
          v15 = v9;
          v16 = 2048;
          v17 = 3680;
          v5 = MEMORY[0x24BDACB70];
          v6 = "%s: Received reply with unexpected length %lu. Expected %lu\n";
          v7 = 32;
          goto LABEL_11;
        }
      }
    }
    else
    {
      v4 = 0;
      if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315138;
        v13 = "isIspPowered";
        v5 = MEMORY[0x24BDACB70];
        v6 = "%s: Received an unexpected event\n";
        v7 = 12;
LABEL_11:
        _os_log_impl(&dword_236A3A000, v5, OS_LOG_TYPE_DEFAULT, v6, buf, v7);
        v4 = 0;
      }
    }
    xpc_release(v3);
    return v4;
  }
  v4 = 0;
  if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    v13 = "isIspPowered";
    _os_log_impl(&dword_236A3A000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT, "%s: Did not receive a reply from daemon\n", buf, 0xCu);
    return 0;
  }
  return v4;
}

xpc_object_t sendSynchronousXpcMsgWithReply()
{
  xpc_connection_t *v0;
  int v1;
  int v2;
  uint64_t v3;
  uint64_t v4;
  int v5;
  int v6;
  xpc_connection_t *v7;
  xpc_object_t v8;
  void *v9;
  NSObject *v10;
  const char *v11;
  xpc_object_t v12;
  size_t *v13;
  uint64_t v14;
  NSObject *v15;
  const char *v16;
  size_t *v17;
  uint64_t v18;
  int v20;
  const char *v21;
  int bytes;
  _DWORD v23[3295];

  v0 = (xpc_connection_t *)MEMORY[0x24BDAC7A8]();
  *(_QWORD *)&v23[3293] = *MEMORY[0x24BDAC8D0];
  if (*v0)
  {
    v4 = v3;
    v5 = v2;
    v6 = v1;
    v7 = v0;
    v8 = xpc_dictionary_create(0, 0, 0);
    if (v8)
    {
      v9 = v8;
      if (v5 == 1)
      {
        bzero(&bytes, 0x3378uLL);
        bytes = v6;
        switch(v6)
        {
          case 204:
          case 207:
          case 212:
            if (v4)
            {
              v14 = *(_QWORD *)(v4 + 16);
              v13 = (size_t *)(v4 + 16);
              *(_QWORD *)&v23[1] = *(v13 - 1);
              *(_QWORD *)&v23[3] = v14;
              xpc_dictionary_set_uint64(v9, (const char *)v7[2], 1uLL);
              xpc_dictionary_set_data(v9, (const char *)v7[3], &bytes, 0x3378uLL);
              xpc_dictionary_set_data(v9, (const char *)v7[5], *(const void **)&v23[1], *v13);
              xpc_dictionary_set_uint64(v9, (const char *)v7[6], *(uint64_t *)&v23[3]);
            }
            else if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
            {
              v20 = 136315138;
              v21 = "sendSynchronousXpcMsgWithReply";
              v15 = MEMORY[0x24BDACB70];
              v16 = "%s: Missing property information to set, returning\n";
              goto LABEL_27;
            }
            break;
          case 208:
            xpc_dictionary_set_uint64(v9, (const char *)v7[2], 1uLL);
            xpc_dictionary_set_data(v9, (const char *)v7[3], &bytes, 0x3378uLL);
            break;
          case 211:
            if (v4)
            {
              v18 = *(_QWORD *)(v4 + 24);
              v17 = (size_t *)(v4 + 24);
              *(_OWORD *)&v23[1] = *((_OWORD *)v17 - 1);
              *(_QWORD *)&v23[5] = v18;
              xpc_dictionary_set_uint64(v9, (const char *)v7[2], 1uLL);
              xpc_dictionary_set_data(v9, (const char *)v7[3], &bytes, 0x3378uLL);
              xpc_dictionary_set_string(v9, (const char *)v7[7], *(const char **)&v23[1]);
              xpc_dictionary_set_data(v9, (const char *)v7[8], *(const void **)&v23[3], *v17);
            }
            else if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
            {
              v20 = 136315138;
              v21 = "sendSynchronousXpcMsgWithReply";
              v15 = MEMORY[0x24BDACB70];
              v16 = "%s: Missing property information to set, returning\n";
              goto LABEL_27;
            }
            break;
          default:
            if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
            {
              v20 = 136315138;
              v21 = "sendSynchronousXpcMsgWithReply";
              v15 = MEMORY[0x24BDACB70];
              v16 = "%s: Unhandled property\n";
LABEL_27:
              _os_log_impl(&dword_236A3A000, v15, OS_LOG_TYPE_DEFAULT, v16, (uint8_t *)&v20, 0xCu);
            }
            break;
        }
      }
      else
      {
        if (v5 != 2)
        {
          if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
          {
            bytes = 136315138;
            *(_QWORD *)v23 = "sendSynchronousXpcMsgWithReply";
            _os_log_impl(&dword_236A3A000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT, "%s: Unexpected property type, returning\n", (uint8_t *)&bytes, 0xCu);
          }
          v12 = 0;
          goto LABEL_29;
        }
        bzero(&bytes, 0xE60uLL);
        bytes = v6;
        xpc_dictionary_set_uint64(v9, (const char *)v7[2], 2uLL);
        xpc_dictionary_set_data(v9, (const char *)v7[3], &bytes, 0xE60uLL);
      }
      v12 = xpc_connection_send_message_with_reply_sync(*v7, v9);
LABEL_29:
      xpc_release(v9);
      return v12;
    }
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
    {
      bytes = 136315138;
      *(_QWORD *)v23 = "sendSynchronousXpcMsgWithReply";
      v10 = MEMORY[0x24BDACB70];
      v11 = "%s: Could not create dictionary, exiting\n";
      goto LABEL_10;
    }
  }
  else if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
  {
    bytes = 136315138;
    *(_QWORD *)v23 = "sendSynchronousXpcMsgWithReply";
    v10 = MEMORY[0x24BDACB70];
    v11 = "%s: Connection is invalid, exiting \n";
LABEL_10:
    _os_log_impl(&dword_236A3A000, v10, OS_LOG_TYPE_DEFAULT, v11, (uint8_t *)&bytes, 0xCu);
  }
  return 0;
}

uint64_t connect(uint64_t a1, const char *a2)
{
  mach_port_t v4;
  const __CFDictionary *v5;
  uint64_t MatchingServices;
  io_iterator_t v7;
  uint64_t v8;
  char **v9;
  const __CFDictionary *v10;
  uint64_t v11;
  const __CFDictionary *v12;
  io_service_t MatchingService;
  io_object_t v14;
  const __CFNumber *v15;
  const __CFNumber *v16;
  const char *v17;
  const char *v18;
  NSObject *v19;
  xpc_connection_t mach_service;
  NSObject *v21;
  const char *v22;
  io_iterator_t existing;
  char valuePtr;
  uint8_t buf[4];
  const char *v27;
  uint64_t v28;

  v28 = *MEMORY[0x24BDAC8D0];
  valuePtr = 0;
  existing = 0;
  if (!a1)
    return 3758096385;
  v4 = *MEMORY[0x24BDD8B18];
  v5 = IOServiceMatching("AppleH13CamIn");
  MatchingServices = IOServiceGetMatchingServices(v4, v5, &existing);
  v7 = existing;
  if (existing)
  {
    v8 = MatchingServices;
    v9 = off_25080A130;
  }
  else
  {
    v10 = IOServiceMatching("AppleH16CamIn");
    v11 = IOServiceGetMatchingServices(v4, v10, &existing);
    if (!existing)
      return 3758097086;
    v8 = v11;
    v9 = &off_25080A138;
  }
  v12 = IOServiceNameMatching(*v9);
  MatchingService = IOServiceGetMatchingService(v4, v12);
  v14 = MatchingService;
  if (MatchingService)
  {
    v15 = (const __CFNumber *)IORegistryEntrySearchCFProperty(MatchingService, "IOService", CFSTR("RestoreMode"), (CFAllocatorRef)*MEMORY[0x24BDBD240], 3u);
    v16 = v15;
    if (v15)
      CFNumberGetValue(v15, kCFNumberSInt32Type, &valuePtr);
  }
  else
  {
    v16 = 0;
  }
  if (v7)
  {
    v17 = "com.apple.dietappleh13camerad";
    if (valuePtr != 1 && !os_variant_is_recovery())
      v17 = "com.apple.appleh13camerad";
    *(_QWORD *)(a1 + 16) = "H13ISPServicesRemoteTypeKey";
    *(_QWORD *)(a1 + 24) = "H13ISPServicesRemoteDataKey";
    *(_QWORD *)(a1 + 32) = v17;
    *(_QWORD *)(a1 + 40) = "H13ISPServicesRemoteFusingDataKey";
    *(_QWORD *)(a1 + 48) = "H13ISPServicesRemoteFusingLengthKey";
  }
  else
  {
    v18 = "com.apple.dietappleh16camerad";
    if (valuePtr != 1 && !os_variant_is_recovery())
      v18 = "com.apple.appleh16camerad";
    *(_QWORD *)(a1 + 16) = "H16ISPServicesRemoteTypeKey";
    *(_QWORD *)(a1 + 24) = "H16ISPServicesRemoteDataKey";
    *(_QWORD *)(a1 + 32) = v18;
    *(_QWORD *)(a1 + 40) = "H16ISPServicesRemoteFusingDataKey";
    *(_QWORD *)(a1 + 48) = "H16ISPServicesRemoteFusingLengthKey";
    *(_QWORD *)(a1 + 56) = "H16ISPServicesRemoteIORegPropertyNameKey";
    *(_QWORD *)(a1 + 64) = "H16ISPServicesRemoteIORegPropertyDataKey";
  }
  v19 = dispatch_queue_create(a2, 0);
  *(_QWORD *)(a1 + 8) = v19;
  if (v19)
  {
    mach_service = xpc_connection_create_mach_service(*(const char **)(a1 + 32), v19, 0);
    *(_QWORD *)a1 = mach_service;
    if (mach_service)
      goto LABEL_27;
    v8 = 3758097086;
    if (!os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
      goto LABEL_27;
    *(_DWORD *)buf = 136315138;
    v27 = "connect";
    v21 = MEMORY[0x24BDACB70];
    v22 = "%s: Could not establish a connection\n";
    goto LABEL_26;
  }
  v8 = 3758097086;
  if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    v27 = "connect";
    v21 = MEMORY[0x24BDACB70];
    v22 = "%s: Could not create a serial dispatch queue, exiting\n";
LABEL_26:
    _os_log_impl(&dword_236A3A000, v21, OS_LOG_TYPE_DEFAULT, v22, buf, 0xCu);
  }
LABEL_27:
  if (existing)
  {
    IOObjectRelease(existing);
    existing = 0;
  }
  if (v14)
    IOObjectRelease(v14);
  if (v16)
    CFRelease(v16);
  return v8;
}

uint64_t ApplePhotonDetectorServicesGetGlobalCorrectionFactor(_QWORD *a1)
{
  uint64_t v2;
  _xpc_connection_s *v3;
  xpc_object_t v4;
  void *v5;
  NSObject *v6;
  const char *v7;
  uint32_t v8;
  _QWORD *data;
  size_t v10;
  NSObject *v11;
  _QWORD block[5];
  size_t length;
  _QWORD handler[5];
  uint64_t v16;
  uint64_t *v17;
  uint64_t v18;
  __n128 (*v19)(uint64_t, uint64_t);
  uint64_t (*v20)();
  _BYTE v21[64];
  uint64_t v22;
  uint8_t buf[4];
  const char *v24;
  __int16 v25;
  size_t v26;
  __int16 v27;
  uint64_t v28;
  uint64_t v29;

  v29 = *MEMORY[0x24BDAC8D0];
  v16 = 0;
  v17 = &v16;
  v18 = 0x7002000000;
  v19 = __Block_byref_object_copy_;
  v20 = __Block_byref_object_dispose_;
  memset(v21, 0, sizeof(v21));
  v22 = 0;
  if (a1)
  {
    v2 = connect((uint64_t)v21, "com.apple.applephotondetectorservicesqueue");
    if ((_DWORD)v2)
      goto LABEL_18;
    v3 = (_xpc_connection_s *)v17[5];
    handler[0] = MEMORY[0x24BDAC760];
    handler[1] = 0x40000000;
    handler[2] = __ApplePhotonDetectorServicesGetGlobalCorrectionFactor_block_invoke;
    handler[3] = &unk_25080A168;
    handler[4] = &v16;
    xpc_connection_set_event_handler(v3, handler);
    xpc_connection_activate((xpc_connection_t)v17[5]);
    v4 = sendSynchronousXpcMsgWithReply();
    v5 = v4;
    if (v4)
    {
      if (MEMORY[0x23B7F94D4](v4) == MEMORY[0x24BDACFA0])
      {
        length = 0;
        data = xpc_dictionary_get_data(v5, (const char *)v17[8], &length);
        v10 = length;
        if (length == 3680)
        {
          v2 = 0;
          *a1 = data[1];
        }
        else
        {
          v2 = 3758097087;
          if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 136315650;
            v24 = "ApplePhotonDetectorServicesGetGlobalCorrectionFactor";
            v25 = 2048;
            v26 = v10;
            v27 = 2048;
            v28 = 3680;
            v6 = MEMORY[0x24BDACB70];
            v7 = "%s: Received reply with unexpected length %lu. Expected %lu\n";
            v8 = 32;
            goto LABEL_16;
          }
        }
      }
      else
      {
        v2 = 3758097097;
        if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 136315138;
          v24 = "ApplePhotonDetectorServicesGetGlobalCorrectionFactor";
          v6 = MEMORY[0x24BDACB70];
          v7 = "%s: Received an unexpected event\n";
          v8 = 12;
LABEL_16:
          _os_log_impl(&dword_236A3A000, v6, OS_LOG_TYPE_DEFAULT, v7, buf, v8);
        }
      }
      xpc_release(v5);
      goto LABEL_18;
    }
    v2 = 3758097087;
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315138;
      v24 = "ApplePhotonDetectorServicesGetGlobalCorrectionFactor";
      _os_log_impl(&dword_236A3A000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT, "%s: Did not receive a reply from daemon\n", buf, 0xCu);
    }
  }
  else
  {
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315138;
      v24 = "ApplePhotonDetectorServicesGetGlobalCorrectionFactor";
      _os_log_impl(&dword_236A3A000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT, "%s: Invalid arguments, exiting\n", buf, 0xCu);
    }
    v2 = 3758096385;
  }
LABEL_18:
  v11 = v17[6];
  if (v11)
  {
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 0x40000000;
    block[2] = __ApplePhotonDetectorServicesGetGlobalCorrectionFactor_block_invoke_2;
    block[3] = &unk_25080A190;
    block[4] = &v16;
    dispatch_sync(v11, block);
    dispatch_release((dispatch_object_t)v17[6]);
    v17[6] = 0;
  }
  _Block_object_dispose(&v16, 8);
  return v2;
}

void sub_236A3C85C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  va_list va;

  va_start(va, a13);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t ApplePhotonDetectorServicesGetCoex(io_iterator_t *a1)
{
  uint64_t v1;
  uint64_t v3;
  mach_port_t v4;
  char v5;
  char v6;
  const __CFDictionary *v7;
  io_registry_entry_t v8;
  const __CFNumber *v9;
  const __CFNumber *v10;
  const __CFDictionary *v11;
  io_service_t MatchingService;
  const __CFAllocator *v13;
  const __CFNumber *v14;
  const __CFNumber *v15;
  int valuePtr;
  io_iterator_t existing[2];

  *(_QWORD *)existing = 0;
  v1 = 3758097097;
  valuePtr = 0;
  if (a1)
  {
    v3 = 0;
    *a1 = 0;
    v4 = *MEMORY[0x24BDD8B18];
    v5 = 1;
    while (1)
    {
      v6 = v5;
      v7 = IOServiceMatching(off_25080A240[v3]);
      IOServiceGetMatchingServices(v4, v7, &existing[1]);
      v5 = existing[1];
      if (existing[1])
        break;
      v3 = 1;
      if ((v6 & 1) == 0)
        return 3758097086;
    }
    v11 = IOServiceNameMatching(off_25080A240[v3]);
    MatchingService = IOServiceGetMatchingService(v4, v11);
    v8 = MatchingService;
    if (MatchingService)
    {
      v13 = (const __CFAllocator *)*MEMORY[0x24BDBD240];
      v14 = (const __CFNumber *)IORegistryEntrySearchCFProperty(MatchingService, "IOService", CFSTR("StrobeState"), (CFAllocatorRef)*MEMORY[0x24BDBD240], 3u);
      v9 = v14;
      if (v14)
      {
        CFNumberGetValue(v14, kCFNumberSInt32Type, existing);
        v15 = (const __CFNumber *)IORegistryEntrySearchCFProperty(v8, "IOService", CFSTR("LidarState"), v13, 3u);
        v10 = v15;
        if (v15)
        {
          CFNumberGetValue(v15, kCFNumberSInt32Type, &valuePtr);
          v1 = 0;
          *a1 = existing[0] | (2 * valuePtr);
        }
        goto LABEL_13;
      }
    }
    else
    {
      v1 = 0;
      v9 = 0;
    }
    v10 = 0;
  }
  else
  {
    v8 = 0;
    v9 = 0;
    v10 = 0;
    v1 = 3758097090;
  }
LABEL_13:
  if (existing[1])
  {
    IOObjectRelease(existing[1]);
    existing[1] = 0;
  }
  if (v8)
    IOObjectRelease(v8);
  if (v9)
    CFRelease(v9);
  if (v10)
    CFRelease(v10);
  return v1;
}

uint64_t ApplePhotonDetectorServicesGetLuxAsync()
{
  NSObject *v0;
  NSObject *v1;
  NSObject **v2;
  NSObject *v3;
  uint64_t v4;
  NSObject *v5;
  NSObject **v6;
  NSObject *v7;
  NSObject *v8;
  int *v9;
  NSObject *v10;
  uint64_t v11;
  xpc_object_t v12;
  NSObject *v13;
  uint64_t v14;
  NSObject *v15;
  const char *v16;
  uint64_t *v17;
  int v18;
  NSObject *v19;
  const char *v20;
  uint32_t v21;
  NSObject *v22;
  NSObject *v23;
  NSObject *v24;
  uint64_t v26;
  _xpc_connection_s *v27;
  NSObject *v28;
  _DWORD *v29;
  int v30;
  unsigned int v31;
  uint64_t v32;
  _xpc_connection_s *v33;
  NSObject *v34;
  _QWORD v35[12];
  uint64_t v36;
  uint64_t *v37;
  uint64_t v38;
  void *v39;
  _QWORD handler[10];
  _QWORD block[7];
  _QWORD v42[3];
  int v43;
  uint64_t v44;
  uint64_t *v45;
  uint64_t v46;
  NSObject *v47;
  uint64_t v48;
  uint64_t *v49;
  uint64_t v50;
  char v51;
  uint64_t v52;
  uint64_t *v53;
  uint64_t v54;
  int v55;
  uint8_t v56[4];
  const char *v57;
  __int128 v58;
  uint64_t v59;
  char v60;
  uint8_t buf[4];
  const char *v62;
  __int16 v63;
  NSObject *v64;
  __int16 v65;
  NSObject **v66;
  __int16 v67;
  NSObject *v68;
  __int16 v69;
  NSObject *v70;
  uint64_t v71;

  v0 = MEMORY[0x24BDAC7A8]();
  v5 = v3;
  v6 = v2;
  v7 = v1;
  v8 = v0;
  v71 = *MEMORY[0x24BDAC8D0];
  v52 = 0;
  v53 = &v52;
  v54 = 0x2000000000;
  v55 = 0;
  v48 = 0;
  v49 = &v48;
  v50 = 0x2000000000;
  v51 = 0;
  if (v0 && v1 && v2 && v3)
  {
    v9 = &v55;
    v44 = 0;
    v45 = &v44;
    v46 = 0x2000000000;
    v47 = v0;
    if (v0->isa)
    {
      if (!*((_BYTE *)v2 + 36))
      {
        if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 136315138;
          v62 = "ApplePhotonDetectorServicesGetLuxAsync";
          _os_log_impl(&dword_236A3A000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT, "%s: Error! Client requested 0 samples\n", buf, 0xCu);
          v9 = (int *)(v53 + 3);
        }
        v18 = -536870911;
        goto LABEL_27;
      }
      v10 = *v2;
      if (*v2 && v2[2] && v2[1] && v2[3])
      {
        v11 = v4;
        dispatch_retain(v1);
        v42[0] = 0;
        v42[1] = v42;
        v42[2] = 0x2000000000;
        v43 = 0;
        bzero(buf, 0xE60uLL);
        v12 = xpc_dictionary_create(0, 0, 0);
        if (v12)
        {
          v13 = *(NSObject **)v45[3];
          v14 = MEMORY[0x24BDAC760];
          block[0] = MEMORY[0x24BDAC760];
          block[1] = 0x40000000;
          block[2] = __ApplePhotonDetectorServicesGetLuxAsync_block_invoke;
          block[3] = &unk_25080A258;
          block[4] = &v44;
          block[5] = &v48;
          block[6] = &v52;
          dispatch_sync(v13, block);
          if (!*((_DWORD *)v53 + 6))
          {
            if (!*((_BYTE *)v49 + 24))
              xpc_connection_set_event_handler(*(xpc_connection_t *)(v45[3] + 8), &__block_literal_global_0);
            xpc_connection_activate(*(xpc_connection_t *)(v45[3] + 8));
            if (isIspPowered(v45[3] + 8) && *((unsigned __int8 *)v6 + 36) <= 4u)
            {
              *(_DWORD *)buf = 104;
              xpc_dictionary_set_uint64(v12, *(const char **)(v45[3] + 24), 2uLL);
              xpc_dictionary_set_data(v12, *(const char **)(v45[3] + 32), buf, 0xE60uLL);
              v26 = v45[3];
              v27 = *(_xpc_connection_s **)(v26 + 8);
              v28 = *(NSObject **)(v26 + 16);
              handler[0] = v14;
              handler[1] = 0x40000000;
              handler[2] = __ApplePhotonDetectorServicesGetLuxAsync_block_invoke_20;
              handler[3] = &unk_25080A2C0;
              handler[4] = &v44;
              handler[5] = v42;
              handler[6] = v6;
              handler[7] = v5;
              handler[8] = v7;
              handler[9] = v11;
              xpc_connection_send_message_with_reply(v27, v12, v28, handler);
            }
            else
            {
              *(_QWORD *)&v58 = 0;
              *((_QWORD *)&v58 + 1) = &v58;
              v59 = 0x2000000000;
              v60 = 0;
              v36 = 0;
              v37 = &v36;
              v38 = 0x2000000000;
              v39 = 0;
              v39 = malloc_type_calloc(1uLL, 4uLL, 0x100004052888210uLL);
              v29 = (_DWORD *)v37[3];
              if (v29)
              {
                v30 = *((unsigned __int8 *)v6 + 36);
                *v29 = v30;
                if (v30)
                {
                  v31 = 0;
                  do
                  {
                    *(_DWORD *)buf = 100;
                    xpc_dictionary_set_uint64(v12, *(const char **)(v45[3] + 24), 2uLL);
                    xpc_dictionary_set_data(v12, *(const char **)(v45[3] + 32), buf, 0xE60uLL);
                    v32 = v45[3];
                    v33 = *(_xpc_connection_s **)(v32 + 8);
                    v34 = *(NSObject **)(v32 + 16);
                    v35[0] = MEMORY[0x24BDAC760];
                    v35[1] = 0x40000000;
                    v35[2] = __ApplePhotonDetectorServicesGetLuxAsync_block_invoke_24;
                    v35[3] = &unk_25080A308;
                    v35[4] = &v44;
                    v35[5] = v42;
                    v35[6] = &v58;
                    v35[7] = &v36;
                    v35[8] = v6;
                    v35[9] = v5;
                    v35[10] = v7;
                    v35[11] = v11;
                    xpc_connection_send_message_with_reply(v33, v12, v34, v35);
                    ++v31;
                  }
                  while (v31 < *((unsigned __int8 *)v6 + 36));
                }
              }
              else
              {
                if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
                {
                  *(_DWORD *)v56 = 136315138;
                  v57 = "ApplePhotonDetectorServicesGetLuxAsync";
                  _os_log_impl(&dword_236A3A000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT, "%s: Could not allocate memory for counter \n", v56, 0xCu);
                }
                disconnectFromDaemon((NSObject **)v45[3]);
              }
              _Block_object_dispose(&v36, 8);
              _Block_object_dispose(&v58, 8);
            }
            goto LABEL_46;
          }
          if (!os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
          {
LABEL_46:
            _Block_object_dispose(v42, 8);
            _Block_object_dispose(&v44, 8);
            if (v12)
              xpc_release(v12);
            goto LABEL_28;
          }
          LODWORD(v58) = 136315138;
          *(_QWORD *)((char *)&v58 + 4) = "ApplePhotonDetectorServicesGetLuxAsync";
          v15 = MEMORY[0x24BDACB70];
          v16 = "%s: Could not establish a connection with the daemon, exiting\n";
        }
        else
        {
          if (!os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
            goto LABEL_46;
          LODWORD(v58) = 136315138;
          *(_QWORD *)((char *)&v58 + 4) = "ApplePhotonDetectorServicesGetLuxAsync";
          v15 = MEMORY[0x24BDACB70];
          v16 = "%s: Could not create dictionary, exiting\n";
        }
        _os_log_impl(&dword_236A3A000, v15, OS_LOG_TYPE_DEFAULT, v16, (uint8_t *)&v58, 0xCu);
        goto LABEL_46;
      }
      v18 = -536870211;
      if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
      {
        v23 = v6[1];
        v22 = v6[2];
        v24 = v6[3];
        *(_DWORD *)buf = 136316162;
        v62 = "ApplePhotonDetectorServicesGetLuxAsync";
        v63 = 2048;
        v64 = v10;
        v65 = 2048;
        v66 = (NSObject **)v22;
        v67 = 2048;
        v68 = v23;
        v69 = 2048;
        v70 = v24;
        v19 = MEMORY[0x24BDACB70];
        v20 = "%s: Error! Client has not allocated the required memory: lux samples = %p, abs time = %p, gains = %p, coex = %p\n";
        v21 = 52;
        goto LABEL_23;
      }
    }
    else
    {
      v18 = -536870195;
      if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315138;
        v62 = "ApplePhotonDetectorServicesGetLuxAsync";
        v19 = MEMORY[0x24BDACB70];
        v20 = "%s: APDS dispatch queue is unavailable. Was it not allocated ?\n";
        v21 = 12;
LABEL_23:
        _os_log_impl(&dword_236A3A000, v19, OS_LOG_TYPE_DEFAULT, v20, buf, v21);
        v9 = (int *)(v53 + 3);
      }
    }
LABEL_27:
    *v9 = v18;
    _Block_object_dispose(&v44, 8);
    goto LABEL_28;
  }
  if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136316162;
    v62 = "ApplePhotonDetectorServicesGetLuxAsync";
    v63 = 2048;
    v64 = v7;
    v65 = 2048;
    v66 = v6;
    v67 = 2048;
    v68 = v5;
    v69 = 2048;
    v70 = v8;
    _os_log_impl(&dword_236A3A000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT, "%s: Invalid arguments, replyQueue = 0x%p, info = 0x%p, UserCallback = 0x%p, handle = %p exiting\n", buf, 0x34u);
    v17 = v53;
  }
  else
  {
    v17 = &v52;
  }
  *((_DWORD *)v17 + 6) = -536870911;
LABEL_28:
  _Block_object_dispose(&v48, 8);
  _Block_object_dispose(&v52, 8);
  return 0;
}

void sub_236A3D488(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,char a43,uint64_t a44,uint64_t a45,uint64_t a46,char a47,uint64_t a48,uint64_t a49,uint64_t a50,char a51,uint64_t a52,uint64_t a53,uint64_t a54,char a55,uint64_t a56,uint64_t a57,uint64_t a58,uint64_t a59,uint64_t a60,char a61)
{
  _Block_object_dispose(&a61, 8);
  _Block_object_dispose(&a43, 8);
  _Block_object_dispose(&a47, 8);
  _Block_object_dispose(&a51, 8);
  _Block_object_dispose(&a55, 8);
  _Unwind_Resume(a1);
}

void disconnectFromDaemon(NSObject **a1)
{
  NSObject *v2;
  _QWORD block[5];

  if (a1)
  {
    v2 = *a1;
    if (v2)
    {
      block[0] = MEMORY[0x24BDAC760];
      block[1] = 0x40000000;
      block[2] = ___ZL20disconnectFromDaemonP27ApplePhotonDetectorServices_block_invoke;
      block[3] = &__block_descriptor_tmp_29;
      block[4] = a1;
      dispatch_sync(v2, block);
    }
  }
}

uint64_t ApplePhotonDetectorServicesOpen(dispatch_object_t **a1)
{
  dispatch_object_t *v2;
  dispatch_queue_t v3;
  uint64_t result;
  NSObject *v5;
  const char *v6;
  int v7;
  const char *v8;
  __int16 v9;
  int v10;
  uint64_t v11;

  v11 = *MEMORY[0x24BDAC8D0];
  v2 = (dispatch_object_t *)malloc_type_calloc(1uLL, 0x58uLL, 0x1070040C4D0D65AuLL);
  if (!v2)
  {
    if (!os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
      goto LABEL_9;
    v7 = 136315394;
    v8 = "ApplePhotonDetectorServicesOpen";
    v9 = 1024;
    v10 = 806;
    v5 = MEMORY[0x24BDACB70];
    v6 = "%s: %d: Could not open an interface to APDS\n";
LABEL_8:
    _os_log_impl(&dword_236A3A000, v5, OS_LOG_TYPE_DEFAULT, v6, (uint8_t *)&v7, 0x12u);
LABEL_9:
    if (*v2)
      dispatch_release(*v2);
    goto LABEL_11;
  }
  v3 = dispatch_queue_create("com.apple.applephotondetectorservicesprivatequeue", 0);
  *v2 = v3;
  if (!v3)
  {
    if (!os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
    {
LABEL_11:
      free(v2);
      v2 = 0;
      result = 3758097085;
      goto LABEL_12;
    }
    v7 = 136315394;
    v8 = "ApplePhotonDetectorServicesOpen";
    v9 = 1024;
    v10 = 814;
    v5 = MEMORY[0x24BDACB70];
    v6 = "%s: %d: Could not create a serial queue\n";
    goto LABEL_8;
  }
  result = 0;
LABEL_12:
  *a1 = v2;
  return result;
}

uint64_t ApplePhotonDetectorServicesClose(NSObject **a1)
{
  NSObject *v2;
  int v4;
  const char *v5;
  __int16 v6;
  int v7;
  __int16 v8;
  uint64_t v9;
  uint64_t v10;

  v10 = *MEMORY[0x24BDAC8D0];
  if (a1)
  {
    v2 = *a1;
    if (v2)
      dispatch_release(v2);
    free(a1);
    return 0;
  }
  else
  {
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
    {
      v4 = 136315650;
      v5 = "ApplePhotonDetectorServicesClose";
      v6 = 1024;
      v7 = 849;
      v8 = 2048;
      v9 = 0;
      _os_log_impl(&dword_236A3A000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT, "%s: %d: Invalid handle provided %p\n", (uint8_t *)&v4, 0x1Cu);
    }
    return 3758096385;
  }
}

void ___ZL20disconnectFromDaemonP27ApplePhotonDetectorServices_block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  NSObject *v4;

  v2 = *(_QWORD *)(a1 + 32);
  if (*(_QWORD *)(v2 + 8))
  {
    v3 = *(_QWORD *)(v2 + 80) - 1;
    *(_QWORD *)(v2 + 80) = v3;
    if (!v3)
    {
      disconnect((xpc_connection_t *)(v2 + 8));
      v4 = *(NSObject **)(*(_QWORD *)(a1 + 32) + 16);
      if (v4)
      {
        dispatch_release(v4);
        *(_QWORD *)(*(_QWORD *)(a1 + 32) + 16) = 0;
      }
    }
  }
}

Boolean CFNumberGetValue(CFNumberRef number, CFNumberType theType, void *valuePtr)
{
  return MEMORY[0x24BDBC130](number, theType, valuePtr);
}

void CFRelease(CFTypeRef cf)
{
  MEMORY[0x24BDBC298](cf);
}

kern_return_t IOObjectRelease(io_object_t object)
{
  return MEMORY[0x24BDD86F8](*(_QWORD *)&object);
}

CFTypeRef IORegistryEntrySearchCFProperty(io_registry_entry_t entry, const io_name_t plane, CFStringRef key, CFAllocatorRef allocator, IOOptionBits options)
{
  return (CFTypeRef)MEMORY[0x24BDD8928](*(_QWORD *)&entry, plane, key, allocator, *(_QWORD *)&options);
}

io_service_t IOServiceGetMatchingService(mach_port_t mainPort, CFDictionaryRef matching)
{
  return MEMORY[0x24BDD8988](*(_QWORD *)&mainPort, matching);
}

kern_return_t IOServiceGetMatchingServices(mach_port_t mainPort, CFDictionaryRef matching, io_iterator_t *existing)
{
  return MEMORY[0x24BDD8990](*(_QWORD *)&mainPort, matching, existing);
}

CFMutableDictionaryRef IOServiceMatching(const char *name)
{
  return (CFMutableDictionaryRef)MEMORY[0x24BDD89A8](name);
}

CFMutableDictionaryRef IOServiceNameMatching(const char *name)
{
  return (CFMutableDictionaryRef)MEMORY[0x24BDD89B0](name);
}

void _Block_object_dispose(const void *a1, const int a2)
{
  MEMORY[0x24BDAC730](a1, *(_QWORD *)&a2);
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
  MEMORY[0x24BDAC780](exception_object);
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x24BDACB90](dso, log, type, format, buf, *(_QWORD *)&size);
}

void bzero(void *a1, size_t a2)
{
  MEMORY[0x24BDAD320](a1, a2);
}

void dispatch_async(dispatch_queue_t queue, dispatch_block_t block)
{
  MEMORY[0x24BDADCC0](queue, block);
}

dispatch_queue_t dispatch_queue_create(const char *label, dispatch_queue_attr_t attr)
{
  return (dispatch_queue_t)MEMORY[0x24BDADED0](label, attr);
}

void dispatch_release(dispatch_object_t object)
{
  MEMORY[0x24BDADF10](object);
}

void dispatch_retain(dispatch_object_t object)
{
  MEMORY[0x24BDADF20](object);
}

void dispatch_sync(dispatch_queue_t queue, dispatch_block_t block)
{
  MEMORY[0x24BDADFE8](queue, block);
}

void free(void *a1)
{
  MEMORY[0x24BDAE450](a1);
}

void *__cdecl malloc_type_calloc(size_t count, size_t size, malloc_type_id_t type_id)
{
  return (void *)MEMORY[0x24BDAED70](count, size, type_id);
}

void *__cdecl memcpy(void *__dst, const void *__src, size_t __n)
{
  return (void *)MEMORY[0x24BDAEE80](__dst, __src, __n);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x24BDAF398](oslog, type);
}

uint64_t os_variant_is_recovery()
{
  return MEMORY[0x24BDAF4F0]();
}

void xpc_connection_activate(xpc_connection_t connection)
{
  MEMORY[0x24BDB0710](connection);
}

void xpc_connection_cancel(xpc_connection_t connection)
{
  MEMORY[0x24BDB0718](connection);
}

xpc_connection_t xpc_connection_create_mach_service(const char *name, dispatch_queue_t targetq, uint64_t flags)
{
  return (xpc_connection_t)MEMORY[0x24BDB0740](name, targetq, flags);
}

void xpc_connection_send_message_with_reply(xpc_connection_t connection, xpc_object_t message, dispatch_queue_t replyq, xpc_handler_t handler)
{
  MEMORY[0x24BDB07B0](connection, message, replyq, handler);
}

xpc_object_t xpc_connection_send_message_with_reply_sync(xpc_connection_t connection, xpc_object_t message)
{
  return (xpc_object_t)MEMORY[0x24BDB07B8](connection, message);
}

void xpc_connection_set_event_handler(xpc_connection_t connection, xpc_handler_t handler)
{
  MEMORY[0x24BDB07C8](connection, handler);
}

xpc_object_t xpc_dictionary_create(const char *const *keys, xpc_object_t *values, size_t count)
{
  return (xpc_object_t)MEMORY[0x24BDB08C0](keys, values, count);
}

const void *__cdecl xpc_dictionary_get_data(xpc_object_t xdict, const char *key, size_t *length)
{
  return (const void *)MEMORY[0x24BDB0918](xdict, key, length);
}

const char *__cdecl xpc_dictionary_get_string(xpc_object_t xdict, const char *key)
{
  return (const char *)MEMORY[0x24BDB0950](xdict, key);
}

void xpc_dictionary_set_data(xpc_object_t xdict, const char *key, const void *bytes, size_t length)
{
  MEMORY[0x24BDB0988](xdict, key, bytes, length);
}

void xpc_dictionary_set_string(xpc_object_t xdict, const char *key, const char *string)
{
  MEMORY[0x24BDB09C8](xdict, key, string);
}

void xpc_dictionary_set_uint64(xpc_object_t xdict, const char *key, uint64_t value)
{
  MEMORY[0x24BDB09D0](xdict, key, value);
}

xpc_type_t xpc_get_type(xpc_object_t object)
{
  return (xpc_type_t)MEMORY[0x24BDB0A70](object);
}

