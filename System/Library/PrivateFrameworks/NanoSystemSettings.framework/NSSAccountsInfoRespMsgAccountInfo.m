@implementation NSSAccountsInfoRespMsgAccountInfo

- (BOOL)hasIdentifier
{
  return self->_identifier != 0;
}

- (BOOL)hasUsername
{
  return self->_username != 0;
}

- (BOOL)hasDSID
{
  return self->_dSID != 0;
}

- (void)setAuthenticated:(BOOL)a3
{
  *(_BYTE *)&self->_has |= 4u;
  self->_authenticated = a3;
}

- (void)setHasAuthenticated:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 4;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFB | v3;
}

- (BOOL)hasAuthenticated
{
  return (*(_BYTE *)&self->_has >> 2) & 1;
}

- (BOOL)hasAltDSID
{
  return self->_altDSID != 0;
}

- (BOOL)hasType
{
  return self->_type != 0;
}

- (void)setAaPrimaryAccount:(BOOL)a3
{
  *(_BYTE *)&self->_has |= 2u;
  self->_aaPrimaryAccount = a3;
}

- (void)setHasAaPrimaryAccount:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFD | v3;
}

- (BOOL)hasAaPrimaryAccount
{
  return (*(_BYTE *)&self->_has >> 1) & 1;
}

- (void)setAaIsManaged:(BOOL)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_aaIsManaged = a3;
}

- (void)setHasAaIsManaged:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (BOOL)hasAaIsManaged
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
  v8.super_class = (Class)NSSAccountsInfoRespMsgAccountInfo;
  -[NSSAccountsInfoRespMsgAccountInfo description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSSAccountsInfoRespMsgAccountInfo dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  void *v3;
  void *v4;
  NSString *identifier;
  NSString *username;
  NSString *dSID;
  void *v8;
  NSString *altDSID;
  NSString *type;
  char has;
  void *v12;
  void *v13;

  objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  identifier = self->_identifier;
  if (identifier)
    objc_msgSend(v3, "setObject:forKey:", identifier, CFSTR("identifier"));
  username = self->_username;
  if (username)
    objc_msgSend(v4, "setObject:forKey:", username, CFSTR("username"));
  dSID = self->_dSID;
  if (dSID)
    objc_msgSend(v4, "setObject:forKey:", dSID, CFSTR("DSID"));
  if ((*(_BYTE *)&self->_has & 4) != 0)
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", self->_authenticated);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v8, CFSTR("authenticated"));

  }
  altDSID = self->_altDSID;
  if (altDSID)
    objc_msgSend(v4, "setObject:forKey:", altDSID, CFSTR("altDSID"));
  type = self->_type;
  if (type)
    objc_msgSend(v4, "setObject:forKey:", type, CFSTR("type"));
  has = (char)self->_has;
  if ((has & 2) != 0)
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", self->_aaPrimaryAccount);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v12, CFSTR("aa_primaryAccount"));

    has = (char)self->_has;
  }
  if ((has & 1) != 0)
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", self->_aaIsManaged);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v13, CFSTR("aa_isManaged"));

  }
  return v4;
}

- (BOOL)readFrom:(id)a3
{
  return NSSAccountsInfoRespMsgAccountInfoReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4;
  char has;
  id v6;

  v4 = a3;
  v6 = v4;
  if (self->_identifier)
  {
    PBDataWriterWriteStringField();
    v4 = v6;
  }
  if (self->_username)
  {
    PBDataWriterWriteStringField();
    v4 = v6;
  }
  if (self->_dSID)
  {
    PBDataWriterWriteStringField();
    v4 = v6;
  }
  if ((*(_BYTE *)&self->_has & 4) != 0)
  {
    PBDataWriterWriteBOOLField();
    v4 = v6;
  }
  if (self->_altDSID)
  {
    PBDataWriterWriteStringField();
    v4 = v6;
  }
  if (self->_type)
  {
    PBDataWriterWriteStringField();
    v4 = v6;
  }
  has = (char)self->_has;
  if ((has & 2) != 0)
  {
    PBDataWriterWriteBOOLField();
    v4 = v6;
    has = (char)self->_has;
  }
  if ((has & 1) != 0)
  {
    PBDataWriterWriteBOOLField();
    v4 = v6;
  }

}

- (void)copyTo:(id)a3
{
  _BYTE *v4;
  char has;
  _BYTE *v6;

  v4 = a3;
  v6 = v4;
  if (self->_identifier)
  {
    objc_msgSend(v4, "setIdentifier:");
    v4 = v6;
  }
  if (self->_username)
  {
    objc_msgSend(v6, "setUsername:");
    v4 = v6;
  }
  if (self->_dSID)
  {
    objc_msgSend(v6, "setDSID:");
    v4 = v6;
  }
  if ((*(_BYTE *)&self->_has & 4) != 0)
  {
    v4[50] = self->_authenticated;
    v4[52] |= 4u;
  }
  if (self->_altDSID)
  {
    objc_msgSend(v6, "setAltDSID:");
    v4 = v6;
  }
  if (self->_type)
  {
    objc_msgSend(v6, "setType:");
    v4 = v6;
  }
  has = (char)self->_has;
  if ((has & 2) != 0)
  {
    v4[49] = self->_aaPrimaryAccount;
    v4[52] |= 2u;
    has = (char)self->_has;
  }
  if ((has & 1) != 0)
  {
    v4[48] = self->_aaIsManaged;
    v4[52] |= 1u;
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
  char has;

  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = -[NSString copyWithZone:](self->_identifier, "copyWithZone:", a3);
  v7 = *(void **)(v5 + 24);
  *(_QWORD *)(v5 + 24) = v6;

  v8 = -[NSString copyWithZone:](self->_username, "copyWithZone:", a3);
  v9 = *(void **)(v5 + 40);
  *(_QWORD *)(v5 + 40) = v8;

  v10 = -[NSString copyWithZone:](self->_dSID, "copyWithZone:", a3);
  v11 = *(void **)(v5 + 16);
  *(_QWORD *)(v5 + 16) = v10;

  if ((*(_BYTE *)&self->_has & 4) != 0)
  {
    *(_BYTE *)(v5 + 50) = self->_authenticated;
    *(_BYTE *)(v5 + 52) |= 4u;
  }
  v12 = -[NSString copyWithZone:](self->_altDSID, "copyWithZone:", a3);
  v13 = *(void **)(v5 + 8);
  *(_QWORD *)(v5 + 8) = v12;

  v14 = -[NSString copyWithZone:](self->_type, "copyWithZone:", a3);
  v15 = *(void **)(v5 + 32);
  *(_QWORD *)(v5 + 32) = v14;

  has = (char)self->_has;
  if ((has & 2) != 0)
  {
    *(_BYTE *)(v5 + 49) = self->_aaPrimaryAccount;
    *(_BYTE *)(v5 + 52) |= 2u;
    has = (char)self->_has;
  }
  if ((has & 1) != 0)
  {
    *(_BYTE *)(v5 + 48) = self->_aaIsManaged;
    *(_BYTE *)(v5 + 52) |= 1u;
  }
  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  NSString *identifier;
  NSString *username;
  NSString *dSID;
  NSString *altDSID;
  NSString *type;
  BOOL v10;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_30;
  identifier = self->_identifier;
  if ((unint64_t)identifier | *((_QWORD *)v4 + 3))
  {
    if (!-[NSString isEqual:](identifier, "isEqual:"))
      goto LABEL_30;
  }
  username = self->_username;
  if ((unint64_t)username | *((_QWORD *)v4 + 5))
  {
    if (!-[NSString isEqual:](username, "isEqual:"))
      goto LABEL_30;
  }
  dSID = self->_dSID;
  if ((unint64_t)dSID | *((_QWORD *)v4 + 2))
  {
    if (!-[NSString isEqual:](dSID, "isEqual:"))
      goto LABEL_30;
  }
  if ((*(_BYTE *)&self->_has & 4) != 0)
  {
    if ((*((_BYTE *)v4 + 52) & 4) == 0)
      goto LABEL_30;
    if (self->_authenticated)
    {
      if (!*((_BYTE *)v4 + 50))
        goto LABEL_30;
    }
    else if (*((_BYTE *)v4 + 50))
    {
      goto LABEL_30;
    }
  }
  else if ((*((_BYTE *)v4 + 52) & 4) != 0)
  {
    goto LABEL_30;
  }
  altDSID = self->_altDSID;
  if ((unint64_t)altDSID | *((_QWORD *)v4 + 1) && !-[NSString isEqual:](altDSID, "isEqual:"))
    goto LABEL_30;
  type = self->_type;
  if ((unint64_t)type | *((_QWORD *)v4 + 4))
  {
    if (!-[NSString isEqual:](type, "isEqual:"))
      goto LABEL_30;
  }
  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
    if ((*((_BYTE *)v4 + 52) & 2) == 0)
      goto LABEL_30;
    if (self->_aaPrimaryAccount)
    {
      if (!*((_BYTE *)v4 + 49))
        goto LABEL_30;
    }
    else if (*((_BYTE *)v4 + 49))
    {
      goto LABEL_30;
    }
  }
  else if ((*((_BYTE *)v4 + 52) & 2) != 0)
  {
    goto LABEL_30;
  }
  v10 = (*((_BYTE *)v4 + 52) & 1) == 0;
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    if ((*((_BYTE *)v4 + 52) & 1) != 0)
    {
      if (self->_aaIsManaged)
      {
        if (!*((_BYTE *)v4 + 48))
          goto LABEL_30;
      }
      else if (*((_BYTE *)v4 + 48))
      {
        goto LABEL_30;
      }
      v10 = 1;
      goto LABEL_31;
    }
LABEL_30:
    v10 = 0;
  }
LABEL_31:

  return v10;
}

- (unint64_t)hash
{
  NSUInteger v3;
  NSUInteger v4;
  NSUInteger v5;
  uint64_t v6;
  NSUInteger v7;
  NSUInteger v8;
  uint64_t v9;
  uint64_t v10;

  v3 = -[NSString hash](self->_identifier, "hash");
  v4 = -[NSString hash](self->_username, "hash");
  v5 = -[NSString hash](self->_dSID, "hash");
  if ((*(_BYTE *)&self->_has & 4) != 0)
    v6 = 2654435761 * self->_authenticated;
  else
    v6 = 0;
  v7 = -[NSString hash](self->_altDSID, "hash");
  v8 = -[NSString hash](self->_type, "hash");
  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
    v9 = 2654435761 * self->_aaPrimaryAccount;
    if ((*(_BYTE *)&self->_has & 1) != 0)
      goto LABEL_6;
LABEL_8:
    v10 = 0;
    return v4 ^ v3 ^ v5 ^ v6 ^ v7 ^ v8 ^ v9 ^ v10;
  }
  v9 = 0;
  if ((*(_BYTE *)&self->_has & 1) == 0)
    goto LABEL_8;
LABEL_6:
  v10 = 2654435761 * self->_aaIsManaged;
  return v4 ^ v3 ^ v5 ^ v6 ^ v7 ^ v8 ^ v9 ^ v10;
}

- (void)mergeFrom:(id)a3
{
  BOOL *v4;
  BOOL v5;
  BOOL *v6;

  v4 = (BOOL *)a3;
  v6 = v4;
  if (*((_QWORD *)v4 + 3))
  {
    -[NSSAccountsInfoRespMsgAccountInfo setIdentifier:](self, "setIdentifier:");
    v4 = v6;
  }
  if (*((_QWORD *)v4 + 5))
  {
    -[NSSAccountsInfoRespMsgAccountInfo setUsername:](self, "setUsername:");
    v4 = v6;
  }
  if (*((_QWORD *)v4 + 2))
  {
    -[NSSAccountsInfoRespMsgAccountInfo setDSID:](self, "setDSID:");
    v4 = v6;
  }
  if ((v4[52] & 4) != 0)
  {
    self->_authenticated = v4[50];
    *(_BYTE *)&self->_has |= 4u;
  }
  if (*((_QWORD *)v4 + 1))
  {
    -[NSSAccountsInfoRespMsgAccountInfo setAltDSID:](self, "setAltDSID:");
    v4 = v6;
  }
  if (*((_QWORD *)v4 + 4))
  {
    -[NSSAccountsInfoRespMsgAccountInfo setType:](self, "setType:");
    v4 = v6;
  }
  v5 = v4[52];
  if ((v5 & 2) != 0)
  {
    self->_aaPrimaryAccount = v4[49];
    *(_BYTE *)&self->_has |= 2u;
    v5 = v4[52];
  }
  if (v5)
  {
    self->_aaIsManaged = v4[48];
    *(_BYTE *)&self->_has |= 1u;
  }

}

- (NSString)identifier
{
  return self->_identifier;
}

- (void)setIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_identifier, a3);
}

- (NSString)username
{
  return self->_username;
}

- (void)setUsername:(id)a3
{
  objc_storeStrong((id *)&self->_username, a3);
}

- (NSString)dSID
{
  return self->_dSID;
}

- (void)setDSID:(id)a3
{
  objc_storeStrong((id *)&self->_dSID, a3);
}

- (BOOL)authenticated
{
  return self->_authenticated;
}

- (NSString)altDSID
{
  return self->_altDSID;
}

- (void)setAltDSID:(id)a3
{
  objc_storeStrong((id *)&self->_altDSID, a3);
}

- (NSString)type
{
  return self->_type;
}

- (void)setType:(id)a3
{
  objc_storeStrong((id *)&self->_type, a3);
}

- (BOOL)aaPrimaryAccount
{
  return self->_aaPrimaryAccount;
}

- (BOOL)aaIsManaged
{
  return self->_aaIsManaged;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_username, 0);
  objc_storeStrong((id *)&self->_type, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_storeStrong((id *)&self->_dSID, 0);
  objc_storeStrong((id *)&self->_altDSID, 0);
}

@end
