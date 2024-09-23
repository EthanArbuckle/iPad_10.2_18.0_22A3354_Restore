uint64_t _AXNextIgnoredNotification()
{
  return AXIgnoredNotification;
}

void AXSetPipPid(uint64_t a1)
{
  void *v1;
  void *v2;
  _QWORD v3[2];
  _QWORD v4[3];

  v4[2] = *MEMORY[0x1E0C80C00];
  _PipPid = a1;
  v3[0] = CFSTR("pid");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", a1);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v3[1] = CFSTR("pipPid");
  v4[0] = v1;
  v4[1] = MEMORY[0x1E0C9AAB0];
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v4, v3, 2);
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  AXPushNotificationToSystemForBroadcast();
}

void AXBroadcastNotificationToAllClients(int a1, int a2, CFTypeRef cf)
{
  id v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  uint64_t v15;
  uint64_t v16;
  void (*v17)(uint64_t);
  void *v18;
  id v19;
  int v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  if (_AXInitializeObserverAccess_onceToken == -1)
  {
    if (!cf)
      goto LABEL_4;
    goto LABEL_3;
  }
  dispatch_once(&_AXInitializeObserverAccess_onceToken, &__block_literal_global_6);
  if (cf)
LABEL_3:
    CFRetain(cf);
LABEL_4:
  v5 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v15 = MEMORY[0x1E0C809B0];
  v16 = 3221225472;
  v17 = __AXBroadcastNotificationToAllClients_block_invoke;
  v18 = &unk_1E6919718;
  v20 = a1;
  v19 = v5;
  AX_PERFORM_WITH_LOCK();
  v13 = 0u;
  v14 = 0u;
  v11 = 0u;
  v12 = 0u;
  v6 = v19;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v11, v21, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v12;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v12 != v9)
          objc_enumerationMutation(v6);
        objc_msgSend(*(id *)(*((_QWORD *)&v11 + 1) + 8 * i), "observer", (_QWORD)v11);
        _AXUIElementPostNotification();
      }
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v11, v21, 16);
    }
    while (v8);
  }

  if (cf)
    CFRelease(cf);

}

uint64_t _AXUIElementPostNotification()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  int v5;
  int v6;
  const void *v7;
  NSObject *v8;
  int v9;
  uint64_t result;
  CFDataRef v11;
  uint64_t *v12;
  void *v13;
  __int128 v14;
  _QWORD aBlock[6];
  __int128 v16;
  void *v17;
  unsigned int v18;
  int v19;
  int v20;
  int v21;
  uint64_t v22;
  uint64_t *v23;
  uint64_t v24;
  uint64_t v25;
  int v26;
  void *v27;
  unsigned int length;
  int length_4;
  BOOL v30;
  __int128 v31;
  uint8_t buf[32];
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  __int128 v60;
  __int128 v61;
  __int128 v62;
  uint64_t v63;

  v0 = MEMORY[0x1E0C80A78]();
  v2 = v1;
  v4 = v3;
  v6 = v5;
  v7 = (const void *)v0;
  v63 = *MEMORY[0x1E0C80C00];
  v31 = 0uLL;
  v30 = 0;
  length_4 = 0;
  AXRuntimeLogNotifications();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 67109378;
    *(_DWORD *)&buf[4] = v6;
    *(_WORD *)&buf[8] = 2112;
    *(_QWORD *)&buf[10] = v2;
    _os_log_impl(&dword_1B54A6000, v8, OS_LOG_TYPE_INFO, "Sending notification to client: %d, %@", buf, 0x12u);
  }

  if (v4)
  {
    if (!v7)
      return 4294942095;
  }
  else
  {
    v4 = AXUIElementSharedSystemWide();
    if (!v7)
      return 4294942095;
  }
  v9 = _AXUIElementValidate(v4, &v30, &v31, &length_4);
  if (v9 < 0)
    return 4294942095;
  v14 = v31;
  if (_AXUIElementPostNotification_registerOnce != -1)
    dispatch_once(&_AXUIElementPostNotification_registerOnce, &__block_literal_global_236);
  v61 = 0u;
  v62 = 0u;
  v59 = 0u;
  v60 = 0u;
  v57 = 0u;
  v58 = 0u;
  v55 = 0u;
  v56 = 0u;
  v53 = 0u;
  v54 = 0u;
  v51 = 0u;
  v52 = 0u;
  v49 = 0u;
  v50 = 0u;
  v47 = 0u;
  v48 = 0u;
  v45 = 0u;
  v46 = 0u;
  v43 = 0u;
  v44 = 0u;
  v41 = 0u;
  v42 = 0u;
  v39 = 0u;
  v40 = 0u;
  v37 = 0u;
  v38 = 0u;
  v35 = 0u;
  v36 = 0u;
  v33 = 0u;
  v34 = 0u;
  memset(buf, 0, sizeof(buf));
  length = 0;
  v27 = 0;
  v26 = 0;
  if (v2)
  {
    result = AXSerializeWrapper(v2, 1, buf, &length, &v27, &v26);
    if ((_DWORD)result)
      return result;
    v22 = 0;
    v23 = &v22;
    v24 = 0x2020000000;
    v25 = 0;
    if (!length)
      goto LABEL_17;
    v11 = CFDataCreate((CFAllocatorRef)*MEMORY[0x1E0C9AE00], buf, length);
    v12 = v23;
  }
  else
  {
    v11 = 0;
    v12 = &v22;
    v22 = 0;
    v23 = &v22;
    v24 = 0x2020000000;
  }
  v12[3] = (uint64_t)v11;
LABEL_17:
  getpid();
  CFRetain(v7);
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = ___AXUIElementPostNotification_block_invoke_2;
  aBlock[3] = &unk_1E6918EA0;
  aBlock[4] = &v22;
  aBlock[5] = v7;
  v18 = length;
  v19 = v9;
  v16 = v14;
  v17 = v27;
  v20 = v6;
  v21 = v26;
  v13 = _Block_copy(aBlock);
  dispatch_async((dispatch_queue_t)_AXUIElementPostNotification_DifferentQueue, v13);

  _Block_object_dispose(&v22, 8);
  return 0;
}

void sub_1B54A8698(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, ...)
{
  va_list va;

  va_start(va, a15);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t mshMIGPerform(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v6;
  int v7;
  int v8;
  unsigned int v9;
  void (*v11)(uint64_t, mach_msg_header_t *);
  uint64_t v12;
  uint64_t v13;
  mach_msg_header_t *v14;
  int v15;
  mach_port_t v16;
  uint64_t v17;
  int v18;
  uint64_t (*v19)(void);
  mach_port_mscount_t v20;
  mach_port_name_t v21;
  ipc_space_t v22;
  void (*v23)(uint64_t, _QWORD);
  mach_port_t msgh_remote_port;
  mach_msg_option_t v25;
  mach_msg_return_t v26;
  FILE *v27;
  pid_t v28;
  mach_port_t previous;
  mach_port_mscount_t v31;
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  v6 = *(_QWORD *)(a4 + 32);
  v7 = *(_DWORD *)(a1 + 20);
  v8 = *(_DWORD *)(v6 + 8);
  v9 = 36;
  if (*(_DWORD *)(v6 + 12) <= v7 || v7 < v8)
  {
    v11 = 0;
  }
  else
  {
    v12 = v6 + 40 * (v7 - v8);
    v11 = *(void (**)(uint64_t, mach_msg_header_t *))(v12 + 40);
    if (*(_DWORD *)(v12 + 64) <= 0x24u)
      v9 = 36;
    else
      v9 = *(_DWORD *)(v12 + 64);
  }
  MEMORY[0x1E0C80A78]();
  v14 = (mach_msg_header_t *)((char *)&previous - v13);
  bzero((char *)&previous - v13, v15);
  if (v9 > 0x2000)
  {
    v14 = (mach_msg_header_t *)malloc_type_malloc(v9, 0x381CB9CDuLL);
    v7 = *(_DWORD *)(a1 + 20);
  }
  v14->msgh_bits = *(_DWORD *)a1 & 0x1F;
  v16 = *(_DWORD *)(a1 + 8);
  v14->msgh_size = 36;
  v14->msgh_remote_port = v16;
  v14->msgh_local_port = 0;
  v14->msgh_id = v7 + 100;
  if (v11)
  {
    v17 = *(_QWORD *)(a4 + 8);
    if ((*(_BYTE *)(a4 + 4) & 2) != 0)
      *(_DWORD *)(a1 + 12) = v17;
    *(_QWORD *)(a1 + *(unsigned int *)(a1 + 4) + 52) = v17;
    v11(a1, v14);
    if ((v14->msgh_bits & 0x80000000) != 0)
    {
LABEL_33:
      if (v14->msgh_remote_port)
      {
        if ((v14->msgh_bits & 0x1F) == 0x12)
          v25 = 1;
        else
          v25 = 17;
        v26 = mach_msg(v14, v25, v14->msgh_size, 0, 0, 0, 0);
        if ((v26 - 268435459) >= 2)
        {
          if (v26)
          {
            v27 = (FILE *)*MEMORY[0x1E0C80C10];
            v28 = getpid();
            fprintf(v27, "%d: badly generated MIG reply for port %x\n", v28, *(_DWORD *)a4);
          }
        }
        else
        {
          mach_msg_destroy(v14);
        }
      }
      goto LABEL_42;
    }
LABEL_28:
    msgh_remote_port = v14[1].msgh_remote_port;
    if (msgh_remote_port)
    {
      if (msgh_remote_port == -305)
      {
        v14->msgh_remote_port = 0;
        goto LABEL_42;
      }
      if ((*(_DWORD *)a1 & 0x80000000) != 0)
      {
        *(_DWORD *)(a1 + 8) = 0;
        mach_msg_destroy((mach_msg_header_t *)a1);
      }
    }
    goto LABEL_33;
  }
  v18 = *(_DWORD *)(a1 + 20);
  if (v18 == 71)
  {
    v23 = *(void (**)(uint64_t, _QWORD))(a4 + 24);
    if (v23)
      v23(a1, *(_QWORD *)(a4 + 8));
  }
  else
  {
    if (v18 != 70)
    {
      *(_QWORD *)&v14[1].msgh_bits = *MEMORY[0x1E0C804E8];
      v14[1].msgh_remote_port = -303;
      goto LABEL_28;
    }
    v19 = *(uint64_t (**)(void))(a4 + 16);
    if (v19)
    {
      v31 = *(_DWORD *)(a1 + 32);
      if (*(unsigned __int8 *)(a1 + 28) != *(unsigned __int8 *)(MEMORY[0x1E0C804E8] + 4))
        v31 = bswap32(v31);
      v20 = v19();
      v31 = v20;
      if (v20)
      {
        previous = 0;
        v21 = *(_DWORD *)a4;
        v22 = *MEMORY[0x1E0C83DA0];
        mach_port_request_notification(*MEMORY[0x1E0C83DA0], v21, 70, v20, v21, 0x15u, &previous);
        if (previous)
          mach_port_mod_refs(v22, previous, 2u, -1);
      }
      else
      {
        *(_QWORD *)(a4 + 16) = 0;
      }
    }
  }
LABEL_42:
  if (v9 > 0x2000)
    free(v14);
  return 0;
}

uint64_t _XPostNotification(uint64_t result, uint64_t a2)
{
  int v3;
  uint64_t v4;
  unsigned int v6;
  unsigned int v7;
  uint64_t v8;
  unsigned int v9;
  _DWORD *v10;

  if ((*(_DWORD *)result & 0x80000000) == 0)
    goto LABEL_2;
  v3 = -304;
  if (*(_DWORD *)(result + 24) != 1)
    goto LABEL_3;
  v4 = *(unsigned int *)(result + 4);
  if (v4 < 0x5C || v4 > 0x105C)
    goto LABEL_3;
  if (*(_BYTE *)(result + 39) != 1)
    goto LABEL_18;
  v6 = *(_DWORD *)(result + 76);
  if (v6 > 0x1000)
  {
LABEL_2:
    v3 = -304;
    goto LABEL_3;
  }
  v3 = -304;
  if ((int)v4 - 92 < v6)
    goto LABEL_3;
  v7 = (v6 + 3) & 0xFFFFFFFC;
  if ((_DWORD)v4 != v7 + 92)
    goto LABEL_3;
  v8 = result + v7;
  v9 = *(_DWORD *)(result + 40);
  if (v9 != *(_DWORD *)(v8 + 80))
  {
LABEL_18:
    v3 = -300;
    goto LABEL_3;
  }
  v10 = (_DWORD *)(((v4 + 3) & 0x1FFFFFFFCLL) + result);
  if (!*v10 && v10[1] > 0x1Fu)
  {
    result = _AXXMIGPostNotification(*(_DWORD *)(result + 12), *(_DWORD *)(result + 52), *(_QWORD *)(result + 56), *(_QWORD *)(result + 64), *(unsigned int *)(result + 72), result + 80, v6, *(void **)(result + 28), v9, *(_QWORD *)(v8 + 84));
    *(_DWORD *)(a2 + 32) = result;
    return result;
  }
  v3 = -309;
LABEL_3:
  *(_DWORD *)(a2 + 32) = v3;
  *(_QWORD *)(a2 + 24) = *MEMORY[0x1E0C804E8];
  return result;
}

uint64_t _XBroadcastNotification(uint64_t result, uint64_t a2)
{
  int v3;
  uint64_t v4;
  unsigned int v6;
  unsigned int v7;
  uint64_t v8;
  unsigned int v9;
  _DWORD *v10;

  if ((*(_DWORD *)result & 0x80000000) == 0)
    goto LABEL_2;
  v3 = -304;
  if (*(_DWORD *)(result + 24) != 1)
    goto LABEL_3;
  v4 = *(unsigned int *)(result + 4);
  if (v4 < 0x54 || v4 > 0x1054)
    goto LABEL_3;
  if (*(_BYTE *)(result + 39) != 1)
    goto LABEL_18;
  v6 = *(_DWORD *)(result + 76);
  if (v6 > 0x1000)
  {
LABEL_2:
    v3 = -304;
    goto LABEL_3;
  }
  v3 = -304;
  if ((int)v4 - 84 < v6)
    goto LABEL_3;
  v7 = (v6 + 3) & 0xFFFFFFFC;
  if ((_DWORD)v4 != v7 + 84)
    goto LABEL_3;
  v8 = result + v7;
  v9 = *(_DWORD *)(result + 40);
  if (v9 != *(_DWORD *)(v8 + 80))
  {
LABEL_18:
    v3 = -300;
    goto LABEL_3;
  }
  v10 = (_DWORD *)(((v4 + 3) & 0x1FFFFFFFCLL) + result);
  if (!*v10 && v10[1] > 0x1Fu)
  {
    result = _AXXMIGBroadcastNotification(*(unsigned int *)(result + 12), *(unsigned int *)(result + 52), *(unsigned int *)(result + 56), *(_QWORD *)(result + 60), *(_QWORD *)(result + 68), result + 80, v6, *(void **)(result + 28), v9);
    *(_DWORD *)(a2 + 32) = result;
    return result;
  }
  v3 = -309;
LABEL_3:
  *(_DWORD *)(a2 + 32) = v3;
  *(_QWORD *)(a2 + 24) = *MEMORY[0x1E0C804E8];
  return result;
}

uint64_t _AXXMIGPostNotification(unsigned int a1, int a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, unsigned int a7, void *a8, unsigned int a9, uint64_t a10)
{
  const void *Internal;
  int v16;
  NSObject *v18;
  void (**Value)(const void *, const void *, uint64_t, CFTypeRef, uint64_t);
  uint64_t v20;
  uint8_t v22[8];
  CFTypeRef cf;

  cf = 0;
  Internal = (const void *)_AXUIElementCreateInternal(a2, a3, a4);
  v16 = AXUnserializeWrapper(a6, a7, (uint64_t)a8, a9, (uint64_t)&cf);
  if (v16 != -25212 && v16 != 0)
  {
    v20 = 5;
    if (!Internal)
      goto LABEL_17;
    goto LABEL_15;
  }
  if ((_DWORD)a5 == 1021)
  {
    AXRuntimeLogPID();
    v18 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)v22 = 0;
      _os_log_impl(&dword_1B54A6000, v18, OS_LOG_TYPE_INFO, "Did receive kAXPidStatusChangedNotification", v22, 2u);
    }

    _AXManagePidState((void *)cf);
  }
  if (Internal)
  {
    os_unfair_lock_lock(&gAXObserverLock);
    Value = (void (**)(const void *, const void *, uint64_t, CFTypeRef, uint64_t))CFDictionaryGetValue((CFDictionaryRef)gObserverCache, (const void *)a1);
    os_unfair_lock_unlock(&gAXObserverLock);
    if (Value)
      Value[5](Value, Internal, a5, cf, a10);
    v20 = 0;
LABEL_15:
    CFRelease(Internal);
    goto LABEL_17;
  }
  v20 = 0;
LABEL_17:
  if (cf)
    CFRelease(cf);
  if (a8 && a9)
    munmap(a8, a9);
  return v20;
}

uint64_t _AXXMIGBroadcastNotification(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, unsigned int a7, void *a8, unsigned int a9)
{
  int v14;
  BOOL v15;
  const void *Internal;
  void (*v17)(uint64_t, uint64_t, const void *, CFTypeRef, uint64_t);
  CFTypeRef v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  const void *v22;
  uint64_t v23;
  CFTypeRef cf;

  cf = 0;
  v14 = AXUnserializeWrapper(a6, a7, (uint64_t)a8, a9, (uint64_t)&cf);
  if (v14)
    v15 = v14 == -25212;
  else
    v15 = 1;
  if (!v15)
  {
    v23 = 5;
    goto LABEL_14;
  }
  Internal = (const void *)_AXUIElementCreateInternal(a2, a4, a5);
  v17 = (void (*)(uint64_t, uint64_t, const void *, CFTypeRef, uint64_t))gSystemWideServerBroadcastRelayerCallback;
  if (gSystemWideServerBroadcastRelayerCallback)
  {
    v18 = cf;
    v19 = gSystemWideServerBroadcastRelayerCallbackInfo;
    v20 = a3;
    v21 = a2;
    v22 = Internal;
LABEL_10:
    v17(v20, v21, v22, v18, v19);
    goto LABEL_11;
  }
  v17 = (void (*)(uint64_t, uint64_t, const void *, CFTypeRef, uint64_t))gNotificationBypassCallback;
  if (gNotificationBypassCallback)
  {
    v18 = cf;
    v20 = a3;
    v21 = a2;
    v22 = Internal;
    v19 = 0;
    goto LABEL_10;
  }
LABEL_11:
  if (Internal)
    CFRelease(Internal);
  v23 = 0;
LABEL_14:
  if (cf)
    CFRelease(cf);
  if (a8 && a9)
    munmap(a8, a9);
  return v23;
}

uint64_t __AXCreateAXUIElementWithElement(void *a1, int a2, int a3)
{
  id v5;
  void *v6;
  CFTypeID v7;
  uint64_t AppElementWithPid;
  uint64_t v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  pid_t v16;

  v5 = a1;
  v6 = v5;
  if (v5)
  {
    v7 = CFGetTypeID(v5);
    if (v7 == AXUIElementGetTypeID())
    {
      AppElementWithPid = (uint64_t)CFRetain(v6);
LABEL_17:
      v9 = AppElementWithPid;
      goto LABEL_18;
    }
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      if (ApplicationElementRetrieval
        && (ApplicationElementRetrieval(),
            v13 = (void *)objc_claimAutoreleasedReturnValue(),
            v13,
            v13 == v6))
      {
        v16 = getpid();
        AppElementWithPid = _AXUIElementCreateAppElementWithPid(v16);
      }
      else
      {
        v14 = _AXIsInElementCache((uint64_t)v6);
        v15 = v14;
        if (!a2 && !v14)
          v15 = _AXAddToElementCache(v6);
        AppElementWithPid = _AXUIElementCreateWithID((uint64_t)v6, v15);
      }
      goto LABEL_17;
    }
    v10 = v6;
    v11 = objc_msgSend(v10, "uuidHash");
    if (a3)
      v12 = getpid();
    else
      v12 = objc_msgSend(v10, "remotePid");
    v9 = _AXUIElementCreateWithPIDAndID(v12, v11, 9999);

  }
  else
  {
    v9 = 0;
  }
LABEL_18:

  return v9;
}

uint64_t _AXUIElementCreateInternal(int a1, uint64_t a2, uint64_t a3)
{
  uint64_t result;
  int v7;

  if ((__AXUIElementInitialized & 1) == 0)
    __AXUIElementInitialize();
  result = _CFRuntimeCreateInstance();
  if (result)
  {
    if (sSystemWideServerPID == a1)
      v7 = 0;
    else
      v7 = a1;
    *(_DWORD *)(result + 16) = v7;
    *(_QWORD *)(result + 20) = a2;
    *(_QWORD *)(result + 28) = a3;
    *(_DWORD *)(result + 36) = 0;
  }
  return result;
}

CFTypeID AXUIElementGetTypeID(void)
{
  if ((__AXUIElementInitialized & 1) == 0)
    __AXUIElementInitialize();
  return __kAXUIElementTypeID;
}

uint64_t _AXUIElementCreateAppElementWithPid(int a1)
{
  return _AXUIElementCreateInternal(a1, 0, kAXApplicationUID);
}

uint64_t AXUnserializeWrapper(uint64_t a1, unsigned int a2, uint64_t a3, unsigned int a4, uint64_t a5)
{
  unsigned int v6;
  unint64_t v8;

  if (a2)
  {
    v6 = a2;
    if (AXInitSerializationStyle_onceToken == -1)
      goto LABEL_7;
    goto LABEL_11;
  }
  if (a4)
  {
    if (AXInitSerializationStyle_onceToken == -1)
    {
      v6 = a4;
      a1 = a3;
LABEL_7:
      v8 = atomic_load(&AXCurrentSerializationStyle);
      return ((uint64_t (*)(_QWORD, _QWORD, uint64_t, _QWORD, uint64_t))AXSerializationImplementations[2 * v8 + 1])(0, 0, a1, v6, a5);
    }
    a1 = a3;
    v6 = a4;
LABEL_11:
    dispatch_once(&AXInitSerializationStyle_onceToken, &__block_literal_global_79);
    goto LABEL_7;
  }
  return 4294942084;
}

uint64_t AXUnserializeCFType3(uint64_t a1, uint64_t a2, unsigned int *a3, unint64_t a4, uint64_t a5)
{
  unint64_t v8;
  void *v9;
  void *v10;
  id v11;
  id v12;
  void *v14;
  id v15;
  void *v16;
  int v17;
  uint64_t v18;
  NSObject *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  id v27;
  id v28;

  if (InitSmuggledTypes_onceToken != -1)
    dispatch_once(&InitSmuggledTypes_onceToken, &__block_literal_global_45);
  if (a4 >= 4)
  {
    v8 = bswap32(*a3);
    if (v8 <= a4)
    {
      if (!a5)
      {
        v12 = 0;
        goto LABEL_11;
      }
      *(_QWORD *)a5 = 0;
      v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D50]), "initWithBytesNoCopy:length:freeWhenDone:", a3 + 1, v8 - 4, 0);
      v28 = 0;
      objc_msgSend(MEMORY[0x1E0CB38B0], "propertyListWithData:options:format:error:", v9, 0, 0, &v28);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = v28;
      if (v11)
      {
        v12 = v11;

LABEL_9:
        a5 = 4294942095;
LABEL_11:

        return a5;
      }
      v27 = 0;
      objc_msgSend(v10, "_axRecursivelyReconstitutedRepresentationFromPropertyListWithError:", &v27);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = v27;
      if (v14)
        v15 = v14;
      *(_QWORD *)a5 = v14;

      if (!v12)
      {
        a5 = 0;
        goto LABEL_11;
      }
      objc_msgSend(v12, "domain");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = objc_msgSend(v16, "isEqual:", CFSTR("AXSerialize3ErrorDomain"));

      if (v17)
      {
        v18 = objc_msgSend(v12, "code");
        if ((unint64_t)(v18 - 1) < 5)
          goto LABEL_9;
        if (v18)
        {
          AXRuntimeLogSerialization();
          v19 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
            AXSerializeCFType3_cold_1(v19, v20, v21, v22, v23, v24, v25, v26);

          abort();
        }
      }
      a5 = 4294942096;
      goto LABEL_11;
    }
  }
  return 4294942095;
}

void _AXManagePidState(void *a1)
{
  CFTypeID TypeID;
  __CFString *v3;
  __CFString *v4;
  __CFString *v5;
  void *v6;
  NSObject *v7;
  void *v8;
  int v9;
  void *v10;
  void *v11;
  void *v12;
  int v13;
  void *v14;
  int v15;
  void *v16;
  void *v17;
  NSObject *v18;
  uint64_t v19;
  void *v20;
  void *v21;
  void *v22;
  NSObject *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t i;
  uint64_t v32;
  NSObject *v33;
  void *v34;
  void *v35;
  void *v36;
  dispatch_time_t v37;
  NSObject *v38;
  const __CFString *v39;
  void *v40;
  int v41;
  int v42;
  __CFString *v43;
  __CFString *v44;
  unsigned int v45;
  _QWORD block[4];
  __CFString *v47;
  unsigned int v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  uint8_t v53[4];
  int v54;
  uint8_t buf[4];
  const __CFString *v56;
  __int16 v57;
  __CFString *v58;
  __int16 v59;
  unsigned int v60;
  uint64_t v61;

  v61 = *MEMORY[0x1E0C80C00];
  if (a1)
  {
    TypeID = CFDictionaryGetTypeID();
    if (TypeID == CFGetTypeID(a1))
    {
      v3 = a1;
      -[__CFString objectForKey:](v3, "objectForKey:", CFSTR("pid"));
      v4 = (__CFString *)objc_claimAutoreleasedReturnValue();
      v5 = v4;
      if (!v4 || !-[__CFString intValue](v4, "intValue"))
      {
LABEL_43:

        return;
      }
      -[__CFString valueForKey:](v3, "valueForKey:", CFSTR("display-type"));
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v45 = objc_msgSend(v6, "intValue");

      AXRuntimeLogPID();
      v7 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412546;
        v56 = v3;
        v57 = 1024;
        LODWORD(v58) = v45;
        _os_log_impl(&dword_1B54A6000, v7, OS_LOG_TYPE_INFO, "pid status change recorded: %@ for display type: %d", buf, 0x12u);
      }

      -[__CFString objectForKey:](v3, "objectForKey:", CFSTR("suspended-status"));
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      if ((objc_msgSend(v8, "isEqualToString:", CFSTR("suspended")) & 1) != 0)
      {
        v9 = 1;
      }
      else
      {
        -[__CFString objectForKey:](v3, "objectForKey:", CFSTR("suspended"));
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          -[__CFString objectForKey:](v3, "objectForKey:", CFSTR("suspended"));
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          v9 = objc_msgSend(v11, "BOOLValue");

        }
        else
        {
          v9 = 0;
        }

      }
      -[__CFString objectForKey:](v3, "objectForKey:", CFSTR("tentative-suspended"));
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = objc_msgSend(v12, "isEqualToString:", CFSTR("suspended"));

      -[__CFString objectForKey:](v3, "objectForKey:", CFSTR("pipPid"));
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = objc_msgSend(v14, "BOOLValue");

      if (v15)
        _PipPid = -[__CFString intValue](v5, "intValue");
      os_unfair_lock_lock(&gAXSuspendedPidsLock);
      +[AXPidSuspensionInfo shared](AXPidSuspensionInfo, "shared");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "tentativeSuspendedPidsForDisplay:", v45);
      v17 = (void *)objc_claimAutoreleasedReturnValue();

      if (v9)
      {
        if (objc_msgSend(v17, "containsObject:", v5))
        {
          objc_msgSend(v17, "removeObject:", v5);
          AXRuntimeLogPID();
          v18 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = 138412290;
            v56 = v5;
            _os_log_impl(&dword_1B54A6000, v18, OS_LOG_TYPE_INFO, "Got confimration that tentative pid should be suspended: %@", buf, 0xCu);
          }

        }
      }
      else if (!v13)
      {
        _AXRemoveSuspendedPid(-[__CFString intValue](v5, "intValue"), v45);
        os_unfair_lock_unlock(&gAXSuspendedPidsLock);
LABEL_36:
        AXRuntimeLogPID();
        v38 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v38, OS_LOG_TYPE_INFO))
        {
          v39 = CFSTR("resume");
          if (v9)
            v39 = CFSTR("suspend");
          *(_DWORD *)buf = 138412802;
          if (v13)
            v39 = CFSTR("tentative-suspend");
          v56 = v39;
          v57 = 2112;
          v58 = v5;
          v59 = 1024;
          v60 = v45;
          _os_log_impl(&dword_1B54A6000, v38, OS_LOG_TYPE_INFO, "Did %@ pid: %@ on Display %d", buf, 0x1Cu);
        }

        goto LABEL_43;
      }
      v41 = v13;
      v42 = v9;
      v43 = v5;
      v44 = v3;
      v19 = -[__CFString intValue](v5, "intValue", v17);
      +[AXPidSuspensionInfo shared](AXPidSuspensionInfo, "shared");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "suspendedPidsForDisplay:", v45);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v19);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "addObject:", v22);

      AXRuntimeLogPID();
      v23 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v23, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 67109120;
        LODWORD(v56) = v19;
        _os_log_impl(&dword_1B54A6000, v23, OS_LOG_TYPE_INFO, "Adding suspended pid: %d", buf, 8u);
      }

      v51 = 0u;
      v52 = 0u;
      v49 = 0u;
      v50 = 0u;
      +[AXPidSuspensionInfo shared](AXPidSuspensionInfo, "shared");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "associatedRemotePidsForDisplay:", v45);
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v19);
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v25, "objectForKey:", v26);
      v27 = (void *)objc_claimAutoreleasedReturnValue();

      v28 = objc_msgSend(v27, "countByEnumeratingWithState:objects:count:", &v49, buf, 16);
      if (v28)
      {
        v29 = v28;
        v30 = *(_QWORD *)v50;
        do
        {
          for (i = 0; i != v29; ++i)
          {
            if (*(_QWORD *)v50 != v30)
              objc_enumerationMutation(v27);
            v32 = *(_QWORD *)(*((_QWORD *)&v49 + 1) + 8 * i);
            AXRuntimeLogPID();
            v33 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v33, OS_LOG_TYPE_INFO))
            {
              *(_DWORD *)v53 = 67109120;
              v54 = v19;
              _os_log_impl(&dword_1B54A6000, v33, OS_LOG_TYPE_INFO, "Adding Associated suspended pid: %d", v53, 8u);
            }

            +[AXPidSuspensionInfo shared](AXPidSuspensionInfo, "shared");
            v34 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v34, "suspendedPidsForDisplay:", v45);
            v35 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v35, "addObject:", v32);

          }
          v29 = objc_msgSend(v27, "countByEnumeratingWithState:objects:count:", &v49, buf, 16);
        }
        while (v29);
      }

      os_unfair_lock_unlock(&gAXSuspendedPidsLock);
      v13 = v41;
      if (v41)
      {
        os_unfair_lock_lock(&gAXSuspendedPidsLock);
        +[AXPidSuspensionInfo shared](AXPidSuspensionInfo, "shared");
        v36 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v36, "tentativeSuspendedPidsForDisplay:", v45);
        v17 = (void *)objc_claimAutoreleasedReturnValue();

        v5 = v43;
        objc_msgSend(v17, "addObject:", v43);
        os_unfair_lock_unlock(&gAXSuspendedPidsLock);
        v37 = dispatch_time(0, 2000000000);
        block[0] = MEMORY[0x1E0C809B0];
        block[1] = 3221225472;
        block[2] = ___AXManagePidState_block_invoke;
        block[3] = &unk_1E6919718;
        v47 = v43;
        v48 = v45;
        dispatch_after(v37, MEMORY[0x1E0C80D38], block);

        v3 = v44;
        v9 = v42;
      }
      else
      {
        v5 = v43;
        v3 = v44;
        v9 = v42;
        v17 = v40;
      }
      goto LABEL_36;
    }
  }
}

uint64_t _AXPidIsSuspendedInternal(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  int v13;
  os_unfair_lock_s *v14;
  id v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t i;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  int v24;
  id v26;
  id obj;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  _BYTE v36[128];
  _BYTE v37[128];
  uint64_t v38;

  v38 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  if (_PipPid == (_DWORD)a1)
  {
    v4 = 0;
  }
  else
  {
    os_unfair_lock_lock(&gAXSuspendedPidsLock);
    v34 = 0u;
    v35 = 0u;
    v32 = 0u;
    v33 = 0u;
    obj = v3;
    v5 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v32, v37, 16);
    if (v5)
    {
      v6 = v5;
      v7 = *(_QWORD *)v33;
LABEL_5:
      v8 = 0;
      while (1)
      {
        if (*(_QWORD *)v33 != v7)
          objc_enumerationMutation(obj);
        v9 = *(void **)(*((_QWORD *)&v32 + 1) + 8 * v8);
        +[AXPidSuspensionInfo shared](AXPidSuspensionInfo, "shared");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "suspendedPidsForDisplay:", objc_msgSend(v9, "intValue"));
        v11 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", a1);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v13 = objc_msgSend(v11, "containsObject:", v12);

        if (!v13)
          break;
        if (v6 == ++v8)
        {
          v6 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v32, v37, 16);
          if (v6)
            goto LABEL_5;
          v4 = 1;
          v14 = &gAXSuspendedPidsLock;
          goto LABEL_24;
        }
      }
    }

    os_unfair_lock_unlock(&gAXSuspendedPidsLock);
    v14 = &gAXTimeoutProbationPidsLock;
    os_unfair_lock_lock(&gAXTimeoutProbationPidsLock);
    v30 = 0u;
    v31 = 0u;
    v28 = 0u;
    v29 = 0u;
    v15 = obj;
    v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v28, v36, 16);
    if (v16)
    {
      v17 = v16;
      v26 = v3;
      v18 = *(_QWORD *)v29;
      while (2)
      {
        for (i = 0; i != v17; ++i)
        {
          if (*(_QWORD *)v29 != v18)
            objc_enumerationMutation(v15);
          v20 = *(void **)(*((_QWORD *)&v28 + 1) + 8 * i);
          +[AXPidSuspensionInfo shared](AXPidSuspensionInfo, "shared", v26);
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v21, "timeoutProbationPidsForDisplay:", objc_msgSend(v20, "intValue"));
          v22 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", a1);
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          v24 = objc_msgSend(v22, "containsObject:", v23);

          if (!v24)
          {
            v4 = 0;
            goto LABEL_22;
          }
        }
        v17 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v28, v36, 16);
        if (v17)
          continue;
        break;
      }
      v4 = 1;
LABEL_22:
      v3 = v26;
      v14 = &gAXTimeoutProbationPidsLock;
    }
    else
    {
      v4 = 0;
    }
LABEL_24:

    os_unfair_lock_unlock(v14);
  }

  return v4;
}

void AXPidSuspend(uint64_t a1, uint64_t a2)
{
  NSObject *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  _QWORD v9[3];
  _QWORD v10[3];
  uint8_t buf[4];
  void *v12;
  __int16 v13;
  const __CFString *v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  AXRuntimeLogPID();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", a1);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412546;
    v12 = v5;
    v13 = 2112;
    v14 = CFSTR("<redacted>");
    _os_log_impl(&dword_1B54A6000, v4, OS_LOG_TYPE_INFO, "Client requesting suspension of PID:%@ Name:%@", buf, 0x16u);

  }
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", a1, CFSTR("pid"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = v6;
  v10[1] = CFSTR("suspended");
  v9[1] = CFSTR("suspended-status");
  v9[2] = CFSTR("display-type");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", a2);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v10[2] = v7;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v10, v9, 3);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  AXPushNotificationToSystemForBroadcast();
}

void AXPidUnsuspend(uint64_t a1, uint64_t a2)
{
  NSObject *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  _QWORD v9[3];
  _QWORD v10[3];
  uint8_t buf[4];
  void *v12;
  __int16 v13;
  const __CFString *v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  AXRuntimeLogPID();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", a1);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412546;
    v12 = v5;
    v13 = 2112;
    v14 = CFSTR("<redacted>");
    _os_log_impl(&dword_1B54A6000, v4, OS_LOG_TYPE_INFO, "Client requesting unsuspension of PID:%@ Name:%@", buf, 0x16u);

  }
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", a1, CFSTR("pid"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = v6;
  v10[1] = CFSTR("resumed");
  v9[1] = CFSTR("suspended-status");
  v9[2] = CFSTR("display-type");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", a2);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v10[2] = v7;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v10, v9, 3);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  AXPushNotificationToSystemForBroadcast();
}

uint64_t AXPushNotificationToSystemForBroadcast()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  int v6;
  pid_t v7;
  uint64_t result;
  int v9;
  void (*v10)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t);
  uint64_t v11;
  void (*v12)(uint64_t, uint64_t, uint64_t, CFTypeRef, _QWORD);
  uint64_t v13;
  CFDataRef v14;
  NSObject *v15;
  CFTypeRef v16;
  CFTypeRef v17;
  int v18;
  _QWORD v19[8];
  unsigned int v20;
  int v21;
  int v22;
  unsigned int v23;
  int v24;
  BOOL v25;
  CFTypeRef cf[2];
  unsigned int v27[4];
  unsigned int length;
  _OWORD length_4[256];
  uint64_t v30;

  v0 = MEMORY[0x1E0C80A78]();
  v2 = v1;
  v4 = v3;
  v5 = v0;
  v30 = *MEMORY[0x1E0C80C00];
  if (_AXSApplicationAccessibilityEnabled()
    || _AXSAutomationEnabled()
    || (_DWORD)v5 == 1021 && (gAXAccessibilityTurnedOnOnce & 1) != 0)
  {
    memset(length_4, 0, 512);
    length = 0;
    *(_QWORD *)&v27[1] = 0;
    v27[0] = 0;
    v6 = sSystemWideServerPID;
    v7 = getpid();
    if (!v2
      || v6 == v7
      || (result = AXSerializeWrapper(v2, 1, length_4, &length, (void **)&v27[1], v27), !(_DWORD)result))
    {
      v9 = sSystemWideServerPID;
      if (v9 == getpid())
      {
        v10 = (void (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))gSystemWideServerBroadcastRelayerCallback;
        if (gSystemWideServerBroadcastRelayerCallback)
        {
          v11 = getpid();
          v10(v5, v11, v4, v2, gSystemWideServerBroadcastRelayerCallbackInfo);
        }
      }
      else if (gNotificationBypassCallback)
      {
        cf[0] = 0;
        AXUnserializeWrapper((uint64_t)length_4, length, *(uint64_t *)&v27[1], v27[0], (uint64_t)cf);
        v12 = (void (*)(uint64_t, uint64_t, uint64_t, CFTypeRef, _QWORD))gNotificationBypassCallback;
        v13 = getpid();
        v12(v5, v13, v4, cf[0], 0);
        if (cf[0])
        {
          CFRelease(cf[0]);
          cf[0] = 0;
        }
        if (v27[0])
          munmap(*(void **)&v27[1], v27[0]);
      }
      else
      {
        if (AXPushNotificationToSystemForBroadcast_registerOnce != -1)
          dispatch_once(&AXPushNotificationToSystemForBroadcast_registerOnce, &__block_literal_global_1);
        if (length)
          v14 = CFDataCreate((CFAllocatorRef)*MEMORY[0x1E0C9AE00], (const UInt8 *)length_4, length);
        else
          v14 = 0;
        cf[0] = 0;
        cf[1] = 0;
        v25 = 0;
        v24 = 0;
        _AXUIElementValidate(v4, &v25, cf, &v24);
        v17 = cf[0];
        v16 = cf[1];
        v18 = _AXGetPortFromCache(sSystemWideServerPID, "com.apple.iphone.axserver-systemwide");
        if (!v18)
          return 4294942081;
        v19[0] = MEMORY[0x1E0C809B0];
        v19[1] = 3221225472;
        v19[2] = __AXPushNotificationToSystemForBroadcast_block_invoke_2;
        v19[3] = &__block_descriptor_80_e5_v8__0l;
        v20 = length;
        v21 = v18;
        v19[4] = v14;
        v19[5] = v17;
        v19[6] = v16;
        v19[7] = *(_QWORD *)&v27[1];
        v22 = v5;
        v23 = v27[0];
        dispatch_async((dispatch_queue_t)AXPushNotificationToSystemForBroadcast_broadcast_queue, v19);
      }
      return 0;
    }
  }
  else
  {
    AXRuntimeLogNotifications();
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
    {
      LODWORD(length_4[0]) = 67109120;
      DWORD1(length_4[0]) = v5;
      _os_log_impl(&dword_1B54A6000, v15, OS_LOG_TYPE_INFO, "Not posting notification: (%d) because app ax and automation are off", (uint8_t *)length_4, 8u);
    }

    return 4294942092;
  }
  return result;
}

uint64_t AXSerializeCFType3(void *a1, uint64_t a2, uint64_t a3, void **a4, size_t *a5, size_t *a6)
{
  void *v10;
  id v11;
  void *v12;
  void *v13;
  id v14;
  uint64_t v15;
  void *v16;
  int v17;
  uint64_t v18;
  size_t v19;
  size_t v20;
  _DWORD *v21;
  _DWORD *v22;
  void *v23;
  id v24;
  NSObject *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  id v34;
  id v35;

  if (InitSmuggledTypes_onceToken != -1)
    dispatch_once(&InitSmuggledTypes_onceToken, &__block_literal_global_45);
  v35 = 0;
  objc_msgSend(a1, "_axRecursivelyPropertyListCoercedRepresentationWithError:", &v35);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = v35;
  v12 = v11;
  if (v10)
  {
    v34 = 0;
    objc_msgSend(MEMORY[0x1E0CB38B0], "dataWithPropertyList:format:options:error:", v10, 200, 0, &v34);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = v34;

    if (v13)
    {
      if ((unint64_t)objc_msgSend(v13, "length") <= 0xFFFFFFFA)
      {
        v19 = objc_msgSend(v13, "length") + 4;
        if (*a6 >= v19)
        {
          v22 = *a4;
        }
        else
        {
          v20 = *MEMORY[0x1E0C85AD8] + v19 / *MEMORY[0x1E0C85AD8] * *MEMORY[0x1E0C85AD8];
          v21 = mmap(0, v20, 3, 4098, -1, 0);
          if (v21 == (_DWORD *)-1)
          {
            v15 = 4294942096;
            goto LABEL_16;
          }
          v22 = v21;
          munmap(*a4, *a6);
          *a4 = v22;
          *a6 = v20;
        }
        *v22 = bswap32(v19);
        v23 = (char *)*a4 + 4;
        v24 = objc_retainAutorelease(v13);
        memcpy(v23, (const void *)objc_msgSend(v24, "bytes"), objc_msgSend(v24, "length"));
        v15 = 0;
        *a5 = v19;
      }
      else
      {
        v15 = 4294942082;
      }
    }
    else
    {
      v15 = 4294942095;
    }
LABEL_16:

    v12 = v14;
    goto LABEL_20;
  }
  objc_msgSend(v11, "domain");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = objc_msgSend(v16, "isEqual:", CFSTR("AXSerialize3ErrorDomain"));

  if (!v17)
  {
LABEL_19:
    v15 = 4294942096;
    goto LABEL_20;
  }
  v18 = objc_msgSend(v12, "code");
  if ((unint64_t)(v18 - 1) >= 5)
  {
    if (v18)
    {
      AXRuntimeLogSerialization();
      v26 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
        AXSerializeCFType3_cold_1(v26, v27, v28, v29, v30, v31, v32, v33);

      abort();
    }
    goto LABEL_19;
  }
  v15 = 4294942095;
LABEL_20:

  return v15;
}

uint64_t _AXUIElementValidate(uint64_t a1, BOOL *a2, _OWORD *a3, int *a4)
{
  int v8;
  uint64_t result;

  if (!a1 || CFGetTypeID((CFTypeRef)a1) != __kAXUIElementTypeID)
    return 0xFFFFFFFFLL;
  *a2 = *(_DWORD *)(a1 + 16) == 0;
  *a3 = *(_OWORD *)(a1 + 20);
  v8 = *(_DWORD *)(a1 + 36);
  if (!v8)
    v8 = sGlobalTimeout;
  *a4 = v8;
  result = *(unsigned int *)(a1 + 16);
  if ((_DWORD)result == 2147483637)
    return _AXKeyboardAppPid();
  return result;
}

uint64_t AXSerializeWrapper(uint64_t a1, uint64_t a2, void *a3, _DWORD *a4, void **a5, _DWORD *a6)
{
  pthread_key_t v12;
  const void *Internal;
  void *v14;
  void *v15;
  void *v16;
  unint64_t v17;
  uint64_t v18;
  int v19;
  NSObject *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  size_t __n;
  size_t v30;
  void *__src;

  v12 = gSerializeBufferKey;
  if (!gSerializeBufferKey)
  {
    Internal = (const void *)_AXUIElementCreateInternal(0, 0, 0);
    CFRelease(Internal);
    v12 = gSerializeBufferKey;
    if (!gSerializeBufferKey)
    {
      AXRuntimeLogCommon();
      v20 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
        AXSerializeWrapper_cold_1(v20, v21, v22, v23, v24, v25, v26, v27);

      return 4294942092;
    }
  }
  v14 = pthread_getspecific(v12);
  if (!v14)
  {
    v15 = mmap(0, 0x1000uLL, 3, 4098, -1, 0);
    if (v15 == (void *)-1)
      v16 = 0;
    else
      v16 = v15;
    pthread_setspecific(gSerializeBufferKey, v16);
    __src = v16;
    if (v16)
      goto LABEL_9;
    return 4294942092;
  }
  __src = v14;
LABEL_9:
  __n = 0;
  v30 = 4096;
  if (AXInitSerializationStyle_onceToken != -1)
    dispatch_once(&AXInitSerializationStyle_onceToken, &__block_literal_global_79);
  v17 = atomic_load(&AXCurrentSerializationStyle);
  v18 = ((uint64_t (*)(uint64_t, _QWORD, uint64_t, void **, size_t *, size_t *))AXSerializationImplementations[2 * v17])(a1, 0, a2, &__src, &__n, &v30);
  if (!(_DWORD)v18)
  {
    v19 = __n;
    if (__n <= 0x1000)
    {
      memcpy(a3, __src, __n);
      *a4 = v19;
      return v18;
    }
    *a5 = __src;
    *a6 = v30;
    goto LABEL_16;
  }
  if (v30 != 4096)
  {
    munmap(__src, v30);
LABEL_16:
    pthread_setspecific(gSerializeBufferKey, 0);
  }
  return v18;
}

void _AXBroadcastEventProcessNotification(int a1, uint64_t a2, const void *a3, const void *a4)
{
  int v6;
  NSObject *v8;
  NSObject *v9;
  _QWORD block[6];
  int v11;
  uint8_t buf[4];
  _DWORD v13[7];

  v6 = a2;
  *(_QWORD *)&v13[5] = *MEMORY[0x1E0C80C00];
  if (_AXPidIsSuspended(a2) && a1 != 1021 && a1 != 4002)
  {
    AXRuntimeLogNotifications();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 67109376;
      v13[0] = v6;
      LOWORD(v13[1]) = 2048;
      *(_QWORD *)((char *)&v13[1] + 2) = a1;
      _os_log_impl(&dword_1B54A6000, v8, OS_LOG_TYPE_INFO, "Pid is suspended and notification is not acceptable: pid: %d, %ld", buf, 0x12u);
    }

    AXRuntimeLogNotifications();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 134217984;
      *(_QWORD *)v13 = a1;
      _os_log_impl(&dword_1B54A6000, v9, OS_LOG_TYPE_INFO, "Don't broadcast notification: %ld", buf, 0xCu);
    }

    return;
  }
  if (_AXBroadcastEventProcessNotification_registerOnce != -1)
  {
    dispatch_once(&_AXBroadcastEventProcessNotification_registerOnce, &__block_literal_global_63);
    if (!a4)
      goto LABEL_10;
    goto LABEL_9;
  }
  if (a4)
LABEL_9:
    CFRetain(a4);
LABEL_10:
  if (a3)
    CFRetain(a3);
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = ___AXBroadcastEventProcessNotification_block_invoke_2;
  block[3] = &__block_descriptor_52_e5_v8__0l;
  v11 = a1;
  block[4] = a3;
  block[5] = a4;
  dispatch_async((dispatch_queue_t)_AXBroadcastEventProcessNotification_replayQueue, block);
}

uint64_t _AXGetPortFromCache(uint64_t a1, const char *a2)
{
  uint64_t v4;
  NSObject *v5;
  void *v6;
  kern_return_t v8;
  kern_return_t v9;
  NSObject *v10;
  mach_port_t v11;
  CFMachPortRef v12;
  const char *v13;
  void *v14;
  uint64_t v15;
  uint64_t *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  mach_port_t *v20;
  uint64_t v21;
  int v22;
  _BYTE context[44];
  uint8_t buf[72];
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  if ((a1 & 0x80000000) != 0)
    return 0;
  v19 = 0;
  v20 = (mach_port_t *)&v19;
  v21 = 0x2020000000;
  v22 = 0;
  v15 = 0;
  v16 = &v15;
  v17 = 0x2020000000;
  v18 = 0;
  if (gAllowsSuspendedAppServer || !_AXPidIsSuspended(a1))
  {
    AX_PERFORM_WITH_LOCK();
    if (!v16[3])
    {
      memset(buf, 0, 60);
      if (a2)
      {
        strncpy((char *)buf, a2, 0x3BuLL);
        v8 = bootstrap_look_up(*MEMORY[0x1E0C81720], (const char *)buf, v20 + 6);
      }
      else
      {
        v8 = bootstrap_look_up2();
      }
      v9 = v8;
      if (v8)
      {
        AXRuntimeLogCommon();
        v10 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
        {
          v13 = bootstrap_strerror(v9);
          objc_msgSend(MEMORY[0x1E0CB3978], "callStackSymbols");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)context = 67110146;
          *(_DWORD *)&context[4] = v9;
          *(_WORD *)&context[8] = 2080;
          *(_QWORD *)&context[10] = v13;
          *(_WORD *)&context[18] = 2112;
          *(_QWORD *)&context[20] = CFSTR("com.apple.iphone.axserver");
          *(_WORD *)&context[28] = 1024;
          *(_DWORD *)&context[30] = a1;
          *(_WORD *)&context[34] = 2112;
          *(_QWORD *)&context[36] = v14;
          _os_log_error_impl(&dword_1B54A6000, v10, OS_LOG_TYPE_ERROR, "AX Lookup problem - errorCode:%d error:%s portName:'%@' PID:%d %@", context, 0x2Cu);

        }
      }
      v11 = v20[6];
      if (v11)
      {
        *(_QWORD *)context = 0;
        memset(&context[16], 0, 24);
        *(_QWORD *)&context[8] = a1;
        v12 = CFMachPortCreateWithPort(0, v11, 0, (CFMachPortContext *)context, 0);
        v16[3] = (uint64_t)v12;
        if (v12)
        {
          AX_PERFORM_WITH_LOCK();
          CFRelease((CFTypeRef)v16[3]);
        }
      }
    }
    v4 = v20[6];
  }
  else
  {
    AXLogCommon();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", a1);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412546;
      *(_QWORD *)&buf[4] = v6;
      *(_WORD *)&buf[12] = 2080;
      *(_QWORD *)&buf[14] = a2;
      _os_log_impl(&dword_1B54A6000, v5, OS_LOG_TYPE_INFO, "Asking for port/pid but its suspended: %@, %s", buf, 0x16u);

    }
    v4 = 0;
  }
  _Block_object_dispose(&v15, 8);
  _Block_object_dispose(&v19, 8);
  return v4;
}

void sub_1B54AB260(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,char a23,uint64_t a24,uint64_t a25,uint64_t a26,char a27)
{
  _Block_object_dispose(&a23, 8);
  _Block_object_dispose(&a27, 8);
  _Unwind_Resume(a1);
}

uint64_t _AXPidIsSuspended(uint64_t a1)
{
  void *v2;
  void *v3;
  char v4;
  void *v5;
  uint64_t IsSuspendedInternal;

  objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "bundleIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "hasPrefix:", *MEMORY[0x1E0CF3908]);

  if ((v4 & 1) != 0)
  {
    v5 = &unk_1E6926AE8;
  }
  else
  {
    _allDisplayTypes();
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  IsSuspendedInternal = _AXPidIsSuspendedInternal(a1, v5);

  return IsSuspendedInternal;
}

id _allDisplayTypes()
{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t i;
  __int128 v6;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  _BYTE v10[128];
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v6 = 0u;
  v7 = 0u;
  v8 = 0u;
  v9 = 0u;
  if (_displayMonitor_onceToken != -1)
    dispatch_once(&_displayMonitor_onceToken, &__block_literal_global_52);
  objc_msgSend((id)_displayMonitor_DisplayMonitor, "connectedIdentities", (_QWORD)v6);
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  v1 = objc_msgSend(v0, "countByEnumeratingWithState:objects:count:", &v6, v10, 16);
  if (v1)
  {
    v2 = v1;
    v3 = *(_QWORD *)v7;
    while (2)
    {
      for (i = 0; i != v2; ++i)
      {
        if (*(_QWORD *)v7 != v3)
          objc_enumerationMutation(v0);
        if ((objc_msgSend(*(id *)(*((_QWORD *)&v6 + 1) + 8 * i), "isCarDisplay") & 1) != 0)
        {

          objc_msgSend(&unk_1E6926B00, "arrayByAddingObjectsFromArray:", &unk_1E6926B18);
          return (id)objc_claimAutoreleasedReturnValue();
        }
      }
      v2 = objc_msgSend(v0, "countByEnumeratingWithState:objects:count:", &v6, v10, 16);
      if (v2)
        continue;
      break;
    }
  }

  return &unk_1E6926B00;
}

void _AXRemoveSuspendedPid(uint64_t a1, uint64_t a2)
{
  NSObject *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t i;
  uint64_t v16;
  NSObject *v17;
  void *v18;
  void *v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  uint8_t buf[4];
  uint64_t v25;
  _BYTE v26[128];
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  AXRuntimeLogPID();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 67109120;
    LODWORD(v25) = a1;
    _os_log_impl(&dword_1B54A6000, v4, OS_LOG_TYPE_INFO, "Removing suspended PID: %d", buf, 8u);
  }

  +[AXPidSuspensionInfo shared](AXPidSuspensionInfo, "shared");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "suspendedPidsForDisplay:", a2);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", a1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "removeObject:", v7);

  v22 = 0u;
  v23 = 0u;
  v20 = 0u;
  v21 = 0u;
  +[AXPidSuspensionInfo shared](AXPidSuspensionInfo, "shared");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "associatedRemotePidsForDisplay:", a2);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", a1);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "objectForKey:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v20, v26, 16);
  if (v12)
  {
    v13 = v12;
    v14 = *(_QWORD *)v21;
    do
    {
      for (i = 0; i != v13; ++i)
      {
        if (*(_QWORD *)v21 != v14)
          objc_enumerationMutation(v11);
        v16 = *(_QWORD *)(*((_QWORD *)&v20 + 1) + 8 * i);
        AXRuntimeLogPID();
        v17 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 138412290;
          v25 = v16;
          _os_log_impl(&dword_1B54A6000, v17, OS_LOG_TYPE_INFO, "Removing associated remote PID: %@", buf, 0xCu);
        }

        +[AXPidSuspensionInfo shared](AXPidSuspensionInfo, "shared");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v18, "suspendedPidsForDisplay:", a2);
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v19, "removeObject:", v16);

      }
      v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v20, v26, 16);
    }
    while (v13);
  }

}

uint64_t _AXCreateAXUIElementWithElement(void *a1)
{
  return __AXCreateAXUIElementWithElement(a1, 0, 0);
}

uint64_t mshHash(unsigned int *a1)
{
  return *a1;
}

uint64_t _AXReleasePortFromCache(uint64_t result)
{
  if ((_DWORD)result)
    return AX_PERFORM_WITH_LOCK();
  return result;
}

uint64_t _AXMIGBroadcastNotification(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, int a9)
{
  mach_port_t v9;
  unsigned int v10;
  uint64_t v11;
  unsigned int v12;
  unsigned int v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  unsigned int v17;
  mach_port_t v18;
  uint64_t v19;
  mach_msg_size_t v20;
  mach_msg_header_t msg;
  int v23;
  uint64_t v24;
  int v25;
  int v26;
  uint64_t v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  _BYTE v55[28];
  uint64_t v56;

  v9 = MEMORY[0x1E0C80A78]();
  v56 = *MEMORY[0x1E0C80C00];
  v54 = 0u;
  memset(v55, 0, sizeof(v55));
  v52 = 0u;
  v53 = 0u;
  v50 = 0u;
  v51 = 0u;
  v48 = 0u;
  v49 = 0u;
  v46 = 0u;
  v47 = 0u;
  v44 = 0u;
  v45 = 0u;
  v42 = 0u;
  v43 = 0u;
  v41 = 0u;
  v40 = 0u;
  v39 = 0u;
  v38 = 0u;
  v37 = 0u;
  v36 = 0u;
  v35 = 0u;
  v34 = 0u;
  v33 = 0u;
  v32 = 0u;
  v31 = 0u;
  v30 = 0u;
  v29 = 0u;
  v28 = 0u;
  v27 = 0;
  memset(&msg.msgh_size, 0, 20);
  v23 = 1;
  v24 = v11;
  v25 = 16777472;
  v26 = a9;
  v27 = *MEMORY[0x1E0C804E8];
  *(_QWORD *)&v28 = __PAIR64__(v13, v12);
  *((_QWORD *)&v28 + 1) = v14;
  *(_QWORD *)&v29 = v15;
  if (v10 > 0x1000)
    return 4294966989;
  v17 = v10;
  v18 = v9;
  __memcpy_chk();
  v19 = (v17 + 3) & 0xFFFFFFFC;
  v20 = v19 + 84;
  *(_DWORD *)((char *)&msg + v19 + 80) = a9;
  msg.msgh_bits = -2147483629;
  msg.msgh_remote_port = v18;
  DWORD2(v29) = v17;
  msg.msgh_id = 860011;
  *(_QWORD *)&msg.msgh_local_port = 0;
  if (MEMORY[0x1E0C85B60])
    voucher_mach_msg_set(&msg);
  v16 = mach_msg(&msg, 1, v20, 0, 0, 0, 0);
  if ((v16 - 268435459) <= 1)
  {
    if ((msg.msgh_bits & 0x1F00) == 0x1100)
      mach_port_deallocate(*MEMORY[0x1E0C83DA0], msg.msgh_local_port);
    mach_msg_destroy(&msg);
  }
  return v16;
}

uint64_t _AXMIGPostNotification(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, int a9, uint64_t a10)
{
  mach_port_t v10;
  unsigned int v11;
  uint64_t v12;
  int v13;
  uint64_t v14;
  uint64_t v15;
  int v16;
  uint64_t v17;
  unsigned int v18;
  mach_port_t v19;
  uint64_t v20;
  char *v21;
  mach_msg_size_t v22;
  mach_msg_header_t msg;
  int v25;
  uint64_t v26;
  int v27;
  int v28;
  uint64_t v29;
  _BYTE v30[32];
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  _BYTE v56[28];
  uint64_t v57;

  v10 = MEMORY[0x1E0C80A78]();
  v57 = *MEMORY[0x1E0C80C00];
  v55 = 0u;
  memset(v56, 0, sizeof(v56));
  v53 = 0u;
  v54 = 0u;
  v51 = 0u;
  v52 = 0u;
  v49 = 0u;
  v50 = 0u;
  v47 = 0u;
  v48 = 0u;
  v45 = 0u;
  v46 = 0u;
  v43 = 0u;
  v44 = 0u;
  v42 = 0u;
  v41 = 0u;
  v40 = 0u;
  v39 = 0u;
  v38 = 0u;
  v37 = 0u;
  v36 = 0u;
  v35 = 0u;
  v34 = 0u;
  v32 = 0u;
  v33 = 0u;
  *(_OWORD *)&v30[16] = 0u;
  v31 = 0u;
  v29 = 0;
  *(_OWORD *)v30 = 0u;
  memset(&msg.msgh_size, 0, 20);
  v25 = 1;
  v26 = v12;
  v27 = 16777472;
  v28 = a9;
  v29 = *MEMORY[0x1E0C804E8];
  *(_DWORD *)v30 = v13;
  *(_QWORD *)&v30[4] = v14;
  *(_QWORD *)&v30[12] = v15;
  *(_DWORD *)&v30[20] = v16;
  if (v11 > 0x1000)
    return 4294966989;
  v18 = v11;
  v19 = v10;
  __memcpy_chk();
  v20 = (v18 + 3) & 0xFFFFFFFC;
  v21 = (char *)&msg + v20;
  v22 = v20 + 92;
  *((_DWORD *)v21 + 20) = a9;
  *(_QWORD *)(v21 + 84) = a10;
  msg.msgh_bits = -2147483629;
  msg.msgh_remote_port = v19;
  *(_DWORD *)&v30[24] = v18;
  msg.msgh_id = 860012;
  *(_QWORD *)&msg.msgh_local_port = 0;
  if (MEMORY[0x1E0C85B60])
    voucher_mach_msg_set(&msg);
  v17 = mach_msg(&msg, 1, v22, 0, 0, 0, 0);
  if ((v17 - 268435459) <= 1)
  {
    if ((msg.msgh_bits & 0x1F00) == 0x1100)
      mach_port_deallocate(*MEMORY[0x1E0C83DA0], msg.msgh_local_port);
    mach_msg_destroy(&msg);
  }
  return v17;
}

uint64_t _copyAttributeValueCallback(uint64_t a1, uint64_t a2, uint64_t a3, _QWORD *a4, void *a5)
{
  uint64_t v10;
  uint64_t v11;
  id v12;
  void (**v13)(_QWORD, _QWORD, _QWORD, _QWORD);
  void *v14;
  void *v15;
  void (**v16)(_QWORD, _QWORD, _QWORD);
  uint64_t v17;
  void *v18;
  CFTypeRef v19;

  v10 = MEMORY[0x1B5E4B2B8](0);
  if (!a4)
    return 4294942095;
  v11 = v10;
  v12 = a5;
  objc_msgSend(v12, "attributeCallback");
  v13 = (void (**)(_QWORD, _QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
  v13[2](v13, a1, a2, a3);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v12, "outgoingValuePreprocessor");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  if (v15)
  {
    objc_msgSend(v12, "outgoingValuePreprocessor");
    v16 = (void (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
    ((void (**)(_QWORD, uint64_t, void *))v16)[2](v16, a3, v14);
    v17 = objc_claimAutoreleasedReturnValue();

    v14 = (void *)v17;
  }

  AXConvertOutgoingValue(a3, v14);
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  if (v18)
    v19 = CFRetain(v18);
  else
    v19 = 0;
  *a4 = v19;
  MEMORY[0x1B5E4B2AC](v11);

  return 0;
}

uint64_t _setAttributeValueCallback(uint64_t a1, uint64_t a2, uint64_t a3, void *a4, void *a5)
{
  uint64_t v10;
  id v11;
  void *v12;
  void (**v13)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD);

  v10 = MEMORY[0x1B5E4B2B8](0);
  v11 = a5;
  AXConvertIncomingValue(a4);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setAttributeCallback");
  v13 = (void (**)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();

  ((void (**)(_QWORD, uint64_t, uint64_t, uint64_t, void *))v13)[2](v13, a1, a2, a3, v12);
  MEMORY[0x1B5E4B2AC](v10);

  return 0;
}

uint64_t _serverPerformActionCallback(uint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  uint64_t v8;
  uint64_t (**v9)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD);
  uint64_t v10;

  v8 = MEMORY[0x1B5E4B2B8](0);
  objc_msgSend(a4, "performActionCallback");
  v9 = (uint64_t (**)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
  LODWORD(a3) = v9[2](v9, a1, a2, a3, 0, 0);

  if ((_DWORD)a3)
    v10 = 0;
  else
    v10 = 4294942096;
  MEMORY[0x1B5E4B2AC](v8);
  return v10;
}

uint64_t _performActionWithValueCallback(uint64_t a1, uint64_t a2, uint64_t a3, void *a4, void *a5, uint64_t a6)
{
  uint64_t v12;
  uint64_t (**v13)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD);
  void *v14;
  uint64_t v15;

  v12 = MEMORY[0x1B5E4B2B8](0);
  objc_msgSend(a5, "performActionCallback");
  v13 = (uint64_t (**)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
  AXConvertIncomingValue(a4);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(a6) = ((uint64_t (**)(_QWORD, uint64_t, uint64_t, uint64_t, void *, uint64_t))v13)[2](v13, a1, a2, a3, v14, a6);

  if ((_DWORD)a6)
    v15 = 0;
  else
    v15 = 4294942096;
  MEMORY[0x1B5E4B2AC](v12);
  return v15;
}

uint64_t _copyElementAtPositionCallback(uint64_t a1, uint64_t a2, float a3, float a4, uint64_t a5, uint64_t a6, uint64_t *a7, void *a8)
{
  uint64_t v15;
  id v16;
  void *v17;
  void (**v18)(_QWORD, _QWORD, _QWORD, _QWORD, double, double);
  void *v19;
  uint64_t v20;
  uint64_t v21;
  NSObject *v22;
  int v24;
  void *v25;
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v15 = MEMORY[0x1B5E4B2B8](0);
  v16 = a8;
  objc_msgSend(v16, "hitTestCallback");
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  if (v17)
  {
    objc_msgSend(v16, "hitTestCallback");
    v18 = (void (**)(_QWORD, _QWORD, _QWORD, _QWORD, double, double))objc_claimAutoreleasedReturnValue();
    v18[2](v18, a1, a2, a6, a3, a4);
    v19 = (void *)objc_claimAutoreleasedReturnValue();

    v20 = __AXCreateAXUIElementWithElement(v19, 0, 0);
    if (v20)
    {
      v21 = 0;
      *a7 = v20;
    }
    else
    {
      AXLogUIA();
      v22 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
      {
        v24 = 138412290;
        v25 = v19;
        _os_log_impl(&dword_1B54A6000, v22, OS_LOG_TYPE_INFO, "Returning invalid element for copy element: %@", (uint8_t *)&v24, 0xCu);
      }

      v21 = 4294942094;
    }
    MEMORY[0x1B5E4B2AC](v15);

  }
  else
  {
    v21 = 0;
  }

  return v21;
}

uint64_t _copyParameterizedAttributeValueCallback(uint64_t a1, uint64_t a2, uint64_t a3, void *a4, _QWORD *a5, void *a6)
{
  void *v12;
  id v13;
  void *v14;
  void *v15;
  void (**v16)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD);
  void *v17;
  void *v18;
  void (**v19)(_QWORD, _QWORD, _QWORD);
  uint64_t v20;
  uint64_t v21;
  id v22;

  v12 = (void *)MEMORY[0x1B5E4B708]();
  if (a5)
  {
    v13 = a6;
    AXConvertIncomingValue(a4);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    if (v14
      || (objc_msgSend(v13, "parameterizedAttributeCallback"),
          v15 = (void *)objc_claimAutoreleasedReturnValue(),
          v15,
          v15))
    {
      objc_msgSend(v13, "parameterizedAttributeCallback");
      v16 = (void (**)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
      ((void (**)(_QWORD, uint64_t, uint64_t, uint64_t, void *))v16)[2](v16, a1, a2, a3, v14);
      v17 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v13, "outgoingValuePreprocessor");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      if (v18)
      {
        objc_msgSend(v13, "outgoingValuePreprocessor");
        v19 = (void (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
        ((void (**)(_QWORD, uint64_t, void *))v19)[2](v19, a3, v17);
        v20 = objc_claimAutoreleasedReturnValue();

        v17 = (void *)v20;
      }

      AXConvertOutgoingValue(a3, v17);
      v21 = objc_claimAutoreleasedReturnValue();

      if (v21)
      {
        v22 = (id)v21;

        v21 = 0;
      }
      else
      {
        v22 = 0;
      }
    }
    else
    {
      v22 = 0;
      v21 = 4294942095;
    }
    *a5 = v22;

  }
  else
  {
    v21 = 4294942095;
  }
  objc_autoreleasePoolPop(v12);
  return v21;
}

uint64_t _copyMultipleAttributeValuesCallback(uint64_t a1, uint64_t a2, const __CFArray *a3, uint64_t a4, __CFArray **a5, void *a6)
{
  void *v9;
  CFIndex Count;
  CFIndex v11;
  id v12;
  CFIndex i;
  void *v14;
  uint64_t v15;
  void (**v16)(_QWORD, _QWORD, _QWORD, _QWORD);
  void *v17;
  void *v18;
  void (**v19)(_QWORD, _QWORD, _QWORD);
  uint64_t v20;
  void *v21;
  AXValueRef v22;
  uint64_t v23;
  __CFArray **v25;
  void *context;
  __CFArray *theArray;
  int valuePtr;

  v9 = (void *)MEMORY[0x1B5E4B708]();
  if (a3 && (Count = CFArrayGetCount(a3)) != 0)
  {
    v11 = Count;
    v25 = a5;
    context = v9;
    v12 = a6;
    theArray = CFArrayCreateMutable((CFAllocatorRef)*MEMORY[0x1E0C9AE00], v11, MEMORY[0x1E0C9B378]);
    if (v11 >= 1)
    {
      for (i = 0; i != v11; ++i)
      {
        v14 = (void *)MEMORY[0x1B5E4B708]();
        v15 = objc_msgSend((id)CFArrayGetValueAtIndex(a3, i), "unsignedIntValue");
        objc_msgSend(v12, "attributeCallback");
        v16 = (void (**)(_QWORD, _QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
        v16[2](v16, a1, a2, v15);
        v17 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v12, "outgoingValuePreprocessor");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        if (v18)
        {
          objc_msgSend(v12, "outgoingValuePreprocessor");
          v19 = (void (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
          ((void (**)(_QWORD, uint64_t, void *))v19)[2](v19, v15, v17);
          v20 = objc_claimAutoreleasedReturnValue();

          v17 = (void *)v20;
        }

        AXConvertOutgoingValue(v15, v17);
        v21 = (void *)objc_claimAutoreleasedReturnValue();

        if (v21)
        {
          CFArraySetValueAtIndex(theArray, i, v21);
        }
        else
        {
          valuePtr = -25205;
          v22 = AXValueCreate(kAXValueTypeAXError, &valuePtr);
          CFArraySetValueAtIndex(theArray, i, v22);
          CFRelease(v22);
        }

        objc_autoreleasePoolPop(v14);
      }
    }
    *v25 = theArray;

    v23 = 0;
    v9 = context;
  }
  else
  {
    v23 = 4294942095;
  }
  objc_autoreleasePoolPop(v9);
  return v23;
}

void _axNotificationObserverDiedHandler(uint64_t a1)
{
  void (**v2)(_QWORD, _QWORD);
  id v3;

  +[AXSimpleRuntimeManager sharedManager](AXSimpleRuntimeManager, "sharedManager");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "clientObserverCallback");
  v2 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
  v2[2](v2, a1);

}

void *_AXSetApplicationElementHandler(void *result)
{
  ApplicationElementRetrieval = result;
  return result;
}

id AXSimpleRuntimeApplicationElementRetrieval()
{
  void *v0;
  void (**v1)(void);
  void *v2;

  +[AXSimpleRuntimeManager sharedManager](AXSimpleRuntimeManager, "sharedManager");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "applicationElementCallback");
  v1 = (void (**)(void))objc_claimAutoreleasedReturnValue();
  v1[2]();
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  return v2;
}

id _UIAXElementForAXUIElementRef(uint64_t a1)
{
  void *v1;
  uint64_t v2;

  v1 = (void *)_AXUIElementIDForElement(a1);
  return _AXElementForAXUIElementUniqueId(v1, v2);
}

id _AXElementForAXUIElementUniqueId(void *a1, uint64_t a2)
{
  void *v2;
  _QWORD v5[5];

  if (a2 == kAXApplicationUID)
  {
    if (ApplicationElementRetrieval)
    {
      ApplicationElementRetrieval();
      v2 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v2 = 0;
    }
  }
  else if (a2 == 9999)
  {
    v5[0] = MEMORY[0x1E0C809B0];
    v5[1] = 3221225472;
    v5[2] = ___AXElementForAXUIElementUniqueId_block_invoke;
    v5[3] = &__block_descriptor_40_e25_B16__0__AXRemoteElement_8l;
    v5[4] = a1;
    +[AXRemoteElement remoteElementForBlock:](AXRemoteElement, "remoteElementForBlock:", v5);
    v2 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    if (a2 == kAXLookingGlassUID)
      return a1;
    v2 = (void *)_AXIsInElementCache((uint64_t)a1);
    if (v2)
      return a1;
  }
  return v2;
}

void *__AXRuntimeApplicationElement()
{
  return ApplicationElementRetrieval;
}

uint64_t _AXRetrieveExistingAXUIElementWithElement(void *a1)
{
  return __AXCreateAXUIElementWithElement(a1, 1, 0);
}

uint64_t _AXCreateAXUIElementWithElementUsingLocalRemoteElement(void *a1)
{
  return __AXCreateAXUIElementWithElement(a1, 0, 1);
}

uint64_t _AXRequestingClientForSelfMachMessage()
{
  if (_OverrideClientType)
    return _OverrideClientType;
  else
    return 7;
}

uint64_t AXOverrideRequestingClientType(uint64_t a1)
{
  uint64_t result;

  result = _AXDetermineRequestingClient();
  _OverrideClientType = a1;
  return result;
}

uint64_t _AXDetermineRequestingClient()
{
  uint64_t result;
  NSObject *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  if (_AXDetermineRequestingClient_onceToken != -1)
    dispatch_once(&_AXDetermineRequestingClient_onceToken, &__block_literal_global_56);
  result = _OverrideClientType;
  if (!_OverrideClientType)
  {
    result = _DefaultClientType;
    if (_DefaultClientType == 9999)
    {
      if (_AXSHoverTextEnabled())
      {
        return 15;
      }
      else if (_AXSWatchControlEnabled())
      {
        return 14;
      }
      else
      {
        AXRuntimeLogCommon();
        v1 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v1, OS_LOG_TYPE_ERROR))
          _AXDetermineRequestingClient_cold_1(v1, v2, v3, v4, v5, v6, v7, v8);

        return 0;
      }
    }
  }
  return result;
}

Boolean AXAPIEnabled(void)
{
  return 1;
}

BOOL AXAttributeAllowsRequeryWhenRemoteElementFails(uint64_t a1)
{
  _BOOL8 result;

  result = 1;
  if ((unint64_t)(a1 - 3000) > 0x32 || ((1 << (a1 + 72)) & 0x4000009800205) == 0)
    return a1 == 2231 || a1 == 2600;
  return result;
}

BOOL _AXCallingFromSameApp(int a1, int a2)
{
  pid_t v4;
  _BOOL8 result;
  pid_t v6;

  v4 = getpid();
  if (v4 == a1)
    return 1;
  v6 = v4;
  result = 0;
  if (!a1)
  {
    if (a2)
      return v6 == sSystemWideServerPID;
  }
  return result;
}

void _AXUIElementSetMachPortForNextMessage(mach_port_name_t name)
{
  ipc_space_t *v2;
  kern_return_t v3;
  NSObject *v4;
  uint8_t v5[16];

  if (name)
  {
    v2 = (ipc_space_t *)MEMORY[0x1E0C83DA0];
    v3 = mach_port_mod_refs(*MEMORY[0x1E0C83DA0], name, 0, 1);
    if (v3 == 17)
      v3 = mach_port_mod_refs(*v2, name, 4u, 1);
    if (v3)
    {
      AXRuntimeLogCommon();
      v4 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)v5 = 0;
        _os_log_impl(&dword_1B54A6000, v4, OS_LOG_TYPE_INFO, "Could not set next mach port because it was already dead", v5, 2u);
      }

    }
    else
    {
      AXUIElementMachPortForNextMessage = name;
    }
  }
}

uint64_t AXUIElementCopyAttributeValueRecursive()
{
  const __CFString *v0;
  CFTypeRef *v1;
  __CFSet *v2;
  const __AXUIElement *v3;
  uint64_t result;
  CFTypeRef *v5;
  __CFSet *v6;
  const __CFString *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  int v11;
  pid_t v12;
  uint64_t v13;
  int v14;
  uint64_t v15;
  const char *v16;
  uint64_t v17;
  uint64_t v18;
  AXError v19;
  void *v20;
  void *v21;
  const void *v22;
  int v23;
  pid_t v24;
  void *v25;
  NSObject *v26;
  void *v27;
  char v28;
  __int128 v29[2];
  uint64_t v30;
  uint64_t v31;
  unsigned int v32;
  unsigned int v33;
  void *v34;
  unsigned int v35;
  unsigned __int8 v36;
  AXError v37;
  const __CFString *v38;
  CFTypeRef v39;
  _BYTE buf[12];
  _OWORD v41[256];
  uint64_t v42;

  v3 = (const __AXUIElement *)MEMORY[0x1E0C80A78]();
  v42 = *MEMORY[0x1E0C80C00];
  v35 = 0;
  v34 = 0;
  v33 = 0;
  result = 4294942095;
  if (!v0)
    return result;
  if (!v3)
    return result;
  v5 = v1;
  if (!v1)
    return result;
  v6 = v2;
  v7 = v0;
  v37 = kAXErrorSuccess;
  v36 = 0;
  memset(v41, 0, 512);
  v32 = 0;
  v30 = 0;
  v31 = 0;
  *v1 = 0;
  v8 = _AXUIElementValidate(v3, &v36, &v30, &v32);
  v9 = v30;
  v10 = v31;
  v11 = v36;
  v12 = getpid();
  if (v12 == (_DWORD)v8 || !(_DWORD)v8 && v11 && v12 == sSystemWideServerPID)
  {
    if (_OverrideClientType)
      v13 = _OverrideClientType;
    else
      v13 = 7;
    if (getSelfAuditToken_onceToken != -1)
      dispatch_once(&getSelfAuditToken_onceToken, &__block_literal_global_73);
    v29[0] = getSelfAuditToken_auditToken;
    v29[1] = unk_1ECEBE960;
    v14 = _AXXMIGCopyAttributeValue(0, v8, v9, v10, (int)v7, v13, v41, &v35, &v34, &v33, (int *)&v37, v29);
    if (v14)
      goto LABEL_14;
    goto LABEL_27;
  }
  v15 = AXUIElementMachPortForNextMessage;
  if (AXUIElementMachPortForNextMessage)
  {
    AXUIElementMachPortForNextMessage = 0;
    goto LABEL_26;
  }
  if (v36)
  {
    if (_SystemWideServerPortName_onceToken != -1)
      dispatch_once(&_SystemWideServerPortName_onceToken, &__block_literal_global_74);
    v16 = (const char *)_SystemWideServerPortName___portName;
  }
  else
  {
    v16 = 0;
  }
  v15 = _AXGetPortFromCache(v8, v16);
  if ((_DWORD)v15)
  {
LABEL_26:
    v17 = v32;
    v18 = _AXDetermineRequestingClient();
    v14 = _AXMIGCopyAttributeValue(v15, v17, v8, v9, v10, (uint64_t)v7, v18, (uint64_t)v41, &v35, &v34, &v33, &v37);
    _AXReleasePortFromCache(v15);
    _AXUIElementSetLastGlobalError(v37);
    if (v14)
    {
LABEL_14:
      if (v14 != 268451843 && v14 != 268435460)
        return 4294942092;
      _AXIPCToPidTimedOut(v8);
      return 4294942080;
    }
LABEL_27:
    v19 = v37;
    if (v37 == kAXErrorSuccess)
    {
      v19 = AXUnserializeWrapper((uint64_t)v41, v35, (uint64_t)v34, v33, (uint64_t)v5);
      v37 = v19;
    }
    if (v33 && v34)
    {
      munmap(v34, v33);
      v19 = v37;
    }
    v20 = (void *)*v5;
    if (*v5 && v19 == kAXErrorSuccess)
    {
      if (!shouldHandleRemoteElementCallthroughForAttribute((uint64_t)v7))
        goto LABEL_40;
      v28 = 0;
      v21 = _AXHandleRemoteElementCallthrough(v20, v3, (unint64_t)v7, 0, 0, &v28, v6);
      if (v21)
      {
        v22 = v21;
        CFRelease(*v5);
        *v5 = v22;
      }
      else if (v28 && AXAttributeAllowsRequeryWhenRemoteElementFails((uint64_t)v7))
      {
        v38 = CFSTR("IgnoreRemoteElement");
        v39 = *v5;
        *(_QWORD *)buf = 0;
        v37 = AXUIElementCopyParameterizedAttributeValue(v3, v7, (CFTypeRef)objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v39, &v38, 1), (CFTypeRef *)buf);
        if (v37 || !*(_QWORD *)buf)
        {
          if (*(_QWORD *)buf)
          {
            CFRelease(*(CFTypeRef *)buf);
            *(_QWORD *)buf = 0;
          }
          if (*v5)
          {
            CFRelease(*v5);
            *v5 = 0;
          }
          v37 = kAXErrorFailure;
        }
        else
        {
          CFRelease(*v5);
          *v5 = *(CFTypeRef *)buf;
        }
      }
      v19 = v37;
    }
    if (v19 && v19 != kAXErrorNoValue)
      return v37;
LABEL_40:
    v23 = v36;
    v24 = getpid();
    if (v24 != (_DWORD)v8
      && ((_DWORD)v8 || !v23 || v24 != sSystemWideServerPID)
      && +[AXClientSideValueTransformer canTransformAttribute:](AXClientSideValueTransformer, "canTransformAttribute:", v7))
    {
      +[AXClientSideValueTransformer transformValue:forAttribute:withElement:](AXClientSideValueTransformer, "transformValue:forAttribute:withElement:", *v5, v7, v3);
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      if (v25)
      {
        if (*v5)
        {
          CFRelease(*v5);
          *v5 = 0;
        }
        *v5 = v25;
        v37 = kAXErrorSuccess;
      }

    }
    return v37;
  }
  AXRuntimeLogPID();
  v26 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v26, OS_LOG_TYPE_INFO))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v8);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412290;
    *(_QWORD *)&buf[4] = v27;
    _os_log_impl(&dword_1B54A6000, v26, OS_LOG_TYPE_INFO, "Unable to CopyAttribute, no port for %@", buf, 0xCu);

  }
  return 4294942081;
}

void _AXIPCToPidTimedOut(uint64_t a1)
{
  if ((int)a1 >= 1 && getpid() != (_DWORD)a1 && !_AXSAutomationEnabled())
  {
    _AXPutPidOnTimeoutProbation(a1, 1);
    _AXPutPidOnTimeoutProbation(a1, 0);
  }
}

uint64_t shouldHandleRemoteElementCallthroughForAttribute(uint64_t a1)
{
  uint64_t result;
  unint64_t v3;

  result = 0;
  if (a1 <= 5000)
  {
    if (a1 == 2011 || a1 == 2310 || a1 == 3051)
      return result;
    return 1;
  }
  v3 = a1 - 5001;
  if (v3 > 0x18 || ((1 << v3) & 0x1000003) == 0)
    return 1;
  return result;
}

void *_AXHandleRemoteElementCallthrough(void *cf, const __AXUIElement *a2, unint64_t a3, void *a4, char a5, _BYTE *a6, __CFSet *a7)
{
  CFTypeID v14;
  int v15;
  void *v16;
  int v17;
  int v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  const void *v22;
  void *v23;
  uint64_t v24;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  const void *v29;
  void *v30;
  void *v31;
  AXUIMLElement *v32;
  NSObject *v33;
  AXUIMLElement *v34;
  uint64_t v35;
  _QWORD v36[2];
  pid_t pid;
  char v38;

  if (cf)
  {
    v14 = CFGetTypeID(cf);
    if (v14 == AXUIElementGetTypeID())
    {
      if (_AXIsRemoteElement((const __AXUIElement *)cf, a2))
      {
        if (!a7)
          goto LABEL_7;
        if (!CFSetContainsValue(a7, cf))
        {
          CFSetAddValue(a7, cf);
LABEL_7:
          *a6 = 1;
          v38 = 0;
          pid = 0;
          v36[0] = 0;
          v36[1] = 0;
          v15 = _AXUIElementValidate(cf, &v38, v36, &pid);
          if (v15 < 0)
          {
            v26 = -v15;
            v27 = _AXUIElementIDForElement((uint64_t)cf);
            v29 = (const void *)_AXUIElementCreateWithPIDAndID(v26, v27, v28);
            +[AXUIMLElement cachedElementForParent:](AXUIMLElement, "cachedElementForParent:", v29);
            v30 = (void *)objc_claimAutoreleasedReturnValue();
            v31 = v30;
            if (v30)
              v32 = v30;
            else
              v32 = -[AXUIMLElement initWithParentElement:]([AXUIMLElement alloc], "initWithParentElement:", v29);
            v34 = v32;
            if (v29)
              CFRelease(v29);
            if ((a5 & 1) != 0)
              v35 = -[AXUIMLElement copyAttributeValue:parameter:](v34, "copyAttributeValue:parameter:", a3, a4);
            else
              v35 = -[AXUIMLElement copyAttributeValue:](v34, "copyAttributeValue:", a3);
            v24 = v35;

          }
          else
          {
            _UIAXElementForAXUIElementRef((uint64_t)cf);
            v16 = (void *)objc_claimAutoreleasedReturnValue();
            v17 = objc_msgSend(v16, "remotePid");
            if (v17 == getpid() && (objc_msgSend(MEMORY[0x1E0CB3978], "isMainThread") & 1) == 0)
            {
              AXRuntimeLogCommon();
              v33 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v33, OS_LOG_TYPE_DEBUG))
                _AXHandleRemoteElementCallthrough_cold_1(v33);

              v24 = 0;
            }
            else
            {
              _AXUIElementSetMachPortForNextMessage(objc_msgSend(v16, "machPort"));
              if ((a5 & 1) != 0)
              {
                v36[0] = 0;
                v18 = AXUIElementCopyParameterizedAttributeValueRecursive();
                if (v18 != -25212 && v18 && (a3 - 95252 < 3 || a3 - 92501 <= 1))
                {
                  pid = 0;
                  AXUIElementGetPid(a2, &pid);
                  v19 = pid;
                  v20 = _AXUIElementIDForElement((uint64_t)cf);
                  v22 = (const void *)_AXUIElementCreateWithPIDAndID(v19, v20, v21);
                  AXUIElementCopyParameterizedAttributeValueRecursive();
                  CFRelease(v22);
                }
              }
              else
              {
                v36[0] = 0;
                AXUIElementCopyAttributeValueRecursive(cf, a3, v36, a7);
              }
              v24 = v36[0];
            }

          }
          return (void *)v24;
        }
      }
      return 0;
    }
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
    return 0;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(a4, "objectForKey:", CFSTR("elementCount"));
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = (uint64_t)_AXHandleRemoteElementCallthroughForArray(cf, a2, a3, v23);

    return (void *)v24;
  }
  return _AXHandleRemoteElementCallthroughForArray(cf, a2, a3, a4);
}

AXError AXUIElementCopyParameterizedAttributeValue(AXUIElementRef element, CFStringRef parameterizedAttribute, CFTypeRef parameter, CFTypeRef *result)
{
  CFMutableSetRef Mutable;
  AXError v5;

  Mutable = CFSetCreateMutable((CFAllocatorRef)*MEMORY[0x1E0C9AE00], 0, MEMORY[0x1E0C9B3B0]);
  v5 = AXUIElementCopyParameterizedAttributeValueRecursive();
  CFRelease(Mutable);
  return v5;
}

AXError AXUIElementCopyAttributeValue(AXUIElementRef element, CFStringRef attribute, CFTypeRef *value)
{
  CFMutableSetRef Mutable;
  AXError v4;

  Mutable = CFSetCreateMutable((CFAllocatorRef)*MEMORY[0x1E0C9AE00], 0, MEMORY[0x1E0C9B3B0]);
  v4 = AXUIElementCopyAttributeValueRecursive();
  CFRelease(Mutable);
  return v4;
}

uint64_t AXUIElementCopyParameterizedAttributeValueRecursive()
{
  uint64_t v0;
  uint64_t v1;
  CFTypeRef *v2;
  const void *v3;
  uint64_t result;
  CFTypeRef *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  int v11;
  pid_t v12;
  unsigned int v13;
  void *v14;
  unsigned int v15;
  uint64_t v16;
  int v17;
  unsigned int v18;
  CFTypeRef v19;
  __CFArray *Mutable;
  const char *v21;
  unsigned int v22;
  uint64_t v23;
  const void *v24;
  int v25;
  pid_t v26;
  uint64_t v27;
  const void *v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  NSObject *v33;
  void *v34;
  void *v35;
  int v36;
  void *v37;
  int v38;
  int v39;
  __int128 v40[2];
  uint64_t v41;
  uint64_t v42;
  int v43;
  unsigned int v44;
  void *v45;
  size_t v46;
  void *v47;
  unsigned int v48;
  unsigned __int8 v49;
  unsigned int v50;
  uint8_t buf[4];
  void *v52;
  _OWORD v53[256];
  _OWORD v54[256];
  uint64_t v55;

  v3 = (const void *)MEMORY[0x1E0C80A78]();
  v55 = *MEMORY[0x1E0C80C00];
  v48 = 0;
  v46 = 0;
  v47 = 0;
  v45 = 0;
  v44 = 0;
  result = 4294942095;
  if (v1)
  {
    if (v3)
    {
      v5 = v2;
      if (v2)
      {
        v6 = v1;
        v7 = v0;
        *v2 = 0;
        if (v0 == 91503 && _AXSMossdeepEnabled())
        {
          AXUIElementSharedSystemApp();
          AXUIElementPerformFencedActionWithValue();
        }
        v50 = 0;
        v49 = 0;
        memset(v54, 0, 512);
        memset(v53, 0, 512);
        v43 = 0;
        v41 = 0;
        v42 = 0;
        v8 = _AXUIElementValidate(v3, &v49, &v41, &v43);
        if ((v8 & 0x80000000) != 0)
        {
          v19 = *v5;
          if (!*v5)
          {
            if ((unint64_t)(v7 - 92501) < 2 || v7 == 95252)
            {
              Mutable = CFArrayCreateMutable((CFAllocatorRef)*MEMORY[0x1E0C9AE00], 0, MEMORY[0x1E0C9B378]);
              *v5 = Mutable;
              CFArrayAppendValue(Mutable, v3);
              v19 = *v5;
            }
            else
            {
              v19 = 0;
            }
          }
          v29 = _AXHandleRemoteElementCallthrough(v19);
          if (v29)
          {
            CFRelease(*v5);
            *v5 = (CFTypeRef)v29;
          }
          if (getpid() != (_DWORD)v8
            && +[AXClientSideValueTransformer canTransformAttribute:](AXClientSideValueTransformer, "canTransformAttribute:", v7))
          {
            +[AXClientSideValueTransformer transformValue:forAttribute:withElement:](AXClientSideValueTransformer, "transformValue:forAttribute:withElement:", *v5, v7, v3);
            v29 = objc_claimAutoreleasedReturnValue();
          }
          if (v29)
          {
            CFRelease(*v5);
            *v5 = (CFTypeRef)v29;
          }
          return v50;
        }
        result = AXSerializeWrapper(v6, 1, v53, &v46, &v45, &v44);
        v50 = result;
        if ((_DWORD)result)
          return result;
        v9 = v41;
        v10 = v42;
        v11 = v49;
        v12 = getpid();
        if (v12 == (_DWORD)v8 || !(_DWORD)v8 && v11 && v12 == sSystemWideServerPID)
        {
          v13 = v46;
          v14 = v45;
          v15 = v44;
          if (_OverrideClientType)
            v16 = _OverrideClientType;
          else
            v16 = 7;
          if (getSelfAuditToken_onceToken != -1)
          {
            v39 = v46;
            v37 = v45;
            dispatch_once(&getSelfAuditToken_onceToken, &__block_literal_global_73);
            v14 = v37;
            v13 = v39;
          }
          v40[0] = getSelfAuditToken_auditToken;
          v40[1] = unk_1ECEBE960;
          v17 = _AXXMIGCopyParameterizedAttributeValue(0, v8, v9, v10, v7, (uint64_t)v53, v13, v14, v15, v16, v54, &v48, &v47, (_DWORD *)&v46 + 1, (int *)&v50, v40);
          if (v17)
          {
LABEL_19:
            if (v17 == 268451843 || v17 == 268435460)
            {
              _AXIPCToPidTimedOut(v8);
              v18 = -25216;
            }
            else
            {
              v18 = -25204;
            }
            v50 = v18;
LABEL_32:
            if (v15)
              munmap(v45, v15);
            if (HIDWORD(v46) && v47)
              munmap(v47, HIDWORD(v46));
            v22 = v50;
            if (!v50)
            {
              if (!*v5)
                goto LABEL_43;
              v23 = _AXHandleRemoteElementCallthrough(*v5);
              if (v23)
              {
                v24 = (const void *)v23;
                CFRelease(*v5);
                *v5 = v24;
              }
              v22 = v50;
              if (!v50)
                goto LABEL_43;
            }
            if (v22 == -25212)
            {
LABEL_43:
              v25 = v49;
              v26 = getpid();
              if (v26 != (_DWORD)v8 && ((_DWORD)v8 || !v25 || v26 != sSystemWideServerPID))
              {
                if (+[AXClientSideValueTransformer canTransformAttribute:](AXClientSideValueTransformer, "canTransformAttribute:", v7))
                {
                  +[AXClientSideValueTransformer transformValue:forAttribute:withElement:](AXClientSideValueTransformer, "transformValue:forAttribute:withElement:", *v5, v7, v3);
                  v27 = objc_claimAutoreleasedReturnValue();
                  if (v27)
                  {
                    v28 = (const void *)v27;
                    CFRelease(*v5);
                    *v5 = v28;
                    return 0;
                  }
                }
              }
            }
            return v50;
          }
        }
        else
        {
          if (v49)
          {
            if (_SystemWideServerPortName_onceToken != -1)
              dispatch_once(&_SystemWideServerPortName_onceToken, &__block_literal_global_74);
            v21 = (const char *)_SystemWideServerPortName___portName;
          }
          else
          {
            v21 = 0;
          }
          v30 = _AXGetPortFromCache(v8, v21);
          if (!(_DWORD)v30)
          {
            AXRuntimeLogPID();
            v33 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v33, OS_LOG_TYPE_INFO))
            {
              objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v8);
              v34 = (void *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = 138412290;
              v52 = v34;
              _os_log_impl(&dword_1B54A6000, v33, OS_LOG_TYPE_INFO, "Unable to CopyParam, no port for %@", buf, 0xCu);

            }
            v50 = -25215;
            v15 = v44;
            goto LABEL_32;
          }
          v31 = v30;
          v15 = v44;
          v36 = v43;
          v38 = v46;
          v35 = v45;
          v32 = _AXDetermineRequestingClient();
          v17 = _AXMIGCopyParameterizedAttributeValue(v31, v36, v8, v9, v10, v7, (int)v53, v38, (uint64_t)v35, v15, v32, v54, &v48, (uint64_t *)&v47, (_DWORD *)&v46 + 1, &v50);
          _AXReleasePortFromCache(v31);
          _AXUIElementSetLastGlobalError(v50);
          if (v17)
            goto LABEL_19;
        }
        if (!v50)
          v50 = AXUnserializeWrapper((uint64_t)v54, v48, (uint64_t)v47, HIDWORD(v46), (uint64_t)v5);
        goto LABEL_32;
      }
    }
  }
  return result;
}

uint64_t AXUIElementPerformActionWithValue()
{
  return AXUIElementPerformFencedActionWithValue();
}

uint64_t AXUIElementSharedSystemApp()
{
  uint64_t result;

  result = SystemApp;
  if (!SystemApp)
  {
    if (AXUIElementSharedSystemWide_onceToken != -1)
      dispatch_once(&AXUIElementSharedSystemWide_onceToken, &__block_literal_global_27);
    AXUIElementCopyAttributeValue((AXUIElementRef)AXUIElementSharedSystemWide_SystemWide, (CFStringRef)0x3E9, (CFTypeRef *)&SystemApp);
    AXUIElementRegisterForApplicationDeath((const __AXUIElement *)SystemApp, &__block_literal_global_28);
    return SystemApp;
  }
  return result;
}

AXError AXUIElementSetAttributeValue(AXUIElementRef element, CFStringRef attribute, CFTypeRef value)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  AXError v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  __int128 v10;
  _BOOL4 v11;
  pid_t v12;
  unsigned int v13;
  void *v14;
  unsigned int v15;
  uint64_t v16;
  int v17;
  const char *v18;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  uint64_t v24;
  void *v25;
  __int128 v26[2];
  __int128 v27;
  unsigned int v28;
  unsigned int v29;
  void *v30;
  unsigned int v31;
  BOOL v32;
  AXError v33;
  _OWORD v34[256];
  uint64_t v35;

  v3 = MEMORY[0x1E0C80A78](element);
  v35 = *MEMORY[0x1E0C80C00];
  v31 = 0;
  v30 = 0;
  v29 = 0;
  v6 = kAXErrorIllegalArgument;
  if (!v4)
    return v6;
  if (!v3)
    return v6;
  v7 = v5;
  if (!v5)
    return v6;
  v8 = v4;
  v32 = 0;
  memset(v34, 0, 512);
  v28 = 0;
  v27 = 0uLL;
  v9 = _AXUIElementValidate(v3, &v32, &v27, (int *)&v28);
  v6 = AXSerializeWrapper(v7, 0, v34, &v31, &v30, &v29);
  v33 = v6;
  if (v6)
    return v6;
  v10 = v27;
  v11 = v32;
  v12 = getpid();
  if (v12 == (_DWORD)v9 || !(_DWORD)v9 && v11 && v12 == sSystemWideServerPID)
  {
    v13 = v31;
    v14 = v30;
    v15 = v29;
    if (_OverrideClientType)
      v16 = _OverrideClientType;
    else
      v16 = 7;
    if (getSelfAuditToken_onceToken != -1)
    {
      v25 = v30;
      dispatch_once(&getSelfAuditToken_onceToken, &__block_literal_global_73);
      v14 = v25;
    }
    v26[0] = getSelfAuditToken_auditToken;
    v26[1] = unk_1ECEBE960;
    v17 = _AXXMIGSetAttributeValue(0, v9, v10, *((uint64_t *)&v10 + 1), v8, (uint64_t)v34, v13, v14, v15, v16, (int *)&v33, v26);
    if (!v15)
      goto LABEL_16;
  }
  else
  {
    if (v32)
    {
      if (_SystemWideServerPortName_onceToken != -1)
        dispatch_once(&_SystemWideServerPortName_onceToken, &__block_literal_global_74);
      v18 = (const char *)_SystemWideServerPortName___portName;
    }
    else
    {
      v18 = 0;
    }
    v20 = _AXGetPortFromCache(v9, v18);
    if ((_DWORD)v20)
    {
      v21 = v28;
      v15 = v29;
      v22 = v31;
      v23 = v30;
      v24 = _AXDetermineRequestingClient();
      v17 = _AXMIGSetAttributeValue(v20, v21, v9, v10, *((uint64_t *)&v10 + 1), v8, (uint64_t)v34, v22, (uint64_t)v23, v15, v24, (int *)&v33);
      _AXUIElementSetLastGlobalError(v33);
    }
    else
    {
      v17 = 0;
      v33 = -25215;
      v15 = v29;
    }
    _AXReleasePortFromCache(v20);
    if (!v15)
      goto LABEL_16;
  }
  munmap(v30, v15);
LABEL_16:
  if (v17 == 268451843 || v17 == 268435460)
  {
    _AXIPCToPidTimedOut(v9);
    return -25216;
  }
  else if (v17)
  {
    return -25204;
  }
  else
  {
    return v33;
  }
}

AXError AXUIElementCopyMultipleAttributeValues(AXUIElementRef element, CFArrayRef attributes, AXCopyMultipleAttributeOptions options, CFArrayRef *values)
{
  const void *v4;
  int v5;
  id *v6;
  uint64_t v7;
  AXError result;
  id *v9;
  int v10;
  CFTypeID TypeID;
  uint64_t v12;
  __int128 v13;
  unsigned int v14;
  void *v15;
  unsigned int v16;
  uint64_t v17;
  int v18;
  const char *v19;
  uint64_t v20;
  int v21;
  int v22;
  id *v23;
  int v24;
  uint64_t v25;
  int v26;
  _BOOL4 v27;
  pid_t v28;
  id v29;
  uint64_t v30;
  uint64_t v31;
  void *v32;
  uint64_t v33;
  const __CFArray *v34;
  uint64_t i;
  void *v36;
  unint64_t v37;
  __CFSet *Mutable;
  void *v39;
  __CFSet *v40;
  void *v41;
  const __CFAllocator *allocator;
  id obj;
  CFTypeRef cf;
  const __AXUIElement *v45;
  uint64_t v46;
  _BOOL4 v47;
  char v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53[2];
  __int128 v54;
  int v55;
  unsigned int v56[3];
  uint64_t v57;
  void *v58;
  unsigned int v59;
  BOOL v60;
  AXError v61;
  _BYTE v62[128];
  _BYTE v63[4096];
  _BYTE v64[4104];
  uint64_t v65;

  v7 = MEMORY[0x1E0C80A78](element);
  v65 = *MEMORY[0x1E0C80C00];
  v59 = 0;
  v57 = 0;
  v58 = 0;
  memset(v56, 0, sizeof(v56));
  result = kAXErrorIllegalArgument;
  v45 = (const __AXUIElement *)v7;
  if (!v7)
    return result;
  cf = v4;
  if (!v4)
    return result;
  v9 = v6;
  if (!v6)
    return result;
  v10 = v5;
  TypeID = CFArrayGetTypeID();
  if (TypeID != CFGetTypeID(cf) || !CFArrayGetCount((CFArrayRef)cf))
    return -25201;
  v61 = kAXErrorSuccess;
  v60 = 0;
  memset(v64, 0, 512);
  memset(v63, 0, 512);
  v55 = 0;
  v54 = 0uLL;
  v12 = _AXUIElementValidate((uint64_t)v45, &v60, &v54, &v55);
  result = AXSerializeWrapper((uint64_t)cf, 1, v64, &v59, &v58, (_DWORD *)&v57 + 1);
  v61 = result;
  if (result)
    return result;
  v13 = v54;
  if ((_DWORD)v12 == getpid())
  {
    v14 = v59;
    v15 = v58;
    v16 = HIDWORD(v57);
    if (_OverrideClientType)
      v17 = _OverrideClientType;
    else
      v17 = 7;
    if (getSelfAuditToken_onceToken != -1)
      dispatch_once(&getSelfAuditToken_onceToken, &__block_literal_global_73);
    v53[0] = getSelfAuditToken_auditToken;
    v53[1] = unk_1ECEBE960;
    v18 = _AXXMIGCopyMultipleAttributeValues(0, v12, v13, *((uint64_t *)&v13 + 1), (uint64_t)v64, v14, v15, v16, v10, v17, v63, &v57, (void **)&v56[1], v56, &v61, v53);
  }
  else
  {
    if (v60)
    {
      if (_SystemWideServerPortName_onceToken != -1)
        dispatch_once(&_SystemWideServerPortName_onceToken, &__block_literal_global_74);
      v19 = (const char *)_SystemWideServerPortName___portName;
    }
    else
    {
      v19 = 0;
    }
    v20 = _AXGetPortFromCache(v12, v19);
    if ((_DWORD)v20)
    {
      v21 = v55;
      v22 = v59;
      v23 = v9;
      v24 = (int)v58;
      v16 = HIDWORD(v57);
      v25 = _AXDetermineRequestingClient();
      v26 = v24;
      v9 = v23;
      v18 = _AXMIGCopyMultipleAttributeValues(v20, v21, v12, v13, SDWORD2(v13), (int)v64, v22, v26, v16, v10, v25, v63, &v57, &v56[1], v56, &v61);
      _AXUIElementSetLastGlobalError(v61);
    }
    else
    {
      v18 = 0;
      v61 = -25215;
      v16 = HIDWORD(v57);
    }
    _AXReleasePortFromCache(v20);
  }
  if (v16)
    munmap(v58, v16);
  if (!v18)
  {
    if (v61 == kAXErrorSuccess)
      v61 = AXUnserializeWrapper((uint64_t)v63, v57, *(uint64_t *)&v56[1], v56[0], (uint64_t)v9);
    if (v56[0] && *(_QWORD *)&v56[1])
      munmap(*(void **)&v56[1], v56[0]);
    if (!*v9)
      return v61;
    v27 = v60;
    v28 = getpid();
    if (v28 == (_DWORD)v12)
    {
      v47 = 0;
    }
    else
    {
      v47 = 1;
      if (!(_DWORD)v12 && v27)
        v47 = v28 != sSystemWideServerPID;
    }
    v51 = 0u;
    v52 = 0u;
    v49 = 0u;
    v50 = 0u;
    v29 = *v9;
    v30 = objc_msgSend(v29, "countByEnumeratingWithState:objects:count:", &v49, v62, 16);
    if (v30)
    {
      v31 = v30;
      obj = v29;
      v32 = 0;
      v33 = 0;
      v46 = *(_QWORD *)v50;
      allocator = (const __CFAllocator *)*MEMORY[0x1E0C9AE00];
      v34 = (const __CFArray *)cf;
      do
      {
        for (i = 0; i != v31; ++i)
        {
          if (*(_QWORD *)v50 != v46)
            objc_enumerationMutation(obj);
          v36 = *(void **)(*((_QWORD *)&v49 + 1) + 8 * i);
          v37 = (int)objc_msgSend((id)CFArrayGetValueAtIndex(v34, v33 + i), "intValue");
          if (shouldHandleRemoteElementCallthroughForAttribute(v37))
          {
            Mutable = CFSetCreateMutable(allocator, 0, MEMORY[0x1E0C9B3B0]);
            v39 = _AXHandleRemoteElementCallthrough(v36, v45, v37, 0, 0, &v48, Mutable);
            v40 = Mutable;
            v34 = (const __CFArray *)cf;
            CFRelease(v40);
          }
          else
          {
            v39 = 0;
          }
          if (v47
            && +[AXClientSideValueTransformer canTransformAttribute:](AXClientSideValueTransformer, "canTransformAttribute:", v37))
          {
            if (v39)
              v41 = v39;
            else
              v41 = v36;
            +[AXClientSideValueTransformer transformValue:forAttribute:withElement:](AXClientSideValueTransformer, "transformValue:forAttribute:withElement:", v41, v37, v45);
            v39 = (void *)objc_claimAutoreleasedReturnValue();
          }
          if (v39)
          {
            if (!v32)
              v32 = (void *)objc_msgSend(*v9, "mutableCopy");
            objc_msgSend(v32, "replaceObjectAtIndex:withObject:", v33 + i, v39);
            CFRelease(v39);
          }
        }
        v31 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v49, v62, 16);
        v33 += i;
      }
      while (v31);

      if (!v32)
        return v61;
      CFRelease(*v9);
      v29 = v32;
      *v9 = v29;
    }

    return v61;
  }
  if (v18 != 268451843 && v18 != 268435460)
    return -25204;
  _AXIPCToPidTimedOut(v12);
  return -25216;
}

uint64_t AXUIElementPerformFencedActionWithValue()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  int v4;
  uint64_t v5;
  uint64_t v6;
  int v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  int v13;
  pid_t v14;
  unsigned int v15;
  void *v16;
  unsigned int v17;
  uint64_t v18;
  int v19;
  uint64_t v20;
  const char *v22;
  unsigned int v23;
  uint64_t v24;
  int v25;
  uint64_t v26;
  unsigned int v27;
  uint64_t v28;
  __int128 v29[2];
  unsigned int v30;
  void *v31;
  unsigned int v32;
  uint64_t v33;
  uint64_t v34;
  unsigned int v35;
  unsigned __int8 v36;
  unsigned int v37;
  _OWORD v38[256];
  uint64_t v39;

  v0 = MEMORY[0x1E0C80A78]();
  v39 = *MEMORY[0x1E0C80C00];
  v32 = 0;
  v31 = 0;
  v30 = 0;
  v5 = 4294942095;
  if (v0)
  {
    v6 = v1;
    if ((_DWORD)v1)
    {
      v7 = v4;
      v8 = v3;
      v36 = 0;
      v35 = 0;
      v33 = 0;
      v34 = 0;
      memset(v38, 0, 480);
      v9 = v2 ? v2 : *MEMORY[0x1E0C9B0D0];
      memset(&v38[30], 0, 32);
      v10 = _AXUIElementValidate();
      v5 = AXSerializeWrapper(v9, 1, v38, &v32, &v31, &v30);
      v37 = v5;
      if (!(_DWORD)v5)
      {
        v11 = v33;
        v12 = v34;
        v13 = v36;
        v14 = getpid();
        if (v14 == (_DWORD)v10 || !(_DWORD)v10 && v13 && v14 == sSystemWideServerPID)
        {
          if ((v8 - 1) > 0xFFFFFFFD)
          {
            LODWORD(v8) = 0;
          }
          else if (mach_port_insert_right(*MEMORY[0x1E0C83DA0], v8, v8, 0x13u))
          {
            LODWORD(v8) = 0;
          }
          v15 = v32;
          v16 = v31;
          v17 = v30;
          v18 = _OverrideClientType;
          if (!_OverrideClientType)
            v18 = 7;
          if (getSelfAuditToken_onceToken != -1)
          {
            v28 = v18;
            dispatch_once(&getSelfAuditToken_onceToken, &__block_literal_global_73);
            v18 = v28;
          }
          v29[0] = getSelfAuditToken_auditToken;
          v29[1] = unk_1ECEBE960;
          v19 = _AXXMIGPerformActionWithValue(0, v8, v10, v11, v12, v6, (uint64_t)v38, v15, v16, v17, v18, (int *)&v37, v29);
        }
        else
        {
          v20 = AXUIElementMachPortForNextMessage;
          if (AXUIElementMachPortForNextMessage)
          {
            AXUIElementMachPortForNextMessage = 0;
          }
          else
          {
            if (v36)
            {
              if (_SystemWideServerPortName_onceToken != -1)
                dispatch_once(&_SystemWideServerPortName_onceToken, &__block_literal_global_74);
              v22 = (const char *)_SystemWideServerPortName___portName;
            }
            else
            {
              v22 = 0;
            }
            v20 = _AXGetPortFromCache(v10, v22);
            if (!(_DWORD)v20)
              return 4294942081;
          }
          v27 = v35;
          v23 = v32;
          v24 = (uint64_t)v31;
          v25 = v30;
          v26 = _AXDetermineRequestingClient();
          v19 = _AXMIGPerformActionWithValue(v20, v8, v27, v10, v11, v12, v6, (uint64_t)v38, v23, v24, v25, v26, &v37);
          _AXUIElementSetLastGlobalError(v37);
          if (!v7)
            _AXReleasePortFromCache(v20);
        }
        if (v19 == 268451843 || v19 == 268435460)
        {
          _AXIPCToPidTimedOut(v10);
          return 4294942080;
        }
        else if (v19)
        {
          return 4294942092;
        }
        else
        {
          return v37;
        }
      }
    }
  }
  return v5;
}

AXError AXUIElementPerformAction(AXUIElementRef element, CFStringRef action)
{
  AXError result;
  int v4;
  uint64_t v5;
  __int128 v6;
  _BOOL4 v7;
  pid_t v8;
  uint64_t v9;
  int v10;
  const char *v11;
  uint64_t v12;
  uint64_t v13;
  mach_msg_timeout_t v14;
  uint64_t v15;
  __int128 v16[2];
  __int128 v17;
  mach_msg_timeout_t v18;
  BOOL v19;
  AXError v20;

  result = kAXErrorIllegalArgument;
  if (element)
  {
    v4 = (int)action;
    if ((_DWORD)action)
    {
      v20 = kAXErrorSuccess;
      v19 = 0;
      v18 = 0;
      v17 = 0uLL;
      v5 = _AXUIElementValidate((uint64_t)element, &v19, &v17, (int *)&v18);
      v6 = v17;
      v7 = v19;
      v8 = getpid();
      if (v8 == (_DWORD)v5 || !(_DWORD)v5 && v7 && v8 == sSystemWideServerPID)
      {
        if (_OverrideClientType)
          v9 = _OverrideClientType;
        else
          v9 = 7;
        if (getSelfAuditToken_onceToken != -1)
          dispatch_once(&getSelfAuditToken_onceToken, &__block_literal_global_73);
        v16[0] = getSelfAuditToken_auditToken;
        v16[1] = unk_1ECEBE960;
        v10 = _AXXMIGPerformAction(0, v5, v6, *((uint64_t *)&v6 + 1), v4, v9, (int *)&v20, v16);
      }
      else
      {
        if (v19)
        {
          if (_SystemWideServerPortName_onceToken != -1)
            dispatch_once(&_SystemWideServerPortName_onceToken, &__block_literal_global_74);
          v11 = (const char *)_SystemWideServerPortName___portName;
        }
        else
        {
          v11 = 0;
        }
        v12 = _AXGetPortFromCache(v5, v11);
        if (!(_DWORD)v12)
          return -25215;
        v13 = v12;
        v14 = v18;
        v15 = _AXDetermineRequestingClient();
        v10 = _AXMIGPerformAction(v13, v14, v5, v6, *((uint64_t *)&v6 + 1), v4, v15, &v20);
        _AXUIElementSetLastGlobalError(v20);
        _AXReleasePortFromCache(v13);
      }
      if (v10 == 268451843 || v10 == 268435460)
      {
        _AXIPCToPidTimedOut(v5);
        return -25216;
      }
      else if (v10)
      {
        return -25204;
      }
      else
      {
        return v20;
      }
    }
  }
  return result;
}

uint64_t AXUIElementCopyApplicationAtPosition(const __AXUIElement *a1, uint64_t *a2, float a3, float a4)
{
  return AXUIElementCopyApplicationAndContextAtPositionWithDisplayID(a1, a2, 0, 0, a3, a4);
}

uint64_t AXUIElementCopyApplicationAndContextAtPosition(const __AXUIElement *a1, uint64_t *a2, _DWORD *a3, float a4, float a5)
{
  return AXUIElementCopyApplicationAndContextAtPositionWithDisplayID(a1, a2, a3, 0, a4, a5);
}

uint64_t AXUIElementCopyApplicationAndContextAtPositionWithDisplayID(const __AXUIElement *a1, uint64_t *a2, _DWORD *a3, uint64_t a4, float a5, float a6)
{
  uint64_t result;
  uint64_t v13;
  NSObject *v14;
  uint8_t v15[8];
  __int128 v16;
  BOOL v17;
  int v18;

  result = 4294942095;
  if (a1 && a2)
  {
    v18 = 0;
    v17 = 0;
    v16 = 0uLL;
    _AXUIElementValidate((uint64_t)a1, &v17, &v16, &v18);
    if (v17)
    {
      v13 = copyApplicationAtPosition(a1, a3, a4, a5, a6);
      *a2 = v13;
      if (v13)
      {
        return 0;
      }
      else
      {
        AXLogUIA();
        v14 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
        {
          *(_WORD *)v15 = 0;
          _os_log_impl(&dword_1B54A6000, v14, OS_LOG_TYPE_INFO, "Returning invalid element for copy application:", v15, 2u);
        }

        return 4294942094;
      }
    }
    else
    {
      return 4294942096;
    }
  }
  return result;
}

uint64_t copyApplicationAtPosition(const __AXUIElement *a1, _DWORD *a2, uint64_t a3, float a4, float a5)
{
  AXValueRef v8;
  void *v9;
  const void *v10;
  AXError v11;
  CFTypeRef v12;
  BOOL v13;
  uint64_t Internal;
  char isKindOfClass;
  void *v16;
  void *v17;
  int v18;
  CFTypeRef cf;
  double valuePtr[2];
  _QWORD v22[2];
  _QWORD v23[3];

  v23[2] = *MEMORY[0x1E0C80C00];
  valuePtr[0] = a4;
  valuePtr[1] = a5;
  v8 = AXValueCreate(kAXValueTypeCGPoint, valuePtr);
  v22[0] = CFSTR("point");
  v22[1] = CFSTR("displayId");
  v23[0] = v8;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", a3);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v23[1] = v9;
  v10 = (const void *)objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v23, v22, 2);

  cf = 0;
  if (v8)
    CFRelease(v8);
  v11 = AXUIElementCopyParameterizedAttributeValue(a1, (CFStringRef)0x1656C, v10, &cf);
  v12 = cf;
  if (v11)
    v13 = 1;
  else
    v13 = cf == 0;
  if (v13)
  {
    Internal = 0;
    if (!cf)
      return Internal;
    goto LABEL_16;
  }
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();
  if ((isKindOfClass & 1) != 0)
  {
    if (a2)
    {
      objc_msgSend((id)cf, "objectForKey:", CFSTR("contextId"));
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      *a2 = objc_msgSend(v16, "unsignedIntValue");

    }
    objc_msgSend((id)cf, "objectForKey:", CFSTR("pid"), cf);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = objc_msgSend(v17, "intValue");

    Internal = _AXUIElementCreateInternal(v18, 0, kAXApplicationUID);
  }
  else
  {
    Internal = 0;
  }
  v12 = cf;
  if (cf)
LABEL_16:
    CFRelease(v12);
  return Internal;
}

double AXConvertRectToHostedCoordinates(uint64_t a1, uint64_t a2, double a3, double a4, double a5, double a6)
{
  AXValueRef v8;
  const __AXUIElement *v9;
  void *v10;
  void *v11;
  CFTypeRef result;
  _QWORD valuePtr[4];
  _QWORD v15[4];

  v15[3] = *MEMORY[0x1E0C80C00];
  *(double *)valuePtr = a3;
  *(double *)&valuePtr[1] = a4;
  *(double *)&valuePtr[2] = a5;
  *(double *)&valuePtr[3] = a6;
  result = 0;
  v8 = AXValueCreate(kAXValueTypeCGRect, valuePtr);
  if (AXUIElementSharedSystemWide_onceToken != -1)
    dispatch_once(&AXUIElementSharedSystemWide_onceToken, &__block_literal_global_27);
  v9 = (const __AXUIElement *)AXUIElementSharedSystemWide_SystemWide;
  v15[0] = v8;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", a1);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v15[1] = v10;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", a2);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v15[2] = v11;
  AXUIElementCopyParameterizedAttributeValue(v9, (CFStringRef)0x16577, (CFTypeRef)objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v15, 3), &result);

  if (result)
  {
    AXValueGetValue((AXValueRef)result, kAXValueTypeCGRect, valuePtr);
    if (result)
    {
      CFRelease(result);
      result = 0;
    }
  }
  if (v8)
    CFRelease(v8);
  return *(double *)valuePtr;
}

uint64_t AXUIElementSharedSystemWide()
{
  if (AXUIElementSharedSystemWide_onceToken != -1)
    dispatch_once(&AXUIElementSharedSystemWide_onceToken, &__block_literal_global_27);
  return AXUIElementSharedSystemWide_SystemWide;
}

double AXConvertRectFromHostedCoordinates(uint64_t a1, uint64_t a2, double a3, double a4, double a5, double a6)
{
  AXValueRef v8;
  const __AXUIElement *v9;
  void *v10;
  void *v11;
  CFTypeRef result;
  _QWORD valuePtr[4];
  _QWORD v15[4];

  v15[3] = *MEMORY[0x1E0C80C00];
  *(double *)valuePtr = a3;
  *(double *)&valuePtr[1] = a4;
  *(double *)&valuePtr[2] = a5;
  *(double *)&valuePtr[3] = a6;
  result = 0;
  v8 = AXValueCreate(kAXValueTypeCGRect, valuePtr);
  if (AXUIElementSharedSystemWide_onceToken != -1)
    dispatch_once(&AXUIElementSharedSystemWide_onceToken, &__block_literal_global_27);
  v9 = (const __AXUIElement *)AXUIElementSharedSystemWide_SystemWide;
  v15[0] = v8;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", a1);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v15[1] = v10;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", a2);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v15[2] = v11;
  AXUIElementCopyParameterizedAttributeValue(v9, (CFStringRef)0x16571, (CFTypeRef)objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v15, 3), &result);

  if (result)
  {
    AXValueGetValue((AXValueRef)result, kAXValueTypeCGRect, valuePtr);
    if (result)
    {
      CFRelease(result);
      result = 0;
    }
  }
  if (v8)
    CFRelease(v8);
  return *(double *)valuePtr;
}

double AXConvertPointFromHostedCoordinates(uint64_t a1, uint64_t a2, double a3, double a4)
{
  AXValueRef v6;
  const __AXUIElement *v7;
  void *v8;
  void *v9;
  CFTypeRef result;
  _QWORD valuePtr[2];
  _QWORD v13[4];

  v13[3] = *MEMORY[0x1E0C80C00];
  *(double *)valuePtr = a3;
  *(double *)&valuePtr[1] = a4;
  result = 0;
  v6 = AXValueCreate(kAXValueTypeCGPoint, valuePtr);
  if (AXUIElementSharedSystemWide_onceToken != -1)
    dispatch_once(&AXUIElementSharedSystemWide_onceToken, &__block_literal_global_27);
  v7 = (const __AXUIElement *)AXUIElementSharedSystemWide_SystemWide;
  v13[0] = v6;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", a1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v13[1] = v8;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", a2);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v13[2] = v9;
  AXUIElementCopyParameterizedAttributeValue(v7, (CFStringRef)0x1656F, (CFTypeRef)objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v13, 3), &result);

  if (result)
  {
    AXValueGetValue((AXValueRef)result, kAXValueTypeCGPoint, valuePtr);
    if (result)
    {
      CFRelease(result);
      result = 0;
    }
  }
  if (v6)
    CFRelease(v6);
  return *(double *)valuePtr;
}

double AXConvertPointToHostedCoordinates(uint64_t a1, uint64_t a2, double a3, double a4)
{
  AXValueRef v6;
  const __AXUIElement *v7;
  void *v8;
  void *v9;
  CFTypeRef result;
  _QWORD valuePtr[2];
  _QWORD v13[4];

  v13[3] = *MEMORY[0x1E0C80C00];
  *(double *)valuePtr = a3;
  *(double *)&valuePtr[1] = a4;
  result = 0;
  v6 = AXValueCreate(kAXValueTypeCGPoint, valuePtr);
  if (AXUIElementSharedSystemWide_onceToken != -1)
    dispatch_once(&AXUIElementSharedSystemWide_onceToken, &__block_literal_global_27);
  v7 = (const __AXUIElement *)AXUIElementSharedSystemWide_SystemWide;
  v13[0] = v6;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", a1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v13[1] = v8;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", a2);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v13[2] = v9;
  AXUIElementCopyParameterizedAttributeValue(v7, (CFStringRef)0x16570, (CFTypeRef)objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v13, 3), &result);

  if (result)
  {
    AXValueGetValue((AXValueRef)result, kAXValueTypeCGPoint, valuePtr);
    if (result)
    {
      CFRelease(result);
      result = 0;
    }
  }
  if (v6)
    CFRelease(v6);
  return *(double *)valuePtr;
}

id _AXUIElementSetElementBeingHitTested(id obj)
{
  return objc_storeWeak(&_AXElementBeingHitTested, obj);
}

id _AXUIElementElementBeingHitTested()
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained(&_AXElementBeingHitTested);

  return WeakRetained;
}

void _AXUISetConvertToCAScreenBlock(void *a1)
{
  uint64_t v1;
  void *v2;

  v1 = objc_msgSend(a1, "copy");
  v2 = (void *)AXUIConvertTOCAScreenConversionBlock;
  AXUIConvertTOCAScreenConversionBlock = v1;

}

uint64_t AXUIElementCopyElementWithParameters(uint64_t *a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  double v6;
  double v7;
  double v8;
  double v9;
  void *v10;
  uint64_t v11;
  void *v12;
  unsigned int v13;
  void *v14;
  float v15;
  float v16;

  v3 = a2;
  objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("application"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("point"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "pointValue");
  v7 = v6;
  v9 = v8;

  objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("displayId"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "unsignedIntValue");

  objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("contextId"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v12, "unsignedIntValue");

  objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("hitTestType"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  LOWORD(v3) = objc_msgSend(v14, "unsignedIntValue");
  v15 = v7;
  v16 = v9;
  return _AXUIElementCopyElementAtPositionWithParams((const __AXUIElement *)v4, a1, (unsigned __int16)v3, 0, v13, v11, 0, v15, v16);
}

uint64_t _AXUIElementCopyElementAtPositionWithParams(const __AXUIElement *a1, uint64_t *a2, uint64_t a3, int a4, unsigned int a5, uint64_t a6, int a7, float a8, float a9)
{
  uint64_t v10;
  uint64_t *v11;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  const void *v21;
  uint64_t v22;
  AXValueRef v23;
  void *v24;
  void *v25;
  const __AXUIElement *v26;
  AXError v27;
  CFTypeRef v28;
  CFTypeID v29;
  void *v30;
  void *v31;
  AXError v32;
  id v33;
  CFTypeRef v34;
  CFTypeID v35;
  int v36;
  NSObject *v37;
  CFTypeRef v38;
  void *v39;
  void *v40;
  void *v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t i;
  void *v46;
  void *v47;
  void *v48;
  NSObject *v49;
  id WeakRetained;
  id v51;
  void *v52;
  void *v53;
  uint64_t v54;
  void *v55;
  NSObject *v56;
  void *v57;
  void *v58;
  id v59;
  id v60;
  NSObject *v61;
  double v62;
  double v63;
  double v64;
  __int128 v65;
  _BOOL4 v66;
  pid_t v67;
  _BOOL4 v68;
  NSObject *v69;
  __CFRunLoop *Current;
  float v71;
  float v72;
  int v73;
  uint64_t v74;
  const __AXUIElement *Internal;
  int x_low;
  pid_t v77;
  _BOOL4 CanContactSystemWideServer;
  const void *v79;
  void *v80;
  uint64_t v81;
  _BOOL4 v82;
  uint64_t v83;
  int v84;
  const char *v85;
  mach_msg_timeout_t v86;
  float v87;
  float v88;
  int v89;
  uint64_t v90;
  int v91;
  int v92;
  unsigned int v93;
  NSObject *v94;
  void *v95;
  void *v96;
  uint64_t v97;
  void *v98;
  uint64_t v99;
  uint64_t v100;
  uint64_t v101;
  void *v102;
  void *v103;
  AXUIMLElement *v104;
  void *v105;
  uint64_t v106;
  void *v107;
  void *v108;
  unsigned int v109;
  unsigned int v110;
  uint64_t v111;
  uint64_t *v112;
  void *v113;
  int v114;
  unsigned int v115;
  void *v116;
  id obj;
  __int128 v118[2];
  __int128 v119;
  __int128 v120;
  __int128 v121;
  __int128 v122;
  _QWORD v123[5];
  unsigned int v124;
  CFTypeRef result;
  CGPoint valuePtr;
  __int128 v127;
  mach_msg_timeout_t v128;
  __int128 v129;
  int v130;
  int v131;
  BOOL v132;
  unsigned int v133;
  unsigned int v134;
  _BYTE v135[128];
  _BYTE buf[12];
  __int16 v137;
  void *v138;
  __int16 v139;
  void *v140;
  const __CFString *v141;
  void *v142;
  _QWORD v143[2];
  _OWORD v144[64];
  uint64_t v145;
  NSPoint v146;
  CGRect v147;

  v145 = *MEMORY[0x1E0C80C00];
  v134 = a5;
  v131 = 0;
  v130 = 0;
  v129 = 0uLL;
  v10 = 4294942095;
  if (!a1)
    return v10;
  v11 = a2;
  if (!a2)
    return v10;
  v133 = 0;
  v132 = 0;
  memset(v144, 0, 512);
  v128 = 0;
  v127 = 0uLL;
  v18 = AXRequestingClient();
  *v11 = 0;
  v19 = _AXUIElementValidate((uint64_t)a1, &v132, &v127, (int *)&v128);
  if (!a4 && v132)
  {
    v20 = copyApplicationAtPosition(a1, &v134, a6, a8, a9);
    if (!v20)
    {
      _AXSetRequestingClient(v18);
      return 4294942096;
    }
    v21 = (const void *)v20;
    v19 = _AXUIElementValidate(v20, &v132, &v127, (int *)&v128);
    CFRelease(v21);
    goto LABEL_70;
  }
  v22 = v134;
  if (v134)
    goto LABEL_71;
  if (!AXProcessCanContactSystemWideServer())
  {
LABEL_70:
    v22 = v134;
    if (!v134)
    {
      v62 = a8;
      v64 = a9;
LABEL_73:
      v65 = v127;
      v66 = v132;
      v67 = getpid();
      if (v67 == (_DWORD)v19)
      {
        v68 = 1;
      }
      else
      {
        v68 = 0;
        if (!(_DWORD)v19 && v66)
          v68 = v67 == sSystemWideServerPID;
      }
      if (v68 | a7)
      {
        AXLogHitTest();
        v69 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v69, OS_LOG_TYPE_DEBUG))
        {
          v146.x = v62;
          v146.y = v64;
          NSStringFromPoint(v146);
          v96 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", v134);
          v97 = v19;
          v98 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138412546;
          *(_QWORD *)&buf[4] = v96;
          v137 = 2112;
          v138 = v98;
          _os_log_debug_impl(&dword_1B54A6000, v69, OS_LOG_TYPE_DEBUG, "Calling from same app for point: %@ and contextId: %@", buf, 0x16u);

          v19 = v97;
        }

        Current = CFRunLoopGetCurrent();
        if (Current == CFRunLoopGetMain())
        {
          v71 = v62;
          v72 = v64;
          v73 = v134;
          if (_OverrideClientType)
            v74 = _OverrideClientType;
          else
            v74 = 7;
          if (getSelfAuditToken_onceToken != -1)
            dispatch_once(&getSelfAuditToken_onceToken, &__block_literal_global_73);
          v118[0] = getSelfAuditToken_auditToken;
          v118[1] = unk_1ECEBE960;
          if (!_AXXMIGCopyElementAtPosition(v71, v72, 0, v19, v65, *((uint64_t *)&v65 + 1), a3, v73, v74, &v131, &v129, v144, &v130, (int *)&v133, v118))goto LABEL_88;
        }
      }
      else
      {
        v83 = AXUIElementMachPortForNextMessage;
        if (AXUIElementMachPortForNextMessage)
        {
          v84 = v19;
          AXUIElementMachPortForNextMessage = 0;
        }
        else
        {
          if (v132)
          {
            if (_SystemWideServerPortName_onceToken != -1)
              dispatch_once(&_SystemWideServerPortName_onceToken, &__block_literal_global_74);
            v85 = (const char *)_SystemWideServerPortName___portName;
          }
          else
          {
            v85 = 0;
          }
          v84 = v19;
          v83 = _AXGetPortFromCache(v19, v85);
          if (!(_DWORD)v83)
          {
            AXRuntimeLogPID();
            v94 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v94, OS_LOG_TYPE_INFO))
            {
              objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v19);
              v95 = (void *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = 138412290;
              *(_QWORD *)&buf[4] = v95;
              _os_log_impl(&dword_1B54A6000, v94, OS_LOG_TYPE_INFO, "Unable to CopyElement, no port for %@", buf, 0xCu);

            }
            v93 = -25215;
            goto LABEL_109;
          }
        }
        v86 = v128;
        v89 = v134;
        v90 = _AXDetermineRequestingClient();
        v87 = v62;
        v88 = v64;
        v91 = v89;
        LODWORD(v19) = v84;
        v92 = _AXMIGCopyElementAtPosition(v83, v86, v84, v65, *((uint64_t *)&v65 + 1), a3, v91, v90, v87, v88, &v131, &v129, v144, &v130, &v133);
        _AXUIElementSetLastGlobalError(v133);
        _AXReleasePortFromCache(v83);
        if (!v92)
        {
LABEL_88:
          if (v133)
            goto LABEL_110;
          Internal = (const __AXUIElement *)_AXUIElementCreateInternal(v131, v129, *((uint64_t *)&v129 + 1));
          *v11 = (uint64_t)Internal;
          if (Internal)
          {
            LODWORD(valuePtr.x) = 0;
            AXUIElementGetPid(Internal, (pid_t *)&valuePtr);
            x_low = LODWORD(valuePtr.x);
            if ((LODWORD(valuePtr.x) & 0x80000000) != 0)
            {
              v77 = getpid();
              x_low = LODWORD(valuePtr.x);
              if (v77 + LODWORD(valuePtr.x))
              {
                v99 = -LODWORD(valuePtr.x);
                v100 = _AXUIElementIDForElement(*v11);
                v79 = (const void *)_AXUIElementCreateWithPIDAndID(v99, v100, v101);
                +[AXUIMLElement cachedElementForParent:](AXUIMLElement, "cachedElementForParent:", v79);
                v102 = (void *)objc_claimAutoreleasedReturnValue();
                v103 = v102;
                if (v102)
                  v104 = v102;
                else
                  v104 = -[AXUIMLElement initWithParentElement:]([AXUIMLElement alloc], "initWithParentElement:", v79);
                v80 = v104;
                if (*v11)
                {
                  CFRelease((CFTypeRef)*v11);
                  *v11 = 0;
                }
                *v11 = objc_msgSend(v80, "copyElementAtPosition:", a8, a9);
                goto LABEL_132;
              }
            }
            if (x_low != (_DWORD)v19 && x_low)
            {
              CanContactSystemWideServer = AXProcessCanContactSystemWideServer();
              if (!a7 && CanContactSystemWideServer)
              {
                v79 = (const void *)AXUICreateApplicationElementForElement((const __AXUIElement *)*v11);
                _UIAXElementForAXUIElementRef(*v11);
                v80 = (void *)objc_claimAutoreleasedReturnValue();
                objc_opt_class();
                if ((objc_opt_isKindOfClass() & 1) != 0)
                {
                  _AXUIElementSetMachPortForNextMessage(objc_msgSend(v80, "machPort"));
                  v81 = a3;
                  v82 = (objc_msgSend(v80, "deniesDirectAppConnection") & 1) == 0 && objc_msgSend(v80, "remotePid") != 0;
                }
                else
                {
                  v81 = a3;
                  v82 = 1;
                }
                *(_QWORD *)buf = 0;
                +[AXUIElement uiElementWithAXElement:](AXUIElement, "uiElementWithAXElement:", *v11);
                v103 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v103, "numberWithAXAttribute:", 2021);
                v105 = (void *)objc_claimAutoreleasedReturnValue();
                v106 = objc_msgSend(v105, "unsignedIntValue");

                if (v82)
                {
                  v133 = _AXUIElementCopyElementAtPositionWithParams(*v11, buf, v81, 0, v106, 0, 0, a8, a9);
                  if (!v133)
                  {
                    CFRelease((CFTypeRef)*v11);
                    *v11 = *(_QWORD *)buf;
                  }
                }
LABEL_132:
                if (v79)
                  CFRelease(v79);

LABEL_135:
                if (*v11)
                {
                  if (!v133)
                  {
LABEL_112:
                    _AXSetRequestingClient(v18);
                    return v133;
                  }
LABEL_110:
                  if (*v11)
                  {
                    CFRelease((CFTypeRef)*v11);
                    *v11 = 0;
                  }
                  goto LABEL_112;
                }
                goto LABEL_138;
              }
              x_low = LODWORD(valuePtr.x);
            }
            if (x_low)
              goto LABEL_135;
            if (*v11)
            {
              CFRelease((CFTypeRef)*v11);
              *v11 = 0;
            }
          }
LABEL_138:
          v93 = -25200;
          goto LABEL_109;
        }
      }
      v93 = -25204;
LABEL_109:
      v133 = v93;
      goto LABEL_110;
    }
LABEL_71:
    v62 = AXConvertPointToHostedCoordinates(v22, a6, a8, a9);
    v64 = v63;
    goto LABEL_73;
  }
  v115 = v19;
  valuePtr.x = a8;
  valuePtr.y = a9;
  v23 = AXValueCreate(kAXValueTypeCGPoint, &valuePtr);
  v143[0] = v23;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", a6);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v143[1] = v24;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v143, 2);
  v25 = (void *)objc_claimAutoreleasedReturnValue();

  result = 0;
  v26 = (const __AXUIElement *)_AXUIElementCreateInternal(0, 0, kAXApplicationUID);
  v27 = AXUIElementCopyParameterizedAttributeValue(v26, (CFStringRef)0x16573, v25, &result);
  if (v23)
    CFRelease(v23);
  v28 = result;
  if (v27 == kAXErrorSuccess && result)
  {
    v29 = CFGetTypeID(result);
    if (v29 == CFNumberGetTypeID())
      v134 = objc_msgSend((id)result, "unsignedIntValue");
    v28 = result;
  }
  if (v28)
  {
    CFRelease(v28);
    result = 0;
  }
  if (!a7)
  {
LABEL_67:
    if (v26)
      CFRelease(v26);

    v19 = v115;
    goto LABEL_70;
  }
  v114 = a7;
  v141 = CFSTR("contextId");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", v134);
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  v142 = v30;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v142, &v141, 1);
  v31 = (void *)objc_claimAutoreleasedReturnValue();

  v32 = AXUIElementCopyParameterizedAttributeValue(v26, (CFStringRef)0x16574, v31, &result);
  v33 = 0;
  v34 = result;
  if (v32 == kAXErrorSuccess && result)
  {
    v35 = CFGetTypeID(result);
    if (v35 == CFNumberGetTypeID() && (v36 = objc_msgSend((id)result, "unsignedIntValue"), v36 != getpid()))
    {
      v112 = v11;
      v113 = v31;
      v109 = a6;
      AXRuntimeLogCommon();
      v37 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v37, OS_LOG_TYPE_INFO))
      {
        v38 = result;
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", v134);
        v39 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", getpid());
        v40 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412802;
        *(_QWORD *)&buf[4] = v38;
        v137 = 2112;
        v138 = v39;
        v139 = 2112;
        v140 = v40;
        _os_log_impl(&dword_1B54A6000, v37, OS_LOG_TYPE_INFO, "the pid{%@} for this context id{%@} is not the same for the hit testing app{%@}, so we shouldn't use it here. this hit test needs to forward through to the remote view", buf, 0x20u);

      }
      v108 = v25;
      v110 = a3;
      v111 = v18;

      +[AXRemoteElement registeredRemoteElements](AXRemoteElement, "registeredRemoteElements");
      v41 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v41, "enumerateObjectsUsingBlock:", &__block_literal_global_0);

      v123[0] = MEMORY[0x1E0C809B0];
      v123[1] = 3221225472;
      v123[2] = ___AXUIElementCopyElementAtPositionWithParams_block_invoke_17;
      v123[3] = &__block_descriptor_44_e25_B16__0__AXRemoteElement_8l;
      v124 = v134;
      v123[4] = result;
      +[AXRemoteElement remoteElementsForBlock:](AXRemoteElement, "remoteElementsForBlock:", v123);
      v119 = 0u;
      v120 = 0u;
      v121 = 0u;
      v122 = 0u;
      obj = (id)objc_claimAutoreleasedReturnValue();
      v42 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v119, v135, 16);
      if (v42)
      {
        v43 = v42;
        v33 = 0;
        v44 = *(_QWORD *)v120;
        do
        {
          for (i = 0; i != v43; ++i)
          {
            if (*(_QWORD *)v120 != v44)
              objc_enumerationMutation(obj);
            v46 = *(void **)(*((_QWORD *)&v119 + 1) + 8 * i);
            objc_msgSend(v46, "accessibilityContainer");
            v47 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v47, "valueForKey:", CFSTR("_accessibilityWindow"));
            v48 = (void *)objc_claimAutoreleasedReturnValue();

            AXRuntimeLogCommon();
            v49 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v49, OS_LOG_TYPE_INFO))
            {
              *(_DWORD *)buf = 138412546;
              *(_QWORD *)&buf[4] = v46;
              v137 = 2112;
              v138 = v48;
              _os_log_impl(&dword_1B54A6000, v49, OS_LOG_TYPE_INFO, "matched on %@ with window: %@", buf, 0x16u);
            }

            if (!v33 && v48)
              v33 = v46;

          }
          v43 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v119, v135, 16);
        }
        while (v43);
      }
      else
      {
        v33 = 0;
      }
      if (objc_msgSend(obj, "count"))
      {
        v18 = v111;
        v11 = v112;
        a6 = v109;
        a3 = v110;
        v25 = v108;
        v31 = v113;
      }
      else
      {

        objc_opt_class();
        v18 = v111;
        v11 = v112;
        a6 = v109;
        a3 = v110;
        v25 = v108;
        v31 = v113;
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          WeakRetained = objc_loadWeakRetained(&_AXElementBeingHitTested);

          v51 = WeakRetained;
          objc_msgSend(v51, "accessibilityContainer");
          v52 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v52, "valueForKey:", CFSTR("_accessibilityWindow"));
          v53 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(v51, "containerAccessibilityFrame");
          v54 = 0;
          v116 = v53;
          if (CGRectContainsPoint(v147, valuePtr) && v53)
          {
            objc_msgSend(v53, "valueForKey:", CFSTR("isHidden"));
            v55 = (void *)objc_claimAutoreleasedReturnValue();
            v54 = objc_msgSend(v55, "BOOLValue") ^ 1;

          }
          v107 = v51;
          AXRuntimeLogCommon();
          v56 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v56, OS_LOG_TYPE_INFO))
          {
            objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v54);
            v57 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138412546;
            *(_QWORD *)&buf[4] = v57;
            v137 = 2112;
            v138 = v107;
            _os_log_impl(&dword_1B54A6000, v56, OS_LOG_TYPE_INFO, "Did not find matching remote element (multi-level remote hosting in play) - checking starting element: %@ %@", buf, 0x16u);

          }
          if ((_DWORD)v54)
          {
            v58 = v107;
            v59 = v107;

            v33 = v59;
            v31 = v113;
          }
          else
          {
            v31 = v113;
            v58 = v107;
          }

        }
      }
      if (v33)
      {
        v60 = v33;
        AXRuntimeLogCommon();
        v61 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v61, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 138412546;
          *(_QWORD *)&buf[4] = v60;
          v137 = 1024;
          LODWORD(v138) = v134;
          _os_log_impl(&dword_1B54A6000, v61, OS_LOG_TYPE_INFO, "The mismatched pid was found to be a remote element: %@, so leaving contextId unchanged so let's reset to use contextId of the hosting window: %u", buf, 0x12u);
        }

        v31 = v113;
      }
      else
      {
        v134 = 0;
      }

    }
    else
    {
      v33 = 0;
    }
    v34 = result;
  }
  if (v34)
  {
    CFRelease(v34);
    result = 0;
  }
  if (!v33)
  {

    a7 = v114;
    goto LABEL_67;
  }
  *v11 = _AXCreateAXUIElementWithElement(v33);
  if (v26)
    CFRelease(v26);
  _AXSetRequestingClient(v18);

  return 0;
}

AXUIElementRef AXUIElementCreateSystemWide(void)
{
  return (AXUIElementRef)_AXUIElementCreateInternal(0, 0, kAXApplicationUID);
}

AXError AXUIElementGetPid(AXUIElementRef element, pid_t *pid)
{
  AXError v2;
  pid_t v4;

  v2 = kAXErrorIllegalArgument;
  if (element && pid)
  {
    *pid = -1;
    v4 = _AXUIElementValidate();
    v2 = kAXErrorSuccess;
    *pid = v4;
  }
  return v2;
}

uint64_t AXUICreateApplicationElementForElement(const __AXUIElement *a1)
{
  pid_t pid;

  pid = -1;
  AXUIElementGetPid(a1, &pid);
  return _AXUIElementCreateAppElementWithPid(pid);
}

uint64_t AXUIElementCopyElementUsingContextIdAtPosition(const __AXUIElement *a1, unsigned int a2, uint64_t *a3, int a4, float a5, float a6)
{
  return _AXUIElementCopyElementAtPositionWithParams(a1, a3, 2 * (a4 != 0), 0, a2, 0, 0, a5, a6);
}

uint64_t AXUIElementCopyElementAtPositionWithParams(const __AXUIElement *a1, uint64_t *a2, int a3, float a4, float a5)
{
  return _AXUIElementCopyElementAtPositionWithParams(a1, a2, 2 * (a3 != 0), 0, 0, 0, 0, a4, a5);
}

uint64_t AXUIElementCopyElementUsingDisplayIdAtPosition(const __AXUIElement *a1, uint64_t a2, uint64_t *a3, int a4, float a5, float a6)
{
  AXValueRef v12;
  const __AXUIElement *Internal;
  void *v14;
  uint64_t v15;
  CFTypeRef v16;
  CFTypeID v17;
  double v19[2];
  CFTypeRef result;
  _QWORD v21[3];

  v21[2] = *MEMORY[0x1E0C80C00];
  result = 0;
  v19[0] = a5;
  v19[1] = a6;
  v12 = AXValueCreate(kAXValueTypeCGPoint, v19);
  Internal = (const __AXUIElement *)_AXUIElementCreateInternal(0, 0, kAXApplicationUID);
  v21[0] = v12;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", a2);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v21[1] = v14;
  v15 = AXUIElementCopyParameterizedAttributeValue(Internal, (CFStringRef)0x16573, (CFTypeRef)objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v21, 2), &result);

  if (Internal)
    CFRelease(Internal);
  if (v12)
    CFRelease(v12);
  v16 = result;
  if (!(_DWORD)v15 && result)
  {
    v17 = CFGetTypeID(result);
    if (v17 == CFNumberGetTypeID())
      v15 = _AXUIElementCopyElementAtPositionWithParams(a1, a3, 2 * (a4 != 0), 0, objc_msgSend((id)result, "unsignedIntValue"), a2, 0, a5, a6);
    else
      v15 = 0;
    v16 = result;
  }
  if (v16)
    CFRelease(v16);
  return v15;
}

AXError AXUIElementCopyElementAtPosition(AXUIElementRef application, float x, float y, AXUIElementRef *element)
{
  return _AXUIElementCopyElementAtPositionWithParams(application, (uint64_t *)element, 0, 0, 0, 0, 0, x, y);
}

void AXUIElementRegisterForApplicationDeath(const __AXUIElement *a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  id v6;
  pid_t pid;

  v3 = a2;
  if (AXUIElementRegisterForApplicationDeath_onceToken != -1)
    dispatch_once(&AXUIElementRegisterForApplicationDeath_onceToken, &__block_literal_global_39);
  v4 = (void *)objc_msgSend(v3, "copy");
  pid = 0;
  AXUIElementGetPid(a1, &pid);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", pid);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)ApplicationDeathHandlers, "objectForKey:", v5);
  v6 = (id)objc_claimAutoreleasedReturnValue();
  if (!v6)
    v6 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  objc_msgSend(v6, "addObject:", v4);
  objc_msgSend((id)ApplicationDeathHandlers, "setObject:forKey:", v6, v5);

}

uint64_t AXUIElementSharedKeyboardApp()
{
  uint64_t result;
  const __AXUIElement *v1;

  result = AXUIElementSharedKeyboardApp_KeyboardApp;
  if (!AXUIElementSharedKeyboardApp_KeyboardApp)
  {
    v1 = (const __AXUIElement *)AXUIElementSharedSystemApp();
    AXUIElementCopyAttributeValue(v1, (CFStringRef)0x453, (CFTypeRef *)&AXUIElementSharedKeyboardApp_KeyboardApp);
    AXUIElementRegisterForApplicationDeath((const __AXUIElement *)AXUIElementSharedKeyboardApp_KeyboardApp, &__block_literal_global_29);
    return AXUIElementSharedKeyboardApp_KeyboardApp;
  }
  return result;
}

BOOL AXUIElementIsApplication(uint64_t a1)
{
  uint64_t v1;

  _AXUIElementIDForElement(a1);
  return v1 == kAXApplicationUID;
}

AXError AXUIElementSetMessagingTimeout(AXUIElementRef element, float timeoutInSeconds)
{
  AXError result;
  uint64_t v4;
  int v5;
  __int128 v6;
  int v7;
  BOOL v8;

  v8 = 0;
  result = kAXErrorIllegalArgument;
  if (element && timeoutInSeconds >= 0.0)
  {
    v7 = 0;
    v6 = 0uLL;
    v4 = (int)(float)(timeoutInSeconds * 1000.0);
    v5 = _AXUIElementValidate((uint64_t)element, &v8, &v6, &v7);
    if (v8)
    {
      _AXUIElementSetGlobalTimeout(v4);
      return 0;
    }
    else if (v5 < 1)
    {
      return -25202;
    }
    else
    {
      result = kAXErrorSuccess;
      *((_DWORD *)element + 9) = v4;
    }
  }
  return result;
}

void *AXUIElementRegisterSystemWideServerDeathCallback(void *result, uint64_t a2)
{
  gSystemWideServerCallback = result;
  gSystemWideServerCallbackInfo = a2;
  return result;
}

AXError AXObserverCreate(pid_t application, AXObserverCallback callback, AXObserverRef *outObserver)
{
  return AXObserverCreateWithPidObserver(application, (uint64_t)callback, (uint64_t *)outObserver, 0);
}

uint64_t AXObserverCreateWithPidObserver(int a1, uint64_t a2, uint64_t *a3, void *a4)
{
  uint64_t result;
  uint64_t Internal;
  uint64_t v9;
  __CFRunLoopSource *v10;
  uint64_t v11;
  const __AXUIElement *v12;
  AXError v13;
  int v14;

  v14 = 1024;
  result = 4294942095;
  if (a1 < 0 || !a2 || !a3)
    return result;
  Internal = _AXObserverCreateInternal(a1, a2);
  if (!Internal)
    return 4294942096;
  v9 = Internal;
  v10 = MSHCreateMIGServerSource(0, 0, (uint64_t)_AXXMIGAccessibilityDefs_subsystem, 0, 0, 0);
  if (!v10)
  {
    CFRelease((CFTypeRef)v9);
    return 4294942096;
  }
  *(_QWORD *)(v9 + 24) = v10;
  v11 = MSHGetMachPortFromSource(v10);
  *(_DWORD *)(v9 + 32) = v11;
  MEMORY[0x1B5E4B648](*MEMORY[0x1E0C83DA0], v11, 1, &v14, 4);
  _AXSetObserverForPort((const void *)v9, *(_DWORD *)(v9 + 32));
  v12 = (const __AXUIElement *)_AXUIElementCreateInternal(0, 0, kAXApplicationUID);
  v13 = AXObserverAddNotification((AXObserverRef)v9, v12, (CFStringRef)0x3FD, a4);
  if (v12)
    CFRelease(v12);
  if (v13)
    NSLog((NSString *)CFSTR("AXError: Could not auto-register for pid status change"));
  result = 0;
  *a3 = v9;
  return result;
}

AXError AXObserverAddNotification(AXObserverRef observer, AXUIElementRef element, CFStringRef notification, void *refcon)
{
  AXError result;
  CFTypeID TypeID;
  uint64_t v10;
  uint64_t v11;
  __int128 v12;
  _BOOL4 v13;
  pid_t v14;
  mach_port_name_t v15;
  ipc_space_t *v16;
  kern_return_t v17;
  _BOOL4 v18;
  uint64_t v19;
  const char *v20;
  uint64_t v21;
  uint64_t v22;
  double Current;
  CFAbsoluteTime v24;
  mach_msg_timeout_t v25;
  const __CFString *v26;
  int v27;
  CFAbsoluteTime v28;
  _OWORD v29[2];
  __int128 v30;
  int v31;
  BOOL v32;
  AXError v33;

  v33 = kAXErrorSuccess;
  result = kAXErrorIllegalArgument;
  if (element && observer && (_DWORD)notification)
  {
    TypeID = AXObserverGetTypeID();
    if (TypeID != CFGetTypeID(observer))
      return -25203;
    v32 = 0;
    v31 = 0;
    v30 = 0uLL;
    v10 = _AXUIElementValidate((uint64_t)element, &v32, &v30, &v31);
    if ((_DWORD)v10 == *((_DWORD *)observer + 4))
    {
      v11 = v10;
      v12 = v30;
      v13 = v32;
      v14 = getpid();
      if (v14 == (_DWORD)v11 || !(_DWORD)v11 && v13 && v14 == sSystemWideServerPID)
      {
        v15 = *((_DWORD *)observer + 8);
        v16 = (ipc_space_t *)MEMORY[0x1E0C83DA0];
        v17 = mach_port_mod_refs(*MEMORY[0x1E0C83DA0], v15, 0, 1);
        if (v17 == 17)
          v17 = mach_port_mod_refs(*v16, v15, 4u, 1);
        if (v17)
          return -25204;
        v18 = *((_BYTE *)observer + 48) == 0;
        if (getSelfAuditToken_onceToken != -1)
          dispatch_once(&getSelfAuditToken_onceToken, &__block_literal_global_73);
        v29[0] = getSelfAuditToken_auditToken;
        v29[1] = unk_1ECEBE960;
        if (_AXXMIGAddNotification(0, v11, v12, *((uint64_t *)&v12 + 1), (uint64_t)notification, v15, v18, (uint64_t)refcon, (int *)&v33, v29))return -25204;
      }
      else
      {
        v19 = *((unsigned int *)observer + 4);
        if (v32)
        {
          if (_SystemWideServerPortName_onceToken != -1)
            dispatch_once(&_SystemWideServerPortName_onceToken, &__block_literal_global_74);
          v20 = (const char *)_SystemWideServerPortName___portName;
        }
        else
        {
          v20 = 0;
        }
        v21 = _AXGetPortFromCache(v19, v20);
        if (!(_DWORD)v21)
          return -25215;
        v22 = v21;
        Current = CFAbsoluteTimeGetCurrent();
        if (v31 <= 999)
        {
          CFLog();
          v31 = 2000;
        }
        v24 = CFAbsoluteTimeGetCurrent();
        v25 = v31;
        if (v24 - Current >= (double)(v31 / 1000))
        {
          v27 = 1;
        }
        else
        {
          v26 = (const __CFString *)*MEMORY[0x1E0C9B280];
          do
          {
            v27 = _AXMIGAddNotification(v22, v25, v11, v12, *((uint64_t *)&v12 + 1), (int)notification, *((_DWORD *)observer + 8), *((_BYTE *)observer + 48) == 0, (uint64_t)refcon, (int *)&v33);
            _AXUIElementSetLastGlobalError(v33);
            if (!v27)
              break;
            CFRunLoopRunInMode(v26, 0.5, 1u);
            v28 = CFAbsoluteTimeGetCurrent();
            v25 = v31;
          }
          while (v28 - Current < (double)(v31 / 1000));
        }
        _AXReleasePortFromCache(v22);
        if (v27)
          return -25204;
      }
      result = v33;
      if (v33 == kAXErrorSuccess)
        *((_BYTE *)observer + 48) = 1;
    }
    else
    {
      return -25201;
    }
  }
  return result;
}

void _AXObserverRelease(uint64_t a1)
{
  __CFRunLoopSource *v2;

  if (a1)
  {
    v2 = *(__CFRunLoopSource **)(a1 + 24);
    if (v2)
    {
      CFRunLoopSourceInvalidate(v2);
      CFRelease(*(CFTypeRef *)(a1 + 24));
      _AXRemoveObserverForPort(*(_DWORD *)(a1 + 32));
    }
  }
}

CFRunLoopSourceRef AXObserverGetRunLoopSource(CFRunLoopSourceRef observer)
{
  if (observer)
    return (CFRunLoopSourceRef)*((_QWORD *)observer + 3);
  return observer;
}

AXError AXObserverRemoveNotification(AXObserverRef observer, AXUIElementRef element, CFStringRef notification)
{
  AXError result;
  CFTypeID TypeID;
  uint64_t v8;
  uint64_t v9;
  __int128 v10;
  _BOOL4 v11;
  pid_t v12;
  mach_port_name_t v13;
  ipc_space_t *v14;
  int v15;
  uint64_t v16;
  const char *v17;
  uint64_t v18;
  uint64_t v19;
  NSObject *v20;
  uint64_t v21;
  __int128 v22[2];
  __int128 v23;
  mach_msg_timeout_t v24;
  BOOL v25;
  AXError v26;
  uint8_t buf[4];
  AXObserverRef v28;
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  result = kAXErrorIllegalArgument;
  if (observer && element && (_DWORD)notification)
  {
    TypeID = AXObserverGetTypeID();
    if (TypeID != CFGetTypeID(observer))
      return -25203;
    if (!*((_BYTE *)observer + 48))
      return -25210;
    v26 = kAXErrorSuccess;
    v25 = 0;
    v24 = 0;
    v23 = 0uLL;
    v8 = _AXUIElementValidate((uint64_t)element, &v25, &v23, (int *)&v24);
    if ((_DWORD)v8 != *((_DWORD *)observer + 4))
      return -25201;
    v9 = v8;
    v10 = v23;
    v11 = v25;
    v12 = getpid();
    if (v12 == (_DWORD)v9 || !(_DWORD)v9 && v11 && v12 == sSystemWideServerPID)
    {
      v13 = *((_DWORD *)observer + 8);
      v14 = (ipc_space_t *)MEMORY[0x1E0C83DA0];
      v15 = mach_port_mod_refs(*MEMORY[0x1E0C83DA0], v13, 0, 1);
      if (v15 == 17)
        v15 = mach_port_mod_refs(*v14, v13, 4u, 1);
      if (!v15)
      {
        if (getSelfAuditToken_onceToken != -1)
          dispatch_once(&getSelfAuditToken_onceToken, &__block_literal_global_73);
        v22[0] = getSelfAuditToken_auditToken;
        v22[1] = unk_1ECEBE960;
        v15 = _AXXMIGRemoveNotification(0, v9, v10, *((uint64_t *)&v10 + 1), (uint64_t)notification, v13, (int *)&v26, v22);
      }
      goto LABEL_27;
    }
    v16 = *((unsigned int *)observer + 4);
    if (v25)
    {
      if (_SystemWideServerPortName_onceToken != -1)
      {
        v21 = *((unsigned int *)observer + 4);
        dispatch_once(&_SystemWideServerPortName_onceToken, &__block_literal_global_74);
        v16 = v21;
      }
      v17 = (const char *)_SystemWideServerPortName___portName;
    }
    else
    {
      v17 = 0;
    }
    v18 = _AXGetPortFromCache(v16, v17);
    if ((_DWORD)v18)
    {
      v19 = v18;
      v15 = _AXMIGRemoveNotification(v18, v24, v9, v10, *((uint64_t *)&v10 + 1), (int)notification, *((_DWORD *)observer + 8), (int *)&v26);
      _AXUIElementSetLastGlobalError(v26);
      _AXReleasePortFromCache(v19);
LABEL_27:
      if (v15)
        return -25204;
      else
        return v26;
    }
    AXRuntimeLogPID();
    v20 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      v28 = observer;
      _os_log_impl(&dword_1B54A6000, v20, OS_LOG_TYPE_INFO, "Unable to AddObserver, no port for %@", buf, 0xCu);
    }

    return -25215;
  }
  return result;
}

uint64_t _AXKeyboardAppPid()
{
  const __AXUIElement *v0;
  pid_t pid;

  pid = 0;
  v0 = (const __AXUIElement *)AXUIElementSharedKeyboardApp();
  AXUIElementGetPid(v0, &pid);
  return pid;
}

void portInvalidationCallback(uint64_t a1, uint64_t a2)
{
  NSObject *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  void *v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  uint64_t v18;
  uint64_t v19;
  void (*v20)(uint64_t);
  void *v21;
  int v22;
  uint8_t v23[128];
  uint8_t buf[4];
  int v25;
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  AXRuntimeLogPID();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 67109120;
    v25 = a2;
    _os_log_impl(&dword_1B54A6000, v3, OS_LOG_TYPE_INFO, "Port invalidated: %d", buf, 8u);
  }

  v18 = MEMORY[0x1E0C809B0];
  v19 = 3221225472;
  v20 = __portInvalidationCallback_block_invoke;
  v21 = &__block_descriptor_36_e5_v8__0l;
  v22 = a2;
  AX_PERFORM_WITH_LOCK();
  if (!(_DWORD)a2 && gSystemWideServerCallback)
    gSystemWideServerCallback(gSystemWideServerCallbackInfo);
  v4 = (void *)ApplicationDeathHandlers;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", a2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKey:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v16 = 0u;
  v17 = 0u;
  v14 = 0u;
  v15 = 0u;
  v7 = v6;
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v14, v23, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v15;
    do
    {
      for (i = 0; i != v9; ++i)
      {
        if (*(_QWORD *)v15 != v10)
          objc_enumerationMutation(v7);
        (*(void (**)(_QWORD))(*(_QWORD *)(*((_QWORD *)&v14 + 1) + 8 * i) + 16))(*(_QWORD *)(*((_QWORD *)&v14 + 1) + 8 * i));
      }
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v14, v23, 16);
    }
    while (v9);
  }

  v12 = (void *)ApplicationDeathHandlers;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", a2, (_QWORD)v14);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "removeObjectForKey:", v13);

}

unint64_t AXGetCurrentSerializationStyle()
{
  if (AXInitSerializationStyle_onceToken != -1)
    dispatch_once(&AXInitSerializationStyle_onceToken, &__block_literal_global_79);
  return atomic_load(&AXCurrentSerializationStyle);
}

void AXSetCurrentSerializationStyle(unint64_t a1)
{
  if (AXInitSerializationStyle_onceToken != -1)
    dispatch_once(&AXInitSerializationStyle_onceToken, &__block_literal_global_79);
  atomic_store(a1, &AXCurrentSerializationStyle);
}

uint64_t _AXSetAllowsSuspendedAppServer(uint64_t result)
{
  gAllowsSuspendedAppServer = result;
  return result;
}

void _AXUIScreenConvertToCAScreen(int a1)
{
  void *v2;
  int v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  void *v10;
  int v11;
  void *v12;
  void *v13;
  void *v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  if (_AXUIScreenConvertToCAScreen_onceToken == -1)
  {
    if (!a1)
      return;
  }
  else
  {
    dispatch_once(&_AXUIScreenConvertToCAScreen_onceToken, &__block_literal_global_41);
    if (!a1)
      return;
  }
  objc_msgSend((id)_AXUIScreenConvertToCAScreen_mainScreen, "valueForKey:", CFSTR("_integerDisplayID"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "unsignedIntValue");

  if (v3 != a1)
  {
    -[objc_class valueForKey:](NSClassFromString((NSString *)CFSTR("UIScreen")), "valueForKey:", CFSTR("screens"));
    v15 = 0u;
    v16 = 0u;
    v17 = 0u;
    v18 = 0u;
    v4 = (id)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    if (v5)
    {
      v6 = v5;
      v7 = *(_QWORD *)v16;
      while (2)
      {
        for (i = 0; i != v6; ++i)
        {
          if (*(_QWORD *)v16 != v7)
            objc_enumerationMutation(v4);
          v9 = *(void **)(*((_QWORD *)&v15 + 1) + 8 * i);
          objc_msgSend(v9, "valueForKey:", CFSTR("_integerDisplayID"), (_QWORD)v15);
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          v11 = objc_msgSend(v10, "unsignedIntValue");

          if (v11 == a1)
          {
            objc_msgSend(v9, "valueForKey:", CFSTR("scale"));
            v12 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v12, "doubleValue");

            objc_msgSend(v9, "valueForKey:", CFSTR("_rotation"));
            v13 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v13, "doubleValue");

            objc_msgSend((id)_AXUIScreenConvertToCAScreen_mainScreen, "valueForKey:", CFSTR("_unjailedReferenceBoundsInPixels"));
            v14 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v14, "rectValue");

            goto LABEL_15;
          }
        }
        v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
        if (v6)
          continue;
        break;
      }
    }

LABEL_15:
  }
}

uint64_t __getSelfAuditToken_block_invoke()
{
  uint64_t result;

  getSelfAuditToken_auditToken = 0u;
  unk_1ECEBE960 = 0u;
  LODWORD(getSelfAuditToken_auditToken) = geteuid();
  result = getegid();
  DWORD1(getSelfAuditToken_auditToken) = result;
  return result;
}

void *_AXHandleRemoteElementCallthroughForArray(void *a1, const __AXUIElement *a2, unint64_t a3, void *a4)
{
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  _BOOL4 v13;
  uint64_t i;
  const __AXUIElement *v15;
  _BOOL4 v16;
  CFTypeID v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  CFTypeID v22;
  uint64_t v24;
  id obj;
  uint64_t v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  _BYTE v31[128];
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  v27 = 0u;
  v28 = 0u;
  v29 = 0u;
  v30 = 0u;
  obj = a1;
  v7 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v27, v31, 16);
  if (v7)
  {
    v8 = v7;
    v9 = 0;
    v24 = 0;
    v10 = 0;
    v26 = *(_QWORD *)v28;
    v13 = a3 - 92501 < 2 || a3 >> 1 == 47626 || a3 == 95254;
    while (1)
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v28 != v26)
          objc_enumerationMutation(obj);
        v15 = *(const __AXUIElement **)(*((_QWORD *)&v27 + 1) + 8 * i);
        if (v15)
          v16 = v13;
        else
          v16 = 0;
        if (v16)
        {
          v17 = CFGetTypeID(*(CFTypeRef *)(*((_QWORD *)&v27 + 1) + 8 * i));
          if (v17 == AXUIElementGetTypeID() && _AXIsRemoteElement(v15, a2) && v24 + i == objc_msgSend(obj, "count") - 1)
          {
            v18 = objc_msgSend(obj, "count");
            v19 = objc_msgSend(a4, "unsignedIntegerValue");
            objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v19 - v18 + 1);
          }
        }
        v20 = _AXHandleRemoteElementCallthrough(v15);
        if (v20)
        {
          v21 = (void *)v20;
          if (!v10)
            v10 = (void *)objc_msgSend(obj, "mutableCopy");
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
          {
            objc_msgSend(v10, "replaceObjectsInRange:withObjectsFromArray:", v9, 1, v21);
            v9 = v9 + objc_msgSend(v21, "count") - 1;
          }
          else
          {
            objc_msgSend(v10, "replaceObjectAtIndex:withObject:", v9, v21);
          }
          CFRelease(v21);
LABEL_35:
          ++v9;
          continue;
        }
        if (!v15)
          goto LABEL_35;
        v22 = CFGetTypeID(v15);
        if (v22 != AXUIElementGetTypeID() || !_AXIsRemoteElement(v15, a2))
          goto LABEL_35;
        if (!v10)
          v10 = (void *)objc_msgSend(obj, "mutableCopy");
        objc_msgSend(v10, "removeObject:", v15, v24);
      }
      v24 += v8;
      v8 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v27, v31, 16);
      if (!v8)
        goto LABEL_40;
    }
  }
  v10 = 0;
LABEL_40:

  return v10;
}

BOOL _AXIsRemoteElement(const __AXUIElement *a1, const __AXUIElement *a2)
{
  uint64_t v4;
  pid_t v6;
  pid_t pid;

  _AXUIElementIDForElement((uint64_t)a1);
  if (v4 == kAXApplicationUID)
    return 0;
  pid = 0;
  AXUIElementGetPid(a2, &pid);
  v6 = 0;
  AXUIElementGetPid(a1, &v6);
  return v6 != pid;
}

void __portInvalidationCallback_block_invoke(uint64_t a1)
{
  __CFMachPort *Value;
  __CFMachPort *v3;
  mach_port_name_t Port;

  if (gPortCache)
  {
    Value = (__CFMachPort *)CFDictionaryGetValue((CFDictionaryRef)gPortCache, (const void *)*(int *)(a1 + 32));
    if (Value)
    {
      v3 = Value;
      CFRetain(Value);
      CFDictionaryRemoveValue((CFMutableDictionaryRef)gPortCache, (const void *)*(int *)(a1 + 32));
      Port = CFMachPortGetPort(v3);
      if (Port)
        mach_port_deallocate(*MEMORY[0x1E0C83DA0], Port);
      CFRelease(v3);
    }
    else
    {
      CFDictionaryRemoveValue((CFMutableDictionaryRef)gPortCache, (const void *)*(int *)(a1 + 32));
    }
  }
}

void OUTLINED_FUNCTION_0(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 2u);
}

uint64_t AXRequestingClient()
{
  return _CurrentRequestClient;
}

void _AXResetRequestingClient()
{
  _CurrentRequestClient = 0;
}

uint64_t _AXSetRequestingClient(uint64_t result)
{
  _CurrentRequestClient = result;
  return result;
}

uint64_t _AXUIElementSetLastGlobalError(uint64_t result)
{
  _LastGlobalError = result;
  return result;
}

uint64_t AXUIElementLastGlobalError()
{
  return _LastGlobalError;
}

uint64_t AXDoesRequestingClientDeserveAutomation()
{
  if ((unint64_t)_CurrentRequestClient > 0x10 || ((1 << _CurrentRequestClient) & 0x19C38) != 0)
    return 0;
  if (((1 << _CurrentRequestClient) & 0x106) != 0)
    return 1;
  if (_CurrentRequestClient != 7)
    return 0;
  return _AXSAutomationEnabled();
}

BOOL AXRequestingClientSupportsMLElements()
{
  return (unint64_t)(_CurrentRequestClient - 3) < 3;
}

__n128 _AXRuntimeGetCallbacksForUnitTesting@<Q0>(uint64_t a1@<X8>)
{
  __int128 v1;
  __n128 result;

  v1 = *(_OWORD *)&off_1ECEBEB40;
  *(_OWORD *)(a1 + 32) = xmmword_1ECEBEB30;
  *(_OWORD *)(a1 + 48) = v1;
  *(_QWORD *)(a1 + 64) = qword_1ECEBEB50;
  result = (__n128)xmmword_1ECEBEB20;
  *(_OWORD *)a1 = gCallbacks;
  *(__n128 *)(a1 + 16) = result;
  return result;
}

uint64_t AXDisableAccessibilityOnTermination()
{
  const __AXUIElement *SystemWide;
  NSObject *v1;
  uint64_t v2;
  CFRunLoopSourceRef RunLoopSource;
  __CFRunLoopSource *v5;
  __CFRunLoop *Main;
  uint8_t v7[16];

  if (!AXDisableAccessibilityOnTermination_terminationObserver)
  {
    v2 = AXObserverCreate(sSystemWideServerPID, (AXObserverCallback)_terminationEmptyHandler, (AXObserverRef *)&AXDisableAccessibilityOnTermination_terminationObserver);
    if ((_DWORD)v2)
      return v2;
    RunLoopSource = AXObserverGetRunLoopSource((AXObserverRef)AXDisableAccessibilityOnTermination_terminationObserver);
    if (!RunLoopSource)
    {
      CFRelease((CFTypeRef)AXDisableAccessibilityOnTermination_terminationObserver);
      AXDisableAccessibilityOnTermination_terminationObserver = 0;
      return 4294942096;
    }
    v5 = RunLoopSource;
    Main = CFRunLoopGetMain();
    CFRunLoopAddSource(Main, v5, (CFRunLoopMode)*MEMORY[0x1E0C9B280]);
  }
  SystemWide = AXUIElementCreateSystemWide();
  AXRuntimeLogCommon();
  v1 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v1, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v7 = 0;
    _os_log_impl(&dword_1B54A6000, v1, OS_LOG_TYPE_INFO, "Requesting disable AX on termination", v7, 2u);
  }

  v2 = AXObserverAddNotification((AXObserverRef)AXDisableAccessibilityOnTermination_terminationObserver, SystemWide, (CFStringRef)0x270F, 0);
  CFRelease(SystemWide);
  return v2;
}

BOOL _AXShouldDispatchNonMainThreadCallbacksOnMainThread()
{
  return __AXShouldDispatchNonMainThreadCallbacksOnMainThreadStack > 0;
}

void _AXShouldDispatchNonMainThreadCallbacksOnMainThreadPushReason()
{
  ++__AXShouldDispatchNonMainThreadCallbacksOnMainThreadStack;
}

void _AXShouldDispatchNonMainThreadCallbacksOnMainThreadPopReason()
{
  --__AXShouldDispatchNonMainThreadCallbacksOnMainThreadStack;
}

uint64_t _AXUIElementRegisterSystemWideServerWithRunLoop(uint64_t a1, uint64_t a2, __CFRunLoop *a3, int a4)
{
  int v7;
  int *v8;

  v7 = 1;
  if (!a4)
  {
    v8 = &sSystemWideServerPID;
    goto LABEL_5;
  }
  if (a4 == 1)
  {
    v7 = 0;
    v8 = &sSystemWideAppServerPID;
LABEL_5:
    *v8 = getpid();
  }
  return _AXUIElementRegisterServerWithRunLoopInternal(a1, a2, a3, v7);
}

uint64_t _AXUIElementRegisterServerWithRunLoopInternal(uint64_t a1, uint64_t a2, __CFRunLoop *a3, int a4)
{
  uint64_t v4;
  __CFRunLoop *Current;
  ipc_space_t *v9;
  const char *v10;
  kern_return_t MachPort;
  kern_return_t v12;
  NSObject *v13;
  kern_return_t v14;
  kern_return_t v15;
  NSObject *v16;
  NSObject *v17;
  const __CFString *v18;
  __CFRunLoopSource *v19;
  __CFNotificationCenter *DarwinNotifyCenter;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  int v25;
  mach_port_t special_port;

  if ((gRegistered & 1) == 0)
  {
    if (!a1)
      return 4294942095;
    Current = a3;
    if (!a3)
    {
      Current = CFRunLoopGetCurrent();
      if (!Current)
        return 4294942096;
    }
    special_port = 0;
    v9 = (ipc_space_t *)MEMORY[0x1E0C83DA0];
    if (task_get_special_port(*MEMORY[0x1E0C83DA0], 4, &special_port))
      return 4294942096;
    v25 = 0;
    if ((AXRuntimeCheck_SupportsMacAXV2() & 1) != 0 || !_CFMZEnabled())
    {
      if (a4)
        v10 = "com.apple.iphone.axserver-systemwide";
      else
        v10 = "com.apple.iphone.axserver";
      MachPort = _AXUIElementCreateMachPort((mach_port_name_t *)&v25, special_port, (uint64_t)v10);
      if (MachPort)
      {
        v12 = MachPort;
        AXRuntimeLogCommon();
        v13 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
          _AXUIElementRegisterServerWithRunLoopInternal_cold_4(v12, v13);
        v4 = 4294942096;
        goto LABEL_35;
      }
    }
    else
    {
      v25 = 0;
    }
    v14 = _AXUIElementCreateMachPort((mach_port_name_t *)&gAXServerPortForRemoteBridge, special_port, 0);
    if (v14)
    {
      v15 = v14;
      AXRuntimeLogCommon();
      v16 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_FAULT))
        _AXUIElementRegisterServerWithRunLoopInternal_cold_3(v15, v16);

      gAXServerPortForRemoteBridge = 0;
    }
    gRunLoopSource = (uint64_t)MSHCreateMIGServerSource(0, 0, (uint64_t)_AXXMIGAccessibilityDefs_subsystem, 0, v25, 0);
    if (!gRunLoopSource)
      return 4294942096;
    if (gAXServerPortForRemoteBridge)
    {
      gRunLoopSourceForRemoteBridge = (uint64_t)MSHCreateMIGServerSource(0, 0, (uint64_t)_AXXMIGAccessibilityDefs_subsystem, 0, gAXServerPortForRemoteBridge, 0);
      if (!gRunLoopSourceForRemoteBridge)
      {
        AXRuntimeLogCommon();
        v17 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v17, OS_LOG_TYPE_FAULT))
          _AXUIElementRegisterServerWithRunLoopInternal_cold_2(v17);

      }
    }
    mach_port_deallocate(*v9, special_port);
    v18 = (const __CFString *)*MEMORY[0x1E0C9B270];
    CFRunLoopAddSource(Current, (CFRunLoopSourceRef)gRunLoopSource, (CFRunLoopMode)*MEMORY[0x1E0C9B270]);
    if (gRunLoopSourceForRemoteBridge)
      CFRunLoopAddSource(Current, (CFRunLoopSourceRef)gRunLoopSourceForRemoteBridge, v18);
    v19 = MSHCreateMachServerSource(0, 0, (uint64_t)axObserverDeadNameHandler, 0, 0, 0);
    sDeadNameSource = (uint64_t)v19;
    if (!v19)
      return 4294942096;
    sDeadNamePort = MSHGetMachPortFromSource(v19);
    CFRunLoopAddSource(Current, (CFRunLoopSourceRef)sDeadNameSource, v18);
    DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
    CFNotificationCenterAddObserver(DarwinNotifyCenter, (const void *)1, (CFNotificationCallback)apiNotifyCallback, CFSTR("com.apple.accessibility.api"), 0, CFNotificationSuspensionBehaviorCoalesce);
    gUserData = a2;
    *(_OWORD *)&gCallbacks = *(_OWORD *)a1;
    v22 = *(_OWORD *)(a1 + 32);
    v21 = *(_OWORD *)(a1 + 48);
    v23 = *(_OWORD *)(a1 + 16);
    qword_1ECEBEB50 = *(_QWORD *)(a1 + 64);
    *(_OWORD *)&xmmword_1ECEBEB30 = v22;
    *(_OWORD *)&off_1ECEBEB40 = v21;
    *(_OWORD *)&xmmword_1ECEBEB20 = v23;
    gRegistered = 1;
    gAXAccessibilityTurnedOnOnce = 1;
    gIsAPIOn = AXAPIEnabled();
    AXRuntimeLogCommon();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
      _AXUIElementRegisterServerWithRunLoopInternal_cold_1(v13);
    v4 = 0;
LABEL_35:

    return v4;
  }
  return 4294942092;
}

uint64_t _AXUIElementRegisterServerWithRunLoop(uint64_t a1, uint64_t a2, __CFRunLoop *a3)
{
  return _AXUIElementRegisterServerWithRunLoopInternal(a1, a2, a3, 0);
}

void AXUncaughtException(void *a1)
{
  id v1;
  id v2;

  v1 = a1;
  NSLog((NSString *)CFSTR("AX Crash: %@"), v1);
  objc_msgSend(v1, "callStackSymbols");
  v2 = (id)objc_claimAutoreleasedReturnValue();

  NSLog((NSString *)CFSTR("Backtrace: %@"), v2);
}

uint64_t _AXUIElementServerRegistered()
{
  return gRegistered;
}

uint64_t _AXUIElementRegisterNotificationBypassCallback(void *a1)
{
  gNotificationBypassCallback = a1;
  return 0;
}

uint64_t _AXUIElementRegisterSystemWideServerBroadcastRelayerCallback(void *a1, uint64_t a2)
{
  uint64_t result;

  if ((gBroadcasterRegistered & 1) != 0)
    return 4294942092;
  result = 0;
  gSystemWideServerBroadcastRelayerCallback = a1;
  gSystemWideServerBroadcastRelayerCallbackInfo = a2;
  gBroadcasterRegistered = 1;
  return result;
}

uint64_t _AXUIElementRegisterAppAXReadyCallback(const void *a1)
{
  void *v1;
  void *v2;

  v1 = _Block_copy(a1);
  v2 = (void *)gAppAXReadyCallback;
  gAppAXReadyCallback = (uint64_t)v1;

  return 0;
}

void *_AXUIElementGetAppAXReadyCallback()
{
  return _Block_copy((const void *)gAppAXReadyCallback);
}

uint64_t _AXUIElementRemoteBridgeMachPortForAXServer()
{
  return gAXServerPortForRemoteBridge;
}

uint64_t _AXUIElementUnregisterServer()
{
  __CFNotificationCenter *DarwinNotifyCenter;
  uint64_t result;

  if (gRegistered != 1)
    return 4294942092;
  if (gRunLoopSource)
  {
    CFRunLoopSourceInvalidate((CFRunLoopSourceRef)gRunLoopSource);
    CFRelease((CFTypeRef)gRunLoopSource);
    gRunLoopSource = 0;
  }
  if (gRunLoopSourceForRemoteBridge)
  {
    CFRunLoopSourceInvalidate((CFRunLoopSourceRef)gRunLoopSourceForRemoteBridge);
    CFRelease((CFTypeRef)gRunLoopSourceForRemoteBridge);
    gRunLoopSourceForRemoteBridge = 0;
  }
  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterRemoveObserver(DarwinNotifyCenter, (const void *)1, CFSTR("com.apple.accessibility.api"), 0);
  gUserData = 0;
  *(_OWORD *)&gCallbacks = 0u;
  *(_OWORD *)&xmmword_1ECEBEB20 = 0u;
  *(_OWORD *)&xmmword_1ECEBEB30 = 0u;
  *(_OWORD *)&off_1ECEBEB40 = 0u;
  qword_1ECEBEB50 = 0;
  gRegistered = 0;
  gBroadcasterRegistered = 0;
  gAXServerPortForRemoteBridge = 0;
  if (sDeadNameSource)
  {
    CFRunLoopSourceInvalidate((CFRunLoopSourceRef)sDeadNameSource);
    CFRelease((CFTypeRef)sDeadNameSource);
    sDeadNameSource = 0;
    sDeadNamePort = 0;
  }
  result = 0;
  gSystemWideServerBroadcastRelayerCallback = 0;
  gSystemWideServerBroadcastRelayerCallbackInfo = 0;
  return result;
}

uint64_t _AXUIElementIDForElement(uint64_t result)
{
  if (result)
    return *(_QWORD *)(result + 20);
  return result;
}

uint64_t _AXUIElementCreateWithID(uint64_t a1, uint64_t a2)
{
  pid_t v4;

  v4 = getpid();
  return _AXUIElementCreateInternal(v4, a1, a2);
}

const __CFData *_AXUIElementCreateWithData(const __CFData *result)
{
  const __CFData *v1;
  UInt8 v2[8];
  uint64_t v3;
  UInt8 buffer[4];
  CFRange v5;
  CFRange v6;
  CFRange v7;

  if (result)
  {
    v1 = result;
    *(_DWORD *)buffer = 0;
    *(_QWORD *)v2 = 0;
    v3 = 0;
    v5.location = 0;
    v5.length = 4;
    CFDataGetBytes(result, v5, buffer);
    v6.location = 4;
    v6.length = 8;
    CFDataGetBytes(v1, v6, v2);
    v7.location = 12;
    v7.length = 8;
    CFDataGetBytes(v1, v7, (UInt8 *)&v3);
    return (const __CFData *)_AXUIElementCreateInternal(*(int *)buffer, *(uint64_t *)v2, v3);
  }
  return result;
}

__CFData *_AXUIElementCreateData(const UInt8 *a1)
{
  __CFData *Mutable;

  Mutable = CFDataCreateMutable((CFAllocatorRef)*MEMORY[0x1E0C9AE00], 0);
  CFDataAppendBytes(Mutable, a1 + 16, 4);
  CFDataAppendBytes(Mutable, a1 + 20, 8);
  CFDataAppendBytes(Mutable, a1 + 28, 8);
  return Mutable;
}

uint64_t _AXXMIGCopyAttributeValue(int a1, uint64_t a2, uint64_t a3, uint64_t a4, int a5, uint64_t a6, void *a7, _DWORD *a8, void **a9, _DWORD *a10, int *a11, __int128 *a12)
{
  __int128 v18;
  uint64_t *v19;
  int v20;
  const void *v21;
  uint64_t v22;
  int v23;
  _QWORD v25[6];
  int v26;
  uint64_t v27;
  uint64_t v28;
  __int128 v29[2];
  uint64_t v30;
  uint64_t *v31;
  uint64_t v32;
  int v33;
  uint64_t v34;
  uint64_t *v35;
  uint64_t v36;
  uint64_t v37;

  v34 = 0;
  v35 = &v34;
  v36 = 0x2020000000;
  v37 = 0;
  v30 = 0;
  v31 = &v30;
  v32 = 0x2020000000;
  v33 = 0;
  *a8 = 0;
  *a9 = 0;
  *a10 = 0;
  _CurrentRequestClient = a6;
  v18 = a12[1];
  v29[0] = *a12;
  v29[1] = v18;
  if (!_isAXAllowed(v29))
  {
    v19 = v31;
    v20 = -25211;
    goto LABEL_20;
  }
  if (gAXServerPortForRemoteBridge == a1)
  {
    if (a5 <= 2999)
    {
      if (a5 != 2021 && a5 != 2076)
      {
LABEL_19:
        v19 = v31;
        v20 = -25217;
        goto LABEL_20;
      }
    }
    else if (((unint64_t)(a5 - 3000) > 0x10 || ((1 << (a5 + 72)) & 0x10005) == 0)
           && a5 != 5002)
    {
      goto LABEL_19;
    }
  }
  if (!gCallbacks)
  {
    v19 = v31;
    v20 = -25208;
    goto LABEL_20;
  }
  v25[0] = MEMORY[0x1E0C809B0];
  v25[1] = 3221225472;
  v25[2] = ___AXXMIGCopyAttributeValue_block_invoke;
  v25[3] = &unk_1E6918EC8;
  v27 = a3;
  v28 = a4;
  v26 = a5;
  v25[4] = &v30;
  v25[5] = &v34;
  _handleNonMainThreadCallback(v25);
  v19 = v31;
  v20 = *((_DWORD *)v31 + 6);
  if (!v20
    || (v21 = (const void *)v35[3]) != 0
    && (CFRelease(v21), v35[3] = 0, v19 = v31, (v20 = *((_DWORD *)v31 + 6)) == 0))
  {
    v22 = v35[3];
    if (v22)
    {
      v23 = AXSerializeWrapper(v22, 0, a7, a8, a9, a10);
      *((_DWORD *)v31 + 6) = v23;
      CFRelease((CFTypeRef)v35[3]);
      v20 = *((_DWORD *)v31 + 6);
      goto LABEL_21;
    }
    v20 = -25212;
LABEL_20:
    *((_DWORD *)v19 + 6) = v20;
  }
LABEL_21:
  *a11 = v20;
  _CurrentRequestClient = 0;
  _Block_object_dispose(&v30, 8);
  _Block_object_dispose(&v34, 8);
  return 0;
}

void sub_1B54B36F8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, ...)
{
  uint64_t v15;
  va_list va;

  va_start(va, a15);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v15 - 112), 8);
  _Unwind_Resume(a1);
}

uint64_t _isAXAllowed(__int128 *a1)
{
  __int128 v1;
  __int128 v2;
  __int128 v4;
  __int128 v5;
  __int128 v6;
  __int128 v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  if (!gIsAPIOn)
    return 0;
  v1 = a1[1];
  v6 = *a1;
  v7 = v1;
  v2 = a1[1];
  v4 = *a1;
  v5 = v2;
  if ((__hasEntitlementForAuditToken(CFSTR("com.apple.accessibility.api"), (const UInt8 *)&v4) & 1) != 0)
    return 1;
  v4 = v6;
  v5 = v7;
  return __hasEntitlementForAuditToken(CFSTR("com.apple.accessibility.SpringBoard"), (const UInt8 *)&v4);
}

void _handleNonMainThreadCallback(void *a1)
{
  void (**v1)(_QWORD);
  void *v2;
  dispatch_semaphore_t v3;
  NSObject *v4;
  _QWORD v5[4];
  dispatch_semaphore_t v6;
  void (**v7)(_QWORD);

  v1 = a1;
  if ((objc_msgSend(MEMORY[0x1E0CB3978], "isMainThread") & 1) != 0)
  {
    v1[2](v1);
  }
  else
  {
    if (__AXShouldDispatchNonMainThreadCallbacksOnMainThreadStack <= 0 && !_AXSInUnitTestMode())
    {
      objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", CFSTR("AXRuntime Thread Error"), CFSTR("We're calling into AX runtime off the main thread!"), 0);
      v2 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v2, "raise");

    }
    v3 = dispatch_semaphore_create(0);
    v5[0] = MEMORY[0x1E0C809B0];
    v5[1] = 3221225472;
    v5[2] = ___handleNonMainThreadCallback_block_invoke;
    v5[3] = &unk_1E6918FB0;
    v6 = v3;
    v7 = v1;
    v4 = v3;
    dispatch_async(MEMORY[0x1E0C80D38], v5);
    dispatch_semaphore_wait(v4, 0xFFFFFFFFFFFFFFFFLL);

  }
}

uint64_t _AXXMIGCopyMultipleAttributeValues(int a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, unsigned int a6, void *a7, unsigned int a8, int a9, uint64_t a10, void *a11, _DWORD *a12, void **a13, _DWORD *a14, _DWORD *a15, __int128 *a16)
{
  __int128 v23;
  uint64_t *v24;
  int v25;
  int v26;
  uint64_t v27;
  uint64_t *v29;
  const void *v30;
  uint64_t v31;
  int v32;
  const void *v33;
  _QWORD v34[7];
  int v35;
  uint64_t v36;
  uint64_t v37;
  CFTypeRef cf;
  __int128 v39;
  __int128 v40;
  uint64_t v41;
  uint64_t *v42;
  uint64_t v43;
  int v44;

  v41 = 0;
  v42 = &v41;
  v43 = 0x2020000000;
  v44 = 0;
  _CurrentRequestClient = a10;
  *a12 = 0;
  *a13 = 0;
  *a14 = 0;
  v23 = a16[1];
  v39 = *a16;
  v40 = v23;
  if (!_isAXAllowed(&v39))
  {
    v24 = v42;
    v25 = -25211;
    goto LABEL_9;
  }
  if (gAXServerPortForRemoteBridge == a1)
  {
    v24 = v42;
    v25 = -25217;
    goto LABEL_9;
  }
  if (!off_1ECEBEB40)
  {
    v24 = v42;
    v25 = -25208;
LABEL_9:
    *((_DWORD *)v24 + 6) = v25;
    if (!a7)
      goto LABEL_12;
    goto LABEL_10;
  }
  cf = 0;
  *(_QWORD *)&v39 = 0;
  *((_QWORD *)&v39 + 1) = &v39;
  v40 = 0x2020000000uLL;
  v26 = AXUnserializeWrapper(a5, a6, (uint64_t)a7, a8, (uint64_t)&cf);
  *((_DWORD *)v42 + 6) = v26;
  if (v26)
  {
    v27 = *((_QWORD *)&v39 + 1);
  }
  else
  {
    v34[0] = MEMORY[0x1E0C809B0];
    v34[1] = 3221225472;
    v34[2] = ___AXXMIGCopyMultipleAttributeValues_block_invoke;
    v34[3] = &unk_1E6918EF0;
    v36 = a3;
    v37 = a4;
    v35 = a9;
    v34[4] = &v41;
    v34[5] = &v39;
    v34[6] = cf;
    _handleNonMainThreadCallback(v34);
    CFRelease(cf);
    v29 = v42;
    v27 = *((_QWORD *)&v39 + 1);
    if (!*((_DWORD *)v42 + 6))
    {
LABEL_16:
      v31 = *(_QWORD *)(v27 + 24);
      if (v31)
      {
        v32 = AXSerializeWrapper(v31, 0, a11, a12, a13, a14);
        *((_DWORD *)v42 + 6) = v32;
        v27 = *((_QWORD *)&v39 + 1);
      }
      else
      {
        *((_DWORD *)v29 + 6) = -25200;
      }
      goto LABEL_19;
    }
  }
  v30 = *(const void **)(v27 + 24);
  if (v30)
  {
    CFRelease(v30);
    v27 = *((_QWORD *)&v39 + 1);
    *(_QWORD *)(*((_QWORD *)&v39 + 1) + 24) = 0;
    v29 = v42;
    if (!*((_DWORD *)v42 + 6))
      goto LABEL_16;
  }
LABEL_19:
  v33 = *(const void **)(v27 + 24);
  if (v33)
    CFRelease(v33);
  _Block_object_dispose(&v39, 8);
  if (a7)
  {
LABEL_10:
    if (a8)
      munmap(a7, a8);
  }
LABEL_12:
  *a15 = *((_DWORD *)v42 + 6);
  _CurrentRequestClient = 0;
  _Block_object_dispose(&v41, 8);
  return 0;
}

void sub_1B54B3B74(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,char a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,char a26)
{
  _Block_object_dispose(&a21, 8);
  _Block_object_dispose(&a26, 8);
  _Unwind_Resume(a1);
}

uint64_t _AXXMIGCopyParameterizedAttributeValue(int a1, uint64_t a2, uint64_t a3, uint64_t a4, int a5, uint64_t a6, unsigned int a7, void *a8, unsigned int a9, uint64_t a10, void *a11, _DWORD *a12, void **a13, _DWORD *a14, int *a15, __int128 *a16)
{
  __int128 v22;
  uint64_t *v23;
  int v24;
  uint64_t *v25;
  const void *v26;
  uint64_t v27;
  int v28;
  _QWORD v31[7];
  int v32;
  uint64_t v33;
  uint64_t v34;
  CFTypeRef cf;
  __int128 v36;
  __int128 v37;
  uint64_t v38;
  uint64_t *v39;
  uint64_t v40;
  int v41;

  v38 = 0;
  v39 = &v38;
  v40 = 0x2020000000;
  v41 = 0;
  _CurrentRequestClient = a10;
  *a12 = 0;
  *a13 = 0;
  *a14 = 0;
  if ((a5 - 91503) > 5 || a5 == 91505 || !gIsAPIOn)
  {
    v22 = a16[1];
    v36 = *a16;
    v37 = v22;
    if (!_isAXAllowed(&v36))
    {
      v23 = v39;
      v24 = -25211;
      goto LABEL_16;
    }
  }
  if (gAXServerPortForRemoteBridge == a1)
  {
    v23 = v39;
    v24 = -25217;
LABEL_16:
    *((_DWORD *)v23 + 6) = v24;
    goto LABEL_17;
  }
  if (!*(&xmmword_1ECEBEB30 + 1))
  {
    v23 = v39;
    v24 = -25208;
    goto LABEL_16;
  }
  cf = 0;
  v24 = AXUnserializeWrapper(a6, a7, (uint64_t)a8, a9, (uint64_t)&cf);
  *((_DWORD *)v39 + 6) = v24;
  if (!v24)
  {
    *(_QWORD *)&v36 = 0;
    *((_QWORD *)&v36 + 1) = &v36;
    v37 = 0x2020000000uLL;
    v31[0] = MEMORY[0x1E0C809B0];
    v31[1] = 3221225472;
    v31[2] = ___AXXMIGCopyParameterizedAttributeValue_block_invoke;
    v31[3] = &unk_1E6918EF0;
    v33 = a3;
    v34 = a4;
    v32 = a5;
    v31[5] = &v36;
    v31[6] = cf;
    v31[4] = &v38;
    _handleNonMainThreadCallback(v31);
    v25 = v39;
    if (!*((_DWORD *)v39 + 6)
      || (v26 = *(const void **)(*((_QWORD *)&v36 + 1) + 24)) != 0
      && (CFRelease(v26), *(_QWORD *)(*((_QWORD *)&v36 + 1) + 24) = 0, v25 = v39, !*((_DWORD *)v39 + 6)))
    {
      v27 = *(_QWORD *)(*((_QWORD *)&v36 + 1) + 24);
      if (v27)
      {
        v28 = AXSerializeWrapper(v27, 0, a11, a12, a13, a14);
        *((_DWORD *)v39 + 6) = v28;
        CFRelease(*(CFTypeRef *)(*((_QWORD *)&v36 + 1) + 24));
      }
      else
      {
        *((_DWORD *)v25 + 6) = -25212;
      }
    }
    CFRelease(cf);
    _Block_object_dispose(&v36, 8);
    v24 = *((_DWORD *)v39 + 6);
  }
LABEL_17:
  *a15 = v24;
  if (a8 && a9)
    munmap(a8, a9);
  _CurrentRequestClient = 0;
  _Block_object_dispose(&v38, 8);
  return 0;
}

void sub_1B54B3E68(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,char a26)
{
  _Block_object_dispose(&a26, 8);
  _Unwind_Resume(a1);
}

uint64_t _AXXMIGSetAttributeValue(int a1, uint64_t a2, uint64_t a3, uint64_t a4, int a5, uint64_t a6, unsigned int a7, void *a8, unsigned int a9, uint64_t a10, int *a11, __int128 *a12)
{
  __int128 v19;
  uint64_t *v20;
  int v21;
  int v22;
  _QWORD v24[6];
  int v25;
  uint64_t v26;
  uint64_t v27;
  __int128 v28;
  __int128 v29;
  uint64_t v30;
  uint64_t *v31;
  uint64_t v32;
  int v33;

  v30 = 0;
  v31 = &v30;
  v32 = 0x2020000000;
  v33 = 0;
  _CurrentRequestClient = a10;
  v19 = a12[1];
  v28 = *a12;
  v29 = v19;
  if (!_isAXAllowed(&v28))
  {
    v20 = v31;
    v21 = -25211;
    goto LABEL_10;
  }
  if (gAXServerPortForRemoteBridge == a1)
  {
    v20 = v31;
    v21 = -25217;
LABEL_10:
    *((_DWORD *)v20 + 6) = v21;
    goto LABEL_11;
  }
  if (!*(&gCallbacks + 1))
  {
    v20 = v31;
    v21 = -25208;
    goto LABEL_10;
  }
  *(_QWORD *)&v28 = 0;
  *((_QWORD *)&v28 + 1) = &v28;
  v29 = 0x2020000000uLL;
  v22 = AXUnserializeWrapper(a6, a7, (uint64_t)a8, a9, (uint64_t)&v29 + 8);
  *((_DWORD *)v31 + 6) = v22;
  if (!v22)
  {
    v24[0] = MEMORY[0x1E0C809B0];
    v24[1] = 3221225472;
    v24[2] = ___AXXMIGSetAttributeValue_block_invoke;
    v24[3] = &unk_1E6918EC8;
    v26 = a3;
    v27 = a4;
    v25 = a5;
    v24[4] = &v30;
    v24[5] = &v28;
    _handleNonMainThreadCallback(v24);
    CFRelease(*(CFTypeRef *)(*((_QWORD *)&v28 + 1) + 24));
  }
  _Block_object_dispose(&v28, 8);
  v21 = *((_DWORD *)v31 + 6);
LABEL_11:
  *a11 = v21;
  if (a8 && a9)
    munmap(a8, a9);
  _CurrentRequestClient = 0;
  _Block_object_dispose(&v30, 8);
  return 0;
}

void sub_1B54B40A4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  uint64_t v12;
  va_list va;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  va_list va1;

  va_start(va1, a11);
  va_start(va, a11);
  v12 = va_arg(va1, _QWORD);
  v14 = va_arg(va1, _QWORD);
  v15 = va_arg(va1, _QWORD);
  v16 = va_arg(va1, _QWORD);
  _Block_object_dispose(va, 8);
  _Block_object_dispose(va1, 8);
  _Unwind_Resume(a1);
}

uint64_t _AXXMIGPerformAction(int a1, uint64_t a2, uint64_t a3, uint64_t a4, int a5, uint64_t a6, int *a7, __int128 *a8)
{
  __int128 v13;
  uint64_t *v14;
  int v15;
  _QWORD v17[5];
  int v18;
  uint64_t v19;
  uint64_t v20;
  __int128 v21[2];
  uint64_t v22;
  uint64_t *v23;
  uint64_t v24;
  int v25;

  v22 = 0;
  v23 = &v22;
  v24 = 0x2020000000;
  v25 = 0;
  _CurrentRequestClient = a6;
  v13 = a8[1];
  v21[0] = *a8;
  v21[1] = v13;
  if (!_isAXAllowed(v21))
  {
    v14 = v23;
    v15 = -25211;
    goto LABEL_9;
  }
  if (a5 != 2024 && gAXServerPortForRemoteBridge == a1)
  {
    v14 = v23;
    v15 = -25217;
LABEL_9:
    *((_DWORD *)v14 + 6) = v15;
    goto LABEL_10;
  }
  if (!xmmword_1ECEBEB20)
  {
    v14 = v23;
    v15 = -25208;
    goto LABEL_9;
  }
  v17[0] = MEMORY[0x1E0C809B0];
  v17[1] = 3221225472;
  v17[2] = ___AXXMIGPerformAction_block_invoke;
  v17[3] = &unk_1E6918F18;
  v17[4] = &v22;
  v19 = a3;
  v20 = a4;
  v18 = a5;
  _handleNonMainThreadCallback(v17);
  v15 = *((_DWORD *)v23 + 6);
LABEL_10:
  *a7 = v15;
  _CurrentRequestClient = 0;
  _Block_object_dispose(&v22, 8);
  return 0;
}

void sub_1B54B4254(_Unwind_Exception *a1)
{
  uint64_t v1;

  _Block_object_dispose((const void *)(v1 - 80), 8);
  _Unwind_Resume(a1);
}

uint64_t _AXXMIGPerformActionWithValue(int a1, mach_port_name_t a2, uint64_t a3, uint64_t a4, uint64_t a5, int a6, uint64_t a7, unsigned int a8, void *a9, unsigned int a10, uint64_t a11, int *a12, __int128 *a13)
{
  __int128 v20;
  uint64_t *v21;
  int v22;
  int v23;
  const void *v24;
  const void *v25;
  uint64_t v26;
  _QWORD v28[6];
  int v29;
  mach_port_name_t v30;
  uint64_t v31;
  uint64_t v32;
  __int128 v33;
  __int128 v34;
  uint64_t v35;
  uint64_t *v36;
  uint64_t v37;
  int v38;

  v35 = 0;
  v36 = &v35;
  v37 = 0x2020000000;
  v38 = 0;
  _CurrentRequestClient = a11;
  v20 = a13[1];
  v33 = *a13;
  v34 = v20;
  if (!_isAXAllowed(&v33))
  {
    v21 = v36;
    v22 = -25211;
    goto LABEL_15;
  }
  if (a6 != 2024 && gAXServerPortForRemoteBridge == a1)
  {
    v21 = v36;
    v22 = -25217;
LABEL_15:
    *((_DWORD *)v21 + 6) = v22;
    goto LABEL_16;
  }
  if (!xmmword_1ECEBEB20)
  {
    v21 = v36;
    v22 = -25208;
    goto LABEL_15;
  }
  *(_QWORD *)&v33 = 0;
  *((_QWORD *)&v33 + 1) = &v33;
  v34 = 0x2020000000uLL;
  v23 = AXUnserializeWrapper(a7, a8, (uint64_t)a9, a10, (uint64_t)&v34 + 8);
  *((_DWORD *)v36 + 6) = v23;
  v24 = *(const void **)(*((_QWORD *)&v33 + 1) + 24);
  if (v24 && CFEqual((CFTypeRef)*MEMORY[0x1E0C9B0D0], v24))
  {
    CFRelease(*(CFTypeRef *)(*((_QWORD *)&v33 + 1) + 24));
    *(_QWORD *)(*((_QWORD *)&v33 + 1) + 24) = 0;
  }
  if (!*((_DWORD *)v36 + 6))
  {
    v28[0] = MEMORY[0x1E0C809B0];
    v28[1] = 3221225472;
    v28[2] = ___AXXMIGPerformActionWithValue_block_invoke;
    v28[3] = &unk_1E6918F40;
    v31 = a4;
    v32 = a5;
    v28[4] = &v35;
    v28[5] = &v33;
    v29 = a6;
    v30 = a2;
    _handleNonMainThreadCallback(v28);
    v25 = *(const void **)(*((_QWORD *)&v33 + 1) + 24);
    if (v25)
      CFRelease(v25);
  }
  _Block_object_dispose(&v33, 8);
  v22 = *((_DWORD *)v36 + 6);
LABEL_16:
  *a12 = v22;
  if (a9 && a10)
    munmap(a9, a10);
  if (a2)
    mach_port_deallocate(*MEMORY[0x1E0C83DA0], a2);
  _CurrentRequestClient = 0;
  v26 = *((unsigned int *)v36 + 6);
  _Block_object_dispose(&v35, 8);
  return v26;
}

void sub_1B54B44D8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  uint64_t v12;
  va_list va;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  va_list va1;

  va_start(va1, a11);
  va_start(va, a11);
  v12 = va_arg(va1, _QWORD);
  v14 = va_arg(va1, _QWORD);
  v15 = va_arg(va1, _QWORD);
  v16 = va_arg(va1, _QWORD);
  v17 = va_arg(va1, _QWORD);
  _Block_object_dispose(va, 8);
  _Block_object_dispose(va1, 8);
  _Unwind_Resume(a1);
}

uint64_t _AXXMIGCopyElementAtPosition(float a1, float a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, __int16 a7, int a8, uint64_t a9, _DWORD *a10, _OWORD *a11, _BYTE *a12, _DWORD *a13, int *a14, __int128 *a15)
{
  __int128 v22;
  uint64_t v23;
  NSObject *v24;
  uint64_t *v25;
  int v26;
  __int128 v28;
  int v29;
  BOOL v30;
  _QWORD v31[6];
  float v32;
  float v33;
  int v34;
  __int16 v35;
  uint64_t v36;
  uint64_t v37;
  __int128 v38;
  __int128 v39;
  uint64_t v40;
  uint64_t *v41;
  uint64_t v42;
  int v43;

  v40 = 0;
  v41 = &v40;
  v42 = 0x2020000000;
  v43 = 0;
  _CurrentRequestClient = a9;
  *a12 = 0;
  *a13 = 0;
  v22 = a15[1];
  v38 = *a15;
  v39 = v22;
  if (!_isAXAllowed(&v38))
  {
    AXLogCommon();
    v24 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
      _AXXMIGCopyElementAtPosition_cold_1(v24);

    v25 = v41;
    v26 = -25211;
    goto LABEL_10;
  }
  if (!xmmword_1ECEBEB30)
  {
    v25 = v41;
    v26 = -25208;
LABEL_10:
    *((_DWORD *)v25 + 6) = v26;
    goto LABEL_13;
  }
  *(_QWORD *)&v38 = 0;
  *((_QWORD *)&v38 + 1) = &v38;
  v39 = 0x2020000000uLL;
  v31[0] = MEMORY[0x1E0C809B0];
  v31[1] = 3221225472;
  v31[2] = ___AXXMIGCopyElementAtPosition_block_invoke;
  v31[3] = &unk_1E6918F68;
  v36 = a5;
  v37 = a6;
  v32 = a1;
  v33 = a2;
  v35 = a7;
  v34 = a8;
  v31[4] = &v40;
  v31[5] = &v38;
  _handleNonMainThreadCallback(v31);
  if (!*((_DWORD *)v41 + 6))
  {
    v23 = *(_QWORD *)(*((_QWORD *)&v38 + 1) + 24);
    if (v23)
    {
      v30 = 0;
      v29 = 0;
      v28 = 0uLL;
      *a10 = _AXUIElementValidate(v23, &v30, &v28, &v29);
      *a11 = v28;
      CFRelease(*(CFTypeRef *)(*((_QWORD *)&v38 + 1) + 24));
    }
    else
    {
      *((_DWORD *)v41 + 6) = -25212;
    }
  }
  _Block_object_dispose(&v38, 8);
  v26 = *((_DWORD *)v41 + 6);
LABEL_13:
  *a14 = v26;
  _CurrentRequestClient = 0;
  _Block_object_dispose(&v40, 8);
  return 0;
}

void sub_1B54B4740(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, ...)
{
  uint64_t v15;
  va_list va;

  va_start(va, a15);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v15 - 128), 8);
  _Unwind_Resume(a1);
}

uint64_t _AXXMIGAddNotification(int a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, mach_port_name_t a6, int a7, uint64_t a8, int *a9, _OWORD *a10)
{
  __int128 v14;
  int v15;
  int v16;
  ipc_space_t *v17;
  kern_return_t v18;
  int v19;
  const void *v20;
  mach_port_name_t name[4];
  __int128 v23;

  v14 = a10[1];
  *(_OWORD *)name = *a10;
  v23 = v14;
  if (!_isAXAllowed((__int128 *)name))
  {
    v15 = -25211;
    goto LABEL_5;
  }
  if (gAXServerPortForRemoteBridge == a1)
  {
    v15 = -25217;
LABEL_5:
    v16 = 1;
    goto LABEL_15;
  }
  if (a7)
  {
    name[0] = 0;
    v17 = (ipc_space_t *)MEMORY[0x1E0C83DA0];
    v18 = mach_port_request_notification(*MEMORY[0x1E0C83DA0], a6, 72, 0, sDeadNamePort, 0x15u, name);
    if (name[0])
      mach_port_deallocate(*v17, name[0]);
    v16 = 0;
    if (v18)
    {
      v15 = -25200;
      goto LABEL_15;
    }
  }
  else
  {
    v16 = 1;
  }
  v19 = _AXPidFromAuditToken((uint64_t)a10);
  v20 = (const void *)_AXObserverCookieCreate(a6, a8, v19, 0);
  _AXAddNotificationObserver();
  if (v20)
    CFRelease(v20);
  v15 = 0;
LABEL_15:
  *a9 = v15;
  if (v15 | v16)
    mach_port_mod_refs(*MEMORY[0x1E0C83DA0], a6, 0, -1);
  return 0;
}

uint64_t _AXObserverCookieCreate(mach_port_name_t a1, uint64_t a2, int a3, int a4)
{
  uint64_t Instance;
  ipc_space_t *v9;
  kern_return_t v10;

  if (!__kAXObserverCookieTypeID)
    __kAXObserverCookieTypeID = _CFRuntimeRegisterClass();
  Instance = _CFRuntimeCreateInstance();
  if (Instance)
  {
    if (a1)
    {
      v9 = (ipc_space_t *)MEMORY[0x1E0C83DA0];
      v10 = mach_port_mod_refs(*MEMORY[0x1E0C83DA0], a1, 0, 1);
      if (!v10)
      {
        *(_DWORD *)(Instance + 16) = a1;
        if (!a4)
          goto LABEL_10;
        goto LABEL_9;
      }
      if (v10 == 17)
        mach_port_mod_refs(*v9, a1, 4u, 1);
    }
    if (!a4)
    {
LABEL_10:
      *(_QWORD *)(Instance + 24) = a2;
      *(_DWORD *)(Instance + 32) = a3;
      return Instance;
    }
LABEL_9:
    *(_DWORD *)(Instance + 20) = a1;
    goto LABEL_10;
  }
  return Instance;
}

uint64_t _AXXMIGRemoveNotification(int a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, mach_port_name_t a6, int *a7, __int128 *a8)
{
  __int128 v12;
  int v13;
  int v14;
  const void *v15;
  __int128 v17[2];

  v12 = a8[1];
  v17[0] = *a8;
  v17[1] = v12;
  if (_isAXAllowed(v17))
  {
    if (gAXServerPortForRemoteBridge == a1)
    {
      v13 = -25217;
    }
    else
    {
      v14 = _AXPidFromAuditToken((uint64_t)a8);
      v15 = (const void *)_AXObserverCookieCreate(a6, 0, v14, 0);
      _AXRemoveNotificationObserver();
      if (v15)
        CFRelease(v15);
      v13 = 0;
    }
  }
  else
  {
    v13 = -25211;
  }
  *a7 = v13;
  mach_port_mod_refs(*MEMORY[0x1E0C83DA0], a6, 0, -1);
  return 0;
}

uint64_t _AXTraitsRemoveTrait(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  if ((a2 & ~a1) != 0)
    v2 = 0;
  else
    v2 = a2;
  return v2 ^ a1;
}

uint64_t _AXTraitsAsString()
{
  return 0;
}

__CFString *_AXTraitsAsStringInternal(uint64_t a1)
{
  const __CFAllocator *v2;
  __CFArray *Mutable;
  __CFArray *v4;
  __CFString *v5;
  CFIndex Count;
  CFIndex v7;
  CFIndex v8;
  CFIndex i;
  const __CFString *ValueAtIndex;

  v2 = (const __CFAllocator *)*MEMORY[0x1E0C9AE00];
  Mutable = CFArrayCreateMutable((CFAllocatorRef)*MEMORY[0x1E0C9AE00], 0, MEMORY[0x1E0C9B378]);
  v4 = Mutable;
  if ((a1 & 1) != 0)
  {
    CFArrayAppendValue(Mutable, CFSTR("button"));
    if ((a1 & 2) == 0)
    {
LABEL_3:
      if ((a1 & 0x100000000) == 0)
        goto LABEL_4;
      goto LABEL_66;
    }
  }
  else if ((a1 & 2) == 0)
  {
    goto LABEL_3;
  }
  CFArrayAppendValue(v4, CFSTR("link"));
  if ((a1 & 0x100000000) == 0)
  {
LABEL_4:
    if ((a1 & 4) == 0)
      goto LABEL_5;
    goto LABEL_67;
  }
LABEL_66:
  CFArrayAppendValue(v4, CFSTR("visited"));
  if ((a1 & 4) == 0)
  {
LABEL_5:
    if ((a1 & 8) == 0)
      goto LABEL_6;
    goto LABEL_68;
  }
LABEL_67:
  CFArrayAppendValue(v4, CFSTR("image"));
  if ((a1 & 8) == 0)
  {
LABEL_6:
    if ((a1 & 0x10) == 0)
      goto LABEL_7;
    goto LABEL_69;
  }
LABEL_68:
  CFArrayAppendValue(v4, CFSTR("selected"));
  if ((a1 & 0x10) == 0)
  {
LABEL_7:
    if ((a1 & 0x20) == 0)
      goto LABEL_8;
    goto LABEL_70;
  }
LABEL_69:
  CFArrayAppendValue(v4, CFSTR("plays-sound"));
  if ((a1 & 0x20) == 0)
  {
LABEL_8:
    if ((a1 & 0x40) == 0)
      goto LABEL_9;
    goto LABEL_71;
  }
LABEL_70:
  CFArrayAppendValue(v4, CFSTR("kb-key"));
  if ((a1 & 0x40) == 0)
  {
LABEL_9:
    if ((a1 & 0x80) == 0)
      goto LABEL_10;
    goto LABEL_72;
  }
LABEL_71:
  CFArrayAppendValue(v4, CFSTR("static-text"));
  if ((a1 & 0x80) == 0)
  {
LABEL_10:
    if ((a1 & 0x100) == 0)
      goto LABEL_11;
    goto LABEL_73;
  }
LABEL_72:
  CFArrayAppendValue(v4, CFSTR("summary-elem"));
  if ((a1 & 0x100) == 0)
  {
LABEL_11:
    if ((a1 & 0x200) == 0)
      goto LABEL_12;
    goto LABEL_74;
  }
LABEL_73:
  CFArrayAppendValue(v4, CFSTR("not-enabled"));
  if ((a1 & 0x200) == 0)
  {
LABEL_12:
    if ((a1 & 0x400) == 0)
      goto LABEL_13;
    goto LABEL_75;
  }
LABEL_74:
  CFArrayAppendValue(v4, CFSTR("updates-frequently"));
  if ((a1 & 0x400) == 0)
  {
LABEL_13:
    if ((a1 & 0x2000) == 0)
      goto LABEL_14;
    goto LABEL_76;
  }
LABEL_75:
  CFArrayAppendValue(v4, CFSTR("search-field"));
  if ((a1 & 0x2000) == 0)
  {
LABEL_14:
    if ((a1 & 0x4000) == 0)
      goto LABEL_15;
    goto LABEL_77;
  }
LABEL_76:
  CFArrayAppendValue(v4, CFSTR("direct-touch"));
  if ((a1 & 0x4000) == 0)
  {
LABEL_15:
    if ((a1 & 0x10000) == 0)
      goto LABEL_16;
    goto LABEL_78;
  }
LABEL_77:
  CFArrayAppendValue(v4, CFSTR("cause-page-turn"));
  if ((a1 & 0x10000) == 0)
  {
LABEL_16:
    if ((a1 & 0x4000000) == 0)
      goto LABEL_17;
    goto LABEL_79;
  }
LABEL_78:
  CFArrayAppendValue(v4, CFSTR("header"));
  if ((a1 & 0x4000000) == 0)
  {
LABEL_17:
    if ((a1 & 0x20000) == 0)
      goto LABEL_18;
    goto LABEL_80;
  }
LABEL_79:
  CFArrayAppendValue(v4, CFSTR("footer"));
  if ((a1 & 0x20000) == 0)
  {
LABEL_18:
    if ((a1 & 0x40000) == 0)
      goto LABEL_19;
    goto LABEL_81;
  }
LABEL_80:
  CFArrayAppendValue(v4, CFSTR("web-content"));
  if ((a1 & 0x40000) == 0)
  {
LABEL_19:
    if ((a1 & 0x80000) == 0)
      goto LABEL_20;
    goto LABEL_82;
  }
LABEL_81:
  CFArrayAppendValue(v4, CFSTR("text-entry"));
  if ((a1 & 0x80000) == 0)
  {
LABEL_20:
    if ((a1 & 0x200000) == 0)
      goto LABEL_21;
    goto LABEL_83;
  }
LABEL_82:
  CFArrayAppendValue(v4, CFSTR("picker-elem"));
  if ((a1 & 0x200000) == 0)
  {
LABEL_21:
    if ((a1 & 0x400000) == 0)
      goto LABEL_22;
    goto LABEL_84;
  }
LABEL_83:
  CFArrayAppendValue(v4, CFSTR("is-editing"));
  if ((a1 & 0x400000) == 0)
  {
LABEL_22:
    if ((a1 & 0x4000000000000) == 0)
      goto LABEL_23;
    goto LABEL_85;
  }
LABEL_84:
  CFArrayAppendValue(v4, CFSTR("launch-icon"));
  if ((a1 & 0x4000000000000) == 0)
  {
LABEL_23:
    if ((a1 & 0x800000) == 0)
      goto LABEL_24;
    goto LABEL_86;
  }
LABEL_85:
  CFArrayAppendValue(v4, CFSTR("folder-icon"));
  if ((a1 & 0x800000) == 0)
  {
LABEL_24:
    if ((a1 & 0x400000000000000) == 0)
      goto LABEL_25;
    goto LABEL_87;
  }
LABEL_86:
  CFArrayAppendValue(v4, CFSTR("status-bar-elem"));
  if ((a1 & 0x400000000000000) == 0)
  {
LABEL_25:
    if ((a1 & 0x1000000) == 0)
      goto LABEL_26;
    goto LABEL_88;
  }
LABEL_87:
  CFArrayAppendValue(v4, CFSTR("allow-layout-change-in-status-bar"));
  if ((a1 & 0x1000000) == 0)
  {
LABEL_26:
    if ((a1 & 0x8000000) == 0)
      goto LABEL_27;
    goto LABEL_89;
  }
LABEL_88:
  CFArrayAppendValue(v4, CFSTR("text-field"));
  if ((a1 & 0x8000000) == 0)
  {
LABEL_27:
    if ((a1 & 0x20000000000000) == 0)
      goto LABEL_28;
    goto LABEL_90;
  }
LABEL_89:
  CFArrayAppendValue(v4, CFSTR("back-button"));
  if ((a1 & 0x20000000000000) == 0)
  {
LABEL_28:
    if ((a1 & 0x80000000) == 0)
      goto LABEL_29;
    goto LABEL_91;
  }
LABEL_90:
  CFArrayAppendValue(v4, CFSTR("toggle"));
  if ((a1 & 0x80000000) == 0)
  {
LABEL_29:
    if ((a1 & 0x200000000) == 0)
      goto LABEL_30;
    goto LABEL_92;
  }
LABEL_91:
  CFArrayAppendValue(v4, CFSTR("select-dismisses-item"));
  if ((a1 & 0x200000000) == 0)
  {
LABEL_30:
    if ((a1 & 0x400000000) == 0)
      goto LABEL_31;
    goto LABEL_93;
  }
LABEL_92:
  CFArrayAppendValue(v4, CFSTR("scrollable"));
  if ((a1 & 0x400000000) == 0)
  {
LABEL_31:
    if ((a1 & 0x800000000) == 0)
      goto LABEL_32;
    goto LABEL_94;
  }
LABEL_93:
  CFArrayAppendValue(v4, CFSTR("spacer"));
  if ((a1 & 0x800000000) == 0)
  {
LABEL_32:
    if ((a1 & 0x1000000000) == 0)
      goto LABEL_33;
    goto LABEL_95;
  }
LABEL_94:
  CFArrayAppendValue(v4, CFSTR("table-index"));
  if ((a1 & 0x1000000000) == 0)
  {
LABEL_33:
    if ((a1 & 0x2000000000) == 0)
      goto LABEL_34;
    goto LABEL_96;
  }
LABEL_95:
  CFArrayAppendValue(v4, CFSTR("map"));
  if ((a1 & 0x2000000000) == 0)
  {
LABEL_34:
    if ((a1 & 0x4000000000) == 0)
      goto LABEL_35;
    goto LABEL_97;
  }
LABEL_96:
  CFArrayAppendValue(v4, CFSTR("text-ops-available"));
  if ((a1 & 0x4000000000) == 0)
  {
LABEL_35:
    if ((a1 & 0x8000000000) == 0)
      goto LABEL_36;
    goto LABEL_98;
  }
LABEL_97:
  CFArrayAppendValue(v4, CFSTR("draggable"));
  if ((a1 & 0x8000000000) == 0)
  {
LABEL_36:
    if ((a1 & 0x2000000000000000) == 0)
      goto LABEL_37;
    goto LABEL_99;
  }
LABEL_98:
  CFArrayAppendValue(v4, CFSTR("gesture-practice"));
  if ((a1 & 0x2000000000000000) == 0)
  {
LABEL_37:
    if ((a1 & 0x10000000000) == 0)
      goto LABEL_38;
    goto LABEL_100;
  }
LABEL_99:
  CFArrayAppendValue(v4, CFSTR("gesture-handler"));
  if ((a1 & 0x10000000000) == 0)
  {
LABEL_38:
    if ((a1 & 0x20000000000) == 0)
      goto LABEL_39;
    goto LABEL_101;
  }
LABEL_100:
  CFArrayAppendValue(v4, CFSTR("popup-button"));
  if ((a1 & 0x20000000000) == 0)
  {
LABEL_39:
    if ((a1 & 0x200000000000) == 0)
      goto LABEL_40;
    goto LABEL_102;
  }
LABEL_101:
  CFArrayAppendValue(v4, CFSTR("allows-native-sliding"));
  if ((a1 & 0x200000000000) == 0)
  {
LABEL_40:
    if ((a1 & 0x400000000000) == 0)
      goto LABEL_41;
    goto LABEL_103;
  }
LABEL_102:
  CFArrayAppendValue(v4, CFSTR("touch-container"));
  if ((a1 & 0x400000000000) == 0)
  {
LABEL_41:
    if ((a1 & 0x800000000000) == 0)
      goto LABEL_42;
    goto LABEL_104;
  }
LABEL_103:
  CFArrayAppendValue(v4, CFSTR("supports-zoom"));
  if ((a1 & 0x800000000000) == 0)
  {
LABEL_42:
    if ((a1 & 0x1000000000000) == 0)
      goto LABEL_43;
    goto LABEL_105;
  }
LABEL_104:
  CFArrayAppendValue(v4, CFSTR("text-area"));
  if ((a1 & 0x1000000000000) == 0)
  {
LABEL_43:
    if ((a1 & 0x800) == 0)
      goto LABEL_44;
    goto LABEL_106;
  }
LABEL_105:
  CFArrayAppendValue(v4, CFSTR("book-content"));
  if ((a1 & 0x800) == 0)
  {
LABEL_44:
    if ((a1 & 0x1000) == 0)
      goto LABEL_45;
    goto LABEL_107;
  }
LABEL_106:
  CFArrayAppendValue(v4, CFSTR("starts-media"));
  if ((a1 & 0x1000) == 0)
  {
LABEL_45:
    if ((a1 & 0x10000000000000) == 0)
      goto LABEL_46;
    goto LABEL_108;
  }
LABEL_107:
  CFArrayAppendValue(v4, CFSTR("adjustable"));
  if ((a1 & 0x10000000000000) == 0)
  {
LABEL_46:
    if ((a1 & 0x20000000) == 0)
      goto LABEL_47;
    goto LABEL_109;
  }
LABEL_108:
  CFArrayAppendValue(v4, CFSTR("menu-item"));
  if ((a1 & 0x20000000) == 0)
  {
LABEL_47:
    if ((a1 & 0x40000000) == 0)
      goto LABEL_48;
    goto LABEL_110;
  }
LABEL_109:
  CFArrayAppendValue(v4, CFSTR("aut-correct-candidate"));
  if ((a1 & 0x40000000) == 0)
  {
LABEL_48:
    if ((a1 & 0x10000000) == 0)
      goto LABEL_49;
    goto LABEL_111;
  }
LABEL_110:
  CFArrayAppendValue(v4, CFSTR("delete-key"));
  if ((a1 & 0x10000000) == 0)
  {
LABEL_49:
    if ((a1 & 0x40000000000000) == 0)
      goto LABEL_50;
    goto LABEL_112;
  }
LABEL_111:
  CFArrayAppendValue(v4, CFSTR("tab-button"));
  if ((a1 & 0x40000000000000) == 0)
  {
LABEL_50:
    if ((a1 & 0x100000) == 0)
      goto LABEL_51;
    goto LABEL_113;
  }
LABEL_112:
  CFArrayAppendValue(v4, CFSTR("ignore-item-chooser"));
  if ((a1 & 0x100000) == 0)
  {
LABEL_51:
    if ((a1 & 0x40000000000) == 0)
      goto LABEL_52;
    goto LABEL_114;
  }
LABEL_113:
  CFArrayAppendValue(v4, CFSTR("radio-button"));
  if ((a1 & 0x40000000000) == 0)
  {
LABEL_52:
    if ((a1 & 0x2000000) == 0)
      goto LABEL_53;
    goto LABEL_115;
  }
LABEL_114:
  CFArrayAppendValue(v4, CFSTR("math-equation"));
  if ((a1 & 0x2000000) == 0)
  {
LABEL_53:
    if ((a1 & 0x80000000000000) == 0)
      goto LABEL_54;
    goto LABEL_116;
  }
LABEL_115:
  CFArrayAppendValue(v4, CFSTR("inactive"));
  if ((a1 & 0x80000000000000) == 0)
  {
LABEL_54:
    if ((a1 & 0x100000000000000) == 0)
      goto LABEL_55;
    goto LABEL_117;
  }
LABEL_116:
  CFArrayAppendValue(v4, CFSTR("supports-tracking-detail"));
  if ((a1 & 0x100000000000000) == 0)
  {
LABEL_55:
    if ((a1 & 0x8000000000000) == 0)
      goto LABEL_56;
    goto LABEL_118;
  }
LABEL_117:
  CFArrayAppendValue(v4, CFSTR("alert"));
  if ((a1 & 0x8000000000000) == 0)
  {
LABEL_56:
    if ((a1 & 0x800000000000000) == 0)
      goto LABEL_58;
    goto LABEL_57;
  }
LABEL_118:
  CFArrayAppendValue(v4, CFSTR("read-only"));
  if ((a1 & 0x800000000000000) != 0)
LABEL_57:
    CFArrayAppendValue(v4, CFSTR("web-interactive-video"));
LABEL_58:
  v5 = CFStringCreateMutable(v2, 0);
  Count = CFArrayGetCount(v4);
  v7 = Count - 1;
  if (Count >= 1)
  {
    v8 = Count;
    for (i = 0; i != v8; ++i)
    {
      ValueAtIndex = (const __CFString *)CFArrayGetValueAtIndex(v4, i);
      CFStringAppend(v5, ValueAtIndex);
      if (v7 != i)
        CFStringAppend(v5, CFSTR(", "));
    }
  }
  CFRelease(v4);
  return v5;
}

void _AXRemoveObserverForPort(unsigned int a1)
{
  os_unfair_lock_lock(&gAXObserverLock);
  if (gObserverCache)
  {
    CFDictionaryRemoveValue((CFMutableDictionaryRef)gObserverCache, (const void *)a1);
    if (!CFDictionaryGetCount((CFDictionaryRef)gObserverCache))
    {
      CFRelease((CFTypeRef)gObserverCache);
      gObserverCache = 0;
    }
  }
  os_unfair_lock_unlock(&gAXObserverLock);
}

void _AXSetObserverForPort(const void *a1, unsigned int a2)
{
  __CFDictionary *Mutable;

  os_unfair_lock_lock(&gAXObserverLock);
  Mutable = (__CFDictionary *)gObserverCache;
  if (!gObserverCache)
  {
    Mutable = CFDictionaryCreateMutable(0, 1, 0, 0);
    gObserverCache = (uint64_t)Mutable;
  }
  CFDictionarySetValue(Mutable, (const void *)a2, a1);
  os_unfair_lock_unlock(&gAXObserverLock);
}

BOOL AXProcessCanContactSystemWideServer()
{
  if (AXProcessCanContactSystemWideServer_onceToken != -1)
    dispatch_once(&AXProcessCanContactSystemWideServer_onceToken, &__block_literal_global_360);
  return (AXProcessCanContactSystemWideServer_CanContact & 1) == 0;
}

uint64_t _AXUIElementCreateMachPort(mach_port_name_t *a1, uint64_t a2, uint64_t a3)
{
  uint64_t result;
  ipc_space_t *v6;
  mach_port_name_t name;

  name = 0;
  if (!a3 || (result = bootstrap_check_in2(), (_DWORD)result))
  {
    v6 = (ipc_space_t *)MEMORY[0x1E0C83DA0];
    result = mach_port_allocate(*MEMORY[0x1E0C83DA0], 1u, &name);
    if (!(_DWORD)result)
    {
      result = mach_port_insert_right(*v6, name, name, 0x14u);
      if (a3)
      {
        if (!(_DWORD)result)
          result = bootstrap_register2();
      }
    }
  }
  *a1 = name;
  return result;
}

uint64_t axObserverDeadNameHandler(uint64_t result)
{
  mach_port_name_t v1;
  const void *v2;

  if (result && *(_DWORD *)(result + 20) == 72)
  {
    v1 = *(_DWORD *)(result + 32);
    v2 = (const void *)_AXObserverCookieCreate(v1, 0, 0, 1);
    _AXNotificationObserverClientDied(v2);
    if (v2)
      CFRelease(v2);
    return mach_port_mod_refs(*MEMORY[0x1E0C83DA0], v1, 4u, -2);
  }
  return result;
}

uint64_t apiNotifyCallback()
{
  uint64_t result;

  result = AXAPIEnabled();
  gIsAPIOn = result;
  return result;
}

uint64_t __hasEntitlementForAuditToken(const __CFString *a1, const UInt8 *a2)
{
  pid_t v4;
  const __CFAllocator *v6;
  CFDataRef v7;
  uint64_t v8;
  int v10;
  int v11;
  __int128 v12;
  __SecTask *v13;
  __SecTask *v14;
  CFTypeRef v15;
  const void *v16;
  CFTypeID v17;
  const void *v18;
  audit_token_t cf;

  v4 = getpid();
  if (v4 != sSystemWideAppServerPID && v4 != sSystemWideServerPID)
    return 1;
  v6 = (const __CFAllocator *)*MEMORY[0x1E0C9AE00];
  if (!_ValidAuditTokens)
    _ValidAuditTokens = (uint64_t)CFSetCreateMutable(v6, 0, MEMORY[0x1E0C9B3B0]);
  v7 = CFDataCreate(v6, a2, 32);
  if (!CFSetContainsValue((CFSetRef)_ValidAuditTokens, v7))
  {
    v10 = *(_DWORD *)a2;
    if (v10 != geteuid() || (v11 = *((_DWORD *)a2 + 1), v11 != getegid()))
    {
      v12 = *((_OWORD *)a2 + 1);
      *(_OWORD *)cf.val = *(_OWORD *)a2;
      *(_OWORD *)&cf.val[4] = v12;
      v13 = SecTaskCreateWithAuditToken(0, &cf);
      if (!v13)
      {
        v8 = 0;
LABEL_29:
        CFRelease(v7);
        return v8;
      }
      v14 = v13;
      *(_QWORD *)cf.val = 0;
      v15 = SecTaskCopyValueForEntitlement(v13, a1, (CFErrorRef *)&cf);
      if (v15)
      {
        v16 = v15;
        v17 = CFGetTypeID(v15);
        if (v17 == CFBooleanGetTypeID() && CFBooleanGetValue((CFBooleanRef)v16))
        {
          if (CFSetGetCount((CFSetRef)_ValidAuditTokens) >= 11)
            CFSetRemoveAllValues((CFMutableSetRef)_ValidAuditTokens);
          CFSetAddValue((CFMutableSetRef)_ValidAuditTokens, v7);
          CFRelease(v16);
          v18 = *(const void **)cf.val;
          v8 = 1;
          if (!*(_QWORD *)cf.val)
            goto LABEL_28;
          goto LABEL_26;
        }
        CFRelease(v16);
      }
      if (!*(_QWORD *)cf.val)
      {
        v8 = 0;
        goto LABEL_28;
      }
      CFLog();
      v8 = 0;
      v18 = *(const void **)cf.val;
LABEL_26:
      CFRelease(v18);
LABEL_28:
      CFRelease(v14);
      goto LABEL_29;
    }
  }
  CFRelease(v7);
  return 1;
}

intptr_t ___handleNonMainThreadCallback_block_invoke(uint64_t a1)
{
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

uint64_t __AXObserverCookieDeallocate(uint64_t result)
{
  mach_port_name_t v1;

  v1 = *(_DWORD *)(result + 16);
  if (v1)
    return mach_port_deallocate(*MEMORY[0x1E0C83DA0], v1);
  return result;
}

BOOL __AXObserverCookieEqual(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  int v3;
  int v4;

  v2 = 0;
  if (a1 && a2)
  {
    v3 = *(_DWORD *)(a1 + 16);
    if (!v3)
      v3 = *(_DWORD *)(a1 + 20);
    v4 = *(_DWORD *)(a2 + 16);
    if (!v4)
      v4 = *(_DWORD *)(a2 + 20);
    return v3 == v4;
  }
  return v2;
}

uint64_t __AXObserverCookieHash(uint64_t a1)
{
  return *(unsigned int *)(a1 + 16);
}

CFStringRef __AXObserverCookieCopyDescription(uint64_t a1)
{
  const __CFAllocator *v2;

  v2 = CFGetAllocator((CFTypeRef)a1);
  return CFStringCreateWithFormat(v2, 0, CFSTR("<AXObserverCookie %p> {port=0x%x refcon=%p, pid=%d}"), a1, *(unsigned int *)(a1 + 16), *(_QWORD *)(a1 + 24), *(unsigned int *)(a1 + 32));
}

void sub_1B54B5708(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1B54B5A34(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1B54B5BA4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id obj)
{
  objc_sync_exit(obj);
  _Unwind_Resume(a1);
}

void sub_1B54B5CD8(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1B54B5DA0(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1B54B67A4(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1B54B6804(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

CFTypeID AXValueGetTypeID(void)
{
  if ((__AXValueInitialized & 1) == 0)
    __AXValueInitialize();
  return __kAXValueTypeID;
}

uint64_t __AXValueInitialize()
{
  pthread_mutex_lock(&sInitLock);
  if ((__AXValueInitialized & 1) == 0)
  {
    __kAXValueTypeID = _CFRuntimeRegisterClass();
    __AXValueInitialized = 1;
  }
  return pthread_mutex_unlock(&sInitLock);
}

_DWORD *_AXValueCreateFromInternalData(int a1, const void *a2)
{
  size_t v4;
  _DWORD *Instance;

  if (!a2)
    return 0;
  if ((__AXValueInitialized & 1) == 0)
    __AXValueInitialize();
  if ((a1 - 1) > 4)
    return 0;
  v4 = dword_1B54F0298[a1 - 1];
  Instance = (_DWORD *)_CFRuntimeCreateInstance();
  Instance[4] = a1;
  Instance[5] = v4;
  memcpy(Instance + 6, a2, v4);
  return Instance;
}

AXValueRef AXValueCreate(AXValueType theType, const void *valuePtr)
{
  signed __int32 v3;
  size_t v5;
  _DWORD *Instance;
  _DWORD *v7;
  _OWORD *v8;

  if (!valuePtr)
    return 0;
  v3 = theType - 1;
  if (theType - 1 > 4)
    return 0;
  v5 = qword_1B54F02B0[v3];
  if ((__AXValueInitialized & 1) == 0)
    __AXValueInitialize();
  Instance = (_DWORD *)_CFRuntimeCreateInstance();
  Instance[4] = theType;
  Instance[5] = v5;
  v7 = Instance;
  switch(v3)
  {
    case 0:
    case 1:
    case 3:
      v8 = malloc_type_calloc(1uLL, 0x10uLL, 0x1000040451B5BE8uLL);
      *v8 = *(_OWORD *)valuePtr;
      goto LABEL_10;
    case 2:
      v8 = malloc_type_calloc(1uLL, 0x20uLL, 0x1000040E0EAB150uLL);
      *v8 = *(_OWORD *)valuePtr;
      v8[1] = *((_OWORD *)valuePtr + 1);
LABEL_10:
      memmove(v7 + 6, v8, v5);
      free(v8);
      break;
    case 4:
      memmove(Instance + 6, valuePtr, v5);
      break;
    default:
      return 0;
  }
  return (AXValueRef)v7;
}

AXValueType AXValueGetType(AXValueRef value)
{
  AXValueRef v1;
  uint64_t v2;

  if (value)
  {
    v1 = value;
    if ((__AXValueInitialized & 1) == 0)
      __AXValueInitialize();
    v2 = __kAXValueTypeID;
    if (v2 == CFGetTypeID(v1))
      LODWORD(value) = *((_DWORD *)v1 + 4);
    else
      LODWORD(value) = 0;
  }
  return value;
}

Boolean AXValueGetValue(AXValueRef value, AXValueType theType, void *valuePtr)
{
  if (AXValueGetType(value) != theType)
    return 0;
  switch(theType)
  {
    case kAXValueTypeCGPoint:
    case kAXValueTypeCGSize:
    case kAXValueTypeCFRange:
      *(_OWORD *)valuePtr = *(_OWORD *)((char *)value + 24);
      break;
    case kAXValueTypeCGRect:
      *(_OWORD *)valuePtr = *(_OWORD *)((char *)value + 24);
      *((_OWORD *)valuePtr + 1) = *(_OWORD *)((char *)value + 40);
      break;
    case kAXValueTypeAXError:
      *(_DWORD *)valuePtr = *((_DWORD *)value + 6);
      break;
    default:
      return 0;
  }
  return 1;
}

BOOL __AXValueEqual(_DWORD *a1, _DWORD *a2)
{
  uint64_t v2;
  size_t v3;

  v2 = 0;
  if (a1 && a2)
  {
    if (a1[4] == a2[4] && (v3 = a1[5], (_DWORD)v3 == a2[5]))
      return memcmp(a1 + 6, a2 + 6, v3) == 0;
    else
      return 0;
  }
  return v2;
}

uint64_t __AXValueHash(_DWORD *a1)
{
  return (a1[5] + a1[4] + a1[6]);
}

CFStringRef __AXValueCopyDescription(int *cf)
{
  const __CFAllocator *v2;
  CFStringRef result;
  const __CFAllocator *v4;
  const __CFAllocator *v5;
  const __CFAllocator *v6;
  const __CFAllocator *v7;
  const __CFAllocator *v8;

  switch(cf[4])
  {
    case 1:
      v2 = CFGetAllocator(cf);
      result = CFStringCreateWithFormat(v2, 0, CFSTR("<AXValue %p> {value = x:%f y:%f type = kAXValueCGPointType}"), cf, *((_QWORD *)cf + 3), *((_QWORD *)cf + 4));
      break;
    case 2:
      v5 = CFGetAllocator(cf);
      result = CFStringCreateWithFormat(v5, 0, CFSTR("<AXValue %p> {value = w:%f h:%f type = kAXValueCGSizeType}"), cf, *((_QWORD *)cf + 3), *((_QWORD *)cf + 4));
      break;
    case 3:
      v6 = CFGetAllocator(cf);
      result = CFStringCreateWithFormat(v6, 0, CFSTR("<AXValue %p> {value = x:%f y:%f w:%f h:%f type = kAXValueCGRectType}"), cf, *((_QWORD *)cf + 3), *((_QWORD *)cf + 4), *((_QWORD *)cf + 5), *((_QWORD *)cf + 6));
      break;
    case 4:
      v7 = CFGetAllocator(cf);
      result = CFStringCreateWithFormat(v7, 0, CFSTR("<AXValue %p> {value = location:%d length:%d type = kAXValueCFRangeType}"), cf, *((_QWORD *)cf + 3), *((_QWORD *)cf + 4));
      break;
    case 5:
      v8 = CFGetAllocator(cf);
      result = CFStringCreateWithFormat(v8, 0, CFSTR("<AXValue %p> {value = error:%ld type = kAXValueAXErrorType}"), cf, cf[6]);
      break;
    default:
      v4 = CFGetAllocator(cf);
      result = CFStringCreateWithFormat(v4, 0, CFSTR("<AXValue %p> {type = kAXValueIllegalType}"), cf);
      break;
  }
  return result;
}

id AXXCAttributeForAttribute(void *a1)
{
  id v1;
  void *v2;
  id v3;
  void *v4;
  void *v5;
  _QWORD v7[4];
  id v8;

  v1 = a1;
  if (_AXCAInitializeLookup_onceToken != -1)
    dispatch_once(&_AXCAInitializeLookup_onceToken, &__block_literal_global_2);
  objc_msgSend((id)XCAttributesToAXAttributes, "allKeys");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __AXXCAttributeForAttribute_block_invoke;
  v7[3] = &unk_1E6919008;
  v8 = v1;
  v3 = v1;
  objc_msgSend(v2, "ax_filteredArrayUsingBlock:", v7);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "lastObject");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

id AXAttributeForXCAttribute(void *a1)
{
  uint64_t v1;
  id v2;
  void *v3;

  v1 = _AXCAInitializeLookup_onceToken;
  v2 = a1;
  if (v1 != -1)
    dispatch_once(&_AXCAInitializeLookup_onceToken, &__block_literal_global_2);
  objc_msgSend((id)XCAttributesToAXAttributes, "objectForKeyedSubscript:", v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

const __CFString *AXExpandedStatusAttributeForValue(void *a1)
{
  int v1;
  const __CFString *v2;

  v1 = objc_msgSend(a1, "intValue");
  v2 = CFSTR("kAXXCAttributeExpandedStatusUnsupported");
  if (v1 == 1)
    v2 = CFSTR("kAXXCAttributeExpandedStatusExpanded");
  if (v1 == 2)
    return CFSTR("kAXXCAttributeExpandedStatusCollapsed");
  else
    return v2;
}

uint64_t __AXUIElementInitialize()
{
  int v0;
  int v1;
  NSObject *v2;

  pthread_mutex_lock(&sInitLock_0);
  if ((__AXUIElementInitialized & 1) == 0)
  {
    __kAXUIElementTypeID = _CFRuntimeRegisterClass();
    __AXUIElementInitialized = 1;
  }
  if (!gSerializeBufferKey)
  {
    gSerializeBufferKey = 0;
    v0 = pthread_key_create((pthread_key_t *)&gSerializeBufferKey, (void (__cdecl *)(void *))serializeBufferDestructor);
    if (v0)
    {
      v1 = v0;
      __AXUIElementInitialized = 0;
      gSerializeBufferKey = 0;
      v2 = AXRuntimeLogCommon();
      if (os_log_type_enabled(v2, OS_LOG_TYPE_FAULT))
        __AXUIElementInitialize_cold_1(v1, v2);
    }
  }
  return pthread_mutex_unlock(&sInitLock_0);
}

uint64_t _AXUIElementSetGlobalTimeout(uint64_t result)
{
  int v1;

  if ((int)result <= 0)
    v1 = 3000;
  else
    v1 = result;
  sGlobalTimeout = v1;
  return result;
}

float AXUIElementMessagingTimeout()
{
  return (float)sGlobalTimeout;
}

CFTypeID AXObserverGetTypeID(void)
{
  if ((__AXObserverInitialized & 1) == 0)
    __AXObserverInitialize();
  return __kAXObserverTypeID;
}

uint64_t __AXObserverInitialize()
{
  pthread_mutex_lock(&sInitLock_0);
  if ((__AXObserverInitialized & 1) == 0)
  {
    __kAXObserverTypeID = _CFRuntimeRegisterClass();
    __AXObserverInitialized = 1;
  }
  return pthread_mutex_unlock(&sInitLock_0);
}

uint64_t _AXObserverCreateInternal(int a1, uint64_t a2)
{
  uint64_t result;

  if ((__AXObserverInitialized & 1) == 0)
    __AXObserverInitialize();
  result = _CFRuntimeCreateInstance();
  if (result)
  {
    *(_DWORD *)(result + 16) = a1;
    *(_QWORD *)(result + 24) = 0;
    *(_DWORD *)(result + 32) = 0;
    *(_QWORD *)(result + 40) = a2;
    *(_BYTE *)(result + 48) = 0;
  }
  return result;
}

void *serializeBufferDestructor(void *result)
{
  if (result)
    return (void *)munmap(result, 0x1000uLL);
  return result;
}

BOOL __AXUIElementEqual(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  v2 = 0;
  if (a1 && a2)
    return *(_QWORD *)(a1 + 20) == *(_QWORD *)(a2 + 20)
        && *(_QWORD *)(a1 + 28) == *(_QWORD *)(a2 + 28)
        && *(_DWORD *)(a1 + 16) == *(_DWORD *)(a2 + 16);
  return v2;
}

uint64_t __AXUIElementHash(uint64_t a1)
{
  return *(_QWORD *)(a1 + 20) + *(int *)(a1 + 16) + *(_QWORD *)(a1 + 28);
}

CFStringRef __AXUIElementCopyDescription(uint64_t a1)
{
  const __CFAllocator *v2;

  v2 = CFGetAllocator((CFTypeRef)a1);
  return CFStringCreateWithFormat(v2, 0, CFSTR("<AXUIElementRef %p> {pid=%d} {uid=[ID:%llu hash:%p]}"), a1, *(unsigned int *)(a1 + 16), *(_QWORD *)(a1 + 28), *(_QWORD *)(a1 + 20));
}

BOOL __AXObserverEqual(uint64_t a1, uint64_t a2)
{
  return *(_DWORD *)(a1 + 32) == *(_DWORD *)(a2 + 32);
}

uint64_t __AXObserverHash(uint64_t a1)
{
  return *(unsigned int *)(a1 + 32);
}

CFStringRef __AXObserverCopyDescription(unsigned int *a1)
{
  const __CFAllocator *v2;

  v2 = CFGetAllocator(a1);
  return CFStringCreateWithFormat(v2, 0, CFSTR("<AXObserver %p> {pid=%d}"), a1, a1[4]);
}

uint64_t _AXClearElementCache()
{
  return AX_PERFORM_WITH_LOCK();
}

uint64_t _AXSetNextElementCacheUniqueUID()
{
  return AX_PERFORM_WITH_LOCK();
}

void _AXInitializeElementCache()
{
  if (_AXInitializeElementCache_onceToken != -1)
    dispatch_once(&_AXInitializeElementCache_onceToken, &__block_literal_global_6);
}

uint64_t _AXAddToElementCache(void *a1)
{
  id v1;
  uint64_t v2;
  id v4;
  uint64_t v5;
  uint64_t *v6;
  uint64_t v7;
  uint64_t v8;

  v1 = a1;
  if (_AXInitializeElementCache_onceToken != -1)
    dispatch_once(&_AXInitializeElementCache_onceToken, &__block_literal_global_6);
  v5 = 0;
  v6 = &v5;
  v7 = 0x2020000000;
  v8 = 0;
  if (v1)
  {
    v4 = v1;
    AX_PERFORM_WITH_LOCK();

    v2 = v6[3];
  }
  else
  {
    v2 = 0;
  }
  _Block_object_dispose(&v5, 8);

  return v2;
}

void sub_1B54BACC0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t _AXIsInElementCache(uint64_t a1)
{
  uint64_t v1;
  uint64_t v3;
  uint64_t *v4;
  uint64_t v5;
  uint64_t v6;

  if (!a1)
    return 0;
  v3 = 0;
  v4 = &v3;
  v5 = 0x2020000000;
  v6 = 0;
  AX_PERFORM_WITH_LOCK();
  v1 = v4[3];
  _Block_object_dispose(&v3, 8);
  return v1;
}

void sub_1B54BAEB4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

BOOL _doesElementFrame(uint64_t a1, CGFloat a2, CGFloat a3, CGFloat a4, CGFloat a5, CGFloat a6, CGFloat a7, CGFloat a8, CGFloat a9)
{
  CGFloat MinX;
  CGFloat v18;
  double MinY;
  CGFloat v20;
  CGFloat v21;
  CGFloat v22;
  double MaxY;
  CGFloat v24;
  CGFloat v25;
  CGFloat v26;
  CGFloat v27;
  double MaxX;
  double v29;
  CGFloat v30;
  double rectb;
  double rectc;
  CGRect v36;
  CGRect v37;
  CGRect v38;
  CGRect v39;
  CGRect v40;
  CGRect v41;
  CGRect v42;
  CGRect v43;
  CGRect v44;
  CGRect v45;

  switch(a1)
  {
    case 2:
      v38.origin.x = a6;
      v38.origin.y = a7;
      v38.size.width = a8;
      v38.size.height = a9;
      MaxY = CGRectGetMaxY(v38);
      v39.origin.x = a2;
      v39.origin.y = a3;
      v39.size.width = a4;
      v39.size.height = a5;
      if (MaxY - CGRectGetMaxY(v39) < 0.0)
        return 0;
      v40.origin.x = a6;
      v40.origin.y = a7;
      v40.size.width = a8;
      v40.size.height = a9;
      MinY = CGRectGetMinY(v40);
      v24 = a2;
      v25 = a3;
      v26 = a4;
      v27 = a5;
      break;
    case 3:
      v41.origin.x = a6;
      v41.origin.y = a7;
      v41.size.width = a8;
      v41.size.height = a9;
      MaxX = CGRectGetMaxX(v41);
      v42.origin.x = a2;
      v42.origin.y = a3;
      v42.size.width = a4;
      v42.size.height = a5;
      if (MaxX - CGRectGetMaxX(v42) < 0.0)
        return 0;
      v43.origin.x = a6;
      v43.origin.y = a7;
      v43.size.width = a8;
      v43.size.height = a9;
      MinY = CGRectGetMinX(v43);
      v20 = a2;
      v21 = a3;
      v22 = a4;
      v18 = a5;
LABEL_10:
      v29 = CGRectGetMaxX(*(CGRect *)&v20);
      return MinY - v29 < 6.0;
    case 4:
      rectb = CGRectGetMinX(*(CGRect *)&a2);
      v36.origin.x = a6;
      v36.origin.y = a7;
      v36.size.width = a8;
      v36.size.height = a9;
      if (rectb - CGRectGetMinX(v36) < 0.0)
        return 0;
      v37.origin.x = a2;
      v37.origin.y = a3;
      v37.size.width = a4;
      v37.size.height = a5;
      MinX = CGRectGetMinX(v37);
      v18 = a9;
      MinY = MinX;
      v20 = a6;
      v21 = a7;
      v22 = a8;
      goto LABEL_10;
    default:
      rectc = CGRectGetMinY(*(CGRect *)&a2);
      v44.origin.x = a6;
      v44.origin.y = a7;
      v44.size.width = a8;
      v44.size.height = a9;
      if (rectc - CGRectGetMinY(v44) < 0.0)
        return 0;
      v45.origin.x = a2;
      v45.origin.y = a3;
      v45.size.width = a4;
      v45.size.height = a5;
      v30 = CGRectGetMinY(v45);
      v27 = a9;
      MinY = v30;
      v24 = a6;
      v25 = a7;
      v26 = a8;
      break;
  }
  v29 = CGRectGetMaxY(*(CGRect *)&v24);
  return MinY - v29 < 6.0;
}

id AXReadAllUtilitiesElementsToCombineForReadAll(void *a1, uint64_t a2)
{
  id v2;
  void *v3;
  id v4;
  void *v5;
  CGFloat y;
  CGFloat x;
  CGFloat width;
  CGFloat height;
  double v10;
  void *v11;
  id v12;
  void *v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  int v20;
  void *v21;
  void *v22;
  uint64_t v23;
  void *v24;
  int v25;
  uint64_t v26;
  uint64_t v27;
  void *v28;
  int v29;
  int v30;
  double v31;
  double v32;
  double v33;
  double v34;
  double v35;
  double v36;
  double v37;
  double v38;
  void *v39;
  void *v40;
  double v41;
  double v42;
  CGFloat v43;
  double v44;
  CGFloat v45;
  double v46;
  CGFloat v47;
  void *v48;
  void *v49;
  double v50;
  id v51;
  void *v52;
  void *v54;
  double v56;
  CGFloat v57;
  CGFloat v58;
  CGFloat v59;
  CGFloat v60;
  CGRect r1;
  CGRect v62;
  CGRect v63;
  CGRect v64;
  CGRect v65;
  CGRect v66;

  r1.size.width = *(CGFloat *)MEMORY[0x1E0C80C00];
  v2 = a1;
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v2;
  objc_msgSend(MEMORY[0x1E0C99E20], "set");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    v54 = v3;
    x = *MEMORY[0x1E0C9D648];
    y = *(double *)(MEMORY[0x1E0C9D648] + 8);
    width = *(double *)(MEMORY[0x1E0C9D648] + 16);
    height = *(double *)(MEMORY[0x1E0C9D648] + 24);
    v10 = 0.0;
    v11 = v4;
    v12 = v4;
    v59 = y;
    v60 = *MEMORY[0x1E0C9D648];
    v57 = height;
    v58 = width;
    v56 = 0.0;
    while (1)
    {
      v13 = v12;
      if ((objc_msgSend(v5, "containsObject:", v11, v54) & 1) != 0)
        break;
      objc_msgSend(v5, "addObject:", v11);
      objc_msgSend(v11, "stringWithAXAttribute:", 2008);
      v14 = objc_claimAutoreleasedReturnValue();
      if (v14)
      {
        v15 = (void *)v14;
        objc_msgSend(v13, "stringWithAXAttribute:", 2008);
        v16 = objc_claimAutoreleasedReturnValue();
        if (v16)
        {
          v17 = (void *)v16;
          objc_msgSend(v11, "stringWithAXAttribute:", 2008);
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v13, "stringWithAXAttribute:", 2008);
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          v20 = objc_msgSend(v18, "isEqualToString:", v19);

          if (!v20)
            break;
        }
        else
        {

        }
      }
      objc_msgSend(v11, "arrayWithAXAttribute:", 2145);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      if ((objc_msgSend(v21, "containsObject:", &unk_1E6925EA0) & 1) != 0)
        goto LABEL_35;
      objc_msgSend(v11, "numberWithAXAttribute:", 2004);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      v23 = objc_msgSend(v22, "unsignedLongLongValue");

      if ((v23 & 0x42) == 0)
        goto LABEL_35;
      objc_msgSend(v13, "numberWithAXAttribute:", 2004);
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      v25 = objc_msgSend(v24, "unsignedLongLongValue");

      v26 = *(_QWORD *)&v25 & 0x10000;
      if ((v23 & 0x10000) == 0x10000 && !v26)
        goto LABEL_35;
      if ((v23 & 0x10000) == 0 && v26 == 0x10000)
        goto LABEL_35;
      r1.origin.x = x;
      objc_msgSend(v13, "arrayWithAXAttribute:", 2145);
      v27 = objc_claimAutoreleasedReturnValue();
      v28 = (void *)v27;
      if (v21 && v27 && !objc_msgSend(v21, "isEqualToArray:", v27)
        || (v29 = objc_msgSend(v11, "BOOLWithAXAttribute:", 2213),
            v29 != objc_msgSend(v13, "BOOLWithAXAttribute:", 2213))
        || (v30 = objc_msgSend(v11, "BOOLWithAXAttribute:", 2212),
            v30 != objc_msgSend(v13, "BOOLWithAXAttribute:", 2212)))
      {
LABEL_34:

LABEL_35:
        break;
      }
      objc_msgSend(v11, "rectWithAXAttribute:", 2003);
      v32 = v31;
      v34 = v33;
      v36 = v35;
      v38 = v37;
      +[AXElement systemWideElement](AXElement, "systemWideElement");
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "numberWithAXAttribute:", 2021);
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v39, "convertRect:fromContextId:", objc_msgSend(v40, "unsignedIntValue"), v32, v34, v36, v38);
      x = v41;
      v43 = v42;
      v45 = v44;
      v47 = v46;

      v62.origin.y = v59;
      v62.origin.x = v60;
      v62.size.height = v57;
      v62.size.width = v58;
      v65.origin.x = r1.origin.x;
      v65.origin.y = y;
      v65.size.width = width;
      v65.size.height = height;
      if (CGRectEqualToRect(v62, v65))
      {
        height = v47;
        width = v45;
        y = v43;
      }
      else
      {
        if (!_doesElementFrame(a2, x, v43, v45, v47, r1.origin.x, y, width, height))
          goto LABEL_34;
        v63.origin.x = r1.origin.x;
        v63.origin.y = y;
        v63.size.width = width;
        v63.size.height = height;
        v66.origin.x = x;
        v66.origin.y = v43;
        v66.size.width = v45;
        v66.size.height = v47;
        v64 = CGRectUnion(v63, v66);
        x = v64.origin.x;
        y = v64.origin.y;
        width = v64.size.width;
        height = v64.size.height;
      }
      if ((~v23 & 2) == 0)
        v10 = v10 + 1.0;
      objc_msgSend(v11, "stringWithAXAttribute:", 2001);
      v48 = (void *)objc_claimAutoreleasedReturnValue();
      if ((objc_msgSend(v48, "isEqualToString:", CFSTR("•")) & 1) != 0
        || objc_msgSend(v48, "isEqualToString:", CFSTR("-")))
      {
        objc_msgSend(v48, "length");
      }
      else
      {
        v56 = v56 + 1.0;
        if (objc_msgSend(v48, "length"))
          objc_msgSend(v54, "addObject:", v11);
      }
      v12 = v11;

      objc_msgSend(v12, "nextElementsWithCount:", 1);
      v49 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v49, "firstObject");
      v11 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v11)
      {
        v13 = v12;
        break;
      }
    }
    v3 = v54;
    v50 = v56;
  }
  else
  {
    v13 = 0;
    v11 = 0;
    v50 = 0.0;
    v10 = 0.0;
  }
  if (v10 / v50 < 0.75 && objc_msgSend(v3, "count"))
  {
    v51 = v3;
  }
  else
  {
    *(_QWORD *)&r1.origin.y = v4;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &r1.origin.y, 1);
    v51 = (id)objc_claimAutoreleasedReturnValue();
  }
  v52 = v51;

  return v52;
}

void AXSetProcessWantsMLElementForBundle(uint64_t a1, void *a2)
{
  uint64_t v3;
  id v4;
  id v5;

  v3 = AXSetProcessWantsMLElementForBundle_onceToken;
  v4 = a2;
  if (v3 != -1)
    dispatch_once(&AXSetProcessWantsMLElementForBundle_onceToken, &__block_literal_global_4);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", a1);
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)MLElementRequests, "setObject:forKeyedSubscript:", v5, v4);

}

BOOL AXProcessEverWantsMLElements()
{
  return objc_msgSend((id)MLElementRequests, "count") != 0;
}

uint64_t AXProcessWantsMLElementsForBundle(uint64_t a1)
{
  void *v1;
  uint64_t v2;

  objc_msgSend((id)MLElementRequests, "objectForKeyedSubscript:", a1);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = objc_msgSend(v1, "BOOLValue");

  return v2;
}

uint64_t AXProcessesWantMLElements()
{
  return objc_msgSend((id)MLElementRequests, "allKeys");
}

uint64_t _AXPidFromAuditToken(uint64_t a1)
{
  if (a1)
    return (a1 + 20);
  else
    return 0;
}

id AXConvertIncomingValue(void *a1)
{
  id v1;
  void *v2;
  void *v3;
  void *v4;
  id v5;
  void *v6;
  void *v8;
  char isKindOfClass;
  void *v10;
  char v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t i;
  uint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  char v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t j;
  void *v26;
  CFTypeID v27;
  CFTypeID v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  _BYTE v39[128];
  _BYTE v40[128];
  uint64_t v41;

  v41 = *MEMORY[0x1E0C80C00];
  v1 = a1;
  if (!v1)
    goto LABEL_9;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    goto LABEL_9;
  objc_opt_self();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    goto LABEL_8;
  objc_opt_self();
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
LABEL_7:

LABEL_8:
    goto LABEL_9;
  }
  objc_opt_self();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {

    goto LABEL_7;
  }
  objc_opt_self();
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  isKindOfClass = objc_opt_isKindOfClass();

  if ((isKindOfClass & 1) == 0)
  {
    objc_opt_self();
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_opt_isKindOfClass();

    if ((v11 & 1) != 0)
    {
      objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithCapacity:", objc_msgSend(v1, "count"));
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v35 = 0u;
      v36 = 0u;
      v37 = 0u;
      v38 = 0u;
      v12 = v1;
      v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v35, v40, 16);
      if (v13)
      {
        v14 = v13;
        v15 = *(_QWORD *)v36;
        do
        {
          for (i = 0; i != v14; ++i)
          {
            if (*(_QWORD *)v36 != v15)
              objc_enumerationMutation(v12);
            v17 = *(_QWORD *)(*((_QWORD *)&v35 + 1) + 8 * i);
            objc_msgSend(v12, "objectForKey:", v17);
            v18 = (void *)objc_claimAutoreleasedReturnValue();
            AXConvertIncomingValue(v18);
            v19 = (void *)objc_claimAutoreleasedReturnValue();
            if (v19)
              objc_msgSend(v6, "setObject:forKey:", v19, v17);

          }
          v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v35, v40, 16);
        }
        while (v14);
      }
    }
    else
    {
      objc_opt_self();
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v21 = objc_opt_isKindOfClass();

      if ((v21 & 1) == 0)
      {
        v27 = CFGetTypeID(v1);
        if (v27 == AXValueGetTypeID())
        {
          switch(AXValueGetType((AXValueRef)v1))
          {
            case kAXValueTypeCGPoint:
              v29 = 0uLL;
              if (!AXValueGetValue((AXValueRef)v1, kAXValueTypeCGPoint, &v29))
                goto LABEL_45;
              objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithPoint:", v29);
              v5 = (id)objc_claimAutoreleasedReturnValue();
              goto LABEL_10;
            case kAXValueTypeCGSize:
              v29 = 0uLL;
              if (!AXValueGetValue((AXValueRef)v1, kAXValueTypeCGSize, &v29))
                goto LABEL_45;
              objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithSize:", v29);
              v5 = (id)objc_claimAutoreleasedReturnValue();
              goto LABEL_10;
            case kAXValueTypeCGRect:
              v29 = 0u;
              v30 = 0u;
              if (!AXValueGetValue((AXValueRef)v1, kAXValueTypeCGRect, &v29))
                goto LABEL_45;
              objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithRect:", v29, v30);
              v5 = (id)objc_claimAutoreleasedReturnValue();
              goto LABEL_10;
            case kAXValueTypeCFRange:
              v29 = 0uLL;
              v6 = 0;
              if (!AXValueGetValue((AXValueRef)v1, kAXValueTypeCFRange, &v29)
                || (v29 & 0x8000000000000000) != 0
                || (*((_QWORD *)&v29 + 1) & 0x8000000000000000) != 0)
              {
                goto LABEL_11;
              }
              objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithRange:");
              v5 = (id)objc_claimAutoreleasedReturnValue();
              break;
            default:
              goto LABEL_45;
          }
        }
        else
        {
          v28 = CFGetTypeID(v1);
          if (v28 != AXUIElementGetTypeID())
          {
LABEL_45:
            v6 = 0;
            goto LABEL_11;
          }
          _UIAXElementForAXUIElementRef((uint64_t)v1);
          v5 = (id)objc_claimAutoreleasedReturnValue();
        }
        goto LABEL_10;
      }
      objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", objc_msgSend(v1, "count"));
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v31 = 0u;
      v32 = 0u;
      v33 = 0u;
      v34 = 0u;
      v12 = v1;
      v22 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v31, v39, 16);
      if (v22)
      {
        v23 = v22;
        v24 = *(_QWORD *)v32;
        do
        {
          for (j = 0; j != v23; ++j)
          {
            if (*(_QWORD *)v32 != v24)
              objc_enumerationMutation(v12);
            AXConvertIncomingValue(*(_QWORD *)(*((_QWORD *)&v31 + 1) + 8 * j));
            v26 = (void *)objc_claimAutoreleasedReturnValue();
            if (v26)
              objc_msgSend(v6, "addObject:", v26);

          }
          v23 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v31, v39, 16);
        }
        while (v23);
      }
    }

    goto LABEL_11;
  }
LABEL_9:
  v5 = v1;
LABEL_10:
  v6 = v5;
LABEL_11:

  return v6;
}

id AXConvertPidToAXElement(void *a1)
{
  id v1;
  int v2;
  uint64_t AppElementWithPid;
  void *v4;

  v1 = a1;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v2 = objc_msgSend(v1, "intValue");
    if (v2)
      AppElementWithPid = _AXUIElementCreateAppElementWithPid(v2);
    else
      AppElementWithPid = (uint64_t)AXUIElementCreateSystemWide();
    v4 = (void *)AppElementWithPid;
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

id AXConvertOutgoingValue(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  AXAttributedString *v5;
  void *v6;
  id v7;
  uint64_t v8;
  id v10;
  id v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t i;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  AXValueRef v21;
  char v22;
  id v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t ii;
  void *v27;
  id v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t k;
  uint64_t v32;
  void *v33;
  void *v34;
  uint64_t v35;
  uint64_t v36;
  id v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t kk;
  void *v41;
  const void *v42;
  id v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t m;
  const void *v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  id v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t n;
  void *v57;
  void *v58;
  id v59;
  id v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t jj;
  uint64_t v64;
  void *v65;
  void *v66;
  CFTypeID v67;
  CFTypeID v68;
  void *v69;
  id v70;
  id v71;
  uint64_t v72;
  uint64_t v73;
  uint64_t j;
  uint64_t v75;
  void *v76;
  void *v77;
  uint64_t v78;
  uint64_t v79;
  uint64_t v80;
  uint64_t v81;
  CFTypeID v82;
  CFTypeID v83;
  __int128 v84;
  __int128 v85;
  __int128 v86;
  __int128 v87;
  __int128 v88;
  __int128 v89;
  __int128 v90;
  __int128 v91;
  __int128 v92;
  __int128 v93;
  __int128 v94;
  __int128 v95;
  _QWORD v96[4];
  id v97;
  uint64_t v98;
  __int128 v99;
  __int128 v100;
  __int128 v101;
  __int128 v102;
  _QWORD v103[4];
  id v104;
  uint64_t v105;
  __int128 v106;
  __int128 v107;
  __int128 v108;
  __int128 v109;
  __int128 v110;
  __int128 v111;
  __int128 v112;
  __int128 v113;
  __int128 v114;
  __int128 v115;
  __int128 v116;
  __int128 v117;
  __int128 v118;
  __int128 v119;
  __int128 v120;
  __int128 v121;
  __int128 valuePtr;
  __int128 v123;
  uint64_t *v124;
  uint64_t v125;
  uint64_t *v126;
  uint64_t v127;
  uint64_t v128;
  _BYTE v129[128];
  _BYTE v130[128];
  _BYTE v131[128];
  _BYTE v132[128];
  _BYTE v133[128];
  _BYTE v134[128];
  _BYTE v135[128];
  _BYTE v136[128];
  uint64_t v137;

  v137 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  if (!v3)
    return 0;
  v4 = v3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v5 = -[AXAttributedString initWithCFAttributedString:]([AXAttributedString alloc], "initWithCFAttributedString:", v4);

    v4 = v5;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    objc_msgSend(v4, "convertAttachmentsWithBlock:", &__block_literal_global_12);
  v125 = 0;
  v126 = &v125;
  v127 = 0x2050000000;
  v6 = (void *)getBKSHIDEventAuthenticationMessageClass_softClass;
  v128 = getBKSHIDEventAuthenticationMessageClass_softClass;
  if (!getBKSHIDEventAuthenticationMessageClass_softClass)
  {
    *(_QWORD *)&valuePtr = MEMORY[0x1E0C809B0];
    *((_QWORD *)&valuePtr + 1) = 3221225472;
    *(_QWORD *)&v123 = __getBKSHIDEventAuthenticationMessageClass_block_invoke;
    *((_QWORD *)&v123 + 1) = &unk_1E69194D0;
    v124 = &v125;
    __getBKSHIDEventAuthenticationMessageClass_block_invoke((uint64_t)&valuePtr);
    v6 = (void *)v126[3];
  }
  v7 = objc_retainAutorelease(v6);
  _Block_object_dispose(&v125, 8);
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB36F8], "archivedDataWithRootObject:requiringSecureCoding:error:", v4, 1, 0);
    v8 = objc_claimAutoreleasedReturnValue();

    v4 = (void *)v8;
  }
  if (a1 > 3001)
  {
    if (a1 > 91500)
    {
      if (a1 > 94499)
      {
        switch(a1)
        {
          case 95217:
          case 95223:
          case 95246:
            goto LABEL_182;
          case 95218:
          case 95219:
          case 95220:
          case 95221:
          case 95228:
          case 95229:
          case 95232:
          case 95235:
          case 95237:
          case 95238:
          case 95239:
          case 95240:
          case 95241:
          case 95242:
          case 95243:
          case 95244:
          case 95245:
          case 95247:
          case 95248:
            goto LABEL_250;
          case 95222:
          case 95225:
          case 95226:
          case 95227:
          case 95230:
          case 95231:
          case 95233:
          case 95234:
          case 95249:
          case 95250:
          case 95251:
          case 95252:
          case 95253:
          case 95254:
          case 95255:
          case 95256:
          case 95258:
            goto LABEL_199;
          case 95224:
            objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", objc_msgSend(v4, "count"));
            v11 = (id)objc_claimAutoreleasedReturnValue();
            v120 = 0u;
            v121 = 0u;
            v118 = 0u;
            v119 = 0u;
            v12 = v4;
            v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v118, v136, 16);
            if (v13)
            {
              v14 = *(_QWORD *)v119;
              do
              {
                for (i = 0; i != v13; ++i)
                {
                  if (*(_QWORD *)v119 != v14)
                    objc_enumerationMutation(v12);
                  v16 = *(void **)(*((_QWORD *)&v118 + 1) + 8 * i);
                  valuePtr = 0u;
                  v123 = 0u;
                  objc_msgSend(v16, "rectValue");
                  *(_QWORD *)&valuePtr = v17;
                  *((_QWORD *)&valuePtr + 1) = v18;
                  *(_QWORD *)&v123 = v19;
                  *((_QWORD *)&v123 + 1) = v20;
                  v21 = AXValueCreate(kAXValueTypeCGRect, &valuePtr);
                  objc_msgSend(v11, "addObject:", v21);
                  if (v21)
                    CFRelease(v21);
                }
                v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v118, v136, 16);
              }
              while (v13);
            }

            goto LABEL_252;
          case 95236:
            goto LABEL_116;
          case 95257:
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) != 0)
            {
              objc_msgSend(MEMORY[0x1E0C99DE8], "array");
              v69 = (void *)objc_claimAutoreleasedReturnValue();
              v96[0] = MEMORY[0x1E0C809B0];
              v96[1] = 3221225472;
              v96[2] = __AXConvertOutgoingValue_block_invoke_3;
              v96[3] = &unk_1E69194A8;
              v98 = 95257;
              v70 = v69;
              v97 = v70;
              objc_msgSend(v4, "enumerateObjectsUsingBlock:", v96);
              if (objc_msgSend(v70, "count"))
                v11 = v70;
              else
                v11 = 0;

              goto LABEL_252;
            }
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) != 0)
            {
              objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
              v11 = (id)objc_claimAutoreleasedReturnValue();
              v94 = 0u;
              v95 = 0u;
              v92 = 0u;
              v93 = 0u;
              v71 = v4;
              v72 = objc_msgSend(v71, "countByEnumeratingWithState:objects:count:", &v92, v131, 16);
              if (v72)
              {
                v73 = *(_QWORD *)v93;
                do
                {
                  for (j = 0; j != v72; ++j)
                  {
                    if (*(_QWORD *)v93 != v73)
                      objc_enumerationMutation(v71);
                    v75 = *(_QWORD *)(*((_QWORD *)&v92 + 1) + 8 * j);
                    objc_msgSend(v71, "objectForKey:", v75);
                    v76 = (void *)objc_claimAutoreleasedReturnValue();
                    AXConvertOutgoingValue(95257);
                    v77 = (void *)objc_claimAutoreleasedReturnValue();

                    if (v77)
                      objc_msgSend(v11, "setObject:forKey:", v77, v75);

                  }
                  v72 = objc_msgSend(v71, "countByEnumeratingWithState:objects:count:", &v92, v131, 16);
                }
                while (v72);
              }

              goto LABEL_252;
            }
            if (v4)
            {
              v82 = CFGetTypeID(v4);
              if (v82 == AXUIElementGetTypeID())
                goto LABEL_250;
              v83 = CFGetTypeID(v4);
              if (v83 == AXValueGetTypeID())
                goto LABEL_250;
              objc_opt_class();
              if ((objc_opt_isKindOfClass() & 1) != 0)
                goto LABEL_250;
              objc_opt_class();
              if ((objc_opt_isKindOfClass() & 1) != 0)
                goto LABEL_250;
              objc_opt_class();
              if ((objc_opt_isKindOfClass() & 1) != 0)
                goto LABEL_250;
            }
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) != 0)
              goto LABEL_220;
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) == 0 || (objc_msgSend(v4, "onClientSide") & 1) != 0)
              goto LABEL_258;
            goto LABEL_23;
          default:
            switch(a1)
            {
              case 95001:
              case 95005:
                goto LABEL_199;
              case 95002:
                goto LABEL_250;
              case 95003:
                goto LABEL_116;
              case 95004:
                goto LABEL_177;
              default:
                if (a1 == 94500)
                  goto LABEL_199;
                goto LABEL_250;
            }
        }
      }
      if (a1 <= 92600)
      {
        switch(a1)
        {
          case 91501:
          case 91503:
          case 91504:
            goto LABEL_177;
          case 91502:
          case 91506:
          case 91507:
          case 91508:
          case 91509:
            goto LABEL_250;
          case 91505:
          case 91511:
            goto LABEL_243;
          case 91510:
            goto LABEL_159;
          case 91512:
          case 91513:
            goto LABEL_199;
          default:
            switch(a1)
            {
              case 92501:
              case 92502:
              case 92512:
              case 92517:
                goto LABEL_199;
              case 92503:
              case 92505:
              case 92507:
              case 92508:
              case 92509:
              case 92510:
              case 92511:
              case 92513:
              case 92514:
              case 92515:
                goto LABEL_250;
              case 92504:
                goto LABEL_181;
              case 92506:
                goto LABEL_243;
              case 92516:
                goto LABEL_116;
              default:
                if (a1 != 91700)
                  goto LABEL_250;
                goto LABEL_159;
            }
        }
      }
      if (a1 <= 92703)
      {
        if (a1 != 92601 && a1 != 92701 && a1 != 92703)
          goto LABEL_250;
        goto LABEL_243;
      }
      if ((unint64_t)(a1 - 94000) > 0x11)
        goto LABEL_74;
      if (((1 << (a1 - 48)) & 0x31200) == 0)
      {
        if (a1 != 94000)
        {
LABEL_74:
          if (a1 != 92704)
          {
            if (a1 == 94100)
            {
              objc_opt_class();
              if ((objc_opt_isKindOfClass() & 1) != 0)
              {
                objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
                v11 = (id)objc_claimAutoreleasedReturnValue();
                v86 = 0u;
                v87 = 0u;
                v84 = 0u;
                v85 = 0u;
                v28 = v4;
                v29 = objc_msgSend(v28, "countByEnumeratingWithState:objects:count:", &v84, v129, 16);
                if (v29)
                {
                  v30 = *(_QWORD *)v85;
                  do
                  {
                    for (k = 0; k != v29; ++k)
                    {
                      if (*(_QWORD *)v85 != v30)
                        objc_enumerationMutation(v28);
                      v32 = *(_QWORD *)(*((_QWORD *)&v84 + 1) + 8 * k);
                      objc_msgSend(v28, "objectForKey:", v32, (_QWORD)v84);
                      v33 = (void *)objc_claimAutoreleasedReturnValue();
                      AXConvertOutgoingValue(94100);
                      v34 = (void *)objc_claimAutoreleasedReturnValue();

                      if (v34)
                        objc_msgSend(v11, "setObject:forKey:", v34, v32);

                    }
                    v29 = objc_msgSend(v28, "countByEnumeratingWithState:objects:count:", &v84, v129, 16);
                  }
                  while (v29);
                }

                goto LABEL_252;
              }
              objc_opt_class();
              if ((objc_opt_isKindOfClass() & 1) == 0)
                goto LABEL_243;
            }
LABEL_250:
            v10 = v4;
            goto LABEL_251;
          }
          goto LABEL_181;
        }
LABEL_243:
        valuePtr = 0u;
        v123 = 0u;
        objc_msgSend(v4, "rectValue");
        *(_QWORD *)&valuePtr = v78;
        *((_QWORD *)&valuePtr + 1) = v79;
        *(_QWORD *)&v123 = v80;
        *((_QWORD *)&v123 + 1) = v81;
        v10 = AXValueCreate(kAXValueTypeCGRect, &valuePtr);
        goto LABEL_251;
      }
LABEL_181:
      valuePtr = 0uLL;
      *(_QWORD *)&valuePtr = objc_msgSend(v4, "rangeValue");
      *((_QWORD *)&valuePtr + 1) = v52;
      v10 = AXValueCreate(kAXValueTypeCFRange, &valuePtr);
      goto LABEL_251;
    }
    if (a1 <= 5000)
    {
      switch(a1)
      {
        case 3002:
        case 3004:
        case 3011:
        case 3012:
        case 3023:
        case 3024:
        case 3027:
        case 3037:
        case 3043:
        case 3049:
        case 3054:
        case 3055:
        case 3056:
        case 3057:
        case 3060:
        case 3061:
          goto LABEL_199;
        case 3003:
        case 3005:
        case 3006:
        case 3007:
        case 3008:
        case 3009:
        case 3010:
        case 3013:
        case 3014:
        case 3016:
        case 3017:
        case 3018:
        case 3019:
        case 3020:
        case 3021:
        case 3026:
        case 3028:
        case 3030:
        case 3033:
        case 3034:
        case 3035:
        case 3036:
        case 3038:
        case 3039:
        case 3040:
        case 3041:
        case 3042:
        case 3044:
        case 3045:
        case 3047:
        case 3048:
        case 3050:
        case 3052:
        case 3053:
        case 3059:
          goto LABEL_250;
        case 3015:
        case 3022:
        case 3025:
        case 3029:
        case 3031:
        case 3032:
          goto LABEL_182;
        case 3046:
        case 3051:
          goto LABEL_116;
        case 3058:
          goto LABEL_243;
        case 3062:
LABEL_23:
          v10 = (id)_AXCreateAXUIElementWithElementUsingLocalRemoteElement(v4);
          goto LABEL_251;
        default:
          if (a1 == 3070)
            goto LABEL_182;
          if (a1 == 4005)
            goto LABEL_181;
          goto LABEL_250;
      }
    }
    if (a1 <= 5039)
    {
      switch(a1)
      {
        case 5001:
        case 5016:
        case 5017:
          goto LABEL_116;
        case 5002:
        case 5010:
        case 5024:
          goto LABEL_199;
        case 5007:
        case 5008:
        case 5026:
        case 5027:
          goto LABEL_177;
        case 5025:
          goto LABEL_182;
        default:
          goto LABEL_250;
      }
    }
    if (a1 <= 8999)
    {
      if ((unint64_t)(a1 - 5040) > 0x20)
        goto LABEL_250;
      if (((1 << (a1 + 80)) & 0x220C011) == 0)
      {
        if (a1 != 5064)
        {
          if (a1 != 5072)
            goto LABEL_250;
          goto LABEL_178;
        }
        goto LABEL_177;
      }
      goto LABEL_199;
    }
    if (a1 <= 12016)
    {
      if (a1 == 9000)
        goto LABEL_243;
      if (a1 != 12002)
        goto LABEL_250;
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0 && objc_msgSend(v4, "count"))
      {
        objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", objc_msgSend(v4, "count"));
        v11 = (id)objc_claimAutoreleasedReturnValue();
        v90 = 0u;
        v91 = 0u;
        v88 = 0u;
        v89 = 0u;
        v43 = v4;
        v44 = objc_msgSend(v43, "countByEnumeratingWithState:objects:count:", &v88, v130, 16);
        if (v44)
        {
          v45 = *(_QWORD *)v89;
          do
          {
            for (m = 0; m != v44; ++m)
            {
              if (*(_QWORD *)v89 != v45)
                objc_enumerationMutation(v43);
              v47 = (const void *)_AXCreateAXUIElementWithElement(*(void **)(*((_QWORD *)&v88 + 1) + 8 * m));
              objc_msgSend(v11, "addObject:", v47);
              if (v47)
                CFRelease(v47);
            }
            v44 = objc_msgSend(v43, "countByEnumeratingWithState:objects:count:", &v88, v130, 16);
          }
          while (v44);
        }

        goto LABEL_252;
      }
      goto LABEL_230;
    }
    if (a1 == 12017)
      goto LABEL_199;
    if (a1 != 14000)
      goto LABEL_250;
LABEL_182:
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v11 = (id)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v108 = 0u;
      v109 = 0u;
      v106 = 0u;
      v107 = 0u;
      v53 = v4;
      v54 = objc_msgSend(v53, "countByEnumeratingWithState:objects:count:", &v106, v133, 16);
      if (v54)
      {
        v55 = *(_QWORD *)v107;
        do
        {
          for (n = 0; n != v54; ++n)
          {
            if (*(_QWORD *)v107 != v55)
              objc_enumerationMutation(v53);
            v57 = (void *)_AXCreateAXUIElementWithElement(*(void **)(*((_QWORD *)&v106 + 1) + 8 * n));
            if (v57)
              objc_msgSend(v11, "addObject:", v57);

          }
          v54 = objc_msgSend(v53, "countByEnumeratingWithState:objects:count:", &v106, v133, 16);
        }
        while (v54);
      }

    }
    goto LABEL_252;
  }
  if (a1 <= 2091)
  {
    if (a1 > 2002)
    {
      if (a1 <= 2049)
      {
        switch(a1)
        {
          case 2003:
            goto LABEL_243;
          case 2004:
          case 2006:
          case 2008:
          case 2009:
          case 2010:
          case 2013:
          case 2016:
          case 2018:
          case 2019:
          case 2020:
          case 2021:
          case 2022:
          case 2023:
          case 2025:
          case 2029:
          case 2030:
          case 2031:
          case 2032:
          case 2034:
          case 2035:
            goto LABEL_250;
          case 2005:
          case 2027:
          case 2028:
            goto LABEL_181;
          case 2007:
            goto LABEL_177;
          case 2011:
          case 2012:
          case 2014:
          case 2015:
          case 2017:
          case 2024:
          case 2026:
          case 2033:
          case 2036:
            goto LABEL_199;
          default:
            if (a1 != 2042)
              goto LABEL_250;
            NSClassFromString((NSString *)CFSTR("UIBezierPath"));
            if ((objc_opt_isKindOfClass() & 1) == 0)
              goto LABEL_230;
            objc_msgSend(v4, "CGPath");
            v10 = (id)objc_claimAutoreleasedReturnValue();
            break;
        }
        goto LABEL_251;
      }
      if (a1 > 2065)
      {
        switch(a1)
        {
          case 2076:
          case 2080:
            goto LABEL_199;
          case 2077:
          case 2079:
          case 2081:
          case 2082:
          case 2083:
            goto LABEL_250;
          case 2078:
            goto LABEL_181;
          case 2084:
            goto LABEL_116;
          default:
            if (a1 == 2066)
              goto LABEL_199;
            if (a1 == 2070)
              goto LABEL_177;
            goto LABEL_250;
        }
      }
      if (a1 == 2050 || a1 == 2057)
        goto LABEL_243;
      if (a1 != 2062)
        goto LABEL_250;
      goto LABEL_177;
    }
    if (a1 <= 1099)
    {
      if ((unint64_t)(a1 - 1000) > 0xB)
        goto LABEL_250;
      v35 = 1 << (a1 + 24);
      v36 = 3811;
      goto LABEL_158;
    }
    if (a1 <= 1511)
    {
      v22 = a1 - 76;
      if ((unint64_t)(a1 - 1100) > 7)
        goto LABEL_250;
      if (((1 << v22) & 0x2D) != 0)
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          objc_msgSend(MEMORY[0x1E0C99DE8], "array");
          v11 = (id)objc_claimAutoreleasedReturnValue();
          v116 = 0u;
          v117 = 0u;
          v114 = 0u;
          v115 = 0u;
          v23 = v4;
          v24 = objc_msgSend(v23, "countByEnumeratingWithState:objects:count:", &v114, v135, 16);
          if (v24)
          {
            v25 = *(_QWORD *)v115;
            do
            {
              for (ii = 0; ii != v24; ++ii)
              {
                if (*(_QWORD *)v115 != v25)
                  objc_enumerationMutation(v23);
                AXConvertPidToAXElement(*(void **)(*((_QWORD *)&v114 + 1) + 8 * ii));
                v27 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v11, "addObject:", v27);

              }
              v24 = objc_msgSend(v23, "countByEnumeratingWithState:objects:count:", &v114, v135, 16);
            }
            while (v24);
          }

          goto LABEL_252;
        }
        goto LABEL_230;
      }
      v35 = 1 << v22;
      v36 = 146;
LABEL_158:
      if ((v35 & v36) == 0)
        goto LABEL_250;
LABEL_159:
      AXConvertPidToAXElement(v4);
      v10 = (id)objc_claimAutoreleasedReturnValue();
LABEL_251:
      v11 = v10;
      goto LABEL_252;
    }
    if (a1 != 1512)
    {
      if (a1 != 1513 && a1 != 1990)
        goto LABEL_250;
      goto LABEL_199;
    }
LABEL_177:
    valuePtr = 0uLL;
    objc_msgSend(v4, "pointValue");
    *(_QWORD *)&valuePtr = v48;
    *((_QWORD *)&valuePtr + 1) = v49;
    v10 = AXValueCreate(kAXValueTypeCGPoint, &valuePtr);
    goto LABEL_251;
  }
  if (a1 <= 2166)
  {
    if (a1 > 2123)
    {
      if (a1 <= 2141)
      {
        switch(a1)
        {
          case 2124:
            goto LABEL_181;
          case 2125:
          case 2132:
            goto LABEL_199;
          case 2126:
            goto LABEL_116;
          case 2130:
            goto LABEL_243;
          default:
            goto LABEL_250;
        }
      }
      if ((unint64_t)(a1 - 2154) >= 3 && (unint64_t)(a1 - 2142) >= 2)
      {
        if (a1 != 2149)
          goto LABEL_250;
        goto LABEL_243;
      }
      goto LABEL_199;
    }
    if (a1 > 2103)
    {
      if ((unint64_t)(a1 - 2106) >= 4 && a1 != 2104 && a1 != 2113)
        goto LABEL_250;
      goto LABEL_199;
    }
    if (a1 > 2095)
    {
      if (a1 != 2096 && a1 != 2099)
        goto LABEL_250;
      goto LABEL_199;
    }
    if (a1 == 2092)
      goto LABEL_199;
    if (a1 != 2095)
      goto LABEL_250;
    goto LABEL_182;
  }
  if (a1 > 2215)
  {
    if (a1 > 2599)
    {
      if (a1 <= 2709)
      {
        if (a1 != 2600)
        {
          if (a1 != 2709)
            goto LABEL_250;
          goto LABEL_243;
        }
      }
      else if ((unint64_t)(a1 - 2710) >= 2 && a1 != 2714)
      {
        goto LABEL_250;
      }
      goto LABEL_199;
    }
    if (a1 <= 2309)
    {
      if (a1 != 2216)
      {
        if (a1 != 2236)
          goto LABEL_250;
        goto LABEL_243;
      }
      goto LABEL_181;
    }
    if ((unint64_t)(a1 - 2310) <= 3 && a1 != 2311)
    {
LABEL_199:
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        objc_msgSend(MEMORY[0x1E0C99DE8], "array");
        v58 = (void *)objc_claimAutoreleasedReturnValue();
        v103[0] = MEMORY[0x1E0C809B0];
        v103[1] = 3221225472;
        v103[2] = __AXConvertOutgoingValue_block_invoke_2;
        v103[3] = &unk_1E69194A8;
        v105 = a1;
        v59 = v58;
        v104 = v59;
        objc_msgSend(v4, "enumerateObjectsUsingBlock:", v103);
        if (objc_msgSend(v59, "count"))
          v11 = v59;
        else
          v11 = 0;

        goto LABEL_252;
      }
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
        v11 = (id)objc_claimAutoreleasedReturnValue();
        v101 = 0u;
        v102 = 0u;
        v99 = 0u;
        v100 = 0u;
        v60 = v4;
        v61 = objc_msgSend(v60, "countByEnumeratingWithState:objects:count:", &v99, v132, 16);
        if (v61)
        {
          v62 = *(_QWORD *)v100;
          do
          {
            for (jj = 0; jj != v61; ++jj)
            {
              if (*(_QWORD *)v100 != v62)
                objc_enumerationMutation(v60);
              v64 = *(_QWORD *)(*((_QWORD *)&v99 + 1) + 8 * jj);
              objc_msgSend(v60, "objectForKey:", v64);
              v65 = (void *)objc_claimAutoreleasedReturnValue();
              AXConvertOutgoingValue(a1);
              v66 = (void *)objc_claimAutoreleasedReturnValue();

              if (v66)
                objc_msgSend(v11, "setObject:forKey:", v66, v64);

            }
            v61 = objc_msgSend(v60, "countByEnumeratingWithState:objects:count:", &v99, v132, 16);
          }
          while (v61);
        }

        goto LABEL_252;
      }
      if (!v4
        || (v67 = CFGetTypeID(v4), v67 != AXUIElementGetTypeID())
        && (v68 = CFGetTypeID(v4), v68 != AXValueGetTypeID())
        && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0)
        && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0)
        && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
LABEL_220:
          AXUIElementConvertOutgoingType(v4);
          v10 = (id)objc_claimAutoreleasedReturnValue();
        }
        else
        {
LABEL_258:
          v10 = (id)_AXCreateAXUIElementWithElement(v4);
        }
        goto LABEL_251;
      }
      goto LABEL_250;
    }
    if (a1 != 2502)
      goto LABEL_250;
    goto LABEL_177;
  }
  if (a1 <= 2182)
  {
    if (a1 > 2180)
    {
      if (a1 == 2181)
      {
LABEL_178:
        valuePtr = 0uLL;
        objc_msgSend(v4, "sizeValue");
        *(_QWORD *)&valuePtr = v50;
        *((_QWORD *)&valuePtr + 1) = v51;
        v10 = AXValueCreate(kAXValueTypeCGSize, &valuePtr);
        goto LABEL_251;
      }
      goto LABEL_177;
    }
    if (a1 != 2167)
    {
      if (a1 != 2171)
        goto LABEL_250;
      goto LABEL_243;
    }
    goto LABEL_199;
  }
  if (a1 > 2196)
  {
    if (a1 != 2197 && a1 != 2202 && a1 != 2208)
      goto LABEL_250;
    goto LABEL_199;
  }
  if ((unint64_t)(a1 - 2183) < 2)
    goto LABEL_199;
  if (a1 != 2196)
    goto LABEL_250;
LABEL_116:
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v11 = (id)objc_claimAutoreleasedReturnValue();
    v112 = 0u;
    v113 = 0u;
    v110 = 0u;
    v111 = 0u;
    v37 = v4;
    v38 = objc_msgSend(v37, "countByEnumeratingWithState:objects:count:", &v110, v134, 16);
    if (v38)
    {
      v39 = *(_QWORD *)v111;
      do
      {
        for (kk = 0; kk != v38; ++kk)
        {
          if (*(_QWORD *)v111 != v39)
            objc_enumerationMutation(v37);
          v41 = *(void **)(*((_QWORD *)&v110 + 1) + 8 * kk);
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
          {
            objc_msgSend(v11, "addObject:", v41);
          }
          else
          {
            v42 = (const void *)_AXCreateAXUIElementWithElement(v41);
            if (v42)
            {
              objc_msgSend(v11, "addObject:", v42);
              CFRelease(v42);
            }
          }
        }
        v38 = objc_msgSend(v37, "countByEnumeratingWithState:objects:count:", &v110, v134, 16);
      }
      while (v38);
    }

    goto LABEL_252;
  }
LABEL_230:
  v11 = 0;
LABEL_252:

  return v11;
}

void sub_1B54BCFF0(_Unwind_Exception *a1)
{
  _Block_object_dispose(&STACK[0x290], 8);
  _Unwind_Resume(a1);
}

uint64_t AXRuntimeIsAppleTV()
{
  return 0;
}

Class __getBKSHIDEventAuthenticationMessageClass_block_invoke(uint64_t a1)
{
  Class result;
  void *v3;
  __int128 v4;
  uint64_t v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  v3 = 0;
  if (!BackBoardServicesLibraryCore_frameworkLibrary)
  {
    v4 = xmmword_1E69194F0;
    v5 = 0;
    BackBoardServicesLibraryCore_frameworkLibrary = _sl_dlopen();
  }
  if (!BackBoardServicesLibraryCore_frameworkLibrary)
    __getBKSHIDEventAuthenticationMessageClass_block_invoke_cold_1(&v3);
  result = objc_getClass("BKSHIDEventAuthenticationMessage");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
    __getBKSHIDEventAuthenticationMessageClass_block_invoke_cold_2();
  getBKSHIDEventAuthenticationMessageClass_softClass = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  return result;
}

uint64_t _accessibilityNotificationCallback(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, void *a5)
{
  return objc_msgSend(a5, "_didObserveNotification:notificationData:");
}

void OUTLINED_FUNCTION_1_1(void *a1, uint64_t a2, os_log_t log, const char *a4, ...)
{
  va_list va;

  va_start(va, a4);
  _os_log_error_impl(a1, log, OS_LOG_TYPE_ERROR, a4, (uint8_t *)va, 0x12u);
}

uint64_t AXSerializeCFType(void *a1, uint64_t a2, int a3, void **a4, _QWORD *a5, size_t *a6)
{
  uint64_t (*SerializeMethodForType)(void *, uint64_t);
  uint64_t (*v12)(void *, uint64_t);
  int v13;
  size_t v14;
  char *v15;
  uint64_t v16;
  _BYTE *v17;
  char *v18;
  void *v20;
  char *v21;
  size_t v22;
  uint64_t v23;
  CFTypeRef cf;

  *a5 = 0;
  SerializeMethodForType = getSerializeMethodForType(a1);
  if (!SerializeMethodForType)
    return 4294942095;
  v12 = SerializeMethodForType;
  v13 = a3 << 12;
  if (!a3)
    v13 = 81920;
  v14 = v13;
  v20 = 0;
  v21 = 0;
  v22 = 0;
  v23 = v13;
  v15 = (char *)*a4;
  if (*a4)
  {
    v20 = *a4;
    v14 = *a6;
  }
  else
  {
    v15 = (char *)mmap(0, v13, 3, 4098, -1, 0);
    v20 = v15;
    if (v15 == (char *)-1)
      return 4294942096;
  }
  v22 = v14;
  cf = 0;
  *(_DWORD *)v15 = 1634036833;
  v21 = v15 + 4;
  v16 = v12(a1, (uint64_t)&v20);
  if ((_DWORD)v16 && !*a4)
  {
    munmap(v20, v22);
    *a4 = 0;
    *a6 = 0;
  }
  else
  {
    v17 = v20;
    v18 = v21;
    *a4 = v20;
    *a6 = v22;
    *a5 = v18 - v17;
  }
  if (cf)
    CFRelease(cf);
  return v16;
}

uint64_t (*getSerializeMethodForType(const void *a1))(void *a1, uint64_t a2)
{
  CFTypeID v1;
  CFTypeID TypeID;

  v1 = CFGetTypeID(a1);
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    TypeID = CFUUIDGetTypeID();
  }
  else
  {
    NSClassFromString((NSString *)CFSTR("UIFont"));
    if ((objc_opt_isKindOfClass() & 1) == 0)
      goto LABEL_6;
    TypeID = CTFontGetTypeID();
  }
  v1 = TypeID;
LABEL_6:
  if (getSerializeMethodForType_onceToken != -1)
    dispatch_once(&getSerializeMethodForType_onceToken, &__block_literal_global_5);
  if (AXIsAXAttributedString())
    return cfAttributedStringSerialize;
  else
    return (uint64_t (*)(void *, uint64_t))CFDictionaryGetValue((CFDictionaryRef)getSerializeMethodForType_SerializeLookup, (const void *)objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLong:", v1));
}

uint64_t SerializeCFType(void *a1, void **a2, size_t *a3)
{
  uint64_t v4;

  *a3 = 0;
  *a2 = 0;
  return AXSerializeCFType(a1, (uint64_t)a2, 0, a2, &v4, a3);
}

uint64_t AXUnserializeCFType(uint64_t a1, uint64_t a2, unsigned int *a3, unint64_t a4, _QWORD *a5)
{
  NSObject *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  unsigned int v14;
  _BOOL8 v15;
  unsigned int v16;
  unsigned int v17;
  unsigned int v19;
  unsigned int *v20;

  if (a4 > 7)
  {
    *a5 = 0;
    v14 = *a3;
    v15 = *a3 != 1634036833 && *a3 != 1870095726;
    v17 = a3[1];
    v16 = v17;
    v20 = a3 + 1;
    v19 = v17;
    if (v14 != 1634036833 && v14 != 1870095726)
    {
      v16 = bswap32(v19);
      v14 = bswap32(v14);
    }
    if (v16 <= 0xF)
      return ((uint64_t (*)(uint64_t, unsigned int **, unint64_t, _QWORD *, _BOOL8, BOOL))sUnserializeFunctions[v16])(a1, &v20, a4 - 4, a5, v15, v14 == 1870095726);
    else
      return ((uint64_t (*)(uint64_t, unsigned int **, unint64_t, _QWORD *, _BOOL8, BOOL))bogusUnserialize)(a1, &v20, a4 - 4, a5, v15, v14 == 1870095726);
  }
  else
  {
    AXRuntimeLogSerialization();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      AXUnserializeCFType_cold_1(v5, v6, v7, v8, v9, v10, v11, v12);

    return 4294942095;
  }
}

void _logAndReturn(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  AXRuntimeLogSerialization();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
    _logAndReturn_cold_1(a1, v2, v3, v4, v5, v6, v7, v8);

}

uint64_t UnserializeCFType(unsigned int *a1, unint64_t a2, _QWORD *a3)
{
  return AXUnserializeCFType(0, a2, a1, a2, a3);
}

void __getSerializeMethodForType_block_invoke()
{
  __CFDictionary *Mutable;
  const void *v1;
  __CFDictionary *v2;
  const void *v3;
  __CFDictionary *v4;
  const void *v5;
  __CFDictionary *v6;
  const void *v7;
  __CFDictionary *v8;
  const void *v9;
  __CFDictionary *v10;
  const void *v11;
  __CFDictionary *v12;
  const void *v13;
  __CFDictionary *v14;
  const void *v15;
  __CFDictionary *v16;
  const void *v17;
  __CFDictionary *v18;
  const void *v19;
  __CFDictionary *v20;
  const void *v21;
  __CFDictionary *v22;
  const void *v23;
  __CFDictionary *v24;
  const void *v25;
  __CFDictionary *v26;
  const void *v27;
  __CFDictionary *v28;
  const void *v29;
  __CFDictionary *v30;
  const void *v31;

  Mutable = CFDictionaryCreateMutable((CFAllocatorRef)*MEMORY[0x1E0C9AE00], 0, MEMORY[0x1E0C9B390], 0);
  getSerializeMethodForType_SerializeLookup = (uint64_t)Mutable;
  v1 = (const void *)objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLong:", CFStringGetTypeID());
  CFDictionarySetValue(Mutable, v1, cfStringSerialize);
  v2 = (__CFDictionary *)getSerializeMethodForType_SerializeLookup;
  v3 = (const void *)objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLong:", CFNumberGetTypeID());
  CFDictionarySetValue(v2, v3, cfNumberSerialize);
  v4 = (__CFDictionary *)getSerializeMethodForType_SerializeLookup;
  v5 = (const void *)objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLong:", CFBooleanGetTypeID());
  CFDictionarySetValue(v4, v5, cfBooleanSerialize);
  v6 = (__CFDictionary *)getSerializeMethodForType_SerializeLookup;
  v7 = (const void *)objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLong:", AXUIElementGetTypeID());
  CFDictionarySetValue(v6, v7, axUIElementSerialize);
  v8 = (__CFDictionary *)getSerializeMethodForType_SerializeLookup;
  v9 = (const void *)objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLong:", AXValueGetTypeID());
  CFDictionarySetValue(v8, v9, axValueSerialize);
  v10 = (__CFDictionary *)getSerializeMethodForType_SerializeLookup;
  v11 = (const void *)objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLong:", CFArrayGetTypeID());
  CFDictionarySetValue(v10, v11, cfArraySerialize);
  v12 = (__CFDictionary *)getSerializeMethodForType_SerializeLookup;
  v13 = (const void *)objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLong:", CFDictionaryGetTypeID());
  CFDictionarySetValue(v12, v13, cfDictionarySerialize);
  v14 = (__CFDictionary *)getSerializeMethodForType_SerializeLookup;
  v15 = (const void *)objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLong:", CFDataGetTypeID());
  CFDictionarySetValue(v14, v15, cfDataSerialize);
  v16 = (__CFDictionary *)getSerializeMethodForType_SerializeLookup;
  v17 = (const void *)objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLong:", CFDateGetTypeID());
  CFDictionarySetValue(v16, v17, cfDateSerialize);
  v18 = (__CFDictionary *)getSerializeMethodForType_SerializeLookup;
  v19 = (const void *)objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLong:", CFURLGetTypeID());
  CFDictionarySetValue(v18, v19, cfURLSerialize);
  v20 = (__CFDictionary *)getSerializeMethodForType_SerializeLookup;
  v21 = (const void *)objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLong:", CFUUIDGetTypeID());
  CFDictionarySetValue(v20, v21, cfUUIDSerialize);
  v22 = (__CFDictionary *)getSerializeMethodForType_SerializeLookup;
  v23 = (const void *)objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLong:", CFNullGetTypeID());
  CFDictionarySetValue(v22, v23, cfNullSerialize);
  v24 = (__CFDictionary *)getSerializeMethodForType_SerializeLookup;
  v25 = (const void *)objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLong:", CFAttributedStringGetTypeID());
  CFDictionarySetValue(v24, v25, cfAttributedStringSerialize);
  v26 = (__CFDictionary *)getSerializeMethodForType_SerializeLookup;
  v27 = (const void *)objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLong:", CGColorGetTypeID());
  CFDictionarySetValue(v26, v27, cgColorSerialize);
  v28 = (__CFDictionary *)getSerializeMethodForType_SerializeLookup;
  v29 = (const void *)objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLong:", CGPathGetTypeID());
  CFDictionarySetValue(v28, v29, cgPathSerialize);
  v30 = (__CFDictionary *)getSerializeMethodForType_SerializeLookup;
  v31 = (const void *)objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLong:", CTFontGetTypeID());
  CFDictionarySetValue(v30, v31, ctFontSerialize);
}

uint64_t cfStringSerialize(const __CFString *a1, vm_address_t *a2)
{
  CFIndex Length;
  vm_address_t v5;
  UniChar *v6;
  CFRange v8;

  Length = CFStringGetLength(a1);
  if (!reserveSpace(a2, 2 * Length + 12))
  {
    v5 = a2[1];
    *(_DWORD *)v5 = 0;
    *(_QWORD *)(v5 + 4) = Length;
    v6 = (UniChar *)(a2[1] + 12);
    a2[1] = (vm_address_t)v6;
    v8.location = 0;
    v8.length = Length;
    CFStringGetCharacters(a1, v8, v6);
    a2[1] += 2 * Length;
  }
  return 0;
}

uint64_t cfNumberSerialize(const __CFNumber *a1, vm_address_t *a2)
{
  unsigned int Type;
  CFIndex ByteSize;
  uint64_t result;
  vm_address_t v7;
  void *v8;

  Type = CFNumberGetType(a1);
  ByteSize = CFNumberGetByteSize(a1);
  result = reserveSpace(a2, ByteSize + 16);
  if (!(_DWORD)result)
  {
    v7 = a2[1];
    *(_DWORD *)v7 = 1;
    *(_DWORD *)(v7 + 4) = Type;
    *(_QWORD *)(v7 + 8) = ByteSize;
    v8 = (void *)(a2[1] + 16);
    a2[1] = (vm_address_t)v8;
    if (CFNumberGetValue(a1, (CFNumberType)Type, v8))
    {
      result = 0;
      a2[1] += ByteSize;
    }
    else
    {
      return 4294942096;
    }
  }
  return result;
}

uint64_t cfBooleanSerialize(const __CFBoolean *a1, vm_address_t *a2)
{
  Boolean Value;
  uint64_t result;
  vm_address_t v5;

  Value = CFBooleanGetValue(a1);
  result = reserveSpace(a2, 5);
  if (!(_DWORD)result)
  {
    v5 = a2[1];
    *(_DWORD *)v5 = 2;
    *(_BYTE *)(v5 + 4) = Value;
    a2[1] += 5;
  }
  return result;
}

__n128 axUIElementSerialize(uint64_t a1, vm_address_t *a2)
{
  int v3;
  __n128 result;
  vm_address_t v5;
  __n128 v6;

  v3 = *(_DWORD *)(a1 + 16);
  v6 = *(__n128 *)(a1 + 20);
  if (!reserveSpace(a2, 24))
  {
    v5 = a2[1];
    *(_DWORD *)v5 = 10;
    *(_DWORD *)(v5 + 4) = v3;
    result = v6;
    *(__n128 *)(v5 + 8) = v6;
    a2[1] += 24;
  }
  return result;
}

uint64_t axValueSerialize(_DWORD *a1, vm_address_t *a2)
{
  size_t v4;
  int v5;
  uint64_t v6;
  _DWORD *v7;
  void *v8;

  v5 = a1[4];
  v4 = a1[5];
  v6 = reserveSpace(a2, v4 + 12);
  if (!(_DWORD)v6)
  {
    v7 = (_DWORD *)a2[1];
    *v7 = 11;
    v7[1] = v5;
    v7[2] = v4;
    v8 = (void *)(a2[1] + 12);
    a2[1] = (vm_address_t)v8;
    memmove(v8, a1 + 6, v4);
    a2[1] += v4;
  }
  return v6;
}

uint64_t cfArraySerialize(const __CFArray *a1, uint64_t a2)
{
  uint64_t Count;
  const __CFDictionary *v5;
  uint64_t v6;
  __CFDictionary *Mutable;
  uint64_t v8;
  _QWORD v10[2];
  CFRange v11;

  Count = CFArrayGetCount(a1);
  v5 = *(const __CFDictionary **)(a2 + 32);
  if (v5)
  {
    if (CFDictionaryGetValue(v5, a1))
      return 4294942095;
    Mutable = *(__CFDictionary **)(a2 + 32);
  }
  else
  {
    Mutable = CFDictionaryCreateMutable(0, 0, 0, 0);
    *(_QWORD *)(a2 + 32) = Mutable;
  }
  CFDictionarySetValue(Mutable, a1, (const void *)1);
  v6 = reserveSpace((vm_address_t *)a2, 12);
  if (!(_DWORD)v6)
  {
    v8 = *(_QWORD *)(a2 + 8);
    *(_DWORD *)v8 = 3;
    *(_QWORD *)(v8 + 4) = Count;
    *(_QWORD *)(a2 + 8) += 12;
    if (Count < 1)
    {
      v6 = 0;
    }
    else
    {
      v10[0] = 0;
      v10[1] = a2;
      v11.location = 0;
      v11.length = Count;
      CFArrayApplyFunction(a1, v11, (CFArrayApplierFunction)serializeArrayApplier, v10);
      v6 = LODWORD(v10[0]);
    }
    CFDictionaryRemoveValue(*(CFMutableDictionaryRef *)(a2 + 32), a1);
  }
  return v6;
}

uint64_t cfDictionarySerialize(const __CFDictionary *a1, uint64_t a2)
{
  CFIndex Count;
  const __CFDictionary *v5;
  uint64_t v6;
  __CFDictionary *Mutable;
  uint64_t v8;
  _QWORD v10[2];

  Count = CFDictionaryGetCount(a1);
  v5 = *(const __CFDictionary **)(a2 + 32);
  if (v5)
  {
    if (CFDictionaryGetValue(v5, a1))
      return 4294942095;
    Mutable = *(__CFDictionary **)(a2 + 32);
  }
  else
  {
    Mutable = CFDictionaryCreateMutable(0, 0, 0, 0);
    *(_QWORD *)(a2 + 32) = Mutable;
  }
  CFDictionarySetValue(Mutable, a1, (const void *)1);
  v6 = reserveSpace((vm_address_t *)a2, 12);
  if (!(_DWORD)v6)
  {
    v8 = *(_QWORD *)(a2 + 8);
    *(_DWORD *)v8 = 4;
    *(_QWORD *)(v8 + 4) = Count;
    *(_QWORD *)(a2 + 8) += 12;
    if (Count < 1)
    {
      v6 = 0;
    }
    else
    {
      v10[0] = 0;
      v10[1] = a2;
      CFDictionaryApplyFunction(a1, (CFDictionaryApplierFunction)serializeDictApplier, v10);
      v6 = LODWORD(v10[0]);
    }
    CFDictionaryRemoveValue(*(CFMutableDictionaryRef *)(a2 + 32), a1);
  }
  return v6;
}

uint64_t cfDataSerialize(const __CFData *a1, vm_address_t *a2)
{
  CFIndex Length;
  uint64_t v5;
  vm_address_t v6;
  UInt8 *v7;
  CFRange v9;

  Length = CFDataGetLength(a1);
  v5 = reserveSpace(a2, Length + 12);
  if (!(_DWORD)v5)
  {
    v6 = a2[1];
    *(_DWORD *)v6 = 5;
    *(_QWORD *)(v6 + 4) = Length;
    v7 = (UInt8 *)(a2[1] + 12);
    a2[1] = (vm_address_t)v7;
    v9.location = 0;
    v9.length = Length;
    CFDataGetBytes(a1, v9, v7);
    a2[1] += Length;
  }
  return v5;
}

uint64_t cfDateSerialize(uint64_t a1, vm_address_t *a2)
{
  double v3;
  uint64_t result;
  vm_address_t v5;

  v3 = MEMORY[0x1B5E4AD6C]();
  result = reserveSpace(a2, 12);
  if (!(_DWORD)result)
  {
    v5 = a2[1];
    *(_DWORD *)v5 = 6;
    *(double *)(v5 + 4) = v3;
    a2[1] += 12;
  }
  return result;
}

uint64_t cfURLSerialize(const __CFURL *a1, vm_address_t *a2)
{
  const __CFURL *v4;
  const __CFString *v5;
  uint64_t v6;
  char v7;
  vm_address_t v8;
  const __CFString *v9;

  v4 = CFURLGetBaseURL(a1);
  if (v4)
    v5 = CFURLGetString(v4);
  else
    v5 = 0;
  v6 = reserveSpace(a2, 5);
  if (!(_DWORD)v6)
  {
    if (v5)
      v7 = 2;
    else
      v7 = 1;
    v8 = a2[1];
    *(_DWORD *)v8 = 7;
    *(_BYTE *)(v8 + 4) = v7;
    a2[1] += 5;
    v9 = CFURLGetString(a1);
    cfStringSerialize(v9, a2);
    if (v5)
      cfStringSerialize(v5, a2);
  }
  return v6;
}

uint64_t cfUUIDSerialize(void *a1, uint64_t a2)
{
  const __CFString *v4;
  CFUUIDRef v5;
  uint64_t v6;
  const __CFData *v7;
  CFUUIDBytes v9;

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v4 = (const __CFString *)objc_msgSend(a1, "UUIDString");
    v5 = CFUUIDCreateFromString((CFAllocatorRef)*MEMORY[0x1E0C9AE00], v4);
    a1 = (void *)CFAutorelease(v5);
  }
  v6 = reserveSpace((vm_address_t *)a2, 4);
  if (!(_DWORD)v6)
  {
    **(_DWORD **)(a2 + 8) = 14;
    *(_QWORD *)(a2 + 8) += 4;
    v9 = CFUUIDGetUUIDBytes((CFUUIDRef)a1);
    v7 = CFDataCreate((CFAllocatorRef)*MEMORY[0x1E0C9AE00], &v9.byte0, 16);
    v6 = cfDataSerialize(v7, (vm_address_t *)a2);
    CFRelease(v7);
  }
  return v6;
}

uint64_t cfNullSerialize(uint64_t a1, uint64_t a2)
{
  uint64_t result;

  result = reserveSpace((vm_address_t *)a2, 4);
  if (!(_DWORD)result)
  {
    **(_DWORD **)(a2 + 8) = 8;
    *(_QWORD *)(a2 + 8) += 4;
  }
  return result;
}

uint64_t cfAttributedStringSerialize(void *a1, uint64_t a2)
{
  uint64_t NumberOfRuns;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  const __CFDictionary **v8;
  const __CFString *String;
  uint64_t v11;
  uint64_t v12;
  _QWORD v13[2];

  v13[1] = *MEMORY[0x1E0C80C00];
  if (AXIsAXAttributedString())
    a1 = (void *)AXGetCFAttributedStringFromAXAttributedString(a1);
  NumberOfRuns = _CFAttributedStringGetNumberOfRuns();
  if (NumberOfRuns < 0)
    return 4294942096;
  v5 = NumberOfRuns;
  v6 = reserveSpace((vm_address_t *)a2, (16 * NumberOfRuns) | 0xC);
  if (!(_DWORD)v6)
  {
    v7 = *(_QWORD *)(a2 + 8);
    *(_DWORD *)v7 = 9;
    *(_QWORD *)(v7 + 4) = v5;
    *(_QWORD *)(a2 + 8) += 12;
    if (v5 < 1)
    {
      v8 = 0;
    }
    else
    {
      v8 = (const __CFDictionary **)malloc_type_malloc(8 * v5, 0x6004044C4A2DFuLL);
      MEMORY[0x1E0C80A78]();
      _CFAttributedStringGetRuns();
      memmove(*(void **)(a2 + 8), &v13[-2 * v5], 16 * v5);
      *(_QWORD *)(a2 + 8) += 16 * v5;
    }
    String = CFAttributedStringGetString((CFAttributedStringRef)a1);
    cfStringSerialize(String, (vm_address_t *)a2);
    if (v8)
    {
      if (v5 < 1)
      {
        v6 = 0;
      }
      else
      {
        v11 = 0;
        do
        {
          v12 = cfDictionarySerialize(v8[v11], a2);
          v6 = v12;
          ++v11;
        }
        while (v11 < v5 && !(_DWORD)v12);
      }
      if (v5 >= 1)
        free(v8);
    }
    else
    {
      return 0;
    }
  }
  return v6;
}

uint64_t cgColorSerialize(CGColor *a1, vm_address_t *a2)
{
  unsigned int ProcessColorModel;
  unsigned int v5;
  unsigned int NumberOfComponents;
  size_t v7;
  uint64_t result;
  const CGFloat *Components;
  uint64_t *v10;
  uint64_t v11;
  uint64_t v12;
  char *v13;
  _QWORD *v14;
  uint64_t v15;
  _DWORD *v16;
  void *v17;
  _QWORD v18[2];

  v18[1] = *MEMORY[0x1E0C80C00];
  if (!CGColorGetColorSpace(a1))
    return 4294942096;
  ProcessColorModel = CGColorSpaceGetProcessColorModel();
  if (ProcessColorModel > 2)
    return 4294942095;
  v5 = ProcessColorModel;
  NumberOfComponents = CGColorGetNumberOfComponents(a1);
  v7 = 8 * NumberOfComponents;
  result = reserveSpace(a2, v7 + 12);
  if (!(_DWORD)result)
  {
    Components = CGColorGetComponents(a1);
    v10 = (uint64_t *)MEMORY[0x1E0C80A78](Components);
    v13 = (char *)v18 - ((v11 + 15) & 0xFFFFFFFF0);
    if (NumberOfComponents)
    {
      v14 = (_QWORD *)((char *)v18 - ((v11 + 15) & 0xFFFFFFFF0));
      do
      {
        v15 = *v10++;
        *v14++ = v15;
        --v12;
      }
      while (v12);
    }
    v16 = (_DWORD *)a2[1];
    *v16 = 12;
    v16[1] = v5;
    v16[2] = NumberOfComponents;
    v17 = (void *)(a2[1] + 12);
    a2[1] = (vm_address_t)v17;
    memmove(v17, v13, v7);
    a2[1] += v7;
    return 0;
  }
  return result;
}

uint64_t cgPathSerialize(const CGPath *a1, vm_address_t *a2)
{
  CFMutableDataRef Mutable;
  CFIndex Length;
  vm_address_t v6;
  UInt8 *v7;
  CFRange v9;

  Mutable = CFDataCreateMutable(0, 0);
  CGPathApply(a1, Mutable, (CGPathApplierFunction)__encodePathElementIntoData);
  Length = CFDataGetLength(Mutable);
  if (!reserveSpace(a2, Length + 12))
  {
    v6 = a2[1];
    *(_DWORD *)v6 = 13;
    *(_QWORD *)(v6 + 4) = Length;
    v7 = (UInt8 *)(a2[1] + 12);
    a2[1] = (vm_address_t)v7;
    v9.location = 0;
    v9.length = Length;
    CFDataGetBytes(Mutable, v9, v7);
    a2[1] += Length;
  }
  CFRelease(Mutable);
  return 0;
}

uint64_t ctFontSerialize(const __CTFont *a1, uint64_t a2)
{
  double Size;
  uint64_t result;
  const __CTFontDescriptor *v6;
  const __CFDictionary *v7;
  uint64_t v8;

  NSClassFromString((NSString *)CFSTR("UIFont"));
  objc_opt_isKindOfClass();
  Size = CTFontGetSize(a1);
  result = reserveSpace((vm_address_t *)a2, 8);
  if (!(_DWORD)result)
  {
    **(_QWORD **)(a2 + 8) = ((unint64_t)(int)Size << 32) | 0xF;
    *(_QWORD *)(a2 + 8) += 8;
    v6 = CTFontCopyFontDescriptor(a1);
    v7 = CTFontDescriptorCopyAttributes(v6);
    v8 = cfDictionarySerialize(v7, a2);
    CFRelease(v6);

    return v8;
  }
  return result;
}

uint64_t reserveSpace(vm_address_t *a1, uint64_t a2)
{
  vm_size_t v2;
  vm_size_t v4;
  vm_address_t v5;
  vm_size_t v6;
  vm_address_t v7;
  vm_address_t v8;
  BOOL v9;
  size_t v10;
  size_t v11;
  void *v12;
  vm_address_t v13;
  uint64_t result;

  v2 = a1[1] - *a1;
  if (!__CFADD__(a2, v2))
  {
    v4 = v2 + a2;
    if (v2 + a2 <= a1[2])
      return 0;
    v5 = a1[3];
    v6 = v4 % v5;
    v7 = v5 - v4 % v5;
    if (v6)
      v8 = v7;
    else
      v8 = 0;
    v9 = __CFADD__(v7, v4);
    v10 = v8 + v4;
    if (v9)
      v11 = 0;
    else
      v11 = v10;
    v12 = mmap(0, v11, 3, 4098, -1, 0);
    if (v12 != (void *)-1)
    {
      v13 = (vm_address_t)v12;
      vm_copy(*MEMORY[0x1E0C83DA0], *a1, v2, (vm_address_t)v12);
      munmap((void *)*a1, v2);
      result = 0;
      *a1 = v13;
      a1[1] = v2 + v13;
      a1[2] = v11;
      return result;
    }
  }
  return 4294942096;
}

void serializeArrayApplier(const __CFString *a1, uint64_t a2)
{
  void *v4;
  uint64_t (*SerializeMethodForType)(void *, uint64_t);
  uint64_t (*v6)(void *, uint64_t);
  int v7;

  v4 = (void *)MEMORY[0x1B5E4B708]();
  if (!*(_DWORD *)a2)
  {
    SerializeMethodForType = getSerializeMethodForType(a1);
    if (!SerializeMethodForType)
    {
      a1 = &stru_1E691BCF0;
      v6 = getSerializeMethodForType(&stru_1E691BCF0);
      if (!v6)
      {
        v7 = 9;
        goto LABEL_6;
      }
      SerializeMethodForType = v6;
    }
    v7 = SerializeMethodForType((void *)a1, *(_QWORD *)(a2 + 8));
LABEL_6:
    *(_DWORD *)a2 = v7;
  }
  objc_autoreleasePoolPop(v4);
}

void serializeDictApplier(uint64_t a1, const __CFString *a2, uint64_t a3)
{
  void *v6;
  uint64_t (*SerializeMethodForType)(uint64_t, _QWORD);
  int v8;
  uint64_t (*v9)(const __CFString *, _QWORD);
  uint64_t v10;
  int v11;

  v6 = (void *)MEMORY[0x1B5E4B708]();
  if (!*(_DWORD *)a3)
  {
    SerializeMethodForType = (uint64_t (*)(uint64_t, _QWORD))getSerializeMethodForType(a1);
    if (!SerializeMethodForType)
    {
      v11 = -25201;
      goto LABEL_9;
    }
    v8 = SerializeMethodForType(a1, *(_QWORD *)(a3 + 8));
    *(_DWORD *)a3 = v8;
    if (!v8)
    {
      v9 = (uint64_t (*)(const __CFString *, _QWORD))getSerializeMethodForType(a2);
      if (!v9)
      {
        a2 = &stru_1E691BCF0;
        v10 = getSerializeMethodForType(&stru_1E691BCF0);
        if (!v10)
        {
          v11 = 9;
          goto LABEL_9;
        }
        v9 = (uint64_t (*)(const __CFString *, _QWORD))v10;
      }
      v11 = v9(a2, *(_QWORD *)(a3 + 8));
LABEL_9:
      *(_DWORD *)a3 = v11;
    }
  }
  objc_autoreleasePoolPop(v6);
}

void __encodePathElementIntoData(__CFData *a1, int *a2)
{
  uint64_t v4;
  int v5;
  uint64_t v6;
  unint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  UInt8 v10[8];
  UInt8 v11[8];
  UInt8 v12[4];
  UInt8 bytes[4];

  *(_DWORD *)bytes = *a2;
  CFDataAppendBytes(a1, bytes, 4);
  v4 = *a2;
  if (v4 > 3)
    v5 = 0;
  else
    v5 = dword_1B54F04C0[v4];
  *(_DWORD *)v12 = v5;
  CFDataAppendBytes(a1, v12, 4);
  if (*(_DWORD *)v12)
  {
    v6 = 0;
    v7 = 0;
    do
    {
      v8 = (uint64_t *)(*((_QWORD *)a2 + 1) + v6);
      v9 = *v8;
      *(_QWORD *)v10 = v8[1];
      *(_QWORD *)v11 = v9;
      CFDataAppendBytes(a1, v11, 8);
      CFDataAppendBytes(a1, v10, 8);
      ++v7;
      v6 += 16;
    }
    while (v7 < *(unsigned int *)v12);
  }
}

uint64_t bogusUnserialize()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  AXRuntimeLogSerialization();
  v0 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v0, OS_LOG_TYPE_ERROR))
    bogusUnserialize_cold_1(v0, v1, v2, v3, v4, v5, v6, v7);

  return 4294942095;
}

uint64_t cfStringUnserialize(const __CFAllocator *a1, uint64_t *a2, unint64_t a3, CFStringRef *a4, int a5)
{
  NSObject *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v16;
  CFIndex v17;
  unsigned int v18;
  _BOOL4 v19;
  uint64_t v21;
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
  uint64_t v36;
  const UniChar *v37;
  CFIndex v38;
  _WORD *v39;
  uint64_t v40;
  CFStringRef v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;

  if (a3 <= 0xB)
  {
    AXRuntimeLogSerialization();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      cfStringUnserialize_cold_1(v5, v6, v7, v8, v9, v10, v11, v12);
LABEL_20:

    return 4294942096;
  }
  v16 = *a2;
  if (a5)
  {
    v17 = bswap64(*(_QWORD *)(v16 + 4));
    *(_QWORD *)(v16 + 4) = v17;
  }
  else
  {
    v17 = *(_QWORD *)(v16 + 4);
  }
  v18 = 2 * v17;
  v19 = HIDWORD(v17) != 0;
  if ((unint64_t)(2 * v17) >> 32)
    v19 = 1;
  if (HIDWORD(a3))
    v19 = 1;
  if ((v18 & 0xFFFFFFFC) > 0xFFFFFFF3uLL || v19)
  {
    AXRuntimeLogSerialization();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      cfStringUnserialize_cold_2(v5, v21, v22, v23, v24, v25, v26, v27);
    goto LABEL_20;
  }
  if ((int)a3 - 12 < v18)
  {
    AXRuntimeLogSerialization();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      cfStringUnserialize_cold_3(v5, v28, v29, v30, v31, v32, v33, v34);
    goto LABEL_20;
  }
  v36 = (v18 + 12) & 0xFFFFFFFE;
  v37 = (const UniChar *)(v16 + 12);
  if (a5 && v17 >= 1)
  {
    v38 = v17;
    v39 = (_WORD *)(v16 + 12);
    do
    {
      *v39 = bswap32((unsigned __int16)*v39) >> 16;
      ++v39;
      --v38;
    }
    while (v38);
  }
  *a4 = CFStringCreateWithCharacters(a1, v37, v17);
  v40 = *a2;
  *a2 += v36;
  v41 = *a4;
  if (__CFADD__(v36, v40))
  {
    if (v41)
    {
      CFRelease(v41);
      *a4 = 0;
    }
    AXRuntimeLogSerialization();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      cfStringUnserialize_cold_4(v5, v42, v43, v44, v45, v46, v47, v48);
    goto LABEL_20;
  }
  if (!v41)
  {
    _logAndReturn((uint64_t)"string: unable to create");
    return 4294942096;
  }
  return 0;
}

uint64_t cfNumberUnserialize(const __CFAllocator *a1, unint64_t *a2, unint64_t a3, CFNumberRef *a4, int a5)
{
  NSObject *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  unint64_t v16;
  unint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
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
  uint64_t result;
  _WORD *v33;
  unint64_t v34;
  unint64_t v35;
  unsigned int *v36;
  unsigned int v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  unint64_t v45;
  CFNumberRef v46;
  const char *v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  _QWORD v55[4];

  v55[3] = *MEMORY[0x1E0C80C00];
  if (a3 <= 0xF)
  {
    AXRuntimeLogSerialization();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      cfNumberUnserialize_cold_1(v5, v6, v7, v8, v9, v10, v11, v12);
    goto LABEL_14;
  }
  v16 = *a2;
  if (!a5)
  {
    v17 = *(_QWORD *)(v16 + 8);
    if ((v17 & 0x8000000000000000) == 0)
      goto LABEL_6;
LABEL_12:
    AXRuntimeLogSerialization();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      cfNumberUnserialize_cold_2(v5, v25, v26, v27, v28, v29, v30, v31);
    goto LABEL_14;
  }
  *(_DWORD *)(v16 + 4) = bswap32(*(_DWORD *)(v16 + 4));
  v17 = bswap64(*(_QWORD *)(v16 + 8));
  *(_QWORD *)(v16 + 8) = v17;
  if ((v17 & 0x8000000000000000) != 0)
    goto LABEL_12;
LABEL_6:
  if (HIDWORD(a3) || v17 >= 0xFFFFFFF0)
  {
    AXRuntimeLogSerialization();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      cfNumberUnserialize_cold_3(v5, v48, v49, v50, v51, v52, v53, v54);
    goto LABEL_14;
  }
  if (v17 > a3 - 16)
  {
    AXRuntimeLogSerialization();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      cfNumberUnserialize_cold_4(v5, v18, v19, v20, v21, v22, v23, v24);
LABEL_14:

    return 4294942096;
  }
  if (a5 && v17 >= 2)
  {
    if ((v17 & 3) != 0)
    {
      v33 = (_WORD *)(v16 + 16);
      v34 = v17 >> 1;
      do
      {
        *v33 = bswap32((unsigned __int16)*v33) >> 16;
        ++v33;
        --v34;
      }
      while (v34);
    }
    else if (v17 >= 4)
    {
      v35 = v17 >> 2;
      v36 = (unsigned int *)(v16 + 16);
      do
      {
        *v36 = bswap32(*v36);
        ++v36;
        --v35;
      }
      while (v35);
    }
  }
  v37 = *(_DWORD *)(v16 + 4);
  switch(v37)
  {
    case 1u:
    case 7u:
      if (v17)
        goto LABEL_39;
      goto LABEL_38;
    case 2u:
    case 8u:
      if (v17 >= 2)
        goto LABEL_39;
      goto LABEL_38;
    case 3u:
    case 5u:
    case 9u:
    case 0xCu:
      if (v17 >= 4)
        goto LABEL_39;
      goto LABEL_38;
    case 4u:
    case 6u:
    case 0xAu:
    case 0xBu:
    case 0xDu:
    case 0xEu:
    case 0xFu:
      if (v17 >= 8)
        goto LABEL_39;
      goto LABEL_38;
    case 0x10u:
      if (v17 > 7)
        goto LABEL_39;
LABEL_38:
      _logAndReturn((uint64_t)"number: buffer not large enought");
      return 4294942096;
    default:
      if (v37 >= 0x11)
      {
        AXRuntimeLogSerialization();
        v5 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
          cfNumberUnserialize_cold_5(v5, v38, v39, v40, v41, v42, v43, v44);
        goto LABEL_14;
      }
LABEL_39:
      MEMORY[0x1E0C80A78](a1);
      memmove((void *)(((unint64_t)v55 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0)) & 0xFFFFFFFFFFFFFFE0), (const void *)(*a2 + 16), *(_QWORD *)(v16 + 8));
      *a4 = CFNumberCreate(a1, (CFNumberType)*(unsigned int *)(v16 + 4), (const void *)(((unint64_t)v55 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0)) & 0xFFFFFFFFFFFFFFE0));
      v45 = *a2;
      *a2 += v17 + 16;
      v46 = *a4;
      if (v45 > -17 - v17)
      {
        if (v46)
        {
          CFRelease(v46);
          *a4 = 0;
        }
        v47 = "number: could not increment pointer";
      }
      else
      {
        if (v46)
          return 0;
        v47 = "number: unable to create";
      }
      _logAndReturn((uint64_t)v47);
      result = 4294942096;
      break;
  }
  return result;
}

uint64_t cfBooleanUnserialize(uint64_t a1, unint64_t *a2, unint64_t a3, CFTypeRef *a4)
{
  NSObject *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  CFTypeRef *v15;
  unint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;

  if (a3 <= 4)
  {
    AXRuntimeLogSerialization();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
      cfBooleanUnserialize_cold_1(v4, v5, v6, v7, v8, v9, v10, v11);
LABEL_4:

    return 4294942096;
  }
  if (*(_BYTE *)(*a2 + 4))
    v15 = (CFTypeRef *)MEMORY[0x1E0C9AE50];
  else
    v15 = (CFTypeRef *)MEMORY[0x1E0C9AE40];
  *a4 = CFRetain(*v15);
  v16 = *a2;
  *a2 += 5;
  if (v16 >= 0xFFFFFFFFFFFFFFFBLL)
  {
    if (*a4)
    {
      CFRelease(*a4);
      *a4 = 0;
    }
    AXRuntimeLogSerialization();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
      cfBooleanUnserialize_cold_2(v4, v17, v18, v19, v20, v21, v22, v23);
    goto LABEL_4;
  }
  return 0;
}

uint64_t cfArrayUnserialize(CFAllocatorRef allocator, unint64_t *a2, unint64_t a3, CFTypeRef *a4, uint64_t a5, uint64_t a6)
{
  NSObject *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  unint64_t v19;
  uint64_t v20;
  unint64_t v21;
  unsigned int v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  unint64_t v30;
  uint64_t v31;
  CFMutableArrayRef Mutable;
  CFMutableArrayRef v33;
  CFIndex v34;
  uint64_t v35;
  unsigned int *v36;
  unsigned int v37;
  uint64_t (*v38)();
  uint64_t v39;
  unint64_t v40;
  NSObject *v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  __CFArray *theArray;
  void *value;

  if (a3 <= 0xB)
  {
    AXRuntimeLogSerialization();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      cfArrayUnserialize_cold_1(v6, v7, v8, v9, v10, v11, v12, v13);
    goto LABEL_41;
  }
  v19 = *a2;
  if ((_DWORD)a5)
  {
    v20 = bswap64(*(_QWORD *)(v19 + 4));
    *(_QWORD *)(v19 + 4) = v20;
    if (v20)
      goto LABEL_6;
LABEL_11:
    *a4 = CFArrayCreate(allocator, 0, 0, MEMORY[0x1E0C9B378]);
    v30 = *a2;
    *a2 += 12;
    if (v30 < 0xFFFFFFFFFFFFFFF4)
    {
      v31 = 0;
      goto LABEL_38;
    }
    if (*a4)
    {
      CFRelease(*a4);
      *a4 = 0;
    }
    AXRuntimeLogSerialization();
    v6 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
LABEL_41:

      return 4294942096;
    }
LABEL_44:
    cfArrayUnserialize_cold_2(v6, v57, v58, v59, v60, v61, v62, v63);
    goto LABEL_41;
  }
  v20 = *(_QWORD *)(v19 + 4);
  if (!v20)
    goto LABEL_11;
LABEL_6:
  value = 0;
  v21 = *a2;
  *a2 += 12;
  if (v21 >= 0xFFFFFFFFFFFFFFF4)
  {
    AXRuntimeLogSerialization();
    v6 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      goto LABEL_41;
    goto LABEL_44;
  }
  v22 = a3 - 12;
  if (((a3 - 12) | a3) >> 32)
  {
    AXRuntimeLogSerialization();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      cfArrayUnserialize_cold_6(v6, v23, v24, v25, v26, v27, v28, v29);
    goto LABEL_41;
  }
  Mutable = CFArrayCreateMutable(allocator, 0, MEMORY[0x1E0C9B378]);
  v33 = Mutable;
  if (v20 < 1)
  {
LABEL_37:
    v31 = 0;
    *a4 = v33;
    goto LABEL_38;
  }
  v34 = 0;
  theArray = Mutable;
  while (1)
  {
    v35 = v22;
    if (v22 <= 3uLL)
    {
      _logAndReturn((uint64_t)"array: element: unexpected buffer size");
LABEL_32:
      v31 = 4294942096;
      goto LABEL_33;
    }
    v36 = (unsigned int *)*a2;
    if ((_DWORD)a5)
      v37 = bswap32(*v36);
    else
      v37 = *v36;
    v38 = bogusUnserialize;
    if (v37 <= 0xF)
      v38 = sUnserializeFunctions[v37];
    v39 = ((uint64_t (*)(CFAllocatorRef, unint64_t *, _QWORD, void **, uint64_t, uint64_t))v38)(allocator, a2, v22, &value, a5, a6);
    v31 = v39;
    if ((_DWORD)v39 || !value)
      break;
    v40 = *a2 - (_QWORD)v36;
    v22 = v35 - v40;
    if ((v40 | (v35 - v40)) >> 32)
    {
      AXRuntimeLogSerialization();
      v41 = objc_claimAutoreleasedReturnValue();
      v33 = theArray;
      if (os_log_type_enabled(v41, OS_LOG_TYPE_ERROR))
        cfArrayUnserialize_cold_5(v41, v42, v43, v44, v45, v46, v47, v48);

      if (value)
      {
        CFRelease(value);
        value = 0;
      }
      goto LABEL_32;
    }
    v33 = theArray;
    CFArrayInsertValueAtIndex(theArray, v34, value);
    if (value)
      CFRelease(value);
    value = 0;
    if (v20 == ++v34)
      goto LABEL_37;
  }
  v33 = theArray;
  if (!(_DWORD)v39)
    goto LABEL_37;
LABEL_33:
  if (v33)
    CFRelease(v33);
LABEL_38:
  if (!*a4)
  {
    AXRuntimeLogSerialization();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      cfArrayUnserialize_cold_3(v6, v49, v50, v51, v52, v53, v54, v55);
    goto LABEL_41;
  }
  return v31;
}

uint64_t cfDictionaryUnserialize(CFAllocatorRef allocator, unint64_t *a2, unint64_t a3, CFTypeRef *a4, uint64_t a5, uint64_t a6)
{
  NSObject *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  CFTypeRef *v16;
  unint64_t v19;
  CFIndex v20;
  unint64_t v21;
  unint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  unint64_t v30;
  uint64_t v31;
  CFMutableDictionaryRef Mutable;
  CFMutableDictionaryRef v33;
  unsigned int *v34;
  unsigned int v35;
  uint64_t (*v36)();
  void *v37;
  unsigned int *v38;
  unint64_t v39;
  unint64_t v40;
  unsigned int v41;
  uint64_t (*v42)();
  unint64_t v43;
  NSObject *v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  void *v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  NSObject *v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t v69;
  uint64_t v70;
  uint64_t v71;
  uint64_t v72;
  uint64_t v73;
  uint64_t v74;
  uint64_t v75;
  __CFDictionary *theDict;
  CFTypeRef *v77;
  void *value;

  if (a3 <= 0xB)
  {
    AXRuntimeLogSerialization();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      cfDictionaryUnserialize_cold_1(v6, v7, v8, v9, v10, v11, v12, v13);
    goto LABEL_50;
  }
  v16 = a4;
  v19 = *a2;
  if ((_DWORD)a5)
  {
    v20 = bswap64(*(_QWORD *)(v19 + 4));
    *(_QWORD *)(v19 + 4) = v20;
    if (v20)
    {
LABEL_6:
      value = 0;
      v21 = *a2;
      *a2 += 12;
      if (v21 < 0xFFFFFFFFFFFFFFF4)
      {
        v22 = a3 - 12;
        if (((a3 - 12) | a3) >> 32)
        {
          AXRuntimeLogSerialization();
          v6 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
            cfDictionaryUnserialize_cold_7(v6, v23, v24, v25, v26, v27, v28, v29);
          goto LABEL_50;
        }
        Mutable = CFDictionaryCreateMutable(allocator, v20, MEMORY[0x1E0C9B390], MEMORY[0x1E0C9B3A0]);
        v33 = Mutable;
        if (v20 < 1)
        {
LABEL_46:
          v31 = 0;
          *v16 = v33;
        }
        else
        {
          theDict = Mutable;
          v77 = v16;
          while (1)
          {
            if (v22 <= 3)
            {
              _logAndReturn((uint64_t)"dictionary: element: unexpected buffer size");
              return 4294942096;
            }
            v34 = (unsigned int *)*a2;
            if ((_DWORD)a5)
              v35 = bswap32(*v34);
            else
              v35 = *v34;
            v36 = bogusUnserialize;
            if (v35 <= 0xF)
              v36 = sUnserializeFunctions[v35];
            v31 = ((uint64_t (*)(CFAllocatorRef, unint64_t *, unint64_t, void **, uint64_t, uint64_t))v36)(allocator, a2, v22, &value, a5, a6);
            if ((_DWORD)v31)
              break;
            v37 = value;
            if (!value)
              break;
            v38 = (unsigned int *)*a2;
            v39 = *a2 - (_QWORD)v34;
            v40 = v22 - v39;
            if (HIDWORD(v40) || HIDWORD(v39) || (v40 & 0xFFFFFFFC) == 0)
            {
              AXRuntimeLogSerialization();
              v61 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v61, OS_LOG_TYPE_ERROR))
                cfDictionaryUnserialize_cold_5(v61, v62, v63, v64, v65, v66, v67, v68);

              v16 = v77;
              v52 = value;
              v33 = theDict;
              if (value)
              {
LABEL_41:
                CFRelease(v52);
                value = 0;
              }
LABEL_42:
              v31 = 4294942096;
              goto LABEL_43;
            }
            if ((_DWORD)a5)
              v41 = bswap32(*v38);
            else
              v41 = *v38;
            v42 = bogusUnserialize;
            if (v41 <= 0xF)
              v42 = sUnserializeFunctions[v41];
            v31 = ((uint64_t (*)(CFAllocatorRef, unint64_t *, unint64_t, void **, uint64_t, uint64_t))v42)(allocator, a2, v40, &value, a5, a6);
            if ((_DWORD)v31 || !value)
              break;
            v43 = *a2 - (_QWORD)v38;
            v22 = v40 - v43;
            if ((v43 | v22) >> 32)
            {
              AXRuntimeLogSerialization();
              v44 = objc_claimAutoreleasedReturnValue();
              v33 = theDict;
              if (os_log_type_enabled(v44, OS_LOG_TYPE_ERROR))
                cfDictionaryUnserialize_cold_6(v44, v45, v46, v47, v48, v49, v50, v51);

              v16 = v77;
              v52 = value;
              if (value)
                goto LABEL_41;
              goto LABEL_42;
            }
            v33 = theDict;
            CFDictionarySetValue(theDict, v37, value);
            CFRelease(v37);
            if (value)
            {
              CFRelease(value);
              value = 0;
            }
            --v20;
            v16 = v77;
            if (!v20)
              goto LABEL_46;
          }
          v33 = theDict;
          v16 = v77;
          if (!(_DWORD)v31)
            goto LABEL_46;
LABEL_43:
          if (v33)
            CFRelease(v33);
        }
        goto LABEL_47;
      }
      AXRuntimeLogSerialization();
      v6 = objc_claimAutoreleasedReturnValue();
      if (!os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
        goto LABEL_50;
LABEL_59:
      cfDictionaryUnserialize_cold_2(v6, v69, v70, v71, v72, v73, v74, v75);
      goto LABEL_50;
    }
  }
  else
  {
    v20 = *(_QWORD *)(v19 + 4);
    if (v20)
      goto LABEL_6;
  }
  *a4 = CFDictionaryCreate(allocator, 0, 0, 0, MEMORY[0x1E0C9B390], MEMORY[0x1E0C9B3A0]);
  v30 = *a2;
  *a2 += 12;
  if (v30 >= 0xFFFFFFFFFFFFFFF4)
  {
    if (*v16)
    {
      CFRelease(*v16);
      *v16 = 0;
    }
    AXRuntimeLogSerialization();
    v6 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      goto LABEL_50;
    goto LABEL_59;
  }
  v31 = 0;
LABEL_47:
  if (*v16)
    return v31;
  AXRuntimeLogSerialization();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    cfDictionaryUnserialize_cold_3(v6, v53, v54, v55, v56, v57, v58, v59);
LABEL_50:

  return 4294942096;
}

uint64_t cfDataUnserialize(const __CFAllocator *a1, unint64_t *a2, unint64_t a3, CFDataRef *a4, int a5)
{
  NSObject *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  unint64_t v15;
  unint64_t v16;
  BOOL v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
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
  unint64_t v33;
  CFDataRef v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;

  if (a3 <= 0xB)
  {
    AXRuntimeLogSerialization();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      cfDataUnserialize_cold_1(v5, v6, v7, v8, v9, v10, v11, v12);
LABEL_16:

    return 4294942096;
  }
  v15 = *a2;
  if (a5)
  {
    v16 = bswap64(*(_QWORD *)(v15 + 4));
    *(_QWORD *)(v15 + 4) = v16;
  }
  else
  {
    v16 = *(_QWORD *)(v15 + 4);
  }
  if (HIDWORD(v16))
    v17 = 0;
  else
    v17 = ((v16 + 12) | a3) >> 32 == 0;
  if (!v17)
  {
    AXRuntimeLogSerialization();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      cfDataUnserialize_cold_4(v5, v18, v19, v20, v21, v22, v23, v24);
    goto LABEL_16;
  }
  if (v16 > (a3 - 12))
  {
    AXRuntimeLogSerialization();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      cfDataUnserialize_cold_2(v5, v25, v26, v27, v28, v29, v30, v31);
    goto LABEL_16;
  }
  *a4 = CFDataCreate(a1, (const UInt8 *)(v15 + 12), v16);
  v33 = *a2;
  *a2 += v16 + 12;
  v34 = *a4;
  if (v33 > -13 - v16)
  {
    if (v34)
    {
      CFRelease(v34);
      *a4 = 0;
    }
    AXRuntimeLogSerialization();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      cfDataUnserialize_cold_3(v5, v35, v36, v37, v38, v39, v40, v41);
    goto LABEL_16;
  }
  if (!v34)
  {
    _logAndReturn((uint64_t)"data: unable to create");
    return 4294942096;
  }
  return 0;
}

uint64_t cfDateUnserialize(const __CFAllocator *a1, unint64_t *a2, unint64_t a3, CFDateRef *a4, int a5)
{
  NSObject *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  double v15;
  unint64_t v16;
  CFDateRef v17;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
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

  if (a3 > 0xB)
  {
    v15 = *(double *)(*a2 + 4);
    if (a5)
      v15 = (double)bswap64(*(_QWORD *)(*a2 + 4));
    *a4 = CFDateCreate(a1, v15);
    v16 = *a2;
    *a2 += 12;
    v17 = *a4;
    if (v16 >= 0xFFFFFFFFFFFFFFF4)
    {
      if (v17)
      {
        CFRelease(v17);
        *a4 = 0;
      }
      AXRuntimeLogSerialization();
      v5 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
        cfDateUnserialize_cold_2(v5, v26, v27, v28, v29, v30, v31, v32);
    }
    else
    {
      if (v17)
        return 0;
      AXRuntimeLogSerialization();
      v5 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
        cfDateUnserialize_cold_3(v5, v19, v20, v21, v22, v23, v24, v25);
    }
  }
  else
  {
    AXRuntimeLogSerialization();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      cfDateUnserialize_cold_1(v5, v6, v7, v8, v9, v10, v11, v12);
  }

  return 4294942096;
}

uint64_t cfURLUnserialize(const __CFAllocator *a1, uint64_t *a2, unint64_t a3, CFURLRef *a4, int a5)
{
  unint64_t v5;
  NSObject *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  unint64_t v15;
  unint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  const __CFString *v29;
  unint64_t v30;
  unint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  CFTypeRef v39;
  const char *v40;
  const __CFURL *v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  CFTypeRef v49;
  CFTypeRef cf;

  v5 = *a2;
  cf = 0;
  if (a3 <= 4)
  {
    AXRuntimeLogSerialization();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      cfURLUnserialize_cold_1(v6, v7, v8, v9, v10, v11, v12, v13);
LABEL_8:

    return 4294942096;
  }
  v15 = v5 + 5;
  *a2 = v5 + 5;
  if (v5 >= 0xFFFFFFFFFFFFFFFBLL)
  {
    AXRuntimeLogSerialization();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      cfURLUnserialize_cold_2(v6, v42, v43, v44, v45, v46, v47, v48);
    goto LABEL_8;
  }
  v16 = a3 - 5;
  if (((a3 - 5) | a3) >> 32)
  {
    AXRuntimeLogSerialization();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      cfURLUnserialize_cold_4(v6, v17, v18, v19, v20, v21, v22, v23);
    goto LABEL_8;
  }
  v24 = cfStringUnserialize(a1, a2, a3 - 5, (CFStringRef *)&cf, a5);
  if (!(_DWORD)v24)
  {
    v29 = (const __CFString *)cf;
    if (cf)
    {
      v30 = *a2 - v15;
      v31 = v16 - v30;
      if ((v31 | v30) >> 32)
      {
        CFRelease(cf);
        AXRuntimeLogSerialization();
        v6 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
          cfURLUnserialize_cold_3(v6, v32, v33, v34, v35, v36, v37, v38);
        goto LABEL_8;
      }
      if (*(unsigned __int8 *)(v5 + 4) < 2u)
      {
        v41 = 0;
        goto LABEL_22;
      }
      v49 = 0;
      v24 = cfStringUnserialize(a1, a2, v31, (CFStringRef *)&v49, a5);
      v39 = v49;
      if (!(_DWORD)v24 && v49)
      {
        if (((v31 - (*a2 - v15)) | (*a2 - v15)) >> 32)
        {
          CFRelease(v49);
          CFRelease(v29);
          v40 = "url: base buffer math error";
LABEL_30:
          _logAndReturn((uint64_t)v40);
          return 4294942096;
        }
        v41 = CFURLCreateWithString(a1, (CFStringRef)v49, 0);
        CFRelease(v39);
LABEL_22:
        *a4 = CFURLCreateWithString(a1, v29, v41);
        CFRelease(v29);
        if (v41)
          CFRelease(v41);
        if (*a4)
          return 0;
        v40 = "url: unable to create";
        goto LABEL_30;
      }
      if (v49)
        CFRelease(v49);
      CFRelease(v29);
    }
  }
  return v24;
}

uint64_t cfNullUnserialize(uint64_t a1, unint64_t *a2, unint64_t a3, _QWORD *a4)
{
  NSObject *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  unint64_t v14;
  CFTypeRef v15;
  uint64_t result;
  NSObject *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;

  if (a3 <= 3)
  {
    AXRuntimeLogSerialization();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      cfNullUnserialize_cold_2(v6, v7, v8, v9, v10, v11, v12, v13);

  }
  v14 = *a2;
  *a2 += 4;
  if (v14 >= 0xFFFFFFFFFFFFFFFCLL)
  {
    AXRuntimeLogSerialization();
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
      cfNullUnserialize_cold_1(v17, v18, v19, v20, v21, v22, v23, v24);

    return 4294942096;
  }
  else
  {
    v15 = CFRetain((CFTypeRef)*MEMORY[0x1E0C9B0D0]);
    result = 0;
    *a4 = v15;
  }
  return result;
}

uint64_t cfAttributedStringUnserialize(const __CFAllocator *a1, uint64_t *a2, unint64_t a3, uint64_t *a4, uint64_t a5, uint64_t a6)
{
  unint64_t v6;
  NSObject *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  unint64_t v16;
  unint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v30;
  _OWORD *v31;
  const char *v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v42;
  unint64_t v43;
  unint64_t v44;
  int8x8_t v45;
  __int128 v46;
  uint64_t v47;
  uint64_t v48;
  __int128 v49;
  uint64_t v50;
  unint64_t v51;
  uint64_t v52;
  unint64_t v53;
  CFStringRef v54;
  AXAttributedString *v55;
  _BOOL4 v56;
  char v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  CFStringRef v64;
  _QWORD *v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t v68;
  CFTypeRef *v69;
  uint64_t v70;
  CFTypeRef *v71;
  uint64_t v72;
  uint64_t v73;
  uint64_t v74;
  uint64_t v75;
  uint64_t v76;
  uint64_t v77;
  uint64_t v78;
  uint64_t v79;
  uint64_t v80;
  uint64_t v81;
  uint64_t v82;
  uint64_t v83;
  uint64_t v84;
  uint64_t v85;
  uint64_t v86;
  uint64_t v87;
  uint64_t v88;
  uint64_t v89;
  uint64_t v90;
  uint64_t v91;
  uint64_t v92;
  CFTypeRef *v93;
  const __CFString *v94;
  uint64_t v95;
  uint64_t v96;
  CFStringRef str;

  v6 = *a2;
  str = 0;
  if (a3 <= 0xB)
  {
    AXRuntimeLogSerialization();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      cfAttributedStringUnserialize_cold_1(v7, v8, v9, v10, v11, v12, v13, v14);
LABEL_18:

    return 4294942096;
  }
  v16 = v6 + 12;
  *a2 = v6 + 12;
  if (v6 >= 0xFFFFFFFFFFFFFFF4)
  {
    AXRuntimeLogSerialization();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      cfAttributedStringUnserialize_cold_2(v7, v72, v73, v74, v75, v76, v77, v78);
    goto LABEL_18;
  }
  v18 = a3 - 12;
  if (((a3 - 12) | a3) >> 32)
  {
    AXRuntimeLogSerialization();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      cfAttributedStringUnserialize_cold_7(v7, v19, v20, v21, v22, v23, v24, v25);
    goto LABEL_18;
  }
  if ((_DWORD)a5)
    v30 = bswap64(*(_QWORD *)(v6 + 4));
  else
    v30 = *(_QWORD *)(v6 + 4);
  *(_QWORD *)(v6 + 4) = v30;
  if (v30 < 0)
    goto LABEL_16;
  if (!v30)
  {
    v31 = (_OWORD *)(v6 + 12);
    goto LABEL_22;
  }
  if ((unint64_t)v30 >> 60)
  {
LABEL_16:
    AXRuntimeLogSerialization();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      cfAttributedStringUnserialize_cold_6(v7, v33, v34, v35, v36, v37, v38, v39);
    goto LABEL_18;
  }
  v31 = malloc_type_malloc(16 * v30, 0x1BB95363uLL);
  if (!v31)
  {
    v32 = "attributedString: range: unable to allocate";
LABEL_57:
    _logAndReturn((uint64_t)v32);
    return 4294942096;
  }
LABEL_22:
  if ((_DWORD)a5)
  {
    if ((_DWORD)a6)
    {
      if (v30)
      {
        v42 = 0;
        v43 = a3 - 20;
        v44 = v16 + 4;
        while (v43 < 0xFFFFFFFFFFFFFFF8)
        {
          v45 = vrev32_s8(*(int8x8_t *)(v44 - 4));
          *(_QWORD *)&v46 = v45.u32[0];
          *((_QWORD *)&v46 + 1) = v45.u32[1];
          v31[v42] = v46;
          if (HIDWORD(v43))
          {
            free(v31);
            AXRuntimeLogSerialization();
            v7 = objc_claimAutoreleasedReturnValue();
            if (!os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
              goto LABEL_18;
            goto LABEL_93;
          }
          ++v42;
          v43 -= 8;
          v44 += 8;
          if (v30 == v42)
            goto LABEL_36;
        }
LABEL_56:
        free(v31);
        v32 = "attributedString: range-entry: unexpected buffer size";
        goto LABEL_57;
      }
    }
    else if (v30)
    {
      v50 = 0;
      v51 = v16 + 8;
      while (v18 > 0xF)
      {
        v31[v50] = vrev64q_s8(*(int8x16_t *)(v51 - 8));
        v18 -= 16;
        if (HIDWORD(v18))
        {
          free(v31);
          AXRuntimeLogSerialization();
          v7 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
            cfAttributedStringUnserialize_cold_4(v7, v86, v87, v88, v89, v90, v91, v92);
          goto LABEL_18;
        }
        ++v50;
        v51 += 16;
        if (v30 == v50)
          goto LABEL_48;
      }
      goto LABEL_56;
    }
  }
  else if ((_DWORD)a6)
  {
    if (v30)
    {
      v47 = 0;
      v43 = a3 - 20;
      while (v43 < 0xFFFFFFFFFFFFFFF8)
      {
        v48 = *(_QWORD *)(v16 + 8 * v47);
        *(_QWORD *)&v49 = (int)v48;
        *((_QWORD *)&v49 + 1) = SHIDWORD(v48);
        v31[v47] = v49;
        if (HIDWORD(v43))
        {
          free(v31);
          AXRuntimeLogSerialization();
          v7 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
LABEL_93:
            cfAttributedStringUnserialize_cold_3(v7, v79, v80, v81, v82, v83, v84, v85);
          goto LABEL_18;
        }
        ++v47;
        v43 -= 8;
        if (v30 == v47)
        {
LABEL_36:
          v18 = v43 + 8;
          goto LABEL_48;
        }
      }
      goto LABEL_56;
    }
  }
  else if (v30)
  {
    v52 = 0;
    while (v18 > 0xF)
    {
      v31[v52] = *(_OWORD *)(v16 + 16 * v52);
      v18 -= 16;
      if (HIDWORD(v18))
      {
        free(v31);
        v32 = "attributedString: range-entry buffer math error";
        goto LABEL_57;
      }
      if (v30 == ++v52)
      {
LABEL_48:
        v53 = 8;
        if (!(_DWORD)a6)
          v53 = 16;
        if (v18 < v53)
        {
          free(v31);
          v32 = "attributedString: run: unexpected buffer size";
          goto LABEL_57;
        }
        v56 = ((unint64_t)v30 * (unsigned __int128)v53) >> 64 != 0;
        v57 = 3;
        if (!(_DWORD)a6)
          v57 = 4;
        v58 = v30 << v57;
        v59 = *a2;
        v60 = *a2 + v58;
        *a2 = v60;
        if (__CFADD__(v58, v59) || v56)
        {
          free(v31);
          v32 = "attributedString: run buffer math error";
          goto LABEL_57;
        }
        v61 = cfStringUnserialize(a1, a2, v18, &str, a5);
        v62 = *a2 - v60;
        v63 = v18 - v62;
        if ((v63 | (unint64_t)v62) >> 32)
        {
          if (str)
            CFRelease(str);
          free(v31);
          v32 = "attributedString: final string buffer math error";
          goto LABEL_57;
        }
        v40 = v61;
        v64 = str;
        if (!(_DWORD)v61 && str)
        {
          v94 = str;
          if ((unint64_t)v30 >> 61)
          {
            CFRelease(str);
            free(v31);
            v32 = "attributedString: dict buffer math error";
            goto LABEL_57;
          }
          v65 = malloc_type_malloc(8 * v30, 0x468D5912uLL);
          bzero(v65, 8 * v30);
          v96 = *a2;
          v66 = 1;
          v93 = (CFTypeRef *)v65;
          do
          {
            v95 = v66;
            *v65 = 0;
            v67 = cfDictionaryUnserialize(a1, (unint64_t *)a2, v63, (CFTypeRef *)v65, a5, a6);
            if (*v65)
            {
              v40 = v67;
            }
            else
            {
              _logAndReturn((uint64_t)"attributedString: could not create dictionary");
              v40 = 4294942096;
            }
            v68 = *a2 - v96;
            v63 = v63 - v68;
            if ((v68 | (unint64_t)v63) >> 32)
            {
              _logAndReturn((uint64_t)"attributedString: dict entry buffer math error");
              v40 = 4294942096;
              goto LABEL_80;
            }
            if (v95 >= v30)
              break;
            v66 = v95 + 1;
            ++v65;
            v96 = *a2;
          }
          while (!(_DWORD)v40);
          if (!(_DWORD)v40)
          {
            v69 = v93;
            v64 = v94;
            v70 = _CFAttributedStringCreateWithRuns();
            goto LABEL_81;
          }
LABEL_80:
          v64 = v94;
          v70 = (uint64_t)CFAttributedStringCreate(a1, v94, 0);
          v69 = v93;
LABEL_81:
          *a4 = v70;
          if (v30 >= 1)
          {
            v71 = v69;
            do
            {
              if (*v71)
              {
                CFRelease(*v71);
                *v71 = 0;
              }
              ++v71;
              --v30;
            }
            while (v30);
          }
          free(v69);
        }
        if (v64)
          CFRelease(v64);
        free(v31);
        goto LABEL_54;
      }
    }
    goto LABEL_56;
  }
  v40 = cfStringUnserialize(a1, a2, v18, &str, a5);
  if (!(_DWORD)v40)
  {
    v54 = str;
    *a4 = (uint64_t)CFAttributedStringCreate(a1, str, 0);
    CFRelease(v54);
  }
LABEL_54:
  if (*a4)
  {
    v55 = AXCreateAXAttributedStringFromCFAttributedString(*a4);
    CFRelease((CFTypeRef)*a4);
    *a4 = (uint64_t)v55;
  }
  return v40;
}

uint64_t axElementUnserialize(uint64_t a1, uint64_t *a2, unint64_t a3, uint64_t *a4, int a5)
{
  NSObject *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t result;
  uint64_t v16;
  int v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t Internal;

  if (a3 > 0x17)
  {
    v16 = *a2;
    if (a5)
    {
      v17 = bswap32(*(_DWORD *)(v16 + 4));
      *(_DWORD *)(v16 + 4) = v17;
      v18 = bswap64(*(_QWORD *)(v16 + 8));
      v19 = bswap64(*(_QWORD *)(v16 + 16));
      *(_QWORD *)(v16 + 8) = v18;
      *(_QWORD *)(v16 + 16) = v19;
    }
    else
    {
      v17 = *(_DWORD *)(v16 + 4);
      v18 = *(_QWORD *)(v16 + 8);
      v19 = *(_QWORD *)(v16 + 16);
    }
    Internal = _AXUIElementCreateInternal(v17, v18, v19);
    result = 0;
    *a4 = Internal;
    *a2 += 24;
  }
  else
  {
    AXRuntimeLogSerialization();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      axElementUnserialize_cold_1(v5, v6, v7, v8, v9, v10, v11, v12);

    return 4294942096;
  }
  return result;
}

uint64_t axValueUnserialize(uint64_t a1, unsigned int **a2, unint64_t a3, _QWORD *a4, int a5)
{
  NSObject *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  unsigned int *v14;
  unsigned int v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  unint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;

  if (a3 <= 0xB)
  {
    AXRuntimeLogSerialization();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      axValueUnserialize_cold_1(v5, v6, v7, v8, v9, v10, v11, v12);
LABEL_12:

    return 4294942096;
  }
  v14 = *a2;
  if (a5)
  {
    v15 = bswap32(v14[2]);
    v14[1] = bswap32(v14[1]);
    v14[2] = v15;
  }
  if (((a3 - 12) | a3) >> 32)
  {
    AXRuntimeLogSerialization();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      axValueUnserialize_cold_4(v5, v16, v17, v18, v19, v20, v21, v22);
    goto LABEL_12;
  }
  if (v14[2] > (int)a3 - 12)
  {
    AXRuntimeLogSerialization();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      axValueUnserialize_cold_2(v5, v23, v24, v25, v26, v27, v28, v29);
    goto LABEL_12;
  }
  *a4 = _AXValueCreateFromInternalData(v14[1], v14 + 3);
  v31 = (unint64_t)*a2;
  v32 = v14[2];
  *a2 = (unsigned int *)((char *)*a2 + v32 + 12);
  if (-13 - v32 < v31)
  {
    AXRuntimeLogSerialization();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      axValueUnserialize_cold_3(v5, v33, v34, v35, v36, v37, v38, v39);
    goto LABEL_12;
  }
  return 0;
}

uint64_t cgColorUnserialize(uint64_t a1, uint64_t *a2, unint64_t a3, CGColorRef *a4, int a5)
{
  NSObject *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v15;
  uint64_t v16;
  unsigned int v17;
  _BOOL4 v18;
  uint64_t v20;
  uint64_t v21;
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
  unint64_t *v34;
  int v35;
  CGColorSpace *DeviceCMYK;
  CGColorSpace *v37;
  uint64_t v38;
  size_t NumberOfComponents;
  uint64_t v40;
  uint64_t v41;
  char *v42;
  uint64_t v43;
  CGColorRef v44;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  const char *v60;
  _QWORD v61[2];

  v61[1] = *MEMORY[0x1E0C80C00];
  if (a3 <= 0xB)
  {
    AXRuntimeLogSerialization();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      cgColorUnserialize_cold_1(v5, v6, v7, v8, v9, v10, v11, v12);
LABEL_38:

    return 4294942096;
  }
  v15 = *a2;
  if (a5)
  {
    LODWORD(v16) = bswap32(*(_DWORD *)(v15 + 8));
    *(_DWORD *)(v15 + 4) = bswap32(*(_DWORD *)(v15 + 4));
    *(_DWORD *)(v15 + 8) = v16;
  }
  else
  {
    LODWORD(v16) = *(_DWORD *)(v15 + 8);
  }
  v17 = 8 * v16;
  v18 = v16 >> 29 != 0;
  if (HIDWORD(a3))
    v18 = 1;
  if (v17 > 0xFFFFFFF3 || v18)
  {
    AXRuntimeLogSerialization();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      cgColorUnserialize_cold_2(v5, v20, v21, v22, v23, v24, v25, v26);
    goto LABEL_38;
  }
  if (v17 > (int)a3 - 12)
  {
    AXRuntimeLogSerialization();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      cgColorUnserialize_cold_3(v5, v27, v28, v29, v30, v31, v32, v33);
    goto LABEL_38;
  }
  if (a5)
  {
    v16 = v16;
    if ((_DWORD)v16)
    {
      v34 = (unint64_t *)(v15 + 12);
      do
      {
        *v34 = bswap64(*v34);
        ++v34;
        --v16;
      }
      while (v16);
    }
  }
  v35 = *(_DWORD *)(v15 + 4);
  if (v35 == 2)
  {
    DeviceCMYK = CGColorSpaceCreateDeviceCMYK();
  }
  else if (v35 == 1)
  {
    DeviceCMYK = CGColorSpaceCreateDeviceRGB();
  }
  else
  {
    if (v35)
      return 4294942095;
    DeviceCMYK = CGColorSpaceCreateDeviceGray();
  }
  v37 = DeviceCMYK;
  if (!DeviceCMYK)
  {
    AXRuntimeLogSerialization();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      cgColorUnserialize_cold_4(v5, v46, v47, v48, v49, v50, v51, v52);
    goto LABEL_38;
  }
  v38 = *(unsigned int *)(v15 + 8);
  NumberOfComponents = CGColorSpaceGetNumberOfComponents(DeviceCMYK);
  if (NumberOfComponents + 1 != v38)
  {
    CFRelease(v37);
    AXRuntimeLogSerialization();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      cgColorUnserialize_cold_5(v5, v53, v54, v55, v56, v57, v58, v59);
    goto LABEL_38;
  }
  v40 = v17 + 12;
  MEMORY[0x1E0C80A78](NumberOfComponents);
  v42 = (char *)v61 - ((v41 + 15) & 0xFFFFFFFF0);
  memmove(v42, (const void *)(*a2 + 12), 8 * *(unsigned int *)(v15 + 8));
  *a4 = CGColorCreate(v37, (const CGFloat *)v42);
  CFRelease(v37);
  v43 = *a2;
  *a2 += v40;
  v44 = *a4;
  if (__CFADD__(v40, v43))
  {
    if (v44)
    {
      CFRelease(v44);
      *a4 = 0;
    }
    v60 = "color: could not increment pointer";
  }
  else
  {
    if (v44)
      return 0;
    v60 = "color: unable to create";
  }
  _logAndReturn((uint64_t)v60);
  return 4294942096;
}

uint64_t cgPathUnserialize(const __CFAllocator *a1, unint64_t *a2, unint64_t a3, CGPath **a4, __int32 a5)
{
  NSObject *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  unint64_t v16;
  unint64_t v17;
  BOOL v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
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
  CFDataRef v35;
  const __CFData *v36;
  unint64_t v37;
  CGPath *Mutable;
  int64_t v39;
  const UInt8 *BytePtr;
  int8x16_t v41;
  const UInt8 *v42;
  int64_t v43;
  const char *v44;
  unsigned int v45;
  unsigned int v46;
  int8x16_t v48;
  int8x16_t *v49;
  uint64_t v50;
  int8x16_t v51;
  const char *v52;
  NSObject *v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t v67;
  __int128 v68;
  __int128 v69;
  CGFloat v70[3];
  uint64_t v71;

  v71 = *MEMORY[0x1E0C80C00];
  if (a3 <= 0xB)
  {
    AXRuntimeLogSerialization();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      cgPathUnserialize_cold_1(v5, v6, v7, v8, v9, v10, v11, v12);
LABEL_16:

    return 4294942096;
  }
  v16 = *a2;
  if (a5)
  {
    v17 = bswap64(*(_QWORD *)(v16 + 4));
    *(_QWORD *)(v16 + 4) = v17;
  }
  else
  {
    v17 = *(_QWORD *)(v16 + 4);
  }
  if (HIDWORD(v17))
    v18 = 0;
  else
    v18 = ((v17 + 12) | a3) >> 32 == 0;
  if (!v18)
  {
    AXRuntimeLogSerialization();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      cgPathUnserialize_cold_5(v5, v19, v20, v21, v22, v23, v24, v25);
    goto LABEL_16;
  }
  if (v17 > (a3 - 12))
  {
    AXRuntimeLogSerialization();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      cgPathUnserialize_cold_2(v5, v26, v27, v28, v29, v30, v31, v32);
    goto LABEL_16;
  }
  v35 = CFDataCreate(a1, (const UInt8 *)(v16 + 12), v17);
  v36 = v35;
  v37 = *a2;
  *a2 += v17 + 12;
  if (v37 > -13 - v17)
  {
    if (v35)
      CFRelease(v35);
    AXRuntimeLogSerialization();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      cgPathUnserialize_cold_3(v5, v61, v62, v63, v64, v65, v66, v67);
    goto LABEL_16;
  }
  Mutable = CGPathCreateMutable();
  v39 = *(_QWORD *)(v16 + 4);
  BytePtr = CFDataGetBytePtr(v36);
  if (v39 < 1)
  {
LABEL_46:
    v33 = 0;
    goto LABEL_60;
  }
  v42 = BytePtr;
  v43 = 0;
  v44 = "path: movePoint: unexpected buffer size";
  while (1)
  {
    if (v43 + 8 > (unint64_t)v39)
    {
      v52 = "path: pointsType: unexpected buffer size";
      goto LABEL_56;
    }
    v45 = *(_DWORD *)&v42[v43];
    v46 = *(_DWORD *)&v42[v43 + 4];
    if (a5)
    {
      v45 = bswap32(*(_DWORD *)&v42[v43]);
      v46 = bswap32(*(_DWORD *)&v42[v43 + 4]);
    }
    if (v46 > 3 || v43 + 8 + 16 * (unint64_t)v46 > v39)
      break;
    v48.i32[1] = 0;
    v48.i64[1] = 0;
    v69 = 0u;
    *(_OWORD *)v70 = 0u;
    v68 = 0u;
    if (v46)
    {
      v49 = (int8x16_t *)&v68;
      v50 = v46;
      v43 += 8;
      do
      {
        v48.i32[0] = 0;
        v41.i32[0] = a5;
        v51 = vdupq_lane_s8((int8x8_t)*(_OWORD *)&vceqq_s8(v41, v48), 0);
        v41 = *(int8x16_t *)&v42[v43];
        v48 = vbslq_s8(v51, v41, vrev64q_s8(v41));
        v43 += 16;
        *v49++ = v48;
        --v50;
      }
      while (v50);
    }
    else
    {
      v43 += 8;
    }
    switch(v45)
    {
      case 0u:
        if (v46 != 1)
          goto LABEL_55;
        CGPathMoveToPoint(Mutable, 0, *(CGFloat *)&v68, *((CGFloat *)&v68 + 1));
        goto LABEL_45;
      case 1u:
        if (v46 != 1)
        {
          v44 = "path: addLinePoint: unexpected buffer size";
LABEL_55:
          v52 = v44;
LABEL_56:
          _logAndReturn((uint64_t)v52);
          goto LABEL_57;
        }
        CGPathAddLineToPoint(Mutable, 0, *(CGFloat *)&v68, *((CGFloat *)&v68 + 1));
LABEL_45:
        if (v43 >= v39)
          goto LABEL_46;
        break;
      case 2u:
        if (v46 == 2)
        {
          CGPathAddQuadCurveToPoint(Mutable, 0, *(CGFloat *)&v68, *((CGFloat *)&v68 + 1), *(CGFloat *)&v69, *((CGFloat *)&v69 + 1));
          goto LABEL_45;
        }
        v44 = "path: quadCurvePoint: unexpected buffer size";
        goto LABEL_55;
      case 3u:
        if (v46 == 3)
        {
          CGPathAddCurveToPoint(Mutable, 0, *(CGFloat *)&v68, *((CGFloat *)&v68 + 1), *(CGFloat *)&v69, *((CGFloat *)&v69 + 1), v70[0], v70[1]);
          goto LABEL_45;
        }
        v44 = "path: curvePoint: unexpected buffer size";
        goto LABEL_55;
      case 4u:
        if (!v46)
        {
          CGPathCloseSubpath(Mutable);
          goto LABEL_45;
        }
        v44 = "path: close: unexpected buffer size";
        goto LABEL_55;
      default:
        goto LABEL_45;
    }
  }
  AXRuntimeLogSerialization();
  v53 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v53, OS_LOG_TYPE_ERROR))
    cgPathUnserialize_cold_4(v53, v54, v55, v56, v57, v58, v59, v60);

LABEL_57:
  if (Mutable)
  {
    CFRelease(Mutable);
    Mutable = 0;
  }
  v33 = 4294942096;
LABEL_60:
  *a4 = Mutable;
  if (v36)
  {
    CFRelease(v36);
    Mutable = *a4;
  }
  if (!Mutable)
  {
    _logAndReturn((uint64_t)"path: unable to create");
    return 4294942096;
  }
  return v33;
}

uint64_t cfUUIDUnserialize(const __CFAllocator *a1, unint64_t *a2, unint64_t a3, _QWORD *a4, int a5)
{
  uint64_t v6;
  BOOL v7;
  unint64_t v8;
  unint64_t v9;
  NSObject *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  const __CFData *v19;
  CFRange v20;
  const __CFAllocator *v21;
  const __CFUUID *v22;
  CFStringRef v23;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  CFUUIDBytes buffer;
  CFDataRef theData;

  v6 = 4294942096;
  v7 = a3 >= 4;
  v8 = a3 - 4;
  if (v7)
  {
    v9 = *a2;
    if (*(_DWORD *)*a2 == 14)
    {
      *a2 = v9 + 4;
      if (v9 >= 0xFFFFFFFFFFFFFFFCLL)
      {
        AXRuntimeLogSerialization();
        v10 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
          cfUUIDUnserialize_cold_1(v10, v25, v26, v27, v28, v29, v30, v31);
        goto LABEL_8;
      }
      if ((v8 | a3) >> 32)
      {
        AXRuntimeLogSerialization();
        v10 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
          cfUUIDUnserialize_cold_2(v10, v11, v12, v13, v14, v15, v16, v17);
LABEL_8:

        return 4294942096;
      }
      theData = 0;
      v6 = cfDataUnserialize(a1, a2, v8, &theData, a5);
      if (!(_DWORD)v6)
      {
        *(_QWORD *)&buffer.byte0 = 0;
        *(_QWORD *)&buffer.byte8 = 0;
        v19 = theData;
        if ((unint64_t)CFDataGetLength(theData) <= 0x10)
          v20.length = CFDataGetLength(v19);
        else
          v20.length = 16;
        v20.location = 0;
        CFDataGetBytes(v19, v20, &buffer.byte0);
        v21 = (const __CFAllocator *)*MEMORY[0x1E0C9AE00];
        v22 = CFUUIDCreateFromUUIDBytes((CFAllocatorRef)*MEMORY[0x1E0C9AE00], buffer);
        v23 = CFUUIDCreateString(v21, v22);
        *a4 = objc_msgSend(objc_alloc(MEMORY[0x1E0CB3A28]), "initWithUUIDString:", v23);
        if (v23)
          CFRelease(v23);
        if (v22)
          CFRelease(v22);
        if (v19)
          CFRelease(v19);
      }
    }
  }
  return v6;
}

uint64_t ctFontUnserialize(const __CFAllocator *a1, unint64_t *a2, unint64_t a3, CTFontRef *a4, uint64_t a5, uint64_t a6)
{
  uint64_t v7;
  BOOL v8;
  unint64_t v9;
  unint64_t v10;
  NSObject *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  CFDictionaryRef v20;
  const __CTFontDescriptor *v21;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  CFDictionaryRef attributes;

  v7 = 4294942096;
  v8 = a3 >= 8;
  v9 = a3 - 8;
  if (v8)
  {
    v10 = *a2;
    if (*(_DWORD *)*a2 == 15)
    {
      *a2 = v10 + 8;
      if (v10 >= 0xFFFFFFFFFFFFFFF8)
      {
        AXRuntimeLogSerialization();
        v11 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
          ctFontUnserialize_cold_1(v11, v23, v24, v25, v26, v27, v28, v29);
        goto LABEL_8;
      }
      if ((v9 | a3) >> 32)
      {
        AXRuntimeLogSerialization();
        v11 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
          ctFontUnserialize_cold_2(v11, v12, v13, v14, v15, v16, v17, v18);
LABEL_8:

        return v7;
      }
      attributes = 0;
      v7 = cfDictionaryUnserialize(a1, a2, v9, (CFTypeRef *)&attributes, a5, a6);
      if (!(_DWORD)v7)
      {
        v20 = attributes;
        if (attributes)
        {
          v21 = CTFontDescriptorCreateWithAttributes(attributes);
          *a4 = CTFontCreateWithFontDescriptor(v21, (double)*(int *)(v10 + 4), 0);
          CFRelease(v20);
          if (v21)
            CFRelease(v21);
        }
      }
    }
  }
  return v7;
}

void OUTLINED_FUNCTION_0_2(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 0xCu);
}

CFRunLoopSourceRef MSHCreateMachServerSource(const __CFAllocator *a1, CFIndex a2, uint64_t a3, int a4, int a5, uint64_t a6)
{
  int v7;
  _DWORD *v12;
  ipc_space_t v13;
  CFRunLoopSourceRef result;
  mach_port_name_t perform_high;
  ipc_space_t v16;
  mach_port_right_t v17;
  CFRunLoopSourceContext v18;

  v7 = a5;
  HIDWORD(v18.perform) = a5;
  v12 = malloc_type_malloc(0x18uLL, 0x1080040D2F62047uLL);
  v18.version = 1;
  v18.info = v12;
  v18.retain = 0;
  v18.release = (void (__cdecl *)(const void *))mshRelease;
  v18.copyDescription = (CFStringRef (__cdecl *)(const void *))mshCopyDescription;
  v18.equal = (Boolean (__cdecl *)(const void *, const void *))mshEqual;
  v18.hash = (CFHashCode (__cdecl *)(const void *))mshHash;
  v18.schedule = (void (__cdecl *)(void *, CFRunLoopRef, CFRunLoopMode))mshGetPort;
  v18.cancel = (void (__cdecl *)(void *, CFRunLoopRef, CFRunLoopMode))mshPerform;
  v13 = *MEMORY[0x1E0C83DA0];
  if (!v7)
  {
    if (mach_port_allocate(*MEMORY[0x1E0C83DA0], 1u, (mach_port_name_t *)&v18.perform + 1))
      goto LABEL_10;
    if ((a4 & 4) == 0 && mach_port_insert_right(v13, HIDWORD(v18.perform), HIDWORD(v18.perform), 0x14u))
    {
      perform_high = HIDWORD(v18.perform);
      v16 = v13;
      v17 = 1;
      goto LABEL_9;
    }
    a4 &= ~1u;
    v7 = HIDWORD(v18.perform);
  }
  *((_QWORD *)v12 + 1) = a6;
  *((_QWORD *)v12 + 2) = a3;
  *v12 = v7;
  v12[1] = a4;
  result = CFRunLoopSourceCreate(a1, a2, &v18);
  if (result)
    return result;
  if ((a4 & 1) == 0)
  {
    mach_port_mod_refs(v13, HIDWORD(v18.perform), 1u, -1);
    perform_high = HIDWORD(v18.perform);
    v16 = v13;
    v17 = 0;
LABEL_9:
    mach_port_mod_refs(v16, perform_high, v17, -1);
  }
LABEL_10:
  free(v12);
  return 0;
}

void mshRelease(mach_port_name_t *a1)
{
  mach_port_name_t v2;
  ipc_space_t v3;
  mach_port_name_t v4;

  v2 = a1[1];
  if ((v2 & 1) == 0)
  {
    v3 = *MEMORY[0x1E0C83DA0];
    v4 = *a1;
    mach_port_mod_refs(*MEMORY[0x1E0C83DA0], *a1, 1u, -1);
    if ((v2 & 4) == 0)
      mach_port_mod_refs(v3, v4, 0, -1);
  }
  free(a1);
}

CFStringRef mshCopyDescription(unsigned int *a1)
{
  return CFStringCreateWithFormat(0, 0, CFSTR("<MSHRunLoopSource %p> {port = %x, callback = %p}"), a1, *a1, *((_QWORD *)a1 + 2));
}

BOOL mshEqual(_DWORD *a1, _DWORD *a2)
{
  return *a1 == *a2;
}

uint64_t mshGetPort(unsigned int *a1)
{
  return *a1;
}

uint64_t mshPerform(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  (*(void (**)(uint64_t, uint64_t, _QWORD))(a4 + 16))(a1, a2, *(_QWORD *)(a4 + 8));
  return 0;
}

CFRunLoopSourceRef MSHCreateMIGServerSource(const __CFAllocator *a1, CFIndex a2, uint64_t a3, int a4, int a5, uint64_t a6)
{
  int v7;
  _DWORD *v12;
  ipc_space_t v13;
  CFRunLoopSourceRef result;
  mach_port_name_t perform_high;
  ipc_space_t v16;
  mach_port_right_t v17;
  CFRunLoopSourceContext v18;

  v7 = a5;
  HIDWORD(v18.perform) = a5;
  v12 = malloc_type_malloc(0x28uLL, 0x10A0040C7231A41uLL);
  v18.version = 1;
  v18.info = v12;
  v18.retain = 0;
  v18.release = (void (__cdecl *)(const void *))mshRelease;
  v18.copyDescription = (CFStringRef (__cdecl *)(const void *))mshCopyDescription;
  v18.equal = (Boolean (__cdecl *)(const void *, const void *))mshEqual;
  v18.hash = (CFHashCode (__cdecl *)(const void *))mshHash;
  v18.schedule = (void (__cdecl *)(void *, CFRunLoopRef, CFRunLoopMode))mshGetPort;
  v18.cancel = (void (__cdecl *)(void *, CFRunLoopRef, CFRunLoopMode))mshMIGPerform;
  v13 = *MEMORY[0x1E0C83DA0];
  if (!v7)
  {
    if (mach_port_allocate(*MEMORY[0x1E0C83DA0], 1u, (mach_port_name_t *)&v18.perform + 1))
      goto LABEL_10;
    if ((a4 & 4) == 0 && mach_port_insert_right(v13, HIDWORD(v18.perform), HIDWORD(v18.perform), 0x14u))
    {
      perform_high = HIDWORD(v18.perform);
      v16 = v13;
      v17 = 1;
      goto LABEL_9;
    }
    a4 &= ~1u;
    v7 = HIDWORD(v18.perform);
  }
  *v12 = v7;
  v12[1] = a4;
  *((_QWORD *)v12 + 3) = 0;
  *((_QWORD *)v12 + 4) = a3;
  *((_QWORD *)v12 + 1) = a6;
  *((_QWORD *)v12 + 2) = 0;
  result = CFRunLoopSourceCreate(a1, a2, &v18);
  if (result)
    return result;
  if ((a4 & 1) == 0)
  {
    mach_port_mod_refs(v13, HIDWORD(v18.perform), 1u, -1);
    perform_high = HIDWORD(v18.perform);
    v16 = v13;
    v17 = 0;
LABEL_9:
    mach_port_mod_refs(v16, perform_high, v17, -1);
  }
LABEL_10:
  free(v12);
  return 0;
}

uint64_t MSHGetMachPortFromSource(__CFRunLoopSource *a1)
{
  CFRunLoopSourceContext v2;

  memset(&v2, 0, sizeof(v2));
  CFRunLoopSourceGetContext(a1, &v2);
  if (v2.version == 1)
    return ((uint64_t (*)(void *))v2.schedule)(v2.info);
  else
    return 0;
}

BOOL MSHMIGSourceSetNoSendersCallback(__CFRunLoopSource *a1, uint64_t a2, mach_port_mscount_t a3)
{
  _QWORD *info;
  BOOL v7;
  mach_port_name_t v9;
  ipc_space_t v10;
  uint64_t v11;
  kern_return_t v12;
  mach_port_t v13;
  ipc_space_t v14;
  mach_port_name_t v15;
  mach_port_mscount_t v16;
  mach_msg_type_name_t v17;
  mach_port_t previous;
  CFRunLoopSourceContext context;

  memset(&context, 0, sizeof(context));
  CFRunLoopSourceGetContext(a1, &context);
  info = context.info;
  if (context.info)
    v7 = context.version == 1;
  else
    v7 = 0;
  if (!v7)
    return 0;
  v9 = MSHGetMachPortFromSource(a1);
  previous = 0;
  v10 = *MEMORY[0x1E0C83DA0];
  v11 = info[2];
  if (a2)
  {
    if (!v11)
      goto LABEL_13;
    v12 = mach_port_request_notification(*MEMORY[0x1E0C83DA0], v9, 70, 0, 0, 0x12u, &previous);
    if (v12)
    {
LABEL_15:
      info[2] = a2;
      goto LABEL_16;
    }
    v13 = previous;
    if (previous)
    {
      v14 = v10;
      v15 = v9;
      v16 = a3;
      v17 = 18;
    }
    else
    {
LABEL_13:
      v14 = v10;
      v15 = v9;
      v16 = a3;
      v13 = v9;
      v17 = 21;
    }
    v12 = mach_port_request_notification(v14, v15, 70, v16, v13, v17, &previous);
    goto LABEL_15;
  }
  if (!v11)
    return 0;
  info[2] = 0;
  v12 = mach_port_request_notification(v10, v9, 70, 0, 0, 0x12u, &previous);
LABEL_16:
  if (previous)
    mach_port_mod_refs(v10, previous, 2u, -1);
  return v12 == 0;
}

void MSHMIGSourceSetSendOnceCallback(__CFRunLoopSource *a1, uint64_t a2)
{
  BOOL v3;
  CFRunLoopSourceContext v4;

  memset(&v4, 0, sizeof(v4));
  CFRunLoopSourceGetContext(a1, &v4);
  if (v4.info)
    v3 = v4.version == 1;
  else
    v3 = 0;
  if (v3)
    *((_QWORD *)v4.info + 3) = a2;
}

BOOL AXValidateDictionaryAsDragWireFormat(void *a1)
{
  id v1;
  void *v2;
  char isKindOfClass;
  void *v4;
  char v5;
  void *v6;
  CFTypeID v7;
  CFTypeID TypeID;
  const __AXValue *v9;
  _BOOL8 v10;

  v1 = a1;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
    goto LABEL_6;
  objc_msgSend(v1, "objectForKeyedSubscript:", CFSTR("AXInteractionLocationDescriptorViewPointerNumberKey"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  if ((isKindOfClass & 1) == 0)
    goto LABEL_6;
  objc_msgSend(v1, "objectForKeyedSubscript:", CFSTR("AXInteractionLocationDescriptorAttributedNameKey"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  v5 = objc_opt_isKindOfClass();

  if ((v5 & 1) == 0)
    goto LABEL_6;
  objc_msgSend(v1, "objectForKeyedSubscript:", CFSTR("AXInteractionLocationDescriptorPointValueKey"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = CFGetTypeID(v6);
  TypeID = AXValueGetTypeID();

  if (v7 == TypeID)
  {
    objc_msgSend(v1, "objectForKeyedSubscript:", CFSTR("AXInteractionLocationDescriptorPointValueKey"));
    v9 = (const __AXValue *)objc_claimAutoreleasedReturnValue();
    v10 = AXValueGetType(v9) == kAXValueTypeCGPoint;

  }
  else
  {
LABEL_6:
    v10 = 0;
  }

  return v10;
}

uint64_t AXValidateDictionaryAsDropWireFormat(void *a1)
{
  id v1;
  void *v2;
  char isKindOfClass;
  void *v4;
  char v5;
  void *v6;
  CFTypeID v7;
  CFTypeID TypeID;
  const __AXValue *v9;
  AXValueType Type;
  void *v11;
  CFTypeID v12;
  CFTypeID v13;
  const __AXValue *v14;
  AXValueType v15;
  void *v16;
  CFTypeID v17;
  CFTypeID v18;
  const __AXValue *v19;
  AXValueType v20;
  void *v21;
  char v22;

  v1 = a1;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
    goto LABEL_11;
  objc_msgSend(v1, "objectForKeyedSubscript:", CFSTR("AXInteractionLocationDescriptorViewPointerNumberKey"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  if ((isKindOfClass & 1) == 0)
    goto LABEL_11;
  objc_msgSend(v1, "objectForKeyedSubscript:", CFSTR("AXInteractionLocationDescriptorAttributedNameKey"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  v5 = objc_opt_isKindOfClass();

  if ((v5 & 1) == 0)
    goto LABEL_11;
  objc_msgSend(v1, "objectForKeyedSubscript:", CFSTR("AXInteractionLocationDescriptorPointValueKey"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = CFGetTypeID(v6);
  TypeID = AXValueGetTypeID();

  if (v7 != TypeID)
    goto LABEL_11;
  objc_msgSend(v1, "objectForKeyedSubscript:", CFSTR("AXInteractionLocationDescriptorPointValueKey"));
  v9 = (const __AXValue *)objc_claimAutoreleasedReturnValue();
  Type = AXValueGetType(v9);

  if (Type != kAXValueTypeCGPoint)
    goto LABEL_11;
  objc_msgSend(v1, "objectForKeyedSubscript:", CFSTR("AXInteractionLocationDescriptorContextSpacePointKey"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = CFGetTypeID(v11);
  v13 = AXValueGetTypeID();

  if (v12 != v13)
    goto LABEL_11;
  objc_msgSend(v1, "objectForKeyedSubscript:", CFSTR("AXInteractionLocationDescriptorContextSpacePointKey"));
  v14 = (const __AXValue *)objc_claimAutoreleasedReturnValue();
  v15 = AXValueGetType(v14);

  if (v15 != kAXValueTypeCGPoint)
    goto LABEL_11;
  objc_msgSend(v1, "objectForKeyedSubscript:", CFSTR("AXInteractionLocationDescriptorFixedScreenSpacePointKey"));
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = CFGetTypeID(v16);
  v18 = AXValueGetTypeID();

  if (v17 != v18)
    goto LABEL_11;
  objc_msgSend(v1, "objectForKeyedSubscript:", CFSTR("AXInteractionLocationDescriptorFixedScreenSpacePointKey"));
  v19 = (const __AXValue *)objc_claimAutoreleasedReturnValue();
  v20 = AXValueGetType(v19);

  if (v20 == kAXValueTypeCGPoint)
  {
    objc_msgSend(v1, "objectForKeyedSubscript:", CFSTR("AXInteractionLocationDescriptorContextIDKey"));
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    v22 = objc_opt_isKindOfClass();

  }
  else
  {
LABEL_11:
    v22 = 0;
  }

  return v22 & 1;
}

uint64_t AXGetCFAttributedStringFromAXAttributedString(void *a1)
{
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    return objc_msgSend(a1, "cfAttributedString");
  else
    return 0;
}

uint64_t AXIsAXAttributedString()
{
  objc_opt_class();
  return objc_opt_isKindOfClass() & 1;
}

AXAttributedString *AXCreateAXAttributedStringFromCFAttributedString(uint64_t a1)
{
  return -[AXAttributedString initWithCFAttributedString:]([AXAttributedString alloc], "initWithCFAttributedString:", a1);
}

void sub_1B54C2980(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
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

void sub_1B54C2B18(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

id AXStringFromAXAttributedString(void *a1)
{
  id v1;
  id v2;
  void *v3;

  v1 = a1;
  if (objc_msgSend(v1, "isAXAttributedString"))
  {
    objc_msgSend(v1, "string");
    v2 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v2 = v1;
  }
  v3 = v2;

  return v3;
}

void _AXInitializeObserverAccess()
{
  if (_AXInitializeObserverAccess_onceToken != -1)
    dispatch_once(&_AXInitializeObserverAccess_onceToken, &__block_literal_global_6);
}

uint64_t _AXIgnoreNextNotification(uint64_t result)
{
  AXIgnoredNotification = result;
  return result;
}

uint64_t _AXUIElementRegisterNotificationObserverDiedCallback(void *a1)
{
  uint64_t result;

  if ((_AXUIElementRegisterNotificationObserverDiedCallback_observerDiedRegistered & 1) != 0)
    return 4294942092;
  result = 0;
  ObserverDiedCallback = a1;
  _AXUIElementRegisterNotificationObserverDiedCallback_observerDiedRegistered = 1;
  return result;
}

uint64_t _AXAddNotificationObserver()
{
  if (_AXInitializeObserverAccess_onceToken != -1)
    dispatch_once(&_AXInitializeObserverAccess_onceToken, &__block_literal_global_6);
  return AX_PERFORM_WITH_LOCK();
}

uint64_t _AXRemoveNotificationObserver()
{
  if (_AXInitializeObserverAccess_onceToken != -1)
    dispatch_once(&_AXInitializeObserverAccess_onceToken, &__block_literal_global_6);
  return AX_PERFORM_WITH_LOCK();
}

void _AXNotificationObserverClientDied(CFTypeRef cf)
{
  NSObject *v2;
  NSObject *v3;
  uint8_t v4[16];
  uint64_t v5;
  uint64_t v6;
  void (*v7)(uint64_t);
  void *v8;
  uint64_t *v9;
  CFTypeRef v10;
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  char v14;

  if (_AXInitializeObserverAccess_onceToken == -1)
  {
    if (!cf)
      goto LABEL_4;
    goto LABEL_3;
  }
  dispatch_once(&_AXInitializeObserverAccess_onceToken, &__block_literal_global_6);
  if (cf)
LABEL_3:
    CFRetain(cf);
LABEL_4:
  v11 = 0;
  v12 = &v11;
  v13 = 0x2020000000;
  v14 = 0;
  v5 = MEMORY[0x1E0C809B0];
  v6 = 3221225472;
  v7 = ___AXNotificationObserverClientDied_block_invoke;
  v8 = &unk_1E6919440;
  v9 = &v11;
  v10 = cf;
  AX_PERFORM_WITH_LOCK();
  if (*((_BYTE *)v12 + 24))
  {
    AXRuntimeLogCommon();
    v2 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)v4 = 0;
      _os_log_impl(&dword_1B54A6000, v2, OS_LOG_TYPE_INFO, "No more observers waiting to be disabled, turning off automation", v4, 2u);
    }

    _AXSAutomationLocalizedStringLookupInfoSetEnabled();
    _AXSSetAutomationEnabled();
    _AXSSetAuditInspectionModeEnabled();
  }
  else
  {
    AXRuntimeLogCommon();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)v4 = 0;
      _os_log_impl(&dword_1B54A6000, v3, OS_LOG_TYPE_INFO, "Automation disablement remaining: ", v4, 2u);
    }

  }
  if (ObserverDiedCallback)
    ObserverDiedCallback(cf);
  if (cf)
    CFRelease(cf);
  _Block_object_dispose(&v11, 8);
}

void sub_1B54C3B64(_Unwind_Exception *a1)
{
  uint64_t v1;

  _Block_object_dispose((const void *)(v1 - 48), 8);
  _Unwind_Resume(a1);
}

void AXTentativePidSuspend(uint64_t a1, uint64_t a2)
{
  NSObject *v4;
  void *v5;
  void *v6;
  void *v7;
  _QWORD v8[3];
  _QWORD v9[3];
  uint8_t buf[4];
  int v11;
  __int16 v12;
  const __CFString *v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  AXRuntimeLogPID();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 67109378;
    v11 = a1;
    v12 = 2112;
    v13 = CFSTR("<redacted>");
    _os_log_impl(&dword_1B54A6000, v4, OS_LOG_TYPE_INFO, "Tentative pid suspend: %d Name:%@", buf, 0x12u);
  }

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", a1, CFSTR("pid"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = v5;
  v9[1] = CFSTR("tentative-suspended");
  v8[1] = CFSTR("suspended-status");
  v8[2] = CFSTR("display-type");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", a2);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v9[2] = v6;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v9, v8, 3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  AXPushNotificationToSystemForBroadcast();
}

uint64_t _AXPidIsAssociatedInternal(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  char v13;
  uint64_t v14;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  os_unfair_lock_lock(&gAXSuspendedPidsLock);
  v18 = 0u;
  v19 = 0u;
  v16 = 0u;
  v17 = 0u;
  v4 = v3;
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v17;
    while (2)
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v17 != v7)
          objc_enumerationMutation(v4);
        v9 = *(void **)(*((_QWORD *)&v16 + 1) + 8 * v8);
        +[AXPidSuspensionInfo shared](AXPidSuspensionInfo, "shared", (_QWORD)v16);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "associatedRemotePidCacheForDisplay:", objc_msgSend(v9, "intValue"));
        v11 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", a1);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v13 = objc_msgSend(v11, "containsObject:", v12);

        if ((v13 & 1) != 0)
        {
          v14 = 1;
          goto LABEL_11;
        }
        ++v8;
      }
      while (v6 != v8);
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
      if (v6)
        continue;
      break;
    }
  }
  v14 = 0;
LABEL_11:

  os_unfair_lock_unlock(&gAXSuspendedPidsLock);
  return v14;
}

uint64_t _AXIsPidAssociated(uint64_t a1)
{
  void *v2;
  uint64_t IsAssociatedInternal;

  _allDisplayTypes();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  IsAssociatedInternal = _AXPidIsAssociatedInternal(a1, v2);

  return IsAssociatedInternal;
}

uint64_t _AXIsPidAssociatedWithDisplayType(uint64_t a1, uint64_t a2)
{
  void *v3;
  void *v4;
  uint64_t IsAssociatedInternal;
  _QWORD v7[2];

  v7[1] = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", a2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = v3;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v7, 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  IsAssociatedInternal = _AXPidIsAssociatedInternal(a1, v4);

  return IsAssociatedInternal;
}

uint64_t _AXPidIsSuspendedWithDisplayType(uint64_t a1, uint64_t a2)
{
  void *v3;
  void *v4;
  uint64_t IsSuspendedInternal;
  _QWORD v7[2];

  v7[1] = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", a2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = v3;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v7, 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  IsSuspendedInternal = _AXPidIsSuspendedInternal(a1, v4);

  return IsSuspendedInternal;
}

void _AXPutPidOnTimeoutProbation(uint64_t a1, uint64_t a2)
{
  NSObject *v4;
  void *v5;
  void *v6;
  void *v7;
  dispatch_time_t v8;
  _QWORD block[4];
  int v10;
  int v11;
  uint8_t buf[4];
  int v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  AXRuntimeLogPID();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 67109120;
    v13 = a1;
    _os_log_impl(&dword_1B54A6000, v4, OS_LOG_TYPE_INFO, "Pid on timeout probation %d", buf, 8u);
  }

  os_unfair_lock_lock(&gAXTimeoutProbationPidsLock);
  +[AXPidSuspensionInfo shared](AXPidSuspensionInfo, "shared");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "timeoutProbationPidsForDisplay:", a2);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", a1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "addObject:", v7);

  v8 = dispatch_time(0, 5000000000);
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = ___AXPutPidOnTimeoutProbation_block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  v10 = a1;
  v11 = a2;
  dispatch_after(v8, MEMORY[0x1E0C80D38], block);
  os_unfair_lock_unlock(&gAXTimeoutProbationPidsLock);

}

void _AXAddAssociatedPid(uint64_t a1, uint64_t a2, uint64_t a3)
{
  NSObject *v6;
  dispatch_time_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  _QWORD block[4];
  int v20;
  uint8_t buf[4];
  int v22;
  __int16 v23;
  int v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  AXRuntimeLogPID();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 67109376;
    v22 = a2;
    v23 = 1024;
    v24 = a1;
    _os_log_impl(&dword_1B54A6000, v6, OS_LOG_TYPE_INFO, "Associating pid (%d) with parent: (%d)", buf, 0xEu);
  }

  os_unfair_lock_lock(&gAXSuspendedPidsLock);
  v7 = dispatch_time(0, 300000000000);
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = ___AXAddAssociatedPid_block_invoke;
  block[3] = &__block_descriptor_36_e5_v8__0l;
  v20 = a3;
  dispatch_after(v7, MEMORY[0x1E0C80D38], block);
  +[AXPidSuspensionInfo shared](AXPidSuspensionInfo, "shared");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "associatedRemotePidsForDisplay:", a3);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", a1);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "objectForKey:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v11)
  {
    objc_msgSend(MEMORY[0x1E0C99E20], "set");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    +[AXPidSuspensionInfo shared](AXPidSuspensionInfo, "shared");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "associatedRemotePidsForDisplay:", a3);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", a1);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setObject:forKey:", v11, v14);

  }
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", a2);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "addObject:", v15);

  +[AXPidSuspensionInfo shared](AXPidSuspensionInfo, "shared");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "associatedRemotePidCacheForDisplay:", a3);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", a2);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "addObject:", v18);

  os_unfair_lock_unlock(&gAXSuspendedPidsLock);
}

void _AXClearAssociatedPids(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t j;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  dispatch_time_t v24;
  id obj;
  _QWORD block[4];
  int v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  uint8_t buf[8];
  _BYTE v37[128];
  _BYTE v38[128];
  uint64_t v39;

  v39 = *MEMORY[0x1E0C80C00];
  AXRuntimeLogPID();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1B54A6000, v2, OS_LOG_TYPE_INFO, "Clearing associated pids", buf, 2u);
  }

  os_unfair_lock_lock(&gAXSuspendedPidsLock);
  v34 = 0u;
  v35 = 0u;
  v32 = 0u;
  v33 = 0u;
  +[AXPidSuspensionInfo shared](AXPidSuspensionInfo, "shared");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "associatedRemotePidsForDisplay:", a1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "allKeys");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  obj = v5;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v32, v38, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v33;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v33 != v8)
          objc_enumerationMutation(obj);
        v10 = *(_QWORD *)(*((_QWORD *)&v32 + 1) + 8 * i);
        +[AXPidSuspensionInfo shared](AXPidSuspensionInfo, "shared");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "associatedRemotePidsForDisplay:", a1);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "objectForKey:", v10);
        v13 = (void *)objc_claimAutoreleasedReturnValue();

        v30 = 0u;
        v31 = 0u;
        v28 = 0u;
        v29 = 0u;
        v14 = v13;
        v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v28, v37, 16);
        if (v15)
        {
          v16 = v15;
          v17 = *(_QWORD *)v29;
          do
          {
            for (j = 0; j != v16; ++j)
            {
              if (*(_QWORD *)v29 != v17)
                objc_enumerationMutation(v14);
              v19 = *(void **)(*((_QWORD *)&v28 + 1) + 8 * j);
              if ((objc_msgSend(v19, "isEqual:", v10) & 1) == 0)
                _AXRemoveSuspendedPid(objc_msgSend(v19, "unsignedIntValue"), a1);
            }
            v16 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v28, v37, 16);
          }
          while (v16);
        }

      }
      v7 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v32, v38, 16);
    }
    while (v7);
  }

  +[AXPidSuspensionInfo shared](AXPidSuspensionInfo, "shared");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "associatedRemotePidsForDisplay:", a1);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "removeAllObjects");

  +[AXPidSuspensionInfo shared](AXPidSuspensionInfo, "shared");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "associatedRemotePidCacheForDisplay:", a1);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "removeAllObjects");

  os_unfair_lock_unlock(&gAXSuspendedPidsLock);
  v24 = dispatch_time(0, 300000000000);
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = ___AXClearAssociatedPids_block_invoke;
  block[3] = &__block_descriptor_36_e5_v8__0l;
  v27 = a1;
  dispatch_after(v24, MEMORY[0x1E0C80D38], block);
}

void ___displayMonitor_block_invoke()
{
  void *v0;
  id v1;
  uint64_t v2;
  void *v3;
  _QWORD v4[5];
  uint64_t v5;
  uint64_t *v6;
  uint64_t v7;
  uint64_t v8;

  if (!_AXSMossdeepEnabled())
  {
    v5 = 0;
    v6 = &v5;
    v7 = 0x2050000000;
    v0 = (void *)getFBSDisplayMonitorClass_softClass;
    v8 = getFBSDisplayMonitorClass_softClass;
    if (!getFBSDisplayMonitorClass_softClass)
    {
      v4[0] = MEMORY[0x1E0C809B0];
      v4[1] = 3221225472;
      v4[2] = __getFBSDisplayMonitorClass_block_invoke;
      v4[3] = &unk_1E69194D0;
      v4[4] = &v5;
      __getFBSDisplayMonitorClass_block_invoke((uint64_t)v4);
      v0 = (void *)v6[3];
    }
    v1 = objc_retainAutorelease(v0);
    _Block_object_dispose(&v5, 8);
    v2 = objc_opt_new();
    v3 = (void *)_displayMonitor_DisplayMonitor;
    _displayMonitor_DisplayMonitor = v2;

  }
}

void sub_1B54C4F88(_Unwind_Exception *a1, int a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, ...)
{
  id v10;
  void *v11;
  char v12;
  va_list va;

  va_start(va, a8);
  _Block_object_dispose(va, 8);
  if (a2 == 1)
  {
    v10 = objc_begin_catch(a1);
    objc_msgSend(v10, "name");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v11, "isEqualToString:", *MEMORY[0x1E0C99768]);

    if ((v12 & 1) != 0)
    {

      objc_end_catch();
      JUMPOUT(0x1B54C4F74);
    }
    objc_exception_rethrow();
  }
  _Unwind_Resume(a1);
}

Class __getFBSDisplayMonitorClass_block_invoke(uint64_t a1)
{
  Class result;
  void *v3;
  __int128 v4;
  uint64_t v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  v3 = 0;
  if (!FrontBoardServicesLibraryCore_frameworkLibrary)
  {
    v4 = xmmword_1E6919778;
    v5 = 0;
    FrontBoardServicesLibraryCore_frameworkLibrary = _sl_dlopen();
  }
  if (!FrontBoardServicesLibraryCore_frameworkLibrary)
    __getFBSDisplayMonitorClass_block_invoke_cold_1(&v3);
  result = objc_getClass("FBSDisplayMonitor");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
    __getFBSDisplayMonitorClass_block_invoke_cold_2();
  getFBSDisplayMonitorClass_softClass = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  return result;
}

id AXLabelForElements(void *a1)
{
  id v1;
  unint64_t v2;
  void *v3;
  __CFString *v4;
  id v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  uint64_t i;
  void *v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t j;
  uint64_t v21;
  void *v22;
  uint64_t v23;
  uint64_t v24;
  __CFString *v26;
  void *v27;
  id v28;
  void *v29;
  void *v30;
  uint64_t v31;
  uint64_t v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  void *v41;
  void *v42;
  _BYTE v43[128];
  _BYTE v44[128];
  uint64_t v45;

  v45 = *MEMORY[0x1E0C80C00];
  v1 = a1;
  if (!objc_msgSend(v1, "count"))
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "string");
    v5 = (id)objc_claimAutoreleasedReturnValue();
    goto LABEL_43;
  }
  objc_msgSend(MEMORY[0x1E0CB37A0], "string");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = objc_msgSend(v1, "count");
  objc_msgSend(v1, "firstObject");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  _AXLabelForElement(v3);
  v4 = (__CFString *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {

    v4 = &stru_1E691BCF0;
  }
  if (!-[__CFString length](v4, "length"))
    goto LABEL_9;
  if (!-[__CFString isAXAttributedString](v4, "isAXAttributedString"))
  {
    objc_msgSend(v29, "appendString:", v4);
LABEL_9:
    v30 = 0;
    goto LABEL_10;
  }
  v42 = 0;
  _appendAttributedString(v29, v4, &v42);
  v30 = v42;
LABEL_10:
  objc_opt_class();
  if (v2 < 2)
  {
    v7 = v29;
  }
  else
  {
    v6 = 1;
    v7 = v29;
    do
    {
      objc_msgSend(v1, "objectAtIndex:", v6);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      _AXLabelForElement(v8);
      v9 = (void *)objc_claimAutoreleasedReturnValue();

      if ((objc_opt_isKindOfClass() & 1) != 0 && objc_msgSend(v9, "length"))
      {
        if (objc_msgSend(v9, "isAXAttributedString"))
        {
          v41 = v30;
          _appendAttributedString(v29, v9, &v41);
          v10 = v41;

          v30 = v10;
        }
        else
        {
          if (objc_msgSend(v29, "length"))
            objc_msgSend(v29, "appendString:", CFSTR(", "));
          objc_msgSend(v29, "appendString:", v9);
        }
      }

      ++v6;
    }
    while (v2 != v6);
  }
  v11 = v30;
  if (v30)
  {
    v26 = v4;
    v27 = v3;
    v28 = v1;
    +[AXAttributedString axAttributedStringWithString:](AXAttributedString, "axAttributedStringWithString:", v7);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v37 = 0u;
    v38 = 0u;
    v39 = 0u;
    v40 = 0u;
    v13 = v30;
    v32 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v37, v44, 16);
    if (v32)
    {
      v31 = *(_QWORD *)v38;
      do
      {
        for (i = 0; i != v32; ++i)
        {
          if (*(_QWORD *)v38 != v31)
            objc_enumerationMutation(v13);
          v15 = *(void **)(*((_QWORD *)&v37 + 1) + 8 * i);
          objc_msgSend(v13, "objectForKey:", v15);
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          v33 = 0u;
          v34 = 0u;
          v35 = 0u;
          v36 = 0u;
          v17 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v33, v43, 16);
          if (v17)
          {
            v18 = v17;
            v19 = *(_QWORD *)v34;
            do
            {
              for (j = 0; j != v18; ++j)
              {
                if (*(_QWORD *)v34 != v19)
                  objc_enumerationMutation(v16);
                v21 = *(_QWORD *)(*((_QWORD *)&v33 + 1) + 8 * j);
                objc_msgSend(v16, "objectForKey:", v21);
                v22 = (void *)objc_claimAutoreleasedReturnValue();
                v23 = objc_msgSend(v15, "rangeValue");
                objc_msgSend(v12, "setAttribute:forKey:withRange:", v22, v21, v23, v24);

              }
              v18 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v33, v43, 16);
            }
            while (v18);
          }

        }
        v32 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v37, v44, 16);
      }
      while (v32);
    }

    v3 = v27;
    v1 = v28;
    v4 = v26;
    v11 = v30;
  }
  else
  {
    v12 = v7;
  }
  if (objc_msgSend(v12, "length"))
    v5 = v12;
  else
    v5 = 0;

LABEL_43:
  return v5;
}

AXAttributedString *_AXLabelForElement(void *a1)
{
  AXAttributedString *v1;
  AXAttributedString *v2;
  AXAttributedString *v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  AXAttributedString *v7;

  v1 = a1;
  objc_opt_class();
  v2 = v1;
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_opt_class();
    v2 = v1;
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      v3 = v1;
      if ((objc_opt_respondsToSelector() & 1) != 0)
      {
        -[AXAttributedString _accessibilityAXAttributedLabel](v3, "_accessibilityAXAttributedLabel");
        v4 = objc_claimAutoreleasedReturnValue();
      }
      else
      {
        if ((objc_opt_respondsToSelector() & 1) != 0)
        {
          -[AXAttributedString accessibilityAttributedLabel](v3, "accessibilityAttributedLabel");
          v5 = objc_claimAutoreleasedReturnValue();
          if (v5)
          {
            v6 = (void *)v5;
            v2 = -[AXAttributedString initWithCFAttributedString:]([AXAttributedString alloc], "initWithCFAttributedString:", v5);

LABEL_10:
            goto LABEL_11;
          }
        }
        -[AXAttributedString accessibilityLabel](v3, "accessibilityLabel");
        v4 = objc_claimAutoreleasedReturnValue();
      }
      v2 = (AXAttributedString *)v4;
      goto LABEL_10;
    }
  }
LABEL_11:
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v7 = AXCreateAXAttributedStringFromCFAttributedString((uint64_t)v2);

    v2 = v7;
  }

  return v2;
}

void _appendAttributedString(void *a1, void *a2, void **a3)
{
  id v5;
  id v6;
  uint64_t v7;
  BOOL v8;
  unint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  int v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  id v26;
  void **v27;
  unint64_t v28;
  unint64_t v29;
  uint64_t v30;
  __CFString *v31;
  _QWORD v32[2];

  v32[1] = *MEMORY[0x1E0C80C00];
  v5 = a1;
  v6 = a2;
  v27 = a3;
  if (!*a3)
    *a3 = (id)objc_msgSend(objc_allocWithZone(MEMORY[0x1E0C99E08]), "init");
  v7 = objc_msgSend(v5, "length");
  v8 = v7 != 0;
  if (v7)
    objc_msgSend(v5, "appendString:", CFSTR(", "));
  v29 = 0;
  v30 = 0;
  v28 = objc_msgSend(v6, "length");
  v9 = 0;
  v26 = v5;
  while (1)
  {
    objc_msgSend(v6, "attributesAtIndex:effectiveRange:", v9, &v29, v26);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = v10;
    if (v29 == 0x7FFFFFFFFFFFFFFFLL)
      break;
    objc_msgSend(v6, "string");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "substringWithRange:", v29, v30);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    if (v11)
    {
      v14 = objc_msgSend(v5, "length");
      v15 = objc_msgSend(v13, "length");
      if (v8)
      {
        objc_msgSend(v11, "objectForKeyedSubscript:", UIAccessibilityTokenLiteralText);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        v17 = objc_msgSend(v16, "BOOLValue");

        v18 = v14 - objc_msgSend(CFSTR(", "), "length");
        v19 = objc_msgSend(CFSTR(", "), "length");
        v20 = v19;
        if (v17)
        {
          v21 = *v27;
          v31 = UIAccessibilityTokenIgnoreLeadingCommas;
          v32[0] = MEMORY[0x1E0C9AAB0];
          v8 = 1;
          objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v32, &v31, 1);
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithRange:", v18, v20);
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v21, "setObject:forKey:", v22, v23);

        }
        else
        {
          v8 = 0;
          v15 += v19;
          v14 = v18;
        }
        v5 = v26;
      }
      else
      {
        v8 = 0;
      }
      v24 = *v27;
      objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithRange:", v14, v15);
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "setObject:forKey:", v11, v25);

    }
    objc_msgSend(v5, "appendString:", v13);
    v29 += v30;

    v9 = v29;
    if (v29 == 0x7FFFFFFFFFFFFFFFLL || v29 >= v28)
      goto LABEL_19;
  }

LABEL_19:
}

id AXLabelAndValueForElements(void *a1)
{
  id v1;
  unint64_t v2;
  void *v3;
  __CFString *v4;
  id v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  uint64_t i;
  void *v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t j;
  uint64_t v21;
  void *v22;
  uint64_t v23;
  uint64_t v24;
  __CFString *v26;
  void *v27;
  id v28;
  void *v29;
  void *v30;
  uint64_t v31;
  uint64_t v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  void *v41;
  void *v42;
  _BYTE v43[128];
  _BYTE v44[128];
  uint64_t v45;

  v45 = *MEMORY[0x1E0C80C00];
  v1 = a1;
  if (!objc_msgSend(v1, "count"))
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "string");
    v5 = (id)objc_claimAutoreleasedReturnValue();
    goto LABEL_43;
  }
  objc_msgSend(MEMORY[0x1E0CB37A0], "string");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = objc_msgSend(v1, "count");
  objc_msgSend(v1, "firstObject");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  _AXLabelAndValueForElement(v3);
  v4 = (__CFString *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {

    v4 = &stru_1E691BCF0;
  }
  if (!-[__CFString length](v4, "length"))
    goto LABEL_9;
  if (!-[__CFString isAXAttributedString](v4, "isAXAttributedString"))
  {
    objc_msgSend(v29, "appendString:", v4);
LABEL_9:
    v30 = 0;
    goto LABEL_10;
  }
  v42 = 0;
  _appendAttributedString(v29, v4, &v42);
  v30 = v42;
LABEL_10:
  objc_opt_class();
  if (v2 < 2)
  {
    v7 = v29;
  }
  else
  {
    v6 = 1;
    v7 = v29;
    do
    {
      objc_msgSend(v1, "objectAtIndex:", v6);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      _AXLabelAndValueForElement(v8);
      v9 = (void *)objc_claimAutoreleasedReturnValue();

      if ((objc_opt_isKindOfClass() & 1) != 0 && objc_msgSend(v9, "length"))
      {
        if (objc_msgSend(v9, "isAXAttributedString"))
        {
          v41 = v30;
          _appendAttributedString(v29, v9, &v41);
          v10 = v41;

          v30 = v10;
        }
        else
        {
          if (objc_msgSend(v29, "length"))
            objc_msgSend(v29, "appendString:", CFSTR(", "));
          objc_msgSend(v29, "appendString:", v9);
        }
      }

      ++v6;
    }
    while (v2 != v6);
  }
  v11 = v30;
  if (v30)
  {
    v26 = v4;
    v27 = v3;
    v28 = v1;
    +[AXAttributedString axAttributedStringWithString:](AXAttributedString, "axAttributedStringWithString:", v7);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v37 = 0u;
    v38 = 0u;
    v39 = 0u;
    v40 = 0u;
    v13 = v30;
    v32 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v37, v44, 16);
    if (v32)
    {
      v31 = *(_QWORD *)v38;
      do
      {
        for (i = 0; i != v32; ++i)
        {
          if (*(_QWORD *)v38 != v31)
            objc_enumerationMutation(v13);
          v15 = *(void **)(*((_QWORD *)&v37 + 1) + 8 * i);
          objc_msgSend(v13, "objectForKey:", v15);
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          v33 = 0u;
          v34 = 0u;
          v35 = 0u;
          v36 = 0u;
          v17 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v33, v43, 16);
          if (v17)
          {
            v18 = v17;
            v19 = *(_QWORD *)v34;
            do
            {
              for (j = 0; j != v18; ++j)
              {
                if (*(_QWORD *)v34 != v19)
                  objc_enumerationMutation(v16);
                v21 = *(_QWORD *)(*((_QWORD *)&v33 + 1) + 8 * j);
                objc_msgSend(v16, "objectForKey:", v21);
                v22 = (void *)objc_claimAutoreleasedReturnValue();
                v23 = objc_msgSend(v15, "rangeValue");
                objc_msgSend(v12, "setAttribute:forKey:withRange:", v22, v21, v23, v24);

              }
              v18 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v33, v43, 16);
            }
            while (v18);
          }

        }
        v32 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v37, v44, 16);
      }
      while (v32);
    }

    v3 = v27;
    v1 = v28;
    v4 = v26;
    v11 = v30;
  }
  else
  {
    v12 = v7;
  }
  if (objc_msgSend(v12, "length"))
    v5 = v12;
  else
    v5 = 0;

LABEL_43:
  return v5;
}

id _AXLabelAndValueForElement(void *a1)
{
  id v1;
  void *v2;
  void *v3;
  AXAttributedString *v4;
  AXAttributedString *v5;
  AXAttributedString *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  AXAttributedString *v10;
  void *v11;
  void *v12;
  id v13;
  uint64_t i;
  void *v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t j;
  uint64_t v21;
  void *v22;
  uint64_t v23;
  uint64_t v24;
  void *v26;
  AXAttributedString *v27;
  void *v28;
  AXAttributedString *v29;
  void *v30;
  uint64_t v31;
  uint64_t v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  void *v41;
  void *v42;
  _BYTE v43[128];
  _BYTE v44[128];
  uint64_t v45;

  v45 = *MEMORY[0x1E0C80C00];
  v1 = a1;
  objc_msgSend(MEMORY[0x1E0CB37A0], "string");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  _AXLabelForElement(v1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (AXAttributedString *)v1;
  objc_opt_class();
  v5 = v4;
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_opt_class();
    v5 = v4;
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      v6 = v4;
      if ((objc_opt_respondsToSelector() & 1) != 0)
      {
        -[AXAttributedString _accessibilityAXAttributedValue](v6, "_accessibilityAXAttributedValue");
        v7 = objc_claimAutoreleasedReturnValue();
      }
      else
      {
        if ((objc_opt_respondsToSelector() & 1) != 0)
        {
          -[AXAttributedString accessibilityAttributedValue](v6, "accessibilityAttributedValue");
          v8 = objc_claimAutoreleasedReturnValue();
          if (v8)
          {
            v9 = (void *)v8;
            v5 = -[AXAttributedString initWithCFAttributedString:]([AXAttributedString alloc], "initWithCFAttributedString:", v8);

LABEL_10:
            goto LABEL_11;
          }
        }
        -[AXAttributedString accessibilityValue](v6, "accessibilityValue");
        v7 = objc_claimAutoreleasedReturnValue();
      }
      v5 = (AXAttributedString *)v7;
      goto LABEL_10;
    }
  }
LABEL_11:
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v10 = AXCreateAXAttributedStringFromCFAttributedString((uint64_t)v5);

    v5 = v10;
  }

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0 || !objc_msgSend(v3, "length"))
    goto LABEL_18;
  if (!objc_msgSend(v3, "isAXAttributedString"))
  {
    objc_msgSend(v2, "appendString:", v3);
LABEL_18:
    v11 = 0;
    goto LABEL_19;
  }
  v42 = 0;
  _appendAttributedString(v2, v3, &v42);
  v11 = v42;
LABEL_19:
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0 || !-[AXAttributedString length](v5, "length"))
  {
LABEL_23:
    if (!v11)
      goto LABEL_39;
    goto LABEL_24;
  }
  if (-[AXAttributedString isAXAttributedString](v5, "isAXAttributedString"))
  {
    v41 = v11;
    _appendAttributedString(v2, v5, &v41);
    v12 = v41;

    v11 = v12;
    goto LABEL_23;
  }
  if (objc_msgSend(v2, "length"))
    objc_msgSend(v2, "appendString:", CFSTR(", "));
  objc_msgSend(v2, "appendString:", v5);
  if (v11)
  {
LABEL_24:
    v27 = v5;
    v28 = v2;
    v29 = v4;
    v30 = v3;
    +[AXAttributedString axAttributedStringWithString:](AXAttributedString, "axAttributedStringWithString:", v2);
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    v37 = 0u;
    v38 = 0u;
    v39 = 0u;
    v40 = 0u;
    v26 = v11;
    v13 = v11;
    v32 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v37, v44, 16);
    if (v32)
    {
      v31 = *(_QWORD *)v38;
      do
      {
        for (i = 0; i != v32; ++i)
        {
          if (*(_QWORD *)v38 != v31)
            objc_enumerationMutation(v13);
          v15 = *(void **)(*((_QWORD *)&v37 + 1) + 8 * i);
          objc_msgSend(v13, "objectForKey:", v15);
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          v33 = 0u;
          v34 = 0u;
          v35 = 0u;
          v36 = 0u;
          v17 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v33, v43, 16);
          if (v17)
          {
            v18 = v17;
            v19 = *(_QWORD *)v34;
            do
            {
              for (j = 0; j != v18; ++j)
              {
                if (*(_QWORD *)v34 != v19)
                  objc_enumerationMutation(v16);
                v21 = *(_QWORD *)(*((_QWORD *)&v33 + 1) + 8 * j);
                objc_msgSend(v16, "objectForKey:", v21);
                v22 = (void *)objc_claimAutoreleasedReturnValue();
                v23 = objc_msgSend(v15, "rangeValue");
                objc_msgSend(v2, "setAttribute:forKey:withRange:", v22, v21, v23, v24);

              }
              v18 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v33, v43, 16);
            }
            while (v18);
          }

        }
        v32 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v37, v44, 16);
      }
      while (v32);
    }

    v4 = v29;
    v3 = v30;
    v11 = v26;
    v5 = v27;
  }
LABEL_39:

  return v2;
}

id __AXStringForVariables(void *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, id a9)
{
  __AXStringForVariablesWithVariadics(a1, &a9);
  return (id)objc_claimAutoreleasedReturnValue();
}

id __AXStringForVariablesWithVariadics(void *a1, id *a2)
{
  id v3;
  void *v4;
  void *v5;
  id *v6;
  id v7;
  void *v8;
  id *v10;

  v3 = a1;
  v10 = a2;
  objc_opt_class();
  v4 = (void *)objc_opt_new();
  v5 = v4;
  if (v3)
    objc_msgSend(v4, "addObject:", v3);
  while (1)
  {
    v6 = v10++;
    v7 = *v6;
    if (!v7)
      goto LABEL_7;
    if ((objc_opt_isKindOfClass() & 1) != 0
      && (objc_msgSend(v7, "isEqualToString:", CFSTR("__AXStringForVariablesSentinel")) & 1) != 0)
    {
      break;
    }
    objc_msgSend(v5, "addObject:", v7);
LABEL_7:

  }
  AXLabelForElements(v5);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

id AXArrayForString(void *a1)
{
  id v1;
  void *v2;
  _QWORD v4[2];

  v4[1] = *MEMORY[0x1E0C80C00];
  v1 = a1;
  if (objc_msgSend(v1, "length"))
  {
    v4[0] = v1;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v4, 1);
    v2 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v2 = (void *)MEMORY[0x1E0C9AA60];
  }

  return v2;
}

void _gatherTransactionSummary()
{
  void *v0;
  void *v1;
  int v2;
  void *v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;

  objc_msgSend(MEMORY[0x1E0CB3898], "processInfo");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "processName");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = objc_msgSend(&unk_1E6926B30, "containsObject:", v1);

  if (v2)
  {
    +[AXProfileDatabase sharedDatabase](AXProfileDatabase, "sharedDatabase");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "transactionSummary");
    v12 = (id)objc_claimAutoreleasedReturnValue();

    v4 = objc_alloc_init(MEMORY[0x1E0CB3578]);
    objc_msgSend(v4, "setDateFormat:", CFSTR("yyyy-MM-dd_HH-mm-ss"));
    objc_msgSend(MEMORY[0x1E0C99D68], "date");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "stringFromDate:", v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    v7 = (void *)MEMORY[0x1E0CB3940];
    objc_msgSend(MEMORY[0x1E0CB3898], "processInfo");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "processName");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3898], "processInfo");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "stringWithFormat:", CFSTR("/var/mobile/Library/Accessibility/axperf_%@_%d_%@.csv"), v9, objc_msgSend(v10, "processIdentifier"), v6);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v12, "writeToFile:atomically:encoding:error:", v11, 1, 4, 0);
  }
}

void sub_1B54C85D0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1B54C8BE0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, char a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,char a29)
{
  uint64_t v29;

  _Block_object_dispose(&a16, 8);
  _Block_object_dispose(&a29, 8);
  _Block_object_dispose((const void *)(v29 - 160), 8);
  _Block_object_dispose((const void *)(v29 - 192), 8);
  _Unwind_Resume(a1);
}

id AXRemoteElementConcatSceneUUIDAndContextId(void *a1, uint64_t a2)
{
  void *v3;
  id v4;
  void *v5;
  void *v6;

  v3 = (void *)MEMORY[0x1E0CB37E8];
  v4 = a1;
  objc_msgSend(v3, "numberWithUnsignedInt:", a2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "stringByAppendingFormat:", CFSTR("_%@"), v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

id AXUIElementConvertOutgoingType(void *a1)
{
  id v1;
  void *v2;
  void *v3;
  id v4;
  void *v6;
  char isKindOfClass;
  const char *v8;
  uint64_t v9;
  AXValueType v10;
  void *v11;
  id v12;
  id v13;
  void *v14;
  void *v15;
  id v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  AXValueRef v25;
  _QWORD v26[4];
  id v27;
  id v28;
  _QWORD v29[4];
  id v30;
  uint64_t valuePtr;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;

  v1 = a1;
  if (v1)
  {
    objc_opt_self();
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
LABEL_5:

      goto LABEL_6;
    }
    objc_opt_self();
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {

      goto LABEL_5;
    }
    objc_opt_self();
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    isKindOfClass = objc_opt_isKindOfClass();

    if ((isKindOfClass & 1) != 0)
      goto LABEL_6;
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v1 = objc_retainAutorelease(v1);
      v8 = (const char *)objc_msgSend(v1, "objCType");
      if (!strcmp(v8, "{CGRect={CGPoint=dd}{CGSize=dd}}"))
      {
        objc_msgSend(v1, "rectValue");
        valuePtr = v17;
        v32 = v18;
        v33 = v19;
        v34 = v20;
        v10 = kAXValueTypeCGRect;
      }
      else if (!strcmp(v8, "{CGPoint=dd}"))
      {
        objc_msgSend(v1, "pointValue");
        valuePtr = v21;
        v32 = v22;
        v10 = kAXValueTypeCGPoint;
      }
      else if (!strcmp(v8, "{CGSize=dd}"))
      {
        objc_msgSend(v1, "sizeValue");
        valuePtr = v23;
        v32 = v24;
        v10 = kAXValueTypeCGSize;
      }
      else
      {
        if (strcmp(v8, "{_NSRange=QQ}"))
          goto LABEL_6;
        valuePtr = objc_msgSend(v1, "rangeValue");
        v32 = v9;
        v10 = kAXValueTypeCFRange;
      }
      v25 = AXValueCreate(v10, &valuePtr);
      CFAutorelease(v25);
      v13 = (id)objc_claimAutoreleasedReturnValue();

LABEL_22:
      v1 = v13;
      goto LABEL_6;
    }
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v11 = (void *)objc_msgSend(v1, "mutableCopy");
      v29[0] = MEMORY[0x1E0C809B0];
      v29[1] = 3221225472;
      v29[2] = __AXUIElementConvertOutgoingType_block_invoke;
      v29[3] = &unk_1E6919938;
      v12 = v11;
      v30 = v12;
      objc_msgSend(v1, "enumerateObjectsUsingBlock:", v29);
      v13 = v12;

      goto LABEL_22;
    }
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v14 = (void *)objc_msgSend(v1, "mutableCopy");
      objc_msgSend(v14, "allKeys");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v26[0] = MEMORY[0x1E0C809B0];
      v26[1] = 3221225472;
      v26[2] = __AXUIElementConvertOutgoingType_block_invoke_2;
      v26[3] = &unk_1E6919A10;
      v16 = v14;
      v27 = v16;
      v28 = v1;
      objc_msgSend(v15, "enumerateObjectsUsingBlock:", v26);

      v1 = v16;
    }
  }
LABEL_6:
  v4 = v1;

  return v4;
}

void sub_1B54CB5D0(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1B54CB628(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1B54CB6D0(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1B54CB784(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id obj)
{
  objc_sync_exit(obj);
  _Unwind_Resume(a1);
}

void sub_1B54CBAC4(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1B54CBBD0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, char a15)
{
  void *v15;

  objc_sync_exit(v15);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__0(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__0(uint64_t a1)
{

}

void sub_1B54CC06C(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

uint64_t AXBundleForElement(void *a1, const char *a2)
{
  return objc_msgSend(a1, "stringWithAXAttribute:", 3003);
}

void sub_1B54CE9C8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1B54D146C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__1(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__1(uint64_t a1)
{

}

void sub_1B54D1DE0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  _Block_object_dispose(&a9, 8);
  _Unwind_Resume(a1);
}

void sub_1B54D2E54(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,uint64_t a44,uint64_t a45,uint64_t a46,uint64_t a47,void *a48,uint64_t a49,uint64_t a50,uint64_t a51,uint64_t a52,uint64_t a53,void *a54,void *a55,uint64_t a56,void *a57,uint64_t a58,uint64_t a59,uint64_t a60,uint64_t a61,uint64_t a62,void *a63)
{
  void *a64;

  _Unwind_Resume(a1);
}

void sub_1B54D3108(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_list va;

  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1B54D3474(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_list va;

  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

id __copy_helper_block_e8_96n12_8_8_s0_t8w32144n15_8_8_s0_s8_t16w8(uint64_t a1, uint64_t a2)
{
  __int128 v4;
  id result;

  *(_QWORD *)(a1 + 96) = *(id *)(a2 + 96);
  v4 = *(_OWORD *)(a2 + 120);
  *(_OWORD *)(a1 + 104) = *(_OWORD *)(a2 + 104);
  *(_OWORD *)(a1 + 120) = v4;
  *(_QWORD *)(a1 + 144) = *(id *)(a2 + 144);
  result = *(id *)(a2 + 152);
  *(_QWORD *)(a1 + 152) = result;
  *(_QWORD *)(a1 + 160) = *(_QWORD *)(a2 + 160);
  return result;
}

void __destroy_helper_block_e8_96n4_8_s0144n7_8_s0_s8(id *a1)
{

}

void sub_1B54D3E24(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1B54D451C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, ...)
{
  va_list va;

  va_start(va, a3);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1B54D4AA4(_Unwind_Exception *a1)
{
  uint64_t v1;

  _Block_object_dispose((const void *)(v1 - 80), 8);
  _Unwind_Resume(a1);
}

Class __getAXPIFingerControllerClass_block_invoke(uint64_t a1)
{
  Class result;

  AccessibilityPhysicalInteractionLibrary();
  result = objc_getClass("AXPIFingerController");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
    __getAXPIFingerControllerClass_block_invoke_cold_1();
  getAXPIFingerControllerClass_softClass = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  return result;
}

void AccessibilityPhysicalInteractionLibrary()
{
  void *v0;
  __int128 v1;
  uint64_t v2;
  uint64_t v3;

  v3 = *MEMORY[0x1E0C80C00];
  v0 = 0;
  if (!AccessibilityPhysicalInteractionLibraryCore_frameworkLibrary)
  {
    v1 = xmmword_1E6919D58;
    v2 = 0;
    AccessibilityPhysicalInteractionLibraryCore_frameworkLibrary = _sl_dlopen();
  }
  if (!AccessibilityPhysicalInteractionLibraryCore_frameworkLibrary)
    AccessibilityPhysicalInteractionLibrary_cold_1(&v0);
}

Class __getAXMTextDetectionOptionsClass_block_invoke(uint64_t a1)
{
  Class result;

  AXMediaUtilitiesLibrary();
  result = objc_getClass("AXMTextDetectionOptions");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
    __getAXMTextDetectionOptionsClass_block_invoke_cold_1();
  getAXMTextDetectionOptionsClass_softClass = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  return result;
}

uint64_t AXMediaUtilitiesLibrary()
{
  void *v1;
  __int128 v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  v1 = 0;
  if (!AXMediaUtilitiesLibraryCore_frameworkLibrary)
  {
    v2 = xmmword_1E6919D70;
    v3 = 0;
    AXMediaUtilitiesLibraryCore_frameworkLibrary = _sl_dlopen();
  }
  if (!AXMediaUtilitiesLibraryCore_frameworkLibrary)
    AXMediaUtilitiesLibrary_cold_1(&v1);
  return AXMediaUtilitiesLibraryCore_frameworkLibrary;
}

Class __getAXMDisplayManagerClass_block_invoke(uint64_t a1)
{
  Class result;

  AXMediaUtilitiesLibrary();
  result = objc_getClass("AXMDisplayManager");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
    __getAXMDisplayManagerClass_block_invoke_cold_1();
  getAXMDisplayManagerClass_softClass = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  return result;
}

Class __getAXMVisionScreenRecognitionOptionsClass_block_invoke(uint64_t a1)
{
  Class result;

  AXMediaUtilitiesLibrary();
  result = objc_getClass("AXMVisionScreenRecognitionOptions");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
    __getAXMVisionScreenRecognitionOptionsClass_block_invoke_cold_1();
  getAXMVisionScreenRecognitionOptionsClass_softClass = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  return result;
}

Class __getAXMScreenRecognitionCenterClass_block_invoke(uint64_t a1)
{
  Class result;

  AXMediaUtilitiesLibrary();
  result = objc_getClass("AXMScreenRecognitionCenter");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
    __getAXMScreenRecognitionCenterClass_block_invoke_cold_1();
  getAXMScreenRecognitionCenterClass_softClass = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  return result;
}

Class __getAXMVisionFeatureClass_block_invoke(uint64_t a1)
{
  Class result;

  AXMediaUtilitiesLibrary();
  result = objc_getClass("AXMVisionFeature");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
    __getAXMVisionFeatureClass_block_invoke_cold_1();
  getAXMVisionFeatureClass_softClass = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  return result;
}

Class __getAXSettingsClass_block_invoke(uint64_t a1)
{
  Class result;
  void *v3;
  __int128 v4;
  uint64_t v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  v3 = 0;
  if (!AccessibilityUtilitiesLibraryCore_frameworkLibrary)
  {
    v4 = xmmword_1E6919D88;
    v5 = 0;
    AccessibilityUtilitiesLibraryCore_frameworkLibrary = _sl_dlopen();
  }
  if (!AccessibilityUtilitiesLibraryCore_frameworkLibrary)
    __getAXSettingsClass_block_invoke_cold_1(&v3);
  result = objc_getClass("AXSettings");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
    __getAXSettingsClass_block_invoke_cold_2();
  getAXSettingsClass_softClass = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  return result;
}

Class __getAXNamedReplayableGestureClass_block_invoke(uint64_t a1)
{
  Class result;

  AccessibilityPhysicalInteractionLibrary();
  result = objc_getClass("AXNamedReplayableGesture");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
    __getAXNamedReplayableGestureClass_block_invoke_cold_1();
  getAXNamedReplayableGestureClass_softClass = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  return result;
}

void OUTLINED_FUNCTION_0_3(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint8_t *a5)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, a5, 0xCu);
}

void _accessibilityEventsHandler(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void (**v12)(_QWORD, _QWORD, _QWORD);
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  objc_msgSend((id)Handlers, "allKeys", 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v14;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v14 != v9)
          objc_enumerationMutation(v6);
        objc_msgSend((id)Handlers, "objectForKey:", *(_QWORD *)(*((_QWORD *)&v13 + 1) + 8 * v10));
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "objectForKey:", CFSTR("handler"));
        v12 = (void (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();

        if (v12)
          v12[2](v12, a3, a4);

        ++v10;
      }
      while (v8 != v10);
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v8);
  }

}

void AX_CGPathEnumerateElementsUsingBlock(const CGPath *a1, void *a2)
{
  id v3;
  id v4;
  void *v5;
  _QWORD aBlock[4];
  id v7;
  _QWORD *v8;
  _QWORD *v9;
  _QWORD v10[4];
  _QWORD v11[3];
  char v12;

  v3 = a2;
  v11[0] = 0;
  v11[1] = v11;
  v11[2] = 0x2020000000;
  v12 = 0;
  v10[0] = 0;
  v10[1] = v10;
  v10[2] = 0x2020000000;
  v10[3] = 0;
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __AX_CGPathEnumerateElementsUsingBlock_block_invoke;
  aBlock[3] = &unk_1E6919DD0;
  v8 = v11;
  v4 = v3;
  v7 = v4;
  v9 = v10;
  v5 = _Block_copy(aBlock);
  CGPathApply(a1, v5, (CGPathApplierFunction)_CGPathEnumerationIteration);

  _Block_object_dispose(v10, 8);
  _Block_object_dispose(v11, 8);

}

void sub_1B54D6AD8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  uint64_t v9;
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v9 - 64), 8);
  _Unwind_Resume(a1);
}

void _CGPathEnumerationIteration(const void *a1, uint64_t a2)
{
  void (**v3)(id, _QWORD);

  v3 = (void (**)(id, _QWORD))_Block_copy(a1);
  v3[2](v3, a2);

}

void sub_1B54DA838(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

Class __getAXCustomContentClass_block_invoke(uint64_t a1)
{
  Class result;
  void *v3;
  __int128 v4;
  uint64_t v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  v3 = 0;
  if (!AccessibilityLibraryCore_frameworkLibrary)
  {
    v4 = xmmword_1E6919E78;
    v5 = 0;
    AccessibilityLibraryCore_frameworkLibrary = _sl_dlopen();
  }
  if (!AccessibilityLibraryCore_frameworkLibrary)
    __getAXCustomContentClass_block_invoke_cold_1(&v3);
  result = objc_getClass("AXCustomContent");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
    __getAXCustomContentClass_block_invoke_cold_2();
  getAXCustomContentClass_softClass = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  return result;
}

uint64_t __Block_byref_object_copy__2(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__2(uint64_t a1)
{

}

void _accessibilityEventsHandler_0(uint64_t a1, uint64_t a2, int a3, const void *a4, void *a5)
{
  uint64_t v7;
  id v8;

  v8 = a5;
  if (a3 > 1043)
  {
    if (a3 <= 1054)
    {
      if (a3 == 1044)
      {
        objc_msgSend(v8, "_handleUpdateElementVisuals:", a4);
      }
      else if (a3 == 1053)
      {
        objc_msgSend(v8, "_handleNativeFocusItemDidChange:", a4);
      }
    }
    else
    {
      switch(a3)
      {
        case 1055:
          objc_msgSend(v8, "_handleScreenWillChange:", a4);
          break;
        case 3029:
          objc_msgSend(v8, "_handleMediaDidBegin:", a4);
          break;
        case 5000:
          objc_msgSend(v8, "_handleApplicationWasActivated:", a4);
          break;
      }
    }
  }
  else
  {
    v7 = 16;
    switch(a3)
    {
      case 1000:
        v7 = 8;
        goto LABEL_14;
      case 1001:
        if (a4)
        {
          if (CFEqual(a4, kAXForceUpdateChangeToken[0]))
            v7 = 256;
          else
            v7 = 4;
        }
        else
        {
          v7 = 4;
        }
        goto LABEL_14;
      case 1006:
        v7 = 64;
        goto LABEL_14;
      case 1009:
        v7 = 128;
        goto LABEL_14;
      case 1011:
LABEL_14:
        objc_msgSend(v8, "_fetchEventOccurred:", v7);
        break;
      default:
        break;
    }
  }

}

void sub_1B54DD304(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9)
{
  id v9;

  if (a2 == 1)
  {
    v9 = objc_begin_catch(exception_object);
    NSLog((NSString *)CFSTR("Exception handling accessibility event: %@"));

    objc_end_catch();
    JUMPOUT(0x1B54DD284);
  }
  _Unwind_Resume(exception_object);
}

void sub_1B54DDA6C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,char a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,char a37)
{
  _Block_object_dispose(&a31, 8);
  _Block_object_dispose(&a37, 8);
  _Unwind_Resume(a1);
}

void sub_1B54DE9D0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1B54E0488(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, ...)
{
  va_list va;

  va_start(va, a16);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1B54E0E64(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,char a29)
{
  _Block_object_dispose(&a29, 8);
  _Unwind_Resume(a1);
}

void sub_1B54E1EBC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, ...)
{
  va_list va;

  va_start(va, a8);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__3(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__3(uint64_t a1)
{

}

CFTypeID __smugglingDictionaryForCoreFoundationObject_block_invoke()
{
  CFTypeID result;

  smugglingDictionaryForCoreFoundationObject_CFBooleanTypeID = CFBooleanGetTypeID();
  smugglingDictionaryForCoreFoundationObject_CFUUIDTypeID = CFUUIDGetTypeID();
  smugglingDictionaryForCoreFoundationObject_AXUIElementTypeID = AXUIElementGetTypeID();
  smugglingDictionaryForCoreFoundationObject_AXValueTypeID = AXValueGetTypeID();
  smugglingDictionaryForCoreFoundationObject_CGColorTypeID = CGColorGetTypeID();
  smugglingDictionaryForCoreFoundationObject_CGPathTypeID = CGPathGetTypeID();
  smugglingDictionaryForCoreFoundationObject_CTFontTypeID = CTFontGetTypeID();
  smugglingDictionaryForCoreFoundationObject_CFNullTypeID = CFNullGetTypeID();
  result = CFURLGetTypeID();
  smugglingDictionaryForCoreFoundationObject_CFURLTypeID = result;
  return result;
}

id smugglingDictionaryForCFUUID(const __CFUUID *a1)
{
  void *v1;
  void *v2;
  CFUUIDBytes v4;
  _QWORD v5[2];
  _QWORD v6[3];

  v6[2] = *MEMORY[0x1E0C80C00];
  v4 = CFUUIDGetUUIDBytes(a1);
  objc_msgSend(MEMORY[0x1E0C99D50], "dataWithBytes:length:", &v4, 16);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v5[0] = CFSTR("SmugType");
  v5[1] = CFSTR("Value");
  v6[0] = AXSerializeSmuggledTypeCFUUID;
  v6[1] = v1;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v6, v5, 2);
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  return v2;
}

id smugglingDictionaryForCGPath(const CGPath *a1)
{
  uint64_t v2;
  id v3;
  void *v4;
  _QWORD v6[4];
  id v7;
  _QWORD block[5];
  _QWORD v9[3];
  int v10;
  _QWORD v11[2];
  _QWORD v12[3];

  v12[2] = *MEMORY[0x1E0C80C00];
  v9[0] = 0;
  v9[1] = v9;
  v9[2] = 0x2020000000;
  v2 = MEMORY[0x1E0C809B0];
  v10 = 0;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __smugglingDictionaryForCGPath_block_invoke;
  block[3] = &unk_1E691A148;
  block[4] = v9;
  CGPathApplyWithBlock(a1, block);
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v6[0] = v2;
  v6[1] = 3221225472;
  v6[2] = __smugglingDictionaryForCGPath_block_invoke_2;
  v6[3] = &unk_1E691A170;
  v3 = (id)objc_claimAutoreleasedReturnValue();
  v7 = v3;
  CGPathApplyWithBlock(a1, v6);
  v11[0] = CFSTR("SmugType");
  v11[1] = CFSTR("Value");
  v12[0] = AXSerializeSmuggledTypeCGPath;
  v12[1] = v3;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v12, v11, 2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  _Block_object_dispose(v9, 8);
  return v4;
}

void sub_1B54E2488(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, ...)
{
  va_list va;

  va_start(va, a12);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

id smugglingDictionaryForCTFont(const __CTFont *a1, uint64_t a2)
{
  double Size;
  const __CTFontDescriptor *v5;
  CFDictionaryRef v6;
  void *v7;
  void *v8;
  void *v9;
  _QWORD v11[3];
  _QWORD v12[4];

  v12[3] = *MEMORY[0x1E0C80C00];
  Size = CTFontGetSize(a1);
  v5 = CTFontCopyFontDescriptor(a1);
  v6 = CTFontDescriptorCopyAttributes(v5);
  if (v5)
    CFRelease(v5);
  -[__CFDictionary _axRecursivelyPropertyListCoercedRepresentationWithError:](v6, "_axRecursivelyPropertyListCoercedRepresentationWithError:", a2);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    v12[0] = AXSerializeSmuggledTypeCTFont;
    v11[0] = CFSTR("SmugType");
    v11[1] = CFSTR("FSize");
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", Size);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v11[2] = CFSTR("Attrs");
    v12[1] = v8;
    v12[2] = v7;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v12, v11, 3);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v9 = 0;
  }

  return v9;
}

id smugglingDictionaryForCFNull()
{
  const __CFString *v1;
  _QWORD v2[2];

  v2[1] = *MEMORY[0x1E0C80C00];
  v1 = CFSTR("SmugType");
  v2[0] = AXSerializeSmuggledTypeCFNull;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v2, &v1, 1);
  return (id)objc_claimAutoreleasedReturnValue();
}

id smugglingDictionaryForCFURL(const __CFURL *a1)
{
  void *v1;
  void *v2;
  _QWORD v4[2];
  _QWORD v5[3];

  v5[2] = *MEMORY[0x1E0C80C00];
  CFURLGetString(a1);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v4[0] = CFSTR("SmugType");
  v4[1] = CFSTR("Value");
  v5[0] = AXSerializeSmuggledTypeCFURL;
  v5[1] = v1;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v5, v4, 2);
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  return v2;
}

uint64_t __smugglingDictionaryForCGPath_block_invoke(uint64_t result)
{
  ++*(_DWORD *)(*(_QWORD *)(*(_QWORD *)(result + 32) + 8) + 24);
  return result;
}

void __smugglingDictionaryForCGPath_block_invoke_2(uint64_t a1, uint64_t a2)
{
  unsigned int v4;
  int v5;
  _BOOL4 v6;
  int v7;
  int v8;
  unsigned int v9;
  void *v10;
  uint64_t v11;
  unsigned int v12;
  uint64_t v13;
  unint64_t *v14;
  unint64_t v15;
  unint64_t v16;
  unint64_t v17;
  __int16 v18;

  v4 = *(_DWORD *)a2;
  if (*(_DWORD *)a2 == 2)
    v5 = 2;
  else
    v5 = 0;
  v6 = v4 == 3 || *(_DWORD *)a2 == 2;
  if (v4 == 3)
    v7 = 3;
  else
    v7 = v5;
  v8 = v4 < 2 || v6;
  if (v4 >= 2)
    v9 = v7;
  else
    v9 = 1;
  objc_msgSend(MEMORY[0x1E0C99DF0], "data");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = bswap32(v4) >> 16;
  objc_msgSend(v10, "appendBytes:length:", &v18, 2);
  if (v8)
  {
    v11 = 0;
    if (v9 <= 1)
      v12 = 1;
    else
      v12 = v9;
    v13 = 16 * v12;
    do
    {
      v14 = (unint64_t *)(*(_QWORD *)(a2 + 8) + v11);
      v15 = v14[1];
      v17 = bswap64(*v14);
      objc_msgSend(v10, "appendBytes:length:", &v17, 8);
      v16 = bswap64(v15);
      objc_msgSend(v10, "appendBytes:length:", &v16, 8);
      v11 += 16;
    }
    while (v13 != v11);
  }
  objc_msgSend(*(id *)(a1 + 32), "addObject:", v10);

}

id reconstitutedSmuggledAttributedStringFromDictionary(void *a1, _QWORD *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  unint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  id v13;
  unint64_t v14;
  void *v15;
  unint64_t v16;
  unint64_t v17;
  void *v18;
  void *v19;
  id v20;
  unint64_t v21;
  id v22;
  _QWORD *v23;
  uint64_t v24;
  id v26;
  void *v27;
  void *v28;
  _QWORD *v29;
  id obj;
  uint64_t v31;
  id v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  unint64_t v37;
  unint64_t v38;
  _BYTE v39[128];
  uint64_t v40;

  v40 = *MEMORY[0x1E0C80C00];
  v3 = a1;
  objc_msgSend(v3, "objectForKey:", CFSTR("String"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v3, "objectForKey:", CFSTR("Attrl"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v29 = a2;
      +[AXAttributedString axAttributedStringWithString:](AXAttributedString, "axAttributedStringWithString:", v4);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v33 = 0u;
      v34 = 0u;
      v35 = 0u;
      v36 = 0u;
      obj = v5;
      v7 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v33, v39, 16);
      if (v7)
      {
        v8 = v7;
        v31 = *(_QWORD *)v34;
        v9 = 0x1E0C99000uLL;
        v27 = v4;
        v28 = v5;
        v26 = v3;
LABEL_5:
        v10 = 0;
        while (1)
        {
          if (*(_QWORD *)v34 != v31)
            objc_enumerationMutation(obj);
          v11 = *(void **)(*((_QWORD *)&v33 + 1) + 8 * v10);
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) == 0)
          {
            v5 = v28;
            v3 = v26;
            v4 = v27;
            if (v29)
            {
              objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("AXSerialize3ErrorDomain"), 1, 0);
              *v29 = (id)objc_claimAutoreleasedReturnValue();
            }
            goto LABEL_35;
          }
          objc_msgSend(v11, "objectForKey:", CFSTR("Range"));
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) == 0)
            break;
          v13 = v12;
          if (objc_msgSend(v13, "length") != 16)
          {

            v5 = v28;
            v23 = v29;
            v3 = v26;
            v4 = v27;
            if (v29)
            {
              v24 = 2;
LABEL_29:
              objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("AXSerialize3ErrorDomain"), v24, 0);
              *v23 = (id)objc_claimAutoreleasedReturnValue();
            }
            goto LABEL_30;
          }
          v14 = v9;
          v15 = v6;
          v38 = 0;
          objc_msgSend(v13, "getBytes:range:", &v38, 0, 8);
          v37 = 0;
          objc_msgSend(v13, "getBytes:range:", &v37, 8, 8);
          v17 = v37;
          v16 = v38;

          objc_msgSend(v11, "objectForKey:", CFSTR("Attrs"));
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          v32 = 0;
          objc_msgSend(v18, "_axRecursivelyReconstitutedRepresentationFromPropertyListWithError:", &v32);
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          v20 = v32;

          if (!v19 || v20)
            goto LABEL_32;
          v9 = v14;
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) == 0)
          {
            v20 = 0;
LABEL_32:
            if (v29)
            {
              objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("AXSerialize3ErrorDomain"), 1, 0);
              *v29 = (id)objc_claimAutoreleasedReturnValue();
            }

            v6 = v15;
            v4 = v27;
            v5 = v28;
            v3 = v26;
LABEL_35:

            v22 = 0;
            goto LABEL_36;
          }
          v21 = bswap64(v17);
          v6 = v15;
          objc_msgSend(v15, "setAttributes:withRange:", v19, bswap64(v16), v21);

          if (v8 == ++v10)
          {
            v8 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v33, v39, 16);
            v4 = v27;
            v5 = v28;
            v3 = v26;
            if (v8)
              goto LABEL_5;
            goto LABEL_16;
          }
        }
        v5 = v28;
        v23 = v29;
        v3 = v26;
        v4 = v27;
        if (v29)
        {
          v24 = 1;
          goto LABEL_29;
        }
LABEL_30:

        goto LABEL_35;
      }
LABEL_16:

      v22 = v6;
LABEL_36:

    }
    else if (a2)
    {
      objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("AXSerialize3ErrorDomain"), 1, 0);
      v22 = 0;
      *a2 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v22 = 0;
    }

  }
  else if (a2)
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("AXSerialize3ErrorDomain"), 1, 0);
    v22 = 0;
    *a2 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v22 = 0;
  }

  return v22;
}

id reconstitutedSmuggledCFBooleanFromDictionary(void *a1, _QWORD *a2)
{
  void *v3;
  int v4;
  id *v5;
  id v6;

  objc_msgSend(a1, "objectForKey:", CFSTR("Value"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v4 = objc_msgSend(v3, "BOOLValue");
    v5 = (id *)MEMORY[0x1E0C9AE50];
    if (!v4)
      v5 = (id *)MEMORY[0x1E0C9AE40];
    v6 = *v5;
  }
  else if (a2)
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("AXSerialize3ErrorDomain"), 1, 0);
    v6 = 0;
    *a2 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

id reconstitutedSmuggledCFUUIDFromDictionary(void *a1, _QWORD *a2)
{
  void *v3;
  const __CFUUID *v4;
  __CFString *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  CFUUIDBytes v10;

  objc_msgSend(a1, "objectForKey:", CFSTR("Value"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  *(_QWORD *)&v10.byte0 = 0;
  *(_QWORD *)&v10.byte8 = 0;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    if (a2)
    {
      v7 = (void *)MEMORY[0x1E0CB35C8];
      v8 = 1;
LABEL_10:
      objc_msgSend(v7, "errorWithDomain:code:userInfo:", CFSTR("AXSerialize3ErrorDomain"), v8, 0, *(_QWORD *)&v10.byte0, *(_QWORD *)&v10.byte8);
      v6 = 0;
      *a2 = (id)objc_claimAutoreleasedReturnValue();
      goto LABEL_12;
    }
LABEL_11:
    v6 = 0;
    goto LABEL_12;
  }
  if (objc_msgSend(v3, "length") != 16)
  {
    if (a2)
    {
      v7 = (void *)MEMORY[0x1E0CB35C8];
      v8 = 2;
      goto LABEL_10;
    }
    goto LABEL_11;
  }
  objc_msgSend(v3, "getBytes:length:", &v10, 16);
  v4 = CFUUIDCreateFromUUIDBytes(0, v10);
  v5 = (__CFString *)CFUUIDCreateString(0, v4);
  if (v4)
    CFRelease(v4);
  v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3A28]), "initWithUUIDString:", v5);

LABEL_12:
  return v6;
}

id reconstitutedSmuggledAXUIElementFromDictionary(void *a1, _QWORD *a2)
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  unint64_t v8;
  unint64_t v9;
  unsigned int v10;

  objc_msgSend(a1, "objectForKey:", CFSTR("Value"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = 0;
  v8 = 0;
  v9 = 0;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    if (a2)
    {
      v5 = (void *)MEMORY[0x1E0CB35C8];
      v6 = 1;
LABEL_8:
      objc_msgSend(v5, "errorWithDomain:code:userInfo:", CFSTR("AXSerialize3ErrorDomain"), v6, 0);
      v4 = 0;
      *a2 = (id)objc_claimAutoreleasedReturnValue();
      goto LABEL_10;
    }
LABEL_9:
    v4 = 0;
    goto LABEL_10;
  }
  if (objc_msgSend(v3, "length") != 20)
  {
    if (a2)
    {
      v5 = (void *)MEMORY[0x1E0CB35C8];
      v6 = 2;
      goto LABEL_8;
    }
    goto LABEL_9;
  }
  objc_msgSend(v3, "getBytes:range:", &v10, 0, 4);
  objc_msgSend(v3, "getBytes:range:", &v9, 4, 8);
  objc_msgSend(v3, "getBytes:range:", &v8, 12, 8);
  v4 = (void *)_AXUIElementCreateWithPIDAndID(bswap32(v10), bswap64(v9), bswap64(v8));
LABEL_10:

  return v4;
}

AXValueRef reconstitutedSmuggledAXValueFromDictionary(void *a1, _QWORD *a2)
{
  id v3;
  void *v4;
  int v5;
  void *v6;
  AXValueType v7;
  unint64_t *p_valuePtr;
  AXValueRef v9;
  uint64_t v10;
  AXValueRef v11;
  unint64_t v13;
  unint64_t v14;
  unint64_t valuePtr;
  unint64_t v16;
  unint64_t v17;
  unint64_t v18;
  unint64_t v19;
  unint64_t v20;

  v3 = a1;
  objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("ValueType"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v5 = objc_msgSend(v4, "shortValue");
    objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("Value"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (v6 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
    {
      if (!a2)
      {
LABEL_27:
        v9 = 0;
        goto LABEL_28;
      }
      v10 = 1;
    }
    else
    {
      switch(v5)
      {
        case 0:
          v7 = kAXValueTypeIllegal;
          p_valuePtr = 0;
          goto LABEL_21;
        case 1:
          if (objc_msgSend(v6, "length") != 16)
            goto LABEL_24;
          v20 = 0;
          objc_msgSend(v6, "getBytes:length:", &v20, 8);
          v19 = 0;
          objc_msgSend(v6, "getBytes:range:", &v19, 8, 8);
          valuePtr = bswap64(v20);
          v16 = bswap64(v19);
          p_valuePtr = &valuePtr;
          v7 = kAXValueTypeCGPoint;
          goto LABEL_21;
        case 2:
          if (objc_msgSend(v6, "length") != 16)
            goto LABEL_24;
          v20 = 0;
          objc_msgSend(v6, "getBytes:length:", &v20, 8);
          v19 = 0;
          objc_msgSend(v6, "getBytes:range:", &v19, 8, 8);
          valuePtr = bswap64(v20);
          v16 = bswap64(v19);
          p_valuePtr = &valuePtr;
          v7 = kAXValueTypeCGSize;
          goto LABEL_21;
        case 3:
          if (objc_msgSend(v6, "length") != 32)
            goto LABEL_24;
          v20 = 0;
          objc_msgSend(v6, "getBytes:length:", &v20, 8);
          v19 = 0;
          objc_msgSend(v6, "getBytes:range:", &v19, 8, 8);
          v14 = 0;
          objc_msgSend(v6, "getBytes:range:", &v14, 16, 8);
          v13 = 0;
          objc_msgSend(v6, "getBytes:range:", &v13, 24, 8);
          valuePtr = bswap64(v20);
          v16 = bswap64(v19);
          v17 = bswap64(v14);
          v18 = bswap64(v13);
          p_valuePtr = &valuePtr;
          v7 = kAXValueTypeCGRect;
          goto LABEL_21;
        case 4:
          if (objc_msgSend(v6, "length") != 16)
            goto LABEL_24;
          v20 = 0;
          objc_msgSend(v6, "getBytes:length:", &v20, 8);
          v19 = 0;
          objc_msgSend(v6, "getBytes:range:", &v19, 8, 8);
          valuePtr = bswap64(v20);
          v16 = bswap64(v19);
          p_valuePtr = &valuePtr;
          v7 = kAXValueTypeCFRange;
          goto LABEL_21;
        case 5:
          if (objc_msgSend(v6, "length") == 4)
          {
            LODWORD(v20) = 0;
            objc_msgSend(v6, "getBytes:length:", &v20, 4);
            LODWORD(valuePtr) = bswap32(v20);
            p_valuePtr = &valuePtr;
            v7 = kAXValueTypeAXError;
LABEL_21:
            v11 = AXValueCreate(v7, p_valuePtr);
            if (v11)
              v9 = v11;
            else
              v9 = 0;
            goto LABEL_28;
          }
LABEL_24:
          if (!a2)
            goto LABEL_27;
          v10 = 2;
          break;
        default:
          goto LABEL_27;
      }
    }
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("AXSerialize3ErrorDomain"), v10, 0);
    v9 = 0;
    *a2 = (id)objc_claimAutoreleasedReturnValue();
LABEL_28:

    goto LABEL_29;
  }
  if (a2)
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("AXSerialize3ErrorDomain"), 1, 0);
    v9 = 0;
    *a2 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v9 = 0;
  }
LABEL_29:

  return v9;
}

CGColorRef reconstitutedSmuggledCGColorFromDictionary(void *a1, _QWORD *a2)
{
  id v3;
  void *v4;
  int v5;
  void *v6;
  CGColorSpaceRef DeviceRGB;
  CGColorRef v8;
  void *v9;
  uint64_t v10;
  CGColorSpace *v11;
  unint64_t v12;
  unint64_t v13;
  unint64_t v14;
  size_t NumberOfComponents;
  uint64_t v16;
  const CGFloat *v17;
  uint64_t v18;
  unint64_t v20[2];

  v20[1] = *MEMORY[0x1E0C80C00];
  v3 = a1;
  objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("ValueType"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v5 = objc_msgSend(v4, "intValue");
    objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("Value"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      if (a2)
      {
        v9 = (void *)MEMORY[0x1E0CB35C8];
        v10 = 1;
LABEL_24:
        objc_msgSend(v9, "errorWithDomain:code:userInfo:", CFSTR("AXSerialize3ErrorDomain"), v10, 0);
        v8 = 0;
        *a2 = (id)objc_claimAutoreleasedReturnValue();
LABEL_30:

        goto LABEL_31;
      }
LABEL_25:
      v8 = 0;
      goto LABEL_30;
    }
    if (v5)
    {
      if (v5 == 1)
      {
        DeviceRGB = CGColorSpaceCreateDeviceRGB();
      }
      else
      {
        if (v5 != 2)
        {
          objc_msgSend(v6, "length");
          goto LABEL_22;
        }
        DeviceRGB = CGColorSpaceCreateDeviceCMYK();
      }
    }
    else
    {
      DeviceRGB = CGColorSpaceCreateDeviceGray();
    }
    v11 = DeviceRGB;
    v12 = objc_msgSend(v6, "length");
    if (v11)
    {
      v13 = v12;
      v14 = v12 >> 3;
      NumberOfComponents = CGColorSpaceGetNumberOfComponents(v11);
      if (v14 == NumberOfComponents + 1)
      {
        MEMORY[0x1E0C80A78](NumberOfComponents);
        v17 = (const CGFloat *)((char *)v20 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0));
        if (v13 >= 8)
        {
          v18 = 0;
          if (v14 <= 1)
            v14 = 1;
          do
          {
            v20[0] = 0;
            objc_msgSend(v6, "getBytes:range:", v20, v18 * 8, 8);
            *(_QWORD *)&v17[v18++] = bswap64(v20[0]);
            --v14;
          }
          while (v14);
        }
        v8 = CGColorCreate(v11, v17);
      }
      else if (a2)
      {
        objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("AXSerialize3ErrorDomain"), 4, 0);
        v8 = 0;
        *a2 = (id)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v8 = 0;
      }
      CFRelease(v11);
      goto LABEL_30;
    }
LABEL_22:
    if (a2)
    {
      v9 = (void *)MEMORY[0x1E0CB35C8];
      v10 = 3;
      goto LABEL_24;
    }
    goto LABEL_25;
  }
  if (a2)
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("AXSerialize3ErrorDomain"), 1, 0);
    v8 = 0;
    *a2 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v8 = 0;
  }
LABEL_31:

  return v8;
}

CGMutablePathRef reconstitutedSmuggledCGPathFromDictionary(void *a1, _QWORD *a2)
{
  void *v3;
  uint64_t v4;
  CGPath *Mutable;
  CGMutablePathRef v6;
  uint64_t v7;
  unsigned int v8;
  void *v9;
  unsigned int v10;
  int v11;
  _BOOL4 v12;
  unsigned int v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  CGFloat *v18;
  unint64_t v19;
  unsigned int v20;
  uint64_t v21;
  int8x16_t v22;
  _QWORD *v23;
  _QWORD *v24;
  CGMutablePathRef v25;
  uint64_t v27;
  _QWORD *v28;
  CGMutablePathRef v29;
  unint64_t v30;
  uint64_t v31;
  uint64_t v32;
  unsigned __int16 v33;
  uint64_t v34;

  v34 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a1, "objectForKeyedSubscript:", CFSTR("Value"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v4 = objc_msgSend(v3, "count");
    Mutable = CGPathCreateMutable();
    v6 = Mutable;
    v30 = v4;
    if (v4)
    {
      v28 = a2;
      v29 = Mutable;
      v7 = 0;
      v8 = 0;
      while (1)
      {
        objc_msgSend(v3, "objectAtIndexedSubscript:", v7);
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        v33 = 0;
        objc_msgSend(v9, "getBytes:range:", &v33, 0, 2);
        v10 = bswap32(v33) >> 16;
        if (v10 < 2)
        {
          v12 = 1;
          v13 = 1;
        }
        else
        {
          v11 = v10 == 2 ? 2 : 0;
          v12 = v10 == 3 || v10 == 2;
          v13 = v10 == 3 ? 3 : v11;
        }
        v14 = v13;
        v15 = objc_msgSend(v9, "length");
        if (v15 != ((16 * v14) | 2))
          break;
        v16 = v3;
        MEMORY[0x1E0C80A78](v15);
        v18 = (CGFloat *)(&v27 - 2 * v17);
        if (v12)
        {
          v19 = 0;
          if (v14 <= 1)
            v20 = 1;
          else
            v20 = v14;
          v21 = 16 * v20;
          do
          {
            v32 = 0;
            objc_msgSend(v9, "getBytes:range:", &v32, v19 + 2, 8);
            v31 = 0;
            objc_msgSend(v9, "getBytes:range:", &v31, v19 + 10, 8);
            v22.i64[0] = v32;
            v22.i64[1] = v31;
            *(int8x16_t *)&v18[v19 / 8] = vrev64q_s8(v22);
            v19 += 16;
          }
          while (v21 != v19);
        }
        switch(v10)
        {
          case 0u:
            v6 = v29;
            CGPathMoveToPoint(v29, 0, *v18, v18[1]);
            break;
          case 1u:
            v6 = v29;
            CGPathAddLineToPoint(v29, 0, *v18, v18[1]);
            break;
          case 2u:
            v6 = v29;
            CGPathAddQuadCurveToPoint(v29, 0, *v18, v18[1], v18[2], v18[3]);
            break;
          case 3u:
            v6 = v29;
            CGPathAddCurveToPoint(v29, 0, *v18, v18[1], v18[2], v18[3], v18[4], v18[5]);
            break;
          case 4u:
            v6 = v29;
            CGPathCloseSubpath(v29);
            break;
          default:
            v24 = v28;
            if (v28)
            {
              objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("AXSerialize3ErrorDomain"), 5, 0);
              *v24 = (id)objc_claimAutoreleasedReturnValue();
            }
            v3 = v16;
            goto LABEL_37;
        }
        v3 = v16;

        v7 = ++v8;
        if (v30 <= v8)
          goto LABEL_40;
      }
      v23 = v28;
      if (v28)
      {
        objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("AXSerialize3ErrorDomain"), 2, 0);
        *v23 = (id)objc_claimAutoreleasedReturnValue();
      }
LABEL_37:
      v25 = v29;

      if (v25)
        CFRelease(v25);
      goto LABEL_39;
    }
  }
  else
  {
    if (!a2)
    {
LABEL_39:
      v6 = 0;
      goto LABEL_40;
    }
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("AXSerialize3ErrorDomain"), 1, 0);
    v6 = 0;
    *a2 = (id)objc_claimAutoreleasedReturnValue();
  }
LABEL_40:

  return v6;
}

CTFontRef reconstitutedSmuggledCTFontFromDictionary(void *a1, _QWORD *a2)
{
  id v3;
  void *v4;
  double v5;
  CGFloat v6;
  void *v7;
  const __CFDictionary *v8;
  const __CTFontDescriptor *v9;
  CTFontRef v10;

  v3 = a1;
  objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("FSize"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v4, "doubleValue");
    v6 = v5;
    objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("Attrs"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "_axRecursivelyReconstitutedRepresentationFromPropertyListWithError:", a2);
    v8 = (const __CFDictionary *)objc_claimAutoreleasedReturnValue();

    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v9 = CTFontDescriptorCreateWithAttributes(v8);
      v10 = CTFontCreateWithFontDescriptor(v9, v6, 0);
      if (v9)
        CFRelease(v9);
    }
    else if (a2)
    {
      objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("AXSerialize3ErrorDomain"), 1, 0);
      v10 = 0;
      *a2 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v10 = 0;
    }

  }
  else if (a2)
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("AXSerialize3ErrorDomain"), 1, 0);
    v10 = 0;
    *a2 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v10 = 0;
  }

  return v10;
}

uint64_t reconstitutedSmuggledCFNullFromDictionary()
{
  return objc_msgSend(MEMORY[0x1E0C99E38], "null");
}

CFURLRef reconstitutedSmuggledCFURLFromDictionary(void *a1, _QWORD *a2)
{
  __CFString *v3;
  CFURLRef v4;

  objc_msgSend(a1, "objectForKeyedSubscript:", CFSTR("Value"));
  v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v4 = CFURLCreateWithString(0, v3, 0);
  }
  else if (a2)
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("AXSerialize3ErrorDomain"), 1, 0);
    v4 = 0;
    *a2 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

void sub_1B54E56B8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__4(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__4(uint64_t a1)
{

}

void sub_1B54E647C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void *__getAXPerformPrivilegedAttributedStringTransformationsSymbolLoc_block_invoke(uint64_t a1)
{
  void *result;
  void *v3;
  __int128 v4;
  uint64_t v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  v3 = 0;
  if (!AccessibilityUtilitiesLibraryCore_frameworkLibrary_0)
  {
    v4 = xmmword_1E691A2A8;
    v5 = 0;
    AccessibilityUtilitiesLibraryCore_frameworkLibrary_0 = _sl_dlopen();
  }
  if (!AccessibilityUtilitiesLibraryCore_frameworkLibrary_0)
    __getAXPerformPrivilegedAttributedStringTransformationsSymbolLoc_block_invoke_cold_1(&v3);
  result = dlsym((void *)AccessibilityUtilitiesLibraryCore_frameworkLibrary_0, "AXPerformPrivilegedAttributedStringTransformations");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  getAXPerformPrivilegedAttributedStringTransformationsSymbolLoc_ptr = *(_UNKNOWN **)(*(_QWORD *)(*(_QWORD *)(a1 + 32)
                                                                                                + 8)
                                                                                    + 24);
  return result;
}

uint64_t _AXMIGCopyAttributeValue(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, _DWORD *a9, _QWORD *a10, _DWORD *a11, _DWORD *a12)
{
  int v12;
  void *v13;
  void *v14;
  mach_msg_timeout_t v15;
  mach_msg_timeout_t v16;
  int v17;
  int v18;
  uint64_t v19;
  uint64_t v20;
  int v21;
  size_t v22;
  mach_port_name_t reply_port;
  uint64_t v24;
  uint64_t v25;
  int v26;
  unsigned int v27;
  _BYTE *v28;
  _BYTE *v29;
  int v31;
  _BYTE rcv_name[32];
  __int128 v33;
  size_t __n[2];
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  __int128 v60;
  _DWORD v61[7];
  uint64_t v62;

  v12 = MEMORY[0x1E0C80A78]();
  v14 = v13;
  v16 = v15;
  v17 = v12;
  v62 = *MEMORY[0x1E0C80C00];
  v60 = 0u;
  memset(v61, 0, sizeof(v61));
  v58 = 0u;
  v59 = 0u;
  v56 = 0u;
  v57 = 0u;
  v54 = 0u;
  v55 = 0u;
  v52 = 0u;
  v53 = 0u;
  v50 = 0u;
  v51 = 0u;
  v48 = 0u;
  v49 = 0u;
  v47 = 0u;
  v46 = 0u;
  v45 = 0u;
  v44 = 0u;
  v43 = 0u;
  v42 = 0u;
  v41 = 0u;
  v40 = 0u;
  v39 = 0u;
  v38 = 0u;
  v37 = 0u;
  v36 = 0u;
  v35 = 0u;
  *(_OWORD *)__n = 0u;
  v33 = 0u;
  *(_OWORD *)&rcv_name[16] = 0u;
  *(_OWORD *)rcv_name = 0u;
  *(_QWORD *)&rcv_name[20] = *MEMORY[0x1E0C804E8];
  *(_DWORD *)&rcv_name[28] = v18;
  *(_QWORD *)&v33 = v19;
  *((_QWORD *)&v33 + 1) = v20;
  LODWORD(__n[0]) = v21;
  *(size_t *)((char *)__n + 4) = v22;
  reply_port = mig_get_reply_port();
  *(_DWORD *)&rcv_name[4] = v17;
  *(_DWORD *)&rcv_name[8] = reply_port;
  v31 = 5395;
  *(_QWORD *)&rcv_name[12] = 0xD1F6200000000;
  if (MEMORY[0x1E0C85B60])
  {
    voucher_mach_msg_set((mach_msg_header_t *)&v31);
    reply_port = *(_DWORD *)&rcv_name[8];
  }
  v24 = mach_msg((mach_msg_header_t *)&v31, 275, 0x40u, 0x1048u, reply_port, v16, 0);
  v25 = v24;
  if ((v24 - 268435458) <= 0xE && ((1 << (v24 - 2)) & 0x4003) != 0)
  {
    mig_put_reply_port(*(mach_port_t *)&rcv_name[8]);
  }
  else
  {
    if (!(_DWORD)v24)
    {
      if (*(_DWORD *)&rcv_name[16] == 71)
      {
        v25 = 4294966988;
      }
      else if (*(_DWORD *)&rcv_name[16] == 860102)
      {
        if ((v31 & 0x80000000) == 0)
        {
          if (*(_DWORD *)rcv_name == 36)
          {
            v25 = 4294966996;
            if (*(_DWORD *)&rcv_name[28])
            {
              if (*(_DWORD *)&rcv_name[4])
                v25 = 4294966996;
              else
                v25 = *(unsigned int *)&rcv_name[28];
            }
          }
          else
          {
            v25 = 4294966996;
          }
          goto LABEL_32;
        }
        v25 = 4294966996;
        if (*(_DWORD *)&rcv_name[20] == 1
          && *(_DWORD *)rcv_name >= 0x40u
          && *(_DWORD *)rcv_name <= 0x1040u
          && !*(_DWORD *)&rcv_name[4]
          && BYTE3(v33) == 1)
        {
          v26 = __n[0];
          if (LODWORD(__n[0]) <= 0x1000 && (*(_DWORD *)rcv_name - 64) >= LODWORD(__n[0]))
          {
            v27 = (LODWORD(__n[0]) + 3) & 0xFFFFFFFC;
            if (*(_DWORD *)rcv_name == v27 + 64)
            {
              v28 = &rcv_name[v27 - 4];
              if (DWORD1(v33) == *((_DWORD *)v28 + 14))
              {
                v29 = v28 - 4096;
                memcpy(v14, (char *)__n + 4, LODWORD(__n[0]));
                v25 = 0;
                *a9 = v26;
                *a10 = *(_QWORD *)&rcv_name[24];
                *a11 = *((_DWORD *)v29 + 1038);
                *a12 = *((_DWORD *)v29 + 1039);
                return v25;
              }
            }
          }
        }
      }
      else
      {
        v25 = 4294966995;
      }
LABEL_32:
      mach_msg_destroy((mach_msg_header_t *)&v31);
      return v25;
    }
    mig_dealloc_reply_port(*(mach_port_t *)&rcv_name[8]);
  }
  if ((v25 - 268435459) <= 1)
  {
    if ((v31 & 0x1F00) == 0x1100)
      mach_port_deallocate(*MEMORY[0x1E0C83DA0], *(mach_port_name_t *)&rcv_name[8]);
    goto LABEL_32;
  }
  return v25;
}

uint64_t _AXMIGSetAttributeValue(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, unsigned int a10, uint64_t a11, int *a12)
{
  mach_port_t v12;
  mach_msg_timeout_t v13;
  unsigned int v14;
  int v15;
  uint64_t v16;
  uint64_t v17;
  int v18;
  uint64_t v19;
  unsigned int v20;
  mach_msg_timeout_t v21;
  mach_port_t v22;
  uint64_t v23;
  mach_msg_size_t v24;
  char *v25;
  mach_port_t reply_port;
  uint64_t v27;
  BOOL v28;
  mach_msg_header_t rcv_name;
  int v31;
  uint64_t v32;
  int v33;
  _BYTE v34[24];
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  __int128 v60;
  __int128 v61;
  __int128 v62;
  uint64_t v63;

  v12 = MEMORY[0x1E0C80A78](a1);
  v63 = *MEMORY[0x1E0C80C00];
  v61 = 0u;
  v62 = 0u;
  v59 = 0u;
  v60 = 0u;
  v57 = 0u;
  v58 = 0u;
  v55 = 0u;
  v56 = 0u;
  v53 = 0u;
  v54 = 0u;
  v51 = 0u;
  v52 = 0u;
  v49 = 0u;
  v50 = 0u;
  v47 = 0u;
  v48 = 0u;
  v45 = 0u;
  v46 = 0u;
  v43 = 0u;
  v44 = 0u;
  v41 = 0u;
  v42 = 0u;
  v39 = 0u;
  v40 = 0u;
  v37 = 0u;
  v38 = 0u;
  v35 = 0u;
  v36 = 0u;
  *(_OWORD *)&v34[8] = 0u;
  memset(&rcv_name, 0, sizeof(rcv_name));
  v31 = 1;
  v32 = a9;
  v33 = 16777472;
  *(_QWORD *)v34 = a10;
  *(_QWORD *)&v34[4] = *MEMORY[0x1E0C804E8];
  *(_DWORD *)&v34[12] = v15;
  *(_QWORD *)&v34[16] = v16;
  *(_QWORD *)&v35 = v17;
  DWORD2(v35) = v18;
  if (v14 <= 0x1000)
  {
    v20 = v14;
    v21 = v13;
    v22 = v12;
    __memcpy_chk();
    HIDWORD(v35) = v20;
    v23 = (v20 + 3) & 0xFFFFFFFC;
    v24 = v23 + 92;
    v25 = (char *)&rcv_name + v23;
    *((_DWORD *)v25 + 20) = a10;
    *(_QWORD *)(v25 + 84) = a11;
    reply_port = mig_get_reply_port();
    rcv_name.msgh_remote_port = v22;
    rcv_name.msgh_local_port = reply_port;
    rcv_name.msgh_bits = -2147478253;
    *(_QWORD *)&rcv_name.msgh_voucher_port = 0xD1F6300000000;
    if (MEMORY[0x1E0C85B60])
    {
      voucher_mach_msg_set(&rcv_name);
      reply_port = rcv_name.msgh_local_port;
    }
    v27 = mach_msg(&rcv_name, 275, v24, 0x30u, reply_port, v21, 0);
    v19 = v27;
    if ((v27 - 268435458) <= 0xE && ((1 << (v27 - 2)) & 0x4003) != 0)
    {
      mig_put_reply_port(rcv_name.msgh_local_port);
    }
    else
    {
      if (!(_DWORD)v27)
      {
        if (rcv_name.msgh_id == 71)
        {
          v19 = 4294966988;
        }
        else if (rcv_name.msgh_id == 860103)
        {
          if ((rcv_name.msgh_bits & 0x80000000) == 0)
          {
            if (rcv_name.msgh_size == 40)
            {
              if (!rcv_name.msgh_remote_port)
              {
                v19 = HIDWORD(v32);
                if (!HIDWORD(v32))
                {
                  *a12 = v33;
                  return v19;
                }
                goto LABEL_28;
              }
            }
            else if (rcv_name.msgh_size == 36)
            {
              if (rcv_name.msgh_remote_port)
                v28 = 1;
              else
                v28 = HIDWORD(v32) == 0;
              if (v28)
                v19 = 4294966996;
              else
                v19 = HIDWORD(v32);
              goto LABEL_28;
            }
          }
          v19 = 4294966996;
        }
        else
        {
          v19 = 4294966995;
        }
LABEL_28:
        mach_msg_destroy(&rcv_name);
        return v19;
      }
      mig_dealloc_reply_port(rcv_name.msgh_local_port);
    }
    if ((v19 - 268435459) > 1)
      return v19;
    if ((rcv_name.msgh_bits & 0x1F00) == 0x1100)
      mach_port_deallocate(*MEMORY[0x1E0C83DA0], rcv_name.msgh_local_port);
    goto LABEL_28;
  }
  return 4294966989;
}

uint64_t _AXMIGPerformAction(mach_port_t a1, mach_msg_timeout_t a2, unsigned int a3, uint64_t a4, uint64_t a5, int a6, uint64_t a7, _DWORD *a8)
{
  mach_port_t reply_port;
  uint64_t v12;
  uint64_t v13;
  BOOL v14;
  mach_msg_header_t msg;
  uint64_t v17;
  unsigned int v18;
  uint64_t v19;
  uint64_t v20;
  int v21;
  uint64_t v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v17 = *MEMORY[0x1E0C804E8];
  v18 = a3;
  v19 = a4;
  v20 = a5;
  v21 = a6;
  v22 = a7;
  reply_port = mig_get_reply_port();
  *(_QWORD *)&msg.msgh_bits = 5395;
  msg.msgh_remote_port = a1;
  msg.msgh_local_port = reply_port;
  *(_QWORD *)&msg.msgh_voucher_port = 0xD1F6400000000;
  if (MEMORY[0x1E0C85B60])
  {
    voucher_mach_msg_set(&msg);
    reply_port = msg.msgh_local_port;
  }
  v12 = mach_msg(&msg, 275, 0x40u, 0x30u, reply_port, a2, 0);
  v13 = v12;
  if ((v12 - 268435458) <= 0xE && ((1 << (v12 - 2)) & 0x4003) != 0)
  {
    mig_put_reply_port(msg.msgh_local_port);
  }
  else
  {
    if (!(_DWORD)v12)
    {
      if (msg.msgh_id == 71)
      {
        v13 = 4294966988;
      }
      else if (msg.msgh_id == 860104)
      {
        if ((msg.msgh_bits & 0x80000000) == 0)
        {
          if (msg.msgh_size == 40)
          {
            if (!msg.msgh_remote_port)
            {
              v13 = v18;
              if (!v18)
              {
                *a8 = v19;
                return v13;
              }
              goto LABEL_26;
            }
          }
          else if (msg.msgh_size == 36)
          {
            if (msg.msgh_remote_port)
              v14 = 1;
            else
              v14 = v18 == 0;
            if (v14)
              v13 = 4294966996;
            else
              v13 = v18;
            goto LABEL_26;
          }
        }
        v13 = 4294966996;
      }
      else
      {
        v13 = 4294966995;
      }
LABEL_26:
      mach_msg_destroy(&msg);
      return v13;
    }
    mig_dealloc_reply_port(msg.msgh_local_port);
  }
  if ((v13 - 268435459) <= 1)
  {
    if ((msg.msgh_bits & 0x1F00) == 0x1100)
      mach_port_deallocate(*MEMORY[0x1E0C83DA0], msg.msgh_local_port);
    goto LABEL_26;
  }
  return v13;
}

uint64_t _AXMIGPerformActionWithValue(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, unsigned int a9, uint64_t a10, int a11, uint64_t a12, _DWORD *a13)
{
  mach_port_t v13;
  mach_msg_timeout_t v14;
  int v15;
  int v16;
  uint64_t v17;
  uint64_t v18;
  int v19;
  uint64_t v20;
  mach_msg_timeout_t v21;
  mach_port_t v22;
  uint64_t v23;
  mach_msg_size_t v24;
  char *v25;
  mach_port_t reply_port;
  uint64_t v27;
  BOOL v28;
  mach_msg_header_t rcv_name;
  int v31;
  int v32;
  uint64_t v33;
  uint64_t v34;
  int v35;
  int v36;
  uint64_t v37;
  _OWORD v38[28];
  uint64_t v39;

  v13 = MEMORY[0x1E0C80A78]();
  v39 = *MEMORY[0x1E0C80C00];
  memset(v38, 0, sizeof(v38));
  v33 = 0x13000000000000;
  v37 = 0;
  memset(&rcv_name, 0, sizeof(rcv_name));
  v31 = 2;
  v32 = v15;
  v34 = a10;
  v35 = 16777472;
  v36 = a11;
  v37 = *MEMORY[0x1E0C804E8];
  LODWORD(v38[0]) = v16;
  *(_QWORD *)((char *)v38 + 4) = v17;
  *(_QWORD *)((char *)v38 + 12) = v18;
  DWORD1(v38[1]) = v19;
  if (a9 <= 0x1000)
  {
    v21 = v14;
    v22 = v13;
    __memcpy_chk();
    DWORD2(v38[1]) = a9;
    v23 = (a9 + 3) & 0xFFFFFFFC;
    v24 = v23 + 104;
    v25 = (char *)&rcv_name + v23;
    *((_DWORD *)v25 + 23) = a11;
    *((_QWORD *)v25 + 12) = a12;
    reply_port = mig_get_reply_port();
    rcv_name.msgh_remote_port = v22;
    rcv_name.msgh_local_port = reply_port;
    rcv_name.msgh_bits = -2147478253;
    *(_QWORD *)&rcv_name.msgh_voucher_port = 0xD1F6500000000;
    if (MEMORY[0x1E0C85B60])
    {
      voucher_mach_msg_set(&rcv_name);
      reply_port = rcv_name.msgh_local_port;
    }
    v27 = mach_msg(&rcv_name, 275, v24, 0x30u, reply_port, v21, 0);
    v20 = v27;
    if ((v27 - 268435458) <= 0xE && ((1 << (v27 - 2)) & 0x4003) != 0)
    {
      mig_put_reply_port(rcv_name.msgh_local_port);
    }
    else
    {
      if (!(_DWORD)v27)
      {
        if (rcv_name.msgh_id == 71)
        {
          v20 = 4294966988;
        }
        else if (rcv_name.msgh_id == 860105)
        {
          if ((rcv_name.msgh_bits & 0x80000000) == 0)
          {
            if (rcv_name.msgh_size == 40)
            {
              if (!rcv_name.msgh_remote_port)
              {
                v20 = v33;
                if (!(_DWORD)v33)
                {
                  *a13 = HIDWORD(v33);
                  return v20;
                }
                goto LABEL_28;
              }
            }
            else if (rcv_name.msgh_size == 36)
            {
              if (rcv_name.msgh_remote_port)
                v28 = 1;
              else
                v28 = (_DWORD)v33 == 0;
              if (v28)
                v20 = 4294966996;
              else
                v20 = v33;
              goto LABEL_28;
            }
          }
          v20 = 4294966996;
        }
        else
        {
          v20 = 4294966995;
        }
LABEL_28:
        mach_msg_destroy(&rcv_name);
        return v20;
      }
      mig_dealloc_reply_port(rcv_name.msgh_local_port);
    }
    if ((v20 - 268435459) > 1)
      return v20;
    if ((rcv_name.msgh_bits & 0x1F00) == 0x1100)
      mach_port_deallocate(*MEMORY[0x1E0C83DA0], rcv_name.msgh_local_port);
    goto LABEL_28;
  }
  return 4294966989;
}

uint64_t _AXMIGCopyElementAtPosition(int a1, mach_msg_timeout_t a2, int a3, uint64_t a4, uint64_t a5, __int16 a6, int a7, uint64_t a8, float a9, float a10, _DWORD *a11, _OWORD *a12, void *a13, _DWORD *a14, _DWORD *a15)
{
  mach_port_name_t reply_port;
  uint64_t v18;
  uint64_t v19;
  BOOL v20;
  size_t v23;
  unsigned int v24;
  _BYTE *v25;
  int v26;
  _BYTE rcv_name[32];
  _BYTE v28[32];
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  _DWORD v55[7];
  uint64_t v56;

  v56 = *MEMORY[0x1E0C80C00];
  v54 = 0u;
  memset(v55, 0, sizeof(v55));
  v52 = 0u;
  v53 = 0u;
  v50 = 0u;
  v51 = 0u;
  v48 = 0u;
  v49 = 0u;
  v46 = 0u;
  v47 = 0u;
  v44 = 0u;
  v45 = 0u;
  v42 = 0u;
  v43 = 0u;
  v41 = 0u;
  v40 = 0u;
  v39 = 0u;
  v38 = 0u;
  v37 = 0u;
  v36 = 0u;
  v35 = 0u;
  v34 = 0u;
  v33 = 0u;
  v32 = 0u;
  v31 = 0u;
  v30 = 0u;
  v29 = 0u;
  *(_OWORD *)&v28[16] = 0u;
  *(_OWORD *)v28 = 0u;
  *(_OWORD *)&rcv_name[16] = 0u;
  *(_OWORD *)rcv_name = 0u;
  *(_QWORD *)&rcv_name[20] = *MEMORY[0x1E0C804E8];
  *(_DWORD *)&rcv_name[28] = a3;
  *(_QWORD *)v28 = a4;
  *(_QWORD *)&v28[8] = a5;
  *(float *)&v28[16] = a9;
  *(float *)&v28[20] = a10;
  *(_WORD *)&v28[24] = a6;
  *(_DWORD *)&v28[28] = a7;
  *(_QWORD *)&v29 = a8;
  reply_port = mig_get_reply_port();
  *(_DWORD *)&rcv_name[4] = a1;
  *(_DWORD *)&rcv_name[8] = reply_port;
  v26 = 5395;
  *(_QWORD *)&rcv_name[12] = 0xD1F6600000000;
  if (MEMORY[0x1E0C85B60])
  {
    voucher_mach_msg_set((mach_msg_header_t *)&v26);
    reply_port = *(_DWORD *)&rcv_name[8];
  }
  v18 = mach_msg((mach_msg_header_t *)&v26, 275, 0x4Cu, 0x448u, reply_port, a2, 0);
  v19 = v18;
  if ((v18 - 268435458) <= 0xE && ((1 << (v18 - 2)) & 0x4003) != 0)
  {
    mig_put_reply_port(*(mach_port_t *)&rcv_name[8]);
    goto LABEL_21;
  }
  if (!(_DWORD)v18)
  {
    if (*(_DWORD *)&rcv_name[16] == 71)
    {
      v19 = 4294966988;
    }
    else if (*(_DWORD *)&rcv_name[16] == 860106)
    {
      if ((v26 & 0x80000000) == 0)
      {
        if ((*(_DWORD *)rcv_name - 1089) <= 0xFFFFFBFE)
        {
          if (*(_DWORD *)&rcv_name[4])
            v20 = 1;
          else
            v20 = *(_DWORD *)&rcv_name[28] == 0;
          if (!v20 && *(_DWORD *)rcv_name == 36)
            v19 = *(unsigned int *)&rcv_name[28];
          else
            v19 = 4294966996;
          goto LABEL_28;
        }
        if (!*(_DWORD *)&rcv_name[4])
        {
          v19 = *(unsigned int *)&rcv_name[28];
          if (*(_DWORD *)&rcv_name[28])
            goto LABEL_28;
          v23 = *(unsigned int *)&v28[20];
          if (*(_DWORD *)&v28[20] <= 0x400u)
          {
            v19 = 4294966996;
            if ((*(_DWORD *)rcv_name - 64) >= *(_DWORD *)&v28[20])
            {
              v24 = (*(_DWORD *)&v28[20] + 3) & 0xFFFFFFFC;
              if (*(_DWORD *)rcv_name == v24 + 64)
              {
                *a11 = *(_DWORD *)v28;
                *a12 = *(_OWORD *)&v28[4];
                v25 = &rcv_name[v24 - 4];
                memcpy(a13, &v28[24], v23);
                v19 = 0;
                *a14 = v23;
                *a15 = *((_DWORD *)v25 + 15);
                return v19;
              }
            }
            goto LABEL_28;
          }
        }
      }
      v19 = 4294966996;
    }
    else
    {
      v19 = 4294966995;
    }
LABEL_28:
    mach_msg_destroy((mach_msg_header_t *)&v26);
    return v19;
  }
  mig_dealloc_reply_port(*(mach_port_t *)&rcv_name[8]);
LABEL_21:
  if ((v19 - 268435459) <= 1)
  {
    if ((v26 & 0x1F00) == 0x1100)
      mach_port_deallocate(*MEMORY[0x1E0C83DA0], *(mach_port_name_t *)&rcv_name[8]);
    goto LABEL_28;
  }
  return v19;
}

uint64_t _AXMIGAddNotification(int a1, mach_msg_timeout_t a2, int a3, uint64_t a4, uint64_t a5, int a6, int a7, int a8, uint64_t a9, int *a10)
{
  mach_port_name_t reply_port;
  uint64_t v13;
  uint64_t v14;
  BOOL v15;
  _BYTE msg[36];
  int v18;
  uint64_t v19;
  int v20;
  uint64_t v21;
  uint64_t v22;
  int v23;
  int v24;
  uint64_t v25;
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  *(_OWORD *)&msg[20] = 0u;
  *(_OWORD *)&msg[4] = 0u;
  *(_DWORD *)&msg[24] = 1;
  *(_DWORD *)&msg[28] = a7;
  v18 = 1245184;
  v19 = *MEMORY[0x1E0C804E8];
  v20 = a3;
  v21 = a4;
  v22 = a5;
  v23 = a6;
  v24 = a8;
  v25 = a9;
  reply_port = mig_get_reply_port();
  *(_DWORD *)&msg[8] = a1;
  *(_DWORD *)&msg[12] = reply_port;
  *(_DWORD *)msg = -2147478253;
  *(_QWORD *)&msg[16] = 0xD1F6700000000;
  if (MEMORY[0x1E0C85B60])
  {
    voucher_mach_msg_set((mach_msg_header_t *)msg);
    reply_port = *(_DWORD *)&msg[12];
  }
  v13 = mach_msg((mach_msg_header_t *)msg, 275, 0x54u, 0x30u, reply_port, a2, 0);
  v14 = v13;
  if ((v13 - 268435458) <= 0xE && ((1 << (v13 - 2)) & 0x4003) != 0)
  {
    mig_put_reply_port(*(mach_port_t *)&msg[12]);
  }
  else
  {
    if (!(_DWORD)v13)
    {
      if (*(_DWORD *)&msg[20] == 71)
      {
        v14 = 4294966988;
      }
      else if (*(_DWORD *)&msg[20] == 860107)
      {
        if ((*(_DWORD *)msg & 0x80000000) == 0)
        {
          if (*(_DWORD *)&msg[4] == 40)
          {
            if (!*(_DWORD *)&msg[8])
            {
              v14 = *(unsigned int *)&msg[32];
              if (!*(_DWORD *)&msg[32])
              {
                *a10 = v18;
                return v14;
              }
              goto LABEL_26;
            }
          }
          else if (*(_DWORD *)&msg[4] == 36)
          {
            if (*(_DWORD *)&msg[8])
              v15 = 1;
            else
              v15 = *(_DWORD *)&msg[32] == 0;
            if (v15)
              v14 = 4294966996;
            else
              v14 = *(unsigned int *)&msg[32];
            goto LABEL_26;
          }
        }
        v14 = 4294966996;
      }
      else
      {
        v14 = 4294966995;
      }
LABEL_26:
      mach_msg_destroy((mach_msg_header_t *)msg);
      return v14;
    }
    mig_dealloc_reply_port(*(mach_port_t *)&msg[12]);
  }
  if ((v14 - 268435459) <= 1)
  {
    if ((*(_WORD *)msg & 0x1F00) == 0x1100)
      mach_port_deallocate(*MEMORY[0x1E0C83DA0], *(mach_port_name_t *)&msg[12]);
    goto LABEL_26;
  }
  return v14;
}

uint64_t _AXMIGRemoveNotification(int a1, mach_msg_timeout_t a2, int a3, uint64_t a4, uint64_t a5, int a6, int a7, int *a8)
{
  mach_port_name_t reply_port;
  uint64_t v12;
  uint64_t v13;
  BOOL v14;
  int v16;
  _BYTE rcv_name[32];
  int v18;
  uint64_t v19;
  int v20;
  uint64_t v21;
  uint64_t v22;
  int v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  *(_OWORD *)&rcv_name[16] = 0u;
  *(_OWORD *)rcv_name = 0u;
  *(_DWORD *)&rcv_name[20] = 1;
  *(_DWORD *)&rcv_name[24] = a7;
  v18 = 1245184;
  v19 = *MEMORY[0x1E0C804E8];
  v20 = a3;
  v21 = a4;
  v22 = a5;
  v23 = a6;
  reply_port = mig_get_reply_port();
  *(_DWORD *)&rcv_name[4] = a1;
  *(_DWORD *)&rcv_name[8] = reply_port;
  v16 = -2147478253;
  *(_QWORD *)&rcv_name[12] = 0xD1F6800000000;
  if (MEMORY[0x1E0C85B60])
  {
    voucher_mach_msg_set((mach_msg_header_t *)&v16);
    reply_port = *(_DWORD *)&rcv_name[8];
  }
  v12 = mach_msg((mach_msg_header_t *)&v16, 275, 0x48u, 0x30u, reply_port, a2, 0);
  v13 = v12;
  if ((v12 - 268435458) <= 0xE && ((1 << (v12 - 2)) & 0x4003) != 0)
  {
    mig_put_reply_port(*(mach_port_t *)&rcv_name[8]);
  }
  else
  {
    if (!(_DWORD)v12)
    {
      if (*(_DWORD *)&rcv_name[16] == 71)
      {
        v13 = 4294966988;
      }
      else if (*(_DWORD *)&rcv_name[16] == 860108)
      {
        if ((v16 & 0x80000000) == 0)
        {
          if (*(_DWORD *)rcv_name == 40)
          {
            if (!*(_DWORD *)&rcv_name[4])
            {
              v13 = *(unsigned int *)&rcv_name[28];
              if (!*(_DWORD *)&rcv_name[28])
              {
                *a8 = v18;
                return v13;
              }
              goto LABEL_26;
            }
          }
          else if (*(_DWORD *)rcv_name == 36)
          {
            if (*(_DWORD *)&rcv_name[4])
              v14 = 1;
            else
              v14 = *(_DWORD *)&rcv_name[28] == 0;
            if (v14)
              v13 = 4294966996;
            else
              v13 = *(unsigned int *)&rcv_name[28];
            goto LABEL_26;
          }
        }
        v13 = 4294966996;
      }
      else
      {
        v13 = 4294966995;
      }
LABEL_26:
      mach_msg_destroy((mach_msg_header_t *)&v16);
      return v13;
    }
    mig_dealloc_reply_port(*(mach_port_t *)&rcv_name[8]);
  }
  if ((v13 - 268435459) <= 1)
  {
    if ((v16 & 0x1F00) == 0x1100)
      mach_port_deallocate(*MEMORY[0x1E0C83DA0], *(mach_port_name_t *)&rcv_name[8]);
    goto LABEL_26;
  }
  return v13;
}

uint64_t _AXMIGCopyParameterizedAttributeValue(int a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, unsigned int a10, uint64_t a11, void *__dst, _DWORD *a13, uint64_t *a14, _DWORD *a15, _DWORD *a16)
{
  mach_port_t v16;
  mach_msg_timeout_t v17;
  unsigned int v18;
  int v19;
  uint64_t v20;
  uint64_t v21;
  int v22;
  uint64_t v23;
  unsigned int v24;
  mach_msg_timeout_t v25;
  mach_port_t v26;
  uint64_t v27;
  mach_msg_size_t v28;
  char *v29;
  mach_port_t reply_port;
  uint64_t v31;
  int v32;
  unsigned int v33;
  char *v34;
  mach_msg_header_t rcv_name;
  int v37;
  uint64_t v38;
  int v39;
  _BYTE v40[24];
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  __int128 v60;
  __int128 v61;
  __int128 v62;
  __int128 v63;
  __int128 v64;
  __int128 v65;
  __int128 v66;
  __int128 v67;
  __int128 v68;
  uint64_t v69;

  v16 = MEMORY[0x1E0C80A78]();
  v69 = *MEMORY[0x1E0C80C00];
  v67 = 0u;
  v68 = 0u;
  v65 = 0u;
  v66 = 0u;
  v63 = 0u;
  v64 = 0u;
  v61 = 0u;
  v62 = 0u;
  v59 = 0u;
  v60 = 0u;
  v57 = 0u;
  v58 = 0u;
  v55 = 0u;
  v56 = 0u;
  v53 = 0u;
  v54 = 0u;
  v51 = 0u;
  v52 = 0u;
  v49 = 0u;
  v50 = 0u;
  v47 = 0u;
  v48 = 0u;
  v45 = 0u;
  v46 = 0u;
  v43 = 0u;
  v44 = 0u;
  v41 = 0u;
  v42 = 0u;
  *(_OWORD *)&v40[8] = 0u;
  memset(&rcv_name, 0, sizeof(rcv_name));
  v37 = 1;
  v38 = a9;
  v39 = 16777472;
  *(_QWORD *)v40 = a10;
  *(_QWORD *)&v40[4] = *MEMORY[0x1E0C804E8];
  *(_DWORD *)&v40[12] = v19;
  *(_QWORD *)&v40[16] = v20;
  *(_QWORD *)&v41 = v21;
  DWORD2(v41) = v22;
  if (v18 <= 0x1000)
  {
    v24 = v18;
    v25 = v17;
    v26 = v16;
    __memcpy_chk();
    HIDWORD(v41) = v24;
    v27 = (v24 + 3) & 0xFFFFFFFC;
    v28 = v27 + 92;
    v29 = (char *)&rcv_name + v27 - 4096;
    *((_DWORD *)v29 + 1044) = a10;
    *(_QWORD *)(v29 + 4180) = a11;
    reply_port = mig_get_reply_port();
    rcv_name.msgh_remote_port = v26;
    rcv_name.msgh_local_port = reply_port;
    rcv_name.msgh_bits = -2147478253;
    *(_QWORD *)&rcv_name.msgh_voucher_port = 0xD1F6900000000;
    if (MEMORY[0x1E0C85B60])
    {
      voucher_mach_msg_set(&rcv_name);
      reply_port = rcv_name.msgh_local_port;
    }
    v31 = mach_msg(&rcv_name, 275, v28, 0x1048u, reply_port, v25, 0);
    v23 = v31;
    if ((v31 - 268435458) <= 0xE && ((1 << (v31 - 2)) & 0x4003) != 0)
    {
      mig_put_reply_port(rcv_name.msgh_local_port);
    }
    else
    {
      if (!(_DWORD)v31)
      {
        if (rcv_name.msgh_id == 71)
        {
          v23 = 4294966988;
        }
        else if (rcv_name.msgh_id == 860109)
        {
          if ((rcv_name.msgh_bits & 0x80000000) != 0)
          {
            v23 = 4294966996;
            if (v37 == 1
              && rcv_name.msgh_size >= 0x40
              && rcv_name.msgh_size <= 0x1040
              && !rcv_name.msgh_remote_port
              && HIBYTE(v39) == 1)
            {
              v32 = *(_DWORD *)&v40[12];
              if (*(_DWORD *)&v40[12] <= 0x1000u && rcv_name.msgh_size - 64 >= *(_DWORD *)&v40[12])
              {
                v33 = (*(_DWORD *)&v40[12] + 3) & 0xFFFFFFFC;
                if (rcv_name.msgh_size == v33 + 64)
                {
                  v34 = (char *)&rcv_name + v33 - 4096;
                  if (*(_DWORD *)v40 == *((_DWORD *)v34 + 1038))
                  {
                    memcpy(__dst, &v40[16], *(unsigned int *)&v40[12]);
                    v23 = 0;
                    *a13 = v32;
                    *a14 = v38;
                    *a15 = *((_DWORD *)v34 + 1038);
                    *a16 = *((_DWORD *)v34 + 1039);
                    return v23;
                  }
                }
              }
            }
          }
          else if (rcv_name.msgh_size == 36)
          {
            v23 = 4294966996;
            if (HIDWORD(v38))
            {
              if (rcv_name.msgh_remote_port)
                v23 = 4294966996;
              else
                v23 = HIDWORD(v38);
            }
          }
          else
          {
            v23 = 4294966996;
          }
        }
        else
        {
          v23 = 4294966995;
        }
        goto LABEL_34;
      }
      mig_dealloc_reply_port(rcv_name.msgh_local_port);
    }
    if ((v23 - 268435459) > 1)
      return v23;
    if ((rcv_name.msgh_bits & 0x1F00) == 0x1100)
      mach_port_deallocate(*MEMORY[0x1E0C83DA0], rcv_name.msgh_local_port);
LABEL_34:
    mach_msg_destroy(&rcv_name);
    return v23;
  }
  return 4294966989;
}

uint64_t _AXMIGCopyMultipleAttributeValues(uint64_t a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, unsigned int a9, int a10, uint64_t a11, void *__dst, _DWORD *a13, _QWORD *a14, _DWORD *a15, _DWORD *a16)
{
  mach_port_t v16;
  mach_msg_timeout_t v17;
  unsigned int v18;
  uint64_t v19;
  int v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  unsigned int v24;
  mach_msg_timeout_t v25;
  mach_port_t v26;
  uint64_t v27;
  mach_msg_size_t v28;
  char *v29;
  mach_port_t reply_port;
  uint64_t v31;
  int v32;
  unsigned int v33;
  char *v34;
  mach_msg_header_t rcv_name;
  int v37;
  uint64_t v38;
  int v39;
  _BYTE v40[24];
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  __int128 v60;
  __int128 v61;
  __int128 v62;
  __int128 v63;
  __int128 v64;
  __int128 v65;
  __int128 v66;
  __int128 v67;
  __int128 v68;
  uint64_t v69;

  v16 = MEMORY[0x1E0C80A78](a1);
  v69 = *MEMORY[0x1E0C80C00];
  v67 = 0u;
  v68 = 0u;
  v65 = 0u;
  v66 = 0u;
  v63 = 0u;
  v64 = 0u;
  v61 = 0u;
  v62 = 0u;
  v59 = 0u;
  v60 = 0u;
  v57 = 0u;
  v58 = 0u;
  v55 = 0u;
  v56 = 0u;
  v53 = 0u;
  v54 = 0u;
  v51 = 0u;
  v52 = 0u;
  v49 = 0u;
  v50 = 0u;
  v47 = 0u;
  v48 = 0u;
  v45 = 0u;
  v46 = 0u;
  v43 = 0u;
  v44 = 0u;
  v41 = 0u;
  v42 = 0u;
  *(_OWORD *)&v40[8] = 0u;
  memset(&rcv_name, 0, sizeof(rcv_name));
  v37 = 1;
  v38 = v19;
  v39 = 16777472;
  *(_QWORD *)v40 = a9;
  *(_QWORD *)&v40[4] = *MEMORY[0x1E0C804E8];
  *(_DWORD *)&v40[12] = v20;
  *(_QWORD *)&v40[16] = v21;
  *(_QWORD *)&v41 = v22;
  if (v18 <= 0x1000)
  {
    v24 = v18;
    v25 = v17;
    v26 = v16;
    __memcpy_chk();
    DWORD2(v41) = v24;
    v27 = (v24 + 3) & 0xFFFFFFFC;
    v28 = v27 + 92;
    v29 = (char *)&rcv_name + v27 - 4096;
    *((_DWORD *)v29 + 1043) = a9;
    *((_DWORD *)v29 + 1044) = a10;
    *(_QWORD *)(v29 + 4180) = a11;
    reply_port = mig_get_reply_port();
    rcv_name.msgh_remote_port = v26;
    rcv_name.msgh_local_port = reply_port;
    rcv_name.msgh_bits = -2147478253;
    *(_QWORD *)&rcv_name.msgh_voucher_port = 0xD1F6A00000000;
    if (MEMORY[0x1E0C85B60])
    {
      voucher_mach_msg_set(&rcv_name);
      reply_port = rcv_name.msgh_local_port;
    }
    v31 = mach_msg(&rcv_name, 275, v28, 0x1048u, reply_port, v25, 0);
    v23 = v31;
    if ((v31 - 268435458) <= 0xE && ((1 << (v31 - 2)) & 0x4003) != 0)
    {
      mig_put_reply_port(rcv_name.msgh_local_port);
    }
    else
    {
      if (!(_DWORD)v31)
      {
        if (rcv_name.msgh_id == 71)
        {
          v23 = 4294966988;
        }
        else if (rcv_name.msgh_id == 860110)
        {
          if ((rcv_name.msgh_bits & 0x80000000) != 0)
          {
            v23 = 4294966996;
            if (v37 == 1
              && rcv_name.msgh_size >= 0x40
              && rcv_name.msgh_size <= 0x1040
              && !rcv_name.msgh_remote_port
              && HIBYTE(v39) == 1)
            {
              v32 = *(_DWORD *)&v40[12];
              if (*(_DWORD *)&v40[12] <= 0x1000u && rcv_name.msgh_size - 64 >= *(_DWORD *)&v40[12])
              {
                v33 = (*(_DWORD *)&v40[12] + 3) & 0xFFFFFFFC;
                if (rcv_name.msgh_size == v33 + 64)
                {
                  v34 = (char *)&rcv_name + v33 - 4096;
                  if (*(_DWORD *)v40 == *((_DWORD *)v34 + 1038))
                  {
                    memcpy(__dst, &v40[16], *(unsigned int *)&v40[12]);
                    v23 = 0;
                    *a13 = v32;
                    *a14 = v38;
                    *a15 = *((_DWORD *)v34 + 1038);
                    *a16 = *((_DWORD *)v34 + 1039);
                    return v23;
                  }
                }
              }
            }
          }
          else if (rcv_name.msgh_size == 36)
          {
            v23 = 4294966996;
            if (HIDWORD(v38))
            {
              if (rcv_name.msgh_remote_port)
                v23 = 4294966996;
              else
                v23 = HIDWORD(v38);
            }
          }
          else
          {
            v23 = 4294966996;
          }
        }
        else
        {
          v23 = 4294966995;
        }
        goto LABEL_34;
      }
      mig_dealloc_reply_port(rcv_name.msgh_local_port);
    }
    if ((v23 - 268435459) > 1)
      return v23;
    if ((rcv_name.msgh_bits & 0x1F00) == 0x1100)
      mach_port_deallocate(*MEMORY[0x1E0C83DA0], rcv_name.msgh_local_port);
LABEL_34:
    mach_msg_destroy(&rcv_name);
    return v23;
  }
  return 4294966989;
}

uint64_t (*AccessibilityDefs_server_routine(uint64_t a1))()
{
  int v1;

  v1 = *(_DWORD *)(a1 + 20);
  if ((v1 - 860013) >= 0xFFFFFFF5)
    return _AXXMIGAccessibilityDefs_subsystem[5 * (v1 - 860002) + 5];
  else
    return 0;
}

uint64_t _XCopyAttributeValue(uint64_t result, uint64_t a2)
{
  int v3;
  _DWORD *v4;
  int v5;
  uint64_t v6;
  int v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  __int128 v11;
  int v12;
  uint64_t v13;
  uint64_t v14;
  int v15;
  __int128 v16[2];
  uint64_t v17;

  if ((*(_DWORD *)result & 0x80000000) != 0 || *(_DWORD *)(result + 4) != 64)
  {
    v3 = -304;
    goto LABEL_7;
  }
  v17 = 0;
  if (*(_DWORD *)(result + 64) || *(_DWORD *)(result + 68) <= 0x1Fu)
  {
    v3 = -309;
LABEL_7:
    *(_DWORD *)(a2 + 32) = v3;
    goto LABEL_8;
  }
  *(_DWORD *)(a2 + 52) = 4096;
  v4 = (_DWORD *)(a2 + 52);
  *(_DWORD *)(a2 + 36) = 16777473;
  v5 = *(_DWORD *)(result + 12);
  v6 = *(unsigned int *)(result + 32);
  v7 = *(_DWORD *)(result + 52);
  v8 = *(_QWORD *)(result + 56);
  v9 = *(_QWORD *)(result + 36);
  v10 = *(_QWORD *)(result + 44);
  v11 = *(_OWORD *)(result + 100);
  v16[0] = *(_OWORD *)(result + 84);
  v16[1] = v11;
  result = _AXXMIGCopyAttributeValue(v5, v6, v9, v10, v7, v8, (void *)(a2 + 56), v4, (void **)(a2 + 28), (_DWORD *)&v17 + 1, (int *)&v17, v16);
  if (!(_DWORD)result)
  {
    v12 = HIDWORD(v17);
    *(_DWORD *)(a2 + 40) = HIDWORD(v17);
    *(_QWORD *)(a2 + 44) = *MEMORY[0x1E0C804E8];
    v13 = (*(_DWORD *)(a2 + 52) + 3) & 0xFFFFFFFC;
    *(_DWORD *)(a2 + 4) = v13 + 64;
    v14 = a2 + v13;
    v15 = v17;
    *(_DWORD *)(v14 + 56) = v12;
    *(_DWORD *)(v14 + 60) = v15;
    *(_DWORD *)a2 |= 0x80000000;
    *(_DWORD *)(a2 + 24) = 1;
    return result;
  }
  *(_DWORD *)(a2 + 32) = result;
LABEL_8:
  *(_QWORD *)(a2 + 24) = *MEMORY[0x1E0C804E8];
  return result;
}

uint64_t _XSetAttributeValue(uint64_t result, uint64_t a2)
{
  int v3;
  uint64_t v4;
  uint64_t v5;
  unsigned int v7;
  unsigned int v8;
  uint64_t v9;
  unsigned int v10;
  uint64_t v11;
  uint64_t v12;
  int v13;
  uint64_t v14;
  int v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  __int128 v20;
  __int128 v21[2];

  if ((*(_DWORD *)result & 0x80000000) == 0)
    goto LABEL_2;
  v3 = -304;
  if (*(_DWORD *)(result + 24) != 1)
    goto LABEL_3;
  v5 = *(unsigned int *)(result + 4);
  if (v5 < 0x5C || v5 > 0x105C)
    goto LABEL_3;
  if (*(_BYTE *)(result + 39) != 1)
    goto LABEL_19;
  v7 = *(_DWORD *)(result + 76);
  if (v7 > 0x1000)
  {
LABEL_2:
    v3 = -304;
LABEL_3:
    *(_DWORD *)(a2 + 32) = v3;
    v4 = *MEMORY[0x1E0C804E8];
    goto LABEL_4;
  }
  v3 = -304;
  if ((int)v5 - 92 < v7)
    goto LABEL_3;
  v8 = (v7 + 3) & 0xFFFFFFFC;
  if ((_DWORD)v5 != v8 + 92)
    goto LABEL_3;
  v9 = result + v8;
  v10 = *(_DWORD *)(result + 40);
  if (v10 != *(_DWORD *)(v9 + 80))
  {
LABEL_19:
    v3 = -300;
    goto LABEL_3;
  }
  v11 = ((v5 + 3) & 0x1FFFFFFFCLL) + result;
  if (*(_DWORD *)v11 || *(_DWORD *)(v11 + 4) <= 0x1Fu)
  {
    v3 = -309;
    goto LABEL_3;
  }
  v12 = v9 - 4096;
  v13 = *(_DWORD *)(result + 12);
  v14 = *(unsigned int *)(result + 52);
  v15 = *(_DWORD *)(result + 72);
  v16 = *(void **)(result + 28);
  v17 = *(_QWORD *)(v12 + 4180);
  v18 = *(_QWORD *)(result + 56);
  v19 = *(_QWORD *)(result + 64);
  v20 = *(_OWORD *)(v11 + 36);
  v21[0] = *(_OWORD *)(v11 + 20);
  v21[1] = v20;
  result = _AXXMIGSetAttributeValue(v13, v14, v18, v19, v15, result + 80, v7, v16, v10, v17, (int *)(a2 + 36), v21);
  *(_DWORD *)(a2 + 32) = result;
  v4 = *MEMORY[0x1E0C804E8];
  if (!(_DWORD)result)
  {
    *(_QWORD *)(a2 + 24) = v4;
    *(_DWORD *)(a2 + 4) = 40;
    return result;
  }
LABEL_4:
  *(_QWORD *)(a2 + 24) = v4;
  return result;
}

uint64_t _XPerformAction(uint64_t result, uint64_t a2)
{
  int v3;
  uint64_t v4;
  int v5;
  uint64_t v6;
  int v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  __int128 v11;
  __int128 v12[2];

  if ((*(_DWORD *)result & 0x80000000) != 0 || *(_DWORD *)(result + 4) != 64)
  {
    v3 = -304;
    goto LABEL_7;
  }
  if (*(_DWORD *)(result + 64) || *(_DWORD *)(result + 68) <= 0x1Fu)
  {
    v3 = -309;
LABEL_7:
    *(_DWORD *)(a2 + 32) = v3;
    v4 = *MEMORY[0x1E0C804E8];
    goto LABEL_8;
  }
  v5 = *(_DWORD *)(result + 12);
  v6 = *(unsigned int *)(result + 32);
  v7 = *(_DWORD *)(result + 52);
  v8 = *(_QWORD *)(result + 56);
  v9 = *(_QWORD *)(result + 36);
  v10 = *(_QWORD *)(result + 44);
  v11 = *(_OWORD *)(result + 100);
  v12[0] = *(_OWORD *)(result + 84);
  v12[1] = v11;
  result = _AXXMIGPerformAction(v5, v6, v9, v10, v7, v8, (int *)(a2 + 36), v12);
  *(_DWORD *)(a2 + 32) = result;
  v4 = *MEMORY[0x1E0C804E8];
  if (!(_DWORD)result)
  {
    *(_QWORD *)(a2 + 24) = v4;
    *(_DWORD *)(a2 + 4) = 40;
    return result;
  }
LABEL_8:
  *(_QWORD *)(a2 + 24) = v4;
  return result;
}

uint64_t _XPerformActionWithValue(uint64_t result, uint64_t a2)
{
  int v3;
  uint64_t v4;
  uint64_t v5;
  unsigned int v7;
  unsigned int v8;
  uint64_t v9;
  unsigned int v10;
  uint64_t v11;
  uint64_t v12;
  int v13;
  mach_port_name_t v14;
  uint64_t v15;
  int v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  __int128 v21;
  __int128 v22[2];

  if ((*(_DWORD *)result & 0x80000000) == 0)
    goto LABEL_2;
  v3 = -304;
  if (*(_DWORD *)(result + 24) != 2)
    goto LABEL_3;
  v5 = *(unsigned int *)(result + 4);
  if (v5 < 0x68 || v5 > 0x1068)
    goto LABEL_3;
  if (*(unsigned __int16 *)(result + 38) << 16 != 1114112 || *(_BYTE *)(result + 51) != 1)
    goto LABEL_20;
  v7 = *(_DWORD *)(result + 88);
  if (v7 > 0x1000)
  {
LABEL_2:
    v3 = -304;
LABEL_3:
    *(_DWORD *)(a2 + 32) = v3;
    v4 = *MEMORY[0x1E0C804E8];
    goto LABEL_4;
  }
  v3 = -304;
  if ((int)v5 - 104 < v7)
    goto LABEL_3;
  v8 = (v7 + 3) & 0xFFFFFFFC;
  if ((_DWORD)v5 != v8 + 104)
    goto LABEL_3;
  v9 = result + v8;
  v10 = *(_DWORD *)(result + 52);
  if (v10 != *(_DWORD *)(v9 + 92))
  {
LABEL_20:
    v3 = -300;
    goto LABEL_3;
  }
  v11 = ((v5 + 3) & 0x1FFFFFFFCLL) + result;
  if (*(_DWORD *)v11 || *(_DWORD *)(v11 + 4) <= 0x1Fu)
  {
    v3 = -309;
    goto LABEL_3;
  }
  v12 = v9 - 4096;
  v13 = *(_DWORD *)(result + 12);
  v14 = *(_DWORD *)(result + 28);
  v15 = *(unsigned int *)(result + 64);
  v16 = *(_DWORD *)(result + 84);
  v17 = *(void **)(result + 40);
  v18 = *(_QWORD *)(v12 + 4192);
  v19 = *(_QWORD *)(result + 68);
  v20 = *(_QWORD *)(result + 76);
  v21 = *(_OWORD *)(v11 + 36);
  v22[0] = *(_OWORD *)(v11 + 20);
  v22[1] = v21;
  result = _AXXMIGPerformActionWithValue(v13, v14, v15, v19, v20, v16, result + 92, v7, v17, v10, v18, (int *)(a2 + 36), v22);
  *(_DWORD *)(a2 + 32) = result;
  v4 = *MEMORY[0x1E0C804E8];
  if (!(_DWORD)result)
  {
    *(_QWORD *)(a2 + 24) = v4;
    *(_DWORD *)(a2 + 4) = 40;
    return result;
  }
LABEL_4:
  *(_QWORD *)(a2 + 24) = v4;
  return result;
}

uint64_t _XCopyElementAtPosition(uint64_t result, uint64_t a2)
{
  int v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  float v7;
  float v8;
  __int16 v9;
  int v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  __int128 v14;
  uint64_t v15;
  __int128 v16[2];
  int v17;

  if ((*(_DWORD *)result & 0x80000000) != 0 || *(_DWORD *)(result + 4) != 76)
  {
    v3 = -304;
    goto LABEL_7;
  }
  v17 = 0;
  if (*(_DWORD *)(result + 76) || *(_DWORD *)(result + 80) <= 0x1Fu)
  {
    v3 = -309;
LABEL_7:
    *(_DWORD *)(a2 + 32) = v3;
    v4 = *MEMORY[0x1E0C804E8];
    goto LABEL_8;
  }
  *(_DWORD *)(a2 + 56) = 1024;
  v5 = *(unsigned int *)(result + 12);
  v6 = *(unsigned int *)(result + 32);
  v7 = *(float *)(result + 52);
  v8 = *(float *)(result + 56);
  v9 = *(_WORD *)(result + 60);
  v10 = *(_DWORD *)(result + 64);
  v11 = *(_QWORD *)(result + 68);
  v12 = *(_QWORD *)(result + 36);
  v13 = *(_QWORD *)(result + 44);
  v14 = *(_OWORD *)(result + 112);
  v16[0] = *(_OWORD *)(result + 96);
  v16[1] = v14;
  result = _AXXMIGCopyElementAtPosition(v7, v8, v5, v6, v12, v13, v9, v10, v11, (_DWORD *)(a2 + 36), (_OWORD *)(a2 + 40), (_BYTE *)(a2 + 60), (_DWORD *)(a2 + 56), &v17, v16);
  *(_DWORD *)(a2 + 32) = result;
  v4 = *MEMORY[0x1E0C804E8];
  if (!(_DWORD)result)
  {
    *(_QWORD *)(a2 + 24) = v4;
    v15 = (*(_DWORD *)(a2 + 56) + 3) & 0xFFFFFFFC;
    *(_DWORD *)(a2 + 4) = v15 + 64;
    *(_DWORD *)(a2 + v15 + 60) = v17;
    return result;
  }
LABEL_8:
  *(_QWORD *)(a2 + 24) = v4;
  return result;
}

uint64_t _XAddNotification(uint64_t result, uint64_t a2)
{
  int v3;
  uint64_t v4;
  int v5;
  uint64_t v6;
  mach_port_name_t v7;
  uint64_t v8;
  int v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  __int128 v13;
  _OWORD v14[2];

  if ((*(_DWORD *)result & 0x80000000) == 0 || *(_DWORD *)(result + 24) != 1 || *(_DWORD *)(result + 4) != 84)
  {
    v3 = -304;
    goto LABEL_9;
  }
  if (*(unsigned __int16 *)(result + 38) << 16 != 1114112)
  {
    v3 = -300;
    goto LABEL_9;
  }
  if (*(_DWORD *)(result + 84) || *(_DWORD *)(result + 88) <= 0x1Fu)
  {
    v3 = -309;
LABEL_9:
    *(_DWORD *)(a2 + 32) = v3;
    v4 = *MEMORY[0x1E0C804E8];
    goto LABEL_10;
  }
  v5 = *(_DWORD *)(result + 12);
  v6 = *(unsigned int *)(result + 48);
  v7 = *(_DWORD *)(result + 28);
  v8 = *(unsigned int *)(result + 68);
  v9 = *(_DWORD *)(result + 72);
  v10 = *(_QWORD *)(result + 76);
  v11 = *(_QWORD *)(result + 52);
  v12 = *(_QWORD *)(result + 60);
  v13 = *(_OWORD *)(result + 120);
  v14[0] = *(_OWORD *)(result + 104);
  v14[1] = v13;
  result = _AXXMIGAddNotification(v5, v6, v11, v12, v8, v7, v9, v10, (int *)(a2 + 36), v14);
  *(_DWORD *)(a2 + 32) = result;
  v4 = *MEMORY[0x1E0C804E8];
  if (!(_DWORD)result)
  {
    *(_QWORD *)(a2 + 24) = v4;
    *(_DWORD *)(a2 + 4) = 40;
    return result;
  }
LABEL_10:
  *(_QWORD *)(a2 + 24) = v4;
  return result;
}

uint64_t _XRemoveNotification(uint64_t result, uint64_t a2)
{
  int v3;
  uint64_t v4;
  int v5;
  uint64_t v6;
  uint64_t v7;
  mach_port_name_t v8;
  uint64_t v9;
  uint64_t v10;
  __int128 v11;
  __int128 v12[2];

  if ((*(_DWORD *)result & 0x80000000) == 0 || *(_DWORD *)(result + 24) != 1 || *(_DWORD *)(result + 4) != 72)
  {
    v3 = -304;
    goto LABEL_9;
  }
  if (*(unsigned __int16 *)(result + 38) << 16 != 1114112)
  {
    v3 = -300;
    goto LABEL_9;
  }
  if (*(_DWORD *)(result + 72) || *(_DWORD *)(result + 76) <= 0x1Fu)
  {
    v3 = -309;
LABEL_9:
    *(_DWORD *)(a2 + 32) = v3;
    v4 = *MEMORY[0x1E0C804E8];
    goto LABEL_10;
  }
  v5 = *(_DWORD *)(result + 12);
  v6 = *(unsigned int *)(result + 48);
  v7 = *(unsigned int *)(result + 68);
  v8 = *(_DWORD *)(result + 28);
  v9 = *(_QWORD *)(result + 52);
  v10 = *(_QWORD *)(result + 60);
  v11 = *(_OWORD *)(result + 108);
  v12[0] = *(_OWORD *)(result + 92);
  v12[1] = v11;
  result = _AXXMIGRemoveNotification(v5, v6, v9, v10, v7, v8, (int *)(a2 + 36), v12);
  *(_DWORD *)(a2 + 32) = result;
  v4 = *MEMORY[0x1E0C804E8];
  if (!(_DWORD)result)
  {
    *(_QWORD *)(a2 + 24) = v4;
    *(_DWORD *)(a2 + 4) = 40;
    return result;
  }
LABEL_10:
  *(_QWORD *)(a2 + 24) = v4;
  return result;
}

uint64_t _XCopyParameterizedAttributeValue(uint64_t result, uint64_t a2)
{
  int v3;
  uint64_t v4;
  unsigned int v6;
  unsigned int v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  int v11;
  uint64_t v12;
  int v13;
  unsigned int v14;
  void *v15;
  unsigned int v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  __int128 v20;
  int v21;
  uint64_t v22;
  uint64_t v23;
  int v24;
  __int128 v25[2];
  uint64_t v26;

  if ((*(_DWORD *)result & 0x80000000) == 0)
    goto LABEL_2;
  v3 = -304;
  if (*(_DWORD *)(result + 24) != 1)
    goto LABEL_3;
  v4 = *(unsigned int *)(result + 4);
  if (v4 < 0x5C || v4 > 0x105C)
    goto LABEL_3;
  if (*(_BYTE *)(result + 39) != 1)
    goto LABEL_19;
  v6 = *(_DWORD *)(result + 76);
  if (v6 > 0x1000)
  {
LABEL_2:
    v3 = -304;
LABEL_3:
    *(_DWORD *)(a2 + 32) = v3;
    goto LABEL_4;
  }
  v3 = -304;
  if ((int)v4 - 92 < v6)
    goto LABEL_3;
  v7 = (v6 + 3) & 0xFFFFFFFC;
  if ((_DWORD)v4 != v7 + 92)
    goto LABEL_3;
  v8 = result + v7;
  if (*(_DWORD *)(result + 40) != *(_DWORD *)(v8 + 80))
  {
LABEL_19:
    v3 = -300;
    goto LABEL_3;
  }
  v26 = 0;
  v9 = ((v4 + 3) & 0x1FFFFFFFCLL) + result;
  if (*(_DWORD *)v9 || *(_DWORD *)(v9 + 4) <= 0x1Fu)
  {
    v3 = -309;
    goto LABEL_3;
  }
  *(_DWORD *)(a2 + 52) = 4096;
  *(_DWORD *)(a2 + 36) = 16777473;
  v10 = v8 - 4096;
  v11 = *(_DWORD *)(result + 12);
  v12 = *(unsigned int *)(result + 52);
  v13 = *(_DWORD *)(result + 72);
  v14 = *(_DWORD *)(result + 76);
  v15 = *(void **)(result + 28);
  v16 = *(_DWORD *)(result + 40);
  v17 = *(_QWORD *)(v10 + 4180);
  v18 = *(_QWORD *)(result + 56);
  v19 = *(_QWORD *)(result + 64);
  v20 = *(_OWORD *)(v9 + 36);
  v25[0] = *(_OWORD *)(v9 + 20);
  v25[1] = v20;
  result = _AXXMIGCopyParameterizedAttributeValue(v11, v12, v18, v19, v13, result + 80, v14, v15, v16, v17, (void *)(a2 + 56), (_DWORD *)(a2 + 52), (void **)(a2 + 28), (_DWORD *)&v26 + 1, (int *)&v26, v25);
  if (!(_DWORD)result)
  {
    v21 = HIDWORD(v26);
    *(_DWORD *)(a2 + 40) = HIDWORD(v26);
    *(_QWORD *)(a2 + 44) = *MEMORY[0x1E0C804E8];
    v22 = (*(_DWORD *)(a2 + 52) + 3) & 0xFFFFFFFC;
    *(_DWORD *)(a2 + 4) = v22 + 64;
    v23 = a2 + v22;
    v24 = v26;
    *(_DWORD *)(v23 + 56) = v21;
    *(_DWORD *)(v23 + 60) = v24;
    *(_DWORD *)a2 |= 0x80000000;
    *(_DWORD *)(a2 + 24) = 1;
    return result;
  }
  *(_DWORD *)(a2 + 32) = result;
LABEL_4:
  *(_QWORD *)(a2 + 24) = *MEMORY[0x1E0C804E8];
  return result;
}

uint64_t _XCopyMultipleAttributeValues(uint64_t result, uint64_t a2)
{
  int v3;
  uint64_t v4;
  unsigned int v6;
  unsigned int v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  int v11;
  uint64_t v12;
  unsigned int v13;
  void *v14;
  unsigned int v15;
  int v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  __int128 v20;
  int v21;
  uint64_t v22;
  uint64_t v23;
  int v24;
  __int128 v25[2];
  uint64_t v26;

  if ((*(_DWORD *)result & 0x80000000) == 0)
    goto LABEL_2;
  v3 = -304;
  if (*(_DWORD *)(result + 24) != 1)
    goto LABEL_3;
  v4 = *(unsigned int *)(result + 4);
  if (v4 < 0x5C || v4 > 0x105C)
    goto LABEL_3;
  if (*(_BYTE *)(result + 39) != 1)
    goto LABEL_19;
  v6 = *(_DWORD *)(result + 72);
  if (v6 > 0x1000)
  {
LABEL_2:
    v3 = -304;
LABEL_3:
    *(_DWORD *)(a2 + 32) = v3;
    goto LABEL_4;
  }
  v3 = -304;
  if ((int)v4 - 92 < v6)
    goto LABEL_3;
  v7 = (v6 + 3) & 0xFFFFFFFC;
  if ((_DWORD)v4 != v7 + 92)
    goto LABEL_3;
  v8 = result + v7;
  if (*(_DWORD *)(result + 40) != *(_DWORD *)(v8 + 76))
  {
LABEL_19:
    v3 = -300;
    goto LABEL_3;
  }
  v26 = 0;
  v9 = ((v4 + 3) & 0x1FFFFFFFCLL) + result;
  if (*(_DWORD *)v9 || *(_DWORD *)(v9 + 4) <= 0x1Fu)
  {
    v3 = -309;
    goto LABEL_3;
  }
  *(_DWORD *)(a2 + 52) = 4096;
  *(_DWORD *)(a2 + 36) = 16777473;
  v10 = v8 - 4096;
  v11 = *(_DWORD *)(result + 12);
  v12 = *(unsigned int *)(result + 52);
  v13 = *(_DWORD *)(result + 72);
  v14 = *(void **)(result + 28);
  v15 = *(_DWORD *)(result + 40);
  v16 = *(_DWORD *)(v10 + 4176);
  v17 = *(_QWORD *)(v10 + 4180);
  v18 = *(_QWORD *)(result + 56);
  v19 = *(_QWORD *)(result + 64);
  v20 = *(_OWORD *)(v9 + 36);
  v25[0] = *(_OWORD *)(v9 + 20);
  v25[1] = v20;
  result = _AXXMIGCopyMultipleAttributeValues(v11, v12, v18, v19, result + 76, v13, v14, v15, v16, v17, (void *)(a2 + 56), (_DWORD *)(a2 + 52), (void **)(a2 + 28), (_DWORD *)&v26 + 1, &v26, v25);
  if (!(_DWORD)result)
  {
    v21 = HIDWORD(v26);
    *(_DWORD *)(a2 + 40) = HIDWORD(v26);
    *(_QWORD *)(a2 + 44) = *MEMORY[0x1E0C804E8];
    v22 = (*(_DWORD *)(a2 + 52) + 3) & 0xFFFFFFFC;
    *(_DWORD *)(a2 + 4) = v22 + 64;
    v23 = a2 + v22;
    v24 = v26;
    *(_DWORD *)(v23 + 56) = v21;
    *(_DWORD *)(v23 + 60) = v24;
    *(_DWORD *)a2 |= 0x80000000;
    *(_DWORD *)(a2 + 24) = 1;
    return result;
  }
  *(_DWORD *)(a2 + 32) = result;
LABEL_4:
  *(_QWORD *)(a2 + 24) = *MEMORY[0x1E0C804E8];
  return result;
}

uint64_t AccessibilityDefs_server(_DWORD *a1, uint64_t a2)
{
  int v2;
  int v3;
  int v4;
  void (*v5)(void);
  uint64_t result;

  v2 = a1[2];
  *(_DWORD *)a2 = *a1 & 0x1F;
  *(_DWORD *)(a2 + 4) = 36;
  v3 = a1[5] + 100;
  *(_DWORD *)(a2 + 8) = v2;
  *(_DWORD *)(a2 + 12) = 0;
  *(_DWORD *)(a2 + 16) = 0;
  *(_DWORD *)(a2 + 20) = v3;
  v4 = a1[5];
  if ((v4 - 860013) >= 0xFFFFFFF5
    && (v5 = (void (*)(void))_AXXMIGAccessibilityDefs_subsystem[5 * (v4 - 860002) + 5]) != 0)
  {
    v5();
    return 1;
  }
  else
  {
    result = 0;
    *(_QWORD *)(a2 + 24) = *MEMORY[0x1E0C804E8];
    *(_DWORD *)(a2 + 32) = -303;
  }
  return result;
}

void _AXDetermineRequestingClient_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_1B54A6000, a1, a3, "Requesting AX client was AXUIServer multiplexing but no futher match found. falling back to unknown", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_1();
}

void _AXHandleRemoteElementCallthrough_cold_1(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_debug_impl(&dword_1B54A6000, log, OS_LOG_TYPE_DEBUG, "Not returning remote element because its from the same pid and we're not on main thread.", v1, 2u);
  OUTLINED_FUNCTION_1();
}

void AXSerializeWrapper_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_1B54A6000, a1, a3, "Still could not get serialized buffer key!", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_1();
}

void _AXUIElementRegisterServerWithRunLoopInternal_cold_1(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_debug_impl(&dword_1B54A6000, log, OS_LOG_TYPE_DEBUG, "Successfully created AX server", v1, 2u);
  OUTLINED_FUNCTION_1();
}

void _AXUIElementRegisterServerWithRunLoopInternal_cold_2(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_fault_impl(&dword_1B54A6000, log, OS_LOG_TYPE_FAULT, "Unable to create run loop source for remote bridge communication.", v1, 2u);
  OUTLINED_FUNCTION_1();
}

void _AXUIElementRegisterServerWithRunLoopInternal_cold_3(kern_return_t a1, NSObject *a2)
{
  uint8_t v3[24];
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  bootstrap_strerror(a1);
  OUTLINED_FUNCTION_0_0();
  _os_log_fault_impl(&dword_1B54A6000, a2, OS_LOG_TYPE_FAULT, "Unable to create mach port for remote bridge communication: %i (%s)", v3, 0x12u);
  OUTLINED_FUNCTION_1_0();
}

void _AXUIElementRegisterServerWithRunLoopInternal_cold_4(kern_return_t a1, NSObject *a2)
{
  uint8_t v3[24];
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  bootstrap_strerror(a1);
  OUTLINED_FUNCTION_0_0();
  _os_log_error_impl(&dword_1B54A6000, a2, OS_LOG_TYPE_ERROR, "Unable to create mach port for AX Server: %i (%s)", v3, 0x12u);
  OUTLINED_FUNCTION_1_0();
}

void _AXXMIGCopyElementAtPosition_cold_1(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_1B54A6000, log, OS_LOG_TYPE_ERROR, "This copy element call was not allowed", v1, 2u);
  OUTLINED_FUNCTION_1();
}

void __AXUIElementInitialize_cold_1(int a1, NSObject *a2)
{
  _DWORD v2[2];
  uint64_t v3;

  v3 = *MEMORY[0x1E0C80C00];
  v2[0] = 67109120;
  v2[1] = a1;
  _os_log_fault_impl(&dword_1B54A6000, a2, OS_LOG_TYPE_FAULT, "could not create pthread key: %d", (uint8_t *)v2, 8u);
}

void __getBKSHIDEventAuthenticationMessageClass_block_invoke_cold_1(_QWORD *a1)
{
  void *v2;
  void *v3;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "void *BackBoardServicesLibrary(void)");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "handleFailureInFunction:file:lineNumber:description:", v3, CFSTR("AXRuntimeUtilities.m"), 23, CFSTR("%s"), *a1);

  __break(1u);
}

void __getBKSHIDEventAuthenticationMessageClass_block_invoke_cold_2()
{
  void *v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "Class getBKSHIDEventAuthenticationMessageClass(void)_block_invoke");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", v1, CFSTR("AXRuntimeUtilities.m"), 24, CFSTR("Unable to find class %s"), "BKSHIDEventAuthenticationMessage");

  __break(1u);
}

void AXUnserializeCFType_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_2(&dword_1B54A6000, a1, a3, "serialization error: %s", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_2();
}

void _logAndReturn_cold_1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_2(&dword_1B54A6000, a2, a3, "serialization error: %s", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_2();
}

void bogusUnserialize_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_2(&dword_1B54A6000, a1, a3, "serialization error: %s", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_2();
}

void cfStringUnserialize_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_2(&dword_1B54A6000, a1, a3, "serialization error: %s", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_2();
}

void cfStringUnserialize_cold_2(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_2(&dword_1B54A6000, a1, a3, "serialization error: %s", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_2();
}

void cfStringUnserialize_cold_3(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_2(&dword_1B54A6000, a1, a3, "serialization error: %s", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_2();
}

void cfStringUnserialize_cold_4(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_2(&dword_1B54A6000, a1, a3, "serialization error: %s", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_2();
}

void cfNumberUnserialize_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_2(&dword_1B54A6000, a1, a3, "serialization error: %s", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_2();
}

void cfNumberUnserialize_cold_2(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_2(&dword_1B54A6000, a1, a3, "serialization error: %s", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_2();
}

void cfNumberUnserialize_cold_3(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_2(&dword_1B54A6000, a1, a3, "serialization error: %s", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_2();
}

void cfNumberUnserialize_cold_4(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_2(&dword_1B54A6000, a1, a3, "serialization error: %s", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_2();
}

void cfNumberUnserialize_cold_5(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_2(&dword_1B54A6000, a1, a3, "serialization error: %s", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_2();
}

void cfBooleanUnserialize_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_2(&dword_1B54A6000, a1, a3, "serialization error: %s", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_2();
}

void cfBooleanUnserialize_cold_2(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_2(&dword_1B54A6000, a1, a3, "serialization error: %s", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_2();
}

void cfArrayUnserialize_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_2(&dword_1B54A6000, a1, a3, "serialization error: %s", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_2();
}

void cfArrayUnserialize_cold_2(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_2(&dword_1B54A6000, a1, a3, "serialization error: %s", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_2();
}

void cfArrayUnserialize_cold_3(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_2(&dword_1B54A6000, a1, a3, "serialization error: %s", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_2();
}

void cfArrayUnserialize_cold_5(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_2(&dword_1B54A6000, a1, a3, "serialization error: %s", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_2();
}

void cfArrayUnserialize_cold_6(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_2(&dword_1B54A6000, a1, a3, "serialization error: %s", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_2();
}

void cfDictionaryUnserialize_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_2(&dword_1B54A6000, a1, a3, "serialization error: %s", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_2();
}

void cfDictionaryUnserialize_cold_2(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_2(&dword_1B54A6000, a1, a3, "serialization error: %s", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_2();
}

void cfDictionaryUnserialize_cold_3(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_2(&dword_1B54A6000, a1, a3, "serialization error: %s", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_2();
}

void cfDictionaryUnserialize_cold_5(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_2(&dword_1B54A6000, a1, a3, "serialization error: %s", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_2();
}

void cfDictionaryUnserialize_cold_6(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_2(&dword_1B54A6000, a1, a3, "serialization error: %s", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_2();
}

void cfDictionaryUnserialize_cold_7(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_2(&dword_1B54A6000, a1, a3, "serialization error: %s", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_2();
}

void cfDataUnserialize_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_2(&dword_1B54A6000, a1, a3, "serialization error: %s", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_2();
}

void cfDataUnserialize_cold_2(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_2(&dword_1B54A6000, a1, a3, "serialization error: %s", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_2();
}

void cfDataUnserialize_cold_3(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_2(&dword_1B54A6000, a1, a3, "serialization error: %s", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_2();
}

void cfDataUnserialize_cold_4(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_2(&dword_1B54A6000, a1, a3, "serialization error: %s", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_2();
}

void cfDateUnserialize_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_2(&dword_1B54A6000, a1, a3, "serialization error: %s", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_2();
}

void cfDateUnserialize_cold_2(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_2(&dword_1B54A6000, a1, a3, "serialization error: %s", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_2();
}

void cfDateUnserialize_cold_3(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_2(&dword_1B54A6000, a1, a3, "serialization error: %s", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_2();
}

void cfURLUnserialize_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_2(&dword_1B54A6000, a1, a3, "serialization error: %s", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_2();
}

void cfURLUnserialize_cold_2(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_2(&dword_1B54A6000, a1, a3, "serialization error: %s", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_2();
}

void cfURLUnserialize_cold_3(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_2(&dword_1B54A6000, a1, a3, "serialization error: %s", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_2();
}

void cfURLUnserialize_cold_4(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_2(&dword_1B54A6000, a1, a3, "serialization error: %s", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_2();
}

void cfNullUnserialize_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_2(&dword_1B54A6000, a1, a3, "serialization error: %s", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_2();
}

void cfNullUnserialize_cold_2(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_2(&dword_1B54A6000, a1, a3, "serialization error: %s", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_2();
}

void cfAttributedStringUnserialize_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_2(&dword_1B54A6000, a1, a3, "serialization error: %s", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_2();
}

void cfAttributedStringUnserialize_cold_2(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_2(&dword_1B54A6000, a1, a3, "serialization error: %s", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_2();
}

void cfAttributedStringUnserialize_cold_3(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_2(&dword_1B54A6000, a1, a3, "serialization error: %s", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_2();
}

void cfAttributedStringUnserialize_cold_4(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_2(&dword_1B54A6000, a1, a3, "serialization error: %s", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_2();
}

void cfAttributedStringUnserialize_cold_6(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_2(&dword_1B54A6000, a1, a3, "serialization error: %s", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_2();
}

void cfAttributedStringUnserialize_cold_7(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_2(&dword_1B54A6000, a1, a3, "serialization error: %s", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_2();
}

void axElementUnserialize_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_2(&dword_1B54A6000, a1, a3, "serialization error: %s", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_2();
}

void axValueUnserialize_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_2(&dword_1B54A6000, a1, a3, "serialization error: %s", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_2();
}

void axValueUnserialize_cold_2(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_2(&dword_1B54A6000, a1, a3, "serialization error: %s", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_2();
}

void axValueUnserialize_cold_3(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_2(&dword_1B54A6000, a1, a3, "serialization error: %s", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_2();
}

void axValueUnserialize_cold_4(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_2(&dword_1B54A6000, a1, a3, "serialization error: %s", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_2();
}

void cgColorUnserialize_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_2(&dword_1B54A6000, a1, a3, "serialization error: %s", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_2();
}

void cgColorUnserialize_cold_2(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_2(&dword_1B54A6000, a1, a3, "serialization error: %s", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_2();
}

void cgColorUnserialize_cold_3(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_2(&dword_1B54A6000, a1, a3, "serialization error: %s", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_2();
}

void cgColorUnserialize_cold_4(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_2(&dword_1B54A6000, a1, a3, "serialization error: %s", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_2();
}

void cgColorUnserialize_cold_5(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_2(&dword_1B54A6000, a1, a3, "serialization error: %s", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_2();
}

void cgPathUnserialize_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_2(&dword_1B54A6000, a1, a3, "serialization error: %s", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_2();
}

void cgPathUnserialize_cold_2(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_2(&dword_1B54A6000, a1, a3, "serialization error: %s", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_2();
}

void cgPathUnserialize_cold_3(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_2(&dword_1B54A6000, a1, a3, "serialization error: %s", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_2();
}

void cgPathUnserialize_cold_4(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_2(&dword_1B54A6000, a1, a3, "serialization error: %s", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_2();
}

void cgPathUnserialize_cold_5(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_2(&dword_1B54A6000, a1, a3, "serialization error: %s", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_2();
}

void cfUUIDUnserialize_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_2(&dword_1B54A6000, a1, a3, "serialization error: %s", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_2();
}

void cfUUIDUnserialize_cold_2(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_2(&dword_1B54A6000, a1, a3, "serialization error: %s", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_2();
}

void ctFontUnserialize_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_2(&dword_1B54A6000, a1, a3, "serialization error: %s", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_2();
}

void ctFontUnserialize_cold_2(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_2(&dword_1B54A6000, a1, a3, "serialization error: %s", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_2();
}

void __getFBSDisplayMonitorClass_block_invoke_cold_1(_QWORD *a1)
{
  void *v2;
  void *v3;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "void *FrontBoardServicesLibrary(void)");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "handleFailureInFunction:file:lineNumber:description:", v3, CFSTR("AXPidManagement.m"), 26, CFSTR("%s"), *a1);

  __break(1u);
}

void __getFBSDisplayMonitorClass_block_invoke_cold_2()
{
  void *v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "Class getFBSDisplayMonitorClass(void)_block_invoke");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", v1, CFSTR("AXPidManagement.m"), 27, CFSTR("Unable to find class %s"), "FBSDisplayMonitor");

  __break(1u);
}

void __getAXPIFingerControllerClass_block_invoke_cold_1()
{
  void *v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "Class getAXPIFingerControllerClass(void)_block_invoke");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", v1, CFSTR("AXUIMLElement.m"), 35, CFSTR("Unable to find class %s"), "AXPIFingerController");

  __break(1u);
}

void AccessibilityPhysicalInteractionLibrary_cold_1(_QWORD *a1)
{
  void *v2;
  void *v3;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "void *AccessibilityPhysicalInteractionLibrary(void)");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "handleFailureInFunction:file:lineNumber:description:", v3, CFSTR("AXUIMLElement.m"), 34, CFSTR("%s"), *a1);

  __break(1u);
}

void __getAXMTextDetectionOptionsClass_block_invoke_cold_1()
{
  void *v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "Class getAXMTextDetectionOptionsClass(void)_block_invoke");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", v1, CFSTR("AXUIMLElement.m"), 26, CFSTR("Unable to find class %s"), "AXMTextDetectionOptions");

  __break(1u);
}

void AXMediaUtilitiesLibrary_cold_1(_QWORD *a1)
{
  void *v2;
  void *v3;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "void *AXMediaUtilitiesLibrary(void)");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "handleFailureInFunction:file:lineNumber:description:", v3, CFSTR("AXUIMLElement.m"), 23, CFSTR("%s"), *a1);

  __break(1u);
}

void __getAXMDisplayManagerClass_block_invoke_cold_1()
{
  void *v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "Class getAXMDisplayManagerClass(void)_block_invoke");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", v1, CFSTR("AXUIMLElement.m"), 27, CFSTR("Unable to find class %s"), "AXMDisplayManager");

  __break(1u);
}

void __getAXMVisionScreenRecognitionOptionsClass_block_invoke_cold_1()
{
  void *v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "Class getAXMVisionScreenRecognitionOptionsClass(void)_block_invoke");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", v1, CFSTR("AXUIMLElement.m"), 25, CFSTR("Unable to find class %s"), "AXMVisionScreenRecognitionOptions");

  __break(1u);
}

void __getAXMScreenRecognitionCenterClass_block_invoke_cold_1()
{
  void *v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "Class getAXMScreenRecognitionCenterClass(void)_block_invoke");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", v1, CFSTR("AXUIMLElement.m"), 29, CFSTR("Unable to find class %s"), "AXMScreenRecognitionCenter");

  __break(1u);
}

void __getAXMVisionFeatureClass_block_invoke_cold_1()
{
  void *v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "Class getAXMVisionFeatureClass(void)_block_invoke");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", v1, CFSTR("AXUIMLElement.m"), 28, CFSTR("Unable to find class %s"), "AXMVisionFeature");

  __break(1u);
}

void __getAXSettingsClass_block_invoke_cold_1(_QWORD *a1)
{
  void *v2;
  void *v3;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "void *AccessibilityUtilitiesLibrary(void)");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "handleFailureInFunction:file:lineNumber:description:", v3, CFSTR("AXUIMLElement.m"), 38, CFSTR("%s"), *a1);

  __break(1u);
}

void __getAXSettingsClass_block_invoke_cold_2()
{
  void *v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "Class getAXSettingsClass(void)_block_invoke");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", v1, CFSTR("AXUIMLElement.m"), 39, CFSTR("Unable to find class %s"), "AXSettings");

  __break(1u);
}

void __getAXNamedReplayableGestureClass_block_invoke_cold_1()
{
  void *v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "Class getAXNamedReplayableGestureClass(void)_block_invoke");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", v1, CFSTR("AXUIMLElement.m"), 36, CFSTR("Unable to find class %s"), "AXNamedReplayableGesture");

  __break(1u);
}

void __getAXCustomContentClass_block_invoke_cold_1(_QWORD *a1)
{
  void *v2;
  void *v3;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "void *AccessibilityLibrary(void)");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "handleFailureInFunction:file:lineNumber:description:", v3, CFSTR("AXElement.m"), 24, CFSTR("%s"), *a1);

  __break(1u);
}

void __getAXCustomContentClass_block_invoke_cold_2()
{
  void *v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "Class getAXCustomContentClass(void)_block_invoke");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", v1, CFSTR("AXElement.m"), 25, CFSTR("Unable to find class %s"), "AXCustomContent");

  __break(1u);
}

void AXSerializeCFType3_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_1B54A6000, a1, a3, "unknown serialization error!", a5, a6, a7, a8, 0);
}

void __getAXPerformPrivilegedAttributedStringTransformationsSymbolLoc_block_invoke_cold_1(_QWORD *a1)
{
  void *v2;
  void *v3;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "void *AccessibilityUtilitiesLibrary(void)");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "handleFailureInFunction:file:lineNumber:description:", v3, CFSTR("AXClientSideValueTransformer.m"), 16, CFSTR("%s"), *a1);

  __break(1u);
  AXDeviceIsAudioAccessory();
}

uint64_t AXDeviceIsAudioAccessory()
{
  return MEMORY[0x1E0CF30C8]();
}

uint64_t AXLogAppAccessibility()
{
  return MEMORY[0x1E0CF31B8]();
}

uint64_t AXLogCommon()
{
  return MEMORY[0x1E0CF31F8]();
}

uint64_t AXLogHitTest()
{
  return MEMORY[0x1E0CF3230]();
}

uint64_t AXLogRemoteElement()
{
  return MEMORY[0x1E0CF3280]();
}

uint64_t AXLogUIA()
{
  return MEMORY[0x1E0CF3308]();
}

uint64_t AXMediaLogElementVision()
{
  return MEMORY[0x1E0CF3350]();
}

uint64_t AXMediaLogMLElement()
{
  return MEMORY[0x1E0CF3378]();
}

uint64_t AXPerformBlockOnMainThreadAfterDelay()
{
  return MEMORY[0x1E0CF33E8]();
}

uint64_t AXRuntimeCheck_SupportsMacAXV2()
{
  return MEMORY[0x1E0CF34B8]();
}

uint64_t AXRuntimeLogCommon()
{
  return MEMORY[0x1E0CF34D8]();
}

uint64_t AXRuntimeLogNotifications()
{
  return MEMORY[0x1E0CF34E0]();
}

uint64_t AXRuntimeLogPID()
{
  return MEMORY[0x1E0CF34E8]();
}

uint64_t AXRuntimeLogSerialization()
{
  return MEMORY[0x1E0CF34F0]();
}

uint64_t AX_PERFORM_WITH_LOCK()
{
  return MEMORY[0x1E0CF38E8]();
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

void CFArrayApplyFunction(CFArrayRef theArray, CFRange range, CFArrayApplierFunction applier, void *context)
{
  MEMORY[0x1E0C97D00](theArray, range.location, range.length, applier, context);
}

CFArrayRef CFArrayCreate(CFAllocatorRef allocator, const void **values, CFIndex numValues, const CFArrayCallBacks *callBacks)
{
  return (CFArrayRef)MEMORY[0x1E0C97D20](allocator, values, numValues, callBacks);
}

CFMutableArrayRef CFArrayCreateMutable(CFAllocatorRef allocator, CFIndex capacity, const CFArrayCallBacks *callBacks)
{
  return (CFMutableArrayRef)MEMORY[0x1E0C97D38](allocator, capacity, callBacks);
}

CFIndex CFArrayGetCount(CFArrayRef theArray)
{
  return MEMORY[0x1E0C97D60](theArray);
}

CFTypeID CFArrayGetTypeID(void)
{
  return MEMORY[0x1E0C97D90]();
}

const void *__cdecl CFArrayGetValueAtIndex(CFArrayRef theArray, CFIndex idx)
{
  return (const void *)MEMORY[0x1E0C97D98](theArray, idx);
}

void CFArrayInsertValueAtIndex(CFMutableArrayRef theArray, CFIndex idx, const void *value)
{
  MEMORY[0x1E0C97DB0](theArray, idx, value);
}

void CFArraySetValueAtIndex(CFMutableArrayRef theArray, CFIndex idx, const void *value)
{
  MEMORY[0x1E0C97DD0](theArray, idx, value);
}

void CFAttributedStringBeginEditing(CFMutableAttributedStringRef aStr)
{
  MEMORY[0x1E0C97DE8](aStr);
}

CFAttributedStringRef CFAttributedStringCreate(CFAllocatorRef alloc, CFStringRef str, CFDictionaryRef attributes)
{
  return (CFAttributedStringRef)MEMORY[0x1E0C97DF0](alloc, str, attributes);
}

CFMutableAttributedStringRef CFAttributedStringCreateMutableCopy(CFAllocatorRef alloc, CFIndex maxLength, CFAttributedStringRef aStr)
{
  return (CFMutableAttributedStringRef)MEMORY[0x1E0C97E08](alloc, maxLength, aStr);
}

void CFAttributedStringEndEditing(CFMutableAttributedStringRef aStr)
{
  MEMORY[0x1E0C97E18](aStr);
}

CFTypeRef CFAttributedStringGetAttribute(CFAttributedStringRef aStr, CFIndex loc, CFStringRef attrName, CFRange *effectiveRange)
{
  return (CFTypeRef)MEMORY[0x1E0C97E20](aStr, loc, attrName, effectiveRange);
}

CFDictionaryRef CFAttributedStringGetAttributes(CFAttributedStringRef aStr, CFIndex loc, CFRange *effectiveRange)
{
  return (CFDictionaryRef)MEMORY[0x1E0C97E30](aStr, loc, effectiveRange);
}

CFIndex CFAttributedStringGetLength(CFAttributedStringRef aStr)
{
  return MEMORY[0x1E0C97E48](aStr);
}

CFStringRef CFAttributedStringGetString(CFAttributedStringRef aStr)
{
  return (CFStringRef)MEMORY[0x1E0C97E50](aStr);
}

CFTypeID CFAttributedStringGetTypeID(void)
{
  return MEMORY[0x1E0C97E58]();
}

void CFAttributedStringRemoveAttribute(CFMutableAttributedStringRef aStr, CFRange range, CFStringRef attrName)
{
  MEMORY[0x1E0C97E60](aStr, range.location, range.length, attrName);
}

void CFAttributedStringReplaceAttributedString(CFMutableAttributedStringRef aStr, CFRange range, CFAttributedStringRef replacement)
{
  MEMORY[0x1E0C97E68](aStr, range.location, range.length, replacement);
}

void CFAttributedStringReplaceString(CFMutableAttributedStringRef aStr, CFRange range, CFStringRef replacement)
{
  MEMORY[0x1E0C97E70](aStr, range.location, range.length, replacement);
}

void CFAttributedStringSetAttributes(CFMutableAttributedStringRef aStr, CFRange range, CFDictionaryRef replacement, Boolean clearOtherAttributes)
{
  MEMORY[0x1E0C97E80](aStr, range.location, range.length, replacement, clearOtherAttributes);
}

CFTypeRef CFAutorelease(CFTypeRef arg)
{
  return (CFTypeRef)MEMORY[0x1E0C97E90](arg);
}

CFTypeID CFBooleanGetTypeID(void)
{
  return MEMORY[0x1E0C97FC8]();
}

Boolean CFBooleanGetValue(CFBooleanRef BOOLean)
{
  return MEMORY[0x1E0C97FE0](BOOLean);
}

void CFDataAppendBytes(CFMutableDataRef theData, const UInt8 *bytes, CFIndex length)
{
  MEMORY[0x1E0C98390](theData, bytes, length);
}

CFDataRef CFDataCreate(CFAllocatorRef allocator, const UInt8 *bytes, CFIndex length)
{
  return (CFDataRef)MEMORY[0x1E0C983A0](allocator, bytes, length);
}

CFMutableDataRef CFDataCreateMutable(CFAllocatorRef allocator, CFIndex capacity)
{
  return (CFMutableDataRef)MEMORY[0x1E0C983B8](allocator, capacity);
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

CFTypeID CFDataGetTypeID(void)
{
  return MEMORY[0x1E0C98418]();
}

CFDateRef CFDateCreate(CFAllocatorRef allocator, CFAbsoluteTime at)
{
  return (CFDateRef)MEMORY[0x1E0C98448](allocator, at);
}

CFAbsoluteTime CFDateGetAbsoluteTime(CFDateRef theDate)
{
  CFAbsoluteTime result;

  MEMORY[0x1E0C984D8](theDate);
  return result;
}

CFTypeID CFDateGetTypeID(void)
{
  return MEMORY[0x1E0C984E8]();
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

void CFDictionaryGetKeysAndValues(CFDictionaryRef theDict, const void **keys, const void **values)
{
  MEMORY[0x1E0C985A0](theDict, keys, values);
}

CFTypeID CFDictionaryGetTypeID(void)
{
  return MEMORY[0x1E0C985A8]();
}

const void *__cdecl CFDictionaryGetValue(CFDictionaryRef theDict, const void *key)
{
  return (const void *)MEMORY[0x1E0C985B8](theDict, key);
}

void CFDictionaryRemoveValue(CFMutableDictionaryRef theDict, const void *key)
{
  MEMORY[0x1E0C985E8](theDict, key);
}

void CFDictionarySetValue(CFMutableDictionaryRef theDict, const void *key, const void *value)
{
  MEMORY[0x1E0C98610](theDict, key, value);
}

Boolean CFEqual(CFTypeRef cf1, CFTypeRef cf2)
{
  return MEMORY[0x1E0C98620](cf1, cf2);
}

CFAllocatorRef CFGetAllocator(CFTypeRef cf)
{
  return (CFAllocatorRef)MEMORY[0x1E0C98718](cf);
}

CFTypeID CFGetTypeID(CFTypeRef cf)
{
  return MEMORY[0x1E0C98738](cf);
}

CFHashCode CFHash(CFTypeRef cf)
{
  return MEMORY[0x1E0C98758](cf);
}

uint64_t CFLog()
{
  return MEMORY[0x1E0C98808]();
}

CFMachPortRef CFMachPortCreateWithPort(CFAllocatorRef allocator, mach_port_t portNum, CFMachPortCallBack callout, CFMachPortContext *context, Boolean *shouldFreeInfo)
{
  return (CFMachPortRef)MEMORY[0x1E0C98820](allocator, *(_QWORD *)&portNum, callout, context, shouldFreeInfo);
}

mach_port_t CFMachPortGetPort(CFMachPortRef port)
{
  return MEMORY[0x1E0C98830](port);
}

void CFMachPortSetInvalidationCallBack(CFMachPortRef port, CFMachPortInvalidationCallBack callout)
{
  MEMORY[0x1E0C98850](port, callout);
}

void CFNotificationCenterAddObserver(CFNotificationCenterRef center, const void *observer, CFNotificationCallback callBack, CFStringRef name, const void *object, CFNotificationSuspensionBehavior suspensionBehavior)
{
  MEMORY[0x1E0C988B0](center, observer, callBack, name, object, suspensionBehavior);
}

CFNotificationCenterRef CFNotificationCenterGetDarwinNotifyCenter(void)
{
  return (CFNotificationCenterRef)MEMORY[0x1E0C988B8]();
}

void CFNotificationCenterRemoveObserver(CFNotificationCenterRef center, const void *observer, CFNotificationName name, const void *object)
{
  MEMORY[0x1E0C98900](center, observer, name, object);
}

CFTypeID CFNullGetTypeID(void)
{
  return MEMORY[0x1E0C98908]();
}

CFNumberRef CFNumberCreate(CFAllocatorRef allocator, CFNumberType theType, const void *valuePtr)
{
  return (CFNumberRef)MEMORY[0x1E0C98928](allocator, theType, valuePtr);
}

CFIndex CFNumberGetByteSize(CFNumberRef number)
{
  return MEMORY[0x1E0C98990](number);
}

CFNumberType CFNumberGetType(CFNumberRef number)
{
  return MEMORY[0x1E0C989A8](number);
}

CFTypeID CFNumberGetTypeID(void)
{
  return MEMORY[0x1E0C989B8]();
}

Boolean CFNumberGetValue(CFNumberRef number, CFNumberType theType, void *valuePtr)
{
  return MEMORY[0x1E0C989C0](number, theType, valuePtr);
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

CFRunLoopRef CFRunLoopGetCurrent(void)
{
  return (CFRunLoopRef)MEMORY[0x1E0C98C30]();
}

CFRunLoopRef CFRunLoopGetMain(void)
{
  return (CFRunLoopRef)MEMORY[0x1E0C98C40]();
}

void CFRunLoopRemoveSource(CFRunLoopRef rl, CFRunLoopSourceRef source, CFRunLoopMode mode)
{
  MEMORY[0x1E0C98C90](rl, source, mode);
}

CFRunLoopRunResult CFRunLoopRunInMode(CFRunLoopMode mode, CFTimeInterval seconds, Boolean returnAfterSourceHandled)
{
  return MEMORY[0x1E0C98CB0](mode, returnAfterSourceHandled, seconds);
}

CFRunLoopSourceRef CFRunLoopSourceCreate(CFAllocatorRef allocator, CFIndex order, CFRunLoopSourceContext *context)
{
  return (CFRunLoopSourceRef)MEMORY[0x1E0C98CC8](allocator, order, context);
}

void CFRunLoopSourceGetContext(CFRunLoopSourceRef source, CFRunLoopSourceContext *context)
{
  MEMORY[0x1E0C98CD0](source, context);
}

void CFRunLoopSourceInvalidate(CFRunLoopSourceRef source)
{
  MEMORY[0x1E0C98CE0](source);
}

void CFRunLoopSourceSignal(CFRunLoopSourceRef source)
{
  MEMORY[0x1E0C98CF0](source);
}

void CFRunLoopWakeUp(CFRunLoopRef rl)
{
  MEMORY[0x1E0C98D68](rl);
}

void CFSetAddValue(CFMutableSetRef theSet, const void *value)
{
  MEMORY[0x1E0C98D70](theSet, value);
}

Boolean CFSetContainsValue(CFSetRef theSet, const void *value)
{
  return MEMORY[0x1E0C98D80](theSet, value);
}

CFMutableSetRef CFSetCreateMutable(CFAllocatorRef allocator, CFIndex capacity, const CFSetCallBacks *callBacks)
{
  return (CFMutableSetRef)MEMORY[0x1E0C98D98](allocator, capacity, callBacks);
}

CFIndex CFSetGetCount(CFSetRef theSet)
{
  return MEMORY[0x1E0C98DA8](theSet);
}

void CFSetRemoveAllValues(CFMutableSetRef theSet)
{
  MEMORY[0x1E0C98DD8](theSet);
}

void CFStringAppend(CFMutableStringRef theString, CFStringRef appendedString)
{
  MEMORY[0x1E0C98ED8](theString, appendedString);
}

CFMutableStringRef CFStringCreateMutable(CFAllocatorRef alloc, CFIndex maxLength)
{
  return (CFMutableStringRef)MEMORY[0x1E0C98F90](alloc, maxLength);
}

CFStringRef CFStringCreateWithCharacters(CFAllocatorRef alloc, const UniChar *chars, CFIndex numChars)
{
  return (CFStringRef)MEMORY[0x1E0C98FE8](alloc, chars, numChars);
}

CFStringRef CFStringCreateWithFormat(CFAllocatorRef alloc, CFDictionaryRef formatOptions, CFStringRef format, ...)
{
  return (CFStringRef)MEMORY[0x1E0C99018](alloc, formatOptions, format);
}

void CFStringGetCharacters(CFStringRef theString, CFRange range, UniChar *buffer)
{
  MEMORY[0x1E0C990C0](theString, range.location, range.length, buffer);
}

CFIndex CFStringGetLength(CFStringRef theString)
{
  return MEMORY[0x1E0C99100](theString);
}

CFTypeID CFStringGetTypeID(void)
{
  return MEMORY[0x1E0C99170]();
}

CFStringTokenizerRef CFStringTokenizerCreate(CFAllocatorRef alloc, CFStringRef string, CFRange range, CFOptionFlags options, CFLocaleRef locale)
{
  return (CFStringTokenizerRef)MEMORY[0x1E0C99220](alloc, string, range.location, range.length, options, locale);
}

CFRange CFStringTokenizerGetCurrentTokenRange(CFStringTokenizerRef tokenizer)
{
  CFIndex v1;
  CFIndex v2;
  CFRange result;

  v1 = MEMORY[0x1E0C99230](tokenizer);
  result.length = v2;
  result.location = v1;
  return result;
}

CFStringTokenizerTokenType CFStringTokenizerGoToTokenAtIndex(CFStringTokenizerRef tokenizer, CFIndex index)
{
  return MEMORY[0x1E0C99238](tokenizer, index);
}

CFURLRef CFURLCreateWithString(CFAllocatorRef allocator, CFStringRef URLString, CFURLRef baseURL)
{
  return (CFURLRef)MEMORY[0x1E0C99448](allocator, URLString, baseURL);
}

CFURLRef CFURLGetBaseURL(CFURLRef anURL)
{
  return (CFURLRef)MEMORY[0x1E0C99478](anURL);
}

CFStringRef CFURLGetString(CFURLRef anURL)
{
  return (CFStringRef)MEMORY[0x1E0C994A0](anURL);
}

CFTypeID CFURLGetTypeID(void)
{
  return MEMORY[0x1E0C994B8]();
}

CFUUIDRef CFUUIDCreateFromString(CFAllocatorRef alloc, CFStringRef uuidStr)
{
  return (CFUUIDRef)MEMORY[0x1E0C99520](alloc, uuidStr);
}

CFUUIDRef CFUUIDCreateFromUUIDBytes(CFAllocatorRef alloc, CFUUIDBytes bytes)
{
  return (CFUUIDRef)MEMORY[0x1E0C99530](alloc, *(_QWORD *)&bytes.byte0, *(_QWORD *)&bytes.byte8);
}

CFStringRef CFUUIDCreateString(CFAllocatorRef alloc, CFUUIDRef uuid)
{
  return (CFStringRef)MEMORY[0x1E0C99538](alloc, uuid);
}

CFTypeID CFUUIDGetTypeID(void)
{
  return MEMORY[0x1E0C99560]();
}

CFUUIDBytes CFUUIDGetUUIDBytes(CFUUIDRef uuid)
{
  uint64_t v1;
  uint64_t v2;
  CFUUIDBytes result;

  v1 = MEMORY[0x1E0C99568](uuid);
  result.byte8 = v2;
  result.byte9 = BYTE1(v2);
  result.byte10 = BYTE2(v2);
  result.byte11 = BYTE3(v2);
  result.byte12 = BYTE4(v2);
  result.byte13 = BYTE5(v2);
  result.byte14 = BYTE6(v2);
  result.byte15 = HIBYTE(v2);
  result.byte0 = v1;
  result.byte1 = BYTE1(v1);
  result.byte2 = BYTE2(v1);
  result.byte3 = BYTE3(v1);
  result.byte4 = BYTE4(v1);
  result.byte5 = BYTE5(v1);
  result.byte6 = BYTE6(v1);
  result.byte7 = HIBYTE(v1);
  return result;
}

CGColorRef CGColorCreate(CGColorSpaceRef space, const CGFloat *components)
{
  return (CGColorRef)MEMORY[0x1E0C9BC78](space, components);
}

CGColorSpaceRef CGColorGetColorSpace(CGColorRef color)
{
  return (CGColorSpaceRef)MEMORY[0x1E0C9BD00](color);
}

const CGFloat *__cdecl CGColorGetComponents(CGColorRef color)
{
  return (const CGFloat *)MEMORY[0x1E0C9BD08](color);
}

size_t CGColorGetNumberOfComponents(CGColorRef color)
{
  return MEMORY[0x1E0C9BD20](color);
}

CFTypeID CGColorGetTypeID(void)
{
  return MEMORY[0x1E0C9BD38]();
}

CGColorSpaceRef CGColorSpaceCreateDeviceCMYK(void)
{
  return (CGColorSpaceRef)MEMORY[0x1E0C9BDE0]();
}

CGColorSpaceRef CGColorSpaceCreateDeviceGray(void)
{
  return (CGColorSpaceRef)MEMORY[0x1E0C9BDE8]();
}

CGColorSpaceRef CGColorSpaceCreateDeviceRGB(void)
{
  return (CGColorSpaceRef)MEMORY[0x1E0C9BDF0]();
}

CGColorSpaceModel CGColorSpaceGetModel(CGColorSpaceRef space)
{
  return MEMORY[0x1E0C9BEC8](space);
}

size_t CGColorSpaceGetNumberOfComponents(CGColorSpaceRef space)
{
  return MEMORY[0x1E0C9BED8](space);
}

uint64_t CGColorSpaceGetProcessColorModel()
{
  return MEMORY[0x1E0C9BEE0]();
}

void CGPathAddCurveToPoint(CGMutablePathRef path, const CGAffineTransform *m, CGFloat cp1x, CGFloat cp1y, CGFloat cp2x, CGFloat cp2y, CGFloat x, CGFloat y)
{
  MEMORY[0x1E0C9D298](path, m, cp1x, cp1y, cp2x, cp2y, x, y);
}

void CGPathAddLineToPoint(CGMutablePathRef path, const CGAffineTransform *m, CGFloat x, CGFloat y)
{
  MEMORY[0x1E0C9D2A8](path, m, x, y);
}

void CGPathAddQuadCurveToPoint(CGMutablePathRef path, const CGAffineTransform *m, CGFloat cpx, CGFloat cpy, CGFloat x, CGFloat y)
{
  MEMORY[0x1E0C9D2C0](path, m, cpx, cpy, x, y);
}

void CGPathApply(CGPathRef path, void *info, CGPathApplierFunction function)
{
  MEMORY[0x1E0C9D2E8](path, info, function);
}

void CGPathApplyWithBlock(CGPathRef path, CGPathApplyBlock block)
{
  MEMORY[0x1E0C9D300](path, block);
}

void CGPathCloseSubpath(CGMutablePathRef path)
{
  MEMORY[0x1E0C9D310](path);
}

CGMutablePathRef CGPathCreateMutable(void)
{
  return (CGMutablePathRef)MEMORY[0x1E0C9D388]();
}

CFTypeID CGPathGetTypeID(void)
{
  return MEMORY[0x1E0C9D418]();
}

void CGPathMoveToPoint(CGMutablePathRef path, const CGAffineTransform *m, CGFloat x, CGFloat y)
{
  MEMORY[0x1E0C9D490](path, m, x, y);
}

void CGPathRelease(CGPathRef path)
{
  MEMORY[0x1E0C9D498](path);
}

BOOL CGRectContainsPoint(CGRect rect, CGPoint point)
{
  return MEMORY[0x1E0C9D550]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height, (__n128)point, *(__n128 *)&point.y);
}

BOOL CGRectEqualToRect(CGRect rect1, CGRect rect2)
{
  return MEMORY[0x1E0C9D570]((__n128)rect1.origin, *(__n128 *)&rect1.origin.y, (__n128)rect1.size, *(__n128 *)&rect1.size.height, (__n128)rect2.origin, *(__n128 *)&rect2.origin.y, (__n128)rect2.size, *(__n128 *)&rect2.size.height);
}

CGFloat CGRectGetHeight(CGRect rect)
{
  CGFloat result;

  MEMORY[0x1E0C9D580]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CGFloat CGRectGetMaxX(CGRect rect)
{
  CGFloat result;

  MEMORY[0x1E0C9D588]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CGFloat CGRectGetMaxY(CGRect rect)
{
  CGFloat result;

  MEMORY[0x1E0C9D5A0]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CGFloat CGRectGetMidX(CGRect rect)
{
  CGFloat result;

  MEMORY[0x1E0C9D5A8]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CGFloat CGRectGetMidY(CGRect rect)
{
  CGFloat result;

  MEMORY[0x1E0C9D5B0]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CGFloat CGRectGetMinX(CGRect rect)
{
  CGFloat result;

  MEMORY[0x1E0C9D5C0]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CGFloat CGRectGetMinY(CGRect rect)
{
  CGFloat result;

  MEMORY[0x1E0C9D5C8]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CGFloat CGRectGetWidth(CGRect rect)
{
  CGFloat result;

  MEMORY[0x1E0C9D5D0]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CGRect CGRectInset(CGRect rect, CGFloat dx, CGFloat dy)
{
  double v3;
  double v4;
  double v5;
  double v6;
  CGRect result;

  MEMORY[0x1E0C9D5E8]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height, dx, dy);
  result.size.height = v6;
  result.size.width = v5;
  result.origin.y = v4;
  result.origin.x = v3;
  return result;
}

BOOL CGRectIsEmpty(CGRect rect)
{
  return MEMORY[0x1E0C9D608]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
}

BOOL CGRectIsNull(CGRect rect)
{
  return MEMORY[0x1E0C9D618]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
}

CGRect CGRectStandardize(CGRect rect)
{
  double v1;
  double v2;
  double v3;
  double v4;
  CGRect result;

  MEMORY[0x1E0C9D638]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  result.size.height = v4;
  result.size.width = v3;
  result.origin.y = v2;
  result.origin.x = v1;
  return result;
}

CGRect CGRectUnion(CGRect r1, CGRect r2)
{
  double v2;
  double v3;
  double v4;
  double v5;
  CGRect result;

  MEMORY[0x1E0C9D640]((__n128)r1.origin, *(__n128 *)&r1.origin.y, (__n128)r1.size, *(__n128 *)&r1.size.height, (__n128)r2.origin, *(__n128 *)&r2.origin.y, (__n128)r2.size, *(__n128 *)&r2.size.height);
  result.size.height = v5;
  result.size.width = v4;
  result.origin.y = v3;
  result.origin.x = v2;
  return result;
}

CTFontDescriptorRef CTFontCopyFontDescriptor(CTFontRef font)
{
  return (CTFontDescriptorRef)MEMORY[0x1E0CA79B0](font);
}

CTFontRef CTFontCreateWithFontDescriptor(CTFontDescriptorRef descriptor, CGFloat size, const CGAffineTransform *matrix)
{
  return (CTFontRef)MEMORY[0x1E0CA7A70](descriptor, matrix, size);
}

CFDictionaryRef CTFontDescriptorCopyAttributes(CTFontDescriptorRef descriptor)
{
  return (CFDictionaryRef)MEMORY[0x1E0CA7AA8](descriptor);
}

CTFontDescriptorRef CTFontDescriptorCreateWithAttributes(CFDictionaryRef attributes)
{
  return (CTFontDescriptorRef)MEMORY[0x1E0CA7B00](attributes);
}

CGFloat CTFontGetSize(CTFontRef font)
{
  CGFloat result;

  MEMORY[0x1E0CA7C50](font);
  return result;
}

CFTypeID CTFontGetTypeID(void)
{
  return MEMORY[0x1E0CA7C78]();
}

Class NSClassFromString(NSString *aClassName)
{
  return (Class)MEMORY[0x1E0CB28A0](aClassName);
}

NSRange NSIntersectionRange(NSRange range1, NSRange range2)
{
  NSUInteger v2;
  NSUInteger v3;
  NSRange result;

  v2 = MEMORY[0x1E0CB2C58](range1.location, range1.length, range2.location, range2.length);
  result.length = v3;
  result.location = v2;
  return result;
}

void NSLog(NSString *format, ...)
{
  MEMORY[0x1E0CB2D88](format);
}

void *__cdecl NSMapGet(NSMapTable *table, const void *key)
{
  return (void *)MEMORY[0x1E0CB2DA0](table, key);
}

void NSMapInsert(NSMapTable *table, const void *key, const void *value)
{
  MEMORY[0x1E0CB2DA8](table, key, value);
}

void NSMapRemove(NSMapTable *table, const void *key)
{
  MEMORY[0x1E0CB2DC8](table, key);
}

uint64_t NSPopAutoreleasePool()
{
  return MEMORY[0x1E0CB3038]();
}

uint64_t NSPushAutoreleasePool()
{
  return MEMORY[0x1E0CB3120]();
}

NSRange NSRangeFromString(NSString *aString)
{
  NSUInteger v1;
  NSUInteger v2;
  NSRange result;

  v1 = MEMORY[0x1E0CB3128](aString);
  result.length = v2;
  result.location = v1;
  return result;
}

NSString *__cdecl NSStringFromPoint(NSPoint aPoint)
{
  return (NSString *)MEMORY[0x1E0CB3210]((__n128)aPoint, *(__n128 *)&aPoint.y);
}

NSString *__cdecl NSStringFromRect(NSRect aRect)
{
  return (NSString *)MEMORY[0x1E0CB3228]((__n128)aRect.origin, *(__n128 *)&aRect.origin.y, (__n128)aRect.size, *(__n128 *)&aRect.size.height);
}

NSString *__cdecl NSStringFromSize(NSSize aSize)
{
  return (NSString *)MEMORY[0x1E0CB3240]((__n128)aSize, *(__n128 *)&aSize.height);
}

CFTypeRef SecTaskCopyValueForEntitlement(SecTaskRef task, CFStringRef entitlement, CFErrorRef *error)
{
  return (CFTypeRef)MEMORY[0x1E0CD65F0](task, entitlement, error);
}

SecTaskRef SecTaskCreateWithAuditToken(CFAllocatorRef allocator, audit_token_t *token)
{
  return (SecTaskRef)MEMORY[0x1E0CD6620](allocator, token);
}

uint64_t UIAccessibilityInstallSafeCategory()
{
  return MEMORY[0x1E0DDD448]();
}

uint64_t _AXSApplicationAccessibilityEnabled()
{
  return MEMORY[0x1E0DDD550]();
}

uint64_t _AXSAssistiveTouchScannerEnabled()
{
  return MEMORY[0x1E0DDD588]();
}

uint64_t _AXSAutomationEnabled()
{
  return MEMORY[0x1E0DDD5E8]();
}

uint64_t _AXSAutomationLocalizedStringLookupInfoSetEnabled()
{
  return MEMORY[0x1E0DDD610]();
}

uint64_t _AXSClarityBoardEnabled()
{
  return MEMORY[0x1E0DDD670]();
}

uint64_t _AXSDwellControlEnabled()
{
  return MEMORY[0x1E0DDD6E8]();
}

uint64_t _AXSHoverTextEnabled()
{
  return MEMORY[0x1E0DDD878]();
}

uint64_t _AXSInUnitTestMode()
{
  return MEMORY[0x1E0DDD980]();
}

uint64_t _AXSMossdeepEnabled()
{
  return MEMORY[0x1E0DDDA68]();
}

uint64_t _AXSSetAuditInspectionModeEnabled()
{
  return MEMORY[0x1E0DDDBC0]();
}

uint64_t _AXSSetAutomationEnabled()
{
  return MEMORY[0x1E0DDDBC8]();
}

uint64_t _AXSWatchControlEnabled()
{
  return MEMORY[0x1E0DDDEC0]();
}

void *__cdecl _Block_copy(const void *aBlock)
{
  return (void *)MEMORY[0x1E0C80928](aBlock);
}

void _Block_object_dispose(const void *a1, const int a2)
{
  MEMORY[0x1E0C80948](a1, *(_QWORD *)&a2);
}

uint64_t _CFAttributedStringCreateWithRuns()
{
  return MEMORY[0x1E0C99F10]();
}

uint64_t _CFAttributedStringGetNumberOfRuns()
{
  return MEMORY[0x1E0C99F20]();
}

uint64_t _CFAttributedStringGetRuns()
{
  return MEMORY[0x1E0C99F28]();
}

uint64_t _CFMZEnabled()
{
  return MEMORY[0x1E0C9A260]();
}

uint64_t _CFRuntimeCreateInstance()
{
  return MEMORY[0x1E0C9A498]();
}

uint64_t _CFRuntimeRegisterClass()
{
  return MEMORY[0x1E0C9A4B0]();
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
  MEMORY[0x1E0C80A20](exception_object);
}

void __assert_rtn(const char *a1, const char *a2, int a3, const char *a4)
{
  MEMORY[0x1E0C80A58](a1, a2, *(_QWORD *)&a3, a4);
}

uint64_t __memcpy_chk()
{
  return MEMORY[0x1E0C80B68]();
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

void _os_signpost_emit_with_name_impl(void *dso, os_log_t log, os_signpost_type_t type, os_signpost_id_t spid, const char *name, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x1E0C810D0](dso, log, type, spid, name, format, buf, *(_QWORD *)&size);
}

uint64_t _sl_dlopen()
{
  return MEMORY[0x1E0DA88F0]();
}

void abort(void)
{
  MEMORY[0x1E0C813A8]();
}

uint64_t bootstrap_check_in2()
{
  return MEMORY[0x1E0C81700]();
}

kern_return_t bootstrap_look_up(mach_port_t bp, const name_t service_name, mach_port_t *sp)
{
  return MEMORY[0x1E0C81708](*(_QWORD *)&bp, service_name, sp);
}

uint64_t bootstrap_look_up2()
{
  return MEMORY[0x1E0C81710]();
}

uint64_t bootstrap_register2()
{
  return MEMORY[0x1E0C81728]();
}

const char *__cdecl bootstrap_strerror(kern_return_t r)
{
  return (const char *)MEMORY[0x1E0C81730](*(_QWORD *)&r);
}

void bzero(void *a1, size_t a2)
{
  MEMORY[0x1E0C81758](a1, a2);
}

void dispatch_after(dispatch_time_t when, dispatch_queue_t queue, dispatch_block_t block)
{
  MEMORY[0x1E0C82BC8](when, queue, block);
}

void dispatch_async(dispatch_queue_t queue, dispatch_block_t block)
{
  MEMORY[0x1E0C82C00](queue, block);
}

dispatch_queue_global_t dispatch_get_global_queue(intptr_t identifier, uintptr_t flags)
{
  return (dispatch_queue_global_t)MEMORY[0x1E0C82D00](identifier, flags);
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
  MEMORY[0x1E0C82E08](predicate, block);
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

void dispatch_resume(dispatch_object_t object)
{
  MEMORY[0x1E0C82EA0](object);
}

dispatch_semaphore_t dispatch_semaphore_create(intptr_t value)
{
  return (dispatch_semaphore_t)MEMORY[0x1E0C82EB8](value);
}

intptr_t dispatch_semaphore_signal(dispatch_semaphore_t dsema)
{
  return MEMORY[0x1E0C82EC8](dsema);
}

intptr_t dispatch_semaphore_wait(dispatch_semaphore_t dsema, dispatch_time_t timeout)
{
  return MEMORY[0x1E0C82ED8](dsema, timeout);
}

void dispatch_source_cancel(dispatch_source_t source)
{
  MEMORY[0x1E0C82F10](source);
}

dispatch_source_t dispatch_source_create(dispatch_source_type_t type, uintptr_t handle, uintptr_t mask, dispatch_queue_t queue)
{
  return (dispatch_source_t)MEMORY[0x1E0C82F20](type, handle, mask, queue);
}

void dispatch_source_set_event_handler(dispatch_source_t source, dispatch_block_t handler)
{
  MEMORY[0x1E0C82F58](source, handler);
}

void dispatch_source_set_timer(dispatch_source_t source, dispatch_time_t start, uint64_t interval, uint64_t leeway)
{
  MEMORY[0x1E0C82F78](source, start, interval, leeway);
}

void dispatch_sync(dispatch_queue_t queue, dispatch_block_t block)
{
  MEMORY[0x1E0C82F90](queue, block);
}

dispatch_time_t dispatch_time(dispatch_time_t when, int64_t delta)
{
  return MEMORY[0x1E0C82FB8](when, delta);
}

char *dlerror(void)
{
  return (char *)MEMORY[0x1E0C83038]();
}

void *__cdecl dlsym(void *__handle, const char *__symbol)
{
  return (void *)MEMORY[0x1E0C83050](__handle, __symbol);
}

int fprintf(FILE *a1, const char *a2, ...)
{
  return MEMORY[0x1E0C83478](a1, a2);
}

void free(void *a1)
{
  MEMORY[0x1E0C834A8](a1);
}

gid_t getegid(void)
{
  return MEMORY[0x1E0C83658]();
}

uid_t geteuid(void)
{
  return MEMORY[0x1E0C83668]();
}

pid_t getpid(void)
{
  return MEMORY[0x1E0C83760]();
}

mach_msg_return_t mach_msg(mach_msg_header_t *msg, mach_msg_option_t option, mach_msg_size_t send_size, mach_msg_size_t rcv_size, mach_port_name_t rcv_name, mach_msg_timeout_t timeout, mach_port_name_t notify)
{
  return MEMORY[0x1E0C83CB0](msg, *(_QWORD *)&option, *(_QWORD *)&send_size, *(_QWORD *)&rcv_size, *(_QWORD *)&rcv_name, *(_QWORD *)&timeout, *(_QWORD *)&notify);
}

void mach_msg_destroy(mach_msg_header_t *a1)
{
  MEMORY[0x1E0C83CC0](a1);
}

kern_return_t mach_port_allocate(ipc_space_t task, mach_port_right_t right, mach_port_name_t *name)
{
  return MEMORY[0x1E0C83CE0](*(_QWORD *)&task, *(_QWORD *)&right, name);
}

kern_return_t mach_port_deallocate(ipc_space_t task, mach_port_name_t name)
{
  return MEMORY[0x1E0C83CF8](*(_QWORD *)&task, *(_QWORD *)&name);
}

kern_return_t mach_port_insert_right(ipc_space_t task, mach_port_name_t name, mach_port_t poly, mach_msg_type_name_t polyPoly)
{
  return MEMORY[0x1E0C83D48](*(_QWORD *)&task, *(_QWORD *)&name, *(_QWORD *)&poly, *(_QWORD *)&polyPoly);
}

kern_return_t mach_port_mod_refs(ipc_space_t task, mach_port_name_t name, mach_port_right_t right, mach_port_delta_t delta)
{
  return MEMORY[0x1E0C83D58](*(_QWORD *)&task, *(_QWORD *)&name, *(_QWORD *)&right, *(_QWORD *)&delta);
}

kern_return_t mach_port_request_notification(ipc_space_t task, mach_port_name_t name, mach_msg_id_t msgid, mach_port_mscount_t sync, mach_port_t notify, mach_msg_type_name_t notifyPoly, mach_port_t *previous)
{
  return MEMORY[0x1E0C83D70](*(_QWORD *)&task, *(_QWORD *)&name, *(_QWORD *)&msgid, *(_QWORD *)&sync, *(_QWORD *)&notify, *(_QWORD *)&notifyPoly, previous);
}

kern_return_t mach_port_set_attributes(ipc_space_t task, mach_port_name_t name, mach_port_flavor_t flavor, mach_port_info_t port_info, mach_msg_type_number_t port_infoCnt)
{
  return MEMORY[0x1E0C83D78](*(_QWORD *)&task, *(_QWORD *)&name, *(_QWORD *)&flavor, port_info, *(_QWORD *)&port_infoCnt);
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

void *__cdecl memmove(void *__dst, const void *__src, size_t __len)
{
  return (void *)MEMORY[0x1E0C84098](__dst, __src, __len);
}

void mig_dealloc_reply_port(mach_port_t reply_port)
{
  MEMORY[0x1E0C840E8](*(_QWORD *)&reply_port);
}

mach_port_t mig_get_reply_port(void)
{
  return MEMORY[0x1E0C84100]();
}

void mig_put_reply_port(mach_port_t reply_port)
{
  MEMORY[0x1E0C84110](*(_QWORD *)&reply_port);
}

void *__cdecl mmap(void *a1, size_t a2, int a3, int a4, int a5, off_t a6)
{
  return (void *)MEMORY[0x1E0C841D8](a1, a2, *(_QWORD *)&a3, *(_QWORD *)&a4, *(_QWORD *)&a5, a6);
}

int munmap(void *a1, size_t a2)
{
  return MEMORY[0x1E0C84220](a1, a2);
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

void objc_autoreleasePoolPop(void *context)
{
  MEMORY[0x1E0DE7BD8](context);
}

void *objc_autoreleasePoolPush(void)
{
  return (void *)MEMORY[0x1E0DE7BE0]();
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

void objc_destroyWeak(id *location)
{
  MEMORY[0x1E0DE7C60](location);
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

id objc_getAssociatedObject(id object, const void *key)
{
  return (id)MEMORY[0x1E0DE7CA8](object, key);
}

Class objc_getClass(const char *name)
{
  return (Class)MEMORY[0x1E0DE7CB0](name);
}

id objc_loadWeakRetained(id *location)
{
  return (id)MEMORY[0x1E0DE7D08](location);
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

void objc_setAssociatedObject(id object, const void *key, id value, void *policy)
{
  MEMORY[0x1E0DE7F40](object, key, value, policy);
}

void objc_setProperty_nonatomic(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
  MEMORY[0x1E0DE7F98](self, _cmd, newValue, offset);
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

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x1E0C84780](oslog, type);
}

BOOL os_signpost_enabled(os_log_t log)
{
  return MEMORY[0x1E0C84920](log);
}

os_signpost_id_t os_signpost_id_make_with_pointer(os_log_t log, const void *ptr)
{
  return MEMORY[0x1E0C84930](log, ptr);
}

void os_unfair_lock_lock(os_unfair_lock_t lock)
{
  MEMORY[0x1E0C84998](lock);
}

void os_unfair_lock_unlock(os_unfair_lock_t lock)
{
  MEMORY[0x1E0C849B0](lock);
}

int proc_name(int pid, void *buffer, uint32_t buffersize)
{
  return MEMORY[0x1E0C84C20](*(_QWORD *)&pid, buffer, *(_QWORD *)&buffersize);
}

void *__cdecl pthread_getspecific(pthread_key_t a1)
{
  return (void *)MEMORY[0x1E0C84DC0](a1);
}

int pthread_key_create(pthread_key_t *a1, void (__cdecl *a2)(void *))
{
  return MEMORY[0x1E0C84DE0](a1, a2);
}

int pthread_mutex_lock(pthread_mutex_t *a1)
{
  return MEMORY[0x1E0C84E28](a1);
}

int pthread_mutex_unlock(pthread_mutex_t *a1)
{
  return MEMORY[0x1E0C84E38](a1);
}

int pthread_setspecific(pthread_key_t a1, const void *a2)
{
  return MEMORY[0x1E0C84F18](a1, a2);
}

int strcmp(const char *__s1, const char *__s2)
{
  return MEMORY[0x1E0C85520](__s1, __s2);
}

char *__cdecl strncpy(char *__dst, const char *__src, size_t __n)
{
  return (char *)MEMORY[0x1E0C855B0](__dst, __src, __n);
}

kern_return_t task_get_special_port(task_inspect_t task, int which_port, mach_port_t *special_port)
{
  return MEMORY[0x1E0C85828](*(_QWORD *)&task, *(_QWORD *)&which_port, special_port);
}

kern_return_t vm_copy(vm_map_t target_task, vm_address_t source_address, vm_size_t size, vm_address_t dest_address)
{
  return MEMORY[0x1E0C85A90](*(_QWORD *)&target_task, source_address, size, dest_address);
}

BOOLean_t voucher_mach_msg_set(mach_msg_header_t *msg)
{
  return MEMORY[0x1E0C85B60](msg);
}

