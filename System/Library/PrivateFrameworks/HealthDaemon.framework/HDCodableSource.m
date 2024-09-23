@implementation HDCodableSource

- (void)setBundleIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_bundleIdentifier, a3);
}

- (void)setUuid:(id)a3
{
  objc_storeStrong((id *)&self->_uuid, a3);
}

- (void)setName:(id)a3
{
  objc_storeStrong((id *)&self->_name, a3);
}

- (void)setProductType:(id)a3
{
  objc_storeStrong((id *)&self->_productType, a3);
}

- (void)setDeleted:(BOOL)a3
{
  *(_BYTE *)&self->_has |= 4u;
  self->_deleted = a3;
}

- (void)setOptions:(int64_t)a3
{
  *(_BYTE *)&self->_has |= 2u;
  self->_options = a3;
}

- (void)setModificationDate:(double)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_modificationDate = a3;
}

- (NSData)uuid
{
  return self->_uuid;
}

- (void)writeTo:(id)a3
{
  id v4;
  char has;
  id v6;

  v4 = a3;
  v6 = v4;
  if (self->_name)
  {
    PBDataWriterWriteStringField();
    v4 = v6;
  }
  if (self->_bundleIdentifier)
  {
    PBDataWriterWriteStringField();
    v4 = v6;
  }
  if (self->_productType)
  {
    PBDataWriterWriteStringField();
    v4 = v6;
  }
  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
    PBDataWriterWriteInt64Field();
    v4 = v6;
  }
  if (self->_uuid)
  {
    PBDataWriterWriteDataField();
    v4 = v6;
  }
  has = (char)self->_has;
  if ((has & 1) != 0)
  {
    PBDataWriterWriteDoubleField();
    v4 = v6;
    has = (char)self->_has;
  }
  if ((has & 4) != 0)
  {
    PBDataWriterWriteBOOLField();
    v4 = v6;
  }
  if (self->_owningAppBundleIdentifier)
  {
    PBDataWriterWriteStringField();
    v4 = v6;
  }
  if (self->_syncIdentity)
  {
    PBDataWriterWriteSubmessage();
    v4 = v6;
  }

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_uuid, 0);
  objc_storeStrong((id *)&self->_syncIdentity, 0);
  objc_storeStrong((id *)&self->_productType, 0);
  objc_storeStrong((id *)&self->_owningAppBundleIdentifier, 0);
  objc_storeStrong((id *)&self->_name, 0);
  objc_storeStrong((id *)&self->_bundleIdentifier, 0);
}

- (NSString)bundleIdentifier
{
  return self->_bundleIdentifier;
}

- (id)decodedUUID
{
  void *v2;

  if (self->_uuid)
  {
    objc_msgSend(MEMORY[0x1E0CB3A28], "hk_UUIDWithData:");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v2 = 0;
  }
  return v2;
}

- (BOOL)hasName
{
  return self->_name != 0;
}

- (BOOL)hasBundleIdentifier
{
  return self->_bundleIdentifier != 0;
}

- (BOOL)hasProductType
{
  return self->_productType != 0;
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

- (BOOL)hasUuid
{
  return self->_uuid != 0;
}

- (void)setHasModificationDate:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (BOOL)hasModificationDate
{
  return *(_BYTE *)&self->_has & 1;
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

- (BOOL)hasOwningAppBundleIdentifier
{
  return self->_owningAppBundleIdentifier != 0;
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
  v8.super_class = (Class)HDCodableSource;
  -[HDCodableSource description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[HDCodableSource dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  void *v3;
  void *v4;
  NSString *name;
  NSString *bundleIdentifier;
  NSString *productType;
  void *v8;
  NSData *uuid;
  char has;
  void *v11;
  void *v12;
  NSString *owningAppBundleIdentifier;
  HDCodableSyncIdentity *syncIdentity;
  void *v15;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  name = self->_name;
  if (name)
    objc_msgSend(v3, "setObject:forKey:", name, CFSTR("name"));
  bundleIdentifier = self->_bundleIdentifier;
  if (bundleIdentifier)
    objc_msgSend(v4, "setObject:forKey:", bundleIdentifier, CFSTR("bundleIdentifier"));
  productType = self->_productType;
  if (productType)
    objc_msgSend(v4, "setObject:forKey:", productType, CFSTR("productType"));
  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", self->_options);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v8, CFSTR("options"));

  }
  uuid = self->_uuid;
  if (uuid)
    objc_msgSend(v4, "setObject:forKey:", uuid, CFSTR("uuid"));
  has = (char)self->_has;
  if ((has & 1) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->_modificationDate);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v11, CFSTR("modificationDate"));

    has = (char)self->_has;
  }
  if ((has & 4) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_deleted);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v12, CFSTR("deleted"));

  }
  owningAppBundleIdentifier = self->_owningAppBundleIdentifier;
  if (owningAppBundleIdentifier)
    objc_msgSend(v4, "setObject:forKey:", owningAppBundleIdentifier, CFSTR("owningAppBundleIdentifier"));
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
  return HDCodableSourceReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)copyTo:(id)a3
{
  id v4;
  char has;
  id v6;

  v4 = a3;
  v6 = v4;
  if (self->_name)
  {
    objc_msgSend(v4, "setName:");
    v4 = v6;
  }
  if (self->_bundleIdentifier)
  {
    objc_msgSend(v6, "setBundleIdentifier:");
    v4 = v6;
  }
  if (self->_productType)
  {
    objc_msgSend(v6, "setProductType:");
    v4 = v6;
  }
  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
    *((_QWORD *)v4 + 2) = self->_options;
    *((_BYTE *)v4 + 76) |= 2u;
  }
  if (self->_uuid)
  {
    objc_msgSend(v6, "setUuid:");
    v4 = v6;
  }
  has = (char)self->_has;
  if ((has & 1) != 0)
  {
    *((_QWORD *)v4 + 1) = *(_QWORD *)&self->_modificationDate;
    *((_BYTE *)v4 + 76) |= 1u;
    has = (char)self->_has;
  }
  if ((has & 4) != 0)
  {
    *((_BYTE *)v4 + 72) = self->_deleted;
    *((_BYTE *)v4 + 76) |= 4u;
  }
  if (self->_owningAppBundleIdentifier)
  {
    objc_msgSend(v6, "setOwningAppBundleIdentifier:");
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
  char has;
  uint64_t v15;
  void *v16;
  id v17;
  void *v18;

  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = -[NSString copyWithZone:](self->_name, "copyWithZone:", a3);
  v7 = *(void **)(v5 + 32);
  *(_QWORD *)(v5 + 32) = v6;

  v8 = -[NSString copyWithZone:](self->_bundleIdentifier, "copyWithZone:", a3);
  v9 = *(void **)(v5 + 24);
  *(_QWORD *)(v5 + 24) = v8;

  v10 = -[NSString copyWithZone:](self->_productType, "copyWithZone:", a3);
  v11 = *(void **)(v5 + 48);
  *(_QWORD *)(v5 + 48) = v10;

  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
    *(_QWORD *)(v5 + 16) = self->_options;
    *(_BYTE *)(v5 + 76) |= 2u;
  }
  v12 = -[NSData copyWithZone:](self->_uuid, "copyWithZone:", a3);
  v13 = *(void **)(v5 + 64);
  *(_QWORD *)(v5 + 64) = v12;

  has = (char)self->_has;
  if ((has & 1) != 0)
  {
    *(double *)(v5 + 8) = self->_modificationDate;
    *(_BYTE *)(v5 + 76) |= 1u;
    has = (char)self->_has;
  }
  if ((has & 4) != 0)
  {
    *(_BYTE *)(v5 + 72) = self->_deleted;
    *(_BYTE *)(v5 + 76) |= 4u;
  }
  v15 = -[NSString copyWithZone:](self->_owningAppBundleIdentifier, "copyWithZone:", a3);
  v16 = *(void **)(v5 + 40);
  *(_QWORD *)(v5 + 40) = v15;

  v17 = -[HDCodableSyncIdentity copyWithZone:](self->_syncIdentity, "copyWithZone:", a3);
  v18 = *(void **)(v5 + 56);
  *(_QWORD *)(v5 + 56) = v17;

  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  NSString *name;
  NSString *bundleIdentifier;
  NSString *productType;
  char has;
  char v9;
  NSData *uuid;
  NSString *owningAppBundleIdentifier;
  HDCodableSyncIdentity *syncIdentity;
  char v13;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_33;
  name = self->_name;
  if ((unint64_t)name | *((_QWORD *)v4 + 4))
  {
    if (!-[NSString isEqual:](name, "isEqual:"))
      goto LABEL_33;
  }
  bundleIdentifier = self->_bundleIdentifier;
  if ((unint64_t)bundleIdentifier | *((_QWORD *)v4 + 3))
  {
    if (!-[NSString isEqual:](bundleIdentifier, "isEqual:"))
      goto LABEL_33;
  }
  productType = self->_productType;
  if ((unint64_t)productType | *((_QWORD *)v4 + 6))
  {
    if (!-[NSString isEqual:](productType, "isEqual:"))
      goto LABEL_33;
  }
  has = (char)self->_has;
  v9 = *((_BYTE *)v4 + 76);
  if ((has & 2) != 0)
  {
    if ((*((_BYTE *)v4 + 76) & 2) == 0 || self->_options != *((_QWORD *)v4 + 2))
      goto LABEL_33;
  }
  else if ((*((_BYTE *)v4 + 76) & 2) != 0)
  {
    goto LABEL_33;
  }
  uuid = self->_uuid;
  if ((unint64_t)uuid | *((_QWORD *)v4 + 8))
  {
    if (!-[NSData isEqual:](uuid, "isEqual:"))
      goto LABEL_33;
    has = (char)self->_has;
    v9 = *((_BYTE *)v4 + 76);
  }
  if ((has & 1) != 0)
  {
    if ((v9 & 1) == 0 || self->_modificationDate != *((double *)v4 + 1))
      goto LABEL_33;
  }
  else if ((v9 & 1) != 0)
  {
    goto LABEL_33;
  }
  if ((has & 4) != 0)
  {
    if ((v9 & 4) != 0)
    {
      if (self->_deleted)
      {
        if (!*((_BYTE *)v4 + 72))
          goto LABEL_33;
        goto LABEL_29;
      }
      if (!*((_BYTE *)v4 + 72))
        goto LABEL_29;
    }
LABEL_33:
    v13 = 0;
    goto LABEL_34;
  }
  if ((v9 & 4) != 0)
    goto LABEL_33;
LABEL_29:
  owningAppBundleIdentifier = self->_owningAppBundleIdentifier;
  if ((unint64_t)owningAppBundleIdentifier | *((_QWORD *)v4 + 5)
    && !-[NSString isEqual:](owningAppBundleIdentifier, "isEqual:"))
  {
    goto LABEL_33;
  }
  syncIdentity = self->_syncIdentity;
  if ((unint64_t)syncIdentity | *((_QWORD *)v4 + 7))
    v13 = -[HDCodableSyncIdentity isEqual:](syncIdentity, "isEqual:");
  else
    v13 = 1;
LABEL_34:

  return v13;
}

- (unint64_t)hash
{
  NSUInteger v3;
  NSUInteger v4;
  NSUInteger v5;
  uint64_t v6;
  uint64_t v7;
  char has;
  unint64_t v9;
  double modificationDate;
  double v11;
  long double v12;
  double v13;
  uint64_t v14;
  NSUInteger v15;
  NSUInteger v16;

  v3 = -[NSString hash](self->_name, "hash");
  v4 = -[NSString hash](self->_bundleIdentifier, "hash");
  v5 = -[NSString hash](self->_productType, "hash");
  if ((*(_BYTE *)&self->_has & 2) != 0)
    v6 = 2654435761 * self->_options;
  else
    v6 = 0;
  v7 = -[NSData hash](self->_uuid, "hash");
  has = (char)self->_has;
  if ((has & 1) != 0)
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
  if ((has & 4) != 0)
    v14 = 2654435761 * self->_deleted;
  else
    v14 = 0;
  v15 = v4 ^ v3 ^ v5 ^ v6 ^ v7 ^ v9 ^ v14;
  v16 = -[NSString hash](self->_owningAppBundleIdentifier, "hash");
  return v15 ^ v16 ^ -[HDCodableSyncIdentity hash](self->_syncIdentity, "hash");
}

- (void)mergeFrom:(id)a3
{
  id v4;
  char v5;
  HDCodableSyncIdentity *syncIdentity;
  uint64_t v7;
  id v8;

  v4 = a3;
  v8 = v4;
  if (*((_QWORD *)v4 + 4))
  {
    -[HDCodableSource setName:](self, "setName:");
    v4 = v8;
  }
  if (*((_QWORD *)v4 + 3))
  {
    -[HDCodableSource setBundleIdentifier:](self, "setBundleIdentifier:");
    v4 = v8;
  }
  if (*((_QWORD *)v4 + 6))
  {
    -[HDCodableSource setProductType:](self, "setProductType:");
    v4 = v8;
  }
  if ((*((_BYTE *)v4 + 76) & 2) != 0)
  {
    self->_options = *((_QWORD *)v4 + 2);
    *(_BYTE *)&self->_has |= 2u;
  }
  if (*((_QWORD *)v4 + 8))
  {
    -[HDCodableSource setUuid:](self, "setUuid:");
    v4 = v8;
  }
  v5 = *((_BYTE *)v4 + 76);
  if ((v5 & 1) != 0)
  {
    self->_modificationDate = *((double *)v4 + 1);
    *(_BYTE *)&self->_has |= 1u;
    v5 = *((_BYTE *)v4 + 76);
  }
  if ((v5 & 4) != 0)
  {
    self->_deleted = *((_BYTE *)v4 + 72);
    *(_BYTE *)&self->_has |= 4u;
  }
  if (*((_QWORD *)v4 + 5))
  {
    -[HDCodableSource setOwningAppBundleIdentifier:](self, "setOwningAppBundleIdentifier:");
    v4 = v8;
  }
  syncIdentity = self->_syncIdentity;
  v7 = *((_QWORD *)v4 + 7);
  if (syncIdentity)
  {
    if (v7)
    {
      -[HDCodableSyncIdentity mergeFrom:](syncIdentity, "mergeFrom:");
LABEL_22:
      v4 = v8;
    }
  }
  else if (v7)
  {
    -[HDCodableSource setSyncIdentity:](self, "setSyncIdentity:");
    goto LABEL_22;
  }

}

- (NSString)name
{
  return self->_name;
}

- (NSString)productType
{
  return self->_productType;
}

- (int64_t)options
{
  return self->_options;
}

- (double)modificationDate
{
  return self->_modificationDate;
}

- (BOOL)deleted
{
  return self->_deleted;
}

- (NSString)owningAppBundleIdentifier
{
  return self->_owningAppBundleIdentifier;
}

- (void)setOwningAppBundleIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_owningAppBundleIdentifier, a3);
}

- (HDCodableSyncIdentity)syncIdentity
{
  return self->_syncIdentity;
}

- (void)setSyncIdentity:(id)a3
{
  objc_storeStrong((id *)&self->_syncIdentity, a3);
}

- (id)decodedModificationDate
{
  if ((*(_BYTE *)&self->_has & 1) == 0)
    return 0;
  HDDecodeDateForValue();
  return (id)objc_claimAutoreleasedReturnValue();
}

@end
