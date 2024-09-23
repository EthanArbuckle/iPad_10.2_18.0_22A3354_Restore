@implementation NSString(XPCObject)

- (id)_cs_initWithXPCObject:()XPCObject
{
  id v4;
  void *v5;
  NSObject *v6;
  void *v7;
  const char *string_ptr;
  const char *v10;
  int v11;
  const char *v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = v4;
  if (!v4)
    goto LABEL_4;
  if (MEMORY[0x1B5E46F84](v4) != MEMORY[0x1E0C81390])
  {
    v6 = CSLogContextFacilityCoreSpeech;
    if (!os_log_type_enabled((os_log_t)CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_ERROR))
      goto LABEL_4;
    v11 = 136315138;
    v12 = "-[NSString(XPCObject) _cs_initWithXPCObject:]";
    v10 = "%s xpc object should be XPC_TYPE_STRING";
LABEL_11:
    _os_log_error_impl(&dword_1B502E000, v6, OS_LOG_TYPE_ERROR, v10, (uint8_t *)&v11, 0xCu);
    goto LABEL_4;
  }
  string_ptr = xpc_string_get_string_ptr(v5);
  if (string_ptr)
  {
    v7 = (void *)objc_msgSend(a1, "initWithUTF8String:", string_ptr);
    goto LABEL_5;
  }
  v6 = CSLogContextFacilityCoreSpeech;
  if (os_log_type_enabled((os_log_t)CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_ERROR))
  {
    v11 = 136315138;
    v12 = "-[NSString(XPCObject) _cs_initWithXPCObject:]";
    v10 = "%s xpc object string return nil";
    goto LABEL_11;
  }
LABEL_4:
  v7 = 0;
LABEL_5:

  return v7;
}

- (char)_cs_xpcObject
{
  char *v1;

  v1 = (char *)objc_msgSend(objc_retainAutorelease(a1), "UTF8String");
  if (v1)
    v1 = (char *)xpc_string_create(v1);
  return v1;
}

@end
