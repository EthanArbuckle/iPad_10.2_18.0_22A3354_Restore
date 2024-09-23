@implementation CellularNrScgRemoval

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

- (void)setReason:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 0x80u;
  self->_reason = a3;
}

- (void)setHasReason:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 128;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFF7F | v3;
}

- (BOOL)hasReason
{
  return (*(_WORD *)&self->_has >> 7) & 1;
}

- (void)setResult:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 0x100u;
  self->_result = a3;
}

- (void)setHasResult:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 256;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFEFF | v3;
}

- (BOOL)hasResult
{
  return HIBYTE(*(_WORD *)&self->_has) & 1;
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

- (void)setNumBeamFailure:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 8u;
  self->_numBeamFailure = a3;
}

- (void)setHasNumBeamFailure:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 8;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFF7 | v3;
}

- (BOOL)hasNumBeamFailure
{
  return (*(_WORD *)&self->_has >> 3) & 1;
}

- (void)setNumBeamRecovery:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 0x10u;
  self->_numBeamRecovery = a3;
}

- (void)setHasNumBeamRecovery:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 16;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFEF | v3;
}

- (BOOL)hasNumBeamRecovery
{
  return (*(_WORD *)&self->_has >> 4) & 1;
}

- (void)setRxBeamSwitch:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 0x200u;
  self->_rxBeamSwitch = a3;
}

- (void)setHasRxBeamSwitch:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 512;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFDFF | v3;
}

- (BOOL)hasRxBeamSwitch
{
  return (*(_WORD *)&self->_has >> 9) & 1;
}

- (void)setTxBeamSwitch:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 0x1000u;
  self->_txBeamSwitch = a3;
}

- (void)setHasTxBeamSwitch:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 4096;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xEFFF | v3;
}

- (BOOL)hasTxBeamSwitch
{
  return (*(_WORD *)&self->_has >> 12) & 1;
}

- (void)setBandInd:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 2u;
  self->_bandInd = a3;
}

- (void)setHasBandInd:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFFD | v3;
}

- (BOOL)hasBandInd
{
  return (*(_WORD *)&self->_has >> 1) & 1;
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

- (void)setNumSubs:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 0x20u;
  self->_numSubs = a3;
}

- (void)setHasNumSubs:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 32;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFDF | v3;
}

- (BOOL)hasNumSubs
{
  return (*(_WORD *)&self->_has >> 5) & 1;
}

- (void)setPsPref:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 0x40u;
  self->_psPref = a3;
}

- (void)setHasPsPref:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 64;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFBF | v3;
}

- (BOOL)hasPsPref
{
  return (*(_WORD *)&self->_has >> 6) & 1;
}

- (BOOL)hasPlmn
{
  return self->_plmn != 0;
}

- (void)setIsDueToSdm:(BOOL)a3
{
  *(_WORD *)&self->_has |= 0x2000u;
  self->_isDueToSdm = a3;
}

- (void)setHasIsDueToSdm:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 0x2000;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xDFFF | v3;
}

- (BOOL)hasIsDueToSdm
{
  return (*(_WORD *)&self->_has >> 13) & 1;
}

- (int)sdmTriggerCause
{
  if ((*(_WORD *)&self->_has & 0x400) != 0)
    return self->_sdmTriggerCause;
  else
    return 0;
}

- (void)setSdmTriggerCause:(int)a3
{
  *(_WORD *)&self->_has |= 0x400u;
  self->_sdmTriggerCause = a3;
}

- (void)setHasSdmTriggerCause:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 1024;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFBFF | v3;
}

- (BOOL)hasSdmTriggerCause
{
  return (*(_WORD *)&self->_has >> 10) & 1;
}

- (id)sdmTriggerCauseAsString:(int)a3
{
  if (a3 >= 0xC)
    return (id)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("(unknown: %i)"), *(_QWORD *)&a3));
  else
    return off_10025E758[a3];
}

- (int)StringAsSdmTriggerCause:(id)a3
{
  id v3;
  int v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("SDM_TRIGGER_CAUSE_NONE")) & 1) != 0)
  {
    v4 = 0;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("SDM_TRIGGER_CAUSE_AP_SLEEP")) & 1) != 0)
  {
    v4 = 1;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("SDM_TRIGGER_CAUSE_CELLULAR_DATA")) & 1) != 0)
  {
    v4 = 2;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("SDM_TRIGGER_CAUSE_WIFI_POOR")) & 1) != 0)
  {
    v4 = 3;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("SDM_TRIGGER_CAUSE_VOIP_CALL")) & 1) != 0)
  {
    v4 = 4;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("SDM_TRIGGER_CAUSE_COREMEDIA_STALL")) & 1) != 0)
  {
    v4 = 5;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("SDM_TRIGGER_CAUSE_SCREEN_STATUS")) & 1) != 0)
  {
    v4 = 6;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("SDM_TRIGGER_CAUSE_SYMPTOMS_RECOMM")) & 1) != 0)
  {
    v4 = 7;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("SDM_TRIGGER_CAUSE_UI_SWITCH")) & 1) != 0)
  {
    v4 = 8;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("SDM_TRIGGER_CAUSE_RLGS")) & 1) != 0)
  {
    v4 = 9;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("SDM_TRIGGER_CAUSE_PHS")) & 1) != 0)
  {
    v4 = 10;
  }
  else if (objc_msgSend(v3, "isEqualToString:", CFSTR("SDM_TRIGGER_CAUSE_MAX")))
  {
    v4 = 11;
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
  v8.super_class = (Class)CellularNrScgRemoval;
  v3 = -[CellularNrScgRemoval description](&v8, "description");
  v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[CellularNrScgRemoval dictionaryRepresentation](self, "dictionaryRepresentation"));
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
  uint64_t sdmTriggerCause;
  __CFString *v10;
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

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary"));
  has = (__int16)self->_has;
  if ((has & 1) != 0)
  {
    v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedLongLong:](NSNumber, "numberWithUnsignedLongLong:", self->_timestamp));
    objc_msgSend(v3, "setObject:forKey:", v11, CFSTR("timestamp"));

    has = (__int16)self->_has;
    if ((has & 0x80) == 0)
    {
LABEL_3:
      if ((has & 0x100) == 0)
        goto LABEL_4;
      goto LABEL_23;
    }
  }
  else if ((has & 0x80) == 0)
  {
    goto LABEL_3;
  }
  v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", self->_reason));
  objc_msgSend(v3, "setObject:forKey:", v12, CFSTR("reason"));

  has = (__int16)self->_has;
  if ((has & 0x100) == 0)
  {
LABEL_4:
    if ((has & 4) == 0)
      goto LABEL_5;
    goto LABEL_24;
  }
LABEL_23:
  v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", self->_result));
  objc_msgSend(v3, "setObject:forKey:", v13, CFSTR("result"));

  has = (__int16)self->_has;
  if ((has & 4) == 0)
  {
LABEL_5:
    if ((has & 8) == 0)
      goto LABEL_6;
    goto LABEL_25;
  }
LABEL_24:
  v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", self->_duration));
  objc_msgSend(v3, "setObject:forKey:", v14, CFSTR("duration"));

  has = (__int16)self->_has;
  if ((has & 8) == 0)
  {
LABEL_6:
    if ((has & 0x10) == 0)
      goto LABEL_7;
    goto LABEL_26;
  }
LABEL_25:
  v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", self->_numBeamFailure));
  objc_msgSend(v3, "setObject:forKey:", v15, CFSTR("num_beam_failure"));

  has = (__int16)self->_has;
  if ((has & 0x10) == 0)
  {
LABEL_7:
    if ((has & 0x200) == 0)
      goto LABEL_8;
    goto LABEL_27;
  }
LABEL_26:
  v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", self->_numBeamRecovery));
  objc_msgSend(v3, "setObject:forKey:", v16, CFSTR("num_beam_recovery"));

  has = (__int16)self->_has;
  if ((has & 0x200) == 0)
  {
LABEL_8:
    if ((has & 0x1000) == 0)
      goto LABEL_9;
    goto LABEL_28;
  }
LABEL_27:
  v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", self->_rxBeamSwitch));
  objc_msgSend(v3, "setObject:forKey:", v17, CFSTR("rx_beam_switch"));

  has = (__int16)self->_has;
  if ((has & 0x1000) == 0)
  {
LABEL_9:
    if ((has & 2) == 0)
      goto LABEL_10;
    goto LABEL_29;
  }
LABEL_28:
  v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", self->_txBeamSwitch));
  objc_msgSend(v3, "setObject:forKey:", v18, CFSTR("tx_beam_switch"));

  has = (__int16)self->_has;
  if ((has & 2) == 0)
  {
LABEL_10:
    if ((has & 0x800) == 0)
      goto LABEL_11;
    goto LABEL_30;
  }
LABEL_29:
  v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", self->_bandInd));
  objc_msgSend(v3, "setObject:forKey:", v19, CFSTR("band_ind"));

  has = (__int16)self->_has;
  if ((has & 0x800) == 0)
  {
LABEL_11:
    if ((has & 0x20) == 0)
      goto LABEL_12;
    goto LABEL_31;
  }
LABEL_30:
  v20 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", self->_subsId));
  objc_msgSend(v3, "setObject:forKey:", v20, CFSTR("subs_id"));

  has = (__int16)self->_has;
  if ((has & 0x20) == 0)
  {
LABEL_12:
    if ((has & 0x40) == 0)
      goto LABEL_14;
    goto LABEL_13;
  }
LABEL_31:
  v21 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", self->_numSubs));
  objc_msgSend(v3, "setObject:forKey:", v21, CFSTR("num_subs"));

  if ((*(_WORD *)&self->_has & 0x40) != 0)
  {
LABEL_13:
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", self->_psPref));
    objc_msgSend(v3, "setObject:forKey:", v5, CFSTR("ps_pref"));

  }
LABEL_14:
  plmn = self->_plmn;
  if (plmn)
    objc_msgSend(v3, "setObject:forKey:", plmn, CFSTR("plmn"));
  v7 = (__int16)self->_has;
  if ((v7 & 0x2000) != 0)
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", self->_isDueToSdm));
    objc_msgSend(v3, "setObject:forKey:", v8, CFSTR("is_due_to_sdm"));

    v7 = (__int16)self->_has;
  }
  if ((v7 & 0x400) != 0)
  {
    sdmTriggerCause = self->_sdmTriggerCause;
    if (sdmTriggerCause >= 0xC)
      v10 = (__CFString *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("(unknown: %i)"), self->_sdmTriggerCause));
    else
      v10 = off_10025E758[sdmTriggerCause];
    objc_msgSend(v3, "setObject:forKey:", v10, CFSTR("sdm_trigger_cause"));

  }
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return sub_1000158BC((uint64_t)self, (uint64_t)a3);
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
    if ((has & 0x80) == 0)
    {
LABEL_3:
      if ((has & 0x100) == 0)
        goto LABEL_4;
      goto LABEL_22;
    }
  }
  else if ((has & 0x80) == 0)
  {
    goto LABEL_3;
  }
  PBDataWriterWriteUint32Field(v7, self->_reason, 3);
  has = (__int16)self->_has;
  if ((has & 0x100) == 0)
  {
LABEL_4:
    if ((has & 4) == 0)
      goto LABEL_5;
    goto LABEL_23;
  }
LABEL_22:
  PBDataWriterWriteUint32Field(v7, self->_result, 4);
  has = (__int16)self->_has;
  if ((has & 4) == 0)
  {
LABEL_5:
    if ((has & 8) == 0)
      goto LABEL_6;
    goto LABEL_24;
  }
LABEL_23:
  PBDataWriterWriteUint32Field(v7, self->_duration, 5);
  has = (__int16)self->_has;
  if ((has & 8) == 0)
  {
LABEL_6:
    if ((has & 0x10) == 0)
      goto LABEL_7;
    goto LABEL_25;
  }
LABEL_24:
  PBDataWriterWriteUint32Field(v7, self->_numBeamFailure, 6);
  has = (__int16)self->_has;
  if ((has & 0x10) == 0)
  {
LABEL_7:
    if ((has & 0x200) == 0)
      goto LABEL_8;
    goto LABEL_26;
  }
LABEL_25:
  PBDataWriterWriteUint32Field(v7, self->_numBeamRecovery, 7);
  has = (__int16)self->_has;
  if ((has & 0x200) == 0)
  {
LABEL_8:
    if ((has & 0x1000) == 0)
      goto LABEL_9;
    goto LABEL_27;
  }
LABEL_26:
  PBDataWriterWriteUint32Field(v7, self->_rxBeamSwitch, 8);
  has = (__int16)self->_has;
  if ((has & 0x1000) == 0)
  {
LABEL_9:
    if ((has & 2) == 0)
      goto LABEL_10;
    goto LABEL_28;
  }
LABEL_27:
  PBDataWriterWriteUint32Field(v7, self->_txBeamSwitch, 9);
  has = (__int16)self->_has;
  if ((has & 2) == 0)
  {
LABEL_10:
    if ((has & 0x20) == 0)
      goto LABEL_11;
    goto LABEL_29;
  }
LABEL_28:
  PBDataWriterWriteUint32Field(v7, self->_bandInd, 10);
  has = (__int16)self->_has;
  if ((has & 0x20) == 0)
  {
LABEL_11:
    if ((has & 0x40) == 0)
      goto LABEL_13;
    goto LABEL_12;
  }
LABEL_29:
  PBDataWriterWriteUint32Field(v7, self->_numSubs, 12);
  if ((*(_WORD *)&self->_has & 0x40) != 0)
LABEL_12:
    PBDataWriterWriteUint32Field(v7, self->_psPref, 13);
LABEL_13:
  plmn = self->_plmn;
  if (plmn)
    PBDataWriterWriteDataField(v7, plmn, 14);
  v6 = (__int16)self->_has;
  if ((v6 & 0x800) == 0)
  {
    if ((*(_WORD *)&self->_has & 0x2000) == 0)
      goto LABEL_17;
LABEL_32:
    PBDataWriterWriteBOOLField(v7, self->_isDueToSdm, 16);
    if ((*(_WORD *)&self->_has & 0x400) == 0)
      goto LABEL_19;
    goto LABEL_18;
  }
  PBDataWriterWriteUint32Field(v7, self->_subsId, 15);
  v6 = (__int16)self->_has;
  if ((v6 & 0x2000) != 0)
    goto LABEL_32;
LABEL_17:
  if ((v6 & 0x400) != 0)
LABEL_18:
    PBDataWriterWriteInt32Field(v7, self->_sdmTriggerCause, 17);
LABEL_19:

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
      if ((has & 0x100) == 0)
        goto LABEL_4;
      goto LABEL_22;
    }
  }
  else if ((has & 0x80) == 0)
  {
    goto LABEL_3;
  }
  *((_DWORD *)v4 + 13) = self->_reason;
  *((_WORD *)v4 + 40) |= 0x80u;
  has = (__int16)self->_has;
  if ((has & 0x100) == 0)
  {
LABEL_4:
    if ((has & 4) == 0)
      goto LABEL_5;
    goto LABEL_23;
  }
LABEL_22:
  *((_DWORD *)v4 + 14) = self->_result;
  *((_WORD *)v4 + 40) |= 0x100u;
  has = (__int16)self->_has;
  if ((has & 4) == 0)
  {
LABEL_5:
    if ((has & 8) == 0)
      goto LABEL_6;
    goto LABEL_24;
  }
LABEL_23:
  *((_DWORD *)v4 + 5) = self->_duration;
  *((_WORD *)v4 + 40) |= 4u;
  has = (__int16)self->_has;
  if ((has & 8) == 0)
  {
LABEL_6:
    if ((has & 0x10) == 0)
      goto LABEL_7;
    goto LABEL_25;
  }
LABEL_24:
  *((_DWORD *)v4 + 6) = self->_numBeamFailure;
  *((_WORD *)v4 + 40) |= 8u;
  has = (__int16)self->_has;
  if ((has & 0x10) == 0)
  {
LABEL_7:
    if ((has & 0x200) == 0)
      goto LABEL_8;
    goto LABEL_26;
  }
LABEL_25:
  *((_DWORD *)v4 + 7) = self->_numBeamRecovery;
  *((_WORD *)v4 + 40) |= 0x10u;
  has = (__int16)self->_has;
  if ((has & 0x200) == 0)
  {
LABEL_8:
    if ((has & 0x1000) == 0)
      goto LABEL_9;
    goto LABEL_27;
  }
LABEL_26:
  *((_DWORD *)v4 + 15) = self->_rxBeamSwitch;
  *((_WORD *)v4 + 40) |= 0x200u;
  has = (__int16)self->_has;
  if ((has & 0x1000) == 0)
  {
LABEL_9:
    if ((has & 2) == 0)
      goto LABEL_10;
    goto LABEL_28;
  }
LABEL_27:
  *((_DWORD *)v4 + 18) = self->_txBeamSwitch;
  *((_WORD *)v4 + 40) |= 0x1000u;
  has = (__int16)self->_has;
  if ((has & 2) == 0)
  {
LABEL_10:
    if ((has & 0x20) == 0)
      goto LABEL_11;
    goto LABEL_29;
  }
LABEL_28:
  *((_DWORD *)v4 + 4) = self->_bandInd;
  *((_WORD *)v4 + 40) |= 2u;
  has = (__int16)self->_has;
  if ((has & 0x20) == 0)
  {
LABEL_11:
    if ((has & 0x40) == 0)
      goto LABEL_13;
    goto LABEL_12;
  }
LABEL_29:
  *((_DWORD *)v4 + 8) = self->_numSubs;
  *((_WORD *)v4 + 40) |= 0x20u;
  if ((*(_WORD *)&self->_has & 0x40) != 0)
  {
LABEL_12:
    *((_DWORD *)v4 + 12) = self->_psPref;
    *((_WORD *)v4 + 40) |= 0x40u;
  }
LABEL_13:
  if (self->_plmn)
  {
    v7 = v4;
    objc_msgSend(v4, "setPlmn:");
    v4 = v7;
  }
  v6 = (__int16)self->_has;
  if ((v6 & 0x800) == 0)
  {
    if ((*(_WORD *)&self->_has & 0x2000) == 0)
      goto LABEL_17;
LABEL_32:
    *((_BYTE *)v4 + 76) = self->_isDueToSdm;
    *((_WORD *)v4 + 40) |= 0x2000u;
    if ((*(_WORD *)&self->_has & 0x400) == 0)
      goto LABEL_19;
    goto LABEL_18;
  }
  *((_DWORD *)v4 + 17) = self->_subsId;
  *((_WORD *)v4 + 40) |= 0x800u;
  v6 = (__int16)self->_has;
  if ((v6 & 0x2000) != 0)
    goto LABEL_32;
LABEL_17:
  if ((v6 & 0x400) != 0)
  {
LABEL_18:
    *((_DWORD *)v4 + 16) = self->_sdmTriggerCause;
    *((_WORD *)v4 + 40) |= 0x400u;
  }
LABEL_19:

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
      if ((has & 0x100) == 0)
        goto LABEL_4;
      goto LABEL_20;
    }
  }
  else if ((has & 0x80) == 0)
  {
    goto LABEL_3;
  }
  *((_DWORD *)v5 + 13) = self->_reason;
  *((_WORD *)v5 + 40) |= 0x80u;
  has = (__int16)self->_has;
  if ((has & 0x100) == 0)
  {
LABEL_4:
    if ((has & 4) == 0)
      goto LABEL_5;
    goto LABEL_21;
  }
LABEL_20:
  *((_DWORD *)v5 + 14) = self->_result;
  *((_WORD *)v5 + 40) |= 0x100u;
  has = (__int16)self->_has;
  if ((has & 4) == 0)
  {
LABEL_5:
    if ((has & 8) == 0)
      goto LABEL_6;
    goto LABEL_22;
  }
LABEL_21:
  *((_DWORD *)v5 + 5) = self->_duration;
  *((_WORD *)v5 + 40) |= 4u;
  has = (__int16)self->_has;
  if ((has & 8) == 0)
  {
LABEL_6:
    if ((has & 0x10) == 0)
      goto LABEL_7;
    goto LABEL_23;
  }
LABEL_22:
  *((_DWORD *)v5 + 6) = self->_numBeamFailure;
  *((_WORD *)v5 + 40) |= 8u;
  has = (__int16)self->_has;
  if ((has & 0x10) == 0)
  {
LABEL_7:
    if ((has & 0x200) == 0)
      goto LABEL_8;
    goto LABEL_24;
  }
LABEL_23:
  *((_DWORD *)v5 + 7) = self->_numBeamRecovery;
  *((_WORD *)v5 + 40) |= 0x10u;
  has = (__int16)self->_has;
  if ((has & 0x200) == 0)
  {
LABEL_8:
    if ((has & 0x1000) == 0)
      goto LABEL_9;
    goto LABEL_25;
  }
LABEL_24:
  *((_DWORD *)v5 + 15) = self->_rxBeamSwitch;
  *((_WORD *)v5 + 40) |= 0x200u;
  has = (__int16)self->_has;
  if ((has & 0x1000) == 0)
  {
LABEL_9:
    if ((has & 2) == 0)
      goto LABEL_10;
    goto LABEL_26;
  }
LABEL_25:
  *((_DWORD *)v5 + 18) = self->_txBeamSwitch;
  *((_WORD *)v5 + 40) |= 0x1000u;
  has = (__int16)self->_has;
  if ((has & 2) == 0)
  {
LABEL_10:
    if ((has & 0x20) == 0)
      goto LABEL_11;
    goto LABEL_27;
  }
LABEL_26:
  *((_DWORD *)v5 + 4) = self->_bandInd;
  *((_WORD *)v5 + 40) |= 2u;
  has = (__int16)self->_has;
  if ((has & 0x20) == 0)
  {
LABEL_11:
    if ((has & 0x40) == 0)
      goto LABEL_13;
    goto LABEL_12;
  }
LABEL_27:
  *((_DWORD *)v5 + 8) = self->_numSubs;
  *((_WORD *)v5 + 40) |= 0x20u;
  if ((*(_WORD *)&self->_has & 0x40) != 0)
  {
LABEL_12:
    *((_DWORD *)v5 + 12) = self->_psPref;
    *((_WORD *)v5 + 40) |= 0x40u;
  }
LABEL_13:
  v8 = -[NSData copyWithZone:](self->_plmn, "copyWithZone:", a3);
  v9 = (void *)v6[5];
  v6[5] = v8;

  v10 = (__int16)self->_has;
  if ((v10 & 0x800) == 0)
  {
    if ((*(_WORD *)&self->_has & 0x2000) == 0)
      goto LABEL_15;
LABEL_30:
    *((_BYTE *)v6 + 76) = self->_isDueToSdm;
    *((_WORD *)v6 + 40) |= 0x2000u;
    if ((*(_WORD *)&self->_has & 0x400) == 0)
      return v6;
    goto LABEL_16;
  }
  *((_DWORD *)v6 + 17) = self->_subsId;
  *((_WORD *)v6 + 40) |= 0x800u;
  v10 = (__int16)self->_has;
  if ((v10 & 0x2000) != 0)
    goto LABEL_30;
LABEL_15:
  if ((v10 & 0x400) != 0)
  {
LABEL_16:
    *((_DWORD *)v6 + 16) = self->_sdmTriggerCause;
    *((_WORD *)v6 + 40) |= 0x400u;
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
  BOOL v9;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class(self, v5)))
    goto LABEL_78;
  has = (__int16)self->_has;
  v7 = *((_WORD *)v4 + 40);
  if ((has & 1) != 0)
  {
    if ((v7 & 1) == 0 || self->_timestamp != *((_QWORD *)v4 + 1))
      goto LABEL_78;
  }
  else if ((v7 & 1) != 0)
  {
    goto LABEL_78;
  }
  if ((has & 0x80) != 0)
  {
    if ((v7 & 0x80) == 0 || self->_reason != *((_DWORD *)v4 + 13))
      goto LABEL_78;
  }
  else if ((v7 & 0x80) != 0)
  {
    goto LABEL_78;
  }
  if ((*(_WORD *)&self->_has & 0x100) != 0)
  {
    if ((*((_WORD *)v4 + 40) & 0x100) == 0 || self->_result != *((_DWORD *)v4 + 14))
      goto LABEL_78;
  }
  else if ((*((_WORD *)v4 + 40) & 0x100) != 0)
  {
    goto LABEL_78;
  }
  if ((has & 4) != 0)
  {
    if ((v7 & 4) == 0 || self->_duration != *((_DWORD *)v4 + 5))
      goto LABEL_78;
  }
  else if ((v7 & 4) != 0)
  {
    goto LABEL_78;
  }
  if ((has & 8) != 0)
  {
    if ((v7 & 8) == 0 || self->_numBeamFailure != *((_DWORD *)v4 + 6))
      goto LABEL_78;
  }
  else if ((v7 & 8) != 0)
  {
    goto LABEL_78;
  }
  if ((has & 0x10) != 0)
  {
    if ((v7 & 0x10) == 0 || self->_numBeamRecovery != *((_DWORD *)v4 + 7))
      goto LABEL_78;
  }
  else if ((v7 & 0x10) != 0)
  {
    goto LABEL_78;
  }
  if ((*(_WORD *)&self->_has & 0x200) != 0)
  {
    if ((*((_WORD *)v4 + 40) & 0x200) == 0 || self->_rxBeamSwitch != *((_DWORD *)v4 + 15))
      goto LABEL_78;
  }
  else if ((*((_WORD *)v4 + 40) & 0x200) != 0)
  {
    goto LABEL_78;
  }
  if ((*(_WORD *)&self->_has & 0x1000) != 0)
  {
    if ((*((_WORD *)v4 + 40) & 0x1000) == 0 || self->_txBeamSwitch != *((_DWORD *)v4 + 18))
      goto LABEL_78;
  }
  else if ((*((_WORD *)v4 + 40) & 0x1000) != 0)
  {
    goto LABEL_78;
  }
  if ((has & 2) != 0)
  {
    if ((v7 & 2) == 0 || self->_bandInd != *((_DWORD *)v4 + 4))
      goto LABEL_78;
  }
  else if ((v7 & 2) != 0)
  {
    goto LABEL_78;
  }
  if ((has & 0x20) != 0)
  {
    if ((v7 & 0x20) == 0 || self->_numSubs != *((_DWORD *)v4 + 8))
      goto LABEL_78;
  }
  else if ((v7 & 0x20) != 0)
  {
    goto LABEL_78;
  }
  if ((has & 0x40) != 0)
  {
    if ((v7 & 0x40) == 0 || self->_psPref != *((_DWORD *)v4 + 12))
      goto LABEL_78;
  }
  else if ((v7 & 0x40) != 0)
  {
    goto LABEL_78;
  }
  plmn = self->_plmn;
  if ((unint64_t)plmn | *((_QWORD *)v4 + 5))
  {
    if (!-[NSData isEqual:](plmn, "isEqual:"))
      goto LABEL_78;
    has = (__int16)self->_has;
  }
  if ((has & 0x800) != 0)
  {
    if ((*((_WORD *)v4 + 40) & 0x800) == 0 || self->_subsId != *((_DWORD *)v4 + 17))
      goto LABEL_78;
  }
  else if ((*((_WORD *)v4 + 40) & 0x800) != 0)
  {
    goto LABEL_78;
  }
  if ((has & 0x2000) != 0)
  {
    if ((*((_WORD *)v4 + 40) & 0x2000) != 0)
    {
      if (self->_isDueToSdm)
      {
        if (!*((_BYTE *)v4 + 76))
          goto LABEL_78;
        goto LABEL_73;
      }
      if (!*((_BYTE *)v4 + 76))
        goto LABEL_73;
    }
LABEL_78:
    v9 = 0;
    goto LABEL_79;
  }
  if ((*((_WORD *)v4 + 40) & 0x2000) != 0)
    goto LABEL_78;
LABEL_73:
  if ((has & 0x400) != 0)
  {
    if ((*((_WORD *)v4 + 40) & 0x400) == 0 || self->_sdmTriggerCause != *((_DWORD *)v4 + 16))
      goto LABEL_78;
    v9 = 1;
  }
  else
  {
    v9 = (*((_WORD *)v4 + 40) & 0x400) == 0;
  }
LABEL_79:

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
      v19 = 2654435761 * self->_reason;
      if ((*(_WORD *)&self->_has & 0x100) != 0)
        goto LABEL_4;
      goto LABEL_15;
    }
  }
  else
  {
    v20 = 0;
    if ((has & 0x80) != 0)
      goto LABEL_3;
  }
  v19 = 0;
  if ((*(_WORD *)&self->_has & 0x100) != 0)
  {
LABEL_4:
    v18 = 2654435761 * self->_result;
    if ((has & 4) != 0)
      goto LABEL_5;
    goto LABEL_16;
  }
LABEL_15:
  v18 = 0;
  if ((has & 4) != 0)
  {
LABEL_5:
    v16 = 2654435761 * self->_duration;
    if ((has & 8) != 0)
      goto LABEL_6;
    goto LABEL_17;
  }
LABEL_16:
  v16 = 0;
  if ((has & 8) != 0)
  {
LABEL_6:
    v4 = 2654435761 * self->_numBeamFailure;
    if ((has & 0x10) != 0)
      goto LABEL_7;
    goto LABEL_18;
  }
LABEL_17:
  v4 = 0;
  if ((has & 0x10) != 0)
  {
LABEL_7:
    v5 = 2654435761 * self->_numBeamRecovery;
    if ((*(_WORD *)&self->_has & 0x200) != 0)
      goto LABEL_8;
    goto LABEL_19;
  }
LABEL_18:
  v5 = 0;
  if ((*(_WORD *)&self->_has & 0x200) != 0)
  {
LABEL_8:
    v6 = 2654435761 * self->_rxBeamSwitch;
    if ((*(_WORD *)&self->_has & 0x1000) != 0)
      goto LABEL_9;
    goto LABEL_20;
  }
LABEL_19:
  v6 = 0;
  if ((*(_WORD *)&self->_has & 0x1000) != 0)
  {
LABEL_9:
    v7 = 2654435761 * self->_txBeamSwitch;
    if ((has & 2) != 0)
      goto LABEL_10;
    goto LABEL_21;
  }
LABEL_20:
  v7 = 0;
  if ((has & 2) != 0)
  {
LABEL_10:
    v8 = 2654435761 * self->_bandInd;
    if ((has & 0x20) != 0)
      goto LABEL_11;
LABEL_22:
    v9 = 0;
    if ((has & 0x40) != 0)
      goto LABEL_12;
    goto LABEL_23;
  }
LABEL_21:
  v8 = 0;
  if ((has & 0x20) == 0)
    goto LABEL_22;
LABEL_11:
  v9 = 2654435761 * self->_numSubs;
  if ((has & 0x40) != 0)
  {
LABEL_12:
    v10 = 2654435761 * self->_psPref;
    goto LABEL_24;
  }
LABEL_23:
  v10 = 0;
LABEL_24:
  v11 = (unint64_t)-[NSData hash](self->_plmn, "hash", v16);
  if ((*(_WORD *)&self->_has & 0x800) == 0)
  {
    v12 = 0;
    if ((*(_WORD *)&self->_has & 0x2000) != 0)
      goto LABEL_26;
LABEL_29:
    v13 = 0;
    if ((*(_WORD *)&self->_has & 0x400) != 0)
      goto LABEL_27;
LABEL_30:
    v14 = 0;
    return v19 ^ v20 ^ v18 ^ v17 ^ v4 ^ v5 ^ v6 ^ v7 ^ v8 ^ v9 ^ v10 ^ v12 ^ v13 ^ v14 ^ v11;
  }
  v12 = 2654435761 * self->_subsId;
  if ((*(_WORD *)&self->_has & 0x2000) == 0)
    goto LABEL_29;
LABEL_26:
  v13 = 2654435761 * self->_isDueToSdm;
  if ((*(_WORD *)&self->_has & 0x400) == 0)
    goto LABEL_30;
LABEL_27:
  v14 = 2654435761 * self->_sdmTriggerCause;
  return v19 ^ v20 ^ v18 ^ v17 ^ v4 ^ v5 ^ v6 ^ v7 ^ v8 ^ v9 ^ v10 ^ v12 ^ v13 ^ v14 ^ v11;
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
      if ((v5 & 0x100) == 0)
        goto LABEL_4;
      goto LABEL_22;
    }
  }
  else if ((v5 & 0x80) == 0)
  {
    goto LABEL_3;
  }
  self->_reason = *((_DWORD *)v4 + 13);
  *(_WORD *)&self->_has |= 0x80u;
  v5 = *((_WORD *)v4 + 40);
  if ((v5 & 0x100) == 0)
  {
LABEL_4:
    if ((v5 & 4) == 0)
      goto LABEL_5;
    goto LABEL_23;
  }
LABEL_22:
  self->_result = *((_DWORD *)v4 + 14);
  *(_WORD *)&self->_has |= 0x100u;
  v5 = *((_WORD *)v4 + 40);
  if ((v5 & 4) == 0)
  {
LABEL_5:
    if ((v5 & 8) == 0)
      goto LABEL_6;
    goto LABEL_24;
  }
LABEL_23:
  self->_duration = *((_DWORD *)v4 + 5);
  *(_WORD *)&self->_has |= 4u;
  v5 = *((_WORD *)v4 + 40);
  if ((v5 & 8) == 0)
  {
LABEL_6:
    if ((v5 & 0x10) == 0)
      goto LABEL_7;
    goto LABEL_25;
  }
LABEL_24:
  self->_numBeamFailure = *((_DWORD *)v4 + 6);
  *(_WORD *)&self->_has |= 8u;
  v5 = *((_WORD *)v4 + 40);
  if ((v5 & 0x10) == 0)
  {
LABEL_7:
    if ((v5 & 0x200) == 0)
      goto LABEL_8;
    goto LABEL_26;
  }
LABEL_25:
  self->_numBeamRecovery = *((_DWORD *)v4 + 7);
  *(_WORD *)&self->_has |= 0x10u;
  v5 = *((_WORD *)v4 + 40);
  if ((v5 & 0x200) == 0)
  {
LABEL_8:
    if ((v5 & 0x1000) == 0)
      goto LABEL_9;
    goto LABEL_27;
  }
LABEL_26:
  self->_rxBeamSwitch = *((_DWORD *)v4 + 15);
  *(_WORD *)&self->_has |= 0x200u;
  v5 = *((_WORD *)v4 + 40);
  if ((v5 & 0x1000) == 0)
  {
LABEL_9:
    if ((v5 & 2) == 0)
      goto LABEL_10;
    goto LABEL_28;
  }
LABEL_27:
  self->_txBeamSwitch = *((_DWORD *)v4 + 18);
  *(_WORD *)&self->_has |= 0x1000u;
  v5 = *((_WORD *)v4 + 40);
  if ((v5 & 2) == 0)
  {
LABEL_10:
    if ((v5 & 0x20) == 0)
      goto LABEL_11;
    goto LABEL_29;
  }
LABEL_28:
  self->_bandInd = *((_DWORD *)v4 + 4);
  *(_WORD *)&self->_has |= 2u;
  v5 = *((_WORD *)v4 + 40);
  if ((v5 & 0x20) == 0)
  {
LABEL_11:
    if ((v5 & 0x40) == 0)
      goto LABEL_13;
    goto LABEL_12;
  }
LABEL_29:
  self->_numSubs = *((_DWORD *)v4 + 8);
  *(_WORD *)&self->_has |= 0x20u;
  if ((*((_WORD *)v4 + 40) & 0x40) != 0)
  {
LABEL_12:
    self->_psPref = *((_DWORD *)v4 + 12);
    *(_WORD *)&self->_has |= 0x40u;
  }
LABEL_13:
  if (*((_QWORD *)v4 + 5))
  {
    v7 = v4;
    -[CellularNrScgRemoval setPlmn:](self, "setPlmn:");
    v4 = v7;
  }
  v6 = *((_WORD *)v4 + 40);
  if ((v6 & 0x800) == 0)
  {
    if ((*((_WORD *)v4 + 40) & 0x2000) == 0)
      goto LABEL_17;
LABEL_32:
    self->_isDueToSdm = *((_BYTE *)v4 + 76);
    *(_WORD *)&self->_has |= 0x2000u;
    if ((*((_WORD *)v4 + 40) & 0x400) == 0)
      goto LABEL_19;
    goto LABEL_18;
  }
  self->_subsId = *((_DWORD *)v4 + 17);
  *(_WORD *)&self->_has |= 0x800u;
  v6 = *((_WORD *)v4 + 40);
  if ((v6 & 0x2000) != 0)
    goto LABEL_32;
LABEL_17:
  if ((v6 & 0x400) != 0)
  {
LABEL_18:
    self->_sdmTriggerCause = *((_DWORD *)v4 + 16);
    *(_WORD *)&self->_has |= 0x400u;
  }
LABEL_19:

}

- (unint64_t)timestamp
{
  return self->_timestamp;
}

- (unsigned)reason
{
  return self->_reason;
}

- (unsigned)result
{
  return self->_result;
}

- (unsigned)duration
{
  return self->_duration;
}

- (unsigned)numBeamFailure
{
  return self->_numBeamFailure;
}

- (unsigned)numBeamRecovery
{
  return self->_numBeamRecovery;
}

- (unsigned)rxBeamSwitch
{
  return self->_rxBeamSwitch;
}

- (unsigned)txBeamSwitch
{
  return self->_txBeamSwitch;
}

- (unsigned)bandInd
{
  return self->_bandInd;
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

- (BOOL)isDueToSdm
{
  return self->_isDueToSdm;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_plmn, 0);
}

@end
