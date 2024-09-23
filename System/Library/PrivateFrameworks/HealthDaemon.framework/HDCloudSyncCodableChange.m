@implementation HDCloudSyncCodableChange

- (BOOL)hasAnchorRangeMap
{
  return self->_anchorRangeMap != 0;
}

- (void)setProtocolVersion:(int64_t)a3
{
  *(_BYTE *)&self->_has |= 4u;
  self->_protocolVersion = a3;
}

- (void)setHasProtocolVersion:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 4;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFB | v3;
}

- (BOOL)hasProtocolVersion
{
  return (*(_BYTE *)&self->_has >> 2) & 1;
}

- (void)setChangeSize:(int64_t)a3
{
  *(_BYTE *)&self->_has |= 2u;
  self->_changeSize = a3;
}

- (void)setHasChangeSize:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFD | v3;
}

- (BOOL)hasChangeSize
{
  return (*(_BYTE *)&self->_has >> 1) & 1;
}

- (void)setChangeIndex:(int64_t)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_changeIndex = a3;
}

- (void)setHasChangeIndex:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (BOOL)hasChangeIndex
{
  return *(_BYTE *)&self->_has & 1;
}

- (void)setFinalForSequence:(BOOL)a3
{
  *(_BYTE *)&self->_has |= 8u;
  self->_finalForSequence = a3;
}

- (void)setHasFinalForSequence:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 8;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xF7 | v3;
}

- (BOOL)hasFinalForSequence
{
  return (*(_BYTE *)&self->_has >> 3) & 1;
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
  v8.super_class = (Class)HDCloudSyncCodableChange;
  -[HDCloudSyncCodableChange description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[HDCloudSyncCodableChange dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  void *v3;
  HDCodableSyncAnchorRangeMap *anchorRangeMap;
  void *v5;
  char has;
  void *v7;
  void *v9;
  void *v10;
  void *v11;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  anchorRangeMap = self->_anchorRangeMap;
  if (anchorRangeMap)
  {
    -[HDCodableSyncAnchorRangeMap dictionaryRepresentation](anchorRangeMap, "dictionaryRepresentation");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v5, CFSTR("anchorRangeMap"));

  }
  has = (char)self->_has;
  if ((has & 4) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", self->_protocolVersion);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v9, CFSTR("protocolVersion"));

    has = (char)self->_has;
    if ((has & 2) == 0)
    {
LABEL_5:
      if ((has & 1) == 0)
        goto LABEL_6;
LABEL_11:
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", self->_changeIndex);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKey:", v11, CFSTR("changeIndex"));

      if ((*(_BYTE *)&self->_has & 8) == 0)
        return v3;
      goto LABEL_7;
    }
  }
  else if ((*(_BYTE *)&self->_has & 2) == 0)
  {
    goto LABEL_5;
  }
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", self->_changeSize);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v10, CFSTR("changeSize"));

  has = (char)self->_has;
  if ((has & 1) != 0)
    goto LABEL_11;
LABEL_6:
  if ((has & 8) != 0)
  {
LABEL_7:
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_finalForSequence);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v7, CFSTR("finalForSequence"));

  }
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return HDCloudSyncCodableChangeReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4;
  char has;
  id v6;

  v4 = a3;
  v6 = v4;
  if (self->_anchorRangeMap)
  {
    PBDataWriterWriteSubmessage();
    v4 = v6;
  }
  has = (char)self->_has;
  if ((has & 4) != 0)
  {
    PBDataWriterWriteInt64Field();
    v4 = v6;
    has = (char)self->_has;
    if ((has & 2) == 0)
    {
LABEL_5:
      if ((has & 1) == 0)
        goto LABEL_6;
LABEL_11:
      PBDataWriterWriteInt64Field();
      v4 = v6;
      if ((*(_BYTE *)&self->_has & 8) == 0)
        goto LABEL_8;
      goto LABEL_7;
    }
  }
  else if ((*(_BYTE *)&self->_has & 2) == 0)
  {
    goto LABEL_5;
  }
  PBDataWriterWriteInt64Field();
  v4 = v6;
  has = (char)self->_has;
  if ((has & 1) != 0)
    goto LABEL_11;
LABEL_6:
  if ((has & 8) != 0)
  {
LABEL_7:
    PBDataWriterWriteBOOLField();
    v4 = v6;
  }
LABEL_8:

}

- (void)copyTo:(id)a3
{
  id v4;
  char has;
  id v6;

  v4 = a3;
  if (self->_anchorRangeMap)
  {
    v6 = v4;
    objc_msgSend(v4, "setAnchorRangeMap:");
    v4 = v6;
  }
  has = (char)self->_has;
  if ((has & 4) != 0)
  {
    *((_QWORD *)v4 + 3) = self->_protocolVersion;
    *((_BYTE *)v4 + 44) |= 4u;
    has = (char)self->_has;
    if ((has & 2) == 0)
    {
LABEL_5:
      if ((has & 1) == 0)
        goto LABEL_6;
LABEL_11:
      *((_QWORD *)v4 + 1) = self->_changeIndex;
      *((_BYTE *)v4 + 44) |= 1u;
      if ((*(_BYTE *)&self->_has & 8) == 0)
        goto LABEL_8;
      goto LABEL_7;
    }
  }
  else if ((*(_BYTE *)&self->_has & 2) == 0)
  {
    goto LABEL_5;
  }
  *((_QWORD *)v4 + 2) = self->_changeSize;
  *((_BYTE *)v4 + 44) |= 2u;
  has = (char)self->_has;
  if ((has & 1) != 0)
    goto LABEL_11;
LABEL_6:
  if ((has & 8) != 0)
  {
LABEL_7:
    *((_BYTE *)v4 + 40) = self->_finalForSequence;
    *((_BYTE *)v4 + 44) |= 8u;
  }
LABEL_8:

}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5;
  id v6;
  void *v7;
  char has;

  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = -[HDCodableSyncAnchorRangeMap copyWithZone:](self->_anchorRangeMap, "copyWithZone:", a3);
  v7 = *(void **)(v5 + 32);
  *(_QWORD *)(v5 + 32) = v6;

  has = (char)self->_has;
  if ((has & 4) != 0)
  {
    *(_QWORD *)(v5 + 24) = self->_protocolVersion;
    *(_BYTE *)(v5 + 44) |= 4u;
    has = (char)self->_has;
    if ((has & 2) == 0)
    {
LABEL_3:
      if ((has & 1) == 0)
        goto LABEL_4;
LABEL_9:
      *(_QWORD *)(v5 + 8) = self->_changeIndex;
      *(_BYTE *)(v5 + 44) |= 1u;
      if ((*(_BYTE *)&self->_has & 8) == 0)
        return (id)v5;
      goto LABEL_5;
    }
  }
  else if ((*(_BYTE *)&self->_has & 2) == 0)
  {
    goto LABEL_3;
  }
  *(_QWORD *)(v5 + 16) = self->_changeSize;
  *(_BYTE *)(v5 + 44) |= 2u;
  has = (char)self->_has;
  if ((has & 1) != 0)
    goto LABEL_9;
LABEL_4:
  if ((has & 8) != 0)
  {
LABEL_5:
    *(_BYTE *)(v5 + 40) = self->_finalForSequence;
    *(_BYTE *)(v5 + 44) |= 8u;
  }
  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  HDCodableSyncAnchorRangeMap *anchorRangeMap;
  BOOL v6;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_21;
  anchorRangeMap = self->_anchorRangeMap;
  if ((unint64_t)anchorRangeMap | *((_QWORD *)v4 + 4))
  {
    if (!-[HDCodableSyncAnchorRangeMap isEqual:](anchorRangeMap, "isEqual:"))
      goto LABEL_21;
  }
  if ((*(_BYTE *)&self->_has & 4) != 0)
  {
    if ((*((_BYTE *)v4 + 44) & 4) == 0 || self->_protocolVersion != *((_QWORD *)v4 + 3))
      goto LABEL_21;
  }
  else if ((*((_BYTE *)v4 + 44) & 4) != 0)
  {
    goto LABEL_21;
  }
  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
    if ((*((_BYTE *)v4 + 44) & 2) == 0 || self->_changeSize != *((_QWORD *)v4 + 2))
      goto LABEL_21;
  }
  else if ((*((_BYTE *)v4 + 44) & 2) != 0)
  {
    goto LABEL_21;
  }
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    if ((*((_BYTE *)v4 + 44) & 1) == 0 || self->_changeIndex != *((_QWORD *)v4 + 1))
      goto LABEL_21;
  }
  else if ((*((_BYTE *)v4 + 44) & 1) != 0)
  {
    goto LABEL_21;
  }
  v6 = (*((_BYTE *)v4 + 44) & 8) == 0;
  if ((*(_BYTE *)&self->_has & 8) != 0)
  {
    if ((*((_BYTE *)v4 + 44) & 8) == 0)
    {
LABEL_21:
      v6 = 0;
      goto LABEL_22;
    }
    if (self->_finalForSequence)
    {
      if (!*((_BYTE *)v4 + 40))
        goto LABEL_21;
    }
    else if (*((_BYTE *)v4 + 40))
    {
      goto LABEL_21;
    }
    v6 = 1;
  }
LABEL_22:

  return v6;
}

- (unint64_t)hash
{
  unint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  v3 = -[HDCodableSyncAnchorRangeMap hash](self->_anchorRangeMap, "hash");
  if ((*(_BYTE *)&self->_has & 4) != 0)
  {
    v4 = 2654435761 * self->_protocolVersion;
    if ((*(_BYTE *)&self->_has & 2) != 0)
    {
LABEL_3:
      v5 = 2654435761 * self->_changeSize;
      if ((*(_BYTE *)&self->_has & 1) != 0)
        goto LABEL_4;
LABEL_8:
      v6 = 0;
      if ((*(_BYTE *)&self->_has & 8) != 0)
        goto LABEL_5;
LABEL_9:
      v7 = 0;
      return v4 ^ v3 ^ v5 ^ v6 ^ v7;
    }
  }
  else
  {
    v4 = 0;
    if ((*(_BYTE *)&self->_has & 2) != 0)
      goto LABEL_3;
  }
  v5 = 0;
  if ((*(_BYTE *)&self->_has & 1) == 0)
    goto LABEL_8;
LABEL_4:
  v6 = 2654435761 * self->_changeIndex;
  if ((*(_BYTE *)&self->_has & 8) == 0)
    goto LABEL_9;
LABEL_5:
  v7 = 2654435761 * self->_finalForSequence;
  return v4 ^ v3 ^ v5 ^ v6 ^ v7;
}

- (void)mergeFrom:(id)a3
{
  id v4;
  HDCodableSyncAnchorRangeMap *anchorRangeMap;
  uint64_t v6;
  char v7;
  id v8;

  v4 = a3;
  anchorRangeMap = self->_anchorRangeMap;
  v6 = *((_QWORD *)v4 + 4);
  if (anchorRangeMap)
  {
    if (!v6)
      goto LABEL_7;
    v8 = v4;
    -[HDCodableSyncAnchorRangeMap mergeFrom:](anchorRangeMap, "mergeFrom:");
  }
  else
  {
    if (!v6)
      goto LABEL_7;
    v8 = v4;
    -[HDCloudSyncCodableChange setAnchorRangeMap:](self, "setAnchorRangeMap:");
  }
  v4 = v8;
LABEL_7:
  v7 = *((_BYTE *)v4 + 44);
  if ((v7 & 4) != 0)
  {
    self->_protocolVersion = *((_QWORD *)v4 + 3);
    *(_BYTE *)&self->_has |= 4u;
    v7 = *((_BYTE *)v4 + 44);
    if ((v7 & 2) == 0)
    {
LABEL_9:
      if ((v7 & 1) == 0)
        goto LABEL_10;
LABEL_15:
      self->_changeIndex = *((_QWORD *)v4 + 1);
      *(_BYTE *)&self->_has |= 1u;
      if ((*((_BYTE *)v4 + 44) & 8) == 0)
        goto LABEL_12;
      goto LABEL_11;
    }
  }
  else if ((*((_BYTE *)v4 + 44) & 2) == 0)
  {
    goto LABEL_9;
  }
  self->_changeSize = *((_QWORD *)v4 + 2);
  *(_BYTE *)&self->_has |= 2u;
  v7 = *((_BYTE *)v4 + 44);
  if ((v7 & 1) != 0)
    goto LABEL_15;
LABEL_10:
  if ((v7 & 8) != 0)
  {
LABEL_11:
    self->_finalForSequence = *((_BYTE *)v4 + 40);
    *(_BYTE *)&self->_has |= 8u;
  }
LABEL_12:

}

- (HDCodableSyncAnchorRangeMap)anchorRangeMap
{
  return self->_anchorRangeMap;
}

- (void)setAnchorRangeMap:(id)a3
{
  objc_storeStrong((id *)&self->_anchorRangeMap, a3);
}

- (int64_t)protocolVersion
{
  return self->_protocolVersion;
}

- (int64_t)changeSize
{
  return self->_changeSize;
}

- (int64_t)changeIndex
{
  return self->_changeIndex;
}

- (BOOL)finalForSequence
{
  return self->_finalForSequence;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_anchorRangeMap, 0);
}

@end
