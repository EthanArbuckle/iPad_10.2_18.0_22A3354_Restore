@implementation HDCodableSyncStateOrigin

- (void)setTimestamp:(double)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_timestamp = a3;
}

- (void)setHasTimestamp:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (BOOL)hasTimestamp
{
  return *(_BYTE *)&self->_has & 1;
}

- (BOOL)hasBuild
{
  return self->_build != 0;
}

- (BOOL)hasProductType
{
  return self->_productType != 0;
}

- (void)setMajorVersion:(int)a3
{
  *(_BYTE *)&self->_has |= 2u;
  self->_majorVersion = a3;
}

- (void)setHasMajorVersion:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFD | v3;
}

- (BOOL)hasMajorVersion
{
  return (*(_BYTE *)&self->_has >> 1) & 1;
}

- (void)setMinorVersion:(int)a3
{
  *(_BYTE *)&self->_has |= 4u;
  self->_minorVersion = a3;
}

- (void)setHasMinorVersion:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 4;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFB | v3;
}

- (BOOL)hasMinorVersion
{
  return (*(_BYTE *)&self->_has >> 2) & 1;
}

- (void)setPatchVersion:(int)a3
{
  *(_BYTE *)&self->_has |= 8u;
  self->_patchVersion = a3;
}

- (void)setHasPatchVersion:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 8;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xF7 | v3;
}

- (BOOL)hasPatchVersion
{
  return (*(_BYTE *)&self->_has >> 3) & 1;
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
  v8.super_class = (Class)HDCodableSyncStateOrigin;
  -[HDCodableSyncStateOrigin description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[HDCodableSyncStateOrigin dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  void *v3;
  void *v4;
  NSString *build;
  NSString *productType;
  char has;
  void *v8;
  HDCodableSyncIdentity *syncIdentity;
  void *v10;
  void *v12;
  void *v13;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->_timestamp);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v4, CFSTR("timestamp"));

  }
  build = self->_build;
  if (build)
    objc_msgSend(v3, "setObject:forKey:", build, CFSTR("build"));
  productType = self->_productType;
  if (productType)
    objc_msgSend(v3, "setObject:forKey:", productType, CFSTR("productType"));
  has = (char)self->_has;
  if ((has & 2) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", self->_majorVersion);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v12, CFSTR("majorVersion"));

    has = (char)self->_has;
    if ((has & 4) == 0)
    {
LABEL_9:
      if ((has & 8) == 0)
        goto LABEL_11;
      goto LABEL_10;
    }
  }
  else if ((*(_BYTE *)&self->_has & 4) == 0)
  {
    goto LABEL_9;
  }
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", self->_minorVersion);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v13, CFSTR("minorVersion"));

  if ((*(_BYTE *)&self->_has & 8) != 0)
  {
LABEL_10:
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", self->_patchVersion);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v8, CFSTR("patchVersion"));

  }
LABEL_11:
  syncIdentity = self->_syncIdentity;
  if (syncIdentity)
  {
    -[HDCodableSyncIdentity dictionaryRepresentation](syncIdentity, "dictionaryRepresentation");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v10, CFSTR("syncIdentity"));

  }
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return HDCodableSyncStateOriginReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4;
  char has;
  id v6;

  v4 = a3;
  v6 = v4;
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    PBDataWriterWriteDoubleField();
    v4 = v6;
  }
  if (self->_build)
  {
    PBDataWriterWriteStringField();
    v4 = v6;
  }
  if (self->_productType)
  {
    PBDataWriterWriteStringField();
    v4 = v6;
  }
  has = (char)self->_has;
  if ((has & 2) != 0)
  {
    PBDataWriterWriteInt32Field();
    v4 = v6;
    has = (char)self->_has;
    if ((has & 4) == 0)
    {
LABEL_9:
      if ((has & 8) == 0)
        goto LABEL_11;
      goto LABEL_10;
    }
  }
  else if ((*(_BYTE *)&self->_has & 4) == 0)
  {
    goto LABEL_9;
  }
  PBDataWriterWriteInt32Field();
  v4 = v6;
  if ((*(_BYTE *)&self->_has & 8) != 0)
  {
LABEL_10:
    PBDataWriterWriteInt32Field();
    v4 = v6;
  }
LABEL_11:
  if (self->_syncIdentity)
  {
    PBDataWriterWriteSubmessage();
    v4 = v6;
  }

}

- (void)copyTo:(id)a3
{
  _QWORD *v4;
  char has;
  _QWORD *v6;

  v4 = a3;
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    v4[1] = *(_QWORD *)&self->_timestamp;
    *((_BYTE *)v4 + 56) |= 1u;
  }
  v6 = v4;
  if (self->_build)
  {
    objc_msgSend(v4, "setBuild:");
    v4 = v6;
  }
  if (self->_productType)
  {
    objc_msgSend(v6, "setProductType:");
    v4 = v6;
  }
  has = (char)self->_has;
  if ((has & 2) != 0)
  {
    *((_DWORD *)v4 + 6) = self->_majorVersion;
    *((_BYTE *)v4 + 56) |= 2u;
    has = (char)self->_has;
    if ((has & 4) == 0)
    {
LABEL_9:
      if ((has & 8) == 0)
        goto LABEL_11;
      goto LABEL_10;
    }
  }
  else if ((*(_BYTE *)&self->_has & 4) == 0)
  {
    goto LABEL_9;
  }
  *((_DWORD *)v4 + 7) = self->_minorVersion;
  *((_BYTE *)v4 + 56) |= 4u;
  if ((*(_BYTE *)&self->_has & 8) != 0)
  {
LABEL_10:
    *((_DWORD *)v4 + 8) = self->_patchVersion;
    *((_BYTE *)v4 + 56) |= 8u;
  }
LABEL_11:
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
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  char has;
  id v12;
  void *v13;

  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = v5;
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    *(double *)(v5 + 8) = self->_timestamp;
    *(_BYTE *)(v5 + 56) |= 1u;
  }
  v7 = -[NSString copyWithZone:](self->_build, "copyWithZone:", a3);
  v8 = *(void **)(v6 + 16);
  *(_QWORD *)(v6 + 16) = v7;

  v9 = -[NSString copyWithZone:](self->_productType, "copyWithZone:", a3);
  v10 = *(void **)(v6 + 40);
  *(_QWORD *)(v6 + 40) = v9;

  has = (char)self->_has;
  if ((has & 2) == 0)
  {
    if ((*(_BYTE *)&self->_has & 4) == 0)
      goto LABEL_5;
LABEL_9:
    *(_DWORD *)(v6 + 28) = self->_minorVersion;
    *(_BYTE *)(v6 + 56) |= 4u;
    if ((*(_BYTE *)&self->_has & 8) == 0)
      goto LABEL_7;
    goto LABEL_6;
  }
  *(_DWORD *)(v6 + 24) = self->_majorVersion;
  *(_BYTE *)(v6 + 56) |= 2u;
  has = (char)self->_has;
  if ((has & 4) != 0)
    goto LABEL_9;
LABEL_5:
  if ((has & 8) != 0)
  {
LABEL_6:
    *(_DWORD *)(v6 + 32) = self->_patchVersion;
    *(_BYTE *)(v6 + 56) |= 8u;
  }
LABEL_7:
  v12 = -[HDCodableSyncIdentity copyWithZone:](self->_syncIdentity, "copyWithZone:", a3);
  v13 = *(void **)(v6 + 48);
  *(_QWORD *)(v6 + 48) = v12;

  return (id)v6;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  NSString *build;
  NSString *productType;
  HDCodableSyncIdentity *syncIdentity;
  char v8;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_28;
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    if ((*((_BYTE *)v4 + 56) & 1) == 0 || self->_timestamp != *((double *)v4 + 1))
      goto LABEL_28;
  }
  else if ((*((_BYTE *)v4 + 56) & 1) != 0)
  {
LABEL_28:
    v8 = 0;
    goto LABEL_29;
  }
  build = self->_build;
  if ((unint64_t)build | *((_QWORD *)v4 + 2) && !-[NSString isEqual:](build, "isEqual:"))
    goto LABEL_28;
  productType = self->_productType;
  if ((unint64_t)productType | *((_QWORD *)v4 + 5))
  {
    if (!-[NSString isEqual:](productType, "isEqual:"))
      goto LABEL_28;
  }
  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
    if ((*((_BYTE *)v4 + 56) & 2) == 0 || self->_majorVersion != *((_DWORD *)v4 + 6))
      goto LABEL_28;
  }
  else if ((*((_BYTE *)v4 + 56) & 2) != 0)
  {
    goto LABEL_28;
  }
  if ((*(_BYTE *)&self->_has & 4) != 0)
  {
    if ((*((_BYTE *)v4 + 56) & 4) == 0 || self->_minorVersion != *((_DWORD *)v4 + 7))
      goto LABEL_28;
  }
  else if ((*((_BYTE *)v4 + 56) & 4) != 0)
  {
    goto LABEL_28;
  }
  if ((*(_BYTE *)&self->_has & 8) != 0)
  {
    if ((*((_BYTE *)v4 + 56) & 8) == 0 || self->_patchVersion != *((_DWORD *)v4 + 8))
      goto LABEL_28;
  }
  else if ((*((_BYTE *)v4 + 56) & 8) != 0)
  {
    goto LABEL_28;
  }
  syncIdentity = self->_syncIdentity;
  if ((unint64_t)syncIdentity | *((_QWORD *)v4 + 6))
    v8 = -[HDCodableSyncIdentity isEqual:](syncIdentity, "isEqual:");
  else
    v8 = 1;
LABEL_29:

  return v8;
}

- (unint64_t)hash
{
  unint64_t v3;
  double timestamp;
  double v5;
  long double v6;
  double v7;
  NSUInteger v8;
  NSUInteger v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;

  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    timestamp = self->_timestamp;
    v5 = -timestamp;
    if (timestamp >= 0.0)
      v5 = self->_timestamp;
    v6 = floor(v5 + 0.5);
    v7 = (v5 - v6) * 1.84467441e19;
    v3 = 2654435761u * (unint64_t)fmod(v6, 1.84467441e19);
    if (v7 >= 0.0)
    {
      if (v7 > 0.0)
        v3 += (unint64_t)v7;
    }
    else
    {
      v3 -= (unint64_t)fabs(v7);
    }
  }
  else
  {
    v3 = 0;
  }
  v8 = -[NSString hash](self->_build, "hash");
  v9 = -[NSString hash](self->_productType, "hash");
  if ((*(_BYTE *)&self->_has & 2) == 0)
  {
    v10 = 0;
    if ((*(_BYTE *)&self->_has & 4) != 0)
      goto LABEL_11;
LABEL_14:
    v11 = 0;
    if ((*(_BYTE *)&self->_has & 8) != 0)
      goto LABEL_12;
LABEL_15:
    v12 = 0;
    return v8 ^ v3 ^ v9 ^ v10 ^ v11 ^ v12 ^ -[HDCodableSyncIdentity hash](self->_syncIdentity, "hash");
  }
  v10 = 2654435761 * self->_majorVersion;
  if ((*(_BYTE *)&self->_has & 4) == 0)
    goto LABEL_14;
LABEL_11:
  v11 = 2654435761 * self->_minorVersion;
  if ((*(_BYTE *)&self->_has & 8) == 0)
    goto LABEL_15;
LABEL_12:
  v12 = 2654435761 * self->_patchVersion;
  return v8 ^ v3 ^ v9 ^ v10 ^ v11 ^ v12 ^ -[HDCodableSyncIdentity hash](self->_syncIdentity, "hash");
}

- (void)mergeFrom:(id)a3
{
  double *v4;
  double *v5;
  char v6;
  HDCodableSyncIdentity *syncIdentity;
  uint64_t v8;
  double *v9;

  v4 = (double *)a3;
  v5 = v4;
  if (((_BYTE)v4[7] & 1) != 0)
  {
    self->_timestamp = v4[1];
    *(_BYTE *)&self->_has |= 1u;
  }
  v9 = v4;
  if (*((_QWORD *)v4 + 2))
  {
    -[HDCodableSyncStateOrigin setBuild:](self, "setBuild:");
    v5 = v9;
  }
  if (*((_QWORD *)v5 + 5))
  {
    -[HDCodableSyncStateOrigin setProductType:](self, "setProductType:");
    v5 = v9;
  }
  v6 = *((_BYTE *)v5 + 56);
  if ((v6 & 2) != 0)
  {
    self->_majorVersion = *((_DWORD *)v5 + 6);
    *(_BYTE *)&self->_has |= 2u;
    v6 = *((_BYTE *)v5 + 56);
    if ((v6 & 4) == 0)
    {
LABEL_9:
      if ((v6 & 8) == 0)
        goto LABEL_11;
      goto LABEL_10;
    }
  }
  else if (((_BYTE)v5[7] & 4) == 0)
  {
    goto LABEL_9;
  }
  self->_minorVersion = *((_DWORD *)v5 + 7);
  *(_BYTE *)&self->_has |= 4u;
  if (((_BYTE)v5[7] & 8) != 0)
  {
LABEL_10:
    self->_patchVersion = *((_DWORD *)v5 + 8);
    *(_BYTE *)&self->_has |= 8u;
  }
LABEL_11:
  syncIdentity = self->_syncIdentity;
  v8 = *((_QWORD *)v5 + 6);
  if (syncIdentity)
  {
    if (v8)
    {
      -[HDCodableSyncIdentity mergeFrom:](syncIdentity, "mergeFrom:");
LABEL_19:
      v5 = v9;
    }
  }
  else if (v8)
  {
    -[HDCodableSyncStateOrigin setSyncIdentity:](self, "setSyncIdentity:");
    goto LABEL_19;
  }

}

- (double)timestamp
{
  return self->_timestamp;
}

- (NSString)build
{
  return self->_build;
}

- (void)setBuild:(id)a3
{
  objc_storeStrong((id *)&self->_build, a3);
}

- (NSString)productType
{
  return self->_productType;
}

- (void)setProductType:(id)a3
{
  objc_storeStrong((id *)&self->_productType, a3);
}

- (int)majorVersion
{
  return self->_majorVersion;
}

- (int)minorVersion
{
  return self->_minorVersion;
}

- (int)patchVersion
{
  return self->_patchVersion;
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
  objc_storeStrong((id *)&self->_productType, 0);
  objc_storeStrong((id *)&self->_build, 0);
}

@end
