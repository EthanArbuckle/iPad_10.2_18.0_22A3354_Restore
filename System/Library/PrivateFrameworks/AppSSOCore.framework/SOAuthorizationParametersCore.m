@implementation SOAuthorizationParametersCore

- (SOAuthorizationParametersCore)init
{
  SOAuthorizationParametersCore *v2;
  SOAuthorizationParametersCore *v3;
  void *v4;
  uint64_t v5;
  NSString *identifier;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)SOAuthorizationParametersCore;
  v2 = -[SOAuthorizationParametersCore init](&v8, sel_init);
  v3 = v2;
  if (v2)
  {
    v2->_useInternalExtensions = 1;
    objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "UUIDString");
    v5 = objc_claimAutoreleasedReturnValue();
    identifier = v3->_identifier;
    v3->_identifier = (NSString *)v5;

    v3->_showOnCoverScreen = 0;
  }
  return v3;
}

- (NSString)identifier
{
  return self->_identifier;
}

- (NSString)operation
{
  return self->_operation;
}

- (void)setOperation:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (NSURL)url
{
  return self->_url;
}

- (void)setUrl:(id)a3
{
  objc_storeStrong((id *)&self->_url, a3);
}

- (NSDictionary)httpHeaders
{
  return self->_httpHeaders;
}

- (void)setHttpHeaders:(id)a3
{
  objc_storeStrong((id *)&self->_httpHeaders, a3);
}

- (NSData)httpBody
{
  return self->_httpBody;
}

- (void)setHttpBody:(id)a3
{
  objc_storeStrong((id *)&self->_httpBody, a3);
}

- (NSData)auditTokenData
{
  return self->_auditTokenData;
}

- (void)setAuditTokenData:(id)a3
{
  objc_storeStrong((id *)&self->_auditTokenData, a3);
}

- (BOOL)useInternalExtensions
{
  return self->_useInternalExtensions;
}

- (void)setUseInternalExtensions:(BOOL)a3
{
  self->_useInternalExtensions = a3;
}

- (int64_t)responseCode
{
  return self->_responseCode;
}

- (void)setResponseCode:(int64_t)a3
{
  self->_responseCode = a3;
}

- (BOOL)isCFNetworkInterception
{
  return self->_cfNetworkInterception;
}

- (void)setCfNetworkInterception:(BOOL)a3
{
  self->_cfNetworkInterception = a3;
}

- (NSString)impersonationBundleIdentifier
{
  return self->_impersonationBundleIdentifier;
}

- (void)setImpersonationBundleIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 72);
}

- (BOOL)canShowOnCoverScreen
{
  return self->_showOnCoverScreen;
}

- (void)setShowOnCoverScreen:(BOOL)a3
{
  self->_showOnCoverScreen = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_impersonationBundleIdentifier, 0);
  objc_storeStrong((id *)&self->_auditTokenData, 0);
  objc_storeStrong((id *)&self->_httpBody, 0);
  objc_storeStrong((id *)&self->_httpHeaders, 0);
  objc_storeStrong((id *)&self->_url, 0);
  objc_storeStrong((id *)&self->_operation, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
}

@end
