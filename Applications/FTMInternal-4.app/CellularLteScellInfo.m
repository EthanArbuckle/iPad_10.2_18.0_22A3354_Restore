@implementation CellularLteScellInfo

- (void)setTimestamp:(unint64_t)a3
{
  *(_DWORD *)&self->_has |= 1u;
  self->_timestamp = a3;
}

- (void)setHasTimestamp:(BOOL)a3
{
  self->_has = ($B447797CE4B35B31ADD9032D7D2FFCDF)(*(_DWORD *)&self->_has & 0xFFFFFFFE | a3);
}

- (BOOL)hasTimestamp
{
  return *(_DWORD *)&self->_has & 1;
}

- (void)setPhyCellId:(unsigned int)a3
{
  *(_DWORD *)&self->_has |= 0x200u;
  self->_phyCellId = a3;
}

- (void)setHasPhyCellId:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 512;
  else
    v3 = 0;
  self->_has = ($B447797CE4B35B31ADD9032D7D2FFCDF)(*(_DWORD *)&self->_has & 0xFFFFFDFF | v3);
}

- (BOOL)hasPhyCellId
{
  return (*((unsigned __int8 *)&self->_has + 1) >> 1) & 1;
}

- (void)setDlFreq:(unsigned int)a3
{
  *(_DWORD *)&self->_has |= 0x10u;
  self->_dlFreq = a3;
}

- (void)setHasDlFreq:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 16;
  else
    v3 = 0;
  self->_has = ($B447797CE4B35B31ADD9032D7D2FFCDF)(*(_DWORD *)&self->_has & 0xFFFFFFEF | v3);
}

- (BOOL)hasDlFreq
{
  return (*(_BYTE *)&self->_has >> 4) & 1;
}

- (void)setUlFreq:(unsigned int)a3
{
  *(_DWORD *)&self->_has |= 0x80000u;
  self->_ulFreq = a3;
}

- (void)setHasUlFreq:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 0x80000;
  else
    v3 = 0;
  self->_has = ($B447797CE4B35B31ADD9032D7D2FFCDF)(*(_DWORD *)&self->_has & 0xFFF7FFFF | v3);
}

- (BOOL)hasUlFreq
{
  return (*((unsigned __int8 *)&self->_has + 2) >> 3) & 1;
}

- (void)setDlBw:(unsigned int)a3
{
  *(_DWORD *)&self->_has |= 8u;
  self->_dlBw = a3;
}

- (void)setHasDlBw:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 8;
  else
    v3 = 0;
  self->_has = ($B447797CE4B35B31ADD9032D7D2FFCDF)(*(_DWORD *)&self->_has & 0xFFFFFFF7 | v3);
}

- (BOOL)hasDlBw
{
  return (*(_BYTE *)&self->_has >> 3) & 1;
}

- (void)setUlBw:(unsigned int)a3
{
  *(_DWORD *)&self->_has |= 0x40000u;
  self->_ulBw = a3;
}

- (void)setHasUlBw:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 0x40000;
  else
    v3 = 0;
  self->_has = ($B447797CE4B35B31ADD9032D7D2FFCDF)(*(_DWORD *)&self->_has & 0xFFFBFFFF | v3);
}

- (BOOL)hasUlBw
{
  return (*((unsigned __int8 *)&self->_has + 2) >> 2) & 1;
}

- (void)setCellId:(unsigned int)a3
{
  *(_DWORD *)&self->_has |= 4u;
  self->_cellId = a3;
}

- (void)setHasCellId:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 4;
  else
    v3 = 0;
  self->_has = ($B447797CE4B35B31ADD9032D7D2FFCDF)(*(_DWORD *)&self->_has & 0xFFFFFFFB | v3);
}

- (BOOL)hasCellId
{
  return (*(_BYTE *)&self->_has >> 2) & 1;
}

- (void)setFreqBandInd:(unsigned int)a3
{
  *(_DWORD *)&self->_has |= 0x20u;
  self->_freqBandInd = a3;
}

- (void)setHasFreqBandInd:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 32;
  else
    v3 = 0;
  self->_has = ($B447797CE4B35B31ADD9032D7D2FFCDF)(*(_DWORD *)&self->_has & 0xFFFFFFDF | v3);
}

- (BOOL)hasFreqBandInd
{
  return (*(_BYTE *)&self->_has >> 5) & 1;
}

- (void)setTrackingAreaCode:(unsigned int)a3
{
  *(_DWORD *)&self->_has |= 0x20000u;
  self->_trackingAreaCode = a3;
}

- (void)setHasTrackingAreaCode:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 0x20000;
  else
    v3 = 0;
  self->_has = ($B447797CE4B35B31ADD9032D7D2FFCDF)(*(_DWORD *)&self->_has & 0xFFFDFFFF | v3);
}

- (BOOL)hasTrackingAreaCode
{
  return (*((unsigned __int8 *)&self->_has + 2) >> 1) & 1;
}

- (void)setNumMncDigits:(unsigned int)a3
{
  *(_DWORD *)&self->_has |= 0x80u;
  self->_numMncDigits = a3;
}

- (void)setHasNumMncDigits:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 128;
  else
    v3 = 0;
  self->_has = ($B447797CE4B35B31ADD9032D7D2FFCDF)(*(_DWORD *)&self->_has & 0xFFFFFF7F | v3);
}

- (BOOL)hasNumMncDigits
{
  return *(_BYTE *)&self->_has >> 7;
}

- (void)setSelPlmnMcc:(unsigned int)a3
{
  *(_DWORD *)&self->_has |= 0x1000u;
  self->_selPlmnMcc = a3;
}

- (void)setHasSelPlmnMcc:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 4096;
  else
    v3 = 0;
  self->_has = ($B447797CE4B35B31ADD9032D7D2FFCDF)(*(_DWORD *)&self->_has & 0xFFFFEFFF | v3);
}

- (BOOL)hasSelPlmnMcc
{
  return (*((unsigned __int8 *)&self->_has + 1) >> 4) & 1;
}

- (void)setSelPlmnMnc:(unsigned int)a3
{
  *(_DWORD *)&self->_has |= 0x2000u;
  self->_selPlmnMnc = a3;
}

- (void)setHasSelPlmnMnc:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 0x2000;
  else
    v3 = 0;
  self->_has = ($B447797CE4B35B31ADD9032D7D2FFCDF)(*(_DWORD *)&self->_has & 0xFFFFDFFF | v3);
}

- (BOOL)hasSelPlmnMnc
{
  return (*((unsigned __int8 *)&self->_has + 1) >> 5) & 1;
}

- (void)setAllowedAccess:(unsigned int)a3
{
  *(_DWORD *)&self->_has |= 2u;
  self->_allowedAccess = a3;
}

- (void)setHasAllowedAccess:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  self->_has = ($B447797CE4B35B31ADD9032D7D2FFCDF)(*(_DWORD *)&self->_has & 0xFFFFFFFD | v3);
}

- (BOOL)hasAllowedAccess
{
  return (*(_BYTE *)&self->_has >> 1) & 1;
}

- (void)setTddSfAssignment:(unsigned int)a3
{
  *(_DWORD *)&self->_has |= 0x8000u;
  self->_tddSfAssignment = a3;
}

- (void)setHasTddSfAssignment:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 0x8000;
  else
    v3 = 0;
  self->_has = ($B447797CE4B35B31ADD9032D7D2FFCDF)(*(_DWORD *)&self->_has & 0xFFFF7FFF | v3);
}

- (BOOL)hasTddSfAssignment
{
  return *((unsigned __int8 *)&self->_has + 1) >> 7;
}

- (void)setTddSsfPatterns:(unsigned int)a3
{
  *(_DWORD *)&self->_has |= 0x10000u;
  self->_tddSsfPatterns = a3;
}

- (void)setHasTddSsfPatterns:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 0x10000;
  else
    v3 = 0;
  self->_has = ($B447797CE4B35B31ADD9032D7D2FFCDF)(*(_DWORD *)&self->_has & 0xFFFEFFFF | v3);
}

- (BOOL)hasTddSsfPatterns
{
  return *((_BYTE *)&self->_has + 2) & 1;
}

- (void)setCellIsApo:(BOOL)a3
{
  *(_DWORD *)&self->_has |= 0x100000u;
  self->_cellIsApo = a3;
}

- (void)setHasCellIsApo:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 0x100000;
  else
    v3 = 0;
  self->_has = ($B447797CE4B35B31ADD9032D7D2FFCDF)(*(_DWORD *)&self->_has & 0xFFEFFFFF | v3);
}

- (BOOL)hasCellIsApo
{
  return (*((unsigned __int8 *)&self->_has + 2) >> 4) & 1;
}

- (void)setHstCellInfo:(unsigned int)a3
{
  *(_DWORD *)&self->_has |= 0x40u;
  self->_hstCellInfo = a3;
}

- (void)setHasHstCellInfo:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 64;
  else
    v3 = 0;
  self->_has = ($B447797CE4B35B31ADD9032D7D2FFCDF)(*(_DWORD *)&self->_has & 0xFFFFFFBF | v3);
}

- (BOOL)hasHstCellInfo
{
  return (*(_BYTE *)&self->_has >> 6) & 1;
}

- (void)setPrioOfCampedLteBand:(unsigned int)a3
{
  *(_DWORD *)&self->_has |= 0x400u;
  self->_prioOfCampedLteBand = a3;
}

- (void)setHasPrioOfCampedLteBand:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 1024;
  else
    v3 = 0;
  self->_has = ($B447797CE4B35B31ADD9032D7D2FFCDF)(*(_DWORD *)&self->_has & 0xFFFFFBFF | v3);
}

- (BOOL)hasPrioOfCampedLteBand
{
  return (*((unsigned __int8 *)&self->_has + 1) >> 2) & 1;
}

- (void)setNumSubs:(unsigned int)a3
{
  *(_DWORD *)&self->_has |= 0x100u;
  self->_numSubs = a3;
}

- (void)setHasNumSubs:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 256;
  else
    v3 = 0;
  self->_has = ($B447797CE4B35B31ADD9032D7D2FFCDF)(*(_DWORD *)&self->_has & 0xFFFFFEFF | v3);
}

- (BOOL)hasNumSubs
{
  return *((_BYTE *)&self->_has + 1) & 1;
}

- (BOOL)hasSimHplmn
{
  return self->_simHplmn != 0;
}

- (void)setSubsId:(unsigned int)a3
{
  *(_DWORD *)&self->_has |= 0x4000u;
  self->_subsId = a3;
}

- (void)setHasSubsId:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 0x4000;
  else
    v3 = 0;
  self->_has = ($B447797CE4B35B31ADD9032D7D2FFCDF)(*(_DWORD *)&self->_has & 0xFFFFBFFF | v3);
}

- (BOOL)hasSubsId
{
  return (*((unsigned __int8 *)&self->_has + 1) >> 6) & 1;
}

- (void)setPsPref:(unsigned int)a3
{
  *(_DWORD *)&self->_has |= 0x800u;
  self->_psPref = a3;
}

- (void)setHasPsPref:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 2048;
  else
    v3 = 0;
  self->_has = ($B447797CE4B35B31ADD9032D7D2FFCDF)(*(_DWORD *)&self->_has & 0xFFFFF7FF | v3);
}

- (BOOL)hasPsPref
{
  return (*((unsigned __int8 *)&self->_has + 1) >> 3) & 1;
}

- (id)description
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)CellularLteScellInfo;
  v3 = -[CellularLteScellInfo description](&v8, "description");
  v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[CellularLteScellInfo dictionaryRepresentation](self, "dictionaryRepresentation"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@ %@"), v4, v5));

  return v6;
}

- (id)dictionaryRepresentation
{
  void *v3;
  $B447797CE4B35B31ADD9032D7D2FFCDF has;
  void *v5;
  NSData *simHplmn;
  $B447797CE4B35B31ADD9032D7D2FFCDF v7;
  void *v8;
  void *v9;
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
  void *v25;
  void *v26;
  void *v27;
  void *v28;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary"));
  has = self->_has;
  if ((*(_BYTE *)&has & 1) != 0)
  {
    v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedLongLong:](NSNumber, "numberWithUnsignedLongLong:", self->_timestamp));
    objc_msgSend(v3, "setObject:forKey:", v11, CFSTR("timestamp"));

    has = self->_has;
    if ((*(_WORD *)&has & 0x200) == 0)
    {
LABEL_3:
      if ((*(_BYTE *)&has & 0x10) == 0)
        goto LABEL_4;
      goto LABEL_30;
    }
  }
  else if ((*(_WORD *)&has & 0x200) == 0)
  {
    goto LABEL_3;
  }
  v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", self->_phyCellId));
  objc_msgSend(v3, "setObject:forKey:", v12, CFSTR("phy_cell_id"));

  has = self->_has;
  if ((*(_BYTE *)&has & 0x10) == 0)
  {
LABEL_4:
    if ((*(_DWORD *)&has & 0x80000) == 0)
      goto LABEL_5;
    goto LABEL_31;
  }
LABEL_30:
  v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", self->_dlFreq));
  objc_msgSend(v3, "setObject:forKey:", v13, CFSTR("dl_freq"));

  has = self->_has;
  if ((*(_DWORD *)&has & 0x80000) == 0)
  {
LABEL_5:
    if ((*(_BYTE *)&has & 8) == 0)
      goto LABEL_6;
    goto LABEL_32;
  }
LABEL_31:
  v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", self->_ulFreq));
  objc_msgSend(v3, "setObject:forKey:", v14, CFSTR("ul_freq"));

  has = self->_has;
  if ((*(_BYTE *)&has & 8) == 0)
  {
LABEL_6:
    if ((*(_DWORD *)&has & 0x40000) == 0)
      goto LABEL_7;
    goto LABEL_33;
  }
LABEL_32:
  v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", self->_dlBw));
  objc_msgSend(v3, "setObject:forKey:", v15, CFSTR("dl_bw"));

  has = self->_has;
  if ((*(_DWORD *)&has & 0x40000) == 0)
  {
LABEL_7:
    if ((*(_BYTE *)&has & 4) == 0)
      goto LABEL_8;
    goto LABEL_34;
  }
LABEL_33:
  v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", self->_ulBw));
  objc_msgSend(v3, "setObject:forKey:", v16, CFSTR("ul_bw"));

  has = self->_has;
  if ((*(_BYTE *)&has & 4) == 0)
  {
LABEL_8:
    if ((*(_BYTE *)&has & 0x20) == 0)
      goto LABEL_9;
    goto LABEL_35;
  }
LABEL_34:
  v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", self->_cellId));
  objc_msgSend(v3, "setObject:forKey:", v17, CFSTR("cell_id"));

  has = self->_has;
  if ((*(_BYTE *)&has & 0x20) == 0)
  {
LABEL_9:
    if ((*(_DWORD *)&has & 0x20000) == 0)
      goto LABEL_10;
    goto LABEL_36;
  }
LABEL_35:
  v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", self->_freqBandInd));
  objc_msgSend(v3, "setObject:forKey:", v18, CFSTR("freq_band_ind"));

  has = self->_has;
  if ((*(_DWORD *)&has & 0x20000) == 0)
  {
LABEL_10:
    if ((*(_BYTE *)&has & 0x80) == 0)
      goto LABEL_11;
    goto LABEL_37;
  }
LABEL_36:
  v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", self->_trackingAreaCode));
  objc_msgSend(v3, "setObject:forKey:", v19, CFSTR("tracking_area_code"));

  has = self->_has;
  if ((*(_BYTE *)&has & 0x80) == 0)
  {
LABEL_11:
    if ((*(_WORD *)&has & 0x1000) == 0)
      goto LABEL_12;
    goto LABEL_38;
  }
LABEL_37:
  v20 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", self->_numMncDigits));
  objc_msgSend(v3, "setObject:forKey:", v20, CFSTR("num_mnc_digits"));

  has = self->_has;
  if ((*(_WORD *)&has & 0x1000) == 0)
  {
LABEL_12:
    if ((*(_WORD *)&has & 0x2000) == 0)
      goto LABEL_13;
    goto LABEL_39;
  }
LABEL_38:
  v21 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", self->_selPlmnMcc));
  objc_msgSend(v3, "setObject:forKey:", v21, CFSTR("sel_plmn_mcc"));

  has = self->_has;
  if ((*(_WORD *)&has & 0x2000) == 0)
  {
LABEL_13:
    if ((*(_BYTE *)&has & 2) == 0)
      goto LABEL_14;
    goto LABEL_40;
  }
LABEL_39:
  v22 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", self->_selPlmnMnc));
  objc_msgSend(v3, "setObject:forKey:", v22, CFSTR("sel_plmn_mnc"));

  has = self->_has;
  if ((*(_BYTE *)&has & 2) == 0)
  {
LABEL_14:
    if ((*(_WORD *)&has & 0x8000) == 0)
      goto LABEL_15;
    goto LABEL_41;
  }
LABEL_40:
  v23 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", self->_allowedAccess));
  objc_msgSend(v3, "setObject:forKey:", v23, CFSTR("allowed_access"));

  has = self->_has;
  if ((*(_WORD *)&has & 0x8000) == 0)
  {
LABEL_15:
    if ((*(_DWORD *)&has & 0x10000) == 0)
      goto LABEL_16;
    goto LABEL_42;
  }
LABEL_41:
  v24 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", self->_tddSfAssignment));
  objc_msgSend(v3, "setObject:forKey:", v24, CFSTR("tdd_sf_assignment"));

  has = self->_has;
  if ((*(_DWORD *)&has & 0x10000) == 0)
  {
LABEL_16:
    if ((*(_DWORD *)&has & 0x100000) == 0)
      goto LABEL_17;
    goto LABEL_43;
  }
LABEL_42:
  v25 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", self->_tddSsfPatterns));
  objc_msgSend(v3, "setObject:forKey:", v25, CFSTR("tdd_ssf_patterns"));

  has = self->_has;
  if ((*(_DWORD *)&has & 0x100000) == 0)
  {
LABEL_17:
    if ((*(_BYTE *)&has & 0x40) == 0)
      goto LABEL_18;
    goto LABEL_44;
  }
LABEL_43:
  v26 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", self->_cellIsApo));
  objc_msgSend(v3, "setObject:forKey:", v26, CFSTR("cell_is_apo"));

  has = self->_has;
  if ((*(_BYTE *)&has & 0x40) == 0)
  {
LABEL_18:
    if ((*(_WORD *)&has & 0x400) == 0)
      goto LABEL_19;
    goto LABEL_45;
  }
LABEL_44:
  v27 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", self->_hstCellInfo));
  objc_msgSend(v3, "setObject:forKey:", v27, CFSTR("hst_cell_info"));

  has = self->_has;
  if ((*(_WORD *)&has & 0x400) == 0)
  {
LABEL_19:
    if ((*(_WORD *)&has & 0x100) == 0)
      goto LABEL_21;
    goto LABEL_20;
  }
LABEL_45:
  v28 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", self->_prioOfCampedLteBand));
  objc_msgSend(v3, "setObject:forKey:", v28, CFSTR("prio_of_camped_lte_band"));

  if ((*(_DWORD *)&self->_has & 0x100) != 0)
  {
LABEL_20:
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", self->_numSubs));
    objc_msgSend(v3, "setObject:forKey:", v5, CFSTR("num_subs"));

  }
LABEL_21:
  simHplmn = self->_simHplmn;
  if (simHplmn)
    objc_msgSend(v3, "setObject:forKey:", simHplmn, CFSTR("sim_hplmn"));
  v7 = self->_has;
  if ((*(_WORD *)&v7 & 0x4000) != 0)
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", self->_subsId));
    objc_msgSend(v3, "setObject:forKey:", v8, CFSTR("subs_id"));

    v7 = self->_has;
  }
  if ((*(_WORD *)&v7 & 0x800) != 0)
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", self->_psPref));
    objc_msgSend(v3, "setObject:forKey:", v9, CFSTR("ps_pref"));

  }
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return sub_1001260C0((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  $B447797CE4B35B31ADD9032D7D2FFCDF has;
  NSData *simHplmn;
  $B447797CE4B35B31ADD9032D7D2FFCDF v6;
  id v7;

  v7 = a3;
  has = self->_has;
  if ((*(_BYTE *)&has & 1) != 0)
  {
    PBDataWriterWriteUint64Field(v7, self->_timestamp, 1);
    has = self->_has;
    if ((*(_WORD *)&has & 0x200) == 0)
    {
LABEL_3:
      if ((*(_BYTE *)&has & 0x10) == 0)
        goto LABEL_4;
      goto LABEL_30;
    }
  }
  else if ((*(_WORD *)&has & 0x200) == 0)
  {
    goto LABEL_3;
  }
  PBDataWriterWriteUint32Field(v7, self->_phyCellId, 2);
  has = self->_has;
  if ((*(_BYTE *)&has & 0x10) == 0)
  {
LABEL_4:
    if ((*(_DWORD *)&has & 0x80000) == 0)
      goto LABEL_5;
    goto LABEL_31;
  }
LABEL_30:
  PBDataWriterWriteUint32Field(v7, self->_dlFreq, 3);
  has = self->_has;
  if ((*(_DWORD *)&has & 0x80000) == 0)
  {
LABEL_5:
    if ((*(_BYTE *)&has & 8) == 0)
      goto LABEL_6;
    goto LABEL_32;
  }
LABEL_31:
  PBDataWriterWriteUint32Field(v7, self->_ulFreq, 4);
  has = self->_has;
  if ((*(_BYTE *)&has & 8) == 0)
  {
LABEL_6:
    if ((*(_DWORD *)&has & 0x40000) == 0)
      goto LABEL_7;
    goto LABEL_33;
  }
LABEL_32:
  PBDataWriterWriteUint32Field(v7, self->_dlBw, 5);
  has = self->_has;
  if ((*(_DWORD *)&has & 0x40000) == 0)
  {
LABEL_7:
    if ((*(_BYTE *)&has & 4) == 0)
      goto LABEL_8;
    goto LABEL_34;
  }
LABEL_33:
  PBDataWriterWriteUint32Field(v7, self->_ulBw, 6);
  has = self->_has;
  if ((*(_BYTE *)&has & 4) == 0)
  {
LABEL_8:
    if ((*(_BYTE *)&has & 0x20) == 0)
      goto LABEL_9;
    goto LABEL_35;
  }
LABEL_34:
  PBDataWriterWriteUint32Field(v7, self->_cellId, 7);
  has = self->_has;
  if ((*(_BYTE *)&has & 0x20) == 0)
  {
LABEL_9:
    if ((*(_DWORD *)&has & 0x20000) == 0)
      goto LABEL_10;
    goto LABEL_36;
  }
LABEL_35:
  PBDataWriterWriteUint32Field(v7, self->_freqBandInd, 8);
  has = self->_has;
  if ((*(_DWORD *)&has & 0x20000) == 0)
  {
LABEL_10:
    if ((*(_BYTE *)&has & 0x80) == 0)
      goto LABEL_11;
    goto LABEL_37;
  }
LABEL_36:
  PBDataWriterWriteUint32Field(v7, self->_trackingAreaCode, 9);
  has = self->_has;
  if ((*(_BYTE *)&has & 0x80) == 0)
  {
LABEL_11:
    if ((*(_WORD *)&has & 0x1000) == 0)
      goto LABEL_12;
    goto LABEL_38;
  }
LABEL_37:
  PBDataWriterWriteUint32Field(v7, self->_numMncDigits, 10);
  has = self->_has;
  if ((*(_WORD *)&has & 0x1000) == 0)
  {
LABEL_12:
    if ((*(_WORD *)&has & 0x2000) == 0)
      goto LABEL_13;
    goto LABEL_39;
  }
LABEL_38:
  PBDataWriterWriteUint32Field(v7, self->_selPlmnMcc, 11);
  has = self->_has;
  if ((*(_WORD *)&has & 0x2000) == 0)
  {
LABEL_13:
    if ((*(_BYTE *)&has & 2) == 0)
      goto LABEL_14;
    goto LABEL_40;
  }
LABEL_39:
  PBDataWriterWriteUint32Field(v7, self->_selPlmnMnc, 12);
  has = self->_has;
  if ((*(_BYTE *)&has & 2) == 0)
  {
LABEL_14:
    if ((*(_WORD *)&has & 0x8000) == 0)
      goto LABEL_15;
    goto LABEL_41;
  }
LABEL_40:
  PBDataWriterWriteUint32Field(v7, self->_allowedAccess, 13);
  has = self->_has;
  if ((*(_WORD *)&has & 0x8000) == 0)
  {
LABEL_15:
    if ((*(_DWORD *)&has & 0x10000) == 0)
      goto LABEL_16;
    goto LABEL_42;
  }
LABEL_41:
  PBDataWriterWriteUint32Field(v7, self->_tddSfAssignment, 14);
  has = self->_has;
  if ((*(_DWORD *)&has & 0x10000) == 0)
  {
LABEL_16:
    if ((*(_DWORD *)&has & 0x100000) == 0)
      goto LABEL_17;
    goto LABEL_43;
  }
LABEL_42:
  PBDataWriterWriteUint32Field(v7, self->_tddSsfPatterns, 15);
  has = self->_has;
  if ((*(_DWORD *)&has & 0x100000) == 0)
  {
LABEL_17:
    if ((*(_BYTE *)&has & 0x40) == 0)
      goto LABEL_18;
    goto LABEL_44;
  }
LABEL_43:
  PBDataWriterWriteBOOLField(v7, self->_cellIsApo, 16);
  has = self->_has;
  if ((*(_BYTE *)&has & 0x40) == 0)
  {
LABEL_18:
    if ((*(_WORD *)&has & 0x400) == 0)
      goto LABEL_19;
    goto LABEL_45;
  }
LABEL_44:
  PBDataWriterWriteUint32Field(v7, self->_hstCellInfo, 17);
  has = self->_has;
  if ((*(_WORD *)&has & 0x400) == 0)
  {
LABEL_19:
    if ((*(_WORD *)&has & 0x100) == 0)
      goto LABEL_21;
    goto LABEL_20;
  }
LABEL_45:
  PBDataWriterWriteUint32Field(v7, self->_prioOfCampedLteBand, 20);
  if ((*(_DWORD *)&self->_has & 0x100) != 0)
LABEL_20:
    PBDataWriterWriteUint32Field(v7, self->_numSubs, 21);
LABEL_21:
  simHplmn = self->_simHplmn;
  if (simHplmn)
    PBDataWriterWriteDataField(v7, simHplmn, 22);
  v6 = self->_has;
  if ((*(_WORD *)&v6 & 0x4000) != 0)
  {
    PBDataWriterWriteUint32Field(v7, self->_subsId, 23);
    v6 = self->_has;
  }
  if ((*(_WORD *)&v6 & 0x800) != 0)
    PBDataWriterWriteUint32Field(v7, self->_psPref, 24);

}

- (void)copyTo:(id)a3
{
  _QWORD *v4;
  $B447797CE4B35B31ADD9032D7D2FFCDF has;
  $B447797CE4B35B31ADD9032D7D2FFCDF v6;
  _QWORD *v7;

  v4 = a3;
  has = self->_has;
  if ((*(_BYTE *)&has & 1) != 0)
  {
    v4[1] = self->_timestamp;
    *((_DWORD *)v4 + 27) |= 1u;
    has = self->_has;
    if ((*(_WORD *)&has & 0x200) == 0)
    {
LABEL_3:
      if ((*(_BYTE *)&has & 0x10) == 0)
        goto LABEL_4;
      goto LABEL_30;
    }
  }
  else if ((*(_WORD *)&has & 0x200) == 0)
  {
    goto LABEL_3;
  }
  *((_DWORD *)v4 + 12) = self->_phyCellId;
  *((_DWORD *)v4 + 27) |= 0x200u;
  has = self->_has;
  if ((*(_BYTE *)&has & 0x10) == 0)
  {
LABEL_4:
    if ((*(_DWORD *)&has & 0x80000) == 0)
      goto LABEL_5;
    goto LABEL_31;
  }
LABEL_30:
  *((_DWORD *)v4 + 7) = self->_dlFreq;
  *((_DWORD *)v4 + 27) |= 0x10u;
  has = self->_has;
  if ((*(_DWORD *)&has & 0x80000) == 0)
  {
LABEL_5:
    if ((*(_BYTE *)&has & 8) == 0)
      goto LABEL_6;
    goto LABEL_32;
  }
LABEL_31:
  *((_DWORD *)v4 + 25) = self->_ulFreq;
  *((_DWORD *)v4 + 27) |= 0x80000u;
  has = self->_has;
  if ((*(_BYTE *)&has & 8) == 0)
  {
LABEL_6:
    if ((*(_DWORD *)&has & 0x40000) == 0)
      goto LABEL_7;
    goto LABEL_33;
  }
LABEL_32:
  *((_DWORD *)v4 + 6) = self->_dlBw;
  *((_DWORD *)v4 + 27) |= 8u;
  has = self->_has;
  if ((*(_DWORD *)&has & 0x40000) == 0)
  {
LABEL_7:
    if ((*(_BYTE *)&has & 4) == 0)
      goto LABEL_8;
    goto LABEL_34;
  }
LABEL_33:
  *((_DWORD *)v4 + 24) = self->_ulBw;
  *((_DWORD *)v4 + 27) |= 0x40000u;
  has = self->_has;
  if ((*(_BYTE *)&has & 4) == 0)
  {
LABEL_8:
    if ((*(_BYTE *)&has & 0x20) == 0)
      goto LABEL_9;
    goto LABEL_35;
  }
LABEL_34:
  *((_DWORD *)v4 + 5) = self->_cellId;
  *((_DWORD *)v4 + 27) |= 4u;
  has = self->_has;
  if ((*(_BYTE *)&has & 0x20) == 0)
  {
LABEL_9:
    if ((*(_DWORD *)&has & 0x20000) == 0)
      goto LABEL_10;
    goto LABEL_36;
  }
LABEL_35:
  *((_DWORD *)v4 + 8) = self->_freqBandInd;
  *((_DWORD *)v4 + 27) |= 0x20u;
  has = self->_has;
  if ((*(_DWORD *)&has & 0x20000) == 0)
  {
LABEL_10:
    if ((*(_BYTE *)&has & 0x80) == 0)
      goto LABEL_11;
    goto LABEL_37;
  }
LABEL_36:
  *((_DWORD *)v4 + 23) = self->_trackingAreaCode;
  *((_DWORD *)v4 + 27) |= 0x20000u;
  has = self->_has;
  if ((*(_BYTE *)&has & 0x80) == 0)
  {
LABEL_11:
    if ((*(_WORD *)&has & 0x1000) == 0)
      goto LABEL_12;
    goto LABEL_38;
  }
LABEL_37:
  *((_DWORD *)v4 + 10) = self->_numMncDigits;
  *((_DWORD *)v4 + 27) |= 0x80u;
  has = self->_has;
  if ((*(_WORD *)&has & 0x1000) == 0)
  {
LABEL_12:
    if ((*(_WORD *)&has & 0x2000) == 0)
      goto LABEL_13;
    goto LABEL_39;
  }
LABEL_38:
  *((_DWORD *)v4 + 15) = self->_selPlmnMcc;
  *((_DWORD *)v4 + 27) |= 0x1000u;
  has = self->_has;
  if ((*(_WORD *)&has & 0x2000) == 0)
  {
LABEL_13:
    if ((*(_BYTE *)&has & 2) == 0)
      goto LABEL_14;
    goto LABEL_40;
  }
LABEL_39:
  *((_DWORD *)v4 + 16) = self->_selPlmnMnc;
  *((_DWORD *)v4 + 27) |= 0x2000u;
  has = self->_has;
  if ((*(_BYTE *)&has & 2) == 0)
  {
LABEL_14:
    if ((*(_WORD *)&has & 0x8000) == 0)
      goto LABEL_15;
    goto LABEL_41;
  }
LABEL_40:
  *((_DWORD *)v4 + 4) = self->_allowedAccess;
  *((_DWORD *)v4 + 27) |= 2u;
  has = self->_has;
  if ((*(_WORD *)&has & 0x8000) == 0)
  {
LABEL_15:
    if ((*(_DWORD *)&has & 0x10000) == 0)
      goto LABEL_16;
    goto LABEL_42;
  }
LABEL_41:
  *((_DWORD *)v4 + 21) = self->_tddSfAssignment;
  *((_DWORD *)v4 + 27) |= 0x8000u;
  has = self->_has;
  if ((*(_DWORD *)&has & 0x10000) == 0)
  {
LABEL_16:
    if ((*(_DWORD *)&has & 0x100000) == 0)
      goto LABEL_17;
    goto LABEL_43;
  }
LABEL_42:
  *((_DWORD *)v4 + 22) = self->_tddSsfPatterns;
  *((_DWORD *)v4 + 27) |= 0x10000u;
  has = self->_has;
  if ((*(_DWORD *)&has & 0x100000) == 0)
  {
LABEL_17:
    if ((*(_BYTE *)&has & 0x40) == 0)
      goto LABEL_18;
    goto LABEL_44;
  }
LABEL_43:
  *((_BYTE *)v4 + 104) = self->_cellIsApo;
  *((_DWORD *)v4 + 27) |= 0x100000u;
  has = self->_has;
  if ((*(_BYTE *)&has & 0x40) == 0)
  {
LABEL_18:
    if ((*(_WORD *)&has & 0x400) == 0)
      goto LABEL_19;
    goto LABEL_45;
  }
LABEL_44:
  *((_DWORD *)v4 + 9) = self->_hstCellInfo;
  *((_DWORD *)v4 + 27) |= 0x40u;
  has = self->_has;
  if ((*(_WORD *)&has & 0x400) == 0)
  {
LABEL_19:
    if ((*(_WORD *)&has & 0x100) == 0)
      goto LABEL_21;
    goto LABEL_20;
  }
LABEL_45:
  *((_DWORD *)v4 + 13) = self->_prioOfCampedLteBand;
  *((_DWORD *)v4 + 27) |= 0x400u;
  if ((*(_DWORD *)&self->_has & 0x100) != 0)
  {
LABEL_20:
    *((_DWORD *)v4 + 11) = self->_numSubs;
    *((_DWORD *)v4 + 27) |= 0x100u;
  }
LABEL_21:
  if (self->_simHplmn)
  {
    v7 = v4;
    objc_msgSend(v4, "setSimHplmn:");
    v4 = v7;
  }
  v6 = self->_has;
  if ((*(_WORD *)&v6 & 0x4000) != 0)
  {
    *((_DWORD *)v4 + 20) = self->_subsId;
    *((_DWORD *)v4 + 27) |= 0x4000u;
    v6 = self->_has;
  }
  if ((*(_WORD *)&v6 & 0x800) != 0)
  {
    *((_DWORD *)v4 + 14) = self->_psPref;
    *((_DWORD *)v4 + 27) |= 0x800u;
  }

}

- (id)copyWithZone:(_NSZone *)a3
{
  _QWORD *v5;
  _QWORD *v6;
  $B447797CE4B35B31ADD9032D7D2FFCDF has;
  id v8;
  void *v9;
  $B447797CE4B35B31ADD9032D7D2FFCDF v10;

  v5 = objc_msgSend(objc_msgSend((id)objc_opt_class(self, a2), "allocWithZone:", a3), "init");
  v6 = v5;
  has = self->_has;
  if ((*(_BYTE *)&has & 1) != 0)
  {
    v5[1] = self->_timestamp;
    *((_DWORD *)v5 + 27) |= 1u;
    has = self->_has;
    if ((*(_WORD *)&has & 0x200) == 0)
    {
LABEL_3:
      if ((*(_BYTE *)&has & 0x10) == 0)
        goto LABEL_4;
      goto LABEL_28;
    }
  }
  else if ((*(_WORD *)&has & 0x200) == 0)
  {
    goto LABEL_3;
  }
  *((_DWORD *)v5 + 12) = self->_phyCellId;
  *((_DWORD *)v5 + 27) |= 0x200u;
  has = self->_has;
  if ((*(_BYTE *)&has & 0x10) == 0)
  {
LABEL_4:
    if ((*(_DWORD *)&has & 0x80000) == 0)
      goto LABEL_5;
    goto LABEL_29;
  }
LABEL_28:
  *((_DWORD *)v5 + 7) = self->_dlFreq;
  *((_DWORD *)v5 + 27) |= 0x10u;
  has = self->_has;
  if ((*(_DWORD *)&has & 0x80000) == 0)
  {
LABEL_5:
    if ((*(_BYTE *)&has & 8) == 0)
      goto LABEL_6;
    goto LABEL_30;
  }
LABEL_29:
  *((_DWORD *)v5 + 25) = self->_ulFreq;
  *((_DWORD *)v5 + 27) |= 0x80000u;
  has = self->_has;
  if ((*(_BYTE *)&has & 8) == 0)
  {
LABEL_6:
    if ((*(_DWORD *)&has & 0x40000) == 0)
      goto LABEL_7;
    goto LABEL_31;
  }
LABEL_30:
  *((_DWORD *)v5 + 6) = self->_dlBw;
  *((_DWORD *)v5 + 27) |= 8u;
  has = self->_has;
  if ((*(_DWORD *)&has & 0x40000) == 0)
  {
LABEL_7:
    if ((*(_BYTE *)&has & 4) == 0)
      goto LABEL_8;
    goto LABEL_32;
  }
LABEL_31:
  *((_DWORD *)v5 + 24) = self->_ulBw;
  *((_DWORD *)v5 + 27) |= 0x40000u;
  has = self->_has;
  if ((*(_BYTE *)&has & 4) == 0)
  {
LABEL_8:
    if ((*(_BYTE *)&has & 0x20) == 0)
      goto LABEL_9;
    goto LABEL_33;
  }
LABEL_32:
  *((_DWORD *)v5 + 5) = self->_cellId;
  *((_DWORD *)v5 + 27) |= 4u;
  has = self->_has;
  if ((*(_BYTE *)&has & 0x20) == 0)
  {
LABEL_9:
    if ((*(_DWORD *)&has & 0x20000) == 0)
      goto LABEL_10;
    goto LABEL_34;
  }
LABEL_33:
  *((_DWORD *)v5 + 8) = self->_freqBandInd;
  *((_DWORD *)v5 + 27) |= 0x20u;
  has = self->_has;
  if ((*(_DWORD *)&has & 0x20000) == 0)
  {
LABEL_10:
    if ((*(_BYTE *)&has & 0x80) == 0)
      goto LABEL_11;
    goto LABEL_35;
  }
LABEL_34:
  *((_DWORD *)v5 + 23) = self->_trackingAreaCode;
  *((_DWORD *)v5 + 27) |= 0x20000u;
  has = self->_has;
  if ((*(_BYTE *)&has & 0x80) == 0)
  {
LABEL_11:
    if ((*(_WORD *)&has & 0x1000) == 0)
      goto LABEL_12;
    goto LABEL_36;
  }
LABEL_35:
  *((_DWORD *)v5 + 10) = self->_numMncDigits;
  *((_DWORD *)v5 + 27) |= 0x80u;
  has = self->_has;
  if ((*(_WORD *)&has & 0x1000) == 0)
  {
LABEL_12:
    if ((*(_WORD *)&has & 0x2000) == 0)
      goto LABEL_13;
    goto LABEL_37;
  }
LABEL_36:
  *((_DWORD *)v5 + 15) = self->_selPlmnMcc;
  *((_DWORD *)v5 + 27) |= 0x1000u;
  has = self->_has;
  if ((*(_WORD *)&has & 0x2000) == 0)
  {
LABEL_13:
    if ((*(_BYTE *)&has & 2) == 0)
      goto LABEL_14;
    goto LABEL_38;
  }
LABEL_37:
  *((_DWORD *)v5 + 16) = self->_selPlmnMnc;
  *((_DWORD *)v5 + 27) |= 0x2000u;
  has = self->_has;
  if ((*(_BYTE *)&has & 2) == 0)
  {
LABEL_14:
    if ((*(_WORD *)&has & 0x8000) == 0)
      goto LABEL_15;
    goto LABEL_39;
  }
LABEL_38:
  *((_DWORD *)v5 + 4) = self->_allowedAccess;
  *((_DWORD *)v5 + 27) |= 2u;
  has = self->_has;
  if ((*(_WORD *)&has & 0x8000) == 0)
  {
LABEL_15:
    if ((*(_DWORD *)&has & 0x10000) == 0)
      goto LABEL_16;
    goto LABEL_40;
  }
LABEL_39:
  *((_DWORD *)v5 + 21) = self->_tddSfAssignment;
  *((_DWORD *)v5 + 27) |= 0x8000u;
  has = self->_has;
  if ((*(_DWORD *)&has & 0x10000) == 0)
  {
LABEL_16:
    if ((*(_DWORD *)&has & 0x100000) == 0)
      goto LABEL_17;
    goto LABEL_41;
  }
LABEL_40:
  *((_DWORD *)v5 + 22) = self->_tddSsfPatterns;
  *((_DWORD *)v5 + 27) |= 0x10000u;
  has = self->_has;
  if ((*(_DWORD *)&has & 0x100000) == 0)
  {
LABEL_17:
    if ((*(_BYTE *)&has & 0x40) == 0)
      goto LABEL_18;
    goto LABEL_42;
  }
LABEL_41:
  *((_BYTE *)v5 + 104) = self->_cellIsApo;
  *((_DWORD *)v5 + 27) |= 0x100000u;
  has = self->_has;
  if ((*(_BYTE *)&has & 0x40) == 0)
  {
LABEL_18:
    if ((*(_WORD *)&has & 0x400) == 0)
      goto LABEL_19;
    goto LABEL_43;
  }
LABEL_42:
  *((_DWORD *)v5 + 9) = self->_hstCellInfo;
  *((_DWORD *)v5 + 27) |= 0x40u;
  has = self->_has;
  if ((*(_WORD *)&has & 0x400) == 0)
  {
LABEL_19:
    if ((*(_WORD *)&has & 0x100) == 0)
      goto LABEL_21;
    goto LABEL_20;
  }
LABEL_43:
  *((_DWORD *)v5 + 13) = self->_prioOfCampedLteBand;
  *((_DWORD *)v5 + 27) |= 0x400u;
  if ((*(_DWORD *)&self->_has & 0x100) != 0)
  {
LABEL_20:
    *((_DWORD *)v5 + 11) = self->_numSubs;
    *((_DWORD *)v5 + 27) |= 0x100u;
  }
LABEL_21:
  v8 = -[NSData copyWithZone:](self->_simHplmn, "copyWithZone:", a3);
  v9 = (void *)v6[9];
  v6[9] = v8;

  v10 = self->_has;
  if ((*(_WORD *)&v10 & 0x4000) != 0)
  {
    *((_DWORD *)v6 + 20) = self->_subsId;
    *((_DWORD *)v6 + 27) |= 0x4000u;
    v10 = self->_has;
  }
  if ((*(_WORD *)&v10 & 0x800) != 0)
  {
    *((_DWORD *)v6 + 14) = self->_psPref;
    *((_DWORD *)v6 + 27) |= 0x800u;
  }
  return v6;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  uint64_t v5;
  $B447797CE4B35B31ADD9032D7D2FFCDF has;
  int v7;
  NSData *simHplmn;
  int v9;
  BOOL v10;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class(self, v5)))
    goto LABEL_113;
  has = self->_has;
  v7 = *((_DWORD *)v4 + 27);
  if ((*(_BYTE *)&has & 1) != 0)
  {
    if ((v7 & 1) == 0 || self->_timestamp != *((_QWORD *)v4 + 1))
      goto LABEL_113;
  }
  else if ((v7 & 1) != 0)
  {
    goto LABEL_113;
  }
  if ((*(_WORD *)&has & 0x200) != 0)
  {
    if ((v7 & 0x200) == 0 || self->_phyCellId != *((_DWORD *)v4 + 12))
      goto LABEL_113;
  }
  else if ((v7 & 0x200) != 0)
  {
    goto LABEL_113;
  }
  if ((*(_BYTE *)&has & 0x10) != 0)
  {
    if ((v7 & 0x10) == 0 || self->_dlFreq != *((_DWORD *)v4 + 7))
      goto LABEL_113;
  }
  else if ((v7 & 0x10) != 0)
  {
    goto LABEL_113;
  }
  if ((*(_DWORD *)&has & 0x80000) != 0)
  {
    if ((v7 & 0x80000) == 0 || self->_ulFreq != *((_DWORD *)v4 + 25))
      goto LABEL_113;
  }
  else if ((v7 & 0x80000) != 0)
  {
    goto LABEL_113;
  }
  if ((*(_BYTE *)&has & 8) != 0)
  {
    if ((v7 & 8) == 0 || self->_dlBw != *((_DWORD *)v4 + 6))
      goto LABEL_113;
  }
  else if ((v7 & 8) != 0)
  {
    goto LABEL_113;
  }
  if ((*(_DWORD *)&has & 0x40000) != 0)
  {
    if ((v7 & 0x40000) == 0 || self->_ulBw != *((_DWORD *)v4 + 24))
      goto LABEL_113;
  }
  else if ((v7 & 0x40000) != 0)
  {
    goto LABEL_113;
  }
  if ((*(_BYTE *)&has & 4) != 0)
  {
    if ((v7 & 4) == 0 || self->_cellId != *((_DWORD *)v4 + 5))
      goto LABEL_113;
  }
  else if ((v7 & 4) != 0)
  {
    goto LABEL_113;
  }
  if ((*(_BYTE *)&has & 0x20) != 0)
  {
    if ((v7 & 0x20) == 0 || self->_freqBandInd != *((_DWORD *)v4 + 8))
      goto LABEL_113;
  }
  else if ((v7 & 0x20) != 0)
  {
    goto LABEL_113;
  }
  if ((*(_DWORD *)&has & 0x20000) != 0)
  {
    if ((v7 & 0x20000) == 0 || self->_trackingAreaCode != *((_DWORD *)v4 + 23))
      goto LABEL_113;
  }
  else if ((v7 & 0x20000) != 0)
  {
    goto LABEL_113;
  }
  if ((*(_BYTE *)&has & 0x80) != 0)
  {
    if ((v7 & 0x80) == 0 || self->_numMncDigits != *((_DWORD *)v4 + 10))
      goto LABEL_113;
  }
  else if ((v7 & 0x80) != 0)
  {
    goto LABEL_113;
  }
  if ((*(_WORD *)&has & 0x1000) != 0)
  {
    if ((v7 & 0x1000) == 0 || self->_selPlmnMcc != *((_DWORD *)v4 + 15))
      goto LABEL_113;
  }
  else if ((v7 & 0x1000) != 0)
  {
    goto LABEL_113;
  }
  if ((*(_WORD *)&has & 0x2000) != 0)
  {
    if ((v7 & 0x2000) == 0 || self->_selPlmnMnc != *((_DWORD *)v4 + 16))
      goto LABEL_113;
  }
  else if ((v7 & 0x2000) != 0)
  {
    goto LABEL_113;
  }
  if ((*(_BYTE *)&has & 2) != 0)
  {
    if ((v7 & 2) == 0 || self->_allowedAccess != *((_DWORD *)v4 + 4))
      goto LABEL_113;
  }
  else if ((v7 & 2) != 0)
  {
    goto LABEL_113;
  }
  if ((*(_WORD *)&has & 0x8000) != 0)
  {
    if ((v7 & 0x8000) == 0 || self->_tddSfAssignment != *((_DWORD *)v4 + 21))
      goto LABEL_113;
  }
  else if ((v7 & 0x8000) != 0)
  {
    goto LABEL_113;
  }
  if ((*(_DWORD *)&has & 0x10000) != 0)
  {
    if ((v7 & 0x10000) == 0 || self->_tddSsfPatterns != *((_DWORD *)v4 + 22))
      goto LABEL_113;
  }
  else if ((v7 & 0x10000) != 0)
  {
    goto LABEL_113;
  }
  if ((*(_DWORD *)&has & 0x100000) != 0)
  {
    if ((v7 & 0x100000) == 0)
      goto LABEL_113;
    if (self->_cellIsApo)
    {
      if (!*((_BYTE *)v4 + 104))
        goto LABEL_113;
    }
    else if (*((_BYTE *)v4 + 104))
    {
      goto LABEL_113;
    }
  }
  else if ((v7 & 0x100000) != 0)
  {
    goto LABEL_113;
  }
  if ((*(_BYTE *)&has & 0x40) != 0)
  {
    if ((v7 & 0x40) == 0 || self->_hstCellInfo != *((_DWORD *)v4 + 9))
      goto LABEL_113;
  }
  else if ((v7 & 0x40) != 0)
  {
    goto LABEL_113;
  }
  if ((*(_WORD *)&has & 0x400) != 0)
  {
    if ((v7 & 0x400) == 0 || self->_prioOfCampedLteBand != *((_DWORD *)v4 + 13))
      goto LABEL_113;
  }
  else if ((v7 & 0x400) != 0)
  {
    goto LABEL_113;
  }
  if ((*(_WORD *)&has & 0x100) != 0)
  {
    if ((v7 & 0x100) == 0 || self->_numSubs != *((_DWORD *)v4 + 11))
      goto LABEL_113;
  }
  else if ((v7 & 0x100) != 0)
  {
    goto LABEL_113;
  }
  simHplmn = self->_simHplmn;
  if ((unint64_t)simHplmn | *((_QWORD *)v4 + 9))
  {
    if (-[NSData isEqual:](simHplmn, "isEqual:"))
    {
      has = self->_has;
      goto LABEL_103;
    }
LABEL_113:
    v10 = 0;
    goto LABEL_114;
  }
LABEL_103:
  v9 = *((_DWORD *)v4 + 27);
  if ((*(_WORD *)&has & 0x4000) != 0)
  {
    if ((v9 & 0x4000) == 0 || self->_subsId != *((_DWORD *)v4 + 20))
      goto LABEL_113;
  }
  else if ((v9 & 0x4000) != 0)
  {
    goto LABEL_113;
  }
  if ((*(_WORD *)&has & 0x800) != 0)
  {
    if ((v9 & 0x800) == 0 || self->_psPref != *((_DWORD *)v4 + 14))
      goto LABEL_113;
    v10 = 1;
  }
  else
  {
    v10 = (*((_DWORD *)v4 + 27) & 0x800) == 0;
  }
LABEL_114:

  return v10;
}

- (unint64_t)hash
{
  $B447797CE4B35B31ADD9032D7D2FFCDF has;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  unint64_t v12;
  $B447797CE4B35B31ADD9032D7D2FFCDF v13;
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
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  unint64_t v28;

  has = self->_has;
  if ((*(_BYTE *)&has & 1) != 0)
  {
    v28 = 2654435761u * self->_timestamp;
    if ((*(_WORD *)&has & 0x200) != 0)
    {
LABEL_3:
      v27 = 2654435761 * self->_phyCellId;
      if ((*(_BYTE *)&has & 0x10) != 0)
        goto LABEL_4;
      goto LABEL_23;
    }
  }
  else
  {
    v28 = 0;
    if ((*(_WORD *)&has & 0x200) != 0)
      goto LABEL_3;
  }
  v27 = 0;
  if ((*(_BYTE *)&has & 0x10) != 0)
  {
LABEL_4:
    v26 = 2654435761 * self->_dlFreq;
    if ((*(_DWORD *)&has & 0x80000) != 0)
      goto LABEL_5;
    goto LABEL_24;
  }
LABEL_23:
  v26 = 0;
  if ((*(_DWORD *)&has & 0x80000) != 0)
  {
LABEL_5:
    v25 = 2654435761 * self->_ulFreq;
    if ((*(_BYTE *)&has & 8) != 0)
      goto LABEL_6;
    goto LABEL_25;
  }
LABEL_24:
  v25 = 0;
  if ((*(_BYTE *)&has & 8) != 0)
  {
LABEL_6:
    v24 = 2654435761 * self->_dlBw;
    if ((*(_DWORD *)&has & 0x40000) != 0)
      goto LABEL_7;
    goto LABEL_26;
  }
LABEL_25:
  v24 = 0;
  if ((*(_DWORD *)&has & 0x40000) != 0)
  {
LABEL_7:
    v23 = 2654435761 * self->_ulBw;
    if ((*(_BYTE *)&has & 4) != 0)
      goto LABEL_8;
    goto LABEL_27;
  }
LABEL_26:
  v23 = 0;
  if ((*(_BYTE *)&has & 4) != 0)
  {
LABEL_8:
    v22 = 2654435761 * self->_cellId;
    if ((*(_BYTE *)&has & 0x20) != 0)
      goto LABEL_9;
    goto LABEL_28;
  }
LABEL_27:
  v22 = 0;
  if ((*(_BYTE *)&has & 0x20) != 0)
  {
LABEL_9:
    v21 = 2654435761 * self->_freqBandInd;
    if ((*(_DWORD *)&has & 0x20000) != 0)
      goto LABEL_10;
    goto LABEL_29;
  }
LABEL_28:
  v21 = 0;
  if ((*(_DWORD *)&has & 0x20000) != 0)
  {
LABEL_10:
    v20 = 2654435761 * self->_trackingAreaCode;
    if ((*(_BYTE *)&has & 0x80) != 0)
      goto LABEL_11;
    goto LABEL_30;
  }
LABEL_29:
  v20 = 0;
  if ((*(_BYTE *)&has & 0x80) != 0)
  {
LABEL_11:
    v19 = 2654435761 * self->_numMncDigits;
    if ((*(_WORD *)&has & 0x1000) != 0)
      goto LABEL_12;
    goto LABEL_31;
  }
LABEL_30:
  v19 = 0;
  if ((*(_WORD *)&has & 0x1000) != 0)
  {
LABEL_12:
    v17 = 2654435761 * self->_selPlmnMcc;
    if ((*(_WORD *)&has & 0x2000) != 0)
      goto LABEL_13;
    goto LABEL_32;
  }
LABEL_31:
  v17 = 0;
  if ((*(_WORD *)&has & 0x2000) != 0)
  {
LABEL_13:
    v4 = 2654435761 * self->_selPlmnMnc;
    if ((*(_BYTE *)&has & 2) != 0)
      goto LABEL_14;
    goto LABEL_33;
  }
LABEL_32:
  v4 = 0;
  if ((*(_BYTE *)&has & 2) != 0)
  {
LABEL_14:
    v5 = 2654435761 * self->_allowedAccess;
    if ((*(_WORD *)&has & 0x8000) != 0)
      goto LABEL_15;
    goto LABEL_34;
  }
LABEL_33:
  v5 = 0;
  if ((*(_WORD *)&has & 0x8000) != 0)
  {
LABEL_15:
    v6 = 2654435761 * self->_tddSfAssignment;
    if ((*(_DWORD *)&has & 0x10000) != 0)
      goto LABEL_16;
    goto LABEL_35;
  }
LABEL_34:
  v6 = 0;
  if ((*(_DWORD *)&has & 0x10000) != 0)
  {
LABEL_16:
    v7 = 2654435761 * self->_tddSsfPatterns;
    if ((*(_DWORD *)&has & 0x100000) != 0)
      goto LABEL_17;
    goto LABEL_36;
  }
LABEL_35:
  v7 = 0;
  if ((*(_DWORD *)&has & 0x100000) != 0)
  {
LABEL_17:
    v8 = 2654435761 * self->_cellIsApo;
    if ((*(_BYTE *)&has & 0x40) != 0)
      goto LABEL_18;
    goto LABEL_37;
  }
LABEL_36:
  v8 = 0;
  if ((*(_BYTE *)&has & 0x40) != 0)
  {
LABEL_18:
    v9 = 2654435761 * self->_hstCellInfo;
    if ((*(_WORD *)&has & 0x400) != 0)
      goto LABEL_19;
LABEL_38:
    v10 = 0;
    if ((*(_WORD *)&has & 0x100) != 0)
      goto LABEL_20;
    goto LABEL_39;
  }
LABEL_37:
  v9 = 0;
  if ((*(_WORD *)&has & 0x400) == 0)
    goto LABEL_38;
LABEL_19:
  v10 = 2654435761 * self->_prioOfCampedLteBand;
  if ((*(_WORD *)&has & 0x100) != 0)
  {
LABEL_20:
    v11 = 2654435761 * self->_numSubs;
    goto LABEL_40;
  }
LABEL_39:
  v11 = 0;
LABEL_40:
  v12 = (unint64_t)-[NSData hash](self->_simHplmn, "hash", v17);
  v13 = self->_has;
  if ((*(_WORD *)&v13 & 0x4000) != 0)
  {
    v14 = 2654435761 * self->_subsId;
    if ((*(_WORD *)&v13 & 0x800) != 0)
      goto LABEL_42;
LABEL_44:
    v15 = 0;
    return v27 ^ v28 ^ v26 ^ v25 ^ v24 ^ v23 ^ v22 ^ v21 ^ v20 ^ v19 ^ v18 ^ v4 ^ v5 ^ v6 ^ v7 ^ v8 ^ v9 ^ v10 ^ v11 ^ v14 ^ v15 ^ v12;
  }
  v14 = 0;
  if ((*(_WORD *)&v13 & 0x800) == 0)
    goto LABEL_44;
LABEL_42:
  v15 = 2654435761 * self->_psPref;
  return v27 ^ v28 ^ v26 ^ v25 ^ v24 ^ v23 ^ v22 ^ v21 ^ v20 ^ v19 ^ v18 ^ v4 ^ v5 ^ v6 ^ v7 ^ v8 ^ v9 ^ v10 ^ v11 ^ v14 ^ v15 ^ v12;
}

- (void)mergeFrom:(id)a3
{
  id v4;
  int v5;
  int v6;
  id v7;

  v4 = a3;
  v5 = *((_DWORD *)v4 + 27);
  if ((v5 & 1) != 0)
  {
    self->_timestamp = *((_QWORD *)v4 + 1);
    *(_DWORD *)&self->_has |= 1u;
    v5 = *((_DWORD *)v4 + 27);
    if ((v5 & 0x200) == 0)
    {
LABEL_3:
      if ((v5 & 0x10) == 0)
        goto LABEL_4;
      goto LABEL_30;
    }
  }
  else if ((v5 & 0x200) == 0)
  {
    goto LABEL_3;
  }
  self->_phyCellId = *((_DWORD *)v4 + 12);
  *(_DWORD *)&self->_has |= 0x200u;
  v5 = *((_DWORD *)v4 + 27);
  if ((v5 & 0x10) == 0)
  {
LABEL_4:
    if ((v5 & 0x80000) == 0)
      goto LABEL_5;
    goto LABEL_31;
  }
LABEL_30:
  self->_dlFreq = *((_DWORD *)v4 + 7);
  *(_DWORD *)&self->_has |= 0x10u;
  v5 = *((_DWORD *)v4 + 27);
  if ((v5 & 0x80000) == 0)
  {
LABEL_5:
    if ((v5 & 8) == 0)
      goto LABEL_6;
    goto LABEL_32;
  }
LABEL_31:
  self->_ulFreq = *((_DWORD *)v4 + 25);
  *(_DWORD *)&self->_has |= 0x80000u;
  v5 = *((_DWORD *)v4 + 27);
  if ((v5 & 8) == 0)
  {
LABEL_6:
    if ((v5 & 0x40000) == 0)
      goto LABEL_7;
    goto LABEL_33;
  }
LABEL_32:
  self->_dlBw = *((_DWORD *)v4 + 6);
  *(_DWORD *)&self->_has |= 8u;
  v5 = *((_DWORD *)v4 + 27);
  if ((v5 & 0x40000) == 0)
  {
LABEL_7:
    if ((v5 & 4) == 0)
      goto LABEL_8;
    goto LABEL_34;
  }
LABEL_33:
  self->_ulBw = *((_DWORD *)v4 + 24);
  *(_DWORD *)&self->_has |= 0x40000u;
  v5 = *((_DWORD *)v4 + 27);
  if ((v5 & 4) == 0)
  {
LABEL_8:
    if ((v5 & 0x20) == 0)
      goto LABEL_9;
    goto LABEL_35;
  }
LABEL_34:
  self->_cellId = *((_DWORD *)v4 + 5);
  *(_DWORD *)&self->_has |= 4u;
  v5 = *((_DWORD *)v4 + 27);
  if ((v5 & 0x20) == 0)
  {
LABEL_9:
    if ((v5 & 0x20000) == 0)
      goto LABEL_10;
    goto LABEL_36;
  }
LABEL_35:
  self->_freqBandInd = *((_DWORD *)v4 + 8);
  *(_DWORD *)&self->_has |= 0x20u;
  v5 = *((_DWORD *)v4 + 27);
  if ((v5 & 0x20000) == 0)
  {
LABEL_10:
    if ((v5 & 0x80) == 0)
      goto LABEL_11;
    goto LABEL_37;
  }
LABEL_36:
  self->_trackingAreaCode = *((_DWORD *)v4 + 23);
  *(_DWORD *)&self->_has |= 0x20000u;
  v5 = *((_DWORD *)v4 + 27);
  if ((v5 & 0x80) == 0)
  {
LABEL_11:
    if ((v5 & 0x1000) == 0)
      goto LABEL_12;
    goto LABEL_38;
  }
LABEL_37:
  self->_numMncDigits = *((_DWORD *)v4 + 10);
  *(_DWORD *)&self->_has |= 0x80u;
  v5 = *((_DWORD *)v4 + 27);
  if ((v5 & 0x1000) == 0)
  {
LABEL_12:
    if ((v5 & 0x2000) == 0)
      goto LABEL_13;
    goto LABEL_39;
  }
LABEL_38:
  self->_selPlmnMcc = *((_DWORD *)v4 + 15);
  *(_DWORD *)&self->_has |= 0x1000u;
  v5 = *((_DWORD *)v4 + 27);
  if ((v5 & 0x2000) == 0)
  {
LABEL_13:
    if ((v5 & 2) == 0)
      goto LABEL_14;
    goto LABEL_40;
  }
LABEL_39:
  self->_selPlmnMnc = *((_DWORD *)v4 + 16);
  *(_DWORD *)&self->_has |= 0x2000u;
  v5 = *((_DWORD *)v4 + 27);
  if ((v5 & 2) == 0)
  {
LABEL_14:
    if ((v5 & 0x8000) == 0)
      goto LABEL_15;
    goto LABEL_41;
  }
LABEL_40:
  self->_allowedAccess = *((_DWORD *)v4 + 4);
  *(_DWORD *)&self->_has |= 2u;
  v5 = *((_DWORD *)v4 + 27);
  if ((v5 & 0x8000) == 0)
  {
LABEL_15:
    if ((v5 & 0x10000) == 0)
      goto LABEL_16;
    goto LABEL_42;
  }
LABEL_41:
  self->_tddSfAssignment = *((_DWORD *)v4 + 21);
  *(_DWORD *)&self->_has |= 0x8000u;
  v5 = *((_DWORD *)v4 + 27);
  if ((v5 & 0x10000) == 0)
  {
LABEL_16:
    if ((v5 & 0x100000) == 0)
      goto LABEL_17;
    goto LABEL_43;
  }
LABEL_42:
  self->_tddSsfPatterns = *((_DWORD *)v4 + 22);
  *(_DWORD *)&self->_has |= 0x10000u;
  v5 = *((_DWORD *)v4 + 27);
  if ((v5 & 0x100000) == 0)
  {
LABEL_17:
    if ((v5 & 0x40) == 0)
      goto LABEL_18;
    goto LABEL_44;
  }
LABEL_43:
  self->_cellIsApo = *((_BYTE *)v4 + 104);
  *(_DWORD *)&self->_has |= 0x100000u;
  v5 = *((_DWORD *)v4 + 27);
  if ((v5 & 0x40) == 0)
  {
LABEL_18:
    if ((v5 & 0x400) == 0)
      goto LABEL_19;
    goto LABEL_45;
  }
LABEL_44:
  self->_hstCellInfo = *((_DWORD *)v4 + 9);
  *(_DWORD *)&self->_has |= 0x40u;
  v5 = *((_DWORD *)v4 + 27);
  if ((v5 & 0x400) == 0)
  {
LABEL_19:
    if ((v5 & 0x100) == 0)
      goto LABEL_21;
    goto LABEL_20;
  }
LABEL_45:
  self->_prioOfCampedLteBand = *((_DWORD *)v4 + 13);
  *(_DWORD *)&self->_has |= 0x400u;
  if ((*((_DWORD *)v4 + 27) & 0x100) != 0)
  {
LABEL_20:
    self->_numSubs = *((_DWORD *)v4 + 11);
    *(_DWORD *)&self->_has |= 0x100u;
  }
LABEL_21:
  if (*((_QWORD *)v4 + 9))
  {
    v7 = v4;
    -[CellularLteScellInfo setSimHplmn:](self, "setSimHplmn:");
    v4 = v7;
  }
  v6 = *((_DWORD *)v4 + 27);
  if ((v6 & 0x4000) != 0)
  {
    self->_subsId = *((_DWORD *)v4 + 20);
    *(_DWORD *)&self->_has |= 0x4000u;
    v6 = *((_DWORD *)v4 + 27);
  }
  if ((v6 & 0x800) != 0)
  {
    self->_psPref = *((_DWORD *)v4 + 14);
    *(_DWORD *)&self->_has |= 0x800u;
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

- (unsigned)allowedAccess
{
  return self->_allowedAccess;
}

- (unsigned)tddSfAssignment
{
  return self->_tddSfAssignment;
}

- (unsigned)tddSsfPatterns
{
  return self->_tddSsfPatterns;
}

- (BOOL)cellIsApo
{
  return self->_cellIsApo;
}

- (unsigned)hstCellInfo
{
  return self->_hstCellInfo;
}

- (unsigned)prioOfCampedLteBand
{
  return self->_prioOfCampedLteBand;
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

- (unsigned)psPref
{
  return self->_psPref;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_simHplmn, 0);
}

@end
