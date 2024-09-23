id sub_100003178(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_hostDidTerminate");
}

void sub_1000032BC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  id *v14;

  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1000032E8(uint64_t a1, void *a2)
{
  id *v2;
  id v3;
  void *v4;
  id WeakRetained;

  v2 = (id *)(a1 + 32);
  v3 = a2;
  WeakRetained = objc_loadWeakRetained(v2);
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "objectForKeyedSubscript:", BKSApplicationStateKey));

  objc_msgSend(WeakRetained, "_hostApplicationStateDidChange:", objc_msgSend(v4, "integerValue"));
}

void sub_100003870(uint64_t a1)
{
  id v2;

  v2 = (id)objc_claimAutoreleasedReturnValue(+[NSError hk_error:description:](NSError, "hk_error:description:", 7, CFSTR("The user canceled request to recalibrate estimates.")));
  objc_msgSend(*(id *)(a1 + 32), "_finishWithError:", v2);

}

id sub_1000038C4(_QWORD *a1)
{
  uint64_t v1;
  uint64_t v2;
  void *v3;
  uint64_t v4;
  _QWORD v6[5];

  v2 = a1[4];
  v1 = a1[5];
  v3 = *(void **)(v2 + 8);
  v4 = a1[6];
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_10000392C;
  v6[3] = &unk_10000C3E0;
  v6[4] = v2;
  return objc_msgSend(v3, "recalibrateEstimatesForSampleType:effectiveDate:completion:", v1, v4, v6);
}

void sub_10000392C(uint64_t a1, uint64_t a2, void *a3)
{
  id v4;
  id v5;
  _QWORD v6[5];
  id v7;

  v4 = a3;
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_1000039AC;
  v6[3] = &unk_10000C3B8;
  v6[4] = *(_QWORD *)(a1 + 32);
  v7 = v4;
  v5 = v4;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, v6);

}

id sub_1000039AC(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_finishWithError:", *(_QWORD *)(a1 + 40));
}

uint64_t start(int a1, char **a2)
{
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  NSObject *v10;
  void *v11;
  void *v12;
  int v14;
  void *v15;

  v4 = objc_autoreleasePoolPush();
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor hk_appTintColor](UIColor, "hk_appTintColor"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[UIView appearance](UIView, "appearance"));
  objc_msgSend(v6, "setTintColor:", v5);

  v7 = UIApplicationMain(a1, a2, 0, 0);
  _HKInitializeLogging(v7, v8);
  v9 = (void *)HKLogAuthorization;
  if (os_log_type_enabled(HKLogAuthorization, OS_LOG_TYPE_DEFAULT))
  {
    v10 = v9;
    v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSProcessInfo processInfo](NSProcessInfo, "processInfo"));
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "processName"));
    v14 = 138543362;
    v15 = v12;
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "%{public}@ exiting", (uint8_t *)&v14, 0xCu);

  }
  objc_autoreleasePoolPop(v4);
  return v7;
}

int64_t sub_10000415C(id a1, HKVerifiableClinicalRecord *a2, HKVerifiableClinicalRecord *a3)
{
  HKVerifiableClinicalRecord *v4;
  void *v5;
  void *v6;
  id v7;

  v4 = a2;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[HKVerifiableClinicalRecord relevantDate](a3, "relevantDate"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[HKVerifiableClinicalRecord relevantDate](v4, "relevantDate"));

  v7 = objc_msgSend(v5, "compare:", v6);
  return (int64_t)v7;
}

int64_t sub_10000428C(id a1, HKVisionPrescription *a2, HKVisionPrescription *a3)
{
  HKVisionPrescription *v4;
  void *v5;
  void *v6;
  id v7;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[HKVisionPrescription dateIssued](a2, "dateIssued"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[HKVisionPrescription dateIssued](v4, "dateIssued"));

  v7 = objc_msgSend(v5, "compare:", v6);
  return (int64_t)v7;
}

BOOL sub_1000042F8(id a1, HKSample *a2, HKObjectAuthorizationRecord *a3)
{
  return -[HKObjectAuthorizationRecord status](a3, "status") == (id)2;
}

id sub_10000452C(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_hostDidTerminate");
}

void sub_100004670(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  id *v14;

  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_10000469C(uint64_t a1, void *a2)
{
  id *v2;
  id v3;
  void *v4;
  id WeakRetained;

  v2 = (id *)(a1 + 32);
  v3 = a2;
  WeakRetained = objc_loadWeakRetained(v2);
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "objectForKeyedSubscript:", BKSApplicationStateKey));

  objc_msgSend(WeakRetained, "_hostApplicationStateDidChange:", objc_msgSend(v4, "integerValue"));
}

void sub_1000048E8(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  id v5;
  _QWORD block[5];
  id v7;
  id v8;

  v3 = a2;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10000497C;
  block[3] = &unk_10000C4F0;
  v4 = *(void **)(a1 + 40);
  block[4] = *(_QWORD *)(a1 + 32);
  v7 = v4;
  v8 = v3;
  v5 = v3;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);

}

id sub_10000497C(uint64_t a1)
{
  id v2;
  uint64_t v3;
  id result;

  v3 = *(_QWORD *)(a1 + 32);
  v2 = *(id *)(a1 + 40);
  result = *(id *)(v3 + 48);
  if (result == v2)
    goto LABEL_5;
  if (v2)
  {
    result = objc_msgSend(result, "isEqual:");
    if ((_DWORD)result)
    {
      v3 = *(_QWORD *)(a1 + 32);
      result = *(id *)(v3 + 48);
LABEL_5:
      *(_QWORD *)(v3 + 48) = 0;

      return objc_msgSend(*(id *)(a1 + 32), "_finishWithError:", *(_QWORD *)(a1 + 48));
    }
  }
  return result;
}

void sub_1000049E0(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  _QWORD v5[5];
  id v6;

  v3 = a2;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_100004A60;
  v5[3] = &unk_10000C3B8;
  v5[4] = *(_QWORD *)(a1 + 32);
  v6 = v3;
  v4 = v3;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, v5);

}

id sub_100004A60(uint64_t a1)
{
  objc_storeStrong((id *)(*(_QWORD *)(a1 + 32) + 56), *(id *)(a1 + 40));
  return objc_msgSend(*(id *)(a1 + 32), "_configureNavigationController");
}

void sub_10000505C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  uint64_t v10;
  va_list va;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  va_list va1;

  va_start(va1, a9);
  va_start(va, a9);
  v10 = va_arg(va1, _QWORD);
  v12 = va_arg(va1, _QWORD);
  v13 = va_arg(va1, _QWORD);
  v14 = va_arg(va1, _QWORD);
  v15 = va_arg(va1, _QWORD);
  v16 = va_arg(va1, _QWORD);
  _Block_object_dispose(va, 8);
  _Block_object_dispose(va1, 8);
  _Unwind_Resume(a1);
}

uint64_t sub_100005094(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void sub_1000050A4(uint64_t a1)
{

}

void sub_1000050AC(uint64_t a1, void *a2, void *a3)
{
  id v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  id v11;

  v5 = a3;
  v6 = objc_claimAutoreleasedReturnValue(objc_msgSend(a2, "firstObject"));
  v7 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v8 = *(void **)(v7 + 40);
  *(_QWORD *)(v7 + 40) = v6;

  v9 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v10 = *(void **)(v9 + 40);
  *(_QWORD *)(v9 + 40) = v5;
  v11 = v5;

  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

uint64_t sub_100005200(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void sub_100005584(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,char a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,char a31)
{
  _Block_object_dispose(&a25, 8);
  _Block_object_dispose(&a31, 8);
  _Unwind_Resume(a1);
}

void sub_1000055C8(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  id v11;
  id v12;

  v5 = a2;
  v6 = a3;
  v7 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v8 = *(void **)(v7 + 40);
  *(_QWORD *)(v7 + 40) = v5;
  v12 = v5;

  v9 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v10 = *(void **)(v9 + 40);
  *(_QWORD *)(v9 + 40) = v6;
  v11 = v6;

  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

void sub_100005710(id *a1, uint64_t a2)
{
  id v3;
  NSObject *v4;
  _BOOL4 v5;
  id v6;
  id v7;
  void *v8;
  id v9;
  id v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  id v16;
  uint64_t v17;
  void *v18;
  void *v19;
  _QWORD *v20;
  void *v21;
  uint64_t v22;
  void *v23;
  _QWORD *v24;
  void *v25;
  void *v26;
  _QWORD v27[6];
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  uint8_t buf[4];
  id v37;
  _BYTE v38[128];
  _BYTE v39[128];

  v3 = a1[4];
  _HKInitializeLogging(a1, a2);
  v4 = HKLogAuthorization;
  v5 = os_log_type_enabled(HKLogAuthorization, OS_LOG_TYPE_DEFAULT);
  if (v3)
  {
    if (v5)
    {
      v6 = a1[4];
      *(_DWORD *)buf = 138412290;
      v37 = v6;
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Object selection failed with error: %@.", buf, 0xCu);
    }
    objc_storeStrong((id *)a1[6] + 4, a1[4]);
    objc_msgSend(a1[6], "_finishWithError:", a1[4]);
  }
  else
  {
    if (v5)
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Successfully selected authorization for object picker.", buf, 2u);
    }
    v7 = objc_alloc_init((Class)NSMutableDictionary);
    v32 = 0u;
    v33 = 0u;
    v34 = 0u;
    v35 = 0u;
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1[5], "allSamples"));
    v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v32, v39, 16);
    if (v9)
    {
      v10 = v9;
      v11 = *(_QWORD *)v33;
      do
      {
        v12 = 0;
        do
        {
          if (*(_QWORD *)v33 != v11)
            objc_enumerationMutation(v8);
          v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(*((_QWORD *)&v32 + 1) + 8 * (_QWORD)v12), "UUID"));
          objc_msgSend(v7, "setObject:forKeyedSubscript:", &off_10000C9D0, v13);

          v12 = (char *)v12 + 1;
        }
        while (v10 != v12);
        v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v32, v39, 16);
      }
      while (v10);
    }

    v30 = 0u;
    v31 = 0u;
    v28 = 0u;
    v29 = 0u;
    v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1[5], "enabledSamples"));
    v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v28, v38, 16);
    if (v15)
    {
      v16 = v15;
      v17 = *(_QWORD *)v29;
      do
      {
        v18 = 0;
        do
        {
          if (*(_QWORD *)v29 != v17)
            objc_enumerationMutation(v14);
          v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(*((_QWORD *)&v28 + 1) + 8 * (_QWORD)v18), "UUID"));
          objc_msgSend(v7, "setObject:forKeyedSubscript:", &off_10000C9E8, v19);

          v18 = (char *)v18 + 1;
        }
        while (v16 != v18);
        v16 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v28, v38, 16);
      }
      while (v16);
    }

    v20 = a1[6];
    v21 = (void *)v20[2];
    v22 = v20[10];
    v23 = (void *)v20[5];
    v24 = v20;
    v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "bundleIdentifier"));
    v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1[5], "sessionIdentifier"));
    v27[0] = _NSConcreteStackBlock;
    v27[1] = 3221225472;
    v27[2] = sub_100005A5C;
    v27[3] = &unk_10000C5B8;
    v27[4] = a1[6];
    v27[5] = v24;
    objc_msgSend(v21, "setObjectAuthorizationStatuses:forObjectType:bundleIdentifier:sessionIdentifier:completion:", v7, v22, v25, v26, v27);

  }
}

void sub_100005A5C(uint64_t a1, uint64_t a2, void *a3)
{
  id v4;
  _QWORD block[4];
  id v6;
  __int128 v7;

  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100005AE0;
  block[3] = &unk_10000C4F0;
  v6 = a3;
  v7 = *(_OWORD *)(a1 + 32);
  v4 = v6;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);

}

id sub_100005AE0(uint64_t a1, uint64_t a2)
{
  NSObject *v3;
  uint64_t v4;
  int v6;
  uint64_t v7;

  _HKInitializeLogging(a1, a2);
  v3 = HKLogAuthorization;
  if (os_log_type_enabled(HKLogAuthorization, OS_LOG_TYPE_DEFAULT))
  {
    v4 = *(_QWORD *)(a1 + 32);
    v6 = 138412290;
    v7 = v4;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Finished setting status with error: %@.", (uint8_t *)&v6, 0xCu);
  }
  objc_storeStrong((id *)(*(_QWORD *)(a1 + 40) + 32), *(id *)(a1 + 32));
  return objc_msgSend(*(id *)(a1 + 48), "_finishWithError:", *(_QWORD *)(a1 + 32));
}

void sub_100005FB8(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  NSObject *v9;

  _os_log_debug_impl(a1, v9, OS_LOG_TYPE_DEBUG, a4, &a9, 0xCu);
}

id sub_100005FCC(id a1)
{
  return a1;
}

uint64_t sub_100005FD8()
{
  uint64_t v0;

  return objc_opt_class(v0);
}

id sub_100005FF0(id a1)
{
  return a1;
}

void sub_100005FF8(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 0xCu);
}

id sub_100006BC8(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_hostDidTerminate");
}

void sub_100006D04(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  id *v14;

  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_100006D40(uint64_t a1, void *a2)
{
  id *v2;
  id v3;
  void *v4;
  id WeakRetained;

  v2 = (id *)(a1 + 32);
  v3 = a2;
  WeakRetained = objc_loadWeakRetained(v2);
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "objectForKeyedSubscript:", BKSApplicationStateKey));

  objc_msgSend(WeakRetained, "_hostApplicationStateDidChange:", objc_msgSend(v4, "integerValue"));
}

void sub_100007030(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  id v5;
  _QWORD block[5];
  id v7;
  id v8;

  v3 = a2;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000070C4;
  block[3] = &unk_10000C4F0;
  v4 = *(void **)(a1 + 40);
  block[4] = *(_QWORD *)(a1 + 32);
  v7 = v4;
  v8 = v3;
  v5 = v3;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);

}

void sub_1000070C4(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  unsigned int v5;
  id v6;

  v2 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "currentTransactionSessionIdentifier"));
  v3 = *(void **)(a1 + 40);
  if (v2 == v3)
  {

    goto LABEL_6;
  }
  if (!v3)
  {

    return;
  }
  v6 = v2;
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "currentTransactionSessionIdentifier"));
  v5 = objc_msgSend(v4, "isEqual:", *(_QWORD *)(a1 + 40));

  if (v5)
  {
LABEL_6:
    objc_msgSend(*(id *)(a1 + 32), "setCurrentTransactionSessionIdentifier:", 0);
    objc_msgSend(*(id *)(a1 + 32), "_finishWithError:", *(_QWORD *)(a1 + 48));
  }
}

void sub_10000717C(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  id v5;
  _QWORD block[5];
  id v7;
  id v8;

  v3 = a2;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100007210;
  block[3] = &unk_10000C4F0;
  v4 = *(void **)(a1 + 40);
  block[4] = *(_QWORD *)(a1 + 32);
  v7 = v4;
  v8 = v3;
  v5 = v3;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);

}

void sub_100007210(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  unsigned int v5;
  _BYTE *v6;
  id v7;

  v2 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "currentTransactionSessionIdentifier"));
  v3 = *(void **)(a1 + 40);
  if (v2 == v3)
  {

LABEL_6:
    objc_msgSend(*(id *)(a1 + 32), "setCurrentTransactionSource:", *(_QWORD *)(a1 + 48));
    v6 = *(_BYTE **)(a1 + 32);
    if (v6[9])
      objc_msgSend(v6, "show");
    return;
  }
  if (!v3)
  {

    return;
  }
  v7 = v2;
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "currentTransactionSessionIdentifier"));
  v5 = objc_msgSend(v4, "isEqual:", *(_QWORD *)(a1 + 40));

  if (v5)
    goto LABEL_6;
}

id sub_100007380(uint64_t a1)
{
  int v2;
  void *v3;
  uint64_t v4;

  v2 = *(unsigned __int8 *)(a1 + 48);
  v3 = *(void **)(a1 + 32);
  v4 = *(_QWORD *)(a1 + 40);
  if (v2)
    return objc_msgSend(v3, "_didFinishPresentingRequestWithError:", v4);
  else
    return objc_msgSend(v3, "_finishWithError:", v4);
}

void sub_100007610(unsigned int a1, NSObject *a2)
{
  int v2;
  uint64_t v3;

  v2 = 134217984;
  v3 = a1;
  _os_log_debug_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_DEBUG, "Host application state changed to %ld, terminating recalibrate estimates session.", (uint8_t *)&v2, 0xCu);
}

void sub_100007688(void *a1, void *a2, uint64_t a3)
{
  NSObject *v5;
  void *v6;
  int v7;
  void *v8;
  __int16 v9;
  uint64_t v10;

  v5 = sub_100005FF0(a1);
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a2, "sessionIdentifier"));
  v7 = 138543618;
  v8 = v6;
  v9 = 2114;
  v10 = a3;
  _os_log_error_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_ERROR, "Failed to locate context to authorize session %{public}@: %{public}@", (uint8_t *)&v7, 0x16u);

}

void sub_100007740(unsigned int a1, NSObject *a2)
{
  int v2;
  uint64_t v3;

  v2 = 134217984;
  v3 = a1;
  _os_log_debug_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_DEBUG, "Host application state changed to %ld, terminating authorization session.", (uint8_t *)&v2, 0xCu);
  sub_100006008();
}

void sub_1000077B4(void *a1)
{
  void *v1;
  void *v2;
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint8_t v10;

  sub_100005FF0(a1);
  v2 = (void *)sub_100005FD8();
  v3 = sub_100005FCC(v2);
  sub_100005FB8((void *)&_mh_execute_header, v4, v5, "%{public}@: beginning authorization delegate transaction", v6, v7, v8, v9, v10);

  sub_100005FE4();
}

void sub_10000782C(void *a1)
{
  void *v1;
  void *v2;
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint8_t v10;

  sub_100005FF0(a1);
  v2 = (void *)sub_100005FD8();
  v3 = sub_100005FCC(v2);
  sub_100005FB8((void *)&_mh_execute_header, v4, v5, "%{public}@: finishing authorization delegate transaction", v6, v7, v8, v9, v10);

  sub_100005FE4();
}

void sub_1000078A4(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_100005FF8((void *)&_mh_execute_header, a2, a3, "%{public}@: Timed out waiting for signed clinical data record", a5, a6, a7, a8, 2u);
  sub_100006008();
}

void sub_100007908(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_100005FF8((void *)&_mh_execute_header, a2, a3, "%{public}@: Timed out waiting for medical records", a5, a6, a7, a8, 2u);
  sub_100006008();
}

void sub_10000796C(void *a1)
{
  void *v1;
  void *v2;
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint8_t v10;

  sub_100005FF0(a1);
  v2 = (void *)sub_100005FD8();
  v3 = sub_100005FCC(v2);
  sub_100005FB8((void *)&_mh_execute_header, v4, v5, "%@: dismissing", v6, v7, v8, v9, v10);

  sub_100005FE4();
}

void sub_1000079E4(unsigned int a1, NSObject *a2)
{
  int v2;
  uint64_t v3;

  v2 = 134217984;
  v3 = a1;
  _os_log_debug_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_DEBUG, "Host application state changed to %ld, terminating authorization session.", (uint8_t *)&v2, 0xCu);
}

void sub_100007A5C(void *a1, uint64_t a2, uint64_t a3)
{
  NSObject *v5;
  id v6;
  int v7;
  id v8;
  __int16 v9;
  uint64_t v10;

  v5 = a1;
  v7 = 138412546;
  v8 = (id)objc_opt_class(a2);
  v9 = 2114;
  v10 = a3;
  v6 = v8;
  _os_log_debug_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEBUG, "%@: beginning authorization delegate transaction with identifier %{public}@", (uint8_t *)&v7, 0x16u);

}

id objc_msgSend_UUID(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "UUID");
}

id objc_msgSend__appStateTerminationUpperBound(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_appStateTerminationUpperBound");
}

id objc_msgSend__beginAuthorizationSessionWithIdentifier_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_beginAuthorizationSessionWithIdentifier:");
}

id objc_msgSend__configureAlertControllerWithSourceName_sampleType_effectiveDate_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_configureAlertControllerWithSourceName:sampleType:effectiveDate:");
}

id objc_msgSend__configureApplicationStateMonitor(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_configureApplicationStateMonitor");
}

id objc_msgSend__didFinishPresentingRequestWithError_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_didFinishPresentingRequestWithError:");
}

id objc_msgSend__finishRequestWithError_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_finishRequestWithError:");
}

id objc_msgSend__finishWithError_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_finishWithError:");
}

id objc_msgSend__healthPrivacyHostViewController(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_healthPrivacyHostViewController");
}

id objc_msgSend__hostApplicationBundleIdentifier(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_hostApplicationBundleIdentifier");
}

id objc_msgSend__hostApplicationStateDidChange_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_hostApplicationStateDidChange:");
}

id objc_msgSend__isPresentingLastRequest(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_isPresentingLastRequest");
}

id objc_msgSend__pickerControllerForDocuments(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_pickerControllerForDocuments");
}

id objc_msgSend__pickerControllerForObjectType_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_pickerControllerForObjectType:");
}

id objc_msgSend__pickerControllerForSignedClinicalData(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_pickerControllerForSignedClinicalData");
}

id objc_msgSend__pickerControllerForVisionPrescriptions(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_pickerControllerForVisionPrescriptions");
}

id objc_msgSend__presentNextRequest(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_presentNextRequest");
}

id objc_msgSend__presentRequestIfNeeded_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_presentRequestIfNeeded:");
}

id objc_msgSend__promptControllerForClinicalHealthRecordsPresentationRequest_source_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_promptControllerForClinicalHealthRecordsPresentationRequest:source:");
}

id objc_msgSend__promptControllerForHealthDataPresentationRequest_source_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_promptControllerForHealthDataPresentationRequest:source:");
}

id objc_msgSend__promptControllerForPresentationRequest_source_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_promptControllerForPresentationRequest:source:");
}

id objc_msgSend__queryMedicalRecordsWithQueryDescriptors_completion_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_queryMedicalRecordsWithQueryDescriptors:completion:");
}

id objc_msgSend_actionWithTitle_style_handler_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "actionWithTitle:style:handler:");
}

id objc_msgSend_addAction_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "addAction:");
}

id objc_msgSend_addObject_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "addObject:");
}

id objc_msgSend_alertControllerWithTitle_message_preferredStyle_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "alertControllerWithTitle:message:preferredStyle:");
}

id objc_msgSend_allKeys(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "allKeys");
}

id objc_msgSend_allSamples(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "allSamples");
}

id objc_msgSend_appearance(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "appearance");
}

id objc_msgSend_arrayWithObjects_count_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "arrayWithObjects:count:");
}

id objc_msgSend_beginAuthorizationDelegateTransactionWithSessionIdentifier_sourceHandler_errorHandler_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "beginAuthorizationDelegateTransactionWithSessionIdentifier:sourceHandler:errorHandler:");
}

id objc_msgSend_bundleIdentifier(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "bundleIdentifier");
}

id objc_msgSend_bundleWithIdentifier_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "bundleWithIdentifier:");
}

id objc_msgSend_code(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "code");
}

id objc_msgSend_compare_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "compare:");
}

id objc_msgSend_contextWithHealthStore_request_source_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "contextWithHealthStore:request:source:");
}

id objc_msgSend_copy(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "copy");
}

id objc_msgSend_count(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "count");
}

id objc_msgSend_countByEnumeratingWithState_objects_count_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "countByEnumeratingWithState:objects:count:");
}

id objc_msgSend_createInitialViewControllerWithDelegate_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "createInitialViewControllerWithDelegate:");
}

id objc_msgSend_currentHandler(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "currentHandler");
}

id objc_msgSend_currentTransactionSessionIdentifier(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "currentTransactionSessionIdentifier");
}

id objc_msgSend_currentTransactionSource(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "currentTransactionSource");
}

id objc_msgSend_dateIssued(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "dateIssued");
}

id objc_msgSend_didFinishWithError_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "didFinishWithError:");
}

id objc_msgSend_dismissViewControllerAnimated_completion_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "dismissViewControllerAnimated:completion:");
}

id objc_msgSend_effectiveDate(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "effectiveDate");
}

id objc_msgSend_enabledSamples(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "enabledSamples");
}

id objc_msgSend_endAuthorizationDelegateTransactionWithSessionIdentifier_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "endAuthorizationDelegateTransactionWithSessionIdentifier:error:");
}

id objc_msgSend_errorWithDomain_code_userInfo_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "errorWithDomain:code:userInfo:");
}

id objc_msgSend_executeQuery_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "executeQuery:");
}

id objc_msgSend_expectedObjectType(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "expectedObjectType");
}

id objc_msgSend_fetchAuthorizationContextForPromptSession_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "fetchAuthorizationContextForPromptSession:error:");
}

id objc_msgSend_firstObject(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "firstObject");
}

id objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "handleFailureInMethod:object:file:lineNumber:description:");
}

id objc_msgSend_healthStore(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "healthStore");
}

id objc_msgSend_hk_allElementsUnique(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "hk_allElementsUnique");
}

id objc_msgSend_hk_appTintColor(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "hk_appTintColor");
}

id objc_msgSend_hk_error_description_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "hk_error:description:");
}

id objc_msgSend_hk_error_format_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "hk_error:format:");
}

id objc_msgSend_hk_filter_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "hk_filter:");
}

id objc_msgSend_identifier(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "identifier");
}

id objc_msgSend_indexOfObject_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "indexOfObject:");
}

id objc_msgSend_initWithBundleIDs_states_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithBundleIDs:states:");
}

id objc_msgSend_initWithClinicalRecords_signedRecords_recordTypes_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithClinicalRecords:signedRecords:recordTypes:");
}

id objc_msgSend_initWithDocuments_presentationStyle_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithDocuments:presentationStyle:");
}

id objc_msgSend_initWithHealthStore_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithHealthStore:");
}

id objc_msgSend_initWithHealthStore_samples_enabledSamples_source_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithHealthStore:samples:enabledSamples:source:");
}

id objc_msgSend_initWithHealthStore_source_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithHealthStore:source:");
}

id objc_msgSend_initWithHealthStore_style_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithHealthStore:style:");
}

id objc_msgSend_initWithQueryDescriptors_limit_resultsHandler_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithQueryDescriptors:limit:resultsHandler:");
}

id objc_msgSend_initWithRootViewController_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithRootViewController:");
}

id objc_msgSend_initWithSampleType_predicate_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithSampleType:predicate:");
}

id objc_msgSend_integerValue(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "integerValue");
}

id objc_msgSend_isEqual_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "isEqual:");
}

id objc_msgSend_isSyncPromptedForHealthKit_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "isSyncPromptedForHealthKit:");
}

id objc_msgSend_isViewLoaded(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "isViewLoaded");
}

id objc_msgSend_isiPad(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "isiPad");
}

id objc_msgSend_lastObject(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "lastObject");
}

id objc_msgSend_localizedStringForKey_value_table_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "localizedStringForKey:value:table:");
}

id objc_msgSend_medicalRecordTypesWithOptions_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "medicalRecordTypesWithOptions:");
}

id objc_msgSend_metadata(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "metadata");
}

id objc_msgSend_name(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "name");
}

id objc_msgSend_objectAtIndexedSubscript_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "objectAtIndexedSubscript:");
}

id objc_msgSend_objectForKeyedSubscript_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "objectForKeyedSubscript:");
}

id objc_msgSend_originIdentifier(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "originIdentifier");
}

id objc_msgSend_predicateForMedicalRecordsWithSignedClinicalDataOriginIdentifier_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "predicateForMedicalRecordsWithSignedClinicalDataOriginIdentifier:");
}

id objc_msgSend_presentViewController_animated_completion_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "presentViewController:animated:completion:");
}

id objc_msgSend_presentationRequests(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "presentationRequests");
}

id objc_msgSend_presentedRequest(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "presentedRequest");
}

id objc_msgSend_presentedViewController(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "presentedViewController");
}

id objc_msgSend_presentingViewController(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "presentingViewController");
}

id objc_msgSend_processInfo(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "processInfo");
}

id objc_msgSend_processName(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "processName");
}

id objc_msgSend_readUsageDescription(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "readUsageDescription");
}

id objc_msgSend_recalibrateEstimatesForSampleType_effectiveDate_completion_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "recalibrateEstimatesForSampleType:effectiveDate:completion:");
}

id objc_msgSend_recordTypes(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "recordTypes");
}

id objc_msgSend_relevantDate(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "relevantDate");
}

id objc_msgSend_requestRecord(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "requestRecord");
}

id objc_msgSend_researchStudyUsageDescription(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "researchStudyUsageDescription");
}

id objc_msgSend_sampleType(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "sampleType");
}

id objc_msgSend_samplesRequiringAuthorization(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "samplesRequiringAuthorization");
}

id objc_msgSend_sessionIdentifier(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "sessionIdentifier");
}

id objc_msgSend_setApplicationStateMonitor_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setApplicationStateMonitor:");
}

id objc_msgSend_setCurrentTransactionSessionIdentifier_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setCurrentTransactionSessionIdentifier:");
}

id objc_msgSend_setCurrentTransactionSource_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setCurrentTransactionSource:");
}

id objc_msgSend_setDelegate_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setDelegate:");
}

id objc_msgSend_setHandler_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setHandler:");
}

id objc_msgSend_setModalInPresentation_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setModalInPresentation:");
}

id objc_msgSend_setModalPresentationStyle_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setModalPresentationStyle:");
}

id objc_msgSend_setObject_forKeyedSubscript_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setObject:forKeyedSubscript:");
}

id objc_msgSend_setObjectAuthorizationStatuses_forObjectType_bundleIdentifier_sessionIdentifier_completion_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setObjectAuthorizationStatuses:forObjectType:bundleIdentifier:sessionIdentifier:completion:");
}

id objc_msgSend_setObjectPickerDelegate_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setObjectPickerDelegate:");
}

id objc_msgSend_setPresentationRequests_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setPresentationRequests:");
}

id objc_msgSend_setPresentedRequest_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setPresentedRequest:");
}

id objc_msgSend_setRequestRecord_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setRequestRecord:");
}

id objc_msgSend_setResearchStudyUsageDescription_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setResearchStudyUsageDescription:");
}

id objc_msgSend_setSessionIdentifier_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setSessionIdentifier:");
}

id objc_msgSend_setShareDescription_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setShareDescription:");
}

id objc_msgSend_setSource_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setSource:");
}

id objc_msgSend_setTintColor_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setTintColor:");
}

id objc_msgSend_setTypesToRead_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setTypesToRead:");
}

id objc_msgSend_setTypesToShare_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setTypesToShare:");
}

id objc_msgSend_setUpdateDescription_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setUpdateDescription:");
}

id objc_msgSend_shareUsageDescription(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "shareUsageDescription");
}

id objc_msgSend_sharedBehavior(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "sharedBehavior");
}

id objc_msgSend_shouldDismissWhenBackgrounded(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "shouldDismissWhenBackgrounded");
}

id objc_msgSend_shouldPresent(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "shouldPresent");
}

id objc_msgSend_show(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "show");
}

id objc_msgSend_signedClinicalDataRecordForVerifiableClinicalRecord_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "signedClinicalDataRecordForVerifiableClinicalRecord:");
}

id objc_msgSend_signedClinicalDataRecordType(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "signedClinicalDataRecordType");
}

id objc_msgSend_signedRecordsForClinicalRecords_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "signedRecordsForClinicalRecords:");
}

id objc_msgSend_sortedArrayUsingComparator_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "sortedArrayUsingComparator:");
}

id objc_msgSend_source(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "source");
}

id objc_msgSend_status(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "status");
}

id objc_msgSend_stringByAppendingString_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "stringByAppendingString:");
}

id objc_msgSend_stringWithFormat_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "stringWithFormat:");
}

id objc_msgSend_type(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "type");
}

id objc_msgSend_typesRequiringReadAuthorization(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "typesRequiringReadAuthorization");
}

id objc_msgSend_typesRequiringShareAuthorization(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "typesRequiringShareAuthorization");
}

id objc_msgSend_validateRecalibrateEstimatesRequestRecord_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "validateRecalibrateEstimatesRequestRecord:error:");
}

id objc_msgSend_visionPrescriptionType(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "visionPrescriptionType");
}
