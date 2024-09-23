uint64_t BTLocalDeviceGetAirplaneModeStatus(uint64_t a1, _DWORD *a2)
{
  NSObject *v4;
  uint64_t MBXpcConnection;
  uint64_t v6;
  xpc_object_t v7;
  uint64_t v8;
  _QWORD v10[6];
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  uint64_t v14;
  __int128 buf;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  if (MBFLogInitOnce != -1)
    dispatch_once_f(&MBFLogInitOnce, 0, (dispatch_function_t)MBFLogInit);
  v4 = MBFLogComponent;
  if (os_log_type_enabled((os_log_t)MBFLogComponent, OS_LOG_TYPE_DEBUG))
  {
    LODWORD(buf) = 134217984;
    *(_QWORD *)((char *)&buf + 4) = a1;
    _os_log_debug_impl(&dword_1B6BF1000, v4, OS_LOG_TYPE_DEBUG, "BTLocalDeviceGetAirplaneModeStatus over XPC localDevice:%llx", (uint8_t *)&buf, 0xCu);
  }
  MBXpcConnection = getMBXpcConnection(a1);
  if (MBXpcConnection)
  {
    v6 = MBXpcConnection;
    v7 = xpc_dictionary_create(0, 0, 0);
    xpc_dictionary_set_uint64(v7, "kCBMsgArgLocalDeviceID", a1);
    *(_QWORD *)&buf = 0;
    *((_QWORD *)&buf + 1) = &buf;
    v16 = 0x2000000000;
    v17 = 0;
    v11 = 0;
    v12 = &v11;
    v13 = 0x2000000000;
    v14 = 0;
    v10[0] = MEMORY[0x1E0C809B0];
    v10[1] = 0x40000000;
    v10[2] = __BTLocalDeviceGetAirplaneModeStatus_block_invoke;
    v10[3] = &unk_1E6B06550;
    v10[4] = &buf;
    v10[5] = &v11;
    sendMessageWithReplySync(v6, "kCBMsgIdLocalDeviceGetAirplaneModeStatusMsg", v7, (uint64_t)v10);
    if (v7)
      xpc_release(v7);
    *a2 = v12[3];
    v8 = *(unsigned int *)(*((_QWORD *)&buf + 1) + 24);
    _Block_object_dispose(&v11, 8);
    _Block_object_dispose(&buf, 8);
  }
  else
  {
    if (MBFLogInitOnce != -1)
      dispatch_once_f(&MBFLogInitOnce, 0, (dispatch_function_t)MBFLogInit);
    if (os_log_type_enabled((os_log_t)MBFLogComponent, OS_LOG_TYPE_ERROR))
      BTAccessoryManagerRemoveCallbacks_cold_1();
    return 1;
  }
  return v8;
}

uint64_t BTLocalDeviceGetPairedDevices(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t MBXpcConnection;
  uint64_t v9;
  xpc_object_t v10;
  uint64_t v11;
  _QWORD v13[8];
  uint64_t v14;
  uint64_t *v15;
  uint64_t v16;
  uint64_t v17;

  if (MBFLogInitOnce != -1)
    dispatch_once_f(&MBFLogInitOnce, 0, (dispatch_function_t)MBFLogInit);
  if (os_log_type_enabled((os_log_t)MBFLogComponent, OS_LOG_TYPE_DEBUG))
    BTLocalDeviceGetPairedDevices_cold_2();
  MBXpcConnection = getMBXpcConnection(a1);
  if (MBXpcConnection)
  {
    v9 = MBXpcConnection;
    v10 = xpc_dictionary_create(0, 0, 0);
    xpc_dictionary_set_uint64(v10, "kCBMsgArgLocalDeviceID", a1);
    xpc_dictionary_set_uint64(v10, "kCbMsgArgDeviceArrayMaxSize", a4);
    v14 = 0;
    v15 = &v14;
    v16 = 0x2000000000;
    v17 = 0;
    v13[0] = MEMORY[0x1E0C809B0];
    v13[1] = 0x40000000;
    v13[2] = __BTLocalDeviceGetPairedDevices_block_invoke;
    v13[3] = &unk_1E6B06690;
    v13[4] = &v14;
    v13[5] = a4;
    v13[6] = a2;
    v13[7] = a3;
    sendMessageWithReplySync(v9, "kCBMsgIdLocalDeviceGetPairedDevicesMsg", v10, (uint64_t)v13);
    if (v10)
      xpc_release(v10);
    v11 = *((unsigned int *)v15 + 6);
    _Block_object_dispose(&v14, 8);
  }
  else
  {
    if (MBFLogInitOnce != -1)
      dispatch_once_f(&MBFLogInitOnce, 0, (dispatch_function_t)MBFLogInit);
    if (os_log_type_enabled((os_log_t)MBFLogComponent, OS_LOG_TYPE_ERROR))
      BTAccessoryManagerGetDevices_cold_1();
    return 1;
  }
  return v11;
}

uint64_t BTLocalDeviceGetDefault(uint64_t *a1, _QWORD *a2)
{
  uint64_t SessionHandle;
  uint64_t MBXpcConnection;
  NSObject *v6;
  xpc_object_t v7;
  uint64_t v8;
  _QWORD v10[6];
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  uint64_t v14;
  _BYTE buf[24];
  uint64_t *v16;
  __int16 v17;
  uint64_t v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  SessionHandle = getSessionHandle(a1);
  MBXpcConnection = getMBXpcConnection((uint64_t)a1);
  if (MBFLogInitOnce != -1)
    dispatch_once_f(&MBFLogInitOnce, 0, (dispatch_function_t)MBFLogInit);
  if (os_log_type_enabled((os_log_t)MBFLogComponent, OS_LOG_TYPE_DEBUG))
    BTLocalDeviceGetDefault_cold_2();
  if (MBXpcConnection)
  {
    if (MBFLogInitOnce != -1)
      dispatch_once_f(&MBFLogInitOnce, 0, (dispatch_function_t)MBFLogInit);
    v6 = MBFLogComponent;
    if (os_log_type_enabled((os_log_t)MBFLogComponent, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 136315906;
      *(_QWORD *)&buf[4] = MBXpcConnection + 2336;
      *(_WORD *)&buf[12] = 2080;
      *(_QWORD *)&buf[14] = MBXpcConnection + 2080;
      *(_WORD *)&buf[22] = 2048;
      v16 = a1;
      v17 = 2048;
      v18 = SessionHandle;
      _os_log_debug_impl(&dword_1B6BF1000, v6, OS_LOG_TYPE_DEBUG, "BTLocalDeviceGetDefault service:%s, sessionName:%s session:%llx sessionID:%llx", buf, 0x2Au);
    }
    v7 = xpc_dictionary_create(0, 0, 0);
    xpc_dictionary_set_uint64(v7, "kCBMsgArgSessionID", SessionHandle);
    *(_QWORD *)buf = 0;
    *(_QWORD *)&buf[8] = buf;
    *(_QWORD *)&buf[16] = 0x2000000000;
    v16 = 0;
    v11 = 0;
    v12 = &v11;
    v13 = 0x2000000000;
    v14 = 0;
    v10[0] = MEMORY[0x1E0C809B0];
    v10[1] = 0x40000000;
    v10[2] = __BTLocalDeviceGetDefault_block_invoke;
    v10[3] = &unk_1E6B06410;
    v10[4] = buf;
    v10[5] = &v11;
    sendMessageWithReplySync(MBXpcConnection, "kCBMsgIdLocalDeviceGetDefaultMsg", v7, (uint64_t)v10);
    *a2 = *(_QWORD *)(*(_QWORD *)&buf[8] + 24);
    if (v7)
      xpc_release(v7);
    v8 = *((unsigned int *)v12 + 6);
    _Block_object_dispose(&v11, 8);
    _Block_object_dispose(buf, 8);
  }
  else
  {
    if (MBFLogInitOnce != -1)
      dispatch_once_f(&MBFLogInitOnce, 0, (dispatch_function_t)MBFLogInit);
    if (os_log_type_enabled((os_log_t)MBFLogComponent, OS_LOG_TYPE_ERROR))
      BTLocalDeviceGetDefault_cold_1();
    return 1;
  }
  return v8;
}

uint64_t BTAccessoryManagerAddCallbacks(uint64_t a1, _QWORD *a2, uint64_t a3)
{
  uint64_t MBXpcConnection;
  uint64_t v7;
  xpc_object_t v8;
  _QWORD v10[5];
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t value;

  MBXpcConnection = getMBXpcConnection(a1);
  if (MBFLogInitOnce != -1)
    dispatch_once_f(&MBFLogInitOnce, 0, (dispatch_function_t)MBFLogInit);
  if (os_log_type_enabled((os_log_t)MBFLogComponent, OS_LOG_TYPE_DEBUG))
  {
    BTAccessoryManagerAddCallbacks_cold_4();
    if (MBXpcConnection)
    {
LABEL_5:
      if (_localBTAccessoryManagerCallbacksRegistered(a1, a2))
      {
        if (MBFLogInitOnce != -1)
          dispatch_once_f(&MBFLogInitOnce, 0, (dispatch_function_t)MBFLogInit);
        if (os_log_type_enabled((os_log_t)MBFLogComponent, OS_LOG_TYPE_DEBUG))
          BTAccessoryManagerAddCallbacks_cold_2();
        return 0;
      }
      else
      {
        value = 0;
        if (_localBTAccessoryManagerAddCallbacks(a1, MBXpcConnection, a2, a3, (uint64_t *)&value))
        {
          if (MBFLogInitOnce != -1)
            dispatch_once_f(&MBFLogInitOnce, 0, (dispatch_function_t)MBFLogInit);
          if (os_log_type_enabled((os_log_t)MBFLogComponent, OS_LOG_TYPE_DEBUG))
            BTAccessoryManagerAddCallbacks_cold_3();
          return 4;
        }
        else
        {
          v8 = xpc_dictionary_create(0, 0, 0);
          xpc_dictionary_set_uint64(v8, "kCBMsgArgAccessoryManagerID", a1);
          xpc_dictionary_set_uint64(v8, "kCBMsgArgID", value);
          v11 = 0;
          v12 = &v11;
          v13 = 0x2000000000;
          v14 = 0;
          v10[0] = MEMORY[0x1E0C809B0];
          v10[1] = 0x40000000;
          v10[2] = __BTAccessoryManagerAddCallbacks_block_invoke;
          v10[3] = &unk_1E6B04DC0;
          v10[4] = &v11;
          sendMessageWithReplySync(MBXpcConnection, "kCBMsgIdAccessoryAddCallbacksMsg", v8, (uint64_t)v10);
          if (v8)
            xpc_release(v8);
          if (v12[3])
          {
            _localBTAccessoryManagerRemoveCallbacks(a1, a2);
            v7 = *((unsigned int *)v12 + 6);
          }
          else
          {
            v7 = 0;
          }
          _Block_object_dispose(&v11, 8);
        }
      }
      return v7;
    }
  }
  else if (MBXpcConnection)
  {
    goto LABEL_5;
  }
  if (MBFLogInitOnce != -1)
    dispatch_once_f(&MBFLogInitOnce, 0, (dispatch_function_t)MBFLogInit);
  if (os_log_type_enabled((os_log_t)MBFLogComponent, OS_LOG_TYPE_ERROR))
    BTAccessoryManagerAddCallbacks_cold_1();
  return 1;
}

BOOL _localBTAccessoryManagerCallbacksRegistered(uint64_t a1, _QWORD *a2)
{
  unint64_t v4;
  BOOL v5;
  __int128 *v6;
  BOOL v7;
  BOOL v8;

  pthread_mutex_lock(&gLock);
  v4 = 0;
  v5 = 1;
  v6 = &gBTAccessoryManagerCallbackList;
  do
  {
    if (*((_QWORD *)v6 + 4) == a1)
    {
      v7 = *(_QWORD *)v6 == *a2 && *((_QWORD *)v6 + 1) == a2[1];
      v8 = v7 && *((_QWORD *)v6 + 2) == a2[2];
      if (v8 && *((_QWORD *)v6 + 3) == a2[3])
        break;
    }
    v5 = v4 < 0x3F;
    v6 += 4;
    ++v4;
  }
  while (v4 != 64);
  pthread_mutex_unlock(&gLock);
  return v5;
}

uint64_t _localBTAccessoryManagerAddCallbacks(uint64_t a1, uint64_t a2, _OWORD *a3, uint64_t a4, uint64_t *a5)
{
  uint64_t v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t v13;
  __int128 v14;
  NSObject *v15;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  _DWORD v20[2];
  __int16 v21;
  uint64_t v22;
  __int16 v23;
  uint64_t v24;
  __int16 v25;
  uint64_t v26;
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  pthread_mutex_lock(&gLock);
  v10 = 0;
  v11 = &qword_1ECF89628;
  while (*v11 || v11[2])
  {
    ++v10;
    v11 += 8;
    if (v10 == 64)
    {
      v12 = 4;
      goto LABEL_11;
    }
  }
  v13 = ++gCBID;
  v11[2] = gCBID;
  v11[3] = a4;
  *v11 = a1;
  v14 = a3[1];
  *((_OWORD *)v11 - 2) = *a3;
  *((_OWORD *)v11 - 1) = v14;
  v11[1] = a2;
  *a5 = v13;
  if (MBFLogInitOnce != -1)
    dispatch_once_f(&MBFLogInitOnce, 0, (dispatch_function_t)MBFLogInit);
  v15 = MBFLogComponent;
  if (os_log_type_enabled((os_log_t)MBFLogComponent, OS_LOG_TYPE_DEBUG))
  {
    v17 = *v11;
    v18 = v11[2];
    v19 = v11[3];
    v20[0] = 67109888;
    v20[1] = v10;
    v21 = 2048;
    v22 = v17;
    v23 = 2048;
    v24 = v18;
    v25 = 2048;
    v26 = v19;
    _os_log_debug_impl(&dword_1B6BF1000, v15, OS_LOG_TYPE_DEBUG, "_localBTAccessoryManagerAddCallbacks[%d] manager:%p cbid:%llx userData:%p ", (uint8_t *)v20, 0x26u);
  }
  v12 = 0;
LABEL_11:
  pthread_mutex_unlock(&gLock);
  return v12;
}

uint64_t BTDeviceFromAddress(uint64_t *a1, const void *a2, _QWORD *a3)
{
  uint64_t SessionHandle;
  uint64_t MBXpcConnection;
  uint64_t v8;
  xpc_object_t v9;
  uint64_t v10;
  _QWORD v12[6];
  uint64_t v13;
  uint64_t *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t *v18;
  uint64_t v19;
  uint64_t v20;

  SessionHandle = getSessionHandle(a1);
  if (MBFLogInitOnce != -1)
    dispatch_once_f(&MBFLogInitOnce, 0, (dispatch_function_t)MBFLogInit);
  if (os_log_type_enabled((os_log_t)MBFLogComponent, OS_LOG_TYPE_DEBUG))
    BTDeviceFromAddress_cold_2();
  MBXpcConnection = getMBXpcConnection((uint64_t)a1);
  if (MBXpcConnection)
  {
    v8 = MBXpcConnection;
    v9 = xpc_dictionary_create(0, 0, 0);
    xpc_dictionary_set_data(v9, "kCBMsgArgAddressBytes", a2, 6uLL);
    xpc_dictionary_set_uint64(v9, "kCBMsgArgSessionID", SessionHandle);
    v17 = 0;
    v18 = &v17;
    v19 = 0x2000000000;
    v20 = 0;
    v13 = 0;
    v14 = &v13;
    v15 = 0x2000000000;
    v16 = 0;
    v12[0] = MEMORY[0x1E0C809B0];
    v12[1] = 0x40000000;
    v12[2] = __BTDeviceFromAddress_block_invoke;
    v12[3] = &unk_1E6B05AB0;
    v12[4] = &v17;
    v12[5] = &v13;
    sendMessageWithReplySync(v8, "kCBMsgIdDeviceFromAddressMsg", v9, (uint64_t)v12);
    if (v9)
      xpc_release(v9);
    *a3 = v14[3];
    v10 = *((unsigned int *)v18 + 6);
    _Block_object_dispose(&v13, 8);
    _Block_object_dispose(&v17, 8);
  }
  else
  {
    if (MBFLogInitOnce != -1)
      dispatch_once_f(&MBFLogInitOnce, 0, (dispatch_function_t)MBFLogInit);
    if (os_log_type_enabled((os_log_t)MBFLogComponent, OS_LOG_TYPE_ERROR))
      BTDeviceFromAddress_cold_1();
    return 1;
  }
  return v10;
}

void _MBTAsyncAttach(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  void (*v6[5])(_QWORD);
  uint64_t v7;
  uint8_t buf[4];
  uint64_t v9;
  __int16 v10;
  uint64_t v11;
  __int16 v12;
  uint64_t v13;
  __int16 v14;
  uint64_t v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  if (MBFLogInitOnce != -1)
    dispatch_once_f(&MBFLogInitOnce, 0, (dispatch_function_t)MBFLogInit);
  if (os_log_type_enabled((os_log_t)MBFLogComponent, OS_LOG_TYPE_DEBUG))
    _MBTAsyncAttach_cold_3();
  if (isDispatchSessionValid(a1))
  {
    if (MBFLogInitOnce != -1)
      dispatch_once_f(&MBFLogInitOnce, 0, (dispatch_function_t)MBFLogInit);
    if (os_log_type_enabled((os_log_t)MBFLogComponent, OS_LOG_TYPE_DEBUG))
      _MBTAsyncAttach_cold_1();
  }
  else
  {
    v7 = 0;
    *(_QWORD *)(a1 + 88) = createXpcConnection((uint64_t)&xpcCBs, *(NSObject **)(a1 + 32), *(_QWORD *)(a1 + 8), 0, a1, &v7);
    *(_QWORD *)a1 = v7;
    if (MBFLogInitOnce != -1)
      dispatch_once_f(&MBFLogInitOnce, 0, (dispatch_function_t)MBFLogInit);
    v2 = MBFLogComponent;
    if (os_log_type_enabled((os_log_t)MBFLogComponent, OS_LOG_TYPE_DEBUG))
    {
      v3 = *(_QWORD *)a1;
      v4 = *(_QWORD *)(a1 + 88);
      v5 = *(_QWORD *)(a1 + 32);
      *(_DWORD *)buf = 134218752;
      v9 = a1;
      v10 = 2048;
      v11 = v3;
      v12 = 2048;
      v13 = v4;
      v14 = 2048;
      v15 = v5;
      _os_log_debug_impl(&dword_1B6BF1000, v2, OS_LOG_TYPE_DEBUG, "_MBTAsyncAttach fwSession:%llx sessionHandle:%llx xpcConnection:%llx queue:%p", buf, 0x2Au);
    }
    addFWSession(a1);
    if (*(_QWORD *)(a1 + 88) && v7)
    {
      v6[0] = (void (*)(_QWORD))MEMORY[0x1E0C809B0];
      v6[1] = (void (*)(_QWORD))0x40000000;
      v6[2] = (void (*)(_QWORD))___MBTAsyncAttach_block_invoke;
      v6[3] = (void (*)(_QWORD))&__block_descriptor_tmp_5;
      v6[4] = (void (*)(_QWORD))a1;
      _MBTDispachAsyncAttachCompletionBlock(a1, v6);
    }
    else
    {
      if (MBFLogInitOnce != -1)
        dispatch_once_f(&MBFLogInitOnce, 0, (dispatch_function_t)MBFLogInit);
      if (os_log_type_enabled((os_log_t)MBFLogComponent, OS_LOG_TYPE_ERROR))
        _MBTAsyncAttach_cold_2();
      *(_DWORD *)(a1 + 84) = 3;
    }
  }
}

BOOL isDispatchSessionValid(uint64_t a1)
{
  BOOL v2;
  unint64_t v3;
  unint64_t v4;
  uint64_t v5;
  _BOOL8 v7;

  pthread_mutex_lock(&gLock_4);
  if (gFWSessionList[0])
    v2 = gFWSessionList[0] == a1;
  else
    v2 = 0;
  if (v2)
  {
    v7 = 1;
  }
  else
  {
    v3 = 0;
    do
    {
      v4 = v3;
      if (v3 == 99)
        break;
      v5 = gFWSessionList[++v3];
    }
    while (!v5 || v5 != a1);
    v7 = v4 < 0x63;
  }
  pthread_mutex_unlock(&gLock_4);
  return v7;
}

uint64_t addFWSession(uint64_t a1)
{
  unint64_t v2;
  unint64_t v3;
  uint64_t v4;

  if (!a1)
    return 3;
  pthread_mutex_lock(&gLock_4);
  v2 = 0;
  do
    v3 = v2++;
  while (v3 <= 0x63 && gFWSessionList[v3]);
  if (v3 > 0x63)
  {
    v4 = 4;
  }
  else
  {
    v4 = 0;
    ++sessionCount;
    gFWSessionList[v2 - 1] = a1;
  }
  pthread_mutex_unlock(&gLock_4);
  return v4;
}

void _MBTDispachAsyncAttachCompletionBlock(uint64_t a1, void (**a2)(_QWORD))
{
  if (MBFLogInitOnce != -1)
    dispatch_once_f(&MBFLogInitOnce, 0, (dispatch_function_t)MBFLogInit);
  if (os_log_type_enabled((os_log_t)MBFLogComponent, OS_LOG_TYPE_DEBUG))
    _MBTDispachAsyncAttachCompletionBlock_cold_3();
  if (_MBTGetAsyncAttachQueue(a1) == *(dispatch_queue_global_t *)(a1 + 32))
  {
    if (MBFLogInitOnce != -1)
      dispatch_once_f(&MBFLogInitOnce, 0, (dispatch_function_t)MBFLogInit);
    if (os_log_type_enabled((os_log_t)MBFLogComponent, OS_LOG_TYPE_DEBUG))
      _MBTDispachAsyncAttachCompletionBlock_cold_1();
    a2[2](a2);
  }
  else
  {
    if (MBFLogInitOnce != -1)
      dispatch_once_f(&MBFLogInitOnce, 0, (dispatch_function_t)MBFLogInit);
    if (os_log_type_enabled((os_log_t)MBFLogComponent, OS_LOG_TYPE_DEBUG))
      _MBTDispachAsyncAttachCompletionBlock_cold_2();
    dispatch_async(*(dispatch_queue_t *)(a1 + 32), a2);
  }
}

uint64_t BTLocalDeviceGetDenylistEnabled(uint64_t a1, _DWORD *a2)
{
  uint64_t MBXpcConnection;
  uint64_t v5;
  xpc_object_t v6;
  uint64_t v7;
  _QWORD v9[6];
  uint64_t v10;
  uint64_t *v11;
  uint64_t v12;
  int v13;
  uint64_t v14;
  uint64_t *v15;
  uint64_t v16;
  uint64_t v17;

  if (MBFLogInitOnce != -1)
    dispatch_once_f(&MBFLogInitOnce, 0, (dispatch_function_t)MBFLogInit);
  if (os_log_type_enabled((os_log_t)MBFLogComponent, OS_LOG_TYPE_DEBUG))
    BTLocalDeviceGetDenylistEnabled_cold_2();
  MBXpcConnection = getMBXpcConnection(a1);
  if (MBXpcConnection)
  {
    v5 = MBXpcConnection;
    v6 = xpc_dictionary_create(0, 0, 0);
    xpc_dictionary_set_uint64(v6, "kCBMsgArgLocalDeviceID", a1);
    v14 = 0;
    v15 = &v14;
    v16 = 0x2000000000;
    v17 = 0;
    v10 = 0;
    v11 = &v10;
    v12 = 0x2000000000;
    v13 = 0;
    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 0x40000000;
    v9[2] = __BTLocalDeviceGetDenylistEnabled_block_invoke;
    v9[3] = &unk_1E6B06B40;
    v9[4] = &v14;
    v9[5] = &v10;
    sendMessageWithReplySync(v5, "kCBMsgIdLocalDeviceGetDenylistEnabledMsg", v6, (uint64_t)v9);
    if (v6)
      xpc_release(v6);
    *a2 = *((_DWORD *)v11 + 6);
    v7 = *((unsigned int *)v15 + 6);
    _Block_object_dispose(&v10, 8);
    _Block_object_dispose(&v14, 8);
  }
  else
  {
    if (MBFLogInitOnce != -1)
      dispatch_once_f(&MBFLogInitOnce, 0, (dispatch_function_t)MBFLogInit);
    if (os_log_type_enabled((os_log_t)MBFLogComponent, OS_LOG_TYPE_ERROR))
      BTLocalDeviceSetDenylistEnabled_cold_1();
    return 1;
  }
  return v7;
}

uint64_t BTAccessoryManagerGetDefault(uint64_t *a1, _QWORD *a2)
{
  uint64_t SessionHandle;
  uint64_t MBXpcConnection;
  uint64_t v6;
  NSObject *v7;
  xpc_object_t v8;
  uint64_t v9;
  _QWORD v11[6];
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t v15;
  _BYTE buf[24];
  uint64_t *v17;
  __int16 v18;
  uint64_t v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  SessionHandle = getSessionHandle(a1);
  MBXpcConnection = getMBXpcConnection((uint64_t)a1);
  if (MBXpcConnection)
  {
    v6 = MBXpcConnection;
    if (MBFLogInitOnce != -1)
      dispatch_once_f(&MBFLogInitOnce, 0, (dispatch_function_t)MBFLogInit);
    v7 = MBFLogComponent;
    if (os_log_type_enabled((os_log_t)MBFLogComponent, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 136315906;
      *(_QWORD *)&buf[4] = v6 + 2336;
      *(_WORD *)&buf[12] = 2080;
      *(_QWORD *)&buf[14] = v6 + 2080;
      *(_WORD *)&buf[22] = 2048;
      v17 = a1;
      v18 = 2048;
      v19 = SessionHandle;
      _os_log_debug_impl(&dword_1B6BF1000, v7, OS_LOG_TYPE_DEBUG, "BTAccessoryManagerGetDefault service:%s, sessionName:%s session:%llx sessionID:%llx", buf, 0x2Au);
    }
    addXpcMsgHandler(v6, (uint64_t)&accessoryManagerXpcCallbacks);
    v8 = xpc_dictionary_create(0, 0, 0);
    xpc_dictionary_set_uint64(v8, "kCBMsgArgSessionID", SessionHandle);
    *(_QWORD *)buf = 0;
    *(_QWORD *)&buf[8] = buf;
    *(_QWORD *)&buf[16] = 0x2000000000;
    v17 = 0;
    v12 = 0;
    v13 = &v12;
    v14 = 0x2000000000;
    v15 = 0;
    v11[0] = MEMORY[0x1E0C809B0];
    v11[1] = 0x40000000;
    v11[2] = __BTAccessoryManagerGetDefault_block_invoke;
    v11[3] = &unk_1E6B04D98;
    v11[4] = buf;
    v11[5] = &v12;
    sendMessageWithReplySync(v6, "kCBMsgIdAccessoryGetDefaultMsg", v8, (uint64_t)v11);
    *a2 = *(_QWORD *)(*(_QWORD *)&buf[8] + 24);
    if (v8)
      xpc_release(v8);
    v9 = *((unsigned int *)v13 + 6);
    _Block_object_dispose(&v12, 8);
    _Block_object_dispose(buf, 8);
  }
  else
  {
    if (MBFLogInitOnce != -1)
      dispatch_once_f(&MBFLogInitOnce, 0, (dispatch_function_t)MBFLogInit);
    if (os_log_type_enabled((os_log_t)MBFLogComponent, OS_LOG_TYPE_ERROR))
      BTAccessoryManagerGetDefault_cold_1();
    return 1;
  }
  return v9;
}

uint64_t BTLocalDeviceAddCallbacks(uint64_t a1, _QWORD *a2, uint64_t a3)
{
  uint64_t MBXpcConnection;
  uint64_t v7;
  xpc_object_t v8;
  _QWORD v10[5];
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t value;

  MBXpcConnection = getMBXpcConnection(a1);
  if (MBFLogInitOnce != -1)
    dispatch_once_f(&MBFLogInitOnce, 0, (dispatch_function_t)MBFLogInit);
  if (os_log_type_enabled((os_log_t)MBFLogComponent, OS_LOG_TYPE_DEBUG))
  {
    BTLocalDeviceAddCallbacks_cold_4();
    if (MBXpcConnection)
    {
LABEL_5:
      addXpcMsgHandler(MBXpcConnection, (uint64_t)&localDeviceXpcCallbacks);
      if (_localBTLocalDeviceCallbacksRegistered(a1, a2))
      {
        if (MBFLogInitOnce != -1)
          dispatch_once_f(&MBFLogInitOnce, 0, (dispatch_function_t)MBFLogInit);
        if (os_log_type_enabled((os_log_t)MBFLogComponent, OS_LOG_TYPE_DEBUG))
          BTAccessoryManagerAddCallbacks_cold_2();
        return 0;
      }
      else
      {
        value = 0;
        if (_localBTLocalDeviceAddCallbacks(a1, MBXpcConnection, (uint64_t)a2, a3, (uint64_t *)&value))
        {
          if (MBFLogInitOnce != -1)
            dispatch_once_f(&MBFLogInitOnce, 0, (dispatch_function_t)MBFLogInit);
          if (os_log_type_enabled((os_log_t)MBFLogComponent, OS_LOG_TYPE_DEBUG))
            BTDiscoveryAgentCreate_cold_3();
          return 4;
        }
        else
        {
          v8 = xpc_dictionary_create(0, 0, 0);
          xpc_dictionary_set_uint64(v8, "kCBMsgArgLocalDeviceID", a1);
          xpc_dictionary_set_uint64(v8, "kCBMsgArgID", value);
          v11 = 0;
          v12 = &v11;
          v13 = 0x2000000000;
          v14 = 0;
          v10[0] = MEMORY[0x1E0C809B0];
          v10[1] = 0x40000000;
          v10[2] = __BTLocalDeviceAddCallbacks_block_invoke;
          v10[3] = &unk_1E6B06438;
          v10[4] = &v11;
          sendMessageWithReplySync(MBXpcConnection, "kCBMsgIdLocalDeviceAddCallbacksMsg", v8, (uint64_t)v10);
          if (v8)
            xpc_release(v8);
          if (v12[3])
          {
            _localBTLocalDeviceRemoveCallbacks(a1, a2);
            v7 = *((unsigned int *)v12 + 6);
          }
          else
          {
            v7 = 0;
          }
          _Block_object_dispose(&v11, 8);
        }
      }
      return v7;
    }
  }
  else if (MBXpcConnection)
  {
    goto LABEL_5;
  }
  if (MBFLogInitOnce != -1)
    dispatch_once_f(&MBFLogInitOnce, 0, (dispatch_function_t)MBFLogInit);
  if (os_log_type_enabled((os_log_t)MBFLogComponent, OS_LOG_TYPE_ERROR))
    BTAccessoryManagerRemoveCallbacks_cold_1();
  return 1;
}

BOOL _localBTLocalDeviceCallbacksRegistered(uint64_t a1, _QWORD *a2)
{
  unint64_t v4;
  BOOL v5;
  uint64_t *v6;
  BOOL v7;

  pthread_mutex_lock(&gLock_2);
  v4 = 0;
  v5 = 1;
  v6 = &qword_1ECF8A610;
  do
  {
    if (*(v6 - 1) == a1)
    {
      v7 = *v6 == *a2 && v6[1] == a2[1];
      if (v7 && v6[2] == a2[2])
        break;
    }
    v5 = v4 < 0x3F;
    v6 += 7;
    ++v4;
  }
  while (v4 != 64);
  pthread_mutex_unlock(&gLock_2);
  return v5;
}

uint64_t _localBTLocalDeviceAddCallbacks(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t *a5)
{
  uint64_t v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;

  pthread_mutex_lock(&gLock_2);
  v10 = 0;
  while (1)
  {
    if (!gBTLocalDeviceCallbackList[v10])
    {
      v11 = &gBTLocalDeviceCallbackList[v10];
      if (!gBTLocalDeviceCallbackList[v10 + 5])
        break;
    }
    v10 += 7;
    if (v10 == 448)
    {
      v12 = 4;
      goto LABEL_7;
    }
  }
  v12 = 0;
  v13 = *(_QWORD *)(a3 + 16);
  *(_OWORD *)(v11 + 1) = *(_OWORD *)a3;
  v14 = ++gCBID_2;
  *v11 = a1;
  v11[5] = v14;
  v11[6] = a4;
  v11[3] = v13;
  v11[4] = a2;
  *a5 = v14;
LABEL_7:
  pthread_mutex_unlock(&gLock_2);
  return v12;
}

uint64_t BTServiceAddCallbacks(uint64_t *a1, uint64_t a2, uint64_t a3)
{
  if (MBFLogInitOnce != -1)
    dispatch_once_f(&MBFLogInitOnce, 0, (dispatch_function_t)MBFLogInit);
  if (os_log_type_enabled((os_log_t)MBFLogComponent, OS_LOG_TYPE_DEBUG))
    BTServiceAddCallbacks_cold_1();
  return BTServiceAddCallbacksWithFilter(a1, a2, 0xFFFFFFFF, a3);
}

uint64_t BTServiceAddCallbacksWithFilter(uint64_t *a1, uint64_t a2, unsigned int a3, uint64_t a4)
{
  uint64_t SessionHandle;
  uint64_t MBXpcConnection;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  NSObject *v13;
  xpc_object_t v14;
  _QWORD v16[5];
  _BYTE buf[24];
  uint64_t v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  if (MBFLogInitOnce != -1)
    dispatch_once_f(&MBFLogInitOnce, 0, (dispatch_function_t)MBFLogInit);
  if (os_log_type_enabled((os_log_t)MBFLogComponent, OS_LOG_TYPE_DEBUG))
    BTServiceAddCallbacksWithFilter_cold_5();
  SessionHandle = getSessionHandle(a1);
  if (MBFLogInitOnce != -1)
    dispatch_once_f(&MBFLogInitOnce, 0, (dispatch_function_t)MBFLogInit);
  if (os_log_type_enabled((os_log_t)MBFLogComponent, OS_LOG_TYPE_DEBUG))
    BTServiceAddCallbacksWithFilter_cold_4();
  MBXpcConnection = getMBXpcConnection((uint64_t)a1);
  if (MBXpcConnection)
  {
    v10 = MBXpcConnection;
    v11 = ++gCBID_0;
    addXpcMsgHandler(MBXpcConnection, (uint64_t)&deviceServiceManagerXpcCallbacks);
    if (_localBTDeviceServiceCallbacksRegistered(SessionHandle, a2))
    {
      if (MBFLogInitOnce != -1)
        dispatch_once_f(&MBFLogInitOnce, 0, (dispatch_function_t)MBFLogInit);
      if (os_log_type_enabled((os_log_t)MBFLogComponent, OS_LOG_TYPE_DEBUG))
        BTAccessoryManagerAddCallbacks_cold_2();
      return 0;
    }
    else if (_localBTDeviceServiceAddCallbacks(SessionHandle, v10, a2, a4, v11))
    {
      if (MBFLogInitOnce != -1)
        dispatch_once_f(&MBFLogInitOnce, 0, (dispatch_function_t)MBFLogInit);
      if (os_log_type_enabled((os_log_t)MBFLogComponent, OS_LOG_TYPE_DEBUG))
        BTServiceAddCallbacksWithFilter_cold_3();
      return 4;
    }
    else
    {
      if (MBFLogInitOnce != -1)
        dispatch_once_f(&MBFLogInitOnce, 0, (dispatch_function_t)MBFLogInit);
      v13 = MBFLogComponent;
      if (os_log_type_enabled((os_log_t)MBFLogComponent, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 134218496;
        *(_QWORD *)&buf[4] = a1;
        *(_WORD *)&buf[12] = 2048;
        *(_QWORD *)&buf[14] = SessionHandle;
        *(_WORD *)&buf[22] = 2048;
        v18 = v11;
        _os_log_debug_impl(&dword_1B6BF1000, v13, OS_LOG_TYPE_DEBUG, "BTServiceAddCallbacksWithFilter session :%llx, sessionHandle:%llx, cbid:%llx", buf, 0x20u);
      }
      v14 = xpc_dictionary_create(0, 0, 0);
      xpc_dictionary_set_uint64(v14, "kCBMsgArgSessionID", SessionHandle);
      xpc_dictionary_set_uint64(v14, "kCBMsgArgID", v11);
      xpc_dictionary_set_uint64(v14, "kCBMsgArgServiceMask", a3);
      *(_QWORD *)buf = 0;
      *(_QWORD *)&buf[8] = buf;
      *(_QWORD *)&buf[16] = 0x2000000000;
      v18 = 0;
      v16[0] = MEMORY[0x1E0C809B0];
      v16[1] = 0x40000000;
      v16[2] = __BTServiceAddCallbacksWithFilter_block_invoke;
      v16[3] = &unk_1E6B05DD0;
      v16[4] = buf;
      sendMessageWithReplySync(v10, "kCBMsgIdDeviceServiceAddCallbacksMsg", v14, (uint64_t)v16);
      if (v14)
        xpc_release(v14);
      if (*(_QWORD *)(*(_QWORD *)&buf[8] + 24))
      {
        _localBTDeviceServiceRemoveCallbacks(SessionHandle, a2);
        v12 = *(unsigned int *)(*(_QWORD *)&buf[8] + 24);
      }
      else
      {
        v12 = 0;
      }
      _Block_object_dispose(buf, 8);
    }
  }
  else
  {
    if (MBFLogInitOnce != -1)
      dispatch_once_f(&MBFLogInitOnce, 0, (dispatch_function_t)MBFLogInit);
    if (os_log_type_enabled((os_log_t)MBFLogComponent, OS_LOG_TYPE_ERROR))
      BTDeviceFromAddress_cold_1();
    return 1;
  }
  return v12;
}

uint64_t addXpcMsgHandler(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;
  int v4;
  uint64_t v5;
  BOOL v6;

  v2 = 3;
  if (a1 && a2)
  {
    v3 = 0;
    v4 = -1;
    do
    {
      v5 = *(_QWORD *)(a1 + 8 + 8 * v3);
      if (v5)
        v6 = 0;
      else
        v6 = v4 == -1;
      if (v6)
      {
        v4 = v3;
      }
      else if (v5 == a2)
      {
        return 15;
      }
      ++v3;
    }
    while (v3 != 256);
    if (v4 == -1)
    {
      return 4;
    }
    else
    {
      v2 = 0;
      *(_QWORD *)(a1 + 8 * v4 + 8) = a2;
    }
  }
  return v2;
}

BOOL _localBTDeviceServiceCallbacksRegistered(uint64_t a1, uint64_t a2)
{
  unint64_t v4;
  BOOL v5;
  uint64_t *v6;

  pthread_mutex_lock(&gLock_0);
  v4 = 0;
  v5 = 1;
  v6 = &qword_1ECF8B410;
  do
  {
    if (*v6 == a1 && *(v6 - 1) == a2)
      break;
    v5 = v4 < 0x3F;
    v6 += 5;
    ++v4;
  }
  while (v4 != 64);
  pthread_mutex_unlock(&gLock_0);
  return v5;
}

uint64_t _localBTDeviceServiceAddCallbacks(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v10;
  uint64_t v11;
  uint64_t *v12;

  pthread_mutex_lock(&gLock_0);
  v10 = 0;
  while (gBTDeviceServiceCallbackList[v10 + 1] || gBTDeviceServiceCallbackList[v10 + 3])
  {
    v10 += 5;
    if (v10 == 320)
    {
      v11 = 4;
      goto LABEL_7;
    }
  }
  v11 = 0;
  v12 = &gBTDeviceServiceCallbackList[v10];
  v12[3] = a5;
  v12[4] = a4;
  v12[1] = a1;
  v12[2] = a2;
  *v12 = a3;
LABEL_7:
  pthread_mutex_unlock(&gLock_0);
  return v11;
}

uint64_t BTDeviceAddressFromString(const char *a1, uint64_t a2)
{
  uint64_t FirstSessionHandle;
  uint64_t MBXpcConnection;
  uint64_t v6;
  xpc_object_t v7;
  uint64_t v8;
  _QWORD v10[7];
  _QWORD v11[4];
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t v15;

  FirstSessionHandle = getFirstSessionHandle();
  if (MBFLogInitOnce != -1)
    dispatch_once_f(&MBFLogInitOnce, 0, (dispatch_function_t)MBFLogInit);
  if (os_log_type_enabled((os_log_t)MBFLogComponent, OS_LOG_TYPE_DEBUG))
    BTDeviceAddressFromString_cold_3();
  MBXpcConnection = getMBXpcConnection(FirstSessionHandle);
  if (MBXpcConnection)
  {
    if (a1)
    {
      v6 = MBXpcConnection;
      v7 = xpc_dictionary_create(0, 0, 0);
      xpc_dictionary_set_string(v7, "kCBMsgArgAddressString", a1);
      v12 = 0;
      v13 = &v12;
      v14 = 0x2000000000;
      v15 = 0;
      v11[0] = 0;
      v11[1] = v11;
      v11[2] = 0x2000000000;
      v11[3] = 0;
      v10[0] = MEMORY[0x1E0C809B0];
      v10[1] = 0x40000000;
      v10[2] = __BTDeviceAddressFromString_block_invoke;
      v10[3] = &unk_1E6B05A88;
      v10[4] = &v12;
      v10[5] = v11;
      v10[6] = a2;
      sendMessageWithReplySync(v6, "kCBMsgIdDeviceAddressFromStringMsg", v7, (uint64_t)v10);
      if (v7)
        xpc_release(v7);
      v8 = *((unsigned int *)v13 + 6);
      _Block_object_dispose(v11, 8);
      _Block_object_dispose(&v12, 8);
    }
    else
    {
      if (MBFLogInitOnce != -1)
        dispatch_once_f(&MBFLogInitOnce, 0, (dispatch_function_t)MBFLogInit);
      if (os_log_type_enabled((os_log_t)MBFLogComponent, OS_LOG_TYPE_ERROR))
        BTDeviceAddressFromString_cold_2();
      return 3;
    }
  }
  else
  {
    if (MBFLogInitOnce != -1)
      dispatch_once_f(&MBFLogInitOnce, 0, (dispatch_function_t)MBFLogInit);
    if (os_log_type_enabled((os_log_t)MBFLogComponent, OS_LOG_TYPE_ERROR))
      BTDeviceAddressToString_cold_1();
    return 1;
  }
  return v8;
}

uint64_t getFirstSessionHandle()
{
  uint64_t v0;
  uint64_t *v1;
  uint64_t v2;

  pthread_mutex_lock(&gLock_4);
  v0 = 0;
  while (1)
  {
    v1 = (uint64_t *)gFWSessionList[v0];
    if (v1)
      break;
    if (++v0 == 100)
    {
      v2 = 0;
      goto LABEL_6;
    }
  }
  v2 = *v1;
LABEL_6:
  pthread_mutex_unlock(&gLock_4);
  return v2;
}

uint64_t BTSessionAttachWithQueue(const char *a1, _QWORD *a2, uint64_t a3, NSObject *a4)
{
  uint64_t result;
  const __CFDictionary *v9;
  mach_port_t *v10;
  io_service_t MatchingService;
  const __CFDictionary *v12;
  _DWORD *v13;
  NSObject *v14;
  double v15;
  int64_t v16;
  NSObject *v17;
  dispatch_time_t v18;
  NSObject *v19;
  int v20;
  int64_t v21;
  __int16 v22;
  uint64_t v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  result = 3;
  if (a1 && a2)
  {
    if (MGGetBoolAnswer()
      && (MGGetBoolAnswer() & 1) == 0
      && ((v9 = IOServiceNameMatching("marconi-bt"), v10 = (mach_port_t *)MEMORY[0x1E0CBBAA8], v9)
       && (MatchingService = IOServiceGetMatchingService(*MEMORY[0x1E0CBBAA8], v9)) != 0
       || (v12 = IOServiceNameMatching("bluetooth")) != 0
       && (MatchingService = IOServiceGetMatchingService(*v10, v12)) != 0))
    {
      IOObjectRelease(MatchingService);
      v13 = malloc_type_malloc(0x60uLL, 0x10B00402E9C0308uLL);
      *(_QWORD *)v13 = 0;
      v13[21] = 0;
      *((_QWORD *)v13 + 1) = strdup(a1);
      *((_QWORD *)v13 + 2) = *a2;
      *((_QWORD *)v13 + 3) = a3;
      if (a4)
        v14 = a4;
      else
        v14 = MEMORY[0x1E0C80D38];
      *((_QWORD *)v13 + 4) = v14;
      dispatch_retain(v14);
      *((_QWORD *)v13 + 5) = 0;
      v13[12] = 0;
      *((_QWORD *)v13 + 8) = 0;
      *((_QWORD *)v13 + 9) = 0;
      *((_QWORD *)v13 + 7) = 0;
      if (gSessionAttachTries)
      {
        v15 = exp2((double)(unint64_t)gSessionAttachTries) * 100.0 * 1000000.0;
        if ((uint64_t)v15 >= 10000000000)
          v16 = 10000000000;
        else
          v16 = (uint64_t)v15;
      }
      else
      {
        v16 = 0;
      }
      if (MBFLogInitOnce != -1)
        dispatch_once_f(&MBFLogInitOnce, 0, (dispatch_function_t)MBFLogInit);
      v17 = MBFLogComponent;
      if (os_log_type_enabled((os_log_t)MBFLogComponent, OS_LOG_TYPE_DEFAULT))
      {
        v20 = 134218240;
        v21 = v16;
        v22 = 2048;
        v23 = gSessionAttachTries;
        _os_log_impl(&dword_1B6BF1000, v17, OS_LOG_TYPE_DEFAULT, "Delaying BTSessionAttach by %lldmS. Connection attempt:%llu", (uint8_t *)&v20, 0x16u);
      }
      v18 = dispatch_time(0, v16);
      v19 = _MBTGetAsyncAttachQueue((uint64_t)v13);
      dispatch_after_f(v18, v19, v13, (dispatch_function_t)_MBTAsyncAttach);
      return 0;
    }
    else
    {
      return 9;
    }
  }
  return result;
}

dispatch_queue_global_t _MBTGetAsyncAttachQueue(uint64_t a1)
{
  if (MBFLogInitOnce != -1)
    dispatch_once_f(&MBFLogInitOnce, 0, (dispatch_function_t)MBFLogInit);
  if (os_log_type_enabled((os_log_t)MBFLogComponent, OS_LOG_TYPE_DEBUG))
    _MBTGetAsyncAttachQueue_cold_3();
  if (*(_QWORD *)(a1 + 32) == MEMORY[0x1E0C80D38])
  {
    if (MBFLogInitOnce != -1)
      dispatch_once_f(&MBFLogInitOnce, 0, (dispatch_function_t)MBFLogInit);
    if (os_log_type_enabled((os_log_t)MBFLogComponent, OS_LOG_TYPE_DEBUG))
      _MBTGetAsyncAttachQueue_cold_1();
    return dispatch_get_global_queue(25, 0);
  }
  else
  {
    if (MBFLogInitOnce != -1)
      dispatch_once_f(&MBFLogInitOnce, 0, (dispatch_function_t)MBFLogInit);
    if (os_log_type_enabled((os_log_t)MBFLogComponent, OS_LOG_TYPE_DEBUG))
      _MBTGetAsyncAttachQueue_cold_2();
    return *(dispatch_queue_global_t *)(a1 + 32);
  }
}

uint64_t createXpcConnection(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t *a6)
{
  _QWORD *v10;
  uint64_t v11;
  NSObject *v12;
  const char *v13;
  NSObject *v14;
  const char *label;
  NSObject *v16;
  dispatch_qos_class_t qos_class;
  NSObject *v18;
  NSObject *v19;
  NSObject *v20;
  _xpc_connection_s *v21;
  NSObject *v22;
  _QWORD handler[5];
  int relative_priority_ptr;
  const char *v26;
  __int16 v27;
  uint64_t v28;
  __int16 v29;
  NSObject *v30;
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  if (MGGetBoolAnswer())
  {
    v10 = malloc_type_calloc(1uLL, 0xA30uLL, 0x10A0040595E20BAuLL);
    v11 = (uint64_t)v10;
    if (a2)
      v12 = a2;
    else
      v12 = MEMORY[0x1E0C80D38];
    *v10 = a1;
    v10[325] = a5;
    v13 = (const char *)(v10 + 292);
    __strlcpy_chk();
    __strlcpy_chk();
    if (MBFLogInitOnce != -1)
      dispatch_once_f(&MBFLogInitOnce, 0, (dispatch_function_t)MBFLogInit);
    v14 = MBFLogComponent;
    if (os_log_type_enabled((os_log_t)MBFLogComponent, OS_LOG_TYPE_DEBUG))
    {
      relative_priority_ptr = 136315650;
      v26 = v13;
      v27 = 2080;
      v28 = v11 + 2080;
      v29 = 2048;
      v30 = a2;
      _os_log_debug_impl(&dword_1B6BF1000, v14, OS_LOG_TYPE_DEBUG, "createXpcConnection %s %s queue:%p", (uint8_t *)&relative_priority_ptr, 0x20u);
    }
    label = dispatch_queue_get_label(v12);
    v16 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    *(_QWORD *)(v11 + 2056) = dispatch_queue_create_with_target_V2(label, v16, v12);
    relative_priority_ptr = 0;
    qos_class = dispatch_queue_get_qos_class(v12, &relative_priority_ptr);
    v18 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v19 = dispatch_queue_attr_make_with_qos_class(v18, qos_class, relative_priority_ptr);
    v20 = dispatch_queue_create((const char *)(v11 + 2080), v19);
    *(_QWORD *)(v11 + 2064) = v20;
    *(_QWORD *)(v11 + 2072) = xpc_connection_create_mach_service(v13, v20, 0);
    if (MBFLogInitOnce != -1)
      dispatch_once_f(&MBFLogInitOnce, 0, (dispatch_function_t)MBFLogInit);
    if (os_log_type_enabled((os_log_t)MBFLogComponent, OS_LOG_TYPE_DEBUG))
      createXpcConnection_cold_1();
    v21 = *(_xpc_connection_s **)(v11 + 2072);
    handler[0] = MEMORY[0x1E0C809B0];
    handler[1] = 0x40000000;
    handler[2] = __createXpcConnection_block_invoke;
    handler[3] = &__block_descriptor_tmp_15;
    handler[4] = v11;
    xpc_connection_set_event_handler(v21, handler);
    xpc_connection_set_context(*(xpc_connection_t *)(v11 + 2072), (void *)v11);
    xpc_connection_set_finalizer_f(*(xpc_connection_t *)(v11 + 2072), (xpc_finalizer_t)releaseMBXpcConnection);
    xpc_connection_activate(*(xpc_connection_t *)(v11 + 2072));
    *a6 = attachSession(v11);
  }
  else
  {
    if (MBFLogInitOnce != -1)
      dispatch_once_f(&MBFLogInitOnce, 0, (dispatch_function_t)MBFLogInit);
    v22 = MBFLogComponent;
    if (os_log_type_enabled((os_log_t)MBFLogComponent, OS_LOG_TYPE_DEBUG))
      createXpcConnection_cold_2(v22);
    return 0;
  }
  return v11;
}

uint64_t getSessionHandle(uint64_t *a1)
{
  uint64_t v2;
  uint64_t *v3;
  uint64_t v4;

  pthread_mutex_lock(&gLock_4);
  v2 = 0;
  while (1)
  {
    v3 = (uint64_t *)gFWSessionList[v2];
    if (v3)
    {
      v4 = *v3;
      if (v3 == a1 || v4 == (a1 & 0xFFFF0000))
        break;
    }
    if (++v2 == 100)
    {
      v4 = 0;
      break;
    }
  }
  pthread_mutex_unlock(&gLock_4);
  return v4;
}

uint64_t BTLocalDeviceGetModulePower(uint64_t a1, unsigned int a2, _DWORD *a3)
{
  uint64_t MBXpcConnection;
  uint64_t v7;
  xpc_object_t v8;
  uint64_t v9;
  _QWORD v11[6];
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t *v17;
  uint64_t v18;
  uint64_t v19;

  if (MBFLogInitOnce != -1)
    dispatch_once_f(&MBFLogInitOnce, 0, (dispatch_function_t)MBFLogInit);
  if (os_log_type_enabled((os_log_t)MBFLogComponent, OS_LOG_TYPE_DEBUG))
    BTLocalDeviceGetModulePower_cold_2();
  MBXpcConnection = getMBXpcConnection(a1);
  if (MBXpcConnection)
  {
    v7 = MBXpcConnection;
    v8 = xpc_dictionary_create(0, 0, 0);
    xpc_dictionary_set_uint64(v8, "kCBMsgArgLocalDeviceID", a1);
    xpc_dictionary_set_uint64(v8, "kCBMsgArgBTPowerModule", a2);
    v16 = 0;
    v17 = &v16;
    v18 = 0x2000000000;
    v19 = 0;
    v12 = 0;
    v13 = &v12;
    v14 = 0x2000000000;
    v15 = 0;
    v11[0] = MEMORY[0x1E0C809B0];
    v11[1] = 0x40000000;
    v11[2] = __BTLocalDeviceGetModulePower_block_invoke;
    v11[3] = &unk_1E6B064D8;
    v11[4] = &v16;
    v11[5] = &v12;
    sendMessageWithReplySync(v7, "kCBMsgIdLocalDeviceGetModulePowerMsg", v8, (uint64_t)v11);
    if (v8)
      xpc_release(v8);
    v9 = *((unsigned int *)v17 + 6);
    if (!*((_DWORD *)v17 + 6))
      *a3 = v13[3];
    _Block_object_dispose(&v12, 8);
    _Block_object_dispose(&v16, 8);
  }
  else
  {
    if (MBFLogInitOnce != -1)
      dispatch_once_f(&MBFLogInitOnce, 0, (dispatch_function_t)MBFLogInit);
    if (os_log_type_enabled((os_log_t)MBFLogComponent, OS_LOG_TYPE_ERROR))
      BTAccessoryManagerRemoveCallbacks_cold_1();
    return 1;
  }
  return v9;
}

uint64_t getMBXpcConnection(uint64_t a1)
{
  uint64_t FWSessionByHandle;
  uint64_t result;

  FWSessionByHandle = (uint64_t)getFWSessionByHandle(a1);
  if (FWSessionByHandle)
  {
    if (a1)
      goto LABEL_3;
  }
  else
  {
    FWSessionByHandle = getFWSessionByUint64(a1);
    if (a1)
    {
LABEL_3:
      if (!FWSessionByHandle)
        return 0;
LABEL_7:
      result = *(_QWORD *)(FWSessionByHandle + 88);
      if (result)
        return result;
      return 0;
    }
  }
  FWSessionByHandle = getFirstFWSession();
  if (FWSessionByHandle)
    goto LABEL_7;
  return 0;
}

_QWORD *getFWSessionByHandle(int a1)
{
  uint64_t v2;
  uint64_t v3;
  _QWORD *v4;

  pthread_mutex_lock(&gLock_4);
  v2 = 0;
  v3 = a1 & 0xFFFF0000;
  while (1)
  {
    v4 = (_QWORD *)gFWSessionList[v2];
    if (v4)
    {
      if (*v4 == v3)
        break;
    }
    if (++v2 == 100)
    {
      v4 = 0;
      break;
    }
  }
  pthread_mutex_unlock(&gLock_4);
  return v4;
}

void sendMessageWithReplySync(uint64_t a1, const char *a2, void *a3, uint64_t a4)
{
  xpc_object_t v8;
  xpc_object_t v9;
  xpc_object_t v10;
  xpc_object_t object[2];
  char *keys[2];
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  if (MBFLogInitOnce != -1)
    dispatch_once_f(&MBFLogInitOnce, 0, (dispatch_function_t)MBFLogInit);
  if (os_log_type_enabled((os_log_t)MBFLogComponent, OS_LOG_TYPE_DEBUG))
    sendMessageWithReplySync_cold_2();
  *(_OWORD *)keys = xmmword_1E6B05A48;
  object[0] = xpc_string_create(a2);
  object[1] = a3;
  v8 = xpc_dictionary_create((const char *const *)keys, object, 2uLL);
  v9 = xpc_connection_send_message_with_reply_sync(*(xpc_connection_t *)(a1 + 2072), v8);
  v10 = v9;
  if (v9 && MEMORY[0x1BCC9F4AC](v9) == MEMORY[0x1E0C81310])
  {
    xpc_dictionary_get_string(v10, (const char *)*MEMORY[0x1E0C81270]);
    if (MBFLogInitOnce != -1)
      dispatch_once_f(&MBFLogInitOnce, 0, (dispatch_function_t)MBFLogInit);
    if (os_log_type_enabled((os_log_t)MBFLogComponent, OS_LOG_TYPE_DEBUG))
      sendMessageWithReplySync_cold_1();
    xpc_release(v10);
    v10 = xpc_dictionary_create(0, 0, 0);
    xpc_dictionary_set_uint64(v10, "kCBMsgArgResult", 0x515uLL);
  }
  (*(void (**)(uint64_t, xpc_object_t))(a4 + 16))(a4, v10);
  xpc_release(v10);
  xpc_release(v8);
  xpc_release(object[0]);
}

uint64_t getFWSessionByUint64(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;

  pthread_mutex_lock(&gLock_4);
  v2 = 0;
  while (1)
  {
    v3 = gFWSessionList[v2];
    if (v3 && v3 == a1)
      break;
    if (++v2 == 100)
    {
      a1 = 0;
      break;
    }
  }
  pthread_mutex_unlock(&gLock_4);
  return a1;
}

uint64_t attachSession(uint64_t a1)
{
  xpc_object_t v2;
  uint64_t v3;
  _QWORD v5[6];
  _QWORD v6[4];
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  uint64_t v10;

  if (MBFLogInitOnce != -1)
    dispatch_once_f(&MBFLogInitOnce, 0, (dispatch_function_t)MBFLogInit);
  if (os_log_type_enabled((os_log_t)MBFLogComponent, OS_LOG_TYPE_DEBUG))
    attachSession_cold_2();
  v2 = xpc_dictionary_create(0, 0, 0);
  xpc_dictionary_set_string(v2, "kCBMsgArgName", (const char *)(a1 + 2080));
  v7 = 0;
  v8 = &v7;
  v9 = 0x2000000000;
  v10 = 0;
  v6[0] = 0;
  v6[1] = v6;
  v6[2] = 0x2000000000;
  v6[3] = 0;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 0x40000000;
  v5[2] = __attachSession_block_invoke;
  v5[3] = &unk_1E6B059A0;
  v5[4] = v6;
  v5[5] = &v7;
  sendMessageWithReplySync(a1, "kCBMsgIdSessionAttach", v2, (uint64_t)v5);
  if (MBFLogInitOnce != -1)
    dispatch_once_f(&MBFLogInitOnce, 0, (dispatch_function_t)MBFLogInit);
  if (os_log_type_enabled((os_log_t)MBFLogComponent, OS_LOG_TYPE_DEBUG))
  {
    attachSession_cold_1();
    if (!v2)
      goto LABEL_10;
    goto LABEL_9;
  }
  if (v2)
LABEL_9:
    xpc_release(v2);
LABEL_10:
  v3 = v8[3];
  _Block_object_dispose(v6, 8);
  _Block_object_dispose(&v7, 8);
  return v3;
}

uint64_t __attachSession_block_invoke(uint64_t a1, xpc_object_t xdict)
{
  uint64_t result;

  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = xpc_dictionary_get_uint64(xdict, "kCBMsgArgResult");
  result = xpc_dictionary_get_uint64(xdict, "kCBMsgArgSessionID");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = result;
  return result;
}

os_log_t MBFLogInit()
{
  os_log_t result;

  result = os_log_create("com.apple.bluetooth", "MobileBluetoothFramework");
  MBFLogComponent = (uint64_t)result;
  return result;
}

uint64_t _MBTSignalSessionEvent(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;

  if ((_DWORD)a3)
    v6 = 0;
  else
    v6 = a1;
  if (MBFLogInitOnce != -1)
    dispatch_once_f(&MBFLogInitOnce, 0, (dispatch_function_t)MBFLogInit);
  if (os_log_type_enabled((os_log_t)MBFLogComponent, OS_LOG_TYPE_DEBUG))
    _MBTSignalSessionEvent_cold_1();
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, _QWORD))(a1 + 16))(v6, a2, a3, *(_QWORD *)(a1 + 24));
}

uint64_t BTLocalDeviceReadEnhancedPowerProfileStatistics(uint64_t a1, unsigned int a2, uint64_t a3)
{
  uint64_t MBXpcConnection;
  xpc_object_t v7;
  uint64_t v8;
  _QWORD v10[6];
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  uint64_t v14;

  MBXpcConnection = getMBXpcConnection(a1);
  if (MBFLogInitOnce != -1)
    dispatch_once_f(&MBFLogInitOnce, 0, (dispatch_function_t)MBFLogInit);
  if (os_log_type_enabled((os_log_t)MBFLogComponent, OS_LOG_TYPE_DEBUG))
  {
    BTLocalDeviceReadEnhancedPowerProfileStatistics_cold_2();
    if (MBXpcConnection)
      goto LABEL_5;
  }
  else if (MBXpcConnection)
  {
LABEL_5:
    v7 = xpc_dictionary_create(0, 0, 0);
    xpc_dictionary_set_uint64(v7, "kCBMsgArgLocalDeviceID", a1);
    xpc_dictionary_set_uint64(v7, "kCBMsgArgReset", a2);
    v11 = 0;
    v12 = &v11;
    v13 = 0x2000000000;
    v14 = 0;
    v10[0] = MEMORY[0x1E0C809B0];
    v10[1] = 0x40000000;
    v10[2] = __BTLocalDeviceReadEnhancedPowerProfileStatistics_block_invoke;
    v10[3] = &unk_1E6B069B0;
    v10[4] = &v11;
    v10[5] = a3;
    sendMessageWithReplySync(MBXpcConnection, "kCBMsgIdLocalDeviceReadEnhancedPowerProfileStatisticsMsg", v7, (uint64_t)v10);
    if (v7)
      xpc_release(v7);
    v8 = *((unsigned int *)v12 + 6);
    _Block_object_dispose(&v11, 8);
    return v8;
  }
  if (MBFLogInitOnce != -1)
    dispatch_once_f(&MBFLogInitOnce, 0, (dispatch_function_t)MBFLogInit);
  if (os_log_type_enabled((os_log_t)MBFLogComponent, OS_LOG_TYPE_ERROR))
    BTAccessoryManagerGetDevices_cold_1();
  return 1;
}

BOOL _localBTAccessoryManagerCustomCallbacksRegistered(uint64_t a1, _QWORD *a2, int a3)
{
  unint64_t v6;
  BOOL v7;
  uint64_t *v8;

  pthread_mutex_lock(&gLock);
  v6 = 0;
  v7 = 1;
  v8 = &gBTAccessoryManagerCustomCallbackList;
  do
  {
    if (v8[1] == a1 && *v8 == *a2 && *((_DWORD *)v8 + 4) == a3)
      break;
    v7 = v6 < 0x3F;
    v8 += 6;
    ++v6;
  }
  while (v6 != 64);
  pthread_mutex_unlock(&gLock);
  return v7;
}

uint64_t _localBTAccessoryManagerAddCustomCallbacks(uint64_t a1, uint64_t a2, _QWORD *a3, int a4, uint64_t a5, uint64_t *a6)
{
  uint64_t v12;
  _QWORD *v13;
  uint64_t v14;
  uint64_t v15;
  NSObject *v16;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  _DWORD v21[2];
  __int16 v22;
  uint64_t v23;
  __int16 v24;
  uint64_t v25;
  __int16 v26;
  uint64_t v27;
  __int16 v28;
  int v29;
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  pthread_mutex_lock(&gLock);
  v12 = 0;
  v13 = &unk_1ECF88A30;
  while (*(v13 - 4) || *(v13 - 1))
  {
    ++v12;
    v13 += 6;
    if (v12 == 64)
    {
      v14 = 4;
      goto LABEL_11;
    }
  }
  *((_DWORD *)v13 - 6) = a4;
  v15 = ++gCBID;
  *(v13 - 1) = gCBID;
  *v13 = a5;
  *(v13 - 4) = a1;
  *(v13 - 5) = *a3;
  *(v13 - 2) = a2;
  *a6 = v15;
  if (MBFLogInitOnce != -1)
    dispatch_once_f(&MBFLogInitOnce, 0, (dispatch_function_t)MBFLogInit);
  v16 = MBFLogComponent;
  if (os_log_type_enabled((os_log_t)MBFLogComponent, OS_LOG_TYPE_DEBUG))
  {
    v18 = *(v13 - 4);
    v19 = *(v13 - 1);
    v20 = *v13;
    v21[0] = 67110144;
    v21[1] = v12;
    v22 = 2048;
    v23 = v18;
    v24 = 2048;
    v25 = v19;
    v26 = 2048;
    v27 = v20;
    v28 = 1024;
    v29 = a4;
    _os_log_debug_impl(&dword_1B6BF1000, v16, OS_LOG_TYPE_DEBUG, "_localBTAccessoryManagerAddCustomCallbacks[%d] manager:%p cbid:%llx userData:%p clientType:0x%X", (uint8_t *)v21, 0x2Cu);
  }
  v14 = 0;
LABEL_11:
  pthread_mutex_unlock(&gLock);
  return v14;
}

uint64_t _localBTAccessoryManagerRemoveCallbacks(uint64_t a1, _QWORD *a2)
{
  uint64_t v4;
  __int128 *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  BOOL v10;
  BOOL v11;
  __int128 *v13;

  pthread_mutex_lock(&gLock);
  v4 = 0;
  while (1)
  {
    v5 = &gBTAccessoryManagerCallbackList[v4];
    if (*(_QWORD *)&gBTAccessoryManagerCallbackList[v4 + 2] == a1)
    {
      v6 = *(_QWORD *)v5;
      v7 = *((_QWORD *)v5 + 1);
      v9 = *((_QWORD *)v5 + 2);
      v8 = *((_QWORD *)v5 + 3);
      v10 = v6 == *a2 && v7 == a2[1];
      v11 = v10 && v9 == a2[2];
      if (v11 && v8 == a2[3])
        break;
    }
    v4 += 4;
    if (v4 == 256)
      goto LABEL_16;
  }
  v13 = &gBTAccessoryManagerCallbackList[v4];
  v13[2] = 0u;
  v13[3] = 0u;
  *v13 = 0u;
  v13[1] = 0u;
LABEL_16:
  pthread_mutex_unlock(&gLock);
  return 0;
}

uint64_t _localBTAccessoryManagerRemoveAllCallbacksByXpcConnection(uint64_t a1)
{
  uint64_t i;
  __int128 *v3;
  uint64_t j;
  uint64_t *v5;

  pthread_mutex_lock(&gLock);
  for (i = 0; i != 256; i += 4)
  {
    v3 = &gBTAccessoryManagerCallbackList[i];
    if (*((_QWORD *)&gBTAccessoryManagerCallbackList[i + 2] + 1) == a1)
    {
      v3[2] = 0uLL;
      v3[3] = 0uLL;
      *v3 = 0uLL;
      v3[1] = 0uLL;
    }
  }
  for (j = 0; j != 384; j += 6)
  {
    v5 = &gBTAccessoryManagerCustomCallbackList[j];
    if (gBTAccessoryManagerCustomCallbackList[j + 3] == a1)
    {
      *((_OWORD *)v5 + 1) = 0uLL;
      *((_OWORD *)v5 + 2) = 0uLL;
      *(_OWORD *)v5 = 0uLL;
    }
  }
  pthread_mutex_unlock(&gLock);
  return 0;
}

uint64_t _localBTAccessoryManagerRemoveCustomCallbacks(uint64_t a1, _QWORD *a2)
{
  uint64_t v4;
  uint64_t *v5;

  pthread_mutex_lock(&gLock);
  v4 = 0;
  while (gBTAccessoryManagerCustomCallbackList[v4 + 1] != a1 || gBTAccessoryManagerCustomCallbackList[v4] != *a2)
  {
    v4 += 6;
    if (v4 == 384)
      goto LABEL_7;
  }
  v5 = &gBTAccessoryManagerCustomCallbackList[v4];
  *((_OWORD *)v5 + 1) = 0u;
  *((_OWORD *)v5 + 2) = 0u;
  *(_OWORD *)v5 = 0u;
LABEL_7:
  pthread_mutex_unlock(&gLock);
  return 0;
}

uint64_t _localBTAccessoryManagerGetCallbacksCBID(uint64_t a1, _QWORD *a2)
{
  uint64_t v4;
  __int128 *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  BOOL v10;
  BOOL v11;
  uint64_t v13;

  pthread_mutex_lock(&gLock);
  v4 = 0;
  while (1)
  {
    v5 = &gBTAccessoryManagerCallbackList[v4];
    if (*(_QWORD *)&gBTAccessoryManagerCallbackList[v4 + 2] == a1)
    {
      v6 = *(_QWORD *)v5;
      v7 = *((_QWORD *)v5 + 1);
      v9 = *((_QWORD *)v5 + 2);
      v8 = *((_QWORD *)v5 + 3);
      v10 = v6 == *a2 && v7 == a2[1];
      v11 = v10 && v9 == a2[2];
      if (v11 && v8 == a2[3])
        break;
    }
    v4 += 4;
    if (v4 == 256)
    {
      v13 = 0;
      goto LABEL_16;
    }
  }
  v13 = *(_QWORD *)&gBTAccessoryManagerCallbackList[v4 + 3];
LABEL_16:
  pthread_mutex_unlock(&gLock);
  return v13;
}

uint64_t _localBTAccessoryManagerGetCustomCallbacksCBID(uint64_t a1, _QWORD *a2)
{
  uint64_t v4;
  uint64_t *v5;
  uint64_t v6;

  pthread_mutex_lock(&gLock);
  v4 = 0;
  v5 = gBTAccessoryManagerCustomCallbackList;
  while (v5[1] != a1 || *v5 != *a2)
  {
    v4 += 4;
    v5 += 6;
    if (v4 == 256)
    {
      v6 = 0;
      goto LABEL_7;
    }
  }
  v6 = *(_QWORD *)&gBTAccessoryManagerCallbackList[v4 + 3];
LABEL_7:
  pthread_mutex_unlock(&gLock);
  return v6;
}

__int128 *_localBTAccessoryManagerGetCallbacks(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  __int128 *v5;

  pthread_mutex_lock(&gLock);
  v4 = 0;
  while (*(_QWORD *)&gBTAccessoryManagerCallbackList[v4 + 2] != a1
       || *(_QWORD *)&gBTAccessoryManagerCallbackList[v4 + 3] != a2)
  {
    v4 += 4;
    if (v4 == 256)
    {
      v5 = 0;
      goto LABEL_7;
    }
  }
  v5 = &gBTAccessoryManagerCallbackList[v4];
LABEL_7:
  pthread_mutex_unlock(&gLock);
  return v5;
}

uint64_t *_localBTAccessoryManagerGetCustomCallbacks(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t *v5;

  pthread_mutex_lock(&gLock);
  v4 = 0;
  while (gBTAccessoryManagerCustomCallbackList[v4 + 1] != a1 || gBTAccessoryManagerCustomCallbackList[v4 + 4] != a2)
  {
    v4 += 6;
    if (v4 == 384)
    {
      v5 = 0;
      goto LABEL_7;
    }
  }
  v5 = &gBTAccessoryManagerCustomCallbackList[v4];
LABEL_7:
  pthread_mutex_unlock(&gLock);
  return v5;
}

uint64_t _localBTAccessoryManagerGetCustomCallbackMsgType(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;

  pthread_mutex_lock(&gLock);
  v4 = 0;
  while (gBTAccessoryManagerCustomCallbackList[v4 + 1] != a1 || gBTAccessoryManagerCustomCallbackList[v4 + 4] != a2)
  {
    v4 += 6;
    if (v4 == 384)
    {
      v5 = 0;
      goto LABEL_7;
    }
  }
  v5 = LODWORD(gBTAccessoryManagerCustomCallbackList[v4 + 2]);
LABEL_7:
  pthread_mutex_unlock(&gLock);
  return v5;
}

uint64_t _localBTAccessoryManagerGetUserData(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  pthread_mutex_lock(&gLock);
  v4 = 0;
  while (*(_QWORD *)&gBTAccessoryManagerCallbackList[v4 + 2] != a1
       || *(_QWORD *)&gBTAccessoryManagerCallbackList[v4 + 3] != a2)
  {
    v4 += 4;
    if (v4 == 256)
      goto LABEL_5;
  }
  v6 = *((_QWORD *)&gBTAccessoryManagerCallbackList[v4 + 3] + 1);
  if (v6)
    goto LABEL_13;
LABEL_5:
  v5 = 0;
  while (gBTAccessoryManagerCustomCallbackList[v5 + 1] != a1 || gBTAccessoryManagerCustomCallbackList[v5 + 4] != a2)
  {
    v5 += 6;
    if (v5 == 384)
    {
      v6 = 0;
      goto LABEL_13;
    }
  }
  v6 = gBTAccessoryManagerCustomCallbackList[v5 + 5];
LABEL_13:
  pthread_mutex_unlock(&gLock);
  return v6;
}

uint64_t BTAccessoryManagerRemoveCallbacks(uint64_t a1, _QWORD *a2)
{
  uint64_t MBXpcConnection;
  uint64_t CallbacksCBID;
  uint64_t v6;
  xpc_object_t v7;
  uint64_t v8;
  _QWORD v10[5];
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  uint64_t v14;

  MBXpcConnection = getMBXpcConnection(a1);
  if (MBFLogInitOnce != -1)
    dispatch_once_f(&MBFLogInitOnce, 0, (dispatch_function_t)MBFLogInit);
  if (os_log_type_enabled((os_log_t)MBFLogComponent, OS_LOG_TYPE_DEBUG))
  {
    BTAccessoryManagerRemoveCallbacks_cold_2();
    if (MBXpcConnection)
    {
LABEL_5:
      CallbacksCBID = _localBTAccessoryManagerGetCallbacksCBID(a1, a2);
      v11 = 0;
      v12 = &v11;
      v13 = 0x2000000000;
      v14 = 3;
      if (CallbacksCBID)
      {
        v6 = CallbacksCBID;
        _localBTAccessoryManagerRemoveCallbacks(a1, a2);
        v7 = xpc_dictionary_create(0, 0, 0);
        xpc_dictionary_set_uint64(v7, "kCBMsgArgAccessoryManagerID", a1);
        xpc_dictionary_set_uint64(v7, "kCBMsgArgID", v6);
        v10[0] = MEMORY[0x1E0C809B0];
        v10[1] = 0x40000000;
        v10[2] = __BTAccessoryManagerRemoveCallbacks_block_invoke;
        v10[3] = &unk_1E6B04DE8;
        v10[4] = &v11;
        sendMessageWithReplySync(MBXpcConnection, "kCBMsgIdAccessoryRemoveCallbacksMsg", v7, (uint64_t)v10);
        if (v7)
          xpc_release(v7);
      }
      v8 = *((unsigned int *)v12 + 6);
      _Block_object_dispose(&v11, 8);
      return v8;
    }
  }
  else if (MBXpcConnection)
  {
    goto LABEL_5;
  }
  if (MBFLogInitOnce != -1)
    dispatch_once_f(&MBFLogInitOnce, 0, (dispatch_function_t)MBFLogInit);
  if (os_log_type_enabled((os_log_t)MBFLogComponent, OS_LOG_TYPE_ERROR))
    BTAccessoryManagerRemoveCallbacks_cold_1();
  return 1;
}

uint64_t BTAccessoryManagerRegisterDevice(uint64_t a1, const void *a2, const char *a3, unsigned int a4, const char *a5, _QWORD *a6)
{
  uint64_t MBXpcConnection;
  uint64_t v13;
  xpc_object_t v14;
  uint64_t v15;
  _QWORD v17[6];
  uint64_t v18;
  uint64_t *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t *v23;
  uint64_t v24;
  uint64_t v25;

  if (MBFLogInitOnce != -1)
    dispatch_once_f(&MBFLogInitOnce, 0, (dispatch_function_t)MBFLogInit);
  if (os_log_type_enabled((os_log_t)MBFLogComponent, OS_LOG_TYPE_DEBUG))
    BTAccessoryManagerRegisterDevice_cold_3();
  MBXpcConnection = getMBXpcConnection(a1);
  if (MBXpcConnection)
  {
    if (a3 && a5)
    {
      v13 = MBXpcConnection;
      v14 = xpc_dictionary_create(0, 0, 0);
      xpc_dictionary_set_uint64(v14, "kCBMsgArgAccessoryManagerID", a1);
      xpc_dictionary_set_data(v14, "kCBMsgArgAddressBytes", a2, 6uLL);
      xpc_dictionary_set_string(v14, "kCBMsgArgName", a3);
      xpc_dictionary_set_uint64(v14, "kCBMsgArgClassOfDevice", a4);
      xpc_dictionary_set_string(v14, "kCBMsgArgPincode", a5);
      v22 = 0;
      v23 = &v22;
      v24 = 0x2000000000;
      v25 = 0;
      v18 = 0;
      v19 = &v18;
      v20 = 0x2000000000;
      v21 = 0;
      v17[0] = MEMORY[0x1E0C809B0];
      v17[1] = 0x40000000;
      v17[2] = __BTAccessoryManagerRegisterDevice_block_invoke;
      v17[3] = &unk_1E6B04E10;
      v17[4] = &v22;
      v17[5] = &v18;
      sendMessageWithReplySync(v13, "kCBMsgIdAccessoryRegisterDeviceMsg", v14, (uint64_t)v17);
      *a6 = v19[3];
      if (v14)
        xpc_release(v14);
      v15 = *((unsigned int *)v23 + 6);
      _Block_object_dispose(&v18, 8);
      _Block_object_dispose(&v22, 8);
    }
    else
    {
      if (MBFLogInitOnce != -1)
        dispatch_once_f(&MBFLogInitOnce, 0, (dispatch_function_t)MBFLogInit);
      if (os_log_type_enabled((os_log_t)MBFLogComponent, OS_LOG_TYPE_ERROR))
        BTAccessoryManagerRegisterDevice_cold_2();
      return 3;
    }
  }
  else
  {
    if (MBFLogInitOnce != -1)
      dispatch_once_f(&MBFLogInitOnce, 0, (dispatch_function_t)MBFLogInit);
    if (os_log_type_enabled((os_log_t)MBFLogComponent, OS_LOG_TYPE_ERROR))
      BTAccessoryManagerRegisterDevice_cold_1();
    return 1;
  }
  return v15;
}

uint64_t BTAccessoryManagerPlugInDevice(uint64_t a1, uint64_t a2)
{
  uint64_t MBXpcConnection;
  uint64_t v5;
  xpc_object_t v6;
  uint64_t v7;
  _QWORD v9[5];
  uint64_t v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t v13;

  if (MBFLogInitOnce != -1)
    dispatch_once_f(&MBFLogInitOnce, 0, (dispatch_function_t)MBFLogInit);
  if (os_log_type_enabled((os_log_t)MBFLogComponent, OS_LOG_TYPE_DEBUG))
    BTAccessoryManagerPlugInDevice_cold_2();
  MBXpcConnection = getMBXpcConnection(a1);
  if (MBXpcConnection)
  {
    v5 = MBXpcConnection;
    v6 = xpc_dictionary_create(0, 0, 0);
    xpc_dictionary_set_uint64(v6, "kCBMsgArgAccessoryManagerID", a1);
    xpc_dictionary_set_uint64(v6, "kCBMsgArgBTDevice", a2);
    v10 = 0;
    v11 = &v10;
    v12 = 0x2000000000;
    v13 = 0;
    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 0x40000000;
    v9[2] = __BTAccessoryManagerPlugInDevice_block_invoke;
    v9[3] = &unk_1E6B04E38;
    v9[4] = &v10;
    sendMessageWithReplySync(v5, "kCBMsgIdAccessoryPlugInDeviceMsg", v6, (uint64_t)v9);
    if (v6)
      xpc_release(v6);
    v7 = *((unsigned int *)v11 + 6);
    _Block_object_dispose(&v10, 8);
  }
  else
  {
    if (MBFLogInitOnce != -1)
      dispatch_once_f(&MBFLogInitOnce, 0, (dispatch_function_t)MBFLogInit);
    if (os_log_type_enabled((os_log_t)MBFLogComponent, OS_LOG_TYPE_ERROR))
      BTAccessoryManagerRegisterDevice_cold_1();
    return 1;
  }
  return v7;
}

uint64_t BTAccessoryManagerUnplugDevice(uint64_t a1, uint64_t a2)
{
  uint64_t MBXpcConnection;
  uint64_t v5;
  xpc_object_t v6;
  uint64_t v7;
  _QWORD v9[5];
  uint64_t v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t v13;

  if (MBFLogInitOnce != -1)
    dispatch_once_f(&MBFLogInitOnce, 0, (dispatch_function_t)MBFLogInit);
  if (os_log_type_enabled((os_log_t)MBFLogComponent, OS_LOG_TYPE_DEBUG))
    BTAccessoryManagerUnplugDevice_cold_2();
  MBXpcConnection = getMBXpcConnection(a1);
  if (MBXpcConnection)
  {
    v5 = MBXpcConnection;
    v6 = xpc_dictionary_create(0, 0, 0);
    xpc_dictionary_set_uint64(v6, "kCBMsgArgAccessoryManagerID", a1);
    xpc_dictionary_set_uint64(v6, "kCBMsgArgBTDevice", a2);
    v10 = 0;
    v11 = &v10;
    v12 = 0x2000000000;
    v13 = 0;
    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 0x40000000;
    v9[2] = __BTAccessoryManagerUnplugDevice_block_invoke;
    v9[3] = &unk_1E6B04E60;
    v9[4] = &v10;
    sendMessageWithReplySync(v5, "kCBMsgIdAccessoryUnplugDeviceMsg", v6, (uint64_t)v9);
    if (v6)
      xpc_release(v6);
    v7 = *((unsigned int *)v11 + 6);
    _Block_object_dispose(&v10, 8);
  }
  else
  {
    if (MBFLogInitOnce != -1)
      dispatch_once_f(&MBFLogInitOnce, 0, (dispatch_function_t)MBFLogInit);
    if (os_log_type_enabled((os_log_t)MBFLogComponent, OS_LOG_TYPE_ERROR))
      BTAccessoryManagerRegisterDevice_cold_1();
    return 1;
  }
  return v7;
}

uint64_t BTAccessoryManagerGetDeviceState(uint64_t a1, uint64_t a2, _DWORD *a3)
{
  uint64_t MBXpcConnection;
  uint64_t v7;
  xpc_object_t v8;
  uint64_t v9;
  _QWORD v11[6];
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  int v15;
  uint64_t v16;
  uint64_t *v17;
  uint64_t v18;
  uint64_t v19;

  if (MBFLogInitOnce != -1)
    dispatch_once_f(&MBFLogInitOnce, 0, (dispatch_function_t)MBFLogInit);
  if (os_log_type_enabled((os_log_t)MBFLogComponent, OS_LOG_TYPE_DEBUG))
    BTAccessoryManagerGetDeviceState_cold_2();
  MBXpcConnection = getMBXpcConnection(a1);
  if (MBXpcConnection)
  {
    v7 = MBXpcConnection;
    v8 = xpc_dictionary_create(0, 0, 0);
    xpc_dictionary_set_uint64(v8, "kCBMsgArgAccessoryManagerID", a1);
    xpc_dictionary_set_uint64(v8, "kCBMsgArgBTDevice", a2);
    v16 = 0;
    v17 = &v16;
    v18 = 0x2000000000;
    v19 = 0;
    v12 = 0;
    v13 = &v12;
    v14 = 0x2000000000;
    v15 = 0;
    v11[0] = MEMORY[0x1E0C809B0];
    v11[1] = 0x40000000;
    v11[2] = __BTAccessoryManagerGetDeviceState_block_invoke;
    v11[3] = &unk_1E6B04E88;
    v11[4] = &v16;
    v11[5] = &v12;
    sendMessageWithReplySync(v7, "kCBMsgIdAccessoryGetDeviceStateMsg", v8, (uint64_t)v11);
    *a3 = *((_DWORD *)v13 + 6);
    if (v8)
      xpc_release(v8);
    v9 = *((unsigned int *)v17 + 6);
    _Block_object_dispose(&v12, 8);
    _Block_object_dispose(&v16, 8);
  }
  else
  {
    if (MBFLogInitOnce != -1)
      dispatch_once_f(&MBFLogInitOnce, 0, (dispatch_function_t)MBFLogInit);
    if (os_log_type_enabled((os_log_t)MBFLogComponent, OS_LOG_TYPE_ERROR))
      BTAccessoryManagerRegisterDevice_cold_1();
    return 1;
  }
  return v9;
}

uint64_t BTAccessoryManagerGetDevices(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t MBXpcConnection;
  uint64_t v9;
  xpc_object_t v10;
  uint64_t v11;
  _QWORD v13[8];
  uint64_t v14;
  uint64_t *v15;
  uint64_t v16;
  uint64_t v17;

  if (MBFLogInitOnce != -1)
    dispatch_once_f(&MBFLogInitOnce, 0, (dispatch_function_t)MBFLogInit);
  if (os_log_type_enabled((os_log_t)MBFLogComponent, OS_LOG_TYPE_DEBUG))
    BTAccessoryManagerGetDevices_cold_2();
  MBXpcConnection = getMBXpcConnection(a1);
  if (MBXpcConnection)
  {
    v9 = MBXpcConnection;
    v10 = xpc_dictionary_create(0, 0, 0);
    xpc_dictionary_set_uint64(v10, "kCBMsgArgAccessoryManagerID", a1);
    xpc_dictionary_set_uint64(v10, "kCbMsgArgDeviceArrayMaxSize", a4);
    v14 = 0;
    v15 = &v14;
    v16 = 0x2000000000;
    v17 = 0;
    v13[0] = MEMORY[0x1E0C809B0];
    v13[1] = 0x40000000;
    v13[2] = __BTAccessoryManagerGetDevices_block_invoke;
    v13[3] = &unk_1E6B04EB0;
    v13[4] = &v14;
    v13[5] = a4;
    v13[6] = a2;
    v13[7] = a3;
    sendMessageWithReplySync(v9, "kCBMsgIdAccessoryGetDevicesMsg", v10, (uint64_t)v13);
    if (v10)
      xpc_release(v10);
    v11 = *((unsigned int *)v15 + 6);
    _Block_object_dispose(&v14, 8);
  }
  else
  {
    if (MBFLogInitOnce != -1)
      dispatch_once_f(&MBFLogInitOnce, 0, (dispatch_function_t)MBFLogInit);
    if (os_log_type_enabled((os_log_t)MBFLogComponent, OS_LOG_TYPE_ERROR))
      BTAccessoryManagerGetDevices_cold_1();
    return 1;
  }
  return v11;
}

uint64_t BTAccessoryManagerGetTimeSyncId(uint64_t a1, uint64_t a2, _QWORD *a3)
{
  uint64_t MBXpcConnection;
  uint64_t v7;
  xpc_object_t v8;
  uint64_t v9;
  _QWORD v11[6];
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t *v17;
  uint64_t v18;
  uint64_t v19;

  if (MBFLogInitOnce != -1)
    dispatch_once_f(&MBFLogInitOnce, 0, (dispatch_function_t)MBFLogInit);
  if (os_log_type_enabled((os_log_t)MBFLogComponent, OS_LOG_TYPE_DEBUG))
    BTAccessoryManagerGetTimeSyncId_cold_2();
  MBXpcConnection = getMBXpcConnection(a1);
  if (MBXpcConnection)
  {
    v7 = MBXpcConnection;
    v8 = xpc_dictionary_create(0, 0, 0);
    xpc_dictionary_set_uint64(v8, "kCBMsgArgAccessoryManagerID", a1);
    xpc_dictionary_set_uint64(v8, "kCBMsgArgBTDevice", a2);
    v16 = 0;
    v17 = &v16;
    v18 = 0x2000000000;
    v19 = 0;
    v12 = 0;
    v13 = &v12;
    v14 = 0x2000000000;
    v15 = 0;
    v11[0] = MEMORY[0x1E0C809B0];
    v11[1] = 0x40000000;
    v11[2] = __BTAccessoryManagerGetTimeSyncId_block_invoke;
    v11[3] = &unk_1E6B04ED8;
    v11[4] = &v16;
    v11[5] = &v12;
    sendMessageWithReplySync(v7, "kCBMsgIdAccessoryGetTimeSyncIdMsg", v8, (uint64_t)v11);
    *a3 = v13[3];
    if (v8)
      xpc_release(v8);
    v9 = *((unsigned int *)v17 + 6);
    _Block_object_dispose(&v12, 8);
    _Block_object_dispose(&v16, 8);
  }
  else
  {
    if (MBFLogInitOnce != -1)
      dispatch_once_f(&MBFLogInitOnce, 0, (dispatch_function_t)MBFLogInit);
    if (os_log_type_enabled((os_log_t)MBFLogComponent, OS_LOG_TYPE_ERROR))
      BTAccessoryManagerRegisterDevice_cold_1();
    return 1;
  }
  return v9;
}

uint64_t BTAccessoryManagerGetDeviceBatteryLevel(uint64_t a1, uint64_t a2, _BYTE *a3)
{
  uint64_t MBXpcConnection;
  uint64_t v7;
  xpc_object_t v8;
  uint64_t v9;
  _QWORD v11[6];
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t *v17;
  uint64_t v18;
  uint64_t v19;

  if (MBFLogInitOnce != -1)
    dispatch_once_f(&MBFLogInitOnce, 0, (dispatch_function_t)MBFLogInit);
  if (os_log_type_enabled((os_log_t)MBFLogComponent, OS_LOG_TYPE_DEBUG))
    BTAccessoryManagerGetDeviceBatteryLevel_cold_2();
  MBXpcConnection = getMBXpcConnection(a1);
  if (MBXpcConnection)
  {
    v7 = MBXpcConnection;
    v8 = xpc_dictionary_create(0, 0, 0);
    xpc_dictionary_set_uint64(v8, "kCBMsgArgAccessoryManagerID", a1);
    xpc_dictionary_set_uint64(v8, "kCBMsgArgBTDevice", a2);
    v16 = 0;
    v17 = &v16;
    v18 = 0x2000000000;
    v19 = 0;
    v12 = 0;
    v13 = &v12;
    v14 = 0x2000000000;
    v15 = 0;
    v11[0] = MEMORY[0x1E0C809B0];
    v11[1] = 0x40000000;
    v11[2] = __BTAccessoryManagerGetDeviceBatteryLevel_block_invoke;
    v11[3] = &unk_1E6B04F00;
    v11[4] = &v16;
    v11[5] = &v12;
    sendMessageWithReplySync(v7, "kCBMsgIdAccessoryGetDeviceBatteryLevelMsg", v8, (uint64_t)v11);
    *a3 = v13[3];
    if (v8)
      xpc_release(v8);
    v9 = *((unsigned int *)v17 + 6);
    _Block_object_dispose(&v12, 8);
    _Block_object_dispose(&v16, 8);
  }
  else
  {
    if (MBFLogInitOnce != -1)
      dispatch_once_f(&MBFLogInitOnce, 0, (dispatch_function_t)MBFLogInit);
    if (os_log_type_enabled((os_log_t)MBFLogComponent, OS_LOG_TYPE_ERROR))
      BTAccessoryManagerRegisterDevice_cold_1();
    return 1;
  }
  return v9;
}

uint64_t BTAccessoryManagerGetDeviceBatteryStatus(uint64_t a1, uint64_t a2, uint64_t a3)
{
  NSObject *v6;
  uint64_t MBXpcConnection;
  uint64_t v8;
  xpc_object_t v9;
  uint64_t v10;
  _QWORD v12[6];
  uint8_t buf[8];
  uint8_t *v14;
  uint64_t v15;
  uint64_t v16;

  if (MBFLogInitOnce != -1)
    dispatch_once_f(&MBFLogInitOnce, 0, (dispatch_function_t)MBFLogInit);
  v6 = MBFLogComponent;
  if (os_log_type_enabled((os_log_t)MBFLogComponent, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1B6BF1000, v6, OS_LOG_TYPE_DEFAULT, "BTAccessoryManagerGetDeviceBatteryStatus over XPC", buf, 2u);
  }
  MBXpcConnection = getMBXpcConnection(a1);
  if (MBXpcConnection)
  {
    v8 = MBXpcConnection;
    v9 = xpc_dictionary_create(0, 0, 0);
    xpc_dictionary_set_uint64(v9, "kCBMsgArgAccessoryManagerID", a1);
    xpc_dictionary_set_uint64(v9, "kCBMsgArgBTDevice", a2);
    *(_QWORD *)buf = 0;
    v14 = buf;
    v15 = 0x2000000000;
    v16 = 0;
    v12[0] = MEMORY[0x1E0C809B0];
    v12[1] = 0x40000000;
    v12[2] = __BTAccessoryManagerGetDeviceBatteryStatus_block_invoke;
    v12[3] = &unk_1E6B04F28;
    v12[4] = buf;
    v12[5] = a3;
    sendMessageWithReplySync(v8, "kCBMsgIdAccessoryGetDeviceBatteryStatusMsg", v9, (uint64_t)v12);
    if (v9)
      xpc_release(v9);
    v10 = *((unsigned int *)v14 + 6);
    _Block_object_dispose(buf, 8);
  }
  else
  {
    if (MBFLogInitOnce != -1)
      dispatch_once_f(&MBFLogInitOnce, 0, (dispatch_function_t)MBFLogInit);
    if (os_log_type_enabled((os_log_t)MBFLogComponent, OS_LOG_TYPE_ERROR))
      BTAccessoryManagerRegisterDevice_cold_1();
    return 1;
  }
  return v10;
}

uint64_t BTAccessoryManagerIsAccessory(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t MBXpcConnection;
  uint64_t v7;
  xpc_object_t v8;
  int v9;
  uint64_t v10;
  _QWORD v12[6];
  uint64_t v13;
  uint64_t *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t *v18;
  uint64_t v19;
  uint64_t v20;

  if (MBFLogInitOnce != -1)
    dispatch_once_f(&MBFLogInitOnce, 0, (dispatch_function_t)MBFLogInit);
  if (os_log_type_enabled((os_log_t)MBFLogComponent, OS_LOG_TYPE_DEBUG))
    BTAccessoryManagerIsAccessory_cold_2();
  MBXpcConnection = getMBXpcConnection(a1);
  if (MBXpcConnection)
  {
    v7 = MBXpcConnection;
    v8 = xpc_dictionary_create(0, 0, 0);
    xpc_dictionary_set_uint64(v8, "kCBMsgArgAccessoryManagerID", a1);
    xpc_dictionary_set_uint64(v8, "kCBMsgArgBTDevice", a2);
    v17 = 0;
    v18 = &v17;
    v19 = 0x2000000000;
    v20 = 0;
    v13 = 0;
    v14 = &v13;
    v15 = 0x2000000000;
    v16 = 0;
    v12[0] = MEMORY[0x1E0C809B0];
    v12[1] = 0x40000000;
    v12[2] = __BTAccessoryManagerIsAccessory_block_invoke;
    v12[3] = &unk_1E6B04F50;
    v12[4] = &v17;
    v12[5] = &v13;
    sendMessageWithReplySync(v7, "kCBMsgIdAccessoryIsAccessoryMsg", v8, (uint64_t)v12);
    if (v14[3])
      v9 = -1;
    else
      v9 = 0;
    *a3 = v9;
    if (v8)
      xpc_release(v8);
    v10 = *((unsigned int *)v18 + 6);
    _Block_object_dispose(&v13, 8);
    _Block_object_dispose(&v17, 8);
  }
  else
  {
    if (MBFLogInitOnce != -1)
      dispatch_once_f(&MBFLogInitOnce, 0, (dispatch_function_t)MBFLogInit);
    if (os_log_type_enabled((os_log_t)MBFLogComponent, OS_LOG_TYPE_ERROR))
      BTAccessoryManagerRegisterDevice_cold_1();
    return 1;
  }
  return v10;
}

uint64_t BTAccessoryManagerGenerateLinkKey(uint64_t a1, const void *a2, uint64_t a3)
{
  uint64_t MBXpcConnection;
  uint64_t v7;
  xpc_object_t v8;
  uint64_t v9;
  _QWORD v11[7];
  _QWORD v12[4];
  uint64_t v13;
  uint64_t *v14;
  uint64_t v15;
  uint64_t v16;

  if (MBFLogInitOnce != -1)
    dispatch_once_f(&MBFLogInitOnce, 0, (dispatch_function_t)MBFLogInit);
  if (os_log_type_enabled((os_log_t)MBFLogComponent, OS_LOG_TYPE_DEBUG))
    BTAccessoryManagerGenerateLinkKey_cold_2();
  MBXpcConnection = getMBXpcConnection(a1);
  if (MBXpcConnection)
  {
    v7 = MBXpcConnection;
    v8 = xpc_dictionary_create(0, 0, 0);
    xpc_dictionary_set_uint64(v8, "kCBMsgArgAccessoryManagerID", a1);
    xpc_dictionary_set_data(v8, "kCBMsgArgAddressBytes", a2, 6uLL);
    v13 = 0;
    v14 = &v13;
    v15 = 0x2000000000;
    v16 = 0;
    v12[0] = 0;
    v12[1] = v12;
    v12[2] = 0x2000000000;
    v12[3] = 0;
    v11[0] = MEMORY[0x1E0C809B0];
    v11[1] = 0x40000000;
    v11[2] = __BTAccessoryManagerGenerateLinkKey_block_invoke;
    v11[3] = &unk_1E6B04F78;
    v11[4] = &v13;
    v11[5] = v12;
    v11[6] = a3;
    sendMessageWithReplySync(v7, "kCBMsgIdAccessoryGenerateLinkKeyMsg", v8, (uint64_t)v11);
    if (v8)
      xpc_release(v8);
    v9 = *((unsigned int *)v14 + 6);
    _Block_object_dispose(v12, 8);
    _Block_object_dispose(&v13, 8);
  }
  else
  {
    if (MBFLogInitOnce != -1)
      dispatch_once_f(&MBFLogInitOnce, 0, (dispatch_function_t)MBFLogInit);
    if (os_log_type_enabled((os_log_t)MBFLogComponent, OS_LOG_TYPE_ERROR))
      BTAccessoryManagerRegisterDevice_cold_1();
    return 1;
  }
  return v9;
}

uint64_t BTAccessoryManagerSetLinkKeyEx(uint64_t a1, const void *a2, const char *a3, unsigned int a4, unsigned int a5, const void *a6, _QWORD *a7)
{
  uint64_t MBXpcConnection;
  uint64_t v15;
  xpc_object_t v16;
  uint64_t v17;
  _QWORD v19[6];
  uint64_t v20;
  uint64_t *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t *v25;
  uint64_t v26;
  uint64_t v27;

  if (MBFLogInitOnce != -1)
    dispatch_once_f(&MBFLogInitOnce, 0, (dispatch_function_t)MBFLogInit);
  if (os_log_type_enabled((os_log_t)MBFLogComponent, OS_LOG_TYPE_DEBUG))
    BTAccessoryManagerSetLinkKeyEx_cold_3();
  MBXpcConnection = getMBXpcConnection(a1);
  if (MBXpcConnection)
  {
    if (a3)
    {
      v15 = MBXpcConnection;
      v16 = xpc_dictionary_create(0, 0, 0);
      xpc_dictionary_set_uint64(v16, "kCBMsgArgAccessoryManagerID", a1);
      xpc_dictionary_set_data(v16, "kCBMsgArgAddressBytes", a2, 6uLL);
      xpc_dictionary_set_string(v16, "kCBMsgArgName", a3);
      xpc_dictionary_set_uint64(v16, "kCBMsgArgClassOfDevice", a4);
      xpc_dictionary_set_uint64(v16, "kCBMsgArgServiceMask", a5);
      xpc_dictionary_set_data(v16, "kCBMsgArgLinkKey", a6, 0x10uLL);
      v24 = 0;
      v25 = &v24;
      v26 = 0x2000000000;
      v27 = 0;
      v20 = 0;
      v21 = &v20;
      v22 = 0x2000000000;
      v23 = 0;
      v19[0] = MEMORY[0x1E0C809B0];
      v19[1] = 0x40000000;
      v19[2] = __BTAccessoryManagerSetLinkKeyEx_block_invoke;
      v19[3] = &unk_1E6B04FA0;
      v19[4] = &v24;
      v19[5] = &v20;
      sendMessageWithReplySync(v15, "kCBMsgIdAccessorySetLinkKeyExMsg", v16, (uint64_t)v19);
      *a7 = v21[3];
      if (v16)
        xpc_release(v16);
      v17 = *((unsigned int *)v25 + 6);
      _Block_object_dispose(&v20, 8);
      _Block_object_dispose(&v24, 8);
    }
    else
    {
      if (MBFLogInitOnce != -1)
        dispatch_once_f(&MBFLogInitOnce, 0, (dispatch_function_t)MBFLogInit);
      if (os_log_type_enabled((os_log_t)MBFLogComponent, OS_LOG_TYPE_ERROR))
        BTAccessoryManagerSetLinkKeyEx_cold_2();
      return 3;
    }
  }
  else
  {
    if (MBFLogInitOnce != -1)
      dispatch_once_f(&MBFLogInitOnce, 0, (dispatch_function_t)MBFLogInit);
    if (os_log_type_enabled((os_log_t)MBFLogComponent, OS_LOG_TYPE_ERROR))
      BTAccessoryManagerRegisterDevice_cold_1();
    return 1;
  }
  return v17;
}

uint64_t BTAccessoryManagerSetDoubleTapAction(uint64_t a1, uint64_t a2, unsigned int a3)
{
  uint64_t MBXpcConnection;
  uint64_t v7;
  xpc_object_t v8;
  uint64_t v9;
  _QWORD v11[5];
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t v15;

  if (MBFLogInitOnce != -1)
    dispatch_once_f(&MBFLogInitOnce, 0, (dispatch_function_t)MBFLogInit);
  if (os_log_type_enabled((os_log_t)MBFLogComponent, OS_LOG_TYPE_DEBUG))
    BTAccessoryManagerSetDoubleTapAction_cold_2();
  MBXpcConnection = getMBXpcConnection(a1);
  if (MBXpcConnection)
  {
    v7 = MBXpcConnection;
    v8 = xpc_dictionary_create(0, 0, 0);
    xpc_dictionary_set_uint64(v8, "kCBMsgArgAccessoryManagerID", a1);
    xpc_dictionary_set_uint64(v8, "kCBMsgArgBTDevice", a2);
    xpc_dictionary_set_uint64(v8, "kCBMsgArgDoubleTapAction", a3);
    v12 = 0;
    v13 = &v12;
    v14 = 0x2000000000;
    v15 = 0;
    v11[0] = MEMORY[0x1E0C809B0];
    v11[1] = 0x40000000;
    v11[2] = __BTAccessoryManagerSetDoubleTapAction_block_invoke;
    v11[3] = &unk_1E6B04FC8;
    v11[4] = &v12;
    sendMessageWithReplySync(v7, "kCBMsgIdAccessorySetDoubleTapActionMsg", v8, (uint64_t)v11);
    if (v8)
      xpc_release(v8);
    v9 = *((unsigned int *)v13 + 6);
    _Block_object_dispose(&v12, 8);
  }
  else
  {
    if (MBFLogInitOnce != -1)
      dispatch_once_f(&MBFLogInitOnce, 0, (dispatch_function_t)MBFLogInit);
    if (os_log_type_enabled((os_log_t)MBFLogComponent, OS_LOG_TYPE_ERROR))
      BTAccessoryManagerRegisterDevice_cold_1();
    return 1;
  }
  return v9;
}

uint64_t BTAccessoryManagerSetDoubleTapActionEx(uint64_t a1, uint64_t a2, unsigned int a3, unsigned int a4)
{
  uint64_t MBXpcConnection;
  uint64_t v9;
  xpc_object_t v10;
  uint64_t v11;
  _QWORD v13[5];
  uint64_t v14;
  uint64_t *v15;
  uint64_t v16;
  uint64_t v17;

  if (MBFLogInitOnce != -1)
    dispatch_once_f(&MBFLogInitOnce, 0, (dispatch_function_t)MBFLogInit);
  if (os_log_type_enabled((os_log_t)MBFLogComponent, OS_LOG_TYPE_DEBUG))
    BTAccessoryManagerSetDoubleTapActionEx_cold_2();
  MBXpcConnection = getMBXpcConnection(a1);
  if (MBXpcConnection)
  {
    v9 = MBXpcConnection;
    v10 = xpc_dictionary_create(0, 0, 0);
    xpc_dictionary_set_uint64(v10, "kCBMsgArgAccessoryManagerID", a1);
    xpc_dictionary_set_uint64(v10, "kCBMsgArgBTDevice", a2);
    xpc_dictionary_set_uint64(v10, "kCBMsgArgDoubleTapActionLeft", a3);
    xpc_dictionary_set_uint64(v10, "kCBMsgArgDoubleTapActionRight", a4);
    v14 = 0;
    v15 = &v14;
    v16 = 0x2000000000;
    v17 = 0;
    v13[0] = MEMORY[0x1E0C809B0];
    v13[1] = 0x40000000;
    v13[2] = __BTAccessoryManagerSetDoubleTapActionEx_block_invoke;
    v13[3] = &unk_1E6B04FF0;
    v13[4] = &v14;
    sendMessageWithReplySync(v9, "kCBMsgIdAccessorySetDoubleTapActionExMsg", v10, (uint64_t)v13);
    if (v10)
      xpc_release(v10);
    v11 = *((unsigned int *)v15 + 6);
    _Block_object_dispose(&v14, 8);
  }
  else
  {
    if (MBFLogInitOnce != -1)
      dispatch_once_f(&MBFLogInitOnce, 0, (dispatch_function_t)MBFLogInit);
    if (os_log_type_enabled((os_log_t)MBFLogComponent, OS_LOG_TYPE_ERROR))
      BTAccessoryManagerRegisterDevice_cold_1();
    return 1;
  }
  return v11;
}

uint64_t BTAccessoryManagerSetMicMode(uint64_t a1, uint64_t a2, unsigned int a3)
{
  uint64_t MBXpcConnection;
  uint64_t v7;
  xpc_object_t v8;
  uint64_t v9;
  _QWORD v11[5];
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t v15;

  if (MBFLogInitOnce != -1)
    dispatch_once_f(&MBFLogInitOnce, 0, (dispatch_function_t)MBFLogInit);
  if (os_log_type_enabled((os_log_t)MBFLogComponent, OS_LOG_TYPE_DEBUG))
    BTAccessoryManagerSetMicMode_cold_2();
  MBXpcConnection = getMBXpcConnection(a1);
  if (MBXpcConnection)
  {
    v7 = MBXpcConnection;
    v8 = xpc_dictionary_create(0, 0, 0);
    xpc_dictionary_set_uint64(v8, "kCBMsgArgAccessoryManagerID", a1);
    xpc_dictionary_set_uint64(v8, "kCBMsgArgBTDevice", a2);
    xpc_dictionary_set_uint64(v8, "kCBMsgArgMicMode", a3);
    v12 = 0;
    v13 = &v12;
    v14 = 0x2000000000;
    v15 = 0;
    v11[0] = MEMORY[0x1E0C809B0];
    v11[1] = 0x40000000;
    v11[2] = __BTAccessoryManagerSetMicMode_block_invoke;
    v11[3] = &unk_1E6B05018;
    v11[4] = &v12;
    sendMessageWithReplySync(v7, "kCBMsgIdAccessorySetFirstSettingMsg", v8, (uint64_t)v11);
    if (v8)
      xpc_release(v8);
    v9 = *((unsigned int *)v13 + 6);
    _Block_object_dispose(&v12, 8);
  }
  else
  {
    if (MBFLogInitOnce != -1)
      dispatch_once_f(&MBFLogInitOnce, 0, (dispatch_function_t)MBFLogInit);
    if (os_log_type_enabled((os_log_t)MBFLogComponent, OS_LOG_TYPE_ERROR))
      BTAccessoryManagerRegisterDevice_cold_1();
    return 1;
  }
  return v9;
}

uint64_t BTAccessoryManagerRemoteTimeSyncEnable(uint64_t a1, uint64_t a2, unsigned int a3)
{
  uint64_t MBXpcConnection;
  uint64_t v7;
  xpc_object_t v8;
  uint64_t v9;
  _QWORD v11[5];
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t v15;

  if (MBFLogInitOnce != -1)
    dispatch_once_f(&MBFLogInitOnce, 0, (dispatch_function_t)MBFLogInit);
  if (os_log_type_enabled((os_log_t)MBFLogComponent, OS_LOG_TYPE_DEBUG))
    BTAccessoryManagerRemoteTimeSyncEnable_cold_2();
  MBXpcConnection = getMBXpcConnection(a1);
  if (MBXpcConnection)
  {
    v7 = MBXpcConnection;
    v8 = xpc_dictionary_create(0, 0, 0);
    xpc_dictionary_set_uint64(v8, "kCBMsgArgAccessoryManagerID", a1);
    xpc_dictionary_set_uint64(v8, "kCBMsgArgBTDevice", a2);
    xpc_dictionary_set_uint64(v8, "kCBMsgArgBool", a3);
    v12 = 0;
    v13 = &v12;
    v14 = 0x2000000000;
    v15 = 0;
    v11[0] = MEMORY[0x1E0C809B0];
    v11[1] = 0x40000000;
    v11[2] = __BTAccessoryManagerRemoteTimeSyncEnable_block_invoke;
    v11[3] = &unk_1E6B05040;
    v11[4] = &v12;
    sendMessageWithReplySync(v7, "kCBMsgIdAccessorySetRemoteTimeSyncMsg", v8, (uint64_t)v11);
    if (v8)
      xpc_release(v8);
    v9 = *((unsigned int *)v13 + 6);
    _Block_object_dispose(&v12, 8);
  }
  else
  {
    if (MBFLogInitOnce != -1)
      dispatch_once_f(&MBFLogInitOnce, 0, (dispatch_function_t)MBFLogInit);
    if (os_log_type_enabled((os_log_t)MBFLogComponent, OS_LOG_TYPE_ERROR))
      BTAccessoryManagerRegisterDevice_cold_1();
    return 1;
  }
  return v9;
}

uint64_t BTAccessoryManagerSensorStreamTimeSyncEnable(uint64_t a1, uint64_t a2, unsigned int a3)
{
  uint64_t MBXpcConnection;
  uint64_t v7;
  xpc_object_t v8;
  uint64_t v9;
  _QWORD v11[5];
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t v15;

  if (MBFLogInitOnce != -1)
    dispatch_once_f(&MBFLogInitOnce, 0, (dispatch_function_t)MBFLogInit);
  if (os_log_type_enabled((os_log_t)MBFLogComponent, OS_LOG_TYPE_DEBUG))
    BTAccessoryManagerSensorStreamTimeSyncEnable_cold_2();
  MBXpcConnection = getMBXpcConnection(a1);
  if (MBXpcConnection)
  {
    v7 = MBXpcConnection;
    v8 = xpc_dictionary_create(0, 0, 0);
    xpc_dictionary_set_uint64(v8, "kCBMsgArgAccessoryManagerID", a1);
    xpc_dictionary_set_uint64(v8, "kCBMsgArgBTDevice", a2);
    xpc_dictionary_set_uint64(v8, "kCBMsgArgBool", a3);
    v12 = 0;
    v13 = &v12;
    v14 = 0x2000000000;
    v15 = 0;
    v11[0] = MEMORY[0x1E0C809B0];
    v11[1] = 0x40000000;
    v11[2] = __BTAccessoryManagerSensorStreamTimeSyncEnable_block_invoke;
    v11[3] = &unk_1E6B05068;
    v11[4] = &v12;
    sendMessageWithReplySync(v7, "kCBMsgIdAccessorySensorStreamTimeSyncEnableMsg", v8, (uint64_t)v11);
    if (v8)
      xpc_release(v8);
    v9 = *((unsigned int *)v13 + 6);
    _Block_object_dispose(&v12, 8);
  }
  else
  {
    if (MBFLogInitOnce != -1)
      dispatch_once_f(&MBFLogInitOnce, 0, (dispatch_function_t)MBFLogInit);
    if (os_log_type_enabled((os_log_t)MBFLogComponent, OS_LOG_TYPE_ERROR))
      BTAccessoryManagerRegisterDevice_cold_1();
    return 1;
  }
  return v9;
}

uint64_t BTAccessoryManagerSetInEarDetectionEnable(uint64_t a1, uint64_t a2, unsigned int a3)
{
  uint64_t MBXpcConnection;
  uint64_t v7;
  xpc_object_t v8;
  uint64_t v9;
  _QWORD v11[5];
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t v15;

  if (MBFLogInitOnce != -1)
    dispatch_once_f(&MBFLogInitOnce, 0, (dispatch_function_t)MBFLogInit);
  if (os_log_type_enabled((os_log_t)MBFLogComponent, OS_LOG_TYPE_DEBUG))
    BTAccessoryManagerSetInEarDetectionEnable_cold_2();
  MBXpcConnection = getMBXpcConnection(a1);
  if (MBXpcConnection)
  {
    v7 = MBXpcConnection;
    v8 = xpc_dictionary_create(0, 0, 0);
    xpc_dictionary_set_uint64(v8, "kCBMsgArgAccessoryManagerID", a1);
    xpc_dictionary_set_uint64(v8, "kCBMsgArgBTDevice", a2);
    xpc_dictionary_set_uint64(v8, "kCBMsgArgBool", a3);
    v12 = 0;
    v13 = &v12;
    v14 = 0x2000000000;
    v15 = 0;
    v11[0] = MEMORY[0x1E0C809B0];
    v11[1] = 0x40000000;
    v11[2] = __BTAccessoryManagerSetInEarDetectionEnable_block_invoke;
    v11[3] = &unk_1E6B05090;
    v11[4] = &v12;
    sendMessageWithReplySync(v7, "kCBMsgIdAccessorySetSecondSettingMsg", v8, (uint64_t)v11);
    if (v8)
      xpc_release(v8);
    v9 = *((unsigned int *)v13 + 6);
    _Block_object_dispose(&v12, 8);
  }
  else
  {
    if (MBFLogInitOnce != -1)
      dispatch_once_f(&MBFLogInitOnce, 0, (dispatch_function_t)MBFLogInit);
    if (os_log_type_enabled((os_log_t)MBFLogComponent, OS_LOG_TYPE_ERROR))
      BTAccessoryManagerRegisterDevice_cold_1();
    return 1;
  }
  return v9;
}

uint64_t BTAccessoryManagerSetIsHidden(uint64_t a1, uint64_t a2, unsigned int a3)
{
  uint64_t MBXpcConnection;
  uint64_t v7;
  xpc_object_t v8;
  uint64_t v9;
  _QWORD v11[5];
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t v15;

  if (MBFLogInitOnce != -1)
    dispatch_once_f(&MBFLogInitOnce, 0, (dispatch_function_t)MBFLogInit);
  if (os_log_type_enabled((os_log_t)MBFLogComponent, OS_LOG_TYPE_DEBUG))
    BTAccessoryManagerSetIsHidden_cold_2();
  MBXpcConnection = getMBXpcConnection(a1);
  if (MBXpcConnection)
  {
    v7 = MBXpcConnection;
    v8 = xpc_dictionary_create(0, 0, 0);
    xpc_dictionary_set_uint64(v8, "kCBMsgArgAccessoryManagerID", a1);
    xpc_dictionary_set_uint64(v8, "kCBMsgArgBTDevice", a2);
    xpc_dictionary_set_uint64(v8, "kCBMsgArgBool", a3);
    v12 = 0;
    v13 = &v12;
    v14 = 0x2000000000;
    v15 = 0;
    v11[0] = MEMORY[0x1E0C809B0];
    v11[1] = 0x40000000;
    v11[2] = __BTAccessoryManagerSetIsHidden_block_invoke;
    v11[3] = &unk_1E6B050B8;
    v11[4] = &v12;
    sendMessageWithReplySync(v7, "kCBMsgIdAccessorySetIsHiddenMsg", v8, (uint64_t)v11);
    if (v8)
      xpc_release(v8);
    v9 = *((unsigned int *)v13 + 6);
    _Block_object_dispose(&v12, 8);
  }
  else
  {
    if (MBFLogInitOnce != -1)
      dispatch_once_f(&MBFLogInitOnce, 0, (dispatch_function_t)MBFLogInit);
    if (os_log_type_enabled((os_log_t)MBFLogComponent, OS_LOG_TYPE_ERROR))
      BTAccessoryManagerRegisterDevice_cold_1();
    return 1;
  }
  return v9;
}

uint64_t BTAccessoryManagerGetDoubleTapAction(uint64_t a1, uint64_t a2, _DWORD *a3)
{
  uint64_t MBXpcConnection;
  uint64_t v7;
  xpc_object_t v8;
  uint64_t v9;
  _QWORD v11[6];
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t *v17;
  uint64_t v18;
  uint64_t v19;

  if (MBFLogInitOnce != -1)
    dispatch_once_f(&MBFLogInitOnce, 0, (dispatch_function_t)MBFLogInit);
  if (os_log_type_enabled((os_log_t)MBFLogComponent, OS_LOG_TYPE_DEBUG))
    BTAccessoryManagerGetDoubleTapAction_cold_2();
  MBXpcConnection = getMBXpcConnection(a1);
  if (MBXpcConnection)
  {
    v7 = MBXpcConnection;
    v8 = xpc_dictionary_create(0, 0, 0);
    xpc_dictionary_set_uint64(v8, "kCBMsgArgAccessoryManagerID", a1);
    xpc_dictionary_set_uint64(v8, "kCBMsgArgBTDevice", a2);
    v16 = 0;
    v17 = &v16;
    v18 = 0x2000000000;
    v19 = 0;
    v12 = 0;
    v13 = &v12;
    v14 = 0x2000000000;
    v15 = 0;
    v11[0] = MEMORY[0x1E0C809B0];
    v11[1] = 0x40000000;
    v11[2] = __BTAccessoryManagerGetDoubleTapAction_block_invoke;
    v11[3] = &unk_1E6B050E0;
    v11[4] = &v16;
    v11[5] = &v12;
    sendMessageWithReplySync(v7, "kCBMsgIdAccessoryGetDoubleTapActionMsg", v8, (uint64_t)v11);
    if (v8)
      xpc_release(v8);
    *a3 = v13[3];
    v9 = *((unsigned int *)v17 + 6);
    _Block_object_dispose(&v12, 8);
    _Block_object_dispose(&v16, 8);
  }
  else
  {
    if (MBFLogInitOnce != -1)
      dispatch_once_f(&MBFLogInitOnce, 0, (dispatch_function_t)MBFLogInit);
    if (os_log_type_enabled((os_log_t)MBFLogComponent, OS_LOG_TYPE_ERROR))
      BTAccessoryManagerRegisterDevice_cold_1();
    return 1;
  }
  return v9;
}

uint64_t BTAccessoryManagerGetDoubleTapActionEx(uint64_t a1, uint64_t a2, _DWORD *a3, _DWORD *a4)
{
  uint64_t MBXpcConnection;
  uint64_t v9;
  xpc_object_t v10;
  uint64_t v11;
  _QWORD v13[7];
  uint64_t v14;
  uint64_t *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t *v23;
  uint64_t v24;
  uint64_t v25;

  if (MBFLogInitOnce != -1)
    dispatch_once_f(&MBFLogInitOnce, 0, (dispatch_function_t)MBFLogInit);
  if (os_log_type_enabled((os_log_t)MBFLogComponent, OS_LOG_TYPE_DEBUG))
    BTAccessoryManagerGetDoubleTapActionEx_cold_2();
  MBXpcConnection = getMBXpcConnection(a1);
  if (MBXpcConnection)
  {
    v9 = MBXpcConnection;
    v10 = xpc_dictionary_create(0, 0, 0);
    xpc_dictionary_set_uint64(v10, "kCBMsgArgAccessoryManagerID", a1);
    xpc_dictionary_set_uint64(v10, "kCBMsgArgBTDevice", a2);
    v22 = 0;
    v23 = &v22;
    v24 = 0x2000000000;
    v25 = 0;
    v18 = 0;
    v19 = &v18;
    v20 = 0x2000000000;
    v21 = 0;
    v14 = 0;
    v15 = &v14;
    v16 = 0x2000000000;
    v17 = 0;
    v13[0] = MEMORY[0x1E0C809B0];
    v13[1] = 0x40000000;
    v13[2] = __BTAccessoryManagerGetDoubleTapActionEx_block_invoke;
    v13[3] = &unk_1E6B05108;
    v13[4] = &v22;
    v13[5] = &v18;
    v13[6] = &v14;
    sendMessageWithReplySync(v9, "kCBMsgIdAccessoryGetDoubleTapActionExMsg", v10, (uint64_t)v13);
    if (v10)
      xpc_release(v10);
    *a3 = v19[3];
    *a4 = v15[3];
    v11 = *((unsigned int *)v23 + 6);
    _Block_object_dispose(&v14, 8);
    _Block_object_dispose(&v18, 8);
    _Block_object_dispose(&v22, 8);
  }
  else
  {
    if (MBFLogInitOnce != -1)
      dispatch_once_f(&MBFLogInitOnce, 0, (dispatch_function_t)MBFLogInit);
    if (os_log_type_enabled((os_log_t)MBFLogComponent, OS_LOG_TYPE_ERROR))
      BTAccessoryManagerRegisterDevice_cold_1();
    return 1;
  }
  return v11;
}

uint64_t BTAccessoryManagerGetDoubleTapCapability(uint64_t a1, uint64_t a2, _DWORD *a3)
{
  uint64_t MBXpcConnection;
  uint64_t v7;
  xpc_object_t v8;
  uint64_t v9;
  _QWORD v11[6];
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t *v17;
  uint64_t v18;
  uint64_t v19;

  if (MBFLogInitOnce != -1)
    dispatch_once_f(&MBFLogInitOnce, 0, (dispatch_function_t)MBFLogInit);
  if (os_log_type_enabled((os_log_t)MBFLogComponent, OS_LOG_TYPE_DEBUG))
    BTAccessoryManagerGetDoubleTapCapability_cold_2();
  MBXpcConnection = getMBXpcConnection(a1);
  if (MBXpcConnection)
  {
    v7 = MBXpcConnection;
    v8 = xpc_dictionary_create(0, 0, 0);
    xpc_dictionary_set_uint64(v8, "kCBMsgArgAccessoryManagerID", a1);
    xpc_dictionary_set_uint64(v8, "kCBMsgArgBTDevice", a2);
    v16 = 0;
    v17 = &v16;
    v18 = 0x2000000000;
    v19 = 0;
    v12 = 0;
    v13 = &v12;
    v14 = 0x2000000000;
    v15 = 0;
    v11[0] = MEMORY[0x1E0C809B0];
    v11[1] = 0x40000000;
    v11[2] = __BTAccessoryManagerGetDoubleTapCapability_block_invoke;
    v11[3] = &unk_1E6B05130;
    v11[4] = &v16;
    v11[5] = &v12;
    sendMessageWithReplySync(v7, "kCBMsgIdAccessoryGetDoubleTapCapabilityMsg", v8, (uint64_t)v11);
    if (v8)
      xpc_release(v8);
    *a3 = v13[3];
    v9 = *((unsigned int *)v17 + 6);
    _Block_object_dispose(&v12, 8);
    _Block_object_dispose(&v16, 8);
  }
  else
  {
    if (MBFLogInitOnce != -1)
      dispatch_once_f(&MBFLogInitOnce, 0, (dispatch_function_t)MBFLogInit);
    if (os_log_type_enabled((os_log_t)MBFLogComponent, OS_LOG_TYPE_ERROR))
      BTAccessoryManagerRegisterDevice_cold_1();
    return 1;
  }
  return v9;
}

uint64_t BTAccessoryManagerGetFeatureCapability(uint64_t a1, uint64_t a2, unsigned int a3, _DWORD *a4)
{
  uint64_t MBXpcConnection;
  uint64_t v9;
  xpc_object_t v10;
  uint64_t v11;
  _QWORD v13[6];
  uint64_t v14;
  uint64_t *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t *v19;
  uint64_t v20;
  uint64_t v21;

  if (MBFLogInitOnce != -1)
    dispatch_once_f(&MBFLogInitOnce, 0, (dispatch_function_t)MBFLogInit);
  if (os_log_type_enabled((os_log_t)MBFLogComponent, OS_LOG_TYPE_DEBUG))
    BTAccessoryManagerGetFeatureCapability_cold_2();
  MBXpcConnection = getMBXpcConnection(a1);
  if (MBXpcConnection)
  {
    v9 = MBXpcConnection;
    v10 = xpc_dictionary_create(0, 0, 0);
    xpc_dictionary_set_uint64(v10, "kCBMsgArgAccessoryManagerID", a1);
    xpc_dictionary_set_uint64(v10, "kCBMsgArgBTDevice", a2);
    xpc_dictionary_set_uint64(v10, "kCBMsgArgFeature", a3);
    v18 = 0;
    v19 = &v18;
    v20 = 0x2000000000;
    v21 = 0;
    v14 = 0;
    v15 = &v14;
    v16 = 0x2000000000;
    v17 = 0;
    v13[0] = MEMORY[0x1E0C809B0];
    v13[1] = 0x40000000;
    v13[2] = __BTAccessoryManagerGetFeatureCapability_block_invoke;
    v13[3] = &unk_1E6B05158;
    v13[4] = &v18;
    v13[5] = &v14;
    sendMessageWithReplySync(v9, "kCBMsgIdAccessoryGetFeatureCapabilityMsg", v10, (uint64_t)v13);
    if (v10)
      xpc_release(v10);
    *a4 = v15[3];
    v11 = *((unsigned int *)v19 + 6);
    _Block_object_dispose(&v14, 8);
    _Block_object_dispose(&v18, 8);
  }
  else
  {
    if (MBFLogInitOnce != -1)
      dispatch_once_f(&MBFLogInitOnce, 0, (dispatch_function_t)MBFLogInit);
    if (os_log_type_enabled((os_log_t)MBFLogComponent, OS_LOG_TYPE_ERROR))
      BTAccessoryManagerRegisterDevice_cold_1();
    return 1;
  }
  return v11;
}

uint64_t BTAccessoryManagerGetAnnounceMessagesSupport(uint64_t a1, uint64_t a2, _DWORD *a3)
{
  uint64_t MBXpcConnection;
  uint64_t v7;
  xpc_object_t v8;
  uint64_t v9;
  _QWORD v11[6];
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t *v17;
  uint64_t v18;
  uint64_t v19;

  if (MBFLogInitOnce != -1)
    dispatch_once_f(&MBFLogInitOnce, 0, (dispatch_function_t)MBFLogInit);
  if (os_log_type_enabled((os_log_t)MBFLogComponent, OS_LOG_TYPE_DEBUG))
    BTAccessoryManagerGetAnnounceMessagesSupport_cold_2();
  MBXpcConnection = getMBXpcConnection(a1);
  if (MBXpcConnection)
  {
    v7 = MBXpcConnection;
    v8 = xpc_dictionary_create(0, 0, 0);
    xpc_dictionary_set_uint64(v8, "kCBMsgArgAccessoryManagerID", a1);
    xpc_dictionary_set_uint64(v8, "kCBMsgArgBTDevice", a2);
    v16 = 0;
    v17 = &v16;
    v18 = 0x2000000000;
    v19 = 0;
    v12 = 0;
    v13 = &v12;
    v14 = 0x2000000000;
    v15 = 0;
    v11[0] = MEMORY[0x1E0C809B0];
    v11[1] = 0x40000000;
    v11[2] = __BTAccessoryManagerGetAnnounceMessagesSupport_block_invoke;
    v11[3] = &unk_1E6B05180;
    v11[4] = &v16;
    v11[5] = &v12;
    sendMessageWithReplySync(v7, "kCBMsgIdAccessoryGetAnnounceMessagesSupportMsg", v8, (uint64_t)v11);
    if (v8)
      xpc_release(v8);
    *a3 = v13[3];
    v9 = *((unsigned int *)v17 + 6);
    _Block_object_dispose(&v12, 8);
    _Block_object_dispose(&v16, 8);
  }
  else
  {
    if (MBFLogInitOnce != -1)
      dispatch_once_f(&MBFLogInitOnce, 0, (dispatch_function_t)MBFLogInit);
    if (os_log_type_enabled((os_log_t)MBFLogComponent, OS_LOG_TYPE_ERROR))
      BTAccessoryManagerRegisterDevice_cold_1();
    return 1;
  }
  return v9;
}

uint64_t BTAccessoryManagerGetMicMode(uint64_t a1, uint64_t a2, _DWORD *a3)
{
  uint64_t MBXpcConnection;
  uint64_t v7;
  xpc_object_t v8;
  uint64_t v9;
  _QWORD v11[6];
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t *v17;
  uint64_t v18;
  uint64_t v19;

  if (MBFLogInitOnce != -1)
    dispatch_once_f(&MBFLogInitOnce, 0, (dispatch_function_t)MBFLogInit);
  if (os_log_type_enabled((os_log_t)MBFLogComponent, OS_LOG_TYPE_DEBUG))
    BTAccessoryManagerGetMicMode_cold_2();
  MBXpcConnection = getMBXpcConnection(a1);
  if (MBXpcConnection)
  {
    v7 = MBXpcConnection;
    v8 = xpc_dictionary_create(0, 0, 0);
    xpc_dictionary_set_uint64(v8, "kCBMsgArgAccessoryManagerID", a1);
    xpc_dictionary_set_uint64(v8, "kCBMsgArgBTDevice", a2);
    v16 = 0;
    v17 = &v16;
    v18 = 0x2000000000;
    v19 = 0;
    v12 = 0;
    v13 = &v12;
    v14 = 0x2000000000;
    v15 = 0;
    v11[0] = MEMORY[0x1E0C809B0];
    v11[1] = 0x40000000;
    v11[2] = __BTAccessoryManagerGetMicMode_block_invoke;
    v11[3] = &unk_1E6B051A8;
    v11[4] = &v16;
    v11[5] = &v12;
    sendMessageWithReplySync(v7, "kCBMsgIdAccessoryGetFirstSettingMsg", v8, (uint64_t)v11);
    if (v8)
      xpc_release(v8);
    *a3 = v13[3];
    v9 = *((unsigned int *)v17 + 6);
    _Block_object_dispose(&v12, 8);
    _Block_object_dispose(&v16, 8);
  }
  else
  {
    if (MBFLogInitOnce != -1)
      dispatch_once_f(&MBFLogInitOnce, 0, (dispatch_function_t)MBFLogInit);
    if (os_log_type_enabled((os_log_t)MBFLogComponent, OS_LOG_TYPE_ERROR))
      BTAccessoryManagerRegisterDevice_cold_1();
    return 1;
  }
  return v9;
}

uint64_t BTAccessoryManagerGetInEarDetectionEnable(uint64_t a1, uint64_t a2, _DWORD *a3)
{
  uint64_t MBXpcConnection;
  uint64_t v7;
  xpc_object_t v8;
  uint64_t v9;
  _QWORD v11[6];
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t *v17;
  uint64_t v18;
  uint64_t v19;

  if (MBFLogInitOnce != -1)
    dispatch_once_f(&MBFLogInitOnce, 0, (dispatch_function_t)MBFLogInit);
  if (os_log_type_enabled((os_log_t)MBFLogComponent, OS_LOG_TYPE_DEBUG))
    BTAccessoryManagerGetInEarDetectionEnable_cold_2();
  MBXpcConnection = getMBXpcConnection(a1);
  if (MBXpcConnection)
  {
    v7 = MBXpcConnection;
    v8 = xpc_dictionary_create(0, 0, 0);
    xpc_dictionary_set_uint64(v8, "kCBMsgArgAccessoryManagerID", a1);
    xpc_dictionary_set_uint64(v8, "kCBMsgArgBTDevice", a2);
    v16 = 0;
    v17 = &v16;
    v18 = 0x2000000000;
    v19 = 0;
    v12 = 0;
    v13 = &v12;
    v14 = 0x2000000000;
    v15 = 0;
    v11[0] = MEMORY[0x1E0C809B0];
    v11[1] = 0x40000000;
    v11[2] = __BTAccessoryManagerGetInEarDetectionEnable_block_invoke;
    v11[3] = &unk_1E6B051D0;
    v11[4] = &v16;
    v11[5] = &v12;
    sendMessageWithReplySync(v7, "kCBMsgIdAccessoryGetSecondSettingMsg", v8, (uint64_t)v11);
    if (v8)
      xpc_release(v8);
    *a3 = v13[3];
    v9 = *((unsigned int *)v17 + 6);
    _Block_object_dispose(&v12, 8);
    _Block_object_dispose(&v16, 8);
  }
  else
  {
    if (MBFLogInitOnce != -1)
      dispatch_once_f(&MBFLogInitOnce, 0, (dispatch_function_t)MBFLogInit);
    if (os_log_type_enabled((os_log_t)MBFLogComponent, OS_LOG_TYPE_ERROR))
      BTAccessoryManagerRegisterDevice_cold_1();
    return 1;
  }
  return v9;
}

uint64_t BTAccessoryManagerGetInEarStatus(uint64_t a1, uint64_t a2, _DWORD *a3, _DWORD *a4)
{
  uint64_t MBXpcConnection;
  uint64_t v9;
  xpc_object_t v10;
  uint64_t v11;
  _QWORD v13[7];
  uint64_t v14;
  uint64_t *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t *v23;
  uint64_t v24;
  uint64_t v25;

  if (MBFLogInitOnce != -1)
    dispatch_once_f(&MBFLogInitOnce, 0, (dispatch_function_t)MBFLogInit);
  if (os_log_type_enabled((os_log_t)MBFLogComponent, OS_LOG_TYPE_DEBUG))
    BTAccessoryManagerGetInEarStatus_cold_2();
  MBXpcConnection = getMBXpcConnection(a1);
  if (MBXpcConnection)
  {
    v9 = MBXpcConnection;
    v10 = xpc_dictionary_create(0, 0, 0);
    xpc_dictionary_set_uint64(v10, "kCBMsgArgAccessoryManagerID", a1);
    xpc_dictionary_set_uint64(v10, "kCBMsgArgBTDevice", a2);
    v22 = 0;
    v23 = &v22;
    v24 = 0x2000000000;
    v25 = 0;
    v18 = 0;
    v19 = &v18;
    v20 = 0x2000000000;
    v21 = 0;
    v14 = 0;
    v15 = &v14;
    v16 = 0x2000000000;
    v17 = 0;
    v13[0] = MEMORY[0x1E0C809B0];
    v13[1] = 0x40000000;
    v13[2] = __BTAccessoryManagerGetInEarStatus_block_invoke;
    v13[3] = &unk_1E6B051F8;
    v13[4] = &v22;
    v13[5] = &v18;
    v13[6] = &v14;
    sendMessageWithReplySync(v9, "kCBMsgIdAccessoryGetInEarStatusMsg", v10, (uint64_t)v13);
    if (v10)
      xpc_release(v10);
    *a3 = v19[3];
    *a4 = v15[3];
    v11 = *((unsigned int *)v23 + 6);
    _Block_object_dispose(&v14, 8);
    _Block_object_dispose(&v18, 8);
    _Block_object_dispose(&v22, 8);
  }
  else
  {
    if (MBFLogInitOnce != -1)
      dispatch_once_f(&MBFLogInitOnce, 0, (dispatch_function_t)MBFLogInit);
    if (os_log_type_enabled((os_log_t)MBFLogComponent, OS_LOG_TYPE_ERROR))
      BTAccessoryManagerRegisterDevice_cold_1();
    return 1;
  }
  return v11;
}

uint64_t BTAccessoryManagerRegisterCustomMessageClient(uint64_t a1, _QWORD *a2, unsigned int a3, uint64_t a4)
{
  uint64_t MBXpcConnection;
  uint64_t v9;
  xpc_object_t v10;
  uint64_t v11;
  _QWORD v13[5];
  uint64_t v14;
  uint64_t *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t value;

  MBXpcConnection = getMBXpcConnection(a1);
  if (MBFLogInitOnce != -1)
    dispatch_once_f(&MBFLogInitOnce, 0, (dispatch_function_t)MBFLogInit);
  if (os_log_type_enabled((os_log_t)MBFLogComponent, OS_LOG_TYPE_DEBUG))
  {
    BTAccessoryManagerRegisterCustomMessageClient_cold_4();
    if (MBXpcConnection)
    {
LABEL_5:
      if (_localBTAccessoryManagerCustomCallbacksRegistered(a1, a2, a3))
      {
        if (MBFLogInitOnce != -1)
          dispatch_once_f(&MBFLogInitOnce, 0, (dispatch_function_t)MBFLogInit);
        if (os_log_type_enabled((os_log_t)MBFLogComponent, OS_LOG_TYPE_DEBUG))
          BTAccessoryManagerAddCallbacks_cold_2();
        return 0;
      }
      else
      {
        value = 0;
        if (_localBTAccessoryManagerAddCustomCallbacks(a1, MBXpcConnection, a2, a3, a4, (uint64_t *)&value))
        {
          if (MBFLogInitOnce != -1)
            dispatch_once_f(&MBFLogInitOnce, 0, (dispatch_function_t)MBFLogInit);
          if (os_log_type_enabled((os_log_t)MBFLogComponent, OS_LOG_TYPE_DEBUG))
            BTAccessoryManagerRegisterCustomMessageClient_cold_3();
          return 4;
        }
        else
        {
          v10 = xpc_dictionary_create(0, 0, 0);
          xpc_dictionary_set_uint64(v10, "kCBMsgArgAccessoryManagerID", a1);
          xpc_dictionary_set_uint64(v10, "kCBMsgArgID", value);
          xpc_dictionary_set_uint64(v10, "kCBMsgArgEventType", a3);
          if (a4)
            v11 = 0;
          else
            v11 = 0xFFFFFFFFLL;
          xpc_dictionary_set_uint64(v10, "kCBMsgArgUserData", v11);
          v14 = 0;
          v15 = &v14;
          v16 = 0x2000000000;
          v17 = 0;
          v13[0] = MEMORY[0x1E0C809B0];
          v13[1] = 0x40000000;
          v13[2] = __BTAccessoryManagerRegisterCustomMessageClient_block_invoke;
          v13[3] = &unk_1E6B05220;
          v13[4] = &v14;
          sendMessageWithReplySync(MBXpcConnection, "kCBMsgIdAccessoryRegisterCustomMessageClientMsg", v10, (uint64_t)v13);
          if (v10)
            xpc_release(v10);
          if (v15[3])
          {
            _localBTAccessoryManagerRemoveCustomCallbacks(a1, a2);
            v9 = *((unsigned int *)v15 + 6);
          }
          else
          {
            v9 = 0;
          }
          _Block_object_dispose(&v14, 8);
        }
      }
      return v9;
    }
  }
  else if (MBXpcConnection)
  {
    goto LABEL_5;
  }
  if (MBFLogInitOnce != -1)
    dispatch_once_f(&MBFLogInitOnce, 0, (dispatch_function_t)MBFLogInit);
  if (os_log_type_enabled((os_log_t)MBFLogComponent, OS_LOG_TYPE_ERROR))
    BTAccessoryManagerAddCallbacks_cold_1();
  return 1;
}

uint64_t BTAccessoryManagerDeregisterCustomMessageClient(uint64_t a1, _QWORD *a2)
{
  uint64_t MBXpcConnection;
  uint64_t CustomCallbacksCBID;
  uint64_t v6;
  xpc_object_t v7;
  uint64_t v8;
  _QWORD v10[5];
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  uint64_t v14;

  if (MBFLogInitOnce != -1)
    dispatch_once_f(&MBFLogInitOnce, 0, (dispatch_function_t)MBFLogInit);
  if (os_log_type_enabled((os_log_t)MBFLogComponent, OS_LOG_TYPE_DEBUG))
    BTAccessoryManagerDeregisterCustomMessageClient_cold_3();
  MBXpcConnection = getMBXpcConnection(a1);
  if (MBFLogInitOnce != -1)
    dispatch_once_f(&MBFLogInitOnce, 0, (dispatch_function_t)MBFLogInit);
  if (os_log_type_enabled((os_log_t)MBFLogComponent, OS_LOG_TYPE_DEBUG))
  {
    BTAccessoryManagerRemoveCallbacks_cold_2();
    if (MBXpcConnection)
    {
LABEL_9:
      CustomCallbacksCBID = _localBTAccessoryManagerGetCustomCallbacksCBID(a1, a2);
      v11 = 0;
      v12 = &v11;
      v13 = 0x2000000000;
      v14 = 3;
      if (CustomCallbacksCBID)
      {
        v6 = CustomCallbacksCBID;
        _localBTAccessoryManagerRemoveCustomCallbacks(a1, a2);
        v7 = xpc_dictionary_create(0, 0, 0);
        xpc_dictionary_set_uint64(v7, "kCBMsgArgAccessoryManagerID", a1);
        xpc_dictionary_set_uint64(v7, "kCBMsgArgID", v6);
        v10[0] = MEMORY[0x1E0C809B0];
        v10[1] = 0x40000000;
        v10[2] = __BTAccessoryManagerDeregisterCustomMessageClient_block_invoke;
        v10[3] = &unk_1E6B05248;
        v10[4] = &v11;
        sendMessageWithReplySync(MBXpcConnection, "kCBMsgIdAccessoryDeregisterCustomMessageClientMsg", v7, (uint64_t)v10);
        if (v7)
          xpc_release(v7);
      }
      v8 = *((unsigned int *)v12 + 6);
      _Block_object_dispose(&v11, 8);
      return v8;
    }
  }
  else if (MBXpcConnection)
  {
    goto LABEL_9;
  }
  if (MBFLogInitOnce != -1)
    dispatch_once_f(&MBFLogInitOnce, 0, (dispatch_function_t)MBFLogInit);
  if (os_log_type_enabled((os_log_t)MBFLogComponent, OS_LOG_TYPE_ERROR))
    BTAccessoryManagerRemoveCallbacks_cold_1();
  return 1;
}

uint64_t BTAccessoryManagerSendCustomMessage(uint64_t a1, unsigned int a2, uint64_t a3, const void *a4, size_t a5)
{
  uint64_t MBXpcConnection;
  uint64_t v11;
  xpc_object_t v12;
  uint64_t v13;
  _QWORD v15[5];
  uint64_t v16;
  uint64_t *v17;
  uint64_t v18;
  uint64_t v19;

  if (MBFLogInitOnce != -1)
    dispatch_once_f(&MBFLogInitOnce, 0, (dispatch_function_t)MBFLogInit);
  if (os_log_type_enabled((os_log_t)MBFLogComponent, OS_LOG_TYPE_DEBUG))
    BTAccessoryManagerSendCustomMessage_cold_2();
  MBXpcConnection = getMBXpcConnection(a1);
  if (MBXpcConnection)
  {
    v11 = MBXpcConnection;
    v12 = xpc_dictionary_create(0, 0, 0);
    xpc_dictionary_set_uint64(v12, "kCBMsgArgAccessoryManagerID", a1);
    xpc_dictionary_set_uint64(v12, "kCBMsgArgBTDevice", a3);
    xpc_dictionary_set_uint64(v12, "kCBMsgArgClientType", a2);
    xpc_dictionary_set_data(v12, "kCBMsgArgData", a4, a5);
    v16 = 0;
    v17 = &v16;
    v18 = 0x2000000000;
    v19 = 0;
    v15[0] = MEMORY[0x1E0C809B0];
    v15[1] = 0x40000000;
    v15[2] = __BTAccessoryManagerSendCustomMessage_block_invoke;
    v15[3] = &unk_1E6B05270;
    v15[4] = &v16;
    sendMessageWithReplySync(v11, "kCBMsgIdAccessorySendCustomMessageMsg", v12, (uint64_t)v15);
    if (v12)
      xpc_release(v12);
    v13 = *((unsigned int *)v17 + 6);
    _Block_object_dispose(&v16, 8);
  }
  else
  {
    if (MBFLogInitOnce != -1)
      dispatch_once_f(&MBFLogInitOnce, 0, (dispatch_function_t)MBFLogInit);
    if (os_log_type_enabled((os_log_t)MBFLogComponent, OS_LOG_TYPE_ERROR))
      BTAccessoryManagerRegisterDevice_cold_1();
    return 1;
  }
  return v13;
}

uint64_t BTAccessoryManagerSendAdaptiveVolumeMessage(uint64_t a1, uint64_t a2, unsigned int a3, const void *a4)
{
  uint64_t MBXpcConnection;
  uint64_t v9;
  xpc_object_t v10;
  uint64_t v11;
  _QWORD v13[5];
  uint64_t v14;
  uint64_t *v15;
  uint64_t v16;
  uint64_t v17;

  if (MBFLogInitOnce != -1)
    dispatch_once_f(&MBFLogInitOnce, 0, (dispatch_function_t)MBFLogInit);
  if (os_log_type_enabled((os_log_t)MBFLogComponent, OS_LOG_TYPE_DEBUG))
    BTAccessoryManagerSendAdaptiveVolumeMessage_cold_2();
  MBXpcConnection = getMBXpcConnection(a1);
  if (MBXpcConnection)
  {
    v9 = MBXpcConnection;
    v10 = xpc_dictionary_create(0, 0, 0);
    xpc_dictionary_set_uint64(v10, "kCBMsgArgAccessoryManagerID", a1);
    xpc_dictionary_set_uint64(v10, "kCBMsgArgBTDevice", a2);
    xpc_dictionary_set_uint64(v10, "kCBMsgArgAVMsgLen", a3);
    xpc_dictionary_set_data(v10, "kCBMsgArgData", a4, a3);
    v14 = 0;
    v15 = &v14;
    v16 = 0x2000000000;
    v17 = 0;
    v13[0] = MEMORY[0x1E0C809B0];
    v13[1] = 0x40000000;
    v13[2] = __BTAccessoryManagerSendAdaptiveVolumeMessage_block_invoke;
    v13[3] = &unk_1E6B05298;
    v13[4] = &v14;
    sendMessageWithReplySync(v9, "kCBMsgIdAccessorySendAdaptiveVolumeMessageMsg", v10, (uint64_t)v13);
    if (v10)
      xpc_release(v10);
    v11 = *((unsigned int *)v15 + 6);
    _Block_object_dispose(&v14, 8);
  }
  else
  {
    if (MBFLogInitOnce != -1)
      dispatch_once_f(&MBFLogInitOnce, 0, (dispatch_function_t)MBFLogInit);
    if (os_log_type_enabled((os_log_t)MBFLogComponent, OS_LOG_TYPE_ERROR))
      BTAccessoryManagerRegisterDevice_cold_1();
    return 1;
  }
  return v11;
}

uint64_t BTAccessoryManagerSendPMEConfigMessage(uint64_t a1, uint64_t a2, unsigned int a3, const void *a4)
{
  uint64_t MBXpcConnection;
  uint64_t v9;
  xpc_object_t v10;
  uint64_t v11;
  _QWORD v13[5];
  uint64_t v14;
  uint64_t *v15;
  uint64_t v16;
  uint64_t v17;

  if (MBFLogInitOnce != -1)
    dispatch_once_f(&MBFLogInitOnce, 0, (dispatch_function_t)MBFLogInit);
  if (os_log_type_enabled((os_log_t)MBFLogComponent, OS_LOG_TYPE_DEBUG))
    BTAccessoryManagerSendPMEConfigMessage_cold_2();
  MBXpcConnection = getMBXpcConnection(a1);
  if (MBXpcConnection)
  {
    v9 = MBXpcConnection;
    v10 = xpc_dictionary_create(0, 0, 0);
    xpc_dictionary_set_uint64(v10, "kCBMsgArgAccessoryManagerID", a1);
    xpc_dictionary_set_uint64(v10, "kCBMsgArgBTDevice", a2);
    xpc_dictionary_set_uint64(v10, "kCBMsgArgPMEMsgLen", a3);
    xpc_dictionary_set_data(v10, "kCBMsgArgData", a4, a3);
    v14 = 0;
    v15 = &v14;
    v16 = 0x2000000000;
    v17 = 0;
    v13[0] = MEMORY[0x1E0C809B0];
    v13[1] = 0x40000000;
    v13[2] = __BTAccessoryManagerSendPMEConfigMessage_block_invoke;
    v13[3] = &unk_1E6B052C0;
    v13[4] = &v14;
    sendMessageWithReplySync(v9, "kCBMsgIdAccessorySendPMEConfigMessageMsg", v10, (uint64_t)v13);
    if (v10)
      xpc_release(v10);
    v11 = *((unsigned int *)v15 + 6);
    _Block_object_dispose(&v14, 8);
  }
  else
  {
    if (MBFLogInitOnce != -1)
      dispatch_once_f(&MBFLogInitOnce, 0, (dispatch_function_t)MBFLogInit);
    if (os_log_type_enabled((os_log_t)MBFLogComponent, OS_LOG_TYPE_ERROR))
      BTAccessoryManagerRegisterDevice_cold_1();
    return 1;
  }
  return v11;
}

uint64_t BTAccessoryManagerGetDeviceDiagnostics(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t *a4, uint64_t a5)
{
  uint64_t MBXpcConnection;
  uint64_t v11;
  xpc_object_t v12;
  uint64_t v13;
  uint64_t v14;
  _QWORD v16[8];
  uint64_t v17;
  uint64_t *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t *v22;
  uint64_t v23;
  uint64_t v24;

  if (MBFLogInitOnce != -1)
    dispatch_once_f(&MBFLogInitOnce, 0, (dispatch_function_t)MBFLogInit);
  if (os_log_type_enabled((os_log_t)MBFLogComponent, OS_LOG_TYPE_DEBUG))
    BTAccessoryManagerGetDeviceDiagnostics_cold_2();
  MBXpcConnection = getMBXpcConnection(a1);
  if (MBXpcConnection)
  {
    v11 = MBXpcConnection;
    v12 = xpc_dictionary_create(0, 0, 0);
    xpc_dictionary_set_uint64(v12, "kCBMsgArgAccessoryManagerID", a1);
    xpc_dictionary_set_uint64(v12, "kCBMsgArgBTDevice", a2);
    xpc_dictionary_set_uint64(v12, "kCBMsgArgBufferSize", a5);
    v21 = 0;
    v22 = &v21;
    v23 = 0x2000000000;
    v24 = 0;
    v17 = 0;
    v18 = &v17;
    v19 = 0x2000000000;
    v20 = 0;
    v16[0] = MEMORY[0x1E0C809B0];
    v16[1] = 0x40000000;
    v16[2] = __BTAccessoryManagerGetDeviceDiagnostics_block_invoke;
    v16[3] = &unk_1E6B052E8;
    v16[4] = &v21;
    v16[5] = &v17;
    v16[6] = a3;
    v16[7] = a5;
    sendMessageWithReplySync(v11, "kCBMsgIdAccessoryGetDeviceDiagnosticsMsg", v12, (uint64_t)v16);
    if (v12)
      xpc_release(v12);
    v13 = v18[3];
    if (v13 >= a5)
      v13 = a5;
    *a4 = v13;
    v14 = *((unsigned int *)v22 + 6);
    _Block_object_dispose(&v17, 8);
    _Block_object_dispose(&v21, 8);
  }
  else
  {
    if (MBFLogInitOnce != -1)
      dispatch_once_f(&MBFLogInitOnce, 0, (dispatch_function_t)MBFLogInit);
    if (os_log_type_enabled((os_log_t)MBFLogComponent, OS_LOG_TYPE_ERROR))
      BTAccessoryManagerRegisterDevice_cold_1();
    return 1;
  }
  return v14;
}

uint64_t BTAccessoryManagerSendRequestPeriodically(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t MBXpcConnection;
  uint64_t v9;
  xpc_object_t v10;
  uint64_t v11;
  _QWORD v13[5];
  uint64_t v14;
  uint64_t *v15;
  uint64_t v16;
  uint64_t v17;

  if (MBFLogInitOnce != -1)
    dispatch_once_f(&MBFLogInitOnce, 0, (dispatch_function_t)MBFLogInit);
  if (os_log_type_enabled((os_log_t)MBFLogComponent, OS_LOG_TYPE_DEBUG))
    BTAccessoryManagerSendRequestPeriodically_cold_2();
  MBXpcConnection = getMBXpcConnection(a1);
  if (MBXpcConnection)
  {
    v9 = MBXpcConnection;
    v10 = xpc_dictionary_create(0, 0, 0);
    xpc_dictionary_set_uint64(v10, "kCBMsgArgAccessoryManagerID", a1);
    xpc_dictionary_set_uint64(v10, "kCBMsgArgBTDevice", a2);
    xpc_dictionary_set_uint64(v10, "kCBMsgArgType", a3);
    xpc_dictionary_set_uint64(v10, "kCBMsgArgInterval", a4);
    v14 = 0;
    v15 = &v14;
    v16 = 0x2000000000;
    v17 = 0;
    v13[0] = MEMORY[0x1E0C809B0];
    v13[1] = 0x40000000;
    v13[2] = __BTAccessoryManagerSendRequestPeriodically_block_invoke;
    v13[3] = &unk_1E6B05310;
    v13[4] = &v14;
    sendMessageWithReplySync(v9, "kCBMsgIdAccessorySendRequestPeriodicallyMsg", v10, (uint64_t)v13);
    if (v10)
      xpc_release(v10);
    v11 = *((unsigned int *)v15 + 6);
    _Block_object_dispose(&v14, 8);
  }
  else
  {
    if (MBFLogInitOnce != -1)
      dispatch_once_f(&MBFLogInitOnce, 0, (dispatch_function_t)MBFLogInit);
    if (os_log_type_enabled((os_log_t)MBFLogComponent, OS_LOG_TYPE_ERROR))
      BTAccessoryManagerRegisterDevice_cold_1();
    return 1;
  }
  return v11;
}

uint64_t BTAccessoryManagerCancelRequestPeriodically(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t MBXpcConnection;
  uint64_t v7;
  xpc_object_t v8;
  uint64_t v9;
  _QWORD v11[5];
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t v15;

  if (MBFLogInitOnce != -1)
    dispatch_once_f(&MBFLogInitOnce, 0, (dispatch_function_t)MBFLogInit);
  if (os_log_type_enabled((os_log_t)MBFLogComponent, OS_LOG_TYPE_DEBUG))
    BTAccessoryManagerCancelRequestPeriodically_cold_2();
  MBXpcConnection = getMBXpcConnection(a1);
  if (MBXpcConnection)
  {
    v7 = MBXpcConnection;
    v8 = xpc_dictionary_create(0, 0, 0);
    xpc_dictionary_set_uint64(v8, "kCBMsgArgAccessoryManagerID", a1);
    xpc_dictionary_set_uint64(v8, "kCBMsgArgBTDevice", a2);
    xpc_dictionary_set_uint64(v8, "kCBMsgArgType", a3);
    v12 = 0;
    v13 = &v12;
    v14 = 0x2000000000;
    v15 = 0;
    v11[0] = MEMORY[0x1E0C809B0];
    v11[1] = 0x40000000;
    v11[2] = __BTAccessoryManagerCancelRequestPeriodically_block_invoke;
    v11[3] = &unk_1E6B05338;
    v11[4] = &v12;
    sendMessageWithReplySync(v7, "kCBMsgIdAccessoryCancelRequestPeriodicallyMsg", v8, (uint64_t)v11);
    if (v8)
      xpc_release(v8);
    v9 = *((unsigned int *)v13 + 6);
    _Block_object_dispose(&v12, 8);
  }
  else
  {
    if (MBFLogInitOnce != -1)
      dispatch_once_f(&MBFLogInitOnce, 0, (dispatch_function_t)MBFLogInit);
    if (os_log_type_enabled((os_log_t)MBFLogComponent, OS_LOG_TYPE_ERROR))
      BTAccessoryManagerRegisterDevice_cold_1();
    return 1;
  }
  return v9;
}

uint64_t BTAccessoryManagerSendControlCommand(uint64_t a1, uint64_t a2, unsigned int a3, unsigned int a4)
{
  uint64_t MBXpcConnection;
  uint64_t v9;
  xpc_object_t v10;
  uint64_t v11;
  _QWORD v13[5];
  uint64_t v14;
  uint64_t *v15;
  uint64_t v16;
  uint64_t v17;

  if (MBFLogInitOnce != -1)
    dispatch_once_f(&MBFLogInitOnce, 0, (dispatch_function_t)MBFLogInit);
  if (os_log_type_enabled((os_log_t)MBFLogComponent, OS_LOG_TYPE_DEBUG))
    BTAccessoryManagerSendControlCommand_cold_2();
  MBXpcConnection = getMBXpcConnection(a1);
  if (MBXpcConnection)
  {
    v9 = MBXpcConnection;
    v10 = xpc_dictionary_create(0, 0, 0);
    xpc_dictionary_set_uint64(v10, "kCBMsgArgAccessoryManagerID", a1);
    xpc_dictionary_set_uint64(v10, "kCBMsgArgBTDevice", a2);
    xpc_dictionary_set_uint64(v10, "kCBMsgArgValue", a4);
    xpc_dictionary_set_uint64(v10, "kCBMsgArgType", a3);
    v14 = 0;
    v15 = &v14;
    v16 = 0x2000000000;
    v17 = 0;
    v13[0] = MEMORY[0x1E0C809B0];
    v13[1] = 0x40000000;
    v13[2] = __BTAccessoryManagerSendControlCommand_block_invoke;
    v13[3] = &unk_1E6B05360;
    v13[4] = &v14;
    sendMessageWithReplySync(v9, "kCBMsgIdAccessorySendControlCommandMsg", v10, (uint64_t)v13);
    if (v10)
      xpc_release(v10);
    v11 = *((unsigned int *)v15 + 6);
    _Block_object_dispose(&v14, 8);
  }
  else
  {
    if (MBFLogInitOnce != -1)
      dispatch_once_f(&MBFLogInitOnce, 0, (dispatch_function_t)MBFLogInit);
    if (os_log_type_enabled((os_log_t)MBFLogComponent, OS_LOG_TYPE_ERROR))
      BTAccessoryManagerRegisterDevice_cold_1();
    return 1;
  }
  return v11;
}

uint64_t BTAccessoryManagerGetControlCommand(uint64_t a1, uint64_t a2, unsigned int a3, unsigned int a4, _DWORD *a5)
{
  uint64_t MBXpcConnection;
  uint64_t v11;
  xpc_object_t v12;
  uint64_t v13;
  _QWORD v15[6];
  uint64_t v16;
  uint64_t *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t *v21;
  uint64_t v22;
  uint64_t v23;

  if (MBFLogInitOnce != -1)
    dispatch_once_f(&MBFLogInitOnce, 0, (dispatch_function_t)MBFLogInit);
  if (os_log_type_enabled((os_log_t)MBFLogComponent, OS_LOG_TYPE_DEBUG))
    BTAccessoryManagerGetControlCommand_cold_2();
  MBXpcConnection = getMBXpcConnection(a1);
  if (MBXpcConnection)
  {
    v11 = MBXpcConnection;
    v12 = xpc_dictionary_create(0, 0, 0);
    xpc_dictionary_set_uint64(v12, "kCBMsgArgAccessoryManagerID", a1);
    xpc_dictionary_set_uint64(v12, "kCBMsgArgBTDevice", a2);
    xpc_dictionary_set_uint64(v12, "kCBMsgArgType", a3);
    xpc_dictionary_set_uint64(v12, "kCBMsgArgSubType", a4);
    v20 = 0;
    v21 = &v20;
    v22 = 0x2000000000;
    v23 = 0;
    v16 = 0;
    v17 = &v16;
    v18 = 0x2000000000;
    v19 = 0;
    v15[0] = MEMORY[0x1E0C809B0];
    v15[1] = 0x40000000;
    v15[2] = __BTAccessoryManagerGetControlCommand_block_invoke;
    v15[3] = &unk_1E6B05388;
    v15[4] = &v20;
    v15[5] = &v16;
    sendMessageWithReplySync(v11, "kCBMsgIdAccessoryGetControlCommandMsg", v12, (uint64_t)v15);
    if (v12)
      xpc_release(v12);
    *a5 = v17[3];
    v13 = *((unsigned int *)v21 + 6);
    _Block_object_dispose(&v16, 8);
    _Block_object_dispose(&v20, 8);
  }
  else
  {
    if (MBFLogInitOnce != -1)
      dispatch_once_f(&MBFLogInitOnce, 0, (dispatch_function_t)MBFLogInit);
    if (os_log_type_enabled((os_log_t)MBFLogComponent, OS_LOG_TYPE_ERROR))
      BTAccessoryManagerRegisterDevice_cold_1();
    return 1;
  }
  return v13;
}

uint64_t BTAccessoryManagerGetSettingFeatureBitMask(uint64_t a1, uint64_t a2, _DWORD *a3)
{
  uint64_t MBXpcConnection;
  uint64_t v7;
  xpc_object_t v8;
  uint64_t v9;
  _QWORD v11[6];
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t *v17;
  uint64_t v18;
  uint64_t v19;

  if (MBFLogInitOnce != -1)
    dispatch_once_f(&MBFLogInitOnce, 0, (dispatch_function_t)MBFLogInit);
  if (os_log_type_enabled((os_log_t)MBFLogComponent, OS_LOG_TYPE_DEBUG))
    BTAccessoryManagerGetSettingFeatureBitMask_cold_2();
  MBXpcConnection = getMBXpcConnection(a1);
  if (MBXpcConnection)
  {
    v7 = MBXpcConnection;
    v8 = xpc_dictionary_create(0, 0, 0);
    xpc_dictionary_set_uint64(v8, "kCBMsgArgAccessoryManagerID", a1);
    xpc_dictionary_set_uint64(v8, "kCBMsgArgBTDevice", a2);
    v16 = 0;
    v17 = &v16;
    v18 = 0x2000000000;
    v19 = 0;
    v12 = 0;
    v13 = &v12;
    v14 = 0x2000000000;
    v15 = 0;
    v11[0] = MEMORY[0x1E0C809B0];
    v11[1] = 0x40000000;
    v11[2] = __BTAccessoryManagerGetSettingFeatureBitMask_block_invoke;
    v11[3] = &unk_1E6B053B0;
    v11[4] = &v16;
    v11[5] = &v12;
    sendMessageWithReplySync(v7, "kCBMsgIdAccessoryGetSettingFeatureBitMaskMsg", v8, (uint64_t)v11);
    if (v8)
      xpc_release(v8);
    *a3 = v13[3];
    v9 = *((unsigned int *)v17 + 6);
    _Block_object_dispose(&v12, 8);
    _Block_object_dispose(&v16, 8);
  }
  else
  {
    if (MBFLogInitOnce != -1)
      dispatch_once_f(&MBFLogInitOnce, 0, (dispatch_function_t)MBFLogInit);
    if (os_log_type_enabled((os_log_t)MBFLogComponent, OS_LOG_TYPE_ERROR))
      BTAccessoryManagerRegisterDevice_cold_1();
    return 1;
  }
  return v9;
}

uint64_t BTAccessoryManagerGetAccessoryInfo(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t *a4, uint64_t a5)
{
  uint64_t MBXpcConnection;
  uint64_t v11;
  xpc_object_t v12;
  uint64_t v13;
  uint64_t v14;
  _QWORD v16[8];
  uint64_t v17;
  uint64_t *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t *v22;
  uint64_t v23;
  uint64_t v24;

  if (MBFLogInitOnce != -1)
    dispatch_once_f(&MBFLogInitOnce, 0, (dispatch_function_t)MBFLogInit);
  if (os_log_type_enabled((os_log_t)MBFLogComponent, OS_LOG_TYPE_DEBUG))
    BTAccessoryManagerGetAccessoryInfo_cold_2();
  MBXpcConnection = getMBXpcConnection(a1);
  if (MBXpcConnection)
  {
    v11 = MBXpcConnection;
    v12 = xpc_dictionary_create(0, 0, 0);
    xpc_dictionary_set_uint64(v12, "kCBMsgArgAccessoryManagerID", a1);
    xpc_dictionary_set_uint64(v12, "kCBMsgArgBTDevice", a2);
    xpc_dictionary_set_uint64(v12, "kCBMsgArgBufferSize", a5);
    v21 = 0;
    v22 = &v21;
    v23 = 0x2000000000;
    v24 = 0;
    v17 = 0;
    v18 = &v17;
    v19 = 0x2000000000;
    v20 = 0;
    v16[0] = MEMORY[0x1E0C809B0];
    v16[1] = 0x40000000;
    v16[2] = __BTAccessoryManagerGetAccessoryInfo_block_invoke;
    v16[3] = &unk_1E6B053D8;
    v16[4] = &v21;
    v16[5] = &v17;
    v16[6] = a3;
    v16[7] = a5;
    sendMessageWithReplySync(v11, "kCBMsgIdAccessoryGetAccessoryInfoMsg", v12, (uint64_t)v16);
    if (v12)
      xpc_release(v12);
    v13 = v18[3];
    if (v13 >= a5)
      v13 = a5;
    *a4 = v13;
    v14 = *((unsigned int *)v22 + 6);
    _Block_object_dispose(&v17, 8);
    _Block_object_dispose(&v21, 8);
  }
  else
  {
    if (MBFLogInitOnce != -1)
      dispatch_once_f(&MBFLogInitOnce, 0, (dispatch_function_t)MBFLogInit);
    if (os_log_type_enabled((os_log_t)MBFLogComponent, OS_LOG_TYPE_ERROR))
      BTAccessoryManagerRegisterDevice_cold_1();
    return 1;
  }
  return v14;
}

uint64_t BTAccessoryManagerGetAACPCapabilityBits(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t *a4, uint64_t a5)
{
  uint64_t MBXpcConnection;
  uint64_t v11;
  xpc_object_t v12;
  uint64_t v13;
  uint64_t v14;
  _QWORD v16[8];
  uint64_t v17;
  uint64_t *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t *v22;
  uint64_t v23;
  uint64_t v24;

  if (MBFLogInitOnce != -1)
    dispatch_once_f(&MBFLogInitOnce, 0, (dispatch_function_t)MBFLogInit);
  if (os_log_type_enabled((os_log_t)MBFLogComponent, OS_LOG_TYPE_DEBUG))
    BTAccessoryManagerGetAACPCapabilityBits_cold_2();
  MBXpcConnection = getMBXpcConnection(a1);
  if (MBXpcConnection)
  {
    v11 = MBXpcConnection;
    v12 = xpc_dictionary_create(0, 0, 0);
    xpc_dictionary_set_uint64(v12, "kCBMsgArgAccessoryManagerID", a1);
    xpc_dictionary_set_uint64(v12, "kCBMsgArgBTDevice", a2);
    xpc_dictionary_set_uint64(v12, "kCBMsgArgBufferSize", a5);
    v21 = 0;
    v22 = &v21;
    v23 = 0x2000000000;
    v24 = 0;
    v17 = 0;
    v18 = &v17;
    v19 = 0x2000000000;
    v20 = 0;
    v16[0] = MEMORY[0x1E0C809B0];
    v16[1] = 0x40000000;
    v16[2] = __BTAccessoryManagerGetAACPCapabilityBits_block_invoke;
    v16[3] = &unk_1E6B05400;
    v16[4] = &v21;
    v16[5] = &v17;
    v16[6] = a3;
    v16[7] = a5;
    sendMessageWithReplySync(v11, "kCBMsgIdAccessoryGetAACPCapabilityBitsMsg", v12, (uint64_t)v16);
    if (v12)
      xpc_release(v12);
    v13 = v18[3];
    if (v13 >= a5)
      v13 = a5;
    *a4 = v13;
    v14 = *((unsigned int *)v22 + 6);
    _Block_object_dispose(&v17, 8);
    _Block_object_dispose(&v21, 8);
  }
  else
  {
    if (MBFLogInitOnce != -1)
      dispatch_once_f(&MBFLogInitOnce, 0, (dispatch_function_t)MBFLogInit);
    if (os_log_type_enabled((os_log_t)MBFLogComponent, OS_LOG_TYPE_ERROR))
      BTAccessoryManagerRegisterDevice_cold_1();
    return 1;
  }
  return v14;
}

uint64_t BTAccessoryManagerGetAACPCapabilityInteger(uint64_t a1, uint64_t a2, unsigned int a3, _DWORD *a4)
{
  NSObject *v8;
  uint64_t MBXpcConnection;
  uint64_t v10;
  xpc_object_t v11;
  uint64_t v12;
  _QWORD v14[6];
  unsigned int v15;
  uint64_t v16;
  uint64_t *v17;
  uint64_t v18;
  uint64_t v19;
  uint8_t buf[8];
  uint8_t *v21;
  uint64_t v22;
  uint64_t v23;

  if (MBFLogInitOnce != -1)
    dispatch_once_f(&MBFLogInitOnce, 0, (dispatch_function_t)MBFLogInit);
  v8 = MBFLogComponent;
  if (os_log_type_enabled((os_log_t)MBFLogComponent, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1B6BF1000, v8, OS_LOG_TYPE_DEFAULT, "BTAccessoryManagerGetAACPCapabilityInteger over XPC", buf, 2u);
  }
  MBXpcConnection = getMBXpcConnection(a1);
  if (MBXpcConnection)
  {
    v10 = MBXpcConnection;
    v11 = xpc_dictionary_create(0, 0, 0);
    xpc_dictionary_set_uint64(v11, "kCBMsgArgAccessoryManagerID", a1);
    xpc_dictionary_set_uint64(v11, "kCBMsgArgBTDevice", a2);
    xpc_dictionary_set_uint64(v11, "kCBMsgArgAACPCapabilityInteger", a3);
    *(_QWORD *)buf = 0;
    v21 = buf;
    v22 = 0x2000000000;
    v23 = 0;
    v16 = 0;
    v17 = &v16;
    v18 = 0x2000000000;
    v19 = 0;
    v14[0] = MEMORY[0x1E0C809B0];
    v14[1] = 0x40000000;
    v14[2] = __BTAccessoryManagerGetAACPCapabilityInteger_block_invoke;
    v14[3] = &unk_1E6B05428;
    v14[4] = buf;
    v14[5] = &v16;
    v15 = a3;
    sendMessageWithReplySync(v10, "kCBMsgIdAccessoryGetAACPCapabilityIntegerMsg", v11, (uint64_t)v14);
    if (v11)
      xpc_release(v11);
    *a4 = v17[3];
    v12 = *((unsigned int *)v21 + 6);
    _Block_object_dispose(&v16, 8);
    _Block_object_dispose(buf, 8);
  }
  else
  {
    if (MBFLogInitOnce != -1)
      dispatch_once_f(&MBFLogInitOnce, 0, (dispatch_function_t)MBFLogInit);
    if (os_log_type_enabled((os_log_t)MBFLogComponent, OS_LOG_TYPE_ERROR))
      BTAccessoryManagerRegisterDevice_cold_1();
    return 1;
  }
  return v12;
}

uint64_t BTAccessoryManagerReadDeviceVersionInfo(uint64_t a1, _BYTE *a2, uint64_t a3, _BYTE *a4, uint64_t a5, _BYTE *a6, uint64_t a7, _BYTE *a8, uint64_t a9, _BYTE *a10, uint64_t a11, _BYTE *a12, uint64_t a13, _BYTE *a14, uint64_t a15)
{
  uint64_t MBXpcConnection;
  uint64_t v22;
  xpc_object_t v23;
  uint64_t v24;
  _BYTE *v28;
  _QWORD v29[19];
  uint64_t v30;
  uint64_t *v31;
  uint64_t v32;
  uint64_t v33;

  *a2 = 0;
  *a4 = 0;
  *a6 = 0;
  *a8 = 0;
  *a10 = 0;
  *a12 = 0;
  *a14 = 0;
  getFirstSessionHandle();
  v28 = a6;
  if (MBFLogInitOnce != -1)
    dispatch_once_f(&MBFLogInitOnce, 0, (dispatch_function_t)MBFLogInit);
  if (os_log_type_enabled((os_log_t)MBFLogComponent, OS_LOG_TYPE_DEBUG))
    BTAccessoryManagerReadDeviceVersionInfo_cold_2();
  MBXpcConnection = getMBXpcConnection(0);
  if (MBXpcConnection)
  {
    v22 = MBXpcConnection;
    v23 = xpc_dictionary_create(0, 0, 0);
    xpc_dictionary_set_uint64(v23, "kCBMsgArgBTDevice", a1);
    xpc_dictionary_set_uint64(v23, "kCBMsgArgAddressStringBuffSize", a3);
    xpc_dictionary_set_uint64(v23, "kCBMsgArgNameBuffSize", a5);
    xpc_dictionary_set_uint64(v23, "kCBMsgArgManufacturerBuffSize", a7);
    xpc_dictionary_set_uint64(v23, "kCBMsgArgModelNumberBuffSize", a9);
    xpc_dictionary_set_uint64(v23, "kCBMsgArgSerialNumberBuffSize", a11);
    xpc_dictionary_set_uint64(v23, "kCBMsgArgFWVersionBuffSize", a13);
    xpc_dictionary_set_uint64(v23, "kCBMsgArgHWVersionBuffSize", a15);
    v30 = 0;
    v31 = &v30;
    v32 = 0x2000000000;
    v33 = 0;
    v29[0] = MEMORY[0x1E0C809B0];
    v29[1] = 0x40000000;
    v29[2] = __BTAccessoryManagerReadDeviceVersionInfo_block_invoke;
    v29[3] = &unk_1E6B05450;
    v29[4] = &v30;
    v29[5] = a2;
    v29[6] = a3;
    v29[7] = a4;
    v29[8] = a5;
    v29[9] = v28;
    v29[10] = a7;
    v29[11] = a8;
    v29[12] = a9;
    v29[13] = a10;
    v29[14] = a11;
    v29[15] = a12;
    v29[16] = a13;
    v29[17] = a14;
    v29[18] = a15;
    sendMessageWithReplySync(v22, "kCBMsgIdAccessoryReadDeviceVersionInfoMsg", v23, (uint64_t)v29);
    if (v23)
      xpc_release(v23);
    v24 = *((unsigned int *)v31 + 6);
    _Block_object_dispose(&v30, 8);
  }
  else
  {
    if (MBFLogInitOnce != -1)
      dispatch_once_f(&MBFLogInitOnce, 0, (dispatch_function_t)MBFLogInit);
    if (os_log_type_enabled((os_log_t)MBFLogComponent, OS_LOG_TYPE_ERROR))
      BTAccessoryManagerReadDeviceVersionInfo_cold_1();
    return 1;
  }
  return v24;
}

uint64_t BTAccessoryManagerGetWirelessSharingSpatial(uint64_t a1, uint64_t a2, _DWORD *a3)
{
  NSObject *v6;
  uint64_t MBXpcConnection;
  uint64_t v8;
  xpc_object_t v9;
  uint64_t v10;
  _QWORD v12[6];
  uint64_t v13;
  uint64_t *v14;
  uint64_t v15;
  uint64_t v16;
  uint8_t buf[8];
  uint8_t *v18;
  uint64_t v19;
  uint64_t v20;

  if (MBFLogInitOnce != -1)
    dispatch_once_f(&MBFLogInitOnce, 0, (dispatch_function_t)MBFLogInit);
  v6 = MBFLogComponent;
  if (os_log_type_enabled((os_log_t)MBFLogComponent, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1B6BF1000, v6, OS_LOG_TYPE_DEFAULT, "BTAccessoryManagerGetWirelessSharingSpatial over XPC", buf, 2u);
  }
  MBXpcConnection = getMBXpcConnection(a1);
  if (MBXpcConnection)
  {
    v8 = MBXpcConnection;
    v9 = xpc_dictionary_create(0, 0, 0);
    xpc_dictionary_set_uint64(v9, "kCBMsgArgAccessoryManagerID", a1);
    xpc_dictionary_set_uint64(v9, "kCBMsgArgBTDevice", a2);
    *(_QWORD *)buf = 0;
    v18 = buf;
    v19 = 0x2000000000;
    v20 = 0;
    v13 = 0;
    v14 = &v13;
    v15 = 0x2000000000;
    v16 = 0;
    v12[0] = MEMORY[0x1E0C809B0];
    v12[1] = 0x40000000;
    v12[2] = __BTAccessoryManagerGetWirelessSharingSpatial_block_invoke;
    v12[3] = &unk_1E6B05478;
    v12[4] = buf;
    v12[5] = &v13;
    sendMessageWithReplySync(v8, "kCBMsgIdAccessoryGetWirelessSharingSpatialMsg", v9, (uint64_t)v12);
    if (v9)
      xpc_release(v9);
    *a3 = v14[3];
    v10 = *((unsigned int *)v18 + 6);
    _Block_object_dispose(&v13, 8);
    _Block_object_dispose(buf, 8);
  }
  else
  {
    if (MBFLogInitOnce != -1)
      dispatch_once_f(&MBFLogInitOnce, 0, (dispatch_function_t)MBFLogInit);
    if (os_log_type_enabled((os_log_t)MBFLogComponent, OS_LOG_TYPE_ERROR))
      BTAccessoryManagerRegisterDevice_cold_1();
    return 1;
  }
  return v10;
}

uint64_t BTAccessoryManagerGetDeviceColor(uint64_t a1, uint64_t a2, _DWORD *a3)
{
  uint64_t MBXpcConnection;
  uint64_t v7;
  xpc_object_t v8;
  uint64_t v9;
  _QWORD v11[6];
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t *v17;
  uint64_t v18;
  uint64_t v19;

  if (MBFLogInitOnce != -1)
    dispatch_once_f(&MBFLogInitOnce, 0, (dispatch_function_t)MBFLogInit);
  if (os_log_type_enabled((os_log_t)MBFLogComponent, OS_LOG_TYPE_DEBUG))
    BTAccessoryManagerGetDeviceColor_cold_2();
  MBXpcConnection = getMBXpcConnection(a1);
  if (MBXpcConnection)
  {
    v7 = MBXpcConnection;
    v8 = xpc_dictionary_create(0, 0, 0);
    xpc_dictionary_set_uint64(v8, "kCBMsgArgAccessoryManagerID", a1);
    xpc_dictionary_set_uint64(v8, "kCBMsgArgBTDevice", a2);
    v16 = 0;
    v17 = &v16;
    v18 = 0x2000000000;
    v19 = 0;
    v12 = 0;
    v13 = &v12;
    v14 = 0x2000000000;
    v15 = 0;
    v11[0] = MEMORY[0x1E0C809B0];
    v11[1] = 0x40000000;
    v11[2] = __BTAccessoryManagerGetDeviceColor_block_invoke;
    v11[3] = &unk_1E6B054A0;
    v11[4] = &v16;
    v11[5] = &v12;
    sendMessageWithReplySync(v7, "kCBMsgIdAccessoryGetDeviceColorMsg", v8, (uint64_t)v11);
    if (v8)
      xpc_release(v8);
    *a3 = v13[3];
    v9 = *((unsigned int *)v17 + 6);
    _Block_object_dispose(&v12, 8);
    _Block_object_dispose(&v16, 8);
  }
  else
  {
    if (MBFLogInitOnce != -1)
      dispatch_once_f(&MBFLogInitOnce, 0, (dispatch_function_t)MBFLogInit);
    if (os_log_type_enabled((os_log_t)MBFLogComponent, OS_LOG_TYPE_ERROR))
      BTAccessoryManagerRegisterDevice_cold_1();
    return 1;
  }
  return v9;
}

uint64_t BTAccessoryManagerSetupCommand(uint64_t a1, uint64_t a2, unsigned int a3, unsigned int a4, const void *a5, unsigned int a6)
{
  uint64_t MBXpcConnection;
  uint64_t v13;
  xpc_object_t v14;
  uint64_t v15;
  _QWORD v17[5];
  uint64_t v18;
  uint64_t *v19;
  uint64_t v20;
  uint64_t v21;

  if (MBFLogInitOnce != -1)
    dispatch_once_f(&MBFLogInitOnce, 0, (dispatch_function_t)MBFLogInit);
  if (os_log_type_enabled((os_log_t)MBFLogComponent, OS_LOG_TYPE_DEBUG))
    BTAccessoryManagerSetupCommand_cold_2();
  MBXpcConnection = getMBXpcConnection(a1);
  if (MBXpcConnection)
  {
    v13 = MBXpcConnection;
    v14 = xpc_dictionary_create(0, 0, 0);
    xpc_dictionary_set_uint64(v14, "kCBMsgArgAccessoryManagerID", a1);
    xpc_dictionary_set_uint64(v14, "kCBMsgArgBTDevice", a2);
    xpc_dictionary_set_uint64(v14, "kCBMsgArgSetupType", a3);
    xpc_dictionary_set_uint64(v14, "kCBMsgArgOPType", a4);
    xpc_dictionary_set_data(v14, "kCBMsgArgData", a5, a6);
    v18 = 0;
    v19 = &v18;
    v20 = 0x2000000000;
    v21 = 0;
    v17[0] = MEMORY[0x1E0C809B0];
    v17[1] = 0x40000000;
    v17[2] = __BTAccessoryManagerSetupCommand_block_invoke;
    v17[3] = &unk_1E6B054C8;
    v17[4] = &v18;
    sendMessageWithReplySync(v13, "kCBMsgIdAccessorySetupCommandMsg", v14, (uint64_t)v17);
    if (v14)
      xpc_release(v14);
    v15 = *((unsigned int *)v19 + 6);
    _Block_object_dispose(&v18, 8);
  }
  else
  {
    if (MBFLogInitOnce != -1)
      dispatch_once_f(&MBFLogInitOnce, 0, (dispatch_function_t)MBFLogInit);
    if (os_log_type_enabled((os_log_t)MBFLogComponent, OS_LOG_TYPE_ERROR))
      BTAccessoryManagerRegisterDevice_cold_1();
    return 1;
  }
  return v15;
}

uint64_t BTAccessoryManagerSendRelayMsg(uint64_t a1, uint64_t a2, const void *a3, unsigned int a4, const void *a5, unsigned int a6)
{
  uint64_t MBXpcConnection;
  uint64_t v13;
  xpc_object_t v14;
  uint64_t v15;
  _QWORD v17[5];
  uint64_t v18;
  uint64_t *v19;
  uint64_t v20;
  uint64_t v21;

  if (MBFLogInitOnce != -1)
    dispatch_once_f(&MBFLogInitOnce, 0, (dispatch_function_t)MBFLogInit);
  if (os_log_type_enabled((os_log_t)MBFLogComponent, OS_LOG_TYPE_DEBUG))
    BTAccessoryManagerSendRelayMsg_cold_2();
  MBXpcConnection = getMBXpcConnection(a1);
  if (MBXpcConnection)
  {
    v13 = MBXpcConnection;
    v14 = xpc_dictionary_create(0, 0, 0);
    xpc_dictionary_set_uint64(v14, "kCBMsgArgAccessoryManagerID", a1);
    xpc_dictionary_set_uint64(v14, "kCBMsgArgBTDevice", a2);
    xpc_dictionary_set_data(v14, "kCBMsgArgAddressBytes", a3, 6uLL);
    xpc_dictionary_set_uint64(v14, "kCBMsgArgRelayMsgType", a4);
    xpc_dictionary_set_data(v14, "kCBMsgArgData", a5, a6);
    v18 = 0;
    v19 = &v18;
    v20 = 0x2000000000;
    v21 = 0;
    v17[0] = MEMORY[0x1E0C809B0];
    v17[1] = 0x40000000;
    v17[2] = __BTAccessoryManagerSendRelayMsg_block_invoke;
    v17[3] = &unk_1E6B054F0;
    v17[4] = &v18;
    sendMessageWithReplySync(v13, "kCBMsgIdAccessorySendRelayMsgMsg", v14, (uint64_t)v17);
    if (v14)
      xpc_release(v14);
    v15 = *((unsigned int *)v19 + 6);
    _Block_object_dispose(&v18, 8);
  }
  else
  {
    if (MBFLogInitOnce != -1)
      dispatch_once_f(&MBFLogInitOnce, 0, (dispatch_function_t)MBFLogInit);
    if (os_log_type_enabled((os_log_t)MBFLogComponent, OS_LOG_TYPE_ERROR))
      BTAccessoryManagerRegisterDevice_cold_1();
    return 1;
  }
  return v15;
}

uint64_t BTAccessoryManagerUpdateConnPriorityList(uint64_t a1, uint64_t a2, unsigned int a3, char *a4, int a5)
{
  uint64_t v5;
  uint64_t MBXpcConnection;
  uint64_t v11;
  xpc_object_t v12;
  xpc_object_t v13;
  uint64_t v14;
  _QWORD v16[5];
  uint64_t v17;
  uint64_t *v18;
  uint64_t v19;
  uint64_t v20;

  LODWORD(v5) = a5;
  if (MBFLogInitOnce != -1)
    dispatch_once_f(&MBFLogInitOnce, 0, (dispatch_function_t)MBFLogInit);
  if (os_log_type_enabled((os_log_t)MBFLogComponent, OS_LOG_TYPE_DEBUG))
    BTAccessoryManagerUpdateConnPriorityList_cold_2();
  MBXpcConnection = getMBXpcConnection(a1);
  if (MBXpcConnection)
  {
    v11 = MBXpcConnection;
    v12 = xpc_dictionary_create(0, 0, 0);
    xpc_dictionary_set_uint64(v12, "kCBMsgArgAccessoryManagerID", a1);
    xpc_dictionary_set_uint64(v12, "kCBMsgArgBTDevice", a2);
    xpc_dictionary_set_uint64(v12, "kCBMsgArgCmdReqType", a3);
    v13 = xpc_array_create(0, 0);
    if ((_DWORD)v5)
    {
      v5 = v5;
      do
      {
        xpc_array_set_data(v13, 0xFFFFFFFFFFFFFFFFLL, a4, 6uLL);
        a4 += 6;
        --v5;
      }
      while (v5);
    }
    xpc_dictionary_set_value(v12, "kCBMsgArgDeviceArray", v13);
    v17 = 0;
    v18 = &v17;
    v19 = 0x2000000000;
    v20 = 0;
    v16[0] = MEMORY[0x1E0C809B0];
    v16[1] = 0x40000000;
    v16[2] = __BTAccessoryManagerUpdateConnPriorityList_block_invoke;
    v16[3] = &unk_1E6B05518;
    v16[4] = &v17;
    sendMessageWithReplySync(v11, "kCBMsgIdAccessoryUpdateConnPriorityListMsg", v12, (uint64_t)v16);
    if (v13)
      xpc_release(v13);
    if (v12)
      xpc_release(v12);
    v14 = *((unsigned int *)v18 + 6);
    _Block_object_dispose(&v17, 8);
  }
  else
  {
    if (MBFLogInitOnce != -1)
      dispatch_once_f(&MBFLogInitOnce, 0, (dispatch_function_t)MBFLogInit);
    if (os_log_type_enabled((os_log_t)MBFLogComponent, OS_LOG_TYPE_ERROR))
      BTAccessoryManagerRegisterDevice_cold_1();
    return 1;
  }
  return v14;
}

uint64_t BTAccessoryManagerGetNonAppleHAEPairedDevices(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t MBXpcConnection;
  uint64_t v9;
  xpc_object_t v10;
  uint64_t v11;
  _QWORD v13[8];
  uint64_t v14;
  uint64_t *v15;
  uint64_t v16;
  uint64_t v17;

  if (MBFLogInitOnce != -1)
    dispatch_once_f(&MBFLogInitOnce, 0, (dispatch_function_t)MBFLogInit);
  if (os_log_type_enabled((os_log_t)MBFLogComponent, OS_LOG_TYPE_DEBUG))
    BTAccessoryManagerGetNonAppleHAEPairedDevices_cold_2();
  MBXpcConnection = getMBXpcConnection(a1);
  if (MBXpcConnection)
  {
    v9 = MBXpcConnection;
    v10 = xpc_dictionary_create(0, 0, 0);
    xpc_dictionary_set_uint64(v10, "kCBMsgArgAccessoryManagerID", a1);
    xpc_dictionary_set_uint64(v10, "kCbMsgArgDeviceArrayMaxSize", a4);
    v14 = 0;
    v15 = &v14;
    v16 = 0x2000000000;
    v17 = 0;
    v13[0] = MEMORY[0x1E0C809B0];
    v13[1] = 0x40000000;
    v13[2] = __BTAccessoryManagerGetNonAppleHAEPairedDevices_block_invoke;
    v13[3] = &unk_1E6B05540;
    v13[4] = &v14;
    v13[5] = a4;
    v13[6] = a2;
    v13[7] = a3;
    sendMessageWithReplySync(v9, "kCBMsgIdAccessoryGetNonAppleHAEPairedDevicesMsg", v10, (uint64_t)v13);
    if (v10)
      xpc_release(v10);
    v11 = *((unsigned int *)v15 + 6);
    _Block_object_dispose(&v14, 8);
  }
  else
  {
    if (MBFLogInitOnce != -1)
      dispatch_once_f(&MBFLogInitOnce, 0, (dispatch_function_t)MBFLogInit);
    if (os_log_type_enabled((os_log_t)MBFLogComponent, OS_LOG_TYPE_ERROR))
      BTAccessoryManagerGetNonAppleHAEPairedDevices_cold_1();
    return 1;
  }
  return v11;
}

uint64_t BTAccessoryManagerSmartRouteMode(uint64_t a1, uint64_t a2, unsigned int a3)
{
  uint64_t MBXpcConnection;
  uint64_t v7;
  xpc_object_t v8;
  uint64_t v9;
  _QWORD v11[5];
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t v15;

  if (MBFLogInitOnce != -1)
    dispatch_once_f(&MBFLogInitOnce, 0, (dispatch_function_t)MBFLogInit);
  if (os_log_type_enabled((os_log_t)MBFLogComponent, OS_LOG_TYPE_DEBUG))
    BTAccessoryManagerSmartRouteMode_cold_2();
  MBXpcConnection = getMBXpcConnection(a1);
  if (MBXpcConnection)
  {
    v7 = MBXpcConnection;
    v8 = xpc_dictionary_create(0, 0, 0);
    xpc_dictionary_set_uint64(v8, "kCBMsgArgAccessoryManagerID", a1);
    xpc_dictionary_set_uint64(v8, "kCBMsgArgBTDevice", a2);
    xpc_dictionary_set_uint64(v8, "kCBMsgArgAccessoryGenericConfigMode", a3);
    v12 = 0;
    v13 = &v12;
    v14 = 0x2000000000;
    v15 = 0;
    v11[0] = MEMORY[0x1E0C809B0];
    v11[1] = 0x40000000;
    v11[2] = __BTAccessoryManagerSmartRouteMode_block_invoke;
    v11[3] = &unk_1E6B05568;
    v11[4] = &v12;
    sendMessageWithReplySync(v7, "kCBMsgIdAccessorySmartRouteModeMsg", v8, (uint64_t)v11);
    if (v8)
      xpc_release(v8);
    v9 = *((unsigned int *)v13 + 6);
    _Block_object_dispose(&v12, 8);
  }
  else
  {
    if (MBFLogInitOnce != -1)
      dispatch_once_f(&MBFLogInitOnce, 0, (dispatch_function_t)MBFLogInit);
    if (os_log_type_enabled((os_log_t)MBFLogComponent, OS_LOG_TYPE_ERROR))
      BTAccessoryManagerRegisterDevice_cold_1();
    return 1;
  }
  return v9;
}

uint64_t BTAccessoryManagerSpatialAudioConfig(uint64_t a1, uint64_t a2, const char *a3, unsigned int a4, unsigned int a5)
{
  NSObject *v10;
  uint64_t MBXpcConnection;
  uint64_t v12;
  xpc_object_t v13;
  uint64_t v14;
  _QWORD v16[5];
  uint8_t buf[8];
  uint8_t *v18;
  uint64_t v19;
  uint64_t v20;

  if (MBFLogInitOnce != -1)
    dispatch_once_f(&MBFLogInitOnce, 0, (dispatch_function_t)MBFLogInit);
  v10 = MBFLogComponent;
  if (os_log_type_enabled((os_log_t)MBFLogComponent, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1B6BF1000, v10, OS_LOG_TYPE_DEFAULT, "BTAccessoryManagerSpatialAudioMode over XPC", buf, 2u);
  }
  MBXpcConnection = getMBXpcConnection(a1);
  if (MBXpcConnection)
  {
    v12 = MBXpcConnection;
    v13 = xpc_dictionary_create(0, 0, 0);
    xpc_dictionary_set_uint64(v13, "kCBMsgArgAccessoryManagerID", a1);
    xpc_dictionary_set_uint64(v13, "kCBMsgArgBTDevice", a2);
    xpc_dictionary_set_string(v13, "kCBMsgArgAccessoryBundleID", a3);
    xpc_dictionary_set_uint64(v13, "kCBMsgArgAccessoryGenericConfigMode", a4);
    xpc_dictionary_set_uint64(v13, "kCBMsgArgAccessoryHeadTrackingStatus", a5);
    *(_QWORD *)buf = 0;
    v18 = buf;
    v19 = 0x2000000000;
    v20 = 0;
    v16[0] = MEMORY[0x1E0C809B0];
    v16[1] = 0x40000000;
    v16[2] = __BTAccessoryManagerSpatialAudioConfig_block_invoke;
    v16[3] = &unk_1E6B05590;
    v16[4] = buf;
    sendMessageWithReplySync(v12, "kCBMsgIdAccessorySpatialAudioModeMsg", v13, (uint64_t)v16);
    if (v13)
      xpc_release(v13);
    v14 = *((unsigned int *)v18 + 6);
    _Block_object_dispose(buf, 8);
  }
  else
  {
    if (MBFLogInitOnce != -1)
      dispatch_once_f(&MBFLogInitOnce, 0, (dispatch_function_t)MBFLogInit);
    if (os_log_type_enabled((os_log_t)MBFLogComponent, OS_LOG_TYPE_ERROR))
      BTAccessoryManagerRegisterDevice_cold_1();
    return 1;
  }
  return v14;
}

uint64_t BTAccessoryManagerGetSpatialAudioConfig(uint64_t a1, uint64_t a2, const char *a3, _DWORD *a4, _DWORD *a5)
{
  NSObject *v10;
  uint64_t MBXpcConnection;
  uint64_t v12;
  xpc_object_t v13;
  uint64_t v14;
  _QWORD v16[7];
  uint64_t v17;
  uint64_t *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t *v22;
  uint64_t v23;
  uint64_t v24;
  uint8_t buf[8];
  uint8_t *v26;
  uint64_t v27;
  uint64_t v28;

  if (MBFLogInitOnce != -1)
    dispatch_once_f(&MBFLogInitOnce, 0, (dispatch_function_t)MBFLogInit);
  v10 = MBFLogComponent;
  if (os_log_type_enabled((os_log_t)MBFLogComponent, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1B6BF1000, v10, OS_LOG_TYPE_DEFAULT, "BTAccessoryManagerGetSpatialAudioConfig over XPC", buf, 2u);
  }
  MBXpcConnection = getMBXpcConnection(a1);
  if (MBXpcConnection)
  {
    v12 = MBXpcConnection;
    v13 = xpc_dictionary_create(0, 0, 0);
    xpc_dictionary_set_uint64(v13, "kCBMsgArgAccessoryManagerID", a1);
    xpc_dictionary_set_uint64(v13, "kCBMsgArgBTDevice", a2);
    xpc_dictionary_set_string(v13, "kCBMsgArgAccessoryBundleID", a3);
    *(_QWORD *)buf = 0;
    v26 = buf;
    v27 = 0x2000000000;
    v28 = 0;
    v21 = 0;
    v22 = &v21;
    v23 = 0x2000000000;
    v24 = 0;
    v17 = 0;
    v18 = &v17;
    v19 = 0x2000000000;
    v20 = 1;
    v16[0] = MEMORY[0x1E0C809B0];
    v16[1] = 0x40000000;
    v16[2] = __BTAccessoryManagerGetSpatialAudioConfig_block_invoke;
    v16[3] = &unk_1E6B055B8;
    v16[4] = buf;
    v16[5] = &v21;
    v16[6] = &v17;
    sendMessageWithReplySync(v12, "kCBMsgIdAccessoryGetSpatialAudioModeMsg", v13, (uint64_t)v16);
    if (v13)
      xpc_release(v13);
    *a4 = v22[3];
    *a5 = v18[3];
    v14 = *((unsigned int *)v26 + 6);
    _Block_object_dispose(&v17, 8);
    _Block_object_dispose(&v21, 8);
    _Block_object_dispose(buf, 8);
  }
  else
  {
    if (MBFLogInitOnce != -1)
      dispatch_once_f(&MBFLogInitOnce, 0, (dispatch_function_t)MBFLogInit);
    if (os_log_type_enabled((os_log_t)MBFLogComponent, OS_LOG_TYPE_ERROR))
      BTAccessoryManagerRegisterDevice_cold_1();
    return 1;
  }
  return v14;
}

uint64_t BTAccessoryManagerGetSpatialAudioActive(uint64_t a1, uint64_t a2, _DWORD *a3)
{
  NSObject *v6;
  uint64_t MBXpcConnection;
  uint64_t v8;
  xpc_object_t v9;
  uint64_t v10;
  _QWORD v12[6];
  uint64_t v13;
  uint64_t *v14;
  uint64_t v15;
  uint64_t v16;
  uint8_t buf[8];
  uint8_t *v18;
  uint64_t v19;
  uint64_t v20;

  if (MBFLogInitOnce != -1)
    dispatch_once_f(&MBFLogInitOnce, 0, (dispatch_function_t)MBFLogInit);
  v6 = MBFLogComponent;
  if (os_log_type_enabled((os_log_t)MBFLogComponent, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1B6BF1000, v6, OS_LOG_TYPE_DEFAULT, "BTAccessoryManagerGetSpatialAudioActive over XPC", buf, 2u);
  }
  MBXpcConnection = getMBXpcConnection(a1);
  if (MBXpcConnection)
  {
    v8 = MBXpcConnection;
    v9 = xpc_dictionary_create(0, 0, 0);
    xpc_dictionary_set_uint64(v9, "kCBMsgArgAccessoryManagerID", a1);
    xpc_dictionary_set_uint64(v9, "kCBMsgArgBTDevice", a2);
    *(_QWORD *)buf = 0;
    v18 = buf;
    v19 = 0x2000000000;
    v20 = 0;
    v13 = 0;
    v14 = &v13;
    v15 = 0x2000000000;
    v16 = 0;
    v12[0] = MEMORY[0x1E0C809B0];
    v12[1] = 0x40000000;
    v12[2] = __BTAccessoryManagerGetSpatialAudioActive_block_invoke;
    v12[3] = &unk_1E6B055E0;
    v12[4] = buf;
    v12[5] = &v13;
    sendMessageWithReplySync(v8, "kCBMsgIdAccessoryGetSpatialAudioActiveMsg", v9, (uint64_t)v12);
    if (v9)
      xpc_release(v9);
    *a3 = v14[3];
    v10 = *((unsigned int *)v18 + 6);
    _Block_object_dispose(&v13, 8);
    _Block_object_dispose(buf, 8);
  }
  else
  {
    if (MBFLogInitOnce != -1)
      dispatch_once_f(&MBFLogInitOnce, 0, (dispatch_function_t)MBFLogInit);
    if (os_log_type_enabled((os_log_t)MBFLogComponent, OS_LOG_TYPE_ERROR))
      BTAccessoryManagerRegisterDevice_cold_1();
    return 1;
  }
  return v10;
}

uint64_t BTAccessoryManagerSpatialAudioAllowed(uint64_t a1, uint64_t a2, unsigned int a3)
{
  NSObject *v6;
  uint64_t MBXpcConnection;
  uint64_t v8;
  xpc_object_t v9;
  uint64_t v10;
  _QWORD v12[5];
  uint8_t buf[8];
  uint8_t *v14;
  uint64_t v15;
  uint64_t v16;

  if (MBFLogInitOnce != -1)
    dispatch_once_f(&MBFLogInitOnce, 0, (dispatch_function_t)MBFLogInit);
  v6 = MBFLogComponent;
  if (os_log_type_enabled((os_log_t)MBFLogComponent, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1B6BF1000, v6, OS_LOG_TYPE_DEFAULT, "BTAccessoryManagerSpatialAudioAllowed over XPC", buf, 2u);
  }
  MBXpcConnection = getMBXpcConnection(a1);
  if (MBXpcConnection)
  {
    v8 = MBXpcConnection;
    v9 = xpc_dictionary_create(0, 0, 0);
    xpc_dictionary_set_uint64(v9, "kCBMsgArgAccessoryManagerID", a1);
    xpc_dictionary_set_uint64(v9, "kCBMsgArgBTDevice", a2);
    xpc_dictionary_set_uint64(v9, "kCBMsgArgAccessoryGenericConfigMode", a3);
    *(_QWORD *)buf = 0;
    v14 = buf;
    v15 = 0x2000000000;
    v16 = 0;
    v12[0] = MEMORY[0x1E0C809B0];
    v12[1] = 0x40000000;
    v12[2] = __BTAccessoryManagerSpatialAudioAllowed_block_invoke;
    v12[3] = &unk_1E6B05608;
    v12[4] = buf;
    sendMessageWithReplySync(v8, "kCBMsgIdAccessorySpatialAudioAllowedMsg", v9, (uint64_t)v12);
    if (v9)
      xpc_release(v9);
    v10 = *((unsigned int *)v14 + 6);
    _Block_object_dispose(buf, 8);
  }
  else
  {
    if (MBFLogInitOnce != -1)
      dispatch_once_f(&MBFLogInitOnce, 0, (dispatch_function_t)MBFLogInit);
    if (os_log_type_enabled((os_log_t)MBFLogComponent, OS_LOG_TYPE_ERROR))
      BTAccessoryManagerRegisterDevice_cold_1();
    return 1;
  }
  return v10;
}

uint64_t BTAccessoryManagerGetSpatialAudioAllowed(uint64_t a1, uint64_t a2, _DWORD *a3)
{
  NSObject *v6;
  uint64_t MBXpcConnection;
  uint64_t v8;
  xpc_object_t v9;
  uint64_t v10;
  _QWORD v12[6];
  uint64_t v13;
  uint64_t *v14;
  uint64_t v15;
  uint64_t v16;
  uint8_t buf[8];
  uint8_t *v18;
  uint64_t v19;
  uint64_t v20;

  if (MBFLogInitOnce != -1)
    dispatch_once_f(&MBFLogInitOnce, 0, (dispatch_function_t)MBFLogInit);
  v6 = MBFLogComponent;
  if (os_log_type_enabled((os_log_t)MBFLogComponent, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1B6BF1000, v6, OS_LOG_TYPE_DEFAULT, "BTAccessoryManagerGetSpatialAudioAllowed over XPC", buf, 2u);
  }
  MBXpcConnection = getMBXpcConnection(a1);
  if (MBXpcConnection)
  {
    v8 = MBXpcConnection;
    v9 = xpc_dictionary_create(0, 0, 0);
    xpc_dictionary_set_uint64(v9, "kCBMsgArgAccessoryManagerID", a1);
    xpc_dictionary_set_uint64(v9, "kCBMsgArgBTDevice", a2);
    *(_QWORD *)buf = 0;
    v18 = buf;
    v19 = 0x2000000000;
    v20 = 0;
    v13 = 0;
    v14 = &v13;
    v15 = 0x2000000000;
    v16 = 0;
    v12[0] = MEMORY[0x1E0C809B0];
    v12[1] = 0x40000000;
    v12[2] = __BTAccessoryManagerGetSpatialAudioAllowed_block_invoke;
    v12[3] = &unk_1E6B05630;
    v12[4] = buf;
    v12[5] = &v13;
    sendMessageWithReplySync(v8, "kCBMsgIdAccessoryGetSpatialAudioAllowedMsg", v9, (uint64_t)v12);
    if (v9)
      xpc_release(v9);
    *a3 = v14[3];
    v10 = *((unsigned int *)v18 + 6);
    _Block_object_dispose(&v13, 8);
    _Block_object_dispose(buf, 8);
  }
  else
  {
    if (MBFLogInitOnce != -1)
      dispatch_once_f(&MBFLogInitOnce, 0, (dispatch_function_t)MBFLogInit);
    if (os_log_type_enabled((os_log_t)MBFLogComponent, OS_LOG_TYPE_ERROR))
      BTAccessoryManagerRegisterDevice_cold_1();
    return 1;
  }
  return v10;
}

uint64_t BTAccessoryManagerGetSmartRouteMode(uint64_t a1, uint64_t a2, _DWORD *a3)
{
  uint64_t MBXpcConnection;
  uint64_t v7;
  xpc_object_t v8;
  uint64_t v9;
  _QWORD v11[6];
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t *v17;
  uint64_t v18;
  uint64_t v19;

  if (MBFLogInitOnce != -1)
    dispatch_once_f(&MBFLogInitOnce, 0, (dispatch_function_t)MBFLogInit);
  if (os_log_type_enabled((os_log_t)MBFLogComponent, OS_LOG_TYPE_DEBUG))
    BTAccessoryManagerGetSmartRouteMode_cold_2();
  MBXpcConnection = getMBXpcConnection(a1);
  if (MBXpcConnection)
  {
    v7 = MBXpcConnection;
    v8 = xpc_dictionary_create(0, 0, 0);
    xpc_dictionary_set_uint64(v8, "kCBMsgArgAccessoryManagerID", a1);
    xpc_dictionary_set_uint64(v8, "kCBMsgArgBTDevice", a2);
    v16 = 0;
    v17 = &v16;
    v18 = 0x2000000000;
    v19 = 0;
    v12 = 0;
    v13 = &v12;
    v14 = 0x2000000000;
    v15 = 0;
    v11[0] = MEMORY[0x1E0C809B0];
    v11[1] = 0x40000000;
    v11[2] = __BTAccessoryManagerGetSmartRouteMode_block_invoke;
    v11[3] = &unk_1E6B05658;
    v11[4] = &v16;
    v11[5] = &v12;
    sendMessageWithReplySync(v7, "kCBMsgIdAccessoryGetSmartRouteModeMsg", v8, (uint64_t)v11);
    if (v8)
      xpc_release(v8);
    *a3 = v13[3];
    v9 = *((unsigned int *)v17 + 6);
    _Block_object_dispose(&v12, 8);
    _Block_object_dispose(&v16, 8);
  }
  else
  {
    if (MBFLogInitOnce != -1)
      dispatch_once_f(&MBFLogInitOnce, 0, (dispatch_function_t)MBFLogInit);
    if (os_log_type_enabled((os_log_t)MBFLogComponent, OS_LOG_TYPE_ERROR))
      BTAccessoryManagerRegisterDevice_cold_1();
    return 1;
  }
  return v9;
}

uint64_t BTAccessoryManagerGetSmartRouteSupport(uint64_t a1, uint64_t a2, _DWORD *a3)
{
  uint64_t MBXpcConnection;
  uint64_t v7;
  xpc_object_t v8;
  uint64_t v9;
  _QWORD v11[6];
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t *v17;
  uint64_t v18;
  uint64_t v19;

  if (MBFLogInitOnce != -1)
    dispatch_once_f(&MBFLogInitOnce, 0, (dispatch_function_t)MBFLogInit);
  if (os_log_type_enabled((os_log_t)MBFLogComponent, OS_LOG_TYPE_DEBUG))
    BTAccessoryManagerGetSmartRouteSupport_cold_2();
  MBXpcConnection = getMBXpcConnection(a1);
  if (MBXpcConnection)
  {
    v7 = MBXpcConnection;
    v8 = xpc_dictionary_create(0, 0, 0);
    xpc_dictionary_set_uint64(v8, "kCBMsgArgAccessoryManagerID", a1);
    xpc_dictionary_set_uint64(v8, "kCBMsgArgBTDevice", a2);
    v16 = 0;
    v17 = &v16;
    v18 = 0x2000000000;
    v19 = 0;
    v12 = 0;
    v13 = &v12;
    v14 = 0x2000000000;
    v15 = 0;
    v11[0] = MEMORY[0x1E0C809B0];
    v11[1] = 0x40000000;
    v11[2] = __BTAccessoryManagerGetSmartRouteSupport_block_invoke;
    v11[3] = &unk_1E6B05680;
    v11[4] = &v16;
    v11[5] = &v12;
    sendMessageWithReplySync(v7, "kCBMsgIdAccessoryGetSmartRouteSupportMsg", v8, (uint64_t)v11);
    if (v8)
      xpc_release(v8);
    *a3 = v13[3];
    v9 = *((unsigned int *)v17 + 6);
    _Block_object_dispose(&v12, 8);
    _Block_object_dispose(&v16, 8);
  }
  else
  {
    if (MBFLogInitOnce != -1)
      dispatch_once_f(&MBFLogInitOnce, 0, (dispatch_function_t)MBFLogInit);
    if (os_log_type_enabled((os_log_t)MBFLogComponent, OS_LOG_TYPE_ERROR))
      BTAccessoryManagerRegisterDevice_cold_1();
    return 1;
  }
  return v9;
}

uint64_t BTAccessoryManagerSetDeviceStateOnPeerSrc(uint64_t a1, uint64_t a2, const void *a3, unsigned int a4)
{
  uint64_t MBXpcConnection;
  uint64_t v9;
  xpc_object_t v10;
  uint64_t v11;
  _QWORD v13[5];
  uint64_t v14;
  uint64_t *v15;
  uint64_t v16;
  uint64_t v17;

  if (MBFLogInitOnce != -1)
    dispatch_once_f(&MBFLogInitOnce, 0, (dispatch_function_t)MBFLogInit);
  if (os_log_type_enabled((os_log_t)MBFLogComponent, OS_LOG_TYPE_DEBUG))
    BTAccessoryManagerSetDeviceStateOnPeerSrc_cold_2();
  MBXpcConnection = getMBXpcConnection(a1);
  if (MBXpcConnection)
  {
    v9 = MBXpcConnection;
    v10 = xpc_dictionary_create(0, 0, 0);
    xpc_dictionary_set_uint64(v10, "kCBMsgArgAccessoryManagerID", a1);
    xpc_dictionary_set_uint64(v10, "kCBMsgArgBTDevice", a2);
    xpc_dictionary_set_data(v10, "kCBMsgArgAddressBytes", a3, 6uLL);
    xpc_dictionary_set_uint64(v10, "kCBMsgArgAccessoryDeviceState", a4);
    v14 = 0;
    v15 = &v14;
    v16 = 0x2000000000;
    v17 = 0;
    v13[0] = MEMORY[0x1E0C809B0];
    v13[1] = 0x40000000;
    v13[2] = __BTAccessoryManagerSetDeviceStateOnPeerSrc_block_invoke;
    v13[3] = &unk_1E6B056A8;
    v13[4] = &v14;
    sendMessageWithReplySync(v9, "kCBMsgIdAccessorySetDeviceStateOnPeerSrcMsg", v10, (uint64_t)v13);
    if (v10)
      xpc_release(v10);
    v11 = *((unsigned int *)v15 + 6);
    _Block_object_dispose(&v14, 8);
  }
  else
  {
    if (MBFLogInitOnce != -1)
      dispatch_once_f(&MBFLogInitOnce, 0, (dispatch_function_t)MBFLogInit);
    if (os_log_type_enabled((os_log_t)MBFLogComponent, OS_LOG_TYPE_ERROR))
      BTAccessoryManagerRegisterDevice_cold_1();
    return 1;
  }
  return v11;
}

uint64_t BTAccessoryManagerGetStereoHFPSupport(uint64_t a1, uint64_t a2, _DWORD *a3)
{
  uint64_t MBXpcConnection;
  uint64_t v7;
  xpc_object_t v8;
  uint64_t v9;
  _QWORD v11[6];
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t *v17;
  uint64_t v18;
  uint64_t v19;

  if (MBFLogInitOnce != -1)
    dispatch_once_f(&MBFLogInitOnce, 0, (dispatch_function_t)MBFLogInit);
  if (os_log_type_enabled((os_log_t)MBFLogComponent, OS_LOG_TYPE_DEBUG))
    BTAccessoryManagerGetStereoHFPSupport_cold_2();
  MBXpcConnection = getMBXpcConnection(a1);
  if (MBXpcConnection)
  {
    v7 = MBXpcConnection;
    v8 = xpc_dictionary_create(0, 0, 0);
    xpc_dictionary_set_uint64(v8, "kCBMsgArgAccessoryManagerID", a1);
    xpc_dictionary_set_uint64(v8, "kCBMsgArgBTDevice", a2);
    v16 = 0;
    v17 = &v16;
    v18 = 0x2000000000;
    v19 = 0;
    v12 = 0;
    v13 = &v12;
    v14 = 0x2000000000;
    v15 = 0;
    v11[0] = MEMORY[0x1E0C809B0];
    v11[1] = 0x40000000;
    v11[2] = __BTAccessoryManagerGetStereoHFPSupport_block_invoke;
    v11[3] = &unk_1E6B056D0;
    v11[4] = &v16;
    v11[5] = &v12;
    sendMessageWithReplySync(v7, "kCBMsgIdAccessoryGetStereoHFPSupportMsg", v8, (uint64_t)v11);
    if (v8)
      xpc_release(v8);
    *a3 = v13[3];
    v9 = *((unsigned int *)v17 + 6);
    _Block_object_dispose(&v12, 8);
    _Block_object_dispose(&v16, 8);
  }
  else
  {
    if (MBFLogInitOnce != -1)
      dispatch_once_f(&MBFLogInitOnce, 0, (dispatch_function_t)MBFLogInit);
    if (os_log_type_enabled((os_log_t)MBFLogComponent, OS_LOG_TYPE_ERROR))
      BTAccessoryManagerRegisterDevice_cold_1();
    return 1;
  }
  return v9;
}

uint64_t BTAccessoryManagerGetCallManagementConfigHelper(uint64_t a1, uint64_t a2, _DWORD *a3)
{
  uint64_t MBXpcConnection;
  uint64_t v7;
  xpc_object_t v8;
  uint64_t v9;
  _QWORD v11[6];
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t *v17;
  uint64_t v18;
  uint64_t v19;

  MBXpcConnection = getMBXpcConnection(a1);
  if (MBXpcConnection)
  {
    v7 = MBXpcConnection;
    v8 = xpc_dictionary_create(0, 0, 0);
    xpc_dictionary_set_uint64(v8, "kCBMsgArgAccessoryManagerID", a1);
    xpc_dictionary_set_uint64(v8, "kCBMsgArgBTDevice", a2);
    v16 = 0;
    v17 = &v16;
    v18 = 0x2000000000;
    v19 = 0;
    v12 = 0;
    v13 = &v12;
    v14 = 0x2000000000;
    v15 = 0;
    v11[0] = MEMORY[0x1E0C809B0];
    v11[1] = 0x40000000;
    v11[2] = __BTAccessoryManagerGetCallManagementConfigHelper_block_invoke;
    v11[3] = &unk_1E6B056F8;
    v11[4] = &v16;
    v11[5] = &v12;
    sendMessageWithReplySync(v7, "kCBMsgIdAccessoryGetCallManagementConfigMsg", v8, (uint64_t)v11);
    if (v8)
      xpc_release(v8);
    *a3 = v13[3];
    v9 = *((unsigned int *)v17 + 6);
    _Block_object_dispose(&v12, 8);
    _Block_object_dispose(&v16, 8);
  }
  else
  {
    if (MBFLogInitOnce != -1)
      dispatch_once_f(&MBFLogInitOnce, 0, (dispatch_function_t)MBFLogInit);
    if (os_log_type_enabled((os_log_t)MBFLogComponent, OS_LOG_TYPE_ERROR))
      BTAccessoryManagerRegisterDevice_cold_1();
    return 1;
  }
  return v9;
}

uint64_t BTAccessoryManagerGetCallManagementConfig(uint64_t a1, uint64_t a2, _BYTE *a3)
{
  uint64_t result;
  unsigned int v7;
  char v8;
  int v9;
  unsigned int v10;

  if (MBFLogInitOnce != -1)
    dispatch_once_f(&MBFLogInitOnce, 0, (dispatch_function_t)MBFLogInit);
  if (os_log_type_enabled((os_log_t)MBFLogComponent, OS_LOG_TYPE_DEBUG))
    BTAccessoryManagerGetCallManagementConfig_cold_1();
  v10 = 0;
  result = BTAccessoryManagerGetCallManagementConfigHelper(a1, a2, &v10);
  if (a3)
  {
    v7 = v10;
    if ((v10 & 0xF) == 1)
    {
      *a3 = 1;
      a3[3] = v7 >> 4;
      a3[4] = BYTE1(v7) & 0xF;
      a3[5] = (unsigned __int16)v7 >> 12;
      a3[6] = BYTE2(v7) & 0xF;
    }
    else if ((v10 & 0xF) == 0)
    {
      *a3 = 0;
      v8 = v7 >> 4;
      a3[1] = v7 >> 4;
      v9 = (v7 >> 8) & 0xF;
      a3[2] = v9;
      a3[3] = v8;
      a3[4] = v9;
    }
  }
  return result;
}

uint64_t BTAccessoryManagerGetFeatureProxCardStatus(uint64_t a1, uint64_t a2, _QWORD *a3)
{
  uint64_t MBXpcConnection;
  uint64_t v7;
  xpc_object_t v8;
  uint64_t v9;
  _QWORD v11[6];
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t *v17;
  uint64_t v18;
  uint64_t v19;

  if (MBFLogInitOnce != -1)
    dispatch_once_f(&MBFLogInitOnce, 0, (dispatch_function_t)MBFLogInit);
  if (os_log_type_enabled((os_log_t)MBFLogComponent, OS_LOG_TYPE_DEBUG))
    BTAccessoryManagerGetFeatureProxCardStatus_cold_2();
  MBXpcConnection = getMBXpcConnection(a1);
  if (MBXpcConnection)
  {
    v7 = MBXpcConnection;
    v8 = xpc_dictionary_create(0, 0, 0);
    xpc_dictionary_set_uint64(v8, "kCBMsgArgAccessoryManagerID", a1);
    xpc_dictionary_set_uint64(v8, "kCBMsgArgBTDevice", a2);
    v16 = 0;
    v17 = &v16;
    v18 = 0x2000000000;
    v19 = 0;
    v12 = 0;
    v13 = &v12;
    v14 = 0x2000000000;
    v15 = 0;
    v11[0] = MEMORY[0x1E0C809B0];
    v11[1] = 0x40000000;
    v11[2] = __BTAccessoryManagerGetFeatureProxCardStatus_block_invoke;
    v11[3] = &unk_1E6B05720;
    v11[4] = &v16;
    v11[5] = &v12;
    sendMessageWithReplySync(v7, "kCBMsgIdAccessoryGetFeatureProxCardStatusMsg", v8, (uint64_t)v11);
    if (v8)
      xpc_release(v8);
    *a3 = *((unsigned int *)v13 + 6);
    v9 = *((unsigned int *)v17 + 6);
    _Block_object_dispose(&v12, 8);
    _Block_object_dispose(&v16, 8);
  }
  else
  {
    if (MBFLogInitOnce != -1)
      dispatch_once_f(&MBFLogInitOnce, 0, (dispatch_function_t)MBFLogInit);
    if (os_log_type_enabled((os_log_t)MBFLogComponent, OS_LOG_TYPE_ERROR))
      BTAccessoryManagerRegisterDevice_cold_1();
    return 1;
  }
  return v9;
}

uint64_t BTAccessoryManagerSetFeatureProxCardStatus(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t MBXpcConnection;
  uint64_t v7;
  xpc_object_t v8;
  uint64_t v9;
  _QWORD v11[5];
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t v15;

  if (MBFLogInitOnce != -1)
    dispatch_once_f(&MBFLogInitOnce, 0, (dispatch_function_t)MBFLogInit);
  if (os_log_type_enabled((os_log_t)MBFLogComponent, OS_LOG_TYPE_DEBUG))
    BTAccessoryManagerSetFeatureProxCardStatus_cold_2();
  MBXpcConnection = getMBXpcConnection(a1);
  if (MBXpcConnection)
  {
    v7 = MBXpcConnection;
    v8 = xpc_dictionary_create(0, 0, 0);
    xpc_dictionary_set_uint64(v8, "kCBMsgArgAccessoryManagerID", a1);
    xpc_dictionary_set_uint64(v8, "kCBMsgArgBTDevice", a2);
    xpc_dictionary_set_uint64(v8, "kCBMsgArgFeatureProxCardStatusMessage", a3);
    v12 = 0;
    v13 = &v12;
    v14 = 0x2000000000;
    v15 = 0;
    v11[0] = MEMORY[0x1E0C809B0];
    v11[1] = 0x40000000;
    v11[2] = __BTAccessoryManagerSetFeatureProxCardStatus_block_invoke;
    v11[3] = &unk_1E6B05748;
    v11[4] = &v12;
    sendMessageWithReplySync(v7, "kCBMsgIdAccessorySetFeatureProxCardStatusMsg", v8, (uint64_t)v11);
    if (v8)
      xpc_release(v8);
    v9 = *((unsigned int *)v13 + 6);
    _Block_object_dispose(&v12, 8);
  }
  else
  {
    if (MBFLogInitOnce != -1)
      dispatch_once_f(&MBFLogInitOnce, 0, (dispatch_function_t)MBFLogInit);
    if (os_log_type_enabled((os_log_t)MBFLogComponent, OS_LOG_TYPE_ERROR))
      BTAccessoryManagerRegisterDevice_cold_1();
    return 1;
  }
  return v9;
}

uint64_t BTAccessoryManagerGetDeviceSoundProfileSupport(uint64_t a1, uint64_t a2, _DWORD *a3)
{
  uint64_t MBXpcConnection;
  uint64_t v7;
  xpc_object_t v8;
  uint64_t v9;
  _QWORD v11[6];
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t *v17;
  uint64_t v18;
  uint64_t v19;

  if (MBFLogInitOnce != -1)
    dispatch_once_f(&MBFLogInitOnce, 0, (dispatch_function_t)MBFLogInit);
  if (os_log_type_enabled((os_log_t)MBFLogComponent, OS_LOG_TYPE_DEBUG))
    BTAccessoryManagerGetDeviceSoundProfileSupport_cold_2();
  MBXpcConnection = getMBXpcConnection(a1);
  if (MBXpcConnection)
  {
    v7 = MBXpcConnection;
    v8 = xpc_dictionary_create(0, 0, 0);
    xpc_dictionary_set_uint64(v8, "kCBMsgArgAccessoryManagerID", a1);
    xpc_dictionary_set_uint64(v8, "kCBMsgArgBTDevice", a2);
    v16 = 0;
    v17 = &v16;
    v18 = 0x2000000000;
    v19 = 0;
    v12 = 0;
    v13 = &v12;
    v14 = 0x2000000000;
    v15 = 0;
    v11[0] = MEMORY[0x1E0C809B0];
    v11[1] = 0x40000000;
    v11[2] = __BTAccessoryManagerGetDeviceSoundProfileSupport_block_invoke;
    v11[3] = &unk_1E6B05770;
    v11[4] = &v16;
    v11[5] = &v12;
    sendMessageWithReplySync(v7, "kCBMsgIdAccessoryGetDeviceSoundProfileSupportMsg", v8, (uint64_t)v11);
    if (v8)
      xpc_release(v8);
    *a3 = v13[3];
    v9 = *((unsigned int *)v17 + 6);
    _Block_object_dispose(&v12, 8);
    _Block_object_dispose(&v16, 8);
  }
  else
  {
    if (MBFLogInitOnce != -1)
      dispatch_once_f(&MBFLogInitOnce, 0, (dispatch_function_t)MBFLogInit);
    if (os_log_type_enabled((os_log_t)MBFLogComponent, OS_LOG_TYPE_ERROR))
      BTAccessoryManagerRegisterDevice_cold_1();
    return 1;
  }
  return v9;
}

uint64_t BTAccessoryManagerGetDeviceSoundProfileAllowed(uint64_t a1, uint64_t a2, _DWORD *a3)
{
  uint64_t MBXpcConnection;
  uint64_t v7;
  xpc_object_t v8;
  uint64_t v9;
  _QWORD v11[6];
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t *v17;
  uint64_t v18;
  uint64_t v19;

  if (MBFLogInitOnce != -1)
    dispatch_once_f(&MBFLogInitOnce, 0, (dispatch_function_t)MBFLogInit);
  if (os_log_type_enabled((os_log_t)MBFLogComponent, OS_LOG_TYPE_DEBUG))
    BTAccessoryManagerGetDeviceSoundProfileAllowed_cold_2();
  MBXpcConnection = getMBXpcConnection(a1);
  if (MBXpcConnection)
  {
    v7 = MBXpcConnection;
    v8 = xpc_dictionary_create(0, 0, 0);
    xpc_dictionary_set_uint64(v8, "kCBMsgArgAccessoryManagerID", a1);
    xpc_dictionary_set_uint64(v8, "kCBMsgArgBTDevice", a2);
    v16 = 0;
    v17 = &v16;
    v18 = 0x2000000000;
    v19 = 0;
    v12 = 0;
    v13 = &v12;
    v14 = 0x2000000000;
    v15 = 0;
    v11[0] = MEMORY[0x1E0C809B0];
    v11[1] = 0x40000000;
    v11[2] = __BTAccessoryManagerGetDeviceSoundProfileAllowed_block_invoke;
    v11[3] = &unk_1E6B05798;
    v11[4] = &v16;
    v11[5] = &v12;
    sendMessageWithReplySync(v7, "kCBMsgIdAccessoryGetDeviceSoundProfileAllowedMsg", v8, (uint64_t)v11);
    if (v8)
      xpc_release(v8);
    *a3 = v13[3];
    v9 = *((unsigned int *)v17 + 6);
    _Block_object_dispose(&v12, 8);
    _Block_object_dispose(&v16, 8);
  }
  else
  {
    if (MBFLogInitOnce != -1)
      dispatch_once_f(&MBFLogInitOnce, 0, (dispatch_function_t)MBFLogInit);
    if (os_log_type_enabled((os_log_t)MBFLogComponent, OS_LOG_TYPE_ERROR))
      BTAccessoryManagerRegisterDevice_cold_1();
    return 1;
  }
  return v9;
}

uint64_t BTAccessoryManagerSetDeviceSoundProfileAllowed(uint64_t a1, uint64_t a2, unsigned int a3)
{
  uint64_t MBXpcConnection;
  uint64_t v7;
  xpc_object_t v8;
  uint64_t v9;
  _QWORD v11[5];
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t v15;

  if (MBFLogInitOnce != -1)
    dispatch_once_f(&MBFLogInitOnce, 0, (dispatch_function_t)MBFLogInit);
  if (os_log_type_enabled((os_log_t)MBFLogComponent, OS_LOG_TYPE_DEBUG))
    BTAccessoryManagerSetDeviceSoundProfileAllowed_cold_2();
  MBXpcConnection = getMBXpcConnection(a1);
  if (MBXpcConnection)
  {
    v7 = MBXpcConnection;
    v8 = xpc_dictionary_create(0, 0, 0);
    xpc_dictionary_set_uint64(v8, "kCBMsgArgAccessoryManagerID", a1);
    xpc_dictionary_set_uint64(v8, "kCBMsgArgBTDevice", a2);
    xpc_dictionary_set_uint64(v8, "kCBMsgArgBool", a3);
    v12 = 0;
    v13 = &v12;
    v14 = 0x2000000000;
    v15 = 0;
    v11[0] = MEMORY[0x1E0C809B0];
    v11[1] = 0x40000000;
    v11[2] = __BTAccessoryManagerSetDeviceSoundProfileAllowed_block_invoke;
    v11[3] = &unk_1E6B057C0;
    v11[4] = &v12;
    sendMessageWithReplySync(v7, "kCBMsgIdAccessorySetDeviceSoundProfileAllowedMsg", v8, (uint64_t)v11);
    if (v8)
      xpc_release(v8);
    v9 = *((unsigned int *)v13 + 6);
    _Block_object_dispose(&v12, 8);
  }
  else
  {
    if (MBFLogInitOnce != -1)
      dispatch_once_f(&MBFLogInitOnce, 0, (dispatch_function_t)MBFLogInit);
    if (os_log_type_enabled((os_log_t)MBFLogComponent, OS_LOG_TYPE_ERROR))
      BTAccessoryManagerRegisterDevice_cold_1();
    return 1;
  }
  return v9;
}

uint64_t BTAccessoryManagerGetSpatialAudioPlatformSupport(uint64_t a1, uint64_t a2, _DWORD *a3)
{
  uint64_t MBXpcConnection;
  uint64_t v7;
  xpc_object_t v8;
  uint64_t v9;
  _QWORD v11[6];
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t *v17;
  uint64_t v18;
  uint64_t v19;

  if (MBFLogInitOnce != -1)
    dispatch_once_f(&MBFLogInitOnce, 0, (dispatch_function_t)MBFLogInit);
  if (os_log_type_enabled((os_log_t)MBFLogComponent, OS_LOG_TYPE_DEBUG))
    BTAccessoryManagerGetSpatialAudioPlatformSupport_cold_2();
  MBXpcConnection = getMBXpcConnection(a1);
  if (MBXpcConnection)
  {
    v7 = MBXpcConnection;
    v8 = xpc_dictionary_create(0, 0, 0);
    xpc_dictionary_set_uint64(v8, "kCBMsgArgAccessoryManagerID", a1);
    xpc_dictionary_set_uint64(v8, "kCBMsgArgBTDevice", a2);
    v16 = 0;
    v17 = &v16;
    v18 = 0x2000000000;
    v19 = 0;
    v12 = 0;
    v13 = &v12;
    v14 = 0x2000000000;
    v15 = 0;
    v11[0] = MEMORY[0x1E0C809B0];
    v11[1] = 0x40000000;
    v11[2] = __BTAccessoryManagerGetSpatialAudioPlatformSupport_block_invoke;
    v11[3] = &unk_1E6B057E8;
    v11[4] = &v16;
    v11[5] = &v12;
    sendMessageWithReplySync(v7, "kCBMsgIdAccessoryGetSpatialAudioPlatformSupportMsg", v8, (uint64_t)v11);
    if (v8)
      xpc_release(v8);
    *a3 = v13[3];
    v9 = *((unsigned int *)v17 + 6);
    _Block_object_dispose(&v12, 8);
    _Block_object_dispose(&v16, 8);
  }
  else
  {
    if (MBFLogInitOnce != -1)
      dispatch_once_f(&MBFLogInitOnce, 0, (dispatch_function_t)MBFLogInit);
    if (os_log_type_enabled((os_log_t)MBFLogComponent, OS_LOG_TYPE_ERROR))
      BTAccessoryManagerRegisterDevice_cold_1();
    return 1;
  }
  return v9;
}

uint64_t BTAccessoryManagerGetAnnounceCallsSupport(uint64_t a1, uint64_t a2, _DWORD *a3)
{
  uint64_t MBXpcConnection;
  uint64_t v7;
  xpc_object_t v8;
  uint64_t v9;
  _QWORD v11[6];
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t *v17;
  uint64_t v18;
  uint64_t v19;

  if (MBFLogInitOnce != -1)
    dispatch_once_f(&MBFLogInitOnce, 0, (dispatch_function_t)MBFLogInit);
  if (os_log_type_enabled((os_log_t)MBFLogComponent, OS_LOG_TYPE_DEBUG))
    BTAccessoryManagerGetAnnounceCallsSupport_cold_2();
  MBXpcConnection = getMBXpcConnection(a1);
  if (MBXpcConnection)
  {
    v7 = MBXpcConnection;
    v8 = xpc_dictionary_create(0, 0, 0);
    xpc_dictionary_set_uint64(v8, "kCBMsgArgAccessoryManagerID", a1);
    xpc_dictionary_set_uint64(v8, "kCBMsgArgBTDevice", a2);
    v16 = 0;
    v17 = &v16;
    v18 = 0x2000000000;
    v19 = 0;
    v12 = 0;
    v13 = &v12;
    v14 = 0x2000000000;
    v15 = 0;
    v11[0] = MEMORY[0x1E0C809B0];
    v11[1] = 0x40000000;
    v11[2] = __BTAccessoryManagerGetAnnounceCallsSupport_block_invoke;
    v11[3] = &unk_1E6B05810;
    v11[4] = &v16;
    v11[5] = &v12;
    sendMessageWithReplySync(v7, "kCBMsgIdAccessoryGetAnnounceCallsSupportMsg", v8, (uint64_t)v11);
    if (v8)
      xpc_release(v8);
    *a3 = v13[3];
    v9 = *((unsigned int *)v17 + 6);
    _Block_object_dispose(&v12, 8);
    _Block_object_dispose(&v16, 8);
  }
  else
  {
    if (MBFLogInitOnce != -1)
      dispatch_once_f(&MBFLogInitOnce, 0, (dispatch_function_t)MBFLogInit);
    if (os_log_type_enabled((os_log_t)MBFLogComponent, OS_LOG_TYPE_ERROR))
      BTAccessoryManagerRegisterDevice_cold_1();
    return 1;
  }
  return v9;
}

uint64_t BTAccessoryManagerGetAdaptiveLatencyJitterBufferLevel(uint64_t a1, _QWORD *a2, _WORD *a3)
{
  NSObject *v6;
  uint64_t MBXpcConnection;
  uint64_t v8;
  xpc_object_t v9;
  uint64_t v10;
  _QWORD v12[7];
  uint64_t v13;
  uint64_t *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t *v18;
  uint64_t v19;
  uint64_t v20;
  uint8_t buf[8];
  uint8_t *v22;
  uint64_t v23;
  uint64_t v24;

  if (MBFLogInitOnce != -1)
    dispatch_once_f(&MBFLogInitOnce, 0, (dispatch_function_t)MBFLogInit);
  v6 = MBFLogComponent;
  if (os_log_type_enabled((os_log_t)MBFLogComponent, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1B6BF1000, v6, OS_LOG_TYPE_DEFAULT, "kCBMsgIdAccessoryGetJitterBufferLevelMsg over XPC", buf, 2u);
  }
  MBXpcConnection = getMBXpcConnection(a1);
  if (MBXpcConnection)
  {
    v8 = MBXpcConnection;
    v9 = xpc_dictionary_create(0, 0, 0);
    xpc_dictionary_set_uint64(v9, "kCBMsgArgAccessoryManagerID", a1);
    xpc_dictionary_set_uint64(v9, "kCBMsgArgBTDevice", (uint64_t)a2);
    *(_QWORD *)buf = 0;
    v22 = buf;
    v23 = 0x2000000000;
    v24 = 0;
    v17 = 0;
    v18 = &v17;
    v19 = 0x2000000000;
    v20 = 0;
    v13 = 0;
    v14 = &v13;
    v15 = 0x2000000000;
    v16 = 0;
    v12[0] = MEMORY[0x1E0C809B0];
    v12[1] = 0x40000000;
    v12[2] = __BTAccessoryManagerGetAdaptiveLatencyJitterBufferLevel_block_invoke;
    v12[3] = &unk_1E6B05838;
    v12[4] = buf;
    v12[5] = &v17;
    v12[6] = &v13;
    sendMessageWithReplySync(v8, "kCBMsgIdAccessoryGetAdaptiveLatencyJitterBufferLevelMsg", v9, (uint64_t)v12);
    if (v9)
      xpc_release(v9);
    *a3 = v18[3];
    *a2 = v14[3];
    v10 = *((unsigned int *)v22 + 6);
    _Block_object_dispose(&v13, 8);
    _Block_object_dispose(&v17, 8);
    _Block_object_dispose(buf, 8);
  }
  else
  {
    if (MBFLogInitOnce != -1)
      dispatch_once_f(&MBFLogInitOnce, 0, (dispatch_function_t)MBFLogInit);
    if (os_log_type_enabled((os_log_t)MBFLogComponent, OS_LOG_TYPE_ERROR))
      BTAccessoryManagerRegisterDevice_cold_1();
    return 1;
  }
  return v10;
}

uint64_t BTAccessoryManagerGetSensorStreamingFrequency(uint64_t a1, uint64_t a2, _DWORD *a3)
{
  NSObject *v6;
  uint64_t MBXpcConnection;
  uint64_t v8;
  xpc_object_t v9;
  uint64_t v10;
  _QWORD v12[7];
  _QWORD v13[4];
  uint64_t v14;
  uint64_t *v15;
  uint64_t v16;
  uint64_t v17;
  uint8_t buf[8];
  uint8_t *v19;
  uint64_t v20;
  uint64_t v21;

  if (MBFLogInitOnce != -1)
    dispatch_once_f(&MBFLogInitOnce, 0, (dispatch_function_t)MBFLogInit);
  v6 = MBFLogComponent;
  if (os_log_type_enabled((os_log_t)MBFLogComponent, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1B6BF1000, v6, OS_LOG_TYPE_DEFAULT, "BTAccessoryManagerGetSensorStreamingFrequency over XPC", buf, 2u);
  }
  MBXpcConnection = getMBXpcConnection(a1);
  if (MBXpcConnection)
  {
    v8 = MBXpcConnection;
    v9 = xpc_dictionary_create(0, 0, 0);
    xpc_dictionary_set_uint64(v9, "kCBMsgArgAccessoryManagerID", a1);
    xpc_dictionary_set_uint64(v9, "kCBMsgArgBTDevice", a2);
    *(_QWORD *)buf = 0;
    v19 = buf;
    v20 = 0x2000000000;
    v21 = 0;
    v14 = 0;
    v15 = &v14;
    v16 = 0x2000000000;
    v17 = 0;
    v13[0] = 0;
    v13[1] = v13;
    v13[2] = 0x2000000000;
    v13[3] = 0;
    v12[0] = MEMORY[0x1E0C809B0];
    v12[1] = 0x40000000;
    v12[2] = __BTAccessoryManagerGetSensorStreamingFrequency_block_invoke;
    v12[3] = &unk_1E6B05860;
    v12[4] = buf;
    v12[5] = &v14;
    v12[6] = v13;
    sendMessageWithReplySync(v8, "kCBMsgIdAccessoryGetSensorStreamingFrequencyMsg", v9, (uint64_t)v12);
    if (v9)
      xpc_release(v9);
    *a3 = v15[3];
    v10 = *((unsigned int *)v19 + 6);
    _Block_object_dispose(v13, 8);
    _Block_object_dispose(&v14, 8);
    _Block_object_dispose(buf, 8);
  }
  else
  {
    if (MBFLogInitOnce != -1)
      dispatch_once_f(&MBFLogInitOnce, 0, (dispatch_function_t)MBFLogInit);
    if (os_log_type_enabled((os_log_t)MBFLogComponent, OS_LOG_TYPE_ERROR))
      BTAccessoryManagerRegisterDevice_cold_1();
    return 1;
  }
  return v10;
}

uint64_t BTAccessoryManagerGetGyroInformation(uint64_t a1, uint64_t a2, uint64_t a3, _WORD *a4)
{
  uint64_t MBXpcConnection;
  uint64_t v9;
  xpc_object_t v10;
  uint64_t v11;
  _QWORD v13[7];
  uint64_t v14;
  uint64_t *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t *v19;
  uint64_t v20;
  uint64_t v21;

  if (MBFLogInitOnce != -1)
    dispatch_once_f(&MBFLogInitOnce, 0, (dispatch_function_t)MBFLogInit);
  if (os_log_type_enabled((os_log_t)MBFLogComponent, OS_LOG_TYPE_DEBUG))
    BTAccessoryManagerGetGyroInformation_cold_2();
  MBXpcConnection = getMBXpcConnection(a1);
  if (MBXpcConnection)
  {
    v9 = MBXpcConnection;
    v10 = xpc_dictionary_create(0, 0, 0);
    xpc_dictionary_set_uint64(v10, "kCBMsgArgAccessoryManagerID", a1);
    xpc_dictionary_set_uint64(v10, "kCBMsgArgBTDevice", a2);
    v18 = 0;
    v19 = &v18;
    v20 = 0x2000000000;
    v21 = 0;
    v14 = 0;
    v15 = &v14;
    v16 = 0x2000000000;
    v17 = 0;
    v13[0] = MEMORY[0x1E0C809B0];
    v13[1] = 0x40000000;
    v13[2] = __BTAccessoryManagerGetGyroInformation_block_invoke;
    v13[3] = &unk_1E6B05888;
    v13[4] = &v18;
    v13[5] = &v14;
    v13[6] = a3;
    sendMessageWithReplySync(v9, "kCBMsgIdAccessoryGetGyroInformationMsg", v10, (uint64_t)v13);
    if (v10)
      xpc_release(v10);
    *a4 = v15[3];
    v11 = *((unsigned int *)v19 + 6);
    _Block_object_dispose(&v14, 8);
    _Block_object_dispose(&v18, 8);
  }
  else
  {
    if (MBFLogInitOnce != -1)
      dispatch_once_f(&MBFLogInitOnce, 0, (dispatch_function_t)MBFLogInit);
    if (os_log_type_enabled((os_log_t)MBFLogComponent, OS_LOG_TYPE_ERROR))
      BTAccessoryManagerRegisterDevice_cold_1();
    return 1;
  }
  return v11;
}

uint64_t BTAccessoryManagerIsGenuineAirPods(uint64_t a1, uint64_t a2, _DWORD *a3)
{
  NSObject *v6;
  uint64_t MBXpcConnection;
  uint64_t v8;
  xpc_object_t v9;
  uint64_t v10;
  _QWORD v12[6];
  uint64_t v13;
  uint64_t *v14;
  uint64_t v15;
  uint64_t v16;
  uint8_t buf[8];
  uint8_t *v18;
  uint64_t v19;
  uint64_t v20;

  if (MBFLogInitOnce != -1)
    dispatch_once_f(&MBFLogInitOnce, 0, (dispatch_function_t)MBFLogInit);
  v6 = MBFLogComponent;
  if (os_log_type_enabled((os_log_t)MBFLogComponent, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1B6BF1000, v6, OS_LOG_TYPE_DEFAULT, "BTAccessoryManagerIsGenuineAirPods over XPC", buf, 2u);
  }
  MBXpcConnection = getMBXpcConnection(a1);
  if (MBXpcConnection)
  {
    v8 = MBXpcConnection;
    v9 = xpc_dictionary_create(0, 0, 0);
    xpc_dictionary_set_uint64(v9, "kCBMsgArgAccessoryManagerID", a1);
    xpc_dictionary_set_uint64(v9, "kCBMsgArgBTDevice", a2);
    *(_QWORD *)buf = 0;
    v18 = buf;
    v19 = 0x2000000000;
    v20 = 0;
    v13 = 0;
    v14 = &v13;
    v15 = 0x2000000000;
    v16 = 0;
    v12[0] = MEMORY[0x1E0C809B0];
    v12[1] = 0x40000000;
    v12[2] = __BTAccessoryManagerIsGenuineAirPods_block_invoke;
    v12[3] = &unk_1E6B058B0;
    v12[4] = buf;
    v12[5] = &v13;
    sendMessageWithReplySync(v8, "kCBMsgIdDeviceIsGenuineAirPodsMsg", v9, (uint64_t)v12);
    if (v9)
      xpc_release(v9);
    *a3 = v14[3];
    v10 = *((unsigned int *)v18 + 6);
    _Block_object_dispose(&v13, 8);
    _Block_object_dispose(buf, 8);
  }
  else
  {
    if (MBFLogInitOnce != -1)
      dispatch_once_f(&MBFLogInitOnce, 0, (dispatch_function_t)MBFLogInit);
    if (os_log_type_enabled((os_log_t)MBFLogComponent, OS_LOG_TYPE_ERROR))
      BTAccessoryManagerRegisterDevice_cold_1();
    return 1;
  }
  return v10;
}

uint64_t BTAccessoryManagerGetCaseSerialNumbersForAppleProductId(uint64_t a1, unsigned int a2, uint64_t a3, uint64_t *a4, uint64_t a5)
{
  uint64_t MBXpcConnection;
  uint64_t v11;
  xpc_object_t v12;
  uint64_t v13;
  uint64_t v14;
  _QWORD v16[8];
  uint64_t v17;
  uint64_t *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t *v22;
  uint64_t v23;
  uint64_t v24;

  if (MBFLogInitOnce != -1)
    dispatch_once_f(&MBFLogInitOnce, 0, (dispatch_function_t)MBFLogInit);
  if (os_log_type_enabled((os_log_t)MBFLogComponent, OS_LOG_TYPE_DEBUG))
    BTAccessoryManagerGetCaseSerialNumbersForAppleProductId_cold_2();
  MBXpcConnection = getMBXpcConnection(a1);
  if (MBXpcConnection)
  {
    v11 = MBXpcConnection;
    v12 = xpc_dictionary_create(0, 0, 0);
    xpc_dictionary_set_uint64(v12, "kCBMsgArgAccessoryManagerID", a1);
    xpc_dictionary_set_uint64(v12, "kCBMsgArgProductId", a2);
    xpc_dictionary_set_uint64(v12, "kCBMsgArgBufferSize", a5);
    v21 = 0;
    v22 = &v21;
    v23 = 0x2000000000;
    v24 = 0;
    v17 = 0;
    v18 = &v17;
    v19 = 0x2000000000;
    v20 = 0;
    v16[0] = MEMORY[0x1E0C809B0];
    v16[1] = 0x40000000;
    v16[2] = __BTAccessoryManagerGetCaseSerialNumbersForAppleProductId_block_invoke;
    v16[3] = &unk_1E6B058D8;
    v16[4] = &v21;
    v16[5] = &v17;
    v16[6] = a3;
    v16[7] = a5;
    sendMessageWithReplySync(v11, "kCBMsgIdAccessoryGetCaseSerialNumbersForAppleProductIdMsg", v12, (uint64_t)v16);
    if (v12)
      xpc_release(v12);
    v13 = v18[3];
    if (v13 >= a5)
      v13 = a5;
    *a4 = v13;
    v14 = *((unsigned int *)v22 + 6);
    _Block_object_dispose(&v17, 8);
    _Block_object_dispose(&v21, 8);
  }
  else
  {
    if (MBFLogInitOnce != -1)
      dispatch_once_f(&MBFLogInitOnce, 0, (dispatch_function_t)MBFLogInit);
    if (os_log_type_enabled((os_log_t)MBFLogComponent, OS_LOG_TYPE_ERROR))
      BTAccessoryManagerRegisterDevice_cold_1();
    return 1;
  }
  return v14;
}

uint64_t BTAccessoryManagerGetCaseSerialNumbersForAppleProductIds(uint64_t a1, unsigned int *a2, int a3, uint64_t a4, uint64_t *a5, uint64_t a6)
{
  uint64_t v9;
  uint64_t MBXpcConnection;
  uint64_t v13;
  xpc_object_t v14;
  xpc_object_t v15;
  unsigned int v16;
  uint64_t v17;
  uint64_t v18;
  _QWORD v20[8];
  uint64_t v21;
  uint64_t *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t *v26;
  uint64_t v27;
  uint64_t v28;

  LODWORD(v9) = a3;
  if (MBFLogInitOnce != -1)
    dispatch_once_f(&MBFLogInitOnce, 0, (dispatch_function_t)MBFLogInit);
  if (os_log_type_enabled((os_log_t)MBFLogComponent, OS_LOG_TYPE_DEBUG))
    BTAccessoryManagerGetCaseSerialNumbersForAppleProductIds_cold_3();
  MBXpcConnection = getMBXpcConnection(a1);
  if (MBXpcConnection)
  {
    v13 = MBXpcConnection;
    if (!a2 || !(_DWORD)v9)
    {
      if (MBFLogInitOnce != -1)
        dispatch_once_f(&MBFLogInitOnce, 0, (dispatch_function_t)MBFLogInit);
      if (os_log_type_enabled((os_log_t)MBFLogComponent, OS_LOG_TYPE_ERROR))
        BTAccessoryManagerGetCaseSerialNumbersForAppleProductIds_cold_2();
    }
    v14 = xpc_dictionary_create(0, 0, 0);
    xpc_dictionary_set_uint64(v14, "kCBMsgArgAccessoryManagerID", a1);
    xpc_dictionary_set_uint64(v14, "kCBMsgArgBufferSize", a6);
    v15 = xpc_array_create(0, 0);
    if ((_DWORD)v9)
    {
      v9 = v9;
      do
      {
        v16 = *a2++;
        xpc_array_set_uint64(v15, 0xFFFFFFFFFFFFFFFFLL, v16);
        --v9;
      }
      while (v9);
    }
    xpc_dictionary_set_value(v14, "kCBMsgArgProductIds", v15);
    v25 = 0;
    v26 = &v25;
    v27 = 0x2000000000;
    v28 = 0;
    v21 = 0;
    v22 = &v21;
    v23 = 0x2000000000;
    v24 = 0;
    v20[0] = MEMORY[0x1E0C809B0];
    v20[1] = 0x40000000;
    v20[2] = __BTAccessoryManagerGetCaseSerialNumbersForAppleProductIds_block_invoke;
    v20[3] = &unk_1E6B05900;
    v20[4] = &v25;
    v20[5] = &v21;
    v20[6] = a4;
    v20[7] = a6;
    sendMessageWithReplySync(v13, "kCBMsgIdAccessoryGetCaseSerialNumbersForAppleProductIdsMsg", v14, (uint64_t)v20);
    if (v14)
      xpc_release(v14);
    v17 = v22[3];
    if (v17 >= a6)
      v17 = a6;
    *a5 = v17;
    v18 = *((unsigned int *)v26 + 6);
    _Block_object_dispose(&v21, 8);
    _Block_object_dispose(&v25, 8);
  }
  else
  {
    if (MBFLogInitOnce != -1)
      dispatch_once_f(&MBFLogInitOnce, 0, (dispatch_function_t)MBFLogInit);
    if (os_log_type_enabled((os_log_t)MBFLogComponent, OS_LOG_TYPE_ERROR))
      BTAccessoryManagerRegisterDevice_cold_1();
    return 1;
  }
  return v18;
}

uint64_t BTAccessoryManagerGetPrimaryBudSide(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t MBXpcConnection;
  uint64_t v7;
  xpc_object_t v8;
  uint64_t v9;
  _QWORD v11[6];
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t v15;

  if (MBFLogInitOnce != -1)
    dispatch_once_f(&MBFLogInitOnce, 0, (dispatch_function_t)MBFLogInit);
  if (os_log_type_enabled((os_log_t)MBFLogComponent, OS_LOG_TYPE_DEBUG))
    BTAccessoryManagerGetPrimaryBudSide_cold_2();
  MBXpcConnection = getMBXpcConnection(a1);
  if (MBXpcConnection)
  {
    v7 = MBXpcConnection;
    v8 = xpc_dictionary_create(0, 0, 0);
    xpc_dictionary_set_uint64(v8, "kCBMsgArgAccessoryManagerID", a1);
    xpc_dictionary_set_uint64(v8, "kCBMsgArgBTDevice", a2);
    xpc_dictionary_set_uint64(v8, "kCBMsgArgResult", a3);
    v12 = 0;
    v13 = &v12;
    v14 = 0x2000000000;
    v15 = 0;
    v11[0] = MEMORY[0x1E0C809B0];
    v11[1] = 0x40000000;
    v11[2] = __BTAccessoryManagerGetPrimaryBudSide_block_invoke;
    v11[3] = &unk_1E6B05928;
    v11[4] = &v12;
    v11[5] = a3;
    sendMessageWithReplySync(v7, "kCBMsgIdAccessoryGetPrimaryBudSideMsg", v8, (uint64_t)v11);
    if (v8)
      xpc_release(v8);
    v9 = *((unsigned int *)v13 + 6);
    _Block_object_dispose(&v12, 8);
  }
  else
  {
    if (MBFLogInitOnce != -1)
      dispatch_once_f(&MBFLogInitOnce, 0, (dispatch_function_t)MBFLogInit);
    if (os_log_type_enabled((os_log_t)MBFLogComponent, OS_LOG_TYPE_ERROR))
      BTAccessoryManagerRegisterDevice_cold_1();
    return 1;
  }
  return v9;
}

uint64_t BTAccessoryManagerGetHeadphoneFeatureValue(uint64_t a1, uint64_t a2, unsigned int a3, _DWORD *a4)
{
  NSObject *v8;
  uint64_t MBXpcConnection;
  uint64_t v10;
  xpc_object_t v11;
  uint64_t v12;
  _QWORD v14[6];
  uint64_t v15;
  uint64_t *v16;
  uint64_t v17;
  uint64_t v18;
  uint8_t buf[8];
  uint8_t *v20;
  uint64_t v21;
  uint64_t v22;

  if (MBFLogInitOnce != -1)
    dispatch_once_f(&MBFLogInitOnce, 0, (dispatch_function_t)MBFLogInit);
  v8 = MBFLogComponent;
  if (os_log_type_enabled((os_log_t)MBFLogComponent, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1B6BF1000, v8, OS_LOG_TYPE_DEFAULT, "BTAccessoryManagerGetHeadphoneFeatureValue over XPC", buf, 2u);
  }
  MBXpcConnection = getMBXpcConnection(a1);
  if (MBXpcConnection)
  {
    v10 = MBXpcConnection;
    v11 = xpc_dictionary_create(0, 0, 0);
    xpc_dictionary_set_uint64(v11, "kCBMsgArgAccessoryManagerID", a1);
    xpc_dictionary_set_uint64(v11, "kCBMsgArgBTDevice", a2);
    xpc_dictionary_set_uint64(v11, "kCBMsgArgHeadphoneFeatureType", a3);
    *(_QWORD *)buf = 0;
    v20 = buf;
    v21 = 0x2000000000;
    v22 = 0;
    v15 = 0;
    v16 = &v15;
    v17 = 0x2000000000;
    v18 = 0;
    v14[0] = MEMORY[0x1E0C809B0];
    v14[1] = 0x40000000;
    v14[2] = __BTAccessoryManagerGetHeadphoneFeatureValue_block_invoke;
    v14[3] = &unk_1E6B05950;
    v14[4] = buf;
    v14[5] = &v15;
    sendMessageWithReplySync(v10, "kCBMsgIdAccessoryGetHeadphoneFeatureValueMsg", v11, (uint64_t)v14);
    if (v11)
      xpc_release(v11);
    *a4 = v16[3];
    v12 = *((unsigned int *)v20 + 6);
    _Block_object_dispose(&v15, 8);
    _Block_object_dispose(buf, 8);
  }
  else
  {
    if (MBFLogInitOnce != -1)
      dispatch_once_f(&MBFLogInitOnce, 0, (dispatch_function_t)MBFLogInit);
    if (os_log_type_enabled((os_log_t)MBFLogComponent, OS_LOG_TYPE_ERROR))
      BTAccessoryManagerRegisterDevice_cold_1();
    return 1;
  }
  return v12;
}

uint64_t BTAccessoryManagerSetHeadphoneFeatureValue(uint64_t a1, uint64_t a2, unsigned int a3, unsigned int a4)
{
  uint64_t MBXpcConnection;
  uint64_t v9;
  xpc_object_t v10;
  uint64_t v11;
  _QWORD v13[5];
  uint64_t v14;
  uint64_t *v15;
  uint64_t v16;
  uint64_t v17;

  if (MBFLogInitOnce != -1)
    dispatch_once_f(&MBFLogInitOnce, 0, (dispatch_function_t)MBFLogInit);
  if (os_log_type_enabled((os_log_t)MBFLogComponent, OS_LOG_TYPE_DEBUG))
    BTAccessoryManagerSetDeviceSoundProfileAllowed_cold_2();
  MBXpcConnection = getMBXpcConnection(a1);
  if (MBXpcConnection)
  {
    v9 = MBXpcConnection;
    v10 = xpc_dictionary_create(0, 0, 0);
    xpc_dictionary_set_uint64(v10, "kCBMsgArgAccessoryManagerID", a1);
    xpc_dictionary_set_uint64(v10, "kCBMsgArgBTDevice", a2);
    xpc_dictionary_set_uint64(v10, "kCBMsgArgHeadphoneFeatureType", a3);
    xpc_dictionary_set_uint64(v10, "kCBMsgArgHeadphoneFeatureValue", a4);
    v14 = 0;
    v15 = &v14;
    v16 = 0x2000000000;
    v17 = 0;
    v13[0] = MEMORY[0x1E0C809B0];
    v13[1] = 0x40000000;
    v13[2] = __BTAccessoryManagerSetHeadphoneFeatureValue_block_invoke;
    v13[3] = &unk_1E6B05978;
    v13[4] = &v14;
    sendMessageWithReplySync(v9, "kCBMsgIdAccessorySetHeadphoneFeatureValueMsg", v10, (uint64_t)v13);
    if (v10)
      xpc_release(v10);
    v11 = *((unsigned int *)v15 + 6);
    _Block_object_dispose(&v14, 8);
  }
  else
  {
    if (MBFLogInitOnce != -1)
      dispatch_once_f(&MBFLogInitOnce, 0, (dispatch_function_t)MBFLogInit);
    if (os_log_type_enabled((os_log_t)MBFLogComponent, OS_LOG_TYPE_ERROR))
      BTAccessoryManagerRegisterDevice_cold_1();
    return 1;
  }
  return v11;
}

uint64_t accessoryManagerXpcDisconnectedHandler(uint64_t a1)
{
  if (MBFLogInitOnce != -1)
    dispatch_once_f(&MBFLogInitOnce, 0, (dispatch_function_t)MBFLogInit);
  if (os_log_type_enabled((os_log_t)MBFLogComponent, OS_LOG_TYPE_ERROR))
    accessoryManagerXpcDisconnectedHandler_cold_1();
  return _localBTAccessoryManagerRemoveAllCallbacksByXpcConnection(a1);
}

uint64_t accessoryManagerXpcMsgHandler(uint64_t a1, const char *a2, xpc_object_t xdict)
{
  uint64_t uint64;
  uint64_t v7;
  __int128 *Callbacks;
  uint64_t *CustomCallbacks;
  NSObject *v10;
  uint64_t CustomCallbackMsgType;
  int v12;
  uint64_t v13;
  const void *v14;
  NSObject *v15;
  uint64_t v16;
  void (*v17)(uint64_t, uint64_t, uint64_t, const void *, size_t, uint64_t);
  uint64_t *v18;
  size_t v19;
  uint64_t v20;
  size_t v21;
  uint64_t v22;
  uint64_t v23;
  NSObject *v24;
  NSObject *v25;
  uint64_t *v26;
  void (*v27)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t);
  uint64_t UserData;
  unsigned __int8 v29;
  const void *data;
  uint64_t v31;
  void (*v32)(uint64_t, uint64_t, uint64_t, _QWORD, const void *, uint64_t, uint64_t);
  uint64_t *v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  unsigned int *v37;
  unint64_t v38;
  const void *v39;
  uint64_t *v40;
  uint64_t v41;
  void (*v42)(uint64_t, uint64_t, unint64_t, uint64_t, const void *, uint64_t, uint64_t);
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  unsigned __int16 v47;
  unsigned __int16 v48;
  uint64_t v49;
  void (*v50)(uint64_t, uint64_t, uint64_t, _QWORD, _QWORD, uint64_t);
  uint64_t v51;
  uint64_t v52;
  NSObject *v53;
  const char *v55;
  void (*v56)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t);
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t *v64;
  size_t length;
  _BYTE v66[12];
  __int16 v67;
  _BYTE v68[74];
  __int16 v69;
  uint64_t *v70;
  uint64_t v71;

  v71 = *MEMORY[0x1E0C80C00];
  uint64 = xpc_dictionary_get_uint64(xdict, "kCBMsgArgAccessoryManagerID");
  v7 = xpc_dictionary_get_uint64(xdict, "kCBMsgArgID");
  Callbacks = _localBTAccessoryManagerGetCallbacks(uint64, v7);
  CustomCallbacks = _localBTAccessoryManagerGetCustomCallbacks(uint64, v7);
  if (MBFLogInitOnce != -1)
    dispatch_once_f(&MBFLogInitOnce, 0, (dispatch_function_t)MBFLogInit);
  v10 = MBFLogComponent;
  if (os_log_type_enabled((os_log_t)MBFLogComponent, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)v66 = 136316674;
    *(_QWORD *)&v66[4] = a2;
    v67 = 2080;
    *(_QWORD *)v68 = a1 + 2080;
    *(_WORD *)&v68[8] = 2080;
    *(_QWORD *)&v68[10] = a1 + 2336;
    *(_WORD *)&v68[18] = 2048;
    *(_QWORD *)&v68[20] = uint64;
    *(_WORD *)&v68[28] = 2048;
    *(_QWORD *)&v68[30] = v7;
    *(_WORD *)&v68[38] = 2048;
    *(_QWORD *)&v68[40] = Callbacks;
    *(_WORD *)&v68[48] = 2048;
    *(_QWORD *)&v68[50] = CustomCallbacks;
    _os_log_debug_impl(&dword_1B6BF1000, v10, OS_LOG_TYPE_DEBUG, "accessoryManagerXpcMsgHandler msg:%s sessionName:%s serviceName:%s manager:%llx cbid:%llx cb:%llx customCbs:%llx", v66, 0x48u);
  }
  if (!strcmp(a2, "kCBMsgIdAccessoryEvent"))
  {
    if (!Callbacks || !*(_QWORD *)Callbacks)
      goto LABEL_37;
    v61 = xpc_dictionary_get_uint64(xdict, "kCBMsgArgEvent");
    v22 = xpc_dictionary_get_uint64(xdict, "kCBMsgArgBTDevice");
    v23 = xpc_dictionary_get_uint64(xdict, "kCBMsgArgState");
    if (MBFLogInitOnce != -1)
      dispatch_once_f(&MBFLogInitOnce, 0, (dispatch_function_t)MBFLogInit);
    v24 = MBFLogComponent;
    if (os_log_type_enabled((os_log_t)MBFLogComponent, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)v66 = 136315906;
      *(_QWORD *)&v66[4] = a2;
      v67 = 2048;
      *(_QWORD *)v68 = v61;
      *(_WORD *)&v68[8] = 2048;
      *(_QWORD *)&v68[10] = v22;
      *(_WORD *)&v68[18] = 2048;
      *(_QWORD *)&v68[20] = v23;
      _os_log_debug_impl(&dword_1B6BF1000, v24, OS_LOG_TYPE_DEBUG, "accessoryManagerXpcMsgHandler msg:%s, event:%llu, device:%llu, accessoryState:%llu", v66, 0x2Au);
      if (MBFLogInitOnce != -1)
        dispatch_once_f(&MBFLogInitOnce, 0, (dispatch_function_t)MBFLogInit);
    }
    v25 = MBFLogComponent;
    if (os_log_type_enabled((os_log_t)MBFLogComponent, OS_LOG_TYPE_DEBUG))
    {
      v56 = *(void (**)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))Callbacks;
      *(_DWORD *)v66 = 136316930;
      *(_QWORD *)&v66[4] = a2;
      v67 = 2080;
      *(_QWORD *)v68 = a1 + 2080;
      *(_WORD *)&v68[8] = 2080;
      *(_QWORD *)&v68[10] = a1 + 2336;
      *(_WORD *)&v68[18] = 2048;
      *(_QWORD *)&v68[20] = uint64;
      *(_WORD *)&v68[28] = 2048;
      *(_QWORD *)&v68[30] = v7;
      *(_WORD *)&v68[38] = 2048;
      *(_QWORD *)&v68[40] = Callbacks;
      *(_WORD *)&v68[48] = 2048;
      *(_QWORD *)&v68[50] = CustomCallbacks;
      *(_WORD *)&v68[58] = 2048;
      *(_QWORD *)&v68[60] = v56;
      _os_log_debug_impl(&dword_1B6BF1000, v25, OS_LOG_TYPE_DEBUG, "accessoryManagerXpcMsgHandler msg:%s sessionName:%s serviceName:%s manager:%llx cbid:%llx cb:%llx customCbs:%llx cb->accevent:%llx", v66, 0x52u);
    }
    v26 = CustomCallbacks;
    v27 = *(void (**)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))Callbacks;
    UserData = _localBTAccessoryManagerGetUserData(uint64, v7);
    v27(uint64, v61, v22, v23, UserData);
    CustomCallbacks = v26;
    v13 = 1;
    goto LABEL_38;
  }
  if (!strcmp(a2, "kCBMsgIdAccessorySetupCommand"))
  {
    if (!Callbacks || !*((_QWORD *)Callbacks + 1))
      goto LABEL_37;
    v62 = xpc_dictionary_get_uint64(xdict, "kCBMsgArgBTDevice");
    v58 = xpc_dictionary_get_uint64(xdict, "kCBMsgArgSetupType");
    v29 = xpc_dictionary_get_uint64(xdict, "kCBMsgArgOPType");
    *(_QWORD *)v66 = 0;
    data = xpc_dictionary_get_data(xdict, "kCBMsgArgData", (size_t *)v66);
    v31 = a1;
    v32 = (void (*)(uint64_t, uint64_t, uint64_t, _QWORD, const void *, uint64_t, uint64_t))*((_QWORD *)Callbacks + 1);
    v33 = CustomCallbacks;
    v34 = *(unsigned __int16 *)v66;
    v35 = _localBTAccessoryManagerGetUserData(uint64, v7);
    v36 = v34;
    CustomCallbacks = v33;
    v32(uint64, v62, v58, v29, data, v36, v35);
    a1 = v31;
    goto LABEL_36;
  }
  if (!strcmp(a2, "kCBMsgIdAccessoryRelayMsgRecv"))
  {
    if (!Callbacks || !*((_QWORD *)Callbacks + 2))
      goto LABEL_37;
    v63 = xpc_dictionary_get_uint64(xdict, "kCBMsgArgBTDevice");
    v59 = xpc_dictionary_get_uint64(xdict, "kCBMsgArgRelayMsgType");
    v37 = (unsigned int *)xpc_dictionary_get_data(xdict, "kCBMsgArgAddressBytes", 0);
    v38 = *v37 | ((unint64_t)*((unsigned __int16 *)v37 + 2) << 32);
    *(_QWORD *)v66 = 0;
    v39 = xpc_dictionary_get_data(xdict, "kCBMsgArgData", (size_t *)v66);
    v40 = CustomCallbacks;
    v41 = a1;
    v42 = (void (*)(uint64_t, uint64_t, unint64_t, uint64_t, const void *, uint64_t, uint64_t))*((_QWORD *)Callbacks + 2);
    v43 = *(unsigned __int16 *)v66;
    v44 = _localBTAccessoryManagerGetUserData(uint64, v7);
    v42(uint64, v63, v38, v59, v39, v43, v44);
    a1 = v41;
    CustomCallbacks = v40;
    goto LABEL_36;
  }
  if (!strcmp(a2, "kCBMsgIdAccessoryCommandStatus"))
  {
    if (!Callbacks || !*((_QWORD *)Callbacks + 3))
      goto LABEL_37;
    v64 = CustomCallbacks;
    v45 = xpc_dictionary_get_uint64(xdict, "kCBMsgArgBTDevice");
    v46 = xpc_dictionary_get_uint64(xdict, "kCBMsgArgCmdReqType");
    v47 = xpc_dictionary_get_uint64(xdict, "kCBMsgArgResult");
    v48 = xpc_dictionary_get_uint64(xdict, "kCBMsgArgReason");
    v49 = a1;
    v50 = (void (*)(uint64_t, uint64_t, uint64_t, _QWORD, _QWORD, uint64_t))*((_QWORD *)Callbacks + 3);
    v51 = _localBTAccessoryManagerGetUserData(uint64, v7);
    v52 = v45;
    CustomCallbacks = v64;
    v50(uint64, v52, v46, v47, v48, v51);
    a1 = v49;
LABEL_36:
    v13 = 1;
    goto LABEL_38;
  }
  if (strcmp(a2, "kCBMsgIdAccessoryCustomMessage"))
    goto LABEL_37;
  CustomCallbackMsgType = _localBTAccessoryManagerGetCustomCallbackMsgType(uint64, v7);
  v12 = xpc_dictionary_get_uint64(xdict, "kCBMsgArgCustomMessageType");
  v13 = 0;
  if (CustomCallbacks && (_DWORD)CustomCallbackMsgType && (_DWORD)CustomCallbackMsgType == v12)
  {
    if (*CustomCallbacks)
    {
      v60 = xpc_dictionary_get_uint64(xdict, "kCBMsgArgBTDevice");
      length = 0;
      v14 = xpc_dictionary_get_data(xdict, "kCBMsgArgData", &length);
      if (MBFLogInitOnce != -1)
        dispatch_once_f(&MBFLogInitOnce, 0, (dispatch_function_t)MBFLogInit);
      v15 = MBFLogComponent;
      if (os_log_type_enabled((os_log_t)MBFLogComponent, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)v66 = 136317442;
        *(_QWORD *)&v66[4] = a2;
        v67 = 1024;
        *(_DWORD *)v68 = CustomCallbackMsgType;
        *(_WORD *)&v68[4] = 2048;
        *(_QWORD *)&v68[6] = v60;
        *(_WORD *)&v68[14] = 2048;
        *(_QWORD *)&v68[16] = length;
        *(_WORD *)&v68[24] = 2080;
        *(_QWORD *)&v68[26] = a1 + 2080;
        *(_WORD *)&v68[34] = 2080;
        *(_QWORD *)&v68[36] = a1 + 2336;
        *(_WORD *)&v68[44] = 2048;
        *(_QWORD *)&v68[46] = uint64;
        *(_WORD *)&v68[54] = 2048;
        *(_QWORD *)&v68[56] = v7;
        *(_WORD *)&v68[64] = 2048;
        *(_QWORD *)&v68[66] = Callbacks;
        v69 = 2048;
        v70 = CustomCallbacks;
        _os_log_debug_impl(&dword_1B6BF1000, v15, OS_LOG_TYPE_DEBUG, "accessoryManagerXpcMsgHandler msg:%s, clientType:%X, device:%llX, dataLen:%zu sessionName:%s serviceName:%s manager:%llx cbid:%llx cbs:%p customCbs:%p ", v66, 0x62u);
        if ((CustomCallbackMsgType & 0x40) == 0)
          goto LABEL_18;
      }
      else if ((CustomCallbackMsgType & 0x40) == 0)
      {
LABEL_18:
        v16 = a1;
        v17 = (void (*)(uint64_t, uint64_t, uint64_t, const void *, size_t, uint64_t))*CustomCallbacks;
        v18 = CustomCallbacks;
        v19 = length;
        v20 = _localBTAccessoryManagerGetUserData(uint64, v7);
        v21 = v19;
        CustomCallbacks = v18;
        v17(uint64, v60, CustomCallbackMsgType, v14, v21, v20);
        a1 = v16;
LABEL_49:
        v13 = 1;
        goto LABEL_38;
      }
      v57 = xpc_dictionary_get_uint64(xdict, "kCBMsgArgUserData");
      ((void (*)(uint64_t, uint64_t, uint64_t, const void *, size_t, uint64_t))*CustomCallbacks)(uint64, v60, CustomCallbackMsgType, v14, length, v57);
      goto LABEL_49;
    }
LABEL_37:
    v13 = 0;
  }
LABEL_38:
  if (MBFLogInitOnce != -1)
    dispatch_once_f(&MBFLogInitOnce, 0, (dispatch_function_t)MBFLogInit);
  v53 = MBFLogComponent;
  if (os_log_type_enabled((os_log_t)MBFLogComponent, OS_LOG_TYPE_DEBUG))
  {
    v55 = "did not handle";
    *(_DWORD *)v66 = 136316930;
    if ((_DWORD)v13)
      v55 = "handled";
    *(_QWORD *)&v66[4] = v55;
    v67 = 2080;
    *(_QWORD *)v68 = a2;
    *(_WORD *)&v68[8] = 2080;
    *(_QWORD *)&v68[10] = a1 + 2080;
    *(_WORD *)&v68[18] = 2080;
    *(_QWORD *)&v68[20] = a1 + 2336;
    *(_WORD *)&v68[28] = 2048;
    *(_QWORD *)&v68[30] = uint64;
    *(_WORD *)&v68[38] = 2048;
    *(_QWORD *)&v68[40] = v7;
    *(_WORD *)&v68[48] = 2048;
    *(_QWORD *)&v68[50] = Callbacks;
    *(_WORD *)&v68[58] = 2048;
    *(_QWORD *)&v68[60] = CustomCallbacks;
    _os_log_debug_impl(&dword_1B6BF1000, v53, OS_LOG_TYPE_DEBUG, "accessoryManagerXpcMsgHandler %s %s sessionName:%s serviceName:%s manager:%llx cbid:%llx cb:%llx customCbs:%llx", v66, 0x52u);
  }
  return v13;
}

void OUTLINED_FUNCTION_0(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 0xCu);
}

void OUTLINED_FUNCTION_1(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_debug_impl(a1, a2, OS_LOG_TYPE_DEBUG, a4, &a9, 2u);
}

void OUTLINED_FUNCTION_2(uint64_t a1@<X8>)
{
  uint64_t v1;

  *(_QWORD *)(v1 - 8) = a1;
}

void OUTLINED_FUNCTION_3(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_debug_impl(a1, a2, OS_LOG_TYPE_DEBUG, a4, &a9, 0xCu);
}

void OUTLINED_FUNCTION_9(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint8_t *a5)
{
  _os_log_debug_impl(a1, a2, OS_LOG_TYPE_DEBUG, a4, a5, 0x16u);
}

void OUTLINED_FUNCTION_10(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 2u);
}

void OUTLINED_FUNCTION_13(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint8_t *a5)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, a5, 0x16u);
}

void handleReset(uint64_t a1)
{
  NSObject *v2;
  _QWORD block[5];

  if (MBFLogInitOnce != -1)
    dispatch_once_f(&MBFLogInitOnce, 0, (dispatch_function_t)MBFLogInit);
  if (os_log_type_enabled((os_log_t)MBFLogComponent, OS_LOG_TYPE_DEBUG))
    handleReset_cold_1();
  v2 = *(NSObject **)(a1 + 2056);
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 0x40000000;
  block[2] = __handleReset_block_invoke;
  block[3] = &__block_descriptor_tmp_8;
  block[4] = a1;
  dispatch_async(v2, block);
}

uint64_t __handleReset_block_invoke(uint64_t a1)
{
  return (***(uint64_t (****)(_QWORD))(a1 + 32))(*(_QWORD *)(a1 + 32));
}

void handleInvalid(uint64_t a1)
{
  NSObject *v2;
  _QWORD block[5];

  if (MBFLogInitOnce != -1)
    dispatch_once_f(&MBFLogInitOnce, 0, (dispatch_function_t)MBFLogInit);
  if (os_log_type_enabled((os_log_t)MBFLogComponent, OS_LOG_TYPE_DEBUG))
    handleInvalid_cold_1();
  v2 = *(NSObject **)(a1 + 2056);
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 0x40000000;
  block[2] = __handleInvalid_block_invoke;
  block[3] = &__block_descriptor_tmp_9_0;
  block[4] = a1;
  dispatch_async(v2, block);
}

uint64_t __handleInvalid_block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD))(**(_QWORD **)(a1 + 32) + 8))(*(_QWORD *)(a1 + 32));
}

void handleMsg(uint64_t a1, xpc_object_t object)
{
  NSObject *v3;
  NSObject *v4;
  _QWORD v5[8];
  _QWORD v6[3];
  xpc_object_t value;
  uint64_t v8;
  _QWORD v9[2];
  const char *string;
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  xpc_object_t v14;

  v11 = 0;
  v12 = &v11;
  v13 = 0x2000000000;
  v14 = 0;
  v14 = xpc_copy(object);
  v8 = 0;
  v9[0] = &v8;
  v9[1] = 0x2000000000;
  string = 0;
  string = xpc_dictionary_get_string((xpc_object_t)v12[3], "kCBMsgId");
  v6[0] = 0;
  v6[1] = v6;
  v6[2] = 0x2000000000;
  value = 0;
  value = xpc_dictionary_get_value((xpc_object_t)v12[3], "kCBMsgArgs");
  if (MBFLogInitOnce != -1)
    dispatch_once_f(&MBFLogInitOnce, 0, (dispatch_function_t)MBFLogInit);
  v3 = MBFLogComponent;
  if (os_log_type_enabled((os_log_t)MBFLogComponent, OS_LOG_TYPE_DEBUG))
    handleMsg_cold_1(a1, (uint64_t)v9, v3);
  v4 = *(NSObject **)(a1 + 2056);
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 0x40000000;
  v5[2] = __handleMsg_block_invoke;
  v5[3] = &unk_1E6B05A08;
  v5[4] = &v8;
  v5[5] = v6;
  v5[6] = &v11;
  v5[7] = a1;
  dispatch_async(v4, v5);
  _Block_object_dispose(v6, 8);
  _Block_object_dispose(&v8, 8);
  _Block_object_dispose(&v11, 8);
}

void __handleMsg_block_invoke(uint64_t a1)
{
  (*(void (**)(_QWORD, _QWORD, _QWORD))(**(_QWORD **)(a1 + 56) + 16))(*(_QWORD *)(a1 + 56), *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24), *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24));
  xpc_release(*(xpc_object_t *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24));
}

void handleConnectionEvent(_xpc_connection_s *a1, void *a2)
{
  uint64_t v4;
  void *context;
  uint64_t v6;

  v4 = MEMORY[0x1BCC9F4AC](a2);
  context = xpc_connection_get_context(a1);
  if (context)
  {
    v6 = (uint64_t)context;
    if (MBFLogInitOnce != -1)
      dispatch_once_f(&MBFLogInitOnce, 0, (dispatch_function_t)MBFLogInit);
    if (os_log_type_enabled((os_log_t)MBFLogComponent, OS_LOG_TYPE_DEBUG))
      handleConnectionEvent_cold_6();
    if (v4 == MEMORY[0x1E0C812F8])
    {
      handleMsg(v6, a2);
    }
    else if (v4 == MEMORY[0x1E0C81310])
    {
      xpc_dictionary_get_string(a2, (const char *)*MEMORY[0x1E0C81270]);
      if (a2 == (void *)MEMORY[0x1E0C81258])
      {
        if (MBFLogInitOnce != -1)
          dispatch_once_f(&MBFLogInitOnce, 0, (dispatch_function_t)MBFLogInit);
        if (os_log_type_enabled((os_log_t)MBFLogComponent, OS_LOG_TYPE_DEBUG))
          handleConnectionEvent_cold_2();
        handleReset(v6);
      }
      else if (a2 == (void *)MEMORY[0x1E0C81260])
      {
        if (MBFLogInitOnce != -1)
          dispatch_once_f(&MBFLogInitOnce, 0, (dispatch_function_t)MBFLogInit);
        if (os_log_type_enabled((os_log_t)MBFLogComponent, OS_LOG_TYPE_DEBUG))
          handleConnectionEvent_cold_3();
        handleInvalid(v6);
      }
      else
      {
        if (MBFLogInitOnce != -1)
          dispatch_once_f(&MBFLogInitOnce, 0, (dispatch_function_t)MBFLogInit);
        if (os_log_type_enabled((os_log_t)MBFLogComponent, OS_LOG_TYPE_ERROR))
          handleConnectionEvent_cold_4();
      }
    }
    else
    {
      if (MBFLogInitOnce != -1)
        dispatch_once_f(&MBFLogInitOnce, 0, (dispatch_function_t)MBFLogInit);
      if (os_log_type_enabled((os_log_t)MBFLogComponent, OS_LOG_TYPE_ERROR))
        handleConnectionEvent_cold_5();
    }
  }
  else
  {
    if (MBFLogInitOnce != -1)
      dispatch_once_f(&MBFLogInitOnce, 0, (dispatch_function_t)MBFLogInit);
    if (os_log_type_enabled((os_log_t)MBFLogComponent, OS_LOG_TYPE_FAULT))
      handleConnectionEvent_cold_1();
  }
}

void __createXpcConnection_block_invoke(uint64_t a1, void *a2)
{
  handleConnectionEvent(*(_xpc_connection_s **)(*(_QWORD *)(a1 + 32) + 2072), a2);
}

void releaseMBXpcConnection(_QWORD *a1)
{
  NSObject *v2;
  NSObject *v3;

  if (MBFLogInitOnce != -1)
    dispatch_once_f(&MBFLogInitOnce, 0, (dispatch_function_t)MBFLogInit);
  if (os_log_type_enabled((os_log_t)MBFLogComponent, OS_LOG_TYPE_DEBUG))
    releaseMBXpcConnection_cold_1();
  if (a1[259])
    a1[259] = 0;
  if (*a1)
    *a1 = 0;
  v2 = a1[258];
  if (v2)
  {
    dispatch_release(v2);
    a1[258] = 0;
  }
  v3 = a1[257];
  if (v3)
    dispatch_release(v3);
  free(a1);
}

void releaseXPCConnection(uint64_t a1)
{
  if (MBFLogInitOnce != -1)
    dispatch_once_f(&MBFLogInitOnce, 0, (dispatch_function_t)MBFLogInit);
  if (os_log_type_enabled((os_log_t)MBFLogComponent, OS_LOG_TYPE_DEBUG))
    releaseXPCConnection_cold_1();
  xpc_release(*(xpc_object_t *)(a1 + 2072));
}

void sendMsg(uint64_t a1, const char *a2, void *a3)
{
  xpc_object_t v6;
  xpc_object_t object[2];
  char *keys[2];
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  if (MBFLogInitOnce != -1)
    dispatch_once_f(&MBFLogInitOnce, 0, (dispatch_function_t)MBFLogInit);
  if (os_log_type_enabled((os_log_t)MBFLogComponent, OS_LOG_TYPE_DEBUG))
    sendMsg_cold_1();
  *(_OWORD *)keys = xmmword_1E6B05A48;
  object[0] = xpc_string_create(a2);
  object[1] = a3;
  v6 = xpc_dictionary_create((const char *const *)keys, object, 2uLL);
  xpc_connection_send_message(*(xpc_connection_t *)(a1 + 2072), v6);
  xpc_release(v6);
  xpc_release(object[0]);
}

void disconnect(uint64_t a1)
{
  if (MBFLogInitOnce != -1)
    dispatch_once_f(&MBFLogInitOnce, 0, (dispatch_function_t)MBFLogInit);
  if (os_log_type_enabled((os_log_t)MBFLogComponent, OS_LOG_TYPE_DEBUG))
    disconnect_cold_1();
  bzero((void *)(a1 + 8), 0x800uLL);
  *(_QWORD *)(a1 + 2600) = 0;
  xpc_connection_cancel(*(xpc_connection_t *)(a1 + 2072));
}

void OUTLINED_FUNCTION_5_0(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint8_t *a5)
{
  _os_log_debug_impl(a1, a2, OS_LOG_TYPE_DEBUG, a4, a5, 0x20u);
}

void OUTLINED_FUNCTION_6_0(void *a1, uint64_t a2, os_log_t log, const char *a4, ...)
{
  va_list va;

  va_start(va, a4);
  _os_log_debug_impl(a1, log, OS_LOG_TYPE_DEBUG, a4, (uint8_t *)va, 0x2Au);
}

uint64_t _localBTDeviceServiceGetCBID(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;

  pthread_mutex_lock(&gLock_0);
  v4 = 0;
  while (gBTDeviceServiceCallbackList[v4 + 1] != a1 || gBTDeviceServiceCallbackList[v4] != a2)
  {
    v4 += 5;
    if (v4 == 320)
    {
      v5 = 0;
      goto LABEL_7;
    }
  }
  v5 = gBTDeviceServiceCallbackList[v4 + 3];
LABEL_7:
  pthread_mutex_unlock(&gLock_0);
  return v5;
}

uint64_t _localBTDeviceServiceRemoveCallbacks(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t *v5;

  pthread_mutex_lock(&gLock_0);
  v4 = 0;
  while (gBTDeviceServiceCallbackList[v4 + 1] != a1 || gBTDeviceServiceCallbackList[v4] != a2)
  {
    v4 += 5;
    if (v4 == 320)
      goto LABEL_7;
  }
  v5 = &gBTDeviceServiceCallbackList[v4];
  v5[4] = 0;
  *(_OWORD *)v5 = 0u;
  *((_OWORD *)v5 + 1) = 0u;
LABEL_7:
  pthread_mutex_unlock(&gLock_0);
  return 0;
}

uint64_t _localBTDeviceServiceRemoveCallbacksByXpcConnection(uint64_t a1)
{
  uint64_t i;
  uint64_t *v3;

  pthread_mutex_lock(&gLock_0);
  for (i = 0; i != 320; i += 5)
  {
    v3 = &gBTDeviceServiceCallbackList[i];
    if (gBTDeviceServiceCallbackList[i + 2] == a1)
    {
      v3[4] = 0;
      *(_OWORD *)v3 = 0uLL;
      *((_OWORD *)v3 + 1) = 0uLL;
    }
  }
  pthread_mutex_unlock(&gLock_0);
  return 0;
}

uint64_t _localBTDeviceServiceGetCallbacks(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t *v6;

  pthread_mutex_lock(&gLock_0);
  v4 = 0;
  v5 = 0;
  do
  {
    v6 = &gBTDeviceServiceCallbackList[v4];
    if (gBTDeviceServiceCallbackList[v4 + 1] == a1 && v6[3] == a2)
      v5 = *v6;
    v4 += 5;
  }
  while (v4 != 320);
  pthread_mutex_unlock(&gLock_0);
  return v5;
}

uint64_t _localBTDeviceServiceGetUserData(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;

  pthread_mutex_lock(&gLock_0);
  v4 = 0;
  while (gBTDeviceServiceCallbackList[v4 + 1] != a1 || gBTDeviceServiceCallbackList[v4 + 3] != a2)
  {
    v4 += 5;
    if (v4 == 320)
    {
      v5 = 0;
      goto LABEL_7;
    }
  }
  v5 = gBTDeviceServiceCallbackList[v4 + 4];
LABEL_7:
  pthread_mutex_unlock(&gLock_0);
  return v5;
}

uint64_t BTDeviceAddressToString(const void *a1, _BYTE *a2, uint64_t a3)
{
  uint64_t FirstSessionHandle;
  uint64_t MBXpcConnection;
  uint64_t v8;
  xpc_object_t v9;
  uint64_t v10;
  _QWORD v12[7];
  uint64_t v13;
  uint64_t *v14;
  uint64_t v15;
  uint64_t v16;

  if (!a3)
    return 1;
  *a2 = 0;
  FirstSessionHandle = getFirstSessionHandle();
  if (MBFLogInitOnce != -1)
    dispatch_once_f(&MBFLogInitOnce, 0, (dispatch_function_t)MBFLogInit);
  if (os_log_type_enabled((os_log_t)MBFLogComponent, OS_LOG_TYPE_DEBUG))
    BTDeviceAddressToString_cold_2();
  MBXpcConnection = getMBXpcConnection(FirstSessionHandle);
  if (!MBXpcConnection)
  {
    if (MBFLogInitOnce != -1)
      dispatch_once_f(&MBFLogInitOnce, 0, (dispatch_function_t)MBFLogInit);
    if (os_log_type_enabled((os_log_t)MBFLogComponent, OS_LOG_TYPE_ERROR))
      BTDeviceAddressToString_cold_1();
    return 1;
  }
  v8 = MBXpcConnection;
  v9 = xpc_dictionary_create(0, 0, 0);
  xpc_dictionary_set_data(v9, "kCBMsgArgAddressBytes", a1, 6uLL);
  xpc_dictionary_set_uint64(v9, "kCBMsgArgAddressStringBuffSize", a3);
  v13 = 0;
  v14 = &v13;
  v15 = 0x2000000000;
  v16 = 0;
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 0x40000000;
  v12[2] = __BTDeviceAddressToString_block_invoke;
  v12[3] = &unk_1E6B05A60;
  v12[4] = &v13;
  v12[5] = a2;
  v12[6] = a3;
  sendMessageWithReplySync(v8, "kCBMsgIdDeviceAddressToStringMsg", v9, (uint64_t)v12);
  if (v9)
    xpc_release(v9);
  v10 = *((unsigned int *)v14 + 6);
  _Block_object_dispose(&v13, 8);
  return v10;
}

uint64_t BTDeviceFromIdentifier(uint64_t *a1, const unsigned __int8 *a2, _QWORD *a3)
{
  uint64_t SessionHandle;
  uint64_t MBXpcConnection;
  uint64_t v8;
  xpc_object_t v9;
  uint64_t v10;
  _QWORD v12[6];
  uint64_t v13;
  uint64_t *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t *v18;
  uint64_t v19;
  uint64_t v20;

  SessionHandle = getSessionHandle(a1);
  if (MBFLogInitOnce != -1)
    dispatch_once_f(&MBFLogInitOnce, 0, (dispatch_function_t)MBFLogInit);
  if (os_log_type_enabled((os_log_t)MBFLogComponent, OS_LOG_TYPE_DEBUG))
    BTDeviceFromIdentifier_cold_2();
  MBXpcConnection = getMBXpcConnection((uint64_t)a1);
  if (MBXpcConnection)
  {
    v8 = MBXpcConnection;
    v9 = xpc_dictionary_create(0, 0, 0);
    xpc_dictionary_set_uuid(v9, "kCBMsgArgUUID", a2);
    xpc_dictionary_set_uint64(v9, "kCBMsgArgSessionID", SessionHandle);
    v17 = 0;
    v18 = &v17;
    v19 = 0x2000000000;
    v20 = 0;
    v13 = 0;
    v14 = &v13;
    v15 = 0x2000000000;
    v16 = 0;
    v12[0] = MEMORY[0x1E0C809B0];
    v12[1] = 0x40000000;
    v12[2] = __BTDeviceFromIdentifier_block_invoke;
    v12[3] = &unk_1E6B05AD8;
    v12[4] = &v17;
    v12[5] = &v13;
    sendMessageWithReplySync(v8, "kCBMsgIdDeviceFromIdentifierMsg", v9, (uint64_t)v12);
    if (v9)
      xpc_release(v9);
    *a3 = v14[3];
    v10 = *((unsigned int *)v18 + 6);
    _Block_object_dispose(&v13, 8);
    _Block_object_dispose(&v17, 8);
  }
  else
  {
    if (MBFLogInitOnce != -1)
      dispatch_once_f(&MBFLogInitOnce, 0, (dispatch_function_t)MBFLogInit);
    if (os_log_type_enabled((os_log_t)MBFLogComponent, OS_LOG_TYPE_ERROR))
      BTDeviceFromAddress_cold_1();
    return 1;
  }
  return v10;
}

uint64_t BTDeviceGetAddressString(uint64_t a1, _BYTE *a2, uint64_t a3)
{
  uint64_t MBXpcConnection;
  uint64_t v7;
  xpc_object_t v8;
  uint64_t v9;
  _QWORD v11[7];
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t v15;

  *a2 = 0;
  if (MBFLogInitOnce != -1)
    dispatch_once_f(&MBFLogInitOnce, 0, (dispatch_function_t)MBFLogInit);
  if (os_log_type_enabled((os_log_t)MBFLogComponent, OS_LOG_TYPE_DEBUG))
    BTDeviceGetAddressString_cold_2();
  MBXpcConnection = getMBXpcConnection(a1);
  if (MBXpcConnection)
  {
    v7 = MBXpcConnection;
    v8 = xpc_dictionary_create(0, 0, 0);
    xpc_dictionary_set_uint64(v8, "kCBMsgArgBTDevice", a1);
    xpc_dictionary_set_uint64(v8, "kCBMsgArgBufferSize", a3);
    v12 = 0;
    v13 = &v12;
    v14 = 0x2000000000;
    v15 = 0;
    v11[0] = MEMORY[0x1E0C809B0];
    v11[1] = 0x40000000;
    v11[2] = __BTDeviceGetAddressString_block_invoke;
    v11[3] = &unk_1E6B05B00;
    v11[4] = &v12;
    v11[5] = a2;
    v11[6] = a3;
    sendMessageWithReplySync(v7, "kCBMsgIdDeviceGetAddressStringMsg", v8, (uint64_t)v11);
    if (v8)
      xpc_release(v8);
    v9 = *((unsigned int *)v13 + 6);
    _Block_object_dispose(&v12, 8);
  }
  else
  {
    if (MBFLogInitOnce != -1)
      dispatch_once_f(&MBFLogInitOnce, 0, (dispatch_function_t)MBFLogInit);
    if (os_log_type_enabled((os_log_t)MBFLogComponent, OS_LOG_TYPE_ERROR))
      BTDeviceGetAddressString_cold_1();
    return 1;
  }
  return v9;
}

uint64_t BTDeviceGetDeviceType(uint64_t a1, _DWORD *a2)
{
  uint64_t MBXpcConnection;
  uint64_t v5;
  xpc_object_t v6;
  uint64_t v7;
  _QWORD v9[6];
  uint64_t v10;
  uint64_t *v11;
  uint64_t v12;
  int v13;
  uint64_t v14;
  uint64_t *v15;
  uint64_t v16;
  uint64_t v17;

  if (MBFLogInitOnce != -1)
    dispatch_once_f(&MBFLogInitOnce, 0, (dispatch_function_t)MBFLogInit);
  if (os_log_type_enabled((os_log_t)MBFLogComponent, OS_LOG_TYPE_DEBUG))
    BTDeviceGetDeviceType_cold_2();
  MBXpcConnection = getMBXpcConnection(a1);
  if (MBXpcConnection)
  {
    v5 = MBXpcConnection;
    v6 = xpc_dictionary_create(0, 0, 0);
    xpc_dictionary_set_uint64(v6, "kCBMsgArgBTDevice", a1);
    v14 = 0;
    v15 = &v14;
    v16 = 0x2000000000;
    v17 = 0;
    v10 = 0;
    v11 = &v10;
    v12 = 0x2000000000;
    v13 = 0;
    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 0x40000000;
    v9[2] = __BTDeviceGetDeviceType_block_invoke;
    v9[3] = &unk_1E6B05B28;
    v9[4] = &v14;
    v9[5] = &v10;
    sendMessageWithReplySync(v5, "kCBMsgIdDeviceGetDeviceTypeMsg", v6, (uint64_t)v9);
    if (v6)
      xpc_release(v6);
    *a2 = *((_DWORD *)v11 + 6);
    v7 = *((unsigned int *)v15 + 6);
    _Block_object_dispose(&v10, 8);
    _Block_object_dispose(&v14, 8);
  }
  else
  {
    if (MBFLogInitOnce != -1)
      dispatch_once_f(&MBFLogInitOnce, 0, (dispatch_function_t)MBFLogInit);
    if (os_log_type_enabled((os_log_t)MBFLogComponent, OS_LOG_TYPE_ERROR))
      BTDeviceGetAddressString_cold_1();
    return 1;
  }
  return v7;
}

uint64_t BTDeviceGetDeviceClass(uint64_t a1, _DWORD *a2)
{
  uint64_t MBXpcConnection;
  uint64_t v5;
  xpc_object_t v6;
  uint64_t v7;
  _QWORD v9[6];
  uint64_t v10;
  uint64_t *v11;
  uint64_t v12;
  int v13;
  uint64_t v14;
  uint64_t *v15;
  uint64_t v16;
  uint64_t v17;

  if (MBFLogInitOnce != -1)
    dispatch_once_f(&MBFLogInitOnce, 0, (dispatch_function_t)MBFLogInit);
  if (os_log_type_enabled((os_log_t)MBFLogComponent, OS_LOG_TYPE_DEBUG))
    BTDeviceGetDeviceClass_cold_2();
  MBXpcConnection = getMBXpcConnection(a1);
  if (MBXpcConnection)
  {
    v5 = MBXpcConnection;
    v6 = xpc_dictionary_create(0, 0, 0);
    xpc_dictionary_set_uint64(v6, "kCBMsgArgBTDevice", a1);
    v14 = 0;
    v15 = &v14;
    v16 = 0x2000000000;
    v17 = 0;
    v10 = 0;
    v11 = &v10;
    v12 = 0x2000000000;
    v13 = 0;
    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 0x40000000;
    v9[2] = __BTDeviceGetDeviceClass_block_invoke;
    v9[3] = &unk_1E6B05B50;
    v9[4] = &v14;
    v9[5] = &v10;
    sendMessageWithReplySync(v5, "kCBMsgIdDeviceGetDeviceClassMsg", v6, (uint64_t)v9);
    if (v6)
      xpc_release(v6);
    *a2 = *((_DWORD *)v11 + 6);
    v7 = *((unsigned int *)v15 + 6);
    _Block_object_dispose(&v10, 8);
    _Block_object_dispose(&v14, 8);
  }
  else
  {
    if (MBFLogInitOnce != -1)
      dispatch_once_f(&MBFLogInitOnce, 0, (dispatch_function_t)MBFLogInit);
    if (os_log_type_enabled((os_log_t)MBFLogComponent, OS_LOG_TYPE_ERROR))
      BTDeviceGetAddressString_cold_1();
    return 1;
  }
  return v7;
}

uint64_t BTDeviceGetDefaultName(uint64_t a1, _BYTE *a2, uint64_t a3)
{
  uint64_t MBXpcConnection;
  uint64_t v7;
  xpc_object_t v8;
  uint64_t v9;
  _QWORD v11[7];
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t v15;

  if (!a3)
    return 1;
  *a2 = 0;
  if (MBFLogInitOnce != -1)
    dispatch_once_f(&MBFLogInitOnce, 0, (dispatch_function_t)MBFLogInit);
  if (os_log_type_enabled((os_log_t)MBFLogComponent, OS_LOG_TYPE_DEBUG))
    BTDeviceGetDefaultName_cold_2();
  MBXpcConnection = getMBXpcConnection(a1);
  if (!MBXpcConnection)
  {
    if (MBFLogInitOnce != -1)
      dispatch_once_f(&MBFLogInitOnce, 0, (dispatch_function_t)MBFLogInit);
    if (os_log_type_enabled((os_log_t)MBFLogComponent, OS_LOG_TYPE_ERROR))
      BTDeviceGetAddressString_cold_1();
    return 1;
  }
  v7 = MBXpcConnection;
  v8 = xpc_dictionary_create(0, 0, 0);
  xpc_dictionary_set_uint64(v8, "kCBMsgArgBTDevice", a1);
  xpc_dictionary_set_uint64(v8, "kCBMsgArgBufferSize", a3);
  v12 = 0;
  v13 = &v12;
  v14 = 0x2000000000;
  v15 = 0;
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 0x40000000;
  v11[2] = __BTDeviceGetDefaultName_block_invoke;
  v11[3] = &unk_1E6B05B78;
  v11[4] = &v12;
  v11[5] = a2;
  v11[6] = a3;
  sendMessageWithReplySync(v7, "kCBMsgIdDeviceGetDefaultNameMsg", v8, (uint64_t)v11);
  if (v8)
    xpc_release(v8);
  v9 = *((unsigned int *)v13 + 6);
  _Block_object_dispose(&v12, 8);
  return v9;
}

uint64_t BTDeviceGetProductName(uint64_t a1, _BYTE *a2, uint64_t a3)
{
  uint64_t MBXpcConnection;
  uint64_t v7;
  xpc_object_t v8;
  uint64_t v9;
  _QWORD v11[7];
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t v15;

  if (!a3)
    return 1;
  *a2 = 0;
  if (MBFLogInitOnce != -1)
    dispatch_once_f(&MBFLogInitOnce, 0, (dispatch_function_t)MBFLogInit);
  if (os_log_type_enabled((os_log_t)MBFLogComponent, OS_LOG_TYPE_DEBUG))
    BTDeviceGetProductName_cold_2();
  MBXpcConnection = getMBXpcConnection(a1);
  if (!MBXpcConnection)
  {
    if (MBFLogInitOnce != -1)
      dispatch_once_f(&MBFLogInitOnce, 0, (dispatch_function_t)MBFLogInit);
    if (os_log_type_enabled((os_log_t)MBFLogComponent, OS_LOG_TYPE_ERROR))
      BTDeviceGetAddressString_cold_1();
    return 1;
  }
  v7 = MBXpcConnection;
  v8 = xpc_dictionary_create(0, 0, 0);
  xpc_dictionary_set_uint64(v8, "kCBMsgArgBTDevice", a1);
  xpc_dictionary_set_uint64(v8, "kCBMsgArgBufferSize", a3);
  v12 = 0;
  v13 = &v12;
  v14 = 0x2000000000;
  v15 = 0;
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 0x40000000;
  v11[2] = __BTDeviceGetProductName_block_invoke;
  v11[3] = &unk_1E6B05BA0;
  v11[4] = &v12;
  v11[5] = a2;
  v11[6] = a3;
  sendMessageWithReplySync(v7, "kCBMsgIdDeviceGetProductNameMsg", v8, (uint64_t)v11);
  if (v8)
    xpc_release(v8);
  v9 = *((unsigned int *)v13 + 6);
  _Block_object_dispose(&v12, 8);
  return v9;
}

uint64_t BTDeviceGetName(uint64_t a1, _BYTE *a2, uint64_t a3)
{
  uint64_t MBXpcConnection;
  uint64_t v7;
  xpc_object_t v8;
  uint64_t v9;
  _QWORD v11[7];
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t v15;

  if (!a3)
    return 1;
  *a2 = 0;
  if (MBFLogInitOnce != -1)
    dispatch_once_f(&MBFLogInitOnce, 0, (dispatch_function_t)MBFLogInit);
  if (os_log_type_enabled((os_log_t)MBFLogComponent, OS_LOG_TYPE_DEBUG))
    BTDeviceGetName_cold_2();
  MBXpcConnection = getMBXpcConnection(a1);
  if (!MBXpcConnection)
  {
    if (MBFLogInitOnce != -1)
      dispatch_once_f(&MBFLogInitOnce, 0, (dispatch_function_t)MBFLogInit);
    if (os_log_type_enabled((os_log_t)MBFLogComponent, OS_LOG_TYPE_ERROR))
      BTDeviceGetAddressString_cold_1();
    return 1;
  }
  v7 = MBXpcConnection;
  v8 = xpc_dictionary_create(0, 0, 0);
  xpc_dictionary_set_uint64(v8, "kCBMsgArgBTDevice", a1);
  xpc_dictionary_set_uint64(v8, "kCBMsgArgBufferSize", a3);
  v12 = 0;
  v13 = &v12;
  v14 = 0x2000000000;
  v15 = 0;
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 0x40000000;
  v11[2] = __BTDeviceGetName_block_invoke;
  v11[3] = &unk_1E6B05BC8;
  v11[4] = &v12;
  v11[5] = a2;
  v11[6] = a3;
  sendMessageWithReplySync(v7, "kCBMsgIdDeviceGetNameMsg", v8, (uint64_t)v11);
  if (v8)
    xpc_release(v8);
  v9 = *((unsigned int *)v13 + 6);
  _Block_object_dispose(&v12, 8);
  return v9;
}

uint64_t BTDeviceSetUserName(uint64_t a1, const char *a2)
{
  uint64_t MBXpcConnection;
  uint64_t v5;
  xpc_object_t v6;
  uint64_t v7;
  _QWORD v9[5];
  uint64_t v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t v13;

  if (MBFLogInitOnce != -1)
    dispatch_once_f(&MBFLogInitOnce, 0, (dispatch_function_t)MBFLogInit);
  if (os_log_type_enabled((os_log_t)MBFLogComponent, OS_LOG_TYPE_DEBUG))
    BTDeviceSetUserName_cold_2();
  MBXpcConnection = getMBXpcConnection(a1);
  if (MBXpcConnection)
  {
    v5 = MBXpcConnection;
    v6 = xpc_dictionary_create(0, 0, 0);
    xpc_dictionary_set_uint64(v6, "kCBMsgArgBTDevice", a1);
    xpc_dictionary_set_string(v6, "kCBMsgArgName", a2);
    v10 = 0;
    v11 = &v10;
    v12 = 0x2000000000;
    v13 = 0;
    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 0x40000000;
    v9[2] = __BTDeviceSetUserName_block_invoke;
    v9[3] = &unk_1E6B05BF0;
    v9[4] = &v10;
    sendMessageWithReplySync(v5, "kCBMsgIdDeviceSetUserNameMsg", v6, (uint64_t)v9);
    if (v6)
      xpc_release(v6);
    v7 = *((unsigned int *)v11 + 6);
    _Block_object_dispose(&v10, 8);
  }
  else
  {
    if (MBFLogInitOnce != -1)
      dispatch_once_f(&MBFLogInitOnce, 0, (dispatch_function_t)MBFLogInit);
    if (os_log_type_enabled((os_log_t)MBFLogComponent, OS_LOG_TYPE_ERROR))
      BTDeviceGetAddressString_cold_1();
    return 1;
  }
  return v7;
}

uint64_t BTDeviceGetSyncSettings(uint64_t a1, _DWORD *a2)
{
  uint64_t MBXpcConnection;
  uint64_t v5;
  xpc_object_t v6;
  uint64_t v7;
  _QWORD v9[6];
  uint64_t v10;
  uint64_t *v11;
  uint64_t v12;
  int v13;
  uint64_t v14;
  uint64_t *v15;
  uint64_t v16;
  uint64_t v17;

  if (MBFLogInitOnce != -1)
    dispatch_once_f(&MBFLogInitOnce, 0, (dispatch_function_t)MBFLogInit);
  if (os_log_type_enabled((os_log_t)MBFLogComponent, OS_LOG_TYPE_DEBUG))
    BTDeviceGetSyncSettings_cold_2();
  MBXpcConnection = getMBXpcConnection(a1);
  if (MBXpcConnection)
  {
    v5 = MBXpcConnection;
    v6 = xpc_dictionary_create(0, 0, 0);
    xpc_dictionary_set_uint64(v6, "kCBMsgArgBTDevice", a1);
    v14 = 0;
    v15 = &v14;
    v16 = 0x2000000000;
    v17 = 0;
    v10 = 0;
    v11 = &v10;
    v12 = 0x2000000000;
    v13 = 0;
    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 0x40000000;
    v9[2] = __BTDeviceGetSyncSettings_block_invoke;
    v9[3] = &unk_1E6B05C18;
    v9[4] = &v14;
    v9[5] = &v10;
    sendMessageWithReplySync(v5, "kCBMsgIdDeviceGetSyncSettingsMsg", v6, (uint64_t)v9);
    if (v6)
      xpc_release(v6);
    *a2 = *((_DWORD *)v11 + 6);
    v7 = *((unsigned int *)v15 + 6);
    _Block_object_dispose(&v10, 8);
    _Block_object_dispose(&v14, 8);
  }
  else
  {
    if (MBFLogInitOnce != -1)
      dispatch_once_f(&MBFLogInitOnce, 0, (dispatch_function_t)MBFLogInit);
    if (os_log_type_enabled((os_log_t)MBFLogComponent, OS_LOG_TYPE_ERROR))
      BTDeviceGetAddressString_cold_1();
    return 1;
  }
  return v7;
}

uint64_t BTDeviceSetSyncSettings(uint64_t a1, unsigned int a2)
{
  uint64_t MBXpcConnection;
  uint64_t v5;
  xpc_object_t v6;
  uint64_t v7;
  _QWORD v9[5];
  uint64_t v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t v13;

  if (MBFLogInitOnce != -1)
    dispatch_once_f(&MBFLogInitOnce, 0, (dispatch_function_t)MBFLogInit);
  if (os_log_type_enabled((os_log_t)MBFLogComponent, OS_LOG_TYPE_DEBUG))
    BTDeviceSetSyncSettings_cold_2();
  MBXpcConnection = getMBXpcConnection(a1);
  if (MBXpcConnection)
  {
    v5 = MBXpcConnection;
    v6 = xpc_dictionary_create(0, 0, 0);
    xpc_dictionary_set_uint64(v6, "kCBMsgArgBTDevice", a1);
    xpc_dictionary_set_uint64(v6, "kCBMsgArgSyncSettings", a2);
    v10 = 0;
    v11 = &v10;
    v12 = 0x2000000000;
    v13 = 0;
    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 0x40000000;
    v9[2] = __BTDeviceSetSyncSettings_block_invoke;
    v9[3] = &unk_1E6B05C40;
    v9[4] = &v10;
    sendMessageWithReplySync(v5, "kCBMsgIdDeviceSetSyncSettingsMsg", v6, (uint64_t)v9);
    if (v6)
      xpc_release(v6);
    v7 = *((unsigned int *)v11 + 6);
    _Block_object_dispose(&v10, 8);
  }
  else
  {
    if (MBFLogInitOnce != -1)
      dispatch_once_f(&MBFLogInitOnce, 0, (dispatch_function_t)MBFLogInit);
    if (os_log_type_enabled((os_log_t)MBFLogComponent, OS_LOG_TYPE_ERROR))
      BTDeviceGetAddressString_cold_1();
    return 1;
  }
  return v7;
}

uint64_t BTDeviceGetGroups(uint64_t a1, uint64_t a2, _QWORD *a3, uint64_t a4)
{
  uint64_t MBXpcConnection;
  uint64_t v9;
  xpc_object_t v10;
  uint64_t v11;
  _QWORD v13[7];
  uint64_t v14;
  uint64_t *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t *v19;
  uint64_t v20;
  uint64_t v21;

  if (MBFLogInitOnce != -1)
    dispatch_once_f(&MBFLogInitOnce, 0, (dispatch_function_t)MBFLogInit);
  if (os_log_type_enabled((os_log_t)MBFLogComponent, OS_LOG_TYPE_DEBUG))
    BTDeviceGetGroups_cold_2();
  MBXpcConnection = getMBXpcConnection(a1);
  if (MBXpcConnection)
  {
    v9 = MBXpcConnection;
    v10 = xpc_dictionary_create(0, 0, 0);
    xpc_dictionary_set_uint64(v10, "kCBMsgArgBTDevice", a1);
    xpc_dictionary_set_uint64(v10, "kCBMsgArgGrouIdArraySize", a4);
    v18 = 0;
    v19 = &v18;
    v20 = 0x2000000000;
    v21 = 0;
    v14 = 0;
    v15 = &v14;
    v16 = 0x2000000000;
    v17 = 0;
    v13[0] = MEMORY[0x1E0C809B0];
    v13[1] = 0x40000000;
    v13[2] = __BTDeviceGetGroups_block_invoke;
    v13[3] = &unk_1E6B05C68;
    v13[4] = &v18;
    v13[5] = &v14;
    v13[6] = a2;
    sendMessageWithReplySync(v9, "kCBMsgIdDeviceGetGroupsMsg", v10, (uint64_t)v13);
    if (v10)
      xpc_release(v10);
    *a3 = v15[3];
    v11 = *((unsigned int *)v19 + 6);
    _Block_object_dispose(&v14, 8);
    _Block_object_dispose(&v18, 8);
  }
  else
  {
    if (MBFLogInitOnce != -1)
      dispatch_once_f(&MBFLogInitOnce, 0, (dispatch_function_t)MBFLogInit);
    if (os_log_type_enabled((os_log_t)MBFLogComponent, OS_LOG_TYPE_ERROR))
      BTDeviceGetAddressString_cold_1();
    return 1;
  }
  return v11;
}

uint64_t BTDeviceSetGroup(uint64_t a1, int a2, unsigned int a3)
{
  uint64_t MBXpcConnection;
  uint64_t v7;
  xpc_object_t v8;
  uint64_t v9;
  _QWORD v11[5];
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t v15;

  if (MBFLogInitOnce != -1)
    dispatch_once_f(&MBFLogInitOnce, 0, (dispatch_function_t)MBFLogInit);
  if (os_log_type_enabled((os_log_t)MBFLogComponent, OS_LOG_TYPE_DEBUG))
    BTDeviceSetGroup_cold_2();
  MBXpcConnection = getMBXpcConnection(a1);
  if (MBXpcConnection)
  {
    v7 = MBXpcConnection;
    v8 = xpc_dictionary_create(0, 0, 0);
    xpc_dictionary_set_uint64(v8, "kCBMsgArgBTDevice", a1);
    xpc_dictionary_set_uint64(v8, "kCBMsgArgGrouId", a2);
    xpc_dictionary_set_uint64(v8, "kCBMsgArgBool", a3);
    v12 = 0;
    v13 = &v12;
    v14 = 0x2000000000;
    v15 = 0;
    v11[0] = MEMORY[0x1E0C809B0];
    v11[1] = 0x40000000;
    v11[2] = __BTDeviceSetGroup_block_invoke;
    v11[3] = &unk_1E6B05C90;
    v11[4] = &v12;
    sendMessageWithReplySync(v7, "kCBMsgIdDeviceSetGroupMsg", v8, (uint64_t)v11);
    if (v8)
      xpc_release(v8);
    v9 = *((unsigned int *)v13 + 6);
    _Block_object_dispose(&v12, 8);
  }
  else
  {
    if (MBFLogInitOnce != -1)
      dispatch_once_f(&MBFLogInitOnce, 0, (dispatch_function_t)MBFLogInit);
    if (os_log_type_enabled((os_log_t)MBFLogComponent, OS_LOG_TYPE_ERROR))
      BTDeviceGetAddressString_cold_1();
    return 1;
  }
  return v9;
}

uint64_t BTDeviceGetPairingStatus(uint64_t a1, _DWORD *a2)
{
  uint64_t MBXpcConnection;
  uint64_t v5;
  xpc_object_t v6;
  uint64_t v7;
  _QWORD v9[6];
  uint64_t v10;
  uint64_t *v11;
  uint64_t v12;
  int v13;
  uint64_t v14;
  uint64_t *v15;
  uint64_t v16;
  uint64_t v17;

  if (MBFLogInitOnce != -1)
    dispatch_once_f(&MBFLogInitOnce, 0, (dispatch_function_t)MBFLogInit);
  if (os_log_type_enabled((os_log_t)MBFLogComponent, OS_LOG_TYPE_DEBUG))
    BTDeviceGetPairingStatus_cold_2();
  MBXpcConnection = getMBXpcConnection(a1);
  if (MBXpcConnection)
  {
    v5 = MBXpcConnection;
    v6 = xpc_dictionary_create(0, 0, 0);
    xpc_dictionary_set_uint64(v6, "kCBMsgArgBTDevice", a1);
    v14 = 0;
    v15 = &v14;
    v16 = 0x2000000000;
    v17 = 0;
    v10 = 0;
    v11 = &v10;
    v12 = 0x2000000000;
    v13 = 0;
    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 0x40000000;
    v9[2] = __BTDeviceGetPairingStatus_block_invoke;
    v9[3] = &unk_1E6B05CB8;
    v9[4] = &v14;
    v9[5] = &v10;
    sendMessageWithReplySync(v5, "kCBMsgIdDeviceGetPairingStatusMsg", v6, (uint64_t)v9);
    if (v6)
      xpc_release(v6);
    *a2 = *((_DWORD *)v11 + 6);
    v7 = *((unsigned int *)v15 + 6);
    _Block_object_dispose(&v10, 8);
    _Block_object_dispose(&v14, 8);
  }
  else
  {
    if (MBFLogInitOnce != -1)
      dispatch_once_f(&MBFLogInitOnce, 0, (dispatch_function_t)MBFLogInit);
    if (os_log_type_enabled((os_log_t)MBFLogComponent, OS_LOG_TYPE_ERROR))
      BTDeviceGetAddressString_cold_1();
    return 1;
  }
  return v7;
}

uint64_t BTDeviceGetCloudPairingStatus(uint64_t a1, _DWORD *a2)
{
  uint64_t MBXpcConnection;
  uint64_t v5;
  xpc_object_t v6;
  uint64_t v7;
  _QWORD v9[6];
  uint64_t v10;
  uint64_t *v11;
  uint64_t v12;
  int v13;
  uint64_t v14;
  uint64_t *v15;
  uint64_t v16;
  uint64_t v17;

  if (MBFLogInitOnce != -1)
    dispatch_once_f(&MBFLogInitOnce, 0, (dispatch_function_t)MBFLogInit);
  if (os_log_type_enabled((os_log_t)MBFLogComponent, OS_LOG_TYPE_DEBUG))
    BTDeviceGetCloudPairingStatus_cold_2();
  MBXpcConnection = getMBXpcConnection(a1);
  if (MBXpcConnection)
  {
    v5 = MBXpcConnection;
    v6 = xpc_dictionary_create(0, 0, 0);
    xpc_dictionary_set_uint64(v6, "kCBMsgArgBTDevice", a1);
    v14 = 0;
    v15 = &v14;
    v16 = 0x2000000000;
    v17 = 0;
    v10 = 0;
    v11 = &v10;
    v12 = 0x2000000000;
    v13 = 0;
    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 0x40000000;
    v9[2] = __BTDeviceGetCloudPairingStatus_block_invoke;
    v9[3] = &unk_1E6B05CE0;
    v9[4] = &v14;
    v9[5] = &v10;
    sendMessageWithReplySync(v5, "kCBMsgIdDeviceGetCloudPairingStatusMsg", v6, (uint64_t)v9);
    if (v6)
      xpc_release(v6);
    *a2 = *((_DWORD *)v11 + 6);
    v7 = *((unsigned int *)v15 + 6);
    _Block_object_dispose(&v10, 8);
    _Block_object_dispose(&v14, 8);
  }
  else
  {
    if (MBFLogInitOnce != -1)
      dispatch_once_f(&MBFLogInitOnce, 0, (dispatch_function_t)MBFLogInit);
    if (os_log_type_enabled((os_log_t)MBFLogComponent, OS_LOG_TYPE_ERROR))
      BTDeviceGetAddressString_cold_1();
    return 1;
  }
  return v7;
}

uint64_t BTDeviceGetMagicPairingStatus(uint64_t a1, _DWORD *a2)
{
  uint64_t MBXpcConnection;
  uint64_t v5;
  xpc_object_t v6;
  uint64_t v7;
  _QWORD v9[6];
  uint64_t v10;
  uint64_t *v11;
  uint64_t v12;
  int v13;
  uint64_t v14;
  uint64_t *v15;
  uint64_t v16;
  uint64_t v17;

  if (MBFLogInitOnce != -1)
    dispatch_once_f(&MBFLogInitOnce, 0, (dispatch_function_t)MBFLogInit);
  if (os_log_type_enabled((os_log_t)MBFLogComponent, OS_LOG_TYPE_DEBUG))
    BTDeviceGetMagicPairingStatus_cold_2();
  MBXpcConnection = getMBXpcConnection(a1);
  if (MBXpcConnection)
  {
    v5 = MBXpcConnection;
    v6 = xpc_dictionary_create(0, 0, 0);
    xpc_dictionary_set_uint64(v6, "kCBMsgArgBTDevice", a1);
    v14 = 0;
    v15 = &v14;
    v16 = 0x2000000000;
    v17 = 0;
    v10 = 0;
    v11 = &v10;
    v12 = 0x2000000000;
    v13 = 0;
    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 0x40000000;
    v9[2] = __BTDeviceGetMagicPairingStatus_block_invoke;
    v9[3] = &unk_1E6B05D08;
    v9[4] = &v14;
    v9[5] = &v10;
    sendMessageWithReplySync(v5, "kCBMsgIdDeviceGetMagicPairingStatusMsg", v6, (uint64_t)v9);
    if (v6)
      xpc_release(v6);
    *a2 = *((_DWORD *)v11 + 6);
    v7 = *((unsigned int *)v15 + 6);
    _Block_object_dispose(&v10, 8);
    _Block_object_dispose(&v14, 8);
  }
  else
  {
    if (MBFLogInitOnce != -1)
      dispatch_once_f(&MBFLogInitOnce, 0, (dispatch_function_t)MBFLogInit);
    if (os_log_type_enabled((os_log_t)MBFLogComponent, OS_LOG_TYPE_ERROR))
      BTDeviceGetAddressString_cold_1();
    return 1;
  }
  return v7;
}

uint64_t BTDeviceGetConnectionStatus(uint64_t a1, _DWORD *a2)
{
  uint64_t MBXpcConnection;
  uint64_t v5;
  xpc_object_t v6;
  uint64_t v7;
  _QWORD v9[6];
  uint64_t v10;
  uint64_t *v11;
  uint64_t v12;
  int v13;
  uint64_t v14;
  uint64_t *v15;
  uint64_t v16;
  uint64_t v17;

  if (MBFLogInitOnce != -1)
    dispatch_once_f(&MBFLogInitOnce, 0, (dispatch_function_t)MBFLogInit);
  if (os_log_type_enabled((os_log_t)MBFLogComponent, OS_LOG_TYPE_DEBUG))
    BTDeviceGetMagicPairingStatus_cold_2();
  MBXpcConnection = getMBXpcConnection(a1);
  if (MBXpcConnection)
  {
    v5 = MBXpcConnection;
    v6 = xpc_dictionary_create(0, 0, 0);
    xpc_dictionary_set_uint64(v6, "kCBMsgArgBTDevice", a1);
    v14 = 0;
    v15 = &v14;
    v16 = 0x2000000000;
    v17 = 0;
    v10 = 0;
    v11 = &v10;
    v12 = 0x2000000000;
    v13 = 0;
    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 0x40000000;
    v9[2] = __BTDeviceGetConnectionStatus_block_invoke;
    v9[3] = &unk_1E6B05D30;
    v9[4] = &v14;
    v9[5] = &v10;
    sendMessageWithReplySync(v5, "kCBMsgIdDeviceGetConnectionStatusMsg", v6, (uint64_t)v9);
    if (v6)
      xpc_release(v6);
    *a2 = *((_DWORD *)v11 + 6);
    v7 = *((unsigned int *)v15 + 6);
    _Block_object_dispose(&v10, 8);
    _Block_object_dispose(&v14, 8);
  }
  else
  {
    if (MBFLogInitOnce != -1)
      dispatch_once_f(&MBFLogInitOnce, 0, (dispatch_function_t)MBFLogInit);
    if (os_log_type_enabled((os_log_t)MBFLogComponent, OS_LOG_TYPE_ERROR))
      BTDeviceGetAddressString_cold_1();
    return 1;
  }
  return v7;
}

uint64_t BTDeviceIsAppleAudioDevice(uint64_t a1, _DWORD *a2)
{
  uint64_t MBXpcConnection;
  uint64_t v5;
  xpc_object_t v6;
  uint64_t v7;
  _QWORD v9[6];
  uint64_t v10;
  uint64_t *v11;
  uint64_t v12;
  int v13;
  uint64_t v14;
  uint64_t *v15;
  uint64_t v16;
  uint64_t v17;

  if (MBFLogInitOnce != -1)
    dispatch_once_f(&MBFLogInitOnce, 0, (dispatch_function_t)MBFLogInit);
  if (os_log_type_enabled((os_log_t)MBFLogComponent, OS_LOG_TYPE_DEBUG))
    BTDeviceIsAppleAudioDevice_cold_2();
  MBXpcConnection = getMBXpcConnection(a1);
  if (MBXpcConnection)
  {
    v5 = MBXpcConnection;
    v6 = xpc_dictionary_create(0, 0, 0);
    xpc_dictionary_set_uint64(v6, "kCBMsgArgBTDevice", a1);
    v14 = 0;
    v15 = &v14;
    v16 = 0x2000000000;
    v17 = 0;
    v10 = 0;
    v11 = &v10;
    v12 = 0x2000000000;
    v13 = 0;
    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 0x40000000;
    v9[2] = __BTDeviceIsAppleAudioDevice_block_invoke;
    v9[3] = &unk_1E6B05D58;
    v9[4] = &v14;
    v9[5] = &v10;
    sendMessageWithReplySync(v5, "kCBMsgIdDeviceIsAppleAudioDeviceMsg", v6, (uint64_t)v9);
    if (v6)
      xpc_release(v6);
    *a2 = *((_DWORD *)v11 + 6);
    v7 = *((unsigned int *)v15 + 6);
    _Block_object_dispose(&v10, 8);
    _Block_object_dispose(&v14, 8);
  }
  else
  {
    if (MBFLogInitOnce != -1)
      dispatch_once_f(&MBFLogInitOnce, 0, (dispatch_function_t)MBFLogInit);
    if (os_log_type_enabled((os_log_t)MBFLogComponent, OS_LOG_TYPE_ERROR))
      BTDeviceGetAddressString_cold_1();
    return 1;
  }
  return v7;
}

uint64_t BTDeviceSupportsHS(uint64_t a1, _DWORD *a2)
{
  uint64_t MBXpcConnection;
  uint64_t v5;
  xpc_object_t v6;
  uint64_t v7;
  _QWORD v9[6];
  uint64_t v10;
  uint64_t *v11;
  uint64_t v12;
  int v13;
  uint64_t v14;
  uint64_t *v15;
  uint64_t v16;
  uint64_t v17;

  if (MBFLogInitOnce != -1)
    dispatch_once_f(&MBFLogInitOnce, 0, (dispatch_function_t)MBFLogInit);
  if (os_log_type_enabled((os_log_t)MBFLogComponent, OS_LOG_TYPE_DEBUG))
    BTDeviceSupportsHS_cold_2();
  MBXpcConnection = getMBXpcConnection(a1);
  if (MBXpcConnection)
  {
    v5 = MBXpcConnection;
    v6 = xpc_dictionary_create(0, 0, 0);
    xpc_dictionary_set_uint64(v6, "kCBMsgArgBTDevice", a1);
    v14 = 0;
    v15 = &v14;
    v16 = 0x2000000000;
    v17 = 0;
    v10 = 0;
    v11 = &v10;
    v12 = 0x2000000000;
    v13 = 0;
    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 0x40000000;
    v9[2] = __BTDeviceSupportsHS_block_invoke;
    v9[3] = &unk_1E6B05D80;
    v9[4] = &v14;
    v9[5] = &v10;
    sendMessageWithReplySync(v5, "kCBMsgIdDeviceSupportsHSMsg", v6, (uint64_t)v9);
    if (v6)
      xpc_release(v6);
    *a2 = *((_DWORD *)v11 + 6);
    v7 = *((unsigned int *)v15 + 6);
    _Block_object_dispose(&v10, 8);
    _Block_object_dispose(&v14, 8);
  }
  else
  {
    if (MBFLogInitOnce != -1)
      dispatch_once_f(&MBFLogInitOnce, 0, (dispatch_function_t)MBFLogInit);
    if (os_log_type_enabled((os_log_t)MBFLogComponent, OS_LOG_TYPE_ERROR))
      BTDeviceGetAddressString_cold_1();
    return 1;
  }
  return v7;
}

uint64_t BTDeviceIsProController(uint64_t a1, _DWORD *a2)
{
  uint64_t MBXpcConnection;
  uint64_t v5;
  xpc_object_t v6;
  uint64_t v7;
  _QWORD v9[6];
  uint64_t v10;
  uint64_t *v11;
  uint64_t v12;
  int v13;
  uint64_t v14;
  uint64_t *v15;
  uint64_t v16;
  uint64_t v17;

  if (MBFLogInitOnce != -1)
    dispatch_once_f(&MBFLogInitOnce, 0, (dispatch_function_t)MBFLogInit);
  if (os_log_type_enabled((os_log_t)MBFLogComponent, OS_LOG_TYPE_DEBUG))
    BTDeviceIsProController_cold_2();
  MBXpcConnection = getMBXpcConnection(a1);
  if (MBXpcConnection)
  {
    v5 = MBXpcConnection;
    v6 = xpc_dictionary_create(0, 0, 0);
    xpc_dictionary_set_uint64(v6, "kCBMsgArgBTDevice", a1);
    v14 = 0;
    v15 = &v14;
    v16 = 0x2000000000;
    v17 = 0;
    v10 = 0;
    v11 = &v10;
    v12 = 0x2000000000;
    v13 = 0;
    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 0x40000000;
    v9[2] = __BTDeviceIsProController_block_invoke;
    v9[3] = &unk_1E6B05DA8;
    v9[4] = &v14;
    v9[5] = &v10;
    sendMessageWithReplySync(v5, "kCBMsgIdDeviceIsProControllerMsg", v6, (uint64_t)v9);
    if (v6)
      xpc_release(v6);
    *a2 = *((_DWORD *)v11 + 6);
    v7 = *((unsigned int *)v15 + 6);
    _Block_object_dispose(&v10, 8);
    _Block_object_dispose(&v14, 8);
  }
  else
  {
    if (MBFLogInitOnce != -1)
      dispatch_once_f(&MBFLogInitOnce, 0, (dispatch_function_t)MBFLogInit);
    if (os_log_type_enabled((os_log_t)MBFLogComponent, OS_LOG_TYPE_ERROR))
      BTDeviceGetAddressString_cold_1();
    return 1;
  }
  return v7;
}

uint64_t BTServiceRemoveCallbacks(uint64_t *a1, uint64_t a2)
{
  uint64_t SessionHandle;
  uint64_t MBXpcConnection;
  uint64_t v6;
  uint64_t CBID;
  uint64_t v8;
  uint64_t v9;
  xpc_object_t v10;
  _QWORD v12[5];
  uint64_t v13;
  uint64_t *v14;
  uint64_t v15;
  uint64_t v16;

  SessionHandle = getSessionHandle(a1);
  if (MBFLogInitOnce != -1)
    dispatch_once_f(&MBFLogInitOnce, 0, (dispatch_function_t)MBFLogInit);
  if (os_log_type_enabled((os_log_t)MBFLogComponent, OS_LOG_TYPE_DEBUG))
    BTServiceRemoveCallbacks_cold_2();
  MBXpcConnection = getMBXpcConnection((uint64_t)a1);
  if (MBXpcConnection)
  {
    v6 = MBXpcConnection;
    CBID = _localBTDeviceServiceGetCBID(SessionHandle, a2);
    v13 = 0;
    v14 = &v13;
    v15 = 0x2000000000;
    v8 = 3;
    v16 = 3;
    if (CBID)
    {
      v9 = CBID;
      v10 = xpc_dictionary_create(0, 0, 0);
      xpc_dictionary_set_uint64(v10, "kCBMsgArgSessionID", SessionHandle);
      xpc_dictionary_set_uint64(v10, "kCBMsgArgID", v9);
      v12[0] = MEMORY[0x1E0C809B0];
      v12[1] = 0x40000000;
      v12[2] = __BTServiceRemoveCallbacks_block_invoke;
      v12[3] = &unk_1E6B05DF8;
      v12[4] = &v13;
      sendMessageWithReplySync(v6, "kCBMsgIdDeviceServiceRemoveCallbacksMsg", v10, (uint64_t)v12);
      if (v10)
        xpc_release(v10);
      v8 = v14[3];
      if (!v8)
      {
        _localBTDeviceServiceRemoveCallbacks(SessionHandle, a2);
        v8 = v14[3];
      }
    }
    _Block_object_dispose(&v13, 8);
  }
  else
  {
    if (MBFLogInitOnce != -1)
      dispatch_once_f(&MBFLogInitOnce, 0, (dispatch_function_t)MBFLogInit);
    if (os_log_type_enabled((os_log_t)MBFLogComponent, OS_LOG_TYPE_ERROR))
      BTAccessoryManagerRegisterDevice_cold_1();
    return 1;
  }
  return v8;
}

uint64_t BTDeviceSetAuthorizedServices()
{
  return 2;
}

uint64_t BTDeviceGetAuthorizedServices()
{
  return 2;
}

uint64_t BTDeviceConnect(uint64_t a1)
{
  uint64_t MBXpcConnection;
  uint64_t v3;
  xpc_object_t v4;
  uint64_t v5;
  _QWORD v7[5];
  uint64_t v8;
  uint64_t *v9;
  uint64_t v10;
  uint64_t v11;

  if (MBFLogInitOnce != -1)
    dispatch_once_f(&MBFLogInitOnce, 0, (dispatch_function_t)MBFLogInit);
  if (os_log_type_enabled((os_log_t)MBFLogComponent, OS_LOG_TYPE_DEBUG))
    BTDeviceConnect_cold_2();
  MBXpcConnection = getMBXpcConnection(a1);
  if (MBXpcConnection)
  {
    v3 = MBXpcConnection;
    v4 = xpc_dictionary_create(0, 0, 0);
    xpc_dictionary_set_uint64(v4, "kCBMsgArgBTDevice", a1);
    v8 = 0;
    v9 = &v8;
    v10 = 0x2000000000;
    v11 = 0;
    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 0x40000000;
    v7[2] = __BTDeviceConnect_block_invoke;
    v7[3] = &unk_1E6B05E20;
    v7[4] = &v8;
    sendMessageWithReplySync(v3, "kCBMsgIdDeviceConnectMsg", v4, (uint64_t)v7);
    if (v4)
      xpc_release(v4);
    v5 = *((unsigned int *)v9 + 6);
    _Block_object_dispose(&v8, 8);
  }
  else
  {
    if (MBFLogInitOnce != -1)
      dispatch_once_f(&MBFLogInitOnce, 0, (dispatch_function_t)MBFLogInit);
    if (os_log_type_enabled((os_log_t)MBFLogComponent, OS_LOG_TYPE_ERROR))
      BTDeviceGetAddressString_cold_1();
    return 1;
  }
  return v5;
}

uint64_t BTDeviceConnectServices(uint64_t a1, unsigned int a2)
{
  uint64_t MBXpcConnection;
  uint64_t v5;
  xpc_object_t v6;
  uint64_t v7;
  _QWORD v9[5];
  uint64_t v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t v13;

  if (MBFLogInitOnce != -1)
    dispatch_once_f(&MBFLogInitOnce, 0, (dispatch_function_t)MBFLogInit);
  if (os_log_type_enabled((os_log_t)MBFLogComponent, OS_LOG_TYPE_DEBUG))
    BTDeviceConnectServices_cold_2();
  MBXpcConnection = getMBXpcConnection(a1);
  if (MBXpcConnection)
  {
    v5 = MBXpcConnection;
    v6 = xpc_dictionary_create(0, 0, 0);
    xpc_dictionary_set_uint64(v6, "kCBMsgArgBTDevice", a1);
    xpc_dictionary_set_uint64(v6, "kCBMsgArgServices", a2);
    v10 = 0;
    v11 = &v10;
    v12 = 0x2000000000;
    v13 = 0;
    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 0x40000000;
    v9[2] = __BTDeviceConnectServices_block_invoke;
    v9[3] = &unk_1E6B05E48;
    v9[4] = &v10;
    sendMessageWithReplySync(v5, "kCBMsgIdDeviceConnectServicesMsg", v6, (uint64_t)v9);
    if (v6)
      xpc_release(v6);
    v7 = *((unsigned int *)v11 + 6);
    _Block_object_dispose(&v10, 8);
  }
  else
  {
    if (MBFLogInitOnce != -1)
      dispatch_once_f(&MBFLogInitOnce, 0, (dispatch_function_t)MBFLogInit);
    if (os_log_type_enabled((os_log_t)MBFLogComponent, OS_LOG_TYPE_ERROR))
      BTDeviceGetAddressString_cold_1();
    return 1;
  }
  return v7;
}

uint64_t BTDeviceConnectServicesWithParameters(uint64_t a1, unsigned int a2, unsigned int a3, const void *a4)
{
  uint64_t MBXpcConnection;
  uint64_t v9;
  xpc_object_t v10;
  uint64_t v11;
  _QWORD v13[5];
  uint64_t v14;
  uint64_t *v15;
  uint64_t v16;
  uint64_t v17;

  if (MBFLogInitOnce != -1)
    dispatch_once_f(&MBFLogInitOnce, 0, (dispatch_function_t)MBFLogInit);
  if (os_log_type_enabled((os_log_t)MBFLogComponent, OS_LOG_TYPE_DEBUG))
    BTDeviceConnectServicesWithParameters_cold_2();
  MBXpcConnection = getMBXpcConnection(a1);
  if (MBXpcConnection)
  {
    v9 = MBXpcConnection;
    v10 = xpc_dictionary_create(0, 0, 0);
    xpc_dictionary_set_uint64(v10, "kCBMsgArgBTDevice", a1);
    xpc_dictionary_set_uint64(v10, "kCBMsgArgServices", a2);
    xpc_dictionary_set_uint64(v10, "kCBMsgArgConnectionMode", a3);
    xpc_dictionary_set_data(v10, "kCBMsgArgKey", a4, 0x10uLL);
    v14 = 0;
    v15 = &v14;
    v16 = 0x2000000000;
    v17 = 0;
    v13[0] = MEMORY[0x1E0C809B0];
    v13[1] = 0x40000000;
    v13[2] = __BTDeviceConnectServicesWithParameters_block_invoke;
    v13[3] = &unk_1E6B05E70;
    v13[4] = &v14;
    sendMessageWithReplySync(v9, "kCBMsgIdDeviceConnectServicesWithParametersMsg", v10, (uint64_t)v13);
    if (v10)
      xpc_release(v10);
    v11 = *((unsigned int *)v15 + 6);
    _Block_object_dispose(&v14, 8);
  }
  else
  {
    if (MBFLogInitOnce != -1)
      dispatch_once_f(&MBFLogInitOnce, 0, (dispatch_function_t)MBFLogInit);
    if (os_log_type_enabled((os_log_t)MBFLogComponent, OS_LOG_TYPE_ERROR))
      BTDeviceGetAddressString_cold_1();
    return 1;
  }
  return v11;
}

uint64_t BTDeviceDisconnect(uint64_t a1)
{
  uint64_t MBXpcConnection;
  uint64_t v3;
  xpc_object_t v4;
  uint64_t v5;
  _QWORD v7[5];
  uint64_t v8;
  uint64_t *v9;
  uint64_t v10;
  uint64_t v11;

  if (MBFLogInitOnce != -1)
    dispatch_once_f(&MBFLogInitOnce, 0, (dispatch_function_t)MBFLogInit);
  if (os_log_type_enabled((os_log_t)MBFLogComponent, OS_LOG_TYPE_DEBUG))
    BTDeviceDisconnect_cold_2();
  MBXpcConnection = getMBXpcConnection(a1);
  if (MBXpcConnection)
  {
    v3 = MBXpcConnection;
    v4 = xpc_dictionary_create(0, 0, 0);
    xpc_dictionary_set_uint64(v4, "kCBMsgArgBTDevice", a1);
    v8 = 0;
    v9 = &v8;
    v10 = 0x2000000000;
    v11 = 0;
    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 0x40000000;
    v7[2] = __BTDeviceDisconnect_block_invoke;
    v7[3] = &unk_1E6B05E98;
    v7[4] = &v8;
    sendMessageWithReplySync(v3, "kCBMsgIdDeviceDisconnectMsg", v4, (uint64_t)v7);
    if (v4)
      xpc_release(v4);
    v5 = *((unsigned int *)v9 + 6);
    _Block_object_dispose(&v8, 8);
  }
  else
  {
    if (MBFLogInitOnce != -1)
      dispatch_once_f(&MBFLogInitOnce, 0, (dispatch_function_t)MBFLogInit);
    if (os_log_type_enabled((os_log_t)MBFLogComponent, OS_LOG_TYPE_ERROR))
      BTDeviceGetAddressString_cold_1();
    return 1;
  }
  return v5;
}

uint64_t BTDevicePhysicalLinkDisconnect(uint64_t a1)
{
  uint64_t MBXpcConnection;
  uint64_t v3;
  xpc_object_t v4;
  uint64_t v5;
  _QWORD v7[5];
  uint64_t v8;
  uint64_t *v9;
  uint64_t v10;
  uint64_t v11;

  if (MBFLogInitOnce != -1)
    dispatch_once_f(&MBFLogInitOnce, 0, (dispatch_function_t)MBFLogInit);
  if (os_log_type_enabled((os_log_t)MBFLogComponent, OS_LOG_TYPE_DEBUG))
    BTDevicePhysicalLinkDisconnect_cold_2();
  MBXpcConnection = getMBXpcConnection(a1);
  if (MBXpcConnection)
  {
    v3 = MBXpcConnection;
    v4 = xpc_dictionary_create(0, 0, 0);
    xpc_dictionary_set_uint64(v4, "kCBMsgArgBTDevice", a1);
    v8 = 0;
    v9 = &v8;
    v10 = 0x2000000000;
    v11 = 0;
    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 0x40000000;
    v7[2] = __BTDevicePhysicalLinkDisconnect_block_invoke;
    v7[3] = &unk_1E6B05EC0;
    v7[4] = &v8;
    sendMessageWithReplySync(v3, "kCBMsgIdDevicePhysicalLinkDisconnectMsg", v4, (uint64_t)v7);
    if (v4)
      xpc_release(v4);
    v5 = *((unsigned int *)v9 + 6);
    _Block_object_dispose(&v8, 8);
  }
  else
  {
    if (MBFLogInitOnce != -1)
      dispatch_once_f(&MBFLogInitOnce, 0, (dispatch_function_t)MBFLogInit);
    if (os_log_type_enabled((os_log_t)MBFLogComponent, OS_LOG_TYPE_ERROR))
      BTDeviceGetAddressString_cold_1();
    return 1;
  }
  return v5;
}

uint64_t BTDeviceDisconnectServices(uint64_t a1, unsigned int a2)
{
  uint64_t MBXpcConnection;
  uint64_t v5;
  xpc_object_t v6;
  uint64_t v7;
  _QWORD v9[5];
  uint64_t v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t v13;

  if (MBFLogInitOnce != -1)
    dispatch_once_f(&MBFLogInitOnce, 0, (dispatch_function_t)MBFLogInit);
  if (os_log_type_enabled((os_log_t)MBFLogComponent, OS_LOG_TYPE_DEBUG))
    BTDeviceDisconnectServices_cold_2();
  MBXpcConnection = getMBXpcConnection(a1);
  if (MBXpcConnection)
  {
    v5 = MBXpcConnection;
    v6 = xpc_dictionary_create(0, 0, 0);
    xpc_dictionary_set_uint64(v6, "kCBMsgArgBTDevice", a1);
    xpc_dictionary_set_uint64(v6, "kCBMsgArgServiceMask", a2);
    v10 = 0;
    v11 = &v10;
    v12 = 0x2000000000;
    v13 = 0;
    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 0x40000000;
    v9[2] = __BTDeviceDisconnectServices_block_invoke;
    v9[3] = &unk_1E6B05EE8;
    v9[4] = &v10;
    sendMessageWithReplySync(v5, "kCBMsgIdDeviceDisconnectServicesMsg", v6, (uint64_t)v9);
    if (v6)
      xpc_release(v6);
    v7 = *((unsigned int *)v11 + 6);
    _Block_object_dispose(&v10, 8);
  }
  else
  {
    if (MBFLogInitOnce != -1)
      dispatch_once_f(&MBFLogInitOnce, 0, (dispatch_function_t)MBFLogInit);
    if (os_log_type_enabled((os_log_t)MBFLogComponent, OS_LOG_TYPE_ERROR))
      BTDeviceGetAddressString_cold_1();
    return 1;
  }
  return v7;
}

uint64_t BTDeviceGetConnectedServices(uint64_t a1, _DWORD *a2)
{
  uint64_t MBXpcConnection;
  uint64_t v5;
  xpc_object_t v6;
  uint64_t v7;
  _QWORD v9[6];
  uint64_t v10;
  uint64_t *v11;
  uint64_t v12;
  int v13;
  uint64_t v14;
  uint64_t *v15;
  uint64_t v16;
  uint64_t v17;

  if (MBFLogInitOnce != -1)
    dispatch_once_f(&MBFLogInitOnce, 0, (dispatch_function_t)MBFLogInit);
  if (os_log_type_enabled((os_log_t)MBFLogComponent, OS_LOG_TYPE_DEBUG))
    BTDeviceGetConnectedServices_cold_2();
  MBXpcConnection = getMBXpcConnection(a1);
  if (MBXpcConnection)
  {
    v5 = MBXpcConnection;
    v6 = xpc_dictionary_create(0, 0, 0);
    xpc_dictionary_set_uint64(v6, "kCBMsgArgBTDevice", a1);
    v14 = 0;
    v15 = &v14;
    v16 = 0x2000000000;
    v17 = 0;
    v10 = 0;
    v11 = &v10;
    v12 = 0x2000000000;
    v13 = 0;
    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 0x40000000;
    v9[2] = __BTDeviceGetConnectedServices_block_invoke;
    v9[3] = &unk_1E6B05F10;
    v9[4] = &v14;
    v9[5] = &v10;
    sendMessageWithReplySync(v5, "kCBMsgIdDeviceGetConnectedServicesMsg", v6, (uint64_t)v9);
    if (v6)
      xpc_release(v6);
    *a2 = *((_DWORD *)v11 + 6);
    v7 = *((unsigned int *)v15 + 6);
    _Block_object_dispose(&v10, 8);
    _Block_object_dispose(&v14, 8);
  }
  else
  {
    if (MBFLogInitOnce != -1)
      dispatch_once_f(&MBFLogInitOnce, 0, (dispatch_function_t)MBFLogInit);
    if (os_log_type_enabled((os_log_t)MBFLogComponent, OS_LOG_TYPE_ERROR))
      BTDeviceGetAddressString_cold_1();
    return 1;
  }
  return v7;
}

uint64_t BTDeviceGetSupportedServices(uint64_t a1, _DWORD *a2)
{
  uint64_t MBXpcConnection;
  uint64_t v5;
  xpc_object_t v6;
  uint64_t v7;
  _QWORD v9[6];
  uint64_t v10;
  uint64_t *v11;
  uint64_t v12;
  int v13;
  uint64_t v14;
  uint64_t *v15;
  uint64_t v16;
  uint64_t v17;

  if (MBFLogInitOnce != -1)
    dispatch_once_f(&MBFLogInitOnce, 0, (dispatch_function_t)MBFLogInit);
  if (os_log_type_enabled((os_log_t)MBFLogComponent, OS_LOG_TYPE_DEBUG))
    BTDeviceGetSupportedServices_cold_2();
  MBXpcConnection = getMBXpcConnection(a1);
  if (MBXpcConnection)
  {
    v5 = MBXpcConnection;
    v6 = xpc_dictionary_create(0, 0, 0);
    xpc_dictionary_set_uint64(v6, "kCBMsgArgBTDevice", a1);
    v14 = 0;
    v15 = &v14;
    v16 = 0x2000000000;
    v17 = 0;
    v10 = 0;
    v11 = &v10;
    v12 = 0x2000000000;
    v13 = 0;
    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 0x40000000;
    v9[2] = __BTDeviceGetSupportedServices_block_invoke;
    v9[3] = &unk_1E6B05F38;
    v9[4] = &v14;
    v9[5] = &v10;
    sendMessageWithReplySync(v5, "kCBMsgIdDeviceGetSupportedServicesMsg", v6, (uint64_t)v9);
    if (v6)
      xpc_release(v6);
    *a2 = *((_DWORD *)v11 + 6);
    v7 = *((unsigned int *)v15 + 6);
    _Block_object_dispose(&v10, 8);
    _Block_object_dispose(&v14, 8);
  }
  else
  {
    if (MBFLogInitOnce != -1)
      dispatch_once_f(&MBFLogInitOnce, 0, (dispatch_function_t)MBFLogInit);
    if (os_log_type_enabled((os_log_t)MBFLogComponent, OS_LOG_TYPE_ERROR))
      BTDeviceGetAddressString_cold_1();
    return 1;
  }
  return v7;
}

uint64_t BTDeviceSetServiceSettings(uint64_t a1, unsigned int a2, const char *a3, const char *a4)
{
  uint64_t MBXpcConnection;
  uint64_t v9;
  xpc_object_t v10;
  uint64_t v11;
  _QWORD v13[5];
  uint64_t v14;
  uint64_t *v15;
  uint64_t v16;
  uint64_t v17;

  if (MBFLogInitOnce != -1)
    dispatch_once_f(&MBFLogInitOnce, 0, (dispatch_function_t)MBFLogInit);
  if (os_log_type_enabled((os_log_t)MBFLogComponent, OS_LOG_TYPE_DEBUG))
    BTDeviceSetServiceSettings_cold_2();
  MBXpcConnection = getMBXpcConnection(a1);
  if (MBXpcConnection)
  {
    v9 = MBXpcConnection;
    v10 = xpc_dictionary_create(0, 0, 0);
    xpc_dictionary_set_uint64(v10, "kCBMsgArgBTDevice", a1);
    xpc_dictionary_set_uint64(v10, "kCBMsgArgServiceMask", a2);
    xpc_dictionary_set_string(v10, "kCBMsgArgKey", a3);
    xpc_dictionary_set_string(v10, "kCBMsgArgValue", a4);
    v14 = 0;
    v15 = &v14;
    v16 = 0x2000000000;
    v17 = 0;
    v13[0] = MEMORY[0x1E0C809B0];
    v13[1] = 0x40000000;
    v13[2] = __BTDeviceSetServiceSettings_block_invoke;
    v13[3] = &unk_1E6B05F60;
    v13[4] = &v14;
    sendMessageWithReplySync(v9, "kCBMsgIdDeviceSetServiceSettingsMsg", v10, (uint64_t)v13);
    if (v10)
      xpc_release(v10);
    v11 = *((unsigned int *)v15 + 6);
    _Block_object_dispose(&v14, 8);
  }
  else
  {
    if (MBFLogInitOnce != -1)
      dispatch_once_f(&MBFLogInitOnce, 0, (dispatch_function_t)MBFLogInit);
    if (os_log_type_enabled((os_log_t)MBFLogComponent, OS_LOG_TYPE_ERROR))
      BTDeviceGetAddressString_cold_1();
    return 1;
  }
  return v11;
}

uint64_t BTDeviceGetServiceSettings(uint64_t a1, unsigned int a2, const char *a3, uint64_t a4)
{
  uint64_t MBXpcConnection;
  uint64_t v9;
  xpc_object_t v10;
  uint64_t v11;
  _QWORD v13[6];
  uint64_t v14;
  uint64_t *v15;
  uint64_t v16;
  uint64_t v17;

  if (MBFLogInitOnce != -1)
    dispatch_once_f(&MBFLogInitOnce, 0, (dispatch_function_t)MBFLogInit);
  if (os_log_type_enabled((os_log_t)MBFLogComponent, OS_LOG_TYPE_DEBUG))
    BTDeviceGetServiceSettings_cold_2();
  MBXpcConnection = getMBXpcConnection(a1);
  if (MBXpcConnection)
  {
    v9 = MBXpcConnection;
    v10 = xpc_dictionary_create(0, 0, 0);
    xpc_dictionary_set_uint64(v10, "kCBMsgArgBTDevice", a1);
    xpc_dictionary_set_uint64(v10, "kCBMsgArgServiceMask", a2);
    xpc_dictionary_set_string(v10, "kCBMsgArgKey", a3);
    v14 = 0;
    v15 = &v14;
    v16 = 0x2000000000;
    v17 = 0;
    v13[0] = MEMORY[0x1E0C809B0];
    v13[1] = 0x40000000;
    v13[2] = __BTDeviceGetServiceSettings_block_invoke;
    v13[3] = &unk_1E6B05F88;
    v13[4] = &v14;
    v13[5] = a4;
    sendMessageWithReplySync(v9, "kCBMsgIdDeviceGetServiceSettingsMsg", v10, (uint64_t)v13);
    if (v10)
      xpc_release(v10);
    v11 = *((unsigned int *)v15 + 6);
    _Block_object_dispose(&v14, 8);
  }
  else
  {
    if (MBFLogInitOnce != -1)
      dispatch_once_f(&MBFLogInitOnce, 0, (dispatch_function_t)MBFLogInit);
    if (os_log_type_enabled((os_log_t)MBFLogComponent, OS_LOG_TYPE_ERROR))
      BTDeviceGetAddressString_cold_1();
    return 1;
  }
  return v11;
}

uint64_t BTDeviceGetComPortForService(uint64_t a1, unsigned int a2, _BYTE *a3, uint64_t a4)
{
  uint64_t MBXpcConnection;
  uint64_t v9;
  xpc_object_t v10;
  uint64_t v11;
  _QWORD v13[8];
  _QWORD v14[4];
  uint64_t v15;
  uint64_t *v16;
  uint64_t v17;
  uint64_t v18;

  *a3 = 0;
  if (MBFLogInitOnce != -1)
    dispatch_once_f(&MBFLogInitOnce, 0, (dispatch_function_t)MBFLogInit);
  if (os_log_type_enabled((os_log_t)MBFLogComponent, OS_LOG_TYPE_DEBUG))
    BTDeviceGetComPortForService_cold_2();
  MBXpcConnection = getMBXpcConnection(a1);
  if (MBXpcConnection)
  {
    v9 = MBXpcConnection;
    v10 = xpc_dictionary_create(0, 0, 0);
    xpc_dictionary_set_uint64(v10, "kCBMsgArgBTDevice", a1);
    xpc_dictionary_set_uint64(v10, "kCBMsgArgServiceID", a2);
    xpc_dictionary_set_uint64(v10, "kCBMsgArgBufferSize", a4);
    v15 = 0;
    v16 = &v15;
    v17 = 0x2000000000;
    v18 = 0;
    v14[0] = 0;
    v14[1] = v14;
    v14[2] = 0x2000000000;
    v14[3] = 0;
    v13[0] = MEMORY[0x1E0C809B0];
    v13[1] = 0x40000000;
    v13[2] = __BTDeviceGetComPortForService_block_invoke;
    v13[3] = &unk_1E6B05FB0;
    v13[4] = &v15;
    v13[5] = v14;
    v13[6] = a4;
    v13[7] = a3;
    sendMessageWithReplySync(v9, "kCBMsgIdDeviceGetComPortForServiceMsg", v10, (uint64_t)v13);
    if (v10)
      xpc_release(v10);
    v11 = *((unsigned int *)v16 + 6);
    _Block_object_dispose(v14, 8);
    _Block_object_dispose(&v15, 8);
  }
  else
  {
    if (MBFLogInitOnce != -1)
      dispatch_once_f(&MBFLogInitOnce, 0, (dispatch_function_t)MBFLogInit);
    if (os_log_type_enabled((os_log_t)MBFLogComponent, OS_LOG_TYPE_ERROR))
      BTDeviceGetAddressString_cold_1();
    return 1;
  }
  return v11;
}

uint64_t BTDeviceGetComPortForServiceWithSandboxExtension(uint64_t a1, unsigned int a2, _BYTE *a3, uint64_t a4, uint64_t a5)
{
  uint64_t MBXpcConnection;
  uint64_t v11;
  xpc_object_t v12;
  uint64_t v13;
  _QWORD v15[9];
  _QWORD v16[4];
  uint64_t v17;
  uint64_t *v18;
  uint64_t v19;
  uint64_t v20;

  *a3 = 0;
  if (MBFLogInitOnce != -1)
    dispatch_once_f(&MBFLogInitOnce, 0, (dispatch_function_t)MBFLogInit);
  if (os_log_type_enabled((os_log_t)MBFLogComponent, OS_LOG_TYPE_DEBUG))
    BTDeviceGetComPortForServiceWithSandboxExtension_cold_2();
  MBXpcConnection = getMBXpcConnection(a1);
  if (MBXpcConnection)
  {
    v11 = MBXpcConnection;
    v12 = xpc_dictionary_create(0, 0, 0);
    xpc_dictionary_set_uint64(v12, "kCBMsgArgBTDevice", a1);
    xpc_dictionary_set_uint64(v12, "kCBMsgArgServiceID", a2);
    xpc_dictionary_set_uint64(v12, "kCBMsgArgBufferSize", a4);
    v17 = 0;
    v18 = &v17;
    v19 = 0x2000000000;
    v20 = 0;
    v16[0] = 0;
    v16[1] = v16;
    v16[2] = 0x2000000000;
    v16[3] = 0;
    v15[0] = MEMORY[0x1E0C809B0];
    v15[1] = 0x40000000;
    v15[2] = __BTDeviceGetComPortForServiceWithSandboxExtension_block_invoke;
    v15[3] = &unk_1E6B05FD8;
    v15[4] = &v17;
    v15[5] = v16;
    v15[6] = a3;
    v15[7] = a4;
    v15[8] = a5;
    sendMessageWithReplySync(v11, "kCBMsgIdDeviceGetComPortForServiceWithSandboxExtensionMsg", v12, (uint64_t)v15);
    if (v12)
      xpc_release(v12);
    v13 = *((unsigned int *)v18 + 6);
    _Block_object_dispose(v16, 8);
    _Block_object_dispose(&v17, 8);
  }
  else
  {
    if (MBFLogInitOnce != -1)
      dispatch_once_f(&MBFLogInitOnce, 0, (dispatch_function_t)MBFLogInit);
    if (os_log_type_enabled((os_log_t)MBFLogComponent, OS_LOG_TYPE_ERROR))
      BTDeviceGetAddressString_cold_1();
    return 1;
  }
  return v13;
}

uint64_t BTDeviceSetVirtualType(uint64_t a1, unsigned int a2)
{
  uint64_t MBXpcConnection;
  uint64_t v5;
  xpc_object_t v6;
  uint64_t v7;
  _QWORD v9[5];
  uint64_t v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t v13;

  if (MBFLogInitOnce != -1)
    dispatch_once_f(&MBFLogInitOnce, 0, (dispatch_function_t)MBFLogInit);
  if (os_log_type_enabled((os_log_t)MBFLogComponent, OS_LOG_TYPE_DEBUG))
    BTDeviceSetVirtualType_cold_2();
  MBXpcConnection = getMBXpcConnection(a1);
  if (MBXpcConnection)
  {
    v5 = MBXpcConnection;
    v6 = xpc_dictionary_create(0, 0, 0);
    xpc_dictionary_set_uint64(v6, "kCBMsgArgBTDevice", a1);
    xpc_dictionary_set_uint64(v6, "kCBMsgArgType", a2);
    v10 = 0;
    v11 = &v10;
    v12 = 0x2000000000;
    v13 = 0;
    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 0x40000000;
    v9[2] = __BTDeviceSetVirtualType_block_invoke;
    v9[3] = &unk_1E6B06000;
    v9[4] = &v10;
    sendMessageWithReplySync(v5, "kCBMsgIdDeviceSetVirtualTypeMsg", v6, (uint64_t)v9);
    if (v6)
      xpc_release(v6);
    v7 = *((unsigned int *)v11 + 6);
    _Block_object_dispose(&v10, 8);
  }
  else
  {
    if (MBFLogInitOnce != -1)
      dispatch_once_f(&MBFLogInitOnce, 0, (dispatch_function_t)MBFLogInit);
    if (os_log_type_enabled((os_log_t)MBFLogComponent, OS_LOG_TYPE_ERROR))
      BTDeviceGetAddressString_cold_1();
    return 1;
  }
  return v7;
}

uint64_t BTDeviceGetVirtualType(uint64_t a1, _DWORD *a2)
{
  uint64_t MBXpcConnection;
  uint64_t v5;
  xpc_object_t v6;
  uint64_t v7;
  _QWORD v9[6];
  uint64_t v10;
  uint64_t *v11;
  uint64_t v12;
  int v13;
  uint64_t v14;
  uint64_t *v15;
  uint64_t v16;
  uint64_t v17;

  if (MBFLogInitOnce != -1)
    dispatch_once_f(&MBFLogInitOnce, 0, (dispatch_function_t)MBFLogInit);
  if (os_log_type_enabled((os_log_t)MBFLogComponent, OS_LOG_TYPE_DEBUG))
    BTDeviceGetVirtualType_cold_2();
  MBXpcConnection = getMBXpcConnection(a1);
  if (MBXpcConnection)
  {
    v5 = MBXpcConnection;
    v6 = xpc_dictionary_create(0, 0, 0);
    xpc_dictionary_set_uint64(v6, "kCBMsgArgBTDevice", a1);
    v14 = 0;
    v15 = &v14;
    v16 = 0x2000000000;
    v17 = 0;
    v10 = 0;
    v11 = &v10;
    v12 = 0x2000000000;
    v13 = 0;
    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 0x40000000;
    v9[2] = __BTDeviceGetVirtualType_block_invoke;
    v9[3] = &unk_1E6B06028;
    v9[4] = &v14;
    v9[5] = &v10;
    sendMessageWithReplySync(v5, "kCBMsgIdDeviceGetVirtualTypeMsg", v6, (uint64_t)v9);
    *a2 = *((_DWORD *)v11 + 6);
    if (v6)
      xpc_release(v6);
    v7 = *((unsigned int *)v15 + 6);
    _Block_object_dispose(&v10, 8);
    _Block_object_dispose(&v14, 8);
  }
  else
  {
    if (MBFLogInitOnce != -1)
      dispatch_once_f(&MBFLogInitOnce, 0, (dispatch_function_t)MBFLogInit);
    if (os_log_type_enabled((os_log_t)MBFLogComponent, OS_LOG_TYPE_ERROR))
      BTDeviceGetAddressString_cold_1();
    return 1;
  }
  return v7;
}

uint64_t BTDeviceMatchesAdvertisedKey(uint64_t a1, const void *a2, size_t a3, _DWORD *a4)
{
  uint64_t MBXpcConnection;
  uint64_t v9;
  xpc_object_t v10;
  uint64_t v11;
  _QWORD v13[6];
  uint64_t v14;
  uint64_t *v15;
  uint64_t v16;
  int v17;
  uint64_t v18;
  uint64_t *v19;
  uint64_t v20;
  uint64_t v21;

  if (MBFLogInitOnce != -1)
    dispatch_once_f(&MBFLogInitOnce, 0, (dispatch_function_t)MBFLogInit);
  if (os_log_type_enabled((os_log_t)MBFLogComponent, OS_LOG_TYPE_DEBUG))
    BTDeviceMatchesAdvertisedKey_cold_2();
  MBXpcConnection = getMBXpcConnection(a1);
  if (MBXpcConnection)
  {
    v9 = MBXpcConnection;
    v10 = xpc_dictionary_create(0, 0, 0);
    xpc_dictionary_set_uint64(v10, "kCBMsgArgBTDevice", a1);
    xpc_dictionary_set_data(v10, "kCBMsgArgKey", a2, a3);
    v18 = 0;
    v19 = &v18;
    v20 = 0x2000000000;
    v21 = 0;
    v14 = 0;
    v15 = &v14;
    v16 = 0x2000000000;
    v17 = 0;
    v13[0] = MEMORY[0x1E0C809B0];
    v13[1] = 0x40000000;
    v13[2] = __BTDeviceMatchesAdvertisedKey_block_invoke;
    v13[3] = &unk_1E6B06050;
    v13[4] = &v18;
    v13[5] = &v14;
    sendMessageWithReplySync(v9, "kCBMsgIdDeviceMatchesAdvertisedKeyMsg", v10, (uint64_t)v13);
    *a4 = *((_DWORD *)v15 + 6);
    if (v10)
      xpc_release(v10);
    v11 = *((unsigned int *)v19 + 6);
    _Block_object_dispose(&v14, 8);
    _Block_object_dispose(&v18, 8);
  }
  else
  {
    if (MBFLogInitOnce != -1)
      dispatch_once_f(&MBFLogInitOnce, 0, (dispatch_function_t)MBFLogInit);
    if (os_log_type_enabled((os_log_t)MBFLogComponent, OS_LOG_TYPE_ERROR))
      BTDeviceGetAddressString_cold_1();
    return 1;
  }
  return v11;
}

uint64_t BTDeviceGetAdvertisedValueForKey(uint64_t a1, const void *a2, size_t a3, uint64_t a4, unint64_t *a5, unsigned int a6)
{
  uint64_t MBXpcConnection;
  uint64_t v13;
  xpc_object_t v14;
  unint64_t v15;
  uint64_t v16;
  _QWORD v18[7];
  unsigned int v19;
  uint64_t v20;
  uint64_t *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t *v25;
  uint64_t v26;
  uint64_t v27;

  if (MBFLogInitOnce != -1)
    dispatch_once_f(&MBFLogInitOnce, 0, (dispatch_function_t)MBFLogInit);
  if (os_log_type_enabled((os_log_t)MBFLogComponent, OS_LOG_TYPE_DEBUG))
    BTDeviceGetAdvertisedValueForKey_cold_2();
  MBXpcConnection = getMBXpcConnection(a1);
  if (MBXpcConnection)
  {
    v13 = MBXpcConnection;
    v14 = xpc_dictionary_create(0, 0, 0);
    xpc_dictionary_set_uint64(v14, "kCBMsgArgBTDevice", a1);
    xpc_dictionary_set_data(v14, "kCBMsgArgKey", a2, a3);
    xpc_dictionary_set_uint64(v14, "kCBMsgArgBufferSize", a6);
    v24 = 0;
    v25 = &v24;
    v26 = 0x2000000000;
    v27 = 0;
    v20 = 0;
    v21 = &v20;
    v22 = 0x2000000000;
    v23 = 0;
    v18[0] = MEMORY[0x1E0C809B0];
    v18[1] = 0x40000000;
    v18[2] = __BTDeviceGetAdvertisedValueForKey_block_invoke;
    v18[3] = &unk_1E6B06078;
    v18[4] = &v24;
    v18[5] = &v20;
    v18[6] = a4;
    v19 = a6;
    sendMessageWithReplySync(v13, "kCBMsgIdDeviceGetAdvertisedValueForKeyMsg", v14, (uint64_t)v18);
    if (v14)
      xpc_release(v14);
    v15 = v21[3];
    if (v15 >= a6)
      v15 = a6;
    *a5 = v15;
    v16 = *((unsigned int *)v25 + 6);
    _Block_object_dispose(&v20, 8);
    _Block_object_dispose(&v24, 8);
  }
  else
  {
    if (MBFLogInitOnce != -1)
      dispatch_once_f(&MBFLogInitOnce, 0, (dispatch_function_t)MBFLogInit);
    if (os_log_type_enabled((os_log_t)MBFLogComponent, OS_LOG_TYPE_ERROR))
      BTDeviceGetAddressString_cold_1();
    return 1;
  }
  return v16;
}

uint64_t BTDeviceGetDeviceId(uint64_t a1, _DWORD *a2, _DWORD *a3, _DWORD *a4, _DWORD *a5)
{
  uint64_t MBXpcConnection;
  uint64_t v11;
  xpc_object_t v12;
  uint64_t v13;
  _QWORD v15[9];
  uint64_t v16;
  uint64_t *v17;
  uint64_t v18;
  int v19;
  uint64_t v20;
  uint64_t *v21;
  uint64_t v22;
  int v23;
  uint64_t v24;
  uint64_t *v25;
  uint64_t v26;
  int v27;
  uint64_t v28;
  uint64_t *v29;
  uint64_t v30;
  int v31;
  uint64_t v32;
  uint64_t *v33;
  uint64_t v34;
  uint64_t v35;

  if (MBFLogInitOnce != -1)
    dispatch_once_f(&MBFLogInitOnce, 0, (dispatch_function_t)MBFLogInit);
  if (os_log_type_enabled((os_log_t)MBFLogComponent, OS_LOG_TYPE_DEBUG))
    BTDeviceGetDeviceId_cold_2();
  MBXpcConnection = getMBXpcConnection(a1);
  if (MBXpcConnection)
  {
    v11 = MBXpcConnection;
    v12 = xpc_dictionary_create(0, 0, 0);
    xpc_dictionary_set_uint64(v12, "kCBMsgArgBTDevice", a1);
    v32 = 0;
    v33 = &v32;
    v34 = 0x2000000000;
    v35 = 0;
    v28 = 0;
    v29 = &v28;
    v30 = 0x2000000000;
    v31 = 0;
    v24 = 0;
    v25 = &v24;
    v26 = 0x2000000000;
    v27 = 0;
    v20 = 0;
    v21 = &v20;
    v22 = 0x2000000000;
    v23 = 0;
    v16 = 0;
    v17 = &v16;
    v18 = 0x2000000000;
    v19 = 0;
    v15[0] = MEMORY[0x1E0C809B0];
    v15[1] = 0x40000000;
    v15[2] = __BTDeviceGetDeviceId_block_invoke;
    v15[3] = &unk_1E6B060A0;
    v15[4] = &v32;
    v15[5] = &v28;
    v15[6] = &v24;
    v15[7] = &v20;
    v15[8] = &v16;
    sendMessageWithReplySync(v11, "kCBMsgIdDeviceGetDeviceIdMsg", v12, (uint64_t)v15);
    if (v12)
      xpc_release(v12);
    *a2 = *((_DWORD *)v29 + 6);
    *a3 = *((_DWORD *)v25 + 6);
    *a4 = *((_DWORD *)v21 + 6);
    *a5 = *((_DWORD *)v17 + 6);
    v13 = *((unsigned int *)v33 + 6);
    _Block_object_dispose(&v16, 8);
    _Block_object_dispose(&v20, 8);
    _Block_object_dispose(&v24, 8);
    _Block_object_dispose(&v28, 8);
    _Block_object_dispose(&v32, 8);
  }
  else
  {
    if (MBFLogInitOnce != -1)
      dispatch_once_f(&MBFLogInitOnce, 0, (dispatch_function_t)MBFLogInit);
    if (os_log_type_enabled((os_log_t)MBFLogComponent, OS_LOG_TYPE_ERROR))
      BTDeviceGetAddressString_cold_1();
    return 1;
  }
  return v13;
}

uint64_t BTDeviceSetHIDProperties(uint64_t a1, unsigned int a2, unsigned int a3)
{
  uint64_t MBXpcConnection;
  uint64_t v7;
  xpc_object_t v8;
  uint64_t v9;
  _QWORD v11[5];
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t v15;

  if (MBFLogInitOnce != -1)
    dispatch_once_f(&MBFLogInitOnce, 0, (dispatch_function_t)MBFLogInit);
  if (os_log_type_enabled((os_log_t)MBFLogComponent, OS_LOG_TYPE_DEBUG))
    BTDeviceSetHIDProperties_cold_2();
  MBXpcConnection = getMBXpcConnection(a1);
  if (MBXpcConnection)
  {
    v7 = MBXpcConnection;
    v8 = xpc_dictionary_create(0, 0, 0);
    xpc_dictionary_set_uint64(v8, "kCBMsgArgBTDevice", a1);
    xpc_dictionary_set_uint64(v8, "kCBMsgArgAuthStatus", a2);
    xpc_dictionary_set_uint64(v8, "kCBMsgArgHIDType", a3);
    v12 = 0;
    v13 = &v12;
    v14 = 0x2000000000;
    v15 = 0;
    v11[0] = MEMORY[0x1E0C809B0];
    v11[1] = 0x40000000;
    v11[2] = __BTDeviceSetHIDProperties_block_invoke;
    v11[3] = &unk_1E6B060C8;
    v11[4] = &v12;
    sendMessageWithReplySync(v7, "kCBMsgIdDeviceSetHIDPropertiesMsg", v8, (uint64_t)v11);
    if (v8)
      xpc_release(v8);
    v9 = *((unsigned int *)v13 + 6);
    _Block_object_dispose(&v12, 8);
  }
  else
  {
    if (MBFLogInitOnce != -1)
      dispatch_once_f(&MBFLogInitOnce, 0, (dispatch_function_t)MBFLogInit);
    if (os_log_type_enabled((os_log_t)MBFLogComponent, OS_LOG_TYPE_ERROR))
      BTDeviceGetAddressString_cold_1();
    return 1;
  }
  return v9;
}

uint64_t BTDeviceConfigureLinkKey(uint64_t a1, const void *a2, const void *a3, unsigned int a4)
{
  uint64_t MBXpcConnection;
  uint64_t v9;
  xpc_object_t v10;
  uint64_t v11;
  _QWORD v13[5];
  uint64_t v14;
  uint64_t *v15;
  uint64_t v16;
  uint64_t v17;

  if (MBFLogInitOnce != -1)
    dispatch_once_f(&MBFLogInitOnce, 0, (dispatch_function_t)MBFLogInit);
  if (os_log_type_enabled((os_log_t)MBFLogComponent, OS_LOG_TYPE_DEBUG))
    BTDeviceConfigureLinkKey_cold_2();
  MBXpcConnection = getMBXpcConnection(a1);
  if (MBXpcConnection)
  {
    v9 = MBXpcConnection;
    v10 = xpc_dictionary_create(0, 0, 0);
    xpc_dictionary_set_uint64(v10, "kCBMsgArgBTDevice", a1);
    if (a4)
      xpc_dictionary_set_data(v10, "kCBMsgArgKey", a3, 0x10uLL);
    xpc_dictionary_set_uint64(v10, "kCBMsgArgBool", a4);
    xpc_dictionary_set_data(v10, "kCBMsgArgAddressBytes", a2, 6uLL);
    v14 = 0;
    v15 = &v14;
    v16 = 0x2000000000;
    v17 = 0;
    v13[0] = MEMORY[0x1E0C809B0];
    v13[1] = 0x40000000;
    v13[2] = __BTDeviceConfigureLinkKey_block_invoke;
    v13[3] = &unk_1E6B060F0;
    v13[4] = &v14;
    sendMessageWithReplySync(v9, "kCBMsgIdDeviceConfigureLinkKeyMsg", v10, (uint64_t)v13);
    if (v10)
      xpc_release(v10);
    v11 = *((unsigned int *)v15 + 6);
    _Block_object_dispose(&v14, 8);
  }
  else
  {
    if (MBFLogInitOnce != -1)
      dispatch_once_f(&MBFLogInitOnce, 0, (dispatch_function_t)MBFLogInit);
    if (os_log_type_enabled((os_log_t)MBFLogComponent, OS_LOG_TYPE_ERROR))
      BTDeviceGetAddressString_cold_1();
    return 1;
  }
  return v11;
}

uint64_t BTDeviceIsTemporaryPaired(uint64_t a1, _DWORD *a2)
{
  uint64_t MBXpcConnection;
  uint64_t v5;
  xpc_object_t v6;
  uint64_t v7;
  _QWORD v9[6];
  uint64_t v10;
  uint64_t *v11;
  uint64_t v12;
  int v13;
  uint64_t v14;
  uint64_t *v15;
  uint64_t v16;
  uint64_t v17;

  if (MBFLogInitOnce != -1)
    dispatch_once_f(&MBFLogInitOnce, 0, (dispatch_function_t)MBFLogInit);
  if (os_log_type_enabled((os_log_t)MBFLogComponent, OS_LOG_TYPE_DEBUG))
    BTDeviceIsTemporaryPaired_cold_2();
  MBXpcConnection = getMBXpcConnection(a1);
  if (MBXpcConnection)
  {
    v5 = MBXpcConnection;
    v6 = xpc_dictionary_create(0, 0, 0);
    xpc_dictionary_set_uint64(v6, "kCBMsgArgBTDevice", a1);
    v14 = 0;
    v15 = &v14;
    v16 = 0x2000000000;
    v17 = 0;
    v10 = 0;
    v11 = &v10;
    v12 = 0x2000000000;
    v13 = 0;
    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 0x40000000;
    v9[2] = __BTDeviceIsTemporaryPaired_block_invoke;
    v9[3] = &unk_1E6B06118;
    v9[4] = &v14;
    v9[5] = &v10;
    sendMessageWithReplySync(v5, "kCBMsgIdDeviceIsTemporaryPairedMsg", v6, (uint64_t)v9);
    if (v6)
      xpc_release(v6);
    *a2 = *((_DWORD *)v11 + 6);
    v7 = *((unsigned int *)v15 + 6);
    _Block_object_dispose(&v10, 8);
    _Block_object_dispose(&v14, 8);
  }
  else
  {
    if (MBFLogInitOnce != -1)
      dispatch_once_f(&MBFLogInitOnce, 0, (dispatch_function_t)MBFLogInit);
    if (os_log_type_enabled((os_log_t)MBFLogComponent, OS_LOG_TYPE_ERROR))
      BTDeviceGetAddressString_cold_1();
    return 1;
  }
  return v7;
}

uint64_t BTDeviceIsWirelessSplitterSupported(uint64_t a1, _DWORD *a2)
{
  uint64_t MBXpcConnection;
  uint64_t v5;
  xpc_object_t v6;
  uint64_t v7;
  _QWORD v9[6];
  uint64_t v10;
  uint64_t *v11;
  uint64_t v12;
  int v13;
  uint64_t v14;
  uint64_t *v15;
  uint64_t v16;
  uint64_t v17;

  if (MBFLogInitOnce != -1)
    dispatch_once_f(&MBFLogInitOnce, 0, (dispatch_function_t)MBFLogInit);
  if (os_log_type_enabled((os_log_t)MBFLogComponent, OS_LOG_TYPE_DEBUG))
    BTDeviceIsWirelessSplitterSupported_cold_2();
  MBXpcConnection = getMBXpcConnection(a1);
  if (MBXpcConnection)
  {
    v5 = MBXpcConnection;
    v6 = xpc_dictionary_create(0, 0, 0);
    xpc_dictionary_set_uint64(v6, "kCBMsgArgBTDevice", a1);
    v14 = 0;
    v15 = &v14;
    v16 = 0x2000000000;
    v17 = 0;
    v10 = 0;
    v11 = &v10;
    v12 = 0x2000000000;
    v13 = 0;
    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 0x40000000;
    v9[2] = __BTDeviceIsWirelessSplitterSupported_block_invoke;
    v9[3] = &unk_1E6B06140;
    v9[4] = &v14;
    v9[5] = &v10;
    sendMessageWithReplySync(v5, "kCBMsgIdDeviceIsWirelessSplitterSupportedMsg", v6, (uint64_t)v9);
    if (v6)
      xpc_release(v6);
    *a2 = *((_DWORD *)v11 + 6);
    v7 = *((unsigned int *)v15 + 6);
    _Block_object_dispose(&v10, 8);
    _Block_object_dispose(&v14, 8);
  }
  else
  {
    if (MBFLogInitOnce != -1)
      dispatch_once_f(&MBFLogInitOnce, 0, (dispatch_function_t)MBFLogInit);
    if (os_log_type_enabled((os_log_t)MBFLogComponent, OS_LOG_TYPE_ERROR))
      BTDeviceGetAddressString_cold_1();
    return 1;
  }
  return v7;
}

uint64_t BTDeviceIsTemporaryPairedNotInContacts(uint64_t a1, _DWORD *a2)
{
  uint64_t MBXpcConnection;
  xpc_object_t v5;
  uint64_t v6;
  _QWORD v8[6];
  uint64_t v9;
  uint64_t *v10;
  uint64_t v11;
  int v12;
  uint64_t v13;
  uint64_t *v14;
  uint64_t v15;
  uint64_t v16;

  MBXpcConnection = getMBXpcConnection(a1);
  if (MBFLogInitOnce != -1)
    dispatch_once_f(&MBFLogInitOnce, 0, (dispatch_function_t)MBFLogInit);
  if (os_log_type_enabled((os_log_t)MBFLogComponent, OS_LOG_TYPE_DEBUG))
  {
    BTDeviceIsTemporaryPairedNotInContacts_cold_2();
    if (MBXpcConnection)
      goto LABEL_5;
  }
  else if (MBXpcConnection)
  {
LABEL_5:
    v5 = xpc_dictionary_create(0, 0, 0);
    xpc_dictionary_set_uint64(v5, "kCBMsgArgBTDevice", a1);
    v13 = 0;
    v14 = &v13;
    v15 = 0x2000000000;
    v16 = 0;
    v9 = 0;
    v10 = &v9;
    v11 = 0x2000000000;
    v12 = 0;
    v8[0] = MEMORY[0x1E0C809B0];
    v8[1] = 0x40000000;
    v8[2] = __BTDeviceIsTemporaryPairedNotInContacts_block_invoke;
    v8[3] = &unk_1E6B06168;
    v8[4] = &v13;
    v8[5] = &v9;
    sendMessageWithReplySync(MBXpcConnection, "kCBMsgIdDeviceIsTemporaryPairedNotInContactsMsg", v5, (uint64_t)v8);
    if (v5)
      xpc_release(v5);
    *a2 = *((_DWORD *)v10 + 6);
    v6 = *((unsigned int *)v14 + 6);
    _Block_object_dispose(&v9, 8);
    _Block_object_dispose(&v13, 8);
    return v6;
  }
  if (MBFLogInitOnce != -1)
    dispatch_once_f(&MBFLogInitOnce, 0, (dispatch_function_t)MBFLogInit);
  if (os_log_type_enabled((os_log_t)MBFLogComponent, OS_LOG_TYPE_ERROR))
    BTDeviceGetAddressString_cold_1();
  return 1;
}

uint64_t BTDeviceGetLowSecurityStatus(uint64_t a1, _DWORD *a2)
{
  uint64_t MBXpcConnection;
  uint64_t v5;
  xpc_object_t v6;
  uint64_t v7;
  _QWORD v9[6];
  uint64_t v10;
  uint64_t *v11;
  uint64_t v12;
  int v13;
  uint64_t v14;
  uint64_t *v15;
  uint64_t v16;
  uint64_t v17;

  if (MBFLogInitOnce != -1)
    dispatch_once_f(&MBFLogInitOnce, 0, (dispatch_function_t)MBFLogInit);
  if (os_log_type_enabled((os_log_t)MBFLogComponent, OS_LOG_TYPE_DEBUG))
    BTDeviceGetLowSecurityStatus_cold_2();
  MBXpcConnection = getMBXpcConnection(a1);
  if (MBXpcConnection)
  {
    v5 = MBXpcConnection;
    v6 = xpc_dictionary_create(0, 0, 0);
    xpc_dictionary_set_uint64(v6, "kCBMsgArgBTDevice", a1);
    v14 = 0;
    v15 = &v14;
    v16 = 0x2000000000;
    v17 = 0;
    v10 = 0;
    v11 = &v10;
    v12 = 0x2000000000;
    v13 = 0;
    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 0x40000000;
    v9[2] = __BTDeviceGetLowSecurityStatus_block_invoke;
    v9[3] = &unk_1E6B06190;
    v9[4] = &v14;
    v9[5] = &v10;
    sendMessageWithReplySync(v5, "kCBMsgIdDeviceGetLowSecurityStatusMsg", v6, (uint64_t)v9);
    if (v6)
      xpc_release(v6);
    *a2 = *((_DWORD *)v11 + 6);
    v7 = *((unsigned int *)v15 + 6);
    _Block_object_dispose(&v10, 8);
    _Block_object_dispose(&v14, 8);
  }
  else
  {
    if (MBFLogInitOnce != -1)
      dispatch_once_f(&MBFLogInitOnce, 0, (dispatch_function_t)MBFLogInit);
    if (os_log_type_enabled((os_log_t)MBFLogComponent, OS_LOG_TYPE_ERROR))
      BTDeviceGetAddressString_cold_1();
    return 1;
  }
  return v7;
}

uint64_t BTDeviceGetHIDDeviceBehavior(uint64_t a1, _DWORD *a2)
{
  uint64_t MBXpcConnection;
  uint64_t v5;
  xpc_object_t v6;
  uint64_t v7;
  _QWORD v9[6];
  uint64_t v10;
  uint64_t *v11;
  uint64_t v12;
  int v13;
  uint64_t v14;
  uint64_t *v15;
  uint64_t v16;
  uint64_t v17;

  if (MBFLogInitOnce != -1)
    dispatch_once_f(&MBFLogInitOnce, 0, (dispatch_function_t)MBFLogInit);
  if (os_log_type_enabled((os_log_t)MBFLogComponent, OS_LOG_TYPE_DEBUG))
    BTDeviceGetHIDDeviceBehavior_cold_2();
  MBXpcConnection = getMBXpcConnection(a1);
  if (MBXpcConnection)
  {
    v5 = MBXpcConnection;
    v6 = xpc_dictionary_create(0, 0, 0);
    xpc_dictionary_set_uint64(v6, "kCBMsgArgBTDevice", a1);
    v14 = 0;
    v15 = &v14;
    v16 = 0x2000000000;
    v17 = 0;
    v10 = 0;
    v11 = &v10;
    v12 = 0x2000000000;
    v13 = 0;
    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 0x40000000;
    v9[2] = __BTDeviceGetHIDDeviceBehavior_block_invoke;
    v9[3] = &unk_1E6B061B8;
    v9[4] = &v14;
    v9[5] = &v10;
    sendMessageWithReplySync(v5, "kCBMsgIdDeviceGetHIDDeviceBehaviorMsg", v6, (uint64_t)v9);
    if (v6)
      xpc_release(v6);
    *a2 = *((_DWORD *)v11 + 6);
    v7 = *((unsigned int *)v15 + 6);
    _Block_object_dispose(&v10, 8);
    _Block_object_dispose(&v14, 8);
  }
  else
  {
    if (MBFLogInitOnce != -1)
      dispatch_once_f(&MBFLogInitOnce, 0, (dispatch_function_t)MBFLogInit);
    if (os_log_type_enabled((os_log_t)MBFLogComponent, OS_LOG_TYPE_ERROR))
      BTDeviceGetAddressString_cold_1();
    return 1;
  }
  return v7;
}

uint64_t BTDeviceSetHijackAudioRoute(uint64_t a1, unsigned int a2)
{
  uint64_t MBXpcConnection;
  uint64_t v5;
  xpc_object_t v6;
  uint64_t v7;
  _QWORD v9[5];
  uint64_t v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t v13;

  if (MBFLogInitOnce != -1)
    dispatch_once_f(&MBFLogInitOnce, 0, (dispatch_function_t)MBFLogInit);
  if (os_log_type_enabled((os_log_t)MBFLogComponent, OS_LOG_TYPE_DEBUG))
    BTDeviceSetHijackAudioRoute_cold_2();
  MBXpcConnection = getMBXpcConnection(a1);
  if (MBXpcConnection)
  {
    v5 = MBXpcConnection;
    v6 = xpc_dictionary_create(0, 0, 0);
    xpc_dictionary_set_uint64(v6, "kCBMsgArgBTDevice", a1);
    xpc_dictionary_set_uint64(v6, "kCBMsgArgBool", a2);
    v10 = 0;
    v11 = &v10;
    v12 = 0x2000000000;
    v13 = 0;
    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 0x40000000;
    v9[2] = __BTDeviceSetHijackAudioRoute_block_invoke;
    v9[3] = &unk_1E6B061E0;
    v9[4] = &v10;
    sendMessageWithReplySync(v5, "kCBMsgIdDeviceSetHijackAudioRouteMsg", v6, (uint64_t)v9);
    if (v6)
      xpc_release(v6);
    v7 = *((unsigned int *)v11 + 6);
    _Block_object_dispose(&v10, 8);
  }
  else
  {
    if (MBFLogInitOnce != -1)
      dispatch_once_f(&MBFLogInitOnce, 0, (dispatch_function_t)MBFLogInit);
    if (os_log_type_enabled((os_log_t)MBFLogComponent, OS_LOG_TYPE_ERROR))
      BTDeviceGetAddressString_cold_1();
    return 1;
  }
  return v7;
}

uint64_t BTDeviceSetACLHighPriority(uint64_t a1, unsigned int a2, unsigned int a3)
{
  uint64_t MBXpcConnection;
  uint64_t v7;
  xpc_object_t v8;
  uint64_t v9;
  _QWORD v11[5];
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t v15;

  if (MBFLogInitOnce != -1)
    dispatch_once_f(&MBFLogInitOnce, 0, (dispatch_function_t)MBFLogInit);
  if (os_log_type_enabled((os_log_t)MBFLogComponent, OS_LOG_TYPE_DEBUG))
    BTDeviceSetACLHighPriority_cold_2();
  MBXpcConnection = getMBXpcConnection(a1);
  if (MBXpcConnection)
  {
    v7 = MBXpcConnection;
    v8 = xpc_dictionary_create(0, 0, 0);
    xpc_dictionary_set_uint64(v8, "kCBMsgArgBTDevice", a1);
    xpc_dictionary_set_uint64(v8, "kCBMsgArgRequesterID", a2);
    xpc_dictionary_set_uint64(v8, "kCBMsgArgBool", a3);
    v12 = 0;
    v13 = &v12;
    v14 = 0x2000000000;
    v15 = 0;
    v11[0] = MEMORY[0x1E0C809B0];
    v11[1] = 0x40000000;
    v11[2] = __BTDeviceSetACLHighPriority_block_invoke;
    v11[3] = &unk_1E6B06208;
    v11[4] = &v12;
    sendMessageWithReplySync(v7, "kCBMsgIdDeviceSetACLHighPriorityMsg", v8, (uint64_t)v11);
    if (v8)
      xpc_release(v8);
    v9 = *((unsigned int *)v13 + 6);
    _Block_object_dispose(&v12, 8);
  }
  else
  {
    if (MBFLogInitOnce != -1)
      dispatch_once_f(&MBFLogInitOnce, 0, (dispatch_function_t)MBFLogInit);
    if (os_log_type_enabled((os_log_t)MBFLogComponent, OS_LOG_TYPE_ERROR))
      BTDeviceGetAddressString_cold_1();
    return 1;
  }
  return v9;
}

uint64_t BTDeviceIsMaster(uint64_t a1, _DWORD *a2)
{
  if (MBFLogInitOnce != -1)
    dispatch_once_f(&MBFLogInitOnce, 0, (dispatch_function_t)MBFLogInit);
  if (os_log_type_enabled((os_log_t)MBFLogComponent, OS_LOG_TYPE_ERROR))
    BTDeviceIsMaster_cold_1();
  return BTDeviceIsCentral(a1, a2);
}

uint64_t BTDeviceIsCentral(uint64_t a1, _DWORD *a2)
{
  uint64_t MBXpcConnection;
  xpc_object_t v5;
  uint64_t v6;
  _QWORD v8[6];
  uint64_t v9;
  uint64_t *v10;
  uint64_t v11;
  int v12;
  uint64_t v13;
  uint64_t *v14;
  uint64_t v15;
  uint64_t v16;

  MBXpcConnection = getMBXpcConnection(a1);
  if (MBFLogInitOnce != -1)
    dispatch_once_f(&MBFLogInitOnce, 0, (dispatch_function_t)MBFLogInit);
  if (os_log_type_enabled((os_log_t)MBFLogComponent, OS_LOG_TYPE_DEBUG))
  {
    BTDeviceIsCentral_cold_2();
    if (MBXpcConnection)
      goto LABEL_5;
  }
  else if (MBXpcConnection)
  {
LABEL_5:
    v5 = xpc_dictionary_create(0, 0, 0);
    xpc_dictionary_set_uint64(v5, "kCBMsgArgBTDevice", a1);
    v13 = 0;
    v14 = &v13;
    v15 = 0x2000000000;
    v16 = 0;
    v9 = 0;
    v10 = &v9;
    v11 = 0x2000000000;
    v12 = 0;
    v8[0] = MEMORY[0x1E0C809B0];
    v8[1] = 0x40000000;
    v8[2] = __BTDeviceIsCentral_block_invoke;
    v8[3] = &unk_1E6B06230;
    v8[4] = &v13;
    v8[5] = &v9;
    sendMessageWithReplySync(MBXpcConnection, "kCBMsgIdDeviceIsCentralMsg", v5, (uint64_t)v8);
    if (v5)
      xpc_release(v5);
    *a2 = *((_DWORD *)v10 + 6);
    v6 = *((unsigned int *)v14 + 6);
    _Block_object_dispose(&v9, 8);
    _Block_object_dispose(&v13, 8);
    return v6;
  }
  if (MBFLogInitOnce != -1)
    dispatch_once_f(&MBFLogInitOnce, 0, (dispatch_function_t)MBFLogInit);
  if (os_log_type_enabled((os_log_t)MBFLogComponent, OS_LOG_TYPE_ERROR))
    BTDeviceGetAddressString_cold_1();
  return 1;
}

uint64_t BTDeviceGetUserSelectedDeviceType(uint64_t a1, _DWORD *a2)
{
  uint64_t MBXpcConnection;
  xpc_object_t v5;
  uint64_t v6;
  _QWORD v8[6];
  uint64_t v9;
  uint64_t *v10;
  uint64_t v11;
  int v12;
  uint64_t v13;
  uint64_t *v14;
  uint64_t v15;
  uint64_t v16;

  MBXpcConnection = getMBXpcConnection(a1);
  if (MBFLogInitOnce != -1)
    dispatch_once_f(&MBFLogInitOnce, 0, (dispatch_function_t)MBFLogInit);
  if (os_log_type_enabled((os_log_t)MBFLogComponent, OS_LOG_TYPE_DEBUG))
  {
    BTDeviceGetUserSelectedDeviceType_cold_2();
    if (MBXpcConnection)
      goto LABEL_5;
  }
  else if (MBXpcConnection)
  {
LABEL_5:
    v5 = xpc_dictionary_create(0, 0, 0);
    xpc_dictionary_set_uint64(v5, "kCBMsgArgBTDevice", a1);
    v13 = 0;
    v14 = &v13;
    v15 = 0x2000000000;
    v16 = 0;
    v9 = 0;
    v10 = &v9;
    v11 = 0x2000000000;
    v12 = 0;
    v8[0] = MEMORY[0x1E0C809B0];
    v8[1] = 0x40000000;
    v8[2] = __BTDeviceGetUserSelectedDeviceType_block_invoke;
    v8[3] = &unk_1E6B06258;
    v8[4] = &v13;
    v8[5] = &v9;
    sendMessageWithReplySync(MBXpcConnection, "kCBMsgIdDeviceGetUserSelectedDeviceTypeMsg", v5, (uint64_t)v8);
    if (v5)
      xpc_release(v5);
    *a2 = *((_DWORD *)v10 + 6);
    v6 = *((unsigned int *)v14 + 6);
    _Block_object_dispose(&v9, 8);
    _Block_object_dispose(&v13, 8);
    return v6;
  }
  if (MBFLogInitOnce != -1)
    dispatch_once_f(&MBFLogInitOnce, 0, (dispatch_function_t)MBFLogInit);
  if (os_log_type_enabled((os_log_t)MBFLogComponent, OS_LOG_TYPE_ERROR))
    BTDeviceGetAddressString_cold_1();
  return 1;
}

uint64_t BTDeviceSetUserSelectedDeviceType(uint64_t a1, unsigned int a2)
{
  uint64_t MBXpcConnection;
  uint64_t v5;
  xpc_object_t v6;
  uint64_t v7;
  _QWORD v9[5];
  uint64_t v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t v13;

  if (MBFLogInitOnce != -1)
    dispatch_once_f(&MBFLogInitOnce, 0, (dispatch_function_t)MBFLogInit);
  if (os_log_type_enabled((os_log_t)MBFLogComponent, OS_LOG_TYPE_DEBUG))
    BTDeviceSetUserSelectedDeviceType_cold_2();
  MBXpcConnection = getMBXpcConnection(a1);
  if (MBXpcConnection)
  {
    v5 = MBXpcConnection;
    v6 = xpc_dictionary_create(0, 0, 0);
    xpc_dictionary_set_uint64(v6, "kCBMsgArgBTDevice", a1);
    xpc_dictionary_set_uint64(v6, "kCBMsgArgBTDeviceType", a2);
    v10 = 0;
    v11 = &v10;
    v12 = 0x2000000000;
    v13 = 0;
    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 0x40000000;
    v9[2] = __BTDeviceSetUserSelectedDeviceType_block_invoke;
    v9[3] = &unk_1E6B06280;
    v9[4] = &v10;
    sendMessageWithReplySync(v5, "kCBMsgIdDeviceSetUserSelectedDeviceTypeMsg", v6, (uint64_t)v9);
    if (v6)
      xpc_release(v6);
    v7 = *((unsigned int *)v11 + 6);
    _Block_object_dispose(&v10, 8);
  }
  else
  {
    if (MBFLogInitOnce != -1)
      dispatch_once_f(&MBFLogInitOnce, 0, (dispatch_function_t)MBFLogInit);
    if (os_log_type_enabled((os_log_t)MBFLogComponent, OS_LOG_TYPE_ERROR))
      BTDeviceGetAddressString_cold_1();
    return 1;
  }
  return v7;
}

uint64_t BTDeviceIsGenuineAirPods(uint64_t a1, _DWORD *a2)
{
  uint64_t MBXpcConnection;
  uint64_t v5;
  xpc_object_t v6;
  uint64_t v7;
  _QWORD v9[6];
  uint64_t v10;
  uint64_t *v11;
  uint64_t v12;
  int v13;
  uint64_t v14;
  uint64_t *v15;
  uint64_t v16;
  uint64_t v17;

  if (MBFLogInitOnce != -1)
    dispatch_once_f(&MBFLogInitOnce, 0, (dispatch_function_t)MBFLogInit);
  if (os_log_type_enabled((os_log_t)MBFLogComponent, OS_LOG_TYPE_DEBUG))
    BTDeviceIsGenuineAirPods_cold_2();
  MBXpcConnection = getMBXpcConnection(a1);
  if (MBXpcConnection)
  {
    v5 = MBXpcConnection;
    v6 = xpc_dictionary_create(0, 0, 0);
    xpc_dictionary_set_uint64(v6, "kCBMsgArgBTDevice", a1);
    v14 = 0;
    v15 = &v14;
    v16 = 0x2000000000;
    v17 = 0;
    v10 = 0;
    v11 = &v10;
    v12 = 0x2000000000;
    v13 = 0;
    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 0x40000000;
    v9[2] = __BTDeviceIsGenuineAirPods_block_invoke;
    v9[3] = &unk_1E6B062A8;
    v9[4] = &v14;
    v9[5] = &v10;
    sendMessageWithReplySync(v5, "kCBMsgIdDeviceIsGenuineAirPodsMsg", v6, (uint64_t)v9);
    if (v6)
      xpc_release(v6);
    *a2 = *((_DWORD *)v11 + 6);
    v7 = *((unsigned int *)v15 + 6);
    _Block_object_dispose(&v10, 8);
    _Block_object_dispose(&v14, 8);
  }
  else
  {
    if (MBFLogInitOnce != -1)
      dispatch_once_f(&MBFLogInitOnce, 0, (dispatch_function_t)MBFLogInit);
    if (os_log_type_enabled((os_log_t)MBFLogComponent, OS_LOG_TYPE_ERROR))
      BTDeviceGetAddressString_cold_1();
    return 1;
  }
  return v7;
}

uint64_t deviceServiceXpcDisconnectedHandler(uint64_t a1)
{
  if (MBFLogInitOnce != -1)
    dispatch_once_f(&MBFLogInitOnce, 0, (dispatch_function_t)MBFLogInit);
  if (os_log_type_enabled((os_log_t)MBFLogComponent, OS_LOG_TYPE_ERROR))
    deviceServiceXpcDisconnectedHandler_cold_1();
  return _localBTDeviceServiceRemoveCallbacksByXpcConnection(a1);
}

uint64_t deviceServiceXpcMsgHandler(uint64_t a1, const char *a2, xpc_object_t xdict)
{
  uint64_t uint64;
  uint64_t v7;
  void (*Callbacks)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD);
  NSObject *v9;
  BOOL v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  const char *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t UserData;
  uint64_t v20;
  NSObject *v21;
  const char *v23;
  uint64_t v24;
  uint8_t buf[4];
  const char *v26;
  __int16 v27;
  const char *v28;
  __int16 v29;
  uint64_t v30;
  __int16 v31;
  uint64_t v32;
  __int16 v33;
  uint64_t v34;
  __int16 v35;
  void (*v36)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD);
  __int16 v37;
  void (*v38)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD);
  uint64_t v39;

  v39 = *MEMORY[0x1E0C80C00];
  uint64 = xpc_dictionary_get_uint64(xdict, "kCBMsgArgSessionID");
  v7 = xpc_dictionary_get_uint64(xdict, "kCBMsgArgID");
  v24 = uint64;
  Callbacks = (void (*)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD))_localBTDeviceServiceGetCallbacks(uint64, v7);
  if (MBFLogInitOnce != -1)
    dispatch_once_f(&MBFLogInitOnce, 0, (dispatch_function_t)MBFLogInit);
  v9 = MBFLogComponent;
  if (os_log_type_enabled((os_log_t)MBFLogComponent, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 136316418;
    v26 = a2;
    v27 = 2080;
    v28 = (const char *)(a1 + 2080);
    v29 = 2080;
    v30 = a1 + 2336;
    v31 = 2048;
    v32 = uint64;
    v33 = 2048;
    v34 = v7;
    v35 = 2048;
    v36 = Callbacks;
    _os_log_debug_impl(&dword_1B6BF1000, v9, OS_LOG_TYPE_DEBUG, "deviceServiceXpcMsgHandler msg:%s sessionName:%s serviceName:%s session:%llx cbid:%llx cb:%llx", buf, 0x3Eu);
  }
  v10 = strcmp(a2, "kCBMsgIdServiceEvent") || Callbacks == 0;
  v11 = !v10;
  if (!v10)
  {
    v12 = xpc_dictionary_get_uint64(xdict, "kCBMsgArgResult");
    v13 = xpc_dictionary_get_uint64(xdict, "kCBMsgArgBTDevice");
    v14 = xpc_dictionary_get_uint64(xdict, "kCBMsgArgServiceMask");
    v15 = a1;
    v16 = a2;
    v17 = xpc_dictionary_get_uint64(xdict, "kCBMsgArgEventType");
    v18 = xpc_dictionary_get_uint64(xdict, "kCBMsgArgEvent");
    UserData = _localBTDeviceServiceGetUserData(v24, v7);
    v20 = v17;
    a2 = v16;
    a1 = v15;
    Callbacks(v13, v14, v20, v18, v12, UserData);
  }
  if (MBFLogInitOnce != -1)
    dispatch_once_f(&MBFLogInitOnce, 0, (dispatch_function_t)MBFLogInit);
  v21 = MBFLogComponent;
  if (os_log_type_enabled((os_log_t)MBFLogComponent, OS_LOG_TYPE_DEBUG))
  {
    v23 = "did not handle";
    *(_DWORD *)buf = 136316674;
    if ((_DWORD)v11)
      v23 = "handled";
    v26 = v23;
    v27 = 2080;
    v28 = a2;
    v29 = 2080;
    v30 = a1 + 2080;
    v31 = 2080;
    v32 = a1 + 2336;
    v33 = 2048;
    v34 = v24;
    v35 = 2048;
    v36 = (void (*)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD))v7;
    v37 = 2048;
    v38 = Callbacks;
    _os_log_debug_impl(&dword_1B6BF1000, v21, OS_LOG_TYPE_DEBUG, "deviceServiceXpcMsgHandler %s %s sessionName:%s serviceName:%s session:%llx cbid:%llx cb:%llx", buf, 0x48u);
  }
  return v11;
}

BOOL _localBTDiscoveryAgentCallbacksRegistered(uint64_t a1)
{
  unint64_t v2;
  uint64_t *v3;
  unint64_t v4;
  uint64_t v5;
  _BOOL8 v6;

  pthread_mutex_lock(&gLock_1);
  if (qword_1EF148CD8 == a1)
  {
    v6 = 1;
  }
  else
  {
    v2 = 0;
    v3 = &qword_1EF148D08;
    do
    {
      v4 = v2;
      if (v2 == 63)
        break;
      v5 = *v3;
      v3 += 6;
      ++v2;
    }
    while (v5 != a1);
    v6 = v4 < 0x3F;
  }
  pthread_mutex_unlock(&gLock_1);
  return v6;
}

uint64_t _localBTDiscoveryAgentAddCallbacks(uint64_t a1, uint64_t a2, _OWORD *a3, uint64_t a4, uint64_t a5)
{
  uint64_t v10;
  uint64_t v11;
  char *v12;

  pthread_mutex_lock(&gLock_1);
  v10 = 0;
  while (*(_QWORD *)((char *)&gBTDiscoveryAgentCallbackList + v10 + 16)
       || *(_QWORD *)((char *)&gBTDiscoveryAgentCallbackList + v10 + 32))
  {
    v10 += 48;
    if (v10 == 3072)
    {
      v11 = 4;
      goto LABEL_7;
    }
  }
  v11 = 0;
  v12 = (char *)&gBTDiscoveryAgentCallbackList + v10;
  *(_OWORD *)v12 = *a3;
  *((_QWORD *)v12 + 4) = a5;
  *((_QWORD *)v12 + 5) = a4;
  *((_QWORD *)v12 + 2) = a1;
  *((_QWORD *)v12 + 3) = a2;
LABEL_7:
  pthread_mutex_unlock(&gLock_1);
  return v11;
}

uint64_t _localBTDiscoveryAgentRemoveCallbacks(uint64_t a1)
{
  uint64_t v2;
  _OWORD *v3;

  pthread_mutex_lock(&gLock_1);
  v2 = 0;
  while (1)
  {
    v3 = (_OWORD *)((char *)&gBTDiscoveryAgentCallbackList + v2);
    if (*(_QWORD *)((char *)&gBTDiscoveryAgentCallbackList + v2 + 16) == a1)
      break;
    v2 += 48;
    if (v2 == 3072)
      goto LABEL_6;
  }
  v3[1] = 0u;
  v3[2] = 0u;
  *v3 = 0u;
LABEL_6:
  pthread_mutex_unlock(&gLock_1);
  return 0;
}

uint64_t _localBTDiscoveryAgentRemoveCallbacksByXpcConnection(uint64_t a1)
{
  uint64_t i;
  _OWORD *v3;

  pthread_mutex_lock(&gLock_1);
  for (i = 0; i != 3072; i += 48)
  {
    v3 = (_OWORD *)((char *)&gBTDiscoveryAgentCallbackList + i);
    if (*(_QWORD *)((char *)&gBTDiscoveryAgentCallbackList + i + 24) == a1)
    {
      v3[1] = 0uLL;
      v3[2] = 0uLL;
      *v3 = 0uLL;
    }
  }
  pthread_mutex_unlock(&gLock_1);
  return 0;
}

char *_localBTDiscoveryAgentGetCallbacks(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  char *v5;

  pthread_mutex_lock(&gLock_1);
  v4 = 0;
  while (*(_QWORD *)((char *)&gBTDiscoveryAgentCallbackList + v4 + 16) != a1
       || *(_QWORD *)((char *)&gBTDiscoveryAgentCallbackList + v4 + 32) != a2)
  {
    v4 += 48;
    if (v4 == 3072)
    {
      v5 = 0;
      goto LABEL_7;
    }
  }
  v5 = (char *)&gBTDiscoveryAgentCallbackList + v4;
LABEL_7:
  pthread_mutex_unlock(&gLock_1);
  return v5;
}

uint64_t _localBTDiscoveryAgentGetUserData(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;

  pthread_mutex_lock(&gLock_1);
  v4 = 0;
  while (*(_QWORD *)((char *)&gBTDiscoveryAgentCallbackList + v4 + 16) != a1
       || *(_QWORD *)((char *)&gBTDiscoveryAgentCallbackList + v4 + 32) != a2)
  {
    v4 += 48;
    if (v4 == 3072)
    {
      v5 = 0;
      goto LABEL_7;
    }
  }
  v5 = *(_QWORD *)((char *)&gBTDiscoveryAgentCallbackList + v4 + 40);
LABEL_7:
  pthread_mutex_unlock(&gLock_1);
  return v5;
}

uint64_t BTDiscoveryAgentCreate(uint64_t *a1, _OWORD *a2, uint64_t a3, _QWORD *a4)
{
  NSObject *v8;
  uint64_t SessionHandle;
  uint64_t MBXpcConnection;
  uint64_t v11;
  uint64_t v12;
  xpc_object_t v13;
  uint64_t v14;
  _QWORD v16[6];
  uint64_t v17;
  uint64_t *v18;
  uint64_t v19;
  uint64_t v20;
  __int128 buf;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  if (MBFLogInitOnce != -1)
    dispatch_once_f(&MBFLogInitOnce, 0, (dispatch_function_t)MBFLogInit);
  v8 = MBFLogComponent;
  if (os_log_type_enabled((os_log_t)MBFLogComponent, OS_LOG_TYPE_DEBUG))
  {
    LODWORD(buf) = 134217984;
    *(_QWORD *)((char *)&buf + 4) = a1;
    _os_log_debug_impl(&dword_1B6BF1000, v8, OS_LOG_TYPE_DEBUG, "BTDiscoveryAgentCreate session :%llx", (uint8_t *)&buf, 0xCu);
  }
  SessionHandle = getSessionHandle(a1);
  MBXpcConnection = getMBXpcConnection((uint64_t)a1);
  *(_QWORD *)&buf = 0;
  *((_QWORD *)&buf + 1) = &buf;
  v22 = 0x2000000000;
  v23 = 0;
  if (MBXpcConnection)
  {
    v11 = MBXpcConnection;
    v12 = ++gCBID_1;
    v13 = xpc_dictionary_create(0, 0, 0);
    xpc_dictionary_set_uint64(v13, "kCBMsgArgSessionID", SessionHandle);
    xpc_dictionary_set_uint64(v13, "kCBMsgArgID", v12);
    v17 = 0;
    v18 = &v17;
    v19 = 0x2000000000;
    v20 = 0;
    v16[0] = MEMORY[0x1E0C809B0];
    v16[1] = 0x40000000;
    v16[2] = __BTDiscoveryAgentCreate_block_invoke;
    v16[3] = &unk_1E6B062D0;
    v16[4] = &buf;
    v16[5] = &v17;
    sendMessageWithReplySync(v11, "kCBMsgIdDiscoveryAgentCreateMsg", v13, (uint64_t)v16);
    if (v13)
      xpc_release(v13);
    v14 = v18[3];
    if (!v14)
    {
      addXpcMsgHandler(v11, (uint64_t)&deviceServiceManagerXpcCallbacks_0);
      if (_localBTDiscoveryAgentCallbacksRegistered(*(_QWORD *)(*((_QWORD *)&buf + 1) + 24)))
      {
        if (MBFLogInitOnce != -1)
          dispatch_once_f(&MBFLogInitOnce, 0, (dispatch_function_t)MBFLogInit);
        if (os_log_type_enabled((os_log_t)MBFLogComponent, OS_LOG_TYPE_DEBUG))
          BTAccessoryManagerAddCallbacks_cold_2();
        v14 = 0;
      }
      else if (_localBTDiscoveryAgentAddCallbacks(*(_QWORD *)(*((_QWORD *)&buf + 1) + 24), v11, a2, a3, v12))
      {
        if (MBFLogInitOnce != -1)
          dispatch_once_f(&MBFLogInitOnce, 0, (dispatch_function_t)MBFLogInit);
        if (os_log_type_enabled((os_log_t)MBFLogComponent, OS_LOG_TYPE_DEBUG))
          BTDiscoveryAgentCreate_cold_3();
        v14 = 4;
      }
      else
      {
        *a4 = *(_QWORD *)(*((_QWORD *)&buf + 1) + 24);
        v14 = v18[3];
      }
    }
    _Block_object_dispose(&v17, 8);
  }
  else
  {
    if (MBFLogInitOnce != -1)
      dispatch_once_f(&MBFLogInitOnce, 0, (dispatch_function_t)MBFLogInit);
    if (os_log_type_enabled((os_log_t)MBFLogComponent, OS_LOG_TYPE_ERROR))
      BTDeviceAddressToString_cold_1();
    v14 = 1;
  }
  _Block_object_dispose(&buf, 8);
  return v14;
}

uint64_t BTDiscoveryAgentDestroy(uint64_t *a1)
{
  uint64_t MBXpcConnection;
  uint64_t v3;
  xpc_object_t v4;
  uint64_t v5;
  _QWORD v7[5];
  uint64_t v8;
  uint64_t *v9;
  uint64_t v10;
  uint64_t v11;

  if (MBFLogInitOnce != -1)
    dispatch_once_f(&MBFLogInitOnce, 0, (dispatch_function_t)MBFLogInit);
  if (os_log_type_enabled((os_log_t)MBFLogComponent, OS_LOG_TYPE_DEBUG))
    BTDiscoveryAgentDestroy_cold_2();
  MBXpcConnection = getMBXpcConnection(*a1);
  if (MBXpcConnection)
  {
    v3 = MBXpcConnection;
    v4 = xpc_dictionary_create(0, 0, 0);
    xpc_dictionary_set_uint64(v4, "kCBMsgArgDiscoveryAgentID", (uint64_t)a1);
    v8 = 0;
    v9 = &v8;
    v10 = 0x2000000000;
    v11 = 0;
    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 0x40000000;
    v7[2] = __BTDiscoveryAgentDestroy_block_invoke;
    v7[3] = &unk_1E6B062F8;
    v7[4] = &v8;
    sendMessageWithReplySync(v3, "kCBMsgIdDiscoveryAgentDestroyMsg", v4, (uint64_t)v7);
    if (!v9[3])
    {
      _localBTDiscoveryAgentRemoveCallbacks(*a1);
      removeXpcMsgHandler(v3, (uint64_t)&deviceServiceManagerXpcCallbacks_0);
      *a1 = 0;
    }
    if (v4)
      xpc_release(v4);
    v5 = *((unsigned int *)v9 + 6);
    _Block_object_dispose(&v8, 8);
  }
  else
  {
    if (MBFLogInitOnce != -1)
      dispatch_once_f(&MBFLogInitOnce, 0, (dispatch_function_t)MBFLogInit);
    if (os_log_type_enabled((os_log_t)MBFLogComponent, OS_LOG_TYPE_ERROR))
      BTAccessoryManagerRegisterDevice_cold_1();
    return 1;
  }
  return v5;
}

uint64_t BTDiscoveryAgentStartScan(uint64_t a1, unsigned int a2, unsigned int a3)
{
  uint64_t MBXpcConnection;
  uint64_t v7;
  xpc_object_t v8;
  uint64_t v9;
  _QWORD v11[5];
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t v15;

  if (MBFLogInitOnce != -1)
    dispatch_once_f(&MBFLogInitOnce, 0, (dispatch_function_t)MBFLogInit);
  if (os_log_type_enabled((os_log_t)MBFLogComponent, OS_LOG_TYPE_DEBUG))
    BTDiscoveryAgentStartScan_cold_2();
  MBXpcConnection = getMBXpcConnection(a1);
  if (MBXpcConnection)
  {
    v7 = MBXpcConnection;
    v8 = xpc_dictionary_create(0, 0, 0);
    xpc_dictionary_set_uint64(v8, "kCBMsgArgDiscoveryAgentID", a1);
    xpc_dictionary_set_uint64(v8, "kCBMsgArgDiscoveryMode", a2);
    xpc_dictionary_set_uint64(v8, "kCBMsgArgServices", a3);
    v12 = 0;
    v13 = &v12;
    v14 = 0x2000000000;
    v15 = 0;
    v11[0] = MEMORY[0x1E0C809B0];
    v11[1] = 0x40000000;
    v11[2] = __BTDiscoveryAgentStartScan_block_invoke;
    v11[3] = &unk_1E6B06320;
    v11[4] = &v12;
    sendMessageWithReplySync(v7, "kCBMsgIdDiscoveryAgentStartScanMsg", v8, (uint64_t)v11);
    if (v8)
      xpc_release(v8);
    v9 = *((unsigned int *)v13 + 6);
    _Block_object_dispose(&v12, 8);
  }
  else
  {
    if (MBFLogInitOnce != -1)
      dispatch_once_f(&MBFLogInitOnce, 0, (dispatch_function_t)MBFLogInit);
    if (os_log_type_enabled((os_log_t)MBFLogComponent, OS_LOG_TYPE_ERROR))
      BTAccessoryManagerRegisterDevice_cold_1();
    return 1;
  }
  return v9;
}

uint64_t BTDiscoveryAgentStartScanForAdvertizedData(uint64_t a1)
{
  uint64_t MBXpcConnection;
  uint64_t v3;
  xpc_object_t v4;
  uint64_t v5;
  _QWORD v7[5];
  uint64_t v8;
  uint64_t *v9;
  uint64_t v10;
  uint64_t v11;

  if (MBFLogInitOnce != -1)
    dispatch_once_f(&MBFLogInitOnce, 0, (dispatch_function_t)MBFLogInit);
  if (os_log_type_enabled((os_log_t)MBFLogComponent, OS_LOG_TYPE_DEBUG))
    BTDiscoveryAgentStartScanForAdvertizedData_cold_2();
  MBXpcConnection = getMBXpcConnection(a1);
  if (MBXpcConnection)
  {
    v3 = MBXpcConnection;
    v4 = xpc_dictionary_create(0, 0, 0);
    xpc_dictionary_set_uint64(v4, "kCBMsgArgDiscoveryAgentID", a1);
    v8 = 0;
    v9 = &v8;
    v10 = 0x2000000000;
    v11 = 0;
    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 0x40000000;
    v7[2] = __BTDiscoveryAgentStartScanForAdvertizedData_block_invoke;
    v7[3] = &unk_1E6B06348;
    v7[4] = &v8;
    sendMessageWithReplySync(v3, "kCBMsgIdDiscoveryAgentStartScanForAdvertizedDataMsg", v4, (uint64_t)v7);
    if (v4)
      xpc_release(v4);
    v5 = *((unsigned int *)v9 + 6);
    _Block_object_dispose(&v8, 8);
  }
  else
  {
    if (MBFLogInitOnce != -1)
      dispatch_once_f(&MBFLogInitOnce, 0, (dispatch_function_t)MBFLogInit);
    if (os_log_type_enabled((os_log_t)MBFLogComponent, OS_LOG_TYPE_ERROR))
      BTAccessoryManagerRegisterDevice_cold_1();
    return 1;
  }
  return v5;
}

uint64_t BTDiscoveryAgentStopScan(uint64_t a1)
{
  uint64_t MBXpcConnection;
  uint64_t v3;
  xpc_object_t v4;
  uint64_t v5;
  _QWORD v7[5];
  uint64_t v8;
  uint64_t *v9;
  uint64_t v10;
  uint64_t v11;

  if (MBFLogInitOnce != -1)
    dispatch_once_f(&MBFLogInitOnce, 0, (dispatch_function_t)MBFLogInit);
  if (os_log_type_enabled((os_log_t)MBFLogComponent, OS_LOG_TYPE_DEBUG))
    BTDiscoveryAgentStopScan_cold_2();
  MBXpcConnection = getMBXpcConnection(a1);
  if (MBXpcConnection)
  {
    v3 = MBXpcConnection;
    v4 = xpc_dictionary_create(0, 0, 0);
    xpc_dictionary_set_uint64(v4, "kCBMsgArgDiscoveryAgentID", a1);
    v8 = 0;
    v9 = &v8;
    v10 = 0x2000000000;
    v11 = 0;
    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 0x40000000;
    v7[2] = __BTDiscoveryAgentStopScan_block_invoke;
    v7[3] = &unk_1E6B06370;
    v7[4] = &v8;
    sendMessageWithReplySync(v3, "kCBMsgIdDiscoveryAgentStopScanMsg", v4, (uint64_t)v7);
    if (v4)
      xpc_release(v4);
    v5 = *((unsigned int *)v9 + 6);
    _Block_object_dispose(&v8, 8);
  }
  else
  {
    if (MBFLogInitOnce != -1)
      dispatch_once_f(&MBFLogInitOnce, 0, (dispatch_function_t)MBFLogInit);
    if (os_log_type_enabled((os_log_t)MBFLogComponent, OS_LOG_TYPE_ERROR))
      BTAccessoryManagerRegisterDevice_cold_1();
    return 1;
  }
  return v5;
}

uint64_t BTDiscoveryAgentGetDevices(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t MBXpcConnection;
  uint64_t v9;
  xpc_object_t v10;
  uint64_t v11;
  _QWORD v13[8];
  uint64_t v14;
  uint64_t *v15;
  uint64_t v16;
  uint64_t v17;

  if (MBFLogInitOnce != -1)
    dispatch_once_f(&MBFLogInitOnce, 0, (dispatch_function_t)MBFLogInit);
  if (os_log_type_enabled((os_log_t)MBFLogComponent, OS_LOG_TYPE_DEBUG))
    BTDiscoveryAgentGetDevices_cold_2();
  MBXpcConnection = getMBXpcConnection(a1);
  if (MBXpcConnection)
  {
    v9 = MBXpcConnection;
    v10 = xpc_dictionary_create(0, 0, 0);
    xpc_dictionary_set_uint64(v10, "kCBMsgArgDiscoveryAgentID", a1);
    xpc_dictionary_set_uint64(v10, "kCbMsgArgDeviceArrayMaxSize", a4);
    v14 = 0;
    v15 = &v14;
    v16 = 0x2000000000;
    v17 = 0;
    v13[0] = MEMORY[0x1E0C809B0];
    v13[1] = 0x40000000;
    v13[2] = __BTDiscoveryAgentGetDevices_block_invoke;
    v13[3] = &unk_1E6B06398;
    v13[4] = &v14;
    v13[5] = a4;
    v13[6] = a2;
    v13[7] = a3;
    sendMessageWithReplySync(v9, "kCBMsgIdDiscoveryAgentGetDevicesMsg", v10, (uint64_t)v13);
    if (v10)
      xpc_release(v10);
    v11 = *((unsigned int *)v15 + 6);
    _Block_object_dispose(&v14, 8);
  }
  else
  {
    if (MBFLogInitOnce != -1)
      dispatch_once_f(&MBFLogInitOnce, 0, (dispatch_function_t)MBFLogInit);
    if (os_log_type_enabled((os_log_t)MBFLogComponent, OS_LOG_TYPE_ERROR))
      BTAccessoryManagerRegisterDevice_cold_1();
    return 1;
  }
  return v11;
}

uint64_t BTDiscoveryAgentAddKey(uint64_t a1, const void *a2, size_t a3)
{
  uint64_t MBXpcConnection;
  uint64_t v7;
  xpc_object_t v8;
  uint64_t v9;
  _QWORD v11[5];
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t v15;

  if (MBFLogInitOnce != -1)
    dispatch_once_f(&MBFLogInitOnce, 0, (dispatch_function_t)MBFLogInit);
  if (os_log_type_enabled((os_log_t)MBFLogComponent, OS_LOG_TYPE_DEBUG))
    BTDiscoveryAgentAddKey_cold_4();
  MBXpcConnection = getMBXpcConnection(a1);
  if (!MBXpcConnection)
  {
    if (MBFLogInitOnce != -1)
      dispatch_once_f(&MBFLogInitOnce, 0, (dispatch_function_t)MBFLogInit);
    if (os_log_type_enabled((os_log_t)MBFLogComponent, OS_LOG_TYPE_ERROR))
      BTAccessoryManagerRegisterDevice_cold_1();
    return 1;
  }
  if (!a2)
  {
    if (MBFLogInitOnce != -1)
      dispatch_once_f(&MBFLogInitOnce, 0, (dispatch_function_t)MBFLogInit);
    if (os_log_type_enabled((os_log_t)MBFLogComponent, OS_LOG_TYPE_ERROR))
      BTDiscoveryAgentAddKey_cold_2();
    return 1;
  }
  if (!a3)
  {
    if (MBFLogInitOnce != -1)
      dispatch_once_f(&MBFLogInitOnce, 0, (dispatch_function_t)MBFLogInit);
    if (os_log_type_enabled((os_log_t)MBFLogComponent, OS_LOG_TYPE_ERROR))
      BTDiscoveryAgentAddKey_cold_3();
    return 1;
  }
  v7 = MBXpcConnection;
  v8 = xpc_dictionary_create(0, 0, 0);
  xpc_dictionary_set_uint64(v8, "kCBMsgArgDiscoveryAgentID", a1);
  xpc_dictionary_set_data(v8, "kCBMsgArgKey", a2, a3);
  v12 = 0;
  v13 = &v12;
  v14 = 0x2000000000;
  v15 = 0;
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 0x40000000;
  v11[2] = __BTDiscoveryAgentAddKey_block_invoke;
  v11[3] = &unk_1E6B063C0;
  v11[4] = &v12;
  sendMessageWithReplySync(v7, "kCBMsgIdDiscoveryAgentAddKeyMsg", v8, (uint64_t)v11);
  if (v8)
    xpc_release(v8);
  v9 = *((unsigned int *)v13 + 6);
  _Block_object_dispose(&v12, 8);
  return v9;
}

uint64_t BTDiscoveryAgentRemoveKey(uint64_t a1, const void *a2, size_t a3)
{
  uint64_t MBXpcConnection;
  uint64_t v7;
  xpc_object_t v8;
  uint64_t v9;
  _QWORD v11[5];
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t v15;

  if (MBFLogInitOnce != -1)
    dispatch_once_f(&MBFLogInitOnce, 0, (dispatch_function_t)MBFLogInit);
  if (os_log_type_enabled((os_log_t)MBFLogComponent, OS_LOG_TYPE_DEBUG))
    BTDiscoveryAgentRemoveKey_cold_4();
  MBXpcConnection = getMBXpcConnection(a1);
  if (!MBXpcConnection)
  {
    if (MBFLogInitOnce != -1)
      dispatch_once_f(&MBFLogInitOnce, 0, (dispatch_function_t)MBFLogInit);
    if (os_log_type_enabled((os_log_t)MBFLogComponent, OS_LOG_TYPE_ERROR))
      BTAccessoryManagerRegisterDevice_cold_1();
    return 1;
  }
  if (!a2)
  {
    if (MBFLogInitOnce != -1)
      dispatch_once_f(&MBFLogInitOnce, 0, (dispatch_function_t)MBFLogInit);
    if (os_log_type_enabled((os_log_t)MBFLogComponent, OS_LOG_TYPE_ERROR))
      BTDiscoveryAgentAddKey_cold_2();
    return 1;
  }
  if (!a3)
  {
    if (MBFLogInitOnce != -1)
      dispatch_once_f(&MBFLogInitOnce, 0, (dispatch_function_t)MBFLogInit);
    if (os_log_type_enabled((os_log_t)MBFLogComponent, OS_LOG_TYPE_ERROR))
      BTDiscoveryAgentAddKey_cold_3();
    return 1;
  }
  v7 = MBXpcConnection;
  v8 = xpc_dictionary_create(0, 0, 0);
  xpc_dictionary_set_uint64(v8, "kCBMsgArgDiscoveryAgentID", a1);
  xpc_dictionary_set_data(v8, "kCBMsgArgKey", a2, a3);
  v12 = 0;
  v13 = &v12;
  v14 = 0x2000000000;
  v15 = 0;
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 0x40000000;
  v11[2] = __BTDiscoveryAgentRemoveKey_block_invoke;
  v11[3] = &unk_1E6B063E8;
  v11[4] = &v12;
  sendMessageWithReplySync(v7, "kCBMsgIdDiscoveryAgentRemoveKeyMsg", v8, (uint64_t)v11);
  if (v8)
    xpc_release(v8);
  v9 = *((unsigned int *)v13 + 6);
  _Block_object_dispose(&v12, 8);
  return v9;
}

uint64_t discoveryAgentXpcDisconnectedHandler(uint64_t a1)
{
  if (MBFLogInitOnce != -1)
    dispatch_once_f(&MBFLogInitOnce, 0, (dispatch_function_t)MBFLogInit);
  if (os_log_type_enabled((os_log_t)MBFLogComponent, OS_LOG_TYPE_ERROR))
    discoveryAgentXpcDisconnectedHandler_cold_1();
  return _localBTDiscoveryAgentRemoveCallbacksByXpcConnection(a1);
}

uint64_t discoveryAgentXpcMsgHandler(uint64_t a1, const char *a2, xpc_object_t xdict)
{
  uint64_t uint64;
  uint64_t v7;
  char *Callbacks;
  NSObject *v9;
  uint64_t v10;
  char *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void (*v15)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t);
  uint64_t UserData;
  NSObject *v17;
  const char *v19;
  uint64_t v20;
  uint8_t buf[4];
  const char *v22;
  __int16 v23;
  const char *v24;
  __int16 v25;
  uint64_t v26;
  __int16 v27;
  uint64_t v28;
  __int16 v29;
  uint64_t v30;
  __int16 v31;
  uint64_t v32;
  __int16 v33;
  char *v34;
  uint64_t v35;

  v35 = *MEMORY[0x1E0C80C00];
  uint64 = xpc_dictionary_get_uint64(xdict, "kCBMsgArgDiscoveryAgentID");
  v7 = xpc_dictionary_get_uint64(xdict, "kCBMsgArgID");
  Callbacks = _localBTDiscoveryAgentGetCallbacks(uint64, v7);
  if (MBFLogInitOnce != -1)
    dispatch_once_f(&MBFLogInitOnce, 0, (dispatch_function_t)MBFLogInit);
  v9 = MBFLogComponent;
  if (os_log_type_enabled((os_log_t)MBFLogComponent, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 136316418;
    v22 = a2;
    v23 = 2080;
    v24 = (const char *)(a1 + 2080);
    v25 = 2080;
    v26 = a1 + 2336;
    v27 = 2048;
    v28 = uint64;
    v29 = 2048;
    v30 = v7;
    v31 = 2048;
    v32 = (uint64_t)Callbacks;
    _os_log_debug_impl(&dword_1B6BF1000, v9, OS_LOG_TYPE_DEBUG, "discoveryAgentXpcMsgHandler msg:%s sessionName:%s serviceName:%s agentID:%llx cbid:%llx cbs:%llx", buf, 0x3Eu);
  }
  if (!strcmp(a2, "kCBMsgIdDiscoveryAgentStatusEvent"))
  {
    if (Callbacks && *(_QWORD *)Callbacks)
    {
      v20 = a1;
      v12 = xpc_dictionary_get_uint64(xdict, "kCBMsgArgBTDevice");
      v14 = xpc_dictionary_get_uint64(xdict, "kCBMsgArgResult");
      v13 = xpc_dictionary_get_uint64(xdict, "kCBMsgArgStatus");
      v11 = Callbacks;
      goto LABEL_13;
    }
    goto LABEL_14;
  }
  v10 = 0;
  if (!strcmp(a2, "kCBMsgIdDiscoveryAgentDiscoveryEvent") && Callbacks)
  {
    v11 = Callbacks + 8;
    if (*((_QWORD *)Callbacks + 1))
    {
      v20 = a1;
      v12 = xpc_dictionary_get_uint64(xdict, "kCBMsgArgBTDevice");
      v13 = xpc_dictionary_get_uint64(xdict, "kCBMsgArgEvent");
      v14 = xpc_dictionary_get_uint64(xdict, "kCBMsgArgAttributes");
LABEL_13:
      v15 = *(void (**)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))v11;
      UserData = _localBTDiscoveryAgentGetUserData(uint64, v7);
      v15(uint64, v13, v12, v14, UserData);
      v10 = 1;
      a1 = v20;
      goto LABEL_15;
    }
LABEL_14:
    v10 = 0;
  }
LABEL_15:
  if (MBFLogInitOnce != -1)
    dispatch_once_f(&MBFLogInitOnce, 0, (dispatch_function_t)MBFLogInit);
  v17 = MBFLogComponent;
  if (os_log_type_enabled((os_log_t)MBFLogComponent, OS_LOG_TYPE_DEBUG))
  {
    v19 = "did not handle";
    *(_DWORD *)buf = 136316674;
    if ((_DWORD)v10)
      v19 = "handled";
    v22 = v19;
    v23 = 2080;
    v24 = a2;
    v25 = 2080;
    v26 = a1 + 2080;
    v27 = 2080;
    v28 = a1 + 2336;
    v29 = 2048;
    v30 = uint64;
    v31 = 2048;
    v32 = v7;
    v33 = 2048;
    v34 = Callbacks;
    _os_log_debug_impl(&dword_1B6BF1000, v17, OS_LOG_TYPE_DEBUG, "discoveryAgentXpcMsgHandler %s %s sessionName:%s serviceName:%s agentID:%llx cbid:%llx cbs:%llx", buf, 0x48u);
  }
  return v10;
}

uint64_t _localBTLocalDeviceGetCallbacksCBID(uint64_t a1, _QWORD *a2)
{
  uint64_t v4;
  BOOL v5;
  uint64_t v7;

  pthread_mutex_lock(&gLock_2);
  v4 = 0;
  while (1)
  {
    if (gBTLocalDeviceCallbackList[v4] == a1)
    {
      v5 = gBTLocalDeviceCallbackList[v4 + 1] == *a2 && gBTLocalDeviceCallbackList[v4 + 2] == a2[1];
      if (v5 && gBTLocalDeviceCallbackList[v4 + 3] == a2[2])
        break;
    }
    v4 += 7;
    if (v4 == 448)
    {
      v7 = 0;
      goto LABEL_13;
    }
  }
  v7 = gBTLocalDeviceCallbackList[v4 + 5];
LABEL_13:
  pthread_mutex_unlock(&gLock_2);
  return v7;
}

BOOL _localBTLocalDeviceStatsCallbacksRegistered(uint64_t a1, _QWORD *a2)
{
  unint64_t v4;
  BOOL v5;
  uint64_t *v6;

  pthread_mutex_lock(&gLock_2);
  v4 = 0;
  v5 = 1;
  v6 = &qword_1EF1498D0;
  do
  {
    if (*(v6 - 1) == a1 && *v6 == *a2)
      break;
    v5 = v4 < 0x3F;
    v6 += 5;
    ++v4;
  }
  while (v4 != 64);
  pthread_mutex_unlock(&gLock_2);
  return v5;
}

uint64_t _localBTLocalDeviceStatsGetCallbacksCBID(uint64_t a1, _QWORD *a2)
{
  uint64_t v4;
  uint64_t v5;

  pthread_mutex_lock(&gLock_2);
  v4 = 0;
  while (gBTLocalDevicePowerCallbackList[v4] != a1 || gBTLocalDevicePowerCallbackList[v4 + 1] != *a2)
  {
    v4 += 5;
    if (v4 == 320)
    {
      v5 = 0;
      goto LABEL_7;
    }
  }
  v5 = gBTLocalDevicePowerCallbackList[v4 + 3];
LABEL_7:
  pthread_mutex_unlock(&gLock_2);
  return v5;
}

uint64_t _localBTLocalDeviceAddStatsCallbacks(uint64_t a1, uint64_t a2, uint64_t *a3, uint64_t a4, uint64_t *a5)
{
  uint64_t v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;

  pthread_mutex_lock(&gLock_2);
  v10 = 0;
  while (1)
  {
    if (!gBTLocalDevicePowerCallbackList[v10])
    {
      v11 = &gBTLocalDevicePowerCallbackList[v10];
      if (!gBTLocalDevicePowerCallbackList[v10 + 3])
        break;
    }
    v10 += 5;
    if (v10 == 320)
    {
      v12 = 4;
      goto LABEL_7;
    }
  }
  v12 = 0;
  v13 = *a3;
  v14 = ++gCBID_2;
  *v11 = a1;
  v11[1] = v13;
  v11[3] = v14;
  v11[4] = a4;
  v11[2] = a2;
  *a5 = v14;
LABEL_7:
  pthread_mutex_unlock(&gLock_2);
  return v12;
}

uint64_t _localBTLocalDeviceRemoveCallbacks(uint64_t a1, _QWORD *a2)
{
  uint64_t v4;
  uint64_t *v5;
  BOOL v6;

  pthread_mutex_lock(&gLock_2);
  v4 = 0;
  while (1)
  {
    if (gBTLocalDeviceCallbackList[v4] == a1)
    {
      v5 = &gBTLocalDeviceCallbackList[v4];
      v6 = gBTLocalDeviceCallbackList[v4 + 1] == *a2 && gBTLocalDeviceCallbackList[v4 + 2] == a2[1];
      if (v6 && gBTLocalDeviceCallbackList[v4 + 3] == a2[2])
        break;
    }
    v4 += 7;
    if (v4 == 448)
      goto LABEL_13;
  }
  v5[6] = 0;
  *((_OWORD *)v5 + 1) = 0u;
  *((_OWORD *)v5 + 2) = 0u;
  *(_OWORD *)v5 = 0u;
LABEL_13:
  pthread_mutex_unlock(&gLock_2);
  return 0;
}

uint64_t _localBTLocalDeviceRemoveAllCallbacksByXPCConnection(uint64_t a1)
{
  uint64_t i;
  uint64_t *v3;
  uint64_t j;
  uint64_t *v5;

  pthread_mutex_lock(&gLock_2);
  for (i = 0; i != 448; i += 7)
  {
    v3 = &gBTLocalDeviceCallbackList[i];
    if (gBTLocalDeviceCallbackList[i + 4] == a1)
    {
      v3[6] = 0;
      *((_OWORD *)v3 + 1) = 0uLL;
      *((_OWORD *)v3 + 2) = 0uLL;
      *(_OWORD *)v3 = 0uLL;
    }
  }
  for (j = 0; j != 320; j += 5)
  {
    v5 = &gBTLocalDevicePowerCallbackList[j];
    if (gBTLocalDevicePowerCallbackList[j + 2] == a1)
    {
      v5[4] = 0;
      *(_OWORD *)v5 = 0uLL;
      *((_OWORD *)v5 + 1) = 0uLL;
    }
  }
  pthread_mutex_unlock(&gLock_2);
  return 0;
}

uint64_t _localBTLocalDeviceRemoveStatsCallbacks(uint64_t a1)
{
  uint64_t v2;
  uint64_t *v3;

  pthread_mutex_lock(&gLock_2);
  v2 = 0;
  while (1)
  {
    if (gBTLocalDevicePowerCallbackList[v2] == a1)
    {
      v3 = &gBTLocalDevicePowerCallbackList[v2];
      if (gBTLocalDevicePowerCallbackList[v2 + 1])
        break;
    }
    v2 += 5;
    if (v2 == 320)
      goto LABEL_7;
  }
  v3[4] = 0;
  *(_OWORD *)v3 = 0u;
  *((_OWORD *)v3 + 1) = 0u;
LABEL_7:
  pthread_mutex_unlock(&gLock_2);
  return 0;
}

uint64_t *_localBTLocalDeviceGetCallbacks(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t *v5;

  pthread_mutex_lock(&gLock_2);
  v4 = 0;
  while (gBTLocalDeviceCallbackList[v4] != a1 || gBTLocalDeviceCallbackList[v4 + 5] != a2)
  {
    v4 += 7;
    if (v4 == 448)
    {
      v5 = 0;
      goto LABEL_7;
    }
  }
  v5 = &gBTLocalDeviceCallbackList[v4 + 1];
LABEL_7:
  pthread_mutex_unlock(&gLock_2);
  return v5;
}

uint64_t *_localBTLocalDeviceGetStatsCallbacks(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t *v5;

  pthread_mutex_lock(&gLock_2);
  v4 = 0;
  while (gBTLocalDevicePowerCallbackList[v4] != a1 || gBTLocalDevicePowerCallbackList[v4 + 3] != a2)
  {
    v4 += 5;
    if (v4 == 320)
    {
      v5 = 0;
      goto LABEL_7;
    }
  }
  v5 = &gBTLocalDevicePowerCallbackList[v4 + 1];
LABEL_7:
  pthread_mutex_unlock(&gLock_2);
  return v5;
}

uint64_t _localBTLocalDeviceGetUserData(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  pthread_mutex_lock(&gLock_2);
  v4 = 0;
  while (gBTLocalDeviceCallbackList[v4] != a1 || gBTLocalDeviceCallbackList[v4 + 5] != a2)
  {
    v4 += 7;
    if (v4 == 448)
      goto LABEL_5;
  }
  v6 = gBTLocalDeviceCallbackList[v4 + 6];
  if (v6)
    goto LABEL_13;
LABEL_5:
  v5 = 0;
  while (gBTLocalDevicePowerCallbackList[v5] != a1 || gBTLocalDevicePowerCallbackList[v5 + 3] != a2)
  {
    v5 += 5;
    if (v5 == 320)
    {
      v6 = 0;
      goto LABEL_13;
    }
  }
  v6 = gBTLocalDevicePowerCallbackList[v5 + 4];
LABEL_13:
  pthread_mutex_unlock(&gLock_2);
  return v6;
}

uint64_t BTLocalDeviceRemoveCallbacks(uint64_t a1, _QWORD *a2)
{
  uint64_t MBXpcConnection;
  uint64_t CallbacksCBID;
  uint64_t v6;
  xpc_object_t v7;
  uint64_t v8;
  _QWORD v10[5];
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  uint64_t v14;

  MBXpcConnection = getMBXpcConnection(a1);
  if (MBFLogInitOnce != -1)
    dispatch_once_f(&MBFLogInitOnce, 0, (dispatch_function_t)MBFLogInit);
  if (os_log_type_enabled((os_log_t)MBFLogComponent, OS_LOG_TYPE_DEBUG))
  {
    BTLocalDeviceRemoveCallbacks_cold_2();
    if (MBXpcConnection)
    {
LABEL_5:
      CallbacksCBID = _localBTLocalDeviceGetCallbacksCBID(a1, a2);
      v11 = 0;
      v12 = &v11;
      v13 = 0x2000000000;
      v14 = 3;
      if (CallbacksCBID)
      {
        v6 = CallbacksCBID;
        _localBTLocalDeviceRemoveCallbacks(a1, a2);
        removeXpcMsgHandler(MBXpcConnection, (uint64_t)&localDeviceXpcCallbacks);
        v7 = xpc_dictionary_create(0, 0, 0);
        xpc_dictionary_set_uint64(v7, "kCBMsgArgLocalDeviceID", a1);
        xpc_dictionary_set_uint64(v7, "kCBMsgArgID", v6);
        v10[0] = MEMORY[0x1E0C809B0];
        v10[1] = 0x40000000;
        v10[2] = __BTLocalDeviceRemoveCallbacks_block_invoke;
        v10[3] = &unk_1E6B06460;
        v10[4] = &v11;
        sendMessageWithReplySync(MBXpcConnection, "kCBMsgIdLocalDeviceRemoveCallbacksMsg", v7, (uint64_t)v10);
        if (v7)
          xpc_release(v7);
      }
      v8 = *((unsigned int *)v12 + 6);
      _Block_object_dispose(&v11, 8);
      return v8;
    }
  }
  else if (MBXpcConnection)
  {
    goto LABEL_5;
  }
  if (MBFLogInitOnce != -1)
    dispatch_once_f(&MBFLogInitOnce, 0, (dispatch_function_t)MBFLogInit);
  if (os_log_type_enabled((os_log_t)MBFLogComponent, OS_LOG_TYPE_ERROR))
    BTAccessoryManagerRemoveCallbacks_cold_1();
  return 1;
}

uint64_t BTLocalDeviceMaskCallbacks(uint64_t a1, unsigned int a2)
{
  uint64_t MBXpcConnection;
  uint64_t v5;
  xpc_object_t v6;
  uint64_t v7;
  _QWORD v9[5];
  uint64_t v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t v13;

  if (MBFLogInitOnce != -1)
    dispatch_once_f(&MBFLogInitOnce, 0, (dispatch_function_t)MBFLogInit);
  if (os_log_type_enabled((os_log_t)MBFLogComponent, OS_LOG_TYPE_DEBUG))
    BTLocalDeviceMaskCallbacks_cold_2();
  MBXpcConnection = getMBXpcConnection(a1);
  if (MBXpcConnection)
  {
    v5 = MBXpcConnection;
    v6 = xpc_dictionary_create(0, 0, 0);
    xpc_dictionary_set_uint64(v6, "kCBMsgArgLocalDeviceID", a1);
    xpc_dictionary_set_uint64(v6, "kCBMsgArgLocalDeviceEventMask", a2);
    v10 = 0;
    v11 = &v10;
    v12 = 0x2000000000;
    v13 = 0;
    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 0x40000000;
    v9[2] = __BTLocalDeviceMaskCallbacks_block_invoke;
    v9[3] = &unk_1E6B06488;
    v9[4] = &v10;
    sendMessageWithReplySync(v5, "kCBMsgIdLocalDeviceMaskCallbacks", v6, (uint64_t)v9);
    if (v6)
      xpc_release(v6);
    v7 = *((unsigned int *)v11 + 6);
    _Block_object_dispose(&v10, 8);
  }
  else
  {
    if (MBFLogInitOnce != -1)
      dispatch_once_f(&MBFLogInitOnce, 0, (dispatch_function_t)MBFLogInit);
    if (os_log_type_enabled((os_log_t)MBFLogComponent, OS_LOG_TYPE_ERROR))
      BTAccessoryManagerRemoveCallbacks_cold_1();
    return 1;
  }
  return v7;
}

uint64_t BTLocalDeviceSetModulePower(uint64_t a1, unsigned int a2, unsigned int a3)
{
  uint64_t MBXpcConnection;
  uint64_t v7;
  xpc_object_t v8;
  uint64_t v9;
  _QWORD v11[5];
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t v15;

  if (MBFLogInitOnce != -1)
    dispatch_once_f(&MBFLogInitOnce, 0, (dispatch_function_t)MBFLogInit);
  if (os_log_type_enabled((os_log_t)MBFLogComponent, OS_LOG_TYPE_DEBUG))
    BTLocalDeviceSetModulePower_cold_2();
  MBXpcConnection = getMBXpcConnection(a1);
  if (MBXpcConnection)
  {
    v7 = MBXpcConnection;
    v8 = xpc_dictionary_create(0, 0, 0);
    xpc_dictionary_set_uint64(v8, "kCBMsgArgLocalDeviceID", a1);
    xpc_dictionary_set_uint64(v8, "kCBMsgArgBTPowerModule", a2);
    xpc_dictionary_set_uint64(v8, "kCBMsgArgBTPowerMode", a3);
    v12 = 0;
    v13 = &v12;
    v14 = 0x2000000000;
    v15 = 0;
    v11[0] = MEMORY[0x1E0C809B0];
    v11[1] = 0x40000000;
    v11[2] = __BTLocalDeviceSetModulePower_block_invoke;
    v11[3] = &unk_1E6B064B0;
    v11[4] = &v12;
    sendMessageWithReplySync(v7, "kCBMsgIdLocalDeviceSetModulePowerMsg", v8, (uint64_t)v11);
    if (v8)
      xpc_release(v8);
    v9 = *((unsigned int *)v13 + 6);
    _Block_object_dispose(&v12, 8);
  }
  else
  {
    if (MBFLogInitOnce != -1)
      dispatch_once_f(&MBFLogInitOnce, 0, (dispatch_function_t)MBFLogInit);
    if (os_log_type_enabled((os_log_t)MBFLogComponent, OS_LOG_TYPE_ERROR))
      BTAccessoryManagerRemoveCallbacks_cold_1();
    return 1;
  }
  return v9;
}

uint64_t BTLocalDeviceGetSpatialPlatformSupport(uint64_t a1, _DWORD *a2)
{
  uint64_t MBXpcConnection;
  uint64_t v5;
  xpc_object_t v6;
  uint64_t v7;
  _QWORD v9[6];
  uint64_t v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t *v15;
  uint64_t v16;
  uint64_t v17;

  if (MBFLogInitOnce != -1)
    dispatch_once_f(&MBFLogInitOnce, 0, (dispatch_function_t)MBFLogInit);
  if (os_log_type_enabled((os_log_t)MBFLogComponent, OS_LOG_TYPE_DEBUG))
    BTLocalDeviceGetModulePower_cold_2();
  MBXpcConnection = getMBXpcConnection(a1);
  if (MBXpcConnection)
  {
    v5 = MBXpcConnection;
    v6 = xpc_dictionary_create(0, 0, 0);
    xpc_dictionary_set_uint64(v6, "kCBMsgArgLocalDeviceID", a1);
    v14 = 0;
    v15 = &v14;
    v16 = 0x2000000000;
    v17 = 0;
    v10 = 0;
    v11 = &v10;
    v12 = 0x2000000000;
    v13 = 0;
    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 0x40000000;
    v9[2] = __BTLocalDeviceGetSpatialPlatformSupport_block_invoke;
    v9[3] = &unk_1E6B06500;
    v9[4] = &v14;
    v9[5] = &v10;
    sendMessageWithReplySync(v5, "kCBMsgIdLocalDeviceGetSpatialPlatformSupportMsg", v6, (uint64_t)v9);
    if (v6)
      xpc_release(v6);
    *a2 = v11[3];
    v7 = *((unsigned int *)v15 + 6);
    _Block_object_dispose(&v10, 8);
    _Block_object_dispose(&v14, 8);
  }
  else
  {
    if (MBFLogInitOnce != -1)
      dispatch_once_f(&MBFLogInitOnce, 0, (dispatch_function_t)MBFLogInit);
    if (os_log_type_enabled((os_log_t)MBFLogComponent, OS_LOG_TYPE_ERROR))
      BTAccessoryManagerRemoveCallbacks_cold_1();
    return 1;
  }
  return v7;
}

uint64_t BTLocalDevicePowerReset(uint64_t a1)
{
  NSObject *v2;
  uint64_t MBXpcConnection;
  uint64_t v4;
  xpc_object_t v5;
  uint64_t v6;
  _QWORD v8[5];
  __int128 buf;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  if (MBFLogInitOnce != -1)
    dispatch_once_f(&MBFLogInitOnce, 0, (dispatch_function_t)MBFLogInit);
  v2 = MBFLogComponent;
  if (os_log_type_enabled((os_log_t)MBFLogComponent, OS_LOG_TYPE_DEBUG))
  {
    LODWORD(buf) = 134217984;
    *(_QWORD *)((char *)&buf + 4) = a1;
    _os_log_debug_impl(&dword_1B6BF1000, v2, OS_LOG_TYPE_DEBUG, "BTLocalDevicePowerReset over XPC localDevice:%llx", (uint8_t *)&buf, 0xCu);
  }
  MBXpcConnection = getMBXpcConnection(a1);
  if (MBXpcConnection)
  {
    v4 = MBXpcConnection;
    v5 = xpc_dictionary_create(0, 0, 0);
    xpc_dictionary_set_uint64(v5, "kCBMsgArgLocalDeviceID", a1);
    *(_QWORD *)&buf = 0;
    *((_QWORD *)&buf + 1) = &buf;
    v10 = 0x2000000000;
    v11 = 0;
    v8[0] = MEMORY[0x1E0C809B0];
    v8[1] = 0x40000000;
    v8[2] = __BTLocalDevicePowerReset_block_invoke;
    v8[3] = &unk_1E6B06528;
    v8[4] = &buf;
    sendMessageWithReplySync(v4, "kCBMsgIdLocalDevicePowerResetMsg", v5, (uint64_t)v8);
    if (v5)
      xpc_release(v5);
    v6 = *(unsigned int *)(*((_QWORD *)&buf + 1) + 24);
    _Block_object_dispose(&buf, 8);
  }
  else
  {
    if (MBFLogInitOnce != -1)
      dispatch_once_f(&MBFLogInitOnce, 0, (dispatch_function_t)MBFLogInit);
    if (os_log_type_enabled((os_log_t)MBFLogComponent, OS_LOG_TYPE_ERROR))
      BTAccessoryManagerRemoveCallbacks_cold_1();
    return 1;
  }
  return v6;
}

uint64_t BTLocalDeviceGetPower(uint64_t a1, _DWORD *a2)
{
  return BTLocalDeviceGetModulePower(a1, 1u, a2);
}

uint64_t BTLocalDeviceGetAddressString(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t MBXpcConnection;
  uint64_t v7;
  xpc_object_t v8;
  uint64_t v9;
  _QWORD v11[7];
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t v15;

  if (MBFLogInitOnce != -1)
    dispatch_once_f(&MBFLogInitOnce, 0, (dispatch_function_t)MBFLogInit);
  if (os_log_type_enabled((os_log_t)MBFLogComponent, OS_LOG_TYPE_DEBUG))
    BTLocalDeviceGetAddressString_cold_2();
  MBXpcConnection = getMBXpcConnection(a1);
  if (MBXpcConnection)
  {
    v7 = MBXpcConnection;
    v8 = xpc_dictionary_create(0, 0, 0);
    xpc_dictionary_set_uint64(v8, "kCBMsgArgLocalDeviceID", a1);
    xpc_dictionary_set_uint64(v8, "kCBMsgArgBufferSize", a3);
    v12 = 0;
    v13 = &v12;
    v14 = 0x2000000000;
    v15 = 0;
    v11[0] = MEMORY[0x1E0C809B0];
    v11[1] = 0x40000000;
    v11[2] = __BTLocalDeviceGetAddressString_block_invoke;
    v11[3] = &unk_1E6B06578;
    v11[4] = &v12;
    v11[5] = a2;
    v11[6] = a3;
    sendMessageWithReplySync(v7, "kCBMsgIdLocalDeviceGetAddressStringMsg", v8, (uint64_t)v11);
    if (v8)
      xpc_release(v8);
    v9 = *((unsigned int *)v13 + 6);
    _Block_object_dispose(&v12, 8);
  }
  else
  {
    if (MBFLogInitOnce != -1)
      dispatch_once_f(&MBFLogInitOnce, 0, (dispatch_function_t)MBFLogInit);
    if (os_log_type_enabled((os_log_t)MBFLogComponent, OS_LOG_TYPE_ERROR))
      BTAccessoryManagerRemoveCallbacks_cold_1();
    return 1;
  }
  return v9;
}

uint64_t BTLocalDeviceGetName(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t MBXpcConnection;
  uint64_t v7;
  xpc_object_t v8;
  uint64_t v9;
  _QWORD v11[7];
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t v15;

  if (MBFLogInitOnce != -1)
    dispatch_once_f(&MBFLogInitOnce, 0, (dispatch_function_t)MBFLogInit);
  if (os_log_type_enabled((os_log_t)MBFLogComponent, OS_LOG_TYPE_DEBUG))
    BTLocalDeviceGetName_cold_2();
  MBXpcConnection = getMBXpcConnection(a1);
  if (MBXpcConnection)
  {
    v7 = MBXpcConnection;
    v8 = xpc_dictionary_create(0, 0, 0);
    xpc_dictionary_set_uint64(v8, "kCBMsgArgLocalDeviceID", a1);
    xpc_dictionary_set_uint64(v8, "kCBMsgArgBufferSize", a3);
    v12 = 0;
    v13 = &v12;
    v14 = 0x2000000000;
    v15 = 0;
    v11[0] = MEMORY[0x1E0C809B0];
    v11[1] = 0x40000000;
    v11[2] = __BTLocalDeviceGetName_block_invoke;
    v11[3] = &unk_1E6B065A0;
    v11[4] = &v12;
    v11[5] = a2;
    v11[6] = a3;
    sendMessageWithReplySync(v7, "kCBMsgIdLocalDeviceGetNameMsg", v8, (uint64_t)v11);
    if (v8)
      xpc_release(v8);
    v9 = *((unsigned int *)v13 + 6);
    _Block_object_dispose(&v12, 8);
  }
  else
  {
    if (MBFLogInitOnce != -1)
      dispatch_once_f(&MBFLogInitOnce, 0, (dispatch_function_t)MBFLogInit);
    if (os_log_type_enabled((os_log_t)MBFLogComponent, OS_LOG_TYPE_ERROR))
      BTAccessoryManagerRemoveCallbacks_cold_1();
    return 1;
  }
  return v9;
}

uint64_t BTLocalDeviceSetDiscoverable(uint64_t a1, unsigned int a2)
{
  NSObject *v4;
  uint64_t MBXpcConnection;
  uint64_t v6;
  xpc_object_t v7;
  uint64_t v8;
  _QWORD v10[5];
  _BYTE buf[24];
  uint64_t v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  if (MBFLogInitOnce != -1)
    dispatch_once_f(&MBFLogInitOnce, 0, (dispatch_function_t)MBFLogInit);
  v4 = MBFLogComponent;
  if (os_log_type_enabled((os_log_t)MBFLogComponent, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 134218240;
    *(_QWORD *)&buf[4] = a1;
    *(_WORD *)&buf[12] = 1024;
    *(_DWORD *)&buf[14] = (unsigned __int16)a2;
    _os_log_debug_impl(&dword_1B6BF1000, v4, OS_LOG_TYPE_DEBUG, "BTLocalDeviceSetDiscoverable over XPC localDevice:%llx discoverable:%d", buf, 0x12u);
  }
  MBXpcConnection = getMBXpcConnection(a1);
  if (MBXpcConnection)
  {
    v6 = MBXpcConnection;
    v7 = xpc_dictionary_create(0, 0, 0);
    xpc_dictionary_set_uint64(v7, "kCBMsgArgLocalDeviceID", a1);
    xpc_dictionary_set_uint64(v7, "kCBMsgArgDiscoverable", a2);
    *(_QWORD *)buf = 0;
    *(_QWORD *)&buf[8] = buf;
    *(_QWORD *)&buf[16] = 0x2000000000;
    v12 = 0;
    v10[0] = MEMORY[0x1E0C809B0];
    v10[1] = 0x40000000;
    v10[2] = __BTLocalDeviceSetDiscoverable_block_invoke;
    v10[3] = &unk_1E6B065C8;
    v10[4] = buf;
    sendMessageWithReplySync(v6, "kCBMsgIdLocalDeviceSetDiscoverableMsg", v7, (uint64_t)v10);
    if (v7)
      xpc_release(v7);
    v8 = *(unsigned int *)(*(_QWORD *)&buf[8] + 24);
    _Block_object_dispose(buf, 8);
  }
  else
  {
    if (MBFLogInitOnce != -1)
      dispatch_once_f(&MBFLogInitOnce, 0, (dispatch_function_t)MBFLogInit);
    if (os_log_type_enabled((os_log_t)MBFLogComponent, OS_LOG_TYPE_ERROR))
      BTAccessoryManagerRemoveCallbacks_cold_1();
    return 1;
  }
  return v8;
}

uint64_t BTLocalDeviceGetDiscoverable(uint64_t a1, _DWORD *a2)
{
  NSObject *v4;
  uint64_t MBXpcConnection;
  uint64_t v6;
  xpc_object_t v7;
  uint64_t v8;
  _QWORD v10[6];
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  uint64_t v14;
  __int128 buf;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  if (MBFLogInitOnce != -1)
    dispatch_once_f(&MBFLogInitOnce, 0, (dispatch_function_t)MBFLogInit);
  v4 = MBFLogComponent;
  if (os_log_type_enabled((os_log_t)MBFLogComponent, OS_LOG_TYPE_DEBUG))
  {
    LODWORD(buf) = 134217984;
    *(_QWORD *)((char *)&buf + 4) = a1;
    _os_log_debug_impl(&dword_1B6BF1000, v4, OS_LOG_TYPE_DEBUG, "BTLocalDeviceGetDiscoverable over XPC localDevice:%llx", (uint8_t *)&buf, 0xCu);
  }
  MBXpcConnection = getMBXpcConnection(a1);
  if (MBXpcConnection)
  {
    v6 = MBXpcConnection;
    v7 = xpc_dictionary_create(0, 0, 0);
    xpc_dictionary_set_uint64(v7, "kCBMsgArgLocalDeviceID", a1);
    *(_QWORD *)&buf = 0;
    *((_QWORD *)&buf + 1) = &buf;
    v16 = 0x2000000000;
    v17 = 0;
    v11 = 0;
    v12 = &v11;
    v13 = 0x2000000000;
    v14 = 0;
    v10[0] = MEMORY[0x1E0C809B0];
    v10[1] = 0x40000000;
    v10[2] = __BTLocalDeviceGetDiscoverable_block_invoke;
    v10[3] = &unk_1E6B065F0;
    v10[4] = &buf;
    v10[5] = &v11;
    sendMessageWithReplySync(v6, "kCBMsgIdLocalDeviceGetDiscoverableMsg", v7, (uint64_t)v10);
    if (v7)
      xpc_release(v7);
    *a2 = v12[3];
    v8 = *(unsigned int *)(*((_QWORD *)&buf + 1) + 24);
    _Block_object_dispose(&v11, 8);
    _Block_object_dispose(&buf, 8);
  }
  else
  {
    if (MBFLogInitOnce != -1)
      dispatch_once_f(&MBFLogInitOnce, 0, (dispatch_function_t)MBFLogInit);
    if (os_log_type_enabled((os_log_t)MBFLogComponent, OS_LOG_TYPE_ERROR))
      BTAccessoryManagerRemoveCallbacks_cold_1();
    return 1;
  }
  return v8;
}

uint64_t BTLocalDeviceSetConnectable(uint64_t a1, unsigned int a2)
{
  NSObject *v4;
  uint64_t MBXpcConnection;
  uint64_t v6;
  xpc_object_t v7;
  uint64_t v8;
  _QWORD v10[5];
  _BYTE buf[24];
  uint64_t v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  if (MBFLogInitOnce != -1)
    dispatch_once_f(&MBFLogInitOnce, 0, (dispatch_function_t)MBFLogInit);
  v4 = MBFLogComponent;
  if (os_log_type_enabled((os_log_t)MBFLogComponent, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 134218240;
    *(_QWORD *)&buf[4] = a1;
    *(_WORD *)&buf[12] = 1024;
    *(_DWORD *)&buf[14] = (unsigned __int16)a2;
    _os_log_debug_impl(&dword_1B6BF1000, v4, OS_LOG_TYPE_DEBUG, "BTLocalDeviceSetConnectable over XPC localDevice:%llx connectable:%d", buf, 0x12u);
  }
  MBXpcConnection = getMBXpcConnection(a1);
  if (MBXpcConnection)
  {
    v6 = MBXpcConnection;
    v7 = xpc_dictionary_create(0, 0, 0);
    xpc_dictionary_set_uint64(v7, "kCBMsgArgLocalDeviceID", a1);
    xpc_dictionary_set_uint64(v7, "kCBMsgArgConnectable", a2);
    *(_QWORD *)buf = 0;
    *(_QWORD *)&buf[8] = buf;
    *(_QWORD *)&buf[16] = 0x2000000000;
    v12 = 0;
    v10[0] = MEMORY[0x1E0C809B0];
    v10[1] = 0x40000000;
    v10[2] = __BTLocalDeviceSetConnectable_block_invoke;
    v10[3] = &unk_1E6B06618;
    v10[4] = buf;
    sendMessageWithReplySync(v6, "kCBMsgIdLocalDeviceSetConnectableMsg", v7, (uint64_t)v10);
    if (v7)
      xpc_release(v7);
    v8 = *(unsigned int *)(*(_QWORD *)&buf[8] + 24);
    _Block_object_dispose(buf, 8);
  }
  else
  {
    if (MBFLogInitOnce != -1)
      dispatch_once_f(&MBFLogInitOnce, 0, (dispatch_function_t)MBFLogInit);
    if (os_log_type_enabled((os_log_t)MBFLogComponent, OS_LOG_TYPE_ERROR))
      BTAccessoryManagerRemoveCallbacks_cold_1();
    return 1;
  }
  return v8;
}

uint64_t BTLocalDeviceGetConnectable(uint64_t a1, _DWORD *a2)
{
  NSObject *v4;
  uint64_t MBXpcConnection;
  uint64_t v6;
  xpc_object_t v7;
  uint64_t v8;
  _QWORD v10[6];
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  uint64_t v14;
  __int128 buf;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  if (MBFLogInitOnce != -1)
    dispatch_once_f(&MBFLogInitOnce, 0, (dispatch_function_t)MBFLogInit);
  v4 = MBFLogComponent;
  if (os_log_type_enabled((os_log_t)MBFLogComponent, OS_LOG_TYPE_DEBUG))
  {
    LODWORD(buf) = 134217984;
    *(_QWORD *)((char *)&buf + 4) = a1;
    _os_log_debug_impl(&dword_1B6BF1000, v4, OS_LOG_TYPE_DEBUG, "BTLocalDeviceGetConnectable over XPC localDevice:%llx", (uint8_t *)&buf, 0xCu);
  }
  MBXpcConnection = getMBXpcConnection(a1);
  if (MBXpcConnection)
  {
    v6 = MBXpcConnection;
    v7 = xpc_dictionary_create(0, 0, 0);
    xpc_dictionary_set_uint64(v7, "kCBMsgArgLocalDeviceID", a1);
    *(_QWORD *)&buf = 0;
    *((_QWORD *)&buf + 1) = &buf;
    v16 = 0x2000000000;
    v17 = 0;
    v11 = 0;
    v12 = &v11;
    v13 = 0x2000000000;
    v14 = 0;
    v10[0] = MEMORY[0x1E0C809B0];
    v10[1] = 0x40000000;
    v10[2] = __BTLocalDeviceGetConnectable_block_invoke;
    v10[3] = &unk_1E6B06640;
    v10[4] = &buf;
    v10[5] = &v11;
    sendMessageWithReplySync(v6, "kCBMsgIdLocalDeviceGetConnectableMsg", v7, (uint64_t)v10);
    if (v7)
      xpc_release(v7);
    *a2 = v12[3];
    v8 = *(unsigned int *)(*((_QWORD *)&buf + 1) + 24);
    _Block_object_dispose(&v11, 8);
    _Block_object_dispose(&buf, 8);
  }
  else
  {
    if (MBFLogInitOnce != -1)
      dispatch_once_f(&MBFLogInitOnce, 0, (dispatch_function_t)MBFLogInit);
    if (os_log_type_enabled((os_log_t)MBFLogComponent, OS_LOG_TYPE_ERROR))
      BTAccessoryManagerRemoveCallbacks_cold_1();
    return 1;
  }
  return v8;
}

uint64_t BTLocalDeviceGetPairingStatus(uint64_t a1, _DWORD *a2)
{
  NSObject *v4;
  uint64_t MBXpcConnection;
  uint64_t v6;
  xpc_object_t v7;
  uint64_t v8;
  _QWORD v10[6];
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  uint64_t v14;
  __int128 buf;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  if (MBFLogInitOnce != -1)
    dispatch_once_f(&MBFLogInitOnce, 0, (dispatch_function_t)MBFLogInit);
  v4 = MBFLogComponent;
  if (os_log_type_enabled((os_log_t)MBFLogComponent, OS_LOG_TYPE_DEBUG))
  {
    LODWORD(buf) = 134217984;
    *(_QWORD *)((char *)&buf + 4) = a1;
    _os_log_debug_impl(&dword_1B6BF1000, v4, OS_LOG_TYPE_DEBUG, "BTLocalDeviceGetPairingStatus over XPC localDevice:%llx", (uint8_t *)&buf, 0xCu);
  }
  MBXpcConnection = getMBXpcConnection(a1);
  if (MBXpcConnection)
  {
    v6 = MBXpcConnection;
    v7 = xpc_dictionary_create(0, 0, 0);
    xpc_dictionary_set_uint64(v7, "kCBMsgArgLocalDeviceID", a1);
    *(_QWORD *)&buf = 0;
    *((_QWORD *)&buf + 1) = &buf;
    v16 = 0x2000000000;
    v17 = 0;
    v11 = 0;
    v12 = &v11;
    v13 = 0x2000000000;
    v14 = 0;
    v10[0] = MEMORY[0x1E0C809B0];
    v10[1] = 0x40000000;
    v10[2] = __BTLocalDeviceGetPairingStatus_block_invoke;
    v10[3] = &unk_1E6B06668;
    v10[4] = &buf;
    v10[5] = &v11;
    sendMessageWithReplySync(v6, "kCBMsgIdLocalDeviceGetPairingStatusMsg", v7, (uint64_t)v10);
    if (v7)
      xpc_release(v7);
    *a2 = v12[3];
    v8 = *(unsigned int *)(*((_QWORD *)&buf + 1) + 24);
    _Block_object_dispose(&v11, 8);
    _Block_object_dispose(&buf, 8);
  }
  else
  {
    if (MBFLogInitOnce != -1)
      dispatch_once_f(&MBFLogInitOnce, 0, (dispatch_function_t)MBFLogInit);
    if (os_log_type_enabled((os_log_t)MBFLogComponent, OS_LOG_TYPE_ERROR))
      BTAccessoryManagerRemoveCallbacks_cold_1();
    return 1;
  }
  return v8;
}

uint64_t BTLocalDeviceGetConnectionStatus(uint64_t a1, _DWORD *a2)
{
  NSObject *v4;
  uint64_t MBXpcConnection;
  uint64_t v6;
  xpc_object_t v7;
  uint64_t v8;
  _QWORD v10[6];
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  uint64_t v14;
  __int128 buf;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  if (MBFLogInitOnce != -1)
    dispatch_once_f(&MBFLogInitOnce, 0, (dispatch_function_t)MBFLogInit);
  v4 = MBFLogComponent;
  if (os_log_type_enabled((os_log_t)MBFLogComponent, OS_LOG_TYPE_DEBUG))
  {
    LODWORD(buf) = 134217984;
    *(_QWORD *)((char *)&buf + 4) = a1;
    _os_log_debug_impl(&dword_1B6BF1000, v4, OS_LOG_TYPE_DEBUG, "BTLocalDeviceGetConnectionStatus localDevice:%llx", (uint8_t *)&buf, 0xCu);
  }
  MBXpcConnection = getMBXpcConnection(a1);
  if (MBXpcConnection)
  {
    v6 = MBXpcConnection;
    v7 = xpc_dictionary_create(0, 0, 0);
    xpc_dictionary_set_uint64(v7, "kCBMsgArgLocalDeviceID", a1);
    *(_QWORD *)&buf = 0;
    *((_QWORD *)&buf + 1) = &buf;
    v16 = 0x2000000000;
    v17 = 0;
    v11 = 0;
    v12 = &v11;
    v13 = 0x2000000000;
    v14 = 0;
    v10[0] = MEMORY[0x1E0C809B0];
    v10[1] = 0x40000000;
    v10[2] = __BTLocalDeviceGetConnectionStatus_block_invoke;
    v10[3] = &unk_1E6B066B8;
    v10[4] = &buf;
    v10[5] = &v11;
    sendMessageWithReplySync(v6, "kCBMsgIdLocalDeviceGetConnectionStatusMsg", v7, (uint64_t)v10);
    if (v7)
      xpc_release(v7);
    *a2 = v12[3];
    v8 = *(unsigned int *)(*((_QWORD *)&buf + 1) + 24);
    _Block_object_dispose(&v11, 8);
    _Block_object_dispose(&buf, 8);
  }
  else
  {
    if (MBFLogInitOnce != -1)
      dispatch_once_f(&MBFLogInitOnce, 0, (dispatch_function_t)MBFLogInit);
    if (os_log_type_enabled((os_log_t)MBFLogComponent, OS_LOG_TYPE_ERROR))
      BTAccessoryManagerRemoveCallbacks_cold_1();
    return 1;
  }
  return v8;
}

uint64_t BTLocalDeviceGetConnectedDevices(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t MBXpcConnection;
  uint64_t v9;
  xpc_object_t v10;
  uint64_t v11;
  _QWORD v13[8];
  uint64_t v14;
  uint64_t *v15;
  uint64_t v16;
  uint64_t v17;

  if (MBFLogInitOnce != -1)
    dispatch_once_f(&MBFLogInitOnce, 0, (dispatch_function_t)MBFLogInit);
  if (os_log_type_enabled((os_log_t)MBFLogComponent, OS_LOG_TYPE_DEBUG))
    BTLocalDeviceGetConnectedDevices_cold_2();
  MBXpcConnection = getMBXpcConnection(a1);
  if (MBXpcConnection)
  {
    v9 = MBXpcConnection;
    v10 = xpc_dictionary_create(0, 0, 0);
    xpc_dictionary_set_uint64(v10, "kCBMsgArgLocalDeviceID", a1);
    xpc_dictionary_set_uint64(v10, "kCbMsgArgDeviceArrayMaxSize", a4);
    v14 = 0;
    v15 = &v14;
    v16 = 0x2000000000;
    v17 = 0;
    v13[0] = MEMORY[0x1E0C809B0];
    v13[1] = 0x40000000;
    v13[2] = __BTLocalDeviceGetConnectedDevices_block_invoke;
    v13[3] = &unk_1E6B066E0;
    v13[4] = &v14;
    v13[5] = a4;
    v13[6] = a2;
    v13[7] = a3;
    sendMessageWithReplySync(v9, "kCBMsgIdLocalDeviceGetConnectedDevicesMsg", v10, (uint64_t)v13);
    if (v10)
      xpc_release(v10);
    v11 = *((unsigned int *)v15 + 6);
    _Block_object_dispose(&v14, 8);
  }
  else
  {
    if (MBFLogInitOnce != -1)
      dispatch_once_f(&MBFLogInitOnce, 0, (dispatch_function_t)MBFLogInit);
    if (os_log_type_enabled((os_log_t)MBFLogComponent, OS_LOG_TYPE_ERROR))
      BTAccessoryManagerGetDevices_cold_1();
    return 1;
  }
  return v11;
}

uint64_t BTLocalDeviceGetConnectingDevices(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t MBXpcConnection;
  uint64_t v9;
  xpc_object_t v10;
  uint64_t v11;
  _QWORD v13[8];
  uint64_t v14;
  uint64_t *v15;
  uint64_t v16;
  uint64_t v17;

  if (MBFLogInitOnce != -1)
    dispatch_once_f(&MBFLogInitOnce, 0, (dispatch_function_t)MBFLogInit);
  if (os_log_type_enabled((os_log_t)MBFLogComponent, OS_LOG_TYPE_DEBUG))
    BTLocalDeviceGetConnectingDevices_cold_2();
  MBXpcConnection = getMBXpcConnection(a1);
  if (MBXpcConnection)
  {
    v9 = MBXpcConnection;
    v10 = xpc_dictionary_create(0, 0, 0);
    xpc_dictionary_set_uint64(v10, "kCBMsgArgLocalDeviceID", a1);
    xpc_dictionary_set_uint64(v10, "kCbMsgArgDeviceArrayMaxSize", a4);
    v14 = 0;
    v15 = &v14;
    v16 = 0x2000000000;
    v17 = 0;
    v13[0] = MEMORY[0x1E0C809B0];
    v13[1] = 0x40000000;
    v13[2] = __BTLocalDeviceGetConnectingDevices_block_invoke;
    v13[3] = &unk_1E6B06708;
    v13[4] = &v14;
    v13[5] = a4;
    v13[6] = a2;
    v13[7] = a3;
    sendMessageWithReplySync(v9, "kCBMsgIdLocalDeviceGetConnectingDevicesMsg", v10, (uint64_t)v13);
    if (v10)
      xpc_release(v10);
    v11 = *((unsigned int *)v15 + 6);
    _Block_object_dispose(&v14, 8);
  }
  else
  {
    if (MBFLogInitOnce != -1)
      dispatch_once_f(&MBFLogInitOnce, 0, (dispatch_function_t)MBFLogInit);
    if (os_log_type_enabled((os_log_t)MBFLogComponent, OS_LOG_TYPE_ERROR))
      BTAccessoryManagerGetDevices_cold_1();
    return 1;
  }
  return v11;
}

uint64_t BTLocalDeviceGetAdvertisingStatus(uint64_t a1, _DWORD *a2)
{
  NSObject *v4;
  uint64_t MBXpcConnection;
  uint64_t v6;
  xpc_object_t v7;
  uint64_t v8;
  _QWORD v10[6];
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  uint64_t v14;
  __int128 buf;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  if (MBFLogInitOnce != -1)
    dispatch_once_f(&MBFLogInitOnce, 0, (dispatch_function_t)MBFLogInit);
  v4 = MBFLogComponent;
  if (os_log_type_enabled((os_log_t)MBFLogComponent, OS_LOG_TYPE_DEBUG))
  {
    LODWORD(buf) = 134217984;
    *(_QWORD *)((char *)&buf + 4) = a1;
    _os_log_debug_impl(&dword_1B6BF1000, v4, OS_LOG_TYPE_DEBUG, "BTLocalDeviceGetAdvertisingStatus over XPC localDevice:%llx", (uint8_t *)&buf, 0xCu);
  }
  MBXpcConnection = getMBXpcConnection(a1);
  if (MBXpcConnection)
  {
    v6 = MBXpcConnection;
    v7 = xpc_dictionary_create(0, 0, 0);
    xpc_dictionary_set_uint64(v7, "kCBMsgArgLocalDeviceID", a1);
    *(_QWORD *)&buf = 0;
    *((_QWORD *)&buf + 1) = &buf;
    v16 = 0x2000000000;
    v17 = 0;
    v11 = 0;
    v12 = &v11;
    v13 = 0x2000000000;
    v14 = 0;
    v10[0] = MEMORY[0x1E0C809B0];
    v10[1] = 0x40000000;
    v10[2] = __BTLocalDeviceGetAdvertisingStatus_block_invoke;
    v10[3] = &unk_1E6B06730;
    v10[4] = &buf;
    v10[5] = &v11;
    sendMessageWithReplySync(v6, "kCBMsgIdLocalDeviceGetAdvertisingStatusMsg", v7, (uint64_t)v10);
    if (v7)
      xpc_release(v7);
    *a2 = v12[3];
    v8 = *(unsigned int *)(*((_QWORD *)&buf + 1) + 24);
    _Block_object_dispose(&v11, 8);
    _Block_object_dispose(&buf, 8);
  }
  else
  {
    if (MBFLogInitOnce != -1)
      dispatch_once_f(&MBFLogInitOnce, 0, (dispatch_function_t)MBFLogInit);
    if (os_log_type_enabled((os_log_t)MBFLogComponent, OS_LOG_TYPE_ERROR))
      BTAccessoryManagerRemoveCallbacks_cold_1();
    return 1;
  }
  return v8;
}

uint64_t BTLocalDeviceEnableDUTMode(uint64_t a1)
{
  NSObject *v2;
  uint64_t MBXpcConnection;
  uint64_t v4;
  xpc_object_t v5;
  uint64_t v6;
  _QWORD v8[5];
  __int128 buf;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  if (MBFLogInitOnce != -1)
    dispatch_once_f(&MBFLogInitOnce, 0, (dispatch_function_t)MBFLogInit);
  v2 = MBFLogComponent;
  if (os_log_type_enabled((os_log_t)MBFLogComponent, OS_LOG_TYPE_DEBUG))
  {
    LODWORD(buf) = 134217984;
    *(_QWORD *)((char *)&buf + 4) = a1;
    _os_log_debug_impl(&dword_1B6BF1000, v2, OS_LOG_TYPE_DEBUG, "BTLocalDeviceEnableDUTMode over XPC localDevice:%llx", (uint8_t *)&buf, 0xCu);
  }
  MBXpcConnection = getMBXpcConnection(a1);
  if (MBXpcConnection)
  {
    v4 = MBXpcConnection;
    v5 = xpc_dictionary_create(0, 0, 0);
    xpc_dictionary_set_uint64(v5, "kCBMsgArgLocalDeviceID", a1);
    *(_QWORD *)&buf = 0;
    *((_QWORD *)&buf + 1) = &buf;
    v10 = 0x2000000000;
    v11 = 0;
    v8[0] = MEMORY[0x1E0C809B0];
    v8[1] = 0x40000000;
    v8[2] = __BTLocalDeviceEnableDUTMode_block_invoke;
    v8[3] = &unk_1E6B06758;
    v8[4] = &buf;
    sendMessageWithReplySync(v4, "kCBMsgIdLocalDeviceEnableDUTModeMsg", v5, (uint64_t)v8);
    if (v5)
      xpc_release(v5);
    v6 = *(unsigned int *)(*((_QWORD *)&buf + 1) + 24);
    _Block_object_dispose(&buf, 8);
  }
  else
  {
    if (MBFLogInitOnce != -1)
      dispatch_once_f(&MBFLogInitOnce, 0, (dispatch_function_t)MBFLogInit);
    if (os_log_type_enabled((os_log_t)MBFLogComponent, OS_LOG_TYPE_ERROR))
      BTAccessoryManagerRemoveCallbacks_cold_1();
    return 1;
  }
  return v6;
}

uint64_t BTLocalDeviceGetScanning(uint64_t a1, _DWORD *a2)
{
  NSObject *v4;
  uint64_t MBXpcConnection;
  uint64_t v6;
  xpc_object_t v7;
  uint64_t v8;
  _QWORD v10[6];
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  uint64_t v14;
  __int128 buf;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  if (MBFLogInitOnce != -1)
    dispatch_once_f(&MBFLogInitOnce, 0, (dispatch_function_t)MBFLogInit);
  v4 = MBFLogComponent;
  if (os_log_type_enabled((os_log_t)MBFLogComponent, OS_LOG_TYPE_DEBUG))
  {
    LODWORD(buf) = 134217984;
    *(_QWORD *)((char *)&buf + 4) = a1;
    _os_log_debug_impl(&dword_1B6BF1000, v4, OS_LOG_TYPE_DEBUG, "BTLocalDeviceGetScanning over XPC localDevice:%llx", (uint8_t *)&buf, 0xCu);
  }
  MBXpcConnection = getMBXpcConnection(a1);
  if (MBXpcConnection)
  {
    v6 = MBXpcConnection;
    v7 = xpc_dictionary_create(0, 0, 0);
    xpc_dictionary_set_uint64(v7, "kCBMsgArgLocalDeviceID", a1);
    *(_QWORD *)&buf = 0;
    *((_QWORD *)&buf + 1) = &buf;
    v16 = 0x2000000000;
    v17 = 0;
    v11 = 0;
    v12 = &v11;
    v13 = 0x2000000000;
    v14 = 0;
    v10[0] = MEMORY[0x1E0C809B0];
    v10[1] = 0x40000000;
    v10[2] = __BTLocalDeviceGetScanning_block_invoke;
    v10[3] = &unk_1E6B06780;
    v10[4] = &buf;
    v10[5] = &v11;
    sendMessageWithReplySync(v6, "kCBMsgIdLocalDeviceGetScanningMsg", v7, (uint64_t)v10);
    if (v7)
      xpc_release(v7);
    *a2 = v12[3];
    v8 = *(unsigned int *)(*((_QWORD *)&buf + 1) + 24);
    _Block_object_dispose(&v11, 8);
    _Block_object_dispose(&buf, 8);
  }
  else
  {
    if (MBFLogInitOnce != -1)
      dispatch_once_f(&MBFLogInitOnce, 0, (dispatch_function_t)MBFLogInit);
    if (os_log_type_enabled((os_log_t)MBFLogComponent, OS_LOG_TYPE_ERROR))
      BTAccessoryManagerRemoveCallbacks_cold_1();
    return 1;
  }
  return v8;
}

uint64_t BTLocalDeviceGetDUTModeEnabled(uint64_t a1, _DWORD *a2)
{
  NSObject *v4;
  uint64_t MBXpcConnection;
  uint64_t v6;
  xpc_object_t v7;
  uint64_t v8;
  _QWORD v10[6];
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  uint64_t v14;
  __int128 buf;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  if (MBFLogInitOnce != -1)
    dispatch_once_f(&MBFLogInitOnce, 0, (dispatch_function_t)MBFLogInit);
  v4 = MBFLogComponent;
  if (os_log_type_enabled((os_log_t)MBFLogComponent, OS_LOG_TYPE_DEBUG))
  {
    LODWORD(buf) = 134217984;
    *(_QWORD *)((char *)&buf + 4) = a1;
    _os_log_debug_impl(&dword_1B6BF1000, v4, OS_LOG_TYPE_DEBUG, "BTLocalDeviceGetDUTModeEnabled over XPC localDevice:%llx", (uint8_t *)&buf, 0xCu);
  }
  MBXpcConnection = getMBXpcConnection(a1);
  if (MBXpcConnection)
  {
    v6 = MBXpcConnection;
    v7 = xpc_dictionary_create(0, 0, 0);
    xpc_dictionary_set_uint64(v7, "kCBMsgArgLocalDeviceID", a1);
    *(_QWORD *)&buf = 0;
    *((_QWORD *)&buf + 1) = &buf;
    v16 = 0x2000000000;
    v17 = 0;
    v11 = 0;
    v12 = &v11;
    v13 = 0x2000000000;
    v14 = 0;
    v10[0] = MEMORY[0x1E0C809B0];
    v10[1] = 0x40000000;
    v10[2] = __BTLocalDeviceGetDUTModeEnabled_block_invoke;
    v10[3] = &unk_1E6B067A8;
    v10[4] = &buf;
    v10[5] = &v11;
    sendMessageWithReplySync(v6, "kCBMsgIdLocalDeviceGetDUTModeEnabledMsg", v7, (uint64_t)v10);
    if (v7)
      xpc_release(v7);
    *a2 = v12[3];
    v8 = *(unsigned int *)(*((_QWORD *)&buf + 1) + 24);
    _Block_object_dispose(&v11, 8);
    _Block_object_dispose(&buf, 8);
  }
  else
  {
    if (MBFLogInitOnce != -1)
      dispatch_once_f(&MBFLogInitOnce, 0, (dispatch_function_t)MBFLogInit);
    if (os_log_type_enabled((os_log_t)MBFLogComponent, OS_LOG_TYPE_ERROR))
      BTAccessoryManagerRemoveCallbacks_cold_1();
    return 1;
  }
  return v8;
}

uint64_t BTLocalDeviceEnableLeTxTestMode(uint64_t a1, unsigned int a2, unsigned int a3, unsigned int a4)
{
  NSObject *v8;
  uint64_t MBXpcConnection;
  uint64_t v10;
  xpc_object_t v11;
  uint64_t v12;
  _QWORD v14[5];
  _BYTE buf[24];
  uint64_t v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  if (MBFLogInitOnce != -1)
    dispatch_once_f(&MBFLogInitOnce, 0, (dispatch_function_t)MBFLogInit);
  v8 = MBFLogComponent;
  if (os_log_type_enabled((os_log_t)MBFLogComponent, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 134218752;
    *(_QWORD *)&buf[4] = a1;
    *(_WORD *)&buf[12] = 1024;
    *(_DWORD *)&buf[14] = a2;
    *(_WORD *)&buf[18] = 1024;
    *(_DWORD *)&buf[20] = a3;
    LOWORD(v16) = 1024;
    *(_DWORD *)((char *)&v16 + 2) = a4;
    _os_log_debug_impl(&dword_1B6BF1000, v8, OS_LOG_TYPE_DEBUG, "BTLocalDeviceEnableLeTxTestMode over XPC localDevice:%llx testFrequency:%d payloadSize:%d payload:%d", buf, 0x1Eu);
  }
  MBXpcConnection = getMBXpcConnection(a1);
  if (MBXpcConnection)
  {
    v10 = MBXpcConnection;
    v11 = xpc_dictionary_create(0, 0, 0);
    xpc_dictionary_set_uint64(v11, "kCBMsgArgLocalDeviceID", a1);
    xpc_dictionary_set_uint64(v11, "kCBMsgArgTestFrequency", a2);
    xpc_dictionary_set_uint64(v11, "kCBMsgArgPayloadSize", a3);
    xpc_dictionary_set_uint64(v11, "kCBMsgArgPayload", a4);
    *(_QWORD *)buf = 0;
    *(_QWORD *)&buf[8] = buf;
    *(_QWORD *)&buf[16] = 0x2000000000;
    v16 = 0;
    v14[0] = MEMORY[0x1E0C809B0];
    v14[1] = 0x40000000;
    v14[2] = __BTLocalDeviceEnableLeTxTestMode_block_invoke;
    v14[3] = &unk_1E6B067D0;
    v14[4] = buf;
    sendMessageWithReplySync(v10, "kCBMsgIdLocalDeviceEnableLeTxTestModeMsg", v11, (uint64_t)v14);
    if (v11)
      xpc_release(v11);
    v12 = *(unsigned int *)(*(_QWORD *)&buf[8] + 24);
    _Block_object_dispose(buf, 8);
  }
  else
  {
    if (MBFLogInitOnce != -1)
      dispatch_once_f(&MBFLogInitOnce, 0, (dispatch_function_t)MBFLogInit);
    if (os_log_type_enabled((os_log_t)MBFLogComponent, OS_LOG_TYPE_ERROR))
      BTAccessoryManagerRemoveCallbacks_cold_1();
    return 1;
  }
  return v12;
}

uint64_t BTLocalDeviceEnableLeRxTestMode(uint64_t a1, unsigned int a2)
{
  NSObject *v4;
  uint64_t MBXpcConnection;
  uint64_t v6;
  xpc_object_t v7;
  uint64_t v8;
  _QWORD v10[5];
  _BYTE buf[24];
  uint64_t v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  if (MBFLogInitOnce != -1)
    dispatch_once_f(&MBFLogInitOnce, 0, (dispatch_function_t)MBFLogInit);
  v4 = MBFLogComponent;
  if (os_log_type_enabled((os_log_t)MBFLogComponent, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 134218240;
    *(_QWORD *)&buf[4] = a1;
    *(_WORD *)&buf[12] = 1024;
    *(_DWORD *)&buf[14] = a2;
    _os_log_debug_impl(&dword_1B6BF1000, v4, OS_LOG_TYPE_DEBUG, "BTLocalDeviceEnableLeTxTestMode over XPC localDevice:%llx testFrequency:%d", buf, 0x12u);
  }
  MBXpcConnection = getMBXpcConnection(a1);
  if (MBXpcConnection)
  {
    v6 = MBXpcConnection;
    v7 = xpc_dictionary_create(0, 0, 0);
    xpc_dictionary_set_uint64(v7, "kCBMsgArgLocalDeviceID", a1);
    xpc_dictionary_set_uint64(v7, "kCBMsgArgTestFrequency", a2);
    *(_QWORD *)buf = 0;
    *(_QWORD *)&buf[8] = buf;
    *(_QWORD *)&buf[16] = 0x2000000000;
    v12 = 0;
    v10[0] = MEMORY[0x1E0C809B0];
    v10[1] = 0x40000000;
    v10[2] = __BTLocalDeviceEnableLeRxTestMode_block_invoke;
    v10[3] = &unk_1E6B067F8;
    v10[4] = buf;
    sendMessageWithReplySync(v6, "kCBMsgIdLocalDeviceEnableLeRxTestModeMsg", v7, (uint64_t)v10);
    if (v7)
      xpc_release(v7);
    v8 = *(unsigned int *)(*(_QWORD *)&buf[8] + 24);
    _Block_object_dispose(buf, 8);
  }
  else
  {
    if (MBFLogInitOnce != -1)
      dispatch_once_f(&MBFLogInitOnce, 0, (dispatch_function_t)MBFLogInit);
    if (os_log_type_enabled((os_log_t)MBFLogComponent, OS_LOG_TYPE_ERROR))
      BTAccessoryManagerRemoveCallbacks_cold_1();
    return 1;
  }
  return v8;
}

uint64_t BTLocalDeviceDisableLeTestMode(uint64_t a1)
{
  NSObject *v2;
  uint64_t MBXpcConnection;
  uint64_t v4;
  xpc_object_t v5;
  uint64_t v6;
  _QWORD v8[5];
  __int128 buf;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  if (MBFLogInitOnce != -1)
    dispatch_once_f(&MBFLogInitOnce, 0, (dispatch_function_t)MBFLogInit);
  v2 = MBFLogComponent;
  if (os_log_type_enabled((os_log_t)MBFLogComponent, OS_LOG_TYPE_DEBUG))
  {
    LODWORD(buf) = 134217984;
    *(_QWORD *)((char *)&buf + 4) = a1;
    _os_log_debug_impl(&dword_1B6BF1000, v2, OS_LOG_TYPE_DEBUG, "BTLocalDeviceDisableLeTestMode over XPC localDevice:%llx", (uint8_t *)&buf, 0xCu);
  }
  MBXpcConnection = getMBXpcConnection(a1);
  if (MBXpcConnection)
  {
    v4 = MBXpcConnection;
    v5 = xpc_dictionary_create(0, 0, 0);
    xpc_dictionary_set_uint64(v5, "kCBMsgArgLocalDeviceID", a1);
    *(_QWORD *)&buf = 0;
    *((_QWORD *)&buf + 1) = &buf;
    v10 = 0x2000000000;
    v11 = 0;
    v8[0] = MEMORY[0x1E0C809B0];
    v8[1] = 0x40000000;
    v8[2] = __BTLocalDeviceDisableLeTestMode_block_invoke;
    v8[3] = &unk_1E6B06820;
    v8[4] = &buf;
    sendMessageWithReplySync(v4, "kCBMsgIdLocalDeviceDisableLeTestModeMsg", v5, (uint64_t)v8);
    if (v5)
      xpc_release(v5);
    v6 = *(unsigned int *)(*((_QWORD *)&buf + 1) + 24);
    _Block_object_dispose(&buf, 8);
  }
  else
  {
    if (MBFLogInitOnce != -1)
      dispatch_once_f(&MBFLogInitOnce, 0, (dispatch_function_t)MBFLogInit);
    if (os_log_type_enabled((os_log_t)MBFLogComponent, OS_LOG_TYPE_ERROR))
      BTAccessoryManagerRemoveCallbacks_cold_1();
    return 1;
  }
  return v6;
}

uint64_t BTLocalDeviceSupportsService(uint64_t a1, unsigned int a2, _DWORD *a3)
{
  NSObject *v6;
  uint64_t MBXpcConnection;
  uint64_t v8;
  xpc_object_t v9;
  uint64_t v10;
  _QWORD v12[6];
  uint64_t v13;
  uint64_t *v14;
  uint64_t v15;
  uint64_t v16;
  _BYTE buf[24];
  uint64_t v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  if (MBFLogInitOnce != -1)
    dispatch_once_f(&MBFLogInitOnce, 0, (dispatch_function_t)MBFLogInit);
  v6 = MBFLogComponent;
  if (os_log_type_enabled((os_log_t)MBFLogComponent, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 134218240;
    *(_QWORD *)&buf[4] = a1;
    *(_WORD *)&buf[12] = 1024;
    *(_DWORD *)&buf[14] = a2;
    _os_log_debug_impl(&dword_1B6BF1000, v6, OS_LOG_TYPE_DEBUG, "BTLocalDeviceSupportsService over XPC localDevice:%llx service:%d", buf, 0x12u);
  }
  MBXpcConnection = getMBXpcConnection(a1);
  if (MBXpcConnection)
  {
    v8 = MBXpcConnection;
    v9 = xpc_dictionary_create(0, 0, 0);
    xpc_dictionary_set_uint64(v9, "kCBMsgArgLocalDeviceID", a1);
    xpc_dictionary_set_uint64(v9, "kCBMsgArgServices", a2);
    *(_QWORD *)buf = 0;
    *(_QWORD *)&buf[8] = buf;
    *(_QWORD *)&buf[16] = 0x2000000000;
    v18 = 0;
    v13 = 0;
    v14 = &v13;
    v15 = 0x2000000000;
    v16 = 0;
    v12[0] = MEMORY[0x1E0C809B0];
    v12[1] = 0x40000000;
    v12[2] = __BTLocalDeviceSupportsService_block_invoke;
    v12[3] = &unk_1E6B06848;
    v12[4] = buf;
    v12[5] = &v13;
    sendMessageWithReplySync(v8, "kCBMsgIdLocalDeviceSupportsServiceMsg", v9, (uint64_t)v12);
    if (v9)
      xpc_release(v9);
    *a3 = v14[3];
    v10 = *(unsigned int *)(*(_QWORD *)&buf[8] + 24);
    _Block_object_dispose(&v13, 8);
    _Block_object_dispose(buf, 8);
  }
  else
  {
    if (MBFLogInitOnce != -1)
      dispatch_once_f(&MBFLogInitOnce, 0, (dispatch_function_t)MBFLogInit);
    if (os_log_type_enabled((os_log_t)MBFLogComponent, OS_LOG_TYPE_ERROR))
      BTAccessoryManagerRemoveCallbacks_cold_1();
    return 1;
  }
  return v10;
}

uint64_t BTLocalDeviceAdvertiseData(uint64_t a1, const void *a2, size_t a3, const void *a4, size_t a5)
{
  uint64_t v5;
  NSObject *v11;
  uint64_t MBXpcConnection;
  uint64_t v13;
  xpc_object_t v14;
  _QWORD v16[5];
  __int128 buf;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v5 = 3;
  if (a5 && a3 && a2 && a4)
  {
    if (MBFLogInitOnce != -1)
      dispatch_once_f(&MBFLogInitOnce, 0, (dispatch_function_t)MBFLogInit);
    v11 = MBFLogComponent;
    if (os_log_type_enabled((os_log_t)MBFLogComponent, OS_LOG_TYPE_DEBUG))
    {
      LODWORD(buf) = 134217984;
      *(_QWORD *)((char *)&buf + 4) = a1;
      _os_log_debug_impl(&dword_1B6BF1000, v11, OS_LOG_TYPE_DEBUG, "BTLocalDeviceAdvertiseData over XPC localDevice:%llx", (uint8_t *)&buf, 0xCu);
    }
    MBXpcConnection = getMBXpcConnection(a1);
    if (MBXpcConnection)
    {
      v13 = MBXpcConnection;
      v14 = xpc_dictionary_create(0, 0, 0);
      xpc_dictionary_set_uint64(v14, "kCBMsgArgLocalDeviceID", a1);
      xpc_dictionary_set_data(v14, "kCBMsgArgKey", a2, a3);
      xpc_dictionary_set_data(v14, "kCBMsgArgValue", a4, a5);
      *(_QWORD *)&buf = 0;
      *((_QWORD *)&buf + 1) = &buf;
      v18 = 0x2000000000;
      v19 = 0;
      v16[0] = MEMORY[0x1E0C809B0];
      v16[1] = 0x40000000;
      v16[2] = __BTLocalDeviceAdvertiseData_block_invoke;
      v16[3] = &unk_1E6B06870;
      v16[4] = &buf;
      sendMessageWithReplySync(v13, "kCBMsgIdLocalDeviceAdvertiseDataMsg", v14, (uint64_t)v16);
      if (v14)
        xpc_release(v14);
      v5 = *(unsigned int *)(*((_QWORD *)&buf + 1) + 24);
      _Block_object_dispose(&buf, 8);
    }
    else
    {
      if (MBFLogInitOnce != -1)
        dispatch_once_f(&MBFLogInitOnce, 0, (dispatch_function_t)MBFLogInit);
      if (os_log_type_enabled((os_log_t)MBFLogComponent, OS_LOG_TYPE_ERROR))
        BTLocalDeviceAdvertiseData_cold_1();
      return 1;
    }
  }
  return v5;
}

uint64_t BTLocalDeviceRemoveData(uint64_t a1, const void *a2, size_t a3, const void *a4, size_t a5)
{
  uint64_t v5;
  NSObject *v11;
  uint64_t MBXpcConnection;
  uint64_t v13;
  xpc_object_t v14;
  _QWORD v16[5];
  __int128 buf;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v5 = 3;
  if (a5 && a3 && a2 && a4)
  {
    if (MBFLogInitOnce != -1)
      dispatch_once_f(&MBFLogInitOnce, 0, (dispatch_function_t)MBFLogInit);
    v11 = MBFLogComponent;
    if (os_log_type_enabled((os_log_t)MBFLogComponent, OS_LOG_TYPE_DEBUG))
    {
      LODWORD(buf) = 134217984;
      *(_QWORD *)((char *)&buf + 4) = a1;
      _os_log_debug_impl(&dword_1B6BF1000, v11, OS_LOG_TYPE_DEBUG, "BTLocalDeviceRemoveData over XPC localDevice:%llx", (uint8_t *)&buf, 0xCu);
    }
    MBXpcConnection = getMBXpcConnection(a1);
    if (MBXpcConnection)
    {
      v13 = MBXpcConnection;
      v14 = xpc_dictionary_create(0, 0, 0);
      xpc_dictionary_set_uint64(v14, "kCBMsgArgLocalDeviceID", a1);
      xpc_dictionary_set_data(v14, "kCBMsgArgKey", a2, a3);
      xpc_dictionary_set_data(v14, "kCBMsgArgValue", a4, a5);
      *(_QWORD *)&buf = 0;
      *((_QWORD *)&buf + 1) = &buf;
      v18 = 0x2000000000;
      v19 = 0;
      v16[0] = MEMORY[0x1E0C809B0];
      v16[1] = 0x40000000;
      v16[2] = __BTLocalDeviceRemoveData_block_invoke;
      v16[3] = &unk_1E6B06898;
      v16[4] = &buf;
      sendMessageWithReplySync(v13, "kCBMsgIdLocalDeviceRemoveDataMsg", v14, (uint64_t)v16);
      if (v14)
        xpc_release(v14);
      v5 = *(unsigned int *)(*((_QWORD *)&buf + 1) + 24);
      _Block_object_dispose(&buf, 8);
    }
    else
    {
      if (MBFLogInitOnce != -1)
        dispatch_once_f(&MBFLogInitOnce, 0, (dispatch_function_t)MBFLogInit);
      if (os_log_type_enabled((os_log_t)MBFLogComponent, OS_LOG_TYPE_ERROR))
        BTLocalDeviceAdvertiseData_cold_1();
      return 1;
    }
  }
  return v5;
}

uint64_t BTLocalDeviceRegisterForPowerUpdates(uint64_t a1, uint64_t *a2, uint64_t a3)
{
  uint64_t MBXpcConnection;
  uint64_t v7;
  xpc_object_t v8;
  _QWORD v10[5];
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t value;

  MBXpcConnection = getMBXpcConnection(a1);
  if (MBFLogInitOnce != -1)
    dispatch_once_f(&MBFLogInitOnce, 0, (dispatch_function_t)MBFLogInit);
  if (os_log_type_enabled((os_log_t)MBFLogComponent, OS_LOG_TYPE_DEBUG))
  {
    BTLocalDeviceRegisterForPowerUpdates_cold_4();
    if (MBXpcConnection)
    {
LABEL_5:
      addXpcMsgHandler(MBXpcConnection, (uint64_t)&localDeviceXpcCallbacks);
      if (_localBTLocalDeviceStatsCallbacksRegistered(a1, a2))
      {
        if (MBFLogInitOnce != -1)
          dispatch_once_f(&MBFLogInitOnce, 0, (dispatch_function_t)MBFLogInit);
        if (os_log_type_enabled((os_log_t)MBFLogComponent, OS_LOG_TYPE_DEBUG))
          BTAccessoryManagerAddCallbacks_cold_2();
        return 0;
      }
      else
      {
        value = 0;
        if (_localBTLocalDeviceAddStatsCallbacks(a1, MBXpcConnection, a2, a3, (uint64_t *)&value))
        {
          if (MBFLogInitOnce != -1)
            dispatch_once_f(&MBFLogInitOnce, 0, (dispatch_function_t)MBFLogInit);
          if (os_log_type_enabled((os_log_t)MBFLogComponent, OS_LOG_TYPE_DEBUG))
            BTDiscoveryAgentCreate_cold_3();
          return 4;
        }
        else
        {
          v8 = xpc_dictionary_create(0, 0, 0);
          xpc_dictionary_set_uint64(v8, "kCBMsgArgLocalDeviceID", a1);
          xpc_dictionary_set_uint64(v8, "kCBMsgArgID", value);
          v11 = 0;
          v12 = &v11;
          v13 = 0x2000000000;
          v14 = 0;
          v10[0] = MEMORY[0x1E0C809B0];
          v10[1] = 0x40000000;
          v10[2] = __BTLocalDeviceRegisterForPowerUpdates_block_invoke;
          v10[3] = &unk_1E6B068C0;
          v10[4] = &v11;
          sendMessageWithReplySync(MBXpcConnection, "kCBMsgIdLocalDeviceRegisterForPowerUpdatesMsg", v8, (uint64_t)v10);
          if (v8)
            xpc_release(v8);
          if (v12[3])
          {
            _localBTLocalDeviceRemoveStatsCallbacks(a1);
            v7 = *((unsigned int *)v12 + 6);
          }
          else
          {
            v7 = 0;
          }
          _Block_object_dispose(&v11, 8);
        }
      }
      return v7;
    }
  }
  else if (MBXpcConnection)
  {
    goto LABEL_5;
  }
  if (MBFLogInitOnce != -1)
    dispatch_once_f(&MBFLogInitOnce, 0, (dispatch_function_t)MBFLogInit);
  if (os_log_type_enabled((os_log_t)MBFLogComponent, OS_LOG_TYPE_ERROR))
    BTAccessoryManagerRemoveCallbacks_cold_1();
  return 1;
}

uint64_t BTLocalDeviceUnregisterForPowerUpdates(uint64_t a1)
{
  uint64_t MBXpcConnection;
  xpc_object_t v3;
  uint64_t v4;
  _QWORD v6[5];
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  uint64_t v10;

  MBXpcConnection = getMBXpcConnection(a1);
  if (MBFLogInitOnce != -1)
    dispatch_once_f(&MBFLogInitOnce, 0, (dispatch_function_t)MBFLogInit);
  if (os_log_type_enabled((os_log_t)MBFLogComponent, OS_LOG_TYPE_DEBUG))
  {
    BTLocalDeviceUnregisterForPowerUpdates_cold_2();
    if (MBXpcConnection)
      goto LABEL_5;
  }
  else if (MBXpcConnection)
  {
LABEL_5:
    _localBTLocalDeviceRemoveStatsCallbacks(a1);
    removeXpcMsgHandler(MBXpcConnection, (uint64_t)&localDeviceXpcCallbacks);
    v3 = xpc_dictionary_create(0, 0, 0);
    xpc_dictionary_set_uint64(v3, "kCBMsgArgLocalDeviceID", a1);
    v7 = 0;
    v8 = &v7;
    v9 = 0x2000000000;
    v10 = 0;
    v6[0] = MEMORY[0x1E0C809B0];
    v6[1] = 0x40000000;
    v6[2] = __BTLocalDeviceUnregisterForPowerUpdates_block_invoke;
    v6[3] = &unk_1E6B068E8;
    v6[4] = &v7;
    sendMessageWithReplySync(MBXpcConnection, "kCBMsgIdLocalDeviceUnregisterForPowerUpdatesMsg", v3, (uint64_t)v6);
    if (v3)
      xpc_release(v3);
    v4 = *((unsigned int *)v8 + 6);
    _Block_object_dispose(&v7, 8);
    return v4;
  }
  if (MBFLogInitOnce != -1)
    dispatch_once_f(&MBFLogInitOnce, 0, (dispatch_function_t)MBFLogInit);
  if (os_log_type_enabled((os_log_t)MBFLogComponent, OS_LOG_TYPE_ERROR))
    BTAccessoryManagerRemoveCallbacks_cold_1();
  return 1;
}

uint64_t BTLocalDeviceReadPowerConsumption(uint64_t a1, _DWORD *a2)
{
  NSObject *v4;
  uint64_t MBXpcConnection;
  xpc_object_t v6;
  uint64_t v7;
  _QWORD v9[6];
  uint64_t v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t v13;
  __int128 buf;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  if (MBFLogInitOnce != -1)
    dispatch_once_f(&MBFLogInitOnce, 0, (dispatch_function_t)MBFLogInit);
  v4 = MBFLogComponent;
  if (os_log_type_enabled((os_log_t)MBFLogComponent, OS_LOG_TYPE_DEBUG))
  {
    LODWORD(buf) = 134217984;
    *(_QWORD *)((char *)&buf + 4) = a1;
    _os_log_debug_impl(&dword_1B6BF1000, v4, OS_LOG_TYPE_DEBUG, "BTLocalDeviceReadPowerConsumption device:%llx", (uint8_t *)&buf, 0xCu);
  }
  MBXpcConnection = getMBXpcConnection(a1);
  if (MBFLogInitOnce != -1)
    dispatch_once_f(&MBFLogInitOnce, 0, (dispatch_function_t)MBFLogInit);
  if (os_log_type_enabled((os_log_t)MBFLogComponent, OS_LOG_TYPE_DEBUG))
  {
    BTLocalDeviceReadPowerConsumption_cold_2();
    if (MBXpcConnection)
      goto LABEL_9;
  }
  else if (MBXpcConnection)
  {
LABEL_9:
    v6 = xpc_dictionary_create(0, 0, 0);
    xpc_dictionary_set_uint64(v6, "kCBMsgArgLocalDeviceID", a1);
    *(_QWORD *)&buf = 0;
    *((_QWORD *)&buf + 1) = &buf;
    v15 = 0x2000000000;
    v16 = 0;
    v10 = 0;
    v11 = &v10;
    v12 = 0x2000000000;
    v13 = 0;
    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 0x40000000;
    v9[2] = __BTLocalDeviceReadPowerConsumption_block_invoke;
    v9[3] = &unk_1E6B06910;
    v9[4] = &buf;
    v9[5] = &v10;
    sendMessageWithReplySync(MBXpcConnection, "kCBMsgIdLocalDeviceReadPowerConsumptionMsg", v6, (uint64_t)v9);
    if (v6)
      xpc_release(v6);
    *a2 = v11[3];
    v7 = *(unsigned int *)(*((_QWORD *)&buf + 1) + 24);
    _Block_object_dispose(&v10, 8);
    _Block_object_dispose(&buf, 8);
    return v7;
  }
  if (MBFLogInitOnce != -1)
    dispatch_once_f(&MBFLogInitOnce, 0, (dispatch_function_t)MBFLogInit);
  if (os_log_type_enabled((os_log_t)MBFLogComponent, OS_LOG_TYPE_ERROR))
    BTAccessoryManagerRemoveCallbacks_cold_1();
  return 1;
}

uint64_t BTLocalDeviceRegisterForPowerProfileStatistics(uint64_t a1, uint64_t *a2, uint64_t a3)
{
  uint64_t MBXpcConnection;
  uint64_t v7;
  xpc_object_t v8;
  _QWORD v10[5];
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t value;

  MBXpcConnection = getMBXpcConnection(a1);
  if (MBFLogInitOnce != -1)
    dispatch_once_f(&MBFLogInitOnce, 0, (dispatch_function_t)MBFLogInit);
  if (os_log_type_enabled((os_log_t)MBFLogComponent, OS_LOG_TYPE_DEBUG))
  {
    BTLocalDeviceRegisterForPowerProfileStatistics_cold_4();
    if (MBXpcConnection)
    {
LABEL_5:
      addXpcMsgHandler(MBXpcConnection, (uint64_t)&localDeviceXpcCallbacks);
      if (_localBTLocalDeviceStatsCallbacksRegistered(a1, a2))
      {
        if (MBFLogInitOnce != -1)
          dispatch_once_f(&MBFLogInitOnce, 0, (dispatch_function_t)MBFLogInit);
        if (os_log_type_enabled((os_log_t)MBFLogComponent, OS_LOG_TYPE_DEBUG))
          BTAccessoryManagerAddCallbacks_cold_2();
        return 0;
      }
      else
      {
        value = 0;
        if (_localBTLocalDeviceAddStatsCallbacks(a1, MBXpcConnection, a2, a3, (uint64_t *)&value))
        {
          if (MBFLogInitOnce != -1)
            dispatch_once_f(&MBFLogInitOnce, 0, (dispatch_function_t)MBFLogInit);
          if (os_log_type_enabled((os_log_t)MBFLogComponent, OS_LOG_TYPE_DEBUG))
            BTDiscoveryAgentCreate_cold_3();
          return 4;
        }
        else
        {
          v8 = xpc_dictionary_create(0, 0, 0);
          xpc_dictionary_set_uint64(v8, "kCBMsgArgLocalDeviceID", a1);
          xpc_dictionary_set_uint64(v8, "kCBMsgArgID", value);
          v11 = 0;
          v12 = &v11;
          v13 = 0x2000000000;
          v14 = 0;
          v10[0] = MEMORY[0x1E0C809B0];
          v10[1] = 0x40000000;
          v10[2] = __BTLocalDeviceRegisterForPowerProfileStatistics_block_invoke;
          v10[3] = &unk_1E6B06938;
          v10[4] = &v11;
          sendMessageWithReplySync(MBXpcConnection, "kCBMsgIdLocalDeviceRegisterForPowerProfileStatisticsMsg", v8, (uint64_t)v10);
          if (v8)
            xpc_release(v8);
          if (v12[3])
          {
            _localBTLocalDeviceRemoveStatsCallbacks(a1);
            v7 = *((unsigned int *)v12 + 6);
          }
          else
          {
            v7 = 0;
          }
          _Block_object_dispose(&v11, 8);
        }
      }
      return v7;
    }
  }
  else if (MBXpcConnection)
  {
    goto LABEL_5;
  }
  if (MBFLogInitOnce != -1)
    dispatch_once_f(&MBFLogInitOnce, 0, (dispatch_function_t)MBFLogInit);
  if (os_log_type_enabled((os_log_t)MBFLogComponent, OS_LOG_TYPE_ERROR))
    BTAccessoryManagerRemoveCallbacks_cold_1();
  return 1;
}

uint64_t BTLocalDeviceUnregisterForPowerProfileStatistics(uint64_t a1)
{
  uint64_t MBXpcConnection;
  xpc_object_t v3;
  uint64_t v4;
  _QWORD v6[5];
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  uint64_t v10;

  MBXpcConnection = getMBXpcConnection(a1);
  if (MBFLogInitOnce != -1)
    dispatch_once_f(&MBFLogInitOnce, 0, (dispatch_function_t)MBFLogInit);
  if (os_log_type_enabled((os_log_t)MBFLogComponent, OS_LOG_TYPE_DEBUG))
  {
    BTLocalDeviceUnregisterForPowerProfileStatistics_cold_2();
    if (MBXpcConnection)
      goto LABEL_5;
  }
  else if (MBXpcConnection)
  {
LABEL_5:
    _localBTLocalDeviceRemoveStatsCallbacks(a1);
    removeXpcMsgHandler(MBXpcConnection, (uint64_t)&localDeviceXpcCallbacks);
    v3 = xpc_dictionary_create(0, 0, 0);
    xpc_dictionary_set_uint64(v3, "kCBMsgArgLocalDeviceID", a1);
    v7 = 0;
    v8 = &v7;
    v9 = 0x2000000000;
    v10 = 0;
    v6[0] = MEMORY[0x1E0C809B0];
    v6[1] = 0x40000000;
    v6[2] = __BTLocalDeviceUnregisterForPowerProfileStatistics_block_invoke;
    v6[3] = &unk_1E6B06960;
    v6[4] = &v7;
    sendMessageWithReplySync(MBXpcConnection, "kCBMsgIdLocalDeviceUnregisterForPowerProfileStatisticsMsg", v3, (uint64_t)v6);
    if (v3)
      xpc_release(v3);
    v4 = *((unsigned int *)v8 + 6);
    _Block_object_dispose(&v7, 8);
    return v4;
  }
  if (MBFLogInitOnce != -1)
    dispatch_once_f(&MBFLogInitOnce, 0, (dispatch_function_t)MBFLogInit);
  if (os_log_type_enabled((os_log_t)MBFLogComponent, OS_LOG_TYPE_ERROR))
    BTAccessoryManagerRemoveCallbacks_cold_1();
  return 1;
}

uint64_t BTLocalDeviceReadPowerProfileStatistics(uint64_t a1, unsigned int a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  uint64_t MBXpcConnection;
  xpc_object_t v13;
  uint64_t v14;
  _QWORD v16[9];
  uint64_t v17;
  uint64_t *v18;
  uint64_t v19;
  uint64_t v20;

  MBXpcConnection = getMBXpcConnection(a1);
  if (MBFLogInitOnce != -1)
    dispatch_once_f(&MBFLogInitOnce, 0, (dispatch_function_t)MBFLogInit);
  if (os_log_type_enabled((os_log_t)MBFLogComponent, OS_LOG_TYPE_DEBUG))
  {
    BTLocalDeviceReadPowerProfileStatistics_cold_2();
    if (MBXpcConnection)
      goto LABEL_5;
  }
  else if (MBXpcConnection)
  {
LABEL_5:
    v13 = xpc_dictionary_create(0, 0, 0);
    xpc_dictionary_set_uint64(v13, "kCBMsgArgLocalDeviceID", a1);
    xpc_dictionary_set_uint64(v13, "kCBMsgArgReset", a2);
    v17 = 0;
    v18 = &v17;
    v19 = 0x2000000000;
    v20 = 0;
    v16[0] = MEMORY[0x1E0C809B0];
    v16[1] = 0x40000000;
    v16[2] = __BTLocalDeviceReadPowerProfileStatistics_block_invoke;
    v16[3] = &unk_1E6B06988;
    v16[4] = &v17;
    v16[5] = a3;
    v16[6] = a4;
    v16[7] = a5;
    v16[8] = a6;
    sendMessageWithReplySync(MBXpcConnection, "kCBMsgIdLocalDeviceReadPowerProfileStatisticsMsg", v13, (uint64_t)v16);
    if (v13)
      xpc_release(v13);
    v14 = *((unsigned int *)v18 + 6);
    _Block_object_dispose(&v17, 8);
    return v14;
  }
  if (MBFLogInitOnce != -1)
    dispatch_once_f(&MBFLogInitOnce, 0, (dispatch_function_t)MBFLogInit);
  if (os_log_type_enabled((os_log_t)MBFLogComponent, OS_LOG_TYPE_ERROR))
    BTAccessoryManagerGetDevices_cold_1();
  return 1;
}

uint64_t BTLocalDeviceReadTransportSwitchStatistics(uint64_t a1, unsigned int a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  uint64_t MBXpcConnection;
  uint64_t v13;
  xpc_object_t v14;
  uint64_t v15;
  _QWORD v17[9];
  uint64_t v18;
  uint64_t *v19;
  uint64_t v20;
  uint64_t v21;

  if (MBFLogInitOnce != -1)
    dispatch_once_f(&MBFLogInitOnce, 0, (dispatch_function_t)MBFLogInit);
  if (os_log_type_enabled((os_log_t)MBFLogComponent, OS_LOG_TYPE_DEBUG))
    BTLocalDeviceReadTransportSwitchStatistics_cold_2();
  MBXpcConnection = getMBXpcConnection(a1);
  if (MBXpcConnection)
  {
    v13 = MBXpcConnection;
    v14 = xpc_dictionary_create(0, 0, 0);
    xpc_dictionary_set_uint64(v14, "kCBMsgArgLocalDeviceID", a1);
    xpc_dictionary_set_uint64(v14, "kCBMsgArgReset", a2);
    v18 = 0;
    v19 = &v18;
    v20 = 0x2000000000;
    v21 = 0;
    v17[0] = MEMORY[0x1E0C809B0];
    v17[1] = 0x40000000;
    v17[2] = __BTLocalDeviceReadTransportSwitchStatistics_block_invoke;
    v17[3] = &unk_1E6B069D8;
    v17[4] = &v18;
    v17[5] = a3;
    v17[6] = a4;
    v17[7] = a5;
    v17[8] = a6;
    sendMessageWithReplySync(v13, "kCBMsgIdLocalDeviceReadTransportSwitchStatisticsMsg", v14, (uint64_t)v17);
    if (v14)
      xpc_release(v14);
    v15 = *((unsigned int *)v19 + 6);
    _Block_object_dispose(&v18, 8);
  }
  else
  {
    if (MBFLogInitOnce != -1)
      dispatch_once_f(&MBFLogInitOnce, 0, (dispatch_function_t)MBFLogInit);
    if (os_log_type_enabled((os_log_t)MBFLogComponent, OS_LOG_TYPE_ERROR))
      BTAccessoryManagerGetDevices_cold_1();
    return 1;
  }
  return v15;
}

uint64_t BTLocalDeviceReadDetailedPowerProfileStatistics(uint64_t a1, unsigned int a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16)
{
  uint64_t MBXpcConnection;
  uint64_t v24;
  uint64_t v25;
  xpc_object_t v26;
  uint64_t v27;
  _QWORD v30[19];
  uint64_t v31;
  uint64_t *v32;
  uint64_t v33;
  uint64_t v34;

  if (MBFLogInitOnce != -1)
    dispatch_once_f(&MBFLogInitOnce, 0, (dispatch_function_t)MBFLogInit);
  if (os_log_type_enabled((os_log_t)MBFLogComponent, OS_LOG_TYPE_DEBUG))
    BTLocalDeviceReadDetailedPowerProfileStatistics_cold_2();
  MBXpcConnection = getMBXpcConnection(a1);
  if (MBXpcConnection)
  {
    v24 = MBXpcConnection;
    v25 = a4;
    v26 = xpc_dictionary_create(0, 0, 0);
    xpc_dictionary_set_uint64(v26, "kCBMsgArgLocalDeviceID", a1);
    xpc_dictionary_set_uint64(v26, "kCBMsgArgReset", a2);
    v31 = 0;
    v32 = &v31;
    v33 = 0x2000000000;
    v34 = 0;
    v30[0] = MEMORY[0x1E0C809B0];
    v30[1] = 0x40000000;
    v30[2] = __BTLocalDeviceReadDetailedPowerProfileStatistics_block_invoke;
    v30[3] = &unk_1E6B06A00;
    v30[4] = &v31;
    v30[5] = a3;
    v30[6] = v25;
    v30[7] = a5;
    v30[8] = a6;
    v30[9] = a7;
    v30[10] = a8;
    v30[11] = a9;
    v30[12] = a10;
    v30[13] = a11;
    v30[14] = a12;
    v30[15] = a13;
    v30[16] = a14;
    v30[17] = a15;
    v30[18] = a16;
    sendMessageWithReplySync(v24, "kCBMsgIdLocalDeviceReadDetailedPowerProfileStatisticsMsg", v26, (uint64_t)v30);
    if (v26)
      xpc_release(v26);
    v27 = *((unsigned int *)v32 + 6);
    _Block_object_dispose(&v31, 8);
  }
  else
  {
    if (MBFLogInitOnce != -1)
      dispatch_once_f(&MBFLogInitOnce, 0, (dispatch_function_t)MBFLogInit);
    if (os_log_type_enabled((os_log_t)MBFLogComponent, OS_LOG_TYPE_ERROR))
      BTAccessoryManagerGetDevices_cold_1();
    return 1;
  }
  return v27;
}

uint64_t BTStartHCITraces(uint64_t a1)
{
  uint64_t MBXpcConnection;
  xpc_object_t v3;
  uint64_t v4;
  _QWORD v6[5];
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  uint64_t v10;

  MBXpcConnection = getMBXpcConnection(a1);
  if (MBFLogInitOnce != -1)
    dispatch_once_f(&MBFLogInitOnce, 0, (dispatch_function_t)MBFLogInit);
  if (os_log_type_enabled((os_log_t)MBFLogComponent, OS_LOG_TYPE_DEBUG))
  {
    BTStartHCITraces_cold_2();
    if (MBXpcConnection)
      goto LABEL_5;
  }
  else if (MBXpcConnection)
  {
LABEL_5:
    v3 = xpc_dictionary_create(0, 0, 0);
    xpc_dictionary_set_uint64(v3, "kCBMsgArgLocalDeviceID", a1);
    v7 = 0;
    v8 = &v7;
    v9 = 0x2000000000;
    v10 = 0;
    v6[0] = MEMORY[0x1E0C809B0];
    v6[1] = 0x40000000;
    v6[2] = __BTStartHCITraces_block_invoke;
    v6[3] = &unk_1E6B06A28;
    v6[4] = &v7;
    sendMessageWithReplySync(MBXpcConnection, "kCBMsgIdLocalDeviceStartHCITracesMsg", v3, (uint64_t)v6);
    if (v3)
      xpc_release(v3);
    v4 = *((unsigned int *)v8 + 6);
    _Block_object_dispose(&v7, 8);
    return v4;
  }
  if (MBFLogInitOnce != -1)
    dispatch_once_f(&MBFLogInitOnce, 0, (dispatch_function_t)MBFLogInit);
  if (os_log_type_enabled((os_log_t)MBFLogComponent, OS_LOG_TYPE_ERROR))
    BTAccessoryManagerGetDevices_cold_1();
  return 1;
}

uint64_t BTStopHCITraces(uint64_t a1, const char *a2, const char *a3, uint64_t a4, uint64_t a5)
{
  uint64_t MBXpcConnection;
  uint64_t v11;
  xpc_object_t v12;
  uint64_t v13;
  _QWORD v15[7];
  uint64_t v16;
  uint64_t *v17;
  uint64_t v18;
  uint64_t v19;

  if (MBFLogInitOnce != -1)
    dispatch_once_f(&MBFLogInitOnce, 0, (dispatch_function_t)MBFLogInit);
  if (os_log_type_enabled((os_log_t)MBFLogComponent, OS_LOG_TYPE_DEBUG))
    BTStopHCITraces_cold_2();
  MBXpcConnection = getMBXpcConnection(a1);
  if (MBXpcConnection)
  {
    v11 = MBXpcConnection;
    v12 = xpc_dictionary_create(0, 0, 0);
    xpc_dictionary_set_uint64(v12, "kCBMsgArgLocalDeviceID", a1);
    xpc_dictionary_set_string(v12, "kCBMsgArgPath", a2);
    xpc_dictionary_set_string(v12, "kCBMsgArgExtensionToken", a3);
    xpc_dictionary_set_uint64(v12, "kCBMsgArgBufferSize", a5);
    v16 = 0;
    v17 = &v16;
    v18 = 0x2000000000;
    v19 = 0;
    v15[0] = MEMORY[0x1E0C809B0];
    v15[1] = 0x40000000;
    v15[2] = __BTStopHCITraces_block_invoke;
    v15[3] = &unk_1E6B06A50;
    v15[4] = &v16;
    v15[5] = a4;
    v15[6] = a5;
    sendMessageWithReplySync(v11, "kCBMsgIdLocalDeviceStopHCITracesMsg", v12, (uint64_t)v15);
    if (v12)
      xpc_release(v12);
    v13 = *((unsigned int *)v17 + 6);
    _Block_object_dispose(&v16, 8);
  }
  else
  {
    if (MBFLogInitOnce != -1)
      dispatch_once_f(&MBFLogInitOnce, 0, (dispatch_function_t)MBFLogInit);
    if (os_log_type_enabled((os_log_t)MBFLogComponent, OS_LOG_TYPE_ERROR))
      BTAccessoryManagerGetDevices_cold_1();
    return 1;
  }
  return v13;
}

uint64_t BTLocalDeviceShowPowerPrompt(uint64_t a1, const char *a2)
{
  uint64_t MBXpcConnection;
  uint64_t v5;
  xpc_object_t v6;
  uint64_t v7;
  _QWORD v9[5];
  uint64_t v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t v13;

  if (MBFLogInitOnce != -1)
    dispatch_once_f(&MBFLogInitOnce, 0, (dispatch_function_t)MBFLogInit);
  if (os_log_type_enabled((os_log_t)MBFLogComponent, OS_LOG_TYPE_DEBUG))
    BTLocalDeviceShowPowerPrompt_cold_2();
  MBXpcConnection = getMBXpcConnection(a1);
  if (MBXpcConnection)
  {
    v5 = MBXpcConnection;
    v6 = xpc_dictionary_create(0, 0, 0);
    xpc_dictionary_set_uint64(v6, "kCBMsgArgLocalDeviceID", a1);
    xpc_dictionary_set_string(v6, "kCBMsgArgBundleIdString", a2);
    v10 = 0;
    v11 = &v10;
    v12 = 0x2000000000;
    v13 = 0;
    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 0x40000000;
    v9[2] = __BTLocalDeviceShowPowerPrompt_block_invoke;
    v9[3] = &unk_1E6B06A78;
    v9[4] = &v10;
    sendMessageWithReplySync(v5, "kCBMsgIdLocalDeviceShowPowerPromptMsg", v6, (uint64_t)v9);
    if (v6)
      xpc_release(v6);
    v7 = *((unsigned int *)v11 + 6);
    _Block_object_dispose(&v10, 8);
  }
  else
  {
    if (MBFLogInitOnce != -1)
      dispatch_once_f(&MBFLogInitOnce, 0, (dispatch_function_t)MBFLogInit);
    if (os_log_type_enabled((os_log_t)MBFLogComponent, OS_LOG_TYPE_ERROR))
      BTAccessoryManagerGetDevices_cold_1();
    return 1;
  }
  return v7;
}

uint64_t BTLocalDeviceSetAFHMap(uint64_t a1, const void *a2)
{
  uint64_t MBXpcConnection;
  uint64_t v5;
  xpc_object_t v6;
  uint64_t v7;
  _QWORD v9[5];
  uint64_t v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t v13;

  if (MBFLogInitOnce != -1)
    dispatch_once_f(&MBFLogInitOnce, 0, (dispatch_function_t)MBFLogInit);
  if (os_log_type_enabled((os_log_t)MBFLogComponent, OS_LOG_TYPE_DEBUG))
    BTLocalDeviceSetAFHMap_cold_2();
  MBXpcConnection = getMBXpcConnection(a1);
  if (MBXpcConnection)
  {
    v5 = MBXpcConnection;
    v6 = xpc_dictionary_create(0, 0, 0);
    xpc_dictionary_set_uint64(v6, "kCBMsgArgLocalDeviceID", a1);
    xpc_dictionary_set_data(v6, "kCBMsgArgData", a2, 0xAuLL);
    v10 = 0;
    v11 = &v10;
    v12 = 0x2000000000;
    v13 = 0;
    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 0x40000000;
    v9[2] = __BTLocalDeviceSetAFHMap_block_invoke;
    v9[3] = &unk_1E6B06AA0;
    v9[4] = &v10;
    sendMessageWithReplySync(v5, "kCBMsgIdLocalDeviceSetAFHMapMsg", v6, (uint64_t)v9);
    if (v6)
      xpc_release(v6);
    v7 = *((unsigned int *)v11 + 6);
    _Block_object_dispose(&v10, 8);
  }
  else
  {
    if (MBFLogInitOnce != -1)
      dispatch_once_f(&MBFLogInitOnce, 0, (dispatch_function_t)MBFLogInit);
    if (os_log_type_enabled((os_log_t)MBFLogComponent, OS_LOG_TYPE_ERROR))
      BTAccessoryManagerGetDevices_cold_1();
    return 1;
  }
  return v7;
}

uint64_t BTLocalDeviceReadAFHMap(uint64_t a1, uint64_t a2)
{
  uint64_t MBXpcConnection;
  uint64_t v5;
  xpc_object_t v6;
  uint64_t v7;
  _QWORD v9[5];
  uint64_t v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t v13;

  if (MBFLogInitOnce != -1)
    dispatch_once_f(&MBFLogInitOnce, 0, (dispatch_function_t)MBFLogInit);
  if (os_log_type_enabled((os_log_t)MBFLogComponent, OS_LOG_TYPE_DEBUG))
    BTLocalDeviceReadAFHMap_cold_2();
  MBXpcConnection = getMBXpcConnection(a1);
  if (MBXpcConnection)
  {
    v5 = MBXpcConnection;
    v6 = xpc_dictionary_create(0, 0, 0);
    xpc_dictionary_set_uint64(v6, "kCBMsgArgLocalDeviceID", a1);
    xpc_dictionary_set_uint64(v6, "kCBMsgArgBTDevice", a2);
    v10 = 0;
    v11 = &v10;
    v12 = 0x2000000000;
    v13 = 0;
    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 0x40000000;
    v9[2] = __BTLocalDeviceReadAFHMap_block_invoke;
    v9[3] = &unk_1E6B06AC8;
    v9[4] = &v10;
    sendMessageWithReplySync(v5, "kCBMsgIdLocalDeviceReadAFHMapMsg", v6, (uint64_t)v9);
    if (v6)
      xpc_release(v6);
    v7 = *((unsigned int *)v11 + 6);
    _Block_object_dispose(&v10, 8);
  }
  else
  {
    if (MBFLogInitOnce != -1)
      dispatch_once_f(&MBFLogInitOnce, 0, (dispatch_function_t)MBFLogInit);
    if (os_log_type_enabled((os_log_t)MBFLogComponent, OS_LOG_TYPE_ERROR))
      BTAccessoryManagerGetDevices_cold_1();
    return 1;
  }
  return v7;
}

uint64_t BTLocalDeviceSetDelayedWake(unsigned int a1)
{
  uint64_t FirstSessionHandle;
  uint64_t MBXpcConnection;
  uint64_t v4;
  xpc_object_t v5;
  uint64_t v6;
  _QWORD v8[5];
  uint64_t v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t v12;

  FirstSessionHandle = getFirstSessionHandle();
  if (MBFLogInitOnce != -1)
    dispatch_once_f(&MBFLogInitOnce, 0, (dispatch_function_t)MBFLogInit);
  if (os_log_type_enabled((os_log_t)MBFLogComponent, OS_LOG_TYPE_DEBUG))
    BTLocalDeviceSetDelayedWake_cold_2();
  MBXpcConnection = getMBXpcConnection(FirstSessionHandle);
  if (MBXpcConnection)
  {
    v4 = MBXpcConnection;
    v5 = xpc_dictionary_create(0, 0, 0);
    xpc_dictionary_set_uint64(v5, "kCBMsgArgDelay", a1);
    v9 = 0;
    v10 = &v9;
    v11 = 0x2000000000;
    v12 = 0;
    v8[0] = MEMORY[0x1E0C809B0];
    v8[1] = 0x40000000;
    v8[2] = __BTLocalDeviceSetDelayedWake_block_invoke;
    v8[3] = &unk_1E6B06AF0;
    v8[4] = &v9;
    sendMessageWithReplySync(v4, "kCBMsgIdLocalDeviceSetDelayedWakeMsg", v5, (uint64_t)v8);
    if (v5)
      xpc_release(v5);
    v6 = *((unsigned int *)v10 + 6);
    _Block_object_dispose(&v9, 8);
  }
  else
  {
    if (MBFLogInitOnce != -1)
      dispatch_once_f(&MBFLogInitOnce, 0, (dispatch_function_t)MBFLogInit);
    if (os_log_type_enabled((os_log_t)MBFLogComponent, OS_LOG_TYPE_ERROR))
      BTDeviceAddressToString_cold_1();
    return 1;
  }
  return v6;
}

uint64_t BTLocalDeviceSetDenylistEnabled(uint64_t a1, unsigned int a2)
{
  uint64_t MBXpcConnection;
  uint64_t v5;
  xpc_object_t v6;
  uint64_t v7;
  _QWORD v9[5];
  uint64_t v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t v13;

  if (MBFLogInitOnce != -1)
    dispatch_once_f(&MBFLogInitOnce, 0, (dispatch_function_t)MBFLogInit);
  if (os_log_type_enabled((os_log_t)MBFLogComponent, OS_LOG_TYPE_DEBUG))
    BTLocalDeviceSetDenylistEnabled_cold_2();
  MBXpcConnection = getMBXpcConnection(a1);
  if (MBXpcConnection)
  {
    v5 = MBXpcConnection;
    v6 = xpc_dictionary_create(0, 0, 0);
    xpc_dictionary_set_uint64(v6, "kCBMsgArgLocalDeviceID", a1);
    xpc_dictionary_set_uint64(v6, "kCBMsgArgBool", a2);
    v10 = 0;
    v11 = &v10;
    v12 = 0x2000000000;
    v13 = 0;
    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 0x40000000;
    v9[2] = __BTLocalDeviceSetDenylistEnabled_block_invoke;
    v9[3] = &unk_1E6B06B18;
    v9[4] = &v10;
    sendMessageWithReplySync(v5, "kCBMsgIdLocalDeviceSetDenylistEnabledMsg", v6, (uint64_t)v9);
    if (v6)
      xpc_release(v6);
    v7 = *((unsigned int *)v11 + 6);
    _Block_object_dispose(&v10, 8);
  }
  else
  {
    if (MBFLogInitOnce != -1)
      dispatch_once_f(&MBFLogInitOnce, 0, (dispatch_function_t)MBFLogInit);
    if (os_log_type_enabled((os_log_t)MBFLogComponent, OS_LOG_TYPE_ERROR))
      BTLocalDeviceSetDenylistEnabled_cold_1();
    return 1;
  }
  return v7;
}

uint64_t BTLocalDeviceGetDeviceNamesThatMayBeDenylisted(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t MBXpcConnection;
  uint64_t v9;
  xpc_object_t v10;
  uint64_t v11;
  _QWORD v13[9];
  _QWORD v14[4];
  uint64_t v15;
  uint64_t *v16;
  uint64_t v17;
  uint64_t v18;

  if (MBFLogInitOnce != -1)
    dispatch_once_f(&MBFLogInitOnce, 0, (dispatch_function_t)MBFLogInit);
  if (os_log_type_enabled((os_log_t)MBFLogComponent, OS_LOG_TYPE_DEBUG))
    BTLocalDeviceGetDeviceNamesThatMayBeDenylisted_cold_2();
  MBXpcConnection = getMBXpcConnection(a1);
  if (MBXpcConnection)
  {
    v9 = MBXpcConnection;
    v10 = xpc_dictionary_create(0, 0, 0);
    xpc_dictionary_set_uint64(v10, "kCBMsgArgLocalDeviceID", a1);
    xpc_dictionary_set_uint64(v10, "kCbMsgArgDeviceArrayMaxSize", a4);
    v15 = 0;
    v16 = &v15;
    v17 = 0x2000000000;
    v18 = 0;
    v14[0] = 0;
    v14[1] = v14;
    v14[2] = 0x2000000000;
    v14[3] = 0;
    v13[0] = MEMORY[0x1E0C809B0];
    v13[1] = 0x40000000;
    v13[2] = __BTLocalDeviceGetDeviceNamesThatMayBeDenylisted_block_invoke;
    v13[3] = &unk_1E6B06B68;
    v13[4] = &v15;
    v13[5] = v14;
    v13[6] = a4;
    v13[7] = a2;
    v13[8] = a3;
    sendMessageWithReplySync(v9, "kCBMsgIdLocalDeviceGetDeviceNamesThatMayBeDenylistedMsg", v10, (uint64_t)v13);
    if (v10)
      xpc_release(v10);
    v11 = *((unsigned int *)v16 + 6);
    _Block_object_dispose(v14, 8);
    _Block_object_dispose(&v15, 8);
  }
  else
  {
    if (MBFLogInitOnce != -1)
      dispatch_once_f(&MBFLogInitOnce, 0, (dispatch_function_t)MBFLogInit);
    if (os_log_type_enabled((os_log_t)MBFLogComponent, OS_LOG_TYPE_ERROR))
      BTLocalDeviceSetDenylistEnabled_cold_1();
    return 1;
  }
  return v11;
}

uint64_t BTLocalDeviceGetSharingAddresses(uint64_t a1, uint64_t a2, _QWORD *a3, uint64_t a4)
{
  uint64_t MBXpcConnection;
  uint64_t v9;
  xpc_object_t v10;
  uint64_t v11;
  _QWORD v13[8];
  uint64_t v14;
  uint64_t *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t *v19;
  uint64_t v20;
  uint64_t v21;

  if (MBFLogInitOnce != -1)
    dispatch_once_f(&MBFLogInitOnce, 0, (dispatch_function_t)MBFLogInit);
  if (os_log_type_enabled((os_log_t)MBFLogComponent, OS_LOG_TYPE_DEBUG))
    BTLocalDeviceGetSharingAddresses_cold_2();
  MBXpcConnection = getMBXpcConnection(a1);
  if (MBXpcConnection)
  {
    v9 = MBXpcConnection;
    v10 = xpc_dictionary_create(0, 0, 0);
    xpc_dictionary_set_uint64(v10, "kCBMsgArgLocalDeviceID", a1);
    xpc_dictionary_set_uint64(v10, "kCbMsgArgDeviceArrayMaxSize", a4);
    v18 = 0;
    v19 = &v18;
    v20 = 0x2000000000;
    v21 = 0;
    v14 = 0;
    v15 = &v14;
    v16 = 0x2000000000;
    v17 = 0;
    v13[0] = MEMORY[0x1E0C809B0];
    v13[1] = 0x40000000;
    v13[2] = __BTLocalDeviceGetSharingAddresses_block_invoke;
    v13[3] = &unk_1E6B06B90;
    v13[4] = &v18;
    v13[5] = &v14;
    v13[6] = a4;
    v13[7] = a2;
    sendMessageWithReplySync(v9, "kCBMsgIdLocalDeviceGetSharingAddressesMsg", v10, (uint64_t)v13);
    *a3 = v15[3];
    if (v10)
      xpc_release(v10);
    v11 = *((unsigned int *)v19 + 6);
    _Block_object_dispose(&v14, 8);
    _Block_object_dispose(&v18, 8);
  }
  else
  {
    if (MBFLogInitOnce != -1)
      dispatch_once_f(&MBFLogInitOnce, 0, (dispatch_function_t)MBFLogInit);
    if (os_log_type_enabled((os_log_t)MBFLogComponent, OS_LOG_TYPE_ERROR))
      BTLocalDeviceSetDenylistEnabled_cold_1();
    return 1;
  }
  return v11;
}

uint64_t BTLocalDeviceIsSharingEnabled(uint64_t a1, _DWORD *a2)
{
  uint64_t MBXpcConnection;
  uint64_t v5;
  xpc_object_t v6;
  uint64_t v7;
  _QWORD v9[6];
  uint64_t v10;
  uint64_t *v11;
  uint64_t v12;
  int v13;
  uint64_t v14;
  uint64_t *v15;
  uint64_t v16;
  uint64_t v17;

  if (MBFLogInitOnce != -1)
    dispatch_once_f(&MBFLogInitOnce, 0, (dispatch_function_t)MBFLogInit);
  if (os_log_type_enabled((os_log_t)MBFLogComponent, OS_LOG_TYPE_DEBUG))
    BTLocalDeviceIsSharingEnabled_cold_2();
  MBXpcConnection = getMBXpcConnection(a1);
  if (MBXpcConnection)
  {
    v5 = MBXpcConnection;
    v6 = xpc_dictionary_create(0, 0, 0);
    xpc_dictionary_set_uint64(v6, "kCBMsgArgLocalDeviceID", a1);
    v14 = 0;
    v15 = &v14;
    v16 = 0x2000000000;
    v17 = 0;
    v10 = 0;
    v11 = &v10;
    v12 = 0x2000000000;
    v13 = 0;
    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 0x40000000;
    v9[2] = __BTLocalDeviceIsSharingEnabled_block_invoke;
    v9[3] = &unk_1E6B06BB8;
    v9[4] = &v14;
    v9[5] = &v10;
    sendMessageWithReplySync(v5, "kCBMsgIdLocalDeviceIsSharingEnabledMsg", v6, (uint64_t)v9);
    if (v6)
      xpc_release(v6);
    *a2 = *((_DWORD *)v11 + 6);
    v7 = *((unsigned int *)v15 + 6);
    _Block_object_dispose(&v10, 8);
    _Block_object_dispose(&v14, 8);
  }
  else
  {
    if (MBFLogInitOnce != -1)
      dispatch_once_f(&MBFLogInitOnce, 0, (dispatch_function_t)MBFLogInit);
    if (os_log_type_enabled((os_log_t)MBFLogComponent, OS_LOG_TYPE_ERROR))
      BTLocalDeviceSetDenylistEnabled_cold_1();
    return 1;
  }
  return v7;
}

uint64_t BTLocalDeviceDumpExposureNotificationDatabase(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t MBXpcConnection;
  uint64_t v7;
  xpc_object_t v8;
  uint64_t v9;
  _QWORD v11[7];
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t v15;

  if (MBFLogInitOnce != -1)
    dispatch_once_f(&MBFLogInitOnce, 0, (dispatch_function_t)MBFLogInit);
  if (os_log_type_enabled((os_log_t)MBFLogComponent, OS_LOG_TYPE_DEBUG))
    BTLocalDeviceDumpExposureNotificationDatabase_cold_2();
  MBXpcConnection = getMBXpcConnection(a1);
  if (MBXpcConnection)
  {
    v7 = MBXpcConnection;
    v8 = xpc_dictionary_create(0, 0, 0);
    xpc_dictionary_set_uint64(v8, "kCBMsgArgLocalDeviceID", a1);
    xpc_dictionary_set_uint64(v8, "kCBMsgArgBufferSize", a3);
    v12 = 0;
    v13 = &v12;
    v14 = 0x2000000000;
    v15 = 0;
    v11[0] = MEMORY[0x1E0C809B0];
    v11[1] = 0x40000000;
    v11[2] = __BTLocalDeviceDumpExposureNotificationDatabase_block_invoke;
    v11[3] = &unk_1E6B06BE0;
    v11[4] = &v12;
    v11[5] = a2;
    v11[6] = a3;
    sendMessageWithReplySync(v7, "kCBMsgIdLocalDeviceDumpExposureNotificationDatabaseMsg", v8, (uint64_t)v11);
    if (v8)
      xpc_release(v8);
    v9 = *((unsigned int *)v13 + 6);
    _Block_object_dispose(&v12, 8);
  }
  else
  {
    if (MBFLogInitOnce != -1)
      dispatch_once_f(&MBFLogInitOnce, 0, (dispatch_function_t)MBFLogInit);
    if (os_log_type_enabled((os_log_t)MBFLogComponent, OS_LOG_TYPE_ERROR))
      BTAccessoryManagerRemoveCallbacks_cold_1();
    return 1;
  }
  return v9;
}

uint64_t BTLocalDeviceLinkQualityGetData(uint64_t a1, void *a2)
{
  uint64_t MBXpcConnection;
  uint64_t v5;
  xpc_object_t v6;
  uint64_t v7;
  _QWORD v9[6];
  uint64_t v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t *v15;
  uint64_t v16;
  uint64_t v17;

  if (MBFLogInitOnce != -1)
    dispatch_once_f(&MBFLogInitOnce, 0, (dispatch_function_t)MBFLogInit);
  if (os_log_type_enabled((os_log_t)MBFLogComponent, OS_LOG_TYPE_DEBUG))
    BTLocalDeviceLinkQualityGetData_cold_2();
  MBXpcConnection = getMBXpcConnection(a1);
  if (MBXpcConnection)
  {
    v5 = MBXpcConnection;
    v6 = xpc_dictionary_create(0, 0, 0);
    xpc_dictionary_set_uint64(v6, "kCBMsgArgLocalDeviceID", a1);
    v14 = 0;
    v15 = &v14;
    v16 = 0x2000000000;
    v17 = 0;
    v10 = 0;
    v11 = &v10;
    v12 = 0x23800000000;
    bzero(&v13, 0x21AuLL);
    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 0x40000000;
    v9[2] = __BTLocalDeviceLinkQualityGetData_block_invoke;
    v9[3] = &unk_1E6B06C08;
    v9[4] = &v14;
    v9[5] = &v10;
    sendMessageWithReplySync(v5, "kCBMsgIdLocalDeviceLinkQualityGetDataMsg", v6, (uint64_t)v9);
    if (v6)
      xpc_release(v6);
    memcpy(a2, v11 + 3, 0x21AuLL);
    v7 = *((unsigned int *)v15 + 6);
    _Block_object_dispose(&v10, 8);
    _Block_object_dispose(&v14, 8);
  }
  else
  {
    if (MBFLogInitOnce != -1)
      dispatch_once_f(&MBFLogInitOnce, 0, (dispatch_function_t)MBFLogInit);
    if (os_log_type_enabled((os_log_t)MBFLogComponent, OS_LOG_TYPE_ERROR))
      BTLocalDeviceSetDenylistEnabled_cold_1();
    return 1;
  }
  return v7;
}

uint64_t BTLocalDeviceSetCallScreening(uint64_t a1, const unsigned __int8 *a2, unsigned int a3)
{
  NSObject *v6;
  uint64_t MBXpcConnection;
  uint64_t v8;
  xpc_object_t v9;
  uint64_t v10;
  _QWORD v12[5];
  uint8_t buf[8];
  uint8_t *v14;
  uint64_t v15;
  uint64_t v16;

  if (MBFLogInitOnce != -1)
    dispatch_once_f(&MBFLogInitOnce, 0, (dispatch_function_t)MBFLogInit);
  v6 = MBFLogComponent;
  if (os_log_type_enabled((os_log_t)MBFLogComponent, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1B6BF1000, v6, OS_LOG_TYPE_DEFAULT, "BTLocalDeviceSetCallScreening over XPC", buf, 2u);
  }
  MBXpcConnection = getMBXpcConnection(a1);
  if (MBXpcConnection)
  {
    v8 = MBXpcConnection;
    v9 = xpc_dictionary_create(0, 0, 0);
    xpc_dictionary_set_uint64(v9, "kCBMsgArgLocalDeviceID", a1);
    xpc_dictionary_set_uuid(v9, "kCBMsgArgUUID", a2);
    xpc_dictionary_set_uint64(v9, "kCBMsgArgBool", a3);
    *(_QWORD *)buf = 0;
    v14 = buf;
    v15 = 0x2000000000;
    v16 = 0;
    v12[0] = MEMORY[0x1E0C809B0];
    v12[1] = 0x40000000;
    v12[2] = __BTLocalDeviceSetCallScreening_block_invoke;
    v12[3] = &unk_1E6B06C30;
    v12[4] = buf;
    sendMessageWithReplySync(v8, "kCBMsgIdLocalDeviceSetCallScreeningMsg", v9, (uint64_t)v12);
    if (v9)
      xpc_release(v9);
    v10 = *((unsigned int *)v14 + 6);
    _Block_object_dispose(buf, 8);
  }
  else
  {
    if (MBFLogInitOnce != -1)
      dispatch_once_f(&MBFLogInitOnce, 0, (dispatch_function_t)MBFLogInit);
    if (os_log_type_enabled((os_log_t)MBFLogComponent, OS_LOG_TYPE_ERROR))
      BTLocalDeviceSetDenylistEnabled_cold_1();
    return 1;
  }
  return v10;
}

uint64_t localDeviceXpcDisconnectedHandler(uint64_t a1)
{
  if (MBFLogInitOnce != -1)
    dispatch_once_f(&MBFLogInitOnce, 0, (dispatch_function_t)MBFLogInit);
  if (os_log_type_enabled((os_log_t)MBFLogComponent, OS_LOG_TYPE_ERROR))
    localDeviceXpcDisconnectedHandler_cold_1();
  return _localBTLocalDeviceRemoveAllCallbacksByXPCConnection(a1);
}

uint64_t localDeviceXpcMsgHandler(uint64_t a1, const char *a2, xpc_object_t xdict)
{
  uint64_t uint64;
  uint64_t v7;
  uint64_t *Callbacks;
  uint64_t *StatsCallbacks;
  NSObject *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void (*v14)(uint64_t, uint64_t, uint64_t, uint64_t);
  uint64_t v15;
  uint64_t v16;
  uint64_t *v17;
  uint64_t v18;
  uint64_t v19;
  const void *data;
  void (*v21)(uint64_t, uint64_t, uint64_t, const void *, uint64_t);
  uint64_t UserData;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  void (*v26)(uint64_t, uint64_t, uint64_t, uint64_t);
  uint64_t v27;
  uint64_t v28;
  void (*v29)(uint64_t, uint64_t, uint64_t);
  uint64_t v30;
  NSObject *v31;
  const char *v33;
  _BYTE v34[12];
  __int16 v35;
  const char *v36;
  __int16 v37;
  uint64_t v38;
  __int16 v39;
  uint64_t v40;
  __int16 v41;
  uint64_t v42;
  __int16 v43;
  uint64_t v44;
  __int16 v45;
  uint64_t *v46;
  __int16 v47;
  uint64_t *v48;
  uint64_t v49;

  v49 = *MEMORY[0x1E0C80C00];
  uint64 = xpc_dictionary_get_uint64(xdict, "kCBMsgArgLocalDeviceID");
  v7 = xpc_dictionary_get_uint64(xdict, "kCBMsgArgID");
  Callbacks = _localBTLocalDeviceGetCallbacks(uint64, v7);
  StatsCallbacks = _localBTLocalDeviceGetStatsCallbacks(uint64, v7);
  if (MBFLogInitOnce != -1)
    dispatch_once_f(&MBFLogInitOnce, 0, (dispatch_function_t)MBFLogInit);
  v10 = MBFLogComponent;
  if (os_log_type_enabled((os_log_t)MBFLogComponent, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)v34 = 136316674;
    *(_QWORD *)&v34[4] = a2;
    v35 = 2080;
    v36 = (const char *)(a1 + 2080);
    v37 = 2080;
    v38 = a1 + 2336;
    v39 = 2048;
    v40 = uint64;
    v41 = 2048;
    v42 = v7;
    v43 = 2048;
    v44 = (uint64_t)Callbacks;
    v45 = 2048;
    v46 = StatsCallbacks;
    _os_log_debug_impl(&dword_1B6BF1000, v10, OS_LOG_TYPE_DEBUG, "localDeviceXpcMsgHandler msg:%s sessionName:%s serviceName:%s localDeviceId:%llx cbid:%llx cbs:%llx linkCBs:%llx", v34, 0x48u);
  }
  if (!strcmp(a2, "kCBMsgIdLocalDeviceAFHMapChangedEvent"))
  {
    if (Callbacks && Callbacks[2])
    {
      v16 = xpc_dictionary_get_uint64(xdict, "kCBMsgArgBTDevice");
      v17 = StatsCallbacks;
      v18 = a1;
      v19 = xpc_dictionary_get_uint64(xdict, "kCBMsgArgResult");
      *(_QWORD *)v34 = 0;
      data = xpc_dictionary_get_data(xdict, "kCBMsgArgAFHMap", (size_t *)v34);
      v21 = (void (*)(uint64_t, uint64_t, uint64_t, const void *, uint64_t))Callbacks[2];
      UserData = _localBTLocalDeviceGetUserData(uint64, v7);
      v23 = v19;
      a1 = v18;
      StatsCallbacks = v17;
      v21(uint64, v23, v16, data, UserData);
      goto LABEL_18;
    }
    goto LABEL_22;
  }
  if (!strcmp(a2, "kCBMsgIdLocalDeviceLETestStoppedEvent"))
  {
    if (Callbacks && Callbacks[1])
    {
      v24 = xpc_dictionary_get_uint64(xdict, "kCBMsgArgResult");
      v25 = xpc_dictionary_get_uint64(xdict, "kCBMsgArgNumberOfPackets");
      v26 = (void (*)(uint64_t, uint64_t, uint64_t, uint64_t))Callbacks[1];
      v27 = _localBTLocalDeviceGetUserData(uint64, v7);
      v26(uint64, v24, v25, v27);
      goto LABEL_18;
    }
    goto LABEL_22;
  }
  if (!strcmp(a2, "kCBMsgIdLocalDeviceLinkModeChangedEvent"))
  {
    if (StatsCallbacks && *StatsCallbacks)
    {
      v28 = xpc_dictionary_get_uint64(xdict, "kCBMsgArgBTDevice");
      v29 = (void (*)(uint64_t, uint64_t, uint64_t))*StatsCallbacks;
      v30 = _localBTLocalDeviceGetUserData(uint64, v7);
      v29(uint64, v28, v30);
      goto LABEL_18;
    }
LABEL_22:
    v11 = 0;
    goto LABEL_23;
  }
  v11 = 0;
  if (!strcmp(a2, "kCBMsgIdLocalDeviceStatusEvent") && Callbacks)
  {
    if (*Callbacks)
    {
      v12 = xpc_dictionary_get_uint64(xdict, "kCBMsgArgResult");
      v13 = xpc_dictionary_get_uint64(xdict, "kCBMsgArgEvent");
      v14 = (void (*)(uint64_t, uint64_t, uint64_t, uint64_t))*Callbacks;
      v15 = _localBTLocalDeviceGetUserData(uint64, v7);
      v14(uint64, v13, v12, v15);
LABEL_18:
      v11 = 1;
      goto LABEL_23;
    }
    goto LABEL_22;
  }
LABEL_23:
  if (MBFLogInitOnce != -1)
    dispatch_once_f(&MBFLogInitOnce, 0, (dispatch_function_t)MBFLogInit);
  v31 = MBFLogComponent;
  if (os_log_type_enabled((os_log_t)MBFLogComponent, OS_LOG_TYPE_DEBUG))
  {
    v33 = "did not handle";
    *(_DWORD *)v34 = 136316930;
    if ((_DWORD)v11)
      v33 = "handled";
    *(_QWORD *)&v34[4] = v33;
    v35 = 2080;
    v36 = a2;
    v37 = 2080;
    v38 = a1 + 2080;
    v39 = 2080;
    v40 = a1 + 2336;
    v41 = 2048;
    v42 = uint64;
    v43 = 2048;
    v44 = v7;
    v45 = 2048;
    v46 = Callbacks;
    v47 = 2048;
    v48 = StatsCallbacks;
    _os_log_debug_impl(&dword_1B6BF1000, v31, OS_LOG_TYPE_DEBUG, "localDeviceXpcMsgHandler %s %s sessionName:%s serviceName:%s localDeviceId:%llx cbid:%llx cbs:%llx linkCBs:%llx", v34, 0x52u);
  }
  return v11;
}

void OUTLINED_FUNCTION_9_0(void *a1, uint64_t a2, os_log_t log, const char *a4, ...)
{
  va_list va;

  va_start(va, a4);
  _os_log_debug_impl(a1, log, OS_LOG_TYPE_DEBUG, a4, (uint8_t *)va, 0x16u);
}

BOOL _localBTPairingAgentCallbacksRegistered(uint64_t a1, const void *a2)
{
  unint64_t v4;
  BOOL v5;
  _QWORD *v6;

  pthread_mutex_lock(&gLock_3);
  v4 = 0;
  v5 = 1;
  v6 = &gBTPairingAgentCallbackList;
  do
  {
    if (v6[7] == a1 && !memcmp(v6, a2, 0x30uLL))
      break;
    v5 = v4 < 0x3F;
    v6 += 10;
    ++v4;
  }
  while (v4 != 64);
  pthread_mutex_unlock(&gLock_3);
  return v5;
}

uint64_t _localBTPairingAgentAddCallbacks(uint64_t a1, uint64_t a2, __int128 *a3, uint64_t a4, uint64_t a5)
{
  unint64_t v10;
  uint64_t v11;
  char *v12;
  __int128 v13;
  __int128 v14;

  pthread_mutex_lock(&gLock_3);
  v10 = 0xFFFFFFFFFFFFEC00;
  while (*(_QWORD *)((char *)&gBTPairingAgentCallbackList + v10 + 5176)
       || *(_QWORD *)((char *)&gBTPairingAgentCallbackList + v10 + 5184))
  {
    v10 += 80;
    if (!v10)
    {
      v11 = 4;
      goto LABEL_7;
    }
  }
  v11 = 0;
  v12 = (char *)&gBTPairingAgentCallbackList + v10;
  v13 = *a3;
  v14 = a3[1];
  *((_OWORD *)v12 + 322) = a3[2];
  *((_OWORD *)v12 + 321) = v14;
  *((_OWORD *)v12 + 320) = v13;
  *((_QWORD *)v12 + 649) = a4;
  *((_QWORD *)v12 + 647) = a1;
  *((_QWORD *)v12 + 648) = a5;
  *((_QWORD *)v12 + 646) = a2;
LABEL_7:
  pthread_mutex_unlock(&gLock_3);
  return v11;
}

uint64_t _localBTPairingAgentRemoveCallbacks(uint64_t a1)
{
  unint64_t v2;
  _OWORD *v3;

  pthread_mutex_lock(&gLock_3);
  v2 = 0xFFFFFFFFFFFFEC00;
  while (1)
  {
    v3 = (_OWORD *)((char *)&gBTPairingAgentCallbackList + v2);
    if (*(_QWORD *)((char *)&gBTPairingAgentCallbackList + v2 + 5176) == a1)
      break;
    v2 += 80;
    if (!v2)
      goto LABEL_6;
  }
  v3[324] = 0u;
  v3[323] = 0u;
  v3[322] = 0u;
  v3[321] = 0u;
  v3[320] = 0u;
LABEL_6:
  pthread_mutex_unlock(&gLock_3);
  return 0;
}

uint64_t _localBTPairingAgentRemoveCallbacksByXpcConnection(uint64_t a1)
{
  unint64_t v2;
  _OWORD *v3;

  pthread_mutex_lock(&gLock_3);
  v2 = 0xFFFFFFFFFFFFEC00;
  do
  {
    v3 = (_OWORD *)((char *)&gBTPairingAgentCallbackList + v2);
    if (*(_QWORD *)((char *)&gBTPairingAgentCallbackList + v2 + 5168) == a1)
    {
      v3[324] = 0uLL;
      v3[323] = 0uLL;
      v3[322] = 0uLL;
      v3[321] = 0uLL;
      v3[320] = 0uLL;
    }
    v2 += 80;
  }
  while (v2);
  pthread_mutex_unlock(&gLock_3);
  return 0;
}

_QWORD *_localBTPairingAgentGetCallbacks(uint64_t a1, uint64_t a2)
{
  _QWORD *v4;
  uint64_t v5;

  pthread_mutex_lock(&gLock_3);
  v4 = &gBTPairingAgentCallbackList;
  v5 = 64;
  while (v4[7] != a1 || v4[8] != a2)
  {
    v4 += 10;
    if (!--v5)
    {
      v4 = 0;
      break;
    }
  }
  pthread_mutex_unlock(&gLock_3);
  return v4;
}

uint64_t _localBTPairingAgentGetUserData(uint64_t a1)
{
  unint64_t v2;
  uint64_t v3;

  pthread_mutex_lock(&gLock_3);
  v2 = 0xFFFFFFFFFFFFEC00;
  while (*(_QWORD *)((char *)&gBTPairingAgentCallbackList + v2 + 5176) != a1)
  {
    v2 += 80;
    if (!v2)
    {
      v3 = 0;
      goto LABEL_6;
    }
  }
  v3 = *(_QWORD *)((char *)&gBTPairingAgentCallbackList + v2 + 5192);
LABEL_6:
  pthread_mutex_unlock(&gLock_3);
  return v3;
}

uint64_t BTPairingAgentCreate(uint64_t *a1, __int128 *a2, uint64_t a3, _QWORD *a4)
{
  uint64_t SessionHandle;
  uint64_t MBXpcConnection;
  uint64_t v10;
  uint64_t v11;
  xpc_object_t v12;
  uint64_t v13;
  _QWORD v15[6];
  uint64_t v16;
  uint64_t *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t *v21;
  uint64_t v22;
  uint64_t v23;

  if (MBFLogInitOnce != -1)
    dispatch_once_f(&MBFLogInitOnce, 0, (dispatch_function_t)MBFLogInit);
  if (os_log_type_enabled((os_log_t)MBFLogComponent, OS_LOG_TYPE_DEBUG))
    BTPairingAgentCreate_cold_4();
  SessionHandle = getSessionHandle(a1);
  MBXpcConnection = getMBXpcConnection(SessionHandle);
  v20 = 0;
  v21 = &v20;
  v22 = 0x2000000000;
  v23 = 0;
  if (MBXpcConnection)
  {
    v10 = MBXpcConnection;
    v11 = ++gCBID_3;
    v12 = xpc_dictionary_create(0, 0, 0);
    xpc_dictionary_set_uint64(v12, "kCBMsgArgSessionID", SessionHandle);
    xpc_dictionary_set_uint64(v12, "kCBMsgArgID", v11);
    v16 = 0;
    v17 = &v16;
    v18 = 0x2000000000;
    v19 = 0;
    v15[0] = MEMORY[0x1E0C809B0];
    v15[1] = 0x40000000;
    v15[2] = __BTPairingAgentCreate_block_invoke;
    v15[3] = &unk_1E6B06C58;
    v15[4] = &v20;
    v15[5] = &v16;
    sendMessageWithReplySync(v10, "kCBMsgIdPairingAgentCreateMsg", v12, (uint64_t)v15);
    if (v12)
      xpc_release(v12);
    v13 = v17[3];
    if (!v13)
    {
      addXpcMsgHandler(v10, (uint64_t)&pairingAgentXpcCallbacks);
      if (_localBTPairingAgentCallbacksRegistered(v21[3], a2))
      {
        if (MBFLogInitOnce != -1)
          dispatch_once_f(&MBFLogInitOnce, 0, (dispatch_function_t)MBFLogInit);
        if (os_log_type_enabled((os_log_t)MBFLogComponent, OS_LOG_TYPE_DEBUG))
          BTAccessoryManagerAddCallbacks_cold_2();
        v13 = 0;
      }
      else if (_localBTPairingAgentAddCallbacks(v21[3], v10, a2, a3, v11))
      {
        if (MBFLogInitOnce != -1)
          dispatch_once_f(&MBFLogInitOnce, 0, (dispatch_function_t)MBFLogInit);
        if (os_log_type_enabled((os_log_t)MBFLogComponent, OS_LOG_TYPE_DEBUG))
          BTDiscoveryAgentCreate_cold_3();
        v13 = 4;
      }
      else
      {
        *a4 = v21[3];
        v13 = v17[3];
      }
    }
    _Block_object_dispose(&v16, 8);
  }
  else
  {
    if (MBFLogInitOnce != -1)
      dispatch_once_f(&MBFLogInitOnce, 0, (dispatch_function_t)MBFLogInit);
    if (os_log_type_enabled((os_log_t)MBFLogComponent, OS_LOG_TYPE_ERROR))
      BTDeviceFromAddress_cold_1();
    v13 = 1;
  }
  _Block_object_dispose(&v20, 8);
  return v13;
}

uint64_t BTPairingAgentDestroy(uint64_t *a1)
{
  uint64_t MBXpcConnection;
  uint64_t v3;
  xpc_object_t v4;
  uint64_t v5;
  _QWORD v7[5];
  uint64_t v8;
  uint64_t *v9;
  uint64_t v10;
  uint64_t v11;

  if (MBFLogInitOnce != -1)
    dispatch_once_f(&MBFLogInitOnce, 0, (dispatch_function_t)MBFLogInit);
  if (os_log_type_enabled((os_log_t)MBFLogComponent, OS_LOG_TYPE_DEBUG))
    BTPairingAgentDestroy_cold_2();
  MBXpcConnection = getMBXpcConnection(*a1);
  if (MBXpcConnection)
  {
    v3 = MBXpcConnection;
    v4 = xpc_dictionary_create(0, 0, 0);
    xpc_dictionary_set_uint64(v4, "kCBMsgArgPairingAgentID", *a1);
    v8 = 0;
    v9 = &v8;
    v10 = 0x2000000000;
    v11 = 0;
    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 0x40000000;
    v7[2] = __BTPairingAgentDestroy_block_invoke;
    v7[3] = &unk_1E6B06C80;
    v7[4] = &v8;
    sendMessageWithReplySync(v3, "kCBMsgIdPairingAgentDestroyMsg", v4, (uint64_t)v7);
    if (!v9[3])
    {
      _localBTPairingAgentRemoveCallbacks(*a1);
      *a1 = 0;
    }
    if (v4)
      xpc_release(v4);
    v5 = *((unsigned int *)v9 + 6);
    _Block_object_dispose(&v8, 8);
  }
  else
  {
    if (MBFLogInitOnce != -1)
      dispatch_once_f(&MBFLogInitOnce, 0, (dispatch_function_t)MBFLogInit);
    if (os_log_type_enabled((os_log_t)MBFLogComponent, OS_LOG_TYPE_ERROR))
      BTPairingAgentDestroy_cold_1();
    return 1;
  }
  return v5;
}

uint64_t BTPairingAgentStart(uint64_t a1)
{
  uint64_t MBXpcConnection;
  uint64_t v3;
  xpc_object_t v4;
  uint64_t v5;
  _QWORD v7[5];
  uint64_t v8;
  uint64_t *v9;
  uint64_t v10;
  uint64_t v11;

  if (MBFLogInitOnce != -1)
    dispatch_once_f(&MBFLogInitOnce, 0, (dispatch_function_t)MBFLogInit);
  if (os_log_type_enabled((os_log_t)MBFLogComponent, OS_LOG_TYPE_DEBUG))
    BTPairingAgentStart_cold_2();
  MBXpcConnection = getMBXpcConnection(a1);
  if (MBXpcConnection)
  {
    v3 = MBXpcConnection;
    v4 = xpc_dictionary_create(0, 0, 0);
    xpc_dictionary_set_uint64(v4, "kCBMsgArgPairingAgentID", a1);
    v8 = 0;
    v9 = &v8;
    v10 = 0x2000000000;
    v11 = 0;
    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 0x40000000;
    v7[2] = __BTPairingAgentStart_block_invoke;
    v7[3] = &unk_1E6B06CA8;
    v7[4] = &v8;
    sendMessageWithReplySync(v3, "kCBMsgIdPairingAgentStartMsg", v4, (uint64_t)v7);
    if (v4)
      xpc_release(v4);
    v5 = *((unsigned int *)v9 + 6);
    _Block_object_dispose(&v8, 8);
  }
  else
  {
    if (MBFLogInitOnce != -1)
      dispatch_once_f(&MBFLogInitOnce, 0, (dispatch_function_t)MBFLogInit);
    if (os_log_type_enabled((os_log_t)MBFLogComponent, OS_LOG_TYPE_ERROR))
      BTAccessoryManagerRegisterDevice_cold_1();
    return 1;
  }
  return v5;
}

uint64_t BTPairingAgentStop(uint64_t a1)
{
  uint64_t MBXpcConnection;
  uint64_t v3;
  xpc_object_t v4;
  uint64_t v5;
  _QWORD v7[5];
  uint64_t v8;
  uint64_t *v9;
  uint64_t v10;
  uint64_t v11;

  if (MBFLogInitOnce != -1)
    dispatch_once_f(&MBFLogInitOnce, 0, (dispatch_function_t)MBFLogInit);
  if (os_log_type_enabled((os_log_t)MBFLogComponent, OS_LOG_TYPE_DEBUG))
    BTPairingAgentStop_cold_2();
  MBXpcConnection = getMBXpcConnection(a1);
  if (MBXpcConnection)
  {
    v3 = MBXpcConnection;
    v4 = xpc_dictionary_create(0, 0, 0);
    xpc_dictionary_set_uint64(v4, "kCBMsgArgPairingAgentID", a1);
    v8 = 0;
    v9 = &v8;
    v10 = 0x2000000000;
    v11 = 0;
    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 0x40000000;
    v7[2] = __BTPairingAgentStop_block_invoke;
    v7[3] = &unk_1E6B06CD0;
    v7[4] = &v8;
    sendMessageWithReplySync(v3, "kCBMsgIdPairingAgentStopMsg", v4, (uint64_t)v7);
    if (v4)
      xpc_release(v4);
    v5 = *((unsigned int *)v9 + 6);
    _Block_object_dispose(&v8, 8);
  }
  else
  {
    if (MBFLogInitOnce != -1)
      dispatch_once_f(&MBFLogInitOnce, 0, (dispatch_function_t)MBFLogInit);
    if (os_log_type_enabled((os_log_t)MBFLogComponent, OS_LOG_TYPE_ERROR))
      BTAccessoryManagerRegisterDevice_cold_1();
    return 1;
  }
  return v5;
}

uint64_t BTPairingAgentCancelPairing(uint64_t a1)
{
  uint64_t MBXpcConnection;
  uint64_t v3;
  xpc_object_t v4;
  uint64_t v5;
  _QWORD v7[5];
  uint64_t v8;
  uint64_t *v9;
  uint64_t v10;
  uint64_t v11;

  if (MBFLogInitOnce != -1)
    dispatch_once_f(&MBFLogInitOnce, 0, (dispatch_function_t)MBFLogInit);
  if (os_log_type_enabled((os_log_t)MBFLogComponent, OS_LOG_TYPE_DEBUG))
    BTPairingAgentCancelPairing_cold_2();
  MBXpcConnection = getMBXpcConnection(a1);
  if (MBXpcConnection)
  {
    v3 = MBXpcConnection;
    v4 = xpc_dictionary_create(0, 0, 0);
    xpc_dictionary_set_uint64(v4, "kCBMsgArgPairingAgentID", a1);
    v8 = 0;
    v9 = &v8;
    v10 = 0x2000000000;
    v11 = 0;
    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 0x40000000;
    v7[2] = __BTPairingAgentCancelPairing_block_invoke;
    v7[3] = &unk_1E6B06CF8;
    v7[4] = &v8;
    sendMessageWithReplySync(v3, "kCBMsgIdPairingAgentCancelPairingMsg", v4, (uint64_t)v7);
    if (v4)
      xpc_release(v4);
    v5 = *((unsigned int *)v9 + 6);
    _Block_object_dispose(&v8, 8);
  }
  else
  {
    if (MBFLogInitOnce != -1)
      dispatch_once_f(&MBFLogInitOnce, 0, (dispatch_function_t)MBFLogInit);
    if (os_log_type_enabled((os_log_t)MBFLogComponent, OS_LOG_TYPE_ERROR))
      BTAccessoryManagerRegisterDevice_cold_1();
    return 1;
  }
  return v5;
}

uint64_t BTPairingAgentSetPincode(uint64_t a1, uint64_t a2, const char *a3)
{
  uint64_t MBXpcConnection;
  uint64_t v7;
  xpc_object_t v8;
  uint64_t v9;
  _QWORD v11[5];
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t v15;

  if (MBFLogInitOnce != -1)
    dispatch_once_f(&MBFLogInitOnce, 0, (dispatch_function_t)MBFLogInit);
  if (os_log_type_enabled((os_log_t)MBFLogComponent, OS_LOG_TYPE_DEBUG))
    BTPairingAgentSetPincode_cold_2();
  MBXpcConnection = getMBXpcConnection(a1);
  if (MBXpcConnection)
  {
    v7 = MBXpcConnection;
    v8 = xpc_dictionary_create(0, 0, 0);
    xpc_dictionary_set_uint64(v8, "kCBMsgArgPairingAgentID", a1);
    xpc_dictionary_set_uint64(v8, "kCBMsgArgBTDevice", a2);
    xpc_dictionary_set_string(v8, "kCBMsgIdPairingAgentPincode", a3);
    v12 = 0;
    v13 = &v12;
    v14 = 0x2000000000;
    v15 = 0;
    v11[0] = MEMORY[0x1E0C809B0];
    v11[1] = 0x40000000;
    v11[2] = __BTPairingAgentSetPincode_block_invoke;
    v11[3] = &unk_1E6B06D20;
    v11[4] = &v12;
    sendMessageWithReplySync(v7, "kCBMsgIdPairingAgentSetPincodeMsg", v8, (uint64_t)v11);
    if (v8)
      xpc_release(v8);
    v9 = *((unsigned int *)v13 + 6);
    _Block_object_dispose(&v12, 8);
  }
  else
  {
    if (MBFLogInitOnce != -1)
      dispatch_once_f(&MBFLogInitOnce, 0, (dispatch_function_t)MBFLogInit);
    if (os_log_type_enabled((os_log_t)MBFLogComponent, OS_LOG_TYPE_ERROR))
      BTAccessoryManagerRegisterDevice_cold_1();
    return 1;
  }
  return v9;
}

uint64_t BTPairingAgentAcceptSSP(uint64_t a1, uint64_t a2, int a3)
{
  uint64_t MBXpcConnection;
  uint64_t v7;
  xpc_object_t v8;
  uint64_t v9;
  _QWORD v11[5];
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t v15;

  if (MBFLogInitOnce != -1)
    dispatch_once_f(&MBFLogInitOnce, 0, (dispatch_function_t)MBFLogInit);
  if (os_log_type_enabled((os_log_t)MBFLogComponent, OS_LOG_TYPE_DEBUG))
    BTPairingAgentAcceptSSP_cold_2();
  MBXpcConnection = getMBXpcConnection(a1);
  if (MBXpcConnection)
  {
    v7 = MBXpcConnection;
    v8 = xpc_dictionary_create(0, 0, 0);
    xpc_dictionary_set_uint64(v8, "kCBMsgArgPairingAgentID", a1);
    xpc_dictionary_set_uint64(v8, "kCBMsgArgBTDevice", a2);
    xpc_dictionary_set_uint64(v8, "kCBMsgArgError", a3);
    v12 = 0;
    v13 = &v12;
    v14 = 0x2000000000;
    v15 = 0;
    v11[0] = MEMORY[0x1E0C809B0];
    v11[1] = 0x40000000;
    v11[2] = __BTPairingAgentAcceptSSP_block_invoke;
    v11[3] = &unk_1E6B06D48;
    v11[4] = &v12;
    sendMessageWithReplySync(v7, "kCBMsgIdPairingAgentAcceptSSPMsg", v8, (uint64_t)v11);
    if (v8)
      xpc_release(v8);
    v9 = *((unsigned int *)v13 + 6);
    _Block_object_dispose(&v12, 8);
  }
  else
  {
    if (MBFLogInitOnce != -1)
      dispatch_once_f(&MBFLogInitOnce, 0, (dispatch_function_t)MBFLogInit);
    if (os_log_type_enabled((os_log_t)MBFLogComponent, OS_LOG_TYPE_ERROR))
      BTAccessoryManagerRegisterDevice_cold_1();
    return 1;
  }
  return v9;
}

uint64_t BTPairingAgentDeletePairedDevice(uint64_t a1, uint64_t a2)
{
  uint64_t MBXpcConnection;
  uint64_t v5;
  xpc_object_t v6;
  uint64_t v7;
  _QWORD v9[5];
  uint64_t v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t v13;

  if (MBFLogInitOnce != -1)
    dispatch_once_f(&MBFLogInitOnce, 0, (dispatch_function_t)MBFLogInit);
  if (os_log_type_enabled((os_log_t)MBFLogComponent, OS_LOG_TYPE_DEBUG))
    BTPairingAgentDeletePairedDevice_cold_2();
  MBXpcConnection = getMBXpcConnection(a1);
  if (MBXpcConnection)
  {
    v5 = MBXpcConnection;
    v6 = xpc_dictionary_create(0, 0, 0);
    xpc_dictionary_set_uint64(v6, "kCBMsgArgPairingAgentID", a1);
    xpc_dictionary_set_uint64(v6, "kCBMsgArgBTDevice", a2);
    v10 = 0;
    v11 = &v10;
    v12 = 0x2000000000;
    v13 = 0;
    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 0x40000000;
    v9[2] = __BTPairingAgentDeletePairedDevice_block_invoke;
    v9[3] = &unk_1E6B06D70;
    v9[4] = &v10;
    sendMessageWithReplySync(v5, "kCBMsgIdPairingAgentDeletePairedDeviceMsg", v6, (uint64_t)v9);
    if (v6)
      xpc_release(v6);
    v7 = *((unsigned int *)v11 + 6);
    _Block_object_dispose(&v10, 8);
  }
  else
  {
    if (MBFLogInitOnce != -1)
      dispatch_once_f(&MBFLogInitOnce, 0, (dispatch_function_t)MBFLogInit);
    if (os_log_type_enabled((os_log_t)MBFLogComponent, OS_LOG_TYPE_ERROR))
      BTAccessoryManagerRegisterDevice_cold_1();
    return 1;
  }
  return v7;
}

uint64_t BTPairingAgentSetIOCapability(uint64_t a1, unsigned int a2)
{
  uint64_t MBXpcConnection;
  uint64_t v5;
  xpc_object_t v6;
  uint64_t v7;
  _QWORD v9[5];
  uint64_t v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t v13;

  if (MBFLogInitOnce != -1)
    dispatch_once_f(&MBFLogInitOnce, 0, (dispatch_function_t)MBFLogInit);
  if (os_log_type_enabled((os_log_t)MBFLogComponent, OS_LOG_TYPE_DEBUG))
    BTPairingAgentSetIOCapability_cold_2();
  MBXpcConnection = getMBXpcConnection(a1);
  if (MBXpcConnection)
  {
    v5 = MBXpcConnection;
    v6 = xpc_dictionary_create(0, 0, 0);
    xpc_dictionary_set_uint64(v6, "kCBMsgArgPairingAgentID", a1);
    xpc_dictionary_set_uint64(v6, "kCBMsgArgIOCapabilities", a2);
    v10 = 0;
    v11 = &v10;
    v12 = 0x2000000000;
    v13 = 0;
    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 0x40000000;
    v9[2] = __BTPairingAgentSetIOCapability_block_invoke;
    v9[3] = &unk_1E6B06D98;
    v9[4] = &v10;
    sendMessageWithReplySync(v5, "kCBMsgIdPairingAgentSetIOCapabilityMsg", v6, (uint64_t)v9);
    if (v6)
      xpc_release(v6);
    v7 = *((unsigned int *)v11 + 6);
    _Block_object_dispose(&v10, 8);
  }
  else
  {
    if (MBFLogInitOnce != -1)
      dispatch_once_f(&MBFLogInitOnce, 0, (dispatch_function_t)MBFLogInit);
    if (os_log_type_enabled((os_log_t)MBFLogComponent, OS_LOG_TYPE_ERROR))
      BTAccessoryManagerRegisterDevice_cold_1();
    return 1;
  }
  return v7;
}

uint64_t BTPairingAgentClearOOBDataForDevice(uint64_t a1, uint64_t a2)
{
  uint64_t MBXpcConnection;
  uint64_t v5;
  xpc_object_t v6;
  uint64_t v7;
  _QWORD v9[5];
  uint64_t v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t v13;

  if (MBFLogInitOnce != -1)
    dispatch_once_f(&MBFLogInitOnce, 0, (dispatch_function_t)MBFLogInit);
  if (os_log_type_enabled((os_log_t)MBFLogComponent, OS_LOG_TYPE_DEBUG))
    BTPairingAgentClearOOBDataForDevice_cold_2();
  MBXpcConnection = getMBXpcConnection(a1);
  if (MBXpcConnection)
  {
    v5 = MBXpcConnection;
    v6 = xpc_dictionary_create(0, 0, 0);
    xpc_dictionary_set_uint64(v6, "kCBMsgArgPairingAgentID", a1);
    xpc_dictionary_set_uint64(v6, "kCBMsgArgBTDevice", a2);
    v10 = 0;
    v11 = &v10;
    v12 = 0x2000000000;
    v13 = 0;
    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 0x40000000;
    v9[2] = __BTPairingAgentClearOOBDataForDevice_block_invoke;
    v9[3] = &unk_1E6B06DC0;
    v9[4] = &v10;
    sendMessageWithReplySync(v5, "kCBMsgIdPairingAgentClearOOBDataForDeviceMsg", v6, (uint64_t)v9);
    if (v6)
      xpc_release(v6);
    v7 = *((unsigned int *)v11 + 6);
    _Block_object_dispose(&v10, 8);
  }
  else
  {
    if (MBFLogInitOnce != -1)
      dispatch_once_f(&MBFLogInitOnce, 0, (dispatch_function_t)MBFLogInit);
    if (os_log_type_enabled((os_log_t)MBFLogComponent, OS_LOG_TYPE_ERROR))
      BTAccessoryManagerRegisterDevice_cold_1();
    return 1;
  }
  return v7;
}

uint64_t BTPairingAgentSetOOBDataForDevice(uint64_t a1, uint64_t a2, const void *a3, const void *a4, const void *a5, const void *a6)
{
  uint64_t MBXpcConnection;
  uint64_t v13;
  xpc_object_t v14;
  uint64_t v15;
  _QWORD v17[5];
  uint64_t v18;
  uint64_t *v19;
  uint64_t v20;
  uint64_t v21;

  if (MBFLogInitOnce != -1)
    dispatch_once_f(&MBFLogInitOnce, 0, (dispatch_function_t)MBFLogInit);
  if (os_log_type_enabled((os_log_t)MBFLogComponent, OS_LOG_TYPE_DEBUG))
    BTPairingAgentSetOOBDataForDevice_cold_2();
  MBXpcConnection = getMBXpcConnection(a1);
  if (MBXpcConnection)
  {
    v13 = MBXpcConnection;
    v14 = xpc_dictionary_create(0, 0, 0);
    xpc_dictionary_set_uint64(v14, "kCBMsgArgPairingAgentID", a1);
    xpc_dictionary_set_uint64(v14, "kCBMsgArgBTDevice", a2);
    if (a3)
      xpc_dictionary_set_data(v14, "kCBMsgArgC192", a3, 0x10uLL);
    if (a5)
      xpc_dictionary_set_data(v14, "kCBMsgArgC256", a5, 0x10uLL);
    if (a4)
      xpc_dictionary_set_data(v14, "kCBMsgArgR192", a4, 0x10uLL);
    if (a6)
      xpc_dictionary_set_data(v14, "kCBMsgArgR256", a6, 0x10uLL);
    v18 = 0;
    v19 = &v18;
    v20 = 0x2000000000;
    v21 = 0;
    v17[0] = MEMORY[0x1E0C809B0];
    v17[1] = 0x40000000;
    v17[2] = __BTPairingAgentSetOOBDataForDevice_block_invoke;
    v17[3] = &unk_1E6B06DE8;
    v17[4] = &v18;
    sendMessageWithReplySync(v13, "kCBMsgIdPairingAgentSetOOBDataForDeviceMsg", v14, (uint64_t)v17);
    if (v14)
      xpc_release(v14);
    v15 = *((unsigned int *)v19 + 6);
    _Block_object_dispose(&v18, 8);
  }
  else
  {
    if (MBFLogInitOnce != -1)
      dispatch_once_f(&MBFLogInitOnce, 0, (dispatch_function_t)MBFLogInit);
    if (os_log_type_enabled((os_log_t)MBFLogComponent, OS_LOG_TYPE_ERROR))
      BTAccessoryManagerRegisterDevice_cold_1();
    return 1;
  }
  return v15;
}

uint64_t BTPairingAgentGetLocalOOBData(uint64_t a1)
{
  uint64_t MBXpcConnection;
  uint64_t v3;
  xpc_object_t v4;
  uint64_t v5;
  _QWORD v7[5];
  uint64_t v8;
  uint64_t *v9;
  uint64_t v10;
  uint64_t v11;

  if (MBFLogInitOnce != -1)
    dispatch_once_f(&MBFLogInitOnce, 0, (dispatch_function_t)MBFLogInit);
  if (os_log_type_enabled((os_log_t)MBFLogComponent, OS_LOG_TYPE_DEBUG))
    BTPairingAgentGetLocalOOBData_cold_2();
  MBXpcConnection = getMBXpcConnection(a1);
  if (MBXpcConnection)
  {
    v3 = MBXpcConnection;
    v4 = xpc_dictionary_create(0, 0, 0);
    xpc_dictionary_set_uint64(v4, "kCBMsgArgPairingAgentID", a1);
    v8 = 0;
    v9 = &v8;
    v10 = 0x2000000000;
    v11 = 0;
    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 0x40000000;
    v7[2] = __BTPairingAgentGetLocalOOBData_block_invoke;
    v7[3] = &unk_1E6B06E10;
    v7[4] = &v8;
    sendMessageWithReplySync(v3, "kCBMsgIdPairingAgentGetLocalOOBDataMsg", v4, (uint64_t)v7);
    if (v4)
      xpc_release(v4);
    v5 = *((unsigned int *)v9 + 6);
    _Block_object_dispose(&v8, 8);
  }
  else
  {
    if (MBFLogInitOnce != -1)
      dispatch_once_f(&MBFLogInitOnce, 0, (dispatch_function_t)MBFLogInit);
    if (os_log_type_enabled((os_log_t)MBFLogComponent, OS_LOG_TYPE_ERROR))
      BTAccessoryManagerRegisterDevice_cold_1();
    return 1;
  }
  return v5;
}

uint64_t pairingAgentXpcDisconnectedHandler(uint64_t a1)
{
  if (MBFLogInitOnce != -1)
    dispatch_once_f(&MBFLogInitOnce, 0, (dispatch_function_t)MBFLogInit);
  if (os_log_type_enabled((os_log_t)MBFLogComponent, OS_LOG_TYPE_ERROR))
    pairingAgentXpcDisconnectedHandler_cold_1();
  return _localBTPairingAgentRemoveCallbacksByXpcConnection(a1);
}

uint64_t pairingAgentXpcMsgHandler(uint64_t a1, const char *a2, xpc_object_t xdict)
{
  uint64_t uint64;
  uint64_t v7;
  _QWORD *Callbacks;
  NSObject *v9;
  uint64_t v10;
  const void *data;
  const void *v12;
  uint64_t v13;
  const void *v14;
  const void *v15;
  const void *v16;
  const void *v17;
  const void *v18;
  void (*v19)(uint64_t, const void *, const void *, const void *, const void *, uint64_t);
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  void (*v25)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t);
  uint64_t UserData;
  uint64_t v27;
  unsigned __int8 v28;
  uint64_t v29;
  void (*v30)(uint64_t, uint64_t, _QWORD, uint64_t);
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  void (*v34)(uint64_t, uint64_t, uint64_t, uint64_t);
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  void (*v39)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t);
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  NSObject *v43;
  const char *v45;
  const void *v46;
  size_t v47;
  size_t v48;
  size_t v49;
  _BYTE length[12];
  __int16 v51;
  const char *v52;
  __int16 v53;
  uint64_t v54;
  __int16 v55;
  uint64_t v56;
  __int16 v57;
  uint64_t v58;
  __int16 v59;
  _QWORD *v60;
  __int16 v61;
  _QWORD *v62;
  uint64_t v63;

  v63 = *MEMORY[0x1E0C80C00];
  uint64 = xpc_dictionary_get_uint64(xdict, "kCBMsgArgPairingAgentID");
  v7 = xpc_dictionary_get_uint64(xdict, "kCBMsgArgID");
  Callbacks = _localBTPairingAgentGetCallbacks(uint64, v7);
  if (MBFLogInitOnce != -1)
    dispatch_once_f(&MBFLogInitOnce, 0, (dispatch_function_t)MBFLogInit);
  v9 = MBFLogComponent;
  if (os_log_type_enabled((os_log_t)MBFLogComponent, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)length = 136316418;
    *(_QWORD *)&length[4] = a2;
    v51 = 2080;
    v52 = (const char *)(a1 + 2080);
    v53 = 2080;
    v54 = a1 + 2336;
    v55 = 2048;
    v56 = uint64;
    v57 = 2048;
    v58 = v7;
    v59 = 2048;
    v60 = Callbacks;
    _os_log_debug_impl(&dword_1B6BF1000, v9, OS_LOG_TYPE_DEBUG, "pairingAgentXpcMsgHandler msg:%s sessionName:%s serviceName:%s agentID:%llx cbid:%llx cbs:%llx", length, 0x3Eu);
  }
  if (!strcmp(a2, "kCBMsgIdPairingAgentStatusEvent"))
  {
    if (!Callbacks || !*Callbacks)
      goto LABEL_35;
    v21 = xpc_dictionary_get_uint64(xdict, "kCBMsgArgResult");
    v22 = a1;
    v23 = xpc_dictionary_get_uint64(xdict, "kCBMsgArgBTDevice");
    v24 = xpc_dictionary_get_uint64(xdict, "kCBMsgArgEvent");
    v25 = (void (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))*Callbacks;
    UserData = _localBTPairingAgentGetUserData(uint64);
    v27 = v23;
    a1 = v22;
    v25(uint64, v24, v27, v21, UserData);
    goto LABEL_34;
  }
  if (!strcmp(a2, "kCBMsgIdPairingAgentPincode"))
  {
    if (!Callbacks || !Callbacks[1])
      goto LABEL_35;
    v28 = xpc_dictionary_get_uint64(xdict, "kCBMsgArgMinLength");
    v29 = xpc_dictionary_get_uint64(xdict, "kCBMsgArgBTDevice");
    v30 = (void (*)(uint64_t, uint64_t, _QWORD, uint64_t))Callbacks[1];
    v31 = _localBTPairingAgentGetUserData(uint64);
    v30(uint64, v29, v28, v31);
    goto LABEL_34;
  }
  if (!strcmp(a2, "kCBMsgIdPairingAgentAuthorization"))
  {
    if (Callbacks && Callbacks[2])
    {
      v32 = xpc_dictionary_get_uint64(xdict, "kCBMsgArgBTDevice");
      v33 = xpc_dictionary_get_uint64(xdict, "kCBMsgArgServices");
      v34 = (void (*)(uint64_t, uint64_t, uint64_t, uint64_t))Callbacks[2];
LABEL_33:
      v42 = _localBTPairingAgentGetUserData(uint64);
      v34(uint64, v32, v33, v42);
      goto LABEL_34;
    }
LABEL_35:
    v10 = 0;
    goto LABEL_36;
  }
  if (!strcmp(a2, "kCBMsgIdPairingAgentUserConfirmation"))
  {
    if (!Callbacks || !Callbacks[3])
      goto LABEL_35;
    v35 = xpc_dictionary_get_uint64(xdict, "kCBMsgArgBTDevice");
    v36 = a1;
    v37 = xpc_dictionary_get_uint64(xdict, "kCBMsgArgValue");
    v38 = xpc_dictionary_get_uint64(xdict, "kCBMsgArgMITM");
    v39 = (void (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))Callbacks[3];
    v40 = _localBTPairingAgentGetUserData(uint64);
    v41 = v37;
    a1 = v36;
    v39(uint64, v35, v41, v38, v40);
LABEL_34:
    v10 = 1;
    goto LABEL_36;
  }
  if (!strcmp(a2, "kCBMsgIdPairingAgentPassKeyDisplay"))
  {
    if (Callbacks && Callbacks[4])
    {
      v32 = xpc_dictionary_get_uint64(xdict, "kCBMsgArgBTDevice");
      v33 = xpc_dictionary_get_uint64(xdict, "kCBMsgArgValue");
      v34 = (void (*)(uint64_t, uint64_t, uint64_t, uint64_t))Callbacks[4];
      goto LABEL_33;
    }
    goto LABEL_35;
  }
  v10 = 0;
  if (strcmp(a2, "kCBMsgIdPairingAgentOOBDataReady") || !Callbacks)
    goto LABEL_36;
  if (!Callbacks[5])
    goto LABEL_35;
  *(_QWORD *)length = 0;
  data = xpc_dictionary_get_data(xdict, "kCBMsgArgC192", (size_t *)length);
  if (*(_QWORD *)length != 16)
  {
    if (MBFLogInitOnce != -1)
      dispatch_once_f(&MBFLogInitOnce, 0, (dispatch_function_t)MBFLogInit);
    if (os_log_type_enabled((os_log_t)MBFLogComponent, OS_LOG_TYPE_FAULT))
      pairingAgentXpcMsgHandler_cold_4();
    return 0;
  }
  v12 = data;
  v13 = a1;
  v49 = 0;
  v14 = xpc_dictionary_get_data(xdict, "kCBMsgArgC256", &v49);
  if (v49 != 16)
  {
    if (MBFLogInitOnce != -1)
      dispatch_once_f(&MBFLogInitOnce, 0, (dispatch_function_t)MBFLogInit);
    if (os_log_type_enabled((os_log_t)MBFLogComponent, OS_LOG_TYPE_FAULT))
      pairingAgentXpcMsgHandler_cold_3();
    return 0;
  }
  v15 = v14;
  v48 = 0;
  v16 = xpc_dictionary_get_data(xdict, "kCBMsgArgR192", &v48);
  if (v48 != 16)
  {
    if (MBFLogInitOnce != -1)
      dispatch_once_f(&MBFLogInitOnce, 0, (dispatch_function_t)MBFLogInit);
    if (os_log_type_enabled((os_log_t)MBFLogComponent, OS_LOG_TYPE_FAULT))
      pairingAgentXpcMsgHandler_cold_2();
    return 0;
  }
  v46 = v16;
  v47 = 0;
  v17 = xpc_dictionary_get_data(xdict, "kCBMsgArgR256", &v47);
  if (v47 != 16)
  {
    if (MBFLogInitOnce != -1)
      dispatch_once_f(&MBFLogInitOnce, 0, (dispatch_function_t)MBFLogInit);
    if (os_log_type_enabled((os_log_t)MBFLogComponent, OS_LOG_TYPE_FAULT))
      pairingAgentXpcMsgHandler_cold_1();
    return 0;
  }
  v18 = v17;
  v19 = (void (*)(uint64_t, const void *, const void *, const void *, const void *, uint64_t))Callbacks[5];
  v20 = _localBTPairingAgentGetUserData(uint64);
  v19(uint64, v12, v46, v15, v18, v20);
  v10 = 1;
  a1 = v13;
LABEL_36:
  if (MBFLogInitOnce != -1)
    dispatch_once_f(&MBFLogInitOnce, 0, (dispatch_function_t)MBFLogInit);
  v43 = MBFLogComponent;
  if (os_log_type_enabled((os_log_t)MBFLogComponent, OS_LOG_TYPE_DEBUG))
  {
    v45 = "did not handle";
    *(_DWORD *)length = 136316674;
    if ((_DWORD)v10)
      v45 = "handled";
    *(_QWORD *)&length[4] = v45;
    v51 = 2080;
    v52 = a2;
    v53 = 2080;
    v54 = a1 + 2080;
    v55 = 2080;
    v56 = a1 + 2336;
    v57 = 2048;
    v58 = uint64;
    v59 = 2048;
    v60 = (_QWORD *)v7;
    v61 = 2048;
    v62 = Callbacks;
    _os_log_debug_impl(&dword_1B6BF1000, v43, OS_LOG_TYPE_DEBUG, "pairingAgentXpcMsgHandler %s %s sessionName:%s serviceName:%s agentID:%llx cbid:%llx cbs:%llx", length, 0x48u);
  }
  return v10;
}

void OUTLINED_FUNCTION_8_1(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_fault_impl(a1, a2, OS_LOG_TYPE_FAULT, a4, &a9, 2u);
}

uint64_t removeFWSession(uint64_t a1)
{
  unint64_t v2;
  unint64_t v3;
  uint64_t v4;

  if (!a1)
    return 3;
  pthread_mutex_lock(&gLock_4);
  v2 = 0;
  do
    v3 = v2++;
  while (v3 <= 0x63 && gFWSessionList[v3] != a1);
  if (v3 > 0x63)
  {
    v4 = 7;
  }
  else
  {
    v4 = 0;
    --sessionCount;
    gFWSessionList[v2 - 1] = 0;
  }
  pthread_mutex_unlock(&gLock_4);
  return v4;
}

BOOL isSessionValid(int a1)
{
  unint64_t v2;
  uint64_t v3;
  BOOL v4;
  _QWORD *v5;

  pthread_mutex_lock(&gLock_4);
  v2 = 0;
  v3 = a1 & 0xFFFF0000;
  v4 = 1;
  do
  {
    v5 = (_QWORD *)gFWSessionList[v2];
    if (v5 && *v5 == v3)
      break;
    v4 = v2++ < 0x63;
  }
  while (v2 != 100);
  pthread_mutex_unlock(&gLock_4);
  return v4;
}

uint64_t getFWSessionByXpcConnection(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;

  pthread_mutex_lock(&gLock_4);
  v2 = 0;
  while (1)
  {
    v3 = gFWSessionList[v2];
    if (v3)
    {
      if (*(_QWORD *)(v3 + 88) == a1)
        break;
    }
    if (++v2 == 100)
    {
      v3 = 0;
      break;
    }
  }
  pthread_mutex_unlock(&gLock_4);
  return v3;
}

uint64_t getFirstFWSession()
{
  uint64_t v0;
  uint64_t v1;

  pthread_mutex_lock(&gLock_4);
  v0 = 0;
  do
  {
    v1 = gFWSessionList[v0];
    if (v1)
      break;
  }
  while (v0++ != 99);
  pthread_mutex_unlock(&gLock_4);
  return v1;
}

uint64_t removeXpcMsgHandler(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;

  v2 = 3;
  if (a1 && a2)
  {
    v3 = 0;
    while (*(_QWORD *)(a1 + 8 + v3) != a2)
    {
      v3 += 8;
      if (v3 == 2048)
        return 3;
    }
    v2 = 0;
    *(_QWORD *)(a1 + v3 + 8) = 0;
  }
  return v2;
}

uint64_t BTSessionDetachWithQueue(uint64_t *a1)
{
  uint64_t v2;

  if (!a1)
    return 3;
  v2 = *a1;
  if (!*a1)
    return 3;
  if (!isDispatchSessionValid(*a1))
  {
    if (MBFLogInitOnce != -1)
      dispatch_once_f(&MBFLogInitOnce, 0, (dispatch_function_t)MBFLogInit);
    if (os_log_type_enabled((os_log_t)MBFLogComponent, OS_LOG_TYPE_DEBUG))
      BTSessionDetachWithQueue_cold_2();
    return 3;
  }
  *a1 = 0;
  if (MBFLogInitOnce != -1)
    dispatch_once_f(&MBFLogInitOnce, 0, (dispatch_function_t)MBFLogInit);
  if (os_log_type_enabled((os_log_t)MBFLogComponent, OS_LOG_TYPE_DEBUG))
    BTSessionDetachWithQueue_cold_1();
  notifyStubsOfDisconnection(*(_QWORD *)(v2 + 88));
  *(_DWORD *)(v2 + 84) = 1;
  disconnect(*(_QWORD *)(v2 + 88));
  return 0;
}

void notifyStubsOfDisconnection(uint64_t a1)
{
  uint64_t FWSessionByXpcConnection;
  uint64_t v3;
  uint64_t i;
  void (**v5)(uint64_t);

  FWSessionByXpcConnection = getFWSessionByXpcConnection(a1);
  if (FWSessionByXpcConnection)
  {
    v3 = FWSessionByXpcConnection;
    for (i = 8; i != 2056; i += 8)
    {
      v5 = *(void (***)(uint64_t))(*(_QWORD *)(v3 + 88) + i);
      if (v5)
        (*v5)(a1);
    }
  }
  else
  {
    if (MBFLogInitOnce != -1)
      dispatch_once_f(&MBFLogInitOnce, 0, (dispatch_function_t)MBFLogInit);
    if (os_log_type_enabled((os_log_t)MBFLogComponent, OS_LOG_TYPE_DEBUG))
      notifyStubsOfDisconnection_cold_1();
  }
}

void xpcConnectionDidReset(uint64_t a1)
{
  uint64_t FWSessionByXpcConnection;
  uint64_t v3;

  if (MBFLogInitOnce != -1)
    dispatch_once_f(&MBFLogInitOnce, 0, (dispatch_function_t)MBFLogInit);
  if (os_log_type_enabled((os_log_t)MBFLogComponent, OS_LOG_TYPE_DEBUG))
    xpcConnectionDidReset_cold_3();
  FWSessionByXpcConnection = getFWSessionByXpcConnection(a1);
  if (FWSessionByXpcConnection)
  {
    v3 = FWSessionByXpcConnection;
    notifyStubsOfDisconnection(a1);
    *(_DWORD *)(v3 + 84) = 2;
    if (MBFLogInitOnce != -1)
      dispatch_once_f(&MBFLogInitOnce, 0, (dispatch_function_t)MBFLogInit);
    if (os_log_type_enabled((os_log_t)MBFLogComponent, OS_LOG_TYPE_DEBUG))
      xpcConnectionDidReset_cold_2();
    disconnect(*(_QWORD *)(v3 + 88));
  }
  else
  {
    if (MBFLogInitOnce != -1)
      dispatch_once_f(&MBFLogInitOnce, 0, (dispatch_function_t)MBFLogInit);
    if (os_log_type_enabled((os_log_t)MBFLogComponent, OS_LOG_TYPE_ERROR))
      xpcConnectionDidReset_cold_1();
  }
}

void xpcConnectionInvalid(uint64_t a1)
{
  void (*FWSessionByXpcConnection)(_QWORD);
  void (*v3[5])(_QWORD);

  if (MBFLogInitOnce != -1)
    dispatch_once_f(&MBFLogInitOnce, 0, (dispatch_function_t)MBFLogInit);
  if (os_log_type_enabled((os_log_t)MBFLogComponent, OS_LOG_TYPE_DEBUG))
    xpcConnectionInvalid_cold_2();
  FWSessionByXpcConnection = (void (*)(_QWORD))getFWSessionByXpcConnection(a1);
  if (FWSessionByXpcConnection)
  {
    v3[0] = (void (*)(_QWORD))MEMORY[0x1E0C809B0];
    v3[1] = (void (*)(_QWORD))0x40000000;
    v3[2] = __xpcConnectionInvalid_block_invoke;
    v3[3] = (void (*)(_QWORD))&__block_descriptor_tmp_4;
    v3[4] = FWSessionByXpcConnection;
    _MBTDispachAsyncAttachCompletionBlock((uint64_t)FWSessionByXpcConnection, v3);
  }
  else
  {
    if (MBFLogInitOnce != -1)
      dispatch_once_f(&MBFLogInitOnce, 0, (dispatch_function_t)MBFLogInit);
    if (os_log_type_enabled((os_log_t)MBFLogComponent, OS_LOG_TYPE_DEBUG))
      xpcConnectionInvalid_cold_1();
  }
}

void xpcConnectionDidReceiveMsg(uint64_t a1, _BYTE *a2, uint64_t a3)
{
  uint64_t v3;
  BOOL v4;
  NSObject *v5;
  uint64_t i;
  uint64_t v10;
  const char *v11;
  int v12;
  const char *v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v3 = *(_QWORD *)(a1 + 2600);
  if (*a2)
    v4 = v3 == 0;
  else
    v4 = 1;
  if (v4)
  {
    if (MBFLogInitOnce != -1)
      dispatch_once_f(&MBFLogInitOnce, 0, (dispatch_function_t)MBFLogInit);
    v5 = MBFLogComponent;
    if (os_log_type_enabled((os_log_t)MBFLogComponent, OS_LOG_TYPE_ERROR))
    {
      if (v3)
        v11 = *(const char **)(v3 + 8);
      else
        v11 = "UNKNOWN";
      v12 = 136315138;
      v13 = v11;
      _os_log_error_impl(&dword_1B6BF1000, v5, OS_LOG_TYPE_ERROR, "Invalid message received for session %s", (uint8_t *)&v12, 0xCu);
    }
  }
  else
  {
    for (i = 0; ; ++i)
    {
      v10 = *(_QWORD *)(a1 + 8 * i + 8);
      if (v10)
      {
        if (((*(uint64_t (**)(uint64_t, _BYTE *, uint64_t))(v10 + 8))(a1, a2, a3) & 1) != 0)
          break;
      }
      if (i > 0xFE)
        break;
    }
  }
}

void __xpcConnectionInvalid_block_invoke(uint64_t a1)
{
  uint64_t *v1;
  int v2;

  v1 = (uint64_t *)(a1 + 32);
  v2 = *(_DWORD *)(*(_QWORD *)(a1 + 32) + 84);
  switch(v2)
  {
    case 3:
      if (MBFLogInitOnce != -1)
        dispatch_once_f(&MBFLogInitOnce, 0, (dispatch_function_t)MBFLogInit);
      if (os_log_type_enabled((os_log_t)MBFLogComponent, OS_LOG_TYPE_DEBUG))
        __xpcConnectionInvalid_block_invoke_cold_3();
      _MBTSignalSessionEvent(*v1, 0, 1);
      ++gSessionAttachTries;
      break;
    case 2:
      if (MBFLogInitOnce != -1)
        dispatch_once_f(&MBFLogInitOnce, 0, (dispatch_function_t)MBFLogInit);
      if (os_log_type_enabled((os_log_t)MBFLogComponent, OS_LOG_TYPE_DEBUG))
        __xpcConnectionInvalid_block_invoke_cold_4();
      _MBTSignalSessionEvent(*v1, 2, 0);
      gSessionAttachTries = 0;
      break;
    case 1:
      if (MBFLogInitOnce != -1)
        dispatch_once_f(&MBFLogInitOnce, 0, (dispatch_function_t)MBFLogInit);
      if (os_log_type_enabled((os_log_t)MBFLogComponent, OS_LOG_TYPE_DEBUG))
        __xpcConnectionInvalid_block_invoke_cold_2();
      _MBTSignalSessionEvent(*v1, 1, 0);
      break;
    default:
      if (MBFLogInitOnce != -1)
        dispatch_once_f(&MBFLogInitOnce, 0, (dispatch_function_t)MBFLogInit);
      if (os_log_type_enabled((os_log_t)MBFLogComponent, OS_LOG_TYPE_ERROR))
        __xpcConnectionInvalid_block_invoke_cold_1();
      break;
  }
  removeFWSession(*v1);
  releaseXPCConnection(*(_QWORD *)(*v1 + 88));
  dispatch_release(*(dispatch_object_t *)(*v1 + 32));
  free(*(void **)(*v1 + 8));
  free((void *)*v1);
}

void OUTLINED_FUNCTION_6_1(uint64_t a1@<X8>)
{
  uint64_t v1;

  *(_QWORD *)(v1 - 8) = a1;
}

void OUTLINED_FUNCTION_12_0(uint64_t a1@<X8>)
{
  uint64_t v1;

  *(_QWORD *)(v1 - 8) = a1;
}

void BTAccessoryManagerGetDefault_cold_1()
{
  NSObject *v0;
  uint8_t v1[24];
  uint64_t v2;

  v2 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_11();
  OUTLINED_FUNCTION_13(&dword_1B6BF1000, v0, (uint64_t)v0, "Failed to get a valid XPC connection for session %llx sessionHandle:%llx", v1);
  OUTLINED_FUNCTION_4();
}

void BTAccessoryManagerAddCallbacks_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_0(&dword_1B6BF1000, v0, v1, "Failed to get a valid XPC connection for BTAccessoryManager:%llx", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_4();
}

void BTAccessoryManagerAddCallbacks_cold_2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_1(&dword_1B6BF1000, v0, v1, "Already registered these callbacks", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_6();
}

void BTAccessoryManagerAddCallbacks_cold_3()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_1(&dword_1B6BF1000, v0, v1, "could not register these callbacks", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_6();
}

void BTAccessoryManagerAddCallbacks_cold_4()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_1(&dword_1B6BF1000, v0, v1, "BTAccessoryManagerAddCallbacks over XPC", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_6();
}

void BTAccessoryManagerRemoveCallbacks_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_0(&dword_1B6BF1000, v0, v1, "Failed to get a valid XPC connection for sessionHandle:%llx", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_4();
}

void BTAccessoryManagerRemoveCallbacks_cold_2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_1(&dword_1B6BF1000, v0, v1, "BTAccessoryManagerRemoveCallbacks over XPC", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_6();
}

void BTAccessoryManagerRegisterDevice_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_0(&dword_1B6BF1000, v0, v1, "Failed to get a valid XPC connection agent:%llx", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_4();
}

void BTAccessoryManagerRegisterDevice_cold_2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_10(&dword_1B6BF1000, v0, v1, "BTAccessoryManagerRegisterDevice invalid argument", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_6();
}

void BTAccessoryManagerRegisterDevice_cold_3()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_1(&dword_1B6BF1000, v0, v1, "BTAccessoryManagerRegisterDevice over XPC", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_6();
}

void BTAccessoryManagerPlugInDevice_cold_2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_1(&dword_1B6BF1000, v0, v1, "BTAccessoryManagerPlugInDevice over XPC", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_6();
}

void BTAccessoryManagerUnplugDevice_cold_2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_1(&dword_1B6BF1000, v0, v1, "BTAccessoryManagerUnplugDevice over XPC", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_6();
}

void BTAccessoryManagerGetDeviceState_cold_2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_1(&dword_1B6BF1000, v0, v1, "BTAccessoryManagerGetDeviceState over XPC", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_6();
}

void BTAccessoryManagerGetDevices_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_0(&dword_1B6BF1000, v0, v1, "Failed to get a valid XPC connection localDevice:%llx", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_4();
}

void BTAccessoryManagerGetDevices_cold_2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_1(&dword_1B6BF1000, v0, v1, "BTAccessoryManagerGetDevices over XPC", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_6();
}

void BTAccessoryManagerGetTimeSyncId_cold_2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_1(&dword_1B6BF1000, v0, v1, "BTAccessoryManagerGetTimeSyncId over XPC", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_6();
}

void BTAccessoryManagerGetDeviceBatteryLevel_cold_2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_1(&dword_1B6BF1000, v0, v1, "BTAccessoryManagerGetDeviceBatteryLevel over XPC", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_6();
}

void BTAccessoryManagerIsAccessory_cold_2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_1(&dword_1B6BF1000, v0, v1, "BTAccessoryManagerIsAccessory over XPC", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_6();
}

void BTAccessoryManagerGenerateLinkKey_cold_2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_1(&dword_1B6BF1000, v0, v1, "BTAccessoryManagerGenerateLinkKey over XPC", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_6();
}

void BTAccessoryManagerSetLinkKeyEx_cold_2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_10(&dword_1B6BF1000, v0, v1, "BTAccessoryManagerSetLinkKeyEx invalid argument", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_6();
}

void BTAccessoryManagerSetLinkKeyEx_cold_3()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_1(&dword_1B6BF1000, v0, v1, "BTAccessoryManagerSetLinkKeyEx over XPC", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_6();
}

void BTAccessoryManagerSetDoubleTapAction_cold_2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_1(&dword_1B6BF1000, v0, v1, "BTAccessoryManagerSetDoubleTapAction over XPC", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_6();
}

void BTAccessoryManagerSetDoubleTapActionEx_cold_2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_1(&dword_1B6BF1000, v0, v1, "BTAccessoryManagerSetDoubleTapActionEx over XPC", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_6();
}

void BTAccessoryManagerSetMicMode_cold_2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_1(&dword_1B6BF1000, v0, v1, "BTAccessoryManagerSetMicMode over XPC", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_6();
}

void BTAccessoryManagerRemoteTimeSyncEnable_cold_2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_1(&dword_1B6BF1000, v0, v1, "BTAccessoryManagerRemoteTimeSyncEnable over XPC", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_6();
}

void BTAccessoryManagerSensorStreamTimeSyncEnable_cold_2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_1(&dword_1B6BF1000, v0, v1, "BTAccessoryManagerSensorStreamTimeSyncEnable over XPC", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_6();
}

void BTAccessoryManagerSetInEarDetectionEnable_cold_2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_1(&dword_1B6BF1000, v0, v1, "BTAccessoryManagerSetInEarDetectionEnable over XPC", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_6();
}

void BTAccessoryManagerSetIsHidden_cold_2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_1(&dword_1B6BF1000, v0, v1, "BTAccessoryManagerSetIsHidden over XPC", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_6();
}

void BTAccessoryManagerGetDoubleTapAction_cold_2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_1(&dword_1B6BF1000, v0, v1, "BTAccessoryManagerGetDoubleTapAction over XPC", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_6();
}

void BTAccessoryManagerGetDoubleTapActionEx_cold_2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_1(&dword_1B6BF1000, v0, v1, "BTAccessoryManagerGetDoubleTapActionEx over XPC", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_6();
}

void BTAccessoryManagerGetDoubleTapCapability_cold_2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_1(&dword_1B6BF1000, v0, v1, "BTAccessoryManagerGetDoubleTapCapability over XPC", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_6();
}

void BTAccessoryManagerGetFeatureCapability_cold_2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_1(&dword_1B6BF1000, v0, v1, "BTAccessoryManagerGetFeatureCapability over XPC", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_6();
}

void BTAccessoryManagerGetAnnounceMessagesSupport_cold_2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_1(&dword_1B6BF1000, v0, v1, "BTAccessoryManagerGetAnnounceMessagesSupport over XPC", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_6();
}

void BTAccessoryManagerGetMicMode_cold_2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_1(&dword_1B6BF1000, v0, v1, "BTAccessoryManagerGetMicMode over XPC", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_6();
}

void BTAccessoryManagerGetInEarDetectionEnable_cold_2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_1(&dword_1B6BF1000, v0, v1, "BTAccessoryManagerGetInEarDetectionEnable over XPC", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_6();
}

void BTAccessoryManagerGetInEarStatus_cold_2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_1(&dword_1B6BF1000, v0, v1, "BTAccessoryManagerGetInEarStatus over XPC", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_6();
}

void BTAccessoryManagerRegisterCustomMessageClient_cold_3()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_1(&dword_1B6BF1000, v0, v1, "could not regist these callbacks", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_6();
}

void BTAccessoryManagerRegisterCustomMessageClient_cold_4()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_1(&dword_1B6BF1000, v0, v1, "BTAccessoryManagerRegisterCustomMessageClient over XPC", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_6();
}

void BTAccessoryManagerDeregisterCustomMessageClient_cold_3()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_1(&dword_1B6BF1000, v0, v1, "BTAccessoryManagerDeregisterCustomMessageClient over XPC", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_6();
}

void BTAccessoryManagerSendCustomMessage_cold_2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_1(&dword_1B6BF1000, v0, v1, "BTAccessoryManagerSendCustomMessage over XPC", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_6();
}

void BTAccessoryManagerSendAdaptiveVolumeMessage_cold_2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_1(&dword_1B6BF1000, v0, v1, "BTAccessoryManagerSendAdaptiveVolumeMessage over XPC", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_6();
}

void BTAccessoryManagerSendPMEConfigMessage_cold_2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_1(&dword_1B6BF1000, v0, v1, "BTAccessoryManagerSendPMEConfigMessage over XPC", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_6();
}

void BTAccessoryManagerGetDeviceDiagnostics_cold_2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_1(&dword_1B6BF1000, v0, v1, "BTAccessoryManagerGetDeviceDiagnostics over XPC", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_6();
}

void BTAccessoryManagerSendRequestPeriodically_cold_2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_1(&dword_1B6BF1000, v0, v1, "BTAccessoryManagerSendRequestPeriodically over XPC", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_6();
}

void BTAccessoryManagerCancelRequestPeriodically_cold_2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_1(&dword_1B6BF1000, v0, v1, "BTAccessoryManagerCancelRequestPeriodically over XPC", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_6();
}

void BTAccessoryManagerSendControlCommand_cold_2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_1(&dword_1B6BF1000, v0, v1, "BTAccessoryManagerSendControlCommand over XPC", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_6();
}

void BTAccessoryManagerGetControlCommand_cold_2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_1(&dword_1B6BF1000, v0, v1, "BTAccessoryManagerGetControlCommand over XPC", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_6();
}

void BTAccessoryManagerGetSettingFeatureBitMask_cold_2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_1(&dword_1B6BF1000, v0, v1, "BTAccessoryManagerGetSettingFeatureBitMask over XPC", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_6();
}

void BTAccessoryManagerGetAccessoryInfo_cold_2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_1(&dword_1B6BF1000, v0, v1, "BTAccessoryManagerGetAccessoryInfo over XPC", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_6();
}

void BTAccessoryManagerGetAACPCapabilityBits_cold_2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_1(&dword_1B6BF1000, v0, v1, "BTAccessoryManagerGetAACPCapabilityBits over XPC", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_6();
}

void BTAccessoryManagerReadDeviceVersionInfo_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_0(&dword_1B6BF1000, v0, v1, "Failed to get a valid XPC connection sessionhandle:%llx", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_4();
}

void BTAccessoryManagerReadDeviceVersionInfo_cold_2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_1(&dword_1B6BF1000, v0, v1, "BTAccessoryManagerReadDeviceVersionInfo over XPC", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_6();
}

void BTAccessoryManagerGetDeviceColor_cold_2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_1(&dword_1B6BF1000, v0, v1, "BTAccessoryManagerGetDeviceColor over XPC", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_6();
}

void BTAccessoryManagerSetupCommand_cold_2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_1(&dword_1B6BF1000, v0, v1, "BTAccessoryManagerSetupCommand over XPC", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_6();
}

void BTAccessoryManagerSendRelayMsg_cold_2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_1(&dword_1B6BF1000, v0, v1, "BTAccessoryManagerSendRelayMsg over XPC", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_6();
}

void BTAccessoryManagerUpdateConnPriorityList_cold_2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_1(&dword_1B6BF1000, v0, v1, "BTAccessoryManagerUpdateConnPriorityList over XPC", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_6();
}

void BTAccessoryManagerGetNonAppleHAEPairedDevices_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_0(&dword_1B6BF1000, v0, v1, "Failed to get a valid XPC connection manager:%llx", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_4();
}

void BTAccessoryManagerGetNonAppleHAEPairedDevices_cold_2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_1(&dword_1B6BF1000, v0, v1, "BTAccessoryManagerGetNonAppleHAEPairedDevices over XPC", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_6();
}

void BTAccessoryManagerSmartRouteMode_cold_2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_1(&dword_1B6BF1000, v0, v1, "BTAccessoryManagerSmartRouteMode over XPC", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_6();
}

void BTAccessoryManagerGetSmartRouteMode_cold_2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_1(&dword_1B6BF1000, v0, v1, "BTAccessoryManagerGetSmartRouteMode over XPC", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_6();
}

void BTAccessoryManagerGetSmartRouteSupport_cold_2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_1(&dword_1B6BF1000, v0, v1, "BTAccessoryManagerGetSmartRouteSupport over XPC", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_6();
}

void BTAccessoryManagerSetDeviceStateOnPeerSrc_cold_2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_1(&dword_1B6BF1000, v0, v1, "BTAccessoryManagerSetDeviceStateOnPeerSrc over XPC", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_6();
}

void BTAccessoryManagerGetStereoHFPSupport_cold_2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_1(&dword_1B6BF1000, v0, v1, "BTAccessoryManagerGetStereoHFPSupport over XPC", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_6();
}

void BTAccessoryManagerGetCallManagementConfig_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_1(&dword_1B6BF1000, v0, v1, "BTAccessoryManagerGetCallManagementConfig over XPC", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_6();
}

void BTAccessoryManagerGetFeatureProxCardStatus_cold_2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_1(&dword_1B6BF1000, v0, v1, "BTAccessoryManagerGetFeatureProxCardStatus over XPC", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_6();
}

void BTAccessoryManagerSetFeatureProxCardStatus_cold_2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_1(&dword_1B6BF1000, v0, v1, "BTAccessoryManagerSetFeatureProxCardStatus over XPC", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_6();
}

void BTAccessoryManagerGetDeviceSoundProfileSupport_cold_2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_1(&dword_1B6BF1000, v0, v1, "BTAccessoryManagerGetDeviceSoundProfileSupport over XPC", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_6();
}

void BTAccessoryManagerGetDeviceSoundProfileAllowed_cold_2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_1(&dword_1B6BF1000, v0, v1, "BTAccessoryManagerGetDeviceSoundProfileAllowed over XPC", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_6();
}

void BTAccessoryManagerSetDeviceSoundProfileAllowed_cold_2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_1(&dword_1B6BF1000, v0, v1, "BTAccessoryManagerSetDeviceSoundProfileAllowed over XPC", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_6();
}

void BTAccessoryManagerGetSpatialAudioPlatformSupport_cold_2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_1(&dword_1B6BF1000, v0, v1, "BTAccessoryManagerGetSpatialAudioPlatformSupport over XPC", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_6();
}

void BTAccessoryManagerGetAnnounceCallsSupport_cold_2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_1(&dword_1B6BF1000, v0, v1, "BTAccessoryManagerGetAnnounceCallsSupport over XPC", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_6();
}

void BTAccessoryManagerGetGyroInformation_cold_2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_1(&dword_1B6BF1000, v0, v1, "BTAccessoryManagerGetGyroInformation over XPC", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_6();
}

void BTAccessoryManagerGetCaseSerialNumbersForAppleProductId_cold_2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_1(&dword_1B6BF1000, v0, v1, "BTAccessoryManagerGetCaseSerialNumbersForAppleProductId over XPC", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_6();
}

void BTAccessoryManagerGetCaseSerialNumbersForAppleProductIds_cold_2()
{
  int v0;
  os_log_t v1;
  uint8_t v2[12];
  __int16 v3;
  int v4;
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_5();
  v3 = 1024;
  v4 = v0;
  _os_log_error_impl(&dword_1B6BF1000, v1, OS_LOG_TYPE_ERROR, "Invalid product ID parameters. productID = %p, numProductIds = %u", v2, 0x12u);
  OUTLINED_FUNCTION_4();
}

void BTAccessoryManagerGetCaseSerialNumbersForAppleProductIds_cold_3()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_1(&dword_1B6BF1000, v0, v1, "BTAccessoryManagerGetCaseSerialNumbersForAppleProductIds over XPC", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_6();
}

void BTAccessoryManagerGetPrimaryBudSide_cold_2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_1(&dword_1B6BF1000, v0, v1, "BTAccessoryManagerGetPrimaryBudSide over XPC", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_6();
}

void accessoryManagerXpcDisconnectedHandler_cold_1()
{
  uint64_t v0;
  NSObject *v1;
  uint64_t v2;
  uint8_t v3[12];
  __int16 v4;
  uint64_t v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_8();
  v4 = 2080;
  v5 = v0;
  OUTLINED_FUNCTION_13(&dword_1B6BF1000, v1, v2, "WARNING: accessoryManagerXpcDisconnectedHandler Disconnected from bluetoothd serviceName:%s sessionName:%s", v3);
  OUTLINED_FUNCTION_4();
}

void attachSession_cold_1()
{
  NSObject *v0;
  uint8_t v1[24];
  uint64_t v2;

  v2 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_7_0();
  OUTLINED_FUNCTION_9(&dword_1B6BF1000, v0, (uint64_t)v0, "  attachSession reply session:%llx result:%llx", v1);
  OUTLINED_FUNCTION_4();
}

void attachSession_cold_2()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[24];
  uint64_t v3;

  v3 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_9(&dword_1B6BF1000, v0, v1, "  attachSession service:%s, sessionName:%s", v2);
  OUTLINED_FUNCTION_4();
}

void sendMessageWithReplySync_cold_1()
{
  os_log_t v0;
  uint8_t v1[24];
  uint64_t v2;

  v2 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_5();
  _os_log_debug_impl(&dword_1B6BF1000, v0, OS_LOG_TYPE_DEBUG, "MBFXPC LOG Failed to send sendMessageWithReplySync because of XPC ERROR: %s", v1, 0xCu);
  OUTLINED_FUNCTION_4();
}

void sendMessageWithReplySync_cold_2()
{
  uint64_t v0;
  os_log_t v1;
  const char *v2;
  const char *v3;
  const char *v4;
  uint64_t v5;

  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_6_0(&dword_1B6BF1000, v0, v1, "sendSyncMsg service:%s, sessionName:%s msgId:%s fwSessionPtr:%llx", v2, v3, v4, v5);
}

void handleReset_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[24];
  uint64_t v3;

  v3 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_9(&dword_1B6BF1000, v0, v1, "  handleReset service:%s, sessionName:%s", v2);
  OUTLINED_FUNCTION_4();
}

void handleInvalid_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[24];
  uint64_t v3;

  v3 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_9(&dword_1B6BF1000, v0, v1, "  handleInvalid service:%s, sessionName:%s", v2);
  OUTLINED_FUNCTION_4();
}

void handleMsg_cold_1(uint64_t a1, uint64_t a2, NSObject *a3)
{
  uint64_t v3;
  int v4;
  uint64_t v5;
  __int16 v6;
  uint64_t v7;
  __int16 v8;
  uint64_t v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v3 = *(_QWORD *)(*(_QWORD *)a2 + 24);
  v4 = 136315650;
  v5 = a1 + 2336;
  v6 = 2080;
  v7 = a1 + 2080;
  v8 = 2080;
  v9 = v3;
  OUTLINED_FUNCTION_5_0(&dword_1B6BF1000, a3, (uint64_t)a3, "  handleMsg service:%s, sessionName:%s, msgId:%s", (uint8_t *)&v4);
  OUTLINED_FUNCTION_11_0();
}

void handleConnectionEvent_cold_1()
{
  os_log_t v0;
  uint8_t v1[24];
  uint64_t v2;

  v2 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_5();
  _os_log_fault_impl(&dword_1B6BF1000, v0, OS_LOG_TYPE_FAULT, "MBFXPC LOG Skipped handleConnectionEvent because MBXpcConnection for connection %p was NULL", v1, 0xCu);
  OUTLINED_FUNCTION_4();
}

void handleConnectionEvent_cold_2()
{
  NSObject *v0;
  uint8_t v1[24];
  uint64_t v2;

  v2 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_8_0();
  OUTLINED_FUNCTION_9(&dword_1B6BF1000, v0, (uint64_t)v0, "MBFXPC LOG calling handleReset because %p %s", v1);
  OUTLINED_FUNCTION_4();
}

void handleConnectionEvent_cold_3()
{
  NSObject *v0;
  uint8_t v1[24];
  uint64_t v2;

  v2 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_8_0();
  OUTLINED_FUNCTION_9(&dword_1B6BF1000, v0, (uint64_t)v0, "MBFXPC LOG calling handleInvalid because XPC:%p %s", v1);
  OUTLINED_FUNCTION_4();
}

void handleConnectionEvent_cold_4()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_0(&dword_1B6BF1000, v0, v1, "Unexpected XPC error: %s", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_4();
}

void handleConnectionEvent_cold_5()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_0(&dword_1B6BF1000, v0, v1, "Unexpected XPC type: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_4();
}

void handleConnectionEvent_cold_6()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[24];
  uint64_t v3;

  v3 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_9(&dword_1B6BF1000, v0, v1, "handleConnectionEvent service:%s, sessionName:%s", v2);
  OUTLINED_FUNCTION_4();
}

void createXpcConnection_cold_1()
{
  uint64_t v0;
  NSObject *v1;
  uint8_t v2[12];
  __int16 v3;
  uint64_t v4;
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_5();
  v3 = 2048;
  v4 = v0;
  OUTLINED_FUNCTION_9(&dword_1B6BF1000, v1, (uint64_t)v1, "MBFXPC LOG ---------- MBFXPC BEGIN SESSION :%s XPC:%p ---------- ", v2);
  OUTLINED_FUNCTION_4();
}

void createXpcConnection_cold_2(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_debug_impl(&dword_1B6BF1000, log, OS_LOG_TYPE_DEBUG, "MBFXPC LOG Device is not BT Capable.", v1, 2u);
}

void releaseMBXpcConnection_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[24];
  uint64_t v3;

  v3 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_7_0();
  OUTLINED_FUNCTION_9(&dword_1B6BF1000, v0, v1, "---------- MBFXPC END SESSION :%s XPC:%p---------- ", v2);
  OUTLINED_FUNCTION_4();
}

void releaseXPCConnection_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[40];
  uint64_t v3;

  v3 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_5_0(&dword_1B6BF1000, v0, v1, "MBFXPC LOG releasing Last XPC reference for :%s, sessionName:%s XPC:%p", v2);
  OUTLINED_FUNCTION_11_0();
}

void sendMsg_cold_1()
{
  uint64_t v0;
  os_log_t v1;
  const char *v2;
  const char *v3;
  const char *v4;
  uint64_t v5;

  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_6_0(&dword_1B6BF1000, v0, v1, "sendMsg service:%s, sessionName:%s msgId:%s fwSessionPtr:%llx", v2, v3, v4, v5);
}

void disconnect_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[40];
  uint64_t v3;

  v3 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_5_0(&dword_1B6BF1000, v0, v1, "MBFXPC LOG disconnect service:%s, sessionName:%s fwSession:%llx", v2);
  OUTLINED_FUNCTION_11_0();
}

void BTDeviceAddressToString_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_0(&dword_1B6BF1000, v0, v1, "Failed to get a valid XPC connection sessionHandle:%llx", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_4();
}

void BTDeviceAddressToString_cold_2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_1(&dword_1B6BF1000, v0, v1, "BTDeviceAddressToString over XPC", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_6();
}

void BTDeviceAddressFromString_cold_2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_10(&dword_1B6BF1000, v0, v1, "Invalid address string argument", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_6();
}

void BTDeviceAddressFromString_cold_3()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_1(&dword_1B6BF1000, v0, v1, "BTDeviceAddressFromString over XPC", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_6();
}

void BTDeviceFromAddress_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_0(&dword_1B6BF1000, v0, v1, "Failed to get a valid XPC connection session:%llx", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_4();
}

void BTDeviceFromAddress_cold_2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_1(&dword_1B6BF1000, v0, v1, "BTDeviceFromAddress over XPC", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_6();
}

void BTDeviceFromIdentifier_cold_2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_1(&dword_1B6BF1000, v0, v1, "BTDeviceFromIdentifier over XPC", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_6();
}

void BTDeviceGetAddressString_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_0(&dword_1B6BF1000, v0, v1, "Failed to get a valid XPC connection device:%llx", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_4();
}

void BTDeviceGetAddressString_cold_2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_1(&dword_1B6BF1000, v0, v1, "BTDeviceGetAddressString over XPC", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_6();
}

void BTDeviceGetDeviceType_cold_2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_1(&dword_1B6BF1000, v0, v1, "BTDeviceGetDeviceType over XPC", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_6();
}

void BTDeviceGetDeviceClass_cold_2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_1(&dword_1B6BF1000, v0, v1, "BTDeviceGetDeviceClass over XPC", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_6();
}

void BTDeviceGetDefaultName_cold_2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_1(&dword_1B6BF1000, v0, v1, "BTDeviceGetDefaultName over XPC", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_6();
}

void BTDeviceGetProductName_cold_2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_1(&dword_1B6BF1000, v0, v1, "BTDeviceGetProductName over XPC", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_6();
}

void BTDeviceGetName_cold_2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_1(&dword_1B6BF1000, v0, v1, "BTDeviceGetName over XPC", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_6();
}

void BTDeviceSetUserName_cold_2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_1(&dword_1B6BF1000, v0, v1, "BTDeviceSetUserName over XPC", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_6();
}

void BTDeviceGetSyncSettings_cold_2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_1(&dword_1B6BF1000, v0, v1, "BTDeviceGetSyncSettings over XPC", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_6();
}

void BTDeviceSetSyncSettings_cold_2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_1(&dword_1B6BF1000, v0, v1, "BTDeviceSetSyncSettings over XPC", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_6();
}

void BTDeviceGetGroups_cold_2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_1(&dword_1B6BF1000, v0, v1, "BTDeviceGetGroups over XPC", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_6();
}

void BTDeviceSetGroup_cold_2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_1(&dword_1B6BF1000, v0, v1, "BTDeviceSetGroup over XPC", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_6();
}

void BTDeviceGetPairingStatus_cold_2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_1(&dword_1B6BF1000, v0, v1, "BTDeviceGetPairingStatus over XPC", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_6();
}

void BTDeviceGetCloudPairingStatus_cold_2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_1(&dword_1B6BF1000, v0, v1, "BTDeviceGetCloudPairingStatus over XPC", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_6();
}

void BTDeviceGetMagicPairingStatus_cold_2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_1(&dword_1B6BF1000, v0, v1, "BTDeviceGetConnectionStatus over XPC", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_6();
}

void BTDeviceIsAppleAudioDevice_cold_2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_1(&dword_1B6BF1000, v0, v1, "BTDeviceIsAppleAudioDevice over XPC", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_6();
}

void BTDeviceSupportsHS_cold_2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_1(&dword_1B6BF1000, v0, v1, "BTDeviceSupportsHS over XPC", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_6();
}

void BTDeviceIsProController_cold_2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_1(&dword_1B6BF1000, v0, v1, "BTDeviceIsProController over XPC", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_6();
}

void BTServiceAddCallbacksWithFilter_cold_3()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_1(&dword_1B6BF1000, v0, v1, "could not regist these callbacks", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_6();
}

void BTServiceAddCallbacksWithFilter_cold_4()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_1(&dword_1B6BF1000, v0, v1, "BTServiceAddCallbacksWithFilter over XPC", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_6();
}

void BTServiceAddCallbacksWithFilter_cold_5()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_3(&dword_1B6BF1000, v0, v1, "BTServiceAddCallbacksWithFilter session :%llx", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_4();
}

void BTServiceAddCallbacks_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_3(&dword_1B6BF1000, v0, v1, "BTServiceAddCallbacks session :%llx", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_4();
}

void BTServiceRemoveCallbacks_cold_2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_1(&dword_1B6BF1000, v0, v1, "BTDeviceServiceRemoveCallbacks over XPC", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_6();
}

void BTDeviceConnect_cold_2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_1(&dword_1B6BF1000, v0, v1, "BTDeviceConnect over XPC", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_6();
}

void BTDeviceConnectServices_cold_2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_1(&dword_1B6BF1000, v0, v1, "BTDeviceConnectServices over XPC", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_6();
}

void BTDeviceConnectServicesWithParameters_cold_2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_1(&dword_1B6BF1000, v0, v1, "BTDeviceConnectServicesWithParameters over XPC", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_6();
}

void BTDeviceDisconnect_cold_2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_1(&dword_1B6BF1000, v0, v1, "BTDeviceDisconnect over XPC", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_6();
}

void BTDevicePhysicalLinkDisconnect_cold_2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_1(&dword_1B6BF1000, v0, v1, "BTDevicePhysicalLinkDisconnect over XPC", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_6();
}

void BTDeviceDisconnectServices_cold_2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_1(&dword_1B6BF1000, v0, v1, "BTDeviceDisconnectServices over XPC", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_6();
}

void BTDeviceGetConnectedServices_cold_2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_1(&dword_1B6BF1000, v0, v1, "BTDeviceGetConnectedServices over XPC", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_6();
}

void BTDeviceGetSupportedServices_cold_2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_1(&dword_1B6BF1000, v0, v1, "BTDeviceGetSupportedServices over XPC", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_6();
}

void BTDeviceSetServiceSettings_cold_2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_1(&dword_1B6BF1000, v0, v1, "BTDeviceSetServiceSettings over XPC", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_6();
}

void BTDeviceGetServiceSettings_cold_2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_1(&dword_1B6BF1000, v0, v1, "BTDeviceGetServiceSettings over XPC", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_6();
}

void BTDeviceGetComPortForService_cold_2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_1(&dword_1B6BF1000, v0, v1, "BTDeviceGetComPortForService over XPC", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_6();
}

void BTDeviceGetComPortForServiceWithSandboxExtension_cold_2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_1(&dword_1B6BF1000, v0, v1, "BTDeviceGetComPortForServiceWithSandboxExtension over XPC", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_6();
}

void BTDeviceSetVirtualType_cold_2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_1(&dword_1B6BF1000, v0, v1, "BTDeviceSetVirtualType over XPC", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_6();
}

void BTDeviceGetVirtualType_cold_2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_1(&dword_1B6BF1000, v0, v1, "BTDeviceGetVirtualType over XPC", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_6();
}

void BTDeviceMatchesAdvertisedKey_cold_2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_1(&dword_1B6BF1000, v0, v1, "BTDeviceMatchesAdvertisedKey over XPC", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_6();
}

void BTDeviceGetAdvertisedValueForKey_cold_2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_1(&dword_1B6BF1000, v0, v1, "BTDeviceGetAdvertisedValueForKey over XPC", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_6();
}

void BTDeviceGetDeviceId_cold_2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_1(&dword_1B6BF1000, v0, v1, "BTDeviceGetDeviceId over XPC", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_6();
}

void BTDeviceSetHIDProperties_cold_2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_1(&dword_1B6BF1000, v0, v1, "BTDeviceSetHIDProperties over XPC", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_6();
}

void BTDeviceConfigureLinkKey_cold_2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_1(&dword_1B6BF1000, v0, v1, "BTDeviceConfigureLinkKey over XPC", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_6();
}

void BTDeviceIsTemporaryPaired_cold_2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_1(&dword_1B6BF1000, v0, v1, "BTDeviceIsTemporaryPaired over XPC", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_6();
}

void BTDeviceIsWirelessSplitterSupported_cold_2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_1(&dword_1B6BF1000, v0, v1, "BTDeviceIsWirelessSplitterSupported over XPC", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_6();
}

void BTDeviceIsTemporaryPairedNotInContacts_cold_2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_1(&dword_1B6BF1000, v0, v1, "BTDeviceIsTemporaryPairedNotInContacts over XPC", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_6();
}

void BTDeviceGetLowSecurityStatus_cold_2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_1(&dword_1B6BF1000, v0, v1, "BTDeviceGetLowSecurityStatus over XPC", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_6();
}

void BTDeviceGetHIDDeviceBehavior_cold_2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_1(&dword_1B6BF1000, v0, v1, "BTDeviceGetHIDDeviceBehavior over XPC", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_6();
}

void BTDeviceSetHijackAudioRoute_cold_2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_1(&dword_1B6BF1000, v0, v1, "BTDeviceSetHijackAudioRoute over XPC", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_6();
}

void BTDeviceSetACLHighPriority_cold_2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_1(&dword_1B6BF1000, v0, v1, "BTDeviceSetACLHighPriority over XPC", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_6();
}

void BTDeviceIsMaster_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_10(&dword_1B6BF1000, v0, v1, "WARNING: BTDeviceIsMaster is DEPRECATED. Please use BTDeviceIsCentral instead.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_6();
}

void BTDeviceIsCentral_cold_2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_1(&dword_1B6BF1000, v0, v1, "BTDeviceIsCentral over XPC", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_6();
}

void BTDeviceGetUserSelectedDeviceType_cold_2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_1(&dword_1B6BF1000, v0, v1, "BTDeviceGetUserSelectedDeviceType over XPC", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_6();
}

void BTDeviceSetUserSelectedDeviceType_cold_2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_1(&dword_1B6BF1000, v0, v1, "BTDeviceSetUserSelectedDeviceType over XPC", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_6();
}

void BTDeviceIsGenuineAirPods_cold_2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_1(&dword_1B6BF1000, v0, v1, "BTDeviceIsGenuineAirPods over XPC", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_6();
}

void deviceServiceXpcDisconnectedHandler_cold_1()
{
  uint64_t v0;
  os_log_t v1;
  uint8_t v2[12];
  __int16 v3;
  uint64_t v4;
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_8();
  v3 = 2080;
  v4 = v0;
  _os_log_error_impl(&dword_1B6BF1000, v1, OS_LOG_TYPE_ERROR, "WARNING: deviceServiceXpcDisconnectedHandler Disconnected from bluetoothd serviceName:%s sessionName:%s", v2, 0x16u);
  OUTLINED_FUNCTION_4();
}

void BTDiscoveryAgentCreate_cold_3()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_1(&dword_1B6BF1000, v0, v1, "could not regist these callbacks", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_6();
}

void BTDiscoveryAgentDestroy_cold_2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_1(&dword_1B6BF1000, v0, v1, "BTDiscoveryAgentDestroy over XPC", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_6();
}

void BTDiscoveryAgentStartScan_cold_2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_1(&dword_1B6BF1000, v0, v1, "BTDiscoveryAgentStartScan over XPC", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_6();
}

void BTDiscoveryAgentStartScanForAdvertizedData_cold_2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_1(&dword_1B6BF1000, v0, v1, "BTDiscoveryAgentStartScanForAdvertizedData over XPC", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_6();
}

void BTDiscoveryAgentStopScan_cold_2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_1(&dword_1B6BF1000, v0, v1, "BTDiscoveryAgentStopScan over XPC", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_6();
}

void BTDiscoveryAgentGetDevices_cold_2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_1(&dword_1B6BF1000, v0, v1, "BTDiscoveryAgentGetDevices over XPC", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_6();
}

void BTDiscoveryAgentAddKey_cold_2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_10(&dword_1B6BF1000, v0, v1, "key cannot be null", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_6();
}

void BTDiscoveryAgentAddKey_cold_3()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_10(&dword_1B6BF1000, v0, v1, "keySize cannot be 0", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_6();
}

void BTDiscoveryAgentAddKey_cold_4()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_1(&dword_1B6BF1000, v0, v1, "BTDiscoveryAgentAddKey over XPC", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_6();
}

void BTDiscoveryAgentRemoveKey_cold_4()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_1(&dword_1B6BF1000, v0, v1, "BTDiscoveryAgentRemoveKey over XPC", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_6();
}

void discoveryAgentXpcDisconnectedHandler_cold_1()
{
  uint64_t v0;
  os_log_t v1;
  uint8_t v2[12];
  __int16 v3;
  uint64_t v4;
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_8();
  v3 = 2080;
  v4 = v0;
  _os_log_error_impl(&dword_1B6BF1000, v1, OS_LOG_TYPE_ERROR, "WARNING: discoveryAgentXpcDisconnectedHandler Disconnected from bluetoothd serviceName:%s sessionName:%s", v2, 0x16u);
  OUTLINED_FUNCTION_4();
}

void BTLocalDeviceGetDefault_cold_1()
{
  uint64_t v0;
  NSObject *v1;
  uint8_t v2[12];
  __int16 v3;
  uint64_t v4;
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_5();
  v3 = 2048;
  v4 = v0;
  OUTLINED_FUNCTION_13(&dword_1B6BF1000, v1, (uint64_t)v1, "Failed to get a valid XPC connection for session %llx sessionHandle:%llx", v2);
  OUTLINED_FUNCTION_4();
}

void BTLocalDeviceGetDefault_cold_2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_1(&dword_1B6BF1000, v0, v1, "BTLocalDeviceGetDefault over XPC", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_6();
}

void BTLocalDeviceAddCallbacks_cold_4()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_1(&dword_1B6BF1000, v0, v1, "BTLocalDeviceAddCallbacks over XPC", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_6();
}

void BTLocalDeviceRemoveCallbacks_cold_2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_1(&dword_1B6BF1000, v0, v1, "BTLocalDeviceRemoveCallbacks over XPC", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_6();
}

void BTLocalDeviceMaskCallbacks_cold_2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_1(&dword_1B6BF1000, v0, v1, "BTLocalDeviceMaskCallbacks over XPC", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_6();
}

void BTLocalDeviceSetModulePower_cold_2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_1(&dword_1B6BF1000, v0, v1, "BTLocalDeviceSetModulePower over XPC", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_6();
}

void BTLocalDeviceGetModulePower_cold_2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_1(&dword_1B6BF1000, v0, v1, "BTLocalDeviceGetModulePower over XPC", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_6();
}

void BTLocalDeviceGetAddressString_cold_2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_1(&dword_1B6BF1000, v0, v1, "BTLocalDeviceGetAddressString over XPC", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_6();
}

void BTLocalDeviceGetName_cold_2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_1(&dword_1B6BF1000, v0, v1, "BTLocalDeviceGetName over XPC", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_6();
}

void BTLocalDeviceGetPairedDevices_cold_2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_1(&dword_1B6BF1000, v0, v1, "BTLocalDeviceGetPairedDevices over XPC", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_6();
}

void BTLocalDeviceGetConnectedDevices_cold_2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_1(&dword_1B6BF1000, v0, v1, "BTLocalDeviceGetConnectedDevices over XPC", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_6();
}

void BTLocalDeviceGetConnectingDevices_cold_2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_1(&dword_1B6BF1000, v0, v1, "BTLocalDeviceGetConnectingDevices over XPC", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_6();
}

void BTLocalDeviceAdvertiseData_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_0(&dword_1B6BF1000, v0, v1, "Failed to get a valid XPC connection for device:%llx", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_4();
}

void BTLocalDeviceRegisterForPowerUpdates_cold_4()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_1(&dword_1B6BF1000, v0, v1, "BTLocalDeviceRegisterForPowerUpdates over XPC", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_6();
}

void BTLocalDeviceUnregisterForPowerUpdates_cold_2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_1(&dword_1B6BF1000, v0, v1, "BTLocalDeviceUnregisterForPowerUpdates over XPC", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_6();
}

void BTLocalDeviceReadPowerConsumption_cold_2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_1(&dword_1B6BF1000, v0, v1, "BTLocalDeviceReadPowerConsumption over XPC", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_6();
}

void BTLocalDeviceRegisterForPowerProfileStatistics_cold_4()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_1(&dword_1B6BF1000, v0, v1, "BTLocalDeviceRegisterForPowerProfileStatistics over XPC", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_6();
}

void BTLocalDeviceUnregisterForPowerProfileStatistics_cold_2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_1(&dword_1B6BF1000, v0, v1, "BTLocalDeviceUnregisterForPowerProfileStatistics over XPC", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_6();
}

void BTLocalDeviceReadPowerProfileStatistics_cold_2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_1(&dword_1B6BF1000, v0, v1, "BTLocalDeviceReadPowerProfileStatistics over XPC", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_6();
}

void BTLocalDeviceReadEnhancedPowerProfileStatistics_cold_2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_1(&dword_1B6BF1000, v0, v1, "BTLocalDeviceReadEnhancedPowerProfileStatistics over XPC", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_6();
}

void BTLocalDeviceReadTransportSwitchStatistics_cold_2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_1(&dword_1B6BF1000, v0, v1, "BTLocalDeviceReadTransportSwitchStatistics over XPC", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_6();
}

void BTLocalDeviceReadDetailedPowerProfileStatistics_cold_2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_1(&dword_1B6BF1000, v0, v1, "BTLocalDeviceReadDetailedPowerProfileStatistics over XPC", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_6();
}

void BTStartHCITraces_cold_2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_1(&dword_1B6BF1000, v0, v1, "BTStartHCITraces over XPC", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_6();
}

void BTStopHCITraces_cold_2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_1(&dword_1B6BF1000, v0, v1, "BTStopHCITraces over XPC", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_6();
}

void BTLocalDeviceShowPowerPrompt_cold_2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_1(&dword_1B6BF1000, v0, v1, "BTLocalDeviceShowPowerPrompt over XPC", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_6();
}

void BTLocalDeviceSetAFHMap_cold_2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_1(&dword_1B6BF1000, v0, v1, "BTLocalDeviceSetAFHMap over XPC", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_6();
}

void BTLocalDeviceReadAFHMap_cold_2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_1(&dword_1B6BF1000, v0, v1, "BTLocalDeviceReadAFHMap over XPC", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_6();
}

void BTLocalDeviceSetDelayedWake_cold_2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_1(&dword_1B6BF1000, v0, v1, "BTLocalDeviceSetDelayedWake over XPC", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_6();
}

void BTLocalDeviceSetDenylistEnabled_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_0(&dword_1B6BF1000, v0, v1, "Failed to get a valid XPC connection localDeviceHandle:%llx", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_4();
}

void BTLocalDeviceSetDenylistEnabled_cold_2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_1(&dword_1B6BF1000, v0, v1, "BTLocalDeviceSetDenylistEnabled over XPC", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_6();
}

void BTLocalDeviceGetDenylistEnabled_cold_2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_1(&dword_1B6BF1000, v0, v1, "BTLocalDeviceGetDenylistEnabled over XPC", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_6();
}

void BTLocalDeviceGetDeviceNamesThatMayBeDenylisted_cold_2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_1(&dword_1B6BF1000, v0, v1, "BTLocalDeviceGetDeviceNamesThatMayBeDenylisted over XPC", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_6();
}

void BTLocalDeviceGetSharingAddresses_cold_2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_1(&dword_1B6BF1000, v0, v1, "BTLocalDeviceGetSharingAddresses over XPC", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_6();
}

void BTLocalDeviceIsSharingEnabled_cold_2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_1(&dword_1B6BF1000, v0, v1, "BTLocalDeviceIsSharingEnabled over XPC", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_6();
}

void BTLocalDeviceDumpExposureNotificationDatabase_cold_2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_1(&dword_1B6BF1000, v0, v1, "BTLocalDeviceDumpExposureNotificationDatabase over XPC", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_6();
}

void BTLocalDeviceLinkQualityGetData_cold_2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_1(&dword_1B6BF1000, v0, v1, "BTLocalDeviceLinkQualityGetData over XPC", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_6();
}

void localDeviceXpcDisconnectedHandler_cold_1()
{
  uint64_t v0;
  NSObject *v1;
  uint64_t v2;
  uint8_t v3[12];
  __int16 v4;
  uint64_t v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_8();
  v4 = 2080;
  v5 = v0;
  OUTLINED_FUNCTION_13(&dword_1B6BF1000, v1, v2, "WARNING: localDeviceXpcDisconnectedHandler Disconnected from bluetoothd serviceName:%s sessionName:%s", v3);
  OUTLINED_FUNCTION_4();
}

void BTPairingAgentCreate_cold_4()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_1(&dword_1B6BF1000, v0, v1, "BTPairingAgentCreate session over XPC", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_6();
}

void BTPairingAgentDestroy_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_0(&dword_1B6BF1000, v0, v1, "Failed to get a valid XPC connection agent:%llx", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_4();
}

void BTPairingAgentDestroy_cold_2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_1(&dword_1B6BF1000, v0, v1, "BTPairingAgentDestroy over XPC", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_6();
}

void BTPairingAgentStart_cold_2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_1(&dword_1B6BF1000, v0, v1, "BTPairingAgentStart over XPC", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_6();
}

void BTPairingAgentStop_cold_2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_1(&dword_1B6BF1000, v0, v1, "BTPairingAgentStop over XPC", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_6();
}

void BTPairingAgentCancelPairing_cold_2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_1(&dword_1B6BF1000, v0, v1, "BTPairingAgentCancelPairing over XPC", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_6();
}

void BTPairingAgentSetPincode_cold_2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_1(&dword_1B6BF1000, v0, v1, "BTPairingAgentSetPincode over XPC", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_6();
}

void BTPairingAgentAcceptSSP_cold_2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_1(&dword_1B6BF1000, v0, v1, "BTPairingAgentAcceptSSP over XPC", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_6();
}

void BTPairingAgentDeletePairedDevice_cold_2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_1(&dword_1B6BF1000, v0, v1, "BTPairingAgentDeletePairedDevice over XPC", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_6();
}

void BTPairingAgentSetIOCapability_cold_2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_1(&dword_1B6BF1000, v0, v1, "BTPairingAgentSetIOCapability over XPC", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_6();
}

void BTPairingAgentClearOOBDataForDevice_cold_2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_1(&dword_1B6BF1000, v0, v1, "BTPairingAgentClearOOBDataForDevice over XPC", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_6();
}

void BTPairingAgentSetOOBDataForDevice_cold_2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_1(&dword_1B6BF1000, v0, v1, "BTPairingAgentSetOOBDataForDevice over XPC", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_6();
}

void BTPairingAgentGetLocalOOBData_cold_2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_1(&dword_1B6BF1000, v0, v1, "BTPairingAgentGetLocalOOBData over XPC", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_6();
}

void pairingAgentXpcDisconnectedHandler_cold_1()
{
  uint64_t v0;
  os_log_t v1;
  uint8_t v2[12];
  __int16 v3;
  uint64_t v4;
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_8();
  v3 = 2080;
  v4 = v0;
  _os_log_error_impl(&dword_1B6BF1000, v1, OS_LOG_TYPE_ERROR, "WARNING: pairingAgentXpcDisconnectedHandler Disconnected from bluetoothd serviceName:%s sessionName:%s", v2, 0x16u);
  OUTLINED_FUNCTION_4();
}

void pairingAgentXpcMsgHandler_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_8_1(&dword_1B6BF1000, v0, v1, "Incorrect Buffer Length for r256", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_6();
}

void pairingAgentXpcMsgHandler_cold_2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_8_1(&dword_1B6BF1000, v0, v1, "Incorrect Buffer Length for r192", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_6();
}

void pairingAgentXpcMsgHandler_cold_3()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_8_1(&dword_1B6BF1000, v0, v1, "Incorrect Buffer Length for c256", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_6();
}

void pairingAgentXpcMsgHandler_cold_4()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_8_1(&dword_1B6BF1000, v0, v1, "Incorrect Buffer Length for c192", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_6();
}

void _MBTGetAsyncAttachQueue_cold_1()
{
  uint64_t v0;
  os_log_t v1;
  const void *v2;
  const void *v3;

  OUTLINED_FUNCTION_12_0(*MEMORY[0x1E0C80C00]);
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_9_0(&dword_1B6BF1000, v0, v1, "_MBTGetAsyncAttachQueue session:%p queue:%p returning main queue", v2, v3);
  OUTLINED_FUNCTION_4();
}

void _MBTGetAsyncAttachQueue_cold_2()
{
  uint64_t v0;
  os_log_t v1;
  const void *v2;
  const void *v3;

  OUTLINED_FUNCTION_12_0(*MEMORY[0x1E0C80C00]);
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_9_0(&dword_1B6BF1000, v0, v1, "_MBTGetAsyncAttachQueue session:%p queue:%p returning client queue", v2, v3);
  OUTLINED_FUNCTION_4();
}

void _MBTGetAsyncAttachQueue_cold_3()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[24];
  uint64_t v3;

  v3 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_9(&dword_1B6BF1000, v0, v1, "_MBTGetAsyncAttachQueue session:%p queue:%p", v2);
  OUTLINED_FUNCTION_4();
}

void _MBTAsyncAttach_cold_1()
{
  uint64_t v0;
  int v1;
  os_log_t v2;
  uint8_t v3[12];
  __int16 v4;
  uint64_t v5;
  __int16 v6;
  int v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_5();
  v4 = 2080;
  v5 = v0;
  v6 = 1024;
  v7 = v1;
  _os_log_debug_impl(&dword_1B6BF1000, v2, OS_LOG_TYPE_DEBUG, "_MBTAsyncAttach previous session found:%llx, disconnecting %s and retrying. xpcConnection is NULL:%d", v3, 0x1Cu);
}

void _MBTAsyncAttach_cold_2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_10(&dword_1B6BF1000, v0, v1, "MBFXPC LOG Failed to attach to the Bluetooth daemon as the XPC connection is invalid", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_6();
}

void _MBTAsyncAttach_cold_3()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_3(&dword_1B6BF1000, v0, v1, "_MBTAsyncAttach with XPC for session %s", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_4();
}

void BTSessionDetachWithQueue_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_1(&dword_1B6BF1000, v0, v1, "MBFXPC LOG BTSessionDetachWithQueue", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_6();
}

void BTSessionDetachWithQueue_cold_2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_1(&dword_1B6BF1000, v0, v1, "MBFXPC LOG BTSessionDetachWithQueue failed due to invalid Session over XPC", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_6();
}

void notifyStubsOfDisconnection_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_3(&dword_1B6BF1000, v0, v1, "MBFXPC LOG Skipped notifyClientsOfDisconnection because fwSession for connection %p was NULL", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_4();
}

void _MBTDispachAsyncAttachCompletionBlock_cold_1()
{
  uint64_t v0;
  os_log_t v1;
  const void *v2;
  const void *v3;

  OUTLINED_FUNCTION_12_0(*MEMORY[0x1E0C80C00]);
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_9_0(&dword_1B6BF1000, v0, v1, "_MBTDispachAsyncAttachCompletionBlock session:%p queue:%p calling on current queue", v2, v3);
  OUTLINED_FUNCTION_4();
}

void _MBTDispachAsyncAttachCompletionBlock_cold_2()
{
  uint64_t v0;
  os_log_t v1;
  const void *v2;
  const void *v3;

  OUTLINED_FUNCTION_12_0(*MEMORY[0x1E0C80C00]);
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_9_0(&dword_1B6BF1000, v0, v1, "_MBTDispachAsyncAttachCompletionBlock session:%p queue:%p dispatching on client queue", v2, v3);
  OUTLINED_FUNCTION_4();
}

void _MBTDispachAsyncAttachCompletionBlock_cold_3()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[24];
  uint64_t v3;

  v3 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_9(&dword_1B6BF1000, v0, v1, "_MBTDispachAsyncAttachCompletionBlock session %llx queue:%p", v2);
  OUTLINED_FUNCTION_4();
}

void _MBTSignalSessionEvent_cold_1()
{
  int v0;
  os_log_t v1;
  uint8_t v2[12];
  __int16 v3;
  int v4;
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_5();
  v3 = 1024;
  v4 = v0;
  _os_log_debug_impl(&dword_1B6BF1000, v1, OS_LOG_TYPE_DEBUG, "_MBTSignalSessionEvent Session : %llx Event:%d", v2, 0x12u);
  OUTLINED_FUNCTION_4();
}

void xpcConnectionDidReset_cold_1()
{
  os_log_t v0;
  uint8_t v1[24];
  uint64_t v2;

  v2 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_5();
  _os_log_error_impl(&dword_1B6BF1000, v0, OS_LOG_TYPE_ERROR, "MBFXPC LOG Skipped xpcConnectionDidReset because fwSession for connection %p was NULL", v1, 0xCu);
  OUTLINED_FUNCTION_4();
}

void xpcConnectionDidReset_cold_2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_3(&dword_1B6BF1000, v0, v1, "MBFXPC LOG disconnect brought to you by xpcConnectionDidReset %p", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_4();
}

void xpcConnectionDidReset_cold_3()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_3(&dword_1B6BF1000, v0, v1, "MBFXPC LOG  xpcConnection Reset for XPC connection:%llx", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_4();
}

void xpcConnectionInvalid_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_3(&dword_1B6BF1000, v0, v1, "MBFXPC LOG Skipped xpcConnectionInvalid because fwSession for connection %p was NULL", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_4();
}

void xpcConnectionInvalid_cold_2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_3(&dword_1B6BF1000, v0, v1, "MBFXPC LOG xpcConnection invalid for XPC connection:%llx", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_4();
}

void __xpcConnectionInvalid_block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_10(&dword_1B6BF1000, v0, v1, "MBFXPC LOG Unexpected XPC Invalidation", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_6();
}

void __xpcConnectionInvalid_block_invoke_cold_2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_6_1(*MEMORY[0x1E0C80C00]);
  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_3(&dword_1B6BF1000, v0, v1, "MBFXPC LOG Signalling BT_SESSION_DETACHED SUCCESS XPC:%p", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_4();
}

void __xpcConnectionInvalid_block_invoke_cold_3()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_6_1(*MEMORY[0x1E0C80C00]);
  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_3(&dword_1B6BF1000, v0, v1, "MBFXPC LOG Signalling BT_SESSION_ATTACHED BT_ERROR XPC:%p", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_4();
}

void __xpcConnectionInvalid_block_invoke_cold_4()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_6_1(*MEMORY[0x1E0C80C00]);
  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_3(&dword_1B6BF1000, v0, v1, "MBFXPC LOG Signalling BT_SESSION_TERMINATED BT_SUCCESS XPC:%p", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_4();
}

kern_return_t IOObjectRelease(io_object_t object)
{
  return MEMORY[0x1E0CBB6F0](*(_QWORD *)&object);
}

io_service_t IOServiceGetMatchingService(mach_port_t mainPort, CFDictionaryRef matching)
{
  return MEMORY[0x1E0CBB9E0](*(_QWORD *)&mainPort, matching);
}

CFMutableDictionaryRef IOServiceNameMatching(const char *name)
{
  return (CFMutableDictionaryRef)MEMORY[0x1E0CBBA08](name);
}

uint64_t MGGetBoolAnswer()
{
  return MEMORY[0x1E0DE2B50]();
}

void _Block_object_dispose(const void *a1, const int a2)
{
  MEMORY[0x1E0C80948](a1, *(_QWORD *)&a2);
}

uint64_t __strlcpy_chk()
{
  return MEMORY[0x1E0C80C48]();
}

void _os_log_debug_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x1E0C81020](dso, log, type, format, buf, *(_QWORD *)&size);
}

void _os_log_error_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x1E0C81038](dso, log, type, format, buf, *(_QWORD *)&size);
}

void _os_log_fault_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x1E0C81040](dso, log, type, format, buf, *(_QWORD *)&size);
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x1E0C81048](dso, log, type, format, buf, *(_QWORD *)&size);
}

void bzero(void *a1, size_t a2)
{
  MEMORY[0x1E0C81758](a1, a2);
}

void dispatch_after_f(dispatch_time_t when, dispatch_queue_t queue, void *context, dispatch_function_t work)
{
  MEMORY[0x1E0C82BD0](when, queue, context, work);
}

void dispatch_async(dispatch_queue_t queue, dispatch_block_t block)
{
  MEMORY[0x1E0C82C00](queue, block);
}

dispatch_queue_global_t dispatch_get_global_queue(intptr_t identifier, uintptr_t flags)
{
  return (dispatch_queue_global_t)MEMORY[0x1E0C82D00](identifier, flags);
}

void dispatch_once_f(dispatch_once_t *predicate, void *context, dispatch_function_t function)
{
  MEMORY[0x1E0C82E10](predicate, context, function);
}

dispatch_queue_attr_t dispatch_queue_attr_make_with_autorelease_frequency(dispatch_queue_attr_t attr, dispatch_autorelease_frequency_t frequency)
{
  return (dispatch_queue_attr_t)MEMORY[0x1E0C82E28](attr, frequency);
}

dispatch_queue_attr_t dispatch_queue_attr_make_with_qos_class(dispatch_queue_attr_t attr, dispatch_qos_class_t qos_class, int relative_priority)
{
  return (dispatch_queue_attr_t)MEMORY[0x1E0C82E38](attr, *(_QWORD *)&qos_class, *(_QWORD *)&relative_priority);
}

dispatch_queue_t dispatch_queue_create(const char *label, dispatch_queue_attr_t attr)
{
  return (dispatch_queue_t)MEMORY[0x1E0C82E48](label, attr);
}

dispatch_queue_t dispatch_queue_create_with_target_V2(const char *label, dispatch_queue_attr_t attr, dispatch_queue_t target)
{
  return (dispatch_queue_t)MEMORY[0x1E0C82E50](label, attr, target);
}

const char *__cdecl dispatch_queue_get_label(dispatch_queue_t queue)
{
  return (const char *)MEMORY[0x1E0C82E58](queue);
}

dispatch_qos_class_t dispatch_queue_get_qos_class(dispatch_queue_t queue, int *relative_priority_ptr)
{
  return MEMORY[0x1E0C82E60](queue, relative_priority_ptr);
}

void dispatch_release(dispatch_object_t object)
{
  MEMORY[0x1E0C82E98](object);
}

void dispatch_retain(dispatch_object_t object)
{
  MEMORY[0x1E0C82EA8](object);
}

dispatch_time_t dispatch_time(dispatch_time_t when, int64_t delta)
{
  return MEMORY[0x1E0C82FB8](when, delta);
}

long double exp2(long double __x)
{
  long double result;

  MEMORY[0x1E0C83288](__x);
  return result;
}

void free(void *a1)
{
  MEMORY[0x1E0C834A8](a1);
}

void *__cdecl malloc_type_calloc(size_t count, size_t size, malloc_type_id_t type_id)
{
  return (void *)MEMORY[0x1E0C83EF8](count, size, type_id);
}

void *__cdecl malloc_type_malloc(size_t size, malloc_type_id_t type_id)
{
  return (void *)MEMORY[0x1E0C83F00](size, type_id);
}

int memcmp(const void *__s1, const void *__s2, size_t __n)
{
  return MEMORY[0x1E0C84078](__s1, __s2, __n);
}

void *__cdecl memcpy(void *__dst, const void *__src, size_t __n)
{
  return (void *)MEMORY[0x1E0C84088](__dst, __src, __n);
}

os_log_t os_log_create(const char *subsystem, const char *category)
{
  return (os_log_t)MEMORY[0x1E0C84728](subsystem, category);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x1E0C84780](oslog, type);
}

int pthread_mutex_lock(pthread_mutex_t *a1)
{
  return MEMORY[0x1E0C84E28](a1);
}

int pthread_mutex_unlock(pthread_mutex_t *a1)
{
  return MEMORY[0x1E0C84E38](a1);
}

int strcmp(const char *__s1, const char *__s2)
{
  return MEMORY[0x1E0C85520](__s1, __s2);
}

char *__cdecl strcpy(char *__dst, const char *__src)
{
  return (char *)MEMORY[0x1E0C85530](__dst, __src);
}

char *__cdecl strdup(const char *__s1)
{
  return (char *)MEMORY[0x1E0C85540](__s1);
}

size_t strlcpy(char *__dst, const char *__source, size_t __size)
{
  return MEMORY[0x1E0C85570](__dst, __source, __size);
}

xpc_object_t xpc_array_create(xpc_object_t *objects, size_t count)
{
  return (xpc_object_t)MEMORY[0x1E0C85E00](objects, count);
}

size_t xpc_array_get_count(xpc_object_t xarray)
{
  return MEMORY[0x1E0C85E30](xarray);
}

const void *__cdecl xpc_array_get_data(xpc_object_t xarray, size_t index, size_t *length)
{
  return (const void *)MEMORY[0x1E0C85E40](xarray, index, length);
}

const char *__cdecl xpc_array_get_string(xpc_object_t xarray, size_t index)
{
  return (const char *)MEMORY[0x1E0C85E70](xarray, index);
}

uint64_t xpc_array_get_uint64(xpc_object_t xarray, size_t index)
{
  return MEMORY[0x1E0C85E78](xarray, index);
}

xpc_object_t xpc_array_get_value(xpc_object_t xarray, size_t index)
{
  return (xpc_object_t)MEMORY[0x1E0C85E90](xarray, index);
}

void xpc_array_set_data(xpc_object_t xarray, size_t index, const void *bytes, size_t length)
{
  MEMORY[0x1E0C85EA8](xarray, index, bytes, length);
}

void xpc_array_set_uint64(xpc_object_t xarray, size_t index, uint64_t value)
{
  MEMORY[0x1E0C85ED8](xarray, index, value);
}

void xpc_connection_activate(xpc_connection_t connection)
{
  MEMORY[0x1E0C85F50](connection);
}

void xpc_connection_cancel(xpc_connection_t connection)
{
  MEMORY[0x1E0C85F68](connection);
}

xpc_connection_t xpc_connection_create_mach_service(const char *name, dispatch_queue_t targetq, uint64_t flags)
{
  return (xpc_connection_t)MEMORY[0x1E0C85FB0](name, targetq, flags);
}

void *__cdecl xpc_connection_get_context(xpc_connection_t connection)
{
  return (void *)MEMORY[0x1E0C85FE0](connection);
}

void xpc_connection_send_message(xpc_connection_t connection, xpc_object_t message)
{
  MEMORY[0x1E0C86030](connection, message);
}

xpc_object_t xpc_connection_send_message_with_reply_sync(xpc_connection_t connection, xpc_object_t message)
{
  return (xpc_object_t)MEMORY[0x1E0C86048](connection, message);
}

void xpc_connection_set_context(xpc_connection_t connection, void *context)
{
  MEMORY[0x1E0C86070](connection, context);
}

void xpc_connection_set_event_handler(xpc_connection_t connection, xpc_handler_t handler)
{
  MEMORY[0x1E0C86080](connection, handler);
}

void xpc_connection_set_finalizer_f(xpc_connection_t connection, xpc_finalizer_t finalizer)
{
  MEMORY[0x1E0C86088](connection, finalizer);
}

xpc_object_t xpc_copy(xpc_object_t object)
{
  return (xpc_object_t)MEMORY[0x1E0C860E8](object);
}

xpc_object_t xpc_dictionary_create(const char *const *keys, xpc_object_t *values, size_t count)
{
  return (xpc_object_t)MEMORY[0x1E0C86208](keys, values, count);
}

xpc_object_t xpc_dictionary_get_array(xpc_object_t xdict, const char *key)
{
  return (xpc_object_t)MEMORY[0x1E0C86248](xdict, key);
}

BOOL xpc_dictionary_get_BOOL(xpc_object_t xdict, const char *key)
{
  return MEMORY[0x1E0C86260](xdict, key);
}

const void *__cdecl xpc_dictionary_get_data(xpc_object_t xdict, const char *key, size_t *length)
{
  return (const void *)MEMORY[0x1E0C86278](xdict, key, length);
}

const char *__cdecl xpc_dictionary_get_string(xpc_object_t xdict, const char *key)
{
  return (const char *)MEMORY[0x1E0C862C8](xdict, key);
}

uint64_t xpc_dictionary_get_uint64(xpc_object_t xdict, const char *key)
{
  return MEMORY[0x1E0C862D0](xdict, key);
}

xpc_object_t xpc_dictionary_get_value(xpc_object_t xdict, const char *key)
{
  return (xpc_object_t)MEMORY[0x1E0C862E0](xdict, key);
}

void xpc_dictionary_set_data(xpc_object_t xdict, const char *key, const void *bytes, size_t length)
{
  MEMORY[0x1E0C86330](xdict, key, bytes, length);
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

xpc_type_t xpc_get_type(xpc_object_t object)
{
  return (xpc_type_t)MEMORY[0x1E0C86520](object);
}

void xpc_release(xpc_object_t object)
{
  MEMORY[0x1E0C86658](object);
}

