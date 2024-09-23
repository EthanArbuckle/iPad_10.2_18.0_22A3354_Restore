@implementation _CNDRemoteExtensionContext

- (id)hostContext
{
  void *v2;
  void *v3;

  -[_CNDRemoteExtensionContext _auxiliaryConnection](self, "_auxiliaryConnection");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "remoteObjectProxyWithErrorHandler:", &__block_literal_global_4);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (void)renewExpirationDateForDonatedValue:(id)a3 acknowledgementHandler:(id)a4
{
  id v6;
  id v7;
  id v8;

  v6 = a4;
  v7 = a3;
  -[_CNDRemoteExtensionContext requestHandler](self, "requestHandler");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "renewExpirationDateForDonatedValue:acknowledgementHandler:", v7, v6);

}

- (void)redonateAllValuesWithReason:(unint64_t)a3
{
  id v4;

  -[_CNDRemoteExtensionContext requestHandler](self, "requestHandler");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "redonateAllValuesWithReason:", a3);

}

- (CNDonationExtensionRequestHandler)requestHandler
{
  return self->_requestHandler;
}

- (void)setRequestHandler:(id)a3
{
  objc_storeStrong((id *)&self->_requestHandler, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_requestHandler, 0);
}

@end
