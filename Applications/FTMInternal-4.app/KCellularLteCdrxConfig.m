@implementation KCellularLteCdrxConfig

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

- (void)setCellStatus:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 4u;
  self->_cellStatus = a3;
}

- (void)setHasCellStatus:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 4;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFFB | v3;
}

- (BOOL)hasCellStatus
{
  return (*(_WORD *)&self->_has >> 2) & 1;
}

- (void)setOnDurationMs:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 0x80u;
  self->_onDurationMs = a3;
}

- (void)setHasOnDurationMs:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 128;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFF7F | v3;
}

- (BOOL)hasOnDurationMs
{
  return (*(_WORD *)&self->_has >> 7) & 1;
}

- (void)setDrxInactivityMs:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 8u;
  self->_drxInactivityMs = a3;
}

- (void)setHasDrxInactivityMs:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 8;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFF7 | v3;
}

- (BOOL)hasDrxInactivityMs
{
  return (*(_WORD *)&self->_has >> 3) & 1;
}

- (void)setDrxRetxTimerMs:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 0x10u;
  self->_drxRetxTimerMs = a3;
}

- (void)setHasDrxRetxTimerMs:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 16;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFEF | v3;
}

- (BOOL)hasDrxRetxTimerMs
{
  return (*(_WORD *)&self->_has >> 4) & 1;
}

- (void)setLongDrxCycleMs:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 0x40u;
  self->_longDrxCycleMs = a3;
}

- (void)setHasLongDrxCycleMs:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 64;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFBF | v3;
}

- (BOOL)hasLongDrxCycleMs
{
  return (*(_WORD *)&self->_has >> 6) & 1;
}

- (void)setShortDrxCycleMs:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 0x200u;
  self->_shortDrxCycleMs = a3;
}

- (void)setHasShortDrxCycleMs:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 512;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFDFF | v3;
}

- (BOOL)hasShortDrxCycleMs
{
  return (*(_WORD *)&self->_has >> 9) & 1;
}

- (void)setDrxShortCycleNum:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 0x20u;
  self->_drxShortCycleNum = a3;
}

- (void)setHasDrxShortCycleNum:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 32;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFDF | v3;
}

- (BOOL)hasDrxShortCycleNum
{
  return (*(_WORD *)&self->_has >> 5) & 1;
}

- (int)rrcState
{
  if ((*(_WORD *)&self->_has & 0x100) != 0)
    return self->_rrcState;
  else
    return 0;
}

- (void)setRrcState:(int)a3
{
  *(_WORD *)&self->_has |= 0x100u;
  self->_rrcState = a3;
}

- (void)setHasRrcState:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 256;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFEFF | v3;
}

- (BOOL)hasRrcState
{
  return HIBYTE(*(_WORD *)&self->_has) & 1;
}

- (id)rrcStateAsString:(int)a3
{
  if (a3 >= 7)
    return (id)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("(unknown: %i)"), *(_QWORD *)&a3));
  else
    return off_10025E720[a3];
}

- (int)StringAsRrcState:(id)a3
{
  id v3;
  int v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("KLTE_RRC_STATE_NULL")) & 1) != 0)
  {
    v4 = 0;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("KLTE_RRC_STATE_IDLE")) & 1) != 0)
  {
    v4 = 1;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("KLTE_RRC_STATE_ATMPT_CONNECTION")) & 1) != 0)
  {
    v4 = 2;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("KLTE_RRC_STATE_CONNECTED")) & 1) != 0)
  {
    v4 = 3;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("KLTE_RRC_STATE_ENDING")) & 1) != 0)
  {
    v4 = 4;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("KLTE_RRC_STATE_ATMPT_OUTBND_MOBILITY")) & 1) != 0)
  {
    v4 = 5;
  }
  else if (objc_msgSend(v3, "isEqualToString:", CFSTR("KLTE_RRC_STATE_ATMPT_INBND_MOBILITY")))
  {
    v4 = 6;
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (void)setCdrxConfigStatus:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 2u;
  self->_cdrxConfigStatus = a3;
}

- (void)setHasCdrxConfigStatus:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFFD | v3;
}

- (BOOL)hasCdrxConfigStatus
{
  return (*(_WORD *)&self->_has >> 1) & 1;
}

- (void)setTransmissionMode:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 0x800u;
  self->_transmissionMode = a3;
}

- (void)setHasTransmissionMode:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 2048;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xF7FF | v3;
}

- (BOOL)hasTransmissionMode
{
  return (*(_WORD *)&self->_has >> 11) & 1;
}

- (void)setSubsId:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 0x400u;
  self->_subsId = a3;
}

- (void)setHasSubsId:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 1024;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFBFF | v3;
}

- (BOOL)hasSubsId
{
  return (*(_WORD *)&self->_has >> 10) & 1;
}

- (id)description
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)KCellularLteCdrxConfig;
  v3 = -[KCellularLteCdrxConfig description](&v8, "description");
  v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[KCellularLteCdrxConfig dictionaryRepresentation](self, "dictionaryRepresentation"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@ %@"), v4, v5));

  return v6;
}

- (id)dictionaryRepresentation
{
  void *v3;
  __int16 has;
  void *v5;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t rrcState;
  __CFString *v16;
  void *v17;
  void *v18;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary"));
  has = (__int16)self->_has;
  if ((has & 1) != 0)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedLongLong:](NSNumber, "numberWithUnsignedLongLong:", self->_timestamp));
    objc_msgSend(v3, "setObject:forKey:", v7, CFSTR("timestamp"));

    has = (__int16)self->_has;
    if ((has & 4) == 0)
    {
LABEL_3:
      if ((has & 0x80) == 0)
        goto LABEL_4;
      goto LABEL_17;
    }
  }
  else if ((has & 4) == 0)
  {
    goto LABEL_3;
  }
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", self->_cellStatus));
  objc_msgSend(v3, "setObject:forKey:", v8, CFSTR("cell_status"));

  has = (__int16)self->_has;
  if ((has & 0x80) == 0)
  {
LABEL_4:
    if ((has & 8) == 0)
      goto LABEL_5;
    goto LABEL_18;
  }
LABEL_17:
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", self->_onDurationMs));
  objc_msgSend(v3, "setObject:forKey:", v9, CFSTR("on_duration_ms"));

  has = (__int16)self->_has;
  if ((has & 8) == 0)
  {
LABEL_5:
    if ((has & 0x10) == 0)
      goto LABEL_6;
    goto LABEL_19;
  }
LABEL_18:
  v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", self->_drxInactivityMs));
  objc_msgSend(v3, "setObject:forKey:", v10, CFSTR("drx_inactivity_ms"));

  has = (__int16)self->_has;
  if ((has & 0x10) == 0)
  {
LABEL_6:
    if ((has & 0x40) == 0)
      goto LABEL_7;
    goto LABEL_20;
  }
LABEL_19:
  v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", self->_drxRetxTimerMs));
  objc_msgSend(v3, "setObject:forKey:", v11, CFSTR("drx_retx_timer_ms"));

  has = (__int16)self->_has;
  if ((has & 0x40) == 0)
  {
LABEL_7:
    if ((has & 0x200) == 0)
      goto LABEL_8;
    goto LABEL_21;
  }
LABEL_20:
  v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", self->_longDrxCycleMs));
  objc_msgSend(v3, "setObject:forKey:", v12, CFSTR("long_drx_cycle_ms"));

  has = (__int16)self->_has;
  if ((has & 0x200) == 0)
  {
LABEL_8:
    if ((has & 0x20) == 0)
      goto LABEL_9;
    goto LABEL_22;
  }
LABEL_21:
  v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", self->_shortDrxCycleMs));
  objc_msgSend(v3, "setObject:forKey:", v13, CFSTR("short_drx_cycle_ms"));

  has = (__int16)self->_has;
  if ((has & 0x20) == 0)
  {
LABEL_9:
    if ((has & 0x100) == 0)
      goto LABEL_10;
    goto LABEL_23;
  }
LABEL_22:
  v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", self->_drxShortCycleNum));
  objc_msgSend(v3, "setObject:forKey:", v14, CFSTR("drx_short_cycle_num"));

  has = (__int16)self->_has;
  if ((has & 0x100) == 0)
  {
LABEL_10:
    if ((has & 2) == 0)
      goto LABEL_11;
    goto LABEL_27;
  }
LABEL_23:
  rrcState = self->_rrcState;
  if (rrcState >= 7)
    v16 = (__CFString *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("(unknown: %i)"), self->_rrcState));
  else
    v16 = off_10025E720[rrcState];
  objc_msgSend(v3, "setObject:forKey:", v16, CFSTR("rrc_state"));

  has = (__int16)self->_has;
  if ((has & 2) == 0)
  {
LABEL_11:
    if ((has & 0x800) == 0)
      goto LABEL_12;
LABEL_28:
    v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", self->_transmissionMode));
    objc_msgSend(v3, "setObject:forKey:", v18, CFSTR("transmission_mode"));

    if ((*(_WORD *)&self->_has & 0x400) == 0)
      return v3;
    goto LABEL_13;
  }
LABEL_27:
  v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", self->_cdrxConfigStatus));
  objc_msgSend(v3, "setObject:forKey:", v17, CFSTR("cdrx_config_status"));

  has = (__int16)self->_has;
  if ((has & 0x800) != 0)
    goto LABEL_28;
LABEL_12:
  if ((has & 0x400) != 0)
  {
LABEL_13:
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", self->_subsId));
    objc_msgSend(v3, "setObject:forKey:", v5, CFSTR("subs_id"));

  }
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return sub_1000135D4((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  __int16 has;
  id v5;

  v5 = a3;
  has = (__int16)self->_has;
  if ((has & 1) != 0)
  {
    PBDataWriterWriteUint64Field(v5, self->_timestamp, 1);
    has = (__int16)self->_has;
    if ((has & 4) == 0)
    {
LABEL_3:
      if ((has & 0x80) == 0)
        goto LABEL_4;
      goto LABEL_17;
    }
  }
  else if ((has & 4) == 0)
  {
    goto LABEL_3;
  }
  PBDataWriterWriteUint32Field(v5, self->_cellStatus, 2);
  has = (__int16)self->_has;
  if ((has & 0x80) == 0)
  {
LABEL_4:
    if ((has & 8) == 0)
      goto LABEL_5;
    goto LABEL_18;
  }
LABEL_17:
  PBDataWriterWriteUint32Field(v5, self->_onDurationMs, 3);
  has = (__int16)self->_has;
  if ((has & 8) == 0)
  {
LABEL_5:
    if ((has & 0x10) == 0)
      goto LABEL_6;
    goto LABEL_19;
  }
LABEL_18:
  PBDataWriterWriteUint32Field(v5, self->_drxInactivityMs, 4);
  has = (__int16)self->_has;
  if ((has & 0x10) == 0)
  {
LABEL_6:
    if ((has & 0x40) == 0)
      goto LABEL_7;
    goto LABEL_20;
  }
LABEL_19:
  PBDataWriterWriteUint32Field(v5, self->_drxRetxTimerMs, 5);
  has = (__int16)self->_has;
  if ((has & 0x40) == 0)
  {
LABEL_7:
    if ((has & 0x200) == 0)
      goto LABEL_8;
    goto LABEL_21;
  }
LABEL_20:
  PBDataWriterWriteUint32Field(v5, self->_longDrxCycleMs, 7);
  has = (__int16)self->_has;
  if ((has & 0x200) == 0)
  {
LABEL_8:
    if ((has & 0x20) == 0)
      goto LABEL_9;
    goto LABEL_22;
  }
LABEL_21:
  PBDataWriterWriteUint32Field(v5, self->_shortDrxCycleMs, 10);
  has = (__int16)self->_has;
  if ((has & 0x20) == 0)
  {
LABEL_9:
    if ((has & 0x100) == 0)
      goto LABEL_10;
    goto LABEL_23;
  }
LABEL_22:
  PBDataWriterWriteUint32Field(v5, self->_drxShortCycleNum, 11);
  has = (__int16)self->_has;
  if ((has & 0x100) == 0)
  {
LABEL_10:
    if ((has & 2) == 0)
      goto LABEL_11;
    goto LABEL_24;
  }
LABEL_23:
  PBDataWriterWriteInt32Field(v5, self->_rrcState, 12);
  has = (__int16)self->_has;
  if ((has & 2) == 0)
  {
LABEL_11:
    if ((has & 0x800) == 0)
      goto LABEL_12;
LABEL_25:
    PBDataWriterWriteUint32Field(v5, self->_transmissionMode, 14);
    if ((*(_WORD *)&self->_has & 0x400) == 0)
      goto LABEL_14;
    goto LABEL_13;
  }
LABEL_24:
  PBDataWriterWriteUint32Field(v5, self->_cdrxConfigStatus, 13);
  has = (__int16)self->_has;
  if ((has & 0x800) != 0)
    goto LABEL_25;
LABEL_12:
  if ((has & 0x400) != 0)
LABEL_13:
    PBDataWriterWriteUint32Field(v5, self->_subsId, 15);
LABEL_14:

}

- (void)copyTo:(id)a3
{
  _QWORD *v4;
  __int16 has;

  v4 = a3;
  has = (__int16)self->_has;
  if ((has & 1) != 0)
  {
    v4[1] = self->_timestamp;
    *((_WORD *)v4 + 30) |= 1u;
    has = (__int16)self->_has;
    if ((has & 4) == 0)
    {
LABEL_3:
      if ((has & 0x80) == 0)
        goto LABEL_4;
      goto LABEL_17;
    }
  }
  else if ((has & 4) == 0)
  {
    goto LABEL_3;
  }
  *((_DWORD *)v4 + 5) = self->_cellStatus;
  *((_WORD *)v4 + 30) |= 4u;
  has = (__int16)self->_has;
  if ((has & 0x80) == 0)
  {
LABEL_4:
    if ((has & 8) == 0)
      goto LABEL_5;
    goto LABEL_18;
  }
LABEL_17:
  *((_DWORD *)v4 + 10) = self->_onDurationMs;
  *((_WORD *)v4 + 30) |= 0x80u;
  has = (__int16)self->_has;
  if ((has & 8) == 0)
  {
LABEL_5:
    if ((has & 0x10) == 0)
      goto LABEL_6;
    goto LABEL_19;
  }
LABEL_18:
  *((_DWORD *)v4 + 6) = self->_drxInactivityMs;
  *((_WORD *)v4 + 30) |= 8u;
  has = (__int16)self->_has;
  if ((has & 0x10) == 0)
  {
LABEL_6:
    if ((has & 0x40) == 0)
      goto LABEL_7;
    goto LABEL_20;
  }
LABEL_19:
  *((_DWORD *)v4 + 7) = self->_drxRetxTimerMs;
  *((_WORD *)v4 + 30) |= 0x10u;
  has = (__int16)self->_has;
  if ((has & 0x40) == 0)
  {
LABEL_7:
    if ((has & 0x200) == 0)
      goto LABEL_8;
    goto LABEL_21;
  }
LABEL_20:
  *((_DWORD *)v4 + 9) = self->_longDrxCycleMs;
  *((_WORD *)v4 + 30) |= 0x40u;
  has = (__int16)self->_has;
  if ((has & 0x200) == 0)
  {
LABEL_8:
    if ((has & 0x20) == 0)
      goto LABEL_9;
    goto LABEL_22;
  }
LABEL_21:
  *((_DWORD *)v4 + 12) = self->_shortDrxCycleMs;
  *((_WORD *)v4 + 30) |= 0x200u;
  has = (__int16)self->_has;
  if ((has & 0x20) == 0)
  {
LABEL_9:
    if ((has & 0x100) == 0)
      goto LABEL_10;
    goto LABEL_23;
  }
LABEL_22:
  *((_DWORD *)v4 + 8) = self->_drxShortCycleNum;
  *((_WORD *)v4 + 30) |= 0x20u;
  has = (__int16)self->_has;
  if ((has & 0x100) == 0)
  {
LABEL_10:
    if ((has & 2) == 0)
      goto LABEL_11;
    goto LABEL_24;
  }
LABEL_23:
  *((_DWORD *)v4 + 11) = self->_rrcState;
  *((_WORD *)v4 + 30) |= 0x100u;
  has = (__int16)self->_has;
  if ((has & 2) == 0)
  {
LABEL_11:
    if ((has & 0x800) == 0)
      goto LABEL_12;
LABEL_25:
    *((_DWORD *)v4 + 14) = self->_transmissionMode;
    *((_WORD *)v4 + 30) |= 0x800u;
    if ((*(_WORD *)&self->_has & 0x400) == 0)
      goto LABEL_14;
    goto LABEL_13;
  }
LABEL_24:
  *((_DWORD *)v4 + 4) = self->_cdrxConfigStatus;
  *((_WORD *)v4 + 30) |= 2u;
  has = (__int16)self->_has;
  if ((has & 0x800) != 0)
    goto LABEL_25;
LABEL_12:
  if ((has & 0x400) != 0)
  {
LABEL_13:
    *((_DWORD *)v4 + 13) = self->_subsId;
    *((_WORD *)v4 + 30) |= 0x400u;
  }
LABEL_14:

}

- (id)copyWithZone:(_NSZone *)a3
{
  id result;
  __int16 has;

  result = objc_msgSend(objc_msgSend((id)objc_opt_class(self, a2), "allocWithZone:", a3), "init");
  has = (__int16)self->_has;
  if ((has & 1) != 0)
  {
    *((_QWORD *)result + 1) = self->_timestamp;
    *((_WORD *)result + 30) |= 1u;
    has = (__int16)self->_has;
    if ((has & 4) == 0)
    {
LABEL_3:
      if ((has & 0x80) == 0)
        goto LABEL_4;
      goto LABEL_17;
    }
  }
  else if ((has & 4) == 0)
  {
    goto LABEL_3;
  }
  *((_DWORD *)result + 5) = self->_cellStatus;
  *((_WORD *)result + 30) |= 4u;
  has = (__int16)self->_has;
  if ((has & 0x80) == 0)
  {
LABEL_4:
    if ((has & 8) == 0)
      goto LABEL_5;
    goto LABEL_18;
  }
LABEL_17:
  *((_DWORD *)result + 10) = self->_onDurationMs;
  *((_WORD *)result + 30) |= 0x80u;
  has = (__int16)self->_has;
  if ((has & 8) == 0)
  {
LABEL_5:
    if ((has & 0x10) == 0)
      goto LABEL_6;
    goto LABEL_19;
  }
LABEL_18:
  *((_DWORD *)result + 6) = self->_drxInactivityMs;
  *((_WORD *)result + 30) |= 8u;
  has = (__int16)self->_has;
  if ((has & 0x10) == 0)
  {
LABEL_6:
    if ((has & 0x40) == 0)
      goto LABEL_7;
    goto LABEL_20;
  }
LABEL_19:
  *((_DWORD *)result + 7) = self->_drxRetxTimerMs;
  *((_WORD *)result + 30) |= 0x10u;
  has = (__int16)self->_has;
  if ((has & 0x40) == 0)
  {
LABEL_7:
    if ((has & 0x200) == 0)
      goto LABEL_8;
    goto LABEL_21;
  }
LABEL_20:
  *((_DWORD *)result + 9) = self->_longDrxCycleMs;
  *((_WORD *)result + 30) |= 0x40u;
  has = (__int16)self->_has;
  if ((has & 0x200) == 0)
  {
LABEL_8:
    if ((has & 0x20) == 0)
      goto LABEL_9;
    goto LABEL_22;
  }
LABEL_21:
  *((_DWORD *)result + 12) = self->_shortDrxCycleMs;
  *((_WORD *)result + 30) |= 0x200u;
  has = (__int16)self->_has;
  if ((has & 0x20) == 0)
  {
LABEL_9:
    if ((has & 0x100) == 0)
      goto LABEL_10;
    goto LABEL_23;
  }
LABEL_22:
  *((_DWORD *)result + 8) = self->_drxShortCycleNum;
  *((_WORD *)result + 30) |= 0x20u;
  has = (__int16)self->_has;
  if ((has & 0x100) == 0)
  {
LABEL_10:
    if ((has & 2) == 0)
      goto LABEL_11;
    goto LABEL_24;
  }
LABEL_23:
  *((_DWORD *)result + 11) = self->_rrcState;
  *((_WORD *)result + 30) |= 0x100u;
  has = (__int16)self->_has;
  if ((has & 2) == 0)
  {
LABEL_11:
    if ((has & 0x800) == 0)
      goto LABEL_12;
    goto LABEL_25;
  }
LABEL_24:
  *((_DWORD *)result + 4) = self->_cdrxConfigStatus;
  *((_WORD *)result + 30) |= 2u;
  has = (__int16)self->_has;
  if ((has & 0x800) == 0)
  {
LABEL_12:
    if ((has & 0x400) == 0)
      return result;
    goto LABEL_13;
  }
LABEL_25:
  *((_DWORD *)result + 14) = self->_transmissionMode;
  *((_WORD *)result + 30) |= 0x800u;
  if ((*(_WORD *)&self->_has & 0x400) == 0)
    return result;
LABEL_13:
  *((_DWORD *)result + 13) = self->_subsId;
  *((_WORD *)result + 30) |= 0x400u;
  return result;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  uint64_t v5;
  __int16 has;
  __int16 v7;
  BOOL v8;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class(self, v5)))
    goto LABEL_62;
  has = (__int16)self->_has;
  v7 = *((_WORD *)v4 + 30);
  if ((has & 1) != 0)
  {
    if ((v7 & 1) == 0 || self->_timestamp != *((_QWORD *)v4 + 1))
      goto LABEL_62;
  }
  else if ((v7 & 1) != 0)
  {
LABEL_62:
    v8 = 0;
    goto LABEL_63;
  }
  if ((has & 4) != 0)
  {
    if ((v7 & 4) == 0 || self->_cellStatus != *((_DWORD *)v4 + 5))
      goto LABEL_62;
  }
  else if ((v7 & 4) != 0)
  {
    goto LABEL_62;
  }
  if ((has & 0x80) != 0)
  {
    if ((v7 & 0x80) == 0 || self->_onDurationMs != *((_DWORD *)v4 + 10))
      goto LABEL_62;
  }
  else if ((v7 & 0x80) != 0)
  {
    goto LABEL_62;
  }
  if ((has & 8) != 0)
  {
    if ((v7 & 8) == 0 || self->_drxInactivityMs != *((_DWORD *)v4 + 6))
      goto LABEL_62;
  }
  else if ((v7 & 8) != 0)
  {
    goto LABEL_62;
  }
  if ((has & 0x10) != 0)
  {
    if ((v7 & 0x10) == 0 || self->_drxRetxTimerMs != *((_DWORD *)v4 + 7))
      goto LABEL_62;
  }
  else if ((v7 & 0x10) != 0)
  {
    goto LABEL_62;
  }
  if ((has & 0x40) != 0)
  {
    if ((v7 & 0x40) == 0 || self->_longDrxCycleMs != *((_DWORD *)v4 + 9))
      goto LABEL_62;
  }
  else if ((v7 & 0x40) != 0)
  {
    goto LABEL_62;
  }
  if ((*(_WORD *)&self->_has & 0x200) != 0)
  {
    if ((*((_WORD *)v4 + 30) & 0x200) == 0 || self->_shortDrxCycleMs != *((_DWORD *)v4 + 12))
      goto LABEL_62;
  }
  else if ((*((_WORD *)v4 + 30) & 0x200) != 0)
  {
    goto LABEL_62;
  }
  if ((has & 0x20) != 0)
  {
    if ((v7 & 0x20) == 0 || self->_drxShortCycleNum != *((_DWORD *)v4 + 8))
      goto LABEL_62;
  }
  else if ((v7 & 0x20) != 0)
  {
    goto LABEL_62;
  }
  if ((*(_WORD *)&self->_has & 0x100) != 0)
  {
    if ((*((_WORD *)v4 + 30) & 0x100) == 0 || self->_rrcState != *((_DWORD *)v4 + 11))
      goto LABEL_62;
  }
  else if ((*((_WORD *)v4 + 30) & 0x100) != 0)
  {
    goto LABEL_62;
  }
  if ((has & 2) != 0)
  {
    if ((v7 & 2) == 0 || self->_cdrxConfigStatus != *((_DWORD *)v4 + 4))
      goto LABEL_62;
  }
  else if ((v7 & 2) != 0)
  {
    goto LABEL_62;
  }
  if ((*(_WORD *)&self->_has & 0x800) != 0)
  {
    if ((*((_WORD *)v4 + 30) & 0x800) == 0 || self->_transmissionMode != *((_DWORD *)v4 + 14))
      goto LABEL_62;
  }
  else if ((*((_WORD *)v4 + 30) & 0x800) != 0)
  {
    goto LABEL_62;
  }
  if ((*(_WORD *)&self->_has & 0x400) != 0)
  {
    if ((*((_WORD *)v4 + 30) & 0x400) == 0 || self->_subsId != *((_DWORD *)v4 + 13))
      goto LABEL_62;
    v8 = 1;
  }
  else
  {
    v8 = (v7 & 0x400) == 0;
  }
LABEL_63:

  return v8;
}

- (unint64_t)hash
{
  __int16 has;
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

  has = (__int16)self->_has;
  if ((has & 1) != 0)
  {
    v3 = 2654435761u * self->_timestamp;
    if ((has & 4) != 0)
    {
LABEL_3:
      v4 = 2654435761 * self->_cellStatus;
      if ((has & 0x80) != 0)
        goto LABEL_4;
      goto LABEL_16;
    }
  }
  else
  {
    v3 = 0;
    if ((has & 4) != 0)
      goto LABEL_3;
  }
  v4 = 0;
  if ((has & 0x80) != 0)
  {
LABEL_4:
    v5 = 2654435761 * self->_onDurationMs;
    if ((has & 8) != 0)
      goto LABEL_5;
    goto LABEL_17;
  }
LABEL_16:
  v5 = 0;
  if ((has & 8) != 0)
  {
LABEL_5:
    v6 = 2654435761 * self->_drxInactivityMs;
    if ((has & 0x10) != 0)
      goto LABEL_6;
    goto LABEL_18;
  }
LABEL_17:
  v6 = 0;
  if ((has & 0x10) != 0)
  {
LABEL_6:
    v7 = 2654435761 * self->_drxRetxTimerMs;
    if ((has & 0x40) != 0)
      goto LABEL_7;
    goto LABEL_19;
  }
LABEL_18:
  v7 = 0;
  if ((has & 0x40) != 0)
  {
LABEL_7:
    v8 = 2654435761 * self->_longDrxCycleMs;
    if ((*(_WORD *)&self->_has & 0x200) != 0)
      goto LABEL_8;
    goto LABEL_20;
  }
LABEL_19:
  v8 = 0;
  if ((*(_WORD *)&self->_has & 0x200) != 0)
  {
LABEL_8:
    v9 = 2654435761 * self->_shortDrxCycleMs;
    if ((has & 0x20) != 0)
      goto LABEL_9;
    goto LABEL_21;
  }
LABEL_20:
  v9 = 0;
  if ((has & 0x20) != 0)
  {
LABEL_9:
    v10 = 2654435761 * self->_drxShortCycleNum;
    if ((*(_WORD *)&self->_has & 0x100) != 0)
      goto LABEL_10;
    goto LABEL_22;
  }
LABEL_21:
  v10 = 0;
  if ((*(_WORD *)&self->_has & 0x100) != 0)
  {
LABEL_10:
    v11 = 2654435761 * self->_rrcState;
    if ((has & 2) != 0)
      goto LABEL_11;
    goto LABEL_23;
  }
LABEL_22:
  v11 = 0;
  if ((has & 2) != 0)
  {
LABEL_11:
    v12 = 2654435761 * self->_cdrxConfigStatus;
    if ((*(_WORD *)&self->_has & 0x800) != 0)
      goto LABEL_12;
LABEL_24:
    v13 = 0;
    if ((*(_WORD *)&self->_has & 0x400) != 0)
      goto LABEL_13;
LABEL_25:
    v14 = 0;
    return v4 ^ v3 ^ v5 ^ v6 ^ v7 ^ v8 ^ v9 ^ v10 ^ v11 ^ v12 ^ v13 ^ v14;
  }
LABEL_23:
  v12 = 0;
  if ((*(_WORD *)&self->_has & 0x800) == 0)
    goto LABEL_24;
LABEL_12:
  v13 = 2654435761 * self->_transmissionMode;
  if ((*(_WORD *)&self->_has & 0x400) == 0)
    goto LABEL_25;
LABEL_13:
  v14 = 2654435761 * self->_subsId;
  return v4 ^ v3 ^ v5 ^ v6 ^ v7 ^ v8 ^ v9 ^ v10 ^ v11 ^ v12 ^ v13 ^ v14;
}

- (void)mergeFrom:(id)a3
{
  id v4;
  __int16 v5;

  v4 = a3;
  v5 = *((_WORD *)v4 + 30);
  if ((v5 & 1) != 0)
  {
    self->_timestamp = *((_QWORD *)v4 + 1);
    *(_WORD *)&self->_has |= 1u;
    v5 = *((_WORD *)v4 + 30);
    if ((v5 & 4) == 0)
    {
LABEL_3:
      if ((v5 & 0x80) == 0)
        goto LABEL_4;
      goto LABEL_17;
    }
  }
  else if ((v5 & 4) == 0)
  {
    goto LABEL_3;
  }
  self->_cellStatus = *((_DWORD *)v4 + 5);
  *(_WORD *)&self->_has |= 4u;
  v5 = *((_WORD *)v4 + 30);
  if ((v5 & 0x80) == 0)
  {
LABEL_4:
    if ((v5 & 8) == 0)
      goto LABEL_5;
    goto LABEL_18;
  }
LABEL_17:
  self->_onDurationMs = *((_DWORD *)v4 + 10);
  *(_WORD *)&self->_has |= 0x80u;
  v5 = *((_WORD *)v4 + 30);
  if ((v5 & 8) == 0)
  {
LABEL_5:
    if ((v5 & 0x10) == 0)
      goto LABEL_6;
    goto LABEL_19;
  }
LABEL_18:
  self->_drxInactivityMs = *((_DWORD *)v4 + 6);
  *(_WORD *)&self->_has |= 8u;
  v5 = *((_WORD *)v4 + 30);
  if ((v5 & 0x10) == 0)
  {
LABEL_6:
    if ((v5 & 0x40) == 0)
      goto LABEL_7;
    goto LABEL_20;
  }
LABEL_19:
  self->_drxRetxTimerMs = *((_DWORD *)v4 + 7);
  *(_WORD *)&self->_has |= 0x10u;
  v5 = *((_WORD *)v4 + 30);
  if ((v5 & 0x40) == 0)
  {
LABEL_7:
    if ((v5 & 0x200) == 0)
      goto LABEL_8;
    goto LABEL_21;
  }
LABEL_20:
  self->_longDrxCycleMs = *((_DWORD *)v4 + 9);
  *(_WORD *)&self->_has |= 0x40u;
  v5 = *((_WORD *)v4 + 30);
  if ((v5 & 0x200) == 0)
  {
LABEL_8:
    if ((v5 & 0x20) == 0)
      goto LABEL_9;
    goto LABEL_22;
  }
LABEL_21:
  self->_shortDrxCycleMs = *((_DWORD *)v4 + 12);
  *(_WORD *)&self->_has |= 0x200u;
  v5 = *((_WORD *)v4 + 30);
  if ((v5 & 0x20) == 0)
  {
LABEL_9:
    if ((v5 & 0x100) == 0)
      goto LABEL_10;
    goto LABEL_23;
  }
LABEL_22:
  self->_drxShortCycleNum = *((_DWORD *)v4 + 8);
  *(_WORD *)&self->_has |= 0x20u;
  v5 = *((_WORD *)v4 + 30);
  if ((v5 & 0x100) == 0)
  {
LABEL_10:
    if ((v5 & 2) == 0)
      goto LABEL_11;
    goto LABEL_24;
  }
LABEL_23:
  self->_rrcState = *((_DWORD *)v4 + 11);
  *(_WORD *)&self->_has |= 0x100u;
  v5 = *((_WORD *)v4 + 30);
  if ((v5 & 2) == 0)
  {
LABEL_11:
    if ((v5 & 0x800) == 0)
      goto LABEL_12;
LABEL_25:
    self->_transmissionMode = *((_DWORD *)v4 + 14);
    *(_WORD *)&self->_has |= 0x800u;
    if ((*((_WORD *)v4 + 30) & 0x400) == 0)
      goto LABEL_14;
    goto LABEL_13;
  }
LABEL_24:
  self->_cdrxConfigStatus = *((_DWORD *)v4 + 4);
  *(_WORD *)&self->_has |= 2u;
  v5 = *((_WORD *)v4 + 30);
  if ((v5 & 0x800) != 0)
    goto LABEL_25;
LABEL_12:
  if ((v5 & 0x400) != 0)
  {
LABEL_13:
    self->_subsId = *((_DWORD *)v4 + 13);
    *(_WORD *)&self->_has |= 0x400u;
  }
LABEL_14:

}

- (unint64_t)timestamp
{
  return self->_timestamp;
}

- (unsigned)cellStatus
{
  return self->_cellStatus;
}

- (unsigned)onDurationMs
{
  return self->_onDurationMs;
}

- (unsigned)drxInactivityMs
{
  return self->_drxInactivityMs;
}

- (unsigned)drxRetxTimerMs
{
  return self->_drxRetxTimerMs;
}

- (unsigned)longDrxCycleMs
{
  return self->_longDrxCycleMs;
}

- (unsigned)shortDrxCycleMs
{
  return self->_shortDrxCycleMs;
}

- (unsigned)drxShortCycleNum
{
  return self->_drxShortCycleNum;
}

- (unsigned)cdrxConfigStatus
{
  return self->_cdrxConfigStatus;
}

- (unsigned)transmissionMode
{
  return self->_transmissionMode;
}

- (unsigned)subsId
{
  return self->_subsId;
}

@end
