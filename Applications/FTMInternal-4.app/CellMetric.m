@implementation CellMetric

- (void)dealloc
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  objc_super v6;

  PBRepeatedUInt32Clear(&self->_sfScheduledByStates, a2);
  PBRepeatedUInt64Clear(&self->_sizeTbTotalByStates);
  PBRepeatedUInt32Clear(&self->_sfScheduledByTypes, v3);
  PBRepeatedUInt64Clear(&self->_sizeTbTotalByTypes);
  PBRepeatedUInt32Clear(&self->_ulSfScheduledByStates, v4);
  PBRepeatedUInt64Clear(&self->_ulSizeTbTotalByStates);
  PBRepeatedUInt32Clear(&self->_ulSfScheduledByTypes, v5);
  PBRepeatedUInt64Clear(&self->_ulSizeTbTotalByTypes);
  v6.receiver = self;
  v6.super_class = (Class)CellMetric;
  -[CellMetric dealloc](&v6, "dealloc");
}

- (void)setElapsedMs:(unsigned int)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_elapsedMs = a3;
}

- (void)setHasElapsedMs:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (BOOL)hasElapsedMs
{
  return *(_BYTE *)&self->_has & 1;
}

- (void)setWakeupMs:(unsigned int)a3
{
  *(_BYTE *)&self->_has |= 2u;
  self->_wakeupMs = a3;
}

- (void)setHasWakeupMs:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFD | v3;
}

- (BOOL)hasWakeupMs
{
  return (*(_BYTE *)&self->_has >> 1) & 1;
}

- (unint64_t)sfScheduledByStatesCount
{
  return self->_sfScheduledByStates.count;
}

- (unsigned)sfScheduledByStates
{
  return self->_sfScheduledByStates.list;
}

- (void)clearSfScheduledByStates
{
  PBRepeatedUInt32Clear(&self->_sfScheduledByStates, a2);
}

- (void)addSfScheduledByState:(unsigned int)a3
{
  PBRepeatedUInt32Add(&self->_sfScheduledByStates, *(_QWORD *)&a3);
}

- (unsigned)sfScheduledByStateAtIndex:(unint64_t)a3
{
  $1729E44CE8A3ADE0AA70C2F19EF2BB02 *p_sfScheduledByStates;
  unint64_t count;
  void *v6;
  void *v7;

  p_sfScheduledByStates = &self->_sfScheduledByStates;
  count = self->_sfScheduledByStates.count;
  if (count <= a3)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("idx (%tu) is out of range (%tu)"), a3, count));
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSException exceptionWithName:reason:userInfo:](NSException, "exceptionWithName:reason:userInfo:", NSRangeException, v6, 0));
    objc_msgSend(v7, "raise");

  }
  return p_sfScheduledByStates->list[a3];
}

- (void)setSfScheduledByStates:(unsigned int *)a3 count:(unint64_t)a4
{
  PBRepeatedUInt32Set(&self->_sfScheduledByStates, a3, a4);
}

- (unint64_t)sizeTbTotalByStatesCount
{
  return self->_sizeTbTotalByStates.count;
}

- (unint64_t)sizeTbTotalByStates
{
  return self->_sizeTbTotalByStates.list;
}

- (void)clearSizeTbTotalByStates
{
  PBRepeatedUInt64Clear(&self->_sizeTbTotalByStates);
}

- (void)addSizeTbTotalByState:(unint64_t)a3
{
  PBRepeatedUInt64Add(&self->_sizeTbTotalByStates, a3);
}

- (unint64_t)sizeTbTotalByStateAtIndex:(unint64_t)a3
{
  $D9041E0417540B7714261C3B5E8BB314 *p_sizeTbTotalByStates;
  unint64_t count;
  void *v6;
  void *v7;

  p_sizeTbTotalByStates = &self->_sizeTbTotalByStates;
  count = self->_sizeTbTotalByStates.count;
  if (count <= a3)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("idx (%tu) is out of range (%tu)"), a3, count));
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSException exceptionWithName:reason:userInfo:](NSException, "exceptionWithName:reason:userInfo:", NSRangeException, v6, 0));
    objc_msgSend(v7, "raise");

  }
  return p_sizeTbTotalByStates->list[a3];
}

- (void)setSizeTbTotalByStates:(unint64_t *)a3 count:(unint64_t)a4
{
  PBRepeatedUInt64Set(&self->_sizeTbTotalByStates, a3, a4);
}

- (unint64_t)sfScheduledByTypesCount
{
  return self->_sfScheduledByTypes.count;
}

- (unsigned)sfScheduledByTypes
{
  return self->_sfScheduledByTypes.list;
}

- (void)clearSfScheduledByTypes
{
  PBRepeatedUInt32Clear(&self->_sfScheduledByTypes, a2);
}

- (void)addSfScheduledByType:(unsigned int)a3
{
  PBRepeatedUInt32Add(&self->_sfScheduledByTypes, *(_QWORD *)&a3);
}

- (unsigned)sfScheduledByTypeAtIndex:(unint64_t)a3
{
  $1729E44CE8A3ADE0AA70C2F19EF2BB02 *p_sfScheduledByTypes;
  unint64_t count;
  void *v6;
  void *v7;

  p_sfScheduledByTypes = &self->_sfScheduledByTypes;
  count = self->_sfScheduledByTypes.count;
  if (count <= a3)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("idx (%tu) is out of range (%tu)"), a3, count));
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSException exceptionWithName:reason:userInfo:](NSException, "exceptionWithName:reason:userInfo:", NSRangeException, v6, 0));
    objc_msgSend(v7, "raise");

  }
  return p_sfScheduledByTypes->list[a3];
}

- (void)setSfScheduledByTypes:(unsigned int *)a3 count:(unint64_t)a4
{
  PBRepeatedUInt32Set(&self->_sfScheduledByTypes, a3, a4);
}

- (unint64_t)sizeTbTotalByTypesCount
{
  return self->_sizeTbTotalByTypes.count;
}

- (unint64_t)sizeTbTotalByTypes
{
  return self->_sizeTbTotalByTypes.list;
}

- (void)clearSizeTbTotalByTypes
{
  PBRepeatedUInt64Clear(&self->_sizeTbTotalByTypes);
}

- (void)addSizeTbTotalByType:(unint64_t)a3
{
  PBRepeatedUInt64Add(&self->_sizeTbTotalByTypes, a3);
}

- (unint64_t)sizeTbTotalByTypeAtIndex:(unint64_t)a3
{
  $D9041E0417540B7714261C3B5E8BB314 *p_sizeTbTotalByTypes;
  unint64_t count;
  void *v6;
  void *v7;

  p_sizeTbTotalByTypes = &self->_sizeTbTotalByTypes;
  count = self->_sizeTbTotalByTypes.count;
  if (count <= a3)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("idx (%tu) is out of range (%tu)"), a3, count));
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSException exceptionWithName:reason:userInfo:](NSException, "exceptionWithName:reason:userInfo:", NSRangeException, v6, 0));
    objc_msgSend(v7, "raise");

  }
  return p_sizeTbTotalByTypes->list[a3];
}

- (void)setSizeTbTotalByTypes:(unint64_t *)a3 count:(unint64_t)a4
{
  PBRepeatedUInt64Set(&self->_sizeTbTotalByTypes, a3, a4);
}

- (unint64_t)ulSfScheduledByStatesCount
{
  return self->_ulSfScheduledByStates.count;
}

- (unsigned)ulSfScheduledByStates
{
  return self->_ulSfScheduledByStates.list;
}

- (void)clearUlSfScheduledByStates
{
  PBRepeatedUInt32Clear(&self->_ulSfScheduledByStates, a2);
}

- (void)addUlSfScheduledByState:(unsigned int)a3
{
  PBRepeatedUInt32Add(&self->_ulSfScheduledByStates, *(_QWORD *)&a3);
}

- (unsigned)ulSfScheduledByStateAtIndex:(unint64_t)a3
{
  $1729E44CE8A3ADE0AA70C2F19EF2BB02 *p_ulSfScheduledByStates;
  unint64_t count;
  void *v6;
  void *v7;

  p_ulSfScheduledByStates = &self->_ulSfScheduledByStates;
  count = self->_ulSfScheduledByStates.count;
  if (count <= a3)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("idx (%tu) is out of range (%tu)"), a3, count));
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSException exceptionWithName:reason:userInfo:](NSException, "exceptionWithName:reason:userInfo:", NSRangeException, v6, 0));
    objc_msgSend(v7, "raise");

  }
  return p_ulSfScheduledByStates->list[a3];
}

- (void)setUlSfScheduledByStates:(unsigned int *)a3 count:(unint64_t)a4
{
  PBRepeatedUInt32Set(&self->_ulSfScheduledByStates, a3, a4);
}

- (unint64_t)ulSizeTbTotalByStatesCount
{
  return self->_ulSizeTbTotalByStates.count;
}

- (unint64_t)ulSizeTbTotalByStates
{
  return self->_ulSizeTbTotalByStates.list;
}

- (void)clearUlSizeTbTotalByStates
{
  PBRepeatedUInt64Clear(&self->_ulSizeTbTotalByStates);
}

- (void)addUlSizeTbTotalByState:(unint64_t)a3
{
  PBRepeatedUInt64Add(&self->_ulSizeTbTotalByStates, a3);
}

- (unint64_t)ulSizeTbTotalByStateAtIndex:(unint64_t)a3
{
  $D9041E0417540B7714261C3B5E8BB314 *p_ulSizeTbTotalByStates;
  unint64_t count;
  void *v6;
  void *v7;

  p_ulSizeTbTotalByStates = &self->_ulSizeTbTotalByStates;
  count = self->_ulSizeTbTotalByStates.count;
  if (count <= a3)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("idx (%tu) is out of range (%tu)"), a3, count));
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSException exceptionWithName:reason:userInfo:](NSException, "exceptionWithName:reason:userInfo:", NSRangeException, v6, 0));
    objc_msgSend(v7, "raise");

  }
  return p_ulSizeTbTotalByStates->list[a3];
}

- (void)setUlSizeTbTotalByStates:(unint64_t *)a3 count:(unint64_t)a4
{
  PBRepeatedUInt64Set(&self->_ulSizeTbTotalByStates, a3, a4);
}

- (unint64_t)ulSfScheduledByTypesCount
{
  return self->_ulSfScheduledByTypes.count;
}

- (unsigned)ulSfScheduledByTypes
{
  return self->_ulSfScheduledByTypes.list;
}

- (void)clearUlSfScheduledByTypes
{
  PBRepeatedUInt32Clear(&self->_ulSfScheduledByTypes, a2);
}

- (void)addUlSfScheduledByType:(unsigned int)a3
{
  PBRepeatedUInt32Add(&self->_ulSfScheduledByTypes, *(_QWORD *)&a3);
}

- (unsigned)ulSfScheduledByTypeAtIndex:(unint64_t)a3
{
  $1729E44CE8A3ADE0AA70C2F19EF2BB02 *p_ulSfScheduledByTypes;
  unint64_t count;
  void *v6;
  void *v7;

  p_ulSfScheduledByTypes = &self->_ulSfScheduledByTypes;
  count = self->_ulSfScheduledByTypes.count;
  if (count <= a3)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("idx (%tu) is out of range (%tu)"), a3, count));
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSException exceptionWithName:reason:userInfo:](NSException, "exceptionWithName:reason:userInfo:", NSRangeException, v6, 0));
    objc_msgSend(v7, "raise");

  }
  return p_ulSfScheduledByTypes->list[a3];
}

- (void)setUlSfScheduledByTypes:(unsigned int *)a3 count:(unint64_t)a4
{
  PBRepeatedUInt32Set(&self->_ulSfScheduledByTypes, a3, a4);
}

- (unint64_t)ulSizeTbTotalByTypesCount
{
  return self->_ulSizeTbTotalByTypes.count;
}

- (unint64_t)ulSizeTbTotalByTypes
{
  return self->_ulSizeTbTotalByTypes.list;
}

- (void)clearUlSizeTbTotalByTypes
{
  PBRepeatedUInt64Clear(&self->_ulSizeTbTotalByTypes);
}

- (void)addUlSizeTbTotalByType:(unint64_t)a3
{
  PBRepeatedUInt64Add(&self->_ulSizeTbTotalByTypes, a3);
}

- (unint64_t)ulSizeTbTotalByTypeAtIndex:(unint64_t)a3
{
  $D9041E0417540B7714261C3B5E8BB314 *p_ulSizeTbTotalByTypes;
  unint64_t count;
  void *v6;
  void *v7;

  p_ulSizeTbTotalByTypes = &self->_ulSizeTbTotalByTypes;
  count = self->_ulSizeTbTotalByTypes.count;
  if (count <= a3)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("idx (%tu) is out of range (%tu)"), a3, count));
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSException exceptionWithName:reason:userInfo:](NSException, "exceptionWithName:reason:userInfo:", NSRangeException, v6, 0));
    objc_msgSend(v7, "raise");

  }
  return p_ulSizeTbTotalByTypes->list[a3];
}

- (void)setUlSizeTbTotalByTypes:(unint64_t *)a3 count:(unint64_t)a4
{
  PBRepeatedUInt64Set(&self->_ulSizeTbTotalByTypes, a3, a4);
}

- (id)description
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)CellMetric;
  v3 = -[CellMetric description](&v8, "description");
  v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[CellMetric dictionaryRepresentation](self, "dictionaryRepresentation"));
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
  uint64_t v11;
  void *v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  void *v18;
  uint64_t v19;
  void *v20;
  uint64_t v21;
  void *v22;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary"));
  has = (char)self->_has;
  if ((has & 1) != 0)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", self->_elapsedMs));
    objc_msgSend(v3, "setObject:forKey:", v5, CFSTR("elapsed_ms"));

    has = (char)self->_has;
  }
  if ((has & 2) != 0)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", self->_wakeupMs));
    objc_msgSend(v3, "setObject:forKey:", v6, CFSTR("wakeup_ms"));

  }
  v7 = PBRepeatedUInt32NSArray(&self->_sfScheduledByStates);
  v8 = (void *)objc_claimAutoreleasedReturnValue(v7);
  objc_msgSend(v3, "setObject:forKey:", v8, CFSTR("sf_scheduled_by_state"));

  v9 = PBRepeatedUInt64NSArray(&self->_sizeTbTotalByStates);
  v10 = (void *)objc_claimAutoreleasedReturnValue(v9);
  objc_msgSend(v3, "setObject:forKey:", v10, CFSTR("size_tb_total_by_state"));

  v11 = PBRepeatedUInt32NSArray(&self->_sfScheduledByTypes);
  v12 = (void *)objc_claimAutoreleasedReturnValue(v11);
  objc_msgSend(v3, "setObject:forKey:", v12, CFSTR("sf_scheduled_by_type"));

  v13 = PBRepeatedUInt64NSArray(&self->_sizeTbTotalByTypes);
  v14 = (void *)objc_claimAutoreleasedReturnValue(v13);
  objc_msgSend(v3, "setObject:forKey:", v14, CFSTR("size_tb_total_by_type"));

  v15 = PBRepeatedUInt32NSArray(&self->_ulSfScheduledByStates);
  v16 = (void *)objc_claimAutoreleasedReturnValue(v15);
  objc_msgSend(v3, "setObject:forKey:", v16, CFSTR("ul_sf_scheduled_by_state"));

  v17 = PBRepeatedUInt64NSArray(&self->_ulSizeTbTotalByStates);
  v18 = (void *)objc_claimAutoreleasedReturnValue(v17);
  objc_msgSend(v3, "setObject:forKey:", v18, CFSTR("ul_size_tb_total_by_state"));

  v19 = PBRepeatedUInt32NSArray(&self->_ulSfScheduledByTypes);
  v20 = (void *)objc_claimAutoreleasedReturnValue(v19);
  objc_msgSend(v3, "setObject:forKey:", v20, CFSTR("ul_sf_scheduled_by_type"));

  v21 = PBRepeatedUInt64NSArray(&self->_ulSizeTbTotalByTypes);
  v22 = (void *)objc_claimAutoreleasedReturnValue(v21);
  objc_msgSend(v3, "setObject:forKey:", v22, CFSTR("ul_size_tb_total_by_type"));

  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return sub_1000A1DC8((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4;
  char has;
  unint64_t v6;
  unint64_t v7;
  unint64_t v8;
  unint64_t v9;
  unint64_t v10;
  unint64_t v11;
  unint64_t v12;
  $D9041E0417540B7714261C3B5E8BB314 *p_ulSizeTbTotalByTypes;
  unint64_t v14;
  id v15;

  v4 = a3;
  has = (char)self->_has;
  v15 = v4;
  if ((has & 1) != 0)
  {
    PBDataWriterWriteUint32Field(v4, self->_elapsedMs, 1);
    v4 = v15;
    has = (char)self->_has;
  }
  if ((has & 2) != 0)
  {
    PBDataWriterWriteUint32Field(v15, self->_wakeupMs, 2);
    v4 = v15;
  }
  if (self->_sfScheduledByStates.count)
  {
    v6 = 0;
    do
    {
      PBDataWriterWriteUint32Field(v15, self->_sfScheduledByStates.list[v6], 5);
      v4 = v15;
      ++v6;
    }
    while (v6 < self->_sfScheduledByStates.count);
  }
  if (self->_sizeTbTotalByStates.count)
  {
    v7 = 0;
    do
    {
      PBDataWriterWriteUint64Field(v15, self->_sizeTbTotalByStates.list[v7], 6);
      v4 = v15;
      ++v7;
    }
    while (v7 < self->_sizeTbTotalByStates.count);
  }
  if (self->_sfScheduledByTypes.count)
  {
    v8 = 0;
    do
    {
      PBDataWriterWriteUint32Field(v15, self->_sfScheduledByTypes.list[v8], 7);
      v4 = v15;
      ++v8;
    }
    while (v8 < self->_sfScheduledByTypes.count);
  }
  if (self->_sizeTbTotalByTypes.count)
  {
    v9 = 0;
    do
    {
      PBDataWriterWriteUint64Field(v15, self->_sizeTbTotalByTypes.list[v9], 8);
      v4 = v15;
      ++v9;
    }
    while (v9 < self->_sizeTbTotalByTypes.count);
  }
  if (self->_ulSfScheduledByStates.count)
  {
    v10 = 0;
    do
    {
      PBDataWriterWriteUint32Field(v15, self->_ulSfScheduledByStates.list[v10], 9);
      v4 = v15;
      ++v10;
    }
    while (v10 < self->_ulSfScheduledByStates.count);
  }
  if (self->_ulSizeTbTotalByStates.count)
  {
    v11 = 0;
    do
    {
      PBDataWriterWriteUint64Field(v15, self->_ulSizeTbTotalByStates.list[v11], 10);
      v4 = v15;
      ++v11;
    }
    while (v11 < self->_ulSizeTbTotalByStates.count);
  }
  if (self->_ulSfScheduledByTypes.count)
  {
    v12 = 0;
    do
    {
      PBDataWriterWriteUint32Field(v15, self->_ulSfScheduledByTypes.list[v12], 11);
      v4 = v15;
      ++v12;
    }
    while (v12 < self->_ulSfScheduledByTypes.count);
  }
  p_ulSizeTbTotalByTypes = &self->_ulSizeTbTotalByTypes;
  if (p_ulSizeTbTotalByTypes->count)
  {
    v14 = 0;
    do
    {
      PBDataWriterWriteUint64Field(v15, p_ulSizeTbTotalByTypes->list[v14], 12);
      v4 = v15;
      ++v14;
    }
    while (v14 < p_ulSizeTbTotalByTypes->count);
  }

}

- (void)copyTo:(id)a3
{
  _DWORD *v4;
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
  unint64_t v15;
  unint64_t v16;
  uint64_t m;
  unint64_t v18;
  unint64_t v19;
  uint64_t n;
  unint64_t v21;
  unint64_t v22;
  uint64_t ii;
  unint64_t v24;
  unint64_t v25;
  uint64_t jj;
  unint64_t v27;
  unint64_t v28;
  uint64_t kk;
  id v30;

  v4 = a3;
  has = (char)self->_has;
  if ((has & 1) != 0)
  {
    v4[50] = self->_elapsedMs;
    *((_BYTE *)v4 + 208) |= 1u;
    has = (char)self->_has;
  }
  if ((has & 2) != 0)
  {
    v4[51] = self->_wakeupMs;
    *((_BYTE *)v4 + 208) |= 2u;
  }
  v30 = v4;
  if (-[CellMetric sfScheduledByStatesCount](self, "sfScheduledByStatesCount"))
  {
    objc_msgSend(v30, "clearSfScheduledByStates");
    v6 = -[CellMetric sfScheduledByStatesCount](self, "sfScheduledByStatesCount");
    if (v6)
    {
      v7 = v6;
      for (i = 0; i != v7; ++i)
        objc_msgSend(v30, "addSfScheduledByState:", -[CellMetric sfScheduledByStateAtIndex:](self, "sfScheduledByStateAtIndex:", i));
    }
  }
  if (-[CellMetric sizeTbTotalByStatesCount](self, "sizeTbTotalByStatesCount"))
  {
    objc_msgSend(v30, "clearSizeTbTotalByStates");
    v9 = -[CellMetric sizeTbTotalByStatesCount](self, "sizeTbTotalByStatesCount");
    if (v9)
    {
      v10 = v9;
      for (j = 0; j != v10; ++j)
        objc_msgSend(v30, "addSizeTbTotalByState:", -[CellMetric sizeTbTotalByStateAtIndex:](self, "sizeTbTotalByStateAtIndex:", j));
    }
  }
  if (-[CellMetric sfScheduledByTypesCount](self, "sfScheduledByTypesCount"))
  {
    objc_msgSend(v30, "clearSfScheduledByTypes");
    v12 = -[CellMetric sfScheduledByTypesCount](self, "sfScheduledByTypesCount");
    if (v12)
    {
      v13 = v12;
      for (k = 0; k != v13; ++k)
        objc_msgSend(v30, "addSfScheduledByType:", -[CellMetric sfScheduledByTypeAtIndex:](self, "sfScheduledByTypeAtIndex:", k));
    }
  }
  if (-[CellMetric sizeTbTotalByTypesCount](self, "sizeTbTotalByTypesCount"))
  {
    objc_msgSend(v30, "clearSizeTbTotalByTypes");
    v15 = -[CellMetric sizeTbTotalByTypesCount](self, "sizeTbTotalByTypesCount");
    if (v15)
    {
      v16 = v15;
      for (m = 0; m != v16; ++m)
        objc_msgSend(v30, "addSizeTbTotalByType:", -[CellMetric sizeTbTotalByTypeAtIndex:](self, "sizeTbTotalByTypeAtIndex:", m));
    }
  }
  if (-[CellMetric ulSfScheduledByStatesCount](self, "ulSfScheduledByStatesCount"))
  {
    objc_msgSend(v30, "clearUlSfScheduledByStates");
    v18 = -[CellMetric ulSfScheduledByStatesCount](self, "ulSfScheduledByStatesCount");
    if (v18)
    {
      v19 = v18;
      for (n = 0; n != v19; ++n)
        objc_msgSend(v30, "addUlSfScheduledByState:", -[CellMetric ulSfScheduledByStateAtIndex:](self, "ulSfScheduledByStateAtIndex:", n));
    }
  }
  if (-[CellMetric ulSizeTbTotalByStatesCount](self, "ulSizeTbTotalByStatesCount"))
  {
    objc_msgSend(v30, "clearUlSizeTbTotalByStates");
    v21 = -[CellMetric ulSizeTbTotalByStatesCount](self, "ulSizeTbTotalByStatesCount");
    if (v21)
    {
      v22 = v21;
      for (ii = 0; ii != v22; ++ii)
        objc_msgSend(v30, "addUlSizeTbTotalByState:", -[CellMetric ulSizeTbTotalByStateAtIndex:](self, "ulSizeTbTotalByStateAtIndex:", ii));
    }
  }
  if (-[CellMetric ulSfScheduledByTypesCount](self, "ulSfScheduledByTypesCount"))
  {
    objc_msgSend(v30, "clearUlSfScheduledByTypes");
    v24 = -[CellMetric ulSfScheduledByTypesCount](self, "ulSfScheduledByTypesCount");
    if (v24)
    {
      v25 = v24;
      for (jj = 0; jj != v25; ++jj)
        objc_msgSend(v30, "addUlSfScheduledByType:", -[CellMetric ulSfScheduledByTypeAtIndex:](self, "ulSfScheduledByTypeAtIndex:", jj));
    }
  }
  if (-[CellMetric ulSizeTbTotalByTypesCount](self, "ulSizeTbTotalByTypesCount"))
  {
    objc_msgSend(v30, "clearUlSizeTbTotalByTypes");
    v27 = -[CellMetric ulSizeTbTotalByTypesCount](self, "ulSizeTbTotalByTypesCount");
    if (v27)
    {
      v28 = v27;
      for (kk = 0; kk != v28; ++kk)
        objc_msgSend(v30, "addUlSizeTbTotalByType:", -[CellMetric ulSizeTbTotalByTypeAtIndex:](self, "ulSizeTbTotalByTypeAtIndex:", kk));
    }
  }

}

- (id)copyWithZone:(_NSZone *)a3
{
  char *v4;
  char *v5;
  char has;

  v4 = (char *)objc_msgSend(objc_msgSend((id)objc_opt_class(self, a2), "allocWithZone:", a3), "init");
  v5 = v4;
  has = (char)self->_has;
  if ((has & 1) != 0)
  {
    *((_DWORD *)v4 + 50) = self->_elapsedMs;
    v4[208] |= 1u;
    has = (char)self->_has;
  }
  if ((has & 2) != 0)
  {
    *((_DWORD *)v4 + 51) = self->_wakeupMs;
    v4[208] |= 2u;
  }
  PBRepeatedUInt32Copy(v4 + 8, &self->_sfScheduledByStates);
  PBRepeatedUInt64Copy(v5 + 56, &self->_sizeTbTotalByStates);
  PBRepeatedUInt32Copy(v5 + 32, &self->_sfScheduledByTypes);
  PBRepeatedUInt64Copy(v5 + 80, &self->_sizeTbTotalByTypes);
  PBRepeatedUInt32Copy(v5 + 104, &self->_ulSfScheduledByStates);
  PBRepeatedUInt64Copy(v5 + 152, &self->_ulSizeTbTotalByStates);
  PBRepeatedUInt32Copy(v5 + 128, &self->_ulSfScheduledByTypes);
  PBRepeatedUInt64Copy(v5 + 176, &self->_ulSizeTbTotalByTypes);
  return v5;
}

- (BOOL)isEqual:(id)a3
{
  char *v4;
  uint64_t v5;
  char IsEqual;

  v4 = (char *)a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class(self, v5)))
    goto LABEL_20;
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    if ((v4[208] & 1) == 0 || self->_elapsedMs != *((_DWORD *)v4 + 50))
      goto LABEL_20;
  }
  else if ((v4[208] & 1) != 0)
  {
LABEL_20:
    IsEqual = 0;
    goto LABEL_21;
  }
  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
    if ((v4[208] & 2) == 0 || self->_wakeupMs != *((_DWORD *)v4 + 51))
      goto LABEL_20;
  }
  else if ((v4[208] & 2) != 0)
  {
    goto LABEL_20;
  }
  if (!PBRepeatedUInt32IsEqual(&self->_sfScheduledByStates, v4 + 8)
    || !PBRepeatedUInt64IsEqual(&self->_sizeTbTotalByStates, v4 + 56)
    || !PBRepeatedUInt32IsEqual(&self->_sfScheduledByTypes, v4 + 32)
    || !PBRepeatedUInt64IsEqual(&self->_sizeTbTotalByTypes, v4 + 80)
    || !PBRepeatedUInt32IsEqual(&self->_ulSfScheduledByStates, v4 + 104)
    || !PBRepeatedUInt64IsEqual(&self->_ulSizeTbTotalByStates, v4 + 152)
    || !PBRepeatedUInt32IsEqual(&self->_ulSfScheduledByTypes, v4 + 128))
  {
    goto LABEL_20;
  }
  IsEqual = PBRepeatedUInt64IsEqual(&self->_ulSizeTbTotalByTypes, v4 + 176);
LABEL_21:

  return IsEqual;
}

- (unint64_t)hash
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;

  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    v3 = 2654435761 * self->_elapsedMs;
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
  v4 = 2654435761 * self->_wakeupMs;
LABEL_6:
  v5 = v4 ^ v3 ^ PBRepeatedUInt32Hash(&self->_sfScheduledByStates);
  v6 = PBRepeatedUInt64Hash(&self->_sizeTbTotalByStates);
  v7 = v5 ^ v6 ^ PBRepeatedUInt32Hash(&self->_sfScheduledByTypes);
  v8 = PBRepeatedUInt64Hash(&self->_sizeTbTotalByTypes);
  v9 = v8 ^ PBRepeatedUInt32Hash(&self->_ulSfScheduledByStates);
  v10 = v7 ^ v9 ^ PBRepeatedUInt64Hash(&self->_ulSizeTbTotalByStates);
  v11 = PBRepeatedUInt32Hash(&self->_ulSfScheduledByTypes);
  return v10 ^ v11 ^ PBRepeatedUInt64Hash(&self->_ulSizeTbTotalByTypes);
}

- (void)mergeFrom:(id)a3
{
  id v4;
  char v5;
  char *v6;
  char *v7;
  char *i;
  char *v9;
  char *v10;
  char *j;
  char *v12;
  char *v13;
  char *k;
  char *v15;
  char *v16;
  char *m;
  char *v18;
  char *v19;
  char *n;
  char *v21;
  char *v22;
  char *ii;
  char *v24;
  char *v25;
  char *jj;
  char *v27;
  char *v28;
  char *kk;
  id v30;

  v4 = a3;
  v5 = *((_BYTE *)v4 + 208);
  if ((v5 & 1) != 0)
  {
    self->_elapsedMs = *((_DWORD *)v4 + 50);
    *(_BYTE *)&self->_has |= 1u;
    v5 = *((_BYTE *)v4 + 208);
  }
  if ((v5 & 2) != 0)
  {
    self->_wakeupMs = *((_DWORD *)v4 + 51);
    *(_BYTE *)&self->_has |= 2u;
  }
  v30 = v4;
  v6 = (char *)objc_msgSend(v4, "sfScheduledByStatesCount");
  if (v6)
  {
    v7 = v6;
    for (i = 0; i != v7; ++i)
      -[CellMetric addSfScheduledByState:](self, "addSfScheduledByState:", objc_msgSend(v30, "sfScheduledByStateAtIndex:", i));
  }
  v9 = (char *)objc_msgSend(v30, "sizeTbTotalByStatesCount");
  if (v9)
  {
    v10 = v9;
    for (j = 0; j != v10; ++j)
      -[CellMetric addSizeTbTotalByState:](self, "addSizeTbTotalByState:", objc_msgSend(v30, "sizeTbTotalByStateAtIndex:", j));
  }
  v12 = (char *)objc_msgSend(v30, "sfScheduledByTypesCount");
  if (v12)
  {
    v13 = v12;
    for (k = 0; k != v13; ++k)
      -[CellMetric addSfScheduledByType:](self, "addSfScheduledByType:", objc_msgSend(v30, "sfScheduledByTypeAtIndex:", k));
  }
  v15 = (char *)objc_msgSend(v30, "sizeTbTotalByTypesCount");
  if (v15)
  {
    v16 = v15;
    for (m = 0; m != v16; ++m)
      -[CellMetric addSizeTbTotalByType:](self, "addSizeTbTotalByType:", objc_msgSend(v30, "sizeTbTotalByTypeAtIndex:", m));
  }
  v18 = (char *)objc_msgSend(v30, "ulSfScheduledByStatesCount");
  if (v18)
  {
    v19 = v18;
    for (n = 0; n != v19; ++n)
      -[CellMetric addUlSfScheduledByState:](self, "addUlSfScheduledByState:", objc_msgSend(v30, "ulSfScheduledByStateAtIndex:", n));
  }
  v21 = (char *)objc_msgSend(v30, "ulSizeTbTotalByStatesCount");
  if (v21)
  {
    v22 = v21;
    for (ii = 0; ii != v22; ++ii)
      -[CellMetric addUlSizeTbTotalByState:](self, "addUlSizeTbTotalByState:", objc_msgSend(v30, "ulSizeTbTotalByStateAtIndex:", ii));
  }
  v24 = (char *)objc_msgSend(v30, "ulSfScheduledByTypesCount");
  if (v24)
  {
    v25 = v24;
    for (jj = 0; jj != v25; ++jj)
      -[CellMetric addUlSfScheduledByType:](self, "addUlSfScheduledByType:", objc_msgSend(v30, "ulSfScheduledByTypeAtIndex:", jj));
  }
  v27 = (char *)objc_msgSend(v30, "ulSizeTbTotalByTypesCount");
  if (v27)
  {
    v28 = v27;
    for (kk = 0; kk != v28; ++kk)
      -[CellMetric addUlSizeTbTotalByType:](self, "addUlSizeTbTotalByType:", objc_msgSend(v30, "ulSizeTbTotalByTypeAtIndex:", kk));
  }

}

- (unsigned)elapsedMs
{
  return self->_elapsedMs;
}

- (unsigned)wakeupMs
{
  return self->_wakeupMs;
}

@end
