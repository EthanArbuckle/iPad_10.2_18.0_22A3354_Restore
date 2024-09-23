@implementation ASCodableInviteRequest

- (BOOL)hasHandshakeToken
{
  return self->_handshakeToken != 0;
}

- (BOOL)hasInviterCloudKitAddress
{
  return self->_inviterCloudKitAddress != 0;
}

- (BOOL)hasInviterCallerID
{
  return self->_inviterCallerID != 0;
}

- (BOOL)hasInviterBuildNumber
{
  return self->_inviterBuildNumber != 0;
}

- (void)setInviterVersion:(unsigned int)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_inviterVersion = a3;
}

- (void)setHasInviterVersion:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (BOOL)hasInviterVersion
{
  return *(_BYTE *)&self->_has & 1;
}

- (BOOL)hasActivityDataPreview
{
  return self->_activityDataPreview != 0;
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
  v8.super_class = (Class)ASCodableInviteRequest;
  -[ASCodableInviteRequest description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[ASCodableInviteRequest dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  void *v3;
  void *v4;
  NSString *handshakeToken;
  NSString *inviterCloudKitAddress;
  NSString *inviterCallerID;
  NSString *inviterBuildNumber;
  void *v9;
  ASCodableActivityDataPreview *activityDataPreview;
  void *v11;

  objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  handshakeToken = self->_handshakeToken;
  if (handshakeToken)
    objc_msgSend(v3, "setObject:forKey:", handshakeToken, CFSTR("handshakeToken"));
  inviterCloudKitAddress = self->_inviterCloudKitAddress;
  if (inviterCloudKitAddress)
    objc_msgSend(v4, "setObject:forKey:", inviterCloudKitAddress, CFSTR("inviterCloudKitAddress"));
  inviterCallerID = self->_inviterCallerID;
  if (inviterCallerID)
    objc_msgSend(v4, "setObject:forKey:", inviterCallerID, CFSTR("inviterCallerID"));
  inviterBuildNumber = self->_inviterBuildNumber;
  if (inviterBuildNumber)
    objc_msgSend(v4, "setObject:forKey:", inviterBuildNumber, CFSTR("inviterBuildNumber"));
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", self->_inviterVersion);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v9, CFSTR("inviterVersion"));

  }
  activityDataPreview = self->_activityDataPreview;
  if (activityDataPreview)
  {
    -[ASCodableActivityDataPreview dictionaryRepresentation](activityDataPreview, "dictionaryRepresentation");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v11, CFSTR("activityDataPreview"));

  }
  return v4;
}

- (BOOL)readFrom:(id)a3
{
  return ASCodableInviteRequestReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  v5 = v4;
  if (self->_handshakeToken)
  {
    PBDataWriterWriteStringField();
    v4 = v5;
  }
  if (self->_inviterCloudKitAddress)
  {
    PBDataWriterWriteStringField();
    v4 = v5;
  }
  if (self->_inviterCallerID)
  {
    PBDataWriterWriteStringField();
    v4 = v5;
  }
  if (self->_inviterBuildNumber)
  {
    PBDataWriterWriteStringField();
    v4 = v5;
  }
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    PBDataWriterWriteUint32Field();
    v4 = v5;
  }
  if (self->_activityDataPreview)
  {
    PBDataWriterWriteSubmessage();
    v4 = v5;
  }

}

- (void)copyTo:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  v5 = v4;
  if (self->_handshakeToken)
  {
    objc_msgSend(v4, "setHandshakeToken:");
    v4 = v5;
  }
  if (self->_inviterCloudKitAddress)
  {
    objc_msgSend(v5, "setInviterCloudKitAddress:");
    v4 = v5;
  }
  if (self->_inviterCallerID)
  {
    objc_msgSend(v5, "setInviterCallerID:");
    v4 = v5;
  }
  if (self->_inviterBuildNumber)
  {
    objc_msgSend(v5, "setInviterBuildNumber:");
    v4 = v5;
  }
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    *((_DWORD *)v4 + 12) = self->_inviterVersion;
    *((_BYTE *)v4 + 52) |= 1u;
  }
  if (self->_activityDataPreview)
  {
    objc_msgSend(v5, "setActivityDataPreview:");
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
  id v14;
  void *v15;

  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = -[NSString copyWithZone:](self->_handshakeToken, "copyWithZone:", a3);
  v7 = *(void **)(v5 + 16);
  *(_QWORD *)(v5 + 16) = v6;

  v8 = -[NSString copyWithZone:](self->_inviterCloudKitAddress, "copyWithZone:", a3);
  v9 = *(void **)(v5 + 40);
  *(_QWORD *)(v5 + 40) = v8;

  v10 = -[NSString copyWithZone:](self->_inviterCallerID, "copyWithZone:", a3);
  v11 = *(void **)(v5 + 32);
  *(_QWORD *)(v5 + 32) = v10;

  v12 = -[NSString copyWithZone:](self->_inviterBuildNumber, "copyWithZone:", a3);
  v13 = *(void **)(v5 + 24);
  *(_QWORD *)(v5 + 24) = v12;

  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    *(_DWORD *)(v5 + 48) = self->_inviterVersion;
    *(_BYTE *)(v5 + 52) |= 1u;
  }
  v14 = -[ASCodableActivityDataPreview copyWithZone:](self->_activityDataPreview, "copyWithZone:", a3);
  v15 = *(void **)(v5 + 8);
  *(_QWORD *)(v5 + 8) = v14;

  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  NSString *handshakeToken;
  NSString *inviterCloudKitAddress;
  NSString *inviterCallerID;
  NSString *inviterBuildNumber;
  ASCodableActivityDataPreview *activityDataPreview;
  char v10;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_17;
  handshakeToken = self->_handshakeToken;
  if ((unint64_t)handshakeToken | *((_QWORD *)v4 + 2))
  {
    if (!-[NSString isEqual:](handshakeToken, "isEqual:"))
      goto LABEL_17;
  }
  inviterCloudKitAddress = self->_inviterCloudKitAddress;
  if ((unint64_t)inviterCloudKitAddress | *((_QWORD *)v4 + 5))
  {
    if (!-[NSString isEqual:](inviterCloudKitAddress, "isEqual:"))
      goto LABEL_17;
  }
  inviterCallerID = self->_inviterCallerID;
  if ((unint64_t)inviterCallerID | *((_QWORD *)v4 + 4))
  {
    if (!-[NSString isEqual:](inviterCallerID, "isEqual:"))
      goto LABEL_17;
  }
  inviterBuildNumber = self->_inviterBuildNumber;
  if ((unint64_t)inviterBuildNumber | *((_QWORD *)v4 + 3))
  {
    if (!-[NSString isEqual:](inviterBuildNumber, "isEqual:"))
      goto LABEL_17;
  }
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    if ((*((_BYTE *)v4 + 52) & 1) == 0 || self->_inviterVersion != *((_DWORD *)v4 + 12))
      goto LABEL_17;
  }
  else if ((*((_BYTE *)v4 + 52) & 1) != 0)
  {
LABEL_17:
    v10 = 0;
    goto LABEL_18;
  }
  activityDataPreview = self->_activityDataPreview;
  if ((unint64_t)activityDataPreview | *((_QWORD *)v4 + 1))
    v10 = -[ASCodableActivityDataPreview isEqual:](activityDataPreview, "isEqual:");
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

  v3 = -[NSString hash](self->_handshakeToken, "hash");
  v4 = -[NSString hash](self->_inviterCloudKitAddress, "hash");
  v5 = -[NSString hash](self->_inviterCallerID, "hash");
  v6 = -[NSString hash](self->_inviterBuildNumber, "hash");
  if ((*(_BYTE *)&self->_has & 1) != 0)
    v7 = 2654435761 * self->_inviterVersion;
  else
    v7 = 0;
  return v4 ^ v3 ^ v5 ^ v6 ^ v7 ^ -[ASCodableActivityDataPreview hash](self->_activityDataPreview, "hash");
}

- (void)mergeFrom:(id)a3
{
  unsigned int *v4;
  ASCodableActivityDataPreview *activityDataPreview;
  uint64_t v6;
  unsigned int *v7;

  v4 = (unsigned int *)a3;
  v7 = v4;
  if (*((_QWORD *)v4 + 2))
  {
    -[ASCodableInviteRequest setHandshakeToken:](self, "setHandshakeToken:");
    v4 = v7;
  }
  if (*((_QWORD *)v4 + 5))
  {
    -[ASCodableInviteRequest setInviterCloudKitAddress:](self, "setInviterCloudKitAddress:");
    v4 = v7;
  }
  if (*((_QWORD *)v4 + 4))
  {
    -[ASCodableInviteRequest setInviterCallerID:](self, "setInviterCallerID:");
    v4 = v7;
  }
  if (*((_QWORD *)v4 + 3))
  {
    -[ASCodableInviteRequest setInviterBuildNumber:](self, "setInviterBuildNumber:");
    v4 = v7;
  }
  if ((v4[13] & 1) != 0)
  {
    self->_inviterVersion = v4[12];
    *(_BYTE *)&self->_has |= 1u;
  }
  activityDataPreview = self->_activityDataPreview;
  v6 = *((_QWORD *)v4 + 1);
  if (activityDataPreview)
  {
    if (v6)
    {
      -[ASCodableActivityDataPreview mergeFrom:](activityDataPreview, "mergeFrom:");
LABEL_16:
      v4 = v7;
    }
  }
  else if (v6)
  {
    -[ASCodableInviteRequest setActivityDataPreview:](self, "setActivityDataPreview:");
    goto LABEL_16;
  }

}

- (NSString)handshakeToken
{
  return self->_handshakeToken;
}

- (void)setHandshakeToken:(id)a3
{
  objc_storeStrong((id *)&self->_handshakeToken, a3);
}

- (NSString)inviterCloudKitAddress
{
  return self->_inviterCloudKitAddress;
}

- (void)setInviterCloudKitAddress:(id)a3
{
  objc_storeStrong((id *)&self->_inviterCloudKitAddress, a3);
}

- (NSString)inviterCallerID
{
  return self->_inviterCallerID;
}

- (void)setInviterCallerID:(id)a3
{
  objc_storeStrong((id *)&self->_inviterCallerID, a3);
}

- (NSString)inviterBuildNumber
{
  return self->_inviterBuildNumber;
}

- (void)setInviterBuildNumber:(id)a3
{
  objc_storeStrong((id *)&self->_inviterBuildNumber, a3);
}

- (unsigned)inviterVersion
{
  return self->_inviterVersion;
}

- (ASCodableActivityDataPreview)activityDataPreview
{
  return self->_activityDataPreview;
}

- (void)setActivityDataPreview:(id)a3
{
  objc_storeStrong((id *)&self->_activityDataPreview, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_inviterCloudKitAddress, 0);
  objc_storeStrong((id *)&self->_inviterCallerID, 0);
  objc_storeStrong((id *)&self->_inviterBuildNumber, 0);
  objc_storeStrong((id *)&self->_handshakeToken, 0);
  objc_storeStrong((id *)&self->_activityDataPreview, 0);
}

@end
