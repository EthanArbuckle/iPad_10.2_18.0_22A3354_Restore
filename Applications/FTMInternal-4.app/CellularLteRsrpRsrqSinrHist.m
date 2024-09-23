@implementation CellularLteRsrpRsrqSinrHist

- (void)dealloc
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
  uint64_t v12;
  uint64_t v13;
  objc_super v14;

  PBRepeatedUInt32Clear(&self->_rsrp0s, a2);
  PBRepeatedUInt32Clear(&self->_rsrp1s, v3);
  PBRepeatedUInt32Clear(&self->_rsrq0s, v4);
  PBRepeatedUInt32Clear(&self->_rsrq1s, v5);
  PBRepeatedUInt32Clear(&self->_sinr0s, v6);
  PBRepeatedUInt32Clear(&self->_sinr1s, v7);
  PBRepeatedUInt32Clear(&self->_rsrp2s, v8);
  PBRepeatedUInt32Clear(&self->_rsrp3s, v9);
  PBRepeatedUInt32Clear(&self->_rsrq2s, v10);
  PBRepeatedUInt32Clear(&self->_rsrq3s, v11);
  PBRepeatedUInt32Clear(&self->_sinr2s, v12);
  PBRepeatedUInt32Clear(&self->_sinr3s, v13);
  v14.receiver = self;
  v14.super_class = (Class)CellularLteRsrpRsrqSinrHist;
  -[CellularLteRsrpRsrqSinrHist dealloc](&v14, "dealloc");
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

- (void)setDuration:(unsigned int)a3
{
  *(_BYTE *)&self->_has |= 2u;
  self->_duration = a3;
}

- (void)setHasDuration:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFD | v3;
}

- (BOOL)hasDuration
{
  return (*(_BYTE *)&self->_has >> 1) & 1;
}

- (void)setMinRsrpDbm:(int)a3
{
  *(_BYTE *)&self->_has |= 4u;
  self->_minRsrpDbm = a3;
}

- (void)setHasMinRsrpDbm:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 4;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFB | v3;
}

- (BOOL)hasMinRsrpDbm
{
  return (*(_BYTE *)&self->_has >> 2) & 1;
}

- (unint64_t)rsrp0sCount
{
  return self->_rsrp0s.count;
}

- (unsigned)rsrp0s
{
  return self->_rsrp0s.list;
}

- (void)clearRsrp0s
{
  PBRepeatedUInt32Clear(&self->_rsrp0s, a2);
}

- (void)addRsrp0:(unsigned int)a3
{
  PBRepeatedUInt32Add(&self->_rsrp0s, *(_QWORD *)&a3);
}

- (unsigned)rsrp0AtIndex:(unint64_t)a3
{
  $1729E44CE8A3ADE0AA70C2F19EF2BB02 *p_rsrp0s;
  unint64_t count;
  void *v6;
  void *v7;

  p_rsrp0s = &self->_rsrp0s;
  count = self->_rsrp0s.count;
  if (count <= a3)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("idx (%tu) is out of range (%tu)"), a3, count));
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSException exceptionWithName:reason:userInfo:](NSException, "exceptionWithName:reason:userInfo:", NSRangeException, v6, 0));
    objc_msgSend(v7, "raise");

  }
  return p_rsrp0s->list[a3];
}

- (void)setRsrp0s:(unsigned int *)a3 count:(unint64_t)a4
{
  PBRepeatedUInt32Set(&self->_rsrp0s, a3, a4);
}

- (unint64_t)rsrp1sCount
{
  return self->_rsrp1s.count;
}

- (unsigned)rsrp1s
{
  return self->_rsrp1s.list;
}

- (void)clearRsrp1s
{
  PBRepeatedUInt32Clear(&self->_rsrp1s, a2);
}

- (void)addRsrp1:(unsigned int)a3
{
  PBRepeatedUInt32Add(&self->_rsrp1s, *(_QWORD *)&a3);
}

- (unsigned)rsrp1AtIndex:(unint64_t)a3
{
  $1729E44CE8A3ADE0AA70C2F19EF2BB02 *p_rsrp1s;
  unint64_t count;
  void *v6;
  void *v7;

  p_rsrp1s = &self->_rsrp1s;
  count = self->_rsrp1s.count;
  if (count <= a3)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("idx (%tu) is out of range (%tu)"), a3, count));
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSException exceptionWithName:reason:userInfo:](NSException, "exceptionWithName:reason:userInfo:", NSRangeException, v6, 0));
    objc_msgSend(v7, "raise");

  }
  return p_rsrp1s->list[a3];
}

- (void)setRsrp1s:(unsigned int *)a3 count:(unint64_t)a4
{
  PBRepeatedUInt32Set(&self->_rsrp1s, a3, a4);
}

- (void)setMinRsrqDb:(int)a3
{
  *(_BYTE *)&self->_has |= 8u;
  self->_minRsrqDb = a3;
}

- (void)setHasMinRsrqDb:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 8;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xF7 | v3;
}

- (BOOL)hasMinRsrqDb
{
  return (*(_BYTE *)&self->_has >> 3) & 1;
}

- (unint64_t)rsrq0sCount
{
  return self->_rsrq0s.count;
}

- (unsigned)rsrq0s
{
  return self->_rsrq0s.list;
}

- (void)clearRsrq0s
{
  PBRepeatedUInt32Clear(&self->_rsrq0s, a2);
}

- (void)addRsrq0:(unsigned int)a3
{
  PBRepeatedUInt32Add(&self->_rsrq0s, *(_QWORD *)&a3);
}

- (unsigned)rsrq0AtIndex:(unint64_t)a3
{
  $1729E44CE8A3ADE0AA70C2F19EF2BB02 *p_rsrq0s;
  unint64_t count;
  void *v6;
  void *v7;

  p_rsrq0s = &self->_rsrq0s;
  count = self->_rsrq0s.count;
  if (count <= a3)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("idx (%tu) is out of range (%tu)"), a3, count));
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSException exceptionWithName:reason:userInfo:](NSException, "exceptionWithName:reason:userInfo:", NSRangeException, v6, 0));
    objc_msgSend(v7, "raise");

  }
  return p_rsrq0s->list[a3];
}

- (void)setRsrq0s:(unsigned int *)a3 count:(unint64_t)a4
{
  PBRepeatedUInt32Set(&self->_rsrq0s, a3, a4);
}

- (unint64_t)rsrq1sCount
{
  return self->_rsrq1s.count;
}

- (unsigned)rsrq1s
{
  return self->_rsrq1s.list;
}

- (void)clearRsrq1s
{
  PBRepeatedUInt32Clear(&self->_rsrq1s, a2);
}

- (void)addRsrq1:(unsigned int)a3
{
  PBRepeatedUInt32Add(&self->_rsrq1s, *(_QWORD *)&a3);
}

- (unsigned)rsrq1AtIndex:(unint64_t)a3
{
  $1729E44CE8A3ADE0AA70C2F19EF2BB02 *p_rsrq1s;
  unint64_t count;
  void *v6;
  void *v7;

  p_rsrq1s = &self->_rsrq1s;
  count = self->_rsrq1s.count;
  if (count <= a3)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("idx (%tu) is out of range (%tu)"), a3, count));
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSException exceptionWithName:reason:userInfo:](NSException, "exceptionWithName:reason:userInfo:", NSRangeException, v6, 0));
    objc_msgSend(v7, "raise");

  }
  return p_rsrq1s->list[a3];
}

- (void)setRsrq1s:(unsigned int *)a3 count:(unint64_t)a4
{
  PBRepeatedUInt32Set(&self->_rsrq1s, a3, a4);
}

- (void)setMinSinrDbx2:(int)a3
{
  *(_BYTE *)&self->_has |= 0x10u;
  self->_minSinrDbx2 = a3;
}

- (void)setHasMinSinrDbx2:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 16;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xEF | v3;
}

- (BOOL)hasMinSinrDbx2
{
  return (*(_BYTE *)&self->_has >> 4) & 1;
}

- (unint64_t)sinr0sCount
{
  return self->_sinr0s.count;
}

- (unsigned)sinr0s
{
  return self->_sinr0s.list;
}

- (void)clearSinr0s
{
  PBRepeatedUInt32Clear(&self->_sinr0s, a2);
}

- (void)addSinr0:(unsigned int)a3
{
  PBRepeatedUInt32Add(&self->_sinr0s, *(_QWORD *)&a3);
}

- (unsigned)sinr0AtIndex:(unint64_t)a3
{
  $1729E44CE8A3ADE0AA70C2F19EF2BB02 *p_sinr0s;
  unint64_t count;
  void *v6;
  void *v7;

  p_sinr0s = &self->_sinr0s;
  count = self->_sinr0s.count;
  if (count <= a3)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("idx (%tu) is out of range (%tu)"), a3, count));
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSException exceptionWithName:reason:userInfo:](NSException, "exceptionWithName:reason:userInfo:", NSRangeException, v6, 0));
    objc_msgSend(v7, "raise");

  }
  return p_sinr0s->list[a3];
}

- (void)setSinr0s:(unsigned int *)a3 count:(unint64_t)a4
{
  PBRepeatedUInt32Set(&self->_sinr0s, a3, a4);
}

- (unint64_t)sinr1sCount
{
  return self->_sinr1s.count;
}

- (unsigned)sinr1s
{
  return self->_sinr1s.list;
}

- (void)clearSinr1s
{
  PBRepeatedUInt32Clear(&self->_sinr1s, a2);
}

- (void)addSinr1:(unsigned int)a3
{
  PBRepeatedUInt32Add(&self->_sinr1s, *(_QWORD *)&a3);
}

- (unsigned)sinr1AtIndex:(unint64_t)a3
{
  $1729E44CE8A3ADE0AA70C2F19EF2BB02 *p_sinr1s;
  unint64_t count;
  void *v6;
  void *v7;

  p_sinr1s = &self->_sinr1s;
  count = self->_sinr1s.count;
  if (count <= a3)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("idx (%tu) is out of range (%tu)"), a3, count));
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSException exceptionWithName:reason:userInfo:](NSException, "exceptionWithName:reason:userInfo:", NSRangeException, v6, 0));
    objc_msgSend(v7, "raise");

  }
  return p_sinr1s->list[a3];
}

- (void)setSinr1s:(unsigned int *)a3 count:(unint64_t)a4
{
  PBRepeatedUInt32Set(&self->_sinr1s, a3, a4);
}

- (void)setSubsId:(unsigned int)a3
{
  *(_BYTE *)&self->_has |= 0x80u;
  self->_subsId = a3;
}

- (void)setHasSubsId:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 0x80;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = v3 & 0x80 | *(_BYTE *)&self->_has & 0x7F;
}

- (BOOL)hasSubsId
{
  return *(_BYTE *)&self->_has >> 7;
}

- (unint64_t)rsrp2sCount
{
  return self->_rsrp2s.count;
}

- (unsigned)rsrp2s
{
  return self->_rsrp2s.list;
}

- (void)clearRsrp2s
{
  PBRepeatedUInt32Clear(&self->_rsrp2s, a2);
}

- (void)addRsrp2:(unsigned int)a3
{
  PBRepeatedUInt32Add(&self->_rsrp2s, *(_QWORD *)&a3);
}

- (unsigned)rsrp2AtIndex:(unint64_t)a3
{
  $1729E44CE8A3ADE0AA70C2F19EF2BB02 *p_rsrp2s;
  unint64_t count;
  void *v6;
  void *v7;

  p_rsrp2s = &self->_rsrp2s;
  count = self->_rsrp2s.count;
  if (count <= a3)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("idx (%tu) is out of range (%tu)"), a3, count));
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSException exceptionWithName:reason:userInfo:](NSException, "exceptionWithName:reason:userInfo:", NSRangeException, v6, 0));
    objc_msgSend(v7, "raise");

  }
  return p_rsrp2s->list[a3];
}

- (void)setRsrp2s:(unsigned int *)a3 count:(unint64_t)a4
{
  PBRepeatedUInt32Set(&self->_rsrp2s, a3, a4);
}

- (unint64_t)rsrp3sCount
{
  return self->_rsrp3s.count;
}

- (unsigned)rsrp3s
{
  return self->_rsrp3s.list;
}

- (void)clearRsrp3s
{
  PBRepeatedUInt32Clear(&self->_rsrp3s, a2);
}

- (void)addRsrp3:(unsigned int)a3
{
  PBRepeatedUInt32Add(&self->_rsrp3s, *(_QWORD *)&a3);
}

- (unsigned)rsrp3AtIndex:(unint64_t)a3
{
  $1729E44CE8A3ADE0AA70C2F19EF2BB02 *p_rsrp3s;
  unint64_t count;
  void *v6;
  void *v7;

  p_rsrp3s = &self->_rsrp3s;
  count = self->_rsrp3s.count;
  if (count <= a3)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("idx (%tu) is out of range (%tu)"), a3, count));
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSException exceptionWithName:reason:userInfo:](NSException, "exceptionWithName:reason:userInfo:", NSRangeException, v6, 0));
    objc_msgSend(v7, "raise");

  }
  return p_rsrp3s->list[a3];
}

- (void)setRsrp3s:(unsigned int *)a3 count:(unint64_t)a4
{
  PBRepeatedUInt32Set(&self->_rsrp3s, a3, a4);
}

- (unint64_t)rsrq2sCount
{
  return self->_rsrq2s.count;
}

- (unsigned)rsrq2s
{
  return self->_rsrq2s.list;
}

- (void)clearRsrq2s
{
  PBRepeatedUInt32Clear(&self->_rsrq2s, a2);
}

- (void)addRsrq2:(unsigned int)a3
{
  PBRepeatedUInt32Add(&self->_rsrq2s, *(_QWORD *)&a3);
}

- (unsigned)rsrq2AtIndex:(unint64_t)a3
{
  $1729E44CE8A3ADE0AA70C2F19EF2BB02 *p_rsrq2s;
  unint64_t count;
  void *v6;
  void *v7;

  p_rsrq2s = &self->_rsrq2s;
  count = self->_rsrq2s.count;
  if (count <= a3)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("idx (%tu) is out of range (%tu)"), a3, count));
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSException exceptionWithName:reason:userInfo:](NSException, "exceptionWithName:reason:userInfo:", NSRangeException, v6, 0));
    objc_msgSend(v7, "raise");

  }
  return p_rsrq2s->list[a3];
}

- (void)setRsrq2s:(unsigned int *)a3 count:(unint64_t)a4
{
  PBRepeatedUInt32Set(&self->_rsrq2s, a3, a4);
}

- (unint64_t)rsrq3sCount
{
  return self->_rsrq3s.count;
}

- (unsigned)rsrq3s
{
  return self->_rsrq3s.list;
}

- (void)clearRsrq3s
{
  PBRepeatedUInt32Clear(&self->_rsrq3s, a2);
}

- (void)addRsrq3:(unsigned int)a3
{
  PBRepeatedUInt32Add(&self->_rsrq3s, *(_QWORD *)&a3);
}

- (unsigned)rsrq3AtIndex:(unint64_t)a3
{
  $1729E44CE8A3ADE0AA70C2F19EF2BB02 *p_rsrq3s;
  unint64_t count;
  void *v6;
  void *v7;

  p_rsrq3s = &self->_rsrq3s;
  count = self->_rsrq3s.count;
  if (count <= a3)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("idx (%tu) is out of range (%tu)"), a3, count));
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSException exceptionWithName:reason:userInfo:](NSException, "exceptionWithName:reason:userInfo:", NSRangeException, v6, 0));
    objc_msgSend(v7, "raise");

  }
  return p_rsrq3s->list[a3];
}

- (void)setRsrq3s:(unsigned int *)a3 count:(unint64_t)a4
{
  PBRepeatedUInt32Set(&self->_rsrq3s, a3, a4);
}

- (unint64_t)sinr2sCount
{
  return self->_sinr2s.count;
}

- (unsigned)sinr2s
{
  return self->_sinr2s.list;
}

- (void)clearSinr2s
{
  PBRepeatedUInt32Clear(&self->_sinr2s, a2);
}

- (void)addSinr2:(unsigned int)a3
{
  PBRepeatedUInt32Add(&self->_sinr2s, *(_QWORD *)&a3);
}

- (unsigned)sinr2AtIndex:(unint64_t)a3
{
  $1729E44CE8A3ADE0AA70C2F19EF2BB02 *p_sinr2s;
  unint64_t count;
  void *v6;
  void *v7;

  p_sinr2s = &self->_sinr2s;
  count = self->_sinr2s.count;
  if (count <= a3)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("idx (%tu) is out of range (%tu)"), a3, count));
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSException exceptionWithName:reason:userInfo:](NSException, "exceptionWithName:reason:userInfo:", NSRangeException, v6, 0));
    objc_msgSend(v7, "raise");

  }
  return p_sinr2s->list[a3];
}

- (void)setSinr2s:(unsigned int *)a3 count:(unint64_t)a4
{
  PBRepeatedUInt32Set(&self->_sinr2s, a3, a4);
}

- (unint64_t)sinr3sCount
{
  return self->_sinr3s.count;
}

- (unsigned)sinr3s
{
  return self->_sinr3s.list;
}

- (void)clearSinr3s
{
  PBRepeatedUInt32Clear(&self->_sinr3s, a2);
}

- (void)addSinr3:(unsigned int)a3
{
  PBRepeatedUInt32Add(&self->_sinr3s, *(_QWORD *)&a3);
}

- (unsigned)sinr3AtIndex:(unint64_t)a3
{
  $1729E44CE8A3ADE0AA70C2F19EF2BB02 *p_sinr3s;
  unint64_t count;
  void *v6;
  void *v7;

  p_sinr3s = &self->_sinr3s;
  count = self->_sinr3s.count;
  if (count <= a3)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("idx (%tu) is out of range (%tu)"), a3, count));
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSException exceptionWithName:reason:userInfo:](NSException, "exceptionWithName:reason:userInfo:", NSRangeException, v6, 0));
    objc_msgSend(v7, "raise");

  }
  return p_sinr3s->list[a3];
}

- (void)setSinr3s:(unsigned int *)a3 count:(unint64_t)a4
{
  PBRepeatedUInt32Set(&self->_sinr3s, a3, a4);
}

- (void)setNumSubs:(unsigned int)a3
{
  *(_BYTE *)&self->_has |= 0x20u;
  self->_numSubs = a3;
}

- (void)setHasNumSubs:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 32;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xDF | v3;
}

- (BOOL)hasNumSubs
{
  return (*(_BYTE *)&self->_has >> 5) & 1;
}

- (void)setPsPref:(unsigned int)a3
{
  *(_BYTE *)&self->_has |= 0x40u;
  self->_psPref = a3;
}

- (void)setHasPsPref:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 64;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xBF | v3;
}

- (BOOL)hasPsPref
{
  return (*(_BYTE *)&self->_has >> 6) & 1;
}

- (BOOL)hasPlmn
{
  return self->_plmn != 0;
}

- (id)description
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)CellularLteRsrpRsrqSinrHist;
  v3 = -[CellularLteRsrpRsrqSinrHist description](&v8, "description");
  v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[CellularLteRsrpRsrqSinrHist dictionaryRepresentation](self, "dictionaryRepresentation"));
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
  void *v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  uint64_t v18;
  void *v19;
  void *v20;
  uint64_t v21;
  void *v22;
  uint64_t v23;
  void *v24;
  uint64_t v25;
  void *v26;
  uint64_t v27;
  void *v28;
  uint64_t v29;
  void *v30;
  uint64_t v31;
  void *v32;
  char v33;
  void *v34;
  void *v35;
  NSData *plmn;
  void *v38;
  void *v39;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary"));
  has = (char)self->_has;
  if ((has & 1) != 0)
  {
    v38 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedLongLong:](NSNumber, "numberWithUnsignedLongLong:", self->_timestamp));
    objc_msgSend(v3, "setObject:forKey:", v38, CFSTR("timestamp"));

    has = (char)self->_has;
    if ((has & 2) == 0)
    {
LABEL_3:
      if ((has & 4) == 0)
        goto LABEL_5;
      goto LABEL_4;
    }
  }
  else if ((*(_BYTE *)&self->_has & 2) == 0)
  {
    goto LABEL_3;
  }
  v39 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", self->_duration));
  objc_msgSend(v3, "setObject:forKey:", v39, CFSTR("duration"));

  if ((*(_BYTE *)&self->_has & 4) != 0)
  {
LABEL_4:
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](NSNumber, "numberWithInt:", self->_minRsrpDbm));
    objc_msgSend(v3, "setObject:forKey:", v5, CFSTR("min_rsrp_dbm"));

  }
LABEL_5:
  v6 = PBRepeatedUInt32NSArray(&self->_rsrp0s);
  v7 = (void *)objc_claimAutoreleasedReturnValue(v6);
  objc_msgSend(v3, "setObject:forKey:", v7, CFSTR("rsrp0"));

  v8 = PBRepeatedUInt32NSArray(&self->_rsrp1s);
  v9 = (void *)objc_claimAutoreleasedReturnValue(v8);
  objc_msgSend(v3, "setObject:forKey:", v9, CFSTR("rsrp1"));

  if ((*(_BYTE *)&self->_has & 8) != 0)
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](NSNumber, "numberWithInt:", self->_minRsrqDb));
    objc_msgSend(v3, "setObject:forKey:", v10, CFSTR("min_rsrq_db"));

  }
  v11 = PBRepeatedUInt32NSArray(&self->_rsrq0s);
  v12 = (void *)objc_claimAutoreleasedReturnValue(v11);
  objc_msgSend(v3, "setObject:forKey:", v12, CFSTR("rsrq0"));

  v13 = PBRepeatedUInt32NSArray(&self->_rsrq1s);
  v14 = (void *)objc_claimAutoreleasedReturnValue(v13);
  objc_msgSend(v3, "setObject:forKey:", v14, CFSTR("rsrq1"));

  if ((*(_BYTE *)&self->_has & 0x10) != 0)
  {
    v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](NSNumber, "numberWithInt:", self->_minSinrDbx2));
    objc_msgSend(v3, "setObject:forKey:", v15, CFSTR("min_sinr_dbx2"));

  }
  v16 = PBRepeatedUInt32NSArray(&self->_sinr0s);
  v17 = (void *)objc_claimAutoreleasedReturnValue(v16);
  objc_msgSend(v3, "setObject:forKey:", v17, CFSTR("sinr0"));

  v18 = PBRepeatedUInt32NSArray(&self->_sinr1s);
  v19 = (void *)objc_claimAutoreleasedReturnValue(v18);
  objc_msgSend(v3, "setObject:forKey:", v19, CFSTR("sinr1"));

  if ((*(_BYTE *)&self->_has & 0x80000000) != 0)
  {
    v20 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", self->_subsId));
    objc_msgSend(v3, "setObject:forKey:", v20, CFSTR("subs_id"));

  }
  v21 = PBRepeatedUInt32NSArray(&self->_rsrp2s);
  v22 = (void *)objc_claimAutoreleasedReturnValue(v21);
  objc_msgSend(v3, "setObject:forKey:", v22, CFSTR("rsrp2"));

  v23 = PBRepeatedUInt32NSArray(&self->_rsrp3s);
  v24 = (void *)objc_claimAutoreleasedReturnValue(v23);
  objc_msgSend(v3, "setObject:forKey:", v24, CFSTR("rsrp3"));

  v25 = PBRepeatedUInt32NSArray(&self->_rsrq2s);
  v26 = (void *)objc_claimAutoreleasedReturnValue(v25);
  objc_msgSend(v3, "setObject:forKey:", v26, CFSTR("rsrq2"));

  v27 = PBRepeatedUInt32NSArray(&self->_rsrq3s);
  v28 = (void *)objc_claimAutoreleasedReturnValue(v27);
  objc_msgSend(v3, "setObject:forKey:", v28, CFSTR("rsrq3"));

  v29 = PBRepeatedUInt32NSArray(&self->_sinr2s);
  v30 = (void *)objc_claimAutoreleasedReturnValue(v29);
  objc_msgSend(v3, "setObject:forKey:", v30, CFSTR("sinr2"));

  v31 = PBRepeatedUInt32NSArray(&self->_sinr3s);
  v32 = (void *)objc_claimAutoreleasedReturnValue(v31);
  objc_msgSend(v3, "setObject:forKey:", v32, CFSTR("sinr3"));

  v33 = (char)self->_has;
  if ((v33 & 0x20) != 0)
  {
    v34 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", self->_numSubs));
    objc_msgSend(v3, "setObject:forKey:", v34, CFSTR("num_subs"));

    v33 = (char)self->_has;
  }
  if ((v33 & 0x40) != 0)
  {
    v35 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", self->_psPref));
    objc_msgSend(v3, "setObject:forKey:", v35, CFSTR("ps_pref"));

  }
  plmn = self->_plmn;
  if (plmn)
    objc_msgSend(v3, "setObject:forKey:", plmn, CFSTR("plmn"));
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return sub_1000EBC4C((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4;
  void *v5;
  char has;
  unint64_t v7;
  unint64_t v8;
  unint64_t v9;
  unint64_t v10;
  unint64_t v11;
  unint64_t v12;
  unint64_t v13;
  unint64_t v14;
  unint64_t v15;
  unint64_t v16;
  unint64_t v17;
  unint64_t v18;
  char v19;
  NSData *plmn;
  uint64_t v21;

  v4 = a3;
  v5 = v4;
  has = (char)self->_has;
  if ((has & 1) != 0)
  {
    PBDataWriterWriteUint64Field(v4, self->_timestamp, 1);
    has = (char)self->_has;
    if ((has & 2) == 0)
    {
LABEL_3:
      if ((has & 4) == 0)
        goto LABEL_5;
      goto LABEL_4;
    }
  }
  else if ((*(_BYTE *)&self->_has & 2) == 0)
  {
    goto LABEL_3;
  }
  PBDataWriterWriteUint32Field(v5, self->_duration, 2);
  if ((*(_BYTE *)&self->_has & 4) != 0)
LABEL_4:
    PBDataWriterWriteSint32Field(v5, self->_minRsrpDbm, 4);
LABEL_5:
  if (self->_rsrp0s.count)
  {
    v21 = 0;
    PBDataWriterPlaceMark(v5, &v21, 5);
    if (self->_rsrp0s.count)
    {
      v7 = 0;
      do
        PBDataWriterWriteUint32Field(v5, self->_rsrp0s.list[v7++], 0xFFFFFFFFLL);
      while (v7 < self->_rsrp0s.count);
    }
    PBDataWriterRecallMark(v5, &v21);
  }
  if (self->_rsrp1s.count)
  {
    v21 = 0;
    PBDataWriterPlaceMark(v5, &v21, 6);
    if (self->_rsrp1s.count)
    {
      v8 = 0;
      do
        PBDataWriterWriteUint32Field(v5, self->_rsrp1s.list[v8++], 0xFFFFFFFFLL);
      while (v8 < self->_rsrp1s.count);
    }
    PBDataWriterRecallMark(v5, &v21);
  }
  if ((*(_BYTE *)&self->_has & 8) != 0)
    PBDataWriterWriteSint32Field(v5, self->_minRsrqDb, 8);
  if (self->_rsrq0s.count)
  {
    v21 = 0;
    PBDataWriterPlaceMark(v5, &v21, 9);
    if (self->_rsrq0s.count)
    {
      v9 = 0;
      do
        PBDataWriterWriteUint32Field(v5, self->_rsrq0s.list[v9++], 0xFFFFFFFFLL);
      while (v9 < self->_rsrq0s.count);
    }
    PBDataWriterRecallMark(v5, &v21);
  }
  if (self->_rsrq1s.count)
  {
    v21 = 0;
    PBDataWriterPlaceMark(v5, &v21, 10);
    if (self->_rsrq1s.count)
    {
      v10 = 0;
      do
        PBDataWriterWriteUint32Field(v5, self->_rsrq1s.list[v10++], 0xFFFFFFFFLL);
      while (v10 < self->_rsrq1s.count);
    }
    PBDataWriterRecallMark(v5, &v21);
  }
  if ((*(_BYTE *)&self->_has & 0x10) != 0)
    PBDataWriterWriteSint32Field(v5, self->_minSinrDbx2, 12);
  if (self->_sinr0s.count)
  {
    v21 = 0;
    PBDataWriterPlaceMark(v5, &v21, 13);
    if (self->_sinr0s.count)
    {
      v11 = 0;
      do
        PBDataWriterWriteUint32Field(v5, self->_sinr0s.list[v11++], 0xFFFFFFFFLL);
      while (v11 < self->_sinr0s.count);
    }
    PBDataWriterRecallMark(v5, &v21);
  }
  if (self->_sinr1s.count)
  {
    v21 = 0;
    PBDataWriterPlaceMark(v5, &v21, 14);
    if (self->_sinr1s.count)
    {
      v12 = 0;
      do
        PBDataWriterWriteUint32Field(v5, self->_sinr1s.list[v12++], 0xFFFFFFFFLL);
      while (v12 < self->_sinr1s.count);
    }
    PBDataWriterRecallMark(v5, &v21);
  }
  if ((*(_BYTE *)&self->_has & 0x80000000) != 0)
    PBDataWriterWriteUint32Field(v5, self->_subsId, 15);
  if (self->_rsrp2s.count)
  {
    v21 = 0;
    PBDataWriterPlaceMark(v5, &v21, 16);
    if (self->_rsrp2s.count)
    {
      v13 = 0;
      do
        PBDataWriterWriteUint32Field(v5, self->_rsrp2s.list[v13++], 0xFFFFFFFFLL);
      while (v13 < self->_rsrp2s.count);
    }
    PBDataWriterRecallMark(v5, &v21);
  }
  if (self->_rsrp3s.count)
  {
    v21 = 0;
    PBDataWriterPlaceMark(v5, &v21, 17);
    if (self->_rsrp3s.count)
    {
      v14 = 0;
      do
        PBDataWriterWriteUint32Field(v5, self->_rsrp3s.list[v14++], 0xFFFFFFFFLL);
      while (v14 < self->_rsrp3s.count);
    }
    PBDataWriterRecallMark(v5, &v21);
  }
  if (self->_rsrq2s.count)
  {
    v21 = 0;
    PBDataWriterPlaceMark(v5, &v21, 18);
    if (self->_rsrq2s.count)
    {
      v15 = 0;
      do
        PBDataWriterWriteUint32Field(v5, self->_rsrq2s.list[v15++], 0xFFFFFFFFLL);
      while (v15 < self->_rsrq2s.count);
    }
    PBDataWriterRecallMark(v5, &v21);
  }
  if (self->_rsrq3s.count)
  {
    v21 = 0;
    PBDataWriterPlaceMark(v5, &v21, 19);
    if (self->_rsrq3s.count)
    {
      v16 = 0;
      do
        PBDataWriterWriteUint32Field(v5, self->_rsrq3s.list[v16++], 0xFFFFFFFFLL);
      while (v16 < self->_rsrq3s.count);
    }
    PBDataWriterRecallMark(v5, &v21);
  }
  if (self->_sinr2s.count)
  {
    v21 = 0;
    PBDataWriterPlaceMark(v5, &v21, 20);
    if (self->_sinr2s.count)
    {
      v17 = 0;
      do
        PBDataWriterWriteUint32Field(v5, self->_sinr2s.list[v17++], 0xFFFFFFFFLL);
      while (v17 < self->_sinr2s.count);
    }
    PBDataWriterRecallMark(v5, &v21);
  }
  if (self->_sinr3s.count)
  {
    v21 = 0;
    PBDataWriterPlaceMark(v5, &v21, 21);
    if (self->_sinr3s.count)
    {
      v18 = 0;
      do
        PBDataWriterWriteUint32Field(v5, self->_sinr3s.list[v18++], 0xFFFFFFFFLL);
      while (v18 < self->_sinr3s.count);
    }
    PBDataWriterRecallMark(v5, &v21);
  }
  v19 = (char)self->_has;
  if ((v19 & 0x20) != 0)
  {
    PBDataWriterWriteUint32Field(v5, self->_numSubs, 22);
    v19 = (char)self->_has;
  }
  if ((v19 & 0x40) != 0)
    PBDataWriterWriteUint32Field(v5, self->_psPref, 23);
  plmn = self->_plmn;
  if (plmn)
    PBDataWriterWriteDataField(v5, plmn, 24);

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
  unint64_t v30;
  unint64_t v31;
  uint64_t mm;
  unint64_t v33;
  unint64_t v34;
  uint64_t nn;
  unint64_t v36;
  unint64_t v37;
  uint64_t i1;
  unint64_t v39;
  unint64_t v40;
  uint64_t i2;
  char v42;
  void *v43;
  id v44;

  v4 = a3;
  has = (char)self->_has;
  if ((has & 1) == 0)
  {
    if ((*(_BYTE *)&self->_has & 2) == 0)
      goto LABEL_3;
LABEL_67:
    v4[76] = self->_duration;
    *((_BYTE *)v4 + 344) |= 2u;
    if ((*(_BYTE *)&self->_has & 4) == 0)
      goto LABEL_5;
    goto LABEL_4;
  }
  *((_QWORD *)v4 + 37) = self->_timestamp;
  *((_BYTE *)v4 + 344) |= 1u;
  has = (char)self->_has;
  if ((has & 2) != 0)
    goto LABEL_67;
LABEL_3:
  if ((has & 4) != 0)
  {
LABEL_4:
    v4[77] = self->_minRsrpDbm;
    *((_BYTE *)v4 + 344) |= 4u;
  }
LABEL_5:
  v44 = v4;
  if (-[CellularLteRsrpRsrqSinrHist rsrp0sCount](self, "rsrp0sCount"))
  {
    objc_msgSend(v44, "clearRsrp0s");
    v6 = -[CellularLteRsrpRsrqSinrHist rsrp0sCount](self, "rsrp0sCount");
    if (v6)
    {
      v7 = v6;
      for (i = 0; i != v7; ++i)
        objc_msgSend(v44, "addRsrp0:", -[CellularLteRsrpRsrqSinrHist rsrp0AtIndex:](self, "rsrp0AtIndex:", i));
    }
  }
  if (-[CellularLteRsrpRsrqSinrHist rsrp1sCount](self, "rsrp1sCount"))
  {
    objc_msgSend(v44, "clearRsrp1s");
    v9 = -[CellularLteRsrpRsrqSinrHist rsrp1sCount](self, "rsrp1sCount");
    if (v9)
    {
      v10 = v9;
      for (j = 0; j != v10; ++j)
        objc_msgSend(v44, "addRsrp1:", -[CellularLteRsrpRsrqSinrHist rsrp1AtIndex:](self, "rsrp1AtIndex:", j));
    }
  }
  if ((*(_BYTE *)&self->_has & 8) != 0)
  {
    *((_DWORD *)v44 + 78) = self->_minRsrqDb;
    *((_BYTE *)v44 + 344) |= 8u;
  }
  if (-[CellularLteRsrpRsrqSinrHist rsrq0sCount](self, "rsrq0sCount"))
  {
    objc_msgSend(v44, "clearRsrq0s");
    v12 = -[CellularLteRsrpRsrqSinrHist rsrq0sCount](self, "rsrq0sCount");
    if (v12)
    {
      v13 = v12;
      for (k = 0; k != v13; ++k)
        objc_msgSend(v44, "addRsrq0:", -[CellularLteRsrpRsrqSinrHist rsrq0AtIndex:](self, "rsrq0AtIndex:", k));
    }
  }
  if (-[CellularLteRsrpRsrqSinrHist rsrq1sCount](self, "rsrq1sCount"))
  {
    objc_msgSend(v44, "clearRsrq1s");
    v15 = -[CellularLteRsrpRsrqSinrHist rsrq1sCount](self, "rsrq1sCount");
    if (v15)
    {
      v16 = v15;
      for (m = 0; m != v16; ++m)
        objc_msgSend(v44, "addRsrq1:", -[CellularLteRsrpRsrqSinrHist rsrq1AtIndex:](self, "rsrq1AtIndex:", m));
    }
  }
  if ((*(_BYTE *)&self->_has & 0x10) != 0)
  {
    *((_DWORD *)v44 + 79) = self->_minSinrDbx2;
    *((_BYTE *)v44 + 344) |= 0x10u;
  }
  if (-[CellularLteRsrpRsrqSinrHist sinr0sCount](self, "sinr0sCount"))
  {
    objc_msgSend(v44, "clearSinr0s");
    v18 = -[CellularLteRsrpRsrqSinrHist sinr0sCount](self, "sinr0sCount");
    if (v18)
    {
      v19 = v18;
      for (n = 0; n != v19; ++n)
        objc_msgSend(v44, "addSinr0:", -[CellularLteRsrpRsrqSinrHist sinr0AtIndex:](self, "sinr0AtIndex:", n));
    }
  }
  if (-[CellularLteRsrpRsrqSinrHist sinr1sCount](self, "sinr1sCount"))
  {
    objc_msgSend(v44, "clearSinr1s");
    v21 = -[CellularLteRsrpRsrqSinrHist sinr1sCount](self, "sinr1sCount");
    if (v21)
    {
      v22 = v21;
      for (ii = 0; ii != v22; ++ii)
        objc_msgSend(v44, "addSinr1:", -[CellularLteRsrpRsrqSinrHist sinr1AtIndex:](self, "sinr1AtIndex:", ii));
    }
  }
  if ((*(_BYTE *)&self->_has & 0x80000000) != 0)
  {
    *((_DWORD *)v44 + 85) = self->_subsId;
    *((_BYTE *)v44 + 344) |= 0x80u;
  }
  if (-[CellularLteRsrpRsrqSinrHist rsrp2sCount](self, "rsrp2sCount"))
  {
    objc_msgSend(v44, "clearRsrp2s");
    v24 = -[CellularLteRsrpRsrqSinrHist rsrp2sCount](self, "rsrp2sCount");
    if (v24)
    {
      v25 = v24;
      for (jj = 0; jj != v25; ++jj)
        objc_msgSend(v44, "addRsrp2:", -[CellularLteRsrpRsrqSinrHist rsrp2AtIndex:](self, "rsrp2AtIndex:", jj));
    }
  }
  if (-[CellularLteRsrpRsrqSinrHist rsrp3sCount](self, "rsrp3sCount"))
  {
    objc_msgSend(v44, "clearRsrp3s");
    v27 = -[CellularLteRsrpRsrqSinrHist rsrp3sCount](self, "rsrp3sCount");
    if (v27)
    {
      v28 = v27;
      for (kk = 0; kk != v28; ++kk)
        objc_msgSend(v44, "addRsrp3:", -[CellularLteRsrpRsrqSinrHist rsrp3AtIndex:](self, "rsrp3AtIndex:", kk));
    }
  }
  if (-[CellularLteRsrpRsrqSinrHist rsrq2sCount](self, "rsrq2sCount"))
  {
    objc_msgSend(v44, "clearRsrq2s");
    v30 = -[CellularLteRsrpRsrqSinrHist rsrq2sCount](self, "rsrq2sCount");
    if (v30)
    {
      v31 = v30;
      for (mm = 0; mm != v31; ++mm)
        objc_msgSend(v44, "addRsrq2:", -[CellularLteRsrpRsrqSinrHist rsrq2AtIndex:](self, "rsrq2AtIndex:", mm));
    }
  }
  if (-[CellularLteRsrpRsrqSinrHist rsrq3sCount](self, "rsrq3sCount"))
  {
    objc_msgSend(v44, "clearRsrq3s");
    v33 = -[CellularLteRsrpRsrqSinrHist rsrq3sCount](self, "rsrq3sCount");
    if (v33)
    {
      v34 = v33;
      for (nn = 0; nn != v34; ++nn)
        objc_msgSend(v44, "addRsrq3:", -[CellularLteRsrpRsrqSinrHist rsrq3AtIndex:](self, "rsrq3AtIndex:", nn));
    }
  }
  if (-[CellularLteRsrpRsrqSinrHist sinr2sCount](self, "sinr2sCount"))
  {
    objc_msgSend(v44, "clearSinr2s");
    v36 = -[CellularLteRsrpRsrqSinrHist sinr2sCount](self, "sinr2sCount");
    if (v36)
    {
      v37 = v36;
      for (i1 = 0; i1 != v37; ++i1)
        objc_msgSend(v44, "addSinr2:", -[CellularLteRsrpRsrqSinrHist sinr2AtIndex:](self, "sinr2AtIndex:", i1));
    }
  }
  if (-[CellularLteRsrpRsrqSinrHist sinr3sCount](self, "sinr3sCount"))
  {
    objc_msgSend(v44, "clearSinr3s");
    v39 = -[CellularLteRsrpRsrqSinrHist sinr3sCount](self, "sinr3sCount");
    if (v39)
    {
      v40 = v39;
      for (i2 = 0; i2 != v40; ++i2)
        objc_msgSend(v44, "addSinr3:", -[CellularLteRsrpRsrqSinrHist sinr3AtIndex:](self, "sinr3AtIndex:", i2));
    }
  }
  v42 = (char)self->_has;
  v43 = v44;
  if ((v42 & 0x20) != 0)
  {
    *((_DWORD *)v44 + 80) = self->_numSubs;
    *((_BYTE *)v44 + 344) |= 0x20u;
    v42 = (char)self->_has;
  }
  if ((v42 & 0x40) != 0)
  {
    *((_DWORD *)v44 + 84) = self->_psPref;
    *((_BYTE *)v44 + 344) |= 0x40u;
  }
  if (self->_plmn)
  {
    objc_msgSend(v44, "setPlmn:");
    v43 = v44;
  }

}

- (id)copyWithZone:(_NSZone *)a3
{
  _QWORD *v5;
  _DWORD *v6;
  char has;
  char v8;
  id v9;
  void *v10;

  v5 = objc_msgSend(objc_msgSend((id)objc_opt_class(self, a2), "allocWithZone:", a3), "init");
  v6 = v5;
  has = (char)self->_has;
  if ((has & 1) != 0)
  {
    v5[37] = self->_timestamp;
    *((_BYTE *)v5 + 344) |= 1u;
    has = (char)self->_has;
    if ((has & 2) == 0)
    {
LABEL_3:
      if ((has & 4) == 0)
        goto LABEL_5;
      goto LABEL_4;
    }
  }
  else if ((*(_BYTE *)&self->_has & 2) == 0)
  {
    goto LABEL_3;
  }
  *((_DWORD *)v5 + 76) = self->_duration;
  *((_BYTE *)v5 + 344) |= 2u;
  if ((*(_BYTE *)&self->_has & 4) != 0)
  {
LABEL_4:
    *((_DWORD *)v5 + 77) = self->_minRsrpDbm;
    *((_BYTE *)v5 + 344) |= 4u;
  }
LABEL_5:
  PBRepeatedUInt32Copy(v5 + 1, &self->_rsrp0s);
  PBRepeatedUInt32Copy(v6 + 8, &self->_rsrp1s);
  if ((*(_BYTE *)&self->_has & 8) != 0)
  {
    v6[78] = self->_minRsrqDb;
    *((_BYTE *)v6 + 344) |= 8u;
  }
  PBRepeatedUInt32Copy(v6 + 26, &self->_rsrq0s);
  PBRepeatedUInt32Copy(v6 + 32, &self->_rsrq1s);
  if ((*(_BYTE *)&self->_has & 0x10) != 0)
  {
    v6[79] = self->_minSinrDbx2;
    *((_BYTE *)v6 + 344) |= 0x10u;
  }
  PBRepeatedUInt32Copy(v6 + 50, &self->_sinr0s);
  PBRepeatedUInt32Copy(v6 + 56, &self->_sinr1s);
  if ((*(_BYTE *)&self->_has & 0x80000000) != 0)
  {
    v6[85] = self->_subsId;
    *((_BYTE *)v6 + 344) |= 0x80u;
  }
  PBRepeatedUInt32Copy(v6 + 14, &self->_rsrp2s);
  PBRepeatedUInt32Copy(v6 + 20, &self->_rsrp3s);
  PBRepeatedUInt32Copy(v6 + 38, &self->_rsrq2s);
  PBRepeatedUInt32Copy(v6 + 44, &self->_rsrq3s);
  PBRepeatedUInt32Copy(v6 + 62, &self->_sinr2s);
  PBRepeatedUInt32Copy(v6 + 68, &self->_sinr3s);
  v8 = (char)self->_has;
  if ((v8 & 0x20) != 0)
  {
    v6[80] = self->_numSubs;
    *((_BYTE *)v6 + 344) |= 0x20u;
    v8 = (char)self->_has;
  }
  if ((v8 & 0x40) != 0)
  {
    v6[84] = self->_psPref;
    *((_BYTE *)v6 + 344) |= 0x40u;
  }
  v9 = -[NSData copyWithZone:](self->_plmn, "copyWithZone:", a3);
  v10 = (void *)*((_QWORD *)v6 + 41);
  *((_QWORD *)v6 + 41) = v9;

  return v6;
}

- (BOOL)isEqual:(id)a3
{
  char *v4;
  uint64_t v5;
  int v6;
  unsigned __int8 v7;
  NSData *plmn;

  v4 = (char *)a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class(self, v5)))
    goto LABEL_46;
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    if ((v4[344] & 1) == 0 || self->_timestamp != *((_QWORD *)v4 + 37))
      goto LABEL_46;
  }
  else if ((v4[344] & 1) != 0)
  {
    goto LABEL_46;
  }
  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
    if ((v4[344] & 2) == 0 || self->_duration != *((_DWORD *)v4 + 76))
      goto LABEL_46;
  }
  else if ((v4[344] & 2) != 0)
  {
    goto LABEL_46;
  }
  if ((*(_BYTE *)&self->_has & 4) != 0)
  {
    if ((v4[344] & 4) == 0 || self->_minRsrpDbm != *((_DWORD *)v4 + 77))
      goto LABEL_46;
  }
  else if ((v4[344] & 4) != 0)
  {
    goto LABEL_46;
  }
  if (!PBRepeatedUInt32IsEqual(&self->_rsrp0s, v4 + 8)
    || !PBRepeatedUInt32IsEqual(&self->_rsrp1s, v4 + 32))
  {
    goto LABEL_46;
  }
  if ((*(_BYTE *)&self->_has & 8) != 0)
  {
    if ((v4[344] & 8) == 0 || self->_minRsrqDb != *((_DWORD *)v4 + 78))
      goto LABEL_46;
  }
  else if ((v4[344] & 8) != 0)
  {
    goto LABEL_46;
  }
  if (!PBRepeatedUInt32IsEqual(&self->_rsrq0s, v4 + 104)
    || !PBRepeatedUInt32IsEqual(&self->_rsrq1s, v4 + 128))
  {
    goto LABEL_46;
  }
  if ((*(_BYTE *)&self->_has & 0x10) != 0)
  {
    if ((v4[344] & 0x10) == 0 || self->_minSinrDbx2 != *((_DWORD *)v4 + 79))
      goto LABEL_46;
  }
  else if ((v4[344] & 0x10) != 0)
  {
    goto LABEL_46;
  }
  if (!PBRepeatedUInt32IsEqual(&self->_sinr0s, v4 + 200)
    || !PBRepeatedUInt32IsEqual(&self->_sinr1s, v4 + 224))
  {
    goto LABEL_46;
  }
  v6 = v4[344];
  if ((*(_BYTE *)&self->_has & 0x80000000) != 0)
  {
    if ((v6 & 0x80000000) == 0 || self->_subsId != *((_DWORD *)v4 + 85))
      goto LABEL_46;
  }
  else if (v6 < 0)
  {
    goto LABEL_46;
  }
  if (!PBRepeatedUInt32IsEqual(&self->_rsrp2s, v4 + 56)
    || !PBRepeatedUInt32IsEqual(&self->_rsrp3s, v4 + 80)
    || !PBRepeatedUInt32IsEqual(&self->_rsrq2s, v4 + 152)
    || !PBRepeatedUInt32IsEqual(&self->_rsrq3s, v4 + 176)
    || !PBRepeatedUInt32IsEqual(&self->_sinr2s, v4 + 248)
    || !PBRepeatedUInt32IsEqual(&self->_sinr3s, v4 + 272))
  {
    goto LABEL_46;
  }
  if ((*(_BYTE *)&self->_has & 0x20) != 0)
  {
    if ((v4[344] & 0x20) == 0 || self->_numSubs != *((_DWORD *)v4 + 80))
      goto LABEL_46;
  }
  else if ((v4[344] & 0x20) != 0)
  {
    goto LABEL_46;
  }
  if ((*(_BYTE *)&self->_has & 0x40) == 0)
  {
    if ((v4[344] & 0x40) == 0)
      goto LABEL_55;
LABEL_46:
    v7 = 0;
    goto LABEL_47;
  }
  if ((v4[344] & 0x40) == 0 || self->_psPref != *((_DWORD *)v4 + 84))
    goto LABEL_46;
LABEL_55:
  plmn = self->_plmn;
  if ((unint64_t)plmn | *((_QWORD *)v4 + 41))
    v7 = -[NSData isEqual:](plmn, "isEqual:");
  else
    v7 = 1;
LABEL_47:

  return v7;
}

- (unint64_t)hash
{
  unint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  unint64_t v25;

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
      v4 = 2654435761 * self->_duration;
      goto LABEL_6;
    }
  }
  v4 = 0;
LABEL_6:
  v24 = v4;
  v25 = v3;
  if ((*(_BYTE *)&self->_has & 4) != 0)
    v19 = 2654435761 * self->_minRsrpDbm;
  else
    v19 = 0;
  v23 = PBRepeatedUInt32Hash(&self->_rsrp0s);
  v22 = PBRepeatedUInt32Hash(&self->_rsrp1s);
  if ((*(_BYTE *)&self->_has & 8) != 0)
    v18 = 2654435761 * self->_minRsrqDb;
  else
    v18 = 0;
  v21 = PBRepeatedUInt32Hash(&self->_rsrq0s);
  v20 = PBRepeatedUInt32Hash(&self->_rsrq1s);
  if ((*(_BYTE *)&self->_has & 0x10) != 0)
    v17 = 2654435761 * self->_minSinrDbx2;
  else
    v17 = 0;
  v5 = PBRepeatedUInt32Hash(&self->_sinr0s);
  v6 = PBRepeatedUInt32Hash(&self->_sinr1s);
  if ((*(_BYTE *)&self->_has & 0x80000000) != 0)
    v7 = 2654435761 * self->_subsId;
  else
    v7 = 0;
  v8 = PBRepeatedUInt32Hash(&self->_rsrp2s);
  v9 = PBRepeatedUInt32Hash(&self->_rsrp3s);
  v10 = PBRepeatedUInt32Hash(&self->_rsrq2s);
  v11 = PBRepeatedUInt32Hash(&self->_rsrq3s);
  v12 = PBRepeatedUInt32Hash(&self->_sinr2s);
  v13 = PBRepeatedUInt32Hash(&self->_sinr3s);
  if ((*(_BYTE *)&self->_has & 0x20) != 0)
    v14 = 2654435761 * self->_numSubs;
  else
    v14 = 0;
  if ((*(_BYTE *)&self->_has & 0x40) != 0)
    v15 = 2654435761 * self->_psPref;
  else
    v15 = 0;
  return v24 ^ v25 ^ v19 ^ v23 ^ v22 ^ v18 ^ v21 ^ v20 ^ v17 ^ v5 ^ v6 ^ v7 ^ v8 ^ v9 ^ v10 ^ v11 ^ v12 ^ v13 ^ v14 ^ v15 ^ (unint64_t)-[NSData hash](self->_plmn, "hash");
}

- (void)mergeFrom:(id)a3
{
  char *v4;
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
  char *v30;
  char *v31;
  char *mm;
  char *v33;
  char *v34;
  char *nn;
  char *v36;
  char *v37;
  char *i1;
  char *v39;
  char *v40;
  char *i2;
  void *v42;
  char v43;
  char *v44;

  v4 = (char *)a3;
  v5 = v4[344];
  if ((v5 & 1) != 0)
  {
    self->_timestamp = *((_QWORD *)v4 + 37);
    *(_BYTE *)&self->_has |= 1u;
    v5 = v4[344];
    if ((v5 & 2) == 0)
    {
LABEL_3:
      if ((v5 & 4) == 0)
        goto LABEL_5;
      goto LABEL_4;
    }
  }
  else if ((v4[344] & 2) == 0)
  {
    goto LABEL_3;
  }
  self->_duration = *((_DWORD *)v4 + 76);
  *(_BYTE *)&self->_has |= 2u;
  if ((v4[344] & 4) != 0)
  {
LABEL_4:
    self->_minRsrpDbm = *((_DWORD *)v4 + 77);
    *(_BYTE *)&self->_has |= 4u;
  }
LABEL_5:
  v44 = v4;
  v6 = (char *)objc_msgSend(v4, "rsrp0sCount");
  if (v6)
  {
    v7 = v6;
    for (i = 0; i != v7; ++i)
      -[CellularLteRsrpRsrqSinrHist addRsrp0:](self, "addRsrp0:", objc_msgSend(v44, "rsrp0AtIndex:", i));
  }
  v9 = (char *)objc_msgSend(v44, "rsrp1sCount");
  if (v9)
  {
    v10 = v9;
    for (j = 0; j != v10; ++j)
      -[CellularLteRsrpRsrqSinrHist addRsrp1:](self, "addRsrp1:", objc_msgSend(v44, "rsrp1AtIndex:", j));
  }
  if ((v44[344] & 8) != 0)
  {
    self->_minRsrqDb = *((_DWORD *)v44 + 78);
    *(_BYTE *)&self->_has |= 8u;
  }
  v12 = (char *)objc_msgSend(v44, "rsrq0sCount");
  if (v12)
  {
    v13 = v12;
    for (k = 0; k != v13; ++k)
      -[CellularLteRsrpRsrqSinrHist addRsrq0:](self, "addRsrq0:", objc_msgSend(v44, "rsrq0AtIndex:", k));
  }
  v15 = (char *)objc_msgSend(v44, "rsrq1sCount");
  if (v15)
  {
    v16 = v15;
    for (m = 0; m != v16; ++m)
      -[CellularLteRsrpRsrqSinrHist addRsrq1:](self, "addRsrq1:", objc_msgSend(v44, "rsrq1AtIndex:", m));
  }
  if ((v44[344] & 0x10) != 0)
  {
    self->_minSinrDbx2 = *((_DWORD *)v44 + 79);
    *(_BYTE *)&self->_has |= 0x10u;
  }
  v18 = (char *)objc_msgSend(v44, "sinr0sCount");
  if (v18)
  {
    v19 = v18;
    for (n = 0; n != v19; ++n)
      -[CellularLteRsrpRsrqSinrHist addSinr0:](self, "addSinr0:", objc_msgSend(v44, "sinr0AtIndex:", n));
  }
  v21 = (char *)objc_msgSend(v44, "sinr1sCount");
  if (v21)
  {
    v22 = v21;
    for (ii = 0; ii != v22; ++ii)
      -[CellularLteRsrpRsrqSinrHist addSinr1:](self, "addSinr1:", objc_msgSend(v44, "sinr1AtIndex:", ii));
  }
  if (v44[344] < 0)
  {
    self->_subsId = *((_DWORD *)v44 + 85);
    *(_BYTE *)&self->_has |= 0x80u;
  }
  v24 = (char *)objc_msgSend(v44, "rsrp2sCount");
  if (v24)
  {
    v25 = v24;
    for (jj = 0; jj != v25; ++jj)
      -[CellularLteRsrpRsrqSinrHist addRsrp2:](self, "addRsrp2:", objc_msgSend(v44, "rsrp2AtIndex:", jj));
  }
  v27 = (char *)objc_msgSend(v44, "rsrp3sCount");
  if (v27)
  {
    v28 = v27;
    for (kk = 0; kk != v28; ++kk)
      -[CellularLteRsrpRsrqSinrHist addRsrp3:](self, "addRsrp3:", objc_msgSend(v44, "rsrp3AtIndex:", kk));
  }
  v30 = (char *)objc_msgSend(v44, "rsrq2sCount");
  if (v30)
  {
    v31 = v30;
    for (mm = 0; mm != v31; ++mm)
      -[CellularLteRsrpRsrqSinrHist addRsrq2:](self, "addRsrq2:", objc_msgSend(v44, "rsrq2AtIndex:", mm));
  }
  v33 = (char *)objc_msgSend(v44, "rsrq3sCount");
  if (v33)
  {
    v34 = v33;
    for (nn = 0; nn != v34; ++nn)
      -[CellularLteRsrpRsrqSinrHist addRsrq3:](self, "addRsrq3:", objc_msgSend(v44, "rsrq3AtIndex:", nn));
  }
  v36 = (char *)objc_msgSend(v44, "sinr2sCount");
  if (v36)
  {
    v37 = v36;
    for (i1 = 0; i1 != v37; ++i1)
      -[CellularLteRsrpRsrqSinrHist addSinr2:](self, "addSinr2:", objc_msgSend(v44, "sinr2AtIndex:", i1));
  }
  v39 = (char *)objc_msgSend(v44, "sinr3sCount");
  if (v39)
  {
    v40 = v39;
    for (i2 = 0; i2 != v40; ++i2)
      -[CellularLteRsrpRsrqSinrHist addSinr3:](self, "addSinr3:", objc_msgSend(v44, "sinr3AtIndex:", i2));
  }
  v42 = v44;
  v43 = v44[344];
  if ((v43 & 0x20) != 0)
  {
    self->_numSubs = *((_DWORD *)v44 + 80);
    *(_BYTE *)&self->_has |= 0x20u;
    v43 = v44[344];
  }
  if ((v43 & 0x40) != 0)
  {
    self->_psPref = *((_DWORD *)v44 + 84);
    *(_BYTE *)&self->_has |= 0x40u;
  }
  if (*((_QWORD *)v44 + 41))
  {
    -[CellularLteRsrpRsrqSinrHist setPlmn:](self, "setPlmn:");
    v42 = v44;
  }

}

- (unint64_t)timestamp
{
  return self->_timestamp;
}

- (unsigned)duration
{
  return self->_duration;
}

- (int)minRsrpDbm
{
  return self->_minRsrpDbm;
}

- (int)minRsrqDb
{
  return self->_minRsrqDb;
}

- (int)minSinrDbx2
{
  return self->_minSinrDbx2;
}

- (unsigned)subsId
{
  return self->_subsId;
}

- (unsigned)numSubs
{
  return self->_numSubs;
}

- (unsigned)psPref
{
  return self->_psPref;
}

- (NSData)plmn
{
  return self->_plmn;
}

- (void)setPlmn:(id)a3
{
  objc_storeStrong((id *)&self->_plmn, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_plmn, 0);
}

@end
