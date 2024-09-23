@implementation BorderDbStat

- (void)dealloc
{
  uint64_t v3;
  objc_super v4;

  PBRepeatedUInt32Clear(&self->_fetchStateDurationSecs, a2);
  PBRepeatedUInt32Clear(&self->_boundDurationSecs, v3);
  v4.receiver = self;
  v4.super_class = (Class)BorderDbStat;
  -[BorderDbStat dealloc](&v4, "dealloc");
}

- (void)setTotalDbLifeSecs:(unsigned int)a3
{
  *(_BYTE *)&self->_has |= 0x10u;
  self->_totalDbLifeSecs = a3;
}

- (void)setHasTotalDbLifeSecs:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 16;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xEF | v3;
}

- (BOOL)hasTotalDbLifeSecs
{
  return (*(_BYTE *)&self->_has >> 4) & 1;
}

- (void)setMinLifeSecs:(unsigned int)a3
{
  *(_BYTE *)&self->_has |= 8u;
  self->_minLifeSecs = a3;
}

- (void)setHasMinLifeSecs:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 8;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xF7 | v3;
}

- (BOOL)hasMinLifeSecs
{
  return (*(_BYTE *)&self->_has >> 3) & 1;
}

- (void)setMaxLifeSecs:(unsigned int)a3
{
  *(_BYTE *)&self->_has |= 4u;
  self->_maxLifeSecs = a3;
}

- (void)setHasMaxLifeSecs:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 4;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFB | v3;
}

- (BOOL)hasMaxLifeSecs
{
  return (*(_BYTE *)&self->_has >> 2) & 1;
}

- (void)setFetchCnt:(unsigned int)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_fetchCnt = a3;
}

- (void)setHasFetchCnt:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (BOOL)hasFetchCnt
{
  return *(_BYTE *)&self->_has & 1;
}

- (void)setFetchCntApWakes:(unsigned int)a3
{
  *(_BYTE *)&self->_has |= 2u;
  self->_fetchCntApWakes = a3;
}

- (void)setHasFetchCntApWakes:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFD | v3;
}

- (BOOL)hasFetchCntApWakes
{
  return (*(_BYTE *)&self->_has >> 1) & 1;
}

- (unint64_t)fetchStateDurationSecsCount
{
  return self->_fetchStateDurationSecs.count;
}

- (unsigned)fetchStateDurationSecs
{
  return self->_fetchStateDurationSecs.list;
}

- (void)clearFetchStateDurationSecs
{
  PBRepeatedUInt32Clear(&self->_fetchStateDurationSecs, a2);
}

- (void)addFetchStateDurationSecs:(unsigned int)a3
{
  PBRepeatedUInt32Add(&self->_fetchStateDurationSecs, *(_QWORD *)&a3);
}

- (unsigned)fetchStateDurationSecsAtIndex:(unint64_t)a3
{
  $1729E44CE8A3ADE0AA70C2F19EF2BB02 *p_fetchStateDurationSecs;
  unint64_t count;
  void *v6;
  void *v7;

  p_fetchStateDurationSecs = &self->_fetchStateDurationSecs;
  count = self->_fetchStateDurationSecs.count;
  if (count <= a3)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("idx (%tu) is out of range (%tu)"), a3, count));
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSException exceptionWithName:reason:userInfo:](NSException, "exceptionWithName:reason:userInfo:", NSRangeException, v6, 0));
    objc_msgSend(v7, "raise");

  }
  return p_fetchStateDurationSecs->list[a3];
}

- (void)setFetchStateDurationSecs:(unsigned int *)a3 count:(unint64_t)a4
{
  PBRepeatedUInt32Set(&self->_fetchStateDurationSecs, a3, a4);
}

- (unint64_t)boundDurationSecsCount
{
  return self->_boundDurationSecs.count;
}

- (unsigned)boundDurationSecs
{
  return self->_boundDurationSecs.list;
}

- (void)clearBoundDurationSecs
{
  PBRepeatedUInt32Clear(&self->_boundDurationSecs, a2);
}

- (void)addBoundDurationSecs:(unsigned int)a3
{
  PBRepeatedUInt32Add(&self->_boundDurationSecs, *(_QWORD *)&a3);
}

- (unsigned)boundDurationSecsAtIndex:(unint64_t)a3
{
  $1729E44CE8A3ADE0AA70C2F19EF2BB02 *p_boundDurationSecs;
  unint64_t count;
  void *v6;
  void *v7;

  p_boundDurationSecs = &self->_boundDurationSecs;
  count = self->_boundDurationSecs.count;
  if (count <= a3)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("idx (%tu) is out of range (%tu)"), a3, count));
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSException exceptionWithName:reason:userInfo:](NSException, "exceptionWithName:reason:userInfo:", NSRangeException, v6, 0));
    objc_msgSend(v7, "raise");

  }
  return p_boundDurationSecs->list[a3];
}

- (void)setBoundDurationSecs:(unsigned int *)a3 count:(unint64_t)a4
{
  PBRepeatedUInt32Set(&self->_boundDurationSecs, a3, a4);
}

- (id)description
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)BorderDbStat;
  v3 = -[BorderDbStat description](&v8, "description");
  v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[BorderDbStat dictionaryRepresentation](self, "dictionaryRepresentation"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@ %@"), v4, v5));

  return v6;
}

- (id)dictionaryRepresentation
{
  void *v3;
  char has;
  void *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v11;
  void *v12;
  void *v13;
  void *v14;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary"));
  has = (char)self->_has;
  if ((has & 0x10) != 0)
  {
    v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", self->_totalDbLifeSecs));
    objc_msgSend(v3, "setObject:forKey:", v11, CFSTR("total_db_life_secs"));

    has = (char)self->_has;
    if ((has & 8) == 0)
    {
LABEL_3:
      if ((has & 4) == 0)
        goto LABEL_4;
      goto LABEL_10;
    }
  }
  else if ((*(_BYTE *)&self->_has & 8) == 0)
  {
    goto LABEL_3;
  }
  v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", self->_minLifeSecs));
  objc_msgSend(v3, "setObject:forKey:", v12, CFSTR("min_life_secs"));

  has = (char)self->_has;
  if ((has & 4) == 0)
  {
LABEL_4:
    if ((has & 1) == 0)
      goto LABEL_5;
LABEL_11:
    v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", self->_fetchCnt));
    objc_msgSend(v3, "setObject:forKey:", v14, CFSTR("fetch_cnt"));

    if ((*(_BYTE *)&self->_has & 2) == 0)
      goto LABEL_7;
    goto LABEL_6;
  }
LABEL_10:
  v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", self->_maxLifeSecs));
  objc_msgSend(v3, "setObject:forKey:", v13, CFSTR("max_life_secs"));

  has = (char)self->_has;
  if ((has & 1) != 0)
    goto LABEL_11;
LABEL_5:
  if ((has & 2) != 0)
  {
LABEL_6:
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", self->_fetchCntApWakes));
    objc_msgSend(v3, "setObject:forKey:", v5, CFSTR("fetch_cnt_ap_wakes"));

  }
LABEL_7:
  v6 = PBRepeatedUInt32NSArray(&self->_fetchStateDurationSecs);
  v7 = (void *)objc_claimAutoreleasedReturnValue(v6);
  objc_msgSend(v3, "setObject:forKey:", v7, CFSTR("fetch_state_duration_secs"));

  v8 = PBRepeatedUInt32NSArray(&self->_boundDurationSecs);
  v9 = (void *)objc_claimAutoreleasedReturnValue(v8);
  objc_msgSend(v3, "setObject:forKey:", v9, CFSTR("bound_duration_secs"));

  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return sub_10003DAD4((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4;
  char has;
  unint64_t v6;
  $1729E44CE8A3ADE0AA70C2F19EF2BB02 *p_boundDurationSecs;
  unint64_t v8;
  id v9;

  v4 = a3;
  has = (char)self->_has;
  v9 = v4;
  if ((has & 0x10) != 0)
  {
    PBDataWriterWriteUint32Field(v4, self->_totalDbLifeSecs, 1);
    v4 = v9;
    has = (char)self->_has;
    if ((has & 8) == 0)
    {
LABEL_3:
      if ((has & 4) == 0)
        goto LABEL_4;
      goto LABEL_16;
    }
  }
  else if ((*(_BYTE *)&self->_has & 8) == 0)
  {
    goto LABEL_3;
  }
  PBDataWriterWriteUint32Field(v9, self->_minLifeSecs, 2);
  v4 = v9;
  has = (char)self->_has;
  if ((has & 4) == 0)
  {
LABEL_4:
    if ((has & 1) == 0)
      goto LABEL_5;
    goto LABEL_17;
  }
LABEL_16:
  PBDataWriterWriteUint32Field(v9, self->_maxLifeSecs, 3);
  v4 = v9;
  has = (char)self->_has;
  if ((has & 1) == 0)
  {
LABEL_5:
    if ((has & 2) == 0)
      goto LABEL_7;
    goto LABEL_6;
  }
LABEL_17:
  PBDataWriterWriteUint32Field(v9, self->_fetchCnt, 4);
  v4 = v9;
  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
LABEL_6:
    PBDataWriterWriteUint32Field(v9, self->_fetchCntApWakes, 5);
    v4 = v9;
  }
LABEL_7:
  if (self->_fetchStateDurationSecs.count)
  {
    v6 = 0;
    do
    {
      PBDataWriterWriteUint32Field(v9, self->_fetchStateDurationSecs.list[v6], 6);
      v4 = v9;
      ++v6;
    }
    while (v6 < self->_fetchStateDurationSecs.count);
  }
  p_boundDurationSecs = &self->_boundDurationSecs;
  if (p_boundDurationSecs->count)
  {
    v8 = 0;
    do
    {
      PBDataWriterWriteUint32Field(v9, p_boundDurationSecs->list[v8], 7);
      v4 = v9;
      ++v8;
    }
    while (v8 < p_boundDurationSecs->count);
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
  id v12;

  v4 = a3;
  has = (char)self->_has;
  if ((has & 0x10) != 0)
  {
    v4[18] = self->_totalDbLifeSecs;
    *((_BYTE *)v4 + 76) |= 0x10u;
    has = (char)self->_has;
    if ((has & 8) == 0)
    {
LABEL_3:
      if ((has & 4) == 0)
        goto LABEL_4;
      goto LABEL_18;
    }
  }
  else if ((*(_BYTE *)&self->_has & 8) == 0)
  {
    goto LABEL_3;
  }
  v4[17] = self->_minLifeSecs;
  *((_BYTE *)v4 + 76) |= 8u;
  has = (char)self->_has;
  if ((has & 4) == 0)
  {
LABEL_4:
    if ((has & 1) == 0)
      goto LABEL_5;
LABEL_19:
    v4[14] = self->_fetchCnt;
    *((_BYTE *)v4 + 76) |= 1u;
    if ((*(_BYTE *)&self->_has & 2) == 0)
      goto LABEL_7;
    goto LABEL_6;
  }
LABEL_18:
  v4[16] = self->_maxLifeSecs;
  *((_BYTE *)v4 + 76) |= 4u;
  has = (char)self->_has;
  if ((has & 1) != 0)
    goto LABEL_19;
LABEL_5:
  if ((has & 2) != 0)
  {
LABEL_6:
    v4[15] = self->_fetchCntApWakes;
    *((_BYTE *)v4 + 76) |= 2u;
  }
LABEL_7:
  v12 = v4;
  if (-[BorderDbStat fetchStateDurationSecsCount](self, "fetchStateDurationSecsCount"))
  {
    objc_msgSend(v12, "clearFetchStateDurationSecs");
    v6 = -[BorderDbStat fetchStateDurationSecsCount](self, "fetchStateDurationSecsCount");
    if (v6)
    {
      v7 = v6;
      for (i = 0; i != v7; ++i)
        objc_msgSend(v12, "addFetchStateDurationSecs:", -[BorderDbStat fetchStateDurationSecsAtIndex:](self, "fetchStateDurationSecsAtIndex:", i));
    }
  }
  if (-[BorderDbStat boundDurationSecsCount](self, "boundDurationSecsCount"))
  {
    objc_msgSend(v12, "clearBoundDurationSecs");
    v9 = -[BorderDbStat boundDurationSecsCount](self, "boundDurationSecsCount");
    if (v9)
    {
      v10 = v9;
      for (j = 0; j != v10; ++j)
        objc_msgSend(v12, "addBoundDurationSecs:", -[BorderDbStat boundDurationSecsAtIndex:](self, "boundDurationSecsAtIndex:", j));
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
  if ((has & 0x10) != 0)
  {
    *((_DWORD *)v4 + 18) = self->_totalDbLifeSecs;
    v4[76] |= 0x10u;
    has = (char)self->_has;
    if ((has & 8) == 0)
    {
LABEL_3:
      if ((has & 4) == 0)
        goto LABEL_4;
      goto LABEL_10;
    }
  }
  else if ((*(_BYTE *)&self->_has & 8) == 0)
  {
    goto LABEL_3;
  }
  *((_DWORD *)v4 + 17) = self->_minLifeSecs;
  v4[76] |= 8u;
  has = (char)self->_has;
  if ((has & 4) == 0)
  {
LABEL_4:
    if ((has & 1) == 0)
      goto LABEL_5;
LABEL_11:
    *((_DWORD *)v4 + 14) = self->_fetchCnt;
    v4[76] |= 1u;
    if ((*(_BYTE *)&self->_has & 2) == 0)
      goto LABEL_7;
    goto LABEL_6;
  }
LABEL_10:
  *((_DWORD *)v4 + 16) = self->_maxLifeSecs;
  v4[76] |= 4u;
  has = (char)self->_has;
  if ((has & 1) != 0)
    goto LABEL_11;
LABEL_5:
  if ((has & 2) != 0)
  {
LABEL_6:
    *((_DWORD *)v4 + 15) = self->_fetchCntApWakes;
    v4[76] |= 2u;
  }
LABEL_7:
  PBRepeatedUInt32Copy(v4 + 32, &self->_fetchStateDurationSecs);
  PBRepeatedUInt32Copy(v5 + 8, &self->_boundDurationSecs);
  return v5;
}

- (BOOL)isEqual:(id)a3
{
  char *v4;
  uint64_t v5;
  char IsEqual;

  v4 = (char *)a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class(self, v5)))
    goto LABEL_29;
  if ((*(_BYTE *)&self->_has & 0x10) != 0)
  {
    if ((v4[76] & 0x10) == 0 || self->_totalDbLifeSecs != *((_DWORD *)v4 + 18))
      goto LABEL_29;
  }
  else if ((v4[76] & 0x10) != 0)
  {
    goto LABEL_29;
  }
  if ((*(_BYTE *)&self->_has & 8) != 0)
  {
    if ((v4[76] & 8) == 0 || self->_minLifeSecs != *((_DWORD *)v4 + 17))
      goto LABEL_29;
  }
  else if ((v4[76] & 8) != 0)
  {
    goto LABEL_29;
  }
  if ((*(_BYTE *)&self->_has & 4) != 0)
  {
    if ((v4[76] & 4) == 0 || self->_maxLifeSecs != *((_DWORD *)v4 + 16))
      goto LABEL_29;
  }
  else if ((v4[76] & 4) != 0)
  {
    goto LABEL_29;
  }
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    if ((v4[76] & 1) == 0 || self->_fetchCnt != *((_DWORD *)v4 + 14))
      goto LABEL_29;
  }
  else if ((v4[76] & 1) != 0)
  {
    goto LABEL_29;
  }
  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
    if ((v4[76] & 2) == 0 || self->_fetchCntApWakes != *((_DWORD *)v4 + 15))
      goto LABEL_29;
  }
  else if ((v4[76] & 2) != 0)
  {
    goto LABEL_29;
  }
  if (!PBRepeatedUInt32IsEqual(&self->_fetchStateDurationSecs, v4 + 32))
  {
LABEL_29:
    IsEqual = 0;
    goto LABEL_30;
  }
  IsEqual = PBRepeatedUInt32IsEqual(&self->_boundDurationSecs, v4 + 8);
LABEL_30:

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

  if ((*(_BYTE *)&self->_has & 0x10) != 0)
  {
    v3 = 2654435761 * self->_totalDbLifeSecs;
    if ((*(_BYTE *)&self->_has & 8) != 0)
    {
LABEL_3:
      v4 = 2654435761 * self->_minLifeSecs;
      if ((*(_BYTE *)&self->_has & 4) != 0)
        goto LABEL_4;
      goto LABEL_9;
    }
  }
  else
  {
    v3 = 0;
    if ((*(_BYTE *)&self->_has & 8) != 0)
      goto LABEL_3;
  }
  v4 = 0;
  if ((*(_BYTE *)&self->_has & 4) != 0)
  {
LABEL_4:
    v5 = 2654435761 * self->_maxLifeSecs;
    if ((*(_BYTE *)&self->_has & 1) != 0)
      goto LABEL_5;
LABEL_10:
    v6 = 0;
    if ((*(_BYTE *)&self->_has & 2) != 0)
      goto LABEL_6;
LABEL_11:
    v7 = 0;
    goto LABEL_12;
  }
LABEL_9:
  v5 = 0;
  if ((*(_BYTE *)&self->_has & 1) == 0)
    goto LABEL_10;
LABEL_5:
  v6 = 2654435761 * self->_fetchCnt;
  if ((*(_BYTE *)&self->_has & 2) == 0)
    goto LABEL_11;
LABEL_6:
  v7 = 2654435761 * self->_fetchCntApWakes;
LABEL_12:
  v8 = v4 ^ v3 ^ v5 ^ v6 ^ v7 ^ PBRepeatedUInt32Hash(&self->_fetchStateDurationSecs);
  return v8 ^ PBRepeatedUInt32Hash(&self->_boundDurationSecs);
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
  id v12;

  v4 = a3;
  v5 = *((_BYTE *)v4 + 76);
  if ((v5 & 0x10) != 0)
  {
    self->_totalDbLifeSecs = *((_DWORD *)v4 + 18);
    *(_BYTE *)&self->_has |= 0x10u;
    v5 = *((_BYTE *)v4 + 76);
    if ((v5 & 8) == 0)
    {
LABEL_3:
      if ((v5 & 4) == 0)
        goto LABEL_4;
      goto LABEL_16;
    }
  }
  else if ((*((_BYTE *)v4 + 76) & 8) == 0)
  {
    goto LABEL_3;
  }
  self->_minLifeSecs = *((_DWORD *)v4 + 17);
  *(_BYTE *)&self->_has |= 8u;
  v5 = *((_BYTE *)v4 + 76);
  if ((v5 & 4) == 0)
  {
LABEL_4:
    if ((v5 & 1) == 0)
      goto LABEL_5;
    goto LABEL_17;
  }
LABEL_16:
  self->_maxLifeSecs = *((_DWORD *)v4 + 16);
  *(_BYTE *)&self->_has |= 4u;
  v5 = *((_BYTE *)v4 + 76);
  if ((v5 & 1) == 0)
  {
LABEL_5:
    if ((v5 & 2) == 0)
      goto LABEL_7;
    goto LABEL_6;
  }
LABEL_17:
  self->_fetchCnt = *((_DWORD *)v4 + 14);
  *(_BYTE *)&self->_has |= 1u;
  if ((*((_BYTE *)v4 + 76) & 2) != 0)
  {
LABEL_6:
    self->_fetchCntApWakes = *((_DWORD *)v4 + 15);
    *(_BYTE *)&self->_has |= 2u;
  }
LABEL_7:
  v12 = v4;
  v6 = (char *)objc_msgSend(v4, "fetchStateDurationSecsCount");
  if (v6)
  {
    v7 = v6;
    for (i = 0; i != v7; ++i)
      -[BorderDbStat addFetchStateDurationSecs:](self, "addFetchStateDurationSecs:", objc_msgSend(v12, "fetchStateDurationSecsAtIndex:", i));
  }
  v9 = (char *)objc_msgSend(v12, "boundDurationSecsCount");
  if (v9)
  {
    v10 = v9;
    for (j = 0; j != v10; ++j)
      -[BorderDbStat addBoundDurationSecs:](self, "addBoundDurationSecs:", objc_msgSend(v12, "boundDurationSecsAtIndex:", j));
  }

}

- (unsigned)totalDbLifeSecs
{
  return self->_totalDbLifeSecs;
}

- (unsigned)minLifeSecs
{
  return self->_minLifeSecs;
}

- (unsigned)maxLifeSecs
{
  return self->_maxLifeSecs;
}

- (unsigned)fetchCnt
{
  return self->_fetchCnt;
}

- (unsigned)fetchCntApWakes
{
  return self->_fetchCntApWakes;
}

@end
