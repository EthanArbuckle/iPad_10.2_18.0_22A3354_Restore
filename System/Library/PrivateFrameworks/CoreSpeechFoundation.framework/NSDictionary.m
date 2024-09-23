@implementation NSDictionary

void __40__NSDictionary_XPCObject___cs_xpcObject__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  char isKindOfClass;
  void *v9;
  id v10;
  void *v11;
  NSObject *v12;
  void *v13;
  NSObject *v14;
  uint8_t buf[4];
  const char *v16;
  __int16 v17;
  void *v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    if ((objc_opt_respondsToSelector() & 1) != 0)
    {
      objc_msgSend(v6, "_cs_xpcObject");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      if (v7)
      {
        objc_opt_class();
        isKindOfClass = objc_opt_isKindOfClass();
        v9 = *(void **)(a1 + 32);
        if ((isKindOfClass & 1) != 0)
        {
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@"), v5);
          v10 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
          xpc_dictionary_set_value(v9, (const char *)objc_msgSend(v10, "UTF8String"), v7);

        }
        else
        {
          xpc_dictionary_set_value(v9, (const char *)objc_msgSend(objc_retainAutorelease(v5), "UTF8String"), v7);
        }
      }

    }
    else
    {
      v11 = (void *)CSLogContextFacilityCoreSpeech;
      if (os_log_type_enabled((os_log_t)CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_ERROR))
      {
        v12 = v11;
        objc_msgSend(v6, "description");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 136315394;
        v16 = "-[NSDictionary(XPCObject) _cs_xpcObject]_block_invoke";
        v17 = 2114;
        v18 = v13;
        _os_log_error_impl(&dword_1B502E000, v12, OS_LOG_TYPE_ERROR, "%s Cannot encode non-plist types into XPC object : %{public}@", buf, 0x16u);

      }
    }
  }
  else
  {
    v14 = CSLogContextFacilityCoreSpeech;
    if (os_log_type_enabled((os_log_t)CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315138;
      v16 = "-[NSDictionary(XPCObject) _cs_xpcObject]_block_invoke";
      _os_log_error_impl(&dword_1B502E000, v14, OS_LOG_TYPE_ERROR, "%s Cannot encode key into xpcobject since the key is not NSString class type", buf, 0xCu);
    }
  }

}

uint64_t __49__NSDictionary_XPCObject___cs_initWithXPCObject___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v5;
  void *v6;
  void *v7;
  uint64_t v8;
  NSObject *v12;
  NSObject *v13;
  Class *v14;
  id v15;
  void *v16;
  int v18;
  const char *v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = v5;
  if (a2 && v5)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", a2);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = MEMORY[0x1B5E46F84](v6);
    if (v8 == MEMORY[0x1E0C81398]
      || v8 == MEMORY[0x1E0C81328]
      || v8 == MEMORY[0x1E0C812D0]
      || v8 == MEMORY[0x1E0C81300])
    {
      v14 = (Class *)0x1E0CB37E8;
    }
    else if (v8 == MEMORY[0x1E0C812F8])
    {
      v14 = (Class *)0x1E0C99D80;
    }
    else if (v8 == MEMORY[0x1E0C81390])
    {
      v14 = (Class *)0x1E0CB3940;
    }
    else if (v8 == MEMORY[0x1E0C812E8])
    {
      v14 = (Class *)0x1E0C99D50;
    }
    else
    {
      if (v8 != MEMORY[0x1E0C812C8])
      {
        v12 = CSLogContextFacilityCoreSpeech;
        if (os_log_type_enabled((os_log_t)CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_ERROR))
        {
          v18 = 136315138;
          v19 = "-[NSDictionary(XPCObject) _cs_initWithXPCObject:]_block_invoke";
          _os_log_error_impl(&dword_1B502E000, v12, OS_LOG_TYPE_ERROR, "%s Cannot decode non-plist types of XPC object", (uint8_t *)&v18, 0xCu);
        }
LABEL_28:

        goto LABEL_29;
      }
      v14 = (Class *)0x1E0C99D20;
    }
    v15 = objc_alloc(*v14);
    objc_msgSend(v15, "_cs_initWithXPCObject:", v6);
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    if (v16)
    {
      objc_msgSend(*(id *)(a1 + 32), "setObject:forKey:", v16, v7);

    }
    goto LABEL_28;
  }
  v13 = CSLogContextFacilityCoreSpeech;
  if (os_log_type_enabled((os_log_t)CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_ERROR))
  {
    v18 = 136315138;
    v19 = "-[NSDictionary(XPCObject) _cs_initWithXPCObject:]_block_invoke";
    _os_log_error_impl(&dword_1B502E000, v13, OS_LOG_TYPE_ERROR, "%s xpcObject key or value is NULL", (uint8_t *)&v18, 0xCu);
  }
LABEL_29:

  return 1;
}

@end
