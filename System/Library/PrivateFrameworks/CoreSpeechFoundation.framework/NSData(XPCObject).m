@implementation NSData(XPCObject)

- (id)_cs_initWithXPCObject:()XPCObject
{
  id v4;
  void *v5;
  NSObject *v6;
  void *v7;
  size_t length;
  const char *v10;
  int v11;
  const char *v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = v4;
  if (!v4)
    goto LABEL_4;
  if (MEMORY[0x1B5E46F84](v4) != MEMORY[0x1E0C812E8])
  {
    v6 = CSLogContextFacilityCoreSpeech;
    if (!os_log_type_enabled((os_log_t)CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_ERROR))
      goto LABEL_4;
    v11 = 136315138;
    v12 = "-[NSData(XPCObject) _cs_initWithXPCObject:]";
    v10 = "%s xpc object should be XPC_TYPE_DATA";
LABEL_11:
    _os_log_error_impl(&dword_1B502E000, v6, OS_LOG_TYPE_ERROR, v10, (uint8_t *)&v11, 0xCu);
    goto LABEL_4;
  }
  length = xpc_data_get_length(v5);
  if (length)
  {
    v7 = (void *)objc_msgSend(a1, "initWithBytes:length:", xpc_data_get_bytes_ptr(v5), length);
    goto LABEL_5;
  }
  v6 = CSLogContextFacilityCoreSpeech;
  if (os_log_type_enabled((os_log_t)CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_ERROR))
  {
    v11 = 136315138;
    v12 = "-[NSData(XPCObject) _cs_initWithXPCObject:]";
    v10 = "%s Cannot create NSData with size 0";
    goto LABEL_11;
  }
LABEL_4:
  v7 = 0;
LABEL_5:

  return v7;
}

- (xpc_object_t)_cs_xpcObject
{
  id v1;

  v1 = objc_retainAutorelease(a1);
  return xpc_data_create((const void *)objc_msgSend(v1, "bytes"), objc_msgSend(v1, "length"));
}

@end
