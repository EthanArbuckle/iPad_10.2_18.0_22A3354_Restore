@implementation AKAuthorizationCredentialStateRequest

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (AKAuthorizationCredentialStateRequest)initWithCoder:(id)a3
{
  id v4;
  AKAuthorizationCredentialStateRequest *v5;
  uint64_t v6;
  NSString *userID;
  uint64_t v8;
  NSString *clientID;
  uint64_t v10;
  NSString *teamID;
  uint64_t v12;
  NSString *altDSID;
  objc_super v15;

  v4 = a3;
  v15.receiver = self;
  v15.super_class = (Class)AKAuthorizationCredentialStateRequest;
  v5 = -[AKAuthorizationCredentialStateRequest init](&v15, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_userID"));
    v6 = objc_claimAutoreleasedReturnValue();
    userID = v5->_userID;
    v5->_userID = (NSString *)v6;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_clientID"));
    v8 = objc_claimAutoreleasedReturnValue();
    clientID = v5->_clientID;
    v5->_clientID = (NSString *)v8;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_teamID"));
    v10 = objc_claimAutoreleasedReturnValue();
    teamID = v5->_teamID;
    v5->_teamID = (NSString *)v10;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_altDSID"));
    v12 = objc_claimAutoreleasedReturnValue();
    altDSID = v5->_altDSID;
    v5->_altDSID = (NSString *)v12;

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  NSString *userID;
  id v5;

  userID = self->_userID;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", userID, CFSTR("_userID"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_clientID, CFSTR("_clientID"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_teamID, CFSTR("_teamID"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_altDSID, CFSTR("_altDSID"));

}

- (NSString)userID
{
  return self->_userID;
}

- (void)setUserID:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (NSString)teamID
{
  return self->_teamID;
}

- (void)setTeamID:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (NSString)clientID
{
  return self->_clientID;
}

- (void)setClientID:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (NSString)altDSID
{
  return self->_altDSID;
}

- (void)setAltDSID:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (BOOL)shouldIgnoreUserID
{
  return self->_shouldIgnoreUserID;
}

- (void)setShouldIgnoreUserID:(BOOL)a3
{
  self->_shouldIgnoreUserID = a3;
}

- (BOOL)shouldIgnoreTeamID
{
  return self->_shouldIgnoreTeamID;
}

- (void)setShouldIgnoreTeamID:(BOOL)a3
{
  self->_shouldIgnoreTeamID = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_altDSID, 0);
  objc_storeStrong((id *)&self->_clientID, 0);
  objc_storeStrong((id *)&self->_teamID, 0);
  objc_storeStrong((id *)&self->_userID, 0);
}

@end
