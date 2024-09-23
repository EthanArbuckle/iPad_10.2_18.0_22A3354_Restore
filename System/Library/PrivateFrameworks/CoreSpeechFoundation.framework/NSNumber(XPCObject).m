@implementation NSNumber(XPCObject)

- (id)_cs_initWithXPCObject:()XPCObject
{
  id v4;
  void *v5;
  uint64_t v6;
  NSObject *v7;
  const char *v8;
  void *v9;
  uint64_t v10;
  int v12;
  const char *v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = v4;
  if (v4)
  {
    v6 = MEMORY[0x1B5E46F84](v4);
    if (v6 == MEMORY[0x1E0C812D0])
    {
      v10 = objc_msgSend(a1, "initWithBool:", xpc_BOOL_get_value(v5));
    }
    else if (v6 == MEMORY[0x1E0C81300])
    {
      v10 = objc_msgSend(a1, "initWithDouble:", xpc_double_get_value(v5));
    }
    else if (v6 == MEMORY[0x1E0C81328])
    {
      v10 = objc_msgSend(a1, "initWithLongLong:", xpc_int64_get_value(v5));
    }
    else
    {
      if (v6 != MEMORY[0x1E0C81398])
      {
        v7 = CSLogContextFacilityCoreSpeech;
        if (os_log_type_enabled((os_log_t)CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_ERROR))
        {
          v12 = 136315138;
          v13 = "-[NSNumber(XPCObject) _cs_initWithXPCObject:]";
          v8 = "%s XPC object type should be BOOL, DOUBLE, INT64, or UINT64";
LABEL_17:
          _os_log_error_impl(&dword_1B502E000, v7, OS_LOG_TYPE_ERROR, v8, (uint8_t *)&v12, 0xCu);
          goto LABEL_9;
        }
        goto LABEL_9;
      }
      v10 = objc_msgSend(a1, "initWithUnsignedLongLong:", xpc_uint64_get_value(v5));
    }
    v9 = (void *)v10;
    goto LABEL_15;
  }
  v7 = CSLogContextFacilityCoreSpeech;
  if (os_log_type_enabled((os_log_t)CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_ERROR))
  {
    v12 = 136315138;
    v13 = "-[NSNumber(XPCObject) _cs_initWithXPCObject:]";
    v8 = "%s Cannot create NSNumber if xpcObject is NULL";
    goto LABEL_17;
  }
LABEL_9:
  v9 = 0;
LABEL_15:

  return v9;
}

- (id)_cs_xpcObject
{
  id v1;
  char *v2;
  int v3;
  char v4;
  xpc_object_t v5;
  NSObject *v6;
  double v8;
  const char *v9;
  int v10;
  const char *v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v1 = objc_retainAutorelease(a1);
  v2 = (char *)objc_msgSend(v1, "objCType");
  if (!v2)
  {
    v6 = CSLogContextFacilityCoreSpeech;
    if (os_log_type_enabled((os_log_t)CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_ERROR))
    {
      v10 = 136315138;
      v11 = "-[NSNumber(XPCObject) _cs_xpcObject]";
      v9 = "%s Cannot create xpcObject if objcType is NULL";
      goto LABEL_18;
    }
    return 0;
  }
  v3 = *v2;
  v4 = v3 - 67;
  if ((v3 - 67) > 0x30)
  {
LABEL_11:
    if (v3 == 66)
    {
      v5 = xpc_BOOL_create(objc_msgSend(v1, "BOOLValue"));
      return v5;
    }
    v6 = CSLogContextFacilityCoreSpeech;
    if (os_log_type_enabled((os_log_t)CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_ERROR))
    {
      v10 = 136315138;
      v11 = "-[NSNumber(XPCObject) _cs_xpcObject]";
      v9 = "%s Cannot create xpcObject since there is no matching type";
LABEL_18:
      _os_log_error_impl(&dword_1B502E000, v6, OS_LOG_TYPE_ERROR, v9, (uint8_t *)&v10, 0xCu);
      return 0;
    }
    return 0;
  }
  if (((1 << v4) & 0x14241) != 0)
  {
    v5 = xpc_uint64_create(objc_msgSend(v1, "unsignedLongLongValue"));
    return v5;
  }
  if (((1 << v4) & 0x1424100000000) == 0)
  {
    if (((1 << v4) & 0xA00000000) != 0)
    {
      objc_msgSend(v1, "doubleValue");
      v5 = xpc_double_create(v8);
      return v5;
    }
    goto LABEL_11;
  }
  v5 = xpc_int64_create(objc_msgSend(v1, "longLongValue"));
  return v5;
}

@end
