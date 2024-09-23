@implementation MDMRequestShutDownDeviceCommand

+ (id)requestType
{
  return CFSTR("ShutDownDevice");
}

+ (unint64_t)requiredAccessRights
{
  return 4;
}

+ (id)request
{
  return (id)objc_opt_new();
}

- (BOOL)loadFromDictionary:(id)a3 serializationType:(signed __int16)a4 error:(id *)a5
{
  return 1;
}

- (id)serializeWithType:(signed __int16)a3
{
  void *v3;
  void *v4;

  v3 = (void *)objc_opt_new();
  v4 = (void *)objc_msgSend(v3, "copy");

  return v4;
}

- (id)copyWithZone:(_NSZone *)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)MDMRequestShutDownDeviceCommand;
  return -[RMModelPayloadBase copyWithZone:](&v4, sel_copyWithZone_, a3);
}

- (void)processRequest:(id)a3 completionHandler:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;

  v6 = a3;
  v7 = a4;
  -[MDMRequestBase delegate](self, "delegate");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  +[MDMAbstractTunnelParser responseWithStatus:](MDMParser, "responseWithStatus:", CFSTR("Acknowledged"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "willTerminateProcess:", v9);

  v10 = objc_alloc_init(MEMORY[0x24BDD15D0]);
  objc_msgSend(MEMORY[0x24BDBCE60], "date");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "stringFromDate:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  MDMSystemShutDownLogPath();
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "writeToFile:atomically:encoding:error:", v13, 1, 4, 0);

  MDMSystemShutDownLogPath();
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  DMCSetSkipBackupAttributeToItemAtPath();

  v15 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BE38500]), "initWithReason:", CFSTR("mdmd shut down device"));
  objc_msgSend(v15, "setRebootType:", 0);
  objc_msgSend(MEMORY[0x24BE38508], "sharedService");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "shutdownWithOptions:", v15);

  while (1)
    sleep(0xE10u);
}

@end
