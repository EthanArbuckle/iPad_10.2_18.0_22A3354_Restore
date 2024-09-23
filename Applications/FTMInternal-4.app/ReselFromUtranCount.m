@implementation ReselFromUtranCount

- (void)dealloc
{
  uint64_t v3;
  objc_super v4;

  PBRepeatedUInt32Clear(&self->_failureCounts, a2);
  PBRepeatedUInt32Clear(&self->_failureCountAps, v3);
  v4.receiver = self;
  v4.super_class = (Class)ReselFromUtranCount;
  -[ReselFromUtranCount dealloc](&v4, "dealloc");
}

- (void)setTotal:(unsigned int)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_total = a3;
}

- (void)setHasTotal:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (BOOL)hasTotal
{
  return *(_BYTE *)&self->_has & 1;
}

- (unint64_t)failureCountsCount
{
  return self->_failureCounts.count;
}

- (unsigned)failureCounts
{
  return self->_failureCounts.list;
}

- (void)clearFailureCounts
{
  PBRepeatedUInt32Clear(&self->_failureCounts, a2);
}

- (void)addFailureCount:(unsigned int)a3
{
  PBRepeatedUInt32Add(&self->_failureCounts, *(_QWORD *)&a3);
}

- (unsigned)failureCountAtIndex:(unint64_t)a3
{
  $1729E44CE8A3ADE0AA70C2F19EF2BB02 *p_failureCounts;
  unint64_t count;
  void *v6;
  void *v7;

  p_failureCounts = &self->_failureCounts;
  count = self->_failureCounts.count;
  if (count <= a3)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("idx (%tu) is out of range (%tu)"), a3, count));
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSException exceptionWithName:reason:userInfo:](NSException, "exceptionWithName:reason:userInfo:", NSRangeException, v6, 0));
    objc_msgSend(v7, "raise");

  }
  return p_failureCounts->list[a3];
}

- (void)setFailureCounts:(unsigned int *)a3 count:(unint64_t)a4
{
  PBRepeatedUInt32Set(&self->_failureCounts, a3, a4);
}

- (void)setTotalAp:(unsigned int)a3
{
  *(_BYTE *)&self->_has |= 2u;
  self->_totalAp = a3;
}

- (void)setHasTotalAp:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFD | v3;
}

- (BOOL)hasTotalAp
{
  return (*(_BYTE *)&self->_has >> 1) & 1;
}

- (unint64_t)failureCountApsCount
{
  return self->_failureCountAps.count;
}

- (unsigned)failureCountAps
{
  return self->_failureCountAps.list;
}

- (void)clearFailureCountAps
{
  PBRepeatedUInt32Clear(&self->_failureCountAps, a2);
}

- (void)addFailureCountAp:(unsigned int)a3
{
  PBRepeatedUInt32Add(&self->_failureCountAps, *(_QWORD *)&a3);
}

- (unsigned)failureCountApAtIndex:(unint64_t)a3
{
  $1729E44CE8A3ADE0AA70C2F19EF2BB02 *p_failureCountAps;
  unint64_t count;
  void *v6;
  void *v7;

  p_failureCountAps = &self->_failureCountAps;
  count = self->_failureCountAps.count;
  if (count <= a3)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("idx (%tu) is out of range (%tu)"), a3, count));
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSException exceptionWithName:reason:userInfo:](NSException, "exceptionWithName:reason:userInfo:", NSRangeException, v6, 0));
    objc_msgSend(v7, "raise");

  }
  return p_failureCountAps->list[a3];
}

- (void)setFailureCountAps:(unsigned int *)a3 count:(unint64_t)a4
{
  PBRepeatedUInt32Set(&self->_failureCountAps, a3, a4);
}

- (id)description
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)ReselFromUtranCount;
  v3 = -[ReselFromUtranCount description](&v8, "description");
  v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[ReselFromUtranCount dictionaryRepresentation](self, "dictionaryRepresentation"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@ %@"), v4, v5));

  return v6;
}

- (id)dictionaryRepresentation
{
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary"));
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", self->_total));
    objc_msgSend(v3, "setObject:forKey:", v4, CFSTR("total"));

  }
  v5 = PBRepeatedUInt32NSArray(&self->_failureCounts);
  v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
  objc_msgSend(v3, "setObject:forKey:", v6, CFSTR("failure_count"));

  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", self->_totalAp));
    objc_msgSend(v3, "setObject:forKey:", v7, CFSTR("total_ap"));

  }
  v8 = PBRepeatedUInt32NSArray(&self->_failureCountAps);
  v9 = (void *)objc_claimAutoreleasedReturnValue(v8);
  objc_msgSend(v3, "setObject:forKey:", v9, CFSTR("failure_count_ap"));

  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return sub_100037220((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4;
  void *v5;
  unint64_t v6;
  $1729E44CE8A3ADE0AA70C2F19EF2BB02 *p_failureCountAps;
  unint64_t v8;
  uint64_t v9;

  v4 = a3;
  v5 = v4;
  if ((*(_BYTE *)&self->_has & 1) != 0)
    PBDataWriterWriteUint32Field(v4, self->_total, 3);
  if (self->_failureCounts.count)
  {
    v9 = 0;
    PBDataWriterPlaceMark(v5, &v9, 5);
    if (self->_failureCounts.count)
    {
      v6 = 0;
      do
        PBDataWriterWriteUint32Field(v5, self->_failureCounts.list[v6++], 0xFFFFFFFFLL);
      while (v6 < self->_failureCounts.count);
    }
    PBDataWriterRecallMark(v5, &v9);
  }
  if ((*(_BYTE *)&self->_has & 2) != 0)
    PBDataWriterWriteUint32Field(v5, self->_totalAp, 6);
  p_failureCountAps = &self->_failureCountAps;
  if (p_failureCountAps->count)
  {
    v9 = 0;
    PBDataWriterPlaceMark(v5, &v9, 7);
    if (p_failureCountAps->count)
    {
      v8 = 0;
      do
        PBDataWriterWriteUint32Field(v5, p_failureCountAps->list[v8++], 0xFFFFFFFFLL);
      while (v8 < p_failureCountAps->count);
    }
    PBDataWriterRecallMark(v5, &v9);
  }

}

- (void)copyTo:(id)a3
{
  _DWORD *v4;
  unint64_t v5;
  unint64_t v6;
  uint64_t i;
  unint64_t v8;
  unint64_t v9;
  uint64_t j;
  id v11;

  v4 = a3;
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    v4[14] = self->_total;
    *((_BYTE *)v4 + 64) |= 1u;
  }
  v11 = v4;
  if (-[ReselFromUtranCount failureCountsCount](self, "failureCountsCount"))
  {
    objc_msgSend(v11, "clearFailureCounts");
    v5 = -[ReselFromUtranCount failureCountsCount](self, "failureCountsCount");
    if (v5)
    {
      v6 = v5;
      for (i = 0; i != v6; ++i)
        objc_msgSend(v11, "addFailureCount:", -[ReselFromUtranCount failureCountAtIndex:](self, "failureCountAtIndex:", i));
    }
  }
  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
    *((_DWORD *)v11 + 15) = self->_totalAp;
    *((_BYTE *)v11 + 64) |= 2u;
  }
  if (-[ReselFromUtranCount failureCountApsCount](self, "failureCountApsCount"))
  {
    objc_msgSend(v11, "clearFailureCountAps");
    v8 = -[ReselFromUtranCount failureCountApsCount](self, "failureCountApsCount");
    if (v8)
    {
      v9 = v8;
      for (j = 0; j != v9; ++j)
        objc_msgSend(v11, "addFailureCountAp:", -[ReselFromUtranCount failureCountApAtIndex:](self, "failureCountApAtIndex:", j));
    }
  }

}

- (id)copyWithZone:(_NSZone *)a3
{
  _DWORD *v4;
  _DWORD *v5;

  v4 = objc_msgSend(objc_msgSend((id)objc_opt_class(self, a2), "allocWithZone:", a3), "init");
  v5 = v4;
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    v4[14] = self->_total;
    *((_BYTE *)v4 + 64) |= 1u;
  }
  PBRepeatedUInt32Copy(v4 + 8, &self->_failureCounts);
  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
    v5[15] = self->_totalAp;
    *((_BYTE *)v5 + 64) |= 2u;
  }
  PBRepeatedUInt32Copy(v5 + 2, &self->_failureCountAps);
  return v5;
}

- (BOOL)isEqual:(id)a3
{
  char *v4;
  uint64_t v5;
  char IsEqual;

  v4 = (char *)a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class(self, v5)))
    goto LABEL_14;
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    if ((v4[64] & 1) == 0 || self->_total != *((_DWORD *)v4 + 14))
      goto LABEL_14;
  }
  else if ((v4[64] & 1) != 0)
  {
    goto LABEL_14;
  }
  if (!PBRepeatedUInt32IsEqual(&self->_failureCounts, v4 + 32))
  {
LABEL_14:
    IsEqual = 0;
    goto LABEL_15;
  }
  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
    if ((v4[64] & 2) == 0 || self->_totalAp != *((_DWORD *)v4 + 15))
      goto LABEL_14;
  }
  else if ((v4[64] & 2) != 0)
  {
    goto LABEL_14;
  }
  IsEqual = PBRepeatedUInt32IsEqual(&self->_failureCountAps, v4 + 8);
LABEL_15:

  return IsEqual;
}

- (unint64_t)hash
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  if ((*(_BYTE *)&self->_has & 1) != 0)
    v3 = 2654435761 * self->_total;
  else
    v3 = 0;
  v4 = PBRepeatedUInt32Hash(&self->_failureCounts);
  if ((*(_BYTE *)&self->_has & 2) != 0)
    v5 = 2654435761 * self->_totalAp;
  else
    v5 = 0;
  return v4 ^ v3 ^ v5 ^ PBRepeatedUInt32Hash(&self->_failureCountAps);
}

- (void)mergeFrom:(id)a3
{
  unsigned int *v4;
  char *v5;
  char *v6;
  char *i;
  char *v8;
  char *v9;
  char *j;
  unsigned int *v11;

  v4 = (unsigned int *)a3;
  if ((v4[16] & 1) != 0)
  {
    self->_total = v4[14];
    *(_BYTE *)&self->_has |= 1u;
  }
  v11 = v4;
  v5 = (char *)objc_msgSend(v4, "failureCountsCount");
  if (v5)
  {
    v6 = v5;
    for (i = 0; i != v6; ++i)
      -[ReselFromUtranCount addFailureCount:](self, "addFailureCount:", objc_msgSend(v11, "failureCountAtIndex:", i));
  }
  if ((v11[16] & 2) != 0)
  {
    self->_totalAp = v11[15];
    *(_BYTE *)&self->_has |= 2u;
  }
  v8 = (char *)objc_msgSend(v11, "failureCountApsCount");
  if (v8)
  {
    v9 = v8;
    for (j = 0; j != v9; ++j)
      -[ReselFromUtranCount addFailureCountAp:](self, "addFailureCountAp:", objc_msgSend(v11, "failureCountApAtIndex:", j));
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
