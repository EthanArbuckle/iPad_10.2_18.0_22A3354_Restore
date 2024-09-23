@implementation CellularNrRachAttempt

- (void)setTimestamp:(unint64_t)a3
{
  *(_DWORD *)&self->_has |= 1u;
  self->_timestamp = a3;
}

- (void)setHasTimestamp:(BOOL)a3
{
  self->_has = ($CA3C5A67E5C9B5875AF43B507ECCA79F)(*(_DWORD *)&self->_has & 0xFFFFFFFE | a3);
}

- (BOOL)hasTimestamp
{
  return *(_DWORD *)&self->_has & 1;
}

- (void)setNumAttempt:(unsigned int)a3
{
  *(_DWORD *)&self->_has |= 0x200u;
  self->_numAttempt = a3;
}

- (void)setHasNumAttempt:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 512;
  else
    v3 = 0;
  self->_has = ($CA3C5A67E5C9B5875AF43B507ECCA79F)(*(_DWORD *)&self->_has & 0xFFFFFDFF | v3);
}

- (BOOL)hasNumAttempt
{
  return (*((unsigned __int8 *)&self->_has + 1) >> 1) & 1;
}

- (void)setRachResult:(unsigned int)a3
{
  *(_DWORD *)&self->_has |= 0x4000u;
  self->_rachResult = a3;
}

- (void)setHasRachResult:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 0x4000;
  else
    v3 = 0;
  self->_has = ($CA3C5A67E5C9B5875AF43B507ECCA79F)(*(_DWORD *)&self->_has & 0xFFFFBFFF | v3);
}

- (BOOL)hasRachResult
{
  return (*((unsigned __int8 *)&self->_has + 1) >> 6) & 1;
}

- (void)setRachContention:(unsigned int)a3
{
  *(_DWORD *)&self->_has |= 0x1000u;
  self->_rachContention = a3;
}

- (void)setHasRachContention:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 4096;
  else
    v3 = 0;
  self->_has = ($CA3C5A67E5C9B5875AF43B507ECCA79F)(*(_DWORD *)&self->_has & 0xFFFFEFFF | v3);
}

- (BOOL)hasRachContention
{
  return (*((unsigned __int8 *)&self->_has + 1) >> 4) & 1;
}

- (void)setSsbId:(unsigned int)a3
{
  *(_DWORD *)&self->_has |= 0x8000u;
  self->_ssbId = a3;
}

- (void)setHasSsbId:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 0x8000;
  else
    v3 = 0;
  self->_has = ($CA3C5A67E5C9B5875AF43B507ECCA79F)(*(_DWORD *)&self->_has & 0xFFFF7FFF | v3);
}

- (BOOL)hasSsbId
{
  return *((unsigned __int8 *)&self->_has + 1) >> 7;
}

- (void)setCsiRsId:(unsigned int)a3
{
  *(_DWORD *)&self->_has |= 0x10u;
  self->_csiRsId = a3;
}

- (void)setHasCsiRsId:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 16;
  else
    v3 = 0;
  self->_has = ($CA3C5A67E5C9B5875AF43B507ECCA79F)(*(_DWORD *)&self->_has & 0xFFFFFFEF | v3);
}

- (BOOL)hasCsiRsId
{
  return (*(_BYTE *)&self->_has >> 4) & 1;
}

- (void)setCarrierId:(unsigned int)a3
{
  *(_DWORD *)&self->_has |= 4u;
  self->_carrierId = a3;
}

- (void)setHasCarrierId:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 4;
  else
    v3 = 0;
  self->_has = ($CA3C5A67E5C9B5875AF43B507ECCA79F)(*(_DWORD *)&self->_has & 0xFFFFFFFB | v3);
}

- (BOOL)hasCarrierId
{
  return (*(_BYTE *)&self->_has >> 2) & 1;
}

- (void)setLastTxPower:(int)a3
{
  *(_DWORD *)&self->_has |= 0x100u;
  self->_lastTxPower = a3;
}

- (void)setHasLastTxPower:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 256;
  else
    v3 = 0;
  self->_has = ($CA3C5A67E5C9B5875AF43B507ECCA79F)(*(_DWORD *)&self->_has & 0xFFFFFEFF | v3);
}

- (BOOL)hasLastTxPower
{
  return *((_BYTE *)&self->_has + 1) & 1;
}

- (void)setTac:(unsigned int)a3
{
  *(_DWORD *)&self->_has |= 0x20000u;
  self->_tac = a3;
}

- (void)setHasTac:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 0x20000;
  else
    v3 = 0;
  self->_has = ($CA3C5A67E5C9B5875AF43B507ECCA79F)(*(_DWORD *)&self->_has & 0xFFFDFFFF | v3);
}

- (BOOL)hasTac
{
  return (*((unsigned __int8 *)&self->_has + 2) >> 1) & 1;
}

- (void)setCellId:(unsigned int)a3
{
  *(_DWORD *)&self->_has |= 8u;
  self->_cellId = a3;
}

- (void)setHasCellId:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 8;
  else
    v3 = 0;
  self->_has = ($CA3C5A67E5C9B5875AF43B507ECCA79F)(*(_DWORD *)&self->_has & 0xFFFFFFF7 | v3);
}

- (BOOL)hasCellId
{
  return (*(_BYTE *)&self->_has >> 3) & 1;
}

- (void)setAccbState:(unsigned int)a3
{
  *(_DWORD *)&self->_has |= 2u;
  self->_accbState = a3;
}

- (void)setHasAccbState:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  self->_has = ($CA3C5A67E5C9B5875AF43B507ECCA79F)(*(_DWORD *)&self->_has & 0xFFFFFFFD | v3);
}

- (BOOL)hasAccbState
{
  return (*(_BYTE *)&self->_has >> 1) & 1;
}

- (void)setNumSubs:(unsigned int)a3
{
  *(_DWORD *)&self->_has |= 0x400u;
  self->_numSubs = a3;
}

- (void)setHasNumSubs:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 1024;
  else
    v3 = 0;
  self->_has = ($CA3C5A67E5C9B5875AF43B507ECCA79F)(*(_DWORD *)&self->_has & 0xFFFFFBFF | v3);
}

- (BOOL)hasNumSubs
{
  return (*((unsigned __int8 *)&self->_has + 1) >> 2) & 1;
}

- (BOOL)hasPlmn
{
  return self->_plmn != 0;
}

- (void)setSubsId:(unsigned int)a3
{
  *(_DWORD *)&self->_has |= 0x10000u;
  self->_subsId = a3;
}

- (void)setHasSubsId:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 0x10000;
  else
    v3 = 0;
  self->_has = ($CA3C5A67E5C9B5875AF43B507ECCA79F)(*(_DWORD *)&self->_has & 0xFFFEFFFF | v3);
}

- (BOOL)hasSubsId
{
  return *((_BYTE *)&self->_has + 2) & 1;
}

- (void)setRachReason:(unsigned int)a3
{
  *(_DWORD *)&self->_has |= 0x2000u;
  self->_rachReason = a3;
}

- (void)setHasRachReason:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 0x2000;
  else
    v3 = 0;
  self->_has = ($CA3C5A67E5C9B5875AF43B507ECCA79F)(*(_DWORD *)&self->_has & 0xFFFFDFFF | v3);
}

- (BOOL)hasRachReason
{
  return (*((unsigned __int8 *)&self->_has + 1) >> 5) & 1;
}

- (void)setTxPowerDiff:(int)a3
{
  *(_DWORD *)&self->_has |= 0x40000u;
  self->_txPowerDiff = a3;
}

- (void)setHasTxPowerDiff:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 0x40000;
  else
    v3 = 0;
  self->_has = ($CA3C5A67E5C9B5875AF43B507ECCA79F)(*(_DWORD *)&self->_has & 0xFFFBFFFF | v3);
}

- (BOOL)hasTxPowerDiff
{
  return (*((unsigned __int8 *)&self->_has + 2) >> 2) & 1;
}

- (void)setDcMode:(unsigned int)a3
{
  *(_DWORD *)&self->_has |= 0x20u;
  self->_dcMode = a3;
}

- (void)setHasDcMode:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 32;
  else
    v3 = 0;
  self->_has = ($CA3C5A67E5C9B5875AF43B507ECCA79F)(*(_DWORD *)&self->_has & 0xFFFFFFDF | v3);
}

- (BOOL)hasDcMode
{
  return (*(_BYTE *)&self->_has >> 5) & 1;
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
  self->_has = ($CA3C5A67E5C9B5875AF43B507ECCA79F)(*(_DWORD *)&self->_has & 0xFFFFF7FF | v3);
}

- (BOOL)hasPsPref
{
  return (*((unsigned __int8 *)&self->_has + 1) >> 3) & 1;
}

- (void)setFreqRange:(unsigned int)a3
{
  *(_DWORD *)&self->_has |= 0x80u;
  self->_freqRange = a3;
}

- (void)setHasFreqRange:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 128;
  else
    v3 = 0;
  self->_has = ($CA3C5A67E5C9B5875AF43B507ECCA79F)(*(_DWORD *)&self->_has & 0xFFFFFF7F | v3);
}

- (BOOL)hasFreqRange
{
  return *(_BYTE *)&self->_has >> 7;
}

- (void)setFreqBandInd:(unsigned int)a3
{
  *(_DWORD *)&self->_has |= 0x40u;
  self->_freqBandInd = a3;
}

- (void)setHasFreqBandInd:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 64;
  else
    v3 = 0;
  self->_has = ($CA3C5A67E5C9B5875AF43B507ECCA79F)(*(_DWORD *)&self->_has & 0xFFFFFFBF | v3);
}

- (BOOL)hasFreqBandInd
{
  return (*(_BYTE *)&self->_has >> 6) & 1;
}

- (void)clearServingCellBeamInfos
{
  -[NSMutableArray removeAllObjects](self->_servingCellBeamInfos, "removeAllObjects");
}

- (void)addServingCellBeamInfo:(id)a3
{
  id v4;
  NSMutableArray *servingCellBeamInfos;
  NSMutableArray *v6;
  NSMutableArray *v7;
  id v8;

  v4 = a3;
  servingCellBeamInfos = self->_servingCellBeamInfos;
  v8 = v4;
  if (!servingCellBeamInfos)
  {
    v6 = (NSMutableArray *)objc_alloc_init((Class)NSMutableArray);
    v7 = self->_servingCellBeamInfos;
    self->_servingCellBeamInfos = v6;

    v4 = v8;
    servingCellBeamInfos = self->_servingCellBeamInfos;
  }
  -[NSMutableArray addObject:](servingCellBeamInfos, "addObject:", v4);

}

- (unint64_t)servingCellBeamInfosCount
{
  return (unint64_t)-[NSMutableArray count](self->_servingCellBeamInfos, "count");
}

- (id)servingCellBeamInfoAtIndex:(unint64_t)a3
{
  return -[NSMutableArray objectAtIndex:](self->_servingCellBeamInfos, "objectAtIndex:", a3);
}

+ (Class)servingCellBeamInfoType
{
  return (Class)objc_opt_class(ServingCellBeamInfo, a2);
}

- (id)description
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)CellularNrRachAttempt;
  v3 = -[CellularNrRachAttempt description](&v8, "description");
  v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[CellularNrRachAttempt dictionaryRepresentation](self, "dictionaryRepresentation"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@ %@"), v4, v5));

  return v6;
}

- (id)dictionaryRepresentation
{
  void *v3;
  $CA3C5A67E5C9B5875AF43B507ECCA79F has;
  void *v5;
  NSData *plmn;
  $CA3C5A67E5C9B5875AF43B507ECCA79F v7;
  void *v8;
  id v9;
  NSMutableArray *v10;
  id v11;
  id v12;
  uint64_t v13;
  void *i;
  void *v15;
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
  void *v31;
  void *v32;
  void *v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  _BYTE v38[128];

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary"));
  has = self->_has;
  if ((*(_BYTE *)&has & 1) != 0)
  {
    v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedLongLong:](NSNumber, "numberWithUnsignedLongLong:", self->_timestamp));
    objc_msgSend(v3, "setObject:forKey:", v17, CFSTR("timestamp"));

    has = self->_has;
    if ((*(_WORD *)&has & 0x200) == 0)
    {
LABEL_3:
      if ((*(_WORD *)&has & 0x4000) == 0)
        goto LABEL_4;
      goto LABEL_36;
    }
  }
  else if ((*(_WORD *)&has & 0x200) == 0)
  {
    goto LABEL_3;
  }
  v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", self->_numAttempt));
  objc_msgSend(v3, "setObject:forKey:", v18, CFSTR("num_attempt"));

  has = self->_has;
  if ((*(_WORD *)&has & 0x4000) == 0)
  {
LABEL_4:
    if ((*(_WORD *)&has & 0x1000) == 0)
      goto LABEL_5;
    goto LABEL_37;
  }
LABEL_36:
  v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", self->_rachResult));
  objc_msgSend(v3, "setObject:forKey:", v19, CFSTR("rach_result"));

  has = self->_has;
  if ((*(_WORD *)&has & 0x1000) == 0)
  {
LABEL_5:
    if ((*(_WORD *)&has & 0x8000) == 0)
      goto LABEL_6;
    goto LABEL_38;
  }
LABEL_37:
  v20 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", self->_rachContention));
  objc_msgSend(v3, "setObject:forKey:", v20, CFSTR("rach_contention"));

  has = self->_has;
  if ((*(_WORD *)&has & 0x8000) == 0)
  {
LABEL_6:
    if ((*(_BYTE *)&has & 0x10) == 0)
      goto LABEL_7;
    goto LABEL_39;
  }
LABEL_38:
  v21 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", self->_ssbId));
  objc_msgSend(v3, "setObject:forKey:", v21, CFSTR("ssb_id"));

  has = self->_has;
  if ((*(_BYTE *)&has & 0x10) == 0)
  {
LABEL_7:
    if ((*(_BYTE *)&has & 4) == 0)
      goto LABEL_8;
    goto LABEL_40;
  }
LABEL_39:
  v22 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", self->_csiRsId));
  objc_msgSend(v3, "setObject:forKey:", v22, CFSTR("csi_rs_id"));

  has = self->_has;
  if ((*(_BYTE *)&has & 4) == 0)
  {
LABEL_8:
    if ((*(_WORD *)&has & 0x100) == 0)
      goto LABEL_9;
    goto LABEL_41;
  }
LABEL_40:
  v23 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", self->_carrierId));
  objc_msgSend(v3, "setObject:forKey:", v23, CFSTR("carrier_id"));

  has = self->_has;
  if ((*(_WORD *)&has & 0x100) == 0)
  {
LABEL_9:
    if ((*(_DWORD *)&has & 0x20000) == 0)
      goto LABEL_10;
    goto LABEL_42;
  }
LABEL_41:
  v24 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](NSNumber, "numberWithInt:", self->_lastTxPower));
  objc_msgSend(v3, "setObject:forKey:", v24, CFSTR("last_tx_power"));

  has = self->_has;
  if ((*(_DWORD *)&has & 0x20000) == 0)
  {
LABEL_10:
    if ((*(_BYTE *)&has & 8) == 0)
      goto LABEL_11;
    goto LABEL_43;
  }
LABEL_42:
  v25 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", self->_tac));
  objc_msgSend(v3, "setObject:forKey:", v25, CFSTR("tac"));

  has = self->_has;
  if ((*(_BYTE *)&has & 8) == 0)
  {
LABEL_11:
    if ((*(_BYTE *)&has & 2) == 0)
      goto LABEL_12;
    goto LABEL_44;
  }
LABEL_43:
  v26 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", self->_cellId));
  objc_msgSend(v3, "setObject:forKey:", v26, CFSTR("cell_id"));

  has = self->_has;
  if ((*(_BYTE *)&has & 2) == 0)
  {
LABEL_12:
    if ((*(_WORD *)&has & 0x400) == 0)
      goto LABEL_14;
    goto LABEL_13;
  }
LABEL_44:
  v27 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", self->_accbState));
  objc_msgSend(v3, "setObject:forKey:", v27, CFSTR("accb_state"));

  if ((*(_DWORD *)&self->_has & 0x400) != 0)
  {
LABEL_13:
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", self->_numSubs));
    objc_msgSend(v3, "setObject:forKey:", v5, CFSTR("num_subs"));

  }
LABEL_14:
  plmn = self->_plmn;
  if (plmn)
    objc_msgSend(v3, "setObject:forKey:", plmn, CFSTR("plmn"));
  v7 = self->_has;
  if ((*(_DWORD *)&v7 & 0x10000) != 0)
  {
    v28 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", self->_subsId));
    objc_msgSend(v3, "setObject:forKey:", v28, CFSTR("subs_id"));

    v7 = self->_has;
    if ((*(_WORD *)&v7 & 0x2000) == 0)
    {
LABEL_18:
      if ((*(_DWORD *)&v7 & 0x40000) == 0)
        goto LABEL_19;
      goto LABEL_48;
    }
  }
  else if ((*(_WORD *)&v7 & 0x2000) == 0)
  {
    goto LABEL_18;
  }
  v29 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", self->_rachReason));
  objc_msgSend(v3, "setObject:forKey:", v29, CFSTR("rach_reason"));

  v7 = self->_has;
  if ((*(_DWORD *)&v7 & 0x40000) == 0)
  {
LABEL_19:
    if ((*(_BYTE *)&v7 & 0x20) == 0)
      goto LABEL_20;
    goto LABEL_49;
  }
LABEL_48:
  v30 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](NSNumber, "numberWithInt:", self->_txPowerDiff));
  objc_msgSend(v3, "setObject:forKey:", v30, CFSTR("tx_power_diff"));

  v7 = self->_has;
  if ((*(_BYTE *)&v7 & 0x20) == 0)
  {
LABEL_20:
    if ((*(_WORD *)&v7 & 0x800) == 0)
      goto LABEL_21;
    goto LABEL_50;
  }
LABEL_49:
  v31 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", self->_dcMode));
  objc_msgSend(v3, "setObject:forKey:", v31, CFSTR("dc_mode"));

  v7 = self->_has;
  if ((*(_WORD *)&v7 & 0x800) == 0)
  {
LABEL_21:
    if ((*(_BYTE *)&v7 & 0x80) == 0)
      goto LABEL_22;
    goto LABEL_51;
  }
LABEL_50:
  v32 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", self->_psPref));
  objc_msgSend(v3, "setObject:forKey:", v32, CFSTR("ps_pref"));

  v7 = self->_has;
  if ((*(_BYTE *)&v7 & 0x80) == 0)
  {
LABEL_22:
    if ((*(_BYTE *)&v7 & 0x40) == 0)
      goto LABEL_24;
    goto LABEL_23;
  }
LABEL_51:
  v33 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", self->_freqRange));
  objc_msgSend(v3, "setObject:forKey:", v33, CFSTR("freq_range"));

  if ((*(_DWORD *)&self->_has & 0x40) != 0)
  {
LABEL_23:
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", self->_freqBandInd));
    objc_msgSend(v3, "setObject:forKey:", v8, CFSTR("freq_band_ind"));

  }
LABEL_24:
  if (-[NSMutableArray count](self->_servingCellBeamInfos, "count"))
  {
    v9 = objc_msgSend(objc_alloc((Class)NSMutableArray), "initWithCapacity:", -[NSMutableArray count](self->_servingCellBeamInfos, "count"));
    v34 = 0u;
    v35 = 0u;
    v36 = 0u;
    v37 = 0u;
    v10 = self->_servingCellBeamInfos;
    v11 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v10, "countByEnumeratingWithState:objects:count:", &v34, v38, 16);
    if (v11)
    {
      v12 = v11;
      v13 = *(_QWORD *)v35;
      do
      {
        for (i = 0; i != v12; i = (char *)i + 1)
        {
          if (*(_QWORD *)v35 != v13)
            objc_enumerationMutation(v10);
          v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(*((_QWORD *)&v34 + 1) + 8 * (_QWORD)i), "dictionaryRepresentation", (_QWORD)v34));
          objc_msgSend(v9, "addObject:", v15);

        }
        v12 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v10, "countByEnumeratingWithState:objects:count:", &v34, v38, 16);
      }
      while (v12);
    }

    objc_msgSend(v3, "setObject:forKey:", v9, CFSTR("serving_cell_beam_info"));
  }
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return sub_100062EE0((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4;
  void *v5;
  $CA3C5A67E5C9B5875AF43B507ECCA79F has;
  NSData *plmn;
  $CA3C5A67E5C9B5875AF43B507ECCA79F v8;
  NSMutableArray *v9;
  id v10;
  id v11;
  uint64_t v12;
  void *v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];

  v4 = a3;
  v5 = v4;
  has = self->_has;
  if ((*(_BYTE *)&has & 1) != 0)
  {
    PBDataWriterWriteUint64Field(v4, self->_timestamp, 1);
    has = self->_has;
    if ((*(_WORD *)&has & 0x200) == 0)
    {
LABEL_3:
      if ((*(_WORD *)&has & 0x4000) == 0)
        goto LABEL_4;
      goto LABEL_34;
    }
  }
  else if ((*(_WORD *)&has & 0x200) == 0)
  {
    goto LABEL_3;
  }
  PBDataWriterWriteUint32Field(v5, self->_numAttempt, 3);
  has = self->_has;
  if ((*(_WORD *)&has & 0x4000) == 0)
  {
LABEL_4:
    if ((*(_WORD *)&has & 0x1000) == 0)
      goto LABEL_5;
    goto LABEL_35;
  }
LABEL_34:
  PBDataWriterWriteUint32Field(v5, self->_rachResult, 4);
  has = self->_has;
  if ((*(_WORD *)&has & 0x1000) == 0)
  {
LABEL_5:
    if ((*(_WORD *)&has & 0x8000) == 0)
      goto LABEL_6;
    goto LABEL_36;
  }
LABEL_35:
  PBDataWriterWriteUint32Field(v5, self->_rachContention, 5);
  has = self->_has;
  if ((*(_WORD *)&has & 0x8000) == 0)
  {
LABEL_6:
    if ((*(_BYTE *)&has & 0x10) == 0)
      goto LABEL_7;
    goto LABEL_37;
  }
LABEL_36:
  PBDataWriterWriteUint32Field(v5, self->_ssbId, 6);
  has = self->_has;
  if ((*(_BYTE *)&has & 0x10) == 0)
  {
LABEL_7:
    if ((*(_BYTE *)&has & 4) == 0)
      goto LABEL_8;
    goto LABEL_38;
  }
LABEL_37:
  PBDataWriterWriteUint32Field(v5, self->_csiRsId, 7);
  has = self->_has;
  if ((*(_BYTE *)&has & 4) == 0)
  {
LABEL_8:
    if ((*(_WORD *)&has & 0x100) == 0)
      goto LABEL_9;
    goto LABEL_39;
  }
LABEL_38:
  PBDataWriterWriteUint32Field(v5, self->_carrierId, 8);
  has = self->_has;
  if ((*(_WORD *)&has & 0x100) == 0)
  {
LABEL_9:
    if ((*(_DWORD *)&has & 0x20000) == 0)
      goto LABEL_10;
    goto LABEL_40;
  }
LABEL_39:
  PBDataWriterWriteSint32Field(v5, self->_lastTxPower, 9);
  has = self->_has;
  if ((*(_DWORD *)&has & 0x20000) == 0)
  {
LABEL_10:
    if ((*(_BYTE *)&has & 8) == 0)
      goto LABEL_11;
    goto LABEL_41;
  }
LABEL_40:
  PBDataWriterWriteUint32Field(v5, self->_tac, 10);
  has = self->_has;
  if ((*(_BYTE *)&has & 8) == 0)
  {
LABEL_11:
    if ((*(_BYTE *)&has & 2) == 0)
      goto LABEL_12;
    goto LABEL_42;
  }
LABEL_41:
  PBDataWriterWriteUint32Field(v5, self->_cellId, 11);
  has = self->_has;
  if ((*(_BYTE *)&has & 2) == 0)
  {
LABEL_12:
    if ((*(_WORD *)&has & 0x400) == 0)
      goto LABEL_14;
    goto LABEL_13;
  }
LABEL_42:
  PBDataWriterWriteUint32Field(v5, self->_accbState, 12);
  if ((*(_DWORD *)&self->_has & 0x400) != 0)
LABEL_13:
    PBDataWriterWriteUint32Field(v5, self->_numSubs, 13);
LABEL_14:
  plmn = self->_plmn;
  if (plmn)
    PBDataWriterWriteDataField(v5, plmn, 14);
  v8 = self->_has;
  if ((*(_DWORD *)&v8 & 0x10000) != 0)
  {
    PBDataWriterWriteUint32Field(v5, self->_subsId, 15);
    v8 = self->_has;
    if ((*(_WORD *)&v8 & 0x2000) == 0)
    {
LABEL_18:
      if ((*(_DWORD *)&v8 & 0x40000) == 0)
        goto LABEL_19;
      goto LABEL_46;
    }
  }
  else if ((*(_WORD *)&v8 & 0x2000) == 0)
  {
    goto LABEL_18;
  }
  PBDataWriterWriteUint32Field(v5, self->_rachReason, 16);
  v8 = self->_has;
  if ((*(_DWORD *)&v8 & 0x40000) == 0)
  {
LABEL_19:
    if ((*(_BYTE *)&v8 & 0x20) == 0)
      goto LABEL_20;
    goto LABEL_47;
  }
LABEL_46:
  PBDataWriterWriteSint32Field(v5, self->_txPowerDiff, 17);
  v8 = self->_has;
  if ((*(_BYTE *)&v8 & 0x20) == 0)
  {
LABEL_20:
    if ((*(_WORD *)&v8 & 0x800) == 0)
      goto LABEL_21;
    goto LABEL_48;
  }
LABEL_47:
  PBDataWriterWriteUint32Field(v5, self->_dcMode, 18);
  v8 = self->_has;
  if ((*(_WORD *)&v8 & 0x800) == 0)
  {
LABEL_21:
    if ((*(_BYTE *)&v8 & 0x80) == 0)
      goto LABEL_22;
    goto LABEL_49;
  }
LABEL_48:
  PBDataWriterWriteUint32Field(v5, self->_psPref, 19);
  v8 = self->_has;
  if ((*(_BYTE *)&v8 & 0x80) == 0)
  {
LABEL_22:
    if ((*(_BYTE *)&v8 & 0x40) == 0)
      goto LABEL_24;
    goto LABEL_23;
  }
LABEL_49:
  PBDataWriterWriteUint32Field(v5, self->_freqRange, 20);
  if ((*(_DWORD *)&self->_has & 0x40) != 0)
LABEL_23:
    PBDataWriterWriteUint32Field(v5, self->_freqBandInd, 21);
LABEL_24:
  v16 = 0u;
  v17 = 0u;
  v14 = 0u;
  v15 = 0u;
  v9 = self->_servingCellBeamInfos;
  v10 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v9, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v10)
  {
    v11 = v10;
    v12 = *(_QWORD *)v15;
    do
    {
      v13 = 0;
      do
      {
        if (*(_QWORD *)v15 != v12)
          objc_enumerationMutation(v9);
        PBDataWriterWriteSubmessage(v5, *(_QWORD *)(*((_QWORD *)&v14 + 1) + 8 * (_QWORD)v13), 22);
        v13 = (char *)v13 + 1;
      }
      while (v11 != v13);
      v11 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v9, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    }
    while (v11);
  }

}

- (void)copyTo:(id)a3
{
  _QWORD *v4;
  $CA3C5A67E5C9B5875AF43B507ECCA79F has;
  $CA3C5A67E5C9B5875AF43B507ECCA79F v6;
  unint64_t v7;
  unint64_t v8;
  uint64_t i;
  void *v10;
  _QWORD *v11;

  v4 = a3;
  has = self->_has;
  if ((*(_BYTE *)&has & 1) != 0)
  {
    v4[1] = self->_timestamp;
    *((_DWORD *)v4 + 26) |= 1u;
    has = self->_has;
    if ((*(_WORD *)&has & 0x200) == 0)
    {
LABEL_3:
      if ((*(_WORD *)&has & 0x4000) == 0)
        goto LABEL_4;
      goto LABEL_31;
    }
  }
  else if ((*(_WORD *)&has & 0x200) == 0)
  {
    goto LABEL_3;
  }
  *((_DWORD *)v4 + 12) = self->_numAttempt;
  *((_DWORD *)v4 + 26) |= 0x200u;
  has = self->_has;
  if ((*(_WORD *)&has & 0x4000) == 0)
  {
LABEL_4:
    if ((*(_WORD *)&has & 0x1000) == 0)
      goto LABEL_5;
    goto LABEL_32;
  }
LABEL_31:
  *((_DWORD *)v4 + 19) = self->_rachResult;
  *((_DWORD *)v4 + 26) |= 0x4000u;
  has = self->_has;
  if ((*(_WORD *)&has & 0x1000) == 0)
  {
LABEL_5:
    if ((*(_WORD *)&has & 0x8000) == 0)
      goto LABEL_6;
    goto LABEL_33;
  }
LABEL_32:
  *((_DWORD *)v4 + 17) = self->_rachContention;
  *((_DWORD *)v4 + 26) |= 0x1000u;
  has = self->_has;
  if ((*(_WORD *)&has & 0x8000) == 0)
  {
LABEL_6:
    if ((*(_BYTE *)&has & 0x10) == 0)
      goto LABEL_7;
    goto LABEL_34;
  }
LABEL_33:
  *((_DWORD *)v4 + 22) = self->_ssbId;
  *((_DWORD *)v4 + 26) |= 0x8000u;
  has = self->_has;
  if ((*(_BYTE *)&has & 0x10) == 0)
  {
LABEL_7:
    if ((*(_BYTE *)&has & 4) == 0)
      goto LABEL_8;
    goto LABEL_35;
  }
LABEL_34:
  *((_DWORD *)v4 + 7) = self->_csiRsId;
  *((_DWORD *)v4 + 26) |= 0x10u;
  has = self->_has;
  if ((*(_BYTE *)&has & 4) == 0)
  {
LABEL_8:
    if ((*(_WORD *)&has & 0x100) == 0)
      goto LABEL_9;
    goto LABEL_36;
  }
LABEL_35:
  *((_DWORD *)v4 + 5) = self->_carrierId;
  *((_DWORD *)v4 + 26) |= 4u;
  has = self->_has;
  if ((*(_WORD *)&has & 0x100) == 0)
  {
LABEL_9:
    if ((*(_DWORD *)&has & 0x20000) == 0)
      goto LABEL_10;
    goto LABEL_37;
  }
LABEL_36:
  *((_DWORD *)v4 + 11) = self->_lastTxPower;
  *((_DWORD *)v4 + 26) |= 0x100u;
  has = self->_has;
  if ((*(_DWORD *)&has & 0x20000) == 0)
  {
LABEL_10:
    if ((*(_BYTE *)&has & 8) == 0)
      goto LABEL_11;
    goto LABEL_38;
  }
LABEL_37:
  *((_DWORD *)v4 + 24) = self->_tac;
  *((_DWORD *)v4 + 26) |= 0x20000u;
  has = self->_has;
  if ((*(_BYTE *)&has & 8) == 0)
  {
LABEL_11:
    if ((*(_BYTE *)&has & 2) == 0)
      goto LABEL_12;
    goto LABEL_39;
  }
LABEL_38:
  *((_DWORD *)v4 + 6) = self->_cellId;
  *((_DWORD *)v4 + 26) |= 8u;
  has = self->_has;
  if ((*(_BYTE *)&has & 2) == 0)
  {
LABEL_12:
    if ((*(_WORD *)&has & 0x400) == 0)
      goto LABEL_14;
    goto LABEL_13;
  }
LABEL_39:
  *((_DWORD *)v4 + 4) = self->_accbState;
  *((_DWORD *)v4 + 26) |= 2u;
  if ((*(_DWORD *)&self->_has & 0x400) != 0)
  {
LABEL_13:
    *((_DWORD *)v4 + 13) = self->_numSubs;
    *((_DWORD *)v4 + 26) |= 0x400u;
  }
LABEL_14:
  v11 = v4;
  if (self->_plmn)
  {
    objc_msgSend(v4, "setPlmn:");
    v4 = v11;
  }
  v6 = self->_has;
  if ((*(_DWORD *)&v6 & 0x10000) != 0)
  {
    *((_DWORD *)v4 + 23) = self->_subsId;
    *((_DWORD *)v4 + 26) |= 0x10000u;
    v6 = self->_has;
    if ((*(_WORD *)&v6 & 0x2000) == 0)
    {
LABEL_18:
      if ((*(_DWORD *)&v6 & 0x40000) == 0)
        goto LABEL_19;
      goto LABEL_43;
    }
  }
  else if ((*(_WORD *)&v6 & 0x2000) == 0)
  {
    goto LABEL_18;
  }
  *((_DWORD *)v4 + 18) = self->_rachReason;
  *((_DWORD *)v4 + 26) |= 0x2000u;
  v6 = self->_has;
  if ((*(_DWORD *)&v6 & 0x40000) == 0)
  {
LABEL_19:
    if ((*(_BYTE *)&v6 & 0x20) == 0)
      goto LABEL_20;
    goto LABEL_44;
  }
LABEL_43:
  *((_DWORD *)v4 + 25) = self->_txPowerDiff;
  *((_DWORD *)v4 + 26) |= 0x40000u;
  v6 = self->_has;
  if ((*(_BYTE *)&v6 & 0x20) == 0)
  {
LABEL_20:
    if ((*(_WORD *)&v6 & 0x800) == 0)
      goto LABEL_21;
    goto LABEL_45;
  }
LABEL_44:
  *((_DWORD *)v4 + 8) = self->_dcMode;
  *((_DWORD *)v4 + 26) |= 0x20u;
  v6 = self->_has;
  if ((*(_WORD *)&v6 & 0x800) == 0)
  {
LABEL_21:
    if ((*(_BYTE *)&v6 & 0x80) == 0)
      goto LABEL_22;
LABEL_46:
    *((_DWORD *)v4 + 10) = self->_freqRange;
    *((_DWORD *)v4 + 26) |= 0x80u;
    if ((*(_DWORD *)&self->_has & 0x40) == 0)
      goto LABEL_24;
    goto LABEL_23;
  }
LABEL_45:
  *((_DWORD *)v4 + 16) = self->_psPref;
  *((_DWORD *)v4 + 26) |= 0x800u;
  v6 = self->_has;
  if ((*(_BYTE *)&v6 & 0x80) != 0)
    goto LABEL_46;
LABEL_22:
  if ((*(_BYTE *)&v6 & 0x40) != 0)
  {
LABEL_23:
    *((_DWORD *)v4 + 9) = self->_freqBandInd;
    *((_DWORD *)v4 + 26) |= 0x40u;
  }
LABEL_24:
  if (-[CellularNrRachAttempt servingCellBeamInfosCount](self, "servingCellBeamInfosCount"))
  {
    objc_msgSend(v11, "clearServingCellBeamInfos");
    v7 = -[CellularNrRachAttempt servingCellBeamInfosCount](self, "servingCellBeamInfosCount");
    if (v7)
    {
      v8 = v7;
      for (i = 0; i != v8; ++i)
      {
        v10 = (void *)objc_claimAutoreleasedReturnValue(-[CellularNrRachAttempt servingCellBeamInfoAtIndex:](self, "servingCellBeamInfoAtIndex:", i));
        objc_msgSend(v11, "addServingCellBeamInfo:", v10);

      }
    }
  }

}

- (id)copyWithZone:(_NSZone *)a3
{
  _QWORD *v5;
  _QWORD *v6;
  $CA3C5A67E5C9B5875AF43B507ECCA79F has;
  id v8;
  void *v9;
  $CA3C5A67E5C9B5875AF43B507ECCA79F v10;
  NSMutableArray *v11;
  id v12;
  id v13;
  uint64_t v14;
  void *v15;
  id v16;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];

  v5 = objc_msgSend(objc_msgSend((id)objc_opt_class(self, a2), "allocWithZone:", a3), "init");
  v6 = v5;
  has = self->_has;
  if ((*(_BYTE *)&has & 1) != 0)
  {
    v5[1] = self->_timestamp;
    *((_DWORD *)v5 + 26) |= 1u;
    has = self->_has;
    if ((*(_WORD *)&has & 0x200) == 0)
    {
LABEL_3:
      if ((*(_WORD *)&has & 0x4000) == 0)
        goto LABEL_4;
      goto LABEL_32;
    }
  }
  else if ((*(_WORD *)&has & 0x200) == 0)
  {
    goto LABEL_3;
  }
  *((_DWORD *)v5 + 12) = self->_numAttempt;
  *((_DWORD *)v5 + 26) |= 0x200u;
  has = self->_has;
  if ((*(_WORD *)&has & 0x4000) == 0)
  {
LABEL_4:
    if ((*(_WORD *)&has & 0x1000) == 0)
      goto LABEL_5;
    goto LABEL_33;
  }
LABEL_32:
  *((_DWORD *)v5 + 19) = self->_rachResult;
  *((_DWORD *)v5 + 26) |= 0x4000u;
  has = self->_has;
  if ((*(_WORD *)&has & 0x1000) == 0)
  {
LABEL_5:
    if ((*(_WORD *)&has & 0x8000) == 0)
      goto LABEL_6;
    goto LABEL_34;
  }
LABEL_33:
  *((_DWORD *)v5 + 17) = self->_rachContention;
  *((_DWORD *)v5 + 26) |= 0x1000u;
  has = self->_has;
  if ((*(_WORD *)&has & 0x8000) == 0)
  {
LABEL_6:
    if ((*(_BYTE *)&has & 0x10) == 0)
      goto LABEL_7;
    goto LABEL_35;
  }
LABEL_34:
  *((_DWORD *)v5 + 22) = self->_ssbId;
  *((_DWORD *)v5 + 26) |= 0x8000u;
  has = self->_has;
  if ((*(_BYTE *)&has & 0x10) == 0)
  {
LABEL_7:
    if ((*(_BYTE *)&has & 4) == 0)
      goto LABEL_8;
    goto LABEL_36;
  }
LABEL_35:
  *((_DWORD *)v5 + 7) = self->_csiRsId;
  *((_DWORD *)v5 + 26) |= 0x10u;
  has = self->_has;
  if ((*(_BYTE *)&has & 4) == 0)
  {
LABEL_8:
    if ((*(_WORD *)&has & 0x100) == 0)
      goto LABEL_9;
    goto LABEL_37;
  }
LABEL_36:
  *((_DWORD *)v5 + 5) = self->_carrierId;
  *((_DWORD *)v5 + 26) |= 4u;
  has = self->_has;
  if ((*(_WORD *)&has & 0x100) == 0)
  {
LABEL_9:
    if ((*(_DWORD *)&has & 0x20000) == 0)
      goto LABEL_10;
    goto LABEL_38;
  }
LABEL_37:
  *((_DWORD *)v5 + 11) = self->_lastTxPower;
  *((_DWORD *)v5 + 26) |= 0x100u;
  has = self->_has;
  if ((*(_DWORD *)&has & 0x20000) == 0)
  {
LABEL_10:
    if ((*(_BYTE *)&has & 8) == 0)
      goto LABEL_11;
    goto LABEL_39;
  }
LABEL_38:
  *((_DWORD *)v5 + 24) = self->_tac;
  *((_DWORD *)v5 + 26) |= 0x20000u;
  has = self->_has;
  if ((*(_BYTE *)&has & 8) == 0)
  {
LABEL_11:
    if ((*(_BYTE *)&has & 2) == 0)
      goto LABEL_12;
    goto LABEL_40;
  }
LABEL_39:
  *((_DWORD *)v5 + 6) = self->_cellId;
  *((_DWORD *)v5 + 26) |= 8u;
  has = self->_has;
  if ((*(_BYTE *)&has & 2) == 0)
  {
LABEL_12:
    if ((*(_WORD *)&has & 0x400) == 0)
      goto LABEL_14;
    goto LABEL_13;
  }
LABEL_40:
  *((_DWORD *)v5 + 4) = self->_accbState;
  *((_DWORD *)v5 + 26) |= 2u;
  if ((*(_DWORD *)&self->_has & 0x400) != 0)
  {
LABEL_13:
    *((_DWORD *)v5 + 13) = self->_numSubs;
    *((_DWORD *)v5 + 26) |= 0x400u;
  }
LABEL_14:
  v8 = -[NSData copyWithZone:](self->_plmn, "copyWithZone:", a3);
  v9 = (void *)v6[7];
  v6[7] = v8;

  v10 = self->_has;
  if ((*(_DWORD *)&v10 & 0x10000) != 0)
  {
    *((_DWORD *)v6 + 23) = self->_subsId;
    *((_DWORD *)v6 + 26) |= 0x10000u;
    v10 = self->_has;
    if ((*(_WORD *)&v10 & 0x2000) == 0)
    {
LABEL_16:
      if ((*(_DWORD *)&v10 & 0x40000) == 0)
        goto LABEL_17;
      goto LABEL_44;
    }
  }
  else if ((*(_WORD *)&v10 & 0x2000) == 0)
  {
    goto LABEL_16;
  }
  *((_DWORD *)v6 + 18) = self->_rachReason;
  *((_DWORD *)v6 + 26) |= 0x2000u;
  v10 = self->_has;
  if ((*(_DWORD *)&v10 & 0x40000) == 0)
  {
LABEL_17:
    if ((*(_BYTE *)&v10 & 0x20) == 0)
      goto LABEL_18;
    goto LABEL_45;
  }
LABEL_44:
  *((_DWORD *)v6 + 25) = self->_txPowerDiff;
  *((_DWORD *)v6 + 26) |= 0x40000u;
  v10 = self->_has;
  if ((*(_BYTE *)&v10 & 0x20) == 0)
  {
LABEL_18:
    if ((*(_WORD *)&v10 & 0x800) == 0)
      goto LABEL_19;
    goto LABEL_46;
  }
LABEL_45:
  *((_DWORD *)v6 + 8) = self->_dcMode;
  *((_DWORD *)v6 + 26) |= 0x20u;
  v10 = self->_has;
  if ((*(_WORD *)&v10 & 0x800) == 0)
  {
LABEL_19:
    if ((*(_BYTE *)&v10 & 0x80) == 0)
      goto LABEL_20;
    goto LABEL_47;
  }
LABEL_46:
  *((_DWORD *)v6 + 16) = self->_psPref;
  *((_DWORD *)v6 + 26) |= 0x800u;
  v10 = self->_has;
  if ((*(_BYTE *)&v10 & 0x80) == 0)
  {
LABEL_20:
    if ((*(_BYTE *)&v10 & 0x40) == 0)
      goto LABEL_22;
    goto LABEL_21;
  }
LABEL_47:
  *((_DWORD *)v6 + 10) = self->_freqRange;
  *((_DWORD *)v6 + 26) |= 0x80u;
  if ((*(_DWORD *)&self->_has & 0x40) != 0)
  {
LABEL_21:
    *((_DWORD *)v6 + 9) = self->_freqBandInd;
    *((_DWORD *)v6 + 26) |= 0x40u;
  }
LABEL_22:
  v20 = 0u;
  v21 = 0u;
  v18 = 0u;
  v19 = 0u;
  v11 = self->_servingCellBeamInfos;
  v12 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v11, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
  if (v12)
  {
    v13 = v12;
    v14 = *(_QWORD *)v19;
    do
    {
      v15 = 0;
      do
      {
        if (*(_QWORD *)v19 != v14)
          objc_enumerationMutation(v11);
        v16 = objc_msgSend(*(id *)(*((_QWORD *)&v18 + 1) + 8 * (_QWORD)v15), "copyWithZone:", a3, (_QWORD)v18);
        objc_msgSend(v6, "addServingCellBeamInfo:", v16);

        v15 = (char *)v15 + 1;
      }
      while (v13 != v15);
      v13 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v11, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
    }
    while (v13);
  }

  return v6;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  uint64_t v5;
  $CA3C5A67E5C9B5875AF43B507ECCA79F has;
  int v7;
  NSData *plmn;
  int v9;
  NSMutableArray *servingCellBeamInfos;
  unsigned __int8 v11;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class(self, v5)))
    goto LABEL_102;
  has = self->_has;
  v7 = *((_DWORD *)v4 + 26);
  if ((*(_BYTE *)&has & 1) != 0)
  {
    if ((v7 & 1) == 0 || self->_timestamp != *((_QWORD *)v4 + 1))
      goto LABEL_102;
  }
  else if ((v7 & 1) != 0)
  {
    goto LABEL_102;
  }
  if ((*(_WORD *)&has & 0x200) != 0)
  {
    if ((v7 & 0x200) == 0 || self->_numAttempt != *((_DWORD *)v4 + 12))
      goto LABEL_102;
  }
  else if ((v7 & 0x200) != 0)
  {
    goto LABEL_102;
  }
  if ((*(_WORD *)&has & 0x4000) != 0)
  {
    if ((v7 & 0x4000) == 0 || self->_rachResult != *((_DWORD *)v4 + 19))
      goto LABEL_102;
  }
  else if ((v7 & 0x4000) != 0)
  {
    goto LABEL_102;
  }
  if ((*(_WORD *)&has & 0x1000) != 0)
  {
    if ((v7 & 0x1000) == 0 || self->_rachContention != *((_DWORD *)v4 + 17))
      goto LABEL_102;
  }
  else if ((v7 & 0x1000) != 0)
  {
    goto LABEL_102;
  }
  if ((*(_WORD *)&has & 0x8000) != 0)
  {
    if ((v7 & 0x8000) == 0 || self->_ssbId != *((_DWORD *)v4 + 22))
      goto LABEL_102;
  }
  else if ((v7 & 0x8000) != 0)
  {
    goto LABEL_102;
  }
  if ((*(_BYTE *)&has & 0x10) != 0)
  {
    if ((v7 & 0x10) == 0 || self->_csiRsId != *((_DWORD *)v4 + 7))
      goto LABEL_102;
  }
  else if ((v7 & 0x10) != 0)
  {
    goto LABEL_102;
  }
  if ((*(_BYTE *)&has & 4) != 0)
  {
    if ((v7 & 4) == 0 || self->_carrierId != *((_DWORD *)v4 + 5))
      goto LABEL_102;
  }
  else if ((v7 & 4) != 0)
  {
    goto LABEL_102;
  }
  if ((*(_WORD *)&has & 0x100) != 0)
  {
    if ((v7 & 0x100) == 0 || self->_lastTxPower != *((_DWORD *)v4 + 11))
      goto LABEL_102;
  }
  else if ((v7 & 0x100) != 0)
  {
    goto LABEL_102;
  }
  if ((*(_DWORD *)&has & 0x20000) != 0)
  {
    if ((v7 & 0x20000) == 0 || self->_tac != *((_DWORD *)v4 + 24))
      goto LABEL_102;
  }
  else if ((v7 & 0x20000) != 0)
  {
    goto LABEL_102;
  }
  if ((*(_BYTE *)&has & 8) != 0)
  {
    if ((v7 & 8) == 0 || self->_cellId != *((_DWORD *)v4 + 6))
      goto LABEL_102;
  }
  else if ((v7 & 8) != 0)
  {
    goto LABEL_102;
  }
  if ((*(_BYTE *)&has & 2) != 0)
  {
    if ((v7 & 2) == 0 || self->_accbState != *((_DWORD *)v4 + 4))
      goto LABEL_102;
  }
  else if ((v7 & 2) != 0)
  {
    goto LABEL_102;
  }
  if ((*(_WORD *)&has & 0x400) != 0)
  {
    if ((v7 & 0x400) == 0 || self->_numSubs != *((_DWORD *)v4 + 13))
      goto LABEL_102;
  }
  else if ((v7 & 0x400) != 0)
  {
    goto LABEL_102;
  }
  plmn = self->_plmn;
  if ((unint64_t)plmn | *((_QWORD *)v4 + 7))
  {
    if (!-[NSData isEqual:](plmn, "isEqual:"))
    {
LABEL_102:
      v11 = 0;
      goto LABEL_103;
    }
    has = self->_has;
  }
  v9 = *((_DWORD *)v4 + 26);
  if ((*(_DWORD *)&has & 0x10000) != 0)
  {
    if ((v9 & 0x10000) == 0 || self->_subsId != *((_DWORD *)v4 + 23))
      goto LABEL_102;
  }
  else if ((v9 & 0x10000) != 0)
  {
    goto LABEL_102;
  }
  if ((*(_WORD *)&has & 0x2000) != 0)
  {
    if ((v9 & 0x2000) == 0 || self->_rachReason != *((_DWORD *)v4 + 18))
      goto LABEL_102;
  }
  else if ((v9 & 0x2000) != 0)
  {
    goto LABEL_102;
  }
  if ((*(_DWORD *)&has & 0x40000) != 0)
  {
    if ((v9 & 0x40000) == 0 || self->_txPowerDiff != *((_DWORD *)v4 + 25))
      goto LABEL_102;
  }
  else if ((v9 & 0x40000) != 0)
  {
    goto LABEL_102;
  }
  if ((*(_BYTE *)&has & 0x20) != 0)
  {
    if ((v9 & 0x20) == 0 || self->_dcMode != *((_DWORD *)v4 + 8))
      goto LABEL_102;
  }
  else if ((v9 & 0x20) != 0)
  {
    goto LABEL_102;
  }
  if ((*(_WORD *)&has & 0x800) != 0)
  {
    if ((v9 & 0x800) == 0 || self->_psPref != *((_DWORD *)v4 + 16))
      goto LABEL_102;
  }
  else if ((v9 & 0x800) != 0)
  {
    goto LABEL_102;
  }
  if ((*(_BYTE *)&has & 0x80) != 0)
  {
    if ((v9 & 0x80) == 0 || self->_freqRange != *((_DWORD *)v4 + 10))
      goto LABEL_102;
  }
  else if ((v9 & 0x80) != 0)
  {
    goto LABEL_102;
  }
  if ((*(_BYTE *)&has & 0x40) != 0)
  {
    if ((v9 & 0x40) == 0 || self->_freqBandInd != *((_DWORD *)v4 + 9))
      goto LABEL_102;
  }
  else if ((v9 & 0x40) != 0)
  {
    goto LABEL_102;
  }
  servingCellBeamInfos = self->_servingCellBeamInfos;
  if ((unint64_t)servingCellBeamInfos | *((_QWORD *)v4 + 10))
    v11 = -[NSMutableArray isEqual:](servingCellBeamInfos, "isEqual:");
  else
    v11 = 1;
LABEL_103:

  return v11;
}

- (unint64_t)hash
{
  $CA3C5A67E5C9B5875AF43B507ECCA79F has;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  unint64_t v11;
  $CA3C5A67E5C9B5875AF43B507ECCA79F v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  unint64_t v25;

  has = self->_has;
  if ((*(_BYTE *)&has & 1) != 0)
  {
    v25 = 2654435761u * self->_timestamp;
    if ((*(_WORD *)&has & 0x200) != 0)
    {
LABEL_3:
      v24 = 2654435761 * self->_numAttempt;
      if ((*(_WORD *)&has & 0x4000) != 0)
        goto LABEL_4;
      goto LABEL_16;
    }
  }
  else
  {
    v25 = 0;
    if ((*(_WORD *)&has & 0x200) != 0)
      goto LABEL_3;
  }
  v24 = 0;
  if ((*(_WORD *)&has & 0x4000) != 0)
  {
LABEL_4:
    v23 = 2654435761 * self->_rachResult;
    if ((*(_WORD *)&has & 0x1000) != 0)
      goto LABEL_5;
    goto LABEL_17;
  }
LABEL_16:
  v23 = 0;
  if ((*(_WORD *)&has & 0x1000) != 0)
  {
LABEL_5:
    v22 = 2654435761 * self->_rachContention;
    if ((*(_WORD *)&has & 0x8000) != 0)
      goto LABEL_6;
    goto LABEL_18;
  }
LABEL_17:
  v22 = 0;
  if ((*(_WORD *)&has & 0x8000) != 0)
  {
LABEL_6:
    v21 = 2654435761 * self->_ssbId;
    if ((*(_BYTE *)&has & 0x10) != 0)
      goto LABEL_7;
    goto LABEL_19;
  }
LABEL_18:
  v21 = 0;
  if ((*(_BYTE *)&has & 0x10) != 0)
  {
LABEL_7:
    v4 = 2654435761 * self->_csiRsId;
    if ((*(_BYTE *)&has & 4) != 0)
      goto LABEL_8;
    goto LABEL_20;
  }
LABEL_19:
  v4 = 0;
  if ((*(_BYTE *)&has & 4) != 0)
  {
LABEL_8:
    v5 = 2654435761 * self->_carrierId;
    if ((*(_WORD *)&has & 0x100) != 0)
      goto LABEL_9;
    goto LABEL_21;
  }
LABEL_20:
  v5 = 0;
  if ((*(_WORD *)&has & 0x100) != 0)
  {
LABEL_9:
    v6 = 2654435761 * self->_lastTxPower;
    if ((*(_DWORD *)&has & 0x20000) != 0)
      goto LABEL_10;
    goto LABEL_22;
  }
LABEL_21:
  v6 = 0;
  if ((*(_DWORD *)&has & 0x20000) != 0)
  {
LABEL_10:
    v7 = 2654435761 * self->_tac;
    if ((*(_BYTE *)&has & 8) != 0)
      goto LABEL_11;
    goto LABEL_23;
  }
LABEL_22:
  v7 = 0;
  if ((*(_BYTE *)&has & 8) != 0)
  {
LABEL_11:
    v8 = 2654435761 * self->_cellId;
    if ((*(_BYTE *)&has & 2) != 0)
      goto LABEL_12;
LABEL_24:
    v9 = 0;
    if ((*(_WORD *)&has & 0x400) != 0)
      goto LABEL_13;
    goto LABEL_25;
  }
LABEL_23:
  v8 = 0;
  if ((*(_BYTE *)&has & 2) == 0)
    goto LABEL_24;
LABEL_12:
  v9 = 2654435761 * self->_accbState;
  if ((*(_WORD *)&has & 0x400) != 0)
  {
LABEL_13:
    v10 = 2654435761 * self->_numSubs;
    goto LABEL_26;
  }
LABEL_25:
  v10 = 0;
LABEL_26:
  v11 = (unint64_t)-[NSData hash](self->_plmn, "hash");
  v12 = self->_has;
  if ((*(_DWORD *)&v12 & 0x10000) != 0)
  {
    v13 = 2654435761 * self->_subsId;
    if ((*(_WORD *)&v12 & 0x2000) != 0)
    {
LABEL_28:
      v14 = 2654435761 * self->_rachReason;
      if ((*(_DWORD *)&v12 & 0x40000) != 0)
        goto LABEL_29;
      goto LABEL_36;
    }
  }
  else
  {
    v13 = 0;
    if ((*(_WORD *)&v12 & 0x2000) != 0)
      goto LABEL_28;
  }
  v14 = 0;
  if ((*(_DWORD *)&v12 & 0x40000) != 0)
  {
LABEL_29:
    v15 = 2654435761 * self->_txPowerDiff;
    if ((*(_BYTE *)&v12 & 0x20) != 0)
      goto LABEL_30;
    goto LABEL_37;
  }
LABEL_36:
  v15 = 0;
  if ((*(_BYTE *)&v12 & 0x20) != 0)
  {
LABEL_30:
    v16 = 2654435761 * self->_dcMode;
    if ((*(_WORD *)&v12 & 0x800) != 0)
      goto LABEL_31;
    goto LABEL_38;
  }
LABEL_37:
  v16 = 0;
  if ((*(_WORD *)&v12 & 0x800) != 0)
  {
LABEL_31:
    v17 = 2654435761 * self->_psPref;
    if ((*(_BYTE *)&v12 & 0x80) != 0)
      goto LABEL_32;
LABEL_39:
    v18 = 0;
    if ((*(_BYTE *)&v12 & 0x40) != 0)
      goto LABEL_33;
LABEL_40:
    v19 = 0;
    return v24 ^ v25 ^ v23 ^ v22 ^ v21 ^ v4 ^ v5 ^ v6 ^ v7 ^ v8 ^ v9 ^ v10 ^ v13 ^ v14 ^ v15 ^ v16 ^ v17 ^ v18 ^ v11 ^ v19 ^ (unint64_t)-[NSMutableArray hash](self->_servingCellBeamInfos, "hash");
  }
LABEL_38:
  v17 = 0;
  if ((*(_BYTE *)&v12 & 0x80) == 0)
    goto LABEL_39;
LABEL_32:
  v18 = 2654435761 * self->_freqRange;
  if ((*(_BYTE *)&v12 & 0x40) == 0)
    goto LABEL_40;
LABEL_33:
  v19 = 2654435761 * self->_freqBandInd;
  return v24 ^ v25 ^ v23 ^ v22 ^ v21 ^ v4 ^ v5 ^ v6 ^ v7 ^ v8 ^ v9 ^ v10 ^ v13 ^ v14 ^ v15 ^ v16 ^ v17 ^ v18 ^ v11 ^ v19 ^ (unint64_t)-[NSMutableArray hash](self->_servingCellBeamInfos, "hash");
}

- (void)mergeFrom:(id)a3
{
  id v4;
  id v5;
  int v6;
  int v7;
  id v8;
  id v9;
  id v10;
  uint64_t v11;
  void *i;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];

  v4 = a3;
  v5 = v4;
  v6 = *((_DWORD *)v4 + 26);
  if ((v6 & 1) != 0)
  {
    self->_timestamp = *((_QWORD *)v4 + 1);
    *(_DWORD *)&self->_has |= 1u;
    v6 = *((_DWORD *)v4 + 26);
    if ((v6 & 0x200) == 0)
    {
LABEL_3:
      if ((v6 & 0x4000) == 0)
        goto LABEL_4;
      goto LABEL_34;
    }
  }
  else if ((v6 & 0x200) == 0)
  {
    goto LABEL_3;
  }
  self->_numAttempt = *((_DWORD *)v4 + 12);
  *(_DWORD *)&self->_has |= 0x200u;
  v6 = *((_DWORD *)v4 + 26);
  if ((v6 & 0x4000) == 0)
  {
LABEL_4:
    if ((v6 & 0x1000) == 0)
      goto LABEL_5;
    goto LABEL_35;
  }
LABEL_34:
  self->_rachResult = *((_DWORD *)v4 + 19);
  *(_DWORD *)&self->_has |= 0x4000u;
  v6 = *((_DWORD *)v4 + 26);
  if ((v6 & 0x1000) == 0)
  {
LABEL_5:
    if ((v6 & 0x8000) == 0)
      goto LABEL_6;
    goto LABEL_36;
  }
LABEL_35:
  self->_rachContention = *((_DWORD *)v4 + 17);
  *(_DWORD *)&self->_has |= 0x1000u;
  v6 = *((_DWORD *)v4 + 26);
  if ((v6 & 0x8000) == 0)
  {
LABEL_6:
    if ((v6 & 0x10) == 0)
      goto LABEL_7;
    goto LABEL_37;
  }
LABEL_36:
  self->_ssbId = *((_DWORD *)v4 + 22);
  *(_DWORD *)&self->_has |= 0x8000u;
  v6 = *((_DWORD *)v4 + 26);
  if ((v6 & 0x10) == 0)
  {
LABEL_7:
    if ((v6 & 4) == 0)
      goto LABEL_8;
    goto LABEL_38;
  }
LABEL_37:
  self->_csiRsId = *((_DWORD *)v4 + 7);
  *(_DWORD *)&self->_has |= 0x10u;
  v6 = *((_DWORD *)v4 + 26);
  if ((v6 & 4) == 0)
  {
LABEL_8:
    if ((v6 & 0x100) == 0)
      goto LABEL_9;
    goto LABEL_39;
  }
LABEL_38:
  self->_carrierId = *((_DWORD *)v4 + 5);
  *(_DWORD *)&self->_has |= 4u;
  v6 = *((_DWORD *)v4 + 26);
  if ((v6 & 0x100) == 0)
  {
LABEL_9:
    if ((v6 & 0x20000) == 0)
      goto LABEL_10;
    goto LABEL_40;
  }
LABEL_39:
  self->_lastTxPower = *((_DWORD *)v4 + 11);
  *(_DWORD *)&self->_has |= 0x100u;
  v6 = *((_DWORD *)v4 + 26);
  if ((v6 & 0x20000) == 0)
  {
LABEL_10:
    if ((v6 & 8) == 0)
      goto LABEL_11;
    goto LABEL_41;
  }
LABEL_40:
  self->_tac = *((_DWORD *)v4 + 24);
  *(_DWORD *)&self->_has |= 0x20000u;
  v6 = *((_DWORD *)v4 + 26);
  if ((v6 & 8) == 0)
  {
LABEL_11:
    if ((v6 & 2) == 0)
      goto LABEL_12;
    goto LABEL_42;
  }
LABEL_41:
  self->_cellId = *((_DWORD *)v4 + 6);
  *(_DWORD *)&self->_has |= 8u;
  v6 = *((_DWORD *)v4 + 26);
  if ((v6 & 2) == 0)
  {
LABEL_12:
    if ((v6 & 0x400) == 0)
      goto LABEL_14;
    goto LABEL_13;
  }
LABEL_42:
  self->_accbState = *((_DWORD *)v4 + 4);
  *(_DWORD *)&self->_has |= 2u;
  if ((*((_DWORD *)v4 + 26) & 0x400) != 0)
  {
LABEL_13:
    self->_numSubs = *((_DWORD *)v4 + 13);
    *(_DWORD *)&self->_has |= 0x400u;
  }
LABEL_14:
  if (*((_QWORD *)v4 + 7))
    -[CellularNrRachAttempt setPlmn:](self, "setPlmn:");
  v7 = *((_DWORD *)v5 + 26);
  if ((v7 & 0x10000) != 0)
  {
    self->_subsId = *((_DWORD *)v5 + 23);
    *(_DWORD *)&self->_has |= 0x10000u;
    v7 = *((_DWORD *)v5 + 26);
    if ((v7 & 0x2000) == 0)
    {
LABEL_18:
      if ((v7 & 0x40000) == 0)
        goto LABEL_19;
      goto LABEL_46;
    }
  }
  else if ((v7 & 0x2000) == 0)
  {
    goto LABEL_18;
  }
  self->_rachReason = *((_DWORD *)v5 + 18);
  *(_DWORD *)&self->_has |= 0x2000u;
  v7 = *((_DWORD *)v5 + 26);
  if ((v7 & 0x40000) == 0)
  {
LABEL_19:
    if ((v7 & 0x20) == 0)
      goto LABEL_20;
    goto LABEL_47;
  }
LABEL_46:
  self->_txPowerDiff = *((_DWORD *)v5 + 25);
  *(_DWORD *)&self->_has |= 0x40000u;
  v7 = *((_DWORD *)v5 + 26);
  if ((v7 & 0x20) == 0)
  {
LABEL_20:
    if ((v7 & 0x800) == 0)
      goto LABEL_21;
    goto LABEL_48;
  }
LABEL_47:
  self->_dcMode = *((_DWORD *)v5 + 8);
  *(_DWORD *)&self->_has |= 0x20u;
  v7 = *((_DWORD *)v5 + 26);
  if ((v7 & 0x800) == 0)
  {
LABEL_21:
    if ((v7 & 0x80) == 0)
      goto LABEL_22;
    goto LABEL_49;
  }
LABEL_48:
  self->_psPref = *((_DWORD *)v5 + 16);
  *(_DWORD *)&self->_has |= 0x800u;
  v7 = *((_DWORD *)v5 + 26);
  if ((v7 & 0x80) == 0)
  {
LABEL_22:
    if ((v7 & 0x40) == 0)
      goto LABEL_24;
    goto LABEL_23;
  }
LABEL_49:
  self->_freqRange = *((_DWORD *)v5 + 10);
  *(_DWORD *)&self->_has |= 0x80u;
  if ((*((_DWORD *)v5 + 26) & 0x40) != 0)
  {
LABEL_23:
    self->_freqBandInd = *((_DWORD *)v5 + 9);
    *(_DWORD *)&self->_has |= 0x40u;
  }
LABEL_24:
  v15 = 0u;
  v16 = 0u;
  v13 = 0u;
  v14 = 0u;
  v8 = *((id *)v5 + 10);
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v14;
    do
    {
      for (i = 0; i != v10; i = (char *)i + 1)
      {
        if (*(_QWORD *)v14 != v11)
          objc_enumerationMutation(v8);
        -[CellularNrRachAttempt addServingCellBeamInfo:](self, "addServingCellBeamInfo:", *(_QWORD *)(*((_QWORD *)&v13 + 1) + 8 * (_QWORD)i), (_QWORD)v13);
      }
      v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v10);
  }

}

- (unint64_t)timestamp
{
  return self->_timestamp;
}

- (unsigned)numAttempt
{
  return self->_numAttempt;
}

- (unsigned)rachResult
{
  return self->_rachResult;
}

- (unsigned)rachContention
{
  return self->_rachContention;
}

- (unsigned)ssbId
{
  return self->_ssbId;
}

- (unsigned)csiRsId
{
  return self->_csiRsId;
}

- (unsigned)carrierId
{
  return self->_carrierId;
}

- (int)lastTxPower
{
  return self->_lastTxPower;
}

- (unsigned)tac
{
  return self->_tac;
}

- (unsigned)cellId
{
  return self->_cellId;
}

- (unsigned)accbState
{
  return self->_accbState;
}

- (unsigned)numSubs
{
  return self->_numSubs;
}

- (NSData)plmn
{
  return self->_plmn;
}

- (void)setPlmn:(id)a3
{
  objc_storeStrong((id *)&self->_plmn, a3);
}

- (unsigned)subsId
{
  return self->_subsId;
}

- (unsigned)rachReason
{
  return self->_rachReason;
}

- (int)txPowerDiff
{
  return self->_txPowerDiff;
}

- (unsigned)dcMode
{
  return self->_dcMode;
}

- (unsigned)psPref
{
  return self->_psPref;
}

- (unsigned)freqRange
{
  return self->_freqRange;
}

- (unsigned)freqBandInd
{
  return self->_freqBandInd;
}

- (NSMutableArray)servingCellBeamInfos
{
  return self->_servingCellBeamInfos;
}

- (void)setServingCellBeamInfos:(id)a3
{
  objc_storeStrong((id *)&self->_servingCellBeamInfos, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_servingCellBeamInfos, 0);
  objc_storeStrong((id *)&self->_plmn, 0);
}

@end
