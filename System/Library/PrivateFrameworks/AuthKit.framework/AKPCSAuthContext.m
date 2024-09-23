@implementation AKPCSAuthContext

- (AKPCSAuthContext)initWithWebSessionIdentifier:(id)a3 expiryDate:(id)a4 userInfo:(id)a5
{
  id v9;
  id v10;
  id v11;
  AKPCSAuthContext *v12;
  AKPCSAuthContext *v13;
  objc_super v15;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v15.receiver = self;
  v15.super_class = (Class)AKPCSAuthContext;
  v12 = -[AKPCSAuthContext init](&v15, sel_init);
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_webSessionIdentifier, a3);
    objc_storeStrong((id *)&v13->_expiryDate, a4);
    objc_storeStrong((id *)&v13->_userInfo, a5);
  }

  return v13;
}

- (AKPCSAuthContext)initWithWebSessionID:(id)a3 expiryDate:(id)a4 userInfo:(id)a5
{
  id v8;
  id v9;
  void *v10;
  AKPCSAuthContext *v11;

  v8 = a5;
  v9 = a4;
  objc_msgSend(a3, "UUIDString");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = -[AKPCSAuthContext initWithWebSessionIdentifier:expiryDate:userInfo:](self, "initWithWebSessionIdentifier:expiryDate:userInfo:", v10, v9, v8);

  return v11;
}

- (BOOL)isValid
{
  void *v3;

  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(self) = objc_msgSend(v3, "compare:", self->_expiryDate) == -1;

  return (char)self;
}

- (id)description
{
  void *v3;
  objc_class *v4;
  void *v5;
  void *v6;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<<%@> - Web session ID: %@, Expiry: %@, User info: %@>"), v5, self->_webSessionIdentifier, self->_expiryDate, self->_userInfo);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)copyWithZone:(_NSZone *)a3
{
  return -[AKPCSAuthContext initWithWebSessionIdentifier:expiryDate:userInfo:]([AKPCSAuthContext alloc], "initWithWebSessionIdentifier:expiryDate:userInfo:", self->_webSessionIdentifier, self->_expiryDate, self->_userInfo);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  NSString *webSessionIdentifier;
  id v5;

  webSessionIdentifier = self->_webSessionIdentifier;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", webSessionIdentifier, CFSTR("webSessionIdentifier"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_expiryDate, CFSTR("expiryDate"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_userInfo, CFSTR("userInfo"));

}

- (AKPCSAuthContext)initWithCoder:(id)a3
{
  id v4;
  AKPCSAuthContext *v5;
  uint64_t v6;
  NSString *webSessionIdentifier;
  uint64_t v8;
  NSDate *expiryDate;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  NSDictionary *userInfo;

  v4 = a3;
  v5 = -[AKPCSAuthContext init](self, "init");
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("webSessionIdentifier"));
    v6 = objc_claimAutoreleasedReturnValue();
    webSessionIdentifier = v5->_webSessionIdentifier;
    v5->_webSessionIdentifier = (NSString *)v6;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("expiryDate"));
    v8 = objc_claimAutoreleasedReturnValue();
    expiryDate = v5->_expiryDate;
    v5->_expiryDate = (NSDate *)v8;

    v10 = (void *)MEMORY[0x1E0C99E60];
    v11 = objc_opt_class();
    v12 = objc_opt_class();
    objc_msgSend(v10, "setWithObjects:", v11, v12, objc_opt_class(), 0);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v13, CFSTR("userInfo"));
    v14 = objc_claimAutoreleasedReturnValue();
    userInfo = v5->_userInfo;
    v5->_userInfo = (NSDictionary *)v14;

  }
  return v5;
}

- (NSString)webSessionIdentifier
{
  return self->_webSessionIdentifier;
}

- (NSUUID)webSessionID
{
  return self->_webSessionID;
}

- (NSDate)expiryDate
{
  return self->_expiryDate;
}

- (NSDictionary)userInfo
{
  return self->_userInfo;
}

- (void)setUserInfo:(id)a3
{
  objc_storeStrong((id *)&self->_userInfo, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_userInfo, 0);
  objc_storeStrong((id *)&self->_expiryDate, 0);
  objc_storeStrong((id *)&self->_webSessionID, 0);
  objc_storeStrong((id *)&self->_webSessionIdentifier, 0);
}

@end
