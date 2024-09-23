@implementation HDCodableFHIRResource

- (BOOL)hasGatewayExternalID
{
  return self->_gatewayExternalID != 0;
}

- (BOOL)hasResourceID
{
  return self->_resourceID != 0;
}

- (BOOL)hasRawContent
{
  return self->_rawContent != 0;
}

- (void)setReceivedDate:(double)a3
{
  *(_BYTE *)&self->_has |= 0x20u;
  self->_receivedDate = a3;
}

- (void)setHasReceivedDate:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 32;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xDF | v3;
}

- (BOOL)hasReceivedDate
{
  return (*(_BYTE *)&self->_has >> 5) & 1;
}

- (BOOL)hasResourceType
{
  return self->_resourceType != 0;
}

- (BOOL)hasFhirVersion
{
  return self->_fhirVersion != 0;
}

- (BOOL)hasReceivedDateTimeZoneName
{
  return self->_receivedDateTimeZoneName != 0;
}

- (BOOL)hasSourceURL
{
  return self->_sourceURL != 0;
}

- (void)setExtractionHints:(int64_t)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_extractionHints = a3;
}

- (void)setHasExtractionHints:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (BOOL)hasExtractionHints
{
  return *(_BYTE *)&self->_has & 1;
}

- (BOOL)hasAccountIdentifier
{
  return self->_accountIdentifier != 0;
}

- (void)setOriginVersionMajor:(int64_t)a3
{
  *(_BYTE *)&self->_has |= 4u;
  self->_originVersionMajor = a3;
}

- (void)setHasOriginVersionMajor:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 4;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFB | v3;
}

- (BOOL)hasOriginVersionMajor
{
  return (*(_BYTE *)&self->_has >> 2) & 1;
}

- (void)setOriginVersionMinor:(int64_t)a3
{
  *(_BYTE *)&self->_has |= 8u;
  self->_originVersionMinor = a3;
}

- (void)setHasOriginVersionMinor:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 8;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xF7 | v3;
}

- (BOOL)hasOriginVersionMinor
{
  return (*(_BYTE *)&self->_has >> 3) & 1;
}

- (void)setOriginVersionPatch:(int64_t)a3
{
  *(_BYTE *)&self->_has |= 0x10u;
  self->_originVersionPatch = a3;
}

- (void)setHasOriginVersionPatch:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 16;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xEF | v3;
}

- (BOOL)hasOriginVersionPatch
{
  return (*(_BYTE *)&self->_has >> 4) & 1;
}

- (BOOL)hasOriginVersionBuild
{
  return self->_originVersionBuild != 0;
}

- (BOOL)hasMessageVersion
{
  return self->_messageVersion != 0;
}

- (void)setFirstSeenDate:(double)a3
{
  *(_BYTE *)&self->_has |= 2u;
  self->_firstSeenDate = a3;
}

- (void)setHasFirstSeenDate:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFD | v3;
}

- (BOOL)hasFirstSeenDate
{
  return (*(_BYTE *)&self->_has >> 1) & 1;
}

- (BOOL)hasFirstSeenDateTimeZoneName
{
  return self->_firstSeenDateTimeZoneName != 0;
}

- (BOOL)hasSyncIdentity
{
  return self->_syncIdentity != 0;
}

- (BOOL)hasUniquenessChecksum
{
  return self->_uniquenessChecksum != 0;
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
  v8.super_class = (Class)HDCodableFHIRResource;
  -[HDCodableFHIRResource description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[HDCodableFHIRResource dictionaryRepresentation](self, "dictionaryRepresentation");
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
  NSString *resourceID;
  NSData *rawContent;
  void *v8;
  NSString *resourceType;
  NSString *fhirVersion;
  NSString *receivedDateTimeZoneName;
  NSString *sourceURL;
  void *v13;
  NSString *accountIdentifier;
  char has;
  void *v16;
  NSString *originVersionBuild;
  HDCodableMessageVersion *messageVersion;
  void *v19;
  void *v20;
  NSString *firstSeenDateTimeZoneName;
  HDCodableSyncIdentity *syncIdentity;
  void *v23;
  NSData *uniquenessChecksum;
  void *v26;
  void *v27;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  gatewayExternalID = self->_gatewayExternalID;
  if (gatewayExternalID)
    objc_msgSend(v3, "setObject:forKey:", gatewayExternalID, CFSTR("gatewayExternalID"));
  resourceID = self->_resourceID;
  if (resourceID)
    objc_msgSend(v4, "setObject:forKey:", resourceID, CFSTR("resourceID"));
  rawContent = self->_rawContent;
  if (rawContent)
    objc_msgSend(v4, "setObject:forKey:", rawContent, CFSTR("rawContent"));
  if ((*(_BYTE *)&self->_has & 0x20) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->_receivedDate);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v8, CFSTR("receivedDate"));

  }
  resourceType = self->_resourceType;
  if (resourceType)
    objc_msgSend(v4, "setObject:forKey:", resourceType, CFSTR("resourceType"));
  fhirVersion = self->_fhirVersion;
  if (fhirVersion)
    objc_msgSend(v4, "setObject:forKey:", fhirVersion, CFSTR("fhirVersion"));
  receivedDateTimeZoneName = self->_receivedDateTimeZoneName;
  if (receivedDateTimeZoneName)
    objc_msgSend(v4, "setObject:forKey:", receivedDateTimeZoneName, CFSTR("receivedDateTimeZoneName"));
  sourceURL = self->_sourceURL;
  if (sourceURL)
    objc_msgSend(v4, "setObject:forKey:", sourceURL, CFSTR("sourceURL"));
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", self->_extractionHints);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v13, CFSTR("extractionHints"));

  }
  accountIdentifier = self->_accountIdentifier;
  if (accountIdentifier)
    objc_msgSend(v4, "setObject:forKey:", accountIdentifier, CFSTR("accountIdentifier"));
  has = (char)self->_has;
  if ((has & 4) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", self->_originVersionMajor);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v26, CFSTR("originVersionMajor"));

    has = (char)self->_has;
    if ((has & 8) == 0)
    {
LABEL_23:
      if ((has & 0x10) == 0)
        goto LABEL_25;
      goto LABEL_24;
    }
  }
  else if ((*(_BYTE *)&self->_has & 8) == 0)
  {
    goto LABEL_23;
  }
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", self->_originVersionMinor);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKey:", v27, CFSTR("originVersionMinor"));

  if ((*(_BYTE *)&self->_has & 0x10) != 0)
  {
LABEL_24:
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", self->_originVersionPatch);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v16, CFSTR("originVersionPatch"));

  }
LABEL_25:
  originVersionBuild = self->_originVersionBuild;
  if (originVersionBuild)
    objc_msgSend(v4, "setObject:forKey:", originVersionBuild, CFSTR("originVersionBuild"));
  messageVersion = self->_messageVersion;
  if (messageVersion)
  {
    -[HDCodableMessageVersion dictionaryRepresentation](messageVersion, "dictionaryRepresentation");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v19, CFSTR("messageVersion"));

  }
  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->_firstSeenDate);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v20, CFSTR("firstSeenDate"));

  }
  firstSeenDateTimeZoneName = self->_firstSeenDateTimeZoneName;
  if (firstSeenDateTimeZoneName)
    objc_msgSend(v4, "setObject:forKey:", firstSeenDateTimeZoneName, CFSTR("firstSeenDateTimeZoneName"));
  syncIdentity = self->_syncIdentity;
  if (syncIdentity)
  {
    -[HDCodableSyncIdentity dictionaryRepresentation](syncIdentity, "dictionaryRepresentation");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v23, CFSTR("syncIdentity"));

  }
  uniquenessChecksum = self->_uniquenessChecksum;
  if (uniquenessChecksum)
    objc_msgSend(v4, "setObject:forKey:", uniquenessChecksum, CFSTR("uniquenessChecksum"));
  return v4;
}

- (BOOL)readFrom:(id)a3
{
  return HDCodableFHIRResourceReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4;
  char has;
  id v6;

  v4 = a3;
  v6 = v4;
  if (self->_gatewayExternalID)
  {
    PBDataWriterWriteStringField();
    v4 = v6;
  }
  if (self->_resourceID)
  {
    PBDataWriterWriteStringField();
    v4 = v6;
  }
  if (self->_rawContent)
  {
    PBDataWriterWriteDataField();
    v4 = v6;
  }
  if ((*(_BYTE *)&self->_has & 0x20) != 0)
  {
    PBDataWriterWriteDoubleField();
    v4 = v6;
  }
  if (self->_resourceType)
  {
    PBDataWriterWriteStringField();
    v4 = v6;
  }
  if (self->_fhirVersion)
  {
    PBDataWriterWriteStringField();
    v4 = v6;
  }
  if (self->_receivedDateTimeZoneName)
  {
    PBDataWriterWriteStringField();
    v4 = v6;
  }
  if (self->_sourceURL)
  {
    PBDataWriterWriteStringField();
    v4 = v6;
  }
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    PBDataWriterWriteInt64Field();
    v4 = v6;
  }
  if (self->_accountIdentifier)
  {
    PBDataWriterWriteStringField();
    v4 = v6;
  }
  has = (char)self->_has;
  if ((has & 4) != 0)
  {
    PBDataWriterWriteInt64Field();
    v4 = v6;
    has = (char)self->_has;
    if ((has & 8) == 0)
    {
LABEL_23:
      if ((has & 0x10) == 0)
        goto LABEL_25;
      goto LABEL_24;
    }
  }
  else if ((*(_BYTE *)&self->_has & 8) == 0)
  {
    goto LABEL_23;
  }
  PBDataWriterWriteInt64Field();
  v4 = v6;
  if ((*(_BYTE *)&self->_has & 0x10) != 0)
  {
LABEL_24:
    PBDataWriterWriteInt64Field();
    v4 = v6;
  }
LABEL_25:
  if (self->_originVersionBuild)
  {
    PBDataWriterWriteStringField();
    v4 = v6;
  }
  if (self->_messageVersion)
  {
    PBDataWriterWriteSubmessage();
    v4 = v6;
  }
  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
    PBDataWriterWriteDoubleField();
    v4 = v6;
  }
  if (self->_firstSeenDateTimeZoneName)
  {
    PBDataWriterWriteStringField();
    v4 = v6;
  }
  if (self->_syncIdentity)
  {
    PBDataWriterWriteSubmessage();
    v4 = v6;
  }
  if (self->_uniquenessChecksum)
  {
    PBDataWriterWriteDataField();
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
  if (self->_gatewayExternalID)
  {
    objc_msgSend(v4, "setGatewayExternalID:");
    v4 = v6;
  }
  if (self->_resourceID)
  {
    objc_msgSend(v6, "setResourceID:");
    v4 = v6;
  }
  if (self->_rawContent)
  {
    objc_msgSend(v6, "setRawContent:");
    v4 = v6;
  }
  if ((*(_BYTE *)&self->_has & 0x20) != 0)
  {
    *((_QWORD *)v4 + 6) = *(_QWORD *)&self->_receivedDate;
    *((_BYTE *)v4 + 160) |= 0x20u;
  }
  if (self->_resourceType)
  {
    objc_msgSend(v6, "setResourceType:");
    v4 = v6;
  }
  if (self->_fhirVersion)
  {
    objc_msgSend(v6, "setFhirVersion:");
    v4 = v6;
  }
  if (self->_receivedDateTimeZoneName)
  {
    objc_msgSend(v6, "setReceivedDateTimeZoneName:");
    v4 = v6;
  }
  if (self->_sourceURL)
  {
    objc_msgSend(v6, "setSourceURL:");
    v4 = v6;
  }
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    *((_QWORD *)v4 + 1) = self->_extractionHints;
    *((_BYTE *)v4 + 160) |= 1u;
  }
  if (self->_accountIdentifier)
  {
    objc_msgSend(v6, "setAccountIdentifier:");
    v4 = v6;
  }
  has = (char)self->_has;
  if ((has & 4) != 0)
  {
    *((_QWORD *)v4 + 3) = self->_originVersionMajor;
    *((_BYTE *)v4 + 160) |= 4u;
    has = (char)self->_has;
    if ((has & 8) == 0)
    {
LABEL_23:
      if ((has & 0x10) == 0)
        goto LABEL_25;
      goto LABEL_24;
    }
  }
  else if ((*(_BYTE *)&self->_has & 8) == 0)
  {
    goto LABEL_23;
  }
  *((_QWORD *)v4 + 4) = self->_originVersionMinor;
  *((_BYTE *)v4 + 160) |= 8u;
  if ((*(_BYTE *)&self->_has & 0x10) != 0)
  {
LABEL_24:
    *((_QWORD *)v4 + 5) = self->_originVersionPatch;
    *((_BYTE *)v4 + 160) |= 0x10u;
  }
LABEL_25:
  if (self->_originVersionBuild)
  {
    objc_msgSend(v6, "setOriginVersionBuild:");
    v4 = v6;
  }
  if (self->_messageVersion)
  {
    objc_msgSend(v6, "setMessageVersion:");
    v4 = v6;
  }
  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
    *((_QWORD *)v4 + 2) = *(_QWORD *)&self->_firstSeenDate;
    *((_BYTE *)v4 + 160) |= 2u;
  }
  if (self->_firstSeenDateTimeZoneName)
  {
    objc_msgSend(v6, "setFirstSeenDateTimeZoneName:");
    v4 = v6;
  }
  if (self->_syncIdentity)
  {
    objc_msgSend(v6, "setSyncIdentity:");
    v4 = v6;
  }
  if (self->_uniquenessChecksum)
  {
    objc_msgSend(v6, "setUniquenessChecksum:");
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
  uint64_t v16;
  void *v17;
  uint64_t v18;
  void *v19;
  uint64_t v20;
  void *v21;
  char has;
  uint64_t v23;
  void *v24;
  id v25;
  void *v26;
  uint64_t v27;
  void *v28;
  id v29;
  void *v30;
  uint64_t v31;
  void *v32;

  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = -[NSString copyWithZone:](self->_gatewayExternalID, "copyWithZone:", a3);
  v7 = *(void **)(v5 + 80);
  *(_QWORD *)(v5 + 80) = v6;

  v8 = -[NSString copyWithZone:](self->_resourceID, "copyWithZone:", a3);
  v9 = *(void **)(v5 + 120);
  *(_QWORD *)(v5 + 120) = v8;

  v10 = -[NSData copyWithZone:](self->_rawContent, "copyWithZone:", a3);
  v11 = *(void **)(v5 + 104);
  *(_QWORD *)(v5 + 104) = v10;

  if ((*(_BYTE *)&self->_has & 0x20) != 0)
  {
    *(double *)(v5 + 48) = self->_receivedDate;
    *(_BYTE *)(v5 + 160) |= 0x20u;
  }
  v12 = -[NSString copyWithZone:](self->_resourceType, "copyWithZone:", a3);
  v13 = *(void **)(v5 + 128);
  *(_QWORD *)(v5 + 128) = v12;

  v14 = -[NSString copyWithZone:](self->_fhirVersion, "copyWithZone:", a3);
  v15 = *(void **)(v5 + 64);
  *(_QWORD *)(v5 + 64) = v14;

  v16 = -[NSString copyWithZone:](self->_receivedDateTimeZoneName, "copyWithZone:", a3);
  v17 = *(void **)(v5 + 112);
  *(_QWORD *)(v5 + 112) = v16;

  v18 = -[NSString copyWithZone:](self->_sourceURL, "copyWithZone:", a3);
  v19 = *(void **)(v5 + 136);
  *(_QWORD *)(v5 + 136) = v18;

  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    *(_QWORD *)(v5 + 8) = self->_extractionHints;
    *(_BYTE *)(v5 + 160) |= 1u;
  }
  v20 = -[NSString copyWithZone:](self->_accountIdentifier, "copyWithZone:", a3);
  v21 = *(void **)(v5 + 56);
  *(_QWORD *)(v5 + 56) = v20;

  has = (char)self->_has;
  if ((has & 4) != 0)
  {
    *(_QWORD *)(v5 + 24) = self->_originVersionMajor;
    *(_BYTE *)(v5 + 160) |= 4u;
    has = (char)self->_has;
    if ((has & 8) == 0)
    {
LABEL_7:
      if ((has & 0x10) == 0)
        goto LABEL_9;
      goto LABEL_8;
    }
  }
  else if ((*(_BYTE *)&self->_has & 8) == 0)
  {
    goto LABEL_7;
  }
  *(_QWORD *)(v5 + 32) = self->_originVersionMinor;
  *(_BYTE *)(v5 + 160) |= 8u;
  if ((*(_BYTE *)&self->_has & 0x10) != 0)
  {
LABEL_8:
    *(_QWORD *)(v5 + 40) = self->_originVersionPatch;
    *(_BYTE *)(v5 + 160) |= 0x10u;
  }
LABEL_9:
  v23 = -[NSString copyWithZone:](self->_originVersionBuild, "copyWithZone:", a3);
  v24 = *(void **)(v5 + 96);
  *(_QWORD *)(v5 + 96) = v23;

  v25 = -[HDCodableMessageVersion copyWithZone:](self->_messageVersion, "copyWithZone:", a3);
  v26 = *(void **)(v5 + 88);
  *(_QWORD *)(v5 + 88) = v25;

  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
    *(double *)(v5 + 16) = self->_firstSeenDate;
    *(_BYTE *)(v5 + 160) |= 2u;
  }
  v27 = -[NSString copyWithZone:](self->_firstSeenDateTimeZoneName, "copyWithZone:", a3);
  v28 = *(void **)(v5 + 72);
  *(_QWORD *)(v5 + 72) = v27;

  v29 = -[HDCodableSyncIdentity copyWithZone:](self->_syncIdentity, "copyWithZone:", a3);
  v30 = *(void **)(v5 + 144);
  *(_QWORD *)(v5 + 144) = v29;

  v31 = -[NSData copyWithZone:](self->_uniquenessChecksum, "copyWithZone:", a3);
  v32 = *(void **)(v5 + 152);
  *(_QWORD *)(v5 + 152) = v31;

  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  NSString *gatewayExternalID;
  NSString *resourceID;
  NSData *rawContent;
  NSString *resourceType;
  NSString *fhirVersion;
  NSString *receivedDateTimeZoneName;
  NSString *sourceURL;
  char has;
  char v13;
  NSString *accountIdentifier;
  NSString *originVersionBuild;
  HDCodableMessageVersion *messageVersion;
  NSString *firstSeenDateTimeZoneName;
  HDCodableSyncIdentity *syncIdentity;
  NSData *uniquenessChecksum;
  char v20;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_59;
  gatewayExternalID = self->_gatewayExternalID;
  if ((unint64_t)gatewayExternalID | *((_QWORD *)v4 + 10))
  {
    if (!-[NSString isEqual:](gatewayExternalID, "isEqual:"))
      goto LABEL_59;
  }
  resourceID = self->_resourceID;
  if ((unint64_t)resourceID | *((_QWORD *)v4 + 15))
  {
    if (!-[NSString isEqual:](resourceID, "isEqual:"))
      goto LABEL_59;
  }
  rawContent = self->_rawContent;
  if ((unint64_t)rawContent | *((_QWORD *)v4 + 13))
  {
    if (!-[NSData isEqual:](rawContent, "isEqual:"))
      goto LABEL_59;
  }
  if ((*(_BYTE *)&self->_has & 0x20) != 0)
  {
    if ((*((_BYTE *)v4 + 160) & 0x20) == 0 || self->_receivedDate != *((double *)v4 + 6))
      goto LABEL_59;
  }
  else if ((*((_BYTE *)v4 + 160) & 0x20) != 0)
  {
    goto LABEL_59;
  }
  resourceType = self->_resourceType;
  if ((unint64_t)resourceType | *((_QWORD *)v4 + 16)
    && !-[NSString isEqual:](resourceType, "isEqual:"))
  {
    goto LABEL_59;
  }
  fhirVersion = self->_fhirVersion;
  if ((unint64_t)fhirVersion | *((_QWORD *)v4 + 8))
  {
    if (!-[NSString isEqual:](fhirVersion, "isEqual:"))
      goto LABEL_59;
  }
  receivedDateTimeZoneName = self->_receivedDateTimeZoneName;
  if ((unint64_t)receivedDateTimeZoneName | *((_QWORD *)v4 + 14))
  {
    if (!-[NSString isEqual:](receivedDateTimeZoneName, "isEqual:"))
      goto LABEL_59;
  }
  sourceURL = self->_sourceURL;
  if ((unint64_t)sourceURL | *((_QWORD *)v4 + 17))
  {
    if (!-[NSString isEqual:](sourceURL, "isEqual:"))
      goto LABEL_59;
  }
  has = (char)self->_has;
  v13 = *((_BYTE *)v4 + 160);
  if ((has & 1) != 0)
  {
    if ((*((_BYTE *)v4 + 160) & 1) == 0 || self->_extractionHints != *((_QWORD *)v4 + 1))
      goto LABEL_59;
  }
  else if ((*((_BYTE *)v4 + 160) & 1) != 0)
  {
    goto LABEL_59;
  }
  accountIdentifier = self->_accountIdentifier;
  if ((unint64_t)accountIdentifier | *((_QWORD *)v4 + 7))
  {
    if (!-[NSString isEqual:](accountIdentifier, "isEqual:"))
    {
LABEL_59:
      v20 = 0;
      goto LABEL_60;
    }
    has = (char)self->_has;
    v13 = *((_BYTE *)v4 + 160);
  }
  if ((has & 4) != 0)
  {
    if ((v13 & 4) == 0 || self->_originVersionMajor != *((_QWORD *)v4 + 3))
      goto LABEL_59;
  }
  else if ((v13 & 4) != 0)
  {
    goto LABEL_59;
  }
  if ((has & 8) != 0)
  {
    if ((v13 & 8) == 0 || self->_originVersionMinor != *((_QWORD *)v4 + 4))
      goto LABEL_59;
  }
  else if ((v13 & 8) != 0)
  {
    goto LABEL_59;
  }
  if ((has & 0x10) != 0)
  {
    if ((v13 & 0x10) == 0 || self->_originVersionPatch != *((_QWORD *)v4 + 5))
      goto LABEL_59;
  }
  else if ((v13 & 0x10) != 0)
  {
    goto LABEL_59;
  }
  originVersionBuild = self->_originVersionBuild;
  if ((unint64_t)originVersionBuild | *((_QWORD *)v4 + 12)
    && !-[NSString isEqual:](originVersionBuild, "isEqual:"))
  {
    goto LABEL_59;
  }
  messageVersion = self->_messageVersion;
  if ((unint64_t)messageVersion | *((_QWORD *)v4 + 11))
  {
    if (!-[HDCodableMessageVersion isEqual:](messageVersion, "isEqual:"))
      goto LABEL_59;
  }
  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
    if ((*((_BYTE *)v4 + 160) & 2) == 0 || self->_firstSeenDate != *((double *)v4 + 2))
      goto LABEL_59;
  }
  else if ((*((_BYTE *)v4 + 160) & 2) != 0)
  {
    goto LABEL_59;
  }
  firstSeenDateTimeZoneName = self->_firstSeenDateTimeZoneName;
  if ((unint64_t)firstSeenDateTimeZoneName | *((_QWORD *)v4 + 9)
    && !-[NSString isEqual:](firstSeenDateTimeZoneName, "isEqual:"))
  {
    goto LABEL_59;
  }
  syncIdentity = self->_syncIdentity;
  if ((unint64_t)syncIdentity | *((_QWORD *)v4 + 18))
  {
    if (!-[HDCodableSyncIdentity isEqual:](syncIdentity, "isEqual:"))
      goto LABEL_59;
  }
  uniquenessChecksum = self->_uniquenessChecksum;
  if ((unint64_t)uniquenessChecksum | *((_QWORD *)v4 + 19))
    v20 = -[NSData isEqual:](uniquenessChecksum, "isEqual:");
  else
    v20 = 1;
LABEL_60:

  return v20;
}

- (unint64_t)hash
{
  double receivedDate;
  double v4;
  long double v5;
  double v6;
  double v7;
  unint64_t v8;
  unint64_t v9;
  unint64_t v10;
  uint64_t v11;
  NSUInteger v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  NSUInteger v16;
  unint64_t v17;
  unint64_t v18;
  double firstSeenDate;
  double v20;
  long double v21;
  double v22;
  NSUInteger v23;
  unint64_t v24;
  NSUInteger v26;
  uint64_t v27;
  NSUInteger v28;
  NSUInteger v29;
  NSUInteger v30;
  unint64_t v31;
  uint64_t v32;
  NSUInteger v33;
  NSUInteger v34;

  v34 = -[NSString hash](self->_gatewayExternalID, "hash");
  v33 = -[NSString hash](self->_resourceID, "hash");
  v32 = -[NSData hash](self->_rawContent, "hash");
  if ((*(_BYTE *)&self->_has & 0x20) != 0)
  {
    receivedDate = self->_receivedDate;
    v4 = -receivedDate;
    if (receivedDate >= 0.0)
      v4 = self->_receivedDate;
    v5 = floor(v4 + 0.5);
    v6 = (v4 - v5) * 1.84467441e19;
    v7 = fmod(v5, 1.84467441e19);
    v8 = 2654435761u * (unint64_t)v7;
    v9 = v8 + (unint64_t)v6;
    if (v6 <= 0.0)
      v9 = 2654435761u * (unint64_t)v7;
    v10 = v8 - (unint64_t)fabs(v6);
    if (v6 >= 0.0)
      v10 = v9;
    v31 = v10;
  }
  else
  {
    v31 = 0;
  }
  v30 = -[NSString hash](self->_resourceType, "hash");
  v29 = -[NSString hash](self->_fhirVersion, "hash");
  v28 = -[NSString hash](self->_receivedDateTimeZoneName, "hash");
  v26 = -[NSString hash](self->_sourceURL, "hash");
  if ((*(_BYTE *)&self->_has & 1) != 0)
    v11 = 2654435761 * self->_extractionHints;
  else
    v11 = 0;
  v12 = -[NSString hash](self->_accountIdentifier, "hash", v26);
  if ((*(_BYTE *)&self->_has & 4) == 0)
  {
    v13 = 0;
    if ((*(_BYTE *)&self->_has & 8) != 0)
      goto LABEL_15;
LABEL_18:
    v14 = 0;
    if ((*(_BYTE *)&self->_has & 0x10) != 0)
      goto LABEL_16;
    goto LABEL_19;
  }
  v13 = 2654435761 * self->_originVersionMajor;
  if ((*(_BYTE *)&self->_has & 8) == 0)
    goto LABEL_18;
LABEL_15:
  v14 = 2654435761 * self->_originVersionMinor;
  if ((*(_BYTE *)&self->_has & 0x10) != 0)
  {
LABEL_16:
    v15 = 2654435761 * self->_originVersionPatch;
    goto LABEL_20;
  }
LABEL_19:
  v15 = 0;
LABEL_20:
  v16 = -[NSString hash](self->_originVersionBuild, "hash");
  v17 = -[HDCodableMessageVersion hash](self->_messageVersion, "hash");
  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
    firstSeenDate = self->_firstSeenDate;
    v20 = -firstSeenDate;
    if (firstSeenDate >= 0.0)
      v20 = self->_firstSeenDate;
    v21 = floor(v20 + 0.5);
    v22 = (v20 - v21) * 1.84467441e19;
    v18 = 2654435761u * (unint64_t)fmod(v21, 1.84467441e19);
    if (v22 >= 0.0)
    {
      if (v22 > 0.0)
        v18 += (unint64_t)v22;
    }
    else
    {
      v18 -= (unint64_t)fabs(v22);
    }
  }
  else
  {
    v18 = 0;
  }
  v23 = v33 ^ v34 ^ v32 ^ v31 ^ v30 ^ v29 ^ v28 ^ v27 ^ v11 ^ v12 ^ v13 ^ v14 ^ v15 ^ v16 ^ v17 ^ v18 ^ -[NSString hash](self->_firstSeenDateTimeZoneName, "hash");
  v24 = -[HDCodableSyncIdentity hash](self->_syncIdentity, "hash");
  return v23 ^ v24 ^ -[NSData hash](self->_uniquenessChecksum, "hash");
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
  if (*((_QWORD *)v4 + 10))
  {
    -[HDCodableFHIRResource setGatewayExternalID:](self, "setGatewayExternalID:");
    v4 = v10;
  }
  if (*((_QWORD *)v4 + 15))
  {
    -[HDCodableFHIRResource setResourceID:](self, "setResourceID:");
    v4 = v10;
  }
  if (*((_QWORD *)v4 + 13))
  {
    -[HDCodableFHIRResource setRawContent:](self, "setRawContent:");
    v4 = v10;
  }
  if ((*((_BYTE *)v4 + 160) & 0x20) != 0)
  {
    self->_receivedDate = *((double *)v4 + 6);
    *(_BYTE *)&self->_has |= 0x20u;
  }
  if (*((_QWORD *)v4 + 16))
  {
    -[HDCodableFHIRResource setResourceType:](self, "setResourceType:");
    v4 = v10;
  }
  if (*((_QWORD *)v4 + 8))
  {
    -[HDCodableFHIRResource setFhirVersion:](self, "setFhirVersion:");
    v4 = v10;
  }
  if (*((_QWORD *)v4 + 14))
  {
    -[HDCodableFHIRResource setReceivedDateTimeZoneName:](self, "setReceivedDateTimeZoneName:");
    v4 = v10;
  }
  if (*((_QWORD *)v4 + 17))
  {
    -[HDCodableFHIRResource setSourceURL:](self, "setSourceURL:");
    v4 = v10;
  }
  if ((*((_BYTE *)v4 + 160) & 1) != 0)
  {
    self->_extractionHints = *((_QWORD *)v4 + 1);
    *(_BYTE *)&self->_has |= 1u;
  }
  if (*((_QWORD *)v4 + 7))
  {
    -[HDCodableFHIRResource setAccountIdentifier:](self, "setAccountIdentifier:");
    v4 = v10;
  }
  v5 = *((_BYTE *)v4 + 160);
  if ((v5 & 4) != 0)
  {
    self->_originVersionMajor = *((_QWORD *)v4 + 3);
    *(_BYTE *)&self->_has |= 4u;
    v5 = *((_BYTE *)v4 + 160);
    if ((v5 & 8) == 0)
    {
LABEL_23:
      if ((v5 & 0x10) == 0)
        goto LABEL_25;
      goto LABEL_24;
    }
  }
  else if ((*((_BYTE *)v4 + 160) & 8) == 0)
  {
    goto LABEL_23;
  }
  self->_originVersionMinor = *((_QWORD *)v4 + 4);
  *(_BYTE *)&self->_has |= 8u;
  if ((*((_BYTE *)v4 + 160) & 0x10) != 0)
  {
LABEL_24:
    self->_originVersionPatch = *((_QWORD *)v4 + 5);
    *(_BYTE *)&self->_has |= 0x10u;
  }
LABEL_25:
  if (*((_QWORD *)v4 + 12))
  {
    -[HDCodableFHIRResource setOriginVersionBuild:](self, "setOriginVersionBuild:");
    v4 = v10;
  }
  messageVersion = self->_messageVersion;
  v7 = *((_QWORD *)v4 + 11);
  if (messageVersion)
  {
    if (!v7)
      goto LABEL_36;
    -[HDCodableMessageVersion mergeFrom:](messageVersion, "mergeFrom:");
  }
  else
  {
    if (!v7)
      goto LABEL_36;
    -[HDCodableFHIRResource setMessageVersion:](self, "setMessageVersion:");
  }
  v4 = v10;
LABEL_36:
  if ((*((_BYTE *)v4 + 160) & 2) != 0)
  {
    self->_firstSeenDate = *((double *)v4 + 2);
    *(_BYTE *)&self->_has |= 2u;
  }
  if (*((_QWORD *)v4 + 9))
  {
    -[HDCodableFHIRResource setFirstSeenDateTimeZoneName:](self, "setFirstSeenDateTimeZoneName:");
    v4 = v10;
  }
  syncIdentity = self->_syncIdentity;
  v9 = *((_QWORD *)v4 + 18);
  if (syncIdentity)
  {
    if (!v9)
      goto LABEL_46;
    -[HDCodableSyncIdentity mergeFrom:](syncIdentity, "mergeFrom:");
  }
  else
  {
    if (!v9)
      goto LABEL_46;
    -[HDCodableFHIRResource setSyncIdentity:](self, "setSyncIdentity:");
  }
  v4 = v10;
LABEL_46:
  if (*((_QWORD *)v4 + 19))
  {
    -[HDCodableFHIRResource setUniquenessChecksum:](self, "setUniquenessChecksum:");
    v4 = v10;
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

- (NSString)resourceID
{
  return self->_resourceID;
}

- (void)setResourceID:(id)a3
{
  objc_storeStrong((id *)&self->_resourceID, a3);
}

- (NSData)rawContent
{
  return self->_rawContent;
}

- (void)setRawContent:(id)a3
{
  objc_storeStrong((id *)&self->_rawContent, a3);
}

- (double)receivedDate
{
  return self->_receivedDate;
}

- (NSString)resourceType
{
  return self->_resourceType;
}

- (void)setResourceType:(id)a3
{
  objc_storeStrong((id *)&self->_resourceType, a3);
}

- (NSString)fhirVersion
{
  return self->_fhirVersion;
}

- (void)setFhirVersion:(id)a3
{
  objc_storeStrong((id *)&self->_fhirVersion, a3);
}

- (NSString)receivedDateTimeZoneName
{
  return self->_receivedDateTimeZoneName;
}

- (void)setReceivedDateTimeZoneName:(id)a3
{
  objc_storeStrong((id *)&self->_receivedDateTimeZoneName, a3);
}

- (NSString)sourceURL
{
  return self->_sourceURL;
}

- (void)setSourceURL:(id)a3
{
  objc_storeStrong((id *)&self->_sourceURL, a3);
}

- (int64_t)extractionHints
{
  return self->_extractionHints;
}

- (NSString)accountIdentifier
{
  return self->_accountIdentifier;
}

- (void)setAccountIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_accountIdentifier, a3);
}

- (int64_t)originVersionMajor
{
  return self->_originVersionMajor;
}

- (int64_t)originVersionMinor
{
  return self->_originVersionMinor;
}

- (int64_t)originVersionPatch
{
  return self->_originVersionPatch;
}

- (NSString)originVersionBuild
{
  return self->_originVersionBuild;
}

- (void)setOriginVersionBuild:(id)a3
{
  objc_storeStrong((id *)&self->_originVersionBuild, a3);
}

- (HDCodableMessageVersion)messageVersion
{
  return self->_messageVersion;
}

- (void)setMessageVersion:(id)a3
{
  objc_storeStrong((id *)&self->_messageVersion, a3);
}

- (double)firstSeenDate
{
  return self->_firstSeenDate;
}

- (NSString)firstSeenDateTimeZoneName
{
  return self->_firstSeenDateTimeZoneName;
}

- (void)setFirstSeenDateTimeZoneName:(id)a3
{
  objc_storeStrong((id *)&self->_firstSeenDateTimeZoneName, a3);
}

- (HDCodableSyncIdentity)syncIdentity
{
  return self->_syncIdentity;
}

- (void)setSyncIdentity:(id)a3
{
  objc_storeStrong((id *)&self->_syncIdentity, a3);
}

- (NSData)uniquenessChecksum
{
  return self->_uniquenessChecksum;
}

- (void)setUniquenessChecksum:(id)a3
{
  objc_storeStrong((id *)&self->_uniquenessChecksum, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_uniquenessChecksum, 0);
  objc_storeStrong((id *)&self->_syncIdentity, 0);
  objc_storeStrong((id *)&self->_sourceURL, 0);
  objc_storeStrong((id *)&self->_resourceType, 0);
  objc_storeStrong((id *)&self->_resourceID, 0);
  objc_storeStrong((id *)&self->_receivedDateTimeZoneName, 0);
  objc_storeStrong((id *)&self->_rawContent, 0);
  objc_storeStrong((id *)&self->_originVersionBuild, 0);
  objc_storeStrong((id *)&self->_messageVersion, 0);
  objc_storeStrong((id *)&self->_gatewayExternalID, 0);
  objc_storeStrong((id *)&self->_firstSeenDateTimeZoneName, 0);
  objc_storeStrong((id *)&self->_fhirVersion, 0);
  objc_storeStrong((id *)&self->_accountIdentifier, 0);
}

@end
