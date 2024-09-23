@implementation RedirFromUtranCount

- (void)dealloc
{
  uint64_t v3;
  objc_super v4;

  PBRepeatedUInt32Clear(&self->_endStatusCounts, a2);
  PBRepeatedUInt32Clear(&self->_endStatusCountAps, v3);
  v4.receiver = self;
  v4.super_class = (Class)RedirFromUtranCount;
  -[RedirFromUtranCount dealloc](&v4, "dealloc");
}

- (int)redirCause
{
  if ((*(_BYTE *)&self->_has & 1) != 0)
    return self->_redirCause;
  else
    return 0;
}

- (void)setRedirCause:(int)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_redirCause = a3;
}

- (void)setHasRedirCause:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (BOOL)hasRedirCause
{
  return *(_BYTE *)&self->_has & 1;
}

- (id)redirCauseAsString:(int)a3
{
  if (a3 >= 3)
    return (id)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("(unknown: %i)"), *(_QWORD *)&a3));
  else
    return off_100260028[a3];
}

- (int)StringAsRedirCause:(id)a3
{
  id v3;
  int v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("WTOL_REDIR_CAUSE_CONN_RELEASE")) & 1) != 0)
  {
    v4 = 0;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("WTOL_REDIR_CAUSE_CONN_REJECT")) & 1) != 0)
  {
    v4 = 1;
  }
  else if (objc_msgSend(v3, "isEqualToString:", CFSTR("WTOL_REDIR_CAUSE_NONE")))
  {
    v4 = 2;
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

- (unint64_t)endStatusCountsCount
{
  return self->_endStatusCounts.count;
}

- (unsigned)endStatusCounts
{
  return self->_endStatusCounts.list;
}

- (void)clearEndStatusCounts
{
  PBRepeatedUInt32Clear(&self->_endStatusCounts, a2);
}

- (void)addEndStatusCount:(unsigned int)a3
{
  PBRepeatedUInt32Add(&self->_endStatusCounts, *(_QWORD *)&a3);
}

- (unsigned)endStatusCountAtIndex:(unint64_t)a3
{
  $1729E44CE8A3ADE0AA70C2F19EF2BB02 *p_endStatusCounts;
  unint64_t count;
  void *v6;
  void *v7;

  p_endStatusCounts = &self->_endStatusCounts;
  count = self->_endStatusCounts.count;
  if (count <= a3)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("idx (%tu) is out of range (%tu)"), a3, count));
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSException exceptionWithName:reason:userInfo:](NSException, "exceptionWithName:reason:userInfo:", NSRangeException, v6, 0));
    objc_msgSend(v7, "raise");

  }
  return p_endStatusCounts->list[a3];
}

- (void)setEndStatusCounts:(unsigned int *)a3 count:(unint64_t)a4
{
  PBRepeatedUInt32Set(&self->_endStatusCounts, a3, a4);
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

- (unint64_t)endStatusCountApsCount
{
  return self->_endStatusCountAps.count;
}

- (unsigned)endStatusCountAps
{
  return self->_endStatusCountAps.list;
}

- (void)clearEndStatusCountAps
{
  PBRepeatedUInt32Clear(&self->_endStatusCountAps, a2);
}

- (void)addEndStatusCountAp:(unsigned int)a3
{
  PBRepeatedUInt32Add(&self->_endStatusCountAps, *(_QWORD *)&a3);
}

- (unsigned)endStatusCountApAtIndex:(unint64_t)a3
{
  $1729E44CE8A3ADE0AA70C2F19EF2BB02 *p_endStatusCountAps;
  unint64_t count;
  void *v6;
  void *v7;

  p_endStatusCountAps = &self->_endStatusCountAps;
  count = self->_endStatusCountAps.count;
  if (count <= a3)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("idx (%tu) is out of range (%tu)"), a3, count));
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSException exceptionWithName:reason:userInfo:](NSException, "exceptionWithName:reason:userInfo:", NSRangeException, v6, 0));
    objc_msgSend(v7, "raise");

  }
  return p_endStatusCountAps->list[a3];
}

- (void)setEndStatusCountAps:(unsigned int *)a3 count:(unint64_t)a4
{
  PBRepeatedUInt32Set(&self->_endStatusCountAps, a3, a4);
}

- (id)description
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)RedirFromUtranCount;
  v3 = -[RedirFromUtranCount description](&v8, "description");
  v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[RedirFromUtranCount dictionaryRepresentation](self, "dictionaryRepresentation"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@ %@"), v4, v5));

  return v6;
}

- (id)dictionaryRepresentation
{
  void *v3;
  char has;
  uint64_t redirCause;
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
    redirCause = self->_redirCause;
    if (redirCause >= 3)
      v6 = (__CFString *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("(unknown: %i)"), self->_redirCause));
    else
      v6 = off_100260028[redirCause];
    objc_msgSend(v3, "setObject:forKey:", v6, CFSTR("redir_cause"));

    has = (char)self->_has;
  }
  if ((has & 2) != 0)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", self->_total));
    objc_msgSend(v3, "setObject:forKey:", v7, CFSTR("total"));

  }
  v8 = PBRepeatedUInt32NSArray(&self->_endStatusCounts);
  v9 = (void *)objc_claimAutoreleasedReturnValue(v8);
  objc_msgSend(v3, "setObject:forKey:", v9, CFSTR("end_status_count"));

  if ((*(_BYTE *)&self->_has & 4) != 0)
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", self->_totalAp));
    objc_msgSend(v3, "setObject:forKey:", v10, CFSTR("total_ap"));

  }
  v11 = PBRepeatedUInt32NSArray(&self->_endStatusCountAps);
  v12 = (void *)objc_claimAutoreleasedReturnValue(v11);
  objc_msgSend(v3, "setObject:forKey:", v12, CFSTR("end_status_count_ap"));

  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return sub_100138304((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4;
  void *v5;
  char has;
  unint64_t v7;
  $1729E44CE8A3ADE0AA70C2F19EF2BB02 *p_endStatusCountAps;
  unint64_t v9;
  uint64_t v10;

  v4 = a3;
  v5 = v4;
  has = (char)self->_has;
  if ((has & 1) != 0)
  {
    PBDataWriterWriteInt32Field(v4, self->_redirCause, 1);
    has = (char)self->_has;
  }
  if ((has & 2) != 0)
    PBDataWriterWriteUint32Field(v5, self->_total, 3);
  if (self->_endStatusCounts.count)
  {
    v10 = 0;
    PBDataWriterPlaceMark(v5, &v10, 5);
    if (self->_endStatusCounts.count)
    {
      v7 = 0;
      do
        PBDataWriterWriteUint32Field(v5, self->_endStatusCounts.list[v7++], 0xFFFFFFFFLL);
      while (v7 < self->_endStatusCounts.count);
    }
    PBDataWriterRecallMark(v5, &v10);
  }
  if ((*(_BYTE *)&self->_has & 4) != 0)
    PBDataWriterWriteUint32Field(v5, self->_totalAp, 6);
  p_endStatusCountAps = &self->_endStatusCountAps;
  if (p_endStatusCountAps->count)
  {
    v10 = 0;
    PBDataWriterPlaceMark(v5, &v10, 7);
    if (p_endStatusCountAps->count)
    {
      v9 = 0;
      do
        PBDataWriterWriteUint32Field(v5, p_endStatusCountAps->list[v9++], 0xFFFFFFFFLL);
      while (v9 < p_endStatusCountAps->count);
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
    v4[14] = self->_redirCause;
    *((_BYTE *)v4 + 68) |= 1u;
    has = (char)self->_has;
  }
  if ((has & 2) != 0)
  {
    v4[15] = self->_total;
    *((_BYTE *)v4 + 68) |= 2u;
  }
  v12 = v4;
  if (-[RedirFromUtranCount endStatusCountsCount](self, "endStatusCountsCount"))
  {
    objc_msgSend(v12, "clearEndStatusCounts");
    v6 = -[RedirFromUtranCount endStatusCountsCount](self, "endStatusCountsCount");
    if (v6)
    {
      v7 = v6;
      for (i = 0; i != v7; ++i)
        objc_msgSend(v12, "addEndStatusCount:", -[RedirFromUtranCount endStatusCountAtIndex:](self, "endStatusCountAtIndex:", i));
    }
  }
  if ((*(_BYTE *)&self->_has & 4) != 0)
  {
    *((_DWORD *)v12 + 16) = self->_totalAp;
    *((_BYTE *)v12 + 68) |= 4u;
  }
  if (-[RedirFromUtranCount endStatusCountApsCount](self, "endStatusCountApsCount"))
  {
    objc_msgSend(v12, "clearEndStatusCountAps");
    v9 = -[RedirFromUtranCount endStatusCountApsCount](self, "endStatusCountApsCount");
    if (v9)
    {
      v10 = v9;
      for (j = 0; j != v10; ++j)
        objc_msgSend(v12, "addEndStatusCountAp:", -[RedirFromUtranCount endStatusCountApAtIndex:](self, "endStatusCountApAtIndex:", j));
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
    v4[14] = self->_redirCause;
    *((_BYTE *)v4 + 68) |= 1u;
    has = (char)self->_has;
  }
  if ((has & 2) != 0)
  {
    v4[15] = self->_total;
    *((_BYTE *)v4 + 68) |= 2u;
  }
  PBRepeatedUInt32Copy(v4 + 8, &self->_endStatusCounts);
  if ((*(_BYTE *)&self->_has & 4) != 0)
  {
    v5[16] = self->_totalAp;
    *((_BYTE *)v5 + 68) |= 4u;
  }
  PBRepeatedUInt32Copy(v5 + 2, &self->_endStatusCountAps);
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
    if ((v4[68] & 1) == 0 || self->_redirCause != *((_DWORD *)v4 + 14))
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
  if (!PBRepeatedUInt32IsEqual(&self->_endStatusCounts, v4 + 32))
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
  IsEqual = PBRepeatedUInt32IsEqual(&self->_endStatusCountAps, v4 + 8);
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
    v3 = 2654435761 * self->_redirCause;
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
  v5 = PBRepeatedUInt32Hash(&self->_endStatusCounts);
  if ((*(_BYTE *)&self->_has & 4) != 0)
    v6 = 2654435761 * self->_totalAp;
  else
    v6 = 0;
  return v4 ^ v3 ^ v6 ^ v5 ^ PBRepeatedUInt32Hash(&self->_endStatusCountAps);
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
    self->_redirCause = *((_DWORD *)v4 + 14);
    *(_BYTE *)&self->_has |= 1u;
    v5 = *((_BYTE *)v4 + 68);
  }
  if ((v5 & 2) != 0)
  {
    self->_total = *((_DWORD *)v4 + 15);
    *(_BYTE *)&self->_has |= 2u;
  }
  v12 = (unsigned int *)v4;
  v6 = (char *)objc_msgSend(v4, "endStatusCountsCount");
  if (v6)
  {
    v7 = v6;
    for (i = 0; i != v7; ++i)
      -[RedirFromUtranCount addEndStatusCount:](self, "addEndStatusCount:", objc_msgSend(v12, "endStatusCountAtIndex:", i));
  }
  if ((v12[17] & 4) != 0)
  {
    self->_totalAp = v12[16];
    *(_BYTE *)&self->_has |= 4u;
  }
  v9 = (char *)objc_msgSend(v12, "endStatusCountApsCount");
  if (v9)
  {
    v10 = v9;
    for (j = 0; j != v10; ++j)
      -[RedirFromUtranCount addEndStatusCountAp:](self, "addEndStatusCountAp:", objc_msgSend(v12, "endStatusCountApAtIndex:", j));
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
