@implementation NSSProfilesInfoRespMsgProfileInfo

- (BOOL)hasFriendlyName
{
  return self->_friendlyName != 0;
}

- (BOOL)hasProfileDescription
{
  return self->_profileDescription != 0;
}

- (BOOL)hasIdentifier
{
  return self->_identifier != 0;
}

- (BOOL)hasUUID
{
  return self->_uUID != 0;
}

- (BOOL)hasOrganization
{
  return self->_organization != 0;
}

- (BOOL)hasExpiryDate
{
  return self->_expiryDate != 0;
}

- (void)setIsInstalledByDeclarativeManagement:(BOOL)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_isInstalledByDeclarativeManagement = a3;
}

- (void)setHasIsInstalledByDeclarativeManagement:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (BOOL)hasIsInstalledByDeclarativeManagement
{
  return *(_BYTE *)&self->_has & 1;
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
  v8.super_class = (Class)NSSProfilesInfoRespMsgProfileInfo;
  -[NSSProfilesInfoRespMsgProfileInfo description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSSProfilesInfoRespMsgProfileInfo dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  void *v3;
  void *v4;
  NSString *friendlyName;
  NSString *profileDescription;
  NSString *identifier;
  NSString *uUID;
  NSString *organization;
  NSData *expiryDate;
  void *v11;

  objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  friendlyName = self->_friendlyName;
  if (friendlyName)
    objc_msgSend(v3, "setObject:forKey:", friendlyName, CFSTR("friendlyName"));
  profileDescription = self->_profileDescription;
  if (profileDescription)
    objc_msgSend(v4, "setObject:forKey:", profileDescription, CFSTR("profileDescription"));
  identifier = self->_identifier;
  if (identifier)
    objc_msgSend(v4, "setObject:forKey:", identifier, CFSTR("identifier"));
  uUID = self->_uUID;
  if (uUID)
    objc_msgSend(v4, "setObject:forKey:", uUID, CFSTR("UUID"));
  organization = self->_organization;
  if (organization)
    objc_msgSend(v4, "setObject:forKey:", organization, CFSTR("organization"));
  expiryDate = self->_expiryDate;
  if (expiryDate)
    objc_msgSend(v4, "setObject:forKey:", expiryDate, CFSTR("expiryDate"));
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", self->_isInstalledByDeclarativeManagement);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v11, CFSTR("isInstalledByDeclarativeManagement"));

  }
  return v4;
}

- (BOOL)readFrom:(id)a3
{
  return NSSProfilesInfoRespMsgProfileInfoReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  v5 = v4;
  if (self->_friendlyName)
  {
    PBDataWriterWriteStringField();
    v4 = v5;
  }
  if (self->_profileDescription)
  {
    PBDataWriterWriteStringField();
    v4 = v5;
  }
  if (self->_identifier)
  {
    PBDataWriterWriteStringField();
    v4 = v5;
  }
  if (self->_uUID)
  {
    PBDataWriterWriteStringField();
    v4 = v5;
  }
  if (self->_organization)
  {
    PBDataWriterWriteStringField();
    v4 = v5;
  }
  if (self->_expiryDate)
  {
    PBDataWriterWriteDataField();
    v4 = v5;
  }
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    PBDataWriterWriteBOOLField();
    v4 = v5;
  }

}

- (void)copyTo:(id)a3
{
  _BYTE *v4;
  _BYTE *v5;

  v4 = a3;
  v5 = v4;
  if (self->_friendlyName)
  {
    objc_msgSend(v4, "setFriendlyName:");
    v4 = v5;
  }
  if (self->_profileDescription)
  {
    objc_msgSend(v5, "setProfileDescription:");
    v4 = v5;
  }
  if (self->_identifier)
  {
    objc_msgSend(v5, "setIdentifier:");
    v4 = v5;
  }
  if (self->_uUID)
  {
    objc_msgSend(v5, "setUUID:");
    v4 = v5;
  }
  if (self->_organization)
  {
    objc_msgSend(v5, "setOrganization:");
    v4 = v5;
  }
  if (self->_expiryDate)
  {
    objc_msgSend(v5, "setExpiryDate:");
    v4 = v5;
  }
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    v4[56] = self->_isInstalledByDeclarativeManagement;
    v4[60] |= 1u;
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
  uint64_t v16;
  void *v17;

  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = -[NSString copyWithZone:](self->_friendlyName, "copyWithZone:", a3);
  v7 = *(void **)(v5 + 16);
  *(_QWORD *)(v5 + 16) = v6;

  v8 = -[NSString copyWithZone:](self->_profileDescription, "copyWithZone:", a3);
  v9 = *(void **)(v5 + 40);
  *(_QWORD *)(v5 + 40) = v8;

  v10 = -[NSString copyWithZone:](self->_identifier, "copyWithZone:", a3);
  v11 = *(void **)(v5 + 24);
  *(_QWORD *)(v5 + 24) = v10;

  v12 = -[NSString copyWithZone:](self->_uUID, "copyWithZone:", a3);
  v13 = *(void **)(v5 + 48);
  *(_QWORD *)(v5 + 48) = v12;

  v14 = -[NSString copyWithZone:](self->_organization, "copyWithZone:", a3);
  v15 = *(void **)(v5 + 32);
  *(_QWORD *)(v5 + 32) = v14;

  v16 = -[NSData copyWithZone:](self->_expiryDate, "copyWithZone:", a3);
  v17 = *(void **)(v5 + 8);
  *(_QWORD *)(v5 + 8) = v16;

  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    *(_BYTE *)(v5 + 56) = self->_isInstalledByDeclarativeManagement;
    *(_BYTE *)(v5 + 60) |= 1u;
  }
  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  NSString *friendlyName;
  NSString *profileDescription;
  NSString *identifier;
  NSString *uUID;
  NSString *organization;
  NSData *expiryDate;
  BOOL v11;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_16;
  friendlyName = self->_friendlyName;
  if ((unint64_t)friendlyName | *((_QWORD *)v4 + 2))
  {
    if (!-[NSString isEqual:](friendlyName, "isEqual:"))
      goto LABEL_16;
  }
  profileDescription = self->_profileDescription;
  if ((unint64_t)profileDescription | *((_QWORD *)v4 + 5))
  {
    if (!-[NSString isEqual:](profileDescription, "isEqual:"))
      goto LABEL_16;
  }
  identifier = self->_identifier;
  if ((unint64_t)identifier | *((_QWORD *)v4 + 3))
  {
    if (!-[NSString isEqual:](identifier, "isEqual:"))
      goto LABEL_16;
  }
  uUID = self->_uUID;
  if ((unint64_t)uUID | *((_QWORD *)v4 + 6))
  {
    if (!-[NSString isEqual:](uUID, "isEqual:"))
      goto LABEL_16;
  }
  organization = self->_organization;
  if ((unint64_t)organization | *((_QWORD *)v4 + 4))
  {
    if (!-[NSString isEqual:](organization, "isEqual:"))
      goto LABEL_16;
  }
  expiryDate = self->_expiryDate;
  if ((unint64_t)expiryDate | *((_QWORD *)v4 + 1))
  {
    if (!-[NSData isEqual:](expiryDate, "isEqual:"))
      goto LABEL_16;
  }
  v11 = (*((_BYTE *)v4 + 60) & 1) == 0;
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    if ((*((_BYTE *)v4 + 60) & 1) == 0)
    {
LABEL_16:
      v11 = 0;
      goto LABEL_17;
    }
    if (self->_isInstalledByDeclarativeManagement)
    {
      if (!*((_BYTE *)v4 + 56))
        goto LABEL_16;
    }
    else if (*((_BYTE *)v4 + 56))
    {
      goto LABEL_16;
    }
    v11 = 1;
  }
LABEL_17:

  return v11;
}

- (unint64_t)hash
{
  NSUInteger v3;
  NSUInteger v4;
  NSUInteger v5;
  NSUInteger v6;
  NSUInteger v7;
  uint64_t v8;
  uint64_t v9;

  v3 = -[NSString hash](self->_friendlyName, "hash");
  v4 = -[NSString hash](self->_profileDescription, "hash");
  v5 = -[NSString hash](self->_identifier, "hash");
  v6 = -[NSString hash](self->_uUID, "hash");
  v7 = -[NSString hash](self->_organization, "hash");
  v8 = -[NSData hash](self->_expiryDate, "hash");
  if ((*(_BYTE *)&self->_has & 1) != 0)
    v9 = 2654435761 * self->_isInstalledByDeclarativeManagement;
  else
    v9 = 0;
  return v4 ^ v3 ^ v5 ^ v6 ^ v7 ^ v8 ^ v9;
}

- (void)mergeFrom:(id)a3
{
  BOOL *v4;
  BOOL *v5;

  v4 = (BOOL *)a3;
  v5 = v4;
  if (*((_QWORD *)v4 + 2))
  {
    -[NSSProfilesInfoRespMsgProfileInfo setFriendlyName:](self, "setFriendlyName:");
    v4 = v5;
  }
  if (*((_QWORD *)v4 + 5))
  {
    -[NSSProfilesInfoRespMsgProfileInfo setProfileDescription:](self, "setProfileDescription:");
    v4 = v5;
  }
  if (*((_QWORD *)v4 + 3))
  {
    -[NSSProfilesInfoRespMsgProfileInfo setIdentifier:](self, "setIdentifier:");
    v4 = v5;
  }
  if (*((_QWORD *)v4 + 6))
  {
    -[NSSProfilesInfoRespMsgProfileInfo setUUID:](self, "setUUID:");
    v4 = v5;
  }
  if (*((_QWORD *)v4 + 4))
  {
    -[NSSProfilesInfoRespMsgProfileInfo setOrganization:](self, "setOrganization:");
    v4 = v5;
  }
  if (*((_QWORD *)v4 + 1))
  {
    -[NSSProfilesInfoRespMsgProfileInfo setExpiryDate:](self, "setExpiryDate:");
    v4 = v5;
  }
  if (v4[60])
  {
    self->_isInstalledByDeclarativeManagement = v4[56];
    *(_BYTE *)&self->_has |= 1u;
  }

}

- (NSString)friendlyName
{
  return self->_friendlyName;
}

- (void)setFriendlyName:(id)a3
{
  objc_storeStrong((id *)&self->_friendlyName, a3);
}

- (NSString)profileDescription
{
  return self->_profileDescription;
}

- (void)setProfileDescription:(id)a3
{
  objc_storeStrong((id *)&self->_profileDescription, a3);
}

- (NSString)identifier
{
  return self->_identifier;
}

- (void)setIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_identifier, a3);
}

- (NSString)uUID
{
  return self->_uUID;
}

- (void)setUUID:(id)a3
{
  objc_storeStrong((id *)&self->_uUID, a3);
}

- (NSString)organization
{
  return self->_organization;
}

- (void)setOrganization:(id)a3
{
  objc_storeStrong((id *)&self->_organization, a3);
}

- (NSData)expiryDate
{
  return self->_expiryDate;
}

- (void)setExpiryDate:(id)a3
{
  objc_storeStrong((id *)&self->_expiryDate, a3);
}

- (BOOL)isInstalledByDeclarativeManagement
{
  return self->_isInstalledByDeclarativeManagement;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_uUID, 0);
  objc_storeStrong((id *)&self->_profileDescription, 0);
  objc_storeStrong((id *)&self->_organization, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_storeStrong((id *)&self->_friendlyName, 0);
  objc_storeStrong((id *)&self->_expiryDate, 0);
}

@end
