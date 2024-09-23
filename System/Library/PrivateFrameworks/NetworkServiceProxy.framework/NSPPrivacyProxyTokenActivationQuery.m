@implementation NSPPrivacyProxyTokenActivationQuery

- (id)authTypeAsString:(int)a3
{
  __CFString *v3;

  if (a3 < 5 && ((0x17u >> a3) & 1) != 0)
  {
    v3 = off_1E41375B8[a3];
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), *(_QWORD *)&a3);
    v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  return v3;
}

- (int)StringAsAuthType:(id)a3
{
  id v3;
  int v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("UNKNOWN")) & 1) != 0)
  {
    v4 = 0;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("BAA")) & 1) != 0)
  {
    v4 = 1;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("ANISETTE")) & 1) != 0)
  {
    v4 = 2;
  }
  else if (objc_msgSend(v3, "isEqualToString:", CFSTR("TOKEN")))
  {
    v4 = 4;
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (BOOL)hasBaaParameters
{
  return self->_baaParameters != 0;
}

- (BOOL)hasAuthInfo
{
  return self->_authInfo != 0;
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  objc_super v8;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v8.receiver = self;
  v8.super_class = (Class)NSPPrivacyProxyTokenActivationQuery;
  -[NSPPrivacyProxyTokenActivationQuery description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSPPrivacyProxyTokenActivationQuery dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  void *v3;
  uint64_t authType;
  __CFString *v5;
  NSPPrivacyProxyBAAValidation *baaParameters;
  void *v7;
  NSPPrivacyProxyTokenInfo *tokenInfo;
  void *v9;
  NSData *authInfo;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  authType = self->_authType;
  if (authType < 5 && ((0x17u >> authType) & 1) != 0)
  {
    v5 = off_1E41375B8[authType];
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), self->_authType);
    v5 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  objc_msgSend(v3, "setObject:forKey:", v5, CFSTR("authType"));

  baaParameters = self->_baaParameters;
  if (baaParameters)
  {
    -[NSPPrivacyProxyBAAValidation dictionaryRepresentation](baaParameters, "dictionaryRepresentation");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v7, CFSTR("baaParameters"));

  }
  tokenInfo = self->_tokenInfo;
  if (tokenInfo)
  {
    -[NSPPrivacyProxyTokenInfo dictionaryRepresentation](tokenInfo, "dictionaryRepresentation");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v9, CFSTR("tokenInfo"));

  }
  authInfo = self->_authInfo;
  if (authInfo)
    objc_msgSend(v3, "setObject:forKey:", authInfo, CFSTR("authInfo"));
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return NSPPrivacyProxyTokenActivationQueryReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4;

  v4 = a3;
  PBDataWriterWriteInt32Field();
  if (self->_baaParameters)
    PBDataWriterWriteSubmessage();
  if (!self->_tokenInfo)
    __assert_rtn("-[NSPPrivacyProxyTokenActivationQuery writeTo:]", "NSPPrivacyProxyTokenActivationQuery.m", 168, "self->_tokenInfo != nil");
  PBDataWriterWriteSubmessage();
  if (self->_authInfo)
    PBDataWriterWriteDataField();

}

- (void)copyTo:(id)a3
{
  _DWORD *v4;

  v4 = a3;
  v4[4] = self->_authType;
  if (self->_baaParameters)
    objc_msgSend(v4, "setBaaParameters:");
  objc_msgSend(v4, "setTokenInfo:", self->_tokenInfo);
  if (self->_authInfo)
    objc_msgSend(v4, "setAuthInfo:");

}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5;
  id v6;
  void *v7;
  id v8;
  void *v9;
  uint64_t v10;
  void *v11;

  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  *(_DWORD *)(v5 + 16) = self->_authType;
  v6 = -[NSPPrivacyProxyBAAValidation copyWithZone:](self->_baaParameters, "copyWithZone:", a3);
  v7 = *(void **)(v5 + 24);
  *(_QWORD *)(v5 + 24) = v6;

  v8 = -[NSPPrivacyProxyTokenInfo copyWithZone:](self->_tokenInfo, "copyWithZone:", a3);
  v9 = *(void **)(v5 + 32);
  *(_QWORD *)(v5 + 32) = v8;

  v10 = -[NSData copyWithZone:](self->_authInfo, "copyWithZone:", a3);
  v11 = *(void **)(v5 + 8);
  *(_QWORD *)(v5 + 8) = v10;

  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  _QWORD *v4;
  NSPPrivacyProxyBAAValidation *baaParameters;
  NSPPrivacyProxyTokenInfo *tokenInfo;
  NSData *authInfo;
  char v8;

  v4 = a3;
  if (objc_msgSend(v4, "isMemberOfClass:", objc_opt_class())
    && self->_authType == *((_DWORD *)v4 + 4)
    && ((baaParameters = self->_baaParameters, !((unint64_t)baaParameters | v4[3]))
     || -[NSPPrivacyProxyBAAValidation isEqual:](baaParameters, "isEqual:"))
    && ((tokenInfo = self->_tokenInfo, !((unint64_t)tokenInfo | v4[4]))
     || -[NSPPrivacyProxyTokenInfo isEqual:](tokenInfo, "isEqual:")))
  {
    authInfo = self->_authInfo;
    if ((unint64_t)authInfo | v4[1])
      v8 = -[NSData isEqual:](authInfo, "isEqual:");
    else
      v8 = 1;
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (unint64_t)hash
{
  uint64_t v3;
  unint64_t v4;
  unint64_t v5;

  v3 = 2654435761 * self->_authType;
  v4 = -[NSPPrivacyProxyBAAValidation hash](self->_baaParameters, "hash");
  v5 = v4 ^ -[NSPPrivacyProxyTokenInfo hash](self->_tokenInfo, "hash");
  return v5 ^ -[NSData hash](self->_authInfo, "hash") ^ v3;
}

- (void)mergeFrom:(id)a3
{
  _DWORD *v4;
  NSPPrivacyProxyBAAValidation *baaParameters;
  uint64_t v6;
  NSPPrivacyProxyTokenInfo *tokenInfo;
  uint64_t v8;
  _DWORD *v9;

  v4 = a3;
  self->_authType = v4[4];
  baaParameters = self->_baaParameters;
  v6 = *((_QWORD *)v4 + 3);
  v9 = v4;
  if (baaParameters)
  {
    if (!v6)
      goto LABEL_7;
    -[NSPPrivacyProxyBAAValidation mergeFrom:](baaParameters, "mergeFrom:");
  }
  else
  {
    if (!v6)
      goto LABEL_7;
    -[NSPPrivacyProxyTokenActivationQuery setBaaParameters:](self, "setBaaParameters:");
  }
  v4 = v9;
LABEL_7:
  tokenInfo = self->_tokenInfo;
  v8 = *((_QWORD *)v4 + 4);
  if (tokenInfo)
  {
    if (!v8)
      goto LABEL_13;
    -[NSPPrivacyProxyTokenInfo mergeFrom:](tokenInfo, "mergeFrom:");
  }
  else
  {
    if (!v8)
      goto LABEL_13;
    -[NSPPrivacyProxyTokenActivationQuery setTokenInfo:](self, "setTokenInfo:");
  }
  v4 = v9;
LABEL_13:
  if (*((_QWORD *)v4 + 1))
  {
    -[NSPPrivacyProxyTokenActivationQuery setAuthInfo:](self, "setAuthInfo:");
    v4 = v9;
  }

}

- (int)authType
{
  return self->_authType;
}

- (void)setAuthType:(int)a3
{
  self->_authType = a3;
}

- (NSPPrivacyProxyBAAValidation)baaParameters
{
  return self->_baaParameters;
}

- (void)setBaaParameters:(id)a3
{
  objc_storeStrong((id *)&self->_baaParameters, a3);
}

- (NSPPrivacyProxyTokenInfo)tokenInfo
{
  return self->_tokenInfo;
}

- (void)setTokenInfo:(id)a3
{
  objc_storeStrong((id *)&self->_tokenInfo, a3);
}

- (NSData)authInfo
{
  return self->_authInfo;
}

- (void)setAuthInfo:(id)a3
{
  objc_storeStrong((id *)&self->_authInfo, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_tokenInfo, 0);
  objc_storeStrong((id *)&self->_baaParameters, 0);
  objc_storeStrong((id *)&self->_authInfo, 0);
}

@end
