@implementation KCellularLteScellInfo

- (void)setTimestamp:(unint64_t)a3
{
  *(_DWORD *)&self->_has |= 1u;
  self->_timestamp = a3;
}

- (void)setHasTimestamp:(BOOL)a3
{
  self->_has = ($E90FCE02E9099CD1DEFAF9CBC0447F41)(*(_DWORD *)&self->_has & 0xFFFFFFFE | a3);
}

- (BOOL)hasTimestamp
{
  return *(_DWORD *)&self->_has & 1;
}

- (void)setPhyCellId:(unsigned int)a3
{
  *(_DWORD *)&self->_has |= 0x100u;
  self->_phyCellId = a3;
}

- (void)setHasPhyCellId:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 256;
  else
    v3 = 0;
  self->_has = ($E90FCE02E9099CD1DEFAF9CBC0447F41)(*(_DWORD *)&self->_has & 0xFFFFFEFF | v3);
}

- (BOOL)hasPhyCellId
{
  return *((_BYTE *)&self->_has + 1) & 1;
}

- (void)setDlFreq:(unsigned int)a3
{
  *(_DWORD *)&self->_has |= 8u;
  self->_dlFreq = a3;
}

- (void)setHasDlFreq:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 8;
  else
    v3 = 0;
  self->_has = ($E90FCE02E9099CD1DEFAF9CBC0447F41)(*(_DWORD *)&self->_has & 0xFFFFFFF7 | v3);
}

- (BOOL)hasDlFreq
{
  return (*(_BYTE *)&self->_has >> 3) & 1;
}

- (void)setUlFreq:(unsigned int)a3
{
  *(_DWORD *)&self->_has |= 0x20000u;
  self->_ulFreq = a3;
}

- (void)setHasUlFreq:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 0x20000;
  else
    v3 = 0;
  self->_has = ($E90FCE02E9099CD1DEFAF9CBC0447F41)(*(_DWORD *)&self->_has & 0xFFFDFFFF | v3);
}

- (BOOL)hasUlFreq
{
  return (*((unsigned __int8 *)&self->_has + 2) >> 1) & 1;
}

- (void)setDlBw:(unsigned int)a3
{
  *(_DWORD *)&self->_has |= 4u;
  self->_dlBw = a3;
}

- (void)setHasDlBw:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 4;
  else
    v3 = 0;
  self->_has = ($E90FCE02E9099CD1DEFAF9CBC0447F41)(*(_DWORD *)&self->_has & 0xFFFFFFFB | v3);
}

- (BOOL)hasDlBw
{
  return (*(_BYTE *)&self->_has >> 2) & 1;
}

- (void)setUlBw:(unsigned int)a3
{
  *(_DWORD *)&self->_has |= 0x10000u;
  self->_ulBw = a3;
}

- (void)setHasUlBw:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 0x10000;
  else
    v3 = 0;
  self->_has = ($E90FCE02E9099CD1DEFAF9CBC0447F41)(*(_DWORD *)&self->_has & 0xFFFEFFFF | v3);
}

- (BOOL)hasUlBw
{
  return *((_BYTE *)&self->_has + 2) & 1;
}

- (void)setCellId:(unsigned int)a3
{
  *(_DWORD *)&self->_has |= 2u;
  self->_cellId = a3;
}

- (void)setHasCellId:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  self->_has = ($E90FCE02E9099CD1DEFAF9CBC0447F41)(*(_DWORD *)&self->_has & 0xFFFFFFFD | v3);
}

- (BOOL)hasCellId
{
  return (*(_BYTE *)&self->_has >> 1) & 1;
}

- (void)setFreqBandInd:(unsigned int)a3
{
  *(_DWORD *)&self->_has |= 0x10u;
  self->_freqBandInd = a3;
}

- (void)setHasFreqBandInd:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 16;
  else
    v3 = 0;
  self->_has = ($E90FCE02E9099CD1DEFAF9CBC0447F41)(*(_DWORD *)&self->_has & 0xFFFFFFEF | v3);
}

- (BOOL)hasFreqBandInd
{
  return (*(_BYTE *)&self->_has >> 4) & 1;
}

- (void)setTrackingAreaCode:(unsigned int)a3
{
  *(_DWORD *)&self->_has |= 0x8000u;
  self->_trackingAreaCode = a3;
}

- (void)setHasTrackingAreaCode:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 0x8000;
  else
    v3 = 0;
  self->_has = ($E90FCE02E9099CD1DEFAF9CBC0447F41)(*(_DWORD *)&self->_has & 0xFFFF7FFF | v3);
}

- (BOOL)hasTrackingAreaCode
{
  return *((unsigned __int8 *)&self->_has + 1) >> 7;
}

- (void)setNumMncDigits:(unsigned int)a3
{
  *(_DWORD *)&self->_has |= 0x40u;
  self->_numMncDigits = a3;
}

- (void)setHasNumMncDigits:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 64;
  else
    v3 = 0;
  self->_has = ($E90FCE02E9099CD1DEFAF9CBC0447F41)(*(_DWORD *)&self->_has & 0xFFFFFFBF | v3);
}

- (BOOL)hasNumMncDigits
{
  return (*(_BYTE *)&self->_has >> 6) & 1;
}

- (void)setSelPlmnMcc:(unsigned int)a3
{
  *(_DWORD *)&self->_has |= 0x400u;
  self->_selPlmnMcc = a3;
}

- (void)setHasSelPlmnMcc:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 1024;
  else
    v3 = 0;
  self->_has = ($E90FCE02E9099CD1DEFAF9CBC0447F41)(*(_DWORD *)&self->_has & 0xFFFFFBFF | v3);
}

- (BOOL)hasSelPlmnMcc
{
  return (*((unsigned __int8 *)&self->_has + 1) >> 2) & 1;
}

- (void)setSelPlmnMnc:(unsigned int)a3
{
  *(_DWORD *)&self->_has |= 0x800u;
  self->_selPlmnMnc = a3;
}

- (void)setHasSelPlmnMnc:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 2048;
  else
    v3 = 0;
  self->_has = ($E90FCE02E9099CD1DEFAF9CBC0447F41)(*(_DWORD *)&self->_has & 0xFFFFF7FF | v3);
}

- (BOOL)hasSelPlmnMnc
{
  return (*((unsigned __int8 *)&self->_has + 1) >> 3) & 1;
}

- (void)setTddSfAssignment:(unsigned int)a3
{
  *(_DWORD *)&self->_has |= 0x2000u;
  self->_tddSfAssignment = a3;
}

- (void)setHasTddSfAssignment:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 0x2000;
  else
    v3 = 0;
  self->_has = ($E90FCE02E9099CD1DEFAF9CBC0447F41)(*(_DWORD *)&self->_has & 0xFFFFDFFF | v3);
}

- (BOOL)hasTddSfAssignment
{
  return (*((unsigned __int8 *)&self->_has + 1) >> 5) & 1;
}

- (void)setTddSsfPatterns:(unsigned int)a3
{
  *(_DWORD *)&self->_has |= 0x4000u;
  self->_tddSsfPatterns = a3;
}

- (void)setHasTddSsfPatterns:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 0x4000;
  else
    v3 = 0;
  self->_has = ($E90FCE02E9099CD1DEFAF9CBC0447F41)(*(_DWORD *)&self->_has & 0xFFFFBFFF | v3);
}

- (BOOL)hasTddSsfPatterns
{
  return (*((unsigned __int8 *)&self->_has + 1) >> 6) & 1;
}

- (void)setPrioOfCampedLteBand:(unsigned int)a3
{
  *(_DWORD *)&self->_has |= 0x200u;
  self->_prioOfCampedLteBand = a3;
}

- (void)setHasPrioOfCampedLteBand:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 512;
  else
    v3 = 0;
  self->_has = ($E90FCE02E9099CD1DEFAF9CBC0447F41)(*(_DWORD *)&self->_has & 0xFFFFFDFF | v3);
}

- (BOOL)hasPrioOfCampedLteBand
{
  return (*((unsigned __int8 *)&self->_has + 1) >> 1) & 1;
}

- (void)setHstCellInfo:(unsigned int)a3
{
  *(_DWORD *)&self->_has |= 0x20u;
  self->_hstCellInfo = a3;
}

- (void)setHasHstCellInfo:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 32;
  else
    v3 = 0;
  self->_has = ($E90FCE02E9099CD1DEFAF9CBC0447F41)(*(_DWORD *)&self->_has & 0xFFFFFFDF | v3);
}

- (BOOL)hasHstCellInfo
{
  return (*(_BYTE *)&self->_has >> 5) & 1;
}

- (void)setNumSubs:(unsigned int)a3
{
  *(_DWORD *)&self->_has |= 0x80u;
  self->_numSubs = a3;
}

- (void)setHasNumSubs:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 128;
  else
    v3 = 0;
  self->_has = ($E90FCE02E9099CD1DEFAF9CBC0447F41)(*(_DWORD *)&self->_has & 0xFFFFFF7F | v3);
}

- (BOOL)hasNumSubs
{
  return *(_BYTE *)&self->_has >> 7;
}

- (BOOL)hasSimHplmn
{
  return self->_simHplmn != 0;
}

- (void)setSubsId:(unsigned int)a3
{
  *(_DWORD *)&self->_has |= 0x1000u;
  self->_subsId = a3;
}

- (void)setHasSubsId:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 4096;
  else
    v3 = 0;
  self->_has = ($E90FCE02E9099CD1DEFAF9CBC0447F41)(*(_DWORD *)&self->_has & 0xFFFFEFFF | v3);
}

- (BOOL)hasSubsId
{
  return (*((unsigned __int8 *)&self->_has + 1) >> 4) & 1;
}

- (id)description
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)KCellularLteScellInfo;
  v3 = -[KCellularLteScellInfo description](&v8, "description");
  v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[KCellularLteScellInfo dictionaryRepresentation](self, "dictionaryRepresentation"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@ %@"), v4, v5));

  return v6;
}

- (id)dictionaryRepresentation
{
  void *v3;
  $E90FCE02E9099CD1DEFAF9CBC0447F41 has;
  void *v5;
  NSData *simHplmn;
  void *v7;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
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

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary"));
  has = self->_has;
  if ((*(_BYTE *)&has & 1) != 0)
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedLongLong:](NSNumber, "numberWithUnsignedLongLong:", self->_timestamp));
    objc_msgSend(v3, "setObject:forKey:", v9, CFSTR("timestamp"));

    has = self->_has;
    if ((*(_WORD *)&has & 0x100) == 0)
    {
LABEL_3:
      if ((*(_BYTE *)&has & 8) == 0)
        goto LABEL_4;
      goto LABEL_26;
    }
  }
  else if ((*(_WORD *)&has & 0x100) == 0)
  {
    goto LABEL_3;
  }
  v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", self->_phyCellId));
  objc_msgSend(v3, "setObject:forKey:", v10, CFSTR("phy_cell_id"));

  has = self->_has;
  if ((*(_BYTE *)&has & 8) == 0)
  {
LABEL_4:
    if ((*(_DWORD *)&has & 0x20000) == 0)
      goto LABEL_5;
    goto LABEL_27;
  }
LABEL_26:
  v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", self->_dlFreq));
  objc_msgSend(v3, "setObject:forKey:", v11, CFSTR("dl_freq"));

  has = self->_has;
  if ((*(_DWORD *)&has & 0x20000) == 0)
  {
LABEL_5:
    if ((*(_BYTE *)&has & 4) == 0)
      goto LABEL_6;
    goto LABEL_28;
  }
LABEL_27:
  v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", self->_ulFreq));
  objc_msgSend(v3, "setObject:forKey:", v12, CFSTR("ul_freq"));

  has = self->_has;
  if ((*(_BYTE *)&has & 4) == 0)
  {
LABEL_6:
    if ((*(_DWORD *)&has & 0x10000) == 0)
      goto LABEL_7;
    goto LABEL_29;
  }
LABEL_28:
  v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", self->_dlBw));
  objc_msgSend(v3, "setObject:forKey:", v13, CFSTR("dl_bw"));

  has = self->_has;
  if ((*(_DWORD *)&has & 0x10000) == 0)
  {
LABEL_7:
    if ((*(_BYTE *)&has & 2) == 0)
      goto LABEL_8;
    goto LABEL_30;
  }
LABEL_29:
  v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", self->_ulBw));
  objc_msgSend(v3, "setObject:forKey:", v14, CFSTR("ul_bw"));

  has = self->_has;
  if ((*(_BYTE *)&has & 2) == 0)
  {
LABEL_8:
    if ((*(_BYTE *)&has & 0x10) == 0)
      goto LABEL_9;
    goto LABEL_31;
  }
LABEL_30:
  v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", self->_cellId));
  objc_msgSend(v3, "setObject:forKey:", v15, CFSTR("cell_id"));

  has = self->_has;
  if ((*(_BYTE *)&has & 0x10) == 0)
  {
LABEL_9:
    if ((*(_WORD *)&has & 0x8000) == 0)
      goto LABEL_10;
    goto LABEL_32;
  }
LABEL_31:
  v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", self->_freqBandInd));
  objc_msgSend(v3, "setObject:forKey:", v16, CFSTR("freq_band_ind"));

  has = self->_has;
  if ((*(_WORD *)&has & 0x8000) == 0)
  {
LABEL_10:
    if ((*(_BYTE *)&has & 0x40) == 0)
      goto LABEL_11;
    goto LABEL_33;
  }
LABEL_32:
  v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", self->_trackingAreaCode));
  objc_msgSend(v3, "setObject:forKey:", v17, CFSTR("tracking_area_code"));

  has = self->_has;
  if ((*(_BYTE *)&has & 0x40) == 0)
  {
LABEL_11:
    if ((*(_WORD *)&has & 0x400) == 0)
      goto LABEL_12;
    goto LABEL_34;
  }
LABEL_33:
  v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", self->_numMncDigits));
  objc_msgSend(v3, "setObject:forKey:", v18, CFSTR("num_mnc_digits"));

  has = self->_has;
  if ((*(_WORD *)&has & 0x400) == 0)
  {
LABEL_12:
    if ((*(_WORD *)&has & 0x800) == 0)
      goto LABEL_13;
    goto LABEL_35;
  }
LABEL_34:
  v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", self->_selPlmnMcc));
  objc_msgSend(v3, "setObject:forKey:", v19, CFSTR("sel_plmn_mcc"));

  has = self->_has;
  if ((*(_WORD *)&has & 0x800) == 0)
  {
LABEL_13:
    if ((*(_WORD *)&has & 0x2000) == 0)
      goto LABEL_14;
    goto LABEL_36;
  }
LABEL_35:
  v20 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", self->_selPlmnMnc));
  objc_msgSend(v3, "setObject:forKey:", v20, CFSTR("sel_plmn_mnc"));

  has = self->_has;
  if ((*(_WORD *)&has & 0x2000) == 0)
  {
LABEL_14:
    if ((*(_WORD *)&has & 0x4000) == 0)
      goto LABEL_15;
    goto LABEL_37;
  }
LABEL_36:
  v21 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", self->_tddSfAssignment));
  objc_msgSend(v3, "setObject:forKey:", v21, CFSTR("tdd_sf_assignment"));

  has = self->_has;
  if ((*(_WORD *)&has & 0x4000) == 0)
  {
LABEL_15:
    if ((*(_WORD *)&has & 0x200) == 0)
      goto LABEL_16;
    goto LABEL_38;
  }
LABEL_37:
  v22 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", self->_tddSsfPatterns));
  objc_msgSend(v3, "setObject:forKey:", v22, CFSTR("tdd_ssf_patterns"));

  has = self->_has;
  if ((*(_WORD *)&has & 0x200) == 0)
  {
LABEL_16:
    if ((*(_BYTE *)&has & 0x20) == 0)
      goto LABEL_17;
    goto LABEL_39;
  }
LABEL_38:
  v23 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", self->_prioOfCampedLteBand));
  objc_msgSend(v3, "setObject:forKey:", v23, CFSTR("prio_of_camped_lte_band"));

  has = self->_has;
  if ((*(_BYTE *)&has & 0x20) == 0)
  {
LABEL_17:
    if ((*(_BYTE *)&has & 0x80) == 0)
      goto LABEL_19;
    goto LABEL_18;
  }
LABEL_39:
  v24 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", self->_hstCellInfo));
  objc_msgSend(v3, "setObject:forKey:", v24, CFSTR("hst_cell_info"));

  if ((*(_DWORD *)&self->_has & 0x80) != 0)
  {
LABEL_18:
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", self->_numSubs));
    objc_msgSend(v3, "setObject:forKey:", v5, CFSTR("num_subs"));

  }
LABEL_19:
  simHplmn = self->_simHplmn;
  if (simHplmn)
    objc_msgSend(v3, "setObject:forKey:", simHplmn, CFSTR("sim_hplmn"));
  if ((*((_BYTE *)&self->_has + 1) & 0x10) != 0)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", self->_subsId));
    objc_msgSend(v3, "setObject:forKey:", v7, CFSTR("subs_id"));

  }
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return sub_1000C5AAC((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  $E90FCE02E9099CD1DEFAF9CBC0447F41 has;
  NSData *simHplmn;
  id v6;

  v6 = a3;
  has = self->_has;
  if ((*(_BYTE *)&has & 1) != 0)
  {
    PBDataWriterWriteUint64Field(v6, self->_timestamp, 1);
    has = self->_has;
    if ((*(_WORD *)&has & 0x100) == 0)
    {
LABEL_3:
      if ((*(_BYTE *)&has & 8) == 0)
        goto LABEL_4;
      goto LABEL_26;
    }
  }
  else if ((*(_WORD *)&has & 0x100) == 0)
  {
    goto LABEL_3;
  }
  PBDataWriterWriteUint32Field(v6, self->_phyCellId, 2);
  has = self->_has;
  if ((*(_BYTE *)&has & 8) == 0)
  {
LABEL_4:
    if ((*(_DWORD *)&has & 0x20000) == 0)
      goto LABEL_5;
    goto LABEL_27;
  }
LABEL_26:
  PBDataWriterWriteUint32Field(v6, self->_dlFreq, 3);
  has = self->_has;
  if ((*(_DWORD *)&has & 0x20000) == 0)
  {
LABEL_5:
    if ((*(_BYTE *)&has & 4) == 0)
      goto LABEL_6;
    goto LABEL_28;
  }
LABEL_27:
  PBDataWriterWriteUint32Field(v6, self->_ulFreq, 4);
  has = self->_has;
  if ((*(_BYTE *)&has & 4) == 0)
  {
LABEL_6:
    if ((*(_DWORD *)&has & 0x10000) == 0)
      goto LABEL_7;
    goto LABEL_29;
  }
LABEL_28:
  PBDataWriterWriteUint32Field(v6, self->_dlBw, 5);
  has = self->_has;
  if ((*(_DWORD *)&has & 0x10000) == 0)
  {
LABEL_7:
    if ((*(_BYTE *)&has & 2) == 0)
      goto LABEL_8;
    goto LABEL_30;
  }
LABEL_29:
  PBDataWriterWriteUint32Field(v6, self->_ulBw, 6);
  has = self->_has;
  if ((*(_BYTE *)&has & 2) == 0)
  {
LABEL_8:
    if ((*(_BYTE *)&has & 0x10) == 0)
      goto LABEL_9;
    goto LABEL_31;
  }
LABEL_30:
  PBDataWriterWriteUint32Field(v6, self->_cellId, 7);
  has = self->_has;
  if ((*(_BYTE *)&has & 0x10) == 0)
  {
LABEL_9:
    if ((*(_WORD *)&has & 0x8000) == 0)
      goto LABEL_10;
    goto LABEL_32;
  }
LABEL_31:
  PBDataWriterWriteUint32Field(v6, self->_freqBandInd, 8);
  has = self->_has;
  if ((*(_WORD *)&has & 0x8000) == 0)
  {
LABEL_10:
    if ((*(_BYTE *)&has & 0x40) == 0)
      goto LABEL_11;
    goto LABEL_33;
  }
LABEL_32:
  PBDataWriterWriteUint32Field(v6, self->_trackingAreaCode, 9);
  has = self->_has;
  if ((*(_BYTE *)&has & 0x40) == 0)
  {
LABEL_11:
    if ((*(_WORD *)&has & 0x400) == 0)
      goto LABEL_12;
    goto LABEL_34;
  }
LABEL_33:
  PBDataWriterWriteUint32Field(v6, self->_numMncDigits, 10);
  has = self->_has;
  if ((*(_WORD *)&has & 0x400) == 0)
  {
LABEL_12:
    if ((*(_WORD *)&has & 0x800) == 0)
      goto LABEL_13;
    goto LABEL_35;
  }
LABEL_34:
  PBDataWriterWriteUint32Field(v6, self->_selPlmnMcc, 11);
  has = self->_has;
  if ((*(_WORD *)&has & 0x800) == 0)
  {
LABEL_13:
    if ((*(_WORD *)&has & 0x2000) == 0)
      goto LABEL_14;
    goto LABEL_36;
  }
LABEL_35:
  PBDataWriterWriteUint32Field(v6, self->_selPlmnMnc, 12);
  has = self->_has;
  if ((*(_WORD *)&has & 0x2000) == 0)
  {
LABEL_14:
    if ((*(_WORD *)&has & 0x4000) == 0)
      goto LABEL_15;
    goto LABEL_37;
  }
LABEL_36:
  PBDataWriterWriteUint32Field(v6, self->_tddSfAssignment, 14);
  has = self->_has;
  if ((*(_WORD *)&has & 0x4000) == 0)
  {
LABEL_15:
    if ((*(_WORD *)&has & 0x200) == 0)
      goto LABEL_16;
    goto LABEL_38;
  }
LABEL_37:
  PBDataWriterWriteUint32Field(v6, self->_tddSsfPatterns, 15);
  has = self->_has;
  if ((*(_WORD *)&has & 0x200) == 0)
  {
LABEL_16:
    if ((*(_BYTE *)&has & 0x20) == 0)
      goto LABEL_17;
    goto LABEL_39;
  }
LABEL_38:
  PBDataWriterWriteUint32Field(v6, self->_prioOfCampedLteBand, 16);
  has = self->_has;
  if ((*(_BYTE *)&has & 0x20) == 0)
  {
LABEL_17:
    if ((*(_BYTE *)&has & 0x80) == 0)
      goto LABEL_19;
    goto LABEL_18;
  }
LABEL_39:
  PBDataWriterWriteUint32Field(v6, self->_hstCellInfo, 17);
  if ((*(_DWORD *)&self->_has & 0x80) != 0)
LABEL_18:
    PBDataWriterWriteUint32Field(v6, self->_numSubs, 22);
LABEL_19:
  simHplmn = self->_simHplmn;
  if (simHplmn)
    PBDataWriterWriteDataField(v6, simHplmn, 24);
  if ((*((_BYTE *)&self->_has + 1) & 0x10) != 0)
    PBDataWriterWriteUint32Field(v6, self->_subsId, 127);

}

- (void)copyTo:(id)a3
{
  _QWORD *v4;
  $E90FCE02E9099CD1DEFAF9CBC0447F41 has;
  _QWORD *v6;

  v4 = a3;
  has = self->_has;
  if ((*(_BYTE *)&has & 1) != 0)
  {
    v4[1] = self->_timestamp;
    *((_DWORD *)v4 + 24) |= 1u;
    has = self->_has;
    if ((*(_WORD *)&has & 0x100) == 0)
    {
LABEL_3:
      if ((*(_BYTE *)&has & 8) == 0)
        goto LABEL_4;
      goto LABEL_26;
    }
  }
  else if ((*(_WORD *)&has & 0x100) == 0)
  {
    goto LABEL_3;
  }
  *((_DWORD *)v4 + 11) = self->_phyCellId;
  *((_DWORD *)v4 + 24) |= 0x100u;
  has = self->_has;
  if ((*(_BYTE *)&has & 8) == 0)
  {
LABEL_4:
    if ((*(_DWORD *)&has & 0x20000) == 0)
      goto LABEL_5;
    goto LABEL_27;
  }
LABEL_26:
  *((_DWORD *)v4 + 6) = self->_dlFreq;
  *((_DWORD *)v4 + 24) |= 8u;
  has = self->_has;
  if ((*(_DWORD *)&has & 0x20000) == 0)
  {
LABEL_5:
    if ((*(_BYTE *)&has & 4) == 0)
      goto LABEL_6;
    goto LABEL_28;
  }
LABEL_27:
  *((_DWORD *)v4 + 23) = self->_ulFreq;
  *((_DWORD *)v4 + 24) |= 0x20000u;
  has = self->_has;
  if ((*(_BYTE *)&has & 4) == 0)
  {
LABEL_6:
    if ((*(_DWORD *)&has & 0x10000) == 0)
      goto LABEL_7;
    goto LABEL_29;
  }
LABEL_28:
  *((_DWORD *)v4 + 5) = self->_dlBw;
  *((_DWORD *)v4 + 24) |= 4u;
  has = self->_has;
  if ((*(_DWORD *)&has & 0x10000) == 0)
  {
LABEL_7:
    if ((*(_BYTE *)&has & 2) == 0)
      goto LABEL_8;
    goto LABEL_30;
  }
LABEL_29:
  *((_DWORD *)v4 + 22) = self->_ulBw;
  *((_DWORD *)v4 + 24) |= 0x10000u;
  has = self->_has;
  if ((*(_BYTE *)&has & 2) == 0)
  {
LABEL_8:
    if ((*(_BYTE *)&has & 0x10) == 0)
      goto LABEL_9;
    goto LABEL_31;
  }
LABEL_30:
  *((_DWORD *)v4 + 4) = self->_cellId;
  *((_DWORD *)v4 + 24) |= 2u;
  has = self->_has;
  if ((*(_BYTE *)&has & 0x10) == 0)
  {
LABEL_9:
    if ((*(_WORD *)&has & 0x8000) == 0)
      goto LABEL_10;
    goto LABEL_32;
  }
LABEL_31:
  *((_DWORD *)v4 + 7) = self->_freqBandInd;
  *((_DWORD *)v4 + 24) |= 0x10u;
  has = self->_has;
  if ((*(_WORD *)&has & 0x8000) == 0)
  {
LABEL_10:
    if ((*(_BYTE *)&has & 0x40) == 0)
      goto LABEL_11;
    goto LABEL_33;
  }
LABEL_32:
  *((_DWORD *)v4 + 21) = self->_trackingAreaCode;
  *((_DWORD *)v4 + 24) |= 0x8000u;
  has = self->_has;
  if ((*(_BYTE *)&has & 0x40) == 0)
  {
LABEL_11:
    if ((*(_WORD *)&has & 0x400) == 0)
      goto LABEL_12;
    goto LABEL_34;
  }
LABEL_33:
  *((_DWORD *)v4 + 9) = self->_numMncDigits;
  *((_DWORD *)v4 + 24) |= 0x40u;
  has = self->_has;
  if ((*(_WORD *)&has & 0x400) == 0)
  {
LABEL_12:
    if ((*(_WORD *)&has & 0x800) == 0)
      goto LABEL_13;
    goto LABEL_35;
  }
LABEL_34:
  *((_DWORD *)v4 + 13) = self->_selPlmnMcc;
  *((_DWORD *)v4 + 24) |= 0x400u;
  has = self->_has;
  if ((*(_WORD *)&has & 0x800) == 0)
  {
LABEL_13:
    if ((*(_WORD *)&has & 0x2000) == 0)
      goto LABEL_14;
    goto LABEL_36;
  }
LABEL_35:
  *((_DWORD *)v4 + 14) = self->_selPlmnMnc;
  *((_DWORD *)v4 + 24) |= 0x800u;
  has = self->_has;
  if ((*(_WORD *)&has & 0x2000) == 0)
  {
LABEL_14:
    if ((*(_WORD *)&has & 0x4000) == 0)
      goto LABEL_15;
    goto LABEL_37;
  }
LABEL_36:
  *((_DWORD *)v4 + 19) = self->_tddSfAssignment;
  *((_DWORD *)v4 + 24) |= 0x2000u;
  has = self->_has;
  if ((*(_WORD *)&has & 0x4000) == 0)
  {
LABEL_15:
    if ((*(_WORD *)&has & 0x200) == 0)
      goto LABEL_16;
    goto LABEL_38;
  }
LABEL_37:
  *((_DWORD *)v4 + 20) = self->_tddSsfPatterns;
  *((_DWORD *)v4 + 24) |= 0x4000u;
  has = self->_has;
  if ((*(_WORD *)&has & 0x200) == 0)
  {
LABEL_16:
    if ((*(_BYTE *)&has & 0x20) == 0)
      goto LABEL_17;
    goto LABEL_39;
  }
LABEL_38:
  *((_DWORD *)v4 + 12) = self->_prioOfCampedLteBand;
  *((_DWORD *)v4 + 24) |= 0x200u;
  has = self->_has;
  if ((*(_BYTE *)&has & 0x20) == 0)
  {
LABEL_17:
    if ((*(_BYTE *)&has & 0x80) == 0)
      goto LABEL_19;
    goto LABEL_18;
  }
LABEL_39:
  *((_DWORD *)v4 + 8) = self->_hstCellInfo;
  *((_DWORD *)v4 + 24) |= 0x20u;
  if ((*(_DWORD *)&self->_has & 0x80) != 0)
  {
LABEL_18:
    *((_DWORD *)v4 + 10) = self->_numSubs;
    *((_DWORD *)v4 + 24) |= 0x80u;
  }
LABEL_19:
  if (self->_simHplmn)
  {
    v6 = v4;
    objc_msgSend(v4, "setSimHplmn:");
    v4 = v6;
  }
  if ((*((_BYTE *)&self->_has + 1) & 0x10) != 0)
  {
    *((_DWORD *)v4 + 18) = self->_subsId;
    *((_DWORD *)v4 + 24) |= 0x1000u;
  }

}

- (id)copyWithZone:(_NSZone *)a3
{
  _QWORD *v5;
  _QWORD *v6;
  $E90FCE02E9099CD1DEFAF9CBC0447F41 has;
  id v8;
  void *v9;

  v5 = objc_msgSend(objc_msgSend((id)objc_opt_class(self, a2), "allocWithZone:", a3), "init");
  v6 = v5;
  has = self->_has;
  if ((*(_BYTE *)&has & 1) != 0)
  {
    v5[1] = self->_timestamp;
    *((_DWORD *)v5 + 24) |= 1u;
    has = self->_has;
    if ((*(_WORD *)&has & 0x100) == 0)
    {
LABEL_3:
      if ((*(_BYTE *)&has & 8) == 0)
        goto LABEL_4;
      goto LABEL_24;
    }
  }
  else if ((*(_WORD *)&has & 0x100) == 0)
  {
    goto LABEL_3;
  }
  *((_DWORD *)v5 + 11) = self->_phyCellId;
  *((_DWORD *)v5 + 24) |= 0x100u;
  has = self->_has;
  if ((*(_BYTE *)&has & 8) == 0)
  {
LABEL_4:
    if ((*(_DWORD *)&has & 0x20000) == 0)
      goto LABEL_5;
    goto LABEL_25;
  }
LABEL_24:
  *((_DWORD *)v5 + 6) = self->_dlFreq;
  *((_DWORD *)v5 + 24) |= 8u;
  has = self->_has;
  if ((*(_DWORD *)&has & 0x20000) == 0)
  {
LABEL_5:
    if ((*(_BYTE *)&has & 4) == 0)
      goto LABEL_6;
    goto LABEL_26;
  }
LABEL_25:
  *((_DWORD *)v5 + 23) = self->_ulFreq;
  *((_DWORD *)v5 + 24) |= 0x20000u;
  has = self->_has;
  if ((*(_BYTE *)&has & 4) == 0)
  {
LABEL_6:
    if ((*(_DWORD *)&has & 0x10000) == 0)
      goto LABEL_7;
    goto LABEL_27;
  }
LABEL_26:
  *((_DWORD *)v5 + 5) = self->_dlBw;
  *((_DWORD *)v5 + 24) |= 4u;
  has = self->_has;
  if ((*(_DWORD *)&has & 0x10000) == 0)
  {
LABEL_7:
    if ((*(_BYTE *)&has & 2) == 0)
      goto LABEL_8;
    goto LABEL_28;
  }
LABEL_27:
  *((_DWORD *)v5 + 22) = self->_ulBw;
  *((_DWORD *)v5 + 24) |= 0x10000u;
  has = self->_has;
  if ((*(_BYTE *)&has & 2) == 0)
  {
LABEL_8:
    if ((*(_BYTE *)&has & 0x10) == 0)
      goto LABEL_9;
    goto LABEL_29;
  }
LABEL_28:
  *((_DWORD *)v5 + 4) = self->_cellId;
  *((_DWORD *)v5 + 24) |= 2u;
  has = self->_has;
  if ((*(_BYTE *)&has & 0x10) == 0)
  {
LABEL_9:
    if ((*(_WORD *)&has & 0x8000) == 0)
      goto LABEL_10;
    goto LABEL_30;
  }
LABEL_29:
  *((_DWORD *)v5 + 7) = self->_freqBandInd;
  *((_DWORD *)v5 + 24) |= 0x10u;
  has = self->_has;
  if ((*(_WORD *)&has & 0x8000) == 0)
  {
LABEL_10:
    if ((*(_BYTE *)&has & 0x40) == 0)
      goto LABEL_11;
    goto LABEL_31;
  }
LABEL_30:
  *((_DWORD *)v5 + 21) = self->_trackingAreaCode;
  *((_DWORD *)v5 + 24) |= 0x8000u;
  has = self->_has;
  if ((*(_BYTE *)&has & 0x40) == 0)
  {
LABEL_11:
    if ((*(_WORD *)&has & 0x400) == 0)
      goto LABEL_12;
    goto LABEL_32;
  }
LABEL_31:
  *((_DWORD *)v5 + 9) = self->_numMncDigits;
  *((_DWORD *)v5 + 24) |= 0x40u;
  has = self->_has;
  if ((*(_WORD *)&has & 0x400) == 0)
  {
LABEL_12:
    if ((*(_WORD *)&has & 0x800) == 0)
      goto LABEL_13;
    goto LABEL_33;
  }
LABEL_32:
  *((_DWORD *)v5 + 13) = self->_selPlmnMcc;
  *((_DWORD *)v5 + 24) |= 0x400u;
  has = self->_has;
  if ((*(_WORD *)&has & 0x800) == 0)
  {
LABEL_13:
    if ((*(_WORD *)&has & 0x2000) == 0)
      goto LABEL_14;
    goto LABEL_34;
  }
LABEL_33:
  *((_DWORD *)v5 + 14) = self->_selPlmnMnc;
  *((_DWORD *)v5 + 24) |= 0x800u;
  has = self->_has;
  if ((*(_WORD *)&has & 0x2000) == 0)
  {
LABEL_14:
    if ((*(_WORD *)&has & 0x4000) == 0)
      goto LABEL_15;
    goto LABEL_35;
  }
LABEL_34:
  *((_DWORD *)v5 + 19) = self->_tddSfAssignment;
  *((_DWORD *)v5 + 24) |= 0x2000u;
  has = self->_has;
  if ((*(_WORD *)&has & 0x4000) == 0)
  {
LABEL_15:
    if ((*(_WORD *)&has & 0x200) == 0)
      goto LABEL_16;
    goto LABEL_36;
  }
LABEL_35:
  *((_DWORD *)v5 + 20) = self->_tddSsfPatterns;
  *((_DWORD *)v5 + 24) |= 0x4000u;
  has = self->_has;
  if ((*(_WORD *)&has & 0x200) == 0)
  {
LABEL_16:
    if ((*(_BYTE *)&has & 0x20) == 0)
      goto LABEL_17;
    goto LABEL_37;
  }
LABEL_36:
  *((_DWORD *)v5 + 12) = self->_prioOfCampedLteBand;
  *((_DWORD *)v5 + 24) |= 0x200u;
  has = self->_has;
  if ((*(_BYTE *)&has & 0x20) == 0)
  {
LABEL_17:
    if ((*(_BYTE *)&has & 0x80) == 0)
      goto LABEL_19;
    goto LABEL_18;
  }
LABEL_37:
  *((_DWORD *)v5 + 8) = self->_hstCellInfo;
  *((_DWORD *)v5 + 24) |= 0x20u;
  if ((*(_DWORD *)&self->_has & 0x80) != 0)
  {
LABEL_18:
    *((_DWORD *)v5 + 10) = self->_numSubs;
    *((_DWORD *)v5 + 24) |= 0x80u;
  }
LABEL_19:
  v8 = -[NSData copyWithZone:](self->_simHplmn, "copyWithZone:", a3);
  v9 = (void *)v6[8];
  v6[8] = v8;

  if ((*((_BYTE *)&self->_has + 1) & 0x10) != 0)
  {
    *((_DWORD *)v6 + 18) = self->_subsId;
    *((_DWORD *)v6 + 24) |= 0x1000u;
  }
  return v6;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  uint64_t v5;
  $E90FCE02E9099CD1DEFAF9CBC0447F41 has;
  int v7;
  NSData *simHplmn;
  BOOL v9;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class(self, v5)))
    goto LABEL_95;
  has = self->_has;
  v7 = *((_DWORD *)v4 + 24);
  if ((*(_BYTE *)&has & 1) != 0)
  {
    if ((v7 & 1) == 0 || self->_timestamp != *((_QWORD *)v4 + 1))
      goto LABEL_95;
  }
  else if ((v7 & 1) != 0)
  {
    goto LABEL_95;
  }
  if ((*(_WORD *)&has & 0x100) != 0)
  {
    if ((v7 & 0x100) == 0 || self->_phyCellId != *((_DWORD *)v4 + 11))
      goto LABEL_95;
  }
  else if ((v7 & 0x100) != 0)
  {
    goto LABEL_95;
  }
  if ((*(_BYTE *)&has & 8) != 0)
  {
    if ((v7 & 8) == 0 || self->_dlFreq != *((_DWORD *)v4 + 6))
      goto LABEL_95;
  }
  else if ((v7 & 8) != 0)
  {
    goto LABEL_95;
  }
  if ((*(_DWORD *)&has & 0x20000) != 0)
  {
    if ((v7 & 0x20000) == 0 || self->_ulFreq != *((_DWORD *)v4 + 23))
      goto LABEL_95;
  }
  else if ((v7 & 0x20000) != 0)
  {
    goto LABEL_95;
  }
  if ((*(_BYTE *)&has & 4) != 0)
  {
    if ((v7 & 4) == 0 || self->_dlBw != *((_DWORD *)v4 + 5))
      goto LABEL_95;
  }
  else if ((v7 & 4) != 0)
  {
    goto LABEL_95;
  }
  if ((*(_DWORD *)&has & 0x10000) != 0)
  {
    if ((v7 & 0x10000) == 0 || self->_ulBw != *((_DWORD *)v4 + 22))
      goto LABEL_95;
  }
  else if ((v7 & 0x10000) != 0)
  {
    goto LABEL_95;
  }
  if ((*(_BYTE *)&has & 2) != 0)
  {
    if ((v7 & 2) == 0 || self->_cellId != *((_DWORD *)v4 + 4))
      goto LABEL_95;
  }
  else if ((v7 & 2) != 0)
  {
    goto LABEL_95;
  }
  if ((*(_BYTE *)&has & 0x10) != 0)
  {
    if ((v7 & 0x10) == 0 || self->_freqBandInd != *((_DWORD *)v4 + 7))
      goto LABEL_95;
  }
  else if ((v7 & 0x10) != 0)
  {
    goto LABEL_95;
  }
  if ((*(_WORD *)&has & 0x8000) != 0)
  {
    if ((v7 & 0x8000) == 0 || self->_trackingAreaCode != *((_DWORD *)v4 + 21))
      goto LABEL_95;
  }
  else if ((v7 & 0x8000) != 0)
  {
    goto LABEL_95;
  }
  if ((*(_BYTE *)&has & 0x40) != 0)
  {
    if ((v7 & 0x40) == 0 || self->_numMncDigits != *((_DWORD *)v4 + 9))
      goto LABEL_95;
  }
  else if ((v7 & 0x40) != 0)
  {
    goto LABEL_95;
  }
  if ((*(_WORD *)&has & 0x400) != 0)
  {
    if ((v7 & 0x400) == 0 || self->_selPlmnMcc != *((_DWORD *)v4 + 13))
      goto LABEL_95;
  }
  else if ((v7 & 0x400) != 0)
  {
    goto LABEL_95;
  }
  if ((*(_WORD *)&has & 0x800) != 0)
  {
    if ((v7 & 0x800) == 0 || self->_selPlmnMnc != *((_DWORD *)v4 + 14))
      goto LABEL_95;
  }
  else if ((v7 & 0x800) != 0)
  {
    goto LABEL_95;
  }
  if ((*(_WORD *)&has & 0x2000) != 0)
  {
    if ((v7 & 0x2000) == 0 || self->_tddSfAssignment != *((_DWORD *)v4 + 19))
      goto LABEL_95;
  }
  else if ((v7 & 0x2000) != 0)
  {
    goto LABEL_95;
  }
  if ((*(_WORD *)&has & 0x4000) != 0)
  {
    if ((v7 & 0x4000) == 0 || self->_tddSsfPatterns != *((_DWORD *)v4 + 20))
      goto LABEL_95;
  }
  else if ((v7 & 0x4000) != 0)
  {
    goto LABEL_95;
  }
  if ((*(_WORD *)&has & 0x200) != 0)
  {
    if ((v7 & 0x200) == 0 || self->_prioOfCampedLteBand != *((_DWORD *)v4 + 12))
      goto LABEL_95;
  }
  else if ((v7 & 0x200) != 0)
  {
    goto LABEL_95;
  }
  if ((*(_BYTE *)&has & 0x20) != 0)
  {
    if ((v7 & 0x20) == 0 || self->_hstCellInfo != *((_DWORD *)v4 + 8))
      goto LABEL_95;
  }
  else if ((v7 & 0x20) != 0)
  {
    goto LABEL_95;
  }
  if ((*(_BYTE *)&has & 0x80) != 0)
  {
    if ((v7 & 0x80) == 0 || self->_numSubs != *((_DWORD *)v4 + 10))
      goto LABEL_95;
  }
  else if ((v7 & 0x80) != 0)
  {
    goto LABEL_95;
  }
  simHplmn = self->_simHplmn;
  if ((unint64_t)simHplmn | *((_QWORD *)v4 + 8))
  {
    if (!-[NSData isEqual:](simHplmn, "isEqual:"))
    {
LABEL_95:
      v9 = 0;
      goto LABEL_96;
    }
    has = self->_has;
  }
  if ((*(_WORD *)&has & 0x1000) != 0)
  {
    if ((*((_DWORD *)v4 + 24) & 0x1000) == 0 || self->_subsId != *((_DWORD *)v4 + 18))
      goto LABEL_95;
    v9 = 1;
  }
  else
  {
    v9 = (*((_DWORD *)v4 + 24) & 0x1000) == 0;
  }
LABEL_96:

  return v9;
}

- (unint64_t)hash
{
  $E90FCE02E9099CD1DEFAF9CBC0447F41 has;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  unint64_t v12;
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

  has = self->_has;
  if ((*(_BYTE *)&has & 1) != 0)
  {
    v24 = 2654435761u * self->_timestamp;
    if ((*(_WORD *)&has & 0x100) != 0)
    {
LABEL_3:
      v23 = 2654435761 * self->_phyCellId;
      if ((*(_BYTE *)&has & 8) != 0)
        goto LABEL_4;
      goto LABEL_21;
    }
  }
  else
  {
    v24 = 0;
    if ((*(_WORD *)&has & 0x100) != 0)
      goto LABEL_3;
  }
  v23 = 0;
  if ((*(_BYTE *)&has & 8) != 0)
  {
LABEL_4:
    v22 = 2654435761 * self->_dlFreq;
    if ((*(_DWORD *)&has & 0x20000) != 0)
      goto LABEL_5;
    goto LABEL_22;
  }
LABEL_21:
  v22 = 0;
  if ((*(_DWORD *)&has & 0x20000) != 0)
  {
LABEL_5:
    v21 = 2654435761 * self->_ulFreq;
    if ((*(_BYTE *)&has & 4) != 0)
      goto LABEL_6;
    goto LABEL_23;
  }
LABEL_22:
  v21 = 0;
  if ((*(_BYTE *)&has & 4) != 0)
  {
LABEL_6:
    v20 = 2654435761 * self->_dlBw;
    if ((*(_DWORD *)&has & 0x10000) != 0)
      goto LABEL_7;
    goto LABEL_24;
  }
LABEL_23:
  v20 = 0;
  if ((*(_DWORD *)&has & 0x10000) != 0)
  {
LABEL_7:
    v19 = 2654435761 * self->_ulBw;
    if ((*(_BYTE *)&has & 2) != 0)
      goto LABEL_8;
    goto LABEL_25;
  }
LABEL_24:
  v19 = 0;
  if ((*(_BYTE *)&has & 2) != 0)
  {
LABEL_8:
    v18 = 2654435761 * self->_cellId;
    if ((*(_BYTE *)&has & 0x10) != 0)
      goto LABEL_9;
    goto LABEL_26;
  }
LABEL_25:
  v18 = 0;
  if ((*(_BYTE *)&has & 0x10) != 0)
  {
LABEL_9:
    v17 = 2654435761 * self->_freqBandInd;
    if ((*(_WORD *)&has & 0x8000) != 0)
      goto LABEL_10;
    goto LABEL_27;
  }
LABEL_26:
  v17 = 0;
  if ((*(_WORD *)&has & 0x8000) != 0)
  {
LABEL_10:
    v15 = 2654435761 * self->_trackingAreaCode;
    if ((*(_BYTE *)&has & 0x40) != 0)
      goto LABEL_11;
    goto LABEL_28;
  }
LABEL_27:
  v15 = 0;
  if ((*(_BYTE *)&has & 0x40) != 0)
  {
LABEL_11:
    v4 = 2654435761 * self->_numMncDigits;
    if ((*(_WORD *)&has & 0x400) != 0)
      goto LABEL_12;
    goto LABEL_29;
  }
LABEL_28:
  v4 = 0;
  if ((*(_WORD *)&has & 0x400) != 0)
  {
LABEL_12:
    v5 = 2654435761 * self->_selPlmnMcc;
    if ((*(_WORD *)&has & 0x800) != 0)
      goto LABEL_13;
    goto LABEL_30;
  }
LABEL_29:
  v5 = 0;
  if ((*(_WORD *)&has & 0x800) != 0)
  {
LABEL_13:
    v6 = 2654435761 * self->_selPlmnMnc;
    if ((*(_WORD *)&has & 0x2000) != 0)
      goto LABEL_14;
    goto LABEL_31;
  }
LABEL_30:
  v6 = 0;
  if ((*(_WORD *)&has & 0x2000) != 0)
  {
LABEL_14:
    v7 = 2654435761 * self->_tddSfAssignment;
    if ((*(_WORD *)&has & 0x4000) != 0)
      goto LABEL_15;
    goto LABEL_32;
  }
LABEL_31:
  v7 = 0;
  if ((*(_WORD *)&has & 0x4000) != 0)
  {
LABEL_15:
    v8 = 2654435761 * self->_tddSsfPatterns;
    if ((*(_WORD *)&has & 0x200) != 0)
      goto LABEL_16;
    goto LABEL_33;
  }
LABEL_32:
  v8 = 0;
  if ((*(_WORD *)&has & 0x200) != 0)
  {
LABEL_16:
    v9 = 2654435761 * self->_prioOfCampedLteBand;
    if ((*(_BYTE *)&has & 0x20) != 0)
      goto LABEL_17;
LABEL_34:
    v10 = 0;
    if ((*(_BYTE *)&has & 0x80) != 0)
      goto LABEL_18;
    goto LABEL_35;
  }
LABEL_33:
  v9 = 0;
  if ((*(_BYTE *)&has & 0x20) == 0)
    goto LABEL_34;
LABEL_17:
  v10 = 2654435761 * self->_hstCellInfo;
  if ((*(_BYTE *)&has & 0x80) != 0)
  {
LABEL_18:
    v11 = 2654435761 * self->_numSubs;
    goto LABEL_36;
  }
LABEL_35:
  v11 = 0;
LABEL_36:
  v12 = (unint64_t)-[NSData hash](self->_simHplmn, "hash", v15);
  if ((*((_BYTE *)&self->_has + 1) & 0x10) != 0)
    v13 = 2654435761 * self->_subsId;
  else
    v13 = 0;
  return v23 ^ v24 ^ v22 ^ v21 ^ v20 ^ v19 ^ v18 ^ v17 ^ v16 ^ v4 ^ v5 ^ v6 ^ v7 ^ v8 ^ v9 ^ v10 ^ v11 ^ v13 ^ v12;
}

- (void)mergeFrom:(id)a3
{
  id v4;
  int v5;
  id v6;

  v4 = a3;
  v5 = *((_DWORD *)v4 + 24);
  if ((v5 & 1) != 0)
  {
    self->_timestamp = *((_QWORD *)v4 + 1);
    *(_DWORD *)&self->_has |= 1u;
    v5 = *((_DWORD *)v4 + 24);
    if ((v5 & 0x100) == 0)
    {
LABEL_3:
      if ((v5 & 8) == 0)
        goto LABEL_4;
      goto LABEL_26;
    }
  }
  else if ((v5 & 0x100) == 0)
  {
    goto LABEL_3;
  }
  self->_phyCellId = *((_DWORD *)v4 + 11);
  *(_DWORD *)&self->_has |= 0x100u;
  v5 = *((_DWORD *)v4 + 24);
  if ((v5 & 8) == 0)
  {
LABEL_4:
    if ((v5 & 0x20000) == 0)
      goto LABEL_5;
    goto LABEL_27;
  }
LABEL_26:
  self->_dlFreq = *((_DWORD *)v4 + 6);
  *(_DWORD *)&self->_has |= 8u;
  v5 = *((_DWORD *)v4 + 24);
  if ((v5 & 0x20000) == 0)
  {
LABEL_5:
    if ((v5 & 4) == 0)
      goto LABEL_6;
    goto LABEL_28;
  }
LABEL_27:
  self->_ulFreq = *((_DWORD *)v4 + 23);
  *(_DWORD *)&self->_has |= 0x20000u;
  v5 = *((_DWORD *)v4 + 24);
  if ((v5 & 4) == 0)
  {
LABEL_6:
    if ((v5 & 0x10000) == 0)
      goto LABEL_7;
    goto LABEL_29;
  }
LABEL_28:
  self->_dlBw = *((_DWORD *)v4 + 5);
  *(_DWORD *)&self->_has |= 4u;
  v5 = *((_DWORD *)v4 + 24);
  if ((v5 & 0x10000) == 0)
  {
LABEL_7:
    if ((v5 & 2) == 0)
      goto LABEL_8;
    goto LABEL_30;
  }
LABEL_29:
  self->_ulBw = *((_DWORD *)v4 + 22);
  *(_DWORD *)&self->_has |= 0x10000u;
  v5 = *((_DWORD *)v4 + 24);
  if ((v5 & 2) == 0)
  {
LABEL_8:
    if ((v5 & 0x10) == 0)
      goto LABEL_9;
    goto LABEL_31;
  }
LABEL_30:
  self->_cellId = *((_DWORD *)v4 + 4);
  *(_DWORD *)&self->_has |= 2u;
  v5 = *((_DWORD *)v4 + 24);
  if ((v5 & 0x10) == 0)
  {
LABEL_9:
    if ((v5 & 0x8000) == 0)
      goto LABEL_10;
    goto LABEL_32;
  }
LABEL_31:
  self->_freqBandInd = *((_DWORD *)v4 + 7);
  *(_DWORD *)&self->_has |= 0x10u;
  v5 = *((_DWORD *)v4 + 24);
  if ((v5 & 0x8000) == 0)
  {
LABEL_10:
    if ((v5 & 0x40) == 0)
      goto LABEL_11;
    goto LABEL_33;
  }
LABEL_32:
  self->_trackingAreaCode = *((_DWORD *)v4 + 21);
  *(_DWORD *)&self->_has |= 0x8000u;
  v5 = *((_DWORD *)v4 + 24);
  if ((v5 & 0x40) == 0)
  {
LABEL_11:
    if ((v5 & 0x400) == 0)
      goto LABEL_12;
    goto LABEL_34;
  }
LABEL_33:
  self->_numMncDigits = *((_DWORD *)v4 + 9);
  *(_DWORD *)&self->_has |= 0x40u;
  v5 = *((_DWORD *)v4 + 24);
  if ((v5 & 0x400) == 0)
  {
LABEL_12:
    if ((v5 & 0x800) == 0)
      goto LABEL_13;
    goto LABEL_35;
  }
LABEL_34:
  self->_selPlmnMcc = *((_DWORD *)v4 + 13);
  *(_DWORD *)&self->_has |= 0x400u;
  v5 = *((_DWORD *)v4 + 24);
  if ((v5 & 0x800) == 0)
  {
LABEL_13:
    if ((v5 & 0x2000) == 0)
      goto LABEL_14;
    goto LABEL_36;
  }
LABEL_35:
  self->_selPlmnMnc = *((_DWORD *)v4 + 14);
  *(_DWORD *)&self->_has |= 0x800u;
  v5 = *((_DWORD *)v4 + 24);
  if ((v5 & 0x2000) == 0)
  {
LABEL_14:
    if ((v5 & 0x4000) == 0)
      goto LABEL_15;
    goto LABEL_37;
  }
LABEL_36:
  self->_tddSfAssignment = *((_DWORD *)v4 + 19);
  *(_DWORD *)&self->_has |= 0x2000u;
  v5 = *((_DWORD *)v4 + 24);
  if ((v5 & 0x4000) == 0)
  {
LABEL_15:
    if ((v5 & 0x200) == 0)
      goto LABEL_16;
    goto LABEL_38;
  }
LABEL_37:
  self->_tddSsfPatterns = *((_DWORD *)v4 + 20);
  *(_DWORD *)&self->_has |= 0x4000u;
  v5 = *((_DWORD *)v4 + 24);
  if ((v5 & 0x200) == 0)
  {
LABEL_16:
    if ((v5 & 0x20) == 0)
      goto LABEL_17;
    goto LABEL_39;
  }
LABEL_38:
  self->_prioOfCampedLteBand = *((_DWORD *)v4 + 12);
  *(_DWORD *)&self->_has |= 0x200u;
  v5 = *((_DWORD *)v4 + 24);
  if ((v5 & 0x20) == 0)
  {
LABEL_17:
    if ((v5 & 0x80) == 0)
      goto LABEL_19;
    goto LABEL_18;
  }
LABEL_39:
  self->_hstCellInfo = *((_DWORD *)v4 + 8);
  *(_DWORD *)&self->_has |= 0x20u;
  if ((*((_DWORD *)v4 + 24) & 0x80) != 0)
  {
LABEL_18:
    self->_numSubs = *((_DWORD *)v4 + 10);
    *(_DWORD *)&self->_has |= 0x80u;
  }
LABEL_19:
  if (*((_QWORD *)v4 + 8))
  {
    v6 = v4;
    -[KCellularLteScellInfo setSimHplmn:](self, "setSimHplmn:");
    v4 = v6;
  }
  if ((*((_BYTE *)v4 + 97) & 0x10) != 0)
  {
    self->_subsId = *((_DWORD *)v4 + 18);
    *(_DWORD *)&self->_has |= 0x1000u;
  }

}

- (unint64_t)timestamp
{
  return self->_timestamp;
}

- (unsigned)phyCellId
{
  return self->_phyCellId;
}

- (unsigned)dlFreq
{
  return self->_dlFreq;
}

- (unsigned)ulFreq
{
  return self->_ulFreq;
}

- (unsigned)dlBw
{
  return self->_dlBw;
}

- (unsigned)ulBw
{
  return self->_ulBw;
}

- (unsigned)cellId
{
  return self->_cellId;
}

- (unsigned)freqBandInd
{
  return self->_freqBandInd;
}

- (unsigned)trackingAreaCode
{
  return self->_trackingAreaCode;
}

- (unsigned)numMncDigits
{
  return self->_numMncDigits;
}

- (unsigned)selPlmnMcc
{
  return self->_selPlmnMcc;
}

- (unsigned)selPlmnMnc
{
  return self->_selPlmnMnc;
}

- (unsigned)tddSfAssignment
{
  return self->_tddSfAssignment;
}

- (unsigned)tddSsfPatterns
{
  return self->_tddSsfPatterns;
}

- (unsigned)prioOfCampedLteBand
{
  return self->_prioOfCampedLteBand;
}

- (unsigned)hstCellInfo
{
  return self->_hstCellInfo;
}

- (unsigned)numSubs
{
  return self->_numSubs;
}

- (NSData)simHplmn
{
  return self->_simHplmn;
}

- (void)setSimHplmn:(id)a3
{
  objc_storeStrong((id *)&self->_simHplmn, a3);
}

- (unsigned)subsId
{
  return self->_subsId;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_simHplmn, 0);
}

@end
