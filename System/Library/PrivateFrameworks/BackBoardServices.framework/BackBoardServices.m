id getCAFenceHandleClass()
{
  void *v0;
  id v1;
  _QWORD v3[5];
  uint64_t v4;
  uint64_t *v5;
  uint64_t v6;
  uint64_t v7;

  v4 = 0;
  v5 = &v4;
  v6 = 0x2050000000;
  v0 = (void *)getCAFenceHandleClass_softClass;
  v7 = getCAFenceHandleClass_softClass;
  if (!getCAFenceHandleClass_softClass)
  {
    v3[0] = MEMORY[0x1E0C809B0];
    v3[1] = 3221225472;
    v3[2] = __getCAFenceHandleClass_block_invoke;
    v3[3] = &unk_1E1EA0D38;
    v3[4] = &v4;
    __getCAFenceHandleClass_block_invoke((uint64_t)v3);
    v0 = (void *)v5[3];
  }
  v1 = v0;
  _Block_object_dispose(&v4, 8);
  return v1;
}

void sub_18A0F1E0C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

id BKLogEventDeliveryMatching()
{
  if (BKLogEventDeliveryMatching_onceToken != -1)
    dispatch_once(&BKLogEventDeliveryMatching_onceToken, &__block_literal_global_9);
  return (id)BKLogEventDeliveryMatching___logObj;
}

id BKLogEventDeliveryBuffering()
{
  if (BKLogEventDeliveryBuffering_onceToken != -1)
    dispatch_once(&BKLogEventDeliveryBuffering_onceToken, &__block_literal_global_7);
  return (id)BKLogEventDeliveryBuffering___logObj;
}

uint64_t BKSHIDEventContainsUpdates()
{
  uint64_t result;

  if (IOHIDEventGetType() != 11)
    return 0;
  result = IOHIDEventGetIntegerValue();
  if (result)
    return IOHIDEventGetIntegerValue() != 0;
  return result;
}

id BKLogTouchDeliveryObserver()
{
  if (BKLogTouchDeliveryObserver_onceToken != -1)
    dispatch_once(&BKLogTouchDeliveryObserver_onceToken, &__block_literal_global_21_5735);
  return (id)BKLogTouchDeliveryObserver___logObj;
}

uint64_t migHelperHash(unsigned int *a1)
{
  return *a1;
}

id BKLogTouchEvents()
{
  if (BKLogTouchEvents_onceToken != -1)
    dispatch_once(&BKLogTouchEvents_onceToken, &__block_literal_global_29);
  return (id)BKLogTouchEvents___logObj;
}

uint64_t migHelperGetPort(unsigned int *a1)
{
  return *a1;
}

id BKLogTouchDeliveryPolicy()
{
  if (BKLogTouchDeliveryPolicy_onceToken != -1)
    dispatch_once(&BKLogTouchDeliveryPolicy_onceToken, &__block_literal_global_27);
  return (id)BKLogTouchDeliveryPolicy___logObj;
}

uint64_t BKSDisplayServicesStart()
{
  uint64_t MainScreenInfo;
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  NSObject *v6;
  __int16 v7;
  int v8;
  int v9;
  uint64_t v10;
  uint8_t buf[4];
  void *v12;
  __int16 v13;
  const __CFString *v14;
  __int16 v15;
  int v16;
  __int16 v17;
  void *v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v10 = 0;
  v8 = 0;
  v9 = 1065353216;
  v7 = 0;
  MainScreenInfo = _BKSDisplayServicesGetMainScreenInfo((_DWORD *)&v10 + 1, &v10, &v9, &v8, (BOOL *)&v7 + 1, (BOOL *)&v7);
  if ((_DWORD)MainScreenInfo == -308)
  {
    MainScreenInfo = _BKSDisplayServicesGetMainScreenInfo((_DWORD *)&v10 + 1, &v10, &v9, &v8, (BOOL *)&v7 + 1, (BOOL *)&v7);
    if ((_DWORD)MainScreenInfo == -308)
    {
      BKLogCommon();
      v6 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_error_impl(&dword_18A0F0000, v6, OS_LOG_TYPE_ERROR, "Exiting because we are unable to communicate with backboardd.", buf, 2u);
      }

      exit(-1);
    }
  }
  if ((_DWORD)MainScreenInfo)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("backboardd isn't running -- or we couldn't talk to it -- result: %s (%X)"), mach_error_string(MainScreenInfo), MainScreenInfo);
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "Boolean BKSDisplayServicesStart(void)");
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138544130;
      v12 = v3;
      v13 = 2114;
      v14 = CFSTR("BKSDisplayServices.m");
      v15 = 1024;
      v16 = 113;
      v17 = 2114;
      v18 = v2;
      _os_log_error_impl(&dword_18A0F0000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "failure in %{public}@ (%{public}@:%i) : %{public}@", buf, 0x26u);

    }
    objc_msgSend(objc_retainAutorelease(v2), "UTF8String");
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x18A0F6310);
  }
  GSSetMainScreenInfo();
  if (!(HIBYTE(v7) | v7) && (*((float *)&v10 + 1) <= 0.0 || *(float *)&v10 <= 0.0))
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("GetMainScreenInfo width: %f height: %f"), *((float *)&v10 + 1), *(float *)&v10);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "Boolean BKSDisplayServicesStart(void)");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138544130;
      v12 = v5;
      v13 = 2114;
      v14 = CFSTR("BKSDisplayServices.m");
      v15 = 1024;
      v16 = 118;
      v17 = 2114;
      v18 = v4;
      _os_log_error_impl(&dword_18A0F0000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "failure in %{public}@ (%{public}@:%i) : %{public}@", buf, 0x26u);

    }
    objc_msgSend(objc_retainAutorelease(v4), "UTF8String");
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x18A0F63E4);
  }
  return 1;
}

uint64_t _BKSDisplayServicesGetMainScreenInfo(_DWORD *a1, _DWORD *a2, _DWORD *a3, _DWORD *a4, BOOL *a5, BOOL *a6)
{
  int v12;
  uint64_t result;
  __int16 v14;
  uint64_t v15;
  uint64_t v16;

  v15 = 0;
  v16 = 0;
  v14 = 0;
  v12 = _BKSServerPortHelper("com.apple.backboard.display.services", BKSDisplayServerPort, &BKSDisplayServerMachPort, (void (__cdecl *)(CFMachPortRef, void *))_InvalidateDisplayServicesPort);
  result = _BKSDisplayGetMainScreenInfo(v12, (_DWORD *)&v16 + 1, &v16, (_DWORD *)&v15 + 1, &v15, (_BYTE *)&v14 + 1, &v14);
  if (a1)
    *a1 = HIDWORD(v16);
  if (a2)
    *a2 = v16;
  if (a3)
    *a3 = HIDWORD(v15);
  if (a4)
    *a4 = v15;
  if (a5)
    *a5 = HIBYTE(v14) != 0;
  if (a6)
    *a6 = (_BYTE)v14 != 0;
  return result;
}

uint64_t _BKSDisplayGetMainScreenInfo(int a1, _DWORD *a2, _DWORD *a3, _DWORD *a4, _DWORD *a5, _BYTE *a6, _BYTE *a7)
{
  mach_port_name_t special_reply_port;
  uint64_t v15;
  uint64_t v16;
  BOOL v17;
  int v19;
  int v20;
  _BYTE msg[36];
  __int128 v22;
  __int128 v23;

  v22 = 0u;
  v23 = 0u;
  *(_DWORD *)&msg[4] = 0;
  *(_OWORD *)&msg[20] = 0u;
  special_reply_port = mig_get_special_reply_port();
  *(_DWORD *)&msg[8] = a1;
  *(_DWORD *)&msg[12] = special_reply_port;
  *(_DWORD *)msg = 5395;
  *(_QWORD *)&msg[16] = 0x5B917500000000;
  if (MEMORY[0x1E0C85B60])
  {
    voucher_mach_msg_set((mach_msg_header_t *)msg);
    special_reply_port = *(_DWORD *)&msg[12];
  }
  v15 = mach_msg((mach_msg_header_t *)msg, 3162115, 0x18u, 0x44u, special_reply_port, 0, 0);
  v16 = v15;
  if ((v15 - 268435458) > 0xE || ((1 << (v15 - 2)) & 0x4003) == 0)
  {
    if (!(_DWORD)v15)
    {
      if (*(_DWORD *)&msg[20] == 71)
      {
        v16 = 4294966988;
      }
      else if (*(_DWORD *)&msg[20] == 6001113)
      {
        if ((*(_DWORD *)msg & 0x80000000) == 0)
        {
          if (*(_DWORD *)&msg[4] == 60)
          {
            if (!*(_DWORD *)&msg[8])
            {
              v16 = *(unsigned int *)&msg[32];
              if (!*(_DWORD *)&msg[32])
              {
                v19 = DWORD1(v22);
                *a2 = v22;
                *a3 = v19;
                v20 = HIDWORD(v22);
                *a4 = DWORD2(v22);
                *a5 = v20;
                *a6 = v23;
                *a7 = BYTE4(v23);
                return v16;
              }
              goto LABEL_25;
            }
          }
          else if (*(_DWORD *)&msg[4] == 36)
          {
            if (*(_DWORD *)&msg[8])
              v17 = 1;
            else
              v17 = *(_DWORD *)&msg[32] == 0;
            if (v17)
              v16 = 4294966996;
            else
              v16 = *(unsigned int *)&msg[32];
            goto LABEL_25;
          }
        }
        v16 = 4294966996;
      }
      else
      {
        v16 = 4294966995;
      }
LABEL_25:
      mach_msg_destroy((mach_msg_header_t *)msg);
      return v16;
    }
    mig_dealloc_special_reply_port();
  }
  if ((v16 - 268435459) <= 1)
  {
    if ((*(_WORD *)msg & 0x1F00) == 0x1100)
      mach_port_deallocate(*MEMORY[0x1E0C83DA0], *(mach_port_name_t *)&msg[12]);
    goto LABEL_25;
  }
  return v16;
}

uint64_t BKSHIDServicesSetMinimumBrightnessLevelWithFadeDuration(float a1, float a2)
{
  mach_port_t v4;

  v4 = _BKSServerPortHelper("com.apple.backboard.hid.services", BKSHIDServerPort, &BKSHIDServerMachPort, (void (__cdecl *)(CFMachPortRef, void *))_InvalidateHIDServicesPort);
  return _BKSHIDSetMinimumBrightnessLevelWithFadeDuration(v4, a1, a2);
}

uint64_t BKSHIDEventDigitizerGetTouchLocus(void *a1, uint64_t a2)
{
  void *v2;
  uint64_t v3;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint8_t buf[4];
  void *v10;
  __int16 v11;
  const __CFString *v12;
  __int16 v13;
  int v14;
  __int16 v15;
  void *v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  if (!a1)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("pathCollectionEvent"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "BKSHIDTouchLocus BKSHIDEventDigitizerGetTouchLocus(IOHIDEventRef, IOHIDEventRef)");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138544130;
      v10 = v6;
      v11 = 2114;
      v12 = CFSTR("BKSHIDEvent.m");
      v13 = 1024;
      v14 = 665;
      v15 = 2114;
      v16 = v5;
      _os_log_error_impl(&dword_18A0F0000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "failure in %{public}@ (%{public}@:%i) : %{public}@", buf, 0x26u);

    }
    objc_msgSend(objc_retainAutorelease(v5), "UTF8String");
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x18A0F6980);
  }
  if (!a2)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("pathEvent"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "BKSHIDTouchLocus BKSHIDEventDigitizerGetTouchLocus(IOHIDEventRef, IOHIDEventRef)");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138544130;
      v10 = v8;
      v11 = 2114;
      v12 = CFSTR("BKSHIDEvent.m");
      v13 = 1024;
      v14 = 666;
      v15 = 2114;
      v16 = v7;
      _os_log_error_impl(&dword_18A0F0000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "failure in %{public}@ (%{public}@:%i) : %{public}@", buf, 0x26u);

    }
    objc_msgSend(objc_retainAutorelease(v7), "UTF8String");
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x18A0F6A54);
  }
  _BKSHIDEventGetSubEventInfoFromDigitierEventForPathEvent(a1, a2);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "locus");

  return v3;
}

uint64_t _BKSServerPortHelper(const char *a1, mach_port_name_t *a2, CFTypeRef *a3, void (__cdecl *a4)(CFMachPortRef, void *))
{
  char v8;
  uint64_t v9;
  mach_port_type_t ptype;

  pthread_mutex_lock(&BKSServerPortLock);
  ptype = 0;
  if (!mach_port_type(*MEMORY[0x1E0C83DA0], *a2, &ptype) && (ptype & 0x100000) == 0)
    goto LABEL_7;
  if (*a2)
    _lock_InvalidatePortHelper((uint64_t)a1, a2, a3);
  if (!bootstrap_look_up(*MEMORY[0x1E0C81720], a1, a2) && *a2 + 1 >= 2)
  {
    v8 = 0;
    *a3 = CFMachPortCreateWithPort((CFAllocatorRef)*MEMORY[0x1E0C9AE00], *a2, 0, 0, 0);
  }
  else
  {
LABEL_7:
    v8 = 1;
  }
  v9 = *a2;
  pthread_mutex_unlock(&BKSServerPortLock);
  if ((v8 & 1) == 0 && *a3)
    CFMachPortSetInvalidationCallBack((CFMachPortRef)*a3, a4);
  return v9;
}

void BKSHIDEventSetAttributes(uint64_t a1, void *a2)
{
  char v3;
  void *v4;
  void *v5;
  id v6;
  uint8_t buf[4];
  void *v8;
  __int16 v9;
  const __CFString *v10;
  __int16 v11;
  int v12;
  __int16 v13;
  void *v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v6 = a2;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v3 = 6;
LABEL_13:
    _BKSHIDEventSetAttributes(a1, v6, v3);

    return;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v3 = 7;
    goto LABEL_13;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v3 = 5;
    goto LABEL_13;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v3 = 2;
    goto LABEL_13;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v3 = 4;
    goto LABEL_13;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v3 = 1;
    goto LABEL_13;
  }
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("don't know what type to use for %@"), objc_opt_class());
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "void BKSHIDEventSetAttributes(IOHIDEventRef _Nonnull, BKSHIDEventBaseAttributes *__strong _Nonnull)");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138544130;
    v8 = v5;
    v9 = 2114;
    v10 = CFSTR("BKSHIDEvent.m");
    v11 = 1024;
    v12 = 493;
    v13 = 2114;
    v14 = v4;
    _os_log_error_impl(&dword_18A0F0000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "failure in %{public}@ (%{public}@:%i) : %{public}@", buf, 0x26u);

  }
  objc_msgSend(objc_retainAutorelease(v4), "UTF8String");
  _bs_set_crash_log_message();
  __break(0);
}

void _BKSHIDEventSetAttributes(uint64_t a1, void *a2, char a3)
{
  id v5;
  void *v6;
  id v7;
  size_t v8;
  uint64_t v9;
  char *v10;
  NSObject *v11;
  uint64_t v12;
  id v13;
  uint8_t buf[4];
  id v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v13 = 0;
  objc_msgSend(MEMORY[0x1E0D01838], "encodeObject:error:", v5, &v13);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v13;
  if (v6)
  {
    v8 = objc_msgSend(v6, "length");
    MEMORY[0x1E0C80A78]();
    v10 = (char *)&v12 - v9;
    *(uint64_t *)((char *)&v12 - v9) = 0;
    memcpy((char *)&v12 - v9 + 8, (const void *)objc_msgSend(objc_retainAutorelease(v6), "bytes"), v8);
    *v10 = a3;
    *((_DWORD *)v10 + 1) = v8;
    IOHIDEventSetAttributeData();
    _BKSHIDEventSetAttachment(a1, CFSTR("backboardd-attr-cache-16000025"));
  }
  else
  {
    BKLogEventDelivery();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543362;
      v15 = v7;
      _os_log_error_impl(&dword_18A0F0000, v11, OS_LOG_TYPE_ERROR, "could not encode attribute data:%{public}@", buf, 0xCu);
    }

  }
}

id _BKSHIDEventGetSubEventInfoFromDigitierEventForPathEvent(void *a1, uint64_t a2)
{
  id v2;
  uint64_t IntegerValue;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v2 = 0;
  v19 = *MEMORY[0x1E0C80C00];
  if (a1 && a2)
  {
    if (IOHIDEventGetType() != 11)
      return 0;
    IntegerValue = IOHIDEventGetIntegerValue();
    BKSHIDEventGetDigitizerAttributes(a1);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = v5;
    if (v5)
    {
      v16 = 0u;
      v17 = 0u;
      v14 = 0u;
      v15 = 0u;
      objc_msgSend(v5, "pathAttributes", 0);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
      if (v8)
      {
        v9 = v8;
        v10 = *(_QWORD *)v15;
        while (2)
        {
          for (i = 0; i != v9; ++i)
          {
            if (*(_QWORD *)v15 != v10)
              objc_enumerationMutation(v7);
            v12 = *(void **)(*((_QWORD *)&v14 + 1) + 8 * i);
            if (objc_msgSend(v12, "pathIndex") == IntegerValue)
            {
              v2 = v12;
              goto LABEL_16;
            }
          }
          v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
          if (v9)
            continue;
          break;
        }
      }
      v2 = 0;
LABEL_16:

    }
    else
    {
      v2 = 0;
    }

  }
  return v2;
}

_DWORD *BKSHIDEventGetDigitizerAttributes(void *a1)
{
  int Type;
  _DWORD *AttributeDataPtr;

  Type = IOHIDEventGetType();
  AttributeDataPtr = 0;
  if (Type == 11 && a1)
  {
    if (IOHIDEventGetAttributeDataLength() < 1)
      goto LABEL_8;
    AttributeDataPtr = (_DWORD *)IOHIDEventGetAttributeDataPtr();
    if (AttributeDataPtr)
    {
      if (AttributeDataPtr[1] && *(_BYTE *)AttributeDataPtr == 2)
      {
        BKSHIDEventGetBaseAttributes(a1);
        AttributeDataPtr = (_DWORD *)objc_claimAutoreleasedReturnValue();
        return AttributeDataPtr;
      }
LABEL_8:
      AttributeDataPtr = 0;
    }
  }
  return AttributeDataPtr;
}

id BKSHIDEventGetBaseAttributes(void *a1)
{
  uint64_t v2;
  void *v3;
  void *v4;
  id v5;
  unsigned __int8 *AttributeDataPtr;
  int v7;
  uint64_t v8;
  NSObject *v9;
  _DWORD v11[2];
  __int16 v12;
  uint64_t TypeString;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v2 = objc_opt_class();
  _BKSHIDEventGetAttachment((uint64_t)a1, CFSTR("backboardd-attr-cache-16000025"), v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (!v3)
  {
    if (!a1)
      goto LABEL_14;
    if (IOHIDEventGetAttributeDataLength() >= 1)
    {
      AttributeDataPtr = (unsigned __int8 *)IOHIDEventGetAttributeDataPtr();
      if (AttributeDataPtr)
      {
        if (*((_DWORD *)AttributeDataPtr + 1))
        {
          v7 = *AttributeDataPtr;
          if ((v7 - 1) < 7)
          {
            v8 = objc_opt_class();
            BKSHIDEventAttributeDataWithExpectedClass((uint64_t)a1, v8);
            v5 = (id)objc_claimAutoreleasedReturnValue();
            goto LABEL_3;
          }
          BKLogEventDelivery();
          v9 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
          {
            IOHIDEventGetType();
            v11[0] = 67109378;
            v11[1] = v7;
            v12 = 2082;
            TypeString = IOHIDEventGetTypeString();
            _os_log_error_impl(&dword_18A0F0000, v9, OS_LOG_TYPE_ERROR, "unsupported type for attribute decode:%d -- %{public}s event", (uint8_t *)v11, 0x12u);
          }

        }
      }
    }
    a1 = 0;
    goto LABEL_14;
  }
  v5 = v3;
LABEL_3:
  a1 = v5;
LABEL_14:

  return a1;
}

id _BKSHIDEventGetAttachment(uint64_t a1, void *a2, uint64_t a3)
{
  id v4;
  void *v5;
  id v6;
  NSObject *v7;
  id v9;
  int v10;
  id v11;
  __int16 v12;
  uint64_t v13;
  __int16 v14;
  id v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v4 = a2;
  v5 = (void *)_IOHIDEventCopyAttachment();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v6 = v5;
  }
  else
  {
    if (v5)
    {
      BKLogEventDelivery();
      v7 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      {
        v10 = 138543874;
        v11 = v4;
        v12 = 2114;
        v13 = a3;
        v14 = 2114;
        v15 = (id)objc_opt_class();
        v9 = v15;
        _os_log_error_impl(&dword_18A0F0000, v7, OS_LOG_TYPE_ERROR, "failed to get attachment for key: %{public}@ expected class %{public}@ but got class %{public}@ ", (uint8_t *)&v10, 0x20u);

      }
    }
    v6 = 0;
  }

  return v6;
}

id BKSHIDEventAttributeDataWithExpectedClass(uint64_t a1, uint64_t a2)
{
  unsigned __int8 *AttributeDataPtr;
  int v5;
  NSObject *v6;
  void *v7;
  id v8;
  NSObject *v10;
  id v11;
  uint8_t buf[4];
  _DWORD v13[7];

  *(_QWORD *)&v13[5] = *MEMORY[0x1E0C80C00];
  if (a1
    && IOHIDEventGetAttributeDataLength() >= 1
    && (AttributeDataPtr = (unsigned __int8 *)IOHIDEventGetAttributeDataPtr()) != 0
    && *((_DWORD *)AttributeDataPtr + 1))
  {
    v5 = *AttributeDataPtr;
    if ((v5 - 1) >= 7)
    {
      BKLogEventDelivery();
      v6 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      {
        IOHIDEventGetType();
        *(_DWORD *)buf = 67109378;
        v13[0] = v5;
        LOWORD(v13[1]) = 2082;
        *(_QWORD *)((char *)&v13[1] + 2) = IOHIDEventGetTypeString();
        _os_log_error_impl(&dword_18A0F0000, v6, OS_LOG_TYPE_ERROR, "unsupported type for attribute decode:%d -- %{public}s event", buf, 0x12u);
      }
      v7 = 0;
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99D50], "dataWithBytesNoCopy:length:freeWhenDone:", AttributeDataPtr + 8);
      v6 = objc_claimAutoreleasedReturnValue();
      v11 = 0;
      objc_msgSend(MEMORY[0x1E0D01838], "decodeObjectOfClass:fromData:error:", a2, v6, &v11);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = v11;
      if (v7)
      {
        _BKSHIDEventSetAttachment(a1, CFSTR("backboardd-attr-cache-16000025"));
      }
      else
      {
        BKLogEventDelivery();
        v10 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138543362;
          *(_QWORD *)v13 = v8;
          _os_log_error_impl(&dword_18A0F0000, v10, OS_LOG_TYPE_ERROR, "could not decode attributes:%{public}@", buf, 0xCu);
        }

      }
    }

  }
  else
  {
    v7 = 0;
  }
  return v7;
}

void _BKSHIDEventSetAttachment(uint64_t a1, void *a2)
{
  id v2;
  NSObject *v3;
  int v4;
  id v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  v2 = a2;
  if (!_IOHIDEventSetAttachment())
  {
    BKLogEventDelivery();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    {
      v4 = 138543362;
      v5 = v2;
      _os_log_error_impl(&dword_18A0F0000, v3, OS_LOG_TYPE_ERROR, "failed to set attachment with key: %{public}@", (uint8_t *)&v4, 0xCu);
    }

  }
}

id BKLogEventDelivery()
{
  if (BKLogEventDelivery_onceToken != -1)
    dispatch_once(&BKLogEventDelivery_onceToken, &__block_literal_global_5);
  return (id)BKLogEventDelivery___logObj;
}

id BKLogBacklight()
{
  if (BKLogBacklight_onceToken != -1)
    dispatch_once(&BKLogBacklight_onceToken, &__block_literal_global_15);
  return (id)BKLogBacklight___logObj;
}

float BKSDisplayServicesGetExternalDisplayScale(void *a1)
{
  id v1;
  void *v2;
  id v3;
  float v4;
  int v6;

  v1 = a1;
  if (v1)
  {
    objc_msgSend(getCADisplayClass(), "displays");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "firstObject");
    v3 = (id)objc_claimAutoreleasedReturnValue();

    if (v3 == v1)
    {
      v6 = 1065353216;
      _BKSDisplayServicesGetMainScreenInfo(0, 0, &v6, 0, 0, 0);
      v4 = *(float *)&v6;
    }
    else
    {
      v4 = _BKSGetExternalDisplayScale(v1);
    }
  }
  else
  {
    v4 = 0.0;
  }

  return v4;
}

id getCADisplayClass()
{
  void *v0;
  id v1;
  _QWORD v3[5];
  uint64_t v4;
  uint64_t *v5;
  uint64_t v6;
  uint64_t v7;

  v4 = 0;
  v5 = &v4;
  v6 = 0x2050000000;
  v0 = (void *)getCADisplayClass_softClass;
  v7 = getCADisplayClass_softClass;
  if (!getCADisplayClass_softClass)
  {
    v3[0] = MEMORY[0x1E0C809B0];
    v3[1] = 3221225472;
    v3[2] = __getCADisplayClass_block_invoke;
    v3[3] = &unk_1E1EA0D38;
    v3[4] = &v4;
    __getCADisplayClass_block_invoke((uint64_t)v3);
    v0 = (void *)v5[3];
  }
  v1 = v0;
  _Block_object_dispose(&v4, 8);
  return v1;
}

void sub_18A0F9168(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

double _BKSGetExternalDisplayScale(void *a1)
{
  id v1;
  void *v2;
  unint64_t v3;
  void *v4;
  void *v6;
  void *v7;
  uint8_t buf[4];
  void *v9;
  __int16 v10;
  const __CFString *v11;
  __int16 v12;
  int v13;
  __int16 v14;
  void *v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v1 = a1;
  if (!v1)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("display != ((void *)0)"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "CGFloat _BKSGetExternalDisplayScale(CADisplay *__strong _Nonnull)");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138544130;
      v9 = v7;
      v10 = 2114;
      v11 = CFSTR("BKSDisplayServices.m");
      v12 = 1024;
      v13 = 371;
      v14 = 2114;
      v15 = v6;
      _os_log_error_impl(&dword_18A0F0000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "failure in %{public}@ (%{public}@:%i) : %{public}@", buf, 0x26u);

    }
    objc_msgSend(objc_retainAutorelease(v6), "UTF8String");
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x18A0F92E8);
  }
  v2 = v1;
  v3 = objc_msgSend(v1, "pointScale");
  if ((objc_msgSend(v2, "tag") & 0xE0) != 0)
  {
    objc_msgSend(v2, "currentMode");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v3 = objc_msgSend(v4, "preferredScale");

  }
  return (double)v3;
}

id BKLogOrientationGlobal()
{
  if (BKLogOrientationGlobal_onceToken != -1)
    dispatch_once(&BKLogOrientationGlobal_onceToken, &__block_literal_global_4);
  return (id)BKLogOrientationGlobal___logObj;
}

__CFString *NSStringFromBKSHIDEventSource(uint64_t a1)
{
  if (a1 < 0xE)
    return off_1E1EA1A68[a1];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("<unknown:0x%X>"), a1);
  return (__CFString *)(id)objc_claimAutoreleasedReturnValue();
}

id BKLogUISensor()
{
  if (BKLogUISensor_onceToken != -1)
    dispatch_once(&BKLogUISensor_onceToken, &__block_literal_global_23);
  return (id)BKLogUISensor___logObj;
}

void BKSHIDServicesCancelTouchesOnMainDisplay()
{
  BKSHIDServicesCancelTouchesOnDisplay(0);
}

id BKSHIDEventGetConciseDescription(void *a1)
{
  int Type;
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  id v12;
  __int16 v13;
  unsigned int v14;
  void *v15;
  uint64_t v16;
  unint64_t v17;
  void *v18;
  uint64_t IntegerValue;
  id v20;
  void *v21;
  void *v22;
  uint64_t v23;
  id v24;
  id v25;
  void *v26;
  void *v27;
  uint64_t v29;
  uint64_t v30;
  void (*v31)(uint64_t, void *);
  void *v32;
  id v33;
  id v34;
  uint64_t *v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t *v38;
  uint64_t v39;
  uint64_t v40;
  _QWORD v41[5];

  Type = IOHIDEventGetType();
  switch(Type)
  {
    case 1:
      _BKSHIDEventGetConciseDescriptionVendorDefined();
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      return v3;
    case 2:
      _BKSHIDEventGetConciseDescriptionButton();
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      return v3;
    case 3:
      BKSHIDEventGetBaseAttributes(a1);
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      v5 = objc_msgSend(v4, "source");

      _BKSHIDEventGetConciseDescriptionKeyboard(a1, v5);
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      return v3;
    case 4:
      _BKSHIDEventGetConciseDescriptionTranslation();
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      return v3;
    case 5:
      _BKSHIDEventGetConciseDescriptionRotation();
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      return v3;
    case 6:
      _BKSHIDEventGetConciseDescriptionScroll();
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      return v3;
    case 7:
      _BKSHIDEventGetConciseDescriptionScale();
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      return v3;
    case 8:
    case 9:
    case 10:
    case 12:
    case 13:
    case 15:
    case 16:
      goto LABEL_5;
    case 11:
      v6 = (void *)MEMORY[0x1E0CB3940];
      v7 = objc_alloc_init(MEMORY[0x1E0D01750]);
      BKSHIDEventGetDigitizerAttributes(a1);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = v8;
      v10 = MEMORY[0x1E0C809B0];
      if (v8)
      {
        objc_msgSend(v8, "token");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v12 = (id)objc_msgSend(v7, "appendObject:withName:", v11, CFSTR("token"));

        v13 = objc_msgSend(v9, "options");
        if ((v13 & 0x200) != 0)
          objc_msgSend(v7, "appendString:withName:", CFSTR("more"), 0);
        if ((v13 & 0x400) != 0)
          objc_msgSend(v7, "appendString:withName:", CFSTR("abs"), 0);
        _BKSHIDEventAppendEventFlags((uint64_t)a1, v7);
        v14 = objc_msgSend(v9, "touchStreamIdentifier");
        if (v14)
        {
          NSStringFromBKSTouchStreamIdentifier(v14);
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v7, "appendString:withName:", v15, CFSTR("strm"));

        }
        if (objc_msgSend(v9, "systemGestureStateChange"))
          objc_msgSend(v7, "appendString:withName:", CFSTR("systemGestureStateChange"), 0);
        if (objc_msgSend(v9, "systemGesturesPossible"))
          objc_msgSend(v7, "appendString:withName:", CFSTR("sgp"), 0);
        v16 = objc_msgSend(v9, "activeModifiers");
        if (v16)
        {
          v41[0] = v10;
          v41[1] = 3221225472;
          v41[2] = ___BKSHIDEventConciseDescriptionDigitizer_block_invoke;
          v41[3] = &__block_descriptor_40_e43_v16__0___BSDescriptionStringAppendTarget__8l;
          v41[4] = v16;
          objc_msgSend(v7, "appendCustomFormatWithName:block:", CFSTR("modifiers"), v41);
        }
        v17 = objc_msgSend(v9, "sceneTouchBehavior");
        if (v17)
        {
          NSStringFromBKSSceneHostTouchBehavior(v17);
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v7, "appendString:withName:", v18, CFSTR("behavior"));

        }
      }
      IntegerValue = IOHIDEventGetIntegerValue();
      if (IntegerValue)
        v20 = (id)objc_msgSend(v7, "appendInteger:withName:", IntegerValue, CFSTR("gen"));
      IOHIDEventGetChildren();
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "pathAttributes");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      v23 = objc_msgSend(v22, "count");
      v37 = 0;
      v38 = &v37;
      v39 = 0x2020000000;
      v40 = 0;
      v29 = v10;
      v30 = 3221225472;
      v31 = ___BKSHIDEventConciseDescriptionDigitizer_block_invoke_2;
      v32 = &unk_1E1EA19F8;
      v24 = v7;
      v33 = v24;
      v35 = &v37;
      v36 = v23;
      v25 = v22;
      v34 = v25;
      objc_msgSend(v24, "appendCollection:withName:itemBlock:", v21, CFSTR("subevents"), &v29);
      if (!v38[3])
        _BKSHIDEventAppendEventFlags((uint64_t)a1, v24);
      objc_msgSend(v24, "description");
      v26 = (void *)objc_claimAutoreleasedReturnValue();

      _Block_object_dispose(&v37, 8);
      objc_msgSend(v6, "stringWithFormat:", CFSTR("Digitizer %@"), v26, v29, v30, v31, v32);
      v27 = (void *)objc_claimAutoreleasedReturnValue();

      return v27;
    case 14:
      _BKSHIDEventGetConciseDescriptionProximity(a1);
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      return v3;
    case 17:
      _BKSHIDEventGetConciseDescriptionPointer(a1);
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      return v3;
    default:
      if (Type == 39)
      {
        _BKSHIDEventGetConciseDescriptionGenericGesture();
        v3 = (void *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
LABEL_5:
        objc_msgSend(MEMORY[0x1E0CB37A0], "stringWithFormat:", CFSTR("%@"), IOHIDEventTypeGetName());
        v3 = (void *)objc_claimAutoreleasedReturnValue();
      }
      return v3;
  }
}

void sub_18A0F9EAC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, ...)
{
  va_list va;

  va_start(va, a10);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

id _BKSHIDEventGetConciseDescriptionProximity(void *a1)
{
  unsigned int IntegerValue;
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;

  IntegerValue = IOHIDEventGetIntegerValue();
  BKSHIDEventGetProximityAttributes(a1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)MEMORY[0x1E0CB3940];
  NSStringFromBKSHIDServicesProximityDetectionMode(objc_msgSend(v3, "proximityDetectionMode"));
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = (void *)v5;
  if (IntegerValue)
  {
    BKSNSStringFromIOHIDProximityDetectionMask(IntegerValue);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "stringWithFormat:", CFSTR("Proximity [%@]: (%@)"), v6, v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    objc_msgSend(v4, "stringWithFormat:", CFSTR("Proximity [%@]: <none>"), v5);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v8;
}

_DWORD *BKSHIDEventGetProximityAttributes(void *a1)
{
  int Type;
  _DWORD *AttributeDataPtr;

  Type = IOHIDEventGetType();
  AttributeDataPtr = 0;
  if (Type == 14 && a1)
  {
    if (IOHIDEventGetAttributeDataLength() < 1)
      goto LABEL_8;
    AttributeDataPtr = (_DWORD *)IOHIDEventGetAttributeDataPtr();
    if (AttributeDataPtr)
    {
      if (AttributeDataPtr[1] && *(_BYTE *)AttributeDataPtr == 7)
      {
        BKSHIDEventGetBaseAttributes(a1);
        AttributeDataPtr = (_DWORD *)objc_claimAutoreleasedReturnValue();
        return AttributeDataPtr;
      }
LABEL_8:
      AttributeDataPtr = 0;
    }
  }
  return AttributeDataPtr;
}

__CFString *NSStringFromBKSHIDServicesProximityDetectionMode(uint64_t a1)
{
  __CFString *v1;

  if (a1 < 0x15 && ((0x10307Fu >> a1) & 1) != 0)
  {
    v1 = off_1E1EA1B30[a1];
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("<unknown:%d>"), a1);
    v1 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  return v1;
}

__CFString *BKSNSStringFromIOHIDProximityDetectionMask(unsigned int a1)
{
  void *v2;
  uint64_t v4;

  if (!a1)
    return CFSTR("<none>");
  objc_msgSend(MEMORY[0x1E0CB37A0], "string");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = 0;
  _BKAppendStringForBitmaskDescription(v2, CFSTR("LargeBodyContact"), a1, 1, &v4);
  _BKAppendStringForBitmaskDescription(v2, CFSTR("LargeBodyFarField"), a1, 2, &v4);
  _BKAppendStringForBitmaskDescription(v2, CFSTR("IrregularObjects"), a1, 4, &v4);
  _BKAppendStringForBitmaskDescription(v2, CFSTR("EdgeStraddling"), a1, 8, &v4);
  _BKAppendStringForBitmaskDescription(v2, CFSTR("FlatFingerClasp"), a1, 16, &v4);
  _BKAppendStringForBitmaskDescription(v2, CFSTR("FingerTouch"), a1, 32, &v4);
  _BKAppendStringForBitmaskDescription(v2, CFSTR("Receiver"), a1, 64, &v4);
  _BKAppendStringForBitmaskDescription(v2, CFSTR("SmallObjectsHovering"), a1, 128, &v4);
  _BKAppendStringForBitmaskDescription(v2, CFSTR("ReceiverCrude"), a1, 256, &v4);
  _BKAppendStringForBitmaskDescription(v2, CFSTR("ReceiverMonitoring"), a1, 512, &v4);
  _BKAppendStringForBitmaskDescription(v2, CFSTR("ReceiverCrudeMonitoring"), a1, 1024, &v4);
  return (__CFString *)v2;
}

void _BKAppendStringForBitmaskDescription(void *a1, void *a2, uint64_t a3, uint64_t a4, uint64_t *a5)
{
  id v9;
  id v10;

  v10 = a1;
  v9 = a2;
  if ((a4 & a3) != 0)
  {
    if (*a5 >= 1)
      objc_msgSend(v10, "appendString:", CFSTR("|"));
    objc_msgSend(v10, "appendString:", v9);
    ++*a5;
  }

}

id BKLogMousePointer()
{
  if (BKLogMousePointer_onceToken != -1)
    dispatch_once(&BKLogMousePointer_onceToken, &__block_literal_global_31);
  return (id)BKLogMousePointer___logObj;
}

void sub_18A0FA91C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
  id *v16;

  objc_destroyWeak(v16);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

uint64_t BKSDisplayServicesGetMainScreenInfo(_DWORD *a1, _DWORD *a2, _DWORD *a3, _DWORD *a4)
{
  return _BKSDisplayServicesGetMainScreenInfo(a1, a2, a3, a4, 0, 0);
}

uint64_t BKSHIDServicesDeviceHasHighFrequencyDigitizer()
{
  if (BKSHIDServicesDeviceHasHighFrequencyDigitizer_onceToken != -1)
    dispatch_once(&BKSHIDServicesDeviceHasHighFrequencyDigitizer_onceToken, &__block_literal_global_59);
  return BKSHIDServicesDeviceHasHighFrequencyDigitizer_hasHighFrequencyDigitizer;
}

__CFString *NSStringFromBKSSceneHostTouchBehavior(unint64_t a1)
{
  if (a1 < 3)
    return off_1E1EA18E8[a1];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("<unknown:%d>"), a1);
  return (__CFString *)(id)objc_claimAutoreleasedReturnValue();
}

__CFString *NSStringFromBKSHIDEventHardwareType(unint64_t a1)
{
  if (a1 < 0xB)
    return off_1E1EA16C8[a1];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("<unknown:0x%lX>"), a1);
  return (__CFString *)(id)objc_claimAutoreleasedReturnValue();
}

uint64_t makeCalloutContextKey()
{
  return pthread_key_create((pthread_key_t *)&__BKMIGServerCalloutContextKey, 0);
}

uint64_t _BKSHIDSetMinimumBrightnessLevelWithFadeDuration(mach_port_t a1, float a2, float a3)
{
  uint64_t v3;
  mach_msg_header_t msg;
  uint64_t v6;
  float v7;
  float v8;

  v6 = *MEMORY[0x1E0C804E8];
  v7 = a2;
  v8 = a3;
  *(_QWORD *)&msg.msgh_bits = 19;
  msg.msgh_voucher_port = 0;
  msg.msgh_id = 6000004;
  msg.msgh_remote_port = a1;
  msg.msgh_local_port = 0;
  if (MEMORY[0x1E0C85B60])
    voucher_mach_msg_set(&msg);
  v3 = mach_msg(&msg, 1, 0x28u, 0, 0, 0, 0);
  if ((v3 - 268435459) <= 1)
  {
    if ((msg.msgh_bits & 0x1F00) == 0x1100)
      mach_port_deallocate(*MEMORY[0x1E0C83DA0], msg.msgh_local_port);
    mach_msg_destroy(&msg);
  }
  return v3;
}

id BKLogDisplay()
{
  if (BKLogDisplay_onceToken != -1)
    dispatch_once(&BKLogDisplay_onceToken, &__block_literal_global_17);
  return (id)BKLogDisplay___logObj;
}

void ___getHIDEventSystemClient_block_invoke()
{
  void *v0;
  uint64_t v1;
  void *v2;
  int v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  void *v7;
  _QWORD v8[3];
  _QWORD v9[4];

  v9[3] = *MEMORY[0x1E0C80C00];
  if (!_getHIDEventSystemClient___hidEventSystemClientRef)
  {
    objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
    v0 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v0, "bundleIdentifier");
    v1 = objc_claimAutoreleasedReturnValue();
    if (!v1)
      __BKSHIDEvent__BUNDLE_IDENTIFIER_FOR_CURRENT_PROCESS_IS_NIL__(v0);
    v2 = (void *)v1;
    if (BKSHIDServicesDeviceHasHighFrequencyDigitizer_onceToken != -1)
      dispatch_once(&BKSHIDServicesDeviceHasHighFrequencyDigitizer_onceToken, &__block_literal_global_59);
    v3 = BKSHIDServicesDeviceHasHighFrequencyDigitizer_hasHighFrequencyDigitizer;
    v9[0] = v2;
    v8[0] = CFSTR("bundleID");
    v8[1] = CFSTR("pid");
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", getpid());
    v4 = objc_claimAutoreleasedReturnValue();
    v5 = (void *)v4;
    v8[2] = CFSTR("HighFrequency");
    v6 = MEMORY[0x1E0C9AAB0];
    if (!v3)
      v6 = MEMORY[0x1E0C9AAA0];
    v9[1] = v4;
    v9[2] = v6;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v9, v8, 3);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    _getHIDEventSystemClient___hidEventSystemClientRef = IOHIDEventSystemClientCreateWithType();
  }
}

uint64_t BKSHIDDigitizerEventIsFirstTouchDown()
{
  uint64_t result;
  const __CFArray *Children;
  const __CFArray *v2;
  CFIndex Count;
  CFIndex v4;
  CFIndex v5;
  char IntegerValue;
  uint64_t v7;
  _BOOL4 v8;
  int v9;
  BOOL v10;

  if ((IOHIDEventGetIntegerValue() & 2) == 0)
    return 0;
  result = IOHIDEventGetIntegerValue();
  if (result)
  {
    Children = (const __CFArray *)IOHIDEventGetChildren();
    if (!Children)
      __assert_rtn("BKSHIDDigitizerEventIsFirstTouchDown", "BKSHIDEvent.m", 820, "pathEvents");
    v2 = Children;
    Count = CFArrayGetCount(Children);
    if (Count >= 1)
    {
      v4 = Count;
      v5 = 0;
      while (1)
      {
        CFArrayGetValueAtIndex(v2, v5);
        if (IOHIDEventGetType() == 11)
        {
          IntegerValue = IOHIDEventGetIntegerValue();
          v7 = IOHIDEventGetIntegerValue();
          v8 = IOHIDEventGetIntegerValue() == 0;
          if (v7)
            v8 = 1;
          v9 = v8 | ((unint64_t)(IntegerValue & 2) >> 1);
          v10 = (IntegerValue & 2) == 0 || v7 == 0;
          if (v9 == 1 && v10)
            break;
        }
        if (v4 == ++v5)
          return 1;
      }
      return 0;
    }
    return 1;
  }
  return result;
}

uint64_t _BKSHIDSetAccelerometerClientEventsEnabled(int a1, int a2, mach_msg_timeout_t timeout, double a4, float a5, float a6, float a7)
{
  uint64_t v8;
  _BYTE msg[36];
  int v11;
  uint64_t v12;
  double v13;
  float v14;
  float v15;
  float v16;

  memset(&msg[4], 0, 32);
  *(_DWORD *)&msg[28] = a2;
  v11 = 1310720;
  v12 = *MEMORY[0x1E0C804E8];
  v13 = a4;
  v14 = a5;
  v15 = a6;
  v16 = a7;
  *(_DWORD *)msg = -2147483629;
  *(_DWORD *)&msg[8] = a1;
  *(_QWORD *)&msg[20] = 0x1005B8DB3;
  if (MEMORY[0x1E0C85B60])
    voucher_mach_msg_set((mach_msg_header_t *)msg);
  v8 = mach_msg((mach_msg_header_t *)msg, 17, 0x44u, 0, 0, timeout, 0);
  if ((v8 - 268435459) <= 1)
  {
    if ((*(_WORD *)msg & 0x1F00) == 0x1100)
      mach_port_deallocate(*MEMORY[0x1E0C83DA0], *(mach_port_name_t *)&msg[12]);
    mach_msg_destroy((mach_msg_header_t *)msg);
  }
  return v8;
}

CFRunLoopSourceRef BKCreateMIGServerSourceWithContext(uint64_t a1, int a2, CFIndex a3, uint64_t a4)
{
  _QWORD *v8;
  CFRunLoopSourceRef v9;
  CFRunLoopSourceContext context;

  pthread_once(&__BKMIGServerCalloutContextKeyOnce, (void (*)(void))makeCalloutContextKey);
  v8 = malloc_type_malloc(0x18uLL, 0x10A0040FC6C5850uLL);
  *(_DWORD *)v8 = a2;
  v8[1] = a1;
  v8[2] = a4;
  context.version = 1;
  context.info = v8;
  context.retain = 0;
  context.release = (void (__cdecl *)(const void *))MEMORY[0x1E0C834A8];
  context.copyDescription = (CFStringRef (__cdecl *)(const void *))migHelperCopyDescription;
  context.equal = (Boolean (__cdecl *)(const void *, const void *))migHelperEqual;
  context.hash = (CFHashCode (__cdecl *)(const void *))migHelperHash;
  context.schedule = (void (__cdecl *)(void *, CFRunLoopRef, CFRunLoopMode))migHelperGetPort;
  context.cancel = (void (__cdecl *)(void *, CFRunLoopRef, CFRunLoopMode))migHelperRecievePortCallout;
  v9 = CFRunLoopSourceCreate(0, a3, &context);
  if (!v9)
    free(v8);
  return v9;
}

uint64_t BKSHIDEventRegisterEventCallbackOnRunLoop()
{
  if (_getHIDEventSystemClient_onceToken != -1)
    dispatch_once(&_getHIDEventSystemClient_onceToken, &__block_literal_global_281);
  CFRunLoopGetCurrent();
  IOHIDEventSystemClientScheduleWithRunLoop();
  return IOHIDEventSystemClientRegisterEventCallback();
}

void BKSHIDServicesSetHitTestRegionsForDisplay(void *a1, void *a2)
{
  id v3;
  __CFString *v4;
  _BOOL4 v5;
  uint64_t v6;
  void *v7;
  NSObject *v8;
  const char *v9;
  NSObject *v10;
  uint32_t v11;
  mach_port_t v12;
  id v13;
  int v14;
  int v15;
  int v16;
  id v17;
  char buffer[1024];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v3 = a1;
  v4 = a2;
  bzero(buffer, 0x400uLL);
  if (v4)
    v5 = CFStringGetCString(v4, buffer, 1024, 0x8000100u) != 0;
  else
    v5 = 1;
  objc_msgSend(MEMORY[0x1E0DE7910], "bs_secureDataFromObject:", v3);
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = (void *)v6;
  if (v3 && !v6)
  {
    BKLogCommon();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      v16 = 138543362;
      v17 = v3;
      v9 = "Error encoding hittestRegions: %{public}@";
      v10 = v8;
      v11 = 12;
LABEL_12:
      _os_log_error_impl(&dword_18A0F0000, v10, OS_LOG_TYPE_ERROR, v9, (uint8_t *)&v16, v11);
      goto LABEL_13;
    }
    goto LABEL_13;
  }
  if (v5)
  {
    v12 = _BKSServerPortHelper("com.apple.backboard.hid.services", BKSHIDServerPort, &BKSHIDServerMachPort, (void (__cdecl *)(CFMachPortRef, void *))_InvalidateHIDServicesPort);
    v13 = objc_retainAutorelease(v7);
    v14 = _BKSHIDSetHitTestRegionsForDisplay(v12, objc_msgSend(v13, "bytes"), objc_msgSend(v13, "length"), buffer);
    if (v14)
    {
      v15 = v14;
      BKLogCommon();
      v8 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      {
        v16 = 67109120;
        LODWORD(v17) = v15;
        v9 = "Error sending hittestRegions: 0x%x";
        v10 = v8;
        v11 = 8;
        goto LABEL_12;
      }
LABEL_13:

    }
  }

}

uint64_t _BKSHIDSetHitTestRegionsForDisplay(mach_port_t a1, uint64_t a2, unsigned int a3, char *src)
{
  int v5;
  mach_msg_size_t v6;
  uint64_t v7;
  mach_msg_header_t name;
  int v10;
  uint64_t v11;
  int v12;
  _BYTE v13[24];
  _OWORD v14[64];
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  memset(v14, 0, 448);
  *(_OWORD *)&v13[8] = 0u;
  memset(&name, 0, sizeof(name));
  v10 = 1;
  v11 = a2;
  v12 = 16777472;
  *(_QWORD *)v13 = a3;
  *(_QWORD *)&v13[4] = *MEMORY[0x1E0C804E8];
  *(_DWORD *)&v13[12] = a3;
  if (MEMORY[0x1E0C84128])
    v5 = mig_strncpy_zerofill((char *)v14, src, 1024);
  else
    v5 = mig_strncpy((char *)v14, src, 1024);
  *(_DWORD *)&v13[16] = 0;
  *(_DWORD *)&v13[20] = v5;
  v6 = ((v5 + 3) & 0xFFFFFFFC) + 64;
  name.msgh_bits = -2147483629;
  name.msgh_remote_port = a1;
  name.msgh_local_port = 0;
  *(_QWORD *)&name.msgh_voucher_port = 0x5B8D9C00000000;
  if (MEMORY[0x1E0C85B60])
    voucher_mach_msg_set(&name);
  v7 = mach_msg(&name, 1, v6, 0, 0, 0, 0);
  if ((v7 - 268435459) <= 1)
  {
    if ((name.msgh_bits & 0x1F00) == 0x1100)
      mach_port_deallocate(*MEMORY[0x1E0C83DA0], name.msgh_local_port);
    mach_msg_destroy(&name);
  }
  return v7;
}

uint64_t _BKSHIDTouchStreamSetEventDispatchMode(mach_port_t a1, int a2, char a3, char a4, double a5)
{
  uint64_t v5;
  mach_msg_header_t msg;
  uint64_t v8;
  int v9;
  char v10;
  __int16 v11;
  char v12;
  char v13;
  __int16 v14;
  char v15;
  double v16;

  v9 = a2;
  v8 = *MEMORY[0x1E0C804E8];
  v10 = a3;
  v11 = 0;
  v12 = 0;
  v13 = a4;
  v14 = 0;
  v15 = 0;
  v16 = a5;
  *(_QWORD *)&msg.msgh_bits = 19;
  msg.msgh_voucher_port = 0;
  msg.msgh_id = 6000036;
  msg.msgh_remote_port = a1;
  msg.msgh_local_port = 0;
  if (MEMORY[0x1E0C85B60])
    voucher_mach_msg_set(&msg);
  v5 = mach_msg(&msg, 1, 0x34u, 0, 0, 0, 0);
  if ((v5 - 268435459) <= 1)
  {
    if ((msg.msgh_bits & 0x1F00) == 0x1100)
      mach_port_deallocate(*MEMORY[0x1E0C83DA0], msg.msgh_local_port);
    mach_msg_destroy(&msg);
  }
  return v5;
}

void BKSHIDServicesCancelTouchesOnDisplay(void *a1)
{
  __CFString *v1;
  mach_port_name_t v2;
  char buffer[1024];
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  v1 = a1;
  bzero(buffer, 0x400uLL);
  if (!v1 || CFStringGetCString(v1, buffer, 1024, 0x8000100u))
  {
    v2 = _BKSServerPortHelper("com.apple.backboard.hid.services", BKSHIDServerPort, &BKSHIDServerMachPort, (void (__cdecl *)(CFMachPortRef, void *))_InvalidateHIDServicesPort);
    _BKSHIDCancelTouchesOnDisplay(v2, buffer);
  }

}

uint64_t _BKSHIDCancelTouchesOnDisplay(mach_port_name_t a1, const char *a2)
{
  int v3;
  mach_msg_size_t v4;
  uint64_t v5;
  mach_port_name_t name[4];
  __int128 v8;
  _OWORD v9[64];
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  memset(v9, 0, 480);
  *(_OWORD *)name = 0u;
  v8 = 0u;
  *((_QWORD *)&v8 + 1) = *MEMORY[0x1E0C804E8];
  if (MEMORY[0x1E0C84128])
    v3 = mig_strncpy_zerofill((char *)v9 + 8, a2, 1024);
  else
    v3 = mig_strncpy((char *)v9 + 8, a2, 1024);
  LODWORD(v9[0]) = 0;
  DWORD1(v9[0]) = v3;
  v4 = ((v3 + 3) & 0xFFFFFFFC) + 40;
  name[0] = 19;
  name[2] = a1;
  name[3] = 0;
  *(_QWORD *)&v8 = 0x5B8D9900000000;
  if (MEMORY[0x1E0C85B60])
    voucher_mach_msg_set((mach_msg_header_t *)name);
  v5 = mach_msg((mach_msg_header_t *)name, 1, v4, 0, 0, 0, 0);
  if ((v5 - 268435459) <= 1)
  {
    if ((name[0] & 0x1F00) == 0x1100)
      mach_port_deallocate(*MEMORY[0x1E0C83DA0], name[3]);
    mach_msg_destroy((mach_msg_header_t *)name);
  }
  return v5;
}

float BKSDisplayBrightnessGetCurrent()
{
  int v0;
  float v2;

  v2 = 1.0;
  v0 = _BKSServerPortHelper("com.apple.backboard.hid.services", BKSHIDServerPort, &BKSHIDServerMachPort, (void (__cdecl *)(CFMachPortRef, void *))_InvalidateHIDServicesPort);
  _BKSHIDGetCurrentDisplayBrightness(v0, &v2);
  return v2;
}

uint64_t _BKSHIDGetCurrentDisplayBrightness(int a1, _DWORD *a2)
{
  mach_port_name_t special_reply_port;
  uint64_t v5;
  uint64_t v6;
  BOOL v7;
  int v9;
  int rcv_name;
  int rcv_name_4;
  mach_port_name_t rcv_name_8;
  _BYTE rcv_name_12[32];

  memset(&rcv_name_12[4], 0, 28);
  rcv_name = 0;
  special_reply_port = mig_get_special_reply_port();
  rcv_name_4 = a1;
  rcv_name_8 = special_reply_port;
  v9 = 5395;
  *(_QWORD *)rcv_name_12 = 0x5B8DB500000000;
  if (MEMORY[0x1E0C85B60])
  {
    voucher_mach_msg_set((mach_msg_header_t *)&v9);
    special_reply_port = rcv_name_8;
  }
  v5 = mach_msg((mach_msg_header_t *)&v9, 3162115, 0x18u, 0x30u, special_reply_port, 0, 0);
  v6 = v5;
  if ((v5 - 268435458) > 0xE || ((1 << (v5 - 2)) & 0x4003) == 0)
  {
    if (!(_DWORD)v5)
    {
      if (*(_DWORD *)&rcv_name_12[4] == 71)
      {
        v6 = 4294966988;
      }
      else if (*(_DWORD *)&rcv_name_12[4] == 6000153)
      {
        if ((v9 & 0x80000000) == 0)
        {
          if (rcv_name == 40)
          {
            if (!rcv_name_4)
            {
              v6 = *(unsigned int *)&rcv_name_12[16];
              if (!*(_DWORD *)&rcv_name_12[16])
              {
                *a2 = *(_DWORD *)&rcv_name_12[20];
                return v6;
              }
              goto LABEL_25;
            }
          }
          else if (rcv_name == 36)
          {
            if (rcv_name_4)
              v7 = 1;
            else
              v7 = *(_DWORD *)&rcv_name_12[16] == 0;
            if (v7)
              v6 = 4294966996;
            else
              v6 = *(unsigned int *)&rcv_name_12[16];
            goto LABEL_25;
          }
        }
        v6 = 4294966996;
      }
      else
      {
        v6 = 4294966995;
      }
LABEL_25:
      mach_msg_destroy((mach_msg_header_t *)&v9);
      return v6;
    }
    mig_dealloc_special_reply_port();
  }
  if ((v6 - 268435459) <= 1)
  {
    if ((v9 & 0x1F00) == 0x1100)
      mach_port_deallocate(*MEMORY[0x1E0C83DA0], rcv_name_8);
    goto LABEL_25;
  }
  return v6;
}

void sub_18A101CB8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

id BKLogOrientationDevice()
{
  if (BKLogOrientationDevice_onceToken != -1)
    dispatch_once(&BKLogOrientationDevice_onceToken, &__block_literal_global_2);
  return (id)BKLogOrientationDevice___logObj;
}

uint64_t _BKSHIDSetOrientationClientEventsEnabled(int a1, int a2, char a3, char a4)
{
  uint64_t v4;
  _BYTE msg[36];
  int v7;
  uint64_t v8;
  char v9;
  __int16 v10;
  char v11;
  char v12;
  __int16 v13;
  char v14;

  *(_OWORD *)&msg[20] = 0u;
  *(_OWORD *)&msg[4] = 0u;
  *(_DWORD *)&msg[28] = a2;
  v7 = 1310720;
  v8 = *MEMORY[0x1E0C804E8];
  v9 = a3;
  v10 = 0;
  v11 = 0;
  v12 = a4;
  v13 = 0;
  v14 = 0;
  *(_DWORD *)msg = -2147483629;
  *(_DWORD *)&msg[8] = a1;
  *(_QWORD *)&msg[20] = 0x1005B8DB4;
  if (MEMORY[0x1E0C85B60])
    voucher_mach_msg_set((mach_msg_header_t *)msg);
  v4 = mach_msg((mach_msg_header_t *)msg, 1, 0x38u, 0, 0, 0, 0);
  if ((v4 - 268435459) <= 1)
  {
    if ((*(_WORD *)msg & 0x1F00) == 0x1100)
      mach_port_deallocate(*MEMORY[0x1E0C83DA0], *(mach_port_name_t *)&msg[12]);
    mach_msg_destroy((mach_msg_header_t *)msg);
  }
  return v4;
}

uint64_t BKSHIDServicesSetDeviceInterfaceOrientation(char a1)
{
  mach_port_t v2;

  v2 = _BKSServerPortHelper("com.apple.backboard.hid.services", BKSHIDServerPort, &BKSHIDServerMachPort, (void (__cdecl *)(CFMachPortRef, void *))_InvalidateHIDServicesPort);
  return _BKSHIDSetDeviceInterfaceOrientation(v2, a1);
}

uint64_t BKSDisplayServicesUpdateTetheredDisplayOrientationIfNecessaryWithInterfaceOrientation(char a1)
{
  mach_port_t v2;

  v2 = _BKSServerPortHelper("com.apple.backboard.display.services", BKSDisplayServerPort, &BKSDisplayServerMachPort, (void (__cdecl *)(CFMachPortRef, void *))_InvalidateDisplayServicesPort);
  return _BKSDisplayUpdateTetheredDisplayOrientationIfNecessaryWithInterfaceOrientation(v2, a1);
}

uint64_t BKSDisplayServicesUpdateMirroredDisplayOrientationWithInterfaceOrientation(char a1)
{
  mach_port_t v2;

  v2 = _BKSServerPortHelper("com.apple.backboard.display.services", BKSDisplayServerPort, &BKSDisplayServerMachPort, (void (__cdecl *)(CFMachPortRef, void *))_InvalidateDisplayServicesPort);
  return _BKSDisplayUpdateMirroredDisplayOrientationWithInterfaceOrientation(v2, a1);
}

BOOL BKSDisplayServicesDisplayIsTethered()
{
  int v0;
  char v2;

  v2 = 0;
  v0 = _BKSServerPortHelper("com.apple.backboard.display.services", BKSDisplayServerPort, &BKSDisplayServerMachPort, (void (__cdecl *)(CFMachPortRef, void *))_InvalidateDisplayServicesPort);
  _BKSDisplayDisplayIsTethered(v0, &v2);
  return v2 != 0;
}

uint64_t _BKSDisplayDisplayIsTethered(int a1, _BYTE *a2)
{
  mach_port_name_t special_reply_port;
  uint64_t v5;
  uint64_t v6;
  BOOL v7;
  int v9;
  int rcv_name;
  int rcv_name_4;
  mach_port_name_t rcv_name_8;
  _BYTE rcv_name_12[32];

  memset(&rcv_name_12[4], 0, 28);
  rcv_name = 0;
  special_reply_port = mig_get_special_reply_port();
  rcv_name_4 = a1;
  rcv_name_8 = special_reply_port;
  v9 = 5395;
  *(_QWORD *)rcv_name_12 = 0x5B917900000000;
  if (MEMORY[0x1E0C85B60])
  {
    voucher_mach_msg_set((mach_msg_header_t *)&v9);
    special_reply_port = rcv_name_8;
  }
  v5 = mach_msg((mach_msg_header_t *)&v9, 3162115, 0x18u, 0x30u, special_reply_port, 0, 0);
  v6 = v5;
  if ((v5 - 268435458) > 0xE || ((1 << (v5 - 2)) & 0x4003) == 0)
  {
    if (!(_DWORD)v5)
    {
      if (*(_DWORD *)&rcv_name_12[4] == 71)
      {
        v6 = 4294966988;
      }
      else if (*(_DWORD *)&rcv_name_12[4] == 6001117)
      {
        if ((v9 & 0x80000000) == 0)
        {
          if (rcv_name == 40)
          {
            if (!rcv_name_4)
            {
              v6 = *(unsigned int *)&rcv_name_12[16];
              if (!*(_DWORD *)&rcv_name_12[16])
              {
                *a2 = rcv_name_12[20];
                return v6;
              }
              goto LABEL_25;
            }
          }
          else if (rcv_name == 36)
          {
            if (rcv_name_4)
              v7 = 1;
            else
              v7 = *(_DWORD *)&rcv_name_12[16] == 0;
            if (v7)
              v6 = 4294966996;
            else
              v6 = *(unsigned int *)&rcv_name_12[16];
            goto LABEL_25;
          }
        }
        v6 = 4294966996;
      }
      else
      {
        v6 = 4294966995;
      }
LABEL_25:
      mach_msg_destroy((mach_msg_header_t *)&v9);
      return v6;
    }
    mig_dealloc_special_reply_port();
  }
  if ((v6 - 268435459) <= 1)
  {
    if ((v9 & 0x1F00) == 0x1100)
      mach_port_deallocate(*MEMORY[0x1E0C83DA0], rcv_name_8);
    goto LABEL_25;
  }
  return v6;
}

uint64_t _BKSHIDSetDeviceInterfaceOrientation(mach_port_t a1, char a2)
{
  uint64_t v2;
  mach_msg_header_t msg;
  uint64_t v5;
  char v6;
  __int16 v7;
  char v8;

  v5 = *MEMORY[0x1E0C804E8];
  v6 = a2;
  v7 = 0;
  v8 = 0;
  *(_QWORD *)&msg.msgh_bits = 19;
  msg.msgh_voucher_port = 0;
  msg.msgh_id = 6000012;
  msg.msgh_remote_port = a1;
  msg.msgh_local_port = 0;
  if (MEMORY[0x1E0C85B60])
    voucher_mach_msg_set(&msg);
  v2 = mach_msg(&msg, 1, 0x24u, 0, 0, 0, 0);
  if ((v2 - 268435459) <= 1)
  {
    if ((msg.msgh_bits & 0x1F00) == 0x1100)
      mach_port_deallocate(*MEMORY[0x1E0C83DA0], msg.msgh_local_port);
    mach_msg_destroy(&msg);
  }
  return v2;
}

uint64_t _BKSDisplayUpdateTetheredDisplayOrientationIfNecessaryWithInterfaceOrientation(mach_port_t a1, char a2)
{
  uint64_t v2;
  mach_msg_header_t msg;
  uint64_t v5;
  char v6;
  __int16 v7;
  char v8;

  v5 = *MEMORY[0x1E0C804E8];
  v6 = a2;
  v7 = 0;
  v8 = 0;
  *(_QWORD *)&msg.msgh_bits = 19;
  msg.msgh_voucher_port = 0;
  msg.msgh_id = 6001020;
  msg.msgh_remote_port = a1;
  msg.msgh_local_port = 0;
  if (MEMORY[0x1E0C85B60])
    voucher_mach_msg_set(&msg);
  v2 = mach_msg(&msg, 1, 0x24u, 0, 0, 0, 0);
  if ((v2 - 268435459) <= 1)
  {
    if ((msg.msgh_bits & 0x1F00) == 0x1100)
      mach_port_deallocate(*MEMORY[0x1E0C83DA0], msg.msgh_local_port);
    mach_msg_destroy(&msg);
  }
  return v2;
}

uint64_t _BKSDisplayUpdateMirroredDisplayOrientationWithInterfaceOrientation(mach_port_t a1, char a2)
{
  uint64_t v2;
  mach_msg_header_t msg;
  uint64_t v5;
  char v6;
  __int16 v7;
  char v8;

  v5 = *MEMORY[0x1E0C804E8];
  v6 = a2;
  v7 = 0;
  v8 = 0;
  *(_QWORD *)&msg.msgh_bits = 19;
  msg.msgh_voucher_port = 0;
  msg.msgh_id = 6001021;
  msg.msgh_remote_port = a1;
  msg.msgh_local_port = 0;
  if (MEMORY[0x1E0C85B60])
    voucher_mach_msg_set(&msg);
  v2 = mach_msg(&msg, 1, 0x24u, 0, 0, 0, 0);
  if ((v2 - 268435459) <= 1)
  {
    if ((msg.msgh_bits & 0x1F00) == 0x1100)
      mach_port_deallocate(*MEMORY[0x1E0C83DA0], msg.msgh_local_port);
    mach_msg_destroy(&msg);
  }
  return v2;
}

uint64_t BKHIDServicesGetNonFlatDeviceOrientation()
{
  int v0;
  int v2;

  v2 = 0;
  v0 = _BKSServerPortHelper("com.apple.backboard.hid.services", BKSHIDServerPort, &BKSHIDServerMachPort, (void (__cdecl *)(CFMachPortRef, void *))_InvalidateHIDServicesPort);
  _BKSHIDGetNonFlatDeviceOrientation(v0, &v2);
  return v2;
}

uint64_t _BKSHIDGetNonFlatDeviceOrientation(int a1, _DWORD *a2)
{
  mach_port_name_t special_reply_port;
  uint64_t v5;
  uint64_t v6;
  BOOL v7;
  int v9;
  int rcv_name;
  int rcv_name_4;
  mach_port_name_t rcv_name_8;
  _BYTE rcv_name_12[32];

  memset(&rcv_name_12[4], 0, 28);
  rcv_name = 0;
  special_reply_port = mig_get_special_reply_port();
  rcv_name_4 = a1;
  rcv_name_8 = special_reply_port;
  v9 = 5395;
  *(_QWORD *)rcv_name_12 = 0x5B8DAD00000000;
  if (MEMORY[0x1E0C85B60])
  {
    voucher_mach_msg_set((mach_msg_header_t *)&v9);
    special_reply_port = rcv_name_8;
  }
  v5 = mach_msg((mach_msg_header_t *)&v9, 3162115, 0x18u, 0x30u, special_reply_port, 0, 0);
  v6 = v5;
  if ((v5 - 268435458) > 0xE || ((1 << (v5 - 2)) & 0x4003) == 0)
  {
    if (!(_DWORD)v5)
    {
      if (*(_DWORD *)&rcv_name_12[4] == 71)
      {
        v6 = 4294966988;
      }
      else if (*(_DWORD *)&rcv_name_12[4] == 6000145)
      {
        if ((v9 & 0x80000000) == 0)
        {
          if (rcv_name == 40)
          {
            if (!rcv_name_4)
            {
              v6 = *(unsigned int *)&rcv_name_12[16];
              if (!*(_DWORD *)&rcv_name_12[16])
              {
                *a2 = *(_DWORD *)&rcv_name_12[20];
                return v6;
              }
              goto LABEL_25;
            }
          }
          else if (rcv_name == 36)
          {
            if (rcv_name_4)
              v7 = 1;
            else
              v7 = *(_DWORD *)&rcv_name_12[16] == 0;
            if (v7)
              v6 = 4294966996;
            else
              v6 = *(unsigned int *)&rcv_name_12[16];
            goto LABEL_25;
          }
        }
        v6 = 4294966996;
      }
      else
      {
        v6 = 4294966995;
      }
LABEL_25:
      mach_msg_destroy((mach_msg_header_t *)&v9);
      return v6;
    }
    mig_dealloc_special_reply_port();
  }
  if ((v6 - 268435459) <= 1)
  {
    if ((v9 & 0x1F00) == 0x1100)
      mach_port_deallocate(*MEMORY[0x1E0C83DA0], rcv_name_8);
    goto LABEL_25;
  }
  return v6;
}

void sub_18A102964(_Unwind_Exception *a1)
{
  uint64_t v1;

  _Block_object_dispose((const void *)(v1 - 48), 8);
  _Unwind_Resume(a1);
}

Class __getFBSSystemServiceClass_block_invoke(uint64_t a1)
{
  Class result;
  void *v3;
  void *v4;
  void *v5;

  if (!FrontBoardServicesLibraryCore_frameworkLibrary)
    FrontBoardServicesLibraryCore_frameworkLibrary = _sl_dlopen();
  if (!FrontBoardServicesLibraryCore_frameworkLibrary)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "void *FrontBoardServicesLibrary(void)");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "handleFailureInFunction:file:lineNumber:description:", v4, CFSTR("BKSSystemService.m"), 15, CFSTR("%s"), 0);

    goto LABEL_8;
  }
  result = objc_getClass("FBSSystemService");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "Class getFBSSystemServiceClass(void)_block_invoke");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "handleFailureInFunction:file:lineNumber:description:", v5, CFSTR("BKSSystemService.m"), 16, CFSTR("Unable to find class %s"), "FBSSystemService");

LABEL_8:
    __break(1u);
  }
  getFBSSystemServiceClass_softClass = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  return result;
}

uint64_t _BKSHIDGetLastUserEventTime(int a1, _QWORD *a2)
{
  mach_port_name_t special_reply_port;
  uint64_t v5;
  uint64_t v6;
  BOOL v7;
  _BYTE msg[36];
  __int128 v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v10 = 0u;
  *(_OWORD *)&msg[20] = 0u;
  *(_DWORD *)&msg[4] = 0;
  special_reply_port = mig_get_special_reply_port();
  *(_DWORD *)&msg[8] = a1;
  *(_DWORD *)&msg[12] = special_reply_port;
  *(_DWORD *)msg = 5395;
  *(_QWORD *)&msg[16] = 0x5B8DAB00000000;
  if (MEMORY[0x1E0C85B60])
  {
    voucher_mach_msg_set((mach_msg_header_t *)msg);
    special_reply_port = *(_DWORD *)&msg[12];
  }
  v5 = mach_msg((mach_msg_header_t *)msg, 3162115, 0x18u, 0x34u, special_reply_port, 0, 0);
  v6 = v5;
  if ((v5 - 268435458) > 0xE || ((1 << (v5 - 2)) & 0x4003) == 0)
  {
    if (!(_DWORD)v5)
    {
      if (*(_DWORD *)&msg[20] == 71)
      {
        v6 = 4294966988;
      }
      else if (*(_DWORD *)&msg[20] == 6000143)
      {
        if ((*(_DWORD *)msg & 0x80000000) == 0)
        {
          if (*(_DWORD *)&msg[4] == 44)
          {
            if (!*(_DWORD *)&msg[8])
            {
              v6 = *(unsigned int *)&msg[32];
              if (!*(_DWORD *)&msg[32])
              {
                *a2 = v10;
                return v6;
              }
              goto LABEL_25;
            }
          }
          else if (*(_DWORD *)&msg[4] == 36)
          {
            if (*(_DWORD *)&msg[8])
              v7 = 1;
            else
              v7 = *(_DWORD *)&msg[32] == 0;
            if (v7)
              v6 = 4294966996;
            else
              v6 = *(unsigned int *)&msg[32];
            goto LABEL_25;
          }
        }
        v6 = 4294966996;
      }
      else
      {
        v6 = 4294966995;
      }
LABEL_25:
      mach_msg_destroy((mach_msg_header_t *)msg);
      return v6;
    }
    mig_dealloc_special_reply_port();
  }
  if ((v6 - 268435459) <= 1)
  {
    if ((*(_WORD *)msg & 0x1F00) == 0x1100)
      mach_port_deallocate(*MEMORY[0x1E0C83DA0], *(mach_port_name_t *)&msg[12]);
    goto LABEL_25;
  }
  return v6;
}

double BKSHIDServicesLastUserEventTime()
{
  int v0;
  double v2;

  v2 = 0.0;
  v0 = _BKSServerPortHelper("com.apple.backboard.hid.services", BKSHIDServerPort, &BKSHIDServerMachPort, (void (__cdecl *)(CFMachPortRef, void *))_InvalidateHIDServicesPort);
  _BKSHIDGetLastUserEventTime(v0, &v2);
  return v2;
}

uint64_t _BKSVerifyIsArrayOfNumbers(void *a1)
{
  id v1;
  id v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _BYTE v13[128];
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v1 = a1;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v11 = 0u;
    v12 = 0u;
    v9 = 0u;
    v10 = 0u;
    v2 = v1;
    v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
    if (v3)
    {
      v4 = v3;
      v5 = *(_QWORD *)v10;
      while (2)
      {
        v6 = 0;
        do
        {
          if (*(_QWORD *)v10 != v5)
            objc_enumerationMutation(v2);
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) == 0)
          {
            v7 = 0;
            goto LABEL_13;
          }
          ++v6;
        }
        while (v4 != v6);
        v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
        if (v4)
          continue;
        break;
      }
    }
    v7 = 1;
LABEL_13:

  }
  else
  {
    v7 = 0;
  }

  return v7;
}

__CFString *NSStringFromBKSHIDEventBackBoardVendorSubtype(unint64_t a1)
{
  if (a1 < 4)
    return off_1E1E9FC10[a1];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("<unknown:%X>"), a1);
  return (__CFString *)(id)objc_claimAutoreleasedReturnValue();
}

uint64_t BKSHIDEventGetBackBoardVendorSubtype()
{
  NSObject *v0;
  const char *v1;
  unsigned int *DataValue;
  uint64_t v3;
  NSObject *v4;
  _DWORD v6[2];
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  if (IOHIDEventGetType() != 1
    || IOHIDEventGetIntegerValue() != 65280
    || IOHIDEventGetIntegerValue() != 92)
  {
    return 0;
  }
  if (IOHIDEventGetIntegerValue())
  {
    BKLogCommon();
    v0 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v0, OS_LOG_TYPE_ERROR))
    {
      LOWORD(v6[0]) = 0;
      v1 = "BKSHIDEventGetBackBoardVendorSubtype: unsupported event version";
LABEL_17:
      _os_log_error_impl(&dword_18A0F0000, v0, OS_LOG_TYPE_ERROR, v1, (uint8_t *)v6, 2u);
      goto LABEL_18;
    }
    goto LABEL_18;
  }
  if ((unint64_t)IOHIDEventGetIntegerValue() <= 3)
  {
    BKLogCommon();
    v0 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v0, OS_LOG_TYPE_ERROR))
    {
      LOWORD(v6[0]) = 0;
      v1 = "BKSHIDEventGetBackBoardVendorSubtype: data too small";
      goto LABEL_17;
    }
LABEL_18:

    return 0;
  }
  DataValue = (unsigned int *)IOHIDEventGetDataValue();
  if (!DataValue)
  {
    BKLogCommon();
    v0 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v0, OS_LOG_TYPE_ERROR))
    {
      LOWORD(v6[0]) = 0;
      v1 = "BKSHIDEventGetBackBoardVendorSubtype: data missing";
      goto LABEL_17;
    }
    goto LABEL_18;
  }
  v3 = *DataValue;
  if (v3 > 3)
  {
    BKLogCommon();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      v6[0] = 67109120;
      v6[1] = v3;
      _os_log_error_impl(&dword_18A0F0000, v4, OS_LOG_TYPE_ERROR, "BKSHIDEventGetBackBoardVendorSubtype: invalid subtype %X", (uint8_t *)v6, 8u);
    }

    return 0;
  }
  return v3;
}

uint64_t BKSHIDEventCreateBackBoardVendorSubtypeEvent(uint64_t a1)
{
  void *v2;
  void *v3;
  int v4;
  void *v5;
  __int16 v6;
  const __CFString *v7;
  __int16 v8;
  int v9;
  __int16 v10;
  void *v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  if ((unint64_t)(a1 - 1) >= 3)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("invalid subtype"));
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "IOHIDEventRef  _Nonnull BKSHIDEventCreateBackBoardVendorSubtypeEvent(BKSHIDEventBackBoardVendorSubtype, uint64_t)");
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      v4 = 138544130;
      v5 = v3;
      v6 = 2114;
      v7 = CFSTR("BKSHIDEventBackBoardVendor.m");
      v8 = 1024;
      v9 = 85;
      v10 = 2114;
      v11 = v2;
      _os_log_error_impl(&dword_18A0F0000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "failure in %{public}@ (%{public}@:%i) : %{public}@", (uint8_t *)&v4, 0x26u);

    }
    objc_msgSend(objc_retainAutorelease(v2), "UTF8String");
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x18A106068);
  }
  v4 = a1;
  return IOHIDEventCreateVendorDefinedEvent();
}

void BSDescriptionStreamAppendBKSKeyModifierFlags(void *a1, int a2)
{
  id v3;
  char v4;

  v3 = a1;
  v4 = 0;
  if ((a2 & 0x800000) != 0)
  {
    _BKSKeyModifierStringAppend(v3, CFSTR("glb"), &v4);
    if ((a2 & 0x100000) == 0)
    {
LABEL_3:
      if ((a2 & 0x40000) == 0)
        goto LABEL_4;
      goto LABEL_12;
    }
  }
  else if ((a2 & 0x100000) == 0)
  {
    goto LABEL_3;
  }
  _BKSKeyModifierStringAppend(v3, CFSTR("cmd"), &v4);
  if ((a2 & 0x40000) == 0)
  {
LABEL_4:
    if ((a2 & 0x80000) == 0)
      goto LABEL_5;
    goto LABEL_13;
  }
LABEL_12:
  _BKSKeyModifierStringAppend(v3, CFSTR("ctrl"), &v4);
  if ((a2 & 0x80000) == 0)
  {
LABEL_5:
    if ((a2 & 0x20000) == 0)
      goto LABEL_6;
    goto LABEL_14;
  }
LABEL_13:
  _BKSKeyModifierStringAppend(v3, CFSTR("opt"), &v4);
  if ((a2 & 0x20000) == 0)
  {
LABEL_6:
    if ((a2 & 0x10000) == 0)
      goto LABEL_7;
LABEL_15:
    _BKSKeyModifierStringAppend(v3, CFSTR("capslock"), &v4);
    if ((a2 & 0x200000) == 0)
      goto LABEL_9;
    goto LABEL_8;
  }
LABEL_14:
  _BKSKeyModifierStringAppend(v3, CFSTR("shft"), &v4);
  if ((a2 & 0x10000) != 0)
    goto LABEL_15;
LABEL_7:
  if ((a2 & 0x200000) != 0)
LABEL_8:
    _BKSKeyModifierStringAppend(v3, CFSTR("numpad"), &v4);
LABEL_9:

}

void _BKSKeyModifierStringAppend(void *a1, void *a2, _BYTE *a3)
{
  id v5;
  id v6;

  v6 = a1;
  v5 = a2;
  if (*a3)
    objc_msgSend(v6, "appendString:", CFSTR("|"));
  else
    *a3 = 1;
  objc_msgSend(v6, "appendString:", v5);

}

__CFString *NSStringFromBKSKeyModifierFlags(uint64_t a1)
{
  int v1;
  __CFString *v2;

  if (a1)
  {
    v1 = a1;
    v2 = (__CFString *)objc_opt_new();
    BSDescriptionStreamAppendBKSKeyModifierFlags(v2, v1);
  }
  else
  {
    v2 = &stru_1E1EA2860;
  }
  return v2;
}

__CFString *BKSRestartActionOptionsDescription(char a1)
{
  void *v2;
  void *v3;
  __CFString *v4;

  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if ((a1 & 1) != 0)
    objc_msgSend(v2, "addObject:", CFSTR("HideAppleLogo"));
  if (objc_msgSend(v3, "count"))
  {
    objc_msgSend(v3, "componentsJoinedByString:", CFSTR(", "));
    v4 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v4 = CFSTR("(none)");
  }

  return v4;
}

_BKSTouchDeliveryPolicyConcreteServerReference *BKSTouchDeliveryPolicyServerGetProxyWithErrorHandler(void *a1)
{
  uint64_t v1;
  id v2;
  _BKSTouchDeliveryPolicyConcreteServerReference *v3;

  v1 = BKSTouchDeliveryPolicyServerGetProxyWithErrorHandler_onceToken;
  v2 = a1;
  if (v1 != -1)
    dispatch_once(&BKSTouchDeliveryPolicyServerGetProxyWithErrorHandler_onceToken, &__block_literal_global_1321);
  v3 = objc_alloc_init(_BKSTouchDeliveryPolicyConcreteServerReference);
  -[_BKSTouchDeliveryPolicyConcreteServerReference setServer:](v3, "setServer:", BKSTouchDeliveryPolicyServerGetProxyWithErrorHandler_server);
  -[_BKSTouchDeliveryPolicyConcreteServerReference setErrorHandler:](v3, "setErrorHandler:", v2);

  return v3;
}

uint64_t BKSHIDServicesServerPort()
{
  return _BKSServerPortHelper("com.apple.backboard.hid.services", BKSHIDServerPort, &BKSHIDServerMachPort, (void (__cdecl *)(CFMachPortRef, void *))_InvalidateHIDServicesPort);
}

uint64_t _InvalidateHIDServicesPort()
{
  pthread_mutex_lock(&BKSServerPortLock);
  _lock_InvalidatePortHelper((uint64_t)"com.apple.backboard.hid.services", BKSHIDServerPort, &BKSHIDServerMachPort);
  return pthread_mutex_unlock(&BKSServerPortLock);
}

void _lock_InvalidatePortHelper(uint64_t a1, mach_port_name_t *a2, CFTypeRef *a3)
{
  NSObject *v6;
  _QWORD block[5];

  mach_port_deallocate(*MEMORY[0x1E0C83DA0], *a2);
  *a2 = 0;
  if (*a3)
    CFRelease(*a3);
  *a3 = 0;
  dispatch_get_global_queue(0, 0);
  v6 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = ___lock_InvalidatePortHelper_block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  dispatch_async(v6, block);

}

uint64_t BKSDisplayServicesServerPort()
{
  return _BKSServerPortHelper("com.apple.backboard.display.services", BKSDisplayServerPort, &BKSDisplayServerMachPort, (void (__cdecl *)(CFMachPortRef, void *))_InvalidateDisplayServicesPort);
}

uint64_t _InvalidateDisplayServicesPort()
{
  pthread_mutex_lock(&BKSServerPortLock);
  _lock_InvalidatePortHelper((uint64_t)"com.apple.backboard.display.services", BKSDisplayServerPort, &BKSDisplayServerMachPort);
  return pthread_mutex_unlock(&BKSServerPortLock);
}

uint64_t BKSWatchdogServerPort()
{
  return _BKSServerPortHelper("com.apple.backboard.watchdog", BKSWatchdogPort, &BKSWatchdogMachPort, (void (__cdecl *)(CFMachPortRef, void *))_InvalidateWatchdogPort);
}

uint64_t _InvalidateWatchdogPort()
{
  pthread_mutex_lock(&BKSServerPortLock);
  _lock_InvalidatePortHelper((uint64_t)"com.apple.backboard.watchdog", BKSWatchdogPort, &BKSWatchdogMachPort);
  return pthread_mutex_unlock(&BKSServerPortLock);
}

float BKSHIDServicesGetBacklightFactor()
{
  int v0;
  float v2;

  v2 = -1.0;
  v0 = _BKSServerPortHelper("com.apple.backboard.hid.services", BKSHIDServerPort, &BKSHIDServerMachPort, (void (__cdecl *)(CFMachPortRef, void *))_InvalidateHIDServicesPort);
  _BKSHIDGetBacklightFactor(v0, &v2);
  return v2;
}

uint64_t BKSHIDServicesSetBacklightFactorPending(float a1)
{
  mach_port_t v2;

  v2 = _BKSServerPortHelper("com.apple.backboard.hid.services", BKSHIDServerPort, &BKSHIDServerMachPort, (void (__cdecl *)(CFMachPortRef, void *))_InvalidateHIDServicesPort);
  return _BKSHIDSetBacklightFactorPending(v2, a1);
}

uint64_t BKSHIDServicesSetBacklightFactorWithFadeDuration(char a1, float a2, float a3)
{
  mach_port_t v6;

  v6 = _BKSServerPortHelper("com.apple.backboard.hid.services", BKSHIDServerPort, &BKSHIDServerMachPort, (void (__cdecl *)(CFMachPortRef, void *))_InvalidateHIDServicesPort);
  return _BKSHIDSetBacklightFactorWithFadeDuration(v6, a1, 0, a2, a3);
}

uint64_t BKSHIDServicesSetBacklightFactorWithFadeDurationAsync(char a1, float a2, float a3)
{
  mach_port_t v6;

  v6 = _BKSServerPortHelper("com.apple.backboard.hid.services", BKSHIDServerPort, &BKSHIDServerMachPort, (void (__cdecl *)(CFMachPortRef, void *))_InvalidateHIDServicesPort);
  return _BKSHIDNotifySetBacklightFactorWithFadeDurationAsync(v6, 1, a1, 0, a2, a3);
}

uint64_t BKSHIDServicesNotifyBacklightFactorWithFadeDurationAsync(char a1, float a2, float a3)
{
  mach_port_t v6;

  v6 = _BKSServerPortHelper("com.apple.backboard.hid.services", BKSHIDServerPort, &BKSHIDServerMachPort, (void (__cdecl *)(CFMachPortRef, void *))_InvalidateHIDServicesPort);
  return _BKSHIDNotifySetBacklightFactorWithFadeDurationAsync(v6, 0, a1, 0, a2, a3);
}

uint64_t BKSHIDServicesSetBacklightFactorWithFadeDurationSilently(char a1, float a2, float a3)
{
  mach_port_t v6;

  v6 = _BKSServerPortHelper("com.apple.backboard.hid.services", BKSHIDServerPort, &BKSHIDServerMachPort, (void (__cdecl *)(CFMachPortRef, void *))_InvalidateHIDServicesPort);
  return _BKSHIDSetBacklightFactorWithFadeDuration(v6, a1, 1, a2, a3);
}

uint64_t BKSHIDServicesSetBacklightFactorWithFadeDurationSilentlyAsync(char a1, float a2, float a3)
{
  mach_port_t v6;

  v6 = _BKSServerPortHelper("com.apple.backboard.hid.services", BKSHIDServerPort, &BKSHIDServerMachPort, (void (__cdecl *)(CFMachPortRef, void *))_InvalidateHIDServicesPort);
  return _BKSHIDNotifySetBacklightFactorWithFadeDurationAsync(v6, 1, a1, 1, a2, a3);
}

void BKSHIDServicesSetBacklightFeatures(void *a1)
{
  id v1;
  void *v2;
  id v3;
  int v4;
  id v5;
  NSObject *v6;
  id v7;
  uint8_t buf[4];
  id v9;
  __int16 v10;
  id v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v1 = a1;
  v7 = 0;
  objc_msgSend(MEMORY[0x1E0D01838], "encodeObject:error:", v1, &v7);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v7;
  if (v2)
  {
    v4 = _BKSServerPortHelper("com.apple.backboard.hid.services", BKSHIDServerPort, &BKSHIDServerMachPort, (void (__cdecl *)(CFMachPortRef, void *))_InvalidateHIDServicesPort);
    v5 = objc_retainAutorelease(v2);
    _BKSHIDSetBacklightFeatures(v4, objc_msgSend(v5, "bytes"), objc_msgSend(v5, "length"));
  }
  else
  {
    BKLogBacklight();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543618;
      v9 = v1;
      v10 = 2114;
      v11 = v3;
      _os_log_error_impl(&dword_18A0F0000, v6, OS_LOG_TYPE_ERROR, "BKSHIDServicesSetBacklightFeatures failed to encode %{public}@: %{public}@", buf, 0x16u);
    }

  }
}

uint64_t BKSHIDServicesGetDeviceBacklightArchitectureVersion()
{
  int v0;
  unsigned __int8 v2;

  v2 = 0;
  v0 = _BKSServerPortHelper("com.apple.backboard.hid.services", BKSHIDServerPort, &BKSHIDServerMachPort, (void (__cdecl *)(CFMachPortRef, void *))_InvalidateHIDServicesPort);
  _BKSHIDGetDeviceBacklightArchitectureVersion(v0, &v2);
  return v2;
}

uint64_t BKSHIDServicesAmbientLightSensorExists()
{
  if (BKSHIDServicesAmbientLightSensorExists_onceToken != -1)
    dispatch_once(&BKSHIDServicesAmbientLightSensorExists_onceToken, &__block_literal_global_1438);
  return BKSHIDServicesAmbientLightSensorExists_alsExists;
}

uint64_t BKSHIDServicesAmbientLightSensorEnableAutoBrightness(char a1)
{
  mach_port_t v2;

  v2 = _BKSServerPortHelper("com.apple.backboard.hid.services", BKSHIDServerPort, &BKSHIDServerMachPort, (void (__cdecl *)(CFMachPortRef, void *))_InvalidateHIDServicesPort);
  return _BKSHIDAmbientLightSensorEnableAutoBrightness(v2, a1);
}

uint64_t BKSHIDServicesAmbientLightSensorDisableAutoBrightness()
{
  mach_port_t v0;

  v0 = _BKSServerPortHelper("com.apple.backboard.hid.services", BKSHIDServerPort, &BKSHIDServerMachPort, (void (__cdecl *)(CFMachPortRef, void *))_InvalidateHIDServicesPort);
  return _BKSHIDAmbientLightSensorDisableAutoBrightness(v0);
}

uint64_t BKSHIDServicesRequestEstimatedProximityEvents(double a1)
{
  int v2;
  float v3;
  unsigned int v5;

  v5 = 0;
  v2 = _BKSServerPortHelper("com.apple.backboard.hid.services", BKSHIDServerPort, &BKSHIDServerMachPort, (void (__cdecl *)(CFMachPortRef, void *))_InvalidateHIDServicesPort);
  v3 = a1;
  _BKSHIDRequestEstimatedProximityEvents(v2, &v5, v3);
  return v5;
}

void BKSHIDServicesRequestProximityStatusEvent(void *a1)
{
  id v1;
  NSObject *v2;
  __CFString *v3;
  int CString;
  mach_port_name_t v5;
  void *v6;
  void *v7;
  uint8_t v8[1032];
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  v1 = a1;
  if (!objc_msgSend(v1, "length"))
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "void BKSHIDServicesRequestProximityStatusEvent(NSString *__strong _Nonnull)");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "handleFailureInFunction:file:lineNumber:description:", v7, CFSTR("BKSHIDServices.m"), 134, CFSTR("must have a valid reason"));

  }
  BKLogUISensor();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v8 = 0;
    _os_log_impl(&dword_18A0F0000, v2, OS_LOG_TYPE_DEFAULT, "request status event", v8, 2u);
  }

  bzero(v8, 0x400uLL);
  v3 = (__CFString *)v1;
  if (-[__CFString length](v3, "length"))
  {
    CString = CFStringGetCString(v3, (char *)v8, 1024, 0x8000100u);

    if (!CString)
      goto LABEL_10;
  }
  else
  {

  }
  v5 = _BKSServerPortHelper("com.apple.backboard.hid.services", BKSHIDServerPort, &BKSHIDServerMachPort, (void (__cdecl *)(CFMachPortRef, void *))_InvalidateHIDServicesPort);
  _BKSHIDRequestProximityStatusEvent(v5, (const char *)v8);
LABEL_10:

}

uint64_t BKSHIDServicesProximityDetectionModePriority(int a1)
{
  if ((a1 - 1) > 0xC)
    return 0;
  else
    return qword_18A161340[a1 - 1];
}

void BKSHIDServicesRequestProximityDetectionMode(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  uint64_t v8;
  void *v9;
  _QWORD v10[4];
  int v11;
  uint8_t buf[4];
  void *v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  kdebug_trace();
  BKLogUISensor();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    NSStringFromBKSHIDServicesProximityDetectionMode(a1);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543362;
    v13 = v3;
    _os_log_impl(&dword_18A0F0000, v2, OS_LOG_TYPE_DEFAULT, "request prox mode: %{public}@", buf, 0xCu);

  }
  os_unfair_lock_lock((os_unfair_lock_t)&BKSHIDServicesRequestProximityDetectionMode_sLock);
  if ((_DWORD)a1)
  {
    v10[0] = MEMORY[0x1E0C809B0];
    v10[1] = 3221225472;
    v10[2] = __BKSHIDServicesRequestProximityDetectionMode_block_invoke;
    v10[3] = &__block_descriptor_36_e35_v16__0__BKSMutableHIDUISensorMode_8l;
    v11 = a1;
    +[BKSHIDUISensorMode buildModeForReason:builder:](BKSHIDUISensorMode, "buildModeForReason:builder:", CFSTR("RequestProximityDetectionMode"), v10);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    +[BKSHIDUISensorService sharedInstance](BKSHIDUISensorService, "sharedInstance");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "suppressUISensorChangesForReason:", CFSTR("RequestProximityDetectionMode transaction"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = (id)BKSHIDServicesRequestProximityDetectionMode_sModeAssertion;
    objc_msgSend(v5, "requestUISensorMode:", v4);
    v8 = objc_claimAutoreleasedReturnValue();
    v9 = (void *)BKSHIDServicesRequestProximityDetectionMode_sModeAssertion;
    BKSHIDServicesRequestProximityDetectionMode_sModeAssertion = v8;

    objc_msgSend(v7, "invalidate");
    objc_msgSend(v6, "invalidate");

  }
  else
  {
    objc_msgSend((id)BKSHIDServicesRequestProximityDetectionMode_sModeAssertion, "invalidate");
    v4 = (void *)BKSHIDServicesRequestProximityDetectionMode_sModeAssertion;
    BKSHIDServicesRequestProximityDetectionMode_sModeAssertion = 0;
  }

  os_unfair_lock_unlock((os_unfair_lock_t)&BKSHIDServicesRequestProximityDetectionMode_sLock);
}

void BKSHIDServicesSetProximityEventsClient()
{
  NSObject *v0;
  uint8_t v1[16];

  BKLogCommon();
  v0 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v0, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)v1 = 0;
    _os_log_error_impl(&dword_18A0F0000, v0, OS_LOG_TYPE_ERROR, "BKSHIDServicesSetProximityEventsClient is no longer supported; set up a dispatching rule for proximity events with"
      " BKSHIDEventDeliveryManager instead",
      v1,
      2u);
  }

}

uint64_t BKSHIDServicesResetProximityCalibration()
{
  mach_port_t v0;

  v0 = _BKSServerPortHelper("com.apple.backboard.hid.services", BKSHIDServerPort, &BKSHIDServerMachPort, (void (__cdecl *)(CFMachPortRef, void *))_InvalidateHIDServicesPort);
  return _BKSHIDResetProximityCalibration(v0);
}

const __CFString *NSStringFromBKSHIDUILockSource(unint64_t a1)
{
  if (a1 > 3)
    return CFSTR("<unknown>");
  else
    return off_1E1E9FF08[a1];
}

__CFString *NSStringFromBKSHIDUILockState(uint64_t a1)
{
  __int16 v1;
  void *v2;
  void *v3;
  __CFString *v4;

  if (!a1)
  {
    v4 = CFSTR("<none>");
    return v4;
  }
  v1 = a1;
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if ((v1 & 0x20) != 0)
  {
    objc_msgSend(v2, "addObject:", CFSTR("disableProximity"));
    if ((v1 & 0x10) == 0)
    {
LABEL_4:
      if ((v1 & 0x40) == 0)
        goto LABEL_5;
      goto LABEL_14;
    }
  }
  else if ((v1 & 0x10) == 0)
  {
    goto LABEL_4;
  }
  objc_msgSend(v3, "addObject:", CFSTR("disableMultitouch"));
  if ((v1 & 0x40) == 0)
  {
LABEL_5:
    if ((v1 & 0x80) == 0)
      goto LABEL_6;
    goto LABEL_15;
  }
LABEL_14:
  objc_msgSend(v3, "addObject:", CFSTR("disableTapToWake"));
  if ((v1 & 0x80) == 0)
  {
LABEL_6:
    if ((v1 & 0x100) == 0)
      goto LABEL_7;
LABEL_16:
    objc_msgSend(v3, "addObject:", CFSTR("disableCoverGesture"));
    if ((v1 & 0x200) == 0)
      goto LABEL_9;
    goto LABEL_8;
  }
LABEL_15:
  objc_msgSend(v3, "addObject:", CFSTR("pocketTouchMode"));
  if ((v1 & 0x100) != 0)
    goto LABEL_16;
LABEL_7:
  if ((v1 & 0x200) != 0)
LABEL_8:
    objc_msgSend(v3, "addObject:", CFSTR("disableAlwaysOnGestures"));
LABEL_9:
  objc_msgSend(v3, "componentsJoinedByString:", CFSTR(","));
  v4 = (__CFString *)objc_claimAutoreleasedReturnValue();

  return v4;
}

void BKSHIDServicesSetHIDUILockedState(int a1)
{
  char v1;

  if (a1)
    v1 = 48;
  else
    v1 = 0;
  BKSHIDServicesSetHIDUILockedStateWithSource(0, v1);
}

void BKSHIDServicesSetHIDUILockedStateWithSource(uint64_t a1, char a2)
{
  void *v4;
  id v5;
  void *v6;
  uint64_t v7;
  void *v8;
  id v9;
  _QWORD v10[5];
  BOOL v11;
  BOOL v12;
  BOOL v13;
  BOOL v14;

  os_unfair_lock_lock((os_unfair_lock_t)&BKSHIDServicesSetHIDUILockedStateWithSource_lock);
  v4 = (void *)BKSHIDServicesSetHIDUILockedStateWithSource_sPrevailingSensorStateAssertion;
  BKSHIDServicesSetHIDUILockedStateWithSource_sPrevailingSensorStateAssertion = 0;
  v5 = v4;

  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __BKSHIDServicesSetHIDUILockedStateWithSource_block_invoke;
  v10[3] = &__block_descriptor_44_e35_v16__0__BKSMutableHIDUISensorMode_8l;
  v10[4] = a1;
  v11 = (a2 & 0x10) != 0;
  v12 = (a2 & 0x40) != 0;
  v13 = (a2 & 0x90) == 128;
  v14 = (a2 & 0x20) != 0;
  +[BKSHIDUISensorMode buildModeForReason:builder:](BKSHIDUISensorMode, "buildModeForReason:builder:", CFSTR("BKSHIDServicesSetHIDUILockedState"), v10);
  v9 = (id)objc_claimAutoreleasedReturnValue();
  +[BKSHIDUISensorService sharedInstance](BKSHIDUISensorService, "sharedInstance");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "requestUISensorMode:", v9);
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = (void *)BKSHIDServicesSetHIDUILockedStateWithSource_sPrevailingSensorStateAssertion;
  BKSHIDServicesSetHIDUILockedStateWithSource_sPrevailingSensorStateAssertion = v7;

  objc_msgSend(v5, "invalidate");
  os_unfair_lock_unlock((os_unfair_lock_t)&BKSHIDServicesSetHIDUILockedStateWithSource_lock);

}

BOOL BKSHIDServicesGetObjectInProximityIgnoresTouches()
{
  int v0;
  char v2;

  v2 = 0;
  v0 = _BKSServerPortHelper("com.apple.backboard.hid.services", BKSHIDServerPort, &BKSHIDServerMachPort, (void (__cdecl *)(CFMachPortRef, void *))_InvalidateHIDServicesPort);
  _BKSHIDGetObjectInProximityIgnoresTouches(v0, &v2);
  return v2 != 0;
}

uint64_t BKSHIDServicesSetObjectInProximityIgnoresTouches(char a1)
{
  mach_port_t v2;

  v2 = _BKSServerPortHelper("com.apple.backboard.hid.services", BKSHIDServerPort, &BKSHIDServerMachPort, (void (__cdecl *)(CFMachPortRef, void *))_InvalidateHIDServicesPort);
  return _BKSHIDSetObjectInProximityIgnoresTouches(v2, a1);
}

uint64_t BKSHIDServicesGetObjectWithinProximity()
{
  int v0;
  unsigned __int8 v2;

  v2 = 0;
  v0 = _BKSServerPortHelper("com.apple.backboard.hid.services", BKSHIDServerPort, &BKSHIDServerMachPort, (void (__cdecl *)(CFMachPortRef, void *))_InvalidateHIDServicesPort);
  _BKSHIDGetObjectWithinProximity(v0, &v2);
  return v2;
}

uint64_t BKSHIDServicesProximityDetectionActive()
{
  int v0;
  unsigned __int8 v2;

  v2 = 0;
  v0 = _BKSServerPortHelper("com.apple.backboard.hid.services", BKSHIDServerPort, &BKSHIDServerMachPort, (void (__cdecl *)(CFMachPortRef, void *))_InvalidateHIDServicesPort);
  _BKSHIDGetProximityDetectionActive(v0, &v2);
  return v2;
}

__CFString *NSStringFromBKSHIDServicesHumanPresenceStatus(uint64_t a1)
{
  char v1;
  id v2;
  void *v3;
  void *v4;
  __CFString *v5;

  if (!a1)
  {
    v5 = CFSTR("unsupported");
    return v5;
  }
  v1 = a1;
  v2 = objc_alloc_init(MEMORY[0x1E0CB37A0]);
  v3 = v2;
  if ((v1 & 1) != 0)
  {
    objc_msgSend(v2, "appendString:", CFSTR("has-presence "));
    if ((v1 & 2) == 0)
    {
LABEL_4:
      if ((v1 & 4) == 0)
        goto LABEL_5;
LABEL_12:
      objc_msgSend(v3, "appendString:", CFSTR("received-presence "));
      if ((v1 & 8) == 0)
        goto LABEL_7;
      goto LABEL_6;
    }
  }
  else if ((v1 & 2) == 0)
  {
    goto LABEL_4;
  }
  objc_msgSend(v3, "appendString:", CFSTR("has-proximity "));
  if ((v1 & 4) != 0)
    goto LABEL_12;
LABEL_5:
  if ((v1 & 8) != 0)
LABEL_6:
    objc_msgSend(v3, "appendString:", CFSTR("received-proximity "));
LABEL_7:
  objc_msgSend(MEMORY[0x1E0CB3500], "whitespaceCharacterSet");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringByTrimmingCharactersInSet:", v4);
  v5 = (__CFString *)objc_claimAutoreleasedReturnValue();

  return v5;
}

void BKSHIDServicesGetHumanPresenceStatus(void *a1, _QWORD *a2, BOOL *a3, _DWORD *a4)
{
  __CFString *v7;
  mach_port_name_t v8;
  int v9;
  char v10;
  unsigned int v11;
  char buffer[1024];
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v7 = a1;
  bzero(buffer, 0x400uLL);
  if (!v7 || CFStringGetCString(v7, buffer, 1024, 0x8000100u))
  {
    v11 = 0;
    v10 = 0;
    v9 = 0;
    v8 = _BKSServerPortHelper("com.apple.backboard.hid.services", BKSHIDServerPort, &BKSHIDServerMachPort, (void (__cdecl *)(CFMachPortRef, void *))_InvalidateHIDServicesPort);
    _BKSHIDGetHumanPresenceStatus(v8, buffer, &v11, &v10, &v9);
    if (a2)
      *a2 = v11;
    if (a3)
      *a3 = v10 != 0;
    if (a4)
      *a4 = v9;
  }

}

BOOL BKSHIDServicesIsCapsLockLightOn()
{
  int v0;
  char v2;

  v2 = 0;
  v0 = _BKSServerPortHelper("com.apple.backboard.hid.services", BKSHIDServerPort, &BKSHIDServerMachPort, (void (__cdecl *)(CFMachPortRef, void *))_InvalidateHIDServicesPort);
  _BKSHIDIsCapsLockLightOn(v0, 0, &v2);
  return v2 != 0;
}

BOOL BKSHIDKeyboardIsCapsLockLightOn(uint64_t a1)
{
  int v2;
  char v4;

  v4 = 0;
  v2 = _BKSServerPortHelper("com.apple.backboard.hid.services", BKSHIDServerPort, &BKSHIDServerMachPort, (void (__cdecl *)(CFMachPortRef, void *))_InvalidateHIDServicesPort);
  _BKSHIDIsCapsLockLightOn(v2, a1, &v4);
  return v4 != 0;
}

uint64_t BKSHIDServicesSetCapsLockRomanSwitchMode(int a1)
{
  char v1;
  mach_port_t v2;

  v1 = a1 != 0;
  v2 = _BKSServerPortHelper("com.apple.backboard.hid.services", BKSHIDServerPort, &BKSHIDServerMachPort, (void (__cdecl *)(CFMachPortRef, void *))_InvalidateHIDServicesPort);
  return _BKSHIDSetCapsLockRomanSwitchMode(v2, 0, v1);
}

uint64_t BKSHIDKeyboardSetCapsLockRomanSwitchMode(uint64_t a1, char a2)
{
  mach_port_t v4;

  v4 = _BKSServerPortHelper("com.apple.backboard.hid.services", BKSHIDServerPort, &BKSHIDServerMachPort, (void (__cdecl *)(CFMachPortRef, void *))_InvalidateHIDServicesPort);
  return _BKSHIDSetCapsLockRomanSwitchMode(v4, a1, a2);
}

uint64_t BKSHIDServicesSetCapsLockDelayOverride(double a1)
{
  mach_port_t v2;

  v2 = _BKSServerPortHelper("com.apple.backboard.hid.services", BKSHIDServerPort, &BKSHIDServerMachPort, (void (__cdecl *)(CFMachPortRef, void *))_InvalidateHIDServicesPort);
  return _BKSHIDSetCapsLockDelayOverride(v2, 0, a1);
}

uint64_t BKSHIDKeyboardSetCapsLockDelayOverride(uint64_t a1, double a2)
{
  mach_port_t v4;

  v4 = _BKSServerPortHelper("com.apple.backboard.hid.services", BKSHIDServerPort, &BKSHIDServerMachPort, (void (__cdecl *)(CFMachPortRef, void *))_InvalidateHIDServicesPort);
  return _BKSHIDSetCapsLockDelayOverride(v4, a1, a2);
}

void BKSHIDServicesSetHardwareKeyboardLayout(void *a1)
{
  BKSHIDKeyboardSetLayout(0, a1);
}

void BKSHIDKeyboardSetLayout(uint64_t a1, void *a2)
{
  __CFString *v3;
  mach_port_name_t v4;
  char buffer[1024];
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  bzero(buffer, 0x400uLL);
  if (!v3 || CFStringGetCString(v3, buffer, 1024, 0x8000100u))
  {
    v4 = _BKSServerPortHelper("com.apple.backboard.hid.services", BKSHIDServerPort, &BKSHIDServerMachPort, (void (__cdecl *)(CFMachPortRef, void *))_InvalidateHIDServicesPort);
    _BKSHIDSetHardwareKeyboardLayout(v4, a1, buffer);
  }

}

id BKSHIDServicesGetHardwareKeyboardLanguage()
{
  void *v0;
  void *v1;

  BKSHIDKeyboardGetDeviceProperties(0);
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "language");
  v1 = (void *)objc_claimAutoreleasedReturnValue();

  return v1;
}

id BKSHIDKeyboardGetDeviceProperties(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;

  +[BKSHIDKeyboardService sharedInstance](BKSHIDKeyboardService, "sharedInstance");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "keyboardDeviceForSenderID:", a1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "_properties");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

uint64_t BKSHIDServicesCapsLockKeyHasLanguageSwitchLabel()
{
  void *v0;
  uint64_t v1;

  BKSHIDKeyboardGetDeviceProperties(0);
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  v1 = objc_msgSend(v0, "capsLockKeyHasLanguageSwitchLabel");

  return v1;
}

BOOL BKSHIDKeyboardWantsStandardTypeOverride(uint64_t a1)
{
  int v2;
  char v4;

  v4 = 0;
  v2 = _BKSServerPortHelper("com.apple.backboard.hid.services", BKSHIDServerPort, &BKSHIDServerMachPort, (void (__cdecl *)(CFMachPortRef, void *))_InvalidateHIDServicesPort);
  _BKSHIDKeyboardWantsStandardTypeOverride(v2, a1, &v4);
  return v4 != 0;
}

uint64_t BKSHIDKeyboardSetCapsLockActive(uint64_t a1, char a2)
{
  mach_port_t v4;
  void *v6;
  void *v7;
  int v8;
  void *v9;
  __int16 v10;
  const __CFString *v11;
  __int16 v12;
  int v13;
  __int16 v14;
  void *v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  if (!a1)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("BKSHIDKeyboardSetCapsLockActive requires a specific keyboard service senderID"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "void BKSHIDKeyboardSetCapsLockActive(IOHIDEventSenderID, BOOL)");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = 138544130;
      v9 = v7;
      v10 = 2114;
      v11 = CFSTR("BKSHIDServices.m");
      v12 = 1024;
      v13 = 458;
      v14 = 2114;
      v15 = v6;
      _os_log_error_impl(&dword_18A0F0000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "failure in %{public}@ (%{public}@:%i) : %{public}@", (uint8_t *)&v8, 0x26u);

    }
    objc_msgSend(objc_retainAutorelease(v6), "UTF8String");
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x18A10E3D0);
  }
  v4 = _BKSServerPortHelper("com.apple.backboard.hid.services", BKSHIDServerPort, &BKSHIDServerMachPort, (void (__cdecl *)(CFMachPortRef, void *))_InvalidateHIDServicesPort);
  return _BKSHIDSetCapsLockActive(v4, a1, a2);
}

uint64_t BKSHIDServicesSetStandardType(uint64_t a1, int a2)
{
  mach_port_t v4;

  v4 = _BKSServerPortHelper("com.apple.backboard.hid.services", BKSHIDServerPort, &BKSHIDServerMachPort, (void (__cdecl *)(CFMachPortRef, void *))_InvalidateHIDServicesPort);
  return _BKSHIDSetStandardType(v4, a1, a2);
}

void BKSHIDServicesSetAuthenticatedKeyCommands(void *a1)
{
  id v1;
  void *v2;
  int v3;
  id v4;
  int v5;
  int v6;
  NSObject *v7;
  const char *v8;
  NSObject *v9;
  uint32_t v10;
  int v11;
  id v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v1 = a1;
  objc_msgSend(MEMORY[0x1E0DE7910], "bs_secureDataFromObject:", v1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v2)
  {
    BKLogBacklight();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      v11 = 138543362;
      v12 = v1;
      v8 = "BKSHIDServicesSetBacklightFeatures failed to encode %{public}@";
      v9 = v7;
      v10 = 12;
      goto LABEL_9;
    }
LABEL_6:

    goto LABEL_7;
  }
  v3 = _BKSServerPortHelper("com.apple.backboard.hid.services", BKSHIDServerPort, &BKSHIDServerMachPort, (void (__cdecl *)(CFMachPortRef, void *))_InvalidateHIDServicesPort);
  v4 = objc_retainAutorelease(v2);
  v5 = _BKSHIDSetAuthenticatedKeyCommands(v3, objc_msgSend(v4, "bytes"), objc_msgSend(v4, "length"));
  if (v5)
  {
    v6 = v5;
    BKLogCommon();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      v11 = 67109120;
      LODWORD(v12) = v6;
      v8 = "Error sending authenticatedKeyCommands: 0x%x";
      v9 = v7;
      v10 = 8;
LABEL_9:
      _os_log_error_impl(&dword_18A0F0000, v9, OS_LOG_TYPE_ERROR, v8, (uint8_t *)&v11, v10);
      goto LABEL_6;
    }
    goto LABEL_6;
  }
LABEL_7:

}

uint64_t BKSHIDServicesGetRingerState()
{
  int v0;
  unsigned int v2;

  v2 = 0;
  v0 = _BKSServerPortHelper("com.apple.backboard.hid.services", BKSHIDServerPort, &BKSHIDServerMachPort, (void (__cdecl *)(CFMachPortRef, void *))_InvalidateHIDServicesPort);
  _BKSHIDGetRingerState(v0, &v2);
  return v2;
}

uint64_t BKSHIDServicesIsSmartCoverClosed()
{
  int v0;
  unsigned __int8 v2;

  v2 = 0;
  v0 = _BKSServerPortHelper("com.apple.backboard.hid.services", BKSHIDServerPort, &BKSHIDServerMachPort, (void (__cdecl *)(CFMachPortRef, void *))_InvalidateHIDServicesPort);
  _BKSHIDIsSmartCoverClosed(v0, &v2);
  return v2;
}

uint64_t BKSHIDServicesCancelButtonEventsFromSenderID(uint64_t a1, int a2, int a3)
{
  mach_port_t v6;

  v6 = _BKSServerPortHelper("com.apple.backboard.hid.services", BKSHIDServerPort, &BKSHIDServerMachPort, (void (__cdecl *)(CFMachPortRef, void *))_InvalidateHIDServicesPort);
  return _BKSHIDCancelButtonEventsFromSenderID(v6, a1, a2, a3);
}

uint64_t BKSHIDServicesSetTouchPadAvailability(unsigned int a1)
{
  __CFString *v2;
  const char *v3;
  int v4;
  uint64_t result;

  v2 = objc_retainAutorelease(CFSTR("com.apple.backboardd.touchpad-availability"));
  v3 = (const char *)objc_msgSend(CFSTR("com.apple.backboardd.touchpad-availability"), "UTF8String");
  v4 = BKSHIDServicesSetTouchPadAvailability___NotifyTouchPadAvailabilityToken;
  if (BKSHIDServicesSetTouchPadAvailability___NotifyTouchPadAvailabilityToken != -1)
    goto LABEL_2;
  result = notify_register_check(v3, &BKSHIDServicesSetTouchPadAvailability___NotifyTouchPadAvailabilityToken);
  if (!(_DWORD)result)
  {
    v4 = BKSHIDServicesSetTouchPadAvailability___NotifyTouchPadAvailabilityToken;
LABEL_2:
    notify_set_state(v4, a1);
    return notify_post(v3);
  }
  return result;
}

uint64_t BKSHIDServicesCancelTouchesOnAllDisplays()
{
  mach_port_t v0;

  v0 = _BKSServerPortHelper("com.apple.backboard.hid.services", BKSHIDServerPort, &BKSHIDServerMachPort, (void (__cdecl *)(CFMachPortRef, void *))_InvalidateHIDServicesPort);
  return _BKSHIDCancelTouchesOnAllDisplays(v0);
}

void BKSHIDServicesCancelTouchesWithIdentifiers(void *a1)
{
  id v1;
  uint64_t v2;
  void *v3;
  NSObject *v4;
  const char *v5;
  NSObject *v6;
  uint32_t v7;
  int v8;
  id v9;
  int v10;
  int v11;
  int v12;
  id v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v1 = a1;
  objc_msgSend(MEMORY[0x1E0DE7910], "bs_secureDataFromObject:", v1);
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = (void *)v2;
  if (v1 && !v2)
  {
    BKLogCommon();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      v12 = 138543362;
      v13 = v1;
      v5 = "Error encoding touchIdentifiers: %{public}@";
      v6 = v4;
      v7 = 12;
LABEL_10:
      _os_log_error_impl(&dword_18A0F0000, v6, OS_LOG_TYPE_ERROR, v5, (uint8_t *)&v12, v7);
      goto LABEL_7;
    }
    goto LABEL_7;
  }
  v8 = _BKSServerPortHelper("com.apple.backboard.hid.services", BKSHIDServerPort, &BKSHIDServerMachPort, (void (__cdecl *)(CFMachPortRef, void *))_InvalidateHIDServicesPort);
  v9 = objc_retainAutorelease(v3);
  v10 = _BKSHIDCancelTouchesWithIdentifiers(v8, objc_msgSend(v9, "bytes"), objc_msgSend(v9, "length"));
  if (v10)
  {
    v11 = v10;
    BKLogCommon();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      v12 = 67109120;
      LODWORD(v13) = v11;
      v5 = "Error sending touchIdentifiers: 0x%x";
      v6 = v4;
      v7 = 8;
      goto LABEL_10;
    }
LABEL_7:

  }
}

void BKSHIDServicesClaimGenericGestureFocus(void *a1, int a2)
{
  __CFString *v3;
  mach_port_name_t v4;
  int v5;
  int v6;
  NSObject *v7;
  const char *v8;
  NSObject *v9;
  uint32_t v10;
  int v11;
  __CFString *v12;
  char buffer[1024];
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v3 = a1;
  bzero(buffer, 0x400uLL);
  if (v3 && !CFStringGetCString(v3, buffer, 1024, 0x8000100u))
  {
    BKLogCommon();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      v11 = 138412290;
      v12 = v3;
      v8 = "Could not encode displayUUID: '%@'";
      v9 = v7;
      v10 = 12;
      goto LABEL_10;
    }
LABEL_7:

    goto LABEL_8;
  }
  v4 = _BKSServerPortHelper("com.apple.backboard.hid.services", BKSHIDServerPort, &BKSHIDServerMachPort, (void (__cdecl *)(CFMachPortRef, void *))_InvalidateHIDServicesPort);
  v5 = _BKSHIDClaimGenericGestureFocus(v4, buffer, a2);
  if (v5)
  {
    v6 = v5;
    BKLogCommon();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      v11 = 67109120;
      LODWORD(v12) = v6;
      v8 = "Error sending generic gesture destination: 0x%x";
      v9 = v7;
      v10 = 8;
LABEL_10:
      _os_log_error_impl(&dword_18A0F0000, v9, OS_LOG_TYPE_ERROR, v8, (uint8_t *)&v11, v10);
      goto LABEL_7;
    }
    goto LABEL_7;
  }
LABEL_8:

}

void BKSHIDServicesExcludeCAContextsFromHitTestingForZoomSenders(void *a1)
{
  id v1;
  void *v2;
  NSObject *v3;
  id v4;
  int v5;
  int v6;
  int v7;
  int v8;
  id v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v1 = a1;
  if (v1)
  {
    objc_msgSend(MEMORY[0x1E0DE7910], "bs_secureDataFromObject:", v1);
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v2)
    {
      BKLogCommon();
      v3 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
      {
        v8 = 138543362;
        v9 = v1;
        _os_log_error_impl(&dword_18A0F0000, v3, OS_LOG_TYPE_ERROR, "Error encoding contextIDs: %{public}@", (uint8_t *)&v8, 0xCu);
      }
      v4 = 0;
LABEL_10:

      goto LABEL_11;
    }
  }
  else
  {
    v2 = 0;
  }
  v5 = _BKSServerPortHelper("com.apple.backboard.hid.services", BKSHIDServerPort, &BKSHIDServerMachPort, (void (__cdecl *)(CFMachPortRef, void *))_InvalidateHIDServicesPort);
  v4 = objc_retainAutorelease(v2);
  v6 = _BKSHIDExcludeCAContextsFromHitTestingForZoomSenders(v5, objc_msgSend(v4, "bytes"), objc_msgSend(v4, "length"));
  if (v6)
  {
    v7 = v6;
    BKLogCommon();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    {
      v8 = 67109120;
      LODWORD(v9) = v7;
      _os_log_error_impl(&dword_18A0F0000, v3, OS_LOG_TYPE_ERROR, "Error sending contextIDs: 0x%x", (uint8_t *)&v8, 8u);
    }
    goto LABEL_10;
  }
LABEL_11:

}

void _BKSHIDServicesApplyButtonDefinitions(void *a1)
{
  id v1;
  uint64_t v2;
  void *v3;
  NSObject *v4;
  int v5;
  id v6;
  int v7;
  int v8;
  int v9;
  id v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v1 = a1;
  objc_msgSend(MEMORY[0x1E0DE7910], "bs_secureDataFromObject:", v1);
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = (void *)v2;
  if (v1 && !v2)
  {
    BKLogCommon();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      v9 = 138543362;
      v10 = v1;
      _os_log_impl(&dword_18A0F0000, v4, OS_LOG_TYPE_DEFAULT, "Error encoding button definitions: %{public}@", (uint8_t *)&v9, 0xCu);
    }
LABEL_8:

    goto LABEL_9;
  }
  v5 = _BKSServerPortHelper("com.apple.backboard.hid.services", BKSHIDServerPort, &BKSHIDServerMachPort, (void (__cdecl *)(CFMachPortRef, void *))_InvalidateHIDServicesPort);
  v6 = objc_retainAutorelease(v3);
  v7 = _BKSHIDApplyButtonDefinitions(v5, objc_msgSend(v6, "bytes"), objc_msgSend(v6, "length"));
  if (v7)
  {
    v8 = v7;
    BKLogCommon();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      v9 = 67109120;
      LODWORD(v10) = v8;
      _os_log_error_impl(&dword_18A0F0000, v4, OS_LOG_TYPE_ERROR, "Error sending button definitions: 0x%x", (uint8_t *)&v9, 8u);
    }
    goto LABEL_8;
  }
LABEL_9:

}

void BKSHIDServicesRequestHapticFeedback(void *a1)
{
  id v1;
  void *v2;
  void *v3;
  int v4;
  id v5;
  int v6;
  int v7;
  NSObject *v8;
  void *v9;
  objc_class *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  objc_class *v15;
  void *v16;
  objc_class *v17;
  void *v18;
  void *v19;
  void *v20;
  uint8_t buf[4];
  void *v22;
  __int16 v23;
  const __CFString *v24;
  __int16 v25;
  int v26;
  __int16 v27;
  void *v28;
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  v1 = a1;
  if (!v1)
  {
    v9 = (void *)MEMORY[0x1E0CB3940];
    v10 = (objc_class *)objc_opt_class();
    NSStringFromClass(v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "stringWithFormat:", CFSTR("Value for '%@' was unexpectedly nil. Expected %@."), CFSTR("request"), v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "void BKSHIDServicesRequestHapticFeedback(BKSHIDHapticFeedbackRequest *__strong _Nonnull)");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138544130;
      v22 = v13;
      v23 = 2114;
      v24 = CFSTR("BKSHIDServices.m");
      v25 = 1024;
      v26 = 665;
      v27 = 2114;
      v28 = v12;
      _os_log_error_impl(&dword_18A0F0000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "failure in %{public}@ (%{public}@:%i) : %{public}@", buf, 0x26u);

    }
    objc_msgSend(objc_retainAutorelease(v12), "UTF8String");
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x18A10EFFCLL);
  }
  v2 = v1;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    v14 = (void *)MEMORY[0x1E0CB3940];
    v15 = (objc_class *)objc_msgSend(v2, "classForCoder");
    if (!v15)
      v15 = (objc_class *)objc_opt_class();
    NSStringFromClass(v15);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = (objc_class *)objc_opt_class();
    NSStringFromClass(v17);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "stringWithFormat:", CFSTR("Value for '%@' was of unexpected class %@. Expected %@."), CFSTR("request"), v16, v18);
    v19 = (void *)objc_claimAutoreleasedReturnValue();

    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "void BKSHIDServicesRequestHapticFeedback(BKSHIDHapticFeedbackRequest *__strong _Nonnull)");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138544130;
      v22 = v20;
      v23 = 2114;
      v24 = CFSTR("BKSHIDServices.m");
      v25 = 1024;
      v26 = 665;
      v27 = 2114;
      v28 = v19;
      _os_log_error_impl(&dword_18A0F0000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "failure in %{public}@ (%{public}@:%i) : %{public}@", buf, 0x26u);

    }
    objc_msgSend(objc_retainAutorelease(v19), "UTF8String");
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x18A10F114);
  }

  objc_msgSend(MEMORY[0x1E0DE7910], "bs_secureDataFromObject:", v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v3)
  {
    BKLogCommon();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      v22 = v2;
      _os_log_impl(&dword_18A0F0000, v8, OS_LOG_TYPE_DEFAULT, "Error encoding haptic feedback request: %{public}@", buf, 0xCu);
    }
    goto LABEL_9;
  }
  v4 = _BKSServerPortHelper("com.apple.backboard.hid.services", BKSHIDServerPort, &BKSHIDServerMachPort, (void (__cdecl *)(CFMachPortRef, void *))_InvalidateHIDServicesPort);
  v5 = objc_retainAutorelease(v3);
  v6 = _BKSHIDRequestHapticFeedback(v4, objc_msgSend(v5, "bytes"), objc_msgSend(v5, "length"));
  if (v6)
  {
    v7 = v6;
    BKLogCommon();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 67109120;
      LODWORD(v22) = v7;
      _os_log_error_impl(&dword_18A0F0000, v8, OS_LOG_TYPE_ERROR, "Error sending haptic feedback request: 0x%x", buf, 8u);
    }
LABEL_9:

  }
}

void _BKSHIDServicesPostTouchAnnotations(void *a1)
{
  id v1;
  uint64_t v2;
  void *v3;
  NSObject *v4;
  int v5;
  id v6;
  int v7;
  int v8;
  int v9;
  id v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v1 = a1;
  objc_msgSend(MEMORY[0x1E0DE7910], "bs_secureDataFromObject:", v1);
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = (void *)v2;
  if (v1 && !v2)
  {
    BKLogCommon();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      v9 = 138543362;
      v10 = v1;
      _os_log_impl(&dword_18A0F0000, v4, OS_LOG_TYPE_DEFAULT, "Error encoding touch annotations: %{public}@", (uint8_t *)&v9, 0xCu);
    }
LABEL_8:

    goto LABEL_9;
  }
  v5 = _BKSServerPortHelper("com.apple.backboard.hid.services", BKSHIDServerPort, &BKSHIDServerMachPort, (void (__cdecl *)(CFMachPortRef, void *))_InvalidateHIDServicesPort);
  v6 = objc_retainAutorelease(v3);
  v7 = _BKSHIDPostTouchAnnotations(v5, objc_msgSend(v6, "bytes"), objc_msgSend(v6, "length"));
  if (v7)
  {
    v8 = v7;
    BKLogCommon();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      v9 = 67109120;
      LODWORD(v10) = v8;
      _os_log_error_impl(&dword_18A0F0000, v4, OS_LOG_TYPE_ERROR, "Error sending touch annotations: 0x%x", (uint8_t *)&v9, 8u);
    }
    goto LABEL_8;
  }
LABEL_9:

}

const __CFString *NSStringFromBKSHIDServicesUserEventTimerMode(unsigned int a1)
{
  if (a1 > 3)
    return CFSTR("(unknown)");
  else
    return off_1E1E9FF28[a1];
}

uint64_t BKSHIDServicesResetUserEventTimer(unsigned int a1, double a2)
{
  BOOL v3;
  double v5;
  NSObject *v6;
  const __CFString *v7;
  double v8;
  mach_port_t v9;
  int v11;
  const __CFString *v12;
  __int16 v13;
  double v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  if (a1)
    v3 = a2 < 0.0;
  else
    v3 = 1;
  if (!v3 && a2 < 9223372040.0)
    v5 = a2;
  else
    v5 = 9223372040.0;
  BKLogIdleTimer();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    if (a1 > 3)
      v7 = CFSTR("(unknown)");
    else
      v7 = off_1E1E9FF28[a1];
    v8 = INFINITY;
    if (v5 != 9223372040.0)
      v8 = v5;
    v11 = 138543618;
    v12 = v7;
    v13 = 2048;
    v14 = v8;
    _os_log_impl(&dword_18A0F0000, v6, OS_LOG_TYPE_INFO, "Resetting user event timer to %{public}@ with duration %gs", (uint8_t *)&v11, 0x16u);
  }

  v9 = _BKSServerPortHelper("com.apple.backboard.hid.services", BKSHIDServerPort, &BKSHIDServerMachPort, (void (__cdecl *)(CFMachPortRef, void *))_InvalidateHIDServicesPort);
  return _BKSHIDResetUserEventTimer(v9, a1, v5);
}

uint64_t BKSHIDServicesNotifyOnNextUserEvent()
{
  mach_port_t v0;

  v0 = _BKSServerPortHelper("com.apple.backboard.hid.services", BKSHIDServerPort, &BKSHIDServerMachPort, (void (__cdecl *)(CFMachPortRef, void *))_InvalidateHIDServicesPort);
  return _BKSHIDNotifyOnNextUserEvent(v0);
}

BOOL BKSHIDServicesSafeToResetIdleTimer()
{
  int v0;
  char v2;

  v2 = 0;
  v0 = _BKSServerPortHelper("com.apple.backboard.hid.services", BKSHIDServerPort, &BKSHIDServerMachPort, (void (__cdecl *)(CFMachPortRef, void *))_InvalidateHIDServicesPort);
  _BKSHIDSafeToResetIdleTimer(v0, &v2);
  return v2 != 0;
}

uint64_t BKHIDServicesGetCurrentDeviceOrientation()
{
  int v0;
  int v2;

  v2 = 0;
  v0 = _BKSServerPortHelper("com.apple.backboard.hid.services", BKSHIDServerPort, &BKSHIDServerMachPort, (void (__cdecl *)(CFMachPortRef, void *))_InvalidateHIDServicesPort);
  _BKSHIDGetCurrentDeviceOrientation(v0, &v2);
  return v2;
}

void BKSHIDServicesSetOrientationClient(void *a1, char a2)
{
  __CFString *v3;
  __CFString *v4;
  mach_port_name_t v5;
  _OWORD v6[64];
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  v3 = a1;
  memset(&v6[30], 0, 32);
  if (v3)
    v4 = v3;
  else
    v4 = &stru_1E1EA2860;
  memset(v6, 0, 480);
  if (CFStringGetCString(v4, (char *)v6, 1024, 0x8000100u))
  {
    v5 = _BKSServerPortHelper("com.apple.backboard.hid.services", BKSHIDServerPort, &BKSHIDServerMachPort, (void (__cdecl *)(CFMachPortRef, void *))_InvalidateHIDServicesPort);
    _BKSHIDSetOrientationClient(v5, (const char *)v6, a2);
  }

}

uint64_t BKSHIDServicesLockOrientation(uint64_t result, char a2)
{
  int v3;
  int v4;
  int v5;
  int v6;
  uint64_t v7;

  v3 = result;
  v4 = __BKLockedOrientation;
  if (__BKLockedOrientation == -2)
  {
    v7 = 0;
    v5 = _BKSServerPortHelper("com.apple.backboard.hid.services", BKSHIDServerPort, &BKSHIDServerMachPort, (void (__cdecl *)(CFMachPortRef, void *))_InvalidateHIDServicesPort);
    result = _BKSHIDIsOrientationLockedWithOrientation(v5, (_DWORD *)&v7 + 1, &v7);
    if (HIDWORD(v7))
      v4 = v7;
    else
      v4 = -1;
    __BKLockedOrientation = v4;
  }
  if (v4 == -1)
  {
    __BKLockedOrientation = v3;
    v6 = _BKSServerPortHelper("com.apple.backboard.hid.services", BKSHIDServerPort, &BKSHIDServerMachPort, (void (__cdecl *)(CFMachPortRef, void *))_InvalidateHIDServicesPort);
    return _BKSHIDLockOrientation(v6, v3, a2);
  }
  return result;
}

void BKSHIDServicesUnlockOrientation()
{
  int v0;
  int v1;
  mach_port_t v2;
  uint64_t v3;

  v0 = __BKLockedOrientation;
  if (__BKLockedOrientation == -2)
  {
    v3 = 0;
    v1 = _BKSServerPortHelper("com.apple.backboard.hid.services", BKSHIDServerPort, &BKSHIDServerMachPort, (void (__cdecl *)(CFMachPortRef, void *))_InvalidateHIDServicesPort);
    _BKSHIDIsOrientationLockedWithOrientation(v1, (_DWORD *)&v3 + 1, &v3);
    if (HIDWORD(v3))
      v0 = v3;
    else
      v0 = -1;
    __BKLockedOrientation = v0;
  }
  if (v0 != -1)
  {
    __BKLockedOrientation = -1;
    v2 = _BKSServerPortHelper("com.apple.backboard.hid.services", BKSHIDServerPort, &BKSHIDServerMachPort, (void (__cdecl *)(CFMachPortRef, void *))_InvalidateHIDServicesPort);
    _BKSHIDUnlockOrientation(v2);
  }
}

BOOL BKSHIDServicesIsOrientationLockedWithOrientation(_QWORD *a1)
{
  int v2;
  int v3;
  int v4;
  uint64_t v6;

  v2 = __BKLockedOrientation;
  if (__BKLockedOrientation == -2)
  {
    v6 = 0;
    v3 = _BKSServerPortHelper("com.apple.backboard.hid.services", BKSHIDServerPort, &BKSHIDServerMachPort, (void (__cdecl *)(CFMachPortRef, void *))_InvalidateHIDServicesPort);
    _BKSHIDIsOrientationLockedWithOrientation(v3, (_DWORD *)&v6 + 1, &v6);
    if (HIDWORD(v6))
      v2 = v6;
    else
      v2 = -1;
    __BKLockedOrientation = v2;
  }
  if (a1)
  {
    if (v2 == -1)
      v4 = 0;
    else
      v4 = v2;
    *a1 = v4;
  }
  return v2 != -1;
}

uint64_t BKSHIDServicesSetDeviceOrientationForAutomation(char a1)
{
  mach_port_t v2;

  v2 = _BKSServerPortHelper("com.apple.backboard.hid.services", BKSHIDServerPort, &BKSHIDServerMachPort, (void (__cdecl *)(CFMachPortRef, void *))_InvalidateHIDServicesPort);
  return _BKSHIDSetDeviceOrientationForAutomation(v2, a1);
}

BOOL BKSHIDServicesSetAccelerometerClientEventsEnabled(int a1, double a2, float a3, float a4, float a5)
{
  int v10;

  v10 = _BKSServerPortHelper("com.apple.backboard.hid.services", BKSHIDServerPort, &BKSHIDServerMachPort, (void (__cdecl *)(CFMachPortRef, void *))_InvalidateHIDServicesPort);
  return _BKSHIDSetAccelerometerClientEventsEnabled(v10, a1, 0, a2, a3, a4, a5) == 268435460;
}

void BKSHIDServicesSetTouchHand(uint64_t a1)
{
  uint64_t v1;
  NSObject *v2;
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  uint8_t buf[4];
  uint64_t v8;
  uint64_t v9;

  v1 = a1;
  v9 = *MEMORY[0x1E0C80C00];
  if (a1 == 1)
    goto LABEL_4;
  if (a1 == 2)
  {
    v1 = 0;
LABEL_4:
    +[BKSHIDEventSenderDescriptor anyBuiltinTouchscreenDigitizer](BKSHIDEventSenderDescriptor, "anyBuiltinTouchscreenDigitizer");
    v2 = objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", v1, CFSTR("TouchHand"));
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = v3;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v6, &v5, 1);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    BKSHIDServicesSetPersistentServiceProperties(v2, v4);

    goto LABEL_7;
  }
  BKLogTouchEvents();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 134217984;
    v8 = v1;
    _os_log_error_impl(&dword_18A0F0000, v2, OS_LOG_TYPE_ERROR, "BKSHIDServicesSetTouchHand unknown touchHand value %ld", buf, 0xCu);
  }
LABEL_7:

}

void BKSHIDServicesSetPersistentServiceProperties(void *a1, void *a2)
{
  id v3;
  id v4;
  id v5;
  void *v6;
  __CFString *v7;
  __CFString *v8;
  void *v9;
  id v10;
  uint64_t v11;
  void *v12;
  int v13;
  id v14;
  uint64_t v15;
  id v16;
  NSObject *v17;
  void *v18;
  objc_class *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  objc_class *v24;
  void *v25;
  objc_class *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  objc_class *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  objc_class *v36;
  void *v37;
  objc_class *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  id v44;
  uint8_t buf[4];
  void *v46;
  __int16 v47;
  const __CFString *v48;
  __int16 v49;
  _QWORD v50[3];

  v50[2] = *MEMORY[0x1E0C80C00];
  v3 = a1;
  v4 = a2;
  v5 = v3;
  if (!v5)
  {
    v18 = (void *)MEMORY[0x1E0CB3940];
    v19 = (objc_class *)objc_opt_class();
    NSStringFromClass(v19);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "stringWithFormat:", CFSTR("Value for '%@' was unexpectedly nil. Expected %@."), CFSTR("sender"), v20);
    v21 = (void *)objc_claimAutoreleasedReturnValue();

    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "void BKSHIDServicesSetPersistentServiceProperties(BKSHIDEventSenderDescriptor *__strong, NSDictionary<NSString *,id> *__strong)");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138544130;
      v46 = v22;
      v47 = 2114;
      v48 = CFSTR("BKSHIDServices.m");
      v49 = 1024;
      LODWORD(v50[0]) = 920;
      WORD2(v50[0]) = 2114;
      *(_QWORD *)((char *)v50 + 6) = v21;
      _os_log_error_impl(&dword_18A0F0000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "failure in %{public}@ (%{public}@:%i) : %{public}@", buf, 0x26u);

    }
    objc_msgSend(objc_retainAutorelease(v21), "UTF8String");
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x18A10FD04);
  }
  v6 = v5;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    v23 = (void *)MEMORY[0x1E0CB3940];
    v24 = (objc_class *)objc_msgSend(v6, "classForCoder");
    if (!v24)
      v24 = (objc_class *)objc_opt_class();
    NSStringFromClass(v24);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v26 = (objc_class *)objc_opt_class();
    NSStringFromClass(v26);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "stringWithFormat:", CFSTR("Value for '%@' was of unexpected class %@. Expected %@."), CFSTR("sender"), v25, v27);
    v28 = (void *)objc_claimAutoreleasedReturnValue();

    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "void BKSHIDServicesSetPersistentServiceProperties(BKSHIDEventSenderDescriptor *__strong, NSDictionary<NSString *,id> *__strong)");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138544130;
      v46 = v29;
      v47 = 2114;
      v48 = CFSTR("BKSHIDServices.m");
      v49 = 1024;
      LODWORD(v50[0]) = 920;
      WORD2(v50[0]) = 2114;
      *(_QWORD *)((char *)v50 + 6) = v28;
      _os_log_error_impl(&dword_18A0F0000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "failure in %{public}@ (%{public}@:%i) : %{public}@", buf, 0x26u);

    }
    objc_msgSend(objc_retainAutorelease(v28), "UTF8String");
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x18A10FE1CLL);
  }

  v7 = (__CFString *)v4;
  if (!v7)
  {
    v30 = (void *)MEMORY[0x1E0CB3940];
    v31 = (objc_class *)objc_opt_class();
    NSStringFromClass(v31);
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "stringWithFormat:", CFSTR("Value for '%@' was unexpectedly nil. Expected %@."), CFSTR("properties"), v32);
    v33 = (void *)objc_claimAutoreleasedReturnValue();

    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "void BKSHIDServicesSetPersistentServiceProperties(BKSHIDEventSenderDescriptor *__strong, NSDictionary<NSString *,id> *__strong)");
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138544130;
      v46 = v34;
      v47 = 2114;
      v48 = CFSTR("BKSHIDServices.m");
      v49 = 1024;
      LODWORD(v50[0]) = 921;
      WORD2(v50[0]) = 2114;
      *(_QWORD *)((char *)v50 + 6) = v33;
      _os_log_error_impl(&dword_18A0F0000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "failure in %{public}@ (%{public}@:%i) : %{public}@", buf, 0x26u);

    }
    objc_msgSend(objc_retainAutorelease(v33), "UTF8String");
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x18A10FF10);
  }
  v8 = v7;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    v35 = (void *)MEMORY[0x1E0CB3940];
    v36 = (objc_class *)-[__CFString classForCoder](v8, "classForCoder");
    if (!v36)
      v36 = (objc_class *)objc_opt_class();
    NSStringFromClass(v36);
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    v38 = (objc_class *)objc_opt_class();
    NSStringFromClass(v38);
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v35, "stringWithFormat:", CFSTR("Value for '%@' was of unexpected class %@. Expected %@."), CFSTR("properties"), v37, v39);
    v40 = (void *)objc_claimAutoreleasedReturnValue();

    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "void BKSHIDServicesSetPersistentServiceProperties(BKSHIDEventSenderDescriptor *__strong, NSDictionary<NSString *,id> *__strong)");
      v41 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138544130;
      v46 = v41;
      v47 = 2114;
      v48 = CFSTR("BKSHIDServices.m");
      v49 = 1024;
      LODWORD(v50[0]) = 921;
      WORD2(v50[0]) = 2114;
      *(_QWORD *)((char *)v50 + 6) = v40;
      _os_log_error_impl(&dword_18A0F0000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "failure in %{public}@ (%{public}@:%i) : %{public}@", buf, 0x26u);

    }
    objc_msgSend(objc_retainAutorelease(v40), "UTF8String");
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x18A110028);
  }

  if (!CFPropertyListIsValid(v8, kCFPropertyListXMLFormat_v1_0))
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("non-plistable type in %@"), v8);
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "void BKSHIDServicesSetPersistentServiceProperties(BKSHIDEventSenderDescriptor *__strong, NSDictionary<NSString *,id> *__strong)");
      v43 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138544130;
      v46 = v43;
      v47 = 2114;
      v48 = CFSTR("BKSHIDServices.m");
      v49 = 1024;
      LODWORD(v50[0]) = 923;
      WORD2(v50[0]) = 2114;
      *(_QWORD *)((char *)v50 + 6) = v42;
      _os_log_error_impl(&dword_18A0F0000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "failure in %{public}@ (%{public}@:%i) : %{public}@", buf, 0x26u);

    }
    objc_msgSend(objc_retainAutorelease(v42), "UTF8String");
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x18A1100F4);
  }
  v44 = 0;
  objc_msgSend(MEMORY[0x1E0D01838], "encodeObject:error:", v6, &v44);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v44;
  -[__CFString bs_secureEncoded](v8, "bs_secureEncoded");
  v11 = objc_claimAutoreleasedReturnValue();
  v12 = (void *)v11;
  if (v9 && v11)
  {
    v13 = _BKSServerPortHelper("com.apple.backboard.hid.services", BKSHIDServerPort, &BKSHIDServerMachPort, (void (__cdecl *)(CFMachPortRef, void *))_InvalidateHIDServicesPort);
    v14 = objc_retainAutorelease(v9);
    v15 = objc_msgSend(v14, "bytes");
    LODWORD(v14) = objc_msgSend(v14, "length");
    v16 = objc_retainAutorelease(v12);
    _BKSHIDSetPersistentServiceProperties(v13, v15, (int)v14, objc_msgSend(v16, "bytes"), objc_msgSend(v16, "length"));
  }
  else
  {
    BKLogCommon();
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543874;
      v46 = v6;
      v47 = 2114;
      v48 = v8;
      v49 = 2114;
      v50[0] = v10;
      _os_log_error_impl(&dword_18A0F0000, v17, OS_LOG_TYPE_ERROR, "BKSHIDServicesSetPersistentServiceProperties failed to encode %{public}@ / %{public}@: %{public}@", buf, 0x20u);
    }

  }
}

void BKSHIDServicesSetWristState(unint64_t a1)
{
  NSObject *v2;
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  uint8_t buf[4];
  unint64_t v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  if (a1 >= 3)
  {
    BKLogTouchEvents();
    v2 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 134217984;
      v8 = a1;
      _os_log_error_impl(&dword_18A0F0000, v2, OS_LOG_TYPE_ERROR, "BKSHIDServicesSetWristState unknown wristState value %ld", buf, 0xCu);
    }
  }
  else
  {
    +[BKSHIDEventSenderDescriptor anyBuiltinTouchscreenDigitizer](BKSHIDEventSenderDescriptor, "anyBuiltinTouchscreenDigitizer");
    v2 = objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedChar:", a1, CFSTR("WristState"));
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = v3;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v6, &v5, 1);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    BKSHIDServicesSetPersistentServiceProperties(v2, v4);

  }
}

id BKSHIDServicesGetPersistentServiceProperties(void *a1, void *a2)
{
  id v3;
  id v4;
  id v5;
  void *v6;
  id v7;
  void *v8;
  __CFString *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  id v14;
  void *v15;
  objc_class *v16;
  void *v17;
  id v18;
  uint64_t v19;
  void *v20;
  mach_port_t v21;
  id v22;
  uint64_t v23;
  id v24;
  NSObject *v25;
  const char *v26;
  NSObject *v27;
  uint32_t v28;
  void *v29;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  objc_class *v35;
  void *v36;
  objc_class *v37;
  void *v38;
  void *v39;
  void *v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  void *v45;
  NSObject *v46;
  const char *v47;
  void *v48;
  objc_class *v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  objc_class *v54;
  void *v55;
  objc_class *v56;
  void *v57;
  void *v58;
  void *v59;
  void *v60;
  objc_class *v61;
  void *v62;
  void *v63;
  void *v64;
  void *v65;
  objc_class *v66;
  void *v67;
  objc_class *v68;
  void *v69;
  void *v70;
  void *v71;
  uint64_t v72;
  uint64_t v73;
  void *v74;
  void *v75;
  unsigned int v76;
  uint64_t v77;
  id v78;
  __int128 v79;
  __int128 v80;
  __int128 v81;
  __int128 v82;
  uint8_t v83[128];
  uint8_t buf[4];
  void *v85;
  __int16 v86;
  const __CFString *v87;
  __int16 v88;
  _BYTE v89[14];
  uint64_t v90;

  v90 = *MEMORY[0x1E0C80C00];
  v3 = a1;
  v4 = a2;
  v5 = v3;
  if (!v5)
  {
    v48 = (void *)MEMORY[0x1E0CB3940];
    v49 = (objc_class *)objc_opt_class();
    NSStringFromClass(v49);
    v50 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v48, "stringWithFormat:", CFSTR("Value for '%@' was unexpectedly nil. Expected %@."), CFSTR("sender"), v50);
    v51 = (void *)objc_claimAutoreleasedReturnValue();

    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "NSDictionary<NSString *,id> *BKSHIDServicesGetPersistentServiceProperties(BKSHIDEventSenderDescriptor *__strong, NSSet<NSString *> *__strong)");
      v52 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138544130;
      v85 = v52;
      v86 = 2114;
      v87 = CFSTR("BKSHIDServices.m");
      v88 = 1024;
      *(_DWORD *)v89 = 883;
      *(_WORD *)&v89[4] = 2114;
      *(_QWORD *)&v89[6] = v51;
      _os_log_error_impl(&dword_18A0F0000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "failure in %{public}@ (%{public}@:%i) : %{public}@", buf, 0x26u);

    }
    objc_msgSend(objc_retainAutorelease(v51), "UTF8String");
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x18A110984);
  }
  v6 = v5;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    v53 = (void *)MEMORY[0x1E0CB3940];
    v54 = (objc_class *)objc_msgSend(v6, "classForCoder");
    if (!v54)
      v54 = (objc_class *)objc_opt_class();
    NSStringFromClass(v54);
    v55 = (void *)objc_claimAutoreleasedReturnValue();
    v56 = (objc_class *)objc_opt_class();
    NSStringFromClass(v56);
    v57 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v53, "stringWithFormat:", CFSTR("Value for '%@' was of unexpected class %@. Expected %@."), CFSTR("sender"), v55, v57);
    v58 = (void *)objc_claimAutoreleasedReturnValue();

    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "NSDictionary<NSString *,id> *BKSHIDServicesGetPersistentServiceProperties(BKSHIDEventSenderDescriptor *__strong, NSSet<NSString *> *__strong)");
      v59 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138544130;
      v85 = v59;
      v86 = 2114;
      v87 = CFSTR("BKSHIDServices.m");
      v88 = 1024;
      *(_DWORD *)v89 = 883;
      *(_WORD *)&v89[4] = 2114;
      *(_QWORD *)&v89[6] = v58;
      _os_log_error_impl(&dword_18A0F0000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "failure in %{public}@ (%{public}@:%i) : %{public}@", buf, 0x26u);

    }
    objc_msgSend(objc_retainAutorelease(v58), "UTF8String");
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x18A110A9CLL);
  }

  v7 = v4;
  if (!v7)
  {
    v60 = (void *)MEMORY[0x1E0CB3940];
    v61 = (objc_class *)objc_opt_class();
    NSStringFromClass(v61);
    v62 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v60, "stringWithFormat:", CFSTR("Value for '%@' was unexpectedly nil. Expected %@."), CFSTR("propertyKeys"), v62);
    v63 = (void *)objc_claimAutoreleasedReturnValue();

    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "NSDictionary<NSString *,id> *BKSHIDServicesGetPersistentServiceProperties(BKSHIDEventSenderDescriptor *__strong, NSSet<NSString *> *__strong)");
      v64 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138544130;
      v85 = v64;
      v86 = 2114;
      v87 = CFSTR("BKSHIDServices.m");
      v88 = 1024;
      *(_DWORD *)v89 = 884;
      *(_WORD *)&v89[4] = 2114;
      *(_QWORD *)&v89[6] = v63;
      _os_log_error_impl(&dword_18A0F0000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "failure in %{public}@ (%{public}@:%i) : %{public}@", buf, 0x26u);

    }
    objc_msgSend(objc_retainAutorelease(v63), "UTF8String");
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x18A110B8CLL);
  }
  v8 = v7;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    v65 = (void *)MEMORY[0x1E0CB3940];
    v66 = (objc_class *)objc_msgSend(v8, "classForCoder");
    if (!v66)
      v66 = (objc_class *)objc_opt_class();
    NSStringFromClass(v66);
    v67 = (void *)objc_claimAutoreleasedReturnValue();
    v68 = (objc_class *)objc_opt_class();
    NSStringFromClass(v68);
    v69 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v65, "stringWithFormat:", CFSTR("Value for '%@' was of unexpected class %@. Expected %@."), CFSTR("propertyKeys"), v67, v69);
    v70 = (void *)objc_claimAutoreleasedReturnValue();

    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "NSDictionary<NSString *,id> *BKSHIDServicesGetPersistentServiceProperties(BKSHIDEventSenderDescriptor *__strong, NSSet<NSString *> *__strong)");
      v71 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138544130;
      v85 = v71;
      v86 = 2114;
      v87 = CFSTR("BKSHIDServices.m");
      v88 = 1024;
      *(_DWORD *)v89 = 884;
      *(_WORD *)&v89[4] = 2114;
      *(_QWORD *)&v89[6] = v70;
      _os_log_error_impl(&dword_18A0F0000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "failure in %{public}@ (%{public}@:%i) : %{public}@", buf, 0x26u);

    }
    objc_msgSend(objc_retainAutorelease(v70), "UTF8String");
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x18A110CA4);
  }

  v81 = 0u;
  v82 = 0u;
  v79 = 0u;
  v80 = 0u;
  v9 = v8;
  v10 = -[__CFString countByEnumeratingWithState:objects:count:](v9, "countByEnumeratingWithState:objects:count:", &v79, v83, 16);
  if (v10)
  {
    v11 = v10;
    v12 = *(_QWORD *)v80;
    do
    {
      for (i = 0; i != v11; ++i)
      {
        if (*(_QWORD *)v80 != v12)
          objc_enumerationMutation(v9);
        v14 = *(id *)(*((_QWORD *)&v79 + 1) + 8 * i);
        v15 = (void *)MEMORY[0x1E0CB3940];
        v16 = (objc_class *)objc_opt_class();
        if (!v14)
        {
          NSStringFromClass(v16);
          v31 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v15, "stringWithFormat:", CFSTR("Value for '%@' was unexpectedly nil. Expected %@."), CFSTR("key"), v31);
          v32 = (void *)objc_claimAutoreleasedReturnValue();

          if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
          {
            objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "NSDictionary<NSString *,id> *BKSHIDServicesGetPersistentServiceProperties(BKSHIDEventSenderDescriptor *__strong, NSSet<NSString *> *__strong)");
            v33 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138544130;
            v85 = v33;
            v86 = 2114;
            v87 = CFSTR("BKSHIDServices.m");
            v88 = 1024;
            *(_DWORD *)v89 = 886;
            *(_WORD *)&v89[4] = 2114;
            *(_QWORD *)&v89[6] = v32;
            _os_log_error_impl(&dword_18A0F0000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "failure in %{public}@ (%{public}@:%i) : %{public}@", buf, 0x26u);

          }
          objc_msgSend(objc_retainAutorelease(v32), "UTF8String");
          _bs_set_crash_log_message();
          __break(0);
          JUMPOUT(0x18A1105DCLL);
        }
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {
          v34 = (void *)MEMORY[0x1E0CB3940];
          v35 = (objc_class *)objc_msgSend(v14, "classForCoder");
          if (!v35)
            v35 = (objc_class *)objc_opt_class();
          NSStringFromClass(v35);
          v36 = (void *)objc_claimAutoreleasedReturnValue();
          v37 = (objc_class *)objc_opt_class();
          NSStringFromClass(v37);
          v38 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v34, "stringWithFormat:", CFSTR("Value for '%@' was of unexpected class %@. Expected %@."), CFSTR("key"), v36, v38);
          v39 = (void *)objc_claimAutoreleasedReturnValue();

          if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
          {
            objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "NSDictionary<NSString *,id> *BKSHIDServicesGetPersistentServiceProperties(BKSHIDEventSenderDescriptor *__strong, NSSet<NSString *> *__strong)");
            v40 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138544130;
            v85 = v40;
            v86 = 2114;
            v87 = CFSTR("BKSHIDServices.m");
            v88 = 1024;
            *(_DWORD *)v89 = 886;
            *(_WORD *)&v89[4] = 2114;
            *(_QWORD *)&v89[6] = v39;
            _os_log_error_impl(&dword_18A0F0000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "failure in %{public}@ (%{public}@:%i) : %{public}@", buf, 0x26u);

          }
          objc_msgSend(objc_retainAutorelease(v39), "UTF8String");
          _bs_set_crash_log_message();
          __break(0);
          JUMPOUT(0x18A1106F0);
        }

      }
      v11 = -[__CFString countByEnumeratingWithState:objects:count:](v9, "countByEnumeratingWithState:objects:count:", &v79, v83, 16);
    }
    while (v11);
  }

  v78 = 0;
  objc_msgSend(MEMORY[0x1E0D01838], "encodeObject:error:", v6, &v78);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = v78;
  -[__CFString bs_secureEncoded](v9, "bs_secureEncoded");
  v19 = objc_claimAutoreleasedReturnValue();
  v20 = (void *)v19;
  v77 = 0;
  v76 = 0;
  if (v17 && v19)
  {
    v21 = _BKSServerPortHelper("com.apple.backboard.hid.services", BKSHIDServerPort, &BKSHIDServerMachPort, (void (__cdecl *)(CFMachPortRef, void *))_InvalidateHIDServicesPort);
    v22 = objc_retainAutorelease(v17);
    v23 = objc_msgSend(v22, "bytes");
    LODWORD(v22) = objc_msgSend(v22, "length");
    v24 = objc_retainAutorelease(v20);
    if (_BKSHIDGetPersistentServiceProperties(v21, v23, (int)v22, objc_msgSend(v24, "bytes"), objc_msgSend(v24, "length"), &v77, &v76))
    {
      BKLogCommon();
      v25 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        v26 = "BKSHIDServicesGetPersistentServiceProperties IPC failed";
        v27 = v25;
        v28 = 2;
LABEL_37:
        _os_log_error_impl(&dword_18A0F0000, v27, OS_LOG_TYPE_ERROR, v26, buf, v28);
        goto LABEL_20;
      }
      goto LABEL_20;
    }
    objc_msgSend(MEMORY[0x1E0C99D50], "bs_dataWithVMAllocatedBytes:length:", v77, v76);
    v25 = objc_claimAutoreleasedReturnValue();
    if (v25)
    {
      v74 = (void *)MEMORY[0x1E0C99E60];
      v75 = (void *)MEMORY[0x1E0C99D80];
      v73 = objc_opt_class();
      v72 = objc_opt_class();
      v41 = objc_opt_class();
      v42 = objc_opt_class();
      v43 = objc_opt_class();
      v44 = objc_opt_class();
      objc_msgSend(v74, "setWithObjects:", v73, v72, v41, v42, v43, v44, objc_opt_class(), 0);
      v45 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v75, "bs_secureDecodedFromData:withAdditionalClasses:", v25, v45);
      v29 = (void *)objc_claimAutoreleasedReturnValue();

      if (v29)
        goto LABEL_21;
      BKLogCommon();
      v46 = objc_claimAutoreleasedReturnValue();
      if (!os_log_type_enabled(v46, OS_LOG_TYPE_ERROR))
        goto LABEL_35;
      *(_WORD *)buf = 0;
      v47 = "BKSHIDServicesGetPersistentServiceProperties property decode failed";
    }
    else
    {
      BKLogCommon();
      v46 = objc_claimAutoreleasedReturnValue();
      if (!os_log_type_enabled(v46, OS_LOG_TYPE_ERROR))
      {
LABEL_35:

        goto LABEL_20;
      }
      *(_WORD *)buf = 0;
      v47 = "BKSHIDServicesGetPersistentServiceProperties data access failed";
    }
    _os_log_error_impl(&dword_18A0F0000, v46, OS_LOG_TYPE_ERROR, v47, buf, 2u);
    goto LABEL_35;
  }
  BKLogCommon();
  v25 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 138543874;
    v85 = v6;
    v86 = 2114;
    v87 = v9;
    v88 = 2114;
    *(_QWORD *)v89 = v18;
    v26 = "BKSHIDServicesGetPersistentServiceProperties failed to encode %{public}@ / %{public}@: %{public}@";
    v27 = v25;
    v28 = 32;
    goto LABEL_37;
  }
LABEL_20:
  v29 = 0;
LABEL_21:

  return v29;
}

id BKSHIDServicesProductIdentifierFromServiceProperties(void *a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id v7;
  uint64_t v8;
  id v9;
  void *v10;
  id v11;
  uint64_t v12;
  id v13;
  void *v14;
  id v15;
  uint64_t v16;
  id v17;
  void *v18;
  id v19;
  void *v20;
  uint64_t v22;

  v5 = a1;
  v6 = a2;
  v7 = a3;
  v8 = objc_opt_class();
  v9 = v5;
  if (v8)
  {
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v10 = v9;
    else
      v10 = 0;
  }
  else
  {
    v10 = 0;
  }
  v11 = v10;

  v12 = objc_opt_class();
  v13 = v6;
  if (v12)
  {
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v14 = v13;
    else
      v14 = 0;
  }
  else
  {
    v14 = 0;
  }
  v15 = v14;

  v16 = objc_opt_class();
  v17 = v7;
  if (v16)
  {
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v18 = v17;
    else
      v18 = 0;
  }
  else
  {
    v18 = 0;
  }
  v19 = v18;

  v20 = 0;
  if (v11 && v15)
  {
    if (v19)
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@-%@-%@"), v11, v15, v19);
    else
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@-%@"), v11, v15, v22);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v20;
}

void BKSHIDServicesGetCALayerTransform(uint64_t a1@<X0>, uint64_t a2@<X1>, _OWORD *a3@<X8>)
{
  void *v6;
  void *v7;

  +[BKSTouchEventService sharedInstance](BKSTouchEventService, "sharedInstance");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    v7 = v6;
    objc_msgSend(v6, "transformForDisplayUUID:layerID:contextID:", 0, a2, a1);
    v6 = v7;
  }
  else
  {
    a3[6] = 0u;
    a3[7] = 0u;
    a3[4] = 0u;
    a3[5] = 0u;
    a3[2] = 0u;
    a3[3] = 0u;
    *a3 = 0u;
    a3[1] = 0u;
  }

}

__CFString *NSStringFromBKSHIDTouchSensitiveButtonIdentifier(uint64_t a1)
{
  __CFString *v1;

  if (!a1)
    return CFSTR("undefined");
  if (a1 == 1)
  {
    v1 = CFSTR("cameraCapture");
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("<invalid:%X>"), a1);
    v1 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  return v1;
}

__CFString *NSStringFromBKSHIDTouchSensitiveButtonScanMode(uint64_t a1)
{
  __CFString *v1;

  if (!a1)
    return CFSTR("none");
  if (a1 == 1)
  {
    v1 = CFSTR("active");
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("<invalid:%X>"), a1);
    v1 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  return v1;
}

id BKSHIDTouchSensitiveButtonRequestScanMode(uint64_t a1, uint64_t a2, void *a3)
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v11;
  void *v12;
  _QWORD block[5];
  uint8_t buf[4];
  void *v15;
  __int16 v16;
  const __CFString *v17;
  __int16 v18;
  int v19;
  __int16 v20;
  void *v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  if (a2 <= 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("scanMode > BKSHIDTouchSensitiveButtonScanModeNone"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "id<BSInvalidatable>  _Nonnull BKSHIDTouchSensitiveButtonRequestScanMode(BKSHIDTouchSensitiveButtonIdentifier, BKSHIDTouchSensitiveButtonScanMode, NSString *__strong _Nonnull)");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138544130;
      v15 = v12;
      v16 = 2114;
      v17 = CFSTR("BKSHIDServices.m");
      v18 = 1024;
      v19 = 982;
      v20 = 2114;
      v21 = v11;
      _os_log_error_impl(&dword_18A0F0000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "failure in %{public}@ (%{public}@:%i) : %{public}@", buf, 0x26u);

    }
    objc_msgSend(objc_retainAutorelease(v11), "UTF8String");
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x18A111110);
  }
  v6 = v5;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __BKSHIDTouchSensitiveButtonRequestScanMode_block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (BKSHIDTouchSensitiveButtonRequestScanMode_onceToken != -1)
    dispatch_once(&BKSHIDTouchSensitiveButtonRequestScanMode_onceToken, block);
  v7 = (void *)BKSHIDTouchSensitiveButtonRequestScanMode_scanningAssertion;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a2);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "acquireForReason:withContext:", v6, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

__CFString *BKSOpenApplicationErrorCodeToString(unsigned int a1)
{
  if (a1 > 8)
    return 0;
  else
    return off_1E1E9FFF0[a1];
}

NSObject *_BKDecodeArrayOfClass(void *a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  id v9;
  NSObject *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  NSObject *v15;
  id v16;
  NSObject *v17;
  void *v19;
  id v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  uint8_t buf[4];
  id v26;
  __int16 v27;
  void *v28;
  _BYTE v29[128];
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  v5 = a1;
  v6 = a3;
  objc_msgSend(MEMORY[0x1E0C99E60], "setWithObjects:", objc_opt_class(), a2, 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "decodeObjectOfClasses:forKey:", v7, v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v8)
  {
LABEL_18:
    v15 = MEMORY[0x1E0C9AA60];
    goto LABEL_19;
  }
  v9 = v8;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    BKLogEventDelivery();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543362;
      v26 = (id)objc_opt_class();
      v16 = v26;
      _os_log_error_impl(&dword_18A0F0000, v10, OS_LOG_TYPE_ERROR, "expected NSArray, got %{public}@", buf, 0xCu);

    }
LABEL_17:

    goto LABEL_18;
  }
  v23 = 0u;
  v24 = 0u;
  v21 = 0u;
  v22 = 0u;
  v10 = v9;
  v11 = -[NSObject countByEnumeratingWithState:objects:count:](v10, "countByEnumeratingWithState:objects:count:", &v21, v29, 16);
  if (v11)
  {
    v12 = v11;
    v13 = *(_QWORD *)v22;
    while (2)
    {
      v14 = 0;
      do
      {
        if (*(_QWORD *)v22 != v13)
          objc_enumerationMutation(v10);
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {
          BKLogEventDelivery();
          v17 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
          {
            v19 = (void *)objc_opt_class();
            *(_DWORD *)buf = 138543618;
            v26 = a2;
            v27 = 2114;
            v28 = v19;
            v20 = v19;
            _os_log_error_impl(&dword_18A0F0000, v17, OS_LOG_TYPE_ERROR, "expected %{public}@, got %{public}@", buf, 0x16u);

          }
          goto LABEL_17;
        }
        ++v14;
      }
      while (v12 != v14);
      v12 = -[NSObject countByEnumeratingWithState:objects:count:](v10, "countByEnumeratingWithState:objects:count:", &v21, v29, 16);
      if (v12)
        continue;
      break;
    }
  }

  v15 = v10;
LABEL_19:

  return v15;
}

__CFString *NSStringFromBKSHIDEventDeferringPolicyStatus(unint64_t a1)
{
  if (a1 < 3)
    return off_1E1EA00D8[a1];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("<invalid:%X>"), a1);
  return (__CFString *)(id)objc_claimAutoreleasedReturnValue();
}

__CFString *NSStringFromBKSHIDEventAttributeOptions(int a1)
{
  __int16 v1;
  id v2;
  void *v3;
  __CFString *v4;

  if (!a1)
  {
    v4 = CFSTR("none");
    return v4;
  }
  v1 = a1;
  v2 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v3 = v2;
  if ((v1 & 1) != 0)
  {
    objc_msgSend(v2, "addObject:", CFSTR("cancelled"));
    if ((v1 & 2) == 0)
    {
LABEL_4:
      if ((v1 & 4) == 0)
        goto LABEL_5;
      goto LABEL_19;
    }
  }
  else if ((v1 & 2) == 0)
  {
    goto LABEL_4;
  }
  objc_msgSend(v3, "addObject:", CFSTR("touchChanged"));
  if ((v1 & 4) == 0)
  {
LABEL_5:
    if ((v1 & 8) == 0)
      goto LABEL_6;
    goto LABEL_20;
  }
LABEL_19:
  objc_msgSend(v3, "addObject:", CFSTR("highResolutionScroll"));
  if ((v1 & 8) == 0)
  {
LABEL_6:
    if ((v1 & 0x10) == 0)
      goto LABEL_7;
    goto LABEL_21;
  }
LABEL_20:
  objc_msgSend(v3, "addObject:", CFSTR("displayLinkSynchronized"));
  if ((v1 & 0x10) == 0)
  {
LABEL_7:
    if ((v1 & 0x20) == 0)
      goto LABEL_8;
    goto LABEL_22;
  }
LABEL_21:
  objc_msgSend(v3, "addObject:", CFSTR("highQualityFrequency"));
  if ((v1 & 0x20) == 0)
  {
LABEL_8:
    if ((v1 & 0x40) == 0)
      goto LABEL_9;
    goto LABEL_23;
  }
LABEL_22:
  objc_msgSend(v3, "addObject:", CFSTR("usesNaturalScrolling"));
  if ((v1 & 0x40) == 0)
  {
LABEL_9:
    if ((v1 & 0x80) == 0)
      goto LABEL_10;
    goto LABEL_24;
  }
LABEL_23:
  objc_msgSend(v3, "addObject:", CFSTR("usesDeviceOrientation"));
  if ((v1 & 0x80) == 0)
  {
LABEL_10:
    if ((v1 & 0x100) == 0)
      goto LABEL_11;
    goto LABEL_25;
  }
LABEL_24:
  objc_msgSend(v3, "addObject:", CFSTR("modifiersOnly"));
  if ((v1 & 0x100) == 0)
  {
LABEL_11:
    if ((v1 & 0x200) == 0)
      goto LABEL_12;
LABEL_26:
    objc_msgSend(v3, "addObject:", CFSTR("multiplexedMore"));
    if ((v1 & 0x400) == 0)
      goto LABEL_14;
    goto LABEL_13;
  }
LABEL_25:
  objc_msgSend(v3, "addObject:", CFSTR("debugVisualizationEnabled"));
  if ((v1 & 0x200) != 0)
    goto LABEL_26;
LABEL_12:
  if ((v1 & 0x400) != 0)
LABEL_13:
    objc_msgSend(v3, "addObject:", CFSTR("absoluteSource"));
LABEL_14:
  objc_msgSend(v3, "componentsJoinedByString:", CFSTR(", "));
  v4 = (__CFString *)objc_claimAutoreleasedReturnValue();

  return v4;
}

__CFString *NSStringFromBKSHIDEventContextType(unint64_t a1)
{
  if (a1 < 3)
    return off_1E1EA0250[a1];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("<unknown:%X>"), a1);
  return (__CFString *)(id)objc_claimAutoreleasedReturnValue();
}

__CFString *NSStringFromBKSHIDEventContextMove(unint64_t a1)
{
  if (a1 < 3)
    return off_1E1EA0238[a1];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("<unknown:%X>"), a1);
  return (__CFString *)(id)objc_claimAutoreleasedReturnValue();
}

__CFString *NSStringFromBKSHIDEventScreenEdgeMask(int a1)
{
  char v1;
  id v2;
  void *v3;
  __CFString *v4;

  if (!a1)
  {
    v4 = CFSTR("none");
    return v4;
  }
  v1 = a1;
  v2 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v3 = v2;
  if ((v1 & 1) != 0)
  {
    objc_msgSend(v2, "addObject:", CFSTR("top"));
    if ((v1 & 2) == 0)
    {
LABEL_4:
      if ((v1 & 4) == 0)
        goto LABEL_5;
LABEL_12:
      objc_msgSend(v3, "addObject:", CFSTR("bottom"));
      if ((v1 & 8) == 0)
        goto LABEL_7;
      goto LABEL_6;
    }
  }
  else if ((v1 & 2) == 0)
  {
    goto LABEL_4;
  }
  objc_msgSend(v3, "addObject:", CFSTR("left"));
  if ((v1 & 4) != 0)
    goto LABEL_12;
LABEL_5:
  if ((v1 & 8) != 0)
LABEL_6:
    objc_msgSend(v3, "addObject:", CFSTR("right"));
LABEL_7:
  objc_msgSend(v3, "componentsJoinedByString:", CFSTR(", "));
  v4 = (__CFString *)objc_claimAutoreleasedReturnValue();

  return v4;
}

__CFString *NSStringFromBKSHIDEventTeleportState(unsigned int a1)
{
  if (a1 < 4)
    return off_1E1EA0268[a1];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("<unknown:%X>"), a1);
  return (__CFString *)(id)objc_claimAutoreleasedReturnValue();
}

__CFString *NSStringFromBKSHIDEventPointerAttributeState(unsigned int a1)
{
  if (a1 < 5)
    return off_1E1EA0210[a1];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("<unknown:%X>"), a1);
  return (__CFString *)(id)objc_claimAutoreleasedReturnValue();
}

void sub_18A11A3DC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
  id *v16;

  objc_destroyWeak(v16);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_18A11B538(_Unwind_Exception *a1)
{
  id *v1;

  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

void collectPolicies(void *a1, void *a2)
{
  id v3;
  id v4;
  id v5;
  _QWORD v6[4];
  id v7;

  v3 = a2;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __collectPolicies_block_invoke;
  v6[3] = &unk_1E1EA0410;
  v7 = v3;
  v4 = v3;
  v5 = (id)objc_msgSend(a1, "reducePolicyToObjectWithBlock:", v6);

}

id __collectPolicies_block_invoke(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  id v5;
  void *v6;
  _QWORD v8[4];
  id v9;
  id v10;
  _QWORD v11[4];
  id v12;
  id v13;

  v3 = a2;
  v4 = MEMORY[0x1E0C809B0];
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __collectPolicies_block_invoke_2;
  v11[3] = &unk_1E1EA0438;
  v12 = *(id *)(a1 + 32);
  v13 = v3;
  v8[0] = v4;
  v8[1] = 3221225472;
  v8[2] = __collectPolicies_block_invoke_3;
  v8[3] = &unk_1E1EA0460;
  v9 = *(id *)(a1 + 32);
  v10 = v13;
  v5 = v13;
  objc_msgSend(v5, "matchSharingTouchesPolicy:orCancelTouchesPolicy:orCombinedPolicy:", v11, v8, &__block_literal_global_3009);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

uint64_t __collectPolicies_block_invoke_2(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "addObject:", *(_QWORD *)(a1 + 40));
  return 0;
}

uint64_t __collectPolicies_block_invoke_3(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "addObject:", *(_QWORD *)(a1 + 40));
  return 0;
}

uint64_t __collectPolicies_block_invoke_4()
{
  return 0;
}

__CFString *NSStringFromBKSDisplayTags(uint64_t a1)
{
  id v2;
  void *v3;
  void *v4;
  void *v5;
  __CFString *v6;

  v2 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v3 = v2;
  if (!a1)
  {
    v6 = CFSTR("()");
    goto LABEL_13;
  }
  if ((a1 & 1) != 0)
  {
    objc_msgSend(v2, "addObject:", CFSTR("hidden"));
    if ((a1 & 2) == 0)
    {
LABEL_4:
      if ((a1 & 4) == 0)
        goto LABEL_5;
      goto LABEL_16;
    }
  }
  else if ((a1 & 2) == 0)
  {
    goto LABEL_4;
  }
  objc_msgSend(v3, "addObject:", CFSTR("debounce"));
  if ((a1 & 4) == 0)
  {
LABEL_5:
    if ((a1 & 0x10) == 0)
      goto LABEL_6;
    goto LABEL_17;
  }
LABEL_16:
  objc_msgSend(v3, "addObject:", CFSTR("AirPlay"));
  if ((a1 & 0x10) == 0)
  {
LABEL_6:
    if ((a1 & 0x20) == 0)
      goto LABEL_7;
    goto LABEL_18;
  }
LABEL_17:
  objc_msgSend(v3, "addObject:", CFSTR("musicOnly"));
  if ((a1 & 0x20) == 0)
  {
LABEL_7:
    if ((a1 & 0x40) == 0)
      goto LABEL_8;
    goto LABEL_19;
  }
LABEL_18:
  objc_msgSend(v3, "addObject:", CFSTR("car"));
  if ((a1 & 0x40) == 0)
  {
LABEL_8:
    if ((a1 & 0x80) == 0)
      goto LABEL_9;
LABEL_20:
    objc_msgSend(v3, "addObject:", CFSTR("continuity"));
    if ((a1 & 0x10000) == 0)
      goto LABEL_11;
    goto LABEL_10;
  }
LABEL_19:
  objc_msgSend(v3, "addObject:", CFSTR("carInstruments"));
  if ((a1 & 0x80) != 0)
    goto LABEL_20;
LABEL_9:
  if ((a1 & 0x10000) != 0)
LABEL_10:
    objc_msgSend(v3, "addObject:", CFSTR("unknown"));
LABEL_11:
  v4 = (void *)MEMORY[0x1E0CB3940];
  objc_msgSend(v3, "componentsJoinedByString:", CFSTR(" | "));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "stringWithFormat:", CFSTR("(%@)"), v5);
  v6 = (__CFString *)objc_claimAutoreleasedReturnValue();

LABEL_13:
  return v6;
}

__CFString *NSStringFromBKSDisplayServicesCloneMirroringMode(unint64_t a1)
{
  if (a1 < 4)
    return off_1E1EA05F0[a1];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("<unknown:%X>"), a1);
  return (__CFString *)(id)objc_claimAutoreleasedReturnValue();
}

uint64_t _BKSSetDisplayDisabled(void *a1, char a2)
{
  __CFString *v3;
  __CFString *v4;
  int v5;
  mach_port_name_t v6;
  char v8;
  char buffer[1024];
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v3 = a1;
  v4 = v3;
  if (v3 && (v5 = -[__CFString isEqualToString:](v3, "isEqualToString:", CFSTR("<main>")), v4, !v5))
  {
    bzero(buffer, 0x400uLL);
    CFStringGetCString(v4, buffer, 1024, 0x8000100u);

  }
  else
  {

    bzero(buffer, 0x400uLL);
  }
  v6 = _BKSServerPortHelper("com.apple.backboard.display.services", BKSDisplayServerPort, &BKSDisplayServerMachPort, (void (__cdecl *)(CFMachPortRef, void *))_InvalidateDisplayServicesPort);
  return _BKSDisplaySetDisabled(v6, buffer, a2, &v8);
}

BOOL BKSDisplayServicesIsScreenDisabled(const __CFString *a1)
{
  mach_port_name_t v2;
  char v4;
  char buffer[1024];
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  bzero(buffer, 0x400uLL);
  if (a1)
    CFStringGetCString(a1, buffer, 1024, 0x8000100u);
  v4 = 1;
  v2 = _BKSServerPortHelper("com.apple.backboard.display.services", BKSDisplayServerPort, &BKSDisplayServerMachPort, (void (__cdecl *)(CFMachPortRef, void *))_InvalidateDisplayServicesPort);
  _BKSDisplayIsDisabled(v2, buffer, &v4);
  return v4 != 0;
}

id BKSDisplayServicesAcquireDisplayDisabledAssertion(void *a1, void *a2)
{
  id v3;
  id v4;
  id v5;
  __CFString *v6;
  void *v7;

  v3 = a1;
  v4 = a2;
  if (BKSDisplayServicesAcquireDisplayDisabledAssertion_onceToken != -1)
    dispatch_once(&BKSDisplayServicesAcquireDisplayDisabledAssertion_onceToken, &__block_literal_global_3329);
  v5 = v3;
  if (objc_msgSend(v5, "length"))
    v6 = (__CFString *)v5;
  else
    v6 = CFSTR("<main>");

  objc_msgSend((id)BKSDisplayServicesAcquireDisplayDisabledAssertion_assertion, "acquireForReason:withContext:", v4, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

void sub_18A11DF1C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
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

uint64_t BKSDisplayServicesSetScreenBlanked(char a1)
{
  mach_port_name_t v2;
  char v4[1024];
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  bzero(v4, 0x400uLL);
  v2 = _BKSServerPortHelper("com.apple.backboard.display.services", BKSDisplayServerPort, &BKSDisplayServerMachPort, (void (__cdecl *)(CFMachPortRef, void *))_InvalidateDisplayServicesPort);
  return _BKSDisplayNotifySetDisplayBlanked(v2, v4, a1, 1);
}

uint64_t BKSDisplayServicesSetDisplayBlanked(const __CFString *a1, char a2)
{
  return _BKSDisplayServicesNotifySetDisplayBlanked(a1, a2, 1);
}

uint64_t _BKSDisplayServicesNotifySetDisplayBlanked(const __CFString *a1, char a2, char a3)
{
  mach_port_name_t v6;
  char buffer[1024];
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  bzero(buffer, 0x400uLL);
  if (a1)
    CFStringGetCString(a1, buffer, 1024, 0x8000100u);
  v6 = _BKSServerPortHelper("com.apple.backboard.display.services", BKSDisplayServerPort, &BKSDisplayServerMachPort, (void (__cdecl *)(CFMachPortRef, void *))_InvalidateDisplayServicesPort);
  return _BKSDisplayNotifySetDisplayBlanked(v6, buffer, a2, a3);
}

uint64_t BKSDisplayServicesNotifyDisplayBlanked(const __CFString *a1, char a2)
{
  return _BKSDisplayServicesNotifySetDisplayBlanked(a1, a2, 0);
}

BOOL BKSDisplayServicesGetBlankingRemovesPower(const __CFString *a1)
{
  mach_port_name_t v2;
  char v4;
  char buffer[1024];
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  bzero(buffer, 0x400uLL);
  if (a1)
    CFStringGetCString(a1, buffer, 1024, 0x8000100u);
  v4 = 0;
  v2 = _BKSServerPortHelper("com.apple.backboard.display.services", BKSDisplayServerPort, &BKSDisplayServerMachPort, (void (__cdecl *)(CFMachPortRef, void *))_InvalidateDisplayServicesPort);
  _BKSDisplayGetBlankingRemovesPower(v2, buffer, &v4);
  return v4 != 0;
}

uint64_t BKSDisplayServicesSetBlankingRemovesPower(const __CFString *a1, char a2)
{
  mach_port_name_t v4;
  char buffer[1024];
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  bzero(buffer, 0x400uLL);
  if (a1)
    CFStringGetCString(a1, buffer, 1024, 0x8000100u);
  v4 = _BKSServerPortHelper("com.apple.backboard.display.services", BKSDisplayServerPort, &BKSDisplayServerMachPort, (void (__cdecl *)(CFMachPortRef, void *))_InvalidateDisplayServicesPort);
  return _BKSDisplaySetBlankingRemovesPower(v4, buffer, a2);
}

id BKSDisplayServicesGetSystemIdentifiers(void *a1)
{
  __CFString *v1;
  mach_port_name_t v2;
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  unsigned int v9;
  uint64_t v10;
  char buffer[1024];
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v1 = a1;
  bzero(buffer, 0x400uLL);
  if (v1)
    CFStringGetCString(v1, buffer, 1024, 0x8000100u);
  v10 = 0;
  v9 = 0;
  v2 = _BKSServerPortHelper("com.apple.backboard.display.services", BKSDisplayServerPort, &BKSDisplayServerMachPort, (void (__cdecl *)(CFMachPortRef, void *))_InvalidateDisplayServicesPort);
  v3 = 0;
  if (!_BKSDisplayGetSystemIdentifiers(v2, buffer, &v10, &v9))
  {
    objc_msgSend(MEMORY[0x1E0C99D50], "bs_dataWithVMAllocatedBytes:length:", v10, v9);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if (v4)
    {
      v5 = (void *)MEMORY[0x1E0C99E60];
      v6 = objc_opt_class();
      objc_msgSend(v5, "setWithObjects:", v6, objc_opt_class(), 0);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "bs_secureDecodedFromData:withAdditionalClasses:", v4, v7);
      v3 = (void *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      v3 = 0;
    }

  }
  return v3;
}

void BKSDisplayServicesSetSystemIdentifiers(void *a1, void *a2)
{
  __CFString *v3;
  id v4;
  uint64_t v5;
  void *v6;
  NSObject *v7;
  const char *v8;
  NSObject *v9;
  uint32_t v10;
  mach_port_t v11;
  id v12;
  int v13;
  int v14;
  int v15;
  id v16;
  char buffer[1024];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v3 = a1;
  v4 = a2;
  bzero(buffer, 0x400uLL);
  if (v3)
    CFStringGetCString(v3, buffer, 1024, 0x8000100u);
  objc_msgSend(MEMORY[0x1E0DE7910], "bs_secureDataFromObject:", v4);
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = (void *)v5;
  if (v4 && !v5)
  {
    BKLogCommon();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      v15 = 138543362;
      v16 = v4;
      v8 = "Error encoding system identifiers: %{public}@";
      v9 = v7;
      v10 = 12;
LABEL_12:
      _os_log_error_impl(&dword_18A0F0000, v9, OS_LOG_TYPE_ERROR, v8, (uint8_t *)&v15, v10);
      goto LABEL_9;
    }
    goto LABEL_9;
  }
  v11 = _BKSServerPortHelper("com.apple.backboard.display.services", BKSDisplayServerPort, &BKSDisplayServerMachPort, (void (__cdecl *)(CFMachPortRef, void *))_InvalidateDisplayServicesPort);
  v12 = objc_retainAutorelease(v6);
  v13 = _BKSDisplaySetSystemIdentifiers(v11, buffer, objc_msgSend(v12, "bytes"), objc_msgSend(v12, "length"));
  if (v13)
  {
    v14 = v13;
    BKLogCommon();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      v15 = 67109120;
      LODWORD(v16) = v14;
      v8 = "Error sending system identifiers: 0x%x";
      v9 = v7;
      v10 = 8;
      goto LABEL_12;
    }
LABEL_9:

  }
}

BOOL BKSDisplayServicesIsFlipBookEnabled(const __CFString *a1)
{
  mach_port_name_t v2;
  char v4;
  char buffer[1024];
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  bzero(buffer, 0x400uLL);
  if (a1)
    CFStringGetCString(a1, buffer, 1024, 0x8000100u);
  v4 = 0;
  v2 = _BKSServerPortHelper("com.apple.backboard.display.services", BKSDisplayServerPort, &BKSDisplayServerMachPort, (void (__cdecl *)(CFMachPortRef, void *))_InvalidateDisplayServicesPort);
  _BKSDisplayIsFlipBookEnabled(v2, buffer, &v4);
  return v4 != 0;
}

uint64_t BKSDisplayServicesSetFlipBookEnabled(const __CFString *a1, char a2)
{
  mach_port_name_t v4;
  char buffer[1024];
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  bzero(buffer, 0x400uLL);
  if (a1)
    CFStringGetCString(a1, buffer, 1024, 0x8000100u);
  v4 = _BKSServerPortHelper("com.apple.backboard.display.services", BKSDisplayServerPort, &BKSDisplayServerMachPort, (void (__cdecl *)(CFMachPortRef, void *))_InvalidateDisplayServicesPort);
  return _BKSDisplaySetFlipBookEnabled(v4, buffer, a2);
}

uint64_t BKSDisplayServicesSetCalibrationPhase(const __CFString *a1, int a2, int a3)
{
  mach_port_name_t v6;
  char buffer[1024];
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  bzero(buffer, 0x400uLL);
  if (a1)
    CFStringGetCString(a1, buffer, 1024, 0x8000100u);
  v6 = _BKSServerPortHelper("com.apple.backboard.display.services", BKSDisplayServerPort, &BKSDisplayServerMachPort, (void (__cdecl *)(CFMachPortRef, void *))_InvalidateDisplayServicesPort);
  return _BKSDisplaySetCalibrationPhase(v6, buffer, a2, a3);
}

BOOL BKSDisplayServicesIsFlipBookSuppressed(const __CFString *a1)
{
  mach_port_name_t v2;
  char v4;
  char buffer[1024];
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  bzero(buffer, 0x400uLL);
  if (a1)
    CFStringGetCString(a1, buffer, 1024, 0x8000100u);
  v4 = 0;
  v2 = _BKSServerPortHelper("com.apple.backboard.display.services", BKSDisplayServerPort, &BKSDisplayServerMachPort, (void (__cdecl *)(CFMachPortRef, void *))_InvalidateDisplayServicesPort);
  _BKSDisplayIsFlipBookSuppressed(v2, buffer, &v4);
  return v4 != 0;
}

uint64_t BKSDisplayServicesSetFlipBookSuppressed(const __CFString *a1, char a2)
{
  mach_port_name_t v4;
  char buffer[1024];
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  bzero(buffer, 0x400uLL);
  if (a1)
    CFStringGetCString(a1, buffer, 1024, 0x8000100u);
  v4 = _BKSServerPortHelper("com.apple.backboard.display.services", BKSDisplayServerPort, &BKSDisplayServerMachPort, (void (__cdecl *)(CFMachPortRef, void *))_InvalidateDisplayServicesPort);
  return _BKSDisplaySetFlipBookSuppressed(v4, buffer, a2);
}

uint64_t BKSDisplayServicesWillUnblank()
{
  mach_port_name_t v0;
  char v2[1024];
  uint64_t v3;

  v3 = *MEMORY[0x1E0C80C00];
  bzero(v2, 0x400uLL);
  v0 = _BKSServerPortHelper("com.apple.backboard.display.services", BKSDisplayServerPort, &BKSDisplayServerMachPort, (void (__cdecl *)(CFMachPortRef, void *))_InvalidateDisplayServicesPort);
  return _BKSDisplayWillUnblank(v0, v2);
}

uint64_t BKSDisplayServicesWillUnblankDisplay(const __CFString *a1)
{
  mach_port_name_t v2;
  char buffer[1024];
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  bzero(buffer, 0x400uLL);
  if (a1)
    CFStringGetCString(a1, buffer, 1024, 0x8000100u);
  v2 = _BKSServerPortHelper("com.apple.backboard.display.services", BKSDisplayServerPort, &BKSDisplayServerMachPort, (void (__cdecl *)(CFMachPortRef, void *))_InvalidateDisplayServicesPort);
  return _BKSDisplayWillUnblank(v2, buffer);
}

void __getCADisplayClass_block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;

  QuartzCoreLibrary();
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = objc_getClass("CADisplay");
  if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
  {
    getCADisplayClass_softClass = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "Class getCADisplayClass(void)_block_invoke");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "handleFailureInFunction:file:lineNumber:description:", v3, CFSTR("BKSDisplayServices.m"), 42, CFSTR("Unable to find class %s"), "CADisplay");

    __break(1u);
  }
}

void QuartzCoreLibrary()
{
  void *v0;
  void *v1;
  void *v2;

  if (!QuartzCoreLibraryCore_frameworkLibrary)
    QuartzCoreLibraryCore_frameworkLibrary = _sl_dlopen();
  if (!QuartzCoreLibraryCore_frameworkLibrary)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v0 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "void *QuartzCoreLibrary(void)");
    v1 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", v1, CFSTR("BKSDisplayServices.m"), 41, CFSTR("%s"), 0);

    __break(1u);
    free(v2);
  }
}

id BKSDisplayServicesSetMainDisplayCloneMirroringModeForDestinationDisplay(void *a1, unint64_t a2)
{
  id v3;
  void *v4;
  objc_class *v5;
  id v6;
  void *v7;
  _BKSCloneMirroringModeRequest *v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  __CFString *v13;
  _BKSCloneMirroringModeRequest *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  mach_port_name_t v18;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  objc_class *v24;
  void *v25;
  objc_class *v26;
  void *v27;
  void *v28;
  void *v29;
  _QWORD v30[4];
  __CFString *v31;
  _BKSCloneMirroringModeRequest *v32;
  char buffer[4];
  void *v34;
  __int16 v35;
  const __CFString *v36;
  __int16 v37;
  int v38;
  __int16 v39;
  void *v40;
  uint64_t v41;

  v41 = *MEMORY[0x1E0C80C00];
  v3 = a1;
  v4 = (void *)MEMORY[0x1E0CB3940];
  v5 = (objc_class *)objc_opt_class();
  if (!v3)
  {
    NSStringFromClass(v5);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "stringWithFormat:", CFSTR("Value for '%@' was unexpectedly nil. Expected %@."), CFSTR("displayUUID"), v20);
    v21 = (void *)objc_claimAutoreleasedReturnValue();

    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "id<BSInvalidatable>  _Nonnull BKSDisplayServicesSetMainDisplayCloneMirroringModeForDestinationDisplay(NSString *__strong _Nonnull, BKSDisplayServicesCloneMirroringMode)");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buffer = 138544130;
      v34 = v22;
      v35 = 2114;
      v36 = CFSTR("BKSDisplayServices.m");
      v37 = 1024;
      v38 = 430;
      v39 = 2114;
      v40 = v21;
      _os_log_error_impl(&dword_18A0F0000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "failure in %{public}@ (%{public}@:%i) : %{public}@", (uint8_t *)buffer, 0x26u);

    }
    objc_msgSend(objc_retainAutorelease(v21), "UTF8String");
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x18A11F0D0);
  }
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    v23 = (void *)MEMORY[0x1E0CB3940];
    v24 = (objc_class *)objc_msgSend(v3, "classForCoder");
    if (!v24)
      v24 = (objc_class *)objc_opt_class();
    NSStringFromClass(v24);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v26 = (objc_class *)objc_opt_class();
    NSStringFromClass(v26);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "stringWithFormat:", CFSTR("Value for '%@' was of unexpected class %@. Expected %@."), CFSTR("displayUUID"), v25, v27);
    v28 = (void *)objc_claimAutoreleasedReturnValue();

    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "id<BSInvalidatable>  _Nonnull BKSDisplayServicesSetMainDisplayCloneMirroringModeForDestinationDisplay(NSString *__strong _Nonnull, BKSDisplayServicesCloneMirroringMode)");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buffer = 138544130;
      v34 = v29;
      v35 = 2114;
      v36 = CFSTR("BKSDisplayServices.m");
      v37 = 1024;
      v38 = 430;
      v39 = 2114;
      v40 = v28;
      _os_log_error_impl(&dword_18A0F0000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "failure in %{public}@ (%{public}@:%i) : %{public}@", (uint8_t *)buffer, 0x26u);

    }
    objc_msgSend(objc_retainAutorelease(v28), "UTF8String");
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x18A11F1E4);
  }

  if (!BKSDisplayServicesSetMainDisplayCloneMirroringModeForDestinationDisplay_displayToModeCache)
  {
    v6 = objc_alloc_init(MEMORY[0x1E0C99E08]);
    v7 = (void *)BKSDisplayServicesSetMainDisplayCloneMirroringModeForDestinationDisplay_displayToModeCache;
    BKSDisplayServicesSetMainDisplayCloneMirroringModeForDestinationDisplay_displayToModeCache = (uint64_t)v6;

  }
  v8 = objc_alloc_init(_BKSCloneMirroringModeRequest);
  -[_BKSCloneMirroringModeRequest setDisplayUUID:](v8, "setDisplayUUID:", v3);
  -[_BKSCloneMirroringModeRequest setMode:](v8, "setMode:", a2);
  v9 = objc_alloc(MEMORY[0x1E0D01868]);
  v10 = (void *)MEMORY[0x1E0CB3940];
  NSStringFromBKSDisplayServicesCloneMirroringMode(a2);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "stringWithFormat:", CFSTR("%@:%@"), v3, v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v30[0] = MEMORY[0x1E0C809B0];
  v30[1] = 3221225472;
  v30[2] = __BKSDisplayServicesSetMainDisplayCloneMirroringModeForDestinationDisplay_block_invoke;
  v30[3] = &unk_1E1EA1378;
  v13 = (__CFString *)v3;
  v31 = v13;
  v14 = v8;
  v32 = v14;
  v15 = (void *)objc_msgSend(v9, "initWithIdentifier:forReason:invalidationBlock:", v12, CFSTR("CloneMirroring"), v30);

  objc_msgSend((id)BKSDisplayServicesSetMainDisplayCloneMirroringModeForDestinationDisplay_displayToModeCache, "objectForKey:", v13);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = objc_msgSend(v16, "count");

  objc_msgSend((id)BKSDisplayServicesSetMainDisplayCloneMirroringModeForDestinationDisplay_displayToModeCache, "bs_addObject:toCollectionClass:forKey:", v14, objc_opt_class(), v13);
  if (!v17)
  {
    bzero(buffer, 0x400uLL);
    CFStringGetCString(v13, buffer, 1024, 0x8000100u);
    v18 = _BKSServerPortHelper("com.apple.backboard.display.services", BKSDisplayServerPort, &BKSDisplayServerMachPort, (void (__cdecl *)(CFMachPortRef, void *))_InvalidateDisplayServicesPort);
    _BKSDisplaySetCloneMirroringModeForDestinationDisplay(v18, buffer, a2);
  }

  return v15;
}

uint64_t BKSDisplayServicesSetCloneRotationDisabled(char a1)
{
  mach_port_t v2;

  v2 = _BKSServerPortHelper("com.apple.backboard.display.services", BKSDisplayServerPort, &BKSDisplayServerMachPort, (void (__cdecl *)(CFMachPortRef, void *))_InvalidateDisplayServicesPort);
  return _BKSDisplaySetCloneRotationDisabled(v2, a1);
}

BOOL BKSDisplayServicesTetherPrefsNeedImmediateUpdate()
{
  int v0;
  char v2;

  v2 = 0;
  v0 = _BKSServerPortHelper("com.apple.backboard.display.services", BKSDisplayServerPort, &BKSDisplayServerMachPort, (void (__cdecl *)(CFMachPortRef, void *))_InvalidateDisplayServicesPort);
  _BKSDisplayTetherPrefsNeedImmediateUpdate(v0, &v2);
  return v2 != 0;
}

uint64_t BKSDisplayServicesSetTetheredOrientationNotificationsDisabled(char a1)
{
  int v2;

  v2 = _BKSServerPortHelper("com.apple.backboard.display.services", BKSDisplayServerPort, &BKSDisplayServerMachPort, (void (__cdecl *)(CFMachPortRef, void *))_InvalidateDisplayServicesPort);
  return _BKSDisplaySetTetheredOrientationNotificationsDisabled(v2, a1);
}

uint64_t BKSDisplaySetSecureMode(char a1)
{
  int v2;

  v2 = _BKSServerPortHelper("com.apple.backboard.display.services", BKSDisplayServerPort, &BKSDisplayServerMachPort, (void (__cdecl *)(CFMachPortRef, void *))_InvalidateDisplayServicesPort);
  return _BKSDisplaySetSecureMode(v2, a1);
}

void BKSDisplayServicesSetArrangement(void *a1)
{
  id v1;
  uint64_t v2;
  void *v3;
  NSObject *v4;
  const char *v5;
  NSObject *v6;
  uint32_t v7;
  int v8;
  id v9;
  int v10;
  int v11;
  int v12;
  id v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v1 = a1;
  objc_msgSend(MEMORY[0x1E0DE7910], "bs_secureDataFromObject:", v1);
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = (void *)v2;
  if (v1 && !v2)
  {
    BKLogCommon();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      v12 = 138543362;
      v13 = v1;
      v5 = "Error encoding arrangement: %{public}@";
      v6 = v4;
      v7 = 12;
LABEL_10:
      _os_log_error_impl(&dword_18A0F0000, v6, OS_LOG_TYPE_ERROR, v5, (uint8_t *)&v12, v7);
      goto LABEL_7;
    }
    goto LABEL_7;
  }
  v8 = _BKSServerPortHelper("com.apple.backboard.display.services", BKSDisplayServerPort, &BKSDisplayServerMachPort, (void (__cdecl *)(CFMachPortRef, void *))_InvalidateDisplayServicesPort);
  v9 = objc_retainAutorelease(v3);
  v10 = _BKSDisplaySetArrangement(v8, objc_msgSend(v9, "bytes"), objc_msgSend(v9, "length"));
  if (v10)
  {
    v11 = v10;
    BKLogCommon();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      v12 = 67109120;
      LODWORD(v13) = v11;
      v5 = "Error sending arrangement: 0x%x";
      v6 = v4;
      v7 = 8;
      goto LABEL_10;
    }
LABEL_7:

  }
}

void BKSDisplayServicesDrawPersistentScreenSnapshot()
{
  void *v0;
  BKSDisplayRenderOverlay *v1;
  id v2;

  objc_msgSend(getCADisplayClass(), "mainDisplay");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  +[BKSDisplayRenderOverlayDescriptor descriptorWithName:display:](BKSDisplayRenderOverlayDescriptor, "descriptorWithName:display:", CFSTR("BKSDisplayServicesDrawPersistentScreenSnapshot"), v0);
  v2 = (id)objc_claimAutoreleasedReturnValue();

  v1 = -[BKSDisplayRenderOverlay initWithDescriptor:]([BKSDisplayRenderOverlay alloc], "initWithDescriptor:", v2);
  -[BKSDisplayRenderOverlay present](v1, "present");

}

void BKSDisplayServicesTearDownPersistentScreenSnapshot()
{
  void *v0;
  id v1;

  objc_msgSend(getCADisplayClass(), "mainDisplay");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  +[BKSDisplayRenderOverlay existingOverlayForDisplay:](BKSDisplayRenderOverlay, "existingOverlayForDisplay:", v0);
  v1 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v1, "dismiss");
}

BKSDisplayRenderOverlay *BKSDisplayServicesGetRenderOverlayForDisplay(void *a1)
{
  id v1;
  void *v2;
  __CFString *v3;
  mach_port_name_t v4;
  BKSDisplayRenderOverlay *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v10;
  objc_class *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  objc_class *v16;
  void *v17;
  objc_class *v18;
  void *v19;
  void *v20;
  void *v21;
  unsigned int v22;
  uint64_t v23;
  char buffer[4];
  void *v25;
  __int16 v26;
  const __CFString *v27;
  __int16 v28;
  int v29;
  __int16 v30;
  void *v31;
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  v1 = a1;
  if (!v1)
  {
    v10 = (void *)MEMORY[0x1E0CB3940];
    getCADisplayClass();
    v11 = (objc_class *)objc_opt_class();
    NSStringFromClass(v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "stringWithFormat:", CFSTR("Value for '%@' was unexpectedly nil. Expected %@."), CFSTR("display"), v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "BKSDisplayRenderOverlay * _Nonnull BKSDisplayServicesGetRenderOverlayForDisplay(CADisplay *__strong _Nonnull)");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buffer = 138544130;
      v25 = v14;
      v26 = 2114;
      v27 = CFSTR("BKSDisplayServices.m");
      v28 = 1024;
      v29 = 538;
      v30 = 2114;
      v31 = v13;
      _os_log_error_impl(&dword_18A0F0000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "failure in %{public}@ (%{public}@:%i) : %{public}@", (uint8_t *)buffer, 0x26u);

    }
    objc_msgSend(objc_retainAutorelease(v13), "UTF8String");
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x18A11F960);
  }
  v2 = v1;
  getCADisplayClass();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    v15 = (void *)MEMORY[0x1E0CB3940];
    v16 = (objc_class *)objc_msgSend(v2, "classForCoder");
    if (!v16)
      v16 = (objc_class *)objc_opt_class();
    NSStringFromClass(v16);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    getCADisplayClass();
    v18 = (objc_class *)objc_opt_class();
    NSStringFromClass(v18);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "stringWithFormat:", CFSTR("Value for '%@' was of unexpected class %@. Expected %@."), CFSTR("display"), v17, v19);
    v20 = (void *)objc_claimAutoreleasedReturnValue();

    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "BKSDisplayRenderOverlay * _Nonnull BKSDisplayServicesGetRenderOverlayForDisplay(CADisplay *__strong _Nonnull)");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buffer = 138544130;
      v25 = v21;
      v26 = 2114;
      v27 = CFSTR("BKSDisplayServices.m");
      v28 = 1024;
      v29 = 538;
      v30 = 2114;
      v31 = v20;
      _os_log_error_impl(&dword_18A0F0000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "failure in %{public}@ (%{public}@:%i) : %{public}@", (uint8_t *)buffer, 0x26u);

    }
    objc_msgSend(objc_retainAutorelease(v20), "UTF8String");
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x18A11FA78);
  }

  objc_msgSend(v2, "uniqueId");
  v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  bzero(buffer, 0x400uLL);
  if (v3)
    CFStringGetCString(v3, buffer, 1024, 0x8000100u);
  v23 = 0;
  v22 = 0;
  v4 = _BKSServerPortHelper("com.apple.backboard.display.services", BKSDisplayServerPort, &BKSDisplayServerMachPort, (void (__cdecl *)(CFMachPortRef, void *))_InvalidateDisplayServicesPort);
  v5 = 0;
  if (!_BKSDisplayRenderOverlay(v4, buffer, &v23, &v22))
  {
    objc_msgSend(MEMORY[0x1E0C99D50], "bs_dataWithVMAllocatedBytes:length:", v23, v22);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (v6)
    {
      +[BKSDisplayRenderOverlayDescriptor _classesRequiredToDecode](BKSDisplayRenderOverlayDescriptor, "_classesRequiredToDecode");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      +[BKSDisplayRenderOverlayDescriptor bs_secureDecodedFromData:withAdditionalClasses:](BKSDisplayRenderOverlayDescriptor, "bs_secureDecodedFromData:withAdditionalClasses:", v6, v7);
      v8 = (void *)objc_claimAutoreleasedReturnValue();

      if (v8)
        v5 = -[BKSDisplayRenderOverlay initWithDescriptor:]([BKSDisplayRenderOverlay alloc], "initWithDescriptor:", v8);
      else
        v5 = 0;

    }
    else
    {
      v5 = 0;
    }

  }
  return v5;
}

BOOL BKSDisplayServicesApplyRenderOverlay(void *a1, void *a2)
{
  id v3;
  id v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  _BOOL8 v10;
  void *v12;
  objc_class *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  objc_class *v18;
  void *v19;
  objc_class *v20;
  void *v21;
  void *v22;
  void *v23;
  uint8_t buf[4];
  void *v25;
  __int16 v26;
  const __CFString *v27;
  __int16 v28;
  int v29;
  __int16 v30;
  void *v31;
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  v3 = a1;
  v4 = a2;
  v5 = v3;
  if (!v5)
  {
    v12 = (void *)MEMORY[0x1E0CB3940];
    v13 = (objc_class *)objc_opt_class();
    NSStringFromClass(v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "stringWithFormat:", CFSTR("Value for '%@' was unexpectedly nil. Expected %@."), CFSTR("overlay"), v14);
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "BOOL BKSDisplayServicesApplyRenderOverlay(BKSDisplayRenderOverlay *__strong _Nonnull, BSAnimationSettings *__strong _Nullable)");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138544130;
      v25 = v16;
      v26 = 2114;
      v27 = CFSTR("BKSDisplayServices.m");
      v28 = 1024;
      v29 = 564;
      v30 = 2114;
      v31 = v15;
      _os_log_error_impl(&dword_18A0F0000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "failure in %{public}@ (%{public}@:%i) : %{public}@", buf, 0x26u);

    }
    objc_msgSend(objc_retainAutorelease(v15), "UTF8String");
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x18A11FCD8);
  }
  v6 = v5;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    v17 = (void *)MEMORY[0x1E0CB3940];
    v18 = (objc_class *)objc_msgSend(v6, "classForCoder");
    if (!v18)
      v18 = (objc_class *)objc_opt_class();
    NSStringFromClass(v18);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = (objc_class *)objc_opt_class();
    NSStringFromClass(v20);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "stringWithFormat:", CFSTR("Value for '%@' was of unexpected class %@. Expected %@."), CFSTR("overlay"), v19, v21);
    v22 = (void *)objc_claimAutoreleasedReturnValue();

    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "BOOL BKSDisplayServicesApplyRenderOverlay(BKSDisplayRenderOverlay *__strong _Nonnull, BSAnimationSettings *__strong _Nullable)");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138544130;
      v25 = v23;
      v26 = 2114;
      v27 = CFSTR("BKSDisplayServices.m");
      v28 = 1024;
      v29 = 564;
      v30 = 2114;
      v31 = v22;
      _os_log_error_impl(&dword_18A0F0000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "failure in %{public}@ (%{public}@:%i) : %{public}@", buf, 0x26u);

    }
    objc_msgSend(objc_retainAutorelease(v22), "UTF8String");
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x18A11FDF0);
  }

  objc_msgSend(getCATransactionClass(), "flush");
  objc_msgSend(getCATransactionClass(), "synchronize");
  objc_msgSend(v6, "_descriptor");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "bs_secureEncoded");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "bs_secureEncoded");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v7) = _BKSServerPortHelper("com.apple.backboard.display.services", BKSDisplayServerPort, &BKSDisplayServerMachPort, (void (__cdecl *)(CFMachPortRef, void *))_InvalidateDisplayServicesPort);
  v10 = _BKSDisplayApplyRenderOverlay((mach_port_t)v7, objc_msgSend(v8, "bs_bytesForMIG"), objc_msgSend(v8, "bs_lengthForMIG"), objc_msgSend(v9, "bs_bytesForMIG"), objc_msgSend(v9, "bs_lengthForMIG")) == 0;

  return v10;
}

id getCATransactionClass()
{
  void *v0;
  id v1;
  _QWORD v3[5];
  uint64_t v4;
  uint64_t *v5;
  uint64_t v6;
  uint64_t v7;

  v4 = 0;
  v5 = &v4;
  v6 = 0x2050000000;
  v0 = (void *)getCATransactionClass_softClass;
  v7 = getCATransactionClass_softClass;
  if (!getCATransactionClass_softClass)
  {
    v3[0] = MEMORY[0x1E0C809B0];
    v3[1] = 3221225472;
    v3[2] = __getCATransactionClass_block_invoke;
    v3[3] = &unk_1E1EA0D38;
    v3[4] = &v4;
    __getCATransactionClass_block_invoke((uint64_t)v3);
    v0 = (void *)v5[3];
  }
  v1 = v0;
  _Block_object_dispose(&v4, 8);
  return v1;
}

void sub_18A11FE98(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void __getCATransactionClass_block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;

  QuartzCoreLibrary();
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = objc_getClass("CATransaction");
  if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
  {
    getCATransactionClass_softClass = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "Class getCATransactionClass(void)_block_invoke");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "handleFailureInFunction:file:lineNumber:description:", v3, CFSTR("BKSDisplayServices.m"), 43, CFSTR("Unable to find class %s"), "CATransaction");

    __break(1u);
  }
}

BOOL BKSDisplayServicesRemoveRenderOverlay(void *a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  _BOOL8 v7;

  v3 = a2;
  objc_msgSend(a1, "_descriptor");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "bs_secureEncoded");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v3, "bs_secureEncoded");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  LODWORD(v3) = _BKSServerPortHelper("com.apple.backboard.display.services", BKSDisplayServerPort, &BKSDisplayServerMachPort, (void (__cdecl *)(CFMachPortRef, void *))_InvalidateDisplayServicesPort);
  v7 = _BKSDisplayRemoveRenderOverlay((mach_port_t)v3, objc_msgSend(v5, "bs_bytesForMIG"), objc_msgSend(v5, "bs_lengthForMIG"), objc_msgSend(v6, "bs_bytesForMIG"), objc_msgSend(v6, "bs_lengthForMIG")) == 0;

  return v7;
}

BOOL BKSDisplayServicesFreezeRenderOverlay(void *a1)
{
  id v1;
  void *v2;
  void *v3;
  void *v4;
  _BOOL8 v5;
  void *v7;
  objc_class *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  objc_class *v13;
  void *v14;
  objc_class *v15;
  void *v16;
  void *v17;
  void *v18;
  uint8_t buf[4];
  void *v20;
  __int16 v21;
  const __CFString *v22;
  __int16 v23;
  int v24;
  __int16 v25;
  void *v26;
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v1 = a1;
  if (!v1)
  {
    v7 = (void *)MEMORY[0x1E0CB3940];
    v8 = (objc_class *)objc_opt_class();
    NSStringFromClass(v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "stringWithFormat:", CFSTR("Value for '%@' was unexpectedly nil. Expected %@."), CFSTR("overlay"), v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "BOOL BKSDisplayServicesFreezeRenderOverlay(BKSDisplayRenderOverlay *__strong _Nonnull)");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138544130;
      v20 = v11;
      v21 = 2114;
      v22 = CFSTR("BKSDisplayServices.m");
      v23 = 1024;
      v24 = 588;
      v25 = 2114;
      v26 = v10;
      _os_log_error_impl(&dword_18A0F0000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "failure in %{public}@ (%{public}@:%i) : %{public}@", buf, 0x26u);

    }
    objc_msgSend(objc_retainAutorelease(v10), "UTF8String");
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x18A120254);
  }
  v2 = v1;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    v12 = (void *)MEMORY[0x1E0CB3940];
    v13 = (objc_class *)objc_msgSend(v2, "classForCoder");
    if (!v13)
      v13 = (objc_class *)objc_opt_class();
    NSStringFromClass(v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = (objc_class *)objc_opt_class();
    NSStringFromClass(v15);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "stringWithFormat:", CFSTR("Value for '%@' was of unexpected class %@. Expected %@."), CFSTR("overlay"), v14, v16);
    v17 = (void *)objc_claimAutoreleasedReturnValue();

    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "BOOL BKSDisplayServicesFreezeRenderOverlay(BKSDisplayRenderOverlay *__strong _Nonnull)");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138544130;
      v20 = v18;
      v21 = 2114;
      v22 = CFSTR("BKSDisplayServices.m");
      v23 = 1024;
      v24 = 588;
      v25 = 2114;
      v26 = v17;
      _os_log_error_impl(&dword_18A0F0000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "failure in %{public}@ (%{public}@:%i) : %{public}@", buf, 0x26u);

    }
    objc_msgSend(objc_retainAutorelease(v17), "UTF8String");
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x18A12036CLL);
  }

  objc_msgSend(v2, "_descriptor");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "bs_secureEncoded");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  LODWORD(v3) = _BKSServerPortHelper("com.apple.backboard.display.services", BKSDisplayServerPort, &BKSDisplayServerMachPort, (void (__cdecl *)(CFMachPortRef, void *))_InvalidateDisplayServicesPort);
  v5 = _BKSDisplayFreezeRenderOverlay((mach_port_t)v3, objc_msgSend(v4, "bs_bytesForMIG"), objc_msgSend(v4, "bs_lengthForMIG")) == 0;

  return v5;
}

void BKSDisplayServicesDismissInterstitialRenderOverlay(void *a1)
{
  mach_port_t v1;
  id v2;

  objc_msgSend(a1, "bs_secureEncoded");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  v1 = _BKSServerPortHelper("com.apple.backboard.display.services", BKSDisplayServerPort, &BKSDisplayServerMachPort, (void (__cdecl *)(CFMachPortRef, void *))_InvalidateDisplayServicesPort);
  _BKSDisplayDismissInterstitialRenderOverlay(v1, objc_msgSend(v2, "bs_bytesForMIG"), objc_msgSend(v2, "bs_lengthForMIG"));

}

id BKSDisplayServicesGetRenderOverlayDismissActions()
{
  int v0;
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  __objc2_class **v12;
  void *v13;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  unsigned int v19;
  uint64_t v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v20 = 0;
  v19 = 0;
  v0 = _BKSServerPortHelper("com.apple.backboard.display.services", BKSDisplayServerPort, &BKSDisplayServerMachPort, (void (__cdecl *)(CFMachPortRef, void *))_InvalidateDisplayServicesPort);
  v1 = 0;
  if (!_BKSDisplayGetRenderOverlayDismissActions(v0, &v20, &v19))
  {
    objc_msgSend(MEMORY[0x1E0C99D50], "bs_dataWithVMAllocatedBytes:length:", v20, v19);
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    if (v2)
    {
      v3 = (void *)MEMORY[0x1E0C99E60];
      +[BKSDisplayRenderOverlayDescriptor _classesRequiredToDecode](BKSDisplayRenderOverlayDescriptor, "_classesRequiredToDecode");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "bs_secureDecodedFromData:withAdditionalClasses:", v2, v4);
      v5 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(MEMORY[0x1E0C99E20], "set");
      v1 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = 0u;
      v16 = 0u;
      v17 = 0u;
      v18 = 0u;
      v6 = v5;
      v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v15, v21, 16);
      if (v7)
      {
        v8 = v7;
        v9 = *(_QWORD *)v16;
        do
        {
          for (i = 0; i != v8; ++i)
          {
            if (*(_QWORD *)v16 != v9)
              objc_enumerationMutation(v6);
            v11 = *(void **)(*((_QWORD *)&v15 + 1) + 8 * i);
            if (objc_msgSend(v11, "isInterstitial", (_QWORD)v15))
              v12 = off_1E1E9EC48;
            else
              v12 = off_1E1E9EC58;
            v13 = (void *)objc_msgSend(objc_alloc(*v12), "initWithDescriptor:", v11);
            objc_msgSend(v1, "addObject:", v13);

          }
          v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v15, v21, 16);
        }
        while (v8);
      }

    }
    else
    {
      v1 = 0;
    }

  }
  return v1;
}

void BKSDisplayServicesArchiveWithOptionsAndCompletion(char a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  uint64_t v19;
  id v20;
  id v21;
  id v22;
  void *v23;
  NSObject *v24;
  _BOOL4 v25;
  void *v26;
  NSObject *v27;
  void *v28;
  void *v29;
  _QWORD v30[4];
  id v31;
  id v32;
  id v33;
  _QWORD v34[4];
  id v35;
  id v36;
  id v37;
  uint8_t buf[16];
  _QWORD v39[4];
  id v40;
  id v41;
  id v42;

  v3 = a2;
  if (v3)
  {
    v4 = (void *)MEMORY[0x18D768990]();
    v5 = (void *)objc_opt_new();
    v6 = (void *)MEMORY[0x1E0D03458];
    objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "endpointForServiceName:oneshot:service:instance:", CFSTR("com.apple.backboard.display.archive"), v7, CFSTR("DisplayArchive"), 0);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    if (v8)
    {
      v29 = v4;
      objc_msgSend(MEMORY[0x1E0D03448], "NSXPCConnectionWithEndpoint:configurator:", v8, &__block_literal_global_102);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3B50], "interfaceWithProtocol:", &unk_1EDF66260);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = (void *)MEMORY[0x1E0C99E60];
      v12 = objc_opt_class();
      v13 = objc_opt_class();
      objc_msgSend(v11, "setWithObjects:", v12, v13, objc_opt_class(), 0);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "setClasses:forSelector:argumentIndex:ofReply:", v14, sel_nameAndDumpAllWithCompletion_, 0, 1);

      v15 = (void *)MEMORY[0x1E0C99E60];
      v16 = objc_opt_class();
      v17 = objc_opt_class();
      objc_msgSend(v15, "setWithObjects:", v16, v17, objc_opt_class(), 0);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "setClasses:forSelector:argumentIndex:ofReply:", v18, sel_dumpAllWithCompletion_, 0, 1);

      objc_msgSend(v9, "setRemoteObjectInterface:", v10);
      objc_msgSend(v9, "activate");
      v19 = MEMORY[0x1E0C809B0];
      v39[0] = MEMORY[0x1E0C809B0];
      v39[1] = 3221225472;
      v39[2] = __BKSDisplayServicesArchiveWithOptionsAndCompletion_block_invoke_2;
      v39[3] = &unk_1E1EA0590;
      v20 = v5;
      v40 = v20;
      v21 = v3;
      v42 = v21;
      v22 = v9;
      v41 = v22;
      objc_msgSend(v22, "remoteObjectProxyWithErrorHandler:", v39);
      v23 = (void *)objc_claimAutoreleasedReturnValue();

      if (v23)
      {
        BKLogDisplayArchive();
        v24 = objc_claimAutoreleasedReturnValue();
        v25 = os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT);
        if ((a1 & 1) != 0)
        {
          if (v25)
          {
            *(_WORD *)buf = 0;
            _os_log_impl(&dword_18A0F0000, v24, OS_LOG_TYPE_DEFAULT, "sending name layers and dump all to service", buf, 2u);
          }

          v34[0] = v19;
          v34[1] = 3221225472;
          v34[2] = __BKSDisplayServicesArchiveWithOptionsAndCompletion_block_invoke_114;
          v34[3] = &unk_1E1EA05B8;
          v35 = v20;
          v37 = v21;
          v22 = v22;
          v36 = v22;
          objc_msgSend(v23, "nameAndDumpAllWithCompletion:", v34);

          v26 = v35;
        }
        else
        {
          if (v25)
          {
            *(_WORD *)buf = 0;
            _os_log_impl(&dword_18A0F0000, v24, OS_LOG_TYPE_DEFAULT, "sending dump all to service", buf, 2u);
          }

          v30[0] = v19;
          v30[1] = 3221225472;
          v30[2] = __BKSDisplayServicesArchiveWithOptionsAndCompletion_block_invoke_116;
          v30[3] = &unk_1E1EA05B8;
          v31 = v20;
          v33 = v21;
          v22 = v22;
          v32 = v22;
          objc_msgSend(v23, "dumpAllWithCompletion:", v30);

          v26 = v31;
        }

        v4 = v29;
LABEL_18:

        objc_autoreleasePoolPop(v4);
        goto LABEL_19;
      }
      v4 = v29;
    }
    else
    {
      BKLogDisplayArchive();
      v27 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_error_impl(&dword_18A0F0000, v27, OS_LOG_TYPE_ERROR, "failed to lookup endpoint to service", buf, 2u);
      }

      v22 = 0;
    }
    if (objc_msgSend(v5, "signal"))
    {
      objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CB28A8], 4097, 0);
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      (*((void (**)(id, _QWORD, void *))v3 + 2))(v3, MEMORY[0x1E0C9AA70], v28);

      objc_msgSend(v22, "invalidate");
    }
    goto LABEL_18;
  }
LABEL_19:

}

void sub_18A122FCC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, id location)
{
  id *v17;

  objc_destroyWeak(v17);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_18A123864(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
  id *v16;

  objc_destroyWeak(v16);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

__CFString *NSStringFromBKSTouchAuthenticationInitialSampleEvent(unint64_t a1)
{
  if (a1 < 3)
    return off_1E1EA07E8[a1];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("<invalid:%X>"), a1);
  return (__CFString *)(id)objc_claimAutoreleasedReturnValue();
}

CFRunLoopSourceRef BKCreateMIGServerSource(uint64_t a1, int a2, CFIndex a3)
{
  return BKCreateMIGServerSourceWithContext(a1, a2, a3, 0);
}

CFStringRef migHelperCopyDescription(unsigned int *a1)
{
  return CFStringCreateWithFormat(0, 0, CFSTR("<CFRunLoopSource MIG Server> {port = %u, subsystem = %p, context = %p}"), *a1, *((_QWORD *)a1 + 1), *((_QWORD *)a1 + 2));
}

BOOL migHelperEqual(_DWORD *a1, _DWORD *a2)
{
  return *a1 == *a2;
}

uint64_t migHelperRecievePortCallout(mach_msg_header_t *a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v6;
  mach_msg_id_t msgh_id;
  int v8;
  BOOL v9;
  int v10;
  void (*v11)(mach_msg_header_t *, mach_msg_header_t *);
  char v12;
  size_t v13;
  mach_msg_header_t *v14;
  mach_msg_header_t *v15;
  mach_port_t msgh_remote_port;
  const void *v17;
  mach_msg_bits_t msgh_bits;
  mach_port_t v19;
  mach_msg_option_t v20;
  mach_msg_return_t v21;
  FILE *v23;
  char *v24;

  v6 = *(_QWORD *)(a4 + 8);
  msgh_id = a1->msgh_id;
  v8 = *(_DWORD *)(v6 + 8);
  v9 = __OFSUB__(msgh_id, v8);
  v10 = msgh_id - v8;
  if (v10 < 0 != v9 || msgh_id >= *(_DWORD *)(v6 + 12))
  {
    v11 = 0;
  }
  else
  {
    v11 = *(void (**)(mach_msg_header_t *, mach_msg_header_t *))(v6 + 40 * v10 + 40);
    if (v11)
    {
      v12 = 0;
      v13 = *(unsigned int *)(v6 + 40 * v10 + 64);
      goto LABEL_7;
    }
  }
  v12 = 1;
  v13 = 36;
LABEL_7:
  v14 = (mach_msg_header_t *)malloc_type_calloc(1uLL, v13, 0xA199083EuLL);
  if (v14)
  {
    v15 = v14;
    msgh_remote_port = a1->msgh_remote_port;
    v14->msgh_bits = a1->msgh_bits & 0x1F;
    v14->msgh_size = 36;
    *(_QWORD *)&v14->msgh_remote_port = msgh_remote_port;
    v14->msgh_id = a1->msgh_id + 100;
    if ((v12 & 1) != 0)
    {
      *(_QWORD *)&v14[1].msgh_bits = *MEMORY[0x1E0C804E8];
      v14[1].msgh_remote_port = -303;
    }
    else
    {
      v17 = *(const void **)(a4 + 16);
      if (v17)
      {
        pthread_setspecific(__BKMIGServerCalloutContextKey, v17);
        v11(a1, v15);
        pthread_setspecific(__BKMIGServerCalloutContextKey, 0);
      }
      else
      {
        v11(a1, v14);
      }
    }
    msgh_bits = v15->msgh_bits;
    if ((v15->msgh_bits & 0x80000000) == 0)
    {
      v19 = v15[1].msgh_remote_port;
      if (v19 == -305)
      {
LABEL_31:
        free(v15);
        return 0;
      }
      if (v19 && (a1->msgh_bits & 0x80000000) != 0)
      {
        a1->msgh_remote_port = 0;
        mach_msg_destroy(a1);
        msgh_bits = v15->msgh_bits;
      }
    }
    if (v15->msgh_remote_port)
    {
      if ((msgh_bits & 0x1F) == 0x12)
        v20 = 1;
      else
        v20 = 17;
      v21 = mach_msg(v15, v20, v15->msgh_size, 0, 0, 0, 0);
      if ((v21 - 268435459) >= 2 && v21 != 0)
      {
        v23 = (FILE *)*MEMORY[0x1E0C80C10];
        v24 = mach_error_string(v21);
        fprintf(v23, "<CFRunLoopSource MIG Server> mach_msg send error in reply: %s\n", v24);
        goto LABEL_31;
      }
      if ((v21 - 268435459) > 1)
        goto LABEL_31;
      msgh_bits = v15->msgh_bits;
    }
    if ((msgh_bits & 0x80000000) != 0)
      mach_msg_destroy(v15);
    goto LABEL_31;
  }
  return 0;
}

uint64_t BKGetMachPortForMIGServerSource(__CFRunLoopSource *a1)
{
  CFRunLoopSourceContext context;

  memset(&context.info, 0, 64);
  context.version = 1;
  CFRunLoopSourceGetContext(a1, &context);
  return *(unsigned int *)context.info;
}

void *BKGetContextForCalloutCurrentMIGServerSource()
{
  return pthread_getspecific(__BKMIGServerCalloutContextKey);
}

void _serverWasRestarted(uint64_t a1, void *a2)
{
  void *v3;

  v3 = (void *)MEMORY[0x18D768990]();
  objc_msgSend(a2, "_serverWasRestarted");
  objc_autoreleasePoolPop(v3);
}

uint64_t _BKXXDeliverAccelerometerEvent(double a1, float a2, float a3, float a4, uint64_t a5, uint64_t a6)
{
  void *v11;
  void *v12;
  double v13;
  double v14;
  double v15;

  pthread_getspecific(__BKMIGServerCalloutContextKey);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "delegate");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  *(float *)&v13 = a2;
  *(float *)&v14 = a3;
  *(float *)&v15 = a4;
  objc_msgSend(v12, "accelerometer:didAccelerateWithTimeStamp:x:y:z:eventType:", v11, a6, a1, v13, v14, v15);

  return 0;
}

void sub_18A129FBC(_Unwind_Exception *a1)
{
  id *v1;
  id *v2;
  uint64_t v3;

  objc_destroyWeak(v2);
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v3 - 72));
  _Unwind_Resume(a1);
}

uint64_t BKSDisplayBrightnessTransactionGetTypeID()
{
  if (__BKSDisplayBrightnessTransactionRegisterOnce != -1)
    dispatch_once(&__BKSDisplayBrightnessTransactionRegisterOnce, &__block_literal_global_5573);
  return __BKSDisplayBrightnessTransactionTypeID;
}

void BKSDisplayBrightnessTransactionDealloc(os_unfair_lock_s *a1)
{
  int v2;
  mach_port_name_t os_unfair_lock_opaque;

  v2 = _BKSServerPortHelper("com.apple.backboard.hid.services", BKSHIDServerPort, &BKSHIDServerMachPort, (void (__cdecl *)(CFMachPortRef, void *))_InvalidateHIDServicesPort);
  _BKSHIDFlushDisplayBrightnessUpdates(v2);
  os_unfair_lock_lock(a1 + 4);
  os_unfair_lock_opaque = a1[5]._os_unfair_lock_opaque;
  if (os_unfair_lock_opaque + 1 >= 2)
  {
    mach_port_mod_refs(*MEMORY[0x1E0C83DA0], os_unfair_lock_opaque, 1u, -1);
    a1[5]._os_unfair_lock_opaque = 0;
  }
  os_unfair_lock_unlock(a1 + 4);
}

_DWORD *BKSDisplayBrightnessTransactionCreate()
{
  _DWORD *Instance;
  mach_port_name_t v1;
  int v2;
  mach_port_name_t name;

  if (__BKSDisplayBrightnessTransactionRegisterOnce != -1)
    dispatch_once(&__BKSDisplayBrightnessTransactionRegisterOnce, &__block_literal_global_5573);
  Instance = (_DWORD *)_CFRuntimeCreateInstance();
  if (Instance)
  {
    name = 0;
    if (mach_port_allocate(*MEMORY[0x1E0C83DA0], 1u, &name)
      || (v1 = name,
          Instance[4] = 0,
          Instance[5] = v1,
          v2 = _BKSServerPortHelper("com.apple.backboard.hid.services", BKSHIDServerPort, &BKSHIDServerMachPort, (void (__cdecl *)(CFMachPortRef, void *))_InvalidateHIDServicesPort), _BKSHIDBeginDisplayBrightnessTransaction(v2, Instance[5])))
    {
      CFRelease(Instance);
      return 0;
    }
  }
  return Instance;
}

uint64_t BKSDisplayBrightnessSet(char a1, float a2)
{
  mach_port_t v4;

  v4 = _BKSServerPortHelper("com.apple.backboard.hid.services", BKSHIDServerPort, &BKSHIDServerMachPort, (void (__cdecl *)(CFMachPortRef, void *))_InvalidateHIDServicesPort);
  return _BKSHIDSetDisplayBrightnessValue(v4, a1, a2);
}

uint64_t BKSDisplayBrightnessSetWithImplicitTransaction(float a1)
{
  int v2;

  v2 = _BKSServerPortHelper("com.apple.backboard.hid.services", BKSHIDServerPort, &BKSHIDServerMachPort, (void (__cdecl *)(CFMachPortRef, void *))_InvalidateHIDServicesPort);
  return _BKSHIDSetDisplayBrightnessWithImplicitTransaction(v2, a1);
}

uint64_t BKSDisplayBrightnessRestoreSystemBrightness()
{
  mach_port_t v0;

  v0 = _BKSServerPortHelper("com.apple.backboard.hid.services", BKSHIDServerPort, &BKSHIDServerMachPort, (void (__cdecl *)(CFMachPortRef, void *))_InvalidateHIDServicesPort);
  return _BKSHIDRestoreSystemDisplayBrightness(v0);
}

uint64_t BKSDisplayBrightnessCurveSet(char a1)
{
  mach_port_t v2;

  v2 = _BKSServerPortHelper("com.apple.backboard.hid.services", BKSHIDServerPort, &BKSHIDServerMachPort, (void (__cdecl *)(CFMachPortRef, void *))_InvalidateHIDServicesPort);
  return _BKSHIDSetDisplayBrightnessCurveValue(v2, a1);
}

uint64_t BKSDisplayBrightnessCurveGetCurrent()
{
  int v0;
  unsigned __int8 v2;

  v2 = 0;
  v0 = _BKSServerPortHelper("com.apple.backboard.hid.services", BKSHIDServerPort, &BKSHIDServerMachPort, (void (__cdecl *)(CFMachPortRef, void *))_InvalidateHIDServicesPort);
  _BKSHIDGetCurrentDisplayBrightnessCurve(v0, &v2);
  return v2;
}

uint64_t BKSDisplayBrightnessSetAutoBrightnessEnabled(char a1)
{
  mach_port_t v2;

  v2 = _BKSServerPortHelper("com.apple.backboard.hid.services", BKSHIDServerPort, &BKSHIDServerMachPort, (void (__cdecl *)(CFMachPortRef, void *))_InvalidateHIDServicesPort);
  return _BKSHIDSetAutoDisplayBrightnessEnabled(v2, a1);
}

BOOL BKSDisplayBrightnessIsAutoBrightnessAvailable()
{
  int v0;
  char v2;

  v2 = 0;
  v0 = _BKSServerPortHelper("com.apple.backboard.hid.services", BKSHIDServerPort, &BKSHIDServerMachPort, (void (__cdecl *)(CFMachPortRef, void *))_InvalidateHIDServicesPort);
  _BKSHIDBrigthnessIsAutoBrightnessAvailable(v0, &v2);
  return v2 != 0;
}

BOOL BKSDisplayBrightnessIsBrightnessLevelControlAvailable()
{
  int v0;
  char v2;

  v2 = 0;
  v0 = _BKSServerPortHelper("com.apple.backboard.hid.services", BKSHIDServerPort, &BKSHIDServerMachPort, (void (__cdecl *)(CFMachPortRef, void *))_InvalidateHIDServicesPort);
  _BKSHIDBrigthnessIsBrightnessLevelControlAvailable(v0, &v2);
  return v2 != 0;
}

id BKLogCommon()
{
  if (BKLogCommon_onceToken != -1)
    dispatch_once(&BKLogCommon_onceToken, &__block_literal_global_5712);
  return (id)BKLogCommon___logObj;
}

id BKLogDetailed()
{
  if (BKLogDetailed_onceToken != -1)
    dispatch_once(&BKLogDetailed_onceToken, &__block_literal_global_3);
  return (id)BKLogDetailed___logObj;
}

id BKLogAlternateSystemApp()
{
  if (BKLogAlternateSystemApp_onceToken != -1)
    dispatch_once(&BKLogAlternateSystemApp_onceToken, &__block_literal_global_11_5722);
  return (id)BKLogAlternateSystemApp___logObj;
}

id BKLogIdleTimer()
{
  if (BKLogIdleTimer_onceToken != -1)
    dispatch_once(&BKLogIdleTimer_onceToken, &__block_literal_global_13_5726);
  return (id)BKLogIdleTimer___logObj;
}

id BKLogDisplayArchive()
{
  if (BKLogDisplayArchive_onceToken != -1)
    dispatch_once(&BKLogDisplayArchive_onceToken, &__block_literal_global_19);
  return (id)BKLogDisplayArchive___logObj;
}

id BKLogSystemShell()
{
  if (BKLogSystemShell_onceToken != -1)
    dispatch_once(&BKLogSystemShell_onceToken, &__block_literal_global_25);
  return (id)BKLogSystemShell___logObj;
}

id BKLogKeyboard()
{
  if (BKLogKeyboard_onceToken != -1)
    dispatch_once(&BKLogKeyboard_onceToken, &__block_literal_global_33);
  return (id)BKLogKeyboard___logObj;
}

id BKLogHapticFeedback()
{
  if (BKLogHapticFeedback_onceToken != -1)
    dispatch_once(&BKLogHapticFeedback_onceToken, &__block_literal_global_35);
  return (id)BKLogHapticFeedback___logObj;
}

void sub_18A12DD94(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

Class __getCAFenceHandleClass_block_invoke(uint64_t a1)
{
  Class result;
  void *v3;
  void *v4;
  void *v5;

  if (!QuartzCoreLibraryCore_frameworkLibrary_5800)
    QuartzCoreLibraryCore_frameworkLibrary_5800 = _sl_dlopen();
  if (!QuartzCoreLibraryCore_frameworkLibrary_5800)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "void *QuartzCoreLibrary(void)");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "handleFailureInFunction:file:lineNumber:description:", v4, CFSTR("BKSAnimationFence.m"), 16, CFSTR("%s"), 0);

    goto LABEL_8;
  }
  result = objc_getClass("CAFenceHandle");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "Class getCAFenceHandleClass(void)_block_invoke");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "handleFailureInFunction:file:lineNumber:description:", v5, CFSTR("BKSAnimationFence.m"), 17, CFSTR("Unable to find class %s"), "CAFenceHandle");

LABEL_8:
    __break(1u);
  }
  getCAFenceHandleClass_softClass = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  return result;
}

__CFString *NSStringFromBKSMousePointerDeviceClickHapticStrength(unint64_t a1)
{
  if (a1 < 3)
    return off_1E1EA0C18[a1];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("<invalid:%X>"), a1);
  return (__CFString *)(id)objc_claimAutoreleasedReturnValue();
}

void BKSTerminateApplicationForReasonAndReportWithDescription(void *a1, uint64_t a2, uint64_t a3, void *a4)
{
  id v7;
  BKSSystemService *v8;
  id v9;

  v9 = a1;
  v7 = a4;
  if (!v9)
    __assert_rtn("BKSTerminateApplicationForReasonAndReportWithDescription", "BKSApplicationTermination.m", 19, "bundleID");
  v8 = objc_alloc_init(BKSSystemService);
  -[BKSSystemService terminateApplication:forReason:andReport:withDescription:](v8, "terminateApplication:forReason:andReport:withDescription:", v9, a2, a3, v7);

}

id getCADisplayClass_6520()
{
  void *v0;
  id v1;
  _QWORD v3[5];
  uint64_t v4;
  uint64_t *v5;
  uint64_t v6;
  uint64_t v7;

  v4 = 0;
  v5 = &v4;
  v6 = 0x2050000000;
  v0 = (void *)getCADisplayClass_softClass_6521;
  v7 = getCADisplayClass_softClass_6521;
  if (!getCADisplayClass_softClass_6521)
  {
    v3[0] = MEMORY[0x1E0C809B0];
    v3[1] = 3221225472;
    v3[2] = __getCADisplayClass_block_invoke_6522;
    v3[3] = &unk_1E1EA0D38;
    v3[4] = &v4;
    __getCADisplayClass_block_invoke_6522((uint64_t)v3);
    v0 = (void *)v5[3];
  }
  v1 = v0;
  _Block_object_dispose(&v4, 8);
  return v1;
}

void sub_18A131190(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

Class __getCADisplayClass_block_invoke_6522(uint64_t a1)
{
  Class result;
  void *v3;
  void *v4;
  void *v5;

  if (!QuartzCoreLibraryCore_frameworkLibrary_6523)
    QuartzCoreLibraryCore_frameworkLibrary_6523 = _sl_dlopen();
  if (!QuartzCoreLibraryCore_frameworkLibrary_6523)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "void *QuartzCoreLibrary(void)");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "handleFailureInFunction:file:lineNumber:description:", v4, CFSTR("BKSDisplayRenderOverlayDescriptor.m"), 16, CFSTR("%s"), 0);

    goto LABEL_8;
  }
  result = objc_getClass("CADisplay");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "Class getCADisplayClass(void)_block_invoke");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "handleFailureInFunction:file:lineNumber:description:", v5, CFSTR("BKSDisplayRenderOverlayDescriptor.m"), 17, CFSTR("Unable to find class %s"), "CADisplay");

LABEL_8:
    __break(1u);
  }
  getCADisplayClass_softClass_6521 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  return result;
}

__CFString *NSStringFromBKSHIDEventSecureNameStatus(unint64_t a1)
{
  if (a1 < 3)
    return off_1E1EA0E30[a1];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("<status:%d>"), a1);
  return (__CFString *)(id)objc_claimAutoreleasedReturnValue();
}

__CFString *NSStringFromBKSHIDEventAuthenticationStatus(unint64_t a1)
{
  if (a1 < 4)
    return off_1E1EA0E10[a1];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("<status:%d>"), a1);
  return (__CFString *)(id)objc_claimAutoreleasedReturnValue();
}

void sub_18A133F44(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, id location)
{
  id *v18;

  objc_destroyWeak(v18);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

__CFString *NSStringFromBKSSystemShellCheckInStatus(unint64_t a1)
{
  if (a1 < 4)
    return off_1E1EA0FC8[a1];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("<invalid:%X>"), a1);
  return (__CFString *)(id)objc_claimAutoreleasedReturnValue();
}

void sub_18A1358C4(_Unwind_Exception *a1)
{
  id *v1;

  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

void sub_18A1373A8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,char a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,char a43)
{
  _Block_object_dispose(&a37, 8);
  _Block_object_dispose(&a43, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__7391(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__7392(uint64_t a1)
{

}

id NSStringFromBKSHIDEventHitTestLayerInformationMask(char a1)
{
  id v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  v2 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v3 = v2;
  if ((a1 & 2) != 0)
  {
    objc_msgSend(v2, "addObject:", CFSTR("cumulativeOpacity"));
    if ((a1 & 1) == 0)
    {
LABEL_3:
      if ((a1 & 0x10) == 0)
        goto LABEL_4;
      goto LABEL_11;
    }
  }
  else if ((a1 & 1) == 0)
  {
    goto LABEL_3;
  }
  objc_msgSend(v3, "addObject:", CFSTR("cumulativeTransform"));
  if ((a1 & 0x10) == 0)
  {
LABEL_4:
    if ((a1 & 0x20) == 0)
      goto LABEL_5;
    goto LABEL_12;
  }
LABEL_11:
  objc_msgSend(v3, "addObject:", CFSTR("cumulativeLayerTransform"));
  if ((a1 & 0x20) == 0)
  {
LABEL_5:
    if ((a1 & 8) == 0)
      goto LABEL_6;
LABEL_13:
    objc_msgSend(v3, "addObject:", CFSTR("backgroundStatistics"));
    if ((a1 & 4) == 0)
      goto LABEL_8;
    goto LABEL_7;
  }
LABEL_12:
  objc_msgSend(v3, "addObject:", CFSTR("cumulativeContentsTransform"));
  if ((a1 & 8) != 0)
    goto LABEL_13;
LABEL_6:
  if ((a1 & 4) != 0)
LABEL_7:
    objc_msgSend(v3, "addObject:", CFSTR("hasInsecureFilter"));
LABEL_8:
  v4 = (void *)MEMORY[0x1E0CB3940];
  objc_msgSend(v3, "componentsJoinedByString:", CFSTR(" | "));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "stringWithFormat:", CFSTR("(%@)"), v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

const __CFString *NSStringFromBKSButtonHapticAssetType(unint64_t a1)
{
  if (a1 > 3)
    return CFSTR("<unknown>");
  else
    return off_1E1EA12C0[a1];
}

void sub_18A13EB68(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

__CFString *NSStringFromBKSWindowServerHitTestOcclusionType(unint64_t a1)
{
  if (a1 < 4)
    return off_1E1EA1460[a1];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("<invalid:%X>"), a1);
  return (__CFString *)(id)objc_claimAutoreleasedReturnValue();
}

void *QuartzCoreLibrary_8992()
{
  void *v0;
  void *v2;
  void *v3;

  if (!QuartzCoreLibraryCore_frameworkLibrary_9005)
    QuartzCoreLibraryCore_frameworkLibrary_9005 = _sl_dlopen();
  v0 = (void *)QuartzCoreLibraryCore_frameworkLibrary_9005;
  if (!QuartzCoreLibraryCore_frameworkLibrary_9005)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v0 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "void *QuartzCoreLibrary(void)");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", v2, CFSTR("BKSWindowServerHitTestSecurityAnalysis.m"), 24, CFSTR("%s"), 0);

    __break(1u);
    free(v3);
  }
  return v0;
}

void sub_18A144224(_Unwind_Exception *a1)
{
  uint64_t v1;

  _Block_object_dispose((const void *)(v1 - 112), 8);
  _Unwind_Resume(a1);
}

void _BKSWatchdogSetServerWrapper(id obj)
{
  objc_storeStrong((id *)&__service, obj);
}

BOOL BKSWatchdogGetIsAlive(uint64_t a1)
{
  void *v2;
  BOOL v3;
  char v5;

  v5 = 0;
  v2 = (void *)BKSWatchdogGetIsAlive_sServerWrapper;
  if (!BKSWatchdogGetIsAlive_sServerWrapper)
  {
    if (_BKSGetWatchdogServerWrapper_onceToken != -1)
      dispatch_once(&_BKSGetWatchdogServerWrapper_onceToken, &__block_literal_global_9067);
    objc_storeStrong((id *)&BKSWatchdogGetIsAlive_sServerWrapper, (id)__service);
    v2 = (void *)BKSWatchdogGetIsAlive_sServerWrapper;
  }
  if (objc_msgSend(v2, "_BKSWatchdogGetIsAlive:isAlive:timeout:", _BKSServerPortHelper("com.apple.backboard.watchdog", BKSWatchdogPort, &BKSWatchdogMachPort, (void (__cdecl *)(CFMachPortRef, void *))_InvalidateWatchdogPort), &v5, a1))v3 = 1;
  else
    v3 = v5 == 0;
  return !v3;
}

__CFString *NSStringFromBKSHIDHapticFeedbackRequestDeviceType(uint64_t a1)
{
  __CFString *v1;

  if (!a1)
    return CFSTR("pencil");
  if (a1 == 1)
  {
    v1 = CFSTR("trackpad");
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("<unknown:%X>"), a1);
    v1 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  return v1;
}

__CFString *NSStringFromBKSTouchDeliveryUpdateType(unint64_t a1)
{
  if (a1 < 3)
    return off_1E1EA14C0[a1];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("<invalid:%X>"), a1);
  return (__CFString *)(id)objc_claimAutoreleasedReturnValue();
}

__CFString *NSStringFromBKSHIDUISensorChangeSource(unint64_t a1)
{
  __CFString *v1;

  if (a1 < 5 && ((0x1Bu >> a1) & 1) != 0)
  {
    v1 = off_1E1EA1558[a1];
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("<unknown:%X>"), a1);
    v1 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  return v1;
}

__CFString *NSStringFromBKSHIDUISensorDisplayState(unint64_t a1)
{
  if (a1 < 4)
    return off_1E1EA1580[a1];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("<unknown:%X>"), a1);
  return (__CFString *)(id)objc_claimAutoreleasedReturnValue();
}

id BKLogOrientationClient()
{
  if (BKLogOrientationClient_onceToken != -1)
    dispatch_once(&BKLogOrientationClient_onceToken, &__block_literal_global_10777);
  return (id)BKLogOrientationClient___logObj;
}

id BKLogOrientationHostUI()
{
  if (BKLogOrientationHostUI_onceToken != -1)
    dispatch_once(&BKLogOrientationHostUI_onceToken, &__block_literal_global_6_10781);
  return (id)BKLogOrientationHostUI___logObj;
}

void __BKSHIDEvent__BUNDLE_IDENTIFIER_FOR_CURRENT_PROCESS_IS_NIL__(void *a1)
{
  id v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  uint8_t buf[4];
  void *v7;
  __int16 v8;
  const __CFString *v9;
  __int16 v10;
  int v11;
  __int16 v12;
  void *v13;

  v1 = a1;
  v2 = (void *)MEMORY[0x1E0CB3940];
  objc_msgSend(v1, "infoDictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "stringWithFormat:", CFSTR("missing bundleID for main bundle %@: %@"), v1, v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "void __BKSHIDEvent__BUNDLE_IDENTIFIER_FOR_CURRENT_PROCESS_IS_NIL__(NSBundle *__strong)");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138544130;
    v7 = v5;
    v8 = 2114;
    v9 = CFSTR("BKSHIDEvent.m");
    v10 = 1024;
    v11 = 90;
    v12 = 2114;
    v13 = v4;
    _os_log_error_impl(&dword_18A0F0000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "failure in %{public}@ (%{public}@:%i) : %{public}@", buf, 0x26u);

  }
  objc_msgSend(objc_retainAutorelease(v4), "UTF8String");
  _bs_set_crash_log_message();
  __break(0);
}

uint64_t BKSHIDEventRegisterEventCallback()
{
  CFRunLoopGetCurrent();
  return BKSHIDEventRegisterEventCallbackOnRunLoop();
}

id BKSHIDEventGetKeyCommandResolutionDescription(void *a1, void *a2)
{
  id v3;
  id v4;
  void *v5;
  void *v6;
  mach_port_t v7;
  int v8;
  void *v9;
  void *v10;
  NSObject *v11;
  NSObject *v12;
  unsigned int v14;
  uint8_t v15[16];
  uint8_t buf[4];
  int v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v3 = a1;
  v4 = a2;
  objc_msgSend(v3, "bs_secureEncoded");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "bs_secureEncoded");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    *(_QWORD *)v15 = 0;
    v14 = 0;
    v7 = _BKSServerPortHelper("com.apple.backboard.hid.services", BKSHIDServerPort, &BKSHIDServerMachPort, (void (__cdecl *)(CFMachPortRef, void *))_InvalidateHIDServicesPort);
    v8 = _BKSHIDGetKeyCommandResolutionDescription(v7, objc_msgSend(v5, "bs_bytesForMIG"), objc_msgSend(v5, "bs_lengthForMIG"), objc_msgSend(v6, "bs_bytesForMIG"), objc_msgSend(v6, "bs_lengthForMIG"), v15, &v14);
    objc_msgSend(MEMORY[0x1E0C99D50], "bs_dataWithVMAllocatedBytes:length:", *(_QWORD *)v15, v14);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "bs_secureDecodedFromData:", v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if (v8)
    {
      BKLogEventDelivery();
      v11 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 67109120;
        v17 = v8;
        _os_log_error_impl(&dword_18A0F0000, v11, OS_LOG_TYPE_ERROR, "Error sending descriptors: 0x%x", buf, 8u);
      }

    }
  }
  else
  {
    BKLogEventDelivery();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)v15 = 138543362;
      *(_QWORD *)&v15[4] = v3;
      _os_log_error_impl(&dword_18A0F0000, v12, OS_LOG_TYPE_ERROR, "Error encoding keyCommand: %{public}@", v15, 0xCu);
    }

    v10 = 0;
  }

  return v10;
}

id BKSHIDEventGetResolutionDescription(void *a1, void *a2)
{
  id v3;
  id v4;
  void *v5;
  void *v6;
  mach_port_t v7;
  int v8;
  void *v9;
  void *v10;
  NSObject *v11;
  NSObject *v12;
  unsigned int v14;
  uint8_t v15[16];
  uint8_t buf[4];
  int v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v3 = a1;
  v4 = a2;
  objc_msgSend(v3, "bs_secureEncoded");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "bs_secureEncoded");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    *(_QWORD *)v15 = 0;
    v14 = 0;
    v7 = _BKSServerPortHelper("com.apple.backboard.hid.services", BKSHIDServerPort, &BKSHIDServerMachPort, (void (__cdecl *)(CFMachPortRef, void *))_InvalidateHIDServicesPort);
    v8 = _BKSHIDGetEventResolutionDescription(v7, objc_msgSend(v5, "bs_bytesForMIG"), objc_msgSend(v5, "bs_lengthForMIG"), objc_msgSend(v6, "bs_bytesForMIG"), objc_msgSend(v6, "bs_lengthForMIG"), v15, &v14);
    objc_msgSend(MEMORY[0x1E0C99D50], "bs_dataWithVMAllocatedBytes:length:", *(_QWORD *)v15, v14);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "bs_secureDecodedFromData:", v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if (v8)
    {
      BKLogEventDelivery();
      v11 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 67109120;
        v17 = v8;
        _os_log_error_impl(&dword_18A0F0000, v11, OS_LOG_TYPE_ERROR, "Error sending descriptors: 0x%x", buf, 8u);
      }

    }
  }
  else
  {
    BKLogEventDelivery();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)v15 = 138543362;
      *(_QWORD *)&v15[4] = v3;
      _os_log_error_impl(&dword_18A0F0000, v12, OS_LOG_TYPE_ERROR, "Error encoding eventDescriptor: %{public}@", v15, 0xCu);
    }

    v10 = 0;
  }

  return v10;
}

void BKSHIDEventSendToApplicationWithBundleIDAndPid(void *a1, uint64_t a2, uint64_t a3)
{
  _RedirectEventToClient(a1, 0, a3, 0);
}

void _RedirectEventToClient(void *a1, void *a2, uint64_t a3, void *a4)
{
  id v7;
  id v8;
  NSObject *v9;
  _DWORD v10[2];
  __int16 v11;
  id v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v7 = a2;
  v8 = a4;
  BKLogEventDelivery();
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    v10[0] = 67109378;
    v10[1] = a3;
    v11 = 2114;
    v12 = v7;
    _os_log_impl(&dword_18A0F0000, v9, OS_LOG_TYPE_DEFAULT, "REDIRECT: SET pid:%d environment:%{public}@", (uint8_t *)v10, 0x12u);
  }

  if (a1)
  {
    if ((int)a3 <= 0)
      a3 = getpid();
    _BKSHIDEventSetRedirectInfo(a1, a3, v8, v7);
    if (_getHIDEventSystemClient_onceToken != -1)
      dispatch_once(&_getHIDEventSystemClient_onceToken, &__block_literal_global_281);
    IOHIDEventSystemClientDispatchEvent();
  }

}

void _BKSHIDEventSetRedirectInfo(void *a1, uint64_t a2, void *a3, void *a4)
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;

  v7 = a3;
  if (a1)
  {
    v13 = v7;
    v8 = a4;
    BKSHIDEventGetBaseAttributes(a1);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = (void *)objc_opt_new();
    objc_msgSend(v10, "setEnvironment:", v8);

    objc_msgSend(v9, "display");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setDisplay:", v11);

    if (v13)
    {
      objc_msgSend(v10, "setToken:");
    }
    else
    {
      objc_msgSend(v9, "token");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "setToken:", v12);

    }
    objc_msgSend(v10, "setOptions:", objc_msgSend(v9, "options"));
    objc_msgSend(v10, "setSource:", objc_msgSend(v9, "source"));
    objc_msgSend(v10, "setPid:", a2);
    _BKSHIDEventSetAttributes((uint64_t)a1, v10, 3);

    v7 = v13;
  }

}

void BKSHIDEventSendToApplicationWithBundleIDAndPidAndFollowingFocusChain(void *a1, uint64_t a2, uint64_t a3, int a4)
{
  void *v6;
  id v7;

  if (a4)
  {
    +[BKSHIDEventDeferringEnvironment keyboardFocusEnvironment](BKSHIDEventDeferringEnvironment, "keyboardFocusEnvironment");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v6 = 0;
  }
  v7 = v6;
  _RedirectEventToClient(a1, v6, a3, 0);

}

void BKSHIDEventSendToFocusedProcess(void *a1)
{
  id v2;

  +[BKSHIDEventDeferringEnvironment keyboardFocusEnvironment](BKSHIDEventDeferringEnvironment, "keyboardFocusEnvironment");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  _RedirectEventToClient(a1, v2, 0xFFFFFFFFLL, 0);

}

void BKSHIDEventSendToResolvedProcessForDeferringEnvironment(void *a1, void *a2)
{
  id v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  objc_class *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  objc_class *v13;
  void *v14;
  objc_class *v15;
  void *v16;
  void *v17;
  void *v18;
  id v19;
  uint8_t buf[4];
  void *v21;
  __int16 v22;
  const __CFString *v23;
  __int16 v24;
  int v25;
  __int16 v26;
  void *v27;
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  if (!a1)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("event != ((void *)0)"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "void BKSHIDEventSendToResolvedProcessForDeferringEnvironment(IOHIDEventRef, BKSHIDEventDeferringEnvironment *__strong)");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138544130;
      v21 = v6;
      v22 = 2114;
      v23 = CFSTR("BKSHIDEvent.m");
      v24 = 1024;
      v25 = 227;
      v26 = 2114;
      v27 = v5;
      _os_log_error_impl(&dword_18A0F0000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "failure in %{public}@ (%{public}@:%i) : %{public}@", buf, 0x26u);

    }
    objc_msgSend(objc_retainAutorelease(v5), "UTF8String");
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x18A14B218);
  }
  v19 = v3;
  if (!v19)
  {
    v7 = (void *)MEMORY[0x1E0CB3940];
    v8 = (objc_class *)objc_opt_class();
    NSStringFromClass(v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "stringWithFormat:", CFSTR("Value for '%@' was unexpectedly nil. Expected %@."), CFSTR("environment"), v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "void BKSHIDEventSendToResolvedProcessForDeferringEnvironment(IOHIDEventRef, BKSHIDEventDeferringEnvironment *__strong)");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138544130;
      v21 = v11;
      v22 = 2114;
      v23 = CFSTR("BKSHIDEvent.m");
      v24 = 1024;
      v25 = 228;
      v26 = 2114;
      v27 = v10;
      _os_log_error_impl(&dword_18A0F0000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "failure in %{public}@ (%{public}@:%i) : %{public}@", buf, 0x26u);

    }
    objc_msgSend(objc_retainAutorelease(v10), "UTF8String");
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x18A14B30CLL);
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    v12 = (void *)MEMORY[0x1E0CB3940];
    v13 = (objc_class *)objc_msgSend(v19, "classForCoder");
    if (!v13)
      v13 = (objc_class *)objc_opt_class();
    NSStringFromClass(v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = (objc_class *)objc_opt_class();
    NSStringFromClass(v15);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "stringWithFormat:", CFSTR("Value for '%@' was of unexpected class %@. Expected %@."), CFSTR("environment"), v14, v16);
    v17 = (void *)objc_claimAutoreleasedReturnValue();

    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "void BKSHIDEventSendToResolvedProcessForDeferringEnvironment(IOHIDEventRef, BKSHIDEventDeferringEnvironment *__strong)");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138544130;
      v21 = v18;
      v22 = 2114;
      v23 = CFSTR("BKSHIDEvent.m");
      v24 = 1024;
      v25 = 228;
      v26 = 2114;
      v27 = v17;
      _os_log_error_impl(&dword_18A0F0000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "failure in %{public}@ (%{public}@:%i) : %{public}@", buf, 0x26u);

    }
    objc_msgSend(objc_retainAutorelease(v17), "UTF8String");
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x18A14B424);
  }

  v4 = getpid();
  _RedirectEventToClient(a1, v19, v4, 0);

}

void BKSHIDEventSendToProcess(void *a1, uint64_t a2)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  uint8_t buf[4];
  void *v7;
  __int16 v8;
  const __CFString *v9;
  __int16 v10;
  int v11;
  __int16 v12;
  void *v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  if ((int)a2 <= 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("pid > 0"));
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "void BKSHIDEventSendToProcess(IOHIDEventRef, pid_t)");
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138544130;
      v7 = v3;
      v8 = 2114;
      v9 = CFSTR("BKSHIDEvent.m");
      v10 = 1024;
      v11 = 234;
      v12 = 2114;
      v13 = v2;
      _os_log_error_impl(&dword_18A0F0000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "failure in %{public}@ (%{public}@:%i) : %{public}@", buf, 0x26u);

    }
    objc_msgSend(objc_retainAutorelease(v2), "UTF8String");
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x18A14B55CLL);
  }
  if (!a1)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("event != ((void *)0)"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "void BKSHIDEventSendToProcess(IOHIDEventRef, pid_t)");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138544130;
      v7 = v5;
      v8 = 2114;
      v9 = CFSTR("BKSHIDEvent.m");
      v10 = 1024;
      v11 = 235;
      v12 = 2114;
      v13 = v4;
      _os_log_error_impl(&dword_18A0F0000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "failure in %{public}@ (%{public}@:%i) : %{public}@", buf, 0x26u);

    }
    objc_msgSend(objc_retainAutorelease(v4), "UTF8String");
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x18A14B630);
  }
  _RedirectEventToClient(a1, 0, a2, 0);
}

void BKSHIDEventSendToProcessAndFollowDeferringRules(void *a1, uint64_t a2, void *a3, void *a4)
{
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  uint8_t buf[4];
  void *v15;
  __int16 v16;
  const __CFString *v17;
  __int16 v18;
  int v19;
  __int16 v20;
  void *v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v13 = a3;
  v7 = a4;
  if ((int)a2 <= 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("pid > 0"), v13);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "void BKSHIDEventSendToProcessAndFollowDeferringRules(IOHIDEventRef, pid_t, BKSHIDEventDeferringToken *__strong, BKSHIDEventDeferringEnvironment *__strong)");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138544130;
      v15 = v10;
      v16 = 2114;
      v17 = CFSTR("BKSHIDEvent.m");
      v18 = 1024;
      v19 = 241;
      v20 = 2114;
      v21 = v9;
      _os_log_error_impl(&dword_18A0F0000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "failure in %{public}@ (%{public}@:%i) : %{public}@", buf, 0x26u);

    }
    objc_msgSend(objc_retainAutorelease(v9), "UTF8String");
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x18A14B79CLL);
  }
  if (!a1)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("event != ((void *)0)"), v13);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "void BKSHIDEventSendToProcessAndFollowDeferringRules(IOHIDEventRef, pid_t, BKSHIDEventDeferringToken *__strong, BKSHIDEventDeferringEnvironment *__strong)");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138544130;
      v15 = v12;
      v16 = 2114;
      v17 = CFSTR("BKSHIDEvent.m");
      v18 = 1024;
      v19 = 242;
      v20 = 2114;
      v21 = v11;
      _os_log_error_impl(&dword_18A0F0000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "failure in %{public}@ (%{public}@:%i) : %{public}@", buf, 0x26u);

    }
    objc_msgSend(objc_retainAutorelease(v11), "UTF8String");
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x18A14B870);
  }
  v8 = v7;
  _RedirectEventToClient(a1, v7, a2, v13);

}

_DWORD *BKSHIDEventGetPointerAttributes(void *a1)
{
  int Type;
  _DWORD *AttributeDataPtr;

  Type = IOHIDEventGetType();
  AttributeDataPtr = 0;
  if (Type == 17 && a1)
  {
    if (IOHIDEventGetAttributeDataLength() < 1)
      goto LABEL_8;
    AttributeDataPtr = (_DWORD *)IOHIDEventGetAttributeDataPtr();
    if (AttributeDataPtr)
    {
      if (AttributeDataPtr[1] && *(_BYTE *)AttributeDataPtr == 5)
      {
        BKSHIDEventGetBaseAttributes(a1);
        AttributeDataPtr = (_DWORD *)objc_claimAutoreleasedReturnValue();
        return AttributeDataPtr;
      }
LABEL_8:
      AttributeDataPtr = 0;
    }
  }
  return AttributeDataPtr;
}

_DWORD *BKSHIDEventGetKeyboardAttributes(void *a1)
{
  int Type;
  _DWORD *AttributeDataPtr;

  Type = IOHIDEventGetType();
  AttributeDataPtr = 0;
  if (Type == 3 && a1)
  {
    if (IOHIDEventGetAttributeDataLength() < 1)
      goto LABEL_8;
    AttributeDataPtr = (_DWORD *)IOHIDEventGetAttributeDataPtr();
    if (AttributeDataPtr)
    {
      if (AttributeDataPtr[1] && *(_BYTE *)AttributeDataPtr == 6)
      {
        BKSHIDEventGetBaseAttributes(a1);
        AttributeDataPtr = (_DWORD *)objc_claimAutoreleasedReturnValue();
        return AttributeDataPtr;
      }
LABEL_8:
      AttributeDataPtr = 0;
    }
  }
  return AttributeDataPtr;
}

_DWORD *BKSHIDEventGetSmartCoverAttributes(void *a1)
{
  BOOL v2;
  _DWORD *AttributeDataPtr;

  v2 = IOHIDEventGetIntegerValue() != 65289 || a1 == 0;
  if (v2 || IOHIDEventGetAttributeDataLength() < 1)
    goto LABEL_10;
  AttributeDataPtr = (_DWORD *)IOHIDEventGetAttributeDataPtr();
  if (AttributeDataPtr)
  {
    if (AttributeDataPtr[1] && *(_BYTE *)AttributeDataPtr == 4)
    {
      BKSHIDEventGetBaseAttributes(a1);
      AttributeDataPtr = (_DWORD *)objc_claimAutoreleasedReturnValue();
      return AttributeDataPtr;
    }
LABEL_10:
    AttributeDataPtr = 0;
  }
  return AttributeDataPtr;
}

uint64_t BKSHIDEventCopyDisplayIDFromEvent(void *a1)
{
  unsigned __int8 *AttributeDataPtr;
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;

  if (!a1)
    return 0;
  if (IOHIDEventGetAttributeDataLength() < 1)
    return 0;
  AttributeDataPtr = (unsigned __int8 *)IOHIDEventGetAttributeDataPtr();
  if (!AttributeDataPtr || !*((_DWORD *)AttributeDataPtr + 1) || *AttributeDataPtr - 1 > 2)
    return 0;
  BKSHIDEventGetBaseAttributes(a1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
  {
    objc_msgSend(v3, "display");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "_hardwareIdentifier");
    v6 = objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v6 = 0;
  }

  return v6;
}

uint64_t BKSHIDEventGetContextIDFromEvent(void *a1)
{
  void *v1;
  void *v2;
  void *v3;
  uint64_t v4;

  if (!a1)
    return 0;
  BKSHIDEventGetBaseAttributes(a1);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = v1;
  if (v1)
  {
    objc_msgSend(v1, "token");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = objc_msgSend(v3, "_identifierOfCAContext");

  }
  else
  {
    v4 = 0;
  }

  return v4;
}

void *BKSHIDEventGetSourceFromKeyboardEvent(void *result)
{
  void *v1;
  uint64_t v2;

  if (result)
  {
    BKSHIDEventGetBaseAttributes(result);
    v1 = (void *)objc_claimAutoreleasedReturnValue();
    v2 = objc_msgSend(v1, "source");

    return (void *)v2;
  }
  return result;
}

uint64_t BKSHIDEventGetIsSystemAppEventFromEvent(void *a1)
{
  void *v1;
  void *v2;
  uint64_t v3;

  if (!a1)
    return 0;
  BKSHIDEventGetBaseAttributes(a1);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "environment");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "_isSystemEnvironment");

  return v3;
}

void BKSHIDEventSetBaseAttributes(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  void *v5;
  id v6;
  uint8_t buf[4];
  void *v8;
  __int16 v9;
  const __CFString *v10;
  __int16 v11;
  int v12;
  __int16 v13;
  void *v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v6 = a2;
  v3 = (void *)objc_opt_class();
  if ((objc_msgSend(v3, "isEqual:", objc_opt_class()) & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("no classes other than BKSHIDEventBaseAttributes allowed, not even %@"), objc_opt_class());
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "void BKSHIDEventSetBaseAttributes(IOHIDEventRef, BKSHIDEventBaseAttributes *__strong)");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138544130;
      v8 = v5;
      v9 = 2114;
      v10 = CFSTR("BKSHIDEvent.m");
      v11 = 1024;
      v12 = 500;
      v13 = 2114;
      v14 = v4;
      _os_log_error_impl(&dword_18A0F0000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "failure in %{public}@ (%{public}@:%i) : %{public}@", buf, 0x26u);

    }
    objc_msgSend(objc_retainAutorelease(v4), "UTF8String");
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x18A14BCDCLL);
  }
  _BKSHIDEventSetAttributes(a1, v6, 1);

}

void BKSHIDEventSetDigitizerAttributes(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  void *v5;
  id v6;
  uint8_t buf[4];
  void *v8;
  __int16 v9;
  const __CFString *v10;
  __int16 v11;
  int v12;
  __int16 v13;
  void *v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v6 = a2;
  v3 = (void *)objc_opt_class();
  if ((objc_msgSend(v3, "isEqual:", objc_opt_class()) & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("no classes other than BKSHIDEventDigitizerAttributes allowed, not even %@"), objc_opt_class());
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "void BKSHIDEventSetDigitizerAttributes(IOHIDEventRef, BKSHIDEventDigitizerAttributes *__strong)");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138544130;
      v8 = v5;
      v9 = 2114;
      v10 = CFSTR("BKSHIDEvent.m");
      v11 = 1024;
      v12 = 506;
      v13 = 2114;
      v14 = v4;
      _os_log_error_impl(&dword_18A0F0000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "failure in %{public}@ (%{public}@:%i) : %{public}@", buf, 0x26u);

    }
    objc_msgSend(objc_retainAutorelease(v4), "UTF8String");
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x18A14BE44);
  }
  _BKSHIDEventSetAttributes(a1, v6, 2);

}

void BKSHIDEventSetPointerAttributes(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  void *v5;
  id v6;
  uint8_t buf[4];
  void *v8;
  __int16 v9;
  const __CFString *v10;
  __int16 v11;
  int v12;
  __int16 v13;
  void *v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v6 = a2;
  v3 = (void *)objc_opt_class();
  if ((objc_msgSend(v3, "isEqual:", objc_opt_class()) & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("no classes other than BKSHIDEventPointerAttributes allowed, not even %@"), objc_opt_class());
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "void BKSHIDEventSetPointerAttributes(IOHIDEventRef, BKSHIDEventPointerAttributes *__strong)");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138544130;
      v8 = v5;
      v9 = 2114;
      v10 = CFSTR("BKSHIDEvent.m");
      v11 = 1024;
      v12 = 512;
      v13 = 2114;
      v14 = v4;
      _os_log_error_impl(&dword_18A0F0000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "failure in %{public}@ (%{public}@:%i) : %{public}@", buf, 0x26u);

    }
    objc_msgSend(objc_retainAutorelease(v4), "UTF8String");
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x18A14BFACLL);
  }
  _BKSHIDEventSetAttributes(a1, v6, 5);

}

void BKSHIDEventSetKeyboardAttributes(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  void *v5;
  id v6;
  uint8_t buf[4];
  void *v8;
  __int16 v9;
  const __CFString *v10;
  __int16 v11;
  int v12;
  __int16 v13;
  void *v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v6 = a2;
  v3 = (void *)objc_opt_class();
  if ((objc_msgSend(v3, "isEqual:", objc_opt_class()) & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("no classes other than BKSHIDEventKeyboardAttributes allowed, not even %@"), objc_opt_class());
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "void BKSHIDEventSetKeyboardAttributes(IOHIDEventRef, BKSHIDEventKeyboardAttributes *__strong)");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138544130;
      v8 = v5;
      v9 = 2114;
      v10 = CFSTR("BKSHIDEvent.m");
      v11 = 1024;
      v12 = 518;
      v13 = 2114;
      v14 = v4;
      _os_log_error_impl(&dword_18A0F0000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "failure in %{public}@ (%{public}@:%i) : %{public}@", buf, 0x26u);

    }
    objc_msgSend(objc_retainAutorelease(v4), "UTF8String");
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x18A14C114);
  }
  _BKSHIDEventSetAttributes(a1, v6, 6);

}

void BKSHIDEventSetProximityAttributes(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  void *v5;
  id v6;
  uint8_t buf[4];
  void *v8;
  __int16 v9;
  const __CFString *v10;
  __int16 v11;
  int v12;
  __int16 v13;
  void *v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v6 = a2;
  v3 = (void *)objc_opt_class();
  if ((objc_msgSend(v3, "isEqual:", objc_opt_class()) & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("no classes other than BKSHIDEventProximityAttributes allowed, not even %@"), objc_opt_class());
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "void BKSHIDEventSetProximityAttributes(IOHIDEventRef, BKSHIDEventProximityAttributes *__strong)");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138544130;
      v8 = v5;
      v9 = 2114;
      v10 = CFSTR("BKSHIDEvent.m");
      v11 = 1024;
      v12 = 524;
      v13 = 2114;
      v14 = v4;
      _os_log_error_impl(&dword_18A0F0000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "failure in %{public}@ (%{public}@:%i) : %{public}@", buf, 0x26u);

    }
    objc_msgSend(objc_retainAutorelease(v4), "UTF8String");
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x18A14C27CLL);
  }
  _BKSHIDEventSetAttributes(a1, v6, 7);

}

void BKSHIDEventSetSmartCoverAttributes(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  void *v5;
  id v6;
  uint8_t buf[4];
  void *v8;
  __int16 v9;
  const __CFString *v10;
  __int16 v11;
  int v12;
  __int16 v13;
  void *v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v6 = a2;
  v3 = (void *)objc_opt_class();
  if ((objc_msgSend(v3, "isEqual:", objc_opt_class()) & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("no classes other than BKSHIDEventSmartCoverAttributes allowed, not even %@"), objc_opt_class());
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "void BKSHIDEventSetSmartCoverAttributes(IOHIDEventRef, BKSHIDEventSmartCoverAttributes *__strong)");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138544130;
      v8 = v5;
      v9 = 2114;
      v10 = CFSTR("BKSHIDEvent.m");
      v11 = 1024;
      v12 = 530;
      v13 = 2114;
      v14 = v4;
      _os_log_error_impl(&dword_18A0F0000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "failure in %{public}@ (%{public}@:%i) : %{public}@", buf, 0x26u);

    }
    objc_msgSend(objc_retainAutorelease(v4), "UTF8String");
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x18A14C3E4);
  }
  _BKSHIDEventSetAttributes(a1, v6, 4);

}

void BKSHIDEventSetSimpleInfo(uint64_t a1, uint64_t a2, int a3, uint64_t a4, uint64_t a5, char a6)
{
  void *v12;
  void *v13;
  void *v14;
  id v15;

  v15 = (id)objc_opt_new();
  if ((a6 & 1) != 0)
    +[BKSHIDEventDeferringEnvironment systemEnvironment](BKSHIDEventDeferringEnvironment, "systemEnvironment");
  else
    +[BKSHIDEventDeferringEnvironment keyboardFocusEnvironment](BKSHIDEventDeferringEnvironment, "keyboardFocusEnvironment");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "setEnvironment:", v12);
  if ((_DWORD)a5)
  {
    +[BKSHIDEventDeferringToken tokenForIdentifierOfCAContext:](BKSHIDEventDeferringToken, "tokenForIdentifierOfCAContext:", a5);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "setToken:", v13);

  }
  if (a4)
  {
    +[BKSHIDEventDisplay displayWithHardwareIdentifier:](BKSHIDEventDisplay, "displayWithHardwareIdentifier:", a4);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "setDisplay:", v14);

  }
  objc_msgSend(v15, "setSource:", a2);
  if (a3)
    objc_msgSend(v15, "setOptions:", 1);
  _BKSHIDEventSetAttributes(a1, v15, 1);

}

void BKSHIDEventSetSimpleDeliveryInfo(uint64_t a1, uint64_t a2, int a3, uint64_t a4)
{
  id v7;

  +[BKSHIDEventBaseAttributes baseAttributesFromProvider:](BKSHIDEventBaseAttributes, "baseAttributesFromProvider:", a4);
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setSource:", a2);
  if (a3)
    objc_msgSend(v7, "setOptions:", 1);
  _BKSHIDEventSetAttributes(a1, v7, 1);

}

void *BKSHIDEventGetButtonIsCancelledFromButtonEvent(void *a1)
{
  void *v1;
  void *v2;

  v1 = a1;
  if (a1)
  {
    if (IOHIDEventGetType() == 3)
    {
      BKSHIDEventGetBaseAttributes(v1);
      v2 = (void *)objc_claimAutoreleasedReturnValue();
      v1 = (void *)(objc_msgSend(v2, "options") & 1);

    }
    else
    {
      return 0;
    }
  }
  return v1;
}

uint64_t BKSHIDEventGetSystemGestureStatusFromDigitizerEvent(void *a1)
{
  void *v1;
  uint64_t v2;

  BKSHIDEventGetDigitizerAttributes(a1);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = objc_msgSend(v1, "systemGesturesPossible");

  return v2;
}

uint64_t BKSHIDEventGetIsSystemGestureStateChangeFromDigitizerEvent(void *a1)
{
  void *v1;
  uint64_t v2;

  BKSHIDEventGetDigitizerAttributes(a1);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = objc_msgSend(v1, "systemGestureStateChange");

  return v2;
}

uint64_t BKSHIDEventGetTouchStreamIdentifier(void *a1)
{
  void *v1;
  uint64_t v2;

  BKSHIDEventGetDigitizerAttributes(a1);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = objc_msgSend(v1, "touchStreamIdentifier");

  return v2;
}

double BKSHIDEventGetInitialTouchTimestampFromDigitizerEvent(void *a1)
{
  void *v1;
  double v2;
  double v3;

  BKSHIDEventGetDigitizerAttributes(a1);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "initialTouchTimestamp");
  v3 = v2;

  return v3;
}

float BKSHIDEventGetMaximumForceFromDigitizerEvent(void *a1)
{
  void *v1;
  float v2;
  float v3;

  BKSHIDEventGetDigitizerAttributes(a1);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "maximumForce");
  v3 = v2;

  return v3;
}

double BKSHIDEventGetPointFromDigitizerEvent(uint64_t a1)
{
  double v1;
  double v2;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint8_t buf[4];
  void *v9;
  __int16 v10;
  const __CFString *v11;
  __int16 v12;
  int v13;
  __int16 v14;
  void *v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  if (!a1)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("digitizerEvent"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "CGPoint BKSHIDEventGetPointFromDigitizerEvent(IOHIDEventRef)");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138544130;
      v9 = v5;
      v10 = 2114;
      v11 = CFSTR("BKSHIDEvent.m");
      v12 = 1024;
      v13 = 643;
      v14 = 2114;
      v15 = v4;
      _os_log_error_impl(&dword_18A0F0000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "failure in %{public}@ (%{public}@:%i) : %{public}@", buf, 0x26u);

    }
    objc_msgSend(objc_retainAutorelease(v4), "UTF8String");
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x18A14C850);
  }
  if (IOHIDEventGetType() != 11)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("event is the wrong type: %d"), IOHIDEventGetType());
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "CGPoint BKSHIDEventGetPointFromDigitizerEvent(IOHIDEventRef)");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138544130;
      v9 = v7;
      v10 = 2114;
      v11 = CFSTR("BKSHIDEvent.m");
      v12 = 1024;
      v13 = 644;
      v14 = 2114;
      v15 = v6;
      _os_log_error_impl(&dword_18A0F0000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "failure in %{public}@ (%{public}@:%i) : %{public}@", buf, 0x26u);

    }
    objc_msgSend(objc_retainAutorelease(v6), "UTF8String");
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x18A14C928);
  }
  IOHIDEventGetFloatValue();
  v2 = v1;
  IOHIDEventGetFloatValue();
  return v2;
}

uint64_t BKSHIDEventDigitizerGetTouchIdentifier(void *a1, uint64_t a2)
{
  void *v2;
  uint64_t v3;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint8_t buf[4];
  void *v10;
  __int16 v11;
  const __CFString *v12;
  __int16 v13;
  int v14;
  __int16 v15;
  void *v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  if (!a1)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("pathCollectionEvent"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "BKSHIDEventTouchIdentifier BKSHIDEventDigitizerGetTouchIdentifier(IOHIDEventRef, IOHIDEventRef)");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138544130;
      v10 = v6;
      v11 = 2114;
      v12 = CFSTR("BKSHIDEvent.m");
      v13 = 1024;
      v14 = 651;
      v15 = 2114;
      v16 = v5;
      _os_log_error_impl(&dword_18A0F0000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "failure in %{public}@ (%{public}@:%i) : %{public}@", buf, 0x26u);

    }
    objc_msgSend(objc_retainAutorelease(v5), "UTF8String");
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x18A14CA6CLL);
  }
  if (!a2)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("pathEvent"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "BKSHIDEventTouchIdentifier BKSHIDEventDigitizerGetTouchIdentifier(IOHIDEventRef, IOHIDEventRef)");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138544130;
      v10 = v8;
      v11 = 2114;
      v12 = CFSTR("BKSHIDEvent.m");
      v13 = 1024;
      v14 = 652;
      v15 = 2114;
      v16 = v7;
      _os_log_error_impl(&dword_18A0F0000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "failure in %{public}@ (%{public}@:%i) : %{public}@", buf, 0x26u);

    }
    objc_msgSend(objc_retainAutorelease(v7), "UTF8String");
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x18A14CB40);
  }
  _BKSHIDEventGetSubEventInfoFromDigitierEventForPathEvent(a1, a2);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "touchIdentifier");

  return v3;
}

uint64_t BKSHIDEventDigitizerGetTouchUserIdentifier(void *a1, uint64_t a2)
{
  void *v2;
  uint64_t v3;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint8_t buf[4];
  void *v10;
  __int16 v11;
  const __CFString *v12;
  __int16 v13;
  int v14;
  __int16 v15;
  void *v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  if (!a1)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("pathCollectionEvent"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "uint32_t BKSHIDEventDigitizerGetTouchUserIdentifier(IOHIDEventRef, IOHIDEventRef)");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138544130;
      v10 = v6;
      v11 = 2114;
      v12 = CFSTR("BKSHIDEvent.m");
      v13 = 1024;
      v14 = 658;
      v15 = 2114;
      v16 = v5;
      _os_log_error_impl(&dword_18A0F0000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "failure in %{public}@ (%{public}@:%i) : %{public}@", buf, 0x26u);

    }
    objc_msgSend(objc_retainAutorelease(v5), "UTF8String");
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x18A14CC84);
  }
  if (!a2)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("pathEvent"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "uint32_t BKSHIDEventDigitizerGetTouchUserIdentifier(IOHIDEventRef, IOHIDEventRef)");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138544130;
      v10 = v8;
      v11 = 2114;
      v12 = CFSTR("BKSHIDEvent.m");
      v13 = 1024;
      v14 = 659;
      v15 = 2114;
      v16 = v7;
      _os_log_error_impl(&dword_18A0F0000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "failure in %{public}@ (%{public}@:%i) : %{public}@", buf, 0x26u);

    }
    objc_msgSend(objc_retainAutorelease(v7), "UTF8String");
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x18A14CD58);
  }
  _BKSHIDEventGetSubEventInfoFromDigitierEventForPathEvent(a1, a2);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "userIdentifier");

  return v3;
}

float BKSHIDEventGetZGradientFromDigitizerEventForPathEvent(void *a1, uint64_t a2)
{
  void *v2;
  float v3;
  float v4;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint8_t buf[4];
  void *v11;
  __int16 v12;
  const __CFString *v13;
  __int16 v14;
  int v15;
  __int16 v16;
  void *v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  if (!a1)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("pathCollectionEvent"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "float BKSHIDEventGetZGradientFromDigitizerEventForPathEvent(IOHIDEventRef, IOHIDEventRef)");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138544130;
      v11 = v7;
      v12 = 2114;
      v13 = CFSTR("BKSHIDEvent.m");
      v14 = 1024;
      v15 = 672;
      v16 = 2114;
      v17 = v6;
      _os_log_error_impl(&dword_18A0F0000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "failure in %{public}@ (%{public}@:%i) : %{public}@", buf, 0x26u);

    }
    objc_msgSend(objc_retainAutorelease(v6), "UTF8String");
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x18A14CEA4);
  }
  if (!a2)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("pathEvent"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "float BKSHIDEventGetZGradientFromDigitizerEventForPathEvent(IOHIDEventRef, IOHIDEventRef)");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138544130;
      v11 = v9;
      v12 = 2114;
      v13 = CFSTR("BKSHIDEvent.m");
      v14 = 1024;
      v15 = 673;
      v16 = 2114;
      v17 = v8;
      _os_log_error_impl(&dword_18A0F0000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "failure in %{public}@ (%{public}@:%i) : %{public}@", buf, 0x26u);

    }
    objc_msgSend(objc_retainAutorelease(v8), "UTF8String");
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x18A14CF78);
  }
  _BKSHIDEventGetSubEventInfoFromDigitierEventForPathEvent(a1, a2);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "zGradient");
  v4 = v3;

  return v4;
}

double BKSHIDEventGetHitTestPointFromDigitizerEventForPathEvent(void *a1, uint64_t a2)
{
  void *v2;
  void *v3;
  double v4;
  double v5;
  double v6;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  uint8_t buf[4];
  void *v15;
  __int16 v16;
  const __CFString *v17;
  __int16 v18;
  int v19;
  __int16 v20;
  void *v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  if (!a1)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("pathCollectionEvent"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "CGPoint BKSHIDEventGetHitTestPointFromDigitizerEventForPathEvent(IOHIDEventRef, IOHIDEventRef)");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138544130;
      v15 = v9;
      v16 = 2114;
      v17 = CFSTR("BKSHIDEvent.m");
      v18 = 1024;
      v19 = 679;
      v20 = 2114;
      v21 = v8;
      _os_log_error_impl(&dword_18A0F0000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "failure in %{public}@ (%{public}@:%i) : %{public}@", buf, 0x26u);

    }
    objc_msgSend(objc_retainAutorelease(v8), "UTF8String");
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x18A14D124);
  }
  if (!a2)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("pathEvent"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "CGPoint BKSHIDEventGetHitTestPointFromDigitizerEventForPathEvent(IOHIDEventRef, IOHIDEventRef)");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138544130;
      v15 = v11;
      v16 = 2114;
      v17 = CFSTR("BKSHIDEvent.m");
      v18 = 1024;
      v19 = 680;
      v20 = 2114;
      v21 = v10;
      _os_log_error_impl(&dword_18A0F0000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "failure in %{public}@ (%{public}@:%i) : %{public}@", buf, 0x26u);

    }
    objc_msgSend(objc_retainAutorelease(v10), "UTF8String");
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x18A14D1F8);
  }
  _BKSHIDEventGetSubEventInfoFromDigitierEventForPathEvent(a1, a2);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (v2)
  {
    objc_msgSend(v2, "hitTestLocationX");
    v5 = v4;
    objc_msgSend(v3, "hitTestLocationY");
  }
  else
  {
    if (IOHIDEventGetType() != 11)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("event is the wrong type: %d"), IOHIDEventGetType());
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      {
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "CGPoint BKSHIDEventGetHitTestPointFromDigitizerEventForPathEvent(IOHIDEventRef, IOHIDEventRef)");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138544130;
        v15 = v13;
        v16 = 2114;
        v17 = CFSTR("BKSHIDEvent.m");
        v18 = 1024;
        v19 = 685;
        v20 = 2114;
        v21 = v12;
        _os_log_error_impl(&dword_18A0F0000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "failure in %{public}@ (%{public}@:%i) : %{public}@", buf, 0x26u);

      }
      objc_msgSend(objc_retainAutorelease(v12), "UTF8String");
      _bs_set_crash_log_message();
      __break(0);
      JUMPOUT(0x18A14D2D0);
    }
    IOHIDEventGetFloatValue();
    v5 = v6;
    IOHIDEventGetFloatValue();
  }

  return v5;
}

double BKSHIDEventGetPrecisePointFromDigitizerEventForPathEvent(void *a1, uint64_t a2)
{
  void *v2;
  void *v3;
  double v4;
  double v5;
  double v6;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  uint8_t buf[4];
  void *v15;
  __int16 v16;
  const __CFString *v17;
  __int16 v18;
  int v19;
  __int16 v20;
  void *v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  if (!a1)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("pathCollectionEvent"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "CGPoint BKSHIDEventGetPrecisePointFromDigitizerEventForPathEvent(IOHIDEventRef, IOHIDEventRef)");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138544130;
      v15 = v9;
      v16 = 2114;
      v17 = CFSTR("BKSHIDEvent.m");
      v18 = 1024;
      v19 = 691;
      v20 = 2114;
      v21 = v8;
      _os_log_error_impl(&dword_18A0F0000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "failure in %{public}@ (%{public}@:%i) : %{public}@", buf, 0x26u);

    }
    objc_msgSend(objc_retainAutorelease(v8), "UTF8String");
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x18A14D478);
  }
  if (!a2)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("pathEvent"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "CGPoint BKSHIDEventGetPrecisePointFromDigitizerEventForPathEvent(IOHIDEventRef, IOHIDEventRef)");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138544130;
      v15 = v11;
      v16 = 2114;
      v17 = CFSTR("BKSHIDEvent.m");
      v18 = 1024;
      v19 = 692;
      v20 = 2114;
      v21 = v10;
      _os_log_error_impl(&dword_18A0F0000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "failure in %{public}@ (%{public}@:%i) : %{public}@", buf, 0x26u);

    }
    objc_msgSend(objc_retainAutorelease(v10), "UTF8String");
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x18A14D54CLL);
  }
  _BKSHIDEventGetSubEventInfoFromDigitierEventForPathEvent(a1, a2);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (v2)
  {
    objc_msgSend(v2, "preciseLocationX");
    v5 = v4;
    objc_msgSend(v3, "preciseLocationY");
  }
  else
  {
    if (IOHIDEventGetType() != 11)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("event is the wrong type: %d"), IOHIDEventGetType());
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      {
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "CGPoint BKSHIDEventGetPrecisePointFromDigitizerEventForPathEvent(IOHIDEventRef, IOHIDEventRef)");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138544130;
        v15 = v13;
        v16 = 2114;
        v17 = CFSTR("BKSHIDEvent.m");
        v18 = 1024;
        v19 = 699;
        v20 = 2114;
        v21 = v12;
        _os_log_error_impl(&dword_18A0F0000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "failure in %{public}@ (%{public}@:%i) : %{public}@", buf, 0x26u);

      }
      objc_msgSend(objc_retainAutorelease(v12), "UTF8String");
      _bs_set_crash_log_message();
      __break(0);
      JUMPOUT(0x18A14D624);
    }
    IOHIDEventGetFloatValue();
    v5 = v6;
    IOHIDEventGetFloatValue();
  }

  return v5;
}

void BKSHIDEventSetDigitizerInfo(uint64_t a1, uint64_t a2, int a3, int a4, uint64_t a5, double a6, float a7)
{
  BKSHIDEventSetDigitizerInfoWithSubEventInfoAndTouchStreamIdentifier(a1, a2, a3, a4, 0, a5, 0, 0, a6, a7);
}

void BKSHIDEventSetDigitizerInfoWithSubEventInfoAndTouchStreamIdentifier(uint64_t a1, uint64_t a2, int a3, int a4, uint64_t a5, uint64_t a6, int a7, uint64_t a8, double a9, float a10)
{
  uint64_t v11;
  void *v20;
  double v21;
  void *v22;
  id v23;
  uint64_t v24;
  BKSHIDEventDigitizerPathAttributes *v25;
  double v26;
  BKSHIDEventDigitizerAttributes *v27;

  if (a1)
  {
    LODWORD(v11) = a7;
    v27 = objc_alloc_init(BKSHIDEventDigitizerAttributes);
    +[BKSHIDEventDeferringToken tokenForIdentifierOfCAContext:](BKSHIDEventDeferringToken, "tokenForIdentifierOfCAContext:", a2);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    -[BKSHIDEventBaseAttributes setToken:](v27, "setToken:", v20);

    if (a6)
    {
      +[BKSHIDEventDisplay displayWithHardwareIdentifier:](BKSHIDEventDisplay, "displayWithHardwareIdentifier:", a6);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      -[BKSHIDEventBaseAttributes setDisplay:](v27, "setDisplay:", v22);

    }
    *(float *)&v21 = a10;
    -[BKSHIDEventDigitizerAttributes setMaximumForce:](v27, "setMaximumForce:", v21);
    -[BKSHIDEventDigitizerAttributes setInitialTouchTimestamp:](v27, "setInitialTouchTimestamp:", a9);
    -[BKSHIDEventDigitizerAttributes setTouchStreamIdentifier:](v27, "setTouchStreamIdentifier:", a5);
    -[BKSHIDEventDigitizerAttributes setSystemGesturesPossible:](v27, "setSystemGesturesPossible:", a3 != 0);
    -[BKSHIDEventDigitizerAttributes setSystemGestureStateChange:](v27, "setSystemGestureStateChange:", a4 != 0);
    v23 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    if ((_DWORD)v11)
    {
      v11 = v11;
      v24 = a8 + 16;
      do
      {
        v25 = objc_alloc_init(BKSHIDEventDigitizerPathAttributes);
        -[BKSHIDEventDigitizerPathAttributes setPathIndex:](v25, "setPathIndex:", *(unsigned int *)(v24 - 16));
        -[BKSHIDEventDigitizerPathAttributes setTouchIdentifier:](v25, "setTouchIdentifier:", *(unsigned int *)(v24 - 12));
        -[BKSHIDEventDigitizerPathAttributes setUserIdentifier:](v25, "setUserIdentifier:", *(unsigned int *)(v24 - 8));
        LODWORD(v26) = *(_DWORD *)v24;
        -[BKSHIDEventDigitizerPathAttributes setZGradient:](v25, "setZGradient:", v26);
        -[BKSHIDEventDigitizerPathAttributes setLocus:](v25, "setLocus:", *(unsigned __int8 *)(v24 - 4));
        -[BKSHIDEventDigitizerPathAttributes setHitTestLocationX:](v25, "setHitTestLocationX:", *(float *)(v24 + 4));
        -[BKSHIDEventDigitizerPathAttributes setHitTestLocationY:](v25, "setHitTestLocationY:", *(float *)(v24 + 8));
        -[BKSHIDEventDigitizerPathAttributes setPreciseLocationX:](v25, "setPreciseLocationX:", *(float *)(v24 + 12));
        -[BKSHIDEventDigitizerPathAttributes setPreciseLocationY:](v25, "setPreciseLocationY:", *(float *)(v24 + 16));
        objc_msgSend(v23, "addObject:", v25);

        v24 += 36;
        --v11;
      }
      while (v11);
    }
    -[BKSHIDEventDigitizerAttributes setPathAttributes:](v27, "setPathAttributes:", v23);
    _BKSHIDEventSetAttributes(a1, v27, 2);

  }
}

void BKSHIDEventSetDigitizerInfoWithSubEventInfos(uint64_t a1, uint64_t a2, int a3, int a4, uint64_t a5, int a6, uint64_t a7, double a8, float a9)
{
  BKSHIDEventSetDigitizerInfoWithSubEventInfoAndTouchStreamIdentifier(a1, a2, a3, a4, 0, a5, a6, a7, a8, a9);
}

void BKSHIDEventSetDigitizerInfoWithTouchStreamIdentifier(uint64_t a1, uint64_t a2, int a3, int a4, uint64_t a5, uint64_t a6, double a7, float a8)
{
  BKSHIDEventSetDigitizerInfoWithSubEventInfoAndTouchStreamIdentifier(a1, a2, a3, a4, a5, a6, 0, 0, a7, a8);
}

const __CFString *NSStringFromBKSHIDEventSmartCoverState(int a1)
{
  if ((a1 - 1) > 2)
    return CFSTR("unknown");
  else
    return off_1E1EA1A50[a1 - 1];
}

uint64_t BKSHIDEventGetSmartCoverStateFromEvent(void *a1)
{
  void *v1;
  uint64_t v2;

  BKSHIDEventGetSmartCoverAttributes(a1);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = objc_msgSend(v1, "smartCoverState");

  return v2;
}

void BKSHIDEventSetSmartCoverInfo(void *a1, uint64_t a2, uint64_t a3)
{
  BKSHIDEventSmartCoverAttributes *v6;
  BKSHIDEventSmartCoverAttributes *v7;

  if (a1)
  {
    BKSHIDEventGetSmartCoverAttributes(a1);
    v6 = (BKSHIDEventSmartCoverAttributes *)objc_claimAutoreleasedReturnValue();
    if (!v6)
      v6 = objc_alloc_init(BKSHIDEventSmartCoverAttributes);
    v7 = v6;
    -[BKSHIDEventSmartCoverAttributes setSmartCoverState:](v6, "setSmartCoverState:", a2);
    -[BKSHIDEventSmartCoverAttributes setWakeAnimationStyle:](v7, "setWakeAnimationStyle:", a3);
    _BKSHIDEventSetAttributes((uint64_t)a1, v7, 4);

  }
}

__CFString *NSStringFromBKSHIDTouchLocus(unsigned int a1)
{
  if (a1 < 5)
    return off_1E1EA1AD8[a1];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("<unknown:%d>"), a1);
  return (__CFString *)(id)objc_claimAutoreleasedReturnValue();
}

__CFString *NSStringFromBKSTouchStreamIdentifier(unsigned int a1)
{
  __CFString *v1;

  if (a1 < 6 && ((0x2Fu >> a1) & 1) != 0)
  {
    v1 = off_1E1EA1B00[a1];
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("<unknown: %u>"), a1);
    v1 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  return v1;
}

id _BKSHIDEventGetConciseDescriptionKeyboard(void *a1, uint64_t a2)
{
  uint64_t IntegerValue;
  uint64_t v5;
  uint64_t v6;
  unsigned int Phase;
  uint64_t v8;
  void *v9;
  const __CFString *v10;
  void *v11;
  int v12;
  uint64_t Children;
  const __CFArray *v14;
  CFIndex i;
  uint64_t v16;
  unint64_t v17;
  uint64_t v18;
  const __CFString *v19;
  const __CFString *v20;
  __CFString *v21;
  __CFString *v22;
  __CFString *v23;
  __CFString *v24;
  __CFString *v25;
  __CFString *v26;
  int v27;
  void *v28;
  void *v29;
  void *v30;
  __CFString *v31;
  void *v32;
  uint64_t v34;
  const __CFString *v35;
  __CFString *v36;
  uint64_t SenderID;
  uint64_t v38;
  __CFString *v39;
  void *v40;
  uint64_t v41;
  uint64_t v42;

  SenderID = IOHIDEventGetSenderID();
  IntegerValue = IOHIDEventGetIntegerValue();
  v38 = IOHIDEventGetIntegerValue();
  v5 = IOHIDEventGetIntegerValue();
  v6 = IOHIDEventGetIntegerValue();
  Phase = IOHIDEventGetPhase();
  v8 = IOHIDEventGetIntegerValue();
  BKSHIDEventGetBaseAttributes(a1);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v40 = (void *)MEMORY[0x1E0CB3940];
  v42 = v5;
  if ((_DWORD)v5 != 7)
  {
    v12 = v6 | ((_DWORD)v5 << 16);
    if (v12 > 786553)
    {
      if (v12 <= 786657)
      {
        if (v12 > 786580)
        {
          switch(v12)
          {
            case 786608:
              v10 = CFSTR("Play");
              break;
            case 786609:
              v10 = CFSTR("Pause");
              break;
            case 786610:
              v10 = CFSTR("Record");
              break;
            case 786611:
              v10 = CFSTR("FastForward");
              break;
            case 786612:
              v10 = CFSTR("Rewind");
              break;
            case 786613:
              v10 = CFSTR("ScanNextTrack");
              break;
            case 786614:
              v10 = CFSTR("ScanPreviousTrack");
              break;
            case 786615:
            case 786616:
            case 786618:
            case 786619:
            case 786621:
            case 786623:
            case 786624:
            case 786625:
            case 786626:
            case 786627:
            case 786628:
            case 786629:
            case 786630:
            case 786631:
            case 786632:
            case 786633:
            case 786636:
            case 786638:
              goto LABEL_177;
            case 786617:
              v10 = CFSTR("ToggleShuffle");
              break;
            case 786620:
              v10 = CFSTR("ToggleRepeat");
              break;
            case 786622:
              v10 = CFSTR("PlaybackSpeedNormal");
              break;
            case 786634:
              v10 = CFSTR("PlaybackSpeedFaster");
              break;
            case 786635:
              v10 = CFSTR("PlaybackSpeedSlower");
              break;
            case 786637:
              v10 = CFSTR("PlayOrPause");
              break;
            case 786639:
              v10 = CFSTR("VoiceCommand");
              break;
            default:
              if (v12 != 786581)
                goto LABEL_177;
              v10 = CFSTR("Side");
              break;
          }
          goto LABEL_3;
        }
        switch(v12)
        {
          case 786554:
            v10 = CFSTR("KeyboardBrightnessDecrement");
            goto LABEL_3;
          case 786560:
LABEL_121:
            v10 = CFSTR("Select");
            goto LABEL_3;
          case 786566:
LABEL_100:
            v10 = CFSTR("Home");
            goto LABEL_3;
        }
        goto LABEL_177;
      }
      if (v12 <= 786976)
      {
        if (v12 > 786864)
        {
          if (v12 > 786947)
          {
            if (v12 == 786948)
            {
              v10 = CFSTR("ACExit");
              goto LABEL_3;
            }
            if (v12 == 786953)
            {
              v10 = CFSTR("Options");
              goto LABEL_3;
            }
          }
          else
          {
            if (v12 == 786865)
            {
              v10 = CFSTR("Slideshow");
              goto LABEL_3;
            }
            if (v12 == 786874)
            {
              v10 = CFSTR("DigitalWallet");
              goto LABEL_3;
            }
          }
        }
        else if (v12 > 786665)
        {
          if (v12 == 786666)
          {
            v10 = CFSTR("VolumeDecrement");
            goto LABEL_3;
          }
          if (v12 == 786846)
          {
            v10 = CFSTR("TerminalLock");
            goto LABEL_3;
          }
        }
        else
        {
          if (v12 == 786658)
          {
            v10 = CFSTR("ToggleMute");
            goto LABEL_3;
          }
          if (v12 == 786665)
          {
            v10 = CFSTR("VolumeIncrement");
            goto LABEL_3;
          }
        }
LABEL_177:
        v10 = CFSTR("Unknown");
        goto LABEL_3;
      }
      if (v12 <= 787035)
      {
        if (v12 > 786979)
        {
          if (v12 == 786980)
          {
            v10 = CFSTR("ACBack");
            goto LABEL_3;
          }
          if (v12 == 787035)
          {
            v10 = CFSTR("Like");
            goto LABEL_3;
          }
        }
        else
        {
          if (v12 == 786977)
          {
            v10 = CFSTR("ACSearch");
            goto LABEL_3;
          }
          if (v12 == 786979)
          {
            v10 = CFSTR("ACHome");
            goto LABEL_3;
          }
        }
        goto LABEL_177;
      }
      if (v12 <= 787100)
      {
        if (v12 == 787036)
        {
          v10 = CFSTR("Dislike");
          goto LABEL_3;
        }
        if (v12 == 787042)
        {
          v10 = CFSTR("AddToWishlist");
          goto LABEL_3;
        }
        goto LABEL_177;
      }
      if (v12 == 787101)
      {
        v10 = CFSTR("KeyboardLayoutSelect");
        goto LABEL_3;
      }
      if (v12 != 16711683)
        goto LABEL_177;
    }
    else
    {
      if (v12 > 720928)
      {
        if (v12 <= 786495)
        {
          if (v12 > 720941)
          {
            switch(v12)
            {
              case 720942:
                v10 = CFSTR("Ringer");
                goto LABEL_3;
              case 786436:
                v10 = CFSTR("Microphone");
                goto LABEL_3;
              case 786480:
                v10 = CFSTR("Lock");
                goto LABEL_3;
            }
          }
          else
          {
            switch(v12)
            {
              case 720929:
                v10 = CFSTR("Headset");
                goto LABEL_3;
              case 720931:
                v10 = CFSTR("ObsoleteHold");
                goto LABEL_3;
              case 720941:
                v10 = CFSTR("RingEnable");
                goto LABEL_3;
            }
          }
        }
        else
        {
          if (v12 <= 786527)
          {
            switch(v12)
            {
              case 786496:
                goto LABEL_100;
              case 786497:
                goto LABEL_121;
              case 786498:
                v10 = CFSTR("Up");
                break;
              case 786499:
                v10 = CFSTR("Down");
                break;
              case 786500:
                v10 = CFSTR("Left");
                break;
              case 786501:
                v10 = CFSTR("Right");
                break;
              default:
                goto LABEL_177;
            }
            goto LABEL_3;
          }
          if (v12 <= 786542)
          {
            if (v12 == 786528)
            {
              v10 = CFSTR("TV");
              goto LABEL_3;
            }
            if (v12 == 786533)
            {
              v10 = CFSTR("Snapshot");
              goto LABEL_3;
            }
          }
          else
          {
            switch(v12)
            {
              case 786543:
                v10 = CFSTR("DisplayBrightnessIncrement");
                goto LABEL_3;
              case 786544:
                v10 = CFSTR("DisplayBrightnessDecrement");
                goto LABEL_3;
              case 786553:
                v10 = CFSTR("KeyboardBrightnessIncrement");
                goto LABEL_3;
            }
          }
        }
        goto LABEL_177;
      }
      if (v12 > -16187392)
      {
        if (v12 <= -16187361)
        {
          switch(v12)
          {
            case -16187391:
              v10 = CFSTR("SmartCoverOpen");
              break;
            case -16187390:
              v10 = CFSTR("SmartCoverFlap1");
              break;
            case -16187389:
              v10 = CFSTR("SmartCoverFlap2");
              break;
            case -16187388:
              v10 = CFSTR("SmartCoverFlap3");
              break;
            default:
              if (v12 != -16187376)
                goto LABEL_177;
              v10 = CFSTR("SmartCoverAttach");
              break;
          }
          goto LABEL_3;
        }
        if (v12 > 65669)
        {
          if (v12 == 65670)
          {
            v10 = CFSTR("Menu");
            goto LABEL_3;
          }
          if (v12 == 65691)
          {
            v10 = CFSTR("DoNotDisturb");
            goto LABEL_3;
          }
        }
        else
        {
          if (v12 == -16187360)
          {
            v10 = CFSTR("SmartCoverStateUnknown");
            goto LABEL_3;
          }
          if (v12 == 65667)
          {
            v10 = CFSTR("SystemWakeUp");
            goto LABEL_3;
          }
        }
        goto LABEL_177;
      }
      if (v12 > -16711648)
      {
        if (v12 > -16711169)
        {
          if (v12 == -16711168)
          {
            v10 = CFSTR("Action");
            goto LABEL_3;
          }
          if (v12 == -16318463)
          {
            v10 = CFSTR("HeadsetAvailability");
            goto LABEL_3;
          }
        }
        else
        {
          if (v12 == -16711647)
          {
            v10 = CFSTR("BrightnessDown");
            goto LABEL_3;
          }
          if (v12 == -16711632)
          {
            v10 = CFSTR("Language");
            goto LABEL_3;
          }
        }
        goto LABEL_177;
      }
      if (v12 > -16711665)
      {
        if (v12 == -16711664)
        {
          v10 = CFSTR("ExposéAll");
          goto LABEL_3;
        }
        if (v12 == -16711648)
        {
          v10 = CFSTR("BrightnessUp");
          goto LABEL_3;
        }
        goto LABEL_177;
      }
      if (v12 != -16711677)
      {
        if (v12 == -16711676)
        {
          v10 = CFSTR("Launchpad");
          goto LABEL_3;
        }
        goto LABEL_177;
      }
    }
    v10 = CFSTR("Function");
    goto LABEL_3;
  }
  v10 = CFSTR("KeyPress");
LABEL_3:
  v35 = v10;
  v41 = v6;
  if ((_DWORD)a2)
  {
    NSStringFromBKSHIDEventSource(a2);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(CFSTR("source"), "stringByAppendingFormat:", CFSTR(":%@ "), v11);
    v39 = (__CFString *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v39 = &stru_1E1EA2860;
  }
  Children = IOHIDEventGetChildren();
  if (!Children)
  {
    v36 = &stru_1E1EA2860;
    v17 = 0x1E0CB3000;
    v18 = v38;
    goto LABEL_53;
  }
  v14 = (const __CFArray *)Children;
  for (i = 0; ; ++i)
  {
    if (i >= CFArrayGetCount(v14))
    {
      v16 = 0;
      goto LABEL_19;
    }
    CFArrayGetValueAtIndex(v14, i);
    if (IOHIDEventGetType() == 1 && IOHIDEventGetIntegerValue() == 65299)
      break;
  }
  v16 = IOHIDEventGetIntegerValue();
  if (v16 == 1)
  {
    v19 = CFSTR("(IR) ");
    goto LABEL_51;
  }
  if (v16 == 16)
  {
    v19 = CFSTR("(MediaRemote) ");
    goto LABEL_51;
  }
  if (v16 != 2)
  {
LABEL_19:
    v17 = 0x1E0CB3000uLL;
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(AppleVendorSenderID:0x%X) "), v16);
    v36 = (__CFString *)objc_claimAutoreleasedReturnValue();
    goto LABEL_52;
  }
  v19 = CFSTR("(CEC) ");
LABEL_51:
  v36 = (__CFString *)v19;
  v17 = 0x1E0CB3000uLL;
LABEL_52:
  v18 = v38;
LABEL_53:
  if ((unint64_t)(SenderID + 0x7FFFFFF7E8CE6C8FLL) < 6 || SenderID == 0x8000000817319378)
  {
    v34 = SenderID;
    v20 = CFSTR(":%llX(AX) ");
    goto LABEL_55;
  }
  if (SenderID)
  {
    if ((_DWORD)a2)
    {
      objc_msgSend(CFSTR("senderID"), "stringByAppendingFormat:", CFSTR(":%llX "), SenderID);
      goto LABEL_56;
    }
    v21 = &stru_1E1EA2860;
    if (!Phase)
      goto LABEL_69;
LABEL_57:
    objc_msgSend(CFSTR("phase"), "stringByAppendingFormat:", CFSTR(":0x%lX "), Phase);
    v22 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v20 = CFSTR(":zero(!) ");
LABEL_55:
    objc_msgSend(CFSTR("senderID"), "stringByAppendingFormat:", v20, v34);
LABEL_56:
    v21 = (__CFString *)objc_claimAutoreleasedReturnValue();
    if (Phase)
      goto LABEL_57;
LABEL_69:
    v22 = &stru_1E1EA2860;
  }
  if (v8 == 1)
  {
    v23 = &stru_1E1EA2860;
    if (v18)
      goto LABEL_72;
LABEL_75:
    v24 = &stru_1E1EA2860;
    if (IntegerValue)
      goto LABEL_76;
LABEL_78:
    if ((Phase & 4) != 0 && IntegerValue)
    {
      v25 = CFSTR("end");
    }
    else if (IntegerValue || (Phase & 4) == 0)
    {
      v25 = CFSTR("up");
      if (IntegerValue)
        v25 = CFSTR("down");
      if (v18)
        v25 = CFSTR("long press");
    }
    else
    {
      v25 = CFSTR("timeout");
    }
  }
  else
  {
    objc_msgSend(CFSTR("pressCount"), "stringByAppendingFormat:", CFSTR(":%d "), v8);
    v23 = (__CFString *)objc_claimAutoreleasedReturnValue();
    if (!v18)
      goto LABEL_75;
LABEL_72:
    objc_msgSend(CFSTR("longPress"), "stringByAppendingFormat:", CFSTR(":%d "), 1);
    v24 = (__CFString *)objc_claimAutoreleasedReturnValue();
    if (!IntegerValue)
      goto LABEL_78;
LABEL_76:
    if ((Phase & 1) == 0)
      goto LABEL_78;
    v25 = CFSTR("began");
  }
  v26 = v25;
  v27 = objc_msgSend(v9, "options");
  if (v27)
  {
    v28 = *(void **)(v17 + 2368);
    NSStringFromBKSHIDEventAttributeOptions(v27);
    v29 = v9;
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "stringWithFormat:", CFSTR(" (%@)"), v30);
    v31 = (__CFString *)objc_claimAutoreleasedReturnValue();

    v9 = v29;
  }
  else
  {
    v31 = &stru_1E1EA2860;
  }
  objc_msgSend(v40, "stringWithFormat:", CFSTR("%@ page:0x%X usage:0x%X downEvent:%d %@%@%@%@%@%@%@%@"), v35, v42, v41, IntegerValue != 0, v39, v36, v21, v22, v23, v24, v26, v31);
  v32 = (void *)objc_claimAutoreleasedReturnValue();

  return v32;
}

__CFString *BKNSStringFromIOHIDGenericGestureType(uint64_t a1)
{
  __CFString *v1;

  switch((_DWORD)a1)
  {
    case 0:
      return CFSTR("tap");
    case 5:
      return CFSTR("squeeze");
    case 1:
      v1 = CFSTR("swipe");
      break;
    default:
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("<unknown:%d>"), a1);
      v1 = (__CFString *)objc_claimAutoreleasedReturnValue();
      break;
  }
  return v1;
}

__CFString *_BKSHIDEventGetConciseDescriptionGenericGesture()
{
  int IntegerValue;
  uint64_t v1;
  void *v2;
  int v3;
  void *v4;
  void *v5;
  int Phase;
  const __CFString *v7;
  void *v8;
  void *v9;
  int v10;
  __CFString *v11;
  const __CFString *v13;
  void *v14;
  void *v15;

  IntegerValue = IOHIDEventGetIntegerValue();
  if (IntegerValue == 5)
  {
    v5 = (void *)MEMORY[0x1E0CB3940];
    Phase = IOHIDEventGetPhase();
    BKNSStringFromIOHIDEventPhase(Phase);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = CFSTR("squeeze");
    v14 = v4;
    v7 = CFSTR("%@ phase:%@");
LABEL_7:
    objc_msgSend(v5, "stringWithFormat:", v7, v13, v14, v15);
    goto LABEL_8;
  }
  if (IntegerValue == 1)
  {
    IOHIDEventGetDoubleValue();
    v9 = v8;
    v5 = (void *)MEMORY[0x1E0CB3940];
    v10 = IOHIDEventGetPhase();
    BKNSStringFromIOHIDEventPhase(v10);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = v4;
    v14 = v9;
    v13 = CFSTR("swipe");
    v7 = CFSTR("%@ progress:%g phase:%@");
    goto LABEL_7;
  }
  if (IntegerValue)
  {
    v11 = CFSTR("unknown");
    return v11;
  }
  v1 = IOHIDEventGetIntegerValue();
  v2 = (void *)MEMORY[0x1E0CB3940];
  v3 = IOHIDEventGetPhase();
  BKNSStringFromIOHIDEventPhase(v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "stringWithFormat:", CFSTR("%@ count:%d phase:%@"), CFSTR("tap"), v1, v4);
LABEL_8:
  v11 = (__CFString *)objc_claimAutoreleasedReturnValue();

  return v11;
}

__CFString *BKNSStringFromIOHIDEventPhase(int a1)
{
  __CFString *v3;
  void *v4;
  uint64_t i;
  void *v6;

  if (a1)
  {
    if ((a1 & (a1 - 1)) != 0 || a1 == 0)
    {
      objc_msgSend(MEMORY[0x1E0C99DE8], "array");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      for (i = 0; i != 16; ++i)
      {
        if (((1 << i) & a1) != 0)
        {
          _BKSPhaseStringForBit(a1);
          v6 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v4, "addObject:", v6);

        }
      }
      objc_msgSend(v4, "componentsJoinedByString:", CFSTR(", "));
      v3 = (__CFString *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      _BKSPhaseStringForBit(a1);
      v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
  }
  else
  {
    v3 = CFSTR("undefined");
  }
  return v3;
}

__CFString *_BKSPhaseStringForBit(int a1)
{
  __CFString *v1;
  __CFString *result;

  if (a1 > 15)
  {
    if (a1 > 63)
    {
      if (a1 == 64)
        return CFSTR("momentumEnd");
      if (a1 == 128)
        return CFSTR("mayBegin");
    }
    else
    {
      if (a1 == 16)
        return CFSTR("momentumContinue");
      if (a1 == 32)
        return CFSTR("momentumStart");
    }
LABEL_15:
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("unknown:%X"), a1);
    v1 = (__CFString *)objc_claimAutoreleasedReturnValue();
    return v1;
  }
  else
  {
    v1 = CFSTR("began");
    switch(a1)
    {
      case 1:
        return v1;
      case 2:
        result = CFSTR("changed");
        break;
      case 4:
        result = CFSTR("ended");
        break;
      case 8:
        result = CFSTR("cancelled");
        break;
      default:
        goto LABEL_15;
    }
  }
  return result;
}

id _BKSHIDEventGetConciseDescriptionPointer(void *a1)
{
  double v2;
  _BOOL4 v3;
  double v4;
  uint64_t v5;
  _BOOL8 v6;
  void *v7;
  void *v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  int v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  unsigned int Type;
  uint64_t v17;
  void *v18;
  id v19;
  void *v20;
  double v21;
  double v22;
  double v23;
  double v24;
  uint64_t IntegerValue;
  void *v26;
  void *v27;
  uint64_t v28;
  int v29;
  unint64_t v30;
  uint64_t v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t i;
  uint64_t v43;
  void *v44;
  uint64_t v46;
  void *v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  _BYTE v56[128];
  _BYTE v57[128];
  uint64_t v58;

  v58 = *MEMORY[0x1E0C80C00];
  if (IOHIDEventGetEvent())
  {
    IOHIDEventGetFloatValue();
    v3 = v2 != 0.0;
    IOHIDEventGetFloatValue();
    v5 = v4 != 0.0 || v3;
    if (IOHIDEventGetEvent())
      v6 = IOHIDEventGetIntegerValue() != 0;
    else
      v6 = 0;
    v18 = (void *)MEMORY[0x1E0CB3940];
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v5);
    v9 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v6);
    v19 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "stringWithFormat:", CFSTR("Pointer movement:%@ buttonDown:%@"), v9, v19);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    IOHIDEventGetChildren();
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v52 = 0u;
    v53 = 0u;
    v54 = 0u;
    v55 = 0u;
    v9 = v7;
    v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v52, v57, 16);
    v47 = a1;
    if (v10)
    {
      v11 = v10;
      v12 = 0;
      v13 = *(_QWORD *)v53;
      do
      {
        v14 = 0;
        do
        {
          if (*(_QWORD *)v53 != v13)
            objc_enumerationMutation(v9);
          v15 = *(_QWORD *)(*((_QWORD *)&v52 + 1) + 8 * v14);
          Type = IOHIDEventGetType();
          if (Type <= 0x11)
          {
            if (((1 << Type) & 0x8F6) != 0)
            {
              objc_msgSend(v8, "addObject:", v15);
              v12 = 1;
            }
            else if (Type == 17)
            {
              v12 = 1;
            }
          }
          ++v14;
        }
        while (v11 != v14);
        v17 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v52, v57, 16);
        v11 = v17;
      }
      while (v17);
    }
    else
    {
      v12 = 0;
    }

    IOHIDEventGetFloatValue();
    v22 = v21;
    IOHIDEventGetFloatValue();
    v24 = v23;
    IntegerValue = IOHIDEventGetIntegerValue();
    BKSHIDEventGetPointerAttributes(v47);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v27 = v26;
    if (v26)
    {
      v28 = objc_msgSend(v26, "activeModifiers");
      v29 = objc_msgSend(v27, "pointerEdgeMask");
    }
    else
    {
      v28 = 0;
      v29 = 0;
    }
    objc_msgSend(MEMORY[0x1E0CB37A0], "stringWithFormat:", CFSTR("Pointer"));
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    if (v22 != 0.0 || v24 != 0.0 || ((v12 ^ 1) & 1) != 0)
    {
      v30 = objc_msgSend(v27, "contextMove");
      NSStringFromBKSHIDEventContextType(objc_msgSend(v27, "contextType"));
      v31 = objc_claimAutoreleasedReturnValue();
      v32 = (void *)v31;
      if (v30)
      {
        NSStringFromBKSHIDEventContextMove(v30);
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v20, "appendFormat:", CFSTR(" %g,%g (%@ %@)"), *(_QWORD *)&v22, *(_QWORD *)&v24, v32, v33);

      }
      else
      {
        objc_msgSend(v20, "appendFormat:", CFSTR(" %g,%g (%@)"), *(_QWORD *)&v22, *(_QWORD *)&v24, v31);
      }

    }
    objc_msgSend(v27, "authenticationMessage");
    v34 = (void *)objc_claimAutoreleasedReturnValue();

    if (v34)
      objc_msgSend(v20, "appendString:", CFSTR(" auth"));
    objc_msgSend(v27, "hitTestSecurityAnalysis");
    v35 = (void *)objc_claimAutoreleasedReturnValue();

    if (v35)
      objc_msgSend(v20, "appendString:", CFSTR(" sa"));
    if (IntegerValue)
      objc_msgSend(v20, "appendFormat:", CFSTR(" buttonMask:%X"), IntegerValue);
    if (v28)
    {
      NSStringFromBKSKeyModifierFlags(v28);
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "appendFormat:", CFSTR(" modifiers:%@"), v36);

    }
    if (v29)
    {
      NSStringFromBKSHIDEventScreenEdgeMask(v29);
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "appendFormat:", CFSTR(" edges:%@"), v37);

    }
    v38 = objc_msgSend(v27, "fingerDownCount");
    if ((objc_msgSend(v27, "options") & 2) != 0)
    {
      if (v38 < 1)
        objc_msgSend(v20, "appendFormat:", CFSTR(" touchUp"), v46);
      else
        objc_msgSend(v20, "appendFormat:", CFSTR(" touchChanged fingersDown:%d"), v38);
    }
    else if (v38)
    {
      objc_msgSend(v20, "appendFormat:", CFSTR(" fingersDown:%d"), v38);
    }
    v50 = 0u;
    v51 = 0u;
    v48 = 0u;
    v49 = 0u;
    v19 = v8;
    v39 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v48, v56, 16);
    if (v39)
    {
      v40 = v39;
      v41 = *(_QWORD *)v49;
      do
      {
        for (i = 0; i != v40; ++i)
        {
          if (*(_QWORD *)v49 != v41)
            objc_enumerationMutation(v19);
          v43 = *(_QWORD *)(*((_QWORD *)&v48 + 1) + 8 * i);
          objc_msgSend(v20, "appendString:", CFSTR(" "));
          BKSHIDEventGetConciseDescription(v43);
          v44 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v20, "appendString:", v44);

        }
        v40 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v48, v56, 16);
      }
      while (v40);
    }

  }
  return v20;
}

void _BKSHIDEventAppendEventFlags(uint64_t a1, void *a2)
{
  unsigned int IntegerValue;
  uint64_t v3;
  int v4;
  int v5;
  int v6;
  const __CFString *v7;
  const __CFString *v8;
  char v9;
  id v10;

  v10 = a2;
  IntegerValue = IOHIDEventGetIntegerValue();
  v3 = IOHIDEventGetIntegerValue();
  v4 = (v3 != 0) & (IntegerValue >> 1);
  v5 = IOHIDEventGetIntegerValue();
  v6 = IOHIDEventGetIntegerValue();
  if ((IntegerValue & 0x80) != 0)
  {
    objc_msgSend(v10, "appendString:withName:", CFSTR("cancel"), 0);
    if ((IntegerValue & 0x20000) == 0)
    {
LABEL_3:
      if (!v4)
        goto LABEL_4;
      goto LABEL_9;
    }
  }
  else if ((IntegerValue & 0x20000) == 0)
  {
    goto LABEL_3;
  }
  objc_msgSend(v10, "appendString:withName:", CFSTR("tap"), 0);
  if (!v4)
  {
LABEL_4:
    if ((IntegerValue & 4) == 0)
      goto LABEL_5;
    goto LABEL_10;
  }
LABEL_9:
  objc_msgSend(v10, "appendString:withName:", CFSTR("down"), 0);
  if ((IntegerValue & 4) == 0)
  {
LABEL_5:
    if ((IntegerValue & 2) == 0)
      goto LABEL_15;
    goto LABEL_13;
  }
LABEL_10:
  if (v3)
  {
    objc_msgSend(v10, "appendString:withName:", CFSTR("move"), 0);
    goto LABEL_15;
  }
  objc_msgSend(v10, "appendString:withName:", CFSTR("move (not touching!)"), 0);
  if ((IntegerValue & 2) != 0)
  {
LABEL_13:
    if (!v3)
    {
      v7 = CFSTR("up");
LABEL_27:
      objc_msgSend(v10, "appendString:withName:", v7, 0);
      goto LABEL_28;
    }
  }
LABEL_15:
  if ((IntegerValue & 3) == 1)
  {
    if (IOHIDEventGetIntegerValue())
      v8 = CFSTR("range (in)");
    else
      v8 = CFSTR("range (out)");
    objc_msgSend(v10, "appendString:withName:", v8, 0);
  }
  if ((IntegerValue & 0x40) != 0)
    v9 = (v3 != 0) & (IntegerValue >> 1);
  else
    v9 = 1;
  if ((v9 & 1) == 0 && (IntegerValue & 4) == 0 && (IntegerValue & 0x80) == 0)
  {
    v7 = CFSTR("attribute");
    goto LABEL_27;
  }
LABEL_28:
  if (v5)
    objc_msgSend(v10, "appendString:withName:", CFSTR("will-update"), 0);
  if (v6)
    objc_msgSend(v10, "appendString:withName:", CFSTR("did-update"), 0);
  if ((IntegerValue & 0x800) != 0)
  {
    objc_msgSend(v10, "appendString:withName:", CFSTR("edge"), 0);
    if ((IntegerValue & 0x1000) == 0)
    {
LABEL_34:
      if ((IntegerValue & 0x2000) == 0)
        goto LABEL_35;
LABEL_40:
      objc_msgSend(v10, "appendString:withName:", CFSTR("swipe-pending"), 0);
      if ((IntegerValue & 0x40000) == 0)
        goto LABEL_37;
      goto LABEL_36;
    }
  }
  else if ((IntegerValue & 0x1000) == 0)
  {
    goto LABEL_34;
  }
  objc_msgSend(v10, "appendString:withName:", CFSTR("corner"), 0);
  if ((IntegerValue & 0x2000) != 0)
    goto LABEL_40;
LABEL_35:
  if ((IntegerValue & 0x40000) != 0)
LABEL_36:
    objc_msgSend(v10, "appendString:withName:", CFSTR("swipe-locked"), 0);
LABEL_37:

}

id _BKSHIDEventGetConciseDescriptionScroll()
{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  double v5;
  double v6;
  int Phase;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v12;

  IOHIDEventGetChildren();
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v0, "firstObject"))
    IOHIDEventGetType();
  IOHIDEventGetFloatValue();
  v2 = v1;
  IOHIDEventGetFloatValue();
  v4 = v3;
  IOHIDEventGetFloatValue();
  v6 = v5;
  Phase = IOHIDEventGetPhase();
  if (Phase)
  {
    v8 = (void *)MEMORY[0x1E0CB3940];
    BKNSStringFromIOHIDEventPhase(Phase);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "stringWithFormat:", CFSTR("Scroll %g,%g (%@)"), v2, v4, v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    if (v6 == 0.0)
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Scroll %g,%g"), v2, v4, v12);
    else
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Scroll x:%g y:%g z:%g"), v2, v4, *(_QWORD *)&v6);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v10;
}

id _BKSHIDEventGetConciseDescriptionScale()
{
  int Phase;
  double v1;
  double v2;
  double v3;
  double v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  uint64_t v12;
  uint64_t v13;

  Phase = IOHIDEventGetPhase();
  IOHIDEventGetFloatValue();
  v2 = v1;
  IOHIDEventGetFloatValue();
  v4 = v3;
  IOHIDEventGetFloatValue();
  v6 = v5;
  v7 = (void *)MEMORY[0x1E0CB3940];
  BKNSStringFromIOHIDEventPhase(Phase);
  v8 = objc_claimAutoreleasedReturnValue();
  v9 = (void *)v8;
  if (v2 == 0.0 && v4 == 0.0)
    objc_msgSend(v7, "stringWithFormat:", CFSTR("Scale (%@) z:%g"), v8, v6, v12, v13);
  else
    objc_msgSend(v7, "stringWithFormat:", CFSTR("Scale (%@) x:%g y%g z:%g"), v8, *(_QWORD *)&v2, *(_QWORD *)&v4, v6);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

id _BKSHIDEventGetConciseDescriptionTranslation()
{
  int Phase;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  double v5;
  double v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  uint64_t v12;

  Phase = IOHIDEventGetPhase();
  IOHIDEventGetFloatValue();
  v2 = v1;
  IOHIDEventGetFloatValue();
  v4 = v3;
  IOHIDEventGetFloatValue();
  v6 = v5;
  v7 = (void *)MEMORY[0x1E0CB3940];
  BKNSStringFromIOHIDEventPhase(Phase);
  v8 = objc_claimAutoreleasedReturnValue();
  v9 = (void *)v8;
  if (v6 == 0.0)
    objc_msgSend(v7, "stringWithFormat:", CFSTR("Translation (%@) %g,%g"), v8, v2, v4, v12);
  else
    objc_msgSend(v7, "stringWithFormat:", CFSTR("Translation (%@) x:%g y:%g z:%g"), v8, v2, v4, *(_QWORD *)&v6);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

id _BKSHIDEventGetConciseDescriptionRotation()
{
  int Phase;
  double v1;
  double v2;
  double v3;
  double v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  uint64_t v12;
  uint64_t v13;

  Phase = IOHIDEventGetPhase();
  IOHIDEventGetFloatValue();
  v2 = v1;
  IOHIDEventGetFloatValue();
  v4 = v3;
  IOHIDEventGetFloatValue();
  v6 = v5;
  v7 = (void *)MEMORY[0x1E0CB3940];
  BKNSStringFromIOHIDEventPhase(Phase);
  v8 = objc_claimAutoreleasedReturnValue();
  v9 = (void *)v8;
  if (v2 == 0.0 && v4 == 0.0)
    objc_msgSend(v7, "stringWithFormat:", CFSTR("Rotation (%@) z:%g"), v8, v6, v12, v13);
  else
    objc_msgSend(v7, "stringWithFormat:", CFSTR("Rotation (%@) x:%g y%g z:%g"), v8, *(_QWORD *)&v2, *(_QWORD *)&v4, v6);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

uint64_t _BKSHIDEventGetConciseDescriptionButton()
{
  uint64_t IntegerValue;

  IntegerValue = IOHIDEventGetIntegerValue();
  return objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Button mask:%X number:%d"), IntegerValue, IOHIDEventGetIntegerValue());
}

id _BKSHIDEventGetConciseDescriptionVendorDefined()
{
  uint64_t IntegerValue;
  uint64_t v1;

  IntegerValue = IOHIDEventGetIntegerValue();
  v1 = IOHIDEventGetIntegerValue();
  if (IntegerValue == 65280 && v1 == 17)
    _BKSHIDEventGetConciseDescriptionVendorDefinedForceStageEvent();
  else
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("VendorDefined page:%X usage:%X"), IntegerValue, v1);
  return (id)objc_claimAutoreleasedReturnValue();
}

id _BKSHIDEventGetConciseDescriptionVendorDefinedForceStageEvent()
{
  uint64_t v1;
  uint64_t v2;

  IOHIDEventGetVendorDefinedData();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("<corrupt data>"), v1, v2);
  return (id)objc_claimAutoreleasedReturnValue();
}

uint64_t BKSHIDServicesProximityDetectionModeIsValid(unsigned int a1)
{
  return (a1 < 0x15) & (0x10307Fu >> a1);
}

__CFString *NSStringFromBKSHIDForceStageTransition(uint64_t a1)
{
  if (a1 < 3)
    return off_1E1EA1BD8[a1];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("<invalid:%X>"), a1);
  return (__CFString *)(id)objc_claimAutoreleasedReturnValue();
}

void BKSHIDEventEnumerateChildEvents(uint64_t a1, void *a2)
{
  id v3;
  void (**v4)(_QWORD, _QWORD, _QWORD, _QWORD);
  const __CFArray *Children;
  const __CFArray *v6;
  CFIndex Count;
  CFIndex v8;
  uint64_t v9;
  const void *ValueAtIndex;
  char v11;

  v3 = a2;
  v4 = (void (**)(_QWORD, _QWORD, _QWORD, _QWORD))v3;
  if (a1)
  {
    if (v3)
    {
      Children = (const __CFArray *)IOHIDEventGetChildren();
      if (Children)
      {
        v6 = Children;
        Count = CFArrayGetCount(Children);
        v11 = 0;
        if (Count >= 1)
        {
          v8 = Count;
          v9 = 1;
          do
          {
            ValueAtIndex = CFArrayGetValueAtIndex(v6, v9 - 1);
            ((void (**)(_QWORD, const void *, uint64_t, char *))v4)[2](v4, ValueAtIndex, v9 - 1, &v11);
            if (v9 >= v8)
              break;
            ++v9;
          }
          while (!v11);
        }
      }
    }
  }

}

id _BKSHIDEventGetEventInfoDescription(id a1)
{
  id v1;
  unsigned __int8 *AttributeDataPtr;
  void *v3;
  void *v4;

  v1 = a1;
  if (a1)
  {
    if (IOHIDEventGetAttributeDataLength() >= 1
      && (AttributeDataPtr = (unsigned __int8 *)IOHIDEventGetAttributeDataPtr()) != 0
      && *((_DWORD *)AttributeDataPtr + 1)
      && *AttributeDataPtr - 1 <= 6)
    {
      BKSHIDEventGetBaseAttributes(v1);
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      v4 = v3;
      if (v3)
      {
        objc_msgSend(v3, "description");
        v1 = (id)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v1 = 0;
      }

    }
    else
    {
      v1 = 0;
    }
  }
  return v1;
}

id BKSHIDEventDescription(void *a1)
{
  void *v2;
  __CFString *v3;
  void *v4;

  _BKSHIDEventGetEventInfoDescription(a1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (__CFString *)CFCopyDescription(a1);
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@\n%@"), v2, v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

void BKSHIDEventEnumerateUpdatesWithBlock(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  uint64_t IntegerValue;
  int v6;
  void *v7;
  void *v8;
  _QWORD v9[4];
  id v10;
  uint64_t v11;
  int v12;
  uint8_t buf[4];
  void *v14;
  __int16 v15;
  const __CFString *v16;
  __int16 v17;
  int v18;
  __int16 v19;
  void *v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  if (!v3)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("why so nil, bro?"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "void BKSHIDEventEnumerateUpdatesWithBlock(IOHIDEventRef, __strong BKSHIDEventUpdateHandler)");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138544130;
      v14 = v8;
      v15 = 2114;
      v16 = CFSTR("BKSHIDEvent.m");
      v17 = 1024;
      v18 = 2040;
      v19 = 2114;
      v20 = v7;
      _os_log_error_impl(&dword_18A0F0000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "failure in %{public}@ (%{public}@:%i) : %{public}@", buf, 0x26u);

    }
    objc_msgSend(objc_retainAutorelease(v7), "UTF8String");
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x18A14FD30);
  }
  v4 = v3;
  if (IOHIDEventGetType() == 11)
  {
    IntegerValue = IOHIDEventGetIntegerValue();
    v6 = IOHIDEventGetIntegerValue();
    if (IntegerValue)
    {
      if (v6)
      {
        v9[0] = MEMORY[0x1E0C809B0];
        v9[1] = 3221225472;
        v9[2] = __BKSHIDEventEnumerateUpdatesWithBlock_block_invoke;
        v9[3] = &unk_1E1EA1950;
        v11 = IntegerValue;
        v12 = v6;
        v10 = v4;
        BKSHIDEventEnumerateChildEvents(a1, v9);

      }
    }
  }

}

uint64_t BKSHIDEventMatchingPredicate(uint64_t a1, void *a2)
{
  return _BKSHIDEventMatchingPredicateCore(a1, 0, a2);
}

uint64_t _BKSHIDEventMatchingPredicateCore(uint64_t a1, uint64_t a2, void *a3)
{
  id v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v15;
  void *v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  uint8_t v21[128];
  uint8_t buf[4];
  void *v23;
  __int16 v24;
  const __CFString *v25;
  __int16 v26;
  int v27;
  __int16 v28;
  void *v29;
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Can't pass nil for predicate. That's illegal."));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "IOHIDEventRef _BKSHIDEventMatchingPredicateCore(IOHIDEventRef, NSInteger, BOOL (^__strong)(IOHIDEventRef, NSInteger))");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138544130;
      v23 = v16;
      v24 = 2114;
      v25 = CFSTR("BKSHIDEvent.m");
      v26 = 1024;
      v27 = 2061;
      v28 = 2114;
      v29 = v15;
      _os_log_error_impl(&dword_18A0F0000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "failure in %{public}@ (%{public}@:%i) : %{public}@", buf, 0x26u);

    }
    objc_msgSend(objc_retainAutorelease(v15), "UTF8String");
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x18A1501E8);
  }
  v6 = v5;
  if (a1 && ((*((uint64_t (**)(id, uint64_t, uint64_t))v5 + 2))(v5, a1, a2) & 1) == 0)
  {
    v19 = 0u;
    v20 = 0u;
    v17 = 0u;
    v18 = 0u;
    IOHIDEventGetChildren();
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
    if (v8)
    {
      v9 = v8;
      v10 = *(_QWORD *)v18;
      v11 = a2 + 1;
      while (2)
      {
        v12 = 0;
        do
        {
          if (*(_QWORD *)v18 != v10)
            objc_enumerationMutation(v7);
          v13 = _BKSHIDEventMatchingPredicateCore(*(_QWORD *)(*((_QWORD *)&v17 + 1) + 8 * v12), v11, v6);
          if (v13)
          {
            a1 = v13;
            goto LABEL_14;
          }
          ++v12;
        }
        while (v9 != v12);
        v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
        if (v9)
          continue;
        break;
      }
    }
    a1 = 0;
LABEL_14:

  }
  return a1;
}

uint64_t BKSHIDEventDigitizerDetachTouchesWithIdentifiers(void *a1, int a2)
{
  uint64_t v3;
  id v4;
  uint64_t v5;

  v3 = BKSHIDEventDigitizerDetachTouchesWithIdentifiers_onceToken;
  v4 = a1;
  if (v3 != -1)
    dispatch_once(&BKSHIDEventDigitizerDetachTouchesWithIdentifiers_onceToken, &__block_literal_global_11323);
  v5 = BKSHIDEventDigitizerDetachTouches(v4, a2, (void *)BKSHIDEventDigitizerDetachTouchesWithIdentifiers_policy, *MEMORY[0x1E0C9D538], *(double *)(MEMORY[0x1E0C9D538] + 8));

  return v5;
}

uint64_t BKSHIDEventDigitizerDetachTouches(void *a1, int a2, void *a3, double a4, double a5)
{
  id v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  char *v14;
  uint64_t i;
  void *v16;
  void *v17;
  mach_port_t v18;
  float v19;
  float v20;
  id v21;
  int v22;
  int v23;
  NSObject *v24;
  const char *v25;
  NSObject *v26;
  uint32_t v27;
  uint64_t v28;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  uint64_t v36;
  char v37;
  uint8_t buf[4];
  id v39;
  __int16 v40;
  const __CFString *v41;
  __int16 v42;
  int v43;
  __int16 v44;
  void *v45;
  uint64_t v46;

  v46 = *MEMORY[0x1E0C80C00];
  v9 = a1;
  v10 = a3;
  v11 = objc_msgSend(v9, "count");
  if (v11 <= 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("need more than zero identifiers"));
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "BOOL BKSHIDEventDigitizerDetachTouches(NSArray<NSNumber *> *__strong _Nonnull, uint32_t, BKSHIDTouchRoutingPolicy *__strong _Nonnull, CGPoint)");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138544130;
      v39 = v31;
      v40 = 2114;
      v41 = CFSTR("BKSHIDEvent.m");
      v42 = 1024;
      v43 = 2109;
      v44 = 2114;
      v45 = v30;
      _os_log_error_impl(&dword_18A0F0000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "failure in %{public}@ (%{public}@:%i) : %{public}@", buf, 0x26u);

    }
    objc_msgSend(objc_retainAutorelease(v30), "UTF8String");
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x18A1505E0);
  }
  v12 = v11;
  if ((unint64_t)v11 >= 0x20)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("need less than 32 identifiers"));
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "BOOL BKSHIDEventDigitizerDetachTouches(NSArray<NSNumber *> *__strong _Nonnull, uint32_t, BKSHIDTouchRoutingPolicy *__strong _Nonnull, CGPoint)");
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138544130;
      v39 = v33;
      v40 = 2114;
      v41 = CFSTR("BKSHIDEvent.m");
      v42 = 1024;
      v43 = 2110;
      v44 = 2114;
      v45 = v32;
      _os_log_error_impl(&dword_18A0F0000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "failure in %{public}@ (%{public}@:%i) : %{public}@", buf, 0x26u);

    }
    objc_msgSend(objc_retainAutorelease(v32), "UTF8String");
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x18A1506A8);
  }
  if (!v10)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("need a policy (a default one will do)"));
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "BOOL BKSHIDEventDigitizerDetachTouches(NSArray<NSNumber *> *__strong _Nonnull, uint32_t, BKSHIDTouchRoutingPolicy *__strong _Nonnull, CGPoint)");
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138544130;
      v39 = v35;
      v40 = 2114;
      v41 = CFSTR("BKSHIDEvent.m");
      v42 = 1024;
      v43 = 2112;
      v44 = 2114;
      v45 = v34;
      _os_log_error_impl(&dword_18A0F0000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "failure in %{public}@ (%{public}@:%i) : %{public}@", buf, 0x26u);

    }
    objc_msgSend(objc_retainAutorelease(v34), "UTF8String");
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x18A150770);
  }
  MEMORY[0x1E0C80A78]();
  v14 = (char *)&v36 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  for (i = 0; i != v12; ++i)
  {
    objc_msgSend(v9, "objectAtIndex:", i);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)&v14[4 * i] = objc_msgSend(v16, "unsignedIntValue");

  }
  objc_msgSend(MEMORY[0x1E0DE7910], "bs_secureDataFromObject:", v10);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v17)
  {
    BKLogCommon();
    v24 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
      goto LABEL_11;
    *(_DWORD *)buf = 138543362;
    v39 = v10;
    v25 = "Error encoding policy: %{public}@";
    goto LABEL_18;
  }
  v37 = 0;
  v18 = _BKSServerPortHelper("com.apple.backboard.hid.services", BKSHIDServerPort, &BKSHIDServerMachPort, (void (__cdecl *)(CFMachPortRef, void *))_InvalidateHIDServicesPort);
  v21 = objc_retainAutorelease(v17);
  v19 = a4;
  v20 = a5;
  v22 = _BKSHIDDigitizerTouchDetach(v18, v19, v20, (uint64_t)v14, v12, a2, objc_msgSend(v21, "bytes"), objc_msgSend(v21, "length"), &v37);
  if (!v22)
  {
    if (v37)
    {
      v28 = 1;
      goto LABEL_12;
    }
    BKLogCommon();
    v24 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
      goto LABEL_11;
    *(_DWORD *)buf = 138543362;
    v39 = v9;
    v25 = "Touches not found:%{public}@";
LABEL_18:
    v26 = v24;
    v27 = 12;
    goto LABEL_19;
  }
  v23 = v22;
  BKLogCommon();
  v24 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 67109120;
    LODWORD(v39) = v23;
    v25 = "Error detaching touches: 0x%X";
    v26 = v24;
    v27 = 8;
LABEL_19:
    _os_log_error_impl(&dword_18A0F0000, v26, OS_LOG_TYPE_ERROR, v25, buf, v27);
  }
LABEL_11:

  v28 = 0;
LABEL_12:

  return v28;
}

uint64_t BKSHIDEventDigitizerDetachTouchesWithIdentifiersAndPolicy(void *a1, int a2, void *a3)
{
  return BKSHIDEventDigitizerDetachTouches(a1, a2, a3, *MEMORY[0x1E0C9D538], *(double *)(MEMORY[0x1E0C9D538] + 8));
}

uint64_t BKSHIDEventDigitizerSetTouchOffset(int a1, double a2, double a3)
{
  mach_port_t v6;
  float v7;
  float v8;
  void *v10;
  void *v11;
  int v12;
  void *v13;
  __int16 v14;
  const __CFString *v15;
  __int16 v16;
  int v17;
  __int16 v18;
  void *v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  if (!a1)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("need nonzero userIdentififer"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "void BKSHIDEventDigitizerSetTouchOffset(uint32_t, CGPoint)");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = 138544130;
      v13 = v11;
      v14 = 2114;
      v15 = CFSTR("BKSHIDEvent.m");
      v16 = 1024;
      v17 = 2142;
      v18 = 2114;
      v19 = v10;
      _os_log_error_impl(&dword_18A0F0000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "failure in %{public}@ (%{public}@:%i) : %{public}@", (uint8_t *)&v12, 0x26u);

    }
    objc_msgSend(objc_retainAutorelease(v10), "UTF8String");
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x18A150904);
  }
  v6 = _BKSServerPortHelper("com.apple.backboard.hid.services", BKSHIDServerPort, &BKSHIDServerMachPort, (void (__cdecl *)(CFMachPortRef, void *))_InvalidateHIDServicesPort);
  v7 = a2;
  v8 = a3;
  return _BKSHIDDigitizerTouchSetOffset(v6, a1, v7, v8);
}

void BKSHIDEventDigitizerSetTouchRoutingPolicy(int a1, void *a2)
{
  id v3;
  id v4;
  void *v5;
  void *v6;
  int v7;
  id v8;
  int v9;
  int v10;
  NSObject *v11;
  const char *v12;
  NSObject *v13;
  uint32_t v14;
  void *v15;
  void *v16;
  void *v17;
  objc_class *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  objc_class *v23;
  void *v24;
  objc_class *v25;
  void *v26;
  void *v27;
  void *v28;
  uint8_t buf[4];
  _BYTE v30[10];
  const __CFString *v31;
  __int16 v32;
  int v33;
  __int16 v34;
  void *v35;
  uint64_t v36;

  v36 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  if (!a1)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("zero is not a valid userIdentifier"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "void BKSHIDEventDigitizerSetTouchRoutingPolicy(uint32_t, BKSHIDTouchRoutingPolicy *__strong _Nonnull)");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138544130;
      *(_QWORD *)v30 = v16;
      *(_WORD *)&v30[8] = 2114;
      v31 = CFSTR("BKSHIDEvent.m");
      v32 = 1024;
      v33 = 2148;
      v34 = 2114;
      v35 = v15;
      _os_log_error_impl(&dword_18A0F0000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "failure in %{public}@ (%{public}@:%i) : %{public}@", buf, 0x26u);

    }
    objc_msgSend(objc_retainAutorelease(v15), "UTF8String");
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x18A150B9CLL);
  }
  v4 = v3;
  if (!v4)
  {
    v17 = (void *)MEMORY[0x1E0CB3940];
    v18 = (objc_class *)objc_opt_class();
    NSStringFromClass(v18);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "stringWithFormat:", CFSTR("Value for '%@' was unexpectedly nil. Expected %@."), CFSTR("policyForDetachedTouches"), v19);
    v20 = (void *)objc_claimAutoreleasedReturnValue();

    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "void BKSHIDEventDigitizerSetTouchRoutingPolicy(uint32_t, BKSHIDTouchRoutingPolicy *__strong _Nonnull)");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138544130;
      *(_QWORD *)v30 = v21;
      *(_WORD *)&v30[8] = 2114;
      v31 = CFSTR("BKSHIDEvent.m");
      v32 = 1024;
      v33 = 2149;
      v34 = 2114;
      v35 = v20;
      _os_log_error_impl(&dword_18A0F0000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "failure in %{public}@ (%{public}@:%i) : %{public}@", buf, 0x26u);

    }
    objc_msgSend(objc_retainAutorelease(v20), "UTF8String");
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x18A150C90);
  }
  v5 = v4;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    v22 = (void *)MEMORY[0x1E0CB3940];
    v23 = (objc_class *)objc_msgSend(v5, "classForCoder");
    if (!v23)
      v23 = (objc_class *)objc_opt_class();
    NSStringFromClass(v23);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v25 = (objc_class *)objc_opt_class();
    NSStringFromClass(v25);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "stringWithFormat:", CFSTR("Value for '%@' was of unexpected class %@. Expected %@."), CFSTR("policyForDetachedTouches"), v24, v26);
    v27 = (void *)objc_claimAutoreleasedReturnValue();

    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "void BKSHIDEventDigitizerSetTouchRoutingPolicy(uint32_t, BKSHIDTouchRoutingPolicy *__strong _Nonnull)");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138544130;
      *(_QWORD *)v30 = v28;
      *(_WORD *)&v30[8] = 2114;
      v31 = CFSTR("BKSHIDEvent.m");
      v32 = 1024;
      v33 = 2149;
      v34 = 2114;
      v35 = v27;
      _os_log_error_impl(&dword_18A0F0000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "failure in %{public}@ (%{public}@:%i) : %{public}@", buf, 0x26u);

    }
    objc_msgSend(objc_retainAutorelease(v27), "UTF8String");
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x18A150DA8);
  }

  objc_msgSend(MEMORY[0x1E0DE7910], "bs_secureDataFromObject:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v6)
  {
    BKLogCommon();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543618;
      *(_QWORD *)v30 = v5;
      *(_WORD *)&v30[8] = 1024;
      LODWORD(v31) = a1;
      v12 = "Error encoding policy: %{public}@ for touches with userIdentifier:%X";
      v13 = v11;
      v14 = 18;
      goto LABEL_12;
    }
LABEL_9:

    goto LABEL_10;
  }
  v7 = _BKSServerPortHelper("com.apple.backboard.hid.services", BKSHIDServerPort, &BKSHIDServerMachPort, (void (__cdecl *)(CFMachPortRef, void *))_InvalidateHIDServicesPort);
  v8 = objc_retainAutorelease(v6);
  v9 = _BKSHIDDigitizerTouchSetRoutingPolicy(v7, a1, objc_msgSend(v8, "bytes"), objc_msgSend(v8, "length"));
  if (v9)
  {
    v10 = v9;
    BKLogCommon();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 67109376;
      *(_DWORD *)v30 = v10;
      *(_WORD *)&v30[4] = 1024;
      *(_DWORD *)&v30[6] = a1;
      v12 = "Error setting touch routing policy:0x%X for touches with userIdentifier:%X";
      v13 = v11;
      v14 = 14;
LABEL_12:
      _os_log_error_impl(&dword_18A0F0000, v13, OS_LOG_TYPE_ERROR, v12, buf, v14);
      goto LABEL_9;
    }
    goto LABEL_9;
  }
LABEL_10:

}

void BKSHIDEventTransferTouchesToDifferentCAContext(void *a1, mach_port_name_t a2)
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint8_t *v7;
  uint64_t i;
  void *v9;
  mach_port_name_t v10;
  int v11;
  int v12;
  NSObject *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  uint8_t buf[4];
  void *v21;
  __int16 v22;
  const __CFString *v23;
  __int16 v24;
  int v25;
  __int16 v26;
  void *v27;
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v3 = a1;
  v4 = objc_msgSend(v3, "count");
  if (v4 <= 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("need more than zero identifiers"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "void BKSHIDEventTransferTouchesToDifferentCAContext(NSArray<NSNumber *> *__strong, uint32_t)");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138544130;
      v21 = v15;
      v22 = 2114;
      v23 = CFSTR("BKSHIDEvent.m");
      v24 = 1024;
      v25 = 2164;
      v26 = 2114;
      v27 = v14;
      _os_log_error_impl(&dword_18A0F0000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "failure in %{public}@ (%{public}@:%i) : %{public}@", buf, 0x26u);

    }
    objc_msgSend(objc_retainAutorelease(v14), "UTF8String");
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x18A150FF0);
  }
  v5 = v4;
  if ((unint64_t)v4 >= 0x20)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("need less than 32 identifiers"));
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "void BKSHIDEventTransferTouchesToDifferentCAContext(NSArray<NSNumber *> *__strong, uint32_t)");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138544130;
      v21 = v17;
      v22 = 2114;
      v23 = CFSTR("BKSHIDEvent.m");
      v24 = 1024;
      v25 = 2165;
      v26 = 2114;
      v27 = v16;
      _os_log_error_impl(&dword_18A0F0000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "failure in %{public}@ (%{public}@:%i) : %{public}@", buf, 0x26u);

    }
    objc_msgSend(objc_retainAutorelease(v16), "UTF8String");
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x18A1510B8);
  }
  if (!a2)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("need nonzero contextID"));
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "void BKSHIDEventTransferTouchesToDifferentCAContext(NSArray<NSNumber *> *__strong, uint32_t)");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138544130;
      v21 = v19;
      v22 = 2114;
      v23 = CFSTR("BKSHIDEvent.m");
      v24 = 1024;
      v25 = 2166;
      v26 = 2114;
      v27 = v18;
      _os_log_error_impl(&dword_18A0F0000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "failure in %{public}@ (%{public}@:%i) : %{public}@", buf, 0x26u);

    }
    objc_msgSend(objc_retainAutorelease(v18), "UTF8String");
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x18A151180);
  }
  MEMORY[0x1E0C80A78]();
  v7 = &buf[-((v6 + 15) & 0xFFFFFFFFFFFFFFF0)];
  for (i = 0; i != v5; ++i)
  {
    objc_msgSend(v3, "objectAtIndex:", i);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)&v7[4 * i] = objc_msgSend(v9, "unsignedIntValue");

  }
  v10 = _BKSServerPortHelper("com.apple.backboard.hid.services", BKSHIDServerPort, &BKSHIDServerMachPort, (void (__cdecl *)(CFMachPortRef, void *))_InvalidateHIDServicesPort);
  v11 = _BKSHIDTouchTransfer(v10, (uint64_t)v7, v5, a2);
  if (v11)
  {
    v12 = v11;
    BKLogCommon();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 67109120;
      LODWORD(v21) = v12;
      _os_log_error_impl(&dword_18A0F0000, v13, OS_LOG_TYPE_ERROR, "Error transferring touches: 0x%X", buf, 8u);
    }

  }
}

uint64_t _BKSHIDGetBacklightFactor(int a1, _DWORD *a2)
{
  mach_port_name_t special_reply_port;
  uint64_t v5;
  uint64_t v6;
  BOOL v7;
  int v9;
  int rcv_name;
  int rcv_name_4;
  mach_port_name_t rcv_name_8;
  _BYTE rcv_name_12[32];

  memset(&rcv_name_12[4], 0, 28);
  rcv_name = 0;
  special_reply_port = mig_get_special_reply_port();
  rcv_name_4 = a1;
  rcv_name_8 = special_reply_port;
  v9 = 5395;
  *(_QWORD *)rcv_name_12 = 0x5B8D8000000000;
  if (MEMORY[0x1E0C85B60])
  {
    voucher_mach_msg_set((mach_msg_header_t *)&v9);
    special_reply_port = rcv_name_8;
  }
  v5 = mach_msg((mach_msg_header_t *)&v9, 3162115, 0x18u, 0x30u, special_reply_port, 0, 0);
  v6 = v5;
  if ((v5 - 268435458) > 0xE || ((1 << (v5 - 2)) & 0x4003) == 0)
  {
    if (!(_DWORD)v5)
    {
      if (*(_DWORD *)&rcv_name_12[4] == 71)
      {
        v6 = 4294966988;
      }
      else if (*(_DWORD *)&rcv_name_12[4] == 6000100)
      {
        if ((v9 & 0x80000000) == 0)
        {
          if (rcv_name == 40)
          {
            if (!rcv_name_4)
            {
              v6 = *(unsigned int *)&rcv_name_12[16];
              if (!*(_DWORD *)&rcv_name_12[16])
              {
                *a2 = *(_DWORD *)&rcv_name_12[20];
                return v6;
              }
              goto LABEL_25;
            }
          }
          else if (rcv_name == 36)
          {
            if (rcv_name_4)
              v7 = 1;
            else
              v7 = *(_DWORD *)&rcv_name_12[16] == 0;
            if (v7)
              v6 = 4294966996;
            else
              v6 = *(unsigned int *)&rcv_name_12[16];
            goto LABEL_25;
          }
        }
        v6 = 4294966996;
      }
      else
      {
        v6 = 4294966995;
      }
LABEL_25:
      mach_msg_destroy((mach_msg_header_t *)&v9);
      return v6;
    }
    mig_dealloc_special_reply_port();
  }
  if ((v6 - 268435459) <= 1)
  {
    if ((v9 & 0x1F00) == 0x1100)
      mach_port_deallocate(*MEMORY[0x1E0C83DA0], rcv_name_8);
    goto LABEL_25;
  }
  return v6;
}

uint64_t _BKSHIDSetBacklightFactorPending(mach_port_t a1, float a2)
{
  uint64_t v2;
  mach_msg_header_t msg;
  uint64_t v5;
  float v6;

  v5 = *MEMORY[0x1E0C804E8];
  v6 = a2;
  *(_QWORD *)&msg.msgh_bits = 19;
  msg.msgh_voucher_port = 0;
  msg.msgh_id = 6000001;
  msg.msgh_remote_port = a1;
  msg.msgh_local_port = 0;
  if (MEMORY[0x1E0C85B60])
    voucher_mach_msg_set(&msg);
  v2 = mach_msg(&msg, 1, 0x24u, 0, 0, 0, 0);
  if ((v2 - 268435459) <= 1)
  {
    if ((msg.msgh_bits & 0x1F00) == 0x1100)
      mach_port_deallocate(*MEMORY[0x1E0C83DA0], msg.msgh_local_port);
    mach_msg_destroy(&msg);
  }
  return v2;
}

uint64_t _BKSHIDSetBacklightFactorWithFadeDuration(mach_port_t a1, char a2, char a3, float a4, float a5)
{
  mach_port_t special_reply_port;
  uint64_t v7;
  uint64_t v8;
  mach_msg_header_t v10;
  uint64_t v11;
  float v12;
  float v13;
  char v14;
  __int16 v15;
  char v16;
  char v17;
  __int16 v18;
  char v19;

  v12 = a4;
  v11 = *MEMORY[0x1E0C804E8];
  v13 = a5;
  v14 = a2;
  v15 = 0;
  v16 = 0;
  v17 = a3;
  v18 = 0;
  v19 = 0;
  special_reply_port = mig_get_special_reply_port();
  *(_QWORD *)&v10.msgh_bits = 5395;
  v10.msgh_remote_port = a1;
  v10.msgh_local_port = special_reply_port;
  *(_QWORD *)&v10.msgh_voucher_port = 0x5B8D8200000000;
  if (MEMORY[0x1E0C85B60])
  {
    voucher_mach_msg_set(&v10);
    special_reply_port = v10.msgh_local_port;
  }
  v7 = mach_msg(&v10, 3162115, 0x30u, 0x2Cu, special_reply_port, 0, 0);
  v8 = v7;
  if ((v7 - 268435458) <= 0xE && ((1 << (v7 - 2)) & 0x4003) != 0)
    goto LABEL_13;
  if ((_DWORD)v7)
  {
    mig_dealloc_special_reply_port();
LABEL_13:
    if ((v8 - 268435459) > 1)
      return v8;
    if ((v10.msgh_bits & 0x1F00) == 0x1100)
      mach_port_deallocate(*MEMORY[0x1E0C83DA0], v10.msgh_local_port);
LABEL_18:
    mach_msg_destroy(&v10);
    return v8;
  }
  if (v10.msgh_id == 71)
  {
    v8 = 4294966988;
    goto LABEL_18;
  }
  if (v10.msgh_id != 6000102)
  {
    v8 = 4294966995;
    goto LABEL_18;
  }
  v8 = 4294966996;
  if ((v10.msgh_bits & 0x80000000) != 0)
    goto LABEL_18;
  if (*(_QWORD *)&v10.msgh_size != 36)
    goto LABEL_18;
  v8 = LODWORD(v12);
  if (v12 != 0.0)
    goto LABEL_18;
  return v8;
}

uint64_t _BKSHIDNotifySetBacklightFactorWithFadeDurationAsync(mach_port_t a1, char a2, char a3, char a4, float a5, float a6)
{
  uint64_t v6;
  mach_msg_header_t msg;
  uint64_t v9;
  float v10;
  float v11;
  char v12;
  __int16 v13;
  char v14;
  char v15;
  __int16 v16;
  char v17;
  char v18;
  __int16 v19;
  char v20;

  v9 = *MEMORY[0x1E0C804E8];
  v10 = a5;
  v11 = a6;
  v12 = a2;
  v13 = 0;
  v14 = 0;
  v15 = a3;
  v16 = 0;
  v17 = 0;
  v18 = a4;
  v19 = 0;
  v20 = 0;
  *(_QWORD *)&msg.msgh_bits = 19;
  msg.msgh_voucher_port = 0;
  msg.msgh_id = 6000003;
  msg.msgh_remote_port = a1;
  msg.msgh_local_port = 0;
  if (MEMORY[0x1E0C85B60])
    voucher_mach_msg_set(&msg);
  v6 = mach_msg(&msg, 1, 0x34u, 0, 0, 0, 0);
  if ((v6 - 268435459) <= 1)
  {
    if ((msg.msgh_bits & 0x1F00) == 0x1100)
      mach_port_deallocate(*MEMORY[0x1E0C83DA0], msg.msgh_local_port);
    mach_msg_destroy(&msg);
  }
  return v6;
}

uint64_t _BKSHIDBrigthnessIsAutoBrightnessAvailable(int a1, _BYTE *a2)
{
  mach_port_name_t special_reply_port;
  uint64_t v5;
  uint64_t v6;
  BOOL v7;
  int v9;
  int rcv_name;
  int rcv_name_4;
  mach_port_name_t rcv_name_8;
  _BYTE rcv_name_12[32];

  memset(&rcv_name_12[4], 0, 28);
  rcv_name = 0;
  special_reply_port = mig_get_special_reply_port();
  rcv_name_4 = a1;
  rcv_name_8 = special_reply_port;
  v9 = 5395;
  *(_QWORD *)rcv_name_12 = 0x5B8D8500000000;
  if (MEMORY[0x1E0C85B60])
  {
    voucher_mach_msg_set((mach_msg_header_t *)&v9);
    special_reply_port = rcv_name_8;
  }
  v5 = mach_msg((mach_msg_header_t *)&v9, 3162115, 0x18u, 0x30u, special_reply_port, 0, 0);
  v6 = v5;
  if ((v5 - 268435458) > 0xE || ((1 << (v5 - 2)) & 0x4003) == 0)
  {
    if (!(_DWORD)v5)
    {
      if (*(_DWORD *)&rcv_name_12[4] == 71)
      {
        v6 = 4294966988;
      }
      else if (*(_DWORD *)&rcv_name_12[4] == 6000105)
      {
        if ((v9 & 0x80000000) == 0)
        {
          if (rcv_name == 40)
          {
            if (!rcv_name_4)
            {
              v6 = *(unsigned int *)&rcv_name_12[16];
              if (!*(_DWORD *)&rcv_name_12[16])
              {
                *a2 = rcv_name_12[20];
                return v6;
              }
              goto LABEL_25;
            }
          }
          else if (rcv_name == 36)
          {
            if (rcv_name_4)
              v7 = 1;
            else
              v7 = *(_DWORD *)&rcv_name_12[16] == 0;
            if (v7)
              v6 = 4294966996;
            else
              v6 = *(unsigned int *)&rcv_name_12[16];
            goto LABEL_25;
          }
        }
        v6 = 4294966996;
      }
      else
      {
        v6 = 4294966995;
      }
LABEL_25:
      mach_msg_destroy((mach_msg_header_t *)&v9);
      return v6;
    }
    mig_dealloc_special_reply_port();
  }
  if ((v6 - 268435459) <= 1)
  {
    if ((v9 & 0x1F00) == 0x1100)
      mach_port_deallocate(*MEMORY[0x1E0C83DA0], rcv_name_8);
    goto LABEL_25;
  }
  return v6;
}

uint64_t _BKSHIDBrigthnessIsBrightnessLevelControlAvailable(int a1, _BYTE *a2)
{
  mach_port_name_t special_reply_port;
  uint64_t v5;
  uint64_t v6;
  BOOL v7;
  int v9;
  int rcv_name;
  int rcv_name_4;
  mach_port_name_t rcv_name_8;
  _BYTE rcv_name_12[32];

  memset(&rcv_name_12[4], 0, 28);
  rcv_name = 0;
  special_reply_port = mig_get_special_reply_port();
  rcv_name_4 = a1;
  rcv_name_8 = special_reply_port;
  v9 = 5395;
  *(_QWORD *)rcv_name_12 = 0x5B8D8600000000;
  if (MEMORY[0x1E0C85B60])
  {
    voucher_mach_msg_set((mach_msg_header_t *)&v9);
    special_reply_port = rcv_name_8;
  }
  v5 = mach_msg((mach_msg_header_t *)&v9, 3162115, 0x18u, 0x30u, special_reply_port, 0, 0);
  v6 = v5;
  if ((v5 - 268435458) > 0xE || ((1 << (v5 - 2)) & 0x4003) == 0)
  {
    if (!(_DWORD)v5)
    {
      if (*(_DWORD *)&rcv_name_12[4] == 71)
      {
        v6 = 4294966988;
      }
      else if (*(_DWORD *)&rcv_name_12[4] == 6000106)
      {
        if ((v9 & 0x80000000) == 0)
        {
          if (rcv_name == 40)
          {
            if (!rcv_name_4)
            {
              v6 = *(unsigned int *)&rcv_name_12[16];
              if (!*(_DWORD *)&rcv_name_12[16])
              {
                *a2 = rcv_name_12[20];
                return v6;
              }
              goto LABEL_25;
            }
          }
          else if (rcv_name == 36)
          {
            if (rcv_name_4)
              v7 = 1;
            else
              v7 = *(_DWORD *)&rcv_name_12[16] == 0;
            if (v7)
              v6 = 4294966996;
            else
              v6 = *(unsigned int *)&rcv_name_12[16];
            goto LABEL_25;
          }
        }
        v6 = 4294966996;
      }
      else
      {
        v6 = 4294966995;
      }
LABEL_25:
      mach_msg_destroy((mach_msg_header_t *)&v9);
      return v6;
    }
    mig_dealloc_special_reply_port();
  }
  if ((v6 - 268435459) <= 1)
  {
    if ((v9 & 0x1F00) == 0x1100)
      mach_port_deallocate(*MEMORY[0x1E0C83DA0], rcv_name_8);
    goto LABEL_25;
  }
  return v6;
}

uint64_t _BKSHIDGetDeviceBacklightArchitectureVersion(int a1, _BYTE *a2)
{
  mach_port_name_t special_reply_port;
  uint64_t v5;
  uint64_t v6;
  BOOL v7;
  int v9;
  int rcv_name;
  int rcv_name_4;
  mach_port_name_t rcv_name_8;
  _BYTE rcv_name_12[32];

  memset(&rcv_name_12[4], 0, 28);
  rcv_name = 0;
  special_reply_port = mig_get_special_reply_port();
  rcv_name_4 = a1;
  rcv_name_8 = special_reply_port;
  v9 = 5395;
  *(_QWORD *)rcv_name_12 = 0x5B8D8700000000;
  if (MEMORY[0x1E0C85B60])
  {
    voucher_mach_msg_set((mach_msg_header_t *)&v9);
    special_reply_port = rcv_name_8;
  }
  v5 = mach_msg((mach_msg_header_t *)&v9, 3162115, 0x18u, 0x30u, special_reply_port, 0, 0);
  v6 = v5;
  if ((v5 - 268435458) > 0xE || ((1 << (v5 - 2)) & 0x4003) == 0)
  {
    if (!(_DWORD)v5)
    {
      if (*(_DWORD *)&rcv_name_12[4] == 71)
      {
        v6 = 4294966988;
      }
      else if (*(_DWORD *)&rcv_name_12[4] == 6000107)
      {
        if ((v9 & 0x80000000) == 0)
        {
          if (rcv_name == 40)
          {
            if (!rcv_name_4)
            {
              v6 = *(unsigned int *)&rcv_name_12[16];
              if (!*(_DWORD *)&rcv_name_12[16])
              {
                *a2 = rcv_name_12[20];
                return v6;
              }
              goto LABEL_25;
            }
          }
          else if (rcv_name == 36)
          {
            if (rcv_name_4)
              v7 = 1;
            else
              v7 = *(_DWORD *)&rcv_name_12[16] == 0;
            if (v7)
              v6 = 4294966996;
            else
              v6 = *(unsigned int *)&rcv_name_12[16];
            goto LABEL_25;
          }
        }
        v6 = 4294966996;
      }
      else
      {
        v6 = 4294966995;
      }
LABEL_25:
      mach_msg_destroy((mach_msg_header_t *)&v9);
      return v6;
    }
    mig_dealloc_special_reply_port();
  }
  if ((v6 - 268435459) <= 1)
  {
    if ((v9 & 0x1F00) == 0x1100)
      mach_port_deallocate(*MEMORY[0x1E0C83DA0], rcv_name_8);
    goto LABEL_25;
  }
  return v6;
}

uint64_t _BKSHIDSetBacklightFeatures(int a1, uint64_t a2, int a3)
{
  uint64_t v3;
  _BYTE msg[28];
  uint64_t v6;
  int v7;
  int v8;
  uint64_t v9;
  int v10;

  v6 = a2;
  v7 = 16777472;
  v8 = a3;
  v9 = *MEMORY[0x1E0C804E8];
  v10 = a3;
  *(_QWORD *)msg = 2147483667;
  *(_DWORD *)&msg[8] = a1;
  *(_OWORD *)&msg[12] = xmmword_18A1613F0;
  if (MEMORY[0x1E0C85B60])
    voucher_mach_msg_set((mach_msg_header_t *)msg);
  v3 = mach_msg((mach_msg_header_t *)msg, 1, 0x38u, 0, 0, 0, 0);
  if ((v3 - 268435459) <= 1)
  {
    if ((*(_WORD *)msg & 0x1F00) == 0x1100)
      mach_port_deallocate(*MEMORY[0x1E0C83DA0], *(mach_port_name_t *)&msg[12]);
    mach_msg_destroy((mach_msg_header_t *)msg);
  }
  return v3;
}

uint64_t _BKSHIDAmbientLightSensorExists(int a1, _BYTE *a2)
{
  mach_port_name_t special_reply_port;
  uint64_t v5;
  uint64_t v6;
  BOOL v7;
  int v9;
  int rcv_name;
  int rcv_name_4;
  mach_port_name_t rcv_name_8;
  _BYTE rcv_name_12[32];

  memset(&rcv_name_12[4], 0, 28);
  rcv_name = 0;
  special_reply_port = mig_get_special_reply_port();
  rcv_name_4 = a1;
  rcv_name_8 = special_reply_port;
  v9 = 5395;
  *(_QWORD *)rcv_name_12 = 0x5B8D8900000000;
  if (MEMORY[0x1E0C85B60])
  {
    voucher_mach_msg_set((mach_msg_header_t *)&v9);
    special_reply_port = rcv_name_8;
  }
  v5 = mach_msg((mach_msg_header_t *)&v9, 3162115, 0x18u, 0x30u, special_reply_port, 0, 0);
  v6 = v5;
  if ((v5 - 268435458) > 0xE || ((1 << (v5 - 2)) & 0x4003) == 0)
  {
    if (!(_DWORD)v5)
    {
      if (*(_DWORD *)&rcv_name_12[4] == 71)
      {
        v6 = 4294966988;
      }
      else if (*(_DWORD *)&rcv_name_12[4] == 6000109)
      {
        if ((v9 & 0x80000000) == 0)
        {
          if (rcv_name == 40)
          {
            if (!rcv_name_4)
            {
              v6 = *(unsigned int *)&rcv_name_12[16];
              if (!*(_DWORD *)&rcv_name_12[16])
              {
                *a2 = rcv_name_12[20];
                return v6;
              }
              goto LABEL_25;
            }
          }
          else if (rcv_name == 36)
          {
            if (rcv_name_4)
              v7 = 1;
            else
              v7 = *(_DWORD *)&rcv_name_12[16] == 0;
            if (v7)
              v6 = 4294966996;
            else
              v6 = *(unsigned int *)&rcv_name_12[16];
            goto LABEL_25;
          }
        }
        v6 = 4294966996;
      }
      else
      {
        v6 = 4294966995;
      }
LABEL_25:
      mach_msg_destroy((mach_msg_header_t *)&v9);
      return v6;
    }
    mig_dealloc_special_reply_port();
  }
  if ((v6 - 268435459) <= 1)
  {
    if ((v9 & 0x1F00) == 0x1100)
      mach_port_deallocate(*MEMORY[0x1E0C83DA0], rcv_name_8);
    goto LABEL_25;
  }
  return v6;
}

uint64_t _BKSHIDAmbientLightSensorDisableAutoBrightness(mach_port_t a1)
{
  uint64_t v1;
  mach_msg_header_t msg;

  msg.msgh_size = 0;
  msg.msgh_bits = 19;
  msg.msgh_remote_port = a1;
  msg.msgh_local_port = 0;
  *(_QWORD *)&msg.msgh_voucher_port = 0x5B8D8A00000000;
  if (MEMORY[0x1E0C85B60])
    voucher_mach_msg_set(&msg);
  v1 = mach_msg(&msg, 1, 0x18u, 0, 0, 0, 0);
  if ((v1 - 268435459) <= 1)
  {
    if ((msg.msgh_bits & 0x1F00) == 0x1100)
      mach_port_deallocate(*MEMORY[0x1E0C83DA0], msg.msgh_local_port);
    mach_msg_destroy(&msg);
  }
  return v1;
}

uint64_t _BKSHIDAmbientLightSensorEnableAutoBrightness(mach_port_t a1, char a2)
{
  uint64_t v2;
  mach_msg_header_t msg;
  uint64_t v5;
  char v6;
  __int16 v7;
  char v8;

  v5 = *MEMORY[0x1E0C804E8];
  v6 = a2;
  v7 = 0;
  v8 = 0;
  *(_QWORD *)&msg.msgh_bits = 19;
  msg.msgh_voucher_port = 0;
  msg.msgh_id = 6000011;
  msg.msgh_remote_port = a1;
  msg.msgh_local_port = 0;
  if (MEMORY[0x1E0C85B60])
    voucher_mach_msg_set(&msg);
  v2 = mach_msg(&msg, 1, 0x24u, 0, 0, 0, 0);
  if ((v2 - 268435459) <= 1)
  {
    if ((msg.msgh_bits & 0x1F00) == 0x1100)
      mach_port_deallocate(*MEMORY[0x1E0C83DA0], msg.msgh_local_port);
    mach_msg_destroy(&msg);
  }
  return v2;
}

uint64_t _BKSHIDSetDeviceOrientationForAutomation(mach_port_t a1, char a2)
{
  uint64_t v2;
  mach_msg_header_t msg;
  uint64_t v5;
  char v6;
  __int16 v7;
  char v8;

  v5 = *MEMORY[0x1E0C804E8];
  v6 = a2;
  v7 = 0;
  v8 = 0;
  *(_QWORD *)&msg.msgh_bits = 19;
  msg.msgh_voucher_port = 0;
  msg.msgh_id = 6000013;
  msg.msgh_remote_port = a1;
  msg.msgh_local_port = 0;
  if (MEMORY[0x1E0C85B60])
    voucher_mach_msg_set(&msg);
  v2 = mach_msg(&msg, 1, 0x24u, 0, 0, 0, 0);
  if ((v2 - 268435459) <= 1)
  {
    if ((msg.msgh_bits & 0x1F00) == 0x1100)
      mach_port_deallocate(*MEMORY[0x1E0C83DA0], msg.msgh_local_port);
    mach_msg_destroy(&msg);
  }
  return v2;
}

uint64_t _BKSHIDRequestEstimatedProximityEvents(int a1, _DWORD *a2, float a3)
{
  mach_port_name_t special_reply_port;
  uint64_t v6;
  uint64_t v7;
  BOOL v8;
  int v10;
  _BYTE rcv_name[44];

  memset(&rcv_name[16], 0, 28);
  *(_OWORD *)rcv_name = 0u;
  *(_QWORD *)&rcv_name[20] = *MEMORY[0x1E0C804E8];
  *(float *)&rcv_name[28] = a3;
  special_reply_port = mig_get_special_reply_port();
  *(_DWORD *)&rcv_name[4] = a1;
  *(_DWORD *)&rcv_name[8] = special_reply_port;
  v10 = 5395;
  *(_QWORD *)&rcv_name[12] = 0x5B8D8E00000000;
  if (MEMORY[0x1E0C85B60])
  {
    voucher_mach_msg_set((mach_msg_header_t *)&v10);
    special_reply_port = *(_DWORD *)&rcv_name[8];
  }
  v6 = mach_msg((mach_msg_header_t *)&v10, 3162115, 0x24u, 0x30u, special_reply_port, 0, 0);
  v7 = v6;
  if ((v6 - 268435458) > 0xE || ((1 << (v6 - 2)) & 0x4003) == 0)
  {
    if (!(_DWORD)v6)
    {
      if (*(_DWORD *)&rcv_name[16] == 71)
      {
        v7 = 4294966988;
      }
      else if (*(_DWORD *)&rcv_name[16] == 6000114)
      {
        if ((v10 & 0x80000000) == 0)
        {
          if (*(_DWORD *)rcv_name == 40)
          {
            if (!*(_DWORD *)&rcv_name[4])
            {
              v7 = *(unsigned int *)&rcv_name[28];
              if (!*(_DWORD *)&rcv_name[28])
              {
                *a2 = *(_DWORD *)&rcv_name[32];
                return v7;
              }
              goto LABEL_25;
            }
          }
          else if (*(_DWORD *)rcv_name == 36)
          {
            if (*(_DWORD *)&rcv_name[4])
              v8 = 1;
            else
              v8 = *(_DWORD *)&rcv_name[28] == 0;
            if (v8)
              v7 = 4294966996;
            else
              v7 = *(unsigned int *)&rcv_name[28];
            goto LABEL_25;
          }
        }
        v7 = 4294966996;
      }
      else
      {
        v7 = 4294966995;
      }
LABEL_25:
      mach_msg_destroy((mach_msg_header_t *)&v10);
      return v7;
    }
    mig_dealloc_special_reply_port();
  }
  if ((v7 - 268435459) <= 1)
  {
    if ((v10 & 0x1F00) == 0x1100)
      mach_port_deallocate(*MEMORY[0x1E0C83DA0], *(mach_port_name_t *)&rcv_name[8]);
    goto LABEL_25;
  }
  return v7;
}

uint64_t _BKSHIDRequestProximityStatusEvent(mach_port_name_t a1, const char *a2)
{
  int v3;
  mach_msg_size_t v4;
  uint64_t v5;
  mach_port_name_t name[4];
  __int128 v8;
  _OWORD v9[64];
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  memset(v9, 0, 480);
  *(_OWORD *)name = 0u;
  v8 = 0u;
  *((_QWORD *)&v8 + 1) = *MEMORY[0x1E0C804E8];
  if (MEMORY[0x1E0C84128])
    v3 = mig_strncpy_zerofill((char *)v9 + 8, a2, 1024);
  else
    v3 = mig_strncpy((char *)v9 + 8, a2, 1024);
  LODWORD(v9[0]) = 0;
  DWORD1(v9[0]) = v3;
  v4 = ((v3 + 3) & 0xFFFFFFFC) + 40;
  name[0] = 19;
  name[2] = a1;
  name[3] = 0;
  *(_QWORD *)&v8 = 0x5B8D8F00000000;
  if (MEMORY[0x1E0C85B60])
    voucher_mach_msg_set((mach_msg_header_t *)name);
  v5 = mach_msg((mach_msg_header_t *)name, 1, v4, 0, 0, 0, 0);
  if ((v5 - 268435459) <= 1)
  {
    if ((name[0] & 0x1F00) == 0x1100)
      mach_port_deallocate(*MEMORY[0x1E0C83DA0], name[3]);
    mach_msg_destroy((mach_msg_header_t *)name);
  }
  return v5;
}

uint64_t _BKSHIDResetProximityCalibration(mach_port_t a1)
{
  uint64_t v1;
  mach_msg_header_t msg;

  msg.msgh_size = 0;
  msg.msgh_bits = 19;
  msg.msgh_remote_port = a1;
  msg.msgh_local_port = 0;
  *(_QWORD *)&msg.msgh_voucher_port = 0x5B8D9000000000;
  if (MEMORY[0x1E0C85B60])
    voucher_mach_msg_set(&msg);
  v1 = mach_msg(&msg, 1, 0x18u, 0, 0, 0, 0);
  if ((v1 - 268435459) <= 1)
  {
    if ((msg.msgh_bits & 0x1F00) == 0x1100)
      mach_port_deallocate(*MEMORY[0x1E0C83DA0], msg.msgh_local_port);
    mach_msg_destroy(&msg);
  }
  return v1;
}

uint64_t _BKSHIDGetObjectWithinProximity(int a1, _BYTE *a2)
{
  mach_port_name_t special_reply_port;
  uint64_t v5;
  uint64_t v6;
  BOOL v7;
  int v9;
  int rcv_name;
  int rcv_name_4;
  mach_port_name_t rcv_name_8;
  _BYTE rcv_name_12[32];

  memset(&rcv_name_12[4], 0, 28);
  rcv_name = 0;
  special_reply_port = mig_get_special_reply_port();
  rcv_name_4 = a1;
  rcv_name_8 = special_reply_port;
  v9 = 5395;
  *(_QWORD *)rcv_name_12 = 0x5B8D9100000000;
  if (MEMORY[0x1E0C85B60])
  {
    voucher_mach_msg_set((mach_msg_header_t *)&v9);
    special_reply_port = rcv_name_8;
  }
  v5 = mach_msg((mach_msg_header_t *)&v9, 3162115, 0x18u, 0x30u, special_reply_port, 0, 0);
  v6 = v5;
  if ((v5 - 268435458) > 0xE || ((1 << (v5 - 2)) & 0x4003) == 0)
  {
    if (!(_DWORD)v5)
    {
      if (*(_DWORD *)&rcv_name_12[4] == 71)
      {
        v6 = 4294966988;
      }
      else if (*(_DWORD *)&rcv_name_12[4] == 6000117)
      {
        if ((v9 & 0x80000000) == 0)
        {
          if (rcv_name == 40)
          {
            if (!rcv_name_4)
            {
              v6 = *(unsigned int *)&rcv_name_12[16];
              if (!*(_DWORD *)&rcv_name_12[16])
              {
                *a2 = rcv_name_12[20];
                return v6;
              }
              goto LABEL_25;
            }
          }
          else if (rcv_name == 36)
          {
            if (rcv_name_4)
              v7 = 1;
            else
              v7 = *(_DWORD *)&rcv_name_12[16] == 0;
            if (v7)
              v6 = 4294966996;
            else
              v6 = *(unsigned int *)&rcv_name_12[16];
            goto LABEL_25;
          }
        }
        v6 = 4294966996;
      }
      else
      {
        v6 = 4294966995;
      }
LABEL_25:
      mach_msg_destroy((mach_msg_header_t *)&v9);
      return v6;
    }
    mig_dealloc_special_reply_port();
  }
  if ((v6 - 268435459) <= 1)
  {
    if ((v9 & 0x1F00) == 0x1100)
      mach_port_deallocate(*MEMORY[0x1E0C83DA0], rcv_name_8);
    goto LABEL_25;
  }
  return v6;
}

uint64_t _BKSHIDGetProximityDetectionActive(int a1, _BYTE *a2)
{
  mach_port_name_t special_reply_port;
  uint64_t v5;
  uint64_t v6;
  BOOL v7;
  int v9;
  int rcv_name;
  int rcv_name_4;
  mach_port_name_t rcv_name_8;
  _BYTE rcv_name_12[32];

  memset(&rcv_name_12[4], 0, 28);
  rcv_name = 0;
  special_reply_port = mig_get_special_reply_port();
  rcv_name_4 = a1;
  rcv_name_8 = special_reply_port;
  v9 = 5395;
  *(_QWORD *)rcv_name_12 = 0x5B8D9200000000;
  if (MEMORY[0x1E0C85B60])
  {
    voucher_mach_msg_set((mach_msg_header_t *)&v9);
    special_reply_port = rcv_name_8;
  }
  v5 = mach_msg((mach_msg_header_t *)&v9, 3162115, 0x18u, 0x30u, special_reply_port, 0, 0);
  v6 = v5;
  if ((v5 - 268435458) > 0xE || ((1 << (v5 - 2)) & 0x4003) == 0)
  {
    if (!(_DWORD)v5)
    {
      if (*(_DWORD *)&rcv_name_12[4] == 71)
      {
        v6 = 4294966988;
      }
      else if (*(_DWORD *)&rcv_name_12[4] == 6000118)
      {
        if ((v9 & 0x80000000) == 0)
        {
          if (rcv_name == 40)
          {
            if (!rcv_name_4)
            {
              v6 = *(unsigned int *)&rcv_name_12[16];
              if (!*(_DWORD *)&rcv_name_12[16])
              {
                *a2 = rcv_name_12[20];
                return v6;
              }
              goto LABEL_25;
            }
          }
          else if (rcv_name == 36)
          {
            if (rcv_name_4)
              v7 = 1;
            else
              v7 = *(_DWORD *)&rcv_name_12[16] == 0;
            if (v7)
              v6 = 4294966996;
            else
              v6 = *(unsigned int *)&rcv_name_12[16];
            goto LABEL_25;
          }
        }
        v6 = 4294966996;
      }
      else
      {
        v6 = 4294966995;
      }
LABEL_25:
      mach_msg_destroy((mach_msg_header_t *)&v9);
      return v6;
    }
    mig_dealloc_special_reply_port();
  }
  if ((v6 - 268435459) <= 1)
  {
    if ((v9 & 0x1F00) == 0x1100)
      mach_port_deallocate(*MEMORY[0x1E0C83DA0], rcv_name_8);
    goto LABEL_25;
  }
  return v6;
}

uint64_t _BKSHIDGetObjectInProximityIgnoresTouches(int a1, _BYTE *a2)
{
  mach_port_name_t special_reply_port;
  uint64_t v5;
  uint64_t v6;
  BOOL v7;
  int v9;
  int rcv_name;
  int rcv_name_4;
  mach_port_name_t rcv_name_8;
  _BYTE rcv_name_12[32];

  memset(&rcv_name_12[4], 0, 28);
  rcv_name = 0;
  special_reply_port = mig_get_special_reply_port();
  rcv_name_4 = a1;
  rcv_name_8 = special_reply_port;
  v9 = 5395;
  *(_QWORD *)rcv_name_12 = 0x5B8D9300000000;
  if (MEMORY[0x1E0C85B60])
  {
    voucher_mach_msg_set((mach_msg_header_t *)&v9);
    special_reply_port = rcv_name_8;
  }
  v5 = mach_msg((mach_msg_header_t *)&v9, 3162115, 0x18u, 0x30u, special_reply_port, 0, 0);
  v6 = v5;
  if ((v5 - 268435458) > 0xE || ((1 << (v5 - 2)) & 0x4003) == 0)
  {
    if (!(_DWORD)v5)
    {
      if (*(_DWORD *)&rcv_name_12[4] == 71)
      {
        v6 = 4294966988;
      }
      else if (*(_DWORD *)&rcv_name_12[4] == 6000119)
      {
        if ((v9 & 0x80000000) == 0)
        {
          if (rcv_name == 40)
          {
            if (!rcv_name_4)
            {
              v6 = *(unsigned int *)&rcv_name_12[16];
              if (!*(_DWORD *)&rcv_name_12[16])
              {
                *a2 = rcv_name_12[20];
                return v6;
              }
              goto LABEL_25;
            }
          }
          else if (rcv_name == 36)
          {
            if (rcv_name_4)
              v7 = 1;
            else
              v7 = *(_DWORD *)&rcv_name_12[16] == 0;
            if (v7)
              v6 = 4294966996;
            else
              v6 = *(unsigned int *)&rcv_name_12[16];
            goto LABEL_25;
          }
        }
        v6 = 4294966996;
      }
      else
      {
        v6 = 4294966995;
      }
LABEL_25:
      mach_msg_destroy((mach_msg_header_t *)&v9);
      return v6;
    }
    mig_dealloc_special_reply_port();
  }
  if ((v6 - 268435459) <= 1)
  {
    if ((v9 & 0x1F00) == 0x1100)
      mach_port_deallocate(*MEMORY[0x1E0C83DA0], rcv_name_8);
    goto LABEL_25;
  }
  return v6;
}

uint64_t _BKSHIDSetObjectInProximityIgnoresTouches(mach_port_t a1, char a2)
{
  uint64_t v2;
  mach_msg_header_t msg;
  uint64_t v5;
  char v6;
  __int16 v7;
  char v8;

  v5 = *MEMORY[0x1E0C804E8];
  v6 = a2;
  v7 = 0;
  v8 = 0;
  *(_QWORD *)&msg.msgh_bits = 19;
  msg.msgh_voucher_port = 0;
  msg.msgh_id = 6000020;
  msg.msgh_remote_port = a1;
  msg.msgh_local_port = 0;
  if (MEMORY[0x1E0C85B60])
    voucher_mach_msg_set(&msg);
  v2 = mach_msg(&msg, 1, 0x24u, 0, 0, 0, 0);
  if ((v2 - 268435459) <= 1)
  {
    if ((msg.msgh_bits & 0x1F00) == 0x1100)
      mach_port_deallocate(*MEMORY[0x1E0C83DA0], msg.msgh_local_port);
    mach_msg_destroy(&msg);
  }
  return v2;
}

uint64_t _BKSHIDGetRingerState(int a1, _DWORD *a2)
{
  mach_port_name_t special_reply_port;
  uint64_t v5;
  uint64_t v6;
  BOOL v7;
  int v9;
  int rcv_name;
  int rcv_name_4;
  mach_port_name_t rcv_name_8;
  _BYTE rcv_name_12[32];

  memset(&rcv_name_12[4], 0, 28);
  rcv_name = 0;
  special_reply_port = mig_get_special_reply_port();
  rcv_name_4 = a1;
  rcv_name_8 = special_reply_port;
  v9 = 5395;
  *(_QWORD *)rcv_name_12 = 0x5B8D9500000000;
  if (MEMORY[0x1E0C85B60])
  {
    voucher_mach_msg_set((mach_msg_header_t *)&v9);
    special_reply_port = rcv_name_8;
  }
  v5 = mach_msg((mach_msg_header_t *)&v9, 3162115, 0x18u, 0x30u, special_reply_port, 0, 0);
  v6 = v5;
  if ((v5 - 268435458) > 0xE || ((1 << (v5 - 2)) & 0x4003) == 0)
  {
    if (!(_DWORD)v5)
    {
      if (*(_DWORD *)&rcv_name_12[4] == 71)
      {
        v6 = 4294966988;
      }
      else if (*(_DWORD *)&rcv_name_12[4] == 6000121)
      {
        if ((v9 & 0x80000000) == 0)
        {
          if (rcv_name == 40)
          {
            if (!rcv_name_4)
            {
              v6 = *(unsigned int *)&rcv_name_12[16];
              if (!*(_DWORD *)&rcv_name_12[16])
              {
                *a2 = *(_DWORD *)&rcv_name_12[20];
                return v6;
              }
              goto LABEL_25;
            }
          }
          else if (rcv_name == 36)
          {
            if (rcv_name_4)
              v7 = 1;
            else
              v7 = *(_DWORD *)&rcv_name_12[16] == 0;
            if (v7)
              v6 = 4294966996;
            else
              v6 = *(unsigned int *)&rcv_name_12[16];
            goto LABEL_25;
          }
        }
        v6 = 4294966996;
      }
      else
      {
        v6 = 4294966995;
      }
LABEL_25:
      mach_msg_destroy((mach_msg_header_t *)&v9);
      return v6;
    }
    mig_dealloc_special_reply_port();
  }
  if ((v6 - 268435459) <= 1)
  {
    if ((v9 & 0x1F00) == 0x1100)
      mach_port_deallocate(*MEMORY[0x1E0C83DA0], rcv_name_8);
    goto LABEL_25;
  }
  return v6;
}

uint64_t _BKSHIDIsSmartCoverClosed(int a1, _BYTE *a2)
{
  mach_port_name_t special_reply_port;
  uint64_t v5;
  uint64_t v6;
  BOOL v7;
  int v9;
  int rcv_name;
  int rcv_name_4;
  mach_port_name_t rcv_name_8;
  _BYTE rcv_name_12[32];

  memset(&rcv_name_12[4], 0, 28);
  rcv_name = 0;
  special_reply_port = mig_get_special_reply_port();
  rcv_name_4 = a1;
  rcv_name_8 = special_reply_port;
  v9 = 5395;
  *(_QWORD *)rcv_name_12 = 0x5B8D9600000000;
  if (MEMORY[0x1E0C85B60])
  {
    voucher_mach_msg_set((mach_msg_header_t *)&v9);
    special_reply_port = rcv_name_8;
  }
  v5 = mach_msg((mach_msg_header_t *)&v9, 3162115, 0x18u, 0x30u, special_reply_port, 0, 0);
  v6 = v5;
  if ((v5 - 268435458) > 0xE || ((1 << (v5 - 2)) & 0x4003) == 0)
  {
    if (!(_DWORD)v5)
    {
      if (*(_DWORD *)&rcv_name_12[4] == 71)
      {
        v6 = 4294966988;
      }
      else if (*(_DWORD *)&rcv_name_12[4] == 6000122)
      {
        if ((v9 & 0x80000000) == 0)
        {
          if (rcv_name == 40)
          {
            if (!rcv_name_4)
            {
              v6 = *(unsigned int *)&rcv_name_12[16];
              if (!*(_DWORD *)&rcv_name_12[16])
              {
                *a2 = rcv_name_12[20];
                return v6;
              }
              goto LABEL_25;
            }
          }
          else if (rcv_name == 36)
          {
            if (rcv_name_4)
              v7 = 1;
            else
              v7 = *(_DWORD *)&rcv_name_12[16] == 0;
            if (v7)
              v6 = 4294966996;
            else
              v6 = *(unsigned int *)&rcv_name_12[16];
            goto LABEL_25;
          }
        }
        v6 = 4294966996;
      }
      else
      {
        v6 = 4294966995;
      }
LABEL_25:
      mach_msg_destroy((mach_msg_header_t *)&v9);
      return v6;
    }
    mig_dealloc_special_reply_port();
  }
  if ((v6 - 268435459) <= 1)
  {
    if ((v9 & 0x1F00) == 0x1100)
      mach_port_deallocate(*MEMORY[0x1E0C83DA0], rcv_name_8);
    goto LABEL_25;
  }
  return v6;
}

uint64_t _BKSHIDCancelButtonEventsFromSenderID(mach_port_t a1, uint64_t a2, int a3, int a4)
{
  mach_port_t special_reply_port;
  uint64_t v6;
  uint64_t v7;
  mach_msg_header_t v9;
  uint64_t v10;
  uint64_t v11;
  int v12;
  int v13;

  v10 = *MEMORY[0x1E0C804E8];
  v11 = a2;
  v12 = a3;
  v13 = a4;
  special_reply_port = mig_get_special_reply_port();
  *(_QWORD *)&v9.msgh_bits = 5395;
  v9.msgh_remote_port = a1;
  v9.msgh_local_port = special_reply_port;
  *(_QWORD *)&v9.msgh_voucher_port = 0x5B8D9700000000;
  if (MEMORY[0x1E0C85B60])
  {
    voucher_mach_msg_set(&v9);
    special_reply_port = v9.msgh_local_port;
  }
  v6 = mach_msg(&v9, 3162115, 0x30u, 0x2Cu, special_reply_port, 0, 0);
  v7 = v6;
  if ((v6 - 268435458) <= 0xE && ((1 << (v6 - 2)) & 0x4003) != 0)
    goto LABEL_13;
  if ((_DWORD)v6)
  {
    mig_dealloc_special_reply_port();
LABEL_13:
    if ((v7 - 268435459) > 1)
      return v7;
    if ((v9.msgh_bits & 0x1F00) == 0x1100)
      mach_port_deallocate(*MEMORY[0x1E0C83DA0], v9.msgh_local_port);
LABEL_18:
    mach_msg_destroy(&v9);
    return v7;
  }
  if (v9.msgh_id == 71)
  {
    v7 = 4294966988;
    goto LABEL_18;
  }
  if (v9.msgh_id != 6000123)
  {
    v7 = 4294966995;
    goto LABEL_18;
  }
  v7 = 4294966996;
  if ((v9.msgh_bits & 0x80000000) != 0)
    goto LABEL_18;
  if (*(_QWORD *)&v9.msgh_size != 36)
    goto LABEL_18;
  v7 = v11;
  if ((_DWORD)v11)
    goto LABEL_18;
  return v7;
}

uint64_t _BKSHIDClaimGenericGestureFocus(mach_port_name_t a1, const char *a2, int a3)
{
  int v5;
  uint64_t v6;
  mach_msg_size_t v7;
  uint64_t v8;
  mach_port_name_t name[4];
  __int128 v11;
  _OWORD v12[65];
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  memset(v12, 0, 480);
  *(_OWORD *)name = 0u;
  v11 = 0u;
  *((_QWORD *)&v11 + 1) = *MEMORY[0x1E0C804E8];
  if (MEMORY[0x1E0C84128])
    v5 = mig_strncpy_zerofill((char *)v12 + 8, a2, 1024);
  else
    v5 = mig_strncpy((char *)v12 + 8, a2, 1024);
  LODWORD(v12[0]) = 0;
  DWORD1(v12[0]) = v5;
  v6 = (v5 + 3) & 0xFFFFFFFC;
  v7 = v6 + 44;
  *(_DWORD *)((char *)v12 + v6 + 8) = a3;
  name[0] = 19;
  name[2] = a1;
  name[3] = 0;
  *(_QWORD *)&v11 = 0x5B8D9800000000;
  if (MEMORY[0x1E0C85B60])
    voucher_mach_msg_set((mach_msg_header_t *)name);
  v8 = mach_msg((mach_msg_header_t *)name, 1, v7, 0, 0, 0, 0);
  if ((v8 - 268435459) <= 1)
  {
    if ((name[0] & 0x1F00) == 0x1100)
      mach_port_deallocate(*MEMORY[0x1E0C83DA0], name[3]);
    mach_msg_destroy((mach_msg_header_t *)name);
  }
  return v8;
}

uint64_t _BKSHIDCancelTouchesOnAllDisplays(mach_port_t a1)
{
  uint64_t v1;
  mach_msg_header_t msg;

  msg.msgh_size = 0;
  msg.msgh_bits = 19;
  msg.msgh_remote_port = a1;
  msg.msgh_local_port = 0;
  *(_QWORD *)&msg.msgh_voucher_port = 0x5B8D9A00000000;
  if (MEMORY[0x1E0C85B60])
    voucher_mach_msg_set(&msg);
  v1 = mach_msg(&msg, 1, 0x18u, 0, 0, 0, 0);
  if ((v1 - 268435459) <= 1)
  {
    if ((msg.msgh_bits & 0x1F00) == 0x1100)
      mach_port_deallocate(*MEMORY[0x1E0C83DA0], msg.msgh_local_port);
    mach_msg_destroy(&msg);
  }
  return v1;
}

uint64_t _BKSHIDCancelTouchesWithIdentifiers(int a1, uint64_t a2, int a3)
{
  uint64_t v3;
  _BYTE msg[28];
  uint64_t v6;
  int v7;
  int v8;
  uint64_t v9;
  int v10;

  v6 = a2;
  v7 = 16777472;
  v8 = a3;
  v9 = *MEMORY[0x1E0C804E8];
  v10 = a3;
  *(_QWORD *)msg = 2147483667;
  *(_DWORD *)&msg[8] = a1;
  *(_OWORD *)&msg[12] = xmmword_18A161400;
  if (MEMORY[0x1E0C85B60])
    voucher_mach_msg_set((mach_msg_header_t *)msg);
  v3 = mach_msg((mach_msg_header_t *)msg, 1, 0x38u, 0, 0, 0, 0);
  if ((v3 - 268435459) <= 1)
  {
    if ((*(_WORD *)msg & 0x1F00) == 0x1100)
      mach_port_deallocate(*MEMORY[0x1E0C83DA0], *(mach_port_name_t *)&msg[12]);
    mach_msg_destroy((mach_msg_header_t *)msg);
  }
  return v3;
}

uint64_t _BKSHIDExcludeCAContextsFromHitTestingForZoomSenders(int a1, uint64_t a2, int a3)
{
  uint64_t v3;
  _BYTE msg[28];
  uint64_t v6;
  int v7;
  int v8;
  uint64_t v9;
  int v10;

  v6 = a2;
  v7 = 16777472;
  v8 = a3;
  v9 = *MEMORY[0x1E0C804E8];
  v10 = a3;
  *(_QWORD *)msg = 2147483667;
  *(_DWORD *)&msg[8] = a1;
  *(_OWORD *)&msg[12] = xmmword_18A161410;
  if (MEMORY[0x1E0C85B60])
    voucher_mach_msg_set((mach_msg_header_t *)msg);
  v3 = mach_msg((mach_msg_header_t *)msg, 1, 0x38u, 0, 0, 0, 0);
  if ((v3 - 268435459) <= 1)
  {
    if ((*(_WORD *)msg & 0x1F00) == 0x1100)
      mach_port_deallocate(*MEMORY[0x1E0C83DA0], *(mach_port_name_t *)&msg[12]);
    mach_msg_destroy((mach_msg_header_t *)msg);
  }
  return v3;
}

uint64_t _BKSHIDApplyButtonDefinitions(int a1, uint64_t a2, int a3)
{
  uint64_t v3;
  _BYTE msg[28];
  uint64_t v6;
  int v7;
  int v8;
  uint64_t v9;
  int v10;

  v6 = a2;
  v7 = 16777472;
  v8 = a3;
  v9 = *MEMORY[0x1E0C804E8];
  v10 = a3;
  *(_QWORD *)msg = 2147483667;
  *(_DWORD *)&msg[8] = a1;
  *(_OWORD *)&msg[12] = xmmword_18A161420;
  if (MEMORY[0x1E0C85B60])
    voucher_mach_msg_set((mach_msg_header_t *)msg);
  v3 = mach_msg((mach_msg_header_t *)msg, 1, 0x38u, 0, 0, 0, 0);
  if ((v3 - 268435459) <= 1)
  {
    if ((*(_WORD *)msg & 0x1F00) == 0x1100)
      mach_port_deallocate(*MEMORY[0x1E0C83DA0], *(mach_port_name_t *)&msg[12]);
    mach_msg_destroy((mach_msg_header_t *)msg);
  }
  return v3;
}

uint64_t _BKSHIDPostTouchAnnotations(int a1, uint64_t a2, int a3)
{
  uint64_t v3;
  _BYTE msg[28];
  uint64_t v6;
  int v7;
  int v8;
  uint64_t v9;
  int v10;

  v6 = a2;
  v7 = 16777472;
  v8 = a3;
  v9 = *MEMORY[0x1E0C804E8];
  v10 = a3;
  *(_QWORD *)msg = 2147483667;
  *(_DWORD *)&msg[8] = a1;
  *(_OWORD *)&msg[12] = xmmword_18A161430;
  if (MEMORY[0x1E0C85B60])
    voucher_mach_msg_set((mach_msg_header_t *)msg);
  v3 = mach_msg((mach_msg_header_t *)msg, 1, 0x38u, 0, 0, 0, 0);
  if ((v3 - 268435459) <= 1)
  {
    if ((*(_WORD *)msg & 0x1F00) == 0x1100)
      mach_port_deallocate(*MEMORY[0x1E0C83DA0], *(mach_port_name_t *)&msg[12]);
    mach_msg_destroy((mach_msg_header_t *)msg);
  }
  return v3;
}

uint64_t _BKSHIDPlayHaptic(mach_port_t a1, int a2, int a3)
{
  uint64_t v3;
  mach_msg_header_t msg;
  uint64_t v6;
  int v7;
  int v8;

  v6 = *MEMORY[0x1E0C804E8];
  v7 = a2;
  v8 = a3;
  *(_QWORD *)&msg.msgh_bits = 19;
  msg.msgh_voucher_port = 0;
  msg.msgh_id = 6000032;
  msg.msgh_remote_port = a1;
  msg.msgh_local_port = 0;
  if (MEMORY[0x1E0C85B60])
    voucher_mach_msg_set(&msg);
  v3 = mach_msg(&msg, 1, 0x28u, 0, 0, 0, 0);
  if ((v3 - 268435459) <= 1)
  {
    if ((msg.msgh_bits & 0x1F00) == 0x1100)
      mach_port_deallocate(*MEMORY[0x1E0C83DA0], msg.msgh_local_port);
    mach_msg_destroy(&msg);
  }
  return v3;
}

uint64_t _BKSHIDRequestHapticFeedback(int a1, uint64_t a2, int a3)
{
  uint64_t v3;
  _BYTE msg[28];
  uint64_t v6;
  int v7;
  int v8;
  uint64_t v9;
  int v10;

  v6 = a2;
  v7 = 16777472;
  v8 = a3;
  v9 = *MEMORY[0x1E0C804E8];
  v10 = a3;
  *(_QWORD *)msg = 2147483667;
  *(_DWORD *)&msg[8] = a1;
  *(_OWORD *)&msg[12] = xmmword_18A161440;
  if (MEMORY[0x1E0C85B60])
    voucher_mach_msg_set((mach_msg_header_t *)msg);
  v3 = mach_msg((mach_msg_header_t *)msg, 1, 0x38u, 0, 0, 0, 0);
  if ((v3 - 268435459) <= 1)
  {
    if ((*(_WORD *)msg & 0x1F00) == 0x1100)
      mach_port_deallocate(*MEMORY[0x1E0C83DA0], *(mach_port_name_t *)&msg[12]);
    mach_msg_destroy((mach_msg_header_t *)msg);
  }
  return v3;
}

uint64_t _BKSHIDTouchStreamCreate(mach_port_name_t a1, int a2, char *src, int a4, char a5, _DWORD *a6)
{
  int v10;
  uint64_t v11;
  char *v12;
  mach_msg_size_t v13;
  mach_port_name_t special_reply_port;
  uint64_t v15;
  uint64_t v16;
  BOOL v17;
  mach_port_name_t rcv_name[4];
  __int128 v20;
  _OWORD v21[65];
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  memset(v21, 0, 480);
  *(_OWORD *)rcv_name = 0u;
  v20 = 0u;
  *((_QWORD *)&v20 + 1) = *MEMORY[0x1E0C804E8];
  LODWORD(v21[0]) = a2;
  if (MEMORY[0x1E0C84128])
    v10 = mig_strncpy_zerofill((char *)v21 + 12, src, 1024);
  else
    v10 = mig_strncpy((char *)v21 + 12, src, 1024);
  DWORD1(v21[0]) = 0;
  DWORD2(v21[0]) = v10;
  v11 = (v10 + 3) & 0xFFFFFFFC;
  v12 = (char *)rcv_name + v11;
  *((_DWORD *)v12 + 11) = a4;
  v12[48] = a5;
  *(_WORD *)(v12 + 49) = 0;
  v12[51] = 0;
  v13 = v11 + 52;
  special_reply_port = mig_get_special_reply_port();
  rcv_name[2] = a1;
  rcv_name[3] = special_reply_port;
  rcv_name[0] = 5395;
  *(_QWORD *)&v20 = 0x5B8DA200000000;
  if (MEMORY[0x1E0C85B60])
  {
    voucher_mach_msg_set((mach_msg_header_t *)rcv_name);
    special_reply_port = rcv_name[3];
  }
  v15 = mach_msg((mach_msg_header_t *)rcv_name, 3162115, v13, 0x30u, special_reply_port, 0, 0);
  v16 = v15;
  if ((v15 - 268435458) > 0xE || ((1 << (v15 - 2)) & 0x4003) == 0)
  {
    if (!(_DWORD)v15)
    {
      if (DWORD1(v20) == 71)
      {
        v16 = 4294966988;
      }
      else if (DWORD1(v20) == 6000134)
      {
        if ((rcv_name[0] & 0x80000000) == 0)
        {
          if (rcv_name[1] == 40)
          {
            if (!rcv_name[2])
            {
              v16 = LODWORD(v21[0]);
              if (!LODWORD(v21[0]))
              {
                *a6 = DWORD1(v21[0]);
                return v16;
              }
              goto LABEL_28;
            }
          }
          else if (rcv_name[1] == 36)
          {
            if (rcv_name[2])
              v17 = 1;
            else
              v17 = LODWORD(v21[0]) == 0;
            if (v17)
              v16 = 4294966996;
            else
              v16 = LODWORD(v21[0]);
            goto LABEL_28;
          }
        }
        v16 = 4294966996;
      }
      else
      {
        v16 = 4294966995;
      }
LABEL_28:
      mach_msg_destroy((mach_msg_header_t *)rcv_name);
      return v16;
    }
    mig_dealloc_special_reply_port();
  }
  if ((v16 - 268435459) <= 1)
  {
    if ((rcv_name[0] & 0x1F00) == 0x1100)
      mach_port_deallocate(*MEMORY[0x1E0C83DA0], rcv_name[3]);
    goto LABEL_28;
  }
  return v16;
}

uint64_t _BKSHIDTouchStreamInvalidate(int a1, int a2)
{
  mach_port_name_t special_reply_port;
  uint64_t v4;
  uint64_t v5;
  _BYTE msg[36];
  uint64_t v8;

  *(_OWORD *)&msg[20] = 0u;
  v8 = 0;
  *(_OWORD *)&msg[4] = 0u;
  *(_QWORD *)&msg[24] = *MEMORY[0x1E0C804E8];
  *(_DWORD *)&msg[32] = a2;
  special_reply_port = mig_get_special_reply_port();
  *(_DWORD *)&msg[8] = a1;
  *(_DWORD *)&msg[12] = special_reply_port;
  *(_DWORD *)msg = 5395;
  *(_QWORD *)&msg[16] = 0x5B8DA300000000;
  if (MEMORY[0x1E0C85B60])
  {
    voucher_mach_msg_set((mach_msg_header_t *)msg);
    special_reply_port = *(_DWORD *)&msg[12];
  }
  v4 = mach_msg((mach_msg_header_t *)msg, 3162115, 0x24u, 0x2Cu, special_reply_port, 0, 0);
  v5 = v4;
  if ((v4 - 268435458) <= 0xE && ((1 << (v4 - 2)) & 0x4003) != 0)
    goto LABEL_14;
  if ((_DWORD)v4)
  {
    mig_dealloc_special_reply_port();
LABEL_14:
    if ((v5 - 268435459) > 1)
      return v5;
    if ((*(_WORD *)msg & 0x1F00) == 0x1100)
      mach_port_deallocate(*MEMORY[0x1E0C83DA0], *(mach_port_name_t *)&msg[12]);
LABEL_19:
    mach_msg_destroy((mach_msg_header_t *)msg);
    return v5;
  }
  if (*(_DWORD *)&msg[20] == 71)
  {
    v5 = 4294966988;
    goto LABEL_19;
  }
  if (*(_DWORD *)&msg[20] != 6000135)
  {
    v5 = 4294966995;
    goto LABEL_19;
  }
  v5 = 4294966996;
  if ((*(_DWORD *)msg & 0x80000000) != 0)
    goto LABEL_19;
  if (*(_DWORD *)&msg[4] != 36)
    goto LABEL_19;
  if (*(_DWORD *)&msg[8])
    goto LABEL_19;
  v5 = *(unsigned int *)&msg[32];
  if (*(_DWORD *)&msg[32])
    goto LABEL_19;
  return v5;
}

uint64_t _BKSHIDTouchTransfer(mach_port_name_t a1, uint64_t a2, unsigned int a3, mach_port_name_t a4)
{
  uint64_t v4;
  uint64_t v8;
  mach_port_name_t special_reply_port;
  uint64_t v10;
  mach_port_name_t rcv_name[4];
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  uint64_t v22;

  v22 = 0;
  v20 = 0u;
  v21 = 0u;
  v18 = 0u;
  v19 = 0u;
  v16 = 0u;
  v17 = 0u;
  v14 = 0u;
  v15 = 0u;
  *(_OWORD *)rcv_name = 0u;
  v13 = 0u;
  *((_QWORD *)&v13 + 1) = *MEMORY[0x1E0C804E8];
  if (a3 > 0x20)
    return 4294966989;
  v8 = a3;
  __memcpy_chk();
  LODWORD(v14) = a3;
  rcv_name[v8 + 9] = a4;
  special_reply_port = mig_get_special_reply_port();
  rcv_name[2] = a1;
  rcv_name[3] = special_reply_port;
  rcv_name[0] = 5395;
  *(_QWORD *)&v13 = 0x5B8DA500000000;
  if (MEMORY[0x1E0C85B60])
  {
    voucher_mach_msg_set((mach_msg_header_t *)rcv_name);
    special_reply_port = rcv_name[3];
  }
  v10 = mach_msg((mach_msg_header_t *)rcv_name, 3162115, v8 * 4 + 40, 0x2Cu, special_reply_port, 0, 0);
  v4 = v10;
  if ((v10 - 268435458) <= 0xE && ((1 << (v10 - 2)) & 0x4003) != 0)
    goto LABEL_16;
  if ((_DWORD)v10)
  {
    mig_dealloc_special_reply_port();
LABEL_16:
    if ((v4 - 268435459) > 1)
      return v4;
    if ((rcv_name[0] & 0x1F00) == 0x1100)
      mach_port_deallocate(*MEMORY[0x1E0C83DA0], rcv_name[3]);
LABEL_21:
    mach_msg_destroy((mach_msg_header_t *)rcv_name);
    return v4;
  }
  if (DWORD1(v13) == 71)
  {
    v4 = 4294966988;
    goto LABEL_21;
  }
  if (DWORD1(v13) != 6000137)
  {
    v4 = 4294966995;
    goto LABEL_21;
  }
  v4 = 4294966996;
  if ((rcv_name[0] & 0x80000000) != 0)
    goto LABEL_21;
  if (rcv_name[1] != 36)
    goto LABEL_21;
  if (rcv_name[2])
    goto LABEL_21;
  v4 = v14;
  if ((_DWORD)v14)
    goto LABEL_21;
  return v4;
}

uint64_t _BKSHIDDigitizerTouchDetach(mach_port_t a1, float a2, float a3, uint64_t a4, unsigned int a5, int a6, uint64_t a7, unsigned int a8, _BYTE *a9)
{
  uint64_t v10;
  uint64_t v17;
  char *v18;
  mach_port_t special_reply_port;
  uint64_t v20;
  BOOL v21;
  mach_msg_header_t rcv_name;
  int v24;
  uint64_t v25;
  int v26;
  _BYTE v27[24];
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  uint64_t v36;
  uint64_t v37;

  v37 = *MEMORY[0x1E0C80C00];
  *(_OWORD *)&v27[8] = 0u;
  v36 = 0;
  v34 = 0u;
  v35 = 0u;
  v32 = 0u;
  v33 = 0u;
  v30 = 0u;
  v31 = 0u;
  v28 = 0u;
  v29 = 0u;
  memset(&rcv_name, 0, sizeof(rcv_name));
  v24 = 1;
  v25 = a7;
  v26 = 16777472;
  *(_QWORD *)v27 = a8;
  *(_QWORD *)&v27[4] = *MEMORY[0x1E0C804E8];
  if (a5 <= 0x20)
  {
    v17 = 4 * a5;
    __memcpy_chk();
    *(_DWORD *)&v27[12] = a5;
    v18 = (char *)&rcv_name + v17;
    *((_DWORD *)v18 + 14) = a6;
    *((float *)v18 + 15) = a2;
    *((float *)v18 + 16) = a3;
    *((_DWORD *)v18 + 17) = a8;
    special_reply_port = mig_get_special_reply_port();
    rcv_name.msgh_remote_port = a1;
    rcv_name.msgh_local_port = special_reply_port;
    rcv_name.msgh_bits = -2147478253;
    *(_QWORD *)&rcv_name.msgh_voucher_port = 0x5B8DA600000000;
    if (MEMORY[0x1E0C85B60])
    {
      voucher_mach_msg_set(&rcv_name);
      special_reply_port = rcv_name.msgh_local_port;
    }
    v20 = mach_msg(&rcv_name, 3162115, v17 + 72, 0x30u, special_reply_port, 0, 0);
    v10 = v20;
    if ((v20 - 268435458) > 0xE || ((1 << (v20 - 2)) & 0x4003) == 0)
    {
      if (!(_DWORD)v20)
      {
        if (rcv_name.msgh_id == 71)
        {
          v10 = 4294966988;
        }
        else if (rcv_name.msgh_id == 6000138)
        {
          if ((rcv_name.msgh_bits & 0x80000000) == 0)
          {
            if (rcv_name.msgh_size == 40)
            {
              if (!rcv_name.msgh_remote_port)
              {
                v10 = HIDWORD(v25);
                if (!HIDWORD(v25))
                {
                  *a9 = v26;
                  return v10;
                }
                goto LABEL_27;
              }
            }
            else if (rcv_name.msgh_size == 36)
            {
              if (rcv_name.msgh_remote_port)
                v21 = 1;
              else
                v21 = HIDWORD(v25) == 0;
              if (v21)
                v10 = 4294966996;
              else
                v10 = HIDWORD(v25);
              goto LABEL_27;
            }
          }
          v10 = 4294966996;
        }
        else
        {
          v10 = 4294966995;
        }
LABEL_27:
        mach_msg_destroy(&rcv_name);
        return v10;
      }
      mig_dealloc_special_reply_port();
    }
    if ((v10 - 268435459) > 1)
      return v10;
    if ((rcv_name.msgh_bits & 0x1F00) == 0x1100)
      mach_port_deallocate(*MEMORY[0x1E0C83DA0], rcv_name.msgh_local_port);
    goto LABEL_27;
  }
  return 4294966989;
}

uint64_t _BKSHIDDigitizerTouchSetOffset(mach_port_t a1, int a2, float a3, float a4)
{
  uint64_t v4;
  mach_msg_header_t v6;
  uint64_t v7;
  int v8;
  float v9;
  float v10;

  v7 = *MEMORY[0x1E0C804E8];
  v8 = a2;
  v9 = a3;
  v10 = a4;
  *(_QWORD *)&v6.msgh_bits = 19;
  v6.msgh_voucher_port = 0;
  v6.msgh_id = 6000039;
  v6.msgh_remote_port = a1;
  v6.msgh_local_port = 0;
  if (MEMORY[0x1E0C85B60])
    voucher_mach_msg_set(&v6);
  v4 = mach_msg(&v6, 1, 0x2Cu, 0, 0, 0, 0);
  if ((v4 - 268435459) <= 1)
  {
    if ((v6.msgh_bits & 0x1F00) == 0x1100)
      mach_port_deallocate(*MEMORY[0x1E0C83DA0], v6.msgh_local_port);
    mach_msg_destroy(&v6);
  }
  return v4;
}

uint64_t _BKSHIDDigitizerTouchSetRoutingPolicy(int a1, int a2, uint64_t a3, int a4)
{
  uint64_t v4;
  uint64_t v6;
  int v7;
  mach_port_name_t name[4];
  uint64_t v9;
  int v10;
  int v11;
  uint64_t v12;
  int v13;
  int v14;

  v9 = a3;
  v10 = 16777472;
  v11 = a4;
  v12 = *MEMORY[0x1E0C804E8];
  v13 = a2;
  v14 = a4;
  v6 = 2147483667;
  v7 = a1;
  *(_OWORD *)name = xmmword_18A161450;
  if (MEMORY[0x1E0C85B60])
    voucher_mach_msg_set((mach_msg_header_t *)&v6);
  v4 = mach_msg((mach_msg_header_t *)&v6, 1, 0x3Cu, 0, 0, 0, 0);
  if ((v4 - 268435459) <= 1)
  {
    if ((v6 & 0x1F00) == 0x1100)
      mach_port_deallocate(*MEMORY[0x1E0C83DA0], name[0]);
    mach_msg_destroy((mach_msg_header_t *)&v6);
  }
  return v4;
}

uint64_t _BKSHIDResetUserEventTimer(mach_port_t a1, int a2, double a3)
{
  uint64_t v3;
  mach_msg_header_t v5;
  uint64_t v6;
  double v7;
  int v8;

  v6 = *MEMORY[0x1E0C804E8];
  v7 = a3;
  v8 = a2;
  *(_QWORD *)&v5.msgh_bits = 19;
  v5.msgh_voucher_port = 0;
  v5.msgh_id = 6000041;
  v5.msgh_remote_port = a1;
  v5.msgh_local_port = 0;
  if (MEMORY[0x1E0C85B60])
    voucher_mach_msg_set(&v5);
  v3 = mach_msg(&v5, 1, 0x2Cu, 0, 0, 0, 0);
  if ((v3 - 268435459) <= 1)
  {
    if ((v5.msgh_bits & 0x1F00) == 0x1100)
      mach_port_deallocate(*MEMORY[0x1E0C83DA0], v5.msgh_local_port);
    mach_msg_destroy(&v5);
  }
  return v3;
}

uint64_t _BKSHIDNotifyOnNextUserEvent(mach_port_t a1)
{
  uint64_t v1;
  mach_msg_header_t msg;

  msg.msgh_size = 0;
  msg.msgh_bits = 19;
  msg.msgh_remote_port = a1;
  msg.msgh_local_port = 0;
  *(_QWORD *)&msg.msgh_voucher_port = 0x5B8DAA00000000;
  if (MEMORY[0x1E0C85B60])
    voucher_mach_msg_set(&msg);
  v1 = mach_msg(&msg, 1, 0x18u, 0, 0, 0, 0);
  if ((v1 - 268435459) <= 1)
  {
    if ((msg.msgh_bits & 0x1F00) == 0x1100)
      mach_port_deallocate(*MEMORY[0x1E0C83DA0], msg.msgh_local_port);
    mach_msg_destroy(&msg);
  }
  return v1;
}

uint64_t _BKSHIDSafeToResetIdleTimer(int a1, _BYTE *a2)
{
  mach_port_name_t special_reply_port;
  uint64_t v5;
  uint64_t v6;
  BOOL v7;
  int v9;
  int rcv_name;
  int rcv_name_4;
  mach_port_name_t rcv_name_8;
  _BYTE rcv_name_12[32];

  memset(&rcv_name_12[4], 0, 28);
  rcv_name = 0;
  special_reply_port = mig_get_special_reply_port();
  rcv_name_4 = a1;
  rcv_name_8 = special_reply_port;
  v9 = 5395;
  *(_QWORD *)rcv_name_12 = 0x5B8DAC00000000;
  if (MEMORY[0x1E0C85B60])
  {
    voucher_mach_msg_set((mach_msg_header_t *)&v9);
    special_reply_port = rcv_name_8;
  }
  v5 = mach_msg((mach_msg_header_t *)&v9, 3162115, 0x18u, 0x30u, special_reply_port, 0, 0);
  v6 = v5;
  if ((v5 - 268435458) > 0xE || ((1 << (v5 - 2)) & 0x4003) == 0)
  {
    if (!(_DWORD)v5)
    {
      if (*(_DWORD *)&rcv_name_12[4] == 71)
      {
        v6 = 4294966988;
      }
      else if (*(_DWORD *)&rcv_name_12[4] == 6000144)
      {
        if ((v9 & 0x80000000) == 0)
        {
          if (rcv_name == 40)
          {
            if (!rcv_name_4)
            {
              v6 = *(unsigned int *)&rcv_name_12[16];
              if (!*(_DWORD *)&rcv_name_12[16])
              {
                *a2 = rcv_name_12[20];
                return v6;
              }
              goto LABEL_25;
            }
          }
          else if (rcv_name == 36)
          {
            if (rcv_name_4)
              v7 = 1;
            else
              v7 = *(_DWORD *)&rcv_name_12[16] == 0;
            if (v7)
              v6 = 4294966996;
            else
              v6 = *(unsigned int *)&rcv_name_12[16];
            goto LABEL_25;
          }
        }
        v6 = 4294966996;
      }
      else
      {
        v6 = 4294966995;
      }
LABEL_25:
      mach_msg_destroy((mach_msg_header_t *)&v9);
      return v6;
    }
    mig_dealloc_special_reply_port();
  }
  if ((v6 - 268435459) <= 1)
  {
    if ((v9 & 0x1F00) == 0x1100)
      mach_port_deallocate(*MEMORY[0x1E0C83DA0], rcv_name_8);
    goto LABEL_25;
  }
  return v6;
}

uint64_t _BKSHIDGetCurrentDeviceOrientation(int a1, _DWORD *a2)
{
  mach_port_name_t special_reply_port;
  uint64_t v5;
  uint64_t v6;
  BOOL v7;
  int v9;
  int rcv_name;
  int rcv_name_4;
  mach_port_name_t rcv_name_8;
  _BYTE rcv_name_12[32];

  memset(&rcv_name_12[4], 0, 28);
  rcv_name = 0;
  special_reply_port = mig_get_special_reply_port();
  rcv_name_4 = a1;
  rcv_name_8 = special_reply_port;
  v9 = 5395;
  *(_QWORD *)rcv_name_12 = 0x5B8DAE00000000;
  if (MEMORY[0x1E0C85B60])
  {
    voucher_mach_msg_set((mach_msg_header_t *)&v9);
    special_reply_port = rcv_name_8;
  }
  v5 = mach_msg((mach_msg_header_t *)&v9, 3162115, 0x18u, 0x30u, special_reply_port, 0, 0);
  v6 = v5;
  if ((v5 - 268435458) > 0xE || ((1 << (v5 - 2)) & 0x4003) == 0)
  {
    if (!(_DWORD)v5)
    {
      if (*(_DWORD *)&rcv_name_12[4] == 71)
      {
        v6 = 4294966988;
      }
      else if (*(_DWORD *)&rcv_name_12[4] == 6000146)
      {
        if ((v9 & 0x80000000) == 0)
        {
          if (rcv_name == 40)
          {
            if (!rcv_name_4)
            {
              v6 = *(unsigned int *)&rcv_name_12[16];
              if (!*(_DWORD *)&rcv_name_12[16])
              {
                *a2 = *(_DWORD *)&rcv_name_12[20];
                return v6;
              }
              goto LABEL_25;
            }
          }
          else if (rcv_name == 36)
          {
            if (rcv_name_4)
              v7 = 1;
            else
              v7 = *(_DWORD *)&rcv_name_12[16] == 0;
            if (v7)
              v6 = 4294966996;
            else
              v6 = *(unsigned int *)&rcv_name_12[16];
            goto LABEL_25;
          }
        }
        v6 = 4294966996;
      }
      else
      {
        v6 = 4294966995;
      }
LABEL_25:
      mach_msg_destroy((mach_msg_header_t *)&v9);
      return v6;
    }
    mig_dealloc_special_reply_port();
  }
  if ((v6 - 268435459) <= 1)
  {
    if ((v9 & 0x1F00) == 0x1100)
      mach_port_deallocate(*MEMORY[0x1E0C83DA0], rcv_name_8);
    goto LABEL_25;
  }
  return v6;
}

uint64_t _BKSHIDSetOrientationClient(mach_port_name_t a1, const char *a2, char a3)
{
  int v5;
  uint64_t v6;
  char *v7;
  mach_msg_size_t v8;
  uint64_t v9;
  mach_port_name_t name[4];
  __int128 v12;
  _OWORD v13[65];
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  memset(v13, 0, 480);
  *(_OWORD *)name = 0u;
  v12 = 0u;
  *((_QWORD *)&v12 + 1) = *MEMORY[0x1E0C804E8];
  if (MEMORY[0x1E0C84128])
    v5 = mig_strncpy_zerofill((char *)v13 + 8, a2, 1024);
  else
    v5 = mig_strncpy((char *)v13 + 8, a2, 1024);
  LODWORD(v13[0]) = 0;
  DWORD1(v13[0]) = v5;
  v6 = (v5 + 3) & 0xFFFFFFFC;
  v7 = (char *)name + v6;
  v7[40] = a3;
  *(_WORD *)(v7 + 41) = 0;
  v7[43] = 0;
  v8 = v6 + 44;
  name[0] = 19;
  name[2] = a1;
  name[3] = 0;
  *(_QWORD *)&v12 = 0x5B8DAF00000000;
  if (MEMORY[0x1E0C85B60])
    voucher_mach_msg_set((mach_msg_header_t *)name);
  v9 = mach_msg((mach_msg_header_t *)name, 1, v8, 0, 0, 0, 0);
  if ((v9 - 268435459) <= 1)
  {
    if ((name[0] & 0x1F00) == 0x1100)
      mach_port_deallocate(*MEMORY[0x1E0C83DA0], name[3]);
    mach_msg_destroy((mach_msg_header_t *)name);
  }
  return v9;
}

uint64_t _BKSHIDLockOrientation(int a1, int a2, char a3)
{
  mach_port_name_t special_reply_port;
  uint64_t v5;
  uint64_t v6;
  _BYTE msg[36];
  uint64_t v9;

  *(_OWORD *)&msg[20] = 0u;
  v9 = 0;
  *(_OWORD *)&msg[4] = 0u;
  *(_QWORD *)&msg[24] = *MEMORY[0x1E0C804E8];
  *(_DWORD *)&msg[32] = a2;
  LOBYTE(v9) = a3;
  special_reply_port = mig_get_special_reply_port();
  *(_DWORD *)&msg[8] = a1;
  *(_DWORD *)&msg[12] = special_reply_port;
  *(_DWORD *)msg = 5395;
  *(_QWORD *)&msg[16] = 0x5B8DB000000000;
  if (MEMORY[0x1E0C85B60])
  {
    voucher_mach_msg_set((mach_msg_header_t *)msg);
    special_reply_port = *(_DWORD *)&msg[12];
  }
  v5 = mach_msg((mach_msg_header_t *)msg, 3162115, 0x28u, 0x2Cu, special_reply_port, 0, 0);
  v6 = v5;
  if ((v5 - 268435458) <= 0xE && ((1 << (v5 - 2)) & 0x4003) != 0)
    goto LABEL_14;
  if ((_DWORD)v5)
  {
    mig_dealloc_special_reply_port();
LABEL_14:
    if ((v6 - 268435459) > 1)
      return v6;
    if ((*(_WORD *)msg & 0x1F00) == 0x1100)
      mach_port_deallocate(*MEMORY[0x1E0C83DA0], *(mach_port_name_t *)&msg[12]);
LABEL_19:
    mach_msg_destroy((mach_msg_header_t *)msg);
    return v6;
  }
  if (*(_DWORD *)&msg[20] == 71)
  {
    v6 = 4294966988;
    goto LABEL_19;
  }
  if (*(_DWORD *)&msg[20] != 6000148)
  {
    v6 = 4294966995;
    goto LABEL_19;
  }
  v6 = 4294966996;
  if ((*(_DWORD *)msg & 0x80000000) != 0)
    goto LABEL_19;
  if (*(_DWORD *)&msg[4] != 36)
    goto LABEL_19;
  if (*(_DWORD *)&msg[8])
    goto LABEL_19;
  v6 = *(unsigned int *)&msg[32];
  if (*(_DWORD *)&msg[32])
    goto LABEL_19;
  return v6;
}

uint64_t _BKSHIDUnlockOrientation(mach_port_t a1)
{
  uint64_t v1;
  mach_msg_header_t msg;

  msg.msgh_size = 0;
  msg.msgh_bits = 19;
  msg.msgh_remote_port = a1;
  msg.msgh_local_port = 0;
  *(_QWORD *)&msg.msgh_voucher_port = 0x5B8DB100000000;
  if (MEMORY[0x1E0C85B60])
    voucher_mach_msg_set(&msg);
  v1 = mach_msg(&msg, 1, 0x18u, 0, 0, 0, 0);
  if ((v1 - 268435459) <= 1)
  {
    if ((msg.msgh_bits & 0x1F00) == 0x1100)
      mach_port_deallocate(*MEMORY[0x1E0C83DA0], msg.msgh_local_port);
    mach_msg_destroy(&msg);
  }
  return v1;
}

uint64_t _BKSHIDIsOrientationLockedWithOrientation(int a1, _DWORD *a2, _DWORD *a3)
{
  mach_port_name_t special_reply_port;
  uint64_t v7;
  uint64_t v8;
  BOOL v9;
  int v11;
  _BYTE msg[36];
  __int128 v13;

  *(_OWORD *)&msg[20] = 0u;
  v13 = 0u;
  *(_DWORD *)&msg[4] = 0;
  special_reply_port = mig_get_special_reply_port();
  *(_DWORD *)&msg[8] = a1;
  *(_DWORD *)&msg[12] = special_reply_port;
  *(_DWORD *)msg = 5395;
  *(_QWORD *)&msg[16] = 0x5B8DB200000000;
  if (MEMORY[0x1E0C85B60])
  {
    voucher_mach_msg_set((mach_msg_header_t *)msg);
    special_reply_port = *(_DWORD *)&msg[12];
  }
  v7 = mach_msg((mach_msg_header_t *)msg, 3162115, 0x18u, 0x34u, special_reply_port, 0, 0);
  v8 = v7;
  if ((v7 - 268435458) > 0xE || ((1 << (v7 - 2)) & 0x4003) == 0)
  {
    if (!(_DWORD)v7)
    {
      if (*(_DWORD *)&msg[20] == 71)
      {
        v8 = 4294966988;
      }
      else if (*(_DWORD *)&msg[20] == 6000150)
      {
        if ((*(_DWORD *)msg & 0x80000000) == 0)
        {
          if (*(_DWORD *)&msg[4] == 44)
          {
            if (!*(_DWORD *)&msg[8])
            {
              v8 = *(unsigned int *)&msg[32];
              if (!*(_DWORD *)&msg[32])
              {
                v11 = DWORD1(v13);
                *a2 = v13;
                *a3 = v11;
                return v8;
              }
              goto LABEL_25;
            }
          }
          else if (*(_DWORD *)&msg[4] == 36)
          {
            if (*(_DWORD *)&msg[8])
              v9 = 1;
            else
              v9 = *(_DWORD *)&msg[32] == 0;
            if (v9)
              v8 = 4294966996;
            else
              v8 = *(unsigned int *)&msg[32];
            goto LABEL_25;
          }
        }
        v8 = 4294966996;
      }
      else
      {
        v8 = 4294966995;
      }
LABEL_25:
      mach_msg_destroy((mach_msg_header_t *)msg);
      return v8;
    }
    mig_dealloc_special_reply_port();
  }
  if ((v8 - 268435459) <= 1)
  {
    if ((*(_WORD *)msg & 0x1F00) == 0x1100)
      mach_port_deallocate(*MEMORY[0x1E0C83DA0], *(mach_port_name_t *)&msg[12]);
    goto LABEL_25;
  }
  return v8;
}

uint64_t _BKSHIDBeginDisplayBrightnessTransaction(int a1, int a2)
{
  mach_port_name_t special_reply_port;
  uint64_t v4;
  uint64_t v5;
  _BYTE msg[36];
  uint64_t v8;

  *(_OWORD *)&msg[20] = 0u;
  *(_DWORD *)&msg[4] = 0;
  *(_DWORD *)&msg[24] = 1;
  *(_DWORD *)&msg[28] = a2;
  v8 = 1310720;
  special_reply_port = mig_get_special_reply_port();
  *(_DWORD *)&msg[8] = a1;
  *(_DWORD *)&msg[12] = special_reply_port;
  *(_DWORD *)msg = -2147478253;
  *(_QWORD *)&msg[16] = 0x5B8DB600000000;
  if (MEMORY[0x1E0C85B60])
  {
    voucher_mach_msg_set((mach_msg_header_t *)msg);
    special_reply_port = *(_DWORD *)&msg[12];
  }
  v4 = mach_msg((mach_msg_header_t *)msg, 3162115, 0x28u, 0x2Cu, special_reply_port, 0, 0);
  v5 = v4;
  if ((v4 - 268435458) <= 0xE && ((1 << (v4 - 2)) & 0x4003) != 0)
    goto LABEL_14;
  if ((_DWORD)v4)
  {
    mig_dealloc_special_reply_port();
LABEL_14:
    if ((v5 - 268435459) > 1)
      return v5;
    if ((*(_WORD *)msg & 0x1F00) == 0x1100)
      mach_port_deallocate(*MEMORY[0x1E0C83DA0], *(mach_port_name_t *)&msg[12]);
LABEL_19:
    mach_msg_destroy((mach_msg_header_t *)msg);
    return v5;
  }
  if (*(_DWORD *)&msg[20] == 71)
  {
    v5 = 4294966988;
    goto LABEL_19;
  }
  if (*(_DWORD *)&msg[20] != 6000154)
  {
    v5 = 4294966995;
    goto LABEL_19;
  }
  v5 = 4294966996;
  if ((*(_DWORD *)msg & 0x80000000) != 0)
    goto LABEL_19;
  if (*(_DWORD *)&msg[4] != 36)
    goto LABEL_19;
  if (*(_DWORD *)&msg[8])
    goto LABEL_19;
  v5 = *(unsigned int *)&msg[32];
  if (*(_DWORD *)&msg[32])
    goto LABEL_19;
  return v5;
}

uint64_t _BKSHIDSetDisplayBrightnessWithImplicitTransaction(int a1, float a2)
{
  mach_port_name_t special_reply_port;
  uint64_t v4;
  uint64_t v5;
  _BYTE msg[36];
  uint64_t v8;

  *(_OWORD *)&msg[20] = 0u;
  v8 = 0;
  *(_OWORD *)&msg[4] = 0u;
  *(_QWORD *)&msg[24] = *MEMORY[0x1E0C804E8];
  *(float *)&msg[32] = a2;
  special_reply_port = mig_get_special_reply_port();
  *(_DWORD *)&msg[8] = a1;
  *(_DWORD *)&msg[12] = special_reply_port;
  *(_DWORD *)msg = 5395;
  *(_QWORD *)&msg[16] = 0x5B8DB700000000;
  if (MEMORY[0x1E0C85B60])
  {
    voucher_mach_msg_set((mach_msg_header_t *)msg);
    special_reply_port = *(_DWORD *)&msg[12];
  }
  v4 = mach_msg((mach_msg_header_t *)msg, 3162115, 0x24u, 0x2Cu, special_reply_port, 0, 0);
  v5 = v4;
  if ((v4 - 268435458) <= 0xE && ((1 << (v4 - 2)) & 0x4003) != 0)
    goto LABEL_14;
  if ((_DWORD)v4)
  {
    mig_dealloc_special_reply_port();
LABEL_14:
    if ((v5 - 268435459) > 1)
      return v5;
    if ((*(_WORD *)msg & 0x1F00) == 0x1100)
      mach_port_deallocate(*MEMORY[0x1E0C83DA0], *(mach_port_name_t *)&msg[12]);
LABEL_19:
    mach_msg_destroy((mach_msg_header_t *)msg);
    return v5;
  }
  if (*(_DWORD *)&msg[20] == 71)
  {
    v5 = 4294966988;
    goto LABEL_19;
  }
  if (*(_DWORD *)&msg[20] != 6000155)
  {
    v5 = 4294966995;
    goto LABEL_19;
  }
  v5 = 4294966996;
  if ((*(_DWORD *)msg & 0x80000000) != 0)
    goto LABEL_19;
  if (*(_DWORD *)&msg[4] != 36)
    goto LABEL_19;
  if (*(_DWORD *)&msg[8])
    goto LABEL_19;
  v5 = *(unsigned int *)&msg[32];
  if (*(_DWORD *)&msg[32])
    goto LABEL_19;
  return v5;
}

uint64_t _BKSHIDSetDisplayBrightnessValue(mach_port_t a1, char a2, float a3)
{
  uint64_t v3;
  mach_msg_header_t msg;
  uint64_t v6;
  float v7;
  char v8;
  __int16 v9;
  char v10;

  v6 = *MEMORY[0x1E0C804E8];
  v7 = a3;
  v8 = a2;
  v9 = 0;
  v10 = 0;
  *(_QWORD *)&msg.msgh_bits = 19;
  msg.msgh_voucher_port = 0;
  msg.msgh_id = 6000056;
  msg.msgh_remote_port = a1;
  msg.msgh_local_port = 0;
  if (MEMORY[0x1E0C85B60])
    voucher_mach_msg_set(&msg);
  v3 = mach_msg(&msg, 1, 0x28u, 0, 0, 0, 0);
  if ((v3 - 268435459) <= 1)
  {
    if ((msg.msgh_bits & 0x1F00) == 0x1100)
      mach_port_deallocate(*MEMORY[0x1E0C83DA0], msg.msgh_local_port);
    mach_msg_destroy(&msg);
  }
  return v3;
}

uint64_t _BKSHIDFlushDisplayBrightnessUpdates(int a1)
{
  mach_port_name_t special_reply_port;
  uint64_t v3;
  uint64_t v4;
  _BYTE msg[36];
  uint64_t v7;

  v7 = 0;
  *(_OWORD *)&msg[20] = 0u;
  *(_DWORD *)&msg[4] = 0;
  special_reply_port = mig_get_special_reply_port();
  *(_DWORD *)&msg[8] = a1;
  *(_DWORD *)&msg[12] = special_reply_port;
  *(_DWORD *)msg = 5395;
  *(_QWORD *)&msg[16] = 0x5B8DB900000000;
  if (MEMORY[0x1E0C85B60])
  {
    voucher_mach_msg_set((mach_msg_header_t *)msg);
    special_reply_port = *(_DWORD *)&msg[12];
  }
  v3 = mach_msg((mach_msg_header_t *)msg, 3162115, 0x18u, 0x2Cu, special_reply_port, 0, 0);
  v4 = v3;
  if ((v3 - 268435458) <= 0xE && ((1 << (v3 - 2)) & 0x4003) != 0)
    goto LABEL_14;
  if ((_DWORD)v3)
  {
    mig_dealloc_special_reply_port();
LABEL_14:
    if ((v4 - 268435459) > 1)
      return v4;
    if ((*(_WORD *)msg & 0x1F00) == 0x1100)
      mach_port_deallocate(*MEMORY[0x1E0C83DA0], *(mach_port_name_t *)&msg[12]);
LABEL_19:
    mach_msg_destroy((mach_msg_header_t *)msg);
    return v4;
  }
  if (*(_DWORD *)&msg[20] == 71)
  {
    v4 = 4294966988;
    goto LABEL_19;
  }
  if (*(_DWORD *)&msg[20] != 6000157)
  {
    v4 = 4294966995;
    goto LABEL_19;
  }
  v4 = 4294966996;
  if ((*(_DWORD *)msg & 0x80000000) != 0)
    goto LABEL_19;
  if (*(_DWORD *)&msg[4] != 36)
    goto LABEL_19;
  if (*(_DWORD *)&msg[8])
    goto LABEL_19;
  v4 = *(unsigned int *)&msg[32];
  if (*(_DWORD *)&msg[32])
    goto LABEL_19;
  return v4;
}

uint64_t _BKSHIDRestoreSystemDisplayBrightness(mach_port_t a1)
{
  uint64_t v1;
  mach_msg_header_t msg;

  msg.msgh_size = 0;
  msg.msgh_bits = 19;
  msg.msgh_remote_port = a1;
  msg.msgh_local_port = 0;
  *(_QWORD *)&msg.msgh_voucher_port = 0x5B8DBA00000000;
  if (MEMORY[0x1E0C85B60])
    voucher_mach_msg_set(&msg);
  v1 = mach_msg(&msg, 1, 0x18u, 0, 0, 0, 0);
  if ((v1 - 268435459) <= 1)
  {
    if ((msg.msgh_bits & 0x1F00) == 0x1100)
      mach_port_deallocate(*MEMORY[0x1E0C83DA0], msg.msgh_local_port);
    mach_msg_destroy(&msg);
  }
  return v1;
}

uint64_t _BKSHIDGetCurrentDisplayBrightnessCurve(int a1, _BYTE *a2)
{
  mach_port_name_t special_reply_port;
  uint64_t v5;
  uint64_t v6;
  BOOL v7;
  int v9;
  int rcv_name;
  int rcv_name_4;
  mach_port_name_t rcv_name_8;
  _BYTE rcv_name_12[32];

  memset(&rcv_name_12[4], 0, 28);
  rcv_name = 0;
  special_reply_port = mig_get_special_reply_port();
  rcv_name_4 = a1;
  rcv_name_8 = special_reply_port;
  v9 = 5395;
  *(_QWORD *)rcv_name_12 = 0x5B8DBB00000000;
  if (MEMORY[0x1E0C85B60])
  {
    voucher_mach_msg_set((mach_msg_header_t *)&v9);
    special_reply_port = rcv_name_8;
  }
  v5 = mach_msg((mach_msg_header_t *)&v9, 3162115, 0x18u, 0x30u, special_reply_port, 0, 0);
  v6 = v5;
  if ((v5 - 268435458) > 0xE || ((1 << (v5 - 2)) & 0x4003) == 0)
  {
    if (!(_DWORD)v5)
    {
      if (*(_DWORD *)&rcv_name_12[4] == 71)
      {
        v6 = 4294966988;
      }
      else if (*(_DWORD *)&rcv_name_12[4] == 6000159)
      {
        if ((v9 & 0x80000000) == 0)
        {
          if (rcv_name == 40)
          {
            if (!rcv_name_4)
            {
              v6 = *(unsigned int *)&rcv_name_12[16];
              if (!*(_DWORD *)&rcv_name_12[16])
              {
                *a2 = rcv_name_12[20];
                return v6;
              }
              goto LABEL_25;
            }
          }
          else if (rcv_name == 36)
          {
            if (rcv_name_4)
              v7 = 1;
            else
              v7 = *(_DWORD *)&rcv_name_12[16] == 0;
            if (v7)
              v6 = 4294966996;
            else
              v6 = *(unsigned int *)&rcv_name_12[16];
            goto LABEL_25;
          }
        }
        v6 = 4294966996;
      }
      else
      {
        v6 = 4294966995;
      }
LABEL_25:
      mach_msg_destroy((mach_msg_header_t *)&v9);
      return v6;
    }
    mig_dealloc_special_reply_port();
  }
  if ((v6 - 268435459) <= 1)
  {
    if ((v9 & 0x1F00) == 0x1100)
      mach_port_deallocate(*MEMORY[0x1E0C83DA0], rcv_name_8);
    goto LABEL_25;
  }
  return v6;
}

uint64_t _BKSHIDSetDisplayBrightnessCurveValue(mach_port_t a1, char a2)
{
  uint64_t v2;
  mach_msg_header_t msg;
  uint64_t v5;
  char v6;
  __int16 v7;
  char v8;

  v5 = *MEMORY[0x1E0C804E8];
  v6 = a2;
  v7 = 0;
  v8 = 0;
  *(_QWORD *)&msg.msgh_bits = 19;
  msg.msgh_voucher_port = 0;
  msg.msgh_id = 6000060;
  msg.msgh_remote_port = a1;
  msg.msgh_local_port = 0;
  if (MEMORY[0x1E0C85B60])
    voucher_mach_msg_set(&msg);
  v2 = mach_msg(&msg, 1, 0x24u, 0, 0, 0, 0);
  if ((v2 - 268435459) <= 1)
  {
    if ((msg.msgh_bits & 0x1F00) == 0x1100)
      mach_port_deallocate(*MEMORY[0x1E0C83DA0], msg.msgh_local_port);
    mach_msg_destroy(&msg);
  }
  return v2;
}

uint64_t _BKSHIDSetAutoDisplayBrightnessEnabled(mach_port_t a1, char a2)
{
  uint64_t v2;
  mach_msg_header_t msg;
  uint64_t v5;
  char v6;
  __int16 v7;
  char v8;

  v5 = *MEMORY[0x1E0C804E8];
  v6 = a2;
  v7 = 0;
  v8 = 0;
  *(_QWORD *)&msg.msgh_bits = 19;
  msg.msgh_voucher_port = 0;
  msg.msgh_id = 6000061;
  msg.msgh_remote_port = a1;
  msg.msgh_local_port = 0;
  if (MEMORY[0x1E0C85B60])
    voucher_mach_msg_set(&msg);
  v2 = mach_msg(&msg, 1, 0x24u, 0, 0, 0, 0);
  if ((v2 - 268435459) <= 1)
  {
    if ((msg.msgh_bits & 0x1F00) == 0x1100)
      mach_port_deallocate(*MEMORY[0x1E0C83DA0], msg.msgh_local_port);
    mach_msg_destroy(&msg);
  }
  return v2;
}

uint64_t _BKSHIDGetHumanPresenceStatus(mach_port_name_t a1, const char *a2, _DWORD *a3, _BYTE *a4, _DWORD *a5)
{
  int v9;
  mach_msg_size_t v10;
  mach_port_name_t special_reply_port;
  uint64_t v12;
  uint64_t v13;
  BOOL v14;
  mach_port_name_t rcv_name[4];
  __int128 v17;
  _OWORD v18[64];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  memset(v18, 0, 480);
  *(_OWORD *)rcv_name = 0u;
  v17 = 0u;
  *((_QWORD *)&v17 + 1) = *MEMORY[0x1E0C804E8];
  if (MEMORY[0x1E0C84128])
    v9 = mig_strncpy_zerofill((char *)v18 + 8, a2, 1024);
  else
    v9 = mig_strncpy((char *)v18 + 8, a2, 1024);
  LODWORD(v18[0]) = 0;
  DWORD1(v18[0]) = v9;
  v10 = ((v9 + 3) & 0xFFFFFFFC) + 40;
  special_reply_port = mig_get_special_reply_port();
  rcv_name[2] = a1;
  rcv_name[3] = special_reply_port;
  rcv_name[0] = 5395;
  *(_QWORD *)&v17 = 0x5B8DBE00000000;
  if (MEMORY[0x1E0C85B60])
  {
    voucher_mach_msg_set((mach_msg_header_t *)rcv_name);
    special_reply_port = rcv_name[3];
  }
  v12 = mach_msg((mach_msg_header_t *)rcv_name, 3162115, v10, 0x38u, special_reply_port, 0, 0);
  v13 = v12;
  if ((v12 - 268435458) > 0xE || ((1 << (v12 - 2)) & 0x4003) == 0)
  {
    if (!(_DWORD)v12)
    {
      if (DWORD1(v17) == 71)
      {
        v13 = 4294966988;
      }
      else if (DWORD1(v17) == 6000162)
      {
        if ((rcv_name[0] & 0x80000000) == 0)
        {
          if (rcv_name[1] == 48)
          {
            if (!rcv_name[2])
            {
              v13 = LODWORD(v18[0]);
              if (!LODWORD(v18[0]))
              {
                *a3 = DWORD1(v18[0]);
                *a4 = BYTE8(v18[0]);
                *a5 = HIDWORD(v18[0]);
                return v13;
              }
              goto LABEL_28;
            }
          }
          else if (rcv_name[1] == 36)
          {
            if (rcv_name[2])
              v14 = 1;
            else
              v14 = LODWORD(v18[0]) == 0;
            if (v14)
              v13 = 4294966996;
            else
              v13 = LODWORD(v18[0]);
            goto LABEL_28;
          }
        }
        v13 = 4294966996;
      }
      else
      {
        v13 = 4294966995;
      }
LABEL_28:
      mach_msg_destroy((mach_msg_header_t *)rcv_name);
      return v13;
    }
    mig_dealloc_special_reply_port();
  }
  if ((v13 - 268435459) <= 1)
  {
    if ((rcv_name[0] & 0x1F00) == 0x1100)
      mach_port_deallocate(*MEMORY[0x1E0C83DA0], rcv_name[3]);
    goto LABEL_28;
  }
  return v13;
}

uint64_t _BKSHIDIsCapsLockLightOn(int a1, uint64_t a2, _BYTE *a3)
{
  mach_port_name_t special_reply_port;
  uint64_t v6;
  uint64_t v7;
  BOOL v8;
  int msg;
  _BYTE msg_4[44];
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  memset(&msg_4[16], 0, 28);
  *(_OWORD *)msg_4 = 0u;
  *(_QWORD *)&msg_4[20] = *MEMORY[0x1E0C804E8];
  *(_QWORD *)&msg_4[28] = a2;
  special_reply_port = mig_get_special_reply_port();
  *(_DWORD *)&msg_4[4] = a1;
  *(_DWORD *)&msg_4[8] = special_reply_port;
  msg = 5395;
  *(_QWORD *)&msg_4[12] = 0x5B8DBF00000000;
  if (MEMORY[0x1E0C85B60])
  {
    voucher_mach_msg_set((mach_msg_header_t *)&msg);
    special_reply_port = *(_DWORD *)&msg_4[8];
  }
  v6 = mach_msg((mach_msg_header_t *)&msg, 3162115, 0x28u, 0x30u, special_reply_port, 0, 0);
  v7 = v6;
  if ((v6 - 268435458) > 0xE || ((1 << (v6 - 2)) & 0x4003) == 0)
  {
    if (!(_DWORD)v6)
    {
      if (*(_DWORD *)&msg_4[16] == 71)
      {
        v7 = 4294966988;
      }
      else if (*(_DWORD *)&msg_4[16] == 6000163)
      {
        if ((msg & 0x80000000) == 0)
        {
          if (*(_DWORD *)msg_4 == 40)
          {
            if (!*(_DWORD *)&msg_4[4])
            {
              v7 = *(unsigned int *)&msg_4[28];
              if (!*(_DWORD *)&msg_4[28])
              {
                *a3 = msg_4[32];
                return v7;
              }
              goto LABEL_25;
            }
          }
          else if (*(_DWORD *)msg_4 == 36)
          {
            if (*(_DWORD *)&msg_4[4])
              v8 = 1;
            else
              v8 = *(_DWORD *)&msg_4[28] == 0;
            if (v8)
              v7 = 4294966996;
            else
              v7 = *(unsigned int *)&msg_4[28];
            goto LABEL_25;
          }
        }
        v7 = 4294966996;
      }
      else
      {
        v7 = 4294966995;
      }
LABEL_25:
      mach_msg_destroy((mach_msg_header_t *)&msg);
      return v7;
    }
    mig_dealloc_special_reply_port();
  }
  if ((v7 - 268435459) <= 1)
  {
    if ((msg & 0x1F00) == 0x1100)
      mach_port_deallocate(*MEMORY[0x1E0C83DA0], *(mach_port_name_t *)&msg_4[8]);
    goto LABEL_25;
  }
  return v7;
}

uint64_t _BKSHIDSetCapsLockRomanSwitchMode(mach_port_t a1, uint64_t a2, char a3)
{
  uint64_t v3;
  mach_msg_header_t v5;
  uint64_t v6;
  uint64_t v7;
  char v8;
  __int16 v9;
  char v10;

  v6 = *MEMORY[0x1E0C804E8];
  v7 = a2;
  v8 = a3;
  v9 = 0;
  v10 = 0;
  *(_QWORD *)&v5.msgh_bits = 19;
  v5.msgh_voucher_port = 0;
  v5.msgh_id = 6000064;
  v5.msgh_remote_port = a1;
  v5.msgh_local_port = 0;
  if (MEMORY[0x1E0C85B60])
    voucher_mach_msg_set(&v5);
  v3 = mach_msg(&v5, 1, 0x2Cu, 0, 0, 0, 0);
  if ((v3 - 268435459) <= 1)
  {
    if ((v5.msgh_bits & 0x1F00) == 0x1100)
      mach_port_deallocate(*MEMORY[0x1E0C83DA0], v5.msgh_local_port);
    mach_msg_destroy(&v5);
  }
  return v3;
}

uint64_t _BKSHIDSetCapsLockDelayOverride(mach_port_t a1, uint64_t a2, double a3)
{
  uint64_t v3;
  mach_msg_header_t v5;
  uint64_t v6;
  uint64_t v7;
  double v8;

  v6 = *MEMORY[0x1E0C804E8];
  v7 = a2;
  v8 = a3;
  *(_QWORD *)&v5.msgh_bits = 19;
  v5.msgh_voucher_port = 0;
  v5.msgh_id = 6000065;
  v5.msgh_remote_port = a1;
  v5.msgh_local_port = 0;
  if (MEMORY[0x1E0C85B60])
    voucher_mach_msg_set(&v5);
  v3 = mach_msg(&v5, 1, 0x30u, 0, 0, 0, 0);
  if ((v3 - 268435459) <= 1)
  {
    if ((v5.msgh_bits & 0x1F00) == 0x1100)
      mach_port_deallocate(*MEMORY[0x1E0C83DA0], v5.msgh_local_port);
    mach_msg_destroy(&v5);
  }
  return v3;
}

uint64_t _BKSHIDSetStandardType(mach_port_t a1, uint64_t a2, int a3)
{
  uint64_t v3;
  mach_msg_header_t v5;
  uint64_t v6;
  uint64_t v7;
  int v8;

  v6 = *MEMORY[0x1E0C804E8];
  v7 = a2;
  v8 = a3;
  *(_QWORD *)&v5.msgh_bits = 19;
  v5.msgh_voucher_port = 0;
  v5.msgh_id = 6000066;
  v5.msgh_remote_port = a1;
  v5.msgh_local_port = 0;
  if (MEMORY[0x1E0C85B60])
    voucher_mach_msg_set(&v5);
  v3 = mach_msg(&v5, 1, 0x2Cu, 0, 0, 0, 0);
  if ((v3 - 268435459) <= 1)
  {
    if ((v5.msgh_bits & 0x1F00) == 0x1100)
      mach_port_deallocate(*MEMORY[0x1E0C83DA0], v5.msgh_local_port);
    mach_msg_destroy(&v5);
  }
  return v3;
}

uint64_t _BKSHIDSetCapsLockActive(mach_port_t a1, uint64_t a2, char a3)
{
  uint64_t v3;
  mach_msg_header_t v5;
  uint64_t v6;
  uint64_t v7;
  char v8;
  __int16 v9;
  char v10;

  v6 = *MEMORY[0x1E0C804E8];
  v7 = a2;
  v8 = a3;
  v9 = 0;
  v10 = 0;
  *(_QWORD *)&v5.msgh_bits = 19;
  v5.msgh_voucher_port = 0;
  v5.msgh_id = 6000067;
  v5.msgh_remote_port = a1;
  v5.msgh_local_port = 0;
  if (MEMORY[0x1E0C85B60])
    voucher_mach_msg_set(&v5);
  v3 = mach_msg(&v5, 1, 0x2Cu, 0, 0, 0, 0);
  if ((v3 - 268435459) <= 1)
  {
    if ((v5.msgh_bits & 0x1F00) == 0x1100)
      mach_port_deallocate(*MEMORY[0x1E0C83DA0], v5.msgh_local_port);
    mach_msg_destroy(&v5);
  }
  return v3;
}

uint64_t _BKSHIDKeyboardWantsStandardTypeOverride(int a1, uint64_t a2, _BYTE *a3)
{
  mach_port_name_t special_reply_port;
  uint64_t v6;
  uint64_t v7;
  BOOL v8;
  int msg;
  _BYTE msg_4[44];
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  memset(&msg_4[16], 0, 28);
  *(_OWORD *)msg_4 = 0u;
  *(_QWORD *)&msg_4[20] = *MEMORY[0x1E0C804E8];
  *(_QWORD *)&msg_4[28] = a2;
  special_reply_port = mig_get_special_reply_port();
  *(_DWORD *)&msg_4[4] = a1;
  *(_DWORD *)&msg_4[8] = special_reply_port;
  msg = 5395;
  *(_QWORD *)&msg_4[12] = 0x5B8DC400000000;
  if (MEMORY[0x1E0C85B60])
  {
    voucher_mach_msg_set((mach_msg_header_t *)&msg);
    special_reply_port = *(_DWORD *)&msg_4[8];
  }
  v6 = mach_msg((mach_msg_header_t *)&msg, 3162115, 0x28u, 0x30u, special_reply_port, 0, 0);
  v7 = v6;
  if ((v6 - 268435458) > 0xE || ((1 << (v6 - 2)) & 0x4003) == 0)
  {
    if (!(_DWORD)v6)
    {
      if (*(_DWORD *)&msg_4[16] == 71)
      {
        v7 = 4294966988;
      }
      else if (*(_DWORD *)&msg_4[16] == 6000168)
      {
        if ((msg & 0x80000000) == 0)
        {
          if (*(_DWORD *)msg_4 == 40)
          {
            if (!*(_DWORD *)&msg_4[4])
            {
              v7 = *(unsigned int *)&msg_4[28];
              if (!*(_DWORD *)&msg_4[28])
              {
                *a3 = msg_4[32];
                return v7;
              }
              goto LABEL_25;
            }
          }
          else if (*(_DWORD *)msg_4 == 36)
          {
            if (*(_DWORD *)&msg_4[4])
              v8 = 1;
            else
              v8 = *(_DWORD *)&msg_4[28] == 0;
            if (v8)
              v7 = 4294966996;
            else
              v7 = *(unsigned int *)&msg_4[28];
            goto LABEL_25;
          }
        }
        v7 = 4294966996;
      }
      else
      {
        v7 = 4294966995;
      }
LABEL_25:
      mach_msg_destroy((mach_msg_header_t *)&msg);
      return v7;
    }
    mig_dealloc_special_reply_port();
  }
  if ((v7 - 268435459) <= 1)
  {
    if ((msg & 0x1F00) == 0x1100)
      mach_port_deallocate(*MEMORY[0x1E0C83DA0], *(mach_port_name_t *)&msg_4[8]);
    goto LABEL_25;
  }
  return v7;
}

uint64_t _BKSHIDSetHardwareKeyboardLayout(mach_port_name_t a1, uint64_t a2, char *src)
{
  int v4;
  mach_msg_size_t v5;
  uint64_t v6;
  mach_port_name_t name[4];
  __int128 v9;
  __int128 v10;
  _OWORD v11[64];
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v10 = 0u;
  memset(v11, 0, 464);
  *(_OWORD *)name = 0u;
  v9 = 0u;
  *((_QWORD *)&v9 + 1) = *MEMORY[0x1E0C804E8];
  *(_QWORD *)&v10 = a2;
  if (MEMORY[0x1E0C84128])
    v4 = mig_strncpy_zerofill((char *)v11, src, 1024);
  else
    v4 = mig_strncpy((char *)v11, src, 1024);
  DWORD2(v10) = 0;
  HIDWORD(v10) = v4;
  v5 = ((v4 + 3) & 0xFFFFFFFC) + 48;
  name[0] = 19;
  name[2] = a1;
  name[3] = 0;
  *(_QWORD *)&v9 = 0x5B8DC500000000;
  if (MEMORY[0x1E0C85B60])
    voucher_mach_msg_set((mach_msg_header_t *)name);
  v6 = mach_msg((mach_msg_header_t *)name, 1, v5, 0, 0, 0, 0);
  if ((v6 - 268435459) <= 1)
  {
    if ((name[0] & 0x1F00) == 0x1100)
      mach_port_deallocate(*MEMORY[0x1E0C83DA0], name[3]);
    mach_msg_destroy((mach_msg_header_t *)name);
  }
  return v6;
}

uint64_t _BKSHIDSetAuthenticatedKeyCommands(int a1, uint64_t a2, int a3)
{
  uint64_t v3;
  _BYTE msg[28];
  uint64_t v6;
  int v7;
  int v8;
  uint64_t v9;
  int v10;

  v6 = a2;
  v7 = 16777472;
  v8 = a3;
  v9 = *MEMORY[0x1E0C804E8];
  v10 = a3;
  *(_QWORD *)msg = 2147483667;
  *(_DWORD *)&msg[8] = a1;
  *(_OWORD *)&msg[12] = xmmword_18A161460;
  if (MEMORY[0x1E0C85B60])
    voucher_mach_msg_set((mach_msg_header_t *)msg);
  v3 = mach_msg((mach_msg_header_t *)msg, 1, 0x38u, 0, 0, 0, 0);
  if ((v3 - 268435459) <= 1)
  {
    if ((*(_WORD *)msg & 0x1F00) == 0x1100)
      mach_port_deallocate(*MEMORY[0x1E0C83DA0], *(mach_port_name_t *)&msg[12]);
    mach_msg_destroy((mach_msg_header_t *)msg);
  }
  return v3;
}

uint64_t _BKSHIDGetEventResolutionDescription(mach_port_t a1, uint64_t a2, int a3, uint64_t a4, int a5, _QWORD *a6, _DWORD *a7)
{
  mach_port_t special_reply_port;
  uint64_t v11;
  uint64_t v12;
  int v13;
  mach_msg_header_t v15;
  int v16;
  uint64_t v17;
  int v18;
  int v19;
  uint64_t v20;
  int v21;
  int v22;
  uint64_t v23;
  int v24;
  int v25;

  v16 = 2;
  v17 = a2;
  v18 = 16777472;
  v19 = a3;
  v20 = a4;
  v21 = 16777472;
  v22 = a5;
  v23 = *MEMORY[0x1E0C804E8];
  v24 = a3;
  v25 = a5;
  special_reply_port = mig_get_special_reply_port();
  *(_QWORD *)&v15.msgh_bits = 2147489043;
  v15.msgh_remote_port = a1;
  v15.msgh_local_port = special_reply_port;
  *(_QWORD *)&v15.msgh_voucher_port = 0x5B8DC700000000;
  if (MEMORY[0x1E0C85B60])
  {
    voucher_mach_msg_set(&v15);
    special_reply_port = v15.msgh_local_port;
  }
  v11 = mach_msg(&v15, 3162115, 0x4Cu, 0x40u, special_reply_port, 0, 0);
  v12 = v11;
  if ((v11 - 268435458) > 0xE || ((1 << (v11 - 2)) & 0x4003) == 0)
  {
    if (!(_DWORD)v11)
    {
      if (v15.msgh_id == 71)
      {
        v12 = 4294966988;
      }
      else if (v15.msgh_id == 6000171)
      {
        if ((v15.msgh_bits & 0x80000000) == 0)
        {
          if (v15.msgh_size == 36)
          {
            v12 = 4294966996;
            if (HIDWORD(v17))
            {
              if (v15.msgh_remote_port)
                v12 = 4294966996;
              else
                v12 = HIDWORD(v17);
            }
          }
          else
          {
            v12 = 4294966996;
          }
          goto LABEL_26;
        }
        v12 = 4294966996;
        if (v16 == 1 && *(_QWORD *)&v15.msgh_size == 56 && HIBYTE(v18) == 1)
        {
          v13 = v19;
          if (v19 == v21)
          {
            v12 = 0;
            *a6 = v17;
            *a7 = v13;
            return v12;
          }
        }
      }
      else
      {
        v12 = 4294966995;
      }
LABEL_26:
      mach_msg_destroy(&v15);
      return v12;
    }
    mig_dealloc_special_reply_port();
  }
  if ((v12 - 268435459) <= 1)
  {
    if ((v15.msgh_bits & 0x1F00) == 0x1100)
      mach_port_deallocate(*MEMORY[0x1E0C83DA0], v15.msgh_local_port);
    goto LABEL_26;
  }
  return v12;
}

uint64_t _BKSHIDGetKeyCommandResolutionDescription(mach_port_t a1, uint64_t a2, int a3, uint64_t a4, int a5, _QWORD *a6, _DWORD *a7)
{
  mach_port_t special_reply_port;
  uint64_t v11;
  uint64_t v12;
  int v13;
  mach_msg_header_t v15;
  int v16;
  uint64_t v17;
  int v18;
  int v19;
  uint64_t v20;
  int v21;
  int v22;
  uint64_t v23;
  int v24;
  int v25;

  v16 = 2;
  v17 = a2;
  v18 = 16777472;
  v19 = a3;
  v20 = a4;
  v21 = 16777472;
  v22 = a5;
  v23 = *MEMORY[0x1E0C804E8];
  v24 = a3;
  v25 = a5;
  special_reply_port = mig_get_special_reply_port();
  *(_QWORD *)&v15.msgh_bits = 2147489043;
  v15.msgh_remote_port = a1;
  v15.msgh_local_port = special_reply_port;
  *(_QWORD *)&v15.msgh_voucher_port = 0x5B8DC800000000;
  if (MEMORY[0x1E0C85B60])
  {
    voucher_mach_msg_set(&v15);
    special_reply_port = v15.msgh_local_port;
  }
  v11 = mach_msg(&v15, 3162115, 0x4Cu, 0x40u, special_reply_port, 0, 0);
  v12 = v11;
  if ((v11 - 268435458) > 0xE || ((1 << (v11 - 2)) & 0x4003) == 0)
  {
    if (!(_DWORD)v11)
    {
      if (v15.msgh_id == 71)
      {
        v12 = 4294966988;
      }
      else if (v15.msgh_id == 6000172)
      {
        if ((v15.msgh_bits & 0x80000000) == 0)
        {
          if (v15.msgh_size == 36)
          {
            v12 = 4294966996;
            if (HIDWORD(v17))
            {
              if (v15.msgh_remote_port)
                v12 = 4294966996;
              else
                v12 = HIDWORD(v17);
            }
          }
          else
          {
            v12 = 4294966996;
          }
          goto LABEL_26;
        }
        v12 = 4294966996;
        if (v16 == 1 && *(_QWORD *)&v15.msgh_size == 56 && HIBYTE(v18) == 1)
        {
          v13 = v19;
          if (v19 == v21)
          {
            v12 = 0;
            *a6 = v17;
            *a7 = v13;
            return v12;
          }
        }
      }
      else
      {
        v12 = 4294966995;
      }
LABEL_26:
      mach_msg_destroy(&v15);
      return v12;
    }
    mig_dealloc_special_reply_port();
  }
  if ((v12 - 268435459) <= 1)
  {
    if ((v15.msgh_bits & 0x1F00) == 0x1100)
      mach_port_deallocate(*MEMORY[0x1E0C83DA0], v15.msgh_local_port);
    goto LABEL_26;
  }
  return v12;
}

uint64_t _BKSHIDSetPersistentServiceProperties(int a1, uint64_t a2, int a3, uint64_t a4, int a5)
{
  uint64_t v5;
  uint64_t v7;
  int v8;
  mach_port_name_t name[4];
  uint64_t v10;
  int v11;
  int v12;
  uint64_t v13;
  int v14;
  int v15;
  uint64_t v16;
  int v17;
  int v18;

  v10 = a2;
  v11 = 16777472;
  v12 = a3;
  v13 = a4;
  v14 = 16777472;
  v15 = a5;
  v16 = *MEMORY[0x1E0C804E8];
  v17 = a3;
  v18 = a5;
  v7 = 2147483667;
  v8 = a1;
  *(_OWORD *)name = xmmword_18A161470;
  if (MEMORY[0x1E0C85B60])
    voucher_mach_msg_set((mach_msg_header_t *)&v7);
  v5 = mach_msg((mach_msg_header_t *)&v7, 1, 0x4Cu, 0, 0, 0, 0);
  if ((v5 - 268435459) <= 1)
  {
    if ((v7 & 0x1F00) == 0x1100)
      mach_port_deallocate(*MEMORY[0x1E0C83DA0], name[0]);
    mach_msg_destroy((mach_msg_header_t *)&v7);
  }
  return v5;
}

uint64_t _BKSHIDGetPersistentServiceProperties(mach_port_t a1, uint64_t a2, int a3, uint64_t a4, int a5, _QWORD *a6, _DWORD *a7)
{
  mach_port_t special_reply_port;
  uint64_t v11;
  uint64_t v12;
  int v13;
  mach_msg_header_t v15;
  int v16;
  uint64_t v17;
  int v18;
  int v19;
  uint64_t v20;
  int v21;
  int v22;
  uint64_t v23;
  int v24;
  int v25;

  v16 = 2;
  v17 = a2;
  v18 = 16777472;
  v19 = a3;
  v20 = a4;
  v21 = 16777472;
  v22 = a5;
  v23 = *MEMORY[0x1E0C804E8];
  v24 = a3;
  v25 = a5;
  special_reply_port = mig_get_special_reply_port();
  *(_QWORD *)&v15.msgh_bits = 2147489043;
  v15.msgh_remote_port = a1;
  v15.msgh_local_port = special_reply_port;
  *(_QWORD *)&v15.msgh_voucher_port = 0x5B8DCA00000000;
  if (MEMORY[0x1E0C85B60])
  {
    voucher_mach_msg_set(&v15);
    special_reply_port = v15.msgh_local_port;
  }
  v11 = mach_msg(&v15, 3162115, 0x4Cu, 0x40u, special_reply_port, 0, 0);
  v12 = v11;
  if ((v11 - 268435458) > 0xE || ((1 << (v11 - 2)) & 0x4003) == 0)
  {
    if (!(_DWORD)v11)
    {
      if (v15.msgh_id == 71)
      {
        v12 = 4294966988;
      }
      else if (v15.msgh_id == 6000174)
      {
        if ((v15.msgh_bits & 0x80000000) == 0)
        {
          if (v15.msgh_size == 36)
          {
            v12 = 4294966996;
            if (HIDWORD(v17))
            {
              if (v15.msgh_remote_port)
                v12 = 4294966996;
              else
                v12 = HIDWORD(v17);
            }
          }
          else
          {
            v12 = 4294966996;
          }
          goto LABEL_26;
        }
        v12 = 4294966996;
        if (v16 == 1 && *(_QWORD *)&v15.msgh_size == 56 && HIBYTE(v18) == 1)
        {
          v13 = v19;
          if (v19 == v21)
          {
            v12 = 0;
            *a6 = v17;
            *a7 = v13;
            return v12;
          }
        }
      }
      else
      {
        v12 = 4294966995;
      }
LABEL_26:
      mach_msg_destroy(&v15);
      return v12;
    }
    mig_dealloc_special_reply_port();
  }
  if ((v12 - 268435459) <= 1)
  {
    if ((v15.msgh_bits & 0x1F00) == 0x1100)
      mach_port_deallocate(*MEMORY[0x1E0C83DA0], v15.msgh_local_port);
    goto LABEL_26;
  }
  return v12;
}

uint64_t _BKSHIDVerifyEventAuthenticationMessage(mach_port_t a1, uint64_t a2, int a3, int *a4)
{
  mach_port_t special_reply_port;
  uint64_t v7;
  uint64_t v8;
  BOOL v9;
  mach_msg_header_t v11;
  int v12;
  uint64_t v13;
  int v14;
  int v15;
  uint64_t v16;
  int v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v12 = 1;
  v13 = a2;
  v14 = 16777472;
  v15 = a3;
  v16 = *MEMORY[0x1E0C804E8];
  v17 = a3;
  special_reply_port = mig_get_special_reply_port();
  *(_QWORD *)&v11.msgh_bits = 2147489043;
  v11.msgh_remote_port = a1;
  v11.msgh_local_port = special_reply_port;
  *(_QWORD *)&v11.msgh_voucher_port = 0x5B8DCB00000000;
  if (MEMORY[0x1E0C85B60])
  {
    voucher_mach_msg_set(&v11);
    special_reply_port = v11.msgh_local_port;
  }
  v7 = mach_msg(&v11, 3162115, 0x38u, 0x30u, special_reply_port, 0, 0);
  v8 = v7;
  if ((v7 - 268435458) > 0xE || ((1 << (v7 - 2)) & 0x4003) == 0)
  {
    if (!(_DWORD)v7)
    {
      if (v11.msgh_id == 71)
      {
        v8 = 4294966988;
      }
      else if (v11.msgh_id == 6000175)
      {
        if ((v11.msgh_bits & 0x80000000) == 0)
        {
          if (v11.msgh_size == 40)
          {
            if (!v11.msgh_remote_port)
            {
              v8 = HIDWORD(v13);
              if (!HIDWORD(v13))
              {
                *a4 = v14;
                return v8;
              }
              goto LABEL_25;
            }
          }
          else if (v11.msgh_size == 36)
          {
            if (v11.msgh_remote_port)
              v9 = 1;
            else
              v9 = HIDWORD(v13) == 0;
            if (v9)
              v8 = 4294966996;
            else
              v8 = HIDWORD(v13);
            goto LABEL_25;
          }
        }
        v8 = 4294966996;
      }
      else
      {
        v8 = 4294966995;
      }
LABEL_25:
      mach_msg_destroy(&v11);
      return v8;
    }
    mig_dealloc_special_reply_port();
  }
  if ((v8 - 268435459) <= 1)
  {
    if ((v11.msgh_bits & 0x1F00) == 0x1100)
      mach_port_deallocate(*MEMORY[0x1E0C83DA0], v11.msgh_local_port);
    goto LABEL_25;
  }
  return v8;
}

uint64_t _BKSHIDTouchAddAuthenticationSpecifications(int a1, uint64_t a2, int a3)
{
  uint64_t v3;
  _BYTE msg[28];
  uint64_t v6;
  int v7;
  int v8;
  uint64_t v9;
  int v10;

  v6 = a2;
  v7 = 16777472;
  v8 = a3;
  v9 = *MEMORY[0x1E0C804E8];
  v10 = a3;
  *(_QWORD *)msg = 2147483667;
  *(_DWORD *)&msg[8] = a1;
  *(_OWORD *)&msg[12] = xmmword_18A161480;
  if (MEMORY[0x1E0C85B60])
    voucher_mach_msg_set((mach_msg_header_t *)msg);
  v3 = mach_msg((mach_msg_header_t *)msg, 1, 0x38u, 0, 0, 0, 0);
  if ((v3 - 268435459) <= 1)
  {
    if ((*(_WORD *)msg & 0x1F00) == 0x1100)
      mach_port_deallocate(*MEMORY[0x1E0C83DA0], *(mach_port_name_t *)&msg[12]);
    mach_msg_destroy((mach_msg_header_t *)msg);
  }
  return v3;
}

uint64_t _BKSHIDRequestUISensorMode(int a1, uint64_t a2, int a3)
{
  uint64_t v3;
  _BYTE msg[28];
  uint64_t v6;
  int v7;
  int v8;
  uint64_t v9;
  int v10;

  v6 = a2;
  v7 = 16777472;
  v8 = a3;
  v9 = *MEMORY[0x1E0C804E8];
  v10 = a3;
  *(_QWORD *)msg = 2147483667;
  *(_DWORD *)&msg[8] = a1;
  *(_OWORD *)&msg[12] = xmmword_18A161490;
  if (MEMORY[0x1E0C85B60])
    voucher_mach_msg_set((mach_msg_header_t *)msg);
  v3 = mach_msg((mach_msg_header_t *)msg, 1, 0x38u, 0, 0, 0, 0);
  if ((v3 - 268435459) <= 1)
  {
    if ((*(_WORD *)msg & 0x1F00) == 0x1100)
      mach_port_deallocate(*MEMORY[0x1E0C83DA0], *(mach_port_name_t *)&msg[12]);
    mach_msg_destroy((mach_msg_header_t *)msg);
  }
  return v3;
}

uint64_t _BKSHIDGetUISensorCharacteristics(int a1, _QWORD *a2, _DWORD *a3)
{
  mach_port_name_t special_reply_port;
  uint64_t v7;
  uint64_t v8;
  int v9;
  int msg;
  int msg_4;
  int msg_8;
  mach_port_name_t msg_12;
  _BYTE msg_16[48];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  memset(&msg_16[4], 0, 44);
  msg_4 = 0;
  special_reply_port = mig_get_special_reply_port();
  msg_8 = a1;
  msg_12 = special_reply_port;
  msg = 5395;
  *(_QWORD *)msg_16 = 0x5B8DCE00000000;
  if (MEMORY[0x1E0C85B60])
  {
    voucher_mach_msg_set((mach_msg_header_t *)&msg);
    special_reply_port = msg_12;
  }
  v7 = mach_msg((mach_msg_header_t *)&msg, 3162115, 0x18u, 0x40u, special_reply_port, 0, 0);
  v8 = v7;
  if ((v7 - 268435458) > 0xE || ((1 << (v7 - 2)) & 0x4003) == 0)
  {
    if (!(_DWORD)v7)
    {
      if (*(_DWORD *)&msg_16[4] == 71)
      {
        v8 = 4294966988;
      }
      else if (*(_DWORD *)&msg_16[4] == 6000178)
      {
        if ((msg & 0x80000000) == 0)
        {
          if (msg_4 == 36)
          {
            v8 = 4294966996;
            if (*(_DWORD *)&msg_16[16])
            {
              if (msg_8)
                v8 = 4294966996;
              else
                v8 = *(unsigned int *)&msg_16[16];
            }
          }
          else
          {
            v8 = 4294966996;
          }
          goto LABEL_27;
        }
        v8 = 4294966996;
        if (*(_DWORD *)&msg_16[8] == 1 && msg_4 == 56 && !msg_8 && msg_16[23] == 1)
        {
          v9 = *(_DWORD *)&msg_16[24];
          if (*(_DWORD *)&msg_16[24] == *(_DWORD *)&msg_16[36])
          {
            v8 = 0;
            *a2 = *(_QWORD *)&msg_16[12];
            *a3 = v9;
            return v8;
          }
        }
      }
      else
      {
        v8 = 4294966995;
      }
LABEL_27:
      mach_msg_destroy((mach_msg_header_t *)&msg);
      return v8;
    }
    mig_dealloc_special_reply_port();
  }
  if ((v8 - 268435459) <= 1)
  {
    if ((msg & 0x1F00) == 0x1100)
      mach_port_deallocate(*MEMORY[0x1E0C83DA0], msg_12);
    goto LABEL_27;
  }
  return v8;
}

uint64_t _BKSHIDTouchSensitiveButtonSetScanMode(mach_port_t a1, int a2, int a3)
{
  uint64_t v3;
  mach_msg_header_t msg;
  uint64_t v6;
  int v7;
  int v8;

  v6 = *MEMORY[0x1E0C804E8];
  v7 = a2;
  v8 = a3;
  *(_QWORD *)&msg.msgh_bits = 19;
  msg.msgh_voucher_port = 0;
  msg.msgh_id = 6000079;
  msg.msgh_remote_port = a1;
  msg.msgh_local_port = 0;
  if (MEMORY[0x1E0C85B60])
    voucher_mach_msg_set(&msg);
  v3 = mach_msg(&msg, 1, 0x28u, 0, 0, 0, 0);
  if ((v3 - 268435459) <= 1)
  {
    if ((msg.msgh_bits & 0x1F00) == 0x1100)
      mach_port_deallocate(*MEMORY[0x1E0C83DA0], msg.msgh_local_port);
    mach_msg_destroy(&msg);
  }
  return v3;
}

uint64_t _BKSDisplayIsDisabled(mach_port_name_t a1, const char *a2, _BYTE *a3)
{
  int v5;
  mach_msg_size_t v6;
  mach_port_name_t special_reply_port;
  uint64_t v8;
  uint64_t v9;
  BOOL v10;
  mach_port_name_t rcv_name[4];
  __int128 v13;
  _OWORD v14[64];
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  memset(v14, 0, 480);
  *(_OWORD *)rcv_name = 0u;
  v13 = 0u;
  *((_QWORD *)&v13 + 1) = *MEMORY[0x1E0C804E8];
  if (MEMORY[0x1E0C84128])
    v5 = mig_strncpy_zerofill((char *)v14 + 8, a2, 1024);
  else
    v5 = mig_strncpy((char *)v14 + 8, a2, 1024);
  LODWORD(v14[0]) = 0;
  DWORD1(v14[0]) = v5;
  v6 = ((v5 + 3) & 0xFFFFFFFC) + 40;
  special_reply_port = mig_get_special_reply_port();
  rcv_name[2] = a1;
  rcv_name[3] = special_reply_port;
  rcv_name[0] = 5395;
  *(_QWORD *)&v13 = 0x5B916800000000;
  if (MEMORY[0x1E0C85B60])
  {
    voucher_mach_msg_set((mach_msg_header_t *)rcv_name);
    special_reply_port = rcv_name[3];
  }
  v8 = mach_msg((mach_msg_header_t *)rcv_name, 3162115, v6, 0x30u, special_reply_port, 0, 0);
  v9 = v8;
  if ((v8 - 268435458) > 0xE || ((1 << (v8 - 2)) & 0x4003) == 0)
  {
    if (!(_DWORD)v8)
    {
      if (DWORD1(v13) == 71)
      {
        v9 = 4294966988;
      }
      else if (DWORD1(v13) == 6001100)
      {
        if ((rcv_name[0] & 0x80000000) == 0)
        {
          if (rcv_name[1] == 40)
          {
            if (!rcv_name[2])
            {
              v9 = LODWORD(v14[0]);
              if (!LODWORD(v14[0]))
              {
                *a3 = BYTE4(v14[0]);
                return v9;
              }
              goto LABEL_28;
            }
          }
          else if (rcv_name[1] == 36)
          {
            if (rcv_name[2])
              v10 = 1;
            else
              v10 = LODWORD(v14[0]) == 0;
            if (v10)
              v9 = 4294966996;
            else
              v9 = LODWORD(v14[0]);
            goto LABEL_28;
          }
        }
        v9 = 4294966996;
      }
      else
      {
        v9 = 4294966995;
      }
LABEL_28:
      mach_msg_destroy((mach_msg_header_t *)rcv_name);
      return v9;
    }
    mig_dealloc_special_reply_port();
  }
  if ((v9 - 268435459) <= 1)
  {
    if ((rcv_name[0] & 0x1F00) == 0x1100)
      mach_port_deallocate(*MEMORY[0x1E0C83DA0], rcv_name[3]);
    goto LABEL_28;
  }
  return v9;
}

uint64_t _BKSDisplaySetDisabled(mach_port_name_t a1, const char *a2, char a3, _BYTE *a4)
{
  int v7;
  uint64_t v8;
  char *v9;
  mach_msg_size_t v10;
  mach_port_name_t special_reply_port;
  uint64_t v12;
  uint64_t v13;
  BOOL v14;
  mach_port_name_t rcv_name[4];
  __int128 v17;
  _OWORD v18[65];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  memset(v18, 0, 480);
  *(_OWORD *)rcv_name = 0u;
  v17 = 0u;
  *((_QWORD *)&v17 + 1) = *MEMORY[0x1E0C804E8];
  if (MEMORY[0x1E0C84128])
    v7 = mig_strncpy_zerofill((char *)v18 + 8, a2, 1024);
  else
    v7 = mig_strncpy((char *)v18 + 8, a2, 1024);
  LODWORD(v18[0]) = 0;
  DWORD1(v18[0]) = v7;
  v8 = (v7 + 3) & 0xFFFFFFFC;
  v9 = (char *)rcv_name + v8;
  v9[40] = a3;
  *(_WORD *)(v9 + 41) = 0;
  v9[43] = 0;
  v10 = v8 + 44;
  special_reply_port = mig_get_special_reply_port();
  rcv_name[2] = a1;
  rcv_name[3] = special_reply_port;
  rcv_name[0] = 5395;
  *(_QWORD *)&v17 = 0x5B916900000000;
  if (MEMORY[0x1E0C85B60])
  {
    voucher_mach_msg_set((mach_msg_header_t *)rcv_name);
    special_reply_port = rcv_name[3];
  }
  v12 = mach_msg((mach_msg_header_t *)rcv_name, 3162115, v10, 0x30u, special_reply_port, 0, 0);
  v13 = v12;
  if ((v12 - 268435458) > 0xE || ((1 << (v12 - 2)) & 0x4003) == 0)
  {
    if (!(_DWORD)v12)
    {
      if (DWORD1(v17) == 71)
      {
        v13 = 4294966988;
      }
      else if (DWORD1(v17) == 6001101)
      {
        if ((rcv_name[0] & 0x80000000) == 0)
        {
          if (rcv_name[1] == 40)
          {
            if (!rcv_name[2])
            {
              v13 = LODWORD(v18[0]);
              if (!LODWORD(v18[0]))
              {
                *a4 = BYTE4(v18[0]);
                return v13;
              }
              goto LABEL_28;
            }
          }
          else if (rcv_name[1] == 36)
          {
            if (rcv_name[2])
              v14 = 1;
            else
              v14 = LODWORD(v18[0]) == 0;
            if (v14)
              v13 = 4294966996;
            else
              v13 = LODWORD(v18[0]);
            goto LABEL_28;
          }
        }
        v13 = 4294966996;
      }
      else
      {
        v13 = 4294966995;
      }
LABEL_28:
      mach_msg_destroy((mach_msg_header_t *)rcv_name);
      return v13;
    }
    mig_dealloc_special_reply_port();
  }
  if ((v13 - 268435459) <= 1)
  {
    if ((rcv_name[0] & 0x1F00) == 0x1100)
      mach_port_deallocate(*MEMORY[0x1E0C83DA0], rcv_name[3]);
    goto LABEL_28;
  }
  return v13;
}

uint64_t _BKSDisplayNotifySetDisplayBlanked(mach_port_name_t a1, const char *a2, char a3, char a4)
{
  int v7;
  uint64_t v8;
  char *v9;
  mach_msg_size_t v10;
  uint64_t v11;
  mach_port_name_t name[4];
  __int128 v14;
  _OWORD v15[65];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  memset(v15, 0, 480);
  *(_OWORD *)name = 0u;
  v14 = 0u;
  *((_QWORD *)&v14 + 1) = *MEMORY[0x1E0C804E8];
  if (MEMORY[0x1E0C84128])
    v7 = mig_strncpy_zerofill((char *)v15 + 8, a2, 1024);
  else
    v7 = mig_strncpy((char *)v15 + 8, a2, 1024);
  LODWORD(v15[0]) = 0;
  DWORD1(v15[0]) = v7;
  v8 = (v7 + 3) & 0xFFFFFFFC;
  v9 = (char *)name + v8;
  v9[40] = a3;
  *(_WORD *)(v9 + 41) = 0;
  v9[43] = 0;
  v9[44] = a4;
  *(_WORD *)(v9 + 45) = 0;
  v9[47] = 0;
  v10 = v8 + 48;
  name[0] = 19;
  name[2] = a1;
  name[3] = 0;
  *(_QWORD *)&v14 = 0x5B916A00000000;
  if (MEMORY[0x1E0C85B60])
    voucher_mach_msg_set((mach_msg_header_t *)name);
  v11 = mach_msg((mach_msg_header_t *)name, 1, v10, 0, 0, 0, 0);
  if ((v11 - 268435459) <= 1)
  {
    if ((name[0] & 0x1F00) == 0x1100)
      mach_port_deallocate(*MEMORY[0x1E0C83DA0], name[3]);
    mach_msg_destroy((mach_msg_header_t *)name);
  }
  return v11;
}

uint64_t _BKSDisplayWillUnblank(mach_port_name_t a1, const char *a2)
{
  int v3;
  mach_msg_size_t v4;
  uint64_t v5;
  mach_port_name_t name[4];
  __int128 v8;
  _OWORD v9[64];
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  memset(v9, 0, 480);
  *(_OWORD *)name = 0u;
  v8 = 0u;
  *((_QWORD *)&v8 + 1) = *MEMORY[0x1E0C804E8];
  if (MEMORY[0x1E0C84128])
    v3 = mig_strncpy_zerofill((char *)v9 + 8, a2, 1024);
  else
    v3 = mig_strncpy((char *)v9 + 8, a2, 1024);
  LODWORD(v9[0]) = 0;
  DWORD1(v9[0]) = v3;
  v4 = ((v3 + 3) & 0xFFFFFFFC) + 40;
  name[0] = 19;
  name[2] = a1;
  name[3] = 0;
  *(_QWORD *)&v8 = 0x5B916B00000000;
  if (MEMORY[0x1E0C85B60])
    voucher_mach_msg_set((mach_msg_header_t *)name);
  v5 = mach_msg((mach_msg_header_t *)name, 1, v4, 0, 0, 0, 0);
  if ((v5 - 268435459) <= 1)
  {
    if ((name[0] & 0x1F00) == 0x1100)
      mach_port_deallocate(*MEMORY[0x1E0C83DA0], name[3]);
    mach_msg_destroy((mach_msg_header_t *)name);
  }
  return v5;
}

uint64_t _BKSDisplayGetBlankingRemovesPower(mach_port_name_t a1, const char *a2, _BYTE *a3)
{
  int v5;
  mach_msg_size_t v6;
  mach_port_name_t special_reply_port;
  uint64_t v8;
  uint64_t v9;
  BOOL v10;
  mach_port_name_t rcv_name[4];
  __int128 v13;
  _OWORD v14[64];
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  memset(v14, 0, 480);
  *(_OWORD *)rcv_name = 0u;
  v13 = 0u;
  *((_QWORD *)&v13 + 1) = *MEMORY[0x1E0C804E8];
  if (MEMORY[0x1E0C84128])
    v5 = mig_strncpy_zerofill((char *)v14 + 8, a2, 1024);
  else
    v5 = mig_strncpy((char *)v14 + 8, a2, 1024);
  LODWORD(v14[0]) = 0;
  DWORD1(v14[0]) = v5;
  v6 = ((v5 + 3) & 0xFFFFFFFC) + 40;
  special_reply_port = mig_get_special_reply_port();
  rcv_name[2] = a1;
  rcv_name[3] = special_reply_port;
  rcv_name[0] = 5395;
  *(_QWORD *)&v13 = 0x5B916C00000000;
  if (MEMORY[0x1E0C85B60])
  {
    voucher_mach_msg_set((mach_msg_header_t *)rcv_name);
    special_reply_port = rcv_name[3];
  }
  v8 = mach_msg((mach_msg_header_t *)rcv_name, 3162115, v6, 0x30u, special_reply_port, 0, 0);
  v9 = v8;
  if ((v8 - 268435458) > 0xE || ((1 << (v8 - 2)) & 0x4003) == 0)
  {
    if (!(_DWORD)v8)
    {
      if (DWORD1(v13) == 71)
      {
        v9 = 4294966988;
      }
      else if (DWORD1(v13) == 6001104)
      {
        if ((rcv_name[0] & 0x80000000) == 0)
        {
          if (rcv_name[1] == 40)
          {
            if (!rcv_name[2])
            {
              v9 = LODWORD(v14[0]);
              if (!LODWORD(v14[0]))
              {
                *a3 = BYTE4(v14[0]);
                return v9;
              }
              goto LABEL_28;
            }
          }
          else if (rcv_name[1] == 36)
          {
            if (rcv_name[2])
              v10 = 1;
            else
              v10 = LODWORD(v14[0]) == 0;
            if (v10)
              v9 = 4294966996;
            else
              v9 = LODWORD(v14[0]);
            goto LABEL_28;
          }
        }
        v9 = 4294966996;
      }
      else
      {
        v9 = 4294966995;
      }
LABEL_28:
      mach_msg_destroy((mach_msg_header_t *)rcv_name);
      return v9;
    }
    mig_dealloc_special_reply_port();
  }
  if ((v9 - 268435459) <= 1)
  {
    if ((rcv_name[0] & 0x1F00) == 0x1100)
      mach_port_deallocate(*MEMORY[0x1E0C83DA0], rcv_name[3]);
    goto LABEL_28;
  }
  return v9;
}

uint64_t _BKSDisplaySetBlankingRemovesPower(mach_port_name_t a1, const char *a2, char a3)
{
  int v5;
  uint64_t v6;
  char *v7;
  mach_msg_size_t v8;
  mach_port_name_t special_reply_port;
  uint64_t v10;
  uint64_t v11;
  mach_port_name_t rcv_name[4];
  __int128 v14;
  _OWORD v15[65];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  memset(v15, 0, 480);
  *(_OWORD *)rcv_name = 0u;
  v14 = 0u;
  *((_QWORD *)&v14 + 1) = *MEMORY[0x1E0C804E8];
  if (MEMORY[0x1E0C84128])
    v5 = mig_strncpy_zerofill((char *)v15 + 8, a2, 1024);
  else
    v5 = mig_strncpy((char *)v15 + 8, a2, 1024);
  LODWORD(v15[0]) = 0;
  DWORD1(v15[0]) = v5;
  v6 = (v5 + 3) & 0xFFFFFFFC;
  v7 = (char *)rcv_name + v6;
  v7[40] = a3;
  *(_WORD *)(v7 + 41) = 0;
  v7[43] = 0;
  v8 = v6 + 44;
  special_reply_port = mig_get_special_reply_port();
  rcv_name[2] = a1;
  rcv_name[3] = special_reply_port;
  rcv_name[0] = 5395;
  *(_QWORD *)&v14 = 0x5B916D00000000;
  if (MEMORY[0x1E0C85B60])
  {
    voucher_mach_msg_set((mach_msg_header_t *)rcv_name);
    special_reply_port = rcv_name[3];
  }
  v10 = mach_msg((mach_msg_header_t *)rcv_name, 3162115, v8, 0x2Cu, special_reply_port, 0, 0);
  v11 = v10;
  if ((v10 - 268435458) <= 0xE && ((1 << (v10 - 2)) & 0x4003) != 0)
    goto LABEL_17;
  if ((_DWORD)v10)
  {
    mig_dealloc_special_reply_port();
LABEL_17:
    if ((v11 - 268435459) > 1)
      return v11;
    if ((rcv_name[0] & 0x1F00) == 0x1100)
      mach_port_deallocate(*MEMORY[0x1E0C83DA0], rcv_name[3]);
LABEL_22:
    mach_msg_destroy((mach_msg_header_t *)rcv_name);
    return v11;
  }
  if (DWORD1(v14) == 71)
  {
    v11 = 4294966988;
    goto LABEL_22;
  }
  if (DWORD1(v14) != 6001105)
  {
    v11 = 4294966995;
    goto LABEL_22;
  }
  v11 = 4294966996;
  if ((rcv_name[0] & 0x80000000) != 0)
    goto LABEL_22;
  if (rcv_name[1] != 36)
    goto LABEL_22;
  if (rcv_name[2])
    goto LABEL_22;
  v11 = LODWORD(v15[0]);
  if (LODWORD(v15[0]))
    goto LABEL_22;
  return v11;
}

uint64_t _BKSDisplayGetSystemIdentifiers(mach_port_name_t a1, const char *a2, _QWORD *a3, _DWORD *a4)
{
  int v7;
  mach_msg_size_t v8;
  mach_port_name_t special_reply_port;
  uint64_t v10;
  uint64_t v11;
  int v12;
  mach_port_name_t rcv_name[4];
  _OWORD v15[2];
  __int128 v16;
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
  uint64_t v45;

  v45 = *MEMORY[0x1E0C80C00];
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
  v31 = 0u;
  v32 = 0u;
  v29 = 0u;
  v30 = 0u;
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
  v16 = 0u;
  *(_OWORD *)rcv_name = 0u;
  memset(v15, 0, sizeof(v15));
  *((_QWORD *)&v15[0] + 1) = *MEMORY[0x1E0C804E8];
  if (MEMORY[0x1E0C84128])
    v7 = mig_strncpy_zerofill((char *)&v15[1] + 8, a2, 1024);
  else
    v7 = mig_strncpy((char *)&v15[1] + 8, a2, 1024);
  LODWORD(v15[1]) = 0;
  DWORD1(v15[1]) = v7;
  v8 = ((v7 + 3) & 0xFFFFFFFC) + 40;
  special_reply_port = mig_get_special_reply_port();
  rcv_name[2] = a1;
  rcv_name[3] = special_reply_port;
  rcv_name[0] = 5395;
  *(_QWORD *)&v15[0] = 0x5B916E00000000;
  if (MEMORY[0x1E0C85B60])
  {
    voucher_mach_msg_set((mach_msg_header_t *)rcv_name);
    special_reply_port = rcv_name[3];
  }
  v10 = mach_msg((mach_msg_header_t *)rcv_name, 3162115, v8, 0x40u, special_reply_port, 0, 0);
  v11 = v10;
  if ((v10 - 268435458) > 0xE || ((1 << (v10 - 2)) & 0x4003) == 0)
  {
    if (!(_DWORD)v10)
    {
      if (DWORD1(v15[0]) == 71)
      {
        v11 = 4294966988;
      }
      else if (DWORD1(v15[0]) == 6001106)
      {
        if ((rcv_name[0] & 0x80000000) == 0)
        {
          if (rcv_name[1] == 36)
          {
            v11 = 4294966996;
            if (LODWORD(v15[1]))
            {
              if (rcv_name[2])
                v11 = 4294966996;
              else
                v11 = LODWORD(v15[1]);
            }
          }
          else
          {
            v11 = 4294966996;
          }
          goto LABEL_30;
        }
        v11 = 4294966996;
        if (DWORD2(v15[0]) == 1 && rcv_name[1] == 56 && !rcv_name[2] && BYTE7(v15[1]) == 1)
        {
          v12 = DWORD2(v15[1]);
          if (DWORD2(v15[1]) == DWORD1(v16))
          {
            v11 = 0;
            *a3 = *(_QWORD *)((char *)v15 + 12);
            *a4 = v12;
            return v11;
          }
        }
      }
      else
      {
        v11 = 4294966995;
      }
LABEL_30:
      mach_msg_destroy((mach_msg_header_t *)rcv_name);
      return v11;
    }
    mig_dealloc_special_reply_port();
  }
  if ((v11 - 268435459) <= 1)
  {
    if ((rcv_name[0] & 0x1F00) == 0x1100)
      mach_port_deallocate(*MEMORY[0x1E0C83DA0], rcv_name[3]);
    goto LABEL_30;
  }
  return v11;
}

uint64_t _BKSDisplaySetSystemIdentifiers(mach_port_t a1, const char *a2, uint64_t a3, unsigned int a4)
{
  int v6;
  uint64_t v7;
  mach_msg_size_t v8;
  uint64_t v9;
  mach_msg_header_t name;
  int v12;
  uint64_t v13;
  int v14;
  _BYTE v15[24];
  __int128 v16;
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
  uint64_t v44;

  v44 = *MEMORY[0x1E0C80C00];
  v42 = 0u;
  v43 = 0u;
  v40 = 0u;
  v41 = 0u;
  v38 = 0u;
  v39 = 0u;
  v36 = 0u;
  v37 = 0u;
  v34 = 0u;
  v35 = 0u;
  v32 = 0u;
  v33 = 0u;
  v30 = 0u;
  v31 = 0u;
  v28 = 0u;
  v29 = 0u;
  v26 = 0u;
  v27 = 0u;
  v24 = 0u;
  v25 = 0u;
  v22 = 0u;
  v23 = 0u;
  v20 = 0u;
  v21 = 0u;
  v18 = 0u;
  v19 = 0u;
  v16 = 0u;
  v17 = 0u;
  *(_OWORD *)&v15[8] = 0u;
  memset(&name, 0, sizeof(name));
  v12 = 1;
  v13 = a3;
  v14 = 16777472;
  *(_QWORD *)v15 = a4;
  *(_QWORD *)&v15[4] = *MEMORY[0x1E0C804E8];
  if (MEMORY[0x1E0C84128])
    v6 = mig_strncpy_zerofill(&v15[20], a2, 1024);
  else
    v6 = mig_strncpy(&v15[20], a2, 1024);
  *(_DWORD *)&v15[12] = 0;
  *(_DWORD *)&v15[16] = v6;
  v7 = (v6 + 3) & 0xFFFFFFFC;
  v8 = v7 + 64;
  *(_DWORD *)&v15[v7 + 20] = a4;
  name.msgh_bits = -2147483629;
  name.msgh_remote_port = a1;
  name.msgh_local_port = 0;
  *(_QWORD *)&name.msgh_voucher_port = 0x5B916F00000000;
  if (MEMORY[0x1E0C85B60])
    voucher_mach_msg_set(&name);
  v9 = mach_msg(&name, 1, v8, 0, 0, 0, 0);
  if ((v9 - 268435459) <= 1)
  {
    if ((name.msgh_bits & 0x1F00) == 0x1100)
      mach_port_deallocate(*MEMORY[0x1E0C83DA0], name.msgh_local_port);
    mach_msg_destroy(&name);
  }
  return v9;
}

uint64_t _BKSDisplayIsFlipBookEnabled(mach_port_name_t a1, const char *a2, _BYTE *a3)
{
  int v5;
  mach_msg_size_t v6;
  mach_port_name_t special_reply_port;
  uint64_t v8;
  uint64_t v9;
  BOOL v10;
  mach_port_name_t rcv_name[4];
  __int128 v13;
  _OWORD v14[64];
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  memset(v14, 0, 480);
  *(_OWORD *)rcv_name = 0u;
  v13 = 0u;
  *((_QWORD *)&v13 + 1) = *MEMORY[0x1E0C804E8];
  if (MEMORY[0x1E0C84128])
    v5 = mig_strncpy_zerofill((char *)v14 + 8, a2, 1024);
  else
    v5 = mig_strncpy((char *)v14 + 8, a2, 1024);
  LODWORD(v14[0]) = 0;
  DWORD1(v14[0]) = v5;
  v6 = ((v5 + 3) & 0xFFFFFFFC) + 40;
  special_reply_port = mig_get_special_reply_port();
  rcv_name[2] = a1;
  rcv_name[3] = special_reply_port;
  rcv_name[0] = 5395;
  *(_QWORD *)&v13 = 0x5B917000000000;
  if (MEMORY[0x1E0C85B60])
  {
    voucher_mach_msg_set((mach_msg_header_t *)rcv_name);
    special_reply_port = rcv_name[3];
  }
  v8 = mach_msg((mach_msg_header_t *)rcv_name, 3162115, v6, 0x30u, special_reply_port, 0, 0);
  v9 = v8;
  if ((v8 - 268435458) > 0xE || ((1 << (v8 - 2)) & 0x4003) == 0)
  {
    if (!(_DWORD)v8)
    {
      if (DWORD1(v13) == 71)
      {
        v9 = 4294966988;
      }
      else if (DWORD1(v13) == 6001108)
      {
        if ((rcv_name[0] & 0x80000000) == 0)
        {
          if (rcv_name[1] == 40)
          {
            if (!rcv_name[2])
            {
              v9 = LODWORD(v14[0]);
              if (!LODWORD(v14[0]))
              {
                *a3 = BYTE4(v14[0]);
                return v9;
              }
              goto LABEL_28;
            }
          }
          else if (rcv_name[1] == 36)
          {
            if (rcv_name[2])
              v10 = 1;
            else
              v10 = LODWORD(v14[0]) == 0;
            if (v10)
              v9 = 4294966996;
            else
              v9 = LODWORD(v14[0]);
            goto LABEL_28;
          }
        }
        v9 = 4294966996;
      }
      else
      {
        v9 = 4294966995;
      }
LABEL_28:
      mach_msg_destroy((mach_msg_header_t *)rcv_name);
      return v9;
    }
    mig_dealloc_special_reply_port();
  }
  if ((v9 - 268435459) <= 1)
  {
    if ((rcv_name[0] & 0x1F00) == 0x1100)
      mach_port_deallocate(*MEMORY[0x1E0C83DA0], rcv_name[3]);
    goto LABEL_28;
  }
  return v9;
}

uint64_t _BKSDisplaySetFlipBookEnabled(mach_port_name_t a1, const char *a2, char a3)
{
  int v5;
  uint64_t v6;
  char *v7;
  mach_msg_size_t v8;
  mach_port_name_t special_reply_port;
  uint64_t v10;
  uint64_t v11;
  mach_port_name_t rcv_name[4];
  __int128 v14;
  _OWORD v15[65];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  memset(v15, 0, 480);
  *(_OWORD *)rcv_name = 0u;
  v14 = 0u;
  *((_QWORD *)&v14 + 1) = *MEMORY[0x1E0C804E8];
  if (MEMORY[0x1E0C84128])
    v5 = mig_strncpy_zerofill((char *)v15 + 8, a2, 1024);
  else
    v5 = mig_strncpy((char *)v15 + 8, a2, 1024);
  LODWORD(v15[0]) = 0;
  DWORD1(v15[0]) = v5;
  v6 = (v5 + 3) & 0xFFFFFFFC;
  v7 = (char *)rcv_name + v6;
  v7[40] = a3;
  *(_WORD *)(v7 + 41) = 0;
  v7[43] = 0;
  v8 = v6 + 44;
  special_reply_port = mig_get_special_reply_port();
  rcv_name[2] = a1;
  rcv_name[3] = special_reply_port;
  rcv_name[0] = 5395;
  *(_QWORD *)&v14 = 0x5B917100000000;
  if (MEMORY[0x1E0C85B60])
  {
    voucher_mach_msg_set((mach_msg_header_t *)rcv_name);
    special_reply_port = rcv_name[3];
  }
  v10 = mach_msg((mach_msg_header_t *)rcv_name, 3162115, v8, 0x2Cu, special_reply_port, 0, 0);
  v11 = v10;
  if ((v10 - 268435458) <= 0xE && ((1 << (v10 - 2)) & 0x4003) != 0)
    goto LABEL_17;
  if ((_DWORD)v10)
  {
    mig_dealloc_special_reply_port();
LABEL_17:
    if ((v11 - 268435459) > 1)
      return v11;
    if ((rcv_name[0] & 0x1F00) == 0x1100)
      mach_port_deallocate(*MEMORY[0x1E0C83DA0], rcv_name[3]);
LABEL_22:
    mach_msg_destroy((mach_msg_header_t *)rcv_name);
    return v11;
  }
  if (DWORD1(v14) == 71)
  {
    v11 = 4294966988;
    goto LABEL_22;
  }
  if (DWORD1(v14) != 6001109)
  {
    v11 = 4294966995;
    goto LABEL_22;
  }
  v11 = 4294966996;
  if ((rcv_name[0] & 0x80000000) != 0)
    goto LABEL_22;
  if (rcv_name[1] != 36)
    goto LABEL_22;
  if (rcv_name[2])
    goto LABEL_22;
  v11 = LODWORD(v15[0]);
  if (LODWORD(v15[0]))
    goto LABEL_22;
  return v11;
}

uint64_t _BKSDisplaySetCalibrationPhase(mach_port_name_t a1, const char *a2, int a3, int a4)
{
  int v7;
  uint64_t v8;
  mach_msg_size_t v9;
  char *v10;
  mach_port_name_t special_reply_port;
  uint64_t v12;
  uint64_t v13;
  mach_port_name_t rcv_name[4];
  __int128 v16;
  _OWORD v17[65];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  memset(v17, 0, 480);
  *(_OWORD *)rcv_name = 0u;
  v16 = 0u;
  *((_QWORD *)&v16 + 1) = *MEMORY[0x1E0C804E8];
  if (MEMORY[0x1E0C84128])
    v7 = mig_strncpy_zerofill((char *)v17 + 8, a2, 1024);
  else
    v7 = mig_strncpy((char *)v17 + 8, a2, 1024);
  LODWORD(v17[0]) = 0;
  DWORD1(v17[0]) = v7;
  v8 = (v7 + 3) & 0xFFFFFFFC;
  v9 = v8 + 48;
  v10 = (char *)rcv_name + v8;
  *((_DWORD *)v10 + 10) = a3;
  *((_DWORD *)v10 + 11) = a4;
  special_reply_port = mig_get_special_reply_port();
  rcv_name[2] = a1;
  rcv_name[3] = special_reply_port;
  rcv_name[0] = 5395;
  *(_QWORD *)&v16 = 0x5B917200000000;
  if (MEMORY[0x1E0C85B60])
  {
    voucher_mach_msg_set((mach_msg_header_t *)rcv_name);
    special_reply_port = rcv_name[3];
  }
  v12 = mach_msg((mach_msg_header_t *)rcv_name, 3162115, v9, 0x2Cu, special_reply_port, 0, 0);
  v13 = v12;
  if ((v12 - 268435458) <= 0xE && ((1 << (v12 - 2)) & 0x4003) != 0)
    goto LABEL_17;
  if ((_DWORD)v12)
  {
    mig_dealloc_special_reply_port();
LABEL_17:
    if ((v13 - 268435459) > 1)
      return v13;
    if ((rcv_name[0] & 0x1F00) == 0x1100)
      mach_port_deallocate(*MEMORY[0x1E0C83DA0], rcv_name[3]);
LABEL_22:
    mach_msg_destroy((mach_msg_header_t *)rcv_name);
    return v13;
  }
  if (DWORD1(v16) == 71)
  {
    v13 = 4294966988;
    goto LABEL_22;
  }
  if (DWORD1(v16) != 6001110)
  {
    v13 = 4294966995;
    goto LABEL_22;
  }
  v13 = 4294966996;
  if ((rcv_name[0] & 0x80000000) != 0)
    goto LABEL_22;
  if (rcv_name[1] != 36)
    goto LABEL_22;
  if (rcv_name[2])
    goto LABEL_22;
  v13 = LODWORD(v17[0]);
  if (LODWORD(v17[0]))
    goto LABEL_22;
  return v13;
}

uint64_t _BKSDisplayIsFlipBookSuppressed(mach_port_name_t a1, const char *a2, _BYTE *a3)
{
  int v5;
  mach_msg_size_t v6;
  mach_port_name_t special_reply_port;
  uint64_t v8;
  uint64_t v9;
  BOOL v10;
  mach_port_name_t rcv_name[4];
  __int128 v13;
  _OWORD v14[64];
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  memset(v14, 0, 480);
  *(_OWORD *)rcv_name = 0u;
  v13 = 0u;
  *((_QWORD *)&v13 + 1) = *MEMORY[0x1E0C804E8];
  if (MEMORY[0x1E0C84128])
    v5 = mig_strncpy_zerofill((char *)v14 + 8, a2, 1024);
  else
    v5 = mig_strncpy((char *)v14 + 8, a2, 1024);
  LODWORD(v14[0]) = 0;
  DWORD1(v14[0]) = v5;
  v6 = ((v5 + 3) & 0xFFFFFFFC) + 40;
  special_reply_port = mig_get_special_reply_port();
  rcv_name[2] = a1;
  rcv_name[3] = special_reply_port;
  rcv_name[0] = 5395;
  *(_QWORD *)&v13 = 0x5B917300000000;
  if (MEMORY[0x1E0C85B60])
  {
    voucher_mach_msg_set((mach_msg_header_t *)rcv_name);
    special_reply_port = rcv_name[3];
  }
  v8 = mach_msg((mach_msg_header_t *)rcv_name, 3162115, v6, 0x30u, special_reply_port, 0, 0);
  v9 = v8;
  if ((v8 - 268435458) > 0xE || ((1 << (v8 - 2)) & 0x4003) == 0)
  {
    if (!(_DWORD)v8)
    {
      if (DWORD1(v13) == 71)
      {
        v9 = 4294966988;
      }
      else if (DWORD1(v13) == 6001111)
      {
        if ((rcv_name[0] & 0x80000000) == 0)
        {
          if (rcv_name[1] == 40)
          {
            if (!rcv_name[2])
            {
              v9 = LODWORD(v14[0]);
              if (!LODWORD(v14[0]))
              {
                *a3 = BYTE4(v14[0]);
                return v9;
              }
              goto LABEL_28;
            }
          }
          else if (rcv_name[1] == 36)
          {
            if (rcv_name[2])
              v10 = 1;
            else
              v10 = LODWORD(v14[0]) == 0;
            if (v10)
              v9 = 4294966996;
            else
              v9 = LODWORD(v14[0]);
            goto LABEL_28;
          }
        }
        v9 = 4294966996;
      }
      else
      {
        v9 = 4294966995;
      }
LABEL_28:
      mach_msg_destroy((mach_msg_header_t *)rcv_name);
      return v9;
    }
    mig_dealloc_special_reply_port();
  }
  if ((v9 - 268435459) <= 1)
  {
    if ((rcv_name[0] & 0x1F00) == 0x1100)
      mach_port_deallocate(*MEMORY[0x1E0C83DA0], rcv_name[3]);
    goto LABEL_28;
  }
  return v9;
}

uint64_t _BKSDisplaySetFlipBookSuppressed(mach_port_name_t a1, const char *a2, char a3)
{
  int v5;
  uint64_t v6;
  char *v7;
  mach_msg_size_t v8;
  mach_port_name_t special_reply_port;
  uint64_t v10;
  uint64_t v11;
  mach_port_name_t rcv_name[4];
  __int128 v14;
  _OWORD v15[65];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  memset(v15, 0, 480);
  *(_OWORD *)rcv_name = 0u;
  v14 = 0u;
  *((_QWORD *)&v14 + 1) = *MEMORY[0x1E0C804E8];
  if (MEMORY[0x1E0C84128])
    v5 = mig_strncpy_zerofill((char *)v15 + 8, a2, 1024);
  else
    v5 = mig_strncpy((char *)v15 + 8, a2, 1024);
  LODWORD(v15[0]) = 0;
  DWORD1(v15[0]) = v5;
  v6 = (v5 + 3) & 0xFFFFFFFC;
  v7 = (char *)rcv_name + v6;
  v7[40] = a3;
  *(_WORD *)(v7 + 41) = 0;
  v7[43] = 0;
  v8 = v6 + 44;
  special_reply_port = mig_get_special_reply_port();
  rcv_name[2] = a1;
  rcv_name[3] = special_reply_port;
  rcv_name[0] = 5395;
  *(_QWORD *)&v14 = 0x5B917400000000;
  if (MEMORY[0x1E0C85B60])
  {
    voucher_mach_msg_set((mach_msg_header_t *)rcv_name);
    special_reply_port = rcv_name[3];
  }
  v10 = mach_msg((mach_msg_header_t *)rcv_name, 3162115, v8, 0x2Cu, special_reply_port, 0, 0);
  v11 = v10;
  if ((v10 - 268435458) <= 0xE && ((1 << (v10 - 2)) & 0x4003) != 0)
    goto LABEL_17;
  if ((_DWORD)v10)
  {
    mig_dealloc_special_reply_port();
LABEL_17:
    if ((v11 - 268435459) > 1)
      return v11;
    if ((rcv_name[0] & 0x1F00) == 0x1100)
      mach_port_deallocate(*MEMORY[0x1E0C83DA0], rcv_name[3]);
LABEL_22:
    mach_msg_destroy((mach_msg_header_t *)rcv_name);
    return v11;
  }
  if (DWORD1(v14) == 71)
  {
    v11 = 4294966988;
    goto LABEL_22;
  }
  if (DWORD1(v14) != 6001112)
  {
    v11 = 4294966995;
    goto LABEL_22;
  }
  v11 = 4294966996;
  if ((rcv_name[0] & 0x80000000) != 0)
    goto LABEL_22;
  if (rcv_name[1] != 36)
    goto LABEL_22;
  if (rcv_name[2])
    goto LABEL_22;
  v11 = LODWORD(v15[0]);
  if (LODWORD(v15[0]))
    goto LABEL_22;
  return v11;
}

uint64_t _BKSDisplaySetCloneRotationDisabled(mach_port_t a1, char a2)
{
  uint64_t v2;
  mach_msg_header_t msg;
  uint64_t v5;
  char v6;
  __int16 v7;
  char v8;

  v5 = *MEMORY[0x1E0C804E8];
  v6 = a2;
  v7 = 0;
  v8 = 0;
  *(_QWORD *)&msg.msgh_bits = 19;
  msg.msgh_voucher_port = 0;
  msg.msgh_id = 6001014;
  msg.msgh_remote_port = a1;
  msg.msgh_local_port = 0;
  if (MEMORY[0x1E0C85B60])
    voucher_mach_msg_set(&msg);
  v2 = mach_msg(&msg, 1, 0x24u, 0, 0, 0, 0);
  if ((v2 - 268435459) <= 1)
  {
    if ((msg.msgh_bits & 0x1F00) == 0x1100)
      mach_port_deallocate(*MEMORY[0x1E0C83DA0], msg.msgh_local_port);
    mach_msg_destroy(&msg);
  }
  return v2;
}

uint64_t _BKSDisplaySetCloneMirroringModeForDestinationDisplay(mach_port_name_t a1, const char *a2, char a3)
{
  int v5;
  uint64_t v6;
  char *v7;
  mach_msg_size_t v8;
  uint64_t v9;
  mach_port_name_t name[4];
  __int128 v12;
  _OWORD v13[65];
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  memset(v13, 0, 480);
  *(_OWORD *)name = 0u;
  v12 = 0u;
  *((_QWORD *)&v12 + 1) = *MEMORY[0x1E0C804E8];
  if (MEMORY[0x1E0C84128])
    v5 = mig_strncpy_zerofill((char *)v13 + 8, a2, 1024);
  else
    v5 = mig_strncpy((char *)v13 + 8, a2, 1024);
  LODWORD(v13[0]) = 0;
  DWORD1(v13[0]) = v5;
  v6 = (v5 + 3) & 0xFFFFFFFC;
  v7 = (char *)name + v6;
  v7[40] = a3;
  *(_WORD *)(v7 + 41) = 0;
  v7[43] = 0;
  v8 = v6 + 44;
  name[0] = 19;
  name[2] = a1;
  name[3] = 0;
  *(_QWORD *)&v12 = 0x5B917700000000;
  if (MEMORY[0x1E0C85B60])
    voucher_mach_msg_set((mach_msg_header_t *)name);
  v9 = mach_msg((mach_msg_header_t *)name, 1, v8, 0, 0, 0, 0);
  if ((v9 - 268435459) <= 1)
  {
    if ((name[0] & 0x1F00) == 0x1100)
      mach_port_deallocate(*MEMORY[0x1E0C83DA0], name[3]);
    mach_msg_destroy((mach_msg_header_t *)name);
  }
  return v9;
}

uint64_t _BKSDisplayRemoveCloneMirroringModeForDestinationDisplay(mach_port_name_t a1, const char *a2)
{
  int v3;
  mach_msg_size_t v4;
  uint64_t v5;
  mach_port_name_t name[4];
  __int128 v8;
  _OWORD v9[64];
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  memset(v9, 0, 480);
  *(_OWORD *)name = 0u;
  v8 = 0u;
  *((_QWORD *)&v8 + 1) = *MEMORY[0x1E0C804E8];
  if (MEMORY[0x1E0C84128])
    v3 = mig_strncpy_zerofill((char *)v9 + 8, a2, 1024);
  else
    v3 = mig_strncpy((char *)v9 + 8, a2, 1024);
  LODWORD(v9[0]) = 0;
  DWORD1(v9[0]) = v3;
  v4 = ((v3 + 3) & 0xFFFFFFFC) + 40;
  name[0] = 19;
  name[2] = a1;
  name[3] = 0;
  *(_QWORD *)&v8 = 0x5B917800000000;
  if (MEMORY[0x1E0C85B60])
    voucher_mach_msg_set((mach_msg_header_t *)name);
  v5 = mach_msg((mach_msg_header_t *)name, 1, v4, 0, 0, 0, 0);
  if ((v5 - 268435459) <= 1)
  {
    if ((name[0] & 0x1F00) == 0x1100)
      mach_port_deallocate(*MEMORY[0x1E0C83DA0], name[3]);
    mach_msg_destroy((mach_msg_header_t *)name);
  }
  return v5;
}

uint64_t _BKSDisplayTetherPrefsNeedImmediateUpdate(int a1, _BYTE *a2)
{
  mach_port_name_t special_reply_port;
  uint64_t v5;
  uint64_t v6;
  BOOL v7;
  int v9;
  int rcv_name;
  int rcv_name_4;
  mach_port_name_t rcv_name_8;
  _BYTE rcv_name_12[32];

  memset(&rcv_name_12[4], 0, 28);
  rcv_name = 0;
  special_reply_port = mig_get_special_reply_port();
  rcv_name_4 = a1;
  rcv_name_8 = special_reply_port;
  v9 = 5395;
  *(_QWORD *)rcv_name_12 = 0x5B917A00000000;
  if (MEMORY[0x1E0C85B60])
  {
    voucher_mach_msg_set((mach_msg_header_t *)&v9);
    special_reply_port = rcv_name_8;
  }
  v5 = mach_msg((mach_msg_header_t *)&v9, 3162115, 0x18u, 0x30u, special_reply_port, 0, 0);
  v6 = v5;
  if ((v5 - 268435458) > 0xE || ((1 << (v5 - 2)) & 0x4003) == 0)
  {
    if (!(_DWORD)v5)
    {
      if (*(_DWORD *)&rcv_name_12[4] == 71)
      {
        v6 = 4294966988;
      }
      else if (*(_DWORD *)&rcv_name_12[4] == 6001118)
      {
        if ((v9 & 0x80000000) == 0)
        {
          if (rcv_name == 40)
          {
            if (!rcv_name_4)
            {
              v6 = *(unsigned int *)&rcv_name_12[16];
              if (!*(_DWORD *)&rcv_name_12[16])
              {
                *a2 = rcv_name_12[20];
                return v6;
              }
              goto LABEL_25;
            }
          }
          else if (rcv_name == 36)
          {
            if (rcv_name_4)
              v7 = 1;
            else
              v7 = *(_DWORD *)&rcv_name_12[16] == 0;
            if (v7)
              v6 = 4294966996;
            else
              v6 = *(unsigned int *)&rcv_name_12[16];
            goto LABEL_25;
          }
        }
        v6 = 4294966996;
      }
      else
      {
        v6 = 4294966995;
      }
LABEL_25:
      mach_msg_destroy((mach_msg_header_t *)&v9);
      return v6;
    }
    mig_dealloc_special_reply_port();
  }
  if ((v6 - 268435459) <= 1)
  {
    if ((v9 & 0x1F00) == 0x1100)
      mach_port_deallocate(*MEMORY[0x1E0C83DA0], rcv_name_8);
    goto LABEL_25;
  }
  return v6;
}

uint64_t _BKSDisplaySetTetheredOrientationNotificationsDisabled(int a1, char a2)
{
  mach_port_name_t special_reply_port;
  uint64_t v4;
  uint64_t v5;
  _BYTE msg[36];
  uint64_t v8;

  *(_OWORD *)&msg[20] = 0u;
  v8 = 0;
  *(_OWORD *)&msg[4] = 0u;
  *(_QWORD *)&msg[24] = *MEMORY[0x1E0C804E8];
  msg[32] = a2;
  *(_WORD *)&msg[33] = 0;
  msg[35] = 0;
  special_reply_port = mig_get_special_reply_port();
  *(_DWORD *)&msg[8] = a1;
  *(_DWORD *)&msg[12] = special_reply_port;
  *(_DWORD *)msg = 5395;
  *(_QWORD *)&msg[16] = 0x5B917B00000000;
  if (MEMORY[0x1E0C85B60])
  {
    voucher_mach_msg_set((mach_msg_header_t *)msg);
    special_reply_port = *(_DWORD *)&msg[12];
  }
  v4 = mach_msg((mach_msg_header_t *)msg, 3162115, 0x24u, 0x2Cu, special_reply_port, 0, 0);
  v5 = v4;
  if ((v4 - 268435458) <= 0xE && ((1 << (v4 - 2)) & 0x4003) != 0)
    goto LABEL_14;
  if ((_DWORD)v4)
  {
    mig_dealloc_special_reply_port();
LABEL_14:
    if ((v5 - 268435459) > 1)
      return v5;
    if ((*(_WORD *)msg & 0x1F00) == 0x1100)
      mach_port_deallocate(*MEMORY[0x1E0C83DA0], *(mach_port_name_t *)&msg[12]);
LABEL_19:
    mach_msg_destroy((mach_msg_header_t *)msg);
    return v5;
  }
  if (*(_DWORD *)&msg[20] == 71)
  {
    v5 = 4294966988;
    goto LABEL_19;
  }
  if (*(_DWORD *)&msg[20] != 6001119)
  {
    v5 = 4294966995;
    goto LABEL_19;
  }
  v5 = 4294966996;
  if ((*(_DWORD *)msg & 0x80000000) != 0)
    goto LABEL_19;
  if (*(_DWORD *)&msg[4] != 36)
    goto LABEL_19;
  if (*(_DWORD *)&msg[8])
    goto LABEL_19;
  v5 = *(unsigned int *)&msg[32];
  if (*(_DWORD *)&msg[32])
    goto LABEL_19;
  return v5;
}

uint64_t _BKSDisplaySetSecureMode(int a1, char a2)
{
  mach_port_name_t special_reply_port;
  uint64_t v4;
  uint64_t v5;
  _BYTE msg[36];
  uint64_t v8;

  *(_OWORD *)&msg[20] = 0u;
  v8 = 0;
  *(_OWORD *)&msg[4] = 0u;
  *(_QWORD *)&msg[24] = *MEMORY[0x1E0C804E8];
  msg[32] = a2;
  *(_WORD *)&msg[33] = 0;
  msg[35] = 0;
  special_reply_port = mig_get_special_reply_port();
  *(_DWORD *)&msg[8] = a1;
  *(_DWORD *)&msg[12] = special_reply_port;
  *(_DWORD *)msg = 5395;
  *(_QWORD *)&msg[16] = 0x5B917E00000000;
  if (MEMORY[0x1E0C85B60])
  {
    voucher_mach_msg_set((mach_msg_header_t *)msg);
    special_reply_port = *(_DWORD *)&msg[12];
  }
  v4 = mach_msg((mach_msg_header_t *)msg, 3162115, 0x24u, 0x2Cu, special_reply_port, 0, 0);
  v5 = v4;
  if ((v4 - 268435458) <= 0xE && ((1 << (v4 - 2)) & 0x4003) != 0)
    goto LABEL_14;
  if ((_DWORD)v4)
  {
    mig_dealloc_special_reply_port();
LABEL_14:
    if ((v5 - 268435459) > 1)
      return v5;
    if ((*(_WORD *)msg & 0x1F00) == 0x1100)
      mach_port_deallocate(*MEMORY[0x1E0C83DA0], *(mach_port_name_t *)&msg[12]);
LABEL_19:
    mach_msg_destroy((mach_msg_header_t *)msg);
    return v5;
  }
  if (*(_DWORD *)&msg[20] == 71)
  {
    v5 = 4294966988;
    goto LABEL_19;
  }
  if (*(_DWORD *)&msg[20] != 6001122)
  {
    v5 = 4294966995;
    goto LABEL_19;
  }
  v5 = 4294966996;
  if ((*(_DWORD *)msg & 0x80000000) != 0)
    goto LABEL_19;
  if (*(_DWORD *)&msg[4] != 36)
    goto LABEL_19;
  if (*(_DWORD *)&msg[8])
    goto LABEL_19;
  v5 = *(unsigned int *)&msg[32];
  if (*(_DWORD *)&msg[32])
    goto LABEL_19;
  return v5;
}

uint64_t _BKSDisplayRenderOverlay(mach_port_name_t a1, const char *a2, _QWORD *a3, _DWORD *a4)
{
  int v7;
  mach_msg_size_t v8;
  mach_port_name_t special_reply_port;
  uint64_t v10;
  uint64_t v11;
  int v12;
  mach_port_name_t rcv_name[4];
  _OWORD v15[2];
  __int128 v16;
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
  uint64_t v45;

  v45 = *MEMORY[0x1E0C80C00];
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
  v31 = 0u;
  v32 = 0u;
  v29 = 0u;
  v30 = 0u;
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
  v16 = 0u;
  *(_OWORD *)rcv_name = 0u;
  memset(v15, 0, sizeof(v15));
  *((_QWORD *)&v15[0] + 1) = *MEMORY[0x1E0C804E8];
  if (MEMORY[0x1E0C84128])
    v7 = mig_strncpy_zerofill((char *)&v15[1] + 8, a2, 1024);
  else
    v7 = mig_strncpy((char *)&v15[1] + 8, a2, 1024);
  LODWORD(v15[1]) = 0;
  DWORD1(v15[1]) = v7;
  v8 = ((v7 + 3) & 0xFFFFFFFC) + 40;
  special_reply_port = mig_get_special_reply_port();
  rcv_name[2] = a1;
  rcv_name[3] = special_reply_port;
  rcv_name[0] = 5395;
  *(_QWORD *)&v15[0] = 0x5B917F00000000;
  if (MEMORY[0x1E0C85B60])
  {
    voucher_mach_msg_set((mach_msg_header_t *)rcv_name);
    special_reply_port = rcv_name[3];
  }
  v10 = mach_msg((mach_msg_header_t *)rcv_name, 3162115, v8, 0x40u, special_reply_port, 0, 0);
  v11 = v10;
  if ((v10 - 268435458) > 0xE || ((1 << (v10 - 2)) & 0x4003) == 0)
  {
    if (!(_DWORD)v10)
    {
      if (DWORD1(v15[0]) == 71)
      {
        v11 = 4294966988;
      }
      else if (DWORD1(v15[0]) == 6001123)
      {
        if ((rcv_name[0] & 0x80000000) == 0)
        {
          if (rcv_name[1] == 36)
          {
            v11 = 4294966996;
            if (LODWORD(v15[1]))
            {
              if (rcv_name[2])
                v11 = 4294966996;
              else
                v11 = LODWORD(v15[1]);
            }
          }
          else
          {
            v11 = 4294966996;
          }
          goto LABEL_30;
        }
        v11 = 4294966996;
        if (DWORD2(v15[0]) == 1 && rcv_name[1] == 56 && !rcv_name[2] && BYTE7(v15[1]) == 1)
        {
          v12 = DWORD2(v15[1]);
          if (DWORD2(v15[1]) == DWORD1(v16))
          {
            v11 = 0;
            *a3 = *(_QWORD *)((char *)v15 + 12);
            *a4 = v12;
            return v11;
          }
        }
      }
      else
      {
        v11 = 4294966995;
      }
LABEL_30:
      mach_msg_destroy((mach_msg_header_t *)rcv_name);
      return v11;
    }
    mig_dealloc_special_reply_port();
  }
  if ((v11 - 268435459) <= 1)
  {
    if ((rcv_name[0] & 0x1F00) == 0x1100)
      mach_port_deallocate(*MEMORY[0x1E0C83DA0], rcv_name[3]);
    goto LABEL_30;
  }
  return v11;
}

uint64_t _BKSDisplayApplyRenderOverlay(mach_port_t a1, uint64_t a2, int a3, uint64_t a4, int a5)
{
  mach_port_t special_reply_port;
  uint64_t v7;
  uint64_t v8;
  mach_msg_header_t msg;
  int v11;
  uint64_t v12;
  int v13;
  int v14;
  uint64_t v15;
  int v16;
  int v17;
  uint64_t v18;
  int v19;
  int v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v11 = 2;
  v12 = a2;
  v13 = 16777472;
  v14 = a3;
  v15 = a4;
  v16 = 16777472;
  v17 = a5;
  v18 = *MEMORY[0x1E0C804E8];
  v19 = a3;
  v20 = a5;
  special_reply_port = mig_get_special_reply_port();
  *(_QWORD *)&msg.msgh_bits = 2147489043;
  msg.msgh_remote_port = a1;
  msg.msgh_local_port = special_reply_port;
  *(_QWORD *)&msg.msgh_voucher_port = 0x5B918000000000;
  if (MEMORY[0x1E0C85B60])
  {
    voucher_mach_msg_set(&msg);
    special_reply_port = msg.msgh_local_port;
  }
  v7 = mach_msg(&msg, 3162115, 0x4Cu, 0x2Cu, special_reply_port, 0, 0);
  v8 = v7;
  if ((v7 - 268435458) <= 0xE && ((1 << (v7 - 2)) & 0x4003) != 0)
    goto LABEL_14;
  if ((_DWORD)v7)
  {
    mig_dealloc_special_reply_port();
LABEL_14:
    if ((v8 - 268435459) > 1)
      return v8;
    if ((msg.msgh_bits & 0x1F00) == 0x1100)
      mach_port_deallocate(*MEMORY[0x1E0C83DA0], msg.msgh_local_port);
LABEL_19:
    mach_msg_destroy(&msg);
    return v8;
  }
  if (msg.msgh_id == 71)
  {
    v8 = 4294966988;
    goto LABEL_19;
  }
  if (msg.msgh_id != 6001124)
  {
    v8 = 4294966995;
    goto LABEL_19;
  }
  v8 = 4294966996;
  if ((msg.msgh_bits & 0x80000000) != 0)
    goto LABEL_19;
  if (msg.msgh_size != 36)
    goto LABEL_19;
  if (msg.msgh_remote_port)
    goto LABEL_19;
  v8 = HIDWORD(v12);
  if (HIDWORD(v12))
    goto LABEL_19;
  return v8;
}

uint64_t _BKSDisplayRemoveRenderOverlay(mach_port_t a1, uint64_t a2, int a3, uint64_t a4, int a5)
{
  mach_port_t special_reply_port;
  uint64_t v7;
  uint64_t v8;
  mach_msg_header_t msg;
  int v11;
  uint64_t v12;
  int v13;
  int v14;
  uint64_t v15;
  int v16;
  int v17;
  uint64_t v18;
  int v19;
  int v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v11 = 2;
  v12 = a2;
  v13 = 16777472;
  v14 = a3;
  v15 = a4;
  v16 = 16777472;
  v17 = a5;
  v18 = *MEMORY[0x1E0C804E8];
  v19 = a3;
  v20 = a5;
  special_reply_port = mig_get_special_reply_port();
  *(_QWORD *)&msg.msgh_bits = 2147489043;
  msg.msgh_remote_port = a1;
  msg.msgh_local_port = special_reply_port;
  *(_QWORD *)&msg.msgh_voucher_port = 0x5B918100000000;
  if (MEMORY[0x1E0C85B60])
  {
    voucher_mach_msg_set(&msg);
    special_reply_port = msg.msgh_local_port;
  }
  v7 = mach_msg(&msg, 3162115, 0x4Cu, 0x2Cu, special_reply_port, 0, 0);
  v8 = v7;
  if ((v7 - 268435458) <= 0xE && ((1 << (v7 - 2)) & 0x4003) != 0)
    goto LABEL_14;
  if ((_DWORD)v7)
  {
    mig_dealloc_special_reply_port();
LABEL_14:
    if ((v8 - 268435459) > 1)
      return v8;
    if ((msg.msgh_bits & 0x1F00) == 0x1100)
      mach_port_deallocate(*MEMORY[0x1E0C83DA0], msg.msgh_local_port);
LABEL_19:
    mach_msg_destroy(&msg);
    return v8;
  }
  if (msg.msgh_id == 71)
  {
    v8 = 4294966988;
    goto LABEL_19;
  }
  if (msg.msgh_id != 6001125)
  {
    v8 = 4294966995;
    goto LABEL_19;
  }
  v8 = 4294966996;
  if ((msg.msgh_bits & 0x80000000) != 0)
    goto LABEL_19;
  if (msg.msgh_size != 36)
    goto LABEL_19;
  if (msg.msgh_remote_port)
    goto LABEL_19;
  v8 = HIDWORD(v12);
  if (HIDWORD(v12))
    goto LABEL_19;
  return v8;
}

uint64_t _BKSDisplayFreezeRenderOverlay(mach_port_t a1, uint64_t a2, int a3)
{
  mach_port_t special_reply_port;
  uint64_t v5;
  uint64_t v6;
  mach_msg_header_t v8;
  int v9;
  uint64_t v10;
  int v11;
  int v12;
  uint64_t v13;
  int v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v9 = 1;
  v10 = a2;
  v11 = 16777472;
  v12 = a3;
  v13 = *MEMORY[0x1E0C804E8];
  v14 = a3;
  special_reply_port = mig_get_special_reply_port();
  *(_QWORD *)&v8.msgh_bits = 2147489043;
  v8.msgh_remote_port = a1;
  v8.msgh_local_port = special_reply_port;
  *(_QWORD *)&v8.msgh_voucher_port = 0x5B918200000000;
  if (MEMORY[0x1E0C85B60])
  {
    voucher_mach_msg_set(&v8);
    special_reply_port = v8.msgh_local_port;
  }
  v5 = mach_msg(&v8, 3162115, 0x38u, 0x2Cu, special_reply_port, 0, 0);
  v6 = v5;
  if ((v5 - 268435458) <= 0xE && ((1 << (v5 - 2)) & 0x4003) != 0)
    goto LABEL_13;
  if ((_DWORD)v5)
  {
    mig_dealloc_special_reply_port();
LABEL_13:
    if ((v6 - 268435459) > 1)
      return v6;
    if ((v8.msgh_bits & 0x1F00) == 0x1100)
      mach_port_deallocate(*MEMORY[0x1E0C83DA0], v8.msgh_local_port);
LABEL_18:
    mach_msg_destroy(&v8);
    return v6;
  }
  if (v8.msgh_id == 71)
  {
    v6 = 4294966988;
    goto LABEL_18;
  }
  if (v8.msgh_id != 6001126)
  {
    v6 = 4294966995;
    goto LABEL_18;
  }
  v6 = 4294966996;
  if ((v8.msgh_bits & 0x80000000) != 0)
    goto LABEL_18;
  if (*(_QWORD *)&v8.msgh_size != 36)
    goto LABEL_18;
  v6 = HIDWORD(v10);
  if (HIDWORD(v10))
    goto LABEL_18;
  return v6;
}

uint64_t _BKSDisplayDismissInterstitialRenderOverlay(mach_port_t a1, uint64_t a2, int a3)
{
  mach_port_t special_reply_port;
  uint64_t v5;
  uint64_t v6;
  mach_msg_header_t v8;
  int v9;
  uint64_t v10;
  int v11;
  int v12;
  uint64_t v13;
  int v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v9 = 1;
  v10 = a2;
  v11 = 16777472;
  v12 = a3;
  v13 = *MEMORY[0x1E0C804E8];
  v14 = a3;
  special_reply_port = mig_get_special_reply_port();
  *(_QWORD *)&v8.msgh_bits = 2147489043;
  v8.msgh_remote_port = a1;
  v8.msgh_local_port = special_reply_port;
  *(_QWORD *)&v8.msgh_voucher_port = 0x5B918300000000;
  if (MEMORY[0x1E0C85B60])
  {
    voucher_mach_msg_set(&v8);
    special_reply_port = v8.msgh_local_port;
  }
  v5 = mach_msg(&v8, 3162115, 0x38u, 0x2Cu, special_reply_port, 0, 0);
  v6 = v5;
  if ((v5 - 268435458) <= 0xE && ((1 << (v5 - 2)) & 0x4003) != 0)
    goto LABEL_13;
  if ((_DWORD)v5)
  {
    mig_dealloc_special_reply_port();
LABEL_13:
    if ((v6 - 268435459) > 1)
      return v6;
    if ((v8.msgh_bits & 0x1F00) == 0x1100)
      mach_port_deallocate(*MEMORY[0x1E0C83DA0], v8.msgh_local_port);
LABEL_18:
    mach_msg_destroy(&v8);
    return v6;
  }
  if (v8.msgh_id == 71)
  {
    v6 = 4294966988;
    goto LABEL_18;
  }
  if (v8.msgh_id != 6001127)
  {
    v6 = 4294966995;
    goto LABEL_18;
  }
  v6 = 4294966996;
  if ((v8.msgh_bits & 0x80000000) != 0)
    goto LABEL_18;
  if (*(_QWORD *)&v8.msgh_size != 36)
    goto LABEL_18;
  v6 = HIDWORD(v10);
  if (HIDWORD(v10))
    goto LABEL_18;
  return v6;
}

uint64_t _BKSDisplayGetRenderOverlayDismissActions(int a1, _QWORD *a2, _DWORD *a3)
{
  mach_port_name_t special_reply_port;
  uint64_t v7;
  uint64_t v8;
  int v9;
  int msg;
  int msg_4;
  int msg_8;
  mach_port_name_t msg_12;
  _BYTE msg_16[48];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  memset(&msg_16[4], 0, 44);
  msg_4 = 0;
  special_reply_port = mig_get_special_reply_port();
  msg_8 = a1;
  msg_12 = special_reply_port;
  msg = 5395;
  *(_QWORD *)msg_16 = 0x5B918400000000;
  if (MEMORY[0x1E0C85B60])
  {
    voucher_mach_msg_set((mach_msg_header_t *)&msg);
    special_reply_port = msg_12;
  }
  v7 = mach_msg((mach_msg_header_t *)&msg, 3162115, 0x18u, 0x40u, special_reply_port, 0, 0);
  v8 = v7;
  if ((v7 - 268435458) > 0xE || ((1 << (v7 - 2)) & 0x4003) == 0)
  {
    if (!(_DWORD)v7)
    {
      if (*(_DWORD *)&msg_16[4] == 71)
      {
        v8 = 4294966988;
      }
      else if (*(_DWORD *)&msg_16[4] == 6001128)
      {
        if ((msg & 0x80000000) == 0)
        {
          if (msg_4 == 36)
          {
            v8 = 4294966996;
            if (*(_DWORD *)&msg_16[16])
            {
              if (msg_8)
                v8 = 4294966996;
              else
                v8 = *(unsigned int *)&msg_16[16];
            }
          }
          else
          {
            v8 = 4294966996;
          }
          goto LABEL_27;
        }
        v8 = 4294966996;
        if (*(_DWORD *)&msg_16[8] == 1 && msg_4 == 56 && !msg_8 && msg_16[23] == 1)
        {
          v9 = *(_DWORD *)&msg_16[24];
          if (*(_DWORD *)&msg_16[24] == *(_DWORD *)&msg_16[36])
          {
            v8 = 0;
            *a2 = *(_QWORD *)&msg_16[12];
            *a3 = v9;
            return v8;
          }
        }
      }
      else
      {
        v8 = 4294966995;
      }
LABEL_27:
      mach_msg_destroy((mach_msg_header_t *)&msg);
      return v8;
    }
    mig_dealloc_special_reply_port();
  }
  if ((v8 - 268435459) <= 1)
  {
    if ((msg & 0x1F00) == 0x1100)
      mach_port_deallocate(*MEMORY[0x1E0C83DA0], msg_12);
    goto LABEL_27;
  }
  return v8;
}

uint64_t _BKSDisplaySetArrangement(int a1, uint64_t a2, int a3)
{
  uint64_t v3;
  _BYTE msg[28];
  uint64_t v6;
  int v7;
  int v8;
  uint64_t v9;
  int v10;

  v6 = a2;
  v7 = 16777472;
  v8 = a3;
  v9 = *MEMORY[0x1E0C804E8];
  v10 = a3;
  *(_QWORD *)msg = 2147483667;
  *(_DWORD *)&msg[8] = a1;
  *(_OWORD *)&msg[12] = xmmword_18A1614A0;
  if (MEMORY[0x1E0C85B60])
    voucher_mach_msg_set((mach_msg_header_t *)msg);
  v3 = mach_msg((mach_msg_header_t *)msg, 1, 0x38u, 0, 0, 0, 0);
  if ((v3 - 268435459) <= 1)
  {
    if ((*(_WORD *)msg & 0x1F00) == 0x1100)
      mach_port_deallocate(*MEMORY[0x1E0C83DA0], *(mach_port_name_t *)&msg[12]);
    mach_msg_destroy((mach_msg_header_t *)msg);
  }
  return v3;
}

uint64_t (*BKAccelerometer_server_routine(uint64_t a1))(uint64_t result, uint64_t a2)
{
  if (*(_DWORD *)(a1 + 20) == 980665)
    return _XDeliverAccelerometerEvent;
  else
    return 0;
}

uint64_t _XDeliverAccelerometerEvent(uint64_t result, uint64_t a2)
{
  if ((*(_DWORD *)result & 0x80000000) != 0 || *(_DWORD *)(result + 4) != 56)
  {
    *(_DWORD *)(a2 + 32) = -304;
    *(_QWORD *)(a2 + 24) = *MEMORY[0x1E0C804E8];
  }
  else
  {
    result = _BKXXDeliverAccelerometerEvent(*(double *)(result + 32), *(float *)(result + 40), *(float *)(result + 44), *(float *)(result + 48), result, *(unsigned int *)(result + 52));
    *(_DWORD *)(a2 + 32) = 0;
  }
  return result;
}

uint64_t BKAccelerometer_server(uint64_t a1, uint64_t a2)
{
  unsigned int v3;
  int v4;
  uint64_t result;

  v3 = *(_DWORD *)(a1 + 8);
  *(_DWORD *)a2 = *(_DWORD *)a1 & 0x1F;
  *(_DWORD *)(a2 + 4) = 36;
  v4 = *(_DWORD *)(a1 + 20) + 100;
  *(_QWORD *)(a2 + 8) = v3;
  *(_DWORD *)(a2 + 16) = 0;
  *(_DWORD *)(a2 + 20) = v4;
  if (*(_DWORD *)(a1 + 20) == 980665)
  {
    if ((*(_DWORD *)a1 & 0x80000000) != 0 || *(_DWORD *)(a1 + 4) != 56)
    {
      *(_DWORD *)(a2 + 32) = -304;
      *(_QWORD *)(a2 + 24) = *MEMORY[0x1E0C804E8];
    }
    else
    {
      _BKXXDeliverAccelerometerEvent(*(double *)(a1 + 32), *(float *)(a1 + 40), *(float *)(a1 + 44), *(float *)(a1 + 48), a1, *(unsigned int *)(a1 + 52));
      *(_DWORD *)(a2 + 32) = 0;
    }
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

uint64_t _BKSWatchdogGetIsAlive(int a1, _BYTE *a2, mach_msg_timeout_t a3)
{
  mach_port_name_t reply_port;
  uint64_t v7;
  uint64_t v8;
  BOOL v9;
  int v11;
  int rcv_name;
  int rcv_name_4;
  mach_port_t rcv_name_8;
  _BYTE rcv_name_12[32];

  memset(&rcv_name_12[4], 0, 28);
  rcv_name = 0;
  reply_port = mig_get_reply_port();
  rcv_name_4 = a1;
  rcv_name_8 = reply_port;
  v11 = 5395;
  *(_QWORD *)rcv_name_12 = 0x5B955000000000;
  if (MEMORY[0x1E0C85B60])
  {
    voucher_mach_msg_set((mach_msg_header_t *)&v11);
    reply_port = rcv_name_8;
  }
  v7 = mach_msg((mach_msg_header_t *)&v11, 275, 0x18u, 0x30u, reply_port, a3, 0);
  v8 = v7;
  if ((v7 - 268435458) <= 0xE && ((1 << (v7 - 2)) & 0x4003) != 0)
  {
    mig_put_reply_port(rcv_name_8);
  }
  else
  {
    if (!(_DWORD)v7)
    {
      if (*(_DWORD *)&rcv_name_12[4] == 71)
      {
        v8 = 4294966988;
      }
      else if (*(_DWORD *)&rcv_name_12[4] == 6002100)
      {
        if ((v11 & 0x80000000) == 0)
        {
          if (rcv_name == 40)
          {
            if (!rcv_name_4)
            {
              v8 = *(unsigned int *)&rcv_name_12[16];
              if (!*(_DWORD *)&rcv_name_12[16])
              {
                *a2 = rcv_name_12[20];
                return v8;
              }
              goto LABEL_26;
            }
          }
          else if (rcv_name == 36)
          {
            if (rcv_name_4)
              v9 = 1;
            else
              v9 = *(_DWORD *)&rcv_name_12[16] == 0;
            if (v9)
              v8 = 4294966996;
            else
              v8 = *(unsigned int *)&rcv_name_12[16];
            goto LABEL_26;
          }
        }
        v8 = 4294966996;
      }
      else
      {
        v8 = 4294966995;
      }
LABEL_26:
      mach_msg_destroy((mach_msg_header_t *)&v11);
      return v8;
    }
    mig_dealloc_reply_port(rcv_name_8);
  }
  if ((v8 - 268435459) <= 1)
  {
    if ((v11 & 0x1F00) == 0x1100)
      mach_port_deallocate(*MEMORY[0x1E0C83DA0], rcv_name_8);
    goto LABEL_26;
  }
  return v8;
}

uint64_t BSCompareIntegers()
{
  return MEMORY[0x1E0D01138]();
}

uint64_t BSDeserializeDataFromXPCDictionaryWithKey()
{
  return MEMORY[0x1E0D011D0]();
}

uint64_t BSDeserializeStringFromXPCDictionaryWithKey()
{
  return MEMORY[0x1E0D011F0]();
}

uint64_t BSDispatchQueueCreate()
{
  return MEMORY[0x1E0D01238]();
}

uint64_t BSDispatchQueueCreateSerial()
{
  return MEMORY[0x1E0D01240]();
}

uint64_t BSDispatchQueueCreateSerialWithQoS()
{
  return MEMORY[0x1E0D01248]();
}

uint64_t BSEqualObjects()
{
  return MEMORY[0x1E0D01280]();
}

uint64_t BSEqualStrings()
{
  return MEMORY[0x1E0D01290]();
}

uint64_t BSFloatEqualToFloat()
{
  return MEMORY[0x1E0D012D0]();
}

uint64_t BSFloatGreaterThanOrEqualToFloat()
{
  return MEMORY[0x1E0D012E8]();
}

uint64_t BSFloatLessThanOrEqualToFloat()
{
  return MEMORY[0x1E0D01308]();
}

uint64_t BSGetVersionedPID()
{
  return MEMORY[0x1E0D01320]();
}

uint64_t BSHashPurify32()
{
  return MEMORY[0x1E0D01328]();
}

uint64_t BSHashPurifyNS()
{
  return MEMORY[0x1E0D01330]();
}

uint64_t BSInterfaceOrientationIsValid()
{
  return MEMORY[0x1E0D01358]();
}

uint64_t BSPointEqualToPoint()
{
  return MEMORY[0x1E0D01480]();
}

uint64_t BSPointFromValue()
{
  return MEMORY[0x1E0D01488]();
}

uint64_t BSProcessDescriptionForPID()
{
  return MEMORY[0x1E0D014A8]();
}

uint64_t BSRunLoopPerformAfterCACommit()
{
  return MEMORY[0x1E0D01500]();
}

uint64_t BSSerializeDataToXPCDictionaryWithKey()
{
  return MEMORY[0x1E0D01558]();
}

uint64_t BSSerializeStringToXPCDictionaryWithKey()
{
  return MEMORY[0x1E0D01578]();
}

uint64_t BSValueWithPoint()
{
  return MEMORY[0x1E0D01668]();
}

void CCHmacFinal(CCHmacContext *ctx, void *macOut)
{
  MEMORY[0x1E0C801F8](ctx, macOut);
}

void CCHmacInit(CCHmacContext *ctx, CCHmacAlgorithm algorithm, const void *key, size_t keyLength)
{
  MEMORY[0x1E0C80200](ctx, *(_QWORD *)&algorithm, key, keyLength);
}

void CCHmacUpdate(CCHmacContext *ctx, const void *data, size_t dataLength)
{
  MEMORY[0x1E0C80218](ctx, data, dataLength);
}

CCRNGStatus CCRandomGenerateBytes(void *bytes, size_t count)
{
  return MEMORY[0x1E0C802C0](bytes, count);
}

CFIndex CFArrayGetCount(CFArrayRef theArray)
{
  return MEMORY[0x1E0C97D60](theArray);
}

const void *__cdecl CFArrayGetValueAtIndex(CFArrayRef theArray, CFIndex idx)
{
  return (const void *)MEMORY[0x1E0C97D98](theArray, idx);
}

CFStringRef CFCopyDescription(CFTypeRef cf)
{
  return (CFStringRef)MEMORY[0x1E0C98350](cf);
}

CFMachPortRef CFMachPortCreateWithPort(CFAllocatorRef allocator, mach_port_t portNum, CFMachPortCallBack callout, CFMachPortContext *context, Boolean *shouldFreeInfo)
{
  return (CFMachPortRef)MEMORY[0x1E0C98820](allocator, *(_QWORD *)&portNum, callout, context, shouldFreeInfo);
}

void CFMachPortSetInvalidationCallBack(CFMachPortRef port, CFMachPortInvalidationCallBack callout)
{
  MEMORY[0x1E0C98850](port, callout);
}

void CFNotificationCenterAddObserver(CFNotificationCenterRef center, const void *observer, CFNotificationCallback callBack, CFStringRef name, const void *object, CFNotificationSuspensionBehavior suspensionBehavior)
{
  MEMORY[0x1E0C988B0](center, observer, callBack, name, object, suspensionBehavior);
}

CFNotificationCenterRef CFNotificationCenterGetLocalCenter(void)
{
  return (CFNotificationCenterRef)MEMORY[0x1E0C988D0]();
}

void CFNotificationCenterPostNotification(CFNotificationCenterRef center, CFNotificationName name, const void *object, CFDictionaryRef userInfo, Boolean deliverImmediately)
{
  MEMORY[0x1E0C988E0](center, name, object, userInfo, deliverImmediately);
}

void CFNotificationCenterRemoveObserver(CFNotificationCenterRef center, const void *observer, CFNotificationName name, const void *object)
{
  MEMORY[0x1E0C98900](center, observer, name, object);
}

Boolean CFPropertyListIsValid(CFPropertyListRef plist, CFPropertyListFormat format)
{
  return MEMORY[0x1E0C98AF0](plist, format);
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

CFStringRef CFStringCreateWithFormat(CFAllocatorRef alloc, CFDictionaryRef formatOptions, CFStringRef format, ...)
{
  return (CFStringRef)MEMORY[0x1E0C99018](alloc, formatOptions, format);
}

Boolean CFStringGetCString(CFStringRef theString, char *buffer, CFIndex bufferSize, CFStringEncoding encoding)
{
  return MEMORY[0x1E0C99098](theString, buffer, bufferSize, *(_QWORD *)&encoding);
}

BOOL CGRectEqualToRect(CGRect rect1, CGRect rect2)
{
  return MEMORY[0x1E0C9D570]((__n128)rect1.origin, *(__n128 *)&rect1.origin.y, (__n128)rect1.size, *(__n128 *)&rect1.size.height, (__n128)rect2.origin, *(__n128 *)&rect2.origin.y, (__n128)rect2.size, *(__n128 *)&rect2.size.height);
}

uint64_t GSKeyboardGetLiveModifierState()
{
  return MEMORY[0x1E0D27BE0]();
}

uint64_t GSKeyboardGetModifierState()
{
  return MEMORY[0x1E0D27BF8]();
}

uint64_t GSKeyboardIsGlobeKeyUsagePair()
{
  return MEMORY[0x1E0D27C10]();
}

uint64_t GSKeyboardTranslateKeyExtendedCommandWithUsagePage()
{
  return MEMORY[0x1E0D27C30]();
}

uint64_t GSSetMainScreenInfo()
{
  return MEMORY[0x1E0D27C78]();
}

uint64_t IOHIDEventCreateVendorDefinedEvent()
{
  return MEMORY[0x1E0CBB0D0]();
}

uint64_t IOHIDEventGetAttributeDataLength()
{
  return MEMORY[0x1E0CBB0E8]();
}

uint64_t IOHIDEventGetAttributeDataPtr()
{
  return MEMORY[0x1E0CBB0F0]();
}

uint64_t IOHIDEventGetChildren()
{
  return MEMORY[0x1E0CBB0F8]();
}

uint64_t IOHIDEventGetDataValue()
{
  return MEMORY[0x1E0CBB100]();
}

uint64_t IOHIDEventGetDoubleValue()
{
  return MEMORY[0x1E0CBB108]();
}

uint64_t IOHIDEventGetEvent()
{
  return MEMORY[0x1E0CBB110]();
}

uint64_t IOHIDEventGetFloatValue()
{
  return MEMORY[0x1E0CBB128]();
}

uint64_t IOHIDEventGetIntegerValue()
{
  return MEMORY[0x1E0CBB130]();
}

uint64_t IOHIDEventGetPhase()
{
  return MEMORY[0x1E0CBB148]();
}

uint64_t IOHIDEventGetSenderID()
{
  return MEMORY[0x1E0CBB150]();
}

uint64_t IOHIDEventGetType()
{
  return MEMORY[0x1E0CBB168]();
}

uint64_t IOHIDEventGetTypeString()
{
  return MEMORY[0x1E0CBB170]();
}

uint64_t IOHIDEventGetVendorDefinedData()
{
  return MEMORY[0x1E0CBB178]();
}

uint64_t IOHIDEventSetAttributeData()
{
  return MEMORY[0x1E0CBB190]();
}

uint64_t IOHIDEventSystemClientCreateWithType()
{
  return MEMORY[0x1E0CBB1F8]();
}

uint64_t IOHIDEventSystemClientDispatchEvent()
{
  return MEMORY[0x1E0CBB200]();
}

uint64_t IOHIDEventSystemClientRegisterEventCallback()
{
  return MEMORY[0x1E0CBB220]();
}

uint64_t IOHIDEventSystemClientScheduleWithRunLoop()
{
  return MEMORY[0x1E0CBB250]();
}

uint64_t IOHIDEventTypeGetName()
{
  return MEMORY[0x1E0CBB360]();
}

uint64_t MGGetBoolAnswer()
{
  return MEMORY[0x1E0DE2B50]();
}

uint64_t NSStringFromBSVersionedPID()
{
  return MEMORY[0x1E0D01680]();
}

NSString *__cdecl NSStringFromClass(Class aClass)
{
  return (NSString *)MEMORY[0x1E0CB3200](aClass);
}

NSString *__cdecl NSStringFromSelector(SEL aSelector)
{
  return (NSString *)MEMORY[0x1E0CB3230](aSelector);
}

void _Block_object_dispose(const void *a1, const int a2)
{
  MEMORY[0x1E0C80948](a1, *(_QWORD *)&a2);
}

uint64_t _CFRuntimeCreateInstance()
{
  return MEMORY[0x1E0C9A498]();
}

uint64_t _CFRuntimeRegisterClass()
{
  return MEMORY[0x1E0C9A4B0]();
}

uint64_t _IOHIDEventCopyAttachment()
{
  return MEMORY[0x1E0CBBA70]();
}

uint64_t _IOHIDEventSetAttachment()
{
  return MEMORY[0x1E0CBBA88]();
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

uint64_t _bs_set_crash_log_message()
{
  return MEMORY[0x1E0D018D8]();
}

void _os_log_debug_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x1E0C81020](dso, log, type, format, buf, *(_QWORD *)&size);
}

void _os_log_error_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x1E0C81038](dso, log, type, format, buf, *(_QWORD *)&size);
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x1E0C81048](dso, log, type, format, buf, *(_QWORD *)&size);
}

uint64_t _sl_dlopen()
{
  return MEMORY[0x1E0DA88F0]();
}

kern_return_t bootstrap_look_up(mach_port_t bp, const name_t service_name, mach_port_t *sp)
{
  return MEMORY[0x1E0C81708](*(_QWORD *)&bp, service_name, sp);
}

void bzero(void *a1, size_t a2)
{
  MEMORY[0x1E0C81758](a1, a2);
}

objc_property_t *__cdecl class_copyPropertyList(Class cls, unsigned int *outCount)
{
  return (objc_property_t *)MEMORY[0x1E0DE7A80](cls, outCount);
}

__uint64_t clock_gettime_nsec_np(clockid_t __clock_id)
{
  return MEMORY[0x1E0C82670](*(_QWORD *)&__clock_id);
}

void dispatch_assert_queue_V2(dispatch_queue_t queue)
{
  MEMORY[0x1E0C82BE8](queue);
}

void dispatch_assert_queue_not_V2(dispatch_queue_t queue)
{
  MEMORY[0x1E0C82BF8](queue);
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

dispatch_queue_t dispatch_queue_create(const char *label, dispatch_queue_attr_t attr)
{
  return (dispatch_queue_t)MEMORY[0x1E0C82E48](label, attr);
}

dispatch_queue_t dispatch_queue_create_with_target_V2(const char *label, dispatch_queue_attr_t attr, dispatch_queue_t target)
{
  return (dispatch_queue_t)MEMORY[0x1E0C82E50](label, attr, target);
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

void dispatch_sync(dispatch_queue_t queue, dispatch_block_t block)
{
  MEMORY[0x1E0C82F90](queue, block);
}

char *dlerror(void)
{
  return (char *)MEMORY[0x1E0C83038]();
}

void *__cdecl dlsym(void *__handle, const char *__symbol)
{
  return (void *)MEMORY[0x1E0C83050](__handle, __symbol);
}

void exit(int a1)
{
  MEMORY[0x1E0C83278](*(_QWORD *)&a1);
}

int fprintf(FILE *a1, const char *a2, ...)
{
  return MEMORY[0x1E0C83478](a1, a2);
}

void free(void *a1)
{
  MEMORY[0x1E0C834A8](a1);
}

pid_t getpid(void)
{
  return MEMORY[0x1E0C83760]();
}

uint64_t kdebug_trace()
{
  return MEMORY[0x1E0C83A20]();
}

uint64_t mach_continuous_time(void)
{
  return MEMORY[0x1E0C83C70]();
}

char *__cdecl mach_error_string(mach_error_t error_value)
{
  return (char *)MEMORY[0x1E0C83C80](*(_QWORD *)&error_value);
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

kern_return_t mach_port_mod_refs(ipc_space_t task, mach_port_name_t name, mach_port_right_t right, mach_port_delta_t delta)
{
  return MEMORY[0x1E0C83D58](*(_QWORD *)&task, *(_QWORD *)&name, *(_QWORD *)&right, *(_QWORD *)&delta);
}

kern_return_t mach_port_set_attributes(ipc_space_t task, mach_port_name_t name, mach_port_flavor_t flavor, mach_port_info_t port_info, mach_msg_type_number_t port_infoCnt)
{
  return MEMORY[0x1E0C83D78](*(_QWORD *)&task, *(_QWORD *)&name, *(_QWORD *)&flavor, port_info, *(_QWORD *)&port_infoCnt);
}

kern_return_t mach_port_type(ipc_space_t task, mach_port_name_t name, mach_port_type_t *ptype)
{
  return MEMORY[0x1E0C83D88](*(_QWORD *)&task, *(_QWORD *)&name, ptype);
}

void *__cdecl malloc_type_calloc(size_t count, size_t size, malloc_type_id_t type_id)
{
  return (void *)MEMORY[0x1E0C83EF8](count, size, type_id);
}

void *__cdecl malloc_type_malloc(size_t size, malloc_type_id_t type_id)
{
  return (void *)MEMORY[0x1E0C83F00](size, type_id);
}

void *__cdecl memcpy(void *__dst, const void *__src, size_t __n)
{
  return (void *)MEMORY[0x1E0C84088](__dst, __src, __n);
}

void mig_dealloc_reply_port(mach_port_t reply_port)
{
  MEMORY[0x1E0C840E8](*(_QWORD *)&reply_port);
}

uint64_t mig_dealloc_special_reply_port()
{
  return MEMORY[0x1E0C840F0]();
}

mach_port_t mig_get_reply_port(void)
{
  return MEMORY[0x1E0C84100]();
}

uint64_t mig_get_special_reply_port()
{
  return MEMORY[0x1E0C84108]();
}

void mig_put_reply_port(mach_port_t reply_port)
{
  MEMORY[0x1E0C84110](*(_QWORD *)&reply_port);
}

int mig_strncpy(char *dest, const char *src, int len)
{
  return MEMORY[0x1E0C84120](dest, src, *(_QWORD *)&len);
}

int mig_strncpy_zerofill(char *dest, const char *src, int len)
{
  return MEMORY[0x1E0C84128](dest, src, *(_QWORD *)&len);
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

id objc_alloc(Class a1)
{
  return (id)MEMORY[0x1E0DE7BA8](a1);
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

uint64_t objc_claimAutoreleasedReturnValue()
{
  return MEMORY[0x1E0DE7BF8]();
}

void objc_copyWeak(id *to, id *from)
{
  MEMORY[0x1E0DE7C38](to, from);
}

void objc_destroyWeak(id *location)
{
  MEMORY[0x1E0DE7C60](location);
}

void objc_enumerationMutation(id obj)
{
  MEMORY[0x1E0DE7C90](obj);
}

void objc_exception_throw(id exception)
{
  MEMORY[0x1E0DE7CA0](exception);
}

Class objc_getClass(const char *name)
{
  return (Class)MEMORY[0x1E0DE7CB0](name);
}

id objc_initWeak(id *location, id val)
{
  return (id)MEMORY[0x1E0DE7CE0](location, val);
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

id objc_retainBlock(id a1)
{
  return (id)MEMORY[0x1E0DE7E70](a1);
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

id objc_unsafeClaimAutoreleasedReturnValue(id a1)
{
  return (id)MEMORY[0x1E0DE7FE0](a1);
}

os_log_t os_log_create(const char *subsystem, const char *category)
{
  return (os_log_t)MEMORY[0x1E0C84728](subsystem, category);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x1E0C84780](oslog, type);
}

void os_unfair_lock_assert_not_owner(const os_unfair_lock *lock)
{
  MEMORY[0x1E0C84988](lock);
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

char *__cdecl property_copyAttributeValue(objc_property_t property, const char *attributeName)
{
  return (char *)MEMORY[0x1E0DE8060](property, attributeName);
}

const char *__cdecl property_getName(objc_property_t property)
{
  return (const char *)MEMORY[0x1E0DE8070](property);
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

int pthread_once(pthread_once_t *a1, void (*a2)(void))
{
  return MEMORY[0x1E0C84E68](a1, a2);
}

int pthread_setspecific(pthread_key_t a1, const void *a2)
{
  return MEMORY[0x1E0C84F18](a1, a2);
}

int strcmp(const char *__s1, const char *__s2)
{
  return MEMORY[0x1E0C85520](__s1, __s2);
}

int timingsafe_bcmp(const void *__b1, const void *__b2, size_t __len)
{
  return MEMORY[0x1E0C85970](__b1, __b2, __len);
}

BOOLean_t voucher_mach_msg_set(mach_msg_header_t *msg)
{
  return MEMORY[0x1E0C85B60](msg);
}

xpc_connection_t xpc_connection_create(const char *name, dispatch_queue_t targetq)
{
  return (xpc_connection_t)MEMORY[0x1E0C85F90](name, targetq);
}

void xpc_connection_resume(xpc_connection_t connection)
{
  MEMORY[0x1E0C86018](connection);
}

void xpc_connection_set_event_handler(xpc_connection_t connection, xpc_handler_t handler)
{
  MEMORY[0x1E0C86080](connection, handler);
}

xpc_object_t xpc_dictionary_get_value(xpc_object_t xdict, const char *key)
{
  return (xpc_object_t)MEMORY[0x1E0C862E0](xdict, key);
}

void xpc_dictionary_set_value(xpc_object_t xdict, const char *key, xpc_object_t value)
{
  MEMORY[0x1E0C863B8](xdict, key, value);
}

xpc_endpoint_t xpc_endpoint_create(xpc_connection_t connection)
{
  return (xpc_endpoint_t)MEMORY[0x1E0C863F0](connection);
}

xpc_type_t xpc_get_type(xpc_object_t object)
{
  return (xpc_type_t)MEMORY[0x1E0C86520](object);
}

