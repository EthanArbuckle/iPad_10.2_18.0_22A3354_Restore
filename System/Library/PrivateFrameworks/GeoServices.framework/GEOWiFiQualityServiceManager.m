@implementation GEOWiFiQualityServiceManager

+ (void)useProxyClass:(Class)a3
{
  void *v4;
  NSObject *v5;
  const char *v6;
  uint8_t *v7;
  id v8;
  uint8_t buf[2];
  __int16 v10;

  v4 = &unk_1EDF7C508;
  if (_MergedGlobals_205)
  {
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT))
    {
      v10 = 0;
      v5 = MEMORY[0x1E0C81028];
      v6 = "Assertion failed: !_sharedManager";
      v7 = (uint8_t *)&v10;
LABEL_8:
      _os_log_fault_impl(&dword_1885A9000, v5, OS_LOG_TYPE_FAULT, v6, v7, 2u);
    }
  }
  else
  {
    v8 = v4;
    if ((-[objc_class conformsToProtocol:](a3, "conformsToProtocol:", v4) & 1) != 0)
    {
      qword_1ECDBBBE8 = (uint64_t)a3;

      return;
    }
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT))
    {
      *(_WORD *)buf = 0;
      v5 = MEMORY[0x1E0C81028];
      v6 = "Assertion failed: [proxyClass conformsToProtocol:protocol]";
      v7 = buf;
      goto LABEL_8;
    }
  }
  __break(1u);
}

+ (id)sharedManager
{
  if (qword_1ECDBBBF0 != -1)
    dispatch_once(&qword_1ECDBBBF0, &__block_literal_global_43);
  return (id)_MergedGlobals_205;
}

void __45__GEOWiFiQualityServiceManager_sharedManager__block_invoke()
{
  GEOWiFiQualityServiceManager *v0;
  void *v1;

  v0 = objc_alloc_init(GEOWiFiQualityServiceManager);
  v1 = (void *)_MergedGlobals_205;
  _MergedGlobals_205 = (uint64_t)v0;

}

- (GEOWiFiQualityServiceManager)init
{
  GEOWiFiQualityServiceManager *v2;
  objc_class *v3;
  void *v4;
  GEOWiFiQualityServiceProxy *v5;
  GEOWiFiQualityServiceProxy *proxy;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)GEOWiFiQualityServiceManager;
  v2 = -[GEOWiFiQualityServiceManager init](&v8, sel_init);
  if (v2)
  {
    v3 = (objc_class *)qword_1ECDBBBE8;
    if (!qword_1ECDBBBE8)
    {
      v4 = (void *)objc_opt_class();
      objc_msgSend(v4, "useProxyClass:", objc_opt_class());
      v3 = (objc_class *)qword_1ECDBBBE8;
    }
    v5 = (GEOWiFiQualityServiceProxy *)objc_alloc_init(v3);
    proxy = v2->_proxy;
    v2->_proxy = v5;

  }
  return v2;
}

- (void)submitWiFiQualityServiceRequest:(id)a3 requestId:(id)a4 auditToken:(id)a5 completionQueue:(id)a6 completion:(id)a7
{
  -[GEOWiFiQualityServiceProxy submitWiFiQualityServiceRequest:requestId:auditToken:completionQueue:completion:](self->_proxy, "submitWiFiQualityServiceRequest:requestId:auditToken:completionQueue:completion:", a3, a4, a5, a6, a7);
}

- (void)submitWiFiQualityTileLoadForKey:(id)a3 eTag:(id)a4 requestId:(id)a5 auditToken:(id)a6 completionQueue:(id)a7 completion:(id)a8
{
  -[GEOWiFiQualityServiceProxy submitWiFiQualityTileLoadForKey:eTag:requestId:auditToken:completionQueue:completion:](self->_proxy, "submitWiFiQualityTileLoadForKey:eTag:requestId:auditToken:completionQueue:completion:", a3, a4, a5, a6, a7, a8);
}

- (void)cancelRequestId:(id)a3
{
  -[GEOWiFiQualityServiceProxy cancelRequestId:](self->_proxy, "cancelRequestId:", a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_proxy, 0);
}

@end
