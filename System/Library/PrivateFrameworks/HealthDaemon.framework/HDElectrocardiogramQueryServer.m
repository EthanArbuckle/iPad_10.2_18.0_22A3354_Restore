@implementation HDElectrocardiogramQueryServer

+ (Class)queryClass
{
  return (Class)objc_opt_class();
}

+ (id)requiredEntitlements
{
  return (id)MEMORY[0x1E0C9AA60];
}

- (void)_queue_start
{
  void *v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;
  id v8;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)HDElectrocardiogramQueryServer;
  -[HDQueryServer _queue_start](&v9, sel__queue_start);
  -[HDQueryServer clientProxy](self, "clientProxy");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[HDQueryServer objectType](self, "objectType");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = 0;
  -[HDQueryServer readAuthorizationStatusForType:error:](self, "readAuthorizationStatusForType:error:", v4, &v8);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v8;

  if (v5)
  {
    objc_msgSend(v3, "client_deliverData");
  }
  else
  {
    -[HDQueryServer queryUUID](self, "queryUUID");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "client_deliverError:forQuery:", v6, v7);

  }
}

@end
