@implementation MTXPCConnectionInfo

- (MTXPCConnectionInfo)initWithMachServiceName:(id)a3 remoteObjectInterface:(id)a4 exportedObject:(id)a5 exportedObjectInterface:(id)a6 lifecycleNotification:(id)a7 requiredEntitlement:(id)a8 options:(unint64_t)a9
{
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  void *v20;
  char v21;
  MTXPCConnectionInfo *v22;
  uint64_t v23;
  NSString *machServiceName;
  uint64_t v25;
  NSString *lifecycleNotification;
  uint64_t v27;
  NSString *requiredEntitlement;
  void *v30;
  void *v31;
  NSObject *v32;
  id v34;
  id v35;
  objc_super v36;

  v15 = a3;
  v35 = a4;
  v16 = a5;
  v17 = a6;
  v18 = a7;
  v19 = a8;
  if (v16)
  {
    objc_msgSend(v17, "protocol");
    v34 = v15;
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = objc_msgSend(v16, "conformsToProtocol:", v20);

    v15 = v34;
    if ((v21 & 1) == 0)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "protocol");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v30, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("MTXPCConnectionInfo.m"), 62, CFSTR("exportedObject: %@ must conform to protocol: %@"), v16, v31);

      MTLogForCategory(2);
      v32 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR))
        -[MTXPCConnectionInfo initWithMachServiceName:remoteObjectInterface:exportedObject:exportedObjectInterface:lifecycleNotification:requiredEntitlement:options:].cold.1((uint64_t)v16, v17, v32);

      v15 = v34;
    }
  }
  v36.receiver = self;
  v36.super_class = (Class)MTXPCConnectionInfo;
  v22 = -[MTXPCConnectionInfo init](&v36, sel_init);
  if (v22)
  {
    v23 = objc_msgSend(v15, "copy");
    machServiceName = v22->_machServiceName;
    v22->_machServiceName = (NSString *)v23;

    objc_storeStrong((id *)&v22->_remoteObjectInterface, a4);
    objc_storeStrong(&v22->_exportedObject, a5);
    objc_storeStrong((id *)&v22->_exportedObjectInterface, a6);
    v25 = objc_msgSend(v18, "copy");
    lifecycleNotification = v22->_lifecycleNotification;
    v22->_lifecycleNotification = (NSString *)v25;

    v27 = objc_msgSend(v19, "copy");
    requiredEntitlement = v22->_requiredEntitlement;
    v22->_requiredEntitlement = (NSString *)v27;

    v22->_options = a9;
  }

  return v22;
}

- (id)description
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = objc_opt_class();
  -[MTXPCConnectionInfo machServiceName](self, "machServiceName");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@:%p %@>"), v4, self, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (NSString)machServiceName
{
  return self->_machServiceName;
}

- (id)exportedObject
{
  return self->_exportedObject;
}

- (NSXPCInterface)remoteObjectInterface
{
  return self->_remoteObjectInterface;
}

- (unint64_t)options
{
  return self->_options;
}

- (NSXPCInterface)exportedObjectInterface
{
  return self->_exportedObjectInterface;
}

- (NSString)lifecycleNotification
{
  return self->_lifecycleNotification;
}

+ (id)infoForMachServiceName:(id)a3 remoteObjectInterface:(id)a4 exportedObject:(id)a5 exportedObjectInterface:(id)a6 lifecycleNotification:(id)a7 requiredEntitlement:(id)a8 options:(unint64_t)a9
{
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  void *v20;

  v14 = a8;
  v15 = a7;
  v16 = a6;
  v17 = a5;
  v18 = a4;
  v19 = a3;
  v20 = (void *)objc_msgSend(objc_alloc((Class)objc_opt_class()), "initWithMachServiceName:remoteObjectInterface:exportedObject:exportedObjectInterface:lifecycleNotification:requiredEntitlement:options:", v19, v18, v17, v16, v15, v14, 0);

  return v20;
}

- (NSString)requiredEntitlement
{
  return self->_requiredEntitlement;
}

+ (id)infoForMachServiceName:(id)a3 remoteObjectInterface:(id)a4 options:(unint64_t)a5
{
  return (id)objc_msgSend(a1, "infoForMachServiceName:remoteObjectInterface:exportedObject:exportedObjectInterface:lifecycleNotification:requiredEntitlement:options:", a3, a4, 0, 0, 0, 0, a5);
}

- (void)setMachServiceName:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (void)setRemoteObjectInterface:(id)a3
{
  objc_storeStrong((id *)&self->_remoteObjectInterface, a3);
}

- (void)setExportedObject:(id)a3
{
  objc_storeStrong(&self->_exportedObject, a3);
}

- (void)setExportedObjectInterface:(id)a3
{
  objc_storeStrong((id *)&self->_exportedObjectInterface, a3);
}

- (void)setLifecycleNotification:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (void)setRequiredEntitlement:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 48);
}

- (void)setOptions:(unint64_t)a3
{
  self->_options = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_requiredEntitlement, 0);
  objc_storeStrong((id *)&self->_lifecycleNotification, 0);
  objc_storeStrong((id *)&self->_exportedObjectInterface, 0);
  objc_storeStrong(&self->_exportedObject, 0);
  objc_storeStrong((id *)&self->_remoteObjectInterface, 0);
  objc_storeStrong((id *)&self->_machServiceName, 0);
}

- (void)initWithMachServiceName:(NSObject *)a3 remoteObjectInterface:exportedObject:exportedObjectInterface:lifecycleNotification:requiredEntitlement:options:.cold.1(uint64_t a1, void *a2, NSObject *a3)
{
  void *v5;
  int v6;
  uint64_t v7;
  __int16 v8;
  void *v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a2, "protocol");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = 138543618;
  v7 = a1;
  v8 = 2114;
  v9 = v5;
  _os_log_error_impl(&dword_19AC4E000, a3, OS_LOG_TYPE_ERROR, "exportedObject: %{public}@ must conform to protocol: %{public}@", (uint8_t *)&v6, 0x16u);

}

@end
