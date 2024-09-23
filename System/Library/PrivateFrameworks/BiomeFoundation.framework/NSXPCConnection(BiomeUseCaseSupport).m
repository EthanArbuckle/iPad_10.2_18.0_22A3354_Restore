@implementation NSXPCConnection(BiomeUseCaseSupport)

+ (id)bm_connectionWithListenerEndpoint:()BiomeUseCaseSupport queue:
{
  NSObject *v5;
  _xpc_endpoint_s *v6;
  _xpc_connection_s *v7;
  id v8;

  v5 = a4;
  objc_msgSend(a3, "_endpoint");
  v6 = (_xpc_endpoint_s *)objc_claimAutoreleasedReturnValue();
  v7 = xpc_connection_create_from_endpoint(v6);

  if (v5)
    xpc_connection_set_target_queue(v7, v5);
  v8 = -[_BMXPCConnection _initWithConnection:queue:]([_BMXPCConnection alloc], "_initWithConnection:queue:", v7, v5);

  return v8;
}

+ (id)bm_connectionWithMachServiceName:()BiomeUseCaseSupport queue:options:
{
  uint64_t v6;
  id v7;
  NSObject *v8;
  xpc_connection_t mach_service;
  id v10;

  v6 = (a5 >> 11) & 2;
  v7 = objc_retainAutorelease(a3);
  v8 = a4;
  mach_service = xpc_connection_create_mach_service((const char *)objc_msgSend(v7, "UTF8String"), v8, v6);
  v10 = -[_BMXPCConnection _initWithConnection:queue:]([_BMXPCConnection alloc], "_initWithConnection:queue:", mach_service, v8);

  return v10;
}

+ (id)bm_connectionWithServiceName:()BiomeUseCaseSupport queue:
{
  id v5;
  NSObject *v6;
  xpc_connection_t v7;
  id v8;

  v5 = objc_retainAutorelease(a3);
  v6 = a4;
  v7 = xpc_connection_create((const char *)objc_msgSend(v5, "UTF8String"), v6);
  v8 = -[_BMXPCConnection _initWithConnection:queue:]([_BMXPCConnection alloc], "_initWithConnection:queue:", v7, v6);

  return v8;
}

- (id)bm_remoteUseCase
{
  void *v1;
  void *v2;
  void *v3;

  objc_msgSend(a1, "bm_transport");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "remoteUserInfo");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKeyedSubscript:", CFSTR("UseCase"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (void)setBm_exportedUseCase:()BiomeUseCaseSupport
{
  id v4;
  void *v5;
  id v6;

  v4 = a3;
  objc_msgSend(a1, "bm_transport");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "exportedUserInfo");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKeyedSubscript:", v4, CFSTR("UseCase"));

}

- (id)bm_exportedUseCase
{
  void *v1;
  void *v2;
  void *v3;

  objc_msgSend(a1, "bm_transport");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "exportedUserInfo");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKeyedSubscript:", CFSTR("UseCase"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

@end
