@implementation ReselFromDoCount

- (void)dealloc
{
  objc_super v3;

  PBRepeatedUInt32Clear(&self->_endStatusCounts, a2);
  v3.receiver = self;
  v3.super_class = (Class)ReselFromDoCount;
  -[ReselFromDoCount dealloc](&v3, "dealloc");
}

- (void)setEhrpd:(BOOL)a3
{
  *(_BYTE *)&self->_has |= 2u;
  self->_ehrpd = a3;
}

- (void)setHasEhrpd:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFD | v3;
}

- (BOOL)hasEhrpd
{
  return (*(_BYTE *)&self->_has >> 1) & 1;
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

- (id)description
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)ReselFromDoCount;
  v3 = -[ReselFromDoCount description](&v8, "description");
  v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[ReselFromDoCount dictionaryRepresentation](self, "dictionaryRepresentation"));
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
  if ((has & 2) != 0)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", self->_ehrpd));
    objc_msgSend(v3, "setObject:forKey:", v5, CFSTR("ehrpd"));

    has = (char)self->_has;
  }
  if ((has & 1) != 0)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", self->_total));
    objc_msgSend(v3, "setObject:forKey:", v6, CFSTR("total"));

  }
  v7 = PBRepeatedUInt32NSArray(&self->_endStatusCounts);
  v8 = (void *)objc_claimAutoreleasedReturnValue(v7);
  objc_msgSend(v3, "setObject:forKey:", v8, CFSTR("end_status_count"));

  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return sub_1000D9568((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4;
  void *v5;
  char has;
  $1729E44CE8A3ADE0AA70C2F19EF2BB02 *p_endStatusCounts;
  unint64_t v8;
  uint64_t v9;

  v4 = a3;
  v5 = v4;
  has = (char)self->_has;
  if ((has & 2) != 0)
  {
    PBDataWriterWriteBOOLField(v4, self->_ehrpd, 1);
    has = (char)self->_has;
  }
  if ((has & 1) != 0)
    PBDataWriterWriteUint32Field(v5, self->_total, 3);
  p_endStatusCounts = &self->_endStatusCounts;
  if (p_endStatusCounts->count)
  {
    v9 = 0;
    PBDataWriterPlaceMark(v5, &v9, 5);
    if (p_endStatusCounts->count)
    {
      v8 = 0;
      do
        PBDataWriterWriteUint32Field(v5, p_endStatusCounts->list[v8++], 0xFFFFFFFFLL);
      while (v8 < p_endStatusCounts->count);
    }
    PBDataWriterRecallMark(v5, &v9);
  }

}

- (void)copyTo:(id)a3
{
  _BYTE *v4;
  char has;
  unint64_t v6;
  unint64_t v7;
  uint64_t i;
  id v9;

  v4 = a3;
  has = (char)self->_has;
  if ((has & 2) != 0)
  {
    v4[36] = self->_ehrpd;
    v4[40] |= 2u;
    has = (char)self->_has;
  }
  if ((has & 1) != 0)
  {
    *((_DWORD *)v4 + 8) = self->_total;
    v4[40] |= 1u;
  }
  v9 = v4;
  if (-[ReselFromDoCount endStatusCountsCount](self, "endStatusCountsCount"))
  {
    objc_msgSend(v9, "clearEndStatusCounts");
    v6 = -[ReselFromDoCount endStatusCountsCount](self, "endStatusCountsCount");
    if (v6)
    {
      v7 = v6;
      for (i = 0; i != v7; ++i)
        objc_msgSend(v9, "addEndStatusCount:", -[ReselFromDoCount endStatusCountAtIndex:](self, "endStatusCountAtIndex:", i));
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
  if ((has & 2) != 0)
  {
    v4[36] = self->_ehrpd;
    v4[40] |= 2u;
    has = (char)self->_has;
  }
  if ((has & 1) != 0)
  {
    *((_DWORD *)v4 + 8) = self->_total;
    v4[40] |= 1u;
  }
  PBRepeatedUInt32Copy(v4 + 8, &self->_endStatusCounts);
  return v5;
}

- (BOOL)isEqual:(id)a3
{
  char *v4;
  uint64_t v5;
  char IsEqual;

  v4 = (char *)a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class(self, v5)))
    goto LABEL_16;
  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
    if ((v4[40] & 2) != 0)
    {
      if (self->_ehrpd)
      {
        if (!v4[36])
          goto LABEL_16;
        goto LABEL_10;
      }
      if (!v4[36])
        goto LABEL_10;
    }
LABEL_16:
    IsEqual = 0;
    goto LABEL_17;
  }
  if ((v4[40] & 2) != 0)
    goto LABEL_16;
LABEL_10:
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    if ((v4[40] & 1) == 0 || self->_total != *((_DWORD *)v4 + 8))
      goto LABEL_16;
  }
  else if ((v4[40] & 1) != 0)
  {
    goto LABEL_16;
  }
  IsEqual = PBRepeatedUInt32IsEqual(&self->_endStatusCounts, v4 + 8);
LABEL_17:

  return IsEqual;
}

- (unint64_t)hash
{
  uint64_t v2;
  uint64_t v3;

  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
    v2 = 2654435761 * self->_ehrpd;
    if ((*(_BYTE *)&self->_has & 1) != 0)
      goto LABEL_3;
LABEL_5:
    v3 = 0;
    return v3 ^ v2 ^ PBRepeatedUInt32Hash(&self->_endStatusCounts);
  }
  v2 = 0;
  if ((*(_BYTE *)&self->_has & 1) == 0)
    goto LABEL_5;
LABEL_3:
  v3 = 2654435761 * self->_total;
  return v3 ^ v2 ^ PBRepeatedUInt32Hash(&self->_endStatusCounts);
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
  if ((v5 & 2) != 0)
  {
    self->_ehrpd = *((_BYTE *)v4 + 36);
    *(_BYTE *)&self->_has |= 2u;
    v5 = *((_BYTE *)v4 + 40);
  }
  if ((v5 & 1) != 0)
  {
    self->_total = *((_DWORD *)v4 + 8);
    *(_BYTE *)&self->_has |= 1u;
  }
  v9 = v4;
  v6 = (char *)objc_msgSend(v4, "endStatusCountsCount");
  if (v6)
  {
    v7 = v6;
    for (i = 0; i != v7; ++i)
      -[ReselFromDoCount addEndStatusCount:](self, "addEndStatusCount:", objc_msgSend(v9, "endStatusCountAtIndex:", i));
  }

}

- (BOOL)ehrpd
{
  return self->_ehrpd;
}

- (unsigned)total
{
  return self->_total;
}

@end
