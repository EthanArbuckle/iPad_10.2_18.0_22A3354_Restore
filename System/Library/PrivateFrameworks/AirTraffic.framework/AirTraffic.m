os_log_t _ATLogCategoryFramework()
{
  return os_log_create("com.apple.amp.AirTraffic", "Framework");
}

void sub_20BB5EBFC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id *location)
{
  id *v14;
  id *v15;
  uint64_t v16;

  objc_destroyWeak(v15);
  objc_destroyWeak(v14);
  objc_destroyWeak(location);
  objc_destroyWeak((id *)(v16 - 128));
  _Unwind_Resume(a1);
}

os_log_t _ATLogCategoryXPC()
{
  return os_log_create("com.apple.amp.AirTraffic", "XPC");
}

_QWORD *__Copy(void *a1, uint64_t a2, void *a3)
{
  id *v5;
  _QWORD *v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  void *v12;

  v5 = a1;
  v6 = (_QWORD *)objc_msgSend((id)objc_msgSend(a3, "allocWithZone:", a2), "init");
  if (v6)
  {
    v7 = objc_msgSend(v5[1], "copyWithZone:", a2);
    v8 = (void *)v6[1];
    v6[1] = v7;

    v9 = objc_msgSend(v5[2], "copyWithZone:", a2);
    v10 = (void *)v6[2];
    v6[2] = v9;

    v11 = objc_msgSend(v5[3], "copyWithZone:", a2);
    v12 = (void *)v6[3];
    v6[3] = v11;

  }
  return v6;
}

void sub_20BB5F374(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  id *v14;

  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_20BB5F6F0(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_20BB5FA10(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_20BB5FA8C(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_20BB5FBF4(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_20BB5FD48(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_20BB605C4(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_20BB60744(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_20BB608C4(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

id ATStringWithArray(void *a1)
{
  id v1;
  void *v2;
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  uint64_t v7;

  v1 = a1;
  objc_msgSend(MEMORY[0x24BDD16A8], "stringWithString:", CFSTR("["));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "objectEnumerator");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "nextObject");
  v4 = objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    v5 = (void *)v4;
    do
    {
      if (objc_msgSend(v2, "length") != 1)
        objc_msgSend(v2, "appendString:", CFSTR(", "));
      objc_msgSend(v5, "description");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v2, "appendString:", v6);

      objc_msgSend(v3, "nextObject");
      v7 = objc_claimAutoreleasedReturnValue();

      v5 = (void *)v7;
    }
    while (v7);
  }
  objc_msgSend(v2, "appendString:", CFSTR("]"));

  return v2;
}

unint64_t ATGetPhysicalSizeForLogicalSize(uint64_t a1)
{
  uint64_t v2;
  NSObject *v3;
  uint8_t v5[16];
  statfs v6;
  uint64_t v7;

  v7 = *MEMORY[0x24BDAC8D0];
  v2 = __blockMask;
  if (!__blockMask)
  {
    memset(&v6, 0, 512);
    if (statfs((const char *)objc_msgSend(CFSTR("/var/mobile/Media/"), "UTF8String"), &v6))
    {
      v3 = os_log_create("com.apple.amp.AirTraffic", "Framework");
      if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)v5 = 0;
        _os_log_impl(&dword_20BB5D000, v3, OS_LOG_TYPE_DEFAULT, "Could not determine system block size", v5, 2u);
      }

      v2 = 4095;
    }
    else
    {
      v2 = v6.f_bsize - 1;
    }
    __blockMask = v2;
  }
  return ~(_DWORD)v2 & (unint64_t)(v2 + a1);
}

uint64_t ATGetDiskUsageForPath(void *a1)
{
  return ATGetUsageForPath(a1, 0);
}

uint64_t ATGetUsageForPath(void *a1, _DWORD *a2)
{
  id v3;
  void *v4;
  id v5;
  NSObject *v6;
  int *v7;
  char *v8;
  uint8_t buf[4];
  id v11;
  __int16 v12;
  char *v13;
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  v3 = a1;
  v4 = v3;
  if (v3)
  {
    v5 = objc_retainAutorelease(v3);
    objc_msgSend(v5, "UTF8String");
    if (dirstat_np() == -1)
    {
      v6 = os_log_create("com.apple.amp.AirTraffic", "Framework");
      if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      {
        v7 = __error();
        v8 = strerror(*v7);
        *(_DWORD *)buf = 138543618;
        v11 = v5;
        v12 = 2080;
        v13 = v8;
        _os_log_impl(&dword_20BB5D000, v6, OS_LOG_TYPE_ERROR, "ATGetUsageForPath encountered error. path=%{public}@ err=%s", buf, 0x16u);
      }

    }
    else if (a2)
    {
      *a2 = 0;
    }
  }

  return 0;
}

uint64_t ATGetLibrarianDocumentUsage(int a1, int a2, _QWORD *a3)
{
  dispatch_semaphore_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t i;
  uint64_t v7;
  void *v8;
  void *v9;
  int v10;
  int v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  unint64_t v16;
  void *v17;
  uint64_t v18;
  NSObject *v19;
  void *v21;
  uint64_t v25;
  uint64_t v26;
  id obj;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  uint64_t v32;
  uint64_t v33;
  void (*v34)(uint64_t, void *, void *);
  void *v35;
  dispatch_semaphore_t v36;
  uint64_t *v37;
  uint64_t *v38;
  uint64_t v39;
  uint64_t *v40;
  uint64_t v41;
  uint64_t (*v42)(uint64_t, uint64_t);
  void (*v43)(uint64_t);
  id v44;
  uint64_t v45;
  uint64_t *v46;
  uint64_t v47;
  uint64_t (*v48)(uint64_t, uint64_t);
  void (*v49)(uint64_t);
  id v50;
  uint8_t v51[128];
  uint8_t buf[4];
  id v53;
  uint64_t v54;

  v54 = *MEMORY[0x24BDAC8D0];
  v45 = 0;
  v46 = &v45;
  v47 = 0x3032000000;
  v48 = __Block_byref_object_copy_;
  v49 = __Block_byref_object_dispose_;
  v50 = 0;
  v39 = 0;
  v40 = &v39;
  v41 = 0x3032000000;
  v42 = __Block_byref_object_copy_;
  v43 = __Block_byref_object_dispose_;
  v44 = 0;
  v3 = dispatch_semaphore_create(0);
  v32 = MEMORY[0x24BDAC760];
  v33 = 3221225472;
  v34 = __ATGetLibrarianDocumentUsage_block_invoke;
  v35 = &unk_24C4C9A28;
  v37 = &v39;
  v38 = &v45;
  v36 = v3;
  BRGetTotalApplicationDocumentUsage();
  dispatch_semaphore_wait(v36, 0xFFFFFFFFFFFFFFFFLL);
  if (!v40[5])
  {
    objc_msgSend((id)v46[5], "description", v36);
    obj = (id)objc_claimAutoreleasedReturnValue();
    v19 = os_log_create("com.apple.amp.AirTraffic", "Framework");
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      v53 = obj;
      _os_log_impl(&dword_20BB5D000, v19, OS_LOG_TYPE_DEFAULT, "no usage info. err=%{public}@", buf, 0xCu);
    }

    goto LABEL_20;
  }
  v30 = 0u;
  v31 = 0u;
  v28 = 0u;
  v29 = 0u;
  obj = (id)v40[5];
  v4 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v28, v51, 16, v36);
  if (!v4)
  {
LABEL_20:
    v25 = 0;
    v26 = 0;
    goto LABEL_21;
  }
  v25 = 0;
  v26 = 0;
  v5 = *(_QWORD *)v29;
  do
  {
    for (i = 0; i != v4; ++i)
    {
      if (*(_QWORD *)v29 != v5)
        objc_enumerationMutation(obj);
      v7 = *(_QWORD *)(*((_QWORD *)&v28 + 1) + 8 * i);
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        objc_msgSend(MEMORY[0x24BDC1538], "applicationProxyForIdentifier:", v7);
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "applicationType");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        v10 = objc_msgSend(v9, "isEqualToString:", CFSTR("User"));

        if (v10)
          v11 = a1;
        else
          v11 = a2;
        if (v11 == 1)
        {
          objc_msgSend(v8, "bundleIdentifier");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend((id)v40[5], "objectForKey:", v12);
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v13, "valueForKey:", CFSTR("Total Size"));
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          v15 = objc_msgSend(v14, "unsignedLongLongValue");

          v16 = ATGetPhysicalSizeForLogicalSize(v15);
          objc_msgSend(v13, "valueForKey:", CFSTR("Document Count"));
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          v18 = objc_msgSend(v17, "unsignedLongLongValue");

          v26 += v16;
          v25 += v18;
        }

      }
    }
    v4 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v28, v51, 16);
  }
  while (v4);
LABEL_21:

  if (a3)
    *a3 = v25;

  _Block_object_dispose(&v39, 8);
  _Block_object_dispose(&v45, 8);

  return v26;
}

void sub_20BB61208(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,char a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,char a37)
{
  _Block_object_dispose(&a31, 8);
  _Block_object_dispose(&a37, 8);
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

uint64_t ATIsRecoverableError(void *a1)
{
  id v1;
  void *v2;
  unint64_t v3;
  uint64_t v4;
  unsigned int v5;

  v1 = a1;
  objc_msgSend(v1, "domain");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v1, "code");

  if (objc_msgSend(v2, "isEqualToString:", CFSTR("ATError")))
  {
    if (v3 >= 0x1A)
      v4 = 0;
    else
      v4 = (0x3154390u >> v3) & 1;
  }
  else
  {
    v5 = objc_msgSend(v2, "isEqualToString:", *MEMORY[0x24BDD1308]) ^ 1;
    if (v3 == -1100)
      v4 = v5;
    else
      v4 = 1;
  }

  return v4;
}

void ATReportEventIncrementingScalarKey(void *a1)
{
  id v1;
  uint64_t v2;
  void *v3;
  NSObject *v4;
  NSObject *v5;
  void *v6;
  void *v7;
  int v8;
  NSObject *v9;
  __int16 v10;
  id v11;
  uint64_t v12;
  _QWORD v13[2];

  v13[1] = *MEMORY[0x24BDAC8D0];
  v1 = a1;
  countKeyForScalarReportingEvent(v1);
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = (void *)v2;
  if (v1)
  {
    v12 = v2;
    v13[0] = &unk_24C4D1DA8;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v13, &v12, 1);
    v4 = objc_claimAutoreleasedReturnValue();
    AnalyticsSendEvent();
    v5 = os_log_create("com.apple.amp.AirTraffic", "Framework");
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      v8 = 138543618;
      v9 = v4;
      v10 = 2114;
      v11 = v1;
      _os_log_impl(&dword_20BB5D000, v5, OS_LOG_TYPE_DEFAULT, "Reporting payload=%{public}@ for %{public}@", (uint8_t *)&v8, 0x16u);
    }

  }
  else
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "void ATReportEventIncrementingScalarKey(NSString *__strong)");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "handleFailureInFunction:file:lineNumber:description:", v7, CFSTR("ATReporting.m"), 144, CFSTR("unable to find reporting key"));

    v4 = os_log_create("com.apple.amp.AirTraffic", "Framework");
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      v8 = 138543362;
      v9 = 0;
      _os_log_impl(&dword_20BB5D000, v4, OS_LOG_TYPE_DEFAULT, "Could not find reporting key for %{public}@", (uint8_t *)&v8, 0xCu);
    }
  }

}

id countKeyForScalarReportingEvent(void *a1)
{
  id v1;
  void *v2;
  void *v3;

  v1 = a1;
  v2 = v1;
  if (countKeyForScalarReportingEvent_onceToken != -1)
  {
    dispatch_once(&countKeyForScalarReportingEvent_onceToken, &__block_literal_global);
    if (v2)
      goto LABEL_3;
LABEL_5:
    v3 = 0;
    goto LABEL_6;
  }
  if (!v1)
    goto LABEL_5;
LABEL_3:
  objc_msgSend((id)countKeyForScalarReportingEvent_eventKeyToReportingEventMap, "objectForKey:", v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_6:

  return v3;
}

void __countKeyForScalarReportingEvent_block_invoke()
{
  uint64_t v0;
  void *v1;

  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjectsAndKeys:", CFSTR("ids_wakeupdelivery"), CFSTR("com.apple.atc.ids.wakeupdelivery"), CFSTR("ids_wakeupattempt"), CFSTR("com.apple.atc.ids.wakeupattempt"), CFSTR("ids_wakeupfailure"), CFSTR("com.apple.atc.ids.wakeupfailure"), CFSTR("ids_wakeuptimeout"), CFSTR("com.apple.atc.ids.wakeuptimeout"), CFSTR("storedownload_duration"), CFSTR("com.apple.atc.storedownload.duration"), CFSTR("storedownload_cancelled"), CFSTR("com.apple.atc.storedownload.cancelled"), CFSTR("storedownload_authfailure"), CFSTR("com.apple.atc.storedownload.authfailure"), CFSTR("storedownload_networkfailure"), CFSTR("com.apple.atc.storedownload.connectivityfailure"), CFSTR("storedownload_failure"),
    CFSTR("com.apple.atc.storedownload.failure"),
    CFSTR("storedownload_success"),
    CFSTR("com.apple.atc.storedownload.success"),
    CFSTR("storedownload_attempt"),
    CFSTR("com.apple.atc.storedownload.attempt"),
    CFSTR("asset_attempt"),
    CFSTR("com.apple.atc.asset.attempt"),
    CFSTR("asset_success"),
    CFSTR("com.apple.atc.asset.success"),
    CFSTR("asset_failure"),
    CFSTR("com.apple.atc.asset.failure"),
    CFSTR("asset_cancelled"),
    CFSTR("com.apple.atc.asset.cancelled"),
    CFSTR("itunessync_attempt"),
    CFSTR("com.apple.atc.sync_attempt"),
    CFSTR("itunessync_success"),
    CFSTR("com.apple.atc.sync_success"),
    CFSTR("itunessync_failure"),
    CFSTR("com.apple.atc.sync_failure"),
    CFSTR("devicesync_attempt"),
    CFSTR("com.apple.atc.devicesync.attempt"),
    CFSTR("devicesync_success"),
    CFSTR("com.apple.atc.devicesync.success"),
    CFSTR("devicesync_failure"),
    CFSTR("com.apple.atc.devicesync.failed"),
    CFSTR("devicesync_linkinitialize"),
    CFSTR("com.apple.atc.devicesync.linkinitialize"),
    CFSTR("com.apple.atc.sync.device.initial_delay"),
    CFSTR("com.apple.atc.devicesync.initialsyncdelay"),
    CFSTR("devicesync_smallreconcilerate"),
    CFSTR("com.apple.atc.devicesync.smallreconcilerate"),
    CFSTR("devicesync_largereconcilerate"),
    CFSTR("com.apple.atc.devicesync.largereconcilerate"),
    CFSTR("devicesync_smallassetrate"),
    CFSTR("com.apple.atc.devicesync.smallassetrate"),
    CFSTR("devicesync_largeassetrate"),
    CFSTR("devicesync_largeassetrate"),
    CFSTR("devicesync_assetcount"),
    CFSTR("com.apple.atc.devicesync.assetcount"),
    CFSTR("devicesync_assetsize"),
    CFSTR("com.apple.atc.devicesync.assetsize"),
    0);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)countKeyForScalarReportingEvent_eventKeyToReportingEventMap;
  countKeyForScalarReportingEvent_eventKeyToReportingEventMap = v0;

}

void ATReportEventAddDoubleToScalarKey(void *a1, double a2)
{
  void *v3;
  id v4;
  id v5;

  v3 = (void *)MEMORY[0x24BDD16E0];
  v4 = a1;
  objc_msgSend(v3, "numberWithDouble:", a2);
  v5 = (id)objc_claimAutoreleasedReturnValue();
  ATReportEventAddValueToScalarKey(v4, v5);

}

void ATReportEventAddValueToScalarKey(void *a1, void *a2)
{
  NSObject *v3;
  id v4;
  uint64_t v5;
  void *v6;
  NSObject *v7;
  NSObject *v8;
  int v9;
  NSObject *v10;
  __int16 v11;
  NSObject *v12;
  uint64_t v13;
  _QWORD v14[2];

  v14[1] = *MEMORY[0x24BDAC8D0];
  v3 = a1;
  v4 = a2;
  if (v3)
  {
    countKeyForScalarReportingEvent(v3);
    v5 = objc_claimAutoreleasedReturnValue();
    v6 = (void *)v5;
    if (v5)
    {
      v13 = v5;
      v14[0] = v4;
      objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v14, &v13, 1);
      v7 = objc_claimAutoreleasedReturnValue();
      AnalyticsSendEvent();
      v8 = os_log_create("com.apple.amp.AirTraffic", "Framework");
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      {
        v9 = 138543618;
        v10 = v7;
        v11 = 2114;
        v12 = v3;
        _os_log_impl(&dword_20BB5D000, v8, OS_LOG_TYPE_DEFAULT, "Reporting payload=%{public}@ for %{public}@", (uint8_t *)&v9, 0x16u);
      }

    }
    else
    {
      v7 = os_log_create("com.apple.amp.AirTraffic", "Framework");
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      {
        v9 = 138543362;
        v10 = v3;
        _os_log_impl(&dword_20BB5D000, v7, OS_LOG_TYPE_DEFAULT, "Could not find reporting key for %{public}@", (uint8_t *)&v9, 0xCu);
      }
    }

  }
}

void ATReportEventAddIntToScalarKey(void *a1, uint64_t a2)
{
  void *v3;
  id v4;
  id v5;

  v3 = (void *)MEMORY[0x24BDD16E0];
  v4 = a1;
  objc_msgSend(v3, "numberWithLongLong:", a2);
  v5 = (id)objc_claimAutoreleasedReturnValue();
  ATReportEventAddValueToScalarKey(v4, v5);

}

void sub_20BB62210(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__169(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__170(uint64_t a1)
{

}

void sub_20BB628F8(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_20BB641F4(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__264(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__265(uint64_t a1)
{

}

void sub_20BB66748(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_20BB66AC4(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_20BB66DB0(_Unwind_Exception *a1)
{
  uint64_t v1;

  _Block_object_dispose((const void *)(v1 - 112), 8);
  _Unwind_Resume(a1);
}

void sub_20BB670C4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,char a27)
{
  _Block_object_dispose(&a27, 8);
  _Unwind_Resume(a1);
}

void sub_20BB67338(_Unwind_Exception *a1)
{
  uint64_t v1;

  _Block_object_dispose((const void *)(v1 - 112), 8);
  _Unwind_Resume(a1);
}

uint64_t ATLogLevel()
{
  return 7;
}

void sub_20BB67C74(_Unwind_Exception *a1)
{
  uint64_t v1;

  _Block_object_dispose((const void *)(v1 - 96), 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__359(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__360(uint64_t a1)
{

}

os_log_t _ATLogCategoryDefault()
{
  return os_log_create("com.apple.amp.AirTraffic", "Default");
}

os_log_t _ATLogCategoryDefault_Oversize()
{
  return os_log_create("com.apple.amp.AirTraffic", "Default_Oversize");
}

os_log_t _ATLogCategoryFramework_Oversize()
{
  return os_log_create("com.apple.amp.AirTraffic", "Framework_Oversize");
}

os_log_t _ATLogCategoryiTunesSync()
{
  return os_log_create("com.apple.amp.AirTraffic", "iTunesSync");
}

os_log_t _ATLogCategoryiTunesSync_Oversize()
{
  return os_log_create("com.apple.amp.AirTraffic", "iTunesSync_Oversize");
}

os_log_t _ATLogCategoryDeviceSync()
{
  return os_log_create("com.apple.amp.AirTraffic", "DeviceSync");
}

os_log_t _ATLogCategoryDeviceSync_Oversize()
{
  return os_log_create("com.apple.amp.AirTraffic", "DeviceSync_Oversize");
}

os_log_t _ATLogCategoryRestore()
{
  return os_log_create("com.apple.amp.AirTraffic", "Restore");
}

os_log_t _ATLogCategoryRestore_Oversize()
{
  return os_log_create("com.apple.amp.AirTraffic", "Restore_Oversize");
}

os_log_t _ATLogCategoryStoreDownloads()
{
  return os_log_create("com.apple.amp.AirTraffic", "StoreDownloads");
}

os_log_t _ATLogCategoryStoreDownloads_Oversize()
{
  return os_log_create("com.apple.amp.AirTraffic", "StoreDownloads_Oversize");
}

os_log_t _ATLogCategoryWakeUp()
{
  return os_log_create("com.apple.amp.AirTraffic", "WakeUp");
}

os_log_t _ATLogCategoryWakeUp_Oversize()
{
  return os_log_create("com.apple.amp.AirTraffic", "WakeUp_Oversize");
}

os_log_t _ATLogCategorySettings()
{
  return os_log_create("com.apple.amp.AirTraffic", "Settings");
}

os_log_t _ATLogCategorySettings_Oversize()
{
  return os_log_create("com.apple.amp.AirTraffic", "Settings_Oversize");
}

os_log_t _ATLogCategoryMigrator()
{
  return os_log_create("com.apple.amp.AirTraffic", "Migrator");
}

os_log_t _ATLogCategoryMigrator_Oversize()
{
  return os_log_create("com.apple.amp.AirTraffic", "Migrator_Oversize");
}

os_log_t _ATLogCategorySyncBundle()
{
  return os_log_create("com.apple.amp.AirTraffic", "SyncBundle");
}

os_log_t _ATLogCategorySyncBundle_Oversize()
{
  return os_log_create("com.apple.amp.AirTraffic", "SyncBundle_Oversize");
}

os_log_t _ATLogCategoryXPC_Oversize()
{
  return os_log_create("com.apple.amp.AirTraffic", "XPC_Oversize");
}

os_log_t _ATLogCategoryDeprecated()
{
  return os_log_create("com.apple.amp.AirTraffic", "Deprecated");
}

os_log_t _ATLogCategoryDeprecated_Oversize()
{
  return os_log_create("com.apple.amp.AirTraffic", "Deprecated_Oversize");
}

os_log_t _ATLogCategoryAssetUtils()
{
  return os_log_create("com.apple.amp.AirTraffic", "AssetUtils");
}

os_log_t _ATLogCategoryAssetUtils_Oversize()
{
  return os_log_create("com.apple.amp.AirTraffic", "AssetUtils_Oversize");
}

void sub_20BB6ACC8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,id location)
{
  id *v22;

  objc_destroyWeak(v22);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_20BB6CD84(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  uint64_t v9;
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v9 - 96), 8);
  _Unwind_Resume(a1);
}

void sub_20BB6D694(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, ...)
{
  uint64_t v11;
  va_list va;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  va_list va1;

  va_start(va1, a10);
  va_start(va, a10);
  v11 = va_arg(va1, _QWORD);
  v13 = va_arg(va1, _QWORD);
  v14 = va_arg(va1, _QWORD);
  v15 = va_arg(va1, _QWORD);
  v16 = va_arg(va1, _QWORD);
  v17 = va_arg(va1, _QWORD);
  _Block_object_dispose(va, 8);
  _Block_object_dispose(va1, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__1073(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__1074(uint64_t a1)
{

}

void sub_20BB6F2A8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_20BB6F4FC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_list va;

  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_20BB6F634(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_20BB6F748(_Unwind_Exception *a1)
{
  uint64_t v1;

  _Block_object_dispose((const void *)(v1 - 48), 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__1137(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__1138(uint64_t a1)
{

}

uint64_t __Block_byref_object_copy__1285(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__1286(uint64_t a1)
{

}

void sub_20BB72B90(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_20BB72D7C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__1545(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__1546(uint64_t a1)
{

}

const char *_StringForXPCType(uint64_t a1)
{
  if (a1 == MEMORY[0x24BDACF88])
    return "XPC_TYPE_CONNECTION";
  if (a1 == MEMORY[0x24BDACFE0])
    return "XPC_TYPE_NULL";
  if (a1 == MEMORY[0x24BDACF80])
    return "XPC_TYPE_BOOL";
  if (a1 == MEMORY[0x24BDACFD0])
    return "XPC_TYPE_INT64";
  if (a1 == MEMORY[0x24BDACFF8])
    return "XPC_TYPE_UINT64";
  if (a1 == MEMORY[0x24BDACFA8])
    return "XPC_TYPE_DOUBLE";
  if (a1 == MEMORY[0x24BDACF98])
    return "XPC_TYPE_DATE";
  if (a1 == MEMORY[0x24BDACF90])
    return "XPC_TYPE_DATA";
  if (a1 == MEMORY[0x24BDACFF0])
    return "XPC_TYPE_STRING";
  if (a1 == MEMORY[0x24BDAD000])
    return "XPC_TYPE_UUID";
  if (a1 == MEMORY[0x24BDACFC0])
    return "XPC_TYPE_FD";
  if (a1 == MEMORY[0x24BDACFE8])
    return "XPC_TYPE_SHMEM";
  if (a1 == MEMORY[0x24BDACF78])
    return "XPC_TYPE_ARRAY";
  if (a1 == MEMORY[0x24BDACFA0])
    return "XPC_TYPE_DICTIONARY";
  if (a1 == MEMORY[0x24BDACFB8])
    return "XPC_TYPE_ERROR";
  return "Unknown type";
}

void sub_20BB73C1C(_Unwind_Exception *a1)
{
  id *v1;
  id *v2;
  id *v3;
  id *v4;
  id *v5;
  id *v6;
  uint64_t v7;

  objc_destroyWeak(v6);
  objc_destroyWeak(v5);
  objc_destroyWeak(v4);
  objc_destroyWeak(v3);
  objc_destroyWeak(v2);
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v7 - 112));
  objc_destroyWeak((id *)(v7 - 104));
  _Unwind_Resume(a1);
}

void sub_20BB73DD0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t AnalyticsSendEvent()
{
  return MEMORY[0x24BE1A1B0]();
}

uint64_t BRGetTotalApplicationDocumentUsage()
{
  return MEMORY[0x24BE17428]();
}

CFAbsoluteTime CFAbsoluteTimeGetCurrent(void)
{
  CFAbsoluteTime result;

  MEMORY[0x24BDBB780]();
  return result;
}

CFNotificationCenterRef CFNotificationCenterGetLocalCenter(void)
{
  return (CFNotificationCenterRef)MEMORY[0x24BDBC060]();
}

void CFNotificationCenterPostNotification(CFNotificationCenterRef center, CFNotificationName name, const void *object, CFDictionaryRef userInfo, Boolean deliverImmediately)
{
  MEMORY[0x24BDBC070](center, name, object, userInfo, deliverImmediately);
}

void CFRelease(CFTypeRef cf)
{
  MEMORY[0x24BDBC298](cf);
}

uint64_t MSVDeviceIsWatch()
{
  return MEMORY[0x24BE65B00]();
}

uint64_t MSVDeviceOSIsInternalInstall()
{
  return MEMORY[0x24BE65B08]();
}

NSUInteger NSPageSize(void)
{
  return MEMORY[0x24BDD1130]();
}

NSString *__cdecl NSStringFromClass(Class aClass)
{
  return (NSString *)MEMORY[0x24BDD1240](aClass);
}

void _Block_object_dispose(const void *a1, const int a2)
{
  MEMORY[0x24BDAC730](a1, *(_QWORD *)&a2);
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
  MEMORY[0x24BDAC780](exception_object);
}

int *__error(void)
{
  return (int *)MEMORY[0x24BDAC7D0]();
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x24BDACB90](dso, log, type, format, buf, *(_QWORD *)&size);
}

const char *__cdecl class_getName(Class cls)
{
  return (const char *)MEMORY[0x24BEDCEC0](cls);
}

int close(int a1)
{
  return MEMORY[0x24BDAD9D8](*(_QWORD *)&a1);
}

uint64_t dirstat_np()
{
  return MEMORY[0x24BDADC50]();
}

void dispatch_async(dispatch_queue_t queue, dispatch_block_t block)
{
  MEMORY[0x24BDADCC0](queue, block);
}

dispatch_queue_global_t dispatch_get_global_queue(intptr_t identifier, uintptr_t flags)
{
  return (dispatch_queue_global_t)MEMORY[0x24BDADDA8](identifier, flags);
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

intptr_t dispatch_group_wait(dispatch_group_t group, dispatch_time_t timeout)
{
  return MEMORY[0x24BDADDF0](group, timeout);
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
  MEMORY[0x24BDADE98](predicate, block);
}

dispatch_queue_t dispatch_queue_create(const char *label, dispatch_queue_attr_t attr)
{
  return (dispatch_queue_t)MEMORY[0x24BDADED0](label, attr);
}

void dispatch_resume(dispatch_object_t object)
{
  MEMORY[0x24BDADF18](object);
}

dispatch_semaphore_t dispatch_semaphore_create(intptr_t value)
{
  return (dispatch_semaphore_t)MEMORY[0x24BDADF28](value);
}

intptr_t dispatch_semaphore_signal(dispatch_semaphore_t dsema)
{
  return MEMORY[0x24BDADF30](dsema);
}

intptr_t dispatch_semaphore_wait(dispatch_semaphore_t dsema, dispatch_time_t timeout)
{
  return MEMORY[0x24BDADF38](dsema, timeout);
}

void dispatch_source_cancel(dispatch_source_t source)
{
  MEMORY[0x24BDADF68](source);
}

dispatch_source_t dispatch_source_create(dispatch_source_type_t type, uintptr_t handle, uintptr_t mask, dispatch_queue_t queue)
{
  return (dispatch_source_t)MEMORY[0x24BDADF70](type, handle, mask, queue);
}

uintptr_t dispatch_source_get_data(dispatch_source_t source)
{
  return MEMORY[0x24BDADF78](source);
}

void dispatch_source_set_cancel_handler(dispatch_source_t source, dispatch_block_t handler)
{
  MEMORY[0x24BDADFA0](source, handler);
}

void dispatch_source_set_event_handler(dispatch_source_t source, dispatch_block_t handler)
{
  MEMORY[0x24BDADFB0](source, handler);
}

void dispatch_source_set_timer(dispatch_source_t source, dispatch_time_t start, uint64_t interval, uint64_t leeway)
{
  MEMORY[0x24BDADFD0](source, start, interval, leeway);
}

void dispatch_sync(dispatch_queue_t queue, dispatch_block_t block)
{
  MEMORY[0x24BDADFE8](queue, block);
}

int dup(int a1)
{
  return MEMORY[0x24BDAE0B8](*(_QWORD *)&a1);
}

int fcntl(int a1, int a2, ...)
{
  return MEMORY[0x24BDAE2E8](*(_QWORD *)&a1, *(_QWORD *)&a2);
}

int fileno(FILE *a1)
{
  return MEMORY[0x24BDAE390](a1);
}

void free(void *a1)
{
  MEMORY[0x24BDAE450](a1);
}

uint64_t lockdown_copy_checkin_info()
{
  return MEMORY[0x24BEDC4E8]();
}

void *__cdecl malloc_type_malloc(size_t size, malloc_type_id_t type_id)
{
  return (void *)MEMORY[0x24BDAED78](size, type_id);
}

uint32_t notify_cancel(int token)
{
  return MEMORY[0x24BDAF138](*(_QWORD *)&token);
}

uint32_t notify_get_state(int token, uint64_t *state64)
{
  return MEMORY[0x24BDAF148](*(_QWORD *)&token, state64);
}

uint32_t notify_register_dispatch(const char *name, int *out_token, dispatch_queue_t queue, notify_handler_t handler)
{
  return MEMORY[0x24BDAF170](name, out_token, queue, handler);
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

void objc_exception_throw(id exception)
{
  MEMORY[0x24BEDD078](exception);
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

uint64_t objc_opt_new()
{
  return MEMORY[0x24BEDD148]();
}

uint64_t objc_opt_respondsToSelector()
{
  return MEMORY[0x24BEDD160]();
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

id objc_retainBlock(id a1)
{
  return (id)MEMORY[0x24BEDD2C0](a1);
}

void objc_setProperty_nonatomic_copy(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
  MEMORY[0x24BEDD408](self, _cmd, newValue, offset);
}

void objc_storeStrong(id *location, id obj)
{
  MEMORY[0x24BEDD410](location, obj);
}

id objc_storeWeak(id *location, id obj)
{
  return (id)MEMORY[0x24BEDD420](location, obj);
}

int objc_sync_enter(id obj)
{
  return MEMORY[0x24BEDD438](obj);
}

int objc_sync_exit(id obj)
{
  return MEMORY[0x24BEDD440](obj);
}

id objc_unsafeClaimAutoreleasedReturnValue(id a1)
{
  return (id)MEMORY[0x24BEDD458](a1);
}

os_log_t os_log_create(const char *subsystem, const char *category)
{
  return (os_log_t)MEMORY[0x24BDAF368](subsystem, category);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x24BDAF398](oslog, type);
}

ssize_t read(int a1, void *a2, size_t a3)
{
  return MEMORY[0x24BDAFA80](*(_QWORD *)&a1, a2, a3);
}

int statfs(const char *a1, statfs *a2)
{
  return MEMORY[0x24BDAFEB0](a1, a2);
}

char *__cdecl strerror(int __errnum)
{
  return (char *)MEMORY[0x24BDAFF18](*(_QWORD *)&__errnum);
}

FILE *tmpfile(void)
{
  return (FILE *)MEMORY[0x24BDB0268]();
}

ssize_t write(int __fd, const void *__buf, size_t __nbyte)
{
  return MEMORY[0x24BDB0558](*(_QWORD *)&__fd, __buf, __nbyte);
}

void xpc_connection_cancel(xpc_connection_t connection)
{
  MEMORY[0x24BDB0718](connection);
}

xpc_connection_t xpc_connection_create_mach_service(const char *name, dispatch_queue_t targetq, uint64_t flags)
{
  return (xpc_connection_t)MEMORY[0x24BDB0740](name, targetq, flags);
}

const char *__cdecl xpc_connection_get_name(xpc_connection_t connection)
{
  return (const char *)MEMORY[0x24BDB0778](connection);
}

void xpc_connection_resume(xpc_connection_t connection)
{
  MEMORY[0x24BDB0798](connection);
}

void xpc_connection_send_barrier(xpc_connection_t connection, dispatch_block_t barrier)
{
  MEMORY[0x24BDB07A0](connection, barrier);
}

void xpc_connection_send_message(xpc_connection_t connection, xpc_object_t message)
{
  MEMORY[0x24BDB07A8](connection, message);
}

void xpc_connection_send_message_with_reply(xpc_connection_t connection, xpc_object_t message, dispatch_queue_t replyq, xpc_handler_t handler)
{
  MEMORY[0x24BDB07B0](connection, message, replyq, handler);
}

void xpc_connection_set_event_handler(xpc_connection_t connection, xpc_handler_t handler)
{
  MEMORY[0x24BDB07C8](connection, handler);
}

void xpc_connection_set_target_queue(xpc_connection_t connection, dispatch_queue_t targetq)
{
  MEMORY[0x24BDB07E8](connection, targetq);
}

xpc_object_t xpc_data_create(const void *bytes, size_t length)
{
  return (xpc_object_t)MEMORY[0x24BDB0868](bytes, length);
}

xpc_object_t xpc_dictionary_create(const char *const *keys, xpc_object_t *values, size_t count)
{
  return (xpc_object_t)MEMORY[0x24BDB08C0](keys, values, count);
}

xpc_object_t xpc_dictionary_create_reply(xpc_object_t original)
{
  return (xpc_object_t)MEMORY[0x24BDB08D8](original);
}

const void *__cdecl xpc_dictionary_get_data(xpc_object_t xdict, const char *key, size_t *length)
{
  return (const void *)MEMORY[0x24BDB0918](xdict, key, length);
}

xpc_connection_t xpc_dictionary_get_remote_connection(xpc_object_t xdict)
{
  return (xpc_connection_t)MEMORY[0x24BDB0948](xdict);
}

const char *__cdecl xpc_dictionary_get_string(xpc_object_t xdict, const char *key)
{
  return (const char *)MEMORY[0x24BDB0950](xdict, key);
}

void xpc_dictionary_set_data(xpc_object_t xdict, const char *key, const void *bytes, size_t length)
{
  MEMORY[0x24BDB0988](xdict, key, bytes, length);
}

xpc_type_t xpc_get_type(xpc_object_t object)
{
  return (xpc_type_t)MEMORY[0x24BDB0A70](object);
}

xpc_object_t xpc_string_create(const char *string)
{
  return (xpc_object_t)MEMORY[0x24BDB0B80](string);
}

