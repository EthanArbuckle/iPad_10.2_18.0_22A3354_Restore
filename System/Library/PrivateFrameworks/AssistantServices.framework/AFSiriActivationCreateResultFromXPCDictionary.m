@implementation AFSiriActivationCreateResultFromXPCDictionary

void __AFSiriActivationCreateResultFromXPCDictionary_block_invoke(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  void *v5;
  id v6;
  const void *bytes_ptr;
  void *v8;
  void *v9;
  id v10;
  NSObject *v11;
  id v12;
  uint8_t buf[4];
  const char *v14;
  __int16 v15;
  id v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  objc_msgSend(v3, "setActionType:", xpc_dictionary_get_int64(*(xpc_object_t *)(a1 + 32), "a"));
  xpc_dictionary_get_value(*(xpc_object_t *)(a1 + 32), "e");
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = (void *)v4;
  if (v4 && MEMORY[0x1A1AC0F84](v4) == MEMORY[0x1E0C812E8])
  {
    v6 = objc_alloc(MEMORY[0x1E0C99D50]);
    bytes_ptr = xpc_data_get_bytes_ptr(v5);
    v8 = (void *)objc_msgSend(v6, "initWithBytesNoCopy:length:freeWhenDone:", bytes_ptr, xpc_data_get_length(v5), 0);
    if (!objc_msgSend(v8, "length"))
    {
LABEL_9:

      goto LABEL_10;
    }
    v12 = 0;
    objc_msgSend(MEMORY[0x1E0CB3710], "unarchivedObjectOfClass:fromData:error:", objc_opt_class(), v8, &v12);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = v12;
    if (v10
      && (v11 = AFSiriLogContextUtility,
          os_log_type_enabled((os_log_t)AFSiriLogContextUtility, OS_LOG_TYPE_ERROR)))
    {
      *(_DWORD *)buf = 136315394;
      v14 = "AFSiriActivationCreateResultFromXPCDictionary_block_invoke";
      v15 = 2112;
      v16 = v10;
      _os_log_error_impl(&dword_19AF50000, v11, OS_LOG_TYPE_ERROR, "%s Unable to deserialize error data due to error %@.", buf, 0x16u);
      if (!v9)
        goto LABEL_8;
    }
    else if (!v9)
    {
LABEL_8:

      goto LABEL_9;
    }
    objc_msgSend(v3, "setError:", v9);
    goto LABEL_8;
  }
LABEL_10:

}

@end
