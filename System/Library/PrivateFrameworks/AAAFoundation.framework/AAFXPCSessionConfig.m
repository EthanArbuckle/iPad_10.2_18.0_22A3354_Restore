@implementation AAFXPCSessionConfig

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_remoteObjectInterface, 0);
  objc_storeStrong((id *)&self->_exportedProtocol, 0);
  objc_storeStrong((id *)&self->_remoteProtocol, 0);
  objc_storeStrong((id *)&self->_serviceName, 0);
}

- (AAFXPCSessionConfig)initWithServiceName:(id)a3 remoteProtocol:(id)a4 options:(unint64_t)a5
{
  id v9;
  id v10;
  AAFXPCSessionConfig *v11;
  AAFXPCSessionConfig *v12;
  objc_super v14;

  v9 = a3;
  v10 = a4;
  v14.receiver = self;
  v14.super_class = (Class)AAFXPCSessionConfig;
  v11 = -[AAFXPCSessionConfig init](&v14, sel_init);
  v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_serviceName, a3);
    v12->_options = a5;
    objc_storeStrong((id *)&v12->_remoteProtocol, a4);
  }

  return v12;
}

- (NSString)serviceName
{
  return self->_serviceName;
}

- (Protocol)remoteProtocol
{
  return self->_remoteProtocol;
}

- (unint64_t)options
{
  return self->_options;
}

- (Protocol)exportedProtocol
{
  return self->_exportedProtocol;
}

- (AAFXPCSessionConfig)initWithServiceName:(id)a3 remoteProtocol:(id)a4 exportedProtocol:(id)a5 options:(unint64_t)a6
{
  id v11;
  AAFXPCSessionConfig *v12;
  AAFXPCSessionConfig *v13;

  v11 = a5;
  v12 = -[AAFXPCSessionConfig initWithServiceName:remoteProtocol:options:](self, "initWithServiceName:remoteProtocol:options:", a3, a4, a6);
  v13 = v12;
  if (v12)
    objc_storeStrong((id *)&v12->_exportedProtocol, a5);

  return v13;
}

- (void)setServiceName:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (void)setOptions:(unint64_t)a3
{
  self->_options = a3;
}

- (void)setRemoteProtocol:(id)a3
{
  objc_storeStrong((id *)&self->_remoteProtocol, a3);
}

- (void)setExportedProtocol:(id)a3
{
  objc_storeStrong((id *)&self->_exportedProtocol, a3);
}

- (NSXPCInterface)remoteObjectInterface
{
  return self->_remoteObjectInterface;
}

- (void)setRemoteObjectInterface:(id)a3
{
  objc_storeStrong((id *)&self->_remoteObjectInterface, a3);
}

@end
