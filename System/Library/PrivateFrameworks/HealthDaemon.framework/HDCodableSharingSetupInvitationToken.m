@implementation HDCodableSharingSetupInvitationToken

- (BOOL)hasShareURL
{
  return self->_shareURL != 0;
}

- (BOOL)hasToken
{
  return self->_token != 0;
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
  v8.super_class = (Class)HDCodableSharingSetupInvitationToken;
  -[HDCodableSharingSetupInvitationToken description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[HDCodableSharingSetupInvitationToken dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  void *v3;
  void *v4;
  NSString *shareURL;
  NSData *token;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  shareURL = self->_shareURL;
  if (shareURL)
    objc_msgSend(v3, "setObject:forKey:", shareURL, CFSTR("shareURL"));
  token = self->_token;
  if (token)
    objc_msgSend(v4, "setObject:forKey:", token, CFSTR("token"));
  return v4;
}

- (BOOL)readFrom:(id)a3
{
  return HDCodableSharingSetupInvitationTokenReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  v5 = v4;
  if (self->_shareURL)
  {
    PBDataWriterWriteStringField();
    v4 = v5;
  }
  if (self->_token)
  {
    PBDataWriterWriteDataField();
    v4 = v5;
  }

}

- (void)copyTo:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  v5 = v4;
  if (self->_shareURL)
  {
    objc_msgSend(v4, "setShareURL:");
    v4 = v5;
  }
  if (self->_token)
  {
    objc_msgSend(v5, "setToken:");
    v4 = v5;
  }

}

- (id)copyWithZone:(_NSZone *)a3
{
  _QWORD *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;

  v5 = (_QWORD *)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = -[NSString copyWithZone:](self->_shareURL, "copyWithZone:", a3);
  v7 = (void *)v5[1];
  v5[1] = v6;

  v8 = -[NSData copyWithZone:](self->_token, "copyWithZone:", a3);
  v9 = (void *)v5[2];
  v5[2] = v8;

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  _QWORD *v4;
  NSString *shareURL;
  NSData *token;
  char v7;

  v4 = a3;
  if (objc_msgSend(v4, "isMemberOfClass:", objc_opt_class())
    && ((shareURL = self->_shareURL, !((unint64_t)shareURL | v4[1]))
     || -[NSString isEqual:](shareURL, "isEqual:")))
  {
    token = self->_token;
    if ((unint64_t)token | v4[2])
      v7 = -[NSData isEqual:](token, "isEqual:");
    else
      v7 = 1;
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (unint64_t)hash
{
  NSUInteger v3;

  v3 = -[NSString hash](self->_shareURL, "hash");
  return -[NSData hash](self->_token, "hash") ^ v3;
}

- (void)mergeFrom:(id)a3
{
  _QWORD *v4;
  _QWORD *v5;

  v4 = a3;
  v5 = v4;
  if (v4[1])
  {
    -[HDCodableSharingSetupInvitationToken setShareURL:](self, "setShareURL:");
    v4 = v5;
  }
  if (v4[2])
  {
    -[HDCodableSharingSetupInvitationToken setToken:](self, "setToken:");
    v4 = v5;
  }

}

- (NSString)shareURL
{
  return self->_shareURL;
}

- (void)setShareURL:(id)a3
{
  objc_storeStrong((id *)&self->_shareURL, a3);
}

- (NSData)token
{
  return self->_token;
}

- (void)setToken:(id)a3
{
  objc_storeStrong((id *)&self->_token, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_token, 0);
  objc_storeStrong((id *)&self->_shareURL, 0);
}

@end
