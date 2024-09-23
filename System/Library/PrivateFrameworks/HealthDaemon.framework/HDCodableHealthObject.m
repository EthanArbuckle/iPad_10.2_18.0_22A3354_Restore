@implementation HDCodableHealthObject

- (id)decodedMetadata
{
  void *v2;

  if (self->_metadataDictionary)
  {
    objc_msgSend(MEMORY[0x1E0C99D80], "hk_dictionaryWithCodableMetadata:");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v2 = 0;
  }
  return v2;
}

- (BOOL)applyToObject:(id)a3
{
  id v4;
  char isKindOfClass;
  void *v6;
  void *v7;
  void *v8;
  double creationDate;

  v4 = a3;
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();
  if ((isKindOfClass & 1) != 0)
  {
    if (self->_uuid)
    {
      objc_msgSend(MEMORY[0x1E0CB3A28], "hk_UUIDWithData:");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "_setUUID:", v6);

    }
    else
    {
      objc_msgSend(v4, "_setUUID:");
    }
    -[HDCodableHealthObject decodedMetadata](self, "decodedMetadata");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "_setMetadata:", v7);

    -[HDCodableHealthObject sourceBundleIdentifier](self, "sourceBundleIdentifier");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "_setSourceBundleIdentifier:", v8);

    if ((*(_BYTE *)&self->_has & 1) != 0)
      creationDate = self->_creationDate;
    else
      creationDate = 2.22507386e-308;
    objc_msgSend(v4, "_setCreationTimestamp:", creationDate);
  }

  return isKindOfClass & 1;
}

- (BOOL)hasUuid
{
  return self->_uuid != 0;
}

- (BOOL)hasMetadataDictionary
{
  return self->_metadataDictionary != 0;
}

- (BOOL)hasSourceBundleIdentifier
{
  return self->_sourceBundleIdentifier != 0;
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

- (void)setExternalSyncObjectCode:(int64_t)a3
{
  *(_BYTE *)&self->_has |= 2u;
  self->_externalSyncObjectCode = a3;
}

- (void)setHasExternalSyncObjectCode:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFD | v3;
}

- (BOOL)hasExternalSyncObjectCode
{
  return (*(_BYTE *)&self->_has >> 1) & 1;
}

- (NSString)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  objc_super v8;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v8.receiver = self;
  v8.super_class = (Class)HDCodableHealthObject;
  -[HDCodableHealthObject description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[HDCodableHealthObject dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v6;
}

- (id)dictionaryRepresentation
{
  void *v3;
  void *v4;
  NSData *uuid;
  HDCodableMetadataDictionary *metadataDictionary;
  void *v7;
  NSString *sourceBundleIdentifier;
  char has;
  void *v10;
  void *v11;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  uuid = self->_uuid;
  if (uuid)
    objc_msgSend(v3, "setObject:forKey:", uuid, CFSTR("uuid"));
  metadataDictionary = self->_metadataDictionary;
  if (metadataDictionary)
  {
    -[HDCodableMetadataDictionary dictionaryRepresentation](metadataDictionary, "dictionaryRepresentation");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v7, CFSTR("metadataDictionary"));

  }
  sourceBundleIdentifier = self->_sourceBundleIdentifier;
  if (sourceBundleIdentifier)
    objc_msgSend(v4, "setObject:forKey:", sourceBundleIdentifier, CFSTR("sourceBundleIdentifier"));
  has = (char)self->_has;
  if ((has & 1) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->_creationDate);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v10, CFSTR("creationDate"));

    has = (char)self->_has;
  }
  if ((has & 2) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", self->_externalSyncObjectCode);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v11, CFSTR("externalSyncObjectCode"));

  }
  return v4;
}

- (BOOL)readFrom:(id)a3
{
  return HDCodableHealthObjectReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4;
  char has;
  id v6;

  v4 = a3;
  v6 = v4;
  if (self->_uuid)
  {
    PBDataWriterWriteDataField();
    v4 = v6;
  }
  if (self->_metadataDictionary)
  {
    PBDataWriterWriteSubmessage();
    v4 = v6;
  }
  if (self->_sourceBundleIdentifier)
  {
    PBDataWriterWriteStringField();
    v4 = v6;
  }
  has = (char)self->_has;
  if ((has & 1) != 0)
  {
    PBDataWriterWriteDoubleField();
    v4 = v6;
    has = (char)self->_has;
  }
  if ((has & 2) != 0)
  {
    PBDataWriterWriteInt64Field();
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
  if (self->_uuid)
  {
    objc_msgSend(v4, "setUuid:");
    v4 = v6;
  }
  if (self->_metadataDictionary)
  {
    objc_msgSend(v6, "setMetadataDictionary:");
    v4 = v6;
  }
  if (self->_sourceBundleIdentifier)
  {
    objc_msgSend(v6, "setSourceBundleIdentifier:");
    v4 = v6;
  }
  has = (char)self->_has;
  if ((has & 1) != 0)
  {
    *((_QWORD *)v4 + 1) = *(_QWORD *)&self->_creationDate;
    *((_BYTE *)v4 + 48) |= 1u;
    has = (char)self->_has;
  }
  if ((has & 2) != 0)
  {
    *((_QWORD *)v4 + 2) = self->_externalSyncObjectCode;
    *((_BYTE *)v4 + 48) |= 2u;
  }

}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5;
  uint64_t v6;
  void *v7;
  id v8;
  void *v9;
  uint64_t v10;
  void *v11;
  char has;

  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = -[NSData copyWithZone:](self->_uuid, "copyWithZone:", a3);
  v7 = *(void **)(v5 + 40);
  *(_QWORD *)(v5 + 40) = v6;

  v8 = -[HDCodableMetadataDictionary copyWithZone:](self->_metadataDictionary, "copyWithZone:", a3);
  v9 = *(void **)(v5 + 24);
  *(_QWORD *)(v5 + 24) = v8;

  v10 = -[NSString copyWithZone:](self->_sourceBundleIdentifier, "copyWithZone:", a3);
  v11 = *(void **)(v5 + 32);
  *(_QWORD *)(v5 + 32) = v10;

  has = (char)self->_has;
  if ((has & 1) != 0)
  {
    *(double *)(v5 + 8) = self->_creationDate;
    *(_BYTE *)(v5 + 48) |= 1u;
    has = (char)self->_has;
  }
  if ((has & 2) != 0)
  {
    *(_QWORD *)(v5 + 16) = self->_externalSyncObjectCode;
    *(_BYTE *)(v5 + 48) |= 2u;
  }
  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  NSData *uuid;
  HDCodableMetadataDictionary *metadataDictionary;
  NSString *sourceBundleIdentifier;
  BOOL v8;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_17;
  uuid = self->_uuid;
  if ((unint64_t)uuid | *((_QWORD *)v4 + 5))
  {
    if (!-[NSData isEqual:](uuid, "isEqual:"))
      goto LABEL_17;
  }
  metadataDictionary = self->_metadataDictionary;
  if ((unint64_t)metadataDictionary | *((_QWORD *)v4 + 3))
  {
    if (!-[HDCodableMetadataDictionary isEqual:](metadataDictionary, "isEqual:"))
      goto LABEL_17;
  }
  sourceBundleIdentifier = self->_sourceBundleIdentifier;
  if ((unint64_t)sourceBundleIdentifier | *((_QWORD *)v4 + 4))
  {
    if (!-[NSString isEqual:](sourceBundleIdentifier, "isEqual:"))
      goto LABEL_17;
  }
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    if ((*((_BYTE *)v4 + 48) & 1) == 0 || self->_creationDate != *((double *)v4 + 1))
      goto LABEL_17;
  }
  else if ((*((_BYTE *)v4 + 48) & 1) != 0)
  {
LABEL_17:
    v8 = 0;
    goto LABEL_18;
  }
  v8 = (*((_BYTE *)v4 + 48) & 2) == 0;
  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
    if ((*((_BYTE *)v4 + 48) & 2) == 0 || self->_externalSyncObjectCode != *((_QWORD *)v4 + 2))
      goto LABEL_17;
    v8 = 1;
  }
LABEL_18:

  return v8;
}

- (unint64_t)hash
{
  uint64_t v3;
  unint64_t v4;
  NSUInteger v5;
  char has;
  unint64_t v7;
  double creationDate;
  double v9;
  long double v10;
  double v11;
  uint64_t v12;

  v3 = -[NSData hash](self->_uuid, "hash");
  v4 = -[HDCodableMetadataDictionary hash](self->_metadataDictionary, "hash");
  v5 = -[NSString hash](self->_sourceBundleIdentifier, "hash");
  has = (char)self->_has;
  if ((has & 1) != 0)
  {
    creationDate = self->_creationDate;
    v9 = -creationDate;
    if (creationDate >= 0.0)
      v9 = self->_creationDate;
    v10 = floor(v9 + 0.5);
    v11 = (v9 - v10) * 1.84467441e19;
    v7 = 2654435761u * (unint64_t)fmod(v10, 1.84467441e19);
    if (v11 >= 0.0)
    {
      if (v11 > 0.0)
        v7 += (unint64_t)v11;
    }
    else
    {
      v7 -= (unint64_t)fabs(v11);
    }
  }
  else
  {
    v7 = 0;
  }
  if ((has & 2) != 0)
    v12 = 2654435761 * self->_externalSyncObjectCode;
  else
    v12 = 0;
  return v4 ^ v3 ^ v5 ^ v7 ^ v12;
}

- (void)mergeFrom:(id)a3
{
  id v4;
  HDCodableMetadataDictionary *metadataDictionary;
  uint64_t v6;
  char v7;
  id v8;

  v4 = a3;
  v8 = v4;
  if (*((_QWORD *)v4 + 5))
  {
    -[HDCodableHealthObject setUuid:](self, "setUuid:");
    v4 = v8;
  }
  metadataDictionary = self->_metadataDictionary;
  v6 = *((_QWORD *)v4 + 3);
  if (metadataDictionary)
  {
    if (!v6)
      goto LABEL_9;
    -[HDCodableMetadataDictionary mergeFrom:](metadataDictionary, "mergeFrom:");
  }
  else
  {
    if (!v6)
      goto LABEL_9;
    -[HDCodableHealthObject setMetadataDictionary:](self, "setMetadataDictionary:");
  }
  v4 = v8;
LABEL_9:
  if (*((_QWORD *)v4 + 4))
  {
    -[HDCodableHealthObject setSourceBundleIdentifier:](self, "setSourceBundleIdentifier:");
    v4 = v8;
  }
  v7 = *((_BYTE *)v4 + 48);
  if ((v7 & 1) != 0)
  {
    self->_creationDate = *((double *)v4 + 1);
    *(_BYTE *)&self->_has |= 1u;
    v7 = *((_BYTE *)v4 + 48);
  }
  if ((v7 & 2) != 0)
  {
    self->_externalSyncObjectCode = *((_QWORD *)v4 + 2);
    *(_BYTE *)&self->_has |= 2u;
  }

}

- (NSData)uuid
{
  return self->_uuid;
}

- (void)setUuid:(id)a3
{
  objc_storeStrong((id *)&self->_uuid, a3);
}

- (HDCodableMetadataDictionary)metadataDictionary
{
  return self->_metadataDictionary;
}

- (void)setMetadataDictionary:(id)a3
{
  objc_storeStrong((id *)&self->_metadataDictionary, a3);
}

- (NSString)sourceBundleIdentifier
{
  return self->_sourceBundleIdentifier;
}

- (void)setSourceBundleIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_sourceBundleIdentifier, a3);
}

- (double)creationDate
{
  return self->_creationDate;
}

- (int64_t)externalSyncObjectCode
{
  return self->_externalSyncObjectCode;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_uuid, 0);
  objc_storeStrong((id *)&self->_sourceBundleIdentifier, 0);
  objc_storeStrong((id *)&self->_metadataDictionary, 0);
}

@end
