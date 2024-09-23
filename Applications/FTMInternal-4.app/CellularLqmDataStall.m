@implementation CellularLqmDataStall

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

- (void)setDataStallOccured:(BOOL)a3
{
  *(_WORD *)&self->_has |= 0x100u;
  self->_dataStallOccured = a3;
}

- (void)setHasDataStallOccured:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 256;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFEFF | v3;
}

- (BOOL)hasDataStallOccured
{
  return HIBYTE(*(_WORD *)&self->_has) & 1;
}

- (void)setDnsFailureOccured:(BOOL)a3
{
  *(_WORD *)&self->_has |= 0x200u;
  self->_dnsFailureOccured = a3;
}

- (void)setHasDnsFailureOccured:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 512;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFDFF | v3;
}

- (BOOL)hasDnsFailureOccured
{
  return (*(_WORD *)&self->_has >> 9) & 1;
}

- (void)setMediaPreWarningHint:(BOOL)a3
{
  *(_WORD *)&self->_has |= 0x800u;
  self->_mediaPreWarningHint = a3;
}

- (void)setHasMediaPreWarningHint:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 2048;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xF7FF | v3;
}

- (BOOL)hasMediaPreWarningHint
{
  return (*(_WORD *)&self->_has >> 11) & 1;
}

- (void)setSysMode:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 0x80u;
  self->_sysMode = a3;
}

- (void)setHasSysMode:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 128;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFF7F | v3;
}

- (BOOL)hasSysMode
{
  return (*(_WORD *)&self->_has >> 7) & 1;
}

- (void)setLqmState:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 2u;
  self->_lqmState = a3;
}

- (void)setHasLqmState:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFFD | v3;
}

- (BOOL)hasLqmState
{
  return (*(_WORD *)&self->_has >> 1) & 1;
}

- (void)setServCellState:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 0x20u;
  self->_servCellState = a3;
}

- (void)setHasServCellState:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 32;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFDF | v3;
}

- (BOOL)hasServCellState
{
  return (*(_WORD *)&self->_has >> 5) & 1;
}

- (void)setRrcState:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 0x10u;
  self->_rrcState = a3;
}

- (void)setHasRrcState:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 16;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFEF | v3;
}

- (BOOL)hasRrcState
{
  return (*(_WORD *)&self->_has >> 4) & 1;
}

- (void)setIsDcActive:(BOOL)a3
{
  *(_WORD *)&self->_has |= 0x400u;
  self->_isDcActive = a3;
}

- (void)setHasIsDcActive:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 1024;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFBFF | v3;
}

- (BOOL)hasIsDcActive
{
  return (*(_WORD *)&self->_has >> 10) & 1;
}

- (void)setNumSubs:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 4u;
  self->_numSubs = a3;
}

- (void)setHasNumSubs:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 4;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFFB | v3;
}

- (BOOL)hasNumSubs
{
  return (*(_WORD *)&self->_has >> 2) & 1;
}

- (BOOL)hasPlmn
{
  return self->_plmn != 0;
}

- (void)setPsPref:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 8u;
  self->_psPref = a3;
}

- (void)setHasPsPref:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 8;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFF7 | v3;
}

- (BOOL)hasPsPref
{
  return (*(_WORD *)&self->_has >> 3) & 1;
}

- (void)setSubsId:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 0x40u;
  self->_subsId = a3;
}

- (void)setHasSubsId:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 64;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFBF | v3;
}

- (BOOL)hasSubsId
{
  return (*(_WORD *)&self->_has >> 6) & 1;
}

- (id)description
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)CellularLqmDataStall;
  v3 = -[CellularLqmDataStall description](&v8, "description");
  v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[CellularLqmDataStall dictionaryRepresentation](self, "dictionaryRepresentation"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@ %@"), v4, v5));

  return v6;
}

- (id)dictionaryRepresentation
{
  void *v3;
  __int16 has;
  void *v5;
  NSData *plmn;
  __int16 v7;
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

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary"));
  has = (__int16)self->_has;
  if ((has & 1) != 0)
  {
    v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedLongLong:](NSNumber, "numberWithUnsignedLongLong:", self->_timestamp));
    objc_msgSend(v3, "setObject:forKey:", v11, CFSTR("timestamp"));

    has = (__int16)self->_has;
    if ((has & 0x100) == 0)
    {
LABEL_3:
      if ((has & 0x200) == 0)
        goto LABEL_4;
      goto LABEL_21;
    }
  }
  else if ((*(_WORD *)&self->_has & 0x100) == 0)
  {
    goto LABEL_3;
  }
  v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", self->_dataStallOccured));
  objc_msgSend(v3, "setObject:forKey:", v12, CFSTR("data_stall_occured"));

  has = (__int16)self->_has;
  if ((has & 0x200) == 0)
  {
LABEL_4:
    if ((has & 0x800) == 0)
      goto LABEL_5;
    goto LABEL_22;
  }
LABEL_21:
  v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", self->_dnsFailureOccured));
  objc_msgSend(v3, "setObject:forKey:", v13, CFSTR("dns_failure_occured"));

  has = (__int16)self->_has;
  if ((has & 0x800) == 0)
  {
LABEL_5:
    if ((has & 0x80) == 0)
      goto LABEL_6;
    goto LABEL_23;
  }
LABEL_22:
  v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", self->_mediaPreWarningHint));
  objc_msgSend(v3, "setObject:forKey:", v14, CFSTR("media_pre_warning_hint"));

  has = (__int16)self->_has;
  if ((has & 0x80) == 0)
  {
LABEL_6:
    if ((has & 2) == 0)
      goto LABEL_7;
    goto LABEL_24;
  }
LABEL_23:
  v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", self->_sysMode));
  objc_msgSend(v3, "setObject:forKey:", v15, CFSTR("sys_mode"));

  has = (__int16)self->_has;
  if ((has & 2) == 0)
  {
LABEL_7:
    if ((has & 0x20) == 0)
      goto LABEL_8;
    goto LABEL_25;
  }
LABEL_24:
  v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", self->_lqmState));
  objc_msgSend(v3, "setObject:forKey:", v16, CFSTR("lqm_state"));

  has = (__int16)self->_has;
  if ((has & 0x20) == 0)
  {
LABEL_8:
    if ((has & 0x10) == 0)
      goto LABEL_9;
    goto LABEL_26;
  }
LABEL_25:
  v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", self->_servCellState));
  objc_msgSend(v3, "setObject:forKey:", v17, CFSTR("serv_cell_state"));

  has = (__int16)self->_has;
  if ((has & 0x10) == 0)
  {
LABEL_9:
    if ((has & 0x400) == 0)
      goto LABEL_10;
    goto LABEL_27;
  }
LABEL_26:
  v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", self->_rrcState));
  objc_msgSend(v3, "setObject:forKey:", v18, CFSTR("rrc_state"));

  has = (__int16)self->_has;
  if ((has & 0x400) == 0)
  {
LABEL_10:
    if ((has & 4) == 0)
      goto LABEL_12;
    goto LABEL_11;
  }
LABEL_27:
  v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", self->_isDcActive));
  objc_msgSend(v3, "setObject:forKey:", v19, CFSTR("is_dc_active"));

  if ((*(_WORD *)&self->_has & 4) != 0)
  {
LABEL_11:
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", self->_numSubs));
    objc_msgSend(v3, "setObject:forKey:", v5, CFSTR("num_subs"));

  }
LABEL_12:
  plmn = self->_plmn;
  if (plmn)
    objc_msgSend(v3, "setObject:forKey:", plmn, CFSTR("plmn"));
  v7 = (__int16)self->_has;
  if ((v7 & 8) != 0)
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", self->_psPref));
    objc_msgSend(v3, "setObject:forKey:", v8, CFSTR("ps_pref"));

    v7 = (__int16)self->_has;
  }
  if ((v7 & 0x40) != 0)
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", self->_subsId));
    objc_msgSend(v3, "setObject:forKey:", v9, CFSTR("subs_id"));

  }
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return sub_100131490((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  __int16 has;
  NSData *plmn;
  __int16 v6;
  id v7;

  v7 = a3;
  has = (__int16)self->_has;
  if ((has & 1) != 0)
  {
    PBDataWriterWriteUint64Field(v7, self->_timestamp, 1);
    has = (__int16)self->_has;
    if ((has & 0x100) == 0)
    {
LABEL_3:
      if ((has & 0x200) == 0)
        goto LABEL_4;
      goto LABEL_21;
    }
  }
  else if ((*(_WORD *)&self->_has & 0x100) == 0)
  {
    goto LABEL_3;
  }
  PBDataWriterWriteBOOLField(v7, self->_dataStallOccured, 3);
  has = (__int16)self->_has;
  if ((has & 0x200) == 0)
  {
LABEL_4:
    if ((has & 0x800) == 0)
      goto LABEL_5;
    goto LABEL_22;
  }
LABEL_21:
  PBDataWriterWriteBOOLField(v7, self->_dnsFailureOccured, 4);
  has = (__int16)self->_has;
  if ((has & 0x800) == 0)
  {
LABEL_5:
    if ((has & 0x80) == 0)
      goto LABEL_6;
    goto LABEL_23;
  }
LABEL_22:
  PBDataWriterWriteBOOLField(v7, self->_mediaPreWarningHint, 5);
  has = (__int16)self->_has;
  if ((has & 0x80) == 0)
  {
LABEL_6:
    if ((has & 2) == 0)
      goto LABEL_7;
    goto LABEL_24;
  }
LABEL_23:
  PBDataWriterWriteUint32Field(v7, self->_sysMode, 6);
  has = (__int16)self->_has;
  if ((has & 2) == 0)
  {
LABEL_7:
    if ((has & 0x20) == 0)
      goto LABEL_8;
    goto LABEL_25;
  }
LABEL_24:
  PBDataWriterWriteUint32Field(v7, self->_lqmState, 7);
  has = (__int16)self->_has;
  if ((has & 0x20) == 0)
  {
LABEL_8:
    if ((has & 0x10) == 0)
      goto LABEL_9;
    goto LABEL_26;
  }
LABEL_25:
  PBDataWriterWriteUint32Field(v7, self->_servCellState, 8);
  has = (__int16)self->_has;
  if ((has & 0x10) == 0)
  {
LABEL_9:
    if ((has & 0x400) == 0)
      goto LABEL_10;
    goto LABEL_27;
  }
LABEL_26:
  PBDataWriterWriteUint32Field(v7, self->_rrcState, 9);
  has = (__int16)self->_has;
  if ((has & 0x400) == 0)
  {
LABEL_10:
    if ((has & 4) == 0)
      goto LABEL_12;
    goto LABEL_11;
  }
LABEL_27:
  PBDataWriterWriteBOOLField(v7, self->_isDcActive, 10);
  if ((*(_WORD *)&self->_has & 4) != 0)
LABEL_11:
    PBDataWriterWriteUint32Field(v7, self->_numSubs, 11);
LABEL_12:
  plmn = self->_plmn;
  if (plmn)
    PBDataWriterWriteDataField(v7, plmn, 12);
  v6 = (__int16)self->_has;
  if ((v6 & 8) != 0)
  {
    PBDataWriterWriteUint32Field(v7, self->_psPref, 13);
    v6 = (__int16)self->_has;
  }
  if ((v6 & 0x40) != 0)
    PBDataWriterWriteUint32Field(v7, self->_subsId, 14);

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
    *((_WORD *)v4 + 28) |= 1u;
    has = (__int16)self->_has;
    if ((has & 0x100) == 0)
    {
LABEL_3:
      if ((has & 0x200) == 0)
        goto LABEL_4;
      goto LABEL_21;
    }
  }
  else if ((*(_WORD *)&self->_has & 0x100) == 0)
  {
    goto LABEL_3;
  }
  *((_BYTE *)v4 + 52) = self->_dataStallOccured;
  *((_WORD *)v4 + 28) |= 0x100u;
  has = (__int16)self->_has;
  if ((has & 0x200) == 0)
  {
LABEL_4:
    if ((has & 0x800) == 0)
      goto LABEL_5;
    goto LABEL_22;
  }
LABEL_21:
  *((_BYTE *)v4 + 53) = self->_dnsFailureOccured;
  *((_WORD *)v4 + 28) |= 0x200u;
  has = (__int16)self->_has;
  if ((has & 0x800) == 0)
  {
LABEL_5:
    if ((has & 0x80) == 0)
      goto LABEL_6;
    goto LABEL_23;
  }
LABEL_22:
  *((_BYTE *)v4 + 55) = self->_mediaPreWarningHint;
  *((_WORD *)v4 + 28) |= 0x800u;
  has = (__int16)self->_has;
  if ((has & 0x80) == 0)
  {
LABEL_6:
    if ((has & 2) == 0)
      goto LABEL_7;
    goto LABEL_24;
  }
LABEL_23:
  *((_DWORD *)v4 + 12) = self->_sysMode;
  *((_WORD *)v4 + 28) |= 0x80u;
  has = (__int16)self->_has;
  if ((has & 2) == 0)
  {
LABEL_7:
    if ((has & 0x20) == 0)
      goto LABEL_8;
    goto LABEL_25;
  }
LABEL_24:
  *((_DWORD *)v4 + 4) = self->_lqmState;
  *((_WORD *)v4 + 28) |= 2u;
  has = (__int16)self->_has;
  if ((has & 0x20) == 0)
  {
LABEL_8:
    if ((has & 0x10) == 0)
      goto LABEL_9;
    goto LABEL_26;
  }
LABEL_25:
  *((_DWORD *)v4 + 10) = self->_servCellState;
  *((_WORD *)v4 + 28) |= 0x20u;
  has = (__int16)self->_has;
  if ((has & 0x10) == 0)
  {
LABEL_9:
    if ((has & 0x400) == 0)
      goto LABEL_10;
    goto LABEL_27;
  }
LABEL_26:
  *((_DWORD *)v4 + 9) = self->_rrcState;
  *((_WORD *)v4 + 28) |= 0x10u;
  has = (__int16)self->_has;
  if ((has & 0x400) == 0)
  {
LABEL_10:
    if ((has & 4) == 0)
      goto LABEL_12;
    goto LABEL_11;
  }
LABEL_27:
  *((_BYTE *)v4 + 54) = self->_isDcActive;
  *((_WORD *)v4 + 28) |= 0x400u;
  if ((*(_WORD *)&self->_has & 4) != 0)
  {
LABEL_11:
    *((_DWORD *)v4 + 5) = self->_numSubs;
    *((_WORD *)v4 + 28) |= 4u;
  }
LABEL_12:
  if (self->_plmn)
  {
    v7 = v4;
    objc_msgSend(v4, "setPlmn:");
    v4 = v7;
  }
  v6 = (__int16)self->_has;
  if ((v6 & 8) != 0)
  {
    *((_DWORD *)v4 + 8) = self->_psPref;
    *((_WORD *)v4 + 28) |= 8u;
    v6 = (__int16)self->_has;
  }
  if ((v6 & 0x40) != 0)
  {
    *((_DWORD *)v4 + 11) = self->_subsId;
    *((_WORD *)v4 + 28) |= 0x40u;
  }

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
    *((_WORD *)v5 + 28) |= 1u;
    has = (__int16)self->_has;
    if ((has & 0x100) == 0)
    {
LABEL_3:
      if ((has & 0x200) == 0)
        goto LABEL_4;
      goto LABEL_19;
    }
  }
  else if ((*(_WORD *)&self->_has & 0x100) == 0)
  {
    goto LABEL_3;
  }
  *((_BYTE *)v5 + 52) = self->_dataStallOccured;
  *((_WORD *)v5 + 28) |= 0x100u;
  has = (__int16)self->_has;
  if ((has & 0x200) == 0)
  {
LABEL_4:
    if ((has & 0x800) == 0)
      goto LABEL_5;
    goto LABEL_20;
  }
LABEL_19:
  *((_BYTE *)v5 + 53) = self->_dnsFailureOccured;
  *((_WORD *)v5 + 28) |= 0x200u;
  has = (__int16)self->_has;
  if ((has & 0x800) == 0)
  {
LABEL_5:
    if ((has & 0x80) == 0)
      goto LABEL_6;
    goto LABEL_21;
  }
LABEL_20:
  *((_BYTE *)v5 + 55) = self->_mediaPreWarningHint;
  *((_WORD *)v5 + 28) |= 0x800u;
  has = (__int16)self->_has;
  if ((has & 0x80) == 0)
  {
LABEL_6:
    if ((has & 2) == 0)
      goto LABEL_7;
    goto LABEL_22;
  }
LABEL_21:
  *((_DWORD *)v5 + 12) = self->_sysMode;
  *((_WORD *)v5 + 28) |= 0x80u;
  has = (__int16)self->_has;
  if ((has & 2) == 0)
  {
LABEL_7:
    if ((has & 0x20) == 0)
      goto LABEL_8;
    goto LABEL_23;
  }
LABEL_22:
  *((_DWORD *)v5 + 4) = self->_lqmState;
  *((_WORD *)v5 + 28) |= 2u;
  has = (__int16)self->_has;
  if ((has & 0x20) == 0)
  {
LABEL_8:
    if ((has & 0x10) == 0)
      goto LABEL_9;
    goto LABEL_24;
  }
LABEL_23:
  *((_DWORD *)v5 + 10) = self->_servCellState;
  *((_WORD *)v5 + 28) |= 0x20u;
  has = (__int16)self->_has;
  if ((has & 0x10) == 0)
  {
LABEL_9:
    if ((has & 0x400) == 0)
      goto LABEL_10;
    goto LABEL_25;
  }
LABEL_24:
  *((_DWORD *)v5 + 9) = self->_rrcState;
  *((_WORD *)v5 + 28) |= 0x10u;
  has = (__int16)self->_has;
  if ((has & 0x400) == 0)
  {
LABEL_10:
    if ((has & 4) == 0)
      goto LABEL_12;
    goto LABEL_11;
  }
LABEL_25:
  *((_BYTE *)v5 + 54) = self->_isDcActive;
  *((_WORD *)v5 + 28) |= 0x400u;
  if ((*(_WORD *)&self->_has & 4) != 0)
  {
LABEL_11:
    *((_DWORD *)v5 + 5) = self->_numSubs;
    *((_WORD *)v5 + 28) |= 4u;
  }
LABEL_12:
  v8 = -[NSData copyWithZone:](self->_plmn, "copyWithZone:", a3);
  v9 = (void *)v6[3];
  v6[3] = v8;

  v10 = (__int16)self->_has;
  if ((v10 & 8) != 0)
  {
    *((_DWORD *)v6 + 8) = self->_psPref;
    *((_WORD *)v6 + 28) |= 8u;
    v10 = (__int16)self->_has;
  }
  if ((v10 & 0x40) != 0)
  {
    *((_DWORD *)v6 + 11) = self->_subsId;
    *((_WORD *)v6 + 28) |= 0x40u;
  }
  return v6;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  uint64_t v5;
  __int16 has;
  __int16 v7;
  NSData *plmn;
  __int16 v9;
  BOOL v10;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class(self, v5)))
    goto LABEL_77;
  has = (__int16)self->_has;
  v7 = *((_WORD *)v4 + 28);
  if ((has & 1) != 0)
  {
    if ((v7 & 1) == 0 || self->_timestamp != *((_QWORD *)v4 + 1))
      goto LABEL_77;
  }
  else if ((v7 & 1) != 0)
  {
    goto LABEL_77;
  }
  if ((*(_WORD *)&self->_has & 0x100) != 0)
  {
    if ((*((_WORD *)v4 + 28) & 0x100) == 0)
      goto LABEL_77;
    if (self->_dataStallOccured)
    {
      if (!*((_BYTE *)v4 + 52))
        goto LABEL_77;
    }
    else if (*((_BYTE *)v4 + 52))
    {
      goto LABEL_77;
    }
  }
  else if ((*((_WORD *)v4 + 28) & 0x100) != 0)
  {
    goto LABEL_77;
  }
  if ((*(_WORD *)&self->_has & 0x200) != 0)
  {
    if ((*((_WORD *)v4 + 28) & 0x200) == 0)
      goto LABEL_77;
    if (self->_dnsFailureOccured)
    {
      if (!*((_BYTE *)v4 + 53))
        goto LABEL_77;
    }
    else if (*((_BYTE *)v4 + 53))
    {
      goto LABEL_77;
    }
  }
  else if ((*((_WORD *)v4 + 28) & 0x200) != 0)
  {
    goto LABEL_77;
  }
  if ((*(_WORD *)&self->_has & 0x800) != 0)
  {
    if ((*((_WORD *)v4 + 28) & 0x800) == 0)
      goto LABEL_77;
    if (self->_mediaPreWarningHint)
    {
      if (!*((_BYTE *)v4 + 55))
        goto LABEL_77;
    }
    else if (*((_BYTE *)v4 + 55))
    {
      goto LABEL_77;
    }
  }
  else if ((*((_WORD *)v4 + 28) & 0x800) != 0)
  {
    goto LABEL_77;
  }
  if ((has & 0x80) != 0)
  {
    if ((v7 & 0x80) == 0 || self->_sysMode != *((_DWORD *)v4 + 12))
      goto LABEL_77;
  }
  else if ((v7 & 0x80) != 0)
  {
    goto LABEL_77;
  }
  if ((has & 2) != 0)
  {
    if ((v7 & 2) == 0 || self->_lqmState != *((_DWORD *)v4 + 4))
      goto LABEL_77;
  }
  else if ((v7 & 2) != 0)
  {
    goto LABEL_77;
  }
  if ((has & 0x20) != 0)
  {
    if ((v7 & 0x20) == 0 || self->_servCellState != *((_DWORD *)v4 + 10))
      goto LABEL_77;
  }
  else if ((v7 & 0x20) != 0)
  {
    goto LABEL_77;
  }
  if ((has & 0x10) != 0)
  {
    if ((v7 & 0x10) == 0 || self->_rrcState != *((_DWORD *)v4 + 9))
      goto LABEL_77;
  }
  else if ((v7 & 0x10) != 0)
  {
    goto LABEL_77;
  }
  if ((*(_WORD *)&self->_has & 0x400) != 0)
  {
    if ((*((_WORD *)v4 + 28) & 0x400) == 0)
      goto LABEL_77;
    if (self->_isDcActive)
    {
      if (!*((_BYTE *)v4 + 54))
        goto LABEL_77;
    }
    else if (*((_BYTE *)v4 + 54))
    {
      goto LABEL_77;
    }
  }
  else if ((*((_WORD *)v4 + 28) & 0x400) != 0)
  {
    goto LABEL_77;
  }
  if ((has & 4) != 0)
  {
    if ((v7 & 4) == 0 || self->_numSubs != *((_DWORD *)v4 + 5))
      goto LABEL_77;
  }
  else if ((v7 & 4) != 0)
  {
    goto LABEL_77;
  }
  plmn = self->_plmn;
  if ((unint64_t)plmn | *((_QWORD *)v4 + 3))
  {
    if (-[NSData isEqual:](plmn, "isEqual:"))
    {
      has = (__int16)self->_has;
      goto LABEL_67;
    }
LABEL_77:
    v10 = 0;
    goto LABEL_78;
  }
LABEL_67:
  v9 = *((_WORD *)v4 + 28);
  if ((has & 8) != 0)
  {
    if ((v9 & 8) == 0 || self->_psPref != *((_DWORD *)v4 + 8))
      goto LABEL_77;
  }
  else if ((v9 & 8) != 0)
  {
    goto LABEL_77;
  }
  if ((has & 0x40) != 0)
  {
    if ((v9 & 0x40) == 0 || self->_subsId != *((_DWORD *)v4 + 11))
      goto LABEL_77;
    v10 = 1;
  }
  else
  {
    v10 = (v9 & 0x40) == 0;
  }
LABEL_78:

  return v10;
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
  __int16 v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v16;
  uint64_t v17;
  unint64_t v18;

  has = (__int16)self->_has;
  if ((has & 1) != 0)
  {
    v18 = 2654435761u * self->_timestamp;
    if ((*(_WORD *)&self->_has & 0x100) != 0)
    {
LABEL_3:
      v17 = 2654435761 * self->_dataStallOccured;
      if ((*(_WORD *)&self->_has & 0x200) != 0)
        goto LABEL_4;
      goto LABEL_14;
    }
  }
  else
  {
    v18 = 0;
    if ((*(_WORD *)&self->_has & 0x100) != 0)
      goto LABEL_3;
  }
  v17 = 0;
  if ((*(_WORD *)&self->_has & 0x200) != 0)
  {
LABEL_4:
    v16 = 2654435761 * self->_dnsFailureOccured;
    if ((*(_WORD *)&self->_has & 0x800) != 0)
      goto LABEL_5;
    goto LABEL_15;
  }
LABEL_14:
  v16 = 0;
  if ((*(_WORD *)&self->_has & 0x800) != 0)
  {
LABEL_5:
    v4 = 2654435761 * self->_mediaPreWarningHint;
    if ((has & 0x80) != 0)
      goto LABEL_6;
    goto LABEL_16;
  }
LABEL_15:
  v4 = 0;
  if ((has & 0x80) != 0)
  {
LABEL_6:
    v5 = 2654435761 * self->_sysMode;
    if ((has & 2) != 0)
      goto LABEL_7;
    goto LABEL_17;
  }
LABEL_16:
  v5 = 0;
  if ((has & 2) != 0)
  {
LABEL_7:
    v6 = 2654435761 * self->_lqmState;
    if ((has & 0x20) != 0)
      goto LABEL_8;
    goto LABEL_18;
  }
LABEL_17:
  v6 = 0;
  if ((has & 0x20) != 0)
  {
LABEL_8:
    v7 = 2654435761 * self->_servCellState;
    if ((has & 0x10) != 0)
      goto LABEL_9;
    goto LABEL_19;
  }
LABEL_18:
  v7 = 0;
  if ((has & 0x10) != 0)
  {
LABEL_9:
    v8 = 2654435761 * self->_rrcState;
    if ((*(_WORD *)&self->_has & 0x400) != 0)
      goto LABEL_10;
LABEL_20:
    v9 = 0;
    if ((has & 4) != 0)
      goto LABEL_11;
    goto LABEL_21;
  }
LABEL_19:
  v8 = 0;
  if ((*(_WORD *)&self->_has & 0x400) == 0)
    goto LABEL_20;
LABEL_10:
  v9 = 2654435761 * self->_isDcActive;
  if ((has & 4) != 0)
  {
LABEL_11:
    v10 = 2654435761 * self->_numSubs;
    goto LABEL_22;
  }
LABEL_21:
  v10 = 0;
LABEL_22:
  v11 = (unint64_t)-[NSData hash](self->_plmn, "hash");
  v12 = (__int16)self->_has;
  if ((v12 & 8) != 0)
  {
    v13 = 2654435761 * self->_psPref;
    if ((v12 & 0x40) != 0)
      goto LABEL_24;
LABEL_26:
    v14 = 0;
    return v17 ^ v18 ^ v16 ^ v4 ^ v5 ^ v6 ^ v7 ^ v8 ^ v9 ^ v10 ^ v13 ^ v14 ^ v11;
  }
  v13 = 0;
  if ((v12 & 0x40) == 0)
    goto LABEL_26;
LABEL_24:
  v14 = 2654435761 * self->_subsId;
  return v17 ^ v18 ^ v16 ^ v4 ^ v5 ^ v6 ^ v7 ^ v8 ^ v9 ^ v10 ^ v13 ^ v14 ^ v11;
}

- (void)mergeFrom:(id)a3
{
  id v4;
  __int16 v5;
  __int16 v6;
  id v7;

  v4 = a3;
  v5 = *((_WORD *)v4 + 28);
  if ((v5 & 1) != 0)
  {
    self->_timestamp = *((_QWORD *)v4 + 1);
    *(_WORD *)&self->_has |= 1u;
    v5 = *((_WORD *)v4 + 28);
    if ((v5 & 0x100) == 0)
    {
LABEL_3:
      if ((v5 & 0x200) == 0)
        goto LABEL_4;
      goto LABEL_21;
    }
  }
  else if ((*((_WORD *)v4 + 28) & 0x100) == 0)
  {
    goto LABEL_3;
  }
  self->_dataStallOccured = *((_BYTE *)v4 + 52);
  *(_WORD *)&self->_has |= 0x100u;
  v5 = *((_WORD *)v4 + 28);
  if ((v5 & 0x200) == 0)
  {
LABEL_4:
    if ((v5 & 0x800) == 0)
      goto LABEL_5;
    goto LABEL_22;
  }
LABEL_21:
  self->_dnsFailureOccured = *((_BYTE *)v4 + 53);
  *(_WORD *)&self->_has |= 0x200u;
  v5 = *((_WORD *)v4 + 28);
  if ((v5 & 0x800) == 0)
  {
LABEL_5:
    if ((v5 & 0x80) == 0)
      goto LABEL_6;
    goto LABEL_23;
  }
LABEL_22:
  self->_mediaPreWarningHint = *((_BYTE *)v4 + 55);
  *(_WORD *)&self->_has |= 0x800u;
  v5 = *((_WORD *)v4 + 28);
  if ((v5 & 0x80) == 0)
  {
LABEL_6:
    if ((v5 & 2) == 0)
      goto LABEL_7;
    goto LABEL_24;
  }
LABEL_23:
  self->_sysMode = *((_DWORD *)v4 + 12);
  *(_WORD *)&self->_has |= 0x80u;
  v5 = *((_WORD *)v4 + 28);
  if ((v5 & 2) == 0)
  {
LABEL_7:
    if ((v5 & 0x20) == 0)
      goto LABEL_8;
    goto LABEL_25;
  }
LABEL_24:
  self->_lqmState = *((_DWORD *)v4 + 4);
  *(_WORD *)&self->_has |= 2u;
  v5 = *((_WORD *)v4 + 28);
  if ((v5 & 0x20) == 0)
  {
LABEL_8:
    if ((v5 & 0x10) == 0)
      goto LABEL_9;
    goto LABEL_26;
  }
LABEL_25:
  self->_servCellState = *((_DWORD *)v4 + 10);
  *(_WORD *)&self->_has |= 0x20u;
  v5 = *((_WORD *)v4 + 28);
  if ((v5 & 0x10) == 0)
  {
LABEL_9:
    if ((v5 & 0x400) == 0)
      goto LABEL_10;
    goto LABEL_27;
  }
LABEL_26:
  self->_rrcState = *((_DWORD *)v4 + 9);
  *(_WORD *)&self->_has |= 0x10u;
  v5 = *((_WORD *)v4 + 28);
  if ((v5 & 0x400) == 0)
  {
LABEL_10:
    if ((v5 & 4) == 0)
      goto LABEL_12;
    goto LABEL_11;
  }
LABEL_27:
  self->_isDcActive = *((_BYTE *)v4 + 54);
  *(_WORD *)&self->_has |= 0x400u;
  if ((*((_WORD *)v4 + 28) & 4) != 0)
  {
LABEL_11:
    self->_numSubs = *((_DWORD *)v4 + 5);
    *(_WORD *)&self->_has |= 4u;
  }
LABEL_12:
  if (*((_QWORD *)v4 + 3))
  {
    v7 = v4;
    -[CellularLqmDataStall setPlmn:](self, "setPlmn:");
    v4 = v7;
  }
  v6 = *((_WORD *)v4 + 28);
  if ((v6 & 8) != 0)
  {
    self->_psPref = *((_DWORD *)v4 + 8);
    *(_WORD *)&self->_has |= 8u;
    v6 = *((_WORD *)v4 + 28);
  }
  if ((v6 & 0x40) != 0)
  {
    self->_subsId = *((_DWORD *)v4 + 11);
    *(_WORD *)&self->_has |= 0x40u;
  }

}

- (unint64_t)timestamp
{
  return self->_timestamp;
}

- (BOOL)dataStallOccured
{
  return self->_dataStallOccured;
}

- (BOOL)dnsFailureOccured
{
  return self->_dnsFailureOccured;
}

- (BOOL)mediaPreWarningHint
{
  return self->_mediaPreWarningHint;
}

- (unsigned)sysMode
{
  return self->_sysMode;
}

- (unsigned)lqmState
{
  return self->_lqmState;
}

- (unsigned)servCellState
{
  return self->_servCellState;
}

- (unsigned)rrcState
{
  return self->_rrcState;
}

- (BOOL)isDcActive
{
  return self->_isDcActive;
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

- (unsigned)psPref
{
  return self->_psPref;
}

- (unsigned)subsId
{
  return self->_subsId;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_plmn, 0);
}

@end
