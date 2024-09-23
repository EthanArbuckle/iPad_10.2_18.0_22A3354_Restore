@implementation HoFromUtranCount

- (void)dealloc
{
  objc_super v3;

  PBRepeatedUInt32Clear(&self->_failureCounts, a2);
  v3.receiver = self;
  v3.super_class = (Class)HoFromUtranCount;
  -[HoFromUtranCount dealloc](&v3, "dealloc");
}

- (void)setStartCount:(unsigned int)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_startCount = a3;
}

- (void)setHasStartCount:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (BOOL)hasStartCount
{
  return *(_BYTE *)&self->_has & 1;
}

- (void)setSuccessCount:(unsigned int)a3
{
  *(_BYTE *)&self->_has |= 2u;
  self->_successCount = a3;
}

- (void)setHasSuccessCount:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFD | v3;
}

- (BOOL)hasSuccessCount
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

- (id)description
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)HoFromUtranCount;
  v3 = -[HoFromUtranCount description](&v8, "description");
  v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[HoFromUtranCount dictionaryRepresentation](self, "dictionaryRepresentation"));
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

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary"));
  has = (char)self->_has;
  if ((has & 1) != 0)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", self->_startCount));
    objc_msgSend(v3, "setObject:forKey:", v5, CFSTR("start_count"));

    has = (char)self->_has;
  }
  if ((has & 2) != 0)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", self->_successCount));
    objc_msgSend(v3, "setObject:forKey:", v6, CFSTR("success_count"));

  }
  v7 = PBRepeatedUInt32NSArray(&self->_failureCounts);
  v8 = (void *)objc_claimAutoreleasedReturnValue(v7);
  objc_msgSend(v3, "setObject:forKey:", v8, CFSTR("failure_count"));

  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return sub_100100020((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4;
  void *v5;
  char has;
  $1729E44CE8A3ADE0AA70C2F19EF2BB02 *p_failureCounts;
  unint64_t v8;
  uint64_t v9;

  v4 = a3;
  v5 = v4;
  has = (char)self->_has;
  if ((has & 1) != 0)
  {
    PBDataWriterWriteUint32Field(v4, self->_startCount, 1);
    has = (char)self->_has;
  }
  if ((has & 2) != 0)
    PBDataWriterWriteUint32Field(v5, self->_successCount, 3);
  p_failureCounts = &self->_failureCounts;
  if (p_failureCounts->count)
  {
    v9 = 0;
    PBDataWriterPlaceMark(v5, &v9, 5);
    if (p_failureCounts->count)
    {
      v8 = 0;
      do
        PBDataWriterWriteUint32Field(v5, p_failureCounts->list[v8++], 0xFFFFFFFFLL);
      while (v8 < p_failureCounts->count);
    }
    PBDataWriterRecallMark(v5, &v9);
  }

}

- (void)copyTo:(id)a3
{
  _DWORD *v4;
  char has;
  unint64_t v6;
  unint64_t v7;
  uint64_t i;
  id v9;

  v4 = a3;
  has = (char)self->_has;
  if ((has & 1) != 0)
  {
    v4[8] = self->_startCount;
    *((_BYTE *)v4 + 40) |= 1u;
    has = (char)self->_has;
  }
  if ((has & 2) != 0)
  {
    v4[9] = self->_successCount;
    *((_BYTE *)v4 + 40) |= 2u;
  }
  v9 = v4;
  if (-[HoFromUtranCount failureCountsCount](self, "failureCountsCount"))
  {
    objc_msgSend(v9, "clearFailureCounts");
    v6 = -[HoFromUtranCount failureCountsCount](self, "failureCountsCount");
    if (v6)
    {
      v7 = v6;
      for (i = 0; i != v7; ++i)
        objc_msgSend(v9, "addFailureCount:", -[HoFromUtranCount failureCountAtIndex:](self, "failureCountAtIndex:", i));
    }
  }

}

- (id)copyWithZone:(_NSZone *)a3
{
  char *v4;
  void *v5;
  char has;

  v4 = (char *)objc_msgSend(objc_msgSend((id)objc_opt_class(self, a2), "allocWithZone:", a3), "init");
  v5 = v4;
  has = (char)self->_has;
  if ((has & 1) != 0)
  {
    *((_DWORD *)v4 + 8) = self->_startCount;
    v4[40] |= 1u;
    has = (char)self->_has;
  }
  if ((has & 2) != 0)
  {
    *((_DWORD *)v4 + 9) = self->_successCount;
    v4[40] |= 2u;
  }
  PBRepeatedUInt32Copy(v4 + 8, &self->_failureCounts);
  return v5;
}

- (BOOL)isEqual:(id)a3
{
  char *v4;
  uint64_t v5;
  char IsEqual;

  v4 = (char *)a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class(self, v5)))
    goto LABEL_13;
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    if ((v4[40] & 1) == 0 || self->_startCount != *((_DWORD *)v4 + 8))
      goto LABEL_13;
  }
  else if ((v4[40] & 1) != 0)
  {
LABEL_13:
    IsEqual = 0;
    goto LABEL_14;
  }
  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
    if ((v4[40] & 2) == 0 || self->_successCount != *((_DWORD *)v4 + 9))
      goto LABEL_13;
  }
  else if ((v4[40] & 2) != 0)
  {
    goto LABEL_13;
  }
  IsEqual = PBRepeatedUInt32IsEqual(&self->_failureCounts, v4 + 8);
LABEL_14:

  return IsEqual;
}

- (unint64_t)hash
{
  uint64_t v2;
  uint64_t v3;

  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    v2 = 2654435761 * self->_startCount;
    if ((*(_BYTE *)&self->_has & 2) != 0)
      goto LABEL_3;
LABEL_5:
    v3 = 0;
    return v3 ^ v2 ^ PBRepeatedUInt32Hash(&self->_failureCounts);
  }
  v2 = 0;
  if ((*(_BYTE *)&self->_has & 2) == 0)
    goto LABEL_5;
LABEL_3:
  v3 = 2654435761 * self->_successCount;
  return v3 ^ v2 ^ PBRepeatedUInt32Hash(&self->_failureCounts);
}

- (void)mergeFrom:(id)a3
{
  id v4;
  char v5;
  char *v6;
  char *v7;
  char *i;
  id v9;

  v4 = a3;
  v5 = *((_BYTE *)v4 + 40);
  if ((v5 & 1) != 0)
  {
    self->_startCount = *((_DWORD *)v4 + 8);
    *(_BYTE *)&self->_has |= 1u;
    v5 = *((_BYTE *)v4 + 40);
  }
  if ((v5 & 2) != 0)
  {
    self->_successCount = *((_DWORD *)v4 + 9);
    *(_BYTE *)&self->_has |= 2u;
  }
  v9 = v4;
  v6 = (char *)objc_msgSend(v4, "failureCountsCount");
  if (v6)
  {
    v7 = v6;
    for (i = 0; i != v7; ++i)
      -[HoFromUtranCount addFailureCount:](self, "addFailureCount:", objc_msgSend(v9, "failureCountAtIndex:", i));
  }

}

- (unsigned)startCount
{
  return self->_startCount;
}

- (unsigned)successCount
{
  return self->_successCount;
}

@end
