@implementation AAAuthenticationResponse

- (AAAuthenticationResponse)initWithHTTPResponse:(id)a3 data:(id)a4
{
  AAAuthenticationResponse *v4;
  AAAuthenticationResponse *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  NSDictionary *tokens;
  void *v11;
  void *v12;
  uint64_t v13;
  NSDictionary *appleAccount;
  objc_super v16;

  v16.receiver = self;
  v16.super_class = (Class)AAAuthenticationResponse;
  v4 = -[AAResponse initWithHTTPResponse:data:](&v16, sel_initWithHTTPResponse_data_, a3, a4);
  v5 = v4;
  if (v4
    && (-[NSHTTPURLResponse statusCode](v4->super._httpResponse, "statusCode") == 200
     || -[NSHTTPURLResponse statusCode](v5->super._httpResponse, "statusCode") == 409))
  {
    -[AAResponse responseDictionary](v5, "responseDictionary");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (v6)
    {
      -[AAResponse responseDictionary](v5, "responseDictionary");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "objectForKey:", CFSTR("tokens"));
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = objc_msgSend(v8, "copy");
      tokens = v5->_tokens;
      v5->_tokens = (NSDictionary *)v9;

      -[AAResponse responseDictionary](v5, "responseDictionary");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "objectForKey:", CFSTR("appleAccountInfo"));
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = objc_msgSend(v12, "copy");
      appleAccount = v5->_appleAccount;
      v5->_appleAccount = (NSDictionary *)v13;

    }
  }
  return v5;
}

- (NSString)fmfToken
{
  return (NSString *)-[NSDictionary objectForKey:](self->_tokens, "objectForKey:", CFSTR("mmeFMFToken"));
}

- (NSString)fmfAppToken
{
  return (NSString *)-[NSDictionary objectForKey:](self->_tokens, "objectForKey:", CFSTR("mmeFMFAppToken"));
}

- (NSString)fmipToken
{
  return (NSString *)-[NSDictionary objectForKey:](self->_tokens, "objectForKey:", CFSTR("mmeFMIPToken"));
}

- (NSString)authToken
{
  return (NSString *)-[NSDictionary objectForKey:](self->_tokens, "objectForKey:", CFSTR("mmeAuthToken"));
}

- (NSString)mapsToken
{
  return (NSString *)-[NSDictionary objectForKey:](self->_tokens, "objectForKey:", CFSTR("mapsToken"));
}

- (NSString)cloudKitToken
{
  return (NSString *)-[NSDictionary objectForKey:](self->_tokens, "objectForKey:", CFSTR("cloudKitToken"));
}

- (NSString)fmipLostModeToken
{
  return (NSString *)-[NSDictionary objectForKey:](self->_tokens, "objectForKey:", CFSTR("lostModeExitAuthToken"));
}

- (NSString)mdmServerToken
{
  return (NSString *)-[NSDictionary objectForKey:](self->_tokens, "objectForKey:", CFSTR("mdmServerToken"));
}

- (NSString)personID
{
  void *v3;

  -[NSDictionary objectForKey:](self->_appleAccount, "objectForKey:", CFSTR("dsid"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v3)
  {
    -[NSDictionary objectForKey:](self->_appleAccount, "objectForKey:", CFSTR("dsPrsID"));
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return (NSString *)v3;
}

- (NSString)altDSID
{
  return (NSString *)-[NSDictionary objectForKey:](self->_appleAccount, "objectForKey:", CFSTR("aDsID"));
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_appleAccount, 0);
  objc_storeStrong((id *)&self->_tokens, 0);
}

@end
