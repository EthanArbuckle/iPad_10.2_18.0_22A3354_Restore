@implementation ACProtobufAccountType

- (BOOL)hasObjectID
{
  return self->_objectID != 0;
}

- (void)setVisibility:(int)a3
{
  *(_BYTE *)&self->_has |= 2u;
  self->_visibility = a3;
}

- (void)setHasVisibility:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFD | v3;
}

- (BOOL)hasVisibility
{
  return (*(_BYTE *)&self->_has >> 1) & 1;
}

- (BOOL)hasCredentialType
{
  return self->_credentialType != 0;
}

- (BOOL)hasCredentialProtectionPolicy
{
  return self->_credentialProtectionPolicy != 0;
}

- (void)setSupportsAuthentication:(int)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_supportsAuthentication = a3;
}

- (void)setHasSupportsAuthentication:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (BOOL)hasSupportsAuthentication
{
  return *(_BYTE *)&self->_has & 1;
}

- (void)setSupportsMultipleAccounts:(BOOL)a3
{
  *(_BYTE *)&self->_has |= 8u;
  self->_supportsMultipleAccounts = a3;
}

- (void)setHasSupportsMultipleAccounts:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 8;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xF7 | v3;
}

- (BOOL)hasSupportsMultipleAccounts
{
  return (*(_BYTE *)&self->_has >> 3) & 1;
}

- (BOOL)hasOwningBundleID
{
  return self->_owningBundleID != 0;
}

- (void)setObsolete:(BOOL)a3
{
  *(_BYTE *)&self->_has |= 4u;
  self->_obsolete = a3;
}

- (void)setHasObsolete:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 4;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFB | v3;
}

- (BOOL)hasObsolete
{
  return (*(_BYTE *)&self->_has >> 2) & 1;
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
  v8.super_class = (Class)ACProtobufAccountType;
  -[ACProtobufAccountType description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[ACProtobufAccountType dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  void *v3;
  void *v4;
  NSString *accountTypeDescription;
  NSString *identifier;
  ACProtobufURL *objectID;
  void *v8;
  void *v9;
  NSString *credentialType;
  NSString *credentialProtectionPolicy;
  char has;
  void *v13;
  void *v14;
  NSString *owningBundleID;
  void *v16;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  accountTypeDescription = self->_accountTypeDescription;
  if (accountTypeDescription)
    objc_msgSend(v3, "setObject:forKey:", accountTypeDescription, CFSTR("accountTypeDescription"));
  identifier = self->_identifier;
  if (identifier)
    objc_msgSend(v4, "setObject:forKey:", identifier, CFSTR("identifier"));
  objectID = self->_objectID;
  if (objectID)
  {
    -[ACProtobufURL dictionaryRepresentation](objectID, "dictionaryRepresentation");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v8, CFSTR("objectID"));

  }
  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", self->_visibility);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v9, CFSTR("visibility"));

  }
  credentialType = self->_credentialType;
  if (credentialType)
    objc_msgSend(v4, "setObject:forKey:", credentialType, CFSTR("credentialType"));
  credentialProtectionPolicy = self->_credentialProtectionPolicy;
  if (credentialProtectionPolicy)
    objc_msgSend(v4, "setObject:forKey:", credentialProtectionPolicy, CFSTR("credentialProtectionPolicy"));
  has = (char)self->_has;
  if ((has & 1) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", self->_supportsAuthentication);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v13, CFSTR("supportsAuthentication"));

    has = (char)self->_has;
  }
  if ((has & 8) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_supportsMultipleAccounts);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v14, CFSTR("supportsMultipleAccounts"));

  }
  owningBundleID = self->_owningBundleID;
  if (owningBundleID)
    objc_msgSend(v4, "setObject:forKey:", owningBundleID, CFSTR("owningBundleID"));
  if ((*(_BYTE *)&self->_has & 4) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_obsolete);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v16, CFSTR("obsolete"));

  }
  return v4;
}

- (BOOL)readFrom:(id)a3
{
  return ACProtobufAccountTypeReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  void *v4;
  char has;
  id v6;

  v6 = a3;
  PBDataWriterWriteStringField();
  PBDataWriterWriteStringField();
  if (self->_objectID)
    PBDataWriterWriteSubmessage();
  if ((*(_BYTE *)&self->_has & 2) != 0)
    PBDataWriterWriteInt32Field();
  v4 = v6;
  if (self->_credentialType)
  {
    PBDataWriterWriteStringField();
    v4 = v6;
  }
  if (self->_credentialProtectionPolicy)
  {
    PBDataWriterWriteStringField();
    v4 = v6;
  }
  has = (char)self->_has;
  if ((has & 1) != 0)
  {
    PBDataWriterWriteInt32Field();
    v4 = v6;
    has = (char)self->_has;
  }
  if ((has & 8) != 0)
  {
    PBDataWriterWriteBOOLField();
    v4 = v6;
  }
  if (self->_owningBundleID)
  {
    PBDataWriterWriteStringField();
    v4 = v6;
  }
  if ((*(_BYTE *)&self->_has & 4) != 0)
  {
    PBDataWriterWriteBOOLField();
    v4 = v6;
  }

}

- (void)copyTo:(id)a3
{
  _DWORD *v4;
  char has;
  id v6;

  v6 = a3;
  objc_msgSend(v6, "setAccountTypeDescription:", self->_accountTypeDescription);
  objc_msgSend(v6, "setIdentifier:", self->_identifier);
  if (self->_objectID)
    objc_msgSend(v6, "setObjectID:");
  v4 = v6;
  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
    *((_DWORD *)v6 + 15) = self->_visibility;
    *((_BYTE *)v6 + 68) |= 2u;
  }
  if (self->_credentialType)
  {
    objc_msgSend(v6, "setCredentialType:");
    v4 = v6;
  }
  if (self->_credentialProtectionPolicy)
  {
    objc_msgSend(v6, "setCredentialProtectionPolicy:");
    v4 = v6;
  }
  has = (char)self->_has;
  if ((has & 1) != 0)
  {
    v4[14] = self->_supportsAuthentication;
    *((_BYTE *)v4 + 68) |= 1u;
    has = (char)self->_has;
  }
  if ((has & 8) != 0)
  {
    *((_BYTE *)v4 + 65) = self->_supportsMultipleAccounts;
    *((_BYTE *)v4 + 68) |= 8u;
  }
  if (self->_owningBundleID)
  {
    objc_msgSend(v6, "setOwningBundleID:");
    v4 = v6;
  }
  if ((*(_BYTE *)&self->_has & 4) != 0)
  {
    *((_BYTE *)v4 + 64) = self->_obsolete;
    *((_BYTE *)v4 + 68) |= 4u;
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
  uint64_t v14;
  void *v15;
  char has;
  uint64_t v17;
  void *v18;

  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = -[NSString copyWithZone:](self->_accountTypeDescription, "copyWithZone:", a3);
  v7 = *(void **)(v5 + 8);
  *(_QWORD *)(v5 + 8) = v6;

  v8 = -[NSString copyWithZone:](self->_identifier, "copyWithZone:", a3);
  v9 = *(void **)(v5 + 32);
  *(_QWORD *)(v5 + 32) = v8;

  v10 = -[ACProtobufURL copyWithZone:](self->_objectID, "copyWithZone:", a3);
  v11 = *(void **)(v5 + 40);
  *(_QWORD *)(v5 + 40) = v10;

  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
    *(_DWORD *)(v5 + 60) = self->_visibility;
    *(_BYTE *)(v5 + 68) |= 2u;
  }
  v12 = -[NSString copyWithZone:](self->_credentialType, "copyWithZone:", a3);
  v13 = *(void **)(v5 + 24);
  *(_QWORD *)(v5 + 24) = v12;

  v14 = -[NSString copyWithZone:](self->_credentialProtectionPolicy, "copyWithZone:", a3);
  v15 = *(void **)(v5 + 16);
  *(_QWORD *)(v5 + 16) = v14;

  has = (char)self->_has;
  if ((has & 1) != 0)
  {
    *(_DWORD *)(v5 + 56) = self->_supportsAuthentication;
    *(_BYTE *)(v5 + 68) |= 1u;
    has = (char)self->_has;
  }
  if ((has & 8) != 0)
  {
    *(_BYTE *)(v5 + 65) = self->_supportsMultipleAccounts;
    *(_BYTE *)(v5 + 68) |= 8u;
  }
  v17 = -[NSString copyWithZone:](self->_owningBundleID, "copyWithZone:", a3);
  v18 = *(void **)(v5 + 48);
  *(_QWORD *)(v5 + 48) = v17;

  if ((*(_BYTE *)&self->_has & 4) != 0)
  {
    *(_BYTE *)(v5 + 64) = self->_obsolete;
    *(_BYTE *)(v5 + 68) |= 4u;
  }
  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  NSString *accountTypeDescription;
  NSString *identifier;
  ACProtobufURL *objectID;
  NSString *credentialType;
  NSString *credentialProtectionPolicy;
  char has;
  NSString *owningBundleID;
  BOOL v12;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_35;
  accountTypeDescription = self->_accountTypeDescription;
  if ((unint64_t)accountTypeDescription | *((_QWORD *)v4 + 1))
  {
    if (!-[NSString isEqual:](accountTypeDescription, "isEqual:"))
      goto LABEL_35;
  }
  identifier = self->_identifier;
  if ((unint64_t)identifier | *((_QWORD *)v4 + 4))
  {
    if (!-[NSString isEqual:](identifier, "isEqual:"))
      goto LABEL_35;
  }
  objectID = self->_objectID;
  if ((unint64_t)objectID | *((_QWORD *)v4 + 5))
  {
    if (!-[ACProtobufURL isEqual:](objectID, "isEqual:"))
      goto LABEL_35;
  }
  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
    if ((*((_BYTE *)v4 + 68) & 2) == 0 || self->_visibility != *((_DWORD *)v4 + 15))
      goto LABEL_35;
  }
  else if ((*((_BYTE *)v4 + 68) & 2) != 0)
  {
    goto LABEL_35;
  }
  credentialType = self->_credentialType;
  if ((unint64_t)credentialType | *((_QWORD *)v4 + 3)
    && !-[NSString isEqual:](credentialType, "isEqual:"))
  {
    goto LABEL_35;
  }
  credentialProtectionPolicy = self->_credentialProtectionPolicy;
  if ((unint64_t)credentialProtectionPolicy | *((_QWORD *)v4 + 2))
  {
    if (!-[NSString isEqual:](credentialProtectionPolicy, "isEqual:"))
      goto LABEL_35;
  }
  has = (char)self->_has;
  if ((has & 1) != 0)
  {
    if ((*((_BYTE *)v4 + 68) & 1) == 0 || self->_supportsAuthentication != *((_DWORD *)v4 + 14))
      goto LABEL_35;
  }
  else if ((*((_BYTE *)v4 + 68) & 1) != 0)
  {
    goto LABEL_35;
  }
  if ((*(_BYTE *)&self->_has & 8) != 0)
  {
    if ((*((_BYTE *)v4 + 68) & 8) == 0)
      goto LABEL_35;
    if (self->_supportsMultipleAccounts)
    {
      if (!*((_BYTE *)v4 + 65))
        goto LABEL_35;
    }
    else if (*((_BYTE *)v4 + 65))
    {
      goto LABEL_35;
    }
  }
  else if ((*((_BYTE *)v4 + 68) & 8) != 0)
  {
    goto LABEL_35;
  }
  owningBundleID = self->_owningBundleID;
  if ((unint64_t)owningBundleID | *((_QWORD *)v4 + 6))
  {
    if (!-[NSString isEqual:](owningBundleID, "isEqual:"))
      goto LABEL_35;
    has = (char)self->_has;
  }
  v12 = (*((_BYTE *)v4 + 68) & 4) == 0;
  if ((has & 4) != 0)
  {
    if ((*((_BYTE *)v4 + 68) & 4) != 0)
    {
      if (self->_obsolete)
      {
        if (!*((_BYTE *)v4 + 64))
          goto LABEL_35;
      }
      else if (*((_BYTE *)v4 + 64))
      {
        goto LABEL_35;
      }
      v12 = 1;
      goto LABEL_36;
    }
LABEL_35:
    v12 = 0;
  }
LABEL_36:

  return v12;
}

- (unint64_t)hash
{
  NSUInteger v3;
  unint64_t v4;
  uint64_t v5;
  NSUInteger v6;
  NSUInteger v7;
  uint64_t v8;
  uint64_t v9;
  NSUInteger v10;
  uint64_t v11;
  NSUInteger v13;

  v13 = -[NSString hash](self->_accountTypeDescription, "hash");
  v3 = -[NSString hash](self->_identifier, "hash");
  v4 = -[ACProtobufURL hash](self->_objectID, "hash");
  if ((*(_BYTE *)&self->_has & 2) != 0)
    v5 = 2654435761 * self->_visibility;
  else
    v5 = 0;
  v6 = -[NSString hash](self->_credentialType, "hash");
  v7 = -[NSString hash](self->_credentialProtectionPolicy, "hash");
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    v8 = 2654435761 * self->_supportsAuthentication;
    if ((*(_BYTE *)&self->_has & 8) != 0)
      goto LABEL_6;
  }
  else
  {
    v8 = 0;
    if ((*(_BYTE *)&self->_has & 8) != 0)
    {
LABEL_6:
      v9 = 2654435761 * self->_supportsMultipleAccounts;
      goto LABEL_9;
    }
  }
  v9 = 0;
LABEL_9:
  v10 = -[NSString hash](self->_owningBundleID, "hash");
  if ((*(_BYTE *)&self->_has & 4) != 0)
    v11 = 2654435761 * self->_obsolete;
  else
    v11 = 0;
  return v3 ^ v13 ^ v4 ^ v5 ^ v6 ^ v7 ^ v8 ^ v9 ^ v10 ^ v11;
}

- (void)mergeFrom:(id)a3
{
  id v4;
  ACProtobufURL *objectID;
  uint64_t v6;
  char v7;
  id v8;

  v4 = a3;
  v8 = v4;
  if (*((_QWORD *)v4 + 1))
  {
    -[ACProtobufAccountType setAccountTypeDescription:](self, "setAccountTypeDescription:");
    v4 = v8;
  }
  if (*((_QWORD *)v4 + 4))
  {
    -[ACProtobufAccountType setIdentifier:](self, "setIdentifier:");
    v4 = v8;
  }
  objectID = self->_objectID;
  v6 = *((_QWORD *)v4 + 5);
  if (objectID)
  {
    if (!v6)
      goto LABEL_11;
    -[ACProtobufURL mergeFrom:](objectID, "mergeFrom:");
  }
  else
  {
    if (!v6)
      goto LABEL_11;
    -[ACProtobufAccountType setObjectID:](self, "setObjectID:");
  }
  v4 = v8;
LABEL_11:
  if ((*((_BYTE *)v4 + 68) & 2) != 0)
  {
    self->_visibility = *((_DWORD *)v4 + 15);
    *(_BYTE *)&self->_has |= 2u;
  }
  if (*((_QWORD *)v4 + 3))
  {
    -[ACProtobufAccountType setCredentialType:](self, "setCredentialType:");
    v4 = v8;
  }
  if (*((_QWORD *)v4 + 2))
  {
    -[ACProtobufAccountType setCredentialProtectionPolicy:](self, "setCredentialProtectionPolicy:");
    v4 = v8;
  }
  v7 = *((_BYTE *)v4 + 68);
  if ((v7 & 1) != 0)
  {
    self->_supportsAuthentication = *((_DWORD *)v4 + 14);
    *(_BYTE *)&self->_has |= 1u;
    v7 = *((_BYTE *)v4 + 68);
  }
  if ((v7 & 8) != 0)
  {
    self->_supportsMultipleAccounts = *((_BYTE *)v4 + 65);
    *(_BYTE *)&self->_has |= 8u;
  }
  if (*((_QWORD *)v4 + 6))
  {
    -[ACProtobufAccountType setOwningBundleID:](self, "setOwningBundleID:");
    v4 = v8;
  }
  if ((*((_BYTE *)v4 + 68) & 4) != 0)
  {
    self->_obsolete = *((_BYTE *)v4 + 64);
    *(_BYTE *)&self->_has |= 4u;
  }

}

- (NSString)accountTypeDescription
{
  return self->_accountTypeDescription;
}

- (void)setAccountTypeDescription:(id)a3
{
  objc_storeStrong((id *)&self->_accountTypeDescription, a3);
}

- (NSString)identifier
{
  return self->_identifier;
}

- (void)setIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_identifier, a3);
}

- (ACProtobufURL)objectID
{
  return self->_objectID;
}

- (void)setObjectID:(id)a3
{
  objc_storeStrong((id *)&self->_objectID, a3);
}

- (int)visibility
{
  return self->_visibility;
}

- (NSString)credentialType
{
  return self->_credentialType;
}

- (void)setCredentialType:(id)a3
{
  objc_storeStrong((id *)&self->_credentialType, a3);
}

- (NSString)credentialProtectionPolicy
{
  return self->_credentialProtectionPolicy;
}

- (void)setCredentialProtectionPolicy:(id)a3
{
  objc_storeStrong((id *)&self->_credentialProtectionPolicy, a3);
}

- (int)supportsAuthentication
{
  return self->_supportsAuthentication;
}

- (BOOL)supportsMultipleAccounts
{
  return self->_supportsMultipleAccounts;
}

- (NSString)owningBundleID
{
  return self->_owningBundleID;
}

- (void)setOwningBundleID:(id)a3
{
  objc_storeStrong((id *)&self->_owningBundleID, a3);
}

- (BOOL)obsolete
{
  return self->_obsolete;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_owningBundleID, 0);
  objc_storeStrong((id *)&self->_objectID, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_storeStrong((id *)&self->_credentialType, 0);
  objc_storeStrong((id *)&self->_credentialProtectionPolicy, 0);
  objc_storeStrong((id *)&self->_accountTypeDescription, 0);
}

@end
