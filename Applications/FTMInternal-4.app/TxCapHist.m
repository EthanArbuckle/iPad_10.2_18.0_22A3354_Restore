@implementation TxCapHist

- (void)dealloc
{
  uint64_t v3;
  objc_super v4;

  PBRepeatedUInt32Clear(&self->_pucchCounters, a2);
  PBRepeatedUInt32Clear(&self->_puschCounters, v3);
  v4.receiver = self;
  v4.super_class = (Class)TxCapHist;
  -[TxCapHist dealloc](&v4, "dealloc");
}

- (void)setBand:(int)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_band = a3;
}

- (void)setHasBand:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (BOOL)hasBand
{
  return *(_BYTE *)&self->_has & 1;
}

- (int)proxState
{
  if ((*(_BYTE *)&self->_has & 4) != 0)
    return self->_proxState;
  else
    return 0;
}

- (void)setProxState:(int)a3
{
  *(_BYTE *)&self->_has |= 4u;
  self->_proxState = a3;
}

- (void)setHasProxState:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 4;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFB | v3;
}

- (BOOL)hasProxState
{
  return (*(_BYTE *)&self->_has >> 2) & 1;
}

- (id)proxStateAsString:(int)a3
{
  if (a3 >= 3)
    return (id)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("(unknown: %i)"), *(_QWORD *)&a3));
  else
    return *(&off_10025F090 + a3);
}

- (int)StringAsProxState:(id)a3
{
  id v3;
  int v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("NONE")) & 1) != 0)
  {
    v4 = 0;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("INTERMIDIATE")) & 1) != 0)
  {
    v4 = 1;
  }
  else if (objc_msgSend(v3, "isEqualToString:", CFSTR("PROX")))
  {
    v4 = 2;
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (void)setPowerCap10thDbm:(int)a3
{
  *(_BYTE *)&self->_has |= 2u;
  self->_powerCap10thDbm = a3;
}

- (void)setHasPowerCap10thDbm:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFD | v3;
}

- (BOOL)hasPowerCap10thDbm
{
  return (*(_BYTE *)&self->_has >> 1) & 1;
}

- (unint64_t)pucchCountersCount
{
  return self->_pucchCounters.count;
}

- (unsigned)pucchCounters
{
  return self->_pucchCounters.list;
}

- (void)clearPucchCounters
{
  PBRepeatedUInt32Clear(&self->_pucchCounters, a2);
}

- (void)addPucchCounter:(unsigned int)a3
{
  PBRepeatedUInt32Add(&self->_pucchCounters, *(_QWORD *)&a3);
}

- (unsigned)pucchCounterAtIndex:(unint64_t)a3
{
  $1729E44CE8A3ADE0AA70C2F19EF2BB02 *p_pucchCounters;
  unint64_t count;
  void *v6;
  void *v7;

  p_pucchCounters = &self->_pucchCounters;
  count = self->_pucchCounters.count;
  if (count <= a3)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("idx (%tu) is out of range (%tu)"), a3, count));
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSException exceptionWithName:reason:userInfo:](NSException, "exceptionWithName:reason:userInfo:", NSRangeException, v6, 0));
    objc_msgSend(v7, "raise");

  }
  return p_pucchCounters->list[a3];
}

- (void)setPucchCounters:(unsigned int *)a3 count:(unint64_t)a4
{
  PBRepeatedUInt32Set(&self->_pucchCounters, a3, a4);
}

- (unint64_t)puschCountersCount
{
  return self->_puschCounters.count;
}

- (unsigned)puschCounters
{
  return self->_puschCounters.list;
}

- (void)clearPuschCounters
{
  PBRepeatedUInt32Clear(&self->_puschCounters, a2);
}

- (void)addPuschCounter:(unsigned int)a3
{
  PBRepeatedUInt32Add(&self->_puschCounters, *(_QWORD *)&a3);
}

- (unsigned)puschCounterAtIndex:(unint64_t)a3
{
  $1729E44CE8A3ADE0AA70C2F19EF2BB02 *p_puschCounters;
  unint64_t count;
  void *v6;
  void *v7;

  p_puschCounters = &self->_puschCounters;
  count = self->_puschCounters.count;
  if (count <= a3)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("idx (%tu) is out of range (%tu)"), a3, count));
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSException exceptionWithName:reason:userInfo:](NSException, "exceptionWithName:reason:userInfo:", NSRangeException, v6, 0));
    objc_msgSend(v7, "raise");

  }
  return p_puschCounters->list[a3];
}

- (void)setPuschCounters:(unsigned int *)a3 count:(unint64_t)a4
{
  PBRepeatedUInt32Set(&self->_puschCounters, a3, a4);
}

- (id)description
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)TxCapHist;
  v3 = -[TxCapHist description](&v8, "description");
  v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[TxCapHist dictionaryRepresentation](self, "dictionaryRepresentation"));
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
  uint64_t proxState;
  void *v13;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary"));
  has = (char)self->_has;
  if ((has & 1) == 0)
  {
    if ((*(_BYTE *)&self->_has & 4) == 0)
      goto LABEL_3;
LABEL_7:
    proxState = self->_proxState;
    if (proxState >= 3)
      v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("(unknown: %i)"), self->_proxState));
    else
      v13 = *(&off_10025F090 + proxState);
    objc_msgSend(v3, "setObject:forKey:", v13, CFSTR("prox_state"));

    if ((*(_BYTE *)&self->_has & 2) != 0)
      goto LABEL_4;
    goto LABEL_5;
  }
  v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](NSNumber, "numberWithInt:", self->_band));
  objc_msgSend(v3, "setObject:forKey:", v11, CFSTR("band"));

  has = (char)self->_has;
  if ((has & 4) != 0)
    goto LABEL_7;
LABEL_3:
  if ((has & 2) != 0)
  {
LABEL_4:
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](NSNumber, "numberWithInt:", self->_powerCap10thDbm));
    objc_msgSend(v3, "setObject:forKey:", v5, CFSTR("power_cap_10th_dbm"));

  }
LABEL_5:
  v6 = PBRepeatedUInt32NSArray(&self->_pucchCounters);
  v7 = (void *)objc_claimAutoreleasedReturnValue(v6);
  objc_msgSend(v3, "setObject:forKey:", v7, CFSTR("pucch_counter"));

  v8 = PBRepeatedUInt32NSArray(&self->_puschCounters);
  v9 = (void *)objc_claimAutoreleasedReturnValue(v8);
  objc_msgSend(v3, "setObject:forKey:", v9, CFSTR("pusch_counter"));

  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return sub_100085DD8((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4;
  void *v5;
  char has;
  unint64_t v7;
  $1729E44CE8A3ADE0AA70C2F19EF2BB02 *p_puschCounters;
  unint64_t v9;
  uint64_t v10;

  v4 = a3;
  v5 = v4;
  has = (char)self->_has;
  if ((has & 1) != 0)
  {
    PBDataWriterWriteInt32Field(v4, self->_band, 1);
    has = (char)self->_has;
    if ((has & 4) == 0)
    {
LABEL_3:
      if ((has & 2) == 0)
        goto LABEL_5;
      goto LABEL_4;
    }
  }
  else if ((*(_BYTE *)&self->_has & 4) == 0)
  {
    goto LABEL_3;
  }
  PBDataWriterWriteInt32Field(v5, self->_proxState, 2);
  if ((*(_BYTE *)&self->_has & 2) != 0)
LABEL_4:
    PBDataWriterWriteSint32Field(v5, self->_powerCap10thDbm, 4);
LABEL_5:
  if (self->_pucchCounters.count)
  {
    v10 = 0;
    PBDataWriterPlaceMark(v5, &v10, 6);
    if (self->_pucchCounters.count)
    {
      v7 = 0;
      do
        PBDataWriterWriteUint32Field(v5, self->_pucchCounters.list[v7++], 0xFFFFFFFFLL);
      while (v7 < self->_pucchCounters.count);
    }
    PBDataWriterRecallMark(v5, &v10);
  }
  p_puschCounters = &self->_puschCounters;
  if (p_puschCounters->count)
  {
    v10 = 0;
    PBDataWriterPlaceMark(v5, &v10, 7);
    if (p_puschCounters->count)
    {
      v9 = 0;
      do
        PBDataWriterWriteUint32Field(v5, p_puschCounters->list[v9++], 0xFFFFFFFFLL);
      while (v9 < p_puschCounters->count);
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
  if ((has & 1) == 0)
  {
    if ((*(_BYTE *)&self->_has & 4) == 0)
      goto LABEL_3;
LABEL_15:
    v4[16] = self->_proxState;
    *((_BYTE *)v4 + 68) |= 4u;
    if ((*(_BYTE *)&self->_has & 2) == 0)
      goto LABEL_5;
    goto LABEL_4;
  }
  v4[14] = self->_band;
  *((_BYTE *)v4 + 68) |= 1u;
  has = (char)self->_has;
  if ((has & 4) != 0)
    goto LABEL_15;
LABEL_3:
  if ((has & 2) != 0)
  {
LABEL_4:
    v4[15] = self->_powerCap10thDbm;
    *((_BYTE *)v4 + 68) |= 2u;
  }
LABEL_5:
  v12 = v4;
  if (-[TxCapHist pucchCountersCount](self, "pucchCountersCount"))
  {
    objc_msgSend(v12, "clearPucchCounters");
    v6 = -[TxCapHist pucchCountersCount](self, "pucchCountersCount");
    if (v6)
    {
      v7 = v6;
      for (i = 0; i != v7; ++i)
        objc_msgSend(v12, "addPucchCounter:", -[TxCapHist pucchCounterAtIndex:](self, "pucchCounterAtIndex:", i));
    }
  }
  if (-[TxCapHist puschCountersCount](self, "puschCountersCount"))
  {
    objc_msgSend(v12, "clearPuschCounters");
    v9 = -[TxCapHist puschCountersCount](self, "puschCountersCount");
    if (v9)
    {
      v10 = v9;
      for (j = 0; j != v10; ++j)
        objc_msgSend(v12, "addPuschCounter:", -[TxCapHist puschCounterAtIndex:](self, "puschCounterAtIndex:", j));
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
  if ((has & 1) == 0)
  {
    if ((*(_BYTE *)&self->_has & 4) == 0)
      goto LABEL_3;
LABEL_7:
    *((_DWORD *)v4 + 16) = self->_proxState;
    v4[68] |= 4u;
    if ((*(_BYTE *)&self->_has & 2) == 0)
      goto LABEL_5;
    goto LABEL_4;
  }
  *((_DWORD *)v4 + 14) = self->_band;
  v4[68] |= 1u;
  has = (char)self->_has;
  if ((has & 4) != 0)
    goto LABEL_7;
LABEL_3:
  if ((has & 2) != 0)
  {
LABEL_4:
    *((_DWORD *)v4 + 15) = self->_powerCap10thDbm;
    v4[68] |= 2u;
  }
LABEL_5:
  PBRepeatedUInt32Copy(v4 + 8, &self->_pucchCounters);
  PBRepeatedUInt32Copy(v5 + 32, &self->_puschCounters);
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
    if ((v4[68] & 1) == 0 || self->_band != *((_DWORD *)v4 + 14))
      goto LABEL_19;
  }
  else if ((v4[68] & 1) != 0)
  {
    goto LABEL_19;
  }
  if ((*(_BYTE *)&self->_has & 4) != 0)
  {
    if ((v4[68] & 4) == 0 || self->_proxState != *((_DWORD *)v4 + 16))
      goto LABEL_19;
  }
  else if ((v4[68] & 4) != 0)
  {
    goto LABEL_19;
  }
  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
    if ((v4[68] & 2) == 0 || self->_powerCap10thDbm != *((_DWORD *)v4 + 15))
      goto LABEL_19;
  }
  else if ((v4[68] & 2) != 0)
  {
    goto LABEL_19;
  }
  if (!PBRepeatedUInt32IsEqual(&self->_pucchCounters, v4 + 8))
  {
LABEL_19:
    IsEqual = 0;
    goto LABEL_20;
  }
  IsEqual = PBRepeatedUInt32IsEqual(&self->_puschCounters, v4 + 32);
LABEL_20:

  return IsEqual;
}

- (unint64_t)hash
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  if ((*(_BYTE *)&self->_has & 1) == 0)
  {
    v3 = 0;
    if ((*(_BYTE *)&self->_has & 4) != 0)
      goto LABEL_3;
LABEL_6:
    v4 = 0;
    if ((*(_BYTE *)&self->_has & 2) != 0)
      goto LABEL_4;
LABEL_7:
    v5 = 0;
    goto LABEL_8;
  }
  v3 = 2654435761 * self->_band;
  if ((*(_BYTE *)&self->_has & 4) == 0)
    goto LABEL_6;
LABEL_3:
  v4 = 2654435761 * self->_proxState;
  if ((*(_BYTE *)&self->_has & 2) == 0)
    goto LABEL_7;
LABEL_4:
  v5 = 2654435761 * self->_powerCap10thDbm;
LABEL_8:
  v6 = v4 ^ v3 ^ v5 ^ PBRepeatedUInt32Hash(&self->_pucchCounters);
  return v6 ^ PBRepeatedUInt32Hash(&self->_puschCounters);
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
  v5 = *((_BYTE *)v4 + 68);
  if ((v5 & 1) != 0)
  {
    self->_band = *((_DWORD *)v4 + 14);
    *(_BYTE *)&self->_has |= 1u;
    v5 = *((_BYTE *)v4 + 68);
    if ((v5 & 4) == 0)
    {
LABEL_3:
      if ((v5 & 2) == 0)
        goto LABEL_5;
      goto LABEL_4;
    }
  }
  else if ((*((_BYTE *)v4 + 68) & 4) == 0)
  {
    goto LABEL_3;
  }
  self->_proxState = *((_DWORD *)v4 + 16);
  *(_BYTE *)&self->_has |= 4u;
  if ((*((_BYTE *)v4 + 68) & 2) != 0)
  {
LABEL_4:
    self->_powerCap10thDbm = *((_DWORD *)v4 + 15);
    *(_BYTE *)&self->_has |= 2u;
  }
LABEL_5:
  v12 = v4;
  v6 = (char *)objc_msgSend(v4, "pucchCountersCount");
  if (v6)
  {
    v7 = v6;
    for (i = 0; i != v7; ++i)
      -[TxCapHist addPucchCounter:](self, "addPucchCounter:", objc_msgSend(v12, "pucchCounterAtIndex:", i));
  }
  v9 = (char *)objc_msgSend(v12, "puschCountersCount");
  if (v9)
  {
    v10 = v9;
    for (j = 0; j != v10; ++j)
      -[TxCapHist addPuschCounter:](self, "addPuschCounter:", objc_msgSend(v12, "puschCounterAtIndex:", j));
  }

}

- (int)band
{
  return self->_band;
}

- (int)powerCap10thDbm
{
  return self->_powerCap10thDbm;
}

@end
