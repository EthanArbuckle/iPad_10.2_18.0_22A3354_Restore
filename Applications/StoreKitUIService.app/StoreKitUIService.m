void sub_100003E18(id a1)
{
  SKClientBroker *v1;
  void *v2;

  v1 = objc_alloc_init(SKClientBroker);
  v2 = (void *)qword_100063298;
  qword_100063298 = (uint64_t)v1;

}

void sub_100003E8C(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_100003FDC(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

id sub_100003FF4(uint64_t a1)
{
  return _objc_msgSend(*(id *)(a1 + 32), "_handleUnfinishedTransactionsNotification");
}

void sub_10000407C(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1000040E8(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_100004154(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1000041C0(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_10000422C(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_100004298(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_100004304(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_10000443C(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1000045C4(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_100004658(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1000047B4(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_100004AA4(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_100004C1C(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_100004D88(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_100004EF4(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_100005060(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1000051A8(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1000052F0(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_10000583C()
{
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
    sub_100029730();
}

void sub_100005880(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id v7;
  void *v8;
  id v9;
  uint64_t v10;
  void *i;
  void *v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];

  v5 = a2;
  v6 = a3;
  if (v6)
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
      sub_10002979C();
  }
  else if (objc_msgSend(v5, "count"))
  {
    v7 = *(id *)(*(_QWORD *)(a1 + 32) + 8);
    objc_sync_enter(v7);
    v13 = 0u;
    v14 = 0u;
    v15 = 0u;
    v16 = 0u;
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "objectEnumerator", 0));
    v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    if (v9)
    {
      v10 = *(_QWORD *)v14;
      do
      {
        for (i = 0; i != v9; i = (char *)i + 1)
        {
          if (*(_QWORD *)v14 != v10)
            objc_enumerationMutation(v8);
          v12 = *(void **)(*((_QWORD *)&v13 + 1) + 8 * (_QWORD)i);
          if ((objc_opt_respondsToSelector(v12, "updatedTransactions:") & 1) != 0)
            objc_msgSend(v12, "updatedTransactions:", v5);
        }
        v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
      }
      while (v9);
    }

    objc_sync_exit(v7);
  }

}

void sub_100005A14(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_100005A98(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 0x16u);
}

void sub_100005B50(id a1)
{
  SKServiceBroker *v1;
  void *v2;

  v1 = objc_alloc_init(SKServiceBroker);
  v2 = (void *)qword_1000632A8;
  qword_1000632A8 = (uint64_t)v1;

}

uint64_t sub_100005C1C(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

uint64_t sub_100005CD4(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

uint64_t sub_100005D8C(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

uint64_t sub_100005E44(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

uint64_t sub_100005EFC(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

uint64_t sub_100005FB4(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

uint64_t sub_10000606C(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

uint64_t sub_100006124(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

uint64_t sub_1000061DC(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

uint64_t sub_100006294(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

uint64_t sub_10000634C(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

uint64_t sub_100006404(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

uint64_t sub_1000064BC(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

void sub_100006A28(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, id location)
{
  id *v20;
  id *v21;

  objc_destroyWeak(v21);
  objc_destroyWeak(v20);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_100006A54(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_serviceConnectionInvalidated");

}

void sub_100006A80(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_serviceConnectionInvalidated");

}

uint64_t sub_100007308(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void sub_1000077A8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1000077C4(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;

  v11 = a2;
  v5 = a3;
  v6 = sub_100007894(v5);
  v7 = objc_claimAutoreleasedReturnValue(v6);
  v8 = (void *)v7;
  if ((id)v7 != v5)
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = 1;
  if (v7)
  {
    objc_msgSend(*(id *)(a1 + 32), "setObject:forKeyedSubscript:", v7, v11);
  }
  else
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "stringByAppendingString:", CFSTR("_desc")));
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "description"));
    objc_msgSend(*(id *)(a1 + 32), "setObject:forKeyedSubscript:", v10, v9);

  }
}

id sub_100007894(void *a1)
{
  id v1;
  uint64_t v2;
  uint64_t v3;
  id v4;
  id v5;
  uint64_t v7;
  uint64_t v8;
  id v9;
  void *v10;
  unint64_t v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  id v16;
  void *v17;
  _QWORD v18[6];
  uint64_t v19;
  uint64_t *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t *v24;
  uint64_t v25;
  uint64_t (*v26)(uint64_t, uint64_t);
  void (*v27)(uint64_t);
  id v28;

  v1 = a1;
  v2 = objc_opt_class(NSString);
  if ((objc_opt_isKindOfClass(v1, v2) & 1) != 0
    || (v3 = objc_opt_class(NSValue), (objc_opt_isKindOfClass(v1, v3) & 1) != 0))
  {
    v4 = v1;
LABEL_4:
    v5 = v4;
    goto LABEL_5;
  }
  v7 = objc_opt_class(NSError);
  if ((objc_opt_isKindOfClass(v1, v7) & 1) != 0)
  {
    v4 = (id)objc_claimAutoreleasedReturnValue(+[SKUIErrorHelper errorWithSafeUserInfo:](SKUIErrorHelper, "errorWithSafeUserInfo:", v1));
    goto LABEL_4;
  }
  v8 = objc_opt_class(NSArray);
  if ((objc_opt_isKindOfClass(v1, v8) & 1) != 0)
  {
    v23 = 0;
    v24 = &v23;
    v25 = 0x3032000000;
    v26 = sub_100007B38;
    v27 = sub_100007B48;
    v28 = 0;
    v19 = 0;
    v20 = &v19;
    v21 = 0x2020000000;
    v22 = 0;
    v18[0] = _NSConcreteStackBlock;
    v18[1] = 3221225472;
    v18[2] = sub_100007B50;
    v18[3] = &unk_100049048;
    v18[4] = &v23;
    v18[5] = &v19;
    objc_msgSend(v1, "enumerateObjectsUsingBlock:", v18);
    if (v24[5])
    {
      v9 = objc_msgSend(v1, "count");
      v5 = objc_msgSend(objc_alloc((Class)NSMutableArray), "initWithCapacity:", v9);
      v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v1, "subarrayWithRange:", 0, v20[3]));
      objc_msgSend(v5, "addObjectsFromArray:", v10);

      objc_msgSend(v5, "addObject:", v24[5]);
      v11 = v20[3] + 1;
      if (v11 < (unint64_t)v9)
      {
        do
        {
          v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v1, "objectAtIndexedSubscript:", v11));
          v13 = sub_100007894();
          v14 = (void *)objc_claimAutoreleasedReturnValue(v13);
          v15 = v14;
          if (v14)
            v16 = v14;
          else
            v16 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "description"));
          v17 = v16;

          objc_msgSend(v5, "addObject:", v17);
          ++v11;
        }
        while (v9 != (id)v11);
      }
    }
    else
    {
      v5 = v1;
    }
    _Block_object_dispose(&v19, 8);
    _Block_object_dispose(&v23, 8);

  }
  else
  {
    v5 = 0;
  }
LABEL_5:

  return v5;
}

void sub_100007B04(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  uint64_t v8;
  va_list va;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  va_list va1;

  va_start(va1, a7);
  va_start(va, a7);
  v8 = va_arg(va1, _QWORD);
  v10 = va_arg(va1, _QWORD);
  v11 = va_arg(va1, _QWORD);
  v12 = va_arg(va1, _QWORD);
  _Block_object_dispose(va, 8);
  _Block_object_dispose(va1, 8);
  _Unwind_Resume(a1);
}

uint64_t sub_100007B38(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void sub_100007B48(uint64_t a1)
{

}

void sub_100007B50(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  uint64_t v7;
  id v8;
  void *v9;
  id v10;

  v10 = a2;
  v7 = sub_100007894();
  v8 = (id)objc_claimAutoreleasedReturnValue(v7);
  if (v8 != v10)
  {
    v9 = v8;
    if (!v8)
      v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "description"));
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), v9);
    if (!v8)

    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = a3;
    *a4 = 1;
  }

}

uint64_t start(int a1, char **a2)
{
  void *v4;
  void *v5;
  objc_class *v6;
  NSString *v7;
  NSString *v8;
  uint64_t v9;

  v4 = objc_autoreleasePoolPush();
  if (+[objc_LockscreenStatus isDeviceUnlocked](_TtC17StoreKitUIService21objc_LockscreenStatus, "isDeviceUnlocked"))
  {
    +[SKUIApplicationController prepareForLaunch](SKUIApplicationController, "prepareForLaunch");
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[AVAudioSession sharedInstance](AVAudioSession, "sharedInstance"));
    objc_msgSend(v5, "setCategory:error:", AVAudioSessionCategoryPlayback, 0);

    v6 = (objc_class *)objc_opt_class(ServiceAppDelegate);
    v7 = NSStringFromClass(v6);
    v8 = (NSString *)objc_claimAutoreleasedReturnValue(v7);
    v9 = UIApplicationMain(a1, a2, 0, v8);

  }
  else
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
      sub_100029808();
    v9 = 0xFFFFFFFFLL;
  }
  objc_autoreleasePoolPop(v4);
  return v9;
}

void sub_100007F74(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  id *v14;

  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_100007F94(uint64_t a1, void *a2)
{
  id *v2;
  id v3;
  id WeakRetained;

  v2 = (id *)(a1 + 32);
  v3 = a2;
  WeakRetained = objc_loadWeakRetained(v2);
  objc_msgSend(WeakRetained, "setConsentProvided:", v3);

  objc_msgSend(WeakRetained, "_dismissViewService");
}

void sub_100008290(uint64_t a1)
{
  id v1;

  v1 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "_remoteViewControllerProxy"));
  objc_msgSend(v1, "deactivate");

}

NSString *sub_100008A04(uint64_t a1)
{
  return +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("com.apple.storekit.unfinishedtransactions.%@"), a1);
}

__CFString *sub_100008A38(unint64_t a1)
{
  if (a1 >= 4)
    return (__CFString *)(id)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("Unknown: %ld"), a1));
  else
    return off_1000494A0[a1];
}

BOOL sub_100008A88(uint64_t a1)
{
  return (a1 & 0xFFFFFFFFFFFFFFFDLL) == 1;
}

id sub_100008A98(uint64_t a1)
{
  id v1;
  void *v2;
  void *v3;
  CFDictionaryRef v4;
  void *v5;

  v1 = sub_100008B18(a1);
  v2 = (void *)objc_claimAutoreleasedReturnValue(v1);
  v3 = v2;
  if (v2)
  {
    v4 = sub_100008B9C(v2);
    if (v4)
      v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSPropertyListSerialization dataWithPropertyList:format:options:error:](NSPropertyListSerialization, "dataWithPropertyList:format:options:error:", v4, 200, 0, 0));
    else
      v5 = 0;

  }
  else
  {
    v5 = 0;
  }

  return v5;
}

id sub_100008B18(uint64_t a1)
{
  void *v1;
  id v2;
  xpc_object_t v3;

  v1 = (void *)objc_claimAutoreleasedReturnValue(+[NSKeyedArchiver archivedDataWithRootObject:requiringSecureCoding:error:](NSKeyedArchiver, "archivedDataWithRootObject:requiringSecureCoding:error:", a1, 1, 0));
  if (objc_msgSend(v1, "length"))
  {
    v2 = objc_retainAutorelease(v1);
    v3 = xpc_data_create(objc_msgSend(v2, "bytes"), (size_t)objc_msgSend(v2, "length"));
  }
  else
  {
    v3 = 0;
  }

  return v3;
}

CFDictionaryRef sub_100008B9C(void *a1)
{
  id v1;
  void *v2;
  xpc_type_t type;
  CFDictionaryRef v4;
  _BOOL4 value;
  CFTypeRef *v6;
  const __CFDictionary *v7;
  const UInt8 *bytes_ptr;
  size_t length;
  int64_t v10;
  const char *string_ptr;
  size_t count;
  CFIndex v14;
  size_t v15;
  _OWORD *v16;
  uint64_t v17;
  uint64_t v18;
  char *v19;
  _QWORD applier[7];
  uint64_t v21;
  uint64_t *v22;
  uint64_t v23;
  uint64_t v24;
  _OWORD valuePtr[128];
  CFUUIDBytes v26;

  v1 = a1;
  v2 = v1;
  if (!v1)
    goto LABEL_12;
  type = xpc_get_type(v1);
  if (type == (xpc_type_t)&_xpc_type_BOOL)
  {
    value = xpc_BOOL_get_value(v2);
    v6 = (CFTypeRef *)&kCFBooleanTrue;
    if (!value)
      v6 = (CFTypeRef *)&kCFBooleanFalse;
    goto LABEL_15;
  }
  if (type == (xpc_type_t)&_xpc_type_data)
  {
    bytes_ptr = (const UInt8 *)xpc_data_get_bytes_ptr(v2);
    length = xpc_data_get_length(v2);
    v7 = CFDataCreate(kCFAllocatorSystemDefault, bytes_ptr, length);
    goto LABEL_24;
  }
  if (type == (xpc_type_t)&_xpc_type_date)
  {
    v10 = xpc_date_get_value(v2);
    v7 = CFDateCreate(kCFAllocatorSystemDefault, (double)v10 / 1000000000.0 - kCFAbsoluteTimeIntervalSince1970);
    goto LABEL_24;
  }
  if (type == (xpc_type_t)&_xpc_type_double)
  {
    *(_QWORD *)&valuePtr[0] = xpc_double_get_value(v2);
    v7 = CFNumberCreate(kCFAllocatorSystemDefault, kCFNumberDoubleType, valuePtr);
    goto LABEL_24;
  }
  if (type == (xpc_type_t)&_xpc_type_int64)
  {
    *(_QWORD *)&valuePtr[0] = xpc_int64_get_value(v2);
    v7 = CFNumberCreate(kCFAllocatorSystemDefault, kCFNumberSInt64Type, valuePtr);
    goto LABEL_24;
  }
  if (type == (xpc_type_t)&_xpc_type_null)
  {
    v6 = (CFTypeRef *)&kCFNull;
LABEL_15:
    v7 = (const __CFDictionary *)CFRetain(*v6);
LABEL_24:
    v4 = v7;
    goto LABEL_25;
  }
  if (type == (xpc_type_t)&_xpc_type_string)
  {
    string_ptr = xpc_string_get_string_ptr(v2);
    v7 = (const __CFDictionary *)CFStringCreateWithCString(kCFAllocatorSystemDefault, string_ptr, 0x8000100u);
    goto LABEL_24;
  }
  if (type == (xpc_type_t)&_xpc_type_uuid)
  {
    v26 = *(CFUUIDBytes *)xpc_uuid_get_bytes(v2);
    v7 = CFUUIDCreateFromUUIDBytes(kCFAllocatorSystemDefault, v26);
    goto LABEL_24;
  }
  if (type == (xpc_type_t)&_xpc_type_array)
  {
    v7 = sub_1000095A0(v2);
    goto LABEL_24;
  }
  if (type != (xpc_type_t)&_xpc_type_dictionary)
  {
LABEL_12:
    v4 = 0;
    goto LABEL_25;
  }
  count = xpc_dictionary_get_count(v2);
  v14 = count;
  v15 = 16 * count;
  memset(valuePtr, 0, 512);
  if (2 * count > 0x100)
  {
    v16 = malloc_type_malloc(16 * count, 0x8F7770E6uLL);
    bzero(v16, v15);
    if (!v16)
      goto LABEL_12;
  }
  else
  {
    v16 = valuePtr;
    __memset_chk(valuePtr, 0, v15, 2048);
  }
  v21 = 0;
  v22 = &v21;
  v23 = 0x2020000000;
  v24 = 0;
  applier[0] = _NSConcreteStackBlock;
  applier[1] = 3221225472;
  applier[2] = sub_1000097D8;
  applier[3] = &unk_100049458;
  applier[4] = &v21;
  applier[5] = v16;
  applier[6] = v14;
  xpc_dictionary_apply(v2, applier);
  v17 = v22[3];
  if (v14 == v17)
  {
    v4 = CFDictionaryCreate(kCFAllocatorSystemDefault, (const void **)v16, (const void **)v16 + v14, v14, &kCFTypeDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
    v17 = v22[3];
  }
  else
  {
    v4 = 0;
  }
  if (v17 >= 1)
  {
    v18 = 0;
    v19 = (char *)v16 + 8 * v14;
    do
    {
      CFRelease(*((CFTypeRef *)v16 + v18));
      CFRelease(*(CFTypeRef *)&v19[8 * v18++]);
    }
    while (v18 < v22[3]);
  }
  if (v16 != valuePtr)
    free(v16);
  _Block_object_dispose(&v21, 8);
LABEL_25:

  return v4;
}

void sub_100008FB0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

id sub_100008FD4(uint64_t a1)
{
  __CFString *v1;
  __CFString *v2;
  id v3;
  void *v4;
  uint64_t v5;
  id v6;
  void *v7;

  if (a1)
  {
    v1 = (__CFString *)objc_claimAutoreleasedReturnValue(+[NSPropertyListSerialization propertyListWithData:options:format:error:](NSPropertyListSerialization, "propertyListWithData:options:format:error:", a1, 0, 0, 0));
    v2 = v1;
    if (v1)
    {
      v3 = sub_100009078(v1);
      v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
      if (v4)
      {
        v5 = objc_opt_class(NSError);
        v6 = sub_1000094E4(v4, v5);
        v7 = (void *)objc_claimAutoreleasedReturnValue(v6);
      }
      else
      {
        v7 = 0;
      }

    }
    else
    {
      v7 = 0;
    }

  }
  else
  {
    v7 = 0;
  }
  return v7;
}

id sub_100009078(__CFString *a1)
{
  CFTypeID v2;
  xpc_object_t v3;
  BOOL v4;
  const UInt8 *BytePtr;
  size_t Length;
  xpc_object_t v8;
  double v9;
  CFIndex v10;
  size_t MaximumSizeForEncoding;
  CFIndex v12;
  char *v13;
  char *v14;
  __CFString *v15;
  id v16;
  id v17;
  uint64_t v18;
  void *i;
  uint64_t v20;
  void *v21;
  id v22;
  id v23;
  uint64_t v24;
  void *j;
  const __CFString *v26;
  CFIndex v27;
  size_t v28;
  CFIndex v29;
  char *v30;
  char *v31;
  const void *Value;
  uint64_t v33;
  void *v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  CFUUIDBytes uuid;
  _BYTE v44[128];
  _BYTE v45[128];

  if (!a1)
    goto LABEL_59;
  v2 = CFGetTypeID(a1);
  if (v2 == CFNullGetTypeID())
  {
    v3 = xpc_null_create();
    return v3;
  }
  if (v2 == CFBooleanGetTypeID())
  {
    v4 = CFBooleanGetValue((CFBooleanRef)a1) != 0;
    v3 = xpc_BOOL_create(v4);
    return v3;
  }
  if (v2 == CFDataGetTypeID())
  {
    BytePtr = CFDataGetBytePtr((CFDataRef)a1);
    Length = CFDataGetLength((CFDataRef)a1);
    v3 = xpc_data_create(BytePtr, Length);
    return v3;
  }
  if (v2 != CFDateGetTypeID())
  {
    if (v2 == CFUUIDGetTypeID())
    {
      uuid = CFUUIDGetUUIDBytes((CFUUIDRef)a1);
      v3 = xpc_uuid_create(&uuid.byte0);
      return v3;
    }
    if (v2 == CFStringGetTypeID())
    {
      v10 = CFStringGetLength(a1);
      MaximumSizeForEncoding = CFStringGetMaximumSizeForEncoding(v10 + 1, 0x8000100u);
      if (MaximumSizeForEncoding != -1)
      {
        v12 = MaximumSizeForEncoding;
        v13 = (char *)malloc_type_malloc(MaximumSizeForEncoding, 0xE5F918EFuLL);
        if (v13)
        {
          v14 = v13;
          if (CFStringGetCString(a1, v13, v12, 0x8000100u))
            v8 = xpc_string_create(v14);
          else
            v8 = 0;
          free(v14);
          return v8;
        }
      }
      goto LABEL_59;
    }
    if (v2 == CFNumberGetTypeID())
    {
      if (CFNumberIsFloatType((CFNumberRef)a1))
      {
        *(_QWORD *)&uuid.byte0 = 0;
        if (CFNumberGetValue((CFNumberRef)a1, kCFNumberDoubleType, &uuid))
        {
          v3 = xpc_double_create(*(double *)&uuid.byte0);
          return v3;
        }
      }
      else
      {
        *(_QWORD *)&uuid.byte0 = 0;
        if (CFNumberGetValue((CFNumberRef)a1, kCFNumberSInt64Type, &uuid))
        {
          v3 = xpc_int64_create(*(int64_t *)&uuid.byte0);
          return v3;
        }
      }
      goto LABEL_59;
    }
    if (v2 == CFArrayGetTypeID())
    {
      v8 = xpc_array_create(0, 0);
      if (!v8)
        return v8;
      v41 = 0u;
      v42 = 0u;
      v39 = 0u;
      v40 = 0u;
      v15 = a1;
      v16 = -[__CFString countByEnumeratingWithState:objects:count:](v15, "countByEnumeratingWithState:objects:count:", &v39, v45, 16);
      if (v16)
      {
        v17 = v16;
        v18 = *(_QWORD *)v40;
        do
        {
          for (i = 0; i != v17; i = (char *)i + 1)
          {
            if (*(_QWORD *)v40 != v18)
              objc_enumerationMutation(v15);
            v20 = sub_100009078(*(_QWORD *)(*((_QWORD *)&v39 + 1) + 8 * (_QWORD)i));
            v21 = (void *)objc_claimAutoreleasedReturnValue(v20);
            if (v21)
              xpc_array_append_value(v8, v21);

          }
          v17 = -[__CFString countByEnumeratingWithState:objects:count:](v15, "countByEnumeratingWithState:objects:count:", &v39, v45, 16);
        }
        while (v17);
      }
LABEL_52:

      return v8;
    }
    if (v2 == CFDictionaryGetTypeID())
    {
      v8 = xpc_dictionary_create(0, 0, 0);
      if (!v8)
        return v8;
      v37 = 0u;
      v38 = 0u;
      v35 = 0u;
      v36 = 0u;
      v15 = a1;
      v22 = -[__CFString countByEnumeratingWithState:objects:count:](v15, "countByEnumeratingWithState:objects:count:", &v35, v44, 16);
      if (v22)
      {
        v23 = v22;
        v24 = *(_QWORD *)v36;
        do
        {
          for (j = 0; j != v23; j = (char *)j + 1)
          {
            if (*(_QWORD *)v36 != v24)
              objc_enumerationMutation(v15);
            v26 = *(const __CFString **)(*((_QWORD *)&v35 + 1) + 8 * (_QWORD)j);
            v27 = CFStringGetLength(v26);
            v28 = CFStringGetMaximumSizeForEncoding(v27, 0x8000100u);
            if (v28 != -1)
            {
              v29 = v28;
              v30 = (char *)malloc_type_malloc(v28, 0xD53C8D31uLL);
              if (v30)
              {
                v31 = v30;
                if (CFStringGetCString(v26, v30, v29, 0x8000100u))
                {
                  Value = CFDictionaryGetValue((CFDictionaryRef)v15, v26);
                  v33 = sub_100009078(Value);
                  v34 = (void *)objc_claimAutoreleasedReturnValue(v33);
                  if (v34)
                    xpc_dictionary_set_value(v8, v31, v34);

                }
                free(v31);
              }
            }
          }
          v23 = -[__CFString countByEnumeratingWithState:objects:count:](v15, "countByEnumeratingWithState:objects:count:", &v35, v44, 16);
        }
        while (v23);
      }
      goto LABEL_52;
    }
    if ((objc_opt_respondsToSelector(a1, "copyXPCEncoding") & 1) != 0)
    {
      v3 = -[__CFString copyXPCEncoding](a1, "copyXPCEncoding");
      return v3;
    }
LABEL_59:
    v8 = 0;
    return v8;
  }
  v8 = 0;
  v9 = CFDateGetAbsoluteTime((CFDateRef)a1) + kCFAbsoluteTimeIntervalSince1970;
  if (v9 >= -9223372040.0 && v9 <= 9223372040.0)
  {
    v3 = xpc_date_create((uint64_t)(v9 * 1000000000.0));
    return v3;
  }
  return v8;
}

id sub_1000094E4(void *a1, uint64_t a2)
{
  id v3;
  void *v4;
  void *v5;
  size_t length;
  const void *bytes_ptr;
  id v9;
  void *v10;

  v3 = a1;
  v4 = v3;
  if (v3
    && xpc_get_type(v3) == (xpc_type_t)&_xpc_type_data
    && (length = xpc_data_get_length(v4), bytes_ptr = xpc_data_get_bytes_ptr(v4), length)
    && (v9 = objc_msgSend(objc_alloc((Class)NSData), "initWithBytesNoCopy:length:freeWhenDone:", bytes_ptr, length, 0)) != 0)
  {
    v10 = v9;
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSKeyedUnarchiver unarchivedObjectOfClass:fromData:error:](NSKeyedUnarchiver, "unarchivedObjectOfClass:fromData:error:", a2, v9, 0));

  }
  else
  {
    v5 = 0;
  }

  return v5;
}

CFArrayRef sub_1000095A0(void *a1)
{
  id v1;
  size_t count;
  CFIndex v3;
  size_t v4;
  _OWORD *v5;
  uint64_t v6;
  CFArrayRef v7;
  uint64_t v8;
  _QWORD applier[4];
  Block_layout *v11;
  uint64_t *v12;
  _OWORD *v13;
  uint64_t v14;
  uint64_t *v15;
  uint64_t v16;
  uint64_t v17;
  _OWORD v18[128];

  v1 = a1;
  count = xpc_array_get_count(v1);
  v3 = count;
  v4 = 8 * count;
  memset(v18, 0, 512);
  if (count > 0x100)
  {
    v5 = malloc_type_malloc(8 * count, 0xC0040B8AA526DuLL);
    bzero(v5, v4);
    if (!v5)
    {
      v7 = 0;
      goto LABEL_13;
    }
  }
  else
  {
    v5 = v18;
    __memset_chk(v18, 0, v4, 2048);
  }
  v14 = 0;
  v15 = &v14;
  v16 = 0x2020000000;
  v17 = 0;
  applier[0] = _NSConcreteStackBlock;
  applier[1] = 3221225472;
  applier[2] = sub_10000994C;
  applier[3] = &unk_100049480;
  v12 = &v14;
  v13 = v5;
  v11 = &stru_100049430;
  xpc_array_apply(v1, applier);
  v6 = v15[3];
  if (v3 == v6)
  {
    v7 = CFArrayCreate(kCFAllocatorSystemDefault, (const void **)v5, v3, &kCFTypeArrayCallBacks);
    v6 = v15[3];
  }
  else
  {
    v7 = 0;
  }
  if (v6 >= 1)
  {
    v8 = 0;
    do
      CFRelease(*((CFTypeRef *)v5 + v8++));
    while (v8 < v15[3]);
  }
  if (v5 != v18)
    free(v5);

  _Block_object_dispose(&v14, 8);
LABEL_13:

  return v7;
}

void sub_1000097AC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void *__cdecl sub_1000097D0(id a1, OS_xpc_object *a2)
{
  return sub_100008B9C(a2);
}

uint64_t sub_1000097D8(_QWORD *a1, const char *a2, uint64_t a3)
{
  uint64_t result;
  const void *v6;
  CFStringRef v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;

  result = sub_100008B9C(a3);
  if (result)
  {
    v6 = (const void *)result;
    v7 = CFStringCreateWithCString(kCFAllocatorSystemDefault, a2, 0x8000100u);
    if (v7)
    {
      *(_QWORD *)(a1[5] + 8 * *(_QWORD *)(*(_QWORD *)(a1[4] + 8) + 24)) = v7;
      v9 = a1[5];
      v8 = a1[6];
      v10 = *(_QWORD *)(a1[4] + 8);
      v11 = *(_QWORD *)(v10 + 24);
      *(_QWORD *)(v10 + 24) = v11 + 1;
      *(_QWORD *)(v9 + 8 * (v11 + v8)) = v6;
      return 1;
    }
    else
    {
      CFRelease(v6);
      return 0;
    }
  }
  return result;
}

CFDictionaryRef sub_100009874(void *a1, const char *a2)
{
  xpc_object_t value;
  void *v3;
  CFDictionaryRef v4;

  value = xpc_dictionary_get_value(a1, a2);
  v3 = (void *)objc_claimAutoreleasedReturnValue(value);
  v4 = sub_100008B9C(v3);

  return v4;
}

CFDictionaryRef sub_1000098A8(void *a1, const char *a2, uint64_t a3)
{
  CFDictionaryRef v4;
  CFDictionaryRef v5;

  v4 = sub_100009874(a1, a2);
  v5 = v4;
  if (v4 && (objc_opt_isKindOfClass(v4, a3) & 1) == 0)
  {
    CFRelease(v5);
    return 0;
  }
  return v5;
}

void sub_1000098F0(void *a1, const char *a2, __CFString *a3)
{
  id v5;
  void *v6;
  xpc_object_t xdict;

  xdict = a1;
  v5 = sub_100009078(a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
  if (v6)
    xpc_dictionary_set_value(xdict, a2, v6);

}

BOOL sub_10000994C(_QWORD *a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  v2 = (*(uint64_t (**)(void))(a1[4] + 16))();
  if (v2)
  {
    v3 = a1[6];
    v4 = *(_QWORD *)(a1[5] + 8);
    v5 = *(_QWORD *)(v4 + 24);
    *(_QWORD *)(v4 + 24) = v5 + 1;
    *(_QWORD *)(v3 + 8 * v5) = v2;
  }
  return v2 != 0;
}

id sub_100009FF4(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "dismiss");
}

void sub_10000AAE0(_Unwind_Exception *a1)
{
  id *v1;
  uint64_t v2;

  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 40));
  _Unwind_Resume(a1);
}

void sub_10000AAFC(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id WeakRetained;
  void *v8;
  unsigned int v9;
  uint64_t v10;
  NSObject *v11;
  id v12;
  void *v13;
  void *v14;
  ServiceClientContext *v15;
  uint64_t v16;
  _QWORD v17[4];
  id v18;
  uint64_t v19;
  id v20;
  int v21;
  id v22;
  __int16 v23;
  id v24;

  v5 = a2;
  v6 = a3;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  if (v6)
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[SSLogConfig sharedConfig](SSLogConfig, "sharedConfig"));
    v9 = objc_msgSend(v8, "shouldLog");
    if (objc_msgSend(v8, "shouldLogToDisk"))
      LODWORD(v10) = v9 | 2;
    else
      LODWORD(v10) = v9;
    v11 = objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "OSLogObject"));
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      v10 = v10;
    else
      v10 &= 2u;
    if ((_DWORD)v10)
    {
      v21 = 138543618;
      v22 = (id)objc_opt_class(WeakRetained);
      v23 = 2114;
      v24 = v6;
      v12 = v22;
      v13 = (void *)_os_log_send_and_compose_impl(v10, 0, 0, 0, &_mh_execute_header, v11, 16, "[%{public}@]: Failed to load configuration with error: %{public}@", &v21, 22);

      if (v13)
      {
        v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithCString:encoding:](NSString, "stringWithCString:encoding:", v13, 4));
        free(v13);
        SSFileLog(v8, CFSTR("%@"));

      }
    }
    else
    {

    }
    objc_msgSend(WeakRetained, "_loadDidFailWithError:", v6);
  }
  else
  {
    v15 = -[ServiceClientContext initWithConfigurationDictionary:]([ServiceClientContext alloc], "initWithConfigurationDictionary:", v5);
    v16 = *(_QWORD *)(a1 + 32);
    v17[0] = _NSConcreteStackBlock;
    v17[1] = 3221225472;
    v17[2] = sub_10000AD7C;
    v17[3] = &unk_1000494F0;
    v18 = WeakRetained;
    objc_copyWeak(&v20, (id *)(a1 + 48));
    v19 = *(_QWORD *)(a1 + 40);
    objc_msgSend(v18, "_buildReviewInAppConfigurationWithParameters:clientContext:completionHandler:", v16, v15, v17);
    objc_destroyWeak(&v20);

  }
}

void sub_10000AD60(_Unwind_Exception *a1)
{
  id *v1;

  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

void sub_10000AD7C(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  unsigned int v8;
  uint64_t v9;
  NSObject *v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  _QWORD v15[5];
  id v16;
  int v17;
  void *v18;

  v3 = a2;
  if (v3)
  {
    v4 = objc_msgSend(objc_alloc((Class)SKUIReviewInAppController), "initWithConfiguration:", v3);
    objc_msgSend(*(id *)(a1 + 32), "setReviewInAppController:", v4);

    v15[0] = _NSConcreteStackBlock;
    v15[1] = 3221225472;
    v15[2] = sub_10000AFD8;
    v15[3] = &unk_1000494C8;
    objc_copyWeak(&v16, (id *)(a1 + 48));
    v15[4] = *(_QWORD *)(a1 + 40);
    v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "reviewInAppController"));
    objc_msgSend(v5, "setCompletion:", v15);

    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "reviewInAppController"));
    objc_msgSend(v6, "start");

    objc_destroyWeak(&v16);
  }
  else
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[SSLogConfig sharedConfig](SSLogConfig, "sharedConfig"));
    v8 = objc_msgSend(v7, "shouldLog");
    if (objc_msgSend(v7, "shouldLogToDisk"))
      LODWORD(v9) = v8 | 2;
    else
      LODWORD(v9) = v8;
    v10 = objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "OSLogObject"));
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      v9 = v9;
    else
      v9 &= 2u;
    if ((_DWORD)v9)
    {
      v11 = (void *)objc_opt_class(*(_QWORD *)(a1 + 32));
      v17 = 138543362;
      v18 = v11;
      v12 = v11;
      v13 = (void *)_os_log_send_and_compose_impl(v9, 0, 0, 0, &_mh_execute_header, v10, 16, "[%{public}@]: Review configuration missing.", &v17, 12);

      if (v13)
      {
        v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithCString:encoding:](NSString, "stringWithCString:encoding:", v13, 4));
        free(v13);
        SSFileLog(v7, CFSTR("%@"));

      }
    }
    else
    {

    }
    objc_msgSend(*(id *)(a1 + 32), "_loadDidFailWithError:", 0);
  }

}

void sub_10000AFB8(_Unwind_Exception *a1)
{
  id *v1;

  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

void sub_10000AFD8(uint64_t a1, uint64_t a2, void *a3)
{
  id v5;
  id WeakRetained;
  void *v7;
  void *v8;
  void *v9;
  _UNKNOWN **v10;
  NSBundle *v11;
  void *v12;
  void *v13;
  id v14;
  NSBundle *v15;
  void *v16;
  void *v17;
  NSBundle *v18;
  void *v19;
  void *v20;
  id v21;
  uint64_t v22;
  _QWORD v23[4];
  id v24;

  v5 = a3;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v7 = WeakRetained;
  switch(a2)
  {
    case 0:
      objc_msgSend(WeakRetained, "_loadDidFailWithError:", v5);
      break;
    case 1:
      v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(WeakRetained, "_clientViewControllerProxy"));
      v9 = v8;
      v10 = &off_10004CE68;
      goto LABEL_5;
    case 2:
      v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(WeakRetained, "_clientViewControllerProxy"));
      v9 = v8;
      v10 = &off_10004CE50;
LABEL_5:
      objc_msgSend(v8, "didFinishWithResult:error:", v10, 0);

      break;
    case 3:
      v11 = +[NSBundle bundleForClass:](NSBundle, "bundleForClass:", objc_opt_class(SKUIReviewInAppController));
      v12 = (void *)objc_claimAutoreleasedReturnValue(v11);
      v13 = (void *)objc_claimAutoreleasedReturnValue(+[UIImage imageNamed:inBundle:](UIImage, "imageNamed:inBundle:", CFSTR("toast-review"), v12));

      v14 = objc_alloc((Class)SKUIToastViewController);
      v15 = +[NSBundle bundleForClass:](NSBundle, "bundleForClass:", objc_opt_class(SKUIReviewInAppController));
      v16 = (void *)objc_claimAutoreleasedReturnValue(v15);
      v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "localizedStringForKey:value:table:", CFSTR("TOAST_REVIEW_FINISHED_PRIMARY"), &stru_10004A1F0, 0));
      v18 = +[NSBundle bundleForClass:](NSBundle, "bundleForClass:", objc_opt_class(SKUIReviewInAppController));
      v19 = (void *)objc_claimAutoreleasedReturnValue(v18);
      v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "localizedStringForKey:value:table:", CFSTR("TOAST_REVIEW_FINISHED_SECONDARY"), &stru_10004A1F0, 0));
      v21 = objc_msgSend(v14, "initWithTitle:description:image:", v17, v20, v13);

      v22 = *(_QWORD *)(a1 + 32);
      v23[0] = _NSConcreteStackBlock;
      v23[1] = 3221225472;
      v23[2] = sub_10000B210;
      v23[3] = &unk_1000490B8;
      v24 = v7;
      objc_msgSend(v21, "presentFromViewController:completion:", v22, v23);

      break;
    default:
      break;
  }

}

void sub_10000B210(uint64_t a1)
{
  id v1;

  v1 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "_clientViewControllerProxy"));
  objc_msgSend(v1, "didFinishWithResult:error:", &off_10004CE38, 0);

}

void sub_10000B2E4(uint64_t a1)
{
  id v1;

  v1 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "_clientViewControllerProxy"));
  objc_msgSend(v1, "didFinishWithResult:error:", &off_10004CE68, 0);

}

void sub_10000B754(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  unsigned int v5;
  uint64_t v6;
  NSObject *v7;
  void *v8;
  id v9;
  void *v10;
  int v11;
  void *v12;
  __int16 v13;
  id v14;

  v3 = a2;
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[SSLogConfig sharedConfig](SSLogConfig, "sharedConfig"));
  v5 = objc_msgSend(v4, "shouldLog");
  if (objc_msgSend(v4, "shouldLogToDisk"))
    LODWORD(v6) = v5 | 2;
  else
    LODWORD(v6) = v5;
  v7 = objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "OSLogObject"));
  if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    v6 = v6;
  else
    v6 &= 2u;
  if (!(_DWORD)v6)
    goto LABEL_10;
  v8 = (void *)objc_opt_class(*(_QWORD *)(a1 + 32));
  v11 = 138412546;
  v12 = v8;
  v13 = 2112;
  v14 = v3;
  v9 = v8;
  v10 = (void *)_os_log_send_and_compose_impl(v6, 0, 0, 0, &_mh_execute_header, v7, 16, "[%@]: StoreKit service XPC error: %@", &v11, 22);

  if (v10)
  {
    v7 = objc_claimAutoreleasedReturnValue(+[NSString stringWithCString:encoding:](NSString, "stringWithCString:encoding:", v10, 4));
    free(v10);
    SSFileLog(v4, CFSTR("%@"));
LABEL_10:

  }
  (*(void (**)(_QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40));

}

void sub_10000B8E0(uint64_t a1, void *a2, void *a3)
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  unsigned int v11;
  uint64_t v12;
  NSObject *v13;
  void *v14;
  id v15;
  void *v16;
  void *v17;
  unsigned int v18;
  uint64_t v19;
  NSObject *v20;
  void *v21;
  void *v22;
  id v23;
  void *v24;
  int v25;
  void *v26;
  __int16 v27;
  id v28;

  v5 = a3;
  if (a2)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a2, "objectForKeyedSubscript:", *(_QWORD *)(a1 + 40)));
    if (v6)
    {
      v7 = *(void **)(a1 + 32);
      v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 48), "localizedName"));
      v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "_inAppConfigurationWithItemID:title:icon:sandboxed:clientContext:", v6, v8, *(_QWORD *)(a1 + 56), *(unsigned __int8 *)(a1 + 80), *(_QWORD *)(a1 + 64)));

      (*(void (**)(void))(*(_QWORD *)(a1 + 72) + 16))();
LABEL_26:

      goto LABEL_27;
    }
    v17 = (void *)objc_claimAutoreleasedReturnValue(+[SSLogConfig sharedConfig](SSLogConfig, "sharedConfig"));
    v18 = objc_msgSend(v17, "shouldLog");
    if (objc_msgSend(v17, "shouldLogToDisk"))
      LODWORD(v19) = v18 | 2;
    else
      LODWORD(v19) = v18;
    v20 = objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "OSLogObject"));
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
      v19 = v19;
    else
      v19 &= 2u;
    if ((_DWORD)v19)
    {
      v21 = (void *)objc_opt_class(*(_QWORD *)(a1 + 32));
      v22 = *(void **)(a1 + 40);
      v25 = 138412546;
      v26 = v21;
      v27 = 2112;
      v28 = v22;
      v23 = v21;
      v24 = (void *)_os_log_send_and_compose_impl(v19, 0, 0, 0, &_mh_execute_header, v20, 16, "[%@] Item ID for bundle ID '%@' not found", &v25, 22);

      if (!v24)
      {
LABEL_25:

        (*(void (**)(_QWORD))(*(_QWORD *)(a1 + 72) + 16))(*(_QWORD *)(a1 + 72));
        goto LABEL_26;
      }
      v20 = objc_claimAutoreleasedReturnValue(+[NSString stringWithCString:encoding:](NSString, "stringWithCString:encoding:", v24, 4));
      free(v24);
      SSFileLog(v17, CFSTR("%@"));
    }

    goto LABEL_25;
  }
  v10 = (void *)objc_claimAutoreleasedReturnValue(+[SSLogConfig sharedConfig](SSLogConfig, "sharedConfig"));
  v11 = objc_msgSend(v10, "shouldLog");
  if (objc_msgSend(v10, "shouldLogToDisk"))
    LODWORD(v12) = v11 | 2;
  else
    LODWORD(v12) = v11;
  v13 = objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "OSLogObject"));
  if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    v12 = v12;
  else
    v12 &= 2u;
  if (!(_DWORD)v12)
    goto LABEL_13;
  v14 = (void *)objc_opt_class(*(_QWORD *)(a1 + 32));
  v25 = 138412546;
  v26 = v14;
  v27 = 2112;
  v28 = v5;
  v15 = v14;
  v16 = (void *)_os_log_send_and_compose_impl(v12, 0, 0, 0, &_mh_execute_header, v13, 16, "[%@] Item ID lookup error: %@", &v25, 22);

  if (v16)
  {
    v13 = objc_claimAutoreleasedReturnValue(+[NSString stringWithCString:encoding:](NSString, "stringWithCString:encoding:", v16, 4));
    free(v16);
    SSFileLog(v10, CFSTR("%@"));
LABEL_13:

  }
  (*(void (**)(_QWORD))(*(_QWORD *)(a1 + 72) + 16))(*(_QWORD *)(a1 + 72));
LABEL_27:

}

void sub_10000C0F4(uint64_t a1)
{
  id v2;

  v2 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "_clientViewControllerProxy"));
  objc_msgSend(v2, "didFinishWithResult:error:", &off_10004CE80, *(_QWORD *)(a1 + 40));

}

id sub_10000C5DC(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "dismiss");
}

void sub_10000CC80(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  id *v14;

  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_10000CCA8(uint64_t a1, uint64_t a2)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_privacyViewControllerDidFinishWithResult:", a2);

}

void sub_10000CEA4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  id *v14;

  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_10000CEC8(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_dismiss");

}

void sub_10000CFA8(id a1)
{
  void *v1;
  uint64_t v2;
  void *v3;
  uint64_t v4;
  void *v5;

  v4 = SSPrivacyIdentifierMusicStore;
  v1 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor systemPinkColor](UIColor, "systemPinkColor"));
  v5 = v1;
  v2 = objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v5, &v4, 1));
  v3 = (void *)qword_1000632B8;
  qword_1000632B8 = v2;

}

id sub_10000D1B4(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "dismiss");
}

void sub_10000D35C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  id *v14;

  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_10000D378(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "setAcknowledgementReceived:", 1);
  objc_msgSend(WeakRetained, "splashDoneButtonPressed:", 0);

}

void sub_10000D428(id a1)
{
  uint64_t v1;
  void *v2;

  v1 = objc_claimAutoreleasedReturnValue(+[NSSet setWithObjects:](NSSet, "setWithObjects:", SSPrivacyIdentifierMusicStore, 0));
  v2 = (void *)qword_1000632C8;
  qword_1000632C8 = v1;

}

void sub_10000D64C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  id *v14;

  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_10000D668(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  _QWORD block[4];
  id v8;
  id v9;
  id v10;

  v5 = a2;
  v6 = a3;
  if (xpc_dictionary_get_int64(v5, "0") != -1)
  {
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_10000D740;
    block[3] = &unk_100049620;
    objc_copyWeak(&v10, (id *)(a1 + 32));
    v8 = v5;
    v9 = v6;
    dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);

    objc_destroyWeak(&v10);
  }

}

void sub_10000D740(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  objc_msgSend(WeakRetained, "_handleMessage:connection:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));

}

void sub_10000D82C(uint64_t a1)
{
  _QWORD block[5];

  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10000D888;
  block[3] = &unk_1000490B8;
  block[4] = *(_QWORD *)(a1 + 32);
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
}

id sub_10000D888(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_closeReceiverConnection");
}

void sub_10000D960(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  id *v14;

  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_10000D97C(uint64_t a1)
{
  _QWORD block[4];
  id v2;

  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10000D9F4;
  block[3] = &unk_100048FD0;
  objc_copyWeak(&v2, (id *)(a1 + 32));
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
  objc_destroyWeak(&v2);
}

void sub_10000D9F4(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_disconnect");

}

void sub_10000E0B0(uint64_t a1, void *a2)
{
  uint64_t v3;
  id v4;

  v4 = a2;
  objc_msgSend(v4, "setHostApplicationIdentifier:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8));
  v3 = *(_QWORD *)(a1 + 40);
  if (v3)
    (*(void (**)(uint64_t, id))(v3 + 16))(v3, v4);

}

void sub_10000EED8(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  id v4;

  v2 = *(_QWORD *)(a1 + 40);
  if (v2)
    (*(void (**)(void))(v2 + 16))();
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "presentedViewController"));

  if (!v3)
  {
    v4 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "proxyHandler"));
    objc_msgSend(v4, "dismissViewController");

  }
}

BOOL sub_10000F240(_OWORD *a1, const __CFString *a2)
{
  __int128 v3;
  __SecTask *v4;
  __SecTask *v5;
  CFTypeRef v6;
  void *v7;
  unsigned int v8;
  unsigned int v9;
  NSObject *v10;
  uint64_t v11;
  void *v12;
  CFTypeID v13;
  _BOOL8 v14;
  CFErrorRef error;
  audit_token_t token;

  v3 = a1[1];
  *(_OWORD *)token.val = *a1;
  *(_OWORD *)&token.val[4] = v3;
  v4 = SecTaskCreateWithAuditToken(0, &token);
  if (!v4)
    return 0;
  v5 = v4;
  error = 0;
  v6 = SecTaskCopyValueForEntitlement(v4, a2, &error);
  if (error)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[SSLogConfig sharedConfig](SSLogConfig, "sharedConfig"));
    v8 = objc_msgSend(v7, "shouldLog");
    if (objc_msgSend(v7, "shouldLogToDisk"))
      v9 = v8 | 2;
    else
      v9 = v8;
    v10 = objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "OSLogObject"));
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
      v11 = v9;
    else
      v11 = v9 & 2;
    if ((_DWORD)v11)
    {
      token.val[0] = 138412290;
      *(_QWORD *)&token.val[1] = error;
      v12 = (void *)_os_log_send_and_compose_impl(v11, 0, 0, 0, &_mh_execute_header, v10, 0, "Unable to get entitlements: %@", &token, 12);

      if (!v12)
      {
LABEL_13:

        CFRelease(error);
        goto LABEL_14;
      }
      v10 = objc_claimAutoreleasedReturnValue(+[NSString stringWithCString:encoding:](NSString, "stringWithCString:encoding:", v12, 4));
      free(v12);
      SSFileLog(v7, CFSTR("%@"));
    }

    goto LABEL_13;
  }
LABEL_14:
  if (v6)
  {
    v13 = CFGetTypeID(v6);
    v14 = v13 == CFBooleanGetTypeID() && CFBooleanGetValue((CFBooleanRef)v6) != 0;
    CFRelease(v6);
  }
  else
  {
    v14 = 0;
  }
  CFRelease(v5);
  return v14;
}

id sub_10000FA50(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "dismiss");
}

void sub_1000106F4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, char a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,char a29)
{
  _Block_object_dispose(&a18, 8);
  _Block_object_dispose(&a29, 8);
  _Unwind_Resume(a1);
}

intptr_t sub_100010734(uint64_t a1)
{
  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

uint64_t sub_10001073C(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void sub_10001074C(uint64_t a1)
{

}

void sub_100010754(uint64_t a1, void *a2, void *a3)
{
  id v5;
  uint64_t v6;
  id v7;

  v7 = a2;
  v5 = a3;
  if (objc_msgSend(v7, "isEqualToString:", CFSTR("bundleId")))
  {
    v6 = *(_QWORD *)(a1 + 32);
LABEL_5:
    objc_storeStrong((id *)(*(_QWORD *)(v6 + 8) + 40), a3);
    goto LABEL_6;
  }
  if (objc_msgSend(v7, "isEqualToString:", CFSTR("productIdentifier")))
  {
    v6 = *(_QWORD *)(a1 + 40);
    goto LABEL_5;
  }
LABEL_6:

}

void sub_100010D98(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
  id *v16;

  objc_destroyWeak(v16);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_100010DC0(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  _QWORD v5[4];
  id v6;
  id v7;

  v3 = a2;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_100010E64;
  v5[3] = &unk_100049730;
  objc_copyWeak(&v7, (id *)(a1 + 32));
  v6 = v3;
  v4 = v3;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, v5);

  objc_destroyWeak(&v7);
}

void sub_100010E64(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "_showViewControllerForAlertProxy:", *(_QWORD *)(a1 + 32));

}

id sub_100011490(uint64_t a1)
{
  return _objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "_dismissViewController");
}

void sub_100011960(id a1)
{
  ServiceBridgedPresentationController *v1;
  void *v2;

  v1 = objc_alloc_init(ServiceBridgedPresentationController);
  v2 = (void *)qword_1000632D8;
  qword_1000632D8 = (uint64_t)v1;

}

void sub_100011C7C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
  id *v16;

  objc_destroyWeak(v16);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_100011CA4(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  _QWORD v5[4];
  id v6;
  id v7;

  v3 = a2;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_100011D48;
  v5[3] = &unk_100049730;
  objc_copyWeak(&v7, (id *)(a1 + 32));
  v6 = v3;
  v4 = v3;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, v5);

  objc_destroyWeak(&v7);
}

void sub_100011D48(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "_showAlertForAlertProxy:", *(_QWORD *)(a1 + 32));

}

void sub_100012408(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, id location)
{
  id *v18;

  objc_destroyWeak(v18);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_100012430(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  _BOOL8 v7;
  void *v8;
  void *v9;
  _QWORD v10[4];
  id v11[2];

  v5 = a2;
  v6 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "defaultButton"));
  v7 = v6 == v5;

  v8 = *(void **)(*(_QWORD *)(a1 + 40) + 8);
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "buttonTitle"));
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_10001252C;
  v10[3] = &unk_1000497A0;
  objc_copyWeak(v11, (id *)(a1 + 48));
  v11[1] = a3;
  objc_msgSend(v8, "_addActionWithTitle:style:handler:", v9, v7, v10);

  objc_destroyWeak(v11);
}

void sub_100012518(_Unwind_Exception *a1)
{
  id *v1;

  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

void sub_10001252C(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_finishWithButtonIndex:", *(_QWORD *)(a1 + 40));

}

void sub_100012FA8(_Unwind_Exception *a1)
{
  id *v1;
  uint64_t v2;

  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 40));
  _Unwind_Resume(a1);
}

void sub_100012FC4(id *a1)
{
  void *v2;
  void *v3;
  void *v4;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained(a1 + 6);
  objc_msgSend(WeakRetained, "addChildViewController:", a1[4]);
  v2 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1[4], "view"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(WeakRetained, "view"));
  objc_msgSend(v3, "bounds");
  objc_msgSend(v2, "setFrame:");

  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(WeakRetained, "view"));
  objc_msgSend(v4, "addSubview:", v2);

  objc_msgSend(a1[4], "didMoveToParentViewController:", WeakRetained);
  objc_msgSend(a1[5], "_startIfReady");

}

id sub_100013A40()
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
  v0 = (void *)qword_1000632E8;
  v7 = qword_1000632E8;
  if (!qword_1000632E8)
  {
    v3[0] = _NSConcreteStackBlock;
    v3[1] = 3221225472;
    v3[2] = sub_100014AC4;
    v3[3] = &unk_100049840;
    v3[4] = &v4;
    sub_100014AC4((uint64_t)v3);
    v0 = (void *)v5[3];
  }
  v1 = v0;
  _Block_object_dispose(&v4, 8);
  return v1;
}

void sub_100013AE0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_100013AF8(uint64_t a1, void *a2)
{
  id v3;
  _BYTE *v4;
  id v5;
  _BYTE *v6;
  _QWORD v7[4];
  id v8;
  id v9;
  _QWORD v10[4];
  id v11;
  _BYTE *v12;

  v3 = a2;
  v4 = *(_BYTE **)(a1 + 32);
  v4[50] = 0;
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_100013BFC;
  v10[3] = &unk_100049590;
  v11 = v3;
  v12 = v4;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_100013C9C;
  v7[3] = &unk_1000497F0;
  v8 = v11;
  v9 = *(id *)(a1 + 40);
  v5 = v11;
  v6 = v4;
  +[UIView animateWithDuration:animations:completion:](UIView, "animateWithDuration:animations:completion:", v10, v7, 0.349999994);

}

void sub_100013BFC(uint64_t a1)
{
  double v2;
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  void *v8;
  double MaxY;
  void *v10;
  id v11;
  CGRect v12;

  v11 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "view"));
  objc_msgSend(v11, "frame");
  v3 = v2;
  v5 = v4;
  v7 = v6;
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 40), "view"));
  objc_msgSend(v8, "frame");
  MaxY = CGRectGetMaxY(v12);

  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "view"));
  objc_msgSend(v10, "setFrame:", v3, MaxY, v5, v7);

}

uint64_t sub_100013C9C(uint64_t a1)
{
  void *v2;

  objc_msgSend(*(id *)(a1 + 32), "willMoveToParentViewController:", 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "view"));
  objc_msgSend(v2, "removeFromSuperview");

  objc_msgSend(*(id *)(a1 + 32), "removeFromParentViewController");
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

void sub_100014268(uint64_t a1)
{
  uint64_t v2;
  void *v3;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "setDelegate:", 0);
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "_stopApplication");
  v2 = *(_QWORD *)(a1 + 32);
  v3 = *(void **)(v2 + 16);
  *(_QWORD *)(v2 + 16) = 0;

}

Class sub_100014AC4(uint64_t a1)
{
  char *v2;
  Class result;
  char *v4;
  __int128 v5;
  uint64_t v6;

  v4 = 0;
  if (!qword_1000632F0)
  {
    v5 = off_100049860;
    v6 = 0;
    qword_1000632F0 = _sl_dlopen(&v5, &v4);
    v2 = v4;
    if (!qword_1000632F0)
    {
      abort_report_np("%s", v4);
      goto LABEL_7;
    }
    if (v4)
      goto LABEL_8;
  }
  while (1)
  {
    result = objc_getClass("MSOnboardingUtil");
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
    if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
      break;
LABEL_7:
    v2 = (char *)sub_100029B68();
LABEL_8:
    free(v2);
  }
  qword_1000632E8 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  return result;
}

void sub_100014BD0(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 0x20u);
}

void sub_1000159EC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
  id *v16;

  objc_destroyWeak(v16);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_100015A10(uint64_t a1, uint64_t a2, void *a3)
{
  id v5;
  id WeakRetained;
  void *v7;
  unsigned int v8;
  uint64_t v9;
  NSObject *v10;
  id v11;
  void *v12;
  NSObject *v13;
  int v14;
  id v15;
  __int16 v16;
  id v17;

  v5 = a3;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (!a2)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[SSLogConfig sharedConfig](SSLogConfig, "sharedConfig"));
    v8 = objc_msgSend(v7, "shouldLog");
    if (objc_msgSend(v7, "shouldLogToDisk"))
      LODWORD(v9) = v8 | 2;
    else
      LODWORD(v9) = v8;
    v10 = objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "OSLogObject"));
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
      v9 = v9;
    else
      v9 &= 2u;
    if ((_DWORD)v9)
    {
      v14 = 138543618;
      v15 = (id)objc_opt_class(WeakRetained);
      v16 = 2112;
      v17 = v5;
      v11 = v15;
      v12 = (void *)_os_log_send_and_compose_impl(v9, 0, 0, 0, &_mh_execute_header, v10, 0, "%{public}@: Could not load configuration, reason: %@", &v14, 22);

      if (!v12)
      {
LABEL_12:

        goto LABEL_13;
      }
      v10 = objc_claimAutoreleasedReturnValue(+[NSString stringWithCString:encoding:](NSString, "stringWithCString:encoding:", v12, 4));
      free(v12);
      v13 = v10;
      SSFileLog(v7, CFSTR("%@"));
    }

    goto LABEL_12;
  }
LABEL_13:
  objc_msgSend(WeakRetained, "_loadURLWithActiveConfiguration:", *(_QWORD *)(a1 + 32), v13);

}

void sub_100015EFC(uint64_t a1)
{
  void *v1;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v1 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(WeakRetained, "presentingBridgedViewController"));
  objc_msgSend(v1, "dismissAnimated:", 0);

}

void sub_1000166F8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t sub_100016710(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void sub_100016720(uint64_t a1)
{

}

void sub_100016728(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4;
  void *v5;

  objc_msgSend(*(id *)(a1 + 32), "finishWithResult:error:", a2, a3);
  v4 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v5 = *(void **)(v4 + 40);
  *(_QWORD *)(v4 + 40) = 0;

}

void sub_10001741C(_Unwind_Exception *a1)
{
  id *v1;
  uint64_t v2;

  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 128));
  _Unwind_Resume(a1);
}

void sub_100017440(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id v7;
  id v8;
  _QWORD block[4];
  id v10;
  id v11;
  id v12;

  v5 = a2;
  v6 = a3;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000174FC;
  block[3] = &unk_1000498D0;
  v10 = *(id *)(a1 + 32);
  v11 = v5;
  v12 = v6;
  v7 = v6;
  v8 = v5;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);

}

void sub_1000174FC(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  id v12;
  id v13;
  void *v14;
  id v15;
  void *v16;
  unsigned int v17;
  uint64_t v18;
  NSObject *v19;
  id v20;
  void *v21;
  int v22;
  id v23;
  __int16 v24;
  const __CFString *v25;

  v2 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "object"));
  v3 = *(_QWORD *)(a1 + 40);
  v4 = objc_opt_class(NSString);
  if ((objc_opt_isKindOfClass(v3, v4) & 1) == 0)
  {
    v16 = (void *)objc_claimAutoreleasedReturnValue(+[SSLogConfig sharedConfig](SSLogConfig, "sharedConfig"));
    v17 = objc_msgSend(v16, "shouldLog");
    if (objc_msgSend(v16, "shouldLogToDisk"))
      LODWORD(v18) = v17 | 2;
    else
      LODWORD(v18) = v17;
    v19 = objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "OSLogObject"));
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
      v18 = v18;
    else
      v18 &= 2u;
    if ((_DWORD)v18)
    {
      v22 = 138543618;
      v23 = (id)objc_opt_class(v2);
      v24 = 2112;
      v25 = CFSTR("paymentsAndShippingUrl");
      v20 = v23;
      v21 = (void *)_os_log_send_and_compose_impl(v18, 0, 0, 0, &_mh_execute_header, v19, 16, "%{public}@: Bag key for %@ was not found", &v22, 22);

      if (!v21)
      {
LABEL_17:

        objc_msgSend(v2, "_presentErrorViewControllerWithError:", *(_QWORD *)(a1 + 48));
        goto LABEL_18;
      }
      v19 = objc_claimAutoreleasedReturnValue(+[NSString stringWithCString:encoding:](NSString, "stringWithCString:encoding:", v21, 4));
      free(v21);
      SSFileLog(v16, CFSTR("%@"));
    }

    goto LABEL_17;
  }
  v5 = objc_msgSend(objc_alloc((Class)NSURL), "initWithString:", *(_QWORD *)(a1 + 40));
  v6 = objc_msgSend(objc_alloc((Class)SUAccountViewController), "initWithExternalAccountURL:", v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "account"));
  objc_msgSend(v6, "setAccount:", v7);

  if ((objc_opt_respondsToSelector(v6, "setShowAccountGlyph:") & 1) != 0)
    objc_msgSend(v6, "setShowAccountGlyph:", objc_msgSend(v2, "showAccountGlyph"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "clientInterface"));
  objc_msgSend(v8, "setShowDialogOnError:", 1);

  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "clientInterface"));
  objc_msgSend(v6, "setClientInterface:", v9);

  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "authenticationContext"));
  v11 = objc_msgSend(v10, "mutableCopy");

  if (!v11)
  {
    v12 = objc_alloc((Class)SSMutableAuthenticationContext);
    v13 = objc_alloc((Class)SSAccount);
    v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "account"));
    v15 = objc_msgSend(v13, "initWithBackingAccount:", v14);
    v11 = objc_msgSend(v12, "initWithAccount:", v15);

  }
  objc_msgSend(v11, "setDisplaysOnLockScreen:", 1);
  objc_msgSend(v6, "setAuthenticationContext:", v11);
  objc_msgSend(v6, "setStyle:", 0);
  objc_msgSend(v2, "setPresentedAccountViewController:", v6);
  objc_msgSend(v2, "_presentViewController:", v6);

LABEL_18:
}

void sub_100017830(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id WeakRetained;
  void *v8;
  void *v9;
  id v10;
  id v11;
  _QWORD block[4];
  id v13;
  id v14;
  id v15;

  v5 = a3;
  v6 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "allItems"));

  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "firstObject"));
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100017918;
  block[3] = &unk_1000498D0;
  v13 = v5;
  v14 = v9;
  v15 = WeakRetained;
  v10 = v9;
  v11 = v5;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);

}

void sub_100017918(uint64_t a1)
{
  id v2;
  void *v3;
  id v4;
  ServiceSKUIGiftViewController *v5;
  void *v6;
  id v7;

  if (*(_QWORD *)(a1 + 32) || !*(_QWORD *)(a1 + 40))
  {
    objc_msgSend(*(id *)(a1 + 48), "dismissHostViewControllerWithResult:error:", 0);
  }
  else
  {
    v2 = objc_alloc((Class)SKUIItem);
    v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 40), "lookupDictionary"));
    v7 = objc_msgSend(v2, "initWithLookupDictionary:", v3);

    v4 = objc_msgSend(objc_alloc((Class)SKUIGift), "initWithItem:", v7);
    v5 = -[ServiceSKUIGiftViewController initWithGift:]([ServiceSKUIGiftViewController alloc], "initWithGift:", v4);
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[ServiceClientContext defaultContext](ServiceClientContext, "defaultContext"));
    -[ServiceSKUIGiftViewController setClientContext:](v5, "setClientContext:", v6);

    -[ServiceSKUIGiftViewController setEmbeddedParent:](v5, "setEmbeddedParent:", *(_QWORD *)(a1 + 48));
    objc_msgSend(*(id *)(a1 + 48), "setUnderlyingViewController:", v5);
    objc_msgSend(*(id *)(a1 + 48), "setChildViewController:", v5);

  }
}

void sub_100017B90(uint64_t a1)
{
  unsigned int v2;
  void *v3;
  void *v4;
  id v5;

  if (!*(_BYTE *)(*(_QWORD *)(a1 + 32) + 16))
  {
    v5 = objc_msgSend(objc_alloc((Class)UIBarButtonItem), "initWithBarButtonSystemItem:target:action:", 1, *(_QWORD *)(a1 + 32), "_cancelButtonAction:");
    objc_msgSend(v5, "setTag:", 999);
    v2 = objc_msgSend(*(id *)(a1 + 32), "showAccountGlyph");
    v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 40), "navigationItem"));
    v4 = v3;
    if (v2)
      objc_msgSend(v3, "setRightBarButtonItem:animated:", v5, 1);
    else
      objc_msgSend(v3, "setLeftBarButtonItem:animated:", v5, 1);

  }
}

void sub_100017DFC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
  id *v16;

  objc_destroyWeak(v16);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_100017E24(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "dismissHostViewControllerWithResult:error:", 0, *(_QWORD *)(a1 + 32));

}

void sub_10001888C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

id sub_1000188A4()
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
  v0 = (void *)qword_1000632F8;
  v7 = qword_1000632F8;
  if (!qword_1000632F8)
  {
    v3[0] = _NSConcreteStackBlock;
    v3[1] = 3221225472;
    v3[2] = sub_1000193B4;
    v3[3] = &unk_100049840;
    v3[4] = &v4;
    sub_1000193B4((uint64_t)v3);
    v0 = (void *)v5[3];
  }
  v1 = v0;
  _Block_object_dispose(&v4, 8);
  return v1;
}

void sub_100018944(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_100018B30(_Unwind_Exception *a1)
{
  uint64_t v1;

  _Block_object_dispose((const void *)(v1 - 80), 8);
  _Unwind_Resume(a1);
}

uint64_t sub_100018B48(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void sub_100018B58(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  _QWORD v5[4];
  id v6;
  id v7;

  if (a2)
  {
    v3 = objc_msgSend(a2, "integerValue");
    if (v3 == (id)1)
      v4 = 0;
    else
      v4 = v3;
  }
  else
  {
    v4 = 0;
  }
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_100018BE8;
  v5[3] = &unk_100049948;
  v6 = *(id *)(a1 + 32);
  v7 = v4;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, v5);

}

uint64_t sub_100018BE8(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 32) + 16))(*(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));
}

id sub_100018CB8(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "dismiss");
}

void sub_100018DE0(uint64_t a1, uint64_t a2)
{
  id v3;
  id v4;

  v4 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "_viewControllerForType:", a2));
  v3 = objc_msgSend(objc_alloc((Class)UINavigationController), "initWithRootViewController:", v4);
  objc_msgSend(v3, "setModalPresentationStyle:", 4);
  objc_msgSend(v3, "setTransitioningDelegate:", *(_QWORD *)(a1 + 32));
  objc_msgSend(*(id *)(a1 + 32), "setUnderlyingViewController:", v3);
  objc_msgSend(*(id *)(a1 + 32), "presentViewController:animated:completion:", v3, 1, 0);

}

Class sub_1000193B4(uint64_t a1)
{
  char *v2;
  Class result;
  char *v4;
  __int128 v5;
  uint64_t v6;

  v4 = 0;
  if (!qword_100063300)
  {
    v5 = off_1000499B8;
    v6 = 0;
    qword_100063300 = _sl_dlopen(&v5, &v4);
    v2 = v4;
    if (!qword_100063300)
    {
      abort_report_np("%s", v4);
      goto LABEL_7;
    }
    if (v4)
      goto LABEL_8;
  }
  while (1)
  {
    result = objc_getClass("AMSUIWebViewController");
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
    if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
      break;
LABEL_7:
    v2 = (char *)sub_100029B8C();
LABEL_8:
    free(v2);
  }
  qword_1000632F8 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  return result;
}

void sub_1000194A8(uint64_t a1)
{
  sub_1000194FC();
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = objc_getClass("AMSBag");
  if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
  {
    qword_100063308 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  }
  else
  {
    sub_100029BB0();
    sub_1000194FC();
  }
}

void sub_1000194FC()
{
  char *v0;
  char *v1;
  __int128 v2;
  uint64_t v3;

  v1 = 0;
  if (!qword_100063310)
  {
    v2 = off_1000499D0;
    v3 = 0;
    qword_100063310 = _sl_dlopen(&v2, &v1);
  }
  v0 = v1;
  if (!qword_100063310)
  {
    v0 = (char *)abort_report_np("%s", v1);
    goto LABEL_7;
  }
  if (v1)
LABEL_7:
    free(v0);
}

Class sub_1000195A8(uint64_t a1)
{
  Class result;
  void *v3;
  SEL v4;

  sub_1000194FC();
  result = objc_getClass("AMSURLParser");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
  {
    qword_100063318 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  }
  else
  {
    v3 = (void *)sub_100029BD4();
    return (Class)+[ServiceHostRegistry sharedInstance](v3, v4);
  }
  return result;
}

void sub_10001963C(id a1)
{
  ServiceHostRegistry *v1;
  void *v2;

  v1 = objc_alloc_init(ServiceHostRegistry);
  v2 = (void *)qword_100063320;
  qword_100063320 = (uint64_t)v1;

}

void sub_100019F50(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,id location)
{
  id *v21;

  objc_destroyWeak(v21);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_100019F8C(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  unsigned int v5;
  unsigned int v6;
  NSObject *v7;
  uint64_t v8;
  id WeakRetained;
  void *v10;
  uint64_t v11;
  id v12;
  void *v13;
  uint64_t v14;
  void *v15;
  id v16;
  void *v17;
  id v18;
  int v19;
  void *v20;
  __int16 v21;
  uint64_t v22;
  __int16 v23;
  void *v24;
  __int16 v25;
  uint64_t v26;

  v3 = a2;
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[SSLogConfig sharedConfig](SSLogConfig, "sharedConfig"));
  v5 = objc_msgSend(v4, "shouldLog");
  if (objc_msgSend(v4, "shouldLogToDisk"))
    v6 = v5 | 2;
  else
    v6 = v5;
  v7 = objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "OSLogObject"));
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
    v8 = v6;
  else
    v8 = v6 & 2;
  if (!(_DWORD)v8)
    goto LABEL_10;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v10 = (void *)objc_opt_class(WeakRetained);
  v11 = *(_QWORD *)(a1 + 32);
  v18 = v10;
  v12 = objc_loadWeakRetained((id *)(a1 + 40));
  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "_hostApplicationBundleIdentifier"));
  v14 = *(_QWORD *)(a1 + 48);
  v19 = 138544130;
  v20 = v10;
  v21 = 2114;
  v22 = v11;
  v23 = 2112;
  v24 = v13;
  v25 = 2048;
  v26 = v14;
  v15 = (void *)_os_log_send_and_compose_impl(v8, 0, 0, 0, &_mh_execute_header, v7, 2, "[%{public}@][%{public}@]: Setting up extension with client: %@, bagType: %li", &v19, 42);

  if (v15)
  {
    v7 = objc_claimAutoreleasedReturnValue(+[NSString stringWithCString:encoding:](NSString, "stringWithCString:encoding:", v15, 4));
    free(v15);
    SSFileLog(v4, CFSTR("%@"));
LABEL_10:

  }
  v16 = objc_loadWeakRetained((id *)(a1 + 40));
  v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "_hostApplicationBundleIdentifier"));
  objc_msgSend(v3, "setupWithClientBundleID:bagType:", v17, *(_QWORD *)(a1 + 48));

}

void sub_10001A4D4(id a1, ServiceProductPage *a2)
{
  -[ServiceProductPage finishImmediately](a2, "finishImmediately");
}

void sub_10001A574(uint64_t a1)
{
  id v1;

  v1 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "_clientViewControllerProxy"));
  objc_msgSend(v1, "didFinishDismissal");

}

id sub_10001A61C(uint64_t a1, void *a2)
{
  return _objc_msgSend(a2, "finishStarRatingPromptWithRating:", *(_QWORD *)(a1 + 32));
}

void sub_10001A748(uint64_t a1)
{
  uint64_t v1;
  id v3;
  NSBundle *v4;
  void *v5;
  void *v6;
  id v7;
  id v8;

  v1 = *(_QWORD *)(a1 + 32);
  if (!*(_BYTE *)(v1 + 32) && !*(_QWORD *)(v1 + 24))
  {
    v8 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 40), "navigationItem"));
    v3 = objc_alloc((Class)UIBarButtonItem);
    v4 = +[NSBundle bundleForClass:](NSBundle, "bundleForClass:", objc_opt_class(SKStoreProductViewController));
    v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "localizedStringForKey:value:table:", CFSTR("CANCEL"), &stru_10004A1F0, 0));
    v7 = objc_msgSend(v3, "initWithTitle:style:target:action:", v6, 0, *(_QWORD *)(a1 + 32), "_cancelButtonAction:");
    objc_msgSend(v8, "setLeftBarButtonItem:animated:", v7, 1);

  }
}

id sub_10001A8E4(uint64_t a1, void *a2)
{
  return _objc_msgSend(a2, "loadProductWithPageDictionary:", *(_QWORD *)(a1 + 32));
}

void sub_10001AC18(_Unwind_Exception *a1)
{
  id *v1;
  uint64_t v2;

  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 40));
  _Unwind_Resume(a1);
}

void sub_10001AC34(id *a1, unint64_t a2, uint64_t a3)
{
  id *v6;
  id WeakRetained;
  void *v8;
  _QWORD v9[4];
  id v10;
  id v11;
  id v12;
  _QWORD block[4];
  id v14;

  v6 = a1 + 6;
  WeakRetained = objc_loadWeakRetained(a1 + 6);
  v8 = WeakRetained;
  if (a2 > 1)
  {
    v9[0] = _NSConcreteStackBlock;
    v9[1] = 3221225472;
    v9[2] = sub_10001AD90;
    v9[3] = &unk_100049620;
    objc_copyWeak(&v12, v6);
    v10 = a1[4];
    v11 = a1[5];
    dispatch_async((dispatch_queue_t)&_dispatch_main_q, v9);

    objc_destroyWeak(&v12);
  }
  else
  {
    objc_msgSend(WeakRetained, "_respondWithSuccess:", a3 == 0);
    if (a3)
    {
      block[0] = _NSConcreteStackBlock;
      block[1] = 3221225472;
      block[2] = sub_10001AD70;
      block[3] = &unk_1000490B8;
      v14 = v8;
      dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);

    }
  }

}

id sub_10001AD70(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_setupErrorViewController");
}

void sub_10001AD90(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  objc_msgSend(WeakRetained, "_showLegacyControllerForProductID:parameters:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));

}

void sub_10001B0C0(_Unwind_Exception *a1)
{
  id *v1;
  uint64_t v2;

  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 40));
  _Unwind_Resume(a1);
}

void sub_10001B0E4(uint64_t a1, void *a2)
{
  id *v3;
  id v4;
  id WeakRetained;
  void *v6;
  unsigned int v7;
  uint64_t v8;
  NSObject *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  void *v14;
  id v15;
  int v16;
  void *v17;
  __int16 v18;
  uint64_t v19;
  __int16 v20;
  uint64_t v21;
  __int16 v22;
  void *v23;

  v3 = (id *)(a1 + 48);
  v4 = a2;
  WeakRetained = objc_loadWeakRetained(v3);
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[SSLogConfig sharedConfig](SSLogConfig, "sharedConfig"));
  v7 = objc_msgSend(v6, "shouldLog");
  if (objc_msgSend(v6, "shouldLogToDisk"))
    LODWORD(v8) = v7 | 2;
  else
    LODWORD(v8) = v7;
  v9 = objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "OSLogObject"));
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
    v8 = v8;
  else
    v8 &= 2u;
  if (!(_DWORD)v8)
    goto LABEL_10;
  v10 = (void *)objc_opt_class(WeakRetained);
  v12 = *(_QWORD *)(a1 + 32);
  v11 = *(_QWORD *)(a1 + 40);
  v15 = v10;
  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(WeakRetained, "_hostApplicationBundleIdentifier"));
  v16 = 138544130;
  v17 = v10;
  v18 = 2114;
  v19 = v12;
  v20 = 2112;
  v21 = v11;
  v22 = 2112;
  v23 = v13;
  v14 = (void *)_os_log_send_and_compose_impl(v8, 0, 0, 0, &_mh_execute_header, v9, 2, "[%{public}@][%{public}@]: Loading request: %@ for client: %@", &v16, 42);

  if (v14)
  {
    v9 = objc_claimAutoreleasedReturnValue(+[NSString stringWithCString:encoding:](NSString, "stringWithCString:encoding:", v14, 4));
    free(v14);
    SSFileLog(v6, CFSTR("%@"));
LABEL_10:

  }
  objc_msgSend(v4, "loadProductWithRequest:", *(_QWORD *)(a1 + 40));

}

id sub_10001B834(uint64_t a1, void *a2)
{
  return _objc_msgSend(a2, "setAdditionalBuyParameters:", *(_QWORD *)(a1 + 32));
}

id sub_10001BA28(uint64_t a1, void *a2)
{
  return _objc_msgSend(a2, "setAffiliateIdentifier:", *(_QWORD *)(a1 + 32));
}

void sub_10001BC34(uint64_t a1, void *a2)
{
  void *v2;
  id v3;

  v2 = *(void **)(a1 + 32);
  v3 = a2;
  objc_msgSend(v3, "setAskToBuy:", objc_msgSend(v2, "BOOLValue"));

}

id sub_10001BE60(uint64_t a1, void *a2)
{
  return _objc_msgSend(a2, "setCancelButtonTitle:", *(_QWORD *)(a1 + 32));
}

id sub_10001C054(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "setClientIdentifier:", *(_QWORD *)(a1 + 32));
}

id sub_10001C408(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "setProductPageStyle:", *(_QWORD *)(a1 + 32));
}

id sub_10001C5FC(uint64_t a1, void *a2)
{
  return _objc_msgSend(a2, "setPromptString:", *(_QWORD *)(a1 + 32));
}

id sub_10001C7F0(uint64_t a1, void *a2)
{
  return _objc_msgSend(a2, "setRightBarButtonTitle:", *(_QWORD *)(a1 + 32));
}

id sub_10001C9E4(uint64_t a1, void *a2)
{
  return _objc_msgSend(a2, "setScriptContextDictionary:", *(_QWORD *)(a1 + 32));
}

id sub_10001CBE4(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "setPreview:", *(_QWORD *)(a1 + 32));
}

id sub_10001CF78(uint64_t a1, void *a2)
{
  return _objc_msgSend(a2, "setUsageContext:", *(_QWORD *)(a1 + 32));
}

void sub_10001D16C(uint64_t a1, void *a2)
{
  void *v2;
  id v3;

  v2 = *(void **)(a1 + 32);
  v3 = a2;
  objc_msgSend(v3, "setShowsRightBarButton:", objc_msgSend(v2, "BOOLValue"));

}

void sub_10001D398(uint64_t a1, void *a2)
{
  void *v2;
  id v3;

  v2 = *(void **)(a1 + 32);
  v3 = a2;
  objc_msgSend(v3, "setShowsStoreButton:", objc_msgSend(v2, "BOOLValue"));

}

id sub_10001D478(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "setVisibleInClientWindow:", *(_QWORD *)(a1 + 32));
}

void sub_10001D668(_Unwind_Exception *a1)
{
  id *v1;
  id *v2;
  uint64_t v3;

  objc_destroyWeak(v2);
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v3 - 88));
  _Unwind_Resume(a1);
}

void sub_10001D694(id *a1, void *a2)
{
  id v3;
  id v4;
  _QWORD v5[4];
  id v6;
  id v7;
  id v8;
  id v9;
  id v10;
  id v11;

  v3 = a2;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_10001D788;
  v5[3] = &unk_100049B18;
  objc_copyWeak(&v11, a1 + 8);
  v6 = v3;
  v7 = a1[4];
  v10 = a1[7];
  v8 = a1[5];
  v9 = a1[6];
  v4 = v3;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, v5);

  objc_destroyWeak(&v11);
}

void sub_10001D788(uint64_t a1)
{
  id *v2;
  id WeakRetained;
  uint64_t v4;
  uint64_t v5;
  _QWORD v6[4];
  id v7;
  id v8;
  id v9;
  id v10;

  v2 = (id *)(a1 + 72);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 72));
  v4 = *(_QWORD *)(a1 + 32);
  v5 = *(_QWORD *)(a1 + 40);
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_10001D880;
  v6[3] = &unk_100049AF0;
  objc_copyWeak(&v10, v2);
  v9 = *(id *)(a1 + 64);
  v7 = *(id *)(a1 + 48);
  v8 = *(id *)(a1 + 56);
  objc_msgSend(WeakRetained, "_requestRemoteViewControllerForItem:withParameters:completion:", v4, v5, v6);

  objc_destroyWeak(&v10);
}

void sub_10001D86C(_Unwind_Exception *a1)
{
  id *v1;

  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

void sub_10001D880(uint64_t a1, uint64_t a2)
{
  id WeakRetained;
  void *v5;
  unsigned int v6;
  uint64_t v7;
  NSObject *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  id v12;
  void *v13;
  void *v14;
  int v15;
  void *v16;
  __int16 v17;
  uint64_t v18;
  __int16 v19;
  uint64_t v20;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  if (a2 == 1)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[SSLogConfig sharedConfig](SSLogConfig, "sharedConfig"));
    v6 = objc_msgSend(v5, "shouldLog");
    if (objc_msgSend(v5, "shouldLogToDisk"))
      LODWORD(v7) = v6 | 2;
    else
      LODWORD(v7) = v6;
    v8 = objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "OSLogObject"));
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      v7 = v7;
    else
      v7 &= 2u;
    if ((_DWORD)v7)
    {
      v9 = (void *)objc_opt_class(WeakRetained);
      v10 = *(_QWORD *)(a1 + 32);
      v11 = *(_QWORD *)(a1 + 40);
      v15 = 138543874;
      v16 = v9;
      v17 = 2114;
      v18 = v10;
      v19 = 2114;
      v20 = v11;
      v12 = v9;
      v13 = (void *)_os_log_send_and_compose_impl(v7, 0, 0, 0, &_mh_execute_header, v8, 16, "[%{public}@][%{public}@]: Unable to retrieve remote view controller for item %{public}@", &v15, 32);

      if (!v13)
      {
LABEL_13:

        v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", SKErrorDomain, 0, 0));
        (*(void (**)(_QWORD))(*(_QWORD *)(a1 + 48) + 16))(*(_QWORD *)(a1 + 48));

        goto LABEL_14;
      }
      v8 = objc_claimAutoreleasedReturnValue(+[NSString stringWithCString:encoding:](NSString, "stringWithCString:encoding:", v13, 4));
      free(v13);
      SSFileLog(v5, CFSTR("%@"));
    }

    goto LABEL_13;
  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
LABEL_14:

}

void sub_10001DA84(uint64_t a1, void *a2)
{
  id v3;
  id WeakRetained;
  void *v5;
  id v6;
  void *v7;
  unsigned int v8;
  uint64_t v9;
  NSObject *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  id v14;
  void *v15;
  unsigned int v16;
  uint64_t v17;
  NSObject *v18;
  void *v19;
  uint64_t v20;
  id v21;
  void *v22;
  int v23;
  void *v24;
  __int16 v25;
  uint64_t v26;
  __int16 v27;
  id v28;

  v3 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "domain"));
  if (!objc_msgSend(v5, "isEqualToString:", SKErrorDomain))
  {

LABEL_15:
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[SSLogConfig sharedConfig](SSLogConfig, "sharedConfig"));
    v16 = objc_msgSend(v7, "shouldLog");
    if (objc_msgSend(v7, "shouldLogToDisk"))
      LODWORD(v17) = v16 | 2;
    else
      LODWORD(v17) = v16;
    v18 = objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "OSLogObject"));
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
      v17 = v17;
    else
      v17 &= 2u;
    if ((_DWORD)v17)
    {
      v19 = (void *)objc_opt_class(WeakRetained);
      v20 = *(_QWORD *)(a1 + 32);
      v23 = 138543874;
      v24 = v19;
      v25 = 2114;
      v26 = v20;
      v27 = 2114;
      v28 = v3;
      v21 = v19;
      v22 = (void *)_os_log_send_and_compose_impl(v17, 0, 0, 0, &_mh_execute_header, v18, 16, "[%{public}@][%{public}@]: Failed to lookup product. Error: %{public}@", &v23, 32);

      if (!v22)
        goto LABEL_25;
      v18 = objc_claimAutoreleasedReturnValue(+[NSString stringWithCString:encoding:](NSString, "stringWithCString:encoding:", v22, 4));
      free(v22);
      SSFileLog(v7, CFSTR("%@"));
    }

    goto LABEL_25;
  }
  v6 = objc_msgSend(v3, "code");

  if (v6 != (id)5)
    goto LABEL_15;
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[SSLogConfig sharedConfig](SSLogConfig, "sharedConfig"));
  v8 = objc_msgSend(v7, "shouldLog");
  if (objc_msgSend(v7, "shouldLogToDisk"))
    LODWORD(v9) = v8 | 2;
  else
    LODWORD(v9) = v8;
  v10 = objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "OSLogObject"));
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    v9 = v9;
  else
    v9 &= 2u;
  if (!(_DWORD)v9)
    goto LABEL_12;
  v11 = (void *)objc_opt_class(WeakRetained);
  v12 = *(_QWORD *)(a1 + 32);
  v13 = *(void **)(a1 + 40);
  v23 = 138543874;
  v24 = v11;
  v25 = 2114;
  v26 = v12;
  v27 = 2114;
  v28 = v13;
  v14 = v11;
  v15 = (void *)_os_log_send_and_compose_impl(v9, 0, 0, 0, &_mh_execute_header, v10, 0, "[%{public}@][%{public}@]: Product lookup for %{public}@ not found.", &v23, 32);

  if (v15)
  {
    v10 = objc_claimAutoreleasedReturnValue(+[NSString stringWithCString:encoding:](NSString, "stringWithCString:encoding:", v15, 4));
    free(v15);
    SSFileLog(v7, CFSTR("%@"));
LABEL_12:

  }
LABEL_25:

  (*(void (**)(_QWORD))(*(_QWORD *)(a1 + 48) + 16))(*(_QWORD *)(a1 + 48));
}

void sub_10001E124(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,id location)
{
  id *v21;

  objc_destroyWeak(v21);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_10001E148(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id WeakRetained;
  void *v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  void *v12;
  unsigned int v13;
  uint64_t v14;
  NSObject *v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  id v19;
  void *v20;
  void *v21;
  unsigned int v22;
  uint64_t v23;
  NSObject *v24;
  void *v25;
  uint64_t v26;
  uint64_t v27;
  id v28;
  void *v29;
  int v30;
  void *v31;
  __int16 v32;
  uint64_t v33;
  __int16 v34;
  uint64_t v35;
  __int16 v36;
  id v37;

  v5 = a3;
  v6 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 64));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "allItems"));

  if (objc_msgSend(v8, "count"))
  {
    v9 = objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "firstObject"));
    v10 = (void *)v9;
    if (!v5)
    {
      if (v9)
      {
        v11 = *(_QWORD *)(a1 + 56);
LABEL_29:
        (*(void (**)(uint64_t))(v11 + 16))(v11);
        goto LABEL_30;
      }
LABEL_18:
      v21 = (void *)objc_claimAutoreleasedReturnValue(+[SSLogConfig sharedConfig](SSLogConfig, "sharedConfig"));
      v22 = objc_msgSend(v21, "shouldLog");
      if (objc_msgSend(v21, "shouldLogToDisk"))
        LODWORD(v23) = v22 | 2;
      else
        LODWORD(v23) = v22;
      v24 = objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "OSLogObject"));
      if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
        v23 = v23;
      else
        v23 &= 2u;
      if ((_DWORD)v23)
      {
        v25 = (void *)objc_opt_class(WeakRetained);
        v26 = *(_QWORD *)(a1 + 32);
        v27 = *(_QWORD *)(a1 + 40);
        v30 = 138543874;
        v31 = v25;
        v32 = 2114;
        v33 = v26;
        v34 = 2114;
        v35 = v27;
        v28 = v25;
        v29 = (void *)_os_log_send_and_compose_impl(v23, 0, 0, 0, &_mh_execute_header, v24, 16, "[%{public}@][%{public}@]: Lookup for %{public}@ completed without an item.", &v30, 32);

        if (!v29)
        {
LABEL_28:

          v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", SKErrorDomain, 5, 0));
          v11 = *(_QWORD *)(a1 + 48);
          goto LABEL_29;
        }
        v24 = objc_claimAutoreleasedReturnValue(+[NSString stringWithCString:encoding:](NSString, "stringWithCString:encoding:", v29, 4));
        free(v29);
        SSFileLog(v21, CFSTR("%@"));
      }

      goto LABEL_28;
    }
  }
  else
  {
    if (!v5)
      goto LABEL_18;
    v10 = 0;
  }
  v12 = (void *)objc_claimAutoreleasedReturnValue(+[SSLogConfig sharedConfig](SSLogConfig, "sharedConfig"));
  v13 = objc_msgSend(v12, "shouldLog");
  if (objc_msgSend(v12, "shouldLogToDisk"))
    LODWORD(v14) = v13 | 2;
  else
    LODWORD(v14) = v13;
  v15 = objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "OSLogObject"));
  if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    v14 = v14;
  else
    v14 &= 2u;
  if (!(_DWORD)v14)
    goto LABEL_16;
  v16 = (void *)objc_opt_class(WeakRetained);
  v17 = *(_QWORD *)(a1 + 32);
  v18 = *(_QWORD *)(a1 + 40);
  v30 = 138544130;
  v31 = v16;
  v32 = 2114;
  v33 = v17;
  v34 = 2114;
  v35 = v18;
  v36 = 2114;
  v37 = v5;
  v19 = v16;
  v20 = (void *)_os_log_send_and_compose_impl(v14, 0, 0, 0, &_mh_execute_header, v15, 16, "[%{public}@][%{public}@]: Lookup for %{public}@ completed with error: %{public}@", &v30, 42);

  if (v20)
  {
    v15 = objc_claimAutoreleasedReturnValue(+[NSString stringWithCString:encoding:](NSString, "stringWithCString:encoding:", v20, 4));
    free(v20);
    SSFileLog(v12, CFSTR("%@"));
LABEL_16:

  }
  (*(void (**)(_QWORD))(*(_QWORD *)(a1 + 48) + 16))(*(_QWORD *)(a1 + 48));
LABEL_30:

}

void sub_10001E6E4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, id location)
{
  id *v19;

  objc_destroyWeak(v19);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

BOOL sub_10001E710(id a1, BOOL a2)
{
  return 0;
}

void sub_10001E718(id *a1, void *a2)
{
  id v3;
  id v4;
  _QWORD v5[4];
  id v6;
  id v7;
  id v8;
  id v9;
  id v10;
  id v11;

  v3 = a2;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_10001E80C;
  v5[3] = &unk_100049C48;
  objc_copyWeak(&v11, a1 + 8);
  v10 = a1[7];
  v6 = v3;
  v7 = a1[4];
  v8 = a1[5];
  v9 = a1[6];
  v4 = v3;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, v5);

  objc_destroyWeak(&v11);
}

void sub_10001E80C(uint64_t a1)
{
  id *v2;
  _QWORD *WeakRetained;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  void *v8;
  uint64_t v9;
  unsigned int v10;
  NSObject *v11;
  NSObject *v12;
  void *v13;
  uint64_t v14;
  id v15;
  void *v16;
  _QWORD v17[4];
  id v18;
  id v19;
  id v20;
  id v21;
  uint64_t *v22;
  id v23;
  _QWORD v24[4];
  id v25;
  uint64_t *v26;
  uint64_t v27;
  uint64_t *v28;
  uint64_t v29;
  uint64_t (*v30)(uint64_t, uint64_t);
  void (*v31)(uint64_t);
  id v32;
  int v33;
  void *v34;
  __int16 v35;
  uint64_t v36;

  v2 = (id *)(a1 + 72);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 72));
  if (WeakRetained)
  {
    v27 = 0;
    v28 = &v27;
    v29 = 0x3032000000;
    v30 = sub_10001EB88;
    v31 = sub_10001EB98;
    v32 = 0;
    v24[0] = _NSConcreteStackBlock;
    v24[1] = 3221225472;
    v24[2] = sub_10001EBA0;
    v24[3] = &unk_100049BF8;
    v4 = *(void **)(a1 + 32);
    v25 = *(id *)(a1 + 40);
    v26 = &v27;
    objc_msgSend(v4, "enumerateObjectsUsingBlock:", v24);
    objc_msgSend(WeakRetained, "_makeItemKindEventForItem:extension:", *(_QWORD *)(a1 + 40), v28[5]);
    v5 = v28[5];
    if (v5)
    {
      v17[0] = _NSConcreteStackBlock;
      v17[1] = 3221225472;
      v17[2] = sub_10001EEF0;
      v17[3] = &unk_100049C20;
      objc_copyWeak(&v23, v2);
      v22 = &v27;
      v18 = *(id *)(a1 + 48);
      v21 = *(id *)(a1 + 64);
      v19 = *(id *)(a1 + 40);
      v20 = *(id *)(a1 + 56);
      v6 = objc_claimAutoreleasedReturnValue(+[ServiceResilientRemoteViewContainerViewController instantiateWithExtension:completion:](ServiceResilientRemoteViewContainerViewController, "instantiateWithExtension:completion:", v5, v17));
      v7 = (void *)WeakRetained[9];
      WeakRetained[9] = v6;

      objc_destroyWeak(&v23);
LABEL_15:

      _Block_object_dispose(&v27, 8);
      goto LABEL_16;
    }
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[SSLogConfig sharedConfig](SSLogConfig, "sharedConfig"));
    LODWORD(v9) = objc_msgSend(v8, "shouldLog");
    v10 = objc_msgSend(v8, "shouldLogToDisk");
    v11 = objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "OSLogObject"));
    v12 = v11;
    if (v10)
      LODWORD(v9) = v9 | 2;
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      v9 = v9;
    else
      v9 &= 2u;
    if ((_DWORD)v9)
    {
      v13 = (void *)objc_opt_class(WeakRetained);
      v14 = *(_QWORD *)(a1 + 48);
      v33 = 138543618;
      v34 = v13;
      v35 = 2114;
      v36 = v14;
      v15 = v13;
      v16 = (void *)_os_log_send_and_compose_impl(v9, 0, 0, 0, &_mh_execute_header, v12, 0, "[%{public}@][%{public}@]: No extension found to handle product.", &v33, 22);

      if (!v16)
      {
LABEL_14:

        (*(void (**)(_QWORD))(*(_QWORD *)(a1 + 64) + 16))(*(_QWORD *)(a1 + 64));
        goto LABEL_15;
      }
      v12 = objc_claimAutoreleasedReturnValue(+[NSString stringWithCString:encoding:](NSString, "stringWithCString:encoding:", v16, 4));
      free(v16);
      SSFileLog(v8, CFSTR("%@"));
    }

    goto LABEL_14;
  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 64) + 16))();
LABEL_16:

}

void sub_10001EB44(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,char a27)
{
  _Block_object_dispose(&a27, 8);
  _Unwind_Resume(a1);
}

uint64_t sub_10001EB88(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void sub_10001EB98(uint64_t a1)
{

}

void sub_10001EBA0(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  id v7;
  void *v8;
  void *v9;
  uint64_t v10;
  id v11;
  uint64_t v12;
  void *v13;
  void *v14;
  unsigned int v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  unsigned int v20;
  uint64_t v21;
  void *v22;
  void *v23;
  uint64_t v24;
  id v25;
  uint64_t v26;
  id v27;
  id v28;
  id v29;
  uint64_t v30;
  void *i;
  void *v32;
  void *v33;
  id v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  _BYTE v39[128];
  void *v40;
  void *v41;

  v7 = a2;
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "infoDictionary"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "objectForKey:", CFSTR("SKProductPageExtensionSupportedItemKinds")));

  v10 = objc_opt_class(NSString);
  if ((objc_opt_isKindOfClass(v9, v10) & 1) != 0)
  {
    v41 = v9;
    v11 = (id)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v41, 1));
LABEL_5:
    v13 = v11;
    goto LABEL_7;
  }
  v12 = objc_opt_class(NSArray);
  if ((objc_opt_isKindOfClass(v9, v12) & 1) != 0)
  {
    v11 = v9;
    goto LABEL_5;
  }
  v13 = 0;
LABEL_7:
  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "itemKind"));
  v15 = objc_msgSend(v13, "containsObject:", v14);

  if (v15)
  {
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), a2);
    *a4 = 1;
  }
  v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "itemDictionary"));
  v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "objectForKeyedSubscript:", CFSTR("offerName")));

  v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "itemKind"));
  if (objc_msgSend(v18, "isEqualToString:", CFSTR("appSubscriptionBundle")))
  {

  }
  else
  {
    v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "itemKind"));
    v20 = objc_msgSend(v19, "isEqualToString:", CFSTR("softwareAddOn"));

    if (!v20)
      goto LABEL_28;
  }
  v21 = objc_opt_class(NSString);
  if ((objc_opt_isKindOfClass(v17, v21) & 1) != 0)
  {
    v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "infoDictionary"));
    v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "objectForKey:", CFSTR("SKProductPageExtensionSupportedOfferPrefixes")));

    v24 = objc_opt_class(NSString);
    v33 = v13;
    v34 = v7;
    v32 = v23;
    if ((objc_opt_isKindOfClass(v23, v24) & 1) != 0)
    {
      v40 = v23;
      v25 = (id)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v40, 1));
    }
    else
    {
      v26 = objc_opt_class(NSArray);
      if ((objc_opt_isKindOfClass(v23, v26) & 1) != 0)
        v25 = v23;
      else
        v25 = 0;
    }
    v37 = 0u;
    v38 = 0u;
    v35 = 0u;
    v36 = 0u;
    v27 = v25;
    v28 = objc_msgSend(v27, "countByEnumeratingWithState:objects:count:", &v35, v39, 16);
    if (v28)
    {
      v29 = v28;
      v30 = *(_QWORD *)v36;
      do
      {
        for (i = 0; i != v29; i = (char *)i + 1)
        {
          if (*(_QWORD *)v36 != v30)
            objc_enumerationMutation(v27);
          if (objc_msgSend(v17, "hasPrefix:", *(_QWORD *)(*((_QWORD *)&v35 + 1) + 8 * (_QWORD)i)))
          {
            objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), a2);
            *a4 = 1;
          }
        }
        v29 = objc_msgSend(v27, "countByEnumeratingWithState:objects:count:", &v35, v39, 16);
      }
      while (v29);
    }

    v13 = v33;
    v7 = v34;
  }
LABEL_28:

}

void sub_10001EEF0(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7;
  id v8;
  id *v9;
  id v10;
  id WeakRetained;
  dispatch_time_t v12;
  void *v13;
  unsigned int v14;
  uint64_t v15;
  NSObject *v16;
  void *v17;
  uint64_t v18;
  id v19;
  void *v20;
  _QWORD block[4];
  id v22;
  id v23;
  int v24;
  void *v25;
  __int16 v26;
  uint64_t v27;
  __int16 v28;
  id v29;

  v7 = a3;
  v8 = a4;
  v9 = (id *)(a1 + 72);
  v10 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 72));
  objc_msgSend(WeakRetained, "setExtension:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40));
  objc_msgSend(WeakRetained, "setExtensionRequest:", v10);

  if (!v7 || v8)
  {
    v13 = (void *)objc_claimAutoreleasedReturnValue(+[SSLogConfig sharedConfig](SSLogConfig, "sharedConfig"));
    v14 = objc_msgSend(v13, "shouldLog");
    if (objc_msgSend(v13, "shouldLogToDisk"))
      LODWORD(v15) = v14 | 2;
    else
      LODWORD(v15) = v14;
    v16 = objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "OSLogObject"));
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
      v15 = v15;
    else
      v15 &= 2u;
    if ((_DWORD)v15)
    {
      v17 = (void *)objc_opt_class(WeakRetained);
      v18 = *(_QWORD *)(a1 + 32);
      v24 = 138543874;
      v25 = v17;
      v26 = 2114;
      v27 = v18;
      v28 = 2114;
      v29 = v8;
      v19 = v17;
      v20 = (void *)_os_log_send_and_compose_impl(v15, 0, 0, 0, &_mh_execute_header, v16, 16, "[%{public}@][%{public}@]: Failed to retrieve remote view controller with error %{public}@.", &v24, 32);

      if (!v20)
      {
LABEL_15:

        objc_msgSend(WeakRetained, "_cleanUpExtension");
        (*(void (**)(_QWORD))(*(_QWORD *)(a1 + 56) + 16))(*(_QWORD *)(a1 + 56));
        goto LABEL_16;
      }
      v16 = objc_claimAutoreleasedReturnValue(+[NSString stringWithCString:encoding:](NSString, "stringWithCString:encoding:", v20, 4));
      free(v20);
      SSFileLog(v13, CFSTR("%@"));
    }

    goto LABEL_15;
  }
  objc_msgSend(WeakRetained, "_didReceiveRemoteViewController:forItem:withParameters:", v7, *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
  if (*(_QWORD *)(a1 + 56))
  {
    objc_msgSend(WeakRetained, "setRemoteLoadDidFinishCompletion:");
    v12 = dispatch_time(0, 10000000000);
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_10001F198;
    block[3] = &unk_100049730;
    objc_copyWeak(&v23, v9);
    v22 = v7;
    dispatch_after(v12, (dispatch_queue_t)&_dispatch_main_q, block);

    objc_destroyWeak(&v23);
  }
LABEL_16:

}

void sub_10001F198(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "productPageRemoteViewControllerLoadDidFinish:", *(_QWORD *)(a1 + 32));

}

void sub_10001F740(uint64_t a1)
{
  unsigned int v2;
  void *v3;
  id v4;

  v2 = objc_msgSend(*(id *)(a1 + 32), "_isClientEntitled");
  v4 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "_clientViewControllerProxy"));
  if (v2)
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", *(_QWORD *)(a1 + 40)));
    objc_msgSend(v4, "didFinishWithResult:", v3);

  }
  else
  {
    objc_msgSend(v4, "didFinish");
  }

}

void sub_10002027C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, id location)
{
  id *v20;

  objc_destroyWeak(v20);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1000202A0(uint64_t a1, uint64_t a2)
{
  id *v4;
  id WeakRetained;
  void *v6;
  unsigned int v7;
  unsigned int v8;
  NSObject *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  unint64_t v15;
  void *v16;
  unsigned int v17;
  unsigned int v18;
  NSObject *v19;
  NSObject *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  void *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  void *v29;
  _QWORD block[4];
  id v31;
  id v32;
  id v33;
  id v34;
  int v35;
  id v36;
  __int16 v37;
  uint64_t v38;
  __int16 v39;
  uint64_t v40;
  __int16 v41;
  uint64_t v42;

  v4 = (id *)(a1 + 72);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 72));
  if (a2 != 1)
  {
    v15 = a2 & 0xFFFFFFFFFFFFFFFELL;
    v16 = (void *)objc_claimAutoreleasedReturnValue(+[SSLogConfig sharedConfig](SSLogConfig, "sharedConfig"));
    v17 = objc_msgSend(v16, "shouldLog");
    if (objc_msgSend(v16, "shouldLogToDisk"))
      v18 = v17 | 2;
    else
      v18 = v17;
    v19 = objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "OSLogObject"));
    v20 = v19;
    if (v15 == 2)
    {
      if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
        v21 = v18;
      else
        v21 = v18 & 2;
      if ((_DWORD)v21)
      {
        v22 = *(_QWORD *)(a1 + 32);
        v23 = *(_QWORD *)(a1 + 40);
        v24 = *(_QWORD *)(a1 + 48);
        v35 = 138544130;
        v36 = WeakRetained;
        v37 = 2114;
        v38 = v22;
        v39 = 2114;
        v40 = v23;
        v41 = 2114;
        v42 = v24;
        v25 = (void *)_os_log_send_and_compose_impl(v21, 0, 0, 0, &_mh_execute_header, v20, 16, "[%{public}@][%{public}@/%{public}@]: Showing legacy controller for %{public}@.", &v35, 42);

        if (!v25)
        {
LABEL_24:

          block[0] = _NSConcreteStackBlock;
          block[1] = 3221225472;
          block[2] = sub_1000206C8;
          block[3] = &unk_100049CC0;
          objc_copyWeak(&v34, v4);
          v31 = *(id *)(a1 + 48);
          v32 = *(id *)(a1 + 56);
          v33 = *(id *)(a1 + 64);
          dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);

          objc_destroyWeak(&v34);
          goto LABEL_33;
        }
        v20 = objc_claimAutoreleasedReturnValue(+[NSString stringWithCString:encoding:](NSString, "stringWithCString:encoding:", v25, 4));
        free(v25);
        SSFileLog(v16, CFSTR("%@"));
      }

      goto LABEL_24;
    }
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
      v26 = v18;
    else
      v26 = v18 & 2;
    if ((_DWORD)v26)
    {
      v27 = *(_QWORD *)(a1 + 32);
      v28 = *(_QWORD *)(a1 + 40);
      v35 = 138543874;
      v36 = WeakRetained;
      v37 = 2114;
      v38 = v27;
      v39 = 2114;
      v40 = v28;
      v29 = (void *)_os_log_send_and_compose_impl(v26, 0, 0, 0, &_mh_execute_header, v20, 0, "[%{public}@][%{public}@/%{public}@]: Showing product page.", &v35, 32);

      if (!v29)
      {
LABEL_32:

        (*(void (**)(_QWORD))(*(_QWORD *)(a1 + 64) + 16))(*(_QWORD *)(a1 + 64));
        goto LABEL_33;
      }
      v20 = objc_claimAutoreleasedReturnValue(+[NSString stringWithCString:encoding:](NSString, "stringWithCString:encoding:", v29, 4));
      free(v29);
      SSFileLog(v16, CFSTR("%@"));
    }

    goto LABEL_32;
  }
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[SSLogConfig sharedConfig](SSLogConfig, "sharedConfig"));
  v7 = objc_msgSend(v6, "shouldLog");
  if (objc_msgSend(v6, "shouldLogToDisk"))
    v8 = v7 | 2;
  else
    v8 = v7;
  v9 = objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "OSLogObject"));
  if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    v10 = v8;
  else
    v10 = v8 & 2;
  if (!(_DWORD)v10)
    goto LABEL_11;
  v11 = *(_QWORD *)(a1 + 32);
  v12 = *(_QWORD *)(a1 + 40);
  v13 = *(_QWORD *)(a1 + 48);
  v35 = 138544130;
  v36 = WeakRetained;
  v37 = 2114;
  v38 = v11;
  v39 = 2114;
  v40 = v12;
  v41 = 2114;
  v42 = v13;
  v14 = (void *)_os_log_send_and_compose_impl(v10, 0, 0, 0, &_mh_execute_header, v9, 16, "[%{public}@][%{public}@/%{public}@]: Failed to get remote controller for %{public}@.", &v35, 42);

  if (v14)
  {
    v9 = objc_claimAutoreleasedReturnValue(+[NSString stringWithCString:encoding:](NSString, "stringWithCString:encoding:", v14, 4));
    free(v14);
    SSFileLog(v6, CFSTR("%@"));
LABEL_11:

  }
  objc_msgSend(WeakRetained, "showErrorPageWithCompletion:", *(_QWORD *)(a1 + 64));
LABEL_33:

}

void sub_1000206C8(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  objc_msgSend(WeakRetained, "_showLegacyControllerForProductID:parameters:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));
  (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();

}

uint64_t sub_10002078C(uint64_t a1)
{
  id v2;

  v2 = objc_msgSend(*(id *)(a1 + 32), "_setupErrorViewController");
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

void sub_100020B00(uint64_t a1)
{
  uint64_t v1;
  void *v2;

  v1 = objc_opt_new(*(_QWORD *)(a1 + 32));
  v2 = (void *)qword_100063330;
  qword_100063330 = v1;

}

void sub_100020BF8(uint64_t a1)
{
  uint64_t v1;
  void *v2;

  v1 = *(_QWORD *)(a1 + 32);
  v2 = *(void **)(v1 + 8);
  *(_QWORD *)(v1 + 8) = 0;

}

void sub_100020EBC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  id *v14;

  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_100020EF0(uint64_t a1)
{
  void *v1;
  _QWORD *WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v1 = (void *)WeakRetained[4];
  WeakRetained[4] = 0;

}

uint64_t sub_100020F28(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(result + 32) + 8) + 24) = a2;
  return result;
}

void sub_100021034(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t sub_10002104C(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void sub_10002105C(uint64_t a1)
{

}

void sub_100021064(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  char v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;

  objc_msgSend(*(id *)(a1 + 32), "_fetchBag");
  v2 = objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "objectForKeyedSubscript:", *(_QWORD *)(a1 + 40)));
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

  switch(*(_QWORD *)(a1 + 56))
  {
    case 0:
      v5 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40);
      v6 = NSArray;
      goto LABEL_11;
    case 1:
    case 2:
    case 3:
      v5 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40);
      v6 = NSNumber;
      goto LABEL_11;
    case 4:
      v7 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40);
      v8 = objc_opt_class(NSString);
      if ((objc_opt_isKindOfClass(v7, v8) & 1) != 0)
        goto LABEL_14;
      v9 = objc_opt_respondsToSelector(*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), "stringValue");
      v10 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
      v11 = *(void **)(v10 + 40);
      if ((v9 & 1) != 0)
      {
        v12 = objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "stringValue"));
LABEL_9:
        v15 = v12;
        v16 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
        v11 = *(void **)(v16 + 40);
        *(_QWORD *)(v16 + 40) = v15;
      }
      else
      {
        *(_QWORD *)(v10 + 40) = 0;
      }
      break;
    case 5:
      v13 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40);
      v14 = objc_opt_class(NSString);
      if ((objc_opt_isKindOfClass(v13, v14) & 1) == 0)
        goto LABEL_12;
      v12 = objc_claimAutoreleasedReturnValue(+[NSURL URLWithString:](NSURL, "URLWithString:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40)));
      goto LABEL_9;
    case 6:
      v5 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40);
      v6 = NSDictionary;
LABEL_11:
      v17 = objc_opt_class(v6);
      if ((objc_opt_isKindOfClass(v5, v17) & 1) != 0)
        goto LABEL_14;
LABEL_12:
      v18 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
      v11 = *(void **)(v18 + 40);
      *(_QWORD *)(v18 + 40) = 0;
      break;
    default:
      goto LABEL_14;
  }

LABEL_14:
  if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40)
    && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEBUG))
  {
    sub_100029C98((uint64_t *)(a1 + 40), (uint64_t *)(a1 + 56));
  }
}

void sub_1000213FC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
  id *v16;

  objc_destroyWeak(v16);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_100021424(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  id v6;
  id v7;
  id *WeakRetained;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  id v17;
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
  uint64_t v32;
  id v33;

  v6 = a2;
  v7 = a4;
  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    if (v7 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
    {
      sub_100029E40((uint64_t)v7, v9, v10, v11, v12, v13, v14, v15);
      if (!v6)
        goto LABEL_13;
    }
    else if (!v6)
    {
      goto LABEL_13;
    }
    v33 = 0;
    v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSJSONSerialization JSONObjectWithData:options:error:](NSJSONSerialization, "JSONObjectWithData:options:error:", v6, 0, &v33));
    v17 = v33;
    if (v17 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
      sub_100029DD4((uint64_t)v17, v18, v19, v20, v21, v22, v23, v24);
    v25 = objc_opt_class(NSDictionary);
    if ((objc_opt_isKindOfClass(v16, v25) & 1) != 0)
    {
      objc_storeStrong(WeakRetained + 1, v16);
    }
    else if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
    {
      sub_100029D68((uint64_t)v16, v26, v27, v28, v29, v30, v31, v32);
    }

  }
LABEL_13:
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));

}

void sub_1000215E4(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 0xCu);
}

void sub_1000219B8(id a1)
{
  ServiceBridgedNavigationController *v1;
  void *v2;

  v1 = objc_alloc_init(ServiceBridgedNavigationController);
  v2 = (void *)qword_100063340;
  qword_100063340 = (uint64_t)v1;

}

void sub_100022264(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  _Block_object_dispose(&a9, 8);
  _Unwind_Resume(a1);
}

void sub_100022300(uint64_t a1, void *a2)
{
  id v3;
  void *v4;

  v3 = a2;
  if (qword_1000633A8 != -1)
    dispatch_once(&qword_1000633A8, &stru_100049E40);
  v4 = (void *)qword_100063360;
  if (os_log_type_enabled((os_log_t)qword_100063360, OS_LOG_TYPE_ERROR))
    sub_100029EAC(a1, v4, (uint64_t)v3);

}

Class sub_100022384(uint64_t a1)
{
  char *v2;
  Class result;
  char *v4;
  __int128 v5;
  uint64_t v6;

  v4 = 0;
  if (!qword_100063358)
  {
    v5 = off_100049E28;
    v6 = 0;
    qword_100063358 = _sl_dlopen(&v5, &v4);
    v2 = v4;
    if (!qword_100063358)
    {
      abort_report_np("%s", v4);
      goto LABEL_7;
    }
    if (v4)
      goto LABEL_8;
  }
  while (1)
  {
    result = objc_getClass("SubscriptionOfferCodeViewController");
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
    if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
      break;
LABEL_7:
    v2 = (char *)sub_100029F68();
LABEL_8:
    free(v2);
  }
  qword_100063350 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  return result;
}

void sub_100022478(id a1)
{
  os_log_t v1;
  void *v2;
  os_log_t v3;
  void *v4;
  os_log_t v5;
  void *v6;
  os_log_t v7;
  void *v8;
  os_log_t v9;
  void *v10;
  os_log_t v11;
  void *v12;
  os_log_t v13;
  void *v14;
  os_log_t v15;
  void *v16;
  os_log_t v17;
  void *v18;
  os_log_t v19;
  void *v20;

  v1 = os_log_create("com.apple.storekit", "Download");
  v2 = off_100062B68;
  off_100062B68 = v1;

  v3 = os_log_create("com.apple.storekit", "General");
  v4 = (void *)qword_100063360;
  qword_100063360 = (uint64_t)v3;

  v5 = os_log_create("com.apple.storekit", "Messages");
  v6 = (void *)qword_100063368;
  qword_100063368 = (uint64_t)v5;

  v7 = os_log_create("com.apple.storekit", "Products");
  v8 = (void *)qword_100063370;
  qword_100063370 = (uint64_t)v7;

  v9 = os_log_create("com.apple.storekit", "Purchase");
  v10 = (void *)qword_100063378;
  qword_100063378 = (uint64_t)v9;

  v11 = os_log_create("com.apple.storekit", "Push");
  v12 = (void *)qword_100063380;
  qword_100063380 = (uint64_t)v11;

  v13 = os_log_create("com.apple.storekit", "Receipts");
  v14 = (void *)qword_100063388;
  qword_100063388 = (uint64_t)v13;

  v15 = os_log_create("com.apple.storekit", "SQL");
  v16 = (void *)qword_100063390;
  qword_100063390 = (uint64_t)v15;

  v17 = os_log_create("com.apple.storekit", "XcodeTest");
  v18 = (void *)qword_100063398;
  qword_100063398 = (uint64_t)v17;

  v19 = os_log_create("com.apple.storekit", "ProductPage");
  v20 = (void *)qword_1000633A0;
  qword_1000633A0 = (uint64_t)v19;

}

void sub_100022A38(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  unsigned int v5;
  uint64_t v6;
  NSObject *v7;
  void *v8;
  id v9;
  void *v10;
  int v11;
  void *v12;
  __int16 v13;
  id v14;

  v3 = a2;
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[SSLogConfig sharedConfig](SSLogConfig, "sharedConfig"));
  v5 = objc_msgSend(v4, "shouldLog");
  if (objc_msgSend(v4, "shouldLogToDisk"))
    LODWORD(v6) = v5 | 2;
  else
    LODWORD(v6) = v5;
  v7 = objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "OSLogObject"));
  if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    v6 = v6;
  else
    v6 &= 2u;
  if (!(_DWORD)v6)
    goto LABEL_10;
  v8 = (void *)objc_opt_class(*(_QWORD *)(a1 + 32));
  v11 = 138543618;
  v12 = v8;
  v13 = 2114;
  v14 = v3;
  v9 = v8;
  v10 = (void *)_os_log_send_and_compose_impl(v6, 0, 0, 0, &_mh_execute_header, v7, 16, "[%{public}@]: Failed to retrieve remote proxy for cotent size with error: %{public}@", &v11, 22);

  if (v10)
  {
    v7 = objc_claimAutoreleasedReturnValue(+[NSString stringWithCString:encoding:](NSString, "stringWithCString:encoding:", v10, 4));
    free(v10);
    SSFileLog(v4, CFSTR("%@"));
LABEL_10:

  }
}

void sub_100022EFC(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  id v12;
  _QWORD v13[5];

  v5 = a2;
  v6 = a3;
  v7 = *(void **)(a1 + 32);
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = sub_100023058;
  v13[3] = &unk_100048F38;
  v13[4] = v7;
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "_clientViewControllerProxyWithErrorHandler:", v13));
  if (v6)
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
      sub_100029FFC();
    goto LABEL_4;
  }
  if (!v5)
  {
LABEL_4:
    v9 = 0;
    goto LABEL_10;
  }
  v12 = 0;
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSKeyedArchiver archivedDataWithRootObject:requiringSecureCoding:error:](NSKeyedArchiver, "archivedDataWithRootObject:requiringSecureCoding:error:", v5, 1, &v12));
  v10 = v12;
  if (v10 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
    sub_100029F8C();

LABEL_10:
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "userInfo"));
  objc_msgSend(v8, "engagementTaskDidFinishWithResult:resultData:error:completion:", v11, v9, v6, &stru_100049E60);

}

void sub_100023058(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  unsigned int v5;
  uint64_t v6;
  NSObject *v7;
  void *v8;
  id v9;
  void *v10;
  int v11;
  void *v12;
  __int16 v13;
  id v14;

  v3 = a2;
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[SSLogConfig sharedConfig](SSLogConfig, "sharedConfig"));
  v5 = objc_msgSend(v4, "shouldLog");
  if (objc_msgSend(v4, "shouldLogToDisk"))
    LODWORD(v6) = v5 | 2;
  else
    LODWORD(v6) = v5;
  v7 = objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "OSLogObject"));
  if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    v6 = v6;
  else
    v6 &= 2u;
  if (!(_DWORD)v6)
    goto LABEL_10;
  v8 = (void *)objc_opt_class(*(_QWORD *)(a1 + 32));
  v11 = 138543618;
  v12 = v8;
  v13 = 2114;
  v14 = v3;
  v9 = v8;
  v10 = (void *)_os_log_send_and_compose_impl(v6, 0, 0, 0, &_mh_execute_header, v7, 16, "[%{public}@]: Failed to retreive remote proxy for engagement task with error: %{public}@", &v11, 22);

  if (v10)
  {
    v7 = objc_claimAutoreleasedReturnValue(+[NSString stringWithCString:encoding:](NSString, "stringWithCString:encoding:", v10, 4));
    free(v10);
    SSFileLog(v4, CFSTR("%@"));
LABEL_10:

  }
}

void sub_1000236AC(uint64_t a1, char a2, void *a3)
{
  id v5;
  _QWORD v6[4];
  id v7;
  id v8;

  v5 = a3;
  if ((a2 & 1) == 0)
  {
    v6[0] = _NSConcreteStackBlock;
    v6[1] = 3221225472;
    v6[2] = sub_10002374C;
    v6[3] = &unk_100049590;
    v7 = *(id *)(a1 + 32);
    v8 = v5;
    dispatch_async((dispatch_queue_t)&_dispatch_main_q, v6);

  }
}

void sub_10002374C(uint64_t a1)
{
  id v2;

  v2 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "object"));
  objc_msgSend(v2, "_dismissWithError:", *(_QWORD *)(a1 + 40));

}

void sub_100024380(_Unwind_Exception *a1)
{
  id *v1;
  id *v2;
  uint64_t v3;

  objc_destroyWeak(v2);
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v3 - 112));
  _Unwind_Resume(a1);
}

void sub_1000243AC(uint64_t a1, void *a2)
{
  id *v3;
  id v4;
  id v5;
  id WeakRetained;

  v3 = (id *)(a1 + 40);
  v4 = a2;
  WeakRetained = objc_loadWeakRetained(v3);
  v5 = objc_msgSend(objc_alloc((Class)SKUIProductPageItem), "initWithIdentifier:mediaResult:", *(_QWORD *)(a1 + 32), v4);

  objc_msgSend(WeakRetained, "_presentActivityViewControllerWithItem:", v5);
}

void sub_100024424(uint64_t a1, void *a2)
{
  id v3;
  id WeakRetained;
  void *v5;
  unsigned int v6;
  uint64_t v7;
  NSObject *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  id v12;
  void *v13;
  NSBundle *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  NSErrorUserInfoKey v19;
  void *v20;
  int v21;
  void *v22;
  __int16 v23;
  uint64_t v24;
  __int16 v25;
  uint64_t v26;
  __int16 v27;
  id v28;

  v3 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[SSLogConfig sharedConfig](SSLogConfig, "sharedConfig"));
  v6 = objc_msgSend(v5, "shouldLog");
  if (objc_msgSend(v5, "shouldLogToDisk"))
    LODWORD(v7) = v6 | 2;
  else
    LODWORD(v7) = v6;
  v8 = objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "OSLogObject"));
  if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    v7 = v7;
  else
    v7 &= 2u;
  if (!(_DWORD)v7)
    goto LABEL_10;
  v9 = (void *)objc_opt_class(WeakRetained);
  v10 = *(_QWORD *)(a1 + 40);
  v11 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v21 = 138544130;
  v22 = v9;
  v23 = 2114;
  v24 = v11;
  v25 = 2114;
  v26 = v10;
  v27 = 2114;
  v28 = v3;
  v12 = v9;
  v13 = (void *)_os_log_send_and_compose_impl(v7, 0, 0, 0, &_mh_execute_header, v8, 16, "[%{public}@][%{public}@]: Item not found for ID: %{public}@ with error: %{public}@.", &v21, 42);

  if (v13)
  {
    v8 = objc_claimAutoreleasedReturnValue(+[NSString stringWithCString:encoding:](NSString, "stringWithCString:encoding:", v13, 4));
    free(v13);
    SSFileLog(v5, CFSTR("%@"));
LABEL_10:

  }
  v19 = NSLocalizedDescriptionKey;
  v14 = +[NSBundle bundleForClass:](NSBundle, "bundleForClass:", objc_opt_class(SSLookupRequest));
  v15 = (void *)objc_claimAutoreleasedReturnValue(v14);
  v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "localizedStringForKey:value:table:", CFSTR("ITEM_NOT_SHARABLE_TITLE"), &stru_10004A1F0, 0));
  v20 = v16;
  v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v20, &v19, 1));
  v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", SKErrorDomain, 5, v17));

  objc_msgSend(WeakRetained, "_loadDidFailWithError:", v18);
}

void sub_100024764(uint64_t a1)
{
  void *v2;
  unsigned int v3;
  uint64_t v4;
  NSObject *v5;
  void *v6;
  uint64_t v7;
  id v8;
  void *v9;
  void *v10;
  int v11;
  void *v12;
  __int16 v13;
  uint64_t v14;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[SSLogConfig sharedConfig](SSLogConfig, "sharedConfig"));
  v3 = objc_msgSend(v2, "shouldLog");
  if (objc_msgSend(v2, "shouldLogToDisk"))
    LODWORD(v4) = v3 | 2;
  else
    LODWORD(v4) = v3;
  v5 = objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "OSLogObject"));
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    v4 = v4;
  else
    v4 &= 2u;
  if (!(_DWORD)v4)
    goto LABEL_10;
  v6 = (void *)objc_opt_class(*(_QWORD *)(a1 + 32));
  v7 = *(_QWORD *)(a1 + 40);
  v11 = 138543618;
  v12 = v6;
  v13 = 2114;
  v14 = v7;
  v8 = v6;
  v9 = (void *)_os_log_send_and_compose_impl(v4, 0, 0, 0, &_mh_execute_header, v5, 0, "[%{public}@][%{public}@]: Finish immediately.", &v11, 22);

  if (v9)
  {
    v5 = objc_claimAutoreleasedReturnValue(+[NSString stringWithCString:encoding:](NSString, "stringWithCString:encoding:", v9, 4));
    free(v9);
    SSFileLog(v2, CFSTR("%@"));
LABEL_10:

  }
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "_clientViewControllerProxy"));
  objc_msgSend(v10, "didFinishWithResult:error:", &off_10004CEB0, 0);

}

void sub_1000249D8(uint64_t a1, void *a2)
{
  id v3;
  _QWORD v4[4];
  id v5;
  id v6;

  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_100024A6C;
  v4[3] = &unk_100049D10;
  v5 = a2;
  v6 = *(id *)(a1 + 32);
  v3 = v5;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, v4);

}

void sub_100024A6C(uint64_t a1)
{
  id v2;

  v2 = objc_msgSend(objc_alloc((Class)SKUIClientContext), "initWithConfigurationDictionary:", *(_QWORD *)(a1 + 32));
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

}

void sub_100024B34(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  id v5;
  id v6;
  uint64_t v7;
  id v8;
  _QWORD v9[4];
  id v10;
  uint64_t v11;
  _QWORD v12[5];
  id v13;

  v3 = a2;
  v4 = objc_msgSend(objc_alloc((Class)SKUIProductPageActivityViewController), "initWithProductPageItem:clientContext:", *(_QWORD *)(a1 + 32), v3);

  v5 = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 8), "copy");
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = sub_100024C44;
  v12[3] = &unk_100049F50;
  v12[4] = *(_QWORD *)(a1 + 40);
  v13 = v5;
  v6 = v5;
  objc_msgSend(v4, "setCompletionWithItemsHandler:", v12);
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_100024F60;
  v9[3] = &unk_100049590;
  v7 = *(_QWORD *)(a1 + 40);
  v10 = v4;
  v11 = v7;
  v8 = v4;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, v9);

}

void sub_100024C44(uint64_t a1, void *a2, int a3, void *a4, void *a5)
{
  id v9;
  id v10;
  id v11;
  void *v12;
  unsigned int v13;
  uint64_t v14;
  NSObject *v15;
  void *v16;
  uint64_t v17;
  id v18;
  void *v19;
  void *v20;
  unsigned int v21;
  uint64_t v22;
  NSObject *v23;
  void *v24;
  uint64_t v25;
  id v26;
  void *v27;
  uint64_t v28;
  void *v29;
  void *v30;
  NSObject *v31;
  uint64_t v32;
  int v33;
  void *v34;
  __int16 v35;
  uint64_t v36;
  __int16 v37;
  id v38;

  v9 = a2;
  v10 = a4;
  v11 = a5;
  if (!v11)
    goto LABEL_13;
  v12 = (void *)objc_claimAutoreleasedReturnValue(+[SSLogConfig sharedConfig](SSLogConfig, "sharedConfig"));
  v13 = objc_msgSend(v12, "shouldLog");
  if (objc_msgSend(v12, "shouldLogToDisk"))
    LODWORD(v14) = v13 | 2;
  else
    LODWORD(v14) = v13;
  v15 = objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "OSLogObject"));
  if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    v14 = v14;
  else
    v14 &= 2u;
  if (!(_DWORD)v14)
    goto LABEL_11;
  v16 = (void *)objc_opt_class(*(_QWORD *)(a1 + 32));
  v17 = *(_QWORD *)(a1 + 40);
  v33 = 138543874;
  v34 = v16;
  v35 = 2114;
  v36 = v17;
  v37 = 2114;
  v38 = v11;
  v18 = v16;
  v19 = (void *)_os_log_send_and_compose_impl(v14, 0, 0, 0, &_mh_execute_header, v15, 16, "[%{public}@][%{public}@]: Activity controller completed with error: %{public}@.", &v33, 32);

  if (v19)
  {
    v15 = objc_claimAutoreleasedReturnValue(+[NSString stringWithCString:encoding:](NSString, "stringWithCString:encoding:", v19, 4));
    free(v19);
    v31 = v15;
    SSFileLog(v12, CFSTR("%@"));
LABEL_11:

  }
LABEL_13:
  v20 = (void *)objc_claimAutoreleasedReturnValue(+[SSLogConfig sharedConfig](SSLogConfig, "sharedConfig", v31));
  v21 = objc_msgSend(v20, "shouldLog");
  if (objc_msgSend(v20, "shouldLogToDisk"))
    LODWORD(v22) = v21 | 2;
  else
    LODWORD(v22) = v21;
  v23 = objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "OSLogObject"));
  if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
    v22 = v22;
  else
    v22 &= 2u;
  if ((_DWORD)v22)
  {
    v24 = (void *)objc_opt_class(*(_QWORD *)(a1 + 32));
    v25 = *(_QWORD *)(a1 + 40);
    v33 = 138543618;
    v34 = v24;
    v35 = 2114;
    v36 = v25;
    v26 = v24;
    LODWORD(v32) = 22;
    v27 = (void *)_os_log_send_and_compose_impl(v22, 0, 0, 0, &_mh_execute_header, v23, 0, "[%{public}@][%{public}@]: Activity controller completed.", &v33, v32);

    if (!v27)
      goto LABEL_23;
    v23 = objc_claimAutoreleasedReturnValue(+[NSString stringWithCString:encoding:](NSString, "stringWithCString:encoding:", v27, 4));
    free(v27);
    SSFileLog(v20, CFSTR("%@"));
  }

LABEL_23:
  if (a3)
    v28 = 2;
  else
    v28 = 1;

  v29 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "_clientViewControllerProxy"));
  v30 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", v28));
  objc_msgSend(v29, "didFinishWithResult:error:", v30, 0);

}

id sub_100024F60(uint64_t a1)
{
  void *v2;
  void *v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  void *v12;

  v2 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 40), "view"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "popoverPresentationController"));
  objc_msgSend(v3, "setSourceView:", v2);

  objc_msgSend(*(id *)(a1 + 40), "popoverSourceRect");
  v5 = v4;
  v7 = v6;
  v9 = v8;
  v11 = v10;
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "popoverPresentationController"));
  objc_msgSend(v12, "setSourceRect:", v5, v7, v9, v11);

  return objc_msgSend(*(id *)(a1 + 40), "presentViewController:animated:completion:", *(_QWORD *)(a1 + 32), 1, 0);
}

void sub_100025308(uint64_t a1)
{
  id v2;

  v2 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "_clientViewControllerProxy"));
  objc_msgSend(v2, "didFinishWithResult:error:", &off_10004CEC8, *(_QWORD *)(a1 + 40));

}

void sub_100025938(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,id location)
{
  id *v21;

  objc_destroyWeak(v21);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_100025964(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id WeakRetained;
  void *v8;
  unsigned int v9;
  uint64_t v10;
  NSObject *v11;
  void *v12;
  uint64_t v13;
  id v14;
  void *v15;
  void *v16;
  unsigned int v17;
  uint64_t v18;
  NSObject *v19;
  void *v20;
  uint64_t v21;
  id v22;
  void *v23;
  void *v24;
  uint64_t v25;
  id v26;
  void *v27;
  id v28;
  int v29;
  void *v30;
  __int16 v31;
  uint64_t v32;
  __int16 v33;
  id v34;

  v5 = a2;
  v6 = a3;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  if (!v5)
  {
    v16 = (void *)objc_claimAutoreleasedReturnValue(+[SSLogConfig sharedConfig](SSLogConfig, "sharedConfig"));
    v17 = objc_msgSend(v16, "shouldLog");
    if (objc_msgSend(v16, "shouldLogToDisk"))
      LODWORD(v18) = v17 | 2;
    else
      LODWORD(v18) = v17;
    v19 = objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "OSLogObject"));
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
      v18 = v18;
    else
      v18 &= 2u;
    if (v6)
    {
      if ((_DWORD)v18)
      {
        v20 = (void *)objc_opt_class(WeakRetained);
        v21 = *(_QWORD *)(a1 + 32);
        v29 = 138543874;
        v30 = v20;
        v31 = 2114;
        v32 = v21;
        v33 = 2114;
        v34 = v6;
        v22 = v20;
        v23 = (void *)_os_log_send_and_compose_impl(v18, 0, 0, 0, &_mh_execute_header, v19, 16, "[%{public}@][%{public}@] Lookup request completed with error: %{public}@.", &v29, 32);

        if (!v23)
        {
LABEL_24:

          (*(void (**)(_QWORD))(*(_QWORD *)(a1 + 48) + 16))(*(_QWORD *)(a1 + 48));
          goto LABEL_25;
        }
        v19 = objc_claimAutoreleasedReturnValue(+[NSString stringWithCString:encoding:](NSString, "stringWithCString:encoding:", v23, 4));
        free(v23);
        SSFileLog(v16, CFSTR("%@"));
      }

      goto LABEL_24;
    }
    if ((_DWORD)v18)
    {
      v24 = (void *)objc_opt_class(WeakRetained);
      v25 = *(_QWORD *)(a1 + 32);
      v29 = 138543618;
      v30 = v24;
      v31 = 2114;
      v32 = v25;
      v26 = v24;
      v27 = (void *)_os_log_send_and_compose_impl(v18, 0, 0, 0, &_mh_execute_header, v19, 16, "[%{public}@][%{public}@] Lookup request completed without a result or error.", &v29, 22);

      if (!v27)
      {
LABEL_30:

        v28 = objc_msgSend(objc_alloc((Class)NSError), "initWithDomain:code:userInfo:", SKErrorDomain, 0, 0);
        (*(void (**)(_QWORD))(*(_QWORD *)(a1 + 48) + 16))(*(_QWORD *)(a1 + 48));

        goto LABEL_25;
      }
      v19 = objc_claimAutoreleasedReturnValue(+[NSString stringWithCString:encoding:](NSString, "stringWithCString:encoding:", v27, 4));
      free(v27);
      SSFileLog(v16, CFSTR("%@"));
    }

    goto LABEL_30;
  }
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[SSLogConfig sharedConfig](SSLogConfig, "sharedConfig"));
  v9 = objc_msgSend(v8, "shouldLog");
  if (objc_msgSend(v8, "shouldLogToDisk"))
    LODWORD(v10) = v9 | 2;
  else
    LODWORD(v10) = v9;
  v11 = objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "OSLogObject"));
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    v10 = v10;
  else
    v10 &= 2u;
  if (!(_DWORD)v10)
    goto LABEL_11;
  v12 = (void *)objc_opt_class(WeakRetained);
  v13 = *(_QWORD *)(a1 + 32);
  v29 = 138543618;
  v30 = v12;
  v31 = 2114;
  v32 = v13;
  v14 = v12;
  v15 = (void *)_os_log_send_and_compose_impl(v10, 0, 0, 0, &_mh_execute_header, v11, 0, "[%{public}@][%{public}@] Lookup request completed.", &v29, 22);

  if (v15)
  {
    v11 = objc_claimAutoreleasedReturnValue(+[NSString stringWithCString:encoding:](NSString, "stringWithCString:encoding:", v15, 4));
    free(v15);
    SSFileLog(v8, CFSTR("%@"));
LABEL_11:

  }
  (*(void (**)(_QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40));
LABEL_25:

}

void sub_100025E78(uint64_t a1)
{
  id v1;
  void *v2;

  v1 = objc_alloc_init((Class)objc_opt_class(*(_QWORD *)(a1 + 32)));
  v2 = (void *)qword_1000633B0;
  qword_1000633B0 = (uint64_t)v1;

}

void sub_100025FAC(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  xpc_object_t value;
  void *v6;
  void *v7;
  xpc_object_t v8;
  _xpc_endpoint_s *v9;
  _xpc_endpoint_s *v10;
  xpc_connection_t v11;
  id v12;
  void *v13;
  xpc_object_t xdict;

  v3 = a2;
  xdict = v3;
  if (v3 && xpc_get_type(v3) == (xpc_type_t)&_xpc_type_dictionary)
  {
    v4 = *(id *)(a1 + 32);
    value = xpc_dictionary_get_value(xdict, "1");
    v6 = (void *)objc_claimAutoreleasedReturnValue(value);
    v7 = v6;
    if (v6 && xpc_get_type(v6) == (xpc_type_t)&_xpc_type_dictionary)
      objc_msgSend(v4, "setOptions:", v7);
    v8 = xpc_dictionary_get_value(xdict, "2");
    v9 = (_xpc_endpoint_s *)objc_claimAutoreleasedReturnValue(v8);
    v10 = v9;
    if (v9 && xpc_get_type(v9) == (xpc_type_t)&_xpc_type_endpoint)
    {
      v11 = xpc_connection_create_from_endpoint(v10);
      v12 = objc_msgSend(objc_alloc((Class)SSXPCConnection), "initWithXPCConnection:", v11);
      objc_msgSend(v4, "setResponseConnection:", v12);
      v13 = (void *)SSXPCCreateMessageDictionary(-1);
      objc_msgSend(v12, "sendMessage:", v13);

    }
  }
  else
  {
    v4 = 0;
  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

}

void sub_100026474(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id v7;
  id v8;
  _QWORD block[4];
  id v10;
  id v11;
  id v12;

  v5 = a2;
  v6 = a3;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100026530;
  block[3] = &unk_1000498D0;
  v10 = *(id *)(a1 + 32);
  v11 = v5;
  v12 = v6;
  v7 = v6;
  v8 = v5;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);

}

void sub_100026530(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  id v4;
  id v5;

  v5 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "object"));
  v2 = *(_QWORD *)(a1 + 40);
  v3 = objc_opt_class(NSString);
  if ((objc_opt_isKindOfClass(v2, v3) & 1) != 0)
  {
    v4 = objc_msgSend(objc_alloc((Class)NSURL), "initWithString:", *(_QWORD *)(a1 + 40));
    objc_msgSend(v5, "loadPageWithURL:", v4);

  }
  else
  {
    objc_msgSend(v5, "_finishLoadWithResult:error:", 0, *(_QWORD *)(a1 + 48));
  }

}

void sub_1000267C0(uint64_t a1, uint64_t a2, void *a3)
{
  void *v4;
  id v5;
  id v6;

  v4 = *(void **)(a1 + 32);
  v5 = a3;
  v6 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "object"));
  objc_msgSend(v6, "_finishLoadWithResult:error:", a2, v5);

}

uint64_t sub_100026A84()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  _BYTE *v3;
  uint64_t v4;
  uint64_t v5;
  _BYTE *v6;
  int v7;
  uint64_t result;
  uint64_t v9;
  uint64_t v10;
  NSObject *v11;
  os_log_type_t v12;
  uint8_t *v13;
  _BYTE v14[12];
  int v15;
  uint64_t v16;

  v0 = type metadata accessor for Logger(0);
  v1 = *(_QWORD *)(v0 - 8);
  __chkstk_darwin();
  v3 = &v14[-((v2 + 15) & 0xFFFFFFFFFFFFFFF0)];
  v4 = type metadata accessor for SKLogger(0);
  __chkstk_darwin();
  v6 = &v14[-((v5 + 15) & 0xFFFFFFFFFFFFFFF0)];
  v7 = MKBGetDeviceLockState(0);
  result = 1;
  if (v7 && v7 != 3)
  {
    if (qword_100062FF0 != -1)
      swift_once(&qword_100062FF0, sub_100028D74);
    v9 = sub_100026D08(v4, (uint64_t)qword_1000633C0);
    sub_100026D20(v9, (uint64_t)v6);
    v10 = (*(uint64_t (**)(_BYTE *, _BYTE *, uint64_t))(v1 + 32))(v3, v6, v0);
    v11 = Logger.logObject.getter(v10);
    v12 = static os_log_type_t.error.getter();
    if (os_log_type_enabled(v11, v12))
    {
      v13 = (uint8_t *)swift_slowAlloc(8, -1);
      *(_DWORD *)v13 = 67109120;
      v15 = v7;
      UnsafeMutableRawBufferPointer.copyMemory(from:)(&v15, &v16, v13 + 4);
      _os_log_impl((void *)&_mh_execute_header, v11, v12, "Device is locked: %d", v13, 8u);
      swift_slowDealloc(v13, -1, -1);
    }

    (*(void (**)(_BYTE *, uint64_t))(v1 + 8))(v3, v0);
    return 0;
  }
  return result;
}

id sub_100026C60()
{
  void *v0;
  objc_super v2;

  v2.receiver = v0;
  v2.super_class = (Class)swift_getObjectType(v0);
  return objc_msgSendSuper2(&v2, "init");
}

id sub_100026CB4()
{
  void *v0;
  objc_super v2;

  v2.receiver = v0;
  v2.super_class = (Class)swift_getObjectType(v0);
  return objc_msgSendSuper2(&v2, "dealloc");
}

uint64_t type metadata accessor for objc_LockscreenStatus()
{
  return objc_opt_self(_TtC17StoreKitUIService21objc_LockscreenStatus);
}

uint64_t sub_100026D08(uint64_t a1, uint64_t a2)
{
  if ((*(_BYTE *)(*(_QWORD *)(a1 - 8) + 82) & 2) != 0)
    return *(_QWORD *)a2;
  return a2;
}

uint64_t sub_100026D20(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = type metadata accessor for SKLogger(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_100026D64(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  v5 = (*(uint64_t (**)(void))(v2 + 104))();
  v7 = v6;
  v8 = swift_allocObject(&unk_10004A0D8, 32, 7);
  *(_QWORD *)(v8 + 16) = a1;
  *(_QWORD *)(v8 + 24) = a2;
  swift_retain(a2);
  sub_100028618(v5, v7, (uint64_t)sub_1000285A4, v8);
  swift_bridgeObjectRelease(v7);
  return swift_release(v8);
}

id sub_100026E58(uint64_t a1)
{
  return (id)(*(uint64_t (**)(void))(a1 + 16))();
}

uint64_t sub_100026ED4()
{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  char *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  uint64_t v10;
  char *v11;
  id v12;
  uint64_t v13;
  unint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v24;
  uint64_t (*v25)(char *, char *, uint64_t);
  char *v26;
  char *v27;
  uint64_t v28;
  _OWORD v29[3];
  __int128 v30;
  __int128 v31;
  __int128 v32;
  uint64_t v33;

  swift_getObjectType(v0);
  v1 = type metadata accessor for Mirror(0);
  v2 = *(_QWORD *)(v1 - 8);
  ((void (*)(void))__chkstk_darwin)();
  v4 = (char *)&v24 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_100027F9C(&qword_1000630B8);
  v5 = ((uint64_t (*)(void))__chkstk_darwin)();
  v27 = (char *)&v24 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = __chkstk_darwin(v5);
  v9 = (char *)&v24 - v8;
  __chkstk_darwin(v7);
  v11 = (char *)&v24 - v10;
  *((_QWORD *)&v31 + 1) = type metadata accessor for AnalyticsEvent();
  *(_QWORD *)&v30 = v0;
  v12 = v0;
  v13 = v1;
  Mirror.init(reflecting:)(&v30);
  sub_100028124((uint64_t)v11, 0, 1, v1);
  v14 = sub_100027880();
  v28 = Dictionary.init(dictionaryLiteral:)(&_swiftEmptyArrayStorage, &type metadata for String, v14, &protocol witness table for String);
  sub_100028130((uint64_t)v11, (uint64_t)v9);
  if (sub_100028178((uint64_t)v9, 1, v1) != 1)
  {
    v25 = *(uint64_t (**)(char *, char *, uint64_t))(v2 + 32);
    v26 = v9;
    do
    {
      v15 = v13;
      v16 = v25(v4, v9, v13);
      v17 = Mirror.children.getter(v16);
      v33 = v28;
      swift_retain(v17);
      v18 = dispatch thunk of _AnySequenceBox._makeIterator()();
      v19 = swift_release(v17);
      dispatch thunk of _AnyIteratorBoxBase.next()(&v30, v19);
      if (*((_QWORD *)&v32 + 1))
      {
        do
        {
          v29[0] = v30;
          v29[1] = v31;
          v29[2] = v32;
          sub_1000271C0((uint64_t)&v33, (uint64_t *)v29);
          v20 = sub_1000281CC((uint64_t)v29, &qword_1000630C0);
          dispatch thunk of _AnyIteratorBoxBase.next()(&v30, v20);
        }
        while (*((_QWORD *)&v32 + 1));
        v28 = v33;
      }
      swift_release(v17);
      v21 = swift_release(v18);
      v22 = (uint64_t)v27;
      Mirror.superclassMirror.getter(v21);
      v13 = v15;
      (*(void (**)(char *, uint64_t))(v2 + 8))(v4, v15);
      sub_1000281CC((uint64_t)v11, &qword_1000630B8);
      sub_100028184(v22, (uint64_t)v11);
      v9 = v26;
      sub_100028130((uint64_t)v11, (uint64_t)v26);
    }
    while (sub_100028178((uint64_t)v9, 1, v15) != 1);
  }
  sub_1000281CC((uint64_t)v11, &qword_1000630B8);
  sub_1000281CC((uint64_t)v9, &qword_1000630B8);
  return v28;
}

uint64_t sub_1000271C0(uint64_t a1, uint64_t *a2)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  unint64_t v6;
  id v7;
  id *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  id v13;
  __int128 v14[2];
  uint64_t v15;
  id v16[3];
  uint64_t v17;
  uint64_t v18;
  __int128 v19;
  _QWORD v20[4];

  v4 = *a2;
  v3 = a2[1];
  v5 = (uint64_t)(a2 + 2);
  *(_QWORD *)&v19 = *a2;
  *((_QWORD *)&v19 + 1) = v3;
  sub_100027B60((uint64_t)(a2 + 2), (uint64_t)v20);
  if (!v3)
  {
    v9 = (id *)v20;
    return sub_100028244(v9);
  }
  swift_bridgeObjectRetain(v3);
  sub_100028244(v20);
  v19 = *(_OWORD *)a2;
  sub_100027B60(v5, (uint64_t)v20);
  v6 = sub_100027880();
  if ((swift_dynamicCast(v16, v20, (char *)&type metadata for Any + 8, v6, 6) & 1) != 0)
  {
    v7 = v16[0];
    sub_1000283A8((uint64_t)v7, v4, v3);

    return swift_bridgeObjectRelease(v3);
  }
  v19 = *(_OWORD *)a2;
  sub_100027B60(v5, (uint64_t)v20);
  v10 = sub_100027F9C(&qword_1000630C8);
  if ((swift_dynamicCast(v14, v20, (char *)&type metadata for Any + 8, v10, 6) & 1) != 0)
  {
    sub_100028208(v14, (uint64_t)v16);
    v11 = v17;
    v12 = v18;
    sub_100028220(v16, v17);
    sub_100027388(v6, v11, v12, (uint64_t)&v19);
    if ((_QWORD)v19)
    {
      v13 = (id)v19;
      sub_1000283A8((uint64_t)v13, v4, v3);

    }
    swift_bridgeObjectRelease(v3);
    v9 = v16;
    return sub_100028244(v9);
  }
  v15 = 0;
  memset(v14, 0, sizeof(v14));
  swift_bridgeObjectRelease(v3);
  return sub_1000281CC((uint64_t)v14, &qword_1000630D0);
}

uint64_t sub_100027388@<X0>(uint64_t a1@<X2>, uint64_t a2@<X3>, uint64_t a3@<X4>, uint64_t a4@<X8>)
{
  uint64_t AssociatedTypeWitness;
  uint64_t v9;
  char *v10;
  int v11;
  uint64_t v13;

  AssociatedTypeWitness = swift_getAssociatedTypeWitness(0, a3, a2, &protocol requirements base descriptor for RawRepresentable, &associated type descriptor for RawRepresentable.RawValue);
  __chkstk_darwin();
  v10 = (char *)&v13 - v9;
  dispatch thunk of RawRepresentable.rawValue.getter(a2, a3);
  v11 = swift_dynamicCast(a4, v10, AssociatedTypeWitness, a1, 6);
  return sub_100028124(a4, v11 ^ 1u, 1, a1);
}

uint64_t sub_100027498()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  char *v4;
  uint64_t v5;
  unint64_t v6;
  uint64_t v7;
  unint64_t v8;
  unint64_t v9;
  Swift::String v10;
  unint64_t v11;
  uint64_t v12;
  uint64_t v13;
  NSObject *v14;
  os_log_type_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  unint64_t v22;

  v1 = v0;
  v2 = type metadata accessor for SKLogger(0);
  __chkstk_darwin(v2);
  v4 = (char *)&v19 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (qword_100062FF0 != -1)
    swift_once(&qword_100062FF0, sub_100028D74);
  v5 = sub_100026D08(v2, (uint64_t)qword_1000633C0);
  sub_100026D20(v5, (uint64_t)v4);
  v21 = 0;
  v22 = 0xE000000000000000;
  _StringGuts.grow(_:)(20);
  v6 = v22;
  v7 = _typeName(_:qualified:)(v1, 0);
  v9 = v8;
  swift_bridgeObjectRelease(v6);
  v21 = v7;
  v22 = v9;
  v10._object = (void *)0x8000000100040840;
  v10._countAndFlagsBits = 0xD000000000000012;
  String.append(_:)(v10);
  v12 = v21;
  v11 = v22;
  LOBYTE(v9) = static os_log_type_t.fault.getter();
  v13 = swift_bridgeObjectRetain_n(v11, 2);
  v14 = Logger.logObject.getter(v13);
  v15 = v9;
  if (os_log_type_enabled(v14, (os_log_type_t)v9))
  {
    v16 = swift_slowAlloc(22, -1);
    v17 = swift_slowAlloc(64, -1);
    v21 = v17;
    *(_DWORD *)v16 = 136446466;
    v20 = sub_10002793C(0, 0xE000000000000000, &v21);
    sub_1000285F0();
    *(_WORD *)(v16 + 12) = 2082;
    swift_bridgeObjectRetain(v11);
    v20 = sub_10002793C(v12, v11, &v21);
    sub_1000285F0();
    sub_100028600();
    _os_log_impl((void *)&_mh_execute_header, v14, v15, "%{public}s%{public}s", (uint8_t *)v16, 0x16u);
    swift_arrayDestroy(v17, 2, (char *)&type metadata for Any + 8);
    sub_10002860C(v17);
    sub_10002860C(v16);
    swift_bridgeObjectRelease(v11);

  }
  else
  {

    sub_100028600();
  }
  sub_1000278BC((uint64_t)v4);
  return 0;
}

id sub_1000276E0()
{
  void *v0;
  objc_super v2;

  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for AnalyticsEvent();
  return objc_msgSendSuper2(&v2, "init");
}

id sub_100027730()
{
  void *v0;
  objc_super v2;

  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for AnalyticsEvent();
  return objc_msgSendSuper2(&v2, "dealloc");
}

uint64_t type metadata accessor for AnalyticsEvent()
{
  return objc_opt_self(_TtC17StoreKitUIService14AnalyticsEvent);
}

uint64_t sub_100027788()
{
  return 1;
}

uint64_t sub_100027854()
{
  uint64_t v0;
  uint64_t ObjectType;

  ObjectType = swift_getObjectType(v0);
  return (*(uint64_t (**)(void))(ObjectType + 104))();
}

unint64_t sub_100027880()
{
  unint64_t result;
  uint64_t v1;

  result = qword_1000630A8;
  if (!qword_1000630A8)
  {
    v1 = objc_opt_self(NSObject);
    result = swift_getObjCClassMetadata(v1);
    atomic_store(result, (unint64_t *)&qword_1000630A8);
  }
  return result;
}

uint64_t sub_1000278BC(uint64_t a1)
{
  uint64_t v2;

  v2 = type metadata accessor for SKLogger(0);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_1000278F8(uint64_t (**a1)(uint64_t, uint64_t, uint64_t), uint64_t a2, uint64_t a3, uint64_t a4)
{
  return (*a1)(a2, a3, a4);
}

_BYTE **sub_10002792C(_BYTE **result, uint64_t a2, uint64_t a3, char a4)
{
  _BYTE *v4;

  v4 = *result;
  *v4 = a4;
  *result = v4 + 1;
  return result;
}

uint64_t sub_10002793C(uint64_t a1, unint64_t a2, uint64_t *a3)
{
  _QWORD *v6;
  uint64_t v7;
  _QWORD *v8;
  uint64_t v9;
  uint64_t v10;
  _QWORD v12[3];
  void *ObjectType;

  v6 = sub_100027A0C(v12, 0, 0, 1, a1, a2);
  v7 = v12[0];
  if (v6)
  {
    v8 = v6;
    ObjectType = (void *)swift_getObjectType(v6);
    v12[0] = v8;
    v9 = *a3;
    if (*a3)
    {
      sub_100027B60((uint64_t)v12, *a3);
      *a3 = v9 + 32;
    }
  }
  else
  {
    ObjectType = &type metadata for _StringGuts;
    v12[0] = a1;
    v12[1] = a2;
    v10 = *a3;
    if (*a3)
    {
      sub_100027B60((uint64_t)v12, *a3);
      *a3 = v10 + 32;
    }
    swift_bridgeObjectRetain(a2);
  }
  sub_100028244(v12);
  return v7;
}

_QWORD *sub_100027A0C(_QWORD *a1, char *__dst, uint64_t a3, char a4, uint64_t a5, unint64_t a6)
{
  uint64_t v8;
  _QWORD *result;
  uint64_t v12;
  _QWORD __src[2];

  if ((a6 & 0x2000000000000000) != 0)
  {
    if ((a4 & 1) == 0 && __dst && a3 - (uint64_t)__dst > (uint64_t)(HIBYTE(a6) & 0xF))
    {
      __src[0] = a5;
      __src[1] = a6 & 0xFFFFFFFFFFFFFFLL;
      sub_100027B9C((char *)__src, HIBYTE(a6) & 0xF, __dst);
      UnsafeMutableRawBufferPointer.subscript.setter(0, HIBYTE(a6) & 0xF, __dst, a3);
      result = 0;
      *a1 = __dst;
      return result;
    }
    goto LABEL_11;
  }
  if ((a6 & 0x1000000000000000) != 0)
  {
LABEL_11:
    result = sub_100027C60(a5, a6);
    *a1 = v12;
    return result;
  }
  if ((a5 & 0x1000000000000000) != 0)
  {
    v8 = (a6 & 0xFFFFFFFFFFFFFFFLL) + 32;
  }
  else
  {
    v8 = _StringObject.sharedUTF8.getter(a5, a6);
    if (!v8)
    {
      result = (_QWORD *)_assertionFailure(_:_:file:line:flags:)("Fatal error", 11, 2, "Unexpectedly found nil while unwrapping an Optional value", 57, 2, "Swift/StringTesting.swift", 25, 2, 151, 0);
      __break(1u);
      return result;
    }
  }
  *a1 = v8;
  if ((a6 & 0x8000000000000000) != 0)
    return 0;
  else
    return (_QWORD *)swift_unknownObjectRetain(a6 & 0xFFFFFFFFFFFFFFFLL, __dst);
}

uint64_t sub_100027B60(uint64_t a1, uint64_t a2)
{
  uint64_t v3;

  v3 = *(_QWORD *)(a1 + 24);
  *(_QWORD *)(a2 + 24) = v3;
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

void *sub_100027B9C(char *__src, size_t __n, char *__dst)
{
  void *result;

  if ((__n & 0x8000000000000000) != 0)
  {
    result = (void *)_fatalErrorMessage(_:_:file:line:flags:)("Fatal error", 11, 2, "UnsafeMutableRawPointer.initializeMemory with negative count", 60, 2, "Swift/UnsafeRawPointer.swift", 28, 2, 1170, 0);
  }
  else
  {
    if (&__dst[__n] <= __src || &__src[__n] <= __dst)
      return memcpy(__dst, __src, __n);
    result = (void *)_fatalErrorMessage(_:_:file:line:flags:)("Fatal error", 11, 2, "UnsafeMutableRawPointer.initializeMemory overlapping range", 58, 2, "Swift/UnsafeRawPointer.swift", 28, 2, 1173, 0);
  }
  __break(1u);
  return result;
}

_QWORD *sub_100027C60(uint64_t a1, unint64_t a2)
{
  _QWORD *v2;
  unint64_t v3;
  unint64_t v4;

  v2 = sub_100027CF4(a1, a2);
  if ((swift_isUniquelyReferenced_nonNull_native(v2) & 1) == 0)
    v2 = sub_100027EC8(0, v2[2] + 1, 1, (uint64_t)v2);
  v4 = v2[2];
  v3 = v2[3];
  if (v4 >= v3 >> 1)
    v2 = sub_100027EC8((char *)(v3 > 1), v4 + 1, 1, (uint64_t)v2);
  v2[2] = v4 + 1;
  *((_BYTE *)v2 + v4 + 32) = 0;
  return v2;
}

_QWORD *sub_100027CF4(uint64_t a1, unint64_t a2)
{
  Swift::Int v4;
  _QWORD *v5;
  _QWORD *v6;
  uint64_t v7;
  char v8;
  _QWORD *result;
  int v10;

  if ((a2 & 0x1000000000000000) != 0)
  {
    v4 = String.UTF8View._foreignCount()();
    if (v4)
      goto LABEL_6;
    return &_swiftEmptyArrayStorage;
  }
  if ((a2 & 0x2000000000000000) != 0)
    v4 = HIBYTE(a2) & 0xF;
  else
    v4 = a1 & 0xFFFFFFFFFFFFLL;
  if (!v4)
    return &_swiftEmptyArrayStorage;
LABEL_6:
  v5 = sub_100027E64(v4, 0);
  if (v4 < 0)
  {
    _fatalErrorMessage(_:_:file:line:flags:)("Fatal error", 11, 2, "UnsafeMutableBufferPointer with negative count", 46, 2, "Swift/UnsafeBufferPointer.swift", 31, 2, 71, 0);
    __break(1u);
    goto LABEL_14;
  }
  v6 = v5;
  v7 = _StringGuts.copyUTF8(into:)(v5 + 4, v4, a1, a2);
  if ((v8 & 1) != 0)
  {
LABEL_14:
    LOBYTE(v10) = 2;
    result = (_QWORD *)_assertionFailure(_:_:file:line:flags:)("Fatal error", 11, 2, "Insufficient space allocated to copy string contents", 52, 2, "Swift/StringUTF8View.swift", 26, v10, 430, 0);
    goto LABEL_15;
  }
  if (v7 == v4)
    return v6;
  result = (_QWORD *)_assertionFailure(_:_:file:line:flags:)("Fatal error", 11, 2, "invalid Collection: less than 'count' elements in collection", 60, 2, "Swift/ContiguousArrayBuffer.swift", 33, 2, 1122, 0);
LABEL_15:
  __break(1u);
  return result;
}

_QWORD *sub_100027E64(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v4;
  _QWORD *v5;
  size_t v6;

  if (a2 <= a1)
    v2 = a1;
  else
    v2 = a2;
  if (!v2)
    return &_swiftEmptyArrayStorage;
  v4 = sub_100027F9C(&qword_1000630B0);
  v5 = (_QWORD *)swift_allocObject(v4, v2 + 32, 7);
  v6 = j__malloc_size(v5);
  v5[2] = a1;
  v5[3] = 2 * v6 - 64;
  return v5;
}

char *sub_100027EC8(char *result, int64_t a2, char a3, uint64_t a4)
{
  char v5;
  unint64_t v6;
  int64_t v7;
  int64_t v8;
  int64_t v9;
  uint64_t v10;
  char *v11;
  size_t v12;
  char *v13;
  char *v14;

  v5 = (char)result;
  if ((a3 & 1) != 0)
  {
    v6 = *(_QWORD *)(a4 + 24);
    v7 = v6 >> 1;
    if ((uint64_t)(v6 >> 1) < a2)
    {
      if (v7 + 0x4000000000000000 < 0)
      {
        __break(1u);
        return result;
      }
      v7 = v6 & 0xFFFFFFFFFFFFFFFELL;
      if ((uint64_t)(v6 & 0xFFFFFFFFFFFFFFFELL) <= a2)
        v7 = a2;
    }
  }
  else
  {
    v7 = a2;
  }
  v8 = *(_QWORD *)(a4 + 16);
  if (v7 <= v8)
    v9 = *(_QWORD *)(a4 + 16);
  else
    v9 = v7;
  if (v9)
  {
    v10 = sub_100027F9C(&qword_1000630B0);
    v11 = (char *)swift_allocObject(v10, v9 + 32, 7);
    v12 = j__malloc_size(v11);
    *((_QWORD *)v11 + 2) = v8;
    *((_QWORD *)v11 + 3) = 2 * v12 - 64;
  }
  else
  {
    v11 = (char *)&_swiftEmptyArrayStorage;
  }
  v13 = v11 + 32;
  v14 = (char *)(a4 + 32);
  if ((v5 & 1) != 0)
  {
    sub_1000280A0(v14, v8, v13);
    *(_QWORD *)(a4 + 16) = 0;
  }
  else
  {
    sub_100027FDC(v14, v8, v13);
  }
  swift_bridgeObjectRelease(a4);
  return v11;
}

uint64_t sub_100027F9C(uint64_t *a1)
{
  uint64_t result;

  result = *a1;
  if (result < 0)
  {
    result = swift_getTypeByMangledNameInContext2((char *)a1 + (int)result, -(result >> 32), 0, 0);
    *a1 = result;
  }
  return result;
}

void *sub_100027FDC(char *__src, size_t __n, char *__dst)
{
  void *result;

  if ((__n & 0x8000000000000000) != 0)
  {
    result = (void *)_fatalErrorMessage(_:_:file:line:flags:)("Fatal error", 11, 2, "UnsafeMutablePointer.initialize with negative count", 51, 2, "Swift/UnsafePointer.swift", 25, 2, 1090, 0);
  }
  else
  {
    if (&__dst[__n] <= __src || &__src[__n] <= __dst)
      return memcpy(__dst, __src, __n);
    result = (void *)_fatalErrorMessage(_:_:file:line:flags:)("Fatal error", 11, 2, "UnsafeMutablePointer.initialize overlapping range", 49, 2, "Swift/UnsafePointer.swift", 25, 2, 1092, 0);
  }
  __break(1u);
  return result;
}

char *sub_1000280A0(char *__src, size_t __len, char *__dst)
{
  char v4;

  if ((__len & 0x8000000000000000) != 0)
  {
    v4 = 2;
    __src = (char *)_fatalErrorMessage(_:_:file:line:flags:)("Fatal error", 11, 2, "UnsafeMutablePointer.moveInitialize with negative count", 55, 2, "Swift/UnsafePointer.swift", 25, v4, 1046, 0);
    __break(1u);
  }
  else if (__dst != __src || &__src[__len] <= __dst)
  {
    return (char *)memmove(__dst, __src, __len);
  }
  return __src;
}

uint64_t sub_100028124(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a4 - 8) + 56))();
}

uint64_t sub_100028130(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = sub_100027F9C(&qword_1000630B8);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_100028178(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a3 - 8) + 48))();
}

uint64_t sub_100028184(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = sub_100027F9C(&qword_1000630B8);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t sub_1000281CC(uint64_t a1, uint64_t *a2)
{
  uint64_t v3;

  v3 = sub_100027F9C(a2);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v3 - 8) + 8))(a1, v3);
  return a1;
}

uint64_t sub_100028208(__int128 *a1, uint64_t a2)
{
  __int128 v2;
  __int128 v3;

  v2 = *a1;
  v3 = a1[1];
  *(_QWORD *)(a2 + 32) = *((_QWORD *)a1 + 4);
  *(_OWORD *)a2 = v2;
  *(_OWORD *)(a2 + 16) = v3;
  return a2;
}

_QWORD *sub_100028220(_QWORD *result, uint64_t a2)
{
  if ((*(_DWORD *)(*(_QWORD *)(a2 - 8) + 80) & 0x20000) != 0)
    return (_QWORD *)(*result
                    + ((*(_DWORD *)(*(_QWORD *)(a2 - 8) + 80) + 16) & ~(unint64_t)*(_DWORD *)(*(_QWORD *)(a2 - 8) + 80)));
  return result;
}

uint64_t sub_100028244(_QWORD *a1)
{
  uint64_t v1;

  v1 = *(_QWORD *)(a1[3] - 8);
  if ((*(_BYTE *)(v1 + 82) & 2) != 0)
    return swift_release(*a1);
  else
    return (*(uint64_t (**)(void))(v1 + 8))();
}

unint64_t sub_100028264(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  Swift::Int v5;
  _QWORD v7[9];

  Hasher.init(_seed:)(v7, *(_QWORD *)(v2 + 40));
  String.hash(into:)(v7, a1, a2);
  v5 = Hasher._finalize()();
  return sub_1000282C8(a1, a2, v5);
}

unint64_t sub_1000282C8(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  unint64_t v6;
  uint64_t v9;
  _QWORD *v10;
  BOOL v11;
  uint64_t v12;
  _QWORD *v13;
  BOOL v14;

  v4 = v3 + 64;
  v5 = -1 << *(_BYTE *)(v3 + 32);
  v6 = a3 & ~v5;
  if (((*(_QWORD *)(v3 + 64 + ((v6 >> 3) & 0xFFFFFFFFFFFFF8)) >> v6) & 1) != 0)
  {
    v9 = *(_QWORD *)(v3 + 48);
    v10 = (_QWORD *)(v9 + 16 * v6);
    v11 = *v10 == a1 && v10[1] == a2;
    if (!v11 && (_stringCompareWithSmolCheck(_:_:expecting:)() & 1) == 0)
    {
      v12 = ~v5;
      do
      {
        v6 = (v6 + 1) & v12;
        if (((*(_QWORD *)(v4 + ((v6 >> 3) & 0xFFFFFFFFFFFFF8)) >> v6) & 1) == 0)
          break;
        v13 = (_QWORD *)(v9 + 16 * v6);
        v14 = *v13 == a1 && v13[1] == a2;
      }
      while (!v14 && (_stringCompareWithSmolCheck(_:_:expecting:)() & 1) == 0);
    }
  }
  return v6;
}

uint64_t sub_1000283A8(uint64_t a1, uint64_t a2, uint64_t a3)
{
  _QWORD *v3;
  char isUniquelyReferenced_nonNull_native;
  uint64_t v8;
  uint64_t v10;

  isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native(*v3);
  v10 = *v3;
  *v3 = 0x8000000000000000;
  sub_100028424(a1, a2, a3, isUniquelyReferenced_nonNull_native);
  v8 = *v3;
  *v3 = v10;
  return swift_bridgeObjectRelease(v8);
}

void sub_100028424(uint64_t a1, uint64_t a2, uint64_t a3, char a4)
{
  _QWORD *v4;
  _QWORD **v5;
  _QWORD *v10;
  unint64_t v11;
  char v12;
  uint64_t v13;
  _BOOL8 v14;
  Swift::Int v15;
  unint64_t v16;
  char v17;
  unint64_t v18;
  char v19;
  _QWORD *v20;
  uint64_t v21;

  v5 = (_QWORD **)v4;
  v10 = (_QWORD *)*v4;
  v11 = sub_100028264(a2, a3);
  v13 = v10[2];
  v14 = (v12 & 1) == 0;
  v15 = v13 + v14;
  if (__OFADD__(v13, v14))
  {
    __break(1u);
    goto LABEL_9;
  }
  v16 = v11;
  v17 = v12;
  sub_100027F9C(&qword_1000630D8);
  if (!_NativeDictionary.ensureUnique(isUnique:capacity:)(a4 & 1, v15))
    goto LABEL_5;
  v18 = sub_100028264(a2, a3);
  if ((v17 & 1) != (v19 & 1))
  {
LABEL_9:
    KEY_TYPE_OF_DICTIONARY_VIOLATES_HASHABLE_REQUIREMENTS(_:)(&type metadata for String);
    __break(1u);
    return;
  }
  v16 = v18;
LABEL_5:
  v20 = *v5;
  if ((v17 & 1) != 0)
  {
    v21 = v20[7];

    *(_QWORD *)(v21 + 8 * v16) = a1;
  }
  else
  {
    sub_100028538(v16, a2, a3, a1, v20);
    swift_bridgeObjectRetain(a3);
  }
}

unint64_t sub_100028538(unint64_t result, uint64_t a2, uint64_t a3, uint64_t a4, _QWORD *a5)
{
  _QWORD *v5;
  uint64_t v6;
  BOOL v7;
  uint64_t v8;

  a5[(result >> 6) + 8] |= 1 << result;
  v5 = (_QWORD *)(a5[6] + 16 * result);
  *v5 = a2;
  v5[1] = a3;
  *(_QWORD *)(a5[7] + 8 * result) = a4;
  v6 = a5[2];
  v7 = __OFADD__(v6, 1);
  v8 = v6 + 1;
  if (v7)
    __break(1u);
  else
    a5[2] = v8;
  return result;
}

uint64_t sub_100028580()
{
  uint64_t v0;

  swift_release(*(_QWORD *)(v0 + 24));
  return swift_deallocObject(v0, 32, 7);
}

uint64_t sub_1000285A4()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 16))();
}

uint64_t sub_1000285C4()
{
  uint64_t v0;

  _Block_release(*(const void **)(v0 + 16));
  return swift_deallocObject(v0, 24, 7);
}

id sub_1000285E8()
{
  uint64_t v0;

  return sub_100026E58(*(_QWORD *)(v0 + 16));
}

uint64_t sub_1000285F0()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  return UnsafeMutableRawBufferPointer.copyMemory(from:)(v2 - 104, v1, v0);
}

uint64_t sub_100028600()
{
  uint64_t v0;

  return swift_bridgeObjectRelease_n(v0, 3);
}

uint64_t sub_10002860C(uint64_t a1)
{
  return swift_slowDealloc(a1, -1, -1);
}

void sub_100028618(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  NSString v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  _QWORD v10[5];
  uint64_t v11;

  v6 = String._bridgeToObjectiveC()();
  v7 = swift_allocObject(&unk_10004A128, 32, 7);
  *(_QWORD *)(v7 + 16) = a3;
  *(_QWORD *)(v7 + 24) = a4;
  v10[4] = sub_100028CE0;
  v11 = v7;
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 1107296256;
  v10[2] = sub_100028938;
  v10[3] = &unk_10004A140;
  v8 = _Block_copy(v10);
  v9 = v11;
  swift_retain(a4);
  swift_release(v9);
  sub_100028D68();
  _Block_release(v8);

}

void sub_1000286D0(void *a1)
{
  uint64_t v2;
  uint64_t v3;
  char *v4;
  NSObject *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  os_log_type_t v16;
  uint8_t *v17;
  _QWORD aBlock[5];
  uint64_t v19;

  v2 = type metadata accessor for SKLogger(0);
  __chkstk_darwin(v2);
  v4 = (char *)aBlock - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (objc_msgSend(a1, "canCreatePayload"))
  {
    v5 = objc_msgSend(a1, "eventName");
    if (!v5)
    {
      static String._unconditionallyBridgeFromObjectiveC(_:)(0);
      v7 = v6;
      v5 = String._bridgeToObjectiveC()();
      swift_bridgeObjectRelease(v7);
    }
    v8 = swift_allocObject(&unk_10004A178, 24, 7);
    *(_QWORD *)(v8 + 16) = a1;
    aBlock[4] = sub_100028D34;
    v19 = v8;
    aBlock[0] = _NSConcreteStackBlock;
    aBlock[1] = 1107296256;
    aBlock[2] = sub_100028938;
    aBlock[3] = &unk_10004A190;
    v9 = _Block_copy(aBlock);
    v10 = v19;
    swift_unknownObjectRetain(a1, v11);
    swift_release(v10);
    sub_100028D68();
    _Block_release(v9);
  }
  else
  {
    if (qword_100062FF0 != -1)
      swift_once(&qword_100062FF0, sub_100028D74);
    v12 = sub_100026D08(v2, (uint64_t)qword_1000633C0);
    v13 = sub_100026D20(v12, (uint64_t)v4);
    v5 = Logger.logObject.getter(v13);
    v14 = type metadata accessor for Logger(0);
    v15 = (*(uint64_t (**)(char *, uint64_t))(*(_QWORD *)(v14 - 8) + 8))(v4, v14);
    v16 = static os_log_type_t.error.getter(v15);
    if (os_log_type_enabled(v5, v16))
    {
      v17 = (uint8_t *)swift_slowAlloc(2, -1);
      *(_WORD *)v17 = 0;
      _os_log_impl((void *)&_mh_execute_header, v5, v16, "Error sending CoreAnalytics event, invalid event provided", v17, 2u);
      swift_slowDealloc(v17, -1, -1);
    }
  }

}

uint64_t sub_1000288CC(void *a1)
{
  id v1;
  void *v2;
  unint64_t v3;
  uint64_t v4;

  v1 = objc_msgSend(a1, "createPayload");
  if (!v1)
    return 0;
  v2 = v1;
  v3 = sub_100027880();
  v4 = static Dictionary._unconditionallyBridgeFromObjectiveC(_:)(v2, &type metadata for String, v3, &protocol witness table for String);

  return v4;
}

Class sub_100028938(uint64_t a1)
{
  uint64_t (*v1)(uint64_t);
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  NSDictionary v5;

  v1 = *(uint64_t (**)(uint64_t))(a1 + 32);
  v2 = *(_QWORD *)(a1 + 40);
  v3 = swift_retain(v2);
  v4 = v1(v3);
  swift_release(v2);
  if (v4)
  {
    sub_100027880();
    v5.super.isa = Dictionary._bridgeToObjectiveC()().super.isa;
    swift_bridgeObjectRelease(v4);
  }
  else
  {
    v5.super.isa = 0;
  }
  return v5.super.isa;
}

uint64_t sub_1000289AC(uint64_t (*a1)(uint64_t))
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  char *v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  unint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  NSObject *v14;
  uint64_t v15;
  uint64_t v16;
  os_log_type_t v17;
  uint8_t *v18;
  uint64_t v20;

  v2 = type metadata accessor for SKLogger(0);
  v3 = __chkstk_darwin();
  v5 = (char *)&v20 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = (void *)a1(v3);
  v7 = v6;
  if (!v6 || !objc_msgSend(v6, "canCreatePayload"))
  {
    if (qword_100062FF0 != -1)
      swift_once(&qword_100062FF0, sub_100028D74);
    v12 = sub_100026D08(v2, (uint64_t)qword_1000633C0);
    v13 = sub_100026D20(v12, (uint64_t)v5);
    v14 = Logger.logObject.getter(v13);
    v15 = type metadata accessor for Logger(0);
    v16 = (*(uint64_t (**)(char *, uint64_t))(*(_QWORD *)(v15 - 8) + 8))(v5, v15);
    v17 = static os_log_type_t.error.getter(v16);
    if (os_log_type_enabled(v14, v17))
    {
      v18 = (uint8_t *)swift_slowAlloc(2, -1);
      *(_WORD *)v18 = 0;
      _os_log_impl((void *)&_mh_execute_header, v14, v17, "Error sending CoreAnalytics event, invalid event provided", v18, 2u);
      swift_slowDealloc(v18, -1, -1);
    }

    goto LABEL_10;
  }
  v8 = objc_msgSend(v7, "createPayload");
  if (!v8)
  {
LABEL_10:
    swift_unknownObjectRelease(v7);
    return 0;
  }
  v9 = v8;
  v10 = sub_100027880();
  v11 = static Dictionary._unconditionallyBridgeFromObjectiveC(_:)(v9, &type metadata for String, v10, &protocol witness table for String);

  swift_unknownObjectRelease(v7);
  return v11;
}

id sub_100028C1C()
{
  void *v0;
  objc_super v2;

  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for objc_AnalyticsManager();
  return objc_msgSendSuper2(&v2, "init");
}

id sub_100028C6C()
{
  void *v0;
  objc_super v2;

  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for objc_AnalyticsManager();
  return objc_msgSendSuper2(&v2, "dealloc");
}

uint64_t type metadata accessor for objc_AnalyticsManager()
{
  return objc_opt_self(_TtC17StoreKitUIService21objc_AnalyticsManager);
}

uint64_t sub_100028CBC()
{
  uint64_t v0;

  swift_release(*(_QWORD *)(v0 + 24));
  return swift_deallocObject(v0, 32, 7);
}

uint64_t sub_100028CE0()
{
  uint64_t v0;

  return sub_1000289AC(*(uint64_t (**)(uint64_t))(v0 + 16));
}

uint64_t sub_100028CE8(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  v2 = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
  *(_QWORD *)(a1 + 40) = v2;
  return swift_retain(v2);
}

uint64_t sub_100028CF8(uint64_t a1)
{
  return swift_release(*(_QWORD *)(a1 + 40));
}

uint64_t sub_100028D00(uint64_t result, _BYTE **a2)
{
  _BYTE *v2;

  v2 = *a2;
  *v2 = result;
  *a2 = v2 + 1;
  return result;
}

uint64_t sub_100028D10()
{
  uint64_t v0;

  swift_unknownObjectRelease(*(_QWORD *)(v0 + 16));
  return swift_deallocObject(v0, 24, 7);
}

uint64_t sub_100028D34()
{
  uint64_t v0;

  return sub_1000288CC(*(void **)(v0 + 16));
}

uint64_t sub_100028D3C()
{
  uint64_t v0;

  _Block_release(*(const void **)(v0 + 16));
  return swift_deallocObject(v0, 24, 7);
}

uint64_t sub_100028D68()
{
  uint64_t v0;
  uint64_t v1;

  return AnalyticsSendEventLazy(v0, v1);
}

uint64_t sub_100028D74()
{
  uint64_t v0;

  v0 = type metadata accessor for SKLogger(0);
  sub_100028DE8(v0, qword_1000633C0);
  sub_100026D08(v0, (uint64_t)qword_1000633C0);
  return Logger.init(subsystem:category:)(0xD000000000000012, 0x8000000100040BE0, 0x746C7561666544, 0xE700000000000000);
}

uint64_t *sub_100028DE8(uint64_t a1, uint64_t *a2)
{
  uint64_t v3;
  uint64_t v4;

  v3 = *(_QWORD *)(a1 - 8);
  if ((*(_DWORD *)(v3 + 80) & 0x20000) != 0)
  {
    v4 = swift_slowAlloc(*(_QWORD *)(v3 + 64), *(_DWORD *)(v3 + 80));
    *a2 = v4;
    return (uint64_t *)v4;
  }
  return a2;
}

uint64_t type metadata accessor for SKLogger(uint64_t a1)
{
  uint64_t result;

  result = qword_100063160;
  if (!qword_100063160)
    return swift_getSingletonMetadata(a1, &nominal type descriptor for SKLogger);
  return result;
}

uint64_t sub_100028E60(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = type metadata accessor for Logger(0);
  return (**(uint64_t (***)(uint64_t, uint64_t, uint64_t))(v4 - 8))(a1, a2, v4);
}

uint64_t sub_100028E9C(uint64_t a1)
{
  uint64_t v2;

  v2 = type metadata accessor for Logger(0);
  return (*(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
}

uint64_t sub_100028ED0(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = type metadata accessor for Logger(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a1, a2, v4);
  return a1;
}

uint64_t sub_100028F14(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = type metadata accessor for Logger(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 24))(a1, a2, v4);
  return a1;
}

uint64_t sub_100028F58(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = type metadata accessor for Logger(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 32))(a1, a2, v4);
  return a1;
}

uint64_t sub_100028F9C(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = type metadata accessor for Logger(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 40))(a1, a2, v4);
  return a1;
}

uint64_t sub_100028FE0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return swift_getEnumTagSinglePayloadGeneric(a1, a2, a3, sub_100028FEC);
}

uint64_t sub_100028FEC()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  v2 = sub_1000290B4();
  return sub_100028178(v1, v0, v2);
}

uint64_t sub_100029014(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return swift_storeEnumTagSinglePayloadGeneric(a1, a2, a3, a4, sub_100029020);
}

uint64_t sub_100029020()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  v2 = sub_1000290B4();
  return sub_100028124(v1, v0, v0, v2);
}

uint64_t sub_10002904C(uint64_t a1)
{
  uint64_t result;
  unint64_t v3;
  uint64_t v4;

  result = type metadata accessor for Logger(319);
  if (v3 <= 0x3F)
  {
    v4 = *(_QWORD *)(result - 8) + 64;
    swift_initStructMetadata(a1, 256, 1, &v4, a1 + 16);
    return 0;
  }
  return result;
}

uint64_t sub_1000290B4()
{
  return type metadata accessor for Logger(0);
}

id sub_1000290C4()
{
  void *v0;
  objc_super v2;

  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for StoreKitUIServiceClass();
  return objc_msgSendSuper2(&v2, "init");
}

id sub_100029118()
{
  void *v0;
  objc_super v2;

  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for StoreKitUIServiceClass();
  return objc_msgSendSuper2(&v2, "dealloc");
}

uint64_t type metadata accessor for StoreKitUIServiceClass()
{
  return objc_opt_self(_TtC17StoreKitUIServiceP33_3D9DD0E03C2070C18F69993E3586D6ED22StoreKitUIServiceClass);
}

uint64_t sub_100029178()
{
  return sub_100029298(&OBJC_IVAR____TtC17StoreKitUIService18ProductLookupEvent_productID);
}

uint64_t sub_100029190(uint64_t a1, uint64_t a2)
{
  return sub_1000292E4(a1, a2, &OBJC_IVAR____TtC17StoreKitUIService18ProductLookupEvent_productID);
}

id sub_1000291A8(uint64_t a1, uint64_t a2, void (*a3)(void))
{
  uint64_t v3;
  uint64_t v4;
  NSString v5;

  a3();
  if (v3)
  {
    v4 = v3;
    v5 = String._bridgeToObjectiveC()();
    swift_bridgeObjectRelease(v4);
  }
  else
  {
    v5 = 0;
  }
  return v5;
}

uint64_t sub_1000291EC()
{
  return sub_100029298(&OBJC_IVAR____TtC17StoreKitUIService18ProductLookupEvent_extensionName);
}

void sub_100029204(void *a1, uint64_t a2, uint64_t a3, void (*a4)(uint64_t, uint64_t))
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  id v9;

  if (a3)
  {
    v6 = static String._unconditionallyBridgeFromObjectiveC(_:)(a3);
    v8 = v7;
  }
  else
  {
    v6 = 0;
    v8 = 0;
  }
  v9 = a1;
  a4(v6, v8);

}

uint64_t sub_100029274(uint64_t a1, uint64_t a2)
{
  return sub_1000292E4(a1, a2, &OBJC_IVAR____TtC17StoreKitUIService18ProductLookupEvent_extensionName);
}

uint64_t sub_10002928C()
{
  return sub_100029298(&OBJC_IVAR____TtC17StoreKitUIService18ProductLookupEvent_itemKind);
}

uint64_t sub_100029298(_QWORD *a1)
{
  uint64_t v1;
  uint64_t *v2;
  uint64_t v3;

  v2 = (uint64_t *)(v1 + *a1);
  v3 = *v2;
  swift_bridgeObjectRetain(v2[1]);
  return v3;
}

uint64_t sub_1000292D8(uint64_t a1, uint64_t a2)
{
  return sub_1000292E4(a1, a2, &OBJC_IVAR____TtC17StoreKitUIService18ProductLookupEvent_itemKind);
}

uint64_t sub_1000292E4(uint64_t a1, uint64_t a2, _QWORD *a3)
{
  uint64_t v3;
  _QWORD *v4;
  uint64_t v5;

  v4 = (_QWORD *)(v3 + *a3);
  v5 = v4[1];
  *v4 = a1;
  v4[1] = a2;
  return swift_bridgeObjectRelease(v5);
}

id sub_1000292FC(void *a1, void *a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  id result;
  void *v9;
  uint64_t v10;
  uint64_t v11;

  v4 = sub_100029624(a1, (SEL *)&selRef_itemKind);
  sub_1000292D8(v4, v5);
  if (a2)
  {
    v6 = sub_100029624(a2, (SEL *)&selRef_identifier);
  }
  else
  {
    v6 = 0;
    v7 = 0;
  }
  sub_100029274(v6, v7);
  result = objc_msgSend(a1, "iTunesStoreIdentifier");
  if (result)
  {
    v9 = result;
    objc_msgSend(result, "integerValue");

    v10 = dispatch thunk of CustomStringConvertible.description.getter(&type metadata for Int, &protocol witness table for Int);
    return (id)sub_100029190(v10, v11);
  }
  return result;
}

unint64_t sub_100029464()
{
  return 0xD000000000000020;
}

BOOL sub_1000294A4()
{
  uint64_t v0;

  return *(_QWORD *)(v0 + OBJC_IVAR____TtC17StoreKitUIService18ProductLookupEvent_itemKind + 8) != 0;
}

id sub_1000294C0()
{
  char *v0;
  char *v1;
  char *v2;
  char *v3;
  objc_class *v4;
  objc_super v6;

  v1 = &v0[OBJC_IVAR____TtC17StoreKitUIService18ProductLookupEvent_productID];
  *(_QWORD *)v1 = 0;
  *((_QWORD *)v1 + 1) = 0;
  v2 = &v0[OBJC_IVAR____TtC17StoreKitUIService18ProductLookupEvent_extensionName];
  *(_QWORD *)v2 = 0;
  *((_QWORD *)v2 + 1) = 0;
  v3 = &v0[OBJC_IVAR____TtC17StoreKitUIService18ProductLookupEvent_itemKind];
  v4 = (objc_class *)type metadata accessor for ProductLookupEvent();
  *(_QWORD *)v3 = 0;
  *((_QWORD *)v3 + 1) = 0;
  v6.receiver = v0;
  v6.super_class = v4;
  return objc_msgSendSuper2(&v6, "init");
}

uint64_t sub_100029548()
{
  uint64_t v0;

  sub_100029680(v0 + OBJC_IVAR____TtC17StoreKitUIService18ProductLookupEvent_productID);
  sub_100029680(v0 + OBJC_IVAR____TtC17StoreKitUIService18ProductLookupEvent_extensionName);
  return swift_bridgeObjectRelease(*(_QWORD *)(v0 + OBJC_IVAR____TtC17StoreKitUIService18ProductLookupEvent_itemKind + 8));
}

id sub_100029588()
{
  void *v0;
  objc_super v2;

  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for ProductLookupEvent();
  return objc_msgSendSuper2(&v2, "dealloc");
}

uint64_t type metadata accessor for ProductLookupEvent()
{
  return objc_opt_self(_TtC17StoreKitUIService18ProductLookupEvent);
}

uint64_t sub_100029624(void *a1, SEL *a2)
{
  id v2;
  void *v3;
  uint64_t v4;

  v2 = objc_msgSend(a1, *a2);
  if (!v2)
    return 0;
  v3 = v2;
  v4 = static String._unconditionallyBridgeFromObjectiveC(_:)(v2);

  return v4;
}

uint64_t sub_100029680@<X0>(uint64_t a1@<X8>)
{
  return swift_bridgeObjectRelease(*(_QWORD *)(a1 + 8));
}

uint64_t sub_100029688()
{
  uint64_t v0;

  return swift_deallocClassInstance(v0, 16, 7);
}

uint64_t type metadata accessor for ResourceBundleClass()
{
  return objc_opt_self(_TtC17StoreKitUIServiceP33_9D712FCD73A7E3FCF614346CCCD582C419ResourceBundleClass);
}

void sub_1000296B8(uint64_t a1)
{
  int v1;
  uint64_t v2;

  v1 = 138543362;
  v2 = a1;
  _os_log_error_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR, "%{public}@ Not registering for unfinished transaction notifications because no bundle ID was available", (uint8_t *)&v1, 0xCu);
  sub_100005AA8();
}

void sub_100029730()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint8_t v5;

  sub_100005A80();
  sub_100005A98((void *)&_mh_execute_header, &_os_log_default, v0, "%{public}@: Error in remote proxy getting unfinished transactions: %{public}@", v1, v2, v3, v4, v5);
  sub_100005AA8();
}

void sub_10002979C()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint8_t v5;

  sub_100005A80();
  sub_100005A98((void *)&_mh_execute_header, &_os_log_default, v0, "%{public}@: Error getting unfinished transactions: %{public}@", v1, v2, v3, v4, v5);
  sub_100005AA8();
}

void sub_100029808()
{
  uint8_t v0[16];

  *(_WORD *)v0 = 0;
  _os_log_error_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR, "Denying launch because the device is locked.", v0, 2u);
}

void sub_10002984C()
{
  uint8_t v0[16];

  *(_WORD *)v0 = 0;
  _os_log_error_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR, "Denying ServiceBackgroundAssetConsentViewController because the device is locked. Exiting.", v0, 2u);
}

void sub_100029890()
{
  uint8_t v0[16];

  *(_WORD *)v0 = 0;
  _os_log_error_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR, "Denying ServicePrivacyPromptViewController because the device is locked. Exiting.", v0, 2u);
}

void sub_1000298D4()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint8_t v5;

  sub_100014BB8();
  sub_100005A98((void *)&_mh_execute_header, &_os_log_default, v0, "[%{public}@][%{public}@]: Legacy mode in ServiceStoreProductViewController", v1, v2, v3, v4, v5);
  sub_100005AA8();
}

void sub_100029948()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint8_t v5;

  sub_100014BB8();
  sub_100005A98((void *)&_mh_execute_header, &_os_log_default, v0, "[%{public}@][%{public}@]: No SKAdNetwork", v1, v2, v3, v4, v5);
  sub_100005AA8();
}

void sub_1000299BC()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint8_t v5;

  sub_100014BB8();
  sub_100005A98((void *)&_mh_execute_header, &_os_log_default, v0, "[%{public}@][%{public}@]: Source app ID 0 for SKAdNetwork", v1, v2, v3, v4, v5);
  sub_100005AA8();
}

void sub_100029A30()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint8_t v5;

  sub_100014BB8();
  sub_100014BD0((void *)&_mh_execute_header, &_os_log_default, v0, "[%{public}@][%{public}@]: Product failed to load with error: %{public}@", v1, v2, v3, v4, v5);
}

void sub_100029AB0(uint64_t a1, void *a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;

  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a2, "absoluteString"));
  sub_100014BD0((void *)&_mh_execute_header, &_os_log_default, v2, "[%{public}@][%{public}@]: Deprecated method called - loadProductWithURL: %{public}@", v3, v4, v5, v6, 2u);

}

uint64_t sub_100029B68()
{
  uint64_t v0;

  v0 = abort_report_np("Unable to find class %s", "MSOnboardingUtil");
  return sub_100029B8C(v0);
}

uint64_t sub_100029B8C()
{
  uint64_t v0;

  v0 = abort_report_np("Unable to find class %s", "AMSUIWebViewController");
  return sub_100029BB0(v0);
}

uint64_t sub_100029BB0()
{
  uint64_t v0;

  v0 = abort_report_np("Unable to find class %s", "AMSBag");
  return sub_100029BD4(v0);
}

uint64_t sub_100029BD4()
{
  uint64_t v0;

  v0 = abort_report_np("Unable to find class %s", "AMSURLParser");
  return sub_100029BF8(v0);
}

void sub_100029BF8(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  int v3;
  uint64_t v4;
  __int16 v5;
  uint64_t v6;
  __int16 v7;
  uint64_t v8;

  v2 = *(_QWORD *)(a1 + 16);
  v3 = 138543874;
  v4 = a1;
  v5 = 2114;
  v6 = v2;
  v7 = 2048;
  v8 = a2;
  _os_log_error_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR, "[%{public}@][%{public}@]: Invalid SKProductPageExtensionInteractionType: %lu", (uint8_t *)&v3, 0x20u);
}

void sub_100029C98(uint64_t *a1, uint64_t *a2)
{
  uint64_t v2;
  uint64_t v3;
  int v4;
  uint64_t v5;
  __int16 v6;
  uint64_t v7;

  v2 = *a1;
  v3 = *a2;
  v4 = 138543618;
  v5 = v2;
  v6 = 2048;
  v7 = v3;
  _os_log_debug_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEBUG, "No bag value for requested key: %{public}@ of type: %ld", (uint8_t *)&v4, 0x16u);
  sub_100005AA8();
}

void sub_100029D24()
{
  uint8_t v0[16];

  *(_WORD *)v0 = 0;
  _os_log_error_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR, "No valid port found for the server", v0, 2u);
}

void sub_100029D68(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_1000215E4((void *)&_mh_execute_header, &_os_log_default, a3, "The fetched bag is invalid %{public}@", a5, a6, a7, a8, 2u);
  sub_100005AA8();
}

void sub_100029DD4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_1000215E4((void *)&_mh_execute_header, &_os_log_default, a3, "Error deserializing response %{public}@", a5, a6, a7, a8, 2u);
  sub_100005AA8();
}

void sub_100029E40(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_1000215E4((void *)&_mh_execute_header, &_os_log_default, a3, "Error fetching bag %{public}@", a5, a6, a7, a8, 2u);
  sub_100005AA8();
}

void sub_100029EAC(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t v4;
  NSObject *v5;
  id v6;
  int v7;
  id v8;
  __int16 v9;
  uint64_t v10;

  v4 = *(_QWORD *)(a1 + 32);
  v5 = a2;
  v7 = 138543618;
  v8 = (id)objc_opt_class(v4);
  v9 = 2114;
  v10 = a3;
  v6 = v8;
  _os_log_error_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_ERROR, "%{public}@: Failed to get remote view controller proxy: %{public}@", (uint8_t *)&v7, 0x16u);

}

uint64_t sub_100029F68()
{
  uint64_t v0;

  v0 = abort_report_np("Unable to find class %s", "SubscriptionOfferCodeViewController");
  return sub_100029F8C(v0);
}

void sub_100029F8C()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint8_t v5;

  sub_100005A80();
  sub_100005A98((void *)&_mh_execute_header, &_os_log_default, v0, "[%@]: Failed to archive engagement result, error: %{public}@", v1, v2, v3, v4, v5);
}

void sub_100029FFC()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint8_t v5;

  sub_100005A80();
  sub_100005A98((void *)&_mh_execute_header, &_os_log_default, v0, "[%@]: Engagement presentation failed with error %{public}@", v1, v2, v3, v4, v5);
}

void sub_10002A06C()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint8_t v5;

  sub_100014BB8();
  sub_100005A98((void *)&_mh_execute_header, &_os_log_default, v0, "[%{public}@][%{public}@]: No ID provided for product.", v1, v2, v3, v4, v5);
}

void sub_10002A0E4()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint8_t v5;

  sub_100014BB8();
  sub_100005A98((void *)&_mh_execute_header, &_os_log_default, v0, "[%{public}@][%{public}@]: Invalid format for product ID.", v1, v2, v3, v4, v5);
}

id objc_msgSend_JSONObjectWithData_options_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "JSONObjectWithData:options:error:");
}

id objc_msgSend_OSLogObject(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "OSLogObject");
}

id objc_msgSend_URL(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "URL");
}

id objc_msgSend_URLWithString_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "URLWithString:");
}

id objc_msgSend_UTF8String(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "UTF8String");
}

id objc_msgSend_UUID(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "UUID");
}

id objc_msgSend_UUIDString(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "UUIDString");
}

id objc_msgSend__activePort(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_activePort");
}

id objc_msgSend__addActionWithTitle_style_handler_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_addActionWithTitle:style:handler:");
}

id objc_msgSend__addConfigurationAction_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_addConfigurationAction:");
}

id objc_msgSend__alertViewForSessionWithRemoteViewController_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_alertViewForSessionWithRemoteViewController:");
}

id objc_msgSend__applicationMode(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_applicationMode");
}

id objc_msgSend__applyCustomTintColorToViewController_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_applyCustomTintColorToViewController:");
}

id objc_msgSend__bag(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_bag");
}

id objc_msgSend__bagKeyForConfigURLString_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_bagKeyForConfigURLString:");
}

id objc_msgSend__beginDelayingPresentation_cancellationHandler_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_beginDelayingPresentation:cancellationHandler:");
}

id objc_msgSend__buildReviewInAppConfigurationWithParameters_clientContext_completionHandler_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_buildReviewInAppConfigurationWithParameters:clientContext:completionHandler:");
}

id objc_msgSend__cancelNotifyTokenIfValid_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_cancelNotifyTokenIfValid:");
}

id objc_msgSend__checkEntitlementsWithError_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_checkEntitlementsWithError:");
}

id objc_msgSend__cleanUpExtension(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_cleanUpExtension");
}

id objc_msgSend__clientViewControllerProxy(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_clientViewControllerProxy");
}

id objc_msgSend__clientViewControllerProxyWithErrorHandler_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_clientViewControllerProxyWithErrorHandler:");
}

id objc_msgSend__closeReceiverConnection(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_closeReceiverConnection");
}

id objc_msgSend__correctPopover_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_correctPopover:");
}

id objc_msgSend__defaultClientInterface(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_defaultClientInterface");
}

id objc_msgSend__determineTypeForURL_completion_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_determineTypeForURL:completion:");
}

id objc_msgSend__didReceiveRemoteViewController_forItem_withParameters_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_didReceiveRemoteViewController:forItem:withParameters:");
}

id objc_msgSend__disconnect(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_disconnect");
}

id objc_msgSend__disconnectFromAlertView_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_disconnectFromAlertView:");
}

id objc_msgSend__dismiss(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_dismiss");
}

id objc_msgSend__dismissAlertController(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_dismissAlertController");
}

id objc_msgSend__dismissClientViewController(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_dismissClientViewController");
}

id objc_msgSend__dismissPresentedViewController(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_dismissPresentedViewController");
}

id objc_msgSend__dismissViewService(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_dismissViewService");
}

id objc_msgSend__dismissWithError_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_dismissWithError:");
}

id objc_msgSend__endDelayingPresentation(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_endDelayingPresentation");
}

id objc_msgSend__executeConfigurationActionsWithServiceProductPage_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_executeConfigurationActionsWithServiceProductPage:");
}

id objc_msgSend__fetchBag(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_fetchBag");
}

id objc_msgSend__finishLoadWithResult_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_finishLoadWithResult:error:");
}

id objc_msgSend__finishWithButtonIndex_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_finishWithButtonIndex:");
}

id objc_msgSend__flatImageWithColor_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_flatImageWithColor:");
}

id objc_msgSend__generateClientInterface(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_generateClientInterface");
}

id objc_msgSend__handleMessage_connection_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_handleMessage:connection:");
}

id objc_msgSend__handleSafariScriptDataUpdate_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_handleSafariScriptDataUpdate:");
}

id objc_msgSend__handleUniversalLinkInURLComponents_forApplication_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_handleUniversalLinkInURLComponents:forApplication:");
}

id objc_msgSend__hostApplicationBundleIdentifier(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_hostApplicationBundleIdentifier");
}

id objc_msgSend__hostAuditToken(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_hostAuditToken");
}

id objc_msgSend__iconForApplication_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_iconForApplication:");
}

id objc_msgSend__inAppConfigurationWithItemID_title_icon_sandboxed_clientContext_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_inAppConfigurationWithItemID:title:icon:sandboxed:clientContext:");
}

id objc_msgSend__isClientEntitled(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_isClientEntitled");
}

id objc_msgSend__kill_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_kill:");
}

id objc_msgSend__loadClientContextWithCompletionBlock_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_loadClientContextWithCompletionBlock:");
}

id objc_msgSend__loadDidFailWithError_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_loadDidFailWithError:");
}

id objc_msgSend__loadProductWithIdentifier_parameters_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_loadProductWithIdentifier:parameters:");
}

id objc_msgSend__loadProductWithIdentifier_parameters_completion_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_loadProductWithIdentifier:parameters:completion:");
}

id objc_msgSend__loadURLWithActiveConfiguration_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_loadURLWithActiveConfiguration:");
}

id objc_msgSend__lookupItemWithIdentifier_success_failure_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_lookupItemWithIdentifier:success:failure:");
}

id objc_msgSend__makeItemKindEventForItem_extension_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_makeItemKindEventForItem:extension:");
}

id objc_msgSend__newCancelButtonItemWithClientContext_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_newCancelButtonItemWithClientContext:");
}

id objc_msgSend__preloadConfiguration(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_preloadConfiguration");
}

id objc_msgSend__presentActivityViewControllerWithItem_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_presentActivityViewControllerWithItem:");
}

id objc_msgSend__presentChildViewController(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_presentChildViewController");
}

id objc_msgSend__presentErrorViewControllerWithError_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_presentErrorViewControllerWithError:");
}

id objc_msgSend__presentFormViewControllerForSession_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_presentFormViewControllerForSession:");
}

id objc_msgSend__presentLaunchViewControllerForIdentifier_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_presentLaunchViewControllerForIdentifier:");
}

id objc_msgSend__presentOnboardingIfNeededWithCompletion_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_presentOnboardingIfNeededWithCompletion:");
}

id objc_msgSend__presentViewController(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_presentViewController");
}

id objc_msgSend__presentViewController_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_presentViewController:");
}

id objc_msgSend__privacyViewControllerDidFinishWithResult_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_privacyViewControllerDidFinishWithResult:");
}

id objc_msgSend__productIDFromParameters_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_productIDFromParameters:");
}

id objc_msgSend__remoteViewControllerProxy(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_remoteViewControllerProxy");
}

id objc_msgSend__remoteViewControllerProxyWithErrorHandler_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_remoteViewControllerProxyWithErrorHandler:");
}

id objc_msgSend__requestRemoteViewControllerForItem_withParameters_completion_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_requestRemoteViewControllerForItem:withParameters:completion:");
}

id objc_msgSend__resetDocumentControllers(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_resetDocumentControllers");
}

id objc_msgSend__respondWithSuccess_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_respondWithSuccess:");
}

id objc_msgSend__rootSheetPresentationController(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_rootSheetPresentationController");
}

id objc_msgSend__sanitizedURL(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_sanitizedURL");
}

id objc_msgSend__sendDidFinishWithResult_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_sendDidFinishWithResult:");
}

id objc_msgSend__sendInstallAttributionIfAllowed(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_sendInstallAttributionIfAllowed");
}

id objc_msgSend__sendUnentitledErrorResponse(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_sendUnentitledErrorResponse");
}

id objc_msgSend__serviceConnection(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_serviceConnection");
}

id objc_msgSend__serviceConnectionInvalidated(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_serviceConnectionInvalidated");
}

id objc_msgSend__serviceConnectionWithName_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_serviceConnectionWithName:");
}

id objc_msgSend__setAdditionalPurchaseParameters_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_setAdditionalPurchaseParameters:");
}

id objc_msgSend__setAskToBuy_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_setAskToBuy:");
}

id objc_msgSend__setCancelButtonTitle_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_setCancelButtonTitle:");
}

id objc_msgSend__setCentersPopoverIfSourceViewNotSet_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_setCentersPopoverIfSourceViewNotSet:");
}

id objc_msgSend__setChildViewController_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_setChildViewController:");
}

id objc_msgSend__setContainerIgnoresDirectTouchEvents_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_setContainerIgnoresDirectTouchEvents:");
}

id objc_msgSend__setContentInsetAdjustmentBehavior_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_setContentInsetAdjustmentBehavior:");
}

id objc_msgSend__setHidesTabBar_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_setHidesTabBar:");
}

id objc_msgSend__setPromptString_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_setPromptString:");
}

id objc_msgSend__setPurchaseAffiliateIdentifier_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_setPurchaseAffiliateIdentifier:");
}

id objc_msgSend__setPurchaseURLBagType_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_setPurchaseURLBagType:");
}

id objc_msgSend__setRightBarButtonTitle_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_setRightBarButtonTitle:");
}

id objc_msgSend__setShouldScaleDownBehindDescendantSheets_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_setShouldScaleDownBehindDescendantSheets:");
}

id objc_msgSend__setShowsRightBarButton_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_setShowsRightBarButton:");
}

id objc_msgSend__setShowsStoreButton_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_setShowsStoreButton:");
}

id objc_msgSend__setUsageContext_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_setUsageContext:");
}

id objc_msgSend__setViewClipsToBounds_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_setViewClipsToBounds:");
}

id objc_msgSend__setupChildViewController_animated_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_setupChildViewController:animated:");
}

id objc_msgSend__setupErrorViewController(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_setupErrorViewController");
}

id objc_msgSend__setupProductPageViewController(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_setupProductPageViewController");
}

id objc_msgSend__setupViewController_forPresentationInTraitEnvironment_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_setupViewController:forPresentationInTraitEnvironment:");
}

id objc_msgSend__setupWithClientBundleID_bagType_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_setupWithClientBundleID:bagType:");
}

id objc_msgSend__shouldIncludeAcknowledgementButtonInSplashController(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_shouldIncludeAcknowledgementButtonInSplashController");
}

id objc_msgSend__showAlertForAlertProxy_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_showAlertForAlertProxy:");
}

id objc_msgSend__showLegacyControllerForProductID_parameters_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_showLegacyControllerForProductID:parameters:");
}

id objc_msgSend__showViewControllerForAlertProxy_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_showViewControllerForAlertProxy:");
}

id objc_msgSend__startIfReady(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_startIfReady");
}

id objc_msgSend__stopApplication(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_stopApplication");
}

id objc_msgSend__storeKitClientInterface(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_storeKitClientInterface");
}

id objc_msgSend__storeKitServiceInterface(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_storeKitServiceInterface");
}

id objc_msgSend__storePageViewController(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_storePageViewController");
}

id objc_msgSend__target(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_target");
}

id objc_msgSend__unfinishedTransactionsNotificationName(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_unfinishedTransactionsNotificationName");
}

id objc_msgSend__usesModalPresentation(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_usesModalPresentation");
}

id objc_msgSend__viewControllerForType_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_viewControllerForType:");
}

id objc_msgSend_absoluteString(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "absoluteString");
}

id objc_msgSend_account(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "account");
}

id objc_msgSend_acknowledgementReceived(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "acknowledgementReceived");
}

id objc_msgSend_action(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "action");
}

id objc_msgSend_actionString(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "actionString");
}

id objc_msgSend_actions(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "actions");
}

id objc_msgSend_activeAccount(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "activeAccount");
}

id objc_msgSend_activeChildViewController(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "activeChildViewController");
}

id objc_msgSend_activeConfiguration(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "activeConfiguration");
}

id objc_msgSend_activityType(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "activityType");
}

id objc_msgSend_addAnimation_forKey_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "addAnimation:forKey:");
}

id objc_msgSend_addButtonWithTitle_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "addButtonWithTitle:");
}

id objc_msgSend_addChildViewController_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "addChildViewController:");
}

id objc_msgSend_addEntriesFromDictionary_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "addEntriesFromDictionary:");
}

id objc_msgSend_addFinishBlock_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "addFinishBlock:");
}

id objc_msgSend_addInstallAttributionParamsWithConfig_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "addInstallAttributionParamsWithConfig:");
}

id objc_msgSend_addObject_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "addObject:");
}

id objc_msgSend_addObjectsFromArray_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "addObjectsFromArray:");
}

id objc_msgSend_addOperation_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "addOperation:");
}

id objc_msgSend_addSubview_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "addSubview:");
}

id objc_msgSend_alertController_alertDidFinishWithButton_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "alertController:alertDidFinishWithButton:");
}

id objc_msgSend_alertProxy_didReceiveMessage_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "alertProxy:didReceiveMessage:");
}

id objc_msgSend_alertProxyDidCancel_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "alertProxyDidCancel:");
}

id objc_msgSend_allItems(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "allItems");
}

id objc_msgSend_allObjects(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "allObjects");
}

id objc_msgSend_ams_DSID(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "ams_DSID");
}

id objc_msgSend_ams_activeiTunesAccount(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "ams_activeiTunesAccount");
}

id objc_msgSend_ams_sharedAccountStore(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "ams_sharedAccountStore");
}

id objc_msgSend_animateWithDuration_animations_completion_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "animateWithDuration:animations:completion:");
}

id objc_msgSend_animated(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "animated");
}

id objc_msgSend_animationWithKeyPath_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "animationWithKeyPath:");
}

id objc_msgSend_appState(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "appState");
}

id objc_msgSend_application_openURL_options_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "application:openURL:options:");
}

id objc_msgSend_applicationDidEnterBackground(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "applicationDidEnterBackground");
}

id objc_msgSend_applicationProxyForIdentifier_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "applicationProxyForIdentifier:");
}

id objc_msgSend_applicationWillEnterForeground(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "applicationWillEnterForeground");
}

id objc_msgSend_archivedDataWithRootObject_requiringSecureCoding_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "archivedDataWithRootObject:requiringSecureCoding:error:");
}

id objc_msgSend_array(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "array");
}

id objc_msgSend_arrayWithObjects_count_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "arrayWithObjects:count:");
}

id objc_msgSend_askToShowMessageWithReplyBlock_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "askToShowMessageWithReplyBlock:");
}

id objc_msgSend_associateIncidentId_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "associateIncidentId:");
}

id objc_msgSend_attemptDismissHostViewController(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "attemptDismissHostViewController");
}

id objc_msgSend_authenticationContext(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "authenticationContext");
}

id objc_msgSend_backButtonTitle(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "backButtonTitle");
}

id objc_msgSend_bagForProfile_profileVersion_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "bagForProfile:profileVersion:");
}

id objc_msgSend_bagKeySet(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "bagKeySet");
}

id objc_msgSend_bagSubProfile(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "bagSubProfile");
}

id objc_msgSend_bagSubProfileVersion(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "bagSubProfileVersion");
}

id objc_msgSend_blackColor(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "blackColor");
}

id objc_msgSend_BOOLValue(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "BOOLValue");
}

id objc_msgSend_bounds(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "bounds");
}

id objc_msgSend_buildWithError_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "buildWithError:");
}

id objc_msgSend_bundleForClass_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "bundleForClass:");
}

id objc_msgSend_bundleIdentifier(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "bundleIdentifier");
}

id objc_msgSend_bundleType(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "bundleType");
}

id objc_msgSend_buttonTitle(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "buttonTitle");
}

id objc_msgSend_buttons(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "buttons");
}

id objc_msgSend_bytes(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "bytes");
}

id objc_msgSend_canSendResponse(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "canSendResponse");
}

id objc_msgSend_cancelExtensionRequestWithIdentifier_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "cancelExtensionRequestWithIdentifier:");
}

id objc_msgSend_cardContainerViewController(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "cardContainerViewController");
}

id objc_msgSend_checkServerQueueForClientIfNecessary_forceCheck_reply_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "checkServerQueueForClientIfNecessary:forceCheck:reply:");
}

id objc_msgSend_childViewController(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "childViewController");
}

id objc_msgSend_childViewControllers(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "childViewControllers");
}

id objc_msgSend_clearColor(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "clearColor");
}

id objc_msgSend_clientContext(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "clientContext");
}

id objc_msgSend_clientInterface(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "clientInterface");
}

id objc_msgSend_clientLookupItemDidLoad_parameters_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "clientLookupItemDidLoad:parameters:");
}

id objc_msgSend_code(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "code");
}

id objc_msgSend_codeDetected_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "codeDetected:");
}

id objc_msgSend_componentsSeparatedByString_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "componentsSeparatedByString:");
}

id objc_msgSend_componentsWithURL_resolvingAgainstBaseURL_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "componentsWithURL:resolvingAgainstBaseURL:");
}

id objc_msgSend_configurationActions(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "configurationActions");
}

id objc_msgSend_configurationFromUserInfo_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "configurationFromUserInfo:");
}

id objc_msgSend_configurationPreloader(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "configurationPreloader");
}

id objc_msgSend_configurationPromise(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "configurationPromise");
}

id objc_msgSend_configureWithItem_compatibleExtension_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "configureWithItem:compatibleExtension:");
}

id objc_msgSend_consentProvided(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "consentProvided");
}

id objc_msgSend_containerNavigationController(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "containerNavigationController");
}

id objc_msgSend_containerViewControllers(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "containerViewControllers");
}

id objc_msgSend_containingBundle(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "containingBundle");
}

id objc_msgSend_containsObject_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "containsObject:");
}

id objc_msgSend_convertInterfaceOrientation_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "convertInterfaceOrientation:");
}

id objc_msgSend_convertRect_toView_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "convertRect:toView:");
}

id objc_msgSend_copy(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "copy");
}

id objc_msgSend_copyITMLOptionsDictionary(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "copyITMLOptionsDictionary");
}

id objc_msgSend_copyQueryStringDictionaryWithUnescapedValues_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "copyQueryStringDictionaryWithUnescapedValues:");
}

id objc_msgSend_copyXPCEncoding(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "copyXPCEncoding");
}

id objc_msgSend_count(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "count");
}

id objc_msgSend_countByEnumeratingWithState_objects_count_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "countByEnumeratingWithState:objects:count:");
}

id objc_msgSend_createBagForSubProfile(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "createBagForSubProfile");
}

id objc_msgSend_createBetaAppLaunchViewControllerForIdentifier_hostedIn_withSidepackLaunchInfo_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "createBetaAppLaunchViewControllerForIdentifier:hostedIn:withSidepackLaunchInfo:");
}

id objc_msgSend_createFeedbackViewControllerForCurrentState(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "createFeedbackViewControllerForCurrentState");
}

id objc_msgSend_createXPCEndpoint(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "createXPCEndpoint");
}

id objc_msgSend_currentDevice(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "currentDevice");
}

id objc_msgSend_currentProcess(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "currentProcess");
}

id objc_msgSend_dataTaskWithRequest_completionHandler_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "dataTaskWithRequest:completionHandler:");
}

id objc_msgSend_dataWithPropertyList_format_options_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "dataWithPropertyList:format:options:error:");
}

id objc_msgSend_deactivate(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "deactivate");
}

id objc_msgSend_decimalDigitCharacterSet(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "decimalDigitCharacterSet");
}

id objc_msgSend_defaultBroker(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "defaultBroker");
}

id objc_msgSend_defaultButton(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "defaultButton");
}

id objc_msgSend_defaultCenter(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "defaultCenter");
}

id objc_msgSend_defaultContext(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "defaultContext");
}

id objc_msgSend_defaultLocalStoragePath(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "defaultLocalStoragePath");
}

id objc_msgSend_defaultQueue(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "defaultQueue");
}

id objc_msgSend_defaultStore(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "defaultStore");
}

id objc_msgSend_delegate(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "delegate");
}

id objc_msgSend_description(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "description");
}

id objc_msgSend_desiredPresentationStyle(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "desiredPresentationStyle");
}

id objc_msgSend_dictionaryWithObjects_forKeys_count_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "dictionaryWithObjects:forKeys:count:");
}

id objc_msgSend_didAcceptPINAction(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "didAcceptPINAction");
}

id objc_msgSend_didContinueAction(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "didContinueAction");
}

id objc_msgSend_didFinish(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "didFinish");
}

id objc_msgSend_didFinishDismissal(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "didFinishDismissal");
}

id objc_msgSend_didFinishLoading(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "didFinishLoading");
}

id objc_msgSend_didFinishWithResult_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "didFinishWithResult:");
}

id objc_msgSend_didFinishWithResult_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "didFinishWithResult:error:");
}

id objc_msgSend_didMoveToParentViewController_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "didMoveToParentViewController:");
}

id objc_msgSend_didPrepareWithResult_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "didPrepareWithResult:error:");
}

id objc_msgSend_didProvideConsentAction(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "didProvideConsentAction");
}

id objc_msgSend_dismiss(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "dismiss");
}

id objc_msgSend_dismissAnimated_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "dismissAnimated:");
}

id objc_msgSend_dismissBridgedViewController(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "dismissBridgedViewController");
}

id objc_msgSend_dismissHostViewController(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "dismissHostViewController");
}

id objc_msgSend_dismissHostViewControllerWithResult_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "dismissHostViewControllerWithResult:error:");
}

id objc_msgSend_dismissViewController(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "dismissViewController");
}

id objc_msgSend_dismissViewControllerAnimated_completion_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "dismissViewControllerAnimated:completion:");
}

id objc_msgSend_dismissViewControllerWithResult_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "dismissViewControllerWithResult:error:");
}

id objc_msgSend_distantFuture(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "distantFuture");
}

id objc_msgSend_domain(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "domain");
}

id objc_msgSend_downloadAdded_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "downloadAdded:");
}

id objc_msgSend_downloadRemoved_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "downloadRemoved:");
}

id objc_msgSend_downloadStatusChanged_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "downloadStatusChanged:");
}

id objc_msgSend_embeddedParent(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "embeddedParent");
}

id objc_msgSend_embeddedViewController(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "embeddedViewController");
}

id objc_msgSend_engagementTaskDidFinishWithResult_resultData_error_completion_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "engagementTaskDidFinishWithResult:resultData:error:completion:");
}

id objc_msgSend_enumerateKeysAndObjectsUsingBlock_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "enumerateKeysAndObjectsUsingBlock:");
}

id objc_msgSend_enumerateObjectsUsingBlock_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "enumerateObjectsUsingBlock:");
}

id objc_msgSend_enumerateQueryWithBlock_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "enumerateQueryWithBlock:");
}

id objc_msgSend_errorView(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "errorView");
}

id objc_msgSend_errorViewController(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "errorViewController");
}

id objc_msgSend_errorWithDomain_code_userInfo_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "errorWithDomain:code:userInfo:");
}

id objc_msgSend_errorWithSafeUserInfo_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "errorWithSafeUserInfo:");
}

id objc_msgSend_events(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "events");
}

id objc_msgSend_extension(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "extension");
}

id objc_msgSend_extensionProxy(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "extensionProxy");
}

id objc_msgSend_extensionRequest(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "extensionRequest");
}

id objc_msgSend_extensionsWithMatchingAttributes_completion_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "extensionsWithMatchingAttributes:completion:");
}

id objc_msgSend_financeInterruptionResolved_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "financeInterruptionResolved:");
}

id objc_msgSend_finishExtension(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "finishExtension");
}

id objc_msgSend_finishWithResponse_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "finishWithResponse:");
}

id objc_msgSend_finishWithResult_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "finishWithResult:error:");
}

id objc_msgSend_firstObject(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "firstObject");
}

id objc_msgSend_firstViewController(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "firstViewController");
}

id objc_msgSend_floatValue(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "floatValue");
}

id objc_msgSend_fontDescriptorWithSymbolicTraits_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "fontDescriptorWithSymbolicTraits:");
}

id objc_msgSend_fontWithDescriptor_size_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "fontWithDescriptor:size:");
}

id objc_msgSend_frame(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "frame");
}

id objc_msgSend_frozenBagValueWithKey_value_valueType_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "frozenBagValueWithKey:value:valueType:");
}

id objc_msgSend_functionWithControlPoints__::(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "functionWithControlPoints::::");
}

id objc_msgSend_getActivePortWithCompletion_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "getActivePortWithCompletion:");
}

id objc_msgSend_getNextAlertForClassName_completionBlock_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "getNextAlertForClassName:completionBlock:");
}

id objc_msgSend_handleAuthenticateRequest_resultHandler_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "handleAuthenticateRequest:resultHandler:");
}

id objc_msgSend_handleDialogRequest_resultHandler_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "handleDialogRequest:resultHandler:");
}

id objc_msgSend_handleEngagementRequest_resultHandler_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "handleEngagementRequest:resultHandler:");
}

id objc_msgSend_handleURL_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "handleURL:");
}

id objc_msgSend_hasEntitlement_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "hasEntitlement:");
}

id objc_msgSend_hasPrefix_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "hasPrefix:");
}

id objc_msgSend_hidesBackButton(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "hidesBackButton");
}

id objc_msgSend_horizontalSizeClass(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "horizontalSizeClass");
}

id objc_msgSend_host(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "host");
}

id objc_msgSend_hostApplicationBundleIdentifierOverride(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "hostApplicationBundleIdentifierOverride");
}

id objc_msgSend_hostedFeedbackSession(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "hostedFeedbackSession");
}

id objc_msgSend_iconDataForVariant_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "iconDataForVariant:");
}

id objc_msgSend_imageNamed_inBundle_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "imageNamed:inBundle:");
}

id objc_msgSend_imageWithCGImage_scale_orientation_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "imageWithCGImage:scale:orientation:");
}

id objc_msgSend_incidentId(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "incidentId");
}

id objc_msgSend_indexOfObject_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "indexOfObject:");
}

id objc_msgSend_infoDictionary(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "infoDictionary");
}

id objc_msgSend_initForContext_betaApplicationIdentifier_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initForContext:betaApplicationIdentifier:");
}

id objc_msgSend_initWithAccount_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithAccount:");
}

id objc_msgSend_initWithAccountIdentifier_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithAccountIdentifier:");
}

id objc_msgSend_initWithActionBlock_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithActionBlock:");
}

id objc_msgSend_initWithBackingAccount_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithBackingAccount:");
}

id objc_msgSend_initWithBag_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithBag:");
}

id objc_msgSend_initWithBag_URL_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithBag:URL:");
}

id objc_msgSend_initWithBag_account_clientInfo_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithBag:account:clientInfo:");
}

id objc_msgSend_initWithBag_caller_keyProfile_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithBag:caller:keyProfile:");
}

id objc_msgSend_initWithBarButtonSystemItem_target_action_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithBarButtonSystemItem:target:action:");
}

id objc_msgSend_initWithBundleId_productIdentifier_appName_productName_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithBundleId:productIdentifier:appName:productName:");
}

id objc_msgSend_initWithBundleIdentifier_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithBundleIdentifier:");
}

id objc_msgSend_initWithBytesNoCopy_length_freeWhenDone_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithBytesNoCopy:length:freeWhenDone:");
}

id objc_msgSend_initWithCapacity_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithCapacity:");
}

id objc_msgSend_initWithCharityIdentifier_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithCharityIdentifier:");
}

id objc_msgSend_initWithChildViewController_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithChildViewController:");
}

id objc_msgSend_initWithChildViewController_animated_presentationBounds_proxyHandler_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithChildViewController:animated:presentationBounds:proxyHandler:");
}

id objc_msgSend_initWithClientContext_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithClientContext:");
}

id objc_msgSend_initWithClientContextClass_options_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithClientContextClass:options:");
}

id objc_msgSend_initWithConfiguration_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithConfiguration:");
}

id objc_msgSend_initWithConfigurationDictionary_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithConfigurationDictionary:");
}

id objc_msgSend_initWithDialogDictionary_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithDialogDictionary:");
}

id objc_msgSend_initWithDictionary_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithDictionary:");
}

id objc_msgSend_initWithDomain_code_userInfo_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithDomain:code:userInfo:");
}

id objc_msgSend_initWithExternalAccountURL_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithExternalAccountURL:");
}

id objc_msgSend_initWithFrame_title_style_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithFrame:title:style:");
}

id objc_msgSend_initWithGift_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithGift:");
}

id objc_msgSend_initWithGiftCategory_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithGiftCategory:");
}

id objc_msgSend_initWithIdentifier_mediaResult_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithIdentifier:mediaResult:");
}

id objc_msgSend_initWithItem_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithItem:");
}

id objc_msgSend_initWithItemID_bundleID_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithItemID:bundleID:");
}

id objc_msgSend_initWithLookupDictionary_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithLookupDictionary:");
}

id objc_msgSend_initWithMachServiceName_options_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithMachServiceName:options:");
}

id objc_msgSend_initWithNibName_bundle_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithNibName:bundle:");
}

id objc_msgSend_initWithObjectsAndKeys_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithObjectsAndKeys:");
}

id objc_msgSend_initWithParameters_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithParameters:");
}

id objc_msgSend_initWithPresentedViewController_presentingViewController_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithPresentedViewController:presentingViewController:");
}

id objc_msgSend_initWithProductPageItem_clientContext_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithProductPageItem:clientContext:");
}

id objc_msgSend_initWithRedeemCategory_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithRedeemCategory:");
}

id objc_msgSend_initWithRemoteViewControllerProxy_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithRemoteViewControllerProxy:");
}

id objc_msgSend_initWithRequest_bag_presentingViewController_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithRequest:bag:presentingViewController:");
}

id objc_msgSend_initWithRootViewController_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithRootViewController:");
}

id objc_msgSend_initWithSafariViewController_proxyHandler_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithSafariViewController:proxyHandler:");
}

id objc_msgSend_initWithServiceName_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithServiceName:");
}

id objc_msgSend_initWithString_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithString:");
}

id objc_msgSend_initWithTabIdentifier_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithTabIdentifier:");
}

id objc_msgSend_initWithTerms_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithTerms:");
}

id objc_msgSend_initWithTitle_description_image_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithTitle:description:image:");
}

id objc_msgSend_initWithTitle_message_buttonTitle_actionBlock_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithTitle:message:buttonTitle:actionBlock:");
}

id objc_msgSend_initWithTitle_style_target_action_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithTitle:style:target:action:");
}

id objc_msgSend_initWithType_clientIdentifier_clientVersion_bag_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithType:clientIdentifier:clientVersion:bag:");
}

id objc_msgSend_initWithURL_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithURL:");
}

id objc_msgSend_initWithURL_resolvingAgainstBaseURL_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithURL:resolvingAgainstBaseURL:");
}

id objc_msgSend_initWithURLRequest_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithURLRequest:");
}

id objc_msgSend_initWithXPCConnection_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithXPCConnection:");
}

id objc_msgSend_initWithXPCEncoding_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithXPCEncoding:");
}

id objc_msgSend_initiateFeedbackSnapshot(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initiateFeedbackSnapshot");
}

id objc_msgSend_instancesRespondToSelector_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "instancesRespondToSelector:");
}

id objc_msgSend_instantiateWithExtension_completion_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "instantiateWithExtension:completion:");
}

id objc_msgSend_integerValue(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "integerValue");
}

id objc_msgSend_interfaceWithProtocol_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "interfaceWithProtocol:");
}

id objc_msgSend_invalidate(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "invalidate");
}

id objc_msgSend_invertedSet(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "invertedSet");
}

id objc_msgSend_isAskToBuy(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "isAskToBuy");
}

id objc_msgSend_isBeingPresented(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "isBeingPresented");
}

id objc_msgSend_isDeviceUnlocked(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "isDeviceUnlocked");
}

id objc_msgSend_isEnabled(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "isEnabled");
}

id objc_msgSend_isEqual_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "isEqual:");
}

id objc_msgSend_isEqualToString_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "isEqualToString:");
}

id objc_msgSend_isHidden(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "isHidden");
}

id objc_msgSend_isLoadable(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "isLoadable");
}

id objc_msgSend_isStoreServicesURL(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "isStoreServicesURL");
}

id objc_msgSend_isValid(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "isValid");
}

id objc_msgSend_isViewLoaded(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "isViewLoaded");
}

id objc_msgSend_itemDictionary(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "itemDictionary");
}

id objc_msgSend_itemFromItem_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "itemFromItem:");
}

id objc_msgSend_itemID(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "itemID");
}

id objc_msgSend_itemIdentifier(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "itemIdentifier");
}

id objc_msgSend_itemKind(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "itemKind");
}

id objc_msgSend_lastObject(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "lastObject");
}

id objc_msgSend_lastPathComponent(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "lastPathComponent");
}

id objc_msgSend_launchInfo(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "launchInfo");
}

id objc_msgSend_launchScreenHost_traitCollectionDidChange_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "launchScreenHost:traitCollectionDidChange:");
}

id objc_msgSend_launchViewController(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "launchViewController");
}

id objc_msgSend_layer(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "layer");
}

id objc_msgSend_leftBarButtonItems(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "leftBarButtonItems");
}

id objc_msgSend_leftItemsSupplementBackButton(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "leftItemsSupplementBackButton");
}

id objc_msgSend_length(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "length");
}

id objc_msgSend_loadApplicationWithOptions_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "loadApplicationWithOptions:");
}

id objc_msgSend_loadDidFinishWithResult_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "loadDidFinishWithResult:error:");
}

id objc_msgSend_loadFromBridgedNavigation(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "loadFromBridgedNavigation");
}

id objc_msgSend_loadPageWithURL_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "loadPageWithURL:");
}

id objc_msgSend_loadPlaceholder(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "loadPlaceholder");
}

id objc_msgSend_loadProductWithParameters_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "loadProductWithParameters:");
}

id objc_msgSend_loadProductWithRequest_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "loadProductWithRequest:");
}

id objc_msgSend_loadRequest_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "loadRequest:");
}

id objc_msgSend_loadReviewWithURL_completionBlock_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "loadReviewWithURL:completionBlock:");
}

id objc_msgSend_loadURL_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "loadURL:");
}

id objc_msgSend_loadURL_withCompletionBlock_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "loadURL:withCompletionBlock:");
}

id objc_msgSend_loadValueForKey_completionBlock_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "loadValueForKey:completionBlock:");
}

id objc_msgSend_localizedName(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "localizedName");
}

id objc_msgSend_localizedStringForKey_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "localizedStringForKey:");
}

id objc_msgSend_localizedStringForKey_inBundles_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "localizedStringForKey:inBundles:");
}

id objc_msgSend_localizedStringForKey_value_table_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "localizedStringForKey:value:table:");
}

id objc_msgSend_lock(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "lock");
}

id objc_msgSend_lookUpItemIDsForDeletableSystemAppsWithBundleIDs_reply_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "lookUpItemIDsForDeletableSystemAppsWithBundleIDs:reply:");
}

id objc_msgSend_lookupDictionary(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "lookupDictionary");
}

id objc_msgSend_mainBundle(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "mainBundle");
}

id objc_msgSend_mainScreen(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "mainScreen");
}

id objc_msgSend_makeKeyWindow(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "makeKeyWindow");
}

id objc_msgSend_mapTableWithKeyOptions_valueOptions_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "mapTableWithKeyOptions:valueOptions:");
}

id objc_msgSend_message(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "message");
}

id objc_msgSend_mutableCopy(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "mutableCopy");
}

id objc_msgSend_name(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "name");
}

id objc_msgSend_navigationBar(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "navigationBar");
}

id objc_msgSend_navigationController(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "navigationController");
}

id objc_msgSend_navigationItem(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "navigationItem");
}

id objc_msgSend_navigationItemOptionsFromViewController_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "navigationItemOptionsFromViewController:");
}

id objc_msgSend_navigationItemUpdated(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "navigationItemUpdated");
}

id objc_msgSend_newPlaceholderViewController(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "newPlaceholderViewController");
}

id objc_msgSend_null(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "null");
}

id objc_msgSend_numberWithBool_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "numberWithBool:");
}

id objc_msgSend_numberWithDouble_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "numberWithDouble:");
}

id objc_msgSend_numberWithFloat_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "numberWithFloat:");
}

id objc_msgSend_numberWithInteger_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "numberWithInteger:");
}

id objc_msgSend_numberWithLongLong_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "numberWithLongLong:");
}

id objc_msgSend_numberWithUnsignedInteger_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "numberWithUnsignedInteger:");
}

id objc_msgSend_object(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "object");
}

id objc_msgSend_objectAtIndex_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "objectAtIndex:");
}

id objc_msgSend_objectAtIndexedSubscript_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "objectAtIndexedSubscript:");
}

id objc_msgSend_objectEnumerator(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "objectEnumerator");
}

id objc_msgSend_objectForKey_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "objectForKey:");
}

id objc_msgSend_objectForKeyedSubscript_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "objectForKeyedSubscript:");
}

id objc_msgSend_openApplication_options_withResult_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "openApplication:options:withResult:");
}

id objc_msgSend_openURL_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "openURL:");
}

id objc_msgSend_options(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "options");
}

id objc_msgSend_overrideCreditCardPresentationWithCompletion_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "overrideCreditCardPresentationWithCompletion:");
}

id objc_msgSend_overrideRedeemCameraPerformAction_withObject_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "overrideRedeemCameraPerformAction:withObject:");
}

id objc_msgSend_overrideRedeemCameraWithCompletion_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "overrideRedeemCameraWithCompletion:");
}

id objc_msgSend_parentViewController(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "parentViewController");
}

id objc_msgSend_path(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "path");
}

id objc_msgSend_pathComponents(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "pathComponents");
}

id objc_msgSend_pendingMessages_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "pendingMessages:");
}

id objc_msgSend_perform(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "perform");
}

id objc_msgSend_performLookupWithBundleIdentifiers_itemIdentifiers_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "performLookupWithBundleIdentifiers:itemIdentifiers:");
}

id objc_msgSend_performRedeemOperationWithCode_cameraRecognized_completion_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "performRedeemOperationWithCode:cameraRecognized:completion:");
}

id objc_msgSend_performSelector_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "performSelector:");
}

id objc_msgSend_pinController(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "pinController");
}

id objc_msgSend_pinControllerShown(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "pinControllerShown");
}

id objc_msgSend_pluginKitProxyForIdentifier_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "pluginKitProxyForIdentifier:");
}

id objc_msgSend_popBridgedViewControllersToIndex_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "popBridgedViewControllersToIndex:");
}

id objc_msgSend_popoverPresentationController(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "popoverPresentationController");
}

id objc_msgSend_popoverSourceRect(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "popoverSourceRect");
}

id objc_msgSend_port(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "port");
}

id objc_msgSend_position(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "position");
}

id objc_msgSend_postNotificationName_object_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "postNotificationName:object:");
}

id objc_msgSend_postNotificationName_object_userInfo_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "postNotificationName:object:userInfo:");
}

id objc_msgSend_preferredContentSize(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "preferredContentSize");
}

id objc_msgSend_preferredContentSizeDidChange_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "preferredContentSizeDidChange:");
}

id objc_msgSend_preferredFontDescriptorWithTextStyle_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "preferredFontDescriptorWithTextStyle:");
}

id objc_msgSend_preloadConfigurationForPurpose_withCompletionBlock_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "preloadConfigurationForPurpose:withCompletionBlock:");
}

id objc_msgSend_prepareForLaunch(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "prepareForLaunch");
}

id objc_msgSend_presentAlertForDialog_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "presentAlertForDialog:");
}

id objc_msgSend_presentBridgedViewController(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "presentBridgedViewController");
}

id objc_msgSend_presentEngagement(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "presentEngagement");
}

id objc_msgSend_presentFromViewController_completion_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "presentFromViewController:completion:");
}

id objc_msgSend_presentViewController_animated_completion_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "presentViewController:animated:completion:");
}

id objc_msgSend_presentationBounds(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "presentationBounds");
}

id objc_msgSend_presentationController(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "presentationController");
}

id objc_msgSend_presentedViewController(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "presentedViewController");
}

id objc_msgSend_presentingBridgedViewController(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "presentingBridgedViewController");
}

id objc_msgSend_presentingViewController(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "presentingViewController");
}

id objc_msgSend_privacyControllerShown(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "privacyControllerShown");
}

id objc_msgSend_privacyControllerWithIdentifier_acknowledgementHandler_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "privacyControllerWithIdentifier:acknowledgementHandler:");
}

id objc_msgSend_privacyIdentifier(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "privacyIdentifier");
}

id objc_msgSend_productPageRemoteViewController_didTerminateWithError_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "productPageRemoteViewController:didTerminateWithError:");
}

id objc_msgSend_productPageRemoteViewController_finishWithResult_completion_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "productPageRemoteViewController:finishWithResult:completion:");
}

id objc_msgSend_productPageRemoteViewController_userDidInteractWithProduct_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "productPageRemoteViewController:userDidInteractWithProduct:");
}

id objc_msgSend_productPageRemoteViewControllerLoadDidFinish_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "productPageRemoteViewControllerLoadDidFinish:");
}

id objc_msgSend_productPageStyle(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "productPageStyle");
}

id objc_msgSend_productParameters(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "productParameters");
}

id objc_msgSend_productURL(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "productURL");
}

id objc_msgSend_profileValidated(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "profileValidated");
}

id objc_msgSend_prompt(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "prompt");
}

id objc_msgSend_promptForStarRating(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "promptForStarRating");
}

id objc_msgSend_propertyListWithData_options_format_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "propertyListWithData:options:format:error:");
}

id objc_msgSend_proxyHandler(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "proxyHandler");
}

id objc_msgSend_pushBridgedViewController_animated_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "pushBridgedViewController:animated:");
}

id objc_msgSend_pushBridgedViewControllerAnimated_options_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "pushBridgedViewControllerAnimated:options:");
}

id objc_msgSend_queryItems(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "queryItems");
}

id objc_msgSend_rating(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "rating");
}

id objc_msgSend_receivedStatuses_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "receivedStatuses:");
}

id objc_msgSend_receivedTransactions_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "receivedTransactions:");
}

id objc_msgSend_receiverEndpoint(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "receiverEndpoint");
}

id objc_msgSend_redeemCameraScriptObject(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "redeemCameraScriptObject");
}

id objc_msgSend_registerBagKeySet_forProfile_profileVersion_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "registerBagKeySet:forProfile:profileVersion:");
}

id objc_msgSend_registeredHostBundleId(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "registeredHostBundleId");
}

id objc_msgSend_reloadWithStorePage_forURL_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "reloadWithStorePage:forURL:");
}

id objc_msgSend_remoteContainerViewController(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "remoteContainerViewController");
}

id objc_msgSend_remoteLoadDidFinishCompletion(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "remoteLoadDidFinishCompletion");
}

id objc_msgSend_remoteObjectProxyWithErrorHandler_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "remoteObjectProxyWithErrorHandler:");
}

id objc_msgSend_remoteViewController(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "remoteViewController");
}

id objc_msgSend_removeAllAnimations(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "removeAllAnimations");
}

id objc_msgSend_removeAllContainerViewControllers(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "removeAllContainerViewControllers");
}

id objc_msgSend_removeAllObjects(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "removeAllObjects");
}

id objc_msgSend_removeFromParentViewController(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "removeFromParentViewController");
}

id objc_msgSend_removeFromSuperview(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "removeFromSuperview");
}

id objc_msgSend_removeObject_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "removeObject:");
}

id objc_msgSend_removeObjectAtIndex_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "removeObjectAtIndex:");
}

id objc_msgSend_removeObjectForKey_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "removeObjectForKey:");
}

id objc_msgSend_removeObjectIdenticalTo_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "removeObjectIdenticalTo:");
}

id objc_msgSend_removeObjectsInRange_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "removeObjectsInRange:");
}

id objc_msgSend_removeObserver_name_object_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "removeObserver:name:object:");
}

id objc_msgSend_removeSavedViewController(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "removeSavedViewController");
}

id objc_msgSend_removedEntitlementsForProductIdentifiers_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "removedEntitlementsForProductIdentifiers:");
}

id objc_msgSend_removedTransactions_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "removedTransactions:");
}

id objc_msgSend_requestWithURL_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "requestWithURL:");
}

id objc_msgSend_requestWithURL_cachePolicy_timeoutInterval_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "requestWithURL:cachePolicy:timeoutInterval:");
}

id objc_msgSend_responseWithInfo_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "responseWithInfo:");
}

id objc_msgSend_resume(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "resume");
}

id objc_msgSend_resumeApplicationWithOptions_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "resumeApplicationWithOptions:");
}

id objc_msgSend_reviewInAppController(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "reviewInAppController");
}

id objc_msgSend_rightBarButtonItem(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "rightBarButtonItem");
}

id objc_msgSend_rightBarButtonItems(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "rightBarButtonItems");
}

id objc_msgSend_rootViewController(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "rootViewController");
}

id objc_msgSend_saveViewController_animated_presentationBounds_proxyHandler_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "saveViewController:animated:presentationBounds:proxyHandler:");
}

id objc_msgSend_savedViewController(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "savedViewController");
}

id objc_msgSend_scale(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "scale");
}

id objc_msgSend_scheme(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "scheme");
}

id objc_msgSend_scrollView(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "scrollView");
}

id objc_msgSend_send_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "send:");
}

id objc_msgSend_sendAppPreviewStateChanged_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "sendAppPreviewStateChanged:");
}

id objc_msgSend_sendEvent_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "sendEvent:");
}

id objc_msgSend_sendMessage_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "sendMessage:");
}

id objc_msgSend_sendMessage_withReply_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "sendMessage:withReply:");
}

id objc_msgSend_sendResponse_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "sendResponse:");
}

id objc_msgSend_serviceProductPageViewControllerClientProxy(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "serviceProductPageViewControllerClientProxy");
}

id objc_msgSend_serviceProductPageViewControllerFinishWithResult_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "serviceProductPageViewControllerFinishWithResult:");
}

id objc_msgSend_serviceViewControllerProxy(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "serviceViewControllerProxy");
}

id objc_msgSend_setAccessibilityIgnoresInvertColors_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setAccessibilityIgnoresInvertColors:");
}

id objc_msgSend_setAccount_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setAccount:");
}

id objc_msgSend_setAcknowledgementReceived_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setAcknowledgementReceived:");
}

id objc_msgSend_setAction_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setAction:");
}

id objc_msgSend_setActiveConfiguration_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setActiveConfiguration:");
}

id objc_msgSend_setAdNetworkId_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setAdNetworkId:");
}

id objc_msgSend_setAllowsAlertItems_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setAllowsAlertItems:");
}

id objc_msgSend_setAllowsAlertStacking_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setAllowsAlertStacking:");
}

id objc_msgSend_setAllowsBanners_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setAllowsBanners:");
}

id objc_msgSend_setAllowsMenuButtonDismissal_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setAllowsMenuButtonDismissal:");
}

id objc_msgSend_setAppAdamId_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setAppAdamId:");
}

id objc_msgSend_setAskToBuy_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setAskToBuy:");
}

id objc_msgSend_setAttempsAutomaticRedeem_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setAttempsAutomaticRedeem:");
}

id objc_msgSend_setAttributionSignature_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setAttributionSignature:");
}

id objc_msgSend_setAuthenticationContext_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setAuthenticationContext:");
}

id objc_msgSend_setAutoresizingMask_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setAutoresizingMask:");
}

id objc_msgSend_setBackButtonTitle_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setBackButtonTitle:");
}

id objc_msgSend_setBackgroundColor_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setBackgroundColor:");
}

id objc_msgSend_setBridgedNavigation_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setBridgedNavigation:");
}

id objc_msgSend_setBridgedNavigationItemWithOptions_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setBridgedNavigationItemWithOptions:");
}

id objc_msgSend_setButtonAction_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setButtonAction:");
}

id objc_msgSend_setButtonTitle_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setButtonTitle:");
}

id objc_msgSend_setCameraDelegate_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setCameraDelegate:");
}

id objc_msgSend_setCampaignId_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setCampaignId:");
}

id objc_msgSend_setCategory_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setCategory:error:");
}

id objc_msgSend_setChildViewController_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setChildViewController:");
}

id objc_msgSend_setClasses_forSelector_argumentIndex_ofReply_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setClasses:forSelector:argumentIndex:ofReply:");
}

id objc_msgSend_setClientContext_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setClientContext:");
}

id objc_msgSend_setClientIdentifier_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setClientIdentifier:");
}

id objc_msgSend_setClientInfo_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setClientInfo:");
}

id objc_msgSend_setClientInterface_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setClientInterface:");
}

id objc_msgSend_setCompletion_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setCompletion:");
}

id objc_msgSend_setCompletionWithItemsHandler_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setCompletionWithItemsHandler:");
}

id objc_msgSend_setConfigurationActions_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setConfigurationActions:");
}

id objc_msgSend_setConsentProvided_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setConsentProvided:");
}

id objc_msgSend_setContainerNavigationController_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setContainerNavigationController:");
}

id objc_msgSend_setContentViewController_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setContentViewController:");
}

id objc_msgSend_setDamping_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setDamping:");
}

id objc_msgSend_setData_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setData:");
}

id objc_msgSend_setDelegate_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setDelegate:");
}

id objc_msgSend_setDesiredHardwareButtonEvents_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setDesiredHardwareButtonEvents:");
}

id objc_msgSend_setDesiredPresentationStyle_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setDesiredPresentationStyle:");
}

id objc_msgSend_setDidAcceptPINAction_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setDidAcceptPINAction:");
}

id objc_msgSend_setDidContinueAction_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setDidContinueAction:");
}

id objc_msgSend_setDidProvideConsentAction_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setDidProvideConsentAction:");
}

id objc_msgSend_setDisconnectBlock_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setDisconnectBlock:");
}

id objc_msgSend_setDismissHandlerForDefaultButton_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setDismissHandlerForDefaultButton:");
}

id objc_msgSend_setDismissalAnimationStyle_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setDismissalAnimationStyle:");
}

id objc_msgSend_setDisplaysOnLockScreen_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setDisplaysOnLockScreen:");
}

id objc_msgSend_setDuration_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setDuration:");
}

id objc_msgSend_setEditPaneClass_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setEditPaneClass:");
}

id objc_msgSend_setEmbeddedParent_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setEmbeddedParent:");
}

id objc_msgSend_setEnabled_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setEnabled:");
}

id objc_msgSend_setErrorViewController_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setErrorViewController:");
}

id objc_msgSend_setExpirationDate_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setExpirationDate:");
}

id objc_msgSend_setExportedInterface_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setExportedInterface:");
}

id objc_msgSend_setExportedObject_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setExportedObject:");
}

id objc_msgSend_setExtension_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setExtension:");
}

id objc_msgSend_setExtensionRequest_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setExtensionRequest:");
}

id objc_msgSend_setFillMode_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setFillMode:");
}

id objc_msgSend_setFont_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setFont:");
}

id objc_msgSend_setFrame_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setFrame:");
}

id objc_msgSend_setFromValue_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setFromValue:");
}

id objc_msgSend_setHidden_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setHidden:");
}

id objc_msgSend_setHidesBackButton_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setHidesBackButton:");
}

id objc_msgSend_setHostApplicationIdentifier_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setHostApplicationIdentifier:");
}

id objc_msgSend_setHostedFeedbackSession_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setHostedFeedbackSession:");
}

id objc_msgSend_setIcon_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setIcon:");
}

id objc_msgSend_setIdleTimerDisabled_forReason_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setIdleTimerDisabled:forReason:");
}

id objc_msgSend_setIgnoreDefaultKeyboardNotifications_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setIgnoreDefaultKeyboardNotifications:");
}

id objc_msgSend_setImage_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setImage:");
}

id objc_msgSend_setImpressionId_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setImpressionId:");
}

id objc_msgSend_setInitialCode_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setInitialCode:");
}

id objc_msgSend_setInterface_forSelector_argumentIndex_ofReply_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setInterface:forSelector:argumentIndex:ofReply:");
}

id objc_msgSend_setInterruptionHandler_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setInterruptionHandler:");
}

id objc_msgSend_setInvalidationHandler_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setInvalidationHandler:");
}

id objc_msgSend_setIsAskToBuy_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setIsAskToBuy:");
}

id objc_msgSend_setIsNativeVisionApp_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setIsNativeVisionApp:");
}

id objc_msgSend_setItemID_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setItemID:");
}

id objc_msgSend_setItemIdentifiers_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setItemIdentifiers:");
}

id objc_msgSend_setKeyProfile_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setKeyProfile:");
}

id objc_msgSend_setLaunchViewController_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setLaunchViewController:");
}

id objc_msgSend_setLaunchingInterfaceOrientation_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setLaunchingInterfaceOrientation:");
}

id objc_msgSend_setLeftBarButtonItem_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setLeftBarButtonItem:");
}

id objc_msgSend_setLeftBarButtonItem_animated_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setLeftBarButtonItem:animated:");
}

id objc_msgSend_setLeftBarButtonItems_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setLeftBarButtonItems:");
}

id objc_msgSend_setLeftBarButtonItems_animated_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setLeftBarButtonItems:animated:");
}

id objc_msgSend_setLeftItemsSupplementBackButton_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setLeftItemsSupplementBackButton:");
}

id objc_msgSend_setLocalStoragePath_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setLocalStoragePath:");
}

id objc_msgSend_setLogKey_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setLogKey:");
}

id objc_msgSend_setMass_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setMass:");
}

id objc_msgSend_setMessage_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setMessage:");
}

id objc_msgSend_setMessageBlock_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setMessageBlock:");
}

id objc_msgSend_setModalPresentationStyle_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setModalPresentationStyle:");
}

id objc_msgSend_setModalTransitionStyle_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setModalTransitionStyle:");
}

id objc_msgSend_setNavigationBarHidden_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setNavigationBarHidden:");
}

id objc_msgSend_setNeedsLayout(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setNeedsLayout");
}

id objc_msgSend_setNumberOfLines_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setNumberOfLines:");
}

id objc_msgSend_setObject_forKey_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setObject:forKey:");
}

id objc_msgSend_setObject_forKeyedSubscript_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setObject:forKeyedSubscript:");
}

id objc_msgSend_setObject_forSetting_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setObject:forSetting:");
}

id objc_msgSend_setOpaque_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setOpaque:");
}

id objc_msgSend_setOptions_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setOptions:");
}

id objc_msgSend_setOutputBlock_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setOutputBlock:");
}

id objc_msgSend_setOverrideCampaignLimit_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setOverrideCampaignLimit:");
}

id objc_msgSend_setPageRenderMetricsEnabled_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setPageRenderMetricsEnabled:");
}

id objc_msgSend_setPermittedArrowDirections_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setPermittedArrowDirections:");
}

id objc_msgSend_setPinController_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setPinController:");
}

id objc_msgSend_setPinControllerShown_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setPinControllerShown:");
}

id objc_msgSend_setPinDelegate_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setPinDelegate:");
}

id objc_msgSend_setPlaceholderViewController_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setPlaceholderViewController:");
}

id objc_msgSend_setPlatform_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setPlatform:");
}

id objc_msgSend_setPopoverSourceRect_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setPopoverSourceRect:");
}

id objc_msgSend_setPreferredContentSize_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setPreferredContentSize:");
}

id objc_msgSend_setPreferredStyle_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setPreferredStyle:");
}

id objc_msgSend_setPresentedAccountViewController_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setPresentedAccountViewController:");
}

id objc_msgSend_setPresentingBridgedViewController_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setPresentingBridgedViewController:");
}

id objc_msgSend_setPreview_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setPreview:");
}

id objc_msgSend_setPrivacyControllerShown_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setPrivacyControllerShown:");
}

id objc_msgSend_setPrivacyIdentifier_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setPrivacyIdentifier:");
}

id objc_msgSend_setProcessInfo_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setProcessInfo:");
}

id objc_msgSend_setProductPageDictionary_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setProductPageDictionary:");
}

id objc_msgSend_setProductPageStyle_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setProductPageStyle:");
}

id objc_msgSend_setProductParameters_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setProductParameters:");
}

id objc_msgSend_setProductURL_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setProductURL:");
}

id objc_msgSend_setProfile_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setProfile:");
}

id objc_msgSend_setProfileVersion_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setProfileVersion:");
}

id objc_msgSend_setPrompt_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setPrompt:");
}

id objc_msgSend_setProperty_forKey_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setProperty:forKey:");
}

id objc_msgSend_setProxyHandler_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setProxyHandler:");
}

id objc_msgSend_setPurchaseReferrerURL_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setPurchaseReferrerURL:");
}

id objc_msgSend_setRating_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setRating:");
}

id objc_msgSend_setReachabilityDisabled_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setReachabilityDisabled:");
}

id objc_msgSend_setRedeemCameraScriptObject_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setRedeemCameraScriptObject:");
}

id objc_msgSend_setReferrer_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setReferrer:");
}

id objc_msgSend_setReferrerApplicationName_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setReferrerApplicationName:");
}

id objc_msgSend_setRegisteredHostBundleId_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setRegisteredHostBundleId:");
}

id objc_msgSend_setRemoteContainerViewController_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setRemoteContainerViewController:");
}

id objc_msgSend_setRemoteLoadDidFinishCompletion_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setRemoteLoadDidFinishCompletion:");
}

id objc_msgSend_setRemoteObjectInterface_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setRemoteObjectInterface:");
}

id objc_msgSend_setRemoteViewController_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setRemoteViewController:");
}

id objc_msgSend_setResponseBlock_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setResponseBlock:");
}

id objc_msgSend_setResponseConnection_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setResponseConnection:");
}

id objc_msgSend_setReviewInAppController_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setReviewInAppController:");
}

id objc_msgSend_setRightBarButtonItem_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setRightBarButtonItem:");
}

id objc_msgSend_setRightBarButtonItem_animated_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setRightBarButtonItem:animated:");
}

id objc_msgSend_setRightBarButtonItems_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setRightBarButtonItems:");
}

id objc_msgSend_setSandboxed_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setSandboxed:");
}

id objc_msgSend_setSavedViewController_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setSavedViewController:");
}

id objc_msgSend_setScheme_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setScheme:");
}

id objc_msgSend_setShouldDismissOnUILock_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setShouldDismissOnUILock:");
}

id objc_msgSend_setShouldShowOnboarding_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setShouldShowOnboarding:");
}

id objc_msgSend_setShouldSignRequests_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setShouldSignRequests:");
}

id objc_msgSend_setShouldUseAMS_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setShouldUseAMS:");
}

id objc_msgSend_setShowAccountGlyph_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setShowAccountGlyph:");
}

id objc_msgSend_setShowDialogOnError_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setShowDialogOnError:");
}

id objc_msgSend_setShowsLinkToUnifiedAbout_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setShowsLinkToUnifiedAbout:");
}

id objc_msgSend_setShowsRightBarButton_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setShowsRightBarButton:");
}

id objc_msgSend_setShowsStoreButton_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setShowsStoreButton:");
}

id objc_msgSend_setSourceAppAdamId_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setSourceAppAdamId:");
}

id objc_msgSend_setSourceAppBundleId_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setSourceAppBundleId:");
}

id objc_msgSend_setSourceRect_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setSourceRect:");
}

id objc_msgSend_setSourceView_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setSourceView:");
}

id objc_msgSend_setSpecifier_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setSpecifier:");
}

id objc_msgSend_setSplashNavigationController_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setSplashNavigationController:");
}

id objc_msgSend_setStiffness_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setStiffness:");
}

id objc_msgSend_setStyle_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setStyle:");
}

id objc_msgSend_setSwipeDismissalStyle_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setSwipeDismissalStyle:");
}

id objc_msgSend_setTabBarItems_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setTabBarItems:");
}

id objc_msgSend_setTag_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setTag:");
}

id objc_msgSend_setTarget_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setTarget:");
}

id objc_msgSend_setText_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setText:");
}

id objc_msgSend_setTextAlignment_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setTextAlignment:");
}

id objc_msgSend_setTextColor_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setTextColor:");
}

id objc_msgSend_setTimestamp_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setTimestamp:");
}

id objc_msgSend_setTimingFunction_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setTimingFunction:");
}

id objc_msgSend_setTintColor_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setTintColor:");
}

id objc_msgSend_setTitle_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setTitle:");
}

id objc_msgSend_setTitleView_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setTitleView:");
}

id objc_msgSend_setTransitioningDelegate_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setTransitioningDelegate:");
}

id objc_msgSend_setTranslatesAutoresizingMaskIntoConstraints_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setTranslatesAutoresizingMaskIntoConstraints:");
}

id objc_msgSend_setURL_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setURL:");
}

id objc_msgSend_setURLString_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setURLString:");
}

id objc_msgSend_setUnderlyingViewController_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setUnderlyingViewController:");
}

id objc_msgSend_setUserInteractionEnabled_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setUserInteractionEnabled:");
}

id objc_msgSend_setValue_forRequestParameter_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setValue:forRequestParameter:");
}

id objc_msgSend_setVelocity_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setVelocity:");
}

id objc_msgSend_setVersion_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setVersion:");
}

id objc_msgSend_setView_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setView:");
}

id objc_msgSend_setViewController_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setViewController:");
}

id objc_msgSend_setViewControllerFactory_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setViewControllerFactory:");
}

id objc_msgSend_setViewControllerShown_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setViewControllerShown:");
}

id objc_msgSend_setVisibleInClientWindow_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setVisibleInClientWindow:");
}

id objc_msgSend_setWallpaperTunnelActive_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setWallpaperTunnelActive:");
}

id objc_msgSend_setWithObjects_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setWithObjects:");
}

id objc_msgSend_setupWithClientBundleID_bagType_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setupWithClientBundleID:bagType:");
}

id objc_msgSend_setupWithContainerViewController_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setupWithContainerViewController:");
}

id objc_msgSend_setupWithParameters_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setupWithParameters:");
}

id objc_msgSend_shakeTitleView(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "shakeTitleView");
}

id objc_msgSend_shared(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "shared");
}

id objc_msgSend_sharedApplication(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "sharedApplication");
}

id objc_msgSend_sharedConfig(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "sharedConfig");
}

id objc_msgSend_sharedController(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "sharedController");
}

id objc_msgSend_sharedDaemonConfig(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "sharedDaemonConfig");
}

id objc_msgSend_sharedInstance(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "sharedInstance");
}

id objc_msgSend_sharedService(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "sharedService");
}

id objc_msgSend_sharedSession(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "sharedSession");
}

id objc_msgSend_shouldHandleSafariScriptURL_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "shouldHandleSafariScriptURL:");
}

id objc_msgSend_shouldLog(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "shouldLog");
}

id objc_msgSend_shouldLogToDisk(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "shouldLogToDisk");
}

id objc_msgSend_shouldShowOnboarding(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "shouldShowOnboarding");
}

id objc_msgSend_shouldUseAMS(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "shouldUseAMS");
}

id objc_msgSend_show(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "show");
}

id objc_msgSend_showAccountGlyph(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "showAccountGlyph");
}

id objc_msgSend_showErrorPageWithCompletion_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "showErrorPageWithCompletion:");
}

id objc_msgSend_showProductPageWithItemIdentifier_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "showProductPageWithItemIdentifier:");
}

id objc_msgSend_showViewController_sender_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "showViewController:sender:");
}

id objc_msgSend_sizeThatFits_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "sizeThatFits:");
}

id objc_msgSend_sizeToFit(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "sizeToFit");
}

id objc_msgSend_sleepForTimeInterval_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "sleepForTimeInterval:");
}

id objc_msgSend_sourceRect(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "sourceRect");
}

id objc_msgSend_sourceView(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "sourceView");
}

id objc_msgSend_splashDoneButtonPressed_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "splashDoneButtonPressed:");
}

id objc_msgSend_splashNavigationController(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "splashNavigationController");
}

id objc_msgSend_splashPageWithBundleIdentifier_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "splashPageWithBundleIdentifier:");
}

id objc_msgSend_start(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "start");
}

id objc_msgSend_startWithCompletionBlock_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "startWithCompletionBlock:");
}

id objc_msgSend_startWithLookupBlock_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "startWithLookupBlock:");
}

id objc_msgSend_statusBarOrientation(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "statusBarOrientation");
}

id objc_msgSend_storeKitServiceWithErrorHandler_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "storeKitServiceWithErrorHandler:");
}

id objc_msgSend_stringByAppendingString_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "stringByAppendingString:");
}

id objc_msgSend_stringByTrimmingCharactersInSet_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "stringByTrimmingCharactersInSet:");
}

id objc_msgSend_stringValue(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "stringValue");
}

id objc_msgSend_stringWithCString_encoding_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "stringWithCString:encoding:");
}

id objc_msgSend_stringWithFormat_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "stringWithFormat:");
}

id objc_msgSend_style(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "style");
}

id objc_msgSend_su_bridgedNavigationItem(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "su_bridgedNavigationItem");
}

id objc_msgSend_su_setBridgedNavigationItem_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "su_setBridgedNavigationItem:");
}

id objc_msgSend_subarrayWithRange_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "subarrayWithRange:");
}

id objc_msgSend_superview(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "superview");
}

id objc_msgSend_synchonrizeContinainerViewControllers(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "synchonrizeContinainerViewControllers");
}

id objc_msgSend_synchronousRemoteObjectProxyWithErrorHandler_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "synchronousRemoteObjectProxyWithErrorHandler:");
}

id objc_msgSend_systemGroupedBackgroundColor(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "systemGroupedBackgroundColor");
}

id objc_msgSend_systemPinkColor(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "systemPinkColor");
}

id objc_msgSend_systemRedColor(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "systemRedColor");
}

id objc_msgSend_tag(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "tag");
}

id objc_msgSend_target(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "target");
}

id objc_msgSend_title(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "title");
}

id objc_msgSend_titleView(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "titleView");
}

id objc_msgSend_topViewController(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "topViewController");
}

id objc_msgSend_traitCollection(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "traitCollection");
}

id objc_msgSend_transitionCoordinator(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "transitionCoordinator");
}

id objc_msgSend_type(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "type");
}

id objc_msgSend_typeForURL_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "typeForURL:");
}

id objc_msgSend_unarchivedObjectOfClass_fromData_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "unarchivedObjectOfClass:fromData:error:");
}

id objc_msgSend_underlyingURL(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "underlyingURL");
}

id objc_msgSend_underlyingViewController(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "underlyingViewController");
}

id objc_msgSend_unlock(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "unlock");
}

id objc_msgSend_unsignedIntegerValue(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "unsignedIntegerValue");
}

id objc_msgSend_updatedTransactions_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "updatedTransactions:");
}

id objc_msgSend_urlByReplacingSchemeWithScheme_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "urlByReplacingSchemeWithScheme:");
}

id objc_msgSend_userDidInteractWithProduct_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "userDidInteractWithProduct:");
}

id objc_msgSend_userInfo(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "userInfo");
}

id objc_msgSend_userInterfaceIdiom(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "userInterfaceIdiom");
}

id objc_msgSend_value(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "value");
}

id objc_msgSend_valueForKey_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "valueForKey:");
}

id objc_msgSend_valueWithBytes_objCType_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "valueWithBytes:objCType:");
}

id objc_msgSend_valueWithRect_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "valueWithRect:");
}

id objc_msgSend_view(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "view");
}

id objc_msgSend_viewControllerFactory(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "viewControllerFactory");
}

id objc_msgSend_viewControllerForMediaType_completion_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "viewControllerForMediaType:completion:");
}

id objc_msgSend_viewControllerShown(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "viewControllerShown");
}

id objc_msgSend_viewWillTransitionToSize_withTransitionCoordinator_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "viewWillTransitionToSize:withTransitionCoordinator:");
}

id objc_msgSend_visibleInClientWindow(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "visibleInClientWindow");
}

id objc_msgSend_weakObjectsHashTable(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "weakObjectsHashTable");
}

id objc_msgSend_weakReferenceWithObject_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "weakReferenceWithObject:");
}

id objc_msgSend_webView(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "webView");
}

id objc_msgSend_webpageURL(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "webpageURL");
}

id objc_msgSend_whiteColor(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "whiteColor");
}

id objc_msgSend_willMoveToParentViewController_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "willMoveToParentViewController:");
}

id objc_msgSend_window(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "window");
}
