@implementation _CRSServiceBundle

- (id)underlyingService
{
  void *v3;
  void *v4;

  v3 = (void *)-[_CRSServiceBundle principalClass](self, "principalClass");
  if (!self->_service)
  {
    v4 = v3;
    if (objc_msgSend(v3, "conformsToProtocol:", &unk_2550A19F0))
      -[_CRSServiceBundle _initializeServiceWithClass:](self, "_initializeServiceWithClass:", v4);
  }
  return self->_service;
}

- (void)_initializeServiceWithClass:(Class)a3
{
  void *v5;
  NSObject *v6;
  void *v7;
  CRSServing *v8;
  CRSServing *service;
  int v10;
  void *v11;
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  v5 = (void *)*MEMORY[0x24BE15490];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE15490], OS_LOG_TYPE_INFO))
  {
    v6 = v5;
    NSStringFromClass(a3);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = 138412290;
    v11 = v7;
    _os_log_impl(&dword_219849000, v6, OS_LOG_TYPE_INFO, "Initializing a service of class %@", (uint8_t *)&v10, 0xCu);

  }
  v8 = (CRSServing *)objc_alloc_init(a3);
  service = self->_service;
  self->_service = v8;

}

- (NSString)serviceIdentifier
{
  void *v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  objc_class *v8;
  void *v9;

  -[_CRSServiceBundle bundleIdentifier](self, "bundleIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
  {
    v5 = v3;
  }
  else
  {
    v6 = (void *)MEMORY[0x24BDD17C8];
    -[_CRSServiceBundle underlyingService](self, "underlyingService");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = (objc_class *)objc_opt_class();
    NSStringFromClass(v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "stringWithFormat:", CFSTR("%@%@"), CFSTR("com.apple.cardservicesbundleservice."), v9);
    v5 = (id)objc_claimAutoreleasedReturnValue();

  }
  return (NSString *)v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_service, 0);
}

@end
