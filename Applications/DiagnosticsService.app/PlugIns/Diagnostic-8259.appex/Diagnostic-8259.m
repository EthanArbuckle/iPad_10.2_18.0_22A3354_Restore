BOOL sub_100003288(id a1, id a2)
{
  id v2;
  uint64_t v3;
  uint64_t v4;
  NSObject *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  NSObject *v10;
  void *v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
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
  BOOL v30;
  int v32;
  id v33;

  v2 = a2;
  v4 = handleForCategory(0, v3);
  v5 = objc_claimAutoreleasedReturnValue(v4);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v32 = 138412290;
    v33 = v2;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Testing Endpoint URL: %@", (uint8_t *)&v32, 0xCu);
  }

  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSURL URLWithString:](NSURL, "URLWithString:", v2));
  v8 = v6;
  if (v6 && (v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "host")), v9, v9))
  {
    v10 = objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "scheme"));
    if (!-[NSObject caseInsensitiveCompare:](v10, "caseInsensitiveCompare:", CFSTR("http")))
    {
      v30 = 1;
      goto LABEL_12;
    }
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "scheme"));
    v12 = objc_msgSend(v11, "caseInsensitiveCompare:", CFSTR("https"));

    if (!v12)
    {
      v30 = 1;
      goto LABEL_13;
    }
    v14 = handleForCategory(0, v13);
    v10 = objc_claimAutoreleasedReturnValue(v14);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      sub_100005B98(v10, v15, v16, v17, v18, v19, v20, v21);
  }
  else
  {
    v22 = handleForCategory(0, v7);
    v10 = objc_claimAutoreleasedReturnValue(v22);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      sub_100005B64(v10, v23, v24, v25, v26, v27, v28, v29);
  }
  v30 = 0;
LABEL_12:

LABEL_13:
  return v30;
}

void sub_100003474(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 2u);
}

void sub_100003C08(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,uint64_t a44,char a45,uint64_t a46,uint64_t a47,uint64_t a48,char a49)
{
  uint64_t v49;

  _Block_object_dispose(&a45, 8);
  _Block_object_dispose(&a49, 8);
  _Block_object_dispose((const void *)(v49 - 176), 8);
  _Unwind_Resume(a1);
}

uint64_t sub_100003C78(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void sub_100003C88(uint64_t a1)
{

}

void sub_100003C90(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  _QWORD v5[6];
  id v6;
  id v7;
  __int128 v8;
  uint64_t v9;

  dispatch_group_enter(*(dispatch_group_t *)(a1 + 32));
  v2 = *(void **)(a1 + 40);
  v3 = *(_QWORD *)(a1 + 48);
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_100003D44;
  v5[3] = &unk_100008290;
  v5[4] = v3;
  v5[5] = v2;
  v8 = *(_OWORD *)(a1 + 64);
  v4 = *(_QWORD *)(a1 + 88);
  v9 = *(_QWORD *)(a1 + 80);
  v6 = *(id *)(a1 + 56);
  v7 = *(id *)(a1 + 32);
  objc_msgSend(v2, "_testURL:timeout:completion:", v3, v4, v5);

}

void sub_100003D44(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  NSObject *v5;
  uint64_t v6;
  id v7;
  void *v8;
  void *v9;
  int v10;
  uint64_t v11;

  v4 = handleForCategory(0, a2);
  v5 = objc_claimAutoreleasedReturnValue(v4);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v6 = *(_QWORD *)(a1 + 32);
    v10 = 138412290;
    v11 = v6;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Testing endpoint completed: %@", (uint8_t *)&v10, 0xCu);
  }

  v7 = *(id *)(a1 + 40);
  objc_sync_enter(v7);
  v8 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40);
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithLong:](NSNumber, "numberWithLong:", a2));
  objc_msgSend(v8, "setObject:forKey:", v9, *(_QWORD *)(a1 + 32));

  if (a2)
  {
    objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 40), "addObject:", *(_QWORD *)(a1 + 32));
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 80) + 8) + 24) = 0;
  }
  objc_sync_exit(v7);

  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 48));
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 56));
}

void sub_100003E88(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_100004E60(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, char a19, uint64_t a20,uint64_t a21,uint64_t a22,char a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,char a29)
{
  uint64_t v29;

  _Block_object_dispose(&a19, 8);
  _Block_object_dispose(&a23, 8);
  _Block_object_dispose(&a29, 8);
  _Block_object_dispose((const void *)(v29 - 160), 8);
  _Unwind_Resume(a1);
}

void sub_100004EB0(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7;
  id v8;
  id v9;
  uint64_t v10;
  void *v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  void *v17;
  id v18;
  id v19;

  v7 = a2;
  v8 = a3;
  v9 = a4;
  v10 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v11 = *(void **)(v10 + 40);
  *(_QWORD *)(v10 + 40) = v7;
  v12 = v7;

  v19 = v8;
  v13 = objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "allHeaderFields"));
  v14 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v15 = *(void **)(v14 + 40);
  *(_QWORD *)(v14 + 40) = v13;

  v16 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
  v17 = *(void **)(v16 + 40);
  *(_QWORD *)(v16 + 40) = v9;
  v18 = v9;

  LODWORD(v17) = objc_msgSend(v19, "statusCode");
  *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24) = (_DWORD)v17;
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));

}

void sub_100005AA8(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_100005B4C(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 0xCu);
}

void sub_100005B64(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_100003474((void *)&_mh_execute_header, a1, a3, "URL is invalid", a5, a6, a7, a8, 0);
}

void sub_100005B98(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_100003474((void *)&_mh_execute_header, a1, a3, "URL scheme is invalid", a5, a6, a7, a8, 0);
}

void sub_100005BCC(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_100005B4C((void *)&_mh_execute_header, a2, a3, "%@: HTTP request check failed.", a5, a6, a7, a8, 2u);
  sub_100005B5C();
}

void sub_100005C30(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_100005B4C((void *)&_mh_execute_header, a2, a3, "%@: Local network check failed.", a5, a6, a7, a8, 2u);
  sub_100005B5C();
}

void sub_100005C94(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_100005B4C((void *)&_mh_execute_header, a2, a3, "%@: network status could not be determined.", a5, a6, a7, a8, 2u);
  sub_100005B5C();
}

id objc_msgSend_URL(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "URL");
}

id objc_msgSend_URLWithString_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "URLWithString:");
}

id objc_msgSend_UTF8String(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "UTF8String");
}

id objc_msgSend__calculateTimeIntervalFrom_To_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_calculateTimeIntervalFrom:To:");
}

id objc_msgSend__connectionEstablishmentTime_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_connectionEstablishmentTime:");
}

id objc_msgSend__dnsResolutionTime_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_dnsResolutionTime:");
}

id objc_msgSend__flagIsReachable_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_flagIsReachable:");
}

id objc_msgSend__httpCheckWithURL_timeout_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_httpCheckWithURL:timeout:");
}

id objc_msgSend__httpRequestTime_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_httpRequestTime:");
}

id objc_msgSend__httpResponseTime_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_httpResponseTime:");
}

id objc_msgSend__httpSendRequestWithURL_timeout_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_httpSendRequestWithURL:timeout:error:");
}

id objc_msgSend__localNetworkCheckWithHostName_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_localNetworkCheckWithHostName:");
}

id objc_msgSend__remoteAddress_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_remoteAddress:");
}

id objc_msgSend__remotePort_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_remotePort:");
}

id objc_msgSend__requestURL_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_requestURL:");
}

id objc_msgSend__testURL_timeout_completion_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_testURL:timeout:completion:");
}

id objc_msgSend_addObject_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "addObject:");
}

id objc_msgSend_allHeaderFields(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "allHeaderFields");
}

id objc_msgSend_allObjects(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "allObjects");
}

id objc_msgSend_arrayWithObjects_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "arrayWithObjects:");
}

id objc_msgSend_authenticationMethod(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "authenticationMethod");
}

id objc_msgSend_caseInsensitiveCompare_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "caseInsensitiveCompare:");
}

id objc_msgSend_code(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "code");
}

id objc_msgSend_connectEndDate(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "connectEndDate");
}

id objc_msgSend_connectStartDate(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "connectStartDate");
}

id objc_msgSend_count(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "count");
}

id objc_msgSend_countByEnumeratingWithState_objects_count_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "countByEnumeratingWithState:objects:count:");
}

id objc_msgSend_credentialForTrust_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "credentialForTrust:");
}

id objc_msgSend_dataTaskWithRequest_completionHandler_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "dataTaskWithRequest:completionHandler:");
}

id objc_msgSend_dictionaryWithObjects_forKeys_count_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "dictionaryWithObjects:forKeys:count:");
}

id objc_msgSend_dk_arrayFromKey_types_maxLength_defaultValue_failed_validator_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "dk_arrayFromKey:types:maxLength:defaultValue:failed:validator:");
}

id objc_msgSend_dk_numberFromKey_lowerBound_upperBound_defaultValue_failed_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "dk_numberFromKey:lowerBound:upperBound:defaultValue:failed:");
}

id objc_msgSend_domainLookupEndDate(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "domainLookupEndDate");
}

id objc_msgSend_domainLookupStartDate(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "domainLookupStartDate");
}

id objc_msgSend_endpointURLs(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "endpointURLs");
}

id objc_msgSend_endpointsInfo(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "endpointsInfo");
}

id objc_msgSend_ephemeralSessionConfiguration(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "ephemeralSessionConfiguration");
}

id objc_msgSend_firstObject(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "firstObject");
}

id objc_msgSend_host(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "host");
}

id objc_msgSend_initEndpointsInfo(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initEndpointsInfo");
}

id objc_msgSend_inputs(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "inputs");
}

id objc_msgSend_intValue(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "intValue");
}

id objc_msgSend_isEqualToString_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "isEqualToString:");
}

id objc_msgSend_null(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "null");
}

id objc_msgSend_numberWithInt_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "numberWithInt:");
}

id objc_msgSend_numberWithLong_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "numberWithLong:");
}

id objc_msgSend_objectForKey_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "objectForKey:");
}

id objc_msgSend_objectForKeyedSubscript_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "objectForKeyedSubscript:");
}

id objc_msgSend_originalRequest(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "originalRequest");
}

id objc_msgSend_port(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "port");
}

id objc_msgSend_protectionSpace(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "protectionSpace");
}

id objc_msgSend_request(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "request");
}

id objc_msgSend_requestEndDate(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "requestEndDate");
}

id objc_msgSend_requestStartDate(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "requestStartDate");
}

id objc_msgSend_requestWithURL_cachePolicy_timeoutInterval_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "requestWithURL:cachePolicy:timeoutInterval:");
}

id objc_msgSend_responseEndDate(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "responseEndDate");
}

id objc_msgSend_responseStartDate(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "responseStartDate");
}

id objc_msgSend_result(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "result");
}

id objc_msgSend_resume(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "resume");
}

id objc_msgSend_scheme(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "scheme");
}

id objc_msgSend_serverTrust(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "serverTrust");
}

id objc_msgSend_sessionWithConfiguration_delegate_delegateQueue_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "sessionWithConfiguration:delegate:delegateQueue:");
}

id objc_msgSend_setData_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setData:");
}

id objc_msgSend_setEndpointsInfo_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setEndpointsInfo:");
}

id objc_msgSend_setFinished_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setFinished:");
}

id objc_msgSend_setHTTPMethod_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setHTTPMethod:");
}

id objc_msgSend_setInputs_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setInputs:");
}

id objc_msgSend_setObject_forKey_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setObject:forKey:");
}

id objc_msgSend_setStatusCode_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setStatusCode:");
}

id objc_msgSend_setWithArray_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setWithArray:");
}

id objc_msgSend_setWithObject_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setWithObject:");
}

id objc_msgSend_statusCode(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "statusCode");
}

id objc_msgSend_stringWithFormat_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "stringWithFormat:");
}

id objc_msgSend_timeIntervalSinceDate_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "timeIntervalSinceDate:");
}

id objc_msgSend_timeout(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "timeout");
}

id objc_msgSend_transactionMetrics(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "transactionMetrics");
}

id objc_msgSend_valueForKey_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "valueForKey:");
}
