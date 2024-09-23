@implementation HDCodableFHIRCredential

- (BOOL)hasIdentifier
{
  return self->_identifier != 0;
}

- (BOOL)hasAccountSyncIdentifier
{
  return self->_accountSyncIdentifier != 0;
}

- (BOOL)hasScopeString
{
  return self->_scopeString != 0;
}

- (BOOL)hasRequestedScopeString
{
  return self->_requestedScopeString != 0;
}

- (BOOL)hasPatientID
{
  return self->_patientID != 0;
}

- (void)setReceivedDate:(double)a3
{
  *(_BYTE *)&self->_has |= 2u;
  self->_receivedDate = a3;
}

- (void)setHasReceivedDate:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFD | v3;
}

- (BOOL)hasReceivedDate
{
  return (*(_BYTE *)&self->_has >> 1) & 1;
}

- (void)setExpirationDate:(double)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_expirationDate = a3;
}

- (void)setHasExpirationDate:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (BOOL)hasExpirationDate
{
  return *(_BYTE *)&self->_has & 1;
}

- (void)setDeleted:(BOOL)a3
{
  *(_BYTE *)&self->_has |= 4u;
  self->_deleted = a3;
}

- (void)setHasDeleted:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 4;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFB | v3;
}

- (BOOL)hasDeleted
{
  return (*(_BYTE *)&self->_has >> 2) & 1;
}

- (BOOL)hasMessageVersion
{
  return self->_messageVersion != 0;
}

- (BOOL)hasSyncIdentity
{
  return self->_syncIdentity != 0;
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
  v8.super_class = (Class)HDCodableFHIRCredential;
  -[HDCodableFHIRCredential description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[HDCodableFHIRCredential dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  void *v3;
  void *v4;
  NSData *identifier;
  NSData *accountSyncIdentifier;
  NSString *scopeString;
  NSString *requestedScopeString;
  NSString *patientID;
  char has;
  void *v11;
  HDCodableMessageVersion *messageVersion;
  void *v13;
  HDCodableSyncIdentity *syncIdentity;
  void *v15;
  void *v17;
  void *v18;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  identifier = self->_identifier;
  if (identifier)
    objc_msgSend(v3, "setObject:forKey:", identifier, CFSTR("identifier"));
  accountSyncIdentifier = self->_accountSyncIdentifier;
  if (accountSyncIdentifier)
    objc_msgSend(v4, "setObject:forKey:", accountSyncIdentifier, CFSTR("accountSyncIdentifier"));
  scopeString = self->_scopeString;
  if (scopeString)
    objc_msgSend(v4, "setObject:forKey:", scopeString, CFSTR("scopeString"));
  requestedScopeString = self->_requestedScopeString;
  if (requestedScopeString)
    objc_msgSend(v4, "setObject:forKey:", requestedScopeString, CFSTR("requestedScopeString"));
  patientID = self->_patientID;
  if (patientID)
    objc_msgSend(v4, "setObject:forKey:", patientID, CFSTR("patientID"));
  has = (char)self->_has;
  if ((has & 2) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->_receivedDate);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v17, CFSTR("receivedDate"));

    has = (char)self->_has;
    if ((has & 1) == 0)
    {
LABEL_13:
      if ((has & 4) == 0)
        goto LABEL_15;
      goto LABEL_14;
    }
  }
  else if ((*(_BYTE *)&self->_has & 1) == 0)
  {
    goto LABEL_13;
  }
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->_expirationDate);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKey:", v18, CFSTR("expirationDate"));

  if ((*(_BYTE *)&self->_has & 4) != 0)
  {
LABEL_14:
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_deleted);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v11, CFSTR("deleted"));

  }
LABEL_15:
  messageVersion = self->_messageVersion;
  if (messageVersion)
  {
    -[HDCodableMessageVersion dictionaryRepresentation](messageVersion, "dictionaryRepresentation");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v13, CFSTR("messageVersion"));

  }
  syncIdentity = self->_syncIdentity;
  if (syncIdentity)
  {
    -[HDCodableSyncIdentity dictionaryRepresentation](syncIdentity, "dictionaryRepresentation");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v15, CFSTR("syncIdentity"));

  }
  return v4;
}

- (BOOL)readFrom:(id)a3
{
  return HDCodableFHIRCredentialReadFrom((uint64_t)self, (uint64_t)a3);
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
    PBDataWriterWriteDataField();
    v4 = v6;
  }
  if (self->_accountSyncIdentifier)
  {
    PBDataWriterWriteDataField();
    v4 = v6;
  }
  if (self->_scopeString)
  {
    PBDataWriterWriteStringField();
    v4 = v6;
  }
  if (self->_requestedScopeString)
  {
    PBDataWriterWriteStringField();
    v4 = v6;
  }
  if (self->_patientID)
  {
    PBDataWriterWriteStringField();
    v4 = v6;
  }
  has = (char)self->_has;
  if ((has & 2) != 0)
  {
    PBDataWriterWriteDoubleField();
    v4 = v6;
    has = (char)self->_has;
    if ((has & 1) == 0)
    {
LABEL_13:
      if ((has & 4) == 0)
        goto LABEL_15;
      goto LABEL_14;
    }
  }
  else if ((*(_BYTE *)&self->_has & 1) == 0)
  {
    goto LABEL_13;
  }
  PBDataWriterWriteDoubleField();
  v4 = v6;
  if ((*(_BYTE *)&self->_has & 4) != 0)
  {
LABEL_14:
    PBDataWriterWriteBOOLField();
    v4 = v6;
  }
LABEL_15:
  if (self->_messageVersion)
  {
    PBDataWriterWriteSubmessage();
    v4 = v6;
  }
  if (self->_syncIdentity)
  {
    PBDataWriterWriteSubmessage();
    v4 = v6;
  }

}

- (void)copyTo:(id)a3
{
  id v4;
  char has;
  id v6;

  v4 = a3;
  v6 = v4;
  if (self->_identifier)
  {
    objc_msgSend(v4, "setIdentifier:");
    v4 = v6;
  }
  if (self->_accountSyncIdentifier)
  {
    objc_msgSend(v6, "setAccountSyncIdentifier:");
    v4 = v6;
  }
  if (self->_scopeString)
  {
    objc_msgSend(v6, "setScopeString:");
    v4 = v6;
  }
  if (self->_requestedScopeString)
  {
    objc_msgSend(v6, "setRequestedScopeString:");
    v4 = v6;
  }
  if (self->_patientID)
  {
    objc_msgSend(v6, "setPatientID:");
    v4 = v6;
  }
  has = (char)self->_has;
  if ((has & 2) != 0)
  {
    *((_QWORD *)v4 + 2) = *(_QWORD *)&self->_receivedDate;
    *((_BYTE *)v4 + 84) |= 2u;
    has = (char)self->_has;
    if ((has & 1) == 0)
    {
LABEL_13:
      if ((has & 4) == 0)
        goto LABEL_15;
      goto LABEL_14;
    }
  }
  else if ((*(_BYTE *)&self->_has & 1) == 0)
  {
    goto LABEL_13;
  }
  *((_QWORD *)v4 + 1) = *(_QWORD *)&self->_expirationDate;
  *((_BYTE *)v4 + 84) |= 1u;
  if ((*(_BYTE *)&self->_has & 4) != 0)
  {
LABEL_14:
    *((_BYTE *)v4 + 80) = self->_deleted;
    *((_BYTE *)v4 + 84) |= 4u;
  }
LABEL_15:
  if (self->_messageVersion)
  {
    objc_msgSend(v6, "setMessageVersion:");
    v4 = v6;
  }
  if (self->_syncIdentity)
  {
    objc_msgSend(v6, "setSyncIdentity:");
    v4 = v6;
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
  id v17;
  void *v18;
  id v19;
  void *v20;

  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = -[NSData copyWithZone:](self->_identifier, "copyWithZone:", a3);
  v7 = *(void **)(v5 + 32);
  *(_QWORD *)(v5 + 32) = v6;

  v8 = -[NSData copyWithZone:](self->_accountSyncIdentifier, "copyWithZone:", a3);
  v9 = *(void **)(v5 + 24);
  *(_QWORD *)(v5 + 24) = v8;

  v10 = -[NSString copyWithZone:](self->_scopeString, "copyWithZone:", a3);
  v11 = *(void **)(v5 + 64);
  *(_QWORD *)(v5 + 64) = v10;

  v12 = -[NSString copyWithZone:](self->_requestedScopeString, "copyWithZone:", a3);
  v13 = *(void **)(v5 + 56);
  *(_QWORD *)(v5 + 56) = v12;

  v14 = -[NSString copyWithZone:](self->_patientID, "copyWithZone:", a3);
  v15 = *(void **)(v5 + 48);
  *(_QWORD *)(v5 + 48) = v14;

  has = (char)self->_has;
  if ((has & 2) == 0)
  {
    if ((*(_BYTE *)&self->_has & 1) == 0)
      goto LABEL_3;
LABEL_7:
    *(double *)(v5 + 8) = self->_expirationDate;
    *(_BYTE *)(v5 + 84) |= 1u;
    if ((*(_BYTE *)&self->_has & 4) == 0)
      goto LABEL_5;
    goto LABEL_4;
  }
  *(double *)(v5 + 16) = self->_receivedDate;
  *(_BYTE *)(v5 + 84) |= 2u;
  has = (char)self->_has;
  if ((has & 1) != 0)
    goto LABEL_7;
LABEL_3:
  if ((has & 4) != 0)
  {
LABEL_4:
    *(_BYTE *)(v5 + 80) = self->_deleted;
    *(_BYTE *)(v5 + 84) |= 4u;
  }
LABEL_5:
  v17 = -[HDCodableMessageVersion copyWithZone:](self->_messageVersion, "copyWithZone:", a3);
  v18 = *(void **)(v5 + 40);
  *(_QWORD *)(v5 + 40) = v17;

  v19 = -[HDCodableSyncIdentity copyWithZone:](self->_syncIdentity, "copyWithZone:", a3);
  v20 = *(void **)(v5 + 72);
  *(_QWORD *)(v5 + 72) = v19;

  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  NSData *identifier;
  NSData *accountSyncIdentifier;
  NSString *scopeString;
  NSString *requestedScopeString;
  NSString *patientID;
  HDCodableMessageVersion *messageVersion;
  HDCodableSyncIdentity *syncIdentity;
  char v12;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_34;
  identifier = self->_identifier;
  if ((unint64_t)identifier | *((_QWORD *)v4 + 4))
  {
    if (!-[NSData isEqual:](identifier, "isEqual:"))
      goto LABEL_34;
  }
  accountSyncIdentifier = self->_accountSyncIdentifier;
  if ((unint64_t)accountSyncIdentifier | *((_QWORD *)v4 + 3))
  {
    if (!-[NSData isEqual:](accountSyncIdentifier, "isEqual:"))
      goto LABEL_34;
  }
  scopeString = self->_scopeString;
  if ((unint64_t)scopeString | *((_QWORD *)v4 + 8))
  {
    if (!-[NSString isEqual:](scopeString, "isEqual:"))
      goto LABEL_34;
  }
  requestedScopeString = self->_requestedScopeString;
  if ((unint64_t)requestedScopeString | *((_QWORD *)v4 + 7))
  {
    if (!-[NSString isEqual:](requestedScopeString, "isEqual:"))
      goto LABEL_34;
  }
  patientID = self->_patientID;
  if ((unint64_t)patientID | *((_QWORD *)v4 + 6))
  {
    if (!-[NSString isEqual:](patientID, "isEqual:"))
      goto LABEL_34;
  }
  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
    if ((*((_BYTE *)v4 + 84) & 2) == 0 || self->_receivedDate != *((double *)v4 + 2))
      goto LABEL_34;
  }
  else if ((*((_BYTE *)v4 + 84) & 2) != 0)
  {
    goto LABEL_34;
  }
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    if ((*((_BYTE *)v4 + 84) & 1) == 0 || self->_expirationDate != *((double *)v4 + 1))
      goto LABEL_34;
  }
  else if ((*((_BYTE *)v4 + 84) & 1) != 0)
  {
    goto LABEL_34;
  }
  if ((*(_BYTE *)&self->_has & 4) != 0)
  {
    if ((*((_BYTE *)v4 + 84) & 4) != 0)
    {
      if (self->_deleted)
      {
        if (!*((_BYTE *)v4 + 80))
          goto LABEL_34;
        goto LABEL_30;
      }
      if (!*((_BYTE *)v4 + 80))
        goto LABEL_30;
    }
LABEL_34:
    v12 = 0;
    goto LABEL_35;
  }
  if ((*((_BYTE *)v4 + 84) & 4) != 0)
    goto LABEL_34;
LABEL_30:
  messageVersion = self->_messageVersion;
  if ((unint64_t)messageVersion | *((_QWORD *)v4 + 5)
    && !-[HDCodableMessageVersion isEqual:](messageVersion, "isEqual:"))
  {
    goto LABEL_34;
  }
  syncIdentity = self->_syncIdentity;
  if ((unint64_t)syncIdentity | *((_QWORD *)v4 + 9))
    v12 = -[HDCodableSyncIdentity isEqual:](syncIdentity, "isEqual:");
  else
    v12 = 1;
LABEL_35:

  return v12;
}

- (unint64_t)hash
{
  uint64_t v3;
  uint64_t v4;
  NSUInteger v5;
  NSUInteger v6;
  NSUInteger v7;
  char has;
  unint64_t v9;
  double receivedDate;
  double v11;
  long double v12;
  double v13;
  unint64_t v14;
  double expirationDate;
  double v16;
  long double v17;
  double v18;
  uint64_t v19;
  NSUInteger v20;
  unint64_t v21;

  v3 = -[NSData hash](self->_identifier, "hash");
  v4 = -[NSData hash](self->_accountSyncIdentifier, "hash");
  v5 = -[NSString hash](self->_scopeString, "hash");
  v6 = -[NSString hash](self->_requestedScopeString, "hash");
  v7 = -[NSString hash](self->_patientID, "hash");
  has = (char)self->_has;
  if ((has & 2) != 0)
  {
    receivedDate = self->_receivedDate;
    v11 = -receivedDate;
    if (receivedDate >= 0.0)
      v11 = self->_receivedDate;
    v12 = floor(v11 + 0.5);
    v13 = (v11 - v12) * 1.84467441e19;
    v9 = 2654435761u * (unint64_t)fmod(v12, 1.84467441e19);
    if (v13 >= 0.0)
    {
      if (v13 > 0.0)
        v9 += (unint64_t)v13;
    }
    else
    {
      v9 -= (unint64_t)fabs(v13);
    }
  }
  else
  {
    v9 = 0;
  }
  if ((has & 1) != 0)
  {
    expirationDate = self->_expirationDate;
    v16 = -expirationDate;
    if (expirationDate >= 0.0)
      v16 = self->_expirationDate;
    v17 = floor(v16 + 0.5);
    v18 = (v16 - v17) * 1.84467441e19;
    v14 = 2654435761u * (unint64_t)fmod(v17, 1.84467441e19);
    if (v18 >= 0.0)
    {
      if (v18 > 0.0)
        v14 += (unint64_t)v18;
    }
    else
    {
      v14 -= (unint64_t)fabs(v18);
    }
  }
  else
  {
    v14 = 0;
  }
  if ((has & 4) != 0)
    v19 = 2654435761 * self->_deleted;
  else
    v19 = 0;
  v20 = v4 ^ v3 ^ v5 ^ v6 ^ v7 ^ v9 ^ v14;
  v21 = v19 ^ -[HDCodableMessageVersion hash](self->_messageVersion, "hash");
  return v20 ^ v21 ^ -[HDCodableSyncIdentity hash](self->_syncIdentity, "hash");
}

- (void)mergeFrom:(id)a3
{
  id v4;
  char v5;
  HDCodableMessageVersion *messageVersion;
  uint64_t v7;
  HDCodableSyncIdentity *syncIdentity;
  uint64_t v9;
  id v10;

  v4 = a3;
  v10 = v4;
  if (*((_QWORD *)v4 + 4))
  {
    -[HDCodableFHIRCredential setIdentifier:](self, "setIdentifier:");
    v4 = v10;
  }
  if (*((_QWORD *)v4 + 3))
  {
    -[HDCodableFHIRCredential setAccountSyncIdentifier:](self, "setAccountSyncIdentifier:");
    v4 = v10;
  }
  if (*((_QWORD *)v4 + 8))
  {
    -[HDCodableFHIRCredential setScopeString:](self, "setScopeString:");
    v4 = v10;
  }
  if (*((_QWORD *)v4 + 7))
  {
    -[HDCodableFHIRCredential setRequestedScopeString:](self, "setRequestedScopeString:");
    v4 = v10;
  }
  if (*((_QWORD *)v4 + 6))
  {
    -[HDCodableFHIRCredential setPatientID:](self, "setPatientID:");
    v4 = v10;
  }
  v5 = *((_BYTE *)v4 + 84);
  if ((v5 & 2) != 0)
  {
    self->_receivedDate = *((double *)v4 + 2);
    *(_BYTE *)&self->_has |= 2u;
    v5 = *((_BYTE *)v4 + 84);
    if ((v5 & 1) == 0)
    {
LABEL_13:
      if ((v5 & 4) == 0)
        goto LABEL_15;
      goto LABEL_14;
    }
  }
  else if ((*((_BYTE *)v4 + 84) & 1) == 0)
  {
    goto LABEL_13;
  }
  self->_expirationDate = *((double *)v4 + 1);
  *(_BYTE *)&self->_has |= 1u;
  if ((*((_BYTE *)v4 + 84) & 4) != 0)
  {
LABEL_14:
    self->_deleted = *((_BYTE *)v4 + 80);
    *(_BYTE *)&self->_has |= 4u;
  }
LABEL_15:
  messageVersion = self->_messageVersion;
  v7 = *((_QWORD *)v4 + 5);
  if (messageVersion)
  {
    if (!v7)
      goto LABEL_24;
    -[HDCodableMessageVersion mergeFrom:](messageVersion, "mergeFrom:");
  }
  else
  {
    if (!v7)
      goto LABEL_24;
    -[HDCodableFHIRCredential setMessageVersion:](self, "setMessageVersion:");
  }
  v4 = v10;
LABEL_24:
  syncIdentity = self->_syncIdentity;
  v9 = *((_QWORD *)v4 + 9);
  if (syncIdentity)
  {
    if (v9)
    {
      -[HDCodableSyncIdentity mergeFrom:](syncIdentity, "mergeFrom:");
LABEL_29:
      v4 = v10;
    }
  }
  else if (v9)
  {
    -[HDCodableFHIRCredential setSyncIdentity:](self, "setSyncIdentity:");
    goto LABEL_29;
  }

}

- (NSData)identifier
{
  return self->_identifier;
}

- (void)setIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_identifier, a3);
}

- (NSData)accountSyncIdentifier
{
  return self->_accountSyncIdentifier;
}

- (void)setAccountSyncIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_accountSyncIdentifier, a3);
}

- (NSString)scopeString
{
  return self->_scopeString;
}

- (void)setScopeString:(id)a3
{
  objc_storeStrong((id *)&self->_scopeString, a3);
}

- (NSString)requestedScopeString
{
  return self->_requestedScopeString;
}

- (void)setRequestedScopeString:(id)a3
{
  objc_storeStrong((id *)&self->_requestedScopeString, a3);
}

- (NSString)patientID
{
  return self->_patientID;
}

- (void)setPatientID:(id)a3
{
  objc_storeStrong((id *)&self->_patientID, a3);
}

- (double)receivedDate
{
  return self->_receivedDate;
}

- (double)expirationDate
{
  return self->_expirationDate;
}

- (BOOL)deleted
{
  return self->_deleted;
}

- (HDCodableMessageVersion)messageVersion
{
  return self->_messageVersion;
}

- (void)setMessageVersion:(id)a3
{
  objc_storeStrong((id *)&self->_messageVersion, a3);
}

- (HDCodableSyncIdentity)syncIdentity
{
  return self->_syncIdentity;
}

- (void)setSyncIdentity:(id)a3
{
  objc_storeStrong((id *)&self->_syncIdentity, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_syncIdentity, 0);
  objc_storeStrong((id *)&self->_scopeString, 0);
  objc_storeStrong((id *)&self->_requestedScopeString, 0);
  objc_storeStrong((id *)&self->_patientID, 0);
  objc_storeStrong((id *)&self->_messageVersion, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_storeStrong((id *)&self->_accountSyncIdentifier, 0);
}

@end
