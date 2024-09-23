@implementation FMXPCServiceDescription

- (FMXPCServiceDescription)initWithMachServiceName:(id)a3 options:(unint64_t)a4 exportedObject:(id)a5 exportedInterface:(id)a6 remoteObjectInterface:(id)a7 interruptionHandler:(id)a8 invalidationHandler:(id)a9
{
  return (FMXPCServiceDescription *)-[FMXPCServiceDescription initInternalWithMachServiceName:options:exportedObject:exportedInterface:remoteObjectInterface:interruptionHandler:invalidationHandler:](self, "initInternalWithMachServiceName:options:exportedObject:exportedInterface:remoteObjectInterface:interruptionHandler:invalidationHandler:", a3, a4, a5, a6, a7, a8);
}

- (FMXPCServiceDescription)initWithMachServiceName:(id)a3 options:(unint64_t)a4 remoteObjectInterface:(id)a5 interruptionHandler:(id)a6 invalidationHandler:(id)a7
{
  return (FMXPCServiceDescription *)-[FMXPCServiceDescription initInternalWithMachServiceName:options:exportedObject:exportedInterface:remoteObjectInterface:interruptionHandler:invalidationHandler:](self, "initInternalWithMachServiceName:options:exportedObject:exportedInterface:remoteObjectInterface:interruptionHandler:invalidationHandler:", a3, a4, 0, 0, a5, a6, a7);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_invalidationHandler, 0);
  objc_storeStrong(&self->_interruptionHandler, 0);
  objc_storeStrong((id *)&self->_remoteObjectInterface, 0);
  objc_storeStrong((id *)&self->_exportedInterface, 0);
  objc_storeStrong((id *)&self->_exportedObject, 0);
  objc_storeStrong((id *)&self->_machService, 0);
}

- (id)initInternalWithMachServiceName:(id)a3 options:(unint64_t)a4 exportedObject:(id)a5 exportedInterface:(id)a6 remoteObjectInterface:(id)a7 interruptionHandler:(id)a8 invalidationHandler:(id)a9
{
  id v16;
  id v17;
  id v18;
  id v19;
  id v20;
  FMXPCServiceDescription *v21;
  FMXPCServiceDescription *v22;
  FMWeakForwardingContainer *v23;
  NSObject *exportedObject;
  uint64_t v25;
  id interruptionHandler;
  uint64_t v27;
  id invalidationHandler;
  id v30;
  objc_super v31;

  v30 = a3;
  v16 = a5;
  v17 = a6;
  v18 = a7;
  v19 = a8;
  v20 = a9;
  v31.receiver = self;
  v31.super_class = (Class)FMXPCServiceDescription;
  v21 = -[FMXPCServiceDescription init](&v31, sel_init);
  v22 = v21;
  if (v21)
  {
    objc_storeStrong((id *)&v21->_machService, a3);
    v22->_options = a4;
    v23 = -[FMWeakForwardingContainer initWithTarget:]([FMWeakForwardingContainer alloc], "initWithTarget:", v16);
    exportedObject = v22->_exportedObject;
    v22->_exportedObject = &v23->super;

    objc_storeStrong((id *)&v22->_exportedInterface, a6);
    objc_storeStrong((id *)&v22->_remoteObjectInterface, a7);
    v25 = MEMORY[0x1AF455734](v19);
    interruptionHandler = v22->_interruptionHandler;
    v22->_interruptionHandler = (id)v25;

    v27 = MEMORY[0x1AF455734](v20);
    invalidationHandler = v22->_invalidationHandler;
    v22->_invalidationHandler = (id)v27;

  }
  return v22;
}

- (NSString)machService
{
  return self->_machService;
}

- (NSXPCInterface)remoteObjectInterface
{
  return self->_remoteObjectInterface;
}

- (unint64_t)options
{
  return self->_options;
}

- (id)invalidationHandler
{
  return self->_invalidationHandler;
}

- (id)interruptionHandler
{
  return self->_interruptionHandler;
}

- (NSObject)exportedObject
{
  return self->_exportedObject;
}

- (NSXPCInterface)exportedInterface
{
  return self->_exportedInterface;
}

- (void)setMachService:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (void)setOptions:(unint64_t)a3
{
  self->_options = a3;
}

- (void)setExportedObject:(id)a3
{
  objc_storeStrong((id *)&self->_exportedObject, a3);
}

- (void)setExportedInterface:(id)a3
{
  objc_storeStrong((id *)&self->_exportedInterface, a3);
}

- (void)setRemoteObjectInterface:(id)a3
{
  objc_storeStrong((id *)&self->_remoteObjectInterface, a3);
}

- (void)setInterruptionHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 48);
}

- (void)setInvalidationHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 56);
}

@end
