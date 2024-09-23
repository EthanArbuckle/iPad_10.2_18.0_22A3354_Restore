@implementation HoFromEutranCount

- (void)dealloc
{
  uint64_t v3;
  objc_super v4;

  PBRepeatedUInt32Clear(&self->_failureCounts, a2);
  PBRepeatedUInt32Clear(&self->_failureCountAps, v3);
  v4.receiver = self;
  v4.super_class = (Class)HoFromEutranCount;
  -[HoFromEutranCount dealloc](&v4, "dealloc");
}

- (int)hoProc
{
  if ((*(_BYTE *)&self->_has & 1) != 0)
    return self->_hoProc;
  else
    return 0;
}

- (void)setHoProc:(int)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_hoProc = a3;
}

- (void)setHasHoProc:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (BOOL)hasHoProc
{
  return *(_BYTE *)&self->_has & 1;
}

- (id)hoProcAsString:(int)a3
{
  if (a3 >= 5)
    return (id)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("(unknown: %i)"), *(_QWORD *)&a3));
  else
    return off_10025FF20[a3];
}

- (int)StringAsHoProc:(id)a3
{
  id v3;
  int v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("LTE_HO_FROM_EUTRAN_PROC_UTRA_HO")) & 1) != 0)
  {
    v4 = 0;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("LTE_HO_FROM_EUTRAN_PROC_GERAN_HO")) & 1) != 0)
  {
    v4 = 1;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("LTE_HO_FROM_EUTRAN_PROC_GERAN_CCO")) & 1) != 0)
  {
    v4 = 2;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("LTE_HO_FROM_EUTRAN_PROC_E1XCSFB")) & 1) != 0)
  {
    v4 = 3;
  }
  else if (objc_msgSend(v3, "isEqualToString:", CFSTR("LTE_HO_FROM_EUTRAN_PROC_HRPD_HO")))
  {
    v4 = 4;
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (void)setStartCount:(unsigned int)a3
{
  *(_BYTE *)&self->_has |= 2u;
  self->_startCount = a3;
}

- (void)setHasStartCount:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFD | v3;
}

- (BOOL)hasStartCount
{
  return (*(_BYTE *)&self->_has >> 1) & 1;
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

- (void)setStartCountAp:(unsigned int)a3
{
  *(_BYTE *)&self->_has |= 4u;
  self->_startCountAp = a3;
}

- (void)setHasStartCountAp:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 4;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFB | v3;
}

- (BOOL)hasStartCountAp
{
  return (*(_BYTE *)&self->_has >> 2) & 1;
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
  v8.super_class = (Class)HoFromEutranCount;
  v3 = -[HoFromEutranCount description](&v8, "description");
  v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[HoFromEutranCount dictionaryRepresentation](self, "dictionaryRepresentation"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@ %@"), v4, v5));

  return v6;
}

- (id)dictionaryRepresentation
{
  void *v3;
  char has;
  uint64_t hoProc;
  __CFString *v6;
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
    hoProc = self->_hoProc;
    if (hoProc >= 5)
      v6 = (__CFString *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("(unknown: %i)"), self->_hoProc));
    else
      v6 = off_10025FF20[hoProc];
    objc_msgSend(v3, "setObject:forKey:", v6, CFSTR("ho_proc"));

    has = (char)self->_has;
  }
  if ((has & 2) != 0)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", self->_startCount));
    objc_msgSend(v3, "setObject:forKey:", v7, CFSTR("start_count"));

  }
  v8 = PBRepeatedUInt32NSArray(&self->_failureCounts);
  v9 = (void *)objc_claimAutoreleasedReturnValue(v8);
  objc_msgSend(v3, "setObject:forKey:", v9, CFSTR("failure_count"));

  if ((*(_BYTE *)&self->_has & 4) != 0)
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", self->_startCountAp));
    objc_msgSend(v3, "setObject:forKey:", v10, CFSTR("start_count_ap"));

  }
  v11 = PBRepeatedUInt32NSArray(&self->_failureCountAps);
  v12 = (void *)objc_claimAutoreleasedReturnValue(v11);
  objc_msgSend(v3, "setObject:forKey:", v12, CFSTR("failure_count_ap"));

  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return sub_10012078C((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4;
  void *v5;
  char has;
  unint64_t v7;
  $1729E44CE8A3ADE0AA70C2F19EF2BB02 *p_failureCountAps;
  unint64_t v9;
  uint64_t v10;

  v4 = a3;
  v5 = v4;
  has = (char)self->_has;
  if ((has & 1) != 0)
  {
    PBDataWriterWriteInt32Field(v4, self->_hoProc, 1);
    has = (char)self->_has;
  }
  if ((has & 2) != 0)
    PBDataWriterWriteUint32Field(v5, self->_startCount, 3);
  if (self->_failureCounts.count)
  {
    v10 = 0;
    PBDataWriterPlaceMark(v5, &v10, 5);
    if (self->_failureCounts.count)
    {
      v7 = 0;
      do
        PBDataWriterWriteUint32Field(v5, self->_failureCounts.list[v7++], 0xFFFFFFFFLL);
      while (v7 < self->_failureCounts.count);
    }
    PBDataWriterRecallMark(v5, &v10);
  }
  if ((*(_BYTE *)&self->_has & 4) != 0)
    PBDataWriterWriteUint32Field(v5, self->_startCountAp, 6);
  p_failureCountAps = &self->_failureCountAps;
  if (p_failureCountAps->count)
  {
    v10 = 0;
    PBDataWriterPlaceMark(v5, &v10, 7);
    if (p_failureCountAps->count)
    {
      v9 = 0;
      do
        PBDataWriterWriteUint32Field(v5, p_failureCountAps->list[v9++], 0xFFFFFFFFLL);
      while (v9 < p_failureCountAps->count);
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
    v4[14] = self->_hoProc;
    *((_BYTE *)v4 + 68) |= 1u;
    has = (char)self->_has;
  }
  if ((has & 2) != 0)
  {
    v4[15] = self->_startCount;
    *((_BYTE *)v4 + 68) |= 2u;
  }
  v12 = v4;
  if (-[HoFromEutranCount failureCountsCount](self, "failureCountsCount"))
  {
    objc_msgSend(v12, "clearFailureCounts");
    v6 = -[HoFromEutranCount failureCountsCount](self, "failureCountsCount");
    if (v6)
    {
      v7 = v6;
      for (i = 0; i != v7; ++i)
        objc_msgSend(v12, "addFailureCount:", -[HoFromEutranCount failureCountAtIndex:](self, "failureCountAtIndex:", i));
    }
  }
  if ((*(_BYTE *)&self->_has & 4) != 0)
  {
    *((_DWORD *)v12 + 16) = self->_startCountAp;
    *((_BYTE *)v12 + 68) |= 4u;
  }
  if (-[HoFromEutranCount failureCountApsCount](self, "failureCountApsCount"))
  {
    objc_msgSend(v12, "clearFailureCountAps");
    v9 = -[HoFromEutranCount failureCountApsCount](self, "failureCountApsCount");
    if (v9)
    {
      v10 = v9;
      for (j = 0; j != v10; ++j)
        objc_msgSend(v12, "addFailureCountAp:", -[HoFromEutranCount failureCountApAtIndex:](self, "failureCountApAtIndex:", j));
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
    v4[14] = self->_hoProc;
    *((_BYTE *)v4 + 68) |= 1u;
    has = (char)self->_has;
  }
  if ((has & 2) != 0)
  {
    v4[15] = self->_startCount;
    *((_BYTE *)v4 + 68) |= 2u;
  }
  PBRepeatedUInt32Copy(v4 + 8, &self->_failureCounts);
  if ((*(_BYTE *)&self->_has & 4) != 0)
  {
    v5[16] = self->_startCountAp;
    *((_BYTE *)v5 + 68) |= 4u;
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
    goto LABEL_19;
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    if ((v4[68] & 1) == 0 || self->_hoProc != *((_DWORD *)v4 + 14))
      goto LABEL_19;
  }
  else if ((v4[68] & 1) != 0)
  {
    goto LABEL_19;
  }
  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
    if ((v4[68] & 2) == 0 || self->_startCount != *((_DWORD *)v4 + 15))
      goto LABEL_19;
  }
  else if ((v4[68] & 2) != 0)
  {
    goto LABEL_19;
  }
  if (!PBRepeatedUInt32IsEqual(&self->_failureCounts, v4 + 32))
  {
LABEL_19:
    IsEqual = 0;
    goto LABEL_20;
  }
  if ((*(_BYTE *)&self->_has & 4) != 0)
  {
    if ((v4[68] & 4) == 0 || self->_startCountAp != *((_DWORD *)v4 + 16))
      goto LABEL_19;
  }
  else if ((v4[68] & 4) != 0)
  {
    goto LABEL_19;
  }
  IsEqual = PBRepeatedUInt32IsEqual(&self->_failureCountAps, v4 + 8);
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
    v3 = 2654435761 * self->_hoProc;
    if ((*(_BYTE *)&self->_has & 2) != 0)
      goto LABEL_3;
  }
  else
  {
    v3 = 0;
    if ((*(_BYTE *)&self->_has & 2) != 0)
    {
LABEL_3:
      v4 = 2654435761 * self->_startCount;
      goto LABEL_6;
    }
  }
  v4 = 0;
LABEL_6:
  v5 = PBRepeatedUInt32Hash(&self->_failureCounts);
  if ((*(_BYTE *)&self->_has & 4) != 0)
    v6 = 2654435761 * self->_startCountAp;
  else
    v6 = 0;
  return v4 ^ v3 ^ v6 ^ v5 ^ PBRepeatedUInt32Hash(&self->_failureCountAps);
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
    self->_hoProc = *((_DWORD *)v4 + 14);
    *(_BYTE *)&self->_has |= 1u;
    v5 = *((_BYTE *)v4 + 68);
  }
  if ((v5 & 2) != 0)
  {
    self->_startCount = *((_DWORD *)v4 + 15);
    *(_BYTE *)&self->_has |= 2u;
  }
  v12 = (unsigned int *)v4;
  v6 = (char *)objc_msgSend(v4, "failureCountsCount");
  if (v6)
  {
    v7 = v6;
    for (i = 0; i != v7; ++i)
      -[HoFromEutranCount addFailureCount:](self, "addFailureCount:", objc_msgSend(v12, "failureCountAtIndex:", i));
  }
  if ((v12[17] & 4) != 0)
  {
    self->_startCountAp = v12[16];
    *(_BYTE *)&self->_has |= 4u;
  }
  v9 = (char *)objc_msgSend(v12, "failureCountApsCount");
  if (v9)
  {
    v10 = v9;
    for (j = 0; j != v10; ++j)
      -[HoFromEutranCount addFailureCountAp:](self, "addFailureCountAp:", objc_msgSend(v12, "failureCountApAtIndex:", j));
  }

}

- (unsigned)startCount
{
  return self->_startCount;
}

- (unsigned)startCountAp
{
  return self->_startCountAp;
}

@end
