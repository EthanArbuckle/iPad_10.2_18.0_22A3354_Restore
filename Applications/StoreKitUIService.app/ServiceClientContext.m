@implementation ServiceClientContext

- (ServiceClientContext)initWithConfigurationDictionary:(id)a3
{
  ServiceClientContext *v3;
  ServiceClientContext *v4;
  void *v5;
  void *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)ServiceClientContext;
  v3 = -[ServiceClientContext initWithConfigurationDictionary:](&v8, "initWithConfigurationDictionary:", a3);
  v4 = v3;
  if (v3)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[ServiceClientContext clientInterface](v3, "clientInterface"));
    objc_msgSend(v5, "setClientIdentifier:", CFSTR("StoreKitUIService"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[SUWebViewManager defaultLocalStoragePath](SUWebViewManager, "defaultLocalStoragePath"));
    objc_msgSend(v5, "setLocalStoragePath:", v6);

  }
  return v4;
}

- (void)getDefaultMetricsControllerWithCompletionBlock:(id)a3
{
  id v3;
  objc_super v4;
  _QWORD v5[4];
  ServiceClientContext *v6;
  id v7;

  v5[1] = 3221225472;
  v5[2] = sub_10000E0B0;
  v5[3] = &unk_100049698;
  v6 = self;
  v7 = a3;
  v4.receiver = v6;
  v4.super_class = (Class)ServiceClientContext;
  v5[0] = _NSConcreteStackBlock;
  v3 = v7;
  -[ServiceClientContext getDefaultMetricsControllerWithCompletionBlock:](&v4, "getDefaultMetricsControllerWithCompletionBlock:", v5);

}

- (NSString)hostApplicationIdentifier
{
  return self->_hostApplicationIdentifier;
}

- (void)setHostApplicationIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_hostApplicationIdentifier, 0);
}

@end
