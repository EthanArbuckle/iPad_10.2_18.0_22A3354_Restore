@implementation NSArray

void __35__NSArray_XPCObject___cs_xpcObject__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  NSObject *v7;
  void *v8;
  int v9;
  const char *v10;
  __int16 v11;
  void *v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    v4 = *(void **)(a1 + 32);
    objc_msgSend(v3, "_cs_xpcObject");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    xpc_array_append_value(v4, v5);

  }
  else
  {
    v6 = (void *)CSLogContextFacilityCoreSpeech;
    if (os_log_type_enabled((os_log_t)CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_ERROR))
    {
      v7 = v6;
      objc_msgSend(v3, "description");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = 136315394;
      v10 = "-[NSArray(XPCObject) _cs_xpcObject]_block_invoke";
      v11 = 2114;
      v12 = v8;
      _os_log_error_impl(&dword_1B502E000, v7, OS_LOG_TYPE_ERROR, "%s Cannot encode non-plist types into XPC object : %{public}@", (uint8_t *)&v9, 0x16u);

    }
  }

}

uint64_t __44__NSArray_XPCObject___cs_initWithXPCObject___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v4;
  void *v5;
  uint64_t v6;
  NSObject *v10;
  const char *v11;
  Class *v12;
  id v13;
  void *v14;
  int v16;
  const char *v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = v4;
  if (v4)
  {
    v6 = MEMORY[0x1B5E46F84](v4);
    if (v6 == MEMORY[0x1E0C81398]
      || v6 == MEMORY[0x1E0C81328]
      || v6 == MEMORY[0x1E0C812D0]
      || v6 == MEMORY[0x1E0C81300])
    {
      v12 = (Class *)0x1E0CB37E8;
    }
    else if (v6 == MEMORY[0x1E0C812F8])
    {
      v12 = (Class *)0x1E0C99D80;
    }
    else if (v6 == MEMORY[0x1E0C81390])
    {
      v12 = (Class *)0x1E0CB3940;
    }
    else if (v6 == MEMORY[0x1E0C812E8])
    {
      v12 = (Class *)0x1E0C99D50;
    }
    else
    {
      if (v6 != MEMORY[0x1E0C812C8])
      {
        v10 = CSLogContextFacilityCoreSpeech;
        if (os_log_type_enabled((os_log_t)CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_ERROR))
        {
          v16 = 136315138;
          v17 = "-[NSArray(XPCObject) _cs_initWithXPCObject:]_block_invoke";
          v11 = "%s Cannot decode non-plist types of XPC object";
LABEL_20:
          _os_log_error_impl(&dword_1B502E000, v10, OS_LOG_TYPE_ERROR, v11, (uint8_t *)&v16, 0xCu);
          goto LABEL_28;
        }
        goto LABEL_28;
      }
      v12 = (Class *)0x1E0C99D20;
    }
    v13 = objc_alloc(*v12);
    objc_msgSend(v13, "_cs_initWithXPCObject:", v5);
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    if (v14)
    {
      objc_msgSend(*(id *)(a1 + 32), "addObject:", v14);

    }
    goto LABEL_28;
  }
  v10 = CSLogContextFacilityCoreSpeech;
  if (os_log_type_enabled((os_log_t)CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_ERROR))
  {
    v16 = 136315138;
    v17 = "-[NSArray(XPCObject) _cs_initWithXPCObject:]_block_invoke";
    v11 = "%s xpcObject value is NULL";
    goto LABEL_20;
  }
LABEL_28:

  return 1;
}

@end
