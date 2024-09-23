@implementation ASCodableSecureCloudShareItem

- (BOOL)hasShareURL
{
  return self->_shareURL != 0;
}

- (BOOL)hasZoneName
{
  return self->_zoneName != 0;
}

- (BOOL)hasInvitationToken
{
  return self->_invitationToken != 0;
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
  v8.super_class = (Class)ASCodableSecureCloudShareItem;
  -[ASCodableSecureCloudShareItem description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[ASCodableSecureCloudShareItem dictionaryRepresentation](self, "dictionaryRepresentation");
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
  NSString *zoneName;
  NSData *invitationToken;

  objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  shareURL = self->_shareURL;
  if (shareURL)
    objc_msgSend(v3, "setObject:forKey:", shareURL, CFSTR("shareURL"));
  zoneName = self->_zoneName;
  if (zoneName)
    objc_msgSend(v4, "setObject:forKey:", zoneName, CFSTR("zoneName"));
  invitationToken = self->_invitationToken;
  if (invitationToken)
    objc_msgSend(v4, "setObject:forKey:", invitationToken, CFSTR("invitationToken"));
  return v4;
}

- (BOOL)readFrom:(id)a3
{
  return ASCodableSecureCloudShareItemReadFrom((uint64_t)self, (uint64_t)a3);
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
  if (self->_zoneName)
  {
    PBDataWriterWriteStringField();
    v4 = v5;
  }
  if (self->_invitationToken)
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
  if (self->_zoneName)
  {
    objc_msgSend(v5, "setZoneName:");
    v4 = v5;
  }
  if (self->_invitationToken)
  {
    objc_msgSend(v5, "setInvitationToken:");
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
  uint64_t v10;
  void *v11;

  v5 = (_QWORD *)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = -[NSString copyWithZone:](self->_shareURL, "copyWithZone:", a3);
  v7 = (void *)v5[2];
  v5[2] = v6;

  v8 = -[NSString copyWithZone:](self->_zoneName, "copyWithZone:", a3);
  v9 = (void *)v5[3];
  v5[3] = v8;

  v10 = -[NSData copyWithZone:](self->_invitationToken, "copyWithZone:", a3);
  v11 = (void *)v5[1];
  v5[1] = v10;

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  _QWORD *v4;
  NSString *shareURL;
  NSString *zoneName;
  NSData *invitationToken;
  char v8;

  v4 = a3;
  if (objc_msgSend(v4, "isMemberOfClass:", objc_opt_class())
    && ((shareURL = self->_shareURL, !((unint64_t)shareURL | v4[2]))
     || -[NSString isEqual:](shareURL, "isEqual:"))
    && ((zoneName = self->_zoneName, !((unint64_t)zoneName | v4[3]))
     || -[NSString isEqual:](zoneName, "isEqual:")))
  {
    invitationToken = self->_invitationToken;
    if ((unint64_t)invitationToken | v4[1])
      v8 = -[NSData isEqual:](invitationToken, "isEqual:");
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
  NSUInteger v3;
  NSUInteger v4;

  v3 = -[NSString hash](self->_shareURL, "hash");
  v4 = -[NSString hash](self->_zoneName, "hash") ^ v3;
  return v4 ^ -[NSData hash](self->_invitationToken, "hash");
}

- (void)mergeFrom:(id)a3
{
  _QWORD *v4;

  v4 = a3;
  if (v4[2])
    -[ASCodableSecureCloudShareItem setShareURL:](self, "setShareURL:");
  if (v4[3])
    -[ASCodableSecureCloudShareItem setZoneName:](self, "setZoneName:");
  if (v4[1])
    -[ASCodableSecureCloudShareItem setInvitationToken:](self, "setInvitationToken:");

}

- (NSString)shareURL
{
  return self->_shareURL;
}

- (void)setShareURL:(id)a3
{
  objc_storeStrong((id *)&self->_shareURL, a3);
}

- (NSString)zoneName
{
  return self->_zoneName;
}

- (void)setZoneName:(id)a3
{
  objc_storeStrong((id *)&self->_zoneName, a3);
}

- (NSData)invitationToken
{
  return self->_invitationToken;
}

- (void)setInvitationToken:(id)a3
{
  objc_storeStrong((id *)&self->_invitationToken, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_zoneName, 0);
  objc_storeStrong((id *)&self->_shareURL, 0);
  objc_storeStrong((id *)&self->_invitationToken, 0);
}

@end
