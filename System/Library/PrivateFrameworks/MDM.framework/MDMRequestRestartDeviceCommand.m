@implementation MDMRequestRestartDeviceCommand

+ (id)requestType
{
  return CFSTR("RestartDevice");
}

+ (unint64_t)requiredAccessRights
{
  return 4;
}

+ (id)requestWithRebuildKernelCache:(id)a3 kextPaths:(id)a4 notifyUser:(id)a5
{
  id v7;
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  id v14;

  v7 = a5;
  v8 = a4;
  v9 = a3;
  v10 = (void *)objc_opt_new();
  v11 = v10;
  v12 = (void *)MEMORY[0x24BDBD1C0];
  if (v9)
    v13 = v9;
  else
    v13 = (id)MEMORY[0x24BDBD1C0];
  objc_msgSend(v10, "setCommandRebuildKernelCache:", v13);

  objc_msgSend(v11, "setCommandKextPaths:", v8);
  if (v7)
    v14 = v7;
  else
    v14 = v12;
  objc_msgSend(v11, "setCommandNotifyUser:", v14);

  return v11;
}

- (BOOL)loadFromDictionary:(id)a3 serializationType:(signed __int16)a4 error:(id *)a5
{
  id v7;
  BOOL v8;

  v7 = a3;
  v8 = 0;
  if (-[RMModelPayloadBase loadBooleanFromDictionary:usingKey:forKeyPath:isRequired:defaultValue:error:](self, "loadBooleanFromDictionary:usingKey:forKeyPath:isRequired:defaultValue:error:", v7, CFSTR("RebuildKernelCache"), CFSTR("commandRebuildKernelCache"), 0, MEMORY[0x24BDBD1C0], a5))
  {
    v8 = 0;
    if (-[RMModelPayloadBase loadArrayFromDictionary:usingKey:forKeyPath:validator:isRequired:defaultValue:error:](self, "loadArrayFromDictionary:usingKey:forKeyPath:validator:isRequired:defaultValue:error:", v7, CFSTR("KextPaths"), CFSTR("commandKextPaths"), &__block_literal_global_5, 0, 0, a5))
    {
      v8 = -[RMModelPayloadBase loadBooleanFromDictionary:usingKey:forKeyPath:isRequired:defaultValue:error:](self, "loadBooleanFromDictionary:usingKey:forKeyPath:isRequired:defaultValue:error:", v7, CFSTR("NotifyUser"), CFSTR("commandNotifyUser"), 0, MEMORY[0x24BDBD1C0], a5);
    }
  }

  return v8;
}

uint64_t __77__MDMRequestRestartDeviceCommand_loadFromDictionary_serializationType_error___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  char isKindOfClass;

  v2 = a2;
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  return isKindOfClass & 1;
}

- (id)serializeWithType:(signed __int16)a3
{
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;

  v4 = (void *)objc_opt_new();
  -[MDMRequestRestartDeviceCommand commandRebuildKernelCache](self, "commandRebuildKernelCache");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = MEMORY[0x24BDBD1C0];
  -[RMModelPayloadBase serializeBooleanIntoDictionary:usingKey:value:isRequired:defaultValue:](self, "serializeBooleanIntoDictionary:usingKey:value:isRequired:defaultValue:", v4, CFSTR("RebuildKernelCache"), v5, 0, MEMORY[0x24BDBD1C0]);

  -[MDMRequestRestartDeviceCommand commandKextPaths](self, "commandKextPaths");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[RMModelPayloadBase serializeArrayIntoDictionary:usingKey:value:itemSerializer:isRequired:defaultValue:](self, "serializeArrayIntoDictionary:usingKey:value:itemSerializer:isRequired:defaultValue:", v4, CFSTR("KextPaths"), v7, &__block_literal_global_17, 0, 0);

  -[MDMRequestRestartDeviceCommand commandNotifyUser](self, "commandNotifyUser");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[RMModelPayloadBase serializeBooleanIntoDictionary:usingKey:value:isRequired:defaultValue:](self, "serializeBooleanIntoDictionary:usingKey:value:isRequired:defaultValue:", v4, CFSTR("NotifyUser"), v8, 0, v6);

  v9 = (void *)objc_msgSend(v4, "copy");
  return v9;
}

id __52__MDMRequestRestartDeviceCommand_serializeWithType___block_invoke(uint64_t a1, void *a2)
{
  return a2;
}

- (id)copyWithZone:(_NSZone *)a3
{
  _QWORD *v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  objc_super v12;

  v12.receiver = self;
  v12.super_class = (Class)MDMRequestRestartDeviceCommand;
  v4 = -[RMModelPayloadBase copyWithZone:](&v12, sel_copyWithZone_, a3);
  v5 = -[NSNumber copy](self->_commandRebuildKernelCache, "copy");
  v6 = (void *)v4[6];
  v4[6] = v5;

  v7 = -[NSArray copy](self->_commandKextPaths, "copy");
  v8 = (void *)v4[7];
  v4[7] = v7;

  v9 = -[NSNumber copy](self->_commandNotifyUser, "copy");
  v10 = (void *)v4[8];
  v4[8] = v9;

  return v4;
}

- (NSNumber)commandRebuildKernelCache
{
  return self->_commandRebuildKernelCache;
}

- (void)setCommandRebuildKernelCache:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 48);
}

- (NSArray)commandKextPaths
{
  return self->_commandKextPaths;
}

- (void)setCommandKextPaths:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 56);
}

- (NSNumber)commandNotifyUser
{
  return self->_commandNotifyUser;
}

- (void)setCommandNotifyUser:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 64);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_commandNotifyUser, 0);
  objc_storeStrong((id *)&self->_commandKextPaths, 0);
  objc_storeStrong((id *)&self->_commandRebuildKernelCache, 0);
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

  MDMSystemRestartLogPath();
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "writeToFile:atomically:encoding:error:", v13, 1, 4, 0);

  MDMSystemRestartLogPath();
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  DMCSetSkipBackupAttributeToItemAtPath();

  v15 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BE38500]), "initWithReason:", CFSTR("mdmd restart device"));
  objc_msgSend(v15, "setRebootType:", 1);
  objc_msgSend(MEMORY[0x24BE38508], "sharedService");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "shutdownWithOptions:", v15);

  while (1)
    sleep(0xE10u);
}

@end
