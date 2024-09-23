void ___getClientInternalStateQueue_block_invoke()
{
  dispatch_queue_t v0;
  void *v1;
  NSObject *v2;

  dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  v2 = objc_claimAutoreleasedReturnValue();
  v0 = dispatch_queue_create("com.apple.MobileAsset.client.state", v2);
  v1 = (void *)_getClientInternalStateQueue_stateQueue;
  _getClientInternalStateQueue_stateQueue = (uint64_t)v0;

}

void ___getClientCallbackQueue_block_invoke()
{
  dispatch_queue_t v0;
  void *v1;
  NSObject *v2;

  dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  v2 = objc_claimAutoreleasedReturnValue();
  v0 = dispatch_queue_create("com.apple.MobileAsset.client.callback", v2);
  v1 = (void *)_getClientCallbackQueue_queue;
  _getClientCallbackQueue_queue = (uint64_t)v0;

}

void sendIfNecessary(int64_t a1, void *a2, void *a3, void *a4)
{
  id v7;
  id v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  void *v18;
  NSObject *v19;
  void *v20;
  NSObject *v21;
  _QWORD v22[4];
  id v23;
  id v24;
  _QWORD block[4];
  id v26;
  id v27;

  v7 = a2;
  v8 = a3;
  v9 = a4;
  v17 = v9;
  if (!v7)
  {
    _getClientCallbackQueue();
    v19 = objc_claimAutoreleasedReturnValue();
    v22[0] = MEMORY[0x1E0C809B0];
    v22[1] = 3221225472;
    v22[2] = __sendIfNecessary_block_invoke_2;
    v22[3] = &unk_1E5D5CD38;
    v23 = 0;
    v24 = v17;
    dispatch_async(v19, v22);

    v20 = v24;
LABEL_6:

    goto LABEL_7;
  }
  if (a1 != 32)
  {
    xpc_dictionary_set_int64(v7, "Result", a1);
    _getClientCallbackQueue();
    v21 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __sendIfNecessary_block_invoke;
    block[3] = &unk_1E5D5CD38;
    v27 = v17;
    v26 = v7;
    dispatch_async(v21, block);

    v20 = v27;
    goto LABEL_6;
  }
  _getCommsManager((uint64_t)v9, v10, v11, v12, v13, v14, v15, v16);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "sendAsync:clientHandler:taskDescriptor:", v7, v17, v8);

LABEL_7:
}

void _MAsendQueryMetaData(void *a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id v7;
  xpc_object_t v8;
  id v9;
  void *v10;
  void *v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  const char *v17;
  int64_t v18;
  void *v19;
  id v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  void *v29;
  NSObject *v30;
  _QWORD block[4];
  id v32;
  id v33;
  id v34;

  v5 = a1;
  v6 = a2;
  v7 = a3;
  v8 = xpc_dictionary_create(0, 0, 0);
  if (!v8)
  {
    v9 = 0;
    v18 = 6;
LABEL_17:
    xpc_dictionary_set_int64(v8, "Result", v18);
    _getClientCallbackQueue();
    v30 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = ___MAsendQueryMetaData_block_invoke;
    block[3] = &unk_1E5D5CD38;
    v33 = v7;
    v32 = v8;
    dispatch_async(v30, block);

    v29 = v33;
    goto LABEL_18;
  }
  if (v6)
  {
    objc_msgSend(v6, "queryParams");
    v9 = (id)objc_claimAutoreleasedReturnValue();

    if (v9)
    {
      v10 = (void *)MEMORY[0x1E0CB36F8];
      objc_msgSend(v6, "queryParams");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v34 = 0;
      objc_msgSend(v10, "archivedDataWithRootObject:requiringSecureCoding:error:", v11, 1, &v34);
      v9 = (id)objc_claimAutoreleasedReturnValue();
      v12 = v34;

      if (!v9 || v12)
      {
        _MobileAssetLog(0, 6, (uint64_t)"_MAsendQueryMetaData", CFSTR("could not encode query params: %@"), v13, v14, v15, v16, (uint64_t)v12);

        v18 = 8;
        goto LABEL_17;
      }
      v17 = (const char *)objc_msgSend(CFSTR("QueryParams"), "UTF8String");
      v9 = objc_retainAutorelease(v9);
      xpc_dictionary_set_data(v8, v17, (const void *)objc_msgSend(v9, "bytes"), objc_msgSend(v9, "length"));
    }
    if (!v5)
      goto LABEL_15;
  }
  else
  {
    v9 = 0;
    if (!v5)
    {
LABEL_15:
      v18 = 7;
      goto LABEL_17;
    }
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
    goto LABEL_15;
  objc_msgSend(v6, "purpose");
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  if (v19)
  {
    objc_msgSend(v6, "purpose");
    v20 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    xpc_dictionary_set_string(v8, "Purpose", (const char *)objc_msgSend(v20, "UTF8String"));

  }
  xpc_dictionary_set_string(v8, "AssetType", (const char *)objc_msgSend(objc_retainAutorelease(v5), "UTF8String"));
  xpc_dictionary_set_uint64(v8, "returnAssetTypes", objc_msgSend(v6, "returnTypes"));
  xpc_dictionary_set_uint64(v8, "messageAction", 1uLL);
  xpc_dictionary_set_BOOL(v8, "doNotBlockBeforeFirstUnlock", objc_msgSend(v6, "doNotBlockBeforeFirstUnlock"));
  _getCommsManager(v21, v22, v23, v24, v25, v26, v27, v28);
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v29, "sendAsync:clientHandler:taskDescriptor:", v8, v7, 0);
LABEL_18:

}

void sub_1AE33D494(_Unwind_Exception *a1)
{
  uint64_t v1;

  _Block_object_dispose((const void *)(v1 - 136), 8);
  _Unwind_Resume(a1);
}

_QWORD *ASServerURLForAssetType(uint64_t a1, _QWORD *a2)
{
  uint64_t v3;
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  id v14;

  v14 = 0;
  v3 = MAGetServerUrl(a1, &v14);
  v4 = v14;
  v5 = v4;
  if (v3)
  {
    if (a2)
    {
      stringForMAOperationResult(v3);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      MAError(CFSTR("com.apple.MobileAssetError"), v3, CFSTR("%@"), v7, v8, v9, v10, v11, (uint64_t)v6);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      _ASErrorForMAError(v12);
      *a2 = (id)objc_claimAutoreleasedReturnValue();

LABEL_6:
      a2 = 0;
    }
  }
  else
  {
    if (!v4)
      goto LABEL_6;
    objc_msgSend(MEMORY[0x1E0C99E98], "URLWithString:", v4);
    a2 = (_QWORD *)objc_claimAutoreleasedReturnValue();
  }

  return a2;
}

unint64_t _MAclientSendGetServerUrl(void *a1, _QWORD *a2)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  id v7;
  xpc_object_t v8;
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  void *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  __CFString *v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  unint64_t v33;
  const char *string;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  void *v41;
  unint64_t v42;

  v7 = a1;
  if (!v7 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    _MobileAssetLog(0, 3, (uint64_t)"_MAclientSendGetServerUrl", CFSTR("MobileAsset _MAclientSendGetServerUrl passed invalid assetType (must be non-nil NSString)"), v3, v4, v5, v6, v40);
    v28 = 0;
    v42 = 2;
    if (!a2)
      goto LABEL_9;
LABEL_8:
    *a2 = objc_retainAutorelease(v28);
    goto LABEL_9;
  }
  v8 = xpc_dictionary_create(0, 0, 0);
  v9 = (const char *)objc_msgSend(objc_retainAutorelease(v7), "UTF8String");
  if (v9)
  {
    xpc_dictionary_set_string(v8, "AssetType", v9);
    xpc_dictionary_set_uint64(v8, "messageAction", 0x24uLL);
    v42 = 4;
    _getCommsManager(v14, v15, v16, v17, v18, v19, v20, v21);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "sendSync:gettingResponseCode:codeForXpcError:loggingName:", v8, &v42, 1, CFSTR("MAGetServerUrl"));
    v23 = (void *)objc_claimAutoreleasedReturnValue();

    if (v42)
    {
      v28 = 0;
    }
    else if (v23)
    {
      string = xpc_dictionary_get_string(v23, "BaseUrlKey");
      if (string)
      {
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", string);
        v28 = (__CFString *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        _MobileAssetLog(0, 3, (uint64_t)"_MAclientSendGetServerUrl", CFSTR("MobileAsset _MAclientSendGetServerUrl found a null cstring for MA_BASE_URL_KEY"), v36, v37, v38, v39, v40);
        v28 = 0;
        v42 = 2;
      }
    }
    else
    {
      _MobileAssetLog(0, 3, (uint64_t)"_MAclientSendGetServerUrl", CFSTR("MAGetServerUrl returned nil reply with MAOperationSuccessful. Setting serverUrl to empty string."), v24, v25, v26, v27, v40);
      v28 = &stru_1E5D5F930;
    }

  }
  else
  {
    _MobileAssetLog(0, 3, (uint64_t)"_MAclientSendGetServerUrl", CFSTR("MobileAsset _MAclientSendGetServerUrl could not read the assetType string"), v10, v11, v12, v13, v40);
    v28 = 0;
    v42 = 2;
  }

  if (a2)
    goto LABEL_8;
LABEL_9:
  stringForMAOperationResult(v42);
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  _MobileAssetLog(0, 6, (uint64_t)"_MAclientSendGetServerUrl", CFSTR("MobileAsset _MAclientSendGetServerUrl for %@ response %lld (%@) -- Base URL: %@"), v29, v30, v31, v32, (uint64_t)v7);

  v33 = v42;
  return v33;
}

__CFString *stringForMAOperationResult(unint64_t a1)
{
  if (a1 < 6)
    return off_1E5D5D2F0[a1];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("MAOperationResult%llu"), a1);
  return (__CFString *)(id)objc_claimAutoreleasedReturnValue();
}

id _MAsendUpdateClientAccessGetPathWithPurposeSync(void *a1, void *a2, uint64_t a3, void *a4)
{
  id v7;
  id v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  xpc_object_t v14;
  id v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  void *v24;
  void *v25;
  void *v26;
  unint64_t v27;
  void *v28;
  void *v29;
  __CFString *v30;
  void *v31;
  const char *string;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v42;
  uint64_t v43;
  unint64_t v44;

  v7 = a1;
  v8 = a2;
  v9 = a4;
  v14 = xpc_dictionary_create(0, 0, 0);
  if (v14)
  {
    v15 = objc_retainAutorelease(v7);
    xpc_dictionary_set_string(v14, "AssetType", (const char *)objc_msgSend(v15, "UTF8String"));
    xpc_dictionary_set_string(v14, "AssetId", (const char *)objc_msgSend(objc_retainAutorelease(v8), "UTF8String"));
    xpc_dictionary_set_string(v14, "localAssetPath", (const char *)objc_msgSend(CFSTR("true"), "UTF8String"));
    xpc_dictionary_set_uint64(v14, "assetState", a3);
    xpc_dictionary_set_uint64(v14, "messageAction", 0x15uLL);
    if (v9)
      xpc_dictionary_set_string(v14, "Purpose", (const char *)objc_msgSend(objc_retainAutorelease(v9), "UTF8String"));
    v44 = 4;
    _getCommsManager(v16, v17, v18, v19, v20, v21, v22, v23);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "_MAsendUpdateClientAccessGetPathWithPurposeSync");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "sendSync:gettingResponseCode:codeForXpcError:loggingName:", v14, &v44, 1, v25);
    v26 = (void *)objc_claimAutoreleasedReturnValue();

    if (v26)
    {
      v27 = v44;
      v43 = (uint64_t)v15;
      if (v44)
      {
        v28 = (void *)MEMORY[0x1E0CB3940];
        stringForMAOperationResult(v44);
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v28, "stringWithFormat:", CFSTR(", unable to update last access time %ld (%@)"), v27, v29);
        v30 = (__CFString *)objc_claimAutoreleasedReturnValue();

      }
      else
      {
        v30 = &stru_1E5D5F930;
      }
      xpc_dictionary_get_int64(v26, "assetDataExistsPosNeg");
      string = xpc_dictionary_get_string(v26, "localAssetPath");
      if (string)
      {
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", string);
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        _MobileAssetLog(0, 6, (uint64_t)"_MAsendUpdateClientAccessGetPathWithPurposeSync", CFSTR("getLocalPath asset %@ %@ local path is '%@'%@%@"), v37, v38, v39, v40, v43);
        if (usingCentralizedCachedelete())
          markAssetPurgeable(v31);
      }
      else
      {
        _MobileAssetLog(0, 6, (uint64_t)"_MAsendUpdateClientAccessGetPathWithPurposeSync", CFSTR("getLocalPath asset %@ %@%@%@"), v33, v34, v35, v36, v43);
        v31 = 0;
      }

    }
    else
    {
      v31 = 0;
    }

  }
  else
  {
    _MobileAssetLog(0, 6, (uint64_t)"_MAsendUpdateClientAccessGetPathWithPurposeSync", CFSTR("getLocalPath Could not create xpc message"), v10, v11, v12, v13, v42);
    v31 = 0;
  }

  return v31;
}

void ___getCommsManager_block_invoke()
{
  MAXpcManager *v0;
  void *v1;
  uint64_t v2;
  void *v3;
  id v4;

  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "com.apple.mobileassetd.v2");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  v0 = [MAXpcManager alloc];
  _getClientCallbackQueue();
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = -[MAXpcManager initWithServiceName:callbackQueue:](v0, "initWithServiceName:callbackQueue:", v4, v1);
  v3 = (void *)_getCommsManager_commsManager;
  _getCommsManager_commsManager = v2;

}

id _getClientCallbackQueue()
{
  if (_getClientCallbackQueue_once != -1)
    dispatch_once(&_getClientCallbackQueue_once, &__block_literal_global_622);
  return (id)_getClientCallbackQueue_queue;
}

void sub_1AE33E164(_Unwind_Exception *a1)
{
  uint64_t v1;

  _Block_object_dispose((const void *)(v1 - 80), 8);
  _Unwind_Resume(a1);
}

id _getCommsManager(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  void *v8;
  uint64_t v10;

  if (_getCommsManager_commsOnce != -1)
    dispatch_once(&_getCommsManager_commsOnce, &__block_literal_global_585);
  v8 = (void *)_getCommsManager_commsManager;
  if (!_getCommsManager_commsManager)
  {
    _MobileAssetLog(0, 6, (uint64_t)"_getCommsManager", CFSTR("commsManager is nil, all xpc communication will fail"), a5, a6, a7, a8, v10);
    v8 = (void *)_getCommsManager_commsManager;
  }
  return v8;
}

void sub_1AE33EAF8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_list va;

  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

id stringWithoutNewlines(uint64_t a1)
{
  void *v1;
  void *v2;

  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@"), a1);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "stringByReplacingOccurrencesOfString:withString:", CFSTR("\n"), CFSTR(" "));
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  return v2;
}

void _MobileAssetLog(uint64_t a1, int a2, uint64_t a3, void *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  id v11;
  uint64_t v12;
  void *v13;
  __CFString *v14;
  __CFString *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  NSObject *v20;
  _BOOL4 v21;
  void *v22;
  NSObject *v23;
  NSObject *v24;
  _BOOL4 v25;
  NSObject *v26;
  _BOOL4 v27;
  _BYTE buf[12];
  __int16 v29;
  void *v30;
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  v11 = a4;
  if (gForceNSLog | gForceStdOut)
  {
    *(_QWORD *)buf = &a9;
    v12 = objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:arguments:", v11, &a9);
    v13 = (void *)v12;
    v14 = CFSTR("Unable to allocate log message");
    if (v12)
      v14 = (__CFString *)v12;
    v15 = v14;

    if (gForceNSLog)
      NSLog(CFSTR("%@"), v15);
    if (gForceStdOut)
    {
      objc_msgSend(MEMORY[0x1E0CB3608], "fileHandleWithStandardOutput");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      -[__CFString dataUsingEncoding:](v15, "dataUsingEncoding:", 2);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "writeData:", v17);

      objc_msgSend(MEMORY[0x1E0CB3608], "fileHandleWithStandardOutput");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(CFSTR("\n"), "dataUsingEncoding:", 2);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "writeData:", v19);

    }
  }
  if (!gExclusivelyNSLog)
  {
    if (a2 == 7)
    {
      logDebug();
      v24 = objc_claimAutoreleasedReturnValue();
      v25 = os_log_type_enabled(v24, OS_LOG_TYPE_DEBUG);

      if (v25)
      {
        *(_QWORD *)buf = &a9;
        v22 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:arguments:", v11, &a9);
        logDebug();
        v23 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v23, OS_LOG_TYPE_DEBUG))
          _MobileAssetLog_cold_2();
        goto LABEL_21;
      }
    }
    else if (a2 == 3)
    {
      logError();
      v20 = objc_claimAutoreleasedReturnValue();
      v21 = os_log_type_enabled(v20, OS_LOG_TYPE_ERROR);

      if (v21)
      {
        *(_QWORD *)buf = &a9;
        v22 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:arguments:", v11, &a9);
        logError();
        v23 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
          _MobileAssetLog_cold_1();
LABEL_21:

      }
    }
    else
    {
      logInfo();
      v26 = objc_claimAutoreleasedReturnValue();
      v27 = os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT);

      if (v27)
      {
        v22 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:arguments:", v11, &a9);
        logInfo();
        v23 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 136446466;
          *(_QWORD *)&buf[4] = a3;
          v29 = 2114;
          v30 = v22;
          _os_log_impl(&dword_1AE33B000, v23, OS_LOG_TYPE_DEFAULT, "%{public}s: %{public}@", buf, 0x16u);
        }
        goto LABEL_21;
      }
    }
  }

}

id logInfo()
{
  if (logInfo_logInfoOnce != -1)
    dispatch_once(&logInfo_logInfoOnce, &__block_literal_global_13);
  return (id)logInfo_infoLog;
}

id logError()
{
  if (logError_logErrorOnce != -1)
    dispatch_once(&logError_logErrorOnce, &__block_literal_global_178);
  return (id)logError_infoError;
}

void _MobileAssetLog_cold_1()
{
  os_log_t v0;
  uint8_t v1[24];
  uint64_t v2;

  v2 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_3();
  _os_log_error_impl(&dword_1AE33B000, v0, OS_LOG_TYPE_ERROR, "%{public}s: %{public}@", v1, 0x16u);
  OUTLINED_FUNCTION_8();
}

void OUTLINED_FUNCTION_0(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  NSObject *v9;

  _os_log_error_impl(a1, v9, OS_LOG_TYPE_ERROR, a4, &a9, 0xCu);
}

void OUTLINED_FUNCTION_0_0(uint64_t a1, uint64_t a2, uint64_t a3, void *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  _MobileAssetLog(0, 6, a3, a4, a5, a6, a7, a8, a9);
}

id getPlistString(void *a1, void *a2)
{
  id v3;
  id v4;
  void *v5;

  v3 = a2;
  v4 = a1;
  objc_opt_class();
  getPlistEntryOfClass(v4, v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

id getPlistNumber(void *a1, void *a2)
{
  id v3;
  id v4;
  void *v5;

  v3 = a2;
  v4 = a1;
  objc_opt_class();
  getPlistEntryOfClass(v4, v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

uint64_t getPlistNumberAsBool(void *a1, void *a2)
{
  id v3;
  id v4;
  void *v5;
  uint64_t v6;

  v3 = a2;
  v4 = a1;
  objc_opt_class();
  getPlistEntryOfClass(v4, v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = objc_msgSend(v5, "BOOLValue");
  return v6;
}

id getPlistEntryOfClass(void *a1, void *a2)
{
  id v3;
  id v4;
  char isKindOfClass;
  id v6;
  void *v7;

  v3 = a1;
  v4 = a2;
  if (!v3)
    goto LABEL_8;
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();
  v6 = 0;
  if (!v4 || (isKindOfClass & 1) == 0)
    goto LABEL_11;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
LABEL_8:
    v6 = 0;
    goto LABEL_11;
  }
  objc_msgSend(v3, "objectForKey:", v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7 && (objc_opt_isKindOfClass() & 1) != 0)
    v6 = v7;
  else
    v6 = 0;

LABEL_11:
  return v6;
}

id getPlistData(void *a1, void *a2)
{
  id v3;
  id v4;
  void *v5;

  v3 = a2;
  v4 = a1;
  objc_opt_class();
  getPlistEntryOfClass(v4, v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

id plistDecodeClasses()
{
  if (plistDecodeClasses_once != -1)
    dispatch_once(&plistDecodeClasses_once, &__block_literal_global_1);
  return (id)plistDecodeClasses__plistDecodeClasses;
}

id getPlistDictionary(void *a1, void *a2)
{
  id v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;

  v3 = a1;
  v4 = a2;
  v9 = v4;
  if (!v3 || !v4 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    _MobileAssetLog(0, 3, (uint64_t)"getPlistDictionary", CFSTR("%s: Invalid options"), v5, v6, v7, v8, (uint64_t)"getPlistDictionary");
LABEL_8:
    v14 = 0;
    goto LABEL_9;
  }
  objc_opt_class();
  getPlistEntryOfClass(v3, v9);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v14)
  {
    _MobileAssetLog(0, 3, (uint64_t)"getPlistDictionary", CFSTR("%s: Unable to extract plist object for key %@ from dict"), v10, v11, v12, v13, (uint64_t)"getPlistDictionary");
LABEL_11:
    _MobileAssetLog(0, 3, (uint64_t)"getPlistDictionary", CFSTR("%s: Extracted object for key %@ is invalid/not a dictionary"), v15, v16, v17, v18, (uint64_t)"getPlistDictionary");

    goto LABEL_8;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
    goto LABEL_11;
LABEL_9:

  return v14;
}

__CFString *stringForMAQueryResult(unint64_t a1)
{
  if (a1 < 0xF)
    return off_1E5D5D048[a1];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("MAQueryResult%llu"), a1);
  return (__CFString *)(id)objc_claimAutoreleasedReturnValue();
}

void __logInfo_block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.mobileassetd", "Notice");
  v1 = (void *)logInfo_infoLog;
  logInfo_infoLog = (uint64_t)v0;

}

void sub_1AE340B6C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void _MAsendDownloadMetaData(void *a1, void *a2, void *a3)
{
  id v5;
  id v6;
  xpc_object_t v7;
  id v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  int64_t v14;
  id v15;

  v15 = a1;
  v5 = a2;
  v6 = a3;
  v7 = xpc_dictionary_create(0, 0, 0);
  if (v7)
  {
    if (v15)
    {
      v8 = objc_retainAutorelease(v15);
      xpc_dictionary_set_string(v7, "AssetType", (const char *)objc_msgSend(v8, "UTF8String"));
      xpc_dictionary_set_uint64(v7, "messageAction", 2uLL);
      objc_msgSend(v5, "encodeAsPlist");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      if ((addObjectToMessage(v9, v7, "downloadOptionsLength", "downloadOptions") & 1) != 0)
      {
        v14 = 32;
      }
      else
      {
        _MobileAssetLog(0, 6, (uint64_t)"_MAsendDownloadMetaData", CFSTR("Bad options for asset type: %@ not sending message"), v10, v11, v12, v13, (uint64_t)v8);
        v14 = 22;
      }
    }
    else
    {
      v9 = 0;
      v14 = 19;
    }
  }
  else
  {
    v9 = 0;
    v14 = 24;
  }
  sendIfNecessary(v14, v7, 0, v6);

}

uint64_t addObjectToMessage(void *a1, void *a2, const char *a3, const char *a4)
{
  id v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  void *v17;
  size_t v18;
  uint64_t v19;
  uint64_t v21;

  v7 = a1;
  v8 = a2;
  v13 = v8;
  if (!v7 || !v8 || !a3 || !a4)
  {
    _MobileAssetLog(0, 6, (uint64_t)"addObjectToMessage", CFSTR("MobileAsset addObjectToMessage has nil parameter"), v9, v10, v11, v12, v21);
    v16 = 0;
    v15 = 0;
LABEL_11:
    v19 = 0;
    goto LABEL_12;
  }
  v14 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB36F8]), "initRequiringSecureCoding:", 1);
  v15 = v14;
  if (!v14)
  {
    v16 = 0;
    goto LABEL_11;
  }
  objc_msgSend(v14, "encodeObject:forKey:", v7, *MEMORY[0x1E0CB2CD0]);
  objc_msgSend(v15, "encodedData");
  v16 = (id)objc_claimAutoreleasedReturnValue();

  if (!v16)
    goto LABEL_11;
  objc_msgSend(v15, "encodedData");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = v17;
  if (!v17)
    goto LABEL_11;
  v18 = objc_msgSend(v17, "length");
  v16 = objc_retainAutorelease(v16);
  xpc_dictionary_set_data(v13, a4, (const void *)objc_msgSend(v16, "bytes"), v18);
  xpc_dictionary_set_double(v13, a3, (double)v18);
  v19 = 1;
LABEL_12:

  return v19;
}

uint64_t isQueryResultFailure(unint64_t a1)
{
  return (a1 > 0xE) | (0x3FFAu >> a1) & 1;
}

void ___getSandboxExtensions_block_invoke()
{
  uint64_t v0;
  void *v1;

  v0 = objc_opt_new();
  v1 = (void *)_getSandboxExtensions_extensions;
  _getSandboxExtensions_extensions = v0;

}

void _MAensureExtension(void *a1)
{
  id v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  xpc_object_t v6;
  void *v7;
  NSObject *v8;
  uint64_t v9;
  id v10;
  id v11;
  id v12;
  void *v13;
  id v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  void *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  __CFString *v29;
  int v30;
  void *v31;
  NSObject *v32;
  id v33;
  uint64_t v34;
  const char *v35;
  _QWORD v36[4];
  id v37;
  id v38;
  id v39;
  uint64_t v40;
  _QWORD block[4];
  id v42;
  id v43;
  _QWORD *v44;
  uint64_t *v45;
  const char *string;
  _QWORD v47[5];
  id v48;
  uint64_t v49;
  uint64_t *v50;
  uint64_t v51;
  char v52;

  v1 = a1;
  v49 = 0;
  v50 = &v49;
  v51 = 0x2020000000;
  v52 = 0;
  v47[0] = 0;
  v47[1] = v47;
  v47[2] = 0x3032000000;
  v47[3] = __Block_byref_object_copy__813;
  v47[4] = __Block_byref_object_dispose__814;
  v48 = 0;
  string = 0;
  v6 = xpc_dictionary_create(0, 0, 0);
  if (!v1)
  {
    _MobileAssetLog(0, 6, (uint64_t)"_MAensureExtension", CFSTR("Attempting to get sandbox extension for a nil asset type"), v2, v3, v4, v5, v34);
    v10 = 0;
    goto LABEL_8;
  }
  _getSandboxExtensions();
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  _getClientInternalStateQueue();
  v8 = objc_claimAutoreleasedReturnValue();
  v9 = MEMORY[0x1E0C809B0];
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = ___MAensureExtension_block_invoke;
  block[3] = &unk_1E5D5CE70;
  v44 = v47;
  v10 = v7;
  v42 = v10;
  v11 = v1;
  v43 = v11;
  v45 = &v49;
  dispatch_sync(v8, block);

  if (*((_BYTE *)v50 + 24))
  {
LABEL_8:
    v24 = 0;
    v14 = 0;
    goto LABEL_9;
  }
  v12 = objc_retainAutorelease(v11);
  xpc_dictionary_set_string(v6, "AssetType", (const char *)objc_msgSend(v12, "UTF8String"));
  xpc_dictionary_set_uint64(v6, "messageAction", 7uLL);
  v13 = (void *)MEMORY[0x1E0CB3940];
  v35 = getprogname();
  objc_msgSend(v13, "stringWithFormat:", CFSTR("%s"));
  v14 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  xpc_dictionary_set_string(v6, "clientName", (const char *)objc_msgSend(v14, "UTF8String"));
  v40 = 4;
  _getCommsManager(v15, v16, v17, v18, v19, v20, v21, v22);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "sendSync:gettingResponseCode:codeForXpcError:loggingName:", v6, &v40, 1, CFSTR("getLocalUrl"));
  v24 = (void *)objc_claimAutoreleasedReturnValue();

  if (v40)
  {
    v29 = CFSTR("Extension failure server side");
LABEL_5:
    v30 = 6;
LABEL_6:
    _MobileAssetLog(0, v30, (uint64_t)"_MAensureExtension", v29, v25, v26, v27, v28, (uint64_t)v35);
    goto LABEL_9;
  }
  string = xpc_dictionary_get_string(v24, (const char *)objc_msgSend(CFSTR("sandboxExtensionKey"), "UTF8String"));
  if (!string)
  {
    v29 = CFSTR("extension present");
    goto LABEL_5;
  }
  if (sandbox_extension_consume() == -1)
  {
    v29 = CFSTR("unable to consume sandbox extension");
    v30 = 3;
    goto LABEL_6;
  }
  _MobileAssetLog(0, 6, (uint64_t)"_MAensureExtension", CFSTR("Consumed extension"), v25, v26, v27, v28, (uint64_t)v35);
  objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithBytes:objCType:", &string, "^*");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  if (v31)
  {
    _getClientInternalStateQueue();
    v32 = objc_claimAutoreleasedReturnValue();
    v36[0] = v9;
    v36[1] = 3221225472;
    v36[2] = ___MAensureExtension_block_invoke_2;
    v36[3] = &unk_1E5D5CE98;
    v10 = v10;
    v37 = v10;
    v38 = v31;
    v39 = v12;
    v33 = v31;
    dispatch_sync(v32, v36);

  }
LABEL_9:

  _Block_object_dispose(v47, 8);
  _Block_object_dispose(&v49, 8);

}

void sub_1AE3419CC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,char a27)
{
  uint64_t v27;

  _Block_object_dispose(&a27, 8);
  _Block_object_dispose((const void *)(v27 - 128), 8);
  _Unwind_Resume(a1);
}

id _getClientInternalStateQueue()
{
  if (_getClientInternalStateQueue_stateOnce != -1)
    dispatch_once(&_getClientInternalStateQueue_stateOnce, &__block_literal_global_0);
  return (id)_getClientInternalStateQueue_stateQueue;
}

id _getSandboxExtensions()
{
  if (_getSandboxExtensions_once != -1)
    dispatch_once(&_getSandboxExtensions_once, &__block_literal_global_728);
  return (id)_getSandboxExtensions_extensions;
}

__CFString *stringForMADownloadResult(unint64_t a1)
{
  if (a1 < 0x56)
    return off_1E5D5D320[a1];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("MADownloadResult%llu"), a1);
  return (__CFString *)(id)objc_claimAutoreleasedReturnValue();
}

BOOL isDownloadResultSuggestingTryAgainLater(uint64_t a1)
{
  _BOOL8 result;

  result = 1;
  if ((unint64_t)(a1 - 16) > 0x37 || ((1 << (a1 - 16)) & 0x800000800C4007) == 0)
    return a1 == 3;
  return result;
}

BOOL isDownloadResultSuggestingCheckConfiguration(uint64_t a1)
{
  _BOOL8 result;

  result = 1;
  if ((unint64_t)(a1 - 25) > 0x34 || ((1 << (a1 - 25)) & 0x158246032C8007) == 0)
    return (unint64_t)(a1 - 5) < 2;
  return result;
}

BOOL isDownloadResultFailure(uint64_t a1)
{
  BOOL v1;

  if (a1)
    v1 = a1 == 14;
  else
    v1 = 1;
  return !v1;
}

__CFString *errorStringForMADownloadResult(unint64_t a1)
{
  __CFString *v2;
  void *v3;
  void *v4;

  if (a1 >= 0x56)
  {
    v3 = (void *)MEMORY[0x1E0CB3940];
    stringForMADownloadResult(a1);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "stringWithFormat:", CFSTR("Download failed due to Error %lld (%@)."), a1, v4);
    v2 = (__CFString *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v2 = off_1E5D5D788[a1];
  }
  return v2;
}

uint64_t __Block_byref_object_copy_(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

uint64_t __Block_byref_object_copy__0(uint64_t a1, uint64_t a2)
{
  uint64_t result;

  result = MEMORY[0x1AF44EFD8](*(_QWORD *)(a2 + 40));
  *(_QWORD *)(a1 + 40) = result;
  return result;
}

uint64_t __Block_byref_object_copy__1(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

uint64_t __Block_byref_object_copy__2(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

uint64_t __Block_byref_object_copy__3(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

uint64_t __Block_byref_object_copy__4(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

uint64_t __Block_byref_object_copy__5(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

uint64_t __Block_byref_object_copy__6(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

uint64_t __Block_byref_object_copy__7(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

uint64_t __Block_byref_object_copy__8(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

id MAErrorWithUnderlyingUserInfoAndString(void *a1, uint64_t a2, void *a3, void *a4, void *a5)
{
  id v9;
  id v10;
  id v11;
  id v12;
  void *v13;
  void *v14;
  id v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  void *v22;
  void *v23;
  uint64_t v25;
  id v26;
  id v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  _BYTE v32[128];
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
  v9 = a1;
  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = (void *)objc_opt_new();
  v14 = v13;
  if (v12)
    objc_msgSend(v13, "setObject:forKey:", v12, *MEMORY[0x1E0CB2D50]);
  if (v10)
    objc_msgSend(v14, "setObject:forKey:", v10, *MEMORY[0x1E0CB3388]);
  if (v11)
  {
    v25 = a2;
    v26 = v10;
    v27 = v9;
    v30 = 0u;
    v31 = 0u;
    v28 = 0u;
    v29 = 0u;
    v15 = v11;
    v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v28, v32, 16);
    if (v16)
    {
      v17 = v16;
      v18 = *(_QWORD *)v29;
      do
      {
        v19 = 0;
        do
        {
          if (*(_QWORD *)v29 != v18)
            objc_enumerationMutation(v15);
          v20 = *(_QWORD *)(*((_QWORD *)&v28 + 1) + 8 * v19);
          v21 = (void *)MEMORY[0x1AF44EE58]();
          objc_msgSend(v15, "objectForKey:", v20);
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v14, "setObject:forKey:", v22, v20);

          objc_autoreleasePoolPop(v21);
          ++v19;
        }
        while (v17 != v19);
        v17 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v28, v32, 16);
      }
      while (v17);
    }

    v10 = v26;
    v9 = v27;
    a2 = v25;
  }
  objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", v9, a2, v14);
  v23 = (void *)objc_claimAutoreleasedReturnValue();

  return v23;
}

id MAErrorForDownloadResultWithUnderlying(unint64_t a1, void *a2, void *a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  id v11;
  id v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  const __CFString *v17;
  const __CFString *v18;
  char v19;
  const __CFString *v20;
  void *v21;

  v11 = a2;
  v12 = a3;
  if (v12)
  {
    v13 = objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:arguments:", v12, &a9);
  }
  else
  {
    errorStringForMADownloadResult(a1);
    v13 = objc_claimAutoreleasedReturnValue();
  }
  v14 = (void *)v13;
  v15 = (void *)objc_opt_new();
  v16 = v15;
  if ((uint64_t)a1 <= 27)
  {
    if (a1 - 14 < 2 || !a1 || a1 == 10)
    {
LABEL_10:
      objc_msgSend(v15, "setObject:forKeyedSubscript:", MEMORY[0x1E0C9AAB0], CFSTR("usableDownload"));
      if (a1 == 10 || a1 == 28)
      {
LABEL_12:
        objc_msgSend(v16, "setObject:forKeyedSubscript:", MEMORY[0x1E0C9AAB0], CFSTR("requeryIsHelpful"));
        if (a1 <= 0x2D && ((1 << a1) & 0x260000000000) != 0)
LABEL_14:
          objc_msgSend(v16, "setObject:forKeyedSubscript:", MEMORY[0x1E0C9AAB0], CFSTR("checkServer"));
      }
    }
LABEL_15:
    if ((a1 & 0xFFFFFFFFFFFFFFFCLL) == 0x50)
      objc_msgSend(v16, "setObject:forKeyedSubscript:", MEMORY[0x1E0C9AAB0], CFSTR("timeoutWithDetail"));
    v17 = CFSTR("checkFilesystemState");
    v18 = CFSTR("checkNetwork");
    switch(a1)
    {
      case 4uLL:
      case 7uLL:
      case 0x21uLL:
      case 0x26uLL:
      case 0x4CuLL:
        goto LABEL_25;
      case 0xBuLL:
      case 0xCuLL:
      case 0x13uLL:
      case 0x14uLL:
      case 0x15uLL:
      case 0x16uLL:
      case 0x17uLL:
      case 0x27uLL:
      case 0x4AuLL:
        goto LABEL_18;
      case 0x33uLL:
      case 0x34uLL:
      case 0x35uLL:
      case 0x37uLL:
      case 0x38uLL:
      case 0x50uLL:
      case 0x51uLL:
      case 0x52uLL:
      case 0x53uLL:
        objc_msgSend(v16, "setObject:forKeyedSubscript:", MEMORY[0x1E0C9AAB0], CFSTR("checkTimeoutConditions"));
        v19 = a1 - 33;
        if (a1 - 33 > 0x2B)
          goto LABEL_26;
        if (((1 << v19) & 0xDB9200000) != 0)
        {
          v18 = CFSTR("checkNetwork");
        }
        else
        {
          if (((1 << v19) & 0x80000000021) != 0)
            goto LABEL_24;
          if (a1 != 74)
            goto LABEL_26;
LABEL_18:
          v18 = CFSTR("checkClient");
        }
LABEL_22:
        objc_msgSend(v16, "setObject:forKeyedSubscript:", MEMORY[0x1E0C9AAB0], v18);
        if (a1 - 33 > 0x2B || ((1 << (a1 - 33)) & 0x80000000021) == 0)
          goto LABEL_26;
LABEL_24:
        v17 = CFSTR("checkFilesystemState");
        goto LABEL_25;
      case 0x36uLL:
      case 0x39uLL:
      case 0x3CuLL:
      case 0x3DuLL:
      case 0x3EuLL:
      case 0x40uLL:
      case 0x41uLL:
      case 0x43uLL:
      case 0x44uLL:
        goto LABEL_22;
      default:
        goto LABEL_26;
    }
  }
  switch(a1)
  {
    case 0x1CuLL:
    case 0x1FuLL:
    case 0x20uLL:
    case 0x24uLL:
    case 0x30uLL:
      goto LABEL_12;
    case 0x1DuLL:
      goto LABEL_10;
    case 0x1EuLL:
    case 0x21uLL:
    case 0x22uLL:
    case 0x23uLL:
    case 0x26uLL:
    case 0x27uLL:
    case 0x28uLL:
    case 0x2BuLL:
    case 0x2CuLL:
    case 0x2EuLL:
    case 0x2FuLL:
      goto LABEL_15;
    case 0x25uLL:
      v17 = CFSTR("checkSpaceNeeded");
      goto LABEL_25;
    case 0x29uLL:
    case 0x2AuLL:
    case 0x2DuLL:
      goto LABEL_14;
    default:
      if (a1 != 70)
        goto LABEL_15;
      v17 = CFSTR("checkClockAndCerts");
LABEL_25:
      objc_msgSend(v16, "setObject:forKeyedSubscript:", MEMORY[0x1E0C9AAB0], v17);
      break;
  }
LABEL_26:
  if (isDownloadResultSuggestingTryAgainLater(a1))
    objc_msgSend(v16, "setObject:forKeyedSubscript:", MEMORY[0x1E0C9AAB0], CFSTR("tryAgainLater"));
  if (a1 <= 0x18 && ((1 << a1) & 0x1002306) != 0)
    objc_msgSend(v16, "setObject:forKeyedSubscript:", MEMORY[0x1E0C9AAB0], CFSTR("retryWithBackoff"));
  if (isDownloadResultSuggestingCheckConfiguration(a1))
    objc_msgSend(v16, "setObject:forKeyedSubscript:", MEMORY[0x1E0C9AAB0], CFSTR("checkConfiguration"));
  if (a1 <= 0x23)
  {
    if (((1 << a1) & 0x900000108) != 0)
    {
      v20 = CFSTR("generic");
LABEL_40:
      objc_msgSend(v16, "setObject:forKeyedSubscript:", MEMORY[0x1E0C9AAB0], v20);
      goto LABEL_41;
    }
    if (a1 == 18)
    {
      v20 = CFSTR("pallasNoPMVMatchFound");
      goto LABEL_40;
    }
  }
  if (a1 == 75)
  {
    v20 = CFSTR("checkSSO");
    goto LABEL_40;
  }
LABEL_41:
  MAErrorWithUnderlyingUserInfoAndString(CFSTR("com.apple.MobileAssetError.Download"), a1, v11, v16, v14);
  v21 = (void *)objc_claimAutoreleasedReturnValue();

  return v21;
}

void sub_1AE34298C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,char a27)
{
  _Block_object_dispose(&a27, 8);
  _Unwind_Resume(a1);
}

void sub_1AE342D6C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,char a26,uint64_t a27,uint64_t a28,uint64_t a29,char a30,uint64_t a31,uint64_t a32,uint64_t a33,char a34)
{
  uint64_t v34;

  _Block_object_dispose(&a26, 8);
  _Block_object_dispose(&a30, 8);
  _Block_object_dispose(&a34, 8);
  _Block_object_dispose((const void *)(v34 - 152), 8);
  _Unwind_Resume(a1);
}

void __Block_byref_object_dispose_(uint64_t a1)
{

}

void sub_1AE343600(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,char a26,uint64_t a27,uint64_t a28,uint64_t a29,char a30,uint64_t a31,uint64_t a32,uint64_t a33,char a34)
{
  uint64_t v34;

  _Block_object_dispose(&a26, 8);
  _Block_object_dispose(&a30, 8);
  _Block_object_dispose(&a34, 8);
  _Block_object_dispose((const void *)(v34 - 152), 8);
  _Unwind_Resume(a1);
}

void sub_1AE343E8C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,char a26,uint64_t a27,uint64_t a28,uint64_t a29,char a30,uint64_t a31,uint64_t a32,uint64_t a33,char a34)
{
  uint64_t v34;

  _Block_object_dispose(&a26, 8);
  _Block_object_dispose(&a30, 8);
  _Block_object_dispose(&a34, 8);
  _Block_object_dispose((const void *)(v34 - 152), 8);
  _Unwind_Resume(a1);
}

void sub_1AE344718(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,char a26,uint64_t a27,uint64_t a28,uint64_t a29,char a30,uint64_t a31,uint64_t a32,uint64_t a33,char a34)
{
  uint64_t v34;

  _Block_object_dispose(&a26, 8);
  _Block_object_dispose(&a30, 8);
  _Block_object_dispose(&a34, 8);
  _Block_object_dispose((const void *)(v34 - 152), 8);
  _Unwind_Resume(a1);
}

void sub_1AE344FA4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,char a26,uint64_t a27,uint64_t a28,uint64_t a29,char a30,uint64_t a31,uint64_t a32,uint64_t a33,char a34)
{
  uint64_t v34;

  _Block_object_dispose(&a26, 8);
  _Block_object_dispose(&a30, 8);
  _Block_object_dispose(&a34, 8);
  _Block_object_dispose((const void *)(v34 - 152), 8);
  _Unwind_Resume(a1);
}

void sub_1AE345840(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,char a26,uint64_t a27,uint64_t a28,uint64_t a29,char a30,uint64_t a31,uint64_t a32,uint64_t a33,char a34)
{
  uint64_t v34;

  _Block_object_dispose(&a26, 8);
  _Block_object_dispose(&a30, 8);
  _Block_object_dispose(&a34, 8);
  _Block_object_dispose((const void *)(v34 - 152), 8);
  _Unwind_Resume(a1);
}

void sub_1AE3460D0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,char a25,uint64_t a26,uint64_t a27,uint64_t a28,char a29,uint64_t a30,uint64_t a31,uint64_t a32,char a33)
{
  uint64_t v33;

  _Block_object_dispose(&a25, 8);
  _Block_object_dispose(&a29, 8);
  _Block_object_dispose(&a33, 8);
  _Block_object_dispose((const void *)(v33 - 144), 8);
  _Unwind_Resume(a1);
}

void OUTLINED_FUNCTION_1(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint8_t *a5)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, a5, 0xCu);
}

void OUTLINED_FUNCTION_2(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint8_t *a5)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, a5, 0x16u);
}

uint64_t OUTLINED_FUNCTION_9(uint64_t a1, uint64_t a2)
{
  return a2;
}

uint64_t isValidObjectForAssetTypesArray(void *a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  id v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  uint64_t v15;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v5 = a1;
  if (v5 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    v19 = 0u;
    v20 = 0u;
    v17 = 0u;
    v18 = 0u;
    v6 = v5;
    v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
    if (v7)
    {
      v12 = v7;
      v13 = *(_QWORD *)v18;
      while (2)
      {
        for (i = 0; i != v12; ++i)
        {
          if (*(_QWORD *)v18 != v13)
            objc_enumerationMutation(v6);
          if (*(_QWORD *)(*((_QWORD *)&v17 + 1) + 8 * i))
          {
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) != 0)
              continue;
          }
          _MobileAssetLog(0, 6, (uint64_t)"isValidObjectForAssetTypesArray", CFSTR("Asset type in array is not a string"), v8, v9, v10, v11, v17);
          v15 = 0;
          goto LABEL_16;
        }
        v12 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
        v15 = 1;
        if (v12)
          continue;
        break;
      }
    }
    else
    {
      v15 = 1;
    }
LABEL_16:

  }
  else
  {
    _MobileAssetLog(0, 6, (uint64_t)"isValidObjectForAssetTypesArray", CFSTR("Asset types is not an array"), v1, v2, v3, v4, v17);
    v15 = 0;
  }

  return v15;
}

uint64_t isValidObjectForPreservedIdsDict(void *a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  id v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  id v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t i;
  uint64_t v31;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  id v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  _BYTE v45[128];
  _BYTE v46[128];
  uint64_t v47;

  v47 = *MEMORY[0x1E0C80C00];
  v5 = a1;
  if (!v5 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    _MobileAssetLog(0, 6, (uint64_t)"isValidObjectForPreservedIdsDict", CFSTR("Preserved IDs type is not an dictionary"), v1, v2, v3, v4, v33);
    v31 = 0;
    goto LABEL_29;
  }
  v43 = 0u;
  v44 = 0u;
  v41 = 0u;
  v42 = 0u;
  v6 = v5;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v41, v46, 16);
  if (!v7)
  {
    v31 = 1;
    goto LABEL_28;
  }
  v8 = v7;
  v9 = *(_QWORD *)v42;
  while (2)
  {
    v10 = 0;
    v35 = v8;
    do
    {
      if (*(_QWORD *)v42 != v9)
        objc_enumerationMutation(v6);
      v11 = *(_QWORD *)(*((_QWORD *)&v41 + 1) + 8 * v10);
      v16 = (void *)MEMORY[0x1AF44EE58]();
      if (!v11 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
      {
        _MobileAssetLog(0, 6, (uint64_t)"isValidObjectForPreservedIdsDict", CFSTR("Preserved IDs key is not a string"), v12, v13, v14, v15, v33);
LABEL_26:
        objc_autoreleasePoolPop(v16);
        v31 = 0;
        goto LABEL_28;
      }
      objc_msgSend(v6, "objectForKey:", v11);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v21 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
      {
        _MobileAssetLog(0, 6, (uint64_t)"isValidObjectForPreservedIdsDict", CFSTR("Preserved IDs value is not an array for: %@"), v17, v18, v19, v20, v11);

        goto LABEL_26;
      }
      v39 = 0u;
      v40 = 0u;
      v37 = 0u;
      v38 = 0u;
      v22 = v21;
      v23 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v37, v45, 16);
      if (v23)
      {
        v28 = v23;
        v29 = *(_QWORD *)v38;
        v36 = v6;
        v34 = v9;
        while (2)
        {
          for (i = 0; i != v28; ++i)
          {
            if (*(_QWORD *)v38 != v29)
              objc_enumerationMutation(v22);
            if (*(_QWORD *)(*((_QWORD *)&v37 + 1) + 8 * i))
            {
              objc_opt_class();
              if ((objc_opt_isKindOfClass() & 1) != 0)
                continue;
            }
            _MobileAssetLog(0, 6, (uint64_t)"isValidObjectForPreservedIdsDict", CFSTR("Preserved ID is not a string: %@ %@"), v24, v25, v26, v27, v11);

            v6 = v36;
            goto LABEL_26;
          }
          v28 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v37, v45, 16);
          v6 = v36;
          v9 = v34;
          if (v28)
            continue;
          break;
        }
      }

      objc_autoreleasePoolPop(v16);
      ++v10;
    }
    while (v10 != v35);
    v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v41, v46, 16);
    v31 = 1;
    if (v8)
      continue;
    break;
  }
LABEL_28:

LABEL_29:
  return v31;
}

id getLoadClassFromMessage(void *a1, void *a2, uint64_t a3)
{
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  id v10;
  id v11;
  const void *data;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  void *v22;
  void *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  id v32;
  size_t length;

  v5 = a1;
  v10 = a2;
  length = 0;
  if (!v10 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0) || !objc_msgSend(v10, "length"))
  {
    _MobileAssetLog(0, 6, (uint64_t)"getLoadClassFromMessage", CFSTR("load key is invalid skipping: %@"), v6, v7, v8, v9, (uint64_t)v10);
LABEL_10:
    v23 = 0;
    v22 = 0;
    v21 = 0;
    goto LABEL_11;
  }
  v11 = objc_retainAutorelease(v10);
  data = xpc_dictionary_get_data(v5, (const char *)objc_msgSend(v11, "UTF8String"), &length);
  if (!data)
  {
    _MobileAssetLog(0, 6, (uint64_t)"getLoadClassFromMessage", CFSTR("load rawData is null skipping: %@"), v13, v14, v15, v16, (uint64_t)v11);
    goto LABEL_10;
  }
  objc_msgSend(MEMORY[0x1E0C99D50], "dataWithBytesNoCopy:length:freeWhenDone:", data, length, 0);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  if (v21)
  {
    v22 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3710]), "initForReadingFromData:error:", v21, 0);
    objc_msgSend(v22, "decodePropertyListForKey:", *MEMORY[0x1E0CB2CD0]);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "finishDecoding");
    if (v23)
    {
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        _MobileAssetLog(0, 6, (uint64_t)"getLoadClassFromMessage", CFSTR("load object is not a %@: %@"), v28, v29, v30, v31, a3);

        v23 = 0;
      }
    }
    else
    {
      _MobileAssetLog(0, 6, (uint64_t)"getLoadClassFromMessage", CFSTR("load object is null skipping: %@"), v24, v25, v26, v27, (uint64_t)v11);
    }
  }
  else
  {
    _MobileAssetLog(0, 6, (uint64_t)"getLoadClassFromMessage", CFSTR("load data is null skipping: %@"), v17, v18, v19, v20, (uint64_t)v11);
    v23 = 0;
    v22 = 0;
  }
LABEL_11:
  v32 = v23;

  return v32;
}

id getLoadDictionaryFromMessage(void *a1, void *a2)
{
  id v3;
  id v4;
  uint64_t v5;
  void *v6;

  v3 = a2;
  v4 = a1;
  v5 = objc_opt_class();
  getLoadClassFromMessage(v4, v3, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

uint64_t sendOperationSync(void *a1, uint64_t a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  xpc_object_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  id v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v29;
  void *v30;
  uint64_t v31;

  v5 = a1;
  v6 = a3;
  v31 = 4;
  v7 = (void *)MEMORY[0x1AF44EE58]();
  v12 = xpc_dictionary_create(0, 0, 0);
  if (v12)
  {
    if (!v5)
    {
LABEL_5:
      xpc_dictionary_set_uint64(v12, "messageAction", a2);
      _getCommsManager(v13, v14, v15, v16, v17, v18, v19, v20);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v22 = (id)objc_msgSend(v21, "sendSync:gettingResponseCode:codeForXpcError:loggingName:", v12, &v31, 1, v6);

      goto LABEL_8;
    }
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      xpc_dictionary_set_string(v12, "AssetType", (const char *)objc_msgSend(objc_retainAutorelease(v5), "UTF8String"));
      goto LABEL_5;
    }
    stringForMAXpcCommand(a2);
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    _MobileAssetLog(0, 6, (uint64_t)"sendOperationSync", CFSTR("MobileAsset %@ sendOperationSync %lld (%@) given a non-NSString assetType"), v23, v24, v25, v26, (uint64_t)v6);

    v31 = 2;
  }
  else
  {
    _MobileAssetLog(0, 3, (uint64_t)"sendOperationSync", CFSTR("Could not create xpc dictionary, returning MAOperationXpcError"), v8, v9, v10, v11, v29);
  }
LABEL_8:

  objc_autoreleasePoolPop(v7);
  if (v12)
    v27 = v31;
  else
    v27 = 1;

  return v27;
}

void _MAPurgeAll(void *a1, void *a2, void *a3, void *a4)
{
  id v7;
  id v8;
  id v9;
  id v10;
  xpc_object_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  int64_t v21;
  NSObject *v22;
  _QWORD v23[4];
  id v24;
  id v25;

  v7 = a1;
  v8 = a2;
  v9 = a3;
  v10 = a4;
  v11 = xpc_dictionary_create(0, 0, 0);
  if (!v11)
  {
    v21 = 9;
    goto LABEL_12;
  }
  if (!isValidObjectForAssetTypesArray(v7)
    || !addObjectToMessage(v7, v11, "purgeAssetTypeListLength", "purgeAssetTypeList")
    || v9
    && (!isValidObjectForPreservedIdsDict(v9)
     || !addObjectToMessage(v9, v11, "purgeAssetTypePreservingListLength", "purgeAssetTypePreservingList")))
  {
    v21 = 10;
LABEL_12:
    xpc_dictionary_set_int64(v11, "Result", v21);
    _getClientCallbackQueue();
    v22 = objc_claimAutoreleasedReturnValue();
    v23[0] = MEMORY[0x1E0C809B0];
    v23[1] = 3221225472;
    v23[2] = ___MAPurgeAll_block_invoke;
    v23[3] = &unk_1E5D5CD38;
    v25 = v10;
    v24 = v11;
    dispatch_async(v22, v23);

    goto LABEL_13;
  }
  xpc_dictionary_set_uint64(v11, "messageAction", 0x18uLL);
  if (v8)
    xpc_dictionary_set_string(v11, "Purpose", (const char *)objc_msgSend(objc_retainAutorelease(v8), "UTF8String"));
  _getCommsManager(v12, v13, v14, v15, v16, v17, v18, v19);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "sendAsync:clientHandler:taskDescriptor:", v11, v10, 0);

LABEL_13:
}

void _MAPurgeCatalogs(void *a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id v7;
  xpc_object_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  int64_t v18;
  NSObject *v19;
  _QWORD v20[4];
  id v21;
  id v22;

  v5 = a1;
  v6 = a2;
  v7 = a3;
  v8 = xpc_dictionary_create(0, 0, 0);
  if (!v8)
  {
    v18 = 9;
LABEL_8:
    xpc_dictionary_set_int64(v8, "Result", v18);
    _getClientCallbackQueue();
    v19 = objc_claimAutoreleasedReturnValue();
    v20[0] = MEMORY[0x1E0C809B0];
    v20[1] = 3221225472;
    v20[2] = ___MAPurgeCatalogs_block_invoke;
    v20[3] = &unk_1E5D5CD38;
    v22 = v7;
    v21 = v8;
    dispatch_async(v19, v20);

    goto LABEL_9;
  }
  if (!addObjectToMessage(v5, v8, "purgeAssetTypeListLength", "purgeAssetTypeList"))
  {
    v18 = 10;
    goto LABEL_8;
  }
  xpc_dictionary_set_uint64(v8, "messageAction", 0x1AuLL);
  if (v6)
    xpc_dictionary_set_string(v8, "Purpose", (const char *)objc_msgSend(objc_retainAutorelease(v6), "UTF8String"));
  _getCommsManager(v9, v10, v11, v12, v13, v14, v15, v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "sendAsync:clientHandler:taskDescriptor:", v8, v7, 0);

LABEL_9:
}

void _MAsendCancelDownloadMetaData(void *a1, uint64_t a2, void *a3)
{
  id v4;
  id v5;
  xpc_object_t v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  NSObject *v17;
  _QWORD v18[4];
  id v19;
  id v20;

  v4 = a1;
  v5 = a3;
  v6 = xpc_dictionary_create(0, 0, 0);
  v7 = v6;
  if (!v4 || !v6)
  {
    if (!v6)
    {
LABEL_7:
      _getClientCallbackQueue();
      v17 = objc_claimAutoreleasedReturnValue();
      v18[0] = MEMORY[0x1E0C809B0];
      v18[1] = 3221225472;
      v18[2] = ___MAsendCancelDownloadMetaData_block_invoke;
      v18[3] = &unk_1E5D5CD38;
      v20 = v5;
      v19 = v7;
      dispatch_async(v17, v18);

      goto LABEL_8;
    }
LABEL_6:
    xpc_dictionary_set_int64(v7, "Result", 4);
    goto LABEL_7;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
    goto LABEL_6;
  xpc_dictionary_set_string(v7, "AssetType", (const char *)objc_msgSend(objc_retainAutorelease(v4), "UTF8String"));
  xpc_dictionary_set_uint64(v7, "messageAction", 0x1CuLL);
  _getCommsManager(v8, v9, v10, v11, v12, v13, v14, v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "sendAsync:clientHandler:taskDescriptor:", v7, v5, 0);

LABEL_8:
}

uint64_t _MAsendSetPallasEnabled(void *a1, BOOL a2)
{
  id v3;
  xpc_object_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  id v14;
  uint64_t v15;
  uint64_t v17;

  v3 = a1;
  v4 = xpc_dictionary_create(0, 0, 0);
  if (v4)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      xpc_dictionary_set_string(v4, "AssetType", (const char *)objc_msgSend(objc_retainAutorelease(v3), "UTF8String"));
    xpc_dictionary_set_BOOL(v4, "pallasEnabled", a2);
    xpc_dictionary_set_uint64(v4, "messageAction", 0x21uLL);
    v17 = 4;
    _getCommsManager(v5, v6, v7, v8, v9, v10, v11, v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = (id)objc_msgSend(v13, "sendSync:gettingResponseCode:codeForXpcError:loggingName:", v4, &v17, 1, CFSTR("MASetPallasEnabled"));

    v15 = v17;
  }
  else
  {
    v15 = 1;
    v17 = 1;
  }

  return v15;
}

uint64_t _MAsendGetPallasEnabled(void *a1, BOOL *a2)
{
  id v3;
  xpc_object_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  void *v14;
  BOOL v15;
  uint64_t v16;
  uint64_t v18;

  v3 = a1;
  v18 = 4;
  if (a2)
    *a2 = 0;
  v4 = xpc_dictionary_create(0, 0, 0);
  if (v4)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      xpc_dictionary_set_string(v4, "AssetType", (const char *)objc_msgSend(objc_retainAutorelease(v3), "UTF8String"));
    xpc_dictionary_set_uint64(v4, "messageAction", 0x20uLL);
    _getCommsManager(v5, v6, v7, v8, v9, v10, v11, v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "sendSync:gettingResponseCode:codeForXpcError:loggingName:", v4, &v18, 1, CFSTR("MAGetPallasEnabled"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v18)
    {
      v15 = xpc_dictionary_get_BOOL(v14, "pallasEnabled");
      if (a2)
        *a2 = v15;
    }
  }
  else
  {
    v14 = 0;
    v18 = 1;
  }
  v16 = v18;

  return v16;
}

uint64_t _MAsendSetPallasAudience(void *a1, void *a2)
{
  id v3;
  id v4;
  xpc_object_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  id v15;
  uint64_t v16;
  uint64_t v18;

  v3 = a1;
  v4 = a2;
  v18 = 4;
  v5 = xpc_dictionary_create(0, 0, 0);
  if (!v5)
    goto LABEL_8;
  if (v3)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      xpc_dictionary_set_string(v5, "pallasAudience", (const char *)objc_msgSend(objc_retainAutorelease(v3), "UTF8String"));
      goto LABEL_5;
    }
LABEL_8:
    v16 = 1;
    v18 = 1;
    goto LABEL_9;
  }
LABEL_5:
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    xpc_dictionary_set_string(v5, "AssetType", (const char *)objc_msgSend(objc_retainAutorelease(v4), "UTF8String"));
  xpc_dictionary_set_uint64(v5, "messageAction", 0xAuLL);
  _getCommsManager(v6, v7, v8, v9, v10, v11, v12, v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = (id)objc_msgSend(v14, "sendSync:gettingResponseCode:codeForXpcError:loggingName:", v5, &v18, 1, CFSTR("MASetPallasAudience"));

  v16 = v18;
LABEL_9:

  return v16;
}

__CFString *_MAsendGetPallasAudience(void *a1)
{
  id v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  xpc_object_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *string;
  __CFString *v18;
  uint64_t v20;
  uint64_t v21;

  v1 = a1;
  v21 = 4;
  v6 = xpc_dictionary_create(0, 0, 0);
  if (v6)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      xpc_dictionary_set_string(v6, "AssetType", (const char *)objc_msgSend(objc_retainAutorelease(v1), "UTF8String"));
    xpc_dictionary_set_uint64(v6, "messageAction", 0x14uLL);
    _getCommsManager(v7, v8, v9, v10, v11, v12, v13, v14);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "sendSync:gettingResponseCode:codeForXpcError:loggingName:", v6, &v21, 1, CFSTR("MAGetPallasAudience"));
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    if (v21)
    {
      string = 0;
    }
    else
    {
      string = (void *)xpc_dictionary_get_string(v16, "pallasAudience");
      if (string)
      {
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", string);
        string = (void *)objc_claimAutoreleasedReturnValue();
      }
    }
    v18 = string;

  }
  else
  {
    _MobileAssetLog(0, 3, (uint64_t)"_MAsendGetPallasAudience", CFSTR("Could not create xpc dictionary, returning empty string"), v2, v3, v4, v5, v20);
    v18 = &stru_1E5D5F930;
  }

  return v18;
}

uint64_t _MAsendSetPallasUrl(void *a1)
{
  return _MAsendSetPallasUrlForType(a1, 0);
}

uint64_t _MAsendSetPallasUrlForType(void *a1, void *a2)
{
  id v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  xpc_object_t v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  id v21;
  objc_class *v22;
  void *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v29;
  uint64_t v30;

  v3 = a1;
  v4 = a2;
  v9 = xpc_dictionary_create(0, 0, 0);
  if (v4)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      xpc_dictionary_set_string(v9, "AssetType", (const char *)objc_msgSend(objc_retainAutorelease(v4), "UTF8String"));
  }
  if (v9)
  {
    if (v3)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        v22 = (objc_class *)objc_opt_class();
        NSStringFromClass(v22);
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        _MobileAssetLog(0, 3, (uint64_t)"_MAsendSetPallasUrlForType", CFSTR("Cannot set Pallas URL to a class that is not NSURL (was given an %@), returning MAOperationInvalid."), v24, v25, v26, v27, (uint64_t)v23);

        v11 = 5;
        goto LABEL_12;
      }
      objc_msgSend(v3, "absoluteString");
      v10 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
      xpc_dictionary_set_string(v9, "pallasUrl", (const char *)objc_msgSend(v10, "UTF8String"));

    }
    else
    {
      xpc_dictionary_set_BOOL(v9, "serverOverrideClear", 1);
    }
    xpc_dictionary_set_uint64(v9, "messageAction", 9uLL);
    v30 = 4;
    _getCommsManager(v12, v13, v14, v15, v16, v17, v18, v19);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = (id)objc_msgSend(v20, "sendSync:gettingResponseCode:codeForXpcError:loggingName:", v9, &v30, 1, CFSTR("MASetPallasUrl"));

    v11 = v30;
  }
  else
  {
    _MobileAssetLog(0, 3, (uint64_t)"_MAsendSetPallasUrlForType", CFSTR("Could not create xpc dictionary, returning MAOperationXpcError"), v5, v6, v7, v8, v29);
    v11 = 1;
  }
LABEL_12:

  return v11;
}

id _MAsendGetPallasUrl()
{
  return _MAsendGetPallasUrlForType(0);
}

id _MAsendGetPallasUrlForType(void *a1)
{
  id v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  xpc_object_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;
  const char *string;
  void *v20;
  void *v21;
  uint64_t v23;
  uint64_t v24;

  v1 = a1;
  v24 = 4;
  v6 = xpc_dictionary_create(0, 0, 0);
  if (v1)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      xpc_dictionary_set_string(v6, "AssetType", (const char *)objc_msgSend(objc_retainAutorelease(v1), "UTF8String"));
  }
  if (v6)
  {
    xpc_dictionary_set_uint64(v6, "messageAction", 0x2CuLL);
    _getCommsManager(v7, v8, v9, v10, v11, v12, v13, v14);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "sendSync:gettingResponseCode:codeForXpcError:loggingName:", v6, &v24, 1, CFSTR("MAGetPallasUrl"));
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    if (v24 || (string = xpc_dictionary_get_string(v16, "pallasUrl")) == 0)
    {
      v17 = 0;
    }
    else
    {
      v20 = (void *)MEMORY[0x1E0C99E98];
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", string);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "URLWithString:", v21);
      v17 = (void *)objc_claimAutoreleasedReturnValue();

    }
    v18 = v17;

  }
  else
  {
    _MobileAssetLog(0, 3, (uint64_t)"_MAsendGetPallasUrlForType", CFSTR("Could not create xpc dictionary, returning MAOperationXpcError"), v2, v3, v4, v5, v23);
    v18 = 0;
  }

  return v18;
}

uint64_t _MASetDawTokenValue(void *a1)
{
  id v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  xpc_object_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  id v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v24;
  void *v25;
  uint64_t v26;

  v1 = a1;
  v6 = xpc_dictionary_create(0, 0, 0);
  if (v6)
  {
    if (v1)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
        xpc_dictionary_set_string(v6, "tokenValue", (const char *)objc_msgSend(objc_retainAutorelease(v1), "UTF8String"));
    }
    xpc_dictionary_set_uint64(v6, "messageAction", 0x2BuLL);
    v26 = 4;
    _getCommsManager(v7, v8, v9, v10, v11, v12, v13, v14);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = (id)objc_msgSend(v15, "sendSync:gettingResponseCode:codeForXpcError:loggingName:", v6, &v26, 1, CFSTR("MASetDawTokenValue"));

    v17 = v26;
    MAStringForMAOperationResult(v26);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    _MobileAssetLog(0, 6, (uint64_t)"_MASetDawTokenValue", CFSTR("Result of setDawTokenValue is %lld (%@)"), v18, v19, v20, v21, v17);

    v22 = v26;
  }
  else
  {
    _MobileAssetLog(0, 3, (uint64_t)"_MASetDawTokenValue", CFSTR("Could not create xpc dictionary, returning MAOperationXpcError"), v2, v3, v4, v5, v24);
    v22 = 1;
  }

  return v22;
}

uint64_t _MASetDawTokenPath(void *a1)
{
  id v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  xpc_object_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  id v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v24;
  void *v25;
  uint64_t v26;

  v1 = a1;
  v6 = xpc_dictionary_create(0, 0, 0);
  if (v6)
  {
    if (v1)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
        xpc_dictionary_set_string(v6, "tokenPath", (const char *)objc_msgSend(objc_retainAutorelease(v1), "UTF8String"));
    }
    xpc_dictionary_set_uint64(v6, "messageAction", 0x22uLL);
    v26 = 4;
    _getCommsManager(v7, v8, v9, v10, v11, v12, v13, v14);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = (id)objc_msgSend(v15, "sendSync:gettingResponseCode:codeForXpcError:loggingName:", v6, &v26, 1, CFSTR("MASetDawTokenPath"));

    v17 = v26;
    MAStringForMAOperationResult(v26);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    _MobileAssetLog(0, 6, (uint64_t)"_MASetDawTokenPath", CFSTR("Result of setDawTokenPath is %lld (%@)"), v18, v19, v20, v21, v17);

    v22 = v26;
  }
  else
  {
    _MobileAssetLog(0, 3, (uint64_t)"_MASetDawTokenPath", CFSTR("Could not create xpc dictionary, returning MAOperationXpcError"), v2, v3, v4, v5, v24);
    v22 = 1;
  }

  return v22;
}

uint64_t _MAsendSetPreferences(void *a1)
{
  id v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  xpc_object_t v6;
  void *v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  BOOL v14;
  const char *v15;
  id v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  void *v25;
  id v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v34;
  void *v35;
  id v36;
  uint64_t v37;

  v1 = a1;
  v37 = 4;
  v6 = xpc_dictionary_create(0, 0, 0);
  if (v6)
  {
    v36 = 0;
    objc_msgSend(MEMORY[0x1E0CB36F8], "archivedDataWithRootObject:requiringSecureCoding:error:", v1, 1, &v36);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = v36;
    v13 = v8;
    if (v8)
      v14 = 1;
    else
      v14 = v7 == 0;
    if (v14)
    {
      _MobileAssetLog(0, 6, (uint64_t)"_MAsendSetPreferences", CFSTR("{_MAsendSetPreferences} Encoding error: %@"), v9, v10, v11, v12, (uint64_t)v8);
      v32 = 5;
    }
    else
    {
      v15 = (const char *)objc_msgSend(CFSTR("MAPreferences"), "UTF8String");
      v16 = objc_retainAutorelease(v7);
      xpc_dictionary_set_data(v6, v15, (const void *)objc_msgSend(v16, "bytes"), objc_msgSend(v16, "length"));
      xpc_dictionary_set_uint64(v6, "messageAction", 0x2EuLL);
      _getCommsManager(v17, v18, v19, v20, v21, v22, v23, v24);
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      v26 = (id)objc_msgSend(v25, "sendSync:gettingResponseCode:codeForXpcError:loggingName:", v6, &v37, 1, CFSTR("MASetPreferences"));

      v27 = v37;
      MAStringForMAOperationResult(v37);
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      _MobileAssetLog(0, 6, (uint64_t)"_MAsendSetPreferences", CFSTR("Result of setPreferences is %lld (%@)"), v28, v29, v30, v31, v27);

      v32 = v37;
    }

  }
  else
  {
    _MobileAssetLog(0, 3, (uint64_t)"_MAsendSetPreferences", CFSTR("Error creating xpc dictionary"), v2, v3, v4, v5, v34);
    v32 = 1;
  }

  return v32;
}

void sendAssetSpecificWithMessage(void *a1, void *a2, uint64_t a3, void *a4, void *a5)
{
  id v9;
  id v10;
  id v11;
  id v12;
  id v13;
  const char *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  id v23;

  v9 = objc_retainAutorelease(a1);
  v10 = a5;
  v11 = a4;
  v12 = a2;
  xpc_dictionary_set_string(v11, "AssetType", (const char *)objc_msgSend(v9, "UTF8String"));
  v13 = objc_retainAutorelease(v12);
  v14 = (const char *)objc_msgSend(v13, "UTF8String");

  xpc_dictionary_set_string(v11, "AssetId", v14);
  xpc_dictionary_set_uint64(v11, "messageAction", a3);
  _getCommsManager(v15, v16, v17, v18, v19, v20, v21, v22);
  v23 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "sendAsync:clientHandler:taskDescriptor:", v11, v10, 0);

}

void sendAssetSpecificMessageWithPurpose(void *a1, void *a2, void *a3, uint64_t a4, void *a5)
{
  id v9;
  id v10;
  id v11;
  xpc_object_t v12;
  id v13;

  v13 = a1;
  v9 = a2;
  v10 = a3;
  v11 = a5;
  v12 = xpc_dictionary_create(0, 0, 0);
  if (v10)
    xpc_dictionary_set_string(v12, "Purpose", (const char *)objc_msgSend(objc_retainAutorelease(v10), "UTF8String"));
  sendAssetSpecificWithMessage(v13, v9, a4, v12, v11);

}

void _MAsendPurgeAsset(void *a1, void *a2, uint64_t a3, void *a4)
{
  id v7;
  id v8;
  xpc_object_t v9;
  void *v10;
  id v11;

  v11 = a1;
  v7 = a2;
  v8 = a4;
  v9 = xpc_dictionary_create(0, 0, 0);
  v10 = v9;
  if (v9)
    xpc_dictionary_set_uint64(v9, "assetState", a3);
  sendAssetSpecificWithMessage(v11, v7, 5uLL, v10, v8);

}

void _MAsendConfigDownload(void *a1, void *a2, void *a3, void *a4, void *a5)
{
  id v9;
  id v10;
  id v11;
  id v12;
  xpc_object_t v13;
  void *v14;
  id v15;

  v15 = a3;
  v9 = a4;
  v10 = a5;
  v11 = a2;
  v12 = a1;
  v13 = xpc_dictionary_create(0, 0, 0);
  if (v15 && isWellFormedPurpose(v15))
    xpc_dictionary_set_string(v13, "Purpose", (const char *)objc_msgSend(objc_retainAutorelease(v15), "UTF8String"));
  objc_msgSend(v9, "encodeAsPlist");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  addObjectToMessage(v14, v13, "downloadConfigLength", "downloadConfig");
  sendAssetSpecificWithMessage(v12, v11, 0x13uLL, v13, v10);

}

void _MAsendCancelDownload(void *a1, void *a2, void *a3, void *a4)
{
  sendAssetSpecificMessageWithPurpose(a1, a2, a3, 6uLL, a4);
}

id _MAsendUpdateClientAccessGetPathSync(void *a1, void *a2, uint64_t a3)
{
  return _MAsendUpdateClientAccessGetPathWithPurposeSync(a1, a2, a3, 0);
}

void _MAsendDumpClientAccessWithPurpose(void *a1, void *a2, void *a3, void *a4)
{
  sendAssetSpecificMessageWithPurpose(a1, a2, a3, 0x16uLL, a4);
}

void _MAsendDumpClientAccess(void *a1, void *a2, void *a3)
{
  sendAssetSpecificMessageWithPurpose(a1, a2, 0, 0x16uLL, a3);
}

BOOL _MAsendGarbageCollect()
{
  return sendOperationSync(0, 0x17uLL, CFSTR("MAGarbageCollect")) != 0;
}

uint64_t _MAsendInstallAsset(void *a1, void *a2)
{
  id v3;
  id v4;
  void *v5;
  xpc_object_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  int v12;
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
  void *v25;
  id v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  void *v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v38;
  void *v39;
  void *v40;
  unint64_t v41;

  v3 = a1;
  v4 = a2;
  v41 = 4;
  v5 = (void *)MEMORY[0x1AF44EE58]();
  v6 = xpc_dictionary_create(0, 0, 0);
  if (!v6)
  {
    _MobileAssetLog(0, 3, (uint64_t)"_MAsendInstallAsset", CFSTR("Could not create xpc dictionary, returning MAOperationXpcError"), v7, v8, v9, v10, v38);
    objc_autoreleasePoolPop(v5);
LABEL_16:
    v36 = 1;
    goto LABEL_17;
  }
  v11 = v6;
  if (!v3)
  {
LABEL_5:
    v12 = 1;
    if (!v4)
      goto LABEL_6;
LABEL_10:
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      stringForMAXpcCommand(0x2Au);
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      _MobileAssetLog(0, 6, (uint64_t)"_MAsendInstallAsset", CFSTR("MobileAsset %@ sendOperationSync %lld (%@) given a non-NSString pathToAsset"), v27, v28, v29, v30, (uint64_t)CFSTR("MAInstallAsset"));

      v41 = 2;
      goto LABEL_14;
    }
    xpc_dictionary_set_string(v11, "MobileAssetInstallAssetPath", (const char *)objc_msgSend(objc_retainAutorelease(v4), "UTF8String"));
    if (!v12)
      goto LABEL_14;
LABEL_12:
    xpc_dictionary_set_uint64(v11, "messageAction", 0x2AuLL);
    _getCommsManager(v17, v18, v19, v20, v21, v22, v23, v24);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v26 = (id)objc_msgSend(v25, "sendSync:gettingResponseCode:codeForXpcError:loggingName:", v11, &v41, 1, CFSTR("MAInstallAsset"));

    goto LABEL_14;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    xpc_dictionary_set_string(v11, "AssetType", (const char *)objc_msgSend(objc_retainAutorelease(v3), "UTF8String"));
    goto LABEL_5;
  }
  stringForMAXpcCommand(0x2Au);
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  _MobileAssetLog(0, 6, (uint64_t)"_MAsendInstallAsset", CFSTR("MobileAsset %@ sendOperationSync %lld (%@) given a non-NSString assetType"), v13, v14, v15, v16, (uint64_t)CFSTR("MAInstallAsset"));

  v12 = 0;
  v41 = 2;
  if (v4)
    goto LABEL_10;
LABEL_6:
  if (v12)
    goto LABEL_12;
LABEL_14:

  objc_autoreleasePoolPop(v5);
  if (!v41)
    goto LABEL_16;
  stringForMAOperationResult(v41);
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  _MobileAssetLog(0, 3, (uint64_t)"_MAsendInstallAsset", CFSTR("MobileAsset Install Asset failed with error: %@"), v32, v33, v34, v35, (uint64_t)v31);

  v36 = 0;
LABEL_17:

  return v36;
}

uint64_t __sendIfNecessary_block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));
}

uint64_t __sendIfNecessary_block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));
}

void _MAsendDownloadAsset(void *a1, void *a2, void *a3, uint64_t a4, void *a5, void *a6, uint64_t a7, void *a8, void *a9, void *a10)
{
  id v16;
  id v17;
  id v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  xpc_object_t v23;
  id v24;
  id v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  void *v30;
  size_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  void *v36;
  void *v37;
  int64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
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
  dispatch_time_t v53;
  uint64_t v54;
  char v55;
  void *v56;
  void *v57;
  void *v58;
  id v59;
  id v60;
  id v61;
  id v62;
  id v63;
  id v64;
  id v65;
  uint64_t v66;
  void *v67;
  uint64_t v68;
  id v70;
  void *v71;
  void *v72;
  id v73;
  void *v74;
  id v75;
  id v76;
  id v77;
  id v78;
  id v79;
  _QWORD v80[4];
  id v81;
  id v82;
  id v83;
  id v84;
  id v85;
  id v86;
  id v87;
  uint64_t *v88;
  dispatch_time_t v89;
  int64_t v90;
  char v91;
  uint64_t v92;
  uint64_t *v93;
  uint64_t v94;
  uint64_t (*v95)(uint64_t, uint64_t);
  void (*v96)(uint64_t);
  id v97;

  v77 = a1;
  v16 = a2;
  v79 = a3;
  v76 = a5;
  v17 = a6;
  v73 = a8;
  v78 = a9;
  v18 = a10;
  v23 = xpc_dictionary_create(0, 0, 0);
  v92 = 0;
  v93 = &v92;
  v94 = 0x3032000000;
  v95 = __Block_byref_object_copy__0;
  v96 = __Block_byref_object_dispose__0;
  v97 = 0;
  v75 = v17;
  v71 = v18;
  if (v23)
  {
    if (v16 && v79 && v17)
    {
      v24 = objc_retainAutorelease(v16);
      xpc_dictionary_set_string(v23, "AssetType", (const char *)objc_msgSend(v24, "UTF8String"));
      v25 = objc_retainAutorelease(v79);
      xpc_dictionary_set_string(v23, "AssetId", (const char *)objc_msgSend(v25, "UTF8String"));
      if (v76)
        xpc_dictionary_set_string(v23, "BaseUrlKey", (const char *)objc_msgSend(objc_retainAutorelease(v76), "UTF8String"));
      xpc_dictionary_set_string(v23, "RelativeUrlKey", (const char *)objc_msgSend(objc_retainAutorelease(v17), "UTF8String"));
      objc_msgSend(v77, "encodeAsPlist");
      v74 = (void *)objc_claimAutoreleasedReturnValue();
      if ((addObjectToMessage(v74, v23, "downloadOptionsLength", "downloadOptions") & 1) != 0)
      {
        if (v78)
          xpc_dictionary_set_string(v23, "Purpose", (const char *)objc_msgSend(objc_retainAutorelease(v78), "UTF8String"));
        if (v73)
        {
          v72 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB36F8]), "initRequiringSecureCoding:", 1);
          objc_msgSend(v72, "encodeObject:forKey:", v73, *MEMORY[0x1E0CB2CD0]);
          objc_msgSend(v72, "encodedData");
          v30 = (void *)objc_claimAutoreleasedReturnValue();
          v31 = objc_msgSend(v30, "length");
          v70 = objc_retainAutorelease(v30);
          xpc_dictionary_set_data(v23, "stExtractor", (const void *)objc_msgSend(v70, "bytes"), v31);
          xpc_dictionary_set_double(v23, "stExtractorLength", (double)v31);
        }
        else
        {
          _MobileAssetLog(0, 6, (uint64_t)"_MAsendDownloadAsset", CFSTR("No extractor specified"), v26, v27, v28, v29, v68);
          v70 = 0;
          v72 = 0;
        }
        _MobileAssetLog(0, 6, (uint64_t)"_MAsendDownloadAsset", CFSTR("The download size is: %lld"), v32, v33, v34, v35, a4);
        xpc_dictionary_set_int64(v23, "downloadSize", a4);
        xpc_dictionary_set_uint64(v23, "notificationInterval", a7);
        xpc_dictionary_set_uint64(v23, "messageAction", 3uLL);
        normalizedAssetType((uint64_t)v24, v39, v40, v41, v42, v43, v44, v45);
        v36 = (void *)objc_claimAutoreleasedReturnValue();
        assembleTaskDescriptorWithPurpose((uint64_t)v36, (uint64_t)v25, v78);
        v37 = (void *)objc_claimAutoreleasedReturnValue();
        v38 = 32;
      }
      else
      {
        _MobileAssetLog(0, 6, (uint64_t)"_MAsendDownloadAsset", CFSTR("Bad options for asset type: %@ not sending message"), v26, v27, v28, v29, (uint64_t)v24);
        v70 = 0;
        v36 = 0;
        v72 = 0;
        v37 = 0;
        v38 = 22;
      }
    }
    else
    {
      _MobileAssetLog(0, 6, (uint64_t)"_MAsendDownloadAsset", CFSTR("Bad asset meta data, cannot download: %@ %@ %@ %@"), v19, v20, v21, v22, (uint64_t)v16);
      v70 = 0;
      v36 = 0;
      v74 = 0;
      v72 = 0;
      v37 = 0;
      v38 = 23;
    }
  }
  else
  {
    v70 = 0;
    v36 = 0;
    v74 = 0;
    v72 = 0;
    v37 = 0;
    v38 = 24;
  }
  v53 = dispatch_time(0, 0);
  v54 = (uint64_t)v77;
  if (v77)
  {
    v54 = objc_msgSend(v77, "allowDaemonConnectionRetries");
    v55 = v54;
  }
  else
  {
    v55 = 0;
  }
  _getCommsManager(v54, v46, v47, v48, v49, v50, v51, v52);
  v56 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v56, "progressCallbacksForAssetType:assetId:withPurpose:", v16, v79, v78);
  v57 = (void *)objc_claimAutoreleasedReturnValue();
  v58 = (void *)objc_msgSend(v57, "copy");

  v80[0] = MEMORY[0x1E0C809B0];
  v80[1] = 3221225472;
  v80[2] = ___MAsendDownloadAsset_block_invoke;
  v80[3] = &unk_1E5D5CD88;
  v91 = v55;
  v89 = v53;
  v59 = v16;
  v81 = v59;
  v60 = v79;
  v82 = v60;
  v61 = v58;
  v83 = v61;
  v62 = v78;
  v84 = v62;
  v90 = v38;
  v63 = v23;
  v85 = v63;
  v64 = v37;
  v86 = v64;
  v88 = &v92;
  v65 = v71;
  v87 = v65;
  v66 = MEMORY[0x1AF44EFD8](v80);
  v67 = (void *)v93[5];
  v93[5] = v66;

  sendIfNecessary(v38, v63, v64, (void *)v93[5]);
  _Block_object_dispose(&v92, 8);

}

void sub_1AE34A9AC(_Unwind_Exception *a1)
{
  uint64_t v1;

  _Block_object_dispose((const void *)(v1 - 136), 8);
  _Unwind_Resume(a1);
}

void __Block_byref_object_dispose__0(uint64_t a1)
{

}

id getRetryXpcDelayQueue()
{
  if (getRetryXpcDelayQueue_onceToken != -1)
    dispatch_once(&getRetryXpcDelayQueue_onceToken, &__block_literal_global_914);
  return (id)getRetryXpcDelayQueue_retryQueue;
}

void _MAsendPMVDownload(void *a1, char a2, void *a3)
{
  id v5;
  id v6;
  id v7;
  void *v8;
  xpc_object_t v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  int64_t v15;
  id v16;
  id v17;
  uint64_t v18;
  _QWORD v19[4];
  id v20;
  id v21;
  char v22;

  v5 = a1;
  v6 = a3;
  if (v5)
    v7 = v5;
  else
    v7 = (id)objc_opt_new();
  v8 = v7;
  v9 = xpc_dictionary_create(0, 0, 0);
  if (v9)
  {
    objc_msgSend(v8, "encodeAsPlist");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if ((addObjectToMessage(v10, v9, "downloadOptionsLength", "downloadOptions") & 1) != 0)
    {
      xpc_dictionary_set_uint64(v9, "messageAction", 0x1EuLL);
      v15 = 32;
    }
    else
    {
      _MobileAssetLog(0, 6, (uint64_t)"_MAsendPMVDownload", CFSTR("Bad options for PMV download: not sending message"), v11, v12, v13, v14, v18);
      v15 = 22;
    }

  }
  else
  {
    v15 = 1;
  }
  v19[0] = MEMORY[0x1E0C809B0];
  v19[1] = 3221225472;
  v19[2] = ___MAsendPMVDownload_block_invoke;
  v19[3] = &unk_1E5D5CDF8;
  v22 = a2;
  v20 = v8;
  v21 = v6;
  v16 = v6;
  v17 = v8;
  sendIfNecessary(v15, v9, 0, v19);

}

void _MAsendPMVCancelDownload(void *a1)
{
  id v1;
  xpc_object_t v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  NSObject *v12;
  id *v13;
  _QWORD v14[4];
  _QWORD v15[2];
  _QWORD v16[4];
  _QWORD v17[2];
  _QWORD v18[4];

  v1 = a1;
  v18[0] = 0;
  v18[1] = v18;
  v18[2] = 0x2020000000;
  v18[3] = 4;
  v2 = xpc_dictionary_create(0, 0, 0);
  v3 = v2;
  if (v2)
  {
    xpc_dictionary_set_uint64(v2, "messageAction", 0x1DuLL);
    _getCommsManager(v4, v5, v6, v7, v8, v9, v10, v11);
    v12 = objc_claimAutoreleasedReturnValue();
    v16[0] = MEMORY[0x1E0C809B0];
    v16[1] = 3221225472;
    v16[2] = ___MAsendPMVCancelDownload_block_invoke;
    v16[3] = &unk_1E5D5CE48;
    v17[1] = v18;
    v17[0] = v1;
    -[NSObject sendAsync:clientHandler:taskDescriptor:](v12, "sendAsync:clientHandler:taskDescriptor:", v3, v16, 0);
    v13 = (id *)v17;
LABEL_5:

    goto LABEL_6;
  }
  if (v1)
  {
    _getClientCallbackQueue();
    v12 = objc_claimAutoreleasedReturnValue();
    v14[0] = MEMORY[0x1E0C809B0];
    v14[1] = 3221225472;
    v14[2] = ___MAsendPMVCancelDownload_block_invoke_3;
    v14[3] = &unk_1E5D5CE20;
    v15[1] = v18;
    v13 = (id *)v15;
    v15[0] = v1;
    dispatch_async(v12, v14);
    goto LABEL_5;
  }
LABEL_6:

  _Block_object_dispose(v18, 8);
}

void sub_1AE34B21C(_Unwind_Exception *a1)
{
  uint64_t v1;

  _Block_object_dispose((const void *)(v1 - 64), 8);
  _Unwind_Resume(a1);
}

id _MAsendPMVQuerySync(int a1, void *a2, void *a3, void *a4, void *a5, void *a6, _QWORD *a7)
{
  id v13;
  id v14;
  id v15;
  unint64_t v16;
  unint64_t v17;
  uint64_t v18;
  void *v19;
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
  void *v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  void *v37;
  unint64_t v38;
  void *v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  void *v45;
  __CFString *v46;
  void *v47;
  id v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  void *v53;
  const char *v54;
  id v55;
  void *v56;
  void *v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  void *v65;
  void *v66;
  void *v67;
  void *v68;
  id v69;
  void *v70;
  uint64_t v71;
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
  uint64_t v86;
  uint64_t v87;
  uint64_t v88;
  uint64_t v89;
  uint64_t v90;
  uint64_t v91;
  uint64_t v92;
  uint64_t v93;
  uint64_t v94;
  uint64_t v95;
  void *v96;
  uint64_t v97;
  uint64_t v98;
  uint64_t v99;
  uint64_t i;
  uint64_t v101;
  __CFString *v102;
  uint64_t v103;
  const char *v104;
  void *v105;
  id v106;
  id v107;
  void *v108;
  void *v109;
  void *v110;
  void *v111;
  void *context;
  void *v113;
  void *v114;
  _QWORD *v115;
  uint64_t v116;
  void *v117;
  xpc_object_t xdict;
  void *v119;
  __int128 v120;
  __int128 v121;
  __int128 v122;
  __int128 v123;
  unint64_t v124;
  id v125;
  _BYTE v126[128];
  uint64_t v127;

  v127 = *MEMORY[0x1E0C80C00];
  v13 = a2;
  v14 = a3;
  v15 = a4;
  v16 = a5;
  v17 = a6;
  v18 = MEMORY[0x1AF44EE58]();
  xdict = xpc_dictionary_create(0, 0, 0);
  v114 = (void *)v16;
  v115 = a7;
  context = (void *)v18;
  v113 = (void *)v17;
  if (!xdict)
  {
    v38 = 6;
    errorStringForMAQueryResult(6uLL);
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    MAError(CFSTR("com.apple.MobileAssetError.Query"), 6, CFSTR("Query for software lookup failed: %@"), v40, v41, v42, v43, v44, (uint64_t)v39);
    v45 = (void *)objc_claimAutoreleasedReturnValue();

    v108 = 0;
    v110 = 0;
    v119 = 0;
LABEL_32:
    v68 = 0;
    v69 = 0;
    v111 = 0;
    goto LABEL_33;
  }
  v19 = (void *)objc_opt_new();
  if (a1)
    v20 = MEMORY[0x1E0C9AAB0];
  else
    v20 = MEMORY[0x1E0C9AAA0];
  v119 = v19;
  objc_msgSend(v19, "setValue:forKey:", v20, CFSTR("includeSupervised"));
  _MobileAssetLog(0, 6, (uint64_t)"_MAsendPMVQuerySync", CFSTR("[%s] Setting include includeSupervised: %@"), v21, v22, v23, v24, (uint64_t)"_MAsendPMVQuerySync");
  if (v13)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      v46 = CFSTR("Query for software lookup failed as the filter for platform match was not a string.");
LABEL_31:
      v38 = 8;
      MAError(CFSTR("com.apple.MobileAssetError.Query"), 8, v46, v25, v26, v27, v28, v29, v103);
      v45 = (void *)objc_claimAutoreleasedReturnValue();
      v108 = 0;
      v110 = 0;
      goto LABEL_32;
    }
    _MobileAssetLog(0, 6, (uint64_t)"_MAsendPMVQuerySync", CFSTR("[%s] Setting platformExactMatch: %@"), v26, v27, v28, v29, (uint64_t)"_MAsendPMVQuerySync");
    objc_msgSend(v119, "setValue:forKey:", v13, CFSTR("platformExactMatch"));
  }
  if (!v14)
    goto LABEL_11;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    v46 = CFSTR("Query for software lookup failed as the filter for ProductVersion match was not a string.");
    goto LABEL_31;
  }
  _MobileAssetLog(0, 6, (uint64_t)"_MAsendPMVQuerySync", CFSTR("[%s] Setting versionPrefix: %@"), v26, v27, v28, v29, (uint64_t)"_MAsendPMVQuerySync");
  objc_msgSend(v119, "setValue:forKey:", v14, CFSTR("versionPrefix"));
LABEL_11:
  if (!v15)
    goto LABEL_14;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    v46 = CFSTR("Query for software lookup failed as the filter for SupportedDevices match was not a string.");
    goto LABEL_31;
  }
  _MobileAssetLog(0, 6, (uint64_t)"_MAsendPMVQuerySync", CFSTR("[%s] Setting supportedDevicePrefix: %@"), v26, v27, v28, v29, (uint64_t)"_MAsendPMVQuerySync");
  objc_msgSend(v119, "setValue:forKey:", v15, CFSTR("supportedDevicePrefix"));
LABEL_14:
  if (!(v16 | v17))
  {
    v117 = 0;
    v30 = 0;
LABEL_23:
    v109 = 0;
    goto LABEL_24;
  }
  v30 = (void *)objc_opt_new();
  objc_msgSend(v30, "setDateFormat:", CFSTR("yyyy-MM-dd"));
  if (v16)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_msgSend(v30, "stringFromDate:", v16);
      v36 = objc_claimAutoreleasedReturnValue();
      if (v36)
      {
        v116 = v36;
        _MobileAssetLog(0, 6, (uint64_t)"_MAsendPMVQuerySync", CFSTR("[%s] Setting postedBeforeString: %@"), v32, v33, v34, v35, (uint64_t)"_MAsendPMVQuerySync");
        objc_msgSend(v119, "setValue:forKey:", v116, CFSTR("postedBefore"));
        v37 = (void *)v116;
        goto LABEL_50;
      }
      v111 = v30;
      v102 = CFSTR("Query for software lookup failed as the filter for PostingDate limit could not be formatted as yyyy-MM-dd.");
    }
    else
    {
      v111 = v30;
      v102 = CFSTR("Query for software lookup failed as the filter for PostingDate limit was not a date.");
    }
    v38 = 8;
    MAError(CFSTR("com.apple.MobileAssetError.Query"), 8, v102, v31, v32, v33, v34, v35, v103);
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    v108 = 0;
    v110 = 0;
    v68 = 0;
    v69 = 0;
LABEL_33:
    v117 = 0;
LABEL_34:
    v109 = 0;
    v53 = 0;
LABEL_35:
    v65 = 0;
LABEL_36:
    v70 = 0;
    goto LABEL_37;
  }
  v37 = 0;
LABEL_50:
  v117 = v37;
  if (!v17)
    goto LABEL_23;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    v111 = v30;
    v38 = 8;
    MAError(CFSTR("com.apple.MobileAssetError.Query"), 8, CFSTR("Query for software lookup failed as the filter for ExpirationDate limit was not a date."), v86, v87, v88, v89, v90, v103);
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    v108 = 0;
    v110 = 0;
    v68 = 0;
    v69 = 0;
    goto LABEL_34;
  }
  objc_msgSend(v30, "stringFromDate:", v17);
  v70 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v70)
  {
    v111 = v30;
    v38 = 8;
    MAError(CFSTR("com.apple.MobileAssetError.Query"), 8, CFSTR("Query for software lookup failed as the filter for ExpirationDate limit could not be formatted as yyyy-MM-dd."), v91, v92, v93, v94, v95, v103);
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    v108 = 0;
    v109 = 0;
    v110 = 0;
    v68 = 0;
    v69 = 0;
    v53 = 0;
    v65 = 0;
    goto LABEL_37;
  }
  _MobileAssetLog(0, 6, (uint64_t)"_MAsendPMVQuerySync", CFSTR("[%s] Setting notExpiredBeforeString: %@"), v92, v93, v94, v95, (uint64_t)"_MAsendPMVQuerySync");
  v109 = v70;
  objc_msgSend(v119, "setValue:forKey:", v70, CFSTR("notExpiredBefore"));
LABEL_24:
  v111 = v30;
  v125 = 0;
  objc_msgSend(MEMORY[0x1E0CB36F8], "archivedDataWithRootObject:requiringSecureCoding:error:", v119, 1, &v125);
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  v48 = v125;
  v53 = v48;
  if (!v47 || v48)
  {
    v110 = v47;
    v38 = 8;
    MAErrorWithUnderlying(CFSTR("com.apple.MobileAssetError.Query"), 8, v48, CFSTR("Query for software lookup failed as the filter could not be encoded."), v49, v50, v51, v52, v103);
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    v108 = 0;
    v68 = 0;
    v69 = 0;
    goto LABEL_35;
  }
  v54 = (const char *)objc_msgSend(CFSTR("QueryParams"), "UTF8String");
  v55 = objc_retainAutorelease(v47);
  xpc_dictionary_set_data(xdict, v54, (const void *)objc_msgSend(v55, "bytes"), objc_msgSend(v55, "length"));
  xpc_dictionary_set_uint64(xdict, "messageAction", 0x1FuLL);
  v56 = (void *)MEMORY[0x1E0CB3940];
  v104 = getprogname();
  objc_msgSend(v56, "stringWithFormat:", CFSTR("%s"));
  v57 = (void *)objc_claimAutoreleasedReturnValue();
  v65 = v57;
  if (v57)
    xpc_dictionary_set_string(xdict, "clientName", (const char *)objc_msgSend(objc_retainAutorelease(v57), "UTF8String"));
  v124 = 12;
  _getCommsManager((uint64_t)v57, v58, v59, v60, v61, v62, v63, v64);
  v66 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "_MAsendPMVQuerySync");
  v67 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v66, "sendSync:gettingResponseCode:codeForXpcError:loggingName:", xdict, &v124, 1, v67);
  v53 = (void *)objc_claimAutoreleasedReturnValue();

  v38 = v124;
  v110 = v55;
  if ((isQueryResultFailure(v124) & 1) != 0)
  {
    v108 = v53;
    v68 = 0;
    v69 = 0;
    v53 = 0;
LABEL_72:
    v45 = 0;
    goto LABEL_36;
  }
  if (!v53)
  {
    v108 = 0;
    v68 = 0;
    v69 = 0;
    goto LABEL_72;
  }
  plistDecodeClasses();
  v96 = (void *)objc_claimAutoreleasedReturnValue();
  getObjectFromMessage(v53, "productMarketingVersionsListLength", "productMarketingVersionsList", v96);
  v68 = (void *)objc_claimAutoreleasedReturnValue();

  v70 = (void *)objc_opt_new();
  v108 = v53;
  if (!v68)
  {
    v69 = 0;
    v53 = 0;
    v45 = 0;
    goto LABEL_37;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    v69 = 0;
LABEL_78:
    v53 = 0;
    v45 = 0;
    goto LABEL_37;
  }
  objc_msgSend(v68, "objectForKey:", CFSTR("pmvEntriesToFrameWork"));
  v69 = (id)objc_claimAutoreleasedReturnValue();
  if (!v69)
    goto LABEL_78;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
    goto LABEL_78;
  v106 = v15;
  v107 = v13;
  v122 = 0u;
  v123 = 0u;
  v120 = 0u;
  v121 = 0u;
  v69 = v69;
  v97 = objc_msgSend(v69, "countByEnumeratingWithState:objects:count:", &v120, v126, 16);
  if (v97)
  {
    v98 = v97;
    v99 = *(_QWORD *)v121;
    do
    {
      for (i = 0; i != v98; ++i)
      {
        if (*(_QWORD *)v121 != v99)
          objc_enumerationMutation(v69);
        v101 = *(_QWORD *)(*((_QWORD *)&v120 + 1) + 8 * i);
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
          objc_msgSend(v70, "addObject:", v101);
      }
      v98 = objc_msgSend(v69, "countByEnumeratingWithState:objects:count:", &v120, v126, 16);
    }
    while (v98);
  }

  v53 = 0;
  v45 = 0;
  v13 = v107;
  v15 = v106;
LABEL_37:
  if (!isQueryResultFailure(v38))
  {
    if (!v45)
      goto LABEL_44;
    MAErrorWithUnderlying(CFSTR("com.apple.MobileAssetError.Query"), 12, v45, CFSTR("During software lookup had unexpected error"), v71, v72, v73, v74, (uint64_t)v104);
    v75 = objc_claimAutoreleasedReturnValue();
LABEL_43:

    v45 = (void *)v75;
    goto LABEL_44;
  }

  if (!v45)
  {
    errorStringForMAQueryResult(v38);
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    MAError(CFSTR("com.apple.MobileAssetError.Query"), v38, CFSTR("During software lookup: %@"), v76, v77, v78, v79, v80, (uint64_t)v45);
    v75 = objc_claimAutoreleasedReturnValue();
    v70 = 0;
    goto LABEL_43;
  }
  v70 = 0;
LABEL_44:

  objc_autoreleasePoolPop(context);
  if (v45)
  {
    objc_msgSend(v45, "description");
    v105 = (void *)objc_claimAutoreleasedReturnValue();
    _MobileAssetLog(0, 3, (uint64_t)"_MAsendPMVQuerySync", CFSTR("[%s] Failed to query PMV with error: %@"), v81, v82, v83, v84, (uint64_t)"_MAsendPMVQuerySync");

    if (v115)
      *v115 = objc_retainAutorelease(v45);
  }

  return v70;
}

uint64_t __Block_byref_object_copy__813(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__814(uint64_t a1)
{

}

void _MAclientSendQueryNSUrlState(BOOL a1)
{
  xpc_object_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  id v13;
  uint64_t v14;

  v14 = 4;
  v2 = xpc_dictionary_create(0, 0, 0);
  xpc_dictionary_set_BOOL(v2, "NSUrlState", a1);
  xpc_dictionary_set_uint64(v2, "messageAction", 4uLL);
  _getCommsManager(v3, v4, v5, v6, v7, v8, v9, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "_MAclientSendQueryNSUrlState");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = (id)objc_msgSend(v11, "sendSync:gettingResponseCode:codeForXpcError:loggingName:", v2, &v14, 1, v12);

}

uint64_t _MAclientSendRepairStateSync()
{
  void *v0;
  uint64_t v1;

  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "_MAclientSendRepairStateSync");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  v1 = sendOperationSync(0, 0xEuLL, v0);

  return v1;
}

void _MAClientSendRepairState(void *a1)
{
  id v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  id v11;

  v1 = a1;
  v11 = xpc_dictionary_create(0, 0, 0);
  xpc_dictionary_set_uint64(v11, "messageAction", 0xEuLL);
  _getCommsManager(v2, v3, v4, v5, v6, v7, v8, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "sendAsync:clientHandler:taskDescriptor:", v11, v1, 0);

}

BOOL _MAclientSendDataMigrator(BOOL a1, BOOL a2)
{
  xpc_object_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  void *v14;
  id v15;
  _BOOL8 v16;
  uint64_t v18;

  v4 = xpc_dictionary_create(0, 0, 0);
  xpc_dictionary_set_BOOL(v4, "blockClient", a1);
  xpc_dictionary_set_BOOL(v4, "forceMigration", a2);
  xpc_dictionary_set_uint64(v4, "messageAction", 0x27uLL);
  v18 = 4;
  _getCommsManager(v5, v6, v7, v8, v9, v10, v11, v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "_MAclientSendDataMigrator");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = (id)objc_msgSend(v13, "sendSync:gettingResponseCode:codeForXpcError:loggingName:", v4, &v18, 1, v14);

  v16 = v18 == 0;
  return v16;
}

uint64_t _MAclientSendEnsureDataVault(void *a1, _QWORD *a2)
{
  id v3;
  xpc_object_t v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  id v15;
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
  void *v26;
  void *v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  void *v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  id v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  void *v46;
  unint64_t v47;

  v3 = a1;
  if (v3)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v4 = xpc_dictionary_create(0, 0, 0);
      if (v4)
      {
        v5 = objc_retainAutorelease(v3);
        xpc_dictionary_set_string(v4, "AssetType", (const char *)objc_msgSend(v5, "UTF8String"));
        xpc_dictionary_set_uint64(v4, "messageAction", 0x26uLL);
        v47 = 4;
        _getCommsManager(v6, v7, v8, v9, v10, v11, v12, v13);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        v15 = (id)objc_msgSend(v14, "sendSync:gettingResponseCode:codeForXpcError:loggingName:", v4, &v47, 1, CFSTR("MAEnsureDataVault"));

        v20 = v47;
        if (!v47)
        {
          _MobileAssetLog(0, 6, (uint64_t)"_MAclientSendEnsureDataVault", CFSTR("Confirmed data vault for %@"), v16, v17, v18, v19, (uint64_t)v5);
          v26 = 0;
          v33 = 1;
LABEL_11:

          if (!a2)
            goto LABEL_14;
          goto LABEL_12;
        }
        stringForMAOperationResult(v47);
        v46 = (void *)objc_claimAutoreleasedReturnValue();
        MAError(CFSTR("com.apple.MobileAssetError"), v20, CFSTR("The asset type %@ could not be confirmed to be a data vault: %@"), v21, v22, v23, v24, v25, (uint64_t)v5);
        v26 = (void *)objc_claimAutoreleasedReturnValue();

      }
      else
      {
        v47 = 1;
        stringForMAOperationResult(1uLL);
        v34 = (void *)objc_claimAutoreleasedReturnValue();
        MAError(CFSTR("com.apple.MobileAssetError.Xpc"), 1, CFSTR("Failed to create xpc dictionary: %@"), v35, v36, v37, v38, v39, (uint64_t)v34);
        v26 = (void *)objc_claimAutoreleasedReturnValue();

      }
      v33 = 0;
      goto LABEL_11;
    }
  }
  v47 = 3;
  stringForMAOperationResult(3uLL);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  MAError(CFSTR("com.apple.MobileAssetError"), 3, CFSTR("The assetType is not a valid string: %@"), v28, v29, v30, v31, v32, (uint64_t)v27);
  v26 = (void *)objc_claimAutoreleasedReturnValue();

  v33 = 0;
  if (!a2)
    goto LABEL_14;
LABEL_12:
  v40 = objc_retainAutorelease(v26);
  *a2 = v40;
  if (v40)
    _MobileAssetLog(0, 6, (uint64_t)"_MAclientSendEnsureDataVault", CFSTR("Error: %@"), v41, v42, v43, v44, (uint64_t)v40);
LABEL_14:

  return v33;
}

BOOL _MAclientSendGetNonUserInitiatedDownloadsAllowed()
{
  return _MAclientSendGetNonUserInitiatedDownloadsAllowedForAssetType(0);
}

BOOL _MAclientSendGetNonUserInitiatedDownloadsAllowedForAssetType(void *a1)
{
  id v1;
  xpc_object_t v2;
  _BOOL8 v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  _BOOL8 v12;
  void *v13;
  uint64_t v15;

  v1 = a1;
  v15 = 4;
  v2 = xpc_dictionary_create(0, 0, 0);
  xpc_dictionary_set_uint64(v2, "messageAction", 0x25uLL);
  v3 = isWellFormedAssetType(v1);
  if (v3)
    xpc_dictionary_set_string(v2, "AssetType", (const char *)objc_msgSend(objc_retainAutorelease(v1), "UTF8String"));
  _getCommsManager(v3, v4, v5, v6, v7, v8, v9, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = 1;
  objc_msgSend(v11, "sendSync:gettingResponseCode:codeForXpcError:loggingName:", v2, &v15, 1, CFSTR("_MAclientSendGetNonUserInitiatedDownloadsAllowedForAssetType"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v15)
    v12 = xpc_dictionary_get_BOOL(v13, "allowNonUserInitiated");

  return v12;
}

uint64_t _MAclientSendServerUrlOverride(void *a1, void *a2)
{
  id v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  xpc_object_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  void *v20;
  id v21;
  uint64_t v23;
  uint64_t v24;

  v3 = a1;
  v4 = a2;
  v24 = 4;
  if (v3 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0)
    || v4 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    _MobileAssetLog(0, 6, (uint64_t)"_MAclientSendServerUrlOverride", CFSTR("MobileAsset _MAclientSendServerUrlOverride passed invalid NSString"), v5, v6, v7, v8, v23);
    v10 = 2;
  }
  else
  {
    v9 = xpc_dictionary_create(0, 0, 0);
    if (v3)
      xpc_dictionary_set_string(v9, "AssetType", (const char *)objc_msgSend(objc_retainAutorelease(v3), "UTF8String"));
    if (v4)
      xpc_dictionary_set_string(v9, "serverUrlOverride", (const char *)objc_msgSend(objc_retainAutorelease(v4), "UTF8String"));
    else
      xpc_dictionary_set_BOOL(v9, "serverOverrideClear", 1);
    xpc_dictionary_set_BOOL(v9, "serverUrlDefault", 0);
    xpc_dictionary_set_uint64(v9, "messageAction", 0xDuLL);
    _getCommsManager(v11, v12, v13, v14, v15, v16, v17, v18);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "_MAclientSendServerUrlOverride");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = (id)objc_msgSend(v19, "sendSync:gettingResponseCode:codeForXpcError:loggingName:", v9, &v24, 1, v20);

    v10 = v24;
  }

  return v10;
}

uint64_t _MAclientSendServerUrlFallbackDefault(void *a1, void *a2)
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  id v8;
  xpc_object_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  void *v20;
  id v21;
  uint64_t v23;
  uint64_t v24;

  v3 = a1;
  v8 = a2;
  if (v3
    && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
    && (!v8 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)))
  {
    v9 = xpc_dictionary_create(0, 0, 0);
    xpc_dictionary_set_string(v9, "AssetType", (const char *)objc_msgSend(objc_retainAutorelease(v3), "UTF8String"));
    if (v8)
      xpc_dictionary_set_string(v9, "serverUrlOverride", (const char *)objc_msgSend(objc_retainAutorelease(v8), "UTF8String"));
    else
      xpc_dictionary_set_BOOL(v9, "serverOverrideClear", 1);
    xpc_dictionary_set_BOOL(v9, "serverUrlDefault", 1);
    xpc_dictionary_set_uint64(v9, "messageAction", 0xDuLL);
    v24 = 4;
    _getCommsManager(v11, v12, v13, v14, v15, v16, v17, v18);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "_MAclientSendServerUrlFallbackDefault");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = (id)objc_msgSend(v19, "sendSync:gettingResponseCode:codeForXpcError:loggingName:", v9, &v24, 1, v20);

    v10 = v24;
  }
  else
  {
    _MobileAssetLog(0, 6, (uint64_t)"_MAclientSendServerUrlFallbackDefault", CFSTR("MobileAsset _MAclientSendServerUrlFallbackDefault passed invalid NSString"), v4, v5, v6, v7, v23);
    v10 = 2;
  }

  return v10;
}

uint64_t _MAMigrateAssets(void *a1)
{
  return sendOperationSync(a1, 0xFuLL, CFSTR("MAMigrateAssets"));
}

uint64_t _MACleanV1Repository(void *a1)
{
  return sendOperationSync(a1, 0x10uLL, CFSTR("MACleanV1Repository"));
}

uint64_t _MAclientSendReportingRequest(int64_t a1, BOOL a2, BOOL a3)
{
  xpc_object_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  void *v16;
  id v17;
  uint64_t v18;
  uint64_t v20;

  v20 = 4;
  v6 = xpc_dictionary_create(0, 0, 0);
  xpc_dictionary_set_int64(v6, "reportingChange", a1);
  xpc_dictionary_set_BOOL(v6, "reportingSend", a2);
  xpc_dictionary_set_BOOL(v6, "reportingClear", a3);
  xpc_dictionary_set_uint64(v6, "messageAction", 0x23uLL);
  _getCommsManager(v7, v8, v9, v10, v11, v12, v13, v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "_MAclientSendReportingRequest");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = (id)objc_msgSend(v15, "sendSync:gettingResponseCode:codeForXpcError:loggingName:", v6, &v20, 1, v16);

  v18 = v20;
  return v18;
}

uint64_t _MAclientSendGetMABrainInfo(_QWORD *a1)
{
  xpc_object_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  uint64_t v17;
  uint64_t v18;

  v18 = 4;
  v2 = xpc_dictionary_create(0, 0, 0);
  xpc_dictionary_set_uint64(v2, "messageAction", 0x28uLL);
  _getCommsManager(v3, v4, v5, v6, v7, v8, v9, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "_MAclientSendGetMABrainInfo");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "sendSync:gettingResponseCode:codeForXpcError:loggingName:", v2, &v18, 1, v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  v14 = 0;
  if (v18)
  {
    if (a1)
LABEL_3:
      *a1 = objc_retainAutorelease(v14);
  }
  else
  {
    getLoadDictionaryFromMessage(v13, CFSTR("MobileAssetBrainInfo"));
    v17 = objc_claimAutoreleasedReturnValue();
    if (v17)
      v14 = (void *)v17;
    else
      v14 = (void *)MEMORY[0x1E0C9AA70];
    if (a1)
      goto LABEL_3;
  }
  v15 = v18;

  return v15;
}

uint64_t _MAclientSendUpdateMABrain(void *a1, _QWORD *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  xpc_object_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  id v18;
  void *v19;
  void *v20;
  void *v21;
  id v22;
  void *v23;
  void *v24;
  uint64_t v25;
  void *v27;
  uint64_t v28;
  _QWORD v29[2];
  _QWORD v30[3];

  v30[2] = *MEMORY[0x1E0C80C00];
  v28 = 4;
  v3 = a1;
  objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("MobileAssetBrainUpdateOptionSSO"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("MobileAssetBrainUpdateOptionDAW"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("MobileAssetBrainUpdateOptionNonBlocking"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("MobileAssetBrainUpdateOptionDiscretionary"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("MobileAssetBrainUpdateOptionRelaunch"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("MobileAssetBrainUpdateOptionPurgeOnly"));
  v27 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = xpc_dictionary_create(0, 0, 0);
  xpc_dictionary_set_uint64(v9, "messageAction", 0x29uLL);
  if (v4)
  {
    v18 = objc_retainAutorelease(v4);
    xpc_dictionary_set_data(v9, "MobileAssetBrainUpdateOptionSSO", (const void *)objc_msgSend(v18, "bytes"), objc_msgSend(v18, "length"));
  }
  if (v5)
    xpc_dictionary_set_string(v9, "MobileAssetBrainUpdateOptionDAW", (const char *)objc_msgSend(objc_retainAutorelease(v5), "UTF8String"));
  if (v6)
    xpc_dictionary_set_BOOL(v9, "MobileAssetBrainUpdateOptionNonBlocking", objc_msgSend(v6, "BOOLValue"));
  if (v7)
    xpc_dictionary_set_BOOL(v9, "MobileAssetBrainUpdateOptionDiscretionary", objc_msgSend(v7, "BOOLValue"));
  if (v8)
    xpc_dictionary_set_BOOL(v9, "MobileAssetBrainUpdateOptionRelaunch", objc_msgSend(v8, "BOOLValue"));
  if (v27)
    xpc_dictionary_set_BOOL(v9, "MobileAssetBrainUpdateOptionPurgeOnly", 1);
  _getCommsManager(v10, v11, v12, v13, v14, v15, v16, v17);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "_MAclientSendUpdateMABrain");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "sendSync:gettingResponseCode:codeForXpcError:loggingName:", v9, &v28, 1, v20);
  v21 = (void *)objc_claimAutoreleasedReturnValue();

  if (v28)
  {
    createErrorFromMessage(v21);
    v22 = (id)objc_claimAutoreleasedReturnValue();
    if (!v22)
    {
      v23 = (void *)MEMORY[0x1E0CB35C8];
      v29[0] = *MEMORY[0x1E0CB2938];
      v29[1] = CFSTR("reply");
      v30[0] = CFSTR("Unable to decode error reply");
      v30[1] = v21;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v30, v29, 2);
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "errorWithDomain:code:userInfo:", CFSTR("MobileAssetBrainErrorDomain"), 900, v24);
      v22 = (id)objc_claimAutoreleasedReturnValue();

    }
    if (a2 && v22)
    {
      v22 = objc_retainAutorelease(v22);
      *a2 = v22;
    }
  }
  else
  {
    v22 = 0;
  }
  v25 = v28;

  return v25;
}

uint64_t _MAclientSendSecureMABundleCommand(uint64_t a1, void *a2, _QWORD *a3)
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  xpc_object_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  void *v21;
  id v22;
  void *v23;
  void *v24;
  void *v25;
  id v26;
  void *v27;
  void *v28;
  uint64_t v29;
  uint64_t v31;
  _QWORD v32[2];
  _QWORD v33[3];

  v33[2] = *MEMORY[0x1E0C80C00];
  v31 = 4;
  v5 = a2;
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("SecureMobileAssetBundleOptionPath"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("SecureMobileAssetBundleOptionSSO"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("SecureMobileAssetBundleOptionScpParametersOverride"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("SecureMobileAssetBundleOptionStageManifest"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("SecureMobileAssetBundleOptionSelectors"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v11 = xpc_dictionary_create(0, 0, 0);
  xpc_dictionary_set_uint64(v11, "messageAction", 0x2DuLL);
  xpc_dictionary_set_uint64(v11, "SecureMobileAssetBundleCommand", a1);
  if (v6)
    xpc_dictionary_set_string(v11, "SecureMobileAssetBundleOptionPath", (const char *)objc_msgSend(objc_retainAutorelease(v6), "UTF8String"));
  if (v8)
  {
    v20 = (void *)_CFXPCCreateXPCObjectFromCFObject();
    if (v20)
      xpc_dictionary_set_value(v11, "SecureMobileAssetBundleOptionScpParametersOverride", v20);

  }
  if (v9)
    xpc_dictionary_set_BOOL(v11, "SecureMobileAssetBundleOptionStageManifest", objc_msgSend(v9, "BOOLValue"));
  if (v10)
  {
    v21 = (void *)_CFXPCCreateXPCObjectFromCFObject();
    if (v21)
      xpc_dictionary_set_value(v11, "SecureMobileAssetBundleOptionSelectors", v21);

  }
  if (v7)
  {
    v22 = objc_retainAutorelease(v7);
    xpc_dictionary_set_data(v11, "SecureMobileAssetBundleOptionSSO", (const void *)objc_msgSend(v22, "bytes"), objc_msgSend(v22, "length"));
  }
  _getCommsManager(v12, v13, v14, v15, v16, v17, v18, v19);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "_MAclientSendSecureMABundleCommand");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "sendSync:gettingResponseCode:codeForXpcError:loggingName:", v11, &v31, 1, v24);
  v25 = (void *)objc_claimAutoreleasedReturnValue();

  if (v31)
  {
    createErrorFromMessage(v25);
    v26 = (id)objc_claimAutoreleasedReturnValue();
    if (!v26)
    {
      v27 = (void *)MEMORY[0x1E0CB35C8];
      v32[0] = *MEMORY[0x1E0CB2938];
      v32[1] = CFSTR("reply");
      v33[0] = CFSTR("Unable to decode error reply");
      v33[1] = v25;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v33, v32, 2);
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v27, "errorWithDomain:code:userInfo:", CFSTR("MobileAssetBrainErrorDomain"), 900, v28);
      v26 = (id)objc_claimAutoreleasedReturnValue();

    }
    if (a3 && v26)
    {
      v26 = objc_retainAutorelease(v26);
      *a3 = v26;
    }
  }
  else
  {
    v26 = 0;
  }
  v29 = v31;

  return v29;
}

void __getRetryXpcDelayQueue_block_invoke()
{
  dispatch_queue_t v0;
  void *v1;
  NSObject *v2;

  dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  v2 = objc_claimAutoreleasedReturnValue();
  v0 = dispatch_queue_create("com.apple.MobileAsset.retryClientCommsXpcDelay", v2);
  v1 = (void *)getRetryXpcDelayQueue_retryQueue;
  getRetryXpcDelayQueue_retryQueue = (uint64_t)v0;

}

void __plistDecodeClasses_block_invoke()
{
  id v0;
  void *v1;
  uint64_t v2;
  void *v3;
  _QWORD v4[7];

  v4[6] = *MEMORY[0x1E0C80C00];
  v0 = objc_alloc(MEMORY[0x1E0C99E60]);
  v4[0] = objc_opt_class();
  v4[1] = objc_opt_class();
  v4[2] = objc_opt_class();
  v4[3] = objc_opt_class();
  v4[4] = objc_opt_class();
  v4[5] = objc_opt_class();
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v4, 6);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = objc_msgSend(v0, "initWithArray:", v1);
  v3 = (void *)plistDecodeClasses__plistDecodeClasses;
  plistDecodeClasses__plistDecodeClasses = v2;

}

id suAssetTypes()
{
  if (suAssetTypes_once != -1)
    dispatch_once(&suAssetTypes_once, &__block_literal_global_595);
  return (id)suAssetTypes_suAssetTypes;
}

void __suAssetTypes_block_invoke()
{
  uint64_t v0;
  void *v1;

  v0 = objc_msgSend(objc_alloc(MEMORY[0x1E0C99E60]), "initWithArray:", &unk_1E5D7A968);
  v1 = (void *)suAssetTypes_suAssetTypes;
  suAssetTypes_suAssetTypes = v0;

}

id assetIdDisallowedCharacterSet()
{
  if (assetIdDisallowedCharacterSet_once != -1)
    dispatch_once(&assetIdDisallowedCharacterSet_once, &__block_literal_global_618);
  return (id)assetIdDisallowedCharacterSet_disallowedSet;
}

void __assetIdDisallowedCharacterSet_block_invoke()
{
  void *v0;
  void *v1;
  uint64_t v2;
  void *v3;

  v0 = (void *)MEMORY[0x1AF44EE58]();
  objc_msgSend(MEMORY[0x1E0CB3500], "characterSetWithCharactersInString:", CFSTR("0123456789abcdefABCDEF"));
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "invertedSet");
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = (void *)assetIdDisallowedCharacterSet_disallowedSet;
  assetIdDisallowedCharacterSet_disallowedSet = v2;

  objc_autoreleasePoolPop(v0);
}

id assetTypeDisallowedCharacterSet()
{
  if (assetTypeDisallowedCharacterSet_once != -1)
    dispatch_once(&assetTypeDisallowedCharacterSet_once, &__block_literal_global_622_0);
  return (id)assetTypeDisallowedCharacterSet_disallowedSet;
}

void __assetTypeDisallowedCharacterSet_block_invoke()
{
  void *v0;
  void *v1;
  uint64_t v2;
  void *v3;

  v0 = (void *)MEMORY[0x1AF44EE58]();
  objc_msgSend(MEMORY[0x1E0CB3500], "characterSetWithCharactersInString:", CFSTR("0123456789.abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ_-"));
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "invertedSet");
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = (void *)assetTypeDisallowedCharacterSet_disallowedSet;
  assetTypeDisallowedCharacterSet_disallowedSet = v2;

  objc_autoreleasePoolPop(v0);
}

id purposeDisallowedCharacterSet()
{
  if (purposeDisallowedCharacterSet_once != -1)
    dispatch_once(&purposeDisallowedCharacterSet_once, &__block_literal_global_628);
  return (id)purposeDisallowedCharacterSet_disallowedSet;
}

void __purposeDisallowedCharacterSet_block_invoke()
{
  void *v0;
  void *v1;
  uint64_t v2;
  void *v3;

  v0 = (void *)MEMORY[0x1AF44EE58]();
  objc_msgSend(MEMORY[0x1E0CB3500], "characterSetWithCharactersInString:", CFSTR("0123456789-abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ"));
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "invertedSet");
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = (void *)purposeDisallowedCharacterSet_disallowedSet;
  purposeDisallowedCharacterSet_disallowedSet = v2;

  objc_autoreleasePoolPop(v0);
}

id purposeIgnoredCharacterSet()
{
  if (purposeIgnoredCharacterSet_once != -1)
    dispatch_once(&purposeIgnoredCharacterSet_once, &__block_literal_global_631);
  return (id)purposeIgnoredCharacterSet_ignoredSet;
}

void __purposeIgnoredCharacterSet_block_invoke()
{
  void *v0;
  uint64_t v1;
  void *v2;

  v0 = (void *)MEMORY[0x1AF44EE58]();
  objc_msgSend(MEMORY[0x1E0CB3500], "characterSetWithCharactersInString:", CFSTR(";'\"\\/@?%*|<>.{}"));
  v1 = objc_claimAutoreleasedReturnValue();
  v2 = (void *)purposeIgnoredCharacterSet_ignoredSet;
  purposeIgnoredCharacterSet_ignoredSet = v1;

  objc_autoreleasePoolPop(v0);
}

id getObjectFromMessageLogIfDesired(void *a1, const char *a2, const char *a3, void *a4, int a5)
{
  id v9;
  id v10;
  const void *data;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  void *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  id v27;
  void *v28;
  id v30;
  size_t length;

  v9 = a1;
  v10 = a4;
  length = (unint64_t)xpc_dictionary_get_double(v9, a2);
  if (!length)
    goto LABEL_10;
  data = xpc_dictionary_get_data(v9, a3, &length);
  if (!data)
  {
    _MobileAssetLog(0, 6, (uint64_t)"getObjectFromMessageLogIfDesired", CFSTR("Failed to get key: %s due to not beinng present"), v12, v13, v14, v15, (uint64_t)a3);
LABEL_10:
    v28 = 0;
    v21 = 0;
    goto LABEL_15;
  }
  objc_msgSend(MEMORY[0x1E0C99D50], "dataWithBytes:length:", data, length);
  v16 = objc_claimAutoreleasedReturnValue();
  if (!v16)
  {
    if (a5)
      _MobileAssetLog(0, 6, (uint64_t)"getObjectFromMessageLogIfDesired", CFSTR("Failed to get key: %s"), v17, v18, v19, v20, (uint64_t)a3);
    goto LABEL_10;
  }
  v21 = (void *)v16;
  v30 = 0;
  v22 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3710]), "initForReadingFromData:error:", v16, &v30);
  v27 = v30;
  if (v27 || !v22)
  {
    if (a5)
      _MobileAssetLog(0, 6, (uint64_t)"getObjectFromMessageLogIfDesired", CFSTR("getObjectFromMessage: could not decode object for key: %s error: %@"), v23, v24, v25, v26, (uint64_t)a3);
    v28 = 0;
  }
  else
  {
    objc_msgSend(v22, "decodeObjectOfClasses:forKey:", v10, *MEMORY[0x1E0CB2CD0]);
    v28 = (void *)objc_claimAutoreleasedReturnValue();
  }
  objc_msgSend(v22, "finishDecoding");

LABEL_15:
  return v28;
}

id getObjectFromMessage(void *a1, const char *a2, const char *a3, void *a4)
{
  return getObjectFromMessageLogIfDesired(a1, a2, a3, a4, 1);
}

uint64_t calculateTimeout(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v8;
  uint64_t v9;

  v8 = (((unint64_t)a1 >> 10) * (unsigned __int128)0x2492492492492493uLL) >> 64;
  if (a1 > 0x102661BFFLL)
    v8 = 604800;
  if (a1 >= 6451200)
    v9 = v8;
  else
    v9 = 900;
  _MobileAssetLog(0, 6, (uint64_t)"calculateTimeout", CFSTR("Calculated the download timeout to be %ld hrs %ld mins %ld secs (%ld) for size %lld"), a5, a6, a7, a8, ((unint64_t)v9 * (unsigned __int128)0x123456789ABCE0uLL) >> 64);
  return v9;
}

BOOL determineUnarchiveSizeFromAttributes(void *a1, _QWORD *a2)
{
  void *v3;
  void *v4;

  objc_msgSend(a1, "objectForKey:", CFSTR("_UnarchivedSize"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
    *a2 = objc_msgSend(v3, "longLongValue");

  return v4 != 0;
}

__CFString *normalizePurpose(void *a1)
{
  __CFString *v1;
  __CFString *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  void *v7;
  uint64_t v8;

  v1 = a1;
  v2 = v1;
  if (v1 && !isWellFormedPurpose(v1))
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      purposeIgnoredCharacterSet();
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      -[__CFString rangeOfCharacterFromSet:](v2, "rangeOfCharacterFromSet:", v3);
      v5 = v4;

      if (v5)
      {
        purposeIgnoredCharacterSet();
        v6 = (void *)objc_claimAutoreleasedReturnValue();
        -[__CFString componentsSeparatedByCharactersInSet:](v2, "componentsSeparatedByCharactersInSet:", v6);
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "componentsJoinedByString:", &stru_1E5D5F930);
        v8 = objc_claimAutoreleasedReturnValue();

        v2 = (__CFString *)v8;
      }
    }
    if (!isWellFormedPurpose(v2))
    {

      v2 = &stru_1E5D5F930;
    }
  }
  return v2;
}

BOOL isWellFormedAssetType(void *a1)
{
  id v1;
  unint64_t v2;
  _BOOL8 v3;
  void *v5;

  v1 = a1;
  if (v1
    && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
    && objc_msgSend(v1, "hasPrefix:", CFSTR("com.apple.MobileAsset."))
    && (v2 = objc_msgSend(v1, "length"), v2 > objc_msgSend(CFSTR("com.apple.MobileAsset."), "length"))
    && (objc_msgSend(v1, "containsString:", CFSTR("..")) & 1) == 0)
  {
    assetTypeDisallowedCharacterSet();
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v3 = objc_msgSend(v1, "rangeOfCharacterFromSet:", v5) == 0x7FFFFFFFFFFFFFFFLL;

  }
  else
  {
    v3 = 0;
  }

  return v3;
}

id normalizedAssetType(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  void *v8;
  uint64_t v10;

  if (a1)
  {
    objc_msgSend(MEMORY[0x1E0CB37A0], "stringWithString:", a1);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "replaceOccurrencesOfString:withString:options:range:", CFSTR("."), CFSTR("_"), 2, 0, objc_msgSend(v8, "length"));
  }
  else
  {
    _MobileAssetLog(0, 6, (uint64_t)"normalizedAssetType", CFSTR("Could not create normalized asset type"), a5, a6, a7, a8, v10);
    v8 = 0;
  }
  return v8;
}

id assembleTaskDescriptorWithPurpose(uint64_t a1, uint64_t a2, void *a3)
{
  return assembleTaskDescriptorWithPurposeAndAutoAssetJobID(a1, a2, a3, 0);
}

id assembleTaskDescriptorWithPurposeAndAutoAssetJobID(uint64_t a1, uint64_t a2, void *a3, void *a4)
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;

  v7 = a3;
  v8 = a4;
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@%@%@"), a1, CFSTR("."), a2);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    normalizePurpose(v7);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v9, "stringByAppendingFormat:", CFSTR("%@%@"), CFSTR("."), v10);
    v11 = objc_claimAutoreleasedReturnValue();

    v9 = (void *)v11;
  }
  if (v8)
  {
    if (objc_msgSend(v8, "containsString:", CFSTR(".")))
    {
      _MobileAssetLog(0, 3, (uint64_t)"assembleTaskDescriptorWithPurposeAndAutoAssetJobID", CFSTR("{assembleTaskDescriptorWithPurposeAndAutoAssetJobID} invalid autoAssetJobID(ignored):%@"), v12, v13, v14, v15, (uint64_t)v8);
    }
    else
    {
      objc_msgSend(v9, "stringByAppendingFormat:", CFSTR("%@%@"), CFSTR("."), v8);
      v16 = objc_claimAutoreleasedReturnValue();

      v9 = (void *)v16;
    }
  }

  return v9;
}

id getRepositoryPath(void *a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  id v5;
  id v6;

  v5 = a1;
  if (v5 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    v6 = v5;
  }
  else
  {
    _MobileAssetLog(0, 3, (uint64_t)"getRepositoryPath", CFSTR("ERROR: Invalid string passed to %s"), v1, v2, v3, v4, (uint64_t)"getRepositoryPath");
    v6 = 0;
  }

  return v6;
}

id purposeDirectoryName(void *a1)
{
  void *v1;
  void *v2;
  void *v3;

  if (a1)
  {
    v1 = (void *)MEMORY[0x1E0CB3940];
    normalizePurpose(a1);
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v1, "stringWithFormat:", CFSTR("purpose_%@"), v2);
    v3 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v3 = 0;
  }
  return v3;
}

BOOL isWellFormedAssetId(void *a1)
{
  id v1;
  _BOOL8 v2;
  void *v4;

  v1 = a1;
  if (v1
    && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
    && (unint64_t)objc_msgSend(v1, "length") >= 0x14
    && (unint64_t)objc_msgSend(v1, "length") <= 0x3C)
  {
    assetIdDisallowedCharacterSet();
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v2 = objc_msgSend(v1, "rangeOfCharacterFromSet:", v4) == 0x7FFFFFFFFFFFFFFFLL;

  }
  else
  {
    v2 = 0;
  }

  return v2;
}

BOOL isWellFormedPurpose(void *a1)
{
  id v1;
  void *v2;
  uint64_t v3;
  uint64_t v4;
  _BOOL8 v5;

  v1 = a1;
  v5 = 1;
  if (v1)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0
      || !objc_msgSend(v1, "length")
      || (unint64_t)objc_msgSend(v1, "length") > 0x3C
      || (purposeDisallowedCharacterSet(),
          v2 = (void *)objc_claimAutoreleasedReturnValue(),
          objc_msgSend(v1, "rangeOfCharacterFromSet:", v2),
          v4 = v3,
          v2,
          v4))
    {
      v5 = 0;
    }
  }

  return v5;
}

uint64_t usingCentralizedCachedelete()
{
  if (usingCentralizedCachedelete_onceToken != -1)
    dispatch_once(&usingCentralizedCachedelete_onceToken, &__block_literal_global_798);
  return usingCentralizedCachedelete_eapfsEnabled;
}

uint64_t __usingCentralizedCachedelete_block_invoke()
{
  uint64_t result;
  io_object_t v1;
  CFTypeRef CFProperty;

  result = _MAPreferencesIsCentralizedCacheDeleteEnabled();
  if ((_DWORD)result)
  {
    result = IORegistryEntryFromPath(*MEMORY[0x1E0CBBAA8], "IODeviceTree:/filesystems");
    if ((_DWORD)result)
    {
      v1 = result;
      CFProperty = IORegistryEntryCreateCFProperty(result, CFSTR("e-apfs"), (CFAllocatorRef)*MEMORY[0x1E0C9AE00], 0);
      if (CFProperty)
      {
        CFRelease(CFProperty);
        usingCentralizedCachedelete_eapfsEnabled = 1;
      }
      return IOObjectRelease(v1);
    }
  }
  else
  {
    usingCentralizedCachedelete_eapfsEnabled = 0;
  }
  return result;
}

BOOL isDirStatsEnabledForDirectory(void *a1)
{
  id v1;
  int v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  _OWORD v12[17];
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  memset(v12, 0, sizeof(v12));
  v1 = objc_retainAutorelease(a1);
  v2 = fsctl((const char *)objc_msgSend(v1, "UTF8String"), 0xC1104A71uLL, v12, 0);
  if (v2)
  {
    __error();
    _MobileAssetLog(0, 3, (uint64_t)"isDirStatsEnabledForDirectory", CFSTR("Unable to check dirstats for directory %@, error %i"), v3, v4, v5, v6, (uint64_t)v1);
  }
  else if (_MAPreferencesIsVerboseLoggingEnabled())
  {
    _MobileAssetLog(0, 6, (uint64_t)"isDirStatsEnabledForDirectory", CFSTR("%@:\ndescendants: %llu\nphysical size: %llu\ngen-count: %llu\n"), v7, v8, v9, v10, (uint64_t)v1);
  }

  return v2 == 0;
}

BOOL markItemPurgeableWithFlagsAndStartTime(void *a1, uint64_t a2, uint64_t a3)
{
  id v5;
  void *v6;
  BOOL v7;
  id v8;
  int *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  _BOOL8 v14;
  int v16;
  int *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  __int128 v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;

  v5 = a1;
  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v6, "fileExistsAtPath:", CFSTR("/private/var/MobileSoftwareUpdate/.MAAMigrated.plist")))
  {

    goto LABEL_6;
  }
  v7 = isDirStatsEnabledForDirectory(v5);

  if (!v7)
  {
LABEL_6:
    v14 = 0;
    goto LABEL_7;
  }
  v27 = 0;
  v8 = objc_retainAutorelease(v5);
  if (fsctl((const char *)objc_msgSend(v8, "UTF8String"), 0xC0084A44uLL, &v27, 0))
  {
    v9 = __error();
    _MobileAssetLog(0, 3, (uint64_t)"markItemPurgeableWithFlagsAndStartTime", CFSTR("Failed to clear purgability, errno:%d"), v10, v11, v12, v13, *v9);
    goto LABEL_6;
  }
  v22 = a2;
  v23 = xmmword_1AE3BAD00;
  v24 = 0;
  v25 = a3;
  v26 = 0;
  v16 = fsctl((const char *)objc_msgSend(objc_retainAutorelease(v8), "UTF8String"), 0xC0304A6FuLL, &v22, 0);
  v14 = v16 == 0;
  if (v16)
  {
    v17 = __error();
    _MobileAssetLog(0, 3, (uint64_t)"markItemPurgeableWithFlagsAndStartTime", CFSTR("Failed to mark purgeable with label, errno:%d"), v18, v19, v20, v21, *v17);
  }
LABEL_7:

  return v14;
}

BOOL markItemPurgeableWithUrgencyAndGarbageCollectionPolicy(void *a1, uint64_t a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  _BOOL8 started;
  uint64_t v13;
  __uint64_t v14;
  uint64_t v16;

  v5 = a1;
  v6 = a3;
  v7 = v6;
  if (!v6)
    goto LABEL_6;
  if (!objc_msgSend(v6, "isEqualToString:", CFSTR("NeverCollected")))
  {
    if ((objc_msgSend(v7, "isEqualToString:", CFSTR("Precious")) & 1) != 0)
    {
      v13 = 2678400000000000;
LABEL_7:
      v14 = clock_gettime_nsec_np(_CLOCK_REALTIME);
      started = markItemPurgeableWithFlagsAndStartTime(v5, a2 | 0x10000, v14 + v13);
      goto LABEL_8;
    }
LABEL_6:
    v13 = 1296000000000000;
    goto LABEL_7;
  }
  _MobileAssetLog(0, 3, (uint64_t)"markItemPurgeableWithUrgencyAndGarbageCollectionPolicy", CFSTR("API MISUSE: markItemPurgeableWithUrgencyAndGarbageCollectionPolicy called with NeverCollected policy"), v8, v9, v10, v11, v16);
  started = 0;
LABEL_8:

  return started;
}

BOOL markAssetPurgeable(void *a1)
{
  return markItemPurgeableWithUrgencyAndGarbageCollectionPolicy(a1, 512, CFSTR("Default"));
}

id getLocalUrlFromTypeAndIdGivenDefaultRepoWithPurpose(void *a1, void *a2, uint64_t a3, void *a4, void *a5)
{
  id v9;
  id v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  id v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  void *v24;
  void *v25;
  __CFString *v26;
  __CFString *v27;
  void *v28;
  __CFString *v29;
  void *v30;
  id v31;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  uint64_t v37;
  void *v38;
  void *v39;
  uint64_t v40;
  uint64_t v41;

  v9 = a1;
  v10 = a2;
  v11 = a4;
  v19 = a5;
  if (!v9)
  {
    v27 = CFSTR("Attempting to get local url with nil asset type");
LABEL_9:
    _MobileAssetLog(0, 3, (uint64_t)"getLocalUrlFromTypeAndIdGivenDefaultRepoWithPurpose", v27, v15, v16, v17, v18, v41);
    v28 = 0;
    v24 = 0;
LABEL_12:
    v30 = 0;
    goto LABEL_13;
  }
  if (!v10)
  {
    v27 = CFSTR("Attempting to get local url with nil asset id");
    goto LABEL_9;
  }
  normalizedAssetType((uint64_t)v9, v12, v13, v14, v15, v16, v17, v18);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v24)
  {
    v29 = CFSTR("Attempting to get local URL with asset-type that could not be normalized");
LABEL_11:
    _MobileAssetLog(0, 3, (uint64_t)"getLocalUrlFromTypeAndIdGivenDefaultRepoWithPurpose", v29, v20, v21, v22, v23, v41);
    v28 = 0;
    goto LABEL_12;
  }
  if (a3 == 5)
  {
    v25 = (void *)MEMORY[0x1E0C99E98];
    v26 = CFSTR("/System/Library/PreinstalledAssetsV2/RequiredByOs");
    goto LABEL_15;
  }
  if (a3 != 6)
  {
    if (v11)
    {
      objc_msgSend(MEMORY[0x1E0C99E98], "URLWithString:", v11);
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      goto LABEL_18;
    }
    v29 = CFSTR("Attempting to get local url with nil default repo for a non preinstalled asset");
    goto LABEL_11;
  }
  v25 = (void *)MEMORY[0x1E0C99E98];
  v26 = CFSTR("/private/var/MobileAsset/PreinstalledAssetsV2/InstallWithOs");
LABEL_15:
  getRepositoryPath(v26);
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "URLWithString:", v33);
  v34 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_18:
  objc_msgSend(v34, "URLByAppendingPathComponent:", v24);
  v35 = (void *)objc_claimAutoreleasedReturnValue();

  if (v19)
  {
    purposeDirectoryName(v19);
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v35, "URLByAppendingPathComponent:", v36);
    v37 = objc_claimAutoreleasedReturnValue();

    v35 = (void *)v37;
  }
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@.%@"), v10, CFSTR("asset"));
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v38, "stringByAppendingPathComponent:", CFSTR("AssetData"));
  v30 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v35, "URLByAppendingPathComponent:", v30);
  v28 = (void *)objc_claimAutoreleasedReturnValue();

  if (v19)
  {
    purposeDirectoryName(v19);
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "URLByAppendingPathComponent:", v39);
    v40 = objc_claimAutoreleasedReturnValue();

    v28 = (void *)v40;
  }
LABEL_13:
  v31 = v28;

  return v31;
}

__CFString *stringForMAQueryReturnTypes(unint64_t a1)
{
  if (a1 < 7)
    return off_1E5D5D0C0[a1];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("MAQueryReturnTypes%llu"), a1);
  return (__CFString *)(id)objc_claimAutoreleasedReturnValue();
}

__CFString *stringForMAAssetState(unint64_t a1)
{
  if (a1 < 7)
    return off_1E5D5D0F8[a1];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("MAAssetState%llu"), a1);
  return (__CFString *)(id)objc_claimAutoreleasedReturnValue();
}

__CFString *stringForMAXpcCommand(unsigned int a1)
{
  if (a1 < 0x2F)
    return off_1E5D5D130[a1];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("MAXpcCommand%llu"), a1);
  return (__CFString *)(id)objc_claimAutoreleasedReturnValue();
}

__CFString *stringForMAXpcError(unint64_t a1)
{
  if (a1 < 9)
    return off_1E5D5D2A8[a1];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("MAXpcError%llu"), a1);
  return (__CFString *)(id)objc_claimAutoreleasedReturnValue();
}

__CFString *stringForMACancelDownloadResult(unint64_t a1)
{
  if (a1 < 8)
    return off_1E5D5D5D0[a1];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("MACancelDownloadResult%llu"), a1);
  return (__CFString *)(id)objc_claimAutoreleasedReturnValue();
}

__CFString *stringForMAPurgeResult(unint64_t a1)
{
  if (a1 < 0xD)
    return off_1E5D5D610[a1];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("MAPurgeResult%llu"), a1);
  return (__CFString *)(id)objc_claimAutoreleasedReturnValue();
}

__CFString *errorStringForMAPurgeResult(uint64_t a1)
{
  uint64_t v1;
  __CFString *v2;

  v1 = a1 - 1;
  if ((unint64_t)(a1 - 1) < 0xB && ((0x4EDu >> v1) & 1) != 0)
  {
    v2 = off_1E5D5D678[v1];
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Purge failed due to error %llu"), a1);
    v2 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  return v2;
}

__CFString *errorStringForMAQueryResult(unint64_t a1)
{
  __CFString *v2;
  void *v3;
  void *v4;

  if (a1 >= 0xF)
  {
    v3 = (void *)MEMORY[0x1E0CB3940];
    stringForMAQueryResult(a1);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "stringWithFormat:", CFSTR("Query failed due to Error %lld (%@)."), a1, v4);
    v2 = (__CFString *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v2 = off_1E5D5D6D0[a1];
  }
  return v2;
}

__CFString *errorStringForMACancelDownloadResult(unint64_t a1)
{
  __CFString *v2;
  void *v3;
  void *v4;

  if (a1 >= 8)
  {
    v3 = (void *)MEMORY[0x1E0CB3940];
    stringForMACancelDownloadResult(a1);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "stringWithFormat:", CFSTR("Download failed due to Error %lld (%@)."), a1, v4);
    v2 = (__CFString *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v2 = off_1E5D5D748[a1];
  }
  return v2;
}

id MAError(void *a1, uint64_t a2, void *a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  objc_class *v11;
  id v12;
  id v13;
  void *v14;
  void *v15;

  v11 = (objc_class *)MEMORY[0x1E0CB3940];
  v12 = a3;
  v13 = a1;
  v14 = (void *)objc_msgSend([v11 alloc], "initWithFormat:arguments:", v12, &a9);

  MAErrorWithUnderlyingUserInfoAndString(v13, a2, 0, 0, v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  return v15;
}

id MAErrorWithUnderlying(void *a1, uint64_t a2, void *a3, void *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  objc_class *v12;
  id v13;
  id v14;
  id v15;
  void *v16;
  void *v17;

  v12 = (objc_class *)MEMORY[0x1E0CB3940];
  v13 = a4;
  v14 = a3;
  v15 = a1;
  v16 = (void *)objc_msgSend([v12 alloc], "initWithFormat:arguments:", v13, &a9);

  MAErrorWithUnderlyingUserInfoAndString(v15, a2, v14, 0, v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  return v17;
}

uint64_t isCancelDownloadResultFailure(unint64_t a1)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;

  if (a1 < 8)
    return (0x36u >> a1) & 1;
  stringForMACancelDownloadResult(a1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  _MobileAssetLog(0, 3, (uint64_t)"isCancelDownloadResultFailure", CFSTR("Unknown MACancelDownloadResult: %ld (%@)"), v3, v4, v5, v6, a1);

  return 1;
}

id MAErrorForCancelDownloadResultWithUnderlying(unint64_t a1, void *a2, void *a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  id v11;
  objc_class *v12;
  id v13;
  void *v14;
  id v15;
  void *v16;
  void *v17;

  v11 = a3;
  if (v11)
  {
    v12 = (objc_class *)MEMORY[0x1E0CB3940];
    v13 = a2;
    v14 = (void *)objc_msgSend([v12 alloc], "initWithFormat:arguments:", v11, &a9);
  }
  else
  {
    v15 = a2;
    errorStringForMACancelDownloadResult(a1);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v16 = v14;
  MAErrorWithUnderlyingUserInfoAndString(CFSTR("com.apple.MobileAssetError.CancelDownload"), a1, a2, 0, v14);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  return v17;
}

uint64_t isAttributePartOfAssetIdHash(void *a1)
{
  id v1;
  uint64_t v2;

  v1 = a1;
  if (!objc_msgSend(v1, "hasPrefix:", CFSTR("_"))
    || (objc_msgSend(v1, "isEqualToString:", CFSTR("_ContentVersion")) & 1) != 0
    || (objc_msgSend(v1, "isEqualToString:", CFSTR("_CompatibilityVersion")) & 1) != 0)
  {
    v2 = 1;
  }
  else
  {
    v2 = objc_msgSend(v1, "isEqualToString:", CFSTR("_MasteredVersion"));
  }

  return v2;
}

__CFString *getAssetIdFromDict(void *a1, void *a2)
{
  __CFString *v3;
  id v4;
  __CFString *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  uint64_t v10;
  __CFString *v11;

  v3 = a1;
  v4 = a2;
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithCapacity:", 0);
  v5 = (__CFString *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "keyEnumerator");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "nextObject");
  v7 = objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    v8 = (void *)v7;
    do
    {
      if (isAttributePartOfAssetIdHash(v8))
      {
        objc_msgSend(v4, "objectForKey:", v8);
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        -[__CFString setObject:forKey:](v5, "setObject:forKey:", v9, v8);

      }
      objc_msgSend(v6, "nextObject");
      v10 = objc_claimAutoreleasedReturnValue();

      v8 = (void *)v10;
    }
    while (v10);
  }
  v11 = (__CFString *)_MobileAssetHashAssetData(*MEMORY[0x1E0C9AE00], v3, v5);

  return v11;
}

__CFString *getHashFromAttributesInSet(void *a1, void *a2, void *a3)
{
  __CFString *v5;
  __CFString *v6;
  id v7;
  __CFString *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  uint64_t v13;
  __CFString *v14;

  v5 = a1;
  v6 = a2;
  v7 = a3;
  if (v7)
  {
    v8 = (__CFString *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E08]), "initWithCapacity:", 0);
    -[__CFString keyEnumerator](v6, "keyEnumerator");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "nextObject");
    v10 = objc_claimAutoreleasedReturnValue();
    if (v10)
    {
      v11 = (void *)v10;
      do
      {
        if (objc_msgSend(v7, "containsObject:", v11))
        {
          -[__CFString objectForKey:](v6, "objectForKey:", v11);
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          -[__CFString setObject:forKey:](v8, "setObject:forKey:", v12, v11);

        }
        objc_msgSend(v9, "nextObject");
        v13 = objc_claimAutoreleasedReturnValue();

        v11 = (void *)v13;
      }
      while (v13);
    }
    v14 = (__CFString *)_MobileAssetHashAssetDataNoLegacy(*MEMORY[0x1E0C9AE00], v5, v8);

  }
  else
  {
    v14 = (__CFString *)_MobileAssetHashAssetDataNoLegacy(*MEMORY[0x1E0C9AE00], v5, v6);
  }

  return v14;
}

id getHashFromAssetIdAttributes(void *a1, void *a2)
{
  id v3;
  id v4;
  id v5;
  void *v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;

  v3 = a1;
  v4 = a2;
  v5 = objc_alloc_init(MEMORY[0x1E0C99E20]);
  objc_msgSend(v4, "keyEnumerator");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "nextObject");
  v7 = objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    v8 = (void *)v7;
    do
    {
      if (isAttributePartOfAssetIdHash(v8))
        objc_msgSend(v5, "addObject:", v8);
      objc_msgSend(v6, "nextObject");
      v9 = objc_claimAutoreleasedReturnValue();

      v8 = (void *)v9;
    }
    while (v9);
  }
  getHashFromAttributesInSet(v3, v4, v5);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

id getHashFromNonAssetIdAttributes(void *a1, void *a2)
{
  id v3;
  id v4;
  id v5;
  void *v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;

  v3 = a1;
  v4 = a2;
  v5 = objc_alloc_init(MEMORY[0x1E0C99E20]);
  objc_msgSend(v4, "keyEnumerator");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "nextObject");
  v7 = objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    v8 = (void *)v7;
    do
    {
      if ((isAttributePartOfAssetIdHash(v8) & 1) == 0)
        objc_msgSend(v5, "addObject:", v8);
      objc_msgSend(v6, "nextObject");
      v9 = objc_claimAutoreleasedReturnValue();

      v8 = (void *)v9;
    }
    while (v9);
  }
  getHashFromAttributesInSet(v3, v4, v5);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

id attributesInPallasDynamicAssetId()
{
  if (attributesInPallasDynamicAssetId_once != -1)
    dispatch_once(&attributesInPallasDynamicAssetId_once, &__block_literal_global_1757);
  return (id)attributesInPallasDynamicAssetId__pallasDynamicAssetIdAttributes;
}

void __attributesInPallasDynamicAssetId_block_invoke()
{
  id v0;
  void *v1;
  uint64_t v2;
  void *v3;
  _QWORD v4[3];

  v4[2] = *MEMORY[0x1E0C80C00];
  v0 = objc_alloc(MEMORY[0x1E0C99E60]);
  v4[0] = CFSTR("AssetType");
  v4[1] = CFSTR("Ramp");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v4, 2);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = objc_msgSend(v0, "initWithArray:", v1);
  v3 = (void *)attributesInPallasDynamicAssetId__pallasDynamicAssetIdAttributes;
  attributesInPallasDynamicAssetId__pallasDynamicAssetIdAttributes = v2;

}

id attributesInDownloadContent()
{
  if (attributesInDownloadContent_once != -1)
    dispatch_once(&attributesInDownloadContent_once, &__block_literal_global_1758);
  return (id)attributesInDownloadContent__downloadContentAttributes;
}

void __attributesInDownloadContent_block_invoke()
{
  id v0;
  void *v1;
  uint64_t v2;
  void *v3;
  _QWORD v4[4];

  v4[3] = *MEMORY[0x1E0C80C00];
  v0 = objc_alloc(MEMORY[0x1E0C99E60]);
  v4[0] = CFSTR("_DownloadSize");
  v4[1] = CFSTR("_Measurement");
  v4[2] = CFSTR("_MeasurementAlgorithmn");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v4, 3);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = objc_msgSend(v0, "initWithArray:", v1);
  v3 = (void *)attributesInDownloadContent__downloadContentAttributes;
  attributesInDownloadContent__downloadContentAttributes = v2;

}

id attributesInDownloadUrl()
{
  if (attributesInDownloadUrl_once != -1)
    dispatch_once(&attributesInDownloadUrl_once, &__block_literal_global_1759);
  return (id)attributesInDownloadUrl__downloadUrlAttributes;
}

void __attributesInDownloadUrl_block_invoke()
{
  id v0;
  void *v1;
  uint64_t v2;
  void *v3;
  _QWORD v4[3];

  v4[2] = *MEMORY[0x1E0C80C00];
  v0 = objc_alloc(MEMORY[0x1E0C99E60]);
  v4[0] = CFSTR("__BaseURL");
  v4[1] = CFSTR("__RelativePath");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v4, 2);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = objc_msgSend(v0, "initWithArray:", v1);
  v3 = (void *)attributesInDownloadUrl__downloadUrlAttributes;
  attributesInDownloadUrl__downloadUrlAttributes = v2;

}

id attributesInDownloadPolicy()
{
  if (attributesInDownloadPolicy_once != -1)
    dispatch_once(&attributesInDownloadPolicy_once, &__block_literal_global_1760);
  return (id)attributesInDownloadPolicy__downloadPolicyAttributes;
}

void __attributesInDownloadPolicy_block_invoke()
{
  id v0;
  void *v1;
  uint64_t v2;
  void *v3;
  _QWORD v4[6];

  v4[5] = *MEMORY[0x1E0C80C00];
  v0 = objc_alloc(MEMORY[0x1E0C99E60]);
  v4[0] = CFSTR("__CanUseLocalCacheServer");
  v4[1] = CFSTR("_CompressionAlgorithm");
  v4[2] = CFSTR("_IsZipStreamable");
  v4[3] = CFSTR("_UnarchivedSize");
  v4[4] = CFSTR("__AssetDefaultGarbageCollectionBehavior");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v4, 5);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = objc_msgSend(v0, "initWithArray:", v1);
  v3 = (void *)attributesInDownloadPolicy__downloadPolicyAttributes;
  attributesInDownloadPolicy__downloadPolicyAttributes = v2;

}

uint64_t categoryClean(__int16 a1)
{
  return a1 & 0x1FF;
}

uint64_t categoryInverse(int a1)
{
  return ~a1 & 0x1FFLL;
}

uint64_t categoryUnion(unsigned int a1, int a2)
{
  return (a2 | a1) & 0x1FFLL;
}

uint64_t categoryIntersection(int a1, unsigned int a2)
{
  return a1 & a2 & 0x1FFLL;
}

BOOL isCategoryNone(__int16 a1)
{
  return (a1 & 0x1FF) == 0;
}

BOOL isCategoryIn(int a1, int a2)
{
  return (a1 & ~a2 & 0x1FFLL) == 0;
}

id categorySimpleName(unint64_t a1)
{
  unint64_t v1;
  void *v2;
  id v3;

  v1 = a1 & 0x1FF;
  if (v1 == 511)
  {
    v2 = (void *)kMADiffCategoryName_All;
  }
  else if ((a1 & 1) == v1)
  {
    v2 = (void *)kMADiffCategoryName_AssetType;
  }
  else if ((a1 & 2) == v1)
  {
    v2 = (void *)kMADiffCategoryName_AssetId;
  }
  else if ((a1 & 0x20) == v1)
  {
    v2 = (void *)kMADiffCategoryName_DownloadContent;
  }
  else if ((a1 & 0x40) == v1)
  {
    v2 = (void *)kMADiffCategoryName_DownloadUrl;
  }
  else if ((a1 & 0x80) == v1)
  {
    v2 = (void *)kMADiffCategoryName_DownloadPolicy;
  }
  else if ((a1 & 0x100) == v1)
  {
    v2 = (void *)kMADiffCategoryName_PallasDynamicAssetId;
  }
  else if ((a1 & 0x10) == v1)
  {
    v2 = (void *)kMADiffCategoryName_NonAssetId;
  }
  else if ((a1 & 8) == v1)
  {
    v2 = (void *)kMADiffCategoryName_AssetIdAttributes;
  }
  else if ((a1 & 4) == v1)
  {
    v2 = (void *)kMADiffCategoryName_AnyAttribute;
  }
  else if ((a1 & 0x1FF) != 0)
  {
    if (a1 > 0x1FF)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@%ld"), kMADiffCategoryName_Unknown, a1);
      v3 = (id)objc_claimAutoreleasedReturnValue();
      return v3;
    }
    v2 = (void *)kMADiffCategoryName_Some;
  }
  else
  {
    v2 = (void *)kMADiffCategoryName_None;
  }
  v3 = v2;
  return v3;
}

id categoryCompoundName(unint64_t a1)
{
  void *v2;
  unint64_t v3;
  unsigned __int16 v4;
  unint64_t v5;
  void *v6;
  unint64_t v7;
  void *v8;

  v2 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB37A0]), "initWithString:", CFSTR("("));
  if (kMADiffCategory_BaseCount)
  {
    v3 = 0;
    v4 = 0;
    v5 = a1;
    do
    {
      v6 = (void *)MEMORY[0x1AF44EE58]();
      v7 = kMADiffCategory_Bases[v3];
      if ((~(_DWORD)a1 & v7 & 0x1FF) == 0)
      {
        if (objc_msgSend(v2, "length"))
          objc_msgSend(v2, "appendString:", CFSTR(" "));
        v4 = (v7 | v4) & 0x1FF;
        v5 &= v7 & 0x1FF ^ 0x1FF;
        categorySimpleName(v7);
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v2, "appendString:", v8);

      }
      objc_autoreleasePoolPop(v6);
      ++v3;
    }
    while (kMADiffCategory_BaseCount > v3);
  }
  else
  {
    v4 = 0;
    v5 = a1;
  }
  if ((v5 & 0x1FF) != 0)
  {
    if (objc_msgSend(v2, "length"))
      objc_msgSend(v2, "appendString:", CFSTR(" "));
    v5 &= ~((unsigned __int16)v5 | v4) | 0xFFFFFFFFFFFFFE00;
    objc_msgSend(v2, "appendString:", kMADiffCategoryName_Some);
  }
  if (v5 >= 0x200)
  {
    if (objc_msgSend(v2, "length"))
      objc_msgSend(v2, "appendString:", CFSTR(" "));
    objc_msgSend(v2, "appendString:", kMADiffCategoryName_Unknown);
  }
  objc_msgSend(v2, "appendString:", CFSTR(")"));
  return v2;
}

id categoryAssessDiffAndMask(unint64_t a1, unint64_t a2)
{
  const __CFString *v4;
  const __CFString *v5;
  void *v6;
  const __CFString *v7;
  uint64_t v8;
  void *v9;
  const __CFString *v10;
  void *v11;

  v4 = CFSTR("(from newer)");
  v5 = CFSTR("(from newer, subset)");
  if (a2 < 0x200)
  {
    v4 = &stru_1E5D5F930;
    v5 = CFSTR("(from older)");
  }
  v6 = (void *)MEMORY[0x1E0CB3940];
  if ((~(_WORD)a2 & 0x1FF) != 0)
    v7 = v5;
  else
    v7 = v4;
  categoryCompoundName(a1);
  v8 = objc_claimAutoreleasedReturnValue();
  v9 = (void *)v8;
  v10 = CFSTR("+");
  if (a1 < 0x200)
    v10 = &stru_1E5D5F930;
  objc_msgSend(v6, "stringWithFormat:", CFSTR("%0lx/%0lx %@%@%@"), a1, a2, v8, v10, v7);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

void __getRetryXpcDelayQueue_block_invoke_0()
{
  dispatch_queue_t v0;
  void *v1;
  NSObject *v2;

  dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  v2 = objc_claimAutoreleasedReturnValue();
  v0 = dispatch_queue_create("com.apple.MobileAsset.retryXpcDelay", v2);
  v1 = (void *)getRetryXpcDelayQueue_retryQueue_0;
  getRetryXpcDelayQueue_retryQueue_0 = (uint64_t)v0;

}

id queryDecodeClasses()
{
  if (queryDecodeClasses_once != -1)
    dispatch_once(&queryDecodeClasses_once, &__block_literal_global_5);
  return (id)queryDecodeClasses__queryDecodeClasses;
}

void __queryDecodeClasses_block_invoke()
{
  id v0;
  void *v1;
  uint64_t v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v0 = objc_alloc(MEMORY[0x1E0C99E60]);
  v4 = objc_opt_class();
  v5 = objc_opt_class();
  v6 = objc_opt_class();
  v7 = objc_opt_class();
  v8 = objc_opt_class();
  v9 = objc_opt_class();
  v10 = objc_opt_class();
  v11 = objc_opt_class();
  v12 = objc_opt_class();
  v13 = objc_opt_class();
  v14 = objc_opt_class();
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v4, 11);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = objc_msgSend(v0, "initWithArray:", v1, v4, v5, v6, v7, v8, v9, v10, v11, v12, v13);
  v3 = (void *)queryDecodeClasses__queryDecodeClasses;
  queryDecodeClasses__queryDecodeClasses = v2;

}

id _preferencesDomainProtectionDispatchQueue()
{
  if (_preferencesDomainProtectionDispatchQueue_preferencesDomainQueueOnce != -1)
    dispatch_once(&_preferencesDomainProtectionDispatchQueue_preferencesDomainQueueOnce, &__block_literal_global_6);
  return (id)_preferencesDomainProtectionDispatchQueue_preferencesDomainQueue;
}

void ___preferencesDomainProtectionDispatchQueue_block_invoke()
{
  dispatch_queue_t v0;
  void *v1;

  v0 = dispatch_queue_create("com.apple.MobileAsset.preferencesDomain", 0);
  v1 = (void *)_preferencesDomainProtectionDispatchQueue_preferencesDomainQueue;
  _preferencesDomainProtectionDispatchQueue_preferencesDomainQueue = (uint64_t)v0;

}

id _MAPreferencesCopyValue(void *a1)
{
  id v1;
  NSObject *v2;
  id v3;
  _QWORD v5[4];
  id v6;
  uint64_t *v7;
  uint64_t v8;
  uint64_t *v9;
  uint64_t v10;
  uint64_t (*v11)(uint64_t, uint64_t);
  void (*v12)(uint64_t);
  id v13;

  v1 = a1;
  v8 = 0;
  v9 = &v8;
  v10 = 0x3032000000;
  v11 = __Block_byref_object_copy__1;
  v12 = __Block_byref_object_dispose__1;
  v13 = 0;
  if (v1)
  {
    _preferencesDomainProtectionDispatchQueue();
    v2 = objc_claimAutoreleasedReturnValue();
    v5[0] = MEMORY[0x1E0C809B0];
    v5[1] = 3221225472;
    v5[2] = ___MAPreferencesCopyValue_block_invoke;
    v5[3] = &unk_1E5D5DB80;
    v7 = &v8;
    v6 = v1;
    dispatch_sync(v2, v5);

    v3 = (id)v9[5];
  }
  else
  {
    v3 = 0;
  }
  _Block_object_dispose(&v8, 8);

  return v3;
}

void __Block_byref_object_dispose__1(uint64_t a1)
{

}

uint64_t _MAPreferencesGetAppBooleanValue(void *a1, _BYTE *a2)
{
  void *v3;
  char isKindOfClass;
  char v5;
  char v6;
  uint64_t v7;

  _MAPreferencesCopyValue(a1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    objc_opt_class();
    isKindOfClass = objc_opt_isKindOfClass();
    v5 = isKindOfClass ^ 1;
    v6 = isKindOfClass & 1;
    if (!a2)
      goto LABEL_4;
    goto LABEL_3;
  }
  v6 = 0;
  v5 = 1;
  if (a2)
LABEL_3:
    *a2 = v6;
LABEL_4:
  if ((v5 & 1) != 0)
    v7 = 0;
  else
    v7 = objc_msgSend(v3, "BOOLValue");

  return v7;
}

uint64_t _MAPreferencesIsVerboseLoggingEnabled()
{
  if (_MAPreferencesIsVerboseLoggingEnabled_onceToken != -1)
    dispatch_once(&_MAPreferencesIsVerboseLoggingEnabled_onceToken, &__block_literal_global_761);
  return _MAPreferencesIsVerboseLoggingEnabled__verboseLoggingEnabled;
}

uint64_t _MAPreferencesIsCentralizedCacheDeleteEnabled()
{
  if (_MAPreferencesIsCentralizedCacheDeleteEnabled_onceToken != -1)
    dispatch_once(&_MAPreferencesIsCentralizedCacheDeleteEnabled_onceToken, &__block_literal_global_762);
  return _MAPreferencesIsCentralizedCacheDeleteEnabled__centralizedCacheDeleteEnabled;
}

id progressDictionaryForAssetIdAndState(void *a1, unint64_t a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void **v7;
  id *v8;
  void *v9;
  id v11;
  void *v12;
  id v13;
  _QWORD v14[2];

  v14[1] = *MEMORY[0x1E0C80C00];
  v3 = a1;
  v4 = v3;
  if (a2 <= 6 && ((1 << a2) & 0x6C) != 0)
  {
    v13 = v3;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", 1);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v14[0] = v5;
    v6 = (void *)MEMORY[0x1E0C99D80];
    v7 = (void **)v14;
    v8 = &v13;
  }
  else
  {
    v11 = v3;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", 0);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = v5;
    v6 = (void *)MEMORY[0x1E0C99D80];
    v7 = &v12;
    v8 = &v11;
  }
  objc_msgSend(v6, "dictionaryWithObjects:forKeys:count:", v7, v8, 1);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

void __Block_byref_object_dispose__2(uint64_t a1)
{

}

void __Block_byref_object_dispose__3(uint64_t a1)
{

}

void sub_1AE366204(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void ASSetAssetServerURL(void *a1)
{
  ASSetAssetServerURLForAssetType(a1, 0);
}

void ASSetAssetServerURLForAssetType(void *a1, void *a2)
{
  id v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  id v11;

  v11 = a1;
  v3 = a2;
  objc_msgSend(v11, "absoluteString");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = MASetServerUrlOverride(v3, v4);

  if (v5)
  {
    MAStringForMAOperationResult(v5);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    _MobileAssetLog(0, 3, (uint64_t)"ASSetAssetServerURLForAssetType", CFSTR("Could not set server URL in daemon: %lld %@ for url: %@"), v6, v7, v8, v9, v5);

  }
}

void ASSetDefaultAssetServerURLForAssetType(void *a1, void *a2)
{
  id v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  id v11;

  v11 = a1;
  v3 = a2;
  objc_msgSend(v11, "absoluteString");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = MASetServerUrlFallbackDefault(v3, v4);

  if (v5)
  {
    MAStringForMAOperationResult(v5);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    _MobileAssetLog(0, 3, (uint64_t)"ASSetDefaultAssetServerURLForAssetType", CFSTR("Could not set server URL in daemon: %lld %@ for url: %@"), v6, v7, v8, v9, v5);

  }
}

uint64_t __ForceMigration(uint64_t a1)
{
  return _MASendDataMigrator(a1, 1);
}

uint64_t ASNonUserInitiatedDownloadsAllowed(_QWORD *a1)
{
  return ASNonUserInitiatedDownloadsAllowedForAssetType(0, a1);
}

uint64_t ASNonUserInitiatedDownloadsAllowedForAssetType(uint64_t a1, _QWORD *a2)
{
  uint64_t v3;
  id v4;
  void *v5;
  id v6;
  id v8;

  v8 = 0;
  v3 = MANonUserInitiatedDownloadsAllowedForAssetType(a1, &v8);
  v4 = v8;
  v5 = v4;
  if (a2)
  {
    if (v4)
    {
      _ASErrorForMAError(v4);
      v6 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
      *a2 = v6;

    }
    else
    {
      *a2 = 0;
    }
  }

  return v3;
}

void ASEnsureDataVault(void *a1, _QWORD *a2)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  id v7;
  char v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  id v13;
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
  void *v24;
  void *v25;
  id v26;

  v7 = a1;
  if (v7 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    v26 = 0;
    v8 = MAEnsureDataVault(v7, &v26);
    v13 = v26;
    if ((v8 & 1) == 0)
    {
      _ASCreateError(CFSTR("MobileAssetError"), 32, 0, CFSTR("Cannot confirm that data vault exists"), v9, v10, v11, v12, v23);
      v14 = objc_claimAutoreleasedReturnValue();

      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Cannot confirm that data vault exists"));
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      _MobileAssetLog(0, 6, (uint64_t)"ASEnsureDataVault", CFSTR("[%@:%d] %@"), v15, v16, v17, v18, (uint64_t)CFSTR("MobileAssetError"));

      v13 = (id)v14;
    }
  }
  else
  {
    _ASCreateError(CFSTR("MobileAssetError"), 32, 0, CFSTR("Cannot create data vault for an invalid asset type"), v3, v4, v5, v6, v23);
    v13 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Cannot create data vault for an invalid asset type"));
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    _MobileAssetLog(0, 6, (uint64_t)"ASEnsureDataVault", CFSTR("[%@:%d] %@"), v19, v20, v21, v22, (uint64_t)CFSTR("MobileAssetError"));

  }
  if (a2)
    *a2 = objc_retainAutorelease(v13);

}

uint64_t MobileAssetQueryGetTypeID()
{
  return _MobileAssetQueryTypeID;
}

uint64_t MobileAssetQueryCreate(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  _MobileAssetLog(0, 3, (uint64_t)"MobileAssetQueryCreate", CFSTR("Deprecated ASAsset API is no longer supported: %s"), a5, a6, a7, a8, (uint64_t)"MobileAssetQueryCreate");
  return 0;
}

uint64_t MobileAssetQueryCreateArrayOfKnownAssets(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  _MobileAssetLog(0, 3, (uint64_t)"MobileAssetQueryCreateArrayOfKnownAssets", CFSTR("Deprecated ASAsset API is no longer supported: %s"), a5, a6, a7, a8, (uint64_t)"MobileAssetQueryCreateArrayOfKnownAssets");
  return 0;
}

uint64_t MobileAssetQueryRefreshKnownAssets(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  _MobileAssetLog(0, 3, (uint64_t)"MobileAssetQueryRefreshKnownAssets", CFSTR("Deprecated ASAsset API is no longer supported: %s"), a5, a6, a7, a8, (uint64_t)"MobileAssetQueryRefreshKnownAssets");
  return 0;
}

uint64_t MobileAssetQueryGetMatchingAsset(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  _MobileAssetLog(0, 3, (uint64_t)"MobileAssetQueryGetMatchingAsset", CFSTR("Deprecated ASAsset API is no longer supported: %s"), a5, a6, a7, a8, (uint64_t)"MobileAssetQueryGetMatchingAsset");
  return 0;
}

uint64_t MobileAssetQueryRefreshAssetsAgainstLocalCache(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  _MobileAssetLog(0, 3, (uint64_t)"MobileAssetQueryRefreshAssetsAgainstLocalCache", CFSTR("Deprecated ASAsset API is no longer supported: %s"), a5, a6, a7, a8, (uint64_t)"MobileAssetQueryRefreshAssetsAgainstLocalCache");
  return 0;
}

void sub_1AE36A4E8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  va_list va;

  va_start(va, a13);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void __Block_byref_object_dispose__4(uint64_t a1)
{

}

void sub_1AE36A818(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,char a27)
{
  _Block_object_dispose(&a27, 8);
  _Unwind_Resume(a1);
}

void sub_1AE36A9F8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  va_list va;

  va_start(va, a13);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1AE36E128(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,char a27,uint64_t a28,uint64_t a29,uint64_t a30,char a31)
{
  uint64_t v31;

  _Block_object_dispose(&a27, 8);
  _Block_object_dispose(&a31, 8);
  _Block_object_dispose((const void *)(v31 - 192), 8);
  _Block_object_dispose((const void *)(v31 - 144), 8);
  _Unwind_Resume(a1);
}

void __Block_byref_object_dispose__5(uint64_t a1)
{

}

void sub_1AE36EAC0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,char a30,uint64_t a31,uint64_t a32,uint64_t a33,char a34,uint64_t a35,uint64_t a36,uint64_t a37,char a38)
{
  uint64_t v38;

  _Block_object_dispose(&a30, 8);
  _Block_object_dispose(&a34, 8);
  _Block_object_dispose(&a38, 8);
  _Block_object_dispose((const void *)(v38 - 248), 8);
  _Block_object_dispose((const void *)(v38 - 200), 8);
  _Block_object_dispose((const void *)(v38 - 152), 8);
  _Unwind_Resume(a1);
}

void sub_1AE36F44C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,char a28,uint64_t a29,uint64_t a30,uint64_t a31,char a32,uint64_t a33,uint64_t a34,uint64_t a35,char a36)
{
  uint64_t v36;

  _Block_object_dispose(&a28, 8);
  _Block_object_dispose(&a32, 8);
  _Block_object_dispose(&a36, 8);
  _Block_object_dispose((const void *)(v36 - 200), 8);
  _Block_object_dispose((const void *)(v36 - 152), 8);
  _Unwind_Resume(a1);
}

void sub_1AE36FCA0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,char a27,uint64_t a28,uint64_t a29,uint64_t a30,char a31)
{
  uint64_t v31;

  _Block_object_dispose(&a27, 8);
  _Block_object_dispose(&a31, 8);
  _Block_object_dispose((const void *)(v31 - 176), 8);
  _Block_object_dispose((const void *)(v31 - 128), 8);
  _Unwind_Resume(a1);
}

void sub_1AE3707E8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,char a36,uint64_t a37,uint64_t a38,uint64_t a39,char a40,uint64_t a41,uint64_t a42,uint64_t a43,char a44,uint64_t a45,uint64_t a46,uint64_t a47,uint64_t a48,uint64_t a49,char a50)
{
  uint64_t v50;

  _Block_object_dispose(&a36, 8);
  _Block_object_dispose(&a40, 8);
  _Block_object_dispose(&a44, 8);
  _Block_object_dispose(&a50, 8);
  _Block_object_dispose((const void *)(v50 - 232), 8);
  _Block_object_dispose((const void *)(v50 - 184), 8);
  _Block_object_dispose((const void *)(v50 - 152), 8);
  _Unwind_Resume(a1);
}

void sub_1AE371164(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,char a27,uint64_t a28,uint64_t a29,uint64_t a30,char a31)
{
  uint64_t v31;

  _Block_object_dispose(&a27, 8);
  _Block_object_dispose(&a31, 8);
  _Block_object_dispose((const void *)(v31 - 192), 8);
  _Block_object_dispose((const void *)(v31 - 144), 8);
  _Unwind_Resume(a1);
}

void sub_1AE3719CC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,char a27,uint64_t a28,uint64_t a29,uint64_t a30,char a31)
{
  uint64_t v31;

  _Block_object_dispose(&a27, 8);
  _Block_object_dispose(&a31, 8);
  _Block_object_dispose((const void *)(v31 - 192), 8);
  _Block_object_dispose((const void *)(v31 - 144), 8);
  _Unwind_Resume(a1);
}

void sub_1AE3721B4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,char a27,uint64_t a28,uint64_t a29,uint64_t a30,char a31)
{
  uint64_t v31;

  _Block_object_dispose(&a27, 8);
  _Block_object_dispose(&a31, 8);
  _Block_object_dispose((const void *)(v31 - 176), 8);
  _Block_object_dispose((const void *)(v31 - 128), 8);
  _Unwind_Resume(a1);
}

void sub_1AE3727B4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1AE37302C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  id *v7;
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  objc_destroyWeak(v7);
  _Unwind_Resume(a1);
}

void __Block_byref_object_copy__433(uint64_t a1, uint64_t a2)
{
  objc_moveWeak((id *)(a1 + 40), (id *)(a2 + 40));
}

void __Block_byref_object_dispose__434(uint64_t a1)
{
  objc_destroyWeak((id *)(a1 + 40));
}

void sub_1AE373300(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  id *v7;
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  objc_destroyWeak(v7);
  _Unwind_Resume(a1);
}

void sub_1AE37A0E0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,char a25,uint64_t a26,uint64_t a27,uint64_t a28,char a29)
{
  uint64_t v29;

  _Block_object_dispose(&a25, 8);
  _Block_object_dispose(&a29, 8);
  _Block_object_dispose((const void *)(v29 - 128), 8);
  _Unwind_Resume(a1);
}

void sub_1AE37AAE8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,char a25,uint64_t a26,uint64_t a27,uint64_t a28,char a29)
{
  uint64_t v29;

  _Block_object_dispose(&a25, 8);
  _Block_object_dispose(&a29, 8);
  _Block_object_dispose((const void *)(v29 - 128), 8);
  _Unwind_Resume(a1);
}

void sub_1AE37B78C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, ...)
{
  uint64_t v17;
  va_list va;

  va_start(va, a17);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v17 - 144), 8);
  _Block_object_dispose((const void *)(v17 - 112), 8);
  _Unwind_Resume(a1);
}

void sub_1AE37C06C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, ...)
{
  uint64_t v17;
  va_list va;

  va_start(va, a17);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v17 - 144), 8);
  _Block_object_dispose((const void *)(v17 - 112), 8);
  _Unwind_Resume(a1);
}

void sub_1AE37C9AC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, ...)
{
  uint64_t v17;
  va_list va;

  va_start(va, a17);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v17 - 144), 8);
  _Block_object_dispose((const void *)(v17 - 112), 8);
  _Unwind_Resume(a1);
}

void sub_1AE37D28C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, ...)
{
  uint64_t v17;
  va_list va;

  va_start(va, a17);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v17 - 144), 8);
  _Block_object_dispose((const void *)(v17 - 112), 8);
  _Unwind_Resume(a1);
}

void sub_1AE37E278(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,char a28,uint64_t a29,uint64_t a30,uint64_t a31,char a32,uint64_t a33,uint64_t a34,uint64_t a35,char a36)
{
  uint64_t v36;

  _Block_object_dispose(&a28, 8);
  _Block_object_dispose(&a32, 8);
  _Block_object_dispose(&a36, 8);
  _Block_object_dispose((const void *)(v36 - 200), 8);
  _Block_object_dispose((const void *)(v36 - 152), 8);
  _Unwind_Resume(a1);
}

void sub_1AE37EF58(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,char a28,uint64_t a29,uint64_t a30,uint64_t a31,char a32,uint64_t a33,uint64_t a34,uint64_t a35,char a36)
{
  uint64_t v36;

  _Block_object_dispose(&a28, 8);
  _Block_object_dispose(&a32, 8);
  _Block_object_dispose(&a36, 8);
  _Block_object_dispose((const void *)(v36 - 184), 8);
  _Block_object_dispose((const void *)(v36 - 152), 8);
  _Unwind_Resume(a1);
}

void sub_1AE37FB14(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,char a30,uint64_t a31,uint64_t a32,uint64_t a33,char a34,uint64_t a35,uint64_t a36,uint64_t a37,char a38)
{
  uint64_t v38;

  _Block_object_dispose(&a30, 8);
  _Block_object_dispose(&a34, 8);
  _Block_object_dispose(&a38, 8);
  _Block_object_dispose((const void *)(v38 - 184), 8);
  _Block_object_dispose((const void *)(v38 - 152), 8);
  _Unwind_Resume(a1);
}

void sub_1AE380CE8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,char a30,uint64_t a31,uint64_t a32,uint64_t a33,char a34,uint64_t a35,uint64_t a36,uint64_t a37,char a38)
{
  uint64_t v38;

  _Block_object_dispose(&a30, 8);
  _Block_object_dispose(&a34, 8);
  _Block_object_dispose(&a38, 8);
  _Block_object_dispose((const void *)(v38 - 200), 8);
  _Block_object_dispose((const void *)(v38 - 152), 8);
  _Unwind_Resume(a1);
}

void sub_1AE381928(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,char a30,uint64_t a31,uint64_t a32,uint64_t a33,char a34)
{
  uint64_t v34;

  _Block_object_dispose(&a30, 8);
  _Block_object_dispose(&a34, 8);
  _Block_object_dispose((const void *)(v34 - 216), 8);
  _Block_object_dispose((const void *)(v34 - 168), 8);
  _Block_object_dispose((const void *)(v34 - 136), 8);
  _Unwind_Resume(a1);
}

void sub_1AE3822E0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, ...)
{
  uint64_t v17;
  va_list va;

  va_start(va, a17);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v17 - 144), 8);
  _Block_object_dispose((const void *)(v17 - 112), 8);
  _Unwind_Resume(a1);
}

void sub_1AE382C34(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, ...)
{
  uint64_t v17;
  va_list va;

  va_start(va, a17);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v17 - 144), 8);
  _Block_object_dispose((const void *)(v17 - 112), 8);
  _Unwind_Resume(a1);
}

void sub_1AE38358C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, ...)
{
  uint64_t v17;
  va_list va;

  va_start(va, a17);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v17 - 144), 8);
  _Block_object_dispose((const void *)(v17 - 112), 8);
  _Unwind_Resume(a1);
}

void OUTLINED_FUNCTION_3_0(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  NSObject *v9;

  _os_log_error_impl(a1, v9, OS_LOG_TYPE_ERROR, a4, &a9, 0x16u);
}

void OUTLINED_FUNCTION_8_0(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 2u);
}

uint64_t OUTLINED_FUNCTION_9_0(uint64_t a1, uint64_t a2)
{
  return a2;
}

uint64_t OUTLINED_FUNCTION_14(uint64_t a1, uint64_t a2)
{
  return a2;
}

void sub_1AE386C38(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,char a25,uint64_t a26,uint64_t a27,uint64_t a28,char a29,uint64_t a30,uint64_t a31,uint64_t a32,char a33)
{
  uint64_t v33;

  _Block_object_dispose(&a25, 8);
  _Block_object_dispose(&a29, 8);
  _Block_object_dispose(&a33, 8);
  _Block_object_dispose((const void *)(v33 - 144), 8);
  _Unwind_Resume(a1);
}

void __Block_byref_object_dispose__6(uint64_t a1)
{

}

void sub_1AE387470(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,char a25,uint64_t a26,uint64_t a27,uint64_t a28,char a29,uint64_t a30,uint64_t a31,uint64_t a32,char a33)
{
  uint64_t v33;

  _Block_object_dispose(&a25, 8);
  _Block_object_dispose(&a29, 8);
  _Block_object_dispose(&a33, 8);
  _Block_object_dispose((const void *)(v33 - 144), 8);
  _Unwind_Resume(a1);
}

void sub_1AE387894(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,char a26,uint64_t a27,uint64_t a28,uint64_t a29,char a30,uint64_t a31,uint64_t a32,uint64_t a33,char a34)
{
  uint64_t v34;

  _Block_object_dispose(&a26, 8);
  _Block_object_dispose(&a30, 8);
  _Block_object_dispose(&a34, 8);
  _Block_object_dispose((const void *)(v34 - 152), 8);
  _Unwind_Resume(a1);
}

void sub_1AE3884D0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,char a26,uint64_t a27,uint64_t a28,uint64_t a29,char a30,uint64_t a31,uint64_t a32,uint64_t a33,char a34)
{
  uint64_t v34;

  _Block_object_dispose(&a26, 8);
  _Block_object_dispose(&a30, 8);
  _Block_object_dispose(&a34, 8);
  _Block_object_dispose((const void *)(v34 - 152), 8);
  _Unwind_Resume(a1);
}

void sub_1AE388D34(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,char a26,uint64_t a27,uint64_t a28,uint64_t a29,char a30,uint64_t a31,uint64_t a32,uint64_t a33,char a34)
{
  uint64_t v34;

  _Block_object_dispose(&a26, 8);
  _Block_object_dispose(&a30, 8);
  _Block_object_dispose(&a34, 8);
  _Block_object_dispose((const void *)(v34 - 152), 8);
  _Unwind_Resume(a1);
}

void sub_1AE389598(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,char a26,uint64_t a27,uint64_t a28,uint64_t a29,char a30,uint64_t a31,uint64_t a32,uint64_t a33,char a34)
{
  uint64_t v34;

  _Block_object_dispose(&a26, 8);
  _Block_object_dispose(&a30, 8);
  _Block_object_dispose(&a34, 8);
  _Block_object_dispose((const void *)(v34 - 152), 8);
  _Unwind_Resume(a1);
}

void sub_1AE389DFC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,char a26,uint64_t a27,uint64_t a28,uint64_t a29,char a30,uint64_t a31,uint64_t a32,uint64_t a33,char a34)
{
  uint64_t v34;

  _Block_object_dispose(&a26, 8);
  _Block_object_dispose(&a30, 8);
  _Block_object_dispose(&a34, 8);
  _Block_object_dispose((const void *)(v34 - 152), 8);
  _Unwind_Resume(a1);
}

void sub_1AE38A5FC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,char a25,uint64_t a26,uint64_t a27,uint64_t a28,char a29)
{
  uint64_t v29;

  _Block_object_dispose(&a25, 8);
  _Block_object_dispose(&a29, 8);
  _Block_object_dispose((const void *)(v29 - 128), 8);
  _Unwind_Resume(a1);
}

void sub_1AE38AD0C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,char a25,uint64_t a26,uint64_t a27,uint64_t a28,char a29)
{
  uint64_t v29;

  _Block_object_dispose(&a25, 8);
  _Block_object_dispose(&a29, 8);
  _Block_object_dispose((const void *)(v29 - 128), 8);
  _Unwind_Resume(a1);
}

void sub_1AE38B42C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,char a25,uint64_t a26,uint64_t a27,uint64_t a28,char a29)
{
  uint64_t v29;

  _Block_object_dispose(&a25, 8);
  _Block_object_dispose(&a29, 8);
  _Block_object_dispose((const void *)(v29 - 144), 8);
  _Unwind_Resume(a1);
}

void sub_1AE38BB74(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,char a25,uint64_t a26,uint64_t a27,uint64_t a28,char a29)
{
  uint64_t v29;

  _Block_object_dispose(&a25, 8);
  _Block_object_dispose(&a29, 8);
  _Block_object_dispose((const void *)(v29 - 128), 8);
  _Unwind_Resume(a1);
}

void sub_1AE38C2D4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,char a26,uint64_t a27,uint64_t a28,uint64_t a29,char a30)
{
  uint64_t v30;

  _Block_object_dispose(&a26, 8);
  _Block_object_dispose(&a30, 8);
  _Block_object_dispose((const void *)(v30 - 184), 8);
  _Block_object_dispose((const void *)(v30 - 136), 8);
  _Unwind_Resume(a1);
}

void sub_1AE38CB44(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,char a28,uint64_t a29,uint64_t a30,uint64_t a31,char a32)
{
  uint64_t v32;

  _Block_object_dispose(&a28, 8);
  _Block_object_dispose(&a32, 8);
  _Block_object_dispose((const void *)(v32 - 184), 8);
  _Block_object_dispose((const void *)(v32 - 136), 8);
  _Unwind_Resume(a1);
}

void sub_1AE38D36C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,char a25,uint64_t a26,uint64_t a27,uint64_t a28,char a29)
{
  uint64_t v29;

  _Block_object_dispose(&a25, 8);
  _Block_object_dispose(&a29, 8);
  _Block_object_dispose((const void *)(v29 - 144), 8);
  _Unwind_Resume(a1);
}

MAAssetDiff *allowableDiffFromCategories(__int16 a1)
{
  uint64_t v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  MAAssetDiff *v7;

  v1 = categoryClean(a1);
  v2 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB36F8]), "initRequiringSecureCoding:", 1);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "encodeObject:forKey:", v3, CFSTR("diffBits"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", 511);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "encodeObject:forKey:", v4, CFSTR("diffMask"));

  objc_msgSend(v2, "finishEncoding");
  objc_msgSend(v2, "encodedData");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3710]), "initForReadingFromData:error:", v5, 0);
  v7 = -[MAAssetDiff initWithCoder:]([MAAssetDiff alloc], "initWithCoder:", v6);

  return v7;
}

uint64_t MAGetPallasEnabled(void *a1, char *a2)
{
  uint64_t result;
  char v4;

  v4 = 1;
  result = _MAsendGetPallasEnabled(a1, (BOOL *)&v4);
  if (a2)
    *a2 = v4;
  return result;
}

uint64_t MASetPallasAudience(void *a1)
{
  return _MAsendSetPallasAudience(a1, 0);
}

BOOL MANonUserInitiatedDownloadsAllowed()
{
  return _MAclientSendGetNonUserInitiatedDownloadsAllowedForAssetType(0);
}

void MAPurgeAll(void *a1, void *a2)
{
  MAPurgeAllWithPurposeExceptGivenIds(a1, 0, 0, a2);
}

void MAPurgeAllWithPurposeExceptGivenIds(void *a1, void *a2, void *a3, void *a4)
{
  id v7;
  id v8;
  _QWORD v9[4];
  id v10;

  v7 = a4;
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __MAPurgeAllWithPurposeExceptGivenIds_block_invoke;
  v9[3] = &unk_1E5D5E848;
  v10 = v7;
  v8 = v7;
  _MAPurgeAll(a1, a2, a3, v9);

}

void MAPurgeAllExceptGivenIds(void *a1, void *a2, void *a3)
{
  MAPurgeAllWithPurposeExceptGivenIds(a1, 0, a2, a3);
}

void MAPurgeAllWithPurpose(void *a1, void *a2, void *a3)
{
  MAPurgeAllWithPurposeExceptGivenIds(a1, a2, 0, a3);
}

void MAPurgeCatalogs(void *a1, void *a2)
{
  MAPurgeCatalogsWithPurpose(a1, 0, a2);
}

void MAPurgeCatalogsWithPurpose(void *a1, void *a2, void *a3)
{
  id v5;
  id v6;
  _QWORD v7[4];
  id v8;

  v5 = a3;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __MAPurgeCatalogsWithPurpose_block_invoke;
  v7[3] = &unk_1E5D5E848;
  v8 = v5;
  v6 = v5;
  _MAPurgeCatalogs(a1, a2, v7);

}

void MASoftwareLookupStartDownload(void *a1, void *a2)
{
  _MAsendPMVDownload(a1, 1, a2);
}

id MASoftwareLookupQuery(int a1, void *a2, void *a3, void *a4, void *a5, void *a6, _QWORD *a7)
{
  void *v8;
  id v9;
  void *v10;
  id v12;

  v12 = 0;
  _MAsendPMVQuerySync(a1, a2, a3, a4, a5, a6, &v12);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v12;
  v10 = v9;
  if (a7 && v9)
    *a7 = objc_retainAutorelease(v9);

  return v8;
}

id MASoftwareLookupQueryVersionsOnly(int a1, void *a2, void *a3, void *a4, void *a5, void *a6, _QWORD *a7)
{
  id v13;
  id v14;
  id v15;
  id v16;
  void *v17;
  id v18;
  id v19;
  void *v20;
  id v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t i;
  void *v26;
  void *v27;
  void *v28;
  void *v30;
  id v31;
  void *v32;
  void *v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  id v38;
  _BYTE v39[128];
  uint64_t v40;

  v40 = *MEMORY[0x1E0C80C00];
  v13 = a2;
  v14 = a3;
  v15 = a4;
  v16 = a5;
  v38 = 0;
  v33 = v15;
  v31 = a6;
  v32 = v16;
  MASoftwareLookupQuery(a1, v13, v14, v15, v16, v31, &v38);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = v38;
  v19 = v18;
  if (a7 && v18)
    *a7 = objc_retainAutorelease(v18);
  v30 = v19;
  v20 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(v17, "count"));
  v34 = 0u;
  v35 = 0u;
  v36 = 0u;
  v37 = 0u;
  v21 = v17;
  v22 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &v34, v39, 16);
  if (v22)
  {
    v23 = v22;
    v24 = *(_QWORD *)v35;
    do
    {
      for (i = 0; i != v23; ++i)
      {
        if (*(_QWORD *)v35 != v24)
          objc_enumerationMutation(v21);
        v26 = *(void **)(*((_QWORD *)&v34 + 1) + 8 * i);
        v27 = (void *)MEMORY[0x1AF44EE58]();
        objc_msgSend(v26, "objectForKey:", CFSTR("ProductVersion"));
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        if (v28)
        {
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0
            && (!v14 || objc_msgSend(v28, "hasPrefix:", v14))
            && (objc_msgSend(v20, "containsObject:", v28) & 1) == 0)
          {
            objc_msgSend(v20, "addObject:", v28);
          }
        }

        objc_autoreleasePoolPop(v27);
      }
      v23 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &v34, v39, 16);
    }
    while (v23);
  }

  objc_msgSend(v20, "sortUsingComparator:", &__block_literal_global_11);
  return v20;
}

uint64_t MALogClientWithNSLogOSLog(uint64_t a1, char a2)
{
  return MobileAssetForceNSLog(a1, a2 ^ 1u);
}

uint64_t MALogClientWithNSLogOSLogStdOut(uint64_t a1, char a2)
{
  return MobileAssetForceNSLog(a1, a2 ^ 1u);
}

id _MABrainGetInfo()
{
  void *v0;
  void *v1;
  void *v2;
  void *v3;
  id v4;
  id v6;
  uint64_t v7;
  const __CFString *v8;
  const __CFString *v9;
  _QWORD v10[2];

  v10[1] = *MEMORY[0x1E0C80C00];
  v9 = CFSTR("Error");
  v0 = (void *)MEMORY[0x1E0CB35C8];
  v7 = *MEMORY[0x1E0CB2938];
  v8 = CFSTR("Error getting MobileAssetBrain info");
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v8, &v7, 1);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "errorWithDomain:code:userInfo:", CFSTR("MobileAssetBrainErrorDomain"), 901, v1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = v2;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v10, &v9, 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = v3;
  _MAclientSendGetMABrainInfo(&v6);
  v4 = v6;

  return v4;
}

id _MABrainUpdate(void *a1)
{
  id v2;

  v2 = 0;
  _MAclientSendUpdateMABrain(a1, &v2);
  return v2;
}

id _SecureMABundleCommand(uint64_t a1, void *a2)
{
  id v3;

  v3 = 0;
  _MAclientSendSecureMABundleCommand(a1, a2, &v3);
  return v3;
}

void sub_1AE392C28(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
  id *v16;

  objc_destroyWeak(v16);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1AE39306C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void __Block_byref_object_dispose__7(uint64_t a1)
{

}

void sub_1AE3931A4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void __logError_block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.mobileassetd", "Error");
  v1 = (void *)logError_infoError;
  logError_infoError = (uint64_t)v0;

}

id logDebug()
{
  if (logDebug_logDebugOnce != -1)
    dispatch_once(&logDebug_logDebugOnce, &__block_literal_global_180);
  return (id)logDebug_infoDebug;
}

void __logDebug_block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.mobileassetd", "Debug");
  v1 = (void *)logDebug_infoDebug;
  logDebug_infoDebug = (uint64_t)v0;

}

id logFault()
{
  if (logFault_logFaultOnce != -1)
    dispatch_once(&logFault_logFaultOnce, &__block_literal_global_182);
  return (id)logFault_infoFault;
}

void __logFault_block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.mobileassetd", "Fault");
  v1 = (void *)logFault_infoFault;
  logFault_infoFault = (uint64_t)v0;

}

void _MobileAssetFault(uint64_t a1, void *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  objc_class *v9;
  id v10;
  void *v11;
  NSObject *v12;

  v9 = (objc_class *)MEMORY[0x1E0CB3940];
  v10 = a2;
  v11 = (void *)objc_msgSend([v9 alloc], "initWithFormat:arguments:", v10, &a9);

  logFault();
  v12 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_FAULT))
    _MobileAssetFault_cold_1();

}

uint64_t MobileAssetForceNSLog(uint64_t result, char a2)
{
  gForceNSLog = result;
  gExclusivelyNSLog = a2;
  return result;
}

id _getV1DecodeClasses()
{
  if (_getV1DecodeClasses_once != -1)
    dispatch_once(&_getV1DecodeClasses_once, &__block_literal_global_14);
  return (id)_getV1DecodeClasses_v1DecodeClasses;
}

void ___getV1DecodeClasses_block_invoke()
{
  id v0;
  void *v1;
  uint64_t v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v0 = objc_alloc(MEMORY[0x1E0C99E60]);
  v4 = objc_opt_class();
  v5 = objc_opt_class();
  v6 = objc_opt_class();
  v7 = objc_opt_class();
  v8 = objc_opt_class();
  v9 = objc_opt_class();
  v10 = objc_opt_class();
  v11 = objc_opt_class();
  v12 = objc_opt_class();
  v13 = objc_opt_class();
  v14 = objc_opt_class();
  v15 = objc_opt_class();
  v16 = objc_opt_class();
  v17 = objc_opt_class();
  v18 = objc_opt_class();
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v4, 15);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = objc_msgSend(v0, "initWithArray:", v1, v4, v5, v6, v7, v8, v9, v10, v11, v12, v13, v14, v15, v16, v17);
  v3 = (void *)_getV1DecodeClasses_v1DecodeClasses;
  _getV1DecodeClasses_v1DecodeClasses = v2;

}

id createErrorFromMessage(void *a1)
{
  const void *data;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  BOOL v17;
  void *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  id v29;
  uint64_t v31;
  id v32;
  size_t length;

  length = 0;
  data = xpc_dictionary_get_data(a1, "Error", &length);
  if (data)
  {
    objc_msgSend(MEMORY[0x1E0C99D50], "dataWithBytesNoCopy:length:freeWhenDone:", data, length, 0);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if (v10)
    {
      v32 = 0;
      v11 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3710]), "initForReadingFromData:error:", v10, &v32);
      v12 = v32;
      if (v11)
        v17 = v12 == 0;
      else
        v17 = 0;
      if (v17)
      {
        _getV1DecodeClasses();
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "decodeObjectOfClasses:forKey:", v20, *MEMORY[0x1E0CB2CD0]);
        v19 = (void *)objc_claimAutoreleasedReturnValue();

        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          _MobileAssetLog(0, 6, (uint64_t)"createErrorFromMessage", CFSTR("createErrorFromMessage: Successfully created error: %@"), v21, v22, v23, v24, (uint64_t)v19);
        }
        else
        {

          _MobileAssetLog(0, 6, (uint64_t)"createErrorFromMessage", CFSTR("createErrorFromMessage: created object was not an error"), v25, v26, v27, v28, v31);
          v19 = 0;
        }
        v18 = 0;
      }
      else
      {
        v18 = v12;
        _MobileAssetLog(0, 6, (uint64_t)"createErrorFromMessage", CFSTR("createErrorFromMessage: unarchiver cannot be created: %@"), v13, v14, v15, v16, (uint64_t)v12);
        v19 = 0;
      }
    }
    else
    {
      _MobileAssetLog(0, 6, (uint64_t)"createErrorFromMessage", CFSTR("createErrorFromMessage: errorInMessage is nil "), v6, v7, v8, v9, v31);
      v19 = 0;
      v18 = 0;
      v11 = 0;
    }
  }
  else
  {
    _MobileAssetLog(0, 6, (uint64_t)"createErrorFromMessage", CFSTR("createErrorFromMessage: data is nil "), v2, v3, v4, v5, v31);
    v19 = 0;
    v18 = 0;
    v11 = 0;
    v10 = 0;
  }
  objc_msgSend(v11, "finishDecoding");
  v29 = v19;

  return v29;
}

void sub_1AE39B338(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,char a27,uint64_t a28,uint64_t a29,uint64_t a30,char a31)
{
  uint64_t v31;

  _Block_object_dispose(&a27, 8);
  _Block_object_dispose(&a31, 8);
  _Block_object_dispose((const void *)(v31 - 192), 8);
  _Block_object_dispose((const void *)(v31 - 144), 8);
  _Unwind_Resume(a1);
}

void __Block_byref_object_dispose__8(uint64_t a1)
{

}

void sub_1AE39BC1C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,char a27,uint64_t a28,uint64_t a29,uint64_t a30,char a31)
{
  uint64_t v31;

  _Block_object_dispose(&a27, 8);
  _Block_object_dispose(&a31, 8);
  _Block_object_dispose((const void *)(v31 - 192), 8);
  _Block_object_dispose((const void *)(v31 - 144), 8);
  _Unwind_Resume(a1);
}

void sub_1AE39C99C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,char a38,uint64_t a39,uint64_t a40,uint64_t a41,char a42,uint64_t a43,uint64_t a44,uint64_t a45,char a46)
{
  uint64_t v46;

  _Block_object_dispose(&a38, 8);
  _Block_object_dispose(&a42, 8);
  _Block_object_dispose(&a46, 8);
  _Block_object_dispose((const void *)(v46 - 248), 8);
  _Block_object_dispose((const void *)(v46 - 200), 8);
  _Block_object_dispose((const void *)(v46 - 152), 8);
  _Unwind_Resume(a1);
}

void sub_1AE39D6B0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,char a32,uint64_t a33,uint64_t a34,uint64_t a35,char a36,uint64_t a37,uint64_t a38,uint64_t a39,char a40)
{
  uint64_t v40;

  _Block_object_dispose(&a32, 8);
  _Block_object_dispose(&a36, 8);
  _Block_object_dispose(&a40, 8);
  _Block_object_dispose((const void *)(v40 - 200), 8);
  _Block_object_dispose((const void *)(v40 - 152), 8);
  _Unwind_Resume(a1);
}

void sub_1AE39E398(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,char a26,uint64_t a27,uint64_t a28,uint64_t a29,char a30,uint64_t a31,uint64_t a32,uint64_t a33,char a34)
{
  uint64_t v34;

  _Block_object_dispose(&a26, 8);
  _Block_object_dispose(&a30, 8);
  _Block_object_dispose(&a34, 8);
  _Block_object_dispose((const void *)(v34 - 152), 8);
  _Unwind_Resume(a1);
}

void sub_1AE39EFB8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,char a26,uint64_t a27,uint64_t a28,uint64_t a29,char a30,uint64_t a31,uint64_t a32,uint64_t a33,char a34)
{
  uint64_t v34;

  _Block_object_dispose(&a26, 8);
  _Block_object_dispose(&a30, 8);
  _Block_object_dispose(&a34, 8);
  _Block_object_dispose((const void *)(v34 - 152), 8);
  _Unwind_Resume(a1);
}

void sub_1AE39F8B8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,char a27,uint64_t a28,uint64_t a29,uint64_t a30,char a31)
{
  uint64_t v31;

  _Block_object_dispose(&a27, 8);
  _Block_object_dispose(&a31, 8);
  _Block_object_dispose((const void *)(v31 - 192), 8);
  _Block_object_dispose((const void *)(v31 - 144), 8);
  _Unwind_Resume(a1);
}

void sub_1AE3A0240(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,char a27,uint64_t a28,uint64_t a29,uint64_t a30,char a31)
{
  uint64_t v31;

  _Block_object_dispose(&a27, 8);
  _Block_object_dispose(&a31, 8);
  _Block_object_dispose((const void *)(v31 - 176), 8);
  _Block_object_dispose((const void *)(v31 - 128), 8);
  _Unwind_Resume(a1);
}

void sub_1AE3A0AD0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,char a25,uint64_t a26,uint64_t a27,uint64_t a28,char a29)
{
  uint64_t v29;

  _Block_object_dispose(&a25, 8);
  _Block_object_dispose(&a29, 8);
  _Block_object_dispose((const void *)(v29 - 128), 8);
  _Unwind_Resume(a1);
}

void sub_1AE3A13C8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,char a30,uint64_t a31,uint64_t a32,uint64_t a33,char a34,uint64_t a35,uint64_t a36,uint64_t a37,char a38)
{
  uint64_t v38;

  _Block_object_dispose(&a30, 8);
  _Block_object_dispose(&a34, 8);
  _Block_object_dispose(&a38, 8);
  _Block_object_dispose((const void *)(v38 - 176), 8);
  _Block_object_dispose((const void *)(v38 - 128), 8);
  _Unwind_Resume(a1);
}

void sub_1AE3A60A8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,char a26,uint64_t a27,uint64_t a28,uint64_t a29,char a30)
{
  uint64_t v30;

  _Block_object_dispose(&a26, 8);
  _Block_object_dispose(&a30, 8);
  _Block_object_dispose((const void *)(v30 - 152), 8);
  _Unwind_Resume(a1);
}

void sub_1AE3A6B88(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,char a25,uint64_t a26,uint64_t a27,uint64_t a28,char a29)
{
  uint64_t v29;

  _Block_object_dispose(&a25, 8);
  _Block_object_dispose(&a29, 8);
  _Block_object_dispose((const void *)(v29 - 128), 8);
  _Unwind_Resume(a1);
}

void sub_1AE3A6E30(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1AE3A7500(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  id *v7;
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  objc_destroyWeak(v7);
  _Unwind_Resume(a1);
}

void __Block_byref_object_copy__515(uint64_t a1, uint64_t a2)
{
  objc_moveWeak((id *)(a1 + 40), (id *)(a2 + 40));
}

void __Block_byref_object_dispose__516(uint64_t a1)
{
  objc_destroyWeak((id *)(a1 + 40));
}

void OUTLINED_FUNCTION_8_1(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  NSObject *v9;

  _os_log_error_impl(a1, v9, OS_LOG_TYPE_ERROR, a4, &a9, 0x2Au);
}

uint64_t OUTLINED_FUNCTION_11_0(uint64_t a1, uint64_t a2)
{
  return a2;
}

uint64_t OUTLINED_FUNCTION_15(uint64_t a1, uint64_t a2)
{
  return a2;
}

void OUTLINED_FUNCTION_16(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  NSObject *v9;

  _os_log_error_impl(a1, v9, OS_LOG_TYPE_ERROR, a4, &a9, 0x20u);
}

id _ASCreateError(void *a1, uint64_t a2, void *a3, void *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  id v12;
  id v13;
  void *v14;
  id v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;

  v12 = a3;
  v13 = a4;
  v14 = (void *)MEMORY[0x1E0C99E08];
  v15 = a1;
  objc_msgSend(v14, "dictionary");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  if (v13)
  {
    v17 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:arguments:", v13, &a9);
    if (v17)
      objc_msgSend(v16, "setObject:forKey:", v17, *MEMORY[0x1E0C9AFB0]);

  }
  if (v12)
    objc_msgSend(v16, "setObject:forKey:", v12, *MEMORY[0x1E0CB3388]);
  v18 = (void *)MEMORY[0x1E0CB35C8];
  if (objc_msgSend(v16, "count"))
    v19 = v16;
  else
    v19 = 0;
  objc_msgSend(v18, "errorWithDomain:code:userInfo:", v15, a2, v19);
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  return v20;
}

__CFString *_ASStateForMobileAssetState(void *a1)
{
  __CFString *v1;
  __CFString **v2;
  __CFString *v3;
  __CFString *v4;
  int v6;

  v1 = a1;
  if (-[__CFString isEqualToString:](v1, "isEqualToString:", CFSTR("WaitingToDownload")))
  {
    v2 = ASOperationWaitingToDownload;
LABEL_13:
    v3 = *v2;
    goto LABEL_14;
  }
  if (-[__CFString isEqualToString:](v1, "isEqualToString:", CFSTR("DownloadStalled")))
  {
    v2 = ASOperationStalled;
    goto LABEL_13;
  }
  if (-[__CFString isEqualToString:](v1, "isEqualToString:", CFSTR("DownloadingAsset")))
  {
    v2 = ASOperationDownloadingAsset;
    goto LABEL_13;
  }
  if (-[__CFString isEqualToString:](v1, "isEqualToString:", CFSTR("DownloadPaused")))
  {
    v2 = ASOperationDownloadPaused;
    goto LABEL_13;
  }
  if (-[__CFString isEqualToString:](v1, "isEqualToString:", CFSTR("VerifyingAsset")))
  {
    v2 = ASOperationVerifyingAsset;
    goto LABEL_13;
  }
  if (-[__CFString isEqualToString:](v1, "isEqualToString:", CFSTR("UnarchivingAsset")))
  {
    v2 = ASOperationUnarchivingAsset;
    goto LABEL_13;
  }
  v6 = -[__CFString isEqualToString:](v1, "isEqualToString:", CFSTR("OperationCompleted"));
  v3 = CFSTR("OperationCompleted");
  if (!v6)
    v3 = v1;
LABEL_14:
  v4 = v3;

  return v4;
}

uint64_t _ASErrorCodeForMobileAssetErrorCode(unint64_t a1)
{
  if (a1 > 0x21)
    return -1;
  else
    return qword_1AE3BAEF8[a1];
}

id _ASErrorForV1Deprecation(void *a1)
{
  void *v1;
  id v2;
  void *v3;
  void *v4;
  void *v5;

  v1 = (void *)MEMORY[0x1E0C99E08];
  v2 = a1;
  objc_msgSend(v1, "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Deprecated ASAsset API is no longer supported: '%@'"), v2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v3, "setValue:forKey:", v4, *MEMORY[0x1E0CB2D50]);
  objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("ASError"), 33, v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

id _ASErrorForMAError(void *a1)
{
  id v1;
  void *v2;
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v15;
  id obj;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v1 = a1;
  v2 = v1;
  if (v1)
  {
    objc_msgSend(v1, "userInfo");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    if (v3)
    {
      v15 = v2;
      objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = 0u;
      v18 = 0u;
      v19 = 0u;
      v20 = 0u;
      objc_msgSend(v3, "keyEnumerator");
      obj = (id)objc_claimAutoreleasedReturnValue();
      v5 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
      if (v5)
      {
        v6 = v5;
        v7 = *(_QWORD *)v18;
        do
        {
          for (i = 0; i != v6; ++i)
          {
            if (*(_QWORD *)v18 != v7)
              objc_enumerationMutation(obj);
            v9 = *(void **)(*((_QWORD *)&v17 + 1) + 8 * i);
            v10 = (void *)MEMORY[0x1AF44EE58]();
            if (objc_msgSend(v9, "isEqualToString:", CFSTR("Operation")))
            {
              objc_msgSend(v3, "objectForKey:", CFSTR("Operation"));
              v11 = (void *)objc_claimAutoreleasedReturnValue();
              _ASStateForMobileAssetState(v11);
              v12 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v4, "setObject:forKey:", v12, CFSTR("Operation"));

            }
            else
            {
              objc_msgSend(v3, "objectForKey:", v9);
              v11 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v4, "setObject:forKey:", v11, v9);
            }

            objc_autoreleasePoolPop(v10);
          }
          v6 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
        }
        while (v6);
      }

      v2 = v15;
    }
    else
    {
      v4 = 0;
    }
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("ASError"), _ASErrorCodeForMobileAssetErrorCode(objc_msgSend(v2, "code")), v4);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v13 = 0;
  }

  return v13;
}

id MAPushServiceInterface()
{
  void *v0;
  void *v1;
  uint64_t v2;
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;

  objc_msgSend(MEMORY[0x1E0CB3B50], "interfaceWithProtocol:", &unk_1EED9E040);
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  v1 = (void *)MEMORY[0x1E0C99E60];
  v2 = objc_opt_class();
  objc_msgSend(v1, "setWithObjects:", v2, objc_opt_class(), 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "setClasses:forSelector:argumentIndex:ofReply:", v3, sel_subscribedChannelIDsWithCompletion_, 0, 1);

  v4 = (void *)MEMORY[0x1E0C99E60];
  v5 = objc_opt_class();
  v6 = objc_opt_class();
  v7 = objc_opt_class();
  v8 = objc_opt_class();
  v9 = objc_opt_class();
  objc_msgSend(v4, "setWithObjects:", v5, v6, v7, v8, v9, objc_opt_class(), 0);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "setClasses:forSelector:argumentIndex:ofReply:", v10, sel_triggerPushNotificationWithPayload_, 0, 0);

  v11 = (void *)MEMORY[0x1E0C99E60];
  v12 = objc_opt_class();
  objc_msgSend(v11, "setWithObjects:", v12, objc_opt_class(), 0);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "setClasses:forSelector:argumentIndex:ofReply:", v13, sel_pushJobsAwaitingTriggerWithCompletion_, 0, 1);

  return v0;
}

uint64_t MAServiceClientInterface()
{
  return objc_msgSend(MEMORY[0x1E0CB3B50], "interfaceWithProtocol:", &unk_1EED990E8);
}

unsigned __int8 *_hashCFStringOfLength(const __CFString *a1, CFIndex length, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  char v8;
  CFIndex MaximumSizeForEncoding;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  CFIndex v17;
  char *v18;
  uint64_t CString;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  unsigned __int8 *v27;

  if (length >= 0x7FFFFFFF)
    _hashCFStringOfLength_cold_1((uint64_t)a1, length, a3, a4, a5, a6, a7, a8);
  v8 = a3;
  if ((a3 & 1) == 0)
  {
    MaximumSizeForEncoding = CFStringGetMaximumSizeForEncoding(length, 0x8000100u);
    length = MaximumSizeForEncoding;
    if (MaximumSizeForEncoding >= 0x7FFFFFFF)
      _hashCFStringOfLength_cold_3(MaximumSizeForEncoding, MaximumSizeForEncoding, v11, v12, v13, v14, v15, v16);
  }
  v17 = length + 1;
  v18 = (char *)malloc_type_calloc(1uLL, length + 1, 0xB8C7522CuLL);
  CString = CFStringGetCString(a1, v18, v17, 0x8000100u);
  if (!(_DWORD)CString && (v8 & 1) == 0)
    _hashCFStringOfLength_cold_2(CString, v20, v21, v22, v23, v24, v25, v26);
  v27 = (unsigned __int8 *)malloc_type_calloc(1uLL, 0x14uLL, 0xD3FF0C7CuLL);
  CC_SHA1(v18, v17, v27);
  free(v18);
  return v27;
}

unsigned __int8 *_hashCFDataOfLength(const __CFData *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  CC_LONG v8;
  unsigned __int8 *v10;
  const UInt8 *BytePtr;

  if (a2 >= 0x80000000)
    _hashCFDataOfLength_cold_1((uint64_t)a1, a2, a3, a4, a5, a6, a7, a8);
  v8 = a2;
  v10 = (unsigned __int8 *)malloc_type_calloc(1uLL, 0x14uLL, 0xCCA769C6uLL);
  BytePtr = CFDataGetBytePtr(a1);
  CC_SHA1(BytePtr, v8, v10);
  return v10;
}

void *_hashCFDictionary(const __CFDictionary *a1, uint64_t a2)
{
  void *v4;
  void *v5;
  CFIndex Count;
  const void **v7;
  const void **v8;
  uint64_t v9;
  void *v10;
  const void *Value;
  void *v12;
  unsigned __int8 *v13;
  unsigned __int8 *v14;
  uint64_t i;
  const __CFNumber *v17;
  unsigned __int8 *v18;
  void *v19;
  CFIndex valuePtr;
  CC_SHA1_CTX c;
  CC_SHA1_CTX v23;

  if (CFDictionaryGetCount(a1) || (a2 & 1) == 0)
  {
    memset(&c, 0, sizeof(c));
    v5 = (void *)_hashCFType(CFSTR("dictionary"), a2);
    Count = CFDictionaryGetCount(a1);
    valuePtr = Count;
    v7 = (const void **)malloc_type_calloc(Count, 8uLL, 0x6004044C4A2DFuLL);
    if (!v7)
    {
      if (v5)
        free(v5);
      return 0;
    }
    v8 = v7;
    CFDictionaryGetKeysAndValues(a1, v7, 0);
    if (Count < 1)
    {
LABEL_16:
      if ((a2 & 1) != 0)
      {
        v4 = v5;
LABEL_33:
        free(v8);
        return v4;
      }
      v17 = CFNumberCreate(0, kCFNumberCFIndexType, &valuePtr);
      v18 = _hashCFNumber(v17);
      if (v17)
        CFRelease(v17);
      if (v5 && v18)
      {
        memset(&v23, 0, sizeof(v23));
        CC_SHA1_Init(&v23);
        CC_SHA1_Update(&v23, v5, 0x14u);
        CC_SHA1_Update(&v23, v18, 0x14u);
        CC_SHA1_Final((unsigned __int8 *)v5, &v23);
        v19 = v5;
      }
      else
      {
        v19 = v5;
        v4 = v5;
        if (!v18)
          goto LABEL_33;
      }
    }
    else
    {
      v9 = 0;
      while (1)
      {
        v10 = (void *)_hashCFType(v8[v9], a2);
        Value = CFDictionaryGetValue(a1, v8[v9]);
        v12 = (void *)_hashCFType(Value, a2);
        v13 = (unsigned __int8 *)malloc_type_calloc(1uLL, 0x14uLL, 0xC35AC6E0uLL);
        v14 = v13;
        if (!v13)
          break;
        if (!v10 || v12 == 0)
          break;
        CC_SHA1_Init(&c);
        CC_SHA1_Update(&c, v10, 0x14u);
        CC_SHA1_Update(&c, v12, 0x14u);
        CC_SHA1_Final(v14, &c);
        if (v5)
        {
          for (i = 0; i != 20; ++i)
            *((_BYTE *)v5 + i) ^= v14[i];
        }
        free(v14);
        free(v10);
        free(v12);
        if (Count <= ++v9)
          goto LABEL_16;
      }
      if (v13)
        free(v13);
      if (v10)
        free(v10);
      if (v12)
        free(v12);
      v19 = 0;
      v4 = 0;
      v18 = (unsigned __int8 *)v5;
      if (!v5)
        goto LABEL_33;
    }
    free(v18);
    v4 = v19;
    goto LABEL_33;
  }
  return 0;
}

unsigned __int8 *_hashCFType(const __CFString *a1, uint64_t a2)
{
  CFTypeID v4;
  unsigned __int8 *v5;
  Boolean *p_Value;
  CC_LONG v7;
  CFIndex Length;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  const __CFString *v14;
  uint64_t v15;
  CFIndex v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  Boolean Value;
  double data;

  if (!a1)
  {
    if ((a2 & 1) == 0)
    {
      Length = CFStringGetLength(CFSTR("NULL"));
      v14 = CFSTR("NULL");
      v15 = 0;
      return _hashCFStringOfLength(v14, Length, v15, v9, v10, v11, v12, v13);
    }
    return 0;
  }
  v4 = CFGetTypeID(a1);
  if (v4 == CFBooleanGetTypeID())
  {
    v5 = (unsigned __int8 *)malloc_type_calloc(1uLL, 0x14uLL, 0x6DDBB9C1uLL);
    Value = CFBooleanGetValue((CFBooleanRef)a1);
    p_Value = &Value;
    v7 = 1;
LABEL_12:
    CC_SHA1(p_Value, v7, v5);
    return v5;
  }
  if (v4 == CFStringGetTypeID())
  {
    Length = CFStringGetLength(a1);
    v14 = a1;
    v15 = a2;
    return _hashCFStringOfLength(v14, Length, v15, v9, v10, v11, v12, v13);
  }
  if (v4 == CFDateGetTypeID())
  {
    v5 = (unsigned __int8 *)malloc_type_calloc(1uLL, 0x14uLL, 0xD609C58EuLL);
    data = MEMORY[0x1AF44EB7C](a1);
    p_Value = (Boolean *)&data;
    v7 = 8;
    goto LABEL_12;
  }
  if (v4 == CFDataGetTypeID())
  {
    v17 = CFDataGetLength((CFDataRef)a1);
    return _hashCFDataOfLength((const __CFData *)a1, v17, v18, v19, v20, v21, v22, v23);
  }
  if (v4 != CFArrayGetTypeID())
  {
    if (v4 == CFDictionaryGetTypeID())
      return (unsigned __int8 *)_hashCFDictionary((const __CFDictionary *)a1, a2);
    if (v4 == CFNumberGetTypeID())
      return _hashCFNumber((const __CFNumber *)a1);
    return 0;
  }
  if ((_DWORD)a2)
    return _hashCFArrayLegacy((const __CFArray *)a1);
  else
    return _hashCFArrayNoLegacy((const __CFArray *)a1);
}

unsigned __int8 *_hashCFNumber(const __CFNumber *a1)
{
  unsigned __int8 *v2;
  size_t v3;
  CFNumberType v4;
  void *v5;
  uint64_t valuePtr;

  v2 = (unsigned __int8 *)malloc_type_calloc(1uLL, 0x14uLL, 0x24FC56B0uLL);
  valuePtr = 0;
  CFNumberGetValue(a1, kCFNumberSInt64Type, &valuePtr);
  if ((unint64_t)(valuePtr + 1) >= 0xE)
    v3 = 8;
  else
    v3 = 4;
  if ((unint64_t)(valuePtr + 1) < 0xE)
    v4 = kCFNumberSInt32Type;
  else
    v4 = kCFNumberSInt64Type;
  v5 = malloc_type_calloc(1uLL, v3, 0x8DF0DFD0uLL);
  CFNumberGetValue(a1, v4, v5);
  CC_SHA1(v5, v3, v2);
  free(v5);
  return v2;
}

CFStringRef _hashToCFString(unsigned __int8 *a1)
{
  char __str[100];
  uint64_t v3;

  v3 = *MEMORY[0x1E0C80C00];
  snprintf(__str, 0x64uLL, "%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x", *a1, a1[1], a1[2], a1[3], a1[4], a1[5], a1[6], a1[7], a1[8], a1[9], a1[10], a1[11], a1[12], a1[13], a1[14], a1[15],
    a1[16],
    a1[17],
    a1[18],
    a1[19]);
  return CFStringCreateWithCString((CFAllocatorRef)*MEMORY[0x1E0C9AE00], __str, 0x8000100u);
}

CFStringRef _MobileAssetHashAssetDataOptCompatibility(uint64_t a1, const __CFString *a2, const __CFString *a3, uint64_t a4)
{
  unsigned __int8 *v6;
  unsigned __int8 *v7;
  unsigned __int8 *v8;
  uint64_t i;
  CFStringRef v10;

  v6 = _hashCFType(a2, a4);
  if (!v6)
  {
    v8 = 0;
    goto LABEL_7;
  }
  v7 = _hashCFType(a3, a4);
  v8 = v7;
  if (!v7)
  {
LABEL_7:
    v10 = 0;
    goto LABEL_8;
  }
  for (i = 0; i != 20; ++i)
    v6[i] ^= v7[i];
  v10 = _hashToCFString(v6);
LABEL_8:
  free(v6);
  free(v8);
  return v10;
}

CFStringRef _MobileAssetHashAssetData(uint64_t a1, const __CFString *a2, const __CFString *a3)
{
  return _MobileAssetHashAssetDataOptCompatibility(a1, a2, a3, 1);
}

CFStringRef _MobileAssetHashAssetDataNoLegacy(uint64_t a1, const __CFString *a2, const __CFString *a3)
{
  return _MobileAssetHashAssetDataOptCompatibility(a1, a2, a3, 0);
}

_BYTE *_hashCFArrayLegacy(const __CFArray *a1)
{
  CFIndex Count;
  CFIndex v3;
  CFIndex v4;
  const void *ValueAtIndex;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  _BYTE *v10;
  CFIndex v11;
  const void *v12;
  _BYTE *v13;
  uint64_t i;
  uint64_t v16;
  CFRange v17;

  if (!CFArrayGetCount(a1))
    return 0;
  Count = CFArrayGetCount(a1);
  if (Count >= 1)
  {
    v3 = Count;
    v4 = 0;
    while (1)
    {
      ValueAtIndex = CFArrayGetValueAtIndex(a1, v4);
      v17.location = 0;
      v17.length = v3;
      if (CFArrayGetCountOfValue(a1, v17, ValueAtIndex) >= 2)
        break;
      if (v3 == ++v4)
        goto LABEL_6;
    }
    _MobileAssetLog(0, 6, (uint64_t)"_hashCFArrayLegacy", CFSTR("Failing to hash due to duplicate array entries"), v6, v7, v8, v9, v16);
    return 0;
  }
LABEL_6:
  v10 = (_BYTE *)_hashCFType(CFSTR("array"), 1);
  if (CFArrayGetCount(a1) >= 1)
  {
    v11 = 0;
    while (1)
    {
      v12 = CFArrayGetValueAtIndex(a1, v11);
      v13 = (_BYTE *)_hashCFType(v12, 1);
      if (!v13)
        break;
      if (v10)
      {
        for (i = 0; i != 20; ++i)
          v10[i] ^= v13[i];
      }
      free(v13);
      if (CFArrayGetCount(a1) <= ++v11)
        return v10;
    }
    free(v10);
    return 0;
  }
  return v10;
}

unsigned __int8 *_hashCFArrayNoLegacy(const __CFArray *a1)
{
  void *v2;
  const __CFNumber *v3;
  unsigned __int8 *v4;
  const __CFNumber *v5;
  unsigned __int8 *v6;
  const void *ValueAtIndex;
  void *v8;
  unsigned __int8 *v9;
  CFIndex idx;
  uint64_t valuePtr;
  CC_SHA1_CTX c;

  memset(&c, 0, sizeof(c));
  CC_SHA1_Init(&c);
  v2 = (void *)_hashCFType(CFSTR("array"), 0);
  CC_SHA1_Update(&c, v2, 0x14u);
  if (v2)
    free(v2);
  valuePtr = CFArrayGetCount(a1);
  v3 = CFNumberCreate(0, kCFNumberCFIndexType, &valuePtr);
  v4 = _hashCFNumber(v3);
  CC_SHA1_Update(&c, v4, 0x14u);
  if (v3)
    CFRelease(v3);
  if (v4)
    free(v4);
  idx = 0;
  if (valuePtr >= 1)
  {
    do
    {
      v5 = CFNumberCreate(0, kCFNumberCFIndexType, &idx);
      v6 = _hashCFNumber(v5);
      CC_SHA1_Update(&c, v6, 0x14u);
      if (v5)
        CFRelease(v5);
      if (v6)
        free(v6);
      ValueAtIndex = CFArrayGetValueAtIndex(a1, idx);
      v8 = (void *)_hashCFType(ValueAtIndex, 0);
      CC_SHA1_Update(&c, v8, 0x14u);
      if (v8)
        free(v8);
      ++idx;
    }
    while (idx < valuePtr);
  }
  v9 = (unsigned __int8 *)malloc_type_calloc(1uLL, 0x14uLL, 0xA29F39CuLL);
  CC_SHA1_Final(v9, &c);
  return v9;
}

void _MobileAssetLog_cold_2()
{
  os_log_t v0;
  uint8_t v1[24];
  uint64_t v2;

  v2 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_3();
  _os_log_debug_impl(&dword_1AE33B000, v0, OS_LOG_TYPE_DEBUG, "%{public}s: %{public}@", v1, 0x16u);
  OUTLINED_FUNCTION_8();
}

void _MobileAssetFault_cold_1()
{
  os_log_t v0;
  uint8_t v1[24];
  uint64_t v2;

  v2 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_3();
  _os_log_fault_impl(&dword_1AE33B000, v0, OS_LOG_TYPE_FAULT, "MobileAsset Simulated %{public}s: %{public}@", v1, 0x16u);
  OUTLINED_FUNCTION_8();
}

void _hashCFStringOfLength_cold_1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t vars0;

  OUTLINED_FUNCTION_0_0(a1, a2, (uint64_t)"_hashCFStringOfLength", CFSTR("Received a request to hash a value that is too large, possible malicious behavior - aborting"), a5, a6, a7, a8, vars0);
  abort();
}

void _hashCFStringOfLength_cold_2(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t vars0;

  OUTLINED_FUNCTION_0_0(a1, a2, (uint64_t)"_hashCFStringOfLength", CFSTR("Received a request to hash a value but could not get a C string. Possible malicious behavior - aborting"), a5, a6, a7, a8, vars0);
  abort();
}

void _hashCFStringOfLength_cold_3(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t vars0;

  OUTLINED_FUNCTION_0_0(a1, a2, (uint64_t)"_hashCFStringOfLength", CFSTR("Received a request to hash a multibyte value that is too large, possible malicious behavior - aborting"), a5, a6, a7, a8, vars0);
  abort();
}

void _hashCFDataOfLength_cold_1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t vars0;

  OUTLINED_FUNCTION_0_0(a1, a2, (uint64_t)"_hashCFDataOfLength", CFSTR("Received a request to hash a value that is too large, possible malicious behavior - aborting"), a5, a6, a7, a8, vars0);
  abort();
}

unsigned __int8 *__cdecl CC_SHA1(const void *data, CC_LONG len, unsigned __int8 *md)
{
  return (unsigned __int8 *)MEMORY[0x1E0C80328](data, *(_QWORD *)&len, md);
}

int CC_SHA1_Final(unsigned __int8 *md, CC_SHA1_CTX *c)
{
  return MEMORY[0x1E0C80330](md, c);
}

int CC_SHA1_Init(CC_SHA1_CTX *c)
{
  return MEMORY[0x1E0C80338](c);
}

int CC_SHA1_Update(CC_SHA1_CTX *c, const void *data, CC_LONG len)
{
  return MEMORY[0x1E0C80340](c, data, *(_QWORD *)&len);
}

CFIndex CFArrayGetCount(CFArrayRef theArray)
{
  return MEMORY[0x1E0C97D60](theArray);
}

CFIndex CFArrayGetCountOfValue(CFArrayRef theArray, CFRange range, const void *value)
{
  return MEMORY[0x1E0C97D70](theArray, range.location, range.length, value);
}

CFTypeID CFArrayGetTypeID(void)
{
  return MEMORY[0x1E0C97D90]();
}

const void *__cdecl CFArrayGetValueAtIndex(CFArrayRef theArray, CFIndex idx)
{
  return (const void *)MEMORY[0x1E0C97D98](theArray, idx);
}

CFTypeID CFBooleanGetTypeID(void)
{
  return MEMORY[0x1E0C97FC8]();
}

Boolean CFBooleanGetValue(CFBooleanRef BOOLean)
{
  return MEMORY[0x1E0C97FE0](BOOLean);
}

const UInt8 *__cdecl CFDataGetBytePtr(CFDataRef theData)
{
  return (const UInt8 *)MEMORY[0x1E0C983E0](theData);
}

CFIndex CFDataGetLength(CFDataRef theData)
{
  return MEMORY[0x1E0C983F8](theData);
}

CFTypeID CFDataGetTypeID(void)
{
  return MEMORY[0x1E0C98418]();
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

CFTypeID CFGetTypeID(CFTypeRef cf)
{
  return MEMORY[0x1E0C98738](cf);
}

CFNumberRef CFNumberCreate(CFAllocatorRef allocator, CFNumberType theType, const void *valuePtr)
{
  return (CFNumberRef)MEMORY[0x1E0C98928](allocator, theType, valuePtr);
}

CFTypeID CFNumberGetTypeID(void)
{
  return MEMORY[0x1E0C989B8]();
}

Boolean CFNumberGetValue(CFNumberRef number, CFNumberType theType, void *valuePtr)
{
  return MEMORY[0x1E0C989C0](number, theType, valuePtr);
}

CFPropertyListRef CFPreferencesCopyAppValue(CFStringRef key, CFStringRef applicationID)
{
  return (CFPropertyListRef)MEMORY[0x1E0C98A40](key, applicationID);
}

void CFRelease(CFTypeRef cf)
{
  MEMORY[0x1E0C98BC0](cf);
}

CFStringRef CFStringCreateWithCString(CFAllocatorRef alloc, const char *cStr, CFStringEncoding encoding)
{
  return (CFStringRef)MEMORY[0x1E0C98FD0](alloc, cStr, *(_QWORD *)&encoding);
}

CFStringRef CFStringCreateWithFormat(CFAllocatorRef alloc, CFDictionaryRef formatOptions, CFStringRef format, ...)
{
  return (CFStringRef)MEMORY[0x1E0C99018](alloc, formatOptions, format);
}

Boolean CFStringGetCString(CFStringRef theString, char *buffer, CFIndex bufferSize, CFStringEncoding encoding)
{
  return MEMORY[0x1E0C99098](theString, buffer, bufferSize, *(_QWORD *)&encoding);
}

CFIndex CFStringGetLength(CFStringRef theString)
{
  return MEMORY[0x1E0C99100](theString);
}

CFIndex CFStringGetMaximumSizeForEncoding(CFIndex length, CFStringEncoding encoding)
{
  return MEMORY[0x1E0C99118](length, *(_QWORD *)&encoding);
}

CFTypeID CFStringGetTypeID(void)
{
  return MEMORY[0x1E0C99170]();
}

kern_return_t IOObjectRelease(io_object_t object)
{
  return MEMORY[0x1E0CBB6F0](*(_QWORD *)&object);
}

CFTypeRef IORegistryEntryCreateCFProperty(io_registry_entry_t entry, CFStringRef key, CFAllocatorRef allocator, IOOptionBits options)
{
  return (CFTypeRef)MEMORY[0x1E0CBB900](*(_QWORD *)&entry, key, allocator, *(_QWORD *)&options);
}

io_registry_entry_t IORegistryEntryFromPath(mach_port_t mainPort, const io_string_t path)
{
  return MEMORY[0x1E0CBB918](*(_QWORD *)&mainPort, path);
}

uint64_t MGGetBoolAnswer()
{
  return MEMORY[0x1E0DE2B50]();
}

void NSLog(NSString *format, ...)
{
  MEMORY[0x1E0CB2D88](format);
}

NSString *__cdecl NSStringFromClass(Class aClass)
{
  return (NSString *)MEMORY[0x1E0CB3200](aClass);
}

void _Block_object_dispose(const void *a1, const int a2)
{
  MEMORY[0x1E0C80948](a1, *(_QWORD *)&a2);
}

uint64_t _CFXPCCreateXPCObjectFromCFObject()
{
  return MEMORY[0x1E0C9A818]();
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
  MEMORY[0x1E0C80A20](exception_object);
}

int *__error(void)
{
  return (int *)MEMORY[0x1E0C80AC0]();
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

void abort(void)
{
  MEMORY[0x1E0C813A8]();
}

__uint64_t clock_gettime_nsec_np(clockid_t __clock_id)
{
  return MEMORY[0x1E0C82670](*(_QWORD *)&__clock_id);
}

int close(int a1)
{
  return MEMORY[0x1E0C82688](*(_QWORD *)&a1);
}

void dispatch_after(dispatch_time_t when, dispatch_queue_t queue, dispatch_block_t block)
{
  MEMORY[0x1E0C82BC8](when, queue, block);
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

dispatch_group_t dispatch_group_create(void)
{
  return (dispatch_group_t)MEMORY[0x1E0C82D20]();
}

void dispatch_group_enter(dispatch_group_t group)
{
  MEMORY[0x1E0C82D28](group);
}

void dispatch_group_leave(dispatch_group_t group)
{
  MEMORY[0x1E0C82D30](group);
}

intptr_t dispatch_group_wait(dispatch_group_t group, dispatch_time_t timeout)
{
  return MEMORY[0x1E0C82D48](group, timeout);
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
  MEMORY[0x1E0C82E08](predicate, block);
}

dispatch_queue_attr_t dispatch_queue_attr_make_with_autorelease_frequency(dispatch_queue_attr_t attr, dispatch_autorelease_frequency_t frequency)
{
  return (dispatch_queue_attr_t)MEMORY[0x1E0C82E28](attr, frequency);
}

dispatch_queue_t dispatch_queue_create(const char *label, dispatch_queue_attr_t attr)
{
  return (dispatch_queue_t)MEMORY[0x1E0C82E48](label, attr);
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

dispatch_time_t dispatch_time(dispatch_time_t when, int64_t delta)
{
  return MEMORY[0x1E0C82FB8](when, delta);
}

void free(void *a1)
{
  MEMORY[0x1E0C834A8](a1);
}

int fsctl(const char *a1, unint64_t a2, void *a3, unsigned int a4)
{
  return MEMORY[0x1E0C83528](a1, a2, a3, *(_QWORD *)&a4);
}

pid_t getpid(void)
{
  return MEMORY[0x1E0C83760]();
}

const char *getprogname(void)
{
  return (const char *)MEMORY[0x1E0C83778]();
}

void *__cdecl malloc_type_calloc(size_t count, size_t size, malloc_type_id_t type_id)
{
  return (void *)MEMORY[0x1E0C83EF8](count, size, type_id);
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

void objc_moveWeak(id *to, id *from)
{
  MEMORY[0x1E0DE7D18](to, from);
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

id objc_unsafeClaimAutoreleasedReturnValue(id a1)
{
  return (id)MEMORY[0x1E0DE7FE0](a1);
}

int open(const char *a1, int a2, ...)
{
  return MEMORY[0x1E0C84480](a1, *(_QWORD *)&a2);
}

os_log_t os_log_create(const char *subsystem, const char *category)
{
  return (os_log_t)MEMORY[0x1E0C84728](subsystem, category);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x1E0C84780](oslog, type);
}

char *__cdecl realpath_DARWIN_EXTSN(const char *a1, char *a2)
{
  return (char *)MEMORY[0x1E0C85040](a1, a2);
}

uint64_t sandbox_extension_consume()
{
  return MEMORY[0x1E0C851A0]();
}

int snprintf(char *__str, size_t __size, const char *__format, ...)
{
  return MEMORY[0x1E0C85440](__str, __size, __format);
}

char *__cdecl strerror(int __errnum)
{
  return (char *)MEMORY[0x1E0C85548](*(_QWORD *)&__errnum);
}

void xpc_connection_activate(xpc_connection_t connection)
{
  MEMORY[0x1E0C85F50](connection);
}

xpc_connection_t xpc_connection_create_mach_service(const char *name, dispatch_queue_t targetq, uint64_t flags)
{
  return (xpc_connection_t)MEMORY[0x1E0C85FB0](name, targetq, flags);
}

void xpc_connection_send_message_with_reply(xpc_connection_t connection, xpc_object_t message, dispatch_queue_t replyq, xpc_handler_t handler)
{
  MEMORY[0x1E0C86038](connection, message, replyq, handler);
}

xpc_object_t xpc_connection_send_message_with_reply_sync(xpc_connection_t connection, xpc_object_t message)
{
  return (xpc_object_t)MEMORY[0x1E0C86048](connection, message);
}

void xpc_connection_set_event_handler(xpc_connection_t connection, xpc_handler_t handler)
{
  MEMORY[0x1E0C86080](connection, handler);
}

xpc_object_t xpc_dictionary_create(const char *const *keys, xpc_object_t *values, size_t count)
{
  return (xpc_object_t)MEMORY[0x1E0C86208](keys, values, count);
}

BOOL xpc_dictionary_get_BOOL(xpc_object_t xdict, const char *key)
{
  return MEMORY[0x1E0C86260](xdict, key);
}

const void *__cdecl xpc_dictionary_get_data(xpc_object_t xdict, const char *key, size_t *length)
{
  return (const void *)MEMORY[0x1E0C86278](xdict, key, length);
}

double xpc_dictionary_get_double(xpc_object_t xdict, const char *key)
{
  double result;

  MEMORY[0x1E0C86298](xdict, key);
  return result;
}

int64_t xpc_dictionary_get_int64(xpc_object_t xdict, const char *key)
{
  return MEMORY[0x1E0C862A0](xdict, key);
}

const char *__cdecl xpc_dictionary_get_string(xpc_object_t xdict, const char *key)
{
  return (const char *)MEMORY[0x1E0C862C8](xdict, key);
}

void xpc_dictionary_set_BOOL(xpc_object_t xdict, const char *key, BOOL value)
{
  MEMORY[0x1E0C86310](xdict, key, value);
}

void xpc_dictionary_set_data(xpc_object_t xdict, const char *key, const void *bytes, size_t length)
{
  MEMORY[0x1E0C86330](xdict, key, bytes, length);
}

void xpc_dictionary_set_double(xpc_object_t xdict, const char *key, double value)
{
  MEMORY[0x1E0C86348](xdict, key, value);
}

void xpc_dictionary_set_int64(xpc_object_t xdict, const char *key, int64_t value)
{
  MEMORY[0x1E0C86360](xdict, key, value);
}

void xpc_dictionary_set_string(xpc_object_t xdict, const char *key, const char *string)
{
  MEMORY[0x1E0C86390](xdict, key, string);
}

void xpc_dictionary_set_uint64(xpc_object_t xdict, const char *key, uint64_t value)
{
  MEMORY[0x1E0C86398](xdict, key, value);
}

void xpc_dictionary_set_value(xpc_object_t xdict, const char *key, xpc_object_t value)
{
  MEMORY[0x1E0C863B8](xdict, key, value);
}

xpc_type_t xpc_get_type(xpc_object_t object)
{
  return (xpc_type_t)MEMORY[0x1E0C86520](object);
}

