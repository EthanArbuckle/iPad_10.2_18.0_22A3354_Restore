@implementation AKCircleRequestContext

- (AKCircleRequestContext)init
{
  AKCircleRequestContext *result;
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)AKCircleRequestContext;
  result = -[AKCircleRequestContext init](&v3, sel_init);
  if (result)
    *(_WORD *)&result->_waitForReply = 257;
  return result;
}

- (AKCircleRequestContext)initWithCoder:(id)a3
{
  id v4;
  AKCircleRequestContext *v5;
  uint64_t v6;
  NSString *identityTokenValue;
  uint64_t v8;
  NSString *heartbeatTokenValue;
  uint64_t v10;
  NSString *pushToken;
  uint64_t v12;
  AKCircleRequestPayload *payload;
  double v14;
  uint64_t v15;
  AKAppleIDAuthenticationContext *authContext;
  objc_super v18;

  v4 = a3;
  v18.receiver = self;
  v18.super_class = (Class)AKCircleRequestContext;
  v5 = -[AKCircleRequestContext init](&v18, sel_init);
  if (v5)
  {
    v5->_waitForReply = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("_waitForReply"));
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_identityTokenValue"));
    v6 = objc_claimAutoreleasedReturnValue();
    identityTokenValue = v5->_identityTokenValue;
    v5->_identityTokenValue = (NSString *)v6;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_heartbeatTokenValue"));
    v8 = objc_claimAutoreleasedReturnValue();
    heartbeatTokenValue = v5->_heartbeatTokenValue;
    v5->_heartbeatTokenValue = (NSString *)v8;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_pushToken"));
    v10 = objc_claimAutoreleasedReturnValue();
    pushToken = v5->_pushToken;
    v5->_pushToken = (NSString *)v10;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_payload"));
    v12 = objc_claimAutoreleasedReturnValue();
    payload = v5->_payload;
    v5->_payload = (AKCircleRequestPayload *)v12;

    objc_msgSend(v4, "decodeDoubleForKey:", CFSTR("_waitForReplyTimeout"));
    v5->_waitForReplyTimeout = v14;
    v5->__notifyOfTimeout = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("__notifyOfTimeout"));
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_authContext"));
    v15 = objc_claimAutoreleasedReturnValue();
    authContext = v5->_authContext;
    v5->_authContext = (AKAppleIDAuthenticationContext *)v15;

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  _BOOL8 waitForReply;
  id v5;

  waitForReply = self->_waitForReply;
  v5 = a3;
  objc_msgSend(v5, "encodeBool:forKey:", waitForReply, CFSTR("_waitForReply"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_identityTokenValue, CFSTR("_identityTokenValue"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_heartbeatTokenValue, CFSTR("_heartbeatTokenValue"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_pushToken, CFSTR("_pushToken"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_payload, CFSTR("_payload"));
  objc_msgSend(v5, "encodeDouble:forKey:", CFSTR("_waitForReplyTimeout"), self->_waitForReplyTimeout);
  objc_msgSend(v5, "encodeBool:forKey:", self->__notifyOfTimeout, CFSTR("__notifyOfTimeout"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_authContext, CFSTR("_authContext"));

}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (AKCircleRequestPayload)payload
{
  return self->_payload;
}

- (void)setPayload:(id)a3
{
  objc_storeStrong((id *)&self->_payload, a3);
}

- (BOOL)waitForReply
{
  return self->_waitForReply;
}

- (void)setWaitForReply:(BOOL)a3
{
  self->_waitForReply = a3;
}

- (double)waitForReplyTimeout
{
  return self->_waitForReplyTimeout;
}

- (void)setWaitForReplyTimeout:(double)a3
{
  self->_waitForReplyTimeout = a3;
}

- (NSString)identityTokenValue
{
  return self->_identityTokenValue;
}

- (void)setIdentityTokenValue:(id)a3
{
  objc_storeStrong((id *)&self->_identityTokenValue, a3);
}

- (NSString)heartbeatTokenValue
{
  return self->_heartbeatTokenValue;
}

- (void)setHeartbeatTokenValue:(id)a3
{
  objc_storeStrong((id *)&self->_heartbeatTokenValue, a3);
}

- (NSString)pushToken
{
  return self->_pushToken;
}

- (void)setPushToken:(id)a3
{
  objc_storeStrong((id *)&self->_pushToken, a3);
}

- (BOOL)_notifyOfTimeout
{
  return self->__notifyOfTimeout;
}

- (void)set_notifyOfTimeout:(BOOL)a3
{
  self->__notifyOfTimeout = a3;
}

- (AKAppleIDAuthenticationContext)authContext
{
  return self->_authContext;
}

- (void)setAuthContext:(id)a3
{
  objc_storeStrong((id *)&self->_authContext, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_authContext, 0);
  objc_storeStrong((id *)&self->_pushToken, 0);
  objc_storeStrong((id *)&self->_heartbeatTokenValue, 0);
  objc_storeStrong((id *)&self->_identityTokenValue, 0);
  objc_storeStrong((id *)&self->_payload, 0);
}

@end
