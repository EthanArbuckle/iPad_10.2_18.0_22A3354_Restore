@implementation AFSiriActivationCreateContextFromXPCDictionary

void __AFSiriActivationCreateContextFromXPCDictionary_block_invoke(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  void *v5;
  id v6;
  const char *string_ptr;
  void *v8;
  uint64_t v9;
  void *v10;
  id v11;
  const void *bytes_ptr;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  id *v21;
  uint64_t *v22;
  void *v23;
  id v24;
  NSObject *v25;
  uint64_t v26;
  int v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  void *v32;
  void *v33;
  uint64_t v34;
  uint64_t v35;
  uint8_t buf[4];
  const char *v37;
  __int16 v38;
  id v39;
  uint64_t v40;

  v40 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  objc_msgSend(v3, "setTimestamp:", xpc_dictionary_get_uint64(*(xpc_object_t *)(a1 + 32), "t"));
  objc_msgSend(v3, "setEvent:", xpc_dictionary_get_int64(*(xpc_object_t *)(a1 + 32), "e"));
  objc_msgSend(v3, "setSource:", xpc_dictionary_get_int64(*(xpc_object_t *)(a1 + 32), "s"));
  xpc_dictionary_get_value(*(xpc_object_t *)(a1 + 32), "d");
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = (void *)v4;
  if (v4 && MEMORY[0x1A1AC0F84](v4) == MEMORY[0x1E0C81390])
  {
    v6 = objc_alloc(MEMORY[0x1E0CB3940]);
    string_ptr = xpc_string_get_string_ptr(v5);
    v8 = (void *)objc_msgSend(v6, "initWithBytes:length:encoding:", string_ptr, xpc_string_get_length(v5), 4);
    if (objc_msgSend(v8, "length"))
      objc_msgSend(v3, "setDeviceID:", v8);

  }
  xpc_dictionary_get_value(*(xpc_object_t *)(a1 + 32), "u");
  v9 = objc_claimAutoreleasedReturnValue();
  v10 = (void *)v9;
  if (v9 && MEMORY[0x1A1AC0F84](v9) == MEMORY[0x1E0C812E8])
  {
    v11 = objc_alloc(MEMORY[0x1E0C99D50]);
    bytes_ptr = xpc_data_get_bytes_ptr(v10);
    v13 = (void *)objc_msgSend(v11, "initWithBytesNoCopy:length:freeWhenDone:", bytes_ptr, xpc_data_get_length(v10), 0);
    if (objc_msgSend(v13, "length"))
    {
      if (AFSupportsSCDAFramework_onceToken != -1)
        dispatch_once(&AFSupportsSCDAFramework_onceToken, &__block_literal_global_143_40244);
      v27 = AFSupportsSCDAFramework_scdaFrameworkEnabled;
      v32 = (void *)MEMORY[0x1E0C99E60];
      v33 = (void *)MEMORY[0x1E0CB3710];
      v31 = objc_opt_class();
      v30 = objc_opt_class();
      v29 = objc_opt_class();
      v28 = objc_opt_class();
      v26 = objc_opt_class();
      v14 = objc_opt_class();
      v15 = objc_opt_class();
      v16 = objc_opt_class();
      v17 = objc_opt_class();
      v18 = objc_opt_class();
      v19 = objc_opt_class();
      objc_msgSend(v32, "setWithObjects:", v31, v30, v29, v28, v26, v14, v15, v16, v17, v18, v19, objc_opt_class(), 0);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      if (v27)
      {
        v35 = 0;
        v21 = (id *)&v35;
        v22 = &v35;
      }
      else
      {
        v34 = 0;
        v21 = (id *)&v34;
        v22 = &v34;
      }
      objc_msgSend(v33, "unarchivedObjectOfClasses:fromData:error:", v20, v13, v22);
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      v24 = *v21;

      if (v24)
      {
        v25 = AFSiriLogContextUtility;
        if (os_log_type_enabled((os_log_t)AFSiriLogContextUtility, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 136315394;
          v37 = "AFSiriActivationCreateContextFromXPCDictionary_block_invoke";
          v38 = 2112;
          v39 = v24;
          _os_log_error_impl(&dword_19AF50000, v25, OS_LOG_TYPE_ERROR, "%s Unable to deserialize user info data due to error %@.", buf, 0x16u);
        }
      }
      if (objc_msgSend(v23, "count"))
        objc_msgSend(v3, "setUserInfo:", v23);

    }
  }

}

@end
