@implementation AAFMIPAuthenticateResponse

- (AAFMIPAuthenticateResponse)initWithHTTPResponse:(id)a3 data:(id)a4
{
  AAFMIPAuthenticateResponse *v4;
  AAFMIPAuthenticateResponse *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  NSDictionary *tokens;
  void *v11;
  void *v12;
  uint64_t v13;
  NSDictionary *appleAccountInfo;
  objc_super v16;

  v16.receiver = self;
  v16.super_class = (Class)AAFMIPAuthenticateResponse;
  v4 = -[AAResponse initWithHTTPResponse:data:](&v16, sel_initWithHTTPResponse_data_, a3, a4);
  v5 = v4;
  if (v4 && -[NSHTTPURLResponse statusCode](v4->super._httpResponse, "statusCode") == 200)
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
      appleAccountInfo = v5->_appleAccountInfo;
      v5->_appleAccountInfo = (NSDictionary *)v13;

    }
    -[AAResponse setError:](v5, "setError:", 0);
  }
  return v5;
}

- (NSString)fmipWipeToken
{
  return (NSString *)-[NSDictionary objectForKeyedSubscript:](self->_tokens, "objectForKeyedSubscript:", CFSTR("mmeFMIPWipeToken"));
}

- (NSString)fmipUrl
{
  void *v2;
  void *v3;

  -[AAResponse responseDictionary](self, "responseDictionary");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKey:", CFSTR("url"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

- (NSString)fmipDsid
{
  return (NSString *)-[NSDictionary objectForKey:](self->_appleAccountInfo, "objectForKey:", CFSTR("dsid"));
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_appleAccountInfo, 0);
  objc_storeStrong((id *)&self->_tokens, 0);
}

@end
