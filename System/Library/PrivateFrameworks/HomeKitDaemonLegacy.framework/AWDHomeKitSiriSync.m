@implementation AWDHomeKitSiriSync

- (void)setTimestamp:(unint64_t)a3
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

- (void)setDuration:(unsigned int)a3
{
  *(_BYTE *)&self->_has |= 4u;
  self->_duration = a3;
}

- (void)setHasDuration:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 4;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFB | v3;
}

- (BOOL)hasDuration
{
  return (*(_BYTE *)&self->_has >> 2) & 1;
}

- (void)clearReasons
{
  -[NSMutableArray removeAllObjects](self->_reasons, "removeAllObjects");
}

- (void)addReasons:(id)a3
{
  id v4;
  NSMutableArray *reasons;
  NSMutableArray *v6;
  NSMutableArray *v7;
  id v8;

  v4 = a3;
  reasons = self->_reasons;
  v8 = v4;
  if (!reasons)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v7 = self->_reasons;
    self->_reasons = v6;

    v4 = v8;
    reasons = self->_reasons;
  }
  -[NSMutableArray addObject:](reasons, "addObject:", v4);

}

- (unint64_t)reasonsCount
{
  return -[NSMutableArray count](self->_reasons, "count");
}

- (id)reasonsAtIndex:(unint64_t)a3
{
  return (id)-[NSMutableArray objectAtIndex:](self->_reasons, "objectAtIndex:", a3);
}

- (void)setCurrentConfigurationVersion:(unsigned int)a3
{
  *(_BYTE *)&self->_has |= 2u;
  self->_currentConfigurationVersion = a3;
}

- (void)setHasCurrentConfigurationVersion:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFD | v3;
}

- (BOOL)hasCurrentConfigurationVersion
{
  return (*(_BYTE *)&self->_has >> 1) & 1;
}

- (void)setLastSyncedConfigurationVersion:(unsigned int)a3
{
  *(_BYTE *)&self->_has |= 8u;
  self->_lastSyncedConfigurationVersion = a3;
}

- (void)setHasLastSyncedConfigurationVersion:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 8;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xF7 | v3;
}

- (BOOL)hasLastSyncedConfigurationVersion
{
  return (*(_BYTE *)&self->_has >> 3) & 1;
}

- (void)setServerConfigurationVersion:(unsigned int)a3
{
  *(_BYTE *)&self->_has |= 0x10u;
  self->_serverConfigurationVersion = a3;
}

- (void)setHasServerConfigurationVersion:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 16;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xEF | v3;
}

- (BOOL)hasServerConfigurationVersion
{
  return (*(_BYTE *)&self->_has >> 4) & 1;
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
  v8.super_class = (Class)AWDHomeKitSiriSync;
  -[AWDHomeKitSiriSync description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[AWDHomeKitSiriSync dictionaryRepresentation](self, "dictionaryRepresentation");
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
  NSMutableArray *reasons;
  char v8;
  void *v9;
  void *v11;
  void *v12;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  has = (char)self->_has;
  if ((has & 1) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", self->_timestamp);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v5, CFSTR("timestamp"));

    has = (char)self->_has;
  }
  if ((has & 4) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", self->_duration);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v6, CFSTR("duration"));

  }
  reasons = self->_reasons;
  if (reasons)
    objc_msgSend(v3, "setObject:forKey:", reasons, CFSTR("reasons"));
  v8 = (char)self->_has;
  if ((v8 & 2) == 0)
  {
    if ((*(_BYTE *)&self->_has & 8) == 0)
      goto LABEL_9;
LABEL_13:
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", self->_lastSyncedConfigurationVersion);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v12, CFSTR("lastSyncedConfigurationVersion"));

    if ((*(_BYTE *)&self->_has & 0x10) == 0)
      return v3;
    goto LABEL_10;
  }
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", self->_currentConfigurationVersion);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v11, CFSTR("currentConfigurationVersion"));

  v8 = (char)self->_has;
  if ((v8 & 8) != 0)
    goto LABEL_13;
LABEL_9:
  if ((v8 & 0x10) != 0)
  {
LABEL_10:
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", self->_serverConfigurationVersion);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v9, CFSTR("serverConfigurationVersion"));

  }
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  int *v4;
  int *v5;
  int *v6;
  int *v8;
  char v9;
  unsigned int v10;
  unint64_t v11;
  uint64_t v12;
  unint64_t v13;
  char v14;
  BOOL v15;
  int v16;
  char v18;
  unsigned int v19;
  unint64_t v20;
  uint64_t v21;
  unint64_t v22;
  char v23;
  int v24;
  char v25;
  unsigned int v26;
  uint64_t v27;
  uint64_t v28;
  unint64_t v29;
  char v30;
  void *v31;
  char v32;
  unsigned int v33;
  uint64_t v34;
  unint64_t v35;
  char v36;
  char v37;
  unsigned int v38;
  uint64_t v39;
  unint64_t v40;
  char v41;
  char v42;
  unsigned int v43;
  uint64_t v44;
  unint64_t v45;
  char v46;
  uint64_t v47;

  v4 = (int *)MEMORY[0x1E0D82BF0];
  v5 = (int *)MEMORY[0x1E0D82BD8];
  v6 = (int *)MEMORY[0x1E0D82BC8];
  if (*(_QWORD *)((char *)a3 + (int)*MEMORY[0x1E0D82BF0]) < *(_QWORD *)((char *)a3 + (int)*MEMORY[0x1E0D82BD8]))
  {
    v8 = (int *)MEMORY[0x1E0D82BB8];
    do
    {
      if (*((_BYTE *)a3 + *v6))
        break;
      v9 = 0;
      v10 = 0;
      v11 = 0;
      while (1)
      {
        v12 = *v4;
        v13 = *(_QWORD *)((char *)a3 + v12);
        if (v13 == -1 || v13 >= *(_QWORD *)((char *)a3 + *v5))
          break;
        v14 = *(_BYTE *)(*(_QWORD *)((char *)a3 + *v8) + v13);
        *(_QWORD *)((char *)a3 + v12) = v13 + 1;
        v11 |= (unint64_t)(v14 & 0x7F) << v9;
        if ((v14 & 0x80) == 0)
          goto LABEL_12;
        v9 += 7;
        v15 = v10++ >= 9;
        if (v15)
        {
          v11 = 0;
          v16 = *((unsigned __int8 *)a3 + *v6);
          goto LABEL_14;
        }
      }
      *((_BYTE *)a3 + *v6) = 1;
LABEL_12:
      v16 = *((unsigned __int8 *)a3 + *v6);
      if (*((_BYTE *)a3 + *v6))
        v11 = 0;
LABEL_14:
      if (v16 || (v11 & 7) == 4)
        break;
      switch((v11 >> 3))
      {
        case 1u:
          v18 = 0;
          v19 = 0;
          v20 = 0;
          *(_BYTE *)&self->_has |= 1u;
          while (1)
          {
            v21 = *v4;
            v22 = *(_QWORD *)((char *)a3 + v21);
            if (v22 == -1 || v22 >= *(_QWORD *)((char *)a3 + *v5))
              break;
            v23 = *(_BYTE *)(*(_QWORD *)((char *)a3 + *v8) + v22);
            *(_QWORD *)((char *)a3 + v21) = v22 + 1;
            v20 |= (unint64_t)(v23 & 0x7F) << v18;
            if ((v23 & 0x80) == 0)
              goto LABEL_60;
            v18 += 7;
            v15 = v19++ >= 9;
            if (v15)
            {
              v20 = 0;
              goto LABEL_62;
            }
          }
          *((_BYTE *)a3 + *v6) = 1;
LABEL_60:
          if (*((_BYTE *)a3 + *v6))
            v20 = 0;
LABEL_62:
          self->_timestamp = v20;
          continue;
        case 2u:
          v25 = 0;
          v26 = 0;
          v27 = 0;
          *(_BYTE *)&self->_has |= 4u;
          while (2)
          {
            v28 = *v4;
            v29 = *(_QWORD *)((char *)a3 + v28);
            if (v29 == -1 || v29 >= *(_QWORD *)((char *)a3 + *v5))
            {
              *((_BYTE *)a3 + *v6) = 1;
            }
            else
            {
              v30 = *(_BYTE *)(*(_QWORD *)((char *)a3 + *v8) + v29);
              *(_QWORD *)((char *)a3 + v28) = v29 + 1;
              v27 |= (unint64_t)(v30 & 0x7F) << v25;
              if (v30 < 0)
              {
                v25 += 7;
                v15 = v26++ >= 9;
                if (v15)
                {
                  LODWORD(v27) = 0;
                  goto LABEL_66;
                }
                continue;
              }
            }
            break;
          }
          if (*((_BYTE *)a3 + *v6))
            LODWORD(v27) = 0;
LABEL_66:
          v47 = 20;
          goto LABEL_79;
        case 3u:
          PBReaderReadString();
          v31 = (void *)objc_claimAutoreleasedReturnValue();
          if (v31)
            -[AWDHomeKitSiriSync addReasons:](self, "addReasons:", v31);

          continue;
        case 4u:
          v32 = 0;
          v33 = 0;
          v27 = 0;
          *(_BYTE *)&self->_has |= 2u;
          while (2)
          {
            v34 = *v4;
            v35 = *(_QWORD *)((char *)a3 + v34);
            if (v35 == -1 || v35 >= *(_QWORD *)((char *)a3 + *v5))
            {
              *((_BYTE *)a3 + *v6) = 1;
            }
            else
            {
              v36 = *(_BYTE *)(*(_QWORD *)((char *)a3 + *v8) + v35);
              *(_QWORD *)((char *)a3 + v34) = v35 + 1;
              v27 |= (unint64_t)(v36 & 0x7F) << v32;
              if (v36 < 0)
              {
                v32 += 7;
                v15 = v33++ >= 9;
                if (v15)
                {
                  LODWORD(v27) = 0;
                  goto LABEL_70;
                }
                continue;
              }
            }
            break;
          }
          if (*((_BYTE *)a3 + *v6))
            LODWORD(v27) = 0;
LABEL_70:
          v47 = 16;
          goto LABEL_79;
        case 5u:
          v37 = 0;
          v38 = 0;
          v27 = 0;
          *(_BYTE *)&self->_has |= 8u;
          while (2)
          {
            v39 = *v4;
            v40 = *(_QWORD *)((char *)a3 + v39);
            if (v40 == -1 || v40 >= *(_QWORD *)((char *)a3 + *v5))
            {
              *((_BYTE *)a3 + *v6) = 1;
            }
            else
            {
              v41 = *(_BYTE *)(*(_QWORD *)((char *)a3 + *v8) + v40);
              *(_QWORD *)((char *)a3 + v39) = v40 + 1;
              v27 |= (unint64_t)(v41 & 0x7F) << v37;
              if (v41 < 0)
              {
                v37 += 7;
                v15 = v38++ >= 9;
                if (v15)
                {
                  LODWORD(v27) = 0;
                  goto LABEL_74;
                }
                continue;
              }
            }
            break;
          }
          if (*((_BYTE *)a3 + *v6))
            LODWORD(v27) = 0;
LABEL_74:
          v47 = 24;
          goto LABEL_79;
        case 6u:
          v42 = 0;
          v43 = 0;
          v27 = 0;
          *(_BYTE *)&self->_has |= 0x10u;
          break;
        default:
          v24 = PBReaderSkipValueWithTag();
          if (!v24)
            return v24;
          continue;
      }
      while (1)
      {
        v44 = *v4;
        v45 = *(_QWORD *)((char *)a3 + v44);
        if (v45 == -1 || v45 >= *(_QWORD *)((char *)a3 + *v5))
          break;
        v46 = *(_BYTE *)(*(_QWORD *)((char *)a3 + *v8) + v45);
        *(_QWORD *)((char *)a3 + v44) = v45 + 1;
        v27 |= (unint64_t)(v46 & 0x7F) << v42;
        if ((v46 & 0x80) == 0)
          goto LABEL_76;
        v42 += 7;
        v15 = v43++ >= 9;
        if (v15)
        {
          LODWORD(v27) = 0;
          goto LABEL_78;
        }
      }
      *((_BYTE *)a3 + *v6) = 1;
LABEL_76:
      if (*((_BYTE *)a3 + *v6))
        LODWORD(v27) = 0;
LABEL_78:
      v47 = 40;
LABEL_79:
      *(_DWORD *)((char *)&self->super.super.isa + v47) = v27;
    }
    while (*(_QWORD *)((char *)a3 + *v4) < *(_QWORD *)((char *)a3 + *v5));
  }
  LOBYTE(v24) = *((_BYTE *)a3 + *v6) == 0;
  return v24;
}

- (void)writeTo:(id)a3
{
  id v4;
  char has;
  NSMutableArray *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  char v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  has = (char)self->_has;
  if ((has & 1) != 0)
  {
    PBDataWriterWriteUint64Field();
    has = (char)self->_has;
  }
  if ((has & 4) != 0)
    PBDataWriterWriteUint32Field();
  v14 = 0u;
  v15 = 0u;
  v12 = 0u;
  v13 = 0u;
  v6 = self->_reasons;
  v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v13;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v13 != v9)
          objc_enumerationMutation(v6);
        PBDataWriterWriteStringField();
      }
      v8 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v8);
  }

  v11 = (char)self->_has;
  if ((v11 & 2) == 0)
  {
    if ((*(_BYTE *)&self->_has & 8) == 0)
      goto LABEL_14;
LABEL_18:
    PBDataWriterWriteUint32Field();
    if ((*(_BYTE *)&self->_has & 0x10) == 0)
      goto LABEL_16;
    goto LABEL_15;
  }
  PBDataWriterWriteUint32Field();
  v11 = (char)self->_has;
  if ((v11 & 8) != 0)
    goto LABEL_18;
LABEL_14:
  if ((v11 & 0x10) != 0)
LABEL_15:
    PBDataWriterWriteUint32Field();
LABEL_16:

}

- (void)copyTo:(id)a3
{
  _QWORD *v4;
  char has;
  unint64_t v6;
  unint64_t v7;
  uint64_t i;
  void *v9;
  char v10;
  id v11;

  v4 = a3;
  has = (char)self->_has;
  if ((has & 1) != 0)
  {
    v4[1] = self->_timestamp;
    *((_BYTE *)v4 + 44) |= 1u;
    has = (char)self->_has;
  }
  if ((has & 4) != 0)
  {
    *((_DWORD *)v4 + 5) = self->_duration;
    *((_BYTE *)v4 + 44) |= 4u;
  }
  v11 = v4;
  if (-[AWDHomeKitSiriSync reasonsCount](self, "reasonsCount"))
  {
    objc_msgSend(v11, "clearReasons");
    v6 = -[AWDHomeKitSiriSync reasonsCount](self, "reasonsCount");
    if (v6)
    {
      v7 = v6;
      for (i = 0; i != v7; ++i)
      {
        -[AWDHomeKitSiriSync reasonsAtIndex:](self, "reasonsAtIndex:", i);
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "addReasons:", v9);

      }
    }
  }
  v10 = (char)self->_has;
  if ((v10 & 2) == 0)
  {
    if ((*(_BYTE *)&self->_has & 8) == 0)
      goto LABEL_11;
LABEL_15:
    *((_DWORD *)v11 + 6) = self->_lastSyncedConfigurationVersion;
    *((_BYTE *)v11 + 44) |= 8u;
    if ((*(_BYTE *)&self->_has & 0x10) == 0)
      goto LABEL_13;
    goto LABEL_12;
  }
  *((_DWORD *)v11 + 4) = self->_currentConfigurationVersion;
  *((_BYTE *)v11 + 44) |= 2u;
  v10 = (char)self->_has;
  if ((v10 & 8) != 0)
    goto LABEL_15;
LABEL_11:
  if ((v10 & 0x10) != 0)
  {
LABEL_12:
    *((_DWORD *)v11 + 10) = self->_serverConfigurationVersion;
    *((_BYTE *)v11 + 44) |= 0x10u;
  }
LABEL_13:

}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5;
  uint64_t v6;
  char has;
  NSMutableArray *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  void *v13;
  char v14;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = v5;
  has = (char)self->_has;
  if ((has & 1) != 0)
  {
    *(_QWORD *)(v5 + 8) = self->_timestamp;
    *(_BYTE *)(v5 + 44) |= 1u;
    has = (char)self->_has;
  }
  if ((has & 4) != 0)
  {
    *(_DWORD *)(v5 + 20) = self->_duration;
    *(_BYTE *)(v5 + 44) |= 4u;
  }
  v18 = 0u;
  v19 = 0u;
  v16 = 0u;
  v17 = 0u;
  v8 = self->_reasons;
  v9 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v8, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v17;
    do
    {
      for (i = 0; i != v10; ++i)
      {
        if (*(_QWORD *)v17 != v11)
          objc_enumerationMutation(v8);
        v13 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v16 + 1) + 8 * i), "copyWithZone:", a3, (_QWORD)v16);
        objc_msgSend((id)v6, "addReasons:", v13);

      }
      v10 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v8, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    }
    while (v10);
  }

  v14 = (char)self->_has;
  if ((v14 & 2) == 0)
  {
    if ((*(_BYTE *)&self->_has & 8) == 0)
      goto LABEL_14;
LABEL_18:
    *(_DWORD *)(v6 + 24) = self->_lastSyncedConfigurationVersion;
    *(_BYTE *)(v6 + 44) |= 8u;
    if ((*(_BYTE *)&self->_has & 0x10) == 0)
      return (id)v6;
    goto LABEL_15;
  }
  *(_DWORD *)(v6 + 16) = self->_currentConfigurationVersion;
  *(_BYTE *)(v6 + 44) |= 2u;
  v14 = (char)self->_has;
  if ((v14 & 8) != 0)
    goto LABEL_18;
LABEL_14:
  if ((v14 & 0x10) != 0)
  {
LABEL_15:
    *(_DWORD *)(v6 + 40) = self->_serverConfigurationVersion;
    *(_BYTE *)(v6 + 44) |= 0x10u;
  }
  return (id)v6;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  char has;
  char v6;
  NSMutableArray *reasons;
  BOOL v8;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_29;
  has = (char)self->_has;
  v6 = *((_BYTE *)v4 + 44);
  if ((has & 1) != 0)
  {
    if ((*((_BYTE *)v4 + 44) & 1) == 0 || self->_timestamp != *((_QWORD *)v4 + 1))
      goto LABEL_29;
  }
  else if ((*((_BYTE *)v4 + 44) & 1) != 0)
  {
    goto LABEL_29;
  }
  if ((*(_BYTE *)&self->_has & 4) != 0)
  {
    if ((*((_BYTE *)v4 + 44) & 4) == 0 || self->_duration != *((_DWORD *)v4 + 5))
      goto LABEL_29;
  }
  else if ((*((_BYTE *)v4 + 44) & 4) != 0)
  {
    goto LABEL_29;
  }
  reasons = self->_reasons;
  if ((unint64_t)reasons | *((_QWORD *)v4 + 4))
  {
    if (!-[NSMutableArray isEqual:](reasons, "isEqual:"))
    {
LABEL_29:
      v8 = 0;
      goto LABEL_30;
    }
    has = (char)self->_has;
    v6 = *((_BYTE *)v4 + 44);
  }
  if ((has & 2) != 0)
  {
    if ((v6 & 2) == 0 || self->_currentConfigurationVersion != *((_DWORD *)v4 + 4))
      goto LABEL_29;
  }
  else if ((v6 & 2) != 0)
  {
    goto LABEL_29;
  }
  if ((has & 8) != 0)
  {
    if ((v6 & 8) == 0 || self->_lastSyncedConfigurationVersion != *((_DWORD *)v4 + 6))
      goto LABEL_29;
  }
  else if ((v6 & 8) != 0)
  {
    goto LABEL_29;
  }
  v8 = (v6 & 0x10) == 0;
  if ((has & 0x10) != 0)
  {
    if ((v6 & 0x10) == 0 || self->_serverConfigurationVersion != *((_DWORD *)v4 + 10))
      goto LABEL_29;
    v8 = 1;
  }
LABEL_30:

  return v8;
}

- (unint64_t)hash
{
  unint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    v3 = 2654435761u * self->_timestamp;
    if ((*(_BYTE *)&self->_has & 4) != 0)
      goto LABEL_3;
  }
  else
  {
    v3 = 0;
    if ((*(_BYTE *)&self->_has & 4) != 0)
    {
LABEL_3:
      v4 = 2654435761 * self->_duration;
      goto LABEL_6;
    }
  }
  v4 = 0;
LABEL_6:
  v5 = -[NSMutableArray hash](self->_reasons, "hash");
  if ((*(_BYTE *)&self->_has & 2) == 0)
  {
    v6 = 0;
    if ((*(_BYTE *)&self->_has & 8) != 0)
      goto LABEL_8;
LABEL_11:
    v7 = 0;
    if ((*(_BYTE *)&self->_has & 0x10) != 0)
      goto LABEL_9;
LABEL_12:
    v8 = 0;
    return v4 ^ v3 ^ v6 ^ v7 ^ v8 ^ v5;
  }
  v6 = 2654435761 * self->_currentConfigurationVersion;
  if ((*(_BYTE *)&self->_has & 8) == 0)
    goto LABEL_11;
LABEL_8:
  v7 = 2654435761 * self->_lastSyncedConfigurationVersion;
  if ((*(_BYTE *)&self->_has & 0x10) == 0)
    goto LABEL_12;
LABEL_9:
  v8 = 2654435761 * self->_serverConfigurationVersion;
  return v4 ^ v3 ^ v6 ^ v7 ^ v8 ^ v5;
}

- (void)mergeFrom:(id)a3
{
  id v4;
  id v5;
  char v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  char v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = v4;
  v6 = *((_BYTE *)v4 + 44);
  if ((v6 & 1) != 0)
  {
    self->_timestamp = *((_QWORD *)v4 + 1);
    *(_BYTE *)&self->_has |= 1u;
    v6 = *((_BYTE *)v4 + 44);
  }
  if ((v6 & 4) != 0)
  {
    self->_duration = *((_DWORD *)v4 + 5);
    *(_BYTE *)&self->_has |= 4u;
  }
  v15 = 0u;
  v16 = 0u;
  v13 = 0u;
  v14 = 0u;
  v7 = *((id *)v4 + 4);
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v14;
    do
    {
      for (i = 0; i != v9; ++i)
      {
        if (*(_QWORD *)v14 != v10)
          objc_enumerationMutation(v7);
        -[AWDHomeKitSiriSync addReasons:](self, "addReasons:", *(_QWORD *)(*((_QWORD *)&v13 + 1) + 8 * i), (_QWORD)v13);
      }
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v9);
  }

  v12 = *((_BYTE *)v5 + 44);
  if ((v12 & 2) == 0)
  {
    if ((*((_BYTE *)v5 + 44) & 8) == 0)
      goto LABEL_14;
LABEL_18:
    self->_lastSyncedConfigurationVersion = *((_DWORD *)v5 + 6);
    *(_BYTE *)&self->_has |= 8u;
    if ((*((_BYTE *)v5 + 44) & 0x10) == 0)
      goto LABEL_16;
    goto LABEL_15;
  }
  self->_currentConfigurationVersion = *((_DWORD *)v5 + 4);
  *(_BYTE *)&self->_has |= 2u;
  v12 = *((_BYTE *)v5 + 44);
  if ((v12 & 8) != 0)
    goto LABEL_18;
LABEL_14:
  if ((v12 & 0x10) != 0)
  {
LABEL_15:
    self->_serverConfigurationVersion = *((_DWORD *)v5 + 10);
    *(_BYTE *)&self->_has |= 0x10u;
  }
LABEL_16:

}

- (unint64_t)timestamp
{
  return self->_timestamp;
}

- (unsigned)duration
{
  return self->_duration;
}

- (NSMutableArray)reasons
{
  return self->_reasons;
}

- (void)setReasons:(id)a3
{
  objc_storeStrong((id *)&self->_reasons, a3);
}

- (unsigned)currentConfigurationVersion
{
  return self->_currentConfigurationVersion;
}

- (unsigned)lastSyncedConfigurationVersion
{
  return self->_lastSyncedConfigurationVersion;
}

- (unsigned)serverConfigurationVersion
{
  return self->_serverConfigurationVersion;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_reasons, 0);
}

+ (Class)reasonsType
{
  return (Class)objc_opt_class();
}

@end
