void __Block_byref_object_dispose_(uint64_t a1)
{

}

void __Block_byref_object_dispose__0(uint64_t a1)
{

}

id _APSGetTopicsFromXPCDictionary(void *a1, const char *a2)
{
  void *v2;
  void *v3;
  void *v4;

  xpc_dictionary_get_value(a1, a2);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (v2)
  {
    v3 = (void *)_CFXPCCreateCFObjectFromXPCMessage();
    APSSafeArrayOfStrings(v3);
    v4 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v4 = 0;
  }

  return v4;
}

id APSSafeArrayOfStrings(void *a1)
{
  id v1;
  id v2;
  uint64_t v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _BYTE v13[128];
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v1 = a1;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {

    v1 = 0;
  }
  objc_opt_class();
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v2 = v1;
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
  v4 = v2;
  if (v3)
  {
    v5 = v3;
    v6 = *(_QWORD *)v10;
    while (2)
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v10 != v6)
          objc_enumerationMutation(v2);
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {

          v4 = 0;
          goto LABEL_13;
        }
      }
      v5 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
      if (v5)
        continue;
      break;
    }
    v4 = v2;
  }
LABEL_13:

  return v4;
}

void __aps_connection_event_handler_block_invoke_2(uint64_t a1)
{
  void *v2;
  id *v3;
  void *v4;
  void *v5;
  BOOL v6;
  _BOOL4 v7;
  void *v8;
  int v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  APSAppTokenInfo *v19;
  void *v20;
  void *v21;
  APSIncomingMessage *v22;
  NSObject *v23;
  void *v24;
  void *v25;
  int v26;
  void *v27;
  void *v28;
  APSAppTokenInfo *v29;
  void *v30;
  APSURLTokenInfo *v31;
  void *v32;
  APSURLToken *v33;
  void *v34;
  APSURLToken *v35;
  APSURLTokenInfo *v36;
  void *v37;
  _QWORD v38[4];
  id v39;
  id v40;
  uint8_t buf[4];
  void *v42;
  uint64_t v43;

  v43 = *MEMORY[0x1E0C80C00];
  v2 = (void *)MEMORY[0x1A1AC9000]();
  v3 = (id *)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 32), "delegateQueue");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)MEMORY[0x1E0C80D38];

  v6 = v4 == v5;
  v7 = v4 == v5;
  if (v6 && (objc_msgSend(MEMORY[0x1E0CB3978], "isMainThread") & 1) != 0)
    v7 = 0;
  if ((!*v3 || v7) && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT))
    __aps_connection_event_handler_block_invoke_2_cold_1((uint64_t *)(a1 + 32));
  switch(*(_DWORD *)(a1 + 56))
  {
    case ')':
      APSGetXPCStringFromDictionary(*(void **)(a1 + 40), "errorDescription");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = APSGetXPCIntFromDictionary(*(void **)(a1 + 40), "errorCode");
      v10 = (int)APSGetXPCIntFromDictionary(*(void **)(a1 + 40), "messageID");
      v11 = (int)APSGetXPCIntFromDictionary(*(void **)(a1 + 40), "sendRTT");
      v12 = APSGetXPCNSUIntegerFromDictionary(*(void **)(a1 + 40), "ackTimestamp");
      APSError(v9, CFSTR("%@"), v13, v14, v15, v16, v17, v18, (uint64_t)v8);
      v19 = (APSAppTokenInfo *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 32), "_deliverOutgoingMessageResultWithID:error:sendRTT:ackTimestamp:", v10, v19, v11, v12);
      goto LABEL_28;
    case '*':
      objc_msgSend(*(id *)(a1 + 32), "_deliverConnectionStatusChange:", APSGetXPCBoolFromDictionary(*(void **)(a1 + 40), "isConnected"));
      break;
    case '+':
      xpc_dictionary_get_value(*(xpc_object_t *)(a1 + 40), "message");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      APSCreateDictionaryFromXPCObject(v20);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      if (v21)
      {
        v22 = -[APSMessage initWithDictionary:xpcMessage:]([APSIncomingMessage alloc], "initWithDictionary:xpcMessage:", v21, *(_QWORD *)(a1 + 40));
        +[APSLog PUSHTRACE](APSLog, "PUSHTRACE");
        v23 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
        {
          -[APSIncomingMessage tracingUUID](v22, "tracingUUID");
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138412290;
          v42 = v24;
          _os_log_impl(&dword_19BBC2000, v23, OS_LOG_TYPE_DEFAULT, "APSXPCDeliverMessageEvent: Created APSIncomingMessage. UUID: %@", buf, 0xCu);

        }
        if (_os_feature_enabled_impl())
        {
          -[APSMessage topic](v22, "topic");
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          v26 = objc_msgSend(v25, "isEqualToString:", CFSTR("com.apple.private.alloy.facetime.multi"));

          if (v26)
          {
            -[APSMessage identifier](v22, "identifier");
            kdebug_trace();
          }
        }
        objc_msgSend(*v3, "_deliverMessage:", v22);

      }
      else
      {
        NSLog(CFSTR("APSXPCDeliverMessageEvent: could not create APSIncomingMessage from %@. Please file a radar!"), v20);
      }

      break;
    case ',':
      APSGetXPCDataFromDictionary(*(void **)(a1 + 40), "publicToken");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v38[0] = MEMORY[0x1E0C809B0];
      v38[1] = 3221225472;
      v38[2] = __aps_connection_event_handler_block_invoke_17;
      v38[3] = &unk_1E3C8C400;
      v27 = *(void **)(a1 + 32);
      v39 = *(id *)(a1 + 40);
      v40 = *(id *)(a1 + 48);
      objc_msgSend(v27, "_deliverPublicToken:withCompletionBlock:", v8, v38);

      goto LABEL_29;
    case '-':
      objc_msgSend(*(id *)(a1 + 32), "setMessageSize:", (int)APSGetXPCIntFromDictionary(*(void **)(a1 + 40), "messageSize"));
      objc_msgSend(*(id *)(a1 + 32), "setLargeMessageSize:", (int)APSGetXPCIntFromDictionary(*(void **)(a1 + 40), "largeMessageSize"));
      break;
    case '.':
      APSGetXPCStringFromDictionary(*(void **)(a1 + 40), "identifier");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      APSGetXPCStringFromDictionary(*(void **)(a1 + 40), "topic");
      v19 = (APSAppTokenInfo *)objc_claimAutoreleasedReturnValue();
      APSGetXPCDataFromDictionary(*(void **)(a1 + 40), "token");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 32), "_deliverToken:forTopic:identifier:", v28, v19, v8);
      goto LABEL_27;
    case '/':
      xpc_dictionary_get_value(*(xpc_object_t *)(a1 + 40), "info");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v29 = [APSAppTokenInfo alloc];
      APSCreateDictionaryFromXPCObject(v8);
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = -[APSAppTokenInfo initWithDictionary:](v29, "initWithDictionary:", v30);

      APSGetXPCDataFromDictionary(*(void **)(a1 + 40), "token");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 32), "_deliverToken:forInfo:", v28, v19);
      goto LABEL_27;
    case '0':
      xpc_dictionary_get_value(*(xpc_object_t *)(a1 + 40), "info");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v31 = [APSURLTokenInfo alloc];
      APSCreateDictionaryFromXPCObject(v8);
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = -[APSURLTokenInfo initWithDictionary:](v31, "initWithDictionary:", v32);

      xpc_dictionary_get_value(*(xpc_object_t *)(a1 + 40), "token");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      v33 = [APSURLToken alloc];
      APSCreateDictionaryFromXPCObject(v28);
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      v35 = -[APSURLToken initWithDictionary:](v33, "initWithDictionary:", v34);

      objc_msgSend(*(id *)(a1 + 32), "_deliverURLToken:forInfo:", v35, v19);
      goto LABEL_26;
    case '5':
      APSGetXPCStringFromDictionary(*(void **)(a1 + 40), "topic");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      APSGetXPCArrayFromDictionary(*(void **)(a1 + 40), "failures");
      v19 = (APSAppTokenInfo *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 32), "_deliverFailedChannelSubscriptions:onTopic:", v19, v8);
      goto LABEL_28;
    case '6':
      xpc_dictionary_get_value(*(xpc_object_t *)(a1 + 40), "info");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v36 = [APSURLTokenInfo alloc];
      APSCreateDictionaryFromXPCObject(v8);
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = -[APSURLTokenInfo initWithDictionary:](v36, "initWithDictionary:", v37);

      APSGetXPCDataFromDictionary(*(void **)(a1 + 40), "error");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3710], "unarchivedObjectOfClass:fromData:error:", objc_opt_class(), v28, 0);
      v35 = (APSURLToken *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 32), "_deliverURLTokenError:forInfo:", v35, v19);
LABEL_26:

LABEL_27:
LABEL_28:

LABEL_29:
      break;
    default:
      break;
  }
  objc_autoreleasePoolPop(v2);
}

char *APSGetXPCStringFromDictionary(void *a1, char *a2)
{
  id v3;
  void *v4;
  const char *string;
  size_t v6;

  v3 = a1;
  v4 = v3;
  if (a2)
  {
    string = xpc_dictionary_get_string(v3, a2);
    a2 = (char *)string;
    if (string)
    {
      v6 = strlen(string);
      a2 = (char *)CFStringCreateWithBytes((CFAllocatorRef)*MEMORY[0x1E0C9AE30], (const UInt8 *)a2, v6, 0x8000100u, 0);
    }
  }

  return a2;
}

id APSGetXPCDataFromDictionary(void *a1, const char *a2)
{
  void *data;
  void *v3;
  id v4;
  size_t length;

  if (!a2)
    return 0;
  length = 0;
  data = (void *)xpc_dictionary_get_data(a1, a2, &length);
  if (data)
  {
    v3 = data;
    v4 = objc_alloc(MEMORY[0x1E0C99D50]);
    data = (void *)objc_msgSend(v4, "initWithBytes:length:", v3, length);
  }
  return data;
}

void __aps_connection_event_handler_block_invoke(uint64_t a1)
{
  NSObject *v2;
  _QWORD v3[4];
  id v4;
  id v5;
  id v6;
  int v7;

  objc_msgSend(*(id *)(a1 + 32), "delegateQueue");
  v2 = objc_claimAutoreleasedReturnValue();
  if (v2)
  {
    v3[0] = MEMORY[0x1E0C809B0];
    v3[1] = 3221225472;
    v3[2] = __aps_connection_event_handler_block_invoke_2;
    v3[3] = &unk_1E3C8C428;
    v4 = *(id *)(a1 + 32);
    v7 = *(_DWORD *)(a1 + 56);
    v5 = *(id *)(a1 + 40);
    v6 = *(id *)(a1 + 48);
    dispatch_async(v2, v3);

  }
}

id APSGetOpportunisticTopicsFromXPCDictionary(void *a1)
{
  return _APSGetTopicsFromXPCDictionary(a1, "opportunisticTopics");
}

id APSGetNonWakingTopicsFromXPCDictionary(void *a1)
{
  return _APSGetTopicsFromXPCDictionary(a1, "nonWakingTopics");
}

id APSGetIgnoredTopicsFromXPCDictionary(void *a1)
{
  return _APSGetTopicsFromXPCDictionary(a1, "ignoredTopics");
}

id APSGetEnabledTopicsFromXPCDictionary(void *a1)
{
  return _APSGetTopicsFromXPCDictionary(a1, "enabledTopics");
}

int64_t APSGetXPCIntFromDictionary(void *a1, const char *a2)
{
  if (a2)
    return xpc_dictionary_get_int64(a1, a2);
  else
    return 0;
}

BOOL APSGetXPCBoolFromDictionary(void *a1, const char *a2)
{
  return a2 && xpc_dictionary_get_BOOL(a1, a2);
}

BOOL APSGetEnableStatusNotifications(void *a1, BOOL *a2)
{
  id v3;
  void *v4;
  _BOOL8 v5;

  v3 = a1;
  xpc_dictionary_get_value(v3, "enableStatusNotifications");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v4)
  {
    v5 = 0;
    if (!a2)
      goto LABEL_4;
    goto LABEL_3;
  }
  v5 = xpc_dictionary_get_BOOL(v3, "enableStatusNotifications");
  if (a2)
LABEL_3:
    *a2 = v4 != 0;
LABEL_4:

  return v5;
}

BOOL APSGetEnableCriticalReliability(void *a1, BOOL *a2)
{
  id v3;
  void *v4;
  _BOOL8 v5;

  v3 = a1;
  xpc_dictionary_get_value(v3, "enableCriticalReliability");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v4)
  {
    v5 = 0;
    if (!a2)
      goto LABEL_4;
    goto LABEL_3;
  }
  v5 = xpc_dictionary_get_BOOL(v3, "enableCriticalReliability");
  if (a2)
LABEL_3:
    *a2 = v4 != 0;
LABEL_4:

  return v5;
}

void _APSInsertTopicsToXPCDictionary(void *a1, const char *a2, void *a3)
{
  id v5;
  void *v6;
  xpc_object_t xdict;

  xdict = a1;
  v5 = a3;
  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0C99D20], "array");
    v5 = (id)objc_claimAutoreleasedReturnValue();
  }
  v6 = (void *)_CFXPCCreateXPCMessageWithCFObject();
  if (v6)
    xpc_dictionary_set_value(xdict, a2, v6);

}

void sub_19BBC61B8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,uint64_t a44,uint64_t a45,uint64_t a46,uint64_t a47,uint64_t a48,uint64_t a49,uint64_t a50,uint64_t a51,char a52,uint64_t a53,uint64_t a54,uint64_t a55,char a56,uint64_t a57,uint64_t a58,uint64_t a59,char a60,uint64_t a61,uint64_t a62,uint64_t a63)
{
  char a64;
  char a68;
  uint64_t v68;

  _Block_object_dispose(&a52, 8);
  _Block_object_dispose(&a56, 8);
  _Block_object_dispose(&a60, 8);
  _Block_object_dispose(&a64, 8);
  _Block_object_dispose(&a68, 8);
  _Block_object_dispose(&STACK[0x208], 8);
  _Block_object_dispose(&STACK[0x228], 8);
  _Block_object_dispose(&STACK[0x248], 8);
  _Block_object_dispose(&STACK[0x268], 8);
  _Block_object_dispose(&STACK[0x298], 8);
  _Block_object_dispose(&STACK[0x2C8], 8);
  _Block_object_dispose(&STACK[0x2F8], 8);
  _Block_object_dispose(&STACK[0x328], 8);
  _Block_object_dispose((const void *)(v68 - 176), 8);
  _Unwind_Resume(a1);
}

void aps_connection_event_handler(void *a1, void *a2)
{
  _xpc_connection_s *v3;
  id v4;
  int int64;
  void *v6;
  void *v7;
  NSObject *v8;
  _xpc_connection_s *v9;
  xpc_object_t v10;
  const char *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  _QWORD block[4];
  id v19;
  id v20;
  _xpc_connection_s *v21;
  int v22;

  v3 = a1;
  v4 = a2;
  int64 = xpc_dictionary_get_int64(v4, (const char *)objc_msgSend(CFSTR("message-type"), "UTF8String"));
  APSGetXPCConnectionContext(v3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (v6)
  {
    objc_msgSend(v6, "ivarQueue");
    v8 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __aps_connection_event_handler_block_invoke;
    block[3] = &unk_1E3C8C428;
    v19 = v7;
    v22 = int64;
    v20 = v4;
    v9 = v3;
    v21 = v9;
    dispatch_async(v8, block);

    v10 = xpc_dictionary_create(0, 0, 0);
    v11 = (const char *)objc_msgSend(CFSTR("message-type"), "UTF8String");
    APSInsertIntsToXPCDictionary(v10, v11, v12, v13, v14, v15, v16, v17, 33);
    xpc_connection_send_message(v9, v10);

  }
}

uint64_t APSInsertIntsToXPCDictionary(xpc_object_t xdict, const char *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  const char **v10;
  uint64_t *v12;

  v12 = &a9;
  if (a2)
  {
    do
    {
      xpc_dictionary_set_int64(xdict, a2, *(int *)v12);
      v10 = (const char **)(v12 + 1);
      v12 += 2;
      a2 = *v10;
    }
    while (*v10);
  }
  return 1;
}

id APSGetXPCConnectionContext(_xpc_connection_s *a1)
{
  void *v1;
  void *v2;

  if (a1)
  {
    xpc_connection_get_context(a1);
    v1 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v1 = 0;
  }
  objc_msgSend(v1, "object");
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  return v2;
}

void APSInsertOpportunisticTopicsToXPCDictionary(void *a1, void *a2)
{
  _APSInsertTopicsToXPCDictionary(a1, "opportunisticTopics", a2);
}

void APSInsertNonWakingTopicsToXPCDictionary(void *a1, void *a2)
{
  _APSInsertTopicsToXPCDictionary(a1, "nonWakingTopics", a2);
}

void APSInsertIgnoredTopicsToXPCDictionary(void *a1, void *a2)
{
  _APSInsertTopicsToXPCDictionary(a1, "ignoredTopics", a2);
}

void APSInsertEnabledTopicsToXPCDictionary(void *a1, void *a2)
{
  _APSInsertTopicsToXPCDictionary(a1, "enabledTopics", a2);
}

id APSPrettyPrintCollection(void *a1, unsigned int a2, unint64_t a3, uint64_t a4)
{
  id v7;
  uint64_t v8;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  const __CFString *v13;
  char v14;
  uint64_t i;
  void *v16;
  unint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  unint64_t v22;
  const __CFString *v23;
  uint64_t v24;
  char v25;
  id obj;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  _OWORD v31[4];
  _BYTE v32[128];
  _BYTE v33[128];
  uint64_t v34;

  v34 = *MEMORY[0x1E0C80C00];
  v7 = a1;
  memset(v31, 0, sizeof(v31));
  if (objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", v31, v33, 16))
    v8 = a2;
  else
    v8 = 0;
  objc_msgSend(MEMORY[0x1E0CB37A0], "stringWithString:", CFSTR("("));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v9;
  if ((_DWORD)v8 == 1)
    objc_msgSend(v9, "appendString:", CFSTR("\n"));
  v25 = objc_opt_respondsToSelector();
  v27 = 0u;
  v28 = 0u;
  v29 = 0u;
  v30 = 0u;
  obj = v7;
  v11 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v27, v32, 16);
  if (v11)
  {
    v12 = v11;
    v24 = *(_QWORD *)v28;
    if ((_DWORD)v8)
      v13 = CFSTR(",\n");
    else
      v13 = CFSTR(", ");
    v22 = a3 + 1;
    v23 = v13;
    v14 = 1;
    do
    {
      for (i = 0; i != v12; ++i)
      {
        if (*(_QWORD *)v28 != v24)
          objc_enumerationMutation(obj);
        v16 = *(void **)(*((_QWORD *)&v27 + 1) + 8 * i);
        if ((v14 & 1) == 0)
          objc_msgSend(v10, "appendString:", v23);
        if ((_DWORD)v8)
        {
          v17 = 0;
          do
          {
            objc_msgSend(v10, "appendString:", CFSTR("    "));
            ++v17;
          }
          while (v17 <= a3);
        }
        if ((v25 & 1) != 0)
        {
          objc_msgSend(obj, "performSelector:withObject:", sel_objectForKey_, v16);
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          APSPrettyPrintObject(v16, a4);
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v10, "appendFormat:", CFSTR("%@="), v19);

          if ((objc_opt_respondsToSelector() & 1) != 0)
            APSPrettyPrintCollection(v18, v8, v22, a4);
          else
            APSPrettyPrintObject(v18, a4);
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v10, "appendString:", v20);

        }
        else
        {
          if ((objc_opt_respondsToSelector() & 1) != 0)
            APSPrettyPrintCollection(v16, v8, v22, a4);
          else
            APSPrettyPrintObject(v16, a4);
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v10, "appendString:", v18);
        }

        v14 = 0;
      }
      v12 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v27, v32, 16);
      v14 = 0;
    }
    while (v12);
  }

  if ((_DWORD)v8)
  {
    objc_msgSend(v10, "appendString:", CFSTR("\n"));
    for (; a3; --a3)
      objc_msgSend(v10, "appendString:", CFSTR("    "));
  }
  objc_msgSend(v10, "appendString:", CFSTR(")"));

  return v10;
}

id APSPrettyPrintObject(void *a1, uint64_t a2)
{
  id v3;
  void *v4;
  uint64_t v5;
  void *v6;

  v3 = a1;
  v4 = v3;
  if (a2 == 2)
  {
    if ((objc_opt_respondsToSelector() & 1) != 0)
    {
      objc_msgSend(v4, "aps_prettyDescription");
      v5 = objc_claimAutoreleasedReturnValue();
      goto LABEL_7;
    }
LABEL_6:
    objc_msgSend(v4, "debugDescription");
    v5 = objc_claimAutoreleasedReturnValue();
    goto LABEL_7;
  }
  if (a2 == 1)
    goto LABEL_6;
  objc_msgSend(v3, "description");
  v5 = objc_claimAutoreleasedReturnValue();
LABEL_7:
  v6 = (void *)v5;

  return v6;
}

uint64_t APSInsertNSStringsToXPCDictionary(void *a1, const char *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  id v10;
  id *v11;
  const __CFString *v12;
  __CFString *v13;
  UInt8 *v14;
  UInt8 *v15;
  const char **v16;
  char v18;
  const char **v19;

  v10 = a1;
  v19 = (const char **)&a9;
  if (a2)
  {
    do
    {
      v11 = (id *)v19++;
      v12 = (const __CFString *)*v11;
      v13 = (__CFString *)v12;
      if (v12)
      {
        v18 = 0;
        v14 = _APSJWStringToCharPtr(v12, &v18);
        if (v14)
        {
          v15 = v14;
          xpc_dictionary_set_string(v10, a2, (const char *)v14);
          if (v18)
            free(v15);
        }
      }

      v16 = v19++;
      a2 = *v16;
    }
    while (*v16);
  }

  return 1;
}

UInt8 *_APSJWStringToCharPtr(const __CFString *a1, _BYTE *a2)
{
  UInt8 *CStringPtr;
  CFIndex maxBufLen;
  CFRange v7;
  CFRange v8;

  *a2 = 0;
  if (!a1)
    return 0;
  CStringPtr = (UInt8 *)CFStringGetCStringPtr(a1, 0x8000100u);
  if (!CStringPtr)
  {
    maxBufLen = 0;
    v7.length = CFStringGetLength(a1);
    v7.location = 0;
    CFStringGetBytes(a1, v7, 0x8000100u, 0, 0, 0, 0, &maxBufLen);
    CStringPtr = (UInt8 *)malloc_type_malloc(maxBufLen + 1, 0x9D4377EDuLL);
    v8.length = CFStringGetLength(a1);
    v8.location = 0;
    CFStringGetBytes(a1, v8, 0x8000100u, 0, 0, CStringPtr, maxBufLen, 0);
    CStringPtr[maxBufLen] = 0;
    *a2 = 1;
  }
  return CStringPtr;
}

void APSXPCConnectionSetEventHandlers(void *a1, void *a2, void *a3, void *a4)
{
  id v7;
  id v8;
  id v9;
  id v10;
  id v11;
  id v12;
  id v13;
  _xpc_connection_s *v14;
  _QWORD v15[4];
  id v16;
  id v17;
  id v18;
  id v19;

  v7 = a1;
  v8 = a2;
  v9 = a3;
  v10 = a4;
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __APSXPCConnectionSetEventHandlers_block_invoke;
  v15[3] = &unk_1E3C8C340;
  v16 = v7;
  v17 = v8;
  v18 = v9;
  v19 = v10;
  v11 = v10;
  v12 = v9;
  v13 = v8;
  v14 = (_xpc_connection_s *)v7;
  xpc_connection_set_event_handler(v14, v15);

}

BOOL APSGetTrackActivityPresence(void *a1, BOOL *a2)
{
  id v3;
  void *v4;
  _BOOL8 v5;

  v3 = a1;
  xpc_dictionary_get_value(v3, "trackActivityPresence");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v4)
  {
    v5 = 0;
    if (!a2)
      goto LABEL_4;
    goto LABEL_3;
  }
  v5 = xpc_dictionary_get_BOOL(v3, "trackActivityPresence");
  if (a2)
LABEL_3:
    *a2 = v4 != 0;
LABEL_4:

  return v5;
}

id APSCreateDictionaryFromXPCObject(void *a1)
{
  if (a1)
    a1 = (void *)_CFXPCCreateCFObjectFromXPCMessage();
  return a1;
}

uint64_t __Block_byref_object_copy_(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

uint64_t __Block_byref_object_copy__0(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void APSSetXPCConnectionContext(void *a1, void *a2)
{
  _xpc_connection_s *v3;
  id v4;
  void *context;
  void *v6;
  NSObject *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  _xpc_connection_s *v16;
  id v17;

  v3 = a1;
  v4 = a2;
  context = xpc_connection_get_context(v3);
  if (context)
  {
    v6 = context;
    +[APSLog xpc](APSLog, "xpc");
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      APSSetXPCConnectionContext_cold_1(v7, v8, v9, v10, v11, v12, v13, v14);

  }
  if (!v4)
  {
    v15 = 0;
    if (!v3)
      goto LABEL_8;
    goto LABEL_7;
  }
  objc_msgSend(MEMORY[0x1E0D13238], "weakRefWithObject:", v4);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
LABEL_7:
    v16 = v3;
    v17 = v15;
    xpc_connection_set_finalizer_f(v16, (xpc_finalizer_t)aps_connection_finalizer);
    xpc_connection_set_context(v16, v17);

  }
LABEL_8:

}

void APSPowerLog(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  NSObject *v5;
  uint8_t buf[4];
  void *v7;
  __int16 v8;
  id v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("PC APSD %@"), a1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (APSPowerLog__pred_PLLogTimeSensitiveRegisteredEventPowerLog != -1)
    dispatch_once(&APSPowerLog__pred_PLLogTimeSensitiveRegisteredEventPowerLog, &__block_literal_global_118);
  if (APSPowerLog__PLLogTimeSensitiveRegisteredEvent)
  {
    +[APSLog main](APSLog, "main");
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412546;
      v7 = v4;
      v8 = 2112;
      v9 = v3;
      _os_log_impl(&dword_19BBC2000, v5, OS_LOG_TYPE_DEFAULT, "APSPowerLog: {event: %@, dict: %@}", buf, 0x16u);
    }

    APSPowerLog__PLLogTimeSensitiveRegisteredEvent(2, v4, v3, 0);
  }

}

uint64_t APSInsertDatasToXPCDictionary(void *a1, const char *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  id v10;
  id *v11;
  id v12;
  id v13;
  const char **v14;
  id *v16;
  _QWORD *v17;

  v10 = a1;
  v16 = (id *)&a9;
  if (a2)
  {
    do
    {
      v11 = v16;
      v17 = v16 + 1;
      v12 = *v11;
      if (!v12)
      {
        objc_msgSend(MEMORY[0x1E0C99D50], "data");
        v12 = (id)objc_claimAutoreleasedReturnValue();
      }
      v13 = objc_retainAutorelease(v12);
      xpc_dictionary_set_data(v10, a2, (const void *)objc_msgSend(v13, "bytes"), objc_msgSend(v13, "length"));

      v14 = (const char **)v17;
      v16 = (id *)(v17 + 1);
      a2 = *v14;
    }
    while (*v14);
  }

  return 1;
}

id APSLoggableDescriptionForObjectOnTopic_NoLoad(void *a1, void *a2)
{
  id v3;
  id v4;
  void *v5;

  v3 = a2;
  v4 = a1;
  if (dlopen("/System/Library/PrivateFrameworks/IDSFoundation.framework/IDSFoundation", 16))
    APSLoggableDescriptionForObjectOnTopic(v4, v3);
  else
    objc_msgSend(v4, "description");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

id APSLoggableDescriptionForObjectOnTopic(void *a1, void *a2)
{
  id v3;
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  id v9;
  uint64_t (*IDSShouldUseRestrictedLoggingForServiceSymbolLoc)(id);
  char v11;
  char v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  __int128 v17;
  uint64_t v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v3 = a1;
  v4 = a2;
  v5 = v4;
  if (v3)
  {
    if (_APSShouldRedactPushTopic(v4))
    {
      v6 = (void *)MEMORY[0x1E0CB3940];
      v15 = objc_opt_class();
    }
    else
    {
      if (!IDSFoundationLibraryCore_frameworkLibrary)
      {
        v17 = xmmword_1E3C8C3E0;
        v18 = 0;
        IDSFoundationLibraryCore_frameworkLibrary = _sl_dlopen();
      }
      if (!IDSFoundationLibraryCore_frameworkLibrary || !getIDSShouldUseRestrictedLoggingForServiceSymbolLoc())
        goto LABEL_15;
      v9 = v5;
      IDSShouldUseRestrictedLoggingForServiceSymbolLoc = (uint64_t (*)(id))getIDSShouldUseRestrictedLoggingForServiceSymbolLoc();
      if (!IDSShouldUseRestrictedLoggingForServiceSymbolLoc)
        APSLoggableDescriptionForObjectOnTopic_cold_1();
      v11 = IDSShouldUseRestrictedLoggingForServiceSymbolLoc(v9);

      if ((v11 & 1) == 0)
      {
LABEL_15:
        objc_msgSend(v3, "description");
        v7 = objc_claimAutoreleasedReturnValue();
        goto LABEL_16;
      }
      if ((objc_opt_respondsToSelector() & 1) != 0)
      {
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("<redacted %@ count:%llu>"), objc_opt_class(), objc_msgSend(v3, "count"), v17, v18, v19);
        goto LABEL_5;
      }
      v13 = objc_opt_respondsToSelector();
      v6 = (void *)MEMORY[0x1E0CB3940];
      v14 = objc_opt_class();
      if ((v13 & 1) != 0)
      {
        objc_msgSend(v6, "stringWithFormat:", CFSTR("<redacted %@ length:%llu>"), v14, objc_msgSend(v3, "length"), v17, v18, v19);
        goto LABEL_5;
      }
      v15 = v14;
    }
    objc_msgSend(v6, "stringWithFormat:", CFSTR("<redacted %@>"), v15, v16, v17, v18, v19);
LABEL_5:
    v7 = objc_claimAutoreleasedReturnValue();
LABEL_16:
    v8 = (void *)v7;
    goto LABEL_17;
  }
  v8 = 0;
LABEL_17:

  return v8;
}

uint64_t getIDSShouldUseRestrictedLoggingForServiceSymbolLoc()
{
  uint64_t v0;
  _QWORD v2[5];
  uint64_t v3;
  uint64_t *v4;
  uint64_t v5;
  uint64_t v6;

  v3 = 0;
  v4 = &v3;
  v5 = 0x2020000000;
  v0 = getIDSShouldUseRestrictedLoggingForServiceSymbolLoc_ptr;
  v6 = getIDSShouldUseRestrictedLoggingForServiceSymbolLoc_ptr;
  if (!getIDSShouldUseRestrictedLoggingForServiceSymbolLoc_ptr)
  {
    v2[0] = MEMORY[0x1E0C809B0];
    v2[1] = 3221225472;
    v2[2] = __getIDSShouldUseRestrictedLoggingForServiceSymbolLoc_block_invoke;
    v2[3] = &unk_1E3C8B898;
    v2[4] = &v3;
    __getIDSShouldUseRestrictedLoggingForServiceSymbolLoc_block_invoke((uint64_t)v2);
    v0 = v4[3];
  }
  _Block_object_dispose(&v3, 8);
  return v0;
}

void sub_19BBC9DB8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

BOOL _APSShouldRedactPushTopic(void *a1)
{
  id v1;
  _BOOL8 v2;

  v1 = a1;
  v2 = os_variant_has_internal_content()
    && (objc_msgSend(v1, "isEqualToString:", CFSTR("com.tinyspeck.chatlyio")) & 1) != 0;

  return v2;
}

uint64_t APSIsInternalInstall()
{
  uint64_t result;

  result = os_variant_has_internal_content();
  if ((_DWORD)result)
    return !APSGetBooleanValueForKey(CFSTR("ForceProductionConfiguration"));
  return result;
}

BOOL APSGetBooleanValueForKey(const __CFString *a1)
{
  void *v2;
  int v3;
  void *v4;
  void *v5;
  const void *v6;
  CFTypeID v7;
  int Value;

  +[APSMultiUserMode sharedInstance](APSMultiUserMode, "sharedInstance");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isMultiUser");

  if (v3)
  {
    +[APSMultiUserFS sharedInstance](APSMultiUserFS, "sharedInstance");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "systemPath");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "stringByAppendingString:", CFSTR("/"));
    v6 = (const void *)_CFPreferencesCopyValueWithContainer();

    if (v6)
    {
      v7 = CFGetTypeID(v6);
      if (v7 == CFBooleanGetTypeID())
        Value = CFBooleanGetValue((CFBooleanRef)v6);
      else
        Value = 0;
      CFRelease(v6);
    }
    else
    {
      Value = 0;
    }
  }
  else
  {
    Value = CFPreferencesGetAppBooleanValue(a1, CFSTR("com.apple.apsd"), 0);
  }
  return Value != 0;
}

uint64_t APSInsertBoolsToXPCDictionary(xpc_object_t xdict, const char *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  const char **v10;
  uint64_t *v12;

  v12 = &a9;
  if (a2)
  {
    do
    {
      xpc_dictionary_set_BOOL(xdict, a2, *(_DWORD *)v12 != 0);
      v10 = (const char **)(v12 + 1);
      v12 += 2;
      a2 = *v10;
    }
    while (*v10);
  }
  return 1;
}

id APSCreateXPCObjectFromDictionary(void *a1)
{
  id v1;
  void *v2;

  v1 = a1;
  if (objc_msgSend(v1, "count"))
    v2 = (void *)_CFXPCCreateXPCMessageWithCFObject();
  else
    v2 = 0;

  return v2;
}

_xpc_connection_s *APSXPCCreateConnectionForServiceWithQueue(char a1, int a2, const char *a3, void *a4, void *a5, void *a6)
{
  NSObject *v11;
  id v12;
  id v13;
  id v14;
  xpc_connection_t mach_service;
  _xpc_connection_s *v16;
  NSObject *v17;

  v11 = a4;
  v12 = a5;
  v13 = a6;
  if (a3)
  {
    if (!v11)
    {
      v14 = objc_retainAutorelease((id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("%s_connection_queue"), a3));
      v11 = dispatch_queue_create((const char *)objc_msgSend(v14, "UTF8String"), 0);

    }
    if ((a1 & 1) != 0)
      mach_service = xpc_connection_create_mach_service(a3, v11, 0);
    else
      mach_service = xpc_connection_create(a3, v11);
    v16 = mach_service;
    if (mach_service)
    {
      if (a2)
      {
        APSXPCConnectionSetEventHandlers(mach_service, v12, v13, 0);
        xpc_connection_resume(v16);
      }
    }
    else
    {
      +[APSLog xpc](APSLog, "xpc");
      v17 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_FAULT))
        APSXPCCreateConnectionForServiceWithQueue_cold_1();

    }
  }
  else
  {
    v16 = 0;
  }

  return v16;
}

id APSEncodeDictionary(void *a1)
{
  id v1;
  void *v2;
  id v3;
  id v4;
  void *v5;
  void *v6;
  id v8;

  v1 = a1;
  v2 = v1;
  if (v1 && objc_msgSend(v1, "count"))
  {
    v8 = 0;
    objc_msgSend(MEMORY[0x1E0CB38B0], "dataWithPropertyList:format:options:error:", v2, 200, 0, &v8);
    v3 = (id)objc_claimAutoreleasedReturnValue();
    v4 = v8;
    if (v4)
    {
      v5 = v4;
      v6 = 0;
    }
    else
    {
      v3 = v3;
      v5 = 0;
      v6 = v3;
    }

  }
  else
  {
    v6 = 0;
  }

  return v6;
}

void sub_19BBCB328()
{
  objc_end_catch();
  JUMPOUT(0x19BBCB330);
}

void *__getIDSShouldUseRestrictedLoggingForServiceSymbolLoc_block_invoke(uint64_t a1)
{
  void *result;
  void *v3;
  __int128 v4;
  uint64_t v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  v3 = 0;
  if (!IDSFoundationLibraryCore_frameworkLibrary)
  {
    v4 = xmmword_1E3C8C3E0;
    v5 = 0;
    IDSFoundationLibraryCore_frameworkLibrary = _sl_dlopen();
  }
  if (!IDSFoundationLibraryCore_frameworkLibrary)
    __getIDSShouldUseRestrictedLoggingForServiceSymbolLoc_block_invoke_cold_1(&v3);
  result = dlsym((void *)IDSFoundationLibraryCore_frameworkLibrary, "IDSShouldUseRestrictedLoggingForService");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  getIDSShouldUseRestrictedLoggingForServiceSymbolLoc_ptr = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  return result;
}

void sub_19BBCD374(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, id location)
{
  id *v20;
  id *v21;

  objc_destroyWeak(v21);
  objc_destroyWeak(v20);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void OUTLINED_FUNCTION_0(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 2u);
}

void APSPubSubPowerLog(void *a1)
{
  id v1;
  NSObject *v2;
  int v3;
  id v4;
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  v1 = a1;
  if (APSPubSubPowerLog_onceToken != -1)
    dispatch_once(&APSPubSubPowerLog_onceToken, &__block_literal_global_123);
  if (APSPubSubPowerLog__pred_PPSSendTelemetryPowerLog != -1)
    dispatch_once(&APSPubSubPowerLog__pred_PPSSendTelemetryPowerLog, &__block_literal_global_128);
  +[APSLog main](APSLog, "main");
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    v3 = 138412290;
    v4 = v1;
    _os_log_impl(&dword_19BBC2000, v2, OS_LOG_TYPE_DEFAULT, "APSPubSubPowerLog, dict: %@}", (uint8_t *)&v3, 0xCu);
  }

  APSPubSubPowerLog__PPSSendTelemetry(APSPubSubPowerLog_streamID, v1);
}

void *APSConnectionInterruptedHandlerBlock()
{
  return &__block_literal_global_0;
}

void *APSConnectionInvalidationHandlerBlock()
{
  return &__block_literal_global_55;
}

uint64_t _APSClientIdentityUpdatedNotificationFired()
{
  NSObject *v0;
  uint8_t v2[16];

  +[APSLog connection](APSLog, "connection");
  v0 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v0, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v2 = 0;
    _os_log_impl(&dword_19BBC2000, v0, OS_LOG_TYPE_DEFAULT, "Received client identity updated notification", v2, 2u);
  }

  return +[APSConnection _flushIdentityCache](APSConnection, "_flushIdentityCache");
}

void sub_19BBD47AC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_list va;

  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_19BBD4944(_Unwind_Exception *a1)
{
  uint64_t v1;

  _Block_object_dispose((const void *)(v1 - 64), 8);
  _Unwind_Resume(a1);
}

void sub_19BBD90E0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, ...)
{
  uint64_t v15;
  va_list va;

  va_start(va, a15);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v15 - 128), 8);
  _Unwind_Resume(a1);
}

uint64_t _APSPingClient()
{
  NSObject *v0;
  uint8_t v2[16];

  +[APSLog connection](APSLog, "connection");
  v0 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v0, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v2 = 0;
    _os_log_impl(&dword_19BBC2000, v0, OS_LOG_TYPE_DEFAULT, "_APSPingClient received!", v2, 2u);
  }

  return 0;
}

void OUTLINED_FUNCTION_0_0(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 0xCu);
}

void OUTLINED_FUNCTION_3(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint8_t *a5)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, a5, 0x16u);
}

void OUTLINED_FUNCTION_5(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_fault_impl(a1, a2, OS_LOG_TYPE_FAULT, a4, &a9, 0xCu);
}

void sub_19BBDAB98(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

id APSError(int a1, void *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  objc_class *v10;
  id v11;
  void *v12;
  id v13;
  void *v14;
  void *v15;

  v10 = (objc_class *)MEMORY[0x1E0CB3940];
  v11 = a2;
  v12 = (void *)objc_msgSend([v10 alloc], "initWithFormat:arguments:", v11, &a9);

  v13 = objc_alloc(MEMORY[0x1E0C99D80]);
  v14 = (void *)objc_msgSend(v13, "initWithObjectsAndKeys:", v12, *MEMORY[0x1E0CB2D50], 0);
  objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("APSErrorDomain"), a1, v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  return v15;
}

id APSUnderlyingError(int a1, void *a2, void *a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  objc_class *v11;
  id v12;
  id v13;
  void *v14;
  id v15;
  void *v16;
  void *v17;

  v11 = (objc_class *)MEMORY[0x1E0CB3940];
  v12 = a3;
  v13 = a2;
  v14 = (void *)objc_msgSend([v11 alloc], "initWithFormat:arguments:", v12, &a9);

  v15 = objc_alloc(MEMORY[0x1E0C99D80]);
  v16 = (void *)objc_msgSend(v15, "initWithObjectsAndKeys:", v14, *MEMORY[0x1E0CB2D50], v13, *MEMORY[0x1E0CB3388], 0);

  objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("APSErrorDomain"), a1, v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  return v17;
}

id APSPubSubError(int a1, void *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  objc_class *v10;
  id v11;
  void *v12;
  id v13;
  void *v14;
  void *v15;

  v10 = (objc_class *)MEMORY[0x1E0CB3940];
  v11 = a2;
  v12 = (void *)objc_msgSend([v10 alloc], "initWithFormat:arguments:", v11, &a9);

  v13 = objc_alloc(MEMORY[0x1E0C99D80]);
  v14 = (void *)objc_msgSend(v13, "initWithObjectsAndKeys:", v12, *MEMORY[0x1E0CB2D50], 0);
  objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("APSPubSubErrorDomain"), a1, v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  return v15;
}

id APSURLTokenError(int a1, void *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  objc_class *v10;
  id v11;
  void *v12;
  id v13;
  void *v14;
  void *v15;

  v10 = (objc_class *)MEMORY[0x1E0CB3940];
  v11 = a2;
  v12 = (void *)objc_msgSend([v10 alloc], "initWithFormat:arguments:", v11, &a9);

  v13 = objc_alloc(MEMORY[0x1E0C99D80]);
  v14 = (void *)objc_msgSend(v13, "initWithObjectsAndKeys:", v12, *MEMORY[0x1E0CB2D50], 0);
  objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("APSURLTokenErrorDomain"), a1, v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  return v15;
}

__CFString *APSIncomingMessagePriorityString(uint64_t a1)
{
  __CFString *v1;

  switch(a1)
  {
    case 1:
      return CFSTR("low");
    case 10:
      return CFSTR("high");
    case 5:
      v1 = CFSTR("medium");
      break;
    default:
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%d"), a1);
      v1 = (__CFString *)objc_claimAutoreleasedReturnValue();
      break;
  }
  return v1;
}

uint64_t APSConnectionTypeToAPSIncomingMessageInterface(uint64_t a1)
{
  if (a1)
    return 2 * (a1 == 1);
  else
    return 1;
}

CFRunLoopSourceRef APSCreateMIGServerSource(uint64_t a1, int a2, CFIndex a3)
{
  return APSCreateMIGServerSourceWithContext(a1, a2, a3, 0);
}

CFRunLoopSourceRef APSCreateMIGServerSourceWithContext(uint64_t a1, int a2, CFIndex a3, uint64_t a4)
{
  _QWORD *v8;
  CFRunLoopSourceRef v9;
  CFRunLoopSourceContext context;

  pthread_once(&__APSMIGServerCalloutContextKeyOnce, (void (*)(void))makeCalloutContextKey);
  v8 = malloc_type_malloc(0x18uLL, 0x10A0040FC6C5850uLL);
  *(_DWORD *)v8 = a2;
  v8[1] = a1;
  v8[2] = a4;
  context.version = 1;
  context.info = v8;
  context.retain = 0;
  context.release = (void (__cdecl *)(const void *))MEMORY[0x1E0C834A8];
  context.copyDescription = (CFStringRef (__cdecl *)(const void *))migHelperCopyDescription;
  context.equal = (Boolean (__cdecl *)(const void *, const void *))migHelperEqual;
  context.hash = (CFHashCode (__cdecl *)(const void *))migHelperHash;
  context.schedule = (void (__cdecl *)(void *, CFRunLoopRef, CFRunLoopMode))migHelperGetPort;
  context.cancel = (void (__cdecl *)(void *, CFRunLoopRef, CFRunLoopMode))migHelperRecievePortCallout;
  v9 = CFRunLoopSourceCreate(0, a3, &context);
  if (!v9)
    free(v8);
  return v9;
}

uint64_t makeCalloutContextKey()
{
  return pthread_key_create((pthread_key_t *)&__APSMIGServerCalloutContextKey, 0);
}

CFStringRef migHelperCopyDescription(unsigned int *a1)
{
  return CFStringCreateWithFormat(0, 0, CFSTR("<CFRunLoopSource MIG Server> {port = %u, subsystem = %p, context = %p}"), *a1, *((_QWORD *)a1 + 1), *((_QWORD *)a1 + 2));
}

BOOL migHelperEqual(_DWORD *a1, _DWORD *a2)
{
  return *a1 == *a2;
}

uint64_t migHelperHash(unsigned int *a1)
{
  return *a1;
}

uint64_t migHelperGetPort(unsigned int *a1)
{
  return *a1;
}

uint64_t migHelperRecievePortCallout(mach_msg_header_t *a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v6;
  mach_msg_id_t msgh_id;
  int v8;
  BOOL v9;
  int v10;
  void (*v11)(mach_msg_header_t *, mach_msg_header_t *);
  char v12;
  size_t v13;
  mach_msg_header_t *v14;
  mach_msg_header_t *v15;
  mach_port_t msgh_remote_port;
  const void *v17;
  mach_msg_bits_t msgh_bits;
  mach_port_t v19;
  mach_msg_option_t v20;
  mach_msg_return_t v21;
  FILE *v23;
  char *v24;

  v6 = *(_QWORD *)(a4 + 8);
  msgh_id = a1->msgh_id;
  v8 = *(_DWORD *)(v6 + 8);
  v9 = __OFSUB__(msgh_id, v8);
  v10 = msgh_id - v8;
  if (v10 < 0 != v9 || msgh_id >= *(_DWORD *)(v6 + 12))
  {
    v11 = 0;
  }
  else
  {
    v11 = *(void (**)(mach_msg_header_t *, mach_msg_header_t *))(v6 + 40 * v10 + 40);
    if (v11)
    {
      v12 = 0;
      v13 = *(unsigned int *)(v6 + 40 * v10 + 64);
      goto LABEL_7;
    }
  }
  v12 = 1;
  v13 = 36;
LABEL_7:
  v14 = (mach_msg_header_t *)malloc_type_malloc(v13, 0x1C5E0787uLL);
  if (v14)
  {
    v15 = v14;
    msgh_remote_port = a1->msgh_remote_port;
    v14->msgh_bits = a1->msgh_bits & 0x1F;
    v14->msgh_size = 36;
    *(_QWORD *)&v14->msgh_remote_port = msgh_remote_port;
    v14->msgh_id = a1->msgh_id + 100;
    if ((v12 & 1) != 0)
    {
      *(_QWORD *)&v14[1].msgh_bits = *MEMORY[0x1E0C804E8];
      v14[1].msgh_remote_port = -303;
    }
    else
    {
      v17 = *(const void **)(a4 + 16);
      if (v17)
      {
        pthread_setspecific(__APSMIGServerCalloutContextKey, v17);
        v11(a1, v15);
        pthread_setspecific(__APSMIGServerCalloutContextKey, 0);
      }
      else
      {
        v11(a1, v14);
      }
    }
    msgh_bits = v15->msgh_bits;
    if ((v15->msgh_bits & 0x80000000) == 0)
    {
      v19 = v15[1].msgh_remote_port;
      if (v19 == -305)
      {
LABEL_31:
        free(v15);
        return 0;
      }
      if (v19 && (a1->msgh_bits & 0x80000000) != 0)
      {
        a1->msgh_remote_port = 0;
        mach_msg_destroy(a1);
        msgh_bits = v15->msgh_bits;
      }
    }
    if (v15->msgh_remote_port)
    {
      if ((msgh_bits & 0x1F) == 0x12)
        v20 = 1;
      else
        v20 = 17;
      v21 = mach_msg(v15, v20, v15->msgh_size, 0, 0, 0, 0);
      if ((v21 - 268435459) >= 2 && v21 != 0)
      {
        v23 = (FILE *)*MEMORY[0x1E0C80C10];
        v24 = mach_error_string(v21);
        fprintf(v23, "<CFRunLoopSource MIG Server> mach_msg send error in reply: %s\n", v24);
        goto LABEL_31;
      }
      if ((v21 - 268435459) > 1)
        goto LABEL_31;
      msgh_bits = v15->msgh_bits;
    }
    if ((msgh_bits & 0x80000000) != 0)
      mach_msg_destroy(v15);
    goto LABEL_31;
  }
  return 0;
}

uint64_t APSGetMachPortForMIGServerSource(__CFRunLoopSource *a1)
{
  CFRunLoopSourceContext context;

  memset(&context.info, 0, 64);
  context.version = 1;
  CFRunLoopSourceGetContext(a1, &context);
  return *(unsigned int *)context.info;
}

void *APSGetContextForCalloutCurrentMIGServerSource()
{
  return pthread_getspecific(__APSMIGServerCalloutContextKey);
}

uint64_t APSSetsAreEqual(void *a1, void *a2)
{
  id v3;
  id v4;
  void *v5;
  uint64_t v6;

  v3 = a1;
  v4 = a2;
  v5 = v4;
  if (v3 == v4)
    goto LABEL_8;
  if (!v3)
  {
    if (objc_msgSend(v4, "count"))
    {
      if (v5)
      {
        v6 = 0;
        goto LABEL_10;
      }
LABEL_9:
      v6 = objc_msgSend(v3, "count") == 0;
      goto LABEL_10;
    }
LABEL_8:
    v6 = 1;
    goto LABEL_10;
  }
  if (!v4)
    goto LABEL_9;
  v6 = objc_msgSend(v3, "isEqualToSet:", v4);
LABEL_10:

  return v6;
}

uint64_t APSArraysAreEqual(void *a1, void *a2)
{
  id v3;
  id v4;
  void *v5;
  uint64_t v6;

  v3 = a1;
  v4 = a2;
  v5 = v4;
  if (v3 == v4)
    goto LABEL_8;
  if (!v3)
  {
    if (objc_msgSend(v4, "count"))
    {
      if (v5)
      {
        v6 = 0;
        goto LABEL_10;
      }
LABEL_9:
      v6 = objc_msgSend(v3, "count") == 0;
      goto LABEL_10;
    }
LABEL_8:
    v6 = 1;
    goto LABEL_10;
  }
  if (!v4)
    goto LABEL_9;
  v6 = objc_msgSend(v3, "isEqualToArray:", v4);
LABEL_10:

  return v6;
}

uint64_t APSDictionariesAreEqual(void *a1, void *a2)
{
  id v3;
  id v4;
  void *v5;
  uint64_t v6;

  v3 = a1;
  v4 = a2;
  v5 = v4;
  if (v3 == v4)
    goto LABEL_8;
  if (!v3)
  {
    if (objc_msgSend(v4, "count"))
    {
      if (v5)
      {
        v6 = 0;
        goto LABEL_10;
      }
LABEL_9:
      v6 = objc_msgSend(v3, "count") == 0;
      goto LABEL_10;
    }
LABEL_8:
    v6 = 1;
    goto LABEL_10;
  }
  if (!v4)
    goto LABEL_9;
  v6 = objc_msgSend(v3, "isEqualToDictionary:", v4);
LABEL_10:

  return v6;
}

uint64_t APSDatasAreEqual(void *a1, void *a2)
{
  id v3;
  id v4;
  void *v5;
  uint64_t v6;

  v3 = a1;
  v4 = a2;
  v5 = v4;
  if (v3 == v4)
    goto LABEL_8;
  if (!v3)
  {
    if (objc_msgSend(v4, "length"))
    {
      if (v5)
      {
        v6 = 0;
        goto LABEL_10;
      }
LABEL_9:
      v6 = objc_msgSend(v3, "length") == 0;
      goto LABEL_10;
    }
LABEL_8:
    v6 = 1;
    goto LABEL_10;
  }
  if (!v4)
    goto LABEL_9;
  v6 = objc_msgSend(v3, "isEqualToData:", v4);
LABEL_10:

  return v6;
}

uint64_t APSDifferenceSets(void *a1, void *a2, _QWORD *a3, _QWORD *a4)
{
  id v7;
  id v8;
  int v9;
  id v10;
  id v11;

  v7 = a1;
  v8 = a2;
  v9 = APSSetsAreEqual(v7, v8);
  if ((v9 & 1) == 0)
  {
    if (v7)
    {
      if (v8)
      {
LABEL_4:
        v10 = (id)objc_msgSend(v7, "mutableCopy");
        *a4 = v10;
        objc_msgSend(v10, "minusSet:", v8);
        v11 = (id)objc_msgSend(v8, "mutableCopy");
        *a3 = v11;
        objc_msgSend(v11, "minusSet:", v7);
        goto LABEL_5;
      }
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E20], "setWithCapacity:", 0);
      v7 = (id)objc_claimAutoreleasedReturnValue();
      if (v8)
        goto LABEL_4;
    }
    objc_msgSend(MEMORY[0x1E0C99E20], "setWithCapacity:", 0);
    v8 = (id)objc_claimAutoreleasedReturnValue();
    goto LABEL_4;
  }
LABEL_5:

  return v9 ^ 1u;
}

CFPropertyListRef APSCopyValueForKey(const __CFString *a1, int a2)
{
  void *v4;
  int v5;
  BOOL v6;
  void *v7;
  void *v8;
  uint64_t v9;

  +[APSMultiUserMode sharedInstance](APSMultiUserMode, "sharedInstance");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "isMultiUser");

  if (v5)
    v6 = a2 == 0;
  else
    v6 = 1;
  if (v6)
    return CFPreferencesCopyAppValue(a1, CFSTR("com.apple.apsd"));
  +[APSMultiUserFS sharedInstance](APSMultiUserFS, "sharedInstance");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "systemPath");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "stringByAppendingString:", CFSTR("/"));
  v9 = _CFPreferencesCopyValueWithContainer();

  return (CFPropertyListRef)v9;
}

void APSSetValueForKey(const __CFString *a1, const void *a2, int a3)
{
  void *v6;
  int v7;
  BOOL v8;
  void *v9;
  id v10;

  +[APSMultiUserMode sharedInstance](APSMultiUserMode, "sharedInstance");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "isMultiUser");

  if (v7)
    v8 = a3 == 0;
  else
    v8 = 1;
  if (v8)
  {
    CFPreferencesSetAppValue(a1, a2, CFSTR("com.apple.apsd"));
  }
  else
  {
    +[APSMultiUserFS sharedInstance](APSMultiUserFS, "sharedInstance");
    v10 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "systemPath");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "stringByAppendingString:", CFSTR("/"));
    _CFPreferencesSetValueWithContainer();

  }
}

void APSSynchronize(int a1)
{
  void *v2;
  int v3;
  BOOL v4;
  void *v5;
  id v6;

  +[APSMultiUserMode sharedInstance](APSMultiUserMode, "sharedInstance");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isMultiUser");

  if (v3)
    v4 = a1 == 0;
  else
    v4 = 1;
  if (v4)
  {
    CFPreferencesAppSynchronize(CFSTR("com.apple.apsd"));
  }
  else
  {
    +[APSMultiUserFS sharedInstance](APSMultiUserFS, "sharedInstance");
    v6 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "systemPath");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "stringByAppendingString:", CFSTR("/"));
    _CFPreferencesSynchronizeWithContainer();

  }
}

BOOL isAudioAccessory()
{
  return MGGetSInt32Answer() == 7;
}

__CFString *APSTLSErrorStringFromError(void *a1)
{
  uint64_t v1;

  v1 = objc_msgSend(a1, "code");
  if ((unint64_t)(v1 + 9886) > 0x56)
    return 0;
  else
    return off_1E3C8C030[v1 + 9886];
}

id APSCopyBase64URLStringForData(void *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;

  objc_msgSend(a1, "base64EncodedStringWithOptions:", 0);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "stringByReplacingOccurrencesOfString:withString:", CFSTR("+"), CFSTR("-"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v2, "stringByReplacingOccurrencesOfString:withString:", CFSTR("/"), CFSTR("_"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v3, "stringByReplacingOccurrencesOfString:withString:", CFSTR("="), &stru_1E3C8CB18);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

id APSCopyHashForData(void *a1)
{
  id v1;
  const void *v2;
  CC_LONG v3;
  unsigned __int8 md[20];
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  v1 = objc_retainAutorelease(a1);
  v2 = (const void *)objc_msgSend(v1, "bytes");
  v3 = objc_msgSend(v1, "length");

  CC_SHA1(v2, v3, md);
  return (id)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D50]), "initWithBytes:length:", md, 20);
}

id APSCopySHA256HashForData(void *a1)
{
  id v1;
  const void *v2;
  CC_LONG v3;
  unsigned __int8 md[32];
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  v1 = objc_retainAutorelease(a1);
  v2 = (const void *)objc_msgSend(v1, "bytes");
  v3 = objc_msgSend(v1, "length");

  CC_SHA256(v2, v3, md);
  return (id)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D50]), "initWithBytes:length:", md, 32);
}

id APSCopyHashForString(void *a1)
{
  void *v1;
  void *v2;

  objc_msgSend(a1, "dataUsingEncoding:", 4);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  APSCopyHashForData(v1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  return v2;
}

id APSCopyStringRepresentationOfData(void *a1)
{
  id v1;
  uint64_t v2;
  id v3;
  char *v4;
  void *i;
  uint64_t v6;

  v1 = a1;
  v2 = objc_msgSend(v1, "length");
  v3 = objc_retainAutorelease(v1);
  v4 = (char *)objc_msgSend(v3, "bytes");
  for (i = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB37A0]), "initWithCapacity:", 2 * v2); v2; --v2)
  {
    v6 = *v4++;
    objc_msgSend(i, "appendFormat:", CFSTR("%02x"), v6);
  }

  return i;
}

id APSCopyStringHashForString(void *a1)
{
  void *v1;
  void *v2;

  APSCopyHashForString(a1);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  APSCopyStringRepresentationOfData(v1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  return v2;
}

id APSSaltedSHA256(void *a1, id *a2)
{
  void *v3;
  id v4;
  void *v5;
  id v6;
  id v7;
  void *v8;
  unsigned __int8 v10[32];
  CC_SHA256_CTX __buf;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a1, "dataUsingEncoding:", 4);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (a2 && objc_msgSend(*a2, "length"))
  {
    v4 = *a2;
  }
  else
  {
    arc4random_buf(&__buf, 8uLL);
    objc_msgSend(MEMORY[0x1E0C99D50], "dataWithBytes:length:", &__buf, 8);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = v5;
    if (a2)
      *a2 = objc_retainAutorelease(v5);
  }
  memset(&__buf, 0, sizeof(__buf));
  CC_SHA256_Init(&__buf);
  v6 = objc_retainAutorelease(v3);
  CC_SHA256_Update(&__buf, (const void *)objc_msgSend(v6, "bytes"), objc_msgSend(v6, "length"));
  v7 = objc_retainAutorelease(v4);
  CC_SHA256_Update(&__buf, (const void *)objc_msgSend(v7, "bytes"), objc_msgSend(v7, "length"));
  CC_SHA256_Final(v10, &__buf);
  objc_msgSend(MEMORY[0x1E0C99D50], "dataWithBytes:length:", v10, 32);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

BOOL APSGenerateNonceAndSignature(__SecKey *a1, __SecKey *a2, void *a3, uint64_t *a4, void **a5, void *a6, int a7)
{
  id v13;
  id v14;
  _BOOL8 v15;
  void *v16;
  double v17;
  double v18;
  unint64_t v19;
  id v20;
  void *v21;
  NSObject *v22;
  int v23;
  int v24;
  char v25;
  const __CFString **v26;
  const __CFString *v27;
  const __CFData *v28;
  int v29;
  NSObject *v30;
  NSObject *v31;
  uint64_t v32;
  void *v33;
  void *v34;
  NSObject *v35;
  uint64_t v36;
  CFErrorRef v38;
  _BYTE v39[2];
  uint8_t buf[4];
  _BYTE v41[18];
  char v42;
  unint64_t v43;
  _QWORD v44[2];

  v44[1] = *MEMORY[0x1E0C80C00];
  v13 = a3;
  v14 = a6;
  v15 = 0;
  if (a2 && a4 && a5)
  {
    objc_msgSend(MEMORY[0x1E0C99D68], "date");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "timeIntervalSince1970");
    v18 = v17;

    if (v14)
    {
      if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_19BBC2000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "Generating nonce with time override.", buf, 2u);
      }
      v19 = objc_msgSend(v14, "unsignedLongLongValue");
    }
    else
    {
      v19 = 1000 * (unint64_t)v18;
    }
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134217984;
      *(_QWORD *)v41 = v19;
      _os_log_impl(&dword_19BBC2000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "Generating nonce with timestamp %llu", buf, 0xCu);
    }
    v42 = a7;
    v43 = bswap64(v19);
    arc4random_buf(v44, 8uLL);
    objc_msgSend(MEMORY[0x1E0C99D50], "dataWithBytes:length:", &v42, 17);
    *a4 = (uint64_t)(id)objc_claimAutoreleasedReturnValue();
    v20 = objc_alloc_init(MEMORY[0x1E0C99DF0]);
    v21 = v20;
    if (*a4 && a7)
      objc_msgSend(v20, "appendData:");
    if (v13)
      objc_msgSend(v21, "appendData:", v13);
    if (*a4 && (a7 & 1) == 0)
      objc_msgSend(v21, "appendData:");
    +[APSLog nonce](APSLog, "nonce");
    v22 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
    {
      v23 = objc_msgSend(v21, "length");
      *(_DWORD *)buf = 67109378;
      *(_DWORD *)v41 = v23;
      *(_WORD *)&v41[4] = 2112;
      *(_QWORD *)&v41[6] = v21;
      _os_log_impl(&dword_19BBC2000, v22, OS_LOG_TYPE_DEFAULT, "Signature input is %d bytes (%@)", buf, 0x12u);
    }

    v24 = usingBAAClientIdentityProvider();
    if (v24)
      v25 = 3;
    else
      v25 = 1;
    v39[0] = 1;
    v39[1] = v25;
    v26 = (const __CFString **)MEMORY[0x1E0CD6E88];
    if (v24)
      v26 = (const __CFString **)MEMORY[0x1E0CD6DF8];
    v27 = *v26;
    v38 = 0;
    v28 = SecKeyCreateSignature(a2, v27, (CFDataRef)v21, &v38);
    if (v28)
    {
      if (a1)
      {
        v29 = SecKeyVerifySignature(a1, v27, (CFDataRef)v21, v28, &v38);
        +[APSLog nonce](APSLog, "nonce");
        v30 = objc_claimAutoreleasedReturnValue();
        v31 = v30;
        if (!v29)
        {
          if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
            APSGenerateNonceAndSignature_cold_1(a4, (uint64_t *)&v38, v31);

          v15 = 0;
          *a5 = 0;
          goto LABEL_42;
        }
        if (os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT))
        {
          v32 = *a4;
          *(_DWORD *)buf = 138412290;
          *(_QWORD *)v41 = v32;
          _os_log_impl(&dword_19BBC2000, v31, OS_LOG_TYPE_DEFAULT, "Succeeded verifying signature for: %@", buf, 0xCu);
        }

      }
      objc_msgSend(MEMORY[0x1E0C99DF0], "dataWithBytes:length:", v39, 2);
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v33, "appendData:", v28);
      *a5 = (id)objc_msgSend(v33, "copy");

      v34 = *a5;
    }
    else
    {
      +[APSLog nonce](APSLog, "nonce");
      v35 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v35, OS_LOG_TYPE_DEFAULT))
      {
        v36 = *a4;
        *(_DWORD *)buf = 138412546;
        *(_QWORD *)v41 = v36;
        *(_WORD *)&v41[8] = 2112;
        *(_QWORD *)&v41[10] = v38;
        _os_log_impl(&dword_19BBC2000, v35, OS_LOG_TYPE_DEFAULT, "Failed signing nonce: %@   with error: %@", buf, 0x16u);
      }

      v34 = 0;
      *a5 = 0;
    }
    if (objc_msgSend(v34, "length"))
      v15 = objc_msgSend((id)*a4, "length") != 0;
    else
      v15 = 0;
LABEL_42:

  }
  return v15;
}

uint64_t isVirtualMachine()
{
  if (isVirtualMachine_onceToken != -1)
    dispatch_once(&isVirtualMachine_onceToken, &__block_literal_global_1);
  return isVirtualMachine_result;
}

uint64_t __isVirtualMachine_block_invoke()
{
  uint64_t result;
  size_t v1;
  int v2;

  v2 = 0;
  v1 = 4;
  result = sysctlbyname("kern.hv_vmm_present", &v2, &v1, 0, 0);
  if (!(_DWORD)result)
    isVirtualMachine_result = v2 != 0;
  return result;
}

uint64_t usingBAAClientIdentityProvider()
{
  int IsSupported;
  unsigned int v1;
  char v2;
  uint64_t result;

  IsSupported = DeviceIdentityIsSupported();
  v1 = _os_feature_enabled_impl();
  v2 = _os_feature_enabled_impl();
  result = IsSupported & v1;
  if ((_DWORD)result == 1 && (v2 & 1) == 0)
  {
    if (isVirtualMachine_onceToken != -1)
      dispatch_once(&isVirtualMachine_onceToken, &__block_literal_global_1);
    return isVirtualMachine_result;
  }
  return result;
}

BOOL keepAliveConfigurationToKeepAliveIntervalConfiguration(uint64_t a1)
{
  return a1 != 0;
}

id APSDecodeDictionary(void *a1)
{
  id v1;
  void *v2;
  id v3;
  id v4;
  void *v5;
  NSObject *v6;
  void *v7;
  id v9;
  uint64_t v10;

  v1 = a1;
  v2 = v1;
  if (v1 && objc_msgSend(v1, "length"))
  {
    v9 = 0;
    v10 = 0;
    objc_msgSend(MEMORY[0x1E0CB38B0], "propertyListWithData:options:format:error:", v2, 0, &v10, &v9);
    v3 = (id)objc_claimAutoreleasedReturnValue();
    v4 = v9;
    if (v4)
    {
      v5 = v4;
      +[APSLog xpc](APSLog, "xpc");
      v6 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
        APSDecodeDictionary_cold_1();

      v7 = 0;
    }
    else
    {
      v3 = v3;
      v7 = v3;
    }

  }
  else
  {
    v7 = 0;
  }

  return v7;
}

void sub_19BBDD470()
{
  objc_end_catch();
  JUMPOUT(0x19BBDD478);
}

id APSHexStringFromNSData(void *a1)
{
  id v1;
  uint64_t v2;
  void *v3;
  id v4;
  uint64_t v5;
  unsigned __int8 *v6;
  unsigned int v7;
  void *v8;

  v1 = a1;
  v2 = objc_msgSend(v1, "length");
  objc_msgSend(MEMORY[0x1E0CB37A0], "stringWithCapacity:", 2 * v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_retainAutorelease(v1);
  v5 = objc_msgSend(v4, "bytes");
  if (v2)
  {
    v6 = (unsigned __int8 *)v5;
    do
    {
      v7 = *v6++;
      objc_msgSend(v3, "appendFormat:", CFSTR("%02x"), v7);
      --v2;
    }
    while (v2);
  }
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithString:", v3);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

id APSNSDataFromHexString(void *a1)
{
  void *v1;
  id v2;
  unint64_t v3;
  uint64_t v4;
  char __str[2];
  __int16 v7;

  objc_msgSend(a1, "stringByReplacingOccurrencesOfString:withString:", CFSTR(" "), &stru_1E3C8CB18);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = objc_alloc_init(MEMORY[0x1E0C99DF0]);
  v7 = 0;
  if ((unint64_t)objc_msgSend(v1, "length") >= 2)
  {
    v3 = 0;
    v4 = 1;
    do
    {
      __str[0] = objc_msgSend(v1, "characterAtIndex:", v4 - 1);
      __str[1] = objc_msgSend(v1, "characterAtIndex:", v4);
      HIBYTE(v7) = strtol(__str, 0, 16);
      objc_msgSend(v2, "appendBytes:length:", (char *)&v7 + 1, 1);
      ++v3;
      v4 += 2;
    }
    while (v3 < (unint64_t)objc_msgSend(v1, "length") >> 1);
  }

  return v2;
}

_xpc_connection_s *APSXPCCreateServerConnection(const char *a1, void *a2, void *a3, void *a4, void *a5)
{
  id v9;
  id v10;
  id v11;
  id v12;
  NSObject *v13;
  id v14;
  xpc_connection_t mach_service;
  _xpc_connection_s *v16;
  id v17;
  id v18;
  id v19;
  id v20;
  void *v21;
  _xpc_connection_s *v22;
  _QWORD handler[4];
  _xpc_connection_s *v25;
  id v26;
  id v27;
  id v28;
  id v29;

  v9 = a2;
  v10 = a3;
  v11 = a4;
  v12 = a5;
  if (_os_feature_enabled_impl())
  {
    v13 = v12;
    if (!a1)
      goto LABEL_7;
  }
  else
  {
    v13 = MEMORY[0x1E0C80D38];
    v14 = MEMORY[0x1E0C80D38];
    if (!a1)
    {
LABEL_7:
      mach_service = xpc_connection_create(0, v13);
      goto LABEL_8;
    }
  }
  if (!*a1)
    goto LABEL_7;
  mach_service = xpc_connection_create_mach_service(a1, v13, 1uLL);
LABEL_8:
  handler[0] = MEMORY[0x1E0C809B0];
  handler[1] = 3221225472;
  handler[2] = __APSXPCCreateServerConnection_block_invoke;
  handler[3] = &unk_1E3C8C318;
  v16 = mach_service;
  v27 = v9;
  v28 = v10;
  v25 = v16;
  v26 = v12;
  v29 = v11;
  v17 = v11;
  v18 = v12;
  v19 = v10;
  v20 = v9;
  xpc_connection_set_event_handler(v16, handler);
  v21 = v29;
  v22 = v16;

  return v22;
}

_xpc_connection_s *APSXPCCreateConnectionForService(char a1, const char *a2, void *a3, void *a4)
{
  return APSXPCCreateConnectionForServiceWithQueue(a1, 1, a2, 0, a3, a4);
}

void APSInsertUltraConstrainedTopicsToXPCDictionary(void *a1, void *a2)
{
  _APSInsertTopicsToXPCDictionary(a1, "ultraConstrainedTopics", a2);
}

id APSGetUltraConstrainedTopicsFromXPCDictionary(void *a1)
{
  return _APSGetTopicsFromXPCDictionary(a1, "ultraConstrainedTopics");
}

uint64_t APSInsertUnsignedLongLongsToXPCDictionary(xpc_object_t xdict, const char *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  const char **v10;
  uint64_t *v12;

  v12 = (uint64_t *)&a9;
  if (a2)
  {
    do
    {
      xpc_dictionary_set_uint64(xdict, a2, *v12);
      v10 = (const char **)(v12 + 1);
      v12 += 2;
      a2 = *v10;
    }
    while (*v10);
  }
  return 1;
}

uint64_t APSInsertNSUIntegersToXPCDictionary(xpc_object_t xdict, const char *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  const char **v10;
  uint64_t *v12;

  v12 = (uint64_t *)&a9;
  if (a2)
  {
    do
    {
      xpc_dictionary_set_uint64(xdict, a2, *v12);
      v10 = (const char **)(v12 + 1);
      v12 += 2;
      a2 = *v10;
    }
    while (*v10);
  }
  return 1;
}

uint64_t APSInsertDoublesToXPCDictionary(xpc_object_t xdict, const char *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  const char **v10;
  double *v12;

  v12 = (double *)&a9;
  if (a2)
  {
    do
    {
      xpc_dictionary_set_double(xdict, a2, *v12);
      v10 = (const char **)(v12 + 1);
      v12 += 2;
      a2 = *v10;
    }
    while (*v10);
  }
  return 1;
}

uint64_t APSInsertNSDictionariesToXPCDictionary(void *a1, const char *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  id v10;
  id *v11;
  id v12;
  void *v13;
  const char **v14;
  id *v16;
  _QWORD *v17;

  v10 = a1;
  v16 = (id *)&a9;
  if (a2)
  {
    do
    {
      v11 = v16;
      v17 = v16 + 1;
      v12 = *v11;
      if (v12)
      {
        v13 = (void *)_CFXPCCreateXPCObjectFromCFObject();
        if (v13)
          xpc_dictionary_set_value(v10, a2, v13);

      }
      v14 = (const char **)v17;
      v16 = (id *)(v17 + 1);
      a2 = *v14;
    }
    while (*v14);
  }

  return 1;
}

uint64_t APSInsertNSArraysToXPCDictionary(void *a1, const char *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  id v10;
  id *v11;
  id v12;
  void *v13;
  const char **v14;
  id *v16;
  _QWORD *v17;

  v10 = a1;
  v16 = (id *)&a9;
  if (a2)
  {
    do
    {
      v11 = v16;
      v17 = v16 + 1;
      v12 = *v11;
      if (v12)
      {
        v13 = (void *)_CFXPCCreateXPCObjectFromCFObject();
        if (v13)
          xpc_dictionary_set_value(v10, a2, v13);

      }
      v14 = (const char **)v17;
      v16 = (id *)(v17 + 1);
      a2 = *v14;
    }
    while (*v14);
  }

  return 1;
}

uint64_t APSGetXPCNSUIntegerFromDictionary(void *a1, const char *a2)
{
  if (a2)
    return xpc_dictionary_get_uint64(a1, a2);
  else
    return 0;
}

uint64_t APSGetXPCUnsignedLongLongFromDictionary(void *a1, const char *a2)
{
  if (a2)
    return xpc_dictionary_get_uint64(a1, a2);
  else
    return 0;
}

double APSGetXPCDoubleFromDictionary(xpc_object_t xdict, const char *key)
{
  if (key)
    return xpc_dictionary_get_double(xdict, key);
  else
    return 0.0;
}

id APSGetXPCDictionaryFromDictionary(void *a1, const char *a2)
{
  uint64_t v2;
  void *v3;
  void *v4;

  if (a2)
  {
    xpc_dictionary_get_value(a1, a2);
    v2 = objc_claimAutoreleasedReturnValue();
    v3 = (void *)v2;
    if (v2 && MEMORY[0x1A1AC945C](v2) == MEMORY[0x1E0C812F8])
      v4 = (void *)_CFXPCCreateCFObjectFromXPCObject();
    else
      v4 = 0;

  }
  else
  {
    v4 = 0;
  }
  return v4;
}

id APSGetXPCArrayFromDictionary(void *a1, const char *a2)
{
  uint64_t v2;
  void *v3;
  void *v4;

  if (a2)
  {
    xpc_dictionary_get_value(a1, a2);
    v2 = objc_claimAutoreleasedReturnValue();
    v3 = (void *)v2;
    if (v2 && MEMORY[0x1A1AC945C](v2) == MEMORY[0x1E0C812C8])
      v4 = (void *)_CFXPCCreateCFObjectFromXPCObject();
    else
      v4 = 0;

  }
  else
  {
    v4 = 0;
  }
  return v4;
}

id APSDataForPropertyList(void *a1)
{
  id v1;
  void *v2;

  v1 = a1;
  if (v1)
  {
    objc_msgSend(MEMORY[0x1E0CB38B0], "dataWithPropertyList:format:options:error:", v1, 200, 0, 0);
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v2)
      objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99778], CFSTR("argument can't be converted to a property list"));
  }
  else
  {
    v2 = 0;
  }

  return v2;
}

id APSPropertyListFromNSData(void *a1)
{
  id v1;
  void *v2;

  v1 = a1;
  if (objc_msgSend(v1, "length"))
  {
    objc_msgSend(MEMORY[0x1E0CB38B0], "propertyListWithData:options:format:error:", v1, 0, 0, 0);
    v2 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v2 = 0;
  }

  return v2;
}

void APSAlert(void *a1)
{
  id v1;

  v1 = a1;
  if (APSAlert_onceToken != -1)
    dispatch_once(&APSAlert_onceToken, &__block_literal_global_2);
  if (sAPSAlertsEnabled)
    CUTXPCAlertv();

}

void aps_connection_finalizer(void *a1)
{
  id cf;

  if (a1)
  {
    cf = a1;
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      CFRelease(cf);

    }
    else
    {

    }
  }
}

void _APSLoadPreferences()
{
  const __CFBoolean *v0;
  const __CFBoolean *v1;
  CFTypeID v2;

  v0 = (const __CFBoolean *)CFPreferencesCopyValue(CFSTR("APSAlertsEnabled"), CFSTR("com.apple.apsalerts"), CFSTR("mobile"), (CFStringRef)*MEMORY[0x1E0C9B250]);
  if (v0)
  {
    v1 = v0;
    v2 = CFGetTypeID(v0);
    if (v2 == CFBooleanGetTypeID())
      sAPSAlertsEnabled = CFBooleanGetValue(v1) != 0;
    CFRelease(v1);
  }
}

const char *OUTLINED_FUNCTION_0_1(uint64_t a1)
{
  return xpc_connection_get_name(*(xpc_connection_t *)(a1 + 32));
}

void OUTLINED_FUNCTION_2_0(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint8_t *a5)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, a5, 0xCu);
}

void __aps_connection_event_handler_block_invoke_17(uint64_t a1, void *a2)
{
  xpc_object_t reply;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  id v11;

  v11 = a2;
  reply = xpc_dictionary_create_reply(*(xpc_object_t *)(a1 + 32));
  v10 = reply;
  if (reply)
  {
    APSInsertDatasToXPCDictionary(reply, "publicToken", v4, v5, v6, v7, v8, v9, (uint64_t)v11);
    xpc_connection_send_message(*(xpc_connection_t *)(a1 + 40), v10);
  }

}

_DWORD *(*ConnectionDeliver_server_routine(uint64_t a1))(_DWORD *result, uint64_t a2)
{
  if (*(_DWORD *)(a1 + 20) == 473000)
    return _XPingClient;
  else
    return 0;
}

_DWORD *_XPingClient(_DWORD *result, uint64_t a2)
{
  if ((*result & 0x80000000) != 0 || result[1] != 24)
  {
    *(_DWORD *)(a2 + 32) = -304;
    *(_QWORD *)(a2 + 24) = *MEMORY[0x1E0C804E8];
  }
  else
  {
    result = (_DWORD *)_APSPingClient();
    *(_DWORD *)(a2 + 32) = (_DWORD)result;
  }
  return result;
}

uint64_t ConnectionDeliver_server(_DWORD *a1, uint64_t a2)
{
  unsigned int v2;
  int v3;
  uint64_t result;

  v2 = a1[2];
  *(_DWORD *)a2 = *a1 & 0x1F;
  *(_DWORD *)(a2 + 4) = 36;
  v3 = a1[5] + 100;
  *(_QWORD *)(a2 + 8) = v2;
  *(_DWORD *)(a2 + 16) = 0;
  *(_DWORD *)(a2 + 20) = v3;
  if (a1[5] == 473000)
  {
    if ((*a1 & 0x80000000) != 0 || a1[1] != 24)
    {
      *(_DWORD *)(a2 + 32) = -304;
      *(_QWORD *)(a2 + 24) = *MEMORY[0x1E0C804E8];
    }
    else
    {
      *(_DWORD *)(a2 + 32) = _APSPingClient();
    }
    return 1;
  }
  else
  {
    result = 0;
    *(_QWORD *)(a2 + 24) = *MEMORY[0x1E0C804E8];
    *(_DWORD *)(a2 + 32) = -303;
  }
  return result;
}

void APSGenerateNonceAndSignature_cold_1(uint64_t *a1, uint64_t *a2, os_log_t log)
{
  uint64_t v3;
  uint64_t v4;
  int v5;
  uint64_t v6;
  __int16 v7;
  uint64_t v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  v3 = *a1;
  v4 = *a2;
  v5 = 138412546;
  v6 = v3;
  v7 = 2112;
  v8 = v4;
  _os_log_error_impl(&dword_19BBC2000, log, OS_LOG_TYPE_ERROR, "Failed verifying signature for: %@   with error: %@", (uint8_t *)&v5, 0x16u);
}

void APSEncodeDictionary_cold_1()
{
  NSObject *v0;
  uint8_t v1[24];
  uint64_t v2;

  v2 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_3(&dword_19BBC2000, v0, (uint64_t)v0, "Could not encode dictionary %@ exception %@", v1);
  OUTLINED_FUNCTION_2();
}

void APSDecodeDictionary_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[24];
  uint64_t v3;

  v3 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_2_0(&dword_19BBC2000, v0, v1, "Got error %@ when deserializing outgoing message data", v2);
  OUTLINED_FUNCTION_2();
}

void APSDecodeDictionary_cold_2()
{
  NSObject *v0;
  uint8_t v1[24];
  uint64_t v2;

  v2 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_3(&dword_19BBC2000, v0, (uint64_t)v0, "Could not decode dictionary data %@ exception %@", v1);
  OUTLINED_FUNCTION_2();
}

void APSXPCCreateConnectionForServiceWithQueue_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_5(&dword_19BBC2000, v0, v1, "Unable to build service for name %s", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

void APSSetXPCConnectionContext_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_19BBC2000, a1, a3, "Unsafe behavior - we shouldn't replace xpc context.", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_7();
}

void APSLoggableDescriptionForObjectOnTopic_cold_1()
{
  void *v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "BOOL aps_IDSShouldUseRestrictedLoggingForService(NSString * _Nullable __strong)");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", v1, CFSTR("APSPrivateLogging.m"), 16, CFSTR("%s"), dlerror());

  __break(1u);
}

void __getIDSShouldUseRestrictedLoggingForServiceSymbolLoc_block_invoke_cold_1(_QWORD *a1)
{
  void *v2;
  void *v3;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "void *IDSFoundationLibrary(void)");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "handleFailureInFunction:file:lineNumber:description:", v3, CFSTR("APSPrivateLogging.m"), 15, CFSTR("%s"), *a1);

  __break(1u);
}

void __aps_connection_event_handler_block_invoke_2_cold_1(uint64_t *a1)
{
  uint64_t v1;
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  v1 = *a1;
  v2 = 138412290;
  v3 = v1;
  _os_log_fault_impl(&dword_19BBC2000, MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT, "Connection for %@ differs from current queue!!", (uint8_t *)&v2, 0xCu);
}

unsigned __int8 *__cdecl CC_SHA1(const void *data, CC_LONG len, unsigned __int8 *md)
{
  return (unsigned __int8 *)MEMORY[0x1E0C80328](data, *(_QWORD *)&len, md);
}

unsigned __int8 *__cdecl CC_SHA256(const void *data, CC_LONG len, unsigned __int8 *md)
{
  return (unsigned __int8 *)MEMORY[0x1E0C80368](data, *(_QWORD *)&len, md);
}

int CC_SHA256_Final(unsigned __int8 *md, CC_SHA256_CTX *c)
{
  return MEMORY[0x1E0C80370](md, c);
}

int CC_SHA256_Init(CC_SHA256_CTX *c)
{
  return MEMORY[0x1E0C80378](c);
}

int CC_SHA256_Update(CC_SHA256_CTX *c, const void *data, CC_LONG len)
{
  return MEMORY[0x1E0C80380](c, data, *(_QWORD *)&len);
}

CFTypeID CFBooleanGetTypeID(void)
{
  return MEMORY[0x1E0C97FC8]();
}

Boolean CFBooleanGetValue(CFBooleanRef BOOLean)
{
  return MEMORY[0x1E0C97FE0](BOOLean);
}

void CFDictionaryAddValue(CFMutableDictionaryRef theDict, const void *key, const void *value)
{
  MEMORY[0x1E0C98500](theDict, key, value);
}

CFMutableDictionaryRef CFDictionaryCreateMutable(CFAllocatorRef allocator, CFIndex capacity, const CFDictionaryKeyCallBacks *keyCallBacks, const CFDictionaryValueCallBacks *valueCallBacks)
{
  return (CFMutableDictionaryRef)MEMORY[0x1E0C98550](allocator, capacity, keyCallBacks, valueCallBacks);
}

CFTypeID CFGetTypeID(CFTypeRef cf)
{
  return MEMORY[0x1E0C98738](cf);
}

void CFNotificationCenterAddObserver(CFNotificationCenterRef center, const void *observer, CFNotificationCallback callBack, CFStringRef name, const void *object, CFNotificationSuspensionBehavior suspensionBehavior)
{
  MEMORY[0x1E0C988B0](center, observer, callBack, name, object, suspensionBehavior);
}

CFNotificationCenterRef CFNotificationCenterGetDarwinNotifyCenter(void)
{
  return (CFNotificationCenterRef)MEMORY[0x1E0C988B8]();
}

Boolean CFPreferencesAppSynchronize(CFStringRef applicationID)
{
  return MEMORY[0x1E0C98A30](applicationID);
}

CFPropertyListRef CFPreferencesCopyAppValue(CFStringRef key, CFStringRef applicationID)
{
  return (CFPropertyListRef)MEMORY[0x1E0C98A40](key, applicationID);
}

CFPropertyListRef CFPreferencesCopyValue(CFStringRef key, CFStringRef applicationID, CFStringRef userName, CFStringRef hostName)
{
  return (CFPropertyListRef)MEMORY[0x1E0C98A60](key, applicationID, userName, hostName);
}

Boolean CFPreferencesGetAppBooleanValue(CFStringRef key, CFStringRef applicationID, Boolean *keyExistsAndHasValidFormat)
{
  return MEMORY[0x1E0C98A70](key, applicationID, keyExistsAndHasValidFormat);
}

void CFPreferencesSetAppValue(CFStringRef key, CFPropertyListRef value, CFStringRef applicationID)
{
  MEMORY[0x1E0C98A80](key, value, applicationID);
}

Boolean CFPreferencesSynchronize(CFStringRef applicationID, CFStringRef userName, CFStringRef hostName)
{
  return MEMORY[0x1E0C98A98](applicationID, userName, hostName);
}

void CFRelease(CFTypeRef cf)
{
  MEMORY[0x1E0C98BC0](cf);
}

CFTypeRef CFRetain(CFTypeRef cf)
{
  return (CFTypeRef)MEMORY[0x1E0C98BD0](cf);
}

void CFRunLoopAddSource(CFRunLoopRef rl, CFRunLoopSourceRef source, CFRunLoopMode mode)
{
  MEMORY[0x1E0C98BF8](rl, source, mode);
}

CFRunLoopSourceRef CFRunLoopSourceCreate(CFAllocatorRef allocator, CFIndex order, CFRunLoopSourceContext *context)
{
  return (CFRunLoopSourceRef)MEMORY[0x1E0C98CC8](allocator, order, context);
}

void CFRunLoopSourceGetContext(CFRunLoopSourceRef source, CFRunLoopSourceContext *context)
{
  MEMORY[0x1E0C98CD0](source, context);
}

CFStringRef CFStringCreateWithBytes(CFAllocatorRef alloc, const UInt8 *bytes, CFIndex numBytes, CFStringEncoding encoding, Boolean isExternalRepresentation)
{
  return (CFStringRef)MEMORY[0x1E0C98FB8](alloc, bytes, numBytes, *(_QWORD *)&encoding, isExternalRepresentation);
}

CFStringRef CFStringCreateWithFormat(CFAllocatorRef alloc, CFDictionaryRef formatOptions, CFStringRef format, ...)
{
  return (CFStringRef)MEMORY[0x1E0C99018](alloc, formatOptions, format);
}

CFIndex CFStringGetBytes(CFStringRef theString, CFRange range, CFStringEncoding encoding, UInt8 lossByte, Boolean isExternalRepresentation, UInt8 *buffer, CFIndex maxBufLen, CFIndex *usedBufLen)
{
  return MEMORY[0x1E0C99080](theString, range.location, range.length, *(_QWORD *)&encoding, lossByte, isExternalRepresentation, buffer, maxBufLen);
}

const char *__cdecl CFStringGetCStringPtr(CFStringRef theString, CFStringEncoding encoding)
{
  return (const char *)MEMORY[0x1E0C990A0](theString, *(_QWORD *)&encoding);
}

CFIndex CFStringGetLength(CFStringRef theString)
{
  return MEMORY[0x1E0C99100](theString);
}

CFUUIDRef CFUUIDCreate(CFAllocatorRef alloc)
{
  return (CFUUIDRef)MEMORY[0x1E0C99518](alloc);
}

CFStringRef CFUUIDCreateString(CFAllocatorRef alloc, CFUUIDRef uuid)
{
  return (CFStringRef)MEMORY[0x1E0C99538](alloc, uuid);
}

uint64_t CUTWeakLinkClass()
{
  return MEMORY[0x1E0D131E0]();
}

uint64_t CUTWeakLinkSymbol()
{
  return MEMORY[0x1E0D131E8]();
}

uint64_t CUTXPCAlertv()
{
  return MEMORY[0x1E0D131F0]();
}

uint64_t DeviceIdentityIsSupported()
{
  return MEMORY[0x1E0D1D0F0]();
}

uint64_t MGGetSInt32Answer()
{
  return MEMORY[0x1E0DE2B70]();
}

void NSLog(NSString *format, ...)
{
  MEMORY[0x1E0CB2D88](format);
}

OSStatus SecItemCopyMatching(CFDictionaryRef query, CFTypeRef *result)
{
  return MEMORY[0x1E0CD6298](query, result);
}

CFDataRef SecKeyCreateSignature(SecKeyRef key, SecKeyAlgorithm algorithm, CFDataRef dataToSign, CFErrorRef *error)
{
  return (CFDataRef)MEMORY[0x1E0CD6390](key, algorithm, dataToSign, error);
}

Boolean SecKeyVerifySignature(SecKeyRef key, SecKeyAlgorithm algorithm, CFDataRef signedData, CFDataRef signature, CFErrorRef *error)
{
  return MEMORY[0x1E0CD6418](key, algorithm, signedData, signature, error);
}

void _Block_object_dispose(const void *a1, const int a2)
{
  MEMORY[0x1E0C80948](a1, *(_QWORD *)&a2);
}

uint64_t _CFPreferencesCopyValueWithContainer()
{
  return MEMORY[0x1E0C9A320]();
}

uint64_t _CFPreferencesSetValueWithContainer()
{
  return MEMORY[0x1E0C9A398]();
}

uint64_t _CFPreferencesSynchronizeWithContainer()
{
  return MEMORY[0x1E0C9A3A0]();
}

uint64_t _CFXPCCreateCFObjectFromXPCMessage()
{
  return MEMORY[0x1E0C9A7F0]();
}

uint64_t _CFXPCCreateCFObjectFromXPCObject()
{
  return MEMORY[0x1E0C9A800]();
}

uint64_t _CFXPCCreateXPCMessageWithCFObject()
{
  return MEMORY[0x1E0C9A808]();
}

uint64_t _CFXPCCreateXPCObjectFromCFObject()
{
  return MEMORY[0x1E0C9A818]();
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
  MEMORY[0x1E0C80A20](exception_object);
}

uint64_t _os_feature_enabled_impl()
{
  return MEMORY[0x1E0C81010]();
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

uint64_t _sl_dlopen()
{
  return MEMORY[0x1E0DA88F0]();
}

void arc4random_buf(void *__buf, size_t __nbytes)
{
  MEMORY[0x1E0C81580](__buf, __nbytes);
}

uint64_t bootstrap_check_in2()
{
  return MEMORY[0x1E0C81700]();
}

uint64_t container_system_path_for_identifier()
{
  return MEMORY[0x1E0C82A98]();
}

void dispatch_after(dispatch_time_t when, dispatch_queue_t queue, dispatch_block_t block)
{
  MEMORY[0x1E0C82BC8](when, queue, block);
}

void dispatch_assert_queue_V2(dispatch_queue_t queue)
{
  MEMORY[0x1E0C82BE8](queue);
}

void dispatch_assert_queue_not_V2(dispatch_queue_t queue)
{
  MEMORY[0x1E0C82BF8](queue);
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

void dispatch_group_notify(dispatch_group_t group, dispatch_queue_t queue, dispatch_block_t block)
{
  MEMORY[0x1E0C82D38](group, queue, block);
}

uint64_t dispatch_mig_server()
{
  return MEMORY[0x1E0C82DF8]();
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
  MEMORY[0x1E0C82E08](predicate, block);
}

dispatch_queue_t dispatch_queue_create(const char *label, dispatch_queue_attr_t attr)
{
  return (dispatch_queue_t)MEMORY[0x1E0C82E48](label, attr);
}

void dispatch_resume(dispatch_object_t object)
{
  MEMORY[0x1E0C82EA0](object);
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

uint64_t dispatch_source_cancel_and_wait()
{
  return MEMORY[0x1E0C82F18]();
}

dispatch_source_t dispatch_source_create(dispatch_source_type_t type, uintptr_t handle, uintptr_t mask, dispatch_queue_t queue)
{
  return (dispatch_source_t)MEMORY[0x1E0C82F20](type, handle, mask, queue);
}

uintptr_t dispatch_source_get_handle(dispatch_source_t source)
{
  return MEMORY[0x1E0C82F30](source);
}

void dispatch_source_set_event_handler(dispatch_source_t source, dispatch_block_t handler)
{
  MEMORY[0x1E0C82F58](source, handler);
}

void dispatch_sync(dispatch_queue_t queue, dispatch_block_t block)
{
  MEMORY[0x1E0C82F90](queue, block);
}

dispatch_time_t dispatch_time(dispatch_time_t when, int64_t delta)
{
  return MEMORY[0x1E0C82FB8](when, delta);
}

char *dlerror(void)
{
  return (char *)MEMORY[0x1E0C83038]();
}

void *__cdecl dlopen(const char *__path, int __mode)
{
  return (void *)MEMORY[0x1E0C83040](__path, *(_QWORD *)&__mode);
}

void *__cdecl dlsym(void *__handle, const char *__symbol)
{
  return (void *)MEMORY[0x1E0C83050](__handle, __symbol);
}

void exit(int a1)
{
  MEMORY[0x1E0C83278](*(_QWORD *)&a1);
}

int fprintf(FILE *a1, const char *a2, ...)
{
  return MEMORY[0x1E0C83478](a1, a2);
}

void free(void *a1)
{
  MEMORY[0x1E0C834A8](a1);
}

size_t fwrite(const void *__ptr, size_t __size, size_t __nitems, FILE *__stream)
{
  return MEMORY[0x1E0C835E0](__ptr, __size, __nitems, __stream);
}

uint64_t kdebug_trace()
{
  return MEMORY[0x1E0C83A20]();
}

uint64_t mach_absolute_time(void)
{
  return MEMORY[0x1E0C83C50]();
}

char *__cdecl mach_error_string(mach_error_t error_value)
{
  return (char *)MEMORY[0x1E0C83C80](*(_QWORD *)&error_value);
}

mach_msg_return_t mach_msg(mach_msg_header_t *msg, mach_msg_option_t option, mach_msg_size_t send_size, mach_msg_size_t rcv_size, mach_port_name_t rcv_name, mach_msg_timeout_t timeout, mach_port_name_t notify)
{
  return MEMORY[0x1E0C83CB0](msg, *(_QWORD *)&option, *(_QWORD *)&send_size, *(_QWORD *)&rcv_size, *(_QWORD *)&rcv_name, *(_QWORD *)&timeout, *(_QWORD *)&notify);
}

void mach_msg_destroy(mach_msg_header_t *a1)
{
  MEMORY[0x1E0C83CC0](a1);
}

kern_return_t mach_port_allocate(ipc_space_t task, mach_port_right_t right, mach_port_name_t *name)
{
  return MEMORY[0x1E0C83CE0](*(_QWORD *)&task, *(_QWORD *)&right, name);
}

kern_return_t mach_port_mod_refs(ipc_space_t task, mach_port_name_t name, mach_port_right_t right, mach_port_delta_t delta)
{
  return MEMORY[0x1E0C83D58](*(_QWORD *)&task, *(_QWORD *)&name, *(_QWORD *)&right, *(_QWORD *)&delta);
}

kern_return_t mach_timebase_info(mach_timebase_info_t info)
{
  return MEMORY[0x1E0C83DB8](info);
}

void *__cdecl malloc_type_malloc(size_t size, malloc_type_id_t type_id)
{
  return (void *)MEMORY[0x1E0C83F00](size, type_id);
}

uint32_t notify_cancel(int token)
{
  return MEMORY[0x1E0C843D8](*(_QWORD *)&token);
}

uint32_t notify_post(const char *name)
{
  return MEMORY[0x1E0C843F8](name);
}

uint32_t notify_register_check(const char *name, int *out_token)
{
  return MEMORY[0x1E0C84400](name, out_token);
}

uint32_t notify_register_dispatch(const char *name, int *out_token, dispatch_queue_t queue, notify_handler_t handler)
{
  return MEMORY[0x1E0C84408](name, out_token, queue, handler);
}

uint32_t notify_set_state(int token, uint64_t state64)
{
  return MEMORY[0x1E0C84428](*(_QWORD *)&token, state64);
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

id objc_begin_catch(void *exc_buf)
{
  return (id)MEMORY[0x1E0DE7BF0](exc_buf);
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

void objc_end_catch(void)
{
  MEMORY[0x1E0DE7C80]();
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

id objc_retainAutoreleasedReturnValue(id a1)
{
  return (id)MEMORY[0x1E0DE7E68](a1);
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

void os_unfair_lock_lock(os_unfair_lock_t lock)
{
  MEMORY[0x1E0C84998](lock);
}

void os_unfair_lock_unlock(os_unfair_lock_t lock)
{
  MEMORY[0x1E0C849B0](lock);
}

uint64_t os_variant_has_internal_content()
{
  return MEMORY[0x1E0C849F0]();
}

void *__cdecl pthread_getspecific(pthread_key_t a1)
{
  return (void *)MEMORY[0x1E0C84DC0](a1);
}

int pthread_key_create(pthread_key_t *a1, void (__cdecl *a2)(void *))
{
  return MEMORY[0x1E0C84DE0](a1, a2);
}

int pthread_once(pthread_once_t *a1, void (*a2)(void))
{
  return MEMORY[0x1E0C84E68](a1, a2);
}

int pthread_setspecific(pthread_key_t a1, const void *a2)
{
  return MEMORY[0x1E0C84F18](a1, a2);
}

size_t strlen(const char *__s)
{
  return MEMORY[0x1E0C85578](__s);
}

uint64_t strtol(const char *__str, char **__endptr, int __base)
{
  return MEMORY[0x1E0C85658](__str, __endptr, *(_QWORD *)&__base);
}

int sysctlbyname(const char *a1, void *a2, size_t *a3, void *a4, size_t a5)
{
  return MEMORY[0x1E0C857A0](a1, a2, a3, a4, a5);
}

void xpc_connection_cancel(xpc_connection_t connection)
{
  MEMORY[0x1E0C85F68](connection);
}

xpc_connection_t xpc_connection_create(const char *name, dispatch_queue_t targetq)
{
  return (xpc_connection_t)MEMORY[0x1E0C85F90](name, targetq);
}

xpc_connection_t xpc_connection_create_mach_service(const char *name, dispatch_queue_t targetq, uint64_t flags)
{
  return (xpc_connection_t)MEMORY[0x1E0C85FB0](name, targetq, flags);
}

void *__cdecl xpc_connection_get_context(xpc_connection_t connection)
{
  return (void *)MEMORY[0x1E0C85FE0](connection);
}

const char *__cdecl xpc_connection_get_name(xpc_connection_t connection)
{
  return (const char *)MEMORY[0x1E0C86000](connection);
}

void xpc_connection_resume(xpc_connection_t connection)
{
  MEMORY[0x1E0C86018](connection);
}

void xpc_connection_send_message(xpc_connection_t connection, xpc_object_t message)
{
  MEMORY[0x1E0C86030](connection, message);
}

void xpc_connection_send_message_with_reply(xpc_connection_t connection, xpc_object_t message, dispatch_queue_t replyq, xpc_handler_t handler)
{
  MEMORY[0x1E0C86038](connection, message, replyq, handler);
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

void xpc_connection_set_target_queue(xpc_connection_t connection, dispatch_queue_t targetq)
{
  MEMORY[0x1E0C860C8](connection, targetq);
}

uint64_t xpc_copy_entitlements_for_self()
{
  return MEMORY[0x1E0C86138]();
}

xpc_object_t xpc_dictionary_create(const char *const *keys, xpc_object_t *values, size_t count)
{
  return (xpc_object_t)MEMORY[0x1E0C86208](keys, values, count);
}

xpc_object_t xpc_dictionary_create_reply(xpc_object_t original)
{
  return (xpc_object_t)MEMORY[0x1E0C86228](original);
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

