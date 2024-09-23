@implementation HDCloudSyncCodableDeviceContext

- (BOOL)hasSyncIdentity
{
  return self->_syncIdentity != 0;
}

- (void)setType:(int64_t)a3
{
  *(_BYTE *)&self->_has |= 2u;
  self->_type = a3;
}

- (void)setHasType:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFD | v3;
}

- (BOOL)hasType
{
  return (*(_BYTE *)&self->_has >> 1) & 1;
}

- (BOOL)hasCurrentOSName
{
  return self->_currentOSName != 0;
}

- (BOOL)hasCurrentOSVersion
{
  return self->_currentOSVersion != 0;
}

- (BOOL)hasProductTypeName
{
  return self->_productTypeName != 0;
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

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  objc_super v8;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v8.receiver = self;
  v8.super_class = (Class)HDCloudSyncCodableDeviceContext;
  -[HDCloudSyncCodableDeviceContext description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[HDCloudSyncCodableDeviceContext dictionaryRepresentation](self, "dictionaryRepresentation");
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
  void *v6;
  NSString *currentOSName;
  NSString *currentOSVersion;
  NSString *productTypeName;
  void *v10;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  syncIdentity = self->_syncIdentity;
  if (syncIdentity)
  {
    -[HDCodableSyncIdentity dictionaryRepresentation](syncIdentity, "dictionaryRepresentation");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v5, CFSTR("syncIdentity"));

  }
  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", self->_type);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v6, CFSTR("type"));

  }
  currentOSName = self->_currentOSName;
  if (currentOSName)
    objc_msgSend(v3, "setObject:forKey:", currentOSName, CFSTR("currentOSName"));
  currentOSVersion = self->_currentOSVersion;
  if (currentOSVersion)
    objc_msgSend(v3, "setObject:forKey:", currentOSVersion, CFSTR("currentOSVersion"));
  productTypeName = self->_productTypeName;
  if (productTypeName)
    objc_msgSend(v3, "setObject:forKey:", productTypeName, CFSTR("productTypeName"));
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->_modificationDate);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v10, CFSTR("modificationDate"));

  }
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return HDCloudSyncCodableDeviceContextReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  v5 = v4;
  if (self->_syncIdentity)
  {
    PBDataWriterWriteSubmessage();
    v4 = v5;
  }
  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
    PBDataWriterWriteInt64Field();
    v4 = v5;
  }
  if (self->_currentOSName)
  {
    PBDataWriterWriteStringField();
    v4 = v5;
  }
  if (self->_currentOSVersion)
  {
    PBDataWriterWriteStringField();
    v4 = v5;
  }
  if (self->_productTypeName)
  {
    PBDataWriterWriteStringField();
    v4 = v5;
  }
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    PBDataWriterWriteDoubleField();
    v4 = v5;
  }

}

- (void)copyTo:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  v5 = v4;
  if (self->_syncIdentity)
  {
    objc_msgSend(v4, "setSyncIdentity:");
    v4 = v5;
  }
  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
    *((_QWORD *)v4 + 2) = self->_type;
    *((_BYTE *)v4 + 56) |= 2u;
  }
  if (self->_currentOSName)
  {
    objc_msgSend(v5, "setCurrentOSName:");
    v4 = v5;
  }
  if (self->_currentOSVersion)
  {
    objc_msgSend(v5, "setCurrentOSVersion:");
    v4 = v5;
  }
  if (self->_productTypeName)
  {
    objc_msgSend(v5, "setProductTypeName:");
    v4 = v5;
  }
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    *((_QWORD *)v4 + 1) = *(_QWORD *)&self->_modificationDate;
    *((_BYTE *)v4 + 56) |= 1u;
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

  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = -[HDCodableSyncIdentity copyWithZone:](self->_syncIdentity, "copyWithZone:", a3);
  v7 = *(void **)(v5 + 48);
  *(_QWORD *)(v5 + 48) = v6;

  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
    *(_QWORD *)(v5 + 16) = self->_type;
    *(_BYTE *)(v5 + 56) |= 2u;
  }
  v8 = -[NSString copyWithZone:](self->_currentOSName, "copyWithZone:", a3);
  v9 = *(void **)(v5 + 24);
  *(_QWORD *)(v5 + 24) = v8;

  v10 = -[NSString copyWithZone:](self->_currentOSVersion, "copyWithZone:", a3);
  v11 = *(void **)(v5 + 32);
  *(_QWORD *)(v5 + 32) = v10;

  v12 = -[NSString copyWithZone:](self->_productTypeName, "copyWithZone:", a3);
  v13 = *(void **)(v5 + 40);
  *(_QWORD *)(v5 + 40) = v12;

  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    *(double *)(v5 + 8) = self->_modificationDate;
    *(_BYTE *)(v5 + 56) |= 1u;
  }
  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  HDCodableSyncIdentity *syncIdentity;
  NSString *currentOSName;
  NSString *currentOSVersion;
  NSString *productTypeName;
  BOOL v9;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_19;
  syncIdentity = self->_syncIdentity;
  if ((unint64_t)syncIdentity | *((_QWORD *)v4 + 6))
  {
    if (!-[HDCodableSyncIdentity isEqual:](syncIdentity, "isEqual:"))
      goto LABEL_19;
  }
  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
    if ((*((_BYTE *)v4 + 56) & 2) == 0 || self->_type != *((_QWORD *)v4 + 2))
      goto LABEL_19;
  }
  else if ((*((_BYTE *)v4 + 56) & 2) != 0)
  {
LABEL_19:
    v9 = 0;
    goto LABEL_20;
  }
  currentOSName = self->_currentOSName;
  if ((unint64_t)currentOSName | *((_QWORD *)v4 + 3)
    && !-[NSString isEqual:](currentOSName, "isEqual:"))
  {
    goto LABEL_19;
  }
  currentOSVersion = self->_currentOSVersion;
  if ((unint64_t)currentOSVersion | *((_QWORD *)v4 + 4))
  {
    if (!-[NSString isEqual:](currentOSVersion, "isEqual:"))
      goto LABEL_19;
  }
  productTypeName = self->_productTypeName;
  if ((unint64_t)productTypeName | *((_QWORD *)v4 + 5))
  {
    if (!-[NSString isEqual:](productTypeName, "isEqual:"))
      goto LABEL_19;
  }
  v9 = (*((_BYTE *)v4 + 56) & 1) == 0;
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    if ((*((_BYTE *)v4 + 56) & 1) == 0 || self->_modificationDate != *((double *)v4 + 1))
      goto LABEL_19;
    v9 = 1;
  }
LABEL_20:

  return v9;
}

- (unint64_t)hash
{
  unint64_t v3;
  uint64_t v4;
  NSUInteger v5;
  NSUInteger v6;
  NSUInteger v7;
  unint64_t v8;
  double modificationDate;
  double v10;
  long double v11;
  double v12;

  v3 = -[HDCodableSyncIdentity hash](self->_syncIdentity, "hash");
  if ((*(_BYTE *)&self->_has & 2) != 0)
    v4 = 2654435761 * self->_type;
  else
    v4 = 0;
  v5 = -[NSString hash](self->_currentOSName, "hash");
  v6 = -[NSString hash](self->_currentOSVersion, "hash");
  v7 = -[NSString hash](self->_productTypeName, "hash");
  if ((*(_BYTE *)&self->_has & 1) != 0)
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
  return v4 ^ v3 ^ v5 ^ v6 ^ v7 ^ v8;
}

- (void)mergeFrom:(id)a3
{
  id v4;
  HDCodableSyncIdentity *syncIdentity;
  uint64_t v6;
  id v7;

  v4 = a3;
  syncIdentity = self->_syncIdentity;
  v6 = *((_QWORD *)v4 + 6);
  v7 = v4;
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
    -[HDCloudSyncCodableDeviceContext setSyncIdentity:](self, "setSyncIdentity:");
  }
  v4 = v7;
LABEL_7:
  if ((*((_BYTE *)v4 + 56) & 2) != 0)
  {
    self->_type = *((_QWORD *)v4 + 2);
    *(_BYTE *)&self->_has |= 2u;
  }
  if (*((_QWORD *)v4 + 3))
  {
    -[HDCloudSyncCodableDeviceContext setCurrentOSName:](self, "setCurrentOSName:");
    v4 = v7;
  }
  if (*((_QWORD *)v4 + 4))
  {
    -[HDCloudSyncCodableDeviceContext setCurrentOSVersion:](self, "setCurrentOSVersion:");
    v4 = v7;
  }
  if (*((_QWORD *)v4 + 5))
  {
    -[HDCloudSyncCodableDeviceContext setProductTypeName:](self, "setProductTypeName:");
    v4 = v7;
  }
  if ((*((_BYTE *)v4 + 56) & 1) != 0)
  {
    self->_modificationDate = *((double *)v4 + 1);
    *(_BYTE *)&self->_has |= 1u;
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

- (int64_t)type
{
  return self->_type;
}

- (NSString)currentOSName
{
  return self->_currentOSName;
}

- (void)setCurrentOSName:(id)a3
{
  objc_storeStrong((id *)&self->_currentOSName, a3);
}

- (NSString)currentOSVersion
{
  return self->_currentOSVersion;
}

- (void)setCurrentOSVersion:(id)a3
{
  objc_storeStrong((id *)&self->_currentOSVersion, a3);
}

- (NSString)productTypeName
{
  return self->_productTypeName;
}

- (void)setProductTypeName:(id)a3
{
  objc_storeStrong((id *)&self->_productTypeName, a3);
}

- (double)modificationDate
{
  return self->_modificationDate;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_syncIdentity, 0);
  objc_storeStrong((id *)&self->_productTypeName, 0);
  objc_storeStrong((id *)&self->_currentOSVersion, 0);
  objc_storeStrong((id *)&self->_currentOSName, 0);
}

@end
