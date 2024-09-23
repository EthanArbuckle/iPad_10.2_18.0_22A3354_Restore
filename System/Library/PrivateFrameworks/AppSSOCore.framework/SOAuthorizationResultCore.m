@implementation SOAuthorizationResultCore

- (SOAuthorizationResultCore)init
{
  SOAuthorizationResultCore *v2;
  uint64_t v3;
  NSArray *privateKeys;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)SOAuthorizationResultCore;
  v2 = -[SOAuthorizationResultCore init](&v6, sel_init);
  if (v2)
  {
    objc_msgSend(MEMORY[0x1E0C99D20], "array");
    v3 = objc_claimAutoreleasedReturnValue();
    privateKeys = v2->_privateKeys;
    v2->_privateKeys = (NSArray *)v3;

  }
  return v2;
}

- (SOAuthorizationResultCore)initWithHTTPAuthorizationHeaders:(id)a3
{
  id v5;
  SOAuthorizationResultCore *v6;
  SOAuthorizationResultCore *v7;
  uint64_t v8;
  NSArray *privateKeys;
  objc_super v11;

  v5 = a3;
  v11.receiver = self;
  v11.super_class = (Class)SOAuthorizationResultCore;
  v6 = -[SOAuthorizationResultCore init](&v11, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_httpAuthorizationHeaders, a3);
    objc_msgSend(MEMORY[0x1E0C99D20], "array");
    v8 = objc_claimAutoreleasedReturnValue();
    privateKeys = v7->_privateKeys;
    v7->_privateKeys = (NSArray *)v8;

  }
  return v7;
}

- (SOAuthorizationResultCore)initWithHTTPResponse:(id)a3 httpBody:(id)a4
{
  id v7;
  id v8;
  SOAuthorizationResultCore *v9;
  SOAuthorizationResultCore *v10;
  uint64_t v11;
  NSArray *privateKeys;
  objc_super v14;

  v7 = a3;
  v8 = a4;
  v14.receiver = self;
  v14.super_class = (Class)SOAuthorizationResultCore;
  v9 = -[SOAuthorizationResultCore init](&v14, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_httpResponse, a3);
    objc_storeStrong((id *)&v10->_httpBody, a4);
    objc_msgSend(MEMORY[0x1E0C99D20], "array");
    v11 = objc_claimAutoreleasedReturnValue();
    privateKeys = v10->_privateKeys;
    v10->_privateKeys = (NSArray *)v11;

  }
  return v10;
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

- (NSArray)privateKeys
{
  return self->_privateKeys;
}

- (void)setPrivateKeys:(id)a3
{
  objc_storeStrong((id *)&self->_privateKeys, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_privateKeys, 0);
  objc_storeStrong((id *)&self->_httpBody, 0);
  objc_storeStrong((id *)&self->_httpResponse, 0);
  objc_storeStrong((id *)&self->_httpAuthorizationHeaders, 0);
}

@end
