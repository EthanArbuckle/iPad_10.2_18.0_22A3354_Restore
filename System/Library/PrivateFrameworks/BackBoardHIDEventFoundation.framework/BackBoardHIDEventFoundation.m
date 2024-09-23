uint64_t _BKHIDEventSenderMatchesSenderSet(void *a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  id v12;
  id v13;
  id v14;
  uint64_t v15;
  uint64_t v16;
  int v17;
  int v18;
  int v19;
  uint64_t v20;
  void *v21;
  void *v22;
  void *v23;
  id v24;
  id v25;
  char v26;
  uint64_t v27;
  id v29;
  id obj;
  void *v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  _BYTE v36[128];
  uint64_t v37;

  v37 = *MEMORY[0x1E0C80C00];
  v5 = a1;
  v6 = a2;
  v7 = a3;
  v8 = 1;
  v31 = v5;
  if (v5 && v6)
  {
    v34 = 0u;
    v35 = 0u;
    v32 = 0u;
    v33 = 0u;
    obj = v6;
    v8 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v32, v36, 16);
    if (v8)
    {
      v29 = v6;
      v9 = *(_QWORD *)v33;
      do
      {
        v10 = 0;
        do
        {
          if (*(_QWORD *)v33 != v9)
            objc_enumerationMutation(obj);
          v11 = *(void **)(*((_QWORD *)&v32 + 1) + 8 * v10);
          v12 = v31;
          v13 = v11;
          v14 = v7;
          v15 = objc_msgSend(v13, "senderID");
          if (v15 && v15 != objc_msgSend(v12, "senderID")
            || objc_msgSend(v13, "isAuthenticated") && !objc_msgSend(v12, "isAuthenticated")
            || (v16 = objc_msgSend(v13, "hardwareType")) != 0 && v16 != objc_msgSend(v12, "hardwareType")
            || (v17 = objc_msgSend(v13, "primaryPage"), v18 = objc_msgSend(v13, "primaryUsage"), v17)
            && ((v19 = v18, v17 != objc_msgSend(v12, "primaryPage"))
             || v19 && v19 != objc_msgSend(v12, "primaryUsage")))
          {

          }
          else
          {
            objc_msgSend(v13, "associatedDisplay");
            v20 = objc_claimAutoreleasedReturnValue();
            if (!v20)
            {

LABEL_33:
              v8 = 1;
              goto LABEL_34;
            }
            v21 = (void *)v20;
            objc_msgSend(v12, "associatedDisplay");
            v22 = (void *)objc_claimAutoreleasedReturnValue();
            if (v22)
            {
              v23 = v22;
              if (objc_msgSend(v22, "_isBuiltinDisplay"))
              {
                v24 = v14;

                v23 = v24;
              }
            }
            else
            {
              objc_msgSend(MEMORY[0x1E0D00CF8], "nullDisplay");
              v23 = (void *)objc_claimAutoreleasedReturnValue();
            }
            if (objc_msgSend(v21, "_isBuiltinDisplay"))
            {
              v25 = v14;

              v21 = v25;
            }
            v26 = objc_msgSend(v23, "isEqual:", v21);

            if ((v26 & 1) != 0)
              goto LABEL_33;
          }
          ++v10;
        }
        while (v8 != v10);
        v27 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v32, v36, 16);
        v8 = v27;
      }
      while (v27);
LABEL_34:
      v6 = v29;
    }

  }
  return v8;
}

void _BKSendHIDEventToClientWithDestination(uint64_t a1, void *a2, char a3)
{
  void *v5;
  void *v6;
  uint64_t v7;
  const void *v8;
  id v9;

  v9 = a2;
  if ((a3 & 1) != 0
    || !__BKHIDEventTapCallback
    || (objc_msgSend((id)__HIDClientConnectionManager, "clientForDestination:", v9),
        v5 = (void *)objc_claimAutoreleasedReturnValue(),
        objc_msgSend(v5, "bundleID"),
        v6 = (void *)objc_claimAutoreleasedReturnValue(),
        v5,
        LODWORD(v5) = __BKHIDEventTapCallback(a1, 0, v6),
        v6,
        (_DWORD)v5))
  {
    v7 = objc_msgSend((id)__HIDClientConnectionManager, "copyClientForDestination:", v9);
    if (v7)
    {
      v8 = (const void *)v7;
      _BKSendHIDEventToClientConnection(a1, v7);
      CFRelease(v8);
    }
  }

}

void BKSendHIDEventToClientWithTaskPort(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  const void *v5;
  NSObject *v6;
  _DWORD v7[2];
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  if (!__BKHIDEventTapCallback || __BKHIDEventTapCallback(a1, a2, 0))
  {
    v4 = objc_msgSend((id)__HIDClientConnectionManager, "copyClientForTaskPort:", a2);
    if (v4)
    {
      v5 = (const void *)v4;
      _BKSendHIDEventToClientConnection(a1, v4);
      CFRelease(v5);
    }
    else
    {
      BKLogCommon();
      v6 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
      {
        v7[0] = 67109120;
        v7[1] = a2;
        _os_log_impl(&dword_1C8914000, v6, OS_LOG_TYPE_DEFAULT, "no client connection for port 0x%X", (uint8_t *)v7, 8u);
      }

    }
  }
}

void _BKSendHIDEventToClientConnection(uint64_t a1, uint64_t a2)
{
  NSObject *v3;
  int v4;
  int v5;
  NSObject *v6;
  uint64_t Name;
  int v8;
  _DWORD v9[7];

  *(_QWORD *)&v9[5] = *MEMORY[0x1E0C80C00];
  BKLogSendHIDEvent();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
  {
    v8 = 138543362;
    *(_QWORD *)v9 = a2;
    _os_log_debug_impl(&dword_1C8914000, v3, OS_LOG_TYPE_DEBUG, "#BKSendHIDEvent: Sending event to client connection: %{public}@", (uint8_t *)&v8, 0xCu);
  }

  v4 = IOHIDEventSystemConnectionDispatchEvent();
  if (v4)
  {
    v5 = v4;
    BKLogCommon();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      IOHIDEventGetType();
      Name = IOHIDEventTypeGetName();
      v8 = 67109378;
      v9[0] = v5;
      LOWORD(v9[1]) = 2114;
      *(_QWORD *)((char *)&v9[1] + 2) = Name;
      _os_log_impl(&dword_1C8914000, v6, OS_LOG_TYPE_DEFAULT, "#BKSendHIDEvent: IOHIDEventSystemConnectionDispatchEvent error:0x%X -- %{public}@ event dropped", (uint8_t *)&v8, 0x12u);
    }

  }
}

id BKLogSendHIDEvent()
{
  if (BKLogSendHIDEvent_onceToken != -1)
    dispatch_once(&BKLogSendHIDEvent_onceToken, &__block_literal_global_24);
  return (id)BKLogSendHIDEvent___logObj;
}

void BKHIDClientConnectionAdditionCallback(uint64_t a1, uint64_t a2, void *a3)
{
  NSObject *v5;
  os_unfair_lock_s *v6;
  void *v7;
  NSObject *v8;
  int v9;
  void *v10;
  void *v11;
  int v12;
  void *v13;
  __int16 v14;
  const void *v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  BKLogHID();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    v12 = 138543362;
    v13 = a3;
    _os_log_debug_impl(&dword_1C8914000, v5, OS_LOG_TYPE_DEBUG, "Got a client addition callback: %{public}@", (uint8_t *)&v12, 0xCu);
  }

  if (a1)
  {
    CFRetain(a3);
    v6 = (os_unfair_lock_s *)(a1 + 48);
    os_unfair_lock_assert_not_owner((const os_unfair_lock *)(a1 + 48));
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 48));
    CFDictionaryGetValue(*(CFDictionaryRef *)(a1 + 40), a3);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v7)
    {
      +[BKHIDClientConnection connectionWithConnection:](BKHIDClientConnection, "connectionWithConnection:", a3);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      if (v7)
      {
        BKLogHID();
        v8 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
        {
          v12 = 138543618;
          v13 = v7;
          v14 = 2114;
          v15 = a3;
          _os_log_impl(&dword_1C8914000, v8, OS_LOG_TYPE_DEFAULT, "Adding client connection: %{public}@ for client: %{public}@", (uint8_t *)&v12, 0x16u);
        }

        v9 = objc_msgSend(v7, "pid");
        CFDictionarySetValue(*(CFMutableDictionaryRef *)(a1 + 40), a3, v7);
        objc_msgSend(*(id *)(a1 + 16), "setObject:forKey:", v7, objc_msgSend(v7, "task"));
        objc_msgSend(*(id *)(a1 + 24), "setObject:forKey:", v7, v9);
        v10 = *(void **)(a1 + 32);
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", objc_msgSend(v7, "versionedPID"));
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "setObject:forKey:", v7, v11);

      }
    }
    os_unfair_lock_unlock(v6);
    CFRelease(a3);

  }
}

void _BKHIDServiceRemoved(void *a1, uint64_t a2, uint64_t a3)
{
  NSObject *v5;
  id v6;
  int v7;
  uint64_t v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  BKLogHID();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    v7 = 138543362;
    v8 = a3;
    _os_log_debug_impl(&dword_1C8914000, v5, OS_LOG_TYPE_DEBUG, "Got a service removed callback: %{public}@", (uint8_t *)&v7, 0xCu);
  }

  v6 = a1;
  objc_msgSend(v6, "_serviceWasRemoved");

}

void _BKHIDServiceAdded(void *a1, uint64_t a2, const __CFArray *a3, const __CFArray *a4)
{
  NSObject *v7;
  NSObject *v8;
  int v9;
  const __CFArray *v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  BKLogHID();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    v9 = 138543362;
    v10 = a4;
    _os_log_impl(&dword_1C8914000, v7, OS_LOG_TYPE_INFO, "IOServices added: %{public}@", (uint8_t *)&v9, 0xCu);
  }

  if (a4 && CFArrayGetCount(a4))
  {
    objc_msgSend(a1, "_servicesAdded:", a4);
  }
  else
  {
    BKLogHID();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      v9 = 138543362;
      v10 = a3;
      _os_log_impl(&dword_1C8914000, v8, OS_LOG_TYPE_INFO, "Empty IOService array for sender %{public}@; ignoring",
        (uint8_t *)&v9,
        0xCu);
    }

  }
}

id BKLogHID()
{
  if (BKLogHID_onceToken != -1)
    dispatch_once(&BKLogHID_onceToken, &__block_literal_global_10);
  return (id)BKLogHID___logObj;
}

uint64_t _BKIOHIDEventCallback(uint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  _BKHandleIOHIDEventFromSender(a4, a3);
  return 0;
}

uint64_t _BKHandleIOHIDEventFromSender(void *a1, uint64_t a2)
{
  void *v4;
  uint64_t AttributeDataPtr;
  NSObject *v6;
  void *v7;
  uint64_t v8;
  id v9;
  void *v10;
  _BOOL4 v11;
  const __CFNumber *RegistryID;
  void *v13;
  void *v14;
  NSObject *p_super;
  NSObject *v16;
  BKIOHIDService *v17;
  NSObject *v18;
  NSObject *v19;
  void *v20;
  void *v22;
  void *v23;
  void *v24;
  uint64_t v25;
  uint64_t v26;
  NSObject *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  NSObject *v32;
  void *v33;
  void *v34;
  NSObject *v35;
  void *v36;
  uint64_t SenderID;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t i;
  void *v42;
  const void *Copy;
  void *v44;
  NSObject *v45;
  NSObject *v46;
  NSObject *v47;
  void *v48;
  void *v49;
  __int128 valuePtr;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  _QWORD v54[4];
  id v55;
  id v56;
  int v57;
  uint8_t buf[4];
  void *v59;
  __int16 v60;
  uint64_t v61;
  __int16 v62;
  void *v63;
  uint64_t v64;

  v64 = *MEMORY[0x1E0C80C00];
  v49 = a1;
  v4 = (void *)MEMORY[0x1CAA37D00]();
  if (IOHIDEventGetAttributeDataLength() < 1)
  {
    +[BKHIDSystem sharedInstance](BKHIDSystem, "sharedInstance");
    v6 = objc_claimAutoreleasedReturnValue();
    *(_QWORD *)&valuePtr = 0;
    if (a1)
    {
      *(_QWORD *)&valuePtr = IOHIDEventGetSenderID();
      v11 = (_QWORD)valuePtr == 0;
      if (!a2)
        goto LABEL_20;
    }
    else
    {
      v11 = 1;
      if (!a2)
        goto LABEL_20;
    }
    if (v11)
    {
      RegistryID = (const __CFNumber *)IOHIDServiceGetRegistryID();
      if (RegistryID)
        CFNumberGetValue(RegistryID, kCFNumberSInt64Type, &valuePtr);
    }
LABEL_20:
    +[BKHIDSystem sharedInstance](BKHIDSystem, "sharedInstance");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "senderCache");
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v14, "senderInfoForSenderID:", (_QWORD)valuePtr);
    p_super = objc_claimAutoreleasedReturnValue();
    if (a2)
    {
      if (!(_QWORD)valuePtr)
        goto LABEL_30;
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
        goto LABEL_30;
      BKLogCommon();
      v16 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 134217984;
        v59 = (void *)valuePtr;
        _os_log_impl(&dword_1C8914000, v16, OS_LOG_TYPE_INFO, "populating sender cache for unknown sender with senderID:%llX", buf, 0xCu);
      }

      v17 = -[BKIOHIDService initWithHIDServiceRef:]([BKIOHIDService alloc], "initWithHIDServiceRef:", a2);
      objc_msgSend(v14, "addSenderInfo:forSenderID:", v17, (_QWORD)valuePtr);
      v18 = p_super;
      p_super = &v17->super;
    }
    else
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
LABEL_30:

        -[NSObject dispatcherProvider](v6, "dispatcherProvider");
        v19 = objc_claimAutoreleasedReturnValue();
        -[NSObject dispatcherForEvent:](v19, "dispatcherForEvent:", a1);
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        -[NSObject processEvent:sender:dispatcher:](v6, "processEvent:sender:dispatcher:", &v49, p_super, v20);

LABEL_31:
LABEL_32:

        goto LABEL_33;
      }
      BKLogCommon();
      v18 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 134217984;
        v59 = (void *)valuePtr;
        _os_log_impl(&dword_1C8914000, v18, OS_LOG_TYPE_INFO, "no IOHIDServiceRef for unknown senderID:%llX", buf, 0xCu);
      }
    }

    goto LABEL_30;
  }
  if (IOHIDEventGetAttributeDataLength() < 6
    || (AttributeDataPtr = IOHIDEventGetAttributeDataPtr()) == 0
    || !*(_DWORD *)(AttributeDataPtr + 4)
    || *(_BYTE *)AttributeDataPtr != 3)
  {
    BKLogEventDelivery();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543362;
      v59 = a1;
      _os_log_error_impl(&dword_1C8914000, v6, OS_LOG_TYPE_ERROR, "ignoring event with non-redirect attribute data: %{public}@", buf, 0xCu);
    }
    goto LABEL_32;
  }
  if (a1)
  {
    +[BKHIDSystem sharedInstance](BKHIDSystem, "sharedInstance");
    v6 = objc_claimAutoreleasedReturnValue();
    BKSHIDEventGetBaseAttributes();
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_opt_class();
    v9 = v7;
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
    p_super = v10;

    if (p_super)
    {
      -[NSObject environment](p_super, "environment");
      v19 = objc_claimAutoreleasedReturnValue();
      -[NSObject source](p_super, "source");
      -[NSObject display](p_super, "display");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v22)
      {
        -[NSObject deliveryManager](v6, "deliveryManager");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v23, "mainDisplay");
        v22 = (void *)objc_claimAutoreleasedReturnValue();

      }
      -[NSObject token](p_super, "token");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSObject options](p_super, "options");
      v25 = -[NSObject pid](p_super, "pid");
      v48 = v22;
      if ((int)v25 <= 0)
      {
        BKLogCommon();
        v32 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138543362;
          v59 = a1;
          _os_log_error_impl(&dword_1C8914000, v32, OS_LOG_TYPE_ERROR, "must have a valid destination PID must be set to redirect events -- not redirecting '%{public}@'", buf, 0xCu);
        }
      }
      else
      {
        v26 = v25;
        v46 = v6;
        v47 = v19;
        v44 = v24;
        if (v19)
        {
          v27 = v6;
          v28 = v24;
          v29 = (void *)objc_msgSend(MEMORY[0x1E0D00D80], "new");
          objc_msgSend(v29, "setDisplay:", v22);
          objc_msgSend(v29, "setEnvironment:", v47);
          objc_msgSend(v29, "setToken:", v28);
          -[NSObject deliveryManager](v27, "deliveryManager");
          v30 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v30, "destinationsStartingFromPID:deferringPredicate:", v26, v29);
          v31 = (void *)objc_claimAutoreleasedReturnValue();

        }
        else
        {
          v33 = (void *)MEMORY[0x1E0D00CB0];
          v54[0] = MEMORY[0x1E0C809B0];
          v54[1] = 3221225472;
          v54[2] = ___BKRedirectHIDEvent_block_invoke;
          v54[3] = &unk_1E81F7AF8;
          v55 = v22;
          v57 = v26;
          v56 = v24;
          objc_msgSend(v33, "build:", v54);
          v34 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(MEMORY[0x1E0C99E60], "setWithObject:", v34);
          v31 = (void *)objc_claimAutoreleasedReturnValue();

        }
        v45 = p_super;
        BKLogHID();
        v35 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v35, OS_LOG_TYPE_DEFAULT))
        {
          BKSHIDEventGetConciseDescription();
          v36 = (void *)objc_claimAutoreleasedReturnValue();
          SenderID = IOHIDEventGetSenderID();
          *(_DWORD *)buf = 138543874;
          v59 = v36;
          v60 = 2048;
          v61 = SenderID;
          v62 = 2114;
          v63 = v31;
          _os_log_impl(&dword_1C8914000, v35, OS_LOG_TYPE_DEFAULT, "Redirecting HID event (%{public}@ / senderID:%llX) to destinations: %{public}@", buf, 0x20u);

        }
        IOHIDEventGetTimeStamp();
        kdebug_trace();
        valuePtr = 0u;
        v51 = 0u;
        v52 = 0u;
        v53 = 0u;
        v32 = v31;
        v38 = -[NSObject countByEnumeratingWithState:objects:count:](v32, "countByEnumeratingWithState:objects:count:", &valuePtr, buf, 16);
        if (v38)
        {
          v39 = v38;
          v40 = *(_QWORD *)v51;
          do
          {
            for (i = 0; i != v39; ++i)
            {
              if (*(_QWORD *)v51 != v40)
                objc_enumerationMutation(v32);
              v42 = *(void **)(*((_QWORD *)&valuePtr + 1) + 8 * i);
              Copy = (const void *)IOHIDEventCreateCopy();
              BKSHIDEventSetSimpleDeliveryInfo();
              _BKSendHIDEventToClientWithDestination((uint64_t)Copy, v42, 1);
              CFRelease(Copy);
            }
            v39 = -[NSObject countByEnumeratingWithState:objects:count:](v32, "countByEnumeratingWithState:objects:count:", &valuePtr, buf, 16);
          }
          while (v39);
        }

        p_super = v45;
        v6 = v46;
        v19 = v47;
        v24 = v44;
      }

    }
    else
    {
      BKLogCommon();
      v19 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138543362;
        v59 = a1;
        _os_log_error_impl(&dword_1C8914000, v19, OS_LOG_TYPE_ERROR, "event does not contain valid redirect info -- not redirecting '%{public}@'", buf, 0xCu);
      }
    }
    goto LABEL_31;
  }
LABEL_33:
  objc_autoreleasePoolPop(v4);
  return 0;
}

void sub_1C891A734(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t _BKHIDNoteUserEventOccurredOnDisplay(uint64_t a1)
{
  return objc_msgSend((id)_userEventNotifier, "userEventOccurredOnDisplay:", a1);
}

id BKHIDEventRoutingGetClientConnectionManager()
{
  return (id)__HIDClientConnectionManager;
}

void sub_1C891AE00(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1C891B2D0(_Unwind_Exception *a1)
{
  uint64_t v1;

  objc_destroyWeak((id *)(v1 - 56));
  _Unwind_Resume(a1);
}

void sub_1C891BEA8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

id _BKResolutionDescriptionForLogging(void *a1, char a2)
{
  id v3;
  void *v4;
  id v5;
  _QWORD v7[4];
  id v8;
  char v9;

  v3 = a1;
  v4 = (void *)objc_opt_new();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = ___BKResolutionDescriptionForLogging_block_invoke;
  v7[3] = &unk_1E81F7020;
  v5 = v4;
  v8 = v5;
  v9 = a2;
  objc_msgSend(v5, "appendCollection:withName:itemBlock:", v3, 0, v7);

  return v5;
}

void BKSendHIDEventToClientWithDestination(uint64_t a1, void *a2)
{
  _BKSendHIDEventToClientWithDestination(a1, a2, 0);
}

void BKHIDClientConnectionRemovalCallback(uint64_t a1, uint64_t a2, void *a3)
{
  NSObject *v5;
  void *v6;
  NSObject *v7;
  void *v8;
  void *v9;
  int v10;
  void *v11;
  __int16 v12;
  const void *v13;
  __int16 v14;
  const __CFString *v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  BKLogHID();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    v10 = 138543362;
    v11 = a3;
    _os_log_debug_impl(&dword_1C8914000, v5, OS_LOG_TYPE_DEBUG, "Got a client removal callback: %{public}@", (uint8_t *)&v10, 0xCu);
  }

  if (a1)
  {
    CFRetain(a3);
    os_unfair_lock_assert_not_owner((const os_unfair_lock *)(a1 + 48));
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 48));
    CFDictionaryGetValue(*(CFDictionaryRef *)(a1 + 40), a3);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (v6)
    {
      BKLogHID();
      v7 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      {
        v10 = 138543874;
        v11 = v6;
        v12 = 2114;
        v13 = a3;
        v14 = 2114;
        v15 = CFSTR("HID");
        _os_log_impl(&dword_1C8914000, v7, OS_LOG_TYPE_DEFAULT, "Removing client connection %{public}@ for client: %{public}@ source:%{public}@", (uint8_t *)&v10, 0x20u);
      }

      objc_msgSend(*(id *)(a1 + 16), "removeObjectForKey:", objc_msgSend(v6, "task"));
      objc_msgSend(*(id *)(a1 + 24), "removeObjectForKey:", (int)objc_msgSend(v6, "pid"));
      v8 = *(void **)(a1 + 32);
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", objc_msgSend(v6, "versionedPID"));
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "removeObjectForKey:", v9);

      CFDictionaryRemoveValue(*(CFMutableDictionaryRef *)(a1 + 40), a3);
      objc_msgSend(v6, "invalidate");
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 48));
    CFRelease(a3);

  }
}

uint64_t _BKHIDEventDeferringDisplayMatch(void *a1, void *a2)
{
  id v3;
  id v4;
  void *v5;
  uint64_t v6;

  v3 = a1;
  v4 = a2;
  v5 = v4;
  v6 = 1;
  if (v3 && v4 && (objc_msgSend(v4, "_isNullDisplay") & 1) == 0)
    v6 = objc_msgSend(v5, "isEqual:", v3);

  return v6;
}

id _BKDeferringTargetForResolutionTranscript(void *a1)
{
  id v1;
  id v2;
  id v3;
  id v4;
  void *v5;
  uint64_t v7;
  uint64_t v8;
  void (*v9)(uint64_t);
  void *v10;
  id v11;
  id v12;

  v1 = a1;
  v2 = objc_alloc_init(MEMORY[0x1E0D01750]);
  v7 = MEMORY[0x1E0C809B0];
  v8 = 3221225472;
  v9 = ___BKDeferringTargetForResolutionTranscript_block_invoke;
  v10 = &unk_1E81F7CF8;
  v11 = v2;
  v12 = v1;
  v3 = v1;
  v4 = v2;
  objc_msgSend(v4, "appendProem:block:", 0, &v7);
  objc_msgSend(v4, "description", v7, v8, v9, v10);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

void _BKDescribeSenderSet(void *a1, void *a2)
{
  id v3;
  void *v4;
  const __CFString *v5;
  id v6;
  id v7;
  _QWORD v8[4];
  id v9;
  id v10;

  v7 = a1;
  v3 = a2;
  v4 = v3;
  if (!v3)
  {
    v5 = CFSTR("(all senders)");
LABEL_6:
    v6 = (id)objc_msgSend(v7, "appendObject:withName:skipIfNil:", v5, 0, 0);
    goto LABEL_7;
  }
  if (!objc_msgSend(v3, "count"))
  {
    v5 = CFSTR("(no senders)");
    goto LABEL_6;
  }
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = ___BKDescribeSenderSet_block_invoke;
  v8[3] = &unk_1E81F7CF8;
  v9 = v7;
  v10 = v4;
  objc_msgSend(v9, "sameLine:", v8);

LABEL_7:
}

void sub_1C89259EC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

id BKHIDCreatePrimaryEventProcessor(void *a1)
{
  id v1;
  void *v2;
  id v3;
  void *v4;
  id v5;
  void *v6;
  uint64_t v7;
  BOOL v8;
  NSObject *v9;
  void *v10;
  void *v12;
  void *v13;
  id v14;
  id v15;
  uint8_t buf[4];
  const __CFString *v17;
  __int16 v18;
  void *v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v1 = a1;
  v15 = 0;
  _BKHIDEventProcessorConfigurationFromRootRelativePath(CFSTR("/System/Library/BackBoard/EventProcessorConfigurationPlatformOverride.plist"), &v15);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v15;
  v4 = v3;
  if (v2)
  {
    v5 = v3;
  }
  else
  {
    objc_msgSend(v3, "domain");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v4, "code");
    if (objc_msgSend(v6, "isEqual:", *MEMORY[0x1E0CB28A8]))
      v8 = (v7 & 0xFFFFFFFFFFFFFEFFLL) == 4;
    else
      v8 = 0;
    if (!v8)
    {
      BKLogEventDelivery();
      v9 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138543618;
        v17 = CFSTR("/System/Library/BackBoard/EventProcessorConfigurationPlatformOverride.plist");
        v18 = 2114;
        v19 = v4;
        _os_log_error_impl(&dword_1C8914000, v9, OS_LOG_TYPE_ERROR, "cannot decode %{public}@: %{public}@", buf, 0x16u);
      }

    }
    v14 = v4;
    _BKHIDEventProcessorConfigurationFromRootRelativePath(CFSTR("/System/Library/BackBoard/EventProcessorConfiguration.plist"), &v14);
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = v14;

    if (!v2)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "BKHIDPrimaryEventProcessor * _Nonnull BKHIDCreatePrimaryEventProcessor(BKHIDEventProcessorCreationContext *__strong _Nonnull)");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "handleFailureInFunction:file:lineNumber:description:", v13, CFSTR("BKHIDPrimaryEventProcessorFactory.m"), 55, CFSTR("error reading %@: %@"), CFSTR("/System/Library/BackBoard/EventProcessorConfiguration.plist"), v5);

    }
  }
  BKHIDCreatePrimaryEventProcessorWithDictionary(v1, v2);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

id _BKHIDEventProcessorConfigurationFromRootRelativePath(void *a1, _QWORD *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  id v11;

  v3 = a1;
  BSSystemRootDirectory();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "stringByAppendingPathComponent:", v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0C99E98], "fileURLWithPath:isDirectory:", v5, 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = 0;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithContentsOfURL:error:", v6, &v11);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v11;
  v9 = v8;
  if (a2 && !v7)
    *a2 = objc_retainAutorelease(v8);

  return v7;
}

BKHIDPrimaryEventProcessor *BKHIDCreatePrimaryEventProcessorWithDictionary(void *a1, void *a2)
{
  void *v3;
  uint64_t v4;
  id v5;
  void *v6;
  id v7;
  void *v8;
  uint64_t v9;
  id v10;
  void *v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t i;
  void *v17;
  uint64_t v18;
  id v19;
  void *v20;
  id v21;
  void *v22;
  void *v23;
  void *v24;
  uint64_t v25;
  id v26;
  void *v27;
  id v28;
  void *v29;
  uint64_t v30;
  uint64_t v31;
  void *v32;
  uint64_t v33;
  id v34;
  void *v35;
  id v36;
  void *v37;
  uint64_t v38;
  id v39;
  void *v40;
  id v41;
  id v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t j;
  void *v47;
  uint64_t v48;
  id v49;
  void *v50;
  id v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  void *v59;
  void *v60;
  uint64_t v61;
  id v62;
  void *v63;
  id v64;
  id v65;
  id v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t v69;
  uint64_t k;
  NSString *v71;
  Class v72;
  Class v73;
  NSObject *v74;
  NSObject *v75;
  NSObject *v76;
  _BOOL4 v77;
  void *v78;
  id v79;
  uint64_t v80;
  uint64_t v81;
  uint64_t v82;
  uint64_t m;
  void *v84;
  uint64_t v85;
  id v86;
  void *v87;
  id v88;
  void *v89;
  void *v90;
  uint64_t v91;
  id v92;
  void *v93;
  id v94;
  id v95;
  id v96;
  uint64_t v97;
  void *v98;
  void *v99;
  void *v100;
  uint64_t v101;
  uint64_t v102;
  uint64_t v103;
  uint64_t n;
  void *v105;
  id v106;
  uint64_t v107;
  void *v108;
  uint64_t v109;
  void *v110;
  void *v111;
  unsigned int v112;
  BKHIDPrimaryEventProcessor *v113;
  uint64_t ii;
  void *v115;
  BKHIDPrimaryEventProcessor *v116;
  void *v118;
  void *v119;
  void *v120;
  void *v121;
  void *v122;
  void *v123;
  void *v124;
  void *v125;
  void *v126;
  void *v127;
  void *v128;
  void *v129;
  void *v130;
  id v131;
  id v132;
  id obj;
  id objb;
  id obja;
  uint64_t v136;
  void *v137;
  uint64_t v138;
  id v139;
  void *v140;
  id v141;
  id v142;
  void *v143;
  void *v144;
  uint64_t v145;
  uint64_t v146;
  void *v147;
  uint64_t v148;
  void *v149;
  void *v150;
  __int128 v151;
  __int128 v152;
  __int128 v153;
  __int128 v154;
  __int128 v155;
  __int128 v156;
  __int128 v157;
  __int128 v158;
  __int128 v159;
  __int128 v160;
  __int128 v161;
  __int128 v162;
  __int128 v163;
  __int128 v164;
  __int128 v165;
  __int128 v166;
  uint8_t buf[4];
  NSObject *v168;
  _OWORD v169[21];
  uint64_t v170;
  uint64_t v171;

  v171 = *MEMORY[0x1E0C80C00];
  v131 = a1;
  v132 = a2;
  objc_msgSend(v132, "objectForKeyedSubscript:", CFSTR("DefaultProcessor"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_opt_class();
  v5 = v3;
  if (v4)
  {
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v6 = v5;
    else
      v6 = 0;
  }
  else
  {
    v6 = 0;
  }
  v7 = v6;

  v130 = v7;
  if (!v7)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v118 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "void _validateDictionary(NSDictionary *__strong)");
    v119 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v118, "handleFailureInFunction:file:lineNumber:description:", v119, CFSTR("BKHIDPrimaryEventProcessorFactory.m"), 225, CFSTR("Must have a default processor name"));

  }
  objc_msgSend(v132, "objectForKeyedSubscript:", CFSTR("CreationOrder"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_opt_class();
  v10 = v8;
  if (v9)
  {
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v11 = v10;
    else
      v11 = 0;
  }
  else
  {
    v11 = 0;
  }
  v12 = v11;

  if (!v12)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v120 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "void _validateDictionary(NSDictionary *__strong)");
    v121 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v120, "handleFailureInFunction:file:lineNumber:description:", v121, CFSTR("BKHIDPrimaryEventProcessorFactory.m"), 228, CFSTR("Must have a creation order"));

  }
  v161 = 0u;
  v162 = 0u;
  v159 = 0u;
  v160 = 0u;
  obj = v12;
  v13 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v159, v169, 16);
  if (v13)
  {
    v14 = v13;
    v15 = *(_QWORD *)v160;
    do
    {
      for (i = 0; i != v14; ++i)
      {
        if (*(_QWORD *)v160 != v15)
          objc_enumerationMutation(obj);
        v17 = *(void **)(*((_QWORD *)&v159 + 1) + 8 * i);
        v18 = objc_opt_class();
        v19 = v17;
        if (v18)
        {
          if ((objc_opt_isKindOfClass() & 1) != 0)
            v20 = v19;
          else
            v20 = 0;
        }
        else
        {
          v20 = 0;
        }
        v21 = v20;

        if (!v21)
        {
          objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "void _validateDictionary(NSDictionary *__strong)");
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v22, "handleFailureInFunction:file:lineNumber:description:", v23, CFSTR("BKHIDPrimaryEventProcessorFactory.m"), 232, CFSTR("Bad creation order name: %@"), v19);

        }
      }
      v14 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v159, v169, 16);
    }
    while (v14);
  }

  objc_msgSend(v132, "objectForKeyedSubscript:", CFSTR("ProcessorChains"));
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v25 = objc_opt_class();
  v26 = v24;
  if (v25)
  {
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v27 = v26;
    else
      v27 = 0;
  }
  else
  {
    v27 = 0;
  }
  v28 = v27;

  if (!v28)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v122 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "void _validateDictionary(NSDictionary *__strong)");
    v123 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v122, "handleFailureInFunction:file:lineNumber:description:", v123, CFSTR("BKHIDPrimaryEventProcessorFactory.m"), 236, CFSTR("Must have a chain configuration"));

  }
  objc_msgSend(MEMORY[0x1E0C99E60], "setWithArray:", obj);
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  v30 = objc_msgSend(v29, "count");
  if (v30 != objc_msgSend(obj, "count"))
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v124 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "void _validateDictionary(NSDictionary *__strong)");
    v125 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v124, "handleFailureInFunction:file:lineNumber:description:", v125, CFSTR("BKHIDPrimaryEventProcessorFactory.m"), 239, CFSTR("Creation order items must be unique"));

  }
  v157 = 0u;
  v158 = 0u;
  v155 = 0u;
  v156 = 0u;
  v141 = v28;
  v138 = objc_msgSend(v141, "countByEnumeratingWithState:objects:count:", &v155, buf, 16);
  if (v138)
  {
    v136 = *(_QWORD *)v156;
    do
    {
      v31 = 0;
      do
      {
        if (*(_QWORD *)v156 != v136)
          objc_enumerationMutation(v141);
        v32 = *(void **)(*((_QWORD *)&v155 + 1) + 8 * v31);
        v33 = objc_opt_class();
        v34 = v32;
        if (v33)
        {
          if ((objc_opt_isKindOfClass() & 1) != 0)
            v35 = v34;
          else
            v35 = 0;
        }
        else
        {
          v35 = 0;
        }
        v36 = v35;

        if (!v36)
        {
          objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
          v56 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "void _validateDictionary(NSDictionary *__strong)");
          v57 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v56, "handleFailureInFunction:file:lineNumber:description:", v57, CFSTR("BKHIDPrimaryEventProcessorFactory.m"), 243, CFSTR("Bad event type: %@"), v34);

        }
        objc_msgSend(v141, "objectForKeyedSubscript:", v36);
        v37 = (void *)objc_claimAutoreleasedReturnValue();
        v38 = objc_opt_class();
        v39 = v37;
        v146 = v31;
        v149 = v36;
        if (v38)
        {
          if ((objc_opt_isKindOfClass() & 1) != 0)
            v40 = v39;
          else
            v40 = 0;
        }
        else
        {
          v40 = 0;
        }
        v41 = v40;

        if (!v41)
        {
          objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
          v58 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "void _validateDictionary(NSDictionary *__strong)");
          v59 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v58, "handleFailureInFunction:file:lineNumber:description:", v59, CFSTR("BKHIDPrimaryEventProcessorFactory.m"), 247, CFSTR("Bad processor chain: %@"), v39);

        }
        v143 = v39;
        v153 = 0u;
        v154 = 0u;
        v151 = 0u;
        v152 = 0u;
        v42 = v41;
        v43 = objc_msgSend(v42, "countByEnumeratingWithState:objects:count:", &v151, &v163, 16);
        if (v43)
        {
          v44 = v43;
          v45 = *(_QWORD *)v152;
          do
          {
            for (j = 0; j != v44; ++j)
            {
              if (*(_QWORD *)v152 != v45)
                objc_enumerationMutation(v42);
              v47 = *(void **)(*((_QWORD *)&v151 + 1) + 8 * j);
              v48 = objc_opt_class();
              v49 = v47;
              if (v48)
              {
                if ((objc_opt_isKindOfClass() & 1) != 0)
                  v50 = v49;
                else
                  v50 = 0;
              }
              else
              {
                v50 = 0;
              }
              v51 = v50;

              if (!v51)
              {
                objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
                v52 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "void _validateDictionary(NSDictionary *__strong)");
                v53 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v52, "handleFailureInFunction:file:lineNumber:description:", v53, CFSTR("BKHIDPrimaryEventProcessorFactory.m"), 251, CFSTR("Bad event processor: %@"), v49);

              }
              if ((objc_msgSend(v29, "containsObject:", v51) & 1) == 0)
              {
                objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
                v54 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "void _validateDictionary(NSDictionary *__strong)");
                v55 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v54, "handleFailureInFunction:file:lineNumber:description:", v55, CFSTR("BKHIDPrimaryEventProcessorFactory.m"), 252, CFSTR("Processor chain for %@ contains event processor %@ that does not exist in creation order"), v149, v51);

              }
            }
            v44 = objc_msgSend(v42, "countByEnumeratingWithState:objects:count:", &v151, &v163, 16);
          }
          while (v44);
        }

        v31 = v146 + 1;
      }
      while (v146 + 1 != v138);
      v138 = objc_msgSend(v141, "countByEnumeratingWithState:objects:count:", &v155, buf, 16);
    }
    while (v138);
  }

  objc_msgSend(v132, "objectForKeyedSubscript:", CFSTR("CreationOrder"));
  v60 = (void *)objc_claimAutoreleasedReturnValue();
  v61 = objc_opt_class();
  v62 = v60;
  if (v61)
  {
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v63 = v62;
    else
      v63 = 0;
  }
  else
  {
    v63 = 0;
  }
  v64 = v63;

  v65 = v131;
  v66 = v64;
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v147 = (void *)objc_claimAutoreleasedReturnValue();
  v137 = v65;
  objc_msgSend(v65, "eventProcessorRegistry");
  v144 = (void *)objc_claimAutoreleasedReturnValue();
  v139 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v163 = 0u;
  v164 = 0u;
  v165 = 0u;
  v166 = 0u;
  v142 = v66;
  v67 = objc_msgSend(v142, "countByEnumeratingWithState:objects:count:", &v163, v169, 16);
  if (v67)
  {
    v68 = v67;
    v69 = *(_QWORD *)v164;
    do
    {
      for (k = 0; k != v68; ++k)
      {
        if (*(_QWORD *)v164 != v69)
          objc_enumerationMutation(v142);
        v71 = *(NSString **)(*((_QWORD *)&v163 + 1) + 8 * k);
        v72 = NSClassFromString(v71);
        if (v72)
        {
          v73 = v72;
          if ((-[objc_class conformsToProtocol:](v72, "conformsToProtocol:", &unk_1EF900730) & 1) == 0)
          {
            objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
            objb = (id)objc_claimAutoreleasedReturnValue();
            objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "NSDictionary<NSString *,id<BKHIDEventProcessor>> *_createEventProcessorsWithCreationOrderArray(BKHIDEventProcessorCreationContext *__strong, NSArray<NSString *> *__strong)");
            v78 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(objb, "handleFailureInFunction:file:lineNumber:description:", v78, CFSTR("BKHIDPrimaryEventProcessorFactory.m"), 90, CFSTR("Class %@ is not an event processor"), v71);

          }
          if ((objc_opt_respondsToSelector() & 1) != 0)
          {
            -[objc_class performSelector:](v73, "performSelector:", sel_sharedInstance);
            v74 = objc_claimAutoreleasedReturnValue();
          }
          else if (-[objc_class instancesRespondToSelector:](v73, "instancesRespondToSelector:", sel_initWithContext_))
          {
            v74 = objc_msgSend([v73 alloc], "initWithContext:", v137);
          }
          else
          {
            v74 = objc_alloc_init(v73);
          }
          v75 = v74;
          BKLogEventDelivery();
          v76 = objc_claimAutoreleasedReturnValue();
          v77 = os_log_type_enabled(v76, OS_LOG_TYPE_DEFAULT);
          if (v75)
          {
            if (v77)
            {
              *(_DWORD *)buf = 138543362;
              v168 = v75;
              _os_log_impl(&dword_1C8914000, v76, OS_LOG_TYPE_DEFAULT, "Registered %{public}@", buf, 0xCu);
            }

            objc_msgSend(v147, "setObject:forKeyedSubscript:", v75, v71);
            objc_msgSend(v144, "addEventProcessor:", v75);
            if ((objc_opt_respondsToSelector() & 1) != 0)
              objc_msgSend(v139, "addObject:", v75);
          }
          else
          {
            if (v77)
            {
              *(_DWORD *)buf = 138543362;
              v168 = v71;
              _os_log_impl(&dword_1C8914000, v76, OS_LOG_TYPE_DEFAULT, "Could not create event processor of class %{public}@", buf, 0xCu);
            }

            v75 = 0;
          }
        }
        else
        {
          BKLogEventDelivery();
          v75 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v75, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138543362;
            v168 = v71;
            _os_log_impl(&dword_1C8914000, v75, OS_LOG_TYPE_DEFAULT, "Event processor class %{public}@ does not exist", buf, 0xCu);
          }
        }

      }
      v68 = objc_msgSend(v142, "countByEnumeratingWithState:objects:count:", &v163, v169, 16);
    }
    while (v68);
  }

  v161 = 0u;
  v162 = 0u;
  v159 = 0u;
  v160 = 0u;
  v79 = v139;
  v80 = objc_msgSend(v79, "countByEnumeratingWithState:objects:count:", &v159, buf, 16);
  if (v80)
  {
    v81 = v80;
    v82 = *(_QWORD *)v160;
    do
    {
      for (m = 0; m != v81; ++m)
      {
        if (*(_QWORD *)v160 != v82)
          objc_enumerationMutation(v79);
        objc_msgSend(*(id *)(*((_QWORD *)&v159 + 1) + 8 * m), "didInitializeRegistryWithContext:", v137);
      }
      v81 = objc_msgSend(v79, "countByEnumeratingWithState:objects:count:", &v159, buf, 16);
    }
    while (v81);
  }

  if (!objc_msgSend(v147, "count"))
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v126 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "BKHIDPrimaryEventProcessor * _Nonnull BKHIDCreatePrimaryEventProcessorWithDictionary(BKHIDEventProcessorCreationContext *__strong _Nonnull, NSDictionary *__strong _Nonnull)");
    v127 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v126, "handleFailureInFunction:file:lineNumber:description:", v127, CFSTR("BKHIDPrimaryEventProcessorFactory.m"), 65, CFSTR("Failed to create event processors from creation order data"));

  }
  objc_msgSend(v132, "objectForKeyedSubscript:", CFSTR("DefaultProcessor"));
  v84 = (void *)objc_claimAutoreleasedReturnValue();
  v85 = objc_opt_class();
  v86 = v84;
  if (v85)
  {
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v87 = v86;
    else
      v87 = 0;
  }
  else
  {
    v87 = 0;
  }
  v88 = v87;

  v140 = v88;
  objc_msgSend(v147, "objectForKeyedSubscript:", v88);
  v89 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v89)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v128 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "BKHIDPrimaryEventProcessor * _Nonnull BKHIDCreatePrimaryEventProcessorWithDictionary(BKHIDEventProcessorCreationContext *__strong _Nonnull, NSDictionary *__strong _Nonnull)");
    v129 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v128, "handleFailureInFunction:file:lineNumber:description:", v129, CFSTR("BKHIDPrimaryEventProcessorFactory.m"), 69, CFSTR("Failed to create a default event processor"));

  }
  objc_msgSend(v132, "objectForKeyedSubscript:", CFSTR("ProcessorChains"));
  v90 = (void *)objc_claimAutoreleasedReturnValue();
  v91 = objc_opt_class();
  v92 = v90;
  if (v91)
  {
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v93 = v92;
    else
      v93 = 0;
  }
  else
  {
    v93 = 0;
  }
  v94 = v93;

  v95 = v147;
  v96 = v94;
  obja = v89;
  v170 = 0;
  memset(v169, 0, sizeof(v169));
  v161 = 0u;
  v162 = 0u;
  v159 = 0u;
  v160 = 0u;
  v150 = v96;
  v148 = objc_msgSend(v96, "countByEnumeratingWithState:objects:count:", &v159, buf, 16);
  if (v148)
  {
    v145 = *(_QWORD *)v160;
    do
    {
      v97 = 0;
      do
      {
        if (*(_QWORD *)v160 != v145)
          objc_enumerationMutation(v150);
        v98 = *(void **)(*((_QWORD *)&v159 + 1) + 8 * v97);
        objc_msgSend(MEMORY[0x1E0C99DE8], "array");
        v99 = (void *)objc_claimAutoreleasedReturnValue();
        v155 = 0u;
        v156 = 0u;
        v157 = 0u;
        v158 = 0u;
        objc_msgSend(v150, "objectForKeyedSubscript:", v98);
        v100 = (void *)objc_claimAutoreleasedReturnValue();
        v101 = objc_msgSend(v100, "countByEnumeratingWithState:objects:count:", &v155, &v163, 16);
        if (v101)
        {
          v102 = v101;
          v103 = *(_QWORD *)v156;
          do
          {
            for (n = 0; n != v102; ++n)
            {
              if (*(_QWORD *)v156 != v103)
                objc_enumerationMutation(v100);
              objc_msgSend(v95, "objectForKeyedSubscript:", *(_QWORD *)(*((_QWORD *)&v155 + 1) + 8 * n));
              v105 = (void *)objc_claimAutoreleasedReturnValue();
              if (v105)
                objc_msgSend(v99, "addObject:", v105);

            }
            v102 = objc_msgSend(v100, "countByEnumeratingWithState:objects:count:", &v155, &v163, 16);
          }
          while (v102);
        }

        if (objc_msgSend(v99, "count"))
        {
          v106 = v98;
          if (_eventTypeFromName_onceToken != -1)
            dispatch_once(&_eventTypeFromName_onceToken, &__block_literal_global_500);
          objc_msgSend((id)_eventTypeFromName_nameToEventTypeMap, "objectForKeyedSubscript:", v106);
          v107 = objc_claimAutoreleasedReturnValue();
          if (v107)
          {
            v108 = (void *)v107;
          }
          else if (!objc_msgSend(v106, "hasPrefix:", CFSTR("kIOHIDEventType"))
                 || (objc_msgSend(v106, "stringByReplacingCharactersInRange:withString:", 0, objc_msgSend(CFSTR("kIOHIDEventType"), "length"), &stru_1E81F83B8), v109 = objc_claimAutoreleasedReturnValue(), v106, objc_msgSend((id)_eventTypeFromName_nameToEventTypeMap, "objectForKeyedSubscript:", v109), v108 = (void *)objc_claimAutoreleasedReturnValue(), v106 = (id)v109, !v108))
          {
            objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
            v110 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "IOHIDEventType _eventTypeFromName(NSString *__strong)");
            v111 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v110, "handleFailureInFunction:file:lineNumber:description:", v111, CFSTR("BKHIDPrimaryEventProcessorFactory.m"), 218, CFSTR("Unknown event type %@"), v106);

            v108 = 0;
          }
          v112 = objc_msgSend(v108, "intValue");

          objc_storeStrong((id *)v169 + v112, v99);
        }

        ++v97;
      }
      while (v97 != v148);
      v148 = objc_msgSend(v150, "countByEnumeratingWithState:objects:count:", &v159, buf, 16);
    }
    while (v148);
  }
  v113 = -[BKHIDPrimaryEventProcessor initWithSubProcessors:defaultProcessor:]([BKHIDPrimaryEventProcessor alloc], "initWithSubProcessors:defaultProcessor:", v169, obja);
  for (ii = 336; ii != -8; ii -= 8)

  objc_msgSend(v137, "eventProcessorRegistry");
  v115 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v115, "addEventProcessor:", v113);
  v116 = v113;

  return v116;
}

void ___eventTypeFromName_block_invoke()
{
  void *v0;

  v0 = (void *)_eventTypeFromName_nameToEventTypeMap;
  _eventTypeFromName_nameToEventTypeMap = (uint64_t)&unk_1E8200E98;

}

void BKHIDEventRoutingInit(uint64_t a1)
{
  BKHIDClientConnectionManager *v1;
  void *v2;

  v1 = -[BKHIDClientConnectionManager initWithHIDEventSystem:]([BKHIDClientConnectionManager alloc], "initWithHIDEventSystem:", a1);
  v2 = (void *)__HIDClientConnectionManager;
  __HIDClientConnectionManager = (uint64_t)v1;

}

void *BKGetEventTapCallback()
{
  return __BKEventTapCallback;
}

void *BKSetEventTapCallback(void *result)
{
  __BKEventTapCallback = result;
  return result;
}

void BKSendGSEvent(int *a1, uint64_t a2, int a3)
{
  mach_error_t v5;
  mach_error_t v6;
  NSObject *v7;
  int v8;
  int v9;
  const char *v10;
  __int16 v11;
  int v12;
  __int16 v13;
  char *v14;
  __int16 v15;
  mach_error_t v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  if (!__BKEventTapCallback || __BKEventTapCallback(a1))
  {
    v5 = a3 ? GSSendSystemAppEvent() : GSSendEvent();
    v6 = v5;
    if (v5)
    {
      BKLogCommon();
      v7 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      {
        v8 = *a1;
        v9 = 136315906;
        v10 = "BKSendGSEvent";
        v11 = 1024;
        v12 = v8;
        v13 = 2082;
        v14 = mach_error_string(v6);
        v15 = 1024;
        v16 = v6;
        _os_log_impl(&dword_1C8914000, v7, OS_LOG_TYPE_DEFAULT, "%s ERROR sending event type %d: %{public}s (0x%X)", (uint8_t *)&v9, 0x22u);
      }

    }
  }
}

void *BKGetHIDEventTapCallback()
{
  return __BKHIDEventTapCallback;
}

void *BKSetHIDEventTapCallback(void *result)
{
  __BKHIDEventTapCallback = result;
  return result;
}

void BKSendHIDEventToClientWithDestinationAsRedirect(uint64_t a1, void *a2)
{
  _BKSendHIDEventToClientWithDestination(a1, a2, 1);
}

void sub_1C8929E80(_Unwind_Exception *a1)
{
  uint64_t v1;

  objc_destroyWeak((id *)(v1 - 40));
  _Unwind_Resume(a1);
}

void sub_1C892A220(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void _BKHIDServiceWillTerminate(void *a1, uint64_t a2, uint64_t a3)
{
  NSObject *v5;
  id v6;
  int v7;
  uint64_t v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  BKLogHID();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v7 = 138543362;
    v8 = a3;
    _os_log_impl(&dword_1C8914000, v5, OS_LOG_TYPE_DEFAULT, "Got a service willTerminate callback: %{public}@", (uint8_t *)&v7, 0xCu);
  }

  v6 = a1;
  objc_msgSend(v6, "_serviceWasRemoved");

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

void _BKHIDSetUserEventNotifier(void *a1)
{
  id v1;
  uint64_t v2;
  id v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  _QWORD block[4];
  id v9;

  v1 = a1;
  if (!v1)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "void _BKHIDSetUserEventNotifier(__strong id<BKHIDUserEventNotifying> _Nonnull)");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "handleFailureInFunction:file:lineNumber:description:", v6, CFSTR("BKHIDUserEventNotifying.m"), 14, CFSTR("userEventNotifier must not be nil"));

  }
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = ___BKHIDSetUserEventNotifier_block_invoke;
  block[3] = &unk_1E81F7460;
  v9 = v1;
  v2 = _BKHIDSetUserEventNotifier_onceToken;
  v3 = v1;
  v7 = v3;
  if (v2 == -1)
  {
    v4 = v3;
  }
  else
  {
    dispatch_once(&_BKHIDSetUserEventNotifier_onceToken, block);
    v4 = v9;
  }

}

uint64_t __Block_byref_object_copy__1215(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__1216(uint64_t a1)
{

}

const __CFString *NSStringFromBKHIDEventSequencePosition(unint64_t a1)
{
  if (a1 > 3)
    return CFSTR("<whuh?>");
  else
    return off_1E81F7538[a1];
}

id BKLogBootUI()
{
  if (BKLogBootUI_onceToken != -1)
    dispatch_once(&BKLogBootUI_onceToken, &__block_literal_global_1834);
  return (id)BKLogBootUI___logObj;
}

id BKLogButton()
{
  if (BKLogButton_onceToken != -1)
    dispatch_once(&BKLogButton_onceToken, &__block_literal_global_2);
  return (id)BKLogButton___logObj;
}

id BKLogDisplayAnnotations()
{
  if (BKLogDisplayAnnotations_onceToken != -1)
    dispatch_once(&BKLogDisplayAnnotations_onceToken, &__block_literal_global_4);
  return (id)BKLogDisplayAnnotations___logObj;
}

id BKLogDisplayMonitor()
{
  if (BKLogDisplayMonitor_onceToken != -1)
    dispatch_once(&BKLogDisplayMonitor_onceToken, &__block_literal_global_6);
  return (id)BKLogDisplayMonitor___logObj;
}

id BKLogGenericGesture()
{
  if (BKLogGenericGesture_onceToken != -1)
    dispatch_once(&BKLogGenericGesture_onceToken, &__block_literal_global_8);
  return (id)BKLogGenericGesture___logObj;
}

id BKLogIdleTimer()
{
  if (BKLogIdleTimer_onceToken != -1)
    dispatch_once(&BKLogIdleTimer_onceToken, &__block_literal_global_12);
  return (id)BKLogIdleTimer___logObj;
}

id BKLogRenderOverlay()
{
  if (BKLogRenderOverlay_onceToken != -1)
    dispatch_once(&BKLogRenderOverlay_onceToken, &__block_literal_global_14);
  return (id)BKLogRenderOverlay___logObj;
}

id BKLogHapticFeedback()
{
  if (BKLogHapticFeedback_onceToken != -1)
    dispatch_once(&BKLogHapticFeedback_onceToken, &__block_literal_global_16);
  return (id)BKLogHapticFeedback___logObj;
}

id BKLogAccelerometer()
{
  if (BKLogAccelerometer_onceToken != -1)
    dispatch_once(&BKLogAccelerometer_onceToken, &__block_literal_global_18);
  return (id)BKLogAccelerometer___logObj;
}

id BKLogKeyPresses()
{
  if (BKLogKeyPresses_onceToken != -1)
    dispatch_once(&BKLogKeyPresses_onceToken, &__block_literal_global_20);
  return (id)BKLogKeyPresses___logObj;
}

id BKLogMotionEvents()
{
  if (BKLogMotionEvents_onceToken != -1)
    dispatch_once(&BKLogMotionEvents_onceToken, &__block_literal_global_22);
  return (id)BKLogMotionEvents___logObj;
}

void sub_1C893133C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  id *v14;

  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

uint64_t BKLogCommon()
{
  return MEMORY[0x1E0D008A0]();
}

uint64_t BKLogDetailed()
{
  return MEMORY[0x1E0D008A8]();
}

uint64_t BKLogEventDelivery()
{
  return MEMORY[0x1E0D008B8]();
}

uint64_t BKLogEventDeliveryBuffering()
{
  return MEMORY[0x1E0D008C0]();
}

uint64_t BKLogEventDeliveryMatching()
{
  return MEMORY[0x1E0D008C8]();
}

uint64_t BKSHIDEventGetBaseAttributes()
{
  return MEMORY[0x1E0D00A20]();
}

uint64_t BKSHIDEventGetConciseDescription()
{
  return MEMORY[0x1E0D00A28]();
}

uint64_t BKSHIDEventSetSimpleDeliveryInfo()
{
  return MEMORY[0x1E0D00AA0]();
}

uint64_t BSAuditTokenForTask()
{
  return MEMORY[0x1E0D010F0]();
}

uint64_t BSDispatchQueueCreateSerial()
{
  return MEMORY[0x1E0D01240]();
}

uint64_t BSEqualObjects()
{
  return MEMORY[0x1E0D01280]();
}

uint64_t BSEqualSets()
{
  return MEMORY[0x1E0D01288]();
}

uint64_t BSIntegerMapEnumerateWithBlock()
{
  return MEMORY[0x1E0D01338]();
}

uint64_t BSPIDForAuditToken()
{
  return MEMORY[0x1E0D01458]();
}

uint64_t BSProcessDescriptionForPID()
{
  return MEMORY[0x1E0D014A8]();
}

uint64_t BSSystemRootDirectory()
{
  return MEMORY[0x1E0D01620]();
}

uint64_t BSVersionedPIDForAuditToken()
{
  return MEMORY[0x1E0D01670]();
}

CFIndex CFArrayGetCount(CFArrayRef theArray)
{
  return MEMORY[0x1E0C97D60](theArray);
}

const void *__cdecl CFArrayGetValueAtIndex(CFArrayRef theArray, CFIndex idx)
{
  return (const void *)MEMORY[0x1E0C97D98](theArray, idx);
}

CFMutableDictionaryRef CFDictionaryCreateMutable(CFAllocatorRef allocator, CFIndex capacity, const CFDictionaryKeyCallBacks *keyCallBacks, const CFDictionaryValueCallBacks *valueCallBacks)
{
  return (CFMutableDictionaryRef)MEMORY[0x1E0C98550](allocator, capacity, keyCallBacks, valueCallBacks);
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

CFHashCode CFHash(CFTypeRef cf)
{
  return MEMORY[0x1E0C98758](cf);
}

Boolean CFNumberGetValue(CFNumberRef number, CFNumberType theType, void *valuePtr)
{
  return MEMORY[0x1E0C989C0](number, theType, valuePtr);
}

CFPropertyListRef CFPropertyListCreateDeepCopy(CFAllocatorRef allocator, CFPropertyListRef propertyList, CFOptionFlags mutabilityOption)
{
  return (CFPropertyListRef)MEMORY[0x1E0C98AB0](allocator, propertyList, mutabilityOption);
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

CFRunLoopRef CFRunLoopGetMain(void)
{
  return (CFRunLoopRef)MEMORY[0x1E0C98C40]();
}

void CFRunLoopPerformBlock(CFRunLoopRef rl, CFTypeRef mode, void *block)
{
  MEMORY[0x1E0C98C80](rl, mode, block);
}

void CFRunLoopWakeUp(CFRunLoopRef rl)
{
  MEMORY[0x1E0C98D68](rl);
}

void CFStringAppend(CFMutableStringRef theString, CFStringRef appendedString)
{
  MEMORY[0x1E0C98ED8](theString, appendedString);
}

void CFStringAppendFormat(CFMutableStringRef theString, CFDictionaryRef formatOptions, CFStringRef format, ...)
{
  MEMORY[0x1E0C98EF0](theString, formatOptions, format);
}

void CFStringAppendFormatAndArguments(CFMutableStringRef theString, CFDictionaryRef formatOptions, CFStringRef format, va_list arguments)
{
  MEMORY[0x1E0C98EF8](theString, formatOptions, format, arguments);
}

CFStringRef CFStringCreateWithFormatAndArguments(CFAllocatorRef alloc, CFDictionaryRef formatOptions, CFStringRef format, va_list arguments)
{
  return (CFStringRef)MEMORY[0x1E0C99020](alloc, formatOptions, format, arguments);
}

uint64_t GSEventDeviceOrientation()
{
  return MEMORY[0x1E0D27AF8]();
}

uint64_t GSEventGetType()
{
  return MEMORY[0x1E0D27B30]();
}

uint64_t GSEventRemoveShouldRouteToFrontMost()
{
  return MEMORY[0x1E0D27B80]();
}

uint64_t GSEventShouldRouteToFrontMost()
{
  return MEMORY[0x1E0D27BA0]();
}

uint64_t GSSendEvent()
{
  return MEMORY[0x1E0D27C68]();
}

uint64_t GSSendSystemAppEvent()
{
  return MEMORY[0x1E0D27C70]();
}

uint64_t IOHIDEventCreateCopy()
{
  return MEMORY[0x1E0CBB030]();
}

uint64_t IOHIDEventGetAttributeDataLength()
{
  return MEMORY[0x1E0CBB0E8]();
}

uint64_t IOHIDEventGetAttributeDataPtr()
{
  return MEMORY[0x1E0CBB0F0]();
}

uint64_t IOHIDEventGetIntegerValue()
{
  return MEMORY[0x1E0CBB130]();
}

uint64_t IOHIDEventGetSenderID()
{
  return MEMORY[0x1E0CBB150]();
}

uint64_t IOHIDEventGetTimeStamp()
{
  return MEMORY[0x1E0CBB158]();
}

uint64_t IOHIDEventGetType()
{
  return MEMORY[0x1E0CBB168]();
}

uint64_t IOHIDEventSystemClientCreate()
{
  return MEMORY[0x1E0CBB1F0]();
}

uint64_t IOHIDEventSystemClientScheduleWithRunLoop()
{
  return MEMORY[0x1E0CBB250]();
}

uint64_t IOHIDEventSystemConnectionDispatchEvent()
{
  return MEMORY[0x1E0CBB2C8]();
}

uint64_t IOHIDEventSystemConnectionGetAttribute()
{
  return MEMORY[0x1E0CBB2D0]();
}

uint64_t IOHIDEventSystemConnectionGetTaskNamePort()
{
  return MEMORY[0x1E0CBB2E0]();
}

uint64_t IOHIDEventSystemCopyConnections()
{
  return MEMORY[0x1E0CBB2F0]();
}

uint64_t IOHIDEventSystemCopyEvent()
{
  return MEMORY[0x1E0CBB2F8]();
}

uint64_t IOHIDEventSystemCopyServices()
{
  return MEMORY[0x1E0CBB300]();
}

uint64_t IOHIDEventSystemCreate()
{
  return MEMORY[0x1E0CBB308]();
}

uint64_t IOHIDEventSystemGetProperty()
{
  return MEMORY[0x1E0CBB310]();
}

uint64_t IOHIDEventSystemOpen()
{
  return MEMORY[0x1E0CBB318]();
}

uint64_t IOHIDEventSystemRegisterConnectionAdditionCallback()
{
  return MEMORY[0x1E0CBB320]();
}

uint64_t IOHIDEventSystemRegisterConnectionRemovalCallback()
{
  return MEMORY[0x1E0CBB328]();
}

uint64_t IOHIDEventSystemRegisterServicesCallback()
{
  return MEMORY[0x1E0CBB330]();
}

uint64_t IOHIDEventSystemSetCallback()
{
  return MEMORY[0x1E0CBB338]();
}

uint64_t IOHIDEventSystemSetProperty()
{
  return MEMORY[0x1E0CBB340]();
}

uint64_t IOHIDEventSystemUnregisterConnectionAdditionCallback()
{
  return MEMORY[0x1E0CBB348]();
}

uint64_t IOHIDEventSystemUnregisterConnectionRemovalCallback()
{
  return MEMORY[0x1E0CBB350]();
}

uint64_t IOHIDEventSystemUnregisterServicesCallback()
{
  return MEMORY[0x1E0CBB358]();
}

uint64_t IOHIDEventTypeGetName()
{
  return MEMORY[0x1E0CBB360]();
}

uint64_t IOHIDServiceCreateRemovalNotification()
{
  return MEMORY[0x1E0CBB510]();
}

uint64_t IOHIDServiceCreateRequestTerminationNotification()
{
  return MEMORY[0x1E0CBB518]();
}

uint64_t IOHIDServiceGetProperty()
{
  return MEMORY[0x1E0CBB520]();
}

uint64_t IOHIDServiceGetRegistryID()
{
  return MEMORY[0x1E0CBB528]();
}

uint64_t IOHIDServiceSetElementValue()
{
  return MEMORY[0x1E0CBB538]();
}

uint64_t IOHIDServiceSetProperty()
{
  return MEMORY[0x1E0CBB540]();
}

Class NSClassFromString(NSString *aClassName)
{
  return (Class)MEMORY[0x1E0CB28A0](aClassName);
}

uint64_t NSStringFromBKSHIDEventSource()
{
  return MEMORY[0x1E0D00C10]();
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

uint64_t _GSEventGetGSEventRecord()
{
  return MEMORY[0x1E0D27C88]();
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
  MEMORY[0x1E0C80A20](exception_object);
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

void dispatch_assert_queue_V2(dispatch_queue_t queue)
{
  MEMORY[0x1E0C82BE8](queue);
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

void dispatch_sync(dispatch_queue_t queue, dispatch_block_t block)
{
  MEMORY[0x1E0C82F90](queue, block);
}

uint64_t kdebug_trace()
{
  return MEMORY[0x1E0C83A20]();
}

char *__cdecl mach_error_string(mach_error_t error_value)
{
  return (char *)MEMORY[0x1E0C83C80](*(_QWORD *)&error_value);
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

void objc_setProperty_atomic(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
  MEMORY[0x1E0DE7F88](self, _cmd, newValue, offset);
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

int usleep(useconds_t a1)
{
  return MEMORY[0x1E0C859E0](*(_QWORD *)&a1);
}

