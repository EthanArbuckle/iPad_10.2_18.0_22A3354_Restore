@implementation NSData(GEOXPCUtil)

- (xpc_object_t)_geo_newXPCData
{
  NSObject *v1;
  xpc_object_t v2;

  objc_msgSend(a1, "_GEOCreateDispatchData");
  v1 = objc_claimAutoreleasedReturnValue();
  v2 = xpc_data_create_with_dispatch_data(v1);

  return v2;
}

+ (dispatch_data_t)_geo_withXPCData:()GEOXPCUtil
{
  id v3;
  void *v4;
  const void *bytes_ptr;
  size_t length;
  NSObject *global_queue;
  dispatch_data_t v8;
  _QWORD destructor[4];
  id v11;

  v3 = a3;
  v4 = v3;
  if (v3 && MEMORY[0x18D765A14](v3) == MEMORY[0x1E0C812E8])
  {
    bytes_ptr = xpc_data_get_bytes_ptr(v4);
    length = xpc_data_get_length(v4);
    global_queue = geo_get_global_queue();
    destructor[0] = MEMORY[0x1E0C809B0];
    destructor[1] = 3221225472;
    destructor[2] = __39__NSData_GEOXPCUtil___geo_withXPCData___block_invoke;
    destructor[3] = &unk_1E1BFF6F8;
    v11 = v4;
    v8 = dispatch_data_create(bytes_ptr, length, global_queue, destructor);

  }
  else
  {
    v8 = 0;
  }

  return v8;
}

@end
