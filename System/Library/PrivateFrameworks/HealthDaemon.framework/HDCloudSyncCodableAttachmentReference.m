@implementation HDCloudSyncCodableAttachmentReference

- (BOOL)hasObjectIdentifier
{
  return self->_objectIdentifier != 0;
}

- (BOOL)hasSchemaIdentifier
{
  return self->_schemaIdentifier != 0;
}

- (BOOL)hasAttachmentIdentifier
{
  return self->_attachmentIdentifier != 0;
}

- (void)setType:(int64_t)a3
{
  *(_BYTE *)&self->_has |= 8u;
  self->_type = a3;
}

- (void)setHasType:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 8;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xF7 | v3;
}

- (BOOL)hasType
{
  return (*(_BYTE *)&self->_has >> 3) & 1;
}

- (void)setCreationDate:(double)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_creationDate = a3;
}

- (void)setHasCreationDate:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (BOOL)hasCreationDate
{
  return *(_BYTE *)&self->_has & 1;
}

- (void)setOptions:(int64_t)a3
{
  *(_BYTE *)&self->_has |= 2u;
  self->_options = a3;
}

- (void)setHasOptions:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFD | v3;
}

- (BOOL)hasOptions
{
  return (*(_BYTE *)&self->_has >> 1) & 1;
}

- (BOOL)hasMetadata
{
  return self->_metadata != 0;
}

- (void)setSchemaVersion:(int64_t)a3
{
  *(_BYTE *)&self->_has |= 4u;
  self->_schemaVersion = a3;
}

- (void)setHasSchemaVersion:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 4;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFB | v3;
}

- (BOOL)hasSchemaVersion
{
  return (*(_BYTE *)&self->_has >> 2) & 1;
}

- (BOOL)hasSystemBuildVersion
{
  return self->_systemBuildVersion != 0;
}

- (BOOL)hasProductType
{
  return self->_productType != 0;
}

- (BOOL)hasDeviceName
{
  return self->_deviceName != 0;
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
  v8.super_class = (Class)HDCloudSyncCodableAttachmentReference;
  -[HDCloudSyncCodableAttachmentReference description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[HDCloudSyncCodableAttachmentReference dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  void *v3;
  void *v4;
  NSString *objectIdentifier;
  NSString *schemaIdentifier;
  NSString *attachmentIdentifier;
  char has;
  void *v9;
  NSData *metadata;
  void *v11;
  NSString *systemBuildVersion;
  NSString *productType;
  NSString *deviceName;
  void *v16;
  void *v17;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  objectIdentifier = self->_objectIdentifier;
  if (objectIdentifier)
    objc_msgSend(v3, "setObject:forKey:", objectIdentifier, CFSTR("objectIdentifier"));
  schemaIdentifier = self->_schemaIdentifier;
  if (schemaIdentifier)
    objc_msgSend(v4, "setObject:forKey:", schemaIdentifier, CFSTR("schemaIdentifier"));
  attachmentIdentifier = self->_attachmentIdentifier;
  if (attachmentIdentifier)
    objc_msgSend(v4, "setObject:forKey:", attachmentIdentifier, CFSTR("attachmentIdentifier"));
  has = (char)self->_has;
  if ((has & 8) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", self->_type);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v16, CFSTR("type"));

    has = (char)self->_has;
    if ((has & 1) == 0)
    {
LABEL_9:
      if ((has & 2) == 0)
        goto LABEL_11;
      goto LABEL_10;
    }
  }
  else if ((*(_BYTE *)&self->_has & 1) == 0)
  {
    goto LABEL_9;
  }
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->_creationDate);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKey:", v17, CFSTR("creationDate"));

  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
LABEL_10:
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", self->_options);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v9, CFSTR("options"));

  }
LABEL_11:
  metadata = self->_metadata;
  if (metadata)
    objc_msgSend(v4, "setObject:forKey:", metadata, CFSTR("metadata"));
  if ((*(_BYTE *)&self->_has & 4) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", self->_schemaVersion);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v11, CFSTR("schemaVersion"));

  }
  systemBuildVersion = self->_systemBuildVersion;
  if (systemBuildVersion)
    objc_msgSend(v4, "setObject:forKey:", systemBuildVersion, CFSTR("systemBuildVersion"));
  productType = self->_productType;
  if (productType)
    objc_msgSend(v4, "setObject:forKey:", productType, CFSTR("productType"));
  deviceName = self->_deviceName;
  if (deviceName)
    objc_msgSend(v4, "setObject:forKey:", deviceName, CFSTR("deviceName"));
  return v4;
}

- (BOOL)readFrom:(id)a3
{
  return HDCloudSyncCodableAttachmentReferenceReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4;
  char has;
  id v6;

  v4 = a3;
  v6 = v4;
  if (self->_objectIdentifier)
  {
    PBDataWriterWriteStringField();
    v4 = v6;
  }
  if (self->_schemaIdentifier)
  {
    PBDataWriterWriteStringField();
    v4 = v6;
  }
  if (self->_attachmentIdentifier)
  {
    PBDataWriterWriteStringField();
    v4 = v6;
  }
  has = (char)self->_has;
  if ((has & 8) != 0)
  {
    PBDataWriterWriteInt64Field();
    v4 = v6;
    has = (char)self->_has;
    if ((has & 1) == 0)
    {
LABEL_9:
      if ((has & 2) == 0)
        goto LABEL_11;
      goto LABEL_10;
    }
  }
  else if ((*(_BYTE *)&self->_has & 1) == 0)
  {
    goto LABEL_9;
  }
  PBDataWriterWriteDoubleField();
  v4 = v6;
  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
LABEL_10:
    PBDataWriterWriteInt64Field();
    v4 = v6;
  }
LABEL_11:
  if (self->_metadata)
  {
    PBDataWriterWriteDataField();
    v4 = v6;
  }
  if ((*(_BYTE *)&self->_has & 4) != 0)
  {
    PBDataWriterWriteInt64Field();
    v4 = v6;
  }
  if (self->_systemBuildVersion)
  {
    PBDataWriterWriteStringField();
    v4 = v6;
  }
  if (self->_productType)
  {
    PBDataWriterWriteStringField();
    v4 = v6;
  }
  if (self->_deviceName)
  {
    PBDataWriterWriteStringField();
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
  if (self->_objectIdentifier)
  {
    objc_msgSend(v4, "setObjectIdentifier:");
    v4 = v6;
  }
  if (self->_schemaIdentifier)
  {
    objc_msgSend(v6, "setSchemaIdentifier:");
    v4 = v6;
  }
  if (self->_attachmentIdentifier)
  {
    objc_msgSend(v6, "setAttachmentIdentifier:");
    v4 = v6;
  }
  has = (char)self->_has;
  if ((has & 8) != 0)
  {
    *((_QWORD *)v4 + 4) = self->_type;
    *((_BYTE *)v4 + 96) |= 8u;
    has = (char)self->_has;
    if ((has & 1) == 0)
    {
LABEL_9:
      if ((has & 2) == 0)
        goto LABEL_11;
      goto LABEL_10;
    }
  }
  else if ((*(_BYTE *)&self->_has & 1) == 0)
  {
    goto LABEL_9;
  }
  *((_QWORD *)v4 + 1) = *(_QWORD *)&self->_creationDate;
  *((_BYTE *)v4 + 96) |= 1u;
  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
LABEL_10:
    *((_QWORD *)v4 + 2) = self->_options;
    *((_BYTE *)v4 + 96) |= 2u;
  }
LABEL_11:
  if (self->_metadata)
  {
    objc_msgSend(v6, "setMetadata:");
    v4 = v6;
  }
  if ((*(_BYTE *)&self->_has & 4) != 0)
  {
    *((_QWORD *)v4 + 3) = self->_schemaVersion;
    *((_BYTE *)v4 + 96) |= 4u;
  }
  if (self->_systemBuildVersion)
  {
    objc_msgSend(v6, "setSystemBuildVersion:");
    v4 = v6;
  }
  if (self->_productType)
  {
    objc_msgSend(v6, "setProductType:");
    v4 = v6;
  }
  if (self->_deviceName)
  {
    objc_msgSend(v6, "setDeviceName:");
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
  char has;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  void *v18;
  uint64_t v19;
  void *v20;

  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = -[NSString copyWithZone:](self->_objectIdentifier, "copyWithZone:", a3);
  v7 = *(void **)(v5 + 64);
  *(_QWORD *)(v5 + 64) = v6;

  v8 = -[NSString copyWithZone:](self->_schemaIdentifier, "copyWithZone:", a3);
  v9 = *(void **)(v5 + 80);
  *(_QWORD *)(v5 + 80) = v8;

  v10 = -[NSString copyWithZone:](self->_attachmentIdentifier, "copyWithZone:", a3);
  v11 = *(void **)(v5 + 40);
  *(_QWORD *)(v5 + 40) = v10;

  has = (char)self->_has;
  if ((has & 8) != 0)
  {
    *(_QWORD *)(v5 + 32) = self->_type;
    *(_BYTE *)(v5 + 96) |= 8u;
    has = (char)self->_has;
    if ((has & 1) == 0)
    {
LABEL_3:
      if ((has & 2) == 0)
        goto LABEL_5;
      goto LABEL_4;
    }
  }
  else if ((*(_BYTE *)&self->_has & 1) == 0)
  {
    goto LABEL_3;
  }
  *(double *)(v5 + 8) = self->_creationDate;
  *(_BYTE *)(v5 + 96) |= 1u;
  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
LABEL_4:
    *(_QWORD *)(v5 + 16) = self->_options;
    *(_BYTE *)(v5 + 96) |= 2u;
  }
LABEL_5:
  v13 = -[NSData copyWithZone:](self->_metadata, "copyWithZone:", a3);
  v14 = *(void **)(v5 + 56);
  *(_QWORD *)(v5 + 56) = v13;

  if ((*(_BYTE *)&self->_has & 4) != 0)
  {
    *(_QWORD *)(v5 + 24) = self->_schemaVersion;
    *(_BYTE *)(v5 + 96) |= 4u;
  }
  v15 = -[NSString copyWithZone:](self->_systemBuildVersion, "copyWithZone:", a3);
  v16 = *(void **)(v5 + 88);
  *(_QWORD *)(v5 + 88) = v15;

  v17 = -[NSString copyWithZone:](self->_productType, "copyWithZone:", a3);
  v18 = *(void **)(v5 + 72);
  *(_QWORD *)(v5 + 72) = v17;

  v19 = -[NSString copyWithZone:](self->_deviceName, "copyWithZone:", a3);
  v20 = *(void **)(v5 + 48);
  *(_QWORD *)(v5 + 48) = v19;

  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  NSString *objectIdentifier;
  NSString *schemaIdentifier;
  NSString *attachmentIdentifier;
  char has;
  char v9;
  NSData *metadata;
  NSString *systemBuildVersion;
  NSString *productType;
  NSString *deviceName;
  char v14;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_37;
  objectIdentifier = self->_objectIdentifier;
  if ((unint64_t)objectIdentifier | *((_QWORD *)v4 + 8))
  {
    if (!-[NSString isEqual:](objectIdentifier, "isEqual:"))
      goto LABEL_37;
  }
  schemaIdentifier = self->_schemaIdentifier;
  if ((unint64_t)schemaIdentifier | *((_QWORD *)v4 + 10))
  {
    if (!-[NSString isEqual:](schemaIdentifier, "isEqual:"))
      goto LABEL_37;
  }
  attachmentIdentifier = self->_attachmentIdentifier;
  if ((unint64_t)attachmentIdentifier | *((_QWORD *)v4 + 5))
  {
    if (!-[NSString isEqual:](attachmentIdentifier, "isEqual:"))
      goto LABEL_37;
  }
  has = (char)self->_has;
  v9 = *((_BYTE *)v4 + 96);
  if ((has & 8) != 0)
  {
    if ((*((_BYTE *)v4 + 96) & 8) == 0 || self->_type != *((_QWORD *)v4 + 4))
      goto LABEL_37;
  }
  else if ((*((_BYTE *)v4 + 96) & 8) != 0)
  {
    goto LABEL_37;
  }
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    if ((*((_BYTE *)v4 + 96) & 1) == 0 || self->_creationDate != *((double *)v4 + 1))
      goto LABEL_37;
  }
  else if ((*((_BYTE *)v4 + 96) & 1) != 0)
  {
    goto LABEL_37;
  }
  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
    if ((*((_BYTE *)v4 + 96) & 2) == 0 || self->_options != *((_QWORD *)v4 + 2))
      goto LABEL_37;
  }
  else if ((*((_BYTE *)v4 + 96) & 2) != 0)
  {
    goto LABEL_37;
  }
  metadata = self->_metadata;
  if ((unint64_t)metadata | *((_QWORD *)v4 + 7))
  {
    if (!-[NSData isEqual:](metadata, "isEqual:"))
    {
LABEL_37:
      v14 = 0;
      goto LABEL_38;
    }
    has = (char)self->_has;
    v9 = *((_BYTE *)v4 + 96);
  }
  if ((has & 4) != 0)
  {
    if ((v9 & 4) == 0 || self->_schemaVersion != *((_QWORD *)v4 + 3))
      goto LABEL_37;
  }
  else if ((v9 & 4) != 0)
  {
    goto LABEL_37;
  }
  systemBuildVersion = self->_systemBuildVersion;
  if ((unint64_t)systemBuildVersion | *((_QWORD *)v4 + 11)
    && !-[NSString isEqual:](systemBuildVersion, "isEqual:"))
  {
    goto LABEL_37;
  }
  productType = self->_productType;
  if ((unint64_t)productType | *((_QWORD *)v4 + 9))
  {
    if (!-[NSString isEqual:](productType, "isEqual:"))
      goto LABEL_37;
  }
  deviceName = self->_deviceName;
  if ((unint64_t)deviceName | *((_QWORD *)v4 + 6))
    v14 = -[NSString isEqual:](deviceName, "isEqual:");
  else
    v14 = 1;
LABEL_38:

  return v14;
}

- (unint64_t)hash
{
  NSUInteger v3;
  NSUInteger v4;
  NSUInteger v5;
  char has;
  uint64_t v7;
  double creationDate;
  double v9;
  long double v10;
  double v11;
  unint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  NSUInteger v16;
  NSUInteger v17;
  NSUInteger v18;

  v3 = -[NSString hash](self->_objectIdentifier, "hash");
  v4 = -[NSString hash](self->_schemaIdentifier, "hash");
  v5 = -[NSString hash](self->_attachmentIdentifier, "hash");
  has = (char)self->_has;
  if ((has & 8) != 0)
  {
    v7 = 2654435761 * self->_type;
    if ((*(_BYTE *)&self->_has & 1) != 0)
      goto LABEL_3;
LABEL_8:
    v12 = 0;
    goto LABEL_11;
  }
  v7 = 0;
  if ((*(_BYTE *)&self->_has & 1) == 0)
    goto LABEL_8;
LABEL_3:
  creationDate = self->_creationDate;
  v9 = -creationDate;
  if (creationDate >= 0.0)
    v9 = self->_creationDate;
  v10 = floor(v9 + 0.5);
  v11 = (v9 - v10) * 1.84467441e19;
  v12 = 2654435761u * (unint64_t)fmod(v10, 1.84467441e19);
  if (v11 >= 0.0)
  {
    if (v11 > 0.0)
      v12 += (unint64_t)v11;
  }
  else
  {
    v12 -= (unint64_t)fabs(v11);
  }
LABEL_11:
  if ((has & 2) != 0)
    v13 = 2654435761 * self->_options;
  else
    v13 = 0;
  v14 = -[NSData hash](self->_metadata, "hash");
  if ((*(_BYTE *)&self->_has & 4) != 0)
    v15 = 2654435761 * self->_schemaVersion;
  else
    v15 = 0;
  v16 = v4 ^ v3 ^ v5 ^ v7 ^ v12 ^ v13 ^ v14 ^ v15;
  v17 = -[NSString hash](self->_systemBuildVersion, "hash");
  v18 = v17 ^ -[NSString hash](self->_productType, "hash");
  return v16 ^ v18 ^ -[NSString hash](self->_deviceName, "hash");
}

- (void)mergeFrom:(id)a3
{
  id v4;
  char v5;
  id v6;

  v4 = a3;
  v6 = v4;
  if (*((_QWORD *)v4 + 8))
  {
    -[HDCloudSyncCodableAttachmentReference setObjectIdentifier:](self, "setObjectIdentifier:");
    v4 = v6;
  }
  if (*((_QWORD *)v4 + 10))
  {
    -[HDCloudSyncCodableAttachmentReference setSchemaIdentifier:](self, "setSchemaIdentifier:");
    v4 = v6;
  }
  if (*((_QWORD *)v4 + 5))
  {
    -[HDCloudSyncCodableAttachmentReference setAttachmentIdentifier:](self, "setAttachmentIdentifier:");
    v4 = v6;
  }
  v5 = *((_BYTE *)v4 + 96);
  if ((v5 & 8) != 0)
  {
    self->_type = *((_QWORD *)v4 + 4);
    *(_BYTE *)&self->_has |= 8u;
    v5 = *((_BYTE *)v4 + 96);
    if ((v5 & 1) == 0)
    {
LABEL_9:
      if ((v5 & 2) == 0)
        goto LABEL_11;
      goto LABEL_10;
    }
  }
  else if ((*((_BYTE *)v4 + 96) & 1) == 0)
  {
    goto LABEL_9;
  }
  self->_creationDate = *((double *)v4 + 1);
  *(_BYTE *)&self->_has |= 1u;
  if ((*((_BYTE *)v4 + 96) & 2) != 0)
  {
LABEL_10:
    self->_options = *((_QWORD *)v4 + 2);
    *(_BYTE *)&self->_has |= 2u;
  }
LABEL_11:
  if (*((_QWORD *)v4 + 7))
  {
    -[HDCloudSyncCodableAttachmentReference setMetadata:](self, "setMetadata:");
    v4 = v6;
  }
  if ((*((_BYTE *)v4 + 96) & 4) != 0)
  {
    self->_schemaVersion = *((_QWORD *)v4 + 3);
    *(_BYTE *)&self->_has |= 4u;
  }
  if (*((_QWORD *)v4 + 11))
  {
    -[HDCloudSyncCodableAttachmentReference setSystemBuildVersion:](self, "setSystemBuildVersion:");
    v4 = v6;
  }
  if (*((_QWORD *)v4 + 9))
  {
    -[HDCloudSyncCodableAttachmentReference setProductType:](self, "setProductType:");
    v4 = v6;
  }
  if (*((_QWORD *)v4 + 6))
  {
    -[HDCloudSyncCodableAttachmentReference setDeviceName:](self, "setDeviceName:");
    v4 = v6;
  }

}

- (NSString)objectIdentifier
{
  return self->_objectIdentifier;
}

- (void)setObjectIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_objectIdentifier, a3);
}

- (NSString)schemaIdentifier
{
  return self->_schemaIdentifier;
}

- (void)setSchemaIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_schemaIdentifier, a3);
}

- (NSString)attachmentIdentifier
{
  return self->_attachmentIdentifier;
}

- (void)setAttachmentIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_attachmentIdentifier, a3);
}

- (int64_t)type
{
  return self->_type;
}

- (double)creationDate
{
  return self->_creationDate;
}

- (int64_t)options
{
  return self->_options;
}

- (NSData)metadata
{
  return self->_metadata;
}

- (void)setMetadata:(id)a3
{
  objc_storeStrong((id *)&self->_metadata, a3);
}

- (int64_t)schemaVersion
{
  return self->_schemaVersion;
}

- (NSString)systemBuildVersion
{
  return self->_systemBuildVersion;
}

- (void)setSystemBuildVersion:(id)a3
{
  objc_storeStrong((id *)&self->_systemBuildVersion, a3);
}

- (NSString)productType
{
  return self->_productType;
}

- (void)setProductType:(id)a3
{
  objc_storeStrong((id *)&self->_productType, a3);
}

- (NSString)deviceName
{
  return self->_deviceName;
}

- (void)setDeviceName:(id)a3
{
  objc_storeStrong((id *)&self->_deviceName, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_systemBuildVersion, 0);
  objc_storeStrong((id *)&self->_schemaIdentifier, 0);
  objc_storeStrong((id *)&self->_productType, 0);
  objc_storeStrong((id *)&self->_objectIdentifier, 0);
  objc_storeStrong((id *)&self->_metadata, 0);
  objc_storeStrong((id *)&self->_deviceName, 0);
  objc_storeStrong((id *)&self->_attachmentIdentifier, 0);
}

@end
