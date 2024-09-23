@implementation ASCodableInviteResponse

- (BOOL)hasHandshakeToken
{
  return self->_handshakeToken != 0;
}

- (void)setResponseCode:(int)a3
{
  *(_BYTE *)&self->_has |= 2u;
  self->_responseCode = a3;
}

- (void)setHasResponseCode:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFD | v3;
}

- (BOOL)hasResponseCode
{
  return (*(_BYTE *)&self->_has >> 1) & 1;
}

- (BOOL)hasInviteeCloudKitAddress
{
  return self->_inviteeCloudKitAddress != 0;
}

- (BOOL)hasInviteeShareLocations
{
  return self->_inviteeShareLocations != 0;
}

- (BOOL)hasInviteeBuildNumber
{
  return self->_inviteeBuildNumber != 0;
}

- (void)setInviteeVersion:(unsigned int)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_inviteeVersion = a3;
}

- (void)setHasInviteeVersion:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (BOOL)hasInviteeVersion
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
  v8.super_class = (Class)ASCodableInviteResponse;
  -[ASCodableInviteResponse description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[ASCodableInviteResponse dictionaryRepresentation](self, "dictionaryRepresentation");
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
  void *v6;
  NSString *inviteeCloudKitAddress;
  ASCodableShareLocations *inviteeShareLocations;
  void *v9;
  NSString *inviteeBuildNumber;
  void *v11;
  ASCodableActivityDataPreview *activityDataPreview;
  void *v13;

  objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  handshakeToken = self->_handshakeToken;
  if (handshakeToken)
    objc_msgSend(v3, "setObject:forKey:", handshakeToken, CFSTR("handshakeToken"));
  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", self->_responseCode);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v6, CFSTR("responseCode"));

  }
  inviteeCloudKitAddress = self->_inviteeCloudKitAddress;
  if (inviteeCloudKitAddress)
    objc_msgSend(v4, "setObject:forKey:", inviteeCloudKitAddress, CFSTR("inviteeCloudKitAddress"));
  inviteeShareLocations = self->_inviteeShareLocations;
  if (inviteeShareLocations)
  {
    -[ASCodableShareLocations dictionaryRepresentation](inviteeShareLocations, "dictionaryRepresentation");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v9, CFSTR("inviteeShareLocations"));

  }
  inviteeBuildNumber = self->_inviteeBuildNumber;
  if (inviteeBuildNumber)
    objc_msgSend(v4, "setObject:forKey:", inviteeBuildNumber, CFSTR("inviteeBuildNumber"));
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", self->_inviteeVersion);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v11, CFSTR("inviteeVersion"));

  }
  activityDataPreview = self->_activityDataPreview;
  if (activityDataPreview)
  {
    -[ASCodableActivityDataPreview dictionaryRepresentation](activityDataPreview, "dictionaryRepresentation");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v13, CFSTR("activityDataPreview"));

  }
  return v4;
}

- (BOOL)readFrom:(id)a3
{
  return ASCodableInviteResponseReadFrom((uint64_t)self, (uint64_t)a3);
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
  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
    PBDataWriterWriteInt32Field();
    v4 = v5;
  }
  if (self->_inviteeCloudKitAddress)
  {
    PBDataWriterWriteStringField();
    v4 = v5;
  }
  if (self->_inviteeShareLocations)
  {
    PBDataWriterWriteSubmessage();
    v4 = v5;
  }
  if (self->_inviteeBuildNumber)
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
  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
    *((_DWORD *)v4 + 13) = self->_responseCode;
    *((_BYTE *)v4 + 56) |= 2u;
  }
  if (self->_inviteeCloudKitAddress)
  {
    objc_msgSend(v5, "setInviteeCloudKitAddress:");
    v4 = v5;
  }
  if (self->_inviteeShareLocations)
  {
    objc_msgSend(v5, "setInviteeShareLocations:");
    v4 = v5;
  }
  if (self->_inviteeBuildNumber)
  {
    objc_msgSend(v5, "setInviteeBuildNumber:");
    v4 = v5;
  }
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    *((_DWORD *)v4 + 12) = self->_inviteeVersion;
    *((_BYTE *)v4 + 56) |= 1u;
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
  id v10;
  void *v11;
  uint64_t v12;
  void *v13;
  id v14;
  void *v15;

  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = -[NSString copyWithZone:](self->_handshakeToken, "copyWithZone:", a3);
  v7 = *(void **)(v5 + 16);
  *(_QWORD *)(v5 + 16) = v6;

  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
    *(_DWORD *)(v5 + 52) = self->_responseCode;
    *(_BYTE *)(v5 + 56) |= 2u;
  }
  v8 = -[NSString copyWithZone:](self->_inviteeCloudKitAddress, "copyWithZone:", a3);
  v9 = *(void **)(v5 + 32);
  *(_QWORD *)(v5 + 32) = v8;

  v10 = -[ASCodableShareLocations copyWithZone:](self->_inviteeShareLocations, "copyWithZone:", a3);
  v11 = *(void **)(v5 + 40);
  *(_QWORD *)(v5 + 40) = v10;

  v12 = -[NSString copyWithZone:](self->_inviteeBuildNumber, "copyWithZone:", a3);
  v13 = *(void **)(v5 + 24);
  *(_QWORD *)(v5 + 24) = v12;

  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    *(_DWORD *)(v5 + 48) = self->_inviteeVersion;
    *(_BYTE *)(v5 + 56) |= 1u;
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
  NSString *inviteeCloudKitAddress;
  ASCodableShareLocations *inviteeShareLocations;
  NSString *inviteeBuildNumber;
  ASCodableActivityDataPreview *activityDataPreview;
  char v10;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_22;
  handshakeToken = self->_handshakeToken;
  if ((unint64_t)handshakeToken | *((_QWORD *)v4 + 2))
  {
    if (!-[NSString isEqual:](handshakeToken, "isEqual:"))
      goto LABEL_22;
  }
  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
    if ((*((_BYTE *)v4 + 56) & 2) == 0 || self->_responseCode != *((_DWORD *)v4 + 13))
      goto LABEL_22;
  }
  else if ((*((_BYTE *)v4 + 56) & 2) != 0)
  {
LABEL_22:
    v10 = 0;
    goto LABEL_23;
  }
  inviteeCloudKitAddress = self->_inviteeCloudKitAddress;
  if ((unint64_t)inviteeCloudKitAddress | *((_QWORD *)v4 + 4)
    && !-[NSString isEqual:](inviteeCloudKitAddress, "isEqual:"))
  {
    goto LABEL_22;
  }
  inviteeShareLocations = self->_inviteeShareLocations;
  if ((unint64_t)inviteeShareLocations | *((_QWORD *)v4 + 5))
  {
    if (!-[ASCodableShareLocations isEqual:](inviteeShareLocations, "isEqual:"))
      goto LABEL_22;
  }
  inviteeBuildNumber = self->_inviteeBuildNumber;
  if ((unint64_t)inviteeBuildNumber | *((_QWORD *)v4 + 3))
  {
    if (!-[NSString isEqual:](inviteeBuildNumber, "isEqual:"))
      goto LABEL_22;
  }
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    if ((*((_BYTE *)v4 + 56) & 1) == 0 || self->_inviteeVersion != *((_DWORD *)v4 + 12))
      goto LABEL_22;
  }
  else if ((*((_BYTE *)v4 + 56) & 1) != 0)
  {
    goto LABEL_22;
  }
  activityDataPreview = self->_activityDataPreview;
  if ((unint64_t)activityDataPreview | *((_QWORD *)v4 + 1))
    v10 = -[ASCodableActivityDataPreview isEqual:](activityDataPreview, "isEqual:");
  else
    v10 = 1;
LABEL_23:

  return v10;
}

- (unint64_t)hash
{
  NSUInteger v3;
  uint64_t v4;
  NSUInteger v5;
  unint64_t v6;
  NSUInteger v7;
  uint64_t v8;

  v3 = -[NSString hash](self->_handshakeToken, "hash");
  if ((*(_BYTE *)&self->_has & 2) != 0)
    v4 = 2654435761 * self->_responseCode;
  else
    v4 = 0;
  v5 = -[NSString hash](self->_inviteeCloudKitAddress, "hash");
  v6 = -[ASCodableShareLocations hash](self->_inviteeShareLocations, "hash");
  v7 = -[NSString hash](self->_inviteeBuildNumber, "hash");
  if ((*(_BYTE *)&self->_has & 1) != 0)
    v8 = 2654435761 * self->_inviteeVersion;
  else
    v8 = 0;
  return v4 ^ v3 ^ v5 ^ v6 ^ v7 ^ v8 ^ -[ASCodableActivityDataPreview hash](self->_activityDataPreview, "hash");
}

- (void)mergeFrom:(id)a3
{
  id v4;
  ASCodableShareLocations *inviteeShareLocations;
  uint64_t v6;
  ASCodableActivityDataPreview *activityDataPreview;
  uint64_t v8;
  id v9;

  v4 = a3;
  v9 = v4;
  if (*((_QWORD *)v4 + 2))
  {
    -[ASCodableInviteResponse setHandshakeToken:](self, "setHandshakeToken:");
    v4 = v9;
  }
  if ((*((_BYTE *)v4 + 56) & 2) != 0)
  {
    self->_responseCode = *((_DWORD *)v4 + 13);
    *(_BYTE *)&self->_has |= 2u;
  }
  if (*((_QWORD *)v4 + 4))
  {
    -[ASCodableInviteResponse setInviteeCloudKitAddress:](self, "setInviteeCloudKitAddress:");
    v4 = v9;
  }
  inviteeShareLocations = self->_inviteeShareLocations;
  v6 = *((_QWORD *)v4 + 5);
  if (inviteeShareLocations)
  {
    if (!v6)
      goto LABEL_13;
    -[ASCodableShareLocations mergeFrom:](inviteeShareLocations, "mergeFrom:");
  }
  else
  {
    if (!v6)
      goto LABEL_13;
    -[ASCodableInviteResponse setInviteeShareLocations:](self, "setInviteeShareLocations:");
  }
  v4 = v9;
LABEL_13:
  if (*((_QWORD *)v4 + 3))
  {
    -[ASCodableInviteResponse setInviteeBuildNumber:](self, "setInviteeBuildNumber:");
    v4 = v9;
  }
  if ((*((_BYTE *)v4 + 56) & 1) != 0)
  {
    self->_inviteeVersion = *((_DWORD *)v4 + 12);
    *(_BYTE *)&self->_has |= 1u;
  }
  activityDataPreview = self->_activityDataPreview;
  v8 = *((_QWORD *)v4 + 1);
  if (activityDataPreview)
  {
    if (v8)
    {
      -[ASCodableActivityDataPreview mergeFrom:](activityDataPreview, "mergeFrom:");
LABEL_22:
      v4 = v9;
    }
  }
  else if (v8)
  {
    -[ASCodableInviteResponse setActivityDataPreview:](self, "setActivityDataPreview:");
    goto LABEL_22;
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

- (int)responseCode
{
  return self->_responseCode;
}

- (NSString)inviteeCloudKitAddress
{
  return self->_inviteeCloudKitAddress;
}

- (void)setInviteeCloudKitAddress:(id)a3
{
  objc_storeStrong((id *)&self->_inviteeCloudKitAddress, a3);
}

- (ASCodableShareLocations)inviteeShareLocations
{
  return self->_inviteeShareLocations;
}

- (void)setInviteeShareLocations:(id)a3
{
  objc_storeStrong((id *)&self->_inviteeShareLocations, a3);
}

- (NSString)inviteeBuildNumber
{
  return self->_inviteeBuildNumber;
}

- (void)setInviteeBuildNumber:(id)a3
{
  objc_storeStrong((id *)&self->_inviteeBuildNumber, a3);
}

- (unsigned)inviteeVersion
{
  return self->_inviteeVersion;
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
  objc_storeStrong((id *)&self->_inviteeShareLocations, 0);
  objc_storeStrong((id *)&self->_inviteeCloudKitAddress, 0);
  objc_storeStrong((id *)&self->_inviteeBuildNumber, 0);
  objc_storeStrong((id *)&self->_handshakeToken, 0);
  objc_storeStrong((id *)&self->_activityDataPreview, 0);
}

@end
