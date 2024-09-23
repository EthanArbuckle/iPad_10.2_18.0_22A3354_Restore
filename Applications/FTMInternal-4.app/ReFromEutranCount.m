@implementation ReFromEutranCount

- (void)dealloc
{
  uint64_t v3;
  objc_super v4;

  PBRepeatedUInt32Clear(&self->_causeCounts, a2);
  PBRepeatedUInt32Clear(&self->_causeCountAps, v3);
  v4.receiver = self;
  v4.super_class = (Class)ReFromEutranCount;
  -[ReFromEutranCount dealloc](&v4, "dealloc");
}

- (int)destRat
{
  if ((*(_BYTE *)&self->_has & 1) != 0)
    return self->_destRat;
  else
    return 0;
}

- (void)setDestRat:(int)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_destRat = a3;
}

- (void)setHasDestRat:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (BOOL)hasDestRat
{
  return *(_BYTE *)&self->_has & 1;
}

- (id)destRatAsString:(int)a3
{
  if (a3 >= 6)
    return (id)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("(unknown: %i)"), *(_QWORD *)&a3));
  else
    return *(&off_10025F130 + a3);
}

- (int)StringAsDestRat:(id)a3
{
  id v3;
  int v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("LTE_LOG_RAT_CDMA_HRPD")) & 1) != 0)
  {
    v4 = 0;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("LTE_LOG_RAT_CDMA_1X")) & 1) != 0)
  {
    v4 = 1;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("LTE_LOG_RAT_GSM")) & 1) != 0)
  {
    v4 = 2;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("LTE_LOG_RAT_WCDMA")) & 1) != 0)
  {
    v4 = 3;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("LTE_LOG_RAT_LTE")) & 1) != 0)
  {
    v4 = 4;
  }
  else if (objc_msgSend(v3, "isEqualToString:", CFSTR("LTE_LOG_RAT_TDS")))
  {
    v4 = 5;
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (void)setTotal:(unsigned int)a3
{
  *(_BYTE *)&self->_has |= 2u;
  self->_total = a3;
}

- (void)setHasTotal:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFD | v3;
}

- (BOOL)hasTotal
{
  return (*(_BYTE *)&self->_has >> 1) & 1;
}

- (unint64_t)causeCountsCount
{
  return self->_causeCounts.count;
}

- (unsigned)causeCounts
{
  return self->_causeCounts.list;
}

- (void)clearCauseCounts
{
  PBRepeatedUInt32Clear(&self->_causeCounts, a2);
}

- (void)addCauseCount:(unsigned int)a3
{
  PBRepeatedUInt32Add(&self->_causeCounts, *(_QWORD *)&a3);
}

- (unsigned)causeCountAtIndex:(unint64_t)a3
{
  $1729E44CE8A3ADE0AA70C2F19EF2BB02 *p_causeCounts;
  unint64_t count;
  void *v6;
  void *v7;

  p_causeCounts = &self->_causeCounts;
  count = self->_causeCounts.count;
  if (count <= a3)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("idx (%tu) is out of range (%tu)"), a3, count));
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSException exceptionWithName:reason:userInfo:](NSException, "exceptionWithName:reason:userInfo:", NSRangeException, v6, 0));
    objc_msgSend(v7, "raise");

  }
  return p_causeCounts->list[a3];
}

- (void)setCauseCounts:(unsigned int *)a3 count:(unint64_t)a4
{
  PBRepeatedUInt32Set(&self->_causeCounts, a3, a4);
}

- (void)setTotalAp:(unsigned int)a3
{
  *(_BYTE *)&self->_has |= 4u;
  self->_totalAp = a3;
}

- (void)setHasTotalAp:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 4;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFB | v3;
}

- (BOOL)hasTotalAp
{
  return (*(_BYTE *)&self->_has >> 2) & 1;
}

- (unint64_t)causeCountApsCount
{
  return self->_causeCountAps.count;
}

- (unsigned)causeCountAps
{
  return self->_causeCountAps.list;
}

- (void)clearCauseCountAps
{
  PBRepeatedUInt32Clear(&self->_causeCountAps, a2);
}

- (void)addCauseCountAp:(unsigned int)a3
{
  PBRepeatedUInt32Add(&self->_causeCountAps, *(_QWORD *)&a3);
}

- (unsigned)causeCountApAtIndex:(unint64_t)a3
{
  $1729E44CE8A3ADE0AA70C2F19EF2BB02 *p_causeCountAps;
  unint64_t count;
  void *v6;
  void *v7;

  p_causeCountAps = &self->_causeCountAps;
  count = self->_causeCountAps.count;
  if (count <= a3)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("idx (%tu) is out of range (%tu)"), a3, count));
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSException exceptionWithName:reason:userInfo:](NSException, "exceptionWithName:reason:userInfo:", NSRangeException, v6, 0));
    objc_msgSend(v7, "raise");

  }
  return p_causeCountAps->list[a3];
}

- (void)setCauseCountAps:(unsigned int *)a3 count:(unint64_t)a4
{
  PBRepeatedUInt32Set(&self->_causeCountAps, a3, a4);
}

- (id)description
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)ReFromEutranCount;
  v3 = -[ReFromEutranCount description](&v8, "description");
  v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[ReFromEutranCount dictionaryRepresentation](self, "dictionaryRepresentation"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@ %@"), v4, v5));

  return v6;
}

- (id)dictionaryRepresentation
{
  void *v3;
  char has;
  uint64_t destRat;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary"));
  has = (char)self->_has;
  if ((has & 1) != 0)
  {
    destRat = self->_destRat;
    if (destRat >= 6)
      v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("(unknown: %i)"), self->_destRat));
    else
      v6 = *(&off_10025F130 + destRat);
    objc_msgSend(v3, "setObject:forKey:", v6, CFSTR("dest_rat"));

    has = (char)self->_has;
  }
  if ((has & 2) != 0)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", self->_total));
    objc_msgSend(v3, "setObject:forKey:", v7, CFSTR("total"));

  }
  v8 = PBRepeatedUInt32NSArray(&self->_causeCounts);
  v9 = (void *)objc_claimAutoreleasedReturnValue(v8);
  objc_msgSend(v3, "setObject:forKey:", v9, CFSTR("cause_count"));

  if ((*(_BYTE *)&self->_has & 4) != 0)
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", self->_totalAp));
    objc_msgSend(v3, "setObject:forKey:", v10, CFSTR("total_ap"));

  }
  v11 = PBRepeatedUInt32NSArray(&self->_causeCountAps);
  v12 = (void *)objc_claimAutoreleasedReturnValue(v11);
  objc_msgSend(v3, "setObject:forKey:", v12, CFSTR("cause_count_ap"));

  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return sub_100090708((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4;
  void *v5;
  char has;
  unint64_t v7;
  $1729E44CE8A3ADE0AA70C2F19EF2BB02 *p_causeCountAps;
  unint64_t v9;
  uint64_t v10;

  v4 = a3;
  v5 = v4;
  has = (char)self->_has;
  if ((has & 1) != 0)
  {
    PBDataWriterWriteInt32Field(v4, self->_destRat, 1);
    has = (char)self->_has;
  }
  if ((has & 2) != 0)
    PBDataWriterWriteUint32Field(v5, self->_total, 3);
  if (self->_causeCounts.count)
  {
    v10 = 0;
    PBDataWriterPlaceMark(v5, &v10, 5);
    if (self->_causeCounts.count)
    {
      v7 = 0;
      do
        PBDataWriterWriteUint32Field(v5, self->_causeCounts.list[v7++], 0xFFFFFFFFLL);
      while (v7 < self->_causeCounts.count);
    }
    PBDataWriterRecallMark(v5, &v10);
  }
  if ((*(_BYTE *)&self->_has & 4) != 0)
    PBDataWriterWriteUint32Field(v5, self->_totalAp, 6);
  p_causeCountAps = &self->_causeCountAps;
  if (p_causeCountAps->count)
  {
    v10 = 0;
    PBDataWriterPlaceMark(v5, &v10, 7);
    if (p_causeCountAps->count)
    {
      v9 = 0;
      do
        PBDataWriterWriteUint32Field(v5, p_causeCountAps->list[v9++], 0xFFFFFFFFLL);
      while (v9 < p_causeCountAps->count);
    }
    PBDataWriterRecallMark(v5, &v10);
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
  if ((has & 1) != 0)
  {
    v4[14] = self->_destRat;
    *((_BYTE *)v4 + 68) |= 1u;
    has = (char)self->_has;
  }
  if ((has & 2) != 0)
  {
    v4[15] = self->_total;
    *((_BYTE *)v4 + 68) |= 2u;
  }
  v12 = v4;
  if (-[ReFromEutranCount causeCountsCount](self, "causeCountsCount"))
  {
    objc_msgSend(v12, "clearCauseCounts");
    v6 = -[ReFromEutranCount causeCountsCount](self, "causeCountsCount");
    if (v6)
    {
      v7 = v6;
      for (i = 0; i != v7; ++i)
        objc_msgSend(v12, "addCauseCount:", -[ReFromEutranCount causeCountAtIndex:](self, "causeCountAtIndex:", i));
    }
  }
  if ((*(_BYTE *)&self->_has & 4) != 0)
  {
    *((_DWORD *)v12 + 16) = self->_totalAp;
    *((_BYTE *)v12 + 68) |= 4u;
  }
  if (-[ReFromEutranCount causeCountApsCount](self, "causeCountApsCount"))
  {
    objc_msgSend(v12, "clearCauseCountAps");
    v9 = -[ReFromEutranCount causeCountApsCount](self, "causeCountApsCount");
    if (v9)
    {
      v10 = v9;
      for (j = 0; j != v10; ++j)
        objc_msgSend(v12, "addCauseCountAp:", -[ReFromEutranCount causeCountApAtIndex:](self, "causeCountApAtIndex:", j));
    }
  }

}

- (id)copyWithZone:(_NSZone *)a3
{
  _DWORD *v4;
  _DWORD *v5;
  char has;

  v4 = objc_msgSend(objc_msgSend((id)objc_opt_class(self, a2), "allocWithZone:", a3), "init");
  v5 = v4;
  has = (char)self->_has;
  if ((has & 1) != 0)
  {
    v4[14] = self->_destRat;
    *((_BYTE *)v4 + 68) |= 1u;
    has = (char)self->_has;
  }
  if ((has & 2) != 0)
  {
    v4[15] = self->_total;
    *((_BYTE *)v4 + 68) |= 2u;
  }
  PBRepeatedUInt32Copy(v4 + 8, &self->_causeCounts);
  if ((*(_BYTE *)&self->_has & 4) != 0)
  {
    v5[16] = self->_totalAp;
    *((_BYTE *)v5 + 68) |= 4u;
  }
  PBRepeatedUInt32Copy(v5 + 2, &self->_causeCountAps);
  return v5;
}

- (BOOL)isEqual:(id)a3
{
  char *v4;
  uint64_t v5;
  char IsEqual;

  v4 = (char *)a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class(self, v5)))
    goto LABEL_19;
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    if ((v4[68] & 1) == 0 || self->_destRat != *((_DWORD *)v4 + 14))
      goto LABEL_19;
  }
  else if ((v4[68] & 1) != 0)
  {
    goto LABEL_19;
  }
  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
    if ((v4[68] & 2) == 0 || self->_total != *((_DWORD *)v4 + 15))
      goto LABEL_19;
  }
  else if ((v4[68] & 2) != 0)
  {
    goto LABEL_19;
  }
  if (!PBRepeatedUInt32IsEqual(&self->_causeCounts, v4 + 32))
  {
LABEL_19:
    IsEqual = 0;
    goto LABEL_20;
  }
  if ((*(_BYTE *)&self->_has & 4) != 0)
  {
    if ((v4[68] & 4) == 0 || self->_totalAp != *((_DWORD *)v4 + 16))
      goto LABEL_19;
  }
  else if ((v4[68] & 4) != 0)
  {
    goto LABEL_19;
  }
  IsEqual = PBRepeatedUInt32IsEqual(&self->_causeCountAps, v4 + 8);
LABEL_20:

  return IsEqual;
}

- (unint64_t)hash
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    v3 = 2654435761 * self->_destRat;
    if ((*(_BYTE *)&self->_has & 2) != 0)
      goto LABEL_3;
  }
  else
  {
    v3 = 0;
    if ((*(_BYTE *)&self->_has & 2) != 0)
    {
LABEL_3:
      v4 = 2654435761 * self->_total;
      goto LABEL_6;
    }
  }
  v4 = 0;
LABEL_6:
  v5 = PBRepeatedUInt32Hash(&self->_causeCounts);
  if ((*(_BYTE *)&self->_has & 4) != 0)
    v6 = 2654435761 * self->_totalAp;
  else
    v6 = 0;
  return v4 ^ v3 ^ v6 ^ v5 ^ PBRepeatedUInt32Hash(&self->_causeCountAps);
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
  unsigned int *v12;

  v4 = a3;
  v5 = *((_BYTE *)v4 + 68);
  if ((v5 & 1) != 0)
  {
    self->_destRat = *((_DWORD *)v4 + 14);
    *(_BYTE *)&self->_has |= 1u;
    v5 = *((_BYTE *)v4 + 68);
  }
  if ((v5 & 2) != 0)
  {
    self->_total = *((_DWORD *)v4 + 15);
    *(_BYTE *)&self->_has |= 2u;
  }
  v12 = (unsigned int *)v4;
  v6 = (char *)objc_msgSend(v4, "causeCountsCount");
  if (v6)
  {
    v7 = v6;
    for (i = 0; i != v7; ++i)
      -[ReFromEutranCount addCauseCount:](self, "addCauseCount:", objc_msgSend(v12, "causeCountAtIndex:", i));
  }
  if ((v12[17] & 4) != 0)
  {
    self->_totalAp = v12[16];
    *(_BYTE *)&self->_has |= 4u;
  }
  v9 = (char *)objc_msgSend(v12, "causeCountApsCount");
  if (v9)
  {
    v10 = v9;
    for (j = 0; j != v10; ++j)
      -[ReFromEutranCount addCauseCountAp:](self, "addCauseCountAp:", objc_msgSend(v12, "causeCountApAtIndex:", j));
  }

}

- (unsigned)total
{
  return self->_total;
}

- (unsigned)totalAp
{
  return self->_totalAp;
}

@end
