@implementation CellularNrOtaMsg

- (void)setTimestamp:(unint64_t)a3
{
  *(_DWORD *)&self->_has |= 1u;
  self->_timestamp = a3;
}

- (void)setHasTimestamp:(BOOL)a3
{
  self->_has = ($816A9F7056A322B43461E2DBEB40330F)(*(_DWORD *)&self->_has & 0xFFFFFFFE | a3);
}

- (BOOL)hasTimestamp
{
  return *(_DWORD *)&self->_has & 1;
}

- (void)setPhyCellId:(unsigned int)a3
{
  *(_DWORD *)&self->_has |= 0x8000u;
  self->_phyCellId = a3;
}

- (void)setHasPhyCellId:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 0x8000;
  else
    v3 = 0;
  self->_has = ($816A9F7056A322B43461E2DBEB40330F)(*(_DWORD *)&self->_has & 0xFFFF7FFF | v3);
}

- (BOOL)hasPhyCellId
{
  return *((unsigned __int8 *)&self->_has + 1) >> 7;
}

- (void)setFreq:(unsigned int)a3
{
  *(_DWORD *)&self->_has |= 0x40u;
  self->_freq = a3;
}

- (void)setHasFreq:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 64;
  else
    v3 = 0;
  self->_has = ($816A9F7056A322B43461E2DBEB40330F)(*(_DWORD *)&self->_has & 0xFFFFFFBF | v3);
}

- (BOOL)hasFreq
{
  return (*(_BYTE *)&self->_has >> 6) & 1;
}

- (void)setRbId:(unsigned int)a3
{
  *(_DWORD *)&self->_has |= 0x20000u;
  self->_rbId = a3;
}

- (void)setHasRbId:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 0x20000;
  else
    v3 = 0;
  self->_has = ($816A9F7056A322B43461E2DBEB40330F)(*(_DWORD *)&self->_has & 0xFFFDFFFF | v3);
}

- (BOOL)hasRbId
{
  return (*((unsigned __int8 *)&self->_has + 2) >> 1) & 1;
}

- (void)setChannel:(int)a3
{
  *(_DWORD *)&self->_has |= 8u;
  self->_channel = a3;
}

- (void)setHasChannel:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 8;
  else
    v3 = 0;
  self->_has = ($816A9F7056A322B43461E2DBEB40330F)(*(_DWORD *)&self->_has & 0xFFFFFFF7 | v3);
}

- (BOOL)hasChannel
{
  return (*(_BYTE *)&self->_has >> 3) & 1;
}

- (void)setMsgType:(unsigned int)a3
{
  *(_DWORD *)&self->_has |= 0x1000u;
  self->_msgType = a3;
}

- (void)setHasMsgType:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 4096;
  else
    v3 = 0;
  self->_has = ($816A9F7056A322B43461E2DBEB40330F)(*(_DWORD *)&self->_has & 0xFFFFEFFF | v3);
}

- (BOOL)hasMsgType
{
  return (*((unsigned __int8 *)&self->_has + 1) >> 4) & 1;
}

- (void)setLength:(unsigned int)a3
{
  *(_DWORD *)&self->_has |= 0x200u;
  self->_length = a3;
}

- (void)setHasLength:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 512;
  else
    v3 = 0;
  self->_has = ($816A9F7056A322B43461E2DBEB40330F)(*(_DWORD *)&self->_has & 0xFFFFFDFF | v3);
}

- (BOOL)hasLength
{
  return (*((unsigned __int8 *)&self->_has + 1) >> 1) & 1;
}

- (BOOL)hasContent
{
  return self->_content != 0;
}

- (void)setDlBw:(unsigned int)a3
{
  *(_DWORD *)&self->_has |= 0x20u;
  self->_dlBw = a3;
}

- (void)setHasDlBw:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 32;
  else
    v3 = 0;
  self->_has = ($816A9F7056A322B43461E2DBEB40330F)(*(_DWORD *)&self->_has & 0xFFFFFFDF | v3);
}

- (BOOL)hasDlBw
{
  return (*(_BYTE *)&self->_has >> 5) & 1;
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
  self->_has = ($816A9F7056A322B43461E2DBEB40330F)(*(_DWORD *)&self->_has & 0xFFFFFFFB | v3);
}

- (BOOL)hasCellId
{
  return (*(_BYTE *)&self->_has >> 2) & 1;
}

- (void)setFreqBandInd:(unsigned int)a3
{
  *(_DWORD *)&self->_has |= 0x80u;
  self->_freqBandInd = a3;
}

- (void)setHasFreqBandInd:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 128;
  else
    v3 = 0;
  self->_has = ($816A9F7056A322B43461E2DBEB40330F)(*(_DWORD *)&self->_has & 0xFFFFFF7F | v3);
}

- (BOOL)hasFreqBandInd
{
  return *(_BYTE *)&self->_has >> 7;
}

- (void)setTrackingAreaCode:(unsigned int)a3
{
  *(_DWORD *)&self->_has |= 0x1000000u;
  self->_trackingAreaCode = a3;
}

- (void)setHasTrackingAreaCode:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 0x1000000;
  else
    v3 = 0;
  self->_has = ($816A9F7056A322B43461E2DBEB40330F)(*(_DWORD *)&self->_has & 0xFEFFFFFF | v3);
}

- (BOOL)hasTrackingAreaCode
{
  return *((_BYTE *)&self->_has + 3) & 1;
}

- (void)setSelPlmnMcc:(unsigned int)a3
{
  *(_DWORD *)&self->_has |= 0x40000u;
  self->_selPlmnMcc = a3;
}

- (void)setHasSelPlmnMcc:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 0x40000;
  else
    v3 = 0;
  self->_has = ($816A9F7056A322B43461E2DBEB40330F)(*(_DWORD *)&self->_has & 0xFFFBFFFF | v3);
}

- (BOOL)hasSelPlmnMcc
{
  return (*((unsigned __int8 *)&self->_has + 2) >> 2) & 1;
}

- (void)setSelPlmnMnc:(unsigned int)a3
{
  *(_DWORD *)&self->_has |= 0x80000u;
  self->_selPlmnMnc = a3;
}

- (void)setHasSelPlmnMnc:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 0x80000;
  else
    v3 = 0;
  self->_has = ($816A9F7056A322B43461E2DBEB40330F)(*(_DWORD *)&self->_has & 0xFFF7FFFF | v3);
}

- (BOOL)hasSelPlmnMnc
{
  return (*((unsigned __int8 *)&self->_has + 2) >> 3) & 1;
}

- (void)setNumMncDigits:(unsigned int)a3
{
  *(_DWORD *)&self->_has |= 0x2000u;
  self->_numMncDigits = a3;
}

- (void)setHasNumMncDigits:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 0x2000;
  else
    v3 = 0;
  self->_has = ($816A9F7056A322B43461E2DBEB40330F)(*(_DWORD *)&self->_has & 0xFFFFDFFF | v3);
}

- (BOOL)hasNumMncDigits
{
  return (*((unsigned __int8 *)&self->_has + 1) >> 5) & 1;
}

- (void)setDeployment:(unsigned int)a3
{
  *(_DWORD *)&self->_has |= 0x10u;
  self->_deployment = a3;
}

- (void)setHasDeployment:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 16;
  else
    v3 = 0;
  self->_has = ($816A9F7056A322B43461E2DBEB40330F)(*(_DWORD *)&self->_has & 0xFFFFFFEF | v3);
}

- (BOOL)hasDeployment
{
  return (*(_BYTE *)&self->_has >> 4) & 1;
}

- (void)setFreqRange:(unsigned int)a3
{
  *(_DWORD *)&self->_has |= 0x100u;
  self->_freqRange = a3;
}

- (void)setHasFreqRange:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 256;
  else
    v3 = 0;
  self->_has = ($816A9F7056A322B43461E2DBEB40330F)(*(_DWORD *)&self->_has & 0xFFFFFEFF | v3);
}

- (BOOL)hasFreqRange
{
  return *((_BYTE *)&self->_has + 1) & 1;
}

- (void)setLteGci:(unsigned int)a3
{
  *(_DWORD *)&self->_has |= 0x800u;
  self->_lteGci = a3;
}

- (void)setHasLteGci:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 2048;
  else
    v3 = 0;
  self->_has = ($816A9F7056A322B43461E2DBEB40330F)(*(_DWORD *)&self->_has & 0xFFFFF7FF | v3);
}

- (BOOL)hasLteGci
{
  return (*((unsigned __int8 *)&self->_has + 1) >> 3) & 1;
}

- (void)setLteBw:(unsigned int)a3
{
  *(_DWORD *)&self->_has |= 0x400u;
  self->_lteBw = a3;
}

- (void)setHasLteBw:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 1024;
  else
    v3 = 0;
  self->_has = ($816A9F7056A322B43461E2DBEB40330F)(*(_DWORD *)&self->_has & 0xFFFFFBFF | v3);
}

- (BOOL)hasLteBw
{
  return (*((unsigned __int8 *)&self->_has + 1) >> 2) & 1;
}

- (void)setBwp:(unsigned int)a3
{
  *(_DWORD *)&self->_has |= 2u;
  self->_bwp = a3;
}

- (void)setHasBwp:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  self->_has = ($816A9F7056A322B43461E2DBEB40330F)(*(_DWORD *)&self->_has & 0xFFFFFFFD | v3);
}

- (BOOL)hasBwp
{
  return (*(_BYTE *)&self->_has >> 1) & 1;
}

- (void)setSsbCount:(unsigned int)a3
{
  *(_DWORD *)&self->_has |= 0x100000u;
  self->_ssbCount = a3;
}

- (void)setHasSsbCount:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 0x100000;
  else
    v3 = 0;
  self->_has = ($816A9F7056A322B43461E2DBEB40330F)(*(_DWORD *)&self->_has & 0xFFEFFFFF | v3);
}

- (BOOL)hasSsbCount
{
  return (*((unsigned __int8 *)&self->_has + 2) >> 4) & 1;
}

- (void)setSubCarrierSpacing:(unsigned int)a3
{
  *(_DWORD *)&self->_has |= 0x200000u;
  self->_subCarrierSpacing = a3;
}

- (void)setHasSubCarrierSpacing:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 0x200000;
  else
    v3 = 0;
  self->_has = ($816A9F7056A322B43461E2DBEB40330F)(*(_DWORD *)&self->_has & 0xFFDFFFFF | v3);
}

- (BOOL)hasSubCarrierSpacing
{
  return (*((unsigned __int8 *)&self->_has + 2) >> 5) & 1;
}

- (void)setTddUlDlConfigurationCommon:(unsigned int)a3
{
  *(_DWORD *)&self->_has |= 0x800000u;
  self->_tddUlDlConfigurationCommon = a3;
}

- (void)setHasTddUlDlConfigurationCommon:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 0x800000;
  else
    v3 = 0;
  self->_has = ($816A9F7056A322B43461E2DBEB40330F)(*(_DWORD *)&self->_has & 0xFF7FFFFF | v3);
}

- (BOOL)hasTddUlDlConfigurationCommon
{
  return *((unsigned __int8 *)&self->_has + 2) >> 7;
}

- (void)setSplitBearerEver:(BOOL)a3
{
  *(_DWORD *)&self->_has |= 0x2000000u;
  self->_splitBearerEver = a3;
}

- (void)setHasSplitBearerEver:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 0x2000000;
  else
    v3 = 0;
  self->_has = ($816A9F7056A322B43461E2DBEB40330F)(*(_DWORD *)&self->_has & 0xFDFFFFFF | v3);
}

- (BOOL)hasSplitBearerEver
{
  return (*((unsigned __int8 *)&self->_has + 3) >> 1) & 1;
}

- (void)setSubsId:(unsigned int)a3
{
  *(_DWORD *)&self->_has |= 0x400000u;
  self->_subsId = a3;
}

- (void)setHasSubsId:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 0x400000;
  else
    v3 = 0;
  self->_has = ($816A9F7056A322B43461E2DBEB40330F)(*(_DWORD *)&self->_has & 0xFFBFFFFF | v3);
}

- (BOOL)hasSubsId
{
  return (*((unsigned __int8 *)&self->_has + 2) >> 6) & 1;
}

- (void)setNumSubs:(unsigned int)a3
{
  *(_DWORD *)&self->_has |= 0x4000u;
  self->_numSubs = a3;
}

- (void)setHasNumSubs:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 0x4000;
  else
    v3 = 0;
  self->_has = ($816A9F7056A322B43461E2DBEB40330F)(*(_DWORD *)&self->_has & 0xFFFFBFFF | v3);
}

- (BOOL)hasNumSubs
{
  return (*((unsigned __int8 *)&self->_has + 1) >> 6) & 1;
}

- (void)setPsPref:(unsigned int)a3
{
  *(_DWORD *)&self->_has |= 0x10000u;
  self->_psPref = a3;
}

- (void)setHasPsPref:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 0x10000;
  else
    v3 = 0;
  self->_has = ($816A9F7056A322B43461E2DBEB40330F)(*(_DWORD *)&self->_has & 0xFFFEFFFF | v3);
}

- (BOOL)hasPsPref
{
  return *((_BYTE *)&self->_has + 2) & 1;
}

- (id)description
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)CellularNrOtaMsg;
  v3 = -[CellularNrOtaMsg description](&v8, "description");
  v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[CellularNrOtaMsg dictionaryRepresentation](self, "dictionaryRepresentation"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@ %@"), v4, v5));

  return v6;
}

- (id)dictionaryRepresentation
{
  void *v3;
  $816A9F7056A322B43461E2DBEB40330F has;
  void *v5;
  NSData *content;
  $816A9F7056A322B43461E2DBEB40330F v7;
  void *v8;
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
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary"));
  has = self->_has;
  if ((*(_BYTE *)&has & 1) != 0)
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedLongLong:](NSNumber, "numberWithUnsignedLongLong:", self->_timestamp));
    objc_msgSend(v3, "setObject:forKey:", v10, CFSTR("timestamp"));

    has = self->_has;
    if ((*(_WORD *)&has & 0x8000) == 0)
    {
LABEL_3:
      if ((*(_BYTE *)&has & 0x40) == 0)
        goto LABEL_4;
      goto LABEL_34;
    }
  }
  else if ((*(_WORD *)&has & 0x8000) == 0)
  {
    goto LABEL_3;
  }
  v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", self->_phyCellId));
  objc_msgSend(v3, "setObject:forKey:", v11, CFSTR("phy_cell_id"));

  has = self->_has;
  if ((*(_BYTE *)&has & 0x40) == 0)
  {
LABEL_4:
    if ((*(_DWORD *)&has & 0x20000) == 0)
      goto LABEL_5;
    goto LABEL_35;
  }
LABEL_34:
  v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", self->_freq));
  objc_msgSend(v3, "setObject:forKey:", v12, CFSTR("freq"));

  has = self->_has;
  if ((*(_DWORD *)&has & 0x20000) == 0)
  {
LABEL_5:
    if ((*(_BYTE *)&has & 8) == 0)
      goto LABEL_6;
    goto LABEL_36;
  }
LABEL_35:
  v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", self->_rbId));
  objc_msgSend(v3, "setObject:forKey:", v13, CFSTR("rb_id"));

  has = self->_has;
  if ((*(_BYTE *)&has & 8) == 0)
  {
LABEL_6:
    if ((*(_WORD *)&has & 0x1000) == 0)
      goto LABEL_7;
    goto LABEL_37;
  }
LABEL_36:
  v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](NSNumber, "numberWithInt:", self->_channel));
  objc_msgSend(v3, "setObject:forKey:", v14, CFSTR("channel"));

  has = self->_has;
  if ((*(_WORD *)&has & 0x1000) == 0)
  {
LABEL_7:
    if ((*(_WORD *)&has & 0x200) == 0)
      goto LABEL_9;
    goto LABEL_8;
  }
LABEL_37:
  v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", self->_msgType));
  objc_msgSend(v3, "setObject:forKey:", v15, CFSTR("msg_type"));

  if ((*(_DWORD *)&self->_has & 0x200) != 0)
  {
LABEL_8:
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", self->_length));
    objc_msgSend(v3, "setObject:forKey:", v5, CFSTR("length"));

  }
LABEL_9:
  content = self->_content;
  if (content)
    objc_msgSend(v3, "setObject:forKey:", content, CFSTR("content"));
  v7 = self->_has;
  if ((*(_BYTE *)&v7 & 0x20) != 0)
  {
    v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", self->_dlBw));
    objc_msgSend(v3, "setObject:forKey:", v16, CFSTR("dl_bw"));

    v7 = self->_has;
    if ((*(_BYTE *)&v7 & 4) == 0)
    {
LABEL_13:
      if ((*(_BYTE *)&v7 & 0x80) == 0)
        goto LABEL_14;
      goto LABEL_41;
    }
  }
  else if ((*(_BYTE *)&v7 & 4) == 0)
  {
    goto LABEL_13;
  }
  v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", self->_cellId));
  objc_msgSend(v3, "setObject:forKey:", v17, CFSTR("cell_id"));

  v7 = self->_has;
  if ((*(_BYTE *)&v7 & 0x80) == 0)
  {
LABEL_14:
    if ((*(_DWORD *)&v7 & 0x1000000) == 0)
      goto LABEL_15;
    goto LABEL_42;
  }
LABEL_41:
  v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", self->_freqBandInd));
  objc_msgSend(v3, "setObject:forKey:", v18, CFSTR("freq_band_ind"));

  v7 = self->_has;
  if ((*(_DWORD *)&v7 & 0x1000000) == 0)
  {
LABEL_15:
    if ((*(_DWORD *)&v7 & 0x40000) == 0)
      goto LABEL_16;
    goto LABEL_43;
  }
LABEL_42:
  v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", self->_trackingAreaCode));
  objc_msgSend(v3, "setObject:forKey:", v19, CFSTR("tracking_area_code"));

  v7 = self->_has;
  if ((*(_DWORD *)&v7 & 0x40000) == 0)
  {
LABEL_16:
    if ((*(_DWORD *)&v7 & 0x80000) == 0)
      goto LABEL_17;
    goto LABEL_44;
  }
LABEL_43:
  v20 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", self->_selPlmnMcc));
  objc_msgSend(v3, "setObject:forKey:", v20, CFSTR("sel_plmn_mcc"));

  v7 = self->_has;
  if ((*(_DWORD *)&v7 & 0x80000) == 0)
  {
LABEL_17:
    if ((*(_WORD *)&v7 & 0x2000) == 0)
      goto LABEL_18;
    goto LABEL_45;
  }
LABEL_44:
  v21 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", self->_selPlmnMnc));
  objc_msgSend(v3, "setObject:forKey:", v21, CFSTR("sel_plmn_mnc"));

  v7 = self->_has;
  if ((*(_WORD *)&v7 & 0x2000) == 0)
  {
LABEL_18:
    if ((*(_BYTE *)&v7 & 0x10) == 0)
      goto LABEL_19;
    goto LABEL_46;
  }
LABEL_45:
  v22 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", self->_numMncDigits));
  objc_msgSend(v3, "setObject:forKey:", v22, CFSTR("num_mnc_digits"));

  v7 = self->_has;
  if ((*(_BYTE *)&v7 & 0x10) == 0)
  {
LABEL_19:
    if ((*(_WORD *)&v7 & 0x100) == 0)
      goto LABEL_20;
    goto LABEL_47;
  }
LABEL_46:
  v23 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", self->_deployment));
  objc_msgSend(v3, "setObject:forKey:", v23, CFSTR("deployment"));

  v7 = self->_has;
  if ((*(_WORD *)&v7 & 0x100) == 0)
  {
LABEL_20:
    if ((*(_WORD *)&v7 & 0x800) == 0)
      goto LABEL_21;
    goto LABEL_48;
  }
LABEL_47:
  v24 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", self->_freqRange));
  objc_msgSend(v3, "setObject:forKey:", v24, CFSTR("freq_range"));

  v7 = self->_has;
  if ((*(_WORD *)&v7 & 0x800) == 0)
  {
LABEL_21:
    if ((*(_WORD *)&v7 & 0x400) == 0)
      goto LABEL_22;
    goto LABEL_49;
  }
LABEL_48:
  v25 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", self->_lteGci));
  objc_msgSend(v3, "setObject:forKey:", v25, CFSTR("lte_gci"));

  v7 = self->_has;
  if ((*(_WORD *)&v7 & 0x400) == 0)
  {
LABEL_22:
    if ((*(_BYTE *)&v7 & 2) == 0)
      goto LABEL_23;
    goto LABEL_50;
  }
LABEL_49:
  v26 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", self->_lteBw));
  objc_msgSend(v3, "setObject:forKey:", v26, CFSTR("lte_bw"));

  v7 = self->_has;
  if ((*(_BYTE *)&v7 & 2) == 0)
  {
LABEL_23:
    if ((*(_DWORD *)&v7 & 0x100000) == 0)
      goto LABEL_24;
    goto LABEL_51;
  }
LABEL_50:
  v27 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", self->_bwp));
  objc_msgSend(v3, "setObject:forKey:", v27, CFSTR("bwp"));

  v7 = self->_has;
  if ((*(_DWORD *)&v7 & 0x100000) == 0)
  {
LABEL_24:
    if ((*(_DWORD *)&v7 & 0x200000) == 0)
      goto LABEL_25;
    goto LABEL_52;
  }
LABEL_51:
  v28 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", self->_ssbCount));
  objc_msgSend(v3, "setObject:forKey:", v28, CFSTR("ssb_count"));

  v7 = self->_has;
  if ((*(_DWORD *)&v7 & 0x200000) == 0)
  {
LABEL_25:
    if ((*(_DWORD *)&v7 & 0x800000) == 0)
      goto LABEL_26;
    goto LABEL_53;
  }
LABEL_52:
  v29 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", self->_subCarrierSpacing));
  objc_msgSend(v3, "setObject:forKey:", v29, CFSTR("sub_carrier_spacing"));

  v7 = self->_has;
  if ((*(_DWORD *)&v7 & 0x800000) == 0)
  {
LABEL_26:
    if ((*(_DWORD *)&v7 & 0x2000000) == 0)
      goto LABEL_27;
    goto LABEL_54;
  }
LABEL_53:
  v30 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", self->_tddUlDlConfigurationCommon));
  objc_msgSend(v3, "setObject:forKey:", v30, CFSTR("tdd_ul_dl_configuration_common"));

  v7 = self->_has;
  if ((*(_DWORD *)&v7 & 0x2000000) == 0)
  {
LABEL_27:
    if ((*(_DWORD *)&v7 & 0x400000) == 0)
      goto LABEL_28;
    goto LABEL_55;
  }
LABEL_54:
  v31 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", self->_splitBearerEver));
  objc_msgSend(v3, "setObject:forKey:", v31, CFSTR("split_bearer_ever"));

  v7 = self->_has;
  if ((*(_DWORD *)&v7 & 0x400000) == 0)
  {
LABEL_28:
    if ((*(_WORD *)&v7 & 0x4000) == 0)
      goto LABEL_29;
LABEL_56:
    v33 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", self->_numSubs));
    objc_msgSend(v3, "setObject:forKey:", v33, CFSTR("num_subs"));

    if ((*(_DWORD *)&self->_has & 0x10000) == 0)
      return v3;
    goto LABEL_30;
  }
LABEL_55:
  v32 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", self->_subsId));
  objc_msgSend(v3, "setObject:forKey:", v32, CFSTR("subs_id"));

  v7 = self->_has;
  if ((*(_WORD *)&v7 & 0x4000) != 0)
    goto LABEL_56;
LABEL_29:
  if ((*(_DWORD *)&v7 & 0x10000) != 0)
  {
LABEL_30:
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", self->_psPref));
    objc_msgSend(v3, "setObject:forKey:", v8, CFSTR("ps_pref"));

  }
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return sub_1000BA14C((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  $816A9F7056A322B43461E2DBEB40330F has;
  NSData *content;
  $816A9F7056A322B43461E2DBEB40330F v6;
  id v7;

  v7 = a3;
  has = self->_has;
  if ((*(_BYTE *)&has & 1) != 0)
  {
    PBDataWriterWriteUint64Field(v7, self->_timestamp, 1);
    has = self->_has;
    if ((*(_DWORD *)&has & 0x400000) == 0)
    {
LABEL_3:
      if ((*(_WORD *)&has & 0x8000) == 0)
        goto LABEL_4;
      goto LABEL_34;
    }
  }
  else if ((*(_DWORD *)&has & 0x400000) == 0)
  {
    goto LABEL_3;
  }
  PBDataWriterWriteUint32Field(v7, self->_subsId, 2);
  has = self->_has;
  if ((*(_WORD *)&has & 0x8000) == 0)
  {
LABEL_4:
    if ((*(_BYTE *)&has & 0x40) == 0)
      goto LABEL_5;
    goto LABEL_35;
  }
LABEL_34:
  PBDataWriterWriteUint32Field(v7, self->_phyCellId, 4);
  has = self->_has;
  if ((*(_BYTE *)&has & 0x40) == 0)
  {
LABEL_5:
    if ((*(_DWORD *)&has & 0x20000) == 0)
      goto LABEL_6;
    goto LABEL_36;
  }
LABEL_35:
  PBDataWriterWriteUint32Field(v7, self->_freq, 5);
  has = self->_has;
  if ((*(_DWORD *)&has & 0x20000) == 0)
  {
LABEL_6:
    if ((*(_BYTE *)&has & 8) == 0)
      goto LABEL_7;
    goto LABEL_37;
  }
LABEL_36:
  PBDataWriterWriteUint32Field(v7, self->_rbId, 7);
  has = self->_has;
  if ((*(_BYTE *)&has & 8) == 0)
  {
LABEL_7:
    if ((*(_WORD *)&has & 0x1000) == 0)
      goto LABEL_8;
    goto LABEL_38;
  }
LABEL_37:
  PBDataWriterWriteInt32Field(v7, self->_channel, 8);
  has = self->_has;
  if ((*(_WORD *)&has & 0x1000) == 0)
  {
LABEL_8:
    if ((*(_WORD *)&has & 0x200) == 0)
      goto LABEL_10;
    goto LABEL_9;
  }
LABEL_38:
  PBDataWriterWriteUint32Field(v7, self->_msgType, 9);
  if ((*(_DWORD *)&self->_has & 0x200) != 0)
LABEL_9:
    PBDataWriterWriteUint32Field(v7, self->_length, 14);
LABEL_10:
  content = self->_content;
  if (content)
    PBDataWriterWriteDataField(v7, content, 15);
  v6 = self->_has;
  if ((*(_BYTE *)&v6 & 0x20) != 0)
  {
    PBDataWriterWriteUint32Field(v7, self->_dlBw, 16);
    v6 = self->_has;
    if ((*(_BYTE *)&v6 & 4) == 0)
    {
LABEL_14:
      if ((*(_BYTE *)&v6 & 0x80) == 0)
        goto LABEL_15;
      goto LABEL_42;
    }
  }
  else if ((*(_BYTE *)&v6 & 4) == 0)
  {
    goto LABEL_14;
  }
  PBDataWriterWriteUint32Field(v7, self->_cellId, 17);
  v6 = self->_has;
  if ((*(_BYTE *)&v6 & 0x80) == 0)
  {
LABEL_15:
    if ((*(_DWORD *)&v6 & 0x1000000) == 0)
      goto LABEL_16;
    goto LABEL_43;
  }
LABEL_42:
  PBDataWriterWriteUint32Field(v7, self->_freqBandInd, 18);
  v6 = self->_has;
  if ((*(_DWORD *)&v6 & 0x1000000) == 0)
  {
LABEL_16:
    if ((*(_DWORD *)&v6 & 0x40000) == 0)
      goto LABEL_17;
    goto LABEL_44;
  }
LABEL_43:
  PBDataWriterWriteUint32Field(v7, self->_trackingAreaCode, 19);
  v6 = self->_has;
  if ((*(_DWORD *)&v6 & 0x40000) == 0)
  {
LABEL_17:
    if ((*(_DWORD *)&v6 & 0x80000) == 0)
      goto LABEL_18;
    goto LABEL_45;
  }
LABEL_44:
  PBDataWriterWriteUint32Field(v7, self->_selPlmnMcc, 20);
  v6 = self->_has;
  if ((*(_DWORD *)&v6 & 0x80000) == 0)
  {
LABEL_18:
    if ((*(_WORD *)&v6 & 0x2000) == 0)
      goto LABEL_19;
    goto LABEL_46;
  }
LABEL_45:
  PBDataWriterWriteUint32Field(v7, self->_selPlmnMnc, 21);
  v6 = self->_has;
  if ((*(_WORD *)&v6 & 0x2000) == 0)
  {
LABEL_19:
    if ((*(_BYTE *)&v6 & 0x10) == 0)
      goto LABEL_20;
    goto LABEL_47;
  }
LABEL_46:
  PBDataWriterWriteUint32Field(v7, self->_numMncDigits, 22);
  v6 = self->_has;
  if ((*(_BYTE *)&v6 & 0x10) == 0)
  {
LABEL_20:
    if ((*(_WORD *)&v6 & 0x100) == 0)
      goto LABEL_21;
    goto LABEL_48;
  }
LABEL_47:
  PBDataWriterWriteUint32Field(v7, self->_deployment, 23);
  v6 = self->_has;
  if ((*(_WORD *)&v6 & 0x100) == 0)
  {
LABEL_21:
    if ((*(_WORD *)&v6 & 0x800) == 0)
      goto LABEL_22;
    goto LABEL_49;
  }
LABEL_48:
  PBDataWriterWriteUint32Field(v7, self->_freqRange, 24);
  v6 = self->_has;
  if ((*(_WORD *)&v6 & 0x800) == 0)
  {
LABEL_22:
    if ((*(_WORD *)&v6 & 0x400) == 0)
      goto LABEL_23;
    goto LABEL_50;
  }
LABEL_49:
  PBDataWriterWriteUint32Field(v7, self->_lteGci, 25);
  v6 = self->_has;
  if ((*(_WORD *)&v6 & 0x400) == 0)
  {
LABEL_23:
    if ((*(_BYTE *)&v6 & 2) == 0)
      goto LABEL_24;
    goto LABEL_51;
  }
LABEL_50:
  PBDataWriterWriteUint32Field(v7, self->_lteBw, 26);
  v6 = self->_has;
  if ((*(_BYTE *)&v6 & 2) == 0)
  {
LABEL_24:
    if ((*(_DWORD *)&v6 & 0x100000) == 0)
      goto LABEL_25;
    goto LABEL_52;
  }
LABEL_51:
  PBDataWriterWriteUint32Field(v7, self->_bwp, 27);
  v6 = self->_has;
  if ((*(_DWORD *)&v6 & 0x100000) == 0)
  {
LABEL_25:
    if ((*(_DWORD *)&v6 & 0x200000) == 0)
      goto LABEL_26;
    goto LABEL_53;
  }
LABEL_52:
  PBDataWriterWriteUint32Field(v7, self->_ssbCount, 28);
  v6 = self->_has;
  if ((*(_DWORD *)&v6 & 0x200000) == 0)
  {
LABEL_26:
    if ((*(_DWORD *)&v6 & 0x800000) == 0)
      goto LABEL_27;
    goto LABEL_54;
  }
LABEL_53:
  PBDataWriterWriteUint32Field(v7, self->_subCarrierSpacing, 29);
  v6 = self->_has;
  if ((*(_DWORD *)&v6 & 0x800000) == 0)
  {
LABEL_27:
    if ((*(_DWORD *)&v6 & 0x2000000) == 0)
      goto LABEL_28;
    goto LABEL_55;
  }
LABEL_54:
  PBDataWriterWriteUint32Field(v7, self->_tddUlDlConfigurationCommon, 30);
  v6 = self->_has;
  if ((*(_DWORD *)&v6 & 0x2000000) == 0)
  {
LABEL_28:
    if ((*(_WORD *)&v6 & 0x4000) == 0)
      goto LABEL_29;
LABEL_56:
    PBDataWriterWriteUint32Field(v7, self->_numSubs, 32);
    if ((*(_DWORD *)&self->_has & 0x10000) == 0)
      goto LABEL_31;
    goto LABEL_30;
  }
LABEL_55:
  PBDataWriterWriteBOOLField(v7, self->_splitBearerEver, 31);
  v6 = self->_has;
  if ((*(_WORD *)&v6 & 0x4000) != 0)
    goto LABEL_56;
LABEL_29:
  if ((*(_DWORD *)&v6 & 0x10000) != 0)
LABEL_30:
    PBDataWriterWriteUint32Field(v7, self->_psPref, 33);
LABEL_31:

}

- (void)copyTo:(id)a3
{
  _QWORD *v4;
  $816A9F7056A322B43461E2DBEB40330F has;
  $816A9F7056A322B43461E2DBEB40330F v6;
  _QWORD *v7;

  v4 = a3;
  has = self->_has;
  if ((*(_BYTE *)&has & 1) != 0)
  {
    v4[1] = self->_timestamp;
    *((_DWORD *)v4 + 32) |= 1u;
    has = self->_has;
    if ((*(_DWORD *)&has & 0x400000) == 0)
    {
LABEL_3:
      if ((*(_WORD *)&has & 0x8000) == 0)
        goto LABEL_4;
      goto LABEL_34;
    }
  }
  else if ((*(_DWORD *)&has & 0x400000) == 0)
  {
    goto LABEL_3;
  }
  *((_DWORD *)v4 + 28) = self->_subsId;
  *((_DWORD *)v4 + 32) |= 0x400000u;
  has = self->_has;
  if ((*(_WORD *)&has & 0x8000) == 0)
  {
LABEL_4:
    if ((*(_BYTE *)&has & 0x40) == 0)
      goto LABEL_5;
    goto LABEL_35;
  }
LABEL_34:
  *((_DWORD *)v4 + 21) = self->_phyCellId;
  *((_DWORD *)v4 + 32) |= 0x8000u;
  has = self->_has;
  if ((*(_BYTE *)&has & 0x40) == 0)
  {
LABEL_5:
    if ((*(_DWORD *)&has & 0x20000) == 0)
      goto LABEL_6;
    goto LABEL_36;
  }
LABEL_35:
  *((_DWORD *)v4 + 12) = self->_freq;
  *((_DWORD *)v4 + 32) |= 0x40u;
  has = self->_has;
  if ((*(_DWORD *)&has & 0x20000) == 0)
  {
LABEL_6:
    if ((*(_BYTE *)&has & 8) == 0)
      goto LABEL_7;
    goto LABEL_37;
  }
LABEL_36:
  *((_DWORD *)v4 + 23) = self->_rbId;
  *((_DWORD *)v4 + 32) |= 0x20000u;
  has = self->_has;
  if ((*(_BYTE *)&has & 8) == 0)
  {
LABEL_7:
    if ((*(_WORD *)&has & 0x1000) == 0)
      goto LABEL_8;
    goto LABEL_38;
  }
LABEL_37:
  *((_DWORD *)v4 + 6) = self->_channel;
  *((_DWORD *)v4 + 32) |= 8u;
  has = self->_has;
  if ((*(_WORD *)&has & 0x1000) == 0)
  {
LABEL_8:
    if ((*(_WORD *)&has & 0x200) == 0)
      goto LABEL_10;
    goto LABEL_9;
  }
LABEL_38:
  *((_DWORD *)v4 + 18) = self->_msgType;
  *((_DWORD *)v4 + 32) |= 0x1000u;
  if ((*(_DWORD *)&self->_has & 0x200) != 0)
  {
LABEL_9:
    *((_DWORD *)v4 + 15) = self->_length;
    *((_DWORD *)v4 + 32) |= 0x200u;
  }
LABEL_10:
  if (self->_content)
  {
    v7 = v4;
    objc_msgSend(v4, "setContent:");
    v4 = v7;
  }
  v6 = self->_has;
  if ((*(_BYTE *)&v6 & 0x20) != 0)
  {
    *((_DWORD *)v4 + 11) = self->_dlBw;
    *((_DWORD *)v4 + 32) |= 0x20u;
    v6 = self->_has;
    if ((*(_BYTE *)&v6 & 4) == 0)
    {
LABEL_14:
      if ((*(_BYTE *)&v6 & 0x80) == 0)
        goto LABEL_15;
      goto LABEL_42;
    }
  }
  else if ((*(_BYTE *)&v6 & 4) == 0)
  {
    goto LABEL_14;
  }
  *((_DWORD *)v4 + 5) = self->_cellId;
  *((_DWORD *)v4 + 32) |= 4u;
  v6 = self->_has;
  if ((*(_BYTE *)&v6 & 0x80) == 0)
  {
LABEL_15:
    if ((*(_DWORD *)&v6 & 0x1000000) == 0)
      goto LABEL_16;
    goto LABEL_43;
  }
LABEL_42:
  *((_DWORD *)v4 + 13) = self->_freqBandInd;
  *((_DWORD *)v4 + 32) |= 0x80u;
  v6 = self->_has;
  if ((*(_DWORD *)&v6 & 0x1000000) == 0)
  {
LABEL_16:
    if ((*(_DWORD *)&v6 & 0x40000) == 0)
      goto LABEL_17;
    goto LABEL_44;
  }
LABEL_43:
  *((_DWORD *)v4 + 30) = self->_trackingAreaCode;
  *((_DWORD *)v4 + 32) |= 0x1000000u;
  v6 = self->_has;
  if ((*(_DWORD *)&v6 & 0x40000) == 0)
  {
LABEL_17:
    if ((*(_DWORD *)&v6 & 0x80000) == 0)
      goto LABEL_18;
    goto LABEL_45;
  }
LABEL_44:
  *((_DWORD *)v4 + 24) = self->_selPlmnMcc;
  *((_DWORD *)v4 + 32) |= 0x40000u;
  v6 = self->_has;
  if ((*(_DWORD *)&v6 & 0x80000) == 0)
  {
LABEL_18:
    if ((*(_WORD *)&v6 & 0x2000) == 0)
      goto LABEL_19;
    goto LABEL_46;
  }
LABEL_45:
  *((_DWORD *)v4 + 25) = self->_selPlmnMnc;
  *((_DWORD *)v4 + 32) |= 0x80000u;
  v6 = self->_has;
  if ((*(_WORD *)&v6 & 0x2000) == 0)
  {
LABEL_19:
    if ((*(_BYTE *)&v6 & 0x10) == 0)
      goto LABEL_20;
    goto LABEL_47;
  }
LABEL_46:
  *((_DWORD *)v4 + 19) = self->_numMncDigits;
  *((_DWORD *)v4 + 32) |= 0x2000u;
  v6 = self->_has;
  if ((*(_BYTE *)&v6 & 0x10) == 0)
  {
LABEL_20:
    if ((*(_WORD *)&v6 & 0x100) == 0)
      goto LABEL_21;
    goto LABEL_48;
  }
LABEL_47:
  *((_DWORD *)v4 + 10) = self->_deployment;
  *((_DWORD *)v4 + 32) |= 0x10u;
  v6 = self->_has;
  if ((*(_WORD *)&v6 & 0x100) == 0)
  {
LABEL_21:
    if ((*(_WORD *)&v6 & 0x800) == 0)
      goto LABEL_22;
    goto LABEL_49;
  }
LABEL_48:
  *((_DWORD *)v4 + 14) = self->_freqRange;
  *((_DWORD *)v4 + 32) |= 0x100u;
  v6 = self->_has;
  if ((*(_WORD *)&v6 & 0x800) == 0)
  {
LABEL_22:
    if ((*(_WORD *)&v6 & 0x400) == 0)
      goto LABEL_23;
    goto LABEL_50;
  }
LABEL_49:
  *((_DWORD *)v4 + 17) = self->_lteGci;
  *((_DWORD *)v4 + 32) |= 0x800u;
  v6 = self->_has;
  if ((*(_WORD *)&v6 & 0x400) == 0)
  {
LABEL_23:
    if ((*(_BYTE *)&v6 & 2) == 0)
      goto LABEL_24;
    goto LABEL_51;
  }
LABEL_50:
  *((_DWORD *)v4 + 16) = self->_lteBw;
  *((_DWORD *)v4 + 32) |= 0x400u;
  v6 = self->_has;
  if ((*(_BYTE *)&v6 & 2) == 0)
  {
LABEL_24:
    if ((*(_DWORD *)&v6 & 0x100000) == 0)
      goto LABEL_25;
    goto LABEL_52;
  }
LABEL_51:
  *((_DWORD *)v4 + 4) = self->_bwp;
  *((_DWORD *)v4 + 32) |= 2u;
  v6 = self->_has;
  if ((*(_DWORD *)&v6 & 0x100000) == 0)
  {
LABEL_25:
    if ((*(_DWORD *)&v6 & 0x200000) == 0)
      goto LABEL_26;
    goto LABEL_53;
  }
LABEL_52:
  *((_DWORD *)v4 + 26) = self->_ssbCount;
  *((_DWORD *)v4 + 32) |= 0x100000u;
  v6 = self->_has;
  if ((*(_DWORD *)&v6 & 0x200000) == 0)
  {
LABEL_26:
    if ((*(_DWORD *)&v6 & 0x800000) == 0)
      goto LABEL_27;
    goto LABEL_54;
  }
LABEL_53:
  *((_DWORD *)v4 + 27) = self->_subCarrierSpacing;
  *((_DWORD *)v4 + 32) |= 0x200000u;
  v6 = self->_has;
  if ((*(_DWORD *)&v6 & 0x800000) == 0)
  {
LABEL_27:
    if ((*(_DWORD *)&v6 & 0x2000000) == 0)
      goto LABEL_28;
    goto LABEL_55;
  }
LABEL_54:
  *((_DWORD *)v4 + 29) = self->_tddUlDlConfigurationCommon;
  *((_DWORD *)v4 + 32) |= 0x800000u;
  v6 = self->_has;
  if ((*(_DWORD *)&v6 & 0x2000000) == 0)
  {
LABEL_28:
    if ((*(_WORD *)&v6 & 0x4000) == 0)
      goto LABEL_29;
LABEL_56:
    *((_DWORD *)v4 + 20) = self->_numSubs;
    *((_DWORD *)v4 + 32) |= 0x4000u;
    if ((*(_DWORD *)&self->_has & 0x10000) == 0)
      goto LABEL_31;
    goto LABEL_30;
  }
LABEL_55:
  *((_BYTE *)v4 + 124) = self->_splitBearerEver;
  *((_DWORD *)v4 + 32) |= 0x2000000u;
  v6 = self->_has;
  if ((*(_WORD *)&v6 & 0x4000) != 0)
    goto LABEL_56;
LABEL_29:
  if ((*(_DWORD *)&v6 & 0x10000) != 0)
  {
LABEL_30:
    *((_DWORD *)v4 + 22) = self->_psPref;
    *((_DWORD *)v4 + 32) |= 0x10000u;
  }
LABEL_31:

}

- (id)copyWithZone:(_NSZone *)a3
{
  _QWORD *v5;
  _QWORD *v6;
  $816A9F7056A322B43461E2DBEB40330F has;
  id v8;
  void *v9;
  $816A9F7056A322B43461E2DBEB40330F v10;

  v5 = objc_msgSend(objc_msgSend((id)objc_opt_class(self, a2), "allocWithZone:", a3), "init");
  v6 = v5;
  has = self->_has;
  if ((*(_BYTE *)&has & 1) != 0)
  {
    v5[1] = self->_timestamp;
    *((_DWORD *)v5 + 32) |= 1u;
    has = self->_has;
    if ((*(_DWORD *)&has & 0x400000) == 0)
    {
LABEL_3:
      if ((*(_WORD *)&has & 0x8000) == 0)
        goto LABEL_4;
      goto LABEL_32;
    }
  }
  else if ((*(_DWORD *)&has & 0x400000) == 0)
  {
    goto LABEL_3;
  }
  *((_DWORD *)v5 + 28) = self->_subsId;
  *((_DWORD *)v5 + 32) |= 0x400000u;
  has = self->_has;
  if ((*(_WORD *)&has & 0x8000) == 0)
  {
LABEL_4:
    if ((*(_BYTE *)&has & 0x40) == 0)
      goto LABEL_5;
    goto LABEL_33;
  }
LABEL_32:
  *((_DWORD *)v5 + 21) = self->_phyCellId;
  *((_DWORD *)v5 + 32) |= 0x8000u;
  has = self->_has;
  if ((*(_BYTE *)&has & 0x40) == 0)
  {
LABEL_5:
    if ((*(_DWORD *)&has & 0x20000) == 0)
      goto LABEL_6;
    goto LABEL_34;
  }
LABEL_33:
  *((_DWORD *)v5 + 12) = self->_freq;
  *((_DWORD *)v5 + 32) |= 0x40u;
  has = self->_has;
  if ((*(_DWORD *)&has & 0x20000) == 0)
  {
LABEL_6:
    if ((*(_BYTE *)&has & 8) == 0)
      goto LABEL_7;
    goto LABEL_35;
  }
LABEL_34:
  *((_DWORD *)v5 + 23) = self->_rbId;
  *((_DWORD *)v5 + 32) |= 0x20000u;
  has = self->_has;
  if ((*(_BYTE *)&has & 8) == 0)
  {
LABEL_7:
    if ((*(_WORD *)&has & 0x1000) == 0)
      goto LABEL_8;
    goto LABEL_36;
  }
LABEL_35:
  *((_DWORD *)v5 + 6) = self->_channel;
  *((_DWORD *)v5 + 32) |= 8u;
  has = self->_has;
  if ((*(_WORD *)&has & 0x1000) == 0)
  {
LABEL_8:
    if ((*(_WORD *)&has & 0x200) == 0)
      goto LABEL_10;
    goto LABEL_9;
  }
LABEL_36:
  *((_DWORD *)v5 + 18) = self->_msgType;
  *((_DWORD *)v5 + 32) |= 0x1000u;
  if ((*(_DWORD *)&self->_has & 0x200) != 0)
  {
LABEL_9:
    *((_DWORD *)v5 + 15) = self->_length;
    *((_DWORD *)v5 + 32) |= 0x200u;
  }
LABEL_10:
  v8 = -[NSData copyWithZone:](self->_content, "copyWithZone:", a3);
  v9 = (void *)v6[4];
  v6[4] = v8;

  v10 = self->_has;
  if ((*(_BYTE *)&v10 & 0x20) != 0)
  {
    *((_DWORD *)v6 + 11) = self->_dlBw;
    *((_DWORD *)v6 + 32) |= 0x20u;
    v10 = self->_has;
    if ((*(_BYTE *)&v10 & 4) == 0)
    {
LABEL_12:
      if ((*(_BYTE *)&v10 & 0x80) == 0)
        goto LABEL_13;
      goto LABEL_40;
    }
  }
  else if ((*(_BYTE *)&v10 & 4) == 0)
  {
    goto LABEL_12;
  }
  *((_DWORD *)v6 + 5) = self->_cellId;
  *((_DWORD *)v6 + 32) |= 4u;
  v10 = self->_has;
  if ((*(_BYTE *)&v10 & 0x80) == 0)
  {
LABEL_13:
    if ((*(_DWORD *)&v10 & 0x1000000) == 0)
      goto LABEL_14;
    goto LABEL_41;
  }
LABEL_40:
  *((_DWORD *)v6 + 13) = self->_freqBandInd;
  *((_DWORD *)v6 + 32) |= 0x80u;
  v10 = self->_has;
  if ((*(_DWORD *)&v10 & 0x1000000) == 0)
  {
LABEL_14:
    if ((*(_DWORD *)&v10 & 0x40000) == 0)
      goto LABEL_15;
    goto LABEL_42;
  }
LABEL_41:
  *((_DWORD *)v6 + 30) = self->_trackingAreaCode;
  *((_DWORD *)v6 + 32) |= 0x1000000u;
  v10 = self->_has;
  if ((*(_DWORD *)&v10 & 0x40000) == 0)
  {
LABEL_15:
    if ((*(_DWORD *)&v10 & 0x80000) == 0)
      goto LABEL_16;
    goto LABEL_43;
  }
LABEL_42:
  *((_DWORD *)v6 + 24) = self->_selPlmnMcc;
  *((_DWORD *)v6 + 32) |= 0x40000u;
  v10 = self->_has;
  if ((*(_DWORD *)&v10 & 0x80000) == 0)
  {
LABEL_16:
    if ((*(_WORD *)&v10 & 0x2000) == 0)
      goto LABEL_17;
    goto LABEL_44;
  }
LABEL_43:
  *((_DWORD *)v6 + 25) = self->_selPlmnMnc;
  *((_DWORD *)v6 + 32) |= 0x80000u;
  v10 = self->_has;
  if ((*(_WORD *)&v10 & 0x2000) == 0)
  {
LABEL_17:
    if ((*(_BYTE *)&v10 & 0x10) == 0)
      goto LABEL_18;
    goto LABEL_45;
  }
LABEL_44:
  *((_DWORD *)v6 + 19) = self->_numMncDigits;
  *((_DWORD *)v6 + 32) |= 0x2000u;
  v10 = self->_has;
  if ((*(_BYTE *)&v10 & 0x10) == 0)
  {
LABEL_18:
    if ((*(_WORD *)&v10 & 0x100) == 0)
      goto LABEL_19;
    goto LABEL_46;
  }
LABEL_45:
  *((_DWORD *)v6 + 10) = self->_deployment;
  *((_DWORD *)v6 + 32) |= 0x10u;
  v10 = self->_has;
  if ((*(_WORD *)&v10 & 0x100) == 0)
  {
LABEL_19:
    if ((*(_WORD *)&v10 & 0x800) == 0)
      goto LABEL_20;
    goto LABEL_47;
  }
LABEL_46:
  *((_DWORD *)v6 + 14) = self->_freqRange;
  *((_DWORD *)v6 + 32) |= 0x100u;
  v10 = self->_has;
  if ((*(_WORD *)&v10 & 0x800) == 0)
  {
LABEL_20:
    if ((*(_WORD *)&v10 & 0x400) == 0)
      goto LABEL_21;
    goto LABEL_48;
  }
LABEL_47:
  *((_DWORD *)v6 + 17) = self->_lteGci;
  *((_DWORD *)v6 + 32) |= 0x800u;
  v10 = self->_has;
  if ((*(_WORD *)&v10 & 0x400) == 0)
  {
LABEL_21:
    if ((*(_BYTE *)&v10 & 2) == 0)
      goto LABEL_22;
    goto LABEL_49;
  }
LABEL_48:
  *((_DWORD *)v6 + 16) = self->_lteBw;
  *((_DWORD *)v6 + 32) |= 0x400u;
  v10 = self->_has;
  if ((*(_BYTE *)&v10 & 2) == 0)
  {
LABEL_22:
    if ((*(_DWORD *)&v10 & 0x100000) == 0)
      goto LABEL_23;
    goto LABEL_50;
  }
LABEL_49:
  *((_DWORD *)v6 + 4) = self->_bwp;
  *((_DWORD *)v6 + 32) |= 2u;
  v10 = self->_has;
  if ((*(_DWORD *)&v10 & 0x100000) == 0)
  {
LABEL_23:
    if ((*(_DWORD *)&v10 & 0x200000) == 0)
      goto LABEL_24;
    goto LABEL_51;
  }
LABEL_50:
  *((_DWORD *)v6 + 26) = self->_ssbCount;
  *((_DWORD *)v6 + 32) |= 0x100000u;
  v10 = self->_has;
  if ((*(_DWORD *)&v10 & 0x200000) == 0)
  {
LABEL_24:
    if ((*(_DWORD *)&v10 & 0x800000) == 0)
      goto LABEL_25;
    goto LABEL_52;
  }
LABEL_51:
  *((_DWORD *)v6 + 27) = self->_subCarrierSpacing;
  *((_DWORD *)v6 + 32) |= 0x200000u;
  v10 = self->_has;
  if ((*(_DWORD *)&v10 & 0x800000) == 0)
  {
LABEL_25:
    if ((*(_DWORD *)&v10 & 0x2000000) == 0)
      goto LABEL_26;
    goto LABEL_53;
  }
LABEL_52:
  *((_DWORD *)v6 + 29) = self->_tddUlDlConfigurationCommon;
  *((_DWORD *)v6 + 32) |= 0x800000u;
  v10 = self->_has;
  if ((*(_DWORD *)&v10 & 0x2000000) == 0)
  {
LABEL_26:
    if ((*(_WORD *)&v10 & 0x4000) == 0)
      goto LABEL_27;
LABEL_54:
    *((_DWORD *)v6 + 20) = self->_numSubs;
    *((_DWORD *)v6 + 32) |= 0x4000u;
    if ((*(_DWORD *)&self->_has & 0x10000) == 0)
      return v6;
    goto LABEL_28;
  }
LABEL_53:
  *((_BYTE *)v6 + 124) = self->_splitBearerEver;
  *((_DWORD *)v6 + 32) |= 0x2000000u;
  v10 = self->_has;
  if ((*(_WORD *)&v10 & 0x4000) != 0)
    goto LABEL_54;
LABEL_27:
  if ((*(_DWORD *)&v10 & 0x10000) != 0)
  {
LABEL_28:
    *((_DWORD *)v6 + 22) = self->_psPref;
    *((_DWORD *)v6 + 32) |= 0x10000u;
  }
  return v6;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  uint64_t v5;
  $816A9F7056A322B43461E2DBEB40330F has;
  int v7;
  NSData *content;
  int v9;
  BOOL v10;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class(self, v5)))
    goto LABEL_138;
  has = self->_has;
  v7 = *((_DWORD *)v4 + 32);
  if ((*(_BYTE *)&has & 1) != 0)
  {
    if ((v7 & 1) == 0 || self->_timestamp != *((_QWORD *)v4 + 1))
      goto LABEL_138;
  }
  else if ((v7 & 1) != 0)
  {
    goto LABEL_138;
  }
  if ((*(_DWORD *)&has & 0x400000) != 0)
  {
    if ((v7 & 0x400000) == 0 || self->_subsId != *((_DWORD *)v4 + 28))
      goto LABEL_138;
  }
  else if ((v7 & 0x400000) != 0)
  {
    goto LABEL_138;
  }
  if ((*(_WORD *)&has & 0x8000) != 0)
  {
    if ((v7 & 0x8000) == 0 || self->_phyCellId != *((_DWORD *)v4 + 21))
      goto LABEL_138;
  }
  else if ((v7 & 0x8000) != 0)
  {
    goto LABEL_138;
  }
  if ((*(_BYTE *)&has & 0x40) != 0)
  {
    if ((v7 & 0x40) == 0 || self->_freq != *((_DWORD *)v4 + 12))
      goto LABEL_138;
  }
  else if ((v7 & 0x40) != 0)
  {
    goto LABEL_138;
  }
  if ((*(_DWORD *)&has & 0x20000) != 0)
  {
    if ((v7 & 0x20000) == 0 || self->_rbId != *((_DWORD *)v4 + 23))
      goto LABEL_138;
  }
  else if ((v7 & 0x20000) != 0)
  {
    goto LABEL_138;
  }
  if ((*(_BYTE *)&has & 8) != 0)
  {
    if ((v7 & 8) == 0 || self->_channel != *((_DWORD *)v4 + 6))
      goto LABEL_138;
  }
  else if ((v7 & 8) != 0)
  {
    goto LABEL_138;
  }
  if ((*(_WORD *)&has & 0x1000) != 0)
  {
    if ((v7 & 0x1000) == 0 || self->_msgType != *((_DWORD *)v4 + 18))
      goto LABEL_138;
  }
  else if ((v7 & 0x1000) != 0)
  {
    goto LABEL_138;
  }
  if ((*(_WORD *)&has & 0x200) != 0)
  {
    if ((v7 & 0x200) == 0 || self->_length != *((_DWORD *)v4 + 15))
      goto LABEL_138;
  }
  else if ((v7 & 0x200) != 0)
  {
    goto LABEL_138;
  }
  content = self->_content;
  if ((unint64_t)content | *((_QWORD *)v4 + 4))
  {
    if (!-[NSData isEqual:](content, "isEqual:"))
      goto LABEL_138;
    has = self->_has;
  }
  v9 = *((_DWORD *)v4 + 32);
  if ((*(_BYTE *)&has & 0x20) != 0)
  {
    if ((v9 & 0x20) == 0 || self->_dlBw != *((_DWORD *)v4 + 11))
      goto LABEL_138;
  }
  else if ((v9 & 0x20) != 0)
  {
    goto LABEL_138;
  }
  if ((*(_BYTE *)&has & 4) != 0)
  {
    if ((v9 & 4) == 0 || self->_cellId != *((_DWORD *)v4 + 5))
      goto LABEL_138;
  }
  else if ((v9 & 4) != 0)
  {
    goto LABEL_138;
  }
  if ((*(_BYTE *)&has & 0x80) != 0)
  {
    if ((v9 & 0x80) == 0 || self->_freqBandInd != *((_DWORD *)v4 + 13))
      goto LABEL_138;
  }
  else if ((v9 & 0x80) != 0)
  {
    goto LABEL_138;
  }
  if ((*(_DWORD *)&has & 0x1000000) != 0)
  {
    if ((v9 & 0x1000000) == 0 || self->_trackingAreaCode != *((_DWORD *)v4 + 30))
      goto LABEL_138;
  }
  else if ((v9 & 0x1000000) != 0)
  {
    goto LABEL_138;
  }
  if ((*(_DWORD *)&has & 0x40000) != 0)
  {
    if ((v9 & 0x40000) == 0 || self->_selPlmnMcc != *((_DWORD *)v4 + 24))
      goto LABEL_138;
  }
  else if ((v9 & 0x40000) != 0)
  {
    goto LABEL_138;
  }
  if ((*(_DWORD *)&has & 0x80000) != 0)
  {
    if ((v9 & 0x80000) == 0 || self->_selPlmnMnc != *((_DWORD *)v4 + 25))
      goto LABEL_138;
  }
  else if ((v9 & 0x80000) != 0)
  {
    goto LABEL_138;
  }
  if ((*(_WORD *)&has & 0x2000) != 0)
  {
    if ((v9 & 0x2000) == 0 || self->_numMncDigits != *((_DWORD *)v4 + 19))
      goto LABEL_138;
  }
  else if ((v9 & 0x2000) != 0)
  {
    goto LABEL_138;
  }
  if ((*(_BYTE *)&has & 0x10) != 0)
  {
    if ((v9 & 0x10) == 0 || self->_deployment != *((_DWORD *)v4 + 10))
      goto LABEL_138;
  }
  else if ((v9 & 0x10) != 0)
  {
    goto LABEL_138;
  }
  if ((*(_WORD *)&has & 0x100) != 0)
  {
    if ((v9 & 0x100) == 0 || self->_freqRange != *((_DWORD *)v4 + 14))
      goto LABEL_138;
  }
  else if ((v9 & 0x100) != 0)
  {
    goto LABEL_138;
  }
  if ((*(_WORD *)&has & 0x800) != 0)
  {
    if ((v9 & 0x800) == 0 || self->_lteGci != *((_DWORD *)v4 + 17))
      goto LABEL_138;
  }
  else if ((v9 & 0x800) != 0)
  {
    goto LABEL_138;
  }
  if ((*(_WORD *)&has & 0x400) != 0)
  {
    if ((v9 & 0x400) == 0 || self->_lteBw != *((_DWORD *)v4 + 16))
      goto LABEL_138;
  }
  else if ((v9 & 0x400) != 0)
  {
    goto LABEL_138;
  }
  if ((*(_BYTE *)&has & 2) != 0)
  {
    if ((v9 & 2) == 0 || self->_bwp != *((_DWORD *)v4 + 4))
      goto LABEL_138;
  }
  else if ((v9 & 2) != 0)
  {
    goto LABEL_138;
  }
  if ((*(_DWORD *)&has & 0x100000) != 0)
  {
    if ((v9 & 0x100000) == 0 || self->_ssbCount != *((_DWORD *)v4 + 26))
      goto LABEL_138;
  }
  else if ((v9 & 0x100000) != 0)
  {
    goto LABEL_138;
  }
  if ((*(_DWORD *)&has & 0x200000) != 0)
  {
    if ((v9 & 0x200000) == 0 || self->_subCarrierSpacing != *((_DWORD *)v4 + 27))
      goto LABEL_138;
  }
  else if ((v9 & 0x200000) != 0)
  {
    goto LABEL_138;
  }
  if ((*(_DWORD *)&has & 0x800000) != 0)
  {
    if ((v9 & 0x800000) == 0 || self->_tddUlDlConfigurationCommon != *((_DWORD *)v4 + 29))
      goto LABEL_138;
  }
  else if ((v9 & 0x800000) != 0)
  {
    goto LABEL_138;
  }
  if ((*(_DWORD *)&has & 0x2000000) != 0)
  {
    if ((v9 & 0x2000000) != 0)
    {
      if (self->_splitBearerEver)
      {
        if (!*((_BYTE *)v4 + 124))
          goto LABEL_138;
        goto LABEL_128;
      }
      if (!*((_BYTE *)v4 + 124))
        goto LABEL_128;
    }
LABEL_138:
    v10 = 0;
    goto LABEL_139;
  }
  if ((v9 & 0x2000000) != 0)
    goto LABEL_138;
LABEL_128:
  if ((*(_WORD *)&has & 0x4000) != 0)
  {
    if ((v9 & 0x4000) == 0 || self->_numSubs != *((_DWORD *)v4 + 20))
      goto LABEL_138;
  }
  else if ((v9 & 0x4000) != 0)
  {
    goto LABEL_138;
  }
  if ((*(_DWORD *)&has & 0x10000) != 0)
  {
    if ((v9 & 0x10000) == 0 || self->_psPref != *((_DWORD *)v4 + 22))
      goto LABEL_138;
    v10 = 1;
  }
  else
  {
    v10 = (v9 & 0x10000) == 0;
  }
LABEL_139:

  return v10;
}

- (unint64_t)hash
{
  $816A9F7056A322B43461E2DBEB40330F has;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  unint64_t v11;
  $816A9F7056A322B43461E2DBEB40330F v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
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
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  unint64_t v32;

  has = self->_has;
  if ((*(_BYTE *)&has & 1) != 0)
  {
    v32 = 2654435761u * self->_timestamp;
    if ((*(_DWORD *)&has & 0x400000) != 0)
    {
LABEL_3:
      v4 = 2654435761 * self->_subsId;
      if ((*(_WORD *)&has & 0x8000) != 0)
        goto LABEL_4;
      goto LABEL_12;
    }
  }
  else
  {
    v32 = 0;
    if ((*(_DWORD *)&has & 0x400000) != 0)
      goto LABEL_3;
  }
  v4 = 0;
  if ((*(_WORD *)&has & 0x8000) != 0)
  {
LABEL_4:
    v5 = 2654435761 * self->_phyCellId;
    if ((*(_BYTE *)&has & 0x40) != 0)
      goto LABEL_5;
    goto LABEL_13;
  }
LABEL_12:
  v5 = 0;
  if ((*(_BYTE *)&has & 0x40) != 0)
  {
LABEL_5:
    v6 = 2654435761 * self->_freq;
    if ((*(_DWORD *)&has & 0x20000) != 0)
      goto LABEL_6;
    goto LABEL_14;
  }
LABEL_13:
  v6 = 0;
  if ((*(_DWORD *)&has & 0x20000) != 0)
  {
LABEL_6:
    v7 = 2654435761 * self->_rbId;
    if ((*(_BYTE *)&has & 8) != 0)
      goto LABEL_7;
    goto LABEL_15;
  }
LABEL_14:
  v7 = 0;
  if ((*(_BYTE *)&has & 8) != 0)
  {
LABEL_7:
    v8 = 2654435761 * self->_channel;
    if ((*(_WORD *)&has & 0x1000) != 0)
      goto LABEL_8;
LABEL_16:
    v9 = 0;
    if ((*(_WORD *)&has & 0x200) != 0)
      goto LABEL_9;
    goto LABEL_17;
  }
LABEL_15:
  v8 = 0;
  if ((*(_WORD *)&has & 0x1000) == 0)
    goto LABEL_16;
LABEL_8:
  v9 = 2654435761 * self->_msgType;
  if ((*(_WORD *)&has & 0x200) != 0)
  {
LABEL_9:
    v10 = 2654435761 * self->_length;
    goto LABEL_18;
  }
LABEL_17:
  v10 = 0;
LABEL_18:
  v11 = (unint64_t)-[NSData hash](self->_content, "hash");
  v12 = self->_has;
  if ((*(_BYTE *)&v12 & 0x20) != 0)
  {
    v13 = 2654435761 * self->_dlBw;
    if ((*(_BYTE *)&v12 & 4) != 0)
    {
LABEL_20:
      v14 = 2654435761 * self->_cellId;
      if ((*(_BYTE *)&v12 & 0x80) != 0)
        goto LABEL_21;
      goto LABEL_39;
    }
  }
  else
  {
    v13 = 0;
    if ((*(_BYTE *)&v12 & 4) != 0)
      goto LABEL_20;
  }
  v14 = 0;
  if ((*(_BYTE *)&v12 & 0x80) != 0)
  {
LABEL_21:
    v15 = 2654435761 * self->_freqBandInd;
    if ((*(_DWORD *)&v12 & 0x1000000) != 0)
      goto LABEL_22;
    goto LABEL_40;
  }
LABEL_39:
  v15 = 0;
  if ((*(_DWORD *)&v12 & 0x1000000) != 0)
  {
LABEL_22:
    v16 = 2654435761 * self->_trackingAreaCode;
    if ((*(_DWORD *)&v12 & 0x40000) != 0)
      goto LABEL_23;
    goto LABEL_41;
  }
LABEL_40:
  v16 = 0;
  if ((*(_DWORD *)&v12 & 0x40000) != 0)
  {
LABEL_23:
    v17 = 2654435761 * self->_selPlmnMcc;
    if ((*(_DWORD *)&v12 & 0x80000) != 0)
      goto LABEL_24;
    goto LABEL_42;
  }
LABEL_41:
  v17 = 0;
  if ((*(_DWORD *)&v12 & 0x80000) != 0)
  {
LABEL_24:
    v18 = 2654435761 * self->_selPlmnMnc;
    if ((*(_WORD *)&v12 & 0x2000) != 0)
      goto LABEL_25;
    goto LABEL_43;
  }
LABEL_42:
  v18 = 0;
  if ((*(_WORD *)&v12 & 0x2000) != 0)
  {
LABEL_25:
    v19 = 2654435761 * self->_numMncDigits;
    if ((*(_BYTE *)&v12 & 0x10) != 0)
      goto LABEL_26;
    goto LABEL_44;
  }
LABEL_43:
  v19 = 0;
  if ((*(_BYTE *)&v12 & 0x10) != 0)
  {
LABEL_26:
    v20 = 2654435761 * self->_deployment;
    if ((*(_WORD *)&v12 & 0x100) != 0)
      goto LABEL_27;
    goto LABEL_45;
  }
LABEL_44:
  v20 = 0;
  if ((*(_WORD *)&v12 & 0x100) != 0)
  {
LABEL_27:
    v21 = 2654435761 * self->_freqRange;
    if ((*(_WORD *)&v12 & 0x800) != 0)
      goto LABEL_28;
    goto LABEL_46;
  }
LABEL_45:
  v21 = 0;
  if ((*(_WORD *)&v12 & 0x800) != 0)
  {
LABEL_28:
    v22 = 2654435761 * self->_lteGci;
    if ((*(_WORD *)&v12 & 0x400) != 0)
      goto LABEL_29;
    goto LABEL_47;
  }
LABEL_46:
  v22 = 0;
  if ((*(_WORD *)&v12 & 0x400) != 0)
  {
LABEL_29:
    v23 = 2654435761 * self->_lteBw;
    if ((*(_BYTE *)&v12 & 2) != 0)
      goto LABEL_30;
    goto LABEL_48;
  }
LABEL_47:
  v23 = 0;
  if ((*(_BYTE *)&v12 & 2) != 0)
  {
LABEL_30:
    v24 = 2654435761 * self->_bwp;
    if ((*(_DWORD *)&v12 & 0x100000) != 0)
      goto LABEL_31;
    goto LABEL_49;
  }
LABEL_48:
  v24 = 0;
  if ((*(_DWORD *)&v12 & 0x100000) != 0)
  {
LABEL_31:
    v25 = 2654435761 * self->_ssbCount;
    if ((*(_DWORD *)&v12 & 0x200000) != 0)
      goto LABEL_32;
    goto LABEL_50;
  }
LABEL_49:
  v25 = 0;
  if ((*(_DWORD *)&v12 & 0x200000) != 0)
  {
LABEL_32:
    v26 = 2654435761 * self->_subCarrierSpacing;
    if ((*(_DWORD *)&v12 & 0x800000) != 0)
      goto LABEL_33;
    goto LABEL_51;
  }
LABEL_50:
  v26 = 0;
  if ((*(_DWORD *)&v12 & 0x800000) != 0)
  {
LABEL_33:
    v27 = 2654435761 * self->_tddUlDlConfigurationCommon;
    if ((*(_DWORD *)&v12 & 0x2000000) != 0)
      goto LABEL_34;
    goto LABEL_52;
  }
LABEL_51:
  v27 = 0;
  if ((*(_DWORD *)&v12 & 0x2000000) != 0)
  {
LABEL_34:
    v28 = 2654435761 * self->_splitBearerEver;
    if ((*(_WORD *)&v12 & 0x4000) != 0)
      goto LABEL_35;
LABEL_53:
    v29 = 0;
    if ((*(_DWORD *)&v12 & 0x10000) != 0)
      goto LABEL_36;
LABEL_54:
    v30 = 0;
    return v4 ^ v32 ^ v5 ^ v6 ^ v7 ^ v8 ^ v9 ^ v10 ^ v13 ^ v14 ^ v15 ^ v16 ^ v17 ^ v18 ^ v19 ^ v11 ^ v20 ^ v21 ^ v22 ^ v23 ^ v24 ^ v25 ^ v26 ^ v27 ^ v28 ^ v29 ^ v30;
  }
LABEL_52:
  v28 = 0;
  if ((*(_WORD *)&v12 & 0x4000) == 0)
    goto LABEL_53;
LABEL_35:
  v29 = 2654435761 * self->_numSubs;
  if ((*(_DWORD *)&v12 & 0x10000) == 0)
    goto LABEL_54;
LABEL_36:
  v30 = 2654435761 * self->_psPref;
  return v4 ^ v32 ^ v5 ^ v6 ^ v7 ^ v8 ^ v9 ^ v10 ^ v13 ^ v14 ^ v15 ^ v16 ^ v17 ^ v18 ^ v19 ^ v11 ^ v20 ^ v21 ^ v22 ^ v23 ^ v24 ^ v25 ^ v26 ^ v27 ^ v28 ^ v29 ^ v30;
}

- (void)mergeFrom:(id)a3
{
  id v4;
  int v5;
  int v6;
  id v7;

  v4 = a3;
  v5 = *((_DWORD *)v4 + 32);
  if ((v5 & 1) != 0)
  {
    self->_timestamp = *((_QWORD *)v4 + 1);
    *(_DWORD *)&self->_has |= 1u;
    v5 = *((_DWORD *)v4 + 32);
    if ((v5 & 0x400000) == 0)
    {
LABEL_3:
      if ((v5 & 0x8000) == 0)
        goto LABEL_4;
      goto LABEL_34;
    }
  }
  else if ((v5 & 0x400000) == 0)
  {
    goto LABEL_3;
  }
  self->_subsId = *((_DWORD *)v4 + 28);
  *(_DWORD *)&self->_has |= 0x400000u;
  v5 = *((_DWORD *)v4 + 32);
  if ((v5 & 0x8000) == 0)
  {
LABEL_4:
    if ((v5 & 0x40) == 0)
      goto LABEL_5;
    goto LABEL_35;
  }
LABEL_34:
  self->_phyCellId = *((_DWORD *)v4 + 21);
  *(_DWORD *)&self->_has |= 0x8000u;
  v5 = *((_DWORD *)v4 + 32);
  if ((v5 & 0x40) == 0)
  {
LABEL_5:
    if ((v5 & 0x20000) == 0)
      goto LABEL_6;
    goto LABEL_36;
  }
LABEL_35:
  self->_freq = *((_DWORD *)v4 + 12);
  *(_DWORD *)&self->_has |= 0x40u;
  v5 = *((_DWORD *)v4 + 32);
  if ((v5 & 0x20000) == 0)
  {
LABEL_6:
    if ((v5 & 8) == 0)
      goto LABEL_7;
    goto LABEL_37;
  }
LABEL_36:
  self->_rbId = *((_DWORD *)v4 + 23);
  *(_DWORD *)&self->_has |= 0x20000u;
  v5 = *((_DWORD *)v4 + 32);
  if ((v5 & 8) == 0)
  {
LABEL_7:
    if ((v5 & 0x1000) == 0)
      goto LABEL_8;
    goto LABEL_38;
  }
LABEL_37:
  self->_channel = *((_DWORD *)v4 + 6);
  *(_DWORD *)&self->_has |= 8u;
  v5 = *((_DWORD *)v4 + 32);
  if ((v5 & 0x1000) == 0)
  {
LABEL_8:
    if ((v5 & 0x200) == 0)
      goto LABEL_10;
    goto LABEL_9;
  }
LABEL_38:
  self->_msgType = *((_DWORD *)v4 + 18);
  *(_DWORD *)&self->_has |= 0x1000u;
  if ((*((_DWORD *)v4 + 32) & 0x200) != 0)
  {
LABEL_9:
    self->_length = *((_DWORD *)v4 + 15);
    *(_DWORD *)&self->_has |= 0x200u;
  }
LABEL_10:
  if (*((_QWORD *)v4 + 4))
  {
    v7 = v4;
    -[CellularNrOtaMsg setContent:](self, "setContent:");
    v4 = v7;
  }
  v6 = *((_DWORD *)v4 + 32);
  if ((v6 & 0x20) != 0)
  {
    self->_dlBw = *((_DWORD *)v4 + 11);
    *(_DWORD *)&self->_has |= 0x20u;
    v6 = *((_DWORD *)v4 + 32);
    if ((v6 & 4) == 0)
    {
LABEL_14:
      if ((v6 & 0x80) == 0)
        goto LABEL_15;
      goto LABEL_42;
    }
  }
  else if ((v6 & 4) == 0)
  {
    goto LABEL_14;
  }
  self->_cellId = *((_DWORD *)v4 + 5);
  *(_DWORD *)&self->_has |= 4u;
  v6 = *((_DWORD *)v4 + 32);
  if ((v6 & 0x80) == 0)
  {
LABEL_15:
    if ((v6 & 0x1000000) == 0)
      goto LABEL_16;
    goto LABEL_43;
  }
LABEL_42:
  self->_freqBandInd = *((_DWORD *)v4 + 13);
  *(_DWORD *)&self->_has |= 0x80u;
  v6 = *((_DWORD *)v4 + 32);
  if ((v6 & 0x1000000) == 0)
  {
LABEL_16:
    if ((v6 & 0x40000) == 0)
      goto LABEL_17;
    goto LABEL_44;
  }
LABEL_43:
  self->_trackingAreaCode = *((_DWORD *)v4 + 30);
  *(_DWORD *)&self->_has |= 0x1000000u;
  v6 = *((_DWORD *)v4 + 32);
  if ((v6 & 0x40000) == 0)
  {
LABEL_17:
    if ((v6 & 0x80000) == 0)
      goto LABEL_18;
    goto LABEL_45;
  }
LABEL_44:
  self->_selPlmnMcc = *((_DWORD *)v4 + 24);
  *(_DWORD *)&self->_has |= 0x40000u;
  v6 = *((_DWORD *)v4 + 32);
  if ((v6 & 0x80000) == 0)
  {
LABEL_18:
    if ((v6 & 0x2000) == 0)
      goto LABEL_19;
    goto LABEL_46;
  }
LABEL_45:
  self->_selPlmnMnc = *((_DWORD *)v4 + 25);
  *(_DWORD *)&self->_has |= 0x80000u;
  v6 = *((_DWORD *)v4 + 32);
  if ((v6 & 0x2000) == 0)
  {
LABEL_19:
    if ((v6 & 0x10) == 0)
      goto LABEL_20;
    goto LABEL_47;
  }
LABEL_46:
  self->_numMncDigits = *((_DWORD *)v4 + 19);
  *(_DWORD *)&self->_has |= 0x2000u;
  v6 = *((_DWORD *)v4 + 32);
  if ((v6 & 0x10) == 0)
  {
LABEL_20:
    if ((v6 & 0x100) == 0)
      goto LABEL_21;
    goto LABEL_48;
  }
LABEL_47:
  self->_deployment = *((_DWORD *)v4 + 10);
  *(_DWORD *)&self->_has |= 0x10u;
  v6 = *((_DWORD *)v4 + 32);
  if ((v6 & 0x100) == 0)
  {
LABEL_21:
    if ((v6 & 0x800) == 0)
      goto LABEL_22;
    goto LABEL_49;
  }
LABEL_48:
  self->_freqRange = *((_DWORD *)v4 + 14);
  *(_DWORD *)&self->_has |= 0x100u;
  v6 = *((_DWORD *)v4 + 32);
  if ((v6 & 0x800) == 0)
  {
LABEL_22:
    if ((v6 & 0x400) == 0)
      goto LABEL_23;
    goto LABEL_50;
  }
LABEL_49:
  self->_lteGci = *((_DWORD *)v4 + 17);
  *(_DWORD *)&self->_has |= 0x800u;
  v6 = *((_DWORD *)v4 + 32);
  if ((v6 & 0x400) == 0)
  {
LABEL_23:
    if ((v6 & 2) == 0)
      goto LABEL_24;
    goto LABEL_51;
  }
LABEL_50:
  self->_lteBw = *((_DWORD *)v4 + 16);
  *(_DWORD *)&self->_has |= 0x400u;
  v6 = *((_DWORD *)v4 + 32);
  if ((v6 & 2) == 0)
  {
LABEL_24:
    if ((v6 & 0x100000) == 0)
      goto LABEL_25;
    goto LABEL_52;
  }
LABEL_51:
  self->_bwp = *((_DWORD *)v4 + 4);
  *(_DWORD *)&self->_has |= 2u;
  v6 = *((_DWORD *)v4 + 32);
  if ((v6 & 0x100000) == 0)
  {
LABEL_25:
    if ((v6 & 0x200000) == 0)
      goto LABEL_26;
    goto LABEL_53;
  }
LABEL_52:
  self->_ssbCount = *((_DWORD *)v4 + 26);
  *(_DWORD *)&self->_has |= 0x100000u;
  v6 = *((_DWORD *)v4 + 32);
  if ((v6 & 0x200000) == 0)
  {
LABEL_26:
    if ((v6 & 0x800000) == 0)
      goto LABEL_27;
    goto LABEL_54;
  }
LABEL_53:
  self->_subCarrierSpacing = *((_DWORD *)v4 + 27);
  *(_DWORD *)&self->_has |= 0x200000u;
  v6 = *((_DWORD *)v4 + 32);
  if ((v6 & 0x800000) == 0)
  {
LABEL_27:
    if ((v6 & 0x2000000) == 0)
      goto LABEL_28;
    goto LABEL_55;
  }
LABEL_54:
  self->_tddUlDlConfigurationCommon = *((_DWORD *)v4 + 29);
  *(_DWORD *)&self->_has |= 0x800000u;
  v6 = *((_DWORD *)v4 + 32);
  if ((v6 & 0x2000000) == 0)
  {
LABEL_28:
    if ((v6 & 0x4000) == 0)
      goto LABEL_29;
LABEL_56:
    self->_numSubs = *((_DWORD *)v4 + 20);
    *(_DWORD *)&self->_has |= 0x4000u;
    if ((*((_DWORD *)v4 + 32) & 0x10000) == 0)
      goto LABEL_31;
    goto LABEL_30;
  }
LABEL_55:
  self->_splitBearerEver = *((_BYTE *)v4 + 124);
  *(_DWORD *)&self->_has |= 0x2000000u;
  v6 = *((_DWORD *)v4 + 32);
  if ((v6 & 0x4000) != 0)
    goto LABEL_56;
LABEL_29:
  if ((v6 & 0x10000) != 0)
  {
LABEL_30:
    self->_psPref = *((_DWORD *)v4 + 22);
    *(_DWORD *)&self->_has |= 0x10000u;
  }
LABEL_31:

}

- (unint64_t)timestamp
{
  return self->_timestamp;
}

- (unsigned)phyCellId
{
  return self->_phyCellId;
}

- (unsigned)freq
{
  return self->_freq;
}

- (unsigned)rbId
{
  return self->_rbId;
}

- (int)channel
{
  return self->_channel;
}

- (unsigned)msgType
{
  return self->_msgType;
}

- (unsigned)length
{
  return self->_length;
}

- (NSData)content
{
  return self->_content;
}

- (void)setContent:(id)a3
{
  objc_storeStrong((id *)&self->_content, a3);
}

- (unsigned)dlBw
{
  return self->_dlBw;
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

- (unsigned)selPlmnMcc
{
  return self->_selPlmnMcc;
}

- (unsigned)selPlmnMnc
{
  return self->_selPlmnMnc;
}

- (unsigned)numMncDigits
{
  return self->_numMncDigits;
}

- (unsigned)deployment
{
  return self->_deployment;
}

- (unsigned)freqRange
{
  return self->_freqRange;
}

- (unsigned)lteGci
{
  return self->_lteGci;
}

- (unsigned)lteBw
{
  return self->_lteBw;
}

- (unsigned)bwp
{
  return self->_bwp;
}

- (unsigned)ssbCount
{
  return self->_ssbCount;
}

- (unsigned)subCarrierSpacing
{
  return self->_subCarrierSpacing;
}

- (unsigned)tddUlDlConfigurationCommon
{
  return self->_tddUlDlConfigurationCommon;
}

- (BOOL)splitBearerEver
{
  return self->_splitBearerEver;
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

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_content, 0);
}

@end
