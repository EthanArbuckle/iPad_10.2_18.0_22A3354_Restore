@implementation HDCodableObjectTypeSourceOrder

- (int64_t)decodedDataTypeCode
{
  return self->_objectType;
}

- (void)dealloc
{
  objc_super v3;

  PBRepeatedDoubleClear();
  v3.receiver = self;
  v3.super_class = (Class)HDCodableObjectTypeSourceOrder;
  -[HDCodableObjectTypeSourceOrder dealloc](&v3, sel_dealloc);
}

- (void)setObjectType:(int64_t)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_objectType = a3;
}

- (void)setHasObjectType:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (BOOL)hasObjectType
{
  return *(_BYTE *)&self->_has & 1;
}

- (void)setUserOrdered:(BOOL)a3
{
  *(_BYTE *)&self->_has |= 2u;
  self->_userOrdered = a3;
}

- (void)setHasUserOrdered:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFD | v3;
}

- (BOOL)hasUserOrdered
{
  return (*(_BYTE *)&self->_has >> 1) & 1;
}

- (BOOL)hasSourceUUIDs
{
  return self->_sourceUUIDs != 0;
}

- (unint64_t)modificationDatesCount
{
  return self->_modificationDates.count;
}

- (double)modificationDates
{
  return self->_modificationDates.list;
}

- (void)clearModificationDates
{
  PBRepeatedDoubleClear();
}

- (void)addModificationDates:(double)a3
{
  PBRepeatedDoubleAdd();
}

- (double)modificationDatesAtIndex:(unint64_t)a3
{
  $A57E80F8F7F5C5FFA4899556F12E1D96 *p_modificationDates;
  unint64_t count;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;

  p_modificationDates = &self->_modificationDates;
  count = self->_modificationDates.count;
  if (count <= a3)
  {
    v6 = (void *)MEMORY[0x1E0C99DA0];
    v7 = *MEMORY[0x1E0C99858];
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("idx (%lu) is out of range (%lu)"), a3, count);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "exceptionWithName:reason:userInfo:", v7, v8, 0);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "raise");

  }
  return p_modificationDates->list[a3];
}

- (void)setModificationDates:(double *)a3 count:(unint64_t)a4
{
  PBRepeatedDoubleSet();
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
  v8.super_class = (Class)HDCodableObjectTypeSourceOrder;
  -[HDCodableObjectTypeSourceOrder description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[HDCodableObjectTypeSourceOrder dictionaryRepresentation](self, "dictionaryRepresentation");
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
  void *v6;
  NSData *sourceUUIDs;
  void *v8;
  HDCodableSyncIdentity *syncIdentity;
  void *v10;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  has = (char)self->_has;
  if ((has & 1) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", self->_objectType);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v5, CFSTR("objectType"));

    has = (char)self->_has;
  }
  if ((has & 2) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_userOrdered);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v6, CFSTR("userOrdered"));

  }
  sourceUUIDs = self->_sourceUUIDs;
  if (sourceUUIDs)
    objc_msgSend(v3, "setObject:forKey:", sourceUUIDs, CFSTR("sourceUUIDs"));
  PBRepeatedDoubleNSArray();
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v8, CFSTR("modificationDates"));

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
  return HDCodableObjectTypeSourceOrderReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4;
  char has;
  unint64_t v6;
  id v7;

  v4 = a3;
  has = (char)self->_has;
  v7 = v4;
  if ((has & 1) != 0)
  {
    PBDataWriterWriteInt64Field();
    v4 = v7;
    has = (char)self->_has;
  }
  if ((has & 2) != 0)
  {
    PBDataWriterWriteBOOLField();
    v4 = v7;
  }
  if (self->_sourceUUIDs)
  {
    PBDataWriterWriteDataField();
    v4 = v7;
  }
  if (self->_modificationDates.count)
  {
    v6 = 0;
    do
    {
      PBDataWriterWriteDoubleField();
      v4 = v7;
      ++v6;
    }
    while (v6 < self->_modificationDates.count);
  }
  if (self->_syncIdentity)
  {
    PBDataWriterWriteSubmessage();
    v4 = v7;
  }

}

- (void)copyTo:(id)a3
{
  _QWORD *v4;
  char has;
  unint64_t v6;
  unint64_t v7;
  uint64_t i;
  id v9;

  v4 = a3;
  has = (char)self->_has;
  if ((has & 1) != 0)
  {
    v4[4] = self->_objectType;
    *((_BYTE *)v4 + 60) |= 1u;
    has = (char)self->_has;
  }
  if ((has & 2) != 0)
  {
    *((_BYTE *)v4 + 56) = self->_userOrdered;
    *((_BYTE *)v4 + 60) |= 2u;
  }
  v9 = v4;
  if (self->_sourceUUIDs)
    objc_msgSend(v4, "setSourceUUIDs:");
  if (-[HDCodableObjectTypeSourceOrder modificationDatesCount](self, "modificationDatesCount"))
  {
    objc_msgSend(v9, "clearModificationDates");
    v6 = -[HDCodableObjectTypeSourceOrder modificationDatesCount](self, "modificationDatesCount");
    if (v6)
    {
      v7 = v6;
      for (i = 0; i != v7; ++i)
      {
        -[HDCodableObjectTypeSourceOrder modificationDatesAtIndex:](self, "modificationDatesAtIndex:", i);
        objc_msgSend(v9, "addModificationDates:");
      }
    }
  }
  if (self->_syncIdentity)
    objc_msgSend(v9, "setSyncIdentity:");

}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5;
  _QWORD *v6;
  char has;
  uint64_t v8;
  void *v9;
  id v10;
  void *v11;

  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = (_QWORD *)v5;
  has = (char)self->_has;
  if ((has & 1) != 0)
  {
    *(_QWORD *)(v5 + 32) = self->_objectType;
    *(_BYTE *)(v5 + 60) |= 1u;
    has = (char)self->_has;
  }
  if ((has & 2) != 0)
  {
    *(_BYTE *)(v5 + 56) = self->_userOrdered;
    *(_BYTE *)(v5 + 60) |= 2u;
  }
  v8 = -[NSData copyWithZone:](self->_sourceUUIDs, "copyWithZone:", a3);
  v9 = (void *)v6[5];
  v6[5] = v8;

  PBRepeatedDoubleCopy();
  v10 = -[HDCodableSyncIdentity copyWithZone:](self->_syncIdentity, "copyWithZone:", a3);
  v11 = (void *)v6[6];
  v6[6] = v10;

  return v6;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  NSData *sourceUUIDs;
  HDCodableSyncIdentity *syncIdentity;
  char v7;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_20;
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    if ((*((_BYTE *)v4 + 60) & 1) == 0 || self->_objectType != *((_QWORD *)v4 + 4))
      goto LABEL_20;
  }
  else if ((*((_BYTE *)v4 + 60) & 1) != 0)
  {
    goto LABEL_20;
  }
  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
    if ((*((_BYTE *)v4 + 60) & 2) != 0)
    {
      if (self->_userOrdered)
      {
        if (!*((_BYTE *)v4 + 56))
          goto LABEL_20;
        goto LABEL_15;
      }
      if (!*((_BYTE *)v4 + 56))
        goto LABEL_15;
    }
LABEL_20:
    v7 = 0;
    goto LABEL_21;
  }
  if ((*((_BYTE *)v4 + 60) & 2) != 0)
    goto LABEL_20;
LABEL_15:
  sourceUUIDs = self->_sourceUUIDs;
  if ((unint64_t)sourceUUIDs | *((_QWORD *)v4 + 5) && !-[NSData isEqual:](sourceUUIDs, "isEqual:")
    || !PBRepeatedDoubleIsEqual())
  {
    goto LABEL_20;
  }
  syncIdentity = self->_syncIdentity;
  if ((unint64_t)syncIdentity | *((_QWORD *)v4 + 6))
    v7 = -[HDCodableSyncIdentity isEqual:](syncIdentity, "isEqual:");
  else
    v7 = 1;
LABEL_21:

  return v7;
}

- (unint64_t)hash
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    v3 = 2654435761 * self->_objectType;
    if ((*(_BYTE *)&self->_has & 2) != 0)
      goto LABEL_3;
LABEL_5:
    v4 = 0;
    goto LABEL_6;
  }
  v3 = 0;
  if ((*(_BYTE *)&self->_has & 2) == 0)
    goto LABEL_5;
LABEL_3:
  v4 = 2654435761 * self->_userOrdered;
LABEL_6:
  v5 = v4 ^ v3;
  v6 = -[NSData hash](self->_sourceUUIDs, "hash");
  v7 = v5 ^ PBRepeatedDoubleHash() ^ v6;
  return v7 ^ -[HDCodableSyncIdentity hash](self->_syncIdentity, "hash");
}

- (void)mergeFrom:(id)a3
{
  id v4;
  void *v5;
  char v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  HDCodableSyncIdentity *syncIdentity;
  void *v11;
  uint64_t v12;
  _QWORD *v13;

  v4 = a3;
  v5 = v4;
  v6 = *((_BYTE *)v4 + 60);
  if ((v6 & 1) != 0)
  {
    self->_objectType = *((_QWORD *)v4 + 4);
    *(_BYTE *)&self->_has |= 1u;
    v6 = *((_BYTE *)v4 + 60);
  }
  if ((v6 & 2) != 0)
  {
    self->_userOrdered = *((_BYTE *)v4 + 56);
    *(_BYTE *)&self->_has |= 2u;
  }
  v13 = v4;
  if (*((_QWORD *)v4 + 5))
  {
    -[HDCodableObjectTypeSourceOrder setSourceUUIDs:](self, "setSourceUUIDs:");
    v5 = v13;
  }
  v7 = objc_msgSend(v5, "modificationDatesCount");
  if (v7)
  {
    v8 = v7;
    for (i = 0; i != v8; ++i)
    {
      objc_msgSend(v13, "modificationDatesAtIndex:", i);
      -[HDCodableObjectTypeSourceOrder addModificationDates:](self, "addModificationDates:");
    }
  }
  syncIdentity = self->_syncIdentity;
  v11 = v13;
  v12 = v13[6];
  if (syncIdentity)
  {
    if (v12)
    {
      -[HDCodableSyncIdentity mergeFrom:](syncIdentity, "mergeFrom:");
LABEL_15:
      v11 = v13;
    }
  }
  else if (v12)
  {
    -[HDCodableObjectTypeSourceOrder setSyncIdentity:](self, "setSyncIdentity:");
    goto LABEL_15;
  }

}

- (int64_t)objectType
{
  return self->_objectType;
}

- (BOOL)userOrdered
{
  return self->_userOrdered;
}

- (NSData)sourceUUIDs
{
  return self->_sourceUUIDs;
}

- (void)setSourceUUIDs:(id)a3
{
  objc_storeStrong((id *)&self->_sourceUUIDs, a3);
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
  objc_storeStrong((id *)&self->_sourceUUIDs, 0);
}

@end
