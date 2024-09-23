@implementation HDCodableOriginalSignedClinicalDataRecord

- (BOOL)hasMessageVersion
{
  return self->_messageVersion != 0;
}

- (BOOL)hasSyncIdentifier
{
  return self->_syncIdentifier != 0;
}

- (BOOL)hasGatewayExternalID
{
  return self->_gatewayExternalID != 0;
}

- (BOOL)hasIssuerIdentifier
{
  return self->_issuerIdentifier != 0;
}

- (BOOL)hasSourceURL
{
  return self->_sourceURL != 0;
}

- (BOOL)hasRawContent
{
  return self->_rawContent != 0;
}

- (void)clearTypes
{
  -[NSMutableArray removeAllObjects](self->_types, "removeAllObjects");
}

- (void)addType:(id)a3
{
  id v4;
  NSMutableArray *types;
  NSMutableArray *v6;
  NSMutableArray *v7;
  id v8;

  v4 = a3;
  types = self->_types;
  v8 = v4;
  if (!types)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v7 = self->_types;
    self->_types = v6;

    v4 = v8;
    types = self->_types;
  }
  -[NSMutableArray addObject:](types, "addObject:", v4);

}

- (unint64_t)typesCount
{
  return -[NSMutableArray count](self->_types, "count");
}

- (id)typeAtIndex:(unint64_t)a3
{
  return (id)-[NSMutableArray objectAtIndex:](self->_types, "objectAtIndex:", a3);
}

+ (Class)typeType
{
  return (Class)objc_opt_class();
}

- (BOOL)hasMetadata
{
  return self->_metadata != 0;
}

- (void)setReceivedDate:(double)a3
{
  *(_BYTE *)&self->_has |= 4u;
  self->_receivedDate = a3;
}

- (void)setHasReceivedDate:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 4;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFB | v3;
}

- (BOOL)hasReceivedDate
{
  return (*(_BYTE *)&self->_has >> 2) & 1;
}

- (BOOL)hasReceivedDateTimeZoneName
{
  return self->_receivedDateTimeZoneName != 0;
}

- (void)setFirstSeenDate:(double)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_firstSeenDate = a3;
}

- (void)setHasFirstSeenDate:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (BOOL)hasFirstSeenDate
{
  return *(_BYTE *)&self->_has & 1;
}

- (BOOL)hasFirstSeenDateTimeZoneName
{
  return self->_firstSeenDateTimeZoneName != 0;
}

- (void)setSignatureStatus:(int64_t)a3
{
  *(_BYTE *)&self->_has |= 8u;
  self->_signatureStatus = a3;
}

- (void)setHasSignatureStatus:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 8;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xF7 | v3;
}

- (BOOL)hasSignatureStatus
{
  return (*(_BYTE *)&self->_has >> 3) & 1;
}

- (BOOL)hasUniquenessChecksum
{
  return self->_uniquenessChecksum != 0;
}

- (void)setLastModifiedDate:(double)a3
{
  *(_BYTE *)&self->_has |= 2u;
  self->_lastModifiedDate = a3;
}

- (void)setHasLastModifiedDate:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFD | v3;
}

- (BOOL)hasLastModifiedDate
{
  return (*(_BYTE *)&self->_has >> 1) & 1;
}

- (void)setDeleted:(BOOL)a3
{
  *(_BYTE *)&self->_has |= 0x20u;
  self->_deleted = a3;
}

- (void)setHasDeleted:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 32;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xDF | v3;
}

- (BOOL)hasDeleted
{
  return (*(_BYTE *)&self->_has >> 5) & 1;
}

- (void)setSourceType:(int64_t)a3
{
  *(_BYTE *)&self->_has |= 0x10u;
  self->_sourceType = a3;
}

- (void)setHasSourceType:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 16;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xEF | v3;
}

- (BOOL)hasSourceType
{
  return (*(_BYTE *)&self->_has >> 4) & 1;
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
  v8.super_class = (Class)HDCodableOriginalSignedClinicalDataRecord;
  -[HDCodableOriginalSignedClinicalDataRecord description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[HDCodableOriginalSignedClinicalDataRecord dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  void *v3;
  HDCodableMessageVersion *messageVersion;
  void *v5;
  NSData *syncIdentifier;
  NSString *gatewayExternalID;
  NSString *issuerIdentifier;
  NSString *sourceURL;
  NSData *rawContent;
  NSMutableArray *types;
  HDCodableMetadataDictionary *metadata;
  void *v13;
  void *v14;
  NSString *receivedDateTimeZoneName;
  void *v16;
  NSString *firstSeenDateTimeZoneName;
  void *v18;
  NSData *uniquenessChecksum;
  char has;
  void *v21;
  HDCodableSyncIdentity *syncIdentity;
  void *v23;
  void *v25;
  void *v26;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  messageVersion = self->_messageVersion;
  if (messageVersion)
  {
    -[HDCodableMessageVersion dictionaryRepresentation](messageVersion, "dictionaryRepresentation");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v5, CFSTR("messageVersion"));

  }
  syncIdentifier = self->_syncIdentifier;
  if (syncIdentifier)
    objc_msgSend(v3, "setObject:forKey:", syncIdentifier, CFSTR("syncIdentifier"));
  gatewayExternalID = self->_gatewayExternalID;
  if (gatewayExternalID)
    objc_msgSend(v3, "setObject:forKey:", gatewayExternalID, CFSTR("gatewayExternalID"));
  issuerIdentifier = self->_issuerIdentifier;
  if (issuerIdentifier)
    objc_msgSend(v3, "setObject:forKey:", issuerIdentifier, CFSTR("issuerIdentifier"));
  sourceURL = self->_sourceURL;
  if (sourceURL)
    objc_msgSend(v3, "setObject:forKey:", sourceURL, CFSTR("sourceURL"));
  rawContent = self->_rawContent;
  if (rawContent)
    objc_msgSend(v3, "setObject:forKey:", rawContent, CFSTR("rawContent"));
  types = self->_types;
  if (types)
    objc_msgSend(v3, "setObject:forKey:", types, CFSTR("type"));
  metadata = self->_metadata;
  if (metadata)
  {
    -[HDCodableMetadataDictionary dictionaryRepresentation](metadata, "dictionaryRepresentation");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v13, CFSTR("metadata"));

  }
  if ((*(_BYTE *)&self->_has & 4) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->_receivedDate);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v14, CFSTR("receivedDate"));

  }
  receivedDateTimeZoneName = self->_receivedDateTimeZoneName;
  if (receivedDateTimeZoneName)
    objc_msgSend(v3, "setObject:forKey:", receivedDateTimeZoneName, CFSTR("receivedDateTimeZoneName"));
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->_firstSeenDate);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v16, CFSTR("firstSeenDate"));

  }
  firstSeenDateTimeZoneName = self->_firstSeenDateTimeZoneName;
  if (firstSeenDateTimeZoneName)
    objc_msgSend(v3, "setObject:forKey:", firstSeenDateTimeZoneName, CFSTR("firstSeenDateTimeZoneName"));
  if ((*(_BYTE *)&self->_has & 8) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", self->_signatureStatus);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v18, CFSTR("signatureStatus"));

  }
  uniquenessChecksum = self->_uniquenessChecksum;
  if (uniquenessChecksum)
    objc_msgSend(v3, "setObject:forKey:", uniquenessChecksum, CFSTR("uniquenessChecksum"));
  has = (char)self->_has;
  if ((has & 2) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->_lastModifiedDate);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v25, CFSTR("lastModifiedDate"));

    has = (char)self->_has;
    if ((has & 0x20) == 0)
    {
LABEL_31:
      if ((has & 0x10) == 0)
        goto LABEL_33;
      goto LABEL_32;
    }
  }
  else if ((*(_BYTE *)&self->_has & 0x20) == 0)
  {
    goto LABEL_31;
  }
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_deleted);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v26, CFSTR("deleted"));

  if ((*(_BYTE *)&self->_has & 0x10) != 0)
  {
LABEL_32:
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", self->_sourceType);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v21, CFSTR("sourceType"));

  }
LABEL_33:
  syncIdentity = self->_syncIdentity;
  if (syncIdentity)
  {
    -[HDCodableSyncIdentity dictionaryRepresentation](syncIdentity, "dictionaryRepresentation");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v23, CFSTR("syncIdentity"));

  }
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return HDCodableOriginalSignedClinicalDataRecordReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4;
  NSMutableArray *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  char has;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (self->_messageVersion)
    PBDataWriterWriteSubmessage();
  if (self->_syncIdentifier)
    PBDataWriterWriteDataField();
  if (self->_gatewayExternalID)
    PBDataWriterWriteStringField();
  if (self->_issuerIdentifier)
    PBDataWriterWriteStringField();
  if (self->_sourceURL)
    PBDataWriterWriteStringField();
  if (self->_rawContent)
    PBDataWriterWriteDataField();
  v13 = 0u;
  v14 = 0u;
  v11 = 0u;
  v12 = 0u;
  v5 = self->_types;
  v6 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v12;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v12 != v8)
          objc_enumerationMutation(v5);
        PBDataWriterWriteStringField();
      }
      v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v7);
  }

  if (self->_metadata)
    PBDataWriterWriteSubmessage();
  if ((*(_BYTE *)&self->_has & 4) != 0)
    PBDataWriterWriteDoubleField();
  if (self->_receivedDateTimeZoneName)
    PBDataWriterWriteStringField();
  if ((*(_BYTE *)&self->_has & 1) != 0)
    PBDataWriterWriteDoubleField();
  if (self->_firstSeenDateTimeZoneName)
    PBDataWriterWriteStringField();
  if ((*(_BYTE *)&self->_has & 8) != 0)
    PBDataWriterWriteInt64Field();
  if (self->_uniquenessChecksum)
    PBDataWriterWriteDataField();
  has = (char)self->_has;
  if ((has & 2) != 0)
  {
    PBDataWriterWriteDoubleField();
    has = (char)self->_has;
    if ((has & 0x20) == 0)
    {
LABEL_36:
      if ((has & 0x10) == 0)
        goto LABEL_38;
      goto LABEL_37;
    }
  }
  else if ((*(_BYTE *)&self->_has & 0x20) == 0)
  {
    goto LABEL_36;
  }
  PBDataWriterWriteBOOLField();
  if ((*(_BYTE *)&self->_has & 0x10) != 0)
LABEL_37:
    PBDataWriterWriteInt64Field();
LABEL_38:
  if (self->_syncIdentity)
    PBDataWriterWriteSubmessage();

}

- (void)copyTo:(id)a3
{
  unint64_t v4;
  unint64_t v5;
  uint64_t i;
  void *v7;
  _QWORD *v8;
  char has;
  id v10;

  v10 = a3;
  if (self->_messageVersion)
    objc_msgSend(v10, "setMessageVersion:");
  if (self->_syncIdentifier)
    objc_msgSend(v10, "setSyncIdentifier:");
  if (self->_gatewayExternalID)
    objc_msgSend(v10, "setGatewayExternalID:");
  if (self->_issuerIdentifier)
    objc_msgSend(v10, "setIssuerIdentifier:");
  if (self->_sourceURL)
    objc_msgSend(v10, "setSourceURL:");
  if (self->_rawContent)
    objc_msgSend(v10, "setRawContent:");
  if (-[HDCodableOriginalSignedClinicalDataRecord typesCount](self, "typesCount"))
  {
    objc_msgSend(v10, "clearTypes");
    v4 = -[HDCodableOriginalSignedClinicalDataRecord typesCount](self, "typesCount");
    if (v4)
    {
      v5 = v4;
      for (i = 0; i != v5; ++i)
      {
        -[HDCodableOriginalSignedClinicalDataRecord typeAtIndex:](self, "typeAtIndex:", i);
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "addType:", v7);

      }
    }
  }
  if (self->_metadata)
    objc_msgSend(v10, "setMetadata:");
  v8 = v10;
  if ((*(_BYTE *)&self->_has & 4) != 0)
  {
    *((_QWORD *)v10 + 3) = *(_QWORD *)&self->_receivedDate;
    *((_BYTE *)v10 + 148) |= 4u;
  }
  if (self->_receivedDateTimeZoneName)
  {
    objc_msgSend(v10, "setReceivedDateTimeZoneName:");
    v8 = v10;
  }
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    v8[1] = *(_QWORD *)&self->_firstSeenDate;
    *((_BYTE *)v8 + 148) |= 1u;
  }
  if (self->_firstSeenDateTimeZoneName)
  {
    objc_msgSend(v10, "setFirstSeenDateTimeZoneName:");
    v8 = v10;
  }
  if ((*(_BYTE *)&self->_has & 8) != 0)
  {
    v8[4] = self->_signatureStatus;
    *((_BYTE *)v8 + 148) |= 8u;
  }
  if (self->_uniquenessChecksum)
  {
    objc_msgSend(v10, "setUniquenessChecksum:");
    v8 = v10;
  }
  has = (char)self->_has;
  if ((has & 2) != 0)
  {
    v8[2] = *(_QWORD *)&self->_lastModifiedDate;
    *((_BYTE *)v8 + 148) |= 2u;
    has = (char)self->_has;
    if ((has & 0x20) == 0)
    {
LABEL_33:
      if ((has & 0x10) == 0)
        goto LABEL_35;
      goto LABEL_34;
    }
  }
  else if ((*(_BYTE *)&self->_has & 0x20) == 0)
  {
    goto LABEL_33;
  }
  *((_BYTE *)v8 + 144) = self->_deleted;
  *((_BYTE *)v8 + 148) |= 0x20u;
  if ((*(_BYTE *)&self->_has & 0x10) != 0)
  {
LABEL_34:
    v8[5] = self->_sourceType;
    *((_BYTE *)v8 + 148) |= 0x10u;
  }
LABEL_35:
  if (self->_syncIdentity)
  {
    objc_msgSend(v10, "setSyncIdentity:");
    v8 = v10;
  }

}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5;
  id v6;
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
  NSMutableArray *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t i;
  void *v23;
  id v24;
  void *v25;
  uint64_t v26;
  void *v27;
  uint64_t v28;
  void *v29;
  uint64_t v30;
  void *v31;
  char has;
  id v33;
  void *v34;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  _BYTE v40[128];
  uint64_t v41;

  v41 = *MEMORY[0x1E0C80C00];
  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = -[HDCodableMessageVersion copyWithZone:](self->_messageVersion, "copyWithZone:", a3);
  v7 = *(void **)(v5 + 72);
  *(_QWORD *)(v5 + 72) = v6;

  v8 = -[NSData copyWithZone:](self->_syncIdentifier, "copyWithZone:", a3);
  v9 = *(void **)(v5 + 112);
  *(_QWORD *)(v5 + 112) = v8;

  v10 = -[NSString copyWithZone:](self->_gatewayExternalID, "copyWithZone:", a3);
  v11 = *(void **)(v5 + 56);
  *(_QWORD *)(v5 + 56) = v10;

  v12 = -[NSString copyWithZone:](self->_issuerIdentifier, "copyWithZone:", a3);
  v13 = *(void **)(v5 + 64);
  *(_QWORD *)(v5 + 64) = v12;

  v14 = -[NSString copyWithZone:](self->_sourceURL, "copyWithZone:", a3);
  v15 = *(void **)(v5 + 104);
  *(_QWORD *)(v5 + 104) = v14;

  v16 = -[NSData copyWithZone:](self->_rawContent, "copyWithZone:", a3);
  v17 = *(void **)(v5 + 88);
  *(_QWORD *)(v5 + 88) = v16;

  v38 = 0u;
  v39 = 0u;
  v36 = 0u;
  v37 = 0u;
  v18 = self->_types;
  v19 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v18, "countByEnumeratingWithState:objects:count:", &v36, v40, 16);
  if (v19)
  {
    v20 = v19;
    v21 = *(_QWORD *)v37;
    do
    {
      for (i = 0; i != v20; ++i)
      {
        if (*(_QWORD *)v37 != v21)
          objc_enumerationMutation(v18);
        v23 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v36 + 1) + 8 * i), "copyWithZone:", a3, (_QWORD)v36);
        objc_msgSend((id)v5, "addType:", v23);

      }
      v20 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v18, "countByEnumeratingWithState:objects:count:", &v36, v40, 16);
    }
    while (v20);
  }

  v24 = -[HDCodableMetadataDictionary copyWithZone:](self->_metadata, "copyWithZone:", a3);
  v25 = *(void **)(v5 + 80);
  *(_QWORD *)(v5 + 80) = v24;

  if ((*(_BYTE *)&self->_has & 4) != 0)
  {
    *(double *)(v5 + 24) = self->_receivedDate;
    *(_BYTE *)(v5 + 148) |= 4u;
  }
  v26 = -[NSString copyWithZone:](self->_receivedDateTimeZoneName, "copyWithZone:", a3, (_QWORD)v36);
  v27 = *(void **)(v5 + 96);
  *(_QWORD *)(v5 + 96) = v26;

  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    *(double *)(v5 + 8) = self->_firstSeenDate;
    *(_BYTE *)(v5 + 148) |= 1u;
  }
  v28 = -[NSString copyWithZone:](self->_firstSeenDateTimeZoneName, "copyWithZone:", a3);
  v29 = *(void **)(v5 + 48);
  *(_QWORD *)(v5 + 48) = v28;

  if ((*(_BYTE *)&self->_has & 8) != 0)
  {
    *(_QWORD *)(v5 + 32) = self->_signatureStatus;
    *(_BYTE *)(v5 + 148) |= 8u;
  }
  v30 = -[NSData copyWithZone:](self->_uniquenessChecksum, "copyWithZone:", a3);
  v31 = *(void **)(v5 + 136);
  *(_QWORD *)(v5 + 136) = v30;

  has = (char)self->_has;
  if ((has & 2) == 0)
  {
    if ((*(_BYTE *)&self->_has & 0x20) == 0)
      goto LABEL_16;
LABEL_20:
    *(_BYTE *)(v5 + 144) = self->_deleted;
    *(_BYTE *)(v5 + 148) |= 0x20u;
    if ((*(_BYTE *)&self->_has & 0x10) == 0)
      goto LABEL_18;
    goto LABEL_17;
  }
  *(double *)(v5 + 16) = self->_lastModifiedDate;
  *(_BYTE *)(v5 + 148) |= 2u;
  has = (char)self->_has;
  if ((has & 0x20) != 0)
    goto LABEL_20;
LABEL_16:
  if ((has & 0x10) != 0)
  {
LABEL_17:
    *(_QWORD *)(v5 + 40) = self->_sourceType;
    *(_BYTE *)(v5 + 148) |= 0x10u;
  }
LABEL_18:
  v33 = -[HDCodableSyncIdentity copyWithZone:](self->_syncIdentity, "copyWithZone:", a3);
  v34 = *(void **)(v5 + 120);
  *(_QWORD *)(v5 + 120) = v33;

  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  HDCodableMessageVersion *messageVersion;
  NSData *syncIdentifier;
  NSString *gatewayExternalID;
  NSString *issuerIdentifier;
  NSString *sourceURL;
  NSData *rawContent;
  NSMutableArray *types;
  HDCodableMetadataDictionary *metadata;
  char has;
  char v14;
  NSString *receivedDateTimeZoneName;
  NSString *firstSeenDateTimeZoneName;
  NSData *uniquenessChecksum;
  HDCodableSyncIdentity *syncIdentity;
  char v19;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_62;
  messageVersion = self->_messageVersion;
  if ((unint64_t)messageVersion | *((_QWORD *)v4 + 9))
  {
    if (!-[HDCodableMessageVersion isEqual:](messageVersion, "isEqual:"))
      goto LABEL_62;
  }
  syncIdentifier = self->_syncIdentifier;
  if ((unint64_t)syncIdentifier | *((_QWORD *)v4 + 14))
  {
    if (!-[NSData isEqual:](syncIdentifier, "isEqual:"))
      goto LABEL_62;
  }
  gatewayExternalID = self->_gatewayExternalID;
  if ((unint64_t)gatewayExternalID | *((_QWORD *)v4 + 7))
  {
    if (!-[NSString isEqual:](gatewayExternalID, "isEqual:"))
      goto LABEL_62;
  }
  issuerIdentifier = self->_issuerIdentifier;
  if ((unint64_t)issuerIdentifier | *((_QWORD *)v4 + 8))
  {
    if (!-[NSString isEqual:](issuerIdentifier, "isEqual:"))
      goto LABEL_62;
  }
  sourceURL = self->_sourceURL;
  if ((unint64_t)sourceURL | *((_QWORD *)v4 + 13))
  {
    if (!-[NSString isEqual:](sourceURL, "isEqual:"))
      goto LABEL_62;
  }
  rawContent = self->_rawContent;
  if ((unint64_t)rawContent | *((_QWORD *)v4 + 11))
  {
    if (!-[NSData isEqual:](rawContent, "isEqual:"))
      goto LABEL_62;
  }
  types = self->_types;
  if ((unint64_t)types | *((_QWORD *)v4 + 16))
  {
    if (!-[NSMutableArray isEqual:](types, "isEqual:"))
      goto LABEL_62;
  }
  metadata = self->_metadata;
  if ((unint64_t)metadata | *((_QWORD *)v4 + 10))
  {
    if (!-[HDCodableMetadataDictionary isEqual:](metadata, "isEqual:"))
      goto LABEL_62;
  }
  has = (char)self->_has;
  v14 = *((_BYTE *)v4 + 148);
  if ((has & 4) != 0)
  {
    if ((*((_BYTE *)v4 + 148) & 4) == 0 || self->_receivedDate != *((double *)v4 + 3))
      goto LABEL_62;
  }
  else if ((*((_BYTE *)v4 + 148) & 4) != 0)
  {
    goto LABEL_62;
  }
  receivedDateTimeZoneName = self->_receivedDateTimeZoneName;
  if ((unint64_t)receivedDateTimeZoneName | *((_QWORD *)v4 + 12))
  {
    if (!-[NSString isEqual:](receivedDateTimeZoneName, "isEqual:"))
      goto LABEL_62;
    has = (char)self->_has;
    v14 = *((_BYTE *)v4 + 148);
  }
  if ((has & 1) != 0)
  {
    if ((v14 & 1) == 0 || self->_firstSeenDate != *((double *)v4 + 1))
      goto LABEL_62;
  }
  else if ((v14 & 1) != 0)
  {
    goto LABEL_62;
  }
  firstSeenDateTimeZoneName = self->_firstSeenDateTimeZoneName;
  if ((unint64_t)firstSeenDateTimeZoneName | *((_QWORD *)v4 + 6))
  {
    if (!-[NSString isEqual:](firstSeenDateTimeZoneName, "isEqual:"))
      goto LABEL_62;
    has = (char)self->_has;
    v14 = *((_BYTE *)v4 + 148);
  }
  if ((has & 8) != 0)
  {
    if ((v14 & 8) == 0 || self->_signatureStatus != *((_QWORD *)v4 + 4))
      goto LABEL_62;
  }
  else if ((v14 & 8) != 0)
  {
    goto LABEL_62;
  }
  uniquenessChecksum = self->_uniquenessChecksum;
  if ((unint64_t)uniquenessChecksum | *((_QWORD *)v4 + 17))
  {
    if (!-[NSData isEqual:](uniquenessChecksum, "isEqual:"))
      goto LABEL_62;
    has = (char)self->_has;
    v14 = *((_BYTE *)v4 + 148);
  }
  if ((has & 2) != 0)
  {
    if ((v14 & 2) == 0 || self->_lastModifiedDate != *((double *)v4 + 2))
      goto LABEL_62;
  }
  else if ((v14 & 2) != 0)
  {
    goto LABEL_62;
  }
  if ((has & 0x20) != 0)
  {
    if ((v14 & 0x20) != 0)
    {
      if (self->_deleted)
      {
        if (!*((_BYTE *)v4 + 144))
          goto LABEL_62;
        goto LABEL_55;
      }
      if (!*((_BYTE *)v4 + 144))
        goto LABEL_55;
    }
LABEL_62:
    v19 = 0;
    goto LABEL_63;
  }
  if ((v14 & 0x20) != 0)
    goto LABEL_62;
LABEL_55:
  if ((has & 0x10) != 0)
  {
    if ((v14 & 0x10) == 0 || self->_sourceType != *((_QWORD *)v4 + 5))
      goto LABEL_62;
  }
  else if ((v14 & 0x10) != 0)
  {
    goto LABEL_62;
  }
  syncIdentity = self->_syncIdentity;
  if ((unint64_t)syncIdentity | *((_QWORD *)v4 + 15))
    v19 = -[HDCodableSyncIdentity isEqual:](syncIdentity, "isEqual:");
  else
    v19 = 1;
LABEL_63:

  return v19;
}

- (unint64_t)hash
{
  unint64_t v3;
  unint64_t v4;
  double receivedDate;
  double v6;
  long double v7;
  double v8;
  NSUInteger v9;
  unint64_t v10;
  double firstSeenDate;
  double v12;
  long double v13;
  double v14;
  NSUInteger v15;
  uint64_t v16;
  uint64_t v17;
  char has;
  unint64_t v19;
  double lastModifiedDate;
  double v21;
  long double v22;
  double v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v27;
  uint64_t v28;
  NSUInteger v29;
  NSUInteger v30;
  NSUInteger v31;
  uint64_t v32;
  unint64_t v33;

  v33 = -[HDCodableMessageVersion hash](self->_messageVersion, "hash");
  v32 = -[NSData hash](self->_syncIdentifier, "hash");
  v31 = -[NSString hash](self->_gatewayExternalID, "hash");
  v30 = -[NSString hash](self->_issuerIdentifier, "hash");
  v29 = -[NSString hash](self->_sourceURL, "hash");
  v28 = -[NSData hash](self->_rawContent, "hash");
  v27 = -[NSMutableArray hash](self->_types, "hash");
  v3 = -[HDCodableMetadataDictionary hash](self->_metadata, "hash");
  if ((*(_BYTE *)&self->_has & 4) != 0)
  {
    receivedDate = self->_receivedDate;
    v6 = -receivedDate;
    if (receivedDate >= 0.0)
      v6 = self->_receivedDate;
    v7 = floor(v6 + 0.5);
    v8 = (v6 - v7) * 1.84467441e19;
    v4 = 2654435761u * (unint64_t)fmod(v7, 1.84467441e19);
    if (v8 >= 0.0)
    {
      if (v8 > 0.0)
        v4 += (unint64_t)v8;
    }
    else
    {
      v4 -= (unint64_t)fabs(v8);
    }
  }
  else
  {
    v4 = 0;
  }
  v9 = -[NSString hash](self->_receivedDateTimeZoneName, "hash");
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    firstSeenDate = self->_firstSeenDate;
    v12 = -firstSeenDate;
    if (firstSeenDate >= 0.0)
      v12 = self->_firstSeenDate;
    v13 = floor(v12 + 0.5);
    v14 = (v12 - v13) * 1.84467441e19;
    v10 = 2654435761u * (unint64_t)fmod(v13, 1.84467441e19);
    if (v14 >= 0.0)
    {
      if (v14 > 0.0)
        v10 += (unint64_t)v14;
    }
    else
    {
      v10 -= (unint64_t)fabs(v14);
    }
  }
  else
  {
    v10 = 0;
  }
  v15 = -[NSString hash](self->_firstSeenDateTimeZoneName, "hash");
  if ((*(_BYTE *)&self->_has & 8) != 0)
    v16 = 2654435761 * self->_signatureStatus;
  else
    v16 = 0;
  v17 = -[NSData hash](self->_uniquenessChecksum, "hash");
  has = (char)self->_has;
  if ((has & 2) != 0)
  {
    lastModifiedDate = self->_lastModifiedDate;
    v21 = -lastModifiedDate;
    if (lastModifiedDate >= 0.0)
      v21 = self->_lastModifiedDate;
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
  if ((has & 0x20) != 0)
  {
    v24 = 2654435761 * self->_deleted;
    if ((has & 0x10) != 0)
      goto LABEL_30;
LABEL_32:
    v25 = 0;
    return v32 ^ v33 ^ v31 ^ v30 ^ v29 ^ v28 ^ v27 ^ v3 ^ v4 ^ v9 ^ v10 ^ v15 ^ v16 ^ v17 ^ v19 ^ v24 ^ v25 ^ -[HDCodableSyncIdentity hash](self->_syncIdentity, "hash");
  }
  v24 = 0;
  if ((has & 0x10) == 0)
    goto LABEL_32;
LABEL_30:
  v25 = 2654435761 * self->_sourceType;
  return v32 ^ v33 ^ v31 ^ v30 ^ v29 ^ v28 ^ v27 ^ v3 ^ v4 ^ v9 ^ v10 ^ v15 ^ v16 ^ v17 ^ v19 ^ v24 ^ v25 ^ -[HDCodableSyncIdentity hash](self->_syncIdentity, "hash");
}

- (void)mergeFrom:(id)a3
{
  id v4;
  HDCodableMessageVersion *messageVersion;
  uint64_t v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  HDCodableMetadataDictionary *metadata;
  uint64_t v13;
  char v14;
  HDCodableSyncIdentity *syncIdentity;
  uint64_t v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  messageVersion = self->_messageVersion;
  v6 = *((_QWORD *)v4 + 9);
  if (messageVersion)
  {
    if (v6)
      -[HDCodableMessageVersion mergeFrom:](messageVersion, "mergeFrom:");
  }
  else if (v6)
  {
    -[HDCodableOriginalSignedClinicalDataRecord setMessageVersion:](self, "setMessageVersion:");
  }
  if (*((_QWORD *)v4 + 14))
    -[HDCodableOriginalSignedClinicalDataRecord setSyncIdentifier:](self, "setSyncIdentifier:");
  if (*((_QWORD *)v4 + 7))
    -[HDCodableOriginalSignedClinicalDataRecord setGatewayExternalID:](self, "setGatewayExternalID:");
  if (*((_QWORD *)v4 + 8))
    -[HDCodableOriginalSignedClinicalDataRecord setIssuerIdentifier:](self, "setIssuerIdentifier:");
  if (*((_QWORD *)v4 + 13))
    -[HDCodableOriginalSignedClinicalDataRecord setSourceURL:](self, "setSourceURL:");
  if (*((_QWORD *)v4 + 11))
    -[HDCodableOriginalSignedClinicalDataRecord setRawContent:](self, "setRawContent:");
  v19 = 0u;
  v20 = 0u;
  v17 = 0u;
  v18 = 0u;
  v7 = *((id *)v4 + 16);
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v18;
    do
    {
      for (i = 0; i != v9; ++i)
      {
        if (*(_QWORD *)v18 != v10)
          objc_enumerationMutation(v7);
        -[HDCodableOriginalSignedClinicalDataRecord addType:](self, "addType:", *(_QWORD *)(*((_QWORD *)&v17 + 1) + 8 * i), (_QWORD)v17);
      }
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
    }
    while (v9);
  }

  metadata = self->_metadata;
  v13 = *((_QWORD *)v4 + 10);
  if (metadata)
  {
    if (v13)
      -[HDCodableMetadataDictionary mergeFrom:](metadata, "mergeFrom:");
  }
  else if (v13)
  {
    -[HDCodableOriginalSignedClinicalDataRecord setMetadata:](self, "setMetadata:");
  }
  if ((*((_BYTE *)v4 + 148) & 4) != 0)
  {
    self->_receivedDate = *((double *)v4 + 3);
    *(_BYTE *)&self->_has |= 4u;
  }
  if (*((_QWORD *)v4 + 12))
    -[HDCodableOriginalSignedClinicalDataRecord setReceivedDateTimeZoneName:](self, "setReceivedDateTimeZoneName:");
  if ((*((_BYTE *)v4 + 148) & 1) != 0)
  {
    self->_firstSeenDate = *((double *)v4 + 1);
    *(_BYTE *)&self->_has |= 1u;
  }
  if (*((_QWORD *)v4 + 6))
    -[HDCodableOriginalSignedClinicalDataRecord setFirstSeenDateTimeZoneName:](self, "setFirstSeenDateTimeZoneName:");
  if ((*((_BYTE *)v4 + 148) & 8) != 0)
  {
    self->_signatureStatus = *((_QWORD *)v4 + 4);
    *(_BYTE *)&self->_has |= 8u;
  }
  if (*((_QWORD *)v4 + 17))
    -[HDCodableOriginalSignedClinicalDataRecord setUniquenessChecksum:](self, "setUniquenessChecksum:");
  v14 = *((_BYTE *)v4 + 148);
  if ((v14 & 2) != 0)
  {
    self->_lastModifiedDate = *((double *)v4 + 2);
    *(_BYTE *)&self->_has |= 2u;
    v14 = *((_BYTE *)v4 + 148);
    if ((v14 & 0x20) == 0)
    {
LABEL_42:
      if ((v14 & 0x10) == 0)
        goto LABEL_44;
      goto LABEL_43;
    }
  }
  else if ((*((_BYTE *)v4 + 148) & 0x20) == 0)
  {
    goto LABEL_42;
  }
  self->_deleted = *((_BYTE *)v4 + 144);
  *(_BYTE *)&self->_has |= 0x20u;
  if ((*((_BYTE *)v4 + 148) & 0x10) != 0)
  {
LABEL_43:
    self->_sourceType = *((_QWORD *)v4 + 5);
    *(_BYTE *)&self->_has |= 0x10u;
  }
LABEL_44:
  syncIdentity = self->_syncIdentity;
  v16 = *((_QWORD *)v4 + 15);
  if (syncIdentity)
  {
    if (v16)
      -[HDCodableSyncIdentity mergeFrom:](syncIdentity, "mergeFrom:");
  }
  else if (v16)
  {
    -[HDCodableOriginalSignedClinicalDataRecord setSyncIdentity:](self, "setSyncIdentity:");
  }

}

- (HDCodableMessageVersion)messageVersion
{
  return self->_messageVersion;
}

- (void)setMessageVersion:(id)a3
{
  objc_storeStrong((id *)&self->_messageVersion, a3);
}

- (NSData)syncIdentifier
{
  return self->_syncIdentifier;
}

- (void)setSyncIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_syncIdentifier, a3);
}

- (NSString)gatewayExternalID
{
  return self->_gatewayExternalID;
}

- (void)setGatewayExternalID:(id)a3
{
  objc_storeStrong((id *)&self->_gatewayExternalID, a3);
}

- (NSString)issuerIdentifier
{
  return self->_issuerIdentifier;
}

- (void)setIssuerIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_issuerIdentifier, a3);
}

- (NSString)sourceURL
{
  return self->_sourceURL;
}

- (void)setSourceURL:(id)a3
{
  objc_storeStrong((id *)&self->_sourceURL, a3);
}

- (NSData)rawContent
{
  return self->_rawContent;
}

- (void)setRawContent:(id)a3
{
  objc_storeStrong((id *)&self->_rawContent, a3);
}

- (NSMutableArray)types
{
  return self->_types;
}

- (void)setTypes:(id)a3
{
  objc_storeStrong((id *)&self->_types, a3);
}

- (HDCodableMetadataDictionary)metadata
{
  return self->_metadata;
}

- (void)setMetadata:(id)a3
{
  objc_storeStrong((id *)&self->_metadata, a3);
}

- (double)receivedDate
{
  return self->_receivedDate;
}

- (NSString)receivedDateTimeZoneName
{
  return self->_receivedDateTimeZoneName;
}

- (void)setReceivedDateTimeZoneName:(id)a3
{
  objc_storeStrong((id *)&self->_receivedDateTimeZoneName, a3);
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

- (int64_t)signatureStatus
{
  return self->_signatureStatus;
}

- (NSData)uniquenessChecksum
{
  return self->_uniquenessChecksum;
}

- (void)setUniquenessChecksum:(id)a3
{
  objc_storeStrong((id *)&self->_uniquenessChecksum, a3);
}

- (double)lastModifiedDate
{
  return self->_lastModifiedDate;
}

- (BOOL)deleted
{
  return self->_deleted;
}

- (int64_t)sourceType
{
  return self->_sourceType;
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
  objc_storeStrong((id *)&self->_uniquenessChecksum, 0);
  objc_storeStrong((id *)&self->_types, 0);
  objc_storeStrong((id *)&self->_syncIdentity, 0);
  objc_storeStrong((id *)&self->_syncIdentifier, 0);
  objc_storeStrong((id *)&self->_sourceURL, 0);
  objc_storeStrong((id *)&self->_receivedDateTimeZoneName, 0);
  objc_storeStrong((id *)&self->_rawContent, 0);
  objc_storeStrong((id *)&self->_metadata, 0);
  objc_storeStrong((id *)&self->_messageVersion, 0);
  objc_storeStrong((id *)&self->_issuerIdentifier, 0);
  objc_storeStrong((id *)&self->_gatewayExternalID, 0);
  objc_storeStrong((id *)&self->_firstSeenDateTimeZoneName, 0);
}

@end
