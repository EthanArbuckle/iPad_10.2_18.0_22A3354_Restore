@implementation NSXPCCoder(GEOXPCUtil)

- (void)geo_encodeXPCInt64:()GEOXPCUtil forKey:
{
  id v6;
  id v7;

  v6 = a4;
  v7 = xpc_int64_create(a3);
  objc_msgSend(a1, "encodeXPCObject:forKey:", v7, v6);

}

- (void)geo_encodeXPCDouble:()GEOXPCUtil forKey:
{
  id v6;
  id v7;

  v6 = a4;
  v7 = xpc_double_create(a2);
  objc_msgSend(a1, "encodeXPCObject:forKey:", v7, v6);

}

- (void)geo_encodeXPCData:()GEOXPCUtil forKey:
{
  id v6;
  NSObject *v7;
  id v8;

  if (a3)
  {
    v6 = a4;
    objc_msgSend(a3, "_GEOCreateDispatchData");
    v7 = objc_claimAutoreleasedReturnValue();
    v8 = xpc_data_create_with_dispatch_data(v7);

    objc_msgSend(a1, "encodeXPCObject:forKey:", v8, v6);
  }
}

- (dispatch_data_t)geo_decodeXPCDataForKey:()GEOXPCUtil
{
  uint64_t v1;
  void *v2;
  dispatch_data_t v3;
  const void *bytes_ptr;
  size_t length;
  NSObject *global_queue;
  _QWORD destructor[4];
  id v9;

  objc_msgSend(a1, "decodeXPCObjectForKey:");
  v1 = objc_claimAutoreleasedReturnValue();
  v2 = (void *)v1;
  if (v1 && MEMORY[0x18D765A14](v1) == MEMORY[0x1E0C812E8])
  {
    bytes_ptr = xpc_data_get_bytes_ptr(v2);
    length = xpc_data_get_length(v2);
    global_queue = geo_get_global_queue();
    destructor[0] = MEMORY[0x1E0C809B0];
    destructor[1] = 3221225472;
    destructor[2] = __50__NSXPCCoder_GEOXPCUtil__geo_decodeXPCDataForKey___block_invoke;
    destructor[3] = &unk_1E1BFF6F8;
    v9 = v2;
    v3 = dispatch_data_create(bytes_ptr, length, global_queue, destructor);

  }
  else
  {
    v3 = 0;
  }

  return v3;
}

- (void)geo_encodeXPCString:()GEOXPCUtil forKey:
{
  id v6;
  id v7;
  id v8;

  if (a3)
  {
    v6 = objc_retainAutorelease(a3);
    v7 = a4;
    v8 = xpc_string_create((const char *)objc_msgSend(v6, "UTF8String"));
    objc_msgSend(a1, "encodeXPCObject:forKey:", v8, v7);

  }
}

- (uint64_t)geo_decodeXPCInt64ForKey:()GEOXPCUtil defaultValue:
{
  uint64_t result;
  char v6;

  v6 = 1;
  result = objc_msgSend(a1, "geo_decodeXPCInt64ForKey:success:", a3, &v6);
  if (!v6)
    return a4;
  return result;
}

- (int64_t)geo_decodeXPCInt64ForKey:()GEOXPCUtil success:
{
  uint64_t v5;
  void *v6;
  int64_t value;

  objc_msgSend(a1, "decodeXPCObjectForKey:");
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = (void *)v5;
  if (v5 && MEMORY[0x18D765A14](v5) == MEMORY[0x1E0C81328])
  {
    value = xpc_int64_get_value(v6);
  }
  else
  {
    value = 0;
    *a4 = 0;
  }

  return value;
}

- (uint64_t)geo_decodeXPCDoubleForKey:()GEOXPCUtil defaultValue:
{
  char v4;

  v4 = 1;
  return objc_msgSend(a1, "geo_decodeXPCDoubleForKey:success:", a3, &v4);
}

- (double)geo_decodeXPCDoubleForKey:()GEOXPCUtil success:
{
  uint64_t v5;
  void *v6;
  double value;

  objc_msgSend(a1, "decodeXPCObjectForKey:");
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = (void *)v5;
  if (v5 && MEMORY[0x18D765A14](v5) == MEMORY[0x1E0C81300])
  {
    value = xpc_double_get_value(v6);
  }
  else
  {
    *a4 = 0;
    value = 0.0;
  }

  return value;
}

- (id)geo_decodeXPCStringForKey:()GEOXPCUtil
{
  uint64_t v1;
  void *v2;
  void *v3;
  const char *string_ptr;
  size_t length;
  NSObject *global_queue;
  dispatch_data_t v8;
  _QWORD destructor[4];
  id v10;

  objc_msgSend(a1, "decodeXPCObjectForKey:");
  v1 = objc_claimAutoreleasedReturnValue();
  v2 = (void *)v1;
  if (!v1)
    goto LABEL_3;
  if (MEMORY[0x18D765A14](v1) != MEMORY[0x1E0C81390])
    goto LABEL_3;
  string_ptr = xpc_string_get_string_ptr(v2);
  length = xpc_string_get_length(v2);
  global_queue = geo_get_global_queue();
  destructor[0] = MEMORY[0x1E0C809B0];
  destructor[1] = 3221225472;
  destructor[2] = __52__NSXPCCoder_GEOXPCUtil__geo_decodeXPCStringForKey___block_invoke;
  destructor[3] = &unk_1E1BFF6F8;
  v10 = v2;
  v8 = dispatch_data_create(string_ptr, length, global_queue, destructor);

  if (v8)
  {
    v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithData:encoding:", v8, 4);

  }
  else
  {
LABEL_3:
    v3 = 0;
  }

  return v3;
}

@end
