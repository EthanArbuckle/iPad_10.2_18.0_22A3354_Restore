@implementation ASCodableDatabaseCompetitionListEntry

- (BOOL)hasFriendUUID
{
  return self->_friendUUID != 0;
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

- (BOOL)hasSystemFieldsOnlyRecord
{
  return self->_systemFieldsOnlyRecord != 0;
}

- (void)setOwner:(int64_t)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_owner = a3;
}

- (void)setHasOwner:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (BOOL)hasOwner
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

  v3 = (void *)MEMORY[0x24BDD17C8];
  v8.receiver = self;
  v8.super_class = (Class)ASCodableDatabaseCompetitionListEntry;
  -[ASCodableDatabaseCompetitionListEntry description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[ASCodableDatabaseCompetitionListEntry dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  void *v3;
  void *v4;
  NSData *friendUUID;
  void *v6;
  NSData *systemFieldsOnlyRecord;
  void *v8;

  objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  friendUUID = self->_friendUUID;
  if (friendUUID)
    objc_msgSend(v3, "setObject:forKey:", friendUUID, CFSTR("friendUUID"));
  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithLongLong:", self->_type);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v6, CFSTR("type"));

  }
  systemFieldsOnlyRecord = self->_systemFieldsOnlyRecord;
  if (systemFieldsOnlyRecord)
    objc_msgSend(v4, "setObject:forKey:", systemFieldsOnlyRecord, CFSTR("systemFieldsOnlyRecord"));
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithLongLong:", self->_owner);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v8, CFSTR("owner"));

  }
  return v4;
}

- (BOOL)readFrom:(id)a3
{
  return ASCodableDatabaseCompetitionListEntryReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  v5 = v4;
  if (self->_friendUUID)
  {
    PBDataWriterWriteDataField();
    v4 = v5;
  }
  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
    PBDataWriterWriteInt64Field();
    v4 = v5;
  }
  if (self->_systemFieldsOnlyRecord)
  {
    PBDataWriterWriteDataField();
    v4 = v5;
  }
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    PBDataWriterWriteInt64Field();
    v4 = v5;
  }

}

- (void)copyTo:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  v5 = v4;
  if (self->_friendUUID)
  {
    objc_msgSend(v4, "setFriendUUID:");
    v4 = v5;
  }
  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
    *((_QWORD *)v4 + 2) = self->_type;
    *((_BYTE *)v4 + 40) |= 2u;
  }
  if (self->_systemFieldsOnlyRecord)
  {
    objc_msgSend(v5, "setSystemFieldsOnlyRecord:");
    v4 = v5;
  }
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    *((_QWORD *)v4 + 1) = self->_owner;
    *((_BYTE *)v4 + 40) |= 1u;
  }

}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;

  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = -[NSData copyWithZone:](self->_friendUUID, "copyWithZone:", a3);
  v7 = *(void **)(v5 + 24);
  *(_QWORD *)(v5 + 24) = v6;

  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
    *(_QWORD *)(v5 + 16) = self->_type;
    *(_BYTE *)(v5 + 40) |= 2u;
  }
  v8 = -[NSData copyWithZone:](self->_systemFieldsOnlyRecord, "copyWithZone:", a3);
  v9 = *(void **)(v5 + 32);
  *(_QWORD *)(v5 + 32) = v8;

  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    *(_QWORD *)(v5 + 8) = self->_owner;
    *(_BYTE *)(v5 + 40) |= 1u;
  }
  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  NSData *friendUUID;
  char has;
  NSData *systemFieldsOnlyRecord;
  BOOL v8;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_16;
  friendUUID = self->_friendUUID;
  if ((unint64_t)friendUUID | *((_QWORD *)v4 + 3))
  {
    if (!-[NSData isEqual:](friendUUID, "isEqual:"))
      goto LABEL_16;
  }
  has = (char)self->_has;
  if ((has & 2) != 0)
  {
    if ((*((_BYTE *)v4 + 40) & 2) == 0 || self->_type != *((_QWORD *)v4 + 2))
      goto LABEL_16;
  }
  else if ((*((_BYTE *)v4 + 40) & 2) != 0)
  {
    goto LABEL_16;
  }
  systemFieldsOnlyRecord = self->_systemFieldsOnlyRecord;
  if ((unint64_t)systemFieldsOnlyRecord | *((_QWORD *)v4 + 4))
  {
    if (!-[NSData isEqual:](systemFieldsOnlyRecord, "isEqual:"))
    {
LABEL_16:
      v8 = 0;
      goto LABEL_17;
    }
    has = (char)self->_has;
  }
  v8 = (*((_BYTE *)v4 + 40) & 1) == 0;
  if ((has & 1) != 0)
  {
    if ((*((_BYTE *)v4 + 40) & 1) == 0 || self->_owner != *((_QWORD *)v4 + 1))
      goto LABEL_16;
    v8 = 1;
  }
LABEL_17:

  return v8;
}

- (unint64_t)hash
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  v3 = -[NSData hash](self->_friendUUID, "hash");
  if ((*(_BYTE *)&self->_has & 2) != 0)
    v4 = 2654435761 * self->_type;
  else
    v4 = 0;
  v5 = -[NSData hash](self->_systemFieldsOnlyRecord, "hash");
  if ((*(_BYTE *)&self->_has & 1) != 0)
    v6 = 2654435761 * self->_owner;
  else
    v6 = 0;
  return v4 ^ v3 ^ v5 ^ v6;
}

- (void)mergeFrom:(id)a3
{
  int64_t *v4;
  int64_t *v5;

  v4 = (int64_t *)a3;
  v5 = v4;
  if (v4[3])
  {
    -[ASCodableDatabaseCompetitionListEntry setFriendUUID:](self, "setFriendUUID:");
    v4 = v5;
  }
  if ((v4[5] & 2) != 0)
  {
    self->_type = v4[2];
    *(_BYTE *)&self->_has |= 2u;
  }
  if (v4[4])
  {
    -[ASCodableDatabaseCompetitionListEntry setSystemFieldsOnlyRecord:](self, "setSystemFieldsOnlyRecord:");
    v4 = v5;
  }
  if ((v4[5] & 1) != 0)
  {
    self->_owner = v4[1];
    *(_BYTE *)&self->_has |= 1u;
  }

}

- (NSData)friendUUID
{
  return self->_friendUUID;
}

- (void)setFriendUUID:(id)a3
{
  objc_storeStrong((id *)&self->_friendUUID, a3);
}

- (int64_t)type
{
  return self->_type;
}

- (NSData)systemFieldsOnlyRecord
{
  return self->_systemFieldsOnlyRecord;
}

- (void)setSystemFieldsOnlyRecord:(id)a3
{
  objc_storeStrong((id *)&self->_systemFieldsOnlyRecord, a3);
}

- (int64_t)owner
{
  return self->_owner;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_systemFieldsOnlyRecord, 0);
  objc_storeStrong((id *)&self->_friendUUID, 0);
}

@end
