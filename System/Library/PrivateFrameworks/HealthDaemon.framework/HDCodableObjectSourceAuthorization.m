@implementation HDCodableObjectSourceAuthorization

- (BOOL)hasSourceUUID
{
  return self->_sourceUUID != 0;
}

- (void)setAuthorizationStatus:(int64_t)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_authorizationStatus = a3;
}

- (void)setHasAuthorizationStatus:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (BOOL)hasAuthorizationStatus
{
  return *(_BYTE *)&self->_has & 1;
}

- (void)setModificationDate:(double)a3
{
  *(_BYTE *)&self->_has |= 2u;
  self->_modificationDate = a3;
}

- (void)setHasModificationDate:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFD | v3;
}

- (BOOL)hasModificationDate
{
  return (*(_BYTE *)&self->_has >> 1) & 1;
}

- (BOOL)hasSessionUUID
{
  return self->_sessionUUID != 0;
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
  v8.super_class = (Class)HDCodableObjectSourceAuthorization;
  -[HDCodableObjectSourceAuthorization description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[HDCodableObjectSourceAuthorization dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  void *v3;
  void *v4;
  NSData *sourceUUID;
  char has;
  void *v7;
  void *v8;
  NSData *sessionUUID;
  HDCodableSyncIdentity *syncIdentity;
  void *v11;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  sourceUUID = self->_sourceUUID;
  if (sourceUUID)
    objc_msgSend(v3, "setObject:forKey:", sourceUUID, CFSTR("sourceUUID"));
  has = (char)self->_has;
  if ((has & 1) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", self->_authorizationStatus);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v7, CFSTR("authorizationStatus"));

    has = (char)self->_has;
  }
  if ((has & 2) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->_modificationDate);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v8, CFSTR("modificationDate"));

  }
  sessionUUID = self->_sessionUUID;
  if (sessionUUID)
    objc_msgSend(v4, "setObject:forKey:", sessionUUID, CFSTR("sessionUUID"));
  syncIdentity = self->_syncIdentity;
  if (syncIdentity)
  {
    -[HDCodableSyncIdentity dictionaryRepresentation](syncIdentity, "dictionaryRepresentation");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v11, CFSTR("syncIdentity"));

  }
  return v4;
}

- (BOOL)readFrom:(id)a3
{
  return HDCodableObjectSourceAuthorizationReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4;
  char has;
  id v6;

  v4 = a3;
  v6 = v4;
  if (self->_sourceUUID)
  {
    PBDataWriterWriteDataField();
    v4 = v6;
  }
  has = (char)self->_has;
  if ((has & 1) != 0)
  {
    PBDataWriterWriteInt64Field();
    v4 = v6;
    has = (char)self->_has;
  }
  if ((has & 2) != 0)
  {
    PBDataWriterWriteDoubleField();
    v4 = v6;
  }
  if (self->_sessionUUID)
  {
    PBDataWriterWriteDataField();
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
  if (self->_sourceUUID)
  {
    objc_msgSend(v4, "setSourceUUID:");
    v4 = v6;
  }
  has = (char)self->_has;
  if ((has & 1) != 0)
  {
    *((_QWORD *)v4 + 1) = self->_authorizationStatus;
    *((_BYTE *)v4 + 48) |= 1u;
    has = (char)self->_has;
  }
  if ((has & 2) != 0)
  {
    *((_QWORD *)v4 + 2) = *(_QWORD *)&self->_modificationDate;
    *((_BYTE *)v4 + 48) |= 2u;
  }
  if (self->_sessionUUID)
  {
    objc_msgSend(v6, "setSessionUUID:");
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
  char has;
  uint64_t v9;
  void *v10;
  id v11;
  void *v12;

  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = -[NSData copyWithZone:](self->_sourceUUID, "copyWithZone:", a3);
  v7 = *(void **)(v5 + 32);
  *(_QWORD *)(v5 + 32) = v6;

  has = (char)self->_has;
  if ((has & 1) != 0)
  {
    *(_QWORD *)(v5 + 8) = self->_authorizationStatus;
    *(_BYTE *)(v5 + 48) |= 1u;
    has = (char)self->_has;
  }
  if ((has & 2) != 0)
  {
    *(double *)(v5 + 16) = self->_modificationDate;
    *(_BYTE *)(v5 + 48) |= 2u;
  }
  v9 = -[NSData copyWithZone:](self->_sessionUUID, "copyWithZone:", a3);
  v10 = *(void **)(v5 + 24);
  *(_QWORD *)(v5 + 24) = v9;

  v11 = -[HDCodableSyncIdentity copyWithZone:](self->_syncIdentity, "copyWithZone:", a3);
  v12 = *(void **)(v5 + 40);
  *(_QWORD *)(v5 + 40) = v11;

  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  NSData *sourceUUID;
  NSData *sessionUUID;
  HDCodableSyncIdentity *syncIdentity;
  char v8;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_18;
  sourceUUID = self->_sourceUUID;
  if ((unint64_t)sourceUUID | *((_QWORD *)v4 + 4))
  {
    if (!-[NSData isEqual:](sourceUUID, "isEqual:"))
      goto LABEL_18;
  }
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    if ((*((_BYTE *)v4 + 48) & 1) == 0 || self->_authorizationStatus != *((_QWORD *)v4 + 1))
      goto LABEL_18;
  }
  else if ((*((_BYTE *)v4 + 48) & 1) != 0)
  {
LABEL_18:
    v8 = 0;
    goto LABEL_19;
  }
  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
    if ((*((_BYTE *)v4 + 48) & 2) == 0 || self->_modificationDate != *((double *)v4 + 2))
      goto LABEL_18;
  }
  else if ((*((_BYTE *)v4 + 48) & 2) != 0)
  {
    goto LABEL_18;
  }
  sessionUUID = self->_sessionUUID;
  if ((unint64_t)sessionUUID | *((_QWORD *)v4 + 3) && !-[NSData isEqual:](sessionUUID, "isEqual:"))
    goto LABEL_18;
  syncIdentity = self->_syncIdentity;
  if ((unint64_t)syncIdentity | *((_QWORD *)v4 + 5))
    v8 = -[HDCodableSyncIdentity isEqual:](syncIdentity, "isEqual:");
  else
    v8 = 1;
LABEL_19:

  return v8;
}

- (unint64_t)hash
{
  uint64_t v3;
  uint64_t v4;
  double modificationDate;
  double v6;
  long double v7;
  double v8;
  unint64_t v9;
  uint64_t v10;

  v3 = -[NSData hash](self->_sourceUUID, "hash");
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    v4 = 2654435761 * self->_authorizationStatus;
    if ((*(_BYTE *)&self->_has & 2) != 0)
      goto LABEL_3;
LABEL_8:
    v9 = 0;
    goto LABEL_11;
  }
  v4 = 0;
  if ((*(_BYTE *)&self->_has & 2) == 0)
    goto LABEL_8;
LABEL_3:
  modificationDate = self->_modificationDate;
  v6 = -modificationDate;
  if (modificationDate >= 0.0)
    v6 = self->_modificationDate;
  v7 = floor(v6 + 0.5);
  v8 = (v6 - v7) * 1.84467441e19;
  v9 = 2654435761u * (unint64_t)fmod(v7, 1.84467441e19);
  if (v8 >= 0.0)
  {
    if (v8 > 0.0)
      v9 += (unint64_t)v8;
  }
  else
  {
    v9 -= (unint64_t)fabs(v8);
  }
LABEL_11:
  v10 = v4 ^ v3 ^ v9 ^ -[NSData hash](self->_sessionUUID, "hash");
  return v10 ^ -[HDCodableSyncIdentity hash](self->_syncIdentity, "hash");
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
    -[HDCodableObjectSourceAuthorization setSourceUUID:](self, "setSourceUUID:");
    v4 = v8;
  }
  v5 = *((_BYTE *)v4 + 48);
  if ((v5 & 1) != 0)
  {
    self->_authorizationStatus = *((_QWORD *)v4 + 1);
    *(_BYTE *)&self->_has |= 1u;
    v5 = *((_BYTE *)v4 + 48);
  }
  if ((v5 & 2) != 0)
  {
    self->_modificationDate = *((double *)v4 + 2);
    *(_BYTE *)&self->_has |= 2u;
  }
  if (*((_QWORD *)v4 + 3))
  {
    -[HDCodableObjectSourceAuthorization setSessionUUID:](self, "setSessionUUID:");
    v4 = v8;
  }
  syncIdentity = self->_syncIdentity;
  v7 = *((_QWORD *)v4 + 5);
  if (syncIdentity)
  {
    if (v7)
    {
      -[HDCodableSyncIdentity mergeFrom:](syncIdentity, "mergeFrom:");
LABEL_14:
      v4 = v8;
    }
  }
  else if (v7)
  {
    -[HDCodableObjectSourceAuthorization setSyncIdentity:](self, "setSyncIdentity:");
    goto LABEL_14;
  }

}

- (NSData)sourceUUID
{
  return self->_sourceUUID;
}

- (void)setSourceUUID:(id)a3
{
  objc_storeStrong((id *)&self->_sourceUUID, a3);
}

- (int64_t)authorizationStatus
{
  return self->_authorizationStatus;
}

- (double)modificationDate
{
  return self->_modificationDate;
}

- (NSData)sessionUUID
{
  return self->_sessionUUID;
}

- (void)setSessionUUID:(id)a3
{
  objc_storeStrong((id *)&self->_sessionUUID, a3);
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
  objc_storeStrong((id *)&self->_sourceUUID, 0);
  objc_storeStrong((id *)&self->_sessionUUID, 0);
}

@end
