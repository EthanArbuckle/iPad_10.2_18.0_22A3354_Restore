@implementation NSArray(XPCObject)

- (id)_cs_initWithXPCObject:()XPCObject
{
  id v4;
  void *v5;
  NSObject *v6;
  void *v7;
  void *v8;
  void *v9;
  _QWORD applier[4];
  id v12;
  uint8_t buf[4];
  const char *v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = v4;
  if (!v4)
  {
LABEL_5:
    v7 = 0;
    goto LABEL_9;
  }
  if (MEMORY[0x1B5E46F84](v4) != MEMORY[0x1E0C812C8])
  {
    v6 = CSLogContextFacilityCoreSpeech;
    if (os_log_type_enabled((os_log_t)CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315138;
      v14 = "-[NSArray(XPCObject) _cs_initWithXPCObject:]";
      _os_log_error_impl(&dword_1B502E000, v6, OS_LOG_TYPE_ERROR, "%s xpc object should be XPC_TYPE_ARRAY", buf, 0xCu);
    }
    goto LABEL_5;
  }
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v8;
  if (v8)
  {
    applier[0] = MEMORY[0x1E0C809B0];
    applier[1] = 3221225472;
    applier[2] = __44__NSArray_XPCObject___cs_initWithXPCObject___block_invoke;
    applier[3] = &unk_1E687FFB0;
    v12 = v8;
    xpc_array_apply(v5, applier);

  }
  v7 = (void *)objc_msgSend(a1, "initWithArray:", v9);

LABEL_9:
  return v7;
}

- (id)_cs_xpcObject
{
  xpc_object_t v2;
  id v3;
  _QWORD v5[4];
  id v6;

  v2 = xpc_array_create(0, 0);
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __35__NSArray_XPCObject___cs_xpcObject__block_invoke;
  v5[3] = &unk_1E687FFD8;
  v3 = v2;
  v6 = v3;
  objc_msgSend(a1, "enumerateObjectsUsingBlock:", v5);

  return v3;
}

@end
