void sub_1D3AB16F4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

id DPLogHandle_ConfigMonitor()
{
  if (DPLogHandle_ConfigMonitor_onceToken != -1)
    dispatch_once(&DPLogHandle_ConfigMonitor_onceToken, &__block_literal_global_100);
  return (id)DPLogHandle_ConfigMonitor_handle;
}

void sub_1D3AB1C1C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1D3AB1EB4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  id *v14;

  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

id DPLogHandle_ConfigMonitorError()
{
  if (DPLogHandle_ConfigMonitorError_onceToken != -1)
    dispatch_once(&DPLogHandle_ConfigMonitorError_onceToken, &__block_literal_global_102);
  return (id)DPLogHandle_ConfigMonitorError_handle;
}

uint64_t DRValidateCKRecordDictionary(void *a1, _QWORD *a2)
{
  id v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  uint64_t v9;
  void *v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t j;
  uint64_t v16;
  void *v17;
  void *v18;
  objc_class *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v25;
  void *v26;
  objc_class *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  uint64_t v32;
  _QWORD *v33;
  void *v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  uint64_t v43;
  void *v44;
  uint64_t v45;
  void *v46;
  _BYTE v47[128];
  uint64_t v48;
  const __CFString *v49;
  _BYTE v50[128];
  uint64_t v51;
  _QWORD v52[3];

  v52[1] = *MEMORY[0x1E0C80C00];
  v3 = a1;
  if (!objc_msgSend(v3, "count"))
  {
    if (a2)
    {
      v17 = (void *)MEMORY[0x1E0CB35C8];
      v51 = *MEMORY[0x1E0CB2D50];
      v52[0] = CFSTR("'recordDictionary' is nil or empty");
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v52, &v51, 1);
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "errorWithDomain:code:userInfo:", CFSTR("MalformedCKRecordDictionaryError"), 0, v4);
      v16 = 0;
      *a2 = (id)objc_claimAutoreleasedReturnValue();
      goto LABEL_30;
    }
    v16 = 0;
    goto LABEL_31;
  }
  v41 = 0u;
  v42 = 0u;
  v39 = 0u;
  v40 = 0u;
  objc_msgSend(v3, "allKeys");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v39, v50, 16);
  if (!v5)
  {
    v16 = 1;
    goto LABEL_30;
  }
  v6 = v5;
  v33 = a2;
  v34 = v4;
  v7 = *(_QWORD *)v40;
  v32 = *(_QWORD *)v40;
  while (2)
  {
    for (i = 0; i != v6; ++i)
    {
      if (*(_QWORD *)v40 != v7)
        objc_enumerationMutation(v4);
      v9 = *(_QWORD *)(*((_QWORD *)&v39 + 1) + 8 * i);
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        if (v33)
        {
          v25 = (void *)MEMORY[0x1E0CB35C8];
          v48 = *MEMORY[0x1E0CB2D50];
          v49 = CFSTR("'recordDictionary' has a non-NSString key");
          objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v49, &v48, 1);
          v11 = (id)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v25, "errorWithDomain:code:userInfo:", CFSTR("MalformedCKRecordDictionaryError"), 0, v11);
          *v33 = (id)objc_claimAutoreleasedReturnValue();
          goto LABEL_27;
        }
LABEL_28:
        v16 = 0;
        goto LABEL_30;
      }
      objc_msgSend(v3, "objectForKeyedSubscript:", v9);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      if ((_isSupportedRecordDictionaryValueType(v10) & 1) != 0)
        goto LABEL_19;
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        if (v33)
        {
          v26 = (void *)MEMORY[0x1E0CB3940];
          v27 = (objc_class *)objc_opt_class();
          NSStringFromClass(v27);
          v28 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v26, "stringWithFormat:", CFSTR("'recordDictionary' value of type '%@' for key '%@' is not allowed"), v28, v9);
          v29 = (void *)objc_claimAutoreleasedReturnValue();

          v30 = (void *)MEMORY[0x1E0CB35C8];
          v43 = *MEMORY[0x1E0CB2D50];
          v44 = v29;
          objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v44, &v43, 1);
          v31 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v30, "errorWithDomain:code:userInfo:", CFSTR("MalformedCKRecordDictionaryError"), 0, v31);
          *v33 = (id)objc_claimAutoreleasedReturnValue();

        }
        v11 = v10;
LABEL_27:

        goto LABEL_28;
      }
      v37 = 0u;
      v38 = 0u;
      v35 = 0u;
      v36 = 0u;
      v11 = v10;
      v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v35, v47, 16);
      if (v12)
      {
        v13 = v12;
        v14 = *(_QWORD *)v36;
        while (2)
        {
          for (j = 0; j != v13; ++j)
          {
            if (*(_QWORD *)v36 != v14)
              objc_enumerationMutation(v11);
            if ((_isSupportedRecordDictionaryValueType(*(void **)(*((_QWORD *)&v35 + 1) + 8 * j)) & 1) == 0)
            {
              if (v33)
              {
                v18 = (void *)MEMORY[0x1E0CB3940];
                v19 = (objc_class *)objc_opt_class();
                NSStringFromClass(v19);
                v20 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v18, "stringWithFormat:", CFSTR("'recordDictionary' value of type '%@' for array with key '%@' is not allowed"), v20, v9);
                v21 = (void *)objc_claimAutoreleasedReturnValue();

                v22 = (void *)MEMORY[0x1E0CB35C8];
                v45 = *MEMORY[0x1E0CB2D50];
                v46 = v21;
                objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v46, &v45, 1);
                v23 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v22, "errorWithDomain:code:userInfo:", CFSTR("MalformedCKRecordDictionaryError"), 0, v23);
                *v33 = (id)objc_claimAutoreleasedReturnValue();

              }
              v4 = v34;
              goto LABEL_27;
            }
          }
          v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v35, v47, 16);
          if (v13)
            continue;
          break;
        }
      }

      v4 = v34;
      v7 = v32;
LABEL_19:

    }
    v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v39, v50, 16);
    v16 = 1;
    if (v6)
      continue;
    break;
  }
LABEL_30:

LABEL_31:
  return v16;
}

uint64_t _isSupportedRecordDictionaryValueType(void *a1)
{
  id v1;
  char isKindOfClass;

  v1 = a1;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0
    || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
    || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    isKindOfClass = 1;
  }
  else
  {
    objc_opt_class();
    isKindOfClass = objc_opt_isKindOfClass();
  }

  return isKindOfClass & 1;
}

void _DRCTaskingConnectionStateFinalizer(void *a1)
{
  NSObject *v2;

  DPLogHandle_ClientXPC();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
    _DRCTaskingConnectionStateFinalizer_cold_1(v2);

  if (a1)
    objc_msgSend(a1, "cleanupState");
}

void sub_1D3AB3074(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t _DPCSendTaskingSystemJSONDataMessage(void *a1, BOOL a2, _QWORD *a3)
{
  id v5;
  xpc_object_t v6;
  id v7;
  const void *v8;
  size_t v9;
  void *v10;
  void *v11;
  const char *string;
  const char *v13;
  NSObject *v14;
  void *v15;
  uint64_t v16;
  NSObject *v17;
  void *v18;
  uint64_t v19;
  NSObject *v20;
  void *v21;
  uint64_t v22;
  uint64_t v24;
  const __CFString *v25;
  uint64_t v26;
  NSObject *v27;
  uint8_t buf[4];
  const char *v29;
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  v5 = a1;
  v6 = xpc_dictionary_create(0, 0, 0);
  xpc_dictionary_set_uint64(v6, "TaskingClientMessageType", 1uLL);
  v7 = objc_retainAutorelease(v5);
  v8 = (const void *)objc_msgSend(v7, "bytes");
  v9 = objc_msgSend(v7, "length");

  xpc_dictionary_set_data(v6, "JSONData", v8, v9);
  xpc_dictionary_set_BOOL(v6, "emitCATelemetry", a2);
  _replyObjectForRequestMessage(v6, a3);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = v10;
  if (v10)
  {
    if (xpc_dictionary_get_uint64(v10, "TaskingServiceReplyType") == 1)
    {
      string = xpc_dictionary_get_string(v11, "TaskingAdminRequest_RejectionReason");
      if (!string)
      {
        DPLogHandle_ClientTaskingXPC();
        v17 = objc_claimAutoreleasedReturnValue();
        if (os_signpost_enabled(v17))
        {
          *(_WORD *)buf = 0;
          _os_signpost_emit_with_name_impl(&dword_1D3AB0000, v17, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "JSONMessageRequestSucceeded", (const char *)&unk_1D3AC206D, buf, 2u);
        }
        v19 = 1;
        goto LABEL_16;
      }
      v13 = string;
      DPLogHandle_ClientTaskingXPCError();
      v14 = objc_claimAutoreleasedReturnValue();
      if (os_signpost_enabled(v14))
      {
        *(_DWORD *)buf = 136446210;
        v29 = v13;
        _os_signpost_emit_with_name_impl(&dword_1D3AB0000, v14, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "JSONMessageRequestFailed", "Failed due to reason: %{public}s", buf, 0xCu);
      }

      if (a3)
      {
        v15 = (void *)MEMORY[0x1E0CB35C8];
        v16 = kDRTaskingClientError;
        v26 = *MEMORY[0x1E0CB2D50];
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", v13);
        v17 = objc_claimAutoreleasedReturnValue();
        v27 = v17;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v27, &v26, 1);
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "errorWithDomain:code:userInfo:", v16, 0, v18);
        *a3 = (id)objc_claimAutoreleasedReturnValue();

        v19 = 0;
LABEL_16:

        goto LABEL_17;
      }
    }
    else
    {
      DPLogHandle_ClientTaskingXPCError();
      v20 = objc_claimAutoreleasedReturnValue();
      if (os_signpost_enabled(v20))
      {
        *(_WORD *)buf = 0;
        _os_signpost_emit_with_name_impl(&dword_1D3AB0000, v20, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "InvalidJSONMessageReply", "Received an invalid reply for a JSON message from the tasking service", buf, 2u);
      }

      if (a3)
      {
        v21 = (void *)MEMORY[0x1E0CB35C8];
        v22 = kDRTaskingClientError;
        v24 = *MEMORY[0x1E0CB2D50];
        v25 = CFSTR("Invalid tasking service reply");
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v25, &v24, 1);
        v17 = objc_claimAutoreleasedReturnValue();
        objc_msgSend(v21, "errorWithDomain:code:userInfo:", v22, 0, v17);
        v19 = 0;
        *a3 = (id)objc_claimAutoreleasedReturnValue();
        goto LABEL_16;
      }
    }
  }
  v19 = 0;
LABEL_17:

  return v19;
}

_QWORD *_replyObjectForRequestMessage(void *a1, _QWORD *a2)
{
  id v3;
  void *v4;
  void *v5;
  NSObject *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  uint8_t v11[8];
  uint64_t v12;
  _QWORD v13[2];

  v13[1] = *MEMORY[0x1E0C80C00];
  v3 = a1;
  +[_DRCTaskingConnectionState sharedConnectionState](_DRCTaskingConnectionState, "sharedConnectionState");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "sendMessageWithReplySync:", v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5 && MEMORY[0x1D8251448](v5) == MEMORY[0x1E0C812F8])
  {
    a2 = v5;
  }
  else
  {
    DPLogHandle_ClientTaskingXPCError();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_signpost_enabled(v6))
    {
      *(_WORD *)v11 = 0;
      _os_signpost_emit_with_name_impl(&dword_1D3AB0000, v6, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "InvalidTaskingServiceReply", "Invalid message type from tasking service. May be an invalid/closed connection", v11, 2u);
    }

    if (a2)
    {
      v7 = (void *)MEMORY[0x1E0CB35C8];
      v8 = kDRTaskingClientError;
      v12 = *MEMORY[0x1E0CB2D50];
      v13[0] = CFSTR("Invalid tasking service reply");
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v13, &v12, 1);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "errorWithDomain:code:userInfo:", v8, 0, v9);
      *a2 = (id)objc_claimAutoreleasedReturnValue();

      a2 = 0;
    }
  }

  return a2;
}

uint64_t _DPCGetConfigStateForUUID(void *a1, void *a2, uint64_t *a3, _QWORD *a4)
{
  id v7;
  id v8;
  xpc_object_t v9;
  id v10;
  const char *v11;
  void *v12;
  id v13;
  void *v14;
  void *v15;
  const char *string;
  const char *v17;
  NSObject *v18;
  void *v19;
  uint64_t v20;
  void *v21;
  void *v22;
  char *v23;
  NSObject *v24;
  void *v25;
  uint64_t v26;
  void *v27;
  uint64_t v29;
  const __CFString *v30;
  uint64_t v31;
  void *v32;
  uint8_t buf[4];
  const char *v34;
  uint64_t v35;

  v35 = *MEMORY[0x1E0C80C00];
  v7 = a2;
  v8 = a1;
  v9 = xpc_dictionary_create(0, 0, 0);
  xpc_dictionary_set_uint64(v9, "TaskingClientMessageType", 2uLL);
  v10 = objc_retainAutorelease(v8);
  v11 = (const char *)objc_msgSend(v10, "UTF8String");

  xpc_dictionary_set_string(v9, "teamID", v11);
  objc_msgSend(v7, "UUIDString");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  v13 = objc_retainAutorelease(v12);
  xpc_dictionary_set_string(v9, "configUUID", (const char *)objc_msgSend(v13, "UTF8String"));

  *a3 = 0;
  _replyObjectForRequestMessage(v9, a4);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = v14;
  if (!v14)
    goto LABEL_14;
  if (xpc_dictionary_get_uint64(v14, "TaskingServiceReplyType") == 2)
  {
    string = xpc_dictionary_get_string(v15, "TaskingAdminRequest_RejectionReason");
    if (!string)
    {
      *a3 = xpc_dictionary_get_uint64(v15, "completionType");
      LOBYTE(a4) = xpc_dictionary_get_uint64(v15, "configState");
      goto LABEL_15;
    }
    v17 = string;
    DPLogHandle_ClientTaskingXPCError();
    v18 = objc_claimAutoreleasedReturnValue();
    if (os_signpost_enabled(v18))
    {
      *(_DWORD *)buf = 136446210;
      v34 = v17;
      _os_signpost_emit_with_name_impl(&dword_1D3AB0000, v18, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "ConfigStateQueryFailed", "Failed due to reason: %{public}s", buf, 0xCu);
    }

    if (a4)
    {
      v19 = (void *)MEMORY[0x1E0CB35C8];
      v20 = kDRTaskingClientError;
      v31 = *MEMORY[0x1E0CB2D50];
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", v17);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v32 = v21;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v32, &v31, 1);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "errorWithDomain:code:userInfo:", v20, 0, v22);
      *a4 = (id)objc_claimAutoreleasedReturnValue();

LABEL_14:
      LOBYTE(a4) = 0;
    }
  }
  else
  {
    v23 = (char *)MEMORY[0x1D82513A0](v15);
    DPLogHandle_ClientTaskingXPCError();
    v24 = objc_claimAutoreleasedReturnValue();
    if (os_signpost_enabled(v24))
    {
      *(_DWORD *)buf = 136446210;
      v34 = v23;
      _os_signpost_emit_with_name_impl(&dword_1D3AB0000, v24, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "InvalidGetConfigStateReply", "Received an invalid reply a config state request from the tasking service: %{public}s", buf, 0xCu);
    }

    if (v23)
      free(v23);
    if (a4)
    {
      v25 = (void *)MEMORY[0x1E0CB35C8];
      v26 = kDRTaskingClientError;
      v29 = *MEMORY[0x1E0CB2D50];
      v30 = CFSTR("Invalid tasking service reply");
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v30, &v29, 1);
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v25, "errorWithDomain:code:userInfo:", v26, 0, v27);
      *a4 = (id)objc_claimAutoreleasedReturnValue();

      goto LABEL_14;
    }
  }
LABEL_15:

  return a4;
}

uint64_t _DPCSendClearTaskingStateMessage(_QWORD *a1)
{
  xpc_object_t v2;
  void *v3;
  void *v4;
  const char *string;
  const char *v6;
  NSObject *v7;
  void *v8;
  uint64_t v9;
  NSObject *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  void *v15;
  const __CFString **v16;
  uint64_t *v17;
  NSObject *v18;
  uint64_t v20;
  const __CFString *v21;
  uint64_t v22;
  NSObject *v23;
  uint8_t buf[4];
  const char *v25;
  uint64_t v26;
  _QWORD v27[2];

  v27[1] = *MEMORY[0x1E0C80C00];
  v2 = xpc_dictionary_create(0, 0, 0);
  xpc_dictionary_set_uint64(v2, "TaskingClientMessageType", 3uLL);
  _replyObjectForRequestMessage(v2, a1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (!v3)
  {
    if (!a1)
      goto LABEL_15;
    v13 = (void *)MEMORY[0x1E0CB35C8];
    v14 = kDRTaskingClientError;
    v26 = *MEMORY[0x1E0CB2D50];
    v27[0] = CFSTR("Invalid tasking service reply");
    v15 = (void *)MEMORY[0x1E0C99D80];
    v16 = (const __CFString **)v27;
    v17 = &v26;
LABEL_14:
    objc_msgSend(v15, "dictionaryWithObjects:forKeys:count:", v16, v17, 1, v20, v21);
    v10 = objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "errorWithDomain:code:userInfo:", v14, 0, v10);
    v12 = 0;
    *a1 = (id)objc_claimAutoreleasedReturnValue();
    goto LABEL_19;
  }
  if (xpc_dictionary_get_uint64(v3, "TaskingServiceReplyType") != 3)
  {
    DPLogHandle_ClientTaskingXPCError();
    v18 = objc_claimAutoreleasedReturnValue();
    if (os_signpost_enabled(v18))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_1D3AB0000, v18, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "InvalidClearTaskingStateMessageReply", "Received an invalid reply for a clear tasking state message from the tasking service", buf, 2u);
    }

    if (!a1)
      goto LABEL_15;
    v13 = (void *)MEMORY[0x1E0CB35C8];
    v14 = kDRTaskingClientError;
    v20 = *MEMORY[0x1E0CB2D50];
    v21 = CFSTR("Invalid tasking service reply");
    v15 = (void *)MEMORY[0x1E0C99D80];
    v16 = &v21;
    v17 = &v20;
    goto LABEL_14;
  }
  string = xpc_dictionary_get_string(v4, "TaskingAdminRequest_RejectionReason");
  if (!string)
  {
    DPLogHandle_ClientTaskingXPC();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_signpost_enabled(v10))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_1D3AB0000, v10, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "ClearTaskingStateRequestSucceeded", (const char *)&unk_1D3AC206D, buf, 2u);
    }
    v12 = 1;
    goto LABEL_19;
  }
  v6 = string;
  DPLogHandle_ClientTaskingXPCError();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_signpost_enabled(v7))
  {
    *(_DWORD *)buf = 136446210;
    v25 = v6;
    _os_signpost_emit_with_name_impl(&dword_1D3AB0000, v7, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "ClearTaskingStateRequestFailed", "Failed due to reason: %{public}s", buf, 0xCu);
  }

  if (a1)
  {
    v8 = (void *)MEMORY[0x1E0CB35C8];
    v9 = kDRTaskingClientError;
    v22 = *MEMORY[0x1E0CB2D50];
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", v6);
    v10 = objc_claimAutoreleasedReturnValue();
    v23 = v10;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v23, &v22, 1);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "errorWithDomain:code:userInfo:", v9, 0, v11);
    *a1 = (id)objc_claimAutoreleasedReturnValue();

    v12 = 0;
LABEL_19:

    goto LABEL_20;
  }
LABEL_15:
  v12 = 0;
LABEL_20:

  return v12;
}

uint64_t _DPCMarkConfigUUIDCompletedOrRejected(void *a1, void *a2, int a3, _QWORD *a4)
{
  id v7;
  id v8;
  xpc_object_t v9;
  id v10;
  const char *v11;
  id v12;
  void *v13;
  void *v14;
  const char *string;
  const char *v16;
  NSObject *v17;
  const __CFString *v18;
  void *v19;
  uint64_t v20;
  NSObject *v21;
  void *v22;
  uint64_t v23;
  void *v24;
  uint64_t v25;
  void *v26;
  const __CFString **v27;
  uint64_t *v28;
  NSObject *v29;
  const __CFString *v30;
  const __CFString *v31;
  uint64_t v33;
  const __CFString *v34;
  uint64_t v35;
  NSObject *v36;
  uint8_t buf[4];
  id v38;
  __int16 v39;
  const __CFString *v40;
  __int16 v41;
  const char *v42;
  uint64_t v43;
  _QWORD v44[2];

  v44[1] = *MEMORY[0x1E0C80C00];
  v7 = a2;
  v8 = a1;
  v9 = xpc_dictionary_create(0, 0, 0);
  xpc_dictionary_set_uint64(v9, "TaskingClientMessageType", 4uLL);
  v10 = objc_retainAutorelease(v8);
  v11 = (const char *)objc_msgSend(v10, "UTF8String");

  xpc_dictionary_set_string(v9, "teamID", v11);
  objc_msgSend(v7, "UUIDString");
  v12 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  xpc_dictionary_set_string(v9, "configUUID", (const char *)objc_msgSend(v12, "UTF8String"));

  if (a3)
    xpc_dictionary_set_BOOL(v9, "isRejected", 1);
  _replyObjectForRequestMessage(v9, a4);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = v13;
  if (!v13)
  {
    if (!a4)
      goto LABEL_21;
    v24 = (void *)MEMORY[0x1E0CB35C8];
    v25 = kDRTaskingClientError;
    v43 = *MEMORY[0x1E0CB2D50];
    v44[0] = CFSTR("Invalid tasking service reply");
    v26 = (void *)MEMORY[0x1E0C99D80];
    v27 = (const __CFString **)v44;
    v28 = &v43;
LABEL_20:
    objc_msgSend(v26, "dictionaryWithObjects:forKeys:count:", v27, v28, 1, v33, v34);
    v21 = objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "errorWithDomain:code:userInfo:", v25, 0, v21);
    v23 = 0;
    *a4 = (id)objc_claimAutoreleasedReturnValue();
    goto LABEL_27;
  }
  if (xpc_dictionary_get_uint64(v13, "TaskingServiceReplyType") != 4)
  {
    DPLogHandle_ClientTaskingXPCError();
    v29 = objc_claimAutoreleasedReturnValue();
    if (os_signpost_enabled(v29))
    {
      v30 = CFSTR("completed");
      if (a3)
        v30 = CFSTR("rejected");
      *(_DWORD *)buf = 138543618;
      v38 = v7;
      v39 = 2114;
      v40 = v30;
      _os_signpost_emit_with_name_impl(&dword_1D3AB0000, v29, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "InvalidConfigCompletionMessageReply", "Received an invalid reply for marking config %{public}@ %{public}@ message from the tasking service", buf, 0x16u);
    }

    if (!a4)
      goto LABEL_21;
    v24 = (void *)MEMORY[0x1E0CB35C8];
    v25 = kDRTaskingClientError;
    v33 = *MEMORY[0x1E0CB2D50];
    v34 = CFSTR("Invalid tasking service reply");
    v26 = (void *)MEMORY[0x1E0C99D80];
    v27 = &v34;
    v28 = &v33;
    goto LABEL_20;
  }
  string = xpc_dictionary_get_string(v14, "TaskingAdminRequest_RejectionReason");
  if (!string)
  {
    DPLogHandle_ClientTaskingXPC();
    v21 = objc_claimAutoreleasedReturnValue();
    if (os_signpost_enabled(v21))
    {
      v31 = CFSTR("completed");
      if (a3)
        v31 = CFSTR("rejected");
      *(_DWORD *)buf = 138543618;
      v38 = v7;
      v39 = 2114;
      v40 = v31;
      _os_signpost_emit_with_name_impl(&dword_1D3AB0000, v21, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "ConfigCompletionSucceeded", "Config %{public}@ marked %{public}@", buf, 0x16u);
    }
    v23 = 1;
    goto LABEL_27;
  }
  v16 = string;
  DPLogHandle_ClientTaskingXPCError();
  v17 = objc_claimAutoreleasedReturnValue();
  if (os_signpost_enabled(v17))
  {
    v18 = CFSTR("completed");
    *(_DWORD *)buf = 138543874;
    v38 = v7;
    if (a3)
      v18 = CFSTR("rejected");
    v39 = 2114;
    v40 = v18;
    v41 = 2082;
    v42 = v16;
    _os_signpost_emit_with_name_impl(&dword_1D3AB0000, v17, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "ConfigCompletionFailed", "Failed to mark config %{public}@ %{public}@ due to reason: %{public}s", buf, 0x20u);
  }

  if (a4)
  {
    v19 = (void *)MEMORY[0x1E0CB35C8];
    v20 = kDRTaskingClientError;
    v35 = *MEMORY[0x1E0CB2D50];
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", v16);
    v21 = objc_claimAutoreleasedReturnValue();
    v36 = v21;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v36, &v35, 1);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "errorWithDomain:code:userInfo:", v20, 0, v22);
    *a4 = (id)objc_claimAutoreleasedReturnValue();

    v23 = 0;
LABEL_27:

    goto LABEL_28;
  }
LABEL_21:
  v23 = 0;
LABEL_28:

  return v23;
}

uint64_t _DPCRequestTeamIDBroadcast(void *a1, _QWORD *a2)
{
  id v3;
  xpc_object_t v4;
  id v5;
  const char *v6;
  void *v7;
  void *v8;
  const char *string;
  const char *v10;
  NSObject *v11;
  void *v12;
  uint64_t v13;
  NSObject *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  uint64_t v18;
  void *v19;
  const __CFString **v20;
  uint64_t *v21;
  NSObject *v22;
  uint64_t v24;
  const __CFString *v25;
  uint64_t v26;
  NSObject *v27;
  uint8_t buf[4];
  const char *v29;
  uint64_t v30;
  _QWORD v31[2];

  v31[1] = *MEMORY[0x1E0C80C00];
  if (a2)
    *a2 = 0;
  v3 = a1;
  v4 = xpc_dictionary_create(0, 0, 0);
  xpc_dictionary_set_uint64(v4, "TaskingClientMessageType", 5uLL);
  v5 = objc_retainAutorelease(v3);
  v6 = (const char *)objc_msgSend(v5, "UTF8String");

  xpc_dictionary_set_string(v4, "teamID", v6);
  _replyObjectForRequestMessage(v4, a2);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (!v7)
  {
    if (!a2)
      goto LABEL_17;
    v17 = (void *)MEMORY[0x1E0CB35C8];
    v18 = kDRTaskingClientError;
    v30 = *MEMORY[0x1E0CB2D50];
    v31[0] = CFSTR("Invalid tasking service reply");
    v19 = (void *)MEMORY[0x1E0C99D80];
    v20 = (const __CFString **)v31;
    v21 = &v30;
LABEL_16:
    objc_msgSend(v19, "dictionaryWithObjects:forKeys:count:", v20, v21, 1, v24, v25);
    v14 = objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "errorWithDomain:code:userInfo:", v18, 0, v14);
    v16 = 0;
    *a2 = (id)objc_claimAutoreleasedReturnValue();
    goto LABEL_21;
  }
  if (xpc_dictionary_get_uint64(v7, "TaskingServiceReplyType") != 5)
  {
    DPLogHandle_ClientTaskingXPCError();
    v22 = objc_claimAutoreleasedReturnValue();
    if (os_signpost_enabled(v22))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_1D3AB0000, v22, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "InvalidBroadcastRequestMessageReply", "Received an invalid reply for a broadcast request message from the tasking service", buf, 2u);
    }

    if (!a2)
      goto LABEL_17;
    v17 = (void *)MEMORY[0x1E0CB35C8];
    v18 = kDRTaskingClientError;
    v24 = *MEMORY[0x1E0CB2D50];
    v25 = CFSTR("Invalid tasking service reply");
    v19 = (void *)MEMORY[0x1E0C99D80];
    v20 = &v25;
    v21 = &v24;
    goto LABEL_16;
  }
  string = xpc_dictionary_get_string(v8, "TaskingAdminRequest_RejectionReason");
  if (!string)
  {
    DPLogHandle_ClientTaskingXPC();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_signpost_enabled(v14))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_1D3AB0000, v14, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "BroadcastRequestSucceeded", (const char *)&unk_1D3AC206D, buf, 2u);
    }
    v16 = 1;
    goto LABEL_21;
  }
  v10 = string;
  DPLogHandle_ClientTaskingXPCError();
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_signpost_enabled(v11))
  {
    *(_DWORD *)buf = 136446210;
    v29 = v10;
    _os_signpost_emit_with_name_impl(&dword_1D3AB0000, v11, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "BroadcastRequestFailed", "Failed due to reason: %{public}s", buf, 0xCu);
  }

  if (a2)
  {
    v12 = (void *)MEMORY[0x1E0CB35C8];
    v13 = kDRTaskingClientError;
    v26 = *MEMORY[0x1E0CB2D50];
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", v10);
    v14 = objc_claimAutoreleasedReturnValue();
    v27 = v14;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v27, &v26, 1);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "errorWithDomain:code:userInfo:", v13, 0, v15);
    *a2 = (id)objc_claimAutoreleasedReturnValue();

    v16 = 0;
LABEL_21:

    goto LABEL_22;
  }
LABEL_17:
  v16 = 0;
LABEL_22:

  return v16;
}

char *_DPCGetCloudChannelConfig(BOOL *a1, _BYTE *a2, _BYTE *a3, _BYTE *a4, BOOL *a5, BOOL *a6, _QWORD *a7, char *a8)
{
  char *v8;
  xpc_object_t v16;
  void *v17;
  uint64_t uint64;
  const char *string;
  const char *v20;
  NSObject *v21;
  void *v22;
  uint64_t v23;
  void *v24;
  void *v25;
  xpc_object_t v26;
  void *v27;
  uint64_t v28;
  void *v29;
  void *v30;
  NSObject *v31;
  void *v32;
  uint64_t v33;
  void *v34;
  const __CFString **v35;
  uint64_t *v36;
  void *v37;
  const char *v39;
  NSObject *v40;
  void *v41;
  xpc_object_t v42;
  uint64_t v43;
  const __CFString *v44;
  uint64_t v45;
  void *v46;
  uint8_t buf[4];
  const char *v48;
  uint64_t v49;
  const __CFString *v50;
  uint64_t v51;
  _QWORD v52[2];

  v8 = a8;
  v52[1] = *MEMORY[0x1E0C80C00];
  if (a8)
    *(_QWORD *)a8 = 0;
  *a1 = 0;
  *a2 = 0;
  *a3 = 0;
  *a4 = 0;
  *a6 = 0;
  *a7 = 0;
  *a5 = 0;
  v16 = xpc_dictionary_create(0, 0, 0);
  xpc_dictionary_set_uint64(v16, "TaskingClientMessageType", 6uLL);
  _replyObjectForRequestMessage(v16, v8);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  uint64 = xpc_dictionary_get_uint64(v17, "TaskingServiceReplyType");
  if (v17)
  {
    v42 = v16;
    if (uint64 == 6)
    {
      string = xpc_dictionary_get_string(v17, "TaskingAdminRequest_RejectionReason");
      if (string)
      {
        v20 = string;
        DPLogHandle_ClientTaskingXPCError();
        v21 = objc_claimAutoreleasedReturnValue();
        if (os_signpost_enabled(v21))
        {
          *(_DWORD *)buf = 136446210;
          v48 = v20;
          _os_signpost_emit_with_name_impl(&dword_1D3AB0000, v21, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "GetCloudChannelConfigFailed", "Failed due to reason: %{public}s", buf, 0xCu);
        }

        if (!v8)
          goto LABEL_18;
        v22 = (void *)MEMORY[0x1E0CB35C8];
        v23 = kDRTaskingClientError;
        v45 = *MEMORY[0x1E0CB2D50];
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", v20);
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        v46 = v24;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v46, &v45, 1);
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v22, "errorWithDomain:code:userInfo:", v23, 0, v25);
        *(_QWORD *)v8 = (id)objc_claimAutoreleasedReturnValue();

        goto LABEL_17;
      }
      v39 = xpc_dictionary_get_string(v17, "description");
      if (v39)
      {
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", v39);
        v8 = (char *)objc_claimAutoreleasedReturnValue();
        DPLogHandle_ClientTaskingXPC();
        v40 = objc_claimAutoreleasedReturnValue();
        if (os_signpost_enabled(v40))
        {
          *(_DWORD *)buf = 138543362;
          v48 = v8;
          _os_signpost_emit_with_name_impl(&dword_1D3AB0000, v40, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "GetCloudChannelConfigSucceeded", "CloudChannel description: %{public}@", buf, 0xCu);
        }

        *a2 = xpc_dictionary_get_uint64(v17, "platform");
        *a3 = xpc_dictionary_get_uint64(v17, "type");
        *a4 = xpc_dictionary_get_uint64(v17, "environment");
        *a5 = xpc_dictionary_get_BOOL(v17, "overridesDeviceDefault");
        *a1 = xpc_dictionary_get_BOOL(v17, "hasConfig");
        *a6 = xpc_dictionary_get_BOOL(v17, "dropsMessages");
        xpc_dictionary_get_value(v17, "populationSliceNumber");
        v41 = (void *)objc_claimAutoreleasedReturnValue();

        if (v41)
        {
          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", xpc_dictionary_get_uint64(v17, "populationSliceNumber"));
          *a7 = (id)objc_claimAutoreleasedReturnValue();
        }
        goto LABEL_18;
      }
      if (!v8)
      {
LABEL_18:
        v16 = v42;
        goto LABEL_19;
      }
      v32 = (void *)MEMORY[0x1E0CB35C8];
      v33 = kDRTaskingClientError;
      v49 = *MEMORY[0x1E0CB2D50];
      v50 = CFSTR("Invalid tasking service reply");
      v34 = (void *)MEMORY[0x1E0C99D80];
      v35 = &v50;
      v36 = &v49;
    }
    else
    {
      DPLogHandle_ClientTaskingXPCError();
      v31 = objc_claimAutoreleasedReturnValue();
      if (os_signpost_enabled(v31))
      {
        *(_WORD *)buf = 0;
        _os_signpost_emit_with_name_impl(&dword_1D3AB0000, v31, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "InvalidGetCloudChannelConfigReply", "Received an invalid reply for a cloud channel config request message from the tasking service", buf, 2u);
      }

      if (!v8)
        goto LABEL_18;
      v32 = (void *)MEMORY[0x1E0CB35C8];
      v33 = kDRTaskingClientError;
      v43 = *MEMORY[0x1E0CB2D50];
      v44 = CFSTR("Invalid tasking service reply");
      v34 = (void *)MEMORY[0x1E0C99D80];
      v35 = &v44;
      v36 = &v43;
    }
    objc_msgSend(v34, "dictionaryWithObjects:forKeys:count:", v35, v36, 1);
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v32, "errorWithDomain:code:userInfo:", v33, 0, v37);
    *(_QWORD *)v8 = (id)objc_claimAutoreleasedReturnValue();

LABEL_17:
    v8 = 0;
    goto LABEL_18;
  }
  if (v8)
  {
    v26 = v16;
    v27 = (void *)MEMORY[0x1E0CB35C8];
    v28 = kDRTaskingClientError;
    v51 = *MEMORY[0x1E0CB2D50];
    v52[0] = CFSTR("Invalid tasking service reply");
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v52, &v51, 1);
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    v30 = v27;
    v16 = v26;
    objc_msgSend(v30, "errorWithDomain:code:userInfo:", v28, 0, v29);
    *(_QWORD *)v8 = (id)objc_claimAutoreleasedReturnValue();

    v8 = 0;
  }
LABEL_19:

  return v8;
}

uint64_t _DPCSetCloudChannelConfig(unsigned int a1, unsigned int a2, unsigned int a3, int a4, void *a5, _QWORD *a6)
{
  id v11;
  xpc_object_t v12;
  void *v13;
  void *v14;
  const char *string;
  const char *v16;
  NSObject *v17;
  void *v18;
  uint64_t v19;
  NSObject *v20;
  void *v21;
  uint64_t v22;
  void *v23;
  uint64_t v24;
  void *v25;
  const __CFString **v26;
  uint64_t *v27;
  NSObject *v28;
  uint64_t v30;
  const __CFString *v31;
  uint64_t v32;
  NSObject *v33;
  uint8_t buf[4];
  const char *v35;
  uint64_t v36;
  _QWORD v37[2];

  v37[1] = *MEMORY[0x1E0C80C00];
  v11 = a5;
  if (a6)
    *a6 = 0;
  v12 = xpc_dictionary_create(0, 0, 0);
  xpc_dictionary_set_uint64(v12, "TaskingClientMessageType", 7uLL);
  if (a4)
  {
    xpc_dictionary_set_BOOL(v12, "noSubscription", 1);
  }
  else
  {
    xpc_dictionary_set_uint64(v12, "platform", a1);
    xpc_dictionary_set_uint64(v12, "type", a2);
    xpc_dictionary_set_uint64(v12, "environment", a3);
    if (v11)
      xpc_dictionary_set_uint64(v12, "populationSliceNumber", objc_msgSend(v11, "unsignedLongLongValue"));
  }
  _replyObjectForRequestMessage(v12, a6);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = v13;
  if (!v13)
  {
    if (!a6)
      goto LABEL_21;
    v23 = (void *)MEMORY[0x1E0CB35C8];
    v24 = kDRTaskingClientError;
    v36 = *MEMORY[0x1E0CB2D50];
    v37[0] = CFSTR("Invalid tasking service reply");
    v25 = (void *)MEMORY[0x1E0C99D80];
    v26 = (const __CFString **)v37;
    v27 = &v36;
LABEL_20:
    objc_msgSend(v25, "dictionaryWithObjects:forKeys:count:", v26, v27, 1, v30, v31);
    v20 = objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "errorWithDomain:code:userInfo:", v24, 0, v20);
    v22 = 0;
    *a6 = (id)objc_claimAutoreleasedReturnValue();
    goto LABEL_25;
  }
  if (xpc_dictionary_get_uint64(v13, "TaskingServiceReplyType") != 7)
  {
    DPLogHandle_ClientTaskingXPCError();
    v28 = objc_claimAutoreleasedReturnValue();
    if (os_signpost_enabled(v28))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_1D3AB0000, v28, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "InvalidSetCloudChannelConfigReply", "Received an invalid reply for a set cloud channel config message from the tasking service", buf, 2u);
    }

    if (!a6)
      goto LABEL_21;
    v23 = (void *)MEMORY[0x1E0CB35C8];
    v24 = kDRTaskingClientError;
    v30 = *MEMORY[0x1E0CB2D50];
    v31 = CFSTR("Invalid tasking service reply");
    v25 = (void *)MEMORY[0x1E0C99D80];
    v26 = &v31;
    v27 = &v30;
    goto LABEL_20;
  }
  string = xpc_dictionary_get_string(v14, "TaskingAdminRequest_RejectionReason");
  if (!string)
  {
    DPLogHandle_ClientTaskingXPC();
    v20 = objc_claimAutoreleasedReturnValue();
    if (os_signpost_enabled(v20))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_1D3AB0000, v20, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "SetCloudChannelConfigSucceeded", (const char *)&unk_1D3AC206D, buf, 2u);
    }
    v22 = 1;
    goto LABEL_25;
  }
  v16 = string;
  DPLogHandle_ClientTaskingXPCError();
  v17 = objc_claimAutoreleasedReturnValue();
  if (os_signpost_enabled(v17))
  {
    *(_DWORD *)buf = 136446210;
    v35 = v16;
    _os_signpost_emit_with_name_impl(&dword_1D3AB0000, v17, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "SetCloudChannelConfigFailed", "Failed due to reason: %{public}s", buf, 0xCu);
  }

  if (a6)
  {
    v18 = (void *)MEMORY[0x1E0CB35C8];
    v19 = kDRTaskingClientError;
    v32 = *MEMORY[0x1E0CB2D50];
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", v16);
    v20 = objc_claimAutoreleasedReturnValue();
    v33 = v20;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v33, &v32, 1);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "errorWithDomain:code:userInfo:", v19, 0, v21);
    *a6 = (id)objc_claimAutoreleasedReturnValue();

    v22 = 0;
LABEL_25:

    goto LABEL_26;
  }
LABEL_21:
  v22 = 0;
LABEL_26:

  return v22;
}

uint64_t _DPCResetToDefaultCloudChannelConfig(_QWORD *a1)
{
  xpc_object_t v2;
  void *v3;
  void *v4;
  const char *string;
  const char *v6;
  NSObject *v7;
  void *v8;
  uint64_t v9;
  NSObject *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  void *v15;
  const __CFString **v16;
  uint64_t *v17;
  NSObject *v18;
  uint64_t v20;
  const __CFString *v21;
  uint64_t v22;
  NSObject *v23;
  uint8_t buf[4];
  const char *v25;
  uint64_t v26;
  _QWORD v27[2];

  v27[1] = *MEMORY[0x1E0C80C00];
  if (a1)
    *a1 = 0;
  v2 = xpc_dictionary_create(0, 0, 0);
  xpc_dictionary_set_uint64(v2, "TaskingClientMessageType", 8uLL);
  _replyObjectForRequestMessage(v2, a1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (!v3)
  {
    if (!a1)
      goto LABEL_17;
    v13 = (void *)MEMORY[0x1E0CB35C8];
    v14 = kDRTaskingClientError;
    v26 = *MEMORY[0x1E0CB2D50];
    v27[0] = CFSTR("Invalid tasking service reply");
    v15 = (void *)MEMORY[0x1E0C99D80];
    v16 = (const __CFString **)v27;
    v17 = &v26;
LABEL_16:
    objc_msgSend(v15, "dictionaryWithObjects:forKeys:count:", v16, v17, 1, v20, v21);
    v10 = objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "errorWithDomain:code:userInfo:", v14, 0, v10);
    v12 = 0;
    *a1 = (id)objc_claimAutoreleasedReturnValue();
    goto LABEL_21;
  }
  if (xpc_dictionary_get_uint64(v3, "TaskingServiceReplyType") != 8)
  {
    DPLogHandle_ClientTaskingXPCError();
    v18 = objc_claimAutoreleasedReturnValue();
    if (os_signpost_enabled(v18))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_1D3AB0000, v18, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "InvalidResetCloudChannelConfigReply", "Received an invalid reply for a set cloud channel config message from the tasking service", buf, 2u);
    }

    if (!a1)
      goto LABEL_17;
    v13 = (void *)MEMORY[0x1E0CB35C8];
    v14 = kDRTaskingClientError;
    v20 = *MEMORY[0x1E0CB2D50];
    v21 = CFSTR("Invalid tasking service reply");
    v15 = (void *)MEMORY[0x1E0C99D80];
    v16 = &v21;
    v17 = &v20;
    goto LABEL_16;
  }
  string = xpc_dictionary_get_string(v4, "TaskingAdminRequest_RejectionReason");
  if (!string)
  {
    DPLogHandle_ClientTaskingXPC();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_signpost_enabled(v10))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_1D3AB0000, v10, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "ResetCloudChannelConfigSucceeded", (const char *)&unk_1D3AC206D, buf, 2u);
    }
    v12 = 1;
    goto LABEL_21;
  }
  v6 = string;
  DPLogHandle_ClientTaskingXPCError();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_signpost_enabled(v7))
  {
    *(_DWORD *)buf = 136446210;
    v25 = v6;
    _os_signpost_emit_with_name_impl(&dword_1D3AB0000, v7, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "ResetCloudChannelConfigFailed", "Failed due to reason: %{public}s", buf, 0xCu);
  }

  if (a1)
  {
    v8 = (void *)MEMORY[0x1E0CB35C8];
    v9 = kDRTaskingClientError;
    v22 = *MEMORY[0x1E0CB2D50];
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", v6);
    v10 = objc_claimAutoreleasedReturnValue();
    v23 = v10;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v23, &v22, 1);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "errorWithDomain:code:userInfo:", v9, 0, v11);
    *a1 = (id)objc_claimAutoreleasedReturnValue();

    v12 = 0;
LABEL_21:

    goto LABEL_22;
  }
LABEL_17:
  v12 = 0;
LABEL_22:

  return v12;
}

NSObject *_dateFromJSONDict(void *a1, uint64_t a2)
{
  void *v2;
  void *v3;
  NSObject *v4;
  NSObject *v5;
  NSObject *v6;
  NSObject *v7;

  objc_msgSend(a1, "objectForKeyedSubscript:", a2);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (v2)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v3 = (void *)MEMORY[0x1E0C99D68];
      objc_msgSend(v2, "doubleValue");
      objc_msgSend(v3, "dateWithTimeIntervalSince1970:");
      v4 = objc_claimAutoreleasedReturnValue();
      v5 = v4;
      if (v4)
      {
        v5 = v4;
        v6 = v5;
      }
      else
      {
        DPLogHandle_TaskingMessageError();
        v7 = objc_claimAutoreleasedReturnValue();
        if (os_signpost_enabled(v7))
          _os_signpost_emit_unreliably_with_name_impl();

        v6 = 0;
      }
    }
    else
    {
      DPLogHandle_TaskingMessageError();
      v5 = objc_claimAutoreleasedReturnValue();
      if (os_signpost_enabled(v5))
        _os_signpost_emit_unreliably_with_name_impl();
      v6 = 0;
    }

  }
  else
  {
    v6 = 0;
  }

  return v6;
}

id DPLogHandle_ClientError()
{
  if (DPLogHandle_ClientError_onceToken != -1)
    dispatch_once(&DPLogHandle_ClientError_onceToken, &__block_literal_global_0);
  return (id)DPLogHandle_ClientError_handle;
}

id DPLogHandle_AdminError()
{
  if (DPLogHandle_AdminError_onceToken != -1)
    dispatch_once(&DPLogHandle_AdminError_onceToken, &__block_literal_global_2);
  return (id)DPLogHandle_AdminError_handle;
}

id DPLogHandle_ClientXPCError()
{
  if (DPLogHandle_ClientXPCError_onceToken != -1)
    dispatch_once(&DPLogHandle_ClientXPCError_onceToken, &__block_literal_global_4);
  return (id)DPLogHandle_ClientXPCError_handle;
}

id DPLogHandle_ClientXPC()
{
  if (DPLogHandle_ClientXPC_onceToken != -1)
    dispatch_once(&DPLogHandle_ClientXPC_onceToken, &__block_literal_global_6);
  return (id)DPLogHandle_ClientXPC_handle;
}

id DPLogHandle_ClientAPI()
{
  if (DPLogHandle_ClientAPI_onceToken != -1)
    dispatch_once(&DPLogHandle_ClientAPI_onceToken, &__block_literal_global_8);
  return (id)DPLogHandle_ClientAPI_handle;
}

id DPLogHandle_ClientAPIError()
{
  if (DPLogHandle_ClientAPIError_onceToken != -1)
    dispatch_once(&DPLogHandle_ClientAPIError_onceToken, &__block_literal_global_10);
  return (id)DPLogHandle_ClientAPIError_handle;
}

id DPLogHandle_CKRecordError()
{
  if (DPLogHandle_CKRecordError_onceToken != -1)
    dispatch_once(&DPLogHandle_CKRecordError_onceToken, &__block_literal_global_12);
  return (id)DPLogHandle_CKRecordError_handle;
}

id DPLogHandle_CKRecord()
{
  if (DPLogHandle_CKRecord_onceToken != -1)
    dispatch_once(&DPLogHandle_CKRecord_onceToken, &__block_literal_global_14);
  return (id)DPLogHandle_CKRecord_handle;
}

id DPLogHandle_CKRecordUpload()
{
  if (DPLogHandle_CKRecordUpload_onceToken != -1)
    dispatch_once(&DPLogHandle_CKRecordUpload_onceToken, &__block_literal_global_16);
  return (id)DPLogHandle_CKRecordUpload_handle;
}

id DPLogHandle_CKInverness()
{
  if (DPLogHandle_CKInverness_onceToken != -1)
    dispatch_once(&DPLogHandle_CKInverness_onceToken, &__block_literal_global_18);
  return (id)DPLogHandle_CKInverness_handle;
}

id DPLogHandle_CKInvernessError()
{
  if (DPLogHandle_CKInvernessError_onceToken != -1)
    dispatch_once(&DPLogHandle_CKInvernessError_onceToken, &__block_literal_global_20);
  return (id)DPLogHandle_CKInvernessError_handle;
}

id DPLogHandle_CKCFUpload()
{
  if (DPLogHandle_CKCFUpload_onceToken != -1)
    dispatch_once(&DPLogHandle_CKCFUpload_onceToken, &__block_literal_global_22);
  return (id)DPLogHandle_CKCFUpload_handle;
}

id DPLogHandle_CKCFUploadError()
{
  if (DPLogHandle_CKCFUploadError_onceToken != -1)
    dispatch_once(&DPLogHandle_CKCFUploadError_onceToken, &__block_literal_global_24);
  return (id)DPLogHandle_CKCFUploadError_handle;
}

id DPLogHandle_ServiceXPCError()
{
  if (DPLogHandle_ServiceXPCError_onceToken != -1)
    dispatch_once(&DPLogHandle_ServiceXPCError_onceToken, &__block_literal_global_26);
  return (id)DPLogHandle_ServiceXPCError_handle;
}

id DPLogHandle_ServiceXPC()
{
  if (DPLogHandle_ServiceXPC_onceToken != -1)
    dispatch_once(&DPLogHandle_ServiceXPC_onceToken, &__block_literal_global_28);
  return (id)DPLogHandle_ServiceXPC_handle;
}

id DPLogHandle_ServiceLifecycle()
{
  if (DPLogHandle_ServiceLifecycle_onceToken != -1)
    dispatch_once(&DPLogHandle_ServiceLifecycle_onceToken, &__block_literal_global_30);
  return (id)DPLogHandle_ServiceLifecycle_handle;
}

id DPLogHandle_ServiceLifecycleError()
{
  if (DPLogHandle_ServiceLifecycleError_onceToken != -1)
    dispatch_once(&DPLogHandle_ServiceLifecycleError_onceToken, &__block_literal_global_32);
  return (id)DPLogHandle_ServiceLifecycleError_handle;
}

id DPLogHandle_PermissiveUploadActivity()
{
  if (DPLogHandle_PermissiveUploadActivity_onceToken != -1)
    dispatch_once(&DPLogHandle_PermissiveUploadActivity_onceToken, &__block_literal_global_34);
  return (id)DPLogHandle_PermissiveUploadActivity_handle;
}

id DPLogHandle_LogManagement()
{
  if (DPLogHandle_LogManagement_onceToken != -1)
    dispatch_once(&DPLogHandle_LogManagement_onceToken, &__block_literal_global_36);
  return (id)DPLogHandle_LogManagement_handle;
}

id DPLogHandle_LogManagementError()
{
  if (DPLogHandle_LogManagementError_onceToken != -1)
    dispatch_once(&DPLogHandle_LogManagementError_onceToken, &__block_literal_global_38);
  return (id)DPLogHandle_LogManagementError_handle;
}

id DPLogHandle_DAReporting()
{
  if (DPLogHandle_DAReporting_onceToken != -1)
    dispatch_once(&DPLogHandle_DAReporting_onceToken, &__block_literal_global_40);
  return (id)DPLogHandle_DAReporting_handle;
}

id DPLogHandle_DAReportingError()
{
  if (DPLogHandle_DAReportingError_onceToken != -1)
    dispatch_once(&DPLogHandle_DAReportingError_onceToken, &__block_literal_global_42);
  return (id)DPLogHandle_DAReportingError_handle;
}

id DPLogHandle_RequestError()
{
  if (DPLogHandle_RequestError_onceToken != -1)
    dispatch_once(&DPLogHandle_RequestError_onceToken, &__block_literal_global_44);
  return (id)DPLogHandle_RequestError_handle;
}

id DPLogHandle_Request()
{
  if (DPLogHandle_Request_onceToken != -1)
    dispatch_once(&DPLogHandle_Request_onceToken, &__block_literal_global_46);
  return (id)DPLogHandle_Request_handle;
}

id DPLogHandle_TailspinError()
{
  if (DPLogHandle_TailspinError_onceToken != -1)
    dispatch_once(&DPLogHandle_TailspinError_onceToken, &__block_literal_global_48);
  return (id)DPLogHandle_TailspinError_handle;
}

id DPLogHandle_Tailspin()
{
  if (DPLogHandle_Tailspin_onceToken != -1)
    dispatch_once(&DPLogHandle_Tailspin_onceToken, &__block_literal_global_50);
  return (id)DPLogHandle_Tailspin_handle;
}

id DPLogHandle_SubmitLogError()
{
  if (DPLogHandle_SubmitLogError_onceToken != -1)
    dispatch_once(&DPLogHandle_SubmitLogError_onceToken, &__block_literal_global_52);
  return (id)DPLogHandle_SubmitLogError_handle;
}

id DPLogHandle_SubmitLog()
{
  if (DPLogHandle_SubmitLog_onceToken != -1)
    dispatch_once(&DPLogHandle_SubmitLog_onceToken, &__block_literal_global_54);
  return (id)DPLogHandle_SubmitLog_handle;
}

id DPLogHandle_SubmitLogToCKContainerError()
{
  if (DPLogHandle_SubmitLogToCKContainerError_onceToken != -1)
    dispatch_once(&DPLogHandle_SubmitLogToCKContainerError_onceToken, &__block_literal_global_56);
  return (id)DPLogHandle_SubmitLogToCKContainerError_handle;
}

id DPLogHandle_SubmitLogToCKContainer()
{
  if (DPLogHandle_SubmitLogToCKContainer_onceToken != -1)
    dispatch_once(&DPLogHandle_SubmitLogToCKContainer_onceToken, &__block_literal_global_58);
  return (id)DPLogHandle_SubmitLogToCKContainer_handle;
}

id DPLogHandle_EnableDataGatheringQueryError()
{
  if (DPLogHandle_EnableDataGatheringQueryError_onceToken != -1)
    dispatch_once(&DPLogHandle_EnableDataGatheringQueryError_onceToken, &__block_literal_global_60);
  return (id)DPLogHandle_EnableDataGatheringQueryError_handle;
}

id DPLogHandle_EnableDataGatheringQuery()
{
  if (DPLogHandle_EnableDataGatheringQuery_onceToken != -1)
    dispatch_once(&DPLogHandle_EnableDataGatheringQuery_onceToken, &__block_literal_global_62);
  return (id)DPLogHandle_EnableDataGatheringQuery_handle;
}

id DPLogHandle_CoreDataError()
{
  if (DPLogHandle_CoreDataError_onceToken != -1)
    dispatch_once(&DPLogHandle_CoreDataError_onceToken, &__block_literal_global_64);
  return (id)DPLogHandle_CoreDataError_handle;
}

id DPLogHandle_CoreData()
{
  if (DPLogHandle_CoreData_onceToken != -1)
    dispatch_once(&DPLogHandle_CoreData_onceToken, &__block_literal_global_66);
  return (id)DPLogHandle_CoreData_handle;
}

id DPLogHandle_SystemProfileError()
{
  if (DPLogHandle_SystemProfileError_onceToken != -1)
    dispatch_once(&DPLogHandle_SystemProfileError_onceToken, &__block_literal_global_68);
  return (id)DPLogHandle_SystemProfileError_handle;
}

id DPLogHandle_SystemProfile()
{
  if (DPLogHandle_SystemProfile_onceToken != -1)
    dispatch_once(&DPLogHandle_SystemProfile_onceToken, &__block_literal_global_70);
  return (id)DPLogHandle_SystemProfile_handle;
}

id DPLogHandle_DampeningManager()
{
  if (DPLogHandle_DampeningManager_onceToken != -1)
    dispatch_once(&DPLogHandle_DampeningManager_onceToken, &__block_literal_global_72);
  return (id)DPLogHandle_DampeningManager_handle;
}

id DPLogHandle_DampeningManagerError()
{
  if (DPLogHandle_DampeningManagerError_onceToken != -1)
    dispatch_once(&DPLogHandle_DampeningManagerError_onceToken, &__block_literal_global_74);
  return (id)DPLogHandle_DampeningManagerError_handle;
}

id DPLogHandle_TaskingMessage()
{
  if (DPLogHandle_TaskingMessage_onceToken != -1)
    dispatch_once(&DPLogHandle_TaskingMessage_onceToken, &__block_literal_global_76);
  return (id)DPLogHandle_TaskingMessage_handle;
}

id DPLogHandle_TaskingMessageError()
{
  if (DPLogHandle_TaskingMessageError_onceToken != -1)
    dispatch_once(&DPLogHandle_TaskingMessageError_onceToken, &__block_literal_global_78);
  return (id)DPLogHandle_TaskingMessageError_handle;
}

id DPLogHandle_TaskingDecisionMaker()
{
  if (DPLogHandle_TaskingDecisionMaker_onceToken != -1)
    dispatch_once(&DPLogHandle_TaskingDecisionMaker_onceToken, &__block_literal_global_80);
  return (id)DPLogHandle_TaskingDecisionMaker_handle;
}

id DPLogHandle_TaskingDecisionMakerError()
{
  if (DPLogHandle_TaskingDecisionMakerError_onceToken != -1)
    dispatch_once(&DPLogHandle_TaskingDecisionMakerError_onceToken, &__block_literal_global_82);
  return (id)DPLogHandle_TaskingDecisionMakerError_handle;
}

id DPLogHandle_ConfigPersistedStore()
{
  if (DPLogHandle_ConfigPersistedStore_onceToken != -1)
    dispatch_once(&DPLogHandle_ConfigPersistedStore_onceToken, &__block_literal_global_84);
  return (id)DPLogHandle_ConfigPersistedStore_handle;
}

id DPLogHandle_ConfigPersistedStoreError()
{
  if (DPLogHandle_ConfigPersistedStoreError_onceToken != -1)
    dispatch_once(&DPLogHandle_ConfigPersistedStoreError_onceToken, &__block_literal_global_86);
  return (id)DPLogHandle_ConfigPersistedStoreError_handle;
}

id DPLogHandle_TaskingManager()
{
  if (DPLogHandle_TaskingManager_onceToken != -1)
    dispatch_once(&DPLogHandle_TaskingManager_onceToken, &__block_literal_global_88);
  return (id)DPLogHandle_TaskingManager_handle;
}

id DPLogHandle_TaskingManagerError()
{
  if (DPLogHandle_TaskingManagerError_onceToken != -1)
    dispatch_once(&DPLogHandle_TaskingManagerError_onceToken, &__block_literal_global_90);
  return (id)DPLogHandle_TaskingManagerError_handle;
}

id DPLogHandle_TaskingMessageChannel()
{
  if (DPLogHandle_TaskingMessageChannel_onceToken != -1)
    dispatch_once(&DPLogHandle_TaskingMessageChannel_onceToken, &__block_literal_global_92);
  return (id)DPLogHandle_TaskingMessageChannel_handle;
}

id DPLogHandle_TaskingMessageChannelError()
{
  if (DPLogHandle_TaskingMessageChannelError_onceToken != -1)
    dispatch_once(&DPLogHandle_TaskingMessageChannelError_onceToken, &__block_literal_global_94);
  return (id)DPLogHandle_TaskingMessageChannelError_handle;
}

id DPLogHandle_ClientTaskingXPC()
{
  if (DPLogHandle_ClientTaskingXPC_onceToken != -1)
    dispatch_once(&DPLogHandle_ClientTaskingXPC_onceToken, &__block_literal_global_96);
  return (id)DPLogHandle_ClientTaskingXPC_handle;
}

id DPLogHandle_ClientTaskingXPCError()
{
  if (DPLogHandle_ClientTaskingXPCError_onceToken != -1)
    dispatch_once(&DPLogHandle_ClientTaskingXPCError_onceToken, &__block_literal_global_98);
  return (id)DPLogHandle_ClientTaskingXPCError_handle;
}

id DPLogHandle_ServiceTasking()
{
  if (DPLogHandle_ServiceTasking_onceToken != -1)
    dispatch_once(&DPLogHandle_ServiceTasking_onceToken, &__block_literal_global_104);
  return (id)DPLogHandle_ServiceTasking_handle;
}

id DPLogHandle_ServiceTaskingError()
{
  if (DPLogHandle_ServiceTaskingError_onceToken != -1)
    dispatch_once(&DPLogHandle_ServiceTaskingError_onceToken, &__block_literal_global_106);
  return (id)DPLogHandle_ServiceTaskingError_handle;
}

id DPLogHandle_ServiceTaskingXPC()
{
  if (DPLogHandle_ServiceTaskingXPC_onceToken != -1)
    dispatch_once(&DPLogHandle_ServiceTaskingXPC_onceToken, &__block_literal_global_108);
  return (id)DPLogHandle_ServiceTaskingXPC_handle;
}

id DPLogHandle_ServiceTaskingXPCError()
{
  if (DPLogHandle_ServiceTaskingXPCError_onceToken != -1)
    dispatch_once(&DPLogHandle_ServiceTaskingXPCError_onceToken, &__block_literal_global_110);
  return (id)DPLogHandle_ServiceTaskingXPCError_handle;
}

id DPLogHandle_ServiceEventPublisher()
{
  if (DPLogHandle_ServiceEventPublisher_onceToken != -1)
    dispatch_once(&DPLogHandle_ServiceEventPublisher_onceToken, &__block_literal_global_112);
  return (id)DPLogHandle_ServiceEventPublisher_handle;
}

id DPLogHandle_ServiceEventPublisherError()
{
  if (DPLogHandle_ServiceEventPublisherError_onceToken != -1)
    dispatch_once(&DPLogHandle_ServiceEventPublisherError_onceToken, &__block_literal_global_114);
  return (id)DPLogHandle_ServiceEventPublisherError_handle;
}

id DPLogHandle_Telemetry()
{
  if (DPLogHandle_Telemetry_onceToken != -1)
    dispatch_once(&DPLogHandle_Telemetry_onceToken, &__block_literal_global_116);
  return (id)DPLogHandle_Telemetry_handle;
}

id DPLogHandle_TaskingDSTelemetry()
{
  if (DPLogHandle_TaskingDSTelemetry_onceToken != -1)
    dispatch_once(&DPLogHandle_TaskingDSTelemetry_onceToken, &__block_literal_global_118);
  return (id)DPLogHandle_TaskingDSTelemetry_handle;
}

id DPLogHandle_CKConfig()
{
  if (DPLogHandle_CKConfig_onceToken != -1)
    dispatch_once(&DPLogHandle_CKConfig_onceToken, &__block_literal_global_120);
  return (id)DPLogHandle_CKConfig_handle;
}

id DPLogHandle_CKConfigError()
{
  if (DPLogHandle_CKConfigError_onceToken != -1)
    dispatch_once(&DPLogHandle_CKConfigError_onceToken, &__block_literal_global_122);
  return (id)DPLogHandle_CKConfigError_handle;
}

id DPLogHandle_UploadSessionDate()
{
  if (DPLogHandle_UploadSessionDate_onceToken != -1)
    dispatch_once(&DPLogHandle_UploadSessionDate_onceToken, &__block_literal_global_124);
  return (id)DPLogHandle_UploadSessionDate_handle;
}

id DPLogHandle_UploadSessionDateError()
{
  if (DPLogHandle_UploadSessionDateError_onceToken != -1)
    dispatch_once(&DPLogHandle_UploadSessionDateError_onceToken, &__block_literal_global_126);
  return (id)DPLogHandle_UploadSessionDateError_handle;
}

id DPLogHandle_DPConfig()
{
  if (DPLogHandle_DPConfig_onceToken != -1)
    dispatch_once(&DPLogHandle_DPConfig_onceToken, &__block_literal_global_128);
  return (id)DPLogHandle_DPConfig_handle;
}

id DPLogHandle_DPConfigError()
{
  if (DPLogHandle_DPConfigError_onceToken != -1)
    dispatch_once(&DPLogHandle_DPConfigError_onceToken, &__block_literal_global_130);
  return (id)DPLogHandle_DPConfigError_handle;
}

id DPLogHandle_DRSConfig()
{
  if (DPLogHandle_DRSConfig_onceToken != -1)
    dispatch_once(&DPLogHandle_DRSConfig_onceToken, &__block_literal_global_132);
  return (id)DPLogHandle_DRSConfig_handle;
}

id DPLogHandle_DRSConfigError()
{
  if (DPLogHandle_DRSConfigError_onceToken != -1)
    dispatch_once(&DPLogHandle_DRSConfigError_onceToken, &__block_literal_global_134);
  return (id)DPLogHandle_DRSConfigError_handle;
}

void _DRRequestResetTailspinHysteresis()
{
  NSObject *v0;

  _hysteresisQueue();
  v0 = objc_claimAutoreleasedReturnValue();
  dispatch_sync(v0, &__block_literal_global_1);

}

id _hysteresisQueue()
{
  if (_hysteresisQueue_onceToken != -1)
    dispatch_once(&_hysteresisQueue_onceToken, &__block_literal_global_28_0);
  return (id)_hysteresisQueue_hysteresisQueue;
}

uint64_t _DRRequestPassesTailspinHysteresis(double a1)
{
  NSObject *v2;
  uint64_t v3;
  _QWORD v5[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  char v9;

  v6 = 0;
  v7 = &v6;
  v8 = 0x2020000000;
  v9 = 1;
  _hysteresisQueue();
  v2 = objc_claimAutoreleasedReturnValue();
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = ___DRRequestPassesTailspinHysteresis_block_invoke;
  v5[3] = &unk_1E9553770;
  *(double *)&v5[5] = a1;
  v5[4] = &v6;
  dispatch_sync(v2, v5);

  v3 = *((unsigned __int8 *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

uint64_t _doesPassHysteresis(uint64_t a1, uint64_t a2, double a3)
{
  if (_doesPassHysteresis_onceToken == -1)
  {
    if (a1)
      return *(double *)&_doesPassHysteresis_timebaseRatio * (double)(unint64_t)(a2 - a1) / 1000000000.0 >= a3;
  }
  else
  {
    dispatch_once(&_doesPassHysteresis_onceToken, &__block_literal_global_30_0);
    if (a1)
      return *(double *)&_doesPassHysteresis_timebaseRatio * (double)(unint64_t)(a2 - a1) / 1000000000.0 >= a3;
  }
  return 1;
}

uint64_t _tailspinRequestShared(void *a1, void *a2, void *a3, void *a4, BOOL a5, BOOL a6, void *a7, void *a8, _QWORD *a9)
{
  _QWORD *v16;
  id v17;
  id v18;
  id v19;
  id v20;
  id v21;
  id v22;
  uint64_t v23;
  void *v24;
  id v25;
  void *v26;
  id v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t i;
  uint64_t v32;
  id v33;
  NSObject *v34;
  id v36;
  id v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  id v42;
  int v43;
  id v44;
  __int16 v45;
  id v46;
  __int16 v47;
  id v48;
  _BYTE v49[128];
  uint64_t v50;

  v16 = a9;
  v50 = *MEMORY[0x1E0C80C00];
  v17 = a1;
  v18 = a2;
  v19 = a3;
  v20 = a4;
  v21 = a7;
  v22 = a8;
  v23 = mach_continuous_time();
  v42 = 0;
  _DPCTailspinRequestMessage(v17, v18, v19, v20, v23, a5, a6, v21, v22, &v42);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v25 = v42;
  v26 = v25;
  if (!v24)
  {
    if (a9)
    {
      v33 = objc_retainAutorelease(v25);
LABEL_21:
      v32 = 0;
      *v16 = v33;
      goto LABEL_23;
    }
LABEL_22:
    v32 = 0;
    goto LABEL_23;
  }
  v36 = v25;
  v37 = v17;
  v40 = 0u;
  v41 = 0u;
  v38 = 0u;
  v39 = 0u;
  v27 = v22;
  v28 = objc_msgSend(v27, "countByEnumeratingWithState:objects:count:", &v38, v49, 16);
  if (v28)
  {
    v29 = v28;
    v30 = *(_QWORD *)v39;
    while (2)
    {
      for (i = 0; i != v29; ++i)
      {
        if (*(_QWORD *)v39 != v30)
          objc_enumerationMutation(v27);
        if ((objc_msgSend(*(id *)(*((_QWORD *)&v38 + 1) + 8 * i), "transferOwnership") & 1) != 0)
        {

          goto LABEL_13;
        }
      }
      v29 = objc_msgSend(v27, "countByEnumeratingWithState:objects:count:", &v38, v49, 16);
      if (v29)
        continue;
      break;
    }
  }

  if ((_DRRequestPassesTailspinHysteresis(300.0) & 1) != 0)
  {
LABEL_13:
    v26 = v36;
    v17 = v37;
    if ((_DPClientXPCSendMessage(v24) & 1) != 0)
    {
      v32 = 1;
      goto LABEL_23;
    }
    DPLogHandle_ClientXPCError();
    v34 = objc_claimAutoreleasedReturnValue();
    if (os_signpost_enabled(v34))
    {
      v43 = 138543874;
      v44 = v37;
      v45 = 2114;
      v46 = v18;
      v47 = 2114;
      v48 = v19;
      _os_signpost_emit_unreliably_with_name_impl();
    }

    v16 = a9;
    if (a9)
    {
      _clientError(CFSTR("Failed to send message to DiagnosticRequest service potentially due to missing com.apple.diagnosticpipeline.request entitlement"));
      v33 = (id)objc_claimAutoreleasedReturnValue();
      goto LABEL_21;
    }
    goto LABEL_22;
  }
  v32 = 1;
  v26 = v36;
  v17 = v37;
LABEL_23:

  return v32;
}

uint64_t DRTailspinRequest(void *a1, void *a2, void *a3, void *a4, BOOL a5, BOOL a6, void *a7, void *a8, _QWORD *a9)
{
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  id v20;
  void *v21;
  uint64_t v22;
  id v23;
  void *v26;
  id v27;

  v15 = a1;
  v16 = a2;
  v17 = a3;
  v18 = a4;
  v19 = a7;
  v20 = a8;
  v21 = (void *)MEMORY[0x1D82510C4]();
  v26 = v15;
  v27 = 0;
  v22 = _tailspinRequestShared(v15, v16, v17, v18, a5, a6, v19, 0, &v27);
  v23 = v27;
  objc_autoreleasePoolPop(v21);
  if (a9)
    *a9 = objc_retainAutorelease(v23);

  return v22;
}

uint64_t DRTailspinRequestWithLogs(void *a1, void *a2, void *a3, void *a4, BOOL a5, BOOL a6, void *a7, void *a8, _QWORD *a9)
{
  id v16;
  id v17;
  id v18;
  id v19;
  id v20;
  id v21;
  void *v22;
  uint64_t v23;
  id v24;
  NSObject *v25;
  id v27;
  uint8_t buf[16];

  v16 = a1;
  v17 = a2;
  v18 = a3;
  v19 = a4;
  v20 = a7;
  v21 = a8;
  if (objc_msgSend(v21, "count"))
  {
    v22 = (void *)MEMORY[0x1D82510C4]();
    v27 = 0;
    v23 = _tailspinRequestShared(v16, v17, v18, v19, a5, a6, v20, v21, &v27);
    v24 = v27;
    objc_autoreleasePoolPop(v22);
    if (a9)
      *a9 = objc_retainAutorelease(v24);

  }
  else
  {
    DPLogHandle_ClientError();
    v25 = objc_claimAutoreleasedReturnValue();
    if (os_signpost_enabled(v25))
    {
      *(_WORD *)buf = 0;
    }

    if (a9)
    {
      v23 = 0;
      *a9 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v23 = 0;
    }
  }

  return v23;
}

id _clientError(void *a1)
{
  void *v1;
  __CFString *v2;
  void *v3;
  id v4;
  void *v5;
  void *v6;
  uint64_t v8;
  _QWORD v9[2];

  v9[1] = *MEMORY[0x1E0C80C00];
  v1 = (void *)MEMORY[0x1E0CB35C8];
  v2 = kDRRequestClientError;
  v8 = *MEMORY[0x1E0CB2D50];
  v9[0] = a1;
  v3 = (void *)MEMORY[0x1E0C99D80];
  v4 = a1;
  objc_msgSend(v3, "dictionaryWithObjects:forKeys:count:", v9, &v8, 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "errorWithDomain:code:userInfo:", v2, 0, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

uint64_t _sendSubmitLogMessageAndHandleReply(void *a1, void *a2, void *a3, void *a4, _QWORD *a5)
{
  char *v9;
  id v10;
  id v11;
  void *v12;
  void *v13;
  uint64_t v14;
  NSObject *v15;
  const char *string;
  NSObject *v17;
  const char *v18;
  __CFString *v19;
  void *v20;
  __CFString *v21;
  void *v22;
  uint64_t v24;
  __CFString *v25;
  int v26;
  const char *v27;
  __int16 v28;
  id v29;
  __int16 v30;
  id v31;
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  v9 = a2;
  v10 = a3;
  v11 = a4;
  _DPClientXPCSendMessageWithReplySync(a1);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = v12;
  if (!v12)
  {
    DPLogHandle_ClientXPCError();
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_signpost_enabled(v15))
    {
      v26 = 138543874;
      v27 = v9;
      v28 = 2114;
      v29 = v10;
      v30 = 2114;
      v31 = v11;
      _os_signpost_emit_unreliably_with_name_impl();
    }

    if (a5)
    {
      _clientError(CFSTR("Failed to send message to DiagnosticRequest service potentially due to missing com.apple.diagnosticpipeline.request entitlement"));
      v14 = 0;
      *a5 = (id)objc_claimAutoreleasedReturnValue();
      goto LABEL_18;
    }
LABEL_17:
    v14 = 0;
    goto LABEL_18;
  }
  if (!xpc_dictionary_get_BOOL(v12, "SubmitLog_DidSucceed"))
  {
    string = xpc_dictionary_get_string(v13, "SubmitLog_FailureReason");
    DPLogHandle_ClientError();
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_signpost_enabled(v17))
    {
      v18 = "Unknown";
      if (string)
        v18 = string;
      v26 = 136446210;
      v27 = v18;
      _os_signpost_emit_unreliably_with_name_impl();
    }

    if (a5)
    {
      if (string)
      {
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", string);
        v19 = (__CFString *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v19 = CFSTR("Unknown");
      }
      v20 = (void *)MEMORY[0x1E0CB35C8];
      v21 = kDRRequestClientError;
      v24 = *MEMORY[0x1E0CB2D50];
      v25 = v19;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v25, &v24, 1);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "errorWithDomain:code:userInfo:", v21, 0, v22);
      *a5 = (id)objc_claimAutoreleasedReturnValue();

    }
    goto LABEL_17;
  }
  v14 = 1;
LABEL_18:

  return v14;
}

uint64_t DRSubmitLog(void *a1, void *a2, void *a3, void *a4, void *a5, void *a6, uint64_t a7, _QWORD *a8)
{
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  id v20;
  uint64_t v21;
  void *v22;
  id v23;
  void *v24;
  _QWORD *v25;
  id v26;
  unsigned int v28;
  void *context;
  id v30;
  id v31;

  v15 = a1;
  v16 = a2;
  v17 = a3;
  v18 = a4;
  v19 = a5;
  v20 = a6;
  context = (void *)MEMORY[0x1D82510C4]();
  v21 = mach_continuous_time();
  v31 = 0;
  _DPCSubmitLogRequestMessage(v15, v16, v17, v18, v21, v19, v20, a7, &v31);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = v31;
  v24 = v23;
  if (v22)
  {
    v30 = v23;
    v28 = _sendSubmitLogMessageAndHandleReply(v22, v15, v16, v17, &v30);
    v25 = a8;
    v26 = v30;

    v24 = v26;
    a8 = v25;
  }
  else
  {
    v28 = 0;
  }

  objc_autoreleasePoolPop(context);
  if (a8)
    *a8 = objc_retainAutorelease(v24);

  return v28;
}

uint64_t DRSubmitLogs(void *a1, void *a2, void *a3, void *a4, void *a5, _QWORD *a6)
{
  id v11;
  id v12;
  id v13;
  id v14;
  id v15;
  void *v16;
  uint64_t v17;
  void *v18;
  id v19;
  void *v20;
  _QWORD *v21;
  id v22;
  unsigned int v24;
  id v25;
  id v26;

  v11 = a1;
  v12 = a2;
  v13 = a3;
  v14 = a4;
  v15 = a5;
  v16 = (void *)MEMORY[0x1D82510C4]();
  v17 = mach_continuous_time();
  v26 = 0;
  _DPCSubmitLogsRequestMessage(v11, v12, v13, v14, v17, v15, &v26);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = v26;
  v20 = v19;
  if (v18)
  {
    v25 = v19;
    v24 = _sendSubmitLogMessageAndHandleReply(v18, v11, v12, v13, &v25);
    v21 = a6;
    v22 = v25;

    v20 = v22;
    a6 = v21;
  }
  else
  {
    v24 = 0;
  }

  objc_autoreleasePoolPop(v16);
  if (a6)
    *a6 = objc_retainAutorelease(v20);

  return v24;
}

uint64_t DRSubmitLogToCKContainer(void *a1, void *a2, void *a3, void *a4, void *a5, void *a6, unsigned int a7, void *a8, void *a9, void *a10, void *a11, _QWORD *a12)
{
  id v19;
  id v20;
  id v21;
  id v22;
  id v23;
  id v24;
  id v25;
  void *v26;
  NSObject *v27;
  void *v28;
  void *v29;
  __CFString *v30;
  id v31;
  id v32;
  id v33;
  void *v34;
  uint64_t v35;
  NSObject *v36;
  uint64_t v37;
  void *v38;
  const __CFString *v39;
  uint64_t v40;
  void *v41;
  id v42;
  void *v43;
  id v44;
  void *v45;
  void *context;
  id v48;
  void *v49;
  id v50;
  void *v51;
  id v52;
  id v53;
  id v54;
  id v55;
  id v56;
  id v57;
  id v58;
  uint64_t v59;
  const __CFString *v60;
  int v61;
  const __CFString *v62;
  uint64_t v63;

  v63 = *MEMORY[0x1E0C80C00];
  v52 = a1;
  v55 = a2;
  v54 = a3;
  v53 = a4;
  v19 = a5;
  v20 = a6;
  v21 = a8;
  v22 = a9;
  v23 = a10;
  v24 = a11;
  v58 = 0;
  LOBYTE(a6) = DRValidateCKRecordDictionary(v24, &v58);
  v25 = v58;
  v51 = v22;
  if ((a6 & 1) == 0)
  {
    DPLogHandle_ClientError();
    v36 = objc_claimAutoreleasedReturnValue();
    if (os_signpost_enabled(v36))
    {
      objc_msgSend(v25, "localizedDescription");
      v37 = objc_claimAutoreleasedReturnValue();
      v38 = (void *)v37;
      v39 = CFSTR("Unknown error");
      if (v37)
        v39 = (const __CFString *)v37;
      v61 = 138543362;
      v62 = v39;
      _os_signpost_emit_unreliably_with_name_impl();

    }
    v28 = v52;
    v29 = v55;
    v35 = 0;
    if (a12)
      *a12 = objc_retainAutorelease(v25);
    goto LABEL_16;
  }
  objc_msgSend(v24, "objectForKeyedSubscript:", v23);
  v26 = (void *)objc_claimAutoreleasedReturnValue();

  if (v26)
  {
    DPLogHandle_ClientError();
    v27 = objc_claimAutoreleasedReturnValue();
    v28 = v52;
    v29 = v55;
    if (os_signpost_enabled(v27))
    {
      LOWORD(v61) = 0;
      _os_signpost_emit_unreliably_with_name_impl();
    }

    if (a12)
    {
      v49 = (void *)MEMORY[0x1E0CB35C8];
      v30 = kDRRequestClientError;
      v59 = *MEMORY[0x1E0CB2D50];
      v60 = CFSTR("'recordDictionary' and 'fileAssetField' collide");
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v60, &v59, 1);
      v31 = v21;
      v32 = v20;
      v33 = v19;
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v49, "errorWithDomain:code:userInfo:", v30, 0, v34);
      *a12 = (id)objc_claimAutoreleasedReturnValue();

      v19 = v33;
      v20 = v32;
      v21 = v31;
    }
    v35 = 0;
LABEL_16:
    v45 = v54;
    goto LABEL_17;
  }
  context = (void *)MEMORY[0x1D82510C4]();
  v40 = mach_continuous_time();
  v57 = 0;
  v48 = v21;
  v50 = v19;
  v28 = v52;
  _DPCSubmitLogToCKContainerRequestMessage(v52, v55, v54, v53, v40, v19, v20, a7, v21, v22, v23, v24, &v57);
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  v42 = v57;
  v43 = v42;
  if (v41)
  {
    v56 = v42;
    v35 = _sendSubmitLogMessageAndHandleReply(v41, v52, v55, v54, &v56);
    v44 = v56;

    v43 = v44;
  }
  else
  {
    v35 = 0;
  }

  objc_autoreleasePoolPop(context);
  v21 = v48;
  if (a12)
    *a12 = objc_retainAutorelease(v43);

  v45 = v54;
  v29 = v55;
  v19 = v50;
LABEL_17:

  return v35;
}

uint64_t DRSubmitRapidLog(void *a1, void *a2, void *a3, void *a4, void *a5, void *a6, uint64_t a7, _QWORD *a8)
{
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  id v20;
  uint64_t v21;
  void *v22;
  id v23;
  void *v24;
  _QWORD *v25;
  id v26;
  unsigned int v28;
  void *context;
  id v30;
  id v31;

  v15 = a1;
  v16 = a2;
  v17 = a3;
  v18 = a4;
  v19 = a5;
  v20 = a6;
  context = (void *)MEMORY[0x1D82510C4]();
  v21 = mach_continuous_time();
  v31 = 0;
  _DPCSubmitRapidLogRequestMessage(v15, v16, v17, v18, v21, v19, v20, a7, &v31);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = v31;
  v24 = v23;
  if (v22)
  {
    v30 = v23;
    v28 = _sendSubmitLogMessageAndHandleReply(v22, v15, v16, v17, &v30);
    v25 = a8;
    v26 = v30;

    v24 = v26;
    a8 = v25;
  }
  else
  {
    v28 = 0;
  }

  objc_autoreleasePoolPop(context);
  if (a8)
    *a8 = objc_retainAutorelease(v24);

  return v28;
}

uint64_t DRShouldGatherLog()
{
  return 1;
}

uint64_t DRShouldEnableLogGathering(void *a1, void *a2, void *a3, void *a4, _QWORD *a5)
{
  id v9;
  id v10;
  id v11;
  id v12;
  uint64_t v13;
  void *v14;
  id v15;
  uint64_t v16;
  void *v17;
  void *v18;
  NSObject *v19;
  NSObject *v20;
  __CFString *v21;
  NSObject *v22;
  __CFString *v23;
  unsigned __int8 v24;
  void *v25;
  unsigned __int8 uint64;
  NSObject *v27;
  __CFString *v28;
  void *v29;
  id v31;
  int v32;
  id v33;
  __int16 v34;
  id v35;
  __int16 v36;
  id v37;
  __int16 v38;
  __CFString *v39;
  uint64_t v40;

  v40 = *MEMORY[0x1E0C80C00];
  v9 = a1;
  v10 = a2;
  v11 = a3;
  v12 = a4;
  v13 = mach_continuous_time();
  v31 = 0;
  _DPCEnableLogGatheringQueryMessage(v9, v10, v12, v11, v13, &v31);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = v31;
  if (v14)
  {
    _DPClientXPCSendMessageWithReplySync(v14);
    v16 = objc_claimAutoreleasedReturnValue();
    v17 = (void *)v16;
    if (v16)
    {
      if (v16 != MEMORY[0x1E0C81260])
      {
        if (v16 == MEMORY[0x1E0C81258])
        {
          v24 = 2;
LABEL_36:

          goto LABEL_37;
        }
        if (MEMORY[0x1D8251448](v16) != MEMORY[0x1E0C812F8])
        {
          v18 = (void *)MEMORY[0x1D82513A0](v17);
          DPLogHandle_ClientXPCError();
          v19 = objc_claimAutoreleasedReturnValue();
          if (os_signpost_enabled(v19))
          {
            v32 = 136446210;
            v33 = v18;
            _os_signpost_emit_unreliably_with_name_impl();
          }

          if (v18)
            free(v18);
          goto LABEL_35;
        }
        xpc_dictionary_get_value(v17, "EnableLogGatheringQueryReply");
        v25 = (void *)objc_claimAutoreleasedReturnValue();

        if (v25)
        {
          uint64 = xpc_dictionary_get_uint64(v17, "EnableLogGatheringQueryReply");
          if (uint64 < 3uLL)
          {
            v24 = uint64;
            goto LABEL_36;
          }
          DPLogHandle_ClientXPCError();
          v27 = objc_claimAutoreleasedReturnValue();
          if (!os_signpost_enabled(v27))
            goto LABEL_46;
          if (v11)
          {
LABEL_27:
            objc_msgSend(v11, "debugDescription");
            v28 = (__CFString *)objc_claimAutoreleasedReturnValue();
            goto LABEL_44;
          }
          v28 = CFSTR("-");
        }
        else
        {
          DPLogHandle_ClientXPCError();
          v27 = objc_claimAutoreleasedReturnValue();
          if (!os_signpost_enabled(v27))
          {
LABEL_46:

            if (!a5)
              goto LABEL_35;
            _unexpectedReplyError();
            v29 = (void *)objc_claimAutoreleasedReturnValue();
            goto LABEL_34;
          }
          if (v11)
            goto LABEL_27;
          v28 = CFSTR("-");
        }
LABEL_44:
        v32 = 138544130;
        v33 = v9;
        v34 = 2114;
        v35 = v10;
        v36 = 2114;
        v37 = v12;
        v38 = 2114;
        v39 = v28;
        _os_signpost_emit_unreliably_with_name_impl();
        if (v11)

        goto LABEL_46;
      }
    }
    else
    {
      DPLogHandle_ClientXPCError();
      v22 = objc_claimAutoreleasedReturnValue();
      if (os_signpost_enabled(v22))
      {
        if (v11)
        {
          objc_msgSend(v11, "debugDescription");
          v23 = (__CFString *)objc_claimAutoreleasedReturnValue();
        }
        else
        {
          v23 = CFSTR("-");
        }
        v32 = 138544130;
        v33 = v9;
        v34 = 2114;
        v35 = v10;
        v36 = 2114;
        v37 = v12;
        v38 = 2114;
        v39 = v23;
        _os_signpost_emit_unreliably_with_name_impl();
        if (v11)

      }
    }
    if (!a5)
    {
LABEL_35:
      v24 = 3;
      goto LABEL_36;
    }
    _clientError(CFSTR("Failed to send message to DiagnosticRequest service potentially due to missing com.apple.diagnosticpipeline.request entitlement"));
    v29 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_34:
    *a5 = v29;
    goto LABEL_35;
  }
  DPLogHandle_ClientXPCError();
  v20 = objc_claimAutoreleasedReturnValue();
  if (os_signpost_enabled(v20))
  {
    if (v11)
    {
      objc_msgSend(v11, "debugDescription");
      v21 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v21 = CFSTR("-");
    }
    v32 = 138544130;
    v33 = v9;
    v34 = 2114;
    v35 = v10;
    v36 = 2114;
    v37 = v12;
    v38 = 2114;
    v39 = v21;
    _os_signpost_emit_unreliably_with_name_impl();
    if (v11)

  }
  if (a5)
    *a5 = objc_retainAutorelease(v15);
  v24 = 3;
LABEL_37:

  return v24;
}

id _unexpectedReplyError()
{
  void *v0;
  __CFString *v1;
  void *v2;
  void *v3;
  uint64_t v5;
  _QWORD v6[2];

  v6[1] = *MEMORY[0x1E0C80C00];
  v0 = (void *)MEMORY[0x1E0CB35C8];
  v1 = kDRRequestClientError;
  v5 = *MEMORY[0x1E0CB2D50];
  v6[0] = CFSTR("Received unexpected or malformed reply from DiagnosticRequest service. Please file a bug against DiagnosticPipeline | All and attach a sysdiagnose.");
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v6, &v5, 1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "errorWithDomain:code:userInfo:", v1, 0, v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

NSObject *DRGetAllLogFileURLs(_QWORD *a1)
{
  NSObject *v2;
  void *v3;
  void *v4;
  NSObject *v5;
  NSObject *v6;
  NSObject *v7;
  _QWORD v9[2];

  v9[1] = *MEMORY[0x1E0C80C00];
  if (a1)
    *a1 = 0;
  if (CFSTR("/private/var/mobile/Library/Logs/DiagnosticPipeline"))
  {
    v2 = objc_msgSend(objc_alloc(MEMORY[0x1E0C99E98]), "initFileURLWithPath:", CFSTR("/private/var/mobile/Library/Logs/DiagnosticPipeline"));
    if (v2)
    {
      objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      v9[0] = *MEMORY[0x1E0C9B5A0];
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v9, 1);
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "contentsOfDirectoryAtURL:includingPropertiesForKeys:options:error:", v2, v4, 0, a1);
      v5 = objc_claimAutoreleasedReturnValue();

      if (!a1 || !*a1)
      {
        v5 = v5;
        v7 = v5;
LABEL_17:

        goto LABEL_18;
      }
      DPLogHandle_ClientAPIError();
      v6 = objc_claimAutoreleasedReturnValue();
      if (os_signpost_enabled(v6))
        _os_signpost_emit_unreliably_with_name_impl();

    }
    else
    {
      DPLogHandle_ClientAPIError();
      v5 = objc_claimAutoreleasedReturnValue();
      if (os_signpost_enabled(v5))
        _os_signpost_emit_unreliably_with_name_impl();
    }
    v7 = 0;
    goto LABEL_17;
  }
  DPLogHandle_ClientAPIError();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_signpost_enabled(v2))
    _os_signpost_emit_unreliably_with_name_impl();
  v7 = 0;
LABEL_18:

  return v7;
}

BOOL DRCheckRapidLogSize(void *a1, _QWORD *a2)
{
  id v3;
  void *v4;
  NSObject *v5;
  void *v6;
  __CFString *v7;
  void *v8;
  const __CFString **v9;
  uint64_t *v10;
  NSObject *v11;
  void *v12;
  _BOOL8 v13;
  void *v15;
  id v16;
  void *v17;
  id v18;
  char v19;
  uint64_t v20;
  const __CFString *v21;
  uint64_t v22;
  const __CFString *v23;
  int v24;
  id v25;
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v3 = a1;
  if (a2)
    *a2 = 0;
  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = 0;
  if ((objc_msgSend(v4, "fileExistsAtPath:isDirectory:", v3, &v19) & 1) == 0)
  {
    DPLogHandle_ClientAPIError();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_signpost_enabled(v11))
    {
      v24 = 138543362;
      v25 = v3;
      _os_signpost_emit_unreliably_with_name_impl();
    }

    if (!a2)
      goto LABEL_14;
    v6 = (void *)MEMORY[0x1E0CB35C8];
    v7 = kDRRequestClientError;
    v22 = *MEMORY[0x1E0CB2D50];
    v23 = CFSTR("File does not exist");
    v8 = (void *)MEMORY[0x1E0C99D80];
    v9 = &v23;
    v10 = &v22;
    goto LABEL_13;
  }
  if (v19)
  {
    DPLogHandle_ClientAPIError();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_signpost_enabled(v5))
    {
      v24 = 138543362;
      v25 = v3;
      _os_signpost_emit_unreliably_with_name_impl();
    }

    if (!a2)
      goto LABEL_14;
    v6 = (void *)MEMORY[0x1E0CB35C8];
    v7 = kDRRequestClientError;
    v20 = *MEMORY[0x1E0CB2D50];
    v21 = CFSTR("File is a directory");
    v8 = (void *)MEMORY[0x1E0C99D80];
    v9 = &v21;
    v10 = &v20;
LABEL_13:
    objc_msgSend(v8, "dictionaryWithObjects:forKeys:count:", v9, v10, 1);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "errorWithDomain:code:userInfo:", v7, 0, v12);
    *a2 = (id)objc_claimAutoreleasedReturnValue();

LABEL_14:
    v13 = 0;
    goto LABEL_15;
  }
  v18 = 0;
  objc_msgSend(v4, "attributesOfItemAtPath:error:", v3, &v18);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = v18;
  v17 = v16;
  if (v16)
  {
    v13 = 0;
    if (a2)
      *a2 = objc_retainAutorelease(v16);
  }
  else
  {
    v13 = (unint64_t)objc_msgSend(v15, "fileSize") <= 0x6400000;
  }

LABEL_15:
  return v13;
}

void _DRRequestResetHysteresisDict()
{
  NSObject *v0;

  _hysteresisQueue();
  v0 = objc_claimAutoreleasedReturnValue();
  dispatch_sync(v0, &__block_literal_global_24_0);

}

id _hysteresisDict()
{
  if (_hysteresisDict_onceToken != -1)
    dispatch_once(&_hysteresisDict_onceToken, &__block_literal_global_35);
  return (id)_hysteresisDict_hysteresisDict;
}

BOOL DRRequestPassesTimeHysteresis(void *a1, void *a2, double a3)
{
  id v5;
  id v6;
  void *v7;
  _BOOL8 v8;
  NSObject *v9;
  _QWORD v11[4];
  id v12;
  id v13;
  uint64_t *v14;
  double v15;
  uint64_t v16;
  uint64_t *v17;
  uint64_t v18;
  char v19;

  v5 = a1;
  v6 = a2;
  v7 = v6;
  v8 = 0;
  if (v5 && v6 && a3 > 0.0)
  {
    v16 = 0;
    v17 = &v16;
    v18 = 0x2020000000;
    v19 = 0;
    _hysteresisQueue();
    v9 = objc_claimAutoreleasedReturnValue();
    v11[0] = MEMORY[0x1E0C809B0];
    v11[1] = 3221225472;
    v11[2] = __DRRequestPassesTimeHysteresis_block_invoke;
    v11[3] = &unk_1E9553798;
    v12 = v5;
    v13 = v7;
    v14 = &v16;
    v15 = a3;
    dispatch_sync(v9, v11);

    v8 = *((_BYTE *)v17 + 24) != 0;
    _Block_object_dispose(&v16, 8);
  }

  return v8;
}

void ___hysteresisQueue_block_invoke()
{
  dispatch_queue_t v0;
  void *v1;

  v0 = dispatch_queue_create("DiagnosticPipeline Client hysteresis queue", 0);
  v1 = (void *)_hysteresisQueue_hysteresisQueue;
  _hysteresisQueue_hysteresisQueue = (uint64_t)v0;

}

uint64_t ___doesPassHysteresis_block_invoke()
{
  uint64_t result;
  double v1;
  mach_timebase_info info;

  info = 0;
  result = mach_timebase_info(&info);
  v1 = 1.0;
  if (info.numer != info.denom)
    v1 = (double)info.numer / (double)info.denom;
  _doesPassHysteresis_timebaseRatio = *(_QWORD *)&v1;
  return result;
}

void ___hysteresisDict_block_invoke()
{
  id v0;
  void *v1;

  v0 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  v1 = (void *)_hysteresisDict_hysteresisDict;
  _hysteresisDict_hysteresisDict = (uint64_t)v0;

}

uint64_t _oneIsNil(uint64_t a1, uint64_t a2)
{
  return (a1 != 0) ^ (a2 != 0);
}

void sub_1D3ABAB30(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_list va;

  va_start(va, a11);
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

BOOL _argIsNonNil(uint64_t a1, uint64_t a2)
{
  NSObject *v4;
  int v6;
  uint64_t v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  if (!a1)
  {
    DPLogHandle_TaskingMessageError();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_signpost_enabled(v4))
    {
      v6 = 136446210;
      v7 = a2;
      _os_signpost_emit_with_name_impl(&dword_1D3AB0000, v4, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "DRConfigInitError", "Encountered a nil argument for '%{public}s' that should have been non-nil", (uint8_t *)&v6, 0xCu);
    }

  }
  return a1 != 0;
}

const __CFString *DRConfigStringForState(unsigned int a1)
{
  if (a1 > 3)
    return CFSTR("Unknown");
  else
    return *(&off_1E9553898 + (char)a1);
}

void _DRCConnectionStateFinalizer()
{
  NSObject *v0;

  DPLogHandle_ClientXPC();
  v0 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v0, OS_LOG_TYPE_ERROR))
    _DRCTaskingConnectionStateFinalizer_cold_1(v0);

}

void sub_1D3ABC6A8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1D3ABC814(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__0(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__0(uint64_t a1)
{

}

uint64_t _DPClientXPCSendMessage(void *a1)
{
  id v1;
  void *v2;
  uint64_t v3;

  v1 = a1;
  +[_DRCConnectionState sharedConnectionState](_DRCConnectionState, "sharedConnectionState");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "sendMessage:", v1);

  return v3;
}

id _DPClientXPCSendMessageWithReplySync(void *a1)
{
  id v1;
  void *v2;
  void *v3;
  NSObject *v4;
  id v5;

  v1 = a1;
  +[_DRCConnectionState sharedConnectionState](_DRCConnectionState, "sharedConnectionState");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "sendMessageWithReplySync:", v1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3 && MEMORY[0x1D8251448](v3) == MEMORY[0x1E0C812F8])
  {
    v5 = v3;
  }
  else
  {
    DPLogHandle_ClientXPCError();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_signpost_enabled(v4))
      _os_signpost_emit_unreliably_with_name_impl();

    v5 = 0;
  }

  return v5;
}

id _xpcArrayForStringArray(void *a1)
{
  id v1;
  xpc_object_t empty;
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  id v8;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v1 = a1;
  if (objc_msgSend(v1, "count"))
  {
    empty = xpc_array_create_empty();
    v10 = 0u;
    v11 = 0u;
    v12 = 0u;
    v13 = 0u;
    v3 = v1;
    v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    if (v4)
    {
      v5 = v4;
      v6 = *(_QWORD *)v11;
      do
      {
        v7 = 0;
        do
        {
          if (*(_QWORD *)v11 != v6)
            objc_enumerationMutation(v3);
          v8 = objc_retainAutorelease(*(id *)(*((_QWORD *)&v10 + 1) + 8 * v7));
          xpc_array_set_string(empty, 0xFFFFFFFFFFFFFFFFLL, (const char *)objc_msgSend(v8, "UTF8String", (_QWORD)v10));
          ++v7;
        }
        while (v5 != v7);
        v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
      }
      while (v5);
    }

  }
  else
  {
    empty = 0;
  }

  return empty;
}

id _DPCTailspinRequestMessage(void *a1, void *a2, void *a3, void *a4, uint64_t a5, BOOL a6, BOOL a7, void *a8, void *a9, _QWORD *a10)
{
  id v17;
  id v18;
  void *v19;
  void *v20;
  uint64_t v21;
  uint64_t v22;
  NSObject *v23;
  void *v24;
  __CFString *v25;
  void *v26;
  uint64_t v28;
  const __CFString *v29;
  int v30;
  uint64_t v31;
  __int16 v32;
  uint64_t v33;
  uint64_t v34;

  v17 = a10;
  v34 = *MEMORY[0x1E0C80C00];
  v18 = a8;
  _DPClientLogRequestBaseMessage(a1, a2, a3, a4, CFSTR("Tailspin"), a9, a5, a10);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = v19;
  if (!v19)
    goto LABEL_10;
  xpc_dictionary_set_uint64(v19, "ClientMessageType", 1uLL);
  xpc_dictionary_set_BOOL(v20, "IncludeOSSignpost", a6);
  xpc_dictionary_set_BOOL(v20, "IncludeOSLog", a7);
  v21 = mach_absolute_time();
  if (!v18)
  {
LABEL_5:
    v17 = v20;
    goto LABEL_11;
  }
  v22 = v21;
  if (objc_msgSend(v18, "unsignedLongLongValue") < v21)
  {
    xpc_dictionary_set_uint64(v20, "MinMAT", objc_msgSend(v18, "unsignedLongLongValue"));
    goto LABEL_5;
  }
  DPLogHandle_ClientError();
  v23 = objc_claimAutoreleasedReturnValue();
  if (os_signpost_enabled(v23))
  {
    v30 = 134349312;
    v31 = objc_msgSend(v18, "unsignedLongLongValue");
    v32 = 2050;
    v33 = v22;
    _os_signpost_emit_unreliably_with_name_impl();
  }

  if (a10)
  {
    v24 = (void *)MEMORY[0x1E0CB35C8];
    v25 = kDRRequestClientError;
    v28 = *MEMORY[0x1E0CB2D50];
    v29 = CFSTR("Min timestamp >= current timestamp");
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v29, &v28, 1);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "errorWithDomain:code:userInfo:", v25, 0, v26);
    *a10 = (id)objc_claimAutoreleasedReturnValue();

LABEL_10:
    v17 = 0;
  }
LABEL_11:

  return v17;
}

_QWORD *_DPClientLogRequestBaseMessage(void *a1, void *a2, void *a3, void *a4, void *a5, void *a6, uint64_t a7, _QWORD *a8)
{
  id v15;
  id v16;
  void *v17;
  NSObject *v18;
  id v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  void *v24;
  void *v25;
  void *v26;
  id v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  void *v32;
  void *v33;
  void *v34;
  xpc_object_t empty;
  void *v36;
  id v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  NSObject *v42;
  void *v43;
  __CFString *v44;
  void *v45;
  NSObject *v46;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  _BYTE v60[128];
  _BYTE v61[128];
  int v62;
  NSObject *v63;
  _BYTE v64[128];
  uint64_t v65;
  _QWORD v66[4];

  v66[1] = *MEMORY[0x1E0C80C00];
  v15 = a3;
  v16 = a6;
  _DPClientBaseMessage(a1, a2, a4, a5, a7, a8);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v17)
    goto LABEL_41;
  if (v15)
  {
    xpc_dictionary_set_string(v17, "Description", (const char *)objc_msgSend(objc_retainAutorelease(v15), "UTF8String"));
    if (!objc_msgSend(v16, "count"))
    {
LABEL_29:
      a8 = v17;
      goto LABEL_42;
    }
    v18 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v56 = 0u;
    v57 = 0u;
    v58 = 0u;
    v59 = 0u;
    v19 = v16;
    v20 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v56, v64, 16);
    if (v20)
    {
      v21 = v20;
      v22 = *(_QWORD *)v57;
      do
      {
        v23 = 0;
        do
        {
          if (*(_QWORD *)v57 != v22)
            objc_enumerationMutation(v19);
          objc_msgSend(*(id *)(*((_QWORD *)&v56 + 1) + 8 * v23), "path");
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          -[NSObject addObject:](v18, "addObject:", v24);

          ++v23;
        }
        while (v21 != v23);
        v21 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v56, v64, 16);
      }
      while (v21);
    }

    _xpcArrayForStringArray(v18);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    if (v25)
    {
      v26 = v25;
      xpc_dictionary_set_value(v17, "LogArray", v25);

      v18 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
      v52 = 0u;
      v53 = 0u;
      v54 = 0u;
      v55 = 0u;
      v27 = v19;
      v28 = objc_msgSend(v27, "countByEnumeratingWithState:objects:count:", &v52, v61, 16);
      if (v28)
      {
        v29 = v28;
        v30 = *(_QWORD *)v53;
        do
        {
          v31 = 0;
          do
          {
            if (*(_QWORD *)v53 != v30)
              objc_enumerationMutation(v27);
            objc_msgSend(*(id *)(*((_QWORD *)&v52 + 1) + 8 * v31), "sandboxExtension");
            v32 = (void *)objc_claimAutoreleasedReturnValue();
            -[NSObject addObject:](v18, "addObject:", v32);

            ++v31;
          }
          while (v29 != v31);
          v29 = objc_msgSend(v27, "countByEnumeratingWithState:objects:count:", &v52, v61, 16);
        }
        while (v29);
      }

      _xpcArrayForStringArray(v18);
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      if (v33)
      {
        v34 = v33;
        xpc_dictionary_set_value(v17, "SandboxExtensions", v33);

        empty = xpc_array_create_empty();
        if (empty)
        {
          v36 = empty;
          v50 = 0u;
          v51 = 0u;
          v48 = 0u;
          v49 = 0u;
          v37 = v27;
          v38 = objc_msgSend(v37, "countByEnumeratingWithState:objects:count:", &v48, v60, 16);
          if (v38)
          {
            v39 = v38;
            v40 = *(_QWORD *)v49;
            do
            {
              v41 = 0;
              do
              {
                if (*(_QWORD *)v49 != v40)
                  objc_enumerationMutation(v37);
                xpc_array_set_BOOL(v36, 0xFFFFFFFFFFFFFFFFLL, objc_msgSend(*(id *)(*((_QWORD *)&v48 + 1) + 8 * v41++), "transferOwnership", (_QWORD)v48));
              }
              while (v39 != v41);
              v39 = objc_msgSend(v37, "countByEnumeratingWithState:objects:count:", &v48, v60, 16);
            }
            while (v39);
          }

          xpc_dictionary_set_value(v17, "TransferOwnership", v36);
          goto LABEL_29;
        }
        DPLogHandle_ClientError();
        v18 = objc_claimAutoreleasedReturnValue();
        if (os_signpost_enabled(v18))
        {
          LOWORD(v62) = 0;
          _os_signpost_emit_unreliably_with_name_impl();
        }
        goto LABEL_40;
      }
      DPLogHandle_ClientError();
      v46 = objc_claimAutoreleasedReturnValue();
      if (os_signpost_enabled(v46))
      {
        v62 = 138543362;
        v63 = v18;
        goto LABEL_38;
      }
    }
    else
    {
      DPLogHandle_ClientError();
      v46 = objc_claimAutoreleasedReturnValue();
      if (os_signpost_enabled(v46))
      {
        v62 = 138543362;
        v63 = v18;
LABEL_38:
        _os_signpost_emit_unreliably_with_name_impl();
      }
    }

LABEL_40:
    goto LABEL_41;
  }
  DPLogHandle_ClientError();
  v42 = objc_claimAutoreleasedReturnValue();
  if (os_signpost_enabled(v42))
  {
    LOWORD(v62) = 0;
    _os_signpost_emit_unreliably_with_name_impl();
  }

  if (a8)
  {
    v43 = (void *)MEMORY[0x1E0CB35C8];
    v44 = kDRRequestClientError;
    v65 = *MEMORY[0x1E0CB2D50];
    v66[0] = CFSTR("Missing required issueDescription argument");
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v66, &v65, 1);
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v43, "errorWithDomain:code:userInfo:", v44, 0, v45);
    *a8 = (id)objc_claimAutoreleasedReturnValue();

LABEL_41:
    a8 = 0;
  }
LABEL_42:

  return a8;
}

id _DPCSubmitLogRequestMessage(void *a1, void *a2, void *a3, void *a4, uint64_t a5, void *a6, void *a7, uint64_t a8, _QWORD *a9)
{
  id v16;
  id v17;
  id v18;
  id v19;
  id v20;
  id v21;
  DRClientLog *v22;
  void *v23;
  void *v24;
  void *v25;
  id v26;
  NSObject *v27;
  void *v28;
  __CFString *v29;
  DRClientLog *v31;
  uint64_t v32;
  _QWORD v33[2];

  v33[1] = *MEMORY[0x1E0C80C00];
  v16 = a1;
  v17 = a2;
  v18 = a3;
  v19 = a4;
  v20 = a6;
  v21 = a7;
  if (v21)
  {
    v22 = -[DRClientLog initWithPath:transferOwnership:errorOut:]([DRClientLog alloc], "initWithPath:transferOwnership:errorOut:", v21, a8, a9);
    v23 = v22;
    if (v22)
    {
      v31 = v22;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v31, 1);
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      _DPClientLogRequestBaseMessage(v16, v17, v18, v19, v20, v24, a5, a9);
      v25 = (void *)objc_claimAutoreleasedReturnValue();

      if (v25)
      {
        xpc_dictionary_set_uint64(v25, "ClientMessageType", 2uLL);
        v26 = v25;
      }

    }
    else
    {
      v25 = 0;
    }
  }
  else
  {
    DPLogHandle_ClientError();
    v27 = objc_claimAutoreleasedReturnValue();
    if (os_signpost_enabled(v27))
      _os_signpost_emit_unreliably_with_name_impl();

    if (!a9)
    {
      v25 = 0;
      goto LABEL_12;
    }
    v28 = (void *)MEMORY[0x1E0CB35C8];
    v29 = kDRRequestClientError;
    v32 = *MEMORY[0x1E0CB2D50];
    v33[0] = CFSTR("Missing required logPath argument");
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v33, &v32, 1);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "errorWithDomain:code:userInfo:", v29, 0, v23);
    v25 = 0;
    *a9 = (id)objc_claimAutoreleasedReturnValue();
  }

LABEL_12:
  return v25;
}

_QWORD *_DPCSubmitLogsRequestMessage(void *a1, void *a2, void *a3, void *a4, uint64_t a5, void *a6, _QWORD *a7)
{
  id v13;
  id v14;
  id v15;
  id v16;
  id v17;
  _QWORD *v18;
  _QWORD *v19;
  NSObject *v20;
  void *v21;
  __CFString *v22;
  void *v23;
  uint64_t v25;
  _QWORD v26[2];

  v26[1] = *MEMORY[0x1E0C80C00];
  v13 = a1;
  v14 = a2;
  v15 = a3;
  v16 = a4;
  v17 = a6;
  if (objc_msgSend(v17, "count"))
  {
    _DPClientLogRequestBaseMessage(v13, v14, v15, v16, CFSTR("MultipleLogs"), v17, a5, a7);
    v18 = (_QWORD *)objc_claimAutoreleasedReturnValue();
    a7 = v18;
    if (v18)
    {
      xpc_dictionary_set_uint64(v18, "ClientMessageType", 2uLL);
      v19 = a7;
    }

  }
  else
  {
    DPLogHandle_ClientError();
    v20 = objc_claimAutoreleasedReturnValue();
    if (os_signpost_enabled(v20))
      _os_signpost_emit_unreliably_with_name_impl();

    if (a7)
    {
      v21 = (void *)MEMORY[0x1E0CB35C8];
      v22 = kDRRequestClientError;
      v25 = *MEMORY[0x1E0CB2D50];
      v26[0] = CFSTR("No logs provided");
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v26, &v25, 1);
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "errorWithDomain:code:userInfo:", v22, 0, v23);
      *a7 = (id)objc_claimAutoreleasedReturnValue();

      a7 = 0;
    }
  }

  return a7;
}

id _DPCSubmitLogToCKContainerRequestMessage(void *a1, void *a2, void *a3, void *a4, uint64_t a5, void *a6, void *a7, unsigned int a8, void *a9, void *a10, void *a11, void *a12, _QWORD *a13)
{
  id v19;
  id v20;
  id v21;
  NSObject *v22;
  void *v23;
  __CFString *v24;
  void *v25;
  void *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  id v38;
  void *v39;
  void *v40;
  void *v41;
  id v42;
  const void *v43;
  void *v44;
  id v45;
  NSObject *v46;
  void *v47;
  __CFString *v48;
  __CFString *v49;
  NSObject *v50;
  _QWORD *v51;
  void *v52;
  __CFString *v53;
  void *v54;
  const __CFString **v55;
  uint64_t *v56;
  NSObject *v57;
  NSObject *v58;
  NSObject *v59;
  __CFString *v60;
  id v63;
  id v64;
  id v65;
  id v66;
  id v67;
  id v68;
  id v69;
  id v70;
  id v71;
  __int128 v72;
  __int128 v73;
  __int128 v74;
  __int128 v75;
  uint64_t v76;
  const __CFString *v77;
  uint64_t v78;
  const __CFString *v79;
  uint64_t v80;
  const __CFString *v81;
  uint64_t v82;
  const __CFString *v83;
  uint64_t v84;
  const __CFString *v85;
  int v86;
  uint64_t v87;
  _BYTE v88[128];
  uint64_t v89;
  _QWORD v90[3];

  v90[1] = *MEMORY[0x1E0C80C00];
  v67 = a1;
  v19 = a2;
  v65 = a3;
  v64 = a4;
  v70 = a6;
  v69 = a7;
  v20 = a9;
  v68 = a10;
  v66 = a11;
  v21 = a12;
  if (!objc_msgSend(v21, "count"))
  {
    DPLogHandle_ClientError();
    v22 = objc_claimAutoreleasedReturnValue();
    if (os_signpost_enabled(v22))
    {
      LOWORD(v86) = 0;
      _os_signpost_emit_unreliably_with_name_impl();
    }

    if (a13)
    {
      v23 = (void *)MEMORY[0x1E0CB35C8];
      v24 = kDRRequestClientError;
      v89 = *MEMORY[0x1E0CB2D50];
      v90[0] = CFSTR("'recordDictionary' contains no keys");
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v90, &v89, 1);
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "errorWithDomain:code:userInfo:", v24, 0, v25);
      *a13 = (id)objc_claimAutoreleasedReturnValue();

    }
  }
  v74 = 0u;
  v75 = 0u;
  v72 = 0u;
  v73 = 0u;
  objc_msgSend(v21, "allKeys");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  v27 = objc_msgSend(v26, "countByEnumeratingWithState:objects:count:", &v72, v88, 16);
  if (!v27)
  {
LABEL_14:

    v32 = v67;
    v33 = v19;
    v34 = v19;
    v36 = v64;
    v35 = v65;
    _DPCSubmitLogRequestMessage(v67, v34, v65, v64, a5, v70, v69, a8, a13);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    if (v26)
    {
      if (v20)
      {
        if (v68)
        {
          if (v66)
          {
            if (v21)
            {
              v71 = 0;
              _DPCConvertDictionaryToPlistData(v21, CFSTR("Record dictionary"), &v71);
              v37 = (void *)objc_claimAutoreleasedReturnValue();
              v38 = v71;
              v39 = v38;
              v40 = v37;
              if (v37)
              {
                v63 = v37;
                xpc_dictionary_set_uint64(v26, "ClientMessageType", 4uLL);
                v41 = v20;
                xpc_dictionary_set_string(v26, "containerName", (const char *)objc_msgSend(objc_retainAutorelease(v20), "UTF8String"));
                xpc_dictionary_set_string(v26, "RecordType", (const char *)objc_msgSend(objc_retainAutorelease(v68), "UTF8String"));
                xpc_dictionary_set_string(v26, "FileAssetField", (const char *)objc_msgSend(objc_retainAutorelease(v66), "UTF8String"));
                v42 = objc_retainAutorelease(v37);
                v43 = (const void *)objc_msgSend(v42, "bytes");
                v44 = v42;
                v32 = v67;
                xpc_dictionary_set_data(v26, "RecordDictionaryData", v43, objc_msgSend(v44, "length"));
                v45 = v26;
              }
              else
              {
                v41 = v20;
                if (!a13)
                {
                  v45 = 0;
                  goto LABEL_48;
                }
                v63 = 0;
                v45 = 0;
                *a13 = objc_retainAutorelease(v38);
              }
              v40 = v63;
LABEL_48:

              goto LABEL_49;
            }
            DPLogHandle_ClientError();
            v59 = objc_claimAutoreleasedReturnValue();
            if (os_signpost_enabled(v59))
            {
              LOWORD(v86) = 0;
              _os_signpost_emit_unreliably_with_name_impl();
            }
            v41 = v20;

            v51 = a13;
            if (a13)
            {
              v52 = (void *)MEMORY[0x1E0CB35C8];
              v53 = kDRRequestClientError;
              v76 = *MEMORY[0x1E0CB2D50];
              v77 = CFSTR("Missing required 'recordDictionary' argument");
              v54 = (void *)MEMORY[0x1E0C99D80];
              v55 = &v77;
              v56 = &v76;
              goto LABEL_44;
            }
LABEL_27:
            v45 = 0;
            goto LABEL_50;
          }
          DPLogHandle_ClientError();
          v58 = objc_claimAutoreleasedReturnValue();
          if (os_signpost_enabled(v58))
          {
            LOWORD(v86) = 0;
            _os_signpost_emit_unreliably_with_name_impl();
          }
          v41 = v20;

          v51 = a13;
          if (!a13)
            goto LABEL_27;
          v52 = (void *)MEMORY[0x1E0CB35C8];
          v53 = kDRRequestClientError;
          v78 = *MEMORY[0x1E0CB2D50];
          v79 = CFSTR("Missing required 'fileAssetField' argument");
          v54 = (void *)MEMORY[0x1E0C99D80];
          v55 = &v79;
          v56 = &v78;
        }
        else
        {
          DPLogHandle_ClientError();
          v57 = objc_claimAutoreleasedReturnValue();
          if (os_signpost_enabled(v57))
          {
            LOWORD(v86) = 0;
            _os_signpost_emit_unreliably_with_name_impl();
          }
          v41 = v20;

          v51 = a13;
          if (!a13)
            goto LABEL_27;
          v52 = (void *)MEMORY[0x1E0CB35C8];
          v53 = kDRRequestClientError;
          v80 = *MEMORY[0x1E0CB2D50];
          v81 = CFSTR("Missing required 'recordType' argument");
          v54 = (void *)MEMORY[0x1E0C99D80];
          v55 = &v81;
          v56 = &v80;
        }
      }
      else
      {
        DPLogHandle_ClientError();
        v50 = objc_claimAutoreleasedReturnValue();
        if (os_signpost_enabled(v50))
        {
          LOWORD(v86) = 0;
          _os_signpost_emit_unreliably_with_name_impl();
        }
        v41 = 0;

        v51 = a13;
        if (!a13)
          goto LABEL_27;
        v52 = (void *)MEMORY[0x1E0CB35C8];
        v53 = kDRRequestClientError;
        v82 = *MEMORY[0x1E0CB2D50];
        v83 = CFSTR("Missing required 'targetCKContainer' argument");
        v54 = (void *)MEMORY[0x1E0C99D80];
        v55 = &v83;
        v56 = &v82;
      }
LABEL_44:
      objc_msgSend(v54, "dictionaryWithObjects:forKeys:count:", v55, v56, 1);
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      v60 = v53;
      v32 = v67;
      objc_msgSend(v52, "errorWithDomain:code:userInfo:", v60, 0, v39);
      v45 = 0;
      *v51 = (id)objc_claimAutoreleasedReturnValue();
LABEL_49:

      goto LABEL_50;
    }
    v41 = v20;
    goto LABEL_27;
  }
  v28 = v27;
  v29 = *(_QWORD *)v73;
LABEL_8:
  v30 = 0;
  while (1)
  {
    if (*(_QWORD *)v73 != v29)
      objc_enumerationMutation(v26);
    v31 = *(_QWORD *)(*((_QWORD *)&v72 + 1) + 8 * v30);
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
      break;
    if (v28 == ++v30)
    {
      v28 = objc_msgSend(v26, "countByEnumeratingWithState:objects:count:", &v72, v88, 16);
      if (v28)
        goto LABEL_8;
      goto LABEL_14;
    }
  }
  DPLogHandle_ClientError();
  v46 = objc_claimAutoreleasedReturnValue();
  if (os_signpost_enabled(v46))
  {
    v86 = 138543362;
    v87 = v31;
    _os_signpost_emit_unreliably_with_name_impl();
  }
  v41 = v20;

  v32 = v67;
  v33 = v19;
  if (a13)
  {
    v47 = (void *)MEMORY[0x1E0CB35C8];
    v48 = kDRRequestClientError;
    v84 = *MEMORY[0x1E0CB2D50];
    v85 = CFSTR("Invalid 'recordDictionary' key");
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v85, &v84, 1);
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    v49 = v48;
    v32 = v67;
    objc_msgSend(v47, "errorWithDomain:code:userInfo:", v49, 0, v39);
    v45 = 0;
    *a13 = (id)objc_claimAutoreleasedReturnValue();
    v36 = v64;
    v35 = v65;
    goto LABEL_49;
  }
  v45 = 0;
  v36 = v64;
  v35 = v65;
LABEL_50:

  return v45;
}

id _DPCConvertDictionaryToPlistData(void *a1, void *a2, _QWORD *a3)
{
  id v5;
  id v6;
  id v7;
  id v8;
  NSObject *v9;
  void *v10;
  id v11;
  uint64_t v12;
  void *v13;
  const __CFString *v14;
  void *v15;
  void *v16;
  __CFString *v17;
  void *v18;
  void *v19;
  NSObject *v20;
  objc_class *v21;
  void *v22;
  __CFString *v23;
  id v25;
  uint64_t v26;
  void *v27;
  uint64_t v28;
  id v29;
  int v30;
  id v31;
  __int16 v32;
  id v33;
  uint64_t v34;

  v34 = *MEMORY[0x1E0C80C00];
  v5 = a1;
  v6 = a2;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v25 = 0;
    objc_msgSend(MEMORY[0x1E0CB38B0], "dataWithPropertyList:format:options:error:", v5, 200, 0, &v25);
    v7 = (id)objc_claimAutoreleasedReturnValue();
    v8 = v25;
    if (v8)
    {
      DPLogHandle_ClientError();
      v9 = objc_claimAutoreleasedReturnValue();
      if (os_signpost_enabled(v9))
      {
        objc_msgSend(v8, "localizedDescription");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v30 = 138543618;
        v31 = v6;
        v32 = 2114;
        v33 = v10;
        _os_signpost_emit_unreliably_with_name_impl();

      }
      v11 = objc_alloc(MEMORY[0x1E0CB3940]);
      objc_msgSend(v8, "localizedDescription");
      v12 = objc_claimAutoreleasedReturnValue();
      v13 = (void *)v12;
      v14 = CFSTR("Unknown");
      if (v12)
        v14 = (const __CFString *)v12;
      v15 = (void *)objc_msgSend(v11, "initWithFormat:", CFSTR("Could not serialize %@ due to error: %@"), v6, v14);

      v16 = (void *)MEMORY[0x1E0CB35C8];
      v17 = kDRRequestClientError;
      v26 = *MEMORY[0x1E0CB2D50];
      v27 = v15;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v27, &v26, 1);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "errorWithDomain:code:userInfo:", v17, 0, v18);
      *a3 = (id)objc_claimAutoreleasedReturnValue();

      v19 = 0;
    }
    else
    {
      v7 = v7;
      v19 = v7;
    }
  }
  else
  {
    DPLogHandle_ClientError();
    v20 = objc_claimAutoreleasedReturnValue();
    if (os_signpost_enabled(v20))
    {
      v21 = (objc_class *)objc_opt_class();
      NSStringFromClass(v21);
      v30 = 138543618;
      v31 = v6;
      v32 = 2114;
      v33 = (id)objc_claimAutoreleasedReturnValue();
      _os_signpost_emit_unreliably_with_name_impl();

    }
    if (!a3)
    {
      v19 = 0;
      goto LABEL_14;
    }
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@ object is not a dictionary"), v6);
    v8 = (id)objc_claimAutoreleasedReturnValue();
    v22 = (void *)MEMORY[0x1E0CB35C8];
    v23 = kDRRequestClientError;
    v28 = *MEMORY[0x1E0CB2D50];
    v29 = v8;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v29, &v28, 1);
    v7 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "errorWithDomain:code:userInfo:", v23, 0, v7);
    v19 = 0;
    *a3 = (id)objc_claimAutoreleasedReturnValue();
  }

LABEL_14:
  return v19;
}

id _DPCSubmitRapidLogRequestMessage(void *a1, void *a2, void *a3, void *a4, uint64_t a5, void *a6, void *a7, uint64_t a8, _QWORD *a9)
{
  void *v9;
  void *v10;
  id v11;

  _DPCSubmitLogRequestMessage(a1, a2, a3, a4, a5, a6, a7, a8, a9);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v9;
  if (v9)
  {
    xpc_dictionary_set_uint64(v9, "ClientMessageType", 5uLL);
    v11 = v10;
  }

  return v10;
}

id _DPCEnableLogGatheringQueryMessage(void *a1, void *a2, void *a3, void *a4, uint64_t a5, _QWORD *a6)
{
  void *v6;
  void *v7;
  id v8;

  _DPClientBaseMessage(a1, a2, a4, a3, a5, a6);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (v6)
  {
    xpc_dictionary_set_uint64(v6, "ClientMessageType", 3uLL);
    v8 = v7;
  }

  return v7;
}

_QWORD *_DPClientBaseMessage(void *a1, void *a2, void *a3, void *a4, uint64_t a5, _QWORD *a6)
{
  id v11;
  id v12;
  id v13;
  id v14;
  xpc_object_t v15;
  void *v16;
  id v17;
  void *v18;
  NSObject *v19;
  void *v20;
  NSObject *v21;
  void *v22;
  __CFString *v23;
  void *v24;
  const __CFString **v25;
  uint64_t *v26;
  NSObject *v27;
  NSObject *v28;
  objc_class *v29;
  void *v30;
  id v32;
  __CFString *v33;
  void *v34;
  id v35;
  uint64_t v36;
  __CFString *v37;
  uint64_t v38;
  const __CFString *v39;
  int v40;
  id v41;
  uint64_t v42;
  const __CFString *v43;
  uint64_t v44;
  const __CFString *v45;
  uint64_t v46;
  _QWORD v47[2];

  v47[1] = *MEMORY[0x1E0C80C00];
  v11 = a1;
  v12 = a2;
  v13 = a3;
  v14 = a4;
  v15 = xpc_dictionary_create(0, 0, 0);
  if (!v11)
  {
    DPLogHandle_ClientError();
    v21 = objc_claimAutoreleasedReturnValue();
    if (os_signpost_enabled(v21))
    {
      LOWORD(v40) = 0;
      _os_signpost_emit_unreliably_with_name_impl();
    }

    if (!a6)
      goto LABEL_28;
    v22 = (void *)MEMORY[0x1E0CB35C8];
    v23 = kDRRequestClientError;
    v46 = *MEMORY[0x1E0CB2D50];
    v47[0] = CFSTR("Missing required teamIdentifier argument");
    v24 = (void *)MEMORY[0x1E0C99D80];
    v25 = (const __CFString **)v47;
    v26 = &v46;
LABEL_26:
    objc_msgSend(v24, "dictionaryWithObjects:forKeys:count:", v25, v26, 1);
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "errorWithDomain:code:userInfo:", v23, 0, v30);
    *a6 = (id)objc_claimAutoreleasedReturnValue();

LABEL_27:
    a6 = 0;
    goto LABEL_28;
  }
  if (!v12)
  {
    DPLogHandle_ClientError();
    v27 = objc_claimAutoreleasedReturnValue();
    if (os_signpost_enabled(v27))
    {
      LOWORD(v40) = 0;
      _os_signpost_emit_unreliably_with_name_impl();
    }

    if (!a6)
      goto LABEL_28;
    v22 = (void *)MEMORY[0x1E0CB35C8];
    v23 = kDRRequestClientError;
    v44 = *MEMORY[0x1E0CB2D50];
    v45 = CFSTR("Missing required issueCategory argument");
    v24 = (void *)MEMORY[0x1E0C99D80];
    v25 = &v45;
    v26 = &v44;
    goto LABEL_26;
  }
  if (!v14)
  {
    if (!a6)
      goto LABEL_28;
    v22 = (void *)MEMORY[0x1E0CB35C8];
    v23 = kDRRequestClientError;
    v42 = *MEMORY[0x1E0CB2D50];
    v43 = CFSTR("Missing required logType argument");
    v24 = (void *)MEMORY[0x1E0C99D80];
    v25 = &v43;
    v26 = &v42;
    goto LABEL_26;
  }
  xpc_dictionary_set_string(v15, "TeamID", (const char *)objc_msgSend(objc_retainAutorelease(v11), "UTF8String"));
  xpc_dictionary_set_string(v15, "Category", (const char *)objc_msgSend(objc_retainAutorelease(v12), "UTF8String"));
  xpc_dictionary_set_string(v15, "LogType", (const char *)objc_msgSend(objc_retainAutorelease(v14), "UTF8String"));
  xpc_dictionary_set_uint64(v15, "RequestMCT", a5);
  if (!v13)
    goto LABEL_33;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v35 = 0;
    _DPCConvertDictionaryToPlistData(v13, CFSTR("Context dictionary"), &v35);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = v35;
    v18 = v17;
    if (!v16)
    {
      if (a6)
        *a6 = objc_retainAutorelease(v17);
      goto LABEL_31;
    }
    if ((unint64_t)objc_msgSend(v16, "length") >= 0x800)
    {
      DPLogHandle_ClientError();
      v19 = objc_claimAutoreleasedReturnValue();
      if (os_signpost_enabled(v19))
      {
        LOWORD(v40) = 0;
        _os_signpost_emit_unreliably_with_name_impl();
      }

      if (a6)
      {
        v34 = (void *)MEMORY[0x1E0CB35C8];
        v33 = kDRRequestClientError;
        v36 = *MEMORY[0x1E0CB2D50];
        v37 = kDRRequestOversizedContextDictErrorString;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v37, &v36, 1);
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v34, "errorWithDomain:code:userInfo:", v33, 0, v20);
        *a6 = (id)objc_claimAutoreleasedReturnValue();

      }
LABEL_31:

      goto LABEL_27;
    }
    v32 = objc_retainAutorelease(v16);
    xpc_dictionary_set_data(v15, "ContextDict", (const void *)objc_msgSend(v32, "bytes"), objc_msgSend(v32, "length"));

LABEL_33:
    a6 = v15;
    goto LABEL_28;
  }
  DPLogHandle_ClientError();
  v28 = objc_claimAutoreleasedReturnValue();
  if (os_signpost_enabled(v28))
  {
    v29 = (objc_class *)objc_opt_class();
    NSStringFromClass(v29);
    v40 = 138543362;
    v41 = (id)objc_claimAutoreleasedReturnValue();
    _os_signpost_emit_unreliably_with_name_impl();

  }
  if (a6)
  {
    v22 = (void *)MEMORY[0x1E0CB35C8];
    v23 = kDRRequestClientError;
    v38 = *MEMORY[0x1E0CB2D50];
    v39 = CFSTR("Context dictionary object is not a dictionary");
    v24 = (void *)MEMORY[0x1E0C99D80];
    v25 = &v39;
    v26 = &v38;
    goto LABEL_26;
  }
LABEL_28:

  return a6;
}

id _DPCEnableLogGatheringQueryResultInjectionMessage(void *a1, void *a2, void *a3, void *a4, uint64_t a5, unsigned int a6, _QWORD *a7)
{
  void *v8;
  void *v9;
  id v10;

  _DPClientBaseMessage(a1, a2, a4, a3, a5, a7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v8;
  if (v8)
  {
    xpc_dictionary_set_uint64(v8, "ClientMessageType", 0x68uLL);
    xpc_dictionary_set_uint64(v9, "InjectEnableLogGatheringQueryInjectedResult", a6);
    v10 = v9;
  }

  return v9;
}

uint64_t _DRCSetDampeningIsEnabled(BOOL a1, uint64_t a2)
{
  xpc_object_t v4;
  void *v5;
  uint64_t v6;

  v4 = xpc_dictionary_create(0, 0, 0);
  v5 = v4;
  if (v4)
  {
    xpc_dictionary_set_uint64(v4, "ClientMessageType", 0x64uLL);
    xpc_dictionary_set_BOOL(v5, "DampeningEnabled", a1);
    v6 = _sendAdminRequestMessage_WaitForReply(v5, a2);
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

uint64_t _sendAdminRequestMessage_WaitForReply(void *a1, uint64_t a2)
{
  void *v3;
  void *v4;
  NSObject *v5;
  void *v6;
  __CFString *v7;
  __CFString *v8;
  const char *string;
  NSObject *v10;
  const char *v11;
  void *v12;
  __CFString *v13;
  void *v14;
  uint64_t v16;
  __CFString *v17;
  uint8_t buf[4];
  const char *v19;
  uint64_t v20;
  _QWORD v21[2];

  v21[1] = *MEMORY[0x1E0C80C00];
  _DPClientXPCSendMessageWithReplySync(a1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
  {
    if (xpc_dictionary_get_BOOL(v3, "AdminRequest_Reply"))
    {
      a2 = 1;
      goto LABEL_18;
    }
    string = xpc_dictionary_get_string(v4, "AdminRequest_RejectionReason");
    DPLogHandle_AdminError();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_signpost_enabled(v10))
    {
      v11 = "Unknown";
      if (string)
        v11 = string;
      *(_DWORD *)buf = 136446210;
      v19 = v11;
      _os_signpost_emit_with_name_impl(&dword_1D3AB0000, v10, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "AdminRequestRejected", "Rejected due to reason: %{public}s", buf, 0xCu);
    }

    if (a2)
    {
      if (string)
      {
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", string);
        v8 = (__CFString *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v8 = CFSTR("Unknown");
      }
      v12 = (void *)MEMORY[0x1E0CB35C8];
      v13 = kDRRequestClientError;
      v16 = *MEMORY[0x1E0CB2D50];
      v17 = v8;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v17, &v16, 1);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "errorWithDomain:code:userInfo:", v13, 0, v14);
      *(_QWORD *)a2 = (id)objc_claimAutoreleasedReturnValue();

      goto LABEL_17;
    }
  }
  else
  {
    DPLogHandle_AdminError();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_signpost_enabled(v5))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_1D3AB0000, v5, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "AdminRequestFailed", "Failed due to invalid/interrupted service connection", buf, 2u);
    }

    if (a2)
    {
      v6 = (void *)MEMORY[0x1E0CB35C8];
      v7 = kDRRequestClientError;
      v20 = *MEMORY[0x1E0CB2D50];
      v21[0] = CFSTR("Invalid/interrupted service connection");
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v21, &v20, 1);
      v8 = (__CFString *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "errorWithDomain:code:userInfo:", v7, 0, v8);
      *(_QWORD *)a2 = (id)objc_claimAutoreleasedReturnValue();
LABEL_17:

      a2 = 0;
    }
  }
LABEL_18:

  return a2;
}

uint64_t _DRCResetDampeningConfigurationToDefault(uint64_t a1)
{
  xpc_object_t v2;
  void *v3;
  uint64_t v4;

  v2 = xpc_dictionary_create(0, 0, 0);
  v3 = v2;
  if (v2)
  {
    xpc_dictionary_set_uint64(v2, "ClientMessageType", 0x65uLL);
    v4 = _sendAdminRequestMessage_WaitForReply(v3, a1);
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

uint64_t _DRCSetDampeningConfigurationDefaults(void *a1, void *a2, void *a3, void *a4, void *a5, void *a6, void *a7, void *a8, void *a9, void *a10, void *a11, uint64_t a12)
{
  id v19;
  id v20;
  id v21;
  id v22;
  id v23;
  id v24;
  xpc_object_t v25;
  void *v26;
  void *v27;
  void *v28;
  double v29;
  double v30;
  uint64_t v31;
  id v33;
  id v34;
  id v35;
  id v36;
  id v37;

  v33 = a1;
  v37 = a2;
  v36 = a3;
  v35 = a4;
  v34 = a5;
  v19 = a6;
  v20 = a7;
  v21 = a8;
  v22 = a9;
  v23 = a10;
  v24 = a11;
  v25 = xpc_dictionary_create(0, 0, 0);
  v26 = v25;
  if (v25)
  {
    xpc_dictionary_set_uint64(v25, "ClientMessageType", 0x66uLL);
    v27 = v33;
    if (v33)
      xpc_dictionary_set_BOOL(v26, "EnforceResourceHysteresis", objc_msgSend(v33, "BOOLValue"));
    v28 = v37;
    if (v37)
      xpc_dictionary_set_BOOL(v26, "EnforceResourceCap", objc_msgSend(v37, "BOOLValue"));
    if (v36)
      xpc_dictionary_set_BOOL(v26, "EnforceResourceDownsampling", objc_msgSend(v36, "BOOLValue"));
    if (v35)
      xpc_dictionary_set_BOOL(v26, "EnforceSignatureHysteresis", objc_msgSend(v35, "BOOLValue"));
    if (v34)
      xpc_dictionary_set_BOOL(v26, "EnforceSignatureCap", objc_msgSend(v34, "BOOLValue"));
    if (v20)
      xpc_dictionary_set_BOOL(v26, "EnforceTotalCap", objc_msgSend(v20, "BOOLValue"));
    if (v19)
      xpc_dictionary_set_BOOL(v26, "EnforceSignatureDownsampling", objc_msgSend(v19, "BOOLValue"));
    if (v22)
      xpc_dictionary_set_uint64(v26, "DefaultSignatureCap", objc_msgSend(v22, "unsignedIntegerValue"));
    if (v24)
      xpc_dictionary_set_uint64(v26, "TotalCap", objc_msgSend(v24, "unsignedIntegerValue"));
    if (v21)
    {
      objc_msgSend(v21, "doubleValue");
      v28 = v37;
      xpc_dictionary_set_double(v26, "DefaultSignatureHysteresis", v29);
    }
    if (v23)
    {
      objc_msgSend(v23, "doubleValue");
      v28 = v37;
      xpc_dictionary_set_double(v26, "AcceptanceRate", v30);
    }
    v31 = _sendAdminRequestMessage_WaitForReply(v26, a12);
  }
  else
  {
    v31 = 0;
    v27 = v33;
    v28 = v37;
  }

  return v31;
}

uint64_t _DPCRefreshDampeningConfiguration(_QWORD *a1)
{
  xpc_object_t v2;
  void *v3;
  uint64_t v4;
  void *v5;
  __CFString *v6;
  void *v7;
  uint64_t v9;
  _QWORD v10[2];

  v10[1] = *MEMORY[0x1E0C80C00];
  v2 = xpc_dictionary_create(0, 0, 0);
  v3 = v2;
  if (v2)
  {
    xpc_dictionary_set_uint64(v2, "ClientMessageType", 0x6AuLL);
    v4 = _sendAdminRequestMessage_WaitForReply(v3, (uint64_t)a1);
  }
  else
  {
    v5 = (void *)MEMORY[0x1E0CB35C8];
    v6 = kDRRequestClientError;
    v9 = *MEMORY[0x1E0CB2D50];
    v10[0] = CFSTR("Failed to create message");
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v10, &v9, 1);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "errorWithDomain:code:userInfo:", v6, 0, v7);
    *a1 = (id)objc_claimAutoreleasedReturnValue();

    v4 = 0;
  }

  return v4;
}

uint64_t _DRCTriggerCloudKitWork(BOOL a1, BOOL a2, uint64_t a3)
{
  xpc_object_t v6;
  void *v7;
  uint64_t v8;

  v6 = xpc_dictionary_create(0, 0, 0);
  v7 = v6;
  if (v6)
  {
    xpc_dictionary_set_uint64(v6, "ClientMessageType", 0x67uLL);
    xpc_dictionary_set_BOOL(v7, "isExpedited", a1);
    xpc_dictionary_set_BOOL(v7, "isAsync", a2);
    v8 = _sendAdminRequestMessage_WaitForReply(v7, a3);
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

uint64_t _DPCInjectEnableLogGatheringQueryResult(void *a1, void *a2, void *a3, void *a4, unsigned int a5, id *a6)
{
  id v11;
  id v12;
  id v13;
  id v14;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  __CFString *v18;
  uint64_t v19;
  void *v20;
  __CFString *v21;
  NSObject *v22;
  int v24;
  __CFString *v25;
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v11 = a4;
  v12 = a3;
  v13 = a2;
  v14 = a1;
  v15 = mach_continuous_time();
  _DPCEnableLogGatheringQueryResultInjectionMessage(v14, v13, v12, v11, v15, a5, a6);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  if (v16)
  {
    v17 = _sendAdminRequestMessage_WaitForReply(v16, (uint64_t)a6);
  }
  else
  {
    v18 = CFSTR("Unknown");
    if (a6)
    {
      objc_msgSend(*a6, "localizedDescription");
      v19 = objc_claimAutoreleasedReturnValue();
      v20 = (void *)v19;
      if (v19)
        v21 = (__CFString *)v19;
      else
        v21 = CFSTR("Unknown");
      v18 = v21;

    }
    DPLogHandle_AdminError();
    v22 = objc_claimAutoreleasedReturnValue();
    if (os_signpost_enabled(v22))
    {
      v24 = 138543362;
      v25 = v18;
      _os_signpost_emit_with_name_impl(&dword_1D3AB0000, v22, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "InjectEnableLogGatheringQueryResultFailure", "Failed due to error: %{public}@", (uint8_t *)&v24, 0xCu);
    }

    v17 = 0;
  }

  return v17;
}

uint64_t _DPCTriggerRequestClean(_BOOL4 a1, BOOL a2, uint64_t a3)
{
  xpc_object_t v6;
  void *v7;
  uint64_t v8;

  v6 = xpc_dictionary_create(0, 0, 0);
  v7 = v6;
  if (v6)
  {
    if (a1 && a2)
    {
      v8 = 1;
    }
    else
    {
      xpc_dictionary_set_uint64(v6, "ClientMessageType", 0x69uLL);
      xpc_dictionary_set_BOOL(v7, "KeepRequestRecords", a1);
      xpc_dictionary_set_BOOL(v7, "KeepRequestLogs", a2);
      v8 = _sendAdminRequestMessage_WaitForReply(v7, a3);
    }
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

uint64_t _getCKConfig(int a1, BOOL *a2, BOOL *a3, BOOL *a4, _QWORD *a5)
{
  xpc_object_t v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;

  v10 = xpc_dictionary_create(0, 0, 0);
  v11 = v10;
  if (a1)
    v12 = 109;
  else
    v12 = 108;
  xpc_dictionary_set_uint64(v10, "ClientMessageType", v12);
  v13 = _sendCKConfigMessageAndHandleReply(v11, a2, a3, a4, a5);

  return v13;
}

uint64_t _sendCKConfigMessageAndHandleReply(void *a1, BOOL *a2, BOOL *a3, BOOL *a4, _QWORD *a5)
{
  uint64_t v5;
  void *v9;
  void *v10;
  id v11;
  char *v12;
  NSObject *v13;
  const char *v14;
  const char *v15;
  const char *v16;
  uint64_t v17;
  void *v18;
  uint64_t v19;
  void *v20;
  void *v21;
  const char *v22;
  void *v23;
  __CFString *v24;
  void *v25;
  uint64_t v27;
  const __CFString *v28;
  uint8_t buf[4];
  const char *v30;
  uint64_t v31;

  v5 = (uint64_t)a5;
  v31 = *MEMORY[0x1E0C80C00];
  _sendAdminRequestMessage_GetReply(a1, a5);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v9;
  if (!v9)
    goto LABEL_21;
  v11 = v9;
  if (MEMORY[0x1D8251448]() != MEMORY[0x1E0C812F8])
  {
    v12 = (char *)MEMORY[0x1D82513A0](v11);
    DPLogHandle_ClientXPCError();
    v13 = objc_claimAutoreleasedReturnValue();
    if (!os_signpost_enabled(v13))
      goto LABEL_17;
    v14 = "Unknown";
    if (v12)
      v14 = v12;
    *(_DWORD *)buf = 136446210;
    v30 = v14;
    v15 = "InvalidCKConfigReplyType";
    v16 = "Unexpected reply type: %{public}s";
    goto LABEL_16;
  }
  xpc_dictionary_get_value(v11, "ContainerEnv");
  v17 = objc_claimAutoreleasedReturnValue();
  if (v17)
  {
    v18 = (void *)v17;
    xpc_dictionary_get_value(v11, "RapidEnv");
    v19 = objc_claimAutoreleasedReturnValue();
    if (v19)
    {
      v20 = (void *)v19;
      xpc_dictionary_get_value(v11, "OverridesDefault");
      v21 = (void *)objc_claimAutoreleasedReturnValue();

      if (v21)
      {

        *a2 = xpc_dictionary_get_BOOL(v11, "ContainerEnv");
        *a3 = xpc_dictionary_get_BOOL(v11, "RapidEnv");
        *a4 = xpc_dictionary_get_BOOL(v11, "OverridesDefault");
        v5 = 1;
        goto LABEL_22;
      }
    }
    else
    {

    }
  }
  v12 = (char *)MEMORY[0x1D82513A0](v11);
  DPLogHandle_ClientXPCError();
  v13 = objc_claimAutoreleasedReturnValue();
  if (os_signpost_enabled(v13))
  {
    v22 = "Unknown";
    if (v12)
      v22 = v12;
    *(_DWORD *)buf = 136446210;
    v30 = v22;
    v15 = "CKConfigMissingKeys";
    v16 = "Missing required keys from reply: %{public}s";
LABEL_16:
    _os_signpost_emit_with_name_impl(&dword_1D3AB0000, v13, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, v15, v16, buf, 0xCu);
  }
LABEL_17:

  if (v12)
    free(v12);

  if (v5)
  {
    v23 = (void *)MEMORY[0x1E0CB35C8];
    v24 = kDRRequestClientError;
    v27 = *MEMORY[0x1E0CB2D50];
    v28 = CFSTR("Invalid reply");
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v28, &v27, 1);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "errorWithDomain:code:userInfo:", v24, 0, v25);
    *(_QWORD *)v5 = (id)objc_claimAutoreleasedReturnValue();

LABEL_21:
    v5 = 0;
  }
LABEL_22:

  return v5;
}

uint64_t _DPCResetCKConfig(BOOL *a1, BOOL *a2, BOOL *a3, _QWORD *a4)
{
  return _getCKConfig(1, a1, a2, a3, a4);
}

uint64_t _DPCGetCKConfig(BOOL *a1, BOOL *a2, BOOL *a3, _QWORD *a4)
{
  return _getCKConfig(0, a1, a2, a3, a4);
}

uint64_t _DPCSetCKConfig(BOOL a1, BOOL a2, BOOL *a3, BOOL *a4, BOOL *a5, _QWORD *a6)
{
  xpc_object_t v12;
  uint64_t v13;

  v12 = xpc_dictionary_create(0, 0, 0);
  xpc_dictionary_set_uint64(v12, "ClientMessageType", 0x6BuLL);
  xpc_dictionary_set_BOOL(v12, "ContainerEnv", a1);
  xpc_dictionary_set_BOOL(v12, "RapidEnv", a2);
  xpc_dictionary_set_BOOL(v12, "OverridesDefault", 1);
  v13 = _sendCKConfigMessageAndHandleReply(v12, a3, a4, a5, a6);

  return v13;
}

_QWORD *_DPCSchedulePermissiveExpeditedUploadActivity(unsigned int a1, _QWORD *a2)
{
  xpc_object_t v4;
  void *v5;
  void *v6;
  __CFString *v7;
  void *v8;
  uint64_t v10;
  _QWORD v11[2];

  v11[1] = *MEMORY[0x1E0C80C00];
  v4 = xpc_dictionary_create(0, 0, 0);
  v5 = v4;
  if (v4)
  {
    xpc_dictionary_set_uint64(v4, "ClientMessageType", 0x6EuLL);
    xpc_dictionary_set_uint64(v5, "delaySeconds", a1);
    a2 = (_QWORD *)_sendAdminRequestMessage_WaitForReply(v5, (uint64_t)a2);
  }
  else if (a2)
  {
    v6 = (void *)MEMORY[0x1E0CB35C8];
    v7 = kDRRequestClientError;
    v10 = *MEMORY[0x1E0CB2D50];
    v11[0] = CFSTR("Failed to allocate XPC message");
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v11, &v10, 1);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "errorWithDomain:code:userInfo:", v7, 0, v8);
    *a2 = (id)objc_claimAutoreleasedReturnValue();

    a2 = 0;
  }

  return a2;
}

_QWORD *_DPCCancelPermissiveExpeditedUploadActivity(_QWORD *a1)
{
  xpc_object_t v2;
  void *v3;
  void *v4;
  __CFString *v5;
  void *v6;
  uint64_t v8;
  _QWORD v9[2];

  v9[1] = *MEMORY[0x1E0C80C00];
  v2 = xpc_dictionary_create(0, 0, 0);
  v3 = v2;
  if (v2)
  {
    xpc_dictionary_set_uint64(v2, "ClientMessageType", 0x6FuLL);
    a1 = (_QWORD *)_sendAdminRequestMessage_WaitForReply(v3, (uint64_t)a1);
  }
  else if (a1)
  {
    v4 = (void *)MEMORY[0x1E0CB35C8];
    v5 = kDRRequestClientError;
    v8 = *MEMORY[0x1E0CB2D50];
    v9[0] = CFSTR("Failed to allocate XPC message");
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v9, &v8, 1);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "errorWithDomain:code:userInfo:", v5, 0, v6);
    *a1 = (id)objc_claimAutoreleasedReturnValue();

    a1 = 0;
  }

  return a1;
}

_QWORD *_DPCSetIgnoreAutomatedDeviceGroup(void *a1, _QWORD *a2, _QWORD *a3)
{
  id v5;
  xpc_object_t v6;
  void *v7;
  void *v8;
  __CFString *v9;
  void *v10;
  uint64_t v12;
  _QWORD v13[2];

  v13[1] = *MEMORY[0x1E0C80C00];
  v5 = a1;
  v6 = xpc_dictionary_create(0, 0, 0);
  v7 = v6;
  if (v6)
  {
    xpc_dictionary_set_uint64(v6, "ClientMessageType", 0x71uLL);
    if (v5)
      xpc_dictionary_set_BOOL(v7, "IgnoreADGValue", objc_msgSend(v5, "BOOLValue"));
    a3 = (_QWORD *)_sendIgnoreADGMessage(v7, a2, a3);
  }
  else if (a3)
  {
    v8 = (void *)MEMORY[0x1E0CB35C8];
    v9 = kDRRequestClientError;
    v12 = *MEMORY[0x1E0CB2D50];
    v13[0] = CFSTR("Failed to allocate XPC message");
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v13, &v12, 1);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "errorWithDomain:code:userInfo:", v9, 0, v10);
    *a3 = (id)objc_claimAutoreleasedReturnValue();

    a3 = 0;
  }

  return a3;
}

BOOL _sendIgnoreADGMessage(void *a1, _QWORD *a2, _QWORD *a3)
{
  void *v4;
  void *v5;
  void *v6;

  _sendAdminRequestMessage_GetReply(a1, a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v4)
  {
    *a2 = 0;
    xpc_dictionary_get_value(v4, "IgnoreADGValue");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (v6)
    {
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", xpc_dictionary_get_BOOL(v5, "IgnoreADGValue"));
      *a2 = (id)objc_claimAutoreleasedReturnValue();
    }
  }

  return v5 != 0;
}

_QWORD *_DPCGetIgnoreAutomatedDeviceGroup(_QWORD *a1, _QWORD *a2)
{
  xpc_object_t v4;
  void *v5;
  void *v6;
  __CFString *v7;
  void *v8;
  uint64_t v10;
  _QWORD v11[2];

  v11[1] = *MEMORY[0x1E0C80C00];
  v4 = xpc_dictionary_create(0, 0, 0);
  v5 = v4;
  if (v4)
  {
    xpc_dictionary_set_uint64(v4, "ClientMessageType", 0x70uLL);
    a2 = (_QWORD *)_sendIgnoreADGMessage(v5, a1, a2);
  }
  else if (a2)
  {
    v6 = (void *)MEMORY[0x1E0CB35C8];
    v7 = kDRRequestClientError;
    v10 = *MEMORY[0x1E0CB2D50];
    v11[0] = CFSTR("Failed to allocate XPC message");
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v11, &v10, 1);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "errorWithDomain:code:userInfo:", v7, 0, v8);
    *a2 = (id)objc_claimAutoreleasedReturnValue();

    a2 = 0;
  }

  return a2;
}

_QWORD *_sendAdminRequestMessage_GetReply(void *a1, _QWORD *a2)
{
  void *v3;
  void *v4;
  NSObject *v5;
  void *v6;
  __CFString *v7;
  void *v8;
  const char *string;
  NSObject *v10;
  const char *v11;
  __CFString *v12;
  void *v13;
  __CFString *v14;
  void *v15;
  uint64_t v17;
  __CFString *v18;
  uint8_t buf[4];
  const char *v20;
  uint64_t v21;
  _QWORD v22[2];

  v22[1] = *MEMORY[0x1E0C80C00];
  _DPClientXPCSendMessageWithReplySync(a1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
  {
    if (xpc_dictionary_get_BOOL(v3, "AdminRequest_Reply"))
    {
      a2 = v4;
      goto LABEL_18;
    }
    string = xpc_dictionary_get_string(v4, "AdminRequest_RejectionReason");
    DPLogHandle_AdminError();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_signpost_enabled(v10))
    {
      v11 = "Unknown";
      if (string)
        v11 = string;
      *(_DWORD *)buf = 136446210;
      v20 = v11;
      _os_signpost_emit_with_name_impl(&dword_1D3AB0000, v10, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "AdminRequestRejected", "Rejected due to reason: %{public}s", buf, 0xCu);
    }

    if (a2)
    {
      if (string)
      {
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", string);
        v12 = (__CFString *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v12 = CFSTR("Unknown");
      }
      v13 = (void *)MEMORY[0x1E0CB35C8];
      v14 = kDRRequestClientError;
      v17 = *MEMORY[0x1E0CB2D50];
      v18 = v12;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v18, &v17, 1);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "errorWithDomain:code:userInfo:", v14, 0, v15);
      *a2 = (id)objc_claimAutoreleasedReturnValue();

      goto LABEL_17;
    }
  }
  else
  {
    DPLogHandle_AdminError();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_signpost_enabled(v5))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_1D3AB0000, v5, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "AdminRequestFailed", "Failed due to invalid/interrupted service connection", buf, 2u);
    }

    if (a2)
    {
      v6 = (void *)MEMORY[0x1E0CB35C8];
      v7 = kDRRequestClientError;
      v21 = *MEMORY[0x1E0CB2D50];
      v22[0] = CFSTR("Invalid/interrupted service connection");
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v22, &v21, 1);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "errorWithDomain:code:userInfo:", v7, 0, v8);
      *a2 = (id)objc_claimAutoreleasedReturnValue();

LABEL_17:
      a2 = 0;
    }
  }
LABEL_18:

  return a2;
}

void _DRCTaskingConnectionStateFinalizer_cold_1(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_1D3AB0000, log, OS_LOG_TYPE_ERROR, "Deallocated service connection", v1, 2u);
}

NSString *__cdecl NSStringFromClass(Class aClass)
{
  return (NSString *)MEMORY[0x1E0CB3200](aClass);
}

void _Block_object_dispose(const void *a1, const int a2)
{
  MEMORY[0x1E0C80948](a1, *(_QWORD *)&a2);
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
  MEMORY[0x1E0C80A20](exception_object);
}

void _os_log_error_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x1E0C81038](dso, log, type, format, buf, *(_QWORD *)&size);
}

uint64_t _os_signpost_emit_unreliably_with_name_impl()
{
  return MEMORY[0x1E0C810C8]();
}

void _os_signpost_emit_with_name_impl(void *dso, os_log_t log, os_signpost_type_t type, os_signpost_id_t spid, const char *name, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x1E0C810D0](dso, log, type, spid, name, format, buf, *(_QWORD *)&size);
}

void dispatch_async(dispatch_queue_t queue, dispatch_block_t block)
{
  MEMORY[0x1E0C82C00](queue, block);
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
  MEMORY[0x1E0C82E08](predicate, block);
}

dispatch_queue_t dispatch_queue_create(const char *label, dispatch_queue_attr_t attr)
{
  return (dispatch_queue_t)MEMORY[0x1E0C82E48](label, attr);
}

void dispatch_sync(dispatch_queue_t queue, dispatch_block_t block)
{
  MEMORY[0x1E0C82F90](queue, block);
}

void free(void *a1)
{
  MEMORY[0x1E0C834A8](a1);
}

uint64_t mach_absolute_time(void)
{
  return MEMORY[0x1E0C83C50]();
}

uint64_t mach_continuous_time(void)
{
  return MEMORY[0x1E0C83C70]();
}

kern_return_t mach_timebase_info(mach_timebase_info_t info)
{
  return MEMORY[0x1E0C83DB8](info);
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

void objc_storeStrong(id *location, id obj)
{
  MEMORY[0x1E0DE7FB0](location, obj);
}

os_log_t os_log_create(const char *subsystem, const char *category)
{
  return (os_log_t)MEMORY[0x1E0C84728](subsystem, category);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x1E0C84780](oslog, type);
}

BOOL os_signpost_enabled(os_log_t log)
{
  return MEMORY[0x1E0C84920](log);
}

uint64_t sandbox_extension_issue_file()
{
  return MEMORY[0x1E0C851A8]();
}

xpc_object_t xpc_array_create_empty(void)
{
  return (xpc_object_t)MEMORY[0x1E0C85E10]();
}

void xpc_array_set_BOOL(xpc_object_t xarray, size_t index, BOOL value)
{
  MEMORY[0x1E0C85E98](xarray, index, value);
}

void xpc_array_set_string(xpc_object_t xarray, size_t index, const char *string)
{
  MEMORY[0x1E0C85ED0](xarray, index, string);
}

void xpc_connection_activate(xpc_connection_t connection)
{
  MEMORY[0x1E0C85F50](connection);
}

void xpc_connection_cancel(xpc_connection_t connection)
{
  MEMORY[0x1E0C85F68](connection);
}

xpc_connection_t xpc_connection_create_mach_service(const char *name, dispatch_queue_t targetq, uint64_t flags)
{
  return (xpc_connection_t)MEMORY[0x1E0C85FB0](name, targetq, flags);
}

void xpc_connection_send_message(xpc_connection_t connection, xpc_object_t message)
{
  MEMORY[0x1E0C86030](connection, message);
}

xpc_object_t xpc_connection_send_message_with_reply_sync(xpc_connection_t connection, xpc_object_t message)
{
  return (xpc_object_t)MEMORY[0x1E0C86048](connection, message);
}

void xpc_connection_set_context(xpc_connection_t connection, void *context)
{
  MEMORY[0x1E0C86070](connection, context);
}

void xpc_connection_set_event_handler(xpc_connection_t connection, xpc_handler_t handler)
{
  MEMORY[0x1E0C86080](connection, handler);
}

void xpc_connection_set_finalizer_f(xpc_connection_t connection, xpc_finalizer_t finalizer)
{
  MEMORY[0x1E0C86088](connection, finalizer);
}

char *__cdecl xpc_copy_description(xpc_object_t object)
{
  return (char *)MEMORY[0x1E0C86108](object);
}

uint64_t xpc_copy_event()
{
  return MEMORY[0x1E0C86140]();
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

const char *__cdecl xpc_dictionary_get_string(xpc_object_t xdict, const char *key)
{
  return (const char *)MEMORY[0x1E0C862C8](xdict, key);
}

uint64_t xpc_dictionary_get_uint64(xpc_object_t xdict, const char *key)
{
  return MEMORY[0x1E0C862D0](xdict, key);
}

xpc_object_t xpc_dictionary_get_value(xpc_object_t xdict, const char *key)
{
  return (xpc_object_t)MEMORY[0x1E0C862E0](xdict, key);
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

uint64_t xpc_set_event()
{
  return MEMORY[0x1E0C866E0]();
}

void xpc_set_event_stream_handler(const char *stream, dispatch_queue_t targetq, xpc_handler_t handler)
{
  MEMORY[0x1E0C866E8](stream, targetq, handler);
}

