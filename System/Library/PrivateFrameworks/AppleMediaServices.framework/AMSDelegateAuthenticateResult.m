@implementation AMSDelegateAuthenticateResult

- (AMSDelegateAuthenticateResult)initWithServerResponse:(id)a3
{
  id v5;
  AMSDelegateAuthenticateResult *v6;
  AMSDelegateAuthenticateResult *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)AMSDelegateAuthenticateResult;
  v6 = -[AMSDelegateAuthenticateResult init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_serverResponse, a3);

  return v7;
}

- (NSString)token
{
  void *v2;
  void *v3;
  id v4;

  -[AMSDelegateAuthenticateResult serverResponse](self, "serverResponse");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKeyedSubscript:", CFSTR("delegateAuthToken"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v4 = v3;
  else
    v4 = 0;

  return (NSString *)v4;
}

- (void)encodeWithCoder:(id)a3
{
  AMSDelegateAuthenticateRequest *request;
  id v5;

  request = self->_request;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", request, CFSTR("rq"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_serverResponse, CFSTR("sr"));

}

- (AMSDelegateAuthenticateResult)initWithCoder:(id)a3
{
  id v4;
  AMSDelegateAuthenticateResult *v5;
  uint64_t v6;
  AMSDelegateAuthenticateRequest *request;
  uint64_t v8;
  uint64_t v9;
  NSDictionary *serverResponse;
  objc_super v12;

  v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)AMSDelegateAuthenticateResult;
  v5 = -[AMSDelegateAuthenticateResult init](&v12, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("rq"));
    v6 = objc_claimAutoreleasedReturnValue();
    request = v5->_request;
    v5->_request = (AMSDelegateAuthenticateRequest *)v6;

    v8 = objc_opt_class();
    objc_msgSend(v4, "decodeDictionaryWithKeysOfClass:objectsOfClass:forKey:", v8, objc_opt_class(), CFSTR("sr"));
    v9 = objc_claimAutoreleasedReturnValue();
    serverResponse = v5->_serverResponse;
    v5->_serverResponse = (NSDictionary *)v9;

  }
  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (AMSDelegateAuthenticateRequest)request
{
  return self->_request;
}

- (NSDictionary)serverResponse
{
  return self->_serverResponse;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_serverResponse, 0);
  objc_storeStrong((id *)&self->_request, 0);
}

@end
