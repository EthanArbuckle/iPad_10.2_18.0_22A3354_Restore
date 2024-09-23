@implementation AMSUserNotificationAuthorizationResult

- (AMSUserNotificationAuthorizationResult)initWithCoder:(id)a3
{
  id v4;
  AMSUserNotificationAuthorizationResult *v5;
  uint64_t v6;
  AMSEngagementRequest *request;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)AMSUserNotificationAuthorizationResult;
  v5 = -[AMSUserNotificationAuthorizationResult init](&v9, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("kCodingKeyRequest"));
    v6 = objc_claimAutoreleasedReturnValue();
    request = v5->_request;
    v5->_request = (AMSEngagementRequest *)v6;

    v5->_authorizationStatus = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("kCodingKeyAuthorizationStatus"));
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  void *v4;
  id v5;

  v5 = a3;
  -[AMSUserNotificationAuthorizationResult request](self, "request");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "encodeObject:forKey:", v4, CFSTR("kCodingKeyRequest"));

  objc_msgSend(v5, "encodeInteger:forKey:", -[AMSUserNotificationAuthorizationResult authorizationStatus](self, "authorizationStatus"), CFSTR("kCodingKeyAuthorizationStatus"));
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (int64_t)authorizationStatus
{
  return self->_authorizationStatus;
}

- (void)setAuthorizationStatus:(int64_t)a3
{
  self->_authorizationStatus = a3;
}

- (AMSEngagementRequest)request
{
  return self->_request;
}

- (void)setRequest:(id)a3
{
  objc_storeStrong((id *)&self->_request, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_request, 0);
}

@end
