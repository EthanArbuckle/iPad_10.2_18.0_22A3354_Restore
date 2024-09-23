@implementation CellularLqmStateChange

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

- (void)setDurationSec:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 8u;
  self->_durationSec = a3;
}

- (void)setHasDurationSec:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 8;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFF7 | v3;
}

- (BOOL)hasDurationSec
{
  return (*(_WORD *)&self->_has >> 3) & 1;
}

- (void)setLqmType:(int)a3
{
  *(_WORD *)&self->_has |= 0x40u;
  self->_lqmType = a3;
}

- (void)setHasLqmType:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 64;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFBF | v3;
}

- (BOOL)hasLqmType
{
  return (*(_WORD *)&self->_has >> 6) & 1;
}

- (void)setSysMode:(int)a3
{
  *(_WORD *)&self->_has |= 0x400u;
  self->_sysMode = a3;
}

- (void)setHasSysMode:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 1024;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFBFF | v3;
}

- (BOOL)hasSysMode
{
  return (*(_WORD *)&self->_has >> 10) & 1;
}

- (void)setIsScreenOn:(BOOL)a3
{
  *(_WORD *)&self->_has |= 0x2000u;
  self->_isScreenOn = a3;
}

- (void)setHasIsScreenOn:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 0x2000;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xDFFF | v3;
}

- (BOOL)hasIsScreenOn
{
  return (*(_WORD *)&self->_has >> 13) & 1;
}

- (BOOL)hasRachConnInfo
{
  return self->_rachConnInfo != 0;
}

- (void)clearLteChanInfos
{
  -[NSMutableArray removeAllObjects](self->_lteChanInfos, "removeAllObjects");
}

- (void)addLteChanInfo:(id)a3
{
  id v4;
  NSMutableArray *lteChanInfos;
  NSMutableArray *v6;
  NSMutableArray *v7;
  id v8;

  v4 = a3;
  lteChanInfos = self->_lteChanInfos;
  v8 = v4;
  if (!lteChanInfos)
  {
    v6 = (NSMutableArray *)objc_alloc_init((Class)NSMutableArray);
    v7 = self->_lteChanInfos;
    self->_lteChanInfos = v6;

    v4 = v8;
    lteChanInfos = self->_lteChanInfos;
  }
  -[NSMutableArray addObject:](lteChanInfos, "addObject:", v4);

}

- (unint64_t)lteChanInfosCount
{
  return (unint64_t)-[NSMutableArray count](self->_lteChanInfos, "count");
}

- (id)lteChanInfoAtIndex:(unint64_t)a3
{
  return -[NSMutableArray objectAtIndex:](self->_lteChanInfos, "objectAtIndex:", a3);
}

+ (Class)lteChanInfoType
{
  return (Class)objc_opt_class(LteChannelInfo, a2);
}

- (void)clearUmtsChanInfos
{
  -[NSMutableArray removeAllObjects](self->_umtsChanInfos, "removeAllObjects");
}

- (void)addUmtsChanInfo:(id)a3
{
  id v4;
  NSMutableArray *umtsChanInfos;
  NSMutableArray *v6;
  NSMutableArray *v7;
  id v8;

  v4 = a3;
  umtsChanInfos = self->_umtsChanInfos;
  v8 = v4;
  if (!umtsChanInfos)
  {
    v6 = (NSMutableArray *)objc_alloc_init((Class)NSMutableArray);
    v7 = self->_umtsChanInfos;
    self->_umtsChanInfos = v6;

    v4 = v8;
    umtsChanInfos = self->_umtsChanInfos;
  }
  -[NSMutableArray addObject:](umtsChanInfos, "addObject:", v4);

}

- (unint64_t)umtsChanInfosCount
{
  return (unint64_t)-[NSMutableArray count](self->_umtsChanInfos, "count");
}

- (id)umtsChanInfoAtIndex:(unint64_t)a3
{
  return -[NSMutableArray objectAtIndex:](self->_umtsChanInfos, "objectAtIndex:", a3);
}

+ (Class)umtsChanInfoType
{
  return (Class)objc_opt_class(UmtsChannelInfo, a2);
}

- (void)setBbInHiPowerState:(BOOL)a3
{
  *(_WORD *)&self->_has |= 0x800u;
  self->_bbInHiPowerState = a3;
}

- (void)setHasBbInHiPowerState:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 2048;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xF7FF | v3;
}

- (BOOL)hasBbInHiPowerState
{
  return (*(_WORD *)&self->_has >> 11) & 1;
}

- (int)hiPowerEvent
{
  if ((*(_WORD *)&self->_has & 0x10) != 0)
    return self->_hiPowerEvent;
  else
    return 0;
}

- (void)setHiPowerEvent:(int)a3
{
  *(_WORD *)&self->_has |= 0x10u;
  self->_hiPowerEvent = a3;
}

- (void)setHasHiPowerEvent:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 16;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFEF | v3;
}

- (BOOL)hasHiPowerEvent
{
  return (*(_WORD *)&self->_has >> 4) & 1;
}

- (id)hiPowerEventAsString:(int)a3
{
  __CFString *v3;

  v3 = CFSTR("LQM_EVENT_RLC_MAX_RETX");
  switch(a3)
  {
    case 0:
      return v3;
    case 1:
      v3 = CFSTR("LQM_EVENT_RACH_FAILURE");
      return v3;
    case 2:
      return CFSTR("LQM_EVENT_LTE_PHY_ABORT");
    case 3:
      return CFSTR("LQM_EVENT_LTE_HI_POWER");
    case 4:
      return CFSTR("LQM_EVENT_WCDMA_HI_POWER");
    case 5:
      return CFSTR("LQM_EVENT_LTE_POOR_SIGNAL_CONDITION");
    case 6:
      return CFSTR("LQM_EVENT_WCDMA_POOR_SIGNAL_CONDITION");
    case 7:
      return CFSTR("LQM_EVENT_WCDMA_RACH_FAILURE");
    case 8:
      return CFSTR("LQM_EVENT_EXCESSIVE_IRAT");
    default:
      if (a3 == 255)
        return CFSTR("LQM_EVENT_MAX");
      v3 = (__CFString *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("(unknown: %i)"), *(_QWORD *)&a3));
      return v3;
  }
}

- (int)StringAsHiPowerEvent:(id)a3
{
  id v3;
  int v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("LQM_EVENT_RLC_MAX_RETX")) & 1) != 0)
  {
    v4 = 0;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("LQM_EVENT_RACH_FAILURE")) & 1) != 0)
  {
    v4 = 1;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("LQM_EVENT_LTE_PHY_ABORT")) & 1) != 0)
  {
    v4 = 2;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("LQM_EVENT_LTE_HI_POWER")) & 1) != 0)
  {
    v4 = 3;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("LQM_EVENT_WCDMA_HI_POWER")) & 1) != 0)
  {
    v4 = 4;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("LQM_EVENT_LTE_POOR_SIGNAL_CONDITION")) & 1) != 0)
  {
    v4 = 5;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("LQM_EVENT_WCDMA_POOR_SIGNAL_CONDITION")) & 1) != 0)
  {
    v4 = 6;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("LQM_EVENT_WCDMA_RACH_FAILURE")) & 1) != 0)
  {
    v4 = 7;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("LQM_EVENT_EXCESSIVE_IRAT")) & 1) != 0)
  {
    v4 = 8;
  }
  else if (objc_msgSend(v3, "isEqualToString:", CFSTR("LQM_EVENT_MAX")))
  {
    v4 = 255;
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (void)setSwimWorkoutActive:(BOOL)a3
{
  *(_WORD *)&self->_has |= 0x4000u;
  self->_swimWorkoutActive = a3;
}

- (void)setHasSwimWorkoutActive:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 0x4000;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xBFFF | v3;
}

- (BOOL)hasSwimWorkoutActive
{
  return (*(_WORD *)&self->_has >> 14) & 1;
}

- (int)hiPowerExitReason
{
  if ((*(_WORD *)&self->_has & 0x20) != 0)
    return self->_hiPowerExitReason;
  else
    return 0;
}

- (void)setHiPowerExitReason:(int)a3
{
  *(_WORD *)&self->_has |= 0x20u;
  self->_hiPowerExitReason = a3;
}

- (void)setHasHiPowerExitReason:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 32;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFDF | v3;
}

- (BOOL)hasHiPowerExitReason
{
  return (*(_WORD *)&self->_has >> 5) & 1;
}

- (id)hiPowerExitReasonAsString:(int)a3
{
  __CFString *v3;

  if (a3 > 1)
  {
    if (a3 == 2)
      return CFSTR("LQM_HPM_EXIT_REASON_USER_ACTIVITY");
    if (a3 == 255)
      return CFSTR("LQM_HPM_EXIT_REASON_MAX");
    goto LABEL_10;
  }
  if (!a3)
    return CFSTR("LQM_HPM_EXIT_REASON_GUARD_TIMER_EXPIRY");
  if (a3 != 1)
  {
LABEL_10:
    v3 = (__CFString *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("(unknown: %i)"), *(_QWORD *)&a3));
    return v3;
  }
  v3 = CFSTR("LQM_HPM_EXIT_REASON_SIGNAL_IMPROVEMENT");
  return v3;
}

- (int)StringAsHiPowerExitReason:(id)a3
{
  id v3;
  int v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("LQM_HPM_EXIT_REASON_GUARD_TIMER_EXPIRY")) & 1) != 0)
  {
    v4 = 0;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("LQM_HPM_EXIT_REASON_SIGNAL_IMPROVEMENT")) & 1) != 0)
  {
    v4 = 1;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("LQM_HPM_EXIT_REASON_USER_ACTIVITY")) & 1) != 0)
  {
    v4 = 2;
  }
  else if (objc_msgSend(v3, "isEqualToString:", CFSTR("LQM_HPM_EXIT_REASON_MAX")))
  {
    v4 = 255;
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (int)congestionReason
{
  if ((*(_WORD *)&self->_has & 4) != 0)
    return self->_congestionReason;
  else
    return 0;
}

- (void)setCongestionReason:(int)a3
{
  *(_WORD *)&self->_has |= 4u;
  self->_congestionReason = a3;
}

- (void)setHasCongestionReason:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 4;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFFB | v3;
}

- (BOOL)hasCongestionReason
{
  return (*(_WORD *)&self->_has >> 2) & 1;
}

- (id)congestionReasonAsString:(int)a3
{
  __CFString *v3;

  v3 = CFSTR("LQM_CONGESTION_REASON_RRC_REJECT");
  switch(a3)
  {
    case 0:
      return v3;
    case 1:
      v3 = CFSTR("LQM_CONGESTION_REASON_NAS_REJECT");
      return v3;
    case 2:
      return CFSTR("LQM_CONGESTION_REASON_ACCESS_BARRED");
    case 3:
      return CFSTR("LQM_CONGESTION_REASON_RACH_FAILURES");
    case 4:
      return CFSTR("LQM_CONGESTION_REASON_TRICKLING_GRANT");
    case 5:
      return CFSTR("LQM_CONGESTION_REASON_RLC_MAX_RETX");
    case 6:
      return CFSTR("LQM_CONGESTION_REASON_POOR_SIGNAL_CONDITIONS");
    default:
      if (a3 == 255)
        return CFSTR("LQM_CONGESTION_REASON_MAX");
      v3 = (__CFString *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("(unknown: %i)"), *(_QWORD *)&a3));
      return v3;
  }
}

- (int)StringAsCongestionReason:(id)a3
{
  id v3;
  int v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("LQM_CONGESTION_REASON_RRC_REJECT")) & 1) != 0)
  {
    v4 = 0;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("LQM_CONGESTION_REASON_NAS_REJECT")) & 1) != 0)
  {
    v4 = 1;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("LQM_CONGESTION_REASON_ACCESS_BARRED")) & 1) != 0)
  {
    v4 = 2;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("LQM_CONGESTION_REASON_RACH_FAILURES")) & 1) != 0)
  {
    v4 = 3;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("LQM_CONGESTION_REASON_TRICKLING_GRANT")) & 1) != 0)
  {
    v4 = 4;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("LQM_CONGESTION_REASON_RLC_MAX_RETX")) & 1) != 0)
  {
    v4 = 5;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("LQM_CONGESTION_REASON_POOR_SIGNAL_CONDITIONS")) & 1) != 0)
  {
    v4 = 6;
  }
  else if (objc_msgSend(v3, "isEqualToString:", CFSTR("LQM_CONGESTION_REASON_MAX")))
  {
    v4 = 255;
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (void)setCellId:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 2u;
  self->_cellId = a3;
}

- (void)setHasCellId:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFFD | v3;
}

- (BOOL)hasCellId
{
  return (*(_WORD *)&self->_has >> 1) & 1;
}

- (void)setNumMncDigits:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 0x200u;
  self->_numMncDigits = a3;
}

- (void)setHasNumMncDigits:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 512;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFDFF | v3;
}

- (BOOL)hasNumMncDigits
{
  return (*(_WORD *)&self->_has >> 9) & 1;
}

- (void)setMcc:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 0x80u;
  self->_mcc = a3;
}

- (void)setHasMcc:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 128;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFF7F | v3;
}

- (BOOL)hasMcc
{
  return (*(_WORD *)&self->_has >> 7) & 1;
}

- (void)setMnc:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 0x100u;
  self->_mnc = a3;
}

- (void)setHasMnc:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 256;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFEFF | v3;
}

- (BOOL)hasMnc
{
  return HIBYTE(*(_WORD *)&self->_has) & 1;
}

- (void)setFgAppActiveDuringCongestion:(BOOL)a3
{
  *(_WORD *)&self->_has |= 0x1000u;
  self->_fgAppActiveDuringCongestion = a3;
}

- (void)setHasFgAppActiveDuringCongestion:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 4096;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xEFFF | v3;
}

- (BOOL)hasFgAppActiveDuringCongestion
{
  return (*(_WORD *)&self->_has >> 12) & 1;
}

- (id)description
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)CellularLqmStateChange;
  v3 = -[CellularLqmStateChange description](&v8, "description");
  v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[CellularLqmStateChange dictionaryRepresentation](self, "dictionaryRepresentation"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@ %@"), v4, v5));

  return v6;
}

- (id)dictionaryRepresentation
{
  void *v3;
  __int16 has;
  void *v5;
  RachConnInfo *rachConnInfo;
  void *v7;
  id v8;
  NSMutableArray *v9;
  id v10;
  id v11;
  uint64_t v12;
  void *i;
  void *v14;
  id v15;
  NSMutableArray *v16;
  id v17;
  id v18;
  uint64_t v19;
  void *j;
  void *v21;
  __int16 v22;
  void *v23;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  int hiPowerEvent;
  __CFString *v31;
  void *v32;
  int hiPowerExitReason;
  __CFString *v34;
  int congestionReason;
  __CFString *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  _BYTE v49[128];
  _BYTE v50[128];

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary"));
  has = (__int16)self->_has;
  if ((has & 1) != 0)
  {
    v25 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedLongLong:](NSNumber, "numberWithUnsignedLongLong:", self->_timestamp));
    objc_msgSend(v3, "setObject:forKey:", v25, CFSTR("timestamp"));

    has = (__int16)self->_has;
    if ((has & 8) == 0)
    {
LABEL_3:
      if ((has & 0x40) == 0)
        goto LABEL_4;
      goto LABEL_41;
    }
  }
  else if ((has & 8) == 0)
  {
    goto LABEL_3;
  }
  v26 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", self->_durationSec));
  objc_msgSend(v3, "setObject:forKey:", v26, CFSTR("duration_sec"));

  has = (__int16)self->_has;
  if ((has & 0x40) == 0)
  {
LABEL_4:
    if ((has & 0x400) == 0)
      goto LABEL_5;
    goto LABEL_42;
  }
LABEL_41:
  v27 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](NSNumber, "numberWithInt:", self->_lqmType));
  objc_msgSend(v3, "setObject:forKey:", v27, CFSTR("lqm_type"));

  has = (__int16)self->_has;
  if ((has & 0x400) == 0)
  {
LABEL_5:
    if ((has & 0x2000) == 0)
      goto LABEL_7;
    goto LABEL_6;
  }
LABEL_42:
  v28 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](NSNumber, "numberWithInt:", self->_sysMode));
  objc_msgSend(v3, "setObject:forKey:", v28, CFSTR("sys_mode"));

  if ((*(_WORD *)&self->_has & 0x2000) != 0)
  {
LABEL_6:
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", self->_isScreenOn));
    objc_msgSend(v3, "setObject:forKey:", v5, CFSTR("is_screen_on"));

  }
LABEL_7:
  rachConnInfo = self->_rachConnInfo;
  if (rachConnInfo)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[RachConnInfo dictionaryRepresentation](rachConnInfo, "dictionaryRepresentation"));
    objc_msgSend(v3, "setObject:forKey:", v7, CFSTR("rach_conn_info"));

  }
  if (-[NSMutableArray count](self->_lteChanInfos, "count"))
  {
    v8 = objc_msgSend(objc_alloc((Class)NSMutableArray), "initWithCapacity:", -[NSMutableArray count](self->_lteChanInfos, "count"));
    v45 = 0u;
    v46 = 0u;
    v47 = 0u;
    v48 = 0u;
    v9 = self->_lteChanInfos;
    v10 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v9, "countByEnumeratingWithState:objects:count:", &v45, v50, 16);
    if (v10)
    {
      v11 = v10;
      v12 = *(_QWORD *)v46;
      do
      {
        for (i = 0; i != v11; i = (char *)i + 1)
        {
          if (*(_QWORD *)v46 != v12)
            objc_enumerationMutation(v9);
          v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(*((_QWORD *)&v45 + 1) + 8 * (_QWORD)i), "dictionaryRepresentation"));
          objc_msgSend(v8, "addObject:", v14);

        }
        v11 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v9, "countByEnumeratingWithState:objects:count:", &v45, v50, 16);
      }
      while (v11);
    }

    objc_msgSend(v3, "setObject:forKey:", v8, CFSTR("lte_chan_info"));
  }
  if (-[NSMutableArray count](self->_umtsChanInfos, "count"))
  {
    v15 = objc_msgSend(objc_alloc((Class)NSMutableArray), "initWithCapacity:", -[NSMutableArray count](self->_umtsChanInfos, "count"));
    v41 = 0u;
    v42 = 0u;
    v43 = 0u;
    v44 = 0u;
    v16 = self->_umtsChanInfos;
    v17 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v16, "countByEnumeratingWithState:objects:count:", &v41, v49, 16);
    if (v17)
    {
      v18 = v17;
      v19 = *(_QWORD *)v42;
      do
      {
        for (j = 0; j != v18; j = (char *)j + 1)
        {
          if (*(_QWORD *)v42 != v19)
            objc_enumerationMutation(v16);
          v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(*((_QWORD *)&v41 + 1) + 8 * (_QWORD)j), "dictionaryRepresentation"));
          objc_msgSend(v15, "addObject:", v21);

        }
        v18 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v16, "countByEnumeratingWithState:objects:count:", &v41, v49, 16);
      }
      while (v18);
    }

    objc_msgSend(v3, "setObject:forKey:", v15, CFSTR("umts_chan_info"));
  }
  v22 = (__int16)self->_has;
  if ((v22 & 0x800) != 0)
  {
    v29 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", self->_bbInHiPowerState));
    objc_msgSend(v3, "setObject:forKey:", v29, CFSTR("bb_in_hi_power_state"));

    v22 = (__int16)self->_has;
    if ((v22 & 0x10) == 0)
    {
LABEL_29:
      if ((v22 & 0x4000) == 0)
        goto LABEL_30;
      goto LABEL_58;
    }
  }
  else if ((v22 & 0x10) == 0)
  {
    goto LABEL_29;
  }
  hiPowerEvent = self->_hiPowerEvent;
  v31 = CFSTR("LQM_EVENT_RLC_MAX_RETX");
  switch(hiPowerEvent)
  {
    case 0:
      break;
    case 1:
      v31 = CFSTR("LQM_EVENT_RACH_FAILURE");
      break;
    case 2:
      v31 = CFSTR("LQM_EVENT_LTE_PHY_ABORT");
      break;
    case 3:
      v31 = CFSTR("LQM_EVENT_LTE_HI_POWER");
      break;
    case 4:
      v31 = CFSTR("LQM_EVENT_WCDMA_HI_POWER");
      break;
    case 5:
      v31 = CFSTR("LQM_EVENT_LTE_POOR_SIGNAL_CONDITION");
      break;
    case 6:
      v31 = CFSTR("LQM_EVENT_WCDMA_POOR_SIGNAL_CONDITION");
      break;
    case 7:
      v31 = CFSTR("LQM_EVENT_WCDMA_RACH_FAILURE");
      break;
    case 8:
      v31 = CFSTR("LQM_EVENT_EXCESSIVE_IRAT");
      break;
    default:
      if (hiPowerEvent == 255)
        v31 = CFSTR("LQM_EVENT_MAX");
      else
        v31 = (__CFString *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("(unknown: %i)"), self->_hiPowerEvent));
      break;
  }
  objc_msgSend(v3, "setObject:forKey:", v31, CFSTR("hi_power_event"));

  v22 = (__int16)self->_has;
  if ((v22 & 0x4000) == 0)
  {
LABEL_30:
    if ((v22 & 0x20) == 0)
      goto LABEL_31;
    goto LABEL_59;
  }
LABEL_58:
  v32 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", self->_swimWorkoutActive));
  objc_msgSend(v3, "setObject:forKey:", v32, CFSTR("swim_workout_active"));

  v22 = (__int16)self->_has;
  if ((v22 & 0x20) == 0)
  {
LABEL_31:
    if ((v22 & 4) == 0)
      goto LABEL_32;
    goto LABEL_70;
  }
LABEL_59:
  hiPowerExitReason = self->_hiPowerExitReason;
  if (hiPowerExitReason > 1)
  {
    if (hiPowerExitReason == 2)
    {
      v34 = CFSTR("LQM_HPM_EXIT_REASON_USER_ACTIVITY");
      goto LABEL_69;
    }
    if (hiPowerExitReason == 255)
    {
      v34 = CFSTR("LQM_HPM_EXIT_REASON_MAX");
      goto LABEL_69;
    }
  }
  else
  {
    if (!hiPowerExitReason)
    {
      v34 = CFSTR("LQM_HPM_EXIT_REASON_GUARD_TIMER_EXPIRY");
      goto LABEL_69;
    }
    if (hiPowerExitReason == 1)
    {
      v34 = CFSTR("LQM_HPM_EXIT_REASON_SIGNAL_IMPROVEMENT");
      goto LABEL_69;
    }
  }
  v34 = (__CFString *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("(unknown: %i)"), self->_hiPowerExitReason));
LABEL_69:
  objc_msgSend(v3, "setObject:forKey:", v34, CFSTR("hi_power_exit_reason"));

  v22 = (__int16)self->_has;
  if ((v22 & 4) == 0)
  {
LABEL_32:
    if ((v22 & 2) == 0)
      goto LABEL_33;
    goto LABEL_81;
  }
LABEL_70:
  congestionReason = self->_congestionReason;
  v36 = CFSTR("LQM_CONGESTION_REASON_RRC_REJECT");
  switch(congestionReason)
  {
    case 0:
      break;
    case 1:
      v36 = CFSTR("LQM_CONGESTION_REASON_NAS_REJECT");
      break;
    case 2:
      v36 = CFSTR("LQM_CONGESTION_REASON_ACCESS_BARRED");
      break;
    case 3:
      v36 = CFSTR("LQM_CONGESTION_REASON_RACH_FAILURES");
      break;
    case 4:
      v36 = CFSTR("LQM_CONGESTION_REASON_TRICKLING_GRANT");
      break;
    case 5:
      v36 = CFSTR("LQM_CONGESTION_REASON_RLC_MAX_RETX");
      break;
    case 6:
      v36 = CFSTR("LQM_CONGESTION_REASON_POOR_SIGNAL_CONDITIONS");
      break;
    default:
      if (congestionReason == 255)
        v36 = CFSTR("LQM_CONGESTION_REASON_MAX");
      else
        v36 = (__CFString *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("(unknown: %i)"), self->_congestionReason));
      break;
  }
  objc_msgSend(v3, "setObject:forKey:", v36, CFSTR("congestion_reason"));

  v22 = (__int16)self->_has;
  if ((v22 & 2) == 0)
  {
LABEL_33:
    if ((v22 & 0x200) == 0)
      goto LABEL_34;
    goto LABEL_82;
  }
LABEL_81:
  v37 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", self->_cellId));
  objc_msgSend(v3, "setObject:forKey:", v37, CFSTR("cell_id"));

  v22 = (__int16)self->_has;
  if ((v22 & 0x200) == 0)
  {
LABEL_34:
    if ((v22 & 0x80) == 0)
      goto LABEL_35;
    goto LABEL_83;
  }
LABEL_82:
  v38 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", self->_numMncDigits));
  objc_msgSend(v3, "setObject:forKey:", v38, CFSTR("num_mnc_digits"));

  v22 = (__int16)self->_has;
  if ((v22 & 0x80) == 0)
  {
LABEL_35:
    if ((v22 & 0x100) == 0)
      goto LABEL_36;
LABEL_84:
    v40 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", self->_mnc));
    objc_msgSend(v3, "setObject:forKey:", v40, CFSTR("mnc"));

    if ((*(_WORD *)&self->_has & 0x1000) == 0)
      return v3;
    goto LABEL_37;
  }
LABEL_83:
  v39 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", self->_mcc));
  objc_msgSend(v3, "setObject:forKey:", v39, CFSTR("mcc"));

  v22 = (__int16)self->_has;
  if ((v22 & 0x100) != 0)
    goto LABEL_84;
LABEL_36:
  if ((v22 & 0x1000) != 0)
  {
LABEL_37:
    v23 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", self->_fgAppActiveDuringCongestion));
    objc_msgSend(v3, "setObject:forKey:", v23, CFSTR("fg_app_active_during_congestion"));

  }
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return sub_10008CA4C((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4;
  void *v5;
  __int16 has;
  RachConnInfo *rachConnInfo;
  NSMutableArray *v8;
  id v9;
  id v10;
  uint64_t v11;
  void *i;
  NSMutableArray *v13;
  id v14;
  id v15;
  uint64_t v16;
  void *j;
  __int16 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  _BYTE v27[128];
  _BYTE v28[128];

  v4 = a3;
  v5 = v4;
  has = (__int16)self->_has;
  if ((has & 1) != 0)
  {
    PBDataWriterWriteUint64Field(v4, self->_timestamp, 1);
    has = (__int16)self->_has;
    if ((has & 8) == 0)
    {
LABEL_3:
      if ((has & 0x40) == 0)
        goto LABEL_4;
      goto LABEL_37;
    }
  }
  else if ((has & 8) == 0)
  {
    goto LABEL_3;
  }
  PBDataWriterWriteUint32Field(v5, self->_durationSec, 3);
  has = (__int16)self->_has;
  if ((has & 0x40) == 0)
  {
LABEL_4:
    if ((has & 0x400) == 0)
      goto LABEL_5;
    goto LABEL_38;
  }
LABEL_37:
  PBDataWriterWriteInt32Field(v5, self->_lqmType, 4);
  has = (__int16)self->_has;
  if ((has & 0x400) == 0)
  {
LABEL_5:
    if ((has & 0x2000) == 0)
      goto LABEL_7;
    goto LABEL_6;
  }
LABEL_38:
  PBDataWriterWriteInt32Field(v5, self->_sysMode, 5);
  if ((*(_WORD *)&self->_has & 0x2000) != 0)
LABEL_6:
    PBDataWriterWriteBOOLField(v5, self->_isScreenOn, 6);
LABEL_7:
  rachConnInfo = self->_rachConnInfo;
  if (rachConnInfo)
    PBDataWriterWriteSubmessage(v5, rachConnInfo, 8);
  v25 = 0u;
  v26 = 0u;
  v23 = 0u;
  v24 = 0u;
  v8 = self->_lteChanInfos;
  v9 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v8, "countByEnumeratingWithState:objects:count:", &v23, v28, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v24;
    do
    {
      for (i = 0; i != v10; i = (char *)i + 1)
      {
        if (*(_QWORD *)v24 != v11)
          objc_enumerationMutation(v8);
        PBDataWriterWriteSubmessage(v5, *(_QWORD *)(*((_QWORD *)&v23 + 1) + 8 * (_QWORD)i), 9);
      }
      v10 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v8, "countByEnumeratingWithState:objects:count:", &v23, v28, 16);
    }
    while (v10);
  }

  v21 = 0u;
  v22 = 0u;
  v19 = 0u;
  v20 = 0u;
  v13 = self->_umtsChanInfos;
  v14 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v13, "countByEnumeratingWithState:objects:count:", &v19, v27, 16);
  if (v14)
  {
    v15 = v14;
    v16 = *(_QWORD *)v20;
    do
    {
      for (j = 0; j != v15; j = (char *)j + 1)
      {
        if (*(_QWORD *)v20 != v16)
          objc_enumerationMutation(v13);
        PBDataWriterWriteSubmessage(v5, *(_QWORD *)(*((_QWORD *)&v19 + 1) + 8 * (_QWORD)j), 10);
      }
      v15 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v13, "countByEnumeratingWithState:objects:count:", &v19, v27, 16);
    }
    while (v15);
  }

  v18 = (__int16)self->_has;
  if ((v18 & 0x800) != 0)
  {
    PBDataWriterWriteBOOLField(v5, self->_bbInHiPowerState, 11);
    v18 = (__int16)self->_has;
    if ((v18 & 0x10) == 0)
    {
LABEL_25:
      if ((v18 & 0x4000) == 0)
        goto LABEL_26;
      goto LABEL_42;
    }
  }
  else if ((v18 & 0x10) == 0)
  {
    goto LABEL_25;
  }
  PBDataWriterWriteInt32Field(v5, self->_hiPowerEvent, 12);
  v18 = (__int16)self->_has;
  if ((v18 & 0x4000) == 0)
  {
LABEL_26:
    if ((v18 & 0x20) == 0)
      goto LABEL_27;
    goto LABEL_43;
  }
LABEL_42:
  PBDataWriterWriteBOOLField(v5, self->_swimWorkoutActive, 13);
  v18 = (__int16)self->_has;
  if ((v18 & 0x20) == 0)
  {
LABEL_27:
    if ((v18 & 4) == 0)
      goto LABEL_28;
    goto LABEL_44;
  }
LABEL_43:
  PBDataWriterWriteInt32Field(v5, self->_hiPowerExitReason, 14);
  v18 = (__int16)self->_has;
  if ((v18 & 4) == 0)
  {
LABEL_28:
    if ((v18 & 2) == 0)
      goto LABEL_29;
    goto LABEL_45;
  }
LABEL_44:
  PBDataWriterWriteInt32Field(v5, self->_congestionReason, 16);
  v18 = (__int16)self->_has;
  if ((v18 & 2) == 0)
  {
LABEL_29:
    if ((v18 & 0x200) == 0)
      goto LABEL_30;
    goto LABEL_46;
  }
LABEL_45:
  PBDataWriterWriteUint32Field(v5, self->_cellId, 17);
  v18 = (__int16)self->_has;
  if ((v18 & 0x200) == 0)
  {
LABEL_30:
    if ((v18 & 0x80) == 0)
      goto LABEL_31;
    goto LABEL_47;
  }
LABEL_46:
  PBDataWriterWriteUint32Field(v5, self->_numMncDigits, 18);
  v18 = (__int16)self->_has;
  if ((v18 & 0x80) == 0)
  {
LABEL_31:
    if ((v18 & 0x100) == 0)
      goto LABEL_32;
LABEL_48:
    PBDataWriterWriteUint32Field(v5, self->_mnc, 20);
    if ((*(_WORD *)&self->_has & 0x1000) == 0)
      goto LABEL_34;
    goto LABEL_33;
  }
LABEL_47:
  PBDataWriterWriteUint32Field(v5, self->_mcc, 19);
  v18 = (__int16)self->_has;
  if ((v18 & 0x100) != 0)
    goto LABEL_48;
LABEL_32:
  if ((v18 & 0x1000) != 0)
LABEL_33:
    PBDataWriterWriteBOOLField(v5, self->_fgAppActiveDuringCongestion, 21);
LABEL_34:

}

- (void)copyTo:(id)a3
{
  _QWORD *v4;
  __int16 has;
  unint64_t v6;
  unint64_t v7;
  uint64_t i;
  void *v9;
  unint64_t v10;
  unint64_t v11;
  uint64_t j;
  void *v13;
  __int16 v14;
  id v15;

  v4 = a3;
  has = (__int16)self->_has;
  if ((has & 1) != 0)
  {
    v4[1] = self->_timestamp;
    *((_WORD *)v4 + 46) |= 1u;
    has = (__int16)self->_has;
    if ((has & 8) == 0)
    {
LABEL_3:
      if ((has & 0x40) == 0)
        goto LABEL_4;
      goto LABEL_31;
    }
  }
  else if ((has & 8) == 0)
  {
    goto LABEL_3;
  }
  *((_DWORD *)v4 + 6) = self->_durationSec;
  *((_WORD *)v4 + 46) |= 8u;
  has = (__int16)self->_has;
  if ((has & 0x40) == 0)
  {
LABEL_4:
    if ((has & 0x400) == 0)
      goto LABEL_5;
    goto LABEL_32;
  }
LABEL_31:
  *((_DWORD *)v4 + 9) = self->_lqmType;
  *((_WORD *)v4 + 46) |= 0x40u;
  has = (__int16)self->_has;
  if ((has & 0x400) == 0)
  {
LABEL_5:
    if ((has & 0x2000) == 0)
      goto LABEL_7;
    goto LABEL_6;
  }
LABEL_32:
  *((_DWORD *)v4 + 18) = self->_sysMode;
  *((_WORD *)v4 + 46) |= 0x400u;
  if ((*(_WORD *)&self->_has & 0x2000) != 0)
  {
LABEL_6:
    *((_BYTE *)v4 + 90) = self->_isScreenOn;
    *((_WORD *)v4 + 46) |= 0x2000u;
  }
LABEL_7:
  v15 = v4;
  if (self->_rachConnInfo)
    objc_msgSend(v4, "setRachConnInfo:");
  if (-[CellularLqmStateChange lteChanInfosCount](self, "lteChanInfosCount"))
  {
    objc_msgSend(v15, "clearLteChanInfos");
    v6 = -[CellularLqmStateChange lteChanInfosCount](self, "lteChanInfosCount");
    if (v6)
    {
      v7 = v6;
      for (i = 0; i != v7; ++i)
      {
        v9 = (void *)objc_claimAutoreleasedReturnValue(-[CellularLqmStateChange lteChanInfoAtIndex:](self, "lteChanInfoAtIndex:", i));
        objc_msgSend(v15, "addLteChanInfo:", v9);

      }
    }
  }
  if (-[CellularLqmStateChange umtsChanInfosCount](self, "umtsChanInfosCount"))
  {
    objc_msgSend(v15, "clearUmtsChanInfos");
    v10 = -[CellularLqmStateChange umtsChanInfosCount](self, "umtsChanInfosCount");
    if (v10)
    {
      v11 = v10;
      for (j = 0; j != v11; ++j)
      {
        v13 = (void *)objc_claimAutoreleasedReturnValue(-[CellularLqmStateChange umtsChanInfoAtIndex:](self, "umtsChanInfoAtIndex:", j));
        objc_msgSend(v15, "addUmtsChanInfo:", v13);

      }
    }
  }
  v14 = (__int16)self->_has;
  if ((v14 & 0x800) != 0)
  {
    *((_BYTE *)v15 + 88) = self->_bbInHiPowerState;
    *((_WORD *)v15 + 46) |= 0x800u;
    v14 = (__int16)self->_has;
    if ((v14 & 0x10) == 0)
    {
LABEL_19:
      if ((v14 & 0x4000) == 0)
        goto LABEL_20;
      goto LABEL_36;
    }
  }
  else if ((v14 & 0x10) == 0)
  {
    goto LABEL_19;
  }
  *((_DWORD *)v15 + 7) = self->_hiPowerEvent;
  *((_WORD *)v15 + 46) |= 0x10u;
  v14 = (__int16)self->_has;
  if ((v14 & 0x4000) == 0)
  {
LABEL_20:
    if ((v14 & 0x20) == 0)
      goto LABEL_21;
    goto LABEL_37;
  }
LABEL_36:
  *((_BYTE *)v15 + 91) = self->_swimWorkoutActive;
  *((_WORD *)v15 + 46) |= 0x4000u;
  v14 = (__int16)self->_has;
  if ((v14 & 0x20) == 0)
  {
LABEL_21:
    if ((v14 & 4) == 0)
      goto LABEL_22;
    goto LABEL_38;
  }
LABEL_37:
  *((_DWORD *)v15 + 8) = self->_hiPowerExitReason;
  *((_WORD *)v15 + 46) |= 0x20u;
  v14 = (__int16)self->_has;
  if ((v14 & 4) == 0)
  {
LABEL_22:
    if ((v14 & 2) == 0)
      goto LABEL_23;
    goto LABEL_39;
  }
LABEL_38:
  *((_DWORD *)v15 + 5) = self->_congestionReason;
  *((_WORD *)v15 + 46) |= 4u;
  v14 = (__int16)self->_has;
  if ((v14 & 2) == 0)
  {
LABEL_23:
    if ((v14 & 0x200) == 0)
      goto LABEL_24;
    goto LABEL_40;
  }
LABEL_39:
  *((_DWORD *)v15 + 4) = self->_cellId;
  *((_WORD *)v15 + 46) |= 2u;
  v14 = (__int16)self->_has;
  if ((v14 & 0x200) == 0)
  {
LABEL_24:
    if ((v14 & 0x80) == 0)
      goto LABEL_25;
    goto LABEL_41;
  }
LABEL_40:
  *((_DWORD *)v15 + 14) = self->_numMncDigits;
  *((_WORD *)v15 + 46) |= 0x200u;
  v14 = (__int16)self->_has;
  if ((v14 & 0x80) == 0)
  {
LABEL_25:
    if ((v14 & 0x100) == 0)
      goto LABEL_26;
LABEL_42:
    *((_DWORD *)v15 + 13) = self->_mnc;
    *((_WORD *)v15 + 46) |= 0x100u;
    if ((*(_WORD *)&self->_has & 0x1000) == 0)
      goto LABEL_28;
    goto LABEL_27;
  }
LABEL_41:
  *((_DWORD *)v15 + 12) = self->_mcc;
  *((_WORD *)v15 + 46) |= 0x80u;
  v14 = (__int16)self->_has;
  if ((v14 & 0x100) != 0)
    goto LABEL_42;
LABEL_26:
  if ((v14 & 0x1000) != 0)
  {
LABEL_27:
    *((_BYTE *)v15 + 89) = self->_fgAppActiveDuringCongestion;
    *((_WORD *)v15 + 46) |= 0x1000u;
  }
LABEL_28:

}

- (id)copyWithZone:(_NSZone *)a3
{
  _QWORD *v5;
  _QWORD *v6;
  __int16 has;
  id v8;
  void *v9;
  NSMutableArray *v10;
  id v11;
  id v12;
  uint64_t v13;
  void *i;
  id v15;
  NSMutableArray *v16;
  id v17;
  id v18;
  uint64_t v19;
  void *j;
  id v21;
  __int16 v22;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  _BYTE v32[128];
  _BYTE v33[128];

  v5 = objc_msgSend(objc_msgSend((id)objc_opt_class(self, a2), "allocWithZone:", a3), "init");
  v6 = v5;
  has = (__int16)self->_has;
  if ((has & 1) != 0)
  {
    v5[1] = self->_timestamp;
    *((_WORD *)v5 + 46) |= 1u;
    has = (__int16)self->_has;
    if ((has & 8) == 0)
    {
LABEL_3:
      if ((has & 0x40) == 0)
        goto LABEL_4;
      goto LABEL_35;
    }
  }
  else if ((has & 8) == 0)
  {
    goto LABEL_3;
  }
  *((_DWORD *)v5 + 6) = self->_durationSec;
  *((_WORD *)v5 + 46) |= 8u;
  has = (__int16)self->_has;
  if ((has & 0x40) == 0)
  {
LABEL_4:
    if ((has & 0x400) == 0)
      goto LABEL_5;
    goto LABEL_36;
  }
LABEL_35:
  *((_DWORD *)v5 + 9) = self->_lqmType;
  *((_WORD *)v5 + 46) |= 0x40u;
  has = (__int16)self->_has;
  if ((has & 0x400) == 0)
  {
LABEL_5:
    if ((has & 0x2000) == 0)
      goto LABEL_7;
    goto LABEL_6;
  }
LABEL_36:
  *((_DWORD *)v5 + 18) = self->_sysMode;
  *((_WORD *)v5 + 46) |= 0x400u;
  if ((*(_WORD *)&self->_has & 0x2000) != 0)
  {
LABEL_6:
    *((_BYTE *)v5 + 90) = self->_isScreenOn;
    *((_WORD *)v5 + 46) |= 0x2000u;
  }
LABEL_7:
  v8 = -[RachConnInfo copyWithZone:](self->_rachConnInfo, "copyWithZone:", a3);
  v9 = (void *)v6[8];
  v6[8] = v8;

  v30 = 0u;
  v31 = 0u;
  v28 = 0u;
  v29 = 0u;
  v10 = self->_lteChanInfos;
  v11 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v10, "countByEnumeratingWithState:objects:count:", &v28, v33, 16);
  if (v11)
  {
    v12 = v11;
    v13 = *(_QWORD *)v29;
    do
    {
      for (i = 0; i != v12; i = (char *)i + 1)
      {
        if (*(_QWORD *)v29 != v13)
          objc_enumerationMutation(v10);
        v15 = objc_msgSend(*(id *)(*((_QWORD *)&v28 + 1) + 8 * (_QWORD)i), "copyWithZone:", a3);
        objc_msgSend(v6, "addLteChanInfo:", v15);

      }
      v12 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v10, "countByEnumeratingWithState:objects:count:", &v28, v33, 16);
    }
    while (v12);
  }

  v26 = 0u;
  v27 = 0u;
  v24 = 0u;
  v25 = 0u;
  v16 = self->_umtsChanInfos;
  v17 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v16, "countByEnumeratingWithState:objects:count:", &v24, v32, 16);
  if (v17)
  {
    v18 = v17;
    v19 = *(_QWORD *)v25;
    do
    {
      for (j = 0; j != v18; j = (char *)j + 1)
      {
        if (*(_QWORD *)v25 != v19)
          objc_enumerationMutation(v16);
        v21 = objc_msgSend(*(id *)(*((_QWORD *)&v24 + 1) + 8 * (_QWORD)j), "copyWithZone:", a3, (_QWORD)v24);
        objc_msgSend(v6, "addUmtsChanInfo:", v21);

      }
      v18 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v16, "countByEnumeratingWithState:objects:count:", &v24, v32, 16);
    }
    while (v18);
  }

  v22 = (__int16)self->_has;
  if ((v22 & 0x800) != 0)
  {
    *((_BYTE *)v6 + 88) = self->_bbInHiPowerState;
    *((_WORD *)v6 + 46) |= 0x800u;
    v22 = (__int16)self->_has;
    if ((v22 & 0x10) == 0)
    {
LABEL_23:
      if ((v22 & 0x4000) == 0)
        goto LABEL_24;
      goto LABEL_40;
    }
  }
  else if ((v22 & 0x10) == 0)
  {
    goto LABEL_23;
  }
  *((_DWORD *)v6 + 7) = self->_hiPowerEvent;
  *((_WORD *)v6 + 46) |= 0x10u;
  v22 = (__int16)self->_has;
  if ((v22 & 0x4000) == 0)
  {
LABEL_24:
    if ((v22 & 0x20) == 0)
      goto LABEL_25;
    goto LABEL_41;
  }
LABEL_40:
  *((_BYTE *)v6 + 91) = self->_swimWorkoutActive;
  *((_WORD *)v6 + 46) |= 0x4000u;
  v22 = (__int16)self->_has;
  if ((v22 & 0x20) == 0)
  {
LABEL_25:
    if ((v22 & 4) == 0)
      goto LABEL_26;
    goto LABEL_42;
  }
LABEL_41:
  *((_DWORD *)v6 + 8) = self->_hiPowerExitReason;
  *((_WORD *)v6 + 46) |= 0x20u;
  v22 = (__int16)self->_has;
  if ((v22 & 4) == 0)
  {
LABEL_26:
    if ((v22 & 2) == 0)
      goto LABEL_27;
    goto LABEL_43;
  }
LABEL_42:
  *((_DWORD *)v6 + 5) = self->_congestionReason;
  *((_WORD *)v6 + 46) |= 4u;
  v22 = (__int16)self->_has;
  if ((v22 & 2) == 0)
  {
LABEL_27:
    if ((v22 & 0x200) == 0)
      goto LABEL_28;
    goto LABEL_44;
  }
LABEL_43:
  *((_DWORD *)v6 + 4) = self->_cellId;
  *((_WORD *)v6 + 46) |= 2u;
  v22 = (__int16)self->_has;
  if ((v22 & 0x200) == 0)
  {
LABEL_28:
    if ((v22 & 0x80) == 0)
      goto LABEL_29;
    goto LABEL_45;
  }
LABEL_44:
  *((_DWORD *)v6 + 14) = self->_numMncDigits;
  *((_WORD *)v6 + 46) |= 0x200u;
  v22 = (__int16)self->_has;
  if ((v22 & 0x80) == 0)
  {
LABEL_29:
    if ((v22 & 0x100) == 0)
      goto LABEL_30;
LABEL_46:
    *((_DWORD *)v6 + 13) = self->_mnc;
    *((_WORD *)v6 + 46) |= 0x100u;
    if ((*(_WORD *)&self->_has & 0x1000) == 0)
      return v6;
    goto LABEL_31;
  }
LABEL_45:
  *((_DWORD *)v6 + 12) = self->_mcc;
  *((_WORD *)v6 + 46) |= 0x80u;
  v22 = (__int16)self->_has;
  if ((v22 & 0x100) != 0)
    goto LABEL_46;
LABEL_30:
  if ((v22 & 0x1000) != 0)
  {
LABEL_31:
    *((_BYTE *)v6 + 89) = self->_fgAppActiveDuringCongestion;
    *((_WORD *)v6 + 46) |= 0x1000u;
  }
  return v6;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  uint64_t v5;
  __int16 has;
  __int16 v7;
  RachConnInfo *rachConnInfo;
  NSMutableArray *lteChanInfos;
  NSMutableArray *umtsChanInfos;
  __int16 v11;
  __int16 v12;
  BOOL v13;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class(self, v5)))
    goto LABEL_90;
  has = (__int16)self->_has;
  v7 = *((_WORD *)v4 + 46);
  if ((has & 1) != 0)
  {
    if ((v7 & 1) == 0 || self->_timestamp != *((_QWORD *)v4 + 1))
      goto LABEL_90;
  }
  else if ((v7 & 1) != 0)
  {
    goto LABEL_90;
  }
  if ((has & 8) != 0)
  {
    if ((v7 & 8) == 0 || self->_durationSec != *((_DWORD *)v4 + 6))
      goto LABEL_90;
  }
  else if ((v7 & 8) != 0)
  {
    goto LABEL_90;
  }
  if ((has & 0x40) != 0)
  {
    if ((v7 & 0x40) == 0 || self->_lqmType != *((_DWORD *)v4 + 9))
      goto LABEL_90;
  }
  else if ((v7 & 0x40) != 0)
  {
    goto LABEL_90;
  }
  if ((*(_WORD *)&self->_has & 0x400) != 0)
  {
    if ((*((_WORD *)v4 + 46) & 0x400) == 0 || self->_sysMode != *((_DWORD *)v4 + 18))
      goto LABEL_90;
  }
  else if ((*((_WORD *)v4 + 46) & 0x400) != 0)
  {
    goto LABEL_90;
  }
  if ((*(_WORD *)&self->_has & 0x2000) != 0)
  {
    if ((*((_WORD *)v4 + 46) & 0x2000) == 0)
      goto LABEL_90;
    if (self->_isScreenOn)
    {
      if (!*((_BYTE *)v4 + 90))
        goto LABEL_90;
    }
    else if (*((_BYTE *)v4 + 90))
    {
      goto LABEL_90;
    }
  }
  else if ((*((_WORD *)v4 + 46) & 0x2000) != 0)
  {
    goto LABEL_90;
  }
  rachConnInfo = self->_rachConnInfo;
  if ((unint64_t)rachConnInfo | *((_QWORD *)v4 + 8) && !-[RachConnInfo isEqual:](rachConnInfo, "isEqual:"))
    goto LABEL_90;
  lteChanInfos = self->_lteChanInfos;
  if ((unint64_t)lteChanInfos | *((_QWORD *)v4 + 5))
  {
    if (!-[NSMutableArray isEqual:](lteChanInfos, "isEqual:"))
      goto LABEL_90;
  }
  umtsChanInfos = self->_umtsChanInfos;
  if ((unint64_t)umtsChanInfos | *((_QWORD *)v4 + 10))
  {
    if (!-[NSMutableArray isEqual:](umtsChanInfos, "isEqual:"))
      goto LABEL_90;
  }
  v11 = (__int16)self->_has;
  v12 = *((_WORD *)v4 + 46);
  if ((v11 & 0x800) != 0)
  {
    if ((*((_WORD *)v4 + 46) & 0x800) == 0)
      goto LABEL_90;
    if (self->_bbInHiPowerState)
    {
      if (!*((_BYTE *)v4 + 88))
        goto LABEL_90;
    }
    else if (*((_BYTE *)v4 + 88))
    {
      goto LABEL_90;
    }
  }
  else if ((*((_WORD *)v4 + 46) & 0x800) != 0)
  {
    goto LABEL_90;
  }
  if ((v11 & 0x10) != 0)
  {
    if ((v12 & 0x10) == 0 || self->_hiPowerEvent != *((_DWORD *)v4 + 7))
      goto LABEL_90;
  }
  else if ((v12 & 0x10) != 0)
  {
    goto LABEL_90;
  }
  if ((*(_WORD *)&self->_has & 0x4000) != 0)
  {
    if ((*((_WORD *)v4 + 46) & 0x4000) == 0)
      goto LABEL_90;
    if (self->_swimWorkoutActive)
    {
      if (!*((_BYTE *)v4 + 91))
        goto LABEL_90;
    }
    else if (*((_BYTE *)v4 + 91))
    {
      goto LABEL_90;
    }
  }
  else if ((*((_WORD *)v4 + 46) & 0x4000) != 0)
  {
    goto LABEL_90;
  }
  if ((v11 & 0x20) != 0)
  {
    if ((v12 & 0x20) == 0 || self->_hiPowerExitReason != *((_DWORD *)v4 + 8))
      goto LABEL_90;
  }
  else if ((v12 & 0x20) != 0)
  {
    goto LABEL_90;
  }
  if ((v11 & 4) != 0)
  {
    if ((v12 & 4) == 0 || self->_congestionReason != *((_DWORD *)v4 + 5))
      goto LABEL_90;
  }
  else if ((v12 & 4) != 0)
  {
    goto LABEL_90;
  }
  if ((v11 & 2) != 0)
  {
    if ((v12 & 2) == 0 || self->_cellId != *((_DWORD *)v4 + 4))
      goto LABEL_90;
  }
  else if ((v12 & 2) != 0)
  {
    goto LABEL_90;
  }
  if ((*(_WORD *)&self->_has & 0x200) != 0)
  {
    if ((*((_WORD *)v4 + 46) & 0x200) == 0 || self->_numMncDigits != *((_DWORD *)v4 + 14))
      goto LABEL_90;
  }
  else if ((*((_WORD *)v4 + 46) & 0x200) != 0)
  {
    goto LABEL_90;
  }
  if ((v11 & 0x80) != 0)
  {
    if ((v12 & 0x80) == 0 || self->_mcc != *((_DWORD *)v4 + 12))
      goto LABEL_90;
  }
  else if ((v12 & 0x80) != 0)
  {
    goto LABEL_90;
  }
  if ((*(_WORD *)&self->_has & 0x100) != 0)
  {
    if ((*((_WORD *)v4 + 46) & 0x100) == 0 || self->_mnc != *((_DWORD *)v4 + 13))
      goto LABEL_90;
  }
  else if ((*((_WORD *)v4 + 46) & 0x100) != 0)
  {
    goto LABEL_90;
  }
  if ((*(_WORD *)&self->_has & 0x1000) != 0)
  {
    if ((*((_WORD *)v4 + 46) & 0x1000) != 0)
    {
      if (self->_fgAppActiveDuringCongestion)
      {
        if (!*((_BYTE *)v4 + 89))
          goto LABEL_90;
      }
      else if (*((_BYTE *)v4 + 89))
      {
        goto LABEL_90;
      }
      v13 = 1;
      goto LABEL_91;
    }
LABEL_90:
    v13 = 0;
    goto LABEL_91;
  }
  v13 = (v12 & 0x1000) == 0;
LABEL_91:

  return v13;
}

- (unint64_t)hash
{
  __int16 has;
  unint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  unint64_t v9;
  unint64_t v10;
  unint64_t v11;
  __int16 v12;
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

  has = (__int16)self->_has;
  if ((has & 1) != 0)
  {
    v4 = 2654435761u * self->_timestamp;
    if ((has & 8) != 0)
    {
LABEL_3:
      v5 = 2654435761 * self->_durationSec;
      if ((has & 0x40) != 0)
        goto LABEL_4;
      goto LABEL_9;
    }
  }
  else
  {
    v4 = 0;
    if ((has & 8) != 0)
      goto LABEL_3;
  }
  v5 = 0;
  if ((has & 0x40) != 0)
  {
LABEL_4:
    v6 = 2654435761 * self->_lqmType;
    if ((*(_WORD *)&self->_has & 0x400) != 0)
      goto LABEL_5;
LABEL_10:
    v7 = 0;
    if ((*(_WORD *)&self->_has & 0x2000) != 0)
      goto LABEL_6;
    goto LABEL_11;
  }
LABEL_9:
  v6 = 0;
  if ((*(_WORD *)&self->_has & 0x400) == 0)
    goto LABEL_10;
LABEL_5:
  v7 = 2654435761 * self->_sysMode;
  if ((*(_WORD *)&self->_has & 0x2000) != 0)
  {
LABEL_6:
    v8 = 2654435761 * self->_isScreenOn;
    goto LABEL_12;
  }
LABEL_11:
  v8 = 0;
LABEL_12:
  v9 = -[RachConnInfo hash](self->_rachConnInfo, "hash");
  v10 = (unint64_t)-[NSMutableArray hash](self->_lteChanInfos, "hash");
  v11 = (unint64_t)-[NSMutableArray hash](self->_umtsChanInfos, "hash");
  v12 = (__int16)self->_has;
  if ((v12 & 0x800) != 0)
  {
    v13 = 2654435761 * self->_bbInHiPowerState;
    if ((v12 & 0x10) != 0)
    {
LABEL_14:
      v14 = 2654435761 * self->_hiPowerEvent;
      if ((*(_WORD *)&self->_has & 0x4000) != 0)
        goto LABEL_15;
      goto LABEL_25;
    }
  }
  else
  {
    v13 = 0;
    if ((v12 & 0x10) != 0)
      goto LABEL_14;
  }
  v14 = 0;
  if ((*(_WORD *)&self->_has & 0x4000) != 0)
  {
LABEL_15:
    v15 = 2654435761 * self->_swimWorkoutActive;
    if ((v12 & 0x20) != 0)
      goto LABEL_16;
    goto LABEL_26;
  }
LABEL_25:
  v15 = 0;
  if ((v12 & 0x20) != 0)
  {
LABEL_16:
    v16 = 2654435761 * self->_hiPowerExitReason;
    if ((v12 & 4) != 0)
      goto LABEL_17;
    goto LABEL_27;
  }
LABEL_26:
  v16 = 0;
  if ((v12 & 4) != 0)
  {
LABEL_17:
    v17 = 2654435761 * self->_congestionReason;
    if ((v12 & 2) != 0)
      goto LABEL_18;
    goto LABEL_28;
  }
LABEL_27:
  v17 = 0;
  if ((v12 & 2) != 0)
  {
LABEL_18:
    v18 = 2654435761 * self->_cellId;
    if ((*(_WORD *)&self->_has & 0x200) != 0)
      goto LABEL_19;
    goto LABEL_29;
  }
LABEL_28:
  v18 = 0;
  if ((*(_WORD *)&self->_has & 0x200) != 0)
  {
LABEL_19:
    v19 = 2654435761 * self->_numMncDigits;
    if ((v12 & 0x80) != 0)
      goto LABEL_20;
    goto LABEL_30;
  }
LABEL_29:
  v19 = 0;
  if ((v12 & 0x80) != 0)
  {
LABEL_20:
    v20 = 2654435761 * self->_mcc;
    if ((*(_WORD *)&self->_has & 0x100) != 0)
      goto LABEL_21;
LABEL_31:
    v21 = 0;
    if ((*(_WORD *)&self->_has & 0x1000) != 0)
      goto LABEL_22;
LABEL_32:
    v22 = 0;
    return v5 ^ v4 ^ v6 ^ v7 ^ v8 ^ v9 ^ v10 ^ v11 ^ v13 ^ v14 ^ v15 ^ v16 ^ v17 ^ v18 ^ v19 ^ v20 ^ v21 ^ v22;
  }
LABEL_30:
  v20 = 0;
  if ((*(_WORD *)&self->_has & 0x100) == 0)
    goto LABEL_31;
LABEL_21:
  v21 = 2654435761 * self->_mnc;
  if ((*(_WORD *)&self->_has & 0x1000) == 0)
    goto LABEL_32;
LABEL_22:
  v22 = 2654435761 * self->_fgAppActiveDuringCongestion;
  return v5 ^ v4 ^ v6 ^ v7 ^ v8 ^ v9 ^ v10 ^ v11 ^ v13 ^ v14 ^ v15 ^ v16 ^ v17 ^ v18 ^ v19 ^ v20 ^ v21 ^ v22;
}

- (void)mergeFrom:(id)a3
{
  id v4;
  id v5;
  __int16 v6;
  RachConnInfo *rachConnInfo;
  uint64_t v8;
  id v9;
  id v10;
  id v11;
  uint64_t v12;
  void *i;
  id v14;
  id v15;
  id v16;
  uint64_t v17;
  void *j;
  __int16 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  _BYTE v28[128];
  _BYTE v29[128];

  v4 = a3;
  v5 = v4;
  v6 = *((_WORD *)v4 + 46);
  if ((v6 & 1) != 0)
  {
    self->_timestamp = *((_QWORD *)v4 + 1);
    *(_WORD *)&self->_has |= 1u;
    v6 = *((_WORD *)v4 + 46);
    if ((v6 & 8) == 0)
    {
LABEL_3:
      if ((v6 & 0x40) == 0)
        goto LABEL_4;
      goto LABEL_12;
    }
  }
  else if ((v6 & 8) == 0)
  {
    goto LABEL_3;
  }
  self->_durationSec = *((_DWORD *)v4 + 6);
  *(_WORD *)&self->_has |= 8u;
  v6 = *((_WORD *)v4 + 46);
  if ((v6 & 0x40) == 0)
  {
LABEL_4:
    if ((v6 & 0x400) == 0)
      goto LABEL_5;
    goto LABEL_13;
  }
LABEL_12:
  self->_lqmType = *((_DWORD *)v4 + 9);
  *(_WORD *)&self->_has |= 0x40u;
  v6 = *((_WORD *)v4 + 46);
  if ((v6 & 0x400) == 0)
  {
LABEL_5:
    if ((v6 & 0x2000) == 0)
      goto LABEL_7;
    goto LABEL_6;
  }
LABEL_13:
  self->_sysMode = *((_DWORD *)v4 + 18);
  *(_WORD *)&self->_has |= 0x400u;
  if ((*((_WORD *)v4 + 46) & 0x2000) != 0)
  {
LABEL_6:
    self->_isScreenOn = *((_BYTE *)v4 + 90);
    *(_WORD *)&self->_has |= 0x2000u;
  }
LABEL_7:
  rachConnInfo = self->_rachConnInfo;
  v8 = *((_QWORD *)v5 + 8);
  if (rachConnInfo)
  {
    if (v8)
      -[RachConnInfo mergeFrom:](rachConnInfo, "mergeFrom:");
  }
  else if (v8)
  {
    -[CellularLqmStateChange setRachConnInfo:](self, "setRachConnInfo:");
  }
  v26 = 0u;
  v27 = 0u;
  v24 = 0u;
  v25 = 0u;
  v9 = *((id *)v5 + 5);
  v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v24, v29, 16);
  if (v10)
  {
    v11 = v10;
    v12 = *(_QWORD *)v25;
    do
    {
      for (i = 0; i != v11; i = (char *)i + 1)
      {
        if (*(_QWORD *)v25 != v12)
          objc_enumerationMutation(v9);
        -[CellularLqmStateChange addLteChanInfo:](self, "addLteChanInfo:", *(_QWORD *)(*((_QWORD *)&v24 + 1) + 8 * (_QWORD)i));
      }
      v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v24, v29, 16);
    }
    while (v11);
  }

  v22 = 0u;
  v23 = 0u;
  v20 = 0u;
  v21 = 0u;
  v14 = *((id *)v5 + 10);
  v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v20, v28, 16);
  if (v15)
  {
    v16 = v15;
    v17 = *(_QWORD *)v21;
    do
    {
      for (j = 0; j != v16; j = (char *)j + 1)
      {
        if (*(_QWORD *)v21 != v17)
          objc_enumerationMutation(v14);
        -[CellularLqmStateChange addUmtsChanInfo:](self, "addUmtsChanInfo:", *(_QWORD *)(*((_QWORD *)&v20 + 1) + 8 * (_QWORD)j), (_QWORD)v20);
      }
      v16 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v20, v28, 16);
    }
    while (v16);
  }

  v19 = *((_WORD *)v5 + 46);
  if ((v19 & 0x800) != 0)
  {
    self->_bbInHiPowerState = *((_BYTE *)v5 + 88);
    *(_WORD *)&self->_has |= 0x800u;
    v19 = *((_WORD *)v5 + 46);
    if ((v19 & 0x10) == 0)
    {
LABEL_33:
      if ((v19 & 0x4000) == 0)
        goto LABEL_34;
      goto LABEL_45;
    }
  }
  else if ((v19 & 0x10) == 0)
  {
    goto LABEL_33;
  }
  self->_hiPowerEvent = *((_DWORD *)v5 + 7);
  *(_WORD *)&self->_has |= 0x10u;
  v19 = *((_WORD *)v5 + 46);
  if ((v19 & 0x4000) == 0)
  {
LABEL_34:
    if ((v19 & 0x20) == 0)
      goto LABEL_35;
    goto LABEL_46;
  }
LABEL_45:
  self->_swimWorkoutActive = *((_BYTE *)v5 + 91);
  *(_WORD *)&self->_has |= 0x4000u;
  v19 = *((_WORD *)v5 + 46);
  if ((v19 & 0x20) == 0)
  {
LABEL_35:
    if ((v19 & 4) == 0)
      goto LABEL_36;
    goto LABEL_47;
  }
LABEL_46:
  self->_hiPowerExitReason = *((_DWORD *)v5 + 8);
  *(_WORD *)&self->_has |= 0x20u;
  v19 = *((_WORD *)v5 + 46);
  if ((v19 & 4) == 0)
  {
LABEL_36:
    if ((v19 & 2) == 0)
      goto LABEL_37;
    goto LABEL_48;
  }
LABEL_47:
  self->_congestionReason = *((_DWORD *)v5 + 5);
  *(_WORD *)&self->_has |= 4u;
  v19 = *((_WORD *)v5 + 46);
  if ((v19 & 2) == 0)
  {
LABEL_37:
    if ((v19 & 0x200) == 0)
      goto LABEL_38;
    goto LABEL_49;
  }
LABEL_48:
  self->_cellId = *((_DWORD *)v5 + 4);
  *(_WORD *)&self->_has |= 2u;
  v19 = *((_WORD *)v5 + 46);
  if ((v19 & 0x200) == 0)
  {
LABEL_38:
    if ((v19 & 0x80) == 0)
      goto LABEL_39;
    goto LABEL_50;
  }
LABEL_49:
  self->_numMncDigits = *((_DWORD *)v5 + 14);
  *(_WORD *)&self->_has |= 0x200u;
  v19 = *((_WORD *)v5 + 46);
  if ((v19 & 0x80) == 0)
  {
LABEL_39:
    if ((v19 & 0x100) == 0)
      goto LABEL_40;
LABEL_51:
    self->_mnc = *((_DWORD *)v5 + 13);
    *(_WORD *)&self->_has |= 0x100u;
    if ((*((_WORD *)v5 + 46) & 0x1000) == 0)
      goto LABEL_42;
    goto LABEL_41;
  }
LABEL_50:
  self->_mcc = *((_DWORD *)v5 + 12);
  *(_WORD *)&self->_has |= 0x80u;
  v19 = *((_WORD *)v5 + 46);
  if ((v19 & 0x100) != 0)
    goto LABEL_51;
LABEL_40:
  if ((v19 & 0x1000) != 0)
  {
LABEL_41:
    self->_fgAppActiveDuringCongestion = *((_BYTE *)v5 + 89);
    *(_WORD *)&self->_has |= 0x1000u;
  }
LABEL_42:

}

- (unint64_t)timestamp
{
  return self->_timestamp;
}

- (unsigned)durationSec
{
  return self->_durationSec;
}

- (int)lqmType
{
  return self->_lqmType;
}

- (int)sysMode
{
  return self->_sysMode;
}

- (BOOL)isScreenOn
{
  return self->_isScreenOn;
}

- (RachConnInfo)rachConnInfo
{
  return self->_rachConnInfo;
}

- (void)setRachConnInfo:(id)a3
{
  objc_storeStrong((id *)&self->_rachConnInfo, a3);
}

- (NSMutableArray)lteChanInfos
{
  return self->_lteChanInfos;
}

- (void)setLteChanInfos:(id)a3
{
  objc_storeStrong((id *)&self->_lteChanInfos, a3);
}

- (NSMutableArray)umtsChanInfos
{
  return self->_umtsChanInfos;
}

- (void)setUmtsChanInfos:(id)a3
{
  objc_storeStrong((id *)&self->_umtsChanInfos, a3);
}

- (BOOL)bbInHiPowerState
{
  return self->_bbInHiPowerState;
}

- (BOOL)swimWorkoutActive
{
  return self->_swimWorkoutActive;
}

- (unsigned)cellId
{
  return self->_cellId;
}

- (unsigned)numMncDigits
{
  return self->_numMncDigits;
}

- (unsigned)mcc
{
  return self->_mcc;
}

- (unsigned)mnc
{
  return self->_mnc;
}

- (BOOL)fgAppActiveDuringCongestion
{
  return self->_fgAppActiveDuringCongestion;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_umtsChanInfos, 0);
  objc_storeStrong((id *)&self->_rachConnInfo, 0);
  objc_storeStrong((id *)&self->_lteChanInfos, 0);
}

@end
