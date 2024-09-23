@implementation GKPlayerCredential

- (BOOL)isEqual:(id)a3
{
  id v4;
  id v5;
  int64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  char v14;
  BOOL v15;
  void *v17;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v5 = v4;
    v6 = -[GKPlayerCredential environment](self, "environment");
    if (v6 != objc_msgSend(v5, "environment"))
    {
      v15 = 0;
LABEL_15:

      goto LABEL_16;
    }
    -[GKPlayerCredential altDSID](self, "altDSID");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (v7
      || (objc_msgSend(v5, "altDSID"), (v7 = (void *)objc_claimAutoreleasedReturnValue()) != 0)
      || (-[GKPlayerCredential DSID](self, "DSID"), (v7 = (void *)objc_claimAutoreleasedReturnValue()) != 0))
    {

    }
    else
    {
      objc_msgSend(v5, "DSID");
      v17 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v17)
      {
        -[GKPlayerCredential authenticationToken](self, "authenticationToken");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "authenticationToken");
        v12 = objc_claimAutoreleasedReturnValue();
        goto LABEL_10;
      }
    }
    -[GKPlayerCredential altDSID](self, "altDSID");
    v8 = objc_claimAutoreleasedReturnValue();
    if (!v8
      || (v9 = (void *)v8,
          objc_msgSend(v5, "altDSID"),
          v10 = (void *)objc_claimAutoreleasedReturnValue(),
          v10,
          v9,
          !v10))
    {
      -[GKPlayerCredential DSID](self, "DSID");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "DSID");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = objc_msgSend(v11, "isEqual:", v13);
      goto LABEL_14;
    }
    -[GKPlayerCredential altDSID](self, "altDSID");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "altDSID");
    v12 = objc_claimAutoreleasedReturnValue();
LABEL_10:
    v13 = (void *)v12;
    v14 = objc_msgSend(v11, "isEqualToString:", v12);
LABEL_14:
    v15 = v14;

    goto LABEL_15;
  }
  v15 = 0;
LABEL_16:

  return v15;
}

- (unint64_t)hash
{
  void *v2;
  unint64_t v3;

  -[GKPlayerCredential playerInternal](self, "playerInternal");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "hash");

  return v3;
}

- (NSString)scopeAsString
{
  void *v3;
  void *v4;
  unsigned int scope;
  void *v6;
  void *v7;

  objc_msgSend(MEMORY[0x1E0CB37A0], "string");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  scope = self->_scope;
  if ((scope & 2) == 0)
  {
    if ((scope & 8) == 0)
      goto LABEL_3;
LABEL_7:
    objc_msgSend(v4, "appendString:", CFSTR("Active "));
    if ((self->_scope & 4) == 0)
      goto LABEL_5;
    goto LABEL_4;
  }
  objc_msgSend(v3, "appendString:", CFSTR("Authorized "));
  scope = self->_scope;
  if ((scope & 8) != 0)
    goto LABEL_7;
LABEL_3:
  if ((scope & 4) != 0)
LABEL_4:
    objc_msgSend(v4, "appendString:", CFSTR("Primary "));
LABEL_5:
  objc_msgSend(MEMORY[0x1E0CB3500], "whitespaceAndNewlineCharacterSet");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "stringByTrimmingCharactersInSet:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v7;
}

- (id)description
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = objc_opt_class();
  -[GKPlayerCredential accountName](self, "accountName");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[GKPlayerInternal conciseDescription](self->_playerInternal, "conciseDescription");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[GKPlayerCredential scopeAsString](self, "scopeAsString");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@ %p> account:%@ player:(%@) scope:<%@> (%@) environment:%d token:%@ altDSID:%@ DSID:%@"), v4, self, v5, v6, v7, self->_scopeModificationDate, self->_environment, self->_authenticationToken, self->_altDSID, self->_DSID);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

+ (id)secureCodedPropertyKeys
{
  if (secureCodedPropertyKeys_onceToken_13 != -1)
    dispatch_once(&secureCodedPropertyKeys_onceToken_13, &__block_literal_global_50);
  return (id)secureCodedPropertyKeys_sSecureCodedKeys_13;
}

void __45__GKPlayerCredential_secureCodedPropertyKeys__block_invoke()
{
  uint64_t v0;
  void *v1;
  _QWORD v2[8];
  _QWORD v3[9];

  v3[8] = *MEMORY[0x1E0C80C00];
  v2[0] = CFSTR("accountName");
  v3[0] = objc_opt_class();
  v2[1] = CFSTR("authenticationToken");
  v3[1] = objc_opt_class();
  v2[2] = CFSTR("playerInternal");
  v3[2] = objc_opt_class();
  v2[3] = CFSTR("environment");
  v3[3] = objc_opt_class();
  v2[4] = CFSTR("scope");
  v3[4] = objc_opt_class();
  v2[5] = CFSTR("scopeModificationDate");
  v3[5] = objc_opt_class();
  v2[6] = CFSTR("altDSID");
  v3[6] = objc_opt_class();
  v2[7] = CFSTR("DSID");
  v3[7] = objc_opt_class();
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v3, v2, 8);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)secureCodedPropertyKeys_sSecureCodedKeys_13;
  secureCodedPropertyKeys_sSecureCodedKeys_13 = v0;

}

- (GKLocalPlayerInternal)playerInternal
{
  return (GKLocalPlayerInternal *)objc_getProperty(self, a2, 24, 1);
}

- (void)setPlayerInternal:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 24);
}

- (NSString)accountName
{
  return (NSString *)objc_getProperty(self, a2, 8, 1);
}

- (void)setAccountName:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 8);
}

- (NSString)authenticationToken
{
  return (NSString *)objc_getProperty(self, a2, 16, 1);
}

- (void)setAuthenticationToken:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 16);
}

- (int64_t)environment
{
  return self->_environment;
}

- (void)setEnvironment:(int64_t)a3
{
  self->_environment = a3;
}

- (unsigned)scope
{
  return self->_scope;
}

- (void)setScope:(unsigned int)a3
{
  self->_scope = a3;
}

- (NSDate)scopeModificationDate
{
  return (NSDate *)objc_getProperty(self, a2, 48, 1);
}

- (void)setScopeModificationDate:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 48);
}

- (NSString)altDSID
{
  return (NSString *)objc_getProperty(self, a2, 56, 1);
}

- (void)setAltDSID:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 56);
}

- (NSString)DSID
{
  return (NSString *)objc_getProperty(self, a2, 64, 1);
}

- (void)setDSID:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 64);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_DSID, 0);
  objc_storeStrong((id *)&self->_altDSID, 0);
  objc_storeStrong((id *)&self->_scopeModificationDate, 0);
  objc_storeStrong((id *)&self->_playerInternal, 0);
  objc_storeStrong((id *)&self->_authenticationToken, 0);
  objc_storeStrong((id *)&self->_accountName, 0);
}

@end
