@implementation NTPBEnvelopeBatch

- (void)clearEnvelopes
{
  -[NSMutableArray removeAllObjects](self->_envelopes, "removeAllObjects");
}

- (void)addEnvelope:(id)a3
{
  id v4;
  NSMutableArray *envelopes;
  NSMutableArray *v6;
  NSMutableArray *v7;
  id v8;

  v4 = a3;
  envelopes = self->_envelopes;
  v8 = v4;
  if (!envelopes)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x24BDBCEB8]);
    v7 = self->_envelopes;
    self->_envelopes = v6;

    v4 = v8;
    envelopes = self->_envelopes;
  }
  -[NSMutableArray addObject:](envelopes, "addObject:", v4);

}

- (unint64_t)envelopesCount
{
  return -[NSMutableArray count](self->_envelopes, "count");
}

- (id)envelopeAtIndex:(unint64_t)a3
{
  return (id)-[NSMutableArray objectAtIndex:](self->_envelopes, "objectAtIndex:", a3);
}

+ (Class)envelopeType
{
  return (Class)objc_opt_class();
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

- (void)setEnvelopeDroppedCountDueToSizeLimit:(int)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_envelopeDroppedCountDueToSizeLimit = a3;
}

- (void)setHasEnvelopeDroppedCountDueToSizeLimit:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (BOOL)hasEnvelopeDroppedCountDueToSizeLimit
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
  v8.super_class = (Class)NTPBEnvelopeBatch;
  -[NTPBEnvelopeBatch description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[NTPBEnvelopeBatch dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  void *v3;
  void *v4;
  NSMutableArray *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  char has;
  void *v12;
  void *v14;
  void *v15;
  void *v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[NSMutableArray count](self->_envelopes, "count"))
  {
    v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCEB8]), "initWithCapacity:", -[NSMutableArray count](self->_envelopes, "count"));
    v17 = 0u;
    v18 = 0u;
    v19 = 0u;
    v20 = 0u;
    v5 = self->_envelopes;
    v6 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
    if (v6)
    {
      v7 = v6;
      v8 = *(_QWORD *)v18;
      do
      {
        for (i = 0; i != v7; ++i)
        {
          if (*(_QWORD *)v18 != v8)
            objc_enumerationMutation(v5);
          objc_msgSend(*(id *)(*((_QWORD *)&v17 + 1) + 8 * i), "dictionaryRepresentation", (_QWORD)v17);
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v4, "addObject:", v10);

        }
        v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
      }
      while (v7);
    }

    objc_msgSend(v3, "setObject:forKey:", v4, CFSTR("envelope"));
  }
  has = (char)self->_has;
  if ((has & 2) != 0)
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", self->_majorVersion);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v14, CFSTR("major_version"));

    has = (char)self->_has;
    if ((has & 4) == 0)
    {
LABEL_12:
      if ((has & 8) == 0)
        goto LABEL_13;
LABEL_18:
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", self->_patchVersion, (_QWORD)v17);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKey:", v16, CFSTR("patch_version"));

      if ((*(_BYTE *)&self->_has & 1) == 0)
        return v3;
      goto LABEL_14;
    }
  }
  else if ((*(_BYTE *)&self->_has & 4) == 0)
  {
    goto LABEL_12;
  }
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", self->_minorVersion, (_QWORD)v17);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v15, CFSTR("minor_version"));

  has = (char)self->_has;
  if ((has & 8) != 0)
    goto LABEL_18;
LABEL_13:
  if ((has & 1) != 0)
  {
LABEL_14:
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", self->_envelopeDroppedCountDueToSizeLimit, (_QWORD)v17);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v12, CFSTR("envelope_dropped_count_due_to_size_limit"));

  }
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return NTPBEnvelopeBatchReadFrom(self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4;
  NSMutableArray *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  char has;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v5 = self->_envelopes;
  v6 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v12;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v12 != v8)
          objc_enumerationMutation(v5);
        PBDataWriterWriteSubmessage();
      }
      v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v7);
  }

  has = (char)self->_has;
  if ((has & 2) != 0)
  {
    PBDataWriterWriteInt32Field();
    has = (char)self->_has;
    if ((has & 4) == 0)
    {
LABEL_10:
      if ((has & 8) == 0)
        goto LABEL_11;
LABEL_16:
      PBDataWriterWriteInt32Field();
      if ((*(_BYTE *)&self->_has & 1) == 0)
        goto LABEL_13;
      goto LABEL_12;
    }
  }
  else if ((*(_BYTE *)&self->_has & 4) == 0)
  {
    goto LABEL_10;
  }
  PBDataWriterWriteInt32Field();
  has = (char)self->_has;
  if ((has & 8) != 0)
    goto LABEL_16;
LABEL_11:
  if ((has & 1) != 0)
LABEL_12:
    PBDataWriterWriteInt32Field();
LABEL_13:

}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5;
  NSMutableArray *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  char has;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v6 = self->_envelopes;
  v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v15;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v15 != v9)
          objc_enumerationMutation(v6);
        v11 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v14 + 1) + 8 * i), "copyWithZone:", a3, (_QWORD)v14);
        objc_msgSend((id)v5, "addEnvelope:", v11);

      }
      v8 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    }
    while (v8);
  }

  has = (char)self->_has;
  if ((has & 2) != 0)
  {
    *(_DWORD *)(v5 + 24) = self->_majorVersion;
    *(_BYTE *)(v5 + 36) |= 2u;
    has = (char)self->_has;
    if ((has & 4) == 0)
    {
LABEL_10:
      if ((has & 8) == 0)
        goto LABEL_11;
LABEL_16:
      *(_DWORD *)(v5 + 32) = self->_patchVersion;
      *(_BYTE *)(v5 + 36) |= 8u;
      if ((*(_BYTE *)&self->_has & 1) == 0)
        return (id)v5;
      goto LABEL_12;
    }
  }
  else if ((*(_BYTE *)&self->_has & 4) == 0)
  {
    goto LABEL_10;
  }
  *(_DWORD *)(v5 + 28) = self->_minorVersion;
  *(_BYTE *)(v5 + 36) |= 4u;
  has = (char)self->_has;
  if ((has & 8) != 0)
    goto LABEL_16;
LABEL_11:
  if ((has & 1) != 0)
  {
LABEL_12:
    *(_DWORD *)(v5 + 8) = self->_envelopeDroppedCountDueToSizeLimit;
    *(_BYTE *)(v5 + 36) |= 1u;
  }
  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  NSMutableArray *envelopes;
  BOOL v6;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_23;
  envelopes = self->_envelopes;
  if ((unint64_t)envelopes | *((_QWORD *)v4 + 2))
  {
    if (!-[NSMutableArray isEqual:](envelopes, "isEqual:"))
      goto LABEL_23;
  }
  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
    if ((*((_BYTE *)v4 + 36) & 2) == 0 || self->_majorVersion != *((_DWORD *)v4 + 6))
      goto LABEL_23;
  }
  else if ((*((_BYTE *)v4 + 36) & 2) != 0)
  {
LABEL_23:
    v6 = 0;
    goto LABEL_24;
  }
  if ((*(_BYTE *)&self->_has & 4) != 0)
  {
    if ((*((_BYTE *)v4 + 36) & 4) == 0 || self->_minorVersion != *((_DWORD *)v4 + 7))
      goto LABEL_23;
  }
  else if ((*((_BYTE *)v4 + 36) & 4) != 0)
  {
    goto LABEL_23;
  }
  if ((*(_BYTE *)&self->_has & 8) != 0)
  {
    if ((*((_BYTE *)v4 + 36) & 8) == 0 || self->_patchVersion != *((_DWORD *)v4 + 8))
      goto LABEL_23;
  }
  else if ((*((_BYTE *)v4 + 36) & 8) != 0)
  {
    goto LABEL_23;
  }
  v6 = (*((_BYTE *)v4 + 36) & 1) == 0;
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    if ((*((_BYTE *)v4 + 36) & 1) == 0 || self->_envelopeDroppedCountDueToSizeLimit != *((_DWORD *)v4 + 2))
      goto LABEL_23;
    v6 = 1;
  }
LABEL_24:

  return v6;
}

- (unint64_t)hash
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  v3 = -[NSMutableArray hash](self->_envelopes, "hash");
  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
    v4 = 2654435761 * self->_majorVersion;
    if ((*(_BYTE *)&self->_has & 4) != 0)
    {
LABEL_3:
      v5 = 2654435761 * self->_minorVersion;
      if ((*(_BYTE *)&self->_has & 8) != 0)
        goto LABEL_4;
LABEL_8:
      v6 = 0;
      if ((*(_BYTE *)&self->_has & 1) != 0)
        goto LABEL_5;
LABEL_9:
      v7 = 0;
      return v4 ^ v3 ^ v5 ^ v6 ^ v7;
    }
  }
  else
  {
    v4 = 0;
    if ((*(_BYTE *)&self->_has & 4) != 0)
      goto LABEL_3;
  }
  v5 = 0;
  if ((*(_BYTE *)&self->_has & 8) == 0)
    goto LABEL_8;
LABEL_4:
  v6 = 2654435761 * self->_patchVersion;
  if ((*(_BYTE *)&self->_has & 1) == 0)
    goto LABEL_9;
LABEL_5:
  v7 = 2654435761 * self->_envelopeDroppedCountDueToSizeLimit;
  return v4 ^ v3 ^ v5 ^ v6 ^ v7;
}

- (void)mergeFrom:(id)a3
{
  id v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  char v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v5 = *((id *)v4 + 2);
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v12;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v12 != v8)
          objc_enumerationMutation(v5);
        -[NTPBEnvelopeBatch addEnvelope:](self, "addEnvelope:", *(_QWORD *)(*((_QWORD *)&v11 + 1) + 8 * i), (_QWORD)v11);
      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v7);
  }

  v10 = *((_BYTE *)v4 + 36);
  if ((v10 & 2) != 0)
  {
    self->_majorVersion = *((_DWORD *)v4 + 6);
    *(_BYTE *)&self->_has |= 2u;
    v10 = *((_BYTE *)v4 + 36);
    if ((v10 & 4) == 0)
    {
LABEL_10:
      if ((v10 & 8) == 0)
        goto LABEL_11;
LABEL_16:
      self->_patchVersion = *((_DWORD *)v4 + 8);
      *(_BYTE *)&self->_has |= 8u;
      if ((*((_BYTE *)v4 + 36) & 1) == 0)
        goto LABEL_13;
      goto LABEL_12;
    }
  }
  else if ((*((_BYTE *)v4 + 36) & 4) == 0)
  {
    goto LABEL_10;
  }
  self->_minorVersion = *((_DWORD *)v4 + 7);
  *(_BYTE *)&self->_has |= 4u;
  v10 = *((_BYTE *)v4 + 36);
  if ((v10 & 8) != 0)
    goto LABEL_16;
LABEL_11:
  if ((v10 & 1) != 0)
  {
LABEL_12:
    self->_envelopeDroppedCountDueToSizeLimit = *((_DWORD *)v4 + 2);
    *(_BYTE *)&self->_has |= 1u;
  }
LABEL_13:

}

- (NSMutableArray)envelopes
{
  return self->_envelopes;
}

- (void)setEnvelopes:(id)a3
{
  objc_storeStrong((id *)&self->_envelopes, a3);
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

- (int)envelopeDroppedCountDueToSizeLimit
{
  return self->_envelopeDroppedCountDueToSizeLimit;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_envelopes, 0);
}

@end
