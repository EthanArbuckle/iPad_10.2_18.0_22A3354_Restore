void sub_100003A60(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, ...)
{
  uint64_t v15;
  va_list va;

  va_start(va, a15);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v15 - 144), 8);
  _Unwind_Resume(a1);
}

uint64_t sub_100003A98(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void sub_100003AA8(uint64_t a1)
{

}

void sub_100003AB0(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7;
  id v8;
  id v9;
  id v10;
  void *v11;
  NSObject *v12;
  id CRError;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  unsigned int v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  uint64_t v21;
  uint64_t v22;
  uint8_t buf[4];
  uint64_t v24;

  v7 = a2;
  v8 = a3;
  v9 = a4;
  v10 = v8;
  v11 = v10;
  if (!v9 && (v17 = objc_msgSend(v10, "statusCode"), v7) && v17 == 200)
  {
    v18 = objc_claimAutoreleasedReturnValue(+[NSJSONSerialization JSONObjectWithData:options:error:](NSJSONSerialization, "JSONObjectWithData:options:error:", v7, 0, 0));
    v19 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
    v20 = *(void **)(v19 + 40);
    *(_QWORD *)(v19 + 40) = v18;

    v21 = handleForCategory(0);
    v12 = objc_claimAutoreleasedReturnValue(v21);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      v22 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40);
      *(_DWORD *)buf = 138412290;
      v24 = v22;
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "http response: %@", buf, 0xCu);
    }
  }
  else
  {
    v12 = objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("http status code: %d, http error: %@"), objc_msgSend(v11, "statusCode"), v9));
    CRError = createCRError((void *)0xFFFFFFFFFFFFFFF3, v12, 0);
    v14 = objc_claimAutoreleasedReturnValue(CRError);
    v15 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
    v16 = *(void **)(v15 + 40);
    *(_QWORD *)(v15 + 40) = v14;

  }
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));

}

void sub_100004294(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,char a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,char a35,uint64_t a36,uint64_t a37,uint64_t a38,char a39)
{
  uint64_t v39;

  _Block_object_dispose(&a29, 8);
  _Block_object_dispose(&a35, 8);
  _Block_object_dispose(&a39, 8);
  _Block_object_dispose((const void *)(v39 - 256), 8);
  _Block_object_dispose((const void *)(v39 - 176), 8);
  _Unwind_Resume(a1);
}

void sub_1000042F8(_QWORD *a1, void *a2, void *a3, void *a4)
{
  __CFString *v8;
  __CFString *v9;
  __CFString *v10;
  uint64_t v11;
  NSObject *v12;
  uint64_t v13;
  NSObject *v14;
  uint64_t v15;
  NSObject *v16;
  void *v17;
  uint64_t v18;
  void *v19;
  uint64_t v20;
  void *v21;
  uint64_t v22;
  NSObject *v23;
  uint64_t v24;
  uint64_t v25;
  id obj;
  uint8_t buf[4];
  const __CFString *v28;

  v8 = a2;
  v9 = a3;
  v10 = a4;
  v11 = handleForCategory(0);
  v12 = objc_claimAutoreleasedReturnValue(v11);
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v28 = v8;
    _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "Location : %@", buf, 0xCu);
  }

  v13 = handleForCategory(0);
  v14 = objc_claimAutoreleasedReturnValue(v13);
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v28 = v10;
    _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "Error    : %@", buf, 0xCu);
  }

  v15 = handleForCategory(0);
  v16 = objc_claimAutoreleasedReturnValue(v15);
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v28 = v9;
    _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "response : %@", buf, 0xCu);
  }

  objc_storeStrong((id *)(*(_QWORD *)(a1[4] + 8) + 40), a2);
  if (v10 || !*(_QWORD *)(*(_QWORD *)(a1[4] + 8) + 40))
  {
    objc_storeStrong((id *)(*(_QWORD *)(a1[7] + 8) + 40), a4);
    v24 = handleForCategory(0);
    v23 = objc_claimAutoreleasedReturnValue(v24);
    if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
      sub_100005A28();
  }
  else
  {
    v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](NSFileManager, "defaultManager"));
    v18 = *(_QWORD *)(*(_QWORD *)(a1[4] + 8) + 40);
    v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSURL fileURLWithPath:](NSURL, "fileURLWithPath:", CFSTR("/private/var/tmp/VeridianFWImage/FirmwareMap.plist")));
    v20 = *(_QWORD *)(a1[6] + 8);
    obj = *(id *)(v20 + 40);
    LOBYTE(v18) = objc_msgSend(v17, "moveItemAtURL:toURL:error:", v18, v19, &obj);
    objc_storeStrong((id *)(v20 + 40), obj);
    *(_BYTE *)(*(_QWORD *)(a1[5] + 8) + 24) = v18;

    v21 = *(void **)(*(_QWORD *)(a1[6] + 8) + 40);
    if (!*(_BYTE *)(*(_QWORD *)(a1[5] + 8) + 24) || v21)
    {
      objc_storeStrong((id *)(*(_QWORD *)(a1[7] + 8) + 40), v21);
      v25 = handleForCategory(0);
      v23 = objc_claimAutoreleasedReturnValue(v25);
      if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
        sub_100005A8C();
    }
    else
    {
      v22 = handleForCategory(0);
      v23 = objc_claimAutoreleasedReturnValue(v22);
      if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        v28 = CFSTR("/private/var/tmp/VeridianFWImage/FirmwareMap.plist");
        _os_log_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_DEFAULT, "File moved to:%@", buf, 0xCu);
      }
    }
  }

  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(*(_QWORD *)(a1[8] + 8) + 40));
}

void sub_100004EEC(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  NSObject *v5;
  int v6;
  uint64_t v7;
  __int16 v8;
  uint64_t v9;

  v4 = handleForCategory(0);
  v5 = objc_claimAutoreleasedReturnValue(v4);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v6 = 136315394;
    v7 = a1;
    v8 = 2080;
    v9 = a2;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "%s: %s", (uint8_t *)&v6, 0x16u);
  }

}

void sub_1000051FC(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint8_t *a5)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, a5, 2u);
}

void sub_100005208(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 0xCu);
}

_BYTE *sub_10000522C(_BYTE *result, _BYTE *a2)
{
  *result = 0;
  *a2 = 0;
  return result;
}

void sub_10000523C(uint64_t a1@<X8>)
{
  uint64_t v1;

  *(_QWORD *)(v1 - 8) = a1;
}

id createCRError(void *a1, void *a2, void *a3)
{
  uint64_t v5;
  unint64_t v6;
  void *v7;
  void *v8;
  uint64_t v9;
  NSObject *v10;

  v5 = a2;
  v6 = a3;
  v7 = (void *)v6;
  if (a1)
  {
    if (v5 | v6)
    {
      v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary"));
      if (v5)
      {
        v9 = handleForCategory(0);
        v10 = objc_claimAutoreleasedReturnValue(v9);
        if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
          sub_100005BE4(v5, v10);

        objc_msgSend(v8, "setObject:forKeyedSubscript:", v5, NSLocalizedDescriptionKey);
      }
      if (v7)
        objc_msgSend(v8, "setObject:forKeyedSubscript:", v7, NSUnderlyingErrorKey);
      a1 = (void *)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", CRErrorDomain, a1, v8));

    }
    else
    {
      a1 = (void *)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", CRErrorDomain, a1, 0));
    }
  }

  return a1;
}

void sub_100005904(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_100005208((void *)&_mh_execute_header, a2, a3, "Veridian FW Update Failed:%@", a5, a6, a7, a8, 2u);
  sub_100005250();
}

void sub_100005968()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[16];

  sub_100005220();
  sub_1000051FC((void *)&_mh_execute_header, v0, v1, "Asset Download Failed", v2);
  sub_100005218();
}

void sub_100005998()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[16];

  sub_100005220();
  sub_1000051FC((void *)&_mh_execute_header, v0, v1, "veridian FW Update not supported on device", v2);
  sub_100005218();
}

void sub_1000059C8()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[16];

  sub_100005220();
  sub_1000051FC((void *)&_mh_execute_header, v0, v1, "fwURL or fwDigest is too long", v2);
  sub_100005218();
}

void sub_1000059F8()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[16];

  sub_100005220();
  sub_1000051FC((void *)&_mh_execute_header, v0, v1, "Failed to get fwURL and fwDigest from AST2", v2);
  sub_100005218();
}

void sub_100005A28()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  sub_10000523C(__stack_chk_guard);
  sub_100005208((void *)&_mh_execute_header, v0, v1, "Download Failed:%@", v2, v3, v4, v5, 2u);
  sub_100005250();
}

void sub_100005A8C()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  sub_10000523C(__stack_chk_guard);
  sub_100005208((void *)&_mh_execute_header, v0, v1, "Failed to move file:%@", v2, v3, v4, v5, 2u);
  sub_100005250();
}

void sub_100005AF0()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[16];

  sub_100005220();
  sub_1000051FC((void *)&_mh_execute_header, v0, v1, "Failed to alocate resources", v2);
  sub_100005218();
}

void sub_100005B20(_BYTE *a1, _BYTE *a2)
{
  NSObject *v2;
  uint8_t *v3;

  sub_10000522C(a1, a2);
  sub_1000051FC((void *)&_mh_execute_header, v2, (uint64_t)v2, "updaterOptions failed to allocate", v3);
}

void sub_100005B4C(_BYTE *a1, _BYTE *a2)
{
  NSObject *v2;
  uint8_t *v3;

  sub_10000522C(a1, a2);
  sub_1000051FC((void *)&_mh_execute_header, v2, (uint64_t)v2, "Failed to get default AMAuthInstallRef", v3);
}

void sub_100005B78(_BYTE *a1, _BYTE *a2)
{
  NSObject *v2;
  uint8_t *v3;

  sub_10000522C(a1, a2);
  sub_1000051FC((void *)&_mh_execute_header, v2, (uint64_t)v2, "Failed to enable SSO", v3);
}

void sub_100005BA4(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "FWURL is invalid", v1, 2u);
}

void sub_100005BE4(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;

  v2 = 138412290;
  v3 = a1;
  _os_log_error_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_ERROR, "%@", (uint8_t *)&v2, 0xCu);
}

id objc_msgSend_BOOLFromKey_defaultValue_failed_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "BOOLFromKey:defaultValue:failed:");
}

id objc_msgSend_FWDigest(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "FWDigest");
}

id objc_msgSend_FWURL(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "FWURL");
}

id objc_msgSend_IsTatsuErrorNetworkingRelated_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "IsTatsuErrorNetworkingRelated:");
}

id objc_msgSend_JSONObjectWithData_options_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "JSONObjectWithData:options:error:");
}

id objc_msgSend_NSNumberFromKey_lowerBound_upperBound_defaultValue_failed_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "NSNumberFromKey:lowerBound:upperBound:defaultValue:failed:");
}

id objc_msgSend_NSStringFromKey_defaultValue_failed_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "NSStringFromKey:defaultValue:failed:");
}

id objc_msgSend_SHA256DigestString(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "SHA256DigestString");
}

id objc_msgSend_URLWithString_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "URLWithString:");
}

id objc_msgSend__downloadVeridianFirmwareWithError_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_downloadVeridianFirmwareWithError:");
}

id objc_msgSend__requestFWURLAndDigestFromAST2WithError_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_requestFWURLAndDigestFromAST2WithError:");
}

id objc_msgSend__updateVeridianFirmwareWithError_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_updateVeridianFirmwareWithError:");
}

id objc_msgSend__validateDeviceWithError_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_validateDeviceWithError:");
}

id objc_msgSend_absoluteString(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "absoluteString");
}

id objc_msgSend_ast2RequestURL(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "ast2RequestURL");
}

id objc_msgSend_caseInsensitiveCompare_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "caseInsensitiveCompare:");
}

id objc_msgSend_code(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "code");
}

id objc_msgSend_dataTaskWithRequest_completionHandler_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "dataTaskWithRequest:completionHandler:");
}

id objc_msgSend_dataWithJSONObject_options_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "dataWithJSONObject:options:error:");
}

id objc_msgSend_defaultManager(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "defaultManager");
}

id objc_msgSend_description(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "description");
}

id objc_msgSend_dictionary(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "dictionary");
}

id objc_msgSend_dictionaryWithObjects_forKeys_count_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "dictionaryWithObjects:forKeys:count:");
}

id objc_msgSend_downloadTaskWithURL_completionHandler_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "downloadTaskWithURL:completionHandler:");
}

id objc_msgSend_enableSSO_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "enableSSO:");
}

id objc_msgSend_ephemeralSessionConfiguration(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "ephemeralSessionConfiguration");
}

id objc_msgSend_errorWithDomain_code_userInfo_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "errorWithDomain:code:userInfo:");
}

id objc_msgSend_fileExistsAtPath_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "fileExistsAtPath:");
}

id objc_msgSend_fileURLWithPath_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "fileURLWithPath:");
}

id objc_msgSend_fwDigest(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "fwDigest");
}

id objc_msgSend_fwURL(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "fwURL");
}

id objc_msgSend_getBMUTicketForVeridianFWUpdateWithOptions_BMUTicket_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "getBMUTicketForVeridianFWUpdateWithOptions:BMUTicket:error:");
}

id objc_msgSend_getDefaultAMAuthInstallRef(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "getDefaultAMAuthInstallRef");
}

id objc_msgSend_getInnermostNSError_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "getInnermostNSError:");
}

id objc_msgSend_getVeridianFWVersionInfo(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "getVeridianFWVersionInfo");
}

id objc_msgSend_host(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "host");
}

id objc_msgSend_initWithAuthInstallObj_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithAuthInstallObj:");
}

id objc_msgSend_inputs(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "inputs");
}

id objc_msgSend_intValue(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "intValue");
}

id objc_msgSend_isFDRDataClassSupported_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "isFDRDataClassSupported:");
}

id objc_msgSend_isFirstAuthComplete(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "isFirstAuthComplete");
}

id objc_msgSend_isVeridianFWUpdateRequiredLite(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "isVeridianFWUpdateRequiredLite");
}

id objc_msgSend_length(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "length");
}

id objc_msgSend_mainBundle(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "mainBundle");
}

id objc_msgSend_moveItemAtURL_toURL_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "moveItemAtURL:toURL:error:");
}

id objc_msgSend_needRequestURL(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "needRequestURL");
}

id objc_msgSend_null(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "null");
}

id objc_msgSend_numberWithInt_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "numberWithInt:");
}

id objc_msgSend_numberWithInteger_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "numberWithInteger:");
}

id objc_msgSend_objectForInfoDictionaryKey_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "objectForInfoDictionaryKey:");
}

id objc_msgSend_objectForKeyedSubscript_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "objectForKeyedSubscript:");
}

id objc_msgSend_removeItemAtPath_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "removeItemAtPath:error:");
}

id objc_msgSend_requestWithURL_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "requestWithURL:");
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

id objc_msgSend_sessionWithConfiguration_delegate_delegateQueue_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "sessionWithConfiguration:delegate:delegateQueue:");
}

id objc_msgSend_setData_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setData:");
}

id objc_msgSend_setFinished_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setFinished:");
}

id objc_msgSend_setFwDigest_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setFwDigest:");
}

id objc_msgSend_setFwURL_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setFwURL:");
}

id objc_msgSend_setHTTPBody_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setHTTPBody:");
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

id objc_msgSend_setObject_forKeyedSubscript_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setObject:forKeyedSubscript:");
}

id objc_msgSend_setStatusCode_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setStatusCode:");
}

id objc_msgSend_setValue_forHTTPHeaderField_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setValue:forHTTPHeaderField:");
}

id objc_msgSend_shouldPersonalizeWithSSOByDefault(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "shouldPersonalizeWithSSOByDefault");
}

id objc_msgSend_statusCode(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "statusCode");
}

id objc_msgSend_stringWithFormat_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "stringWithFormat:");
}

id objc_msgSend_timeoutPeriod(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "timeoutPeriod");
}

id objc_msgSend_useAppleConnect(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "useAppleConnect");
}
