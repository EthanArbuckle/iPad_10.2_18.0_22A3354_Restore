@implementation HDCodableAuthorization

- (void)setObjectType:(int64_t)a3
{
  *(_BYTE *)&self->_has |= 0x20u;
  self->_objectType = a3;
}

- (void)setHasObjectType:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 32;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xDF | v3;
}

- (BOOL)hasObjectType
{
  return (*(_BYTE *)&self->_has >> 5) & 1;
}

- (void)setAuthorizationStatus:(int64_t)a3
{
  *(_BYTE *)&self->_has |= 4u;
  self->_authorizationStatus = a3;
}

- (void)setHasAuthorizationStatus:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 4;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFB | v3;
}

- (BOOL)hasAuthorizationStatus
{
  return (*(_BYTE *)&self->_has >> 2) & 1;
}

- (void)setAuthorizationRequest:(int64_t)a3
{
  *(_BYTE *)&self->_has |= 2u;
  self->_authorizationRequest = a3;
}

- (void)setHasAuthorizationRequest:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFD | v3;
}

- (BOOL)hasAuthorizationRequest
{
  return (*(_BYTE *)&self->_has >> 1) & 1;
}

- (void)setModificationDate:(double)a3
{
  *(_BYTE *)&self->_has |= 8u;
  self->_modificationDate = a3;
}

- (void)setHasModificationDate:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 8;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xF7 | v3;
}

- (BOOL)hasModificationDate
{
  return (*(_BYTE *)&self->_has >> 3) & 1;
}

- (void)setModificationEpoch:(int64_t)a3
{
  *(_BYTE *)&self->_has |= 0x10u;
  self->_modificationEpoch = a3;
}

- (void)setHasModificationEpoch:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 16;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xEF | v3;
}

- (BOOL)hasModificationEpoch
{
  return (*(_BYTE *)&self->_has >> 4) & 1;
}

- (void)setAuthorizationMode:(int64_t)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_authorizationMode = a3;
}

- (void)setHasAuthorizationMode:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (BOOL)hasAuthorizationMode
{
  return *(_BYTE *)&self->_has & 1;
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
  v8.super_class = (Class)HDCodableAuthorization;
  -[HDCodableAuthorization description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[HDCodableAuthorization dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  void *v3;
  char has;
  void *v5;
  HDCodableSyncIdentity *syncIdentity;
  void *v7;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  has = (char)self->_has;
  if ((has & 0x20) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", self->_objectType);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v9, CFSTR("objectType"));

    has = (char)self->_has;
    if ((has & 4) == 0)
    {
LABEL_3:
      if ((has & 2) == 0)
        goto LABEL_4;
      goto LABEL_13;
    }
  }
  else if ((*(_BYTE *)&self->_has & 4) == 0)
  {
    goto LABEL_3;
  }
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", self->_authorizationStatus);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v10, CFSTR("authorizationStatus"));

  has = (char)self->_has;
  if ((has & 2) == 0)
  {
LABEL_4:
    if ((has & 8) == 0)
      goto LABEL_5;
    goto LABEL_14;
  }
LABEL_13:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", self->_authorizationRequest);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v11, CFSTR("authorizationRequest"));

  has = (char)self->_has;
  if ((has & 8) == 0)
  {
LABEL_5:
    if ((has & 0x10) == 0)
      goto LABEL_6;
    goto LABEL_15;
  }
LABEL_14:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->_modificationDate);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v12, CFSTR("modificationDate"));

  has = (char)self->_has;
  if ((has & 0x10) == 0)
  {
LABEL_6:
    if ((has & 1) == 0)
      goto LABEL_8;
    goto LABEL_7;
  }
LABEL_15:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", self->_modificationEpoch);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v13, CFSTR("modificationEpoch"));

  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
LABEL_7:
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", self->_authorizationMode);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v5, CFSTR("authorizationMode"));

  }
LABEL_8:
  syncIdentity = self->_syncIdentity;
  if (syncIdentity)
  {
    -[HDCodableSyncIdentity dictionaryRepresentation](syncIdentity, "dictionaryRepresentation");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v7, CFSTR("syncIdentity"));

  }
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return HDCodableAuthorizationReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4;
  char has;
  id v6;

  v4 = a3;
  has = (char)self->_has;
  v6 = v4;
  if ((has & 0x20) != 0)
  {
    PBDataWriterWriteInt64Field();
    v4 = v6;
    has = (char)self->_has;
    if ((has & 4) == 0)
    {
LABEL_3:
      if ((has & 2) == 0)
        goto LABEL_4;
      goto LABEL_13;
    }
  }
  else if ((*(_BYTE *)&self->_has & 4) == 0)
  {
    goto LABEL_3;
  }
  PBDataWriterWriteInt64Field();
  v4 = v6;
  has = (char)self->_has;
  if ((has & 2) == 0)
  {
LABEL_4:
    if ((has & 8) == 0)
      goto LABEL_5;
    goto LABEL_14;
  }
LABEL_13:
  PBDataWriterWriteInt64Field();
  v4 = v6;
  has = (char)self->_has;
  if ((has & 8) == 0)
  {
LABEL_5:
    if ((has & 0x10) == 0)
      goto LABEL_6;
    goto LABEL_15;
  }
LABEL_14:
  PBDataWriterWriteDoubleField();
  v4 = v6;
  has = (char)self->_has;
  if ((has & 0x10) == 0)
  {
LABEL_6:
    if ((has & 1) == 0)
      goto LABEL_8;
    goto LABEL_7;
  }
LABEL_15:
  PBDataWriterWriteInt64Field();
  v4 = v6;
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
LABEL_7:
    PBDataWriterWriteInt64Field();
    v4 = v6;
  }
LABEL_8:
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
  has = (char)self->_has;
  if ((has & 0x20) != 0)
  {
    v4[6] = self->_objectType;
    *((_BYTE *)v4 + 64) |= 0x20u;
    has = (char)self->_has;
    if ((has & 4) == 0)
    {
LABEL_3:
      if ((has & 2) == 0)
        goto LABEL_4;
      goto LABEL_13;
    }
  }
  else if ((*(_BYTE *)&self->_has & 4) == 0)
  {
    goto LABEL_3;
  }
  v4[3] = self->_authorizationStatus;
  *((_BYTE *)v4 + 64) |= 4u;
  has = (char)self->_has;
  if ((has & 2) == 0)
  {
LABEL_4:
    if ((has & 8) == 0)
      goto LABEL_5;
    goto LABEL_14;
  }
LABEL_13:
  v4[2] = self->_authorizationRequest;
  *((_BYTE *)v4 + 64) |= 2u;
  has = (char)self->_has;
  if ((has & 8) == 0)
  {
LABEL_5:
    if ((has & 0x10) == 0)
      goto LABEL_6;
    goto LABEL_15;
  }
LABEL_14:
  v4[4] = *(_QWORD *)&self->_modificationDate;
  *((_BYTE *)v4 + 64) |= 8u;
  has = (char)self->_has;
  if ((has & 0x10) == 0)
  {
LABEL_6:
    if ((has & 1) == 0)
      goto LABEL_8;
    goto LABEL_7;
  }
LABEL_15:
  v4[5] = self->_modificationEpoch;
  *((_BYTE *)v4 + 64) |= 0x10u;
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
LABEL_7:
    v4[1] = self->_authorizationMode;
    *((_BYTE *)v4 + 64) |= 1u;
  }
LABEL_8:
  if (self->_syncIdentity)
  {
    v6 = v4;
    objc_msgSend(v4, "setSyncIdentity:");
    v4 = v6;
  }

}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5;
  _QWORD *v6;
  char has;
  id v8;
  void *v9;

  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = (_QWORD *)v5;
  has = (char)self->_has;
  if ((has & 0x20) != 0)
  {
    *(_QWORD *)(v5 + 48) = self->_objectType;
    *(_BYTE *)(v5 + 64) |= 0x20u;
    has = (char)self->_has;
    if ((has & 4) == 0)
    {
LABEL_3:
      if ((has & 2) == 0)
        goto LABEL_4;
      goto LABEL_11;
    }
  }
  else if ((*(_BYTE *)&self->_has & 4) == 0)
  {
    goto LABEL_3;
  }
  *(_QWORD *)(v5 + 24) = self->_authorizationStatus;
  *(_BYTE *)(v5 + 64) |= 4u;
  has = (char)self->_has;
  if ((has & 2) == 0)
  {
LABEL_4:
    if ((has & 8) == 0)
      goto LABEL_5;
    goto LABEL_12;
  }
LABEL_11:
  *(_QWORD *)(v5 + 16) = self->_authorizationRequest;
  *(_BYTE *)(v5 + 64) |= 2u;
  has = (char)self->_has;
  if ((has & 8) == 0)
  {
LABEL_5:
    if ((has & 0x10) == 0)
      goto LABEL_6;
LABEL_13:
    *(_QWORD *)(v5 + 40) = self->_modificationEpoch;
    *(_BYTE *)(v5 + 64) |= 0x10u;
    if ((*(_BYTE *)&self->_has & 1) == 0)
      goto LABEL_8;
    goto LABEL_7;
  }
LABEL_12:
  *(double *)(v5 + 32) = self->_modificationDate;
  *(_BYTE *)(v5 + 64) |= 8u;
  has = (char)self->_has;
  if ((has & 0x10) != 0)
    goto LABEL_13;
LABEL_6:
  if ((has & 1) != 0)
  {
LABEL_7:
    *(_QWORD *)(v5 + 8) = self->_authorizationMode;
    *(_BYTE *)(v5 + 64) |= 1u;
  }
LABEL_8:
  v8 = -[HDCodableSyncIdentity copyWithZone:](self->_syncIdentity, "copyWithZone:", a3);
  v9 = (void *)v6[7];
  v6[7] = v8;

  return v6;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  HDCodableSyncIdentity *syncIdentity;
  char v6;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_34;
  if ((*(_BYTE *)&self->_has & 0x20) != 0)
  {
    if ((*((_BYTE *)v4 + 64) & 0x20) == 0 || self->_objectType != *((_QWORD *)v4 + 6))
      goto LABEL_34;
  }
  else if ((*((_BYTE *)v4 + 64) & 0x20) != 0)
  {
LABEL_34:
    v6 = 0;
    goto LABEL_35;
  }
  if ((*(_BYTE *)&self->_has & 4) != 0)
  {
    if ((*((_BYTE *)v4 + 64) & 4) == 0 || self->_authorizationStatus != *((_QWORD *)v4 + 3))
      goto LABEL_34;
  }
  else if ((*((_BYTE *)v4 + 64) & 4) != 0)
  {
    goto LABEL_34;
  }
  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
    if ((*((_BYTE *)v4 + 64) & 2) == 0 || self->_authorizationRequest != *((_QWORD *)v4 + 2))
      goto LABEL_34;
  }
  else if ((*((_BYTE *)v4 + 64) & 2) != 0)
  {
    goto LABEL_34;
  }
  if ((*(_BYTE *)&self->_has & 8) != 0)
  {
    if ((*((_BYTE *)v4 + 64) & 8) == 0 || self->_modificationDate != *((double *)v4 + 4))
      goto LABEL_34;
  }
  else if ((*((_BYTE *)v4 + 64) & 8) != 0)
  {
    goto LABEL_34;
  }
  if ((*(_BYTE *)&self->_has & 0x10) != 0)
  {
    if ((*((_BYTE *)v4 + 64) & 0x10) == 0 || self->_modificationEpoch != *((_QWORD *)v4 + 5))
      goto LABEL_34;
  }
  else if ((*((_BYTE *)v4 + 64) & 0x10) != 0)
  {
    goto LABEL_34;
  }
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    if ((*((_BYTE *)v4 + 64) & 1) == 0 || self->_authorizationMode != *((_QWORD *)v4 + 1))
      goto LABEL_34;
  }
  else if ((*((_BYTE *)v4 + 64) & 1) != 0)
  {
    goto LABEL_34;
  }
  syncIdentity = self->_syncIdentity;
  if ((unint64_t)syncIdentity | *((_QWORD *)v4 + 7))
    v6 = -[HDCodableSyncIdentity isEqual:](syncIdentity, "isEqual:");
  else
    v6 = 1;
LABEL_35:

  return v6;
}

- (unint64_t)hash
{
  char has;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  double modificationDate;
  double v8;
  long double v9;
  double v10;
  unint64_t v11;
  uint64_t v12;
  uint64_t v13;

  has = (char)self->_has;
  if ((has & 0x20) != 0)
  {
    v4 = 2654435761 * self->_objectType;
    if ((*(_BYTE *)&self->_has & 4) != 0)
    {
LABEL_3:
      v5 = 2654435761 * self->_authorizationStatus;
      if ((*(_BYTE *)&self->_has & 2) != 0)
        goto LABEL_4;
LABEL_11:
      v6 = 0;
      if ((*(_BYTE *)&self->_has & 8) != 0)
        goto LABEL_5;
LABEL_12:
      v11 = 0;
      goto LABEL_15;
    }
  }
  else
  {
    v4 = 0;
    if ((*(_BYTE *)&self->_has & 4) != 0)
      goto LABEL_3;
  }
  v5 = 0;
  if ((*(_BYTE *)&self->_has & 2) == 0)
    goto LABEL_11;
LABEL_4:
  v6 = 2654435761 * self->_authorizationRequest;
  if ((*(_BYTE *)&self->_has & 8) == 0)
    goto LABEL_12;
LABEL_5:
  modificationDate = self->_modificationDate;
  v8 = -modificationDate;
  if (modificationDate >= 0.0)
    v8 = self->_modificationDate;
  v9 = floor(v8 + 0.5);
  v10 = (v8 - v9) * 1.84467441e19;
  v11 = 2654435761u * (unint64_t)fmod(v9, 1.84467441e19);
  if (v10 >= 0.0)
  {
    if (v10 > 0.0)
      v11 += (unint64_t)v10;
  }
  else
  {
    v11 -= (unint64_t)fabs(v10);
  }
LABEL_15:
  if ((has & 0x10) != 0)
  {
    v12 = 2654435761 * self->_modificationEpoch;
    if ((has & 1) != 0)
      goto LABEL_17;
LABEL_19:
    v13 = 0;
    return v5 ^ v4 ^ v6 ^ v11 ^ v12 ^ v13 ^ -[HDCodableSyncIdentity hash](self->_syncIdentity, "hash");
  }
  v12 = 0;
  if ((has & 1) == 0)
    goto LABEL_19;
LABEL_17:
  v13 = 2654435761 * self->_authorizationMode;
  return v5 ^ v4 ^ v6 ^ v11 ^ v12 ^ v13 ^ -[HDCodableSyncIdentity hash](self->_syncIdentity, "hash");
}

- (void)mergeFrom:(id)a3
{
  id v4;
  _QWORD *v5;
  char v6;
  HDCodableSyncIdentity *syncIdentity;
  uint64_t v8;
  _QWORD *v9;

  v4 = a3;
  v5 = v4;
  v6 = *((_BYTE *)v4 + 64);
  if ((v6 & 0x20) != 0)
  {
    self->_objectType = *((_QWORD *)v4 + 6);
    *(_BYTE *)&self->_has |= 0x20u;
    v6 = *((_BYTE *)v4 + 64);
    if ((v6 & 4) == 0)
    {
LABEL_3:
      if ((v6 & 2) == 0)
        goto LABEL_4;
      goto LABEL_13;
    }
  }
  else if ((*((_BYTE *)v4 + 64) & 4) == 0)
  {
    goto LABEL_3;
  }
  self->_authorizationStatus = *((_QWORD *)v4 + 3);
  *(_BYTE *)&self->_has |= 4u;
  v6 = *((_BYTE *)v4 + 64);
  if ((v6 & 2) == 0)
  {
LABEL_4:
    if ((v6 & 8) == 0)
      goto LABEL_5;
    goto LABEL_14;
  }
LABEL_13:
  self->_authorizationRequest = *((_QWORD *)v4 + 2);
  *(_BYTE *)&self->_has |= 2u;
  v6 = *((_BYTE *)v4 + 64);
  if ((v6 & 8) == 0)
  {
LABEL_5:
    if ((v6 & 0x10) == 0)
      goto LABEL_6;
    goto LABEL_15;
  }
LABEL_14:
  self->_modificationDate = *((double *)v4 + 4);
  *(_BYTE *)&self->_has |= 8u;
  v6 = *((_BYTE *)v4 + 64);
  if ((v6 & 0x10) == 0)
  {
LABEL_6:
    if ((v6 & 1) == 0)
      goto LABEL_8;
    goto LABEL_7;
  }
LABEL_15:
  self->_modificationEpoch = *((_QWORD *)v4 + 5);
  *(_BYTE *)&self->_has |= 0x10u;
  if ((*((_BYTE *)v4 + 64) & 1) != 0)
  {
LABEL_7:
    self->_authorizationMode = *((_QWORD *)v4 + 1);
    *(_BYTE *)&self->_has |= 1u;
  }
LABEL_8:
  syncIdentity = self->_syncIdentity;
  v8 = v5[7];
  if (syncIdentity)
  {
    if (v8)
    {
      v9 = v5;
      -[HDCodableSyncIdentity mergeFrom:](syncIdentity, "mergeFrom:");
LABEL_19:
      v5 = v9;
    }
  }
  else if (v8)
  {
    v9 = v5;
    -[HDCodableAuthorization setSyncIdentity:](self, "setSyncIdentity:");
    goto LABEL_19;
  }

}

- (int64_t)objectType
{
  return self->_objectType;
}

- (int64_t)authorizationStatus
{
  return self->_authorizationStatus;
}

- (int64_t)authorizationRequest
{
  return self->_authorizationRequest;
}

- (double)modificationDate
{
  return self->_modificationDate;
}

- (int64_t)modificationEpoch
{
  return self->_modificationEpoch;
}

- (int64_t)authorizationMode
{
  return self->_authorizationMode;
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
}

- (void)_setDataTypeCodeWithObjectType:(id)a3
{
  -[HDCodableAuthorization setObjectType:](self, "setObjectType:", objc_msgSend(a3, "code"));
}

- (void)_setAuthorizationStatusWithNumber:(id)a3
{
  -[HDCodableAuthorization setAuthorizationStatus:](self, "setAuthorizationStatus:", objc_msgSend(a3, "integerValue"));
}

- (void)_setAuthorizationRequestWithNumber:(id)a3
{
  -[HDCodableAuthorization setAuthorizationRequest:](self, "setAuthorizationRequest:", objc_msgSend(a3, "integerValue"));
}

- (void)_setAuthorizationModeWithNumber:(id)a3
{
  -[HDCodableAuthorization setAuthorizationMode:](self, "setAuthorizationMode:", objc_msgSend(a3, "integerValue"));
}

- (id)_modificationDate
{
  if ((*(_BYTE *)&self->_has & 8) == 0)
    return 0;
  HDDecodeDateForValue();
  return (id)objc_claimAutoreleasedReturnValue();
}

- (void)_setModificationDate:(id)a3
{
  if (a3)
  {
    objc_msgSend(a3, "timeIntervalSinceReferenceDate");
    -[HDCodableAuthorization setModificationDate:](self, "setModificationDate:");
  }
  else
  {
    -[HDCodableAuthorization setHasModificationDate:](self, "setHasModificationDate:");
  }
}

@end
