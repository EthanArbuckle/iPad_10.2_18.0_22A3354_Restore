id sub_1000042F4(uint64_t a1)
{
  id result;
  void *v3;
  uint64_t v4;

  result = objc_msgSend(*(id *)(a1 + 32), "state");
  switch((unint64_t)result)
  {
    case 0uLL:
    case 1uLL:
      v3 = *(void **)(a1 + 32);
      v4 = 5;
      goto LABEL_4;
    case 2uLL:
      v3 = *(void **)(a1 + 32);
      v4 = 3;
LABEL_4:
      result = objc_msgSend(v3, "setState:", v4);
      break;
    case 4uLL:
      result = objc_msgSend(*(id *)(a1 + 32), "_dismiss");
      break;
    default:
      return result;
  }
  return result;
}

void sub_100004690(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, id location)
{
  id *v19;

  objc_destroyWeak(v19);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1000046BC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  NSObject *v4;
  void *v5;
  id WeakRetained;
  uint8_t buf[4];
  uint64_t v8;

  if ((a3 & 3) != 0)
  {
    if (ck_log_initialization_predicate != -1)
      dispatch_once((dispatch_once_t *)&ck_log_initialization_predicate, ck_log_initialization_block);
    v4 = ck_log_facility_ck;
    if (os_log_type_enabled(ck_log_facility_ck, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 134217984;
      v8 = a3;
      _os_log_error_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_ERROR, "Unexpected response from retrieving notification: %lx", buf, 0xCu);
    }
  }
  else
  {
    WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
    v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(WeakRetained, "delegate"));
    objc_msgSend(v5, "retrievingDialogCancelled");

  }
}

id sub_1000047E4(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_timeoutMinPeriod");
}

void sub_100004BE4(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_displayIfRequired");

}

void sub_100004C9C(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_schedule");

}

void sub_100004FF8(id a1)
{
  uint64_t v1;
  void *v2;

  v1 = objc_claimAutoreleasedReturnValue(+[NSSet setWithObjects:](NSSet, "setWithObjects:", kCKPhotosEPPMomentShareURLSlug, kCKPhotosShareURLSlug, 0));
  v2 = (void *)qword_10002A730;
  qword_10002A730 = v1;

}

void sub_100005270(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_100005320(id a1)
{
  uint64_t v1;
  void *v2;

  v1 = objc_claimAutoreleasedReturnValue(+[NSSet setWithObjects:](NSSet, "setWithObjects:", kCKKeynoteShareURLSlug, kCKNumbersShareURLSlug, kCKPagesShareURLSlug, 0));
  v2 = (void *)qword_10002A740;
  qword_10002A740 = v1;

}

void sub_100005418(id a1)
{
  uint64_t v1;
  void *v2;

  v1 = objc_claimAutoreleasedReturnValue(+[NSSet setWithObjects:](NSSet, "setWithObjects:", kCKCloudDocsShareURLSlug, kCKKeynoteShareURLSlug, kCKNumbersShareURLSlug, kCKPagesShareURLSlug, 0));
  v2 = (void *)qword_10002A750;
  qword_10002A750 = v1;

}

void sub_10000551C(id a1)
{
  uint64_t v1;
  void *v2;

  v1 = objc_claimAutoreleasedReturnValue(+[NSSet setWithObjects:](NSSet, "setWithObjects:", kCKPhotosEPPMomentShareURLSlug, kCKPhotosShareURLSlug, kCKPhotosSharedLibraryShareURLSlug, 0));
  v2 = (void *)qword_10002A760;
  qword_10002A760 = v1;

}

void sub_1000060D8(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  NSObject *v9;
  void *v10;
  void *v11;
  int v12;
  void *v13;
  __int16 v14;
  uint64_t v15;
  __int16 v16;
  void *v17;
  __int16 v18;
  id v19;

  v5 = a2;
  v6 = a3;
  if (!v5)
  {
    if (ck_log_initialization_predicate != -1)
      dispatch_once((dispatch_once_t *)&ck_log_initialization_predicate, ck_log_initialization_block);
    v7 = (void *)ck_log_facility_ck;
    if (os_log_type_enabled(ck_log_facility_ck, OS_LOG_TYPE_ERROR))
    {
      v8 = *(void **)(a1 + 32);
      v9 = v7;
      v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "CKURLThroughSlug"));
      v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "CKPathAfterSlug"));
      v12 = 138544130;
      v13 = v10;
      v14 = 2160;
      v15 = 1752392040;
      v16 = 2112;
      v17 = v11;
      v18 = 2114;
      v19 = v6;
      _os_log_error_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_ERROR, "Can't open URL %{public}@%{mask.hash}@ using default web browser: %{public}@", (uint8_t *)&v12, 0x2Au);

    }
  }

}

void sub_100006C30(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_list va;

  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t sub_100006C4C(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void sub_100006C5C(uint64_t a1)
{

}

void sub_100006C64(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v6;
  id v7;
  id v8;
  void *v9;
  void *v10;
  id v11;
  id v12;
  void *v13;
  id v14;
  id v15;
  uint64_t v16;
  void *i;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  NSObject *v25;
  NSObject *v26;
  NSObject *v27;
  NSObject *v28;
  id v29;
  void *v30;
  void *v31;
  id v32;
  id v33;
  id obj;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  id v40;
  uint8_t buf[4];
  id v42;
  __int16 v43;
  void *v44;
  _QWORD v45[2];
  _QWORD v46[2];
  _BYTE v47[128];

  v6 = a2;
  v7 = a3;
  v8 = a4;
  v9 = v8;
  if (v6)
  {
    v40 = 0;
    v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSJSONSerialization JSONObjectWithData:options:error:](NSJSONSerialization, "JSONObjectWithData:options:error:", v6, 1, &v40));
    v11 = v40;
    v12 = v40;
    v13 = v12;
    if (v10)
    {
      v29 = v12;
      v30 = v10;
      v31 = v9;
      v32 = v7;
      v33 = v6;
      v36 = 0u;
      v37 = 0u;
      v38 = 0u;
      v39 = 0u;
      obj = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "objectForKey:", CFSTR("results")));
      v14 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v36, v47, 16);
      if (v14)
      {
        v15 = v14;
        v16 = *(_QWORD *)v37;
        do
        {
          for (i = 0; i != v15; i = (char *)i + 1)
          {
            if (*(_QWORD *)v37 != v16)
              objc_enumerationMutation(obj);
            v18 = *(void **)(*((_QWORD *)&v36 + 1) + 8 * (_QWORD)i);
            v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "valueForKey:", CFSTR("trackId")));
            v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "valueForKey:", CFSTR("trackName")));
            v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "valueForKey:", CFSTR("bundleId")));
            if (v19)
            {
              v45[0] = CFSTR("URL");
              v22 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", *(_QWORD *)(a1 + 40), v19));
              v23 = (void *)objc_claimAutoreleasedReturnValue(+[NSURL URLWithString:](NSURL, "URLWithString:", v22));
              v45[1] = CFSTR("Name");
              v46[0] = v23;
              v46[1] = v20;
              v24 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v46, v45, 2));
              objc_msgSend(*(id *)(a1 + 32), "setObject:forKeyedSubscript:", v24, v21);

            }
          }
          v15 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v36, v47, 16);
        }
        while (v15);
      }

      v7 = v32;
      v6 = v33;
      v10 = v30;
      v9 = v31;
      v13 = v29;
    }
    else if (v12)
    {
      if (ck_log_initialization_predicate != -1)
        dispatch_once((dispatch_once_t *)&ck_log_initialization_predicate, ck_log_initialization_block);
      v26 = ck_log_facility_ck;
      if (os_log_type_enabled(ck_log_facility_ck, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138543618;
        v42 = v7;
        v43 = 2112;
        v44 = v13;
        _os_log_error_impl((void *)&_mh_execute_header, v26, OS_LOG_TYPE_ERROR, "Parse error while parsing App Store repsonse %{public}@, %@", buf, 0x16u);
      }
      objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40), v11);
    }
    else
    {
      if (ck_log_initialization_predicate != -1)
        dispatch_once((dispatch_once_t *)&ck_log_initialization_predicate, ck_log_initialization_block);
      v28 = ck_log_facility_ck;
      if (os_log_type_enabled(ck_log_facility_ck, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138543362;
        v42 = v7;
        _os_log_error_impl((void *)&_mh_execute_header, v28, OS_LOG_TYPE_ERROR, "Parse error while parsing App Store repsonse %{public}@", buf, 0xCu);
      }
    }

  }
  else if (v8)
  {
    if (ck_log_initialization_predicate != -1)
      dispatch_once((dispatch_once_t *)&ck_log_initialization_predicate, ck_log_initialization_block);
    v25 = ck_log_facility_ck;
    if (os_log_type_enabled(ck_log_facility_ck, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543618;
      v42 = v7;
      v43 = 2112;
      v44 = v9;
      _os_log_error_impl((void *)&_mh_execute_header, v25, OS_LOG_TYPE_ERROR, "Got no data while looking up App Store URL, got response %{public}@, %@", buf, 0x16u);
    }
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40), a4);
  }
  else
  {
    if (ck_log_initialization_predicate != -1)
      dispatch_once((dispatch_once_t *)&ck_log_initialization_predicate, ck_log_initialization_block);
    v27 = ck_log_facility_ck;
    if (os_log_type_enabled(ck_log_facility_ck, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543362;
      v42 = v7;
      _os_log_error_impl((void *)&_mh_execute_header, v27, OS_LOG_TYPE_ERROR, "Got no data while looking up App Store URL, got response %{public}@", buf, 0xCu);
    }
  }
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 48));

}

void sub_1000087B4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,char a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,char a27)
{
  _Block_object_dispose(&a21, 8);
  _Block_object_dispose(&a27, 8);
  _Unwind_Resume(a1);
}

void sub_1000087F0(uint64_t a1, int a2, id obj)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), obj);
}

void sub_100008804(uint64_t a1, void *a2)
{
  id v4;

  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), a2);
  v4 = a2;
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));

}

void sub_100008AB8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_100008AD0(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7;
  id v8;
  id v9;

  v9 = a2;
  v7 = a3;
  v8 = a4;
  if (v8)
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), a4);
  objc_msgSend(*(id *)(a1 + 32), "setCurrentUserNameComponents:", v9);
  objc_msgSend(*(id *)(a1 + 32), "setCurrentUserFormattedUsername:", v7);
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 40));

}

void sub_100009C20(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,char a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,char a38)
{
  _Block_object_dispose(&a32, 8);
  _Block_object_dispose(&a38, 8);
  _Unwind_Resume(a1);
}

id sub_100009C64(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  unsigned int v5;
  void *v6;

  v3 = a2;
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "supportedDataclassesForAccountType:", v3));
  v5 = objc_msgSend(v4, "containsObject:", CFSTR("com.apple.Dataclass.Mail"));

  if (v5)
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "accountsWithAccountType:", v3));
  else
    v6 = 0;

  return v6;
}

void sub_100009CE0(_QWORD *a1, void *a2, uint64_t a3, _BYTE *a4)
{
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;

  v15 = a2;
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "userIdentity"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "lookupInfo"));
  v9 = objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "emailAddress"));
  if (v9)
  {
    v10 = (void *)v9;
    v11 = (void *)a1[4];
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "userIdentity"));
    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "lookupInfo"));
    v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "emailAddress"));
    LODWORD(v11) = objc_msgSend(v11, "containsObject:", v14);

    if ((_DWORD)v11)
    {
      ++*(_DWORD *)(*(_QWORD *)(a1[5] + 8) + 24);
      objc_storeStrong((id *)(*(_QWORD *)(a1[6] + 8) + 40), a2);
      if (*(int *)(*(_QWORD *)(a1[5] + 8) + 24) >= 2)
        *a4 = 1;
    }
  }
  else
  {

  }
}

void sub_10000A278(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  va_list va;

  va_start(va, a13);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_10000A290(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  id v13;

  v3 = a2;
  if (v3)
  {
    v4 = v3;
    v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "shareName"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "singleOONMatch"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "userIdentity"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "lookupInfo"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "emailAddress"));
    v10 = (void *)objc_claimAutoreleasedReturnValue(+[CKVettingAlerts alertContentForInitiateVettingError:shareTitle:isEmail:address:](CKVettingAlerts, "alertContentForInitiateVettingError:shareTitle:isEmail:address:", v4, v5, v9 != 0, *(_QWORD *)(a1 + 40)));
    +[CKVettingAlerts showFailureAlert:isSourceICS:](CKVettingAlerts, "showFailureAlert:isSourceICS:", v10, objc_msgSend(*(id *)(a1 + 32), "isSourceICS"));

  }
  else
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "url"));
    v4 = (void *)objc_claimAutoreleasedReturnValue(+[CKPrettyError errorWithDomain:code:format:](CKPrettyError, "errorWithDomain:code:format:", CKErrorDomain, 8000, CFSTR("Can not accept share at URL %@: vetting of the invited email is needed"), v5));
  }

  v11 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
  v12 = *(void **)(v11 + 40);
  *(_QWORD *)(v11 + 40) = v4;
  v13 = v4;

  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 48));
}

void sub_10000AF34(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  va_list va;

  va_start(va, a13);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_10000AF4C(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
}

void sub_10000AF5C(uint64_t a1, void *a2)
{
  id v4;

  v4 = a2;
  if (v4)
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), a2);
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

}

id sub_10000B07C(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id v7;
  uint64_t v8;
  id v9;

  v5 = a2;
  v6 = a3;
  v7 = objc_alloc((Class)CKTuple2);
  if (*(_BYTE *)(a1 + 32))
  {
    v8 = objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@ (%@)"), v6, v5));

    v6 = (id)v8;
  }
  v9 = objc_msgSend(v7, "initWithObject1:object2:", v6, v5);

  return v9;
}

void sub_10000C318(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, id location, char a19)
{
  id *v19;

  objc_destroyWeak(v19);
  objc_destroyWeak(&location);
  _Block_object_dispose(&a19, 8);
  _Unwind_Resume(a1);
}

void sub_10000C360(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id WeakRetained;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  id v11;
  id v12;
  id v13;
  uint64_t v14;
  void *v15;
  void *i;
  void *v17;
  void *v18;
  uint64_t v19;
  void *v20;
  id v21;
  id v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  _BYTE v27[128];

  v5 = a2;
  v22 = a3;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  v8 = (void *)objc_opt_new(NSMutableArray, v7);
  v10 = (void *)objc_opt_new(NSMutableArray, v9);
  v23 = 0u;
  v24 = 0u;
  v25 = 0u;
  v26 = 0u;
  v11 = v5;
  v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
  if (v12)
  {
    v13 = v12;
    v14 = *(_QWORD *)v24;
    v15 = (void *)kCKShareDaemonPrefix;
    do
    {
      for (i = 0; i != v13; i = (char *)i + 1)
      {
        if (*(_QWORD *)v24 != v14)
          objc_enumerationMutation(v11);
        v17 = *(void **)(*((_QWORD *)&v23 + 1) + 8 * (_QWORD)i);
        if (objc_msgSend(v17, "hasPrefix:", v15))
        {
          v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "substringFromIndex:", objc_msgSend(v15, "length")));
          if (objc_msgSend(v18, "length"))
            objc_msgSend(v10, "addObject:", v18);

        }
        else
        {
          objc_msgSend(v8, "addObject:", v17);
        }
      }
      v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
    }
    while (v13);
  }

  objc_msgSend(WeakRetained, "setRegisteredAppBundleIDs:", v8);
  objc_msgSend(WeakRetained, "setRegisteredDaemonBundleIDs:", v10);
  v19 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v20 = *(void **)(v19 + 40);
  *(_QWORD *)(v19 + 40) = v22;
  v21 = v22;

  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

void sub_10000CCD4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,uint64_t a44,uint64_t a45,uint64_t a46,uint64_t a47,uint64_t a48,uint64_t a49,uint64_t a50,uint64_t a51,uint64_t a52,char a53)
{
  _Block_object_dispose(&a53, 8);
  _Unwind_Resume(a1);
}

void sub_10000CCF4(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  int v4;
  uint64_t v5;

  if (ck_log_initialization_predicate != -1)
    dispatch_once((dispatch_once_t *)&ck_log_initialization_predicate, ck_log_initialization_block);
  v2 = ck_log_facility_ck;
  if (os_log_type_enabled(ck_log_facility_ck, OS_LOG_TYPE_INFO))
  {
    v3 = *(_QWORD *)(a1 + 32);
    v4 = 138543362;
    v5 = v3;
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_INFO, "Connection to %{public}@ became invalid", (uint8_t *)&v4, 0xCu);
  }
}

void sub_10000CDC8(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  int v4;
  uint64_t v5;

  if (ck_log_initialization_predicate != -1)
    dispatch_once((dispatch_once_t *)&ck_log_initialization_predicate, ck_log_initialization_block);
  v2 = ck_log_facility_ck;
  if (os_log_type_enabled(ck_log_facility_ck, OS_LOG_TYPE_INFO))
  {
    v3 = *(_QWORD *)(a1 + 32);
    v4 = 138543362;
    v5 = v3;
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_INFO, "Connection to %{public}@ was interrupted", (uint8_t *)&v4, 0xCu);
  }
}

void sub_10000CE9C(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  id v8;
  int v9;
  uint64_t v10;
  __int16 v11;
  id v12;

  v3 = a2;
  if (ck_log_initialization_predicate != -1)
    dispatch_once((dispatch_once_t *)&ck_log_initialization_predicate, ck_log_initialization_block);
  v4 = ck_log_facility_ck;
  if (os_log_type_enabled(ck_log_facility_ck, OS_LOG_TYPE_INFO))
  {
    v5 = *(_QWORD *)(a1 + 32);
    v9 = 138543618;
    v10 = v5;
    v11 = 2112;
    v12 = v3;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, "Failed to connect to share handler for %{public}@: %@", (uint8_t *)&v9, 0x16u);
  }
  v6 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v7 = *(void **)(v6 + 40);
  *(_QWORD *)(v6 + 40) = v3;
  v8 = v3;

  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 40));
}

void sub_10000CFB4(uint64_t a1, void *a2)
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  NSObject *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  const char *v14;
  NSObject *v15;
  uint32_t v16;
  void *v17;
  void *v18;
  uint64_t v19;
  int v20;
  uint64_t v21;
  __int16 v22;
  void *v23;
  __int16 v24;
  uint64_t v25;
  __int16 v26;
  void *v27;
  __int16 v28;
  uint64_t v29;

  v4 = a2;
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40), a2);
  if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40))
  {
    if (ck_log_initialization_predicate != -1)
      dispatch_once((dispatch_once_t *)&ck_log_initialization_predicate, ck_log_initialization_block);
    v5 = (void *)ck_log_facility_ck;
    if (os_log_type_enabled(ck_log_facility_ck, OS_LOG_TYPE_INFO))
    {
      v7 = *(_QWORD *)(a1 + 32);
      v6 = *(void **)(a1 + 40);
      v8 = v5;
      v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "url"));
      v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "CKURLThroughSlug"));
      v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 40), "url"));
      v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "CKPathAfterSlug"));
      v13 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40);
      v20 = 138544386;
      v21 = v7;
      v22 = 2114;
      v23 = v10;
      v24 = 2160;
      v25 = 1752392040;
      v26 = 2112;
      v27 = v12;
      v28 = 2112;
      v29 = v13;
      v14 = "Daemon %{public}@ handled share metadata for URL %{public}@%{mask.hash}@, error %@";
      v15 = v8;
      v16 = 52;
LABEL_10:
      _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_INFO, v14, (uint8_t *)&v20, v16);

    }
  }
  else
  {
    if (ck_log_initialization_predicate != -1)
      dispatch_once((dispatch_once_t *)&ck_log_initialization_predicate, ck_log_initialization_block);
    v17 = (void *)ck_log_facility_ck;
    if (os_log_type_enabled(ck_log_facility_ck, OS_LOG_TYPE_INFO))
    {
      v19 = *(_QWORD *)(a1 + 32);
      v18 = *(void **)(a1 + 40);
      v8 = v17;
      v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "url"));
      v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "CKURLThroughSlug"));
      v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 40), "url"));
      v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "CKPathAfterSlug"));
      v20 = 138544130;
      v21 = v19;
      v22 = 2114;
      v23 = v10;
      v24 = 2160;
      v25 = 1752392040;
      v26 = 2112;
      v27 = v12;
      v14 = "Daemon %{public}@ handled share metadata for URL %{public}@%{mask.hash}@";
      v15 = v8;
      v16 = 42;
      goto LABEL_10;
    }
  }
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 48));

}

void sub_10000D9D8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  uint64_t v10;
  va_list va;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  va_list va1;

  va_start(va1, a9);
  va_start(va, a9);
  v10 = va_arg(va1, _QWORD);
  v12 = va_arg(va1, _QWORD);
  v13 = va_arg(va1, _QWORD);
  v14 = va_arg(va1, _QWORD);
  _Block_object_dispose(va, 8);
  _Block_object_dispose(va1, 8);
  _Unwind_Resume(a1);
}

void sub_10000D9FC(uint64_t a1, char a2, void *a3)
{
  id v6;

  v6 = a3;
  if (v6)
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), a3);
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = a2;
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));

}

void sub_10000DD1C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_10000DD48(uint64_t a1, int a2, id obj)
{
  id v5;

  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), obj);
  v5 = obj;
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));

}

void sub_10000EA40(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

uint64_t start(int a1, char **a2)
{
  void *v4;
  objc_class *v5;
  NSString *v6;
  NSString *v7;
  objc_class *v8;
  NSString *v9;
  NSString *v10;
  uint64_t v11;

  v4 = objc_autoreleasePoolPush();
  v5 = (objc_class *)objc_opt_class(UIApplication);
  v6 = NSStringFromClass(v5);
  v7 = (NSString *)objc_claimAutoreleasedReturnValue(v6);
  v8 = (objc_class *)objc_opt_class(AppDelegate);
  v9 = NSStringFromClass(v8);
  v10 = (NSString *)objc_claimAutoreleasedReturnValue(v9);
  v11 = UIApplicationMain(a1, a2, v7, v10);

  objc_autoreleasePoolPop(v4);
  return v11;
}

id sub_10000ED90(void *a1, void *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  id v10;
  id v11;
  NSBundle *v12;
  void *v13;
  uint64_t v14;
  void *v15;

  v10 = a2;
  v11 = a1;
  v12 = +[NSBundle bundleForClass:](NSBundle, "bundleForClass:", objc_opt_class(CKVettingAlerts));
  v13 = (void *)objc_claimAutoreleasedReturnValue(v12);
  v14 = CKLocalizedStringFromTableInBundleVA(v11, CFSTR("CloudKitVetting"), v13, v10, &a9);
  v15 = (void *)objc_claimAutoreleasedReturnValue(v14);

  return v15;
}

void sub_100010700(id a1)
{
  uint64_t v1;
  void *v2;

  v1 = objc_claimAutoreleasedReturnValue(+[NSSet setWithObjects:](NSSet, "setWithObjects:", CFSTR("pages"), CFSTR("numbers"), CFSTR("keynote"), CFSTR("iclouddrive"), CFSTR("notes"), CFSTR("reminders"), CFSTR("photos"), CFSTR("photos_links"), CFSTR("photos_sharing"), CFSTR("safari-tab-groups"), CFSTR("freeform"), CFSTR("share"), 0));
  v2 = (void *)qword_10002A770;
  qword_10002A770 = v1;

}

void sub_100012B78(id a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  _QWORD v9[2];
  _QWORD v10[4];
  _QWORD v11[4];

  v1 = (void *)qword_10002A780;
  qword_10002A780 = (uint64_t)&off_100026C48;

  v10[0] = CFSTR("com.apple.Notes");
  v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSSet setWithObject:](NSSet, "setWithObject:", CFSTR("com.apple.notes.folder")));
  v11[0] = v2;
  v10[1] = CFSTR("photos");
  v9[0] = CKPhotosSharedLibraryShareType;
  v9[1] = CKPhotosEPPMomentShareType;
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v9, 2));
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSSet setWithObjects:](NSSet, "setWithObjects:", v3, 0));
  v11[1] = v4;
  v10[2] = CFSTR("freeform");
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSSet setWithObject:](NSSet, "setWithObject:", CKFreeformShareType));
  v11[2] = v5;
  v10[3] = CFSTR("safari");
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSSet setWithObject:](NSSet, "setWithObject:", CKSafariTabGroupsShareType));
  v11[3] = v6;
  v7 = objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v11, v10, 4));
  v8 = (void *)qword_10002A788;
  qword_10002A788 = v7;

}

void sub_1000132B0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,char a26)
{
  uint64_t v26;

  _Block_object_dispose(&a26, 8);
  _Block_object_dispose((const void *)(v26 - 168), 8);
  _Unwind_Resume(a1);
}

uint64_t sub_1000132DC(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void sub_1000132EC(uint64_t a1)
{

}

void sub_1000132F4(_QWORD *a1, void *a2, void *a3, void *a4)
{
  id v8;
  id v9;
  id v10;
  NSObject *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  NSObject *v16;
  void *v17;
  uint8_t buf[4];
  id v19;
  __int16 v20;
  id v21;

  v8 = a2;
  v9 = a3;
  v10 = a4;
  if (v10)
  {
    if (ck_log_initialization_predicate != -1)
      dispatch_once((dispatch_once_t *)&ck_log_initialization_predicate, ck_log_initialization_block);
    v11 = ck_log_facility_ck;
    if (os_log_type_enabled(ck_log_facility_ck, OS_LOG_TYPE_INFO))
    {
      v12 = (void *)a1[4];
      *(_DWORD *)buf = 138543618;
      v19 = v12;
      v20 = 2112;
      v21 = v10;
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_INFO, "Vetting record of ID:%{public}@ fetch failed due to: %@", buf, 0x16u);
    }
    v13 = objc_claimAutoreleasedReturnValue(+[CKPrettyError errorWithDomain:code:error:format:](CKPrettyError, "errorWithDomain:code:error:format:", CKUnderlyingErrorDomain, 8004, v10, CFSTR("Vetting record missing for vetting token: %@"), a1[5]));
    goto LABEL_7;
  }
  if (!v8)
  {
    v13 = objc_claimAutoreleasedReturnValue(+[CKPrettyError errorWithDomain:code:format:](CKPrettyError, "errorWithDomain:code:format:", CKUnderlyingErrorDomain, 8004, CFSTR("Vetting record missing for vetting token: %@"), a1[5]));
LABEL_7:
    v14 = *(_QWORD *)(a1[6] + 8);
    v15 = *(void **)(v14 + 40);
    *(_QWORD *)(v14 + 40) = v13;

    goto LABEL_14;
  }
  if (ck_log_initialization_predicate != -1)
    dispatch_once((dispatch_once_t *)&ck_log_initialization_predicate, ck_log_initialization_block);
  v16 = ck_log_facility_ck;
  if (os_log_type_enabled(ck_log_facility_ck, OS_LOG_TYPE_DEBUG))
  {
    v17 = (void *)a1[5];
    *(_DWORD *)buf = 138543618;
    v19 = v8;
    v20 = 2114;
    v21 = v17;
    _os_log_debug_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEBUG, "Fetched vetting record: %{public}@ for vetting token: %{public}@", buf, 0x16u);
  }
  objc_storeStrong((id *)(*(_QWORD *)(a1[7] + 8) + 40), a2);
LABEL_14:

}

void sub_100013544(_QWORD *a1, void *a2, void *a3)
{
  id v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  id v10;

  v10 = a2;
  v5 = a3;
  if (v5 && !*(_QWORD *)(*(_QWORD *)(a1[6] + 8) + 40))
  {
    v6 = objc_claimAutoreleasedReturnValue(+[CKPrettyError errorWithDomain:code:error:format:](CKPrettyError, "errorWithDomain:code:error:format:", CKUnderlyingErrorDomain, 8004, v5, CFSTR("Vetting record failed: %@"), a1[4], v10));
    v7 = *(_QWORD *)(a1[6] + 8);
    v8 = *(void **)(v7 + 40);
    *(_QWORD *)(v7 + 40) = v6;

  }
  v9 = a1[5];
  if (v9)
    (*(void (**)(uint64_t, _QWORD, _QWORD))(v9 + 16))(v9, *(_QWORD *)(*(_QWORD *)(a1[6] + 8) + 40), *(_QWORD *)(*(_QWORD *)(a1[7] + 8) + 40));

}

void sub_100013758(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  BOOL v13;
  uint64_t v14;
  void *v15;
  void *v16;
  NSObject *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  NSObject *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  NSObject *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  NSObject *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  NSObject *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  NSObject *v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  void *v59;
  NSObject *v60;
  void *v61;
  void *v62;
  void *v63;
  void *v64;
  void *v65;
  id v66;
  void *v67;
  void *v68;
  id v69;
  id v70;
  uint64_t v71;
  void *v72;
  void *v73;
  id v74;
  void *v75;
  uint64_t v76;
  void *v77;
  void *v78;
  void *v79;
  void *v80;
  _QWORD v81[4];
  id v82;
  id v83;
  id v84;
  id v85;
  uint8_t buf[4];
  void *v87;
  __int16 v88;
  uint64_t v89;
  __int16 v90;
  void *v91;
  __int16 v92;
  void *v93;

  v5 = a2;
  v6 = a3;
  v7 = v6;
  if (v5)
  {
    v8 = *(_QWORD *)(a1 + 48);
    if (v8)
      (*(void (**)(uint64_t, id, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD))(v8 + 16))(v8, v5, 0, 0, 0, 0, 0);
  }
  else
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "objectForKeyedSubscript:", kCKCompleteParticipantVettingVettingRecordContainerKey));
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "objectForKeyedSubscript:", kCKCompleteParticipantVettingVettingRecordEnvironmentKey));
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "objectForKeyedSubscript:", kCKCompleteParticipantVettingVettingRecordShareTitleKey));
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "objectForKeyedSubscript:", kCKCompleteParticipantVettingVettingRecordEmailKey));
    v80 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "objectForKeyedSubscript:", kCKCompleteParticipantVettingVettingRecordPhoneKey));
    if (v9)
      v13 = v10 == 0;
    else
      v13 = 1;
    if (v13)
    {
      v5 = (id)objc_claimAutoreleasedReturnValue(+[CKPrettyError errorWithDomain:code:error:format:](CKPrettyError, "errorWithDomain:code:error:format:", CKUnderlyingErrorDomain, 8003, 0, CFSTR("Vetting record doesn't contain container:%@ or environment:%@"), v9, v10));
      v14 = *(_QWORD *)(a1 + 48);
      if (v14)
        (*(void (**)(uint64_t, id, void *, void *, void *, _QWORD, _QWORD))(v14 + 16))(v14, v5, v11, v12, v80, 0, 0);
    }
    else
    {
      v78 = v11;
      if (ck_log_initialization_predicate != -1)
        dispatch_once((dispatch_once_t *)&ck_log_initialization_predicate, ck_log_initialization_block);
      v15 = (void *)ck_log_facility_ck;
      v77 = v12;
      if (os_log_type_enabled(ck_log_facility_ck, OS_LOG_TYPE_INFO))
      {
        v16 = *(void **)(a1 + 32);
        v17 = v15;
        v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "url"));
        v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "CKURLThroughSlug"));
        v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "url"));
        v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "CKPathAfterSlug"));
        *(_DWORD *)buf = 138544130;
        v87 = v19;
        v88 = 2160;
        v89 = 1752392040;
        v90 = 2112;
        v91 = v21;
        v92 = 2114;
        v93 = v9;
        _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_INFO, "Vetting record for: %{public}@%{mask.hash}@, containerName: %{public}@", buf, 0x2Au);

        if (ck_log_initialization_predicate != -1)
          dispatch_once((dispatch_once_t *)&ck_log_initialization_predicate, ck_log_initialization_block);
      }
      v22 = (void *)ck_log_facility_ck;
      if (os_log_type_enabled(ck_log_facility_ck, OS_LOG_TYPE_INFO))
      {
        v23 = *(void **)(a1 + 32);
        v24 = v22;
        v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "url"));
        v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v25, "CKURLThroughSlug"));
        v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "url"));
        v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v27, "CKPathAfterSlug"));
        *(_DWORD *)buf = 138544130;
        v87 = v26;
        v88 = 2160;
        v89 = 1752392040;
        v90 = 2112;
        v91 = v28;
        v92 = 2114;
        v93 = v10;
        _os_log_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_INFO, "Vetting record for: %{public}@%{mask.hash}@, environmentName: %{public}@", buf, 0x2Au);

        if (ck_log_initialization_predicate != -1)
          dispatch_once((dispatch_once_t *)&ck_log_initialization_predicate, ck_log_initialization_block);
      }
      v29 = (void *)ck_log_facility_ck;
      if (os_log_type_enabled(ck_log_facility_ck, OS_LOG_TYPE_INFO))
      {
        v30 = *(void **)(a1 + 32);
        v31 = v29;
        v32 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v30, "url"));
        v33 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v32, "CKURLThroughSlug"));
        v34 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "url"));
        v35 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v34, "CKPathAfterSlug"));
        *(_DWORD *)buf = 138544130;
        v87 = v33;
        v88 = 2160;
        v89 = 1752392040;
        v90 = 2112;
        v91 = v35;
        v92 = 2112;
        v93 = v11;
        _os_log_impl((void *)&_mh_execute_header, v31, OS_LOG_TYPE_INFO, "Vetting record for: %{public}@%{mask.hash}@, shareTitle: %@", buf, 0x2Au);

        if (ck_log_initialization_predicate != -1)
          dispatch_once((dispatch_once_t *)&ck_log_initialization_predicate, ck_log_initialization_block);
      }
      v36 = (void *)ck_log_facility_ck;
      if (os_log_type_enabled(ck_log_facility_ck, OS_LOG_TYPE_INFO))
      {
        v37 = *(void **)(a1 + 32);
        v38 = v36;
        v39 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v37, "url"));
        v40 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v39, "CKURLThroughSlug"));
        v41 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "url"));
        v42 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v41, "CKPathAfterSlug"));
        *(_DWORD *)buf = 138544130;
        v87 = v40;
        v88 = 2160;
        v89 = 1752392040;
        v90 = 2112;
        v91 = v42;
        v92 = 2112;
        v93 = v77;
        _os_log_impl((void *)&_mh_execute_header, v38, OS_LOG_TYPE_INFO, "Vetting record for: %{public}@%{mask.hash}@, email: %@", buf, 0x2Au);

        if (ck_log_initialization_predicate != -1)
          dispatch_once((dispatch_once_t *)&ck_log_initialization_predicate, ck_log_initialization_block);
      }
      v43 = (void *)ck_log_facility_ck;
      if (os_log_type_enabled(ck_log_facility_ck, OS_LOG_TYPE_INFO))
      {
        v44 = *(void **)(a1 + 32);
        v45 = v43;
        v46 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v44, "url"));
        v47 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v46, "CKURLThroughSlug"));
        v48 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "url"));
        v49 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v48, "CKPathAfterSlug"));
        *(_DWORD *)buf = 138544130;
        v87 = v47;
        v88 = 2160;
        v89 = 1752392040;
        v90 = 2112;
        v91 = v49;
        v92 = 2112;
        v93 = v80;
        _os_log_impl((void *)&_mh_execute_header, v45, OS_LOG_TYPE_INFO, "Vetting record for: %{public}@%{mask.hash}@, phone: %@", buf, 0x2Au);

        if (ck_log_initialization_predicate != -1)
          dispatch_once((dispatch_once_t *)&ck_log_initialization_predicate, ck_log_initialization_block);
      }
      v50 = (void *)ck_log_facility_ck;
      v79 = v9;
      if (os_log_type_enabled(ck_log_facility_ck, OS_LOG_TYPE_INFO))
      {
        v51 = *(void **)(a1 + 32);
        v52 = v50;
        v53 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v51, "url"));
        v54 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v53, "CKURLThroughSlug"));
        v55 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "url"));
        v56 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v55, "CKPathAfterSlug"));
        v57 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "objectForKeyedSubscript:", kCKCompleteParticipantVettingVettingRecordRoutingKeyKey));
        *(_DWORD *)buf = 138544130;
        v87 = v54;
        v88 = 2160;
        v89 = 1752392040;
        v90 = 2112;
        v91 = v56;
        v92 = 2114;
        v93 = v57;
        _os_log_impl((void *)&_mh_execute_header, v52, OS_LOG_TYPE_INFO, "Vetting record for: %{public}@%{mask.hash}@, routingKey: %{public}@", buf, 0x2Au);

        v9 = v79;
        if (ck_log_initialization_predicate != -1)
          dispatch_once((dispatch_once_t *)&ck_log_initialization_predicate, ck_log_initialization_block);
      }
      v58 = (void *)ck_log_facility_ck;
      if (os_log_type_enabled(ck_log_facility_ck, OS_LOG_TYPE_INFO))
      {
        v59 = *(void **)(a1 + 32);
        v60 = v58;
        v61 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v59, "url"));
        v62 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v61, "CKURLThroughSlug"));
        v63 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "url"));
        v64 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v63, "CKPathAfterSlug"));
        v65 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "objectForKeyedSubscript:", kCKCompleteParticipantVettingVettingRecordBaseTokenKey));
        *(_DWORD *)buf = 138544130;
        v87 = v62;
        v88 = 2160;
        v89 = 1752392040;
        v90 = 2112;
        v91 = v64;
        v92 = 2114;
        v93 = v65;
        _os_log_impl((void *)&_mh_execute_header, v60, OS_LOG_TYPE_INFO, "Vetting record for: %{public}@%{mask.hash}@, baseToken: %{public}@", buf, 0x2Au);

        v9 = v79;
      }
      v66 = objc_msgSend(objc_alloc((Class)CKContainerID), "initWithContainerIdentifier:environment:", v9, CKContainerEnvironmentFromString(v10));
      if (__sTestOverridesAvailable
        && (v67 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "testDevice")),
            v67,
            v67))
      {
        v68 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "testDevice"));
        v69 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v68, "containerWithContainerID:", v66));

      }
      else
      {
        v69 = objc_msgSend(objc_alloc((Class)CKContainer), "initWithContainerID:", v66);
      }
      v70 = objc_alloc((Class)CKCompleteParticipantVettingOperation);
      v71 = *(_QWORD *)(a1 + 40);
      v72 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "url"));
      v73 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v72, "host"));
      v74 = objc_msgSend(v70, "initWithVettingToken:vettingRecord:displayedHostname:", v71, v7, v73);

      v75 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v74, "resolvedConfiguration"));
      objc_msgSend(v75, "setRequestOriginator:", 2);

      v81[0] = _NSConcreteStackBlock;
      v81[1] = 3221225472;
      v81[2] = sub_100014214;
      v81[3] = &unk_100024B48;
      v85 = *(id *)(a1 + 48);
      v11 = v78;
      v82 = v78;
      v12 = v77;
      v83 = v77;
      v84 = v80;
      objc_msgSend(v74, "setCompleteParticipantVettingCompletionBlock:", v81);
      v76 = *(_QWORD *)(a1 + 56);
      if (v76)
        (*(void (**)(void))(v76 + 16))();
      objc_msgSend(v69, "addOperation:", v74);

      v5 = 0;
      v9 = v79;
    }

  }
}

uint64_t sub_100014214(_QWORD *a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t result;

  result = a1[7];
  if (result)
    return (*(uint64_t (**)(uint64_t, uint64_t, _QWORD, _QWORD, _QWORD, uint64_t, uint64_t))(result + 16))(result, a2, a1[4], a1[5], a1[6], a3, a4);
  return result;
}

void sub_100014384(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id obj)
{
  objc_sync_exit(obj);
  _Unwind_Resume(a1);
}

void sub_1000144BC(_Unwind_Exception *a1)
{
  id *v1;
  id *v2;
  uint64_t v3;

  objc_destroyWeak(v2);
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v3 - 56));
  _Unwind_Resume(a1);
}

void sub_1000144E8(uint64_t a1, void *a2, void *a3, void *a4, void *a5, void *a6, void *a7)
{
  id v13;
  id v14;
  id v15;
  id v16;
  id v17;
  id WeakRetained;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  id v25;
  void *v26;
  void *v27;
  _BOOL4 v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  NSObject *log;
  BOOL v34;
  void *v35;
  id v36;
  uint8_t buf[4];
  void *v38;
  __int16 v39;
  uint64_t v40;
  __int16 v41;
  void *v42;
  __int16 v43;
  id v44;

  v13 = a2;
  v36 = a3;
  v14 = a4;
  v15 = a5;
  v16 = a6;
  v17 = a7;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v19 = WeakRetained;
  if (WeakRetained)
  {
    v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(WeakRetained, "retrievingDialog"));
    objc_msgSend(v20, "abort");

    if (!v13)
    {
      v25 = v19;
      objc_sync_enter(v25);
      if (objc_msgSend(v25, "cancelled"))
      {
        v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v25, "url"));
        v13 = (id)objc_claimAutoreleasedReturnValue(+[CKPrettyError errorWithDomain:code:format:](CKPrettyError, "errorWithDomain:code:format:", CKErrorDomain, 1, CFSTR("Vetting for %@ cancelled by the user. Email/phone number vetting cancelled."), v26));

      }
      else
      {
        v13 = 0;
      }
LABEL_27:
      objc_sync_exit(v19);

      (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
      if (v13)

      goto LABEL_29;
    }
    if (ck_log_initialization_predicate != -1)
      dispatch_once((dispatch_once_t *)&ck_log_initialization_predicate, ck_log_initialization_block);
    v21 = (void *)ck_log_facility_ck;
    if (os_log_type_enabled(ck_log_facility_ck, OS_LOG_TYPE_ERROR))
    {
      log = v21;
      v35 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "url"));
      v30 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v35, "CKURLThroughSlug"));
      v31 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "url"));
      v32 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v31, "CKPathAfterSlug"));
      *(_DWORD *)buf = 138544130;
      v38 = v30;
      v39 = 2160;
      v40 = 1752392040;
      v41 = 2112;
      v42 = v32;
      v43 = 2112;
      v44 = v13;
      _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "Vetting with URL %{public}@%{mask.hash}@ yielded error %@", buf, 0x2Au);

    }
    v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "userInfo"));
    v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "objectForKeyedSubscript:", NSUnderlyingErrorKey));

    if ((objc_msgSend(v13, "isAuthenticationUserCancelled") & 1) != 0)
    {
LABEL_26:

      objc_sync_enter(v19);
      goto LABEL_27;
    }
    v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "domain"));
    if (objc_msgSend(v24, "isEqualToString:", CKErrorDomain))
    {
      if (objc_msgSend(v13, "code") == (id)9)
      {

LABEL_24:
        v29 = (void *)objc_claimAutoreleasedReturnValue(+[CKVettingAlerts alertContentForICloudAccountError:shareMetadata:shareURL:](CKVettingAlerts, "alertContentForICloudAccountError:shareMetadata:shareURL:", v13, 0, v16));
        +[CKVettingAlerts showICloudAccountSettingAlert:appName:previewRequested:isSourceICS:](CKVettingAlerts, "showICloudAccountSettingAlert:appName:previewRequested:isSourceICS:", v29, 0, 0, 0);
        goto LABEL_25;
      }
      v34 = objc_msgSend(v13, "code") == (id)115;

      if (v34)
        goto LABEL_24;
    }
    else
    {

    }
    v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "domain"));
    if (objc_msgSend(v27, "isEqualToString:", CKErrorDomain))
    {
      v28 = objc_msgSend(v23, "code") == (id)3;

      if (v28)
      {
        v29 = (void *)objc_claimAutoreleasedReturnValue(+[CKVettingAlerts alertContentDictionaryForDeviceOfflineErrorWithURLSlug:](CKVettingAlerts, "alertContentDictionaryForDeviceOfflineErrorWithURLSlug:", CFSTR("share")));
        +[CKVettingAlerts showFailureAlert:isSourceICS:](CKVettingAlerts, "showFailureAlert:isSourceICS:", v29, 0);
LABEL_25:

        goto LABEL_26;
      }
    }
    else
    {

    }
    v29 = (void *)objc_claimAutoreleasedReturnValue(+[CKVettingAlerts alertContentForCompleteVettingError:shareTitle:email:phone:reconstructedShareURL:](CKVettingAlerts, "alertContentForCompleteVettingError:shareTitle:email:phone:reconstructedShareURL:", v13, v36, v14, v15, v16));
    +[CKVettingAlerts showFailureAlert:isSourceICS:](CKVettingAlerts, "showFailureAlert:isSourceICS:", v29, 0);
    goto LABEL_25;
  }
  if (!v13)
    v13 = (id)objc_claimAutoreleasedReturnValue(+[CKPrettyError errorWithDomain:code:format:](CKPrettyError, "errorWithDomain:code:format:", CKErrorDomain, 1000, CFSTR("Vetting handler went nil waiting for vetting to complete")));
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

LABEL_29:
}

void sub_10001497C(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_100014998(uint64_t a1)
{
  void *v1;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v1 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(WeakRetained, "retrievingDialog"));
  objc_msgSend(v1, "abort");

}

void sub_100014B30(id a1)
{
  uint64_t v1;
  void *v2;

  v1 = objc_claimAutoreleasedReturnValue(+[NSSet setWithObjects:](NSSet, "setWithObjects:", kCKCloudDocsShareURLSlug, kCKFreeformShareURLSlug, kCKGenericShareURLSlug, kCKKeynoteShareURLSlug, kCKNotesShareURLSlug, kCKNumbersShareURLSlug, kCKPagesShareURLSlug, kCKPhotosEPPMomentShareURLSlug, kCKPhotosShareURLSlug, kCKPhotosSharedLibraryShareURLSlug, kCKRemindersShareURLSlug, kCKSafariTabGroupsShareURLSlug, 0));
  v2 = (void *)qword_10002A798;
  qword_10002A798 = v1;

}

void sub_100014DA8(_Unwind_Exception *exception_object)
{
  _Unwind_Resume(exception_object);
}

void sub_100014F24(uint64_t a1)
{
  void *v1;
  _QWORD v2[4];
  id v3;

  v2[0] = _NSConcreteStackBlock;
  v2[1] = 3221225472;
  v2[2] = sub_100014F90;
  v2[3] = &unk_100024BE0;
  v1 = *(void **)(a1 + 32);
  v3 = *(id *)(a1 + 40);
  objc_msgSend(v1, "acceptShareWithCompletionHandler:", v2);

}

void sub_100014F90(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  int v5;
  id v6;

  v3 = a2;
  if (v3)
  {
    if (ck_log_initialization_predicate != -1)
      dispatch_once((dispatch_once_t *)&ck_log_initialization_predicate, ck_log_initialization_block);
    v4 = ck_log_facility_ck;
    if (os_log_type_enabled(ck_log_facility_ck, OS_LOG_TYPE_INFO))
    {
      v5 = 138412290;
      v6 = v3;
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, "Warn: Failed to accept share. %@", (uint8_t *)&v5, 0xCu);
    }
  }
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));

}

void sub_1000153CC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, id location, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,id a23)
{
  objc_destroyWeak(&location);
  objc_destroyWeak(&a23);
  _Unwind_Resume(a1);
}

void sub_1000153F0(uint64_t a1)
{
  void *v2;
  void *v3;
  NSObject *v4;
  int v5;
  id v6;

  if (ck_log_initialization_predicate != -1)
    dispatch_once((dispatch_once_t *)&ck_log_initialization_predicate, ck_log_initialization_block);
  v2 = (void *)ck_log_facility_ck;
  if (os_log_type_enabled(ck_log_facility_ck, OS_LOG_TYPE_ERROR))
  {
    v3 = *(void **)(a1 + 32);
    v4 = v2;
    v5 = 134217984;
    v6 = objc_msgSend(v3, "backgroundTaskID");
    _os_log_error_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_ERROR, "The time given for the share URL handling task %lu to complete while the app is in background has expired, the app will likely be killed now", (uint8_t *)&v5, 0xCu);

  }
}

void sub_1000154DC(uint64_t a1)
{
  void *v2;
  _QWORD v3[4];
  id v4;
  id v5;
  id v6;

  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472;
  v3[2] = sub_1000155A4;
  v3[3] = &unk_100024C30;
  v2 = *(void **)(a1 + 32);
  v4 = *(id *)(a1 + 40);
  objc_copyWeak(&v5, (id *)(a1 + 48));
  objc_copyWeak(&v6, (id *)(a1 + 56));
  objc_msgSend(v2, "acceptShareWithCompletionHandler:", v3);
  objc_destroyWeak(&v6);
  objc_destroyWeak(&v5);

}

void sub_100015588(_Unwind_Exception *a1)
{
  id *v1;
  id *v2;

  objc_destroyWeak(v2);
  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

void sub_1000155A4(id *a1, void *a2)
{
  id v3;
  void *v4;
  id v5;
  NSObject *v6;
  void *v7;
  void *v8;
  NSObject *v9;
  id v10;
  id WeakRetained;
  void *v12;
  id v13;
  void *v14;
  NSObject *v15;
  id v16;
  void *v17;
  int v18;
  id v19;
  __int16 v20;
  uint64_t v21;
  __int16 v22;
  void *v23;
  __int16 v24;
  id v25;

  v3 = a2;
  if (v3)
  {
    if (ck_log_initialization_predicate != -1)
      dispatch_once((dispatch_once_t *)&ck_log_initialization_predicate, ck_log_initialization_block);
    v4 = (void *)ck_log_facility_ck;
    if (os_log_type_enabled(ck_log_facility_ck, OS_LOG_TYPE_ERROR))
    {
      v5 = a1[4];
      v6 = v4;
      v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "CKURLThroughSlug"));
      v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1[4], "CKPathAfterSlug"));
      v18 = 138544130;
      v19 = v7;
      v20 = 2160;
      v21 = 1752392040;
      v22 = 2112;
      v23 = v8;
      v24 = 2112;
      v25 = v3;
      _os_log_error_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_ERROR, "Accepting shareURL %{public}@%{mask.hash}@ yielded error %@", (uint8_t *)&v18, 0x2Au);

    }
  }
  else
  {
    if (ck_log_initialization_predicate != -1)
      dispatch_once((dispatch_once_t *)&ck_log_initialization_predicate, ck_log_initialization_block);
    v9 = ck_log_facility_ck;
    if (os_log_type_enabled(ck_log_facility_ck, OS_LOG_TYPE_INFO))
    {
      v10 = a1[4];
      v18 = 138412290;
      v19 = v10;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_INFO, "Accepted shareURL %@ successfully", (uint8_t *)&v18, 0xCu);
    }
  }
  WeakRetained = objc_loadWeakRetained(a1 + 5);
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(WeakRetained, "activeSharingURLs"));
  objc_msgSend(v12, "CKSynchronizedRemoveObject:", a1[4]);

  v13 = objc_loadWeakRetained(a1 + 6);
  if (ck_log_initialization_predicate != -1)
    dispatch_once((dispatch_once_t *)&ck_log_initialization_predicate, ck_log_initialization_block);
  v14 = (void *)ck_log_facility_ck;
  if (os_log_type_enabled(ck_log_facility_ck, OS_LOG_TYPE_INFO))
  {
    v15 = v14;
    v16 = objc_msgSend(v13, "backgroundTaskID");
    v18 = 134217984;
    v19 = v16;
    _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_INFO, "Finished background task %lu (share URL handling)", (uint8_t *)&v18, 0xCu);

  }
  v17 = (void *)objc_claimAutoreleasedReturnValue(+[UIApplication sharedApplication](UIApplication, "sharedApplication"));
  objc_msgSend(v17, "endBackgroundTask:", objc_msgSend(v13, "backgroundTaskID"));

  objc_msgSend(v13, "setBackgroundTaskID:", UIBackgroundTaskInvalid);
}

void sub_100015CE8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, id location)
{
  uint64_t v17;

  objc_destroyWeak(&location);
  objc_destroyWeak((id *)(v17 - 96));
  _Unwind_Resume(a1);
}

void sub_100015D0C(uint64_t a1)
{
  void *v2;
  void *v3;
  NSObject *v4;
  int v5;
  id v6;

  if (ck_log_initialization_predicate != -1)
    dispatch_once((dispatch_once_t *)&ck_log_initialization_predicate, ck_log_initialization_block);
  v2 = (void *)ck_log_facility_ck;
  if (os_log_type_enabled(ck_log_facility_ck, OS_LOG_TYPE_ERROR))
  {
    v3 = *(void **)(a1 + 32);
    v4 = v2;
    v5 = 134217984;
    v6 = objc_msgSend(v3, "backgroundTaskID");
    _os_log_error_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_ERROR, "The time given for the vetting URL handling task %lu to complete while the app is in background has expired, the app will likely be killed now", (uint8_t *)&v5, 0xCu);

  }
}

void sub_100015DF8(uint64_t a1)
{
  void *v2;
  _QWORD v3[4];
  id v4;
  id v5;
  id v6;

  v2 = *(void **)(a1 + 32);
  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472;
  v3[2] = sub_100015EC4;
  v3[3] = &unk_100024C58;
  objc_copyWeak(&v5, (id *)(a1 + 48));
  v4 = *(id *)(a1 + 40);
  objc_copyWeak(&v6, (id *)(a1 + 56));
  objc_msgSend(v2, "completeVettingWithCompletionHandler:", v3);
  objc_destroyWeak(&v6);

  objc_destroyWeak(&v5);
}

void sub_100015EA8(_Unwind_Exception *a1)
{
  id *v1;
  id *v2;

  objc_destroyWeak(v2);
  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

void sub_100015EC4(id *a1, void *a2, void *a3, void *a4)
{
  id v7;
  id v8;
  id v9;
  id WeakRetained;
  void *v11;
  void *v12;
  id v13;
  NSObject *v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;
  NSObject *v19;
  void *v20;
  void *v21;
  id v22;
  void *v23;
  NSObject *v24;
  id v25;
  void *v26;
  int v27;
  id v28;
  __int16 v29;
  uint64_t v30;
  __int16 v31;
  void *v32;
  __int16 v33;
  id v34;

  v7 = a2;
  v8 = a3;
  v9 = a4;
  WeakRetained = objc_loadWeakRetained(a1 + 5);
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(WeakRetained, "activeVettingURLToVettingAcceptor"));
  objc_msgSend(v11, "CKSynchronizedRemoveObjectForKey:", a1[4]);

  if (v7)
  {
    if (ck_log_initialization_predicate != -1)
      dispatch_once((dispatch_once_t *)&ck_log_initialization_predicate, ck_log_initialization_block);
    v12 = (void *)ck_log_facility_ck;
    if (os_log_type_enabled(ck_log_facility_ck, OS_LOG_TYPE_ERROR))
    {
      v13 = a1[4];
      v14 = v12;
      v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "CKURLThroughSlug"));
      v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1[4], "CKPathAfterSlug"));
      v27 = 138544130;
      v28 = v15;
      v29 = 2160;
      v30 = 1752392040;
      v31 = 2112;
      v32 = v16;
      v33 = 2112;
      v34 = v7;
      _os_log_error_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_ERROR, "Vetting with URL %{public}@%{mask.hash}@ yielded error %@.", (uint8_t *)&v27, 0x2Au);

    }
  }
  else
  {
    if (ck_log_initialization_predicate != -1)
      dispatch_once((dispatch_once_t *)&ck_log_initialization_predicate, ck_log_initialization_block);
    v17 = (void *)ck_log_facility_ck;
    if (os_log_type_enabled(ck_log_facility_ck, OS_LOG_TYPE_INFO))
    {
      v18 = a1[4];
      v19 = v17;
      v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "CKURLThroughSlug"));
      v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1[4], "CKPathAfterSlug"));
      v27 = 138543874;
      v28 = v20;
      v29 = 2160;
      v30 = 1752392040;
      v31 = 2112;
      v32 = v21;
      _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_INFO, "Vetting with URL %{public}@%{mask.hash}@ succeeded. Performing share accept.", (uint8_t *)&v27, 0x20u);

    }
    objc_msgSend(WeakRetained, "acceptShareWithMetadata:shareURL:", v9, v8);
  }
  v22 = objc_loadWeakRetained(a1 + 6);
  if (ck_log_initialization_predicate != -1)
    dispatch_once((dispatch_once_t *)&ck_log_initialization_predicate, ck_log_initialization_block);
  v23 = (void *)ck_log_facility_ck;
  if (os_log_type_enabled(ck_log_facility_ck, OS_LOG_TYPE_INFO))
  {
    v24 = v23;
    v25 = objc_msgSend(v22, "backgroundTaskID");
    v27 = 134217984;
    v28 = v25;
    _os_log_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_INFO, "Finished background task %lu (vetting URL handling).", (uint8_t *)&v27, 0xCu);

  }
  v26 = (void *)objc_claimAutoreleasedReturnValue(+[UIApplication sharedApplication](UIApplication, "sharedApplication"));
  objc_msgSend(v26, "endBackgroundTask:", objc_msgSend(v22, "backgroundTaskID"));

  objc_msgSend(v22, "setBackgroundTaskID:", UIBackgroundTaskInvalid);
}

void sub_100016460(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, os_activity_scope_state_s a9)
{
  os_activity_scope_leave(&a9);
  _Unwind_Resume(a1);
}

void sub_100016E6C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, os_activity_scope_state_s state)
{
  os_activity_scope_leave(&state);
  _Unwind_Resume(a1);
}

id objc_msgSend_CKBladerunnerShareURLSlugBasedApplicationBundleID(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "CKBladerunnerShareURLSlugBasedApplicationBundleID");
}

id objc_msgSend_CKClientSuitableError(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "CKClientSuitableError");
}

id objc_msgSend_CKDataFromBase64URLSafeString_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "CKDataFromBase64URLSafeString:");
}

id objc_msgSend_CKFlatMap_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "CKFlatMap:");
}

id objc_msgSend_CKMapKeysAndValues_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "CKMapKeysAndValues:");
}

id objc_msgSend_CKPathAfterSlug(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "CKPathAfterSlug");
}

id objc_msgSend_CKShareURLSlugBasedApplicationName(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "CKShareURLSlugBasedApplicationName");
}

id objc_msgSend_CKSynchronizedAddIfAbsent_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "CKSynchronizedAddIfAbsent:");
}

id objc_msgSend_CKSynchronizedRemoveObject_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "CKSynchronizedRemoveObject:");
}

id objc_msgSend_CKSynchronizedRemoveObjectForKey_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "CKSynchronizedRemoveObjectForKey:");
}

id objc_msgSend_CKSynchronizedSetIfAbsentObject_forKey_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "CKSynchronizedSetIfAbsentObject:forKey:");
}

id objc_msgSend_CKURLSlug(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "CKURLSlug");
}

id objc_msgSend_CKURLThroughSlug(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "CKURLThroughSlug");
}

id objc_msgSend_JSONObjectWithData_options_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "JSONObjectWithData:options:error:");
}

id objc_msgSend_URL(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "URL");
}

id objc_msgSend_URLQueryAllowedCharacterSet(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "URLQueryAllowedCharacterSet");
}

id objc_msgSend_URLWithString_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "URLWithString:");
}

id objc_msgSend__acceptShareWithAcceptor_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_acceptShareWithAcceptor:");
}

id objc_msgSend__alertContentForAppStoreOperationWithApp_shareMetadata_keyPrefix_titleKeySuffix_bodyKeySuffix_isSourceICS_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_alertContentForAppStoreOperationWithApp:shareMetadata:keyPrefix:titleKeySuffix:bodyKeySuffix:isSourceICS:");
}

id objc_msgSend__alertContentForDropDownSelectionWithShareName_ownerName_currentUserName_currentUserFormattedUsername_dropDownTitles_locKeyPrefix_isSourceICS_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_alertContentForDropDownSelectionWithShareName:ownerName:currentUserName:currentUserFormattedUsername:dropDownTitles:locKeyPrefix:isSourceICS:");
}

id objc_msgSend__checkDataclassError_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_checkDataclassError:");
}

id objc_msgSend__checkRepresentativeDataclassEnabled_appCandidatesPresent_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_checkRepresentativeDataclassEnabled:appCandidatesPresent:");
}

id objc_msgSend__decodeURL_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_decodeURL:");
}

id objc_msgSend__deduplicateBundleToNamesMapping_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_deduplicateBundleToNamesMapping:");
}

id objc_msgSend__dismiss(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_dismiss");
}

id objc_msgSend__displayIfRequired(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_displayIfRequired");
}

id objc_msgSend__extractEmailAddressesFromProperties_into_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_extractEmailAddressesFromProperties:into:");
}

id objc_msgSend__fallbackFlowDownloadApp_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_fallbackFlowDownloadApp:");
}

id objc_msgSend__fallbackFlowDownloadAppUpdate_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_fallbackFlowDownloadAppUpdate:");
}

id objc_msgSend__fallbackFlowICloudAccountSettings_success_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_fallbackFlowICloudAccountSettings:success:");
}

id objc_msgSend__fallbackFlowWarnNetworkUnavailable_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_fallbackFlowWarnNetworkUnavailable:");
}

id objc_msgSend__fallbackFlowWarnServiceUnavailable_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_fallbackFlowWarnServiceUnavailable:");
}

id objc_msgSend__fallbackFlowWarnShareUnavailable_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_fallbackFlowWarnShareUnavailable:");
}

id objc_msgSend__fallbackFlowWebRedirect_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_fallbackFlowWebRedirect:");
}

id objc_msgSend__fetchCurrentUserNameComponents(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_fetchCurrentUserNameComponents");
}

id objc_msgSend__fetchMetadata_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_fetchMetadata:");
}

id objc_msgSend__fetchShareMetadataForAccountID_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_fetchShareMetadataForAccountID:error:");
}

id objc_msgSend__findStoreDataForBundleIDs_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_findStoreDataForBundleIDs:error:");
}

id objc_msgSend__getShareName(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_getShareName");
}

id objc_msgSend__handleAppleInternalDaemon_response_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_handleAppleInternalDaemon:response:error:");
}

id objc_msgSend__handlePotentialAppleInternalDaemon_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_handlePotentialAppleInternalDaemon:");
}

id objc_msgSend__handlePotentialOONMatches(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_handlePotentialOONMatches");
}

id objc_msgSend__handleURL_invitationToken_isSourceICS_unitTestOverrides_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_handleURL:invitationToken:isSourceICS:unitTestOverrides:");
}

id objc_msgSend__iOSwatchOSHandleMultipleAppStoreCandidates_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_iOSwatchOSHandleMultipleAppStoreCandidates:error:");
}

id objc_msgSend__initiateVettingForParticipantID_address_andThen_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_initiateVettingForParticipantID:address:andThen:");
}

id objc_msgSend__initiateVettingOfSingleOONMatch_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_initiateVettingOfSingleOONMatch:");
}

id objc_msgSend__iosShowAppSelectionDialogWithTitlesDictionary_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_iosShowAppSelectionDialogWithTitlesDictionary:");
}

id objc_msgSend__launchApp_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_launchApp:");
}

id objc_msgSend__lookUpLocalBundleIDs_success_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_lookUpLocalBundleIDs:success:");
}

id objc_msgSend__lookUpRegisteredBundleIDs_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_lookUpRegisteredBundleIDs:");
}

id objc_msgSend__notifyBladeRunner_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_notifyBladeRunner:");
}

id objc_msgSend__promptAppSelection_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_promptAppSelection:");
}

id objc_msgSend__promptForAccountIDChoiceWithAccountIDsByUsername_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_promptForAccountIDChoiceWithAccountIDsByUsername:error:");
}

id objc_msgSend__promptToOpenAppStoreLink_alertOptions_appURL_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_promptToOpenAppStoreLink:alertOptions:appURL:");
}

id objc_msgSend__requestSelectionFromMultipleOONMatches_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_requestSelectionFromMultipleOONMatches:");
}

id objc_msgSend__sanitizedShareURLSlug_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_sanitizedShareURLSlug:");
}

id objc_msgSend__schedule(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_schedule");
}

id objc_msgSend__shouldLaunchAcceptFlowForShareURL_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_shouldLaunchAcceptFlowForShareURL:");
}

id objc_msgSend__shouldSendURLToBladeRunner_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_shouldSendURLToBladeRunner:");
}

id objc_msgSend__shouldSendURLToPhotos_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_shouldSendURLToPhotos:");
}

id objc_msgSend__shouldShowICloudLoginPrompt_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_shouldShowICloudLoginPrompt:");
}

id objc_msgSend__showVettingAlert(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_showVettingAlert");
}

id objc_msgSend__strictlyUnarchivedObjectOfClasses_fromData_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_strictlyUnarchivedObjectOfClasses:fromData:error:");
}

id objc_msgSend__synchronouslyAcceptShareWithAcceptor_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_synchronouslyAcceptShareWithAcceptor:");
}

id objc_msgSend__trySelectingOONParticipant(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_trySelectingOONParticipant");
}

id objc_msgSend__urlHasALongToken_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_urlHasALongToken:");
}

id objc_msgSend__urlIsALegacyiWorkShareURL_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_urlIsALegacyiWorkShareURL:");
}

id objc_msgSend__urlIsAniWorkShareURL_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_urlIsAniWorkShareURL:");
}

id objc_msgSend__validateShareURL_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_validateShareURL:");
}

id objc_msgSend__verifySelectedApp_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_verifySelectedApp:");
}

id objc_msgSend_abort(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "abort");
}

id objc_msgSend_absoluteString(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "absoluteString");
}

id objc_msgSend_acceptQueue(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "acceptQueue");
}

id objc_msgSend_acceptShareWithCompletionHandler_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "acceptShareWithCompletionHandler:");
}

id objc_msgSend_acceptShareWithMetadata_shareURL_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "acceptShareWithMetadata:shareURL:");
}

id objc_msgSend_acceptShareWithURL_invitationToken_isSourceICS_unitTestOverrides_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "acceptShareWithURL:invitationToken:isSourceICS:unitTestOverrides:");
}

id objc_msgSend_accepting(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "accepting");
}

id objc_msgSend_accountProperties(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "accountProperties");
}

id objc_msgSend_accountPropertyForKey_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "accountPropertyForKey:");
}

id objc_msgSend_accountTypeWithAccountTypeIdentifier_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "accountTypeWithAccountTypeIdentifier:");
}

id objc_msgSend_accountWithIdentifier_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "accountWithIdentifier:");
}

id objc_msgSend_accountsWithAccountType_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "accountsWithAccountType:");
}

id objc_msgSend_activeSharingURLs(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "activeSharingURLs");
}

id objc_msgSend_activeVettingURLToVettingAcceptor(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "activeVettingURLToVettingAcceptor");
}

id objc_msgSend_activityType(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "activityType");
}

id objc_msgSend_addEntriesFromDictionary_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "addEntriesFromDictionary:");
}

id objc_msgSend_addObject_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "addObject:");
}

id objc_msgSend_addOperation_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "addOperation:");
}

id objc_msgSend_addUnitTestOverrides_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "addUnitTestOverrides:");
}

id objc_msgSend_alertContentDictionaryForDeviceOfflineErrorWithURLSlug_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "alertContentDictionaryForDeviceOfflineErrorWithURLSlug:");
}

id objc_msgSend_alertContentDictionaryForServiceUnavailableErrorWithURLSlug_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "alertContentDictionaryForServiceUnavailableErrorWithURLSlug:");
}

id objc_msgSend_alertContentForAppDownload_shareMetadata_isSourceICS_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "alertContentForAppDownload:shareMetadata:isSourceICS:");
}

id objc_msgSend_alertContentForAppStoreAppLookupFailureWithShareName_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "alertContentForAppStoreAppLookupFailureWithShareName:error:");
}

id objc_msgSend_alertContentForAppStoreUpdateLookupFailureWithShareName_appName_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "alertContentForAppStoreUpdateLookupFailureWithShareName:appName:error:");
}

id objc_msgSend_alertContentForAppUpdate_shareMetadata_isSourceICS_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "alertContentForAppUpdate:shareMetadata:isSourceICS:");
}

id objc_msgSend_alertContentForCompleteVettingError_shareTitle_email_phone_reconstructedShareURL_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "alertContentForCompleteVettingError:shareTitle:email:phone:reconstructedShareURL:");
}

id objc_msgSend_alertContentForFirstJoinAlertWithRecordName_appName_bundleID_shareMetadata_currentUserName_currentUserFormattedUsername_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "alertContentForFirstJoinAlertWithRecordName:appName:bundleID:shareMetadata:currentUserName:currentUserFormattedUsername:");
}

id objc_msgSend_alertContentForFullVettingBindingPromptWithBundleID_shareName_ownerName_shareType_isSourceICS_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "alertContentForFullVettingBindingPromptWithBundleID:shareName:ownerName:shareType:isSourceICS:");
}

id objc_msgSend_alertContentForGenericErrorWithURLSlug_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "alertContentForGenericErrorWithURLSlug:");
}

id objc_msgSend_alertContentForGenericInitiateVettingError(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "alertContentForGenericInitiateVettingError");
}

id objc_msgSend_alertContentForICloudAccountError_shareMetadata_shareURL_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "alertContentForICloudAccountError:shareMetadata:shareURL:");
}

id objc_msgSend_alertContentForInitiateVettingError_shareTitle_isEmail_address_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "alertContentForInitiateVettingError:shareTitle:isEmail:address:");
}

id objc_msgSend_alertContentForShareMetadataErrorWithURL_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "alertContentForShareMetadataErrorWithURL:");
}

id objc_msgSend_alertContentForShortcutVettingBindingPromptWithBundleID_shareName_ownerName_shareType_isSourceICS_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "alertContentForShortcutVettingBindingPromptWithBundleID:shareName:ownerName:shareType:isSourceICS:");
}

id objc_msgSend_allAccountTypes(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "allAccountTypes");
}

id objc_msgSend_allKeys(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "allKeys");
}

id objc_msgSend_allValues(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "allValues");
}

id objc_msgSend_allowsAnonymousPublicAccess(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "allowsAnonymousPublicAccess");
}

id objc_msgSend_appSpecificLocKeyForBundleID_shareType_prefix_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "appSpecificLocKeyForBundleID:shareType:prefix:");
}

id objc_msgSend_appSpecificLocKeyForURLSlug_prefix_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "appSpecificLocKeyForURLSlug:prefix:");
}

id objc_msgSend_array(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "array");
}

id objc_msgSend_arrayWithObjects_count_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "arrayWithObjects:count:");
}

id objc_msgSend_backgroundTaskID(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "backgroundTaskID");
}

id objc_msgSend_beginBackgroundTaskWithName_expirationHandler_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "beginBackgroundTaskWithName:expirationHandler:");
}

id objc_msgSend_BOOLValue(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "BOOLValue");
}

id objc_msgSend_bundleForClass_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "bundleForClass:");
}

id objc_msgSend_cancelled(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "cancelled");
}

id objc_msgSend_chooseFromMultipleBundleIDs(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "chooseFromMultipleBundleIDs");
}

id objc_msgSend_chosenAppBundleID(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "chosenAppBundleID");
}

id objc_msgSend_ck_accountProperties(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "ck_accountProperties");
}

id objc_msgSend_ck_dataclassProperties(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "ck_dataclassProperties");
}

id objc_msgSend_cloudKitShareActionWithShareMetadata_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "cloudKitShareActionWithShareMetadata:");
}

id objc_msgSend_code(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "code");
}

id objc_msgSend_compare_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "compare:");
}

id objc_msgSend_completeVettingWithCompletionHandler_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "completeVettingWithCompletionHandler:");
}

id objc_msgSend_completeVettingWithCompletionHandler_willIssueCompletionOperationHandler_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "completeVettingWithCompletionHandler:willIssueCompletionOperationHandler:");
}

id objc_msgSend_componentsJoinedByString_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "componentsJoinedByString:");
}

id objc_msgSend_componentsSeparatedByString_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "componentsSeparatedByString:");
}

id objc_msgSend_componentsWithURL_resolvingAgainstBaseURL_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "componentsWithURL:resolvingAgainstBaseURL:");
}

id objc_msgSend_containerID(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "containerID");
}

id objc_msgSend_containerWithContainerID_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "containerWithContainerID:");
}

id objc_msgSend_containsObject_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "containsObject:");
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

id objc_msgSend_currentHandler(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "currentHandler");
}

id objc_msgSend_currentUserFormattedUsername(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "currentUserFormattedUsername");
}

id objc_msgSend_currentUserNameComponents(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "currentUserNameComponents");
}

id objc_msgSend_dataTaskWithURL_completionHandler_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "dataTaskWithURL:completionHandler:");
}

id objc_msgSend_defaultWorkspace(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "defaultWorkspace");
}

id objc_msgSend_delegate(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "delegate");
}

id objc_msgSend_deviceTypeSpecificSuffix(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "deviceTypeSpecificSuffix");
}

id objc_msgSend_dictionary(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "dictionary");
}

id objc_msgSend_dictionaryWithObjects_forKeys_count_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "dictionaryWithObjects:forKeys:count:");
}

id objc_msgSend_domain(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "domain");
}

id objc_msgSend_emailAddress(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "emailAddress");
}

id objc_msgSend_endBackgroundTask_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "endBackgroundTask:");
}

id objc_msgSend_enumerateObjectsUsingBlock_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "enumerateObjectsUsingBlock:");
}

id objc_msgSend_errorWithDomain_code_error_format_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "errorWithDomain:code:error:format:");
}

id objc_msgSend_errorWithDomain_code_format_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "errorWithDomain:code:format:");
}

id objc_msgSend_errorWithDomain_code_userInfo_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "errorWithDomain:code:userInfo:");
}

id objc_msgSend_errorWithDomain_code_userInfo_format_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "errorWithDomain:code:userInfo:format:");
}

id objc_msgSend_fallbackFlowCause(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "fallbackFlowCause");
}

id objc_msgSend_fetchFullNameAndFormattedUsernameOfAccountWithCompletionHandler_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "fetchFullNameAndFormattedUsernameOfAccountWithCompletionHandler:");
}

id objc_msgSend_fetchMetadata(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "fetchMetadata");
}

id objc_msgSend_fetchVettingRecordWithVettingToken_completionHandler_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "fetchVettingRecordWithVettingToken:completionHandler:");
}

id objc_msgSend_firstObject(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "firstObject");
}

id objc_msgSend_getAlertOptionsFromOptions_isSourceICS_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "getAlertOptionsFromOptions:isSourceICS:");
}

id objc_msgSend_getLaunchingOptionsFromOptions_isSourceICS_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "getLaunchingOptionsFromOptions:isSourceICS:");
}

id objc_msgSend_handleCloudKitShareMetadata_completionHandler_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "handleCloudKitShareMetadata:completionHandler:");
}

id objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "handleFailureInMethod:object:file:lineNumber:description:");
}

id objc_msgSend_hasPrefix_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "hasPrefix:");
}

id objc_msgSend_host(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "host");
}

id objc_msgSend_identifier(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "identifier");
}

id objc_msgSend_infoDictionary(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "infoDictionary");
}

id objc_msgSend_initOnce(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initOnce");
}

id objc_msgSend_initWithAccountID_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithAccountID:");
}

id objc_msgSend_initWithBase64EncodedString_options_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithBase64EncodedString:options:");
}

id objc_msgSend_initWithBundleIdentifier_allowPlaceholder_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithBundleIdentifier:allowPlaceholder:error:");
}

id objc_msgSend_initWithCloudKitURL_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithCloudKitURL:");
}

id objc_msgSend_initWithCloudKitURL_invitationToken_isSourceICS_unitTestOverrides_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithCloudKitURL:invitationToken:isSourceICS:unitTestOverrides:");
}

id objc_msgSend_initWithContainerID_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithContainerID:");
}

id objc_msgSend_initWithContainerID_options_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithContainerID:options:");
}

id objc_msgSend_initWithContainerIdentifier_environment_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithContainerIdentifier:environment:");
}

id objc_msgSend_initWithEffectiveBundleID_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithEffectiveBundleID:");
}

id objc_msgSend_initWithMachServiceName_options_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithMachServiceName:options:");
}

id objc_msgSend_initWithObject1_object2_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithObject1:object2:");
}

id objc_msgSend_initWithRecordIDs_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithRecordIDs:");
}

id objc_msgSend_initWithRecordName_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithRecordName:");
}

id objc_msgSend_initWithShareMetadata_participantID_address_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithShareMetadata:participantID:address:");
}

id objc_msgSend_initWithShareMetadata_shareURL_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithShareMetadata:shareURL:");
}

id objc_msgSend_initWithShareURLs_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithShareURLs:");
}

id objc_msgSend_initWithURL_resolvingAgainstBaseURL_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithURL:resolvingAgainstBaseURL:");
}

id objc_msgSend_initWithVettingToken_vettingRecord_displayedHostname_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithVettingToken:vettingRecord:displayedHostname:");
}

id objc_msgSend_interfaceWithProtocol_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "interfaceWithProtocol:");
}

id objc_msgSend_invitationToken(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "invitationToken");
}

id objc_msgSend_isAppleInternalInstall(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "isAppleInternalInstall");
}

id objc_msgSend_isAuthenticationUserCancelled(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "isAuthenticationUserCancelled");
}

id objc_msgSend_isEnabledForDataclass_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "isEnabledForDataclass:");
}

id objc_msgSend_isEqual_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "isEqual:");
}

id objc_msgSend_isEqualToString_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "isEqualToString:");
}

id objc_msgSend_isInitialized(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "isInitialized");
}

id objc_msgSend_isProvisionedForDataclass_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "isProvisionedForDataclass:");
}

id objc_msgSend_isSourceICS(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "isSourceICS");
}

id objc_msgSend_lastObject(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "lastObject");
}

id objc_msgSend_lastPathComponent(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "lastPathComponent");
}

id objc_msgSend_length(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "length");
}

id objc_msgSend_localBundleIDsToDisplayNames(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "localBundleIDsToDisplayNames");
}

id objc_msgSend_localizedStringFromPersonNameComponents_style_options_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "localizedStringFromPersonNameComponents:style:options:");
}

id objc_msgSend_lookupInfo(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "lookupInfo");
}

id objc_msgSend_lowercaseString(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "lowercaseString");
}

id objc_msgSend_mainBundle(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "mainBundle");
}

id objc_msgSend_makeStateTransition_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "makeStateTransition:");
}

id objc_msgSend_matterhornName(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "matterhornName");
}

id objc_msgSend_mediumNameFromComponents_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "mediumNameFromComponents:");
}

id objc_msgSend_metadataIndicatedContainer(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "metadataIndicatedContainer");
}

id objc_msgSend_mutableCopy(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "mutableCopy");
}

id objc_msgSend_nameComponents(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "nameComponents");
}

id objc_msgSend_objectAtIndexedSubscript_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "objectAtIndexedSubscript:");
}

id objc_msgSend_objectForKey_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "objectForKey:");
}

id objc_msgSend_objectForKey_ofClass_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "objectForKey:ofClass:");
}

id objc_msgSend_objectForKeyedSubscript_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "objectForKeyedSubscript:");
}

id objc_msgSend_openApplication_withOptions_completion_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "openApplication:withOptions:completion:");
}

id objc_msgSend_openSensitiveURL_withOptions_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "openSensitiveURL:withOptions:error:");
}

id objc_msgSend_openURL_configuration_completionHandler_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "openURL:configuration:completionHandler:");
}

id objc_msgSend_openURL_withOptions_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "openURL:withOptions:error:");
}

id objc_msgSend_optionsWithDictionary_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "optionsWithDictionary:");
}

id objc_msgSend_outOfNetworkMatches(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "outOfNetworkMatches");
}

id objc_msgSend_ownerIdentity(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "ownerIdentity");
}

id objc_msgSend_participantID(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "participantID");
}

id objc_msgSend_participantRole(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "participantRole");
}

id objc_msgSend_participantStatus(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "participantStatus");
}

id objc_msgSend_path(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "path");
}

id objc_msgSend_pathComponents(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "pathComponents");
}

id objc_msgSend_percentEncodedQuery(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "percentEncodedQuery");
}

id objc_msgSend_phoneNumber(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "phoneNumber");
}

id objc_msgSend_platformSpecificAlertOptionsWithOptions_bundleIdentifier_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "platformSpecificAlertOptionsWithOptions:bundleIdentifier:");
}

id objc_msgSend_promptForSingleBundleID(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "promptForSingleBundleID");
}

id objc_msgSend_publicCloudDatabase(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "publicCloudDatabase");
}

id objc_msgSend_query(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "query");
}

id objc_msgSend_rangeOfString_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "rangeOfString:");
}

id objc_msgSend_recordID(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "recordID");
}

id objc_msgSend_recordName(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "recordName");
}

id objc_msgSend_registeredAppBundleIDs(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "registeredAppBundleIDs");
}

id objc_msgSend_registeredDaemonBundleIDs(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "registeredDaemonBundleIDs");
}

id objc_msgSend_registrationDate(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "registrationDate");
}

id objc_msgSend_remoteObjectProxy(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "remoteObjectProxy");
}

id objc_msgSend_remoteObjectProxyWithErrorHandler_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "remoteObjectProxyWithErrorHandler:");
}

id objc_msgSend_removeObjectForKey_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "removeObjectForKey:");
}

id objc_msgSend_representativeDataclassEnabledWithCompletionHandler_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "representativeDataclassEnabledWithCompletionHandler:");
}

id objc_msgSend_resolvedConfiguration(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "resolvedConfiguration");
}

id objc_msgSend_resourceURL(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "resourceURL");
}

id objc_msgSend_resume(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "resume");
}

id objc_msgSend_retrievingDialog(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "retrievingDialog");
}

id objc_msgSend_retrievingDialogCancelled(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "retrievingDialogCancelled");
}

id objc_msgSend_retrievingDialogShouldDisplay(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "retrievingDialogShouldDisplay");
}

id objc_msgSend_retrievingNotification(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "retrievingNotification");
}

id objc_msgSend_retryTimes_container_participantVettingInitiatedBlock_participantVettingInitiationCompletionBlock_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "retryTimes:container:participantVettingInitiatedBlock:participantVettingInitiationCompletionBlock:");
}

id objc_msgSend_rootRecord(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "rootRecord");
}

id objc_msgSend_schedule(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "schedule");
}

id objc_msgSend_selectedAccountID(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "selectedAccountID");
}

id objc_msgSend_serviceWithDefaultShellEndpoint(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "serviceWithDefaultShellEndpoint");
}

id objc_msgSend_set(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "set");
}

id objc_msgSend_setAcceptQueue_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setAcceptQueue:");
}

id objc_msgSend_setAccepting_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setAccepting:");
}

id objc_msgSend_setAccountOverrideInfo_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setAccountOverrideInfo:");
}

id objc_msgSend_setActiveSharingURLs_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setActiveSharingURLs:");
}

id objc_msgSend_setActiveVettingURLToVettingAcceptor_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setActiveVettingURLToVettingAcceptor:");
}

id objc_msgSend_setAllowURLOverrides_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setAllowURLOverrides:");
}

id objc_msgSend_setBackgroundTaskID_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setBackgroundTaskID:");
}

id objc_msgSend_setCancelled_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setCancelled:");
}

id objc_msgSend_setChosenAppBundleID_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setChosenAppBundleID:");
}

id objc_msgSend_setCompleteParticipantVettingCompletionBlock_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setCompleteParticipantVettingCompletionBlock:");
}

id objc_msgSend_setCurrentUserFormattedUsername_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setCurrentUserFormattedUsername:");
}

id objc_msgSend_setCurrentUserNameComponents_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setCurrentUserNameComponents:");
}

id objc_msgSend_setDelegate_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setDelegate:");
}

id objc_msgSend_setFakeEntitlements_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setFakeEntitlements:");
}

id objc_msgSend_setFallbackFlowCause_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setFallbackFlowCause:");
}

id objc_msgSend_setFetchRecordsCompletionBlock_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setFetchRecordsCompletionBlock:");
}

id objc_msgSend_setFetchRegisteredBundleIDsCompletionBlock_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setFetchRegisteredBundleIDsCompletionBlock:");
}

id objc_msgSend_setFetchShareMetadataCompletionBlock_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setFetchShareMetadataCompletionBlock:");
}

id objc_msgSend_setFrontBoardOptions_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setFrontBoardOptions:");
}

id objc_msgSend_setInterruptionHandler_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setInterruptionHandler:");
}

id objc_msgSend_setInvalidationHandler_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setInvalidationHandler:");
}

id objc_msgSend_setIsInitialized_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setIsInitialized:");
}

id objc_msgSend_setLocalBundleIDsToDisplayNames_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setLocalBundleIDsToDisplayNames:");
}

id objc_msgSend_setMutableURL_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setMutableURL:");
}

id objc_msgSend_setObject_forKey_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setObject:forKey:");
}

id objc_msgSend_setObject_forKeyedSubscript_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setObject:forKeyedSubscript:");
}

id objc_msgSend_setOverwriteContainerPCSServiceIfManatee_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setOverwriteContainerPCSServiceIfManatee:");
}

id objc_msgSend_setPerRecordCompletionBlock_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setPerRecordCompletionBlock:");
}

id objc_msgSend_setPerShareMetadataBlock_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setPerShareMetadataBlock:");
}

id objc_msgSend_setQuery_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setQuery:");
}

id objc_msgSend_setRegisteredAppBundleIDs_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setRegisteredAppBundleIDs:");
}

id objc_msgSend_setRegisteredDaemonBundleIDs_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setRegisteredDaemonBundleIDs:");
}

id objc_msgSend_setRemoteObjectInterface_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setRemoteObjectInterface:");
}

id objc_msgSend_setRequestOriginator_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setRequestOriginator:");
}

id objc_msgSend_setRetrievingNotification_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setRetrievingNotification:");
}

id objc_msgSend_setScheme_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setScheme:");
}

id objc_msgSend_setSelectedAccountID_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setSelectedAccountID:");
}

id objc_msgSend_setShareAcceptor_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setShareAcceptor:");
}

id objc_msgSend_setShareInvitationTokensByShareURL_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setShareInvitationTokensByShareURL:");
}

id objc_msgSend_setShareMetadata_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setShareMetadata:");
}

id objc_msgSend_setShareName_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setShareName:");
}

id objc_msgSend_setShouldFetchRootRecord_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setShouldFetchRootRecord:");
}

id objc_msgSend_setShouldTerminateAfterFetchingMetadata_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setShouldTerminateAfterFetchingMetadata:");
}

id objc_msgSend_setSingleOONMatch_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setSingleOONMatch:");
}

id objc_msgSend_setState_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setState:");
}

id objc_msgSend_setTestTargetContainer_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setTestTargetContainer:");
}

id objc_msgSend_setWebFlowReason_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setWebFlowReason:");
}

id objc_msgSend_setWithArray_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setWithArray:");
}

id objc_msgSend_setWithObject_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setWithObject:");
}

id objc_msgSend_setWithObjects_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setWithObjects:");
}

id objc_msgSend_share(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "share");
}

id objc_msgSend_shareAcceptorRetrievingDialogDelay(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "shareAcceptorRetrievingDialogDelay");
}

id objc_msgSend_shareAcceptorRetrievingDialogMinPeriod(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "shareAcceptorRetrievingDialogMinPeriod");
}

id objc_msgSend_shareMetadata(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "shareMetadata");
}

id objc_msgSend_shareName(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "shareName");
}

id objc_msgSend_shareNeedsAcceptance(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "shareNeedsAcceptance");
}

id objc_msgSend_shareURLToAccountIDSystemAcceptationOverrides(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "shareURLToAccountIDSystemAcceptationOverrides");
}

id objc_msgSend_sharedApplication(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "sharedApplication");
}

id objc_msgSend_sharedOptions(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "sharedOptions");
}

id objc_msgSend_sharedSession(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "sharedSession");
}

id objc_msgSend_shouldShowRetrievingDialogForState_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "shouldShowRetrievingDialogForState:");
}

id objc_msgSend_shouldTerminateAfterFetchingMetadata(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "shouldTerminateAfterFetchingMetadata");
}

id objc_msgSend_showFailureAlert_isSourceICS_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "showFailureAlert:isSourceICS:");
}

id objc_msgSend_showICloudAccountSettingAlert_appName_previewRequested_isSourceICS_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "showICloudAccountSettingAlert:appName:previewRequested:isSourceICS:");
}

id objc_msgSend_showUserNotification_withCompletionBlock_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "showUserNotification:withCompletionBlock:");
}

id objc_msgSend_singleOONMatch(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "singleOONMatch");
}

id objc_msgSend_specialContainerType(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "specialContainerType");
}

id objc_msgSend_state(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "state");
}

id objc_msgSend_stateName(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "stateName");
}

id objc_msgSend_stringByAddingPercentEncodingWithAllowedCharacters_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "stringByAddingPercentEncodingWithAllowedCharacters:");
}

id objc_msgSend_stringByAppendingFormat_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "stringByAppendingFormat:");
}

id objc_msgSend_stringByAppendingString_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "stringByAppendingString:");
}

id objc_msgSend_stringByRemovingPercentEncoding(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "stringByRemovingPercentEncoding");
}

id objc_msgSend_stringByReplacingOccurrencesOfString_withString_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "stringByReplacingOccurrencesOfString:withString:");
}

id objc_msgSend_stringByTrimmingCharactersInSet_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "stringByTrimmingCharactersInSet:");
}

id objc_msgSend_stringWithFormat_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "stringWithFormat:");
}

id objc_msgSend_substringFromIndex_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "substringFromIndex:");
}

id objc_msgSend_supportedDataclassesForAccountType_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "supportedDataclassesForAccountType:");
}

id objc_msgSend_testContainer(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "testContainer");
}

id objc_msgSend_testDevice(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "testDevice");
}

id objc_msgSend_testTargetContainer(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "testTargetContainer");
}

id objc_msgSend_unitTestOverrides(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "unitTestOverrides");
}

id objc_msgSend_url(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "url");
}

id objc_msgSend_userIdentity(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "userIdentity");
}

id objc_msgSend_userInfo(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "userInfo");
}

id objc_msgSend_username(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "username");
}

id objc_msgSend_valueForKey_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "valueForKey:");
}

id objc_msgSend_valueForKeyPath_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "valueForKeyPath:");
}

id objc_msgSend_vetURL_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "vetURL:");
}

id objc_msgSend_vettingHandler(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "vettingHandler");
}

id objc_msgSend_webFlowReason(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "webFlowReason");
}

id objc_msgSend_webpageURL(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "webpageURL");
}

id objc_msgSend_whitespaceCharacterSet(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "whitespaceCharacterSet");
}

id objc_msgSend_willAcceptShareAtURL_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "willAcceptShareAtURL:");
}
