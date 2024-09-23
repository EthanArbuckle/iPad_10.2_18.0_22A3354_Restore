@implementation NNMKProtoStandaloneAccountIdentity

- (BOOL)hasUsername
{
  return self->_username != 0;
}

- (BOOL)hasDisplayName
{
  return self->_displayName != 0;
}

- (BOOL)hasToken
{
  return self->_token != 0;
}

- (BOOL)hasRefreshToken
{
  return self->_refreshToken != 0;
}

- (void)setIdentityType:(unsigned int)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_identityType = a3;
}

- (void)setHasIdentityType:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (BOOL)hasIdentityType
{
  return *(_BYTE *)&self->_has & 1;
}

- (BOOL)hasAccountIdentifier
{
  return self->_accountIdentifier != 0;
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  objc_super v8;

  v3 = (void *)MEMORY[0x24BDD17C8];
  v8.receiver = self;
  v8.super_class = (Class)NNMKProtoStandaloneAccountIdentity;
  -[NNMKProtoStandaloneAccountIdentity description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[NNMKProtoStandaloneAccountIdentity dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  void *v3;
  void *v4;
  NSString *username;
  NSString *displayName;
  NSString *token;
  NSString *refreshToken;
  void *v9;
  NSString *accountIdentifier;

  objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  username = self->_username;
  if (username)
    objc_msgSend(v3, "setObject:forKey:", username, CFSTR("username"));
  displayName = self->_displayName;
  if (displayName)
    objc_msgSend(v4, "setObject:forKey:", displayName, CFSTR("displayName"));
  token = self->_token;
  if (token)
    objc_msgSend(v4, "setObject:forKey:", token, CFSTR("token"));
  refreshToken = self->_refreshToken;
  if (refreshToken)
    objc_msgSend(v4, "setObject:forKey:", refreshToken, CFSTR("refreshToken"));
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", self->_identityType);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v9, CFSTR("identityType"));

  }
  accountIdentifier = self->_accountIdentifier;
  if (accountIdentifier)
    objc_msgSend(v4, "setObject:forKey:", accountIdentifier, CFSTR("accountIdentifier"));
  return v4;
}

- (BOOL)readFrom:(id)a3
{
  return NNMKProtoStandaloneAccountIdentityReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  v5 = v4;
  if (self->_username)
  {
    PBDataWriterWriteStringField();
    v4 = v5;
  }
  if (self->_displayName)
  {
    PBDataWriterWriteStringField();
    v4 = v5;
  }
  if (self->_token)
  {
    PBDataWriterWriteStringField();
    v4 = v5;
  }
  if (self->_refreshToken)
  {
    PBDataWriterWriteStringField();
    v4 = v5;
  }
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    PBDataWriterWriteUint32Field();
    v4 = v5;
  }
  if (self->_accountIdentifier)
  {
    PBDataWriterWriteStringField();
    v4 = v5;
  }

}

- (void)copyTo:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  v5 = v4;
  if (self->_username)
  {
    objc_msgSend(v4, "setUsername:");
    v4 = v5;
  }
  if (self->_displayName)
  {
    objc_msgSend(v5, "setDisplayName:");
    v4 = v5;
  }
  if (self->_token)
  {
    objc_msgSend(v5, "setToken:");
    v4 = v5;
  }
  if (self->_refreshToken)
  {
    objc_msgSend(v5, "setRefreshToken:");
    v4 = v5;
  }
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    *((_DWORD *)v4 + 6) = self->_identityType;
    *((_BYTE *)v4 + 56) |= 1u;
  }
  if (self->_accountIdentifier)
  {
    objc_msgSend(v5, "setAccountIdentifier:");
    v4 = v5;
  }

}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  void *v15;

  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = -[NSString copyWithZone:](self->_username, "copyWithZone:", a3);
  v7 = *(void **)(v5 + 48);
  *(_QWORD *)(v5 + 48) = v6;

  v8 = -[NSString copyWithZone:](self->_displayName, "copyWithZone:", a3);
  v9 = *(void **)(v5 + 16);
  *(_QWORD *)(v5 + 16) = v8;

  v10 = -[NSString copyWithZone:](self->_token, "copyWithZone:", a3);
  v11 = *(void **)(v5 + 40);
  *(_QWORD *)(v5 + 40) = v10;

  v12 = -[NSString copyWithZone:](self->_refreshToken, "copyWithZone:", a3);
  v13 = *(void **)(v5 + 32);
  *(_QWORD *)(v5 + 32) = v12;

  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    *(_DWORD *)(v5 + 24) = self->_identityType;
    *(_BYTE *)(v5 + 56) |= 1u;
  }
  v14 = -[NSString copyWithZone:](self->_accountIdentifier, "copyWithZone:", a3);
  v15 = *(void **)(v5 + 8);
  *(_QWORD *)(v5 + 8) = v14;

  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  NSString *username;
  NSString *displayName;
  NSString *token;
  NSString *refreshToken;
  NSString *accountIdentifier;
  char v10;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_17;
  username = self->_username;
  if ((unint64_t)username | *((_QWORD *)v4 + 6))
  {
    if (!-[NSString isEqual:](username, "isEqual:"))
      goto LABEL_17;
  }
  displayName = self->_displayName;
  if ((unint64_t)displayName | *((_QWORD *)v4 + 2))
  {
    if (!-[NSString isEqual:](displayName, "isEqual:"))
      goto LABEL_17;
  }
  token = self->_token;
  if ((unint64_t)token | *((_QWORD *)v4 + 5))
  {
    if (!-[NSString isEqual:](token, "isEqual:"))
      goto LABEL_17;
  }
  refreshToken = self->_refreshToken;
  if ((unint64_t)refreshToken | *((_QWORD *)v4 + 4))
  {
    if (!-[NSString isEqual:](refreshToken, "isEqual:"))
      goto LABEL_17;
  }
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    if ((*((_BYTE *)v4 + 56) & 1) == 0 || self->_identityType != *((_DWORD *)v4 + 6))
      goto LABEL_17;
  }
  else if ((*((_BYTE *)v4 + 56) & 1) != 0)
  {
LABEL_17:
    v10 = 0;
    goto LABEL_18;
  }
  accountIdentifier = self->_accountIdentifier;
  if ((unint64_t)accountIdentifier | *((_QWORD *)v4 + 1))
    v10 = -[NSString isEqual:](accountIdentifier, "isEqual:");
  else
    v10 = 1;
LABEL_18:

  return v10;
}

- (unint64_t)hash
{
  NSUInteger v3;
  NSUInteger v4;
  NSUInteger v5;
  NSUInteger v6;
  uint64_t v7;

  v3 = -[NSString hash](self->_username, "hash");
  v4 = -[NSString hash](self->_displayName, "hash");
  v5 = -[NSString hash](self->_token, "hash");
  v6 = -[NSString hash](self->_refreshToken, "hash");
  if ((*(_BYTE *)&self->_has & 1) != 0)
    v7 = 2654435761 * self->_identityType;
  else
    v7 = 0;
  return v4 ^ v3 ^ v5 ^ v6 ^ v7 ^ -[NSString hash](self->_accountIdentifier, "hash");
}

- (void)mergeFrom:(id)a3
{
  unsigned int *v4;
  unsigned int *v5;

  v4 = (unsigned int *)a3;
  v5 = v4;
  if (*((_QWORD *)v4 + 6))
  {
    -[NNMKProtoStandaloneAccountIdentity setUsername:](self, "setUsername:");
    v4 = v5;
  }
  if (*((_QWORD *)v4 + 2))
  {
    -[NNMKProtoStandaloneAccountIdentity setDisplayName:](self, "setDisplayName:");
    v4 = v5;
  }
  if (*((_QWORD *)v4 + 5))
  {
    -[NNMKProtoStandaloneAccountIdentity setToken:](self, "setToken:");
    v4 = v5;
  }
  if (*((_QWORD *)v4 + 4))
  {
    -[NNMKProtoStandaloneAccountIdentity setRefreshToken:](self, "setRefreshToken:");
    v4 = v5;
  }
  if ((v4[14] & 1) != 0)
  {
    self->_identityType = v4[6];
    *(_BYTE *)&self->_has |= 1u;
  }
  if (*((_QWORD *)v4 + 1))
  {
    -[NNMKProtoStandaloneAccountIdentity setAccountIdentifier:](self, "setAccountIdentifier:");
    v4 = v5;
  }

}

- (NSString)username
{
  return self->_username;
}

- (void)setUsername:(id)a3
{
  objc_storeStrong((id *)&self->_username, a3);
}

- (NSString)displayName
{
  return self->_displayName;
}

- (void)setDisplayName:(id)a3
{
  objc_storeStrong((id *)&self->_displayName, a3);
}

- (NSString)token
{
  return self->_token;
}

- (void)setToken:(id)a3
{
  objc_storeStrong((id *)&self->_token, a3);
}

- (NSString)refreshToken
{
  return self->_refreshToken;
}

- (void)setRefreshToken:(id)a3
{
  objc_storeStrong((id *)&self->_refreshToken, a3);
}

- (unsigned)identityType
{
  return self->_identityType;
}

- (NSString)accountIdentifier
{
  return self->_accountIdentifier;
}

- (void)setAccountIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_accountIdentifier, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_username, 0);
  objc_storeStrong((id *)&self->_token, 0);
  objc_storeStrong((id *)&self->_refreshToken, 0);
  objc_storeStrong((id *)&self->_displayName, 0);
  objc_storeStrong((id *)&self->_accountIdentifier, 0);
}

@end
