@implementation HDCodableClinicalAccount

- (BOOL)hasGatewayExternalID
{
  return self->_gatewayExternalID != 0;
}

- (void)setUserEnabled:(BOOL)a3
{
  *(_WORD *)&self->_has |= 0x400u;
  self->_userEnabled = a3;
}

- (void)setHasUserEnabled:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 1024;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFBFF | v3;
}

- (BOOL)hasUserEnabled
{
  return (*(_WORD *)&self->_has >> 10) & 1;
}

- (void)setCreationDate:(double)a3
{
  *(_WORD *)&self->_has |= 0x10u;
  self->_creationDate = a3;
}

- (void)setHasCreationDate:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 16;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFEF | v3;
}

- (BOOL)hasCreationDate
{
  return (*(_WORD *)&self->_has >> 4) & 1;
}

- (void)setModificationDate:(double)a3
{
  *(_WORD *)&self->_has |= 0x200u;
  self->_modificationDate = a3;
}

- (void)setHasModificationDate:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 512;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFDFF | v3;
}

- (BOOL)hasModificationDate
{
  return (*(_WORD *)&self->_has >> 9) & 1;
}

- (void)setLastFetchDate:(double)a3
{
  *(_WORD *)&self->_has |= 0x80u;
  self->_lastFetchDate = a3;
}

- (void)setHasLastFetchDate:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 128;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFF7F | v3;
}

- (BOOL)hasLastFetchDate
{
  return (*(_WORD *)&self->_has >> 7) & 1;
}

- (BOOL)hasSyncIdentifier
{
  return self->_syncIdentifier != 0;
}

- (void)setLastFullFetchDate:(double)a3
{
  *(_WORD *)&self->_has |= 0x100u;
  self->_lastFullFetchDate = a3;
}

- (void)setHasLastFullFetchDate:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 256;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFEFF | v3;
}

- (BOOL)hasLastFullFetchDate
{
  return HIBYTE(*(_WORD *)&self->_has) & 1;
}

- (BOOL)hasAccountIdentifier
{
  return self->_accountIdentifier != 0;
}

- (BOOL)hasPatientHash
{
  return self->_patientHash != 0;
}

- (BOOL)hasMessageVersion
{
  return self->_messageVersion != 0;
}

- (BOOL)hasSignedClinicalDataIssuerIdentifier
{
  return self->_signedClinicalDataIssuerIdentifier != 0;
}

- (void)setClinicalSharingFirstSharedDate:(double)a3
{
  *(_WORD *)&self->_has |= 1u;
  self->_clinicalSharingFirstSharedDate = a3;
}

- (void)setHasClinicalSharingFirstSharedDate:(BOOL)a3
{
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFFE | a3;
}

- (BOOL)hasClinicalSharingFirstSharedDate
{
  return *(_WORD *)&self->_has & 1;
}

- (void)setClinicalSharingLastSharedDate:(double)a3
{
  *(_WORD *)&self->_has |= 2u;
  self->_clinicalSharingLastSharedDate = a3;
}

- (void)setHasClinicalSharingLastSharedDate:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFFD | v3;
}

- (BOOL)hasClinicalSharingLastSharedDate
{
  return (*(_WORD *)&self->_has >> 1) & 1;
}

- (void)setClinicalSharingUserStatus:(int64_t)a3
{
  *(_WORD *)&self->_has |= 8u;
  self->_clinicalSharingUserStatus = a3;
}

- (void)setHasClinicalSharingUserStatus:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 8;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFF7 | v3;
}

- (BOOL)hasClinicalSharingUserStatus
{
  return (*(_WORD *)&self->_has >> 3) & 1;
}

- (void)setClinicalSharingMultiDeviceStatus:(int64_t)a3
{
  *(_WORD *)&self->_has |= 4u;
  self->_clinicalSharingMultiDeviceStatus = a3;
}

- (void)setHasClinicalSharingMultiDeviceStatus:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 4;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFFB | v3;
}

- (BOOL)hasClinicalSharingMultiDeviceStatus
{
  return (*(_WORD *)&self->_has >> 2) & 1;
}

- (BOOL)hasClinicalSharingPrimaryDeviceName
{
  return self->_clinicalSharingPrimaryDeviceName != 0;
}

- (void)setLastFailedFetchDate:(double)a3
{
  *(_WORD *)&self->_has |= 0x40u;
  self->_lastFailedFetchDate = a3;
}

- (void)setHasLastFailedFetchDate:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 64;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFBF | v3;
}

- (BOOL)hasLastFailedFetchDate
{
  return (*(_WORD *)&self->_has >> 6) & 1;
}

- (void)setFailedFetchAttemptsCount:(int64_t)a3
{
  *(_WORD *)&self->_has |= 0x20u;
  self->_failedFetchAttemptsCount = a3;
}

- (void)setHasFailedFetchAttemptsCount:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 32;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFDF | v3;
}

- (BOOL)hasFailedFetchAttemptsCount
{
  return (*(_WORD *)&self->_has >> 5) & 1;
}

- (BOOL)hasCredentialSyncIdentifier
{
  return self->_credentialSyncIdentifier != 0;
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
  v8.super_class = (Class)HDCodableClinicalAccount;
  -[HDCodableClinicalAccount description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[HDCodableClinicalAccount dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  void *v3;
  void *v4;
  NSString *gatewayExternalID;
  __int16 has;
  void *v7;
  NSData *syncIdentifier;
  void *v9;
  NSString *accountIdentifier;
  NSString *patientHash;
  HDCodableMessageVersion *messageVersion;
  void *v13;
  NSString *signedClinicalDataIssuerIdentifier;
  __int16 v15;
  void *v16;
  NSString *clinicalSharingPrimaryDeviceName;
  __int16 v18;
  void *v19;
  void *v20;
  NSData *credentialSyncIdentifier;
  HDCodableSyncIdentity *syncIdentity;
  void *v23;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  gatewayExternalID = self->_gatewayExternalID;
  if (gatewayExternalID)
    objc_msgSend(v3, "setObject:forKey:", gatewayExternalID, CFSTR("gatewayExternalID"));
  has = (__int16)self->_has;
  if ((has & 0x400) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_userEnabled);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v25, CFSTR("userEnabled"));

    has = (__int16)self->_has;
    if ((has & 0x10) == 0)
    {
LABEL_5:
      if ((has & 0x200) == 0)
        goto LABEL_6;
      goto LABEL_38;
    }
  }
  else if ((has & 0x10) == 0)
  {
    goto LABEL_5;
  }
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->_creationDate);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKey:", v26, CFSTR("creationDate"));

  has = (__int16)self->_has;
  if ((has & 0x200) == 0)
  {
LABEL_6:
    if ((has & 0x80) == 0)
      goto LABEL_8;
    goto LABEL_7;
  }
LABEL_38:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->_modificationDate);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKey:", v27, CFSTR("modificationDate"));

  if ((*(_WORD *)&self->_has & 0x80) != 0)
  {
LABEL_7:
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->_lastFetchDate);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v7, CFSTR("lastFetchDate"));

  }
LABEL_8:
  syncIdentifier = self->_syncIdentifier;
  if (syncIdentifier)
    objc_msgSend(v4, "setObject:forKey:", syncIdentifier, CFSTR("syncIdentifier"));
  if ((*(_WORD *)&self->_has & 0x100) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->_lastFullFetchDate);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v9, CFSTR("lastFullFetchDate"));

  }
  accountIdentifier = self->_accountIdentifier;
  if (accountIdentifier)
    objc_msgSend(v4, "setObject:forKey:", accountIdentifier, CFSTR("accountIdentifier"));
  patientHash = self->_patientHash;
  if (patientHash)
    objc_msgSend(v4, "setObject:forKey:", patientHash, CFSTR("patientHash"));
  messageVersion = self->_messageVersion;
  if (messageVersion)
  {
    -[HDCodableMessageVersion dictionaryRepresentation](messageVersion, "dictionaryRepresentation");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v13, CFSTR("messageVersion"));

  }
  signedClinicalDataIssuerIdentifier = self->_signedClinicalDataIssuerIdentifier;
  if (signedClinicalDataIssuerIdentifier)
    objc_msgSend(v4, "setObject:forKey:", signedClinicalDataIssuerIdentifier, CFSTR("signedClinicalDataIssuerIdentifier"));
  v15 = (__int16)self->_has;
  if ((v15 & 1) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->_clinicalSharingFirstSharedDate);
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v28, CFSTR("clinicalSharingFirstSharedDate"));

    v15 = (__int16)self->_has;
    if ((v15 & 2) == 0)
    {
LABEL_22:
      if ((v15 & 8) == 0)
        goto LABEL_23;
      goto LABEL_42;
    }
  }
  else if ((v15 & 2) == 0)
  {
    goto LABEL_22;
  }
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->_clinicalSharingLastSharedDate);
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKey:", v29, CFSTR("clinicalSharingLastSharedDate"));

  v15 = (__int16)self->_has;
  if ((v15 & 8) == 0)
  {
LABEL_23:
    if ((v15 & 4) == 0)
      goto LABEL_25;
    goto LABEL_24;
  }
LABEL_42:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", self->_clinicalSharingUserStatus);
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKey:", v30, CFSTR("clinicalSharingUserStatus"));

  if ((*(_WORD *)&self->_has & 4) != 0)
  {
LABEL_24:
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", self->_clinicalSharingMultiDeviceStatus);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v16, CFSTR("clinicalSharingMultiDeviceStatus"));

  }
LABEL_25:
  clinicalSharingPrimaryDeviceName = self->_clinicalSharingPrimaryDeviceName;
  if (clinicalSharingPrimaryDeviceName)
    objc_msgSend(v4, "setObject:forKey:", clinicalSharingPrimaryDeviceName, CFSTR("clinicalSharingPrimaryDeviceName"));
  v18 = (__int16)self->_has;
  if ((v18 & 0x40) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->_lastFailedFetchDate);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v19, CFSTR("lastFailedFetchDate"));

    v18 = (__int16)self->_has;
  }
  if ((v18 & 0x20) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", self->_failedFetchAttemptsCount);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v20, CFSTR("failedFetchAttemptsCount"));

  }
  credentialSyncIdentifier = self->_credentialSyncIdentifier;
  if (credentialSyncIdentifier)
    objc_msgSend(v4, "setObject:forKey:", credentialSyncIdentifier, CFSTR("credentialSyncIdentifier"));
  syncIdentity = self->_syncIdentity;
  if (syncIdentity)
  {
    -[HDCodableSyncIdentity dictionaryRepresentation](syncIdentity, "dictionaryRepresentation");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v23, CFSTR("syncIdentity"));

  }
  return v4;
}

- (BOOL)readFrom:(id)a3
{
  return HDCodableClinicalAccountReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4;
  __int16 has;
  __int16 v6;
  __int16 v7;
  id v8;

  v4 = a3;
  v8 = v4;
  if (self->_gatewayExternalID)
  {
    PBDataWriterWriteStringField();
    v4 = v8;
  }
  has = (__int16)self->_has;
  if ((has & 0x400) != 0)
  {
    PBDataWriterWriteBOOLField();
    v4 = v8;
    has = (__int16)self->_has;
    if ((has & 0x10) == 0)
    {
LABEL_5:
      if ((has & 0x200) == 0)
        goto LABEL_6;
      goto LABEL_38;
    }
  }
  else if ((has & 0x10) == 0)
  {
    goto LABEL_5;
  }
  PBDataWriterWriteDoubleField();
  v4 = v8;
  has = (__int16)self->_has;
  if ((has & 0x200) == 0)
  {
LABEL_6:
    if ((has & 0x80) == 0)
      goto LABEL_8;
    goto LABEL_7;
  }
LABEL_38:
  PBDataWriterWriteDoubleField();
  v4 = v8;
  if ((*(_WORD *)&self->_has & 0x80) != 0)
  {
LABEL_7:
    PBDataWriterWriteDoubleField();
    v4 = v8;
  }
LABEL_8:
  if (self->_syncIdentifier)
  {
    PBDataWriterWriteDataField();
    v4 = v8;
  }
  if ((*(_WORD *)&self->_has & 0x100) != 0)
  {
    PBDataWriterWriteDoubleField();
    v4 = v8;
  }
  if (self->_accountIdentifier)
  {
    PBDataWriterWriteStringField();
    v4 = v8;
  }
  if (self->_patientHash)
  {
    PBDataWriterWriteStringField();
    v4 = v8;
  }
  if (self->_messageVersion)
  {
    PBDataWriterWriteSubmessage();
    v4 = v8;
  }
  if (self->_signedClinicalDataIssuerIdentifier)
  {
    PBDataWriterWriteStringField();
    v4 = v8;
  }
  v6 = (__int16)self->_has;
  if ((v6 & 1) != 0)
  {
    PBDataWriterWriteDoubleField();
    v4 = v8;
    v6 = (__int16)self->_has;
    if ((v6 & 2) == 0)
    {
LABEL_22:
      if ((v6 & 8) == 0)
        goto LABEL_23;
      goto LABEL_42;
    }
  }
  else if ((v6 & 2) == 0)
  {
    goto LABEL_22;
  }
  PBDataWriterWriteDoubleField();
  v4 = v8;
  v6 = (__int16)self->_has;
  if ((v6 & 8) == 0)
  {
LABEL_23:
    if ((v6 & 4) == 0)
      goto LABEL_25;
    goto LABEL_24;
  }
LABEL_42:
  PBDataWriterWriteInt64Field();
  v4 = v8;
  if ((*(_WORD *)&self->_has & 4) != 0)
  {
LABEL_24:
    PBDataWriterWriteInt64Field();
    v4 = v8;
  }
LABEL_25:
  if (self->_clinicalSharingPrimaryDeviceName)
  {
    PBDataWriterWriteStringField();
    v4 = v8;
  }
  v7 = (__int16)self->_has;
  if ((v7 & 0x40) != 0)
  {
    PBDataWriterWriteDoubleField();
    v4 = v8;
    v7 = (__int16)self->_has;
  }
  if ((v7 & 0x20) != 0)
  {
    PBDataWriterWriteInt64Field();
    v4 = v8;
  }
  if (self->_credentialSyncIdentifier)
  {
    PBDataWriterWriteDataField();
    v4 = v8;
  }
  if (self->_syncIdentity)
  {
    PBDataWriterWriteSubmessage();
    v4 = v8;
  }

}

- (void)copyTo:(id)a3
{
  id v4;
  __int16 has;
  __int16 v6;
  __int16 v7;
  id v8;

  v4 = a3;
  v8 = v4;
  if (self->_gatewayExternalID)
  {
    objc_msgSend(v4, "setGatewayExternalID:");
    v4 = v8;
  }
  has = (__int16)self->_has;
  if ((has & 0x400) != 0)
  {
    *((_BYTE *)v4 + 160) = self->_userEnabled;
    *((_WORD *)v4 + 82) |= 0x400u;
    has = (__int16)self->_has;
    if ((has & 0x10) == 0)
    {
LABEL_5:
      if ((has & 0x200) == 0)
        goto LABEL_6;
      goto LABEL_38;
    }
  }
  else if ((has & 0x10) == 0)
  {
    goto LABEL_5;
  }
  *((_QWORD *)v4 + 5) = *(_QWORD *)&self->_creationDate;
  *((_WORD *)v4 + 82) |= 0x10u;
  has = (__int16)self->_has;
  if ((has & 0x200) == 0)
  {
LABEL_6:
    if ((has & 0x80) == 0)
      goto LABEL_8;
    goto LABEL_7;
  }
LABEL_38:
  *((_QWORD *)v4 + 10) = *(_QWORD *)&self->_modificationDate;
  *((_WORD *)v4 + 82) |= 0x200u;
  if ((*(_WORD *)&self->_has & 0x80) != 0)
  {
LABEL_7:
    *((_QWORD *)v4 + 8) = *(_QWORD *)&self->_lastFetchDate;
    *((_WORD *)v4 + 82) |= 0x80u;
  }
LABEL_8:
  if (self->_syncIdentifier)
  {
    objc_msgSend(v8, "setSyncIdentifier:");
    v4 = v8;
  }
  if ((*(_WORD *)&self->_has & 0x100) != 0)
  {
    *((_QWORD *)v4 + 9) = *(_QWORD *)&self->_lastFullFetchDate;
    *((_WORD *)v4 + 82) |= 0x100u;
  }
  if (self->_accountIdentifier)
  {
    objc_msgSend(v8, "setAccountIdentifier:");
    v4 = v8;
  }
  if (self->_patientHash)
  {
    objc_msgSend(v8, "setPatientHash:");
    v4 = v8;
  }
  if (self->_messageVersion)
  {
    objc_msgSend(v8, "setMessageVersion:");
    v4 = v8;
  }
  if (self->_signedClinicalDataIssuerIdentifier)
  {
    objc_msgSend(v8, "setSignedClinicalDataIssuerIdentifier:");
    v4 = v8;
  }
  v6 = (__int16)self->_has;
  if ((v6 & 1) != 0)
  {
    *((_QWORD *)v4 + 1) = *(_QWORD *)&self->_clinicalSharingFirstSharedDate;
    *((_WORD *)v4 + 82) |= 1u;
    v6 = (__int16)self->_has;
    if ((v6 & 2) == 0)
    {
LABEL_22:
      if ((v6 & 8) == 0)
        goto LABEL_23;
      goto LABEL_42;
    }
  }
  else if ((v6 & 2) == 0)
  {
    goto LABEL_22;
  }
  *((_QWORD *)v4 + 2) = *(_QWORD *)&self->_clinicalSharingLastSharedDate;
  *((_WORD *)v4 + 82) |= 2u;
  v6 = (__int16)self->_has;
  if ((v6 & 8) == 0)
  {
LABEL_23:
    if ((v6 & 4) == 0)
      goto LABEL_25;
    goto LABEL_24;
  }
LABEL_42:
  *((_QWORD *)v4 + 4) = self->_clinicalSharingUserStatus;
  *((_WORD *)v4 + 82) |= 8u;
  if ((*(_WORD *)&self->_has & 4) != 0)
  {
LABEL_24:
    *((_QWORD *)v4 + 3) = self->_clinicalSharingMultiDeviceStatus;
    *((_WORD *)v4 + 82) |= 4u;
  }
LABEL_25:
  if (self->_clinicalSharingPrimaryDeviceName)
  {
    objc_msgSend(v8, "setClinicalSharingPrimaryDeviceName:");
    v4 = v8;
  }
  v7 = (__int16)self->_has;
  if ((v7 & 0x40) != 0)
  {
    *((_QWORD *)v4 + 7) = *(_QWORD *)&self->_lastFailedFetchDate;
    *((_WORD *)v4 + 82) |= 0x40u;
    v7 = (__int16)self->_has;
  }
  if ((v7 & 0x20) != 0)
  {
    *((_QWORD *)v4 + 6) = self->_failedFetchAttemptsCount;
    *((_WORD *)v4 + 82) |= 0x20u;
  }
  if (self->_credentialSyncIdentifier)
  {
    objc_msgSend(v8, "setCredentialSyncIdentifier:");
    v4 = v8;
  }
  if (self->_syncIdentity)
  {
    objc_msgSend(v8, "setSyncIdentity:");
    v4 = v8;
  }

}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5;
  uint64_t v6;
  void *v7;
  __int16 has;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  void *v14;
  id v15;
  void *v16;
  uint64_t v17;
  void *v18;
  __int16 v19;
  uint64_t v20;
  void *v21;
  __int16 v22;
  uint64_t v23;
  void *v24;
  id v25;
  void *v26;

  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = -[NSString copyWithZone:](self->_gatewayExternalID, "copyWithZone:", a3);
  v7 = *(void **)(v5 + 112);
  *(_QWORD *)(v5 + 112) = v6;

  has = (__int16)self->_has;
  if ((has & 0x400) != 0)
  {
    *(_BYTE *)(v5 + 160) = self->_userEnabled;
    *(_WORD *)(v5 + 164) |= 0x400u;
    has = (__int16)self->_has;
    if ((has & 0x10) == 0)
    {
LABEL_3:
      if ((has & 0x200) == 0)
        goto LABEL_4;
      goto LABEL_20;
    }
  }
  else if ((has & 0x10) == 0)
  {
    goto LABEL_3;
  }
  *(double *)(v5 + 40) = self->_creationDate;
  *(_WORD *)(v5 + 164) |= 0x10u;
  has = (__int16)self->_has;
  if ((has & 0x200) == 0)
  {
LABEL_4:
    if ((has & 0x80) == 0)
      goto LABEL_6;
    goto LABEL_5;
  }
LABEL_20:
  *(double *)(v5 + 80) = self->_modificationDate;
  *(_WORD *)(v5 + 164) |= 0x200u;
  if ((*(_WORD *)&self->_has & 0x80) != 0)
  {
LABEL_5:
    *(double *)(v5 + 64) = self->_lastFetchDate;
    *(_WORD *)(v5 + 164) |= 0x80u;
  }
LABEL_6:
  v9 = -[NSData copyWithZone:](self->_syncIdentifier, "copyWithZone:", a3);
  v10 = *(void **)(v5 + 144);
  *(_QWORD *)(v5 + 144) = v9;

  if ((*(_WORD *)&self->_has & 0x100) != 0)
  {
    *(double *)(v5 + 72) = self->_lastFullFetchDate;
    *(_WORD *)(v5 + 164) |= 0x100u;
  }
  v11 = -[NSString copyWithZone:](self->_accountIdentifier, "copyWithZone:", a3);
  v12 = *(void **)(v5 + 88);
  *(_QWORD *)(v5 + 88) = v11;

  v13 = -[NSString copyWithZone:](self->_patientHash, "copyWithZone:", a3);
  v14 = *(void **)(v5 + 128);
  *(_QWORD *)(v5 + 128) = v13;

  v15 = -[HDCodableMessageVersion copyWithZone:](self->_messageVersion, "copyWithZone:", a3);
  v16 = *(void **)(v5 + 120);
  *(_QWORD *)(v5 + 120) = v15;

  v17 = -[NSString copyWithZone:](self->_signedClinicalDataIssuerIdentifier, "copyWithZone:", a3);
  v18 = *(void **)(v5 + 136);
  *(_QWORD *)(v5 + 136) = v17;

  v19 = (__int16)self->_has;
  if ((v19 & 1) != 0)
  {
    *(double *)(v5 + 8) = self->_clinicalSharingFirstSharedDate;
    *(_WORD *)(v5 + 164) |= 1u;
    v19 = (__int16)self->_has;
    if ((v19 & 2) == 0)
    {
LABEL_10:
      if ((v19 & 8) == 0)
        goto LABEL_11;
      goto LABEL_24;
    }
  }
  else if ((v19 & 2) == 0)
  {
    goto LABEL_10;
  }
  *(double *)(v5 + 16) = self->_clinicalSharingLastSharedDate;
  *(_WORD *)(v5 + 164) |= 2u;
  v19 = (__int16)self->_has;
  if ((v19 & 8) == 0)
  {
LABEL_11:
    if ((v19 & 4) == 0)
      goto LABEL_13;
    goto LABEL_12;
  }
LABEL_24:
  *(_QWORD *)(v5 + 32) = self->_clinicalSharingUserStatus;
  *(_WORD *)(v5 + 164) |= 8u;
  if ((*(_WORD *)&self->_has & 4) != 0)
  {
LABEL_12:
    *(_QWORD *)(v5 + 24) = self->_clinicalSharingMultiDeviceStatus;
    *(_WORD *)(v5 + 164) |= 4u;
  }
LABEL_13:
  v20 = -[NSString copyWithZone:](self->_clinicalSharingPrimaryDeviceName, "copyWithZone:", a3);
  v21 = *(void **)(v5 + 96);
  *(_QWORD *)(v5 + 96) = v20;

  v22 = (__int16)self->_has;
  if ((v22 & 0x40) != 0)
  {
    *(double *)(v5 + 56) = self->_lastFailedFetchDate;
    *(_WORD *)(v5 + 164) |= 0x40u;
    v22 = (__int16)self->_has;
  }
  if ((v22 & 0x20) != 0)
  {
    *(_QWORD *)(v5 + 48) = self->_failedFetchAttemptsCount;
    *(_WORD *)(v5 + 164) |= 0x20u;
  }
  v23 = -[NSData copyWithZone:](self->_credentialSyncIdentifier, "copyWithZone:", a3);
  v24 = *(void **)(v5 + 104);
  *(_QWORD *)(v5 + 104) = v23;

  v25 = -[HDCodableSyncIdentity copyWithZone:](self->_syncIdentity, "copyWithZone:", a3);
  v26 = *(void **)(v5 + 152);
  *(_QWORD *)(v5 + 152) = v25;

  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  NSString *gatewayExternalID;
  __int16 has;
  __int16 v7;
  NSData *syncIdentifier;
  NSString *accountIdentifier;
  NSString *patientHash;
  HDCodableMessageVersion *messageVersion;
  NSString *signedClinicalDataIssuerIdentifier;
  __int16 v13;
  __int16 v14;
  NSString *clinicalSharingPrimaryDeviceName;
  NSData *credentialSyncIdentifier;
  HDCodableSyncIdentity *syncIdentity;
  char v18;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_80;
  gatewayExternalID = self->_gatewayExternalID;
  if ((unint64_t)gatewayExternalID | *((_QWORD *)v4 + 14))
  {
    if (!-[NSString isEqual:](gatewayExternalID, "isEqual:"))
      goto LABEL_80;
  }
  has = (__int16)self->_has;
  v7 = *((_WORD *)v4 + 82);
  if ((has & 0x400) != 0)
  {
    if ((*((_WORD *)v4 + 82) & 0x400) == 0)
      goto LABEL_80;
    if (self->_userEnabled)
    {
      if (!*((_BYTE *)v4 + 160))
        goto LABEL_80;
    }
    else if (*((_BYTE *)v4 + 160))
    {
      goto LABEL_80;
    }
  }
  else if ((*((_WORD *)v4 + 82) & 0x400) != 0)
  {
    goto LABEL_80;
  }
  if ((has & 0x10) != 0)
  {
    if ((v7 & 0x10) == 0 || self->_creationDate != *((double *)v4 + 5))
      goto LABEL_80;
  }
  else if ((v7 & 0x10) != 0)
  {
    goto LABEL_80;
  }
  if ((*(_WORD *)&self->_has & 0x200) != 0)
  {
    if ((*((_WORD *)v4 + 82) & 0x200) == 0 || self->_modificationDate != *((double *)v4 + 10))
      goto LABEL_80;
  }
  else if ((*((_WORD *)v4 + 82) & 0x200) != 0)
  {
    goto LABEL_80;
  }
  if ((has & 0x80) != 0)
  {
    if ((v7 & 0x80) == 0 || self->_lastFetchDate != *((double *)v4 + 8))
      goto LABEL_80;
  }
  else if ((v7 & 0x80) != 0)
  {
    goto LABEL_80;
  }
  syncIdentifier = self->_syncIdentifier;
  if ((unint64_t)syncIdentifier | *((_QWORD *)v4 + 18))
  {
    if (!-[NSData isEqual:](syncIdentifier, "isEqual:"))
      goto LABEL_80;
    has = (__int16)self->_has;
    v7 = *((_WORD *)v4 + 82);
  }
  if ((has & 0x100) != 0)
  {
    if ((v7 & 0x100) == 0 || self->_lastFullFetchDate != *((double *)v4 + 9))
      goto LABEL_80;
  }
  else if ((v7 & 0x100) != 0)
  {
    goto LABEL_80;
  }
  accountIdentifier = self->_accountIdentifier;
  if ((unint64_t)accountIdentifier | *((_QWORD *)v4 + 11)
    && !-[NSString isEqual:](accountIdentifier, "isEqual:"))
  {
    goto LABEL_80;
  }
  patientHash = self->_patientHash;
  if ((unint64_t)patientHash | *((_QWORD *)v4 + 16))
  {
    if (!-[NSString isEqual:](patientHash, "isEqual:"))
      goto LABEL_80;
  }
  messageVersion = self->_messageVersion;
  if ((unint64_t)messageVersion | *((_QWORD *)v4 + 15))
  {
    if (!-[HDCodableMessageVersion isEqual:](messageVersion, "isEqual:"))
      goto LABEL_80;
  }
  signedClinicalDataIssuerIdentifier = self->_signedClinicalDataIssuerIdentifier;
  if ((unint64_t)signedClinicalDataIssuerIdentifier | *((_QWORD *)v4 + 17))
  {
    if (!-[NSString isEqual:](signedClinicalDataIssuerIdentifier, "isEqual:"))
      goto LABEL_80;
  }
  v13 = (__int16)self->_has;
  v14 = *((_WORD *)v4 + 82);
  if ((v13 & 1) != 0)
  {
    if ((v14 & 1) == 0 || self->_clinicalSharingFirstSharedDate != *((double *)v4 + 1))
      goto LABEL_80;
  }
  else if ((v14 & 1) != 0)
  {
    goto LABEL_80;
  }
  if ((v13 & 2) != 0)
  {
    if ((v14 & 2) == 0 || self->_clinicalSharingLastSharedDate != *((double *)v4 + 2))
      goto LABEL_80;
  }
  else if ((v14 & 2) != 0)
  {
    goto LABEL_80;
  }
  if ((v13 & 8) != 0)
  {
    if ((v14 & 8) == 0 || self->_clinicalSharingUserStatus != *((_QWORD *)v4 + 4))
      goto LABEL_80;
  }
  else if ((v14 & 8) != 0)
  {
    goto LABEL_80;
  }
  if ((v13 & 4) != 0)
  {
    if ((v14 & 4) == 0 || self->_clinicalSharingMultiDeviceStatus != *((_QWORD *)v4 + 3))
      goto LABEL_80;
  }
  else if ((v14 & 4) != 0)
  {
    goto LABEL_80;
  }
  clinicalSharingPrimaryDeviceName = self->_clinicalSharingPrimaryDeviceName;
  if ((unint64_t)clinicalSharingPrimaryDeviceName | *((_QWORD *)v4 + 12))
  {
    if (-[NSString isEqual:](clinicalSharingPrimaryDeviceName, "isEqual:"))
    {
      v13 = (__int16)self->_has;
      v14 = *((_WORD *)v4 + 82);
      goto LABEL_66;
    }
LABEL_80:
    v18 = 0;
    goto LABEL_81;
  }
LABEL_66:
  if ((v13 & 0x40) != 0)
  {
    if ((v14 & 0x40) == 0 || self->_lastFailedFetchDate != *((double *)v4 + 7))
      goto LABEL_80;
  }
  else if ((v14 & 0x40) != 0)
  {
    goto LABEL_80;
  }
  if ((v13 & 0x20) != 0)
  {
    if ((v14 & 0x20) == 0 || self->_failedFetchAttemptsCount != *((_QWORD *)v4 + 6))
      goto LABEL_80;
  }
  else if ((v14 & 0x20) != 0)
  {
    goto LABEL_80;
  }
  credentialSyncIdentifier = self->_credentialSyncIdentifier;
  if ((unint64_t)credentialSyncIdentifier | *((_QWORD *)v4 + 13)
    && !-[NSData isEqual:](credentialSyncIdentifier, "isEqual:"))
  {
    goto LABEL_80;
  }
  syncIdentity = self->_syncIdentity;
  if ((unint64_t)syncIdentity | *((_QWORD *)v4 + 19))
    v18 = -[HDCodableSyncIdentity isEqual:](syncIdentity, "isEqual:");
  else
    v18 = 1;
LABEL_81:

  return v18;
}

- (unint64_t)hash
{
  __int16 has;
  double creationDate;
  double v5;
  long double v6;
  double v7;
  unint64_t v8;
  unint64_t v9;
  double modificationDate;
  double v11;
  long double v12;
  double v13;
  unint64_t v14;
  double lastFetchDate;
  double v16;
  long double v17;
  double v18;
  unint64_t v19;
  double lastFullFetchDate;
  double v21;
  long double v22;
  double v23;
  __int16 v24;
  unint64_t v25;
  double clinicalSharingFirstSharedDate;
  double v27;
  long double v28;
  double v29;
  unint64_t v30;
  double clinicalSharingLastSharedDate;
  double v32;
  long double v33;
  double v34;
  uint64_t v35;
  uint64_t v36;
  NSUInteger v37;
  __int16 v38;
  unint64_t v39;
  double lastFailedFetchDate;
  double v41;
  long double v42;
  double v43;
  uint64_t v44;
  uint64_t v45;
  NSUInteger v47;
  unint64_t v48;
  NSUInteger v49;
  NSUInteger v50;
  uint64_t v51;
  unint64_t v52;
  unint64_t v53;
  uint64_t v54;
  NSUInteger v55;

  v55 = -[NSString hash](self->_gatewayExternalID, "hash");
  has = (__int16)self->_has;
  if ((has & 0x400) != 0)
  {
    v54 = 2654435761 * self->_userEnabled;
    if ((has & 0x10) != 0)
      goto LABEL_3;
LABEL_8:
    v8 = 0;
    goto LABEL_11;
  }
  v54 = 0;
  if ((has & 0x10) == 0)
    goto LABEL_8;
LABEL_3:
  creationDate = self->_creationDate;
  v5 = -creationDate;
  if (creationDate >= 0.0)
    v5 = self->_creationDate;
  v6 = floor(v5 + 0.5);
  v7 = (v5 - v6) * 1.84467441e19;
  v8 = 2654435761u * (unint64_t)fmod(v6, 1.84467441e19);
  if (v7 >= 0.0)
  {
    if (v7 > 0.0)
      v8 += (unint64_t)v7;
  }
  else
  {
    v8 -= (unint64_t)fabs(v7);
  }
LABEL_11:
  if ((has & 0x200) != 0)
  {
    modificationDate = self->_modificationDate;
    v11 = -modificationDate;
    if (modificationDate >= 0.0)
      v11 = self->_modificationDate;
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
  v53 = v9;
  if ((has & 0x80) != 0)
  {
    lastFetchDate = self->_lastFetchDate;
    v16 = -lastFetchDate;
    if (lastFetchDate >= 0.0)
      v16 = self->_lastFetchDate;
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
  v52 = v14;
  v51 = -[NSData hash](self->_syncIdentifier, "hash");
  if ((*(_WORD *)&self->_has & 0x100) != 0)
  {
    lastFullFetchDate = self->_lastFullFetchDate;
    v21 = -lastFullFetchDate;
    if (lastFullFetchDate >= 0.0)
      v21 = self->_lastFullFetchDate;
    v22 = floor(v21 + 0.5);
    v23 = (v21 - v22) * 1.84467441e19;
    v19 = 2654435761u * (unint64_t)fmod(v22, 1.84467441e19);
    if (v23 >= 0.0)
    {
      if (v23 > 0.0)
        v19 += (unint64_t)v23;
    }
    else
    {
      v19 -= (unint64_t)fabs(v23);
    }
  }
  else
  {
    v19 = 0;
  }
  v50 = -[NSString hash](self->_accountIdentifier, "hash");
  v49 = -[NSString hash](self->_patientHash, "hash");
  v48 = -[HDCodableMessageVersion hash](self->_messageVersion, "hash");
  v47 = -[NSString hash](self->_signedClinicalDataIssuerIdentifier, "hash");
  v24 = (__int16)self->_has;
  if ((v24 & 1) != 0)
  {
    clinicalSharingFirstSharedDate = self->_clinicalSharingFirstSharedDate;
    v27 = -clinicalSharingFirstSharedDate;
    if (clinicalSharingFirstSharedDate >= 0.0)
      v27 = self->_clinicalSharingFirstSharedDate;
    v28 = floor(v27 + 0.5);
    v29 = (v27 - v28) * 1.84467441e19;
    v25 = 2654435761u * (unint64_t)fmod(v28, 1.84467441e19);
    if (v29 >= 0.0)
    {
      if (v29 > 0.0)
        v25 += (unint64_t)v29;
    }
    else
    {
      v25 -= (unint64_t)fabs(v29);
    }
  }
  else
  {
    v25 = 0;
  }
  if ((v24 & 2) != 0)
  {
    clinicalSharingLastSharedDate = self->_clinicalSharingLastSharedDate;
    v32 = -clinicalSharingLastSharedDate;
    if (clinicalSharingLastSharedDate >= 0.0)
      v32 = self->_clinicalSharingLastSharedDate;
    v33 = floor(v32 + 0.5);
    v34 = (v32 - v33) * 1.84467441e19;
    v30 = 2654435761u * (unint64_t)fmod(v33, 1.84467441e19);
    if (v34 >= 0.0)
    {
      if (v34 > 0.0)
        v30 += (unint64_t)v34;
    }
    else
    {
      v30 -= (unint64_t)fabs(v34);
    }
  }
  else
  {
    v30 = 0;
  }
  if ((v24 & 8) != 0)
  {
    v35 = 2654435761 * self->_clinicalSharingUserStatus;
    if ((v24 & 4) != 0)
      goto LABEL_53;
  }
  else
  {
    v35 = 0;
    if ((v24 & 4) != 0)
    {
LABEL_53:
      v36 = 2654435761 * self->_clinicalSharingMultiDeviceStatus;
      goto LABEL_56;
    }
  }
  v36 = 0;
LABEL_56:
  v37 = -[NSString hash](self->_clinicalSharingPrimaryDeviceName, "hash");
  v38 = (__int16)self->_has;
  if ((v38 & 0x40) != 0)
  {
    lastFailedFetchDate = self->_lastFailedFetchDate;
    v41 = -lastFailedFetchDate;
    if (lastFailedFetchDate >= 0.0)
      v41 = self->_lastFailedFetchDate;
    v42 = floor(v41 + 0.5);
    v43 = (v41 - v42) * 1.84467441e19;
    v39 = 2654435761u * (unint64_t)fmod(v42, 1.84467441e19);
    if (v43 >= 0.0)
    {
      if (v43 > 0.0)
        v39 += (unint64_t)v43;
    }
    else
    {
      v39 -= (unint64_t)fabs(v43);
    }
  }
  else
  {
    v39 = 0;
  }
  if ((v38 & 0x20) != 0)
    v44 = 2654435761 * self->_failedFetchAttemptsCount;
  else
    v44 = 0;
  v45 = v54 ^ v55 ^ v8 ^ v53 ^ v52 ^ v51 ^ v19 ^ v50 ^ v49 ^ v48 ^ v47 ^ v25 ^ v30 ^ v35 ^ v36 ^ v37 ^ v39 ^ v44 ^ -[NSData hash](self->_credentialSyncIdentifier, "hash");
  return v45 ^ -[HDCodableSyncIdentity hash](self->_syncIdentity, "hash");
}

- (void)mergeFrom:(id)a3
{
  id v4;
  __int16 v5;
  HDCodableMessageVersion *messageVersion;
  uint64_t v7;
  __int16 v8;
  __int16 v9;
  HDCodableSyncIdentity *syncIdentity;
  uint64_t v11;
  id v12;

  v4 = a3;
  v12 = v4;
  if (*((_QWORD *)v4 + 14))
  {
    -[HDCodableClinicalAccount setGatewayExternalID:](self, "setGatewayExternalID:");
    v4 = v12;
  }
  v5 = *((_WORD *)v4 + 82);
  if ((v5 & 0x400) != 0)
  {
    self->_userEnabled = *((_BYTE *)v4 + 160);
    *(_WORD *)&self->_has |= 0x400u;
    v5 = *((_WORD *)v4 + 82);
    if ((v5 & 0x10) == 0)
    {
LABEL_5:
      if ((v5 & 0x200) == 0)
        goto LABEL_6;
      goto LABEL_21;
    }
  }
  else if ((v5 & 0x10) == 0)
  {
    goto LABEL_5;
  }
  self->_creationDate = *((double *)v4 + 5);
  *(_WORD *)&self->_has |= 0x10u;
  v5 = *((_WORD *)v4 + 82);
  if ((v5 & 0x200) == 0)
  {
LABEL_6:
    if ((v5 & 0x80) == 0)
      goto LABEL_8;
    goto LABEL_7;
  }
LABEL_21:
  self->_modificationDate = *((double *)v4 + 10);
  *(_WORD *)&self->_has |= 0x200u;
  if ((*((_WORD *)v4 + 82) & 0x80) != 0)
  {
LABEL_7:
    self->_lastFetchDate = *((double *)v4 + 8);
    *(_WORD *)&self->_has |= 0x80u;
  }
LABEL_8:
  if (*((_QWORD *)v4 + 18))
  {
    -[HDCodableClinicalAccount setSyncIdentifier:](self, "setSyncIdentifier:");
    v4 = v12;
  }
  if ((*((_WORD *)v4 + 82) & 0x100) != 0)
  {
    self->_lastFullFetchDate = *((double *)v4 + 9);
    *(_WORD *)&self->_has |= 0x100u;
  }
  if (*((_QWORD *)v4 + 11))
  {
    -[HDCodableClinicalAccount setAccountIdentifier:](self, "setAccountIdentifier:");
    v4 = v12;
  }
  if (*((_QWORD *)v4 + 16))
  {
    -[HDCodableClinicalAccount setPatientHash:](self, "setPatientHash:");
    v4 = v12;
  }
  messageVersion = self->_messageVersion;
  v7 = *((_QWORD *)v4 + 15);
  if (messageVersion)
  {
    if (!v7)
      goto LABEL_26;
    -[HDCodableMessageVersion mergeFrom:](messageVersion, "mergeFrom:");
  }
  else
  {
    if (!v7)
      goto LABEL_26;
    -[HDCodableClinicalAccount setMessageVersion:](self, "setMessageVersion:");
  }
  v4 = v12;
LABEL_26:
  if (*((_QWORD *)v4 + 17))
  {
    -[HDCodableClinicalAccount setSignedClinicalDataIssuerIdentifier:](self, "setSignedClinicalDataIssuerIdentifier:");
    v4 = v12;
  }
  v8 = *((_WORD *)v4 + 82);
  if ((v8 & 1) != 0)
  {
    self->_clinicalSharingFirstSharedDate = *((double *)v4 + 1);
    *(_WORD *)&self->_has |= 1u;
    v8 = *((_WORD *)v4 + 82);
    if ((v8 & 2) == 0)
    {
LABEL_30:
      if ((v8 & 8) == 0)
        goto LABEL_31;
      goto LABEL_46;
    }
  }
  else if ((v8 & 2) == 0)
  {
    goto LABEL_30;
  }
  self->_clinicalSharingLastSharedDate = *((double *)v4 + 2);
  *(_WORD *)&self->_has |= 2u;
  v8 = *((_WORD *)v4 + 82);
  if ((v8 & 8) == 0)
  {
LABEL_31:
    if ((v8 & 4) == 0)
      goto LABEL_33;
    goto LABEL_32;
  }
LABEL_46:
  self->_clinicalSharingUserStatus = *((_QWORD *)v4 + 4);
  *(_WORD *)&self->_has |= 8u;
  if ((*((_WORD *)v4 + 82) & 4) != 0)
  {
LABEL_32:
    self->_clinicalSharingMultiDeviceStatus = *((_QWORD *)v4 + 3);
    *(_WORD *)&self->_has |= 4u;
  }
LABEL_33:
  if (*((_QWORD *)v4 + 12))
  {
    -[HDCodableClinicalAccount setClinicalSharingPrimaryDeviceName:](self, "setClinicalSharingPrimaryDeviceName:");
    v4 = v12;
  }
  v9 = *((_WORD *)v4 + 82);
  if ((v9 & 0x40) != 0)
  {
    self->_lastFailedFetchDate = *((double *)v4 + 7);
    *(_WORD *)&self->_has |= 0x40u;
    v9 = *((_WORD *)v4 + 82);
  }
  if ((v9 & 0x20) != 0)
  {
    self->_failedFetchAttemptsCount = *((_QWORD *)v4 + 6);
    *(_WORD *)&self->_has |= 0x20u;
  }
  if (*((_QWORD *)v4 + 13))
  {
    -[HDCodableClinicalAccount setCredentialSyncIdentifier:](self, "setCredentialSyncIdentifier:");
    v4 = v12;
  }
  syncIdentity = self->_syncIdentity;
  v11 = *((_QWORD *)v4 + 19);
  if (syncIdentity)
  {
    if (v11)
    {
      -[HDCodableSyncIdentity mergeFrom:](syncIdentity, "mergeFrom:");
LABEL_50:
      v4 = v12;
    }
  }
  else if (v11)
  {
    -[HDCodableClinicalAccount setSyncIdentity:](self, "setSyncIdentity:");
    goto LABEL_50;
  }

}

- (NSString)gatewayExternalID
{
  return self->_gatewayExternalID;
}

- (void)setGatewayExternalID:(id)a3
{
  objc_storeStrong((id *)&self->_gatewayExternalID, a3);
}

- (BOOL)userEnabled
{
  return self->_userEnabled;
}

- (double)creationDate
{
  return self->_creationDate;
}

- (double)modificationDate
{
  return self->_modificationDate;
}

- (double)lastFetchDate
{
  return self->_lastFetchDate;
}

- (NSData)syncIdentifier
{
  return self->_syncIdentifier;
}

- (void)setSyncIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_syncIdentifier, a3);
}

- (double)lastFullFetchDate
{
  return self->_lastFullFetchDate;
}

- (NSString)accountIdentifier
{
  return self->_accountIdentifier;
}

- (void)setAccountIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_accountIdentifier, a3);
}

- (NSString)patientHash
{
  return self->_patientHash;
}

- (void)setPatientHash:(id)a3
{
  objc_storeStrong((id *)&self->_patientHash, a3);
}

- (HDCodableMessageVersion)messageVersion
{
  return self->_messageVersion;
}

- (void)setMessageVersion:(id)a3
{
  objc_storeStrong((id *)&self->_messageVersion, a3);
}

- (NSString)signedClinicalDataIssuerIdentifier
{
  return self->_signedClinicalDataIssuerIdentifier;
}

- (void)setSignedClinicalDataIssuerIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_signedClinicalDataIssuerIdentifier, a3);
}

- (double)clinicalSharingFirstSharedDate
{
  return self->_clinicalSharingFirstSharedDate;
}

- (double)clinicalSharingLastSharedDate
{
  return self->_clinicalSharingLastSharedDate;
}

- (int64_t)clinicalSharingUserStatus
{
  return self->_clinicalSharingUserStatus;
}

- (int64_t)clinicalSharingMultiDeviceStatus
{
  return self->_clinicalSharingMultiDeviceStatus;
}

- (NSString)clinicalSharingPrimaryDeviceName
{
  return self->_clinicalSharingPrimaryDeviceName;
}

- (void)setClinicalSharingPrimaryDeviceName:(id)a3
{
  objc_storeStrong((id *)&self->_clinicalSharingPrimaryDeviceName, a3);
}

- (double)lastFailedFetchDate
{
  return self->_lastFailedFetchDate;
}

- (int64_t)failedFetchAttemptsCount
{
  return self->_failedFetchAttemptsCount;
}

- (NSData)credentialSyncIdentifier
{
  return self->_credentialSyncIdentifier;
}

- (void)setCredentialSyncIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_credentialSyncIdentifier, a3);
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
  objc_storeStrong((id *)&self->_syncIdentifier, 0);
  objc_storeStrong((id *)&self->_signedClinicalDataIssuerIdentifier, 0);
  objc_storeStrong((id *)&self->_patientHash, 0);
  objc_storeStrong((id *)&self->_messageVersion, 0);
  objc_storeStrong((id *)&self->_gatewayExternalID, 0);
  objc_storeStrong((id *)&self->_credentialSyncIdentifier, 0);
  objc_storeStrong((id *)&self->_clinicalSharingPrimaryDeviceName, 0);
  objc_storeStrong((id *)&self->_accountIdentifier, 0);
}

@end
