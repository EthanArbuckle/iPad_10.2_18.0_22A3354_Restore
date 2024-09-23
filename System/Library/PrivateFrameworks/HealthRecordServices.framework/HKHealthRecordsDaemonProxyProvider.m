@implementation HKHealthRecordsDaemonProxyProvider

- (HKHealthRecordsDaemonProxyProvider)initWithConnection:(id)a3 serviceIdentifier:(id)a4 exportedObject:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  HKHealthRecordsDaemonProxyProvider *v13;
  objc_super v15;

  v8 = a5;
  v9 = a4;
  v10 = a3;
  objc_msgSend(v8, "exportedInterface");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "remoteInterface");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v15.receiver = self;
  v15.super_class = (Class)HKHealthRecordsDaemonProxyProvider;
  v13 = -[HKProxyProvider initWithSource:serviceIdentifier:exportedObject:exportedInterface:remoteInterface:](&v15, sel_initWithSource_serviceIdentifier_exportedObject_exportedInterface_remoteInterface_, v10, v9, v8, v11, v12);

  return v13;
}

- (void)fetchProxyServiceEndpointFromSource:(id)a3 serviceIdentifier:(id)a4 endpointHandler:(id)a5 errorHandler:(id)a6
{
  objc_msgSend(a3, "fetchEndpointForServiceIdentifier:endpointHandler:errorHandler:", a4, a5, a6);
}

- (id)proxyServiceEndpointFromSource:(id)a3 serviceIdentifier:(id)a4 error:(id *)a5
{
  return (id)objc_msgSend(a3, "endpointForServiceIdentifier:error:", a4, a5);
}

@end
