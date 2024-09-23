@implementation HDCodableContributor

- (BOOL)hasUuid
{
  return self->_uuid != 0;
}

- (void)setDeleted:(BOOL)a3
{
  *(_BYTE *)&self->_has |= 2u;
  self->_deleted = a3;
}

- (void)setHasDeleted:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFD | v3;
}

- (BOOL)hasDeleted
{
  return (*(_BYTE *)&self->_has >> 1) & 1;
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

- (BOOL)hasSyncIdentity
{
  return self->_syncIdentity != 0;
}

- (BOOL)hasAppleID
{
  return self->_appleID != 0;
}

- (BOOL)hasCallerID
{
  return self->_callerID != 0;
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
  v8.super_class = (Class)HDCodableContributor;
  -[HDCodableContributor description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[HDCodableContributor dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  void *v3;
  void *v4;
  NSData *uuid;
  char has;
  void *v7;
  void *v8;
  HDCodableSyncIdentity *syncIdentity;
  void *v10;
  NSString *appleID;
  NSString *callerID;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  uuid = self->_uuid;
  if (uuid)
    objc_msgSend(v3, "setObject:forKey:", uuid, CFSTR("uuid"));
  has = (char)self->_has;
  if ((has & 2) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_deleted);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v7, CFSTR("deleted"));

    has = (char)self->_has;
  }
  if ((has & 1) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->_modificationDate);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v8, CFSTR("modificationDate"));

  }
  syncIdentity = self->_syncIdentity;
  if (syncIdentity)
  {
    -[HDCodableSyncIdentity dictionaryRepresentation](syncIdentity, "dictionaryRepresentation");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v10, CFSTR("syncIdentity"));

  }
  appleID = self->_appleID;
  if (appleID)
    objc_msgSend(v4, "setObject:forKey:", appleID, CFSTR("appleID"));
  callerID = self->_callerID;
  if (callerID)
    objc_msgSend(v4, "setObject:forKey:", callerID, CFSTR("callerID"));
  return v4;
}

- (BOOL)readFrom:(id)a3
{
  return HDCodableContributorReadFrom((uint64_t)self, (uint64_t)a3);
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
  has = (char)self->_has;
  if ((has & 2) != 0)
  {
    PBDataWriterWriteBOOLField();
    v4 = v6;
    has = (char)self->_has;
  }
  if ((has & 1) != 0)
  {
    PBDataWriterWriteDoubleField();
    v4 = v6;
  }
  if (self->_syncIdentity)
  {
    PBDataWriterWriteSubmessage();
    v4 = v6;
  }
  if (self->_appleID)
  {
    PBDataWriterWriteStringField();
    v4 = v6;
  }
  if (self->_callerID)
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
  if (self->_uuid)
  {
    objc_msgSend(v4, "setUuid:");
    v4 = v6;
  }
  has = (char)self->_has;
  if ((has & 2) != 0)
  {
    *((_BYTE *)v4 + 48) = self->_deleted;
    *((_BYTE *)v4 + 52) |= 2u;
    has = (char)self->_has;
  }
  if ((has & 1) != 0)
  {
    *((_QWORD *)v4 + 1) = *(_QWORD *)&self->_modificationDate;
    *((_BYTE *)v4 + 52) |= 1u;
  }
  if (self->_syncIdentity)
  {
    objc_msgSend(v6, "setSyncIdentity:");
    v4 = v6;
  }
  if (self->_appleID)
  {
    objc_msgSend(v6, "setAppleID:");
    v4 = v6;
  }
  if (self->_callerID)
  {
    objc_msgSend(v6, "setCallerID:");
    v4 = v6;
  }

}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5;
  uint64_t v6;
  void *v7;
  char has;
  id v9;
  void *v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  void *v14;

  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = -[NSData copyWithZone:](self->_uuid, "copyWithZone:", a3);
  v7 = *(void **)(v5 + 40);
  *(_QWORD *)(v5 + 40) = v6;

  has = (char)self->_has;
  if ((has & 2) != 0)
  {
    *(_BYTE *)(v5 + 48) = self->_deleted;
    *(_BYTE *)(v5 + 52) |= 2u;
    has = (char)self->_has;
  }
  if ((has & 1) != 0)
  {
    *(double *)(v5 + 8) = self->_modificationDate;
    *(_BYTE *)(v5 + 52) |= 1u;
  }
  v9 = -[HDCodableSyncIdentity copyWithZone:](self->_syncIdentity, "copyWithZone:", a3);
  v10 = *(void **)(v5 + 32);
  *(_QWORD *)(v5 + 32) = v9;

  v11 = -[NSString copyWithZone:](self->_appleID, "copyWithZone:", a3);
  v12 = *(void **)(v5 + 16);
  *(_QWORD *)(v5 + 16) = v11;

  v13 = -[NSString copyWithZone:](self->_callerID, "copyWithZone:", a3);
  v14 = *(void **)(v5 + 24);
  *(_QWORD *)(v5 + 24) = v13;

  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  NSData *uuid;
  HDCodableSyncIdentity *syncIdentity;
  NSString *appleID;
  NSString *callerID;
  char v9;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_23;
  uuid = self->_uuid;
  if ((unint64_t)uuid | *((_QWORD *)v4 + 5))
  {
    if (!-[NSData isEqual:](uuid, "isEqual:"))
      goto LABEL_23;
  }
  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
    if ((*((_BYTE *)v4 + 52) & 2) != 0)
    {
      if (self->_deleted)
      {
        if (!*((_BYTE *)v4 + 48))
          goto LABEL_23;
        goto LABEL_12;
      }
      if (!*((_BYTE *)v4 + 48))
        goto LABEL_12;
    }
LABEL_23:
    v9 = 0;
    goto LABEL_24;
  }
  if ((*((_BYTE *)v4 + 52) & 2) != 0)
    goto LABEL_23;
LABEL_12:
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    if ((*((_BYTE *)v4 + 52) & 1) == 0 || self->_modificationDate != *((double *)v4 + 1))
      goto LABEL_23;
  }
  else if ((*((_BYTE *)v4 + 52) & 1) != 0)
  {
    goto LABEL_23;
  }
  syncIdentity = self->_syncIdentity;
  if ((unint64_t)syncIdentity | *((_QWORD *)v4 + 4)
    && !-[HDCodableSyncIdentity isEqual:](syncIdentity, "isEqual:"))
  {
    goto LABEL_23;
  }
  appleID = self->_appleID;
  if ((unint64_t)appleID | *((_QWORD *)v4 + 2))
  {
    if (!-[NSString isEqual:](appleID, "isEqual:"))
      goto LABEL_23;
  }
  callerID = self->_callerID;
  if ((unint64_t)callerID | *((_QWORD *)v4 + 3))
    v9 = -[NSString isEqual:](callerID, "isEqual:");
  else
    v9 = 1;
LABEL_24:

  return v9;
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
  unint64_t v10;
  NSUInteger v11;

  v3 = -[NSData hash](self->_uuid, "hash");
  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
    v4 = 2654435761 * self->_deleted;
    if ((*(_BYTE *)&self->_has & 1) != 0)
      goto LABEL_3;
LABEL_8:
    v9 = 0;
    goto LABEL_11;
  }
  v4 = 0;
  if ((*(_BYTE *)&self->_has & 1) == 0)
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
  v10 = v4 ^ v3 ^ v9 ^ -[HDCodableSyncIdentity hash](self->_syncIdentity, "hash");
  v11 = -[NSString hash](self->_appleID, "hash");
  return v10 ^ v11 ^ -[NSString hash](self->_callerID, "hash");
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
  if (*((_QWORD *)v4 + 5))
  {
    -[HDCodableContributor setUuid:](self, "setUuid:");
    v4 = v8;
  }
  v5 = *((_BYTE *)v4 + 52);
  if ((v5 & 2) != 0)
  {
    self->_deleted = *((_BYTE *)v4 + 48);
    *(_BYTE *)&self->_has |= 2u;
    v5 = *((_BYTE *)v4 + 52);
  }
  if ((v5 & 1) != 0)
  {
    self->_modificationDate = *((double *)v4 + 1);
    *(_BYTE *)&self->_has |= 1u;
  }
  syncIdentity = self->_syncIdentity;
  v7 = *((_QWORD *)v4 + 4);
  if (syncIdentity)
  {
    if (!v7)
      goto LABEL_13;
    -[HDCodableSyncIdentity mergeFrom:](syncIdentity, "mergeFrom:");
  }
  else
  {
    if (!v7)
      goto LABEL_13;
    -[HDCodableContributor setSyncIdentity:](self, "setSyncIdentity:");
  }
  v4 = v8;
LABEL_13:
  if (*((_QWORD *)v4 + 2))
  {
    -[HDCodableContributor setAppleID:](self, "setAppleID:");
    v4 = v8;
  }
  if (*((_QWORD *)v4 + 3))
  {
    -[HDCodableContributor setCallerID:](self, "setCallerID:");
    v4 = v8;
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

- (BOOL)deleted
{
  return self->_deleted;
}

- (double)modificationDate
{
  return self->_modificationDate;
}

- (HDCodableSyncIdentity)syncIdentity
{
  return self->_syncIdentity;
}

- (void)setSyncIdentity:(id)a3
{
  objc_storeStrong((id *)&self->_syncIdentity, a3);
}

- (NSString)appleID
{
  return self->_appleID;
}

- (void)setAppleID:(id)a3
{
  objc_storeStrong((id *)&self->_appleID, a3);
}

- (NSString)callerID
{
  return self->_callerID;
}

- (void)setCallerID:(id)a3
{
  objc_storeStrong((id *)&self->_callerID, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_uuid, 0);
  objc_storeStrong((id *)&self->_syncIdentity, 0);
  objc_storeStrong((id *)&self->_callerID, 0);
  objc_storeStrong((id *)&self->_appleID, 0);
}

@end
