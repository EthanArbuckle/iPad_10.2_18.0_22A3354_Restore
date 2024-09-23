@implementation SOAuthorizationCredential

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (SOAuthorizationCredential)initWithAuthorizationResult:(id)a3
{
  id v4;
  SOAuthorizationCredential *v5;
  uint64_t v6;
  NSDictionary *httpAuthorizationHeaders;
  uint64_t v8;
  NSHTTPURLResponse *httpResponse;
  uint64_t v10;
  NSData *httpBody;
  objc_super v13;

  v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)SOAuthorizationCredential;
  v5 = -[SOAuthorizationCredential init](&v13, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "httpAuthorizationHeaders");
    v6 = objc_claimAutoreleasedReturnValue();
    httpAuthorizationHeaders = v5->_httpAuthorizationHeaders;
    v5->_httpAuthorizationHeaders = (NSDictionary *)v6;

    objc_msgSend(v4, "httpResponse");
    v8 = objc_claimAutoreleasedReturnValue();
    httpResponse = v5->_httpResponse;
    v5->_httpResponse = (NSHTTPURLResponse *)v8;

    objc_msgSend(v4, "httpBody");
    v10 = objc_claimAutoreleasedReturnValue();
    httpBody = v5->_httpBody;
    v5->_httpBody = (NSData *)v10;

  }
  return v5;
}

- (SOAuthorizationCredential)initWithCoder:(id)a3
{
  id v4;
  SOAuthorizationCredential *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  uint64_t v10;
  NSDictionary *httpAuthorizationHeaders;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  NSHTTPURLResponse *httpResponse;
  uint64_t v16;
  void *v17;
  uint64_t v18;
  NSData *httpBody;
  void *v20;
  uint64_t v21;
  void *v22;
  void *v23;
  uint64_t v24;
  NSArray *secKeyProxyEndpoints;
  objc_super v27;

  v4 = a3;
  v27.receiver = self;
  v27.super_class = (Class)SOAuthorizationCredential;
  v5 = -[SOAuthorizationCredential init](&v27, sel_init);
  if (v5)
  {
    v6 = (void *)MEMORY[0x24BDBCF20];
    v7 = objc_opt_class();
    objc_msgSend(v6, "setWithObjects:", v7, objc_opt_class(), 0);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    NSStringFromSelector(sel_httpAuthorizationHeaders);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v8, v9);
    v10 = objc_claimAutoreleasedReturnValue();
    httpAuthorizationHeaders = v5->_httpAuthorizationHeaders;
    v5->_httpAuthorizationHeaders = (NSDictionary *)v10;

    v12 = objc_opt_class();
    NSStringFromSelector(sel_httpResponse);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", v12, v13);
    v14 = objc_claimAutoreleasedReturnValue();
    httpResponse = v5->_httpResponse;
    v5->_httpResponse = (NSHTTPURLResponse *)v14;

    v16 = objc_opt_class();
    NSStringFromSelector(sel_httpBody);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", v16, v17);
    v18 = objc_claimAutoreleasedReturnValue();
    httpBody = v5->_httpBody;
    v5->_httpBody = (NSData *)v18;

    v20 = (void *)MEMORY[0x24BDBCF20];
    v21 = objc_opt_class();
    objc_msgSend(v20, "setWithObjects:", v21, objc_opt_class(), 0);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    NSStringFromSelector(sel_secKeyProxyEndpoints);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v22, v23);
    v24 = objc_claimAutoreleasedReturnValue();
    secKeyProxyEndpoints = v5->_secKeyProxyEndpoints;
    v5->_secKeyProxyEndpoints = (NSArray *)v24;

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  NSDictionary *httpAuthorizationHeaders;
  id v5;
  void *v6;
  NSHTTPURLResponse *httpResponse;
  void *v8;
  NSData *httpBody;
  void *v10;
  NSArray *secKeyProxyEndpoints;
  id v12;

  httpAuthorizationHeaders = self->_httpAuthorizationHeaders;
  v5 = a3;
  NSStringFromSelector(sel_httpAuthorizationHeaders);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "encodeObject:forKey:", httpAuthorizationHeaders, v6);

  httpResponse = self->_httpResponse;
  NSStringFromSelector(sel_httpResponse);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "encodeObject:forKey:", httpResponse, v8);

  httpBody = self->_httpBody;
  NSStringFromSelector(sel_httpBody);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "encodeObject:forKey:", httpBody, v10);

  secKeyProxyEndpoints = self->_secKeyProxyEndpoints;
  NSStringFromSelector(sel_secKeyProxyEndpoints);
  v12 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "encodeObject:forKey:", secKeyProxyEndpoints, v12);

}

- (NSDictionary)httpAuthorizationHeaders
{
  return self->_httpAuthorizationHeaders;
}

- (void)setHttpAuthorizationHeaders:(id)a3
{
  objc_storeStrong((id *)&self->_httpAuthorizationHeaders, a3);
}

- (NSHTTPURLResponse)httpResponse
{
  return self->_httpResponse;
}

- (void)setHttpResponse:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (NSData)httpBody
{
  return self->_httpBody;
}

- (void)setHttpBody:(id)a3
{
  objc_storeStrong((id *)&self->_httpBody, a3);
}

- (NSArray)secKeyProxyEndpoints
{
  return self->_secKeyProxyEndpoints;
}

- (void)setSecKeyProxyEndpoints:(id)a3
{
  objc_storeStrong((id *)&self->_secKeyProxyEndpoints, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_secKeyProxyEndpoints, 0);
  objc_storeStrong((id *)&self->_httpBody, 0);
  objc_storeStrong((id *)&self->_httpResponse, 0);
  objc_storeStrong((id *)&self->_httpAuthorizationHeaders, 0);
}

@end
