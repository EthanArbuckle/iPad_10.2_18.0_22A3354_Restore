void sub_100003330(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 2u);
}

void sub_1000039A0(id a1)
{
  uint64_t v1;
  NSObject *v2;
  uint8_t v3[16];

  v1 = handleForCategory(0);
  v2 = objc_claimAutoreleasedReturnValue(v1);
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v3 = 0;
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEFAULT, "Reload plugins completed", v3, 2u);
  }

}

void sub_1000040A0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, ...)
{
  uint64_t v15;
  va_list va;

  va_start(va, a15);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v15 - 144), 8);
  _Unwind_Resume(a1);
}

uint64_t sub_1000040D8(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void sub_1000040E8(uint64_t a1)
{

}

void sub_1000040F0(uint64_t a1, void *a2, void *a3, void *a4)
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
    v12 = objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("http error: %@, http status code: %d"), v9, objc_msgSend(v11, "statusCode")));
    CRError = createCRError((void *)0xFFFFFFFFFFFFFFF3, v12, 0);
    v14 = objc_claimAutoreleasedReturnValue(CRError);
    v15 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
    v16 = *(void **)(v15 + 40);
    *(_QWORD *)(v15 + 40) = v14;

  }
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));

}

void sub_1000048A8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,char a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,char a33,uint64_t a34,uint64_t a35,uint64_t a36,char a37)
{
  uint64_t v37;

  _Block_object_dispose(&a27, 8);
  _Block_object_dispose(&a33, 8);
  _Block_object_dispose(&a37, 8);
  _Block_object_dispose((const void *)(v37 - 224), 8);
  _Block_object_dispose((const void *)(v37 - 160), 8);
  _Unwind_Resume(a1);
}

void sub_10000490C(_QWORD *a1, void *a2, void *a3, void *a4)
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
  __CFString *v21;
  uint64_t v22;
  NSObject *v23;
  __CFString *v24;
  id CRError;
  uint64_t v26;
  uint64_t v27;
  id obj;
  uint8_t buf[4];
  const __CFString *v30;

  v8 = a2;
  v9 = a3;
  v10 = a4;
  v11 = handleForCategory(0);
  v12 = objc_claimAutoreleasedReturnValue(v11);
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v30 = v8;
    _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "Location : %@", buf, 0xCu);
  }

  v13 = handleForCategory(0);
  v14 = objc_claimAutoreleasedReturnValue(v13);
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v30 = v10;
    _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "Error    : %@", buf, 0xCu);
  }

  v15 = handleForCategory(0);
  v16 = objc_claimAutoreleasedReturnValue(v15);
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v30 = v9;
    _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "response : %@", buf, 0xCu);
  }

  objc_storeStrong((id *)(*(_QWORD *)(a1[4] + 8) + 40), a2);
  if (v10 || !*(_QWORD *)(*(_QWORD *)(a1[4] + 8) + 40))
  {
    v24 = CFSTR("Failed to download asset");
    v21 = v10;
LABEL_15:
    CRError = createCRError((void *)0xFFFFFFFFFFFFFFE9, v24, v21);
    v26 = objc_claimAutoreleasedReturnValue(CRError);
    v27 = *(_QWORD *)(a1[7] + 8);
    v23 = *(NSObject **)(v27 + 40);
    *(_QWORD *)(v27 + 40) = v26;
    goto LABEL_16;
  }
  v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](NSFileManager, "defaultManager"));
  v18 = *(_QWORD *)(*(_QWORD *)(a1[4] + 8) + 40);
  v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSURL fileURLWithPath:](NSURL, "fileURLWithPath:", CFSTR("/private/var/mobile/RepairDiskImage/FactoryDiskImagePersonalized.dmg")));
  v20 = *(_QWORD *)(a1[6] + 8);
  obj = *(id *)(v20 + 40);
  LOBYTE(v18) = objc_msgSend(v17, "moveItemAtURL:toURL:error:", v18, v19, &obj);
  objc_storeStrong((id *)(v20 + 40), obj);
  *(_BYTE *)(*(_QWORD *)(a1[5] + 8) + 24) = v18;

  v21 = *(__CFString **)(*(_QWORD *)(a1[6] + 8) + 40);
  if (!*(_BYTE *)(*(_QWORD *)(a1[5] + 8) + 24) || v21)
  {
    v24 = CFSTR("Failed to move file");
    goto LABEL_15;
  }
  v22 = handleForCategory(0);
  v23 = objc_claimAutoreleasedReturnValue(v22);
  if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v30 = CFSTR("/private/var/mobile/RepairDiskImage/FactoryDiskImagePersonalized.dmg");
    _os_log_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_DEFAULT, "File moved to:%@", buf, 0xCu);
  }
LABEL_16:

  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(*(_QWORD *)(a1[8] + 8) + 40));
}

void sub_100005854(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 0xCu);
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
          sub_100005B2C(v5, v10);

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

void sub_100005998(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_100003330((void *)&_mh_execute_header, a1, a3, "tatsuURL is invalid", a5, a6, a7, a8, 0);
}

void sub_1000059CC(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_100003330((void *)&_mh_execute_header, a1, a3, "PDIURL is invalid", a5, a6, a7, a8, 0);
}

void sub_100005A00(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_100005854((void *)&_mh_execute_header, a2, a3, "UpdatePlugins failed:%@", a5, a6, a7, a8, 2u);
  sub_100005864();
}

void sub_100005A64(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_100005854((void *)&_mh_execute_header, a2, a3, "Asset Download Failed:%@", a5, a6, a7, a8, 2u);
  sub_100005864();
}

void sub_100005AC8(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_100005854((void *)&_mh_execute_header, a2, a3, "Failed to get repair update URL and digest, error: %@", a5, a6, a7, a8, 2u);
  sub_100005864();
}

void sub_100005B2C(uint64_t a1, NSObject *a2)
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

id objc_msgSend_NSStringFromRequiredKey_maxLength_failed_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "NSStringFromRequiredKey:maxLength:failed:");
}

id objc_msgSend_PDIDigest(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "PDIDigest");
}

id objc_msgSend_PDIURL(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "PDIURL");
}

id objc_msgSend_SHA256DigestString(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "SHA256DigestString");
}

id objc_msgSend_URLWithString_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "URLWithString:");
}

id objc_msgSend__downloadDiskImageWithError_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_downloadDiskImageWithError:");
}

id objc_msgSend__performPluginsUpdateWithError_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_performPluginsUpdateWithError:");
}

id objc_msgSend__requestUpdateURLAndDigestFromAST2WithError_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_requestUpdateURLAndDigestFromAST2WithError:");
}

id objc_msgSend_appendString_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "appendString:");
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

id objc_msgSend_count(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "count");
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

id objc_msgSend_dictionaryWithContentsOfURL_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "dictionaryWithContentsOfURL:error:");
}

id objc_msgSend_dictionaryWithObjects_forKeys_count_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "dictionaryWithObjects:forKeys:count:");
}

id objc_msgSend_diskPluginsMap(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "diskPluginsMap");
}

id objc_msgSend_downloadTaskWithURL_completionHandler_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "downloadTaskWithURL:completionHandler:");
}

id objc_msgSend_enableSSO_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "enableSSO:");
}

id objc_msgSend_enumeratorAtPath_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "enumeratorAtPath:");
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

id objc_msgSend_getDefaultAMAuthInstallRef(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "getDefaultAMAuthInstallRef");
}

id objc_msgSend_getInnermostNSError_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "getInnermostNSError:");
}

id objc_msgSend_getPDIAPTicketUsingCache_apTicketData_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "getPDIAPTicketUsingCache:apTicketData:error:");
}

id objc_msgSend_hasSuffix_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "hasSuffix:");
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

id objc_msgSend_isApplicationInstalledWithMaxRetries_bundleName_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "isApplicationInstalledWithMaxRetries:bundleName:");
}

id objc_msgSend_moveItemAtURL_toURL_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "moveItemAtURL:toURL:error:");
}

id objc_msgSend_needRequestURL(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "needRequestURL");
}

id objc_msgSend_nextObject(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "nextObject");
}

id objc_msgSend_null(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "null");
}

id objc_msgSend_numberWithInteger_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "numberWithInteger:");
}

id objc_msgSend_objectForKeyedSubscript_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "objectForKeyedSubscript:");
}

id objc_msgSend_pdiDigest(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "pdiDigest");
}

id objc_msgSend_pdiURL(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "pdiURL");
}

id objc_msgSend_rebuildApplicationDataBase(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "rebuildApplicationDataBase");
}

id objc_msgSend_removeItemAtPath_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "removeItemAtPath:error:");
}

id objc_msgSend_requestPluginReloadOnFinishWithCompletion_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "requestPluginReloadOnFinishWithCompletion:");
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

id objc_msgSend_setPdiDigest_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setPdiDigest:");
}

id objc_msgSend_setPdiURL_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setPdiURL:");
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

id objc_msgSend_stringValue(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "stringValue");
}

id objc_msgSend_stringWithFormat_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "stringWithFormat:");
}

id objc_msgSend_tatsuURL(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "tatsuURL");
}

id objc_msgSend_timeoutPeriod(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "timeoutPeriod");
}

id objc_msgSend_useAppleConnect(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "useAppleConnect");
}
