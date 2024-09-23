@implementation CellularLteCellMetric

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

- (void)setVersion:(unsigned int)a3
{
  *(_BYTE *)&self->_has |= 0x10u;
  self->_version = a3;
}

- (void)setHasVersion:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 16;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xEF | v3;
}

- (BOOL)hasVersion
{
  return (*(_BYTE *)&self->_has >> 4) & 1;
}

- (void)setSubsId:(unsigned int)a3
{
  *(_BYTE *)&self->_has |= 0x20u;
  self->_subsId = a3;
}

- (void)setHasSubsId:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 32;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xDF | v3;
}

- (BOOL)hasSubsId
{
  return (*(_BYTE *)&self->_has >> 5) & 1;
}

- (void)setDurationSeconds:(unsigned int)a3
{
  *(_BYTE *)&self->_has |= 2u;
  self->_durationSeconds = a3;
}

- (void)setHasDurationSeconds:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFD | v3;
}

- (BOOL)hasDurationSeconds
{
  return (*(_BYTE *)&self->_has >> 1) & 1;
}

- (void)setMcc:(unsigned int)a3
{
  *(_BYTE *)&self->_has |= 4u;
  self->_mcc = a3;
}

- (void)setHasMcc:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 4;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFB | v3;
}

- (BOOL)hasMcc
{
  return (*(_BYTE *)&self->_has >> 2) & 1;
}

- (void)setMnc:(unsigned int)a3
{
  *(_BYTE *)&self->_has |= 8u;
  self->_mnc = a3;
}

- (void)setHasMnc:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 8;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xF7 | v3;
}

- (BOOL)hasMnc
{
  return (*(_BYTE *)&self->_has >> 3) & 1;
}

- (void)clearLteMetrics
{
  -[NSMutableArray removeAllObjects](self->_lteMetrics, "removeAllObjects");
}

- (void)addLteMetrics:(id)a3
{
  id v4;
  NSMutableArray *lteMetrics;
  NSMutableArray *v6;
  NSMutableArray *v7;
  id v8;

  v4 = a3;
  lteMetrics = self->_lteMetrics;
  v8 = v4;
  if (!lteMetrics)
  {
    v6 = (NSMutableArray *)objc_alloc_init((Class)NSMutableArray);
    v7 = self->_lteMetrics;
    self->_lteMetrics = v6;

    v4 = v8;
    lteMetrics = self->_lteMetrics;
  }
  -[NSMutableArray addObject:](lteMetrics, "addObject:", v4);

}

- (unint64_t)lteMetricsCount
{
  return (unint64_t)-[NSMutableArray count](self->_lteMetrics, "count");
}

- (id)lteMetricsAtIndex:(unint64_t)a3
{
  return -[NSMutableArray objectAtIndex:](self->_lteMetrics, "objectAtIndex:", a3);
}

+ (Class)lteMetricsType
{
  return (Class)objc_opt_class(LteCellMetric, a2);
}

- (id)description
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)CellularLteCellMetric;
  v3 = -[CellularLteCellMetric description](&v8, "description");
  v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[CellularLteCellMetric dictionaryRepresentation](self, "dictionaryRepresentation"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@ %@"), v4, v5));

  return v6;
}

- (id)dictionaryRepresentation
{
  void *v3;
  char has;
  void *v5;
  id v6;
  NSMutableArray *v7;
  id v8;
  id v9;
  uint64_t v10;
  void *i;
  void *v12;
  void *v13;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _BYTE v23[128];

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary"));
  has = (char)self->_has;
  if ((has & 1) != 0)
  {
    v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedLongLong:](NSNumber, "numberWithUnsignedLongLong:", self->_timestamp));
    objc_msgSend(v3, "setObject:forKey:", v15, CFSTR("timestamp"));

    has = (char)self->_has;
    if ((has & 0x10) == 0)
    {
LABEL_3:
      if ((has & 2) == 0)
        goto LABEL_4;
      goto LABEL_21;
    }
  }
  else if ((*(_BYTE *)&self->_has & 0x10) == 0)
  {
    goto LABEL_3;
  }
  v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", self->_version));
  objc_msgSend(v3, "setObject:forKey:", v16, CFSTR("version"));

  has = (char)self->_has;
  if ((has & 2) == 0)
  {
LABEL_4:
    if ((has & 4) == 0)
      goto LABEL_5;
    goto LABEL_22;
  }
LABEL_21:
  v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", self->_durationSeconds));
  objc_msgSend(v3, "setObject:forKey:", v17, CFSTR("duration_seconds"));

  has = (char)self->_has;
  if ((has & 4) == 0)
  {
LABEL_5:
    if ((has & 8) == 0)
      goto LABEL_7;
    goto LABEL_6;
  }
LABEL_22:
  v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", self->_mcc));
  objc_msgSend(v3, "setObject:forKey:", v18, CFSTR("mcc"));

  if ((*(_BYTE *)&self->_has & 8) != 0)
  {
LABEL_6:
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", self->_mnc));
    objc_msgSend(v3, "setObject:forKey:", v5, CFSTR("mnc"));

  }
LABEL_7:
  if (-[NSMutableArray count](self->_lteMetrics, "count"))
  {
    v6 = objc_msgSend(objc_alloc((Class)NSMutableArray), "initWithCapacity:", -[NSMutableArray count](self->_lteMetrics, "count"));
    v19 = 0u;
    v20 = 0u;
    v21 = 0u;
    v22 = 0u;
    v7 = self->_lteMetrics;
    v8 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
    if (v8)
    {
      v9 = v8;
      v10 = *(_QWORD *)v20;
      do
      {
        for (i = 0; i != v9; i = (char *)i + 1)
        {
          if (*(_QWORD *)v20 != v10)
            objc_enumerationMutation(v7);
          v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(*((_QWORD *)&v19 + 1) + 8 * (_QWORD)i), "dictionaryRepresentation", (_QWORD)v19));
          objc_msgSend(v6, "addObject:", v12);

        }
        v9 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
      }
      while (v9);
    }

    objc_msgSend(v3, "setObject:forKey:", v6, CFSTR("lte_metrics"));
  }
  if ((*(_BYTE *)&self->_has & 0x20) != 0)
  {
    v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", self->_subsId));
    objc_msgSend(v3, "setObject:forKey:", v13, CFSTR("subs_id"));

  }
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return sub_100129C7C((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4;
  void *v5;
  char has;
  NSMutableArray *v7;
  id v8;
  id v9;
  uint64_t v10;
  void *i;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];

  v4 = a3;
  v5 = v4;
  has = (char)self->_has;
  if ((has & 1) != 0)
  {
    PBDataWriterWriteUint64Field(v4, self->_timestamp, 1);
    has = (char)self->_has;
    if ((has & 0x10) == 0)
    {
LABEL_3:
      if ((has & 2) == 0)
        goto LABEL_4;
      goto LABEL_19;
    }
  }
  else if ((*(_BYTE *)&self->_has & 0x10) == 0)
  {
    goto LABEL_3;
  }
  PBDataWriterWriteUint32Field(v5, self->_version, 2);
  has = (char)self->_has;
  if ((has & 2) == 0)
  {
LABEL_4:
    if ((has & 4) == 0)
      goto LABEL_5;
    goto LABEL_20;
  }
LABEL_19:
  PBDataWriterWriteUint32Field(v5, self->_durationSeconds, 3);
  has = (char)self->_has;
  if ((has & 4) == 0)
  {
LABEL_5:
    if ((has & 8) == 0)
      goto LABEL_7;
    goto LABEL_6;
  }
LABEL_20:
  PBDataWriterWriteUint32Field(v5, self->_mcc, 4);
  if ((*(_BYTE *)&self->_has & 8) != 0)
LABEL_6:
    PBDataWriterWriteUint32Field(v5, self->_mnc, 5);
LABEL_7:
  v14 = 0u;
  v15 = 0u;
  v12 = 0u;
  v13 = 0u;
  v7 = self->_lteMetrics;
  v8 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v13;
    do
    {
      for (i = 0; i != v9; i = (char *)i + 1)
      {
        if (*(_QWORD *)v13 != v10)
          objc_enumerationMutation(v7);
        PBDataWriterWriteSubmessage(v5, *(_QWORD *)(*((_QWORD *)&v12 + 1) + 8 * (_QWORD)i), 10);
      }
      v9 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v9);
  }

  if ((*(_BYTE *)&self->_has & 0x20) != 0)
    PBDataWriterWriteUint32Field(v5, self->_subsId, 12);

}

- (void)copyTo:(id)a3
{
  _QWORD *v4;
  char has;
  unint64_t v6;
  unint64_t v7;
  uint64_t i;
  void *v9;
  id v10;

  v4 = a3;
  has = (char)self->_has;
  if ((has & 1) != 0)
  {
    v4[1] = self->_timestamp;
    *((_BYTE *)v4 + 48) |= 1u;
    has = (char)self->_has;
    if ((has & 0x10) == 0)
    {
LABEL_3:
      if ((has & 2) == 0)
        goto LABEL_4;
      goto LABEL_15;
    }
  }
  else if ((*(_BYTE *)&self->_has & 0x10) == 0)
  {
    goto LABEL_3;
  }
  *((_DWORD *)v4 + 10) = self->_version;
  *((_BYTE *)v4 + 48) |= 0x10u;
  has = (char)self->_has;
  if ((has & 2) == 0)
  {
LABEL_4:
    if ((has & 4) == 0)
      goto LABEL_5;
    goto LABEL_16;
  }
LABEL_15:
  *((_DWORD *)v4 + 4) = self->_durationSeconds;
  *((_BYTE *)v4 + 48) |= 2u;
  has = (char)self->_has;
  if ((has & 4) == 0)
  {
LABEL_5:
    if ((has & 8) == 0)
      goto LABEL_6;
LABEL_17:
    *((_DWORD *)v4 + 9) = self->_mnc;
    *((_BYTE *)v4 + 48) |= 8u;
    if ((*(_BYTE *)&self->_has & 0x20) == 0)
      goto LABEL_8;
    goto LABEL_7;
  }
LABEL_16:
  *((_DWORD *)v4 + 8) = self->_mcc;
  *((_BYTE *)v4 + 48) |= 4u;
  has = (char)self->_has;
  if ((has & 8) != 0)
    goto LABEL_17;
LABEL_6:
  if ((has & 0x20) != 0)
  {
LABEL_7:
    *((_DWORD *)v4 + 11) = self->_subsId;
    *((_BYTE *)v4 + 48) |= 0x20u;
  }
LABEL_8:
  v10 = v4;
  if (-[CellularLteCellMetric lteMetricsCount](self, "lteMetricsCount"))
  {
    objc_msgSend(v10, "clearLteMetrics");
    v6 = -[CellularLteCellMetric lteMetricsCount](self, "lteMetricsCount");
    if (v6)
    {
      v7 = v6;
      for (i = 0; i != v7; ++i)
      {
        v9 = (void *)objc_claimAutoreleasedReturnValue(-[CellularLteCellMetric lteMetricsAtIndex:](self, "lteMetricsAtIndex:", i));
        objc_msgSend(v10, "addLteMetrics:", v9);

      }
    }
  }

}

- (id)copyWithZone:(_NSZone *)a3
{
  id v5;
  void *v6;
  char has;
  NSMutableArray *v8;
  id v9;
  id v10;
  uint64_t v11;
  void *i;
  id v13;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];

  v5 = objc_msgSend(objc_msgSend((id)objc_opt_class(self, a2), "allocWithZone:", a3), "init");
  v6 = v5;
  has = (char)self->_has;
  if ((has & 1) != 0)
  {
    *((_QWORD *)v5 + 1) = self->_timestamp;
    *((_BYTE *)v5 + 48) |= 1u;
    has = (char)self->_has;
    if ((has & 0x10) == 0)
    {
LABEL_3:
      if ((has & 2) == 0)
        goto LABEL_4;
      goto LABEL_18;
    }
  }
  else if ((*(_BYTE *)&self->_has & 0x10) == 0)
  {
    goto LABEL_3;
  }
  *((_DWORD *)v5 + 10) = self->_version;
  *((_BYTE *)v5 + 48) |= 0x10u;
  has = (char)self->_has;
  if ((has & 2) == 0)
  {
LABEL_4:
    if ((has & 4) == 0)
      goto LABEL_5;
    goto LABEL_19;
  }
LABEL_18:
  *((_DWORD *)v5 + 4) = self->_durationSeconds;
  *((_BYTE *)v5 + 48) |= 2u;
  has = (char)self->_has;
  if ((has & 4) == 0)
  {
LABEL_5:
    if ((has & 8) == 0)
      goto LABEL_6;
    goto LABEL_20;
  }
LABEL_19:
  *((_DWORD *)v5 + 8) = self->_mcc;
  *((_BYTE *)v5 + 48) |= 4u;
  has = (char)self->_has;
  if ((has & 8) == 0)
  {
LABEL_6:
    if ((has & 0x20) == 0)
      goto LABEL_8;
    goto LABEL_7;
  }
LABEL_20:
  *((_DWORD *)v5 + 9) = self->_mnc;
  *((_BYTE *)v5 + 48) |= 8u;
  if ((*(_BYTE *)&self->_has & 0x20) != 0)
  {
LABEL_7:
    *((_DWORD *)v5 + 11) = self->_subsId;
    *((_BYTE *)v5 + 48) |= 0x20u;
  }
LABEL_8:
  v17 = 0u;
  v18 = 0u;
  v15 = 0u;
  v16 = 0u;
  v8 = self->_lteMetrics;
  v9 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v8, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v16;
    do
    {
      for (i = 0; i != v10; i = (char *)i + 1)
      {
        if (*(_QWORD *)v16 != v11)
          objc_enumerationMutation(v8);
        v13 = objc_msgSend(*(id *)(*((_QWORD *)&v15 + 1) + 8 * (_QWORD)i), "copyWithZone:", a3, (_QWORD)v15);
        objc_msgSend(v6, "addLteMetrics:", v13);

      }
      v10 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v8, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    }
    while (v10);
  }

  return v6;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  uint64_t v5;
  NSMutableArray *lteMetrics;
  unsigned __int8 v7;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class(self, v5)))
    goto LABEL_34;
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    if ((*((_BYTE *)v4 + 48) & 1) == 0 || self->_timestamp != *((_QWORD *)v4 + 1))
      goto LABEL_34;
  }
  else if ((*((_BYTE *)v4 + 48) & 1) != 0)
  {
LABEL_34:
    v7 = 0;
    goto LABEL_35;
  }
  if ((*(_BYTE *)&self->_has & 0x10) != 0)
  {
    if ((*((_BYTE *)v4 + 48) & 0x10) == 0 || self->_version != *((_DWORD *)v4 + 10))
      goto LABEL_34;
  }
  else if ((*((_BYTE *)v4 + 48) & 0x10) != 0)
  {
    goto LABEL_34;
  }
  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
    if ((*((_BYTE *)v4 + 48) & 2) == 0 || self->_durationSeconds != *((_DWORD *)v4 + 4))
      goto LABEL_34;
  }
  else if ((*((_BYTE *)v4 + 48) & 2) != 0)
  {
    goto LABEL_34;
  }
  if ((*(_BYTE *)&self->_has & 4) != 0)
  {
    if ((*((_BYTE *)v4 + 48) & 4) == 0 || self->_mcc != *((_DWORD *)v4 + 8))
      goto LABEL_34;
  }
  else if ((*((_BYTE *)v4 + 48) & 4) != 0)
  {
    goto LABEL_34;
  }
  if ((*(_BYTE *)&self->_has & 8) != 0)
  {
    if ((*((_BYTE *)v4 + 48) & 8) == 0 || self->_mnc != *((_DWORD *)v4 + 9))
      goto LABEL_34;
  }
  else if ((*((_BYTE *)v4 + 48) & 8) != 0)
  {
    goto LABEL_34;
  }
  if ((*(_BYTE *)&self->_has & 0x20) != 0)
  {
    if ((*((_BYTE *)v4 + 48) & 0x20) == 0 || self->_subsId != *((_DWORD *)v4 + 11))
      goto LABEL_34;
  }
  else if ((*((_BYTE *)v4 + 48) & 0x20) != 0)
  {
    goto LABEL_34;
  }
  lteMetrics = self->_lteMetrics;
  if ((unint64_t)lteMetrics | *((_QWORD *)v4 + 3))
    v7 = -[NSMutableArray isEqual:](lteMetrics, "isEqual:");
  else
    v7 = 1;
LABEL_35:

  return v7;
}

- (unint64_t)hash
{
  unint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    v2 = 2654435761u * self->_timestamp;
    if ((*(_BYTE *)&self->_has & 0x10) != 0)
    {
LABEL_3:
      v3 = 2654435761 * self->_version;
      if ((*(_BYTE *)&self->_has & 2) != 0)
        goto LABEL_4;
      goto LABEL_10;
    }
  }
  else
  {
    v2 = 0;
    if ((*(_BYTE *)&self->_has & 0x10) != 0)
      goto LABEL_3;
  }
  v3 = 0;
  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
LABEL_4:
    v4 = 2654435761 * self->_durationSeconds;
    if ((*(_BYTE *)&self->_has & 4) != 0)
      goto LABEL_5;
    goto LABEL_11;
  }
LABEL_10:
  v4 = 0;
  if ((*(_BYTE *)&self->_has & 4) != 0)
  {
LABEL_5:
    v5 = 2654435761 * self->_mcc;
    if ((*(_BYTE *)&self->_has & 8) != 0)
      goto LABEL_6;
LABEL_12:
    v6 = 0;
    if ((*(_BYTE *)&self->_has & 0x20) != 0)
      goto LABEL_7;
LABEL_13:
    v7 = 0;
    return v3 ^ v2 ^ v4 ^ v5 ^ v6 ^ v7 ^ (unint64_t)-[NSMutableArray hash](self->_lteMetrics, "hash");
  }
LABEL_11:
  v5 = 0;
  if ((*(_BYTE *)&self->_has & 8) == 0)
    goto LABEL_12;
LABEL_6:
  v6 = 2654435761 * self->_mnc;
  if ((*(_BYTE *)&self->_has & 0x20) == 0)
    goto LABEL_13;
LABEL_7:
  v7 = 2654435761 * self->_subsId;
  return v3 ^ v2 ^ v4 ^ v5 ^ v6 ^ v7 ^ (unint64_t)-[NSMutableArray hash](self->_lteMetrics, "hash");
}

- (void)mergeFrom:(id)a3
{
  id v4;
  void *v5;
  char v6;
  id v7;
  id v8;
  id v9;
  uint64_t v10;
  void *i;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];

  v4 = a3;
  v5 = v4;
  v6 = *((_BYTE *)v4 + 48);
  if ((v6 & 1) != 0)
  {
    self->_timestamp = *((_QWORD *)v4 + 1);
    *(_BYTE *)&self->_has |= 1u;
    v6 = *((_BYTE *)v4 + 48);
    if ((v6 & 0x10) == 0)
    {
LABEL_3:
      if ((v6 & 2) == 0)
        goto LABEL_4;
      goto LABEL_18;
    }
  }
  else if ((*((_BYTE *)v4 + 48) & 0x10) == 0)
  {
    goto LABEL_3;
  }
  self->_version = *((_DWORD *)v4 + 10);
  *(_BYTE *)&self->_has |= 0x10u;
  v6 = *((_BYTE *)v4 + 48);
  if ((v6 & 2) == 0)
  {
LABEL_4:
    if ((v6 & 4) == 0)
      goto LABEL_5;
    goto LABEL_19;
  }
LABEL_18:
  self->_durationSeconds = *((_DWORD *)v4 + 4);
  *(_BYTE *)&self->_has |= 2u;
  v6 = *((_BYTE *)v4 + 48);
  if ((v6 & 4) == 0)
  {
LABEL_5:
    if ((v6 & 8) == 0)
      goto LABEL_6;
    goto LABEL_20;
  }
LABEL_19:
  self->_mcc = *((_DWORD *)v4 + 8);
  *(_BYTE *)&self->_has |= 4u;
  v6 = *((_BYTE *)v4 + 48);
  if ((v6 & 8) == 0)
  {
LABEL_6:
    if ((v6 & 0x20) == 0)
      goto LABEL_8;
    goto LABEL_7;
  }
LABEL_20:
  self->_mnc = *((_DWORD *)v4 + 9);
  *(_BYTE *)&self->_has |= 8u;
  if ((*((_BYTE *)v4 + 48) & 0x20) != 0)
  {
LABEL_7:
    self->_subsId = *((_DWORD *)v4 + 11);
    *(_BYTE *)&self->_has |= 0x20u;
  }
LABEL_8:
  v14 = 0u;
  v15 = 0u;
  v12 = 0u;
  v13 = 0u;
  v7 = *((id *)v4 + 3);
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v13;
    do
    {
      for (i = 0; i != v9; i = (char *)i + 1)
      {
        if (*(_QWORD *)v13 != v10)
          objc_enumerationMutation(v7);
        -[CellularLteCellMetric addLteMetrics:](self, "addLteMetrics:", *(_QWORD *)(*((_QWORD *)&v12 + 1) + 8 * (_QWORD)i), (_QWORD)v12);
      }
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v9);
  }

}

- (unint64_t)timestamp
{
  return self->_timestamp;
}

- (unsigned)version
{
  return self->_version;
}

- (unsigned)subsId
{
  return self->_subsId;
}

- (unsigned)durationSeconds
{
  return self->_durationSeconds;
}

- (unsigned)mcc
{
  return self->_mcc;
}

- (unsigned)mnc
{
  return self->_mnc;
}

- (NSMutableArray)lteMetrics
{
  return self->_lteMetrics;
}

- (void)setLteMetrics:(id)a3
{
  objc_storeStrong((id *)&self->_lteMetrics, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lteMetrics, 0);
}

@end
