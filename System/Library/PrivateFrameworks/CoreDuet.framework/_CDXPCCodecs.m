@implementation _CDXPCCodecs

+ (id)_log
{
  if (_log_onceToken != -1)
    dispatch_once(&_log_onceToken, &__block_literal_global_25);
  return (id)_log_log;
}

+ (BOOL)addDeviceIDs:(id)a3 toDictionary:(id)a4 error:(id *)a5
{
  id v6;
  xpc_object_t v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  id v13;
  const char *v14;
  NSObject *v15;
  NSObject *v16;
  void *v17;
  void *v18;
  id *v19;
  xpc_object_t xdict;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  uint8_t buf[4];
  id v28;
  _BYTE v29[128];
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  xdict = a4;
  v7 = xpc_array_create(0, 0);
  v23 = 0u;
  v24 = 0u;
  v25 = 0u;
  v26 = 0u;
  v8 = v6;
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v23, v29, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v24;
    do
    {
      for (i = 0; i != v10; ++i)
      {
        if (*(_QWORD *)v24 != v11)
          objc_enumerationMutation(v8);
        v13 = objc_retainAutorelease(*(id *)(*((_QWORD *)&v23 + 1) + 8 * i));
        v14 = (const char *)objc_msgSend(v13, "UTF8String");
        if (v14)
        {
          v15 = xpc_string_create(v14);
          if (v15)
          {
            xpc_array_append_value(v7, v15);
          }
          else
          {
            +[_CDXPCCodecs _log](_CDXPCCodecs, "_log");
            v16 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 138412290;
              v28 = v13;
              _os_log_error_impl(&dword_18DDBE000, v16, OS_LOG_TYPE_ERROR, "Failed to convert string to xpc string: %@", buf, 0xCu);
            }

          }
        }
        else
        {
          +[_CDXPCCodecs _log](_CDXPCCodecs, "_log");
          v15 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 138412290;
            v28 = v13;
            _os_log_error_impl(&dword_18DDBE000, v15, OS_LOG_TYPE_ERROR, "Failed to convert string to UTF-8: %@", buf, 0xCu);
          }
        }

      }
      v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v23, v29, 16);
    }
    while (v10);
  }

  if (!xpc_array_get_count(v7))
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("com.apple.coreduetd"), 7, 0);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = xdict;
    v19 = a5;
    if (!a5)
      goto LABEL_19;
    goto LABEL_18;
  }
  v17 = xdict;
  xpc_dictionary_set_value(xdict, "ids", v7);
  v18 = 0;
  v19 = a5;
  if (a5)
LABEL_18:
    *v19 = objc_retainAutorelease(v18);
LABEL_19:

  return v18 == 0;
}

+ (id)deviceIDsFromDictionary:(id)a3 error:(id *)a4
{
  void *v5;
  void *v6;
  size_t v7;
  char v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  const char *string_ptr;
  void *v13;
  id v14;
  void *v15;

  xpc_dictionary_get_array(a3, "ids");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    v6 = (void *)objc_opt_new();
    if (!xpc_array_get_count(v5))
      goto LABEL_13;
    v7 = 0;
    v8 = 0;
    v9 = MEMORY[0x1E0C81390];
    do
    {
      xpc_array_get_value(v5, v7);
      v10 = objc_claimAutoreleasedReturnValue();
      v11 = (void *)v10;
      if (v10 && MEMORY[0x193FEEFF8](v10) == v9 && (string_ptr = xpc_string_get_string_ptr(v11)) != 0)
      {
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", string_ptr);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "addObject:", v13);

      }
      else
      {
        v8 = 1;
      }

      ++v7;
    }
    while (v7 < xpc_array_get_count(v5));
    if ((v8 & 1) == 0)
    {
LABEL_13:
      v14 = 0;
      goto LABEL_17;
    }
  }
  else
  {
    v6 = 0;
  }

  objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("com.apple.coreduetd"), 6, 0);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = v15;
  if (a4)
  {
    v14 = objc_retainAutorelease(v15);
    v6 = 0;
    *a4 = v14;
  }
  else
  {
    v6 = 0;
  }
LABEL_17:

  return v6;
}

+ (void)addError:(id)a3 toReply:(id)a4
{
  id v5;
  id v6;
  const char *v7;
  int64_t v8;
  xpc_object_t xdict;

  if (a3)
  {
    if (a4)
    {
      xdict = a4;
      v5 = a3;
      objc_msgSend(v5, "domain");
      v6 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
      v7 = (const char *)objc_msgSend(v6, "UTF8String");

      xpc_dictionary_set_string(xdict, "error_domain", v7);
      v8 = objc_msgSend(v5, "code");

      xpc_dictionary_set_int64(xdict, "error_code", v8);
    }
  }
}

+ (id)errorFromReply:(id)a3
{
  id v3;
  void *v4;
  const char *string;
  void *v6;
  void *v7;

  v3 = a3;
  v4 = v3;
  if (v3 && (string = xpc_dictionary_get_string(v3, "error_domain")) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s"), string);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", v6, xpc_dictionary_get_int64(v4, "error_code"), 0);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v7 = 0;
  }

  return v7;
}

+ (int64_t)eventTypeWithEvent:(id)a3
{
  id v3;
  const char *string;
  void *v5;
  void *v6;
  int64_t v7;

  v3 = a3;
  if (eventTypeWithEvent__initialized != -1)
    dispatch_once(&eventTypeWithEvent__initialized, &__block_literal_global_336);
  string = xpc_dictionary_get_string(v3, "msgtype");
  if (string)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", string);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend((id)eventTypeWithEvent__eventTypeByMsgType, "objectForKeyedSubscript:", v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "integerValue");

  }
  else
  {
    v7 = 0;
  }

  return v7;
}

+ (id)fetchPropertiesReplyWithEvent:(id)a3 error:(id)a4
{
  id v6;
  xpc_object_t reply;

  v6 = a4;
  reply = xpc_dictionary_create_reply(a3);
  if (v6)
    objc_msgSend(a1, "addError:toReply:", v6, reply);

  return reply;
}

+ (id)keepAliveEventWithKeepAlive:(BOOL)a3 error:(id *)a4
{
  xpc_object_t v6;
  xpc_object_t v7;
  xpc_object_t values;
  char *keys[2];

  keys[1] = *(char **)MEMORY[0x1E0C80C00];
  values = xpc_string_create("keep-alive");
  keys[0] = "msgtype";
  v6 = values;
  v7 = xpc_dictionary_create((const char *const *)keys, &values, 1uLL);
  xpc_dictionary_set_BOOL(v7, "keepAlive", a3);
  if (a4)
    *a4 = 0;

  return v7;
}

+ (BOOL)keepAliveFromKeepAliveEvent:(id)a3 error:(id *)a4
{
  id v5;
  const char *string;
  void *v7;
  int v8;
  BOOL v9;
  void *v10;
  void *v11;
  NSObject *v12;

  v5 = a3;
  string = xpc_dictionary_get_string(v5, "msgtype");
  if (string)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", string);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "isEqualToString:", CFSTR("keep-alive"));

    if (v8)
    {
      v9 = xpc_dictionary_get_BOOL(v5, "keepAlive");
      v10 = 0;
      if (!a4)
        goto LABEL_11;
      goto LABEL_10;
    }
  }
  v11 = (void *)MEMORY[0x193FEEEB4](v5);
  +[_CDXPCCodecs _log](_CDXPCCodecs, "_log");
  v12 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    +[_CDXPCCodecs keepAliveFromKeepAliveEvent:error:].cold.1();

  if (v11)
    free(v11);
  objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("com.apple.coreduetd"), 6, 0);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = 0;
  if (a4)
LABEL_10:
    *a4 = objc_retainAutorelease(v10);
LABEL_11:

  return v9;
}

+ (id)keepAliveReplyWithEvent:(id)a3 error:(id)a4
{
  id v6;
  xpc_object_t reply;

  v6 = a4;
  reply = xpc_dictionary_create_reply(a3);
  if (v6)
    objc_msgSend(a1, "addError:toReply:", v6, reply);

  return reply;
}

+ (id)notificationEventWithRegistrationIdentifier:(id)a3 info:(id)a4 error:(id *)a5
{
  id v7;
  id v8;
  xpc_object_t v9;
  xpc_object_t v10;
  id v11;
  const char *v12;
  void *v13;
  id v14;
  id v15;
  NSObject *v17;
  id v18;
  xpc_object_t values;
  char *keys[2];

  keys[1] = *(char **)MEMORY[0x1E0C80C00];
  v7 = a4;
  v8 = a3;
  keys[0] = "msgtype";
  v9 = xpc_string_create("notification");
  values = v9;
  v10 = xpc_dictionary_create((const char *const *)keys, &values, 1uLL);
  v11 = objc_retainAutorelease(v8);
  v12 = (const char *)objc_msgSend(v11, "UTF8String");

  xpc_dictionary_set_string(v10, "id", v12);
  v18 = 0;
  objc_msgSend(MEMORY[0x1E0CB36F8], "archivedDataWithRootObject:requiringSecureCoding:error:", v7, 0, &v18);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = v18;
  if (v13)
  {
    v15 = objc_retainAutorelease(v13);
    xpc_dictionary_set_data(v10, "info", (const void *)objc_msgSend(v15, "bytes"), objc_msgSend(v15, "length"));
    if (a5)
LABEL_3:
      *a5 = objc_retainAutorelease(v14);
  }
  else
  {
    +[_CDXPCCodecs _log](_CDXPCCodecs, "_log");
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_FAULT))
      +[_CDXPCCodecs notificationEventWithRegistrationIdentifier:info:error:].cold.1();

    v10 = 0;
    if (a5)
      goto LABEL_3;
  }

  return v10;
}

+ (BOOL)parseNotificationEvent:(id)a3 registrationIdentifier:(id *)a4 info:(id *)a5 error:(id *)a6
{
  id v10;
  const char *string;
  void *v12;
  int v13;
  const char *v14;
  void *v15;
  id v16;
  id v17;
  id v18;
  const void *data;
  void *v20;
  void *v21;
  void *v22;
  NSObject *v23;
  void *v24;
  NSObject *v25;
  BOOL v26;
  id v28;
  size_t length;

  v10 = a3;
  string = xpc_dictionary_get_string(v10, "msgtype");
  if (string)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", string);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v12, "isEqualToString:", CFSTR("notification"));

    if (v13)
    {
      if (a4)
      {
        v14 = xpc_dictionary_get_string(v10, "id");
        if (v14)
        {
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s"), v14);
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          v16 = 0;
        }
        else
        {
          objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("com.apple.coreduetd"), 6, 0);
          v16 = (id)objc_claimAutoreleasedReturnValue();
          v15 = 0;
        }
        v18 = objc_retainAutorelease(v15);
        *a4 = v18;
        length = 0;
        data = xpc_dictionary_get_data(v10, "info", &length);
        if (data)
        {
          objc_msgSend(MEMORY[0x1E0C99D50], "dataWithBytes:length:", data, length);
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(a1, "supportedClassesToUnarchive");
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          v28 = v16;
          objc_msgSend(MEMORY[0x1E0CB3710], "unarchivedObjectOfClasses:fromData:error:", v21, v20, &v28);
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          v17 = v28;

          if (!v22)
          {
            +[_CDXPCCodecs _log](_CDXPCCodecs, "_log");
            v23 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v23, OS_LOG_TYPE_FAULT))
              +[_CDXPCCodecs parseNotificationEvent:registrationIdentifier:info:error:].cold.2();

          }
          v16 = objc_retainAutorelease(v22);
          *a5 = v16;

        }
        else
        {
          objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("com.apple.coreduetd"), 6, 0);
          v17 = (id)objc_claimAutoreleasedReturnValue();
        }

        if (v17)
          goto LABEL_18;
      }
      else
      {
        v17 = 0;
      }
LABEL_24:
      v26 = 1;
      goto LABEL_26;
    }
  }
  objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("com.apple.coreduetd"), 6, 0);
  v17 = (id)objc_claimAutoreleasedReturnValue();
  if (!v17)
    goto LABEL_24;
LABEL_18:
  v24 = (void *)MEMORY[0x193FEEEB4](v10);
  +[_CDXPCCodecs _log](_CDXPCCodecs, "_log");
  v25 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
    +[_CDXPCCodecs parseNotificationEvent:registrationIdentifier:info:error:].cold.1();

  if (v24)
    free(v24);
  if (a6)
  {
    v17 = objc_retainAutorelease(v17);
    v26 = 0;
    *a6 = v17;
  }
  else
  {
    v26 = 0;
  }
LABEL_26:

  return v26;
}

+ (id)fetchProxySourceDeviceUUIDEvent
{
  xpc_object_t v2;
  xpc_object_t v3;
  xpc_object_t values;
  char *keys[2];

  keys[1] = *(char **)MEMORY[0x1E0C80C00];
  values = xpc_string_create("fetch-uuid");
  keys[0] = "msgtype";
  v2 = values;
  v3 = xpc_dictionary_create((const char *const *)keys, &values, 1uLL);

  return v3;
}

+ (id)fetchProxySourceDeviceUUIDReplyWithEvent:(id)a3 sourceDeviceUUID:(id)a4 error:(id)a5
{
  id v8;
  id v9;
  xpc_object_t reply;
  xpc_object_t v11;
  unsigned __int8 uuid[8];
  uint64_t v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v8 = a4;
  v9 = a5;
  reply = xpc_dictionary_create_reply(a3);
  if (v9)
  {
    objc_msgSend(a1, "addError:toReply:", v9, reply);
  }
  else
  {
    v11 = xpc_string_create("fetch-uuid");
    xpc_dictionary_set_value(reply, "msgtype", v11);
    *(_QWORD *)uuid = 0;
    v14 = 0;
    objc_msgSend(v8, "getUUIDBytes:", uuid);
    xpc_dictionary_set_uuid(reply, "uuid", uuid);

  }
  return reply;
}

+ (id)parseProxySourceDeviceUUIDEvent:(id)a3 error:(id *)a4
{
  id v5;
  const char *string;
  void *v7;
  int v8;
  const char *v9;
  uint64_t v10;
  void *v11;
  id v12;
  void *v13;
  NSObject *v14;

  v5 = a3;
  string = xpc_dictionary_get_string(v5, "msgtype");
  if (string
    && (objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", string),
        v7 = (void *)objc_claimAutoreleasedReturnValue(),
        v8 = objc_msgSend(v7, "isEqualToString:", CFSTR("fetch-uuid")),
        v7,
        v8)
    && (v9 = xpc_dictionary_get_string(v5, "uuid")) != 0
    && (v10 = objc_msgSend(objc_alloc(MEMORY[0x1E0CB3A28]), "initWithUUIDBytes:", v9)) != 0)
  {
    v11 = (void *)v10;
    v12 = 0;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("com.apple.coreduetd"), 6, 0);
    v12 = (id)objc_claimAutoreleasedReturnValue();
    if (!v12)
      goto LABEL_13;
    v13 = (void *)MEMORY[0x193FEEEB4](v5);
    +[_CDXPCCodecs _log](_CDXPCCodecs, "_log");
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      +[_CDXPCCodecs parseNotificationEvent:registrationIdentifier:info:error:].cold.1();

    if (v13)
      free(v13);
    if (a4)
    {
      v12 = objc_retainAutorelease(v12);
      v11 = 0;
      *a4 = v12;
    }
    else
    {
LABEL_13:
      v11 = 0;
    }
  }

  return v11;
}

+ (id)requestActivateDevicesEvent
{
  xpc_object_t v2;
  xpc_object_t v3;
  xpc_object_t values;
  char *keys[2];

  keys[1] = *(char **)MEMORY[0x1E0C80C00];
  values = xpc_string_create("activate-devices");
  keys[0] = "msgtype";
  v2 = values;
  v3 = xpc_dictionary_create((const char *const *)keys, &values, 1uLL);

  return v3;
}

+ (id)requestActivateDevicesReplyWithEvent:(id)a3 error:(id)a4
{
  id v6;
  xpc_object_t reply;
  xpc_object_t v8;

  v6 = a4;
  reply = xpc_dictionary_create_reply(a3);
  if (v6)
  {
    objc_msgSend(a1, "addError:toReply:", v6, reply);
  }
  else
  {
    v8 = xpc_string_create("activate-devices");
    xpc_dictionary_set_value(reply, "msgtype", v8);

  }
  return reply;
}

+ (id)messageTypeFromEvent:(id)a3
{
  void *string;

  string = (void *)xpc_dictionary_get_string(a3, "msgtype");
  if (string)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", string);
    string = (void *)objc_claimAutoreleasedReturnValue();
  }
  return string;
}

+ (id)supportedClassesToUnarchive
{
  if (supportedClassesToUnarchive_initialized != -1)
    dispatch_once(&supportedClassesToUnarchive_initialized, &__block_literal_global_371);
  return (id)supportedClassesToUnarchive_supportedClasses;
}

+ (void)keepAliveFromKeepAliveEvent:error:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0(&dword_18DDBE000, v0, v1, "Unknown event type in dictionary: %s", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_5();
}

+ (void)notificationEventWithRegistrationIdentifier:info:error:.cold.1()
{
  uint64_t v0;
  os_log_t v1;
  uint8_t v2[12];
  __int16 v3;
  uint64_t v4;
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_3();
  v3 = 2112;
  v4 = v0;
  _os_log_fault_impl(&dword_18DDBE000, v1, OS_LOG_TYPE_FAULT, "Unable to encode info %@: %@", v2, 0x16u);
  OUTLINED_FUNCTION_5();
}

+ (void)parseNotificationEvent:registrationIdentifier:info:error:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0(&dword_18DDBE000, v0, v1, "Invalid event: %s", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_5();
}

+ (void)parseNotificationEvent:registrationIdentifier:info:error:.cold.2()
{
  os_log_t v0;
  uint8_t v1[24];
  uint64_t v2;

  v2 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_3();
  _os_log_fault_impl(&dword_18DDBE000, v0, OS_LOG_TYPE_FAULT, "Unable to decode info: %@", v1, 0xCu);
  OUTLINED_FUNCTION_5();
}

@end
