@implementation CellularLmapoOosHist

- (void)dealloc
{
  uint64_t v3;
  uint64_t v4;
  objc_super v5;

  PBRepeatedUInt32Clear(&self->_oosStateCounts, a2);
  PBRepeatedUInt32Clear(&self->_oosStateDurationMs, v3);
  PBRepeatedUInt32Clear(&self->_oosToOosCounts, v4);
  v5.receiver = self;
  v5.super_class = (Class)CellularLmapoOosHist;
  -[CellularLmapoOosHist dealloc](&v5, "dealloc");
}

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

- (unint64_t)oosStateCountsCount
{
  return self->_oosStateCounts.count;
}

- (unsigned)oosStateCounts
{
  return self->_oosStateCounts.list;
}

- (void)clearOosStateCounts
{
  PBRepeatedUInt32Clear(&self->_oosStateCounts, a2);
}

- (void)addOosStateCount:(unsigned int)a3
{
  PBRepeatedUInt32Add(&self->_oosStateCounts, *(_QWORD *)&a3);
}

- (unsigned)oosStateCountAtIndex:(unint64_t)a3
{
  $1729E44CE8A3ADE0AA70C2F19EF2BB02 *p_oosStateCounts;
  unint64_t count;
  void *v6;
  void *v7;

  p_oosStateCounts = &self->_oosStateCounts;
  count = self->_oosStateCounts.count;
  if (count <= a3)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("idx (%tu) is out of range (%tu)"), a3, count));
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSException exceptionWithName:reason:userInfo:](NSException, "exceptionWithName:reason:userInfo:", NSRangeException, v6, 0));
    objc_msgSend(v7, "raise");

  }
  return p_oosStateCounts->list[a3];
}

- (void)setOosStateCounts:(unsigned int *)a3 count:(unint64_t)a4
{
  PBRepeatedUInt32Set(&self->_oosStateCounts, a3, a4);
}

- (unint64_t)oosStateDurationMsCount
{
  return self->_oosStateDurationMs.count;
}

- (unsigned)oosStateDurationMs
{
  return self->_oosStateDurationMs.list;
}

- (void)clearOosStateDurationMs
{
  PBRepeatedUInt32Clear(&self->_oosStateDurationMs, a2);
}

- (void)addOosStateDurationMs:(unsigned int)a3
{
  PBRepeatedUInt32Add(&self->_oosStateDurationMs, *(_QWORD *)&a3);
}

- (unsigned)oosStateDurationMsAtIndex:(unint64_t)a3
{
  $1729E44CE8A3ADE0AA70C2F19EF2BB02 *p_oosStateDurationMs;
  unint64_t count;
  void *v6;
  void *v7;

  p_oosStateDurationMs = &self->_oosStateDurationMs;
  count = self->_oosStateDurationMs.count;
  if (count <= a3)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("idx (%tu) is out of range (%tu)"), a3, count));
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSException exceptionWithName:reason:userInfo:](NSException, "exceptionWithName:reason:userInfo:", NSRangeException, v6, 0));
    objc_msgSend(v7, "raise");

  }
  return p_oosStateDurationMs->list[a3];
}

- (void)setOosStateDurationMs:(unsigned int *)a3 count:(unint64_t)a4
{
  PBRepeatedUInt32Set(&self->_oosStateDurationMs, a3, a4);
}

- (void)clearRecoverHists
{
  -[NSMutableArray removeAllObjects](self->_recoverHists, "removeAllObjects");
}

- (void)addRecoverHist:(id)a3
{
  id v4;
  NSMutableArray *recoverHists;
  NSMutableArray *v6;
  NSMutableArray *v7;
  id v8;

  v4 = a3;
  recoverHists = self->_recoverHists;
  v8 = v4;
  if (!recoverHists)
  {
    v6 = (NSMutableArray *)objc_alloc_init((Class)NSMutableArray);
    v7 = self->_recoverHists;
    self->_recoverHists = v6;

    v4 = v8;
    recoverHists = self->_recoverHists;
  }
  -[NSMutableArray addObject:](recoverHists, "addObject:", v4);

}

- (unint64_t)recoverHistsCount
{
  return (unint64_t)-[NSMutableArray count](self->_recoverHists, "count");
}

- (id)recoverHistAtIndex:(unint64_t)a3
{
  return -[NSMutableArray objectAtIndex:](self->_recoverHists, "objectAtIndex:", a3);
}

+ (Class)recoverHistType
{
  return (Class)objc_opt_class(RecoverHist, a2);
}

- (unint64_t)oosToOosCountsCount
{
  return self->_oosToOosCounts.count;
}

- (unsigned)oosToOosCounts
{
  return self->_oosToOosCounts.list;
}

- (void)clearOosToOosCounts
{
  PBRepeatedUInt32Clear(&self->_oosToOosCounts, a2);
}

- (void)addOosToOosCount:(unsigned int)a3
{
  PBRepeatedUInt32Add(&self->_oosToOosCounts, *(_QWORD *)&a3);
}

- (unsigned)oosToOosCountAtIndex:(unint64_t)a3
{
  $1729E44CE8A3ADE0AA70C2F19EF2BB02 *p_oosToOosCounts;
  unint64_t count;
  void *v6;
  void *v7;

  p_oosToOosCounts = &self->_oosToOosCounts;
  count = self->_oosToOosCounts.count;
  if (count <= a3)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("idx (%tu) is out of range (%tu)"), a3, count));
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSException exceptionWithName:reason:userInfo:](NSException, "exceptionWithName:reason:userInfo:", NSRangeException, v6, 0));
    objc_msgSend(v7, "raise");

  }
  return p_oosToOosCounts->list[a3];
}

- (void)setOosToOosCounts:(unsigned int *)a3 count:(unint64_t)a4
{
  PBRepeatedUInt32Set(&self->_oosToOosCounts, a3, a4);
}

- (void)setVersion:(unsigned int)a3
{
  *(_BYTE *)&self->_has |= 4u;
  self->_version = a3;
}

- (void)setHasVersion:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 4;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFB | v3;
}

- (BOOL)hasVersion
{
  return (*(_BYTE *)&self->_has >> 2) & 1;
}

- (id)description
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)CellularLmapoOosHist;
  v3 = -[CellularLmapoOosHist description](&v8, "description");
  v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[CellularLmapoOosHist dictionaryRepresentation](self, "dictionaryRepresentation"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@ %@"), v4, v5));

  return v6;
}

- (id)dictionaryRepresentation
{
  void *v3;
  char has;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  id v11;
  NSMutableArray *v12;
  id v13;
  id v14;
  uint64_t v15;
  void *i;
  void *v17;
  uint64_t v18;
  void *v19;
  void *v20;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  _BYTE v26[128];

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary"));
  has = (char)self->_has;
  if ((has & 1) != 0)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedLongLong:](NSNumber, "numberWithUnsignedLongLong:", self->_timestamp));
    objc_msgSend(v3, "setObject:forKey:", v5, CFSTR("timestamp"));

    has = (char)self->_has;
  }
  if ((has & 2) != 0)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", self->_durationSeconds));
    objc_msgSend(v3, "setObject:forKey:", v6, CFSTR("duration_seconds"));

  }
  v7 = PBRepeatedUInt32NSArray(&self->_oosStateCounts);
  v8 = (void *)objc_claimAutoreleasedReturnValue(v7);
  objc_msgSend(v3, "setObject:forKey:", v8, CFSTR("oos_state_count"));

  v9 = PBRepeatedUInt32NSArray(&self->_oosStateDurationMs);
  v10 = (void *)objc_claimAutoreleasedReturnValue(v9);
  objc_msgSend(v3, "setObject:forKey:", v10, CFSTR("oos_state_duration_ms"));

  if (-[NSMutableArray count](self->_recoverHists, "count"))
  {
    v11 = objc_msgSend(objc_alloc((Class)NSMutableArray), "initWithCapacity:", -[NSMutableArray count](self->_recoverHists, "count"));
    v22 = 0u;
    v23 = 0u;
    v24 = 0u;
    v25 = 0u;
    v12 = self->_recoverHists;
    v13 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v12, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
    if (v13)
    {
      v14 = v13;
      v15 = *(_QWORD *)v23;
      do
      {
        for (i = 0; i != v14; i = (char *)i + 1)
        {
          if (*(_QWORD *)v23 != v15)
            objc_enumerationMutation(v12);
          v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(*((_QWORD *)&v22 + 1) + 8 * (_QWORD)i), "dictionaryRepresentation", (_QWORD)v22));
          objc_msgSend(v11, "addObject:", v17);

        }
        v14 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v12, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
      }
      while (v14);
    }

    objc_msgSend(v3, "setObject:forKey:", v11, CFSTR("recover_hist"));
  }
  v18 = PBRepeatedUInt32NSArray(&self->_oosToOosCounts);
  v19 = (void *)objc_claimAutoreleasedReturnValue(v18);
  objc_msgSend(v3, "setObject:forKey:", v19, CFSTR("oos_to_oos_count"));

  if ((*(_BYTE *)&self->_has & 4) != 0)
  {
    v20 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", self->_version));
    objc_msgSend(v3, "setObject:forKey:", v20, CFSTR("version"));

  }
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return sub_1000D2B0C((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4;
  void *v5;
  char has;
  unint64_t v7;
  unint64_t v8;
  NSMutableArray *v9;
  id v10;
  id v11;
  uint64_t v12;
  void *i;
  unint64_t v14;
  uint64_t v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];

  v4 = a3;
  v5 = v4;
  has = (char)self->_has;
  if ((has & 1) != 0)
  {
    PBDataWriterWriteUint64Field(v4, self->_timestamp, 1);
    has = (char)self->_has;
  }
  if ((has & 2) != 0)
    PBDataWriterWriteUint32Field(v5, self->_durationSeconds, 2);
  if (self->_oosStateCounts.count)
  {
    v7 = 0;
    do
      PBDataWriterWriteUint32Field(v5, self->_oosStateCounts.list[v7++], 3);
    while (v7 < self->_oosStateCounts.count);
  }
  if (self->_oosStateDurationMs.count)
  {
    v8 = 0;
    do
      PBDataWriterWriteUint32Field(v5, self->_oosStateDurationMs.list[v8++], 4);
    while (v8 < self->_oosStateDurationMs.count);
  }
  v18 = 0u;
  v19 = 0u;
  v16 = 0u;
  v17 = 0u;
  v9 = self->_recoverHists;
  v10 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v9, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
  if (v10)
  {
    v11 = v10;
    v12 = *(_QWORD *)v17;
    do
    {
      for (i = 0; i != v11; i = (char *)i + 1)
      {
        if (*(_QWORD *)v17 != v12)
          objc_enumerationMutation(v9);
        PBDataWriterWriteSubmessage(v5, *(_QWORD *)(*((_QWORD *)&v16 + 1) + 8 * (_QWORD)i), 6);
      }
      v11 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v9, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    }
    while (v11);
  }

  if (self->_oosToOosCounts.count)
  {
    v15 = 0;
    PBDataWriterPlaceMark(v5, &v15, 9);
    if (self->_oosToOosCounts.count)
    {
      v14 = 0;
      do
        PBDataWriterWriteUint32Field(v5, self->_oosToOosCounts.list[v14++], 0xFFFFFFFFLL);
      while (v14 < self->_oosToOosCounts.count);
    }
    PBDataWriterRecallMark(v5, &v15);
  }
  if ((*(_BYTE *)&self->_has & 4) != 0)
    PBDataWriterWriteUint32Field(v5, self->_version, 64);

}

- (void)copyTo:(id)a3
{
  _QWORD *v4;
  char has;
  unint64_t v6;
  unint64_t v7;
  uint64_t i;
  unint64_t v9;
  unint64_t v10;
  uint64_t j;
  unint64_t v12;
  unint64_t v13;
  uint64_t k;
  void *v15;
  unint64_t v16;
  unint64_t v17;
  uint64_t m;
  id v19;

  v4 = a3;
  has = (char)self->_has;
  if ((has & 1) != 0)
  {
    v4[10] = self->_timestamp;
    *((_BYTE *)v4 + 108) |= 1u;
    has = (char)self->_has;
  }
  if ((has & 2) != 0)
  {
    *((_DWORD *)v4 + 22) = self->_durationSeconds;
    *((_BYTE *)v4 + 108) |= 2u;
  }
  v19 = v4;
  if (-[CellularLmapoOosHist oosStateCountsCount](self, "oosStateCountsCount"))
  {
    objc_msgSend(v19, "clearOosStateCounts");
    v6 = -[CellularLmapoOosHist oosStateCountsCount](self, "oosStateCountsCount");
    if (v6)
    {
      v7 = v6;
      for (i = 0; i != v7; ++i)
        objc_msgSend(v19, "addOosStateCount:", -[CellularLmapoOosHist oosStateCountAtIndex:](self, "oosStateCountAtIndex:", i));
    }
  }
  if (-[CellularLmapoOosHist oosStateDurationMsCount](self, "oosStateDurationMsCount"))
  {
    objc_msgSend(v19, "clearOosStateDurationMs");
    v9 = -[CellularLmapoOosHist oosStateDurationMsCount](self, "oosStateDurationMsCount");
    if (v9)
    {
      v10 = v9;
      for (j = 0; j != v10; ++j)
        objc_msgSend(v19, "addOosStateDurationMs:", -[CellularLmapoOosHist oosStateDurationMsAtIndex:](self, "oosStateDurationMsAtIndex:", j));
    }
  }
  if (-[CellularLmapoOosHist recoverHistsCount](self, "recoverHistsCount"))
  {
    objc_msgSend(v19, "clearRecoverHists");
    v12 = -[CellularLmapoOosHist recoverHistsCount](self, "recoverHistsCount");
    if (v12)
    {
      v13 = v12;
      for (k = 0; k != v13; ++k)
      {
        v15 = (void *)objc_claimAutoreleasedReturnValue(-[CellularLmapoOosHist recoverHistAtIndex:](self, "recoverHistAtIndex:", k));
        objc_msgSend(v19, "addRecoverHist:", v15);

      }
    }
  }
  if (-[CellularLmapoOosHist oosToOosCountsCount](self, "oosToOosCountsCount"))
  {
    objc_msgSend(v19, "clearOosToOosCounts");
    v16 = -[CellularLmapoOosHist oosToOosCountsCount](self, "oosToOosCountsCount");
    if (v16)
    {
      v17 = v16;
      for (m = 0; m != v17; ++m)
        objc_msgSend(v19, "addOosToOosCount:", -[CellularLmapoOosHist oosToOosCountAtIndex:](self, "oosToOosCountAtIndex:", m));
    }
  }
  if ((*(_BYTE *)&self->_has & 4) != 0)
  {
    *((_DWORD *)v19 + 26) = self->_version;
    *((_BYTE *)v19 + 108) |= 4u;
  }

}

- (id)copyWithZone:(_NSZone *)a3
{
  char *v5;
  char *v6;
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

  v5 = (char *)objc_msgSend(objc_msgSend((id)objc_opt_class(self, a2), "allocWithZone:", a3), "init");
  v6 = v5;
  has = (char)self->_has;
  if ((has & 1) != 0)
  {
    *((_QWORD *)v5 + 10) = self->_timestamp;
    v5[108] |= 1u;
    has = (char)self->_has;
  }
  if ((has & 2) != 0)
  {
    *((_DWORD *)v5 + 22) = self->_durationSeconds;
    v5[108] |= 2u;
  }
  PBRepeatedUInt32Copy(v5 + 8, &self->_oosStateCounts);
  PBRepeatedUInt32Copy(v6 + 32, &self->_oosStateDurationMs);
  v17 = 0u;
  v18 = 0u;
  v15 = 0u;
  v16 = 0u;
  v8 = self->_recoverHists;
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
        objc_msgSend(v6, "addRecoverHist:", v13);

      }
      v10 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v8, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    }
    while (v10);
  }

  PBRepeatedUInt32Copy(v6 + 56, &self->_oosToOosCounts);
  if ((*(_BYTE *)&self->_has & 4) != 0)
  {
    *((_DWORD *)v6 + 26) = self->_version;
    v6[108] |= 4u;
  }
  return v6;
}

- (BOOL)isEqual:(id)a3
{
  char *v4;
  uint64_t v5;
  NSMutableArray *recoverHists;
  BOOL v7;

  v4 = (char *)a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class(self, v5)))
    goto LABEL_21;
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    if ((v4[108] & 1) == 0 || self->_timestamp != *((_QWORD *)v4 + 10))
      goto LABEL_21;
  }
  else if ((v4[108] & 1) != 0)
  {
LABEL_21:
    v7 = 0;
    goto LABEL_22;
  }
  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
    if ((v4[108] & 2) == 0 || self->_durationSeconds != *((_DWORD *)v4 + 22))
      goto LABEL_21;
  }
  else if ((v4[108] & 2) != 0)
  {
    goto LABEL_21;
  }
  if (!PBRepeatedUInt32IsEqual(&self->_oosStateCounts, v4 + 8))
    goto LABEL_21;
  if (!PBRepeatedUInt32IsEqual(&self->_oosStateDurationMs, v4 + 32))
    goto LABEL_21;
  recoverHists = self->_recoverHists;
  if ((unint64_t)recoverHists | *((_QWORD *)v4 + 12))
  {
    if (!-[NSMutableArray isEqual:](recoverHists, "isEqual:"))
      goto LABEL_21;
  }
  if (!PBRepeatedUInt32IsEqual(&self->_oosToOosCounts, v4 + 56))
    goto LABEL_21;
  v7 = (v4[108] & 4) == 0;
  if ((*(_BYTE *)&self->_has & 4) != 0)
  {
    if ((v4[108] & 4) == 0 || self->_version != *((_DWORD *)v4 + 26))
      goto LABEL_21;
    v7 = 1;
  }
LABEL_22:

  return v7;
}

- (unint64_t)hash
{
  unint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  unint64_t v7;
  uint64_t v8;
  uint64_t v9;

  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    v3 = 2654435761u * self->_timestamp;
    if ((*(_BYTE *)&self->_has & 2) != 0)
      goto LABEL_3;
  }
  else
  {
    v3 = 0;
    if ((*(_BYTE *)&self->_has & 2) != 0)
    {
LABEL_3:
      v4 = 2654435761 * self->_durationSeconds;
      goto LABEL_6;
    }
  }
  v4 = 0;
LABEL_6:
  v5 = PBRepeatedUInt32Hash(&self->_oosStateCounts);
  v6 = PBRepeatedUInt32Hash(&self->_oosStateDurationMs);
  v7 = (unint64_t)-[NSMutableArray hash](self->_recoverHists, "hash");
  v8 = PBRepeatedUInt32Hash(&self->_oosToOosCounts);
  if ((*(_BYTE *)&self->_has & 4) != 0)
    v9 = 2654435761 * self->_version;
  else
    v9 = 0;
  return v4 ^ v3 ^ v5 ^ v6 ^ v8 ^ v9 ^ v7;
}

- (void)mergeFrom:(id)a3
{
  id v4;
  id v5;
  char v6;
  char *v7;
  char *v8;
  char *i;
  char *v10;
  char *v11;
  char *j;
  id v13;
  id v14;
  id v15;
  uint64_t v16;
  void *k;
  char *v18;
  char *v19;
  char *m;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  _BYTE v25[128];

  v4 = a3;
  v5 = v4;
  v6 = *((_BYTE *)v4 + 108);
  if ((v6 & 1) != 0)
  {
    self->_timestamp = *((_QWORD *)v4 + 10);
    *(_BYTE *)&self->_has |= 1u;
    v6 = *((_BYTE *)v4 + 108);
  }
  if ((v6 & 2) != 0)
  {
    self->_durationSeconds = *((_DWORD *)v4 + 22);
    *(_BYTE *)&self->_has |= 2u;
  }
  v7 = (char *)objc_msgSend(v4, "oosStateCountsCount");
  if (v7)
  {
    v8 = v7;
    for (i = 0; i != v8; ++i)
      -[CellularLmapoOosHist addOosStateCount:](self, "addOosStateCount:", objc_msgSend(v5, "oosStateCountAtIndex:", i));
  }
  v10 = (char *)objc_msgSend(v5, "oosStateDurationMsCount");
  if (v10)
  {
    v11 = v10;
    for (j = 0; j != v11; ++j)
      -[CellularLmapoOosHist addOosStateDurationMs:](self, "addOosStateDurationMs:", objc_msgSend(v5, "oosStateDurationMsAtIndex:", j));
  }
  v23 = 0u;
  v24 = 0u;
  v21 = 0u;
  v22 = 0u;
  v13 = *((id *)v5 + 12);
  v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
  if (v14)
  {
    v15 = v14;
    v16 = *(_QWORD *)v22;
    do
    {
      for (k = 0; k != v15; k = (char *)k + 1)
      {
        if (*(_QWORD *)v22 != v16)
          objc_enumerationMutation(v13);
        -[CellularLmapoOosHist addRecoverHist:](self, "addRecoverHist:", *(_QWORD *)(*((_QWORD *)&v21 + 1) + 8 * (_QWORD)k), (_QWORD)v21);
      }
      v15 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
    }
    while (v15);
  }

  v18 = (char *)objc_msgSend(v5, "oosToOosCountsCount");
  if (v18)
  {
    v19 = v18;
    for (m = 0; m != v19; ++m)
      -[CellularLmapoOosHist addOosToOosCount:](self, "addOosToOosCount:", objc_msgSend(v5, "oosToOosCountAtIndex:", m, (_QWORD)v21));
  }
  if ((*((_BYTE *)v5 + 108) & 4) != 0)
  {
    self->_version = *((_DWORD *)v5 + 26);
    *(_BYTE *)&self->_has |= 4u;
  }

}

- (unint64_t)timestamp
{
  return self->_timestamp;
}

- (unsigned)durationSeconds
{
  return self->_durationSeconds;
}

- (NSMutableArray)recoverHists
{
  return self->_recoverHists;
}

- (void)setRecoverHists:(id)a3
{
  objc_storeStrong((id *)&self->_recoverHists, a3);
}

- (unsigned)version
{
  return self->_version;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_recoverHists, 0);
}

@end
