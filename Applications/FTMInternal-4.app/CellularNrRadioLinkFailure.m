@implementation CellularNrRadioLinkFailure

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

- (int)reason
{
  if ((*(_WORD *)&self->_has & 0x80) != 0)
    return self->_reason;
  else
    return 0;
}

- (void)setReason:(int)a3
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

- (id)reasonAsString:(int)a3
{
  if (a3 >= 9)
    return (id)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("(unknown: %i)"), *(_QWORD *)&a3));
  else
    return *(&off_10025F408 + a3);
}

- (int)StringAsReason:(id)a3
{
  id v3;
  int v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("NR5G_RLF_CAUSE_T310_EXPIRY")) & 1) != 0)
  {
    v4 = 0;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("NR5G_RLF_CAUSE_RACH_PROBLEM")) & 1) != 0)
  {
    v4 = 1;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("NR5G_RLF_CAUSE_RLC_MAX_RETX")) & 1) != 0)
  {
    v4 = 2;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("NR5G_RLF_CAUSE_SCG_CHANGE_FAILURE")) & 1) != 0)
  {
    v4 = 3;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("NR5G_RLF_CAUSE_SCG_RECONFIG_FAILURE")) & 1) != 0)
  {
    v4 = 4;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("NR5G_RLF_CAUSE_SRB3_IP_CHEK_FAILURE")) & 1) != 0)
  {
    v4 = 5;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("NR5G_RLF_CAUSE_RECONFIGURATION_FAILURE")) & 1) != 0)
  {
    v4 = 6;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("NR5G_RLF_CAUSE_HANDOVER_FAILURE")) & 1) != 0)
  {
    v4 = 7;
  }
  else if (objc_msgSend(v3, "isEqualToString:", CFSTR("NR5G_RLF_CAUSE_OTHER_FAILURE")))
  {
    v4 = 8;
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (int)expiryTimerDuration
{
  if ((*(_WORD *)&self->_has & 4) != 0)
    return self->_expiryTimerDuration;
  else
    return 0;
}

- (void)setExpiryTimerDuration:(int)a3
{
  *(_WORD *)&self->_has |= 4u;
  self->_expiryTimerDuration = a3;
}

- (void)setHasExpiryTimerDuration:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 4;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFFB | v3;
}

- (BOOL)hasExpiryTimerDuration
{
  return (*(_WORD *)&self->_has >> 2) & 1;
}

- (id)expiryTimerDurationAsString:(int)a3
{
  if (a3 >= 0x15)
    return (id)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("(unknown: %i)"), *(_QWORD *)&a3));
  else
    return *(&off_10025F450 + a3);
}

- (int)StringAsExpiryTimerDuration:(id)a3
{
  id v3;
  int v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("NR5G_RRC_TIMER_INVALID")) & 1) != 0)
  {
    v4 = 0;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("NR5G_RRC_TIMER_MS0")) & 1) != 0)
  {
    v4 = 1;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("NR5G_RRC_TIMER_MS50")) & 1) != 0)
  {
    v4 = 2;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("NR5G_RRC_TIMER_MS100")) & 1) != 0)
  {
    v4 = 3;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("NR5G_RRC_TIMER_MS150")) & 1) != 0)
  {
    v4 = 4;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("NR5G_RRC_TIMER_MS200")) & 1) != 0)
  {
    v4 = 5;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("NR5G_RRC_TIMER_MS300")) & 1) != 0)
  {
    v4 = 6;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("NR5G_RRC_TIMER_MS400")) & 1) != 0)
  {
    v4 = 7;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("NR5G_RRC_TIMER_MS500")) & 1) != 0)
  {
    v4 = 8;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("NR5G_RRC_TIMER_MS600")) & 1) != 0)
  {
    v4 = 9;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("NR5G_RRC_TIMER_MS1000")) & 1) != 0)
  {
    v4 = 10;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("NR5G_RRC_TIMER_MS1500")) & 1) != 0)
  {
    v4 = 11;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("NR5G_RRC_TIMER_MS2000")) & 1) != 0)
  {
    v4 = 12;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("NR5G_RRC_TIMER_MS3000")) & 1) != 0)
  {
    v4 = 13;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("NR5G_RRC_TIMER_MS4000")) & 1) != 0)
  {
    v4 = 14;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("NR5G_RRC_TIMER_MS5000")) & 1) != 0)
  {
    v4 = 15;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("NR5G_RRC_TIMER_MS6000")) & 1) != 0)
  {
    v4 = 16;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("NR5G_RRC_TIMER_MS10000")) & 1) != 0)
  {
    v4 = 17;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("NR5G_RRC_TIMER_MS15000")) & 1) != 0)
  {
    v4 = 18;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("NR5G_RRC_TIMER_MS20000")) & 1) != 0)
  {
    v4 = 19;
  }
  else if (objc_msgSend(v3, "isEqualToString:", CFSTR("NR5G_RRC_TIMER_MS30000")))
  {
    v4 = 20;
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (void)setRlmInSyncOutOfSyncThreshold:(BOOL)a3
{
  *(_WORD *)&self->_has |= 0x200u;
  self->_rlmInSyncOutOfSyncThreshold = a3;
}

- (void)setHasRlmInSyncOutOfSyncThreshold:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 512;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFDFF | v3;
}

- (BOOL)hasRlmInSyncOutOfSyncThreshold
{
  return (*(_WORD *)&self->_has >> 9) & 1;
}

- (void)setSubsId:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 0x100u;
  self->_subsId = a3;
}

- (void)setHasSubsId:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 256;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFEFF | v3;
}

- (BOOL)hasSubsId
{
  return HIBYTE(*(_WORD *)&self->_has) & 1;
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

- (int)mobilityState
{
  if ((*(_WORD *)&self->_has & 0x10) != 0)
    return self->_mobilityState;
  else
    return 0;
}

- (void)setMobilityState:(int)a3
{
  *(_WORD *)&self->_has |= 0x10u;
  self->_mobilityState = a3;
}

- (void)setHasMobilityState:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 16;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFEF | v3;
}

- (BOOL)hasMobilityState
{
  return (*(_WORD *)&self->_has >> 4) & 1;
}

- (id)mobilityStateAsString:(int)a3
{
  if (a3 >= 5)
    return (id)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("(unknown: %i)"), *(_QWORD *)&a3));
  else
    return *(&off_10025F4F8 + a3);
}

- (int)StringAsMobilityState:(id)a3
{
  id v3;
  int v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("MOTION_ST_STATIONARY")) & 1) != 0)
  {
    v4 = 0;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("MOTION_ST_MOVING")) & 1) != 0)
  {
    v4 = 1;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("MOTION_ST_PEDESTRIAN")) & 1) != 0)
  {
    v4 = 2;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("MOTION_ST_DRIVING")) & 1) != 0)
  {
    v4 = 3;
  }
  else if (objc_msgSend(v3, "isEqualToString:", CFSTR("MOTION_ST_SEMISTATIONARY")))
  {
    v4 = 4;
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (void)setLastRsrp:(int)a3
{
  *(_WORD *)&self->_has |= 8u;
  self->_lastRsrp = a3;
}

- (void)setHasLastRsrp:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 8;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFF7 | v3;
}

- (BOOL)hasLastRsrp
{
  return (*(_WORD *)&self->_has >> 3) & 1;
}

- (int)deployment
{
  if ((*(_WORD *)&self->_has & 2) != 0)
    return self->_deployment;
  else
    return 0;
}

- (void)setDeployment:(int)a3
{
  *(_WORD *)&self->_has |= 2u;
  self->_deployment = a3;
}

- (void)setHasDeployment:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFFD | v3;
}

- (BOOL)hasDeployment
{
  return (*(_WORD *)&self->_has >> 1) & 1;
}

- (id)deploymentAsString:(int)a3
{
  __CFString *v3;

  if (!a3)
    return CFSTR("DEPLOYMENT_SA");
  if (a3 == 1)
    v3 = CFSTR("DEPLOYMENT_NSA");
  else
    v3 = (__CFString *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("(unknown: %i)"), *(_QWORD *)&a3));
  return v3;
}

- (int)StringAsDeployment:(id)a3
{
  id v3;
  int v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("DEPLOYMENT_SA")) & 1) != 0)
    v4 = 0;
  else
    v4 = objc_msgSend(v3, "isEqualToString:", CFSTR("DEPLOYMENT_NSA"));

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
  v8.super_class = (Class)CellularNrRadioLinkFailure;
  v3 = -[CellularNrRadioLinkFailure description](&v8, "description");
  v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[CellularNrRadioLinkFailure dictionaryRepresentation](self, "dictionaryRepresentation"));
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
  uint64_t reason;
  void *v10;
  uint64_t mobilityState;
  void *v12;
  uint64_t expiryTimerDuration;
  void *v14;
  void *v15;
  int deployment;
  __CFString *v17;
  void *v18;
  void *v19;
  void *v20;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary"));
  has = (__int16)self->_has;
  if ((has & 1) != 0)
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedLongLong:](NSNumber, "numberWithUnsignedLongLong:", self->_timestamp));
    objc_msgSend(v3, "setObject:forKey:", v8, CFSTR("timestamp"));

    has = (__int16)self->_has;
    if ((has & 0x80) == 0)
    {
LABEL_3:
      if ((has & 4) == 0)
        goto LABEL_4;
      goto LABEL_22;
    }
  }
  else if ((has & 0x80) == 0)
  {
    goto LABEL_3;
  }
  reason = self->_reason;
  if (reason >= 9)
    v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("(unknown: %i)"), self->_reason));
  else
    v10 = *(&off_10025F408 + reason);
  objc_msgSend(v3, "setObject:forKey:", v10, CFSTR("reason"));

  has = (__int16)self->_has;
  if ((has & 4) == 0)
  {
LABEL_4:
    if ((has & 0x200) == 0)
      goto LABEL_5;
    goto LABEL_32;
  }
LABEL_22:
  expiryTimerDuration = self->_expiryTimerDuration;
  if (expiryTimerDuration >= 0x15)
    v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("(unknown: %i)"), self->_expiryTimerDuration));
  else
    v14 = *(&off_10025F450 + expiryTimerDuration);
  objc_msgSend(v3, "setObject:forKey:", v14, CFSTR("expiry_timer_duration"));

  has = (__int16)self->_has;
  if ((has & 0x200) == 0)
  {
LABEL_5:
    if ((has & 0x100) == 0)
      goto LABEL_6;
    goto LABEL_33;
  }
LABEL_32:
  v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", self->_rlmInSyncOutOfSyncThreshold));
  objc_msgSend(v3, "setObject:forKey:", v18, CFSTR("rlm_in_sync_out_of_sync_threshold"));

  has = (__int16)self->_has;
  if ((has & 0x100) == 0)
  {
LABEL_6:
    if ((has & 0x20) == 0)
      goto LABEL_7;
    goto LABEL_34;
  }
LABEL_33:
  v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", self->_subsId));
  objc_msgSend(v3, "setObject:forKey:", v19, CFSTR("subs_id"));

  has = (__int16)self->_has;
  if ((has & 0x20) == 0)
  {
LABEL_7:
    if ((has & 0x40) == 0)
      goto LABEL_9;
    goto LABEL_8;
  }
LABEL_34:
  v20 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", self->_numSubs));
  objc_msgSend(v3, "setObject:forKey:", v20, CFSTR("num_subs"));

  if ((*(_WORD *)&self->_has & 0x40) != 0)
  {
LABEL_8:
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", self->_psPref));
    objc_msgSend(v3, "setObject:forKey:", v5, CFSTR("ps_pref"));

  }
LABEL_9:
  plmn = self->_plmn;
  if (plmn)
    objc_msgSend(v3, "setObject:forKey:", plmn, CFSTR("plmn"));
  v7 = (__int16)self->_has;
  if ((v7 & 0x10) == 0)
  {
    if ((v7 & 8) == 0)
      goto LABEL_13;
LABEL_26:
    v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](NSNumber, "numberWithInt:", self->_lastRsrp));
    objc_msgSend(v3, "setObject:forKey:", v15, CFSTR("last_rsrp"));

    if ((*(_WORD *)&self->_has & 2) == 0)
      return v3;
    goto LABEL_27;
  }
  mobilityState = self->_mobilityState;
  if (mobilityState >= 5)
    v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("(unknown: %i)"), self->_mobilityState));
  else
    v12 = *(&off_10025F4F8 + mobilityState);
  objc_msgSend(v3, "setObject:forKey:", v12, CFSTR("mobility_state"));

  v7 = (__int16)self->_has;
  if ((v7 & 8) != 0)
    goto LABEL_26;
LABEL_13:
  if ((v7 & 2) == 0)
    return v3;
LABEL_27:
  deployment = self->_deployment;
  if (deployment)
  {
    if (deployment == 1)
      v17 = CFSTR("DEPLOYMENT_NSA");
    else
      v17 = (__CFString *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("(unknown: %i)"), self->_deployment));
  }
  else
  {
    v17 = CFSTR("DEPLOYMENT_SA");
  }
  objc_msgSend(v3, "setObject:forKey:", v17, CFSTR("deployment"));

  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return sub_1000CD69C((uint64_t)self, (uint64_t)a3);
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
      if ((has & 4) == 0)
        goto LABEL_4;
      goto LABEL_18;
    }
  }
  else if ((has & 0x80) == 0)
  {
    goto LABEL_3;
  }
  PBDataWriterWriteInt32Field(v7, self->_reason, 3);
  has = (__int16)self->_has;
  if ((has & 4) == 0)
  {
LABEL_4:
    if ((has & 0x200) == 0)
      goto LABEL_5;
    goto LABEL_19;
  }
LABEL_18:
  PBDataWriterWriteInt32Field(v7, self->_expiryTimerDuration, 4);
  has = (__int16)self->_has;
  if ((has & 0x200) == 0)
  {
LABEL_5:
    if ((has & 0x100) == 0)
      goto LABEL_6;
    goto LABEL_20;
  }
LABEL_19:
  PBDataWriterWriteBOOLField(v7, self->_rlmInSyncOutOfSyncThreshold, 5);
  has = (__int16)self->_has;
  if ((has & 0x100) == 0)
  {
LABEL_6:
    if ((has & 0x20) == 0)
      goto LABEL_7;
    goto LABEL_21;
  }
LABEL_20:
  PBDataWriterWriteUint32Field(v7, self->_subsId, 6);
  has = (__int16)self->_has;
  if ((has & 0x20) == 0)
  {
LABEL_7:
    if ((has & 0x40) == 0)
      goto LABEL_9;
    goto LABEL_8;
  }
LABEL_21:
  PBDataWriterWriteUint32Field(v7, self->_numSubs, 7);
  if ((*(_WORD *)&self->_has & 0x40) != 0)
LABEL_8:
    PBDataWriterWriteUint32Field(v7, self->_psPref, 8);
LABEL_9:
  plmn = self->_plmn;
  if (plmn)
    PBDataWriterWriteDataField(v7, plmn, 9);
  v6 = (__int16)self->_has;
  if ((v6 & 0x10) == 0)
  {
    if ((v6 & 8) == 0)
      goto LABEL_13;
LABEL_24:
    PBDataWriterWriteSint32Field(v7, self->_lastRsrp, 11);
    if ((*(_WORD *)&self->_has & 2) == 0)
      goto LABEL_15;
    goto LABEL_14;
  }
  PBDataWriterWriteInt32Field(v7, self->_mobilityState, 10);
  v6 = (__int16)self->_has;
  if ((v6 & 8) != 0)
    goto LABEL_24;
LABEL_13:
  if ((v6 & 2) != 0)
LABEL_14:
    PBDataWriterWriteInt32Field(v7, self->_deployment, 12);
LABEL_15:

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
    *((_WORD *)v4 + 32) |= 1u;
    has = (__int16)self->_has;
    if ((has & 0x80) == 0)
    {
LABEL_3:
      if ((has & 4) == 0)
        goto LABEL_4;
      goto LABEL_18;
    }
  }
  else if ((has & 0x80) == 0)
  {
    goto LABEL_3;
  }
  *((_DWORD *)v4 + 13) = self->_reason;
  *((_WORD *)v4 + 32) |= 0x80u;
  has = (__int16)self->_has;
  if ((has & 4) == 0)
  {
LABEL_4:
    if ((has & 0x200) == 0)
      goto LABEL_5;
    goto LABEL_19;
  }
LABEL_18:
  *((_DWORD *)v4 + 5) = self->_expiryTimerDuration;
  *((_WORD *)v4 + 32) |= 4u;
  has = (__int16)self->_has;
  if ((has & 0x200) == 0)
  {
LABEL_5:
    if ((has & 0x100) == 0)
      goto LABEL_6;
    goto LABEL_20;
  }
LABEL_19:
  *((_BYTE *)v4 + 60) = self->_rlmInSyncOutOfSyncThreshold;
  *((_WORD *)v4 + 32) |= 0x200u;
  has = (__int16)self->_has;
  if ((has & 0x100) == 0)
  {
LABEL_6:
    if ((has & 0x20) == 0)
      goto LABEL_7;
    goto LABEL_21;
  }
LABEL_20:
  *((_DWORD *)v4 + 14) = self->_subsId;
  *((_WORD *)v4 + 32) |= 0x100u;
  has = (__int16)self->_has;
  if ((has & 0x20) == 0)
  {
LABEL_7:
    if ((has & 0x40) == 0)
      goto LABEL_9;
    goto LABEL_8;
  }
LABEL_21:
  *((_DWORD *)v4 + 8) = self->_numSubs;
  *((_WORD *)v4 + 32) |= 0x20u;
  if ((*(_WORD *)&self->_has & 0x40) != 0)
  {
LABEL_8:
    *((_DWORD *)v4 + 12) = self->_psPref;
    *((_WORD *)v4 + 32) |= 0x40u;
  }
LABEL_9:
  if (self->_plmn)
  {
    v7 = v4;
    objc_msgSend(v4, "setPlmn:");
    v4 = v7;
  }
  v6 = (__int16)self->_has;
  if ((v6 & 0x10) == 0)
  {
    if ((v6 & 8) == 0)
      goto LABEL_13;
LABEL_24:
    *((_DWORD *)v4 + 6) = self->_lastRsrp;
    *((_WORD *)v4 + 32) |= 8u;
    if ((*(_WORD *)&self->_has & 2) == 0)
      goto LABEL_15;
    goto LABEL_14;
  }
  *((_DWORD *)v4 + 7) = self->_mobilityState;
  *((_WORD *)v4 + 32) |= 0x10u;
  v6 = (__int16)self->_has;
  if ((v6 & 8) != 0)
    goto LABEL_24;
LABEL_13:
  if ((v6 & 2) != 0)
  {
LABEL_14:
    *((_DWORD *)v4 + 4) = self->_deployment;
    *((_WORD *)v4 + 32) |= 2u;
  }
LABEL_15:

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
    *((_WORD *)v5 + 32) |= 1u;
    has = (__int16)self->_has;
    if ((has & 0x80) == 0)
    {
LABEL_3:
      if ((has & 4) == 0)
        goto LABEL_4;
      goto LABEL_16;
    }
  }
  else if ((has & 0x80) == 0)
  {
    goto LABEL_3;
  }
  *((_DWORD *)v5 + 13) = self->_reason;
  *((_WORD *)v5 + 32) |= 0x80u;
  has = (__int16)self->_has;
  if ((has & 4) == 0)
  {
LABEL_4:
    if ((has & 0x200) == 0)
      goto LABEL_5;
    goto LABEL_17;
  }
LABEL_16:
  *((_DWORD *)v5 + 5) = self->_expiryTimerDuration;
  *((_WORD *)v5 + 32) |= 4u;
  has = (__int16)self->_has;
  if ((has & 0x200) == 0)
  {
LABEL_5:
    if ((has & 0x100) == 0)
      goto LABEL_6;
    goto LABEL_18;
  }
LABEL_17:
  *((_BYTE *)v5 + 60) = self->_rlmInSyncOutOfSyncThreshold;
  *((_WORD *)v5 + 32) |= 0x200u;
  has = (__int16)self->_has;
  if ((has & 0x100) == 0)
  {
LABEL_6:
    if ((has & 0x20) == 0)
      goto LABEL_7;
    goto LABEL_19;
  }
LABEL_18:
  *((_DWORD *)v5 + 14) = self->_subsId;
  *((_WORD *)v5 + 32) |= 0x100u;
  has = (__int16)self->_has;
  if ((has & 0x20) == 0)
  {
LABEL_7:
    if ((has & 0x40) == 0)
      goto LABEL_9;
    goto LABEL_8;
  }
LABEL_19:
  *((_DWORD *)v5 + 8) = self->_numSubs;
  *((_WORD *)v5 + 32) |= 0x20u;
  if ((*(_WORD *)&self->_has & 0x40) != 0)
  {
LABEL_8:
    *((_DWORD *)v5 + 12) = self->_psPref;
    *((_WORD *)v5 + 32) |= 0x40u;
  }
LABEL_9:
  v8 = -[NSData copyWithZone:](self->_plmn, "copyWithZone:", a3);
  v9 = (void *)v6[5];
  v6[5] = v8;

  v10 = (__int16)self->_has;
  if ((v10 & 0x10) == 0)
  {
    if ((v10 & 8) == 0)
      goto LABEL_11;
LABEL_22:
    *((_DWORD *)v6 + 6) = self->_lastRsrp;
    *((_WORD *)v6 + 32) |= 8u;
    if ((*(_WORD *)&self->_has & 2) == 0)
      return v6;
    goto LABEL_12;
  }
  *((_DWORD *)v6 + 7) = self->_mobilityState;
  *((_WORD *)v6 + 32) |= 0x10u;
  v10 = (__int16)self->_has;
  if ((v10 & 8) != 0)
    goto LABEL_22;
LABEL_11:
  if ((v10 & 2) != 0)
  {
LABEL_12:
    *((_DWORD *)v6 + 4) = self->_deployment;
    *((_WORD *)v6 + 32) |= 2u;
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
    goto LABEL_58;
  has = (__int16)self->_has;
  v7 = *((_WORD *)v4 + 32);
  if ((has & 1) != 0)
  {
    if ((v7 & 1) == 0 || self->_timestamp != *((_QWORD *)v4 + 1))
      goto LABEL_58;
  }
  else if ((v7 & 1) != 0)
  {
    goto LABEL_58;
  }
  if ((has & 0x80) != 0)
  {
    if ((v7 & 0x80) == 0 || self->_reason != *((_DWORD *)v4 + 13))
      goto LABEL_58;
  }
  else if ((v7 & 0x80) != 0)
  {
    goto LABEL_58;
  }
  if ((has & 4) != 0)
  {
    if ((v7 & 4) == 0 || self->_expiryTimerDuration != *((_DWORD *)v4 + 5))
      goto LABEL_58;
  }
  else if ((v7 & 4) != 0)
  {
    goto LABEL_58;
  }
  if ((*(_WORD *)&self->_has & 0x200) != 0)
  {
    if ((*((_WORD *)v4 + 32) & 0x200) == 0)
      goto LABEL_58;
    if (self->_rlmInSyncOutOfSyncThreshold)
    {
      if (!*((_BYTE *)v4 + 60))
        goto LABEL_58;
    }
    else if (*((_BYTE *)v4 + 60))
    {
      goto LABEL_58;
    }
  }
  else if ((*((_WORD *)v4 + 32) & 0x200) != 0)
  {
    goto LABEL_58;
  }
  if ((*(_WORD *)&self->_has & 0x100) != 0)
  {
    if ((*((_WORD *)v4 + 32) & 0x100) == 0 || self->_subsId != *((_DWORD *)v4 + 14))
      goto LABEL_58;
  }
  else if ((*((_WORD *)v4 + 32) & 0x100) != 0)
  {
    goto LABEL_58;
  }
  if ((has & 0x20) != 0)
  {
    if ((v7 & 0x20) == 0 || self->_numSubs != *((_DWORD *)v4 + 8))
      goto LABEL_58;
  }
  else if ((v7 & 0x20) != 0)
  {
    goto LABEL_58;
  }
  if ((has & 0x40) != 0)
  {
    if ((v7 & 0x40) == 0 || self->_psPref != *((_DWORD *)v4 + 12))
      goto LABEL_58;
  }
  else if ((v7 & 0x40) != 0)
  {
    goto LABEL_58;
  }
  plmn = self->_plmn;
  if ((unint64_t)plmn | *((_QWORD *)v4 + 5))
  {
    if (-[NSData isEqual:](plmn, "isEqual:"))
    {
      has = (__int16)self->_has;
      goto LABEL_43;
    }
LABEL_58:
    v10 = 0;
    goto LABEL_59;
  }
LABEL_43:
  v9 = *((_WORD *)v4 + 32);
  if ((has & 0x10) != 0)
  {
    if ((v9 & 0x10) == 0 || self->_mobilityState != *((_DWORD *)v4 + 7))
      goto LABEL_58;
  }
  else if ((v9 & 0x10) != 0)
  {
    goto LABEL_58;
  }
  if ((has & 8) != 0)
  {
    if ((v9 & 8) == 0 || self->_lastRsrp != *((_DWORD *)v4 + 6))
      goto LABEL_58;
  }
  else if ((v9 & 8) != 0)
  {
    goto LABEL_58;
  }
  if ((has & 2) != 0)
  {
    if ((v9 & 2) == 0 || self->_deployment != *((_DWORD *)v4 + 4))
      goto LABEL_58;
    v10 = 1;
  }
  else
  {
    v10 = (v9 & 2) == 0;
  }
LABEL_59:

  return v10;
}

- (unint64_t)hash
{
  __int16 has;
  unint64_t v4;
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
  uint64_t v15;

  has = (__int16)self->_has;
  if ((has & 1) != 0)
  {
    v4 = 2654435761u * self->_timestamp;
    if ((has & 0x80) != 0)
    {
LABEL_3:
      v5 = 2654435761 * self->_reason;
      if ((has & 4) != 0)
        goto LABEL_4;
      goto LABEL_11;
    }
  }
  else
  {
    v4 = 0;
    if ((has & 0x80) != 0)
      goto LABEL_3;
  }
  v5 = 0;
  if ((has & 4) != 0)
  {
LABEL_4:
    v6 = 2654435761 * self->_expiryTimerDuration;
    if ((*(_WORD *)&self->_has & 0x200) != 0)
      goto LABEL_5;
    goto LABEL_12;
  }
LABEL_11:
  v6 = 0;
  if ((*(_WORD *)&self->_has & 0x200) != 0)
  {
LABEL_5:
    v7 = 2654435761 * self->_rlmInSyncOutOfSyncThreshold;
    if ((*(_WORD *)&self->_has & 0x100) != 0)
      goto LABEL_6;
    goto LABEL_13;
  }
LABEL_12:
  v7 = 0;
  if ((*(_WORD *)&self->_has & 0x100) != 0)
  {
LABEL_6:
    v8 = 2654435761 * self->_subsId;
    if ((has & 0x20) != 0)
      goto LABEL_7;
LABEL_14:
    v9 = 0;
    if ((has & 0x40) != 0)
      goto LABEL_8;
    goto LABEL_15;
  }
LABEL_13:
  v8 = 0;
  if ((has & 0x20) == 0)
    goto LABEL_14;
LABEL_7:
  v9 = 2654435761 * self->_numSubs;
  if ((has & 0x40) != 0)
  {
LABEL_8:
    v10 = 2654435761 * self->_psPref;
    goto LABEL_16;
  }
LABEL_15:
  v10 = 0;
LABEL_16:
  v11 = (unint64_t)-[NSData hash](self->_plmn, "hash");
  v12 = (__int16)self->_has;
  if ((v12 & 0x10) == 0)
  {
    v13 = 0;
    if ((v12 & 8) != 0)
      goto LABEL_18;
LABEL_21:
    v14 = 0;
    if ((v12 & 2) != 0)
      goto LABEL_19;
LABEL_22:
    v15 = 0;
    return v5 ^ v4 ^ v6 ^ v7 ^ v8 ^ v9 ^ v10 ^ v13 ^ v14 ^ v15 ^ v11;
  }
  v13 = 2654435761 * self->_mobilityState;
  if ((v12 & 8) == 0)
    goto LABEL_21;
LABEL_18:
  v14 = 2654435761 * self->_lastRsrp;
  if ((v12 & 2) == 0)
    goto LABEL_22;
LABEL_19:
  v15 = 2654435761 * self->_deployment;
  return v5 ^ v4 ^ v6 ^ v7 ^ v8 ^ v9 ^ v10 ^ v13 ^ v14 ^ v15 ^ v11;
}

- (void)mergeFrom:(id)a3
{
  id v4;
  __int16 v5;
  __int16 v6;
  id v7;

  v4 = a3;
  v5 = *((_WORD *)v4 + 32);
  if ((v5 & 1) != 0)
  {
    self->_timestamp = *((_QWORD *)v4 + 1);
    *(_WORD *)&self->_has |= 1u;
    v5 = *((_WORD *)v4 + 32);
    if ((v5 & 0x80) == 0)
    {
LABEL_3:
      if ((v5 & 4) == 0)
        goto LABEL_4;
      goto LABEL_18;
    }
  }
  else if ((v5 & 0x80) == 0)
  {
    goto LABEL_3;
  }
  self->_reason = *((_DWORD *)v4 + 13);
  *(_WORD *)&self->_has |= 0x80u;
  v5 = *((_WORD *)v4 + 32);
  if ((v5 & 4) == 0)
  {
LABEL_4:
    if ((v5 & 0x200) == 0)
      goto LABEL_5;
    goto LABEL_19;
  }
LABEL_18:
  self->_expiryTimerDuration = *((_DWORD *)v4 + 5);
  *(_WORD *)&self->_has |= 4u;
  v5 = *((_WORD *)v4 + 32);
  if ((v5 & 0x200) == 0)
  {
LABEL_5:
    if ((v5 & 0x100) == 0)
      goto LABEL_6;
    goto LABEL_20;
  }
LABEL_19:
  self->_rlmInSyncOutOfSyncThreshold = *((_BYTE *)v4 + 60);
  *(_WORD *)&self->_has |= 0x200u;
  v5 = *((_WORD *)v4 + 32);
  if ((v5 & 0x100) == 0)
  {
LABEL_6:
    if ((v5 & 0x20) == 0)
      goto LABEL_7;
    goto LABEL_21;
  }
LABEL_20:
  self->_subsId = *((_DWORD *)v4 + 14);
  *(_WORD *)&self->_has |= 0x100u;
  v5 = *((_WORD *)v4 + 32);
  if ((v5 & 0x20) == 0)
  {
LABEL_7:
    if ((v5 & 0x40) == 0)
      goto LABEL_9;
    goto LABEL_8;
  }
LABEL_21:
  self->_numSubs = *((_DWORD *)v4 + 8);
  *(_WORD *)&self->_has |= 0x20u;
  if ((*((_WORD *)v4 + 32) & 0x40) != 0)
  {
LABEL_8:
    self->_psPref = *((_DWORD *)v4 + 12);
    *(_WORD *)&self->_has |= 0x40u;
  }
LABEL_9:
  if (*((_QWORD *)v4 + 5))
  {
    v7 = v4;
    -[CellularNrRadioLinkFailure setPlmn:](self, "setPlmn:");
    v4 = v7;
  }
  v6 = *((_WORD *)v4 + 32);
  if ((v6 & 0x10) == 0)
  {
    if ((v6 & 8) == 0)
      goto LABEL_13;
LABEL_24:
    self->_lastRsrp = *((_DWORD *)v4 + 6);
    *(_WORD *)&self->_has |= 8u;
    if ((*((_WORD *)v4 + 32) & 2) == 0)
      goto LABEL_15;
    goto LABEL_14;
  }
  self->_mobilityState = *((_DWORD *)v4 + 7);
  *(_WORD *)&self->_has |= 0x10u;
  v6 = *((_WORD *)v4 + 32);
  if ((v6 & 8) != 0)
    goto LABEL_24;
LABEL_13:
  if ((v6 & 2) != 0)
  {
LABEL_14:
    self->_deployment = *((_DWORD *)v4 + 4);
    *(_WORD *)&self->_has |= 2u;
  }
LABEL_15:

}

- (unint64_t)timestamp
{
  return self->_timestamp;
}

- (BOOL)rlmInSyncOutOfSyncThreshold
{
  return self->_rlmInSyncOutOfSyncThreshold;
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

- (int)lastRsrp
{
  return self->_lastRsrp;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_plmn, 0);
}

@end
