@implementation CellularNrScellInfo

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

- (void)setPhyCellId:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 0x80u;
  self->_phyCellId = a3;
}

- (void)setHasPhyCellId:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 128;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFF7F | v3;
}

- (BOOL)hasPhyCellId
{
  return (*(_WORD *)&self->_has >> 7) & 1;
}

- (void)setDlFreq:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 0x10u;
  self->_dlFreq = a3;
}

- (void)setHasDlFreq:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 16;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFEF | v3;
}

- (BOOL)hasDlFreq
{
  return (*(_WORD *)&self->_has >> 4) & 1;
}

- (void)setUlFreq:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 0x4000u;
  self->_ulFreq = a3;
}

- (void)setHasUlFreq:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 0x4000;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xBFFF | v3;
}

- (BOOL)hasUlFreq
{
  return (*(_WORD *)&self->_has >> 14) & 1;
}

- (void)setDlBw:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 8u;
  self->_dlBw = a3;
}

- (void)setHasDlBw:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 8;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFF7 | v3;
}

- (BOOL)hasDlBw
{
  return (*(_WORD *)&self->_has >> 3) & 1;
}

- (void)setUlBw:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 0x2000u;
  self->_ulBw = a3;
}

- (void)setHasUlBw:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 0x2000;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xDFFF | v3;
}

- (BOOL)hasUlBw
{
  return (*(_WORD *)&self->_has >> 13) & 1;
}

- (void)setCellId:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 4u;
  self->_cellId = a3;
}

- (void)setHasCellId:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 4;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFFB | v3;
}

- (BOOL)hasCellId
{
  return (*(_WORD *)&self->_has >> 2) & 1;
}

- (void)setNumMncDigits:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 0x20u;
  self->_numMncDigits = a3;
}

- (void)setHasNumMncDigits:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 32;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFDF | v3;
}

- (BOOL)hasNumMncDigits
{
  return (*(_WORD *)&self->_has >> 5) & 1;
}

- (void)setSelPlmnMcc:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 0x200u;
  self->_selPlmnMcc = a3;
}

- (void)setHasSelPlmnMcc:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 512;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFDFF | v3;
}

- (BOOL)hasSelPlmnMcc
{
  return (*(_WORD *)&self->_has >> 9) & 1;
}

- (void)setSelPlmnMnc:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 0x400u;
  self->_selPlmnMnc = a3;
}

- (void)setHasSelPlmnMnc:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 1024;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFBFF | v3;
}

- (BOOL)hasSelPlmnMnc
{
  return (*(_WORD *)&self->_has >> 10) & 1;
}

- (void)setAllowedAccess:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 2u;
  self->_allowedAccess = a3;
}

- (void)setHasAllowedAccess:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFFD | v3;
}

- (BOOL)hasAllowedAccess
{
  return (*(_WORD *)&self->_has >> 1) & 1;
}

- (void)setNumSubs:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 0x40u;
  self->_numSubs = a3;
}

- (void)setHasNumSubs:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 64;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFBF | v3;
}

- (BOOL)hasNumSubs
{
  return (*(_WORD *)&self->_has >> 6) & 1;
}

- (BOOL)hasSimHplmn
{
  return self->_simHplmn != 0;
}

- (void)setSubsId:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 0x800u;
  self->_subsId = a3;
}

- (void)setHasSubsId:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 2048;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xF7FF | v3;
}

- (BOOL)hasSubsId
{
  return (*(_WORD *)&self->_has >> 11) & 1;
}

- (void)setTrackingAreaCode:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 0x1000u;
  self->_trackingAreaCode = a3;
}

- (void)setHasTrackingAreaCode:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 4096;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xEFFF | v3;
}

- (BOOL)hasTrackingAreaCode
{
  return (*(_WORD *)&self->_has >> 12) & 1;
}

- (void)setPsPref:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 0x100u;
  self->_psPref = a3;
}

- (void)setHasPsPref:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 256;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFEFF | v3;
}

- (BOOL)hasPsPref
{
  return HIBYTE(*(_WORD *)&self->_has) & 1;
}

- (id)description
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)CellularNrScellInfo;
  v3 = -[CellularNrScellInfo description](&v8, "description");
  v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[CellularNrScellInfo dictionaryRepresentation](self, "dictionaryRepresentation"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@ %@"), v4, v5));

  return v6;
}

- (id)dictionaryRepresentation
{
  void *v3;
  __int16 has;
  void *v5;
  NSData *simHplmn;
  __int16 v7;
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

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary"));
  has = (__int16)self->_has;
  if ((has & 1) != 0)
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedLongLong:](NSNumber, "numberWithUnsignedLongLong:", self->_timestamp));
    objc_msgSend(v3, "setObject:forKey:", v10, CFSTR("timestamp"));

    has = (__int16)self->_has;
    if ((has & 0x80) == 0)
    {
LABEL_3:
      if ((has & 0x10) == 0)
        goto LABEL_4;
      goto LABEL_23;
    }
  }
  else if ((has & 0x80) == 0)
  {
    goto LABEL_3;
  }
  v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", self->_phyCellId));
  objc_msgSend(v3, "setObject:forKey:", v11, CFSTR("phy_cell_id"));

  has = (__int16)self->_has;
  if ((has & 0x10) == 0)
  {
LABEL_4:
    if ((has & 0x4000) == 0)
      goto LABEL_5;
    goto LABEL_24;
  }
LABEL_23:
  v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", self->_dlFreq));
  objc_msgSend(v3, "setObject:forKey:", v12, CFSTR("dl_freq"));

  has = (__int16)self->_has;
  if ((has & 0x4000) == 0)
  {
LABEL_5:
    if ((has & 8) == 0)
      goto LABEL_6;
    goto LABEL_25;
  }
LABEL_24:
  v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", self->_ulFreq));
  objc_msgSend(v3, "setObject:forKey:", v13, CFSTR("ul_freq"));

  has = (__int16)self->_has;
  if ((has & 8) == 0)
  {
LABEL_6:
    if ((has & 0x2000) == 0)
      goto LABEL_7;
    goto LABEL_26;
  }
LABEL_25:
  v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", self->_dlBw));
  objc_msgSend(v3, "setObject:forKey:", v14, CFSTR("dl_bw"));

  has = (__int16)self->_has;
  if ((has & 0x2000) == 0)
  {
LABEL_7:
    if ((has & 4) == 0)
      goto LABEL_8;
    goto LABEL_27;
  }
LABEL_26:
  v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", self->_ulBw));
  objc_msgSend(v3, "setObject:forKey:", v15, CFSTR("ul_bw"));

  has = (__int16)self->_has;
  if ((has & 4) == 0)
  {
LABEL_8:
    if ((has & 0x20) == 0)
      goto LABEL_9;
    goto LABEL_28;
  }
LABEL_27:
  v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", self->_cellId));
  objc_msgSend(v3, "setObject:forKey:", v16, CFSTR("cell_id"));

  has = (__int16)self->_has;
  if ((has & 0x20) == 0)
  {
LABEL_9:
    if ((has & 0x200) == 0)
      goto LABEL_10;
    goto LABEL_29;
  }
LABEL_28:
  v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", self->_numMncDigits));
  objc_msgSend(v3, "setObject:forKey:", v17, CFSTR("num_mnc_digits"));

  has = (__int16)self->_has;
  if ((has & 0x200) == 0)
  {
LABEL_10:
    if ((has & 0x400) == 0)
      goto LABEL_11;
    goto LABEL_30;
  }
LABEL_29:
  v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", self->_selPlmnMcc));
  objc_msgSend(v3, "setObject:forKey:", v18, CFSTR("sel_plmn_mcc"));

  has = (__int16)self->_has;
  if ((has & 0x400) == 0)
  {
LABEL_11:
    if ((has & 2) == 0)
      goto LABEL_12;
    goto LABEL_31;
  }
LABEL_30:
  v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", self->_selPlmnMnc));
  objc_msgSend(v3, "setObject:forKey:", v19, CFSTR("sel_plmn_mnc"));

  has = (__int16)self->_has;
  if ((has & 2) == 0)
  {
LABEL_12:
    if ((has & 0x40) == 0)
      goto LABEL_14;
    goto LABEL_13;
  }
LABEL_31:
  v20 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", self->_allowedAccess));
  objc_msgSend(v3, "setObject:forKey:", v20, CFSTR("allowed_access"));

  if ((*(_WORD *)&self->_has & 0x40) != 0)
  {
LABEL_13:
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", self->_numSubs));
    objc_msgSend(v3, "setObject:forKey:", v5, CFSTR("num_subs"));

  }
LABEL_14:
  simHplmn = self->_simHplmn;
  if (simHplmn)
    objc_msgSend(v3, "setObject:forKey:", simHplmn, CFSTR("sim_hplmn"));
  v7 = (__int16)self->_has;
  if ((v7 & 0x800) == 0)
  {
    if ((*(_WORD *)&self->_has & 0x1000) == 0)
      goto LABEL_18;
LABEL_34:
    v22 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", self->_trackingAreaCode));
    objc_msgSend(v3, "setObject:forKey:", v22, CFSTR("tracking_area_code"));

    if ((*(_WORD *)&self->_has & 0x100) == 0)
      return v3;
    goto LABEL_19;
  }
  v21 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", self->_subsId));
  objc_msgSend(v3, "setObject:forKey:", v21, CFSTR("subs_id"));

  v7 = (__int16)self->_has;
  if ((v7 & 0x1000) != 0)
    goto LABEL_34;
LABEL_18:
  if ((v7 & 0x100) != 0)
  {
LABEL_19:
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", self->_psPref));
    objc_msgSend(v3, "setObject:forKey:", v8, CFSTR("ps_pref"));

  }
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return sub_1000D499C((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  __int16 has;
  NSData *simHplmn;
  __int16 v6;
  id v7;

  v7 = a3;
  has = (__int16)self->_has;
  if ((has & 1) != 0)
  {
    PBDataWriterWriteUint64Field(v7, self->_timestamp, 1);
    has = (__int16)self->_has;
    if ((has & 0x80) == 0)
    {
LABEL_3:
      if ((has & 0x10) == 0)
        goto LABEL_4;
      goto LABEL_23;
    }
  }
  else if ((has & 0x80) == 0)
  {
    goto LABEL_3;
  }
  PBDataWriterWriteUint32Field(v7, self->_phyCellId, 3);
  has = (__int16)self->_has;
  if ((has & 0x10) == 0)
  {
LABEL_4:
    if ((has & 0x4000) == 0)
      goto LABEL_5;
    goto LABEL_24;
  }
LABEL_23:
  PBDataWriterWriteUint32Field(v7, self->_dlFreq, 4);
  has = (__int16)self->_has;
  if ((has & 0x4000) == 0)
  {
LABEL_5:
    if ((has & 8) == 0)
      goto LABEL_6;
    goto LABEL_25;
  }
LABEL_24:
  PBDataWriterWriteUint32Field(v7, self->_ulFreq, 5);
  has = (__int16)self->_has;
  if ((has & 8) == 0)
  {
LABEL_6:
    if ((has & 0x2000) == 0)
      goto LABEL_7;
    goto LABEL_26;
  }
LABEL_25:
  PBDataWriterWriteUint32Field(v7, self->_dlBw, 6);
  has = (__int16)self->_has;
  if ((has & 0x2000) == 0)
  {
LABEL_7:
    if ((has & 4) == 0)
      goto LABEL_8;
    goto LABEL_27;
  }
LABEL_26:
  PBDataWriterWriteUint32Field(v7, self->_ulBw, 7);
  has = (__int16)self->_has;
  if ((has & 4) == 0)
  {
LABEL_8:
    if ((has & 0x20) == 0)
      goto LABEL_9;
    goto LABEL_28;
  }
LABEL_27:
  PBDataWriterWriteUint32Field(v7, self->_cellId, 8);
  has = (__int16)self->_has;
  if ((has & 0x20) == 0)
  {
LABEL_9:
    if ((has & 0x200) == 0)
      goto LABEL_10;
    goto LABEL_29;
  }
LABEL_28:
  PBDataWriterWriteUint32Field(v7, self->_numMncDigits, 9);
  has = (__int16)self->_has;
  if ((has & 0x200) == 0)
  {
LABEL_10:
    if ((has & 0x400) == 0)
      goto LABEL_11;
    goto LABEL_30;
  }
LABEL_29:
  PBDataWriterWriteUint32Field(v7, self->_selPlmnMcc, 10);
  has = (__int16)self->_has;
  if ((has & 0x400) == 0)
  {
LABEL_11:
    if ((has & 2) == 0)
      goto LABEL_12;
    goto LABEL_31;
  }
LABEL_30:
  PBDataWriterWriteUint32Field(v7, self->_selPlmnMnc, 11);
  has = (__int16)self->_has;
  if ((has & 2) == 0)
  {
LABEL_12:
    if ((has & 0x40) == 0)
      goto LABEL_14;
    goto LABEL_13;
  }
LABEL_31:
  PBDataWriterWriteUint32Field(v7, self->_allowedAccess, 12);
  if ((*(_WORD *)&self->_has & 0x40) != 0)
LABEL_13:
    PBDataWriterWriteUint32Field(v7, self->_numSubs, 13);
LABEL_14:
  simHplmn = self->_simHplmn;
  if (simHplmn)
    PBDataWriterWriteDataField(v7, simHplmn, 14);
  v6 = (__int16)self->_has;
  if ((v6 & 0x800) == 0)
  {
    if ((*(_WORD *)&self->_has & 0x1000) == 0)
      goto LABEL_18;
LABEL_34:
    PBDataWriterWriteUint32Field(v7, self->_trackingAreaCode, 19);
    if ((*(_WORD *)&self->_has & 0x100) == 0)
      goto LABEL_20;
    goto LABEL_19;
  }
  PBDataWriterWriteUint32Field(v7, self->_subsId, 15);
  v6 = (__int16)self->_has;
  if ((v6 & 0x1000) != 0)
    goto LABEL_34;
LABEL_18:
  if ((v6 & 0x100) != 0)
LABEL_19:
    PBDataWriterWriteUint32Field(v7, self->_psPref, 20);
LABEL_20:

}

- (void)copyTo:(id)a3
{
  _QWORD *v4;
  __int16 has;
  __int16 v6;
  _QWORD *v7;

  v4 = a3;
  has = (__int16)self->_has;
  if ((has & 1) != 0)
  {
    v4[1] = self->_timestamp;
    *((_WORD *)v4 + 40) |= 1u;
    has = (__int16)self->_has;
    if ((has & 0x80) == 0)
    {
LABEL_3:
      if ((has & 0x10) == 0)
        goto LABEL_4;
      goto LABEL_23;
    }
  }
  else if ((has & 0x80) == 0)
  {
    goto LABEL_3;
  }
  *((_DWORD *)v4 + 10) = self->_phyCellId;
  *((_WORD *)v4 + 40) |= 0x80u;
  has = (__int16)self->_has;
  if ((has & 0x10) == 0)
  {
LABEL_4:
    if ((has & 0x4000) == 0)
      goto LABEL_5;
    goto LABEL_24;
  }
LABEL_23:
  *((_DWORD *)v4 + 7) = self->_dlFreq;
  *((_WORD *)v4 + 40) |= 0x10u;
  has = (__int16)self->_has;
  if ((has & 0x4000) == 0)
  {
LABEL_5:
    if ((has & 8) == 0)
      goto LABEL_6;
    goto LABEL_25;
  }
LABEL_24:
  *((_DWORD *)v4 + 19) = self->_ulFreq;
  *((_WORD *)v4 + 40) |= 0x4000u;
  has = (__int16)self->_has;
  if ((has & 8) == 0)
  {
LABEL_6:
    if ((has & 0x2000) == 0)
      goto LABEL_7;
    goto LABEL_26;
  }
LABEL_25:
  *((_DWORD *)v4 + 6) = self->_dlBw;
  *((_WORD *)v4 + 40) |= 8u;
  has = (__int16)self->_has;
  if ((has & 0x2000) == 0)
  {
LABEL_7:
    if ((has & 4) == 0)
      goto LABEL_8;
    goto LABEL_27;
  }
LABEL_26:
  *((_DWORD *)v4 + 18) = self->_ulBw;
  *((_WORD *)v4 + 40) |= 0x2000u;
  has = (__int16)self->_has;
  if ((has & 4) == 0)
  {
LABEL_8:
    if ((has & 0x20) == 0)
      goto LABEL_9;
    goto LABEL_28;
  }
LABEL_27:
  *((_DWORD *)v4 + 5) = self->_cellId;
  *((_WORD *)v4 + 40) |= 4u;
  has = (__int16)self->_has;
  if ((has & 0x20) == 0)
  {
LABEL_9:
    if ((has & 0x200) == 0)
      goto LABEL_10;
    goto LABEL_29;
  }
LABEL_28:
  *((_DWORD *)v4 + 8) = self->_numMncDigits;
  *((_WORD *)v4 + 40) |= 0x20u;
  has = (__int16)self->_has;
  if ((has & 0x200) == 0)
  {
LABEL_10:
    if ((has & 0x400) == 0)
      goto LABEL_11;
    goto LABEL_30;
  }
LABEL_29:
  *((_DWORD *)v4 + 12) = self->_selPlmnMcc;
  *((_WORD *)v4 + 40) |= 0x200u;
  has = (__int16)self->_has;
  if ((has & 0x400) == 0)
  {
LABEL_11:
    if ((has & 2) == 0)
      goto LABEL_12;
    goto LABEL_31;
  }
LABEL_30:
  *((_DWORD *)v4 + 13) = self->_selPlmnMnc;
  *((_WORD *)v4 + 40) |= 0x400u;
  has = (__int16)self->_has;
  if ((has & 2) == 0)
  {
LABEL_12:
    if ((has & 0x40) == 0)
      goto LABEL_14;
    goto LABEL_13;
  }
LABEL_31:
  *((_DWORD *)v4 + 4) = self->_allowedAccess;
  *((_WORD *)v4 + 40) |= 2u;
  if ((*(_WORD *)&self->_has & 0x40) != 0)
  {
LABEL_13:
    *((_DWORD *)v4 + 9) = self->_numSubs;
    *((_WORD *)v4 + 40) |= 0x40u;
  }
LABEL_14:
  if (self->_simHplmn)
  {
    v7 = v4;
    objc_msgSend(v4, "setSimHplmn:");
    v4 = v7;
  }
  v6 = (__int16)self->_has;
  if ((v6 & 0x800) == 0)
  {
    if ((*(_WORD *)&self->_has & 0x1000) == 0)
      goto LABEL_18;
LABEL_34:
    *((_DWORD *)v4 + 17) = self->_trackingAreaCode;
    *((_WORD *)v4 + 40) |= 0x1000u;
    if ((*(_WORD *)&self->_has & 0x100) == 0)
      goto LABEL_20;
    goto LABEL_19;
  }
  *((_DWORD *)v4 + 16) = self->_subsId;
  *((_WORD *)v4 + 40) |= 0x800u;
  v6 = (__int16)self->_has;
  if ((v6 & 0x1000) != 0)
    goto LABEL_34;
LABEL_18:
  if ((v6 & 0x100) != 0)
  {
LABEL_19:
    *((_DWORD *)v4 + 11) = self->_psPref;
    *((_WORD *)v4 + 40) |= 0x100u;
  }
LABEL_20:

}

- (id)copyWithZone:(_NSZone *)a3
{
  _QWORD *v5;
  _QWORD *v6;
  __int16 has;
  id v8;
  void *v9;
  __int16 v10;

  v5 = objc_msgSend(objc_msgSend((id)objc_opt_class(self, a2), "allocWithZone:", a3), "init");
  v6 = v5;
  has = (__int16)self->_has;
  if ((has & 1) != 0)
  {
    v5[1] = self->_timestamp;
    *((_WORD *)v5 + 40) |= 1u;
    has = (__int16)self->_has;
    if ((has & 0x80) == 0)
    {
LABEL_3:
      if ((has & 0x10) == 0)
        goto LABEL_4;
      goto LABEL_21;
    }
  }
  else if ((has & 0x80) == 0)
  {
    goto LABEL_3;
  }
  *((_DWORD *)v5 + 10) = self->_phyCellId;
  *((_WORD *)v5 + 40) |= 0x80u;
  has = (__int16)self->_has;
  if ((has & 0x10) == 0)
  {
LABEL_4:
    if ((has & 0x4000) == 0)
      goto LABEL_5;
    goto LABEL_22;
  }
LABEL_21:
  *((_DWORD *)v5 + 7) = self->_dlFreq;
  *((_WORD *)v5 + 40) |= 0x10u;
  has = (__int16)self->_has;
  if ((has & 0x4000) == 0)
  {
LABEL_5:
    if ((has & 8) == 0)
      goto LABEL_6;
    goto LABEL_23;
  }
LABEL_22:
  *((_DWORD *)v5 + 19) = self->_ulFreq;
  *((_WORD *)v5 + 40) |= 0x4000u;
  has = (__int16)self->_has;
  if ((has & 8) == 0)
  {
LABEL_6:
    if ((has & 0x2000) == 0)
      goto LABEL_7;
    goto LABEL_24;
  }
LABEL_23:
  *((_DWORD *)v5 + 6) = self->_dlBw;
  *((_WORD *)v5 + 40) |= 8u;
  has = (__int16)self->_has;
  if ((has & 0x2000) == 0)
  {
LABEL_7:
    if ((has & 4) == 0)
      goto LABEL_8;
    goto LABEL_25;
  }
LABEL_24:
  *((_DWORD *)v5 + 18) = self->_ulBw;
  *((_WORD *)v5 + 40) |= 0x2000u;
  has = (__int16)self->_has;
  if ((has & 4) == 0)
  {
LABEL_8:
    if ((has & 0x20) == 0)
      goto LABEL_9;
    goto LABEL_26;
  }
LABEL_25:
  *((_DWORD *)v5 + 5) = self->_cellId;
  *((_WORD *)v5 + 40) |= 4u;
  has = (__int16)self->_has;
  if ((has & 0x20) == 0)
  {
LABEL_9:
    if ((has & 0x200) == 0)
      goto LABEL_10;
    goto LABEL_27;
  }
LABEL_26:
  *((_DWORD *)v5 + 8) = self->_numMncDigits;
  *((_WORD *)v5 + 40) |= 0x20u;
  has = (__int16)self->_has;
  if ((has & 0x200) == 0)
  {
LABEL_10:
    if ((has & 0x400) == 0)
      goto LABEL_11;
    goto LABEL_28;
  }
LABEL_27:
  *((_DWORD *)v5 + 12) = self->_selPlmnMcc;
  *((_WORD *)v5 + 40) |= 0x200u;
  has = (__int16)self->_has;
  if ((has & 0x400) == 0)
  {
LABEL_11:
    if ((has & 2) == 0)
      goto LABEL_12;
    goto LABEL_29;
  }
LABEL_28:
  *((_DWORD *)v5 + 13) = self->_selPlmnMnc;
  *((_WORD *)v5 + 40) |= 0x400u;
  has = (__int16)self->_has;
  if ((has & 2) == 0)
  {
LABEL_12:
    if ((has & 0x40) == 0)
      goto LABEL_14;
    goto LABEL_13;
  }
LABEL_29:
  *((_DWORD *)v5 + 4) = self->_allowedAccess;
  *((_WORD *)v5 + 40) |= 2u;
  if ((*(_WORD *)&self->_has & 0x40) != 0)
  {
LABEL_13:
    *((_DWORD *)v5 + 9) = self->_numSubs;
    *((_WORD *)v5 + 40) |= 0x40u;
  }
LABEL_14:
  v8 = -[NSData copyWithZone:](self->_simHplmn, "copyWithZone:", a3);
  v9 = (void *)v6[7];
  v6[7] = v8;

  v10 = (__int16)self->_has;
  if ((v10 & 0x800) == 0)
  {
    if ((*(_WORD *)&self->_has & 0x1000) == 0)
      goto LABEL_16;
LABEL_32:
    *((_DWORD *)v6 + 17) = self->_trackingAreaCode;
    *((_WORD *)v6 + 40) |= 0x1000u;
    if ((*(_WORD *)&self->_has & 0x100) == 0)
      return v6;
    goto LABEL_17;
  }
  *((_DWORD *)v6 + 16) = self->_subsId;
  *((_WORD *)v6 + 40) |= 0x800u;
  v10 = (__int16)self->_has;
  if ((v10 & 0x1000) != 0)
    goto LABEL_32;
LABEL_16:
  if ((v10 & 0x100) != 0)
  {
LABEL_17:
    *((_DWORD *)v6 + 11) = self->_psPref;
    *((_WORD *)v6 + 40) |= 0x100u;
  }
  return v6;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  uint64_t v5;
  __int16 has;
  __int16 v7;
  NSData *simHplmn;
  BOOL v9;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class(self, v5)))
    goto LABEL_80;
  has = (__int16)self->_has;
  v7 = *((_WORD *)v4 + 40);
  if ((has & 1) != 0)
  {
    if ((v7 & 1) == 0 || self->_timestamp != *((_QWORD *)v4 + 1))
      goto LABEL_80;
  }
  else if ((v7 & 1) != 0)
  {
    goto LABEL_80;
  }
  if ((has & 0x80) != 0)
  {
    if ((v7 & 0x80) == 0 || self->_phyCellId != *((_DWORD *)v4 + 10))
      goto LABEL_80;
  }
  else if ((v7 & 0x80) != 0)
  {
    goto LABEL_80;
  }
  if ((has & 0x10) != 0)
  {
    if ((v7 & 0x10) == 0 || self->_dlFreq != *((_DWORD *)v4 + 7))
      goto LABEL_80;
  }
  else if ((v7 & 0x10) != 0)
  {
    goto LABEL_80;
  }
  if ((*(_WORD *)&self->_has & 0x4000) != 0)
  {
    if ((*((_WORD *)v4 + 40) & 0x4000) == 0 || self->_ulFreq != *((_DWORD *)v4 + 19))
      goto LABEL_80;
  }
  else if ((*((_WORD *)v4 + 40) & 0x4000) != 0)
  {
    goto LABEL_80;
  }
  if ((has & 8) != 0)
  {
    if ((v7 & 8) == 0 || self->_dlBw != *((_DWORD *)v4 + 6))
      goto LABEL_80;
  }
  else if ((v7 & 8) != 0)
  {
    goto LABEL_80;
  }
  if ((*(_WORD *)&self->_has & 0x2000) != 0)
  {
    if ((*((_WORD *)v4 + 40) & 0x2000) == 0 || self->_ulBw != *((_DWORD *)v4 + 18))
      goto LABEL_80;
  }
  else if ((*((_WORD *)v4 + 40) & 0x2000) != 0)
  {
    goto LABEL_80;
  }
  if ((has & 4) != 0)
  {
    if ((v7 & 4) == 0 || self->_cellId != *((_DWORD *)v4 + 5))
      goto LABEL_80;
  }
  else if ((v7 & 4) != 0)
  {
    goto LABEL_80;
  }
  if ((has & 0x20) != 0)
  {
    if ((v7 & 0x20) == 0 || self->_numMncDigits != *((_DWORD *)v4 + 8))
      goto LABEL_80;
  }
  else if ((v7 & 0x20) != 0)
  {
    goto LABEL_80;
  }
  if ((*(_WORD *)&self->_has & 0x200) != 0)
  {
    if ((*((_WORD *)v4 + 40) & 0x200) == 0 || self->_selPlmnMcc != *((_DWORD *)v4 + 12))
      goto LABEL_80;
  }
  else if ((*((_WORD *)v4 + 40) & 0x200) != 0)
  {
    goto LABEL_80;
  }
  if ((*(_WORD *)&self->_has & 0x400) != 0)
  {
    if ((*((_WORD *)v4 + 40) & 0x400) == 0 || self->_selPlmnMnc != *((_DWORD *)v4 + 13))
      goto LABEL_80;
  }
  else if ((*((_WORD *)v4 + 40) & 0x400) != 0)
  {
    goto LABEL_80;
  }
  if ((has & 2) != 0)
  {
    if ((v7 & 2) == 0 || self->_allowedAccess != *((_DWORD *)v4 + 4))
      goto LABEL_80;
  }
  else if ((v7 & 2) != 0)
  {
    goto LABEL_80;
  }
  if ((has & 0x40) != 0)
  {
    if ((v7 & 0x40) == 0 || self->_numSubs != *((_DWORD *)v4 + 9))
      goto LABEL_80;
  }
  else if ((v7 & 0x40) != 0)
  {
    goto LABEL_80;
  }
  simHplmn = self->_simHplmn;
  if ((unint64_t)simHplmn | *((_QWORD *)v4 + 7))
  {
    if (!-[NSData isEqual:](simHplmn, "isEqual:"))
    {
LABEL_80:
      v9 = 0;
      goto LABEL_81;
    }
    has = (__int16)self->_has;
  }
  if ((has & 0x800) != 0)
  {
    if ((*((_WORD *)v4 + 40) & 0x800) == 0 || self->_subsId != *((_DWORD *)v4 + 16))
      goto LABEL_80;
  }
  else if ((*((_WORD *)v4 + 40) & 0x800) != 0)
  {
    goto LABEL_80;
  }
  if ((has & 0x1000) != 0)
  {
    if ((*((_WORD *)v4 + 40) & 0x1000) == 0 || self->_trackingAreaCode != *((_DWORD *)v4 + 17))
      goto LABEL_80;
  }
  else if ((*((_WORD *)v4 + 40) & 0x1000) != 0)
  {
    goto LABEL_80;
  }
  if ((has & 0x100) != 0)
  {
    if ((*((_WORD *)v4 + 40) & 0x100) == 0 || self->_psPref != *((_DWORD *)v4 + 11))
      goto LABEL_80;
    v9 = 1;
  }
  else
  {
    v9 = (*((_WORD *)v4 + 40) & 0x100) == 0;
  }
LABEL_81:

  return v9;
}

- (unint64_t)hash
{
  __int16 has;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  unint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  unint64_t v20;

  has = (__int16)self->_has;
  if ((has & 1) != 0)
  {
    v20 = 2654435761u * self->_timestamp;
    if ((has & 0x80) != 0)
    {
LABEL_3:
      v19 = 2654435761 * self->_phyCellId;
      if ((has & 0x10) != 0)
        goto LABEL_4;
      goto LABEL_16;
    }
  }
  else
  {
    v20 = 0;
    if ((has & 0x80) != 0)
      goto LABEL_3;
  }
  v19 = 0;
  if ((has & 0x10) != 0)
  {
LABEL_4:
    v18 = 2654435761 * self->_dlFreq;
    if ((*(_WORD *)&self->_has & 0x4000) != 0)
      goto LABEL_5;
    goto LABEL_17;
  }
LABEL_16:
  v18 = 0;
  if ((*(_WORD *)&self->_has & 0x4000) != 0)
  {
LABEL_5:
    v17 = 2654435761 * self->_ulFreq;
    if ((has & 8) != 0)
      goto LABEL_6;
    goto LABEL_18;
  }
LABEL_17:
  v17 = 0;
  if ((has & 8) != 0)
  {
LABEL_6:
    v16 = 2654435761 * self->_dlBw;
    if ((*(_WORD *)&self->_has & 0x2000) != 0)
      goto LABEL_7;
    goto LABEL_19;
  }
LABEL_18:
  v16 = 0;
  if ((*(_WORD *)&self->_has & 0x2000) != 0)
  {
LABEL_7:
    v4 = 2654435761 * self->_ulBw;
    if ((has & 4) != 0)
      goto LABEL_8;
    goto LABEL_20;
  }
LABEL_19:
  v4 = 0;
  if ((has & 4) != 0)
  {
LABEL_8:
    v5 = 2654435761 * self->_cellId;
    if ((has & 0x20) != 0)
      goto LABEL_9;
    goto LABEL_21;
  }
LABEL_20:
  v5 = 0;
  if ((has & 0x20) != 0)
  {
LABEL_9:
    v6 = 2654435761 * self->_numMncDigits;
    if ((*(_WORD *)&self->_has & 0x200) != 0)
      goto LABEL_10;
    goto LABEL_22;
  }
LABEL_21:
  v6 = 0;
  if ((*(_WORD *)&self->_has & 0x200) != 0)
  {
LABEL_10:
    v7 = 2654435761 * self->_selPlmnMcc;
    if ((*(_WORD *)&self->_has & 0x400) != 0)
      goto LABEL_11;
    goto LABEL_23;
  }
LABEL_22:
  v7 = 0;
  if ((*(_WORD *)&self->_has & 0x400) != 0)
  {
LABEL_11:
    v8 = 2654435761 * self->_selPlmnMnc;
    if ((has & 2) != 0)
      goto LABEL_12;
LABEL_24:
    v9 = 0;
    if ((has & 0x40) != 0)
      goto LABEL_13;
    goto LABEL_25;
  }
LABEL_23:
  v8 = 0;
  if ((has & 2) == 0)
    goto LABEL_24;
LABEL_12:
  v9 = 2654435761 * self->_allowedAccess;
  if ((has & 0x40) != 0)
  {
LABEL_13:
    v10 = 2654435761 * self->_numSubs;
    goto LABEL_26;
  }
LABEL_25:
  v10 = 0;
LABEL_26:
  v11 = (unint64_t)-[NSData hash](self->_simHplmn, "hash");
  if ((*(_WORD *)&self->_has & 0x800) == 0)
  {
    v12 = 0;
    if ((*(_WORD *)&self->_has & 0x1000) != 0)
      goto LABEL_28;
LABEL_31:
    v13 = 0;
    if ((*(_WORD *)&self->_has & 0x100) != 0)
      goto LABEL_29;
LABEL_32:
    v14 = 0;
    return v19 ^ v20 ^ v18 ^ v17 ^ v16 ^ v4 ^ v5 ^ v6 ^ v7 ^ v8 ^ v9 ^ v10 ^ v12 ^ v13 ^ v14 ^ v11;
  }
  v12 = 2654435761 * self->_subsId;
  if ((*(_WORD *)&self->_has & 0x1000) == 0)
    goto LABEL_31;
LABEL_28:
  v13 = 2654435761 * self->_trackingAreaCode;
  if ((*(_WORD *)&self->_has & 0x100) == 0)
    goto LABEL_32;
LABEL_29:
  v14 = 2654435761 * self->_psPref;
  return v19 ^ v20 ^ v18 ^ v17 ^ v16 ^ v4 ^ v5 ^ v6 ^ v7 ^ v8 ^ v9 ^ v10 ^ v12 ^ v13 ^ v14 ^ v11;
}

- (void)mergeFrom:(id)a3
{
  id v4;
  __int16 v5;
  __int16 v6;
  id v7;

  v4 = a3;
  v5 = *((_WORD *)v4 + 40);
  if ((v5 & 1) != 0)
  {
    self->_timestamp = *((_QWORD *)v4 + 1);
    *(_WORD *)&self->_has |= 1u;
    v5 = *((_WORD *)v4 + 40);
    if ((v5 & 0x80) == 0)
    {
LABEL_3:
      if ((v5 & 0x10) == 0)
        goto LABEL_4;
      goto LABEL_23;
    }
  }
  else if ((v5 & 0x80) == 0)
  {
    goto LABEL_3;
  }
  self->_phyCellId = *((_DWORD *)v4 + 10);
  *(_WORD *)&self->_has |= 0x80u;
  v5 = *((_WORD *)v4 + 40);
  if ((v5 & 0x10) == 0)
  {
LABEL_4:
    if ((v5 & 0x4000) == 0)
      goto LABEL_5;
    goto LABEL_24;
  }
LABEL_23:
  self->_dlFreq = *((_DWORD *)v4 + 7);
  *(_WORD *)&self->_has |= 0x10u;
  v5 = *((_WORD *)v4 + 40);
  if ((v5 & 0x4000) == 0)
  {
LABEL_5:
    if ((v5 & 8) == 0)
      goto LABEL_6;
    goto LABEL_25;
  }
LABEL_24:
  self->_ulFreq = *((_DWORD *)v4 + 19);
  *(_WORD *)&self->_has |= 0x4000u;
  v5 = *((_WORD *)v4 + 40);
  if ((v5 & 8) == 0)
  {
LABEL_6:
    if ((v5 & 0x2000) == 0)
      goto LABEL_7;
    goto LABEL_26;
  }
LABEL_25:
  self->_dlBw = *((_DWORD *)v4 + 6);
  *(_WORD *)&self->_has |= 8u;
  v5 = *((_WORD *)v4 + 40);
  if ((v5 & 0x2000) == 0)
  {
LABEL_7:
    if ((v5 & 4) == 0)
      goto LABEL_8;
    goto LABEL_27;
  }
LABEL_26:
  self->_ulBw = *((_DWORD *)v4 + 18);
  *(_WORD *)&self->_has |= 0x2000u;
  v5 = *((_WORD *)v4 + 40);
  if ((v5 & 4) == 0)
  {
LABEL_8:
    if ((v5 & 0x20) == 0)
      goto LABEL_9;
    goto LABEL_28;
  }
LABEL_27:
  self->_cellId = *((_DWORD *)v4 + 5);
  *(_WORD *)&self->_has |= 4u;
  v5 = *((_WORD *)v4 + 40);
  if ((v5 & 0x20) == 0)
  {
LABEL_9:
    if ((v5 & 0x200) == 0)
      goto LABEL_10;
    goto LABEL_29;
  }
LABEL_28:
  self->_numMncDigits = *((_DWORD *)v4 + 8);
  *(_WORD *)&self->_has |= 0x20u;
  v5 = *((_WORD *)v4 + 40);
  if ((v5 & 0x200) == 0)
  {
LABEL_10:
    if ((v5 & 0x400) == 0)
      goto LABEL_11;
    goto LABEL_30;
  }
LABEL_29:
  self->_selPlmnMcc = *((_DWORD *)v4 + 12);
  *(_WORD *)&self->_has |= 0x200u;
  v5 = *((_WORD *)v4 + 40);
  if ((v5 & 0x400) == 0)
  {
LABEL_11:
    if ((v5 & 2) == 0)
      goto LABEL_12;
    goto LABEL_31;
  }
LABEL_30:
  self->_selPlmnMnc = *((_DWORD *)v4 + 13);
  *(_WORD *)&self->_has |= 0x400u;
  v5 = *((_WORD *)v4 + 40);
  if ((v5 & 2) == 0)
  {
LABEL_12:
    if ((v5 & 0x40) == 0)
      goto LABEL_14;
    goto LABEL_13;
  }
LABEL_31:
  self->_allowedAccess = *((_DWORD *)v4 + 4);
  *(_WORD *)&self->_has |= 2u;
  if ((*((_WORD *)v4 + 40) & 0x40) != 0)
  {
LABEL_13:
    self->_numSubs = *((_DWORD *)v4 + 9);
    *(_WORD *)&self->_has |= 0x40u;
  }
LABEL_14:
  if (*((_QWORD *)v4 + 7))
  {
    v7 = v4;
    -[CellularNrScellInfo setSimHplmn:](self, "setSimHplmn:");
    v4 = v7;
  }
  v6 = *((_WORD *)v4 + 40);
  if ((v6 & 0x800) == 0)
  {
    if ((*((_WORD *)v4 + 40) & 0x1000) == 0)
      goto LABEL_18;
LABEL_34:
    self->_trackingAreaCode = *((_DWORD *)v4 + 17);
    *(_WORD *)&self->_has |= 0x1000u;
    if ((*((_WORD *)v4 + 40) & 0x100) == 0)
      goto LABEL_20;
    goto LABEL_19;
  }
  self->_subsId = *((_DWORD *)v4 + 16);
  *(_WORD *)&self->_has |= 0x800u;
  v6 = *((_WORD *)v4 + 40);
  if ((v6 & 0x1000) != 0)
    goto LABEL_34;
LABEL_18:
  if ((v6 & 0x100) != 0)
  {
LABEL_19:
    self->_psPref = *((_DWORD *)v4 + 11);
    *(_WORD *)&self->_has |= 0x100u;
  }
LABEL_20:

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

- (unsigned)trackingAreaCode
{
  return self->_trackingAreaCode;
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
