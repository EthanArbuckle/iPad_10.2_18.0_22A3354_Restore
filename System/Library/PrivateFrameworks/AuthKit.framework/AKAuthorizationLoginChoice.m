@implementation AKAuthorizationLoginChoice

- (AKAuthorizationLoginChoice)initWithUser:(id)a3 site:(id)a4
{
  id v7;
  id v8;
  AKAuthorizationLoginChoice *v9;
  AKAuthorizationLoginChoice *v10;
  objc_super v12;

  v7 = a3;
  v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)AKAuthorizationLoginChoice;
  v9 = -[AKAuthorizationLoginChoice init](&v12, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_user, a3);
    objc_storeStrong((id *)&v10->_site, a4);
    *(_WORD *)&v10->_appleIDAuth = 0;
  }

  return v10;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (AKAuthorizationLoginChoice)initWithCoder:(id)a3
{
  id v4;
  AKAuthorizationLoginChoice *v5;
  uint64_t v6;
  NSString *user;
  uint64_t v8;
  NSString *site;
  objc_super v11;

  v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)AKAuthorizationLoginChoice;
  v5 = -[AKAuthorizationLoginChoice init](&v11, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_user"));
    v6 = objc_claimAutoreleasedReturnValue();
    user = v5->_user;
    v5->_user = (NSString *)v6;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_site"));
    v8 = objc_claimAutoreleasedReturnValue();
    site = v5->_site;
    v5->_site = (NSString *)v8;

    v5->_appleIDAuth = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("_appleIDAuth"));
    v5->_createAppleID = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("_createAppleID"));
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  NSString *user;
  id v5;

  user = self->_user;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", user, CFSTR("_user"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_site, CFSTR("_site"));
  objc_msgSend(v5, "encodeBool:forKey:", self->_appleIDAuth, CFSTR("_appleIDAuth"));
  objc_msgSend(v5, "encodeBool:forKey:", self->_createAppleID, CFSTR("_createAppleID"));

}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  void *v8;

  v4 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v5 = -[NSString copy](self->_user, "copy");
  v6 = *(void **)(v4 + 16);
  *(_QWORD *)(v4 + 16) = v5;

  v7 = -[NSString copy](self->_site, "copy");
  v8 = *(void **)(v4 + 24);
  *(_QWORD *)(v4 + 24) = v7;

  *(_BYTE *)(v4 + 8) = self->_appleIDAuth;
  *(_BYTE *)(v4 + 9) = self->_createAppleID;
  return (id)v4;
}

- (id)description
{
  const __CFString *v2;

  if (self->_appleIDAuth)
    v2 = CFSTR("YES");
  else
    v2 = CFSTR("NO");
  return (id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("AKAuthorizationLoginChoice:\nUser: %@    Site: %@    AppleIDAuth: %@"), self->_user, self->_site, v2);
}

- (NSString)user
{
  return self->_user;
}

- (void)setUser:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (NSString)site
{
  return self->_site;
}

- (void)setSite:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (BOOL)isAppleIDAuthorization
{
  return self->_appleIDAuth;
}

- (void)setAppleIDAuth:(BOOL)a3
{
  self->_appleIDAuth = a3;
}

- (BOOL)shouldCreateAppleID
{
  return self->_createAppleID;
}

- (void)setCreateAppleID:(BOOL)a3
{
  self->_createAppleID = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_site, 0);
  objc_storeStrong((id *)&self->_user, 0);
}

@end
