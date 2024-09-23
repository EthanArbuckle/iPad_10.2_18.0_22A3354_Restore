@implementation HDCodableClinicalDeletedAccount

- (BOOL)hasSyncIdentifier
{
  return self->_syncIdentifier != 0;
}

- (void)setDeletionDate:(double)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_deletionDate = a3;
}

- (void)setHasDeletionDate:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (BOOL)hasDeletionDate
{
  return *(_BYTE *)&self->_has & 1;
}

- (BOOL)hasMessageVersion
{
  return self->_messageVersion != 0;
}

- (void)setDeletionReason:(int64_t)a3
{
  *(_BYTE *)&self->_has |= 2u;
  self->_deletionReason = a3;
}

- (void)setHasDeletionReason:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFD | v3;
}

- (BOOL)hasDeletionReason
{
  return (*(_BYTE *)&self->_has >> 1) & 1;
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
  v8.super_class = (Class)HDCodableClinicalDeletedAccount;
  -[HDCodableClinicalDeletedAccount description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[HDCodableClinicalDeletedAccount dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  void *v3;
  void *v4;
  NSData *syncIdentifier;
  void *v6;
  HDCodableMessageVersion *messageVersion;
  void *v8;
  void *v9;
  HDCodableSyncIdentity *syncIdentity;
  void *v11;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  syncIdentifier = self->_syncIdentifier;
  if (syncIdentifier)
    objc_msgSend(v3, "setObject:forKey:", syncIdentifier, CFSTR("syncIdentifier"));
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->_deletionDate);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v6, CFSTR("deletionDate"));

  }
  messageVersion = self->_messageVersion;
  if (messageVersion)
  {
    -[HDCodableMessageVersion dictionaryRepresentation](messageVersion, "dictionaryRepresentation");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v8, CFSTR("messageVersion"));

  }
  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", self->_deletionReason);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v9, CFSTR("deletionReason"));

  }
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
  return HDCodableClinicalDeletedAccountReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  v5 = v4;
  if (self->_syncIdentifier)
  {
    PBDataWriterWriteDataField();
    v4 = v5;
  }
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    PBDataWriterWriteDoubleField();
    v4 = v5;
  }
  if (self->_messageVersion)
  {
    PBDataWriterWriteSubmessage();
    v4 = v5;
  }
  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
    PBDataWriterWriteInt64Field();
    v4 = v5;
  }
  if (self->_syncIdentity)
  {
    PBDataWriterWriteSubmessage();
    v4 = v5;
  }

}

- (void)copyTo:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  v5 = v4;
  if (self->_syncIdentifier)
  {
    objc_msgSend(v4, "setSyncIdentifier:");
    v4 = v5;
  }
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    *((_QWORD *)v4 + 1) = *(_QWORD *)&self->_deletionDate;
    *((_BYTE *)v4 + 48) |= 1u;
  }
  if (self->_messageVersion)
  {
    objc_msgSend(v5, "setMessageVersion:");
    v4 = v5;
  }
  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
    *((_QWORD *)v4 + 2) = self->_deletionReason;
    *((_BYTE *)v4 + 48) |= 2u;
  }
  if (self->_syncIdentity)
  {
    objc_msgSend(v5, "setSyncIdentity:");
    v4 = v5;
  }

}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5;
  uint64_t v6;
  void *v7;
  id v8;
  void *v9;
  id v10;
  void *v11;

  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = -[NSData copyWithZone:](self->_syncIdentifier, "copyWithZone:", a3);
  v7 = *(void **)(v5 + 32);
  *(_QWORD *)(v5 + 32) = v6;

  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    *(double *)(v5 + 8) = self->_deletionDate;
    *(_BYTE *)(v5 + 48) |= 1u;
  }
  v8 = -[HDCodableMessageVersion copyWithZone:](self->_messageVersion, "copyWithZone:", a3);
  v9 = *(void **)(v5 + 24);
  *(_QWORD *)(v5 + 24) = v8;

  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
    *(_QWORD *)(v5 + 16) = self->_deletionReason;
    *(_BYTE *)(v5 + 48) |= 2u;
  }
  v10 = -[HDCodableSyncIdentity copyWithZone:](self->_syncIdentity, "copyWithZone:", a3);
  v11 = *(void **)(v5 + 40);
  *(_QWORD *)(v5 + 40) = v10;

  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  NSData *syncIdentifier;
  char has;
  char v7;
  HDCodableMessageVersion *messageVersion;
  HDCodableSyncIdentity *syncIdentity;
  char v10;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_19;
  syncIdentifier = self->_syncIdentifier;
  if ((unint64_t)syncIdentifier | *((_QWORD *)v4 + 4))
  {
    if (!-[NSData isEqual:](syncIdentifier, "isEqual:"))
      goto LABEL_19;
  }
  has = (char)self->_has;
  v7 = *((_BYTE *)v4 + 48);
  if ((has & 1) != 0)
  {
    if ((*((_BYTE *)v4 + 48) & 1) == 0 || self->_deletionDate != *((double *)v4 + 1))
      goto LABEL_19;
  }
  else if ((*((_BYTE *)v4 + 48) & 1) != 0)
  {
    goto LABEL_19;
  }
  messageVersion = self->_messageVersion;
  if ((unint64_t)messageVersion | *((_QWORD *)v4 + 3))
  {
    if (!-[HDCodableMessageVersion isEqual:](messageVersion, "isEqual:"))
    {
LABEL_19:
      v10 = 0;
      goto LABEL_20;
    }
    has = (char)self->_has;
    v7 = *((_BYTE *)v4 + 48);
  }
  if ((has & 2) != 0)
  {
    if ((v7 & 2) == 0 || self->_deletionReason != *((_QWORD *)v4 + 2))
      goto LABEL_19;
  }
  else if ((v7 & 2) != 0)
  {
    goto LABEL_19;
  }
  syncIdentity = self->_syncIdentity;
  if ((unint64_t)syncIdentity | *((_QWORD *)v4 + 5))
    v10 = -[HDCodableSyncIdentity isEqual:](syncIdentity, "isEqual:");
  else
    v10 = 1;
LABEL_20:

  return v10;
}

- (unint64_t)hash
{
  uint64_t v3;
  unint64_t v4;
  double deletionDate;
  double v6;
  long double v7;
  double v8;
  unint64_t v9;
  uint64_t v10;

  v3 = -[NSData hash](self->_syncIdentifier, "hash");
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    deletionDate = self->_deletionDate;
    v6 = -deletionDate;
    if (deletionDate >= 0.0)
      v6 = self->_deletionDate;
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
  v9 = -[HDCodableMessageVersion hash](self->_messageVersion, "hash");
  if ((*(_BYTE *)&self->_has & 2) != 0)
    v10 = 2654435761 * self->_deletionReason;
  else
    v10 = 0;
  return v4 ^ v3 ^ v9 ^ v10 ^ -[HDCodableSyncIdentity hash](self->_syncIdentity, "hash");
}

- (void)mergeFrom:(id)a3
{
  id v4;
  HDCodableMessageVersion *messageVersion;
  uint64_t v6;
  HDCodableSyncIdentity *syncIdentity;
  uint64_t v8;
  id v9;

  v4 = a3;
  v9 = v4;
  if (*((_QWORD *)v4 + 4))
  {
    -[HDCodableClinicalDeletedAccount setSyncIdentifier:](self, "setSyncIdentifier:");
    v4 = v9;
  }
  if ((*((_BYTE *)v4 + 48) & 1) != 0)
  {
    self->_deletionDate = *((double *)v4 + 1);
    *(_BYTE *)&self->_has |= 1u;
  }
  messageVersion = self->_messageVersion;
  v6 = *((_QWORD *)v4 + 3);
  if (messageVersion)
  {
    if (!v6)
      goto LABEL_11;
    -[HDCodableMessageVersion mergeFrom:](messageVersion, "mergeFrom:");
  }
  else
  {
    if (!v6)
      goto LABEL_11;
    -[HDCodableClinicalDeletedAccount setMessageVersion:](self, "setMessageVersion:");
  }
  v4 = v9;
LABEL_11:
  if ((*((_BYTE *)v4 + 48) & 2) != 0)
  {
    self->_deletionReason = *((_QWORD *)v4 + 2);
    *(_BYTE *)&self->_has |= 2u;
  }
  syncIdentity = self->_syncIdentity;
  v8 = *((_QWORD *)v4 + 5);
  if (syncIdentity)
  {
    if (v8)
    {
      -[HDCodableSyncIdentity mergeFrom:](syncIdentity, "mergeFrom:");
LABEL_18:
      v4 = v9;
    }
  }
  else if (v8)
  {
    -[HDCodableClinicalDeletedAccount setSyncIdentity:](self, "setSyncIdentity:");
    goto LABEL_18;
  }

}

- (NSData)syncIdentifier
{
  return self->_syncIdentifier;
}

- (void)setSyncIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_syncIdentifier, a3);
}

- (double)deletionDate
{
  return self->_deletionDate;
}

- (HDCodableMessageVersion)messageVersion
{
  return self->_messageVersion;
}

- (void)setMessageVersion:(id)a3
{
  objc_storeStrong((id *)&self->_messageVersion, a3);
}

- (int64_t)deletionReason
{
  return self->_deletionReason;
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
  objc_storeStrong((id *)&self->_syncIdentifier, 0);
  objc_storeStrong((id *)&self->_messageVersion, 0);
}

@end
