@implementation FPXServiceEndpointFactory

- (FPXServiceEndpointFactory)initWithServiceSources:(id)a3 domainContext:(id)a4
{
  id v6;
  id v7;
  FPXServiceEndpointFactory *v8;
  uint64_t v9;
  NSDictionary *serviceSources;
  objc_super v12;

  v6 = a3;
  v7 = a4;
  v12.receiver = self;
  v12.super_class = (Class)FPXServiceEndpointFactory;
  v8 = -[FPXServiceEndpointFactory init](&v12, sel_init);
  if (v8)
  {
    v9 = objc_msgSend(v6, "copy");
    serviceSources = v8->_serviceSources;
    v8->_serviceSources = (NSDictionary *)v9;

    objc_storeStrong((id *)&v8->_domainContext, a4);
  }

  return v8;
}

- (void)getListenerEndpointForServiceName:(id)a3 completionHandler:(id)a4
{
  void (**v6)(id, void *, void *);
  void *v7;
  void *v8;
  id v9;
  void *v10;
  id v11;

  v6 = (void (**)(id, void *, void *))a4;
  -[NSDictionary objectForKeyedSubscript:](self->_serviceSources, "objectForKeyedSubscript:", a3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = 0;
  objc_msgSend(v7, "makeListenerEndpointAndReturnError:", &v11);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v11;

  if (v9)
  {
    -[FPXDomainContext internalErrorFromVendorError:callerDescription:](self->_domainContext, "internalErrorFromVendorError:callerDescription:", v9, CFSTR("getListenerEndpointForServiceName"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v10 = 0;
  }
  v6[2](v6, v8, v10);

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_domainContext, 0);
  objc_storeStrong((id *)&self->_serviceSources, 0);
}

@end
