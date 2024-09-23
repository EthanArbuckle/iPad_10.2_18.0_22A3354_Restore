@implementation FASharedServicesRequest

- (FASharedServicesRequest)initWithAppleAccount:(id)a3 urlString:(id)a4
{
  id v7;
  FASharedServicesRequest *v8;
  FASharedServicesRequest *v9;
  uint64_t v10;
  FARequestConfigurator *requestConfigurator;
  objc_super v13;

  v7 = a3;
  v13.receiver = self;
  v13.super_class = (Class)FASharedServicesRequest;
  v8 = -[AARequest initWithURLString:](&v13, sel_initWithURLString_, a4);
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_appleAccount, a3);
    v10 = objc_msgSend(objc_alloc(MEMORY[0x24BE30AE0]), "initWithAccount:", v9->_appleAccount);
    requestConfigurator = v9->_requestConfigurator;
    v9->_requestConfigurator = (FARequestConfigurator *)v10;

  }
  return v9;
}

- (id)urlRequest
{
  void *v3;
  void *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)FASharedServicesRequest;
  -[AARequest urlRequest](&v6, sel_urlRequest);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_msgSend(v3, "mutableCopy");

  objc_msgSend(v4, "setHTTPMethod:", CFSTR("POST"));
  -[FARequestConfigurator setAttachSetupHeader:](self->_requestConfigurator, "setAttachSetupHeader:", 0);
  -[FARequestConfigurator addFresnoHeadersToRequest:](self->_requestConfigurator, "addFresnoHeadersToRequest:", v4);
  -[FARequestConfigurator addFresnoPayloadToRequest:additionalPayload:](self->_requestConfigurator, "addFresnoPayloadToRequest:additionalPayload:", v4, 0);
  return v4;
}

+ (Class)responseClass
{
  return (Class)objc_opt_class();
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_appleAccount, 0);
  objc_storeStrong((id *)&self->_requestConfigurator, 0);
}

@end
