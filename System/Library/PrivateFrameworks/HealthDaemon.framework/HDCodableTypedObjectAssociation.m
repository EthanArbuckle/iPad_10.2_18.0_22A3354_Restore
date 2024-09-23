@implementation HDCodableTypedObjectAssociation

- (BOOL)hasAssociationUUID
{
  return self->_associationUUID != 0;
}

- (BOOL)hasObjectUUIDs
{
  return self->_objectUUIDs != 0;
}

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

- (void)setDeleted:(BOOL)a3
{
  *(_BYTE *)&self->_has |= 4u;
  self->_deleted = a3;
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

- (BOOL)hasSubObjectUUID
{
  return self->_subObjectUUID != 0;
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
  v8.super_class = (Class)HDCodableTypedObjectAssociation;
  -[HDCodableTypedObjectAssociation description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[HDCodableTypedObjectAssociation dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  void *v3;
  void *v4;
  NSData *associationUUID;
  NSData *objectUUIDs;
  HDCodableSyncIdentity *syncIdentity;
  void *v8;
  char has;
  void *v10;
  NSData *subObjectUUID;
  void *v13;
  void *v14;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  associationUUID = self->_associationUUID;
  if (associationUUID)
    objc_msgSend(v3, "setObject:forKey:", associationUUID, CFSTR("associationUUID"));
  objectUUIDs = self->_objectUUIDs;
  if (objectUUIDs)
    objc_msgSend(v4, "setObject:forKey:", objectUUIDs, CFSTR("objectUUIDs"));
  syncIdentity = self->_syncIdentity;
  if (syncIdentity)
  {
    -[HDCodableSyncIdentity dictionaryRepresentation](syncIdentity, "dictionaryRepresentation");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v8, CFSTR("syncIdentity"));

  }
  has = (char)self->_has;
  if ((has & 2) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", self->_type);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v13, CFSTR("type"));

    has = (char)self->_has;
    if ((has & 4) == 0)
    {
LABEL_9:
      if ((has & 1) == 0)
        goto LABEL_11;
      goto LABEL_10;
    }
  }
  else if ((*(_BYTE *)&self->_has & 4) == 0)
  {
    goto LABEL_9;
  }
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_deleted);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKey:", v14, CFSTR("deleted"));

  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
LABEL_10:
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->_creationDate);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v10, CFSTR("creationDate"));

  }
LABEL_11:
  subObjectUUID = self->_subObjectUUID;
  if (subObjectUUID)
    objc_msgSend(v4, "setObject:forKey:", subObjectUUID, CFSTR("subObjectUUID"));
  return v4;
}

- (BOOL)readFrom:(id)a3
{
  return HDCodableTypedObjectAssociationReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4;
  char has;
  id v6;

  v4 = a3;
  v6 = v4;
  if (self->_associationUUID)
  {
    PBDataWriterWriteDataField();
    v4 = v6;
  }
  if (self->_objectUUIDs)
  {
    PBDataWriterWriteDataField();
    v4 = v6;
  }
  if (self->_syncIdentity)
  {
    PBDataWriterWriteSubmessage();
    v4 = v6;
  }
  has = (char)self->_has;
  if ((has & 2) != 0)
  {
    PBDataWriterWriteInt64Field();
    v4 = v6;
    has = (char)self->_has;
    if ((has & 4) == 0)
    {
LABEL_9:
      if ((has & 1) == 0)
        goto LABEL_11;
      goto LABEL_10;
    }
  }
  else if ((*(_BYTE *)&self->_has & 4) == 0)
  {
    goto LABEL_9;
  }
  PBDataWriterWriteBOOLField();
  v4 = v6;
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
LABEL_10:
    PBDataWriterWriteDoubleField();
    v4 = v6;
  }
LABEL_11:
  if (self->_subObjectUUID)
  {
    PBDataWriterWriteDataField();
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
  if (self->_associationUUID)
  {
    objc_msgSend(v4, "setAssociationUUID:");
    v4 = v6;
  }
  if (self->_objectUUIDs)
  {
    objc_msgSend(v6, "setObjectUUIDs:");
    v4 = v6;
  }
  if (self->_syncIdentity)
  {
    objc_msgSend(v6, "setSyncIdentity:");
    v4 = v6;
  }
  has = (char)self->_has;
  if ((has & 2) != 0)
  {
    *((_QWORD *)v4 + 2) = self->_type;
    *((_BYTE *)v4 + 60) |= 2u;
    has = (char)self->_has;
    if ((has & 4) == 0)
    {
LABEL_9:
      if ((has & 1) == 0)
        goto LABEL_11;
      goto LABEL_10;
    }
  }
  else if ((*(_BYTE *)&self->_has & 4) == 0)
  {
    goto LABEL_9;
  }
  *((_BYTE *)v4 + 56) = self->_deleted;
  *((_BYTE *)v4 + 60) |= 4u;
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
LABEL_10:
    *((_QWORD *)v4 + 1) = *(_QWORD *)&self->_creationDate;
    *((_BYTE *)v4 + 60) |= 1u;
  }
LABEL_11:
  if (self->_subObjectUUID)
  {
    objc_msgSend(v6, "setSubObjectUUID:");
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
  id v10;
  void *v11;
  char has;
  uint64_t v13;
  void *v14;

  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = -[NSData copyWithZone:](self->_associationUUID, "copyWithZone:", a3);
  v7 = *(void **)(v5 + 24);
  *(_QWORD *)(v5 + 24) = v6;

  v8 = -[NSData copyWithZone:](self->_objectUUIDs, "copyWithZone:", a3);
  v9 = *(void **)(v5 + 32);
  *(_QWORD *)(v5 + 32) = v8;

  v10 = -[HDCodableSyncIdentity copyWithZone:](self->_syncIdentity, "copyWithZone:", a3);
  v11 = *(void **)(v5 + 48);
  *(_QWORD *)(v5 + 48) = v10;

  has = (char)self->_has;
  if ((has & 2) == 0)
  {
    if ((*(_BYTE *)&self->_has & 4) == 0)
      goto LABEL_3;
LABEL_7:
    *(_BYTE *)(v5 + 56) = self->_deleted;
    *(_BYTE *)(v5 + 60) |= 4u;
    if ((*(_BYTE *)&self->_has & 1) == 0)
      goto LABEL_5;
    goto LABEL_4;
  }
  *(_QWORD *)(v5 + 16) = self->_type;
  *(_BYTE *)(v5 + 60) |= 2u;
  has = (char)self->_has;
  if ((has & 4) != 0)
    goto LABEL_7;
LABEL_3:
  if ((has & 1) != 0)
  {
LABEL_4:
    *(double *)(v5 + 8) = self->_creationDate;
    *(_BYTE *)(v5 + 60) |= 1u;
  }
LABEL_5:
  v13 = -[NSData copyWithZone:](self->_subObjectUUID, "copyWithZone:", a3);
  v14 = *(void **)(v5 + 40);
  *(_QWORD *)(v5 + 40) = v13;

  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  NSData *associationUUID;
  NSData *objectUUIDs;
  HDCodableSyncIdentity *syncIdentity;
  NSData *subObjectUUID;
  char v9;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_28;
  associationUUID = self->_associationUUID;
  if ((unint64_t)associationUUID | *((_QWORD *)v4 + 3))
  {
    if (!-[NSData isEqual:](associationUUID, "isEqual:"))
      goto LABEL_28;
  }
  objectUUIDs = self->_objectUUIDs;
  if ((unint64_t)objectUUIDs | *((_QWORD *)v4 + 4))
  {
    if (!-[NSData isEqual:](objectUUIDs, "isEqual:"))
      goto LABEL_28;
  }
  syncIdentity = self->_syncIdentity;
  if ((unint64_t)syncIdentity | *((_QWORD *)v4 + 6))
  {
    if (!-[HDCodableSyncIdentity isEqual:](syncIdentity, "isEqual:"))
      goto LABEL_28;
  }
  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
    if ((*((_BYTE *)v4 + 60) & 2) == 0 || self->_type != *((_QWORD *)v4 + 2))
      goto LABEL_28;
  }
  else if ((*((_BYTE *)v4 + 60) & 2) != 0)
  {
    goto LABEL_28;
  }
  if ((*(_BYTE *)&self->_has & 4) != 0)
  {
    if ((*((_BYTE *)v4 + 60) & 4) != 0)
    {
      if (self->_deleted)
      {
        if (!*((_BYTE *)v4 + 56))
          goto LABEL_28;
        goto LABEL_21;
      }
      if (!*((_BYTE *)v4 + 56))
        goto LABEL_21;
    }
LABEL_28:
    v9 = 0;
    goto LABEL_29;
  }
  if ((*((_BYTE *)v4 + 60) & 4) != 0)
    goto LABEL_28;
LABEL_21:
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    if ((*((_BYTE *)v4 + 60) & 1) == 0 || self->_creationDate != *((double *)v4 + 1))
      goto LABEL_28;
  }
  else if ((*((_BYTE *)v4 + 60) & 1) != 0)
  {
    goto LABEL_28;
  }
  subObjectUUID = self->_subObjectUUID;
  if ((unint64_t)subObjectUUID | *((_QWORD *)v4 + 5))
    v9 = -[NSData isEqual:](subObjectUUID, "isEqual:");
  else
    v9 = 1;
LABEL_29:

  return v9;
}

- (unint64_t)hash
{
  uint64_t v3;
  uint64_t v4;
  unint64_t v5;
  uint64_t v6;
  uint64_t v7;
  double creationDate;
  double v9;
  long double v10;
  double v11;
  unint64_t v12;

  v3 = -[NSData hash](self->_associationUUID, "hash");
  v4 = -[NSData hash](self->_objectUUIDs, "hash");
  v5 = -[HDCodableSyncIdentity hash](self->_syncIdentity, "hash");
  if ((*(_BYTE *)&self->_has & 2) == 0)
  {
    v6 = 0;
    if ((*(_BYTE *)&self->_has & 4) != 0)
      goto LABEL_3;
LABEL_9:
    v7 = 0;
    if ((*(_BYTE *)&self->_has & 1) != 0)
      goto LABEL_4;
LABEL_10:
    v12 = 0;
    return v4 ^ v3 ^ v5 ^ v6 ^ v7 ^ v12 ^ -[NSData hash](self->_subObjectUUID, "hash");
  }
  v6 = 2654435761 * self->_type;
  if ((*(_BYTE *)&self->_has & 4) == 0)
    goto LABEL_9;
LABEL_3:
  v7 = 2654435761 * self->_deleted;
  if ((*(_BYTE *)&self->_has & 1) == 0)
    goto LABEL_10;
LABEL_4:
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
  return v4 ^ v3 ^ v5 ^ v6 ^ v7 ^ v12 ^ -[NSData hash](self->_subObjectUUID, "hash");
}

- (void)mergeFrom:(id)a3
{
  id v4;
  HDCodableSyncIdentity *syncIdentity;
  uint64_t v6;
  char v7;
  id v8;

  v4 = a3;
  v8 = v4;
  if (*((_QWORD *)v4 + 3))
  {
    -[HDCodableTypedObjectAssociation setAssociationUUID:](self, "setAssociationUUID:");
    v4 = v8;
  }
  if (*((_QWORD *)v4 + 4))
  {
    -[HDCodableTypedObjectAssociation setObjectUUIDs:](self, "setObjectUUIDs:");
    v4 = v8;
  }
  syncIdentity = self->_syncIdentity;
  v6 = *((_QWORD *)v4 + 6);
  if (syncIdentity)
  {
    if (!v6)
      goto LABEL_11;
    -[HDCodableSyncIdentity mergeFrom:](syncIdentity, "mergeFrom:");
  }
  else
  {
    if (!v6)
      goto LABEL_11;
    -[HDCodableTypedObjectAssociation setSyncIdentity:](self, "setSyncIdentity:");
  }
  v4 = v8;
LABEL_11:
  v7 = *((_BYTE *)v4 + 60);
  if ((v7 & 2) != 0)
  {
    self->_type = *((_QWORD *)v4 + 2);
    *(_BYTE *)&self->_has |= 2u;
    v7 = *((_BYTE *)v4 + 60);
    if ((v7 & 4) == 0)
    {
LABEL_13:
      if ((v7 & 1) == 0)
        goto LABEL_15;
      goto LABEL_14;
    }
  }
  else if ((*((_BYTE *)v4 + 60) & 4) == 0)
  {
    goto LABEL_13;
  }
  self->_deleted = *((_BYTE *)v4 + 56);
  *(_BYTE *)&self->_has |= 4u;
  if ((*((_BYTE *)v4 + 60) & 1) != 0)
  {
LABEL_14:
    self->_creationDate = *((double *)v4 + 1);
    *(_BYTE *)&self->_has |= 1u;
  }
LABEL_15:
  if (*((_QWORD *)v4 + 5))
  {
    -[HDCodableTypedObjectAssociation setSubObjectUUID:](self, "setSubObjectUUID:");
    v4 = v8;
  }

}

- (NSData)associationUUID
{
  return self->_associationUUID;
}

- (void)setAssociationUUID:(id)a3
{
  objc_storeStrong((id *)&self->_associationUUID, a3);
}

- (NSData)objectUUIDs
{
  return self->_objectUUIDs;
}

- (void)setObjectUUIDs:(id)a3
{
  objc_storeStrong((id *)&self->_objectUUIDs, a3);
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

- (BOOL)deleted
{
  return self->_deleted;
}

- (double)creationDate
{
  return self->_creationDate;
}

- (NSData)subObjectUUID
{
  return self->_subObjectUUID;
}

- (void)setSubObjectUUID:(id)a3
{
  objc_storeStrong((id *)&self->_subObjectUUID, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_syncIdentity, 0);
  objc_storeStrong((id *)&self->_subObjectUUID, 0);
  objc_storeStrong((id *)&self->_objectUUIDs, 0);
  objc_storeStrong((id *)&self->_associationUUID, 0);
}

- (HDCodableTypedObjectAssociation)initWithIntermediateSyncAssociation:(id)a3
{
  id v4;
  HDCodableTypedObjectAssociation *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  objc_super v13;

  v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)HDCodableTypedObjectAssociation;
  v5 = -[HDCodableTypedObjectAssociation init](&v13, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "associationUUID");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "hk_dataForUUIDBytes");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[HDCodableTypedObjectAssociation setAssociationUUID:](v5, "setAssociationUUID:", v7);

    -[HDCodableTypedObjectAssociation setType:](v5, "setType:", objc_msgSend(v4, "type"));
    -[HDCodableTypedObjectAssociation setDeleted:](v5, "setDeleted:", objc_msgSend(v4, "deleted"));
    objc_msgSend(v4, "creationDate");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "timeIntervalSinceReferenceDate");
    -[HDCodableTypedObjectAssociation setCreationDate:](v5, "setCreationDate:");

    objc_msgSend(v4, "destinationSubObjectUUID");
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    if (v9)
    {
      objc_msgSend(v4, "destinationSubObjectUUID");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "hk_dataForUUIDBytes");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      -[HDCodableTypedObjectAssociation setSubObjectUUID:](v5, "setSubObjectUUID:", v11);

    }
  }

  return v5;
}

- (id)decodedAssociationUUID
{
  return (id)objc_msgSend(MEMORY[0x1E0CB3A28], "hk_UUIDWithData:", self->_associationUUID);
}

- (id)decodedCreationDate
{
  if ((*(_BYTE *)&self->_has & 1) == 0)
    return 0;
  HDDecodeDateForValue();
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)decodedSubObjectUUID
{
  return (id)objc_msgSend(MEMORY[0x1E0CB3A28], "hk_UUIDWithData:", self->_subObjectUUID);
}

@end
