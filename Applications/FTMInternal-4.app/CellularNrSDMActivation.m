@implementation CellularNrSDMActivation

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

- (void)setFr1MeasDisabled:(BOOL)a3
{
  *(_WORD *)&self->_has |= 0x40u;
  self->_fr1MeasDisabled = a3;
}

- (void)setHasFr1MeasDisabled:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 64;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFBF | v3;
}

- (BOOL)hasFr1MeasDisabled
{
  return (*(_WORD *)&self->_has >> 6) & 1;
}

- (void)setFr2MeasDisabled:(BOOL)a3
{
  *(_WORD *)&self->_has |= 0x80u;
  self->_fr2MeasDisabled = a3;
}

- (void)setHasFr2MeasDisabled:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 128;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFF7F | v3;
}

- (BOOL)hasFr2MeasDisabled
{
  return (*(_WORD *)&self->_has >> 7) & 1;
}

- (void)setPrevFr1MeasDisabled:(BOOL)a3
{
  *(_WORD *)&self->_has |= 0x100u;
  self->_prevFr1MeasDisabled = a3;
}

- (void)setHasPrevFr1MeasDisabled:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 256;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFEFF | v3;
}

- (BOOL)hasPrevFr1MeasDisabled
{
  return HIBYTE(*(_WORD *)&self->_has) & 1;
}

- (void)setPrevFr2MeasDisabled:(BOOL)a3
{
  *(_WORD *)&self->_has |= 0x200u;
  self->_prevFr2MeasDisabled = a3;
}

- (void)setHasPrevFr2MeasDisabled:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 512;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFDFF | v3;
}

- (BOOL)hasPrevFr2MeasDisabled
{
  return (*(_WORD *)&self->_has >> 9) & 1;
}

- (int)triggerCause
{
  if ((*(_WORD *)&self->_has & 8) != 0)
    return self->_triggerCause;
  else
    return 0;
}

- (void)setTriggerCause:(int)a3
{
  *(_WORD *)&self->_has |= 8u;
  self->_triggerCause = a3;
}

- (void)setHasTriggerCause:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 8;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFF7 | v3;
}

- (BOOL)hasTriggerCause
{
  return (*(_WORD *)&self->_has >> 3) & 1;
}

- (id)triggerCauseAsString:(int)a3
{
  if (a3 >= 0xC)
    return (id)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("(unknown: %i)"), *(_QWORD *)&a3));
  else
    return *(&off_10025F0D0 + a3);
}

- (int)StringAsTriggerCause:(id)a3
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

- (void)setApNrRecomm:(BOOL)a3
{
  *(_WORD *)&self->_has |= 0x10u;
  self->_apNrRecomm = a3;
}

- (void)setHasApNrRecomm:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 16;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFEF | v3;
}

- (BOOL)hasApNrRecomm
{
  return (*(_WORD *)&self->_has >> 4) & 1;
}

- (void)setApNrRecommConfFactor:(BOOL)a3
{
  *(_WORD *)&self->_has |= 0x20u;
  self->_apNrRecommConfFactor = a3;
}

- (void)setHasApNrRecommConfFactor:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 32;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFDF | v3;
}

- (BOOL)hasApNrRecommConfFactor
{
  return (*(_WORD *)&self->_has >> 5) & 1;
}

- (void)setSib24Configured:(BOOL)a3
{
  *(_WORD *)&self->_has |= 0x400u;
  self->_sib24Configured = a3;
}

- (void)setHasSib24Configured:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 1024;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFBFF | v3;
}

- (BOOL)hasSib24Configured
{
  return (*(_WORD *)&self->_has >> 10) & 1;
}

- (void)setDurationInPrevState:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 2u;
  self->_durationInPrevState = a3;
}

- (void)setHasDurationInPrevState:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFFD | v3;
}

- (BOOL)hasDurationInPrevState
{
  return (*(_WORD *)&self->_has >> 1) & 1;
}

- (void)setSubsId:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 4u;
  self->_subsId = a3;
}

- (void)setHasSubsId:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 4;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFFB | v3;
}

- (BOOL)hasSubsId
{
  return (*(_WORD *)&self->_has >> 2) & 1;
}

- (id)description
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)CellularNrSDMActivation;
  v3 = -[CellularNrSDMActivation description](&v8, "description");
  v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[CellularNrSDMActivation dictionaryRepresentation](self, "dictionaryRepresentation"));
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
  uint64_t triggerCause;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary"));
  has = (__int16)self->_has;
  if ((has & 1) != 0)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedLongLong:](NSNumber, "numberWithUnsignedLongLong:", self->_timestamp));
    objc_msgSend(v3, "setObject:forKey:", v7, CFSTR("timestamp"));

    has = (__int16)self->_has;
    if ((has & 0x40) == 0)
    {
LABEL_3:
      if ((has & 0x80) == 0)
        goto LABEL_4;
      goto LABEL_16;
    }
  }
  else if ((has & 0x40) == 0)
  {
    goto LABEL_3;
  }
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", self->_fr1MeasDisabled));
  objc_msgSend(v3, "setObject:forKey:", v8, CFSTR("fr1_meas_disabled"));

  has = (__int16)self->_has;
  if ((has & 0x80) == 0)
  {
LABEL_4:
    if ((has & 0x100) == 0)
      goto LABEL_5;
    goto LABEL_17;
  }
LABEL_16:
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", self->_fr2MeasDisabled));
  objc_msgSend(v3, "setObject:forKey:", v9, CFSTR("fr2_meas_disabled"));

  has = (__int16)self->_has;
  if ((has & 0x100) == 0)
  {
LABEL_5:
    if ((has & 0x200) == 0)
      goto LABEL_6;
    goto LABEL_18;
  }
LABEL_17:
  v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", self->_prevFr1MeasDisabled));
  objc_msgSend(v3, "setObject:forKey:", v10, CFSTR("prev_fr1_meas_disabled"));

  has = (__int16)self->_has;
  if ((has & 0x200) == 0)
  {
LABEL_6:
    if ((has & 8) == 0)
      goto LABEL_7;
    goto LABEL_19;
  }
LABEL_18:
  v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", self->_prevFr2MeasDisabled));
  objc_msgSend(v3, "setObject:forKey:", v11, CFSTR("prev_fr2_meas_disabled"));

  has = (__int16)self->_has;
  if ((has & 8) == 0)
  {
LABEL_7:
    if ((has & 0x10) == 0)
      goto LABEL_8;
    goto LABEL_23;
  }
LABEL_19:
  triggerCause = self->_triggerCause;
  if (triggerCause >= 0xC)
    v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("(unknown: %i)"), self->_triggerCause));
  else
    v13 = *(&off_10025F0D0 + triggerCause);
  objc_msgSend(v3, "setObject:forKey:", v13, CFSTR("trigger_cause"));

  has = (__int16)self->_has;
  if ((has & 0x10) == 0)
  {
LABEL_8:
    if ((has & 0x20) == 0)
      goto LABEL_9;
    goto LABEL_24;
  }
LABEL_23:
  v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", self->_apNrRecomm));
  objc_msgSend(v3, "setObject:forKey:", v14, CFSTR("ap_nr_recomm"));

  has = (__int16)self->_has;
  if ((has & 0x20) == 0)
  {
LABEL_9:
    if ((has & 0x400) == 0)
      goto LABEL_10;
    goto LABEL_25;
  }
LABEL_24:
  v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", self->_apNrRecommConfFactor));
  objc_msgSend(v3, "setObject:forKey:", v15, CFSTR("ap_nr_recomm_conf_factor"));

  has = (__int16)self->_has;
  if ((has & 0x400) == 0)
  {
LABEL_10:
    if ((has & 2) == 0)
      goto LABEL_11;
LABEL_26:
    v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", self->_durationInPrevState));
    objc_msgSend(v3, "setObject:forKey:", v17, CFSTR("duration_in_prev_state"));

    if ((*(_WORD *)&self->_has & 4) == 0)
      return v3;
    goto LABEL_12;
  }
LABEL_25:
  v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", self->_sib24Configured));
  objc_msgSend(v3, "setObject:forKey:", v16, CFSTR("sib24_configured"));

  has = (__int16)self->_has;
  if ((has & 2) != 0)
    goto LABEL_26;
LABEL_11:
  if ((has & 4) != 0)
  {
LABEL_12:
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", self->_subsId));
    objc_msgSend(v3, "setObject:forKey:", v5, CFSTR("subs_id"));

  }
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return sub_100089F4C((uint64_t)self, (uint64_t)a3);
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
    if ((has & 0x40) == 0)
    {
LABEL_3:
      if ((has & 0x80) == 0)
        goto LABEL_4;
      goto LABEL_16;
    }
  }
  else if ((has & 0x40) == 0)
  {
    goto LABEL_3;
  }
  PBDataWriterWriteBOOLField(v5, self->_fr1MeasDisabled, 2);
  has = (__int16)self->_has;
  if ((has & 0x80) == 0)
  {
LABEL_4:
    if ((has & 0x100) == 0)
      goto LABEL_5;
    goto LABEL_17;
  }
LABEL_16:
  PBDataWriterWriteBOOLField(v5, self->_fr2MeasDisabled, 3);
  has = (__int16)self->_has;
  if ((has & 0x100) == 0)
  {
LABEL_5:
    if ((has & 0x200) == 0)
      goto LABEL_6;
    goto LABEL_18;
  }
LABEL_17:
  PBDataWriterWriteBOOLField(v5, self->_prevFr1MeasDisabled, 4);
  has = (__int16)self->_has;
  if ((has & 0x200) == 0)
  {
LABEL_6:
    if ((has & 8) == 0)
      goto LABEL_7;
    goto LABEL_19;
  }
LABEL_18:
  PBDataWriterWriteBOOLField(v5, self->_prevFr2MeasDisabled, 5);
  has = (__int16)self->_has;
  if ((has & 8) == 0)
  {
LABEL_7:
    if ((has & 0x10) == 0)
      goto LABEL_8;
    goto LABEL_20;
  }
LABEL_19:
  PBDataWriterWriteInt32Field(v5, self->_triggerCause, 6);
  has = (__int16)self->_has;
  if ((has & 0x10) == 0)
  {
LABEL_8:
    if ((has & 0x20) == 0)
      goto LABEL_9;
    goto LABEL_21;
  }
LABEL_20:
  PBDataWriterWriteBOOLField(v5, self->_apNrRecomm, 7);
  has = (__int16)self->_has;
  if ((has & 0x20) == 0)
  {
LABEL_9:
    if ((has & 0x400) == 0)
      goto LABEL_10;
    goto LABEL_22;
  }
LABEL_21:
  PBDataWriterWriteBOOLField(v5, self->_apNrRecommConfFactor, 8);
  has = (__int16)self->_has;
  if ((has & 0x400) == 0)
  {
LABEL_10:
    if ((has & 2) == 0)
      goto LABEL_11;
LABEL_23:
    PBDataWriterWriteUint32Field(v5, self->_durationInPrevState, 10);
    if ((*(_WORD *)&self->_has & 4) == 0)
      goto LABEL_13;
    goto LABEL_12;
  }
LABEL_22:
  PBDataWriterWriteBOOLField(v5, self->_sib24Configured, 9);
  has = (__int16)self->_has;
  if ((has & 2) != 0)
    goto LABEL_23;
LABEL_11:
  if ((has & 4) != 0)
LABEL_12:
    PBDataWriterWriteUint32Field(v5, self->_subsId, 11);
LABEL_13:

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
    *((_WORD *)v4 + 18) |= 1u;
    has = (__int16)self->_has;
    if ((has & 0x40) == 0)
    {
LABEL_3:
      if ((has & 0x80) == 0)
        goto LABEL_4;
      goto LABEL_16;
    }
  }
  else if ((has & 0x40) == 0)
  {
    goto LABEL_3;
  }
  *((_BYTE *)v4 + 30) = self->_fr1MeasDisabled;
  *((_WORD *)v4 + 18) |= 0x40u;
  has = (__int16)self->_has;
  if ((has & 0x80) == 0)
  {
LABEL_4:
    if ((has & 0x100) == 0)
      goto LABEL_5;
    goto LABEL_17;
  }
LABEL_16:
  *((_BYTE *)v4 + 31) = self->_fr2MeasDisabled;
  *((_WORD *)v4 + 18) |= 0x80u;
  has = (__int16)self->_has;
  if ((has & 0x100) == 0)
  {
LABEL_5:
    if ((has & 0x200) == 0)
      goto LABEL_6;
    goto LABEL_18;
  }
LABEL_17:
  *((_BYTE *)v4 + 32) = self->_prevFr1MeasDisabled;
  *((_WORD *)v4 + 18) |= 0x100u;
  has = (__int16)self->_has;
  if ((has & 0x200) == 0)
  {
LABEL_6:
    if ((has & 8) == 0)
      goto LABEL_7;
    goto LABEL_19;
  }
LABEL_18:
  *((_BYTE *)v4 + 33) = self->_prevFr2MeasDisabled;
  *((_WORD *)v4 + 18) |= 0x200u;
  has = (__int16)self->_has;
  if ((has & 8) == 0)
  {
LABEL_7:
    if ((has & 0x10) == 0)
      goto LABEL_8;
    goto LABEL_20;
  }
LABEL_19:
  *((_DWORD *)v4 + 6) = self->_triggerCause;
  *((_WORD *)v4 + 18) |= 8u;
  has = (__int16)self->_has;
  if ((has & 0x10) == 0)
  {
LABEL_8:
    if ((has & 0x20) == 0)
      goto LABEL_9;
    goto LABEL_21;
  }
LABEL_20:
  *((_BYTE *)v4 + 28) = self->_apNrRecomm;
  *((_WORD *)v4 + 18) |= 0x10u;
  has = (__int16)self->_has;
  if ((has & 0x20) == 0)
  {
LABEL_9:
    if ((has & 0x400) == 0)
      goto LABEL_10;
    goto LABEL_22;
  }
LABEL_21:
  *((_BYTE *)v4 + 29) = self->_apNrRecommConfFactor;
  *((_WORD *)v4 + 18) |= 0x20u;
  has = (__int16)self->_has;
  if ((has & 0x400) == 0)
  {
LABEL_10:
    if ((has & 2) == 0)
      goto LABEL_11;
LABEL_23:
    *((_DWORD *)v4 + 4) = self->_durationInPrevState;
    *((_WORD *)v4 + 18) |= 2u;
    if ((*(_WORD *)&self->_has & 4) == 0)
      goto LABEL_13;
    goto LABEL_12;
  }
LABEL_22:
  *((_BYTE *)v4 + 34) = self->_sib24Configured;
  *((_WORD *)v4 + 18) |= 0x400u;
  has = (__int16)self->_has;
  if ((has & 2) != 0)
    goto LABEL_23;
LABEL_11:
  if ((has & 4) != 0)
  {
LABEL_12:
    *((_DWORD *)v4 + 5) = self->_subsId;
    *((_WORD *)v4 + 18) |= 4u;
  }
LABEL_13:

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
    *((_WORD *)result + 18) |= 1u;
    has = (__int16)self->_has;
    if ((has & 0x40) == 0)
    {
LABEL_3:
      if ((has & 0x80) == 0)
        goto LABEL_4;
      goto LABEL_16;
    }
  }
  else if ((has & 0x40) == 0)
  {
    goto LABEL_3;
  }
  *((_BYTE *)result + 30) = self->_fr1MeasDisabled;
  *((_WORD *)result + 18) |= 0x40u;
  has = (__int16)self->_has;
  if ((has & 0x80) == 0)
  {
LABEL_4:
    if ((has & 0x100) == 0)
      goto LABEL_5;
    goto LABEL_17;
  }
LABEL_16:
  *((_BYTE *)result + 31) = self->_fr2MeasDisabled;
  *((_WORD *)result + 18) |= 0x80u;
  has = (__int16)self->_has;
  if ((has & 0x100) == 0)
  {
LABEL_5:
    if ((has & 0x200) == 0)
      goto LABEL_6;
    goto LABEL_18;
  }
LABEL_17:
  *((_BYTE *)result + 32) = self->_prevFr1MeasDisabled;
  *((_WORD *)result + 18) |= 0x100u;
  has = (__int16)self->_has;
  if ((has & 0x200) == 0)
  {
LABEL_6:
    if ((has & 8) == 0)
      goto LABEL_7;
    goto LABEL_19;
  }
LABEL_18:
  *((_BYTE *)result + 33) = self->_prevFr2MeasDisabled;
  *((_WORD *)result + 18) |= 0x200u;
  has = (__int16)self->_has;
  if ((has & 8) == 0)
  {
LABEL_7:
    if ((has & 0x10) == 0)
      goto LABEL_8;
    goto LABEL_20;
  }
LABEL_19:
  *((_DWORD *)result + 6) = self->_triggerCause;
  *((_WORD *)result + 18) |= 8u;
  has = (__int16)self->_has;
  if ((has & 0x10) == 0)
  {
LABEL_8:
    if ((has & 0x20) == 0)
      goto LABEL_9;
    goto LABEL_21;
  }
LABEL_20:
  *((_BYTE *)result + 28) = self->_apNrRecomm;
  *((_WORD *)result + 18) |= 0x10u;
  has = (__int16)self->_has;
  if ((has & 0x20) == 0)
  {
LABEL_9:
    if ((has & 0x400) == 0)
      goto LABEL_10;
    goto LABEL_22;
  }
LABEL_21:
  *((_BYTE *)result + 29) = self->_apNrRecommConfFactor;
  *((_WORD *)result + 18) |= 0x20u;
  has = (__int16)self->_has;
  if ((has & 0x400) == 0)
  {
LABEL_10:
    if ((has & 2) == 0)
      goto LABEL_11;
    goto LABEL_23;
  }
LABEL_22:
  *((_BYTE *)result + 34) = self->_sib24Configured;
  *((_WORD *)result + 18) |= 0x400u;
  has = (__int16)self->_has;
  if ((has & 2) == 0)
  {
LABEL_11:
    if ((has & 4) == 0)
      return result;
    goto LABEL_12;
  }
LABEL_23:
  *((_DWORD *)result + 4) = self->_durationInPrevState;
  *((_WORD *)result + 18) |= 2u;
  if ((*(_WORD *)&self->_has & 4) == 0)
    return result;
LABEL_12:
  *((_DWORD *)result + 5) = self->_subsId;
  *((_WORD *)result + 18) |= 4u;
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
    goto LABEL_78;
  has = (__int16)self->_has;
  v7 = *((_WORD *)v4 + 18);
  if ((has & 1) != 0)
  {
    if ((v7 & 1) == 0 || self->_timestamp != *((_QWORD *)v4 + 1))
      goto LABEL_78;
  }
  else if ((v7 & 1) != 0)
  {
    goto LABEL_78;
  }
  if ((has & 0x40) != 0)
  {
    if ((v7 & 0x40) == 0)
      goto LABEL_78;
    if (self->_fr1MeasDisabled)
    {
      if (!*((_BYTE *)v4 + 30))
        goto LABEL_78;
    }
    else if (*((_BYTE *)v4 + 30))
    {
      goto LABEL_78;
    }
  }
  else if ((v7 & 0x40) != 0)
  {
    goto LABEL_78;
  }
  if ((has & 0x80) != 0)
  {
    if ((v7 & 0x80) == 0)
      goto LABEL_78;
    if (self->_fr2MeasDisabled)
    {
      if (!*((_BYTE *)v4 + 31))
        goto LABEL_78;
    }
    else if (*((_BYTE *)v4 + 31))
    {
      goto LABEL_78;
    }
  }
  else if ((v7 & 0x80) != 0)
  {
    goto LABEL_78;
  }
  if ((*(_WORD *)&self->_has & 0x100) != 0)
  {
    if ((*((_WORD *)v4 + 18) & 0x100) == 0)
      goto LABEL_78;
    if (self->_prevFr1MeasDisabled)
    {
      if (!*((_BYTE *)v4 + 32))
        goto LABEL_78;
    }
    else if (*((_BYTE *)v4 + 32))
    {
      goto LABEL_78;
    }
  }
  else if ((*((_WORD *)v4 + 18) & 0x100) != 0)
  {
    goto LABEL_78;
  }
  if ((*(_WORD *)&self->_has & 0x200) != 0)
  {
    if ((*((_WORD *)v4 + 18) & 0x200) == 0)
      goto LABEL_78;
    if (self->_prevFr2MeasDisabled)
    {
      if (!*((_BYTE *)v4 + 33))
        goto LABEL_78;
    }
    else if (*((_BYTE *)v4 + 33))
    {
      goto LABEL_78;
    }
  }
  else if ((*((_WORD *)v4 + 18) & 0x200) != 0)
  {
    goto LABEL_78;
  }
  if ((has & 8) != 0)
  {
    if ((v7 & 8) == 0 || self->_triggerCause != *((_DWORD *)v4 + 6))
      goto LABEL_78;
  }
  else if ((v7 & 8) != 0)
  {
    goto LABEL_78;
  }
  if ((has & 0x10) != 0)
  {
    if ((v7 & 0x10) == 0)
      goto LABEL_78;
    if (self->_apNrRecomm)
    {
      if (!*((_BYTE *)v4 + 28))
        goto LABEL_78;
    }
    else if (*((_BYTE *)v4 + 28))
    {
      goto LABEL_78;
    }
  }
  else if ((v7 & 0x10) != 0)
  {
    goto LABEL_78;
  }
  if ((has & 0x20) != 0)
  {
    if ((v7 & 0x20) == 0)
      goto LABEL_78;
    if (self->_apNrRecommConfFactor)
    {
      if (!*((_BYTE *)v4 + 29))
        goto LABEL_78;
    }
    else if (*((_BYTE *)v4 + 29))
    {
      goto LABEL_78;
    }
  }
  else if ((v7 & 0x20) != 0)
  {
    goto LABEL_78;
  }
  if ((*(_WORD *)&self->_has & 0x400) != 0)
  {
    if ((*((_WORD *)v4 + 18) & 0x400) != 0)
    {
      if (self->_sib24Configured)
      {
        if (!*((_BYTE *)v4 + 34))
          goto LABEL_78;
        goto LABEL_68;
      }
      if (!*((_BYTE *)v4 + 34))
        goto LABEL_68;
    }
LABEL_78:
    v8 = 0;
    goto LABEL_79;
  }
  if ((*((_WORD *)v4 + 18) & 0x400) != 0)
    goto LABEL_78;
LABEL_68:
  if ((has & 2) != 0)
  {
    if ((v7 & 2) == 0 || self->_durationInPrevState != *((_DWORD *)v4 + 4))
      goto LABEL_78;
  }
  else if ((v7 & 2) != 0)
  {
    goto LABEL_78;
  }
  if ((has & 4) != 0)
  {
    if ((v7 & 4) == 0 || self->_subsId != *((_DWORD *)v4 + 5))
      goto LABEL_78;
    v8 = 1;
  }
  else
  {
    v8 = (v7 & 4) == 0;
  }
LABEL_79:

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

  has = (__int16)self->_has;
  if ((has & 1) != 0)
  {
    v3 = 2654435761u * self->_timestamp;
    if ((has & 0x40) != 0)
    {
LABEL_3:
      v4 = 2654435761 * self->_fr1MeasDisabled;
      if ((has & 0x80) != 0)
        goto LABEL_4;
      goto LABEL_15;
    }
  }
  else
  {
    v3 = 0;
    if ((has & 0x40) != 0)
      goto LABEL_3;
  }
  v4 = 0;
  if ((has & 0x80) != 0)
  {
LABEL_4:
    v5 = 2654435761 * self->_fr2MeasDisabled;
    if ((*(_WORD *)&self->_has & 0x100) != 0)
      goto LABEL_5;
    goto LABEL_16;
  }
LABEL_15:
  v5 = 0;
  if ((*(_WORD *)&self->_has & 0x100) != 0)
  {
LABEL_5:
    v6 = 2654435761 * self->_prevFr1MeasDisabled;
    if ((*(_WORD *)&self->_has & 0x200) != 0)
      goto LABEL_6;
    goto LABEL_17;
  }
LABEL_16:
  v6 = 0;
  if ((*(_WORD *)&self->_has & 0x200) != 0)
  {
LABEL_6:
    v7 = 2654435761 * self->_prevFr2MeasDisabled;
    if ((has & 8) != 0)
      goto LABEL_7;
    goto LABEL_18;
  }
LABEL_17:
  v7 = 0;
  if ((has & 8) != 0)
  {
LABEL_7:
    v8 = 2654435761 * self->_triggerCause;
    if ((has & 0x10) != 0)
      goto LABEL_8;
    goto LABEL_19;
  }
LABEL_18:
  v8 = 0;
  if ((has & 0x10) != 0)
  {
LABEL_8:
    v9 = 2654435761 * self->_apNrRecomm;
    if ((has & 0x20) != 0)
      goto LABEL_9;
    goto LABEL_20;
  }
LABEL_19:
  v9 = 0;
  if ((has & 0x20) != 0)
  {
LABEL_9:
    v10 = 2654435761 * self->_apNrRecommConfFactor;
    if ((*(_WORD *)&self->_has & 0x400) != 0)
      goto LABEL_10;
    goto LABEL_21;
  }
LABEL_20:
  v10 = 0;
  if ((*(_WORD *)&self->_has & 0x400) != 0)
  {
LABEL_10:
    v11 = 2654435761 * self->_sib24Configured;
    if ((has & 2) != 0)
      goto LABEL_11;
LABEL_22:
    v12 = 0;
    if ((has & 4) != 0)
      goto LABEL_12;
LABEL_23:
    v13 = 0;
    return v4 ^ v3 ^ v5 ^ v6 ^ v7 ^ v8 ^ v9 ^ v10 ^ v11 ^ v12 ^ v13;
  }
LABEL_21:
  v11 = 0;
  if ((has & 2) == 0)
    goto LABEL_22;
LABEL_11:
  v12 = 2654435761 * self->_durationInPrevState;
  if ((has & 4) == 0)
    goto LABEL_23;
LABEL_12:
  v13 = 2654435761 * self->_subsId;
  return v4 ^ v3 ^ v5 ^ v6 ^ v7 ^ v8 ^ v9 ^ v10 ^ v11 ^ v12 ^ v13;
}

- (void)mergeFrom:(id)a3
{
  id v4;
  __int16 v5;

  v4 = a3;
  v5 = *((_WORD *)v4 + 18);
  if ((v5 & 1) != 0)
  {
    self->_timestamp = *((_QWORD *)v4 + 1);
    *(_WORD *)&self->_has |= 1u;
    v5 = *((_WORD *)v4 + 18);
    if ((v5 & 0x40) == 0)
    {
LABEL_3:
      if ((v5 & 0x80) == 0)
        goto LABEL_4;
      goto LABEL_16;
    }
  }
  else if ((v5 & 0x40) == 0)
  {
    goto LABEL_3;
  }
  self->_fr1MeasDisabled = *((_BYTE *)v4 + 30);
  *(_WORD *)&self->_has |= 0x40u;
  v5 = *((_WORD *)v4 + 18);
  if ((v5 & 0x80) == 0)
  {
LABEL_4:
    if ((v5 & 0x100) == 0)
      goto LABEL_5;
    goto LABEL_17;
  }
LABEL_16:
  self->_fr2MeasDisabled = *((_BYTE *)v4 + 31);
  *(_WORD *)&self->_has |= 0x80u;
  v5 = *((_WORD *)v4 + 18);
  if ((v5 & 0x100) == 0)
  {
LABEL_5:
    if ((v5 & 0x200) == 0)
      goto LABEL_6;
    goto LABEL_18;
  }
LABEL_17:
  self->_prevFr1MeasDisabled = *((_BYTE *)v4 + 32);
  *(_WORD *)&self->_has |= 0x100u;
  v5 = *((_WORD *)v4 + 18);
  if ((v5 & 0x200) == 0)
  {
LABEL_6:
    if ((v5 & 8) == 0)
      goto LABEL_7;
    goto LABEL_19;
  }
LABEL_18:
  self->_prevFr2MeasDisabled = *((_BYTE *)v4 + 33);
  *(_WORD *)&self->_has |= 0x200u;
  v5 = *((_WORD *)v4 + 18);
  if ((v5 & 8) == 0)
  {
LABEL_7:
    if ((v5 & 0x10) == 0)
      goto LABEL_8;
    goto LABEL_20;
  }
LABEL_19:
  self->_triggerCause = *((_DWORD *)v4 + 6);
  *(_WORD *)&self->_has |= 8u;
  v5 = *((_WORD *)v4 + 18);
  if ((v5 & 0x10) == 0)
  {
LABEL_8:
    if ((v5 & 0x20) == 0)
      goto LABEL_9;
    goto LABEL_21;
  }
LABEL_20:
  self->_apNrRecomm = *((_BYTE *)v4 + 28);
  *(_WORD *)&self->_has |= 0x10u;
  v5 = *((_WORD *)v4 + 18);
  if ((v5 & 0x20) == 0)
  {
LABEL_9:
    if ((v5 & 0x400) == 0)
      goto LABEL_10;
    goto LABEL_22;
  }
LABEL_21:
  self->_apNrRecommConfFactor = *((_BYTE *)v4 + 29);
  *(_WORD *)&self->_has |= 0x20u;
  v5 = *((_WORD *)v4 + 18);
  if ((v5 & 0x400) == 0)
  {
LABEL_10:
    if ((v5 & 2) == 0)
      goto LABEL_11;
LABEL_23:
    self->_durationInPrevState = *((_DWORD *)v4 + 4);
    *(_WORD *)&self->_has |= 2u;
    if ((*((_WORD *)v4 + 18) & 4) == 0)
      goto LABEL_13;
    goto LABEL_12;
  }
LABEL_22:
  self->_sib24Configured = *((_BYTE *)v4 + 34);
  *(_WORD *)&self->_has |= 0x400u;
  v5 = *((_WORD *)v4 + 18);
  if ((v5 & 2) != 0)
    goto LABEL_23;
LABEL_11:
  if ((v5 & 4) != 0)
  {
LABEL_12:
    self->_subsId = *((_DWORD *)v4 + 5);
    *(_WORD *)&self->_has |= 4u;
  }
LABEL_13:

}

- (unint64_t)timestamp
{
  return self->_timestamp;
}

- (BOOL)fr1MeasDisabled
{
  return self->_fr1MeasDisabled;
}

- (BOOL)fr2MeasDisabled
{
  return self->_fr2MeasDisabled;
}

- (BOOL)prevFr1MeasDisabled
{
  return self->_prevFr1MeasDisabled;
}

- (BOOL)prevFr2MeasDisabled
{
  return self->_prevFr2MeasDisabled;
}

- (BOOL)apNrRecomm
{
  return self->_apNrRecomm;
}

- (BOOL)apNrRecommConfFactor
{
  return self->_apNrRecommConfFactor;
}

- (BOOL)sib24Configured
{
  return self->_sib24Configured;
}

- (unsigned)durationInPrevState
{
  return self->_durationInPrevState;
}

- (unsigned)subsId
{
  return self->_subsId;
}

@end
