@implementation HSGetAuthorizedAccountsTokenRequest

- (HSGetAuthorizedAccountsTokenRequest)initWithDSID:(unint64_t)a3 deviceGUID:(id)a4
{
  id v6;
  HSGetAuthorizedAccountsTokenRequest *v7;
  void *v8;
  objc_super v10;

  v6 = a4;
  v10.receiver = self;
  v10.super_class = (Class)HSGetAuthorizedAccountsTokenRequest;
  v7 = -[HSRequest initWithAction:](&v10, sel_initWithAction_, CFSTR("get-authorized-account-token"));
  if (v7)
  {
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%llu"), a3);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[HSRequest setValue:forArgument:](v7, "setValue:forArgument:", v8, CFSTR("dsid"));

    -[HSRequest setValue:forArgument:](v7, "setValue:forArgument:", v6, CFSTR("device-machine-guid"));
  }

  return v7;
}

- (id)canonicalResponseForResponse:(id)a3
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  +[HSResponse responseWithResponse:](HSGetAuthorizedAccountsTokenResponse, "responseWithResponse:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "responseData");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  +[HSResponseDataParser parseResponseData:](HSResponseDataParser, "parseResponseData:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "objectForKey:", CFSTR("com.apple.itunes.drm-token-data"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setTokenData:", v6);

  return v3;
}

+ (id)requestWithDSID:(unint64_t)a3 deviceGUID:(id)a4
{
  id v6;
  void *v7;

  v6 = a4;
  v7 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithDSID:deviceGUID:", a3, v6);

  return v7;
}

@end
