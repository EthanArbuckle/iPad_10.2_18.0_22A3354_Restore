@implementation KCellularLteRrcState

- (void)setTimestamp:(unint64_t)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_timestamp = a3;
}

- (void)setHasTimestamp:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (BOOL)hasTimestamp
{
  return *(_BYTE *)&self->_has & 1;
}

- (int)state
{
  if ((*(_BYTE *)&self->_has & 0x10) != 0)
    return self->_state;
  else
    return 0;
}

- (void)setState:(int)a3
{
  *(_BYTE *)&self->_has |= 0x10u;
  self->_state = a3;
}

- (void)setHasState:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 16;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xEF | v3;
}

- (BOOL)hasState
{
  return (*(_BYTE *)&self->_has >> 4) & 1;
}

- (id)stateAsString:(int)a3
{
  if (a3 >= 7)
    return (id)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("(unknown: %i)"), *(_QWORD *)&a3));
  else
    return off_10025FFB0[a3];
}

- (int)StringAsState:(id)a3
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

- (int)prevState
{
  if ((*(_BYTE *)&self->_has & 4) != 0)
    return self->_prevState;
  else
    return 0;
}

- (void)setPrevState:(int)a3
{
  *(_BYTE *)&self->_has |= 4u;
  self->_prevState = a3;
}

- (void)setHasPrevState:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 4;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFB | v3;
}

- (BOOL)hasPrevState
{
  return (*(_BYTE *)&self->_has >> 2) & 1;
}

- (id)prevStateAsString:(int)a3
{
  if (a3 >= 7)
    return (id)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("(unknown: %i)"), *(_QWORD *)&a3));
  else
    return off_10025FFB0[a3];
}

- (int)StringAsPrevState:(id)a3
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

- (void)setPrevStateDurMs:(unsigned int)a3
{
  *(_BYTE *)&self->_has |= 8u;
  self->_prevStateDurMs = a3;
}

- (void)setHasPrevStateDurMs:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 8;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xF7 | v3;
}

- (BOOL)hasPrevStateDurMs
{
  return (*(_BYTE *)&self->_has >> 3) & 1;
}

- (int)cause
{
  if ((*(_BYTE *)&self->_has & 2) != 0)
    return self->_cause;
  else
    return 0;
}

- (void)setCause:(int)a3
{
  *(_BYTE *)&self->_has |= 2u;
  self->_cause = a3;
}

- (void)setHasCause:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFD | v3;
}

- (BOOL)hasCause
{
  return (*(_BYTE *)&self->_has >> 1) & 1;
}

- (id)causeAsString:(int)a3
{
  __CFString *v3;

  v3 = CFSTR("KLTE_RRC_CAUSE_EST_EMERGENCY");
  switch(a3)
  {
    case 0:
      return v3;
    case 1:
      v3 = CFSTR("KLTE_RRC_CAUSE_EST_HIGH_PRIO_ACC");
      return v3;
    case 2:
      return CFSTR("KLTE_RRC_CAUSE_EST_MT_ACC");
    case 3:
      return CFSTR("KLTE_RRC_CAUSE_EST_MO_SIGNAL");
    case 4:
      return CFSTR("KLTE_RRC_CAUSE_EST_MO_DATA");
    case 5:
      return CFSTR("KLTE_RRC_CAUSE_EST_DELAY_TOL_ACC");
    case 6:
      return CFSTR("KLTE_RRC_CAUSE_REEST_RECFG_FAIL");
    case 7:
      return CFSTR("KLTE_RRC_CAUSE_REEST_HO_FAIL");
    case 8:
      return CFSTR("KLTE_RRC_CAUSE_REEST_OTHER_FAIL");
    case 9:
      return CFSTR("KLTE_RRC_CAUSE_REL_OTHER_RECFG_FAIL");
    case 10:
      return CFSTR("KLTE_RRC_CAUSE_REL_CONN_FAIL_IRAT_RESEL");
    case 11:
      return CFSTR("KLTE_RRC_CAUSE_REL_CONN_FAIL_T311_EXP");
    case 12:
      return CFSTR("KLTE_RRC_CAUSE_REL_CONN_FAIL_CELL_NOT_SUIT");
    case 13:
      return CFSTR("KLTE_RRC_CAUSE_REL_CONN_FAIL_REEST_REJ");
    case 14:
      return CFSTR("KLTE_RRC_CAUSE_REL_LOAD_BAL_TAU_REQD");
    case 15:
      return CFSTR("KLTE_RRC_CAUSE_REL_OTHER");
    case 16:
      return CFSTR("KLTE_RRC_CAUSE_REL_CSFB_HIGH_PRIO");
    case 17:
      return CFSTR("KLTE_RRC_CAUSE_REL_T310_EXP");
    case 18:
      return CFSTR("KLTE_RRC_CAUSE_REL_RND_ACC");
    case 19:
      return CFSTR("KLTE_RRC_CAUSE_REL_MAX_RLC_RETRANS");
    case 20:
      return CFSTR("KLTE_RRC_CAUSE_REL_SUCC_MOB_FROM_EUTRAN");
    case 21:
      return CFSTR("KLTE_RRC_CAUSE_EST_SUCC_MOB_TO_EUTRAN");
    case 22:
      return CFSTR("KLTE_RRC_CAUSE_EST_FAIL_NO_RESP_FROM_CELL");
    case 23:
      return CFSTR("KLTE_RRC_CAUSE_EST_FAIL_REJ");
    case 24:
      return CFSTR("KLTE_RRC_CAUSE_EST_FAIL_CELL_RESEL");
    case 25:
      return CFSTR("KLTE_RRC_CAUSE_EST_FAIL_ABORTED");
    case 26:
      return CFSTR("KLTE_RRC_CAUSE_EST_FAIL_CELL_BARRED");
    case 27:
      return CFSTR("KLTE_RRC_CAUSE_REEST_OTHER_FAIL_T310_EXP");
    case 28:
      return CFSTR("KLTE_RRC_CAUSE_REEST_OTHER_FAIL_RND_ACC");
    case 29:
      return CFSTR("KLTE_RRC_CAUSE_REEST_OTHER_FAIL_MAX_RLC_RETX");
    case 30:
      return CFSTR("KLTE_RRC_CAUSE_REEST_OTHER_FAIL_INTEG_CHECK");
    default:
      if (a3 == 254)
        return CFSTR("KLTE_RRC_CAUSE_NO_SERVICE");
      if (a3 == 255)
        return CFSTR("KLTE_RRC_CAUSE_NA");
      v3 = (__CFString *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("(unknown: %i)"), *(_QWORD *)&a3));
      return v3;
  }
}

- (int)StringAsCause:(id)a3
{
  id v3;
  int v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("KLTE_RRC_CAUSE_EST_EMERGENCY")) & 1) != 0)
  {
    v4 = 0;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("KLTE_RRC_CAUSE_EST_HIGH_PRIO_ACC")) & 1) != 0)
  {
    v4 = 1;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("KLTE_RRC_CAUSE_EST_MT_ACC")) & 1) != 0)
  {
    v4 = 2;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("KLTE_RRC_CAUSE_EST_MO_SIGNAL")) & 1) != 0)
  {
    v4 = 3;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("KLTE_RRC_CAUSE_EST_MO_DATA")) & 1) != 0)
  {
    v4 = 4;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("KLTE_RRC_CAUSE_EST_DELAY_TOL_ACC")) & 1) != 0)
  {
    v4 = 5;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("KLTE_RRC_CAUSE_REEST_RECFG_FAIL")) & 1) != 0)
  {
    v4 = 6;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("KLTE_RRC_CAUSE_REEST_HO_FAIL")) & 1) != 0)
  {
    v4 = 7;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("KLTE_RRC_CAUSE_REEST_OTHER_FAIL")) & 1) != 0)
  {
    v4 = 8;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("KLTE_RRC_CAUSE_REL_OTHER_RECFG_FAIL")) & 1) != 0)
  {
    v4 = 9;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("KLTE_RRC_CAUSE_REL_CONN_FAIL_IRAT_RESEL")) & 1) != 0)
  {
    v4 = 10;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("KLTE_RRC_CAUSE_REL_CONN_FAIL_T311_EXP")) & 1) != 0)
  {
    v4 = 11;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("KLTE_RRC_CAUSE_REL_CONN_FAIL_CELL_NOT_SUIT")) & 1) != 0)
  {
    v4 = 12;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("KLTE_RRC_CAUSE_REL_CONN_FAIL_REEST_REJ")) & 1) != 0)
  {
    v4 = 13;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("KLTE_RRC_CAUSE_REL_LOAD_BAL_TAU_REQD")) & 1) != 0)
  {
    v4 = 14;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("KLTE_RRC_CAUSE_REL_OTHER")) & 1) != 0)
  {
    v4 = 15;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("KLTE_RRC_CAUSE_REL_CSFB_HIGH_PRIO")) & 1) != 0)
  {
    v4 = 16;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("KLTE_RRC_CAUSE_REL_T310_EXP")) & 1) != 0)
  {
    v4 = 17;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("KLTE_RRC_CAUSE_REL_RND_ACC")) & 1) != 0)
  {
    v4 = 18;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("KLTE_RRC_CAUSE_REL_MAX_RLC_RETRANS")) & 1) != 0)
  {
    v4 = 19;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("KLTE_RRC_CAUSE_REL_SUCC_MOB_FROM_EUTRAN")) & 1) != 0)
  {
    v4 = 20;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("KLTE_RRC_CAUSE_EST_SUCC_MOB_TO_EUTRAN")) & 1) != 0)
  {
    v4 = 21;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("KLTE_RRC_CAUSE_EST_FAIL_NO_RESP_FROM_CELL")) & 1) != 0)
  {
    v4 = 22;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("KLTE_RRC_CAUSE_EST_FAIL_REJ")) & 1) != 0)
  {
    v4 = 23;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("KLTE_RRC_CAUSE_EST_FAIL_CELL_RESEL")) & 1) != 0)
  {
    v4 = 24;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("KLTE_RRC_CAUSE_EST_FAIL_ABORTED")) & 1) != 0)
  {
    v4 = 25;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("KLTE_RRC_CAUSE_EST_FAIL_CELL_BARRED")) & 1) != 0)
  {
    v4 = 26;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("KLTE_RRC_CAUSE_REEST_OTHER_FAIL_T310_EXP")) & 1) != 0)
  {
    v4 = 27;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("KLTE_RRC_CAUSE_REEST_OTHER_FAIL_RND_ACC")) & 1) != 0)
  {
    v4 = 28;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("KLTE_RRC_CAUSE_REEST_OTHER_FAIL_MAX_RLC_RETX")) & 1) != 0)
  {
    v4 = 29;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("KLTE_RRC_CAUSE_REEST_OTHER_FAIL_INTEG_CHECK")) & 1) != 0)
  {
    v4 = 30;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("KLTE_RRC_CAUSE_NO_SERVICE")) & 1) != 0)
  {
    v4 = 254;
  }
  else if (objc_msgSend(v3, "isEqualToString:", CFSTR("KLTE_RRC_CAUSE_NA")))
  {
    v4 = 255;
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (void)setSubsId:(unsigned int)a3
{
  *(_BYTE *)&self->_has |= 0x20u;
  self->_subsId = a3;
}

- (void)setHasSubsId:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 32;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xDF | v3;
}

- (BOOL)hasSubsId
{
  return (*(_BYTE *)&self->_has >> 5) & 1;
}

- (id)description
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)KCellularLteRrcState;
  v3 = -[KCellularLteRrcState description](&v8, "description");
  v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[KCellularLteRrcState dictionaryRepresentation](self, "dictionaryRepresentation"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@ %@"), v4, v5));

  return v6;
}

- (id)dictionaryRepresentation
{
  void *v3;
  char has;
  void *v5;
  void *v7;
  uint64_t state;
  __CFString *v9;
  uint64_t prevState;
  __CFString *v11;
  void *v12;
  int cause;
  __CFString *v14;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary"));
  has = (char)self->_has;
  if ((has & 1) != 0)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedLongLong:](NSNumber, "numberWithUnsignedLongLong:", self->_timestamp));
    objc_msgSend(v3, "setObject:forKey:", v7, CFSTR("timestamp"));

    has = (char)self->_has;
    if ((has & 0x10) == 0)
    {
LABEL_3:
      if ((has & 4) == 0)
        goto LABEL_4;
      goto LABEL_14;
    }
  }
  else if ((*(_BYTE *)&self->_has & 0x10) == 0)
  {
    goto LABEL_3;
  }
  state = self->_state;
  if (state >= 7)
    v9 = (__CFString *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("(unknown: %i)"), self->_state));
  else
    v9 = off_10025FFB0[state];
  objc_msgSend(v3, "setObject:forKey:", v9, CFSTR("state"));

  has = (char)self->_has;
  if ((has & 4) == 0)
  {
LABEL_4:
    if ((has & 8) == 0)
      goto LABEL_5;
    goto LABEL_18;
  }
LABEL_14:
  prevState = self->_prevState;
  if (prevState >= 7)
    v11 = (__CFString *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("(unknown: %i)"), self->_prevState));
  else
    v11 = off_10025FFB0[prevState];
  objc_msgSend(v3, "setObject:forKey:", v11, CFSTR("prev_state"));

  has = (char)self->_has;
  if ((has & 8) == 0)
  {
LABEL_5:
    if ((has & 2) == 0)
      goto LABEL_6;
LABEL_19:
    cause = self->_cause;
    v14 = CFSTR("KLTE_RRC_CAUSE_EST_EMERGENCY");
    switch(cause)
    {
      case 0:
        break;
      case 1:
        v14 = CFSTR("KLTE_RRC_CAUSE_EST_HIGH_PRIO_ACC");
        break;
      case 2:
        v14 = CFSTR("KLTE_RRC_CAUSE_EST_MT_ACC");
        break;
      case 3:
        v14 = CFSTR("KLTE_RRC_CAUSE_EST_MO_SIGNAL");
        break;
      case 4:
        v14 = CFSTR("KLTE_RRC_CAUSE_EST_MO_DATA");
        break;
      case 5:
        v14 = CFSTR("KLTE_RRC_CAUSE_EST_DELAY_TOL_ACC");
        break;
      case 6:
        v14 = CFSTR("KLTE_RRC_CAUSE_REEST_RECFG_FAIL");
        break;
      case 7:
        v14 = CFSTR("KLTE_RRC_CAUSE_REEST_HO_FAIL");
        break;
      case 8:
        v14 = CFSTR("KLTE_RRC_CAUSE_REEST_OTHER_FAIL");
        break;
      case 9:
        v14 = CFSTR("KLTE_RRC_CAUSE_REL_OTHER_RECFG_FAIL");
        break;
      case 10:
        v14 = CFSTR("KLTE_RRC_CAUSE_REL_CONN_FAIL_IRAT_RESEL");
        break;
      case 11:
        v14 = CFSTR("KLTE_RRC_CAUSE_REL_CONN_FAIL_T311_EXP");
        break;
      case 12:
        v14 = CFSTR("KLTE_RRC_CAUSE_REL_CONN_FAIL_CELL_NOT_SUIT");
        break;
      case 13:
        v14 = CFSTR("KLTE_RRC_CAUSE_REL_CONN_FAIL_REEST_REJ");
        break;
      case 14:
        v14 = CFSTR("KLTE_RRC_CAUSE_REL_LOAD_BAL_TAU_REQD");
        break;
      case 15:
        v14 = CFSTR("KLTE_RRC_CAUSE_REL_OTHER");
        break;
      case 16:
        v14 = CFSTR("KLTE_RRC_CAUSE_REL_CSFB_HIGH_PRIO");
        break;
      case 17:
        v14 = CFSTR("KLTE_RRC_CAUSE_REL_T310_EXP");
        break;
      case 18:
        v14 = CFSTR("KLTE_RRC_CAUSE_REL_RND_ACC");
        break;
      case 19:
        v14 = CFSTR("KLTE_RRC_CAUSE_REL_MAX_RLC_RETRANS");
        break;
      case 20:
        v14 = CFSTR("KLTE_RRC_CAUSE_REL_SUCC_MOB_FROM_EUTRAN");
        break;
      case 21:
        v14 = CFSTR("KLTE_RRC_CAUSE_EST_SUCC_MOB_TO_EUTRAN");
        break;
      case 22:
        v14 = CFSTR("KLTE_RRC_CAUSE_EST_FAIL_NO_RESP_FROM_CELL");
        break;
      case 23:
        v14 = CFSTR("KLTE_RRC_CAUSE_EST_FAIL_REJ");
        break;
      case 24:
        v14 = CFSTR("KLTE_RRC_CAUSE_EST_FAIL_CELL_RESEL");
        break;
      case 25:
        v14 = CFSTR("KLTE_RRC_CAUSE_EST_FAIL_ABORTED");
        break;
      case 26:
        v14 = CFSTR("KLTE_RRC_CAUSE_EST_FAIL_CELL_BARRED");
        break;
      case 27:
        v14 = CFSTR("KLTE_RRC_CAUSE_REEST_OTHER_FAIL_T310_EXP");
        break;
      case 28:
        v14 = CFSTR("KLTE_RRC_CAUSE_REEST_OTHER_FAIL_RND_ACC");
        break;
      case 29:
        v14 = CFSTR("KLTE_RRC_CAUSE_REEST_OTHER_FAIL_MAX_RLC_RETX");
        break;
      case 30:
        v14 = CFSTR("KLTE_RRC_CAUSE_REEST_OTHER_FAIL_INTEG_CHECK");
        break;
      default:
        if (cause == 254)
        {
          v14 = CFSTR("KLTE_RRC_CAUSE_NO_SERVICE");
        }
        else if (cause == 255)
        {
          v14 = CFSTR("KLTE_RRC_CAUSE_NA");
        }
        else
        {
          v14 = (__CFString *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("(unknown: %i)"), self->_cause));
        }
        break;
    }
    objc_msgSend(v3, "setObject:forKey:", v14, CFSTR("cause"));

    if ((*(_BYTE *)&self->_has & 0x20) != 0)
      goto LABEL_7;
    return v3;
  }
LABEL_18:
  v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", self->_prevStateDurMs));
  objc_msgSend(v3, "setObject:forKey:", v12, CFSTR("prev_state_dur_ms"));

  has = (char)self->_has;
  if ((has & 2) != 0)
    goto LABEL_19;
LABEL_6:
  if ((has & 0x20) != 0)
  {
LABEL_7:
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", self->_subsId));
    objc_msgSend(v3, "setObject:forKey:", v5, CFSTR("subs_id"));

  }
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return sub_10012FED0((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  char has;
  id v5;

  v5 = a3;
  has = (char)self->_has;
  if ((has & 1) != 0)
  {
    PBDataWriterWriteUint64Field(v5, self->_timestamp, 1);
    has = (char)self->_has;
    if ((has & 0x10) == 0)
    {
LABEL_3:
      if ((has & 4) == 0)
        goto LABEL_4;
      goto LABEL_11;
    }
  }
  else if ((*(_BYTE *)&self->_has & 0x10) == 0)
  {
    goto LABEL_3;
  }
  PBDataWriterWriteInt32Field(v5, self->_state, 2);
  has = (char)self->_has;
  if ((has & 4) == 0)
  {
LABEL_4:
    if ((has & 8) == 0)
      goto LABEL_5;
    goto LABEL_12;
  }
LABEL_11:
  PBDataWriterWriteInt32Field(v5, self->_prevState, 3);
  has = (char)self->_has;
  if ((has & 8) == 0)
  {
LABEL_5:
    if ((has & 2) == 0)
      goto LABEL_6;
LABEL_13:
    PBDataWriterWriteInt32Field(v5, self->_cause, 5);
    if ((*(_BYTE *)&self->_has & 0x20) == 0)
      goto LABEL_8;
    goto LABEL_7;
  }
LABEL_12:
  PBDataWriterWriteUint32Field(v5, self->_prevStateDurMs, 4);
  has = (char)self->_has;
  if ((has & 2) != 0)
    goto LABEL_13;
LABEL_6:
  if ((has & 0x20) != 0)
LABEL_7:
    PBDataWriterWriteUint32Field(v5, self->_subsId, 15);
LABEL_8:

}

- (void)copyTo:(id)a3
{
  _QWORD *v4;
  char has;

  v4 = a3;
  has = (char)self->_has;
  if ((has & 1) != 0)
  {
    v4[1] = self->_timestamp;
    *((_BYTE *)v4 + 36) |= 1u;
    has = (char)self->_has;
    if ((has & 0x10) == 0)
    {
LABEL_3:
      if ((has & 4) == 0)
        goto LABEL_4;
      goto LABEL_11;
    }
  }
  else if ((*(_BYTE *)&self->_has & 0x10) == 0)
  {
    goto LABEL_3;
  }
  *((_DWORD *)v4 + 7) = self->_state;
  *((_BYTE *)v4 + 36) |= 0x10u;
  has = (char)self->_has;
  if ((has & 4) == 0)
  {
LABEL_4:
    if ((has & 8) == 0)
      goto LABEL_5;
    goto LABEL_12;
  }
LABEL_11:
  *((_DWORD *)v4 + 5) = self->_prevState;
  *((_BYTE *)v4 + 36) |= 4u;
  has = (char)self->_has;
  if ((has & 8) == 0)
  {
LABEL_5:
    if ((has & 2) == 0)
      goto LABEL_6;
LABEL_13:
    *((_DWORD *)v4 + 4) = self->_cause;
    *((_BYTE *)v4 + 36) |= 2u;
    if ((*(_BYTE *)&self->_has & 0x20) == 0)
      goto LABEL_8;
    goto LABEL_7;
  }
LABEL_12:
  *((_DWORD *)v4 + 6) = self->_prevStateDurMs;
  *((_BYTE *)v4 + 36) |= 8u;
  has = (char)self->_has;
  if ((has & 2) != 0)
    goto LABEL_13;
LABEL_6:
  if ((has & 0x20) != 0)
  {
LABEL_7:
    *((_DWORD *)v4 + 8) = self->_subsId;
    *((_BYTE *)v4 + 36) |= 0x20u;
  }
LABEL_8:

}

- (id)copyWithZone:(_NSZone *)a3
{
  id result;
  char has;

  result = objc_msgSend(objc_msgSend((id)objc_opt_class(self, a2), "allocWithZone:", a3), "init");
  has = (char)self->_has;
  if ((has & 1) != 0)
  {
    *((_QWORD *)result + 1) = self->_timestamp;
    *((_BYTE *)result + 36) |= 1u;
    has = (char)self->_has;
    if ((has & 0x10) == 0)
    {
LABEL_3:
      if ((has & 4) == 0)
        goto LABEL_4;
      goto LABEL_11;
    }
  }
  else if ((*(_BYTE *)&self->_has & 0x10) == 0)
  {
    goto LABEL_3;
  }
  *((_DWORD *)result + 7) = self->_state;
  *((_BYTE *)result + 36) |= 0x10u;
  has = (char)self->_has;
  if ((has & 4) == 0)
  {
LABEL_4:
    if ((has & 8) == 0)
      goto LABEL_5;
    goto LABEL_12;
  }
LABEL_11:
  *((_DWORD *)result + 5) = self->_prevState;
  *((_BYTE *)result + 36) |= 4u;
  has = (char)self->_has;
  if ((has & 8) == 0)
  {
LABEL_5:
    if ((has & 2) == 0)
      goto LABEL_6;
    goto LABEL_13;
  }
LABEL_12:
  *((_DWORD *)result + 6) = self->_prevStateDurMs;
  *((_BYTE *)result + 36) |= 8u;
  has = (char)self->_has;
  if ((has & 2) == 0)
  {
LABEL_6:
    if ((has & 0x20) == 0)
      return result;
    goto LABEL_7;
  }
LABEL_13:
  *((_DWORD *)result + 4) = self->_cause;
  *((_BYTE *)result + 36) |= 2u;
  if ((*(_BYTE *)&self->_has & 0x20) == 0)
    return result;
LABEL_7:
  *((_DWORD *)result + 8) = self->_subsId;
  *((_BYTE *)result + 36) |= 0x20u;
  return result;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  uint64_t v5;
  BOOL v6;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class(self, v5)))
    goto LABEL_31;
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    if ((*((_BYTE *)v4 + 36) & 1) == 0 || self->_timestamp != *((_QWORD *)v4 + 1))
      goto LABEL_31;
  }
  else if ((*((_BYTE *)v4 + 36) & 1) != 0)
  {
LABEL_31:
    v6 = 0;
    goto LABEL_32;
  }
  if ((*(_BYTE *)&self->_has & 0x10) != 0)
  {
    if ((*((_BYTE *)v4 + 36) & 0x10) == 0 || self->_state != *((_DWORD *)v4 + 7))
      goto LABEL_31;
  }
  else if ((*((_BYTE *)v4 + 36) & 0x10) != 0)
  {
    goto LABEL_31;
  }
  if ((*(_BYTE *)&self->_has & 4) != 0)
  {
    if ((*((_BYTE *)v4 + 36) & 4) == 0 || self->_prevState != *((_DWORD *)v4 + 5))
      goto LABEL_31;
  }
  else if ((*((_BYTE *)v4 + 36) & 4) != 0)
  {
    goto LABEL_31;
  }
  if ((*(_BYTE *)&self->_has & 8) != 0)
  {
    if ((*((_BYTE *)v4 + 36) & 8) == 0 || self->_prevStateDurMs != *((_DWORD *)v4 + 6))
      goto LABEL_31;
  }
  else if ((*((_BYTE *)v4 + 36) & 8) != 0)
  {
    goto LABEL_31;
  }
  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
    if ((*((_BYTE *)v4 + 36) & 2) == 0 || self->_cause != *((_DWORD *)v4 + 4))
      goto LABEL_31;
  }
  else if ((*((_BYTE *)v4 + 36) & 2) != 0)
  {
    goto LABEL_31;
  }
  v6 = (*((_BYTE *)v4 + 36) & 0x20) == 0;
  if ((*(_BYTE *)&self->_has & 0x20) != 0)
  {
    if ((*((_BYTE *)v4 + 36) & 0x20) == 0 || self->_subsId != *((_DWORD *)v4 + 8))
      goto LABEL_31;
    v6 = 1;
  }
LABEL_32:

  return v6;
}

- (unint64_t)hash
{
  unint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    v2 = 2654435761u * self->_timestamp;
    if ((*(_BYTE *)&self->_has & 0x10) != 0)
    {
LABEL_3:
      v3 = 2654435761 * self->_state;
      if ((*(_BYTE *)&self->_has & 4) != 0)
        goto LABEL_4;
      goto LABEL_10;
    }
  }
  else
  {
    v2 = 0;
    if ((*(_BYTE *)&self->_has & 0x10) != 0)
      goto LABEL_3;
  }
  v3 = 0;
  if ((*(_BYTE *)&self->_has & 4) != 0)
  {
LABEL_4:
    v4 = 2654435761 * self->_prevState;
    if ((*(_BYTE *)&self->_has & 8) != 0)
      goto LABEL_5;
    goto LABEL_11;
  }
LABEL_10:
  v4 = 0;
  if ((*(_BYTE *)&self->_has & 8) != 0)
  {
LABEL_5:
    v5 = 2654435761 * self->_prevStateDurMs;
    if ((*(_BYTE *)&self->_has & 2) != 0)
      goto LABEL_6;
LABEL_12:
    v6 = 0;
    if ((*(_BYTE *)&self->_has & 0x20) != 0)
      goto LABEL_7;
LABEL_13:
    v7 = 0;
    return v3 ^ v2 ^ v4 ^ v5 ^ v6 ^ v7;
  }
LABEL_11:
  v5 = 0;
  if ((*(_BYTE *)&self->_has & 2) == 0)
    goto LABEL_12;
LABEL_6:
  v6 = 2654435761 * self->_cause;
  if ((*(_BYTE *)&self->_has & 0x20) == 0)
    goto LABEL_13;
LABEL_7:
  v7 = 2654435761 * self->_subsId;
  return v3 ^ v2 ^ v4 ^ v5 ^ v6 ^ v7;
}

- (void)mergeFrom:(id)a3
{
  id v4;
  char v5;

  v4 = a3;
  v5 = *((_BYTE *)v4 + 36);
  if ((v5 & 1) != 0)
  {
    self->_timestamp = *((_QWORD *)v4 + 1);
    *(_BYTE *)&self->_has |= 1u;
    v5 = *((_BYTE *)v4 + 36);
    if ((v5 & 0x10) == 0)
    {
LABEL_3:
      if ((v5 & 4) == 0)
        goto LABEL_4;
      goto LABEL_11;
    }
  }
  else if ((*((_BYTE *)v4 + 36) & 0x10) == 0)
  {
    goto LABEL_3;
  }
  self->_state = *((_DWORD *)v4 + 7);
  *(_BYTE *)&self->_has |= 0x10u;
  v5 = *((_BYTE *)v4 + 36);
  if ((v5 & 4) == 0)
  {
LABEL_4:
    if ((v5 & 8) == 0)
      goto LABEL_5;
    goto LABEL_12;
  }
LABEL_11:
  self->_prevState = *((_DWORD *)v4 + 5);
  *(_BYTE *)&self->_has |= 4u;
  v5 = *((_BYTE *)v4 + 36);
  if ((v5 & 8) == 0)
  {
LABEL_5:
    if ((v5 & 2) == 0)
      goto LABEL_6;
LABEL_13:
    self->_cause = *((_DWORD *)v4 + 4);
    *(_BYTE *)&self->_has |= 2u;
    if ((*((_BYTE *)v4 + 36) & 0x20) == 0)
      goto LABEL_8;
    goto LABEL_7;
  }
LABEL_12:
  self->_prevStateDurMs = *((_DWORD *)v4 + 6);
  *(_BYTE *)&self->_has |= 8u;
  v5 = *((_BYTE *)v4 + 36);
  if ((v5 & 2) != 0)
    goto LABEL_13;
LABEL_6:
  if ((v5 & 0x20) != 0)
  {
LABEL_7:
    self->_subsId = *((_DWORD *)v4 + 8);
    *(_BYTE *)&self->_has |= 0x20u;
  }
LABEL_8:

}

- (unint64_t)timestamp
{
  return self->_timestamp;
}

- (unsigned)prevStateDurMs
{
  return self->_prevStateDurMs;
}

- (unsigned)subsId
{
  return self->_subsId;
}

@end
