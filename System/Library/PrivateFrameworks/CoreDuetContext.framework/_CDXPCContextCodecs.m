@implementation _CDXPCContextCodecs

+ (BOOL)addRegistration:(id)a3 toDictionary:(id)a4 error:(id *)a5
{
  id v7;
  void *v8;
  id v9;
  id v10;
  id v12;

  v7 = a4;
  v12 = 0;
  objc_msgSend(MEMORY[0x1E0CB36F8], "archivedDataWithRootObject:requiringSecureCoding:error:", a3, 1, &v12);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v12;
  if (v8)
  {
    v10 = objc_retainAutorelease(v8);
    xpc_dictionary_set_data(v7, "registration", (const void *)objc_msgSend(v10, "bytes"), objc_msgSend(v10, "length"));
  }
  if (a5)
    *a5 = objc_retainAutorelease(v9);

  return v9 == 0;
}

+ (id)registrationFromDictionary:(id)a3 error:(id *)a4
{
  const void *data;
  uint64_t v6;
  void *v7;
  void *v8;
  id v9;
  id v11;
  size_t length;

  length = 0;
  data = xpc_dictionary_get_data(a3, "registration", &length);
  if (data)
  {
    objc_msgSend(MEMORY[0x1E0C99D50], "dataWithBytes:length:", data, length);
    v6 = objc_claimAutoreleasedReturnValue();
    if (v6)
    {
      v7 = (void *)v6;
      v11 = 0;
      objc_msgSend(MEMORY[0x1E0CB3710], "unarchivedObjectOfClass:fromData:error:", objc_opt_class(), v6, &v11);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = v11;
      if (!a4)
        goto LABEL_7;
      goto LABEL_6;
    }
  }
  objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", *MEMORY[0x1E0D15BF0], *MEMORY[0x1E0D15C00], 0);
  v9 = (id)objc_claimAutoreleasedReturnValue();
  v7 = 0;
  v8 = 0;
  if (a4)
LABEL_6:
    *a4 = objc_retainAutorelease(v9);
LABEL_7:

  return v8;
}

+ (BOOL)addKeyPaths:(id)a3 toDictionary:(id)a4 error:(id *)a5
{
  id v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  unint64_t v11;
  uint64_t i;
  void *v13;
  id v14;
  const char *v15;
  id v16;
  const char *v17;
  BOOL v18;
  void *v19;
  void *v20;
  NSObject *v21;
  xpc_object_t v22;
  void *v23;
  BOOL v24;
  NSObject *v25;
  xpc_object_t v26;
  uint64_t j;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  id *v32;
  xpc_object_t xdict;
  xpc_object_t xarray;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  _BYTE buf[22];
  xpc_object_t values[2];
  _BYTE v43[128];
  uint64_t v44;

  v44 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  xdict = a4;
  xarray = xpc_array_create(0, 0);
  v37 = 0u;
  v38 = 0u;
  v39 = 0u;
  v40 = 0u;
  v7 = v6;
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v37, v43, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v38;
    v11 = 0x1E0D15000uLL;
    do
    {
      for (i = 0; i != v9; ++i)
      {
        if (*(_QWORD *)v38 != v10)
          objc_enumerationMutation(v7);
        v13 = *(void **)(*((_QWORD *)&v37 + 1) + 8 * i);
        objc_msgSend(v13, "key", xdict);
        v14 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
        v15 = (const char *)objc_msgSend(v14, "UTF8String");

        objc_msgSend(v13, "deviceID");
        v16 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
        v17 = (const char *)objc_msgSend(v16, "UTF8String");

        if (v15)
          v18 = v17 == 0;
        else
          v18 = 1;
        if (v18)
        {
          objc_msgSend(*(id *)(v11 + 2288), "contextChannel");
          v21 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
          {
            objc_msgSend(v13, "key");
            v19 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v13, "deviceID");
            v20 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138412546;
            *(_QWORD *)&buf[4] = v19;
            *(_WORD *)&buf[12] = 2112;
            *(_QWORD *)&buf[14] = v20;
            _os_log_error_impl(&dword_18DD73000, v21, OS_LOG_TYPE_ERROR, "Failed to convert string to UTF-8: %@/%@", buf, 0x16u);

          }
        }
        else
        {
          v21 = xpc_string_create(v15);
          v22 = xpc_string_create(v17);
          v23 = v22;
          if (v21)
            v24 = v22 == 0;
          else
            v24 = 1;
          if (v24)
          {
            objc_msgSend(*(id *)(v11 + 2288), "contextChannel");
            v25 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
            {
              objc_msgSend(v13, "key");
              v28 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v13, "deviceID");
              v29 = (void *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = 138412546;
              *(_QWORD *)&buf[4] = v28;
              *(_WORD *)&buf[12] = 2112;
              *(_QWORD *)&buf[14] = v29;
              _os_log_error_impl(&dword_18DD73000, v25, OS_LOG_TYPE_ERROR, "Failed to convert string to xpc string: %@/%@", buf, 0x16u);

              v11 = 0x1E0D15000;
            }

          }
          else
          {
            *(_OWORD *)buf = xmmword_1E26D46C8;
            values[0] = v21;
            values[1] = v23;
            v26 = xpc_dictionary_create((const char *const *)buf, values, 2uLL);
            xpc_array_append_value(xarray, v26);

            for (j = 1; j != -1; --j)
          }

        }
      }
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v37, v43, 16);
    }
    while (v9);
  }

  if (!xpc_array_get_count(xarray))
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", *MEMORY[0x1E0D15BF0], *MEMORY[0x1E0D15C00], 0);
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    v30 = xdict;
    v32 = a5;
    if (!a5)
      goto LABEL_28;
    goto LABEL_27;
  }
  v30 = xdict;
  xpc_dictionary_set_value(xdict, "keyPaths", xarray);
  v31 = 0;
  v32 = a5;
  if (a5)
LABEL_27:
    *v32 = objc_retainAutorelease(v31);
LABEL_28:

  return v31 == 0;
}

+ (id)keyPathsFromDictionary:(id)a3 error:(id *)a4
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  size_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  const char *string_ptr;
  const char *v16;
  const char *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  id v22;
  void *v23;
  NSObject *v24;
  void *v25;
  void *v26;
  NSObject *v27;
  NSObject *v28;
  void *v29;
  id *v31;
  id v32;
  void *v33;
  uint8_t buf[4];
  _DWORD v35[7];

  *(_QWORD *)&v35[5] = *MEMORY[0x1E0C80C00];
  v5 = a3;
  xpc_dictionary_get_array(v5, "keyPaths");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (v6)
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", xpc_array_get_count(v6));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (!xpc_array_get_count(v7))
    {
      v22 = 0;
      goto LABEL_30;
    }
    v32 = v5;
    v33 = v8;
    v31 = a4;
    v9 = 0;
    v10 = MEMORY[0x1E0C81390];
    while (1)
    {
      xpc_array_get_value(v7, v9);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      xpc_dictionary_get_value(v11, "key");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      xpc_dictionary_get_value(v11, "id");
      v13 = objc_claimAutoreleasedReturnValue();
      v14 = (void *)v13;
      if (!v12 || !v13 || MEMORY[0x193FEE070](v12) != v10 || MEMORY[0x193FEE070](v14) != v10)
        break;
      string_ptr = xpc_string_get_string_ptr(v12);
      v16 = xpc_string_get_string_ptr(v14);
      if (!string_ptr || (v17 = v16) == 0)
      {
        v26 = (void *)MEMORY[0x193FEDFE0](v11);
        objc_msgSend(MEMORY[0x1E0D158F0], "contextChannel");
        v28 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 136315138;
          *(_QWORD *)v35 = v26;
          _os_log_error_impl(&dword_18DD73000, v28, OS_LOG_TYPE_ERROR, "Failed to perform string conversion: %s", buf, 0xCu);
        }

        goto LABEL_24;
      }
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", string_ptr);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", v17);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      +[_CDContextualKeyPath keyPathWithKey:](_CDContextualKeyPath, "keyPathWithKey:", v18);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      +[_CDContextualKeyPath remoteKeyPathForKeyPath:forDeviceID:](_CDContextualKeyPath, "remoteKeyPathForKeyPath:forDeviceID:", v20, v19);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v33, "addObject:", v21);

      if (++v9 >= xpc_array_get_count(v7))
      {
        v22 = 0;
        v5 = v32;
        v8 = v33;
        goto LABEL_30;
      }
    }
    v26 = (void *)MEMORY[0x193FEDFE0](v11);
    objc_msgSend(MEMORY[0x1E0D158F0], "contextChannel");
    v27 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 67109378;
      v35[0] = v9;
      LOWORD(v35[1]) = 2080;
      *(_QWORD *)((char *)&v35[1] + 2) = v26;
      _os_log_error_impl(&dword_18DD73000, v27, OS_LOG_TYPE_ERROR, "Unable to fetch strings from array at index %d: %s", buf, 0x12u);
    }

LABEL_24:
    v25 = v33;
    if (v26)
      free(v26);

    a4 = v31;
    v5 = v32;
  }
  else
  {
    v23 = (void *)MEMORY[0x193FEDFE0](v5);
    objc_msgSend(MEMORY[0x1E0D158F0], "contextChannel");
    v24 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
      +[_CDXPCContextCodecs keyPathsFromDictionary:error:].cold.1();

    if (v23)
      free(v23);
    v25 = 0;
  }

  objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", *MEMORY[0x1E0D15BF0], *MEMORY[0x1E0D15C08], 0);
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = v29;
  if (a4)
  {
    v22 = objc_retainAutorelease(v29);
    v8 = 0;
    *a4 = v22;
  }
  else
  {
    v8 = 0;
  }
LABEL_30:

  return v8;
}

+ (id)fetchPropertiesEventWithRemoteKeyPaths:(id)a3 error:(id *)a4
{
  id v6;
  xpc_object_t v7;
  xpc_object_t v8;
  id v9;
  void *v10;
  id v12;
  xpc_object_t values;
  char *keys[2];

  keys[1] = *(char **)MEMORY[0x1E0C80C00];
  v6 = a3;
  keys[0] = "msgtype";
  v7 = xpc_string_create("fetch-properties");
  values = v7;
  v8 = xpc_dictionary_create((const char *const *)keys, &values, 1uLL);
  v12 = 0;
  objc_msgSend(a1, "addKeyPaths:toDictionary:error:", v6, v8, &v12);

  v9 = v12;
  v10 = v9;
  if (a4)
    *a4 = objc_retainAutorelease(v9);

  return v8;
}

+ (id)keyPathsFromFetchPropertiesEvent:(id)a3 error:(id *)a4
{
  id v6;
  const char *string;
  void *v8;
  int v9;
  void *v10;
  id v11;
  void *v12;
  NSObject *v13;
  id v15;

  v6 = a3;
  string = xpc_dictionary_get_string(v6, "msgtype");
  if (string)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", string);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "isEqualToString:", CFSTR("fetch-properties"));

    if (v9)
    {
      v15 = 0;
      objc_msgSend(a1, "keyPathsFromDictionary:error:", v6, &v15);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = v15;
      if (!a4)
        goto LABEL_11;
      goto LABEL_10;
    }
  }
  v12 = (void *)MEMORY[0x193FEDFE0](v6);
  objc_msgSend(MEMORY[0x1E0D158F0], "contextChannel");
  v13 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    +[_CDXPCContextCodecs keyPathsFromFetchPropertiesEvent:error:].cold.1();

  if (v12)
    free(v12);
  objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", *MEMORY[0x1E0D15BF0], *MEMORY[0x1E0D15C08], 0);
  v11 = (id)objc_claimAutoreleasedReturnValue();
  v10 = 0;
  if (a4)
LABEL_10:
    *a4 = objc_retainAutorelease(v11);
LABEL_11:

  return v10;
}

+ (id)commonContextValueNotificationsEventWithType:(const char *)a3 registration:(id)a4 deviceIDs:(id)a5 error:(id *)a6
{
  id v10;
  id v11;
  xpc_object_t v12;
  xpc_object_t v13;
  int v14;
  id v15;
  void *v16;
  id v17;
  id v19;
  id v20;
  xpc_object_t values;
  char *keys[2];

  keys[1] = *(char **)MEMORY[0x1E0C80C00];
  v10 = a5;
  v11 = a4;
  keys[0] = "msgtype";
  v12 = xpc_string_create(a3);
  values = v12;
  v13 = xpc_dictionary_create((const char *const *)keys, &values, 1uLL);
  v20 = 0;
  v14 = objc_msgSend(a1, "addRegistration:toDictionary:error:", v11, v13, &v20);

  v15 = v20;
  v16 = v15;
  if (v14)
  {
    v19 = v15;
    objc_msgSend(a1, "addDeviceIDs:toDictionary:error:", v10, v13, &v19);
    v17 = v19;

    v16 = v17;
  }
  if (v16)
  {

    v13 = 0;
  }
  if (a6)
    *a6 = objc_retainAutorelease(v16);

  return v13;
}

+ (id)subscribeToContextValueNotificationsEventWithRegistration:(id)a3 deviceIDs:(id)a4 error:(id *)a5
{
  void *v6;
  id v7;
  void *v8;
  id v10;

  v10 = 0;
  objc_msgSend(a1, "commonContextValueNotificationsEventWithType:registration:deviceIDs:error:", "subscribe", a3, a4, &v10);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v10;
  v8 = v7;
  if (a5)
    *a5 = objc_retainAutorelease(v7);

  return v6;
}

+ (BOOL)parseSubscribeToContextValueNotificationsEvent:(id)a3 registration:(id *)a4 deviceIDs:(id *)a5 error:(id *)a6
{
  id v10;
  const char *string;
  void *v12;
  int v13;
  void *v14;
  id v15;
  void *v16;
  NSObject *v17;
  void *v19;
  id v20;
  id v21;

  v10 = a3;
  string = xpc_dictionary_get_string(v10, "msgtype");
  if (!string
    || (objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", string),
        v12 = (void *)objc_claimAutoreleasedReturnValue(),
        v13 = objc_msgSend(v12, "isEqualToString:", CFSTR("subscribe")),
        v12,
        !v13))
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", *MEMORY[0x1E0D15BF0], *MEMORY[0x1E0D15C08], 0);
    v15 = (id)objc_claimAutoreleasedReturnValue();
    goto LABEL_7;
  }
  if (a4)
  {
    v21 = 0;
    objc_msgSend(a1, "registrationFromDictionary:error:", v10, &v21);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = v21;
    *a4 = v14;
    if (!a5)
      goto LABEL_7;
  }
  else
  {
    v15 = 0;
    if (!a5)
      goto LABEL_7;
  }
  if (!v15)
  {
    v20 = 0;
    objc_msgSend(a1, "deviceIDsFromDictionary:error:", v10, &v20);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = v20;
    *a5 = v19;
  }
LABEL_7:
  if (v15)
  {
    v16 = (void *)MEMORY[0x193FEDFE0](v10);
    objc_msgSend(MEMORY[0x1E0D158F0], "contextChannel");
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
      +[_CDXPCContextCodecs parseSubscribeToContextValueNotificationsEvent:registration:deviceIDs:error:].cold.1();

    if (v16)
      free(v16);
    if (a6)
      *a6 = objc_retainAutorelease(v15);
  }

  return v15 == 0;
}

+ (id)subscribeToContextValueNotificationsReplyWithEvent:(id)a3 error:(id)a4
{
  id v6;
  xpc_object_t reply;

  v6 = a4;
  reply = xpc_dictionary_create_reply(a3);
  if (v6)
    objc_msgSend(a1, "addError:toReply:", v6, reply);

  return reply;
}

+ (id)unsubscribeFromContextValueNotificationsEventWithRegistration:(id)a3 deviceIDs:(id)a4 error:(id *)a5
{
  void *v6;
  id v7;
  void *v8;
  id v10;

  v10 = 0;
  objc_msgSend(a1, "commonContextValueNotificationsEventWithType:registration:deviceIDs:error:", "unsubscribe", a3, a4, &v10);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v10;
  v8 = v7;
  if (a5)
    *a5 = objc_retainAutorelease(v7);

  return v6;
}

+ (BOOL)parseUnsubscribeFromContextValueNotificationsEvent:(id)a3 registration:(id *)a4 deviceIDs:(id *)a5 error:(id *)a6
{
  id v10;
  const char *string;
  void *v12;
  int v13;
  void *v14;
  id v15;
  void *v16;
  NSObject *v17;
  void *v19;
  id v20;
  id v21;

  v10 = a3;
  string = xpc_dictionary_get_string(v10, "msgtype");
  if (!string
    || (objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", string),
        v12 = (void *)objc_claimAutoreleasedReturnValue(),
        v13 = objc_msgSend(v12, "isEqualToString:", CFSTR("unsubscribe")),
        v12,
        !v13))
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", *MEMORY[0x1E0D15BF0], *MEMORY[0x1E0D15C08], 0);
    v15 = (id)objc_claimAutoreleasedReturnValue();
    goto LABEL_7;
  }
  if (a4)
  {
    v21 = 0;
    objc_msgSend(a1, "registrationFromDictionary:error:", v10, &v21);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = v21;
    *a4 = v14;
    if (!a5)
      goto LABEL_7;
  }
  else
  {
    v15 = 0;
    if (!a5)
      goto LABEL_7;
  }
  if (!v15)
  {
    v20 = 0;
    objc_msgSend(a1, "deviceIDsFromDictionary:error:", v10, &v20);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = v20;
    *a5 = v19;
  }
LABEL_7:
  if (v15)
  {
    v16 = (void *)MEMORY[0x193FEDFE0](v10);
    objc_msgSend(MEMORY[0x1E0D158F0], "contextChannel");
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
      +[_CDXPCContextCodecs parseSubscribeToContextValueNotificationsEvent:registration:deviceIDs:error:].cold.1();

    if (v16)
      free(v16);
    if (a6)
      *a6 = objc_retainAutorelease(v15);
  }

  return v15 == 0;
}

+ (id)unsubscribeFromContextValueNotificationsReplyWithEvent:(id)a3 error:(id)a4
{
  id v6;
  xpc_object_t reply;

  v6 = a4;
  reply = xpc_dictionary_create_reply(a3);
  if (v6)
    objc_msgSend(a1, "addError:toReply:", v6, reply);

  return reply;
}

+ (id)supportedClassesToUnarchive
{
  void *v2;
  uint64_t v3;
  id v4;
  id v5;
  _QWORD block[4];
  id v8;
  objc_super v9;

  v9.receiver = a1;
  v9.super_class = (Class)&OBJC_METACLASS____CDXPCContextCodecs;
  objc_msgSendSuper2(&v9, sel_supportedClassesToUnarchive);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __50___CDXPCContextCodecs_supportedClassesToUnarchive__block_invoke;
  block[3] = &unk_1E26D46E0;
  v8 = v2;
  v3 = supportedClassesToUnarchive_initialized;
  v4 = v2;
  if (v3 != -1)
    dispatch_once(&supportedClassesToUnarchive_initialized, block);
  v5 = (id)supportedClassesToUnarchive_supportedClasses;

  return v5;
}

+ (void)keyPathsFromDictionary:error:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0_0(&dword_18DD73000, v0, v1, "Unable to fetch key paths from dictionary: %s", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

+ (void)keyPathsFromFetchPropertiesEvent:error:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0_0(&dword_18DD73000, v0, v1, "Unknown event type in dictionary: %s", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

+ (void)parseSubscribeToContextValueNotificationsEvent:registration:deviceIDs:error:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0_0(&dword_18DD73000, v0, v1, "Invalid event: %s", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

@end
