@implementation CTCarrierSpaceAuthInfo

- (CTCarrierSpaceAuthInfo)init
{
  CTCarrierSpaceAuthInfo *v2;
  CTCarrierSpaceAuthInfo *v3;
  NSData *accessToken;
  NSData *refreshToken;
  NSDate *expiresAt;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)CTCarrierSpaceAuthInfo;
  v2 = -[CTCarrierSpaceAuthInfo init](&v8, sel_init);
  v3 = v2;
  if (v2)
  {
    accessToken = v2->_accessToken;
    v2->_accessToken = 0;

    refreshToken = v3->_refreshToken;
    v3->_refreshToken = 0;

    expiresAt = v3->_expiresAt;
    v3->_expiresAt = 0;

  }
  return v3;
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  objc_msgSend(MEMORY[0x24BDD16A8], "stringWithFormat:", CFSTR("<%@ %p"), objc_opt_class(), self);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[CTCarrierSpaceAuthInfo accessToken](self, "accessToken");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR(" accessToken=%@"), v4);

  -[CTCarrierSpaceAuthInfo refreshToken](self, "refreshToken");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR(" refreshToken=%@"), v5);

  -[CTCarrierSpaceAuthInfo expiresAt](self, "expiresAt");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR(" expiresAt=%@"), v6);

  objc_msgSend(v3, "appendFormat:", CFSTR(" shouldCache=%d"), -[CTCarrierSpaceAuthInfo shouldCache](self, "shouldCache"));
  objc_msgSend(v3, "appendString:", CFSTR(">"));
  return v3;
}

- (void)encodeWithCoder:(id)a3
{
  NSData *accessToken;
  id v5;

  accessToken = self->_accessToken;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", accessToken, CFSTR("accessToken"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_refreshToken, CFSTR("refreshToken"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_expiresAt, CFSTR("expiresAt"));
  objc_msgSend(v5, "encodeBool:forKey:", self->_shouldCache, CFSTR("shouldCache"));

}

- (CTCarrierSpaceAuthInfo)initWithCoder:(id)a3
{
  id v4;
  CTCarrierSpaceAuthInfo *v5;
  uint64_t v6;
  NSData *accessToken;
  uint64_t v8;
  NSData *refreshToken;
  uint64_t v10;
  NSDate *expiresAt;
  objc_super v13;

  v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)CTCarrierSpaceAuthInfo;
  v5 = -[CTCarrierSpaceAuthInfo init](&v13, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("accessToken"));
    v6 = objc_claimAutoreleasedReturnValue();
    accessToken = v5->_accessToken;
    v5->_accessToken = (NSData *)v6;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("refreshToken"));
    v8 = objc_claimAutoreleasedReturnValue();
    refreshToken = v5->_refreshToken;
    v5->_refreshToken = (NSData *)v8;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("expiresAt"));
    v10 = objc_claimAutoreleasedReturnValue();
    expiresAt = v5->_expiresAt;
    v5->_expiresAt = (NSDate *)v10;

    v5->_shouldCache = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("shouldCache"));
  }

  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (NSData)accessToken
{
  return self->_accessToken;
}

- (void)setAccessToken:(id)a3
{
  objc_storeStrong((id *)&self->_accessToken, a3);
}

- (NSData)refreshToken
{
  return self->_refreshToken;
}

- (void)setRefreshToken:(id)a3
{
  objc_storeStrong((id *)&self->_refreshToken, a3);
}

- (NSDate)expiresAt
{
  return self->_expiresAt;
}

- (void)setExpiresAt:(id)a3
{
  objc_storeStrong((id *)&self->_expiresAt, a3);
}

- (BOOL)shouldCache
{
  return self->_shouldCache;
}

- (void)setShouldCache:(BOOL)a3
{
  self->_shouldCache = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_expiresAt, 0);
  objc_storeStrong((id *)&self->_refreshToken, 0);
  objc_storeStrong((id *)&self->_accessToken, 0);
}

@end
