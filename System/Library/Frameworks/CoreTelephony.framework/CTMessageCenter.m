@implementation CTMessageCenter

- (BOOL)isMmsConfiguredForSub:(id)a3
{
  xpc_object_t v4;
  uint64_t v5;
  NSObject *v6;
  const char *v7;
  const char *v8;
  NSObject *v9;
  uint32_t v10;
  NSObject *v11;
  int v12;
  NSObject *v13;
  xpc_object_t v14;
  xpc_object_t v15;
  uint64_t v16;
  uint64_t v17;
  unint64_t v18;
  int v19;
  unint64_t v20;
  NSObject *v21;
  NSObject *v22;
  const char *v23;
  const char *v24;
  xpc_object_t v26;
  xpc_object_t v27;
  xpc_object_t v28;
  _BYTE object[24];
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  if (!_messageCenterServerConnection)
  {
    v11 = CTLogMessageCenter();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      -[CTMessageCenter isMmsConfiguredForSub:].cold.1();
    LOBYTE(v12) = 0;
    return v12;
  }
  xpc::dict_creator::dict_creator((xpc::dict_creator *)object);
  xpc::dict_creator::operator()<char const*>("kSmsIsMmsConfigured", (xpc_object_t *)object, "kRequest", &v27);
  xpc_release(*(xpc_object_t *)object);
  v4 = v27;
  v28 = v27;
  v27 = xpc_null_create();
  xpc_release(v27);
  if (a3)
  {
    v5 = objc_msgSend(a3, "slotID");
    v6 = CTLogMessageCenter();
    if (!os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
      goto LABEL_11;
    v7 = CTSubscriptionSlotAsString(v5);
    *(_DWORD *)object = 136315138;
    *(_QWORD *)&object[4] = v7;
    v8 = "MMS configured check requested for slot %s";
    v9 = v6;
    v10 = 12;
  }
  else
  {
    v13 = CTLogMessageCenter();
    v5 = 1;
    if (!os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
      goto LABEL_11;
    *(_WORD *)object = 0;
    v8 = "MMS configured check slot forced to CTSubscriptionSlotOne";
    v5 = 1;
    v9 = v13;
    v10 = 2;
  }
  _os_log_impl(&dword_18425C000, v9, OS_LOG_TYPE_INFO, v8, object, v10);
LABEL_11:
  v14 = xpc_int64_create(v5);
  if (!v14)
    v14 = xpc_null_create();
  xpc_dictionary_set_value(v4, "kSmsSubInstance", v14);
  v15 = xpc_null_create();
  xpc_release(v14);
  xpc_release(v15);
  if (-[CTMessageCenter isMmsConfiguredForSub:]::kOnceToken != -1)
    dispatch_once(&-[CTMessageCenter isMmsConfiguredForSub:]::kOnceToken, &__block_literal_global_2);
  if (-[CTMessageCenter isMmsConfiguredForSub:]::kMaxRetries)
    v16 = 3;
  else
    v16 = 1;
  v17 = MEMORY[0x1E0C812F8];
  while (1)
  {
    v27 = 0;
    v27 = xpc_null_create();
    v18 = SendXpcMessage(_messageCenterServerConnection, &v28, &v27);
    v19 = v18;
    v20 = HIDWORD(v18);
    if (!HIDWORD(v18) && MEMORY[0x186DBAE5C](v27) == v17)
      break;
    v21 = CTLogMessageCenter();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)object = 136315650;
      *(_QWORD *)&object[4] = "kSmsIsMmsConfigured";
      *(_WORD *)&object[12] = 1024;
      *(_DWORD *)&object[14] = v19;
      *(_WORD *)&object[18] = 1024;
      *(_DWORD *)&object[20] = v20;
      _os_log_error_impl(&dword_18425C000, v21, OS_LOG_TYPE_ERROR, "MMS configured check for slot %s failed (%d, %d) retrying...", object, 0x18u);
    }
    xpc_release(v27);
    if (!--v16)
    {
      LOBYTE(v12) = 0;
      goto LABEL_30;
    }
  }
  *(_QWORD *)object = &v27;
  *(_QWORD *)&object[8] = "kSmsMmsIsConfigured";
  xpc::dict::object_proxy::operator xpc::object((uint64_t)object, &v26);
  v12 = xpc::dyn_cast_or_default((xpc *)&v26, 0);
  xpc_release(v26);
  v22 = CTLogMessageCenter();
  if (os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
  {
    v23 = CTSubscriptionSlotAsString(v5);
    v24 = "NO";
    if (v12)
      v24 = "YES";
    *(_DWORD *)object = 136315394;
    *(_QWORD *)&object[4] = v23;
    *(_WORD *)&object[12] = 2080;
    *(_QWORD *)&object[14] = v24;
    _os_log_impl(&dword_18425C000, v22, OS_LOG_TYPE_INFO, "MMS configured check for slot %s: %s", object, 0x16u);
  }
  xpc_release(v27);
LABEL_30:
  xpc_release(v28);
  return v12;
}

- (BOOL)isMmsConfigured
{
  return -[CTMessageCenter isMmsConfiguredForSub:](self, "isMmsConfiguredForSub:", -[CTXPCServiceSubscriptionContext initWithSlot:]([CTXPCServiceSubscriptionContext alloc], "initWithSlot:", 1));
}

+ (id)sharedMessageCenter
{
  id result;

  result = (id)_sharedMessageCenter;
  if (!_sharedMessageCenter)
  {
    result = objc_alloc_init(CTMessageCenter);
    _sharedMessageCenter = (uint64_t)result;
  }
  return result;
}

- (CTMessageCenter)init
{
  CTMessageCenter *v2;
  const __CFAllocator *v3;
  const char *v4;
  CFStringRef v5;
  _OWORD v7[2];
  uint64_t v8;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)CTMessageCenter;
  v2 = -[CTMessageCenter init](&v9, sel_init);
  if (v2)
  {
    v8 = 0;
    memset(v7, 0, sizeof(v7));
    v3 = (const __CFAllocator *)*MEMORY[0x1E0C9AE00];
    v4 = getprogname();
    v5 = CFStringCreateWithFormat(v3, 0, CFSTR("%s-CTMessageCenter"), v4);
    if (v5)
      CFRelease(v5);
  }
  return v2;
}

void __41__CTMessageCenter_isMmsConfiguredForSub___block_invoke()
{
  NSObject *v0;
  uint64_t v1;
  CFStringRef theString1;
  _BYTE buf[24];
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  theString1 = 0;
  *(_QWORD *)buf = MGCopyAnswer();
  ctu::cf::CFSharedRef<__CFString const>::CFSharedRef<void const,void>(&theString1, (CFTypeRef *)buf);
  if (CFStringCompare(theString1, CFSTR("iPhone"), 0) == kCFCompareEqualTo)
    -[CTMessageCenter isMmsConfiguredForSub:]::kMaxRetries = 1;
  v0 = sMsgCtrLog();
  if (os_log_type_enabled(v0, OS_LOG_TYPE_DEFAULT))
  {
    v1 = 3;
    if (!-[CTMessageCenter isMmsConfiguredForSub:]::kMaxRetries)
      v1 = 1;
    *(_DWORD *)buf = 134217984;
    *(_QWORD *)&buf[4] = v1;
    _os_log_impl(&dword_18425C000, v0, OS_LOG_TYPE_DEFAULT, "Configuring max \"is MMS configured\" retries as %zu", buf, 0xCu);
  }
  if (theString1)
    CFRelease(theString1);
}

- (BOOL)getCharacterCount:(int64_t *)a3 andMessageSplitThreshold:(int64_t *)a4 forSmsText:(id)a5
{
  return -[CTMessageCenter getCharacterCountForSub:count:andMessageSplitThreshold:forSmsText:](self, "getCharacterCountForSub:count:andMessageSplitThreshold:forSmsText:", -[CTXPCServiceSubscriptionContext initWithSlot:]([CTXPCServiceSubscriptionContext alloc], "initWithSlot:", 1), a3, a4, a5);
}

- (BOOL)getCharacterCountForSub:(id)a3 count:(int64_t *)a4 andMessageSplitThreshold:(int64_t *)a5 forSmsText:(id)a6
{
  int v7;
  xpc_object_t v11;
  const void *v12;
  xpc_object_t v13;
  uint64_t v14;
  NSObject *v15;
  const char *v16;
  NSObject *v18;
  xpc_object_t v19;
  xpc_object_t v20;
  xpc_object_t v21;
  xpc_object_t value;
  xpc_object_t v23;
  xpc_object_t v24;
  __int128 object;
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  if (!_messageCenterServerConnection)
    return 0;
  v7 = 0;
  if (a5 && a4 && a6)
  {
    xpc::dict_creator::dict_creator((xpc::dict_creator *)&object);
    xpc::dict_creator::operator()<char const*>("kSmsGetCharacterCountAndThresholdForMessage", (xpc_object_t *)&object, "kRequest", &v23);
    xpc_release((xpc_object_t)object);
    v11 = v23;
    v24 = v23;
    v23 = xpc_null_create();
    xpc_release(v23);
    v23 = xpc_null_create();
    ctu::cf_to_xpc((ctu *)a6, v12);
    xpc_dictionary_set_value(v11, "kSmsMessageBody", value);
    v13 = value;
    value = xpc_null_create();
    xpc_release(v13);
    xpc_release(value);
    value = 0;
    if (a3)
    {
      v14 = objc_msgSend(a3, "slotID");
      v15 = CTLogMessageCenter();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
      {
        v16 = CTSubscriptionSlotAsString(v14);
        LODWORD(object) = 136315138;
        *(_QWORD *)((char *)&object + 4) = v16;
        _os_log_impl(&dword_18425C000, v15, OS_LOG_TYPE_INFO, "Character count requested for Slot %s", (uint8_t *)&object, 0xCu);
      }
    }
    else
    {
      v18 = CTLogMessageCenter();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
        -[CTMessageCenter getCharacterCountForSub:count:andMessageSplitThreshold:forSmsText:].cold.1();
      v14 = 1;
    }
    v19 = xpc_int64_create(v14);
    if (!v19)
      v19 = xpc_null_create();
    xpc_dictionary_set_value(v11, "kSmsSubInstance", v19);
    v20 = xpc_null_create();
    xpc_release(v19);
    xpc_release(v20);
    if (!((unint64_t)SendXpcMessage(_messageCenterServerConnection, &v24, &v23) >> 32)
      && MEMORY[0x186DBAE5C](v23) == MEMORY[0x1E0C812F8])
    {
      *(_QWORD *)&object = &v23;
      *((_QWORD *)&object + 1) = "kDidSucceed";
      xpc::dict::object_proxy::operator xpc::object((uint64_t)&object, &v21);
      v7 = xpc::dyn_cast_or_default((xpc *)&v21, 0);
      xpc_release(v21);
      if (v7)
      {
        *(_QWORD *)&object = &v23;
        *((_QWORD *)&object + 1) = "kSmsCharacterCount";
        xpc::dict::object_proxy::operator xpc::object((uint64_t)&object, &v21);
        *a4 = xpc::dyn_cast_or_default((xpc *)&v21, 0);
        xpc_release(v21);
        *(_QWORD *)&object = &v23;
        *((_QWORD *)&object + 1) = "kSmsThreshold";
        xpc::dict::object_proxy::operator xpc::object((uint64_t)&object, &v21);
        *a5 = xpc::dyn_cast_or_default((xpc *)&v21, 0);
        xpc_release(v21);
        v7 = 1;
      }
    }
    else
    {
      v7 = 0;
    }
    xpc_release(v23);
    xpc_release(v24);
  }
  return v7 != 0;
}

- (void)dealloc
{
  objc_super v3;

  if (_messageCenterServerConnection)
    CFRelease((CFTypeRef)_messageCenterServerConnection);
  v3.receiver = self;
  v3.super_class = (Class)CTMessageCenter;
  -[CTMessageCenter dealloc](&v3, sel_dealloc);
}

- ($2825F4736939C4A6D3AD43837233062D)sendSMS:(id)a3 withMoreToFollow:(BOOL)a4 trackingID:(unsigned int *)a5
{
  _BOOL4 v6;
  int64_t v8;
  NSObject *v9;
  NSObject *v10;
  NSObject *v11;
  NSObject *v12;
  NSObject *v13;
  ctu *v14;
  xpc_object_t v15;
  xpc_object_t v16;
  xpc_object_t v17;
  xpc_object_t v18;
  const void *v19;
  xpc_object_t v20;
  xpc_object_t v21;
  xpc_object_t v22;
  xpc_object_t v23;
  xpc_object_t v24;
  xpc_object_t v25;
  xpc_object_t v26;
  xpc_object_t v27;
  xpc_object_t v28;
  NSObject *v29;
  const char *v30;
  unsigned int v31;
  uint64_t v32;
  const char *v33;
  unint64_t v34;
  int v35;
  NSObject *v36;
  unint64_t v37;
  NSObject *v39;
  int v40;
  NSObject *v41;
  NSObject *v42;
  xpc_object_t v43;
  xpc_object_t value;
  xpc_object_t v45;
  xpc_object_t xdict;
  _BYTE object[22];
  __int16 v48;
  uint64_t v49;
  __int16 v50;
  const char *v51;
  uint64_t v52;

  v52 = *MEMORY[0x1E0C80C00];
  if (_messageCenterServerConnection)
  {
    v6 = a4;
    if (objc_msgSend(a3, "messageType") == 1)
    {
      if (objc_msgSend((id)objc_msgSend(a3, "items"), "count"))
      {
        if (objc_msgSend((id)objc_msgSend(a3, "recipients"), "count") == 1)
        {
          if (objc_msgSend(a3, "context"))
          {
            v8 = objc_msgSend((id)objc_msgSend(a3, "context"), "slotID");
          }
          else
          {
            v13 = CTLogMessageCenter();
            if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
              -[CTMessageCenter sendSMS:withMoreToFollow:trackingID:].cold.6(v13);
            v8 = 1;
          }
          v14 = +[CTMMSEncoder encodeSms:](CTMMSEncoder, "encodeSms:", a3);
          if (v14)
          {
            xdict = 0;
            xpc::dict_creator::dict_creator((xpc::dict_creator *)object);
            xpc::dict_creator::operator()<char const*>("kSmsSendMessage", (xpc_object_t *)object, "kRequest", &v45);
            xpc_release(*(xpc_object_t *)object);
            xdict = v45;
            v45 = xpc_null_create();
            xpc_release(v45);
            v15 = xpc_int64_create(objc_msgSend(a3, "messageId"));
            if (!v15)
              v15 = xpc_null_create();
            xpc_dictionary_set_value(xdict, "kSmsMessageID", v15);
            v16 = xpc_null_create();
            xpc_release(v15);
            xpc_release(v16);
            v17 = xpc_int64_create(1);
            if (!v17)
              v17 = xpc_null_create();
            xpc_dictionary_set_value(xdict, "kSmsMessageType", v17);
            v18 = xpc_null_create();
            xpc_release(v17);
            xpc_release(v18);
            ctu::cf_to_xpc(v14, v19);
            xpc_dictionary_set_value(xdict, "kSmsMessageBody", value);
            v20 = value;
            value = xpc_null_create();
            xpc_release(v20);
            xpc_release(value);
            value = 0;
            v21 = xpc_BOOL_create(v6);
            if (!v21)
              v21 = xpc_null_create();
            xpc_dictionary_set_value(xdict, "kSmsMoreMessages", v21);
            v22 = xpc_null_create();
            xpc_release(v21);
            xpc_release(v22);
            v23 = xpc_BOOL_create(objc_msgSend(a3, "bypassSupportedMessageModesCheck"));
            if (!v23)
              v23 = xpc_null_create();
            xpc_dictionary_set_value(xdict, "kBypassSupportedMessageModesCheck", v23);
            v24 = xpc_null_create();
            xpc_release(v23);
            xpc_release(v24);
            v25 = xpc_int64_create(v8);
            if (!v25)
              v25 = xpc_null_create();
            xpc_dictionary_set_value(xdict, "kSmsSubInstance", v25);
            v26 = xpc_null_create();
            xpc_release(v25);
            xpc_release(v26);
            v27 = xpc_int64_create(objc_msgSend(a3, "smsType"));
            if (!v27)
              v27 = xpc_null_create();
            xpc_dictionary_set_value(xdict, "kSmsType", v27);
            v28 = xpc_null_create();
            xpc_release(v27);
            xpc_release(v28);
            v29 = CTLogMessageCenter();
            if (os_log_type_enabled(v29, OS_LOG_TYPE_INFO))
            {
              v30 = CTSubscriptionSlotAsString(v8);
              v31 = objc_msgSend(a3, "messageId");
              v32 = -[ctu length](v14, "length");
              *(_DWORD *)object = 136315906;
              *(_QWORD *)&object[4] = v30;
              *(_WORD *)&object[12] = 2048;
              *(_QWORD *)&object[14] = v31;
              if (v6)
                v33 = "true";
              else
                v33 = "false";
              v48 = 2048;
              v49 = v32;
              v50 = 2080;
              v51 = v33;
              _os_log_impl(&dword_18425C000, v29, OS_LOG_TYPE_INFO, "SMS info context:[%s] Id:[%lu] Length:[%lu] more:[%s]", object, 0x2Au);
            }
            v45 = 0;
            v45 = xpc_null_create();
            v34 = SendXpcMessage(_messageCenterServerConnection, &xdict, &v45);
            if (MEMORY[0x186DBAE5C](v45) == MEMORY[0x1E0C812F8])
            {
              if (xpc_dictionary_get_value(v45, "kSmsMessageResult"))
              {
                *(_QWORD *)object = &v45;
                *(_QWORD *)&object[8] = "kSmsMessageResult";
                xpc::dict::object_proxy::operator xpc::object((uint64_t)object, &v43);
                v35 = xpc::dyn_cast_or_default((xpc *)&v43, 0);
                xpc_release(v43);
              }
              else
              {
                v35 = 0;
              }
              if (a5)
              {
                *(_QWORD *)object = &v45;
                *(_QWORD *)&object[8] = "kSmsMessageID";
                xpc::dict::object_proxy::operator xpc::object((uint64_t)object, &v43);
                *a5 = xpc::dyn_cast_or_default((xpc *)&v43, (const object *)0xFFFFFFFFLL);
                xpc_release(v43);
              }
            }
            else
            {
              v35 = 0;
            }
            v37 = HIDWORD(v34);
            if (HIDWORD(v34) | v35)
            {
              if (!HIDWORD(v34))
              {
                v39 = CTLogMessageCenter();
                if (os_log_type_enabled(v39, OS_LOG_TYPE_INFO))
                {
                  v40 = objc_msgSend(a3, "messageId");
                  *(_DWORD *)object = 67109120;
                  *(_DWORD *)&object[4] = v40;
                  _os_log_impl(&dword_18425C000, v39, OS_LOG_TYPE_INFO, "Queued messageId %u", object, 8u);
                }
                LODWORD(v37) = 0;
LABEL_58:
                xpc_release(v45);
                xpc_release(xdict);
                return ($2825F4736939C4A6D3AD43837233062D)(v34 | ((unint64_t)v37 << 32));
              }
            }
            else
            {
              v41 = CTLogMessageCenter();
              if (os_log_type_enabled(v41, OS_LOG_TYPE_ERROR))
                -[CTMessageCenter sendSMS:withMoreToFollow:trackingID:].cold.5((uint64_t)object, objc_msgSend(a3, "messageId"), v41);
              LODWORD(v37) = -1;
            }
            v42 = CTLogMessageCenter();
            if (os_log_type_enabled(v42, OS_LOG_TYPE_ERROR))
              -[CTMessageCenter sendSMS:withMoreToFollow:trackingID:].cold.4();
            LODWORD(v34) = 2;
            goto LABEL_58;
          }
          v36 = CTLogMessageCenter();
          if (os_log_type_enabled(v36, OS_LOG_TYPE_ERROR))
            -[CTMessageCenter sendSMS:withMoreToFollow:trackingID:].cold.3();
        }
        else
        {
          v12 = CTLogMessageCenter();
          if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
            -[CTMessageCenter sendSMS:withMoreToFollow:trackingID:].cold.7();
        }
      }
      else
      {
        v11 = CTLogMessageCenter();
        if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
          -[CTMessageCenter sendSMS:withMoreToFollow:trackingID:].cold.2();
      }
    }
    else
    {
      v10 = CTLogMessageCenter();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
        -[CTMessageCenter sendSMS:withMoreToFollow:trackingID:].cold.8(a3, v10);
    }
  }
  else
  {
    v9 = CTLogMessageCenter();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      -[CTMessageCenter sendSMS:withMoreToFollow:trackingID:].cold.1();
  }
  LODWORD(v37) = -1;
  LODWORD(v34) = 2;
  return ($2825F4736939C4A6D3AD43837233062D)(v34 | ((unint64_t)v37 << 32));
}

- ($2825F4736939C4A6D3AD43837233062D)sendMMSFromData:(id)a3 messageId:(unsigned int)a4 subSlot:(int64_t)a5
{
  xpc_object_t v8;
  xpc_object_t v9;
  xpc_object_t v10;
  xpc_object_t v11;
  xpc_object_t v12;
  const void *v13;
  xpc_object_t v14;
  xpc_object_t v15;
  xpc_object_t v16;
  xpc_object_t v17;
  xpc_object_t v18;
  NSObject *v19;
  const char *v20;
  uint64_t v21;
  unint64_t v22;
  int v23;
  NSObject *v24;
  unint64_t v25;
  NSObject *v26;
  xpc_object_t v28;
  xpc_object_t value;
  xpc_object_t xdict;
  xpc_object_t v31;
  _BYTE object[22];
  __int16 v33;
  uint64_t v34;
  __int16 v35;
  const char *v36;
  uint64_t v37;

  v37 = *MEMORY[0x1E0C80C00];
  if (_messageCenterServerConnection)
  {
    xpc::dict_creator::dict_creator((xpc::dict_creator *)object);
    xpc::dict_creator::operator()<char const*>("kSmsSendMessage", (xpc_object_t *)object, "kRequest", &xdict);
    xpc_release(*(xpc_object_t *)object);
    v8 = xdict;
    v31 = xdict;
    xdict = xpc_null_create();
    xpc_release(xdict);
    v9 = xpc_int64_create(a4);
    if (!v9)
      v9 = xpc_null_create();
    xpc_dictionary_set_value(v8, "kSmsMessageID", v9);
    v10 = xpc_null_create();
    xpc_release(v9);
    xpc_release(v10);
    v11 = xpc_int64_create(2);
    if (!v11)
      v11 = xpc_null_create();
    xpc_dictionary_set_value(v8, "kSmsMessageType", v11);
    v12 = xpc_null_create();
    xpc_release(v11);
    xpc_release(v12);
    ctu::cf_to_xpc((ctu *)a3, v13);
    xpc_dictionary_set_value(v8, "kSmsMessageBody", value);
    v14 = value;
    value = xpc_null_create();
    xpc_release(v14);
    xpc_release(value);
    value = 0;
    v15 = xpc_BOOL_create(0);
    if (!v15)
      v15 = xpc_null_create();
    xpc_dictionary_set_value(v8, "kSmsMoreMessages", v15);
    v16 = xpc_null_create();
    xpc_release(v15);
    xpc_release(v16);
    v17 = xpc_int64_create(a5);
    if (!v17)
      v17 = xpc_null_create();
    xpc_dictionary_set_value(v8, "kSmsSubInstance", v17);
    v18 = xpc_null_create();
    xpc_release(v17);
    xpc_release(v18);
    v19 = CTLogMessageCenter();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
    {
      v20 = CTSubscriptionSlotAsString(a5);
      v21 = objc_msgSend(a3, "length");
      *(_DWORD *)object = 136315906;
      *(_QWORD *)&object[4] = v20;
      *(_WORD *)&object[12] = 2048;
      *(_QWORD *)&object[14] = a4;
      v33 = 2048;
      v34 = v21;
      v35 = 2080;
      v36 = "false";
      _os_log_impl(&dword_18425C000, v19, OS_LOG_TYPE_INFO, "MMS info context:[%s] Id:[%lu] Length:[%lu] more:[%s]", object, 0x2Au);
    }
    xdict = xpc_null_create();
    v22 = SendXpcMessage(_messageCenterServerConnection, &v31, &xdict);
    if (MEMORY[0x186DBAE5C](xdict) == MEMORY[0x1E0C812F8] && xpc_dictionary_get_value(xdict, "kSmsMessageResult"))
    {
      *(_QWORD *)object = &xdict;
      *(_QWORD *)&object[8] = "kSmsMessageResult";
      xpc::dict::object_proxy::operator xpc::object((uint64_t)object, &v28);
      v23 = xpc::dyn_cast_or_default((xpc *)&v28, 0);
      xpc_release(v28);
    }
    else
    {
      v23 = 0;
    }
    v25 = HIDWORD(v22);
    if (HIDWORD(v22))
    {
      v26 = CTLogMessageCenter();
      if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
        -[CTMessageCenter sendMMSFromData:messageId:subSlot:].cold.2();
      LODWORD(v22) = 2;
    }
    else
    {
      if (v23)
        LODWORD(v25) = 0;
      else
        LODWORD(v25) = -1;
      if (!v23)
        LODWORD(v22) = 2;
    }
    xpc_release(xdict);
    xpc_release(v31);
  }
  else
  {
    v24 = CTLogMessageCenter();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
      -[CTMessageCenter sendMMSFromData:messageId:subSlot:].cold.1();
    LODWORD(v22) = 2;
    LODWORD(v25) = -1;
  }
  return ($2825F4736939C4A6D3AD43837233062D)(v22 | ((unint64_t)v25 << 32));
}

- (void)sendMessageAsSmsToShortCodeRecipients:(id)a3 andReplaceData:(id *)a4
{
  void *v7;
  unint64_t v8;
  void *v9;
  id v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  id v18;
  id *v19;

  if (a3)
  {
    v7 = (void *)objc_msgSend(a3, "recipients");
    v8 = objc_msgSend(v7, "count");
    if (v8 >= 2)
    {
      v9 = (void *)objc_msgSend(v7, "objectEnumerator");
      v10 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
      if (!v10)
        return;
      v11 = v10;
      v19 = a4;
      v12 = objc_msgSend(v9, "nextObject");
      if (v12)
      {
        v13 = (void *)v12;
        do
        {
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
          {
            if (objc_msgSend(v13, "isShortCode"))
            {
              objc_msgSend(v11, "addObject:", v13);
              v14 = (void *)objc_msgSend((id)objc_msgSend(a3, "items"), "objectAtIndex:", 0);
              if (!objc_msgSend((id)objc_msgSend(v14, "contentType"), "caseInsensitiveCompare:", CFSTR("text/plain"))
                || (v14 = (void *)objc_msgSend((id)objc_msgSend(a3, "items"), "objectAtIndex:", 1),
                    !objc_msgSend((id)objc_msgSend(v14, "contentType"), "caseInsensitiveCompare:", CFSTR("text/plain"))))
              {
                if (v14)
                {
                  if (objc_msgSend(v11, "count") == v8)
                    v15 = objc_msgSend(a3, "messageId");
                  else
                    v15 = 999999999;
                  v16 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithBytes:length:encoding:", objc_msgSend((id)objc_msgSend(v14, "data"), "bytes"), objc_msgSend((id)objc_msgSend(v14, "data"), "length"), 4);
                  -[CTMessageCenter sendSMSWithText:text:serviceCenter:toAddress:withID:](self, "sendSMSWithText:text:serviceCenter:toAddress:withID:", objc_msgSend(a3, "context"), v16, 0, objc_msgSend(v13, "canonicalFormat"), v15);

                }
              }
            }
          }
          v13 = (void *)objc_msgSend(v9, "nextObject");
        }
        while (v13);
      }
      if (objc_msgSend(v11, "count"))
        objc_msgSend(a3, "removeRecipientsInArray:", v11);

      a4 = v19;
    }
    v17 = objc_msgSend((id)objc_msgSend(a3, "recipients"), "count");
    if (v17 != v8)
    {
      if (a4 && v17)
      {

        v18 = +[CTMMSEncoder encodeMessage:](CTMMSEncoder, "encodeMessage:", a3);
LABEL_26:
        *a4 = v18;
        return;
      }
      if (!v17)
      {
        objc_msgSend(a3, "setMessageType:", 1);
        if (a4)
        {

          v18 = 0;
          goto LABEL_26;
        }
      }
    }
  }
}

- ($2825F4736939C4A6D3AD43837233062D)sendMMS:(id)a3
{
  const __CFString *MobileUser;
  CFPropertyListRef v6;
  const void *v7;
  CFTypeID v8;
  uint64_t v9;
  void *v10;
  void *v11;
  NSObject *v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  $2825F4736939C4A6D3AD43837233062D v16;
  NSObject *v17;
  const char *v18;
  id v20;
  uint8_t buf[4];
  const char *v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v20 = +[CTMMSEncoder encodeMessage:](CTMMSEncoder, "encodeMessage:");
  if (!v20)
  {
    v12 = CTLogMessageCenter();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      -[CTMessageCenter sendMMS:].cold.1();
    return ($2825F4736939C4A6D3AD43837233062D)0;
  }
  MobileUser = (const __CFString *)_CFStringGetMobileUser();
  v6 = CFPreferencesCopyValue(CFSTR("SendTextMMSToShortCodeAsSMS"), CFSTR("com.apple.carrier_1"), MobileUser, (CFStringRef)*MEMORY[0x1E0C9B230]);
  if (v6)
  {
    v7 = v6;
    v8 = CFGetTypeID(v6);
    if (v8 == CFBooleanGetTypeID() && CFEqual(v7, (CFTypeRef)*MEMORY[0x1E0C9AE50]))
    {
      v9 = objc_msgSend((id)objc_msgSend(a3, "items"), "count");
      v10 = (void *)objc_msgSend(a3, "items");
      if (v9 == 1)
      {
        v11 = (void *)objc_msgSend(v10, "objectAtIndex:", 0);
      }
      else
      {
        if (objc_msgSend(v10, "count") != 2)
          goto LABEL_13;
        v13 = (void *)objc_msgSend((id)objc_msgSend(a3, "items"), "objectAtIndex:", 0);
        v14 = objc_msgSend((id)objc_msgSend(a3, "items"), "objectAtIndex:", 1);
        if (objc_msgSend((id)objc_msgSend(v13, "contentType"), "caseInsensitiveCompare:", CFSTR("application/smil")))
          goto LABEL_13;
        v11 = (void *)v14;
      }
      if (!objc_msgSend((id)objc_msgSend(v11, "contentType"), "caseInsensitiveCompare:", CFSTR("text/plain")))
        -[CTMessageCenter sendMessageAsSmsToShortCodeRecipients:andReplaceData:](self, "sendMessageAsSmsToShortCodeRecipients:andReplaceData:", a3, &v20);
    }
LABEL_13:
    CFRelease(v7);
    if (v20)
      goto LABEL_14;
    return ($2825F4736939C4A6D3AD43837233062D)0;
  }
LABEL_14:
  if (objc_msgSend(a3, "context"))
  {
    v15 = objc_msgSend((id)objc_msgSend(a3, "context"), "slotID");
  }
  else
  {
    v17 = CTLogMessageCenter();
    v15 = 1;
    if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
    {
      v15 = 1;
      v18 = CTSubscriptionSlotAsString(1);
      *(_DWORD *)buf = 136315138;
      v22 = v18;
      _os_log_impl(&dword_18425C000, v17, OS_LOG_TYPE_INFO, "Forcing MMS to:%s", buf, 0xCu);
    }
  }
  v16 = -[CTMessageCenter sendMMSFromData:messageId:subSlot:](self, "sendMMSFromData:messageId:subSlot:", v20, objc_msgSend(a3, "messageId"), v15);

  return v16;
}

- ($2825F4736939C4A6D3AD43837233062D)send:(id)a3
{
  return ($2825F4736939C4A6D3AD43837233062D)-[CTMessageCenter send:withMoreToFollow:](self, "send:withMoreToFollow:", a3, 0);
}

- ($2825F4736939C4A6D3AD43837233062D)send:(id)a3 withMoreToFollow:(BOOL)a4
{
  _BOOL8 v4;
  int v7;
  $2825F4736939C4A6D3AD43837233062D v8;
  unint64_t v9;
  NSObject *v10;

  v4 = a4;
  if (objc_msgSend(a3, "messageId") == -1)
  {
    v8.var0 = 0;
    v9 = 0xFFFFFFFF00000000;
  }
  else
  {
    if (!objc_msgSend(a3, "messageType"))
    {
      if (objc_msgSend((id)objc_msgSend(a3, "items"), "count") == 1
        && !objc_msgSend((id)objc_msgSend((id)objc_msgSend((id)objc_msgSend(a3, "items"), "objectAtIndex:", 0), "contentType"), "caseInsensitiveCompare:", CFSTR("text/plain")))
      {
        objc_msgSend(a3, "setMessageType:", 1);
      }
      if (!objc_msgSend(a3, "messageType"))
        objc_msgSend(a3, "setMessageType:", 2);
    }
    v7 = objc_msgSend(a3, "messageType");
    if (v7)
    {
      if (v7 == 2)
      {
        v8 = -[CTMessageCenter sendMMS:](self, "sendMMS:", a3);
        goto LABEL_17;
      }
      if (v7 == 1)
      {
        v8 = -[CTMessageCenter sendSMS:withMoreToFollow:trackingID:](self, "sendSMS:withMoreToFollow:trackingID:", a3, v4, 0);
LABEL_17:
        v9 = *(_QWORD *)&v8 & 0xFFFFFFFF00000000;
        return ($2825F4736939C4A6D3AD43837233062D)(v8.var0 | v9);
      }
    }
    else
    {
      v10 = CTLogMessageCenter();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
        -[CTMessageCenter send:withMoreToFollow:].cold.1();
    }
    v9 = 0;
    v8.var0 = 0;
  }
  return ($2825F4736939C4A6D3AD43837233062D)(v8.var0 | v9);
}

- (id)incomingMessageWithId:(unsigned int)a3
{
  uint64_t v3;
  xpc_object_t v4;
  xpc_object_t v5;
  uint64_t v6;
  xpc_object_t v7;
  const __CFData *v8;
  int v9;
  NSObject *v10;
  void *v11;
  NSObject *v12;
  ctu *value;
  void *v14;
  ctu *v15;
  void *v16;
  uint64_t (*v17)(uint64_t);
  uint64_t v18;
  NSObject *v19;
  NSObject *v20;
  id v21;
  NSObject *v22;
  NSObject *v23;
  xpc_object_t object;
  const char *v26;
  xpc_object_t v27;
  xpc_object_t xdict;
  xpc_object_t v29;

  if (_messageCenterServerConnection)
  {
    v3 = *(_QWORD *)&a3;
    xdict = 0;
    v29 = xpc_null_create();
    xpc::dict_creator::dict_creator((xpc::dict_creator *)&object);
    xpc::dict_creator::operator()<char const*>("kSmsRetrieveMessage", &object, "kRequest", &v27);
    xpc_release(object);
    xdict = v27;
    v27 = xpc_null_create();
    xpc_release(v27);
    v4 = xpc_int64_create(v3);
    if (!v4)
      v4 = xpc_null_create();
    xpc_dictionary_set_value(xdict, "kSmsMessageID", v4);
    v5 = xpc_null_create();
    xpc_release(v4);
    xpc_release(v5);
    if ((unint64_t)SendXpcMessage(_messageCenterServerConnection, &xdict, &v29) >> 32)
    {
      v12 = CTLogMessageCenter();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
        -[CTMessageCenter incomingMessageWithId:].cold.2();
      v7 = 0;
      v8 = 0;
      goto LABEL_40;
    }
    object = &v29;
    v26 = "kSmsReplyEnabled";
    xpc::dict::object_proxy::operator xpc::object((uint64_t)&object, &v27);
    v6 = xpc::dyn_cast_or_default((xpc *)&v27, 0);
    xpc_release(v27);
    if (MEMORY[0x186DBAE5C](v29) == MEMORY[0x1E0C812F8])
    {
      value = (ctu *)xpc_dictionary_get_value(v29, "kSmsMessageBody");
      ctu::xpc_to_cf(value, v14);
      ctu::cf::CFSharedRef<__CFData const>::CFSharedRef<void const,void>(&object, (CFTypeRef *)&v27);
      v8 = (const __CFData *)object;
      object = 0;
      if (v27)
        CFRelease(v27);
      v15 = (ctu *)xpc_dictionary_get_value(v29, "kSmsMobileCountryCode");
      ctu::xpc_to_cf(v15, v16);
      ctu::cf::CFSharedRef<__CFString const>::CFSharedRef<void const,void>(&object, (CFTypeRef *)&v27);
      v7 = object;
      object = 0;
      if (v27)
        CFRelease(v27);
      object = &v29;
      v26 = "kSmsMessageType";
      xpc::dict::object_proxy::operator xpc::object((uint64_t)&object, &v27);
      v9 = xpc::dyn_cast_or_default((xpc *)&v27, 0);
      xpc_release(v27);
    }
    else
    {
      v7 = 0;
      v8 = 0;
      v9 = 0;
    }
    v17 = ctu::SharedRef<__CFData const,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFData const>::get;
    if (!v8)
      v17 = 0;
    if (!v17)
    {
      v19 = CTLogMessageCenter();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
        -[CTMessageCenter incomingMessageWithId:].cold.2();
      goto LABEL_40;
    }
    if (!CFDataGetLength(v8))
    {
      v20 = CTLogMessageCenter();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
        -[CTMessageCenter incomingMessageWithId:].cold.3();
      goto LABEL_40;
    }
    if (xpc_dictionary_get_value(v29, "kSmsSubInstance"))
    {
      object = &v29;
      v26 = "kSmsSubInstance";
      xpc::dict::object_proxy::operator xpc::object((uint64_t)&object, &v27);
      v18 = xpc::dyn_cast_or_default((xpc *)&v27, 0);
      xpc_release(v27);
      if (!v8)
        goto LABEL_40;
    }
    else
    {
      v18 = 0;
      if (!v8)
        goto LABEL_40;
    }
    if (v9 == 1)
    {
      v21 = +[CTMMSEncoder decodeSmsFromData:data:](CTMMSEncoder, "decodeSmsFromData:data:", -[CTXPCServiceSubscriptionContext initWithSlot:]([CTXPCServiceSubscriptionContext alloc], "initWithSlot:", v18), v8);
      v11 = v21;
      if (!v21)
      {
        v23 = CTLogMessageCenter();
        if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
          -[CTMessageCenter incomingMessageWithId:].cold.5();
        goto LABEL_40;
      }
      goto LABEL_35;
    }
    if (v9 == 2)
    {
      v21 = +[CTMMSEncoder decodeMessageFromData:data:](CTMMSEncoder, "decodeMessageFromData:data:", -[CTXPCServiceSubscriptionContext initWithSlot:]([CTXPCServiceSubscriptionContext alloc], "initWithSlot:", v18), v8);
      v11 = v21;
      if (!v21)
      {
        v22 = CTLogMessageCenter();
        if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
          -[CTMessageCenter incomingMessageWithId:].cold.4();
        goto LABEL_40;
      }
LABEL_35:
      objc_msgSend(v21, "setReplyEnabled:", v6);
      objc_msgSend(v11, "setCountryCode:", v7);
      objc_msgSend(v11, "setMessageId:", v3);
LABEL_41:
      xpc_release(xdict);
      xpc_release(v29);
      if (v7)
        CFRelease(v7);
      if (v8)
        CFRelease(v8);
      return v11;
    }
LABEL_40:
    v11 = 0;
    goto LABEL_41;
  }
  v10 = CTLogMessageCenter();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    -[CTMessageCenter incomingMessageWithId:].cold.1();
  return 0;
}

- (int)incomingMessageCount
{
  NSObject *v2;
  int v3;
  NSObject *v4;
  xpc_object_t object[2];
  xpc_object_t v7;
  xpc_object_t v8;
  xpc_object_t v9;

  if (_messageCenterServerConnection)
  {
    xpc::dict_creator::dict_creator((xpc::dict_creator *)object);
    xpc::dict_creator::operator()<char const*>("kSmsGetIncomingMessageCount", object, "kRequest", &v8);
    xpc_release(object[0]);
    v9 = v8;
    v8 = xpc_null_create();
    xpc_release(v8);
    v8 = xpc_null_create();
    if ((unint64_t)SendXpcMessage(_messageCenterServerConnection, &v9, &v8) >> 32)
    {
      v2 = CTLogMessageCenter();
      if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
        -[CTMessageCenter incomingMessageCount].cold.2();
      v3 = -1;
    }
    else if (MEMORY[0x186DBAE5C](v8) == MEMORY[0x1E0C812F8])
    {
      object[0] = &v8;
      object[1] = "kSmsIncomingMessageCount";
      xpc::dict::object_proxy::operator xpc::object((uint64_t)object, &v7);
      v3 = xpc::dyn_cast_or_default((xpc *)&v7, 0);
      xpc_release(v7);
    }
    else
    {
      v3 = 0;
    }
    xpc_release(v8);
    xpc_release(v9);
  }
  else
  {
    v4 = CTLogMessageCenter();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
      -[CTMessageCenter incomingMessageCount].cold.1();
    return 0;
  }
  return v3;
}

- (void)addMessageOfType:(int)a3 toArray:(id)a4 withIdsFromArray:(id)a5
{
  void *v8;
  uint64_t v9;
  __int128 v10;
  void *v11;
  const char *v12;
  id v13;
  NSObject *v14;
  uint64_t v15;
  __int128 v16;
  uint8_t buf[4];
  uint64_t v18;
  __int16 v19;
  int v20;
  __int16 v21;
  const char *v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v8 = (void *)objc_msgSend(a5, "objectEnumerator");
  v9 = objc_msgSend(v8, "nextObject");
  if (v9)
  {
    v11 = (void *)v9;
    if (a3 == 2)
      v12 = "mms";
    else
      v12 = "sms";
    *(_QWORD *)&v10 = 134218498;
    v16 = v10;
    do
    {
      v13 = -[CTMessageCenter incomingMessageWithId:](self, "incomingMessageWithId:", objc_msgSend(v11, "intValue", v16));
      if (v13)
      {
        objc_msgSend(a4, "addObject:", v13);
      }
      else
      {
        v14 = CTLogMessageCenter();
        if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
        {
          v15 = objc_msgSend(v11, "integerValue");
          *(_DWORD *)buf = v16;
          v18 = v15;
          v19 = 1024;
          v20 = a3;
          v21 = 2080;
          v22 = v12;
          _os_log_error_impl(&dword_18425C000, v14, OS_LOG_TYPE_ERROR, "couldn't get message %ld, type %d (%s)", buf, 0x1Cu);
        }
      }
      v11 = (void *)objc_msgSend(v8, "nextObject");
    }
    while (v11);
  }
}

- (id)allIncomingMessages
{
  id v3;
  NSObject *v4;
  id v6;
  ctu *value;
  void *v8;
  uint64_t (*v9)(uint64_t);
  ctu *v10;
  void *v11;
  uint64_t (*v12)(uint64_t);
  CFTypeRef v13;
  CFTypeRef cf;
  CFTypeRef v15;
  xpc_object_t v16;
  xpc_object_t object;

  if (_messageCenterServerConnection)
  {
    v16 = 0;
    xpc::dict_creator::dict_creator((xpc::dict_creator *)&object);
    xpc::dict_creator::operator()<char const*>("kSmsGetRecievedMessageIds", &object, "kRequest", (xpc_object_t *)&v15);
    xpc_release(object);
    v16 = (xpc_object_t)v15;
    v15 = xpc_null_create();
    xpc_release((xpc_object_t)v15);
    object = 0;
    object = xpc_null_create();
    if (!((unint64_t)SendXpcMessage(_messageCenterServerConnection, &v16, &object) >> 32)
      && MEMORY[0x186DBAE5C](object) == MEMORY[0x1E0C812F8])
    {
      v6 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
      v15 = 0;
      value = (ctu *)xpc_dictionary_get_value(object, "kSmsRecievedSmsMessageIds");
      ctu::xpc_to_cf(value, v8);
      ctu::cf::CFSharedRef<__CFArray const>::CFSharedRef<void const,void>(&v15, &cf);
      if (cf)
        CFRelease(cf);
      if (v15)
        v9 = ctu::SharedRef<__CFArray const,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFArray const>::get;
      else
        v9 = 0;
      if (v9)
        -[CTMessageCenter addMessageOfType:toArray:withIdsFromArray:](self, "addMessageOfType:toArray:withIdsFromArray:", 1, v6);
      cf = 0;
      v10 = (ctu *)xpc_dictionary_get_value(object, "kSmsRecievedMmsMessageIds");
      ctu::xpc_to_cf(v10, v11);
      ctu::cf::CFSharedRef<__CFArray const>::CFSharedRef<void const,void>(&cf, &v13);
      if (v13)
        CFRelease(v13);
      if (cf)
        v12 = ctu::SharedRef<__CFArray const,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFArray const>::get;
      else
        v12 = 0;
      if (v12)
        -[CTMessageCenter addMessageOfType:toArray:withIdsFromArray:](self, "addMessageOfType:toArray:withIdsFromArray:", 2, v6);
      v3 = v6;
      if (cf)
        CFRelease(cf);
      if (v15)
        CFRelease(v15);
    }
    else
    {
      v3 = (id)objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    }
    xpc_release(object);
    xpc_release(v16);
  }
  else
  {
    v4 = CTLogMessageCenter();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
      -[CTMessageCenter allIncomingMessages].cold.1();
    return (id)objc_msgSend(MEMORY[0x1E0C99D20], "array");
  }
  return v3;
}

- (void)acknowledgeIncomingMessageWithId:(unsigned int)a3
{
  acknowledgeMessageWithId(a3, 0);
}

- (void)acknowledgeOutgoingMessageWithId:(unsigned int)a3
{
  acknowledgeMessageWithId(a3, 1);
}

- (id)encodeMessage:(id)a3
{
  return +[CTMMSEncoder encodeMessage:](CTMMSEncoder, "encodeMessage:", a3);
}

- (id)decodeMessage:(id)a3
{
  return +[CTMMSEncoder decodeMessageFromData:data:](CTMMSEncoder, "decodeMessageFromData:data:", -[CTXPCServiceSubscriptionContext initWithSlot:]([CTXPCServiceSubscriptionContext alloc], "initWithSlot:", 1), a3);
}

- ($2825F4736939C4A6D3AD43837233062D)isDeliveryReportsEnabled:(BOOL *)a3
{
  if (a3)
    *a3 = 0;
  return ($2825F4736939C4A6D3AD43837233062D)0;
}

- (BOOL)isMmsEnabled
{
  return -[CTMessageCenter isMmsConfiguredForSub:](self, "isMmsConfiguredForSub:", -[CTXPCServiceSubscriptionContext initWithSlot:]([CTXPCServiceSubscriptionContext alloc], "initWithSlot:", 1));
}

- ($2825F4736939C4A6D3AD43837233062D)isMmsEnabledForSub:(id)a3 enabled:(BOOL *)a4
{
  int64_t v5;
  NSObject *v6;
  unint64_t v7;
  NSObject *v8;
  uint64_t v9;
  xpc_object_t v10;
  xpc_object_t v11;
  xpc_object_t v12;
  unint64_t v13;
  xpc_object_t object[2];
  xpc_object_t v16;
  xpc_object_t v17;
  xpc_object_t v18;

  if (!_messageCenterServerConnection)
  {
    v6 = CTLogMessageCenter();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      -[CTMessageCenter isMmsEnabledForSub:enabled:].cold.1();
    v7 = 0x3600000000;
    goto LABEL_11;
  }
  if (!a4)
  {
    v8 = CTLogMessageCenter();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      -[CTMessageCenter isMmsEnabledForSub:enabled:].cold.2();
    v7 = 0x1600000000;
LABEL_11:
    v9 = 1;
    return ($2825F4736939C4A6D3AD43837233062D)(v9 | v7);
  }
  if (a3)
    v5 = objc_msgSend(a3, "slotID");
  else
    v5 = 1;
  xpc::dict_creator::dict_creator((xpc::dict_creator *)object);
  xpc::dict_creator::operator()<char const*>("kSmsIsMmsConfigured", object, "kRequest", &v17);
  xpc_release(object[0]);
  v10 = v17;
  v18 = v17;
  v17 = xpc_null_create();
  xpc_release(v17);
  v11 = xpc_int64_create(v5);
  if (!v11)
    v11 = xpc_null_create();
  xpc_dictionary_set_value(v10, "kSmsSubInstance", v11);
  v12 = xpc_null_create();
  xpc_release(v11);
  xpc_release(v12);
  v17 = xpc_null_create();
  v13 = SendXpcMessage(_messageCenterServerConnection, &v18, &v17);
  if (!HIDWORD(v13) && MEMORY[0x186DBAE5C](v17) == MEMORY[0x1E0C812F8])
  {
    object[0] = &v17;
    object[1] = "kSmsMmsIsConfigured";
    xpc::dict::object_proxy::operator xpc::object((uint64_t)object, &v16);
    *a4 = xpc::dyn_cast_or_default((xpc *)&v16, 0);
    xpc_release(v16);
  }
  xpc_release(v17);
  xpc_release(v18);
  v7 = v13 & 0xFFFFFFFF00000000;
  v9 = v13;
  return ($2825F4736939C4A6D3AD43837233062D)(v9 | v7);
}

- (BOOL)sendSMSWithText:(id)a3 serviceCenter:(id)a4 toAddress:(id)a5
{
  int v6;

  v6 = -1;
  return -[CTMessageCenter sendSMSWithText:serviceCenter:toAddress:trackingID:](self, "sendSMSWithText:serviceCenter:toAddress:trackingID:", a3, a4, a5, &v6);
}

- (BOOL)sendSMSWithText:(id)a3 text:(id)a4 serviceCenter:(id)a5 toAddress:(id)a6
{
  uint64_t v11;
  CTMessage *v12;
  CTXPCServiceSubscriptionContext *v13;
  BOOL v14;
  NSObject *v15;
  uint64_t v16;
  NSObject *v17;
  int v19;
  uint8_t buf[4];
  uint64_t v21;
  __int16 v22;
  int v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  if (a3 && objc_msgSend(a3, "slotID") != 1)
  {
    if (objc_msgSend(a3, "slotID") != 2)
    {
      v17 = CTLogMessageCenter();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_18425C000, v17, OS_LOG_TYPE_INFO, "Invalid Slot context", buf, 2u);
      }
      return 0;
    }
    v11 = 2;
  }
  else
  {
    v11 = 1;
  }
  v12 = objc_alloc_init(CTMessage);
  v13 = -[CTXPCServiceSubscriptionContext initWithSlot:]([CTXPCServiceSubscriptionContext alloc], "initWithSlot:", v11);
  -[CTMessage setContext:](v12, "setContext:", v13);
  v19 = -1;
  if (!v12)
    return 0;
  if (a4)
    -[CTMessage addText:](v12, "addText:", a4);
  if (!a6)
  {

    return 0;
  }
  -[CTMessage addRecipient:](v12, "addRecipient:", a6);
  if (a5)
    -[CTMessage setServiceCenter:](v12, "setServiceCenter:", +[CTPhoneNumber phoneNumberWithDigits:digits:countryCode:](CTPhoneNumber, "phoneNumberWithDigits:digits:countryCode:", -[CTXPCServiceSubscriptionContext slotID](v13, "slotID"), a5, 0));
  -[CTMessage setMessageId:](v12, "setMessageId:", 0xFFFFFFFFLL);
  -[CTMessage setMessageType:](v12, "setMessageType:", 1);
  v14 = -[CTMessageCenter sendSMS:withMoreToFollow:trackingID:](self, "sendSMS:withMoreToFollow:trackingID:", v12, 0, &v19) == 0;

  v15 = CTLogMessageCenter();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
  {
    v16 = objc_msgSend(a6, "UTF8String");
    *(_DWORD *)buf = 136315394;
    v21 = v16;
    v22 = 1024;
    v23 = v19;
    _os_log_impl(&dword_18425C000, v15, OS_LOG_TYPE_INFO, "Tracking sms to destination %s with message id: %u", buf, 0x12u);
  }
  return v14;
}

- (BOOL)sendSMSWithText:(id)a3 serviceCenter:(id)a4 toAddress:(id)a5 withID:(unsigned int)a6
{
  return -[CTMessageCenter sendSMSWithText:text:serviceCenter:toAddress:withMoreToFollow:withID:](self, "sendSMSWithText:text:serviceCenter:toAddress:withMoreToFollow:withID:", -[CTXPCServiceSubscriptionContext initWithSlot:]([CTXPCServiceSubscriptionContext alloc], "initWithSlot:", 1), a3, a4, a5, 0, *(_QWORD *)&a6);
}

- (BOOL)sendSMSWithText:(id)a3 text:(id)a4 serviceCenter:(id)a5 toAddress:(id)a6 withID:(unsigned int)a7
{
  return -[CTMessageCenter sendSMSWithText:text:serviceCenter:toAddress:withMoreToFollow:withID:](self, "sendSMSWithText:text:serviceCenter:toAddress:withMoreToFollow:withID:", a3, a4, a5, a6, 0, *(_QWORD *)&a7);
}

- (BOOL)sendSMSWithText:(id)a3 serviceCenter:(id)a4 toAddress:(id)a5 trackingID:(unsigned int *)a6
{
  return -[CTMessageCenter sendSMSWithText:text:serviceCenter:toAddress:trackingID:](self, "sendSMSWithText:text:serviceCenter:toAddress:trackingID:", -[CTXPCServiceSubscriptionContext initWithSlot:]([CTXPCServiceSubscriptionContext alloc], "initWithSlot:", 1), a3, a4, a5, a6);
}

- (BOOL)sendSMSWithText:(id)a3 text:(id)a4 serviceCenter:(id)a5 toAddress:(id)a6 trackingID:(unsigned int *)a7
{
  CTMessage *v13;
  CTMessage *v14;
  BOOL v15;
  NSObject *v16;
  uint64_t v17;
  uint64_t v18;
  unsigned int v19;
  int v21;
  uint64_t v22;
  __int16 v23;
  uint64_t v24;
  __int16 v25;
  unsigned int v26;
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  if (!a7)
    return 0;
  *a7 = -1;
  v13 = objc_alloc_init(CTMessage);
  if (!v13)
    return 0;
  v14 = v13;
  -[CTMessage setContext:](v13, "setContext:", a3);
  if (a4)
    -[CTMessage addText:](v14, "addText:", a4);
  if (!a6)
  {

    return 0;
  }
  -[CTMessage addRecipient:](v14, "addRecipient:", a6);
  if (a5)
    -[CTMessage setServiceCenter:](v14, "setServiceCenter:", +[CTPhoneNumber phoneNumberWithDigits:digits:countryCode:](CTPhoneNumber, "phoneNumberWithDigits:digits:countryCode:", objc_msgSend(a3, "slotID"), a5, 0));
  -[CTMessage setMessageType:](v14, "setMessageType:", 1);
  v15 = -[CTMessageCenter sendSMS:withMoreToFollow:trackingID:](self, "sendSMS:withMoreToFollow:trackingID:", v14, 0, a7) == 0;

  v16 = CTLogMessageCenter();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
  {
    v17 = objc_msgSend(a6, "UTF8String");
    v18 = objc_msgSend(a5, "UTF8String");
    v19 = *a7;
    v21 = 136315650;
    v22 = v17;
    v23 = 2080;
    v24 = v18;
    v25 = 1024;
    v26 = v19;
    _os_log_impl(&dword_18425C000, v16, OS_LOG_TYPE_INFO, "Tracking sms to destination %s service center %s with message id: %u", (uint8_t *)&v21, 0x1Cu);
  }
  return v15;
}

- (BOOL)sendSMSWithText:(id)a3 serviceCenter:(id)a4 toAddress:(id)a5 withMoreToFollow:(BOOL)a6 withID:(unsigned int)a7
{
  return -[CTMessageCenter sendSMSWithText:text:serviceCenter:toAddress:withMoreToFollow:withID:](self, "sendSMSWithText:text:serviceCenter:toAddress:withMoreToFollow:withID:", -[CTXPCServiceSubscriptionContext initWithSlot:]([CTXPCServiceSubscriptionContext alloc], "initWithSlot:", 1), a3, a4, a5, a6, *(_QWORD *)&a7);
}

- (BOOL)sendSMSWithText:(id)a3 text:(id)a4 serviceCenter:(id)a5 toAddress:(id)a6 withMoreToFollow:(BOOL)a7 withID:(unsigned int)a8
{
  uint64_t v8;
  _BOOL8 v9;
  CTMessage *v15;
  CTMessage *v16;
  BOOL v17;

  v8 = *(_QWORD *)&a8;
  v9 = a7;
  v15 = objc_alloc_init(CTMessage);
  if (!v15)
    return 0;
  v16 = v15;
  -[CTMessage setContext:](v15, "setContext:", a3);
  if (a4)
    -[CTMessage addText:](v16, "addText:", a4);
  if (a6)
  {
    -[CTMessage addRecipient:](v16, "addRecipient:", a6);
    if (a5)
      -[CTMessage setServiceCenter:](v16, "setServiceCenter:", +[CTPhoneNumber phoneNumberWithDigits:digits:countryCode:](CTPhoneNumber, "phoneNumberWithDigits:digits:countryCode:", objc_msgSend(a3, "slotID"), a5, 0));
    -[CTMessage setMessageId:](v16, "setMessageId:", v8);
    -[CTMessage setMessageType:](v16, "setMessageType:", 1);
    v17 = -[CTMessageCenter send:withMoreToFollow:](self, "send:withMoreToFollow:", v16, v9) == 0;
  }
  else
  {
    v17 = 0;
  }

  return v17;
}

- (BOOL)simulateSmsReceived:(id)a3
{
  ctu *v3;
  xpc_object_t v4;
  const void *v5;
  xpc_object_t v6;
  NSObject *v7;
  xpc_object_t object[2];
  xpc_object_t v10;
  xpc_object_t value;
  xpc_object_t v12;
  xpc_object_t v13;

  if (_messageCenterServerConnection)
  {
    v3 = (ctu *)a3;
    if (a3)
    {
      xpc::dict_creator::dict_creator((xpc::dict_creator *)object);
      xpc::dict_creator::operator()<char const*>("kSimulateSmsReceived", object, "kRequest", &v12);
      xpc_release(object[0]);
      v4 = v12;
      v13 = v12;
      v12 = xpc_null_create();
      xpc_release(v12);
      v12 = xpc_null_create();
      ctu::cf_to_xpc(v3, v5);
      xpc_dictionary_set_value(v4, "kCTSmsPdu", value);
      v6 = value;
      value = xpc_null_create();
      xpc_release(v6);
      xpc_release(value);
      value = 0;
      if ((unint64_t)SendXpcMessage(_messageCenterServerConnection, &v13, &v12) >> 32)
      {
        LOBYTE(v3) = 0;
      }
      else
      {
        object[0] = &v12;
        object[1] = "kDidSucceed";
        xpc::dict::object_proxy::operator xpc::object((uint64_t)object, &v10);
        LOBYTE(v3) = xpc::dyn_cast_or_default((xpc *)&v10, 0);
        xpc_release(v10);
      }
      xpc_release(v12);
      xpc_release(v13);
    }
  }
  else
  {
    v7 = CTLogMessageCenter();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      -[CTMessageCenter simulateSmsReceived:].cold.1();
    LOBYTE(v3) = 0;
  }
  return (char)v3;
}

- (BOOL)simulateDeferredMessage
{
  char v2;
  NSObject *v3;
  xpc_object_t object[2];
  xpc_object_t v6;
  xpc_object_t v7;
  xpc_object_t v8;

  if (_messageCenterServerConnection)
  {
    xpc::dict_creator::dict_creator((xpc::dict_creator *)object);
    xpc::dict_creator::operator()<char const*>("kSimulateDeferredMessage", object, "kRequest", &v7);
    xpc_release(object[0]);
    v8 = v7;
    v7 = xpc_null_create();
    xpc_release(v7);
    v7 = xpc_null_create();
    if ((unint64_t)SendXpcMessage(_messageCenterServerConnection, &v8, &v7) >> 32)
    {
      v2 = 0;
    }
    else
    {
      object[0] = &v7;
      object[1] = "kDidSucceed";
      xpc::dict::object_proxy::operator xpc::object((uint64_t)object, &v6);
      v2 = xpc::dyn_cast_or_default((xpc *)&v6, 0);
      xpc_release(v6);
    }
    xpc_release(v7);
    xpc_release(v8);
  }
  else
  {
    v3 = CTLogMessageCenter();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
      -[CTMessageCenter simulateDeferredMessage].cold.1();
    return 0;
  }
  return v2;
}

- (BOOL)sendBinarySMS:(id)a3 trackingID:(unsigned int *)a4
{
  uint64_t v6;
  NSObject *v7;
  const char *v8;
  NSObject *v9;
  uint32_t v10;
  BOOL v11;
  NSObject *v12;
  void *v13;
  xpc_object_t v14;
  xpc_object_t v15;
  ctu *v16;
  const void *v17;
  xpc_object_t v18;
  xpc_object_t v19;
  xpc_object_t v20;
  xpc_object_t v21;
  xpc_object_t v22;
  xpc_object_t v23;
  xpc_object_t v24;
  void **v25;
  xpc_object_t v26;
  xpc_object_t v27;
  void **v28;
  xpc_object_t v29;
  xpc_object_t v30;
  xpc_object_t v31;
  xpc_object_t v32;
  xpc_object_t v33;
  xpc_object_t v34;
  xpc_object_t v35;
  xpc_object_t v36;
  int v37;
  char v38;
  xpc_object_t object;
  void *__p[2];
  uint64_t v42;
  xpc_object_t value;
  xpc_object_t v44;
  uint8_t buf[16];
  uint64_t v46;
  uint64_t v47;

  v47 = *MEMORY[0x1E0C80C00];
  if (!a3 || !objc_msgSend(a3, "isValid"))
    return 0;
  if (objc_msgSend(a3, "context"))
  {
    v6 = objc_msgSend((id)objc_msgSend(a3, "context"), "slotID");
    v7 = CTLogMessageCenter();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315138;
      *(_QWORD *)&buf[4] = CTSubscriptionSlotAsString(v6);
      v8 = "sendBinarySMS requested for Slot %s";
      v9 = v7;
      v10 = 12;
LABEL_9:
      _os_log_impl(&dword_18425C000, v9, OS_LOG_TYPE_INFO, v8, buf, v10);
    }
  }
  else
  {
    v12 = CTLogMessageCenter();
    v6 = 1;
    if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      v8 = "sendBinarySMS slot forced to CTSubscriptionSlotOne";
      v6 = 1;
      v9 = v12;
      v10 = 2;
      goto LABEL_9;
    }
  }
  xpc::dict_creator::dict_creator((xpc::dict_creator *)buf);
  xpc::dict_creator::operator()<char const*>("kSmsSendMessage", (xpc_object_t *)buf, "kRequest", __p);
  xpc_release(*(xpc_object_t *)buf);
  v13 = __p[0];
  v44 = __p[0];
  __p[0] = xpc_null_create();
  xpc_release(__p[0]);
  v14 = xpc_int64_create(1);
  if (!v14)
    v14 = xpc_null_create();
  xpc_dictionary_set_value(v13, "kSmsMessageType", v14);
  v15 = xpc_null_create();
  xpc_release(v14);
  xpc_release(v15);
  v16 = (ctu *)objc_msgSend(a3, "payload");
  ctu::cf_to_xpc(v16, v17);
  xpc_dictionary_set_value(v13, "kSmsBinaryPayload", value);
  v18 = value;
  value = xpc_null_create();
  xpc_release(v18);
  xpc_release(value);
  value = 0;
  v19 = xpc_int64_create((int)objc_msgSend(a3, "srcPort"));
  if (!v19)
    v19 = xpc_null_create();
  xpc_dictionary_set_value(v13, "kSmsApplicationSourcePort", v19);
  v20 = xpc_null_create();
  xpc_release(v19);
  xpc_release(v20);
  v21 = xpc_int64_create((int)objc_msgSend(a3, "dstPort"));
  if (!v21)
    v21 = xpc_null_create();
  xpc_dictionary_set_value(v13, "kSmsApplicationDestinationPort", v21);
  v22 = xpc_null_create();
  xpc_release(v21);
  xpc_release(v22);
  v23 = xpc_int64_create(objc_msgSend(a3, "portAddressingScheme"));
  if (!v23)
    v23 = xpc_null_create();
  xpc_dictionary_set_value(v13, "kSmsApplicationAddressingScheme", v23);
  v24 = xpc_null_create();
  xpc_release(v23);
  xpc_release(v24);
  objc_msgSend(a3, "destinationAddress");
  memset(buf, 0, sizeof(buf));
  v46 = 0;
  ctu::cf::assign();
  *(_OWORD *)__p = *(_OWORD *)buf;
  v42 = v46;
  if (v46 >= 0)
    v25 = __p;
  else
    v25 = *(void ***)buf;
  v26 = xpc_string_create((const char *)v25);
  if (!v26)
    v26 = xpc_null_create();
  xpc_dictionary_set_value(v13, "kSmsDestinationAddress", v26);
  v27 = xpc_null_create();
  xpc_release(v26);
  xpc_release(v27);
  if (SHIBYTE(v42) < 0)
    operator delete(__p[0]);
  objc_msgSend(a3, "smscAddress");
  memset(buf, 0, sizeof(buf));
  v46 = 0;
  ctu::cf::assign();
  *(_OWORD *)__p = *(_OWORD *)buf;
  v42 = v46;
  if (v46 >= 0)
    v28 = __p;
  else
    v28 = *(void ***)buf;
  v29 = xpc_string_create((const char *)v28);
  if (!v29)
    v29 = xpc_null_create();
  xpc_dictionary_set_value(v13, "kSmsSmscAddress", v29);
  v30 = xpc_null_create();
  xpc_release(v29);
  xpc_release(v30);
  if (SHIBYTE(v42) < 0)
    operator delete(__p[0]);
  v31 = xpc_BOOL_create(1);
  if (!v31)
    v31 = xpc_null_create();
  xpc_dictionary_set_value(v13, "kBypassSupportedMessageModesCheck", v31);
  v32 = xpc_null_create();
  xpc_release(v31);
  xpc_release(v32);
  v33 = xpc_int64_create(v6);
  if (!v33)
    v33 = xpc_null_create();
  xpc_dictionary_set_value(v13, "kSmsSubInstance", v33);
  v34 = xpc_null_create();
  xpc_release(v33);
  xpc_release(v34);
  v35 = xpc_int64_create(objc_msgSend(a3, "smsType"));
  if (!v35)
    v35 = xpc_null_create();
  xpc_dictionary_set_value(v13, "kSmsType", v35);
  v36 = xpc_null_create();
  xpc_release(v35);
  xpc_release(v36);
  __p[0] = xpc_null_create();
  v37 = SendXpcMessage(_messageCenterServerConnection, &v44, __p);
  if (MEMORY[0x186DBAE5C](__p[0]) == MEMORY[0x1E0C812F8])
  {
    *(_QWORD *)buf = __p;
    *(_QWORD *)&buf[8] = "kSmsMessageResult";
    xpc::dict::object_proxy::operator xpc::object((uint64_t)buf, &object);
    v38 = xpc::dyn_cast_or_default((xpc *)&object, 0);
    xpc_release(object);
    if (a4)
    {
      *(_QWORD *)buf = __p;
      *(_QWORD *)&buf[8] = "kSmsMessageID";
      xpc::dict::object_proxy::operator xpc::object((uint64_t)buf, &object);
      *a4 = xpc::dyn_cast_or_default((xpc *)&object, (const object *)0xFFFFFFFFLL);
      xpc_release(object);
    }
  }
  else
  {
    v38 = 0;
  }
  if (v37)
    v11 = 0;
  else
    v11 = v38;
  xpc_release(__p[0]);
  xpc_release(v44);
  return v11;
}

- (void)emergencySessionIntentStart:(id)a3
{
  xpc_object_t v4;
  xpc_object_t v5;
  xpc_object_t v6;
  xpc_object_t v7;
  xpc_object_t v8;
  NSObject *v9;
  NSObject *v10;
  char v11;
  NSObject *v12;
  xpc_object_t object[2];
  xpc_object_t v14;
  xpc_object_t v15;
  xpc_object_t v16;

  if (a3)
  {
    xpc::dict_creator::dict_creator((xpc::dict_creator *)object);
    xpc::dict_creator::operator()<char const*>("kSmsEmergencyUISession", object, "kRequest", &v15);
    xpc_release(object[0]);
    v4 = v15;
    v16 = v15;
    v15 = xpc_null_create();
    xpc_release(v15);
    v5 = xpc_int64_create(objc_msgSend(a3, "slotID"));
    if (!v5)
      v5 = xpc_null_create();
    xpc_dictionary_set_value(v4, "kSmsSubInstance", v5);
    v6 = xpc_null_create();
    xpc_release(v5);
    xpc_release(v6);
    v7 = xpc_int64_create(1);
    if (!v7)
      v7 = xpc_null_create();
    xpc_dictionary_set_value(v4, "kEmergencySessionStatus", v7);
    v8 = xpc_null_create();
    xpc_release(v7);
    xpc_release(v8);
    v15 = xpc_null_create();
    if (SendXpcMessage(_messageCenterServerConnection, &v16, &v15))
    {
      v9 = CTLogMessageCenter();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
        -[CTMessageCenter emergencySessionIntentStart:].cold.3();
    }
    else if (MEMORY[0x186DBAE5C](v15) == MEMORY[0x1E0C812F8])
    {
      object[0] = &v15;
      object[1] = "kDidSucceed";
      xpc::dict::object_proxy::operator xpc::object((uint64_t)object, &v14);
      v11 = xpc::dyn_cast_or_default((xpc *)&v14, 0);
      xpc_release(v14);
      if ((v11 & 1) == 0)
      {
        v12 = CTLogMessageCenter();
        if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
          -[CTMessageCenter emergencySessionIntentStart:].cold.2();
      }
    }
    xpc_release(v15);
    xpc_release(v16);
  }
  else
  {
    v10 = CTLogMessageCenter();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      -[CTMessageCenter emergencySessionIntentStart:].cold.1();
  }
}

- (void)emergencySessionIntentEnd:(id)a3
{
  xpc_object_t v4;
  xpc_object_t v5;
  xpc_object_t v6;
  NSObject *v7;
  NSObject *v8;
  char v9;
  NSObject *v10;
  xpc_object_t v11;
  xpc_object_t object;
  const char *v13;
  xpc_object_t v14;
  xpc_object_t v15;
  xpc_object_t v16;

  if (a3)
  {
    xpc::dict_creator::dict_creator((xpc::dict_creator *)&object);
    xpc::dict_creator::operator()<char const*>("kSmsEmergencyUISession", &object, "kRequest", &v15);
    xpc_release(object);
    v4 = v15;
    v16 = v15;
    v15 = xpc_null_create();
    xpc_release(v15);
    v5 = xpc_int64_create(objc_msgSend(a3, "slotID"));
    if (!v5)
      v5 = xpc_null_create();
    xpc_dictionary_set_value(v4, "kSmsSubInstance", v5);
    v6 = xpc_null_create();
    xpc_release(v5);
    xpc_release(v6);
    object = &v16;
    v13 = "kEmergencySessionStatus";
    xpc::dict::object_proxy::operator=((uint64_t)&object, &v14);
    xpc_release(v14);
    v14 = 0;
    v15 = xpc_null_create();
    if (SendXpcMessage(_messageCenterServerConnection, &v16, &v15))
    {
      v7 = CTLogMessageCenter();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
        -[CTMessageCenter emergencySessionIntentEnd:].cold.3();
    }
    else if (MEMORY[0x186DBAE5C](v15) == MEMORY[0x1E0C812F8])
    {
      object = &v15;
      v13 = "kDidSucceed";
      xpc::dict::object_proxy::operator xpc::object((uint64_t)&object, &v11);
      v9 = xpc::dyn_cast_or_default((xpc *)&v11, 0);
      xpc_release(v11);
      if ((v9 & 1) == 0)
      {
        v10 = CTLogMessageCenter();
        if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
          -[CTMessageCenter emergencySessionIntentEnd:].cold.2();
      }
    }
    xpc_release(v15);
    xpc_release(v16);
  }
  else
  {
    v8 = CTLogMessageCenter();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      -[CTMessageCenter emergencySessionIntentEnd:].cold.1();
  }
}

- (void)sendSMS:withMoreToFollow:trackingID:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_18425C000, v0, v1, "No server connection...", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_0();
}

- (void)sendSMS:withMoreToFollow:trackingID:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_18425C000, v0, v1, "No items in message", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_0();
}

- (void)sendSMS:withMoreToFollow:trackingID:.cold.3()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_18425C000, v0, v1, "Unable to serialize sms", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_0();
}

- (void)sendSMS:withMoreToFollow:trackingID:.cold.4()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_3(&dword_18425C000, v0, v1, "Error sending message: %d", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_0();
}

- (void)sendSMS:(uint64_t)a1 withMoreToFollow:(int)a2 trackingID:(NSObject *)a3 .cold.5(uint64_t a1, int a2, NSObject *a3)
{
  *(_DWORD *)a1 = 67109120;
  *(_DWORD *)(a1 + 4) = a2;
  OUTLINED_FUNCTION_4_0(&dword_18425C000, a3, (uint64_t)a3, "No message result for message ID: %u", (uint8_t *)a1);
}

- (void)sendSMS:(NSObject *)a1 withMoreToFollow:trackingID:.cold.6(NSObject *a1)
{
  int v2;
  const char *v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  v2 = 136315138;
  v3 = CTSubscriptionSlotAsString(1);
  _os_log_error_impl(&dword_18425C000, a1, OS_LOG_TYPE_ERROR, "SMS slot forced to %s", (uint8_t *)&v2, 0xCu);
}

- (void)sendSMS:withMoreToFollow:trackingID:.cold.7()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_18425C000, v0, v1, "SMS must have exactly 1 recipient", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_0();
}

- (void)sendSMS:(void *)a1 withMoreToFollow:(NSObject *)a2 trackingID:.cold.8(void *a1, NSObject *a2)
{
  uint64_t v3;
  uint8_t v4[8];
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a1, "messageType");
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_4_0(&dword_18425C000, a2, v3, "Sending SMS with wrong message type:%d", v4);
}

- (void)sendMMSFromData:messageId:subSlot:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_18425C000, v0, v1, "sendMMS called with no server connection", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_0();
}

- (void)sendMMSFromData:messageId:subSlot:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_3(&dword_18425C000, v0, v1, "error sending message from data: %d", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_0();
}

- (void)sendMMS:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_18425C000, v0, v1, "unable to encode message", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_0();
}

- (void)send:withMoreToFollow:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_18425C000, v0, v1, "messageType is unknown", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_0();
}

- (void)incomingMessageWithId:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_18425C000, v0, v1, "incomingMessage called no server connection", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_0();
}

- (void)incomingMessageWithId:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_3(&dword_18425C000, v0, v1, "Failed to retrieve message: %u", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_0();
}

- (void)incomingMessageWithId:.cold.3()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_18425C000, v0, v1, "Retrieved a message with zero length", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_0();
}

- (void)incomingMessageWithId:.cold.4()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_18425C000, v0, v1, "decoded MMS is NULL", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_0();
}

- (void)incomingMessageWithId:.cold.5()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_18425C000, v0, v1, "decoded SMS is NULL", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_0();
}

- (void)incomingMessageCount
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_3(&dword_18425C000, v0, v1, "Failed to incoming message count: %d", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_0();
}

- (void)allIncomingMessages
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_18425C000, v0, v1, "allIncomingMessages called with no server connection", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_0();
}

- (void)isMmsConfiguredForSub:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_18425C000, v0, v1, "isMmsConfigured called with no server connection", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_0();
}

- (void)isMmsEnabledForSub:enabled:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_18425C000, v0, v1, "MMS configured check called with no server connection", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_0();
}

- (void)isMmsEnabledForSub:enabled:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_18425C000, v0, v1, "Invalid parameters for isMmsEnabledForSub", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_0();
}

- (void)getCharacterCountForSub:count:andMessageSplitThreshold:forSmsText:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_18425C000, v0, v1, "Character count slot forced to CTSubscriptionSlotOne", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_0();
}

- (void)simulateSmsReceived:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_18425C000, v0, v1, "simulateSmsReceived called with no server connection", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_0();
}

- (void)simulateDeferredMessage
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_18425C000, v0, v1, "simulateDeferredMessage called with no server connection", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_0();
}

- (void)emergencySessionIntentStart:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_18425C000, v0, v1, "Invalid context for early emergency session start", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_0();
}

- (void)emergencySessionIntentStart:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_18425C000, v0, v1, "Failed to setup Emergency session start", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_0();
}

- (void)emergencySessionIntentStart:.cold.3()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_18425C000, v0, v1, "Error handling early emergency session start", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_0();
}

- (void)emergencySessionIntentEnd:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_18425C000, v0, v1, "Invalid context for early emergency session end", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_0();
}

- (void)emergencySessionIntentEnd:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_18425C000, v0, v1, "Failed to setup Emergency session end", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_0();
}

- (void)emergencySessionIntentEnd:.cold.3()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_18425C000, v0, v1, "Error handling early emergency session end", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_0();
}

@end
