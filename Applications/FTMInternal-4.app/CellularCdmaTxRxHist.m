@implementation CellularCdmaTxRxHist

- (void)dealloc
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  objc_super v10;

  PBRepeatedUInt32Clear(&self->_rx0IdleCounts, a2);
  PBRepeatedUInt32Clear(&self->_rx0TrafficCounts, v3);
  PBRepeatedUInt32Clear(&self->_rx1TrafficCounts, v4);
  PBRepeatedUInt32Clear(&self->_txTrafficCounts, v5);
  PBRepeatedUInt32Clear(&self->_hdrRx0IdleCounts, v6);
  PBRepeatedUInt32Clear(&self->_hdrRx0TrafficCounts, v7);
  PBRepeatedUInt32Clear(&self->_hdrRx1TrafficCounts, v8);
  PBRepeatedUInt32Clear(&self->_hdrTxTrafficCounts, v9);
  v10.receiver = self;
  v10.super_class = (Class)CellularCdmaTxRxHist;
  -[CellularCdmaTxRxHist dealloc](&v10, "dealloc");
}

- (void)setTimestamp:(unint64_t)a3
{
  *(_WORD *)&self->_has |= 1u;
  self->_timestamp = a3;
}

- (void)setHasTimestamp:(BOOL)a3
{
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFFE | a3;
}

- (BOOL)hasTimestamp
{
  return *(_WORD *)&self->_has & 1;
}

- (void)setDuration:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 4u;
  self->_duration = a3;
}

- (void)setHasDuration:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 4;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFFB | v3;
}

- (BOOL)hasDuration
{
  return (*(_WORD *)&self->_has >> 2) & 1;
}

- (void)setRx0IdleCountAll:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 0x80u;
  self->_rx0IdleCountAll = a3;
}

- (void)setHasRx0IdleCountAll:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 128;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFF7F | v3;
}

- (BOOL)hasRx0IdleCountAll
{
  return (*(_WORD *)&self->_has >> 7) & 1;
}

- (void)setRx0TrafficCountAll:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 0x100u;
  self->_rx0TrafficCountAll = a3;
}

- (void)setHasRx0TrafficCountAll:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 256;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFEFF | v3;
}

- (BOOL)hasRx0TrafficCountAll
{
  return HIBYTE(*(_WORD *)&self->_has) & 1;
}

- (void)setRx1TrafficCountAll:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 0x200u;
  self->_rx1TrafficCountAll = a3;
}

- (void)setHasRx1TrafficCountAll:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 512;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFDFF | v3;
}

- (BOOL)hasRx1TrafficCountAll
{
  return (*(_WORD *)&self->_has >> 9) & 1;
}

- (void)setTxTrafficCountAll:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 0x400u;
  self->_txTrafficCountAll = a3;
}

- (void)setHasTxTrafficCountAll:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 1024;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFBFF | v3;
}

- (BOOL)hasTxTrafficCountAll
{
  return (*(_WORD *)&self->_has >> 10) & 1;
}

- (unint64_t)rx0IdleCountsCount
{
  return self->_rx0IdleCounts.count;
}

- (unsigned)rx0IdleCounts
{
  return self->_rx0IdleCounts.list;
}

- (void)clearRx0IdleCounts
{
  PBRepeatedUInt32Clear(&self->_rx0IdleCounts, a2);
}

- (void)addRx0IdleCount:(unsigned int)a3
{
  PBRepeatedUInt32Add(&self->_rx0IdleCounts, *(_QWORD *)&a3);
}

- (unsigned)rx0IdleCountAtIndex:(unint64_t)a3
{
  $1729E44CE8A3ADE0AA70C2F19EF2BB02 *p_rx0IdleCounts;
  unint64_t count;
  void *v6;
  void *v7;

  p_rx0IdleCounts = &self->_rx0IdleCounts;
  count = self->_rx0IdleCounts.count;
  if (count <= a3)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("idx (%tu) is out of range (%tu)"), a3, count));
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSException exceptionWithName:reason:userInfo:](NSException, "exceptionWithName:reason:userInfo:", NSRangeException, v6, 0));
    objc_msgSend(v7, "raise");

  }
  return p_rx0IdleCounts->list[a3];
}

- (void)setRx0IdleCounts:(unsigned int *)a3 count:(unint64_t)a4
{
  PBRepeatedUInt32Set(&self->_rx0IdleCounts, a3, a4);
}

- (unint64_t)rx0TrafficCountsCount
{
  return self->_rx0TrafficCounts.count;
}

- (unsigned)rx0TrafficCounts
{
  return self->_rx0TrafficCounts.list;
}

- (void)clearRx0TrafficCounts
{
  PBRepeatedUInt32Clear(&self->_rx0TrafficCounts, a2);
}

- (void)addRx0TrafficCount:(unsigned int)a3
{
  PBRepeatedUInt32Add(&self->_rx0TrafficCounts, *(_QWORD *)&a3);
}

- (unsigned)rx0TrafficCountAtIndex:(unint64_t)a3
{
  $1729E44CE8A3ADE0AA70C2F19EF2BB02 *p_rx0TrafficCounts;
  unint64_t count;
  void *v6;
  void *v7;

  p_rx0TrafficCounts = &self->_rx0TrafficCounts;
  count = self->_rx0TrafficCounts.count;
  if (count <= a3)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("idx (%tu) is out of range (%tu)"), a3, count));
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSException exceptionWithName:reason:userInfo:](NSException, "exceptionWithName:reason:userInfo:", NSRangeException, v6, 0));
    objc_msgSend(v7, "raise");

  }
  return p_rx0TrafficCounts->list[a3];
}

- (void)setRx0TrafficCounts:(unsigned int *)a3 count:(unint64_t)a4
{
  PBRepeatedUInt32Set(&self->_rx0TrafficCounts, a3, a4);
}

- (unint64_t)rx1TrafficCountsCount
{
  return self->_rx1TrafficCounts.count;
}

- (unsigned)rx1TrafficCounts
{
  return self->_rx1TrafficCounts.list;
}

- (void)clearRx1TrafficCounts
{
  PBRepeatedUInt32Clear(&self->_rx1TrafficCounts, a2);
}

- (void)addRx1TrafficCount:(unsigned int)a3
{
  PBRepeatedUInt32Add(&self->_rx1TrafficCounts, *(_QWORD *)&a3);
}

- (unsigned)rx1TrafficCountAtIndex:(unint64_t)a3
{
  $1729E44CE8A3ADE0AA70C2F19EF2BB02 *p_rx1TrafficCounts;
  unint64_t count;
  void *v6;
  void *v7;

  p_rx1TrafficCounts = &self->_rx1TrafficCounts;
  count = self->_rx1TrafficCounts.count;
  if (count <= a3)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("idx (%tu) is out of range (%tu)"), a3, count));
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSException exceptionWithName:reason:userInfo:](NSException, "exceptionWithName:reason:userInfo:", NSRangeException, v6, 0));
    objc_msgSend(v7, "raise");

  }
  return p_rx1TrafficCounts->list[a3];
}

- (void)setRx1TrafficCounts:(unsigned int *)a3 count:(unint64_t)a4
{
  PBRepeatedUInt32Set(&self->_rx1TrafficCounts, a3, a4);
}

- (unint64_t)txTrafficCountsCount
{
  return self->_txTrafficCounts.count;
}

- (unsigned)txTrafficCounts
{
  return self->_txTrafficCounts.list;
}

- (void)clearTxTrafficCounts
{
  PBRepeatedUInt32Clear(&self->_txTrafficCounts, a2);
}

- (void)addTxTrafficCount:(unsigned int)a3
{
  PBRepeatedUInt32Add(&self->_txTrafficCounts, *(_QWORD *)&a3);
}

- (unsigned)txTrafficCountAtIndex:(unint64_t)a3
{
  $1729E44CE8A3ADE0AA70C2F19EF2BB02 *p_txTrafficCounts;
  unint64_t count;
  void *v6;
  void *v7;

  p_txTrafficCounts = &self->_txTrafficCounts;
  count = self->_txTrafficCounts.count;
  if (count <= a3)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("idx (%tu) is out of range (%tu)"), a3, count));
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSException exceptionWithName:reason:userInfo:](NSException, "exceptionWithName:reason:userInfo:", NSRangeException, v6, 0));
    objc_msgSend(v7, "raise");

  }
  return p_txTrafficCounts->list[a3];
}

- (void)setTxTrafficCounts:(unsigned int *)a3 count:(unint64_t)a4
{
  PBRepeatedUInt32Set(&self->_txTrafficCounts, a3, a4);
}

- (void)setHdrRx0IdleCountAll:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 8u;
  self->_hdrRx0IdleCountAll = a3;
}

- (void)setHasHdrRx0IdleCountAll:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 8;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFF7 | v3;
}

- (BOOL)hasHdrRx0IdleCountAll
{
  return (*(_WORD *)&self->_has >> 3) & 1;
}

- (void)setHdrRx0TrafficCountAll:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 0x10u;
  self->_hdrRx0TrafficCountAll = a3;
}

- (void)setHasHdrRx0TrafficCountAll:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 16;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFEF | v3;
}

- (BOOL)hasHdrRx0TrafficCountAll
{
  return (*(_WORD *)&self->_has >> 4) & 1;
}

- (void)setHdrRx1TrafficCountAll:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 0x20u;
  self->_hdrRx1TrafficCountAll = a3;
}

- (void)setHasHdrRx1TrafficCountAll:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 32;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFDF | v3;
}

- (BOOL)hasHdrRx1TrafficCountAll
{
  return (*(_WORD *)&self->_has >> 5) & 1;
}

- (void)setHdrTxTrafficCountAll:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 0x40u;
  self->_hdrTxTrafficCountAll = a3;
}

- (void)setHasHdrTxTrafficCountAll:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 64;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFBF | v3;
}

- (BOOL)hasHdrTxTrafficCountAll
{
  return (*(_WORD *)&self->_has >> 6) & 1;
}

- (unint64_t)hdrRx0IdleCountsCount
{
  return self->_hdrRx0IdleCounts.count;
}

- (unsigned)hdrRx0IdleCounts
{
  return self->_hdrRx0IdleCounts.list;
}

- (void)clearHdrRx0IdleCounts
{
  PBRepeatedUInt32Clear(&self->_hdrRx0IdleCounts, a2);
}

- (void)addHdrRx0IdleCount:(unsigned int)a3
{
  PBRepeatedUInt32Add(&self->_hdrRx0IdleCounts, *(_QWORD *)&a3);
}

- (unsigned)hdrRx0IdleCountAtIndex:(unint64_t)a3
{
  $1729E44CE8A3ADE0AA70C2F19EF2BB02 *p_hdrRx0IdleCounts;
  unint64_t count;
  void *v6;
  void *v7;

  p_hdrRx0IdleCounts = &self->_hdrRx0IdleCounts;
  count = self->_hdrRx0IdleCounts.count;
  if (count <= a3)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("idx (%tu) is out of range (%tu)"), a3, count));
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSException exceptionWithName:reason:userInfo:](NSException, "exceptionWithName:reason:userInfo:", NSRangeException, v6, 0));
    objc_msgSend(v7, "raise");

  }
  return p_hdrRx0IdleCounts->list[a3];
}

- (void)setHdrRx0IdleCounts:(unsigned int *)a3 count:(unint64_t)a4
{
  PBRepeatedUInt32Set(&self->_hdrRx0IdleCounts, a3, a4);
}

- (unint64_t)hdrRx0TrafficCountsCount
{
  return self->_hdrRx0TrafficCounts.count;
}

- (unsigned)hdrRx0TrafficCounts
{
  return self->_hdrRx0TrafficCounts.list;
}

- (void)clearHdrRx0TrafficCounts
{
  PBRepeatedUInt32Clear(&self->_hdrRx0TrafficCounts, a2);
}

- (void)addHdrRx0TrafficCount:(unsigned int)a3
{
  PBRepeatedUInt32Add(&self->_hdrRx0TrafficCounts, *(_QWORD *)&a3);
}

- (unsigned)hdrRx0TrafficCountAtIndex:(unint64_t)a3
{
  $1729E44CE8A3ADE0AA70C2F19EF2BB02 *p_hdrRx0TrafficCounts;
  unint64_t count;
  void *v6;
  void *v7;

  p_hdrRx0TrafficCounts = &self->_hdrRx0TrafficCounts;
  count = self->_hdrRx0TrafficCounts.count;
  if (count <= a3)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("idx (%tu) is out of range (%tu)"), a3, count));
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSException exceptionWithName:reason:userInfo:](NSException, "exceptionWithName:reason:userInfo:", NSRangeException, v6, 0));
    objc_msgSend(v7, "raise");

  }
  return p_hdrRx0TrafficCounts->list[a3];
}

- (void)setHdrRx0TrafficCounts:(unsigned int *)a3 count:(unint64_t)a4
{
  PBRepeatedUInt32Set(&self->_hdrRx0TrafficCounts, a3, a4);
}

- (unint64_t)hdrRx1TrafficCountsCount
{
  return self->_hdrRx1TrafficCounts.count;
}

- (unsigned)hdrRx1TrafficCounts
{
  return self->_hdrRx1TrafficCounts.list;
}

- (void)clearHdrRx1TrafficCounts
{
  PBRepeatedUInt32Clear(&self->_hdrRx1TrafficCounts, a2);
}

- (void)addHdrRx1TrafficCount:(unsigned int)a3
{
  PBRepeatedUInt32Add(&self->_hdrRx1TrafficCounts, *(_QWORD *)&a3);
}

- (unsigned)hdrRx1TrafficCountAtIndex:(unint64_t)a3
{
  $1729E44CE8A3ADE0AA70C2F19EF2BB02 *p_hdrRx1TrafficCounts;
  unint64_t count;
  void *v6;
  void *v7;

  p_hdrRx1TrafficCounts = &self->_hdrRx1TrafficCounts;
  count = self->_hdrRx1TrafficCounts.count;
  if (count <= a3)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("idx (%tu) is out of range (%tu)"), a3, count));
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSException exceptionWithName:reason:userInfo:](NSException, "exceptionWithName:reason:userInfo:", NSRangeException, v6, 0));
    objc_msgSend(v7, "raise");

  }
  return p_hdrRx1TrafficCounts->list[a3];
}

- (void)setHdrRx1TrafficCounts:(unsigned int *)a3 count:(unint64_t)a4
{
  PBRepeatedUInt32Set(&self->_hdrRx1TrafficCounts, a3, a4);
}

- (unint64_t)hdrTxTrafficCountsCount
{
  return self->_hdrTxTrafficCounts.count;
}

- (unsigned)hdrTxTrafficCounts
{
  return self->_hdrTxTrafficCounts.list;
}

- (void)clearHdrTxTrafficCounts
{
  PBRepeatedUInt32Clear(&self->_hdrTxTrafficCounts, a2);
}

- (void)addHdrTxTrafficCount:(unsigned int)a3
{
  PBRepeatedUInt32Add(&self->_hdrTxTrafficCounts, *(_QWORD *)&a3);
}

- (unsigned)hdrTxTrafficCountAtIndex:(unint64_t)a3
{
  $1729E44CE8A3ADE0AA70C2F19EF2BB02 *p_hdrTxTrafficCounts;
  unint64_t count;
  void *v6;
  void *v7;

  p_hdrTxTrafficCounts = &self->_hdrTxTrafficCounts;
  count = self->_hdrTxTrafficCounts.count;
  if (count <= a3)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("idx (%tu) is out of range (%tu)"), a3, count));
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSException exceptionWithName:reason:userInfo:](NSException, "exceptionWithName:reason:userInfo:", NSRangeException, v6, 0));
    objc_msgSend(v7, "raise");

  }
  return p_hdrTxTrafficCounts->list[a3];
}

- (void)setHdrTxTrafficCounts:(unsigned int *)a3 count:(unint64_t)a4
{
  PBRepeatedUInt32Set(&self->_hdrTxTrafficCounts, a3, a4);
}

- (int)band
{
  if ((*(_WORD *)&self->_has & 2) != 0)
    return self->_band;
  else
    return 0;
}

- (void)setBand:(int)a3
{
  *(_WORD *)&self->_has |= 2u;
  self->_band = a3;
}

- (void)setHasBand:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFFD | v3;
}

- (BOOL)hasBand
{
  return (*(_WORD *)&self->_has >> 1) & 1;
}

- (id)bandAsString:(int)a3
{
  __CFString *v3;

  v3 = CFSTR("SYS_BAND_BC0");
  switch(a3)
  {
    case 0:
      return v3;
    case 1:
      v3 = CFSTR("SYS_BAND_BC1");
      return v3;
    case 3:
      return CFSTR("SYS_BAND_BC3");
    case 4:
      return CFSTR("SYS_BAND_BC4");
    case 5:
      return CFSTR("SYS_BAND_BC5");
    case 6:
      return CFSTR("SYS_BAND_BC6");
    case 7:
      return CFSTR("SYS_BAND_BC7");
    case 8:
      return CFSTR("SYS_BAND_BC8");
    case 9:
      return CFSTR("SYS_BAND_BC9");
    case 10:
      return CFSTR("SYS_BAND_BC10");
    case 11:
      return CFSTR("SYS_BAND_BC11");
    case 12:
      return CFSTR("SYS_BAND_BC12");
    case 13:
      return CFSTR("SYS_BAND_BC13");
    case 14:
      return CFSTR("SYS_BAND_BC14");
    case 15:
      return CFSTR("SYS_BAND_BC15");
    case 16:
      return CFSTR("SYS_BAND_BC16");
    case 17:
      return CFSTR("SYS_BAND_BC17");
    case 18:
      return CFSTR("SYS_BAND_BC18");
    case 19:
      return CFSTR("SYS_BAND_BC19");
    case 40:
      return CFSTR("SYS_BAND_GSM_450");
    case 41:
      return CFSTR("SYS_BAND_GSM_480");
    case 42:
      return CFSTR("SYS_BAND_GSM_750");
    case 43:
      return CFSTR("SYS_BAND_GSM_850");
    case 44:
      return CFSTR("SYS_BAND_GSM_EGSM_900");
    case 45:
      return CFSTR("SYS_BAND_GSM_PGSM_900");
    case 46:
      return CFSTR("SYS_BAND_GSM_RGSM_900");
    case 47:
      return CFSTR("SYS_BAND_GSM_DCS_1800");
    case 48:
      return CFSTR("SYS_BAND_GSM_PCS_1900");
    case 80:
      return CFSTR("SYS_BAND_WCDMA_I_IMT_2000");
    case 81:
      return CFSTR("SYS_BAND_WCDMA_II_PCS_1900");
    case 82:
      return CFSTR("SYS_BAND_WCDMA_III_1700");
    case 83:
      return CFSTR("SYS_BAND_WCDMA_IV_1700");
    case 84:
      return CFSTR("SYS_BAND_WCDMA_V_850");
    case 85:
      return CFSTR("SYS_BAND_WCDMA_VI_800");
    case 86:
      return CFSTR("SYS_BAND_WCDMA_VII_2600");
    case 87:
      return CFSTR("SYS_BAND_WCDMA_VIII_900");
    case 88:
      return CFSTR("SYS_BAND_WCDMA_IX_1700");
    case 90:
      return CFSTR("SYS_BAND_WCDMA_XI_1500");
    case 91:
      return CFSTR("SYS_BAND_WCDMA_XIX_850");
    case 120:
      return CFSTR("SYS_BAND_LTE_EUTRAN_BAND1");
    case 121:
      return CFSTR("SYS_BAND_LTE_EUTRAN_BAND2");
    case 122:
      return CFSTR("SYS_BAND_LTE_EUTRAN_BAND3");
    case 123:
      return CFSTR("SYS_BAND_LTE_EUTRAN_BAND4");
    case 124:
      return CFSTR("SYS_BAND_LTE_EUTRAN_BAND5");
    case 125:
      return CFSTR("SYS_BAND_LTE_EUTRAN_BAND6");
    case 126:
      return CFSTR("SYS_BAND_LTE_EUTRAN_BAND7");
    case 127:
      return CFSTR("SYS_BAND_LTE_EUTRAN_BAND8");
    case 128:
      return CFSTR("SYS_BAND_LTE_EUTRAN_BAND9");
    case 129:
      return CFSTR("SYS_BAND_LTE_EUTRAN_BAND10");
    case 130:
      return CFSTR("SYS_BAND_LTE_EUTRAN_BAND11");
    case 131:
      return CFSTR("SYS_BAND_LTE_EUTRAN_BAND12");
    case 132:
      return CFSTR("SYS_BAND_LTE_EUTRAN_BAND13");
    case 133:
      return CFSTR("SYS_BAND_LTE_EUTRAN_BAND14");
    case 136:
      return CFSTR("SYS_BAND_LTE_EUTRAN_BAND17");
    case 137:
      return CFSTR("SYS_BAND_LTE_EUTRAN_BAND18");
    case 138:
      return CFSTR("SYS_BAND_LTE_EUTRAN_BAND19");
    case 139:
      return CFSTR("SYS_BAND_LTE_EUTRAN_BAND20");
    case 140:
      return CFSTR("SYS_BAND_LTE_EUTRAN_BAND21");
    case 143:
      return CFSTR("SYS_BAND_LTE_EUTRAN_BAND24");
    case 144:
      return CFSTR("SYS_BAND_LTE_EUTRAN_BAND25");
    case 145:
      return CFSTR("SYS_BAND_LTE_EUTRAN_BAND26");
    case 152:
      return CFSTR("SYS_BAND_LTE_EUTRAN_BAND33");
    case 153:
      return CFSTR("SYS_BAND_LTE_EUTRAN_BAND34");
    case 154:
      return CFSTR("SYS_BAND_LTE_EUTRAN_BAND35");
    case 155:
      return CFSTR("SYS_BAND_LTE_EUTRAN_BAND36");
    case 156:
      return CFSTR("SYS_BAND_LTE_EUTRAN_BAND37");
    case 157:
      return CFSTR("SYS_BAND_LTE_EUTRAN_BAND38");
    case 158:
      return CFSTR("SYS_BAND_LTE_EUTRAN_BAND39");
    case 159:
      return CFSTR("SYS_BAND_LTE_EUTRAN_BAND40");
    case 160:
      return CFSTR("SYS_BAND_LTE_EUTRAN_BAND41");
    case 161:
      return CFSTR("SYS_BAND_LTE_EUTRAN_BAND42");
    case 162:
      return CFSTR("SYS_BAND_LTE_EUTRAN_BAND43");
    case 163:
      return CFSTR("SYS_BAND_UMTS_BAND1");
    case 164:
      return CFSTR("SYS_BAND_UMTS_BAND2");
    case 165:
      return CFSTR("SYS_BAND_UMTS_BAND3");
    case 166:
      return CFSTR("SYS_BAND_UMTS_BAND4");
    case 167:
      return CFSTR("SYS_BAND_UMTS_BAND5");
    case 168:
      return CFSTR("SYS_BAND_UMTS_BAND6");
    default:
      v3 = (__CFString *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("(unknown: %i)"), *(_QWORD *)&a3));
      return v3;
  }
}

- (int)StringAsBand:(id)a3
{
  id v3;
  int v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("SYS_BAND_BC0")) & 1) != 0)
  {
    v4 = 0;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("SYS_BAND_BC1")) & 1) != 0)
  {
    v4 = 1;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("SYS_BAND_BC3")) & 1) != 0)
  {
    v4 = 3;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("SYS_BAND_BC4")) & 1) != 0)
  {
    v4 = 4;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("SYS_BAND_BC5")) & 1) != 0)
  {
    v4 = 5;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("SYS_BAND_BC6")) & 1) != 0)
  {
    v4 = 6;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("SYS_BAND_BC7")) & 1) != 0)
  {
    v4 = 7;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("SYS_BAND_BC8")) & 1) != 0)
  {
    v4 = 8;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("SYS_BAND_BC9")) & 1) != 0)
  {
    v4 = 9;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("SYS_BAND_BC10")) & 1) != 0)
  {
    v4 = 10;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("SYS_BAND_BC11")) & 1) != 0)
  {
    v4 = 11;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("SYS_BAND_BC12")) & 1) != 0)
  {
    v4 = 12;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("SYS_BAND_BC13")) & 1) != 0)
  {
    v4 = 13;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("SYS_BAND_BC14")) & 1) != 0)
  {
    v4 = 14;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("SYS_BAND_BC15")) & 1) != 0)
  {
    v4 = 15;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("SYS_BAND_BC16")) & 1) != 0)
  {
    v4 = 16;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("SYS_BAND_BC17")) & 1) != 0)
  {
    v4 = 17;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("SYS_BAND_BC18")) & 1) != 0)
  {
    v4 = 18;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("SYS_BAND_BC19")) & 1) != 0)
  {
    v4 = 19;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("SYS_BAND_GSM_450")) & 1) != 0)
  {
    v4 = 40;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("SYS_BAND_GSM_480")) & 1) != 0)
  {
    v4 = 41;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("SYS_BAND_GSM_750")) & 1) != 0)
  {
    v4 = 42;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("SYS_BAND_GSM_850")) & 1) != 0)
  {
    v4 = 43;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("SYS_BAND_GSM_EGSM_900")) & 1) != 0)
  {
    v4 = 44;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("SYS_BAND_GSM_PGSM_900")) & 1) != 0)
  {
    v4 = 45;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("SYS_BAND_GSM_RGSM_900")) & 1) != 0)
  {
    v4 = 46;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("SYS_BAND_GSM_DCS_1800")) & 1) != 0)
  {
    v4 = 47;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("SYS_BAND_GSM_PCS_1900")) & 1) != 0)
  {
    v4 = 48;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("SYS_BAND_WCDMA_I_IMT_2000")) & 1) != 0)
  {
    v4 = 80;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("SYS_BAND_WCDMA_II_PCS_1900")) & 1) != 0)
  {
    v4 = 81;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("SYS_BAND_WCDMA_III_1700")) & 1) != 0)
  {
    v4 = 82;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("SYS_BAND_WCDMA_IV_1700")) & 1) != 0)
  {
    v4 = 83;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("SYS_BAND_WCDMA_V_850")) & 1) != 0)
  {
    v4 = 84;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("SYS_BAND_WCDMA_VI_800")) & 1) != 0)
  {
    v4 = 85;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("SYS_BAND_WCDMA_VII_2600")) & 1) != 0)
  {
    v4 = 86;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("SYS_BAND_WCDMA_VIII_900")) & 1) != 0)
  {
    v4 = 87;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("SYS_BAND_WCDMA_IX_1700")) & 1) != 0)
  {
    v4 = 88;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("SYS_BAND_WCDMA_XI_1500")) & 1) != 0)
  {
    v4 = 90;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("SYS_BAND_WCDMA_XIX_850")) & 1) != 0)
  {
    v4 = 91;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("SYS_BAND_LTE_EUTRAN_BAND1")) & 1) != 0)
  {
    v4 = 120;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("SYS_BAND_LTE_EUTRAN_BAND2")) & 1) != 0)
  {
    v4 = 121;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("SYS_BAND_LTE_EUTRAN_BAND3")) & 1) != 0)
  {
    v4 = 122;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("SYS_BAND_LTE_EUTRAN_BAND4")) & 1) != 0)
  {
    v4 = 123;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("SYS_BAND_LTE_EUTRAN_BAND5")) & 1) != 0)
  {
    v4 = 124;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("SYS_BAND_LTE_EUTRAN_BAND6")) & 1) != 0)
  {
    v4 = 125;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("SYS_BAND_LTE_EUTRAN_BAND7")) & 1) != 0)
  {
    v4 = 126;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("SYS_BAND_LTE_EUTRAN_BAND8")) & 1) != 0)
  {
    v4 = 127;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("SYS_BAND_LTE_EUTRAN_BAND9")) & 1) != 0)
  {
    v4 = 128;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("SYS_BAND_LTE_EUTRAN_BAND10")) & 1) != 0)
  {
    v4 = 129;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("SYS_BAND_LTE_EUTRAN_BAND11")) & 1) != 0)
  {
    v4 = 130;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("SYS_BAND_LTE_EUTRAN_BAND12")) & 1) != 0)
  {
    v4 = 131;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("SYS_BAND_LTE_EUTRAN_BAND13")) & 1) != 0)
  {
    v4 = 132;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("SYS_BAND_LTE_EUTRAN_BAND14")) & 1) != 0)
  {
    v4 = 133;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("SYS_BAND_LTE_EUTRAN_BAND17")) & 1) != 0)
  {
    v4 = 136;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("SYS_BAND_LTE_EUTRAN_BAND18")) & 1) != 0)
  {
    v4 = 137;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("SYS_BAND_LTE_EUTRAN_BAND19")) & 1) != 0)
  {
    v4 = 138;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("SYS_BAND_LTE_EUTRAN_BAND20")) & 1) != 0)
  {
    v4 = 139;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("SYS_BAND_LTE_EUTRAN_BAND21")) & 1) != 0)
  {
    v4 = 140;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("SYS_BAND_LTE_EUTRAN_BAND24")) & 1) != 0)
  {
    v4 = 143;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("SYS_BAND_LTE_EUTRAN_BAND25")) & 1) != 0)
  {
    v4 = 144;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("SYS_BAND_LTE_EUTRAN_BAND26")) & 1) != 0)
  {
    v4 = 145;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("SYS_BAND_LTE_EUTRAN_BAND33")) & 1) != 0)
  {
    v4 = 152;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("SYS_BAND_LTE_EUTRAN_BAND34")) & 1) != 0)
  {
    v4 = 153;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("SYS_BAND_LTE_EUTRAN_BAND35")) & 1) != 0)
  {
    v4 = 154;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("SYS_BAND_LTE_EUTRAN_BAND36")) & 1) != 0)
  {
    v4 = 155;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("SYS_BAND_LTE_EUTRAN_BAND37")) & 1) != 0)
  {
    v4 = 156;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("SYS_BAND_LTE_EUTRAN_BAND38")) & 1) != 0)
  {
    v4 = 157;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("SYS_BAND_LTE_EUTRAN_BAND39")) & 1) != 0)
  {
    v4 = 158;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("SYS_BAND_LTE_EUTRAN_BAND40")) & 1) != 0)
  {
    v4 = 159;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("SYS_BAND_LTE_EUTRAN_BAND41")) & 1) != 0)
  {
    v4 = 160;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("SYS_BAND_LTE_EUTRAN_BAND42")) & 1) != 0)
  {
    v4 = 161;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("SYS_BAND_LTE_EUTRAN_BAND43")) & 1) != 0)
  {
    v4 = 162;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("SYS_BAND_UMTS_BAND1")) & 1) != 0)
  {
    v4 = 163;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("SYS_BAND_UMTS_BAND2")) & 1) != 0)
  {
    v4 = 164;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("SYS_BAND_UMTS_BAND3")) & 1) != 0)
  {
    v4 = 165;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("SYS_BAND_UMTS_BAND4")) & 1) != 0)
  {
    v4 = 166;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("SYS_BAND_UMTS_BAND5")) & 1) != 0)
  {
    v4 = 167;
  }
  else if (objc_msgSend(v3, "isEqualToString:", CFSTR("SYS_BAND_UMTS_BAND6")))
  {
    v4 = 168;
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (id)description
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)CellularCdmaTxRxHist;
  v3 = -[CellularCdmaTxRxHist description](&v8, "description");
  v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[CellularCdmaTxRxHist dictionaryRepresentation](self, "dictionaryRepresentation"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@ %@"), v4, v5));

  return v6;
}

- (id)dictionaryRepresentation
{
  void *v3;
  __int16 has;
  void *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  void *v13;
  __int16 v14;
  void *v15;
  uint64_t v16;
  void *v17;
  uint64_t v18;
  void *v19;
  uint64_t v20;
  void *v21;
  uint64_t v22;
  void *v23;
  uint64_t band;
  __CFString *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary"));
  has = (__int16)self->_has;
  if ((has & 1) != 0)
  {
    v26 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedLongLong:](NSNumber, "numberWithUnsignedLongLong:", self->_timestamp));
    objc_msgSend(v3, "setObject:forKey:", v26, CFSTR("timestamp"));

    has = (__int16)self->_has;
    if ((has & 4) == 0)
    {
LABEL_3:
      if ((has & 0x80) == 0)
        goto LABEL_4;
      goto LABEL_18;
    }
  }
  else if ((has & 4) == 0)
  {
    goto LABEL_3;
  }
  v27 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", self->_duration));
  objc_msgSend(v3, "setObject:forKey:", v27, CFSTR("duration"));

  has = (__int16)self->_has;
  if ((has & 0x80) == 0)
  {
LABEL_4:
    if ((has & 0x100) == 0)
      goto LABEL_5;
    goto LABEL_19;
  }
LABEL_18:
  v28 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", self->_rx0IdleCountAll));
  objc_msgSend(v3, "setObject:forKey:", v28, CFSTR("rx0_idle_count_all"));

  has = (__int16)self->_has;
  if ((has & 0x100) == 0)
  {
LABEL_5:
    if ((has & 0x200) == 0)
      goto LABEL_6;
    goto LABEL_20;
  }
LABEL_19:
  v29 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", self->_rx0TrafficCountAll));
  objc_msgSend(v3, "setObject:forKey:", v29, CFSTR("rx0_traffic_count_all"));

  has = (__int16)self->_has;
  if ((has & 0x200) == 0)
  {
LABEL_6:
    if ((has & 0x400) == 0)
      goto LABEL_8;
    goto LABEL_7;
  }
LABEL_20:
  v30 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", self->_rx1TrafficCountAll));
  objc_msgSend(v3, "setObject:forKey:", v30, CFSTR("rx1_traffic_count_all"));

  if ((*(_WORD *)&self->_has & 0x400) != 0)
  {
LABEL_7:
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", self->_txTrafficCountAll));
    objc_msgSend(v3, "setObject:forKey:", v5, CFSTR("tx_traffic_count_all"));

  }
LABEL_8:
  v6 = PBRepeatedUInt32NSArray(&self->_rx0IdleCounts);
  v7 = (void *)objc_claimAutoreleasedReturnValue(v6);
  objc_msgSend(v3, "setObject:forKey:", v7, CFSTR("rx0_idle_count"));

  v8 = PBRepeatedUInt32NSArray(&self->_rx0TrafficCounts);
  v9 = (void *)objc_claimAutoreleasedReturnValue(v8);
  objc_msgSend(v3, "setObject:forKey:", v9, CFSTR("rx0_traffic_count"));

  v10 = PBRepeatedUInt32NSArray(&self->_rx1TrafficCounts);
  v11 = (void *)objc_claimAutoreleasedReturnValue(v10);
  objc_msgSend(v3, "setObject:forKey:", v11, CFSTR("rx1_traffic_count"));

  v12 = PBRepeatedUInt32NSArray(&self->_txTrafficCounts);
  v13 = (void *)objc_claimAutoreleasedReturnValue(v12);
  objc_msgSend(v3, "setObject:forKey:", v13, CFSTR("tx_traffic_count"));

  v14 = (__int16)self->_has;
  if ((v14 & 8) != 0)
  {
    v31 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", self->_hdrRx0IdleCountAll));
    objc_msgSend(v3, "setObject:forKey:", v31, CFSTR("hdr_rx0_idle_count_all"));

    v14 = (__int16)self->_has;
    if ((v14 & 0x10) == 0)
    {
LABEL_10:
      if ((v14 & 0x20) == 0)
        goto LABEL_11;
      goto LABEL_24;
    }
  }
  else if ((v14 & 0x10) == 0)
  {
    goto LABEL_10;
  }
  v32 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", self->_hdrRx0TrafficCountAll));
  objc_msgSend(v3, "setObject:forKey:", v32, CFSTR("hdr_rx0_traffic_count_all"));

  v14 = (__int16)self->_has;
  if ((v14 & 0x20) == 0)
  {
LABEL_11:
    if ((v14 & 0x40) == 0)
      goto LABEL_13;
    goto LABEL_12;
  }
LABEL_24:
  v33 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", self->_hdrRx1TrafficCountAll));
  objc_msgSend(v3, "setObject:forKey:", v33, CFSTR("hdr_rx1_traffic_count_all"));

  if ((*(_WORD *)&self->_has & 0x40) != 0)
  {
LABEL_12:
    v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", self->_hdrTxTrafficCountAll));
    objc_msgSend(v3, "setObject:forKey:", v15, CFSTR("hdr_tx_traffic_count_all"));

  }
LABEL_13:
  v16 = PBRepeatedUInt32NSArray(&self->_hdrRx0IdleCounts);
  v17 = (void *)objc_claimAutoreleasedReturnValue(v16);
  objc_msgSend(v3, "setObject:forKey:", v17, CFSTR("hdr_rx0_idle_count"));

  v18 = PBRepeatedUInt32NSArray(&self->_hdrRx0TrafficCounts);
  v19 = (void *)objc_claimAutoreleasedReturnValue(v18);
  objc_msgSend(v3, "setObject:forKey:", v19, CFSTR("hdr_rx0_traffic_count"));

  v20 = PBRepeatedUInt32NSArray(&self->_hdrRx1TrafficCounts);
  v21 = (void *)objc_claimAutoreleasedReturnValue(v20);
  objc_msgSend(v3, "setObject:forKey:", v21, CFSTR("hdr_rx1_traffic_count"));

  v22 = PBRepeatedUInt32NSArray(&self->_hdrTxTrafficCounts);
  v23 = (void *)objc_claimAutoreleasedReturnValue(v22);
  objc_msgSend(v3, "setObject:forKey:", v23, CFSTR("hdr_tx_traffic_count"));

  if ((*(_WORD *)&self->_has & 2) != 0)
  {
    band = self->_band;
    v25 = CFSTR("SYS_BAND_BC0");
    switch((int)band)
    {
      case 0:
        break;
      case 1:
        v25 = CFSTR("SYS_BAND_BC1");
        break;
      case 3:
        v25 = CFSTR("SYS_BAND_BC3");
        break;
      case 4:
        v25 = CFSTR("SYS_BAND_BC4");
        break;
      case 5:
        v25 = CFSTR("SYS_BAND_BC5");
        break;
      case 6:
        v25 = CFSTR("SYS_BAND_BC6");
        break;
      case 7:
        v25 = CFSTR("SYS_BAND_BC7");
        break;
      case 8:
        v25 = CFSTR("SYS_BAND_BC8");
        break;
      case 9:
        v25 = CFSTR("SYS_BAND_BC9");
        break;
      case 10:
        v25 = CFSTR("SYS_BAND_BC10");
        break;
      case 11:
        v25 = CFSTR("SYS_BAND_BC11");
        break;
      case 12:
        v25 = CFSTR("SYS_BAND_BC12");
        break;
      case 13:
        v25 = CFSTR("SYS_BAND_BC13");
        break;
      case 14:
        v25 = CFSTR("SYS_BAND_BC14");
        break;
      case 15:
        v25 = CFSTR("SYS_BAND_BC15");
        break;
      case 16:
        v25 = CFSTR("SYS_BAND_BC16");
        break;
      case 17:
        v25 = CFSTR("SYS_BAND_BC17");
        break;
      case 18:
        v25 = CFSTR("SYS_BAND_BC18");
        break;
      case 19:
        v25 = CFSTR("SYS_BAND_BC19");
        break;
      case 40:
        v25 = CFSTR("SYS_BAND_GSM_450");
        break;
      case 41:
        v25 = CFSTR("SYS_BAND_GSM_480");
        break;
      case 42:
        v25 = CFSTR("SYS_BAND_GSM_750");
        break;
      case 43:
        v25 = CFSTR("SYS_BAND_GSM_850");
        break;
      case 44:
        v25 = CFSTR("SYS_BAND_GSM_EGSM_900");
        break;
      case 45:
        v25 = CFSTR("SYS_BAND_GSM_PGSM_900");
        break;
      case 46:
        v25 = CFSTR("SYS_BAND_GSM_RGSM_900");
        break;
      case 47:
        v25 = CFSTR("SYS_BAND_GSM_DCS_1800");
        break;
      case 48:
        v25 = CFSTR("SYS_BAND_GSM_PCS_1900");
        break;
      case 80:
        v25 = CFSTR("SYS_BAND_WCDMA_I_IMT_2000");
        break;
      case 81:
        v25 = CFSTR("SYS_BAND_WCDMA_II_PCS_1900");
        break;
      case 82:
        v25 = CFSTR("SYS_BAND_WCDMA_III_1700");
        break;
      case 83:
        v25 = CFSTR("SYS_BAND_WCDMA_IV_1700");
        break;
      case 84:
        v25 = CFSTR("SYS_BAND_WCDMA_V_850");
        break;
      case 85:
        v25 = CFSTR("SYS_BAND_WCDMA_VI_800");
        break;
      case 86:
        v25 = CFSTR("SYS_BAND_WCDMA_VII_2600");
        break;
      case 87:
        v25 = CFSTR("SYS_BAND_WCDMA_VIII_900");
        break;
      case 88:
        v25 = CFSTR("SYS_BAND_WCDMA_IX_1700");
        break;
      case 90:
        v25 = CFSTR("SYS_BAND_WCDMA_XI_1500");
        break;
      case 91:
        v25 = CFSTR("SYS_BAND_WCDMA_XIX_850");
        break;
      case 120:
        v25 = CFSTR("SYS_BAND_LTE_EUTRAN_BAND1");
        break;
      case 121:
        v25 = CFSTR("SYS_BAND_LTE_EUTRAN_BAND2");
        break;
      case 122:
        v25 = CFSTR("SYS_BAND_LTE_EUTRAN_BAND3");
        break;
      case 123:
        v25 = CFSTR("SYS_BAND_LTE_EUTRAN_BAND4");
        break;
      case 124:
        v25 = CFSTR("SYS_BAND_LTE_EUTRAN_BAND5");
        break;
      case 125:
        v25 = CFSTR("SYS_BAND_LTE_EUTRAN_BAND6");
        break;
      case 126:
        v25 = CFSTR("SYS_BAND_LTE_EUTRAN_BAND7");
        break;
      case 127:
        v25 = CFSTR("SYS_BAND_LTE_EUTRAN_BAND8");
        break;
      case 128:
        v25 = CFSTR("SYS_BAND_LTE_EUTRAN_BAND9");
        break;
      case 129:
        v25 = CFSTR("SYS_BAND_LTE_EUTRAN_BAND10");
        break;
      case 130:
        v25 = CFSTR("SYS_BAND_LTE_EUTRAN_BAND11");
        break;
      case 131:
        v25 = CFSTR("SYS_BAND_LTE_EUTRAN_BAND12");
        break;
      case 132:
        v25 = CFSTR("SYS_BAND_LTE_EUTRAN_BAND13");
        break;
      case 133:
        v25 = CFSTR("SYS_BAND_LTE_EUTRAN_BAND14");
        break;
      case 136:
        v25 = CFSTR("SYS_BAND_LTE_EUTRAN_BAND17");
        break;
      case 137:
        v25 = CFSTR("SYS_BAND_LTE_EUTRAN_BAND18");
        break;
      case 138:
        v25 = CFSTR("SYS_BAND_LTE_EUTRAN_BAND19");
        break;
      case 139:
        v25 = CFSTR("SYS_BAND_LTE_EUTRAN_BAND20");
        break;
      case 140:
        v25 = CFSTR("SYS_BAND_LTE_EUTRAN_BAND21");
        break;
      case 143:
        v25 = CFSTR("SYS_BAND_LTE_EUTRAN_BAND24");
        break;
      case 144:
        v25 = CFSTR("SYS_BAND_LTE_EUTRAN_BAND25");
        break;
      case 145:
        v25 = CFSTR("SYS_BAND_LTE_EUTRAN_BAND26");
        break;
      case 152:
        v25 = CFSTR("SYS_BAND_LTE_EUTRAN_BAND33");
        break;
      case 153:
        v25 = CFSTR("SYS_BAND_LTE_EUTRAN_BAND34");
        break;
      case 154:
        v25 = CFSTR("SYS_BAND_LTE_EUTRAN_BAND35");
        break;
      case 155:
        v25 = CFSTR("SYS_BAND_LTE_EUTRAN_BAND36");
        break;
      case 156:
        v25 = CFSTR("SYS_BAND_LTE_EUTRAN_BAND37");
        break;
      case 157:
        v25 = CFSTR("SYS_BAND_LTE_EUTRAN_BAND38");
        break;
      case 158:
        v25 = CFSTR("SYS_BAND_LTE_EUTRAN_BAND39");
        break;
      case 159:
        v25 = CFSTR("SYS_BAND_LTE_EUTRAN_BAND40");
        break;
      case 160:
        v25 = CFSTR("SYS_BAND_LTE_EUTRAN_BAND41");
        break;
      case 161:
        v25 = CFSTR("SYS_BAND_LTE_EUTRAN_BAND42");
        break;
      case 162:
        v25 = CFSTR("SYS_BAND_LTE_EUTRAN_BAND43");
        break;
      case 163:
        v25 = CFSTR("SYS_BAND_UMTS_BAND1");
        break;
      case 164:
        v25 = CFSTR("SYS_BAND_UMTS_BAND2");
        break;
      case 165:
        v25 = CFSTR("SYS_BAND_UMTS_BAND3");
        break;
      case 166:
        v25 = CFSTR("SYS_BAND_UMTS_BAND4");
        break;
      case 167:
        v25 = CFSTR("SYS_BAND_UMTS_BAND5");
        break;
      case 168:
        v25 = CFSTR("SYS_BAND_UMTS_BAND6");
        break;
      default:
        v25 = (__CFString *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("(unknown: %i)"), band));
        break;
    }
    objc_msgSend(v3, "setObject:forKey:", v25, CFSTR("band"));

  }
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return sub_1000512CC((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4;
  void *v5;
  __int16 has;
  unint64_t v7;
  unint64_t v8;
  unint64_t v9;
  unint64_t v10;
  __int16 v11;
  unint64_t v12;
  unint64_t v13;
  unint64_t v14;
  unint64_t v15;
  uint64_t v16;

  v4 = a3;
  v5 = v4;
  has = (__int16)self->_has;
  if ((has & 1) != 0)
  {
    PBDataWriterWriteUint64Field(v4, self->_timestamp, 1);
    has = (__int16)self->_has;
    if ((has & 4) == 0)
    {
LABEL_3:
      if ((has & 0x80) == 0)
        goto LABEL_4;
      goto LABEL_58;
    }
  }
  else if ((has & 4) == 0)
  {
    goto LABEL_3;
  }
  PBDataWriterWriteUint32Field(v5, self->_duration, 2);
  has = (__int16)self->_has;
  if ((has & 0x80) == 0)
  {
LABEL_4:
    if ((has & 0x100) == 0)
      goto LABEL_5;
    goto LABEL_59;
  }
LABEL_58:
  PBDataWriterWriteUint32Field(v5, self->_rx0IdleCountAll, 3);
  has = (__int16)self->_has;
  if ((has & 0x100) == 0)
  {
LABEL_5:
    if ((has & 0x200) == 0)
      goto LABEL_6;
    goto LABEL_60;
  }
LABEL_59:
  PBDataWriterWriteUint32Field(v5, self->_rx0TrafficCountAll, 4);
  has = (__int16)self->_has;
  if ((has & 0x200) == 0)
  {
LABEL_6:
    if ((has & 0x400) == 0)
      goto LABEL_8;
    goto LABEL_7;
  }
LABEL_60:
  PBDataWriterWriteUint32Field(v5, self->_rx1TrafficCountAll, 5);
  if ((*(_WORD *)&self->_has & 0x400) != 0)
LABEL_7:
    PBDataWriterWriteUint32Field(v5, self->_txTrafficCountAll, 6);
LABEL_8:
  if (self->_rx0IdleCounts.count)
  {
    v16 = 0;
    PBDataWriterPlaceMark(v5, &v16, 7);
    if (self->_rx0IdleCounts.count)
    {
      v7 = 0;
      do
        PBDataWriterWriteUint32Field(v5, self->_rx0IdleCounts.list[v7++], 0xFFFFFFFFLL);
      while (v7 < self->_rx0IdleCounts.count);
    }
    PBDataWriterRecallMark(v5, &v16);
  }
  if (self->_rx0TrafficCounts.count)
  {
    v16 = 0;
    PBDataWriterPlaceMark(v5, &v16, 8);
    if (self->_rx0TrafficCounts.count)
    {
      v8 = 0;
      do
        PBDataWriterWriteUint32Field(v5, self->_rx0TrafficCounts.list[v8++], 0xFFFFFFFFLL);
      while (v8 < self->_rx0TrafficCounts.count);
    }
    PBDataWriterRecallMark(v5, &v16);
  }
  if (self->_rx1TrafficCounts.count)
  {
    v16 = 0;
    PBDataWriterPlaceMark(v5, &v16, 9);
    if (self->_rx1TrafficCounts.count)
    {
      v9 = 0;
      do
        PBDataWriterWriteUint32Field(v5, self->_rx1TrafficCounts.list[v9++], 0xFFFFFFFFLL);
      while (v9 < self->_rx1TrafficCounts.count);
    }
    PBDataWriterRecallMark(v5, &v16);
  }
  if (self->_txTrafficCounts.count)
  {
    v16 = 0;
    PBDataWriterPlaceMark(v5, &v16, 10);
    if (self->_txTrafficCounts.count)
    {
      v10 = 0;
      do
        PBDataWriterWriteUint32Field(v5, self->_txTrafficCounts.list[v10++], 0xFFFFFFFFLL);
      while (v10 < self->_txTrafficCounts.count);
    }
    PBDataWriterRecallMark(v5, &v16);
  }
  v11 = (__int16)self->_has;
  if ((v11 & 8) != 0)
  {
    PBDataWriterWriteUint32Field(v5, self->_hdrRx0IdleCountAll, 13);
    v11 = (__int16)self->_has;
    if ((v11 & 0x10) == 0)
    {
LABEL_30:
      if ((v11 & 0x20) == 0)
        goto LABEL_31;
      goto LABEL_64;
    }
  }
  else if ((v11 & 0x10) == 0)
  {
    goto LABEL_30;
  }
  PBDataWriterWriteUint32Field(v5, self->_hdrRx0TrafficCountAll, 14);
  v11 = (__int16)self->_has;
  if ((v11 & 0x20) == 0)
  {
LABEL_31:
    if ((v11 & 0x40) == 0)
      goto LABEL_33;
    goto LABEL_32;
  }
LABEL_64:
  PBDataWriterWriteUint32Field(v5, self->_hdrRx1TrafficCountAll, 15);
  if ((*(_WORD *)&self->_has & 0x40) != 0)
LABEL_32:
    PBDataWriterWriteUint32Field(v5, self->_hdrTxTrafficCountAll, 16);
LABEL_33:
  if (self->_hdrRx0IdleCounts.count)
  {
    v16 = 0;
    PBDataWriterPlaceMark(v5, &v16, 17);
    if (self->_hdrRx0IdleCounts.count)
    {
      v12 = 0;
      do
        PBDataWriterWriteUint32Field(v5, self->_hdrRx0IdleCounts.list[v12++], 0xFFFFFFFFLL);
      while (v12 < self->_hdrRx0IdleCounts.count);
    }
    PBDataWriterRecallMark(v5, &v16);
  }
  if (self->_hdrRx0TrafficCounts.count)
  {
    v16 = 0;
    PBDataWriterPlaceMark(v5, &v16, 18);
    if (self->_hdrRx0TrafficCounts.count)
    {
      v13 = 0;
      do
        PBDataWriterWriteUint32Field(v5, self->_hdrRx0TrafficCounts.list[v13++], 0xFFFFFFFFLL);
      while (v13 < self->_hdrRx0TrafficCounts.count);
    }
    PBDataWriterRecallMark(v5, &v16);
  }
  if (self->_hdrRx1TrafficCounts.count)
  {
    v16 = 0;
    PBDataWriterPlaceMark(v5, &v16, 19);
    if (self->_hdrRx1TrafficCounts.count)
    {
      v14 = 0;
      do
        PBDataWriterWriteUint32Field(v5, self->_hdrRx1TrafficCounts.list[v14++], 0xFFFFFFFFLL);
      while (v14 < self->_hdrRx1TrafficCounts.count);
    }
    PBDataWriterRecallMark(v5, &v16);
  }
  if (self->_hdrTxTrafficCounts.count)
  {
    v16 = 0;
    PBDataWriterPlaceMark(v5, &v16, 20);
    if (self->_hdrTxTrafficCounts.count)
    {
      v15 = 0;
      do
        PBDataWriterWriteUint32Field(v5, self->_hdrTxTrafficCounts.list[v15++], 0xFFFFFFFFLL);
      while (v15 < self->_hdrTxTrafficCounts.count);
    }
    PBDataWriterRecallMark(v5, &v16);
  }
  if ((*(_WORD *)&self->_has & 2) != 0)
    PBDataWriterWriteInt32Field(v5, self->_band, 25);

}

- (void)copyTo:(id)a3
{
  _QWORD *v4;
  __int16 has;
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
  __int16 v18;
  unint64_t v19;
  unint64_t v20;
  uint64_t n;
  unint64_t v22;
  unint64_t v23;
  uint64_t ii;
  unint64_t v25;
  unint64_t v26;
  uint64_t jj;
  unint64_t v28;
  unint64_t v29;
  uint64_t kk;
  id v31;

  v4 = a3;
  has = (__int16)self->_has;
  if ((has & 1) != 0)
  {
    v4[25] = self->_timestamp;
    *((_WORD *)v4 + 124) |= 1u;
    has = (__int16)self->_has;
    if ((has & 4) == 0)
    {
LABEL_3:
      if ((has & 0x80) == 0)
        goto LABEL_4;
      goto LABEL_50;
    }
  }
  else if ((has & 4) == 0)
  {
    goto LABEL_3;
  }
  *((_DWORD *)v4 + 53) = self->_duration;
  *((_WORD *)v4 + 124) |= 4u;
  has = (__int16)self->_has;
  if ((has & 0x80) == 0)
  {
LABEL_4:
    if ((has & 0x100) == 0)
      goto LABEL_5;
    goto LABEL_51;
  }
LABEL_50:
  *((_DWORD *)v4 + 58) = self->_rx0IdleCountAll;
  *((_WORD *)v4 + 124) |= 0x80u;
  has = (__int16)self->_has;
  if ((has & 0x100) == 0)
  {
LABEL_5:
    if ((has & 0x200) == 0)
      goto LABEL_6;
LABEL_52:
    *((_DWORD *)v4 + 60) = self->_rx1TrafficCountAll;
    *((_WORD *)v4 + 124) |= 0x200u;
    if ((*(_WORD *)&self->_has & 0x400) == 0)
      goto LABEL_8;
    goto LABEL_7;
  }
LABEL_51:
  *((_DWORD *)v4 + 59) = self->_rx0TrafficCountAll;
  *((_WORD *)v4 + 124) |= 0x100u;
  has = (__int16)self->_has;
  if ((has & 0x200) != 0)
    goto LABEL_52;
LABEL_6:
  if ((has & 0x400) != 0)
  {
LABEL_7:
    *((_DWORD *)v4 + 61) = self->_txTrafficCountAll;
    *((_WORD *)v4 + 124) |= 0x400u;
  }
LABEL_8:
  v31 = v4;
  if (-[CellularCdmaTxRxHist rx0IdleCountsCount](self, "rx0IdleCountsCount"))
  {
    objc_msgSend(v31, "clearRx0IdleCounts");
    v6 = -[CellularCdmaTxRxHist rx0IdleCountsCount](self, "rx0IdleCountsCount");
    if (v6)
    {
      v7 = v6;
      for (i = 0; i != v7; ++i)
        objc_msgSend(v31, "addRx0IdleCount:", -[CellularCdmaTxRxHist rx0IdleCountAtIndex:](self, "rx0IdleCountAtIndex:", i));
    }
  }
  if (-[CellularCdmaTxRxHist rx0TrafficCountsCount](self, "rx0TrafficCountsCount"))
  {
    objc_msgSend(v31, "clearRx0TrafficCounts");
    v9 = -[CellularCdmaTxRxHist rx0TrafficCountsCount](self, "rx0TrafficCountsCount");
    if (v9)
    {
      v10 = v9;
      for (j = 0; j != v10; ++j)
        objc_msgSend(v31, "addRx0TrafficCount:", -[CellularCdmaTxRxHist rx0TrafficCountAtIndex:](self, "rx0TrafficCountAtIndex:", j));
    }
  }
  if (-[CellularCdmaTxRxHist rx1TrafficCountsCount](self, "rx1TrafficCountsCount"))
  {
    objc_msgSend(v31, "clearRx1TrafficCounts");
    v12 = -[CellularCdmaTxRxHist rx1TrafficCountsCount](self, "rx1TrafficCountsCount");
    if (v12)
    {
      v13 = v12;
      for (k = 0; k != v13; ++k)
        objc_msgSend(v31, "addRx1TrafficCount:", -[CellularCdmaTxRxHist rx1TrafficCountAtIndex:](self, "rx1TrafficCountAtIndex:", k));
    }
  }
  if (-[CellularCdmaTxRxHist txTrafficCountsCount](self, "txTrafficCountsCount"))
  {
    objc_msgSend(v31, "clearTxTrafficCounts");
    v15 = -[CellularCdmaTxRxHist txTrafficCountsCount](self, "txTrafficCountsCount");
    if (v15)
    {
      v16 = v15;
      for (m = 0; m != v16; ++m)
        objc_msgSend(v31, "addTxTrafficCount:", -[CellularCdmaTxRxHist txTrafficCountAtIndex:](self, "txTrafficCountAtIndex:", m));
    }
  }
  v18 = (__int16)self->_has;
  if ((v18 & 8) != 0)
  {
    *((_DWORD *)v31 + 54) = self->_hdrRx0IdleCountAll;
    *((_WORD *)v31 + 124) |= 8u;
    v18 = (__int16)self->_has;
    if ((v18 & 0x10) == 0)
    {
LABEL_26:
      if ((v18 & 0x20) == 0)
        goto LABEL_27;
LABEL_56:
      *((_DWORD *)v31 + 56) = self->_hdrRx1TrafficCountAll;
      *((_WORD *)v31 + 124) |= 0x20u;
      if ((*(_WORD *)&self->_has & 0x40) == 0)
        goto LABEL_29;
      goto LABEL_28;
    }
  }
  else if ((v18 & 0x10) == 0)
  {
    goto LABEL_26;
  }
  *((_DWORD *)v31 + 55) = self->_hdrRx0TrafficCountAll;
  *((_WORD *)v31 + 124) |= 0x10u;
  v18 = (__int16)self->_has;
  if ((v18 & 0x20) != 0)
    goto LABEL_56;
LABEL_27:
  if ((v18 & 0x40) != 0)
  {
LABEL_28:
    *((_DWORD *)v31 + 57) = self->_hdrTxTrafficCountAll;
    *((_WORD *)v31 + 124) |= 0x40u;
  }
LABEL_29:
  if (-[CellularCdmaTxRxHist hdrRx0IdleCountsCount](self, "hdrRx0IdleCountsCount"))
  {
    objc_msgSend(v31, "clearHdrRx0IdleCounts");
    v19 = -[CellularCdmaTxRxHist hdrRx0IdleCountsCount](self, "hdrRx0IdleCountsCount");
    if (v19)
    {
      v20 = v19;
      for (n = 0; n != v20; ++n)
        objc_msgSend(v31, "addHdrRx0IdleCount:", -[CellularCdmaTxRxHist hdrRx0IdleCountAtIndex:](self, "hdrRx0IdleCountAtIndex:", n));
    }
  }
  if (-[CellularCdmaTxRxHist hdrRx0TrafficCountsCount](self, "hdrRx0TrafficCountsCount"))
  {
    objc_msgSend(v31, "clearHdrRx0TrafficCounts");
    v22 = -[CellularCdmaTxRxHist hdrRx0TrafficCountsCount](self, "hdrRx0TrafficCountsCount");
    if (v22)
    {
      v23 = v22;
      for (ii = 0; ii != v23; ++ii)
        objc_msgSend(v31, "addHdrRx0TrafficCount:", -[CellularCdmaTxRxHist hdrRx0TrafficCountAtIndex:](self, "hdrRx0TrafficCountAtIndex:", ii));
    }
  }
  if (-[CellularCdmaTxRxHist hdrRx1TrafficCountsCount](self, "hdrRx1TrafficCountsCount"))
  {
    objc_msgSend(v31, "clearHdrRx1TrafficCounts");
    v25 = -[CellularCdmaTxRxHist hdrRx1TrafficCountsCount](self, "hdrRx1TrafficCountsCount");
    if (v25)
    {
      v26 = v25;
      for (jj = 0; jj != v26; ++jj)
        objc_msgSend(v31, "addHdrRx1TrafficCount:", -[CellularCdmaTxRxHist hdrRx1TrafficCountAtIndex:](self, "hdrRx1TrafficCountAtIndex:", jj));
    }
  }
  if (-[CellularCdmaTxRxHist hdrTxTrafficCountsCount](self, "hdrTxTrafficCountsCount"))
  {
    objc_msgSend(v31, "clearHdrTxTrafficCounts");
    v28 = -[CellularCdmaTxRxHist hdrTxTrafficCountsCount](self, "hdrTxTrafficCountsCount");
    if (v28)
    {
      v29 = v28;
      for (kk = 0; kk != v29; ++kk)
        objc_msgSend(v31, "addHdrTxTrafficCount:", -[CellularCdmaTxRxHist hdrTxTrafficCountAtIndex:](self, "hdrTxTrafficCountAtIndex:", kk));
    }
  }
  if ((*(_WORD *)&self->_has & 2) != 0)
  {
    *((_DWORD *)v31 + 52) = self->_band;
    *((_WORD *)v31 + 124) |= 2u;
  }

}

- (id)copyWithZone:(_NSZone *)a3
{
  _QWORD *v4;
  _DWORD *v5;
  __int16 has;
  __int16 v7;

  v4 = objc_msgSend(objc_msgSend((id)objc_opt_class(self, a2), "allocWithZone:", a3), "init");
  v5 = v4;
  has = (__int16)self->_has;
  if ((has & 1) != 0)
  {
    v4[25] = self->_timestamp;
    *((_WORD *)v4 + 124) |= 1u;
    has = (__int16)self->_has;
    if ((has & 4) == 0)
    {
LABEL_3:
      if ((has & 0x80) == 0)
        goto LABEL_4;
      goto LABEL_18;
    }
  }
  else if ((has & 4) == 0)
  {
    goto LABEL_3;
  }
  *((_DWORD *)v4 + 53) = self->_duration;
  *((_WORD *)v4 + 124) |= 4u;
  has = (__int16)self->_has;
  if ((has & 0x80) == 0)
  {
LABEL_4:
    if ((has & 0x100) == 0)
      goto LABEL_5;
    goto LABEL_19;
  }
LABEL_18:
  *((_DWORD *)v4 + 58) = self->_rx0IdleCountAll;
  *((_WORD *)v4 + 124) |= 0x80u;
  has = (__int16)self->_has;
  if ((has & 0x100) == 0)
  {
LABEL_5:
    if ((has & 0x200) == 0)
      goto LABEL_6;
    goto LABEL_20;
  }
LABEL_19:
  *((_DWORD *)v4 + 59) = self->_rx0TrafficCountAll;
  *((_WORD *)v4 + 124) |= 0x100u;
  has = (__int16)self->_has;
  if ((has & 0x200) == 0)
  {
LABEL_6:
    if ((has & 0x400) == 0)
      goto LABEL_8;
    goto LABEL_7;
  }
LABEL_20:
  *((_DWORD *)v4 + 60) = self->_rx1TrafficCountAll;
  *((_WORD *)v4 + 124) |= 0x200u;
  if ((*(_WORD *)&self->_has & 0x400) != 0)
  {
LABEL_7:
    *((_DWORD *)v4 + 61) = self->_txTrafficCountAll;
    *((_WORD *)v4 + 124) |= 0x400u;
  }
LABEL_8:
  PBRepeatedUInt32Copy(v4 + 13, &self->_rx0IdleCounts);
  PBRepeatedUInt32Copy(v5 + 32, &self->_rx0TrafficCounts);
  PBRepeatedUInt32Copy(v5 + 38, &self->_rx1TrafficCounts);
  PBRepeatedUInt32Copy(v5 + 44, &self->_txTrafficCounts);
  v7 = (__int16)self->_has;
  if ((v7 & 8) != 0)
  {
    v5[54] = self->_hdrRx0IdleCountAll;
    *((_WORD *)v5 + 124) |= 8u;
    v7 = (__int16)self->_has;
    if ((v7 & 0x10) == 0)
    {
LABEL_10:
      if ((v7 & 0x20) == 0)
        goto LABEL_11;
      goto LABEL_24;
    }
  }
  else if ((v7 & 0x10) == 0)
  {
    goto LABEL_10;
  }
  v5[55] = self->_hdrRx0TrafficCountAll;
  *((_WORD *)v5 + 124) |= 0x10u;
  v7 = (__int16)self->_has;
  if ((v7 & 0x20) == 0)
  {
LABEL_11:
    if ((v7 & 0x40) == 0)
      goto LABEL_13;
    goto LABEL_12;
  }
LABEL_24:
  v5[56] = self->_hdrRx1TrafficCountAll;
  *((_WORD *)v5 + 124) |= 0x20u;
  if ((*(_WORD *)&self->_has & 0x40) != 0)
  {
LABEL_12:
    v5[57] = self->_hdrTxTrafficCountAll;
    *((_WORD *)v5 + 124) |= 0x40u;
  }
LABEL_13:
  PBRepeatedUInt32Copy(v5 + 2, &self->_hdrRx0IdleCounts);
  PBRepeatedUInt32Copy(v5 + 8, &self->_hdrRx0TrafficCounts);
  PBRepeatedUInt32Copy(v5 + 14, &self->_hdrRx1TrafficCounts);
  PBRepeatedUInt32Copy(v5 + 20, &self->_hdrTxTrafficCounts);
  if ((*(_WORD *)&self->_has & 2) != 0)
  {
    v5[52] = self->_band;
    *((_WORD *)v5 + 124) |= 2u;
  }
  return v5;
}

- (BOOL)isEqual:(id)a3
{
  char *v4;
  uint64_t v5;
  __int16 has;
  __int16 v7;
  __int16 v8;
  __int16 v9;
  __int16 v10;
  BOOL v11;

  v4 = (char *)a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class(self, v5)))
    goto LABEL_65;
  has = (__int16)self->_has;
  v7 = *((_WORD *)v4 + 124);
  if ((has & 1) != 0)
  {
    if ((v7 & 1) == 0 || self->_timestamp != *((_QWORD *)v4 + 25))
      goto LABEL_65;
  }
  else if ((v7 & 1) != 0)
  {
LABEL_65:
    v11 = 0;
    goto LABEL_66;
  }
  if ((has & 4) != 0)
  {
    if ((v7 & 4) == 0 || self->_duration != *((_DWORD *)v4 + 53))
      goto LABEL_65;
  }
  else if ((v7 & 4) != 0)
  {
    goto LABEL_65;
  }
  if ((has & 0x80) != 0)
  {
    if ((v7 & 0x80) == 0 || self->_rx0IdleCountAll != *((_DWORD *)v4 + 58))
      goto LABEL_65;
  }
  else if ((v7 & 0x80) != 0)
  {
    goto LABEL_65;
  }
  if ((*(_WORD *)&self->_has & 0x100) != 0)
  {
    if ((*((_WORD *)v4 + 124) & 0x100) == 0 || self->_rx0TrafficCountAll != *((_DWORD *)v4 + 59))
      goto LABEL_65;
  }
  else if ((*((_WORD *)v4 + 124) & 0x100) != 0)
  {
    goto LABEL_65;
  }
  if ((*(_WORD *)&self->_has & 0x200) != 0)
  {
    if ((*((_WORD *)v4 + 124) & 0x200) == 0 || self->_rx1TrafficCountAll != *((_DWORD *)v4 + 60))
      goto LABEL_65;
  }
  else if ((*((_WORD *)v4 + 124) & 0x200) != 0)
  {
    goto LABEL_65;
  }
  if ((*(_WORD *)&self->_has & 0x400) != 0)
  {
    if ((*((_WORD *)v4 + 124) & 0x400) == 0 || self->_txTrafficCountAll != *((_DWORD *)v4 + 61))
      goto LABEL_65;
  }
  else if ((*((_WORD *)v4 + 124) & 0x400) != 0)
  {
    goto LABEL_65;
  }
  if (!PBRepeatedUInt32IsEqual(&self->_rx0IdleCounts, v4 + 104)
    || !PBRepeatedUInt32IsEqual(&self->_rx0TrafficCounts, v4 + 128)
    || !PBRepeatedUInt32IsEqual(&self->_rx1TrafficCounts, v4 + 152)
    || !PBRepeatedUInt32IsEqual(&self->_txTrafficCounts, v4 + 176))
  {
    goto LABEL_65;
  }
  v8 = (__int16)self->_has;
  v9 = *((_WORD *)v4 + 124);
  if ((v8 & 8) != 0)
  {
    if ((v9 & 8) == 0 || self->_hdrRx0IdleCountAll != *((_DWORD *)v4 + 54))
      goto LABEL_65;
  }
  else if ((v9 & 8) != 0)
  {
    goto LABEL_65;
  }
  if ((v8 & 0x10) != 0)
  {
    if ((v9 & 0x10) == 0 || self->_hdrRx0TrafficCountAll != *((_DWORD *)v4 + 55))
      goto LABEL_65;
  }
  else if ((v9 & 0x10) != 0)
  {
    goto LABEL_65;
  }
  if ((v8 & 0x20) != 0)
  {
    if ((v9 & 0x20) == 0 || self->_hdrRx1TrafficCountAll != *((_DWORD *)v4 + 56))
      goto LABEL_65;
  }
  else if ((v9 & 0x20) != 0)
  {
    goto LABEL_65;
  }
  if ((v8 & 0x40) != 0)
  {
    if ((v9 & 0x40) == 0 || self->_hdrTxTrafficCountAll != *((_DWORD *)v4 + 57))
      goto LABEL_65;
  }
  else if ((v9 & 0x40) != 0)
  {
    goto LABEL_65;
  }
  if (!PBRepeatedUInt32IsEqual(&self->_hdrRx0IdleCounts, v4 + 8)
    || !PBRepeatedUInt32IsEqual(&self->_hdrRx0TrafficCounts, v4 + 32)
    || !PBRepeatedUInt32IsEqual(&self->_hdrRx1TrafficCounts, v4 + 56)
    || !PBRepeatedUInt32IsEqual(&self->_hdrTxTrafficCounts, v4 + 80))
  {
    goto LABEL_65;
  }
  v10 = *((_WORD *)v4 + 124);
  if ((*(_WORD *)&self->_has & 2) != 0)
  {
    if ((v10 & 2) == 0 || self->_band != *((_DWORD *)v4 + 52))
      goto LABEL_65;
    v11 = 1;
  }
  else
  {
    v11 = (v10 & 2) == 0;
  }
LABEL_66:

  return v11;
}

- (unint64_t)hash
{
  __int16 has;
  __int16 v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  unint64_t v24;

  has = (__int16)self->_has;
  if ((has & 1) != 0)
  {
    v24 = 2654435761u * self->_timestamp;
    if ((has & 4) != 0)
    {
LABEL_3:
      v23 = 2654435761 * self->_duration;
      if ((has & 0x80) != 0)
        goto LABEL_4;
      goto LABEL_10;
    }
  }
  else
  {
    v24 = 0;
    if ((has & 4) != 0)
      goto LABEL_3;
  }
  v23 = 0;
  if ((has & 0x80) != 0)
  {
LABEL_4:
    v22 = 2654435761 * self->_rx0IdleCountAll;
    if ((*(_WORD *)&self->_has & 0x100) != 0)
      goto LABEL_5;
    goto LABEL_11;
  }
LABEL_10:
  v22 = 0;
  if ((*(_WORD *)&self->_has & 0x100) != 0)
  {
LABEL_5:
    v21 = 2654435761 * self->_rx0TrafficCountAll;
    if ((*(_WORD *)&self->_has & 0x200) != 0)
      goto LABEL_6;
LABEL_12:
    v20 = 0;
    if ((*(_WORD *)&self->_has & 0x400) != 0)
      goto LABEL_7;
    goto LABEL_13;
  }
LABEL_11:
  v21 = 0;
  if ((*(_WORD *)&self->_has & 0x200) == 0)
    goto LABEL_12;
LABEL_6:
  v20 = 2654435761 * self->_rx1TrafficCountAll;
  if ((*(_WORD *)&self->_has & 0x400) != 0)
  {
LABEL_7:
    v19 = 2654435761 * self->_txTrafficCountAll;
    goto LABEL_14;
  }
LABEL_13:
  v19 = 0;
LABEL_14:
  v18 = PBRepeatedUInt32Hash(&self->_rx0IdleCounts);
  v17 = PBRepeatedUInt32Hash(&self->_rx0TrafficCounts);
  v16 = PBRepeatedUInt32Hash(&self->_rx1TrafficCounts);
  v15 = PBRepeatedUInt32Hash(&self->_txTrafficCounts);
  v4 = (__int16)self->_has;
  if ((v4 & 8) != 0)
  {
    v5 = 2654435761 * self->_hdrRx0IdleCountAll;
    if ((v4 & 0x10) != 0)
    {
LABEL_16:
      v6 = 2654435761 * self->_hdrRx0TrafficCountAll;
      if ((v4 & 0x20) != 0)
        goto LABEL_17;
LABEL_21:
      v7 = 0;
      if ((v4 & 0x40) != 0)
        goto LABEL_18;
      goto LABEL_22;
    }
  }
  else
  {
    v5 = 0;
    if ((v4 & 0x10) != 0)
      goto LABEL_16;
  }
  v6 = 0;
  if ((v4 & 0x20) == 0)
    goto LABEL_21;
LABEL_17:
  v7 = 2654435761 * self->_hdrRx1TrafficCountAll;
  if ((v4 & 0x40) != 0)
  {
LABEL_18:
    v8 = 2654435761 * self->_hdrTxTrafficCountAll;
    goto LABEL_23;
  }
LABEL_22:
  v8 = 0;
LABEL_23:
  v9 = PBRepeatedUInt32Hash(&self->_hdrRx0IdleCounts);
  v10 = PBRepeatedUInt32Hash(&self->_hdrRx0TrafficCounts);
  v11 = PBRepeatedUInt32Hash(&self->_hdrRx1TrafficCounts);
  v12 = PBRepeatedUInt32Hash(&self->_hdrTxTrafficCounts);
  if ((*(_WORD *)&self->_has & 2) != 0)
    v13 = 2654435761 * self->_band;
  else
    v13 = 0;
  return v23 ^ v24 ^ v22 ^ v21 ^ v20 ^ v19 ^ v18 ^ v17 ^ v16 ^ v15 ^ v5 ^ v6 ^ v7 ^ v8 ^ v9 ^ v10 ^ v11 ^ v12 ^ v13;
}

- (void)mergeFrom:(id)a3
{
  id v4;
  __int16 v5;
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
  __int16 v18;
  char *v19;
  char *v20;
  char *n;
  char *v22;
  char *v23;
  char *ii;
  char *v25;
  char *v26;
  char *jj;
  char *v28;
  char *v29;
  char *kk;
  id v31;

  v4 = a3;
  v5 = *((_WORD *)v4 + 124);
  if ((v5 & 1) != 0)
  {
    self->_timestamp = *((_QWORD *)v4 + 25);
    *(_WORD *)&self->_has |= 1u;
    v5 = *((_WORD *)v4 + 124);
    if ((v5 & 4) == 0)
    {
LABEL_3:
      if ((v5 & 0x80) == 0)
        goto LABEL_4;
      goto LABEL_42;
    }
  }
  else if ((v5 & 4) == 0)
  {
    goto LABEL_3;
  }
  self->_duration = *((_DWORD *)v4 + 53);
  *(_WORD *)&self->_has |= 4u;
  v5 = *((_WORD *)v4 + 124);
  if ((v5 & 0x80) == 0)
  {
LABEL_4:
    if ((v5 & 0x100) == 0)
      goto LABEL_5;
    goto LABEL_43;
  }
LABEL_42:
  self->_rx0IdleCountAll = *((_DWORD *)v4 + 58);
  *(_WORD *)&self->_has |= 0x80u;
  v5 = *((_WORD *)v4 + 124);
  if ((v5 & 0x100) == 0)
  {
LABEL_5:
    if ((v5 & 0x200) == 0)
      goto LABEL_6;
    goto LABEL_44;
  }
LABEL_43:
  self->_rx0TrafficCountAll = *((_DWORD *)v4 + 59);
  *(_WORD *)&self->_has |= 0x100u;
  v5 = *((_WORD *)v4 + 124);
  if ((v5 & 0x200) == 0)
  {
LABEL_6:
    if ((v5 & 0x400) == 0)
      goto LABEL_8;
    goto LABEL_7;
  }
LABEL_44:
  self->_rx1TrafficCountAll = *((_DWORD *)v4 + 60);
  *(_WORD *)&self->_has |= 0x200u;
  if ((*((_WORD *)v4 + 124) & 0x400) != 0)
  {
LABEL_7:
    self->_txTrafficCountAll = *((_DWORD *)v4 + 61);
    *(_WORD *)&self->_has |= 0x400u;
  }
LABEL_8:
  v31 = v4;
  v6 = (char *)objc_msgSend(v4, "rx0IdleCountsCount");
  if (v6)
  {
    v7 = v6;
    for (i = 0; i != v7; ++i)
      -[CellularCdmaTxRxHist addRx0IdleCount:](self, "addRx0IdleCount:", objc_msgSend(v31, "rx0IdleCountAtIndex:", i));
  }
  v9 = (char *)objc_msgSend(v31, "rx0TrafficCountsCount");
  if (v9)
  {
    v10 = v9;
    for (j = 0; j != v10; ++j)
      -[CellularCdmaTxRxHist addRx0TrafficCount:](self, "addRx0TrafficCount:", objc_msgSend(v31, "rx0TrafficCountAtIndex:", j));
  }
  v12 = (char *)objc_msgSend(v31, "rx1TrafficCountsCount");
  if (v12)
  {
    v13 = v12;
    for (k = 0; k != v13; ++k)
      -[CellularCdmaTxRxHist addRx1TrafficCount:](self, "addRx1TrafficCount:", objc_msgSend(v31, "rx1TrafficCountAtIndex:", k));
  }
  v15 = (char *)objc_msgSend(v31, "txTrafficCountsCount");
  if (v15)
  {
    v16 = v15;
    for (m = 0; m != v16; ++m)
      -[CellularCdmaTxRxHist addTxTrafficCount:](self, "addTxTrafficCount:", objc_msgSend(v31, "txTrafficCountAtIndex:", m));
  }
  v18 = *((_WORD *)v31 + 124);
  if ((v18 & 8) != 0)
  {
    self->_hdrRx0IdleCountAll = *((_DWORD *)v31 + 54);
    *(_WORD *)&self->_has |= 8u;
    v18 = *((_WORD *)v31 + 124);
    if ((v18 & 0x10) == 0)
    {
LABEL_22:
      if ((v18 & 0x20) == 0)
        goto LABEL_23;
      goto LABEL_48;
    }
  }
  else if ((v18 & 0x10) == 0)
  {
    goto LABEL_22;
  }
  self->_hdrRx0TrafficCountAll = *((_DWORD *)v31 + 55);
  *(_WORD *)&self->_has |= 0x10u;
  v18 = *((_WORD *)v31 + 124);
  if ((v18 & 0x20) == 0)
  {
LABEL_23:
    if ((v18 & 0x40) == 0)
      goto LABEL_25;
    goto LABEL_24;
  }
LABEL_48:
  self->_hdrRx1TrafficCountAll = *((_DWORD *)v31 + 56);
  *(_WORD *)&self->_has |= 0x20u;
  if ((*((_WORD *)v31 + 124) & 0x40) != 0)
  {
LABEL_24:
    self->_hdrTxTrafficCountAll = *((_DWORD *)v31 + 57);
    *(_WORD *)&self->_has |= 0x40u;
  }
LABEL_25:
  v19 = (char *)objc_msgSend(v31, "hdrRx0IdleCountsCount");
  if (v19)
  {
    v20 = v19;
    for (n = 0; n != v20; ++n)
      -[CellularCdmaTxRxHist addHdrRx0IdleCount:](self, "addHdrRx0IdleCount:", objc_msgSend(v31, "hdrRx0IdleCountAtIndex:", n));
  }
  v22 = (char *)objc_msgSend(v31, "hdrRx0TrafficCountsCount");
  if (v22)
  {
    v23 = v22;
    for (ii = 0; ii != v23; ++ii)
      -[CellularCdmaTxRxHist addHdrRx0TrafficCount:](self, "addHdrRx0TrafficCount:", objc_msgSend(v31, "hdrRx0TrafficCountAtIndex:", ii));
  }
  v25 = (char *)objc_msgSend(v31, "hdrRx1TrafficCountsCount");
  if (v25)
  {
    v26 = v25;
    for (jj = 0; jj != v26; ++jj)
      -[CellularCdmaTxRxHist addHdrRx1TrafficCount:](self, "addHdrRx1TrafficCount:", objc_msgSend(v31, "hdrRx1TrafficCountAtIndex:", jj));
  }
  v28 = (char *)objc_msgSend(v31, "hdrTxTrafficCountsCount");
  if (v28)
  {
    v29 = v28;
    for (kk = 0; kk != v29; ++kk)
      -[CellularCdmaTxRxHist addHdrTxTrafficCount:](self, "addHdrTxTrafficCount:", objc_msgSend(v31, "hdrTxTrafficCountAtIndex:", kk));
  }
  if ((*((_WORD *)v31 + 124) & 2) != 0)
  {
    self->_band = *((_DWORD *)v31 + 52);
    *(_WORD *)&self->_has |= 2u;
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

- (unsigned)rx0IdleCountAll
{
  return self->_rx0IdleCountAll;
}

- (unsigned)rx0TrafficCountAll
{
  return self->_rx0TrafficCountAll;
}

- (unsigned)rx1TrafficCountAll
{
  return self->_rx1TrafficCountAll;
}

- (unsigned)txTrafficCountAll
{
  return self->_txTrafficCountAll;
}

- (unsigned)hdrRx0IdleCountAll
{
  return self->_hdrRx0IdleCountAll;
}

- (unsigned)hdrRx0TrafficCountAll
{
  return self->_hdrRx0TrafficCountAll;
}

- (unsigned)hdrRx1TrafficCountAll
{
  return self->_hdrRx1TrafficCountAll;
}

- (unsigned)hdrTxTrafficCountAll
{
  return self->_hdrTxTrafficCountAll;
}

@end
