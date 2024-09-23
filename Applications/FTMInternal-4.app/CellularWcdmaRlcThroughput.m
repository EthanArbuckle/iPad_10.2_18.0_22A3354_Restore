@implementation CellularWcdmaRlcThroughput

- (void)dealloc
{
  uint64_t v3;
  objc_super v4;

  PBRepeatedUInt32Clear(&self->_txPowerHists, a2);
  PBRepeatedUInt32Clear(&self->_rxPowerHists, v3);
  v4.receiver = self;
  v4.super_class = (Class)CellularWcdmaRlcThroughput;
  -[CellularWcdmaRlcThroughput dealloc](&v4, "dealloc");
}

- (void)setTimestamp:(unint64_t)a3
{
  *(_DWORD *)&self->_has |= 1u;
  self->_timestamp = a3;
}

- (void)setHasTimestamp:(BOOL)a3
{
  self->_has = ($E76A4E3F312DA20721C84FD0B50D0B19)(*(_DWORD *)&self->_has & 0xFFFFFFFE | a3);
}

- (BOOL)hasTimestamp
{
  return *(_DWORD *)&self->_has & 1;
}

- (void)setPsDuration:(unsigned int)a3
{
  *(_DWORD *)&self->_has |= 0x4000u;
  self->_psDuration = a3;
}

- (void)setHasPsDuration:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 0x4000;
  else
    v3 = 0;
  self->_has = ($E76A4E3F312DA20721C84FD0B50D0B19)(*(_DWORD *)&self->_has & 0xFFFFBFFF | v3);
}

- (BOOL)hasPsDuration
{
  return (*((unsigned __int8 *)&self->_has + 1) >> 6) & 1;
}

- (void)setTotalFachDuration:(unsigned int)a3
{
  *(_DWORD *)&self->_has |= 0x8000u;
  self->_totalFachDuration = a3;
}

- (void)setHasTotalFachDuration:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 0x8000;
  else
    v3 = 0;
  self->_has = ($E76A4E3F312DA20721C84FD0B50D0B19)(*(_DWORD *)&self->_has & 0xFFFF7FFF | v3);
}

- (BOOL)hasTotalFachDuration
{
  return *((unsigned __int8 *)&self->_has + 1) >> 7;
}

- (void)setLastFachDuration:(unsigned int)a3
{
  *(_DWORD *)&self->_has |= 0x80u;
  self->_lastFachDuration = a3;
}

- (void)setHasLastFachDuration:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 128;
  else
    v3 = 0;
  self->_has = ($E76A4E3F312DA20721C84FD0B50D0B19)(*(_DWORD *)&self->_has & 0xFFFFFF7F | v3);
}

- (BOOL)hasLastFachDuration
{
  return *(_BYTE *)&self->_has >> 7;
}

- (void)setMrabDuration:(unsigned int)a3
{
  *(_DWORD *)&self->_has |= 0x2000u;
  self->_mrabDuration = a3;
}

- (void)setHasMrabDuration:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 0x2000;
  else
    v3 = 0;
  self->_has = ($E76A4E3F312DA20721C84FD0B50D0B19)(*(_DWORD *)&self->_has & 0xFFFFDFFF | v3);
}

- (BOOL)hasMrabDuration
{
  return (*((unsigned __int8 *)&self->_has + 1) >> 5) & 1;
}

- (void)setLastUlInactiveDur:(unsigned int)a3
{
  *(_DWORD *)&self->_has |= 0x100u;
  self->_lastUlInactiveDur = a3;
}

- (void)setHasLastUlInactiveDur:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 256;
  else
    v3 = 0;
  self->_has = ($E76A4E3F312DA20721C84FD0B50D0B19)(*(_DWORD *)&self->_has & 0xFFFFFEFF | v3);
}

- (BOOL)hasLastUlInactiveDur
{
  return *((_BYTE *)&self->_has + 1) & 1;
}

- (void)setLastDlInactiveDur:(unsigned int)a3
{
  *(_DWORD *)&self->_has |= 0x40u;
  self->_lastDlInactiveDur = a3;
}

- (void)setHasLastDlInactiveDur:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 64;
  else
    v3 = 0;
  self->_has = ($E76A4E3F312DA20721C84FD0B50D0B19)(*(_DWORD *)&self->_has & 0xFFFFFFBF | v3);
}

- (BOOL)hasLastDlInactiveDur
{
  return (*(_BYTE *)&self->_has >> 6) & 1;
}

- (void)setAveUlThroughput:(unsigned int)a3
{
  *(_DWORD *)&self->_has |= 4u;
  self->_aveUlThroughput = a3;
}

- (void)setHasAveUlThroughput:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 4;
  else
    v3 = 0;
  self->_has = ($E76A4E3F312DA20721C84FD0B50D0B19)(*(_DWORD *)&self->_has & 0xFFFFFFFB | v3);
}

- (BOOL)hasAveUlThroughput
{
  return (*(_BYTE *)&self->_has >> 2) & 1;
}

- (void)setAveDlThroughput:(unsigned int)a3
{
  *(_DWORD *)&self->_has |= 2u;
  self->_aveDlThroughput = a3;
}

- (void)setHasAveDlThroughput:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  self->_has = ($E76A4E3F312DA20721C84FD0B50D0B19)(*(_DWORD *)&self->_has & 0xFFFFFFFD | v3);
}

- (BOOL)hasAveDlThroughput
{
  return (*(_BYTE *)&self->_has >> 1) & 1;
}

- (void)setMaxUlThroughput:(unsigned int)a3
{
  *(_DWORD *)&self->_has |= 0x1000u;
  self->_maxUlThroughput = a3;
}

- (void)setHasMaxUlThroughput:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 4096;
  else
    v3 = 0;
  self->_has = ($E76A4E3F312DA20721C84FD0B50D0B19)(*(_DWORD *)&self->_has & 0xFFFFEFFF | v3);
}

- (BOOL)hasMaxUlThroughput
{
  return (*((unsigned __int8 *)&self->_has + 1) >> 4) & 1;
}

- (void)setMaxDlThroughput:(unsigned int)a3
{
  *(_DWORD *)&self->_has |= 0x400u;
  self->_maxDlThroughput = a3;
}

- (void)setHasMaxDlThroughput:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 1024;
  else
    v3 = 0;
  self->_has = ($E76A4E3F312DA20721C84FD0B50D0B19)(*(_DWORD *)&self->_has & 0xFFFFFBFF | v3);
}

- (BOOL)hasMaxDlThroughput
{
  return (*((unsigned __int8 *)&self->_has + 1) >> 2) & 1;
}

- (void)setMaxUlRbRate:(unsigned int)a3
{
  *(_DWORD *)&self->_has |= 0x800u;
  self->_maxUlRbRate = a3;
}

- (void)setHasMaxUlRbRate:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 2048;
  else
    v3 = 0;
  self->_has = ($E76A4E3F312DA20721C84FD0B50D0B19)(*(_DWORD *)&self->_has & 0xFFFFF7FF | v3);
}

- (BOOL)hasMaxUlRbRate
{
  return (*((unsigned __int8 *)&self->_has + 1) >> 3) & 1;
}

- (void)setMaxDlRbRate:(unsigned int)a3
{
  *(_DWORD *)&self->_has |= 0x200u;
  self->_maxDlRbRate = a3;
}

- (void)setHasMaxDlRbRate:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 512;
  else
    v3 = 0;
  self->_has = ($E76A4E3F312DA20721C84FD0B50D0B19)(*(_DWORD *)&self->_has & 0xFFFFFDFF | v3);
}

- (BOOL)hasMaxDlRbRate
{
  return (*((unsigned __int8 *)&self->_has + 1) >> 1) & 1;
}

- (void)setUlActiveDur:(unsigned int)a3
{
  *(_DWORD *)&self->_has |= 0x10000u;
  self->_ulActiveDur = a3;
}

- (void)setHasUlActiveDur:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 0x10000;
  else
    v3 = 0;
  self->_has = ($E76A4E3F312DA20721C84FD0B50D0B19)(*(_DWORD *)&self->_has & 0xFFFEFFFF | v3);
}

- (BOOL)hasUlActiveDur
{
  return *((_BYTE *)&self->_has + 2) & 1;
}

- (void)setDlActiveDur:(unsigned int)a3
{
  *(_DWORD *)&self->_has |= 8u;
  self->_dlActiveDur = a3;
}

- (void)setHasDlActiveDur:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 8;
  else
    v3 = 0;
  self->_has = ($E76A4E3F312DA20721C84FD0B50D0B19)(*(_DWORD *)&self->_has & 0xFFFFFFF7 | v3);
}

- (BOOL)hasDlActiveDur
{
  return (*(_BYTE *)&self->_has >> 3) & 1;
}

- (void)setUlRetxBlockRatePpt:(unsigned int)a3
{
  *(_DWORD *)&self->_has |= 0x20000u;
  self->_ulRetxBlockRatePpt = a3;
}

- (void)setHasUlRetxBlockRatePpt:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 0x20000;
  else
    v3 = 0;
  self->_has = ($E76A4E3F312DA20721C84FD0B50D0B19)(*(_DWORD *)&self->_has & 0xFFFDFFFF | v3);
}

- (BOOL)hasUlRetxBlockRatePpt
{
  return (*((unsigned __int8 *)&self->_has + 2) >> 1) & 1;
}

- (void)setDlBlerPpt:(unsigned int)a3
{
  *(_DWORD *)&self->_has |= 0x10u;
  self->_dlBlerPpt = a3;
}

- (void)setHasDlBlerPpt:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 16;
  else
    v3 = 0;
  self->_has = ($E76A4E3F312DA20721C84FD0B50D0B19)(*(_DWORD *)&self->_has & 0xFFFFFFEF | v3);
}

- (BOOL)hasDlBlerPpt
{
  return (*(_BYTE *)&self->_has >> 4) & 1;
}

- (unint64_t)txPowerHistsCount
{
  return self->_txPowerHists.count;
}

- (unsigned)txPowerHists
{
  return self->_txPowerHists.list;
}

- (void)clearTxPowerHists
{
  PBRepeatedUInt32Clear(&self->_txPowerHists, a2);
}

- (void)addTxPowerHist:(unsigned int)a3
{
  PBRepeatedUInt32Add(&self->_txPowerHists, *(_QWORD *)&a3);
}

- (unsigned)txPowerHistAtIndex:(unint64_t)a3
{
  $1729E44CE8A3ADE0AA70C2F19EF2BB02 *p_txPowerHists;
  unint64_t count;
  void *v6;
  void *v7;

  p_txPowerHists = &self->_txPowerHists;
  count = self->_txPowerHists.count;
  if (count <= a3)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("idx (%tu) is out of range (%tu)"), a3, count));
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSException exceptionWithName:reason:userInfo:](NSException, "exceptionWithName:reason:userInfo:", NSRangeException, v6, 0));
    objc_msgSend(v7, "raise");

  }
  return p_txPowerHists->list[a3];
}

- (void)setTxPowerHists:(unsigned int *)a3 count:(unint64_t)a4
{
  PBRepeatedUInt32Set(&self->_txPowerHists, a3, a4);
}

- (unint64_t)rxPowerHistsCount
{
  return self->_rxPowerHists.count;
}

- (unsigned)rxPowerHists
{
  return self->_rxPowerHists.list;
}

- (void)clearRxPowerHists
{
  PBRepeatedUInt32Clear(&self->_rxPowerHists, a2);
}

- (void)addRxPowerHist:(unsigned int)a3
{
  PBRepeatedUInt32Add(&self->_rxPowerHists, *(_QWORD *)&a3);
}

- (unsigned)rxPowerHistAtIndex:(unint64_t)a3
{
  $1729E44CE8A3ADE0AA70C2F19EF2BB02 *p_rxPowerHists;
  unint64_t count;
  void *v6;
  void *v7;

  p_rxPowerHists = &self->_rxPowerHists;
  count = self->_rxPowerHists.count;
  if (count <= a3)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("idx (%tu) is out of range (%tu)"), a3, count));
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSException exceptionWithName:reason:userInfo:](NSException, "exceptionWithName:reason:userInfo:", NSRangeException, v6, 0));
    objc_msgSend(v7, "raise");

  }
  return p_rxPowerHists->list[a3];
}

- (void)setRxPowerHists:(unsigned int *)a3 count:(unint64_t)a4
{
  PBRepeatedUInt32Set(&self->_rxPowerHists, a3, a4);
}

- (void)setUlTotalBytes:(unsigned int)a3
{
  *(_DWORD *)&self->_has |= 0x40000u;
  self->_ulTotalBytes = a3;
}

- (void)setHasUlTotalBytes:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 0x40000;
  else
    v3 = 0;
  self->_has = ($E76A4E3F312DA20721C84FD0B50D0B19)(*(_DWORD *)&self->_has & 0xFFFBFFFF | v3);
}

- (BOOL)hasUlTotalBytes
{
  return (*((unsigned __int8 *)&self->_has + 2) >> 2) & 1;
}

- (void)setDlTotalBytes:(unsigned int)a3
{
  *(_DWORD *)&self->_has |= 0x20u;
  self->_dlTotalBytes = a3;
}

- (void)setHasDlTotalBytes:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 32;
  else
    v3 = 0;
  self->_has = ($E76A4E3F312DA20721C84FD0B50D0B19)(*(_DWORD *)&self->_has & 0xFFFFFFDF | v3);
}

- (BOOL)hasDlTotalBytes
{
  return (*(_BYTE *)&self->_has >> 5) & 1;
}

- (void)setVersion:(unsigned int)a3
{
  *(_DWORD *)&self->_has |= 0x80000u;
  self->_version = a3;
}

- (void)setHasVersion:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 0x80000;
  else
    v3 = 0;
  self->_has = ($E76A4E3F312DA20721C84FD0B50D0B19)(*(_DWORD *)&self->_has & 0xFFF7FFFF | v3);
}

- (BOOL)hasVersion
{
  return (*((unsigned __int8 *)&self->_has + 2) >> 3) & 1;
}

- (id)description
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)CellularWcdmaRlcThroughput;
  v3 = -[CellularWcdmaRlcThroughput description](&v8, "description");
  v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[CellularWcdmaRlcThroughput dictionaryRepresentation](self, "dictionaryRepresentation"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@ %@"), v4, v5));

  return v6;
}

- (id)dictionaryRepresentation
{
  void *v3;
  $E76A4E3F312DA20721C84FD0B50D0B19 has;
  void *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;
  $E76A4E3F312DA20721C84FD0B50D0B19 v10;
  void *v11;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary"));
  has = self->_has;
  if ((*(_BYTE *)&has & 1) != 0)
  {
    v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedLongLong:](NSNumber, "numberWithUnsignedLongLong:", self->_timestamp));
    objc_msgSend(v3, "setObject:forKey:", v13, CFSTR("timestamp"));

    has = self->_has;
    if ((*(_WORD *)&has & 0x4000) == 0)
    {
LABEL_3:
      if ((*(_WORD *)&has & 0x8000) == 0)
        goto LABEL_4;
      goto LABEL_26;
    }
  }
  else if ((*(_WORD *)&has & 0x4000) == 0)
  {
    goto LABEL_3;
  }
  v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", self->_psDuration));
  objc_msgSend(v3, "setObject:forKey:", v14, CFSTR("ps_duration"));

  has = self->_has;
  if ((*(_WORD *)&has & 0x8000) == 0)
  {
LABEL_4:
    if ((*(_BYTE *)&has & 0x80) == 0)
      goto LABEL_5;
    goto LABEL_27;
  }
LABEL_26:
  v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", self->_totalFachDuration));
  objc_msgSend(v3, "setObject:forKey:", v15, CFSTR("total_fach_duration"));

  has = self->_has;
  if ((*(_BYTE *)&has & 0x80) == 0)
  {
LABEL_5:
    if ((*(_WORD *)&has & 0x2000) == 0)
      goto LABEL_6;
    goto LABEL_28;
  }
LABEL_27:
  v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", self->_lastFachDuration));
  objc_msgSend(v3, "setObject:forKey:", v16, CFSTR("last_fach_duration"));

  has = self->_has;
  if ((*(_WORD *)&has & 0x2000) == 0)
  {
LABEL_6:
    if ((*(_WORD *)&has & 0x100) == 0)
      goto LABEL_7;
    goto LABEL_29;
  }
LABEL_28:
  v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", self->_mrabDuration));
  objc_msgSend(v3, "setObject:forKey:", v17, CFSTR("mrab_duration"));

  has = self->_has;
  if ((*(_WORD *)&has & 0x100) == 0)
  {
LABEL_7:
    if ((*(_BYTE *)&has & 0x40) == 0)
      goto LABEL_8;
    goto LABEL_30;
  }
LABEL_29:
  v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", self->_lastUlInactiveDur));
  objc_msgSend(v3, "setObject:forKey:", v18, CFSTR("last_ul_inactive_dur"));

  has = self->_has;
  if ((*(_BYTE *)&has & 0x40) == 0)
  {
LABEL_8:
    if ((*(_BYTE *)&has & 4) == 0)
      goto LABEL_9;
    goto LABEL_31;
  }
LABEL_30:
  v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", self->_lastDlInactiveDur));
  objc_msgSend(v3, "setObject:forKey:", v19, CFSTR("last_dl_inactive_dur"));

  has = self->_has;
  if ((*(_BYTE *)&has & 4) == 0)
  {
LABEL_9:
    if ((*(_BYTE *)&has & 2) == 0)
      goto LABEL_10;
    goto LABEL_32;
  }
LABEL_31:
  v20 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", self->_aveUlThroughput));
  objc_msgSend(v3, "setObject:forKey:", v20, CFSTR("ave_ul_throughput"));

  has = self->_has;
  if ((*(_BYTE *)&has & 2) == 0)
  {
LABEL_10:
    if ((*(_WORD *)&has & 0x1000) == 0)
      goto LABEL_11;
    goto LABEL_33;
  }
LABEL_32:
  v21 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", self->_aveDlThroughput));
  objc_msgSend(v3, "setObject:forKey:", v21, CFSTR("ave_dl_throughput"));

  has = self->_has;
  if ((*(_WORD *)&has & 0x1000) == 0)
  {
LABEL_11:
    if ((*(_WORD *)&has & 0x400) == 0)
      goto LABEL_12;
    goto LABEL_34;
  }
LABEL_33:
  v22 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", self->_maxUlThroughput));
  objc_msgSend(v3, "setObject:forKey:", v22, CFSTR("max_ul_throughput"));

  has = self->_has;
  if ((*(_WORD *)&has & 0x400) == 0)
  {
LABEL_12:
    if ((*(_WORD *)&has & 0x800) == 0)
      goto LABEL_13;
    goto LABEL_35;
  }
LABEL_34:
  v23 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", self->_maxDlThroughput));
  objc_msgSend(v3, "setObject:forKey:", v23, CFSTR("max_dl_throughput"));

  has = self->_has;
  if ((*(_WORD *)&has & 0x800) == 0)
  {
LABEL_13:
    if ((*(_WORD *)&has & 0x200) == 0)
      goto LABEL_14;
    goto LABEL_36;
  }
LABEL_35:
  v24 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", self->_maxUlRbRate));
  objc_msgSend(v3, "setObject:forKey:", v24, CFSTR("max_ul_rb_rate"));

  has = self->_has;
  if ((*(_WORD *)&has & 0x200) == 0)
  {
LABEL_14:
    if ((*(_DWORD *)&has & 0x10000) == 0)
      goto LABEL_15;
    goto LABEL_37;
  }
LABEL_36:
  v25 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", self->_maxDlRbRate));
  objc_msgSend(v3, "setObject:forKey:", v25, CFSTR("max_dl_rb_rate"));

  has = self->_has;
  if ((*(_DWORD *)&has & 0x10000) == 0)
  {
LABEL_15:
    if ((*(_BYTE *)&has & 8) == 0)
      goto LABEL_16;
    goto LABEL_38;
  }
LABEL_37:
  v26 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", self->_ulActiveDur));
  objc_msgSend(v3, "setObject:forKey:", v26, CFSTR("ul_active_dur"));

  has = self->_has;
  if ((*(_BYTE *)&has & 8) == 0)
  {
LABEL_16:
    if ((*(_DWORD *)&has & 0x20000) == 0)
      goto LABEL_17;
    goto LABEL_39;
  }
LABEL_38:
  v27 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", self->_dlActiveDur));
  objc_msgSend(v3, "setObject:forKey:", v27, CFSTR("dl_active_dur"));

  has = self->_has;
  if ((*(_DWORD *)&has & 0x20000) == 0)
  {
LABEL_17:
    if ((*(_BYTE *)&has & 0x10) == 0)
      goto LABEL_19;
    goto LABEL_18;
  }
LABEL_39:
  v28 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", self->_ulRetxBlockRatePpt));
  objc_msgSend(v3, "setObject:forKey:", v28, CFSTR("ul_retx_block_rate_ppt"));

  if ((*(_DWORD *)&self->_has & 0x10) != 0)
  {
LABEL_18:
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", self->_dlBlerPpt));
    objc_msgSend(v3, "setObject:forKey:", v5, CFSTR("dl_bler_ppt"));

  }
LABEL_19:
  v6 = PBRepeatedUInt32NSArray(&self->_txPowerHists);
  v7 = (void *)objc_claimAutoreleasedReturnValue(v6);
  objc_msgSend(v3, "setObject:forKey:", v7, CFSTR("tx_power_hist"));

  v8 = PBRepeatedUInt32NSArray(&self->_rxPowerHists);
  v9 = (void *)objc_claimAutoreleasedReturnValue(v8);
  objc_msgSend(v3, "setObject:forKey:", v9, CFSTR("rx_power_hist"));

  v10 = self->_has;
  if ((*(_DWORD *)&v10 & 0x40000) == 0)
  {
    if ((*(_BYTE *)&v10 & 0x20) == 0)
      goto LABEL_21;
LABEL_42:
    v30 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", self->_dlTotalBytes));
    objc_msgSend(v3, "setObject:forKey:", v30, CFSTR("dl_total_bytes"));

    if ((*(_DWORD *)&self->_has & 0x80000) == 0)
      return v3;
    goto LABEL_22;
  }
  v29 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", self->_ulTotalBytes));
  objc_msgSend(v3, "setObject:forKey:", v29, CFSTR("ul_total_bytes"));

  v10 = self->_has;
  if ((*(_BYTE *)&v10 & 0x20) != 0)
    goto LABEL_42;
LABEL_21:
  if ((*(_DWORD *)&v10 & 0x80000) != 0)
  {
LABEL_22:
    v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", self->_version));
    objc_msgSend(v3, "setObject:forKey:", v11, CFSTR("version"));

  }
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return sub_10006674C((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4;
  $E76A4E3F312DA20721C84FD0B50D0B19 has;
  unint64_t v6;
  unint64_t v7;
  $E76A4E3F312DA20721C84FD0B50D0B19 v8;
  id v9;

  v4 = a3;
  has = self->_has;
  v9 = v4;
  if ((*(_BYTE *)&has & 1) != 0)
  {
    PBDataWriterWriteUint64Field(v4, self->_timestamp, 1);
    v4 = v9;
    has = self->_has;
    if ((*(_WORD *)&has & 0x4000) == 0)
    {
LABEL_3:
      if ((*(_WORD *)&has & 0x8000) == 0)
        goto LABEL_4;
      goto LABEL_32;
    }
  }
  else if ((*(_WORD *)&has & 0x4000) == 0)
  {
    goto LABEL_3;
  }
  PBDataWriterWriteUint32Field(v9, self->_psDuration, 2);
  v4 = v9;
  has = self->_has;
  if ((*(_WORD *)&has & 0x8000) == 0)
  {
LABEL_4:
    if ((*(_BYTE *)&has & 0x80) == 0)
      goto LABEL_5;
    goto LABEL_33;
  }
LABEL_32:
  PBDataWriterWriteUint32Field(v9, self->_totalFachDuration, 3);
  v4 = v9;
  has = self->_has;
  if ((*(_BYTE *)&has & 0x80) == 0)
  {
LABEL_5:
    if ((*(_WORD *)&has & 0x2000) == 0)
      goto LABEL_6;
    goto LABEL_34;
  }
LABEL_33:
  PBDataWriterWriteUint32Field(v9, self->_lastFachDuration, 4);
  v4 = v9;
  has = self->_has;
  if ((*(_WORD *)&has & 0x2000) == 0)
  {
LABEL_6:
    if ((*(_WORD *)&has & 0x100) == 0)
      goto LABEL_7;
    goto LABEL_35;
  }
LABEL_34:
  PBDataWriterWriteUint32Field(v9, self->_mrabDuration, 5);
  v4 = v9;
  has = self->_has;
  if ((*(_WORD *)&has & 0x100) == 0)
  {
LABEL_7:
    if ((*(_BYTE *)&has & 0x40) == 0)
      goto LABEL_8;
    goto LABEL_36;
  }
LABEL_35:
  PBDataWriterWriteUint32Field(v9, self->_lastUlInactiveDur, 7);
  v4 = v9;
  has = self->_has;
  if ((*(_BYTE *)&has & 0x40) == 0)
  {
LABEL_8:
    if ((*(_BYTE *)&has & 4) == 0)
      goto LABEL_9;
    goto LABEL_37;
  }
LABEL_36:
  PBDataWriterWriteUint32Field(v9, self->_lastDlInactiveDur, 8);
  v4 = v9;
  has = self->_has;
  if ((*(_BYTE *)&has & 4) == 0)
  {
LABEL_9:
    if ((*(_BYTE *)&has & 2) == 0)
      goto LABEL_10;
    goto LABEL_38;
  }
LABEL_37:
  PBDataWriterWriteUint32Field(v9, self->_aveUlThroughput, 10);
  v4 = v9;
  has = self->_has;
  if ((*(_BYTE *)&has & 2) == 0)
  {
LABEL_10:
    if ((*(_WORD *)&has & 0x1000) == 0)
      goto LABEL_11;
    goto LABEL_39;
  }
LABEL_38:
  PBDataWriterWriteUint32Field(v9, self->_aveDlThroughput, 11);
  v4 = v9;
  has = self->_has;
  if ((*(_WORD *)&has & 0x1000) == 0)
  {
LABEL_11:
    if ((*(_WORD *)&has & 0x400) == 0)
      goto LABEL_12;
    goto LABEL_40;
  }
LABEL_39:
  PBDataWriterWriteUint32Field(v9, self->_maxUlThroughput, 12);
  v4 = v9;
  has = self->_has;
  if ((*(_WORD *)&has & 0x400) == 0)
  {
LABEL_12:
    if ((*(_WORD *)&has & 0x800) == 0)
      goto LABEL_13;
    goto LABEL_41;
  }
LABEL_40:
  PBDataWriterWriteUint32Field(v9, self->_maxDlThroughput, 13);
  v4 = v9;
  has = self->_has;
  if ((*(_WORD *)&has & 0x800) == 0)
  {
LABEL_13:
    if ((*(_WORD *)&has & 0x200) == 0)
      goto LABEL_14;
    goto LABEL_42;
  }
LABEL_41:
  PBDataWriterWriteUint32Field(v9, self->_maxUlRbRate, 14);
  v4 = v9;
  has = self->_has;
  if ((*(_WORD *)&has & 0x200) == 0)
  {
LABEL_14:
    if ((*(_DWORD *)&has & 0x10000) == 0)
      goto LABEL_15;
    goto LABEL_43;
  }
LABEL_42:
  PBDataWriterWriteUint32Field(v9, self->_maxDlRbRate, 15);
  v4 = v9;
  has = self->_has;
  if ((*(_DWORD *)&has & 0x10000) == 0)
  {
LABEL_15:
    if ((*(_BYTE *)&has & 8) == 0)
      goto LABEL_16;
    goto LABEL_44;
  }
LABEL_43:
  PBDataWriterWriteUint32Field(v9, self->_ulActiveDur, 16);
  v4 = v9;
  has = self->_has;
  if ((*(_BYTE *)&has & 8) == 0)
  {
LABEL_16:
    if ((*(_DWORD *)&has & 0x20000) == 0)
      goto LABEL_17;
    goto LABEL_45;
  }
LABEL_44:
  PBDataWriterWriteUint32Field(v9, self->_dlActiveDur, 17);
  v4 = v9;
  has = self->_has;
  if ((*(_DWORD *)&has & 0x20000) == 0)
  {
LABEL_17:
    if ((*(_BYTE *)&has & 0x10) == 0)
      goto LABEL_19;
    goto LABEL_18;
  }
LABEL_45:
  PBDataWriterWriteUint32Field(v9, self->_ulRetxBlockRatePpt, 18);
  v4 = v9;
  if ((*(_DWORD *)&self->_has & 0x10) != 0)
  {
LABEL_18:
    PBDataWriterWriteUint32Field(v9, self->_dlBlerPpt, 19);
    v4 = v9;
  }
LABEL_19:
  if (self->_txPowerHists.count)
  {
    v6 = 0;
    do
    {
      PBDataWriterWriteUint32Field(v9, self->_txPowerHists.list[v6], 20);
      v4 = v9;
      ++v6;
    }
    while (v6 < self->_txPowerHists.count);
  }
  if (self->_rxPowerHists.count)
  {
    v7 = 0;
    do
    {
      PBDataWriterWriteUint32Field(v9, self->_rxPowerHists.list[v7], 21);
      v4 = v9;
      ++v7;
    }
    while (v7 < self->_rxPowerHists.count);
  }
  v8 = self->_has;
  if ((*(_DWORD *)&v8 & 0x40000) == 0)
  {
    if ((*(_BYTE *)&v8 & 0x20) == 0)
      goto LABEL_27;
LABEL_48:
    PBDataWriterWriteUint32Field(v9, self->_dlTotalBytes, 25);
    v4 = v9;
    if ((*(_DWORD *)&self->_has & 0x80000) == 0)
      goto LABEL_29;
    goto LABEL_28;
  }
  PBDataWriterWriteUint32Field(v9, self->_ulTotalBytes, 24);
  v4 = v9;
  v8 = self->_has;
  if ((*(_BYTE *)&v8 & 0x20) != 0)
    goto LABEL_48;
LABEL_27:
  if ((*(_DWORD *)&v8 & 0x80000) != 0)
  {
LABEL_28:
    PBDataWriterWriteUint32Field(v9, self->_version, 64);
    v4 = v9;
  }
LABEL_29:

}

- (void)copyTo:(id)a3
{
  _QWORD *v4;
  $E76A4E3F312DA20721C84FD0B50D0B19 has;
  unint64_t v6;
  unint64_t v7;
  uint64_t i;
  unint64_t v9;
  unint64_t v10;
  uint64_t j;
  $E76A4E3F312DA20721C84FD0B50D0B19 v12;
  _DWORD *v13;

  v4 = a3;
  has = self->_has;
  if ((*(_BYTE *)&has & 1) != 0)
  {
    v4[7] = self->_timestamp;
    *((_DWORD *)v4 + 35) |= 1u;
    has = self->_has;
    if ((*(_WORD *)&has & 0x4000) == 0)
    {
LABEL_3:
      if ((*(_WORD *)&has & 0x8000) == 0)
        goto LABEL_4;
      goto LABEL_34;
    }
  }
  else if ((*(_WORD *)&has & 0x4000) == 0)
  {
    goto LABEL_3;
  }
  *((_DWORD *)v4 + 29) = self->_psDuration;
  *((_DWORD *)v4 + 35) |= 0x4000u;
  has = self->_has;
  if ((*(_WORD *)&has & 0x8000) == 0)
  {
LABEL_4:
    if ((*(_BYTE *)&has & 0x80) == 0)
      goto LABEL_5;
    goto LABEL_35;
  }
LABEL_34:
  *((_DWORD *)v4 + 30) = self->_totalFachDuration;
  *((_DWORD *)v4 + 35) |= 0x8000u;
  has = self->_has;
  if ((*(_BYTE *)&has & 0x80) == 0)
  {
LABEL_5:
    if ((*(_WORD *)&has & 0x2000) == 0)
      goto LABEL_6;
    goto LABEL_36;
  }
LABEL_35:
  *((_DWORD *)v4 + 22) = self->_lastFachDuration;
  *((_DWORD *)v4 + 35) |= 0x80u;
  has = self->_has;
  if ((*(_WORD *)&has & 0x2000) == 0)
  {
LABEL_6:
    if ((*(_WORD *)&has & 0x100) == 0)
      goto LABEL_7;
    goto LABEL_37;
  }
LABEL_36:
  *((_DWORD *)v4 + 28) = self->_mrabDuration;
  *((_DWORD *)v4 + 35) |= 0x2000u;
  has = self->_has;
  if ((*(_WORD *)&has & 0x100) == 0)
  {
LABEL_7:
    if ((*(_BYTE *)&has & 0x40) == 0)
      goto LABEL_8;
    goto LABEL_38;
  }
LABEL_37:
  *((_DWORD *)v4 + 23) = self->_lastUlInactiveDur;
  *((_DWORD *)v4 + 35) |= 0x100u;
  has = self->_has;
  if ((*(_BYTE *)&has & 0x40) == 0)
  {
LABEL_8:
    if ((*(_BYTE *)&has & 4) == 0)
      goto LABEL_9;
    goto LABEL_39;
  }
LABEL_38:
  *((_DWORD *)v4 + 21) = self->_lastDlInactiveDur;
  *((_DWORD *)v4 + 35) |= 0x40u;
  has = self->_has;
  if ((*(_BYTE *)&has & 4) == 0)
  {
LABEL_9:
    if ((*(_BYTE *)&has & 2) == 0)
      goto LABEL_10;
    goto LABEL_40;
  }
LABEL_39:
  *((_DWORD *)v4 + 17) = self->_aveUlThroughput;
  *((_DWORD *)v4 + 35) |= 4u;
  has = self->_has;
  if ((*(_BYTE *)&has & 2) == 0)
  {
LABEL_10:
    if ((*(_WORD *)&has & 0x1000) == 0)
      goto LABEL_11;
    goto LABEL_41;
  }
LABEL_40:
  *((_DWORD *)v4 + 16) = self->_aveDlThroughput;
  *((_DWORD *)v4 + 35) |= 2u;
  has = self->_has;
  if ((*(_WORD *)&has & 0x1000) == 0)
  {
LABEL_11:
    if ((*(_WORD *)&has & 0x400) == 0)
      goto LABEL_12;
    goto LABEL_42;
  }
LABEL_41:
  *((_DWORD *)v4 + 27) = self->_maxUlThroughput;
  *((_DWORD *)v4 + 35) |= 0x1000u;
  has = self->_has;
  if ((*(_WORD *)&has & 0x400) == 0)
  {
LABEL_12:
    if ((*(_WORD *)&has & 0x800) == 0)
      goto LABEL_13;
    goto LABEL_43;
  }
LABEL_42:
  *((_DWORD *)v4 + 25) = self->_maxDlThroughput;
  *((_DWORD *)v4 + 35) |= 0x400u;
  has = self->_has;
  if ((*(_WORD *)&has & 0x800) == 0)
  {
LABEL_13:
    if ((*(_WORD *)&has & 0x200) == 0)
      goto LABEL_14;
    goto LABEL_44;
  }
LABEL_43:
  *((_DWORD *)v4 + 26) = self->_maxUlRbRate;
  *((_DWORD *)v4 + 35) |= 0x800u;
  has = self->_has;
  if ((*(_WORD *)&has & 0x200) == 0)
  {
LABEL_14:
    if ((*(_DWORD *)&has & 0x10000) == 0)
      goto LABEL_15;
    goto LABEL_45;
  }
LABEL_44:
  *((_DWORD *)v4 + 24) = self->_maxDlRbRate;
  *((_DWORD *)v4 + 35) |= 0x200u;
  has = self->_has;
  if ((*(_DWORD *)&has & 0x10000) == 0)
  {
LABEL_15:
    if ((*(_BYTE *)&has & 8) == 0)
      goto LABEL_16;
    goto LABEL_46;
  }
LABEL_45:
  *((_DWORD *)v4 + 31) = self->_ulActiveDur;
  *((_DWORD *)v4 + 35) |= 0x10000u;
  has = self->_has;
  if ((*(_BYTE *)&has & 8) == 0)
  {
LABEL_16:
    if ((*(_DWORD *)&has & 0x20000) == 0)
      goto LABEL_17;
LABEL_47:
    *((_DWORD *)v4 + 32) = self->_ulRetxBlockRatePpt;
    *((_DWORD *)v4 + 35) |= 0x20000u;
    if ((*(_DWORD *)&self->_has & 0x10) == 0)
      goto LABEL_19;
    goto LABEL_18;
  }
LABEL_46:
  *((_DWORD *)v4 + 18) = self->_dlActiveDur;
  *((_DWORD *)v4 + 35) |= 8u;
  has = self->_has;
  if ((*(_DWORD *)&has & 0x20000) != 0)
    goto LABEL_47;
LABEL_17:
  if ((*(_BYTE *)&has & 0x10) != 0)
  {
LABEL_18:
    *((_DWORD *)v4 + 19) = self->_dlBlerPpt;
    *((_DWORD *)v4 + 35) |= 0x10u;
  }
LABEL_19:
  v13 = v4;
  if (-[CellularWcdmaRlcThroughput txPowerHistsCount](self, "txPowerHistsCount"))
  {
    objc_msgSend(v13, "clearTxPowerHists");
    v6 = -[CellularWcdmaRlcThroughput txPowerHistsCount](self, "txPowerHistsCount");
    if (v6)
    {
      v7 = v6;
      for (i = 0; i != v7; ++i)
        objc_msgSend(v13, "addTxPowerHist:", -[CellularWcdmaRlcThroughput txPowerHistAtIndex:](self, "txPowerHistAtIndex:", i));
    }
  }
  if (-[CellularWcdmaRlcThroughput rxPowerHistsCount](self, "rxPowerHistsCount"))
  {
    objc_msgSend(v13, "clearRxPowerHists");
    v9 = -[CellularWcdmaRlcThroughput rxPowerHistsCount](self, "rxPowerHistsCount");
    if (v9)
    {
      v10 = v9;
      for (j = 0; j != v10; ++j)
        objc_msgSend(v13, "addRxPowerHist:", -[CellularWcdmaRlcThroughput rxPowerHistAtIndex:](self, "rxPowerHistAtIndex:", j));
    }
  }
  v12 = self->_has;
  if ((*(_DWORD *)&v12 & 0x40000) == 0)
  {
    if ((*(_BYTE *)&v12 & 0x20) == 0)
      goto LABEL_29;
LABEL_50:
    v13[20] = self->_dlTotalBytes;
    v13[35] |= 0x20u;
    if ((*(_DWORD *)&self->_has & 0x80000) == 0)
      goto LABEL_31;
    goto LABEL_30;
  }
  v13[33] = self->_ulTotalBytes;
  v13[35] |= 0x40000u;
  v12 = self->_has;
  if ((*(_BYTE *)&v12 & 0x20) != 0)
    goto LABEL_50;
LABEL_29:
  if ((*(_DWORD *)&v12 & 0x80000) != 0)
  {
LABEL_30:
    v13[34] = self->_version;
    v13[35] |= 0x80000u;
  }
LABEL_31:

}

- (id)copyWithZone:(_NSZone *)a3
{
  _DWORD *v4;
  _DWORD *v5;
  $E76A4E3F312DA20721C84FD0B50D0B19 has;
  $E76A4E3F312DA20721C84FD0B50D0B19 v7;

  v4 = objc_msgSend(objc_msgSend((id)objc_opt_class(self, a2), "allocWithZone:", a3), "init");
  v5 = v4;
  has = self->_has;
  if ((*(_BYTE *)&has & 1) != 0)
  {
    *((_QWORD *)v4 + 7) = self->_timestamp;
    v4[35] |= 1u;
    has = self->_has;
    if ((*(_WORD *)&has & 0x4000) == 0)
    {
LABEL_3:
      if ((*(_WORD *)&has & 0x8000) == 0)
        goto LABEL_4;
      goto LABEL_26;
    }
  }
  else if ((*(_WORD *)&has & 0x4000) == 0)
  {
    goto LABEL_3;
  }
  v4[29] = self->_psDuration;
  v4[35] |= 0x4000u;
  has = self->_has;
  if ((*(_WORD *)&has & 0x8000) == 0)
  {
LABEL_4:
    if ((*(_BYTE *)&has & 0x80) == 0)
      goto LABEL_5;
    goto LABEL_27;
  }
LABEL_26:
  v4[30] = self->_totalFachDuration;
  v4[35] |= 0x8000u;
  has = self->_has;
  if ((*(_BYTE *)&has & 0x80) == 0)
  {
LABEL_5:
    if ((*(_WORD *)&has & 0x2000) == 0)
      goto LABEL_6;
    goto LABEL_28;
  }
LABEL_27:
  v4[22] = self->_lastFachDuration;
  v4[35] |= 0x80u;
  has = self->_has;
  if ((*(_WORD *)&has & 0x2000) == 0)
  {
LABEL_6:
    if ((*(_WORD *)&has & 0x100) == 0)
      goto LABEL_7;
    goto LABEL_29;
  }
LABEL_28:
  v4[28] = self->_mrabDuration;
  v4[35] |= 0x2000u;
  has = self->_has;
  if ((*(_WORD *)&has & 0x100) == 0)
  {
LABEL_7:
    if ((*(_BYTE *)&has & 0x40) == 0)
      goto LABEL_8;
    goto LABEL_30;
  }
LABEL_29:
  v4[23] = self->_lastUlInactiveDur;
  v4[35] |= 0x100u;
  has = self->_has;
  if ((*(_BYTE *)&has & 0x40) == 0)
  {
LABEL_8:
    if ((*(_BYTE *)&has & 4) == 0)
      goto LABEL_9;
    goto LABEL_31;
  }
LABEL_30:
  v4[21] = self->_lastDlInactiveDur;
  v4[35] |= 0x40u;
  has = self->_has;
  if ((*(_BYTE *)&has & 4) == 0)
  {
LABEL_9:
    if ((*(_BYTE *)&has & 2) == 0)
      goto LABEL_10;
    goto LABEL_32;
  }
LABEL_31:
  v4[17] = self->_aveUlThroughput;
  v4[35] |= 4u;
  has = self->_has;
  if ((*(_BYTE *)&has & 2) == 0)
  {
LABEL_10:
    if ((*(_WORD *)&has & 0x1000) == 0)
      goto LABEL_11;
    goto LABEL_33;
  }
LABEL_32:
  v4[16] = self->_aveDlThroughput;
  v4[35] |= 2u;
  has = self->_has;
  if ((*(_WORD *)&has & 0x1000) == 0)
  {
LABEL_11:
    if ((*(_WORD *)&has & 0x400) == 0)
      goto LABEL_12;
    goto LABEL_34;
  }
LABEL_33:
  v4[27] = self->_maxUlThroughput;
  v4[35] |= 0x1000u;
  has = self->_has;
  if ((*(_WORD *)&has & 0x400) == 0)
  {
LABEL_12:
    if ((*(_WORD *)&has & 0x800) == 0)
      goto LABEL_13;
    goto LABEL_35;
  }
LABEL_34:
  v4[25] = self->_maxDlThroughput;
  v4[35] |= 0x400u;
  has = self->_has;
  if ((*(_WORD *)&has & 0x800) == 0)
  {
LABEL_13:
    if ((*(_WORD *)&has & 0x200) == 0)
      goto LABEL_14;
    goto LABEL_36;
  }
LABEL_35:
  v4[26] = self->_maxUlRbRate;
  v4[35] |= 0x800u;
  has = self->_has;
  if ((*(_WORD *)&has & 0x200) == 0)
  {
LABEL_14:
    if ((*(_DWORD *)&has & 0x10000) == 0)
      goto LABEL_15;
    goto LABEL_37;
  }
LABEL_36:
  v4[24] = self->_maxDlRbRate;
  v4[35] |= 0x200u;
  has = self->_has;
  if ((*(_DWORD *)&has & 0x10000) == 0)
  {
LABEL_15:
    if ((*(_BYTE *)&has & 8) == 0)
      goto LABEL_16;
    goto LABEL_38;
  }
LABEL_37:
  v4[31] = self->_ulActiveDur;
  v4[35] |= 0x10000u;
  has = self->_has;
  if ((*(_BYTE *)&has & 8) == 0)
  {
LABEL_16:
    if ((*(_DWORD *)&has & 0x20000) == 0)
      goto LABEL_17;
    goto LABEL_39;
  }
LABEL_38:
  v4[18] = self->_dlActiveDur;
  v4[35] |= 8u;
  has = self->_has;
  if ((*(_DWORD *)&has & 0x20000) == 0)
  {
LABEL_17:
    if ((*(_BYTE *)&has & 0x10) == 0)
      goto LABEL_19;
    goto LABEL_18;
  }
LABEL_39:
  v4[32] = self->_ulRetxBlockRatePpt;
  v4[35] |= 0x20000u;
  if ((*(_DWORD *)&self->_has & 0x10) != 0)
  {
LABEL_18:
    v4[19] = self->_dlBlerPpt;
    v4[35] |= 0x10u;
  }
LABEL_19:
  PBRepeatedUInt32Copy(v4 + 8, &self->_txPowerHists);
  PBRepeatedUInt32Copy(v5 + 2, &self->_rxPowerHists);
  v7 = self->_has;
  if ((*(_DWORD *)&v7 & 0x40000) == 0)
  {
    if ((*(_BYTE *)&v7 & 0x20) == 0)
      goto LABEL_21;
LABEL_42:
    v5[20] = self->_dlTotalBytes;
    v5[35] |= 0x20u;
    if ((*(_DWORD *)&self->_has & 0x80000) == 0)
      return v5;
    goto LABEL_22;
  }
  v5[33] = self->_ulTotalBytes;
  v5[35] |= 0x40000u;
  v7 = self->_has;
  if ((*(_BYTE *)&v7 & 0x20) != 0)
    goto LABEL_42;
LABEL_21:
  if ((*(_DWORD *)&v7 & 0x80000) != 0)
  {
LABEL_22:
    v5[34] = self->_version;
    v5[35] |= 0x80000u;
  }
  return v5;
}

- (BOOL)isEqual:(id)a3
{
  char *v4;
  uint64_t v5;
  $E76A4E3F312DA20721C84FD0B50D0B19 has;
  int v7;
  $E76A4E3F312DA20721C84FD0B50D0B19 v8;
  int v9;
  BOOL v10;

  v4 = (char *)a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class(self, v5)))
    goto LABEL_104;
  has = self->_has;
  v7 = *((_DWORD *)v4 + 35);
  if ((*(_BYTE *)&has & 1) != 0)
  {
    if ((v7 & 1) == 0 || self->_timestamp != *((_QWORD *)v4 + 7))
      goto LABEL_104;
  }
  else if ((v7 & 1) != 0)
  {
LABEL_104:
    v10 = 0;
    goto LABEL_105;
  }
  if ((*(_WORD *)&has & 0x4000) != 0)
  {
    if ((v7 & 0x4000) == 0 || self->_psDuration != *((_DWORD *)v4 + 29))
      goto LABEL_104;
  }
  else if ((v7 & 0x4000) != 0)
  {
    goto LABEL_104;
  }
  if ((*(_WORD *)&has & 0x8000) != 0)
  {
    if ((v7 & 0x8000) == 0 || self->_totalFachDuration != *((_DWORD *)v4 + 30))
      goto LABEL_104;
  }
  else if ((v7 & 0x8000) != 0)
  {
    goto LABEL_104;
  }
  if ((*(_BYTE *)&has & 0x80) != 0)
  {
    if ((v7 & 0x80) == 0 || self->_lastFachDuration != *((_DWORD *)v4 + 22))
      goto LABEL_104;
  }
  else if ((v7 & 0x80) != 0)
  {
    goto LABEL_104;
  }
  if ((*(_WORD *)&has & 0x2000) != 0)
  {
    if ((v7 & 0x2000) == 0 || self->_mrabDuration != *((_DWORD *)v4 + 28))
      goto LABEL_104;
  }
  else if ((v7 & 0x2000) != 0)
  {
    goto LABEL_104;
  }
  if ((*(_WORD *)&has & 0x100) != 0)
  {
    if ((v7 & 0x100) == 0 || self->_lastUlInactiveDur != *((_DWORD *)v4 + 23))
      goto LABEL_104;
  }
  else if ((v7 & 0x100) != 0)
  {
    goto LABEL_104;
  }
  if ((*(_BYTE *)&has & 0x40) != 0)
  {
    if ((v7 & 0x40) == 0 || self->_lastDlInactiveDur != *((_DWORD *)v4 + 21))
      goto LABEL_104;
  }
  else if ((v7 & 0x40) != 0)
  {
    goto LABEL_104;
  }
  if ((*(_BYTE *)&has & 4) != 0)
  {
    if ((v7 & 4) == 0 || self->_aveUlThroughput != *((_DWORD *)v4 + 17))
      goto LABEL_104;
  }
  else if ((v7 & 4) != 0)
  {
    goto LABEL_104;
  }
  if ((*(_BYTE *)&has & 2) != 0)
  {
    if ((v7 & 2) == 0 || self->_aveDlThroughput != *((_DWORD *)v4 + 16))
      goto LABEL_104;
  }
  else if ((v7 & 2) != 0)
  {
    goto LABEL_104;
  }
  if ((*(_WORD *)&has & 0x1000) != 0)
  {
    if ((v7 & 0x1000) == 0 || self->_maxUlThroughput != *((_DWORD *)v4 + 27))
      goto LABEL_104;
  }
  else if ((v7 & 0x1000) != 0)
  {
    goto LABEL_104;
  }
  if ((*(_WORD *)&has & 0x400) != 0)
  {
    if ((v7 & 0x400) == 0 || self->_maxDlThroughput != *((_DWORD *)v4 + 25))
      goto LABEL_104;
  }
  else if ((v7 & 0x400) != 0)
  {
    goto LABEL_104;
  }
  if ((*(_WORD *)&has & 0x800) != 0)
  {
    if ((v7 & 0x800) == 0 || self->_maxUlRbRate != *((_DWORD *)v4 + 26))
      goto LABEL_104;
  }
  else if ((v7 & 0x800) != 0)
  {
    goto LABEL_104;
  }
  if ((*(_WORD *)&has & 0x200) != 0)
  {
    if ((v7 & 0x200) == 0 || self->_maxDlRbRate != *((_DWORD *)v4 + 24))
      goto LABEL_104;
  }
  else if ((v7 & 0x200) != 0)
  {
    goto LABEL_104;
  }
  if ((*(_DWORD *)&has & 0x10000) != 0)
  {
    if ((v7 & 0x10000) == 0 || self->_ulActiveDur != *((_DWORD *)v4 + 31))
      goto LABEL_104;
  }
  else if ((v7 & 0x10000) != 0)
  {
    goto LABEL_104;
  }
  if ((*(_BYTE *)&has & 8) != 0)
  {
    if ((v7 & 8) == 0 || self->_dlActiveDur != *((_DWORD *)v4 + 18))
      goto LABEL_104;
  }
  else if ((v7 & 8) != 0)
  {
    goto LABEL_104;
  }
  if ((*(_DWORD *)&has & 0x20000) != 0)
  {
    if ((v7 & 0x20000) == 0 || self->_ulRetxBlockRatePpt != *((_DWORD *)v4 + 32))
      goto LABEL_104;
  }
  else if ((v7 & 0x20000) != 0)
  {
    goto LABEL_104;
  }
  if ((*(_BYTE *)&has & 0x10) != 0)
  {
    if ((v7 & 0x10) == 0 || self->_dlBlerPpt != *((_DWORD *)v4 + 19))
      goto LABEL_104;
  }
  else if ((v7 & 0x10) != 0)
  {
    goto LABEL_104;
  }
  if (!PBRepeatedUInt32IsEqual(&self->_txPowerHists, v4 + 32)
    || !PBRepeatedUInt32IsEqual(&self->_rxPowerHists, v4 + 8))
  {
    goto LABEL_104;
  }
  v8 = self->_has;
  v9 = *((_DWORD *)v4 + 35);
  if ((*(_DWORD *)&v8 & 0x40000) != 0)
  {
    if ((v9 & 0x40000) == 0 || self->_ulTotalBytes != *((_DWORD *)v4 + 33))
      goto LABEL_104;
  }
  else if ((v9 & 0x40000) != 0)
  {
    goto LABEL_104;
  }
  if ((*(_BYTE *)&v8 & 0x20) != 0)
  {
    if ((v9 & 0x20) == 0 || self->_dlTotalBytes != *((_DWORD *)v4 + 20))
      goto LABEL_104;
  }
  else if ((v9 & 0x20) != 0)
  {
    goto LABEL_104;
  }
  if ((*(_DWORD *)&v8 & 0x80000) != 0)
  {
    if ((v9 & 0x80000) == 0 || self->_version != *((_DWORD *)v4 + 34))
      goto LABEL_104;
    v10 = 1;
  }
  else
  {
    v10 = (v9 & 0x80000) == 0;
  }
LABEL_105:

  return v10;
}

- (unint64_t)hash
{
  $E76A4E3F312DA20721C84FD0B50D0B19 has;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  $E76A4E3F312DA20721C84FD0B50D0B19 v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  unint64_t v27;

  has = self->_has;
  if ((*(_BYTE *)&has & 1) != 0)
  {
    v27 = 2654435761u * self->_timestamp;
    if ((*(_WORD *)&has & 0x4000) != 0)
    {
LABEL_3:
      v26 = 2654435761 * self->_psDuration;
      if ((*(_WORD *)&has & 0x8000) != 0)
        goto LABEL_4;
      goto LABEL_21;
    }
  }
  else
  {
    v27 = 0;
    if ((*(_WORD *)&has & 0x4000) != 0)
      goto LABEL_3;
  }
  v26 = 0;
  if ((*(_WORD *)&has & 0x8000) != 0)
  {
LABEL_4:
    v25 = 2654435761 * self->_totalFachDuration;
    if ((*(_BYTE *)&has & 0x80) != 0)
      goto LABEL_5;
    goto LABEL_22;
  }
LABEL_21:
  v25 = 0;
  if ((*(_BYTE *)&has & 0x80) != 0)
  {
LABEL_5:
    v24 = 2654435761 * self->_lastFachDuration;
    if ((*(_WORD *)&has & 0x2000) != 0)
      goto LABEL_6;
    goto LABEL_23;
  }
LABEL_22:
  v24 = 0;
  if ((*(_WORD *)&has & 0x2000) != 0)
  {
LABEL_6:
    v23 = 2654435761 * self->_mrabDuration;
    if ((*(_WORD *)&has & 0x100) != 0)
      goto LABEL_7;
    goto LABEL_24;
  }
LABEL_23:
  v23 = 0;
  if ((*(_WORD *)&has & 0x100) != 0)
  {
LABEL_7:
    v22 = 2654435761 * self->_lastUlInactiveDur;
    if ((*(_BYTE *)&has & 0x40) != 0)
      goto LABEL_8;
    goto LABEL_25;
  }
LABEL_24:
  v22 = 0;
  if ((*(_BYTE *)&has & 0x40) != 0)
  {
LABEL_8:
    v21 = 2654435761 * self->_lastDlInactiveDur;
    if ((*(_BYTE *)&has & 4) != 0)
      goto LABEL_9;
    goto LABEL_26;
  }
LABEL_25:
  v21 = 0;
  if ((*(_BYTE *)&has & 4) != 0)
  {
LABEL_9:
    v20 = 2654435761 * self->_aveUlThroughput;
    if ((*(_BYTE *)&has & 2) != 0)
      goto LABEL_10;
    goto LABEL_27;
  }
LABEL_26:
  v20 = 0;
  if ((*(_BYTE *)&has & 2) != 0)
  {
LABEL_10:
    v19 = 2654435761 * self->_aveDlThroughput;
    if ((*(_WORD *)&has & 0x1000) != 0)
      goto LABEL_11;
    goto LABEL_28;
  }
LABEL_27:
  v19 = 0;
  if ((*(_WORD *)&has & 0x1000) != 0)
  {
LABEL_11:
    v18 = 2654435761 * self->_maxUlThroughput;
    if ((*(_WORD *)&has & 0x400) != 0)
      goto LABEL_12;
    goto LABEL_29;
  }
LABEL_28:
  v18 = 0;
  if ((*(_WORD *)&has & 0x400) != 0)
  {
LABEL_12:
    v4 = 2654435761 * self->_maxDlThroughput;
    if ((*(_WORD *)&has & 0x800) != 0)
      goto LABEL_13;
    goto LABEL_30;
  }
LABEL_29:
  v4 = 0;
  if ((*(_WORD *)&has & 0x800) != 0)
  {
LABEL_13:
    v5 = 2654435761 * self->_maxUlRbRate;
    if ((*(_WORD *)&has & 0x200) != 0)
      goto LABEL_14;
    goto LABEL_31;
  }
LABEL_30:
  v5 = 0;
  if ((*(_WORD *)&has & 0x200) != 0)
  {
LABEL_14:
    v6 = 2654435761 * self->_maxDlRbRate;
    if ((*(_DWORD *)&has & 0x10000) != 0)
      goto LABEL_15;
    goto LABEL_32;
  }
LABEL_31:
  v6 = 0;
  if ((*(_DWORD *)&has & 0x10000) != 0)
  {
LABEL_15:
    v7 = 2654435761 * self->_ulActiveDur;
    if ((*(_BYTE *)&has & 8) != 0)
      goto LABEL_16;
    goto LABEL_33;
  }
LABEL_32:
  v7 = 0;
  if ((*(_BYTE *)&has & 8) != 0)
  {
LABEL_16:
    v8 = 2654435761 * self->_dlActiveDur;
    if ((*(_DWORD *)&has & 0x20000) != 0)
      goto LABEL_17;
LABEL_34:
    v9 = 0;
    if ((*(_BYTE *)&has & 0x10) != 0)
      goto LABEL_18;
    goto LABEL_35;
  }
LABEL_33:
  v8 = 0;
  if ((*(_DWORD *)&has & 0x20000) == 0)
    goto LABEL_34;
LABEL_17:
  v9 = 2654435761 * self->_ulRetxBlockRatePpt;
  if ((*(_BYTE *)&has & 0x10) != 0)
  {
LABEL_18:
    v10 = 2654435761 * self->_dlBlerPpt;
    goto LABEL_36;
  }
LABEL_35:
  v10 = 0;
LABEL_36:
  v11 = PBRepeatedUInt32Hash(&self->_txPowerHists);
  v12 = PBRepeatedUInt32Hash(&self->_rxPowerHists);
  v13 = self->_has;
  if ((*(_DWORD *)&v13 & 0x40000) == 0)
  {
    v14 = 0;
    if ((*(_BYTE *)&v13 & 0x20) != 0)
      goto LABEL_38;
LABEL_41:
    v15 = 0;
    if ((*(_DWORD *)&v13 & 0x80000) != 0)
      goto LABEL_39;
LABEL_42:
    v16 = 0;
    return v26 ^ v27 ^ v25 ^ v24 ^ v23 ^ v22 ^ v21 ^ v20 ^ v19 ^ v18 ^ v4 ^ v5 ^ v6 ^ v7 ^ v8 ^ v9 ^ v10 ^ v11 ^ v12 ^ v14 ^ v15 ^ v16;
  }
  v14 = 2654435761 * self->_ulTotalBytes;
  if ((*(_BYTE *)&v13 & 0x20) == 0)
    goto LABEL_41;
LABEL_38:
  v15 = 2654435761 * self->_dlTotalBytes;
  if ((*(_DWORD *)&v13 & 0x80000) == 0)
    goto LABEL_42;
LABEL_39:
  v16 = 2654435761 * self->_version;
  return v26 ^ v27 ^ v25 ^ v24 ^ v23 ^ v22 ^ v21 ^ v20 ^ v19 ^ v18 ^ v4 ^ v5 ^ v6 ^ v7 ^ v8 ^ v9 ^ v10 ^ v11 ^ v12 ^ v14 ^ v15 ^ v16;
}

- (void)mergeFrom:(id)a3
{
  id v4;
  int v5;
  char *v6;
  char *v7;
  char *i;
  char *v9;
  char *v10;
  char *j;
  unsigned int v12;
  unsigned int *v13;

  v4 = a3;
  v5 = *((_DWORD *)v4 + 35);
  if ((v5 & 1) != 0)
  {
    self->_timestamp = *((_QWORD *)v4 + 7);
    *(_DWORD *)&self->_has |= 1u;
    v5 = *((_DWORD *)v4 + 35);
    if ((v5 & 0x4000) == 0)
    {
LABEL_3:
      if ((v5 & 0x8000) == 0)
        goto LABEL_4;
      goto LABEL_32;
    }
  }
  else if ((v5 & 0x4000) == 0)
  {
    goto LABEL_3;
  }
  self->_psDuration = *((_DWORD *)v4 + 29);
  *(_DWORD *)&self->_has |= 0x4000u;
  v5 = *((_DWORD *)v4 + 35);
  if ((v5 & 0x8000) == 0)
  {
LABEL_4:
    if ((v5 & 0x80) == 0)
      goto LABEL_5;
    goto LABEL_33;
  }
LABEL_32:
  self->_totalFachDuration = *((_DWORD *)v4 + 30);
  *(_DWORD *)&self->_has |= 0x8000u;
  v5 = *((_DWORD *)v4 + 35);
  if ((v5 & 0x80) == 0)
  {
LABEL_5:
    if ((v5 & 0x2000) == 0)
      goto LABEL_6;
    goto LABEL_34;
  }
LABEL_33:
  self->_lastFachDuration = *((_DWORD *)v4 + 22);
  *(_DWORD *)&self->_has |= 0x80u;
  v5 = *((_DWORD *)v4 + 35);
  if ((v5 & 0x2000) == 0)
  {
LABEL_6:
    if ((v5 & 0x100) == 0)
      goto LABEL_7;
    goto LABEL_35;
  }
LABEL_34:
  self->_mrabDuration = *((_DWORD *)v4 + 28);
  *(_DWORD *)&self->_has |= 0x2000u;
  v5 = *((_DWORD *)v4 + 35);
  if ((v5 & 0x100) == 0)
  {
LABEL_7:
    if ((v5 & 0x40) == 0)
      goto LABEL_8;
    goto LABEL_36;
  }
LABEL_35:
  self->_lastUlInactiveDur = *((_DWORD *)v4 + 23);
  *(_DWORD *)&self->_has |= 0x100u;
  v5 = *((_DWORD *)v4 + 35);
  if ((v5 & 0x40) == 0)
  {
LABEL_8:
    if ((v5 & 4) == 0)
      goto LABEL_9;
    goto LABEL_37;
  }
LABEL_36:
  self->_lastDlInactiveDur = *((_DWORD *)v4 + 21);
  *(_DWORD *)&self->_has |= 0x40u;
  v5 = *((_DWORD *)v4 + 35);
  if ((v5 & 4) == 0)
  {
LABEL_9:
    if ((v5 & 2) == 0)
      goto LABEL_10;
    goto LABEL_38;
  }
LABEL_37:
  self->_aveUlThroughput = *((_DWORD *)v4 + 17);
  *(_DWORD *)&self->_has |= 4u;
  v5 = *((_DWORD *)v4 + 35);
  if ((v5 & 2) == 0)
  {
LABEL_10:
    if ((v5 & 0x1000) == 0)
      goto LABEL_11;
    goto LABEL_39;
  }
LABEL_38:
  self->_aveDlThroughput = *((_DWORD *)v4 + 16);
  *(_DWORD *)&self->_has |= 2u;
  v5 = *((_DWORD *)v4 + 35);
  if ((v5 & 0x1000) == 0)
  {
LABEL_11:
    if ((v5 & 0x400) == 0)
      goto LABEL_12;
    goto LABEL_40;
  }
LABEL_39:
  self->_maxUlThroughput = *((_DWORD *)v4 + 27);
  *(_DWORD *)&self->_has |= 0x1000u;
  v5 = *((_DWORD *)v4 + 35);
  if ((v5 & 0x400) == 0)
  {
LABEL_12:
    if ((v5 & 0x800) == 0)
      goto LABEL_13;
    goto LABEL_41;
  }
LABEL_40:
  self->_maxDlThroughput = *((_DWORD *)v4 + 25);
  *(_DWORD *)&self->_has |= 0x400u;
  v5 = *((_DWORD *)v4 + 35);
  if ((v5 & 0x800) == 0)
  {
LABEL_13:
    if ((v5 & 0x200) == 0)
      goto LABEL_14;
    goto LABEL_42;
  }
LABEL_41:
  self->_maxUlRbRate = *((_DWORD *)v4 + 26);
  *(_DWORD *)&self->_has |= 0x800u;
  v5 = *((_DWORD *)v4 + 35);
  if ((v5 & 0x200) == 0)
  {
LABEL_14:
    if ((v5 & 0x10000) == 0)
      goto LABEL_15;
    goto LABEL_43;
  }
LABEL_42:
  self->_maxDlRbRate = *((_DWORD *)v4 + 24);
  *(_DWORD *)&self->_has |= 0x200u;
  v5 = *((_DWORD *)v4 + 35);
  if ((v5 & 0x10000) == 0)
  {
LABEL_15:
    if ((v5 & 8) == 0)
      goto LABEL_16;
    goto LABEL_44;
  }
LABEL_43:
  self->_ulActiveDur = *((_DWORD *)v4 + 31);
  *(_DWORD *)&self->_has |= 0x10000u;
  v5 = *((_DWORD *)v4 + 35);
  if ((v5 & 8) == 0)
  {
LABEL_16:
    if ((v5 & 0x20000) == 0)
      goto LABEL_17;
    goto LABEL_45;
  }
LABEL_44:
  self->_dlActiveDur = *((_DWORD *)v4 + 18);
  *(_DWORD *)&self->_has |= 8u;
  v5 = *((_DWORD *)v4 + 35);
  if ((v5 & 0x20000) == 0)
  {
LABEL_17:
    if ((v5 & 0x10) == 0)
      goto LABEL_19;
    goto LABEL_18;
  }
LABEL_45:
  self->_ulRetxBlockRatePpt = *((_DWORD *)v4 + 32);
  *(_DWORD *)&self->_has |= 0x20000u;
  if ((*((_DWORD *)v4 + 35) & 0x10) != 0)
  {
LABEL_18:
    self->_dlBlerPpt = *((_DWORD *)v4 + 19);
    *(_DWORD *)&self->_has |= 0x10u;
  }
LABEL_19:
  v13 = (unsigned int *)v4;
  v6 = (char *)objc_msgSend(v4, "txPowerHistsCount");
  if (v6)
  {
    v7 = v6;
    for (i = 0; i != v7; ++i)
      -[CellularWcdmaRlcThroughput addTxPowerHist:](self, "addTxPowerHist:", objc_msgSend(v13, "txPowerHistAtIndex:", i));
  }
  v9 = (char *)objc_msgSend(v13, "rxPowerHistsCount");
  if (v9)
  {
    v10 = v9;
    for (j = 0; j != v10; ++j)
      -[CellularWcdmaRlcThroughput addRxPowerHist:](self, "addRxPowerHist:", objc_msgSend(v13, "rxPowerHistAtIndex:", j));
  }
  v12 = v13[35];
  if ((v12 & 0x40000) == 0)
  {
    if ((v12 & 0x20) == 0)
      goto LABEL_27;
LABEL_48:
    self->_dlTotalBytes = v13[20];
    *(_DWORD *)&self->_has |= 0x20u;
    if ((v13[35] & 0x80000) == 0)
      goto LABEL_29;
    goto LABEL_28;
  }
  self->_ulTotalBytes = v13[33];
  *(_DWORD *)&self->_has |= 0x40000u;
  v12 = v13[35];
  if ((v12 & 0x20) != 0)
    goto LABEL_48;
LABEL_27:
  if ((v12 & 0x80000) != 0)
  {
LABEL_28:
    self->_version = v13[34];
    *(_DWORD *)&self->_has |= 0x80000u;
  }
LABEL_29:

}

- (unint64_t)timestamp
{
  return self->_timestamp;
}

- (unsigned)psDuration
{
  return self->_psDuration;
}

- (unsigned)totalFachDuration
{
  return self->_totalFachDuration;
}

- (unsigned)lastFachDuration
{
  return self->_lastFachDuration;
}

- (unsigned)mrabDuration
{
  return self->_mrabDuration;
}

- (unsigned)lastUlInactiveDur
{
  return self->_lastUlInactiveDur;
}

- (unsigned)lastDlInactiveDur
{
  return self->_lastDlInactiveDur;
}

- (unsigned)aveUlThroughput
{
  return self->_aveUlThroughput;
}

- (unsigned)aveDlThroughput
{
  return self->_aveDlThroughput;
}

- (unsigned)maxUlThroughput
{
  return self->_maxUlThroughput;
}

- (unsigned)maxDlThroughput
{
  return self->_maxDlThroughput;
}

- (unsigned)maxUlRbRate
{
  return self->_maxUlRbRate;
}

- (unsigned)maxDlRbRate
{
  return self->_maxDlRbRate;
}

- (unsigned)ulActiveDur
{
  return self->_ulActiveDur;
}

- (unsigned)dlActiveDur
{
  return self->_dlActiveDur;
}

- (unsigned)ulRetxBlockRatePpt
{
  return self->_ulRetxBlockRatePpt;
}

- (unsigned)dlBlerPpt
{
  return self->_dlBlerPpt;
}

- (unsigned)ulTotalBytes
{
  return self->_ulTotalBytes;
}

- (unsigned)dlTotalBytes
{
  return self->_dlTotalBytes;
}

- (unsigned)version
{
  return self->_version;
}

@end
