@implementation HDCloudSyncCodableDeviceKeyValue

- (BOOL)hasSyncIdentity
{
  return self->_syncIdentity != 0;
}

- (BOOL)hasDomain
{
  return self->_domain != 0;
}

- (BOOL)hasKey
{
  return self->_key != 0;
}

- (BOOL)hasValue
{
  return self->_value != 0;
}

- (void)setModificationDate:(double)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_modificationDate = a3;
}

- (void)setHasModificationDate:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (BOOL)hasModificationDate
{
  return *(_BYTE *)&self->_has & 1;
}

- (void)setProtectionCategory:(int64_t)a3
{
  *(_BYTE *)&self->_has |= 2u;
  self->_protectionCategory = a3;
}

- (void)setHasProtectionCategory:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFD | v3;
}

- (BOOL)hasProtectionCategory
{
  return (*(_BYTE *)&self->_has >> 1) & 1;
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
  v8.super_class = (Class)HDCloudSyncCodableDeviceKeyValue;
  -[HDCloudSyncCodableDeviceKeyValue description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[HDCloudSyncCodableDeviceKeyValue dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  void *v3;
  HDCodableSyncIdentity *syncIdentity;
  void *v5;
  NSString *domain;
  NSString *key;
  NSData *value;
  char has;
  void *v10;
  void *v11;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  syncIdentity = self->_syncIdentity;
  if (syncIdentity)
  {
    -[HDCodableSyncIdentity dictionaryRepresentation](syncIdentity, "dictionaryRepresentation");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v5, CFSTR("syncIdentity"));

  }
  domain = self->_domain;
  if (domain)
    objc_msgSend(v3, "setObject:forKey:", domain, CFSTR("domain"));
  key = self->_key;
  if (key)
    objc_msgSend(v3, "setObject:forKey:", key, CFSTR("key"));
  value = self->_value;
  if (value)
    objc_msgSend(v3, "setObject:forKey:", value, CFSTR("value"));
  has = (char)self->_has;
  if ((has & 1) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->_modificationDate);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v10, CFSTR("modificationDate"));

    has = (char)self->_has;
  }
  if ((has & 2) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", self->_protectionCategory);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v11, CFSTR("protectionCategory"));

  }
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return HDCloudSyncCodableDeviceKeyValueReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4;
  char has;
  id v6;

  v4 = a3;
  v6 = v4;
  if (self->_syncIdentity)
  {
    PBDataWriterWriteSubmessage();
    v4 = v6;
  }
  if (self->_domain)
  {
    PBDataWriterWriteStringField();
    v4 = v6;
  }
  if (self->_key)
  {
    PBDataWriterWriteStringField();
    v4 = v6;
  }
  if (self->_value)
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
  if (self->_syncIdentity)
  {
    objc_msgSend(v4, "setSyncIdentity:");
    v4 = v6;
  }
  if (self->_domain)
  {
    objc_msgSend(v6, "setDomain:");
    v4 = v6;
  }
  if (self->_key)
  {
    objc_msgSend(v6, "setKey:");
    v4 = v6;
  }
  if (self->_value)
  {
    objc_msgSend(v6, "setValue:");
    v4 = v6;
  }
  has = (char)self->_has;
  if ((has & 1) != 0)
  {
    *((_QWORD *)v4 + 1) = *(_QWORD *)&self->_modificationDate;
    *((_BYTE *)v4 + 56) |= 1u;
    has = (char)self->_has;
  }
  if ((has & 2) != 0)
  {
    *((_QWORD *)v4 + 2) = self->_protectionCategory;
    *((_BYTE *)v4 + 56) |= 2u;
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
  char has;

  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = -[HDCodableSyncIdentity copyWithZone:](self->_syncIdentity, "copyWithZone:", a3);
  v7 = *(void **)(v5 + 40);
  *(_QWORD *)(v5 + 40) = v6;

  v8 = -[NSString copyWithZone:](self->_domain, "copyWithZone:", a3);
  v9 = *(void **)(v5 + 24);
  *(_QWORD *)(v5 + 24) = v8;

  v10 = -[NSString copyWithZone:](self->_key, "copyWithZone:", a3);
  v11 = *(void **)(v5 + 32);
  *(_QWORD *)(v5 + 32) = v10;

  v12 = -[NSData copyWithZone:](self->_value, "copyWithZone:", a3);
  v13 = *(void **)(v5 + 48);
  *(_QWORD *)(v5 + 48) = v12;

  has = (char)self->_has;
  if ((has & 1) != 0)
  {
    *(double *)(v5 + 8) = self->_modificationDate;
    *(_BYTE *)(v5 + 56) |= 1u;
    has = (char)self->_has;
  }
  if ((has & 2) != 0)
  {
    *(_QWORD *)(v5 + 16) = self->_protectionCategory;
    *(_BYTE *)(v5 + 56) |= 2u;
  }
  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  HDCodableSyncIdentity *syncIdentity;
  NSString *domain;
  NSString *key;
  NSData *value;
  BOOL v9;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_19;
  syncIdentity = self->_syncIdentity;
  if ((unint64_t)syncIdentity | *((_QWORD *)v4 + 5))
  {
    if (!-[HDCodableSyncIdentity isEqual:](syncIdentity, "isEqual:"))
      goto LABEL_19;
  }
  domain = self->_domain;
  if ((unint64_t)domain | *((_QWORD *)v4 + 3))
  {
    if (!-[NSString isEqual:](domain, "isEqual:"))
      goto LABEL_19;
  }
  key = self->_key;
  if ((unint64_t)key | *((_QWORD *)v4 + 4))
  {
    if (!-[NSString isEqual:](key, "isEqual:"))
      goto LABEL_19;
  }
  value = self->_value;
  if ((unint64_t)value | *((_QWORD *)v4 + 6))
  {
    if (!-[NSData isEqual:](value, "isEqual:"))
      goto LABEL_19;
  }
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    if ((*((_BYTE *)v4 + 56) & 1) == 0 || self->_modificationDate != *((double *)v4 + 1))
      goto LABEL_19;
  }
  else if ((*((_BYTE *)v4 + 56) & 1) != 0)
  {
LABEL_19:
    v9 = 0;
    goto LABEL_20;
  }
  v9 = (*((_BYTE *)v4 + 56) & 2) == 0;
  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
    if ((*((_BYTE *)v4 + 56) & 2) == 0 || self->_protectionCategory != *((_QWORD *)v4 + 2))
      goto LABEL_19;
    v9 = 1;
  }
LABEL_20:

  return v9;
}

- (unint64_t)hash
{
  unint64_t v3;
  NSUInteger v4;
  NSUInteger v5;
  uint64_t v6;
  char has;
  unint64_t v8;
  double modificationDate;
  double v10;
  long double v11;
  double v12;
  uint64_t v13;

  v3 = -[HDCodableSyncIdentity hash](self->_syncIdentity, "hash");
  v4 = -[NSString hash](self->_domain, "hash");
  v5 = -[NSString hash](self->_key, "hash");
  v6 = -[NSData hash](self->_value, "hash");
  has = (char)self->_has;
  if ((has & 1) != 0)
  {
    modificationDate = self->_modificationDate;
    v10 = -modificationDate;
    if (modificationDate >= 0.0)
      v10 = self->_modificationDate;
    v11 = floor(v10 + 0.5);
    v12 = (v10 - v11) * 1.84467441e19;
    v8 = 2654435761u * (unint64_t)fmod(v11, 1.84467441e19);
    if (v12 >= 0.0)
    {
      if (v12 > 0.0)
        v8 += (unint64_t)v12;
    }
    else
    {
      v8 -= (unint64_t)fabs(v12);
    }
  }
  else
  {
    v8 = 0;
  }
  if ((has & 2) != 0)
    v13 = 2654435761 * self->_protectionCategory;
  else
    v13 = 0;
  return v4 ^ v3 ^ v5 ^ v6 ^ v8 ^ v13;
}

- (void)mergeFrom:(id)a3
{
  id v4;
  HDCodableSyncIdentity *syncIdentity;
  uint64_t v6;
  char v7;
  id v8;

  v4 = a3;
  syncIdentity = self->_syncIdentity;
  v6 = *((_QWORD *)v4 + 5);
  v8 = v4;
  if (syncIdentity)
  {
    if (!v6)
      goto LABEL_7;
    -[HDCodableSyncIdentity mergeFrom:](syncIdentity, "mergeFrom:");
  }
  else
  {
    if (!v6)
      goto LABEL_7;
    -[HDCloudSyncCodableDeviceKeyValue setSyncIdentity:](self, "setSyncIdentity:");
  }
  v4 = v8;
LABEL_7:
  if (*((_QWORD *)v4 + 3))
  {
    -[HDCloudSyncCodableDeviceKeyValue setDomain:](self, "setDomain:");
    v4 = v8;
  }
  if (*((_QWORD *)v4 + 4))
  {
    -[HDCloudSyncCodableDeviceKeyValue setKey:](self, "setKey:");
    v4 = v8;
  }
  if (*((_QWORD *)v4 + 6))
  {
    -[HDCloudSyncCodableDeviceKeyValue setValue:](self, "setValue:");
    v4 = v8;
  }
  v7 = *((_BYTE *)v4 + 56);
  if ((v7 & 1) != 0)
  {
    self->_modificationDate = *((double *)v4 + 1);
    *(_BYTE *)&self->_has |= 1u;
    v7 = *((_BYTE *)v4 + 56);
  }
  if ((v7 & 2) != 0)
  {
    self->_protectionCategory = *((_QWORD *)v4 + 2);
    *(_BYTE *)&self->_has |= 2u;
  }

}

- (HDCodableSyncIdentity)syncIdentity
{
  return self->_syncIdentity;
}

- (void)setSyncIdentity:(id)a3
{
  objc_storeStrong((id *)&self->_syncIdentity, a3);
}

- (NSString)domain
{
  return self->_domain;
}

- (void)setDomain:(id)a3
{
  objc_storeStrong((id *)&self->_domain, a3);
}

- (NSString)key
{
  return self->_key;
}

- (void)setKey:(id)a3
{
  objc_storeStrong((id *)&self->_key, a3);
}

- (NSData)value
{
  return self->_value;
}

- (void)setValue:(id)a3
{
  objc_storeStrong((id *)&self->_value, a3);
}

- (double)modificationDate
{
  return self->_modificationDate;
}

- (int64_t)protectionCategory
{
  return self->_protectionCategory;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_value, 0);
  objc_storeStrong((id *)&self->_syncIdentity, 0);
  objc_storeStrong((id *)&self->_key, 0);
  objc_storeStrong((id *)&self->_domain, 0);
}

@end
