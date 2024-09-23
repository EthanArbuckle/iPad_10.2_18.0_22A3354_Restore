@implementation MRMediaUserState

- (id)copyWithZone:(_NSZone *)a3
{
  MRMediaUserState *v4;
  void *v5;
  void *v6;
  void *v7;

  v4 = objc_alloc_init(MRMediaUserState);
  -[MRMediaUserState identifier](self, "identifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[MRMediaUserState setIdentifier:](v4, "setIdentifier:", v5);

  -[MRMediaUserState setIsMinor:](v4, "setIsMinor:", -[MRMediaUserState isMinor](self, "isMinor"));
  -[MRMediaUserState setIsFullSubscriber:](v4, "setIsFullSubscriber:", -[MRMediaUserState isFullSubscriber](self, "isFullSubscriber"));
  -[MRMediaUserState setHasAcceptedPrivacyAcknowledgement:](v4, "setHasAcceptedPrivacyAcknowledgement:", -[MRMediaUserState hasAcceptedPrivacyAcknowledgement](self, "hasAcceptedPrivacyAcknowledgement"));
  -[MRMediaUserState setHasAcceptedDisplayNameAcknowledgement:](v4, "setHasAcceptedDisplayNameAcknowledgement:", -[MRMediaUserState hasAcceptedDisplayNameAcknowledgement](self, "hasAcceptedDisplayNameAcknowledgement"));
  -[MRMediaUserState setIdentitySupportsCollaboration:](v4, "setIdentitySupportsCollaboration:", -[MRMediaUserState identitySupportsCollaboration](self, "identitySupportsCollaboration"));
  -[MRMediaUserState setGroupSessionsSupportedForAccountRegion:](v4, "setGroupSessionsSupportedForAccountRegion:", -[MRMediaUserState groupSessionsSupportedForAccountRegion](self, "groupSessionsSupportedForAccountRegion"));
  -[MRMediaUserState storefrontCountryCode](self, "storefrontCountryCode");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[MRMediaUserState setStorefrontCountryCode:](v4, "setStorefrontCountryCode:", v6);

  -[MRMediaUserState userIdentity](self, "userIdentity");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[MRMediaUserState setUserIdentity:](v4, "setUserIdentity:", v7);

  return v4;
}

- (MRUserIdentity)userIdentity
{
  return self->_userIdentity;
}

- (NSString)storefrontCountryCode
{
  return self->_storefrontCountryCode;
}

- (void)setUserIdentity:(id)a3
{
  objc_storeStrong((id *)&self->_userIdentity, a3);
}

- (void)setStorefrontCountryCode:(id)a3
{
  objc_storeStrong((id *)&self->_storefrontCountryCode, a3);
}

- (void)setIsMinor:(BOOL)a3
{
  self->_isMinor = a3;
}

- (void)setIsFullSubscriber:(BOOL)a3
{
  self->_isFullSubscriber = a3;
}

- (void)setIdentitySupportsCollaboration:(BOOL)a3
{
  self->_identitySupportsCollaboration = a3;
}

- (void)setIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_identifier, a3);
}

- (void)setHasAcceptedPrivacyAcknowledgement:(BOOL)a3
{
  self->_hasAcceptedPrivacyAcknowledgement = a3;
}

- (void)setHasAcceptedDisplayNameAcknowledgement:(BOOL)a3
{
  self->_hasAcceptedDisplayNameAcknowledgement = a3;
}

- (void)setGroupSessionsSupportedForAccountRegion:(BOOL)a3
{
  self->_groupSessionsSupportedForAccountRegion = a3;
}

- (BOOL)isMinor
{
  return self->_isMinor;
}

- (BOOL)isFullSubscriber
{
  return self->_isFullSubscriber;
}

- (BOOL)identitySupportsCollaboration
{
  return self->_identitySupportsCollaboration;
}

- (NSString)identifier
{
  return self->_identifier;
}

- (BOOL)hasAcceptedPrivacyAcknowledgement
{
  return self->_hasAcceptedPrivacyAcknowledgement;
}

- (BOOL)hasAcceptedDisplayNameAcknowledgement
{
  return self->_hasAcceptedDisplayNameAcknowledgement;
}

- (BOOL)groupSessionsSupportedForAccountRegion
{
  return self->_groupSessionsSupportedForAccountRegion;
}

- (MRMediaUserState)initWithCoder:(id)a3
{
  id v4;
  MRMediaUserState *v5;
  uint64_t v6;
  NSString *identifier;
  uint64_t v8;
  NSString *storefrontCountryCode;
  uint64_t v10;
  MRUserIdentity *userIdentity;
  objc_super v13;

  v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)MRMediaUserState;
  v5 = -[MRMediaUserState init](&v13, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("id"));
    v6 = objc_claimAutoreleasedReturnValue();
    identifier = v5->_identifier;
    v5->_identifier = (NSString *)v6;

    v5->_isMinor = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("min"));
    v5->_isFullSubscriber = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("sub"));
    v5->_hasAcceptedPrivacyAcknowledgement = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("prv"));
    v5->_hasAcceptedDisplayNameAcknowledgement = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("dsn"));
    v5->_identitySupportsCollaboration = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("col"));
    v5->_groupSessionsSupportedForAccountRegion = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("srg"));
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("stf"));
    v8 = objc_claimAutoreleasedReturnValue();
    storefrontCountryCode = v5->_storefrontCountryCode;
    v5->_storefrontCountryCode = (NSString *)v8;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("usr"));
    v10 = objc_claimAutoreleasedReturnValue();
    userIdentity = v5->_userIdentity;
    v5->_userIdentity = (MRUserIdentity *)v10;

  }
  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_userIdentity, 0);
  objc_storeStrong((id *)&self->_storefrontCountryCode, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;

  v4 = a3;
  -[MRMediaUserState identifier](self, "identifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("id"));

  objc_msgSend(v4, "encodeBool:forKey:", -[MRMediaUserState isMinor](self, "isMinor"), CFSTR("min"));
  objc_msgSend(v4, "encodeBool:forKey:", -[MRMediaUserState isFullSubscriber](self, "isFullSubscriber"), CFSTR("sub"));
  objc_msgSend(v4, "encodeBool:forKey:", -[MRMediaUserState hasAcceptedPrivacyAcknowledgement](self, "hasAcceptedPrivacyAcknowledgement"), CFSTR("prv"));
  objc_msgSend(v4, "encodeBool:forKey:", -[MRMediaUserState hasAcceptedDisplayNameAcknowledgement](self, "hasAcceptedDisplayNameAcknowledgement"), CFSTR("dsn"));
  objc_msgSend(v4, "encodeBool:forKey:", -[MRMediaUserState identitySupportsCollaboration](self, "identitySupportsCollaboration"), CFSTR("col"));
  objc_msgSend(v4, "encodeBool:forKey:", -[MRMediaUserState groupSessionsSupportedForAccountRegion](self, "groupSessionsSupportedForAccountRegion"), CFSTR("srg"));
  -[MRMediaUserState storefrontCountryCode](self, "storefrontCountryCode");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v6, CFSTR("stf"));

  -[MRMediaUserState userIdentity](self, "userIdentity");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v7, CFSTR("usr"));

}

- (BOOL)isEqual:(id)a3
{
  MRMediaUserState *v4;
  MRMediaUserState *v5;
  MRMediaUserState *v6;
  id v7;
  id v8;
  int v9;
  char v10;
  _BOOL4 v11;
  _BOOL4 v12;
  _BOOL4 v13;
  _BOOL4 v14;
  _BOOL4 v15;
  _BOOL4 v16;
  id v18;
  id v19;
  int v20;
  void *v21;
  void *v22;

  v4 = (MRMediaUserState *)a3;
  v5 = v4;
  if (v4)
  {
    if (self == v4)
    {
      v10 = 1;
      goto LABEL_18;
    }
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v6 = v5;
      -[MRMediaUserState identifier](self, "identifier");
      v7 = (id)objc_claimAutoreleasedReturnValue();
      -[MRMediaUserState identifier](v6, "identifier");
      v8 = (id)objc_claimAutoreleasedReturnValue();
      if (v7 == v8)
      {

      }
      else
      {
        v9 = objc_msgSend(v7, "isEqual:", v8);

        if (!v9)
        {
LABEL_16:
          v10 = 0;
LABEL_17:

          goto LABEL_18;
        }
      }
      v11 = -[MRMediaUserState isMinor](self, "isMinor");
      if (v11 != -[MRMediaUserState isMinor](v6, "isMinor"))
        goto LABEL_16;
      v12 = -[MRMediaUserState isFullSubscriber](self, "isFullSubscriber");
      if (v12 != -[MRMediaUserState isFullSubscriber](v6, "isFullSubscriber"))
        goto LABEL_16;
      v13 = -[MRMediaUserState hasAcceptedPrivacyAcknowledgement](self, "hasAcceptedPrivacyAcknowledgement");
      if (v13 != -[MRMediaUserState hasAcceptedPrivacyAcknowledgement](v6, "hasAcceptedPrivacyAcknowledgement"))
        goto LABEL_16;
      v14 = -[MRMediaUserState hasAcceptedDisplayNameAcknowledgement](self, "hasAcceptedDisplayNameAcknowledgement");
      if (v14 != -[MRMediaUserState hasAcceptedDisplayNameAcknowledgement](v6, "hasAcceptedDisplayNameAcknowledgement"))
        goto LABEL_16;
      v15 = -[MRMediaUserState identitySupportsCollaboration](self, "identitySupportsCollaboration");
      if (v15 != -[MRMediaUserState identitySupportsCollaboration](v6, "identitySupportsCollaboration"))
        goto LABEL_16;
      v16 = -[MRMediaUserState groupSessionsSupportedForAccountRegion](self, "groupSessionsSupportedForAccountRegion");
      if (v16 != -[MRMediaUserState groupSessionsSupportedForAccountRegion](v6, "groupSessionsSupportedForAccountRegion"))goto LABEL_16;
      -[MRMediaUserState storefrontCountryCode](self, "storefrontCountryCode");
      v18 = (id)objc_claimAutoreleasedReturnValue();
      -[MRMediaUserState storefrontCountryCode](v6, "storefrontCountryCode");
      v19 = (id)objc_claimAutoreleasedReturnValue();
      if (v18 == v19)
      {

      }
      else
      {
        v20 = objc_msgSend(v18, "isEqual:", v19);

        if (!v20)
        {
          v10 = 0;
LABEL_27:

          goto LABEL_17;
        }
      }
      -[MRMediaUserState userIdentity](self, "userIdentity");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      -[MRMediaUserState userIdentity](v6, "userIdentity");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      if (v21 == v22)
        v10 = 1;
      else
        v10 = objc_msgSend(v21, "isEqual:", v22);

      goto LABEL_27;
    }
  }
  v10 = 0;
LABEL_18:

  return v10;
}

- (unint64_t)hash
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  void *v13;
  unint64_t v14;

  -[MRMediaUserState identifier](self, "identifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "hash");
  v5 = v4 ^ -[MRMediaUserState isMinor](self, "isMinor");
  v6 = -[MRMediaUserState isFullSubscriber](self, "isFullSubscriber");
  v7 = v5 ^ v6 ^ -[MRMediaUserState hasAcceptedPrivacyAcknowledgement](self, "hasAcceptedPrivacyAcknowledgement");
  v8 = -[MRMediaUserState hasAcceptedDisplayNameAcknowledgement](self, "hasAcceptedDisplayNameAcknowledgement");
  v9 = v8 ^ -[MRMediaUserState identitySupportsCollaboration](self, "identitySupportsCollaboration");
  v10 = v7 ^ v9 ^ -[MRMediaUserState groupSessionsSupportedForAccountRegion](self, "groupSessionsSupportedForAccountRegion");
  -[MRMediaUserState storefrontCountryCode](self, "storefrontCountryCode");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "hash");
  -[MRMediaUserState userIdentity](self, "userIdentity");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = v10 ^ v12 ^ objc_msgSend(v13, "hash");

  return v14;
}

- (id)description
{
  void *v3;
  objc_class *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  v3 = (void *)MEMORY[0x1E0CB37A0];
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@: "), v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  -[MRMediaUserState identifier](self, "identifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "appendFormat:", CFSTR("id=%@"), v7);

  objc_msgSend(v6, "appendFormat:", CFSTR(", min=%d"), -[MRMediaUserState isMinor](self, "isMinor"));
  objc_msgSend(v6, "appendFormat:", CFSTR(", fullSub=%d"), -[MRMediaUserState isFullSubscriber](self, "isFullSubscriber"));
  objc_msgSend(v6, "appendFormat:", CFSTR(", privacyAck=%d"), -[MRMediaUserState hasAcceptedPrivacyAcknowledgement](self, "hasAcceptedPrivacyAcknowledgement"));
  objc_msgSend(v6, "appendFormat:", CFSTR(", displayNameAck=%d"), -[MRMediaUserState hasAcceptedDisplayNameAcknowledgement](self, "hasAcceptedDisplayNameAcknowledgement"));
  objc_msgSend(v6, "appendFormat:", CFSTR(", supportsCollab=%d"), -[MRMediaUserState identitySupportsCollaboration](self, "identitySupportsCollaboration"));
  objc_msgSend(v6, "appendFormat:", CFSTR(", supportedRegion=%d"), -[MRMediaUserState groupSessionsSupportedForAccountRegion](self, "groupSessionsSupportedForAccountRegion"));
  -[MRMediaUserState storefrontCountryCode](self, "storefrontCountryCode");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "appendFormat:", CFSTR(", storefront=%@"), v8);

  -[MRMediaUserState userIdentity](self, "userIdentity");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "appendFormat:", CFSTR(", userIdentity=%@"), v9);

  objc_msgSend(v6, "appendString:", CFSTR(">"));
  return v6;
}

@end
