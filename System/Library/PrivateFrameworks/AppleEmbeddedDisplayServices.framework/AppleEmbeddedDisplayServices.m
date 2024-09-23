uint64_t BIMUpdaterGetTypeID()
{
  if (BIMUpdaterGetTypeID_onceToken != -1)
    dispatch_once(&BIMUpdaterGetTypeID_onceToken, &__block_literal_global);
  return BIMUpdaterGetTypeID_typeID;
}

uint64_t BIMUpdaterCreate(void *a1, void *a2, void *a3)
{
  NSObject *v5;
  id v6;
  id v7;
  uint64_t Instance;
  uint64_t v9;
  dispatch_queue_t v10;
  void *v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  void *v15;
  mach_port_t v16;
  void *v17;
  void *v18;
  uint64_t v20;
  _OWORD v21[5];
  uint64_t v22;

  v22 = *MEMORY[0x24BDAC8D0];
  v5 = a1;
  v6 = a2;
  v7 = a3;
  if (BIMUpdaterGetTypeID_onceToken != -1)
    dispatch_once(&BIMUpdaterGetTypeID_onceToken, &__block_literal_global);
  Instance = _CFRuntimeCreateInstance();
  if (!Instance)
    BIMUpdaterCreate_cold_1(&v20, v21);
  v9 = Instance;
  *(_WORD *)(Instance + 16) = 0;
  *(_BYTE *)(Instance + 18) = 0;
  *(_DWORD *)(Instance + 20) = 0;
  v10 = dispatch_queue_create_with_target_V2("BIM-Queue", 0, v5);
  v11 = *(void **)(v9 + 24);
  *(_QWORD *)(v9 + 24) = v10;

  v12 = MEMORY[0x23B7F3430](v6);
  v13 = *(void **)(v9 + 32);
  *(_QWORD *)(v9 + 32) = v12;

  v14 = MEMORY[0x23B7F3430](v7);
  v15 = *(void **)(v9 + 40);
  *(_QWORD *)(v9 + 40) = v14;

  v16 = *MEMORY[0x24BDD8B18];
  *(_QWORD *)(v9 + 48) = IONotificationPortCreate(*MEMORY[0x24BDD8B18]);
  *(_DWORD *)(v9 + 56) = 0;
  *(_QWORD *)(v9 + 64) = IONotificationPortCreate(v16);
  *(_QWORD *)(v9 + 72) = 0;
  v17 = *(void **)(v9 + 80);
  *(_QWORD *)(v9 + 80) = 0;

  v18 = *(void **)(v9 + 88);
  *(_QWORD *)(v9 + 88) = 0;

  if (!*(_QWORD *)(v9 + 24)
    || !*(_QWORD *)(v9 + 32)
    || !*(_QWORD *)(v9 + 40)
    || !*(_QWORD *)(v9 + 48)
    || !*(_QWORD *)(v9 + 64))
  {
    BIMUpdaterCreate_cold_2(&v20, v21);
  }

  return v9;
}

uint64_t BIMUpdaterActivate(uint64_t a1)
{
  os_unfair_lock_s *v2;
  uint64_t v3;
  NSObject *v4;
  NSObject *v5;
  _QWORD v7[5];
  _QWORD block[5];
  uint64_t v9;
  _OWORD v10[5];
  uint64_t v11;

  v11 = *MEMORY[0x24BDAC8D0];
  v2 = (os_unfair_lock_s *)(a1 + 20);
  os_unfair_lock_lock((os_unfair_lock_t)(a1 + 20));
  if (*(_BYTE *)(a1 + 16))
    BIMUpdaterActivate_cold_1(&v9, v10);
  *(_BYTE *)(a1 + 16) = 1;
  IONotificationPortSetDispatchQueue(*(IONotificationPortRef *)(a1 + 48), *(dispatch_queue_t *)(a1 + 24));
  IONotificationPortSetDispatchQueue(*(IONotificationPortRef *)(a1 + 64), *(dispatch_queue_t *)(a1 + 24));
  IOServiceAddMatchingNotification(*(IONotificationPortRef *)(a1 + 48), "IOServiceFirstPublish", (CFDictionaryRef)&unk_2507CA6D0, (IOServiceMatchingCallback)__eepromServiceCB, (void *)a1, (io_iterator_t *)(a1 + 56));
  CFRetain((CFTypeRef)a1);
  v3 = MEMORY[0x24BDAC760];
  v4 = *(NSObject **)(a1 + 24);
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __BIMUpdaterActivate_block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  dispatch_async(v4, block);
  IOServiceAddMatchingNotification(*(IONotificationPortRef *)(a1 + 64), "IOServiceFirstPublish", (CFDictionaryRef)&unk_2507CA720, (IOServiceMatchingCallback)__afkServiceCB, (void *)a1, (io_iterator_t *)(a1 + 72));
  CFRetain((CFTypeRef)a1);
  v5 = *(NSObject **)(a1 + 24);
  v7[0] = v3;
  v7[1] = 3221225472;
  v7[2] = __BIMUpdaterActivate_block_invoke_2;
  v7[3] = &__block_descriptor_40_e5_v8__0l;
  v7[4] = a1;
  dispatch_async(v5, v7);
  os_unfair_lock_unlock(v2);
  return 1;
}

uint64_t __eepromServiceCB(uint64_t a1, io_iterator_t iterator)
{
  uint64_t result;
  io_service_t v5;
  task_port_t *v6;
  kern_return_t v7;
  kern_return_t v8;
  NSObject *v9;
  uint8_t buf[4];
  kern_return_t v11;
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  result = IOIteratorNext(iterator);
  if ((_DWORD)result)
  {
    v5 = result;
    v6 = (task_port_t *)MEMORY[0x24BDAEC58];
    while (1)
    {
      os_unfair_lock_lock((os_unfair_lock_t)(a1 + 20));
      if (*(_BYTE *)(a1 + 17) || *(_DWORD *)(a1 + 76) || *(_QWORD *)(a1 + 80))
        goto LABEL_13;
      v7 = IOServiceOpen(v5, *v6, 0, (io_connect_t *)(a1 + 76));
      if (v7)
        break;
      os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 20));
      (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
LABEL_8:
      result = IOIteratorNext(iterator);
      v5 = result;
      if (!(_DWORD)result)
        return result;
    }
    v8 = v7;
    v9 = os_log_create("AppleEmbeddedDisplayServices", "BIMUpdate");
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 67109120;
      v11 = v8;
      _os_log_error_impl(&dword_23643F000, v9, OS_LOG_TYPE_ERROR, "Failed to connect to EEPROM service: 0x%x", buf, 8u);
    }

LABEL_13:
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 20));
    goto LABEL_8;
  }
  return result;
}

uint64_t __afkServiceCB(uint64_t a1, io_iterator_t iterator)
{
  uint64_t result;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  NSObject *v11;
  _QWORD v12[5];
  uint8_t buf;
  _BYTE v14[15];

  result = IOIteratorNext(iterator);
  if ((_DWORD)result)
  {
    v5 = result;
    v6 = MEMORY[0x24BDAC760];
    while (1)
    {
      os_unfair_lock_lock((os_unfair_lock_t)(a1 + 20));
      if (*(_BYTE *)(a1 + 17) || *(_QWORD *)(a1 + 80) || *(_DWORD *)(a1 + 76))
        goto LABEL_13;
      objc_msgSend(MEMORY[0x24BDFCA60], "withService:", v5);
      v7 = objc_claimAutoreleasedReturnValue();
      v8 = *(void **)(a1 + 80);
      *(_QWORD *)(a1 + 80) = v7;

      v9 = *(void **)(a1 + 80);
      if (!v9)
        break;
      objc_msgSend(v9, "setDispatchQueue:", *(_QWORD *)(a1 + 24));
      CFRetain((CFTypeRef)a1);
      v10 = *(void **)(a1 + 80);
      v12[0] = v6;
      v12[1] = 3221225472;
      v12[2] = ____afkConnect_block_invoke;
      v12[3] = &__block_descriptor_40_e46_v32__0__AFKEndpointInterface_8__NSString_16_24l;
      v12[4] = a1;
      objc_msgSend(v10, "setEventHandler:", v12);
      objc_msgSend(*(id *)(a1 + 80), "activate:", 0);
      os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 20));
      (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
LABEL_8:
      result = IOIteratorNext(iterator);
      v5 = result;
      if (!(_DWORD)result)
        return result;
    }
    v11 = os_log_create("AppleEmbeddedDisplayServices", "BIMUpdate");
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      __afkServiceCB_cold_1(&buf, v14, v11);

LABEL_13:
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 20));
    goto LABEL_8;
  }
  return result;
}

void BIMUpdaterCancel(uint64_t a1)
{
  os_unfair_lock_s *v2;
  io_connect_t v3;
  void *v4;
  NSObject *v5;
  int v6;
  int v7;
  _QWORD block[6];
  int v9;
  int v10;
  __int16 v11;
  int v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  v2 = (os_unfair_lock_s *)(a1 + 20);
  os_unfair_lock_lock((os_unfair_lock_t)(a1 + 20));
  if (!*(_BYTE *)(a1 + 16) || *(_BYTE *)(a1 + 17))
  {
    block[5] = 0;
    v16 = 0u;
    v17 = 0u;
    v14 = 0u;
    v15 = 0u;
    v13 = 0u;
    os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR);
    v6 = *(unsigned __int8 *)(a1 + 16);
    v7 = *(unsigned __int8 *)(a1 + 17);
    v9 = 67109376;
    v10 = v6;
    v11 = 1024;
    v12 = v7;
    _os_log_send_and_compose_impl();
    _os_crash_msg();
    __break(1u);
  }
  *(_BYTE *)(a1 + 17) = 1;
  IONotificationPortDestroy(*(IONotificationPortRef *)(a1 + 48));
  IONotificationPortDestroy(*(IONotificationPortRef *)(a1 + 64));
  v3 = *(_DWORD *)(a1 + 76);
  if (v3)
    IOServiceClose(v3);
  v4 = *(void **)(a1 + 80);
  if (v4)
  {
    objc_msgSend(v4, "cancel");
  }
  else
  {
    CFRetain((CFTypeRef)a1);
    v5 = *(NSObject **)(a1 + 24);
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __BIMUpdaterCancel_block_invoke;
    block[3] = &__block_descriptor_40_e5_v8__0l;
    block[4] = a1;
    dispatch_async(v5, block);
  }
  os_unfair_lock_unlock(v2);
}

uint64_t BIMUpdaterStartUpdate(uint64_t a1)
{
  os_unfair_lock_s *v2;
  uint64_t v3;
  id v4;
  void *v5;
  id v6;
  void *v7;
  uint64_t v8;
  void *v9;
  id v10;
  int v12;
  int v13;
  int v14;
  uint64_t v15;
  __int16 v16;
  int v17;
  __int16 v18;
  int v19;
  _OWORD v20[5];
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
  v2 = (os_unfair_lock_s *)(a1 + 20);
  os_unfair_lock_lock((os_unfair_lock_t)(a1 + 20));
  if (!*(_BYTE *)(a1 + 16) || *(_BYTE *)(a1 + 17) || *(_BYTE *)(a1 + 18))
  {
    memset(v20, 0, sizeof(v20));
    os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR);
    v12 = *(unsigned __int8 *)(a1 + 16);
    v13 = *(unsigned __int8 *)(a1 + 17);
    v14 = *(unsigned __int8 *)(a1 + 18);
    LODWORD(v15) = 67109632;
    HIDWORD(v15) = v12;
    v16 = 1024;
    v17 = v13;
    v18 = 1024;
    v19 = v14;
    _os_log_send_and_compose_impl();
    _os_crash_msg();
    __break(1u);
    goto LABEL_15;
  }
  v3 = *(_QWORD *)(a1 + 80);
  if (*(_DWORD *)(a1 + 76))
  {
    if (!v3)
    {
LABEL_12:
      *(_BYTE *)(a1 + 18) = 1;
      goto LABEL_13;
    }
    goto LABEL_8;
  }
  if (v3)
  {
LABEL_8:
    objc_msgSend(MEMORY[0x24BDE5660], "mainDisplay");
    v4 = (id)objc_claimAutoreleasedReturnValue();
    if (v4)
    {
      v5 = v4;

      objc_msgSend(v5, "stateControl");
      v6 = (id)objc_claimAutoreleasedReturnValue();
      if (!v6)
        BIMUpdaterStartUpdate_cold_2(&v15, v20);
      v7 = v6;

      v8 = objc_msgSend(v7, "createPowerAssertionWithReason:identifier:", 4, CFSTR("BIM Display Power Assertion"));
      v9 = *(void **)(a1 + 88);
      *(_QWORD *)(a1 + 88) = v8;

      v10 = *(id *)(a1 + 88);
      if (!v10)
        BIMUpdaterStartUpdate_cold_3(&v15, v20);

      objc_msgSend(*(id *)(a1 + 88), "acquireAndWaitForPowerOn");
      goto LABEL_12;
    }
LABEL_15:
    BIMUpdaterStartUpdate_cold_1(&v15, v20);
  }
LABEL_13:
  os_unfair_lock_unlock(v2);
  return *(unsigned __int8 *)(a1 + 18);
}

BOOL BIMUpdaterEndUpdate(uint64_t a1)
{
  os_unfair_lock_s *v2;
  uint64_t v3;
  void *v4;

  v2 = (os_unfair_lock_s *)(a1 + 20);
  os_unfair_lock_lock((os_unfair_lock_t)(a1 + 20));
  if (!*(_BYTE *)(a1 + 16) || *(_BYTE *)(a1 + 17) || !*(_BYTE *)(a1 + 18))
  {
    os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR);
    _os_log_send_and_compose_impl();
    _os_crash_msg();
    __break(1u);
  }
  v3 = *(_QWORD *)(a1 + 80);
  if (*(_DWORD *)(a1 + 76))
  {
    if (!v3)
      goto LABEL_9;
    goto LABEL_8;
  }
  if (v3)
  {
LABEL_8:
    objc_msgSend(*(id *)(a1 + 88), "cancel");
    objc_msgSend(*(id *)(a1 + 88), "invalidate");
    v4 = *(void **)(a1 + 88);
    *(_QWORD *)(a1 + 88) = 0;

LABEL_9:
    *(_BYTE *)(a1 + 18) = 0;
  }
  os_unfair_lock_unlock(v2);
  return *(_BYTE *)(a1 + 18) == 0;
}

uint64_t BIMUpdaterRead(uint64_t a1, uint64_t a2, void *a3)
{
  os_unfair_lock_s *v5;
  mach_port_t v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  int v11;
  int v12;
  uint64_t v13;
  size_t v14;
  uint64_t input;
  int v16;
  int v17;
  __int16 v18;
  int v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  uint64_t v25;

  v25 = *MEMORY[0x24BDAC8D0];
  v14 = 32;
  input = a2;
  v5 = (os_unfair_lock_s *)(a1 + 20);
  os_unfair_lock_lock((os_unfair_lock_t)(a1 + 20));
  if (!*(_BYTE *)(a1 + 16) || *(_BYTE *)(a1 + 17))
  {
    v23 = 0u;
    v24 = 0u;
    v21 = 0u;
    v22 = 0u;
    v20 = 0u;
    v5 = (os_unfair_lock_s *)MEMORY[0x24BDACB70];
    os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR);
    v11 = *(unsigned __int8 *)(a1 + 16);
    v12 = *(unsigned __int8 *)(a1 + 17);
    v16 = 67109376;
    v17 = v11;
    v18 = 1024;
    v19 = v12;
    _os_log_send_and_compose_impl();
    _os_crash_msg();
    __break(1u);
    goto LABEL_10;
  }
  v6 = *(_DWORD *)(a1 + 76);
  if (!v6)
  {
    v8 = *(void **)(a1 + 80);
    if (v8)
    {
      LODWORD(v13) = 0;
      v7 = objc_msgSend(v8, "enqueueCommandSync:timestamp:inputBuffer:inputBufferSize:responseTimestamp:outputBuffer:inOutBufferSize:options:", 193, mach_continuous_time(), &input, 8, 0, a3, &v14, v13);
      goto LABEL_7;
    }
LABEL_10:
    v9 = 3758097112;
    goto LABEL_8;
  }
  v7 = IOConnectCallMethod(v6, 1u, &input, 1u, 0, 0, 0, 0, a3, &v14);
LABEL_7:
  v9 = v7;
LABEL_8:
  os_unfair_lock_unlock(v5);
  return v9;
}

uint64_t BIMUpdaterWrite(uint64_t a1, uint64_t a2, __int128 *a3)
{
  __int128 v5;
  os_unfair_lock_s *v6;
  mach_port_t v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  int v12;
  int v13;
  uint64_t v14;
  uint64_t v15;
  __int128 v16;
  __int128 v17;
  uint64_t v18;
  uint64_t input;
  int v20;
  int v21;
  __int16 v22;
  int v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  uint64_t v29;

  v29 = *MEMORY[0x24BDAC8D0];
  v18 = 0;
  input = a2;
  v15 = a2;
  v5 = a3[1];
  v16 = *a3;
  v17 = v5;
  v6 = (os_unfair_lock_s *)(a1 + 20);
  os_unfair_lock_lock((os_unfair_lock_t)(a1 + 20));
  if (!*(_BYTE *)(a1 + 16) || *(_BYTE *)(a1 + 17))
  {
    v27 = 0u;
    v28 = 0u;
    v25 = 0u;
    v26 = 0u;
    v24 = 0u;
    v6 = (os_unfair_lock_s *)MEMORY[0x24BDACB70];
    os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR);
    v12 = *(unsigned __int8 *)(a1 + 16);
    v13 = *(unsigned __int8 *)(a1 + 17);
    v20 = 67109376;
    v21 = v12;
    v22 = 1024;
    v23 = v13;
    _os_log_send_and_compose_impl();
    _os_crash_msg();
    __break(1u);
    goto LABEL_10;
  }
  v7 = *(_DWORD *)(a1 + 76);
  if (!v7)
  {
    v9 = *(void **)(a1 + 80);
    if (v9)
    {
      LODWORD(v14) = 0;
      v8 = objc_msgSend(v9, "enqueueCommandSync:timestamp:inputBuffer:inputBufferSize:responseTimestamp:outputBuffer:inOutBufferSize:options:", 194, mach_continuous_time(), &v15, 40, 0, 0, &v18, v14);
      goto LABEL_7;
    }
LABEL_10:
    v10 = 3758097112;
    goto LABEL_8;
  }
  v8 = IOConnectCallMethod(v7, 0, &input, 1u, a3, 0x20uLL, 0, 0, 0, 0);
LABEL_7:
  v10 = v8;
LABEL_8:
  os_unfair_lock_unlock(v6);
  return v10;
}

void __finalize(uint64_t a1)
{
  CFTypeID v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  _OWORD v9[5];
  uint64_t v10;

  v10 = *MEMORY[0x24BDAC8D0];
  v2 = CFGetTypeID((CFTypeRef)a1);
  if (BIMUpdaterGetTypeID_onceToken != -1)
    dispatch_once(&BIMUpdaterGetTypeID_onceToken, &__block_literal_global);
  if (v2 != BIMUpdaterGetTypeID_typeID)
    __finalize_cold_2(&v8, v9);
  if (*(_BYTE *)(a1 + 16))
  {
    if (!*(_BYTE *)(a1 + 17))
      __finalize_cold_1(&v8, v9);
  }
  else
  {
    IONotificationPortDestroy(*(IONotificationPortRef *)(a1 + 48));
    IONotificationPortDestroy(*(IONotificationPortRef *)(a1 + 64));
  }
  IOObjectRelease(*(_DWORD *)(a1 + 56));
  IOObjectRelease(*(_DWORD *)(a1 + 72));
  v3 = *(void **)(a1 + 24);
  *(_QWORD *)(a1 + 24) = 0;

  v4 = *(void **)(a1 + 32);
  *(_QWORD *)(a1 + 32) = 0;

  v5 = *(void **)(a1 + 40);
  *(_QWORD *)(a1 + 40) = 0;

  *(_QWORD *)(a1 + 48) = 0;
  *(_DWORD *)(a1 + 56) = 0;
  *(_QWORD *)(a1 + 64) = 0;
  *(_QWORD *)(a1 + 72) = 0;
  v6 = *(void **)(a1 + 80);
  *(_QWORD *)(a1 + 80) = 0;

  v7 = *(void **)(a1 + 88);
  *(_QWORD *)(a1 + 88) = 0;

}

void ____afkConnect_block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  if (objc_msgSend(a3, "isEqual:", *MEMORY[0x24BDFCA68]))
  {
    (*(void (**)(void))(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 40) + 16))();
    CFRelease(*(CFTypeRef *)(a1 + 32));
  }
}

uint64_t OUTLINED_FUNCTION_0()
{
  return _os_log_send_and_compose_impl();
}

double OUTLINED_FUNCTION_1(_QWORD *a1, _OWORD *a2)
{
  double result;

  *a1 = 0;
  result = 0.0;
  a2[3] = 0u;
  a2[4] = 0u;
  a2[1] = 0u;
  a2[2] = 0u;
  *a2 = 0u;
  return result;
}

uint64_t OUTLINED_FUNCTION_3()
{
  return _os_crash_msg();
}

BOOL OUTLINED_FUNCTION_4()
{
  NSObject *v0;

  return os_log_type_enabled(v0, OS_LOG_TYPE_ERROR);
}

void BIMUpdaterCreate_cold_1(_QWORD *a1, _OWORD *a2)
{
  OUTLINED_FUNCTION_1(a1, a2);
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_3();
  __break(1u);
}

void BIMUpdaterCreate_cold_2(_QWORD *a1, _OWORD *a2)
{
  OUTLINED_FUNCTION_1(a1, a2);
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_3();
  __break(1u);
}

void BIMUpdaterActivate_cold_1(_QWORD *a1, _OWORD *a2)
{
  OUTLINED_FUNCTION_1(a1, a2);
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_3();
  __break(1u);
}

void __afkServiceCB_cold_1(uint8_t *buf, _BYTE *a2, os_log_t log)
{
  *buf = 0;
  *a2 = 0;
  _os_log_error_impl(&dword_23643F000, log, OS_LOG_TYPE_ERROR, "Failed to create AFKEndpointInterface", buf, 2u);
}

void BIMUpdaterStartUpdate_cold_1(_QWORD *a1, _OWORD *a2)
{
  OUTLINED_FUNCTION_1(a1, a2);
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_3();
  __break(1u);
}

void BIMUpdaterStartUpdate_cold_2(_QWORD *a1, _OWORD *a2)
{
  OUTLINED_FUNCTION_1(a1, a2);
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_3();
  __break(1u);
}

void BIMUpdaterStartUpdate_cold_3(_QWORD *a1, _OWORD *a2)
{
  OUTLINED_FUNCTION_1(a1, a2);
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_3();
  __break(1u);
}

void __finalize_cold_1(_QWORD *a1, _OWORD *a2)
{
  OUTLINED_FUNCTION_1(a1, a2);
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_3();
  __break(1u);
}

void __finalize_cold_2(_QWORD *a1, _OWORD *a2)
{
  const void *v2;

  OUTLINED_FUNCTION_1(a1, a2);
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  v2 = (const void *)OUTLINED_FUNCTION_3();
  __break(1u);
  CFGetTypeID(v2);
}

CFTypeID CFGetTypeID(CFTypeRef cf)
{
  return MEMORY[0x24BDBBEF8](cf);
}

void CFRelease(CFTypeRef cf)
{
  MEMORY[0x24BDBC298](cf);
}

CFTypeRef CFRetain(CFTypeRef cf)
{
  return (CFTypeRef)MEMORY[0x24BDBC2A8](cf);
}

kern_return_t IOConnectCallMethod(mach_port_t connection, uint32_t selector, const uint64_t *input, uint32_t inputCnt, const void *inputStruct, size_t inputStructCnt, uint64_t *output, uint32_t *outputCnt, void *outputStruct, size_t *outputStructCnt)
{
  return MEMORY[0x24BDD7EF8](*(_QWORD *)&connection, *(_QWORD *)&selector, input, *(_QWORD *)&inputCnt, inputStruct, inputStructCnt, output, outputCnt);
}

io_object_t IOIteratorNext(io_iterator_t iterator)
{
  return MEMORY[0x24BDD8668](*(_QWORD *)&iterator);
}

IONotificationPortRef IONotificationPortCreate(mach_port_t mainPort)
{
  return (IONotificationPortRef)MEMORY[0x24BDD8690](*(_QWORD *)&mainPort);
}

void IONotificationPortDestroy(IONotificationPortRef notify)
{
  MEMORY[0x24BDD8698](notify);
}

void IONotificationPortSetDispatchQueue(IONotificationPortRef notify, dispatch_queue_t queue)
{
  MEMORY[0x24BDD86B0](notify, queue);
}

kern_return_t IOObjectRelease(io_object_t object)
{
  return MEMORY[0x24BDD86F8](*(_QWORD *)&object);
}

kern_return_t IOServiceAddMatchingNotification(IONotificationPortRef notifyPort, const io_name_t notificationType, CFDictionaryRef matching, IOServiceMatchingCallback callback, void *refCon, io_iterator_t *notification)
{
  return MEMORY[0x24BDD8960](notifyPort, notificationType, matching, callback, refCon, notification);
}

kern_return_t IOServiceClose(io_connect_t connect)
{
  return MEMORY[0x24BDD8970](*(_QWORD *)&connect);
}

kern_return_t IOServiceOpen(io_service_t service, task_port_t owningTask, uint32_t type, io_connect_t *connect)
{
  return MEMORY[0x24BDD89B8](*(_QWORD *)&service, *(_QWORD *)&owningTask, *(_QWORD *)&type, connect);
}

uint64_t _CFRuntimeCreateInstance()
{
  return MEMORY[0x24BDBD0A8]();
}

uint64_t _CFRuntimeRegisterClass()
{
  return MEMORY[0x24BDBD0B0]();
}

uint64_t _os_crash_msg()
{
  return MEMORY[0x24BDACB58]();
}

void _os_log_error_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x24BDACB80](dso, log, type, format, buf, *(_QWORD *)&size);
}

uint64_t _os_log_send_and_compose_impl()
{
  return MEMORY[0x24BDACBA8]();
}

void dispatch_async(dispatch_queue_t queue, dispatch_block_t block)
{
  MEMORY[0x24BDADCC0](queue, block);
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
  MEMORY[0x24BDADE98](predicate, block);
}

dispatch_queue_t dispatch_queue_create_with_target_V2(const char *label, dispatch_queue_attr_t attr, dispatch_queue_t target)
{
  return (dispatch_queue_t)MEMORY[0x24BDADED8](label, attr, target);
}

uint64_t mach_continuous_time(void)
{
  return MEMORY[0x24BDAEB48]();
}

uint64_t objc_claimAutoreleasedReturnValue()
{
  return MEMORY[0x24BEDCFE8]();
}

void objc_release(id a1)
{
  MEMORY[0x24BEDD188](a1);
}

id objc_retain(id a1)
{
  return (id)MEMORY[0x24BEDD2A0](a1);
}

id objc_retainBlock(id a1)
{
  return (id)MEMORY[0x24BEDD2C0](a1);
}

os_log_t os_log_create(const char *subsystem, const char *category)
{
  return (os_log_t)MEMORY[0x24BDAF368](subsystem, category);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x24BDAF398](oslog, type);
}

void os_unfair_lock_lock(os_unfair_lock_t lock)
{
  MEMORY[0x24BDAF460](lock);
}

void os_unfair_lock_unlock(os_unfair_lock_t lock)
{
  MEMORY[0x24BDAF488](lock);
}

