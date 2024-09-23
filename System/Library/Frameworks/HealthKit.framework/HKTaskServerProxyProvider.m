@implementation HKTaskServerProxyProvider

- (HKTaskServerProxyProvider)initWithHealthStore:(id)a3 taskIdentifier:(id)a4 exportedObject:(id)a5 taskUUID:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  void *v14;
  void *v15;
  HKTaskServerProxyProvider *v16;

  v10 = a6;
  v11 = a5;
  v12 = a4;
  v13 = a3;
  objc_msgSend(v11, "exportedInterface");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "remoteInterface");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = -[HKTaskServerProxyProvider initWithHealthStore:taskIdentifier:exportedObject:exportedInterface:remoteInterface:taskUUID:](self, "initWithHealthStore:taskIdentifier:exportedObject:exportedInterface:remoteInterface:taskUUID:", v13, v12, v11, v14, v15, v10);

  return v16;
}

- (HKTaskServerProxyProvider)initWithHealthStore:(id)a3 taskIdentifier:(id)a4 exportedObject:(id)a5 exportedInterface:(id)a6 remoteInterface:(id)a7 taskUUID:(id)a8
{
  id v14;
  HKTaskServerProxyProvider *v15;
  uint64_t v16;
  NSUUID *taskUUID;
  NSUUID *v18;
  NSUUID *instanceUUID;
  objc_super v21;

  v14 = a8;
  v21.receiver = self;
  v21.super_class = (Class)HKTaskServerProxyProvider;
  v15 = -[HKProxyProvider initWithSource:serviceIdentifier:exportedObject:exportedInterface:remoteInterface:](&v21, sel_initWithSource_serviceIdentifier_exportedObject_exportedInterface_remoteInterface_, a3, a4, a5, a6, a7);
  if (v15)
  {
    v16 = objc_msgSend(v14, "copy");
    taskUUID = v15->_taskUUID;
    v15->_taskUUID = (NSUUID *)v16;

    v18 = (NSUUID *)objc_alloc_init(MEMORY[0x1E0CB3A28]);
    instanceUUID = v15->_instanceUUID;
    v15->_instanceUUID = v18;

  }
  return v15;
}

- (void)fetchProxyServiceEndpointFromSource:(id)a3 serviceIdentifier:(id)a4 endpointHandler:(id)a5 errorHandler:(id)a6
{
  objc_msgSend(a3, "fetchTaskServerEndpointForIdentifier:pluginURL:taskUUID:instanceUUID:configuration:endpointHandler:errorHandler:", a4, self->_pluginURL, self->_taskUUID, self->_instanceUUID, self->_taskConfiguration, a5, a6);
}

- (id)proxyServiceEndpointFromSource:(id)a3 serviceIdentifier:(id)a4 error:(id *)a5
{
  return (id)objc_msgSend(a3, "taskServerEndpointForIdentifier:pluginURL:taskUUID:instanceUUID:configuration:error:", a4, self->_pluginURL, self->_taskUUID, self->_instanceUUID, self->_taskConfiguration, a5);
}

- (id)debugIdentifier
{
  void *v3;
  void *v4;
  void *v5;

  v3 = (void *)MEMORY[0x1E0CB3940];
  -[HKProxyProvider serviceIdentifier](self, "serviceIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@:%@"), v4, self->_taskUUID);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (NSUUID)taskUUID
{
  return self->_taskUUID;
}

- (NSURL)pluginURL
{
  return self->_pluginURL;
}

- (void)setPluginURL:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 144);
}

- (HKTaskConfiguration)taskConfiguration
{
  return (HKTaskConfiguration *)objc_getProperty(self, a2, 152, 1);
}

- (void)setTaskConfiguration:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 152);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_taskConfiguration, 0);
  objc_storeStrong((id *)&self->_pluginURL, 0);
  objc_storeStrong((id *)&self->_taskUUID, 0);
  objc_storeStrong((id *)&self->_instanceUUID, 0);
}

@end
